"use client";

import { useState } from "react";
import { Wordmark } from "@/components/Wordmark";
import { accountsEnabled, authClient } from "@/lib/account";

export default function SignInPage() {
  const [email, setEmail] = useState("");
  const [state, setState] = useState<"idle" | "sending" | "sent" | "error">("idle");
  const [message, setMessage] = useState("");

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    const sb = authClient();
    if (!sb || state === "sending" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return;
    setState("sending");
    const { error } = await sb.auth.signInWithOtp({
      email: email.trim(),
      options: { emailRedirectTo: `${window.location.origin}/auth/callback` },
    });
    if (error) {
      setMessage(error.message);
      setState("error");
    } else {
      setState("sent");
    }
  };

  return (
    <main className="min-h-screen bg-page text-ink flex flex-col items-center px-4 py-10">
      <Wordmark size="sm" underline={false} />
      <div className="mt-12 w-full max-w-sm">
        <h1 className="font-serif text-[28px] leading-tight">Sign in or create an account</h1>
        <p className="mt-2 font-sans text-[14px] leading-relaxed text-muted">
          Keep your progress across devices and build a profile page: your background, what you
          study or teach, and what you have learned here. No password — we email you a link.
        </p>
        {!accountsEnabled ? (
          <p className="mt-6 font-sans text-[14px] text-muted">Accounts are not switched on for this site yet.</p>
        ) : state === "sent" ? (
          <div className="mt-6 rounded-2xl border border-line bg-card px-4 py-4 font-sans text-[14px] leading-relaxed">
            Check <strong>{email}</strong> for a sign-in link. Open it in this browser. It may take a
            minute; look in spam if it does not arrive.
          </div>
        ) : (
          <form onSubmit={submit} className="mt-6 flex flex-col gap-3">
            <label className="font-sans text-[13px] text-muted" htmlFor="email">
              Email address
            </label>
            <input
              id="email"
              type="email"
              required
              autoComplete="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="rounded-xl border border-line bg-card px-3 py-2.5 font-sans text-[15px] text-ink outline-none focus:border-ink"
            />
            <button
              type="submit"
              disabled={state === "sending"}
              className="rounded-full bg-ink text-page font-sans text-[14px] font-medium px-4 py-2.5 disabled:opacity-60"
            >
              {state === "sending" ? "Sending…" : "Email me a sign-in link"}
            </button>
            {state === "error" && <p className="font-sans text-[13px] text-maroon">{message}</p>}
          </form>
        )}
      </div>
    </main>
  );
}
