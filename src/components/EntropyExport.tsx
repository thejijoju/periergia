"use client";

import { useState } from "react";

// An interactive thermodynamic view of life, embedded in an article via a fenced
// ```entropyexport block (see Reader's `pre` override). Life seems to defy the
// second law by staying exquisitely ordered — but it doesn't: an organism is an
// OPEN system that holds its own low internal entropy by importing low-entropy
// energy and dumping a greater high-entropy waste to its surroundings, so the
// TOTAL entropy still rises. Slide the metabolic throughput: high, and the
// organism stays ordered (alive) while exporting disorder fast; drop it toward
// zero and the flow stops, internal order collapses, and the second law reclaims
// it — death. currentColor theming; first render deterministic (a living, well-
// fed organism). Illustrative model, not a numerical simulation.

const BX = 150, BY = 40, BW = 140, BH = 130; // organism box
const ALIVE_MIN = 15; // % throughput below which order can't be maintained

// Deterministic scatter of "disorder" dots inside the organism (SSR-safe).
const DOTS = Array.from({ length: 46 }, (_, i) => ({
  x: BX + 12 + ((i * 53) % (BW - 24)),
  y: BY + 12 + ((i * 29) % (BH - 24)),
}));

export function EntropyExport() {
  const [t, setT] = useState(70); // metabolic throughput, %
  const sInt = 1 - t / 100; // internal entropy: low when throughput high
  const alive = t >= ALIVE_MIN;
  const nDots = Math.round(4 + sInt * (DOTS.length - 4)); // few dots = ordered
  const flow = 3 + (t / 100) * 22; // arrow thickness scales with throughput

  return (
    <figure className="ee-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 235" className="w-full h-auto" role="img"
        aria-label={`At ${t}% metabolic throughput, the organism's internal entropy is ${alive ? "low (ordered, alive)" : "high (disordered, dead)"}, while it exports disorder to its surroundings.`}>
        {/* low-entropy energy in */}
        <g className="text-purple">
          <line x1={18} y1={BY + BH / 2} x2={BX - 4} y2={BY + BH / 2} stroke="currentColor"
            strokeWidth={flow} opacity={0.8} strokeLinecap="round" />
          <path d={`M${BX - 4} ${BY + BH / 2} l-12 -8 v16 z`} fill="currentColor" opacity={0.8} />
          <text x={20} y={BY + BH / 2 - 12} fill="currentColor" fontSize={9.5} fontWeight={700}
            fontFamily="ui-sans-serif, system-ui, sans-serif">low-entropy</text>
          <text x={20} y={BY + BH / 2 + 22} fill="currentColor" fontSize={9.5} fontWeight={700}
            fontFamily="ui-sans-serif, system-ui, sans-serif">energy in</text>
        </g>

        {/* high-entropy waste out */}
        <g className="text-maroon">
          <line x1={BX + BW + 4} y1={BY + BH / 2} x2={422} y2={BY + BH / 2} stroke="currentColor"
            strokeWidth={flow} opacity={0.8} strokeLinecap="round" />
          <path d={`M422 ${BY + BH / 2} l-12 -8 v16 z`} fill="currentColor" opacity={0.8} />
          <text x={420} y={BY + BH / 2 - 12} textAnchor="end" fill="currentColor" fontSize={9.5} fontWeight={700}
            fontFamily="ui-sans-serif, system-ui, sans-serif">high-entropy</text>
          <text x={420} y={BY + BH / 2 + 22} textAnchor="end" fill="currentColor" fontSize={9.5} fontWeight={700}
            fontFamily="ui-sans-serif, system-ui, sans-serif">waste + heat out</text>
        </g>

        {/* the organism */}
        <rect className={alive ? "text-purple" : "text-maroon"} x={BX} y={BY} width={BW} height={BH} rx={10}
          fill="none" stroke="currentColor" strokeWidth={2.4} />
        <g className={alive ? "text-ink" : "text-maroon"} fill="currentColor">
          {DOTS.slice(0, nDots).map((d, i) => (
            <circle key={i} cx={d.x} cy={d.y} r={2} opacity={0.7} />
          ))}
        </g>
        <text className="text-muted" x={BX + BW / 2} y={BY - 8} textAnchor="middle" fill="currentColor"
          fontSize={10} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          the organism (open system)
        </text>
        <text className={alive ? "text-purple" : "text-maroon"} x={BX + BW / 2} y={BY + BH + 16} textAnchor="middle"
          fill="currentColor" fontSize={10.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {alive ? "internal entropy: LOW — ordered" : "internal entropy: HIGH — decaying"}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Throughput <strong className="tabular-nums">{t}%</strong> →{" "}
        {alive
          ? <><span className="text-purple font-semibold">alive</span>: order held by exporting disorder — total entropy still rising.</>
          : <><strong className="text-maroon">the flow has stopped; the second law reclaims the order — death.</strong></>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Metabolic throughput (energy flow)</span><span className="tabular-nums">{t}%</span>
          </span>
          <input type="range" min={0} max={100} step={1} value={t}
            onChange={(e) => setT(Number(e.target.value))}
            aria-label="Metabolic throughput percent" className="mt-1 w-full"
            style={{ accentColor: alive ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        A living thing is one of the most improbably <em>ordered</em> arrangements of matter in the universe, and the second law of thermodynamics says disorder must increase — so life looks, at first, like a violation. It isn&rsquo;t. An organism is an <span className="text-purple">open system</span>: it holds its own low internal entropy by importing low-entropy energy (ordered food, sunlight) and dumping a <em>greater</em> high-entropy waste (heat, simple byproducts) into its surroundings, so the <strong>total</strong> entropy of organism-plus-surroundings still rises, exactly as the law demands. Schrödinger called it &ldquo;feeding on negative entropy.&rdquo; Life pays for its order by making more disorder elsewhere — and metabolism is the machinery of that bargain. Cut the throughput and the bargain ends: the ordered structure decays, and <span className="text-maroon">death is simply the moment the entropy battle is lost</span>. This is the deepest view of what life is — not a substance but a process, a persistent island of order in a universe running down — and it hints at a search criterion beyond carbon and water: look for anything doing work to stay improbably ordered, whatever it is made of.
      </figcaption>
    </figure>
  );
}
