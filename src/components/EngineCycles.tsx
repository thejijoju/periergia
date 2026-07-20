"use client";

import { useState } from "react";

// An interactive engine-cycle selector, embedded in an article via a fenced
// ```enginecycles block (see Reader's `pre` override). Every rocket-engine cycle
// is one answer to a single question — after the hot gas has spun the turbine
// that drives the pumps, what happens to it? Pick a cycle and the schematic
// re-routes the turbine exhaust (dumped overboard and wasted, or fed on into the
// main chamber and burned), while three gauges show what that buys in specific
// impulse and chamber pressure and what it costs in complexity. Climbing the
// ladder trades engineering hell for payload. Themed by `currentColor`
// (light/dark); first render deterministic (gas-generator).

type Fate = "none" | "dumped" | "chamber" | "both";

// Relative figures (0–100) illustrating the chapter's Low/Medium/High table.
const CYCLES: {
  key: string; label: string; fate: Fate; isp: number; pc: number; cx: number;
  examples: string; note: string;
}[] = [
  { key: "pf", label: "Pressure-fed", fate: "none", isp: 55, pc: 20, cx: 10,
    examples: "Apollo LM, thrusters", note: "No turbine at all — tanks hold the pressure. Dead simple, low performance." },
  { key: "gg", label: "Gas-generator", fate: "dumped", isp: 78, pc: 50, cx: 35,
    examples: "F-1, Merlin, RS-68", note: "Burn ~2–5% of propellant to spin the turbine, then throw that exhaust overboard — the sooty second plume on a Saturn V. A direct Isp penalty for simplicity." },
  { key: "ex", label: "Expander", fate: "chamber", isp: 90, pc: 50, cx: 50,
    examples: "RL10", note: "Heat the fuel on the chamber walls, spin the turbine with it, then burn it. Nothing wasted — but wall area caps the thrust, so it stays a small upper-stage engine." },
  { key: "sc", label: "Staged (fuel-rich)", fate: "chamber", isp: 92, pc: 80, cx: 78,
    examples: "RS-25 (Shuttle)", note: "Burn it twice: a fuel-rich preburner drives the turbine, then its exhaust is burned fully in the main chamber. High Isp — but the preburner tries to cook the turbine." },
  { key: "or", label: "Staged (oxygen-rich)", fate: "chamber", isp: 93, pc: 92, cx: 88,
    examples: "NK-33, RD-170", note: "Clean for kerosene, but the turbine now runs in a torch of hot high-pressure oxygen that wants to burn the metal itself. The Soviets solved the metallurgy the Americans called impossible." },
  { key: "ff", label: "Full-flow staged", fate: "both", isp: 95, pc: 100, cx: 100,
    examples: "Raptor", note: "Two preburners — one fuel-rich, one oxygen-rich — so all propellant passes through and into the chamber. The theoretical summit; first flown on Raptor. Every hard problem at once." },
];

const GAUGES = [
  { key: "isp" as const, label: "specific impulse", cls: "text-purple" },
  { key: "pc" as const, label: "chamber pressure", cls: "text-purple" },
  { key: "cx" as const, label: "complexity / hell", cls: "text-maroon" },
];

function Box({ x, y, w, label, dim }: { x: number; y: number; w: number; label: string; dim?: boolean }) {
  return (
    <g className={dim ? "text-faint" : "text-ink"} opacity={dim ? 0.45 : 1}>
      <rect x={x} y={y} width={w} height={26} rx={4} fill="none" stroke="currentColor" strokeWidth={1.3} />
      <text x={x + w / 2} y={y + 16} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={600}
        fontFamily="ui-sans-serif, system-ui, sans-serif">{label}</text>
    </g>
  );
}

export function EngineCycles() {
  const [i, setI] = useState(1); // gas-generator
  const c = CYCLES[i];
  const hasTurbine = c.fate !== "none";

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 150" className="w-full h-auto" role="img"
        aria-label={`${c.label} cycle: turbine exhaust is ${c.fate === "dumped" ? "dumped overboard" : c.fate === "none" ? "absent" : "burned in the main chamber"}.`}>
        {/* Flow skeleton: tanks → pump → preburner → turbine → chamber → nozzle */}
        <Box x={20} y={62} w={54} label="propellant" />
        <Box x={96} y={62} w={44} label="pump" dim={!hasTurbine} />
        <Box x={162} y={62} w={56} label="preburner" dim={!hasTurbine} />
        <Box x={240} y={62} w={46} label="turbine" dim={!hasTurbine} />
        <Box x={308} y={62} w={62} label="main chamber" />
        {/* nozzle */}
        <path className="text-ink" d="M370 62 L400 55 L400 95 L370 88 Z" fill="none" stroke="currentColor" strokeWidth={1.3} />

        {/* Main flow arrows */}
        <g className="text-line" stroke="currentColor" strokeWidth={1.4}>
          <line x1={74} y1={75} x2={96} y2={75} />
          <line x1={140} y1={75} x2={162} y2={75} />
          <line x1={218} y1={75} x2={240} y2={75} />
          {/* turbine → chamber baseline (main path) */}
          <line x1={286} y1={75} x2={308} y2={75} />
        </g>

        {/* The turbine-exhaust fate — the whole point */}
        {c.fate === "dumped" && (
          <g className="text-maroon">
            <path d="M263 62 C263 40 300 40 300 26" fill="none" stroke="currentColor" strokeWidth={2.2}
              strokeDasharray="4 3" markerEnd="" />
            <path d="M294 30 L300 22 L306 30 Z" fill="currentColor" />
            <text x={312} y={26} fill="currentColor" fontSize={9} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">dumped — wasted</text>
          </g>
        )}
        {(c.fate === "chamber" || c.fate === "both") && (
          <g className="text-purple">
            <path d="M263 62 C263 42 330 42 335 60" fill="none" stroke="currentColor" strokeWidth={2.2} />
            <path d="M330 52 L337 60 L328 61 Z" fill="currentColor" />
            <text x={300} y={38} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">
              {c.fate === "both" ? "both streams burned" : "burned in chamber"}
            </text>
          </g>
        )}
        {c.fate === "none" && (
          <text className="text-muted" x={200} y={40} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={600}
            fontFamily="ui-sans-serif, system-ui, sans-serif">no turbine — tanks hold the pressure</text>
        )}

        {/* thrust label */}
        <text className="text-muted" x={400} y={112} textAnchor="middle" fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">thrust →</text>
      </svg>

      {/* Gauges */}
      <div className="mt-2 space-y-1.5">
        {GAUGES.map((g) => (
          <div key={g.key} className="flex items-center gap-2">
            <span className="w-28 shrink-0 font-sans text-[11px] text-muted">{g.label}</span>
            <span className="relative h-2.5 flex-1 overflow-hidden rounded-full bg-line/40">
              <span className={`absolute inset-y-0 left-0 rounded-full ${g.cls}`}
                style={{ width: `${c[g.key]}%`, backgroundColor: "currentColor" }} />
            </span>
          </div>
        ))}
      </div>

      <div className="mt-3 flex flex-wrap gap-1.5">
        {CYCLES.map((cc, idx) => (
          <button key={cc.key} type="button" onClick={() => setI(idx)} aria-pressed={idx === i}
            className={`font-sans text-[11.5px] rounded-md border px-2 py-1 transition-colors ${
              idx === i ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"
            }`}>
            {cc.label}
          </button>
        ))}
      </div>

      <p className="mt-3 font-sans text-[13px] text-ink">
        <strong>{c.label}.</strong> {c.note} <span className="text-muted">— {c.examples}.</span>
      </p>

      <figcaption className="mt-2 font-sans text-[12px] text-faint leading-snug">
        Every cycle answers one question: after the turbine has spun the pumps, what happens to its exhaust? <span className="text-maroon">Dump it</span> (gas-generator — waste a few percent) → recycle the fuel&rsquo;s heat (expander — but it won&rsquo;t scale) → <span className="text-purple">burn it twice</span> (staged combustion — the preburner tries to melt or ignite the turbine) → burn absolutely all of it, both streams (full-flow). Each rung buys a little Isp or a chunk of chamber pressure — which, through the exponential of the rocket equation, is real payload — at the price of a new category of engineering hell. Bars are relative, illustrating the chapter&rsquo;s table.
      </figcaption>
    </figure>
  );
}
