"use client";

import { useMemo, useState } from "react";

// ── Inline checkpoint quiz ────────────────────────────────────────────────
// A fenced ```checkpoint block in article markdown becomes a short set of
// self-test questions rendered in the flow of the text, so the reader
// retrieves each idea where they just learned it instead of only at the end
// of the chapter. Retrieval beats rereading; a checkpoint asks 2-5 questions
// around one concept, attacking it from different angles.
//
// Spec format (line-based; a line that doesn't start a new key continues the
// previous value). Questions are separated by a line of three or more dashes:
//
//   q: Why can't a thin shell cool itself by expanding?
//   a*: Expansion barely moves its radius, so the overlying weight is unchanged
//   a: Degenerate pressure does not depend on temperature
//   x: True of the core, but this shell is non-degenerate — the runaway here
//     is geometric, not a matter of the equation of state.
//   a: The envelope reflects the released heat back onto the shell
//   x: Envelopes are not mirrors; the released energy does escape. What fails
//     is the cooling that expansion normally provides.
//   hint: What sets the pressure at the shell — the shell itself, or what sits on top of it?
//   why: Pressure at the shell is hydrostatic — the weight of everything above,
//     which depends on radius. A thin shell can double its thickness while its
//     radius barely moves, so expansion changes nothing.
//   ---
//   q: A second question on the same idea...
//   a*: ...
//
// Keys:
//   q:     the question
//   a:     an option;  a*:  the correct option
//   x:     why the option immediately above is wrong (optional, per option)
//   hint:  shown on request before answering
//   why:   shown once the question is answered correctly
//
// Wrong picks stay marked, reveal their own `x:` explanation, and the reader
// keeps trying (learning-first, not exam-first). A single-question spec with
// no `x:` lines is still valid, so earlier articles render unchanged.

interface CheckpointQuestion {
  question: string;
  options: string[];
  wrongWhy: (string | undefined)[];
  answerIndex: number;
  hint?: string;
  why?: string;
}

function parseQuestion(raw: string): CheckpointQuestion | null {
  const lines = raw.split("\n");
  let question = "";
  const options: string[] = [];
  const wrongWhy: (string | undefined)[] = [];
  let answerIndex = -1;
  let hint = "";
  let why = "";
  // Which value the current continuation lines append to.
  let cursor: "q" | "a" | "x" | "hint" | "why" | null = null;

  const append = (base: string, extra: string) =>
    base ? `${base} ${extra.trim()}` : extra.trim();

  for (const line of lines) {
    const m = line.match(/^\s*(q|a\*?|x|hint|why)\s*:\s*(.*)$/i);
    if (m) {
      const key = m[1].toLowerCase();
      const val = m[2].trim();
      if (key === "q") {
        question = append(question, val);
        cursor = "q";
      } else if (key === "a" || key === "a*") {
        if (key === "a*") answerIndex = options.length;
        options.push(val);
        wrongWhy.push(undefined);
        cursor = "a";
      } else if (key === "x") {
        // Attaches to the option most recently declared.
        if (options.length) {
          wrongWhy[options.length - 1] = append(wrongWhy[options.length - 1] ?? "", val);
          cursor = "x";
        }
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
      else if (cursor === "x" && options.length)
        wrongWhy[options.length - 1] = append(wrongWhy[options.length - 1] ?? "", line);
      else if (options.length)
        options[options.length - 1] = append(options[options.length - 1], line);
    }
  }

  if (!question || options.length < 2 || answerIndex < 0) return null;
  return {
    question,
    options,
    wrongWhy,
    answerIndex,
    hint: hint || undefined,
    why: why || undefined,
  };
}

function parseSpec(raw: string): CheckpointQuestion[] {
  return raw
    .split(/^\s*-{3,}\s*$/m)
    .map(parseQuestion)
    .filter((q): q is CheckpointQuestion => q !== null);
}

export function CheckpointQuiz({ spec }: { spec: string }) {
  const questions = useMemo(() => parseSpec(spec), [spec]);
  const [index, setIndex] = useState(0);
  const [tried, setTried] = useState<Set<number>>(new Set());
  const [solved, setSolved] = useState(false);
  const [showHint, setShowHint] = useState(false);
  // One entry per answered question: true if it was right on the first try.
  const [firstTry, setFirstTry] = useState<boolean[]>([]);
  const [finished, setFinished] = useState(false);

  // A malformed spec renders as nothing rather than a broken card.
  if (!questions.length) return null;

  const current = questions[index];
  const total = questions.length;
  const isLast = index === total - 1;

  const pick = (i: number) => {
    if (solved) return;
    if (i === current.answerIndex) {
      setSolved(true);
      setFirstTry((prev) => [...prev, tried.size === 0]);
    } else {
      setTried((prev) => new Set(prev).add(i));
    }
  };

  const advance = () => {
    if (isLast) {
      setFinished(true);
      return;
    }
    setIndex((i) => i + 1);
    setTried(new Set());
    setSolved(false);
    setShowHint(false);
  };

  const wrongPicked = tried.size > 0 && !solved;
  const score = firstTry.filter(Boolean).length;

  if (finished) {
    const perfect = score === total;
    return (
      <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
        <div className="px-4 sm:px-5 pt-3.5 pb-1 flex items-center gap-2">
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">
            ✦ Checkpoint
          </span>
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-[var(--ok-text)]">
            · complete
          </span>
        </div>
        <div className="px-4 sm:px-5 pb-4">
          <p className="font-sans text-[15px] leading-relaxed text-ink">
            <span className="font-semibold">
              {score} of {total}
            </span>{" "}
            right on the first try.
          </p>
          <p className="mt-1 font-sans text-[13px] leading-relaxed text-muted">
            {perfect
              ? "Solid — the idea is in place. Carry on."
              : "Worth rereading the section above before moving on: the ones that needed a second attempt are the ones that will not stick."}
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
      <div className="px-4 sm:px-5 pt-3.5 pb-1 flex items-center gap-2">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">
          ✦ Checkpoint
        </span>
        {total > 1 && (
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper">
            · {index + 1} / {total}
          </span>
        )}
        {solved && (
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-[var(--ok-text)]">
            · correct
          </span>
        )}
      </div>
      <div className="px-4 sm:px-5 pb-4">
        <p className="font-sans text-[15px] leading-relaxed text-ink mb-3">{current.question}</p>
        <div className="space-y-2">
          {current.options.map((opt, i) => {
            const isCorrect = i === current.answerIndex;
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
              <div key={i}>
                <button
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
                {/* Why this particular wrong answer is wrong — shown the moment
                    it is picked, which is when the reader is asking. */}
                {wasTried && current.wrongWhy[i] && (
                  <p className="mt-1.5 mb-1 pl-4 pr-2 font-sans text-[13px] leading-relaxed text-muted border-l-2 border-[var(--bad-border)]">
                    {current.wrongWhy[i]}
                  </p>
                )}
              </div>
            );
          })}
        </div>

        {wrongPicked && (
          <p className="mt-2.5 font-sans text-[13px] font-semibold text-[var(--bad-text)]">
            Not quite — try again.
          </p>
        )}

        {solved && current.why && (
          <p className="mt-2.5 font-sans text-[13px] leading-relaxed text-muted">{current.why}</p>
        )}

        {solved && (
          <button
            onClick={advance}
            className="mt-3 font-sans text-[13px] font-medium text-maroon hover:underline underline-offset-2"
          >
            {isLast ? (total > 1 ? "See score →" : "Done →") : "Next question →"}
          </button>
        )}

        {!solved && current.hint && (
          <div className="mt-2.5">
            {showHint ? (
              <p className="font-sans text-[13px] leading-relaxed text-muted">
                <span className="font-semibold">Hint:</span> {current.hint}
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
