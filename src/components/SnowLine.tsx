"use client";

import { useState } from "react";

// An interactive snow-line explorer, embedded in an article via a fenced ```snowline
// block (see Reader's `pre` override). This is the PAYLOAD of the lecture — the single
// distance that built the solar system. Drag a marker in from the Sun and watch the
// disk temperature fall as T = 278/sqrt(d) (which reproduces the lecture's table
// exactly: 440 K at 0.4 AU, 278 K at Earth, 169 K at 2.7 AU, 51 K at Neptune). Rock and
// metal condense at over 1000 K, so they solidify EVERYWHERE. Water ice needs below
// ~150-170 K — which happens only beyond about 2.7 AU, the SNOW LINE. Cross it and the
// solid material available for building planets jumps several-fold, because water is one
// of the most abundant compounds there is. Inside: small rocky worlds. Outside: giants.
// One distance, two provinces. Log distance axis so 0.3-30 AU all fits; currentColor
// theming (the temperature curve is chrome, not a physical rainbow). First render
// deterministic (d = 2.7 AU, right on the snow line). Coordinates rounded for SSR/client
// parity.

const DMIN = 0.3, DMAX = 32; // AU, plot range
const PX0 = 40, PX1 = 418, PY0 = 34, PY1 = 176; // plot box
const TMAX = 460; // K, top of the temperature axis
const SNOW = 2.7; // AU, the snow line
const ICE_T = 170; // K, upper end of the water-condensation band
const lg = Math.log;
const r1 = (n: number) => Math.round(n * 10) / 10;
const tempOf = (d: number) => 278 / Math.sqrt(d); // equilibrium temperature, K
const xOf = (d: number) => PX0 + ((lg(d) - lg(DMIN)) / (lg(DMAX) - lg(DMIN))) * (PX1 - PX0);
const yOf = (T: number) => PY1 - (Math.min(T, TMAX) / TMAX) * (PY1 - PY0);

// Planet ticks: name, distance (AU), and PRE-COMPUTED x. The temperature curve and
// these tick positions are baked as literals rather than computed at render time:
// Math.log/Math.pow/Math.sqrt differ by a last ULP between Node (SSR) and browser V8,
// and across 120 curve points that difference reliably lands one coordinate on a
// rounding boundary — a React hydration mismatch. A frozen literal is byte-identical in
// both engines. Only the state-dependent marker is computed live (a single eval, which
// the two engines agree on). Regenerate with the same xOf/yOf if the geometry changes.
const PLANETS: [string, number, number][] = [
  ["Me", 0.39, 61.2], ["V", 0.72, 110.9], ["E", 1.0, 137.5], ["Ma", 1.52, 171.4],
  ["J", 5.2, 270.9], ["S", 9.58, 320.4], ["U", 19.19, 376.6], ["N", 30.07, 413],
];

// the temperature curve, frozen (see note above)
const CURVE = "40,34 43.2,34 46.3,34 49.4,34 52.6,34 55.8,34 58.9,36.6 62.1,39.3 65.2,41.9 68.4,44.5 71.5,47 74.7,49.5 77.8,51.9 81,54.3 84.1,56.7 87.3,59 90.4,61.2 93.6,63.4 96.7,65.6 99.9,67.7 103,69.8 106.2,71.9 109.3,73.9 112.5,75.8 115.6,77.8 118.8,79.7 121.9,81.5 125.1,83.3 128.2,85.1 131.4,86.9 134.5,88.6 137.7,90.3 140.8,91.9 144,93.6 147.1,95.1 150.3,96.7 153.4,98.2 156.6,99.7 159.7,101.2 162.9,102.6 166,104.1 169.2,105.4 172.3,106.8 175.5,108.1 178.6,109.4 181.8,110.7 184.9,112 188.1,113.2 191.2,114.4 194.3,115.6 197.5,116.8 200.7,117.9 203.8,119 207,120.1 210.1,121.2 213.3,122.3 216.4,123.3 219.5,124.3 222.7,125.3 225.9,126.3 229,127.2 232.2,128.2 235.3,129.1 238.4,130 241.6,130.9 244.8,131.8 247.9,132.6 251.1,133.5 254.2,134.3 257.4,135.1 260.5,135.9 263.7,136.6 266.8,137.4 270,138.1 273.1,138.9 276.3,139.6 279.4,140.3 282.6,141 285.7,141.7 288.9,142.3 292,143 295.2,143.6 298.3,144.2 301.5,144.8 304.6,145.4 307.8,146 310.9,146.6 314.1,147.2 317.2,147.7 320.3,148.3 323.5,148.8 326.6,149.3 329.8,149.8 333,150.3 336.1,150.8 339.3,151.3 342.4,151.8 345.5,152.3 348.7,152.7 351.8,153.2 355,153.6 358.2,154 361.3,154.5 364.5,154.9 367.6,155.3 370.8,155.7 373.9,156.1 377,156.5 380.2,156.8 383.3,157.2 386.5,157.6 389.7,157.9 392.8,158.3 396,158.6 399.1,159 402.3,159.3 405.4,159.6 408.5,159.9 411.7,160.2 414.9,160.5 418,160.8";
const SNOWX = 217.9; // xOf(2.7), frozen
const ICEY = 123.5; // yOf(170), frozen
const XDMIN = 40; // xOf(0.3), frozen

export function SnowLine() {
  const [d, setD] = useState(SNOW); // distance from the Sun, AU

  const T = tempOf(d);
  const iceCondenses = T <= ICE_T;
  // marker: the initial (d = SNOW) position is frozen to match the baked geometry
  // exactly; any other d is computed live (single eval — the engines agree) after
  // hydration, so it never participates in the SSR/client comparison.
  const mx = d === SNOW ? SNOWX : r1(xOf(d));
  const my = d === SNOW ? 123.8 : r1(yOf(T));

  return (
    <figure className="snowline-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${r1(d)} AU from the Sun the disk temperature is about ${Math.round(T)} kelvin, ${iceCondenses ? "cold enough for water to freeze into ice — beyond the snow line" : "too hot for water ice — inside the snow line, only rock and metal can condense"}.`}>

        {/* provinces: inner (rock only) vs outer (rock + ice) */}
        <rect className="text-maroon" x={PX0} y={PY0} width={r1(SNOWX - PX0)} height={PY1 - PY0} fill="currentColor" opacity={0.06} />
        <rect className="text-purple" x={SNOWX} y={PY0} width={r1(PX1 - SNOWX)} height={PY1 - PY0} fill="currentColor" opacity={0.08} />

        {/* the water-ice band (below ~170 K) */}
        <line className="text-purple" x1={PX0} y1={ICEY} x2={PX1} y2={ICEY} stroke="currentColor" strokeWidth={0.8} strokeDasharray="3 3" opacity={0.6} />
        <text className="text-purple" x={PX1 - 2} y={ICEY - 4} textAnchor="end" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>water freezes below ~170 K</text>

        {/* the snow line */}
        <line className="text-ink" x1={SNOWX} y1={PY0 - 4} x2={SNOWX} y2={PY1} stroke="currentColor" strokeWidth={1.4} strokeDasharray="4 3" />
        <text className="text-ink" x={SNOWX} y={PY0 - 8} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">snow line · 2.7 AU</text>

        {/* the temperature curve */}
        <polyline points={CURVE} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.8} />

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={PX0 - 4} y={52.5 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">400 K</text>
        <text className="text-faint" x={PX0 - 4} y={114.3 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">200 K</text>
        <text className="text-faint" x={PX0 - 4} y={160.6 + 3} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">50 K</text>

        {/* Sun + planet ticks along the distance axis (x pre-computed — see note above) */}
        <circle className="text-maroon" cx={XDMIN} cy={PY1} r={4} fill="currentColor" />
        {PLANETS.map(([n, , px]) => (
          <g key={n}>
            <line className="text-faint" x1={px} y1={PY1} x2={px} y2={PY1 + 4} stroke="currentColor" strokeWidth={0.8} />
            <text className="text-faint" x={px} y={PY1 + 12} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{n}</text>
          </g>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 24} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from the Sun (AU, log scale)</text>

        {/* the marker */}
        <line className="text-ink" x1={r1(mx)} y1={PY0} x2={r1(mx)} y2={PY1} stroke="currentColor" strokeWidth={0.7} opacity={0.35} />
        <circle className={iceCondenses ? "text-purple" : "text-maroon"} cx={r1(mx)} cy={r1(my)} r={5} fill="currentColor" />
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong className="text-ink">{r1(d)} AU</strong> the disk sits near <strong>{Math.round(T)} K</strong> ({Math.round(T - 273)} °C) — {iceCondenses
          ? <>cold enough that <strong className="text-purple">water freezes into ice</strong>. Rock, metal <em>and</em> abundant ice are available: bodies here grow large and fast, and become <strong className="text-purple">giants</strong>.</>
          : <>too hot for ice — <strong className="text-maroon">only rock and metal condense</strong>. With less to build from, bodies stay small: <strong className="text-maroon">rocky worlds</strong>.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Distance from the Sun</span><span className="tabular-nums">{r1(d)} AU · {Math.round(T)} K</span></span>
          <input type="range" min={0.3} max={30} step={0.05} value={d} onChange={(e) => setD(Number(e.target.value))} aria-label="Distance from the Sun in AU" className="mt-1 w-full" style={{ accentColor: iceCondenses ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Earth (1 AU)", 1.0], ["Mars (1.5 AU)", 1.52], ["Snow line (2.7 AU)", 2.7], ["Jupiter (5.2 AU)", 5.2]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setD(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        One distance divides the solar system into its two great provinces. In the young disk, temperature fell with distance from the Sun — searing close in, frigid far out (the curve is <em>T</em> = 278/√<em>d</em>, matching the equilibrium temperatures well). Rock and metal condense above 1000 K, so they can solidify <em>anywhere</em>. But <strong>water ice</strong> needs the disk to fall below about <strong>150–170 K</strong>, which happens only beyond roughly <strong className="text-ink">2.7 AU — the snow line</strong>, out in what is now the asteroid belt. Here is why that one line matters so much: water is <em>enormously</em> abundant (hydrogen and oxygen are the first and third most common elements in the universe), so crossing the snow line multiplied the available solid material several-fold. More material meant faster growth; faster growth mattered because the disk&rsquo;s gas dispersed within a few million years, and only a core reaching about ten Earth masses <em>before</em> that deadline could seize a giant envelope of hydrogen and helium. Beyond the line the race was winnable — Jupiter, Saturn, Uranus, Neptune. Inside it the cupboard was bare and the clock ran out — Mercury, Venus, Earth, Mars. Distance set the temperature; temperature set what could condense; that set how fast a world could grow; and that set what kind of world it became. <strong className="text-ink">Distance is destiny.</strong>
      </figcaption>
    </figure>
  );
}
