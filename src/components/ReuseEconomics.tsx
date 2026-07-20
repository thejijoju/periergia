"use client";

import { useState } from "react";

// An interactive reusability-amortization explorer, embedded in an article via
// a fenced ```reuseeconomics block (see Reader's `pre` override). Reusability
// costs ~35% of payload (the "reusability tax") but amortizes the expensive
// first stage across many flights. This draws $/kg to orbit against the number
// of times the first stage is reused: a flat expendable line, and a reusable
// curve that starts ABOVE it (reusing once is a bad deal — you paid the payload
// tax for nothing) and crosses below only after a few flights, then falls toward
// a floor. The chapter's thesis — "reusability alone is not enough; you need
// flight rate" — made draggable. Figures are the chapter's illustrative
// order-of-magnitude numbers. currentColor theming (light/dark); first render
// deterministic (10 flights).

// All costs in $M; payloads in tonnes. The chapter's rough numbers.
const FS_BUILD = 40; // first-stage build cost
const REFURB = 2; // refurbishment per reflight (reusable only)
const REST = 20; // second stage + propellant + ops (both modes)
const PAY_EXP = 22.8; // expendable payload to LEO (t)
const PAY_REU = 15; // reusable payload after the ~35% tax (t)

const N_MAX = 30;

// $/kg: ($M × 1e6) / (tonnes × 1000).
const EXP_PER_KG = ((FS_BUILD + REST) * 1e6) / (PAY_EXP * 1000);
const reusePerKg = (n: number) => ((FS_BUILD / n + REFURB + REST) * 1e6) / (PAY_REU * 1000);

const Y_MAX = 4600;

const X0 = 48;
const X1 = 424;
const Y0 = 14;
const Y1 = 200;

const px = (n: number) => X0 + ((n - 1) / (N_MAX - 1)) * (X1 - X0);
const py = (v: number) => Y1 - Math.max(0, Math.min(1, v / Y_MAX)) * (Y1 - Y0);

// Break-even flight count where the reusable curve drops below expendable.
// reusePerKg(n) = EXP_PER_KG  →  FS/n = EXP_PER_KG·PAY_REU/1000·1e-6·… solve directly.
const N_BREAKEVEN = FS_BUILD / ((EXP_PER_KG * PAY_REU * 1000) / 1e6 - REFURB - REST);

function reusePath(): string {
  const N = 120;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const n = 1 + (i / N) * (N_MAX - 1);
    d += `${i === 0 ? "M" : "L"}${px(n).toFixed(1)} ${py(reusePerKg(n)).toFixed(1)}`;
  }
  return d;
}

function fmtUsd(v: number): string {
  return `$${Math.round(v / 10) * 10}/kg`;
}

export function ReuseEconomics() {
  const [n, setN] = useState(10);
  const reuse = reusePerKg(n);
  const ahead = reuse < EXP_PER_KG;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Reusing the first stage ${n} times gives ${fmtUsd(reuse)} to orbit, versus ${fmtUsd(EXP_PER_KG)} expendable.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* Expendable reference (flat) */}
        <line className="text-faint" x1={X0} y1={py(EXP_PER_KG)} x2={X1} y2={py(EXP_PER_KG)}
          stroke="currentColor" strokeWidth={1.4} strokeDasharray="5 3" opacity={0.85} />
        <text className="text-muted" x={X1 - 2} y={py(EXP_PER_KG) - 4} textAnchor="end"
          fill="currentColor" fontSize={9.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          expendable · {fmtUsd(EXP_PER_KG)}
        </text>

        {/* Break-even marker */}
        <line className="text-purple" x1={px(N_BREAKEVEN)} y1={Y0} x2={px(N_BREAKEVEN)} y2={Y1}
          stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.6} />
        <text className="text-purple" x={px(N_BREAKEVEN)} y={Y0 + 8} textAnchor="middle"
          fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          break-even ≈ {N_BREAKEVEN.toFixed(1)}
        </text>

        {/* Reusable curve */}
        <path className="text-maroon" d={reusePath()} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* Dot + guides */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(n)} y1={py(reuse)} x2={px(n)} y2={Y1} />
          <line x1={X0} y1={py(reuse)} x2={px(n)} y2={py(reuse)} />
        </g>
        <circle className={ahead ? "text-maroon" : "text-ink"} cx={px(n)} cy={py(reuse)} r={4} fill="currentColor" />

        {/* Axis labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">
            times the first stage is flown ⟶
          </text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle"
            transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>$/kg to LEO</text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(1)} y={Y1 + 12} textAnchor="middle">1</text>
          <text x={px(10)} y={Y1 + 12} textAnchor="middle">10</text>
          <text x={px(20)} y={Y1 + 12} textAnchor="middle">20</text>
          <text x={px(30)} y={Y1 + 12} textAnchor="middle">30</text>
          <text x={X0 - 4} y={py(4000) + 3} textAnchor="end">$4k</text>
          <text x={X0 - 4} y={py(2000) + 3} textAnchor="end">$2k</text>
          <text x={X0 - 4} y={py(0) + 3} textAnchor="end">0</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Reused <strong className="tabular-nums">{n}×</strong>, each kilogram to orbit costs{" "}
        <span className={`font-semibold ${ahead ? "text-maroon" : "text-ink"}`}>{fmtUsd(reuse)}</span> —{" "}
        {ahead ? (
          <>beating the <strong>{fmtUsd(EXP_PER_KG)}</strong> expendable price, even after giving up a third of the payload.</>
        ) : (
          <strong>still worse than expendable. You paid the payload tax and haven&rsquo;t yet amortized the stage.</strong>
        )}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>First-stage flights</span>
            <span className="tabular-nums">{n}×</span>
          </span>
          <input type="range" min={1} max={N_MAX} step={1} value={n}
            onChange={(e) => setN(Number(e.target.value))}
            aria-label="Number of first-stage flights"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setN(1)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Fly once (the Shuttle trap)
          </button>
          <button type="button" onClick={() => setN(20)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Fly 20× (Falcon 9)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Recovering the first stage costs ~35% of the payload (the rocket-equation &ldquo;reusability tax&rdquo;) but lets its ~\$40M build cost be amortized across many flights instead of thrown away each time. Reuse it <em>once</em> and you lose — you paid the payload penalty and still nearly paid for the whole stage. The curve only crosses below the expendable price after about <strong>{N_BREAKEVEN.toFixed(1)}</strong> flights, then keeps falling toward a floor set by refurbishment, the second stage, and operations. This is why reusability made the Shuttle (few flights, huge refurbishment) <em>more</em> expensive and Falcon 9 (20+ flights, cheap turnaround) far cheaper: the word &ldquo;reusable&rdquo; is not the answer — <strong>flight rate</strong> is. Figures are the chapter&rsquo;s illustrative order-of-magnitude numbers.
      </figcaption>
    </figure>
  );
}
