"use client";

import { useState } from "react";

// The numbers 0–99 laid out ten to a row, embedded via a fenced
// ```hundredchart block (see Reader's `pre` override). Written out in a line
// the numerals look like an endless list of new symbols to learn; laid out ten
// to a row they are obviously two copies of 0–9 turning at different speeds —
// the ones digit cycling across every row, the tens digit constant along it.
// That is place value made visible, and it is also where skip counting stops
// being a list to memorise and becomes a shape on a grid.

type Mode = "plain" | "ones" | "tens" | "by2" | "by5" | "by10";

const MODES: { key: Mode; label: string }[] = [
  { key: "plain", label: "plain" },
  { key: "ones", label: "ones digit" },
  { key: "tens", label: "tens digit" },
  { key: "by2", label: "count by 2" },
  { key: "by5", label: "count by 5" },
  { key: "by10", label: "count by 10" },
];

const CAPTION: Record<Mode, string> = {
  plain:
    "Ten numbers to a row. Reading left to right and then down, every row is the digits 0–9 again with a new digit in front — so there are not ninety-nine symbols to learn, there are ten, used twice.",
  ones:
    "Every cell with the same ones digit wears the same colour — ten solid vertical stripes. The ones digit depends only on how far across you are: it runs 0 to 9 and starts over, once per row, forever.",
  tens:
    "Now the same ten colours paint the rows: every cell with the same tens digit matches. The tens digit changes only when the ones digit rolls over from 9 back to 0 — which is exactly what carrying is.",
  by2: "Counting by twos lights up alternate columns — every second number, so the pattern is vertical stripes that never break.",
  by5: "Counting by fives lights up two columns, the 0s and the 5s. Half a row apart, every row the same.",
  by10:
    "Counting by tens lights up a single column: the same ones digit every time, with the tens digit climbing by one each row. Adding ten moves you straight down.",
};

export function HundredChart() {
  const [mode, setMode] = useState<Mode>("plain");

  const lit = (n: number): boolean => {
    if (mode === "by2") return n > 0 && n % 2 === 0;
    if (mode === "by5") return n > 0 && n % 5 === 0;
    if (mode === "by10") return n > 0 && n % 10 === 0;
    return false;
  };

  // One colour per digit value, applied as a translucent wash so it reads on
  // both themes: in "ones" mode every cell with the same ones digit shares a
  // colour, giving ten solid vertical stripes; in "tens" mode the same ten
  // colours paint the rows. The earlier subtle two-tone banding was invisible
  // on some screens — a digit deserves a colour of its own.
  const wash = (n: number): string | undefined => {
    if (mode === "ones") return `hsla(${(n % 10) * 36}, 70%, 50%, 0.32)`;
    if (mode === "tens") return `hsla(${Math.floor(n / 10) * 36}, 70%, 50%, 0.32)`;
    return undefined;
  };

  return (
    <figure className="my-7 not-prose rounded-xl border border-line bg-card p-3 sm:p-4">
      <div className="mb-3 flex flex-wrap items-center gap-1.5">
        {MODES.map((m) => (
          <button
            key={m.key}
            onClick={() => setMode(m.key)}
            aria-pressed={m.key === mode}
            className={`font-sans text-[12px] px-2.5 py-1 rounded-lg border transition-colors ${
              m.key === mode
                ? "border-maroon text-maroon font-medium"
                : "border-line text-muted hover:border-ink hover:text-ink"
            }`}
          >
            {m.label}
          </button>
        ))}
      </div>

      <div className="grid grid-cols-10 gap-[3px]">
        {Array.from({ length: 100 }, (_, n) => {
          const on = lit(n);
          const shaded = wash(n);
          return (
            <div
              key={n}
              style={shaded && !on ? { backgroundColor: shaded } : undefined}
              className={`aspect-square flex items-center justify-center rounded font-mono text-[11px] sm:text-[12.5px] border ${
                on
                  ? "border-[var(--ok-border)] bg-[var(--ok-bg)] text-[var(--ok-text)] font-semibold"
                  : "border-line text-ink"
              } ${n === 0 ? "opacity-45" : ""}`}
            >
              {n}
            </div>
          );
        })}
      </div>

      <figcaption className="mt-3 font-sans text-[13px] leading-relaxed text-muted">
        {CAPTION[mode]}{" "}
        {mode === "plain" && (
          <>Counting itself starts at <span className="text-ink">1</span>; the <span className="text-ink">0</span> is
          dimmed because it is here as a digit, holding a place, rather than as a count.</>
        )}
      </figcaption>
    </figure>
  );
}
