"use client";

import { useState } from "react";

// An interactive Δv-budget ledger, embedded in an article via a fenced
// ```dvbudget block (see Reader's `pre` override). Every mission is a sequence of
// velocity changes; the Δv budget is the itemised fuel bill. Rendered as a
// stacked horizontal bar, it shows two truths at a glance: launch alone is more
// than half the whole Apollo budget ("low Earth orbit is halfway to anywhere"),
// and the enormous return-braking Δv is simply absent — donated free by Earth's
// atmosphere. Toggle that free braking on to see how much the air pays, and how
// close the budget comes to doubling without it. currentColor theming; first
// render deterministic (the free-braking ghost hidden).

type Leg = { label: string; dv: number; launch?: boolean };
const LEGS: Leg[] = [
  { label: "Launch to low Earth orbit", dv: 9400, launch: true },
  { label: "Trans-lunar injection", dv: 3100 },
  { label: "Lunar-orbit insertion", dv: 800 },
  { label: "Descent to the surface", dv: 2000 },
  { label: "Ascent to lunar orbit", dv: 1900 },
  { label: "Trans-earth injection", dv: 1000 },
];
// What canceling ~11 km/s of lunar-return speed would cost propulsively — the Δv
// the atmosphere donates for free at Earth entry (illustrative, ~"nearly doubles").
const FREE_BRAKE = 12500;

const TOTAL = LEGS.reduce((s, l) => s + l.dv, 0); // 18,200 m/s

const X0 = 20, X1 = 424, BAR_Y = 60, BAR_H = 46;
// Scale so the with-atmosphere total fills most of the width.
const SCALE_MAX = TOTAL + FREE_BRAKE;
const wOf = (dv: number) => (dv / SCALE_MAX) * (X1 - X0);

// Cycle the palette across segments so adjacent legs are distinguishable.
const SEG = ["text-purple", "text-maroon", "text-ink", "text-muted"];

export function DvBudget() {
  const [showFree, setShowFree] = useState(false);
  const launchPct = Math.round((9400 / TOTAL) * 100);
  const grandTotal = showFree ? TOTAL + FREE_BRAKE : TOTAL;

  let x = X0;
  return (
    <figure className="dvb-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`The Apollo delta-v budget totals about ${TOTAL.toLocaleString("en-US")} m/s, of which launch to orbit is ${launchPct}%.`}>
        {/* the real, propulsive budget */}
        {LEGS.map((leg, i) => {
          const w = wOf(leg.dv);
          const seg = leg.launch ? "text-purple" : SEG[(i + 1) % SEG.length];
          const rect = (
            <g key={leg.label}>
              <rect className={seg} x={x} y={BAR_Y} width={Math.max(0, w - 1.5)} height={BAR_H}
                fill="currentColor" opacity={leg.launch ? 0.9 : 0.62} rx={1.5} />
              {w > 30 && (
                <text x={x + w / 2} y={BAR_Y + BAR_H / 2 + 3} textAnchor="middle" fill="currentColor"
                  className="text-card" fontSize={9} fontWeight={700}
                  fontFamily="ui-sans-serif, system-ui, sans-serif">
                  {(leg.dv / 1000).toFixed(1)}k
                </text>
              )}
            </g>
          );
          x += w;
          return rect;
        })}

        {/* the free atmospheric braking (ghosted) */}
        {showFree && (
          <g>
            <rect className="text-faint" x={x} y={BAR_Y} width={wOf(FREE_BRAKE) - 1.5} height={BAR_H}
              fill="currentColor" opacity={0.28} rx={1.5}
              stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" />
            <text x={x + wOf(FREE_BRAKE) / 2} y={BAR_Y + BAR_H / 2 + 3} textAnchor="middle"
              className="text-faint" fill="currentColor" fontSize={8.5} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">free</text>
          </g>
        )}

        {/* launch bracket */}
        <g className="text-purple" stroke="currentColor" strokeWidth={1} opacity={0.8}>
          <line x1={X0} y1={BAR_Y - 6} x2={X0 + wOf(9400)} y2={BAR_Y - 6} />
        </g>
        <text className="text-purple" x={X0 + wOf(9400) / 2} y={BAR_Y - 10} textAnchor="middle"
          fill="currentColor" fontSize={9} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">launch = {launchPct}% of the budget</text>

        {/* total readout */}
        <text className="text-ink" x={X0} y={BAR_Y + BAR_H + 26} fill="currentColor" fontSize={12}
          fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          total Δv: {grandTotal.toLocaleString("en-US")} m/s
        </text>
        <text className="text-faint" x={X0} y={BAR_Y + BAR_H + 42} fill="currentColor" fontSize={9.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          {showFree
            ? `without the atmosphere's free braking, the budget nearly doubles`
            : `Earth's atmosphere donates the entire return-braking Δv — for free`}
        </text>

        {/* legend */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif" fontSize={8.5}>
          {LEGS.map((leg, i) => (
            <g key={leg.label} transform={`translate(${X0 + (i % 2) * 210}, ${168 + Math.floor(i / 2) * 15})`}>
              <rect className={leg.launch ? "text-purple" : SEG[(i + 1) % SEG.length]} x={0} y={-7} width={9}
                height={9} rx={1.5} fill="currentColor" opacity={leg.launch ? 0.9 : 0.62} />
              <text className="text-muted" x={13} y={0} fill="currentColor">
                {leg.label} · {leg.dv.toLocaleString("en-US")}
              </text>
            </g>
          ))}
        </g>
      </svg>

      <div className="mt-2 flex flex-wrap gap-2">
        <button type="button" onClick={() => setShowFree((v) => !v)} aria-pressed={showFree}
          className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${showFree ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
          {showFree ? "Hide the atmosphere's free braking" : "Show what an airless return would cost"}
        </button>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Every mission is a list of velocity changes, and their sum is its fuel bill. Two things jump out of the Apollo ledger. First, <span className="text-purple">launch to low orbit</span> is <strong>{launchPct}%</strong> of the entire budget — more than the whole round trip to the lunar surface and back combined, which is why &ldquo;low Earth orbit is halfway to anywhere.&rdquo; Second, there is no line for braking back into Earth&rsquo;s atmosphere at the ~11&nbsp;km/s of a lunar return: the <span className="text-faint">atmosphere pays it for free</span>, converting all that energy to heat against the shield. Turn that free braking on and the budget nearly doubles — a preview of the Mars insight, where an atmosphere again donates the deceleration (aerobraking) that would otherwise dominate the bill. Reading the ledger, mission architecture becomes arithmetic: every trick — staging, lunar-orbit rendezvous, aerobraking, in-situ propellant — is a move that removes a line, or keeps expensive mass off one.
      </figcaption>
    </figure>
  );
}
