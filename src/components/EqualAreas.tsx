"use client";

import { useState } from "react";

// An interactive equal-areas explorer for Kepler's Second Law, embedded via a fenced
// ```equalareas block (see Reader's `pre` override). Kepler's Second Law: the line from
// the Sun to a planet sweeps out EQUAL AREAS in EQUAL TIMES. The orbit below is divided
// into 12 equal-TIME segments; the wedges from the Sun all have EQUAL AREA, but they are
// fat and angularly wide near the Sun (perihelion) and thin and narrow far away
// (aphelion) — which means the planet must move FAST when close to the Sun and SLOW when
// far. This replaced Ptolemy's artificial equant with a real law, and secretly encodes
// the conservation of angular momentum. Slide time to move the planet and watch its speed
// change. currentColor theming; first render deterministic. Positions come from solving
// Kepler's equation M = E − e·sin E (Newton iteration), so the timing is physically exact.

const CX = 168, CY = 126, A = 128; // ellipse centre and semi-major axis (drawing units)
const E_ECC = 0.5; // a deliberately eccentric orbit so the effect is vivid (like a comet)
const N = 12; // equal-time segments

const B = A * Math.sqrt(1 - E_ECC * E_ECC);
const SUN = { x: CX + A * E_ECC, y: CY }; // Sun at the right focus (perihelion on the right)

// solve Kepler's equation M = E - e sin E for the eccentric anomaly E (Newton's method)
function eccentricAnomaly(M: number): number {
  let E = M;
  for (let i = 0; i < 12; i++) E = E - (E - E_ECC * Math.sin(E) - M) / (1 - E_ECC * Math.cos(E));
  return E;
}
// Round coordinates to 3 decimals so SSR (Node) and client (browser) render byte-identical
// strings — Math.sin/cos are not guaranteed bit-identical across engines, and the raw
// last-ULP difference would otherwise trip a React hydration mismatch.
const r3 = (n: number) => Math.round(n * 1000) / 1000;
// screen position on the orbit at mean anomaly M (i.e. at a given fraction of the period)
function posAt(M: number) {
  const E = eccentricAnomaly(M);
  return { x: r3(CX + A * Math.cos(E)), y: r3(CY - B * Math.sin(E)) };
}

// the 12 equal-time division points (equal steps in mean anomaly = equal time)
const MARKS = Array.from({ length: N }, (_, i) => posAt((2 * Math.PI * i) / N));

export function EqualAreas() {
  const [frac, setFrac] = useState(0.06); // fraction of the period elapsed (0..1)
  const M = frac * 2 * Math.PI;
  const planet = posAt(M);

  // which equal-time segment are we in? (for the "fast/slow" readout)
  const seg = Math.floor(frac * N) % N;
  // near perihelion (segment 0 or 11) the planet is fast; near aphelion (5,6) it is slow
  const near = Math.min(seg, N - seg);
  const fast = near <= 2;

  return (
    <figure className="area-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`An elliptical orbit divided into 12 equal-time wedges of equal area; the planet moves ${fast ? "fast near the Sun" : "slowly far from the Sun"}.`}>

        {/* the 12 equal-area wedges from the Sun (alternating shade) */}
        {MARKS.map((p, i) => {
          const q = MARKS[(i + 1) % N];
          return (
            <polygon key={i} points={`${SUN.x},${SUN.y} ${p.x},${p.y} ${q.x},${q.y}`}
              className={i % 2 === 0 ? "text-maroon" : "text-purple"} fill="currentColor" opacity={i % 2 === 0 ? 0.16 : 0.1}
              stroke="currentColor" strokeWidth={0.4} />
          );
        })}

        {/* the orbit ellipse */}
        <ellipse className="text-ink" cx={CX} cy={CY} rx={A} ry={B} fill="none" stroke="currentColor" strokeWidth={1.4} opacity={0.9} />

        {/* division points */}
        {MARKS.map((p, i) => (
          <circle key={i} className="text-faint" cx={p.x} cy={p.y} r={1.6} fill="currentColor" opacity={0.8} />
        ))}

        {/* the Sun at the focus */}
        <circle className="text-maroon" cx={SUN.x} cy={SUN.y} r={5} fill="currentColor" />
        <text className="text-maroon" x={SUN.x} y={SUN.y + 15} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* the sweeping line and the planet */}
        <line className={fast ? "text-ink" : "text-muted"} x1={SUN.x} y1={SUN.y} x2={planet.x} y2={planet.y} stroke="currentColor" strokeWidth={1.2} />
        <circle className={fast ? "text-maroon" : "text-purple"} cx={planet.x} cy={planet.y} r={4.2} fill="currentColor" />

        {/* labels */}
        <text className="text-faint" x={CX + A + 4} y={CY - 5} textAnchor="start" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">perihelion</text>
        <text className="text-faint" x={CX - A - 4} y={CY - 5} textAnchor="end" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">aphelion</text>

        <text className="text-muted" x={350} y={40} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">12 wedges,</text>
        <text className="text-muted" x={350} y={52} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">equal area = equal time</text>
        <text className={fast ? "text-maroon" : "text-purple"} x={350} y={74} textAnchor="middle" fill="currentColor" fontSize={13} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{fast ? "FAST" : "slow"}</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Every wedge holds the <strong>same area</strong> and takes the <strong>same time</strong> — so near the Sun the planet must race across a wide wedge (<strong className="text-maroon">fast</strong>), and far away it crawls across a narrow one (<strong className="text-purple">slow</strong>).
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Time (fraction of one orbit)</span><span className="tabular-nums">{(frac * 100).toFixed(0)}%</span></span>
          <input type="range" min={0} max={1} step={0.005} value={frac} onChange={(e) => setFrac(Number(e.target.value))} aria-label="Fraction of the orbital period" className="mt-1 w-full" style={{ accentColor: fast ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Kepler&rsquo;s Second Law — the law of <strong>equal areas.</strong> A line from the <span className="text-maroon">Sun</span> to the planet sweeps out equal areas in equal times: the orbit here is cut into twelve wedges of <em>equal area</em>, each swept in an equal slice of time. But equal area does not mean equal angle. Near the Sun (perihelion) the line is short, so to enclose a full wedge the planet must swing through a <em>wide</em> arc — it moves <strong className="text-maroon">fast.</strong> Far from the Sun (aphelion) the line is long, so the same area needs only a <em>narrow</em> arc — it moves <strong className="text-purple">slow.</strong> Earth itself runs about 3.4% faster at perihelion (early January) than at aphelion (early July). This natural law swept away Ptolemy&rsquo;s artificial <em>equant</em> — the fake point invented to fudge the planets&rsquo; varying speed — replacing a fourteen-hundred-year-old kludge with a principle of real elegance. And hidden inside it is one of the deepest facts in physics: equal areas is exactly the <strong>conservation of angular momentum</strong>, because the Sun&rsquo;s gravity pulls straight toward the Sun and so exerts no twisting torque. Kepler found the pattern in Tycho&rsquo;s data; the physics underneath waited for Newton.
      </figcaption>
    </figure>
  );
}
