"use client";

import { useState } from "react";

// An interactive Biosphere 2 oxygen-decline explorer, embedded in an article via
// a fenced ```biosphere2oxygen block (see Reader's `pre` override). Inside the
// sealed enclosure the oxygen fell from 21% toward 14% over sixteen months —
// roughly 0.4 percentage points a month — because soil microbes consumed O2 and
// the CO2 they made was absorbed by the concrete instead of being returned to the
// plants: a hidden leak in the carbon cycle. Slide the leak rate and watch how a
// tiny monthly drain, with no buffer to absorb it, compounds into a crisis. The
// dashed lines mark impairment (~16%) and the measured Biosphere 2 low (~14%).
// currentColor theming; first render deterministic (the real ~0.44%/month rate).

const START = 20.9; // % O2 at seal-in
const IMPAIR = 16; // % — noticeable hypoxia, weakness
const B2_LOW = 14; // % — the measured Biosphere 2 minimum (~4,000 m altitude air)
const MONTHS_MAX = 18;

const RATE_LO = 0, RATE_HI = 0.8; // percentage points of O2 lost per month
const Y_LO = 12, Y_HI = 21.5; // % axis

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (m: number) => X0 + (m / MONTHS_MAX) * (X1 - X0);
const py = (o2: number) => Y1 - ((Math.min(Y_HI, Math.max(Y_LO, o2)) - Y_LO) / (Y_HI - Y_LO)) * (Y1 - Y0);

const o2At = (month: number, rate: number) => START - rate * month;

function linePath(rate: number): string {
  const N = 36;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const m = (i / N) * MONTHS_MAX;
    d += `${i === 0 ? "M" : "L"}${px(m).toFixed(1)} ${py(o2At(m, rate)).toFixed(1)}`;
  }
  return d;
}

export function Biosphere2Oxygen() {
  const [rate, setRate] = useState(0.44);
  const [month, setMonth] = useState(16);
  const o2 = o2At(month, rate);
  const impaired = o2 <= IMPAIR;

  return (
    <figure className="b2o-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Losing ${rate.toFixed(2)} percentage points of oxygen per month, after ${month} months the sealed atmosphere holds ${o2.toFixed(1)}% oxygen.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* sea-level reference */}
        <line className="text-faint" x1={X0} y1={py(START)} x2={X1} y2={py(START)} stroke="currentColor"
          strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        <text className="text-faint" x={X1 - 2} y={py(START) - 4} textAnchor="end" fill="currentColor"
          fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">sea-level air · 21%</text>

        {/* impairment threshold */}
        <line className="text-maroon" x1={X0} y1={py(IMPAIR)} x2={X1} y2={py(IMPAIR)} stroke="currentColor"
          strokeWidth={1.2} strokeDasharray="4 3" opacity={0.7} />
        <text className="text-maroon" x={X1 - 2} y={py(IMPAIR) - 4} textAnchor="end" fill="currentColor"
          fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          impairment · 16%
        </text>

        {/* Biosphere 2 measured low */}
        <line className="text-faint" x1={X0} y1={py(B2_LOW)} x2={X1} y2={py(B2_LOW)} stroke="currentColor"
          strokeWidth={1} strokeDasharray="2 3" opacity={0.6} />
        <text className="text-faint" x={X1 - 2} y={py(B2_LOW) + 10} textAnchor="end" fill="currentColor"
          fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">Biosphere 2 low · 14%</text>

        {/* decline curve */}
        <path className="text-ink" d={linePath(rate)} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />

        {/* current point */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(month)} y1={py(o2)} x2={px(month)} y2={Y1} />
          <line x1={X0} y1={py(o2)} x2={px(month)} y2={py(o2)} />
        </g>
        <circle className={impaired ? "text-maroon" : "text-purple"} cx={px(month)} cy={py(o2)} r={4.5}
          fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">months sealed ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            oxygen (%)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(6)} y={Y1 + 12} textAnchor="middle">6</text>
          <text x={px(12)} y={Y1 + 12} textAnchor="middle">12</text>
          <text x={px(18)} y={Y1 + 12} textAnchor="middle">18</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Losing <strong className="tabular-nums">{rate.toFixed(2)}</strong> points/month → after{" "}
        <strong className="tabular-nums">{month}</strong> months the air holds{" "}
        <span className={`font-semibold ${impaired ? "text-maroon" : "text-purple"}`}>{o2.toFixed(1)}% O₂</span>
        {impaired
          ? <strong className="text-maroon"> — thin-mountain air; the crew is weak and breathless.</strong>
          : <> — still breathable, but falling.</>}
      </p>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Hidden oxygen leak</span><span className="tabular-nums">{rate.toFixed(2)} pts/mo</span>
          </span>
          <input type="range" min={RATE_LO} max={RATE_HI} step={0.02} value={rate}
            onChange={(e) => setRate(Number(e.target.value))}
            aria-label="Oxygen loss rate in percentage points per month" className="mt-1 w-full"
            style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Months sealed</span><span className="tabular-nums">{month} mo</span>
          </span>
          <input type="range" min={0} max={MONTHS_MAX} step={1} value={month}
            onChange={(e) => setMonth(Number(e.target.value))}
            aria-label="Months sealed" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="flex flex-wrap gap-2">
          <button type="button" onClick={() => { setRate(0.44); setMonth(16); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            The real Biosphere 2 (~0.44/mo, 16 mo)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Sealed inside Biosphere 2 in 1991, eight people watched their oxygen slide from 21% toward 14% over sixteen months — the air of a 4,000-metre summit — until it had to be pumped in from outside. Nobody had predicted it. The soil, chosen rich to grow food, teemed with microbes that <em>consumed</em> oxygen and breathed out carbon dioxide; but that CO₂ was quietly absorbed by the curing <span className="text-maroon">concrete</span> of the structure rather than returned to the plants, so the carbon cycle had a hidden leak and the oxygen the microbes burned was simply lost. The lesson is in the slope: a drain of less than half a percent a month sounds like nothing, and on Earth it <em>is</em> nothing — the atmosphere is too vast to notice. In a closed world there is no buffer, so the same trivial imbalance compounds, month after month, into a crisis. Closure and fragility travel together: the tighter you seal a living loop, the less error it can survive.
      </figcaption>
    </figure>
  );
}
