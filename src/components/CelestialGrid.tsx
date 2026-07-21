"use client";

import { useState } from "react";

// An interactive celestial-address explorer, embedded in an article via a fenced
// ```celestialgrid block (see Reader's `pre` override). Every star gets a two-number
// address, exactly like latitude and longitude on Earth: DECLINATION (how far north
// or south of the celestial equator) and RIGHT ASCENSION (how far east of the vernal
// equinox — measured in HOURS, because the sky turns one hour of RA per hour of
// time, so RA also tells you WHEN the star crosses your meridian). Set the two
// numbers and read off the address. currentColor theming; first render
// deterministic (Betelgeuse).

const X0 = 34, X1 = 424, Y0 = 26, Y1 = 168; // grid box
const px = (raH: number) => X0 + (raH / 24) * (X1 - X0); // RA 0..24h left→right
const py = (dec: number) => Y0 + ((90 - dec) / 180) * (Y1 - Y0); // +90 top, −90 bottom
const hm = (raH: number) => {
  const h = Math.floor(raH);
  const m = Math.round((raH - h) * 60);
  return m === 60 ? `${h + 1}h 00m` : `${h}h ${m.toString().padStart(2, "0")}m`;
};
const STARS: [string, number, number][] = [
  ["Betelgeuse", 5.92, 7], ["Sirius", 6.75, -17], ["Vega", 18.62, 39], ["Polaris", 2.53, 89],
];

export function CelestialGrid() {
  const [raH, setRaH] = useState(5.92);
  const [dec, setDec] = useState(7);

  // the ecliptic: dec = 23.4° sin(RA), crossing the equator at RA 0 and 12h
  const ecl = Array.from({ length: 49 }, (_, i) => (i / 48) * 24)
    .map((r, i) => `${i ? "L" : "M"}${px(r).toFixed(1)} ${py(23.44 * Math.sin((r / 24) * 2 * Math.PI)).toFixed(1)}`)
    .join(" ");

  return (
    <figure className="grid-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A star at right ascension ${hm(raH)} and declination ${dec >= 0 ? "+" : ""}${dec}° — its address on the celestial sphere.`}>
        {/* grid box */}
        <rect x={X0} y={Y0} width={X1 - X0} height={Y1 - Y0} className="text-line" fill="none" stroke="currentColor" strokeWidth={1} />
        {/* dec grid lines */}
        {[60, 30, -30, -60].map((d) => (
          <line key={d} className="text-line" x1={X0} y1={py(d)} x2={X1} y2={py(d)} stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 4" opacity={0.5} />
        ))}
        {/* RA grid lines + labels */}
        {[6, 12, 18].map((r) => (
          <g key={r}>
            <line className="text-line" x1={px(r)} y1={Y0} x2={px(r)} y2={Y1} stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 4" opacity={0.5} />
            <text className="text-faint" x={px(r)} y={Y1 + 12} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{r}h</text>
          </g>
        ))}
        <text className="text-faint" x={X0} y={Y1 + 12} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">0h</text>
        <text className="text-faint" x={X1} y={Y1 + 12} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">24h</text>
        <text className="text-muted" x={(X0 + X1) / 2} y={Y1 + 26} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">right ascension (hours, eastward from the equinox) ⟶</text>
        <text className="text-faint" x={X0 - 6} y={py(90) + 8} textAnchor="end" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">+90°</text>
        <text className="text-faint" x={X0 - 6} y={py(-90)} textAnchor="end" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">−90°</text>

        {/* celestial equator */}
        <line className="text-ink" x1={X0} y1={py(0)} x2={X1} y2={py(0)} stroke="currentColor" strokeWidth={1.2} />
        <text className="text-ink" x={X1 - 3} y={py(0) - 3} textAnchor="end" fill="currentColor" fontSize={7} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">celestial equator</text>
        {/* the ecliptic */}
        <path d={ecl} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.2} opacity={0.8} strokeDasharray="3 2" />
        <text className="text-maroon" x={px(6) + 3} y={py(23.44) - 3} fill="currentColor" fontSize={7} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">ecliptic</text>
        {/* vernal equinox — the zero point */}
        <circle className="text-purple" cx={px(0)} cy={py(0)} r={3} fill="currentColor" />
        <text className="text-purple" x={px(0) + 4} y={py(0) + 12} fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">♈ equinox = 0h</text>

        {/* faint reference stars */}
        {STARS.map(([n, r, d]) => (
          <g key={n} opacity={0.4}>
            <circle className="text-ink" cx={px(r)} cy={py(d)} r={1.6} fill="currentColor" />
          </g>
        ))}

        {/* the chosen star */}
        <line className="text-purple" x1={px(raH)} y1={Y0} x2={px(raH)} y2={Y1} stroke="currentColor" strokeWidth={0.75} strokeDasharray="2 2" opacity={0.6} />
        <line className="text-purple" x1={X0} y1={py(dec)} x2={X1} y2={py(dec)} stroke="currentColor" strokeWidth={0.75} strokeDasharray="2 2" opacity={0.6} />
        <circle className="text-purple" cx={px(raH)} cy={py(dec)} r={4.5} fill="currentColor" />
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Address: <strong className="text-purple">RA {hm(raH)}</strong>, <strong className="text-purple">dec {dec >= 0 ? "+" : ""}{dec}&deg;</strong> — and it rides highest when your local sidereal clock reads <strong>{hm(raH)}</strong>.
      </p>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Right ascension</span><span className="tabular-nums">{hm(raH)}</span></span>
          <input type="range" min={0} max={23.99} step={0.01} value={raH} onChange={(e) => setRaH(Number(e.target.value))} aria-label="Right ascension in hours" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Declination</span><span className="tabular-nums">{dec >= 0 ? "+" : ""}{dec}&deg;</span></span>
          <input type="range" min={-90} max={90} step={1} value={dec} onChange={(e) => setDec(Number(e.target.value))} aria-label="Declination in degrees" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="flex flex-wrap gap-2">
          {STARS.map(([n, r, d]) => (
            <button key={n} type="button" onClick={() => { setRaH(r); setDec(d); }}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        This is how you tell an astronomer on the far side of the world exactly where to point. Lay Earth&rsquo;s own grid onto the sky: <span className="text-purple">declination</span> is celestial latitude — degrees north or south of the celestial equator, fixed to the stars — and <span className="text-purple">right ascension</span> is celestial longitude, measured eastward from a natural zero point, the <span className="text-purple">vernal equinox</span> where the Sun crosses the equator heading north. The lovely twist is the unit: right ascension is counted not in degrees but in <em>hours</em>, from 0 to 24, because the sky turns 15&deg; — one hour of RA — every hour of time. So a star&rsquo;s right ascension is also a <em>clock reading</em>: it tells you exactly when the star will cross your meridian and stand at its highest. Position and time are the same system. Give any object its two numbers and it has a universal, permanent address — the step that turned the sky from a vague dome of scattered lights into an exactly mapped catalogue, and astronomy from a descriptive art into an exact science.
      </figcaption>
    </figure>
  );
}
