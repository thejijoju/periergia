"use client";

import { useState } from "react";

// An interactive mean-motion-resonance explorer, embedded via a fenced ```resonance
// block (see Reader's `pre` override). The enabling concept behind the Nice model: why
// weak gravitational tugs between planets usually cancel — but at a simple period ratio
// become structurally decisive. Two planets meet (conjunction) at a longitude that
// advances by a fixed step each time; when the outer/inner period ratio is a small whole
// number like 2:1 or 3:2, those meetings land on just a few longitudes over and over, so
// the tug is applied in the same place again and again and ACCUMULATES — the swing-
// pushing principle. Off resonance, meetings spread all around the orbit and the tugs
// average away. The histogram shows where the next few dozen conjunctions fall; drag the
// period ratio and watch them pile up or scatter. Pure arithmetic (no trig), so SSR and
// client markup match exactly. currentColor theming; first render at the 2:1 resonance.

const PX0 = 44, PX1 = 418, PY0 = 34, PY1 = 130; // histogram box
const N = 36; // conjunctions to plot
const BIN = 5; // degrees per bin
const CAP = 9; // conjunctions-per-bin that reaches full bar height
const r1 = (n: number) => Math.round(n * 10) / 10;
const xOf = (deg: number) => r1(PX0 + (deg / 360) * (PX1 - PX0));

// known low-order resonances to name (outer:inner period ratio)
const RATIOS: [string, number][] = [
  ["2:1", 2], ["3:2", 1.5], ["4:3", 4 / 3], ["5:3", 5 / 3], ["5:2", 2.5], ["7:4", 1.75], ["3:1", 3], ["7:3", 7 / 3],
];

export function Resonance() {
  const [R, setR] = useState(2.0); // outer/inner orbital-period ratio

  // conjunction longitudes: each advances by 360/(R-1) degrees, then binned
  const step = 360 / (R - 1);
  const bins: number[] = new Array(Math.ceil(360 / BIN)).fill(0);
  for (let i = 0; i < N; i++) {
    const lon = ((i * step) % 360 + 360) % 360;
    bins[Math.min(bins.length - 1, Math.floor(lon / BIN))]++;
  }
  const maxCount = Math.max(...bins);
  const occupied = bins.filter((c) => c > 0).length;
  const resonant = maxCount >= 5; // a few longitudes carry most of the hits
  // nearest named resonance within tolerance
  const near = RATIOS.reduce<[string, number] | null>((best, r) => {
    const d = Math.abs(r[1] - R);
    return d < 0.03 && (!best || d < Math.abs(best[1] - R)) ? r : best;
  }, null);

  return (
    <figure className="resonance-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 172" className="w-full h-auto" role="img"
        aria-label={resonant
          ? `At a period ratio near ${near ? near[0] : r1(R) + ":1"}, conjunctions pile up at ${occupied} longitude${occupied === 1 ? "" : "s"} — the tugs accumulate.`
          : `At a period ratio of ${r1(R)}, conjunctions are spread across ${occupied} longitudes — the tugs average away.`}>

        {/* histogram baseline */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        {[0, 90, 180, 270, 360].map((d) => (
          <g key={d}>
            <line className="text-faint" x1={xOf(d)} y1={PY1} x2={xOf(d)} y2={PY1 + 3} stroke="currentColor" strokeWidth={0.6} opacity={0.6} />
            <text className="text-faint" x={xOf(d)} y={PY1 + 12} textAnchor="middle" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">{d}°</text>
          </g>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 24} textAnchor="middle" fill="currentColor" fontSize={6.8} fontFamily="ui-sans-serif, system-ui, sans-serif">longitude where the two planets meet (conjunction)</text>

        {/* the bars */}
        {bins.map((c, i) => {
          if (c === 0) return null;
          const h = Math.min(1, c / CAP) * (PY1 - PY0);
          const x = xOf(i * BIN);
          return <rect key={i} x={x} y={r1(PY1 - h)} width={Math.max(2, (PX1 - PX0) / bins.length - 0.6)} height={r1(h)} className={resonant ? "text-purple" : "text-muted"} fill="currentColor" opacity={resonant ? 0.9 : 0.7} />;
        })}

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={PX0} y={22} fill="currentColor" fontSize={8.5} fontWeight={600}>period ratio {r1(R)} : 1{resonant && near ? `  (the ${near[0]} resonance)` : ""}</text>
          <text className={resonant ? "text-purple" : "text-muted"} x={PX1} y={22} textAnchor="end" fill="currentColor" fontSize={9.5} fontWeight={800}>{resonant ? "tugs ACCUMULATE" : "tugs average away"}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {resonant
          ? <>At a <strong className="text-purple">{near ? near[0] : "simple"} resonance</strong> the planets keep meeting at the <strong>same few longitudes</strong>, so each gravitational tug lands in the same place and <strong className="text-purple">builds up</strong> — like pushing a swing in time.</>
          : <>Off resonance the meetings <strong>drift all the way around</strong> the orbit, so the tugs point every which way and <strong>cancel out.</strong> The planets barely feel each other.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Outer / inner period ratio</span><span className="tabular-nums">{r1(R)} : 1</span></span>
          <input type="range" min={1.3} max={3.2} step={0.01} value={R} onChange={(e) => setR(Number(e.target.value))} aria-label="Outer to inner orbital period ratio" className="mt-1 w-full" style={{ accentColor: resonant ? "var(--c-purple)" : "var(--c-muted)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["2:1", 2], ["3:2", 1.5], ["5:2", 2.5], ["off-resonance (2.15)", 2.15]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setR(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Two planets tug on each other every time they line up on the same side of the Sun — a <strong>conjunction</strong>. Usually those meetings happen at a slightly different longitude each time, creeping all the way around the orbit, so the little tugs point in every direction and <strong>average to nothing</strong> — which is why, thanks to the Sun&rsquo;s overwhelming gravity, the planets normally ignore one another. But when their orbital periods form a ratio of small whole numbers — a <strong>mean-motion resonance</strong> like <strong className="text-purple">2:1</strong> (the inner planet orbits exactly twice for each outer orbit) or 3:2 — the geometry <em>repeats</em>: the conjunctions land on just a few fixed longitudes, over and over. Now each tug is applied in the same place at the same phase, again and again, and instead of cancelling they <strong className="text-purple">accumulate</strong> — exactly like feeble pushes on a swing, timed to each cycle, building a large swing from tiny efforts. A weak force made coherent becomes structurally decisive: resonances carve the Kirkwood gaps in the asteroid belt, lock Pluto safely into 3:2 with Neptune, and drive the Galilean moons&rsquo; volcanism. And because a <em>migrating</em> planet&rsquo;s period ratio steadily changes, it must sweep through resonances — which is how the slow drift of the Nice model became a system-wide catastrophe when Jupiter and Saturn crossed 2:1.
      </figcaption>
    </figure>
  );
}
