"use client";

import { useState } from "react";

// An interactive scale-model explorer, embedded in an article via a fenced
// ```elongationdistance block (see Reader's `pre` override). This is Copernicus's most
// beautiful argument: heliocentrism doesn't just fit the sky's angles — it lets you
// MEASURE the planets' distances from the Sun. For an inner planet (Mercury, Venus),
// watch it swing to its GREATEST ELONGATION — the farthest it ever gets from the Sun in
// our sky. At that instant the Earth–planet sight-line is exactly TANGENT to the planet's
// orbit, so the Sun–planet–Earth angle is a right angle, and the planet's orbital radius
// (in Earth–Sun distances, AU) is simply the SINE of that elongation angle. Venus's 46°
// gives 0.72 AU; Mercury's 23° gives 0.39 AU — a true scale model, read straight off the
// sky. currentColor theming; first render deterministic (Venus).

const SX = 120, SY = 132, RE = 104; // Sun centre and Earth's orbit radius (drawing units)
const EX = SX + RE, EY = SY; // Earth, fixed at the right
const rad = (d: number) => (d * Math.PI) / 180;

export function ElongationDistance() {
  const [elong, setElong] = useState(46); // greatest elongation, degrees

  const auReal = Math.sin(rad(elong)); // orbital radius in AU (= sin of max elongation)
  const rP = auReal * RE; // planet orbit radius in drawing units
  // planet at the tangent point: right angle at the planet (Sun–planet–Earth)
  const P = { x: SX + rP * Math.sin(rad(elong)), y: SY - rP * Math.cos(rad(elong)) };

  return (
    <figure className="elong-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At a greatest elongation of ${elong}°, the inner planet's orbital radius is sin(${elong}°) ≈ ${auReal.toFixed(2)} AU.`}>

        {/* Earth's orbit (arc hint) and the planet's orbit */}
        <circle className="text-line" cx={SX} cy={SY} r={RE} fill="none" stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 3" opacity={0.4} />
        <circle className="text-faint" cx={SX} cy={SY} r={rP} fill="none" stroke="currentColor" strokeWidth={1} opacity={0.6} />

        {/* Sun */}
        <circle className="text-maroon" cx={SX} cy={SY} r={5} fill="currentColor" />
        <text className="text-faint" x={SX} y={SY + 16} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* the triangle: Sun–Earth, Earth–planet (tangent sight-line), Sun–planet */}
        <line className="text-faint" x1={SX} y1={SY} x2={EX} y2={EY} stroke="currentColor" strokeWidth={0.9} opacity={0.7} />
        <line className="text-purple" x1={EX} y1={EY} x2={P.x} y2={P.y} stroke="currentColor" strokeWidth={1.4} />
        <line className="text-ink" x1={SX} y1={SY} x2={P.x} y2={P.y} stroke="currentColor" strokeWidth={1.2} opacity={0.85} />

        {/* right-angle marker at the planet (Sun–planet–Earth = 90°) */}
        {(() => {
          const uS = { x: (SX - P.x), y: (SY - P.y) }, uE = { x: (EX - P.x), y: (EY - P.y) };
          const nS = Math.hypot(uS.x, uS.y), nE = Math.hypot(uE.x, uE.y);
          const a = { x: P.x + (uS.x / nS) * 9, y: P.y + (uS.y / nS) * 9 };
          const b = { x: P.x + (uE.x / nE) * 9, y: P.y + (uE.y / nE) * 9 };
          const c = { x: a.x + (uE.x / nE) * 9, y: a.y + (uE.y / nE) * 9 };
          return <polyline points={`${a.x},${a.y} ${c.x},${c.y} ${b.x},${b.y}`} className="text-ink" fill="none" stroke="currentColor" strokeWidth={0.9} opacity={0.8} />;
        })()}

        {/* elongation angle label at Earth (between the Sun-line and the sight-line) */}
        <text className="text-purple" x={EX - 30} y={EY - 10} textAnchor="end" fill="currentColor" fontSize={9} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{elong}°</text>

        {/* labels */}
        <circle className="text-purple" cx={EX} cy={EY} r={4} fill="currentColor" />
        <text className="text-purple" x={EX} y={EY + 15} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
        <circle className="text-ink" cx={P.x} cy={P.y} r={3.6} fill="currentColor" />
        <text className="text-muted" x={P.x - 6} y={P.y - 5} textAnchor="end" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">planet</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={150} fill="currentColor" fontSize={8.5} fontWeight={600}>r = sin({elong}°)</text>
          <text className="text-purple" x={300} y={174} fill="currentColor" fontSize={19} fontWeight={800}>{auReal.toFixed(2)} AU</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At greatest elongation the sight-line just grazes the orbit, so the angle at the planet is <strong>90°</strong> — and the planet&rsquo;s distance from the Sun is simply <strong className="text-purple">sin({elong}°) = {auReal.toFixed(2)} AU</strong>.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Greatest elongation (inner planet)</span><span className="tabular-nums">{elong}°</span></span>
          <input type="range" min={12} max={47} step={1} value={elong} onChange={(e) => setElong(Number(e.target.value))} aria-label="Greatest elongation angle" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Mercury (23°)", 23], ["Venus (46°)", 46]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setElong(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Copernicus&rsquo;s most beautiful argument — that heliocentrism does not merely <em>fit</em> the sky&rsquo;s angles but reveals the real <strong>scale of the solar system.</strong> An inner planet (Mercury or Venus) never strays far from the Sun; it swings out to a <em>greatest elongation</em> and no further. At that exact moment the Earth&rsquo;s sight-line to the planet is <strong>tangent</strong> to the planet&rsquo;s orbit, so the Sun–planet–Earth triangle has a right angle at the planet, and the orbital radius is just the <strong className="text-purple">sine of the elongation angle</strong>: Venus&rsquo;s 46° gives 0.72 AU, Mercury&rsquo;s 23° gives 0.39 AU. The outer planets&rsquo; distances follow from the timing of their retrogrades (the synodic-versus-sidereal beat), completing a full scale model: Mercury 0.39, Venus 0.72, Earth 1.00, Mars 1.52, Jupiter 5.2, Saturn 9.5 AU — a definite <em>order</em> and definite <em>distances</em>, read straight off the sky. The geocentric model fit the appearances but could never say how far away the planets were, or even their correct order. Heliocentrism turned the flat sky into a measured, three-dimensional solar system — powerful evidence that it captured something <em>real.</em>
      </figcaption>
    </figure>
  );
}
