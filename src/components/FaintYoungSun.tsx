"use client";

import { useState } from "react";

// An interactive of the faint young Sun paradox and its resolution, embedded via a fenced
// ```faintyoungsun block (see Reader's `pre` override). The Sun has brightened from ~70% of
// its present luminosity to 100% over 4.5 Gyr, so Earth's equilibrium temperature has climbed
// from 232 K to 254 K. With a FIXED greenhouse (+34 K, today's value) the early Earth would
// have sat at 266 K — frozen solid — for its first two billion years, yet the rocks show
// liquid water at 4.4 Gyr. The resolution is the carbon-silicate THERMOSTAT: a fainter Sun
// means a cooler planet means slower weathering means CO2 accumulates means a stronger
// greenhouse, so the greenhouse contribution shrinks from +56 K to +34 K exactly as the Sun
// brightens, holding the surface near 288 K throughout. Drag the slider across deep time.
//
// The epoch data (luminosity, flux, and equilibrium temperature) are baked literals — T_eq is
// computed offline from T_eq = [F(1-A)/4sigma]^(1/4) and frozen — and every pixel coordinate
// is a pure linear map (multiply/add/divide only), so SSR and client render identically.

type E = { gyr: number; lum: number; flux: number; teq: number };
// gyr = billions of years ago; lum = L/L_sun; flux W/m^2; teq = equilibrium temp (K), baked
const EPOCHS: E[] = [
  { gyr: 4.5, lum: 0.70, flux: 953, teq: 232 },
  { gyr: 4.0, lum: 0.75, flux: 1021, teq: 236 },
  { gyr: 3.0, lum: 0.80, flux: 1089, teq: 240 },
  { gyr: 2.0, lum: 0.85, flux: 1157, teq: 244 },
  { gyr: 1.0, lum: 0.925, flux: 1259, teq: 249 },
  { gyr: 0.0, lum: 1.00, flux: 1361, teq: 254 },
];
const SURFACE = 288; // K — held roughly constant by the thermostat
const FIXED_GH = 34; // K — today's greenhouse, applied to the "no thermostat" ghost
const FREEZE = 273; // K

// plot box
const PX0 = 56, PX1 = 408, PY0 = 28, PYB = 176;
const TMIN = 220, TMAX = 300;
const r1 = (n: number) => Math.round(n * 10) / 10;
const xOf = (gyr: number) => r1(PX0 + ((4.5 - gyr) / 4.5) * (PX1 - PX0));
const yOf = (t: number) => r1(PYB - ((t - TMIN) / (TMAX - TMIN)) * (PYB - PY0));

const line = (pts: [number, number][]) => pts.map(([x, y]) => `${x},${y}`).join(" ");
const teqPts = EPOCHS.map((e) => [xOf(e.gyr), yOf(e.teq)] as [number, number]);
const naivePts = EPOCHS.map((e) => [xOf(e.gyr), yOf(e.teq + FIXED_GH)] as [number, number]);

export function FaintYoungSun() {
  const [i, setI] = useState(0); // start at 4.5 Gyr ago — the paradox at its sharpest
  const e = EPOCHS[i];
  const gh = SURFACE - e.teq; // greenhouse the thermostat must supply
  const naive = e.teq + FIXED_GH; // surface if the greenhouse never changed
  const frozen = naive < FREEZE;
  const cx = xOf(e.gyr);

  return (
    <figure className="fys-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label="Earth's temperature through deep time as the Sun brightens from 70% to 100% of its present luminosity: the equilibrium temperature rises from 232 K to 254 K, a fixed greenhouse would have left the early Earth frozen at 266 K, but the carbon-silicate thermostat supplies a stronger early greenhouse that holds the surface near 288 K, above freezing, throughout.">

        {/* liquid-water band (above freezing) */}
        <rect x={PX0} y={yOf(TMAX)} width={PX1 - PX0} height={r1(yOf(FREEZE) - yOf(TMAX))}
          className="text-purple" fill="currentColor" opacity={0.1} />
        <line x1={PX0} y1={yOf(FREEZE)} x2={PX1} y2={yOf(FREEZE)}
          className="text-purple" stroke="currentColor" strokeWidth={0.8} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-purple" x={PX0 + 3} y={yOf(FREEZE) - 3} fill="currentColor" fontSize={6.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>freezing · 273 K · liquid water above</text>

        {/* axes ticks */}
        {[240, 260, 280].map((t) => (
          <g key={t}>
            <line x1={PX0} y1={yOf(t)} x2={PX1} y2={yOf(t)} className="text-line" stroke="currentColor" strokeWidth={0.4} opacity={0.4} />
            <text className="text-faint" x={PX0 - 3} y={yOf(t) + 2} textAnchor="end" fill="currentColor" fontSize={6}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{t}</text>
          </g>
        ))}
        <text className="text-faint" x={PX0} y={PYB + 12} fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">4.5 Gyr ago</text>
        <text className="text-faint" x={PX1} y={PYB + 12} textAnchor="end" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">today</text>

        {/* regulated surface (thermostat) — held near 288 K */}
        <line x1={PX0} y1={yOf(SURFACE)} x2={PX1} y2={yOf(SURFACE)} className="text-maroon" stroke="currentColor" strokeWidth={1.6} opacity={0.9} />
        <text className="text-maroon" x={PX1} y={yOf(SURFACE) - 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">actual surface ≈ 288 K (thermostat holds it here)</text>

        {/* "no thermostat" ghost: T_eq + fixed greenhouse — dips below freezing early */}
        <polyline points={line(naivePts)} className="text-faint" fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="4 3" opacity={0.85} />
        <text className="text-faint" x={naivePts[0][0] + 4} y={naivePts[0][1] + 8} fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">fixed greenhouse → frozen</text>

        {/* equilibrium temperature (no atmosphere) */}
        <polyline points={line(teqPts)} className="text-ink" fill="none" stroke="currentColor" strokeWidth={1.3} opacity={0.85} />
        <text className="text-ink" x={teqPts[0][0] + 4} y={teqPts[0][1] + 9} fill="currentColor" fontSize={6}
          fontFamily="ui-sans-serif, system-ui, sans-serif">equilibrium (no air)</text>

        {/* current-epoch marker: the greenhouse gap the thermostat fills */}
        <line x1={cx} y1={yOf(e.teq)} x2={cx} y2={yOf(SURFACE)} className="text-maroon" stroke="currentColor" strokeWidth={5} opacity={0.22} />
        <line x1={cx} y1={PY0} x2={cx} y2={PYB} className="text-ink" stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 3" opacity={0.5} />
        <circle cx={cx} cy={yOf(e.teq)} r={2.6} className="text-ink" fill="currentColor" />
        <circle cx={cx} cy={yOf(SURFACE)} r={2.6} className="text-maroon" fill="currentColor" />
        <circle cx={cx} cy={yOf(naive)} r={2.2} className={frozen ? "text-maroon" : "text-faint"} fill="currentColor" />
        <text x={cx + 5} y={r1((yOf(e.teq) + yOf(SURFACE)) / 2)} className="text-maroon" fill="currentColor" fontSize={6.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">+{gh} K CO₂</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong>{e.gyr === 0 ? "Today" : `${e.gyr.toFixed(1)} Gyr ago`}</strong> · Sun at <strong>{Math.round(e.lum * 100)}%</strong> · flux <strong>{e.flux.toLocaleString("en-US")} W/m²</strong> · equilibrium <strong>{e.teq} K</strong>
        {" — "}
        {frozen
          ? <>with a fixed greenhouse the surface would be <strong className="text-maroon">{naive} K — frozen.</strong></>
          : <>a fixed greenhouse would give <strong>{naive} K.</strong></>}
        {" "}The thermostat instead supplies <strong className="text-maroon">+{gh} K</strong> of CO₂ greenhouse, holding the surface at <strong>288 K.</strong>
      </p>

      <div className="mt-4">
        <input type="range" min={0} max={EPOCHS.length - 1} step={1} value={i}
          onChange={(ev) => setI(Number(ev.target.value))}
          className="w-full accent-maroon" aria-label="Time since Earth's formation" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>4.5 Gyr ago (faint Sun)</span><span>brightening →</span><span>today</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Stellar physics is unambiguous: as the Sun fuses hydrogen its core contracts and heats, so it has brightened by roughly a third over the age of the solar system — it shone at only about 70% of today&rsquo;s luminosity when Earth formed. Feed that into the equilibrium-temperature formula and the young Earth&rsquo;s <em>no-atmosphere</em> temperature is just 232 K; add today&rsquo;s modest +34 K greenhouse and the surface still sits at 266 K, seven degrees below freezing, globally. By that reckoning Earth should have been an iceball for its first two billion years — yet 4.4-billion-year-old zircons formed in liquid water, and 3.8-billion-year-old pillow lavas erupted under it. That is the <strong>faint young Sun paradox</strong>. Its resolution is not luck but a <strong>negative feedback</strong>: a fainter Sun means a cooler planet, a cooler planet weathers rock more slowly, and slow weathering lets volcanic CO₂ build up — so the greenhouse was automatically strongest exactly when the Sun was weakest, and has faded from +56 K to +34 K as the Sun brightened. The red line barely moves while everything beneath it climbs. That is a thermostat, and it is the exact opposite of the runaway that destroyed Venus.
      </figcaption>
    </figure>
  );
}
