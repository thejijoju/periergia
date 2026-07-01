"use client";

import { useCallback, useEffect, useState } from "react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import { DEPTHS, FORMATS, LEVELS, type Format } from "@/lib/types";
import { useProgress } from "@/lib/progress";
import { VoiceButton } from "./VoiceButton";
import { QuizPanel } from "./QuizPanel";

export interface ReaderNode {
  id: string;
  title: string;
  summary: string;
  trail: string[]; // ancestor titles incl. self
}

export function Reader({ node }: { node: ReaderNode }) {
  const { state, hydrated, markVisited, markCompleted, setPrefs } = useProgress();
  const { depth, level, format } = state.prefs;

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
        body: JSON.stringify({ nodeId: node.id, depth, level, format }),
      }).then((r) => r.json());
      setBody(res.body ?? "");
      setGenerated(!!res.generated);
    } finally {
      setLoading(false);
    }
  }, [node.id, depth, level, format]);

  useEffect(() => {
    if (hydrated) load();
  }, [hydrated, load]);

  const isVisual = format === "video" || format === "3d";
  const formatMeta = FORMATS.find((f) => f.id === format);
  const breadcrumb = node.trail.slice(0, -1).join(" › ").toUpperCase();

  return (
    <article className="max-w-[680px] mx-auto px-1">
      {/* Breadcrumb */}
      <div className="flex items-center gap-3 text-[11px]">
        <span className="font-mono tracking-[0.06em] text-faint uppercase">
          {breadcrumb || "PERIERGIA"}
        </span>
      </div>

      {/* Title + meta */}
      <h1 className="mt-2 font-sans font-bold text-[30px] leading-[1.1] tracking-[-0.01em] text-ink">
        {node.title}
      </h1>
      {node.summary && (
        <p className="mt-2 font-sans italic text-[14px] text-muted">{node.summary}</p>
      )}

      {/* Format pills (Read / Listen / Watch / See) */}
      <div className="mt-5 flex flex-wrap gap-[7px]">
        {FORMATS.map((f) => {
          const active = f.id === format;
          return (
            <button
              key={f.id}
              onClick={() => setPrefs({ format: f.id as Format })}
              className={`font-sans text-[12.5px] px-4 py-[7px] rounded-full transition-colors ${
                active
                  ? "text-white bg-maroon"
                  : "text-ink border border-[rgba(33,29,24,.25)] hover:border-ink"
              } ${!f.ready ? "opacity-60" : ""}`}
            >
              {f.label}
              {!f.ready && <span className="ml-1 text-[10px] align-super">soon</span>}
            </button>
          );
        })}
      </div>

      {/* Depth + Level controls */}
      <div className="mt-5 space-y-3">
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

      <hr className="my-6 border-line" />

      {/* Body */}
      {loading ? (
        <p className="font-sans italic text-[15px] text-faint">Composing this entry…</p>
      ) : isVisual && formatMeta && !formatMeta.ready ? (
        <div className="rounded-2xl border border-line bg-[#faf8f4] px-6 py-10 text-center">
          <p className="font-sans text-[16px] text-ink">
            “{formatMeta.label}” is coming soon.
          </p>
          <p className="mt-2 font-sans italic text-[13px] text-muted">
            v1 supports Read and Listen. Visual and 3D formats arrive as the next “format plugins.”
          </p>
          <button
            onClick={() => setPrefs({ format: "text" })}
            className="mt-4 font-sans text-[13px] text-maroon underline underline-offset-2"
          >
            Back to reading
          </button>
        </div>
      ) : (
        <>
          {format === "voice" && (
            <div className="mb-5">
              <VoiceButton text={body} />
            </div>
          )}
          <div className="prose-reading dropcap font-sans text-[15px] leading-[1.7] max-w-none">
            <ReactMarkdown remarkPlugins={[remarkGfm]}>{body}</ReactMarkdown>
          </div>
        </>
      )}

      {!generated && !loading && !isVisual && (
        <p className="mt-4 font-mono text-[10.5px] tracking-[0.04em] text-whisper uppercase">
          Placeholder — set ANTHROPIC_API_KEY for original content
        </p>
      )}

      {/* Test CTA */}
      {!loading && !isVisual && (
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
