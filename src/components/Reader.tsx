"use client";

import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { DEPTHS, LEVELS } from "@/lib/types";
import { getMode, type Mode } from "@/lib/modes";
import { useProgress } from "@/lib/progress";
import { LearningModeRail } from "./LearningModeRail";
import { VoiceButton } from "./VoiceButton";
import { QuizPanel } from "./QuizPanel";

export interface Crumb {
  label: string;
  href?: string; // omitted for the current page
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

function extractText(node: React.ReactNode): string {
  if (typeof node === "string" || typeof node === "number") return String(node);
  if (Array.isArray(node)) return node.map(extractText).join("");
  if (node && typeof node === "object" && "props" in node) {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return extractText((node as any).props?.children);
  }
  return "";
}

export function Reader({ node }: { node: ReaderNode }) {
  const { state, hydrated, markVisited, markCompleted, setPrefs } = useProgress();
  const { depth, level, mode } = state.prefs;
  const spec = getMode(mode);

  const [body, setBody] = useState("");
  const [loading, setLoading] = useState(true);
  const [generated, setGenerated] = useState(false);
  const [showQuiz, setShowQuiz] = useState(false);

  useEffect(() => {
    markVisited(node.id);
    setShowQuiz(false);
  }, [node.id, markVisited]);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const res = await fetch("/api/content", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nodeId: node.id, depth, level, mode }),
      }).then((r) => r.json());
      setBody(res.body ?? "");
      setGenerated(!!res.generated);
    } finally {
      setLoading(false);
    }
  }, [node.id, depth, level, mode]);

  useEffect(() => {
    if (hydrated) load();
  }, [hydrated, load]);

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
              <Link href={c.href} className="hover:text-purple transition-colors">
                {c.label}
              </Link>
            ) : (
              <span className="text-ink font-medium">{c.label}</span>
            )}
          </span>
        ))}
      </nav>

      {/* Title */}
      <h1 className="mt-4 font-sans font-bold text-[32px] leading-[1.12] tracking-[-0.02em] text-ink">
        {node.title}
      </h1>
      {node.summary && (
        <p className="mt-2 font-sans text-[15px] text-muted">{node.summary}</p>
      )}

      {/* Learning-mode rail — every way to experience this topic */}
      <div className="mt-3">
        <LearningModeRail active={mode} onSelect={(id: Mode) => setPrefs({ mode: id })} />
      </div>

      {/* Depth + Level controls */}
      <div className="mt-4 space-y-2.5">
        <ControlRow
          label="Depth"
          items={DEPTHS}
          value={depth}
          onSelect={(id) => setPrefs({ depth: id as typeof depth })}
        />
        <ControlRow
          label="Level"
          items={LEVELS}
          value={level}
          onSelect={(id) => setPrefs({ level: id as typeof level })}
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
              remarkPlugins={[remarkGfm]}
              components={{
                h2: ({ children }) => <h2 id={headingId(children)}>{children}</h2>,
                h3: ({ children }) => <h3 id={headingId(children)}>{children}</h3>,
              }}
            >
              {body}
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
              level={level}
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
                  ? "border-[1.1px] border-ink bg-white text-ink"
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
