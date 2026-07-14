"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import Link from "next/link";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import "katex/dist/katex.min.css";
import { DEPTHS, LEVELS, type Depth, type Level } from "@/lib/types";
import { getMode, type Mode } from "@/lib/modes";
import { useProgress } from "@/lib/progress";
import { LearningModeRail } from "./LearningModeRail";
import { VoiceButton } from "./VoiceButton";
import { QuizPanel } from "./QuizPanel";
import { WorkedExample } from "./WorkedExample";

export interface Crumb {
  label: string;
  href?: string;
  current?: boolean; // the page you're on — styled distinctly, still tappable
}

export interface ReaderNode {
  id: string;
  title: string;
  summary: string;
  crumbs: Crumb[]; // subject → … → current (current has no href)
}

// Slugify a heading's text into a stable anchor id.
function headingId(children: React.ReactNode): string {
  return extractText(children)
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

// Generated bodies write display math as single-line `$$…$$` (and sometimes
// LaTeX `\[…\]` / `\(…\)`), but remark-math only treats `$$` fenced on its own
// lines as display math. Normalize so equations render centered, textbook-style.
function normalizeMath(md: string): string {
  return md
    .replace(/\\\[([\s\S]+?)\\\]/g, (_, m) => `\n$$\n${m}\n$$\n`)
    .replace(/\\\((.+?)\\\)/g, (_, m) => `$${m}$`)
    .replace(/^[ \t]*\$\$([^$\n]+?)\$\$[ \t]*$/gm, (_, m) => `$$\n${m}\n$$`);
}

// Coarse dwell buckets — Vercel Web Analytics shows a custom-event property as a
// clean breakdown, so a labelled range reads better on the dashboard than raw
// seconds (which we also send, for export).
function dwellBucket(seconds: number): string {
  if (seconds < 10) return "0–10s";
  if (seconds < 30) return "10–30s";
  if (seconds < 60) return "30–60s";
  if (seconds < 180) return "1–3 min";
  if (seconds < 600) return "3–10 min";
  return "10 min+";
}

function extractText(node: React.ReactNode): string {
  if (typeof node === "string" || typeof node === "number") return String(node);
  if (Array.isArray(node)) return node.map(extractText).join("");
  if (node && typeof node === "object" && "props" in node) {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return extractText((node as any).props?.children);
  }
  return "";
}

export function Reader({
  node,
  initialBody = "",
  initialDepth,
  initialLevel,
  initialReviewed = false,
}: {
  node: ReaderNode;
  initialBody?: string;
  initialDepth?: Depth;
  initialLevel?: Level;
  initialReviewed?: boolean;
}) {
  const { state, hydrated, markVisited, markCompleted, setPrefs } = useProgress();
  const { depth: prefDepth, level: prefLevel, mode } = state.prefs;
  const spec = getMode(mode);

  // initialBody is the server-rendered article (the richest cached variant, not
  // necessarily the reader's own depth/level preference): crawlers get the full
  // text, and a visitor landing from search sees it immediately and keeps it —
  // we do NOT re-fetch on mount when it's present, so the good article isn't
  // replaced by a shorter regeneration. A fetch fires only when the reader
  // changes depth/level/mode, or when nothing was cached.
  //
  // `shown` tracks what's actually on screen, which starts from initialDepth/
  // initialLevel (the SSR pick) rather than the sticky global pref — otherwise
  // the pills would claim "Medium/Easy" while a Research/Advanced article is
  // displayed, and switching mode alone would silently regenerate at the wrong,
  // lower tier instead of the one the reader is looking at.
  const [shownDepth, setShownDepth] = useState<Depth>(initialDepth ?? prefDepth);
  const [shownLevel, setShownLevel] = useState<Level>(initialLevel ?? prefLevel);
  const [body, setBody] = useState(initialBody);
  const [loading, setLoading] = useState(!initialBody);
  const [generated, setGenerated] = useState(!!initialBody);
  const [reviewed, setReviewed] = useState(initialReviewed);
  const [showQuiz, setShowQuiz] = useState(false);
  const skipInitialFetch = useRef(!!initialBody);

  useEffect(() => {
    markVisited(node.id);
    setShowQuiz(false);
  }, [node.id, markVisited]);

  // On client-side navigation the page re-renders with a new node + body.
  useEffect(() => {
    setBody(initialBody);
    setGenerated(!!initialBody);
    setReviewed(initialReviewed);
    setLoading(!initialBody);
    setShownDepth(initialDepth ?? prefDepth);
    setShownLevel(initialLevel ?? prefLevel);
    skipInitialFetch.current = !!initialBody;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [node.id]);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const res = await fetch("/api/content", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nodeId: node.id, depth: shownDepth, level: shownLevel, mode }),
      }).then((r) => r.json());
      setBody(res.body ?? "");
      setGenerated(!!res.generated);
      setReviewed(!!res.reviewed);
    } finally {
      setLoading(false);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [node.id, shownDepth, shownLevel, mode]);

  useEffect(() => {
    if (!hydrated) return;
    // Keep the server-rendered article on first mount; only fetch on pref change.
    if (skipInitialFetch.current) {
      skipInitialFetch.current = false;
      return;
    }
    load();
  }, [hydrated, load]);

  // Engagement tracking: how long a reader actually stays on an article, plus
  // which depth/level they read it at. Vercel Web Analytics already reports real
  // visitors, per-article page views, and location; this custom event adds the
  // dwell time it can't measure on its own. Fires once, on leaving the article
  // (tab hidden, tab/page close, client-side nav, or a depth/level switch).
  useEffect(() => {
    if (loading || !generated) return;
    const startedAt = Date.now();
    let sent = false;
    const title = node.title.replace(/\s*\*+$/, "");
    const fire = () => {
      if (sent) return;
      const seconds = Math.round((Date.now() - startedAt) / 1000);
      if (seconds < 3) return; // ignore flickers and instant bounces
      sent = true;
      const payload = JSON.stringify({
        name: "article_read",
        nodeId: node.id,
        title,
        path: window.location.pathname,
        depth: shownDepth,
        level: shownLevel,
        seconds,
        dwell: dwellBucket(seconds),
        referrer: document.referrer || null,
      });
      // Beacon so it still sends while the page is unloading; keepalive fetch
      // is the fallback. Fully fire-and-forget — never blocks or throws.
      try {
        const blob = new Blob([payload], { type: "application/json" });
        if (navigator.sendBeacon?.("/api/track", blob)) return;
        fetch("/api/track", {
          method: "POST",
          body: payload,
          headers: { "Content-Type": "application/json" },
          keepalive: true,
        }).catch(() => {});
      } catch {
        // ignore — analytics must never affect the reading experience
      }
    };
    const onVisibility = () => {
      if (document.visibilityState === "hidden") fire();
    };
    document.addEventListener("visibilitychange", onVisibility);
    window.addEventListener("pagehide", fire);
    return () => {
      document.removeEventListener("visibilitychange", onVisibility);
      window.removeEventListener("pagehide", fire);
      fire(); // client-side navigation away, unmount, or depth/level change
    };
  }, [node.id, loading, generated, shownDepth, shownLevel]);

  const isAudio = spec.kind === "audio";
  const isVisual = spec.kind === "visual";

  return (
    <article className="max-w-[720px] mx-auto px-1">
      {/* Breadcrumb — house + arrows + linked ancestors */}
      <nav className="flex items-center flex-wrap gap-x-1.5 gap-y-1 text-[12.5px] text-muted">
        <Link href="/" aria-label="Home" className="text-faint hover:text-purple transition-colors">
          <svg width="15" height="15" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.4" strokeLinejoin="round">
            <path d="M2.5 7 8 2.5 13.5 7" strokeLinecap="round" />
            <path d="M4 6.5v6.5h8V6.5" />
          </svg>
        </Link>
        {node.crumbs.map((c, i) => (
          <span key={i} className="flex items-center gap-x-1.5">
            <Chevron />
            {c.href ? (
              <Link
                href={c.href}
                aria-current={c.current ? "page" : undefined}
                className={
                  c.current
                    ? "text-ink font-medium hover:text-purple transition-colors"
                    : "hover:text-purple transition-colors"
                }
              >
                {c.label}
              </Link>
            ) : (
              <span className="text-ink font-medium">{c.label}</span>
            )}
          </span>
        ))}
      </nav>

      {/* Title with the inline learning-mode rail beside it */}
      <div className="mt-4 flex items-start gap-x-3 gap-y-1 flex-wrap">
        <h1 className="font-sans font-bold text-[32px] leading-[1.12] tracking-[-0.02em] text-ink">
          {/* Strip any literal trailing "*" from the title: the reviewed marker
              below is the single, styled source of the asterisk on the heading
              (the seed "*" still flags the topic in the tree, which has no
              reviewed signal of its own). */}
          {node.title.replace(/\s*\*+$/, "")}
          {reviewed && (
            <span
              title="This article has been reviewed by a human"
              aria-label="Human-reviewed"
              className="ml-1.5 align-super text-maroon text-[20px] select-none"
            >
              *
            </span>
          )}
        </h1>
        <div className="mt-2 flex-1 min-w-[120px]">
          <LearningModeRail active={mode} onSelect={(id: Mode) => setPrefs({ mode: id })} />
        </div>
      </div>

      {/* Depth + Level controls */}
      <div className="mt-4 space-y-2.5">
        <ControlRow
          label="Depth"
          items={DEPTHS}
          value={shownDepth}
          onSelect={(id) => {
            setShownDepth(id as Depth);
            setPrefs({ depth: id as Depth });
          }}
        />
        <ControlRow
          label="Level"
          items={LEVELS}
          value={shownLevel}
          onSelect={(id) => {
            setShownLevel(id as Level);
            setPrefs({ level: id as Level });
          }}
        />
      </div>

      <hr className="my-7 border-line" />

      {/* Body */}
      {loading ? (
        <p className="font-sans italic text-[15px] text-faint">
          Composing this {spec.label.toLowerCase()}…
        </p>
      ) : (
        <>
          {isAudio && (
            <div className="mb-5">
              <VoiceButton text={body} />
            </div>
          )}
          {isVisual && (
            <p className="mb-5 font-sans text-[13px] text-muted bg-purple-soft/60 border border-line rounded-xl px-4 py-2.5">
              Rich {spec.label.toLowerCase()} generation is coming soon — for now, here’s the{" "}
              {spec.label.toLowerCase()} described in words.
            </p>
          )}
          <div id="reader-content" className="prose-reading max-w-none">
            <ReactMarkdown
              remarkPlugins={[remarkGfm, remarkMath]}
              rehypePlugins={[rehypeKatex]}
              components={{
                h2: ({ children }) => <h2 id={headingId(children)}>{children}</h2>,
                h3: ({ children }) => <h3 id={headingId(children)}>{children}</h3>,
                // A fenced ```example block becomes an interactive "Your turn"
                // practice box. We intercept at the <pre> so the surrounding
                // <pre><code> code styling never wraps the widget.
                pre: ({ children }) => {
                  const child = Array.isArray(children) ? children[0] : children;
                  const cls =
                    child && typeof child === "object" && "props" in child
                      ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                        ((child as any).props?.className ?? "")
                      : "";
                  if (typeof cls === "string" && /language-example\b/.test(cls)) {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    const spec = extractText((child as any).props?.children).trim();
                    return <WorkedExample spec={spec} />;
                  }
                  return <pre>{children}</pre>;
                },
              }}
            >
              {normalizeMath(body)}
            </ReactMarkdown>
          </div>
        </>
      )}

      {!generated && !loading && (
        <p className="mt-4 font-mono text-[10.5px] tracking-[0.04em] text-whisper uppercase">
          Placeholder — set ANTHROPIC_API_KEY for original content
        </p>
      )}

      {/* Test CTA */}
      {!loading && (
        <div className="mt-8">
          {!showQuiz ? (
            <button
              onClick={() => setShowQuiz(true)}
              className="w-full flex justify-between items-center border border-maroon rounded-full px-5 py-3 hover:bg-[#faf3f0] transition-colors"
            >
              <span className="font-sans font-medium text-[14px] text-ink">
                Test yourself — 6 questions
              </span>
              <span className="font-sans font-semibold text-[16px] text-maroon">→</span>
            </button>
          ) : (
            <QuizPanel
              nodeId={node.id}
              level={shownLevel}
              title={node.title}
              onClose={() => setShowQuiz(false)}
              onPassed={() => markCompleted(node.id)}
            />
          )}
        </div>
      )}
    </article>
  );
}

function Chevron() {
  return (
    <svg width="12" height="12" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.4" className="text-faint">
      <path d="M4.5 3 7.5 6 4.5 9" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

function ControlRow({
  label,
  items,
  value,
  onSelect,
}: {
  label: string;
  items: { id: string; label: string }[];
  value: string;
  onSelect: (id: string) => void;
}) {
  return (
    <div className="flex items-center gap-3 flex-wrap">
      <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper w-[42px] shrink-0">
        {label}
      </span>
      <div className="flex flex-wrap gap-[6px]">
        {items.map((it) => {
          const active = it.id === value;
          return (
            <button
              key={it.id}
              onClick={() => onSelect(it.id)}
              className={`font-sans text-[11px] px-[10px] py-[4px] rounded-full transition-colors ${
                active
                  ? "border-[1.1px] border-ink bg-page text-ink"
                  : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
              }`}
            >
              {it.label}
            </button>
          );
        })}
      </div>
    </div>
  );
}
