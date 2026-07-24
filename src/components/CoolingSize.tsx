"use client";

import { useState } from "react";

// An interactive size-cooling-activity explorer, embedded via a fenced ```coolingsize
// block (see Reader's `pre` override). The master variable of Unit II. A planet is a heat
// engine, and its geological life is the story of how fast it loses heat: heat is made
// throughout the VOLUME (∝ R^3) but escapes through the SURFACE (∝ R^2), so the
// loss-to-content ratio is A/V = 3/R — small worlds cool fast, large worlds stay hot.
// Plot the terrestrial worlds' cooling rate (relative to Earth = R_earth/R) against their
// radius and the correlation with geological vitality is essentially perfect: the two
// smallest are dead, the two largest active. Pick a world to see its numbers. The curve
// is cooling = 6371/R — pure division, identical in SSR and client. currentColor theming.

const PX0 = 46, PX1 = 418, PY0 = 28, PY1 = 158; // plot box
const RMAX = 6900, CMAX = 4; // axis maxima (radius km, cooling rate rel Earth)
const RE = 6371; // Earth radius, km
const r1 = (n: number) => Math.round(n * 10) / 10;
const xOf = (rkm: number) => r1(PX0 + (rkm / RMAX) * (PX1 - PX0));
const yOf = (c: number) => r1(PY1 - (Math.min(c, CMAX) / CMAX) * (PY1 - PY0));
const coolOf = (rkm: number) => RE / rkm; // cooling rate relative to Earth

type W = { key: string; name: string; r: number; status: string; active: boolean; ldx: number };
const WORLDS: W[] = [
  { key: "Moon", name: "the Moon", r: 1737, status: "Dead — no volcanism for ~1 Gyr, no tectonics", active: false, ldx: 0 },
  { key: "Mercury", name: "Mercury", r: 2440, status: "Dead — contracted as it cooled, making global scarps", active: false, ldx: 0 },
  { key: "Mars", name: "Mars", r: 3390, status: "Mostly dead — giant extinct volcanoes, no plate tectonics", active: false, ldx: 0 },
  { key: "Venus", name: "Venus", r: 6052, status: "Active — widespread volcanism, resurfaced ~500 Myr ago", active: true, ldx: -13 },
  { key: "Earth", name: "Earth", r: RE, status: "Active — plate tectonics and ongoing volcanism", active: true, ldx: 13 },
];

// the theoretical curve cooling = 6371/R, drawn where it is on-scale (cooling <= 4)
const CURVE = (() => {
  const pts: string[] = [];
  const rStart = Math.ceil(RE / CMAX); // R where cooling = CMAX
  for (let r = rStart; r <= RMAX; r += 60) pts.push(`${xOf(r)},${yOf(coolOf(r))}`);
  return pts.join(" ");
})();

export function CoolingSize() {
  const [sel, setSel] = useState("Mars");
  const w = WORLDS.find((x) => x.key === sel)!;
  const cool = coolOf(w.r);
  const av = 3 / w.r; // km^-1

  return (
    <figure className="cooling-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={`Geological activity versus size: the small worlds (Moon, Mercury) cool fastest and are dead; the large worlds (Venus, Earth) cool slowly and stay active. ${w.name}, radius ${w.r} km, cools ${r1(cool)} times faster than Earth.`}>

        {/* "cools fast → dead" band near the top */}
        <rect x={PX0} y={PY0} width={PX1 - PX0} height={r1(yOf(1.9) - PY0)} className="text-maroon" fill="currentColor" opacity={0.05} />
        <text className="text-maroon" x={PX1 - 3} y={PY0 + 9} textAnchor="end" fill="currentColor" fontSize={6.6} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>cools fast → geologically dead</text>

        {/* the 3/R cooling curve */}
        <polyline points={CURVE} className="text-faint" fill="none" stroke="currentColor" strokeWidth={1.2} strokeDasharray="3 3" opacity={0.7} />

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        {[[1, "1×"], [2, "2×"], [3, "3×"]].map(([c, lbl]) => (
          <text key={lbl as string} className="text-faint" x={PX0 - 4} y={yOf(c as number) + 2.5} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">{lbl}</text>
        ))}
        <text className="text-faint" x={PX0 - 30} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 30} ${(PY0 + PY1) / 2})`}>cooling rate (× Earth)</text>
        {[2000, 4000, 6000].map((r) => (
          <text key={r} className="text-faint" x={xOf(r)} y={PY1 + 11} textAnchor="middle" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">{r.toLocaleString("en-US")}</text>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 22} textAnchor="middle" fill="currentColor" fontSize={6.8} fontFamily="ui-sans-serif, system-ui, sans-serif">radius (km)</text>

        {/* the worlds */}
        {WORLDS.map((x) => {
          const cx = xOf(x.r), cy = yOf(coolOf(x.r));
          const on = x.key === sel;
          return (
            <g key={x.key}>
              <circle cx={cx} cy={cy} r={on ? 6 : 4} className={x.active ? "text-purple" : "text-maroon"} fill="currentColor" opacity={on ? 1 : 0.8} stroke={on ? "currentColor" : "none"} strokeWidth={on ? 1.4 : 0} />
              <text x={cx + x.ldx} y={cy - (on ? 10 : 8)} textAnchor="middle" className={x.active ? "text-purple" : "text-maroon"} fill="currentColor" fontSize={on ? 7.5 : 6.6} fontWeight={on ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{x.key}</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className={w.active ? "text-purple" : "text-maroon"}>{w.name}</strong> (radius {w.r.toLocaleString("en-US")} km) cools about <strong>{r1(cool)}× faster</strong> than Earth — and is <strong className={w.active ? "text-purple" : "text-maroon"}>{w.active ? "geologically active" : "geologically dead"}.</strong> {w.status.split("—")[1]?.trim() ? <>{w.status.split("—")[1].trim()}.</> : null}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {WORLDS.map((x) => (
          <button key={x.key} type="button" onClick={() => setSel(x.key)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${sel === x.key ? (x.active ? "border-purple text-purple font-semibold" : "border-maroon text-maroon font-semibold") : "border-line text-muted hover:text-ink hover:border-ink"}`}>{x.key}</button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The single most important idea in Unit II. A planet is a <strong>heat engine</strong>: volcanism, tectonics, mountain-building, and magnetic fields are all powered by internal heat escaping to space, so a world&rsquo;s geological life is the story of how fast it loses that heat. And the geometry is beautifully simple. Heat is <em>generated</em> throughout a body&rsquo;s <strong>volume</strong> (which grows as <em>R</em>³) but can only <em>escape</em> through its <strong>surface</strong> (which grows as <em>R</em>²), so the ratio of loss capacity to heat content is <strong className="text-ink">A/V = 3/R</strong> — smaller worlds have proportionally far more surface, and cool far faster. It is why a cup of coffee cools quicker than a bathtub. Order the terrestrial worlds by size and you have ordered them by geological vitality, essentially perfectly: the <strong className="text-maroon">Moon</strong> and <strong className="text-maroon">Mercury</strong>, smallest and fastest-cooling, are dead; <strong className="text-maroon">Mars</strong>, intermediate, is mostly dead with a vigorous extinct past; and only the two largest, <strong className="text-purple">Venus</strong> and <strong className="text-purple">Earth</strong>, remain active. Distance from the Sun was the master variable of Unit I. <strong className="text-ink">Size is the master variable of Unit II</strong> — because size sets cooling rate, cooling rate sets how long a world stays geologically alive, and geological life turns out to govern atmospheres, magnetic fields, and ultimately habitability.
      </figcaption>
    </figure>
  );
}
