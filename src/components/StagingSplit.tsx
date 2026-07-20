"use client";

import { useState } from "react";

// An interactive two-stage split explorer, embedded in an article via a fenced
// ```stagingsplit block (see Reader's `pre` override). A two-stage rocket must
// divide its total Δv budget between the two stages; this draws the total
// payload fraction as a function of that split. Drag the split and watch the
// payload peak at the even division and collapse toward zero at the extremes —
// where one stage is asked to do so much Δv alone that its payload goes
// negative and the design becomes impossible. This is the Lagrange-multiplier
// result of the chapter, made draggable. Themed by `currentColor` on Tailwind
// text-* groups (light/dark); first render is deterministic (the even split).

const VE = 3432; // m/s, exhaust velocity (same methane engine as the chapter)
const EPS = 0.08; // structural coefficient per stage
const DVT = 9400; // m/s, total mission budget (surface → LEO)

const S_LO = 0.15; // leftmost split shown (stage 1's share of the budget)
const S_HI = 0.85;
const LAM_MAX = 0.045; // top of the payload-fraction axis (4.5%)

const X0 = 46;
const X1 = 424;
const Y0 = 14;
const Y1 = 200;

const px = (s: number) => X0 + ((s - S_LO) / (S_HI - S_LO)) * (X1 - X0);
const py = (lam: number) => Y1 - Math.max(0, Math.min(1, lam / LAM_MAX)) * (Y1 - Y0);

// Per-stage payload fraction: λ = (1/R − ε)/(1 − ε), with 1/R = e^(−Δv/v_e).
// Returns a value ≤ 0 when the stage is asked for more Δv than it can deliver.
function lamStage(dv: number): number {
  return (Math.exp(-dv / VE) - EPS) / (1 - EPS);
}

// Total two-stage payload fraction for a given split s = Δv₁ / Δv_total.
// If either stage is impossible (λ ≤ 0), the whole vehicle is impossible → 0.
function lamTotal(s: number): number {
  const l1 = lamStage(s * DVT);
  const l2 = lamStage((1 - s) * DVT);
  if (l1 <= 0 || l2 <= 0) return 0;
  return l1 * l2;
}

function lamPath(): string {
  const N = 140;
  let d = "";
  let started = false;
  for (let i = 0; i <= N; i++) {
    const s = S_LO + (i / N) * (S_HI - S_LO);
    const lam = lamTotal(s);
    if (lam <= 0) {
      started = false; // break the line across the impossible region
      continue;
    }
    d += `${started ? "L" : "M"}${px(s).toFixed(1)} ${py(lam).toFixed(1)}`;
    started = true;
  }
  return d;
}

function fmtKms(v: number): string {
  return `${(v / 1000).toFixed(2)} km/s`;
}

export function StagingSplit() {
  const [s, setS] = useState(0.5); // stage 1's share of the Δv budget
  const dv1 = s * DVT;
  const dv2 = (1 - s) * DVT;
  const l1 = lamStage(dv1);
  const l2 = lamStage(dv2);
  const total = l1 > 0 && l2 > 0 ? l1 * l2 : 0;
  const possible = total > 0;

  const dotX = px(s);
  const dotY = py(total);
  const optTotal = lamTotal(0.5);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Splitting the Δv budget ${Math.round(s * 100)}/${Math.round((1 - s) * 100)} between two stages gives a payload fraction of ${(total * 100).toFixed(2)}%.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* Even-split reference (the optimum for identical stages) */}
        <line className="text-purple" x1={px(0.5)} y1={Y0} x2={px(0.5)} y2={Y1}
          stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        <text className="text-purple" x={px(0.5)} y={Y0 + 8} textAnchor="middle"
          fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          even split
        </text>

        {/* The payload-fraction curve */}
        <path className="text-ink" d={lamPath()} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* Dot + guide lines (only when the design is possible) */}
        {possible && (
          <>
            <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
              <line x1={dotX} y1={dotY} x2={dotX} y2={Y1} />
              <line x1={X0} y1={dotY} x2={dotX} y2={dotY} />
            </g>
            <circle className="text-maroon" cx={dotX} cy={dotY} r={4} fill="currentColor" />
          </>
        )}

        {/* Axis labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">
            stage 1&rsquo;s share of the 9.4 km/s budget ⟶
          </text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle"
            transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>
            payload %
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(0.25)} y={Y1 + 12} textAnchor="middle">25%</text>
          <text x={px(0.5)} y={Y1 + 12} textAnchor="middle">50%</text>
          <text x={px(0.75)} y={Y1 + 12} textAnchor="middle">75%</text>
          <text x={X0 - 4} y={py(0.04) + 3} textAnchor="end">4%</text>
          <text x={X0 - 4} y={py(0.02) + 3} textAnchor="end">2%</text>
          <text x={X0 - 4} y={py(0) + 3} textAnchor="end">0</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Stage 1 does <strong className="tabular-nums">{fmtKms(dv1)}</strong>, stage 2 does{" "}
        <strong className="tabular-nums">{fmtKms(dv2)}</strong> —{" "}
        {possible ? (
          <>
            payload ={" "}
            <span className="font-semibold text-maroon">{(total * 100).toFixed(2)}%</span>{" "}
            of liftoff mass.{" "}
            {Math.abs(s - 0.5) < 0.02
              ? <strong>The even split — the optimum for identical stages.</strong>
              : <>Nudge toward 50/50 to do better.</>}
          </>
        ) : (
          <strong className="text-maroon">
            {l1 <= 0 ? "Stage 1" : "Stage 2"} is asked for more Δv than one stage can deliver — payload goes negative. Impossible.
          </strong>
        )}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Δv split (stage 1 / stage 2)</span>
            <span className="tabular-nums">{Math.round(s * 100)} / {Math.round((1 - s) * 100)}</span>
          </span>
          <input type="range" min={S_LO} max={S_HI} step={0.005} value={s}
            onChange={(e) => setS(Number(e.target.value))}
            aria-label="Δv split between the two stages"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setS(0.5)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Even split · {(optTotal * 100).toFixed(2)}%
          </button>
          <button type="button" onClick={() => setS(0.8)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Overload stage 1
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Two stages, one 9.4 km/s budget to divide. Because the payload fractions <em>multiply</em>, the total is maximised by sharing the work — for two identical stages, an even 4.7/4.7 km/s split, exactly what the Lagrange-multiplier calculation proves. Push the slider to the edges and one stage is handed so much Δv that its own payload fraction goes negative: it cannot even lift itself, and the whole vehicle is impossible. The peak is broad and forgiving, which is why real rockets can deviate from the ideal split for practical reasons and pay only a small penalty.
      </figcaption>
    </figure>
  );
}
