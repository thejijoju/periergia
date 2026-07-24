"use client";

import { useState } from "react";

// An interactive of the Earth-Moon tidal evolution, embedded via a fenced ```tidalrecession
// block (see Reader's `pre` override). The left schematic shows the mechanism: Earth spins
// faster than the Moon orbits, so friction drags the tidal bulge AHEAD of the Earth-Moon
// line; the leading bulge pulls the Moon forward (adding angular momentum, so it recedes),
// and the Moon pulls back on the bulge (braking Earth's spin). The slider steps through deep
// time; the readout gives the Moon's distance, the day length, and — the payoff — the number
// of days in a year, which 400-million-year-old corals independently confirm.
//
// Epoch distances and day lengths are baked literals (the ancient ones approximate, and
// labelled so); days-per-year and the tide factor are pure arithmetic (divide, and a cube by
// repeated multiply), bit-identical in SSR and client. The schematic geometry is static.

type E = { label: string; dist: number; day: number; mx: number; mr: number; approx: boolean; coral?: boolean; note: string };
const EPOCHS: E[] = [
  { label: "≈4.5 Gyr ago — just formed", dist: 4, day: 5, mx: 120, mr: 14, approx: true, note: "The Moon fills the sky and tides are thousands of times stronger." },
  { label: "≈3.5 Gyr ago", dist: 38, day: 12, mx: 168, mr: 7.5, approx: true, note: "The day is roughly half its present length." },
  { label: "≈400 Myr ago — the Devonian", dist: 59, day: 22, mx: 196, mr: 5.8, approx: false, coral: true, note: "Fossil corals lay down daily bands — and record about 400 days per year." },
  { label: "today", dist: 60.3, day: 24, mx: 202, mr: 5.5, approx: false, note: "Receding 3.8 cm/yr; the day lengthens 1.8 ms per century." },
];
const TODAY_DIST = 60.3;
const r1 = (n: number) => Math.round(n * 10) / 10;
const EY = 104, ECX = 72, ER = 24; // Earth centre/radius in the schematic

// days/year bar
const BX = 250, BW = 168, BMAX = 1800;

export function TidalRecession() {
  const [i, setI] = useState(3); // start today, then wind back
  const e = EPOCHS[i];
  const dpy = Math.round((365.25 * 24) / e.day);
  const ratio = TODAY_DIST / e.dist;
  const tide = ratio * ratio * ratio; // tidal force ∝ 1/r³
  const tideStr = tide >= 100 ? Math.round(tide).toLocaleString("en-US") : f1(tide);
  const barW = r1(Math.min(1, dpy / BMAX) * BW);

  return (
    <figure className="tidal-scene my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 216" className="w-full h-auto" role="img"
        aria-label="Earth raises a tidal bulge that its faster rotation drags ahead of the Earth-Moon line; the leading bulge pulls the Moon forward so it spirals outward while braking Earth's spin. Winding back through deep time, the Moon was closer, the day shorter, and the year held more days — about 400 in the Devonian, as fossil corals confirm.">

        {/* ---- left: mechanism schematic ---- */}
        {/* tidal bulge (water envelope), long axis dragged ahead of the Earth–Moon line */}
        <ellipse cx={ECX} cy={EY} rx={33} ry={24} className="text-purple" fill="currentColor" opacity={0.22}
          transform={`rotate(-22 ${ECX} ${EY})`} />
        {/* solid Earth */}
        <circle cx={ECX} cy={EY} r={ER} className="text-muted" fill="currentColor" opacity={0.5} />
        <circle cx={ECX} cy={EY} r={ER} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.7} opacity={0.7} />
        {/* spin arrow */}
        <path d={`M${ECX - 14} ${EY - 20} A 18 18 0 0 1 ${ECX + 14} ${EY - 20}`} className="text-faint" fill="none" stroke="currentColor" strokeWidth={0.8} opacity={0.7} />
        <path d={`M${ECX + 14} ${EY - 20} l-1,-4 l4,2 z`} className="text-faint" fill="currentColor" opacity={0.8} />
        <text x={ECX} y={EY - 30} textAnchor="middle" className="text-faint" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Earth spins fast</text>
        {/* Earth–Moon line */}
        <line x1={ECX} y1={EY} x2={e.mx} y2={EY} className="text-line" stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 3" opacity={0.5} />
        {/* leading-bulge label */}
        <text x={ECX + 30} y={EY - 20} textAnchor="middle" className="text-purple" fill="currentColor" fontSize={5.8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">bulge dragged ahead</text>
        {/* the Moon */}
        <circle cx={e.mx} cy={EY} r={e.mr} className="text-ink" fill="currentColor" opacity={0.8} />
        <text x={e.mx} y={EY + e.mr + 9} textAnchor="middle" className="text-ink" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Moon</text>
        {/* forward pull on the Moon → recedes */}
        <line x1={e.mx} y1={EY - e.mr - 2} x2={e.mx} y2={EY - e.mr - 16} className="text-maroon" stroke="currentColor" strokeWidth={1.2} />
        <path d={`M${e.mx} ${EY - e.mr - 16} l-2.5,4 l5,0 z`} className="text-maroon" fill="currentColor" />
        <text x={e.mx} y={EY - e.mr - 19} textAnchor="middle" className="text-maroon" fill="currentColor" fontSize={5.8} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">+ momentum → recedes</text>

        {/* ---- right: readout ---- */}
        <text className="text-ink" x={BX} y={36} fill="currentColor" fontSize={9} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{e.approx ? "≈ " : ""}{e.day} h day</text>
        <text className="text-muted" x={BX} y={52} fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">Moon at {e.approx ? "≈" : ""}{e.dist} Earth-radii</text>
        <text className="text-muted" x={BX} y={64} fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">tides {tideStr}× today&rsquo;s</text>
        {/* days/year bar */}
        <text className="text-faint" x={BX} y={92} fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">days per year</text>
        <rect x={BX} y={98} width={BW} height={12} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.6} opacity={0.5} />
        <rect x={BX} y={98} width={barW} height={12} className="text-maroon" fill="currentColor" opacity={0.85} />
        <text className="text-maroon" x={BX + barW + 4} y={108} fill="currentColor" fontSize={8} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{dpy}</text>
        {e.coral && (
          <text className="text-maroon" x={BX} y={128} fill="currentColor" fontSize={6.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">✓ Devonian corals record ~400 — they agree</text>
        )}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong>{e.label === "today" ? "Today" : e.label}</strong> — {e.note}
      </p>

      <div className="mt-4">
        <input type="range" min={0} max={EPOCHS.length - 1} step={1} value={i}
          onChange={(ev) => setI(Number(ev.target.value))}
          className="w-full accent-maroon" aria-label="Time through the Earth–Moon system's history" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>4.5 Gyr ago</span><span>← the Moon spirals out over time</span><span>today</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The Moon raises a tidal bulge in Earth&rsquo;s oceans and rock, but Earth turns once a day while the Moon takes 27 days to orbit, so friction drags that bulge <strong>ahead</strong> of the line between them. The leading bulge&rsquo;s gravity tugs the Moon forward along its orbit — adding angular momentum, so it climbs to a higher orbit — while the Moon tugs back on the bulge and <strong>brakes Earth&rsquo;s spin</strong>. Momentum is simply moving from Earth&rsquo;s rotation to the Moon&rsquo;s orbit: the Moon recedes 3.8 cm a year (measured by lasers off the Apollo mirrors) and our day lengthens 1.8 ms a century. Wind the clock back and the Moon was closer, the day shorter, and the year held more days — and this is checkable: 400-million-year-old Devonian corals, whose daily growth bands are grouped into years, record about <strong>400 days</strong>, matching the calculation almost exactly. A laser and a fossil, agreeing. One caution the slider makes visible: you <em>cannot</em> just run today&rsquo;s 3.8 cm/yr straight back — it would put the Moon at Earth&rsquo;s surface only 1.5 Gyr ago, which is wrong. Tidal drag depends on the shape of the ocean basins, which plate tectonics keeps rearranging, so the present rate is unusually high. Extrapolating a rate far past where it was measured, when the rate itself keeps changing, is a mistake worth remembering.
      </figcaption>
    </figure>
  );
}

// format to one decimal without trailing .0
function f1(x: number): string {
  const r = Math.round(x * 10) / 10;
  return Number.isInteger(r) ? `${r}` : r.toFixed(1);
}
