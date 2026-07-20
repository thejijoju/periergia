"use client";

import { useState } from "react";

// An interactive orbital-decay-lifetime explorer, embedded in an article via a
// fenced ```debrislifetime block (see Reader's `pre` override). Atmospheric drag
// falls off roughly exponentially with altitude, so how long a piece of debris
// lingers before it burns up climbs from days in the low hundreds of km to
// millennia above 1000 km. Slide the altitude and watch the lifetime cross from
// the self-cleaning zone (below ~600 km, where drag is the commons' free janitor)
// into the danger band (800–1200 km, where debris persists for centuries and the
// Kessler cascade has no brake). Log lifetime axis. currentColor theming
// (light/dark); first render deterministic (800 km).

// Anchor points (altitude km → decay lifetime, years), log-interpolated.
const ANCHORS: [number, number][] = [
  [200, 0.01], [300, 0.3], [400, 2], [500, 8], [600, 25], [700, 60],
  [800, 150], [900, 400], [1000, 1000], [1100, 3000], [1200, 9000], [1400, 40000],
];

function lifetimeYears(alt: number): number {
  const A = ANCHORS;
  if (alt <= A[0][0]) return A[0][1];
  if (alt >= A[A.length - 1][0]) return A[A.length - 1][1];
  for (let i = 0; i < A.length - 1; i++) {
    const [x0, y0] = A[i], [x1, y1] = A[i + 1];
    if (alt >= x0 && alt <= x1) {
      const f = (alt - x0) / (x1 - x0);
      return Math.pow(10, Math.log10(y0) + f * (Math.log10(y1) - Math.log10(y0)));
    }
  }
  return A[A.length - 1][1];
}

const ALT_LO = 200, ALT_HI = 1400;
const YLOG_LO = -2, YLOG_HI = 4.6; // 0.01 yr … ~40,000 yr

const X0 = 46, X1 = 424, Y0 = 14, Y1 = 196;
const px = (alt: number) => X0 + ((alt - ALT_LO) / (ALT_HI - ALT_LO)) * (X1 - X0);
const py = (yr: number) =>
  Y1 - ((Math.min(YLOG_HI, Math.max(YLOG_LO, Math.log10(yr))) - YLOG_LO) / (YLOG_HI - YLOG_LO)) * (Y1 - Y0);

function curvePath(): string {
  const N = 120;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const alt = ALT_LO + (i / N) * (ALT_HI - ALT_LO);
    d += `${i === 0 ? "M" : "L"}${px(alt).toFixed(1)} ${py(lifetimeYears(alt)).toFixed(1)}`;
  }
  return d;
}

function fmtLife(yr: number): string {
  if (yr < 1) return `${Math.round(yr * 365)} days`;
  if (yr < 1000) return `${Math.round(yr)} years`;
  return `${(Math.round(yr / 1000) * 1000).toLocaleString()} years`;
}

export function DebrisLifetime() {
  const [alt, setAlt] = useState(800);
  const life = lifetimeYears(alt);
  const zone = alt < 600 ? "self-cleaning" : alt < 800 ? "borderline" : "danger";

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Debris at ${alt} km takes about ${fmtLife(life)} to decay.`}>
        {/* zone shading */}
        <rect className="text-purple" x={px(ALT_LO)} y={Y0} width={px(600) - px(ALT_LO)} height={Y1 - Y0}
          fill="currentColor" opacity={0.08} />
        <rect className="text-maroon" x={px(800)} y={Y0} width={px(1200) - px(800)} height={Y1 - Y0}
          fill="currentColor" opacity={0.1} />
        <text className="text-purple" x={(px(ALT_LO) + px(600)) / 2} y={Y0 + 11} textAnchor="middle"
          fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          self-cleaning
        </text>
        <text className="text-maroon" x={(px(800) + px(1200)) / 2} y={Y0 + 11} textAnchor="middle"
          fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          Kessler danger band
        </text>

        {/* 25-year guideline */}
        <line className="text-ink" x1={X0} y1={py(25)} x2={X1} y2={py(25)} stroke="currentColor"
          strokeWidth={1} strokeDasharray="4 3" opacity={0.5} />
        <text className="text-muted" x={X0 + 3} y={py(25) - 3} fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">25-yr rule</text>

        {/* axes */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        <path className="text-ink" d={curvePath()} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />

        {/* dot + guides */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(alt)} y1={py(life)} x2={px(alt)} y2={Y1} />
          <line x1={X0} y1={py(life)} x2={px(alt)} y2={py(life)} />
        </g>
        <circle className={zone === "danger" ? "text-maroon" : zone === "self-cleaning" ? "text-purple" : "text-ink"}
          cx={px(alt)} cy={py(life)} r={4.5} fill="currentColor" />

        {/* labels */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">altitude (km) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>
            decay time (log)
          </text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(400)} y={Y1 + 12} textAnchor="middle">400</text>
          <text x={px(800)} y={Y1 + 12} textAnchor="middle">800</text>
          <text x={px(1200)} y={Y1 + 12} textAnchor="middle">1200</text>
          <text x={X0 - 4} y={py(1) + 3} textAnchor="end">1 yr</text>
          <text x={X0 - 4} y={py(100) + 3} textAnchor="end">100</text>
          <text x={X0 - 4} y={py(10000) + 3} textAnchor="end">10k</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Debris at <strong className="tabular-nums">{alt} km</strong> lingers about{" "}
        <span className={`font-semibold ${zone === "danger" ? "text-maroon" : zone === "self-cleaning" ? "text-purple" : "text-ink"}`}>
          {fmtLife(life)}
        </span>{" "}
        {zone === "self-cleaning"
          ? <>— drag scrubs it clean before it can cascade.</>
          : zone === "danger"
          ? <><strong className="text-maroon">— centuries with no janitor. This is where Kessler runs away.</strong></>
          : <>— on the edge of what the atmosphere can clear.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Altitude</span><span className="tabular-nums">{alt} km</span>
          </span>
          <input type="range" min={ALT_LO} max={ALT_HI} step={10} value={alt}
            onChange={(e) => setAlt(Number(e.target.value))}
            aria-label="Altitude" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setAlt(400)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            ISS (400 km)
          </button>
          <button type="button" onClick={() => setAlt(800)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Sun-sync / megaconstellations (800 km)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Atmospheric density falls off roughly exponentially with altitude, so orbital-decay lifetime climbs from <em>days</em> in the low hundreds of km to <em>millennia</em> above 1000 km. Below ~600 km, drag is the commons&rsquo; free janitor — fragments decay before they can cascade, so the ISS sits in a <span className="text-purple">self-cleaning</span> zone. But the <span className="text-maroon">800–1200 km band</span> — cruelly, exactly where sun-synchronous imaging, communications and megaconstellations crowd in — has no natural cleanup, so debris there persists for centuries and a Kessler cascade, once lit, has no brake. The orbits humanity most wants to use are the ones the atmosphere cannot reach. Lifetimes are order-of-magnitude; real values swing with solar activity and the object&rsquo;s mass-to-area ratio.
      </figcaption>
    </figure>
  );
}
