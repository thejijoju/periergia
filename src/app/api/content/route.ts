import { NextResponse } from "next/server";
import type { Depth, Format, Level } from "@/lib/types";
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
  let payload: { nodeId?: string; depth?: Depth; level?: Level; format?: Format };
  try {
    payload = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }

  const { nodeId, depth, level, format } = payload;
  if (!nodeId || !depth || !level || !format) {
    return NextResponse.json({ error: "Missing nodeId/depth/level/format" }, { status: 400 });
  }

  const node = await getNodeById(nodeId);
  if (!node) return NextResponse.json({ error: "Unknown node" }, { status: 404 });

  // Voice reads the same text aloud client-side (Web Speech API), so it shares
  // the text cache rather than generating a separate body.
  const cacheFormat: Format = format === "voice" ? "text" : format;
  const key = { nodeId, depth, level, format: cacheFormat };

  const cached = await getCachedContent(key);
  if (cached) return NextResponse.json({ body: cached.body, generated: cached.generated });

  const content = await generateContent(node, key);
  await putCachedContent(content);
  return NextResponse.json({ body: content.body, generated: content.generated });
}
