"use client";

import { useState } from "react";

// An interactive apple-and-Moon explorer, embedded via a fenced ```applemoon block (see
// Reader's `pre` override). This is THE calculation of the whole revolution — Newton's
// test that the force pulling the apple down IS the force holding the Moon in orbit.
// Take surface gravity (9.8 m/s², the apple's acceleration), weaken it by the inverse
// square of distance, and slide outward: at the Moon's distance of 60 Earth-radii the
// prediction is 9.8/60² ≈ 0.0027 m/s² — exactly the acceleration the Moon actually has
// in its orbit, computed independently from its motion (4π²r/T²). One force, one law,
// heavens and Earth unified. The curve is drawn on a log scale (the fall-off spans
// 3,600×); the Moon's measured value is the dashed target line. currentColor theming;
// first render deterministic (the apple, at 1 R⊕).

const G0 = 9.8; // m/s² at the surface (d = 1 Earth radius from the centre)
const MOON_D = 60.3; // Moon's distance in Earth radii
const MOON_A = 2.72e-3; // the Moon's actual orbital acceleration, m/s² (4π²r/T²)

const PX0 = 64, PX1 = 420, PY0 = 40, PY1 = 186; // plot frame
const LGMAX = Math.log10(G0), LGMIN = Math.log10(2.2e-3);
const xOf = (d: number) => PX0 + ((d - 1) / (MOON_D - 1)) * (PX1 - PX0);
const yOf = (a: number) => PY0 + ((LGMAX - Math.log10(a)) / (LGMAX - LGMIN)) * (PY1 - PY0);
const r2 = (n: number) => Math.round(n * 100) / 100;

// the 1/d² curve, precomputed
const CURVE = (() => {
  const pts: string[] = [];
  for (let i = 0; i <= 120; i++) {
    const d = 1 + ((MOON_D - 1) * i) / 120;
    pts.push(`${r2(xOf(d))},${r2(yOf(G0 / (d * d)))}`);
  }
  return pts.join(" ");
})();

const fmt = (a: number) => (a >= 0.01 ? a.toFixed(a >= 1 ? 1 : 2) + " m/s²" : (a * 1000).toFixed(1) + " × 10⁻³ m/s²");

export function AppleMoon() {
  const [d, setD] = useState(1); // distance from Earth's centre, in Earth radii

  const a = G0 / (d * d);
  const atMoon = d > 59;

  return (
    <figure className="applemoon-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${d.toFixed(0)} Earth radii, gravity's predicted acceleration is ${fmt(a)}${atMoon ? " — matching the Moon's actual orbital acceleration" : ""}.`}>

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={0.8} opacity={0.6} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={0.8} opacity={0.6} />
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 16} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from Earth&rsquo;s centre (Earth radii)</text>
        <text className="text-faint" x={PX0 - 8} y={PY0 - 8} textAnchor="start" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">acceleration (log scale)</text>

        {/* axis ticks */}
        {[1, 10, 20, 30, 40, 50, 60].map((t) => (
          <g key={t}>
            <line className="text-line" x1={r2(xOf(t))} y1={PY1} x2={r2(xOf(t))} y2={PY1 + 3} stroke="currentColor" strokeWidth={0.7} />
            <text className="text-faint" x={r2(xOf(t))} y={PY1 + 11} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{t}</text>
          </g>
        ))}

        {/* the apple's 9.8 at the surface */}
        <circle className="text-maroon" cx={r2(xOf(1))} cy={r2(yOf(G0))} r={3} fill="currentColor" />
        <text className="text-maroon" x={r2(xOf(1)) + 6} y={r2(yOf(G0)) + 3} textAnchor="start" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">the apple: 9.8 m/s²</text>

        {/* the Moon's ACTUAL orbital acceleration — the independent target */}
        <line className="text-purple" x1={PX0} y1={r2(yOf(MOON_A))} x2={PX1} y2={r2(yOf(MOON_A))} stroke="currentColor" strokeWidth={1} strokeDasharray="4 3" opacity={0.7} />
        <text className="text-purple" x={PX1 - 4} y={r2(yOf(MOON_A)) - 5} textAnchor="end" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">the Moon&rsquo;s actual acceleration (from its motion)</text>

        {/* the inverse-square prediction curve */}
        <polyline points={CURVE} fill="none" className="text-ink" stroke="currentColor" strokeWidth={1.6} opacity={0.85} strokeLinejoin="round" />

        {/* the slider marker on the curve */}
        <line className="text-faint" x1={r2(xOf(d))} y1={r2(yOf(a))} x2={r2(xOf(d))} y2={PY1} stroke="currentColor" strokeWidth={0.7} strokeDasharray="2 2" opacity={0.6} />
        <circle className={atMoon ? "text-purple" : "text-ink"} cx={r2(xOf(d))} cy={r2(yOf(a))} r={4.5} fill="currentColor" />

        {/* the Moon at 60 R */}
        <circle className="text-faint" cx={r2(xOf(MOON_D))} cy={r2(yOf(MOON_A))} r={6} fill="none" stroke="currentColor" strokeWidth={1} opacity={0.8} />
        <text className="text-faint" x={r2(xOf(MOON_D))} y={r2(yOf(MOON_A)) + 18} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">Moon (60 R⊕)</text>

        {atMoon && (
          <text className="text-purple" x={(PX0 + PX1) / 2} y={PY0 + 10} textAnchor="middle" fill="currentColor" fontSize={11} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">THE NUMBERS MATCH — one force, one law</text>
        )}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {atMoon
          ? <>At the Moon&rsquo;s distance, the inverse-square prediction is <strong className="text-purple">{fmt(a)}</strong> — the Moon&rsquo;s actual orbital acceleration is <strong className="text-purple">2.7 × 10⁻³ m/s²</strong>. <strong>They agree to 1%.</strong></>
          : <>At <strong>{d.toFixed(0)} Earth radii</strong>, gravity weakens to <strong>{fmt(a)}</strong> — a factor of {Math.round(d * d).toLocaleString("en-US")} below the surface. Keep sliding to the Moon…</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Distance from Earth&rsquo;s centre</span><span className="tabular-nums">{d.toFixed(0)} R⊕</span></span>
          <input type="range" min={1} max={60.3} step={0.1} value={d} onChange={(e) => setD(Number(e.target.value))} aria-label="Distance in Earth radii" className="mt-1 w-full" style={{ accentColor: atMoon ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["The apple (1 R⊕)", 1], ["Halfway (30 R⊕)", 30], ["The Moon (60 R⊕)", 60.3]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setD(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The calculation at the heart of the whole revolution. Newton asked: does the force that pulls the <span className="text-maroon">apple</span> down reach all the way to the <span className="text-purple">Moon</span>? His test: take gravity at the Earth&rsquo;s surface — 9.8 m/s², the apple&rsquo;s acceleration — and weaken it by the <strong>inverse square</strong> of distance. The Moon sits about 60 Earth-radii away, so gravity there should be 60² ≈ 3,600 times weaker: about <strong>2.7 × 10⁻³ m/s².</strong> Now compute, <em>completely independently</em>, the acceleration the Moon actually has in its orbit — pure geometry, from its orbital size and 27.3-day period (a = 4π²r/T²): also <strong>2.7 × 10⁻³ m/s².</strong> The two numbers, from utterly different sources, agree to one percent. This is not coincidence — it is proof that the force pulling the apple to the ground and the force holding the Moon in the sky are <strong>one and the same force</strong>, obeying one inverse-square law. The Moon is <em>falling</em>, exactly like the apple — just moving sideways fast enough to keep missing the Earth. With this one checkable calculation, the two-thousand-year wall between the heavens and the Earth fell.
      </figcaption>
    </figure>
  );
}
