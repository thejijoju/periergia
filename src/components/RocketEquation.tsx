"use client";

import { useState } from "react";

// An interactive rocket-equation explorer, embedded in an article via a fenced
// ```rocketequation block (see Reader's `pre` override). The Tsiolkovsky
// equation Δv = v_e · ln(m₀/m_f) is drawn as a curve: velocity change against
// mass ratio, for a chosen propellant. Slide the mass ratio to walk the dot up
// the logarithm; switch propellant to steepen or flatten the whole curve. A
// horizontal line marks the ~9.4 km/s it takes to reach orbit — watch a good
// propellant cross it at a sane mass ratio and a poor one never reach it inside
// any buildable vehicle. That failure to cross IS the impossibility theorem.
// Themed by `currentColor` on Tailwind text-* groups so it re-themes in light
// and dark. First render is deterministic (kerolox at mass ratio 9) so SSR and
// the first client paint agree.

const G0 = 9.80665; // m/s², the I_sp units-treaty constant (not local gravity)
const R_MAX = 25; // right edge of the mass-ratio axis
const DV_MAX = 16000; // m/s, top of the Δv axis (covers chemical + mission budgets)
const LEO_DV = 9400; // m/s, surface-to-LEO budget including gravity & drag losses

const X0 = 46;
const X1 = 424;
const Y0 = 14;
const Y1 = 208;

const px = (R: number) => X0 + ((R - 1) / (R_MAX - 1)) * (X1 - X0);
const py = (dv: number) => Y1 - Math.max(0, Math.min(1, dv / DV_MAX)) * (Y1 - Y0);

// I_sp in seconds → exhaust velocity in m/s.
const PROPELLANTS = [
  { label: "Solid", isp: 250, note: "APCP — boosters" },
  { label: "Kerolox", isp: 311, note: "RP-1 / LOX" },
  { label: "Hydrolox", isp: 452, note: "LH₂ / LOX" },
  { label: "Ion", isp: 3000, note: "xenon thruster" },
] as const;

// Δv = v_e ln R, sampled across the mass-ratio window and clamped to the frame.
function dvPath(ve: number): string {
  const N = 120;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const R = 1 + (i / N) * (R_MAX - 1);
    d += `${i === 0 ? "M" : "L"}${px(R).toFixed(1)} ${py(ve * Math.log(R)).toFixed(1)}`;
  }
  return d;
}

function fmtKms(v: number): string {
  return `${(v / 1000).toFixed(1)} km/s`;
}

export function RocketEquation() {
  const [ispIdx, setIspIdx] = useState(1); // kerolox
  const [R, setR] = useState(9);

  const isp = PROPELLANTS[ispIdx].isp;
  const ve = isp * G0;
  const dv = ve * Math.log(R);
  const propFrac = 1 - 1 / R; // fraction of liftoff mass that is propellant
  const reachesOrbit = dv >= LEO_DV;

  // The mass ratio this propellant needs to hit the LEO budget: R = exp(Δv/v_e).
  const rForLEO = Math.exp(LEO_DV / ve);
  const wall = rForLEO > R_MAX; // off the chart → no single stage can do it

  const dotX = px(R);
  const dotY = py(dv);
  const leoY = py(LEO_DV);
  const curveCls = reachesOrbit ? "text-purple" : "text-ink";

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With ${PROPELLANTS[ispIdx].label} at mass ratio ${R.toFixed(1)}, the rocket equation gives a Δv of ${fmtKms(dv)}.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* The "to orbit" reference line — the budget every launcher must beat */}
        <line className="text-maroon" x1={X0} y1={leoY} x2={X1} y2={leoY}
          stroke="currentColor" strokeWidth={1.2} strokeDasharray="4 3" opacity={0.75} />
        <text className="text-maroon" x={X1 - 2} y={leoY - 4} textAnchor="end"
          fill="currentColor" fontSize={9.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          9.4 km/s — to orbit
        </text>

        {/* The Δv curve */}
        <path className={curveCls} d={dvPath(ve)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* Guide lines from the dot down to each axis */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={dotX} y1={dotY} x2={dotX} y2={Y1} />
          <line x1={X0} y1={dotY} x2={dotX} y2={dotY} />
        </g>
        <circle className={curveCls} cx={dotX} cy={dotY} r={4} fill="currentColor" />

        {/* Axis labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={242} textAnchor="middle">
            mass ratio  m₀ / m_f  (wet ÷ dry)
          </text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle"
            transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>
            Δv
          </text>
        </g>
        {/* Tick labels */}
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={X0} y={Y1 + 11} textAnchor="middle">1</text>
          <text x={px(5)} y={Y1 + 11} textAnchor="middle">5</text>
          <text x={px(10)} y={Y1 + 11} textAnchor="middle">10</text>
          <text x={px(15)} y={Y1 + 11} textAnchor="middle">15</text>
          <text x={px(20)} y={Y1 + 11} textAnchor="middle">20</text>
          <text x={px(25)} y={Y1 + 11} textAnchor="middle">25</text>
          <text x={X0 - 4} y={py(0) + 3} textAnchor="end">0</text>
          <text x={X0 - 4} y={py(4000) + 3} textAnchor="end">4</text>
          <text x={X0 - 4} y={py(8000) + 3} textAnchor="end">8</text>
          <text x={X0 - 4} y={py(12000) + 3} textAnchor="end">12</text>
          <text x={X0 - 4} y={py(16000) + 3} textAnchor="end">16 km/s</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong>{PROPELLANTS[ispIdx].label}</strong> at mass ratio{" "}
        <strong className="tabular-nums">{R.toFixed(1)}</strong> — burning{" "}
        <strong className="tabular-nums">{Math.round(propFrac * 100)}%</strong> of liftoff mass as propellant —
        delivers{" "}
        <span className={`font-semibold ${reachesOrbit ? "text-purple" : "text-ink"}`}>
          Δv = {fmtKms(dv)}
        </span>
        .{" "}
        {reachesOrbit ? (
          <>Enough to reach orbit.</>
        ) : wall ? (
          <strong className="text-maroon">This propellant cannot reach orbit at any buildable mass ratio — the exponential wall.</strong>
        ) : (
          <>Short of orbit; you need mass ratio <strong className="tabular-nums">{rForLEO.toFixed(1)}</strong>.</>
        )}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Mass ratio (wet ÷ dry)</span>
            <span className="tabular-nums">{R.toFixed(1)}</span>
          </span>
          <input type="range" min={1} max={R_MAX} step={0.1} value={R}
            onChange={(e) => setR(Number(e.target.value))}
            aria-label="Mass ratio"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {PROPELLANTS.map((p, i) => (
            <button key={p.label} type="button" onClick={() => setIspIdx(i)}
              aria-pressed={i === ispIdx}
              className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${
                i === ispIdx ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"
              }`}>
              {p.label} · I<sub>sp</sub> {p.isp}s
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The rocket equation, Δv = v<sub>e</sub> · ln(m₀/m_f), drawn out. Because Δv grows with the <em>logarithm</em> of the mass ratio, every extra km/s costs exponentially more propellant: the curve flattens fast. The exhaust velocity v<sub>e</sub> = I<sub>sp</sub>·g₀ sets how steeply it climbs — which is why three seconds of I<sub>sp</sub> are worth a two-year engine program. Notice that a solid or even kerolox stage struggles to cross the 9.4 km/s line alone: <strong>that</strong> is the impossibility theorem, and the reason rockets stage.
      </figcaption>
    </figure>
  );
}
