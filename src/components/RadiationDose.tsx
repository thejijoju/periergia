"use client";

import { useState } from "react";

// An interactive radiation-dose explorer, embedded in an article via a fenced
// ```radiationdose block (see Reader's `pre` override). Galactic-cosmic-ray dose
// is proportional to time in deep space, so the total dose of a Mars mission is
// set mostly by how long the transit takes — which makes going faster the only
// countermeasure that scales, and hands the radiation problem back to
// propulsion. Slide the one-way transit time and watch the round-trip total,
// measured by Curiosity's RAD instrument at ~1.8 mSv/day in cruise plus ~350 mSv
// on the surface, against the ~600 mSv career limit. currentColor theming
// (light/dark); first render deterministic (a chemical-class ~8-month transit).

const CRUISE_RATE = 1.8; // mSv/day in deep space (RAD measurement)
const SURFACE = 350; // mSv on the Martian surface (~500 days)
const CAREER = 600; // mSv, a representative career limit
const DAYS_PER_MONTH = 30.44;

const M_LO = 2, M_HI = 9; // one-way transit, months
const DOSE_MAX = 1500; // mSv (y-axis top)

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (m: number) => X0 + ((m - M_LO) / (M_HI - M_LO)) * (X1 - X0);
const py = (d: number) => Y1 - Math.min(1, d / DOSE_MAX) * (Y1 - Y0);

// Round-trip total: two transit legs plus the surface stay.
const total = (oneWayMonths: number) => 2 * oneWayMonths * DAYS_PER_MONTH * CRUISE_RATE + SURFACE;

function linePath(): string {
  const N = 40;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const m = M_LO + (i / N) * (M_HI - M_LO);
    d += `${i === 0 ? "M" : "L"}${px(m).toFixed(1)} ${py(total(m)).toFixed(1)}`;
  }
  return d;
}

export function RadiationDose() {
  const [months, setMonths] = useState(8);
  const dose = total(months);
  const pctCareer = (dose / CAREER) * 100;
  const over = dose > CAREER;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A Mars mission with a ${months}-month one-way transit accumulates about ${Math.round(dose)} mSv, ${Math.round(pctCareer)}% of the career limit.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* career limit */}
        <line className="text-maroon" x1={X0} y1={py(CAREER)} x2={X1} y2={py(CAREER)}
          stroke="currentColor" strokeWidth={1.3} strokeDasharray="4 3" opacity={0.8} />
        <text className="text-maroon" x={X1 - 2} y={py(CAREER) - 4} textAnchor="end" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          career limit · 600 mSv
        </text>

        {/* total-dose curve */}
        <path className="text-ink" d={linePath()} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />

        {/* dot */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(months)} y1={py(dose)} x2={px(months)} y2={Y1} />
          <line x1={X0} y1={py(dose)} x2={px(months)} y2={py(dose)} />
        </g>
        <circle className={over ? "text-maroon" : "text-purple"} cx={px(months)} cy={py(dose)} r={4.5} fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">one-way transit time (months) ⟶ faster is to the left</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>total dose (mSv)</text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(3)} y={Y1 + 12} textAnchor="middle">3</text>
          <text x={px(6)} y={Y1 + 12} textAnchor="middle">6</text>
          <text x={px(9)} y={Y1 + 12} textAnchor="middle">9</text>
          <text x={X0 - 4} y={py(1000) + 3} textAnchor="end">1000</text>
          <text x={X0 - 4} y={py(500) + 3} textAnchor="end">500</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A <strong className="tabular-nums">{months}-month</strong> transit each way →{" "}
        <span className={`font-semibold ${over ? "text-maroon" : "text-purple"}`}>{Math.round(dose)} mSv</span> total,{" "}
        <strong className="tabular-nums">{Math.round(pctCareer)}%</strong> of a career limit
        {over && <strong className="text-maroon"> — over the whole lifetime allowance in one trip.</strong>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>One-way transit</span><span className="tabular-nums">{months} mo</span>
          </span>
          <input type="range" min={M_LO} max={M_HI} step={0.5} value={months}
            onChange={(e) => setMonths(Number(e.target.value))}
            aria-label="One-way transit time in months" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setMonths(8)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Chemical (~8 mo)
          </button>
          <button type="button" onClick={() => setMonths(4)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Nuclear (~4 mo)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The galactic-cosmic-ray dose is a rate — ~1.8 mSv a day in deep space, measured by the RAD instrument on Curiosity&rsquo;s own cruise to Mars — so the total is set by <em>time exposed</em>. A chemical round trip banks ~650 mSv in transit plus ~350 on the surface: about <strong>1 sievert</strong>, roughly 67% <em>over</em> a whole career&rsquo;s allowance in a single mission. And there is no shield that scales against it. The one countermeasure that does is to <em>spend less time out there</em> — halve the transit and you roughly halve the transit dose — which hands the radiation problem straight back to propulsion. A nuclear engine that shortens the trip is, in effect, a medical device. Notice, though, that even a fast transit stays above the limit: radiation is a wall you push back, not one you break.
      </figcaption>
    </figure>
  );
}
