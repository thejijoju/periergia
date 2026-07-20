"use client";

import { useState } from "react";

// An interactive interferometry-resolution explorer, embedded in an article via
// a fenced ```interferometrybaseline block (see Reader's `pre` override).
// Resolution is θ ≈ 1.22 λ/B, where for an interferometer B is the *baseline* —
// the separation of the dishes, not the size of any one. Slide the baseline from
// a single radio dish up to the diameter of the Earth and watch the resolution
// sharpen along the 1/B line, finally crossing below the ~42-µas shadow of M87's
// black hole — the feat that forced the Event Horizon Telescope to make the whole
// planet its aperture. Log-log axes. currentColor theming (light/dark); first
// render deterministic (Earth-sized baseline, the EHT).

const LAMBDA = 1.3e-3; // m, the EHT's observing wavelength
const EARTH_D = 1.27e7; // m, Earth's diameter
const M87_SHADOW = 42; // µas, angular size of M87*'s shadow
const RAD_TO_UAS = 206265 * 1e6;

// θ = 1.22 λ / B, returned in microarcseconds.
const thetaUas = (B: number) => (1.22 * LAMBDA / B) * RAD_TO_UAS;

const XLOG0 = 1, XLOG1 = Math.log10(EARTH_D); // 10 m … Earth diameter
const YLOG0 = 1, YLOG1 = 8; // 10 µas … 10^8 µas

const X0 = 48, X1 = 424, Y0 = 16, Y1 = 196;
const px = (B: number) => X0 + ((Math.log10(B) - XLOG0) / (XLOG1 - XLOG0)) * (X1 - X0);
const py = (uas: number) =>
  Y1 - ((Math.min(YLOG1, Math.max(YLOG0, Math.log10(uas))) - YLOG0) / (YLOG1 - YLOG0)) * (Y1 - Y0);

const PRESETS = [
  { label: "Single dish (10 m)", B: 10 },
  { label: "Continental (1,000 km)", B: 1e6 },
  { label: "Earth-sized · EHT", B: EARTH_D },
];

function linePath(): string {
  const N = 40;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const B = Math.pow(10, XLOG0 + (i / N) * (XLOG1 - XLOG0));
    d += `${i === 0 ? "M" : "L"}${px(B).toFixed(1)} ${py(thetaUas(B)).toFixed(1)}`;
  }
  return d;
}

function fmtTheta(uas: number): string {
  if (uas >= 1e6) return `${(uas / 1e6).toFixed(1)} arcsec`;
  if (uas >= 1e3) return `${(uas / 1e3).toFixed(1)} mas`;
  return `${Math.round(uas)} µas`;
}

function fmtB(B: number): string {
  if (B >= 1e6) return `${(B / 1e6).toLocaleString(undefined, { maximumFractionDigits: 0 })} × 10³ km`;
  if (B >= 1e3) return `${(B / 1e3).toFixed(0)} km`;
  return `${Math.round(B)} m`;
}

export function InterferometryBaseline() {
  const [logB, setLogB] = useState(Math.log10(EARTH_D));
  const B = Math.pow(10, logB);
  const theta = thetaUas(B);
  const resolves = theta <= M87_SHADOW;

  const DEC_X = [1, 3, 5, 7];
  const DEC_Y = [1, 3, 5, 7];

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A baseline of ${fmtB(B)} gives a resolution of ${fmtTheta(theta)}.`}>
        {/* gridlines */}
        <g className="text-line" stroke="currentColor" strokeWidth={0.6} opacity={0.5}>
          {DEC_X.map((l) => <line key={`x${l}`} x1={px(10 ** l)} y1={Y0} x2={px(10 ** l)} y2={Y1} />)}
          {DEC_Y.map((l) => <line key={`y${l}`} x1={X0} y1={py(10 ** l)} x2={X1} y2={py(10 ** l)} />)}
        </g>
        <g className="text-muted" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* M87 shadow target */}
        <line className="text-maroon" x1={X0} y1={py(M87_SHADOW)} x2={X1} y2={py(M87_SHADOW)}
          stroke="currentColor" strokeWidth={1.3} strokeDasharray="4 3" opacity={0.8} />
        <text className="text-maroon" x={X1 - 2} y={py(M87_SHADOW) - 4} textAnchor="end" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          M87* shadow ≈ 42 µas
        </text>

        {/* the 1.22 λ/B line */}
        <path className="text-purple" d={linePath()} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />

        {/* dot + guides */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(B)} y1={py(theta)} x2={px(B)} y2={Y1} />
          <line x1={X0} y1={py(theta)} x2={px(B)} y2={py(theta)} />
        </g>
        <circle className={resolves ? "text-purple" : "text-maroon"} cx={px(B)} cy={py(theta)} r={4.5}
          fill="currentColor" />

        {/* labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">baseline B (log) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            resolution (log) — finer ↓
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(10)} y={Y1 + 12} textAnchor="middle">10 m</text>
          <text x={px(1e3)} y={Y1 + 12} textAnchor="middle">1 km</text>
          <text x={px(1e6)} y={Y1 + 12} textAnchor="middle">1000 km</text>
          <text x={px(1e7)} y={Y1 + 12} textAnchor="middle">Earth</text>
          <text x={X0 - 4} y={py(1e2) + 3} textAnchor="end">100 µas</text>
          <text x={X0 - 4} y={py(1e5) + 3} textAnchor="end">0.1″</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Baseline <strong className="tabular-nums">{fmtB(B)}</strong> → resolution{" "}
        <span className={`font-semibold ${resolves ? "text-purple" : "text-maroon"}`}>{fmtTheta(theta)}</span>.{" "}
        {resolves
          ? <strong className="text-purple">Fine enough to resolve the black hole&rsquo;s shadow.</strong>
          : <>Still far too coarse for the 42-µas shadow — you need a bigger baseline.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Baseline (dish separation)</span><span className="tabular-nums">{fmtB(B)}</span>
          </span>
          <input type="range" min={XLOG0} max={XLOG1} step={0.01} value={logB}
            onChange={(e) => setLogB(Number(e.target.value))}
            aria-label="Baseline (log scale)" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {PRESETS.map((p) => (
            <button key={p.label} type="button" onClick={() => setLogB(Math.log10(p.B))}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
              {p.label}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Resolution is θ ≈ 1.22 λ/B — and for an interferometer B is the <em>separation</em> of the dishes, not the size of any one. So you sharpen the image not by building a bigger mirror but by spreading your telescopes farther apart. To resolve M87*&rsquo;s 42-µas shadow at 1.3 mm you would need a single dish 12,000 km across — impossible. The Event Horizon Telescope instead spread eight radio observatories across the planet and combined their light, synthesizing a virtual aperture the <span className="text-purple">size of the Earth</span> — just enough to cross the line and photograph a black hole. Note what it does <em>not</em> buy you: light-gathering, which is still only the sum of the real dishes. Interferometry sharpens; it does not deepen.
      </figcaption>
    </figure>
  );
}
