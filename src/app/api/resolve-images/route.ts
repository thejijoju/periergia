import { NextResponse } from "next/server";
import { resolveImageMarkers } from "@/lib/images";

export const runtime = "nodejs";
export const maxDuration = 60;

// POST { body, topicTitle? } → { body }
// Runs ONLY the real-Wikipedia image resolution step (no Claude call, no
// cache write) — for splicing verified images into hand-written/co-authored
// markdown that never went through generateContent, so it never needs a
// human to hand-type (and potentially hallucinate) an image URL.
export async function POST(req: Request) {
  let payload: { body?: string; topicTitle?: string };
  try {
    payload = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }
  if (!payload.body) {
    return NextResponse.json({ error: "Missing body" }, { status: 400 });
  }
  const resolved = await resolveImageMarkers(payload.body, payload.topicTitle);
  return NextResponse.json({ body: resolved });
}
