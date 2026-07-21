"use client";

import { useState } from "react";

// An interactive phases-of-Venus explorer, embedded via a fenced ```venusphases block
// (see Reader's `pre` override). This is Galileo's DECISIVE test. If Venus orbits the
// SUN, it runs through a COMPLETE cycle of phases — and its apparent SIZE changes
// dramatically: a big crescent when it swings between us and the Sun (near, dark side
// toward us), a small full disk when it is on the far side of the Sun (distant, lit face
// toward us). The pure Ptolemaic model, which keeps Venus always between Earth and Sun,
// can only ever show crescents — never a full Venus. Galileo saw the full cycle, so pure
// geocentrism was dead. Left: the heliocentric orrery. Right: Venus as seen from Earth,
// with the phase AND the true ~6× size swing. currentColor theming; first render
// deterministic. Physical distances (0.72 AU orbit) drive the phase and size exactly.

const rad = (d: number) => (d * Math.PI) / 180;
const r3 = (n: number) => Math.round(n * 1000) / 1000; // keep SSR/client SVG strings identical
const RV = 0.723; // Venus orbital radius, AU
const SUN = { x: 96, y: 150 }, SCALE = 60; // screen: Sun position, px per AU
const EARTH = { x: SUN.x, y: SUN.y + SCALE }; // Earth one AU "below" the Sun
const DCX = 344, DCY = 112, DRMAX = 44; // phase disk centre and maximum radius

const nameOf = (k: number) => {
  if (k < 0.04) return "new";
  if (k < 0.46) return "crescent";
  if (k < 0.54) return "half";
  if (k < 0.96) return "gibbous";
  return "full";
};

export function VenusPhases() {
  const [theta, setTheta] = useState(78); // Venus's angle around the Sun, degrees (a large crescent)

  // physical positions (AU), Sun at origin, Earth at (0, 1)
  const vx = RV * Math.cos(rad(theta)), vy = RV * Math.sin(rad(theta));
  const eDX = 0 - vx, eDY = 1 - vy; // Venus → Earth
  const sDX = -vx, sDY = -vy; // Venus → Sun
  const dist = Math.hypot(eDX, eDY); // Earth–Venus distance, AU
  const cosA = (eDX * sDX + eDY * sDY) / (dist * Math.hypot(sDX, sDY)); // phase-angle cosine
  const k = (1 + cosA) / 2; // illuminated fraction seen from Earth (1 = full, 0 = new)
  // apparent size ∝ 1/distance; largest at inferior conjunction (d ≈ 0.28 AU)
  const diskR = r3(Math.max(6, DRMAX * (0.277 / dist)));
  // which limb is lit: on which side of the Earth→Venus sight-line does the Sun lie?
  // (2-D cross product of Earth→Venus with Earth→Sun; Earth→Sun = (0,-1) in AU)
  const litRight = eDX * -1 - eDY * 0 > 0; // sign of (Earth→Venus) × (Earth→Sun)
  // terminator geometry (mirror of MoonPhase): elongDisk 180 = full, 0 = new
  const elongDisk = Math.acos(Math.max(-1, Math.min(1, 2 * k - 1))) * (180 / Math.PI);
  const termRx = r3(Math.abs(diskR * Math.cos(rad(elongDisk))));

  // screen positions
  const V = { x: r3(SUN.x + SCALE * vx), y: r3(SUN.y + SCALE * vy) };
  const phase = nameOf(k);

  return (
    <figure className="venus-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With Venus orbiting the Sun, we see a ${phase} phase; its apparent size is ${(diskR / DRMAX * 100).toFixed(0)}% of maximum.`}>

        {/* ── left: the heliocentric orrery ── */}
        <circle className="text-line" cx={SUN.x} cy={SUN.y} r={r3(SCALE * RV)} fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        {/* Sun */}
        <circle className="text-maroon" cx={SUN.x} cy={SUN.y} r={7} fill="currentColor" />
        <text className="text-faint" x={SUN.x} y={SUN.y - 11} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>
        {/* Earth */}
        <circle className="text-purple" cx={EARTH.x} cy={EARTH.y} r={6} fill="currentColor" />
        <text className="text-purple" x={EARTH.x} y={EARTH.y + 15} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
        {/* sight-line Earth → Venus, and the sunlight direction */}
        <line className="text-faint" x1={EARTH.x} y1={EARTH.y} x2={V.x} y2={V.y} stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 2" opacity={0.7} />
        <line className="text-maroon" x1={SUN.x} y1={SUN.y} x2={V.x} y2={V.y} stroke="currentColor" strokeWidth={0.6} opacity={0.4} />
        {/* Venus, half-lit toward the Sun */}
        <circle className="text-ink" cx={V.x} cy={V.y} r={6} fill="currentColor" />
        <text className="text-muted" x={V.x + 9} y={V.y} textAnchor="start" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Venus</text>

        {/* divider */}
        <line className="text-line" x1={232} y1={22} x2={232} y2={198} stroke="currentColor" strokeWidth={1} opacity={0.4} />
        <text className="text-faint" x={120} y={236} textAnchor="middle" fill="currentColor" fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">Venus orbits the Sun (the truth)</text>

        {/* ── right: Venus as seen from Earth — phase AND size ── */}
        {/* maximum-size reference ring, so the size swing is legible */}
        <circle cx={DCX} cy={DCY} r={DRMAX} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.6} strokeDasharray="2 2" opacity={0.4} />
        {/* the disk: lit base (text-ink = light), unlit half (text-card = dark), terminator ellipse */}
        <circle cx={DCX} cy={DCY} r={diskR} className="text-ink" fill="currentColor" />
        <path d={`M${DCX} ${DCY - diskR} A ${diskR} ${diskR} 0 0 ${litRight ? 1 : 0} ${DCX} ${DCY + diskR} Z`} className="text-card" fill="currentColor" />
        <ellipse cx={DCX} cy={DCY} rx={termRx} ry={diskR} className={k < 0.5 ? "text-card" : "text-ink"} fill="currentColor" />
        <circle cx={DCX} cy={DCY} r={diskR} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.8} />
        <text className="text-faint" x={DCX} y={DCY + DRMAX + 20} textAnchor="middle" fill="currentColor" fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">what we see from Earth</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A <strong className="text-purple">{phase}</strong> Venus, appearing <strong>{(diskR / DRMAX * 100).toFixed(0)}%</strong> of its maximum size — {k > 0.9 ? <>full and <strong>small</strong> (far, across the Sun).</> : k < 0.3 ? <>a <strong>large</strong> crescent (near, between us and the Sun).</> : <>midway in both phase and distance.</>} A full Venus is <em>impossible</em> if it orbits the Earth.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Venus around its orbit</span><span className="tabular-nums">{theta}°</span></span>
          <input type="range" min={0} max={360} step={1} value={theta} onChange={(e) => setTheta(Number(e.target.value))} aria-label="Venus's position around the Sun" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Crescent (near)", 78], ["Half (elongation)", 46], ["Full (far)", 270]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setTheta(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Galileo&rsquo;s <strong>decisive test</strong> — the observation that killed the ancient cosmos. Watching Venus for months, he saw it run through a <em>complete</em> cycle of phases like the Moon — crescent, half, gibbous, and <strong>full</strong> — and, crucially, its apparent size swung enormously: a big crescent, a small full disk (about six times larger when a crescent than when full). This is exactly what a Sun-orbiting Venus produces: when Venus passes between us and the Sun it is <span className="text-ink">near</span> and shows its dark side (a large crescent); when it swings to the far side of the Sun it is <span className="text-purple">distant</span> and shows its fully lit face (a small full disk). But the <em>Ptolemaic</em> model kept Venus forever <em>between</em> the Earth and the Sun — so it could only ever show crescents, and a <strong>full Venus was impossible.</strong> Galileo saw a full Venus. Pure geocentrism was refuted, decisively, by the eye. (Honestly: the phases also fit Tycho&rsquo;s hybrid model, in which Venus still orbits the Sun — so they killed Ptolemy without <em>alone</em> proving the moving Earth. But from 1610, the ancient cosmos was observationally dead.)
      </figcaption>
    </figure>
  );
}
