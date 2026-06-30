import { createClient, type SupabaseClient } from "@supabase/supabase-js";

// Server-side Supabase client. Returns null when env vars are absent, which is
// the signal for store.ts to fall back to the in-memory seed + cache. Wiring
// real Postgres is just: set the env vars (see .env.example) and run the schema
// in README → Database schema. No other code changes.

let cached: SupabaseClient | null | undefined;

export function getSupabase(): SupabaseClient | null {
  if (cached !== undefined) return cached;

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  // Prefer the service-role key on the server (writes the content cache);
  // fall back to the anon key for read-only deployments.
  const key =
    process.env.SUPABASE_SERVICE_ROLE_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

  cached = url && key ? createClient(url, key, { auth: { persistSession: false } }) : null;
  return cached;
}

export function supabaseEnabled(): boolean {
  return getSupabase() !== null;
}
