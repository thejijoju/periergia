"use client";

import { useState } from "react";

// An interactive risk-perception-gap explorer, embedded in an article via a
// fenced ```shuttlerisk block (see Reader's `pre` override). In his Challenger
// appendix, Feynman noted that NASA management put the odds of catastrophic
// Shuttle loss at ~1 in 100,000 per flight, while the engineers closest to the
// hardware put it at ~1 in 100 — a thousandfold gap. The actual record, 2 losses
// in 135 flights, is ~1 in 68: the engineers were nearly right, management wildly
// optimistic. Slide the program length and watch expected losses under each
// estimate against the real toll — the number gap made visible is the culture
// gap. Log-scale risk axis; currentColor theming; first render deterministic
// (the full 135-flight program).

const P_MGMT = 1 / 100000;
const P_ENG = 1 / 100;
const P_ACTUAL = 2 / 135; // ~1 in 68
const ACTUAL_LOSSES = 2;

const LOG_MIN = -6, LOG_MAX = -1; // per-flight risk, log10
const X0 = 30, X1 = 424, AXIS_Y = 150;
const px = (p: number) => {
  const l = Math.log10(p);
  return X0 + ((Math.min(LOG_MAX, Math.max(LOG_MIN, l)) - LOG_MIN) / (LOG_MAX - LOG_MIN)) * (X1 - X0);
};

const MARKS: { p: number; label: string; sub: string; cls: string }[] = [
  { p: P_MGMT, label: "management", sub: "1 in 100,000", cls: "text-purple" },
  { p: P_ENG, label: "engineers", sub: "1 in 100", cls: "text-ink" },
  { p: P_ACTUAL, label: "reality", sub: "2 in 135 ≈ 1 in 68", cls: "text-maroon" },
];

export function ShuttleRisk() {
  const [n, setN] = useState(135);
  const eMgmt = n * P_MGMT;
  const eEng = n * P_ENG;

  return (
    <figure className="sr-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Management estimated 1 in 100,000 per flight, engineers 1 in 100; the real rate was 2 in 135. Over ${n} flights, management expected ${eMgmt.toFixed(3)} losses, engineers ${eEng.toFixed(1)}.`}>
        {/* log axis */}
        <line className="text-line" x1={X0} y1={AXIS_Y} x2={X1} y2={AXIS_Y} stroke="currentColor" strokeWidth={1} />
        {[-6, -5, -4, -3, -2, -1].map((l) => {
          const x = px(Math.pow(10, l));
          return (
            <g key={l}>
              <line className="text-line" x1={x} y1={AXIS_Y} x2={x} y2={AXIS_Y + 4} stroke="currentColor" strokeWidth={1} />
              <text className="text-faint" x={x} y={AXIS_Y + 14} textAnchor="middle" fill="currentColor" fontSize={8}
                fontFamily="ui-sans-serif, system-ui, sans-serif">10^{l}</text>
            </g>
          );
        })}
        <text className="text-muted" x={(X0 + X1) / 2} y={AXIS_Y + 30} textAnchor="middle" fill="currentColor"
          fontSize={9.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">
          per-flight probability of catastrophic loss (log scale) ⟶ riskier
        </text>

        {/* the 1000x gap bracket between management and engineers */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} opacity={0.7}>
          <line x1={px(P_MGMT)} y1={54} x2={px(P_ENG)} y2={54} strokeDasharray="3 3" />
          <line x1={px(P_MGMT)} y1={50} x2={px(P_MGMT)} y2={58} />
          <line x1={px(P_ENG)} y1={50} x2={px(P_ENG)} y2={58} />
        </g>
        <text className="text-faint" x={(px(P_MGMT) + px(P_ENG)) / 2} y={46} textAnchor="middle" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          a 1,000× gap in belief
        </text>

        {/* markers */}
        {MARKS.map((m) => (
          <g key={m.label} className={m.cls}>
            <line x1={px(m.p)} y1={72} x2={px(m.p)} y2={AXIS_Y} stroke="currentColor" strokeWidth={1.4}
              strokeDasharray="2 2" opacity={0.6} />
            <circle cx={px(m.p)} cy={AXIS_Y} r={5} fill="currentColor" />
            <text x={px(m.p)} y={86} textAnchor="middle" fill="currentColor" fontSize={9.5} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{m.label}</text>
            <text x={px(m.p)} y={98} textAnchor="middle" fill="currentColor" fontSize={8}
              fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>{m.sub}</text>
          </g>
        ))}

        {/* expected-losses readout over n flights */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-ink" x={X0} y={196} fill="currentColor" fontSize={11} fontWeight={700}>
            Over {n} flights, expected catastrophic losses:
          </text>
          <text className="text-purple" x={X0} y={212} fill="currentColor" fontSize={10} fontWeight={600}>
            management ≈ {eMgmt < 0.01 ? eMgmt.toFixed(4) : eMgmt.toFixed(2)}
          </text>
          <text className="text-ink" x={X0 + 150} y={212} fill="currentColor" fontSize={10} fontWeight={600}>
            engineers ≈ {eEng.toFixed(1)}
          </text>
          <text className="text-maroon" x={X0 + 280} y={212} fill="currentColor" fontSize={10} fontWeight={700}>
            reality: {ACTUAL_LOSSES}
          </text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Over <strong className="tabular-nums">{n}</strong> flights, management&rsquo;s odds predict{" "}
        <span className="text-purple font-semibold">{eMgmt < 0.01 ? "essentially zero" : eMgmt.toFixed(2)}</span> losses;
        the engineers predict <span className="font-semibold">{eEng.toFixed(1)}</span>.{" "}
        <strong className="text-maroon">The real toll was {ACTUAL_LOSSES}</strong> — the engineers had it nearly right.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Program length</span><span className="tabular-nums">{n} flights</span>
          </span>
          <input type="range" min={10} max={400} step={5} value={n}
            onChange={(e) => setN(Number(e.target.value))}
            aria-label="Number of flights in the program" className="mt-1 w-full"
            style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setN(135)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            The real Shuttle program (135)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Feynman ended his Challenger appendix with a number that is really a diagnosis. NASA management put the chance of losing a Shuttle at about <span className="text-purple">1 in 100,000</span> per flight; the engineers who built and watched the hardware put it near <span className="text-ink">1 in 100</span> — a thousandfold disagreement about the very same vehicle. The record settled it: two losses in 135 flights, about <span className="text-maroon">1 in 68</span>, so the engineers were off by less than a factor of two while management was off by more than a thousand. An organization whose leadership believes its machine is a thousand times safer than its own engineers do will systematically under-weight every warning, tolerate every deviation, and be genuinely shocked by the disaster the engineers saw coming. The gap in the numbers <em>is</em> the gap in the culture, made measurable — and honesty about the real odds, Feynman argued, is the first discipline of managing a danger you cannot eliminate.
      </figcaption>
    </figure>
  );
}
