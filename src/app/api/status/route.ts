import { NextResponse } from "next/server";
import { getAnthropic, MODEL } from "@/lib/anthropic";
import { generateContent } from "@/lib/generate";
import { getNodeById, getNodes, treeSource } from "@/lib/store";

export const runtime = "nodejs";
export const dynamic = "force-dynamic"; // always read live env, never cache
export const maxDuration = 300; // deep-depth Opus generations can exceed 60s (fluid compute allows 300)

// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function tryCall(client: any, opts: any) {
  try {
    const m = await client.messages.create(opts);
    const text = (m.content ?? [])
      .filter((b: { type: string }) => b.type === "text")
      .map((b: { text: string }) => b.text)
      .join("");
    return { ok: true, text: text.slice(0, 60) };
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  } catch (e: any) {
    return {
      ok: false,
      status: e?.status,
      type: e?.error?.error?.type ?? e?.error?.type ?? e?.name,
      message: String(e?.message ?? e).slice(0, 300),
    };
  }
}

// Diagnostic endpoint. Booleans only for env presence (never the secret).
// Add ?test=1 to run two tiny live Claude calls and report the real error.
export async function GET(req: Request) {
  const anthropic = process.env.ANTHROPIC_API_KEY ?? "";
  const base = {
    anthropicKeyPresent: anthropic.length > 0,
    anthropicKeyLength: anthropic.length,
    anthropicKeyLooksValid: anthropic.startsWith("sk-ant-"),
    model: MODEL,
    supabaseUrlPresent: !!process.env.NEXT_PUBLIC_SUPABASE_URL,
    supabaseKeyPresent: !!(
      process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
    ),
    vercelEnv: process.env.VERCEL_ENV ?? "unknown",
    // Which taxonomy the running instance is actually serving. Env booleans say
    // whether Supabase *could* be reached; this says whether it was — and a
    // reseeded tree that never appears on the site is almost always this
    // reporting "seed", or reporting "supabase" with a stale node count from
    // before the migration. Mathematics is the canary: 72 leaves on the current
    // tree, 43 on the one it replaced.
    tree: await (async () => {
      try {
        const [src, maths] = await Promise.all([treeSource(), getNodes("mathematics")]);
        const leaves = maths.filter((n) => !maths.some((c) => c.parentId === n.id));
        return { source: src, mathematicsNodes: maths.length, mathematicsLeaves: leaves.length };
      } catch (e) {
        return { error: String((e as Error)?.message ?? e).slice(0, 200) };
      }
    })(),
  };

  const params = new URL(req.url).searchParams;

  // ?gen=1 → run the REAL content generator on a known node and report result.
  if (params.get("gen") === "1") {
    const node = await getNodeById("economics/money-and-policy/money-and-banking");
    if (!node) return NextResponse.json({ ...base, gen: { error: "node not found" } });
    try {
      const c = await generateContent(node, {
        nodeId: node.id,
        depth: "medium",
        level: "easy",
        format: "read",
      });
      return NextResponse.json({
        ...base,
        gen: { generated: c.generated, bodyLen: c.body.length, preview: c.body.slice(0, 120) },
      });
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
    } catch (e: any) {
      return NextResponse.json({
        ...base,
        gen: { error: String(e?.message ?? e).slice(0, 400), status: e?.status },
      });
    }
  }

  if (params.get("test") !== "1") {
    return NextResponse.json(base);
  }

  const client = getAnthropic();
  if (!client) return NextResponse.json({ ...base, test: "no client" });

  const msgs = [{ role: "user", content: "Reply with the single word: ok" }];
  const withThinking = await tryCall(client, {
    model: MODEL,
    max_tokens: 16,
    thinking: { type: "adaptive" },
    messages: msgs,
  });
  const plain = await tryCall(client, { model: MODEL, max_tokens: 16, messages: msgs });

  return NextResponse.json({ ...base, test: { withThinking, plain } });
}
