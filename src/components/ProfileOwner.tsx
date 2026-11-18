"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { ProfileView } from "./ProfileView";
import { authClient, useSession } from "@/lib/account";
import type { Profile, ProfileEntry } from "@/lib/accountTypes";

const btn = "text-center rounded-full px-4 py-2 font-sans text-[13.5px] transition-colors";

/** Owner: "Edit profile". Others: Follow / Following (sign-in first if needed). */
export function ProfileActions({ profileId }: { profileId: string }) {
  const session = useSession();
  const router = useRouter();
  const [following, setFollowing] = useState<boolean | null>(null);
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    if (!session || session.user.id === profileId) return;
    authClient()!
      .from("follows")
      .select("followee_id")
      .eq("follower_id", session.user.id)
      .eq("followee_id", profileId)
      .maybeSingle()
      .then(({ data }) => setFollowing(Boolean(data)));
  }, [session, profileId]);

  if (session === undefined) return null;
  if (session && session.user.id === profileId) {
    return (
      <Link href="/profile/edit" className={`${btn} border border-line hover:border-ink`}>
        Edit profile
      </Link>
    );
  }
  if (!session) {
    return (
      <Link href="/signin" className={`${btn} bg-ink text-page`}>
        Follow
      </Link>
    );
  }
  const toggle = async () => {
    const sb = authClient()!;
    setBusy(true);
    const { error } = following
      ? await sb.from("follows").delete().eq("follower_id", session.user.id).eq("followee_id", profileId)
      : await sb.from("follows").insert({ follower_id: session.user.id, followee_id: profileId });
    setBusy(false);
    if (error) {
      // No profile of their own yet: following needs one.
      if (error.code === "23503") router.push("/profile/edit");
      return;
    }
    setFollowing(!following);
    router.refresh();
  };
  return (
    <button
      onClick={toggle}
      disabled={busy || following === null}
      className={`${btn} ${following ? "border border-line hover:border-ink" : "bg-ink text-page"} disabled:opacity-60`}
    >
      {following ? "Following" : "Follow"}
    </button>
  );
}

/**
 * The server could not show this handle (missing, or private). If the
 * signed-in reader owns it, load it with their session and show it.
 */
export function PrivateProfileFallback({ handle }: { handle: string }) {
  const session = useSession();
  const [data, setData] = useState<{ profile: Profile; entries: ProfileEntry[]; read: number; passed: number } | null>(null);
  const [checked, setChecked] = useState(false);

  useEffect(() => {
    if (session === undefined) return;
    if (!session) return setChecked(true);
    const sb = authClient()!;
    (async () => {
      const { data: prof } = await sb.from("profiles").select("*").eq("handle", handle).maybeSingle();
      if (prof && prof.id === session.user.id) {
        const [{ data: ents }, { data: prog }] = await Promise.all([
          sb.from("profile_entries").select("*").eq("user_id", prof.id).order("position"),
          sb.from("user_progress").select("completed_at").eq("user_id", prof.id),
        ]);
        setData({
          profile: prof as Profile,
          entries: (ents as ProfileEntry[]) ?? [],
          read: prog?.length ?? 0,
          passed: prog?.filter((r) => r.completed_at).length ?? 0,
        });
      }
      setChecked(true);
    })();
  }, [session, handle]);

  if (data) {
    return (
      <ProfileView
        profile={data.profile}
        entries={data.entries}
        progress={null}
        counts={data.profile.show_progress ? { read: data.read, passed: data.passed } : null}
        actionSlot={<ProfileActions profileId={data.profile.id} />}
      />
    );
  }
  if (!checked) return <p className="font-sans text-[14px] text-muted">Loading…</p>;
  return (
    <div className="text-center font-sans text-[14px]">
      <h1 className="font-serif text-[26px]">Profile not found</h1>
      <p className="mt-2 text-muted">There is no public profile at this address.</p>
    </div>
  );
}
