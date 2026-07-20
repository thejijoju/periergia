"use client";

import { useState } from "react";

// An interactive cosmic-distance-ladder explorer, embedded in an article via a
// fenced ```distanceladder block (see Reader's `pre` override). No single method
// measures all cosmic distances: each rung reaches only so far, and each is
// calibrated by the rung below it. Slide a target distance across a log axis from
// the solar system to the edge of the observable universe and watch which
// method(s) can reach it — and see the ladder that turned the flat sky of
// directions into a three-dimensional universe. Distances shown in parsecs.
// currentColor theming; first render deterministic (a nearby-galaxy distance).

type Rung = { name: string; lo: number; hi: number; below: string | null };
// lo/hi in log10(parsecs). ~1 AU = 4.85e-6 pc.
const RUNGS: Rung[] = [
  { name: "Radar ranging", lo: -6, hi: -3.5, below: null },
  { name: "Parallax", lo: -5.5, hi: 4, below: "radar (the AU)" },
  { name: "Cepheids", lo: 2, hi: 7.5, below: "parallax" },
  { name: "Type Ia supernovae", lo: 6, hi: 10, below: "Cepheids" },
  { name: "Redshift · Hubble's law", lo: 7, hi: 10.3, below: "supernovae" },
];

const L_MIN = -6, L_MAX = 10.3; // log10(pc)
const X0 = 30, X1 = 424, TOP = 26, ROW_H = 24;
const px = (logpc: number) => X0 + ((logpc - L_MIN) / (L_MAX - L_MIN)) * (X1 - X0);

// A few landmarks to label the axis (log10 pc).
const MARKS: { l: number; label: string }[] = [
  { l: Math.log10(4.85e-6), label: "1 AU" },
  { l: Math.log10(1.3), label: "nearest star" },
  { l: Math.log10(8000), label: "galactic centre" },
  { l: Math.log10(780000), label: "Andromeda" },
  { l: Math.log10(1e10), label: "the edge" },
];

function fmtDist(logpc: number): string {
  const ly = Math.pow(10, logpc) * 3.26; // parsecs → light-years
  if (ly < 1) return `${(Math.pow(10, logpc) * 206265).toExponential(1)} AU`;
  if (ly < 1e3) return `${ly.toFixed(ly < 10 ? 1 : 0)} light-years`;
  if (ly < 1e6) return `${(ly / 1e3).toFixed(1)} thousand ly`;
  if (ly < 1e9) return `${(ly / 1e6).toFixed(1)} million ly`;
  return `${(ly / 1e9).toFixed(1)} billion ly`;
}

export function DistanceLadder() {
  const [t, setT] = useState(6); // target distance, log10(pc)
  const reaching = RUNGS.filter((r) => t >= r.lo && t <= r.hi);
  const best = reaching.length ? reaching[reaching.length - 1] : null;

  return (
    <figure className="dl-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${fmtDist(t)}, the method that reaches is ${best ? best.name : "none"}.`}>
        {/* rung bars */}
        {RUNGS.map((r, i) => {
          const y = TOP + i * ROW_H;
          const on = t >= r.lo && t <= r.hi;
          return (
            <g key={r.name}>
              <rect className={on ? "text-purple" : "text-line"} x={px(r.lo)} y={y} width={px(r.hi) - px(r.lo)}
                height={ROW_H - 9} rx={3} fill="currentColor" opacity={on ? 0.85 : 0.3} />
              <text className={on ? "text-card" : "text-muted"} x={px(r.lo) + 5} y={y + (ROW_H - 9) / 2 + 3}
                fill="currentColor" fontSize={8.5} fontWeight={700}
                fontFamily="ui-sans-serif, system-ui, sans-serif">{r.name}</text>
            </g>
          );
        })}

        {/* target marker */}
        <line className="text-maroon" x1={px(t)} y1={TOP - 6} x2={px(t)} y2={TOP + RUNGS.length * ROW_H - 4}
          stroke="currentColor" strokeWidth={1.6} />
        <circle className="text-maroon" cx={px(t)} cy={TOP - 6} r={3.5} fill="currentColor" />

        {/* axis + landmarks */}
        <line className="text-line" x1={X0} y1={172} x2={X1} y2={172} stroke="currentColor" strokeWidth={1} />
        {MARKS.map((m) => (
          <g key={m.label}>
            <line className="text-faint" x1={px(m.l)} y1={172} x2={px(m.l)} y2={176} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={px(m.l)} y={186} textAnchor="middle" fill="currentColor" fontSize={7.5}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{m.label}</text>
          </g>
        ))}
        <text className="text-muted" x={(X0 + X1) / 2} y={202} textAnchor="middle" fill="currentColor" fontSize={9.5}
          fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">
          distance (log) ⟶ solar system to the edge of the observable universe
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        To measure <strong className="tabular-nums">{fmtDist(t)}</strong> away →{" "}
        {best
          ? <><span className="text-purple font-semibold">{best.name}</span>{best.below && <>, calibrated by {best.below}</>}.</>
          : <span className="text-maroon">off the ladder.</span>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>How far away is your target?</span><span className="tabular-nums">{fmtDist(t)}</span>
          </span>
          <input type="range" min={L_MIN} max={L_MAX} step={0.1} value={t} onChange={(e) => setT(Number(e.target.value))}
            aria-label="Target distance (log parsecs)" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The sky gives directions but not distances, and no single method can recover the depth across all scales — so astronomers built a <em>ladder</em>. <span className="text-purple">Radar</span> times an echo off a nearby planet, pinning the AU. <span className="text-purple">Parallax</span> measures a nearby star&rsquo;s tiny geometric shift as Earth orbits (pure geometry, d = 1/p), using that AU as its baseline. <span className="text-purple">Cepheid</span> variables, whose pulse period reveals their true brightness (Leavitt&rsquo;s law), are calibrated on nearby parallax stars and reach across to other galaxies. <span className="text-purple">Type Ia supernovae</span>, exploding white dwarfs of near-constant peak brightness, are calibrated on Cepheids and reach billions of light-years. And <span className="text-purple">redshift with Hubble&rsquo;s law</span> carries us to the farthest galaxies of all. Each rung overlaps and calibrates the next, so an error low down propagates all the way up — and together they turned the flat map of directions into a three-dimensional universe, every star and galaxy at its true distance. That recovered depth is what lets us find the worlds where life might live and say how far away they are.
      </figcaption>
    </figure>
  );
}
