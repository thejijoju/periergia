"use client";

import { useState } from "react";

// An interactive Hohmann-transfer explorer, embedded in an article via a fenced
// ```hohmann block (see Reader's `pre` override). To move between two circular
// orbits you ride a transfer ellipse tangent to both: a prograde burn at the low
// orbit raises apogee out to the target, a coast up the ellipse, then a second
// prograde burn to circularize. Slide the target radius and watch the transfer
// ellipse stretch, with the two burns and the trip time computed live from
// vis-viva. The GEO preset reproduces the chapter's worked LEO→GEO transfer
// (~2.40 + 1.46 = 3.86 km/s, 5.3 h). currentColor theming (light/dark); first
// render deterministic (GEO).

const MU = 3.986e5; // km³/s²
const RE = 6378; // km, Earth radius
const R1 = 6778; // km, the fixed low parking orbit (400 km altitude)
const R2_GEO = 42164; // km, geostationary
const R2_MAX = 9 * R1;

const CX = 150;
const CY = 125;
const OUTER_PX = 96; // the target orbit is always drawn at this radius

const vCirc = (r: number) => Math.sqrt(MU / r);

function transfer(r2: number) {
  const at = (R1 + r2) / 2;
  const v1 = vCirc(R1);
  const v2 = vCirc(r2);
  const vp = Math.sqrt(MU * (2 / R1 - 1 / at));
  const va = Math.sqrt(MU * (2 / r2 - 1 / at));
  const dv1 = vp - v1;
  const dv2 = v2 - va;
  const hours = (Math.PI * Math.sqrt(at ** 3 / MU)) / 3600;
  return { at, v1, v2, va, dv1, dv2, total: dv1 + dv2, hours };
}

// Transfer half-ellipse from perigee (+x, r=R1) up over the top to apogee
// (−x, r=r2), in screen coordinates at the given scale.
function ellipsePath(r2: number, scale: number): string {
  const e = (r2 - R1) / (r2 + R1);
  const at = (R1 + r2) / 2;
  const p = at * (1 - e * e);
  const N = 80;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const th = (i / N) * Math.PI;
    const r = p / (1 + e * Math.cos(th));
    const x = r * Math.cos(th), y = r * Math.sin(th);
    d += `${i === 0 ? "M" : "L"}${(CX + x * scale).toFixed(1)} ${(CY - y * scale).toFixed(1)}`;
  }
  return d;
}

function fmtAlt(r2: number): string {
  if (Math.abs(r2 - R2_GEO) < 400) return "geostationary";
  return `${Math.round((r2 - RE) / 100) * 100} km altitude`;
}

export function HohmannTransfer() {
  const [r2, setR2] = useState(R2_GEO);
  const t = transfer(r2);
  const scale = OUTER_PX / r2; // px per km, so the target orbit fills OUTER_PX
  const r1px = R1 * scale;
  const rEpx = Math.max(5, RE * scale);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 300 250" className="mx-auto block h-auto w-full max-w-[340px]" role="img"
        aria-label={`Hohmann transfer to ${fmtAlt(r2)}: two burns of ${t.dv1.toFixed(2)} and ${t.dv2.toFixed(2)} km/s.`}>
        {/* target circular orbit */}
        <circle className="text-line" cx={CX} cy={CY} r={OUTER_PX} fill="none" stroke="currentColor"
          strokeWidth={1.2} strokeDasharray="2 4" opacity={0.8} />
        {/* low parking orbit */}
        <circle className="text-line" cx={CX} cy={CY} r={r1px} fill="none" stroke="currentColor"
          strokeWidth={1.2} opacity={0.8} />
        {/* transfer ellipse (upper half, highlighted) */}
        <path className="text-maroon" d={ellipsePath(r2, scale)} fill="none" stroke="currentColor"
          strokeWidth={2.6} strokeLinejoin="round" />
        {/* Earth at the focus */}
        <circle className="text-purple" cx={CX} cy={CY} r={rEpx} fill="currentColor" opacity={0.25} />
        <circle className="text-purple" cx={CX} cy={CY} r={rEpx} fill="none" stroke="currentColor" strokeWidth={1} />
        {/* burn 1 at perigee (+x), burn 2 at apogee (−x) */}
        <g className="text-maroon" fill="currentColor">
          <circle cx={CX + r1px} cy={CY} r={4} />
          <circle cx={CX - OUTER_PX} cy={CY} r={4} />
        </g>
        <text className="text-maroon" x={CX + r1px + 6} y={CY + 12} fill="currentColor" fontSize={9} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">burn 1</text>
        <text className="text-maroon" x={CX - OUTER_PX + 2} y={CY - 8} textAnchor="start" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">burn 2</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        LEO → <strong>{fmtAlt(r2)}</strong>:{" "}
        <span className="font-semibold text-maroon">Δv₁ = {t.dv1.toFixed(2)}</span> +{" "}
        <span className="font-semibold text-maroon">Δv₂ = {t.dv2.toFixed(2)}</span> ={" "}
        <strong>{t.total.toFixed(2)} km/s</strong>, coasting <strong>{t.hours.toFixed(1)} h</strong>.
      </p>
      <p className="mt-0.5 text-center font-sans text-[12px] text-faint">
        At apogee you crawl at {t.va.toFixed(2)} km/s — slower than the {t.v2.toFixed(2)} km/s circular speed, so burn 2 <em>speeds up</em> to stay.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Target orbit radius</span>
            <span className="tabular-nums">{Math.round(r2).toLocaleString()} km</span>
          </span>
          <input type="range" min={1.2 * R1} max={R2_MAX} step={100} value={r2}
            onChange={(e) => setR2(Number(e.target.value))}
            aria-label="Target orbit radius"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setR2(R2_GEO)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Geostationary
          </button>
          <button type="button" onClick={() => setR2(RE + 20200)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            GPS (20,200 km)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The Hohmann transfer: the cheapest two-burn hop between circular orbits, an ellipse tangent to both. Both burns are prograde — you speed up <em>twice</em> to go higher — yet the destination is <em>slower</em> than where you started (higher is slower). The first burn, deep and fast, does most of the work; the second circularizes way up top, where the transfer ellipse has left you barely moving. The GEO preset is the real LEO→GEO transfer flown several times a month: ~3.86 km/s and 5.3 hours. That Δv is a bill from the rocket equation — which is why reaching geostationary means launching more than half propellant.
      </figcaption>
    </figure>
  );
}
