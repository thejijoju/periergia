"use client";

import { useState } from "react";

// An interactive thermochemical-ceiling explorer, embedded in an article via a
// fenced ```thermochem block (see Reader's `pre` override). Exhaust velocity
// comes from v_e = sqrt( (2γ/(γ−1)) · R_u·T_c/M · [expansion] ): the two real
// knobs are chamber temperature T_c (a weak √ lever, pinned near 3,600 K by
// dissociation and melting metal) and mean molecular weight M (the strong
// 1/√M lever that points at hydrogen). Plot v_e against M for the chosen T_c;
// drop M and the curve rockets up, but even the champion barely grazes the
// ~4.5 km/s chemical wall — the ceiling five chapters kept running into.
// currentColor theming (light/dark); first render deterministic (hydrolox).

const GF = 12; // 2γ/(γ−1) with γ = 1.2
const RU = 8314; // J/(kmol·K); M in kg/kmol (= g/mol)
const BRACKET = 0.7; // representative nozzle expansion term [1 − (p_e/p_c)^…]
const CHEM_WALL = 4500; // m/s, the practical chemical ceiling

const M_LO = 2;
const M_HI = 44;
const VE_MAX = 6000;

const X0 = 48;
const X1 = 424;
const Y0 = 14;
const Y1 = 200;

const px = (M: number) => X0 + ((M - M_LO) / (M_HI - M_LO)) * (X1 - X0);
const py = (ve: number) => Y1 - Math.max(0, Math.min(1, ve / VE_MAX)) * (Y1 - Y0);

const veFn = (Tc: number, M: number) => Math.sqrt((GF * RU * Tc * BRACKET) / M);

const PRESETS = [
  { label: "Hydrolox", Tc: 3500, M: 13, note: "H₂/O₂, run fuel-rich" },
  { label: "Kerolox", Tc: 3600, M: 22, note: "RP-1/O₂" },
  { label: "Solid", Tc: 3000, M: 25, note: "APCP" },
] as const;

function vePath(Tc: number): string {
  const N = 120;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const M = M_LO + (i / N) * (M_HI - M_LO);
    d += `${i === 0 ? "M" : "L"}${px(M).toFixed(1)} ${py(veFn(Tc, M)).toFixed(1)}`;
  }
  return d;
}

export function ThermochemCeiling() {
  const [Tc, setTc] = useState(3500);
  const [M, setM] = useState(13);
  const ve = veFn(Tc, M);
  const isp = ve / 9.80665;
  const atWall = ve >= CHEM_WALL;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At chamber temperature ${Tc} K and molecular weight ${M}, exhaust velocity is ${(ve / 1000).toFixed(2)} km/s.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* The chemical wall */}
        <line className="text-maroon" x1={X0} y1={py(CHEM_WALL)} x2={X1} y2={py(CHEM_WALL)}
          stroke="currentColor" strokeWidth={1.3} strokeDasharray="5 3" opacity={0.8} />
        <text className="text-maroon" x={X1 - 2} y={py(CHEM_WALL) - 4} textAnchor="end"
          fill="currentColor" fontSize={9.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          the chemical wall ≈ 4.5 km/s
        </text>

        {/* v_e vs M curve for the current chamber temperature */}
        <path className="text-purple" d={vePath(Tc)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* Dot + guides */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(M)} y1={py(ve)} x2={px(M)} y2={Y1} />
          <line x1={X0} y1={py(ve)} x2={px(M)} y2={py(ve)} />
        </g>
        <circle className={atWall ? "text-maroon" : "text-purple"} cx={px(M)} cy={py(ve)} r={4} fill="currentColor" />

        {/* Axis labels + ticks */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">
            mean molecular weight of exhaust  M ⟶ (lighter is to the left)
          </text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle"
            transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>exhaust vₑ</text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(2)} y={Y1 + 12} textAnchor="middle">2 (H₂)</text>
          <text x={px(18)} y={Y1 + 12} textAnchor="middle">18 (H₂O)</text>
          <text x={px(44)} y={Y1 + 12} textAnchor="middle">44 (CO₂)</text>
          <text x={X0 - 4} y={py(6000) + 3} textAnchor="end">6</text>
          <text x={X0 - 4} y={py(4000) + 3} textAnchor="end">4</text>
          <text x={X0 - 4} y={py(2000) + 3} textAnchor="end">2 km/s</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        T<sub>c</sub> = <strong className="tabular-nums">{Tc.toLocaleString()} K</strong>, exhaust M ={" "}
        <strong className="tabular-nums">{M}</strong> →{" "}
        <span className={`font-semibold ${atWall ? "text-maroon" : "text-purple"}`}>
          vₑ = {(ve / 1000).toFixed(2)} km/s
        </span>{" "}
        (I<sub>sp</sub> ≈ {Math.round(isp)} s).{" "}
        {atWall
          ? <strong className="text-maroon">Up against the chemical wall — and only fuel-rich hydrogen gets here.</strong>
          : <>Halve the molecular weight and vₑ climbs by √2; doubling the temperature (you can&rsquo;t) would too.</>}
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Chamber temperature T<sub>c</sub></span>
            <span className="tabular-nums">{Tc.toLocaleString()} K</span>
          </span>
          <input type="range" min={1500} max={4000} step={50} value={Tc}
            onChange={(e) => setTc(Number(e.target.value))}
            aria-label="Chamber temperature"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Exhaust molecular weight M</span>
            <span className="tabular-nums">{M}</span>
          </span>
          <input type="range" min={M_LO} max={M_HI} step={1} value={M}
            onChange={(e) => setM(Number(e.target.value))}
            aria-label="Mean molecular weight of exhaust"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        {PRESETS.map((p) => (
          <button key={p.label} type="button" onClick={() => { setTc(p.Tc); setM(p.M); }}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            {p.label}
          </button>
        ))}
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        vₑ ∝ √(T<sub>c</sub>/M). Temperature is a weak lever inside a square root and is pinned near 3,600 K anyway — push higher and the flame tears its own molecules apart (dissociation) or melts the engine. So the whole chemical game is <strong>molecular weight</strong>: light exhaust leaves fast, which is why hydrolox burns deliberately fuel-rich, dragging unburned H₂ (M = 2) into the exhaust to pull the mean weight down to ~13. Slide M leftward and watch vₑ climb the 1/√M curve — and notice that even the lightest realistic exhaust barely reaches the <span className="text-maroon">~4.5 km/s wall</span>. That wall, not engineering, is why five chapters kept hitting a ceiling: it&rsquo;s written into the periodic table.
      </figcaption>
    </figure>
  );
}
