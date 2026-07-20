"use client";

import { useState } from "react";

// An interactive normalization-of-deviance explorer, embedded in an article via a
// fenced ```normalizeddeviance block (see Reader's `pre` override). A known flaw
// — O-ring erosion, foam shedding — carries a real, roughly constant danger. But
// each flight that survives it lets the organization quietly reclassify what it
// just got away with as "acceptable," ratcheting the accepted-risk line upward
// toward the true failure level, one lucky success at a time, until the safety
// margin is gone and the next bad day is the catastrophe. Slide the number of
// successful flights and watch the margin close. This is an illustrative model of
// a cultural process, not a fit to data. currentColor theming; first render
// deterministic (a dozen flights in).

const N_MAX = 24;
const FAIL = 1.0; // the true level at which the flaw fails catastrophically
const START = 0.15; // where "acceptable" begins
const K = 0.16; // how fast each success loosens the standard

// Accepted-as-normal risk after n successful flights: ratchets up toward FAIL.
const accepted = (n: number) => FAIL * (1 - (1 - START) * Math.exp(-K * n));

const X0 = 44, X1 = 424, Y0 = 20, Y1 = 188;
const px = (n: number) => X0 + (n / N_MAX) * (X1 - X0);
const py = (r: number) => Y1 - (r / 1.15) * (Y1 - Y0);

function acceptedPath(upto: number): string {
  const N = 80;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const n = (i / N) * upto;
    d += `${i === 0 ? "M" : "L"}${px(n).toFixed(1)} ${py(accepted(n)).toFixed(1)}`;
  }
  return d;
}

export function NormalizedDeviance() {
  const [n, setN] = useState(12);
  const acc = accepted(n);
  const margin = (FAIL - acc) * 100; // percentage points of headroom left
  const danger = margin < 15;

  return (
    <figure className="nd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`After ${n} successful flights, the organization treats risk up to ${Math.round(acc * 100)}% of the failure level as normal, leaving a ${Math.round(margin)}% safety margin.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* catastrophic-failure line */}
        <line className="text-maroon" x1={X0} y1={py(FAIL)} x2={X1} y2={py(FAIL)} stroke="currentColor"
          strokeWidth={1.4} strokeDasharray="5 3" opacity={0.85} />
        <text className="text-maroon" x={X1 - 2} y={py(FAIL) - 5} textAnchor="end" fill="currentColor" fontSize={9}
          fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">catastrophic failure</text>

        {/* shrinking safety-margin band */}
        <rect className={danger ? "text-maroon" : "text-purple"} x={px(n) - 1} y={py(FAIL)} width={2}
          height={py(acc) - py(FAIL)} fill="currentColor" opacity={0.5} />

        {/* the ratcheting accepted-as-normal curve */}
        <path className="text-ink" d={acceptedPath(n)} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />
        {/* faint continuation showing where it is heading */}
        <path className="text-faint" d={acceptedPath(N_MAX)} fill="none" stroke="currentColor" strokeWidth={1.2}
          strokeDasharray="3 3" opacity={0.5} />

        <circle className={danger ? "text-maroon" : "text-ink"} cx={px(n)} cy={py(acc)} r={4.5} fill="currentColor" />
        <text className="text-muted" x={px(n)} y={py(acc) - 8} textAnchor="middle" fill="currentColor" fontSize={8.5}
          fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">&ldquo;acceptable&rdquo;</text>

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={Y1 + 26} textAnchor="middle">successful flights (each one loosens the standard) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            risk treated as normal
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(8)} y={Y1 + 12} textAnchor="middle">8</text>
          <text x={px(16)} y={Y1 + 12} textAnchor="middle">16</text>
          <text x={px(24)} y={Y1 + 12} textAnchor="middle">24</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        After <strong className="tabular-nums">{n}</strong> flights that got away with it, the flaw is treated as{" "}
        <span className="font-semibold">{Math.round(acc * 100)}%</span> of the way to &ldquo;normal&rdquo; —{" "}
        {danger
          ? <strong className="text-maroon">margin nearly gone; one bad day is the disaster.</strong>
          : <>a <span className="text-purple font-semibold">{Math.round(margin)}%</span> safety margin still stands.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Flights survived with the flaw present</span><span className="tabular-nums">{n}</span>
          </span>
          <input type="range" min={0} max={N_MAX} step={1} value={n}
            onChange={(e) => setN(Number(e.target.value))}
            aria-label="Number of successful flights with the flaw present" className="mt-1 w-full"
            style={{ accentColor: danger ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The real danger of a known flaw — the erosion that could breach an O-ring joint, the foam that could hole a wing — barely changes from flight to flight. What changes is the <em>organization&rsquo;s</em> sense of what is acceptable. Each flight that survives the flaw is read not as luck but as proof that the deviation was fine all along, so the line marked &ldquo;normal&rdquo; ratchets upward to include whatever was just survived. No single step looks reckless; each is defended with data (&ldquo;we&rsquo;ve flown with this erosion five times and been fine&rdquo;). But the accepted level climbs toward the true failure level, the safety margin quietly closes, and a condition once recognized as <span className="text-maroon">dangerous</span> is redefined as routine — until the cold morning, or the bad strike, when the luck runs out. The disaster is not a bolt from the blue; the organization had been walking toward it for years, one normalized deviation at a time. Resisting the drift means the unnatural discipline of treating the flaw as dangerous <em>even though you keep getting away with it.</em>
      </figcaption>
    </figure>
  );
}
