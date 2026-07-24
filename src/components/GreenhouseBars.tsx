"use client";

import { useState } from "react";

// An interactive greenhouse-effect explorer, embedded via a fenced ```greenhouse block
// (see Reader's `pre` override). The block's most counterintuitive result. Each planet's
// bar splits into its EQUILIBRIUM temperature (what the surface would be with no
// atmosphere, given how much sunlight it absorbs) and the GREENHOUSE contribution that
// lifts it to the actual surface temperature. The stunner is Venus: because its brilliant
// clouds reflect 77% of the sunlight reaching it, its equilibrium temperature (227 K) is
// actually LOWER than Earth's (254 K) — yet its surface sits at 737 K. Venus is not hot
// because it is close to the Sun; it is hot because of its atmosphere, by 510 kelvin.
// Pick a planet to see its numbers. Pure arithmetic (temperatures → bar heights),
// identical in SSR and client. currentColor theming; first render highlights Venus.

const PX0 = 54, PY0 = 22, PY1 = 156, TMAX = 780; // plot box, temperature axis (K)
const r1 = (n: number) => Math.round(n * 10) / 10;
const yOf = (T: number) => r1(PY1 - (Math.min(T, TMAX) / TMAX) * (PY1 - PY0));

// planet: name, centre x, albedo, flux (W/m^2), equilibrium T, actual surface T
type P = { key: string; name: string; x: number; albedo: number; flux: number; teq: number; actual: number };
const PLANETS: P[] = [
  { key: "Mercury", name: "Mercury", x: 96, albedo: 0.088, flux: 9088, teq: 437, actual: 440 },
  { key: "Venus", name: "Venus", x: 182, albedo: 0.77, flux: 2604, teq: 227, actual: 737 },
  { key: "Earth", name: "Earth", x: 268, albedo: 0.306, flux: 1361, teq: 254, actual: 288 },
  { key: "Mars", name: "Mars", x: 354, albedo: 0.25, flux: 586, teq: 210, actual: 210 },
];
const BW = 42; // bar width
const EARTH_TEQ = 254;

export function GreenhouseBars() {
  const [sel, setSel] = useState("Venus");
  const p = PLANETS.find((x) => x.key === sel)!;
  const greenhouse = p.actual - p.teq;

  return (
    <figure className="greenhouse-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={`Equilibrium versus actual surface temperature. Venus's equilibrium temperature (227 K) is lower than Earth's (254 K) because it reflects 77% of sunlight, yet its surface is 737 K — a greenhouse effect of 510 K. ${p.name}'s greenhouse effect is ${greenhouse} K.`}>

        {/* Earth's equilibrium-temperature reference line — Venus's T_eq sits below it */}
        <line className="text-ink" x1={PX0} y1={yOf(EARTH_TEQ)} x2={422} y2={yOf(EARTH_TEQ)} stroke="currentColor" strokeWidth={0.7} strokeDasharray="4 3" opacity={0.5} />
        <text className="text-ink" x={422} y={yOf(EARTH_TEQ) - 3} textAnchor="end" fill="currentColor" fontSize={6.2} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.7}>Earth&rsquo;s equilibrium temp (254 K)</text>

        {/* "melts lead" reference */}
        <line className="text-faint" x1={PX0} y1={yOf(600)} x2={422} y2={yOf(600)} stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 3" opacity={0.4} />
        <text className="text-faint" x={PX0 + 2} y={yOf(600) - 2} textAnchor="start" fill="currentColor" fontSize={5.8} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.7}>melts lead (600 K)</text>

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={422} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        {[200, 400, 600].map((T) => (
          <text key={T} className="text-faint" x={PX0 - 4} y={yOf(T) + 2.5} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">{T}</text>
        ))}
        <text className="text-faint" x={PX0 - 30} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 30} ${(PY0 + PY1) / 2})`}>surface temperature (K)</text>

        {/* the bars: equilibrium part + greenhouse part */}
        {PLANETS.map((x) => {
          const on = x.key === sel;
          const yE = yOf(x.teq), yA = yOf(x.actual);
          const gh = x.actual - x.teq;
          return (
            <g key={x.key} opacity={on ? 1 : 0.62}>
              {/* equilibrium (absorbed-sunlight) part */}
              <rect x={x.x - BW / 2} y={yE} width={BW} height={r1(PY1 - yE)} className="text-muted" fill="currentColor" opacity={0.55} />
              {/* greenhouse part */}
              {gh > 2 && <rect x={x.x - BW / 2} y={yA} width={BW} height={r1(yE - yA)} className="text-maroon" fill="currentColor" opacity={0.85} />}
              <rect x={x.x - BW / 2} y={yA} width={BW} height={r1(PY1 - yA)} fill="none" className={on ? "text-ink" : "text-line"} stroke="currentColor" strokeWidth={on ? 1.3 : 0.6} />
              <text x={x.x} y={PY1 + 11} textAnchor="middle" className={on ? "text-ink" : "text-faint"} fill="currentColor" fontSize={7} fontWeight={on ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{x.key}</text>
              <text x={x.x} y={yA - 3} textAnchor="middle" className={on ? "text-ink" : "text-faint"} fill="currentColor" fontSize={6.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{x.actual} K</text>
              {gh > 20 && <text x={x.x} y={r1((yA + yE) / 2) + 2} textAnchor="middle" className="text-maroon" fill="currentColor" fontSize={6.2} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">+{gh}</text>}
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="text-ink">{p.name}</strong> reflects <strong>{Math.round(p.albedo * 100)}%</strong> of its sunlight, giving an equilibrium temperature of <strong className="text-muted">{p.teq} K</strong> — its surface is <strong className="text-ink">{p.actual} K</strong>, a greenhouse boost of <strong className="text-maroon">+{greenhouse} K</strong>. {p.key === "Venus"
          ? <>Its equilibrium temperature is <strong>colder than Earth&rsquo;s.</strong> Venus is hot because of its <em>air</em>, not the Sun.</>
          : p.key === "Earth"
            ? <>That modest boost is what lifts us from a frozen 254 K to a habitable 288 K.</>
            : null}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {PLANETS.map((x) => (
          <button key={x.key} type="button" onClick={() => setSel(x.key)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${sel === x.key ? "border-ink text-ink font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>{x.key}</button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Sunlight arrives mostly as visible light, passes through a transparent atmosphere, and warms the ground; the ground re-radiates in the <strong>infrared</strong>, which gases like CO₂ and water vapour absorb and partly send back down — so the surface must warm until it can force enough energy out to balance the incoming sunlight. That extra warming is the <strong>greenhouse effect</strong>, and the grey part of each bar is a planet&rsquo;s <em>equilibrium</em> temperature — what its surface would be on the sunlight it actually absorbs, with no atmosphere. Now the stunner. <strong className="text-ink">Venus&rsquo;s equilibrium temperature is 227 K — colder than Earth&rsquo;s 254 K</strong> — even though Venus is closer to the Sun, because its brilliant white cloud deck reflects <strong>77%</strong> of incoming sunlight against Earth&rsquo;s 31%. On the energy it absorbs, Venus should be the <em>cooler</em> planet. Yet its surface is <strong className="text-maroon">737 K</strong>, hotter than Mercury&rsquo;s dayside despite being nearly twice as far from the Sun. <strong className="text-ink">Venus is not hot because it is close to the Sun — it is hot because of its atmosphere, by 510 kelvin.</strong> And notice Earth&rsquo;s own modest +34 K: it is exactly what lifts our mean temperature from a frozen 254 K to a habitable 288 K. The greenhouse effect is not a pathology; it is a prerequisite for life. What went wrong on Venus was its <em>magnitude</em>.
      </figcaption>
    </figure>
  );
}
