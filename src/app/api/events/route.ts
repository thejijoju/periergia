import { NextResponse } from "next/server";
import { getSupabase } from "@/lib/supabase";

export const runtime = "nodejs";

// Private analytics view. Open in a browser as
//   /api/events?token=YOUR_ANALYTICS_TOKEN
// and it renders a readable dashboard; scripts get JSON (Accept header, or
// force with &format=json). Gated on the ANALYTICS_TOKEN env var so the data
// isn't public. Add &limit=N (max 5000) to widen the window.

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

function summarize(rows: EventRow[]) {
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

  const byCountry = tally(rows, (r) => r.country);
  const byCity = tally(rows, (r) => (r.city && r.country ? `${r.city}, ${r.country}` : r.city));

  return {
    generatedAt: new Date().toISOString(),
    window: { events: rows.length, newest: rows[0]?.ts ?? null, oldest: rows.at(-1)?.ts ?? null },
    totals: {
      reads: rows.length,
      avgSeconds,
      medianSeconds,
      articles: articles.length,
      countries: Object.keys(byCountry).length,
      locations: Object.keys(byCity).length,
    },
    byArticle: articles,
    byCountry,
    byCity,
    byDwellBucket: tally(rows, (r) => r.dwell),
    byDepth: tally(rows, (r) => r.depth),
    byLevel: tally(rows, (r) => r.level),
    byReferrer: tally(rows, (r) => r.referrer),
    recent: rows.slice(0, 100),
  };
}

// ---- HTML dashboard ------------------------------------------------------

function esc(v: unknown): string {
  return String(v ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function fmtDur(seconds: number): string {
  if (!seconds) return "—";
  if (seconds < 60) return `${seconds}s`;
  const m = Math.floor(seconds / 60);
  const s = seconds % 60;
  return s ? `${m}m ${s}s` : `${m}m`;
}

function fmtWhen(ts: string | null): string {
  if (!ts) return "—";
  return esc(ts.replace("T", " ").replace(/\.\d+Z$/, " UTC").replace("Z", " UTC"));
}

function rankTable(title: string, obj: Record<string, number>, limit = 12): string {
  const entries = Object.entries(obj).slice(0, limit);
  if (!entries.length) return "";
  const max = entries[0][1] || 1;
  const rows = entries
    .map(
      ([k, n]) => `<tr><td class="k">${esc(k)}</td><td class="n">${n}</td>
      <td class="bar"><span style="width:${Math.round((n / max) * 100)}%"></span></td></tr>`,
    )
    .join("");
  return `<section class="card"><h2>${esc(title)}</h2><table>${rows}</table></section>`;
}

function renderHtml(s: ReturnType<typeof summarize>): string {
  const t = s.totals;
  const tiles = [
    { label: "Reads", value: String(t.reads) },
    { label: "Articles", value: String(t.articles) },
    { label: "Avg dwell", value: fmtDur(t.avgSeconds) },
    { label: "Median dwell", value: fmtDur(t.medianSeconds) },
    { label: "Countries", value: String(t.countries) },
    { label: "Locations", value: String(t.locations) },
  ]
    .map(
      (x) => `<div class="tile"><div class="v">${esc(x.value)}</div><div class="l">${esc(x.label)}</div></div>`,
    )
    .join("");

  const articleRows = s.byArticle
    .slice(0, 25)
    .map(
      (a) =>
        `<tr><td class="k">${esc(a.title)}</td><td class="n">${a.reads}</td><td class="n">${fmtDur(a.avgSeconds)}</td></tr>`,
    )
    .join("");
  const articlesCard = articleRows
    ? `<section class="card wide"><h2>Top articles</h2><table><thead><tr><th>Article</th><th>Reads</th><th>Avg dwell</th></tr></thead>${articleRows}</table></section>`
    : `<section class="card wide"><h2>Top articles</h2><p class="empty">No reads recorded yet.</p></section>`;

  const recentRows = s.recent
    .slice(0, 40)
    .map(
      (r) =>
        `<tr><td>${fmtWhen(r.ts)}</td><td class="k">${esc(r.title ?? r.path ?? "—")}</td><td>${fmtDur(r.seconds ?? 0)}</td><td>${esc(r.city && r.country ? `${r.city}, ${r.country}` : r.country ?? "—")}</td></tr>`,
    )
    .join("");
  const recentCard = recentRows
    ? `<section class="card wide"><h2>Recent reads</h2><table><thead><tr><th>When</th><th>Article</th><th>Dwell</th><th>Location</th></tr></thead>${recentRows}</table></section>`
    : "";

  const range = `${fmtWhen(s.window.oldest)} → ${fmtWhen(s.window.newest)}`;

  return `<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex, nofollow">
<title>periergia · analytics</title>
<style>
  :root{color-scheme:light dark;--bg:#faf7f2;--card:#fff;--ink:#211d18;--muted:#8a817a;--line:#eae4db;--accent:#6d28d9;--bar:#e7ddfb}
  @media(prefers-color-scheme:dark){:root{--bg:#16130f;--card:#201c17;--ink:#f2ede4;--muted:#a59a8a;--line:#2c2620;--accent:#b9a3f8;--bar:#332a4d}}
  *{box-sizing:border-box}
  body{margin:0;background:var(--bg);color:var(--ink);font:15px/1.5 ui-sans-serif,system-ui,-apple-system,Segoe UI,Roboto,sans-serif;padding:24px}
  .wrap{max-width:920px;margin:0 auto}
  header{display:flex;flex-wrap:wrap;align-items:baseline;gap:8px 14px;margin-bottom:20px}
  h1{font-size:19px;margin:0;font-weight:700;letter-spacing:-.01em}
  .meta{color:var(--muted);font-size:12.5px}
  .tiles{display:grid;grid-template-columns:repeat(auto-fit,minmax(120px,1fr));gap:10px;margin-bottom:18px}
  .tile{background:var(--card);border:1px solid var(--line);border-radius:12px;padding:14px 16px}
  .tile .v{font-size:26px;font-weight:700;letter-spacing:-.02em}
  .tile .l{color:var(--muted);font-size:12px;margin-top:2px;text-transform:uppercase;letter-spacing:.06em}
  .grid{display:grid;grid-template-columns:1fr 1fr;gap:14px}
  .card{background:var(--card);border:1px solid var(--line);border-radius:14px;padding:16px 18px;overflow-x:auto}
  .card.wide{grid-column:1/-1}
  h2{font-size:13px;text-transform:uppercase;letter-spacing:.07em;color:var(--muted);margin:0 0 10px}
  table{width:100%;border-collapse:collapse;font-size:13.5px}
  th{text-align:left;color:var(--muted);font-weight:600;font-size:11.5px;text-transform:uppercase;letter-spacing:.05em;padding:0 8px 6px 0}
  td{padding:5px 8px 5px 0;border-top:1px solid var(--line);vertical-align:middle}
  td.k{max-width:340px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
  td.n{text-align:right;font-variant-numeric:tabular-nums;width:1%;white-space:nowrap;color:var(--muted)}
  td.bar{width:90px}
  td.bar span{display:block;height:8px;border-radius:5px;background:var(--accent);min-width:3px}
  .card table td.bar span{background:var(--accent)}
  .empty{color:var(--muted);font-size:13px}
  footer{color:var(--muted);font-size:12px;margin-top:22px;line-height:1.7}
  @media(max-width:640px){.grid{grid-template-columns:1fr}}
</style></head><body><div class="wrap">
<header><h1>periergia · analytics</h1>
<span class="meta">${s.window.events} events · ${range}</span></header>
<div class="tiles">${tiles}</div>
${articlesCard}
<div class="grid">
${rankTable("Countries", s.byCountry)}
${rankTable("Cities", s.byCity)}
${rankTable("Dwell time", s.byDwellBucket)}
${rankTable("Referrers", s.byReferrer)}
${rankTable("Depth", s.byDepth)}
${rankTable("Level", s.byLevel)}
</div>
${recentCard}
<footer>Self-hosted engagement data — article reads and dwell time, bots filtered. "Reads" counts article views, not unique people; for unique-visitor counts see the Vercel Web Analytics dashboard. Add <code>&amp;limit=5000</code> to widen the window, or <code>&amp;format=json</code> for raw JSON.</footer>
</div></body></html>`;
}

// ---- Handler -------------------------------------------------------------

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
  const summary = summarize(rows);

  // Browsers get the dashboard; scripts get JSON. Force either with &format=.
  const format = url.searchParams.get("format");
  const wantsHtml =
    format === "html" ||
    (format !== "json" && (req.headers.get("accept") ?? "").includes("text/html"));

  if (wantsHtml) {
    return new NextResponse(renderHtml(summary), {
      headers: { "content-type": "text/html; charset=utf-8", "cache-control": "no-store" },
    });
  }

  return NextResponse.json(summary, { headers: { "cache-control": "no-store" } });
}
