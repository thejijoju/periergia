"use client";

import { useEffect, useRef, useState } from "react";

// The gated "Research" tier. Nothing written is hidden behind it — the article
// the reader was on is the free Detailed & Expert master. Research is a future
// tier of full-length pieces written by working researchers in the field, not
// yet written. This panel explains that and captures interest: an email saved
// to Supabase (research_signups) plus a research_signup analytics event, so we
// can measure demand before commissioning anything. No login, no account.

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

// Fire-and-forget interest/analytics event (same ingest as article reads).
function track(name: string, nodeId: string, title: string) {
  try {
    const body = JSON.stringify({
      name,
      nodeId,
      title,
      path: typeof window !== "undefined" ? window.location.pathname : null,
    });
    const blob = new Blob([body], { type: "application/json" });
    if (navigator.sendBeacon?.("/api/track", blob)) return;
    fetch("/api/track", { method: "POST", body, headers: { "Content-Type": "application/json" }, keepalive: true }).catch(() => {});
  } catch {
    /* analytics must never break the UI */
  }
}

export function ResearchGate({
  nodeId,
  title,
}: {
  nodeId: string;
  title: string;
}) {
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "done" | "error">("idle");

  // Count the gate view once (per mount) so we can see how many readers reach it.
  const viewed = useRef(false);
  useEffect(() => {
    if (viewed.current) return;
    viewed.current = true;
    track("research_gate_viewed", nodeId, title);
  }, [nodeId, title]);

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    const value = email.trim();
    if (!EMAIL_RE.test(value)) {
      setStatus("error");
      return;
    }
    setStatus("sending");
    try {
      const res = await fetch("/api/research-signup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email: value, nodeId, title, path: window.location.pathname }),
      });
      if (!res.ok) throw new Error("bad status");
      setStatus("done");
      track("research_signup", nodeId, title);
    } catch {
      setStatus("error");
    }
  };

  return (
    <div className="my-6 rounded-2xl border border-line bg-card p-6 sm:p-8">
      <div className="flex items-center gap-2">
        <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.5" className="text-maroon">
          <rect x="3" y="7" width="10" height="7" rx="1.5" />
          <path d="M5 7V5a3 3 0 0 1 6 0v2" />
        </svg>
        <span className="font-mono text-[10.5px] font-semibold uppercase tracking-[0.12em] text-maroon">
          Research · coming soon
        </span>
      </div>

      <h2 className="mt-3 font-sans text-[22px] font-bold tracking-tight text-ink">
        Articles written by researchers in the field
      </h2>

      <div className="mt-3 space-y-3 font-sans text-[14.5px] leading-relaxed text-muted">
        <p>
          Everything on Periergia is free — including the full <strong className="text-ink">Detailed&nbsp;&amp;&nbsp;Expert</strong> article
          you were just reading. <strong className="text-ink">Research</strong> is a tier above it: long-form pieces
          written and cited by working researchers — the historiography, the primary
          sources, the open questions at the frontier.
        </p>
        <p>It isn’t written yet. Leave your email and we’ll tell you the moment it goes live.</p>
      </div>

      {status === "done" ? (
        <p className="mt-5 rounded-xl border border-line bg-pill px-4 py-3 font-sans text-[14px] text-ink">
          You’re on the list — thank you. We’ll be in touch when Research launches.
        </p>
      ) : (
        <form onSubmit={submit} className="mt-5 flex flex-col gap-2 sm:flex-row">
          <input
            type="email"
            required
            value={email}
            onChange={(e) => {
              setEmail(e.target.value);
              if (status === "error") setStatus("idle");
            }}
            placeholder="you@example.com"
            aria-label="Email address"
            className="flex-1 rounded-full border border-line bg-page px-4 py-2.5 font-sans text-[14px] text-ink outline-none placeholder:text-faint focus:border-ink"
          />
          <button
            type="submit"
            disabled={status === "sending"}
            className="flex-none rounded-full border-[1.5px] border-maroon bg-maroon px-5 py-2.5 font-sans text-[14px] font-medium text-white transition-opacity hover:opacity-90 disabled:opacity-60"
          >
            {status === "sending" ? "Sending…" : "Notify me"}
          </button>
        </form>
      )}

      {status === "error" && (
        <p className="mt-2 font-sans text-[12.5px] text-maroon">
          Please enter a valid email address and try again.
        </p>
      )}

      <p className="mt-3 font-sans text-[12px] text-faint">No spam, no account — just one heads-up when Research is ready.</p>
    </div>
  );
}
