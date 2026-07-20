"use client";

import { useState } from "react";

// An interactive ocean-access explorer, embedded in an article via a fenced
// ```oceanaccess block (see Reader's `pre` override). To sample a subsurface
// ocean you must get past the ice — and there are two ways. Drill: but the
// deepest hole humans have ever bored (on Earth, over decades) is ~12 km, so an
// ice shell tens of kilometres thick locks the ocean away. Or fly through a
// plume: if the moon sprays its ocean into space (Enceladus), you catch the sea
// at altitude, no landing, no drilling. Slide the ice thickness and toggle the
// plume to see why tiny Enceladus may beat vast Europa to the answer. currentColor
// theming; first render deterministic (Europa: thick ice, no plume).

const DRILL_MAX = 12; // km — deepest human borehole (Kola)
const KM_MAX = 45; // km shown on the depth scale

const X0 = 40, X1 = 424, SURF = 96, Y1 = 214;
const pd = (km: number) => SURF + (Math.min(KM_MAX, km) / KM_MAX) * (Y1 - SURF);

export function OceanAccess() {
  const [ice, setIce] = useState(20); // ice-shell thickness, km
  const [plume, setPlume] = useState(false);
  const drillReaches = ice <= DRILL_MAX;

  return (
    <figure className="oa-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With an ice shell ${ice} km thick, drilling ${drillReaches ? "can" : "cannot"} reach the ocean (human record 12 km); ${plume ? "a plume lets you sample it from above" : "there is no plume to sample"}.`}>
        {/* space */}
        <rect x={X0} y={20} width={X1 - X0} height={SURF - 20} className="text-card" fill="currentColor" />
        {/* ice shell */}
        <rect className="text-line" x={X0} y={SURF} width={X1 - X0} height={pd(ice) - SURF} fill="currentColor" opacity={0.35} />
        {/* ocean */}
        <rect className="text-purple" x={X0} y={pd(ice)} width={X1 - X0} height={Y1 - pd(ice)} fill="currentColor" opacity={0.4} />
        {/* rocky floor + a vent */}
        <rect className="text-maroon" x={X0} y={Y1 - 6} width={X1 - X0} height={6} fill="currentColor" opacity={0.5} />
        <path className="text-maroon" d={`M${(X0 + X1) / 2 - 6} ${Y1 - 6} q6 -14 12 0 z`} fill="currentColor" opacity={0.5} />

        {/* labels */}
        <text className="text-muted" x={X0 + 5} y={SURF - 5} fill="currentColor" fontSize={8.5} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">surface</text>
        <text className="text-muted" x={X1 - 5} y={SURF + 12} textAnchor="end" fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">ICE · {ice} km</text>
        <text className="text-purple" x={X1 - 5} y={pd(ice) + 14} textAnchor="end" fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">OCEAN</text>

        {/* deepest-human-drill line */}
        <line className="text-maroon" x1={X0} y1={pd(DRILL_MAX)} x2={X1} y2={pd(DRILL_MAX)} stroke="currentColor"
          strokeWidth={1} strokeDasharray="4 3" opacity={0.8} />
        <text className="text-maroon" x={X0 + 5} y={pd(DRILL_MAX) - 3} fill="currentColor" fontSize={7.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">deepest human drill · 12 km</text>

        {/* the drill */}
        <line className={drillReaches ? "text-ink" : "text-maroon"} x1={140} y1={SURF} x2={140} y2={pd(Math.min(ice, DRILL_MAX))}
          stroke="currentColor" strokeWidth={2.4} />
        <text className={drillReaches ? "text-ink" : "text-maroon"} x={140} y={SURF - 5} textAnchor="middle" fill="currentColor"
          fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">drill</text>

        {/* the plume + spacecraft (if the moon vents) */}
        {plume && (
          <g className="text-purple">
            {[300, 312, 324].map((x, i) => (
              <line key={i} x1={x} y1={SURF} x2={x + (i - 1) * 6} y2={30} stroke="currentColor" strokeWidth={1.4}
                opacity={0.5} strokeLinecap="round" />
            ))}
            <g className="text-ink">
              <circle cx={280} cy={44} r={4} fill="currentColor" />
              <line x1={280} y1={44} x2={344} y2={44} stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.7} />
              <path d="M344 44 l-8 -4 v8 z" fill="currentColor" />
            </g>
            <text className="text-purple" x={312} y={26} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">plume</text>
          </g>
        )}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {plume
          ? <><strong className="text-purple">Fly through the plume</strong> — sample the ocean from above, no landing, no drilling, whatever the ice thickness.</>
          : drillReaches
          ? <><span className="text-ink font-semibold">Drilling can reach it</span> — the ice is within the 12 km human record.</>
          : <><strong className="text-maroon">Locked away</strong> — {ice} km of ice, and no plume; drilling {ice} km is far beyond the 12 km humans have ever managed.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Ice-shell thickness</span><span className="tabular-nums">{ice} km</span>
          </span>
          <input type="range" min={1} max={KM_MAX} step={1} value={ice} onChange={(e) => setIce(Number(e.target.value))}
            aria-label="Ice-shell thickness in km" className="mt-1 w-full"
            style={{ accentColor: plume ? "var(--c-purple)" : drillReaches ? "var(--c-ink)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setPlume((v) => !v)} aria-pressed={plume}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${plume ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {plume ? "Plume: erupting" : "Plume: none"}
          </button>
          <button type="button" onClick={() => { setIce(20); setPlume(false); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Europa (~20 km, no plume)
          </button>
          <button type="button" onClick={() => { setIce(5); setPlume(true); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Enceladus (thin, spraying)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Every ocean world hides its sea beneath ice, and there are only two ways to taste it. You can <span className="text-ink">drill</span> — but the deepest hole humanity has ever bored, the Kola borehole, reached about <strong>12&nbsp;km</strong> after decades of effort on Earth, so an ice shell tens of kilometres thick (Europa&rsquo;s is perhaps 10–30) locks the ocean away for the foreseeable future. Or the moon can hand you its ocean: <span className="text-purple">Enceladus sprays its sea into space</span> through the cracks at its south pole, so a spacecraft simply flies through the plume at altitude and catches the droplets — no landing, no drilling, no touching the moon at all. This single difference, plume versus drill, may be why tiny Enceladus, not vast Europa, is where we first learn whether an alien ocean is inhabited. The rocket equation gets you to Saturn; a cooperating moon gets you into its ocean.
      </figcaption>
    </figure>
  );
}
