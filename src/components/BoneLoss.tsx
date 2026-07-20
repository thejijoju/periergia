"use client";

import { useState } from "react";

// An interactive bone-loss explorer, embedded in an article via a fenced
// ```boneloss block (see Reader's `pre` override). Unloaded weight-bearing bone
// dissolves at ~1.5%/month in weightlessness — a postmenopausal year compressed
// into thirty days. Slide the mission duration and the daily-exercise
// countermeasure and watch the cumulative loss climb: exercise bends the curve
// down but never flat, and a Mars-length trip still dissolves a third of the
// skeleton. Markers for a 6-month ISS increment and a 30-month Mars round trip.
// currentColor theming (light/dark); first render deterministic (Mars, ~1 h/day).

const BASE_RATE = 1.5; // %/month, uncorrected loss of weight-bearing bone
const MAX_REDUCTION = 0.35; // exercise cuts the rate by up to 35% at 2.5 h/day
const MONTH_MAX = 36;
const LOSS_MAX = 50; // % (y-axis top)

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (m: number) => X0 + (m / MONTH_MAX) * (X1 - X0);
const py = (pct: number) => Y1 - Math.min(1, pct / LOSS_MAX) * (Y1 - Y0);

// Monthly loss rate at exercise level h (hours/day).
const rate = (h: number) => BASE_RATE * (1 - MAX_REDUCTION * (h / 2.5));
const lossAt = (months: number, h: number) => rate(h) * months;

function linePath(h: number): string {
  return `M${px(0).toFixed(1)} ${py(0).toFixed(1)}L${px(MONTH_MAX).toFixed(1)} ${py(lossAt(MONTH_MAX, h)).toFixed(1)}`;
}

export function BoneLoss() {
  const [months, setMonths] = useState(30);
  const [h, setH] = useState(1);
  const loss = lossAt(months, h);
  const lossNone = lossAt(months, 0);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Over ${months} months with ${h.toFixed(1)} hours of daily exercise, weight-bearing bone loss reaches ${loss.toFixed(0)}%.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* mission markers */}
        {[{ m: 6, label: "ISS" }, { m: 30, label: "Mars" }].map((k) => (
          <g key={k.label}>
            <line className="text-faint" x1={px(k.m)} y1={Y0} x2={px(k.m)} y2={Y1}
              stroke="currentColor" strokeWidth={1} strokeDasharray="2 4" opacity={0.6} />
            <text className="text-faint" x={px(k.m)} y={Y0 + 8} textAnchor="middle" fill="currentColor"
              fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{k.label}</text>
          </g>
        ))}

        {/* uncorrected (dashed) and current (bold) */}
        <path className="text-maroon" d={linePath(0)} fill="none" stroke="currentColor" strokeWidth={1.4}
          strokeDasharray="4 3" opacity={0.6} />
        <path className="text-maroon" d={linePath(h)} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />

        {/* dot */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(months)} y1={py(loss)} x2={px(months)} y2={Y1} />
          <line x1={X0} y1={py(loss)} x2={px(months)} y2={py(loss)} />
        </g>
        <circle className="text-maroon" cx={px(months)} cy={py(loss)} r={4.5} fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">months in weightlessness ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            weight-bearing bone lost (%)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(12)} y={Y1 + 12} textAnchor="middle">12</text>
          <text x={px(24)} y={Y1 + 12} textAnchor="middle">24</text>
          <text x={px(36)} y={Y1 + 12} textAnchor="middle">36</text>
          <text x={X0 - 4} y={py(40) + 3} textAnchor="end">40%</text>
          <text x={X0 - 4} y={py(20) + 3} textAnchor="end">20%</text>
          <text x={X0 - 4} y={py(0) + 3} textAnchor="end">0</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="tabular-nums">{months}</strong> months · <strong className="tabular-nums">{h.toFixed(1)} h/day</strong> exercise →{" "}
        <span className="font-semibold text-maroon">{loss.toFixed(0)}%</span> of weight-bearing bone gone
        {h > 0 && <> (vs <strong>{lossNone.toFixed(0)}%</strong> with no exercise)</>}.
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Mission length</span><span className="tabular-nums">{months} mo</span></span>
          <input type="range" min={1} max={MONTH_MAX} step={1} value={months} onChange={(e) => setMonths(Number(e.target.value))}
            aria-label="Mission length in months" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Daily exercise</span><span className="tabular-nums">{h.toFixed(1)} h</span></span>
          <input type="range" min={0} max={2.5} step={0.1} value={h} onChange={(e) => setH(Number(e.target.value))}
            aria-label="Daily exercise hours" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        <button type="button" onClick={() => { setMonths(6); setH(2.5); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          ISS increment (6 mo, 2.5 h)
        </button>
        <button type="button" onClick={() => { setMonths(30); setH(0); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Mars, no countermeasure
        </button>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Bone is a market where mechanical load is the price signal: unload it and the body, applying Wolff&rsquo;s law, dissolves what it reads as unneeded — weight-bearing bone at ~1.5% a month, a postmenopausal year compressed into thirty days, ten to twenty times faster than the worst earthly osteoporosis. Two and a half hours of daily resistance exercise reloads the skeleton and bends the curve down, but it is a hostage negotiation, not a cure: the loss only slows, never stops, and a Mars-length trip still dissolves roughly a third of the weight-bearing skeleton. The freed calcium doesn&rsquo;t just vanish — it floods the blood, risking kidney stones with no ambulance for millions of kilometres, and much of it is excreted for good, so even &ldquo;recovered&rdquo; bone comes back weaker.
      </figcaption>
    </figure>
  );
}
