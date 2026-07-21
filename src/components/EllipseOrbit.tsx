"use client";

import { useState } from "react";

// An interactive ellipse explorer for Kepler's First Law, embedded via a fenced
// ```ellipseorbit block (see Reader's `pre` override). An ellipse is the set of points
// whose distances to two fixed FOCI sum to a constant (2a) — draw it with two pins and a
// loop of string. Kepler's First Law: the planets move in ellipses with the SUN AT ONE
// FOCUS (the other focus is empty, marking nothing), so a planet's distance from the Sun
// varies — closest at perihelion, farthest at aphelion. Slide the eccentricity and watch
// the two foci separate; at Earth's tiny e = 0.017 the orbit is visually a perfect circle,
// which is exactly why the circle dogma survived two thousand years. currentColor
// theming; first render deterministic. (r1 + r2 = 2a is drawn constant as proof.)

const CX = 190, CY = 126, A = 140; // ellipse centre and semi-major axis (drawing units)
const PANG = 52; // parametric angle (deg) of the sample point P used to show r1 + r2 = 2a
// Round trig-derived coordinates so SSR (Node) and client (browser) render identical
// strings — Math.sin/cos may differ in the last ULP across engines, which would trip a
// React hydration mismatch on the raw attribute value.
const r3 = (n: number) => Math.round(n * 1000) / 1000;

export function EllipseOrbit() {
  const [e, setE] = useState(0.093); // eccentricity (Mars, by default — the planet that broke the circle)

  const B = r3(A * Math.sqrt(1 - e * e)); // semi-minor axis (drawing)
  const c = r3(A * e); // centre-to-focus distance (drawing)
  const sun = { x: CX + c, y: CY }; // Sun at the right focus → perihelion on the right
  const empty = { x: CX - c, y: CY }; // the empty focus
  const peri = { x: CX + A, y: CY }; // perihelion (right vertex)
  const apo = { x: CX - A, y: CY }; // aphelion (left vertex)
  // a sample point P on the ellipse, with its two focal radii (their sum is constant = 2A)
  const t = (PANG * Math.PI) / 180;
  const P = { x: r3(CX + A * Math.cos(t)), y: r3(CY - B * Math.sin(t)) };

  return (
    <figure className="ellipse-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`An ellipse of eccentricity ${e.toFixed(3)} with the Sun at one focus; the other focus is empty. At this eccentricity the short axis is ${(100 * B / A).toFixed(1)}% of the long axis.`}>

        {/* a reference circle (same semi-major axis) to show how little the ellipse departs from it */}
        <circle className="text-line" cx={CX} cy={CY} r={A} fill="none" stroke="currentColor" strokeWidth={0.7} strokeDasharray="2 3" opacity={0.35} />

        {/* the orbit ellipse */}
        <ellipse className="text-ink" cx={CX} cy={CY} rx={A} ry={B} fill="none" stroke="currentColor" strokeWidth={1.6} opacity={0.9} />

        {/* major axis, centre */}
        <line className="text-faint" x1={apo.x} y1={apo.y} x2={peri.x} y2={peri.y} stroke="currentColor" strokeWidth={0.6} opacity={0.5} />
        <circle className="text-faint" cx={CX} cy={CY} r={1.8} fill="currentColor" opacity={0.7} />
        <text className="text-faint" x={CX} y={CY + 12} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">centre</text>

        {/* the two focal radii to P — their sum is always 2a, the defining property */}
        <line className="text-maroon" x1={sun.x} y1={sun.y} x2={P.x} y2={P.y} stroke="currentColor" strokeWidth={1.1} opacity={0.85} />
        <line className="text-purple" x1={empty.x} y1={empty.y} x2={P.x} y2={P.y} stroke="currentColor" strokeWidth={1.1} opacity={0.7} strokeDasharray="3 2" />
        <circle className="text-ink" cx={P.x} cy={P.y} r={2.6} fill="currentColor" />

        {/* the Sun (occupied focus) and the empty focus */}
        <circle className="text-maroon" cx={sun.x} cy={sun.y} r={5} fill="currentColor" />
        <text className="text-maroon" x={sun.x} y={sun.y + 15} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun (focus)</text>
        <circle className="text-purple" cx={empty.x} cy={empty.y} r={3} fill="none" stroke="currentColor" strokeWidth={1.2} />
        <text className="text-purple" x={empty.x} y={empty.y + 15} textAnchor="middle" fill="currentColor" fontSize={7} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">empty focus</text>

        {/* perihelion / aphelion */}
        <circle className="text-ink" cx={peri.x} cy={peri.y} r={2.4} fill="currentColor" />
        <text className="text-muted" x={peri.x + 4} y={peri.y - 6} textAnchor="start" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">perihelion</text>
        <text className="text-muted" x={apo.x - 4} y={apo.y - 6} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">aphelion</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={352} y={40} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={600}>e = {e.toFixed(3)}</text>
          <text className="text-faint" x={352} y={56} textAnchor="middle" fill="currentColor" fontSize={7}>short/long axis</text>
          <text className={B / A > 0.97 ? "text-purple" : "text-ink"} x={352} y={72} textAnchor="middle" fill="currentColor" fontSize={13} fontWeight={800}>{(100 * B / A).toFixed(1)}%</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Sun at one focus, the other <span className="text-purple">empty</span>; the two distances to any point always sum to <strong>2a</strong>. At <strong>e = {e.toFixed(3)}</strong> the orbit is {B / A > 0.99 ? <>— to the eye — <strong className="text-purple">a perfect circle</strong>.</> : B / A > 0.95 ? <>still <strong>nearly circular</strong>.</> : <>a visibly <strong>flattened</strong> ellipse.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Eccentricity</span><span className="tabular-nums">e = {e.toFixed(3)}</span></span>
          <input type="range" min={0} max={0.7} step={0.001} value={e} onChange={(ev) => setE(Number(ev.target.value))} aria-label="Orbital eccentricity" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Earth (0.017)", 0.017], ["Mars (0.093)", 0.093], ["Mercury (0.206)", 0.206], ["Comet (0.6)", 0.6]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setE(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Kepler&rsquo;s First Law, and the break that ended two thousand years of circles. An <strong>ellipse</strong> is the set of points whose distances to two fixed <em>foci</em> sum to a constant (2a) — trace it with two pins and a taut loop of string. Kepler found that the planets move in ellipses with the <span className="text-maroon">Sun at one focus</span>, the other <span className="text-purple">focus empty</span> — so a planet&rsquo;s distance from the Sun continually changes, closest at <em>perihelion</em>, farthest at <em>aphelion</em>. But notice the eccentricities: Earth&rsquo;s is just <strong>0.017</strong>, and its orbit&rsquo;s short axis is 99.99% of its long axis — drawn to scale it is <em>indistinguishable from a circle.</em> That is exactly why the circle dogma survived so long: the orbits really are nearly circular, so circles fit almost perfectly. The ellipse hides in tiny discrepancies — and it took the most eccentric easily-seen planet (<span className="text-ink">Mars</span>, e ≈ 0.093), measured by the most precise instrument (Tycho&rsquo;s), read by the most stubborn mind (Kepler&rsquo;s), to reveal it. The empty second focus troubled Kepler — why should the Sun sit off-centre, and the other focus mark nothing? Newton would answer: an inverse-square gravity from a body <em>at the focus</em> produces exactly this ellipse.
      </figcaption>
    </figure>
  );
}
