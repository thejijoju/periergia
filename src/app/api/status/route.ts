import { NextResponse } from "next/server";

export const runtime = "nodejs";
export const dynamic = "force-dynamic"; // always read live env, never cache

// Diagnostic endpoint: reports whether the deployment can see its keys.
// Returns booleans/lengths only — never the secret values themselves.
export async function GET() {
  const anthropic = process.env.ANTHROPIC_API_KEY ?? "";
  return NextResponse.json({
    anthropicKeyPresent: anthropic.length > 0,
    anthropicKeyLength: anthropic.length,
    anthropicKeyLooksValid: anthropic.startsWith("sk-ant-"),
    model: process.env.PERIERGIA_MODEL || "claude-opus-4-8",
    supabaseUrlPresent: !!process.env.NEXT_PUBLIC_SUPABASE_URL,
    supabaseKeyPresent: !!(
      process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
    ),
    vercelEnv: process.env.VERCEL_ENV ?? "unknown",
  });
}
