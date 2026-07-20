"use client";

import { useState } from "react";

// An interactive "easy or hard?" explorer, embedded in an article via a fenced
// ```originodds block (see Reader's `pre` override). The single unknown that
// governs whether the cosmos is full of life or nearly empty is the per-world
// probability that life arises. Multiply it by the number of potentially
// habitable worlds and you get the expected number of independent origins in the
// galaxy — which swings from "teeming" to "just us" across the axis. And the
// deep point: Earth is ONE success, consistent with the entire axis, so a single
// example cannot tell us where we are on it (the N=1 problem). Log-scale
// probability; currentColor theming; first render deterministic.

const N_HAB = 300_000_000; // order-of-magnitude potentially habitable rocky worlds in the Milky Way
const ALONE_P = 1 / N_HAB; // per-world probability at which the expected count is ~1 (just Earth)

const LOG_MIN = -12, LOG_MAX = 0; // log10 of the per-world origin probability
const X0 = 30, X1 = 424, AXIS_Y = 120;
const px = (logp: number) => X0 + ((logp - LOG_MIN) / (LOG_MAX - LOG_MIN)) * (X1 - X0);

function fmt(v: number): string {
  if (v >= 1e4) {
    const e = Math.floor(Math.log10(v));
    return `${(v / Math.pow(10, e)).toFixed(1)}×10^${e}`;
  }
  if (v >= 1) return Math.round(v).toLocaleString("en-US");
  if (v >= 0.01) return v.toFixed(2);
  return "≈0";
}

export function OriginOdds() {
  const [e, setE] = useState(-6); // exponent: p = 10^e
  const p = Math.pow(10, e);
  const expected = N_HAB * p;
  const teeming = expected >= 2;

  return (
    <figure className="oo-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 235" className="w-full h-auto" role="img"
        aria-label={`If life arises with probability 10^${e} per habitable world, about ${fmt(expected)} of the galaxy's worlds would have an independent origin.`}>
        {/* axis */}
        <line className="text-line" x1={X0} y1={AXIS_Y} x2={X1} y2={AXIS_Y} stroke="currentColor" strokeWidth={1} />
        {[-12, -9, -6, -3, 0].map((l) => (
          <g key={l}>
            <line className="text-line" x1={px(l)} y1={AXIS_Y} x2={px(l)} y2={AXIS_Y + 4} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={px(l)} y={AXIS_Y + 14} textAnchor="middle" fill="currentColor" fontSize={8}
              fontFamily="ui-sans-serif, system-ui, sans-serif">10^{l}</text>
          </g>
        ))}
        <text className="text-muted" x={(X0 + X1) / 2} y={AXIS_Y + 30} textAnchor="middle" fill="currentColor"
          fontSize={9.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">
          probability that life arises, per habitable world (log) ⟶ easier
        </text>
        <text className="text-faint" x={X0} y={AXIS_Y - 44} fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">HARD — a near-miracle</text>
        <text className="text-faint" x={X1} y={AXIS_Y - 44} textAnchor="end" fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">EASY — near-inevitable</text>

        {/* "we'd be alone" reference (expected ~ 1) */}
        <line className="text-faint" x1={px(Math.log10(ALONE_P))} y1={AXIS_Y - 36} x2={px(Math.log10(ALONE_P))} y2={AXIS_Y}
          stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-faint" x={px(Math.log10(ALONE_P))} y={AXIS_Y - 40} textAnchor="middle" fill="currentColor"
          fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">just Earth</text>

        {/* current marker */}
        <line className={teeming ? "text-purple" : "text-maroon"} x1={px(e)} y1={AXIS_Y - 30} x2={px(e)} y2={AXIS_Y}
          stroke="currentColor" strokeWidth={1.6} />
        <circle className={teeming ? "text-purple" : "text-maroon"} cx={px(e)} cy={AXIS_Y} r={5} fill="currentColor" />

        {/* readout */}
        <text className={teeming ? "text-purple" : "text-maroon"} x={(X0 + X1) / 2} y={30} textAnchor="middle"
          fill="currentColor" fontSize={13} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {fmt(expected)} worlds with an independent origin
        </text>
        <text className="text-muted" x={(X0 + X1) / 2} y={45} textAnchor="middle" fill="currentColor" fontSize={9}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          out of ~300 million habitable worlds in the Milky Way
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {teeming
          ? <><strong className="text-purple">A living galaxy</strong> — about {fmt(expected)} worlds come alive.</>
          : <><strong className="text-maroon">We may be alone</strong> — the expected count falls to about {fmt(expected)}.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>How easily life arises (per world)</span>
            <span className="tabular-nums">p = 10<sup>{e.toFixed(1)}</sup></span>
          </span>
          <input type="range" min={LOG_MIN} max={LOG_MAX} step={0.1} value={e}
            onChange={(ev) => setE(Number(ev.target.value))}
            aria-label="Log of the per-world probability that life arises" className="mt-1 w-full"
            style={{ accentColor: teeming ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        This one number decides whether the cosmos is crowded or empty. If the origin of life is <span className="text-purple">easy</span> — a near-inevitable chemistry wherever there is water, the right molecules, and energy — then essentially every suitable world comes alive, and the galaxy teems. If it is <span className="text-maroon">hard</span> — a fluke needing an impossibly specific conjunction — then even among hundreds of millions of habitable worlds almost none do, and we are alone. Slide across the axis and the expected number of living worlds swings by <em>orders of magnitude</em>. And here is the humbling part: Earth is a single success, one origin that we know happened — and a single success is consistent with the <em>entire</em> axis, from near-miracle to near-certainty. Like one coin flip landing heads, it proves the origin possible but not how probable. That is the N=1 problem, and the only way off the axis is to find a second, independent origin — anywhere.
      </figcaption>
    </figure>
  );
}
