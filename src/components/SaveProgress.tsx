"use client";

import { useEffect, useState } from "react";

// ── "Save your progress" prompt ───────────────────────────────────────────
// SHELL ONLY. There are no accounts yet: drill streaks, checkpoint scores and
// which lectures have been read all live in component memory and vanish on
// reload. This card states the intent and collects an address for when
// accounts land, so the demand is measurable before the auth work is done.
// It deliberately does not offer a "Sign up" button that would go nowhere.
//
// Addresses go to the same research_signups table as the Research tier's
// interest list, tagged source = "progress" so the two lists stay separable.
// Dismissal is remembered locally, so a reader who is not interested is asked
// once and then left alone.

const KEY = "periergia_progress_prompt";

export function SaveProgress({ nodeId, title }: { nodeId: string; title: string }) {
  const [hidden, setHidden] = useState(true); // assume hidden until localStorage is read
  const [email, setEmail] = useState("");
  const [state, setState] = useState<"idle" | "sending" | "done" | "error">("idle");

  useEffect(() => {
    try {
      setHidden(window.localStorage.getItem(KEY) === "dismissed");
    } catch {
      setHidden(false);
    }
  }, []);

  const dismiss = () => {
    setHidden(true);
    try {
      window.localStorage.setItem(KEY, "dismissed");
    } catch {
      /* private mode — the prompt simply reappears next visit */
    }
  };

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (state === "sending" || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return;
    setState("sending");
    try {
      const r = await fetch("/api/research-signup", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({
          email,
          nodeId,
          title,
          source: "progress",
          path: typeof window === "undefined" ? null : window.location.pathname,
        }),
      });
      setState(r.ok ? "done" : "error");
      if (r.ok) {
        try {
          window.localStorage.setItem(KEY, "dismissed");
        } catch {
          /* ignore */
        }
      }
    } catch {
      setState("error");
    }
  };

  if (hidden) return null;

  return (
    <aside className="mt-10 not-prose rounded-2xl border border-line bg-card px-4 sm:px-5 py-4">
      <div className="flex items-start gap-3">
        <div className="flex-1">
          <p className="font-sans text-[15px] font-semibold text-ink">Want to save your progress?</p>
          <p className="mt-1 font-sans text-[13.5px] leading-relaxed text-muted">
            An account will track which lessons you have worked through, your checkpoint scores and
            your drill streaks, and keep your achievements across devices. Accounts are not built
            yet — leave an address and we will tell you the day they are.
          </p>

          {state === "done" ? (
            <p className="mt-3 font-sans text-[13.5px] font-medium text-[var(--ok-text)]">
              Noted — you will hear from us when progress saving is live.
            </p>
          ) : (
            <form onSubmit={submit} className="mt-3 flex flex-wrap items-center gap-2">
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="you@example.com"
                aria-label="Email address"
                className="font-sans text-[14px] px-3 py-2 rounded-xl border border-line bg-page text-ink w-full sm:w-64"
              />
              <button
                type="submit"
                disabled={state === "sending"}
                className="font-sans text-[13px] font-medium px-3.5 py-2 rounded-xl border border-line text-ink hover:border-ink disabled:text-faint"
              >
                {state === "sending" ? "Sending…" : "Tell me when it's ready"}
              </button>
              {state === "error" && (
                <span className="font-sans text-[13px] text-[var(--bad-text)]">
                  That did not go through — try again shortly.
                </span>
              )}
            </form>
          )}
        </div>
        <button
          onClick={dismiss}
          aria-label="Dismiss"
          className="shrink-0 font-sans text-[13px] text-whisper hover:text-ink"
        >
          ✕
        </button>
      </div>
    </aside>
  );
}
