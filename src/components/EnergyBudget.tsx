"use client";

import { useState } from "react";

// An interactive energy-budget explorer, embedded via a fenced ```energybudget block
// (see Reader's `pre` override). The calculation that overturns the intuitive account of
// Venus. Venus orbits closer and receives 1.91× Earth's incident sunlight — but its
// brilliant sulphuric-acid cloud reflects 77% of it, against Earth's 31%, so Venus
// actually ABSORBS LESS energy per square metre (599 W/m²) than Earth does (945). Its
// equilibrium temperature is therefore 227 K — COLDER than Earth's 254 K. Venus is not
// hot because it is close to the Sun; every one of its 737 K comes from its atmosphere.
// The bars show incident sunlight split into reflected and absorbed; widths are pure
// arithmetic (identical in SSR and client). currentColor theming; first render highlights
// Venus.

const X0 = 150, XW = 226; // bar start x, max bar width (for the largest incident flux; leaves room for the end labels)
const FMAX = 2604; // W/m^2, Venus's incident flux (the longest bar)
const r1 = (n: number) => Math.round(n * 10) / 10;
const wOf = (flux: number) => r1((flux / FMAX) * XW);

type P = { key: string; name: string; y: number; incident: number; albedo: number; teq: number };
const PLANETS: P[] = [
  { key: "Venus", name: "Venus", y: 44, incident: 2604, albedo: 0.77, teq: 227 },
  { key: "Earth", name: "Earth", y: 96, incident: 1361, albedo: 0.306, teq: 254 },
];

export function EnergyBudget() {
  const [sel, setSel] = useState("Venus");

  return (
    <figure className="budget-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 168" className="w-full h-auto" role="img"
        aria-label="Sunlight budgets: Venus receives more incident sunlight than Earth but reflects 77% of it, so it absorbs only 599 W/m² against Earth's 945 — less than Earth, giving Venus a colder equilibrium temperature.">

        {PLANETS.map((p) => {
          const on = p.key === sel;
          const absorbed = p.incident * (1 - p.albedo);
          const wInc = wOf(p.incident), wAbs = wOf(absorbed);
          return (
            <g key={p.key} opacity={on ? 1 : 0.62}>
              <text className={on ? "text-ink" : "text-faint"} x={X0 - 6} y={p.y + 10} textAnchor="end" fill="currentColor" fontSize={9} fontWeight={on ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.name}</text>
              {/* full incident bar (faint = reflected portion) */}
              <rect x={X0} y={p.y} width={wInc} height={18} className="text-faint" fill="currentColor" opacity={0.18} />
              <rect x={X0} y={p.y} width={wInc} height={18} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.7} opacity={0.6} />
              {/* absorbed portion (solid) */}
              <rect x={X0} y={p.y} width={wAbs} height={18} className={on ? "text-maroon" : "text-muted"} fill="currentColor" opacity={0.85} />
              {/* labels */}
              <text className="text-faint" x={X0 + wInc + 3} y={p.y + 8} textAnchor="start" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.incident.toLocaleString("en-US")} in</text>
              <text className="text-faint" x={X0 + wInc + 3} y={p.y + 16} textAnchor="start" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">reflects {Math.round(p.albedo * 100)}%</text>
              <text className={on ? "text-maroon" : "text-faint"} x={X0 + wAbs - 3} y={p.y + 30} textAnchor="end" fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">absorbs {Math.round(absorbed)} W/m²</text>
            </g>
          );
        })}

        {/* the punchline guide: Earth's absorbed reach vs Venus's */}
        <line className="text-ink" x1={r1(X0 + wOf(945))} y1={38} x2={r1(X0 + wOf(945))} y2={132} stroke="currentColor" strokeWidth={0.7} strokeDasharray="3 3" opacity={0.5} />
        <text className="text-ink" x={r1(X0 + wOf(945)) + 3} y={140} textAnchor="start" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth absorbs more →</text>

        {/* equilibrium-temperature readout */}
        <text className="text-muted" x={X0} y={20} fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">sunlight arriving → reflected + absorbed (W/m²)</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="text-ink">Venus</strong> receives <strong>1.9×</strong> Earth&rsquo;s sunlight but reflects <strong>77%</strong> of it, so it absorbs only <strong className="text-maroon">599 W/m²</strong> against Earth&rsquo;s <strong>945</strong> — <strong>less than Earth.</strong> Its equilibrium temperature (<strong className="text-maroon">227 K</strong>) is <em>colder</em> than Earth&rsquo;s (254 K). Venus is hot because of its <strong>air</strong>, not the Sun.
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {PLANETS.map((p) => (
          <button key={p.key} type="button" onClick={() => setSel(p.key)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${sel === p.key ? "border-maroon text-maroon font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {p.key} · T_eq {p.teq} K
          </button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The intuitive explanation of Venus — &ldquo;it is hot because it is close to the Sun&rdquo; — is quantitatively wrong, and this is the calculation that shows it. Venus does receive more <em>incident</em> sunlight: at 0.72 AU the inverse-square law gives it <strong>2,604 W/m²</strong>, 1.91 times Earth&rsquo;s 1,361. But receiving is not absorbing. Venus is wrapped in an unbroken deck of sulphuric-acid cloud so reflective it is the brightest object in our night sky — an <strong>albedo of 0.77</strong>, throwing 77% of that light straight back to space, against Earth&rsquo;s 0.31. So the energy each planet actually <em>absorbs</em> is 2,604 × 0.23 = <strong className="text-maroon">599 W/m²</strong> for Venus, but 1,361 × 0.69 = <strong>945 W/m²</strong> for Earth. <strong>Venus takes in less solar energy per square metre than Earth does.</strong> Its equilibrium temperature — what the surface would be with no atmosphere — is only <strong>227 K</strong>, a full 27 K colder than Earth&rsquo;s 254 K. Yet its actual surface is <strong>737 K</strong>. Every one of those 510 kelvin comes from the greenhouse effect of its atmosphere, not from its distance. And the same arithmetic redeems the greenhouse effect itself: Earth&rsquo;s own +34 K is exactly what lifts us from a frozen 254 K to a habitable 288 K. The effect is a prerequisite for life; what ruined Venus was its magnitude.
      </figcaption>
    </figure>
  );
}
