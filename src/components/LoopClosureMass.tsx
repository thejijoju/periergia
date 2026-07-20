"use client";

import { useState } from "react";

// An interactive loop-closure mass explorer, embedded in an article via a fenced
// ```loopclosuremass block (see Reader's `pre` override). Open-loop life support
// carries every gram the crew consumes, so its mass grows linearly with mission
// duration; closing a loop replaces that growing consumable with a fixed mass of
// recycling machinery. Slide the mission length and toggle which loops are closed
// (water ~90%, oxygen ~50% via electrolysis+Sabatier, food only by biology) and
// watch the carried mass — and the crossover where recycling starts to pay.
// currentColor theming (light/dark); first render deterministic (a ~1000-day
// Mars-class mission, water+oxygen closed).

const CREW = 4;
// Per-person daily consumable masses (kg): water dominates.
const WATER = 3.5, OXY = 0.84, FOOD = 0.66; // ~5 kg/person/day open-loop
const OPEN_RATE = (WATER + OXY + FOOD) * CREW; // kg/day for the whole crew
// Recovery fractions when a loop is closed.
const WATER_REC = 0.9, OXY_REC = 0.5;
// One-time mass of the recycling hardware (racks, distiller, electrolyzer,
// Sabatier) — a representative fixed cost that buys water+oxygen closure.
const MACHINE = 1500; // kg

const D_MAX = 1100; // days (x-axis)
const M_MAX = 24000; // kg (y-axis top) ≈ 22 t open-loop at 1100 days

const X0 = 52, X1 = 424, Y0 = 16, Y1 = 196;
const px = (d: number) => X0 + (d / D_MAX) * (X1 - X0);
const py = (m: number) => Y1 - Math.min(1, m / M_MAX) * (Y1 - Y0);

// Daily resupply rate for the whole crew given which loops are closed.
function dailyRate(water: boolean, oxygen: boolean) {
  const w = WATER * (water ? 1 - WATER_REC : 1);
  const o = OXY * (oxygen ? 1 - OXY_REC : 1);
  return (w + o + FOOD) * CREW; // food never closes by machine
}

function linePath(rate: number, base: number): string {
  // carried mass = base (machinery) + rate·days
  const d0 = 0, d1 = D_MAX;
  return `M${px(d0).toFixed(1)} ${py(base + rate * d0).toFixed(1)} L${px(d1).toFixed(1)} ${py(base + rate * d1).toFixed(1)}`;
}

export function LoopClosureMass() {
  const [days, setDays] = useState(1000);
  const [water, setWater] = useState(true);
  const [oxygen, setOxygen] = useState(true);

  const closedRate = dailyRate(water, oxygen);
  const base = water || oxygen ? MACHINE : 0;
  const openMass = OPEN_RATE * days;
  const closedMass = base + closedRate * days;
  const saved = openMass - closedMass;
  // Crossover day where closed (with machinery) undercuts open-loop.
  const crossover = base > 0 && OPEN_RATE > closedRate ? base / (OPEN_RATE - closedRate) : null;

  return (
    <figure className="lcm-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Over ${days} days, open-loop life support carries about ${Math.round(openMass / 1000)} tonnes; with the chosen loops closed, about ${(closedMass / 1000).toFixed(1)} tonnes.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* open-loop line (grows with time — the enemy) */}
        <path className="text-maroon" d={linePath(OPEN_RATE, 0)} fill="none" stroke="currentColor"
          strokeWidth={2.4} strokeLinejoin="round" opacity={0.85} />
        <text className="text-maroon" x={px(D_MAX) - 2} y={py(OPEN_RATE * D_MAX) + 12} textAnchor="end"
          fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">open loop</text>

        {/* closed-loop line (fixed machinery + slow growth) */}
        <path className="text-purple" d={linePath(closedRate, base)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />
        <text className="text-purple" x={px(D_MAX) - 2} y={py(base + closedRate * D_MAX) - 5} textAnchor="end"
          fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">closed loop</text>

        {/* crossover marker */}
        {crossover && crossover < D_MAX && (
          <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.8}>
            <line x1={px(crossover)} y1={Y0} x2={px(crossover)} y2={Y1} />
          </g>
        )}

        {/* current-mission markers */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(days)} y1={Y0} x2={px(days)} y2={Y1} />
        </g>
        <circle className="text-maroon" cx={px(days)} cy={py(openMass)} r={4} fill="currentColor" />
        <circle className="text-purple" cx={px(days)} cy={py(closedMass)} r={4.5} fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">mission duration (days) ⟶</text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>
            mass carried (kg)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(500)} y={Y1 + 12} textAnchor="middle">500</text>
          <text x={px(1000)} y={Y1 + 12} textAnchor="middle">1000</text>
          <text x={X0 - 4} y={py(20000) + 3} textAnchor="end">20 t</text>
          <text x={X0 - 4} y={py(10000) + 3} textAnchor="end">10 t</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {CREW} crew · <strong className="tabular-nums">{days}</strong> days →{" "}
        <span className="text-maroon font-semibold">{(openMass / 1000).toFixed(1)} t</span> open-loop vs{" "}
        <span className="text-purple font-semibold">{(closedMass / 1000).toFixed(1)} t</span> closed —{" "}
        {saved > 0
          ? <strong className="text-purple">{(saved / 1000).toFixed(1)} t saved.</strong>
          : <strong className="text-maroon">closing costs mass here — the trip is too short to pay for the machinery.</strong>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Mission duration</span><span className="tabular-nums">{days} days</span>
          </span>
          <input type="range" min={30} max={D_MAX} step={10} value={days}
            onChange={(e) => setDays(Number(e.target.value))}
            aria-label="Mission duration in days" className="mt-1 w-full"
            style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setWater((v) => !v)} aria-pressed={water}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${water ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            Water loop {water ? "closed (90%)" : "open"}
          </button>
          <button type="button" onClick={() => setOxygen((v) => !v)} aria-pressed={oxygen}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${oxygen ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            Oxygen loop {oxygen ? "closed (50%)" : "open"}
          </button>
          <span className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-faint">
            Food loop open — only biology can close it
          </span>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Open-loop life support carries every gram the crew will consume, so its mass climbs in a straight line with mission length — about <span className="text-maroon">5&nbsp;kg per person per day</span>, roughly 20&nbsp;tonnes for four people on a 1,000-day Mars trip. Closing a loop swaps that growing burden for a one-time mass of recycling hardware (here ~1.5&nbsp;t buys water and oxygen closure), after which only the un-recovered remainder must still be launched. The two lines cross at the break-even duration: before it, the machinery isn&rsquo;t worth its own mass (which is why Mercury and Apollo carried everything); after it, the fixed cost is dwarfed by the consumables it replaces (which is why the ISS recycles). Water closes tightest because recycling it is just <em>purification</em>; food never closes here, because no machine can make it — it stays the stubborn open term that comes to dominate a long mission&rsquo;s resupply.
      </figcaption>
    </figure>
  );
}
