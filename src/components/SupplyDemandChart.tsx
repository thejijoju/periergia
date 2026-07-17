"use client";

import { useState } from "react";

// An interactive supply-and-demand diagram, embedded in an article via a fenced
// ```supplydemand block (see Reader's `pre` override). Two straight curves cross
// at the market equilibrium; the sliders shift each curve so the reader can
// watch the equilibrium price and quantity move — a demand shift right raises
// both, a supply shift right lowers price but raises quantity. The numbers match
// the worked schedule in the Economics · Introduction article (equilibrium at
// $4 × 300). First render uses zero shift, so SSR and the first client paint
// agree — the sliders only change state on interaction.
//
// Colour is carried by `currentColor` on Tailwind text-* groups, so the whole
// figure re-themes automatically in light and dark mode.

// Linear model, in the article's units (price $0–8, quantity 0–800):
//   Qd = 700 − 100·P (+ demand shift)      Qs = −100 + 100·P (+ supply shift)
const Q_MAX = 800;
const P_MAX = 8;
const qd = (p: number, shift: number) => 700 - 100 * p + shift;
const qs = (p: number, shift: number) => -100 + 100 * p + shift;

// Plot rectangle inside the 440×300 viewBox (room on the right for D/S labels).
const X0 = 46;
const X1 = 400;
const Y0 = 16;
const Y1 = 262;
const sx = (q: number) => X0 + (q / Q_MAX) * (X1 - X0);
const sy = (p: number) => Y1 - (p / P_MAX) * (Y1 - Y0);

export function SupplyDemandChart() {
  const [dShift, setDShift] = useState(0);
  const [sShift, setSShift] = useState(0);

  // Equilibrium: qd = qs  ⇒  P* = (800 + dShift − sShift) / 200.
  const pe = (800 + dShift - sShift) / 200;
  const qe = qs(pe, sShift);

  // Each straight curve drawn across the full price range, clipped to the plot.
  const demand = { x1: sx(qd(0, dShift)), y1: sy(0), x2: sx(qd(P_MAX, dShift)), y2: sy(P_MAX) };
  const supply = { x1: sx(qs(0, sShift)), y1: sy(0), x2: sx(qs(P_MAX, sShift)), y2: sy(P_MAX) };

  const pTicks = [0, 2, 4, 6, 8];
  const qTicks = [0, 200, 400, 600, 800];

  const shifted = dShift !== 0 || sShift !== 0;
  const money = (p: number) => `$${p.toFixed(2).replace(/\.00$/, "")}`;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 300" className="w-full h-auto" role="img"
        aria-label={`Supply and demand diagram. Equilibrium at price ${money(pe)} and quantity ${Math.round(qe)}.`}>
        <defs>
          <clipPath id="sd-plot">
            <rect x={X0} y={Y0} width={X1 - X0} height={Y1 - Y0} />
          </clipPath>
        </defs>

        {/* Axes + gridlines */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
        </g>
        <g className="text-faint" fill="currentColor" fontSize={10} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {pTicks.map((p) => (
            <g key={`p${p}`}>
              <line x1={X0 - 3} y1={sy(p)} x2={X0} y2={sy(p)} stroke="currentColor" />
              <text x={X0 - 6} y={sy(p) + 3} textAnchor="end">{`$${p}`}</text>
            </g>
          ))}
          {qTicks.map((q) => (
            <g key={`q${q}`}>
              <line x1={sx(q)} y1={Y1} x2={sx(q)} y2={Y1 + 3} stroke="currentColor" />
              <text x={sx(q)} y={Y1 + 15} textAnchor="middle">{q}</text>
            </g>
          ))}
        </g>

        {/* Axis titles */}
        <g className="text-muted" fill="currentColor" fontSize={10.5} fontFamily="ui-sans-serif, system-ui, sans-serif" fontWeight={600}>
          <text x={(X0 + X1) / 2} y={295} textAnchor="middle">Quantity</text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>Price</text>
        </g>

        {/* Equilibrium guide lines + point */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3">
          <line x1={sx(qe)} y1={sy(pe)} x2={sx(qe)} y2={Y1} />
          <line x1={sx(qe)} y1={sy(pe)} x2={X0} y2={sy(pe)} />
        </g>

        {/* Demand (purple) and supply (maroon) curves */}
        <g clipPath="url(#sd-plot)">
          <line className="text-purple" stroke="currentColor" strokeWidth={2.4}
            x1={demand.x1} y1={demand.y1} x2={demand.x2} y2={demand.y2} />
          <line className="text-maroon" stroke="currentColor" strokeWidth={2.4}
            x1={supply.x1} y1={supply.y1} x2={supply.x2} y2={supply.y2} />
        </g>

        {/* Curve labels */}
        <g fontSize={12} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-purple" fill="currentColor" x={sx(qd(1.1, dShift)) + 7} y={sy(1.1) + 4}>D</text>
          <text className="text-maroon" fill="currentColor" x={sx(qs(7, sShift)) + 7} y={sy(7) + 4}>S</text>
        </g>

        {/* Equilibrium dot */}
        <circle className="text-ink" fill="currentColor" cx={sx(qe)} cy={sy(pe)} r={3.6} />
      </svg>

      {/* Live equilibrium readout */}
      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Equilibrium — price <strong>{money(pe)}</strong>, quantity <strong>{Math.round(qe)}</strong>
      </p>

      {/* Sliders */}
      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span><span className="text-purple font-semibold">Demand</span> shift</span>
            <span className="tabular-nums">{dShift > 0 ? `+${dShift}` : dShift}</span>
          </span>
          <input type="range" min={-200} max={200} step={50} value={dShift}
            onChange={(e) => setDShift(Number(e.target.value))}
            aria-label="Shift the demand curve"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span><span className="text-maroon font-semibold">Supply</span> shift</span>
            <span className="tabular-nums">{sShift > 0 ? `+${sShift}` : sShift}</span>
          </span>
          <input type="range" min={-200} max={200} step={50} value={sShift}
            onChange={(e) => setSShift(Number(e.target.value))}
            aria-label="Shift the supply curve"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>

      <div className="mt-2 flex items-center justify-between gap-3">
        <figcaption className="font-sans text-[12px] text-faint leading-snug">
          Shift demand right and both price and quantity rise; shift supply right and the price falls while quantity rises.
        </figcaption>
        {shifted && (
          <button type="button" onClick={() => { setDShift(0); setSShift(0); }}
            className="flex-none font-sans text-[12px] text-muted underline underline-offset-2 hover:text-ink transition-colors">
            Reset
          </button>
        )}
      </div>
    </figure>
  );
}
