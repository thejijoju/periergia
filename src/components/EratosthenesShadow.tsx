"use client";

import { useState } from "react";

// An interactive Eratosthenes explorer, embedded in an article via a fenced
// ```eratosthenesshadow block (see Reader's `pre` override). Around 240 BC Eratosthenes
// measured the size of the whole Earth with a stick, a shadow, and geometry. At noon on
// the solstice the Sun stood directly overhead at Syene (a vertical gnomon cast no
// shadow) but ~7.2° from overhead at Alexandria to the north. Because the Sun's rays are
// effectively parallel, that shadow angle equals the central angle between the two cities
// — and 7.2° is 1/50 of a circle, so the Alexandria–Syene distance is 1/50 of Earth's
// circumference. Slide the measured shadow angle and watch the inferred circumference
// change; at ~7.2° it lands within a few percent of the true value. currentColor
// theming; first render deterministic (the real 7.2°).

const OX = 138, OY = 130, R = 82; // Earth centre and radius (drawing units)
const DIST_KM = 843; // Alexandria–Syene along the meridian (≈ the classic 5,000 stadia)
const TRUE_KM = 40075; // true equatorial circumference

const rad = (d: number) => (d * Math.PI) / 180;

export function EratosthenesShadow() {
  const [theta, setTheta] = useState(7.2); // measured shadow angle at Alexandria, degrees

  const circ = (DIST_KM * 360) / theta; // inferred Earth circumference, km
  const errPct = ((circ - TRUE_KM) / TRUE_KM) * 100;

  // Syene sits where the Sun is overhead: put it at the top of the globe (rays vertical).
  // Alexandria sits theta degrees around the globe, to the (drawing-)left of Syene.
  const syene = { x: OX, y: OY - R };
  const aAng = 90 + theta; // measured from +x axis, going counter-clockwise from the top
  const alex = { x: OX + R * Math.cos(rad(aAng)), y: OY - R * Math.sin(rad(aAng)) };
  // outward gnomon (a short stick standing straight up from the surface = radial)
  const gno = (p: { x: number; y: number }, k: number) => ({
    x: OX + ((p.x - OX) / R) * (R + k),
    y: OY + ((p.y - OY) / R) * (R + k),
  });
  const syTip = gno(syene, 22), alTip = gno(alex, 22);

  return (
    <figure className="erat-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A shadow angle of ${theta.toFixed(1)} degrees between two cities a known distance apart implies an Earth circumference of about ${Math.round(circ).toLocaleString("en-US")} km.`}>

        {/* the Earth */}
        <circle className="text-line" cx={OX} cy={OY} r={R} fill="none" stroke="currentColor" strokeWidth={1.1} opacity={0.7} />
        {/* centre + the two radii (their central angle equals the shadow angle) */}
        <circle className="text-faint" cx={OX} cy={OY} r={2} fill="currentColor" />
        <line className="text-faint" x1={OX} y1={OY} x2={syene.x} y2={syene.y} stroke="currentColor" strokeWidth={0.7} strokeDasharray="2 2" opacity={0.6} />
        <line className="text-faint" x1={OX} y1={OY} x2={alex.x} y2={alex.y} stroke="currentColor" strokeWidth={0.7} strokeDasharray="2 2" opacity={0.6} />
        {/* the central-angle marker */}
        <path
          d={`M ${OX + 20 * Math.cos(rad(90))} ${OY - 20 * Math.sin(rad(90))} A 20 20 0 0 0 ${OX + 20 * Math.cos(rad(aAng))} ${OY - 20 * Math.sin(rad(aAng))}`}
          className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.2} />
        <text className="text-purple" x={OX - 6} y={OY - 26} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{theta.toFixed(1)}°</text>

        {/* parallel Sun rays coming straight down onto the top of the globe */}
        {[-30, -10, 10, 30].map((dx) => (
          <line key={dx} className="text-maroon" x1={OX + dx} y1={18} x2={OX + dx} y2={OY - R - 6} stroke="currentColor" strokeWidth={0.9} opacity={0.7} markerEnd="" />
        ))}
        <text className="text-maroon" x={OX + 44} y={26} textAnchor="start" fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">parallel Sun rays</text>

        {/* Syene — Sun overhead, gnomon casts no shadow */}
        <line className="text-ink" x1={syene.x} y1={syene.y} x2={syTip.x} y2={syTip.y} stroke="currentColor" strokeWidth={1.6} />
        <circle className="text-ink" cx={syene.x} cy={syene.y} r={2.4} fill="currentColor" />
        <text className="text-muted" x={syene.x + 8} y={syene.y - 10} textAnchor="start" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Syene</text>
        <text className="text-faint" x={syene.x + 8} y={syene.y - 1} textAnchor="start" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">no shadow</text>

        {/* Alexandria — gnomon tilted vs the rays by theta, casts a shadow */}
        <line className="text-ink" x1={alex.x} y1={alex.y} x2={alTip.x} y2={alTip.y} stroke="currentColor" strokeWidth={1.6} />
        <circle className="text-ink" cx={alex.x} cy={alex.y} r={2.4} fill="currentColor" />
        {/* the Sun ray at Alexandria (vertical) and the shadow angle between it and the gnomon */}
        <line className="text-maroon" x1={alTip.x} y1={alTip.y} x2={alTip.x} y2={alTip.y + 26} stroke="currentColor" strokeWidth={0.9} strokeDasharray="2 2" opacity={0.8} />
        <text className="text-muted" x={alex.x - 8} y={alex.y + 4} textAnchor="end" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Alexandria</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={150} fill="currentColor" fontSize={8.5} fontWeight={600}>circumference ≈</text>
          <text className="text-purple" x={300} y={172} fill="currentColor" fontSize={17} fontWeight={800}>{Math.round(circ / 100) * 100 >= 1000 ? (Math.round(circ / 100) / 10).toFixed(1) + "k km" : Math.round(circ) + " km"}</text>
          <text className={Math.abs(errPct) < 8 ? "text-purple" : "text-faint"} x={300} y={190} fill="currentColor" fontSize={8} fontWeight={600}>{errPct >= 0 ? "+" : ""}{errPct.toFixed(0)}% vs. true</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A shadow angle of <strong className="text-purple">{theta.toFixed(1)}°</strong> over {DIST_KM} km implies an Earth about <strong className="text-purple">{(circ / 1000).toFixed(1)}k km</strong> around — {Math.abs(errPct) < 8 ? <>within a few percent of the truth.</> : <>off the true {(TRUE_KM / 1000).toFixed(0)}k km by {Math.abs(errPct).toFixed(0)}%.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Measured shadow angle at Alexandria</span><span className="tabular-nums">{theta.toFixed(1)}°</span></span>
          <input type="range" min={3} max={15} step={0.1} value={theta} onChange={(e) => setTheta(Number(e.target.value))} aria-label="Shadow angle in degrees" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Eratosthenes' 7.2°", 7.2]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setTheta(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        One of the most beautiful measurements in the history of science — the size of the entire planet, from a stick and a shadow. Around 240 BC <strong>Eratosthenes</strong> knew that at noon on the summer solstice the Sun stood directly overhead at <span className="text-ink">Syene</span> (a vertical gnomon — the shadow-stick of L2 — cast no shadow, and sunlight reached the bottom of a well). At the same moment in <span className="text-ink">Alexandria</span>, due north, a gnomon cast a shadow showing the Sun about <strong className="text-purple">7.2°</strong> from vertical. Because the Sun is so distant its rays arrive essentially <em>parallel</em>, that shadow angle equals the <em>central angle</em> between the two cities (alternate angles across parallel lines). And 7.2° is exactly 1/50 of a full 360° circle — so the known Alexandria–Syene distance must be 1/50 of the Earth&rsquo;s whole circumference. Multiply by fifty and you have measured the world, to within a few percent, without leaving Egypt. This is the caliber of mind that built the ancient cosmos: the same civilization that placed the Earth at the center also weighed its size with a shadow.
      </figcaption>
    </figure>
  );
}
