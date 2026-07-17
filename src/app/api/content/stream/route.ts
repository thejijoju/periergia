import type { Depth, Level } from "@/lib/types";
import { type Mode, contentMode, getMode } from "@/lib/modes";
import { normalizeLang } from "@/lib/i18n";
import { after } from "next/server";
import { getNodeById, getCachedContent, putCachedContent } from "@/lib/store";
import { generateContent } from "@/lib/generate";
import { getAnthropic } from "@/lib/anthropic";

export const runtime = "nodejs";
// Generation can run well past 60s; fluid compute allows up to 300s even on Hobby.
export const maxDuration = 300;

// Streaming sibling of /api/content. Same payload, but instead of buffering the
// whole ~3,500-word article and returning it as JSON after 20–50s, it streams
// the model's text to the reader as it's written — the article visibly composes
// itself. A cache hit returns the stored body instantly; the finished, image-
// resolved body is cached at the end (even if the reader navigated away, so the
// warming still happens). Metadata rides in headers: X-Generated / X-Reviewed.
function headers(generated: boolean, reviewed: boolean): HeadersInit {
  return {
    "content-type": "text/plain; charset=utf-8",
    "x-generated": generated ? "1" : "0",
    "x-reviewed": reviewed ? "1" : "0",
    "cache-control": "no-store",
  };
}

export async function POST(req: Request) {
  let payload: {
    nodeId?: string;
    depth?: Depth;
    level?: Level;
    mode?: Mode;
    lang?: string;
    refresh?: boolean;
  };
  try {
    payload = await req.json();
  } catch {
    return new Response("Invalid JSON", { status: 400 });
  }

  const { nodeId, depth, level } = payload;
  const mode: Mode = payload.mode && getMode(payload.mode).id === payload.mode ? payload.mode : "read";
  if (!nodeId || !depth || !level) {
    return new Response("Missing nodeId/depth/level", { status: 400 });
  }

  const node = await getNodeById(nodeId);
  if (!node) return new Response("Unknown node", { status: 404 });

  const key = { nodeId, depth, level, format: contentMode(mode), lang: normalizeLang(payload.lang) };

  // Cache hit → serve the stored article immediately (reviewed flag in a header).
  if (!payload.refresh) {
    const cached = await getCachedContent(key);
    if (cached && cached.generated) {
      return new Response(cached.body, { headers: headers(true, cached.reviewed) });
    }
  }

  // No model configured → placeholder, flagged not-generated (reader shows the
  // "set ANTHROPIC_API_KEY" notice). Kept off the streaming path so the header
  // is accurate.
  if (!getAnthropic()) {
    const content = await generateContent(node, key);
    return new Response(content.body, { headers: headers(false, false) });
  }

  const encoder = new TextEncoder();
  let streamed = "";
  // Resolves when generation + caching finish. We hand this to `after()` so the
  // function stays alive to completion EVEN IF THE READER BOUNCES mid-stream —
  // their abandoned request finishes generating and caches, warming the page for
  // the next visitor instead of being thrown away.
  let settle: () => void;
  const done = new Promise<void>((r) => (settle = r));

  const readable = new ReadableStream({
    async start(controller) {
      const enqueue = (text: string) => {
        try {
          controller.enqueue(encoder.encode(text));
        } catch {
          // Reader disconnected — keep going so the finished article still caches.
        }
      };
      try {
        const content = await generateContent(node, key, (delta) => {
          streamed += delta;
          enqueue(delta);
        });
        if (content.generated) {
          await putCachedContent(content); // warm the cache for the next visitor
        }
        // Paths that don't stream token-by-token (a cached master served
        // verbatim, a translation, an alternate mode) deliver the whole body now.
        if (!streamed && content.body) enqueue(content.body);
      } catch (e) {
        console.error(`stream generation failed for ${nodeId}:`, (e as Error)?.message ?? e);
      } finally {
        try {
          controller.close();
        } catch {
          /* already closed by a client disconnect */
        }
        settle();
      }
    },
  });

  after(done);
  return new Response(readable, { headers: headers(true, false) });
}
