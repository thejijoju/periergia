"use client";

import { useEffect, useRef, useState } from "react";

// ── Report an error · Suggest an edit ─────────────────────────────────────
// Every article carries this. The point is not only to catch mistakes: showing
// that the text improves because readers push on it turns a reader into a
// contributor, and makes the corrigibility of the material visible rather than
// implied.
//
// If the reader has text selected when they open the panel, that selection is
// captured as the quoted passage — which is the difference between "there's an
// error somewhere in this article" and a report someone can act on directly.
// Submissions go to /api/feedback (Supabase, server-side only). No account.

type Kind = "error" | "suggestion" | "unclear";

const KINDS: { id: Kind; label: string; placeholder: string }[] = [
  {
    id: "error",
    label: "Factual error",
    placeholder: "What is wrong, and what should it say? A source helps but isn't required.",
  },
  {
    id: "suggestion",
    label: "Suggested edit",
    placeholder: "What would you change — wording, an example, something missing?",
  },
  {
    id: "unclear",
    label: "Unclear passage",
    placeholder: "Which part lost you, and where did the explanation stop working?",
  },
];

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

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
    fetch("/api/track", {
      method: "POST",
      body,
      headers: { "Content-Type": "application/json" },
      keepalive: true,
    }).catch(() => {});
  } catch {
    /* analytics must never break the UI */
  }
}

export function ReportIssue({
  nodeId,
  title,
  depth,
  level,
}: {
  nodeId: string;
  title: string;
  depth?: string;
  level?: string;
}) {
  const [open, setOpen] = useState(false);
  const [kind, setKind] = useState<Kind>("error");
  const [message, setMessage] = useState("");
  const [quote, setQuote] = useState("");
  const [email, setEmail] = useState("");
  const [status, setStatus] = useState<"idle" | "sending" | "done" | "error">("idle");
  const areaRef = useRef<HTMLTextAreaElement>(null);

  // Reset when the reader navigates to another article.
  useEffect(() => {
    setOpen(false);
    setMessage("");
    setQuote("");
    setStatus("idle");
  }, [nodeId]);

  const start = () => {
    // Grab any live selection before the click collapses it.
    const sel = typeof window !== "undefined" ? window.getSelection()?.toString().trim() ?? "" : "";
    if (sel && sel.length >= 8) setQuote(sel.slice(0, 600));
    setOpen(true);
    setStatus("idle");
    track("feedback_opened", nodeId, title);
    setTimeout(() => areaRef.current?.focus(), 30);
  };

  const submit = async (e: React.FormEvent) => {
    e.preventDefault();
    const text = message.trim();
    if (text.length < 4) {
      setStatus("error");
      return;
    }
    const mail = email.trim();
    if (mail && !EMAIL_RE.test(mail)) {
      setStatus("error");
      return;
    }
    setStatus("sending");
    try {
      const res = await fetch("/api/feedback", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          nodeId,
          title,
          kind,
          message: text,
          quote: quote.trim() || null,
          email: mail || null,
          depth,
          level,
          path: window.location.pathname,
        }),
      });
      if (!res.ok) throw new Error("bad status");
      setStatus("done");
      track("feedback_submitted", nodeId, title);
    } catch {
      setStatus("error");
    }
  };

  if (status === "done") {
    return (
      <div className="mt-6 rounded-2xl border border-line bg-card px-5 py-4 print:hidden">
        <p className="font-sans text-[14px] text-ink">
          Thank you &mdash; that&rsquo;s logged against this article.
        </p>
        <p className="mt-1.5 font-sans text-[12.5px] leading-relaxed text-faint">
          Reports are reviewed and the corrections are made in the source text, so the next
          reader gets the fixed version. {email.trim() ? "We’ll write back if we need more detail." : ""}
        </p>
      </div>
    );
  }

  if (!open) {
    return (
      <div className="mt-6 flex flex-wrap items-center gap-x-3 gap-y-1 print:hidden">
        <button
          onClick={start}
          className="inline-flex items-center gap-1.5 font-sans text-[12.5px] text-muted underline decoration-line underline-offset-[3px] transition-colors hover:text-maroon"
        >
          <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.35">
            <circle cx="8" cy="8" r="6" />
            <path d="M8 5v3.5" strokeLinecap="round" />
            <circle cx="8" cy="11" r=".7" fill="currentColor" stroke="none" />
          </svg>
          Report an error or suggest an edit
        </button>
        <span className="font-sans text-[12px] text-faint">
          Select a passage first and it comes with your report.
        </span>
      </div>
    );
  }

  const active = KINDS.find((k) => k.id === kind) ?? KINDS[0];

  return (
    <form onSubmit={submit} className="mt-6 rounded-2xl border border-line bg-card p-5 print:hidden">
      <div className="flex items-start justify-between gap-3">
        <span className="font-mono text-[10px] font-semibold uppercase tracking-[0.12em] text-whisper">
          Improve this article
        </span>
        <button
          type="button"
          onClick={() => setOpen(false)}
          aria-label="Close"
          className="font-sans text-[12px] text-faint transition-colors hover:text-ink"
        >
          Cancel
        </button>
      </div>

      <div className="mt-3 flex flex-wrap gap-[6px]">
        {KINDS.map((k) => (
          <button
            key={k.id}
            type="button"
            onClick={() => setKind(k.id)}
            className={`font-sans text-[11px] px-[10px] py-[4px] rounded-full transition-colors ${
              k.id === kind
                ? "border-[1.1px] border-ink bg-page text-ink"
                : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
            }`}
          >
            {k.label}
          </button>
        ))}
      </div>

      {quote && (
        <div className="mt-3 rounded-xl border border-line bg-pill px-3.5 py-2.5">
          <div className="flex items-start justify-between gap-2">
            <p className="font-sans text-[12.5px] italic leading-relaxed text-muted">
              &ldquo;{quote.length > 300 ? `${quote.slice(0, 300)}…` : quote}&rdquo;
            </p>
            <button
              type="button"
              onClick={() => setQuote("")}
              aria-label="Remove quoted passage"
              className="flex-none font-sans text-[11px] text-faint transition-colors hover:text-ink"
            >
              remove
            </button>
          </div>
        </div>
      )}

      <textarea
        ref={areaRef}
        value={message}
        onChange={(e) => {
          setMessage(e.target.value);
          if (status === "error") setStatus("idle");
        }}
        rows={4}
        maxLength={4000}
        placeholder={active.placeholder}
        aria-label={active.label}
        className="mt-3 w-full resize-y rounded-xl border border-line bg-page px-3.5 py-2.5 font-sans text-[14px] leading-relaxed text-ink outline-none placeholder:text-faint focus:border-ink"
      />

      <div className="mt-2 flex flex-col gap-2 sm:flex-row sm:items-center">
        <input
          type="email"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
            if (status === "error") setStatus("idle");
          }}
          placeholder="Email (optional — only if you want a reply)"
          aria-label="Email address, optional"
          className="flex-1 rounded-full border border-line bg-page px-4 py-2 font-sans text-[13px] text-ink outline-none placeholder:text-faint focus:border-ink"
        />
        <button
          type="submit"
          disabled={status === "sending"}
          className="flex-none rounded-full border-[1.5px] border-maroon bg-maroon px-5 py-2 font-sans text-[13.5px] font-medium text-white transition-opacity hover:opacity-90 disabled:opacity-60"
        >
          {status === "sending" ? "Sending…" : "Send report"}
        </button>
      </div>

      {status === "error" && (
        <p className="mt-2 font-sans text-[12.5px] text-maroon">
          Please add a short description (and a valid email, if you entered one).
        </p>
      )}

      <p className="mt-2.5 font-sans text-[12px] leading-relaxed text-faint">
        No account needed. Reports go to the people who maintain the text, and accepted
        corrections are made in the source so every later reader sees them.
      </p>
    </form>
  );
}
