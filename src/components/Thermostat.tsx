"use client";

import { useState } from "react";

// An interactive of the carbon-silicate thermostat as a negative feedback, embedded via a
// fenced ```thermostat block (see Reader's `pre` override). The left panel is the cycle ring
// (volcanoes emit CO2 -> it dissolves in rain -> the acid weathers silicate rock -> carbon
// precipitates as carbonate -> plate tectonics subducts it back to the volcanoes). The right
// panel shows what makes it a THERMOSTAT: nudge Earth off its 288 K set-point and the
// weathering rate — which rises with temperature — pulls it back. The same nudge on a planet
// with Venus's POSITIVE (water-vapour) feedback runs away instead. Both trajectories are an
// iterated linear map T_next = T_set + k*(T - T_set): k < 1 decays back (Earth), k > 1
// diverges (Venus). That is pure multiply/add, bit-identical in SSR and client — no baking
// needed beyond the static ring coordinates.

const RING = [
  { x: 108.0, y: 46.0, label: "volcanoes", sub: "emit CO₂" },
  { x: 168.9, y: 90.2, label: "rain", sub: "carbonic acid" },
  { x: 145.6, y: 161.8, label: "weathering", sub: "of silicate rock" },
  { x: 70.4, y: 161.8, label: "carbonate", sub: "limestone" },
  { x: 47.1, y: 90.2, label: "subduction", sub: "buries carbon" },
];

const TSET = 288; // K set-point
const K_EARTH = 0.62; // < 1 → converges (negative feedback)
const K_VENUS = 1.22; // > 1 → diverges (positive feedback)
const STEPS = 12;
const r1 = (n: number) => Math.round(n * 10) / 10;

// trajectory as an iterated linear map (pure arithmetic → hydration-safe)
function traj(t0: number, k: number): number[] {
  const out = [t0];
  for (let n = 0; n < STEPS; n++) out.push(TSET + k * (out[out.length - 1] - TSET));
  return out;
}

// right-panel plot box
const GX0 = 236, GX1 = 420, GY0 = 34, GYB = 176;
const TMIN = 250, TMAX = 326;
const gx = (n: number) => r1(GX0 + (n / STEPS) * (GX1 - GX0));
const gy = (t: number) => r1(GYB - ((Math.max(TMIN, Math.min(TMAX, t)) - TMIN) / (TMAX - TMIN)) * (GYB - GY0));
const poly = (ts: number[]) => ts.map((t, n) => `${gx(n)},${gy(t)}`).join(" ");

export function Thermostat() {
  const [delta, setDelta] = useState(24); // initial push above set-point (K)
  const warm = delta >= 0;
  const earth = traj(TSET + delta, K_EARTH);
  const venus = traj(TSET + delta, K_VENUS);
  const earthEnd = Math.round(earth[STEPS]);

  return (
    <figure className="thermostat-scene my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label="The carbon-silicate cycle drawn as a ring, and a plot showing that when Earth is nudged off its 288 K set-point the temperature-dependent weathering rate returns it there (a negative feedback), whereas the same nudge on a planet with Venus's positive water-vapour feedback runs away.">

        {/* ---- left: the cycle ring ---- */}
        <circle cx={108} cy={110} r={64} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 4" opacity={0.55} />
        {/* directional arrowheads along the ring */}
        {RING.map((p, i) => {
          const q = RING[(i + 1) % RING.length];
          const mx = r1((p.x + q.x) / 2), my = r1((p.y + q.y) / 2);
          const ang = Math.atan2(q.y - p.y, q.x - p.x);
          const a1 = ang - 2.5, a2 = ang + 2.5;
          return (
            <path key={`a${i}`} d={`M${r1(mx + 4 * Math.cos(a1))} ${r1(my + 4 * Math.sin(a1))} L${mx} ${my} L${r1(mx + 4 * Math.cos(a2))} ${r1(my + 4 * Math.sin(a2))}`}
              className="text-faint" fill="none" stroke="currentColor" strokeWidth={0.9} opacity={0.7} />
          );
        })}
        {RING.map((p, i) => {
          const hot = warm && p.label === "weathering";
          return (
            <g key={i}>
              <circle cx={p.x} cy={p.y} r={3} className={hot ? "text-maroon" : "text-muted"} fill="currentColor" />
              <text x={p.x} y={p.y - 6} textAnchor="middle" className={hot ? "text-maroon" : "text-ink"} fill="currentColor"
                fontSize={7.2} fontWeight={hot ? 800 : 700} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.label}</text>
              <text x={p.x} y={p.y + 10} textAnchor="middle" className="text-faint" fill="currentColor"
                fontSize={5.8} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.sub}</text>
            </g>
          );
        })}
        <text x={108} y={107} textAnchor="middle" className="text-faint" fill="currentColor" fontSize={6.3}
          fontFamily="ui-sans-serif, system-ui, sans-serif">carbon–silicate</text>
        <text x={108} y={116} textAnchor="middle" className="text-faint" fill="currentColor" fontSize={6.3}
          fontFamily="ui-sans-serif, system-ui, sans-serif">cycle</text>

        {/* ---- right: the feedback plot ---- */}
        {/* set-point band */}
        <line x1={GX0} y1={gy(TSET)} x2={GX1} y2={gy(TSET)} className="text-ink" stroke="currentColor" strokeWidth={0.8} strokeDasharray="3 3" opacity={0.55} />
        <text className="text-faint" x={GX1} y={gy(TSET) - 3} textAnchor="end" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">set-point 288 K</text>
        {/* Venus runaway (positive feedback) */}
        <polyline points={poly(venus)} className="text-faint" fill="none" stroke="currentColor" strokeWidth={1.1} strokeDasharray="4 3" opacity={0.8} />
        <text className="text-faint" x={gx(STEPS)} y={gy(venus[STEPS]) - 3} textAnchor="end" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Venus: positive → runs away</text>
        {/* Earth restoring (negative feedback) */}
        <polyline points={poly(earth)} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.6} opacity={0.95} />
        {earth.map((t, n) => (
          <circle key={n} cx={gx(n)} cy={gy(t)} r={1.5} className="text-maroon" fill="currentColor" opacity={0.9} />
        ))}
        <text className="text-maroon" x={gx(STEPS)} y={gy(earth[STEPS]) + 10} textAnchor="end" fill="currentColor" fontSize={6} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Earth: negative → returns</text>
        <text className="text-faint" x={GX0} y={GYB + 11} fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">time →</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Nudge the planet <strong className={warm ? "text-maroon" : "text-ink"}>{warm ? `+${delta} K warmer` : `${delta} K cooler`}</strong>.{" "}
        {warm
          ? <>Warmth speeds up <strong className="text-maroon">weathering</strong>, which strips CO₂ from the air, weakening the greenhouse —</>
          : <>Cold slows <strong>weathering</strong>, so volcanic CO₂ builds up and strengthens the greenhouse —</>}
        {" "}so Earth slides back to <strong>{earthEnd} K</strong>. The same nudge with Venus&rsquo;s feedback runs away.
      </p>

      <div className="mt-4">
        <input type="range" min={-24} max={24} step={2} value={delta}
          onChange={(e) => setDelta(Number(e.target.value))}
          className="w-full accent-maroon" aria-label="Temperature perturbation from set-point" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>−24 K (cool)</span><span>set-point</span><span>+24 K (warm)</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The carbon–silicate cycle is the same loop on Venus and Earth — volcanoes breathe CO₂ out, rain and weathering pull it down into carbonate rock, and plate tectonics buries it — but on Earth it is a <strong>thermostat</strong>, because one step depends on temperature. Weathering runs faster when the planet is warm (more rain, faster chemistry) and slower when it is cold, so a warm excursion is met by <em>extra</em> CO₂ removal that cools the planet back down, and a cold excursion lets CO₂ accumulate until it warms back up. Any push is answered by a correction in the opposite direction: a <strong>negative feedback</strong>, and the reason Earth has held liquid water for four billion years while the Sun brightened by a third. Venus, having lost the liquid water that the cycle needs, was instead governed by the water-vapour feedback — which amplifies a push rather than opposing it — and ran away to 737 K. Two nearly identical planets; the sign of one feedback loop is the whole difference between a biosphere and an oven. (The loop needs <em>both</em> liquid water, for the weathering, and plate tectonics, to bury the carbon — lose either and the thermostat stops.)
      </figcaption>
    </figure>
  );
}
