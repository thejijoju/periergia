import { NextResponse } from "next/server";
import type { Depth, Level } from "@/lib/types";
import { type Mode, contentMode } from "@/lib/modes";
import { getNodeById, getCachedContent, putCachedContent } from "@/lib/store";
import { generateContent } from "@/lib/generate";

export const runtime = "nodejs";
// Claude generation (esp. detailed/research depth) can run long — give the
// serverless function headroom. 60s is the Vercel Hobby ceiling; raise on Pro.
export const maxDuration = 60;

// POST { nodeId, depth, level, format } → { body, generated }
// Cache hit returns instantly; a miss generates with Claude (or a placeholder),
// stores it, and returns. Generate-once per (node, depth, level, format).
export async function POST(req: Request) {
  let payload: { nodeId?: string; depth?: Depth; level?: Level; mode?: Mode };
  try {
    payload = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }

  const { nodeId, depth, level, mode } = payload;
  if (!nodeId || !depth || !level || !mode) {
    return NextResponse.json({ error: "Missing nodeId/depth/level/mode" }, { status: 400 });
  }

  const node = await getNodeById(nodeId);
  if (!node) return NextResponse.json({ error: "Unknown node" }, { status: 404 });

  // "Listen" reads the article aloud client-side (Web Speech API), so it shares
  // the "read" cache rather than generating a separate body.
  const key = { nodeId, depth, level, format: contentMode(mode) };

  // Only trust a real (Claude-generated) cache hit. Placeholder rows (from runs
  // without a key) are treated as a miss so they regenerate once a key is set.
  const cached = await getCachedContent(key);
  if (cached && cached.generated) {
    return NextResponse.json({ body: cached.body, generated: cached.generated });
  }

  const content = await generateContent(node, key);
  if (content.generated) await putCachedContent(content); // never cache placeholders
  return NextResponse.json({ body: content.body, generated: content.generated });
}
