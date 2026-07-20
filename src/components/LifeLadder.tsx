"use client";

import { useState } from "react";

// An interactive "great filter" ladder, embedded in an article via a fenced
// ```lifeladder block (see Reader's `pre` override). Reaching an observer is not
// one improbable step but a SERIES — simple life, then the complex (eukaryotic)
// cell, then intelligence — each with its own probability, multiplied together.
// The startling possibility: the origin can be EASY (simple life everywhere)
// while a LATER step is fantastically hard (the eukaryotic leap took ~2 billion
// years and may be a fluke), leaving a universe full of microbial slime but
// nearly empty of anyone to talk to. Slide each step's odds and watch the
// cumulative fraction fall, and which single step is the tightest filter.
// Log-scale fractions; currentColor theming; first render deterministic.

type Rung = { label: string; e: number }; // e = log10(step probability)
const INIT: Rung[] = [
  { label: "Simple life", e: -0.3 }, // ~0.5 — origin looks easy
  { label: "Complex cell", e: -3 }, //  ~0.001 — the eukaryotic fluke
  { label: "Intelligence", e: -2 }, //  ~0.01
];

const F_MIN = 1e-9; // floor of the log fraction axis
const X0 = 62, X1 = 408, Y0 = 22, Y1 = 172;
const py = (f: number) => Y0 + (-Math.log10(Math.max(F_MIN, f)) / -Math.log10(F_MIN)) * (Y1 - Y0);

function pct(f: number): string {
  if (f >= 0.01) return `${(f * 100).toFixed(0)}%`;
  if (f >= 1e-6) return `1 in ${Math.round(1 / f).toLocaleString("en-US")}`;
  const e = Math.floor(Math.log10(f));
  return `${(f / Math.pow(10, e)).toFixed(1)}×10^${e}`;
}

export function LifeLadder() {
  const [rungs, setRungs] = useState<Rung[]>(INIT);
  const p = rungs.map((r) => Math.pow(10, r.e));
  // cumulative fraction reaching each rung; index 0 = "habitable" (fraction 1)
  const levels = [1, ...p.reduce<number[]>((a, pi, i) => [...a, (i ? a[i - 1] : 1) * pi], [])];
  const N = levels.length; // 4 points: habitable + 3 rungs
  const lx = (i: number) => X0 + (i / (N - 1)) * (X1 - X0);
  const filterStep = p.indexOf(Math.min(...p)); // step (0..2) with smallest odds
  const labels = ["habitable", ...rungs.map((r) => r.label)];

  const setE = (i: number, val: number) =>
    setRungs((rs) => rs.map((r, j) => (j === i ? { ...r, e: val } : r)));

  return (
    <figure className="ll-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 205" className="w-full h-auto" role="img"
        aria-label={`Multiplying the step odds, about ${pct(levels[N - 1])} of habitable worlds reach intelligence; the tightest filter is the ${rungs[filterStep].label} step.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>
        {[0, -3, -6, -9].map((l) => (
          <text key={l} className="text-faint" x={X0 - 4} y={py(Math.pow(10, l)) + 3} textAnchor="end" fill="currentColor"
            fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">
            {l === 0 ? "100%" : `10^${l}`}
          </text>
        ))}

        {/* descending staircase; the step with the worst odds is the filter (maroon) */}
        {levels.slice(1).map((f, i) => (
          <line key={i} className={i === filterStep ? "text-maroon" : "text-ink"}
            x1={lx(i)} y1={py(levels[i])} x2={lx(i + 1)} y2={py(f)}
            stroke="currentColor" strokeWidth={2.6} strokeLinejoin="round" />
        ))}

        {levels.map((f, i) => {
          const onFilter = i === filterStep + 1;
          return (
            <g key={i}>
              <circle className={i === 0 ? "text-purple" : onFilter ? "text-maroon" : "text-ink"} cx={lx(i)} cy={py(f)}
                r={4} fill="currentColor" />
              <text className={onFilter ? "text-maroon" : "text-faint"} x={lx(i)} y={py(f) - 8} textAnchor="middle"
                fill="currentColor" fontSize={8} fontWeight={700}
                fontFamily="ui-sans-serif, system-ui, sans-serif">{pct(f)}</text>
              <text className="text-muted" x={lx(i)} y={Y1 + 14} textAnchor="middle" fill="currentColor" fontSize={8.5}
                fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">{labels[i]}</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Simple life on <span className="text-purple font-semibold">{pct(levels[1])}</span> of worlds, but minds on only{" "}
        <span className="text-maroon font-semibold">{pct(levels[N - 1])}</span> — the{" "}
        <strong className="text-maroon">{rungs[filterStep].label}</strong> step is the tightest filter.
      </p>

      <div className="mt-3 space-y-2">
        {rungs.map((r, i) => (
          <label key={i} className="block">
            <span className="flex justify-between font-sans text-[12px] text-muted">
              <span>{r.label} — odds of clearing this step</span>
              <span className="tabular-nums">{pct(Math.pow(10, r.e))}</span>
            </span>
            <input type="range" min={-6} max={0} step={0.1} value={r.e}
              onChange={(ev) => setE(i, Number(ev.target.value))}
              aria-label={`Probability of the ${r.label} step`} className="mt-1 w-full"
              style={{ accentColor: i === filterStep ? "var(--c-maroon)" : "var(--c-purple)" }} />
          </label>
        ))}
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        &ldquo;How hard is life?&rdquo; is not one number but several. Reaching an observer means clearing a <em>series</em> of steps — the origin of simple cells, the leap to the complex (eukaryotic) cell, the evolution of intelligence — and the fraction of worlds that make it all the way is the product of the separate odds. The warning written in Earth&rsquo;s own rocks is that the steps need not be equally hard: life arose here within a few hundred million years (the origin looks <span className="text-purple">easy</span>), yet the jump from simple to complex cells took nearly <em>two billion years</em> — almost half of life&rsquo;s entire history — and seems to trace to a single freak event, one cell swallowing another to become the mitochondrion. If that eukaryotic leap is the <span className="text-maroon">tightest filter</span>, the galaxy could be full of microbial slime and nearly empty of company: life everywhere, minds almost nowhere. Slide the odds and watch where the ladder pinches — that pinch is the difference between a crowded cosmos and a lonely one.
      </figcaption>
    </figure>
  );
}
