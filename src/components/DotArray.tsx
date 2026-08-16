"use client";

import { useState } from "react";

// A rows-by-columns array of dots with a "turn it" button, embedded via a
// fenced ```dotarray block whose body is "5x3". Turning the tray transposes
// the array — same dots, nothing added or removed — which is the entire proof
// that order does not matter in multiplication. The reader performs the proof
// with one click instead of being told it.

export function DotArray({ spec }: { spec: string }) {
  const m = spec.trim().match(/^(\d+)\s*[x×]\s*(\d+)$/i);
  const [turned, setTurned] = useState(false);
  if (!m) return null;
  const a = Number(m[1]);
  const b = Number(m[2]);
  if (a < 1 || b < 1 || a > 10 || b > 10) return null;

  const rows = turned ? b : a;
  const cols = turned ? a : b;
  const total = a * b;
  const R = 7;
  const GAP = 22;
  const w = cols * GAP + 14;
  const h = rows * GAP + 14;

  return (
    <figure className="my-6 not-prose rounded-xl border border-line bg-card p-4">
      <div className="flex flex-wrap items-center gap-4">
        <svg
          viewBox={`0 0 ${w} ${h}`}
          style={{ width: w, maxWidth: "60%" }}
          className="h-auto"
          role="img"
          aria-label={`${rows} rows of ${cols} dots — ${total} dots in all.`}
        >
          {Array.from({ length: rows }, (_, r) =>
            Array.from({ length: cols }, (_, c) => (
              <circle
                key={`${r}-${c}`}
                cx={c * GAP + 14}
                cy={r * GAP + 14}
                r={R}
                fill="currentColor"
                className="text-maroon"
                opacity={0.85}
              />
            )),
          )}
        </svg>
        <div className="flex-1 min-w-[150px]">
          <p className="font-sans text-[14.5px] text-ink font-medium">
            {rows} rows of {cols} = {total}
          </p>
          <p className="mt-1 font-sans text-[13px] leading-relaxed text-muted">
            {turned
              ? `Same ${total} dots — only the description changed.`
              : `Now turn the tray and watch what happens to the ${total} dots.`}
          </p>
          <button
            onClick={() => setTurned((v) => !v)}
            className="mt-2.5 font-sans text-[13px] font-medium px-3 py-1.5 rounded-xl border border-line text-ink hover:border-ink transition-colors"
          >
            Turn it a quarter turn ↻
          </button>
        </div>
      </div>
    </figure>
  );
}
