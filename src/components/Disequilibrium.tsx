"use client";

import { useState } from "react";

// An interactive chemical-disequilibrium explorer, embedded in an article via a
// fenced ```disequilibrium block (see Reader's `pre` override). Oxygen and methane
// destroy each other, so in an oxygen-rich atmosphere methane has a lifetime of
// only about a decade. Left alone, it vanishes and the air settles into a dead,
// equilibrated state. Only a relentless SOURCE — on Earth, life — can hold both
// gases in the air at once, a chemical impossibility that betrays a living planet
// across the light-years. Toggle the source and slide the methane lifetime to
// watch the atmosphere either settle to equilibrium or stay held out of it.
// currentColor theming; first render deterministic (source on, 10-year lifetime).

const X0 = 44, X1 = 424, Y0 = 30, Y1 = 150;
const YEARS = 60;
const px = (t: number) => X0 + (t / YEARS) * (X1 - X0);
const py = (v: number) => Y1 - v * (Y1 - Y0); // v in 0..1

export function Disequilibrium() {
  const [source, setSource] = useState(true); // is something replenishing methane?
  const [tau, setTau] = useState(10); // methane lifetime, years

  // Methane abundance over time, starting from a full atmosphere.
  // Source on: replenished as fast as destroyed -> held flat at 1.
  // Source off: exponential decay with lifetime tau.
  const pts: [number, number][] = [];
  for (let t = 0; t <= YEARS; t += 2) {
    const v = source ? 1 : Math.exp(-t / tau);
    pts.push([t, v]);
  }
  const path = pts.map(([t, v], i) => `${i ? "L" : "M"}${px(t).toFixed(1)} ${py(v).toFixed(1)}`).join(" ");
  const endV = source ? 1 : Math.exp(-YEARS / tau);
  const halfLife = tau * Math.log(2);

  return (
    <figure className="deq-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With a methane lifetime of ${tau} years and the biological source ${source ? "replenishing it, methane stays in the air alongside oxygen — a disequilibrium biosignature" : "switched off, methane decays away within decades and the atmosphere settles to a dead equilibrium"}.`}>
        {/* oxygen band — always present */}
        <rect className="text-purple" x={X0} y={Y0 - 14} width={X1 - X0} height={11} fill="currentColor" opacity={0.18} />
        <text className="text-purple" x={X0 + 4} y={Y0 - 5} fill="currentColor" fontSize={8} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">O₂ — abundant, life-made</text>

        {/* axes */}
        <line className="text-line" x1={X0} y1={Y1} x2={X1} y2={Y1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={X0} y1={Y0} x2={X0} y2={Y1} stroke="currentColor" strokeWidth={1} />
        {[0, 20, 40, 60].map((t) => (
          <g key={t}>
            <line className="text-line" x1={px(t)} y1={Y1} x2={px(t)} y2={Y1 + 4} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={px(t)} y={Y1 + 14} textAnchor="middle" fill="currentColor" fontSize={8}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{t} yr</text>
          </g>
        ))}
        <text className="text-muted" x={(X0 + X1) / 2} y={Y1 + 30} textAnchor="middle" fill="currentColor" fontSize={9.5}
          fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">time, once the atmosphere is stocked with methane ⟶</text>
        <text className="text-muted" x={X0 - 6} y={py(1) + 3} textAnchor="end" fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">CH₄</text>

        {/* the methane curve */}
        <path d={path} className={source ? "text-maroon" : "text-faint"} fill="none" stroke="currentColor"
          strokeWidth={2.4} strokeLinecap="round" strokeLinejoin="round" />
        {/* end marker */}
        <circle cx={px(YEARS)} cy={py(endV)} r={4} className={source ? "text-maroon" : "text-faint"} fill="currentColor" />

        {/* half-life guide when decaying */}
        {!source && halfLife <= YEARS && (
          <g className="text-faint">
            <line x1={px(halfLife)} y1={py(0.5)} x2={px(halfLife)} y2={Y1} stroke="currentColor" strokeWidth={1}
              strokeDasharray="3 3" opacity={0.6} />
            <text x={px(halfLife) + 3} y={py(0.5) - 3} fill="currentColor" fontSize={7.5} fontWeight={600}
              fontFamily="ui-sans-serif, system-ui, sans-serif">half gone</text>
          </g>
        )}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {source
          ? <><strong className="text-maroon">Methane and oxygen coexist</strong> — held out of equilibrium by a ceaseless source. A chemical impossibility, and a <span className="text-purple">biosignature</span>.</>
          : <><span className="text-muted font-semibold">No source</span> — methane decays away in a few decades and the air settles into a dead, equilibrated state. <span className="text-faint">Nothing to see.</span></>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Methane lifetime in this air</span><span className="tabular-nums">{tau} yr</span>
          </span>
          <input type="range" min={5} max={40} step={1} value={tau} onChange={(e) => setTau(Number(e.target.value))}
            aria-label="Methane lifetime in years" className="mt-1 w-full"
            style={{ accentColor: source ? "var(--c-maroon)" : "var(--c-muted)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setSource((v) => !v)} aria-pressed={source}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${source ? "border-maroon bg-maroon text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {source ? "Source: life, replenishing" : "Source: none"}
          </button>
          <button type="button" onClick={() => { setSource(true); setTau(10); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Reset (Earth-like)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Oxygen and methane react and destroy each other, so in Earth&rsquo;s oxygen-rich air methane survives only about <strong>ten years</strong> before it is gone. Earth&rsquo;s atmosphere is <strong>4.5 billion</strong> years old — long enough to have wiped out any starting methane hundreds of millions of times over. Yet methane is still here, sitting in the air beside the very gas that eats it, like a lit match and a puddle of petrol persisting side by side, year after year. That makes no sense unless something is <span className="text-maroon">continuously resupplying the fuel</span> as fast as it burns — and on Earth that something is <span className="text-purple">life</span> (microbes belch methane; photosynthesis floods the air with oxygen). A dead world settles into a placid, equilibrated atmosphere; a living one is held, ceaselessly, out of balance. This <em>disequilibrium</em> is the gold-standard biosignature — and, because it detects the thermodynamic signature of a driven system rather than any one molecule, it could betray even life whose chemistry we cannot guess.
      </figcaption>
    </figure>
  );
}
