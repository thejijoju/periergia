"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { authClient, mergeProgress, ownProfilePath } from "@/lib/account";
import { mergeLocalProgress, readLocalProgress } from "@/lib/progress";

// The sign-in link lands here with ?code=… (PKCE). Exchange it for a session,
// merge this browser's saved progress with the account's, then go to the
// reader's profile (or the editor, the first time).
export default function AuthCallback() {
  const router = useRouter();
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      const sb = authClient();
      if (!sb) return setError("Accounts are not switched on for this site.");
      const params = new URLSearchParams(window.location.search);
      const err = params.get("error_description");
      if (err) return setError(err);
      const code = params.get("code");
      if (code) {
        const { error } = await sb.auth.exchangeCodeForSession(code);
        if (error) {
          return setError(
            "This sign-in link has expired or was opened in a different browser. Request a new one.",
          );
        }
      }
      try {
        const remote = await mergeProgress(readLocalProgress());
        if (remote) mergeLocalProgress(remote);
      } catch {
        /* progress merge is best-effort */
      }
      router.replace(await ownProfilePath());
    })();
  }, [router]);

  return (
    <main className="min-h-screen bg-page text-ink flex items-center justify-center px-4">
      {error ? (
        <div className="max-w-sm text-center font-sans text-[14px]">
          <p>{error}</p>
          <a href="/signin" className="mt-4 inline-block underline">
            Back to sign in
          </a>
        </div>
      ) : (
        <p className="font-sans text-[14px] text-muted">Signing you in…</p>
      )}
    </main>
  );
}
