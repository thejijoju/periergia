"use client";

import { useState } from "react";

// An interactive Lagrange-points map, embedded in an article via a fenced
// ```lagrangemap block (see Reader's `pre` override). The restricted three-body
// problem has exactly five equilibria: three unstable saddles on the line
// through the two bodies (L1, L2, L3) and two triangular points 60° ahead and
// behind (L4, L5) that are STABLE when the primaries' mass ratio exceeds ~24.96.
// Slide the mass ratio to watch L1/L2 crawl out from the secondary as its Hill
// radius grows, and L4/L5 flip between stable (parking lots for Trojan debris)
// and unstable. Tap a point to read what lives there. currentColor theming
// (light/dark); first render deterministic (Earth–Moon, L2 selected).

const CX = 150;
const CY = 125;
const R = 86; // px, the secondary's orbital radius

// Mass ratio m2/m1 below which the triangular points are stable: 1/24.96.
const STABLE_BELOW = 1 / 24.96;

type P = { id: string; kind: "saddle" | "tri"; x: number; y: number; desc: string };

function points(ratio: number): P[] {
  const mu = ratio / (1 + ratio); // reduced mass
  const rh = R * Math.cbrt(mu / 3); // Hill radius in px
  const l3 = R * (1 + (5 * mu) / 12);
  return [
    { id: "L1", kind: "saddle", x: CX + (R - rh), y: CY,
      desc: "Between the two bodies, where the secondary's pull partly cancels the primary's. Home to the Sun-watchers SOHO and DSCOVR. Unstable — it needs a nudge every few weeks." },
    { id: "L2", kind: "saddle", x: CX + (R + rh), y: CY,
      desc: "Just beyond the secondary, in its shadow. The Sun, Earth and Moon bunch in one direction, so one sunshield blocks them all — which is why JWST, Gaia and Planck park here. Unstable." },
    { id: "L3", kind: "saddle", x: CX - l3, y: CY,
      desc: "Hidden on the far side of the primary — science fiction's 'Counter-Earth'. Unstable, so nothing actually stays there." },
    { id: "L4", kind: "tri", x: CX + R * Math.cos(Math.PI / 3), y: CY - R * Math.sin(Math.PI / 3),
      desc: "60° ahead of the secondary, forming an equilateral triangle. Stable above a 24.96 mass ratio — then it traps debris for eons, like Jupiter's Trojan asteroids. No station-keeping needed." },
    { id: "L5", kind: "tri", x: CX + R * Math.cos(Math.PI / 3), y: CY + R * Math.sin(Math.PI / 3),
      desc: "60° behind the secondary, the mirror of L4. Stable under the same mass-ratio rule — a billion-year parking lot held by the Coriolis force." },
  ];
}

const PRESETS = [
  { label: "Sun–Earth", ratio: 3.0e-6 },
  { label: "Earth–Moon", ratio: 0.0123 },
  { label: "Pluto–Charon", ratio: 0.12 },
];

export function LagrangePoints() {
  const [logR, setLogR] = useState(Math.log10(0.0123)); // Earth–Moon
  const [sel, setSel] = useState("L2");
  const ratio = Math.pow(10, logR);
  const triStable = ratio < STABLE_BELOW;
  const pts = points(ratio);
  const selected = pts.find((p) => p.id === sel)!;
  const colorOf = (p: P) => (p.kind === "tri" && triStable ? "text-purple" : "text-maroon");

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 300 250" className="mx-auto block h-auto w-full max-w-[340px]" role="img"
        aria-label="Map of the five Lagrange points of a two-body system; three are unstable saddles, two triangular points may be stable.">
        {/* secondary's orbit */}
        <circle className="text-line" cx={CX} cy={CY} r={R} fill="none" stroke="currentColor"
          strokeWidth={1} strokeDasharray="2 4" opacity={0.7} />
        {/* primary + secondary */}
        <circle className="text-purple" cx={CX} cy={CY} r={11} fill="currentColor" opacity={0.85} />
        <circle className="text-ink" cx={CX + R} cy={CY} r={5} fill="currentColor" />
        {/* the five points */}
        {pts.map((p) => (
          <g key={p.id} onClick={() => setSel(p.id)} style={{ cursor: "pointer" }}>
            <circle className={colorOf(p)} cx={p.x} cy={p.y} r={sel === p.id ? 6.5 : 4.5}
              fill="currentColor" opacity={sel === p.id ? 1 : 0.55} />
            {sel === p.id && (
              <circle className={colorOf(p)} cx={p.x} cy={p.y} r={9.5} fill="none"
                stroke="currentColor" strokeWidth={1.3} />
            )}
            <text className="text-muted" x={p.x} y={p.y - 10} textAnchor="middle" fill="currentColor"
              fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{p.id}</text>
          </g>
        ))}
      </svg>

      <p className="mt-1 text-center font-sans text-[12px] text-muted">
        <span className="text-maroon">●</span> unstable saddle &nbsp;·&nbsp;{" "}
        <span className={triStable ? "text-purple" : "text-maroon"}>●</span> triangular ({triStable ? "stable" : "unstable"} here)
      </p>

      <p className="mt-2 rounded-lg bg-line/25 px-3 py-2 font-sans text-[13px] text-ink">
        <strong>{selected.id}.</strong> {selected.desc}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Mass ratio m₂ / m₁</span>
            <span className="tabular-nums">{ratio < 0.001 ? ratio.toExponential(1) : ratio.toFixed(3)}</span>
          </span>
          <input type="range" min={-7} max={-0.7} step={0.01} value={logR}
            onChange={(e) => setLogR(Number(e.target.value))}
            aria-label="Mass ratio (log scale)"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {PRESETS.map((p) => (
            <button key={p.label} type="button" onClick={() => setLogR(Math.log10(p.ratio))}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
              {p.label}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The five points where a small body co-rotates with two larger ones. The three collinear points (L1, L2, L3) are always <span className="text-maroon">unstable saddles</span> — balancing a pencil on its tip, priceless locations that cost a few m/s a year to hold. The triangular points L4 and L5, 60° ahead and behind, are <span className="text-purple">stable</span> whenever the mass ratio exceeds <strong>24.96</strong> — stability from a hilltop, courtesy of the Coriolis force — and then they trap debris for the age of the solar system (Jupiter's million Trojan asteroids). Slide toward a heavier secondary and watch L1/L2 pull away from it as its Hill radius grows, and the triangular points flip to unstable once the ratio passes 24.96.
      </figcaption>
    </figure>
  );
}
