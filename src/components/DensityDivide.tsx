"use client";

import { useState } from "react";

// An interactive density-fossil explorer, embedded via a fenced ```densitydivide block
// (see Reader's `pre` override). The snow line left marks we can still read, and this is
// the most convincing one. Plot each world's DENSITY against its distance and the two
// families fall out cleanly: the inner planets are dense rock and iron (3,900–5,500
// kg/m^3), the outer ones light hydrogen, helium, and ice (690–1,640 — Saturn is less
// dense than water). Then flip to Jupiter's Galilean moons and watch the SAME pattern
// appear in miniature: density falling monotonically with distance from Jupiter, because
// Jupiter was hot and had its own condensation gradient. One mechanism, two scales ten
// thousandfold apart. All point positions are baked literals (log-distance of fixed
// values) for byte-identical SSR/client markup; currentColor theming; first render shows
// the solar system.

const PX0 = 48, PX1 = 418, PY0 = 30, PY1 = 150; // plot box
const WATER_Y = 130; // density = 1,000 kg/m^3
type Mode = "solar" | "jupiter";

// [label, x, y, density] — positions pre-computed (see note above)
const SOLAR: [string, number, number, number][] = [
  ["Mercury", 67.8, 41.5, 5427], ["Venus", 116.4, 45.1, 5243], ["Earth", 141.6, 39.7, 5514], ["Mars", 174.4, 71.3, 3933],
  ["Jupiter", 269.8, 123.5, 1326], ["Saturn", 317.3, 136.3, 687], ["Uranus", 371.3, 124.6, 1271], ["Neptune", 406.2, 117.2, 1638],
];
const SNOW_X = 218.8;
const SOLAR_TICKS: [string, number][] = [["0.3", 48], ["1", 141.6], ["3", 227], ["10", 320.6], ["30", 406]];

const JUP: [string, number, number, number][] = [
  ["Io", 86.5, 32, 5900], ["Europa", 182.4, 89.8, 3010], ["Ganymede", 278.8, 111.2, 1940], ["Callisto", 395.4, 113.4, 1830],
];
const JUP_TICKS: [string, number][] = [["400", 75.6], ["700", 191.1], ["1,000", 264.8], ["2,000", 407.9]];

export function DensityDivide() {
  const [mode, setMode] = useState<Mode>("solar");
  const solar = mode === "solar";
  const pts = solar ? SOLAR : JUP;
  const ticks = solar ? SOLAR_TICKS : JUP_TICKS;

  return (
    <figure className="density-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={solar
          ? "Planet density versus distance: the inner four are dense rock (3,900–5,500 kg/m³), the outer four are light gas and ice (690–1,640), split cleanly at the snow line."
          : "Galilean moon density versus distance from Jupiter, falling monotonically from Io (5,900) to Callisto (1,830) — the snow-line pattern in miniature."}>

        {/* density gridlines: 6000, 3000, water */}
        {[[6000, 30], [3000, 90]].map(([d, y]) => (
          <g key={d}>
            <line className="text-line" x1={PX0} y1={y} x2={PX1} y2={y} stroke="currentColor" strokeWidth={0.5} opacity={0.3} />
            <text className="text-faint" x={PX0 - 4} y={y + 3} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">{(d as number).toLocaleString("en-US")}</text>
          </g>
        ))}
        {/* the water line — Saturn drops below it */}
        <line className="text-purple" x1={PX0} y1={WATER_Y} x2={PX1} y2={WATER_Y} stroke="currentColor" strokeWidth={0.8} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-purple" x={PX1 - 2} y={WATER_Y - 3} textAnchor="end" fill="currentColor" fontSize={6.2} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.9}>density of water (1,000)</text>

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={PX0 - 30} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={6.6} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 30} ${(PY0 + PY1) / 2})`}>density (kg/m³)</text>
        {ticks.map(([lbl, x]) => (
          <text key={lbl} className="text-faint" x={x} y={PY1 + 11} textAnchor="middle" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">{lbl}</text>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 22} textAnchor="middle" fill="currentColor" fontSize={6.8} fontFamily="ui-sans-serif, system-ui, sans-serif">{solar ? "distance from the Sun (AU, log scale)" : "distance from Jupiter (thousand km, log scale)"}</text>

        {/* snow line (solar mode only) */}
        {solar && (
          <g>
            <line className="text-ink" x1={SNOW_X} y1={PY0} x2={SNOW_X} y2={PY1} stroke="currentColor" strokeWidth={1.3} strokeDasharray="4 3" />
            <text className="text-ink" x={SNOW_X} y={PY0 - 3} textAnchor="middle" fill="currentColor" fontSize={7} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">snow line</text>
          </g>
        )}

        {/* the data points */}
        {pts.map(([name, x, y, d]) => {
          const rocky = d >= 3000;
          return (
            <g key={name}>
              <circle className={rocky ? "text-maroon" : "text-purple"} cx={x} cy={y} r={4.5} fill="currentColor" />
              <text className={rocky ? "text-maroon" : "text-purple"} x={x} y={y - 7} textAnchor="middle" fill="currentColor" fontSize={6.6} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{name}</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {solar
          ? <>The eight planets split cleanly at the snow line: <strong className="text-maroon">dense rock inside</strong> (3,900–5,500 kg/m³), <strong className="text-purple">light gas and ice outside</strong> (690–1,640). <strong>Saturn floats.</strong></>
          : <>The same fall, in miniature: Jupiter&rsquo;s moons drop from <strong className="text-maroon">bone-dry Io</strong> (5,900) to <strong className="text-purple">half-ice Callisto</strong> (1,830) — its own snow line, ten thousand times smaller.</>}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {(["solar", "jupiter"] as Mode[]).map((m) => (
          <button key={m} type="button" onClick={() => setMode(m)}
            className={`font-sans text-[12px] rounded-md border px-3 py-1 transition-colors ${mode === m ? "border-ink text-ink font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {m === "solar" ? "the eight planets" : "Jupiter's moons (the same, in miniature)"}
          </button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The snow line is not a story we impose on the solar system — it is a boundary we can still <em>see</em>, and the densities of the worlds are its clearest fossil. Plot each planet&rsquo;s density against its distance and the two families separate with no overlap and nothing in between: the inner four run <strong className="text-maroon">3,900–5,500 kg/m³</strong>, exactly what rock and iron give; the outer four run <strong className="text-purple">690–1,640</strong>, exactly what hydrogen, helium, and ice give — and <strong>Saturn, at 687 kg/m³, is less dense than water:</strong> a world 95 times Earth&rsquo;s mass that would float. Now flip to Jupiter&rsquo;s Galilean moons. Jupiter formed hot, wrapped in its own miniature disk with its own temperature gradient — so it should have imposed its own condensation sequence, and it did: density falls monotonically outward, from bone-dry <strong className="text-maroon">Io</strong> (5,900, the most volcanic body in the solar system, no water at all) through <strong>Europa</strong> and <strong>Ganymede</strong> to half-ice <strong className="text-purple">Callisto</strong> (1,830). This is the most compelling evidence of all, because it is not the same event seen twice but an <em>independent instance</em> of the same mechanism — the theory says any hot central body with a disk imposes a condensation gradient on what forms around it, and Jupiter&rsquo;s system, ten thousand times smaller, shows precisely that.
      </figcaption>
    </figure>
  );
}
