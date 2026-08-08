"use client";

import { useMemo, useState } from "react";

// ── Inline checkpoint quiz ────────────────────────────────────────────────
// A fenced ```checkpoint block in article markdown becomes a one-question
// self-test rendered in the flow of the text, so the reader checks each idea
// where they just learned it instead of only at the end of the chapter.
//
// Spec format (line-based; a line that doesn't start a new key continues the
// previous value):
//
//   q: Why can't a thin shell cool itself by expanding?
//   a*: Expansion barely moves its radius, so the overlying weight is unchanged
//   a: Degenerate pressure does not depend on temperature
//   a: The envelope reflects the released heat back onto the shell
//   a: Helium burning has no temperature dependence
//   hint: What sets the pressure at the shell — the shell itself, or what sits on top of it?
//   why: Pressure at the shell is hydrostatic — the weight of everything above,
//     which depends on radius. A thin shell can double its thickness while its
//     radius barely moves, so expansion changes nothing.
//
// `a*:` marks the correct option. Wrong picks stay marked and the reader can
// keep trying (learning-first, not exam-first); the explanation appears once
// the right answer is found.

interface CheckpointSpec {
  question: string;
  options: string[];
  answerIndex: number;
  hint?: string;
  why?: string;
}

function parseSpec(raw: string): CheckpointSpec | null {
  const lines = raw.split("\n");
  let question = "";
  const options: string[] = [];
  let answerIndex = -1;
  let hint = "";
  let why = "";
  // Which value the current continuation lines append to.
  let cursor: "q" | "a" | "hint" | "why" | null = null;

  const append = (base: string, extra: string) =>
    base ? `${base} ${extra.trim()}` : extra.trim();

  for (const line of lines) {
    const m = line.match(/^\s*(q|a\*?|hint|why)\s*:\s*(.*)$/i);
    if (m) {
      const key = m[1].toLowerCase();
      const val = m[2].trim();
      if (key === "q") {
        question = append(question, val);
        cursor = "q";
      } else if (key === "a" || key === "a*") {
        if (key === "a*") answerIndex = options.length;
        options.push(val);
        cursor = "a";
      } else if (key === "hint") {
        hint = append(hint, val);
        cursor = "hint";
      } else {
        why = append(why, val);
        cursor = "why";
      }
    } else if (line.trim() && cursor) {
      // Continuation of the previous value.
      if (cursor === "q") question = append(question, line);
      else if (cursor === "hint") hint = append(hint, line);
      else if (cursor === "why") why = append(why, line);
      else if (options.length) options[options.length - 1] = append(options[options.length - 1], line);
    }
  }

  if (!question || options.length < 2 || answerIndex < 0) return null;
  return { question, options, answerIndex, hint: hint || undefined, why: why || undefined };
}

export function CheckpointQuiz({ spec }: { spec: string }) {
  const parsed = useMemo(() => parseSpec(spec), [spec]);
  const [tried, setTried] = useState<Set<number>>(new Set());
  const [solved, setSolved] = useState(false);
  const [showHint, setShowHint] = useState(false);

  // A malformed spec renders as nothing rather than a broken card.
  if (!parsed) return null;

  const pick = (i: number) => {
    if (solved) return;
    if (i === parsed.answerIndex) {
      setSolved(true);
    } else {
      setTried((prev) => new Set(prev).add(i));
    }
  };

  const wrongPicked = tried.size > 0 && !solved;

  return (
    <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
      <div className="px-4 sm:px-5 pt-3.5 pb-1 flex items-center gap-2">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">
          ✦ Checkpoint
        </span>
        {solved && (
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-[var(--ok-text)]">
            · passed
          </span>
        )}
      </div>
      <div className="px-4 sm:px-5 pb-4">
        <p className="font-sans text-[15px] leading-relaxed text-ink mb-3">{parsed.question}</p>
        <div className="space-y-2">
          {parsed.options.map((opt, i) => {
            const isCorrect = i === parsed.answerIndex;
            const wasTried = tried.has(i);
            let tone: string;
            let badge: string | null = null;
            if (solved && isCorrect) {
              tone = "border-[var(--ok-border)] bg-[var(--ok-bg)] text-[var(--ok-text)] font-medium";
              badge = "✓";
            } else if (wasTried) {
              tone = "border-[var(--bad-border)] bg-[var(--bad-bg)] text-[var(--bad-text)]";
              badge = "✗";
            } else if (solved) {
              tone = "border-line text-faint";
            } else {
              tone = "border-line text-ink hover:border-ink";
            }
            return (
              <button
                key={i}
                disabled={solved || wasTried}
                onClick={() => pick(i)}
                className={`flex w-full items-center gap-3 text-left font-sans text-[14px] px-4 py-2 rounded-xl border ${tone} transition-colors disabled:cursor-default`}
              >
                <span className="font-mono text-[11px] text-numeral shrink-0">
                  {String.fromCharCode(65 + i)}
                </span>
                <span className="flex-1">{opt}</span>
                {badge && <span className="shrink-0 font-sans text-[13px]">{badge}</span>}
              </button>
            );
          })}
        </div>

        {wrongPicked && (
          <p className="mt-2.5 font-sans text-[13px] font-semibold text-[var(--bad-text)]">
            Not quite — try again.
          </p>
        )}

        {solved && parsed.why && (
          <p className="mt-2.5 font-sans text-[13px] leading-relaxed text-muted">{parsed.why}</p>
        )}

        {!solved && parsed.hint && (
          <div className="mt-2.5">
            {showHint ? (
              <p className="font-sans text-[13px] leading-relaxed text-muted">
                <span className="font-semibold">Hint:</span> {parsed.hint}
              </p>
            ) : (
              <button
                onClick={() => setShowHint(true)}
                className="font-sans text-[13px] text-whisper hover:text-maroon underline underline-offset-2"
              >
                Show hint
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
