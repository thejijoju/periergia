"use client";

import { useState } from "react";

// An interactive of the lunar isotopic crisis, embedded via a fenced ```isotopecrisis block
// (see Reader's `pre` override). Oxygen-isotope anomaly (Δ¹⁷O, per mil) is a fingerprint of
// where in the disk a body formed — and it works: Mars, Vesta, and the chondrite groups sit
// at clearly distinct values. The giant impact predicts the Moon is mostly Theia, a body that
// formed elsewhere, so it should sit away from Earth like the others. Drag the "fraction that
// is Theia" slider to see where the canonical model puts the Moon. Then look at where the Moon
// actually is: on Earth, to within 5 parts per million. That gap is the crisis.
//
// Δ¹⁷O values are baked literals (measured anomalies, per mil); every pixel coordinate is a
// pure linear map (multiply/add/divide only), so SSR and client render identically.

type B = { name: string; d17: number; up: boolean }; // up = label above the axis
const BODIES: B[] = [
  { name: "ordinary chondrites", d17: 0.73, up: true },
  { name: "Mars (from meteorites)", d17: 0.32, up: false },
  { name: "Earth", d17: 0.0, up: false },
  { name: "Vesta", d17: -0.24, up: true },
];
const THEIA_LIKE = 0.32; // assume Theia's fingerprint resembles Mars's — "formed elsewhere"

const DMIN = -0.45, DMAX = 0.85;
const AX0 = 40, AX1 = 410, AXY = 132;
const r1 = (n: number) => Math.round(n * 10) / 10;
const xOf = (d: number) => r1(AX0 + ((d - DMIN) / (DMAX - DMIN)) * (AX1 - AX0));

export function IsotopeCrisis() {
  const [frac, setFrac] = useState(0.8); // fraction of the Moon that is Theia (canonical: 0.7–0.9)
  const predicted = r1(frac * THEIA_LIKE * 100) / 100; // predicted lunar Δ¹⁷O if mostly Theia
  const xPred = xOf(predicted);
  const xEarth = xOf(0);

  return (
    <figure className="isocrisis-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 226" className="w-full h-auto" role="img"
        aria-label="Oxygen-isotope fingerprints: Mars, Vesta, and the chondrites sit at distinct Δ17O values, proving the fingerprint identifies where a body formed. The giant impact predicts the Moon is mostly Theia and should sit away from Earth, but the measured Moon lies on Earth to within five parts per million — the isotopic crisis.">

        {/* axis */}
        <line x1={AX0} y1={AXY} x2={AX1} y2={AXY} className="text-line" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        {[-0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8].map((t) => (
          <g key={t}>
            <line x1={xOf(t)} y1={AXY - 3} x2={xOf(t)} y2={AXY + 3} className="text-line" stroke="currentColor" strokeWidth={0.6} opacity={0.6} />
            <text className="text-faint" x={xOf(t)} y={AXY + 13} textAnchor="middle" fill="currentColor" fontSize={6}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{t}</text>
          </g>
        ))}
        <text className="text-faint" x={AX1} y={AXY + 22} textAnchor="end" fill="currentColor" fontSize={6.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Δ¹⁷O (‰) — a fingerprint of where a body formed →</text>
        <text className="text-faint" x={AX0 - 4} y={AXY + 22} textAnchor="start" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">← carbonaceous chondrites (−1 to −4)</text>

        {/* known bodies */}
        {BODIES.map((b) => {
          const x = xOf(b.d17);
          const isEarth = b.name === "Earth";
          const ly = b.up ? AXY - 8 : AXY + 30;
          return (
            <g key={b.name}>
              <circle cx={x} cy={AXY} r={isEarth ? 3.4 : 2.6} className={isEarth ? "text-ink" : "text-muted"} fill="currentColor" />
              <line x1={x} y1={AXY} x2={x} y2={b.up ? AXY - 6 : AXY + 6} className="text-faint" stroke="currentColor" strokeWidth={0.5} opacity={0.6} />
              <text x={x} y={ly} textAnchor="middle" className={isEarth ? "text-ink" : "text-muted"} fill="currentColor"
                fontSize={isEarth ? 7.5 : 6.6} fontWeight={isEarth ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{b.name}</text>
            </g>
          );
        })}

        {/* the observed Moon: sitting on Earth, ±5 ppm */}
        <circle cx={xEarth} cy={AXY} r={5.4} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.3} />
        <text x={xEarth} y={AXY - 22} textAnchor="middle" className="text-maroon" fill="currentColor" fontSize={7.5} fontWeight={800}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Moon (measured)</text>
        <line x1={xEarth} y1={AXY - 19} x2={xEarth} y2={AXY - 6} className="text-maroon" stroke="currentColor" strokeWidth={0.6} opacity={0.7} />
        <text x={xEarth} y={AXY - 31} textAnchor="middle" className="text-maroon" fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">on Earth, to ±5 ppm</text>

        {/* the predicted Moon: where the canonical impact puts it */}
        <line x1={xPred} y1={AXY} x2={xPred} y2={AXY - 52} className="text-ink" stroke="currentColor" strokeWidth={0.7} strokeDasharray="3 3" opacity={0.55} />
        <path d={`M${xPred} ${AXY} m-4,-4 l8,8 m0,-8 l-8,8`} className="text-ink" stroke="currentColor" strokeWidth={1.3} opacity={0.85} />
        <text x={xPred} y={AXY - 56} textAnchor="middle" className="text-ink" fill="currentColor" fontSize={6.6} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">impact predicts the Moon here</text>

        {/* the gap = the crisis */}
        {xPred - xEarth > 8 && (
          <>
            <line x1={xEarth + 6} y1={AXY + 46} x2={xPred} y2={AXY + 46} className="text-maroon" stroke="currentColor" strokeWidth={0.8} opacity={0.7} />
            <text x={r1((xEarth + xPred) / 2)} y={AXY + 43} textAnchor="middle" className="text-maroon" fill="currentColor" fontSize={6.5} fontWeight={700}
              fontFamily="ui-sans-serif, system-ui, sans-serif">the crisis: predicted ≠ observed</text>
          </>
        )}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Canonical simulations build the Moon from <strong>{Math.round(frac * 100)}%</strong> Theia, so — if Theia formed elsewhere — the Moon should sit near <strong>Δ¹⁷O ≈ {predicted.toFixed(2)}‰</strong>, out by <strong>{Math.round(predicted * 1000)} ppm</strong>, as far from Earth as Mars is. Instead the Moon is measured <strong className="text-maroon">on Earth, within 5 ppm.</strong>
      </p>

      <div className="mt-4">
        <input type="range" min={0.5} max={0.9} step={0.05} value={frac}
          onChange={(e) => setFrac(Number(e.target.value))}
          className="w-full accent-maroon" aria-label="Fraction of the Moon made from Theia" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>50% Theia</span><span>the Moon is mostly the impactor →</span><span>90% Theia</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The ratios of oxygen&rsquo;s three isotopes vary systematically with where in the disk a body formed, and they survive melting and differentiation unchanged — so Δ¹⁷O is a durable <strong>fingerprint of origin</strong>. It plainly works: meteorites from Mars, from Vesta, and the ordinary and carbonaceous chondrite groups each occupy their own distinct value, and no two overlap. The canonical giant impact builds the Moon mostly from Theia, a body that accreted somewhere else, so the Moon should carry Theia&rsquo;s fingerprint and sit clearly off Earth&rsquo;s — the diamond above. It does not. Oxygen matches Earth to about <strong>five parts per million</strong>, and titanium, chromium, silicon, and tungsten match too: by every isotopic test, <strong>the Moon is made of Earth.</strong> This is the third time in this unit a well-supported theory has failed on the measurement that should have been easiest — after the metre-size barrier and Mercury&rsquo;s volatiles. The escapes under study — Theia forming at Earth&rsquo;s own orbital radius, the debris disk equilibrating with Earth before the Moon condensed, or a far more violent impact that vaporised both worlds into a single well-mixed <em>synestia</em> — all try to erase the fingerprint the model predicts. The impact framework survives; the specific scenario is being rewritten, and this measurement is what is driving it.
      </figcaption>
    </figure>
  );
}
