"use client";

import { useState } from "react";

// An interactive shielding-paradox explorer, embedded in an article via a fenced
// ```shieldingparadox block (see Reader's `pre` override). For solar protons,
// more shielding always means less dose. But for galactic cosmic rays, a
// high-energy nucleus striking the shield shatters into a spallation shower of
// secondaries, so a *little* shielding makes the dose WORSE before it gets
// better — and heavy materials (aluminium, lead) shatter more than light,
// hydrogen-rich ones (polyethylene, water). Toggle the threat and the material
// and slide the thickness to see the dose rise past 100% of unshielded before it
// falls. currentColor theming (light/dark); first render deterministic (GCR,
// heavy shield — the worst case).

const X_MAX = 40; // g/cm² of shielding
const Y_MAX = 1.6; // relative dose (unshielded GCR = 1.0)

const X0 = 46, X1 = 424, Y0 = 16, Y1 = 196;
const px = (x: number) => X0 + (x / X_MAX) * (X1 - X0);
const py = (d: number) => Y1 - Math.min(1, d / Y_MAX) * (Y1 - Y0);

// GCR relative dose: (1 + k1·x)·e^(−k2·x) — rises then falls (secondary shower
// builds up, then is finally absorbed). Heavy shields shatter more (bigger k1).
const gcrDose = (x: number, heavy: boolean) => {
  const k1 = heavy ? 0.22 : 0.08;
  const k2 = heavy ? 0.03 : 0.05;
  return (1 + k1 * x) * Math.exp(-k2 * x);
};
// SPE (solar proton) relative dose: monotonic fall — protons are simply stopped.
const speDose = (x: number) => Math.exp(-x / 2.5);

function curvePath(fn: (x: number) => number): string {
  const N = 120;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const x = (i / N) * X_MAX;
    d += `${i === 0 ? "M" : "L"}${px(x).toFixed(1)} ${py(fn(x)).toFixed(1)}`;
  }
  return d;
}

export function ShieldingParadox() {
  const [threat, setThreat] = useState<"gcr" | "spe">("gcr");
  const [heavy, setHeavy] = useState(true);
  const [x, setX] = useState(7);
  const dose = threat === "gcr" ? gcrDose(x, heavy) : speDose(x);
  const worse = threat === "gcr" && dose > 1;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With ${x} g/cm² of ${heavy ? "heavy" : "light"} shielding, the ${threat.toUpperCase()} dose is ${Math.round(dose * 100)}% of unshielded.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* the "unshielded" reference at 100% */}
        <line className="text-faint" x1={X0} y1={py(1)} x2={X1} y2={py(1)} stroke="currentColor"
          strokeWidth={1} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-faint" x={X1 - 2} y={py(1) - 4} textAnchor="end" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">no shield</text>

        {/* faint alternative curve for context */}
        {threat === "gcr" && (
          <path className="text-faint" d={curvePath((v) => gcrDose(v, !heavy))} fill="none" stroke="currentColor"
            strokeWidth={1.2} opacity={0.45} strokeDasharray="4 3" />
        )}

        {/* active curve */}
        <path className={threat === "gcr" ? "text-maroon" : "text-purple"}
          d={curvePath(threat === "gcr" ? (v) => gcrDose(v, heavy) : speDose)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* dot */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(x)} y1={py(dose)} x2={px(x)} y2={Y1} />
          <line x1={X0} y1={py(dose)} x2={px(x)} y2={py(dose)} />
        </g>
        <circle className={worse ? "text-maroon" : "text-ink"} cx={px(x)} cy={py(dose)} r={4.5} fill="currentColor" />

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">shielding thickness (g/cm²) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            dose vs unshielded
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(10)} y={Y1 + 12} textAnchor="middle">10</text>
          <text x={px(20)} y={Y1 + 12} textAnchor="middle">20</text>
          <text x={px(30)} y={Y1 + 12} textAnchor="middle">30</text>
          <text x={X0 - 4} y={py(1) + 3} textAnchor="end">100%</text>
          <text x={X0 - 4} y={py(0.5) + 3} textAnchor="end">50%</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {x} g/cm² of <strong>{heavy ? "heavy" : "light"}</strong> shielding →{" "}
        <span className={`font-semibold ${worse ? "text-maroon" : threat === "gcr" ? "text-maroon" : "text-purple"}`}>
          {Math.round(dose * 100)}%
        </span>{" "}
        of the unshielded dose.{" "}
        {threat === "spe"
          ? <>Solar protons are simply stopped — more is always better.</>
          : worse
          ? <strong className="text-maroon">Worse than no shield at all: the nuclei have shattered into a secondary shower.</strong>
          : <>You&rsquo;ve finally passed the peak — but look how much material that took.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Shielding thickness</span><span className="tabular-nums">{x} g/cm²</span>
          </span>
          <input type="range" min={0} max={X_MAX} step={1} value={x}
            onChange={(e) => setX(Number(e.target.value))}
            aria-label="Shielding thickness" className="mt-1 w-full"
            style={{ accentColor: threat === "gcr" ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setThreat("gcr")} aria-pressed={threat === "gcr"}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${threat === "gcr" ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            Galactic cosmic rays
          </button>
          <button type="button" onClick={() => setThreat("spe")} aria-pressed={threat === "spe"}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${threat === "spe" ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            Solar storm
          </button>
          {threat === "gcr" && (
            <>
              <button type="button" onClick={() => setHeavy(false)} aria-pressed={!heavy}
                className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${!heavy ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
                Light (polyethylene)
              </button>
              <button type="button" onClick={() => setHeavy(true)} aria-pressed={heavy}
                className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${heavy ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
                Heavy (aluminium)
              </button>
            </>
          )}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        For a <span className="text-purple">solar storm</span>, shielding behaves the way intuition expects: the protons are moderate-energy and a few centimetres of polyethylene or stacked food simply stops them, so more is always safer — which is why a storm shelter works. For <span className="text-maroon">galactic cosmic rays</span> the intuition inverts. A GeV iron nucleus doesn&rsquo;t stop in a thin shield; it <em>shatters</em> it (spallation), turning one particle into a shower of secondary neutrons and fragments — so a little shielding drives the dose <em>above</em> unshielded before enormous thickness finally brings it down. And heavy materials shatter more than light ones, so hydrogen-rich polyethylene beats aluminium, and aluminium beats lead — the opposite of the rule for X-rays. There is no affordable amount of shield that wins against the galactic bombardment; the moderate middle is the worst place to be.
      </figcaption>
    </figure>
  );
}
