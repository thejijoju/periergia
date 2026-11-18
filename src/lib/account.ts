"use client";

import { createClient, type Session, type SupabaseClient } from "@supabase/supabase-js";
import { useEffect, useState } from "react";

// ── Accounts (browser side) ───────────────────────────────────────────────
// Supabase Auth with an email sign-in link. The session lives in the
// browser (localStorage), so account UI is client-side everywhere: article
// pages are cached per language and must not depend on who is reading.
// Rows are written with the anon key + the reader's session; the RLS policies
// in supabase/accounts.sql decide what each person may read and write.

const URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const ANON = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

/** False when the deployment has no Supabase keys: account UI hides itself. */
export const accountsEnabled = Boolean(URL && ANON);

let client: SupabaseClient | null = null;

export function authClient(): SupabaseClient | null {
  if (!accountsEnabled || typeof window === "undefined") return null;
  if (!client) {
    client = createClient(URL!, ANON!, {
      auth: { flowType: "pkce", persistSession: true, autoRefreshToken: true, detectSessionInUrl: false },
    });
  }
  return client;
}

/** The current session, kept up to date. `undefined` until it has been read. */
export function useSession(): Session | null | undefined {
  const [session, setSession] = useState<Session | null | undefined>(undefined);
  useEffect(() => {
    const sb = authClient();
    if (!sb) {
      setSession(null);
      return;
    }
    sb.auth.getSession().then(({ data }) => setSession(data.session));
    const { data } = sb.auth.onAuthStateChange((_e, s) => setSession(s));
    return () => data.subscription.unsubscribe();
  }, []);
  return session;
}

// ── Progress sync ─────────────────────────────────────────────────────────
// localStorage stays the source the reader uses; a signed-in reader's
// progress is also written to user_progress so it follows them across
// devices and can appear on their profile.

async function currentUserId(sb: SupabaseClient): Promise<string | null> {
  const { data } = await sb.auth.getSession();
  return data.session?.user.id ?? null;
}

/** Record one article opened (and, if `completed`, its checkpoint passed). */
export async function syncProgress(nodeId: string, completed: boolean): Promise<void> {
  const sb = authClient();
  if (!sb) return;
  try {
    const uid = await currentUserId(sb);
    if (!uid) return;
    await sb.from("user_progress").upsert({ user_id: uid, node_id: nodeId }, { ignoreDuplicates: true });
    if (completed) {
      await sb
        .from("user_progress")
        .update({ completed_at: new Date().toISOString() })
        .eq("user_id", uid)
        .eq("node_id", nodeId)
        .is("completed_at", null);
    }
  } catch {
    /* offline or not migrated yet — local progress is unaffected */
  }
}

/**
 * After sign-in: push everything saved in this browser to the account, and
 * return what the account already holds from other devices.
 */
export async function mergeProgress(local: {
  visited: string[];
  completed: string[];
}): Promise<{ visited: string[]; completed: string[] } | null> {
  const sb = authClient();
  if (!sb) return null;
  const uid = await currentUserId(sb);
  if (!uid) return null;
  const all = Array.from(new Set([...local.visited, ...local.completed]));
  if (all.length) {
    await sb
      .from("user_progress")
      .upsert(all.map((node_id) => ({ user_id: uid, node_id })), { ignoreDuplicates: true });
  }
  if (local.completed.length) {
    await sb
      .from("user_progress")
      .update({ completed_at: new Date().toISOString() })
      .eq("user_id", uid)
      .in("node_id", local.completed)
      .is("completed_at", null);
  }
  const { data } = await sb.from("user_progress").select("node_id, completed_at").eq("user_id", uid);
  if (!data) return null;
  return {
    visited: data.map((r) => r.node_id as string),
    completed: data.filter((r) => r.completed_at).map((r) => r.node_id as string),
  };
}

/** Where a signed-in reader's own page is: their profile, or the editor if none yet. */
export async function ownProfilePath(): Promise<string> {
  const sb = authClient();
  if (!sb) return "/";
  const uid = await currentUserId(sb);
  if (!uid) return "/signin";
  const { data } = await sb.from("profiles").select("handle").eq("id", uid).maybeSingle();
  return data?.handle ? `/u/${data.handle}` : "/profile/edit";
}
