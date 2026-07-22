"use client";

import { useState } from "react";

// An interactive Doppler-shift explorer, embedded via a fenced ```dopplershift block
// (see Reader's `pre` override). The spectral lines don't just name the elements — their
// POSITIONS clock the motion of the source. If a star moves toward us, every line in its
// spectrum shifts to shorter (bluer) wavelengths; away, to longer (redder) — by
// Δλ/λ = v/c. Slide the velocity and watch hydrogen's Balmer lines glide across the
// rainbow away from their rest positions (faint ticks). At the speeds of receding
// galaxies the shift is dramatic — this is the measurement that revealed the expanding
// universe. Spectrum band uses real fixed colors (a rainbow is physical); chrome uses
// currentColor. First render deterministic (a receding galaxy).

const L0 = 390, L1 = 700; // nm
const X0 = 24, X1 = 416, BY = 66, BH = 66;
const C = 299792; // km/s
const H_LINES = [656.3, 486.1, 434.0, 410.2]; // hydrogen's Balmer lines, rest nm
const xOf = (nm: number) => X0 + ((nm - L0) / (L1 - L0)) * (X1 - X0);
const r2 = (n: number) => Math.round(n * 100) / 100;

export function DopplerShift() {
  const [v, setV] = useState(15000); // km/s; + receding, − approaching

  const factor = 1 + v / C;
  const shifted = H_LINES.map((nm) => nm * factor);
  const red = v > 0;
  const dHalpha = 656.3 * (factor - 1);

  return (
    <figure className="doppler-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 200" className="w-full h-auto" role="img"
        aria-label={`At ${Math.abs(v).toLocaleString("en-US")} km/s ${red ? "receding, the hydrogen lines are redshifted" : v < 0 ? "approaching, the hydrogen lines are blueshifted" : "at rest, the lines sit at their laboratory positions"}.`}>
        <defs>
          <linearGradient id="dopRainbow" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#6d28d9" />
            <stop offset="16%" stopColor="#3b82f6" />
            <stop offset="34%" stopColor="#06b6d4" />
            <stop offset="48%" stopColor="#22c55e" />
            <stop offset="62%" stopColor="#eab308" />
            <stop offset="76%" stopColor="#f97316" />
            <stop offset="100%" stopColor="#dc2626" />
          </linearGradient>
        </defs>

        <text className="text-muted" x={(X0 + X1) / 2} y={30} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          hydrogen&rsquo;s absorption lines in the light of a {v === 0 ? "source at rest" : red ? "receding source" : "approaching source"}
        </text>

        {/* the spectrum band with shifted absorption lines */}
        <rect x={X0} y={BY} width={X1 - X0} height={BH} fill="url(#dopRainbow)" rx={3} />
        {shifted.map((nm, i) => (nm > L0 && nm < L1 ? (
          <rect key={i} x={r2(xOf(nm) - 1.3)} y={BY} width={2.6} height={BH} fill="#0b0b10" />
        ) : null))}
        <rect x={X0} y={BY} width={X1 - X0} height={BH} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.8} rx={3} opacity={0.6} />

        {/* rest positions as faint ticks above the band */}
        {H_LINES.map((nm) => (
          <g key={nm}>
            <line className="text-faint" x1={r2(xOf(nm))} y1={BY - 10} x2={r2(xOf(nm))} y2={BY - 2} stroke="currentColor" strokeWidth={1} strokeDasharray="2 1.5" opacity={0.8} />
          </g>
        ))}
        <text className="text-faint" x={r2(xOf(H_LINES[0]))} y={BY - 14} textAnchor="middle" fill="currentColor" fontSize={6.2} fontFamily="ui-sans-serif, system-ui, sans-serif">rest positions</text>

        {/* shift arrows for Hα */}
        {v !== 0 && shifted[0] > L0 && shifted[0] < L1 && (
          <g className={red ? "text-maroon" : "text-purple"}>
            <line x1={r2(xOf(656.3))} y1={BY + BH + 10} x2={r2(xOf(shifted[0]))} y2={BY + BH + 10} stroke="currentColor" strokeWidth={1.3} />
            <path d={`M${r2(xOf(shifted[0]))} ${BY + BH + 10} l${red ? -5 : 5} -3 v6 z`} fill="currentColor" />
          </g>
        )}

        {/* wavelength axis */}
        {[400, 500, 600, 700].map((nm) => (
          <text key={nm} className="text-faint" x={r2(xOf(nm))} y={BY + BH + 24} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{nm} nm</text>
        ))}

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className={v === 0 ? "text-muted" : red ? "text-maroon" : "text-purple"} x={(X0 + X1) / 2} y={BY + BH + 48} textAnchor="middle" fill="currentColor" fontSize={11} fontWeight={800}>
            {v === 0 ? "at rest — lines at laboratory wavelengths" : red ? "REDSHIFT — moving away" : "BLUESHIFT — moving toward us"}
          </text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {v === 0
          ? <>Every line sits exactly at its rest wavelength — the source is not moving along our line of sight.</>
          : <>At <strong>{Math.abs(v).toLocaleString("en-US")} km/s</strong> {red ? "away" : "toward us"}, hydrogen&rsquo;s 656.3 nm line lands at <strong className={red ? "text-maroon" : "text-purple"}>{(656.3 * factor).toFixed(1)} nm</strong> — shifted by {Math.abs(dHalpha).toFixed(1)} nm, since Δλ/λ = v/c.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Velocity along the line of sight</span><span className="tabular-nums">{v > 0 ? "+" : ""}{v.toLocaleString("en-US")} km/s</span></span>
          <input type="range" min={-25000} max={25000} step={500} value={v} onChange={(e) => setV(Number(e.target.value))} aria-label="Line-of-sight velocity" className="mt-1 w-full" style={{ accentColor: v >= 0 ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Approaching star (−10,000)", -10000], ["At rest (0)", 0], ["Receding galaxy (+20,000)", 20000]].map(([n, val]) => (
            <button key={n as string} type="button" onClick={() => setV(val as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The lines carry one more gift: they clock <strong>motion.</strong> If a source moves along our line of sight, every line in its spectrum shifts — toward the <span className="text-purple">blue</span> if it approaches, toward the <span className="text-maroon">red</span> if it recedes — by the fraction Δλ/λ = v/c, exactly as a siren&rsquo;s pitch drops as it passes. Because the <em>rest</em> wavelengths are known precisely from the laboratory, the shift is directly measurable: read where the lines land, and you have clocked a star you can never visit. This one technique detects binary stars from their rhythmic wobble, finds <em>exoplanets</em> by the tiny stellar wobble their gravity induces (Newton&rsquo;s third law at work), and — most momentously — revealed that the light of almost every galaxy is <strong className="text-maroon">redshifted</strong>: they are all receding, the fingerprint of an <em>expanding universe</em>, the foundation of modern cosmology. The velocities in this widget are galactic-scale for visibility; the principle is identical at stellar speeds. From a shifted barcode to the history of the cosmos — that is the reach of reading light.
      </figcaption>
    </figure>
  );
}
