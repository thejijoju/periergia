"use client";

import { useState } from "react";

// An interactive sun-synchronous orbit designer, embedded in an article via a
// fenced ```sunsync block (see Reader's `pre` override). Earth's equatorial
// bulge (J2) makes an orbit's node precess at a rate set by altitude and
// inclination: Ω̇ = −(3/2) J2 (R⊕/a)² n cos i. Tune it to exactly +0.9856°/day —
// the Sun's apparent drift — and the orbit plane tracks the Sun, freezing the
// lighting forever (Landsat, every weather satellite). The plot draws the
// sun-synchronous locus in the altitude–inclination plane; drag altitude and
// inclination and watch the actual precession, landing on the curve only when
// the orbit is truly sun-synchronous. currentColor theming (light/dark); first
// render deterministic (705 km, on the curve).

const J2 = 1.0826e-3;
const RE = 6378; // km, equatorial radius (the R² term)
const RE_MEAN = 6371; // km, for the semi-major axis
const MU = 3.986e5; // km³/s²
const TARGET = 1.991e-7; // rad/s = +0.9856°/day, the Sun's apparent drift
const RAD_TO_DEG_DAY = (180 / Math.PI) * 86400;

const ALT_LO = 300, ALT_HI = 1600; // km
const INC_LO = 90, INC_HI = 104; // deg

const X0 = 48, X1 = 424, Y0 = 16, Y1 = 196;
const px = (alt: number) => X0 + ((alt - ALT_LO) / (ALT_HI - ALT_LO)) * (X1 - X0);
const py = (inc: number) => Y1 - ((inc - INC_LO) / (INC_HI - INC_LO)) * (Y1 - Y0);

// Nodal precession rate (rad/s) for a circular orbit at altitude `alt`, inclination `inc`°.
function precessRadS(alt: number, inc: number): number {
  const a = RE_MEAN + alt;
  const n = Math.sqrt(MU / a ** 3);
  return -1.5 * J2 * (RE * RE) / (a * a) * n * Math.cos((inc * Math.PI) / 180);
}

// Inclination (°) that makes the orbit sun-synchronous at this altitude.
function reqInc(alt: number): number {
  const a = RE_MEAN + alt;
  const n = Math.sqrt(MU / a ** 3);
  const D = -1.5 * J2 * (RE * RE) / (a * a) * n;
  return (Math.acos(Math.max(-1, Math.min(1, TARGET / D))) * 180) / Math.PI;
}

function locusPath(): string {
  const N = 80;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const alt = ALT_LO + (i / N) * (ALT_HI - ALT_LO);
    d += `${i === 0 ? "M" : "L"}${px(alt).toFixed(1)} ${py(reqInc(alt)).toFixed(1)}`;
  }
  return d;
}

export function SunSyncOrbit() {
  const [alt, setAlt] = useState(705);
  const [inc, setInc] = useState(98.2);
  const rate = precessRadS(alt, inc) * RAD_TO_DEG_DAY; // °/day
  const need = reqInc(alt);
  const synced = Math.abs(rate - 0.9856) < 0.015;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${alt} km and ${inc.toFixed(1)}° inclination the node drifts ${rate.toFixed(2)} degrees per day.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>
        {/* polar reference (i = 90°, zero precession) */}
        <line className="text-faint" x1={X0} y1={py(90)} x2={X1} y2={py(90)}
          stroke="currentColor" strokeWidth={1} strokeDasharray="2 4" opacity={0.7} />
        <text className="text-faint" x={X1 - 2} y={py(90) - 3} textAnchor="end" fill="currentColor"
          fontSize={8.5} fontFamily="ui-sans-serif, system-ui, sans-serif">polar · no precession</text>

        {/* the sun-synchronous locus */}
        <path className="text-purple" d={locusPath()} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />
        <text className="text-purple" x={px(1300)} y={py(reqInc(1300)) - 6} textAnchor="middle"
          fill="currentColor" fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          sun-synchronous
        </text>

        {/* current design point */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(alt)} y1={py(inc)} x2={px(alt)} y2={Y1} />
          <line x1={X0} y1={py(inc)} x2={px(alt)} y2={py(inc)} />
        </g>
        <circle className={synced ? "text-purple" : "text-maroon"} cx={px(alt)} cy={py(inc)} r={4.5}
          fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">altitude (km) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            inclination (°)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(400)} y={Y1 + 12} textAnchor="middle">400</text>
          <text x={px(800)} y={Y1 + 12} textAnchor="middle">800</text>
          <text x={px(1200)} y={Y1 + 12} textAnchor="middle">1200</text>
          <text x={X0 - 4} y={py(96) + 3} textAnchor="end">96</text>
          <text x={X0 - 4} y={py(100) + 3} textAnchor="end">100</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {alt} km, <strong className="tabular-nums">{inc.toFixed(1)}°</strong> → the node drifts{" "}
        <span className={`font-semibold ${synced ? "text-purple" : "text-maroon"}`}>{rate.toFixed(2)}°/day</span>.{" "}
        {synced
          ? <strong className="text-purple">Sun-synchronous — the lighting is frozen forever.</strong>
          : <>Sun-sync here needs <strong>{need.toFixed(1)}°</strong> (to hit +0.99°/day).</>}
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Altitude</span><span className="tabular-nums">{alt} km</span>
          </span>
          <input type="range" min={ALT_LO} max={ALT_HI} step={5} value={alt}
            onChange={(e) => setAlt(Number(e.target.value))}
            aria-label="Altitude" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Inclination</span><span className="tabular-nums">{inc.toFixed(1)}°</span>
          </span>
          <input type="range" min={INC_LO} max={INC_HI} step={0.1} value={inc}
            onChange={(e) => setInc(Number(e.target.value))}
            aria-label="Inclination" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        <button type="button" onClick={() => { setAlt(705); setInc(98.2); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Landsat (705 km)
        </button>
        <button type="button" onClick={() => { setInc(90); }}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Polar (90°)
        </button>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Earth&rsquo;s equatorial bulge (J2) swivels an orbit&rsquo;s plane at a rate you tune with two knobs: altitude and inclination. A <em>polar</em> orbit (90°) doesn&rsquo;t precess at all; tilt just past polar — retrograde — and the plane drifts <em>eastward</em>. Tune that drift to exactly <strong>+0.9856°/day</strong>, the rate the Sun appears to move against the stars, and the orbit plane tracks the Sun: every pass crosses at the same local time, forever. That&rsquo;s the <span className="text-purple">sun-synchronous</span> curve — every Earth-observation and weather satellite in history lives on it, which is why they all orbit backward at inclinations near 98°. The master annoyance, tuned into the tool that makes a fifty-year climate record possible.
      </figcaption>
    </figure>
  );
}
