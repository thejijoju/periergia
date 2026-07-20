"use client";

import { useState } from "react";

// An interactive interplanetary Hohmann-transfer planner, embedded in an article
// via a fenced ```planethohmann block (see Reader's `pre` override). Pick a
// destination planet and the heliocentric transfer ellipse from Earth's orbit is
// drawn around the Sun, with the departure and arrival hyperbolic-excess speeds
// and — the visceral payoff — the coast time, which grows from 8.5 months to
// Mars out to decades for Neptune. The Mars case reproduces the chapter's
// numbers (2.95 + 2.65 km/s, 258.9 days). currentColor theming (light/dark);
// first render deterministic (Mars).

const MU = 1.327e11; // km³/s², Sun
const AU = 1.496e8; // km
const R1 = 1.0; // Earth, AU

const CX = 150;
const CY = 125;
const ORBIT_PX = 92; // the larger of the two orbits is drawn at this radius

const PLANETS = [
  { label: "Mercury", a: 0.387 },
  { label: "Venus", a: 0.723 },
  { label: "Mars", a: 1.524 },
  { label: "Jupiter", a: 5.203 },
  { label: "Saturn", a: 9.537 },
  { label: "Uranus", a: 19.19 },
  { label: "Neptune", a: 30.07 },
];

const vCirc = (rAU: number) => Math.sqrt(MU / (rAU * AU));

function plan(r2: number) {
  const at = (R1 + r2) / 2; // AU
  const vE = vCirc(R1);
  const v2 = vCirc(r2);
  const vp = Math.sqrt(MU * (2 / (R1 * AU) - 1 / (at * AU)));
  const va = Math.sqrt(MU * (2 / (r2 * AU) - 1 / (at * AU)));
  const dvDep = Math.abs(vp - vE); // departure v-infinity
  const dvArr = Math.abs(v2 - va); // arrival v-infinity
  const days = (Math.PI * Math.sqrt((at * AU) ** 3 / MU)) / 86400;
  return { at, dvDep, dvArr, days };
}

// Transfer half-ellipse (Earth at +x, target at −x), scaled to fit the frame.
function ellipsePath(r2: number, scale: number, omega: number): string {
  const rp = Math.min(R1, r2), ra = Math.max(R1, r2);
  const e = (ra - rp) / (ra + rp);
  const at = (rp + ra) / 2;
  const p = at * (1 - e * e);
  const co = Math.cos(omega), so = Math.sin(omega);
  const N = 90;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const th = (i / N) * Math.PI;
    const r = p / (1 + e * Math.cos(th));
    const x0 = r * Math.cos(th), y0 = r * Math.sin(th);
    const x = x0 * co - y0 * so, y = x0 * so + y0 * co;
    d += `${i === 0 ? "M" : "L"}${(CX + x * scale).toFixed(1)} ${(CY - y * scale).toFixed(1)}`;
  }
  return d;
}

function fmtTime(days: number): string {
  if (days < 700) return `${(days / 30.44).toFixed(1)} months`;
  return `${(days / 365.25).toFixed(1)} years`;
}

export function PlanetHohmann() {
  const [i, setI] = useState(2); // Mars
  const r2 = PLANETS[i].a;
  const p = plan(r2);
  const scale = ORBIT_PX / Math.max(R1, r2); // px per AU
  const r1px = R1 * scale, r2px = r2 * scale;
  const outbound = r2 > R1;
  // Earth departs at +x; for an outbound trip Earth is perihelion (omega 0),
  // for an inbound trip Earth is aphelion (omega π).
  const omega = outbound ? 0 : Math.PI;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 300 250" className="mx-auto block h-auto w-full max-w-[340px]" role="img"
        aria-label={`Hohmann transfer from Earth to ${PLANETS[i].label}: ${fmtTime(p.days)} of coasting.`}>
        {/* orbits */}
        <circle className="text-line" cx={CX} cy={CY} r={r1px} fill="none" stroke="currentColor"
          strokeWidth={1} opacity={0.8} />
        <circle className="text-line" cx={CX} cy={CY} r={r2px} fill="none" stroke="currentColor"
          strokeWidth={1} strokeDasharray="2 4" opacity={0.8} />
        {/* transfer ellipse */}
        <path className="text-maroon" d={ellipsePath(r2, scale, omega)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />
        {/* Sun */}
        <circle className="text-purple" cx={CX} cy={CY} r={7} fill="currentColor" />
        {/* Earth (departure, +x) and target (−x) */}
        <circle className="text-ink" cx={CX + r1px} cy={CY} r={4} fill="currentColor" />
        <text className="text-muted" x={CX + r1px + 5} y={CY + 11} fill="currentColor" fontSize={8.5} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
        <circle className="text-maroon" cx={CX - r2px} cy={CY} r={4.5} fill="currentColor" />
        <text className="text-maroon" x={CX - r2px} y={CY - 9} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">{PLANETS[i].label}</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Earth → <strong>{PLANETS[i].label}</strong>: coast{" "}
        <span className="font-semibold text-maroon">{fmtTime(p.days)}</span>, with{" "}
        <strong>{p.dvDep.toFixed(2)}</strong> km/s to leave Earth&rsquo;s orbit and{" "}
        <strong>{p.dvArr.toFixed(2)}</strong> km/s to match the destination.
      </p>

      <div className="mt-3 flex flex-wrap justify-center gap-1.5">
        {PLANETS.map((pl, idx) => (
          <button key={pl.label} type="button" onClick={() => setI(idx)} aria-pressed={idx === i}
            className={`font-sans text-[11.5px] rounded-md border px-2 py-1 transition-colors ${
              idx === i ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"
            }`}>
            {pl.label}
          </button>
        ))}
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The cheapest transfer between two planets is the same Hohmann half-ellipse — now around the Sun, tangent to Earth&rsquo;s orbit at one end and the destination&rsquo;s at the other. The Δv figures are the hyperbolic-excess speeds you must have <em>relative to each planet</em> as you cross its sphere of influence (a departure burn deep in Earth&rsquo;s well, via the Oberth effect, actually buys them cheaply). The number that dominates everything is the <span className="text-maroon">coast time</span>: 8.5 months to Mars, but years to the giants and decades to Neptune — which is why crewed Mars missions are multi-year commitments and why the outer planets were reached only once the gravity assist let a probe skip the Hohmann wait. Cheap is slow; going faster costs Δv exponentially.
      </figcaption>
    </figure>
  );
}
