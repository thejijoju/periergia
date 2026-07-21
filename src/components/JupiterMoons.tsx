"use client";

import { useState } from "react";

// An interactive Galilean-moons explorer, embedded via a fenced ```jupitermoons block
// (see Reader's `pre` override). In January 1610 Galileo saw four little "stars" strung
// in a line beside Jupiter — and night after night they MOVED, shifting from one side to
// the other and vanishing behind the planet. He realized they were MOONS orbiting
// Jupiter: a centre of motion that is not the Earth, demolishing the geocentric claim
// that everything circles us — and proving that a moving planet keeps its moons, so a
// moving Earth can keep ours. We see the orbits nearly edge-on, so the moons appear
// strung out in a line, exactly as Galileo drew them. Slide the days and watch them
// dance. currentColor theming; first render deterministic. (Real periods and orbital
// radii, to scale.)

const JX = 222, JY = 120; // Jupiter's centre
const SCALE = 0.0905; // px per 10^3 km
// Galilean moons: [name, orbital radius (10^3 km), period (days), starting phase (deg)]
const MOONS: [string, number, number, number][] = [
  ["Io", 422, 1.769, 20],
  ["Europa", 671, 3.551, 150],
  ["Ganymede", 1070, 7.155, 260],
  ["Callisto", 1883, 16.689, 60],
];
const rad = (d: number) => (d * Math.PI) / 180;
const r3 = (n: number) => Math.round(n * 1000) / 1000; // identical SSR/client SVG strings

export function JupiterMoons() {
  const [day, setDay] = useState(0);

  const positions = MOONS.map(([name, radiusKm, period, ph0]) => {
    const ph = rad(ph0) + (2 * Math.PI * day) / period;
    const R = radiusKm * SCALE;
    const x = r3(JX + R * Math.sin(ph)); // along the line of sight edge-on
    const y = r3(JY - R * 0.13 * Math.cos(ph)); // tiny tilt so the orbit reads as an ellipse
    const behind = Math.cos(ph) < 0; // on the far side of Jupiter
    return { name, R: r3(R), x, y, behind, initial: name[0] };
  });

  return (
    <figure className="jupiter-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Four moons orbiting Jupiter, seen edge-on as a shifting line of points beside the planet on day ${day.toFixed(1)}.`}>

        {/* the four orbits, nearly edge-on (thin ellipses) */}
        {positions.map((p) => (
          <ellipse key={p.name} cx={JX} cy={JY} rx={p.R} ry={r3(p.R * 0.13)} fill="none"
            className="text-line" stroke="currentColor" strokeWidth={0.7} opacity={0.4} />
        ))}

        {/* Jupiter */}
        <circle className="text-maroon" cx={JX} cy={JY} r={13} fill="currentColor" opacity={0.9} />
        {/* a couple of cloud bands, for flavour */}
        <line className="text-card" x1={JX - 11} y1={JY - 4} x2={JX + 11} y2={JY - 4} stroke="currentColor" strokeWidth={1.4} opacity={0.5} />
        <line className="text-card" x1={JX - 12} y1={JY + 3} x2={JX + 12} y2={JY + 3} stroke="currentColor" strokeWidth={1.4} opacity={0.5} />
        <text className="text-faint" x={JX} y={JY + 26} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Jupiter</text>

        {/* the moons */}
        {positions.map((p) => (
          <g key={p.name} opacity={p.behind ? 0.45 : 1}>
            <circle cx={p.x} cy={p.y} r={p.name === "Ganymede" ? 3.4 : p.name === "Callisto" ? 3.2 : p.name === "Io" ? 2.6 : 2.8}
              className="text-ink" fill="currentColor" />
            <text x={p.x} y={p.y - 7} textAnchor="middle" className="text-muted" fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.initial}</text>
          </g>
        ))}

        {/* Galileo's-eye strip: the same moons as a bare line beside the planet */}
        <text className="text-faint" x={26} y={192} textAnchor="start" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">as Galileo saw them:</text>
        <line className="text-line" x1={40} y1={210} x2={404} y2={210} stroke="currentColor" strokeWidth={0.5} opacity={0.3} />
        <circle className="text-maroon" cx={JX} cy={210} r={6} fill="currentColor" opacity={0.9} />
        {positions.map((p) => (
          <circle key={p.name} cx={p.x} cy={210} r={2.4} className="text-ink" fill="currentColor" opacity={p.behind ? 0.5 : 1} />
        ))}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Four moons — <strong>I</strong>o, <strong>E</strong>uropa, <strong>G</strong>anymede, <strong>C</strong>allisto — circling <strong className="text-maroon">Jupiter</strong>, not the Earth. Here is a centre of motion that is plainly <em>not us.</em>
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Days elapsed</span><span className="tabular-nums">day {day.toFixed(1)}</span></span>
          <input type="range" min={0} max={20} step={0.1} value={day} onChange={(e) => setDay(Number(e.target.value))} aria-label="Days elapsed" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The discovery that broke a central pillar of the ancient cosmos. In January 1610 Galileo saw four faint &ldquo;little stars&rdquo; in a line beside Jupiter — and night after night they <em>shifted</em>, sliding from one side of the planet to the other and disappearing behind it, exactly as bodies would if they were <strong>orbiting Jupiter.</strong> They are the four large moons we now call the <span className="text-ink">Galilean moons</span> (Io, Europa, Ganymede, Callisto), and their existence was devastating to geocentrism: a bedrock assumption of the old cosmos was that the Earth is the centre of <em>all</em> motion, that everything revolves around us. Yet here, plain in the glass, were four bodies revolving around <span className="text-maroon">Jupiter</span> — a second centre of motion, and proof that not everything circles the Earth. It answered a specific objection too: critics said a moving Earth would surely leave its Moon behind — but Jupiter, indisputably in motion, carries its four moons effortlessly along. <strong>If Jupiter can move and keep its moons, so can the Earth.</strong> The heavens themselves had refuted the objection.
      </figcaption>
    </figure>
  );
}
