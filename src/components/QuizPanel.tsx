"use client";

import { useEffect, useState } from "react";
import type { GradeResult, Level, QuizQuestion } from "@/lib/types";

interface OpenGrade extends GradeResult {
  loading?: boolean;
}

export function QuizPanel({
  nodeId,
  level,
  title,
  onClose,
  onPassed,
}: {
  nodeId: string;
  level: Level;
  title: string;
  onClose: () => void;
  onPassed: () => void;
}) {
  const [questions, setQuestions] = useState<QuizQuestion[] | null>(null);
  const [loading, setLoading] = useState(true);
  const [picks, setPicks] = useState<Record<string, number>>({});
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [grades, setGrades] = useState<Record<string, OpenGrade>>({});
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    let alive = true;
    setLoading(true);
    fetch("/api/quiz", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ action: "quiz", nodeId, level }),
    })
      .then((r) => r.json())
      .then((d) => {
        if (alive) {
          setQuestions(d.questions ?? []);
          setLoading(false);
        }
      })
      .catch(() => alive && setLoading(false));
    return () => {
      alive = false;
    };
  }, [nodeId, level]);

  const gradeOpen = async (q: QuizQuestion) => {
    const answer = answers[q.id] ?? "";
    setGrades((g) => ({ ...g, [q.id]: { ...(g[q.id] ?? { correct: false, score: 0, feedback: "" }), loading: true } }));
    const res = await fetch("/api/quiz", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ action: "grade", question: q, answer }),
    }).then((r) => r.json());
    setGrades((g) => ({ ...g, [q.id]: { ...res, loading: false } }));
  };

  const submit = async () => {
    setSubmitted(true);
    if (!questions) return;
    // grade all open questions in parallel
    await Promise.all(questions.filter((q) => q.type === "open").map((q) => gradeOpen(q)));
  };

  const score = () => {
    if (!questions) return { got: 0, total: 0 };
    let got = 0;
    let total = 0;
    for (const q of questions) {
      total++;
      if (q.type === "mcq") {
        if (picks[q.id] === q.answerIndex) got++;
      } else {
        if (grades[q.id]?.correct) got++;
      }
    }
    return { got, total };
  };

  const { got, total } = score();
  const allOpenGraded =
    !questions || questions.filter((q) => q.type === "open").every((q) => grades[q.id] && !grades[q.id].loading);

  useEffect(() => {
    if (submitted && allOpenGraded && total > 0 && got / total >= 0.6) onPassed();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [submitted, allOpenGraded]);

  return (
    <div className="border border-maroon rounded-2xl p-5 sm:p-6 bg-page">
      <div className="flex items-baseline justify-between mb-4">
        <h2 className="font-sans font-semibold text-[18px] text-ink">Test yourself — {title}</h2>
        <button onClick={onClose} className="font-sans text-[13px] text-whisper hover:text-maroon">
          Close
        </button>
      </div>

      {loading && <p className="font-sans italic text-[14px] text-faint">Preparing your questions…</p>}

      {!loading && questions && (
        <div className="space-y-6">
          {questions.map((q, i) => (
            <div key={q.id}>
              <p className="font-sans text-[15px] text-ink mb-2">
                <span className="font-mono text-[11px] text-numeral mr-2">{String(i + 1).padStart(2, "0")}</span>
                {q.prompt}
              </p>

              {q.type === "mcq" && q.options && (
                <div className="space-y-2">
                  {q.options.map((opt, oi) => {
                    const chosen = picks[q.id] === oi;
                    const reveal = submitted;
                    const correct = oi === q.answerIndex;
                    const tone = reveal
                      ? correct
                        ? "border-maroon bg-[#faf3f0]"
                        : chosen
                          ? "border-line opacity-60 line-through"
                          : "border-line"
                      : chosen
                        ? "border-ink"
                        : "border-line hover:border-ink";
                    return (
                      <button
                        key={oi}
                        disabled={submitted}
                        onClick={() => setPicks((p) => ({ ...p, [q.id]: oi }))}
                        className={`block w-full text-left font-sans text-[14px] px-4 py-2 rounded-xl border ${tone} transition-colors`}
                      >
                        {opt}
                      </button>
                    );
                  })}
                </div>
              )}

              {q.type === "open" && (
                <div>
                  <textarea
                    value={answers[q.id] ?? ""}
                    onChange={(e) => setAnswers((a) => ({ ...a, [q.id]: e.target.value }))}
                    disabled={submitted}
                    rows={3}
                    placeholder="Write your answer…"
                    className="w-full font-sans text-[14px] border border-line rounded-xl px-4 py-3 outline-none focus:border-ink disabled:opacity-70"
                  />
                  {submitted && grades[q.id] && !grades[q.id].loading && (
                    <p
                      className={`mt-2 font-sans text-[13px] ${
                        grades[q.id].correct ? "text-maroon" : "text-muted"
                      }`}
                    >
                      {grades[q.id].correct ? "✓ " : "→ "}
                      {grades[q.id].feedback}
                    </p>
                  )}
                  {submitted && grades[q.id]?.loading && (
                    <p className="mt-2 font-sans italic text-[13px] text-faint">Grading…</p>
                  )}
                </div>
              )}
            </div>
          ))}

          {!submitted ? (
            <button
              onClick={submit}
              className="font-sans text-[14px] text-white bg-maroon rounded-full px-6 py-2.5 hover:opacity-90"
            >
              Submit answers
            </button>
          ) : (
            allOpenGraded && (
              <div className="border-t border-line pt-4">
                <p className="font-sans text-[16px] text-ink">
                  You scored <strong>{got}</strong> / {total}.{" "}
                  {got / total >= 0.6 ? "Well done — entry complete." : "Review the entry and try again."}
                </p>
              </div>
            )
          )}
        </div>
      )}
    </div>
  );
}
