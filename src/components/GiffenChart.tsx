"use client";

import { useState } from "react";

// An interactive decomposition of a price rise into its substitution and income
// effects, embedded via a fenced ```giffen block (see Reader's `pre` override).
// A single price rise (P1→P2) moves quantity; the move is split into the
// substitution effect (always left) and the income effect (reinforces for a
// normal good, opposes for an inferior good, opposes AND outweighs for a Giffen
// good — flipping the demand curve upward). Same plot frame/units as the house
// SupplyDemandChart; themed via `currentColor` on Tailwind text-* groups.
// First render is deterministic (normal good) so SSR and first paint agree.

const Q_MAX = 800;
const P_MAX = 8;
const X0 = 46;
const X1 = 400;
const Y0 = 16;
const Y1 = 262;
const clampQ = (q: number) => Math.max(0, Math.min(Q_MAX, q));
const sx = (q: number) => X0 + (clampQ(q) / Q_MAX) * (X1 - X0);
const sy = (p: number) => Y1 - (p / P_MAX) * (Y1 - Y0);

const P1 = 3;
const P2 = 5;
const Q1 = 460;
const SUB = -150; // substitution effect: always left
const INC = { normal: -90, inferior: 70, giffen: 230 } as const;

type Mode = keyof typeof INC;

const COPY: Record<Mode, string> = {
  normal:
    "Normal good — both effects push the same way, so quantity falls. Price up, quantity down: the ordinary downward-sloping curve.",
  inferior:
    "Inferior good — the income effect now opposes substitution but is weaker, so the net move is still down. The curve slopes downward, just less steeply.",
  giffen:
    "Giffen good — the income effect opposes and outweighs substitution, so the arrows sum to a move right. Price up, quantity up: the demand curve slopes upward and the law of demand breaks.",
};

function Arrow({ x1, x2, y, cls, label }: { x1: number; x2: number; y: number; cls: string; label: string }) {
  const dir = x2 >= x1 ? 1 : -1;
  return (
    <g className={cls} fill="currentColor">
      <line x1={x1} y1={y} x2={x2} y2={y} stroke="currentColor" strokeWidth={2.2} />
      <path d={`M${x2} ${y} l${-dir * 8} -4.5 l0 9 z`} />
      <text x={(x1 + x2) / 2} y={y - 7} textAnchor="middle" fontSize={10}
        fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">{label}</text>
    </g>
  );
}

export function GiffenChart() {
  const [mode, setMode] = useState<Mode>("normal");

  const inc = INC[mode];
  const Q2 = clampQ(Q1 + SUB + inc);
  const up = Q2 > Q1;

  // Demand line through (Q1,P1) and (Q2,P2), extended a little past both ends.
  const dQ = Q2 - Q1;
  const dP = P2 - P1;
  const ext = 0.5;
  const e1 = { q: Q1 - dQ * ext, p: P1 - dP * ext };
  const e2 = { q: Q2 + dQ * ext, p: P2 + dP * ext };

  const bandY1 = Y1 - 30;
  const bandY2 = Y1 - 12;
  const midQ = clampQ(Q1 + SUB);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 300" className="w-full h-auto" role="img"
        aria-label={`A price rise decomposed into substitution and income effects for a ${mode} good; quantity moves ${up ? "up" : "down"}.`}>
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
        </g>
        <g className="text-faint" fill="currentColor" fontSize={10} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {[0, 2, 4, 6, 8].map((p) => (
            <g key={`p${p}`}>
              <line x1={X0 - 3} y1={sy(p)} x2={X0} y2={sy(p)} stroke="currentColor" />
              <text x={X0 - 6} y={sy(p) + 3} textAnchor="end">{`$${p}`}</text>
            </g>
          ))}
          {[0, 200, 400, 600, 800].map((q) => (
            <g key={`q${q}`}>
              <line x1={sx(q)} y1={Y1} x2={sx(q)} y2={Y1 + 3} stroke="currentColor" />
              <text x={sx(q)} y={Y1 + 15} textAnchor="middle">{q}</text>
            </g>
          ))}
        </g>
        <g className="text-muted" fill="currentColor" fontSize={10.5} fontFamily="ui-sans-serif, system-ui, sans-serif" fontWeight={600}>
          <text x={(X0 + X1) / 2} y={295} textAnchor="middle">Quantity</text>
          <text x={14} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 14 ${(Y0 + Y1) / 2})`}>Price</text>
        </g>

        {/* Guide lines to each point */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3">
          <line x1={X0} y1={sy(P1)} x2={sx(Q1)} y2={sy(P1)} />
          <line x1={X0} y1={sy(P2)} x2={sx(Q2)} y2={sy(P2)} />
          <line x1={sx(Q1)} y1={Y1} x2={sx(Q1)} y2={sy(P1)} />
          <line x1={sx(Q2)} y1={Y1} x2={sx(Q2)} y2={sy(P2)} />
        </g>

        {/* Demand curve through both points */}
        <line className="text-purple" stroke="currentColor" strokeWidth={2.6}
          x1={sx(e1.q)} y1={sy(e1.p)} x2={sx(e2.q)} y2={sy(e2.p)} />
        <text className="text-purple" fill="currentColor" fontSize={12} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif"
          x={sx(e2.q) + (up ? 6 : -14)} y={sy(e2.p) + 4}>{up ? "D ↑" : "D"}</text>

        {/* The two endpoints */}
        <circle className="text-ink" fill="var(--c-card)" stroke="currentColor" strokeWidth={2} cx={sx(Q1)} cy={sy(P1)} r={4.5} />
        <circle className="text-purple" fill="currentColor" cx={sx(Q2)} cy={sy(P2)} r={4.5} />

        {/* Decomposition arrows */}
        <Arrow x1={sx(Q1)} x2={sx(midQ)} y={bandY1} cls="text-maroon" label="substitution" />
        <Arrow x1={sx(midQ)} x2={sx(clampQ(midQ + inc))} y={bandY2} cls="text-purple" label="income" />
      </svg>

      <div className="mt-1 flex justify-center">
        <span className="inline-flex overflow-hidden rounded-md border border-line">
          {(["normal", "inferior", "giffen"] as const).map((m, i) => (
            <button key={m} type="button" onClick={() => setMode(m)}
              aria-pressed={mode === m}
              className={`font-sans text-[12px] px-3 py-1.5 capitalize transition-colors ${
                mode === m ? "bg-ink text-card" : "text-muted hover:text-ink"
              } ${i < 2 ? "border-r border-line" : ""}`}>
              {m}
            </button>
          ))}
        </span>
      </div>

      <p className="mt-3 text-center font-sans text-[13px] text-ink">{COPY[mode]}</p>

      <figcaption className="mt-2 font-sans text-[12px] text-faint leading-snug">
        A single price rise, split into its two parts. The <span className="text-maroon font-semibold">substitution effect</span> always reduces quantity (arrow left). The <span className="text-purple font-semibold">income effect</span> reinforces it for a normal good, opposes it for an inferior good, and for a Giffen good opposes <em>and</em> outweighs it — so the arrows sum to a move right, and quantity demanded rises with price.
      </figcaption>
    </figure>
  );
}
