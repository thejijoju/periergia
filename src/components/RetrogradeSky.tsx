"use client";

import { useState } from "react";

// An interactive retrograde-motion explorer, embedded in an article via a fenced
// ```retrogradesky block (see Reader's `pre` override). This is the MODERN answer to
// the puzzle that drove all of ancient astronomy: why does a planet like Mars slow,
// stop, and loop *backward* against the fixed stars? Because retrograde is an illusion
// of relative motion — the faster inner Earth periodically overtakes the slower outer
// Mars (like a fast car passing a slow one), and our line of sight to Mars swings
// backward. Left: the two orbits around the Sun, with the sight-line from Earth through
// Mars. Right: Mars's apparent position among the stars plotted against time — mostly
// drifting east (prograde), but kinking west (retrograde) exactly when Earth passes
// between the Sun and Mars (opposition). Slide time and watch the overtaking produce
// the backward loop. currentColor theming; first render deterministic.

const SUNX = 108, SUNY = 128; // Sun centre (orbital panel)
const RE = 30, RM = 62; // Earth and Mars orbit radii — DRAWING units only (spread out for legibility)
const PE = 1.0, PM = 1.881; // sidereal periods, years
// Physical orbit radii (AU) — the ~1.52 ratio is what sets the real retrograde amount,
// so the apparent-longitude physics uses these, NOT the exaggerated drawing radii.
const AE = 1.0, AM = 1.524;
const OME = (2 * Math.PI) / PE, OMM = (2 * Math.PI) / PM;
const SYN = 1 / (1 / PE - 1 / PM); // synodic period ≈ 2.14 yr — time between retrogrades
const THALF = SYN / 2; // plot one full synodic cycle, opposition (t=0) in the middle

// heliocentric positions (Sun at origin), y flipped for screen — DRAWING radii
const earth = (t: number) => ({ x: SUNX + RE * Math.cos(OME * t), y: SUNY - RE * Math.sin(OME * t) });
const mars = (t: number) => ({ x: SUNX + RM * Math.cos(OMM * t), y: SUNY - RM * Math.sin(OMM * t) });
// apparent ecliptic longitude of Mars as seen from Earth (radians) — uses PHYSICAL radii,
// so the retrograde loop has its true ~11%-of-cycle extent.
const appLon = (t: number) => {
  const xe = AE * Math.cos(OME * t), ye = AE * Math.sin(OME * t);
  const xm = AM * Math.cos(OMM * t), ym = AM * Math.sin(OMM * t);
  return Math.atan2(ym - ye, xm - xe);
};

// Precompute the apparent-longitude-vs-time trace, unwrapped so it plots as a smooth
// curve. This is static (independent of the slider); the slider just moves a marker.
const N = 121;
const TRACE = (() => {
  const pts: { t: number; lon: number }[] = [];
  let prev = 0;
  for (let i = 0; i < N; i++) {
    const t = -THALF + (2 * THALF * i) / (N - 1);
    let lon = appLon(t);
    if (i > 0) {
      // unwrap
      while (lon - prev > Math.PI) lon -= 2 * Math.PI;
      while (lon - prev < -Math.PI) lon += 2 * Math.PI;
    }
    prev = lon;
    pts.push({ t, lon });
  }
  return pts;
})();
const LON_MIN = Math.min(...TRACE.map((p) => p.lon));
const LON_MAX = Math.max(...TRACE.map((p) => p.lon));

// plot panel (apparent path vs time) — x = apparent longitude east→, y = time downward
const PX0 = 232, PX1 = 424, PY0 = 40, PY1 = 220;
const plotX = (lon: number) => PX0 + ((lon - LON_MIN) / (LON_MAX - LON_MIN)) * (PX1 - PX0);
const plotY = (t: number) => PY0 + ((t + THALF) / (2 * THALF)) * (PY1 - PY0);

const lonAt = (t: number) => {
  // sample the trace at the nearest step for the marker (keeps marker on the drawn curve)
  const i = Math.max(0, Math.min(N - 1, Math.round(((t + THALF) / (2 * THALF)) * (N - 1))));
  return TRACE[i].lon;
};

export function RetrogradeSky() {
  const [t, setT] = useState(-0.55);
  const E = earth(t), M = mars(t);
  // sight-line from Earth through Mars, extended to the far "sky"
  const dx = M.x - E.x, dy = M.y - E.y;
  const len = Math.hypot(dx, dy) || 1;
  const ux = dx / len, uy = dy / len;
  const far = { x: E.x + ux * 230, y: E.y + uy * 230 };

  // is Mars retrograde right now? compare apparent longitude to a moment just ahead
  const dLon = appLon(t + 0.02) - appLon(t);
  const dLonWrapped = ((dLon + Math.PI) % (2 * Math.PI)) - Math.PI;
  const retro = dLonWrapped < 0;

  const mp = { x: plotX(lonAt(t)), y: plotYClamp(t) };

  return (
    <figure className="retro-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Earth and Mars orbit the Sun; when the faster Earth overtakes Mars, Mars appears to move backward against the stars. Right now Mars is ${retro ? "in retrograde (moving backward)" : "moving forward (prograde)"}.`}>

        {/* ── left: the two orbits around the Sun ── */}
        <circle className="text-line" cx={SUNX} cy={SUNY} r={RE} fill="none" stroke="currentColor" strokeWidth={0.9} opacity={0.55} />
        <circle className="text-line" cx={SUNX} cy={SUNY} r={RM} fill="none" stroke="currentColor" strokeWidth={0.9} opacity={0.55} />
        {/* Sun */}
        <circle className="text-maroon" cx={SUNX} cy={SUNY} r={4.5} fill="currentColor" />
        <text className="text-faint" x={SUNX} y={SUNY + 15} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* sight-line from Earth through Mars to the distant sky */}
        <line className="text-faint" x1={E.x} y1={E.y} x2={far.x} y2={far.y} stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 2" opacity={0.7} />

        {/* Earth (inner, faster) */}
        <circle className="text-purple" cx={E.x} cy={E.y} r={3.6} fill="currentColor" />
        <text className="text-purple" x={E.x} y={E.y - 6} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
        {/* Mars (outer, slower) */}
        <circle className={retro ? "text-maroon" : "text-ink"} cx={M.x} cy={M.y} r={3.8} fill="currentColor" />
        <text className={retro ? "text-maroon" : "text-muted"} x={M.x} y={M.y - 6} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Mars</text>

        {/* ── right: apparent path against the stars, over time ── */}
        <text className="text-muted" x={PX0} y={30} fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">apparent path among the stars — east ⟶</text>
        {/* time axis label (time runs downward) */}
        <text className="text-faint" x={PX0 - 4} y={PY0 + 4} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">time ↓</text>
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={0.8} opacity={0.5} />

        {/* the apparent-longitude trace: prograde (east) with a backward retrograde kink */}
        <polyline
          className="text-ink"
          points={TRACE.map((p) => `${plotX(p.lon).toFixed(1)},${plotY(p.t).toFixed(1)}`).join(" ")}
          fill="none" stroke="currentColor" strokeWidth={1.6} opacity={0.85} strokeLinejoin="round" strokeLinecap="round"
        />
        {/* marker for the current moment */}
        <circle className={retro ? "text-maroon" : "text-purple"} cx={mp.x} cy={mp.y} r={4} fill="currentColor" />

        {/* status readout */}
        <text className={retro ? "text-maroon" : "text-purple"} x={(PX0 + PX1) / 2} y={PY1 + 20} textAnchor="middle" fill="currentColor" fontSize={10} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {retro ? "RETROGRADE — moving backward" : "prograde — moving east"}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {retro
          ? <>Earth is <strong className="text-purple">overtaking</strong> Mars on the inside track, so Mars appears to slide <strong className="text-maroon">backward</strong> against the stars.</>
          : <>Earth and Mars are on their normal march, so Mars drifts steadily <strong>eastward</strong> among the stars.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Time (years, opposition at 0)</span><span className="tabular-nums">{t >= 0 ? "+" : ""}{t.toFixed(2)} yr</span></span>
          <input type="range" min={-THALF} max={THALF} step={0.02} value={t} onChange={(e) => setT(Number(e.target.value))} aria-label="Time in years" className="mt-1 w-full" style={{ accentColor: retro ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Before (prograde)", -0.7], ["Opposition (retrograde)", 0], ["After (prograde)", 0.7]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setT(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The puzzle that built the ancient cosmos: most of the time Mars drifts slowly <em>east</em> against the fixed stars, but periodically it slows, stops, and loops <em>backward</em> (west) for weeks before resuming — <strong>retrograde motion</strong>. The modern answer is that it is an <em>illusion of relative motion</em>. Both worlds orbit the Sun, but the inner <span className="text-purple">Earth</span> moves faster and periodically <strong>overtakes</strong> the outer <span className="text-maroon">Mars</span>, like a fast car passing a slow one — and as it does, our sight-line to Mars swings backward, so Mars appears to reverse. This is exactly why retrograde always happens at <em>opposition</em> (when Earth passes between the Sun and Mars) and why Mars is then brightest (it is closest). It is elegant and correct — but notice what it needs: a <strong>moving Earth</strong>. The ancients had powerful reasons to believe the Earth stood still, so they had to reproduce this loop a different way — with pure geometry, circles upon circles, Earth at rest. That they did, and that it worked for fourteen centuries, is the achievement of Greek astronomy.
      </figcaption>
    </figure>
  );
}

// keep the marker inside the plotted band even at the slider extremes
function plotYClamp(t: number): number {
  const y = PY0 + ((t + THALF) / (2 * THALF)) * (PY1 - PY0);
  return Math.max(PY0, Math.min(PY1, y));
}
