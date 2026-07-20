"use client";

import { useState } from "react";

// An interactive consumables-mass explorer, embedded in an article via a fenced
// ```consumablesmass block (see Reader's `pre` override). A human in space needs
// ~5 kg of consumables (oxygen, water, food) per person per day — a mass that is
// *continuously consumed*, so the total grows without bound as crew size and
// mission length rise, reaching ~20 tonnes for a Mars crew. Recycling the water
// and oxygen (but never the food) bends the curve down. Slide crew, duration,
// and loop closure and watch the cumulative mass climb — and see why long
// missions live or die by closing the loop. currentColor theming (light/dark);
// first render deterministic (Mars-class trip).

const PER_DAY = 5; // kg/person/day, the standard planning figure
const RECYCLABLE = 4; // kg/day of it is water + oxygen (recyclable); ~1 kg is food (not)

const DAY_MAX = 1200;
const MASS_MAX = 30; // tonnes (y-axis top)

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (d: number) => X0 + (d / DAY_MAX) * (X1 - X0);
const py = (t: number) => Y1 - Math.min(1, t / MASS_MAX) * (Y1 - Y0);

// Supplied mass per person per day at loop closure c (applies to the recyclable part only).
const perDaySupplied = (c: number) => PER_DAY - RECYCLABLE + RECYCLABLE * (1 - c);

// Cumulative supplied consumables (tonnes) over `days` for `crew` at closure `c`.
const totalT = (crew: number, days: number, c: number) => (perDaySupplied(c) * crew * days) / 1000;

const PRESETS = [
  { label: "Apollo (3, 10 d)", crew: 3, days: 10, c: 0 },
  { label: "ISS increment (4, 180 d)", crew: 4, days: 180, c: 0.9 },
  { label: "Mars (4, 1000 d)", crew: 4, days: 1000, c: 0 },
];

function linePath(crew: number, c: number): string {
  // Cumulative mass is linear in days, so two points suffice; sample for clarity.
  const N = 24;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const day = (i / N) * DAY_MAX;
    d += `${i === 0 ? "M" : "L"}${px(day).toFixed(1)} ${py(totalT(crew, day, c)).toFixed(1)}`;
  }
  return d;
}

function fmtMass(t: number): string {
  if (t < 1) return `${Math.round(t * 1000)} kg`;
  return `${t.toFixed(1)} t`;
}

export function ConsumablesMass() {
  const [crew, setCrew] = useState(4);
  const [days, setDays] = useState(1000);
  const [c, setC] = useState(0);
  const open = totalT(crew, days, 0);
  const closed = totalT(crew, days, c);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A crew of ${crew} over ${days} days needs ${fmtMass(closed)} of consumables at ${Math.round(c * 100)}% recycling.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* open-loop line (faint) and recycled line (bold) */}
        <path className="text-maroon" d={linePath(crew, 0)} fill="none" stroke="currentColor"
          strokeWidth={1.4} strokeDasharray="4 3" opacity={0.6} />
        <path className="text-maroon" d={linePath(crew, c)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* dot at current duration on the recycled line */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(days)} y1={py(closed)} x2={px(days)} y2={Y1} />
          <line x1={X0} y1={py(closed)} x2={px(days)} y2={py(closed)} />
        </g>
        <circle className="text-maroon" cx={px(days)} cy={py(closed)} r={4.5} fill="currentColor" />

        {/* labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">mission duration (days) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            consumables (tonnes)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(180)} y={Y1 + 12} textAnchor="middle">180</text>
          <text x={px(600)} y={Y1 + 12} textAnchor="middle">600</text>
          <text x={px(1000)} y={Y1 + 12} textAnchor="middle">1000</text>
          <text x={X0 - 4} y={py(20) + 3} textAnchor="end">20 t</text>
          <text x={X0 - 4} y={py(10) + 3} textAnchor="end">10 t</text>
          <text x={X0 - 4} y={py(0) + 3} textAnchor="end">0</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="tabular-nums">{crew}</strong> crew · <strong className="tabular-nums">{days}</strong> days →{" "}
        <span className="font-semibold text-maroon">{fmtMass(closed)}</span> of consumables
        {c > 0 && <> (vs <strong>{fmtMass(open)}</strong> open-loop — recycling saves <strong>{fmtMass(open - closed)}</strong>)</>}.
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Crew</span><span className="tabular-nums">{crew}</span></span>
          <input type="range" min={1} max={6} step={1} value={crew} onChange={(e) => setCrew(Number(e.target.value))}
            aria-label="Crew size" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Days</span><span className="tabular-nums">{days}</span></span>
          <input type="range" min={5} max={DAY_MAX} step={5} value={days} onChange={(e) => setDays(Number(e.target.value))}
            aria-label="Mission duration" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Recycling</span><span className="tabular-nums">{Math.round(c * 100)}%</span></span>
          <input type="range" min={0} max={0.95} step={0.01} value={c} onChange={(e) => setC(Number(e.target.value))}
            aria-label="Loop closure (water and oxygen)" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        {PRESETS.map((p) => (
          <button key={p.label} type="button" onClick={() => { setCrew(p.crew); setDays(p.days); setC(p.c); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            {p.label}
          </button>
        ))}
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        A person in space needs about 5 kg of consumables a day — ~0.84 kg oxygen, ~3.5 kg water, ~1.8 kg food, with packaging and margin. Unlike a robot&rsquo;s power (a fixed one-time mass), this is <em>continuously consumed</em>, so the total grows with crew × days and explodes on long trips: a Mars crew of four needs ~<strong>20 tonnes</strong> open-loop, before habitat, vehicle, or return propellant. That is why recycling is not a luxury but a necessity: the ISS recovers ~90% of its water (&ldquo;today&rsquo;s coffee is tomorrow&rsquo;s coffee&rdquo;), bending the curve down sharply. Food, though, cannot be recycled — every calorie is launched — which is why it comes to dominate what remains once the water and air loops are closed. Slide the closure up and watch the tonnes fall; slide the duration out and watch why length, not crew size, is the enemy.
      </figcaption>
    </figure>
  );
}
