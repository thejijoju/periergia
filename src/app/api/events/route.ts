import { NextResponse } from "next/server";
import { getSupabase } from "@/lib/supabase";

export const runtime = "nodejs";

// Private analytics view. Open in a browser as
//   /api/events?token=YOUR_ANALYTICS_TOKEN
// (browsers render JSON; a JSON-formatter extension makes it pretty). Gated on
// the ANALYTICS_TOKEN env var so the data isn't public. Returns headline totals,
// per-article and per-country rollups, dwell/depth/level breakdowns, and a tail
// of recent raw events. Add &limit=N (max 5000) to widen the window.

interface EventRow {
  ts: string;
  name: string;
  title: string | null;
  path: string | null;
  depth: string | null;
  level: string | null;
  seconds: number | null;
  dwell: string | null;
  country: string | null;
  city: string | null;
  referrer: string | null;
}

function tally(rows: EventRow[], key: (r: EventRow) => string | null) {
  const m = new Map<string, number>();
  for (const r of rows) {
    const k = key(r);
    if (!k) continue;
    m.set(k, (m.get(k) ?? 0) + 1);
  }
  return Object.fromEntries([...m.entries()].sort((a, b) => b[1] - a[1]));
}

export async function GET(req: Request) {
  const token = process.env.ANALYTICS_TOKEN?.trim();
  const url = new URL(req.url);
  if (!token) {
    return NextResponse.json(
      {
        error:
          "ANALYTICS_TOKEN is not set on this deployment. Add it in Vercel → Settings → " +
          "Environment Variables (Production), then redeploy so the change takes effect.",
      },
      { status: 503 },
    );
  }
  if ((url.searchParams.get("token") ?? "").trim() !== token) {
    return NextResponse.json(
      { error: "Unauthorized — the ?token= value does not match ANALYTICS_TOKEN." },
      { status: 401 },
    );
  }

  const supabase = getSupabase();
  if (!supabase) return NextResponse.json({ error: "database not configured" }, { status: 503 });

  const window = Math.min(5000, Math.max(1, Number(url.searchParams.get("limit")) || 2000));
  const { data, error } = await supabase
    .from("events")
    .select("ts,name,title,path,depth,level,seconds,dwell,country,city,referrer")
    .order("ts", { ascending: false })
    .limit(window);

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  const rows = (data ?? []) as EventRow[];

  // Per-article rollup: number of reads and average dwell (seconds).
  const perArticle = new Map<string, { reads: number; totalSeconds: number }>();
  for (const r of rows) {
    const t = r.title ?? r.path ?? "(unknown)";
    const a = perArticle.get(t) ?? { reads: 0, totalSeconds: 0 };
    a.reads += 1;
    a.totalSeconds += r.seconds ?? 0;
    perArticle.set(t, a);
  }
  const articles = [...perArticle.entries()]
    .map(([title, a]) => ({
      title,
      reads: a.reads,
      avgSeconds: a.reads ? Math.round(a.totalSeconds / a.reads) : 0,
    }))
    .sort((a, b) => b.reads - a.reads);

  const withSeconds = rows.map((r) => r.seconds ?? 0).filter((s) => s > 0);
  const avgSeconds = withSeconds.length
    ? Math.round(withSeconds.reduce((x, y) => x + y, 0) / withSeconds.length)
    : 0;
  const sorted = [...withSeconds].sort((a, b) => a - b);
  const medianSeconds = sorted.length ? sorted[Math.floor(sorted.length / 2)] : 0;

  return NextResponse.json(
    {
      generatedAt: new Date().toISOString(),
      window: { events: rows.length, newest: rows[0]?.ts ?? null, oldest: rows.at(-1)?.ts ?? null },
      totals: {
        reads: rows.length,
        avgSeconds,
        medianSeconds,
        articles: articles.length,
      },
      byArticle: articles,
      byCountry: tally(rows, (r) => r.country),
      byCity: tally(rows, (r) => (r.city && r.country ? `${r.city}, ${r.country}` : r.city)),
      byDwellBucket: tally(rows, (r) => r.dwell),
      byDepth: tally(rows, (r) => r.depth),
      byLevel: tally(rows, (r) => r.level),
      byReferrer: tally(rows, (r) => r.referrer),
      recent: rows.slice(0, 100),
    },
    { headers: { "cache-control": "no-store" } },
  );
}
