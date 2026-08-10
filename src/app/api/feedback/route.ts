import { NextResponse } from "next/server";
import { getSupabase } from "@/lib/supabase";

export const runtime = "nodejs";

// Reader-reported errors and suggested edits, one row per submission in
// `content_feedback`. Public by necessity (the browser posts here), so every
// field is length-capped, the kind is checked against a fixed set, obvious bots
// are dropped, and a per-IP-ish rate limit keeps a single client from flooding
// the table. Reading it back is not exposed here — the table is server-only
// (RLS on, no policy), like events and research_signups.
const BOT = /bot|crawl|spider|slurp|headless|monitor|lighthouse|pagespeed|python-requests|curl\//i;
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const KINDS = new Set(["error", "suggestion", "unclear"]);

function cap(v: unknown, n: number): string | null {
  if (v === null || v === undefined) return null;
  const s = String(v).trim();
  return s ? s.slice(0, n) : null;
}

// Small in-process throttle. Serverless instances are short-lived and not
// shared, so this is a speed bump rather than a guarantee — enough to stop an
// accidental loop or a naive script without adding infrastructure.
const RECENT = new Map<string, number[]>();
const WINDOW_MS = 60_000;
const MAX_PER_WINDOW = 6;

function throttled(key: string): boolean {
  const now = Date.now();
  const hits = (RECENT.get(key) ?? []).filter((t) => now - t < WINDOW_MS);
  hits.push(now);
  RECENT.set(key, hits);
  if (RECENT.size > 5000) RECENT.clear(); // crude bound; correctness doesn't depend on it
  return hits.length > MAX_PER_WINDOW;
}

export async function POST(req: Request) {
  let p: Record<string, unknown>;
  try {
    p = await req.json();
  } catch {
    return NextResponse.json({ ok: false }, { status: 400 });
  }

  const message = cap(p.message, 4000);
  if (!message || message.length < 4) {
    return NextResponse.json({ ok: false, error: "empty" }, { status: 400 });
  }

  const nodeId = cap(p.nodeId, 200);
  if (!nodeId) return NextResponse.json({ ok: false, error: "no-node" }, { status: 400 });

  const kindRaw = cap(p.kind, 32) ?? "error";
  const kind = KINDS.has(kindRaw) ? kindRaw : "error";

  const email = cap(p.email, 320)?.toLowerCase() ?? null;
  if (email && !EMAIL_RE.test(email)) {
    return NextResponse.json({ ok: false, error: "invalid-email" }, { status: 400 });
  }

  const h = req.headers;
  const ua = h.get("user-agent") ?? "";
  if (BOT.test(ua)) return NextResponse.json({ ok: true, skipped: "bot" });

  const ip = (h.get("x-forwarded-for") ?? "").split(",")[0].trim() || "unknown";
  if (throttled(`${ip}|${ua.slice(0, 40)}`)) {
    return NextResponse.json({ ok: false, error: "rate-limited" }, { status: 429 });
  }

  const supabase = getSupabase();
  if (!supabase) return NextResponse.json({ ok: false, error: "no-db" }, { status: 503 });

  const row = {
    node_id: nodeId,
    title: cap(p.title, 300),
    kind,
    message,
    quote: cap(p.quote, 600),
    email,
    depth: cap(p.depth, 32),
    level: cap(p.level, 32),
    path: cap(p.path, 300),
    country: cap(h.get("x-vercel-ip-country"), 8),
    referrer: cap(h.get("referer"), 300),
    ua: cap(ua, 300),
  };

  try {
    const { error } = await supabase.from("content_feedback").insert(row);
    if (error) throw error;
  } catch {
    return NextResponse.json({ ok: false, error: "write-failed" }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}
