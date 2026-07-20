"use client";

import { useState } from "react";

// An interactive artificial-gravity explorer, embedded in an article via a
// fenced ```artificialgravity block (see Reader's `pre` override). Spin a
// spacecraft and centripetal acceleration a = ω²r mimics gravity. But comfort
// caps the spin at ~2 rpm (faster, and Coriolis forces on the inner ear cause
// sickness), and at 2 rpm a full g needs a radius of ~224 m — a structure no one
// has built. Slide the radius and spin rate; the plot draws the 1-g locus
// r = g/ω² with the uncomfortable fast-spin zone shaded, and the dot shows the
// g you actually get. currentColor theming (light/dark); first render
// deterministic (~2 rpm, ~224 m — a comfortable full g).

const G = 9.81;
const RPM_LO = 1.5, RPM_HI = 10;
const R_MAX = 300; // m, y-axis top
const RPM_COMFORT = 2; // max tolerable spin

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (rpm: number) => X0 + ((rpm - RPM_LO) / (RPM_HI - RPM_LO)) * (X1 - X0);
const py = (r: number) => Y1 - Math.min(1, r / R_MAX) * (Y1 - Y0);

const omega = (rpm: number) => (rpm * 2 * Math.PI) / 60; // rad/s
const gLevel = (rpm: number, r: number) => (omega(rpm) ** 2 * r) / G;
const radiusFor1g = (rpm: number) => G / omega(rpm) ** 2;

function locusPath(): string {
  const N = 80;
  let d = "";
  let pen = false;
  for (let i = 0; i <= N; i++) {
    const rpm = RPM_LO + (i / N) * (RPM_HI - RPM_LO);
    const r = radiusFor1g(rpm);
    if (r > R_MAX) { pen = false; continue; } // off the top for slow spins
    d += `${pen ? "L" : "M"}${px(rpm).toFixed(1)} ${py(r).toFixed(1)}`;
    pen = true;
  }
  return d;
}

export function ArtificialGravity() {
  const [rpm, setRpm] = useState(2);
  const [r, setR] = useState(224);
  const g = gLevel(rpm, r);
  const comfortable = rpm <= RPM_COMFORT;
  const full = Math.abs(g - 1) < 0.05;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Spinning at ${rpm.toFixed(1)} rpm with a ${Math.round(r)} m radius gives ${g.toFixed(2)} g.`}>
        {/* uncomfortable fast-spin zone */}
        <rect className="text-maroon" x={px(RPM_COMFORT)} y={Y0} width={X1 - px(RPM_COMFORT)} height={Y1 - Y0}
          fill="currentColor" opacity={0.08} />
        <text className="text-maroon" x={(px(RPM_COMFORT) + X1) / 2} y={Y0 + 11} textAnchor="middle" fill="currentColor"
          fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          Coriolis sickness (&gt; 2 rpm)
        </text>

        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* the 1-g locus */}
        <path className="text-purple" d={locusPath()} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />
        <text className="text-purple" x={px(4.5)} y={py(radiusFor1g(4.5)) - 6} textAnchor="middle" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">1 g</text>

        {/* dot */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(rpm)} y1={py(r)} x2={px(rpm)} y2={Y1} />
          <line x1={X0} y1={py(r)} x2={px(rpm)} y2={py(r)} />
        </g>
        <circle className={full && comfortable ? "text-purple" : "text-maroon"} cx={px(rpm)} cy={py(r)} r={4.5} fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">spin rate (rpm) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>radius (m)</text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(2)} y={Y1 + 12} textAnchor="middle">2</text>
          <text x={px(5)} y={Y1 + 12} textAnchor="middle">5</text>
          <text x={px(10)} y={Y1 + 12} textAnchor="middle">10</text>
          <text x={X0 - 4} y={py(224) + 3} textAnchor="end">224</text>
          <text x={X0 - 4} y={py(100) + 3} textAnchor="end">100</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="tabular-nums">{rpm.toFixed(1)}</strong> rpm at radius{" "}
        <strong className="tabular-nums">{Math.round(r)} m</strong> →{" "}
        <span className={`font-semibold ${full && comfortable ? "text-purple" : "text-maroon"}`}>{g.toFixed(2)} g</span>
        {" — "}
        {!comfortable
          ? <strong className="text-maroon">but this spin is too fast; the Coriolis force sickens the crew.</strong>
          : full
          ? <strong className="text-purple">a comfortable full gravity.</strong>
          : <>comfortable spin, but not yet a full g — you need {Math.round(radiusFor1g(rpm))} m.</>}
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Radius</span><span className="tabular-nums">{Math.round(r)} m</span></span>
          <input type="range" min={5} max={R_MAX} step={1} value={r} onChange={(e) => setR(Number(e.target.value))}
            aria-label="Radius" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Spin rate</span><span className="tabular-nums">{rpm.toFixed(1)} rpm</span></span>
          <input type="range" min={RPM_LO} max={RPM_HI} step={0.1} value={rpm} onChange={(e) => setRpm(Number(e.target.value))}
            aria-label="Spin rate" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        <button type="button" onClick={() => { setRpm(2); setR(224); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Comfortable 1 g (2 rpm)
        </button>
        <button type="button" onClick={() => { setRpm(9.5); setR(10); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Small station (10 m)
        </button>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Artificial gravity from rotation obeys a = ω²r — and it is the one countermeasure that would fix everything at once, because it restores the very load the body evolved around. The catch is the purple line, the combinations that give a full g. Keep the spin below the ~2 rpm the inner ear can tolerate and the radius balloons to ~224 m — a rotating structure nearly half a kilometre across, far beyond anything ever launched. Shrink the station to a comfortable 10 m and you must spin it at ~9.5 rpm, deep in the zone where Coriolis forces on a turning head bring back the very nausea you were trying to cure. That trap — comfortable but enormous, or compact but sickening — is why no spacecraft has ever flown a centrifuge, and why every long-duration crew has simply endured weightlessness instead.
      </figcaption>
    </figure>
  );
}
