"use client";

import { useState } from "react";

// An interactive "electromagnetic spectrum as a thermometer of violence"
// diagram, embedded in an article via a fenced ```blackbody block (see Reader's
// `pre` override). A peak-normalized Planck (blackbody) curve slides across the
// spectrum as the temperature changes: cool objects (thousands of K) peak in
// the optical — gentle starlight; million-degree matter peaks in the X-ray —
// the signature of violence. Wien's law λ_peak = b/T sets the peak; the readout
// names the band and the photon energy. Themed by `currentColor` on Tailwind
// text-* groups so it re-themes in light and dark. First render is deterministic
// (the Sun, 5,800 K) so SSR and the first client paint agree.

const B_WIEN = 2.898e-3; // m·K, Wien displacement constant
const C2 = 1.4388e-2; // m·K, second radiation constant (hc/k)
const HC = 1.986e-25; // J·m (h·c), for photon energy E = hc/λ
const EV = 1.602e-19; // J per eV

// Plot window in wavelength (m), log scale: 1 mm (left) down to 1 pm (right),
// so energy increases to the RIGHT. Spans IR → visible → UV → X-ray → gamma.
const LAM_L = 1e-3;
const LAM_R = 1e-12;
const LOG_L = Math.log10(LAM_L);
const LOG_R = Math.log10(LAM_R);

const X0 = 40;
const X1 = 424;
const Y0 = 14;
const Y1 = 210;

const px = (lam: number) => X0 + ((Math.log10(lam) - LOG_L) / (LOG_R - LOG_L)) * (X1 - X0);
const py = (frac: number) => Y1 - Math.max(0, Math.min(1, frac)) * (Y1 - Y0);

// Spectrum bands (wavelength edges in m), left→right = long→short = cool→hot.
const BANDS = [
  { name: "Infrared", lo: 1e-3, hi: 7.5e-7, cls: "text-faint", fill: 0.05 },
  { name: "Visible", lo: 7.5e-7, hi: 3.8e-7, cls: "text-purple", fill: 0.14 },
  { name: "UV", lo: 3.8e-7, hi: 1e-8, cls: "text-faint", fill: 0.05 },
  { name: "X-ray", lo: 1e-8, hi: 1e-11, cls: "text-maroon", fill: 0.13 },
  { name: "Gamma", lo: 1e-11, hi: 1e-12, cls: "text-maroon", fill: 0.22 },
];

// Peak-normalized Planck curve B_λ ∝ λ⁻⁵ / (exp(c₂/λT) − 1), sampled across the
// log-wavelength window and scaled to its own maximum so it always fits.
function planckPath(T: number): string {
  const N = 160;
  const xs: number[] = [];
  const bs: number[] = [];
  let bmax = 0;
  for (let i = 0; i <= N; i++) {
    const logLam = LOG_L + (i / N) * (LOG_R - LOG_L);
    const lam = Math.pow(10, logLam);
    const x = C2 / (lam * T);
    // exp overflow → Infinity → B = 0 (handled); underflow fine.
    const denom = Math.exp(x) - 1;
    const b = denom > 0 && Number.isFinite(denom) ? Math.pow(lam, -5) / denom : 0;
    xs.push(px(lam));
    bs.push(b);
    if (b > bmax) bmax = b;
  }
  if (bmax <= 0) return "";
  let d = "";
  for (let i = 0; i <= N; i++) {
    d += `${i === 0 ? "M" : "L"}${xs[i].toFixed(1)} ${py(bs[i] / bmax).toFixed(1)}`;
  }
  return d;
}

const PRESETS = [
  { label: "Sun", T: 5800 },
  { label: "O-star", T: 40000 },
  { label: "SN gas", T: 3e6 },
  { label: "Accretion disk", T: 2e7 },
];

function bandOf(lam: number): string {
  for (const b of BANDS) if (lam <= b.lo && lam > b.hi) return b.name;
  return lam > 1e-3 ? "Radio" : "Gamma";
}

function fmtT(T: number): string {
  if (T >= 1e6) return `${(T / 1e6).toFixed(T >= 1e7 ? 0 : 1)} million K`;
  if (T >= 1e4) return `${Math.round(T / 1000)},000 K`;
  return `${Math.round(T / 100) * 100} K`;
}

function fmtEnergy(eV: number): string {
  if (eV >= 1000) return `${(eV / 1000).toFixed(1)} keV`;
  if (eV >= 1) return `${eV.toFixed(1)} eV`;
  return `${eV.toFixed(2)} eV`;
}

function fmtLam(lam: number): string {
  const nm = lam * 1e9;
  if (nm >= 1000) return `${(nm / 1000).toFixed(1)} µm`;
  if (nm >= 1) return `${nm.toFixed(nm < 10 ? 2 : 0)} nm`;
  return `${(nm * 1000).toFixed(1)} pm`;
}

export function BlackbodyChart() {
  // Slider is log₁₀(T): 3.4 (~2,500 K) to 8 (10⁸ K).
  const [logT, setLogT] = useState(Math.log10(5800));
  const T = Math.pow(10, logT);
  const lamPeak = B_WIEN / T;
  const ePeak = HC / lamPeak / EV; // eV
  const band = bandOf(lamPeak);
  const violent = band === "X-ray" || band === "Gamma";
  const curveCls = violent ? "text-maroon" : band === "Visible" ? "text-purple" : "text-ink";
  const peakX = px(lamPeak);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A blackbody at ${fmtT(T)} peaks in the ${band} at ${fmtLam(lamPeak)}.`}>
        {/* Spectrum bands */}
        {BANDS.map((b) => {
          const x = px(b.lo);
          const w = px(b.hi) - px(b.lo);
          const mid = x + w / 2;
          return (
            <g key={b.name}>
              <rect className={b.cls} x={x} y={Y0} width={w} height={Y1 - Y0}
                fill="currentColor" opacity={b.fill} />
              <text className="text-faint" x={mid} y={Y0 + 11} textAnchor="middle"
                fill="currentColor" fontSize={8.5} fontFamily="ui-sans-serif, system-ui, sans-serif">
                {w > 26 ? b.name : ""}
              </text>
            </g>
          );
        })}
        {/* Axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
        </g>
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={244} textAnchor="middle">
            wavelength ⟵ longer · shorter ⟶ (higher energy)
          </text>
        </g>

        {/* The Planck curve */}
        <path className={curveCls} d={planckPath(T)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />

        {/* Wien peak marker */}
        <line className={curveCls} x1={peakX} y1={Y0} x2={peakX} y2={Y1}
          stroke="currentColor" strokeWidth={1.2} strokeDasharray="3 3" opacity={0.7} />
        <circle className={curveCls} cx={peakX} cy={py(1)} r={3.4} fill="currentColor" />
        <text className={curveCls} x={Math.min(peakX + 6, X1 - 60)} y={py(1) + 3}
          fill="currentColor" fontSize={10.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          {fmtLam(lamPeak)}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong>{fmtT(T)}</strong> the peak lands in the{" "}
        <span className={`font-semibold ${violent ? "text-maroon" : band === "Visible" ? "text-purple" : "text-ink"}`}>
          {band}
        </span>{" "}
        ({fmtEnergy(ePeak)} photons) —{" "}
        {violent ? (
          <strong className="text-maroon">the light of matter at millions of degrees: violence.</strong>
        ) : band === "Visible" ? (
          <>gentle starlight, the band our eyes evolved to see.</>
        ) : (
          <>still the calm thermal glow of ordinary matter.</>
        )}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Temperature</span>
            <span className="tabular-nums">{fmtT(T)}</span>
          </span>
          <input type="range" min={3.4} max={8} step={0.01} value={logT}
            onChange={(e) => setLogT(Number(e.target.value))}
            aria-label="Blackbody temperature (log scale)"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {PRESETS.map((p) => (
            <button key={p.label} type="button" onClick={() => setLogT(Math.log10(p.T))}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
              {p.label} · {fmtT(p.T)}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Wien&rsquo;s law, λ<sub>peak</sub> = b/T: raise the temperature and the whole blackbody curve slides toward shorter wavelengths and higher photon energies. The Sun (5,800 K) peaks in the visible — which is why we see it. To peak in the <span className="text-maroon">X-ray</span> you need <strong>millions of degrees</strong>, a temperature that occurs only where matter is falling into a compact object or being shock-heated by an explosion. High-energy light is a receipt for violence.
      </figcaption>
    </figure>
  );
}
