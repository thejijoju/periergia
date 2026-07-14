import { NextResponse } from "next/server";
import { getSupabase } from "@/lib/supabase";

export const runtime = "nodejs";

// Engagement ingest. The Reader beacons an event here when a reader leaves an
// article; we enrich it with the visitor's coarse location (Vercel geo headers),
// referrer, and user-agent, then store it in our own `events` table. Public by
// necessity (the browser calls it), so everything is length-capped and we drop
// obvious bots. Reading the data back is the separate, token-gated /api/events.
const BOT = /bot|crawl|spider|slurp|bingpreview|facebookexternalhit|embedly|quora|pinterest|slackbot|telegrambot|whatsapp|discordbot|preview|monitor|headless|lighthouse|pagespeed/i;

function cap(v: unknown, n: number): string | null {
  if (v === null || v === undefined) return null;
  const s = String(v).trim();
  return s ? s.slice(0, n) : null;
}

export async function POST(req: Request) {
  let p: Record<string, unknown>;
  try {
    p = await req.json();
  } catch {
    return NextResponse.json({ ok: false }, { status: 400 });
  }

  const h = req.headers;
  const ua = h.get("user-agent") ?? "";
  if (BOT.test(ua)) return NextResponse.json({ ok: true, skipped: "bot" });

  const supabase = getSupabase();
  if (!supabase) return NextResponse.json({ ok: true, skipped: "no-db" });

  const rawSeconds = Number(p.seconds);
  const seconds = Number.isFinite(rawSeconds)
    ? Math.max(0, Math.min(86_400, Math.round(rawSeconds)))
    : null;

  const row = {
    name: cap(p.name, 64) ?? "article_read",
    node_id: cap(p.nodeId, 200),
    title: cap(p.title, 300),
    path: cap(p.path, 300),
    depth: cap(p.depth, 32),
    level: cap(p.level, 32),
    seconds,
    dwell: cap(p.dwell, 32),
    country: cap(h.get("x-vercel-ip-country"), 8),
    city: cap(decodeURIComponent(h.get("x-vercel-ip-city") ?? ""), 120),
    referrer: cap(p.referrer ?? h.get("referer"), 300),
    ua: cap(ua, 300),
  };

  try {
    await supabase.from("events").insert(row);
  } catch {
    // Analytics must never break the read path; swallow write errors.
  }
  return NextResponse.json({ ok: true });
}
