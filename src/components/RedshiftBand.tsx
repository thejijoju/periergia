"use client";

import { useState } from "react";

// An interactive redshift-to-band explorer, embedded in an article via a fenced
// ```redshiftband block (see Reader's `pre` override). The light of the first
// galaxies is stretched by cosmic expansion: an emission line at rest wavelength
// λ_rest is observed at λ_obs = λ_rest (1 + z). Slide the redshift and watch a
// familiar line march redward across the spectrum — out of the visible, past
// Hubble's ~1.7 µm reach, into the infrared where only JWST can follow. This is
// the first link in JWST's forced-design chain: seeing the early universe forces
// infrared. Log wavelength axis. currentColor theming (light/dark); first render
// deterministic (z = 7, Lyman-α).

const HUBBLE_MAX = 1700; // nm, Hubble's practical long-wavelength reach
const JWST_MIN = 600, JWST_MAX = 28000; // nm, JWST's range

const LINES = [
  { label: "Lyman-α", rest: 121.6 },
  { label: "Hα (656 nm)", rest: 656.3 },
];

// Log wavelength window: 100 nm (UV) to 30,000 nm (mid-IR).
const LAM_LO = 100, LAM_HI = 30000;
const LLO = Math.log10(LAM_LO), LHI = Math.log10(LAM_HI);

const X0 = 34, X1 = 424, Y0 = 40, Y1 = 150;
const px = (nm: number) => X0 + ((Math.log10(nm) - LLO) / (LHI - LLO)) * (X1 - X0);

const BANDS = [
  { name: "UV", lo: 100, hi: 400, cls: "text-faint", fill: 0.05 },
  { name: "Visible", lo: 400, hi: 750, cls: "text-purple", fill: 0.16 },
  { name: "Near-IR", lo: 750, hi: 2500, cls: "text-maroon", fill: 0.08 },
  { name: "Mid-IR", lo: 2500, hi: 30000, cls: "text-maroon", fill: 0.13 },
];

function fmtLam(nm: number): string {
  if (nm >= 1000) return `${(nm / 1000).toFixed(2)} µm`;
  return `${Math.round(nm)} nm`;
}

export function RedshiftBand() {
  const [lineIdx, setLineIdx] = useState(0);
  const [z, setZ] = useState(7);
  const rest = LINES[lineIdx].rest;
  const obs = rest * (1 + z);
  const inHubble = obs <= HUBBLE_MAX && obs >= 110;
  const inJwst = obs >= JWST_MIN && obs <= JWST_MAX;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={`At redshift ${z}, a ${LINES[lineIdx].label} line is observed at ${fmtLam(obs)}.`}>
        {/* spectrum bands */}
        {BANDS.map((b) => {
          const x = px(b.lo), w = px(b.hi) - px(b.lo);
          return (
            <g key={b.name}>
              <rect className={b.cls} x={x} y={Y0} width={w} height={Y1 - Y0} fill="currentColor" opacity={b.fill} />
              <text className="text-faint" x={x + w / 2} y={Y0 + 11} textAnchor="middle" fill="currentColor"
                fontSize={8.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{w > 30 ? b.name : ""}</text>
            </g>
          );
        })}
        {/* Hubble & JWST coverage bars */}
        <line className="text-faint" x1={px(110)} y1={Y1 + 14} x2={px(HUBBLE_MAX)} y2={Y1 + 14}
          stroke="currentColor" strokeWidth={3} opacity={0.7} />
        <text className="text-muted" x={px(410)} y={Y1 + 11} fill="currentColor" fontSize={8.5} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">Hubble</text>
        <line className="text-purple" x1={px(JWST_MIN)} y1={Y1 + 24} x2={px(JWST_MAX)} y2={Y1 + 24}
          stroke="currentColor" strokeWidth={3} opacity={0.9} />
        <text className="text-purple" x={px(3000)} y={Y1 + 21} fill="currentColor" fontSize={8.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">JWST</text>

        {/* rest-wavelength marker (faint) and its redshifted position */}
        <line className="text-faint" x1={px(rest)} y1={Y0} x2={px(rest)} y2={Y1} stroke="currentColor"
          strokeWidth={1} strokeDasharray="2 3" opacity={0.6} />
        <text className="text-faint" x={px(rest)} y={Y0 - 4} textAnchor="middle" fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">rest</text>

        {/* arrow from rest to observed */}
        <line className={inHubble ? "text-ink" : "text-maroon"} x1={px(rest)} y1={Y0 - 14} x2={px(obs)} y2={Y0 - 14}
          stroke="currentColor" strokeWidth={1.6} />
        <path className={inHubble ? "text-ink" : "text-maroon"} d={`M${px(obs) - 5} ${Y0 - 17} L${px(obs)} ${Y0 - 14} L${px(obs) - 5} ${Y0 - 11} Z`}
          fill="currentColor" />

        {/* observed line */}
        <line className={inHubble ? "text-ink" : "text-maroon"} x1={px(obs)} y1={Y0} x2={px(obs)} y2={Y1}
          stroke="currentColor" strokeWidth={2.6} />
        <text className={inHubble ? "text-ink" : "text-maroon"} x={px(obs)} y={Y1 + 34} textAnchor="middle"
          fill="currentColor" fontSize={9.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {fmtLam(obs)}
        </text>

        {/* axis ticks */}
        <g className="text-faint" fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(1000)} y={Y1 + 44} textAnchor="middle">1 µm</text>
          <text x={px(10000)} y={Y1 + 44} textAnchor="middle">10 µm</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong className="tabular-nums">z = {z.toFixed(1)}</strong>, {LINES[lineIdx].label} ({fmtLam(rest)}) arrives at{" "}
        <span className={`font-semibold ${inHubble ? "text-ink" : "text-maroon"}`}>{fmtLam(obs)}</span> —{" "}
        {inHubble
          ? <>still within Hubble&rsquo;s reach.</>
          : inJwst
          ? <strong className="text-maroon">past Hubble&rsquo;s cutoff. Only JWST&rsquo;s infrared eye can see it.</strong>
          : <>beyond even JWST.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Redshift z</span><span className="tabular-nums">{z.toFixed(1)}</span>
          </span>
          <input type="range" min={0} max={15} step={0.1} value={z}
            onChange={(e) => setZ(Number(e.target.value))}
            aria-label="Redshift" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {LINES.map((l, i) => (
            <button key={l.label} type="button" onClick={() => setLineIdx(i)} aria-pressed={i === lineIdx}
              className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${
                i === lineIdx ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"
              }`}>
              {l.label}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Cosmic expansion stretches every wavelength by a factor (1 + z), so a line emitted at λ<sub>rest</sub> is seen at λ<sub>obs</sub> = λ<sub>rest</sub>(1 + z). The first galaxies sit at z ≈ 7–13, and their ultraviolet and visible starlight is stretched clean out of the bands Hubble was built for and into the <span className="text-maroon">infrared</span>. To see the dawn of the universe you have no choice but to build an infrared telescope — the first link in the chain that forces every other feature of JWST. Everything downstream (cold, L2, the sunshield, the folding) follows from this one redshift.
      </figcaption>
    </figure>
  );
}
