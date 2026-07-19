"use client";

import { useState } from "react";

// An interactive "effect of income on demand" diagram, embedded in an article
// via a fenced ```incomegood block (see Reader's `pre` override). A downward
// demand curve shifts as buyers' income changes: RIGHT for a normal good,
// LEFT for an inferior good. A dashed baseline marks the starting position.
// Mirrors the house SupplyDemandChart: same plot frame and units (price $0–8,
// quantity 0–800), themed by `currentColor` on Tailwind text-* groups so it
// re-themes in light and dark automatically. First render is deterministic
// (income at its baseline, zero shift) so SSR and the first client paint agree.

const Q_MAX = 800;
const P_MAX = 8;
// Baseline demand in the article's units: Qd = 700 − 100·P, plus a horizontal
// income shift. income runs 0–100 with the baseline (no shift) at 50.
const BASE_INCOME = 50;
const qd = (p: number, shift: number) => 700 - 100 * p + shift;

const X0 = 46;
const X1 = 400;
const Y0 = 16;
const Y1 = 262;
const sx = (q: number) => X0 + (Math.max(0, Math.min(Q_MAX, q)) / Q_MAX) * (X1 - X0);
const sy = (p: number) => Y1 - (p / P_MAX) * (Y1 - Y0);

function line(shift: number) {
  // The straight demand curve across the full price range, endpoints only.
  return { x1: sx(qd(0, shift)), y1: sy(0), x2: sx(qd(P_MAX, shift)), y2: sy(P_MAX) };
}

export function IncomeGoodChart() {
  const [good, setGood] = useState<"normal" | "inferior">("normal");
  const [income, setIncome] = useState(BASE_INCOME);

  const dir = good === "normal" ? 1 : -1;
  const shift = dir * (income - BASE_INCOME) * 5.5;
  const base = line(0);
  const cur = line(shift);

  const pTicks = [0, 2, 4, 6, 8];
  const qTicks = [0, 200, 400, 600, 800];

  const moved = Math.abs(shift) > 20 ? (shift > 0 ? "right" : "left") : "unchanged";
  const incWord = income > BASE_INCOME ? "above" : income < BASE_INCOME ? "below" : "at";

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 300" className="w-full h-auto" role="img"
        aria-label={`Demand curve for a ${good} good shifting ${moved} as income moves ${incWord} its starting level.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
        </g>
        <g className="text-faint" fill="currentColor" fontSize={10} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {pTicks.map((p) => (
            <g key={`p${p}`}>
              <line x1={X0 - 3} y1={sy(p)} x2={X0} y2={sy(p)} stroke="currentColor" />
              <text x={X0 - 6} y={sy(p) + 3} textAnchor="end">{`$${p}`}</text>
            </g>
          ))}
          {qTicks.map((q) => (
            <g key={`q${q}`}>
              <line x1={sx(q)} y1={Y1} x2={sx(q)} y2={Y1 + 3} stroke="currentColor" />
              <text x={sx(q)} y={Y1 + 15} textAnchor="middle">{q}</text>
            </g>
          ))}
        </g>
        <g className="text-muted" fill="currentColor" fontSize={10.5} fontFamily="ui-sans-serif, system-ui, sans-serif" fontWeight={600}>
          <text x={(X0 + X1) / 2} y={295} textAnchor="middle">Quantity</text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>Price</text>
        </g>

        {/* Baseline (dashed) and current demand curve */}
        <line className="text-faint" stroke="currentColor" strokeWidth={1.6} strokeDasharray="4 4"
          x1={base.x1} y1={base.y1} x2={base.x2} y2={base.y2} />
        <line className="text-purple" stroke="currentColor" strokeWidth={2.6}
          x1={cur.x1} y1={cur.y1} x2={cur.x2} y2={cur.y2} />
        <text className="text-purple" fill="currentColor" fontSize={12} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif"
          x={sx(qd(2.4, shift)) + 7} y={sy(2.4) - 4}>D</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {good === "normal" ? (
          <>A <strong>normal</strong> good — higher income shifts <span className="text-purple font-semibold">demand</span> right.</>
        ) : (
          <>An <strong>inferior</strong> good — higher income shifts <span className="text-purple font-semibold">demand</span> left.</>
        )}
        {" "}Income is {incWord} its starting level, so the curve has moved <strong>{moved}</strong>.
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="block font-sans text-[12px] text-muted">Type of good</span>
          <span className="mt-1 inline-flex overflow-hidden rounded-md border border-line">
            {(["normal", "inferior"] as const).map((g) => (
              <button key={g} type="button" onClick={() => setGood(g)}
                aria-pressed={good === g}
                className={`font-sans text-[12px] px-3 py-1.5 capitalize transition-colors ${
                  good === g ? "bg-ink text-card" : "text-muted hover:text-ink"
                } ${g === "normal" ? "border-r border-line" : ""}`}>
                {g}
              </button>
            ))}
          </span>
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Buyers&rsquo; income</span>
            <span className="tabular-nums">{income}</span>
          </span>
          <input type="range" min={0} max={100} step={2} value={income}
            onChange={(e) => setIncome(Number(e.target.value))}
            aria-label="Buyers' income"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-2 font-sans text-[12px] text-faint leading-snug">
        Raise income and watch the demand curve move. For a normal good it shifts right — more wanted at every price. For an inferior good it shifts left — as people grow richer they buy less (the bus for a car, instant noodles for fresh food). The dashed line marks the starting position.
      </figcaption>
    </figure>
  );
}
