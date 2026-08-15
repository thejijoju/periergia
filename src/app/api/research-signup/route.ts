import { NextResponse } from "next/server";
import { getSupabase } from "@/lib/supabase";

export const runtime = "nodejs";

// Interest capture, shared by two prompts and separated by the `source` field:
// the gated Research tier, and the save-your-progress card on a lecture page. Public (the browser calls it),
// so it's length-capped and drops obvious bots. Stores one row per submission
// in `research_signups`; a matching research_signup analytics event is logged
// separately via /api/track. No auth, no account — just a mailing-interest list.
const BOT = /bot|crawl|spider|slurp|headless|monitor|lighthouse|pagespeed|python-requests|curl\//i;
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

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

  const email = cap(p.email, 320)?.toLowerCase() ?? "";
  if (!EMAIL_RE.test(email)) {
    return NextResponse.json({ ok: false, error: "invalid-email" }, { status: 400 });
  }

  const h = req.headers;
  const ua = h.get("user-agent") ?? "";
  if (BOT.test(ua)) return NextResponse.json({ ok: true, skipped: "bot" });

  const supabase = getSupabase();
  if (!supabase) return NextResponse.json({ ok: false, error: "no-db" }, { status: 503 });

  const row = {
    email,
    node_id: cap(p.nodeId, 200),
    title: cap(p.title, 300),
    path: cap(p.path, 300),
    country: cap(h.get("x-vercel-ip-country"), 8),
    referrer: cap(h.get("referer"), 300),
    ua: cap(ua, 300),
    // "research" (the gated tier) or "progress" (the save-your-progress card).
    source: cap(p.source, 32) ?? "research",
  };

  try {
    // Upsert on email so a repeat signup refreshes rather than duplicates.
    const { error } = await supabase
      .from("research_signups")
      .upsert(row, { onConflict: "email" });
    if (error) throw error;
  } catch {
    return NextResponse.json({ ok: false, error: "write-failed" }, { status: 500 });
  }
  return NextResponse.json({ ok: true });
}
