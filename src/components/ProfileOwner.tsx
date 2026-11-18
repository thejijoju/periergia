"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { ProfileView } from "./ProfileView";
import { authClient, useSession } from "@/lib/account";
import type { Profile, ProfileEntry } from "@/lib/accountTypes";

/** "Edit profile" button, shown only to the profile's owner. */
export function OwnerEditButton({ profileId }: { profileId: string }) {
  const session = useSession();
  if (!session || session.user.id !== profileId) return null;
  return (
    <Link
      href="/profile/edit"
      className="shrink-0 rounded-full border border-line px-3.5 py-1.5 font-sans text-[13px] hover:border-ink"
    >
      Edit profile
    </Link>
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
        ownerSlot={<OwnerEditButton profileId={data.profile.id} />}
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
