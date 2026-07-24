"use client";

import { useState } from "react";

// An interactive condensation-sequence explorer, embedded via a fenced ```condensation
// block (see Reader's `pre` override). The mechanism that turns the disk's temperature
// gradient into a COMPOSITIONAL gradient: as gas of solar composition cools, materials
// freeze out in a fixed order — refractory oxides first (1,700 K), then metal and rock,
// down through water ice (~170 K, the snow line), ammonia, methane, and the most
// volatile ices last. Because the disk was hot near the Sun and cold far out (T = 280·
// r^-1/2, straight from L2's inverse-square flux law), that sequence in TEMPERATURE
// becomes a sequence in SPACE: every condensation temperature defines a line in the
// disk. Drag the marker in and out and watch which materials are solid grains and which
// are still vapour — and where water ice, the one that matters most, switches on. The
// axis geometry and condensation lines are baked literals; the marker is a single
// evaluation the engines agree on. currentColor theming; first render at the snow line.

const X0 = 40, X1 = 418, AY = 92; // log-distance axis (0.2..150 AU)
const r1 = (n: number) => Math.round(n * 10) / 10;
const l10 = Math.log10;
const DMIN = 0.2, DMAX = 150;
const tempOf = (r: number) => 280 / Math.sqrt(r); // disk temperature, K
const xOf = (r: number) => X0 + ((l10(r) - l10(DMIN)) / (l10(DMAX) - l10(DMIN))) * (X1 - X0);

// material: label, condensation temperature (K), its condensation line r=(280/T)^2 (AU)
const MATERIALS: [string, number][] = [
  ["Refractory oxides", 1700],
  ["Iron & rock (silicates)", 1300],
  ["Water ice", 170],
  ["Ammonia ice", 100],
  ["Methane ice", 40],
  ["CO & nitrogen ice", 25],
];
// baked condensation-line x positions (xOf((280/T)^2))
const LINES: [string, number, number][] = [
  ["water ice · snow line", 2.71, 188.8],
  ["ammonia", 7.84, 249.4],
  ["methane", 49, 354.1],
];
// baked planet ticks: label, x
const TICKS: [string, number][] = [
  ["Me", 78.2], ["V", 113.1], ["E", 131.9], ["Ma", 156], ["J", 226], ["S", 260.8], ["U", 306.9], ["N", 326.1],
];

const INIT_R = 2.75, INIT_X = 189.7, INIT_T = 169; // frozen initial marker (at the snow line)

export function CondensationLadder() {
  const [r, setR] = useState(INIT_R); // distance from the Sun, AU

  const T = r === INIT_R ? INIT_T : Math.round(tempOf(r));
  const mx = r === INIT_R ? INIT_X : r1(xOf(r));
  // a material is a solid grain here if the local temperature is at or below its
  // condensation point (+1 K tolerance so water reads solid right at the line)
  const solid = (Tc: number) => T <= Tc + 1;
  const nSolid = MATERIALS.filter(([, Tc]) => solid(Tc)).length;

  return (
    <figure className="condensation-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 128" className="w-full h-auto" role="img"
        aria-label={`At ${r1(r)} AU the disk is about ${T} kelvin, cold enough for ${nSolid} of the six materials to condense into solid grains.`}>

        {/* zone shading: how many species have condensed (rock-only vs +ice) */}
        <rect x={X0} y={AY - 26} width={r1(188.8 - X0)} height={52} className="text-maroon" fill="currentColor" opacity={0.05} />
        <rect x={188.8} y={AY - 26} width={r1(X1 - 188.8)} height={52} className="text-purple" fill="currentColor" opacity={0.07} />

        {/* the axis */}
        <line className="text-line" x1={X0} y1={AY} x2={X1} y2={AY} stroke="currentColor" strokeWidth={1} />

        {/* condensation lines */}
        {LINES.map(([lbl, , x], i) => (
          <g key={lbl}>
            <line className={i === 0 ? "text-ink" : "text-faint"} x1={x} y1={AY - 24} x2={x} y2={AY + 22} stroke="currentColor" strokeWidth={i === 0 ? 1.5 : 0.9} strokeDasharray={i === 0 ? "4 3" : "2 3"} opacity={i === 0 ? 1 : 0.7} />
            <text className={i === 0 ? "text-ink" : "text-faint"} x={x} y={AY - 28} textAnchor="middle" fill="currentColor" fontSize={i === 0 ? 7.5 : 6.3} fontWeight={i === 0 ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{lbl}</text>
          </g>
        ))}

        {/* Sun + planet ticks */}
        <circle className="text-maroon" cx={X0} cy={AY} r={4} fill="currentColor" />
        {TICKS.map(([n, x]) => (
          <g key={n}>
            <line className="text-faint" x1={x} y1={AY} x2={x} y2={AY + 4} stroke="currentColor" strokeWidth={0.8} />
            <text className="text-faint" x={x} y={AY + 12} textAnchor="middle" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">{n}</text>
          </g>
        ))}
        <text className="text-faint" x={(X0 + X1) / 2} y={AY + 22} textAnchor="middle" fill="currentColor" fontSize={6.8} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from the Sun (AU, log scale)</text>

        {/* the marker */}
        <line className="text-ink" x1={mx} y1={AY - 26} x2={mx} y2={AY + 6} stroke="currentColor" strokeWidth={0.8} opacity={0.4} />
        <circle className="text-ink" cx={mx} cy={AY} r={4.5} fill="currentColor" />
        <text className="text-ink" x={mx} y={AY - 6} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{T} K</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong className="text-ink">{r1(r)} AU</strong> the disk sits near <strong>{T} K</strong> — solid grains of <strong className={nSolid >= 3 ? "text-purple" : "text-maroon"}>{nSolid} of 6</strong> materials can exist here. {T <= 171
          ? <>Beyond the snow line, <strong className="text-purple">water ice</strong> has joined rock and metal.</>
          : <>It is too warm for <strong>water ice</strong> — only rock and metal condense.</>}
      </p>

      {/* the material checklist */}
      <div className="mt-3 grid grid-cols-2 gap-x-4 gap-y-1.5 sm:grid-cols-3">
        {MATERIALS.map(([name, Tc]) => {
          const isSolid = solid(Tc);
          const isWater = Tc === 170;
          return (
            <div key={name} className={`flex items-center gap-2 font-sans text-[12px] ${isSolid ? (isWater ? "text-purple" : "text-ink") : "text-faint"}`}>
              <span className={`inline-block h-2.5 w-2.5 rounded-full ${isSolid ? (isWater ? "bg-purple" : "bg-ink") : "border border-faint"}`} style={isSolid ? { backgroundColor: isWater ? "var(--c-purple)" : "var(--c-ink)" } : {}} />
              <span className={isWater ? "font-semibold" : ""}>{name}</span>
              <span className="text-faint tabular-nums">{isSolid ? "solid" : "vapour"}</span>
            </div>
          );
        })}
      </div>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Distance from the Sun</span><span className="tabular-nums">{r1(r)} AU · {T} K</span></span>
          <input type="range" min={0.3} max={50} step={0.05} value={r} onChange={(e) => setR(Number(e.target.value))} aria-label="Distance from the Sun in AU" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Terrestrial zone (1 AU)", 1.0], ["Snow line (2.7 AU)", 2.71], ["Jupiter (5.2 AU)", 5.2], ["Kuiper Belt (45 AU)", 45]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setR(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The disk did not condense all at once. As gas of cosmic composition cools, materials freeze out in a fixed order — the <strong>condensation sequence</strong>: refractory oxides at 1,700 K, iron and silicate rock near 1,300 K, then, far cooler, <strong className="text-purple">water ice at about 170 K</strong>, ammonia at 100 K, methane at 40 K, and the most volatile ices last of all. Now the key move: because the disk&rsquo;s temperature fell with distance (<em>T</em> ≈ 280 K × <em>r</em><sup>−1/2</sup>, straight from the inverse-square flux law), that sequence in <em>temperature</em> becomes a sequence in <em>space</em> — every condensation temperature marks a <strong>line</strong> in the disk, inside which the material is vapour and outside which it is a solid grain. Setting <em>T</em> = 170 K gives the snow line at (280/170)² = <strong className="text-ink">2.71 AU</strong>, squarely in the asteroid belt. Inside it, only rock and metal could solidify — the terrestrial zone. Outside, abundant water ice joined them, and farther still the ammonia, methane, and nitrogen lines set the stage for the ice giants and the frozen bodies of the Kuiper Belt. The disk was not a uniform soup but a chemically stratified structure, and <strong className="text-ink">each planet inherited the composition of the zone where it formed.</strong>
      </figcaption>
    </figure>
  );
}
