"use client";

import { useState } from "react";

// An interactive solar-flux explorer, embedded via a fenced ```fluxgradient block (see
// Reader's `pre` override). This is the master variable of the block: sunlight spreads by
// the inverse-square law, F = L/(4 pi r^2), so the energy falling on each square metre
// drops steeply with distance. Drag from the Sun outward and watch the flux collapse —
// 668% of Earth's at Mercury, 0.11% at Neptune, a factor of ~6,000 across the system,
// imposed by nothing but geometry. The same gradient sets every world's baseline
// temperature and put the snow line at 2.7 AU. Log axes on both distance and flux (the
// flux spans four orders of magnitude); currentColor theming. First render deterministic
// (Earth, the 1,361 W/m^2 solar constant). The trig/log-derived static geometry is baked
// as frozen literals so SSR (Node) and client (V8) markup are byte-identical — only the
// live slider marker is computed on the fly.

const SOLAR_CONST = 1361; // W/m^2 at 1 AU
const PX0 = 44, PX1 = 418, PY0 = 40, PY1 = 176; // plot box
const r1 = (n: number) => Math.round(n * 10) / 10;
const l10 = Math.log10, lg = Math.log;
const DMIN = 0.3, DMAX = 40; // AU
const FMIN = 0.85, FMAX = 15122; // W/m^2, axis bounds
const fluxOf = (d: number) => SOLAR_CONST / (d * d);
const tempOf = (d: number) => 278 / Math.sqrt(d); // equilibrium temperature, K
const xOf = (d: number) => PX0 + ((lg(d) - lg(DMIN)) / (lg(DMAX) - lg(DMIN))) * (PX1 - PX0);
const yOf = (F: number) => PY1 - ((l10(F) - l10(FMIN)) / (l10(FMAX) - l10(FMIN))) * (PY1 - PY0);

// name, distance (AU), pre-computed axis x (baked — see note above)
const PLANETS: [string, number, number][] = [
  ["Me", 0.387, 63.5], ["V", 0.723, 111.2], ["E", 1.0, 136], ["Ma", 1.524, 168.2],
  ["J", 5.204, 262.1], ["S", 9.583, 308.8], ["U", 19.19, 361.9], ["N", 30.07, 396.2],
];

// the inverse-square flux curve, frozen (see note above)
const CURVE = "44,40 47.1,41.1 50.2,42.3 53.4,43.4 56.5,44.5 59.6,45.7 62.7,46.8 65.8,47.9 68.9,49.1 72.1,50.2 75.2,51.3 78.3,52.5 81.4,53.6 84.5,54.7 87.6,55.9 90.8,57 93.9,58.1 97,59.3 100.1,60.4 103.2,61.5 106.3,62.7 109.5,63.8 112.6,64.9 115.7,66.1 118.8,67.2 121.9,68.3 125,69.5 128.1,70.6 131.3,71.7 134.4,72.9 137.5,74 140.6,75.1 143.7,76.3 146.9,77.4 150,78.5 153.1,79.7 156.2,80.8 159.3,81.9 162.4,83.1 165.6,84.2 168.7,85.3 171.8,86.5 174.9,87.6 178,88.7 181.1,89.9 184.3,91 187.4,92.1 190.5,93.3 193.6,94.4 196.7,95.5 199.8,96.7 203,97.8 206.1,98.9 209.2,100.1 212.3,101.2 215.4,102.3 218.5,103.5 221.7,104.6 224.8,105.7 227.9,106.9 231,108 234.1,109.1 237.2,110.3 240.4,111.4 243.5,112.5 246.6,113.7 249.7,114.8 252.8,115.9 255.9,117.1 259,118.2 262.2,119.3 265.3,120.5 268.4,121.6 271.5,122.7 274.6,123.9 277.8,125 280.9,126.1 284,127.3 287.1,128.4 290.2,129.5 293.3,130.7 296.5,131.8 299.6,132.9 302.7,134.1 305.8,135.2 308.9,136.3 312,137.5 315.2,138.6 318.3,139.7 321.4,140.9 324.5,142 327.6,143.1 330.7,144.3 333.9,145.4 337,146.5 340.1,147.7 343.2,148.8 346.3,149.9 349.4,151.1 352.6,152.2 355.7,153.3 358.8,154.5 361.9,155.6 365,156.7 368.1,157.9 371.3,159 374.4,160.1 377.5,161.3 380.6,162.4 383.7,163.5 386.8,164.7 390,165.8 393.1,166.9 396.2,168.1 399.3,169.2 402.4,170.3 405.5,171.5 408.7,172.6 411.8,173.7 414.9,174.9 418,176";
const EARTH_X = 136, EARTH_Y = 73.5; // xOf(1), yOf(1361) — frozen initial marker

export function FluxGradient() {
  const [d, setD] = useState(1.0); // distance from the Sun, AU

  const F = fluxOf(d);
  const pct = 100 / (d * d); // flux as a percentage of Earth's
  const T = tempOf(d);
  const mx = d === 1.0 ? EARTH_X : r1(xOf(d));
  const my = d === 1.0 ? EARTH_Y : r1(yOf(F));

  const fluxLabel = F >= 100 ? `${Math.round(F).toLocaleString("en-US")} W/m²` : F >= 10 ? `${Math.round(F)} W/m²` : `${F.toFixed(1)} W/m²`;
  const pctLabel = pct >= 100 ? `${Math.round(pct)}% of Earth's` : pct >= 1 ? `${Math.round(pct)}% of Earth's` : `${pct.toFixed(2)}% of Earth's`;

  return (
    <figure className="flux-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${r1(d)} AU from the Sun the solar flux is about ${fluxLabel}, ${pctLabel}, giving an equilibrium temperature near ${Math.round(T)} kelvin.`}>

        {/* the solar constant reference line (1 AU) */}
        <line className="text-faint" x1={EARTH_X} y1={PY0} x2={EARTH_X} y2={PY1} stroke="currentColor" strokeWidth={0.7} strokeDasharray="3 3" opacity={0.5} />

        {/* the inverse-square flux curve */}
        <polyline points={CURVE} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.8} />

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={PX0 - 4} y={45.7 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">10⁴</text>
        <text className="text-faint" x={PX0 - 4} y={109.7 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">100</text>
        <text className="text-faint" x={PX0 - 4} y={173.7 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">1</text>
        <text className="text-faint" x={PX0 - 20} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 20} ${(PY0 + PY1) / 2})`}>flux (W/m², log)</text>

        {/* Sun + planet ticks */}
        <circle className="text-maroon" cx={PX0} cy={PY1} r={4} fill="currentColor" />
        {PLANETS.map(([n, , px]) => (
          <g key={n}>
            <line className="text-faint" x1={px} y1={PY1} x2={px} y2={PY1 + 4} stroke="currentColor" strokeWidth={0.8} />
            <text className="text-faint" x={px} y={PY1 + 12} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{n}</text>
          </g>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 24} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from the Sun (AU, log scale)</text>

        {/* the marker */}
        <line className="text-ink" x1={mx} y1={PY0} x2={mx} y2={PY1} stroke="currentColor" strokeWidth={0.7} opacity={0.35} />
        <circle className="text-ink" cx={mx} cy={my} r={5} fill="currentColor" />

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={PX1} y={PY0 - 6} textAnchor="end" fill="currentColor" fontSize={8} fontWeight={600}>solar flux at {r1(d)} AU</text>
          <text className="text-maroon" x={PX1} y={PY0 + 14} textAnchor="end" fill="currentColor" fontSize={18} fontWeight={800}>{fluxLabel}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong className="text-ink">{r1(d)} AU</strong> each square metre catches <strong className="text-maroon">{fluxLabel}</strong> — <strong>{pctLabel}</strong>, an equilibrium temperature near <strong>{Math.round(T)} K</strong>. Double the distance and the sunlight falls to a <strong>quarter</strong>: that is the inverse square, and it is the steepest gradient in the solar system.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Distance from the Sun</span><span className="tabular-nums">{r1(d)} AU · {fluxLabel}</span></span>
          <input type="range" min={0.3} max={40} step={0.05} value={d} onChange={(e) => setD(Number(e.target.value))} aria-label="Distance from the Sun in AU" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Mercury (668%)", 0.387], ["Earth (1,361 W/m²)", 1.0], ["Jupiter (3.7%)", 5.204], ["Neptune (0.11%)", 30.07]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setD(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The master variable of the whole block. The Sun pours out energy at a fixed rate — its luminosity, <em>L</em>⊙ = 3.83 × 10²⁶ W — and that energy streams outward through ever-larger spheres, so the power crossing each square metre falls as the <strong>inverse square of distance</strong>: <em>F</em> = <em>L</em>⊙ / 4π<em>r</em>². At Earth this is the <strong className="text-maroon">solar constant, 1,361 W/m²</strong> — about a kilowatt and a third, which is why solar panels perform as they do. Run the slider out and the collapse is brutal: Mercury bathes in <strong>668%</strong> of Earth&rsquo;s sunlight, Neptune in barely <strong>0.11%</strong> — a factor of roughly <strong>6,000</strong> from the innermost world to the outermost, imposed by nothing more than geometry. This one gradient sets every world&rsquo;s baseline temperature (before albedo and greenhouse effects adjust it), decides which ices a body can keep, and — because the young disk followed the same falling profile — is exactly what placed the <strong className="text-ink">snow line at 2.7 AU</strong> and split the solar system into rocky worlds and giants. It is also why the outer probes carry nuclear batteries instead of panels: at Jupiter a panel gathers 27 times less than at Earth. Distance sets flux; flux sets temperature; temperature sets chemistry; chemistry sets what worlds can form and keep.
      </figcaption>
    </figure>
  );
}
