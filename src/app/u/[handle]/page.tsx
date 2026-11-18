import type { Metadata } from "next";
import { createClient } from "@supabase/supabase-js";
import { Wordmark } from "@/components/Wordmark";
import { AccountButton } from "@/components/AccountButton";
import { ThemeToggle } from "@/components/ThemeToggle";
import { ProfileView, type Activity, type ProgressGroup } from "@/components/ProfileView";
import { ProfileActions, PrivateProfileFallback } from "@/components/ProfileOwner";
import { accountTypeLabel, type Profile, type ProfileEntry } from "@/lib/accountTypes";
import { getNodeById, getSubjects } from "@/lib/store";

// Public profile: /u/<handle>. Rendered on each request with the ANON key —
// never the service role — so row-level security decides what is visible:
// public profiles only, and progress only when the owner chose to show it.
export const dynamic = "force-dynamic";

function anon() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  return url && key ? createClient(url, key, { auth: { persistSession: false } }) : null;
}

async function load(handle: string) {
  const sb = anon();
  if (!sb || !/^[a-z0-9][a-z0-9-]{2,29}$/.test(handle)) return null;
  const { data: profile } = await sb.from("profiles").select("*").eq("handle", handle).maybeSingle();
  if (!profile) return null;
  const { data: entries } = await sb.from("profile_entries").select("*").eq("user_id", profile.id).order("position");
  const countOf = async (col: "followee_id" | "follower_id") =>
    (await sb.from("follows").select("*", { count: "exact", head: true }).eq(col, profile.id)).count ?? 0;
  const [followers, following] = await Promise.all([countOf("followee_id"), countOf("follower_id")]);
  const stats = { followers, following, publications: 0 }; // papers arrive with stage 3
  const activity: Activity[] = [];
  let progress: ProgressGroup[] | null = null;
  let counts: { read: number; passed: number } | null = null;
  if (profile.show_progress) {
    const { data: rows } = await sb
      .from("user_progress")
      .select("node_id, visited_at, completed_at")
      .eq("user_id", profile.id)
      .order("visited_at", { ascending: false })
      .limit(1000);
    const subjects = new Map((await getSubjects()).map((s) => [s.id, s]));
    const groups = new Map<string, ProgressGroup>();
    let read = 0;
    let passed = 0;
    for (const r of rows ?? []) {
      const node = await getNodeById(r.node_id);
      if (!node) continue; // a lesson that no longer exists
      read++;
      if (r.completed_at) passed++;
      const subject = subjects.get(node.subjectId)?.name ?? node.subjectSlug;
      if (!groups.has(subject)) groups.set(subject, { subject, items: [] });
      if (activity.length < 5) {
        const when = (r.completed_at as string | null) ?? (r.visited_at as string);
        activity.push({
          title: node.title,
          href: `/learn/${node.id}`,
          completed: Boolean(r.completed_at),
          when: new Date(when).toLocaleDateString("en-GB", { day: "numeric", month: "short", year: "numeric" }),
        });
      }
      groups.get(subject)!.items.push({
        id: node.id,
        title: node.title,
        href: `/learn/${node.id}`,
        completed: Boolean(r.completed_at),
      });
    }
    progress = Array.from(groups.values());
    counts = { read, passed };
  }
  return { profile: profile as Profile & { created_at: string }, entries: (entries as ProfileEntry[]) ?? [], progress, counts, stats, activity };
}

export async function generateMetadata({ params }: { params: Promise<{ handle: string }> }): Promise<Metadata> {
  const { handle } = await params;
  const data = await load(handle);
  if (!data) return { title: "Profile", robots: { index: false } };
  const p = data.profile;
  return {
    title: `${p.display_name} — ${accountTypeLabel(p.account_type)}`,
    description: p.headline ?? undefined,
    // Profiles are not indexed by search engines for now: people should
    // choose to be findable, and there is no setting for that yet.
    robots: { index: false, follow: false },
  };
}

export default async function ProfilePage({ params }: { params: Promise<{ handle: string }> }) {
  const { handle } = await params;
  const data = await load(handle);
  return (
    <main className="min-h-screen bg-page text-ink px-4 py-6">
      <div className="mx-auto max-w-5xl">
        <div className="flex items-center gap-2">
          <Wordmark size="sm" underline={false} />
          <div className="ml-auto flex items-center gap-1">
            <ThemeToggle />
            <AccountButton />
          </div>
        </div>
        <div className="mt-10">
          {data ? (
            <ProfileView
              profile={data.profile}
              entries={data.entries}
              progress={data.progress}
              counts={data.counts}
              stats={data.stats}
              activity={data.activity}
              memberSince={new Date(data.profile.created_at).toLocaleDateString("en-GB", {
                month: "long",
                year: "numeric",
              })}
              actionSlot={<ProfileActions profileId={data.profile.id} />}
            />
          ) : (
            <PrivateProfileFallback handle={handle} />
          )}
        </div>
      </div>
    </main>
  );
}
