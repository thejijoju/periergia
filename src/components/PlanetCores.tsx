"use client";

import { useState } from "react";

// An interactive interior-structure explorer, embedded via a fenced ```planetcores block
// (see Reader's `pre` override). The central fact about Mercury, made visible. Every
// terrestrial world differentiated into a metal core and a rock mantle — but Mercury's
// core fills 83% of its radius (57% of its volume, ~70% of its mass), against Earth's
// 55% / 16% / 32%. Mercury is essentially an iron ball wearing a thin rocky shell, with
// by far the highest uncompressed density in the solar system. Draw the five worlds to
// the same size and Mercury's iron heart is unmistakable; pick one to read its numbers.
// Circle radii are pure arithmetic — identical in SSR and client. currentColor theming;
// first render highlights Mercury.

const R = 30; // drawn planet radius (all worlds to the same size)
const r1 = (n: number) => Math.round(n * 10) / 10;

// world: name, centre x, core fraction of radius, core % of mass, uncompressed density
type W = { key: string; name: string; cx: number; frac: number; massPct: number; udens: number };
const WORLDS: W[] = [
  { key: "Mercury", name: "Mercury", cx: 62, frac: 0.83, massPct: 70, udens: 5300 },
  { key: "Venus", name: "Venus", cx: 141, frac: 0.53, massPct: 30, udens: 4000 },
  { key: "Earth", name: "Earth", cx: 220, frac: 0.547, massPct: 32, udens: 4050 },
  { key: "Mars", name: "Mars", cx: 299, frac: 0.51, massPct: 25, udens: 3800 },
  { key: "Moon", name: "the Moon", cx: 378, frac: 0.2, massPct: 2, udens: 3300 },
];

export function PlanetCores() {
  const [sel, setSel] = useState("Mercury");
  const w = WORLDS.find((x) => x.key === sel)!;
  const volPct = Math.round(w.frac ** 3 * 100);

  return (
    <figure className="cores-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 132" className="w-full h-auto" role="img"
        aria-label={`Interior cross-sections drawn to the same size: Mercury's iron core fills 83% of its radius, far more than Venus, Earth, Mars, or the Moon. ${w.name}'s core is ${Math.round(w.frac * 100)}% of its radius.`}>
        {WORLDS.map((x) => {
          const on = x.key === sel;
          const cy = 54;
          return (
            <g key={x.key}>
              {on && <circle cx={x.cx} cy={cy} r={R + 4} className="text-ink" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.5} />}
              {/* mantle (rock) */}
              <circle cx={x.cx} cy={cy} r={R} className="text-muted" fill="currentColor" opacity={0.28} />
              <circle cx={x.cx} cy={cy} r={R} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.8} opacity={0.7} />
              {/* iron core */}
              <circle cx={x.cx} cy={cy} r={r1(R * x.frac)} className="text-maroon" fill="currentColor" opacity={on ? 0.95 : 0.8} />
              <text x={x.cx} y={cy + R + 14} textAnchor="middle" className={on ? "text-ink" : "text-faint"} fill="currentColor" fontSize={on ? 8 : 7} fontWeight={on ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{x.key}</text>
              <text x={x.cx} y={cy + R + 23} textAnchor="middle" className={on ? "text-maroon" : "text-faint"} fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">core {Math.round(x.frac * 100)}%</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="text-ink">{w.name}</strong>&rsquo;s <strong className="text-maroon">iron core</strong> fills <strong>{Math.round(w.frac * 100)}% of its radius</strong> — {volPct}% of its volume and about {w.massPct}% of its mass — with an uncompressed density of <strong>{w.udens.toLocaleString("en-US")} kg/m³</strong>. {w.key === "Mercury"
          ? <>By far the highest in the solar system. <strong className="text-maroon">Mercury is an iron ball with a thin rocky shell.</strong></>
          : null}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {WORLDS.map((x) => (
          <button key={x.key} type="button" onClick={() => setSel(x.key)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${sel === x.key ? "border-maroon text-maroon font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>{x.key}</button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Mean density is the first window into a planet&rsquo;s interior — and for Mercury it is the whole story. Mercury&rsquo;s mean density, 5,427 kg/m³, is almost exactly Earth&rsquo;s 5,514 — which looks unremarkable until you remember <strong>self-compression</strong>: Earth is eighteen times more massive, so its interior is squeezed to a much higher density than its material would have at rest. Correct both for compression and the truth emerges: Mercury&rsquo;s <em>uncompressed</em> density (~5,300 kg/m³) is about <strong>30% above Earth&rsquo;s</strong> and by far the highest of any world — a direct measure of composition. It is not slightly iron-rich; it is <em>made</em> of iron to a degree nothing else is. Drawn to the same size, its <strong className="text-maroon">core fills 83% of its radius</strong> against Earth&rsquo;s 55% — 57% of its volume, 70% of its mass. Scaled up to Earth, Mercury&rsquo;s entire rocky mantle and crust would be a skin barely 400 km thick over a vast metal sphere. <em>Why</em> Mercury is built this way is the central unsolved question of Mercury science: the long-favoured giant-impact stripping should have driven off volatile elements, yet MESSENGER found Mercury volatile-<em>rich</em> — so the field now leans toward its having simply accreted from iron-enriched material. BepiColombo arrives in 2026 to decide.
      </figcaption>
    </figure>
  );
}
