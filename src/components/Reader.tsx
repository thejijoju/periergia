"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import Link from "next/link";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import "katex/dist/katex.min.css";
import { LEVELS, type Depth, type Level } from "@/lib/types";
import { getMode, type Mode } from "@/lib/modes";
import { injectAffiliateLinks } from "@/lib/affiliate";
import { isRtl, t } from "@/lib/i18n";
import { isExcludedVisitor } from "@/lib/analyticsOptOut";
import { useProgress } from "@/lib/progress";
import { LearningModeRail } from "./LearningModeRail";
import { VoiceButton } from "./VoiceButton";
import { QuizPanel } from "./QuizPanel";
import { WorkedExample } from "./WorkedExample";
import { SupplyDemandChart } from "./SupplyDemandChart";
import { IncomeGoodChart } from "./IncomeGoodChart";
import { GiffenChart } from "./GiffenChart";
import { BlackbodyChart } from "./BlackbodyChart";
import { SegmentedMirror } from "./SegmentedMirror";
import { RocketEquation } from "./RocketEquation";
import { Quotation } from "./Quotation";
import { ResearchGate } from "./ResearchGate";

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

// Co-authored masters are stored verbatim, so any {{image: Title | caption}}
// markers they carry never went through the generator's image step. Detect them
// (HAS) so the Reader can resolve them via /api/resolve-images on Vercel, and
// STRIP any that remain (pre-resolution, or a marker that didn't resolve) so a
// raw marker is never shown as literal text.
const HAS_IMAGE_MARKER = /\{\{\s*image:/;
const STRIP_IMAGE_MARKER = /^[ \t]*\{\{\s*image:[^{}\n]*\}\}[ \t]*$/gm;

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
  country,
  lang = "en",
}: {
  node: ReaderNode;
  initialBody?: string;
  initialDepth?: Depth;
  initialLevel?: Level;
  initialReviewed?: boolean;
  country?: string;
  lang?: string;
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
  // Resolve the depth/level to open at. The old "detailed" distillation rung is
  // retired from the UI, so coerce it to the master ("research", badged
  // "Detailed"); and the master reads as "Expert" by default (it's served
  // verbatim at every level, so the badge is cosmetic — "Detailed & Expert").
  const resolveInitial = () => {
    const raw = initialDepth === "detailed" ? "research" : initialDepth;
    const d: Depth = raw ?? prefDepth;
    const l: Level = d === "research" ? "expert" : (initialLevel ?? prefLevel);
    return { d, l };
  };
  const [shownDepth, setShownDepth] = useState<Depth>(() => resolveInitial().d);
  const [shownLevel, setShownLevel] = useState<Level>(() => resolveInitial().l);
  const [gate, setGate] = useState(false); // gated "Research" tier panel shown?
  const [body, setBody] = useState(initialBody);
  const [loading, setLoading] = useState(!initialBody);
  const [streaming, setStreaming] = useState(false); // article is writing itself
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
    const { d, l } = resolveInitial();
    setShownDepth(d);
    setShownLevel(l);
    setGate(false);
    skipInitialFetch.current = !!initialBody;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [node.id]);

  // Resolve {{image}} markers in a co-authored master to real Wikipedia images.
  // Runs on the server route (which can reach Wikipedia); we swap the resolved
  // body in once. Guarded by a ref so it fires once per distinct body, and it's
  // a no-op for generated bodies (their images were already spliced in).
  const imgResolvedFor = useRef<string>("");
  useEffect(() => {
    if (streaming || loading || !body || !HAS_IMAGE_MARKER.test(body)) return;
    if (imgResolvedFor.current === body) return;
    const target = body;
    imgResolvedFor.current = target;
    let alive = true;
    fetch("/api/resolve-images", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ body: target, topicTitle: node.title.replace(/\s*\*+$/, "") }),
    })
      .then((r) => r.json())
      .then((d) => {
        if (alive && d?.body && d.body !== target) setBody(d.body);
      })
      .catch(() => {});
    return () => {
      alive = false;
    };
  }, [body, loading, streaming, node.id, node.title]);

  const load = useCallback(async () => {
    setLoading(true);
    setStreaming(false);
    try {
      const res = await fetch("/api/content/stream", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nodeId: node.id, depth: shownDepth, level: shownLevel, mode, lang }),
      });
      const genHeader = res.headers.get("x-generated") === "1";
      setReviewed(res.headers.get("x-reviewed") === "1");

      if (!res.body) {
        const text = await res.text();
        setBody(text);
        setGenerated(genHeader && text.length > 0);
        return;
      }

      // Stream the article in as it's written. First byte clears the "Composing…"
      // state; repaints are throttled (~90ms) so re-rendering the growing Markdown
      // tree on every token doesn't choke the main thread.
      const reader = res.body.getReader();
      const decoder = new TextDecoder();
      let acc = "";
      let started = false;
      let lastPaint = 0;
      for (;;) {
        const { done, value } = await reader.read();
        if (done) break;
        acc += decoder.decode(value, { stream: true });
        if (!started) {
          started = true;
          setGenerated(genHeader);
          setLoading(false);
          setStreaming(true);
        }
        const now = Date.now();
        if (now - lastPaint > 90) {
          lastPaint = now;
          setBody(acc);
        }
      }
      acc += decoder.decode();
      setBody(acc);
      setGenerated(genHeader && acc.length > 0);
    } finally {
      setLoading(false);
      setStreaming(false);
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
      if (isExcludedVisitor()) return; // owner opted this browser out (?mine)
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

      {/* Depth + Level controls. The reviewed master is the free "Detailed"
          tier (default); "Research" is a separate, gated frontier tier that
          locks to Expert — nothing written is hidden behind it. */}
      <div className="mt-4 space-y-2.5">
        <div className="flex items-center gap-3 flex-wrap">
          <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper w-[42px] shrink-0">
            {t(lang, "depth")}
          </span>
          <div className="flex flex-wrap gap-[6px]">
            {DEPTH_TIERS.map((it) => (
              <button
                key={it.id}
                onClick={() => {
                  setGate(false);
                  setShownDepth(it.id);
                  setPrefs({ depth: it.id });
                }}
                className={chipCls(!gate && it.id === shownDepth)}
              >
                {t(lang, it.key)}
              </button>
            ))}
            {/* Gated frontier tier — locks to Expert, opens the signup panel. */}
            <button
              onClick={() => {
                setGate(true);
                setShownLevel("expert");
                setPrefs({ level: "expert" });
              }}
              className={`${chipCls(gate)} inline-flex items-center gap-[3px]`}
            >
              <svg width="9" height="9" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.8" className="text-maroon">
                <rect x="3" y="7" width="10" height="7" rx="1.5" />
                <path d="M5 7V5a3 3 0 0 1 6 0v2" />
              </svg>
              {t(lang, "research")}
            </button>
          </div>
        </div>
        {!gate && (
          <ControlRow
            labelKey="level"
            lang={lang}
            items={LEVELS}
            value={shownLevel}
            onSelect={(id) => {
              setShownLevel(id as Level);
              setPrefs({ level: id as Level });
            }}
          />
        )}
      </div>

      {gate ? (
        <ResearchGate nodeId={node.id} title={node.title.replace(/\s*\*+$/, "")} />
      ) : (
        <>
      <hr className="my-7 border-line" />

      {/* Body */}
      {loading ? (
        <p className="font-sans italic text-[15px] text-faint">
          {t(lang, "composing")}
        </p>
      ) : (
        <>
          {isAudio && (
            <div className="mb-5">
              <VoiceButton text={body} lang={lang} />
            </div>
          )}
          {isVisual && (
            <p className="mb-5 font-sans text-[13px] text-muted bg-purple-soft/60 border border-line rounded-xl px-4 py-2.5">
              Rich {spec.label.toLowerCase()} generation is coming soon — for now, here’s the{" "}
              {spec.label.toLowerCase()} described in words.
            </p>
          )}
          <div
            id="reader-content"
            className="prose-reading max-w-none"
            dir={isRtl(lang) ? "rtl" : "ltr"}
          >
            <ReactMarkdown
              remarkPlugins={[remarkGfm, remarkMath]}
              rehypePlugins={[rehypeKatex]}
              components={{
                h2: ({ children }) => <h2 id={headingId(children)}>{children}</h2>,
                h3: ({ children }) => <h3 id={headingId(children)}>{children}</h3>,
                // External links open in a new tab. Affiliate links (our tagged
                // Amazon/Bookshop URLs) are marked rel="sponsored nofollow" per
                // Google/FTC guidance. A linkified book TITLE keeps the normal
                // prominent link style so it's obviously tappable; only the
                // small trailing store tag (its text carries the "↗") is muted.
                a: ({ href, children }) => {
                  const url = typeof href === "string" ? href : "";
                  if (!/^https?:\/\//.test(url)) return <a href={url}>{children}</a>;
                  const affiliate =
                    (/amazon\./.test(url) && /[?&]tag=/.test(url)) ||
                    /bookshop\.org\//.test(url);
                  const compact = affiliate && /↗/.test(extractText(children));
                  return (
                    <a
                      href={url}
                      target="_blank"
                      rel={affiliate ? "sponsored nofollow noopener noreferrer" : "noopener noreferrer"}
                      className={compact ? "affiliate-link" : undefined}
                    >
                      {children}
                    </a>
                  );
                },
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
                    return <WorkedExample spec={spec} lang={lang} />;
                  }
                  // A fenced ```supplydemand block becomes an interactive
                  // supply-and-demand diagram with shift sliders.
                  if (typeof cls === "string" && /language-supplydemand\b/.test(cls)) {
                    return <SupplyDemandChart />;
                  }
                  // A fenced ```incomegood block becomes an interactive diagram
                  // of a demand curve shifting with income (normal vs inferior).
                  if (typeof cls === "string" && /language-incomegood\b/.test(cls)) {
                    return <IncomeGoodChart />;
                  }
                  // A fenced ```giffen block decomposes a price rise into its
                  // substitution and income effects (normal / inferior / Giffen).
                  if (typeof cls === "string" && /language-giffen\b/.test(cls)) {
                    return <GiffenChart />;
                  }
                  // A fenced ```blackbody block becomes the interactive spectrum
                  // "thermometer of violence" (Wien's law, temperature slider).
                  if (typeof cls === "string" && /language-blackbody\b/.test(cls)) {
                    return <BlackbodyChart />;
                  }
                  // A fenced ```segmentedmirror block becomes the drag-to-rotate
                  // 3D hexagonal segmented-mirror model.
                  if (typeof cls === "string" && /language-segmentedmirror\b/.test(cls)) {
                    return <SegmentedMirror />;
                  }
                  // A fenced ```rocketequation block becomes the interactive
                  // Tsiolkovsky Δv-vs-mass-ratio explorer (propellant + slider).
                  if (typeof cls === "string" && /language-rocketequation\b/.test(cls)) {
                    return <RocketEquation />;
                  }
                  // A fenced ```quote block becomes a portrait + historical quote.
                  if (typeof cls === "string" && /language-quote\b/.test(cls)) {
                    // eslint-disable-next-line @typescript-eslint/no-explicit-any
                    const spec = extractText((child as any).props?.children).trim();
                    return <Quotation spec={spec} />;
                  }
                  return <pre>{children}</pre>;
                },
              }}
            >
              {normalizeMath(injectAffiliateLinks(body.replace(STRIP_IMAGE_MARKER, ""), country))}
            </ReactMarkdown>
          </div>
          {streaming && (
            <p className="mt-3 font-sans text-[13px] text-faint animate-pulse" aria-live="polite">
              {t(lang, "composing")}
            </p>
          )}
        </>
      )}

      {!generated && !loading && (
        <p className="mt-4 font-mono text-[10.5px] tracking-[0.04em] text-whisper uppercase">
          Placeholder — set ANTHROPIC_API_KEY for original content
        </p>
      )}

      {/* Test CTA — held back until the article finishes streaming. */}
      {!loading && !streaming && (
        <div className="mt-8">
          {!showQuiz ? (
            <button
              onClick={() => setShowQuiz(true)}
              className="w-full flex justify-between items-center border border-maroon rounded-full px-5 py-3 hover:bg-[#faf3f0] transition-colors"
            >
              <span className="font-sans font-medium text-[14px] text-ink">
                {t(lang, "testYourself")}
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
              lang={lang}
            />
          )}
        </div>
      )}
        </>
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

// Reader depth tiers. The reviewed master (stored internally at the "research"
// rung) is presented as the free, default "Detailed" tier — every written
// article moved down a notch in NAME only, nothing hidden. A separate, gated
// "Research" tier sits above it (rendered specially, not in this list): a
// coming-soon frontier of articles written by working researchers.
const DEPTH_TIERS: { id: Depth; key: string }[] = [
  { id: "skim", key: "skim" },
  { id: "definition", key: "definition" },
  { id: "medium", key: "medium" },
  { id: "research", key: "detailed" }, // the master, badged "Detailed"
];

// Shared pill styling for the depth chips (mirrors ControlRow's buttons).
const chipCls = (active: boolean) =>
  `font-sans text-[11px] px-[10px] py-[4px] rounded-full transition-colors ${
    active
      ? "border-[1.1px] border-ink bg-page text-ink"
      : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
  }`;

function ControlRow({
  labelKey,
  lang,
  items,
  value,
  onSelect,
}: {
  labelKey: string;
  lang: string;
  items: { id: string; label: string }[];
  value: string;
  onSelect: (id: string) => void;
}) {
  return (
    <div className="flex items-center gap-3 flex-wrap">
      <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper w-[42px] shrink-0">
        {t(lang, labelKey)}
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
              {t(lang, it.id)}
            </button>
          );
        })}
      </div>
    </div>
  );
}
