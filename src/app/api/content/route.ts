import { NextResponse } from "next/server";
import type { Depth, Level } from "@/lib/types";
import { type Mode, contentMode, getMode } from "@/lib/modes";
import { getNodeById, getCachedContent, putCachedContent } from "@/lib/store";
import { generateContent, streamContent } from "@/lib/generate";

export const runtime = "nodejs";
// Claude generation (esp. detailed/research depth) can run long — give the
// serverless function headroom. 60s is the Vercel Hobby ceiling; raise on Pro.
export const maxDuration = 60;

// POST { nodeId, depth, level, mode }
//   Cache hit  → JSON { body, generated } — a single indexed lookup, returned
//                immediately without touching the subject tree.
//   Cache miss → the Claude generation streamed as text/markdown so the first
//                words reach the reader in ~1s; the full body is cached once
//                the stream completes. (No key configured → JSON placeholder.)
export async function POST(req: Request) {
  let payload: { nodeId?: string; depth?: Depth; level?: Level; mode?: Mode };
  try {
    payload = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid JSON" }, { status: 400 });
  }

  const { nodeId, depth, level } = payload;
  // Tolerate stale clients that omit or send an unknown mode — default to read.
  const mode: Mode = payload.mode && getMode(payload.mode).id === payload.mode ? payload.mode : "read";
  if (!nodeId || !depth || !level) {
    return NextResponse.json({ error: "Missing nodeId/depth/level" }, { status: 400 });
  }

  // "Listen" reads the article aloud client-side (Web Speech API), so it shares
  // the "read" cache rather than generating a separate body.
  const key = { nodeId, depth, level, format: contentMode(mode) };

  // Cache first — the hot path. Only trust a real (Claude-generated) hit;
  // placeholder rows (from runs without a key) are treated as a miss so they
  // regenerate once a key is set. A hit implies the node exists (the row was
  // written by a validated request), so the tree isn't loaded at all here.
  const cached = await getCachedContent(key);
  if (cached && cached.generated) {
    return NextResponse.json({ body: cached.body, generated: cached.generated });
  }

  const node = await getNodeById(nodeId);
  if (!node) return NextResponse.json({ error: "Unknown node" }, { status: 404 });

  const stream = await streamContent(node, key);
  if (!stream) {
    // No Claude key — structured placeholder so the product loop still works.
    const content = await generateContent(node, key);
    return NextResponse.json({ body: content.body, generated: content.generated });
  }

  const encoder = new TextEncoder();
  const readable = new ReadableStream<Uint8Array>({
    async start(controller) {
      let full = "";
      try {
        for await (const event of stream) {
          if (event.type === "content_block_delta" && event.delta.type === "text_delta") {
            full += event.delta.text;
            controller.enqueue(encoder.encode(event.delta.text));
          }
        }
        const body = full.trim();
        if (body) await putCachedContent({ ...key, body, generated: true }); // never cache empty/placeholder
        controller.close();
      } catch (err) {
        controller.error(err);
      }
    },
  });

  return new Response(readable, {
    headers: {
      "Content-Type": "text/markdown; charset=utf-8",
      "Cache-Control": "no-store",
    },
  });
}
