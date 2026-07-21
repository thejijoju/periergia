"use client";

import { useState } from "react";

// An interactive deferent-and-epicycle explorer, embedded in an article via a fenced
// ```epicyclemachine block (see Reader's `pre` override). This is the ancient answer
// to retrograde motion — the geometric machine Ptolemy perfected in the Almagest to
// reproduce the planets' backward loops WITHOUT moving the Earth. A large circle (the
// DEFERENT) is centred near the Earth; a smaller circle (the EPICYCLE) rides around on
// it; and the planet rides around the epicycle. The planet's path is the sum of two
// uniform circular motions — and when the planet swings through the near side of its
// epicycle, its motion runs backward against the deferent, so from the fixed Earth it
// appears to loop westward: retrograde, manufactured from perfect circles. Slide time
// and watch the epicycle carry the planet around, tracing the looping rosette; the
// planet reddens when it is in retrograde. currentColor theming; first render
// deterministic. (Compare RetrogradeSky: the SAME loops, from a moving Earth instead.)

const EX = 150, EY = 128; // Earth (centre of the deferent, near enough)
const R = 70, r = 22; // deferent and epicycle radii
const TD = 6, TE = 1; // deferent and epicycle periods (arbitrary units)
const OMD = (2 * Math.PI) / TD, OME = (2 * Math.PI) / TE;

// epicycle centre on the deferent, and the planet on the epicycle (y flipped for screen)
const centre = (t: number) => ({ x: EX + R * Math.cos(OMD * t), y: EY - R * Math.sin(OMD * t) });
const planet = (t: number) => {
  const c = centre(t);
  return { x: c.x + r * Math.cos(OME * t), y: c.y - r * Math.sin(OME * t) };
};
// apparent longitude of the planet as seen from the fixed Earth
const appLon = (t: number) => {
  const p = planet(t);
  return Math.atan2(-(p.y - EY), p.x - EX); // un-flip y so angle is in sky orientation
};

// Precompute the traced looping path over one full deferent orbit (static rosette).
const N = 361;
const PATH = (() => {
  const pts: string[] = [];
  for (let i = 0; i < N; i++) {
    const t = (TD * i) / (N - 1);
    const p = planet(t);
    pts.push(`${p.x.toFixed(1)},${p.y.toFixed(1)}`);
  }
  return pts.join(" ");
})();

export function EpicycleMachine() {
  const [t, setT] = useState(0.0);
  const c = centre(t), p = planet(t);

  // retrograde right now? apparent longitude decreasing → moving backward (westward)
  let d = appLon(t + 0.02) - appLon(t);
  d = ((d + Math.PI) % (2 * Math.PI)) - Math.PI;
  const retro = d < 0;

  return (
    <figure className="epi-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A planet rides an epicycle whose centre rides the deferent circle around the Earth; the combination traces looping retrograde motion. The planet is currently ${retro ? "in retrograde (apparently moving backward)" : "moving forward"}.`}>

        {/* the traced looping path (the rosette the planet actually follows) — the
            inward cusps ARE the retrograde loops */}
        <polyline points={PATH} className="text-muted" fill="none" stroke="currentColor" strokeWidth={1.1} opacity={0.75} strokeLinejoin="round" />

        {/* deferent */}
        <circle className="text-faint" cx={EX} cy={EY} r={R} fill="none" stroke="currentColor" strokeWidth={0.9} strokeDasharray="3 3" opacity={0.6} />
        {/* Earth at the centre */}
        <circle className="text-purple" cx={EX} cy={EY} r={4.5} fill="currentColor" />
        <text className="text-purple" x={EX} y={EY + 15} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>

        {/* deferent radius to the epicycle centre */}
        <line className="text-faint" x1={EX} y1={EY} x2={c.x} y2={c.y} stroke="currentColor" strokeWidth={0.7} opacity={0.5} />
        {/* the epicycle at its current position */}
        <circle className="text-muted" cx={c.x} cy={c.y} r={r} fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        <circle className="text-muted" cx={c.x} cy={c.y} r={2} fill="currentColor" opacity={0.7} />
        {/* epicycle radius to the planet */}
        <line className={retro ? "text-maroon" : "text-ink"} x1={c.x} y1={c.y} x2={p.x} y2={p.y} stroke="currentColor" strokeWidth={1} opacity={0.8} />

        {/* sight-line from Earth to the planet (its apparent direction in the sky) */}
        <line className={retro ? "text-maroon" : "text-ink"} x1={EX} y1={EY} x2={p.x + (p.x - EX) * 1.3} y2={p.y + (p.y - EY) * 1.3} stroke="currentColor" strokeWidth={0.7} strokeDasharray="2 2" opacity={0.55} />

        {/* the planet */}
        <circle className={retro ? "text-maroon" : "text-ink"} cx={p.x} cy={p.y} r={4} fill="currentColor" />
        <text className={retro ? "text-maroon" : "text-muted"} x={p.x} y={p.y - 7} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">planet</text>

        {/* labels */}
        <text className="text-faint" x={EX + R * 0.72} y={EY - R * 0.72} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">deferent</text>

        <text className={retro ? "text-maroon" : "text-ink"} x={220} y={238} textAnchor="middle" fill="currentColor" fontSize={10} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {retro ? "RETROGRADE — apparent backward loop" : "prograde — moving forward"}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {retro
          ? <>The planet is swinging through the <strong className="text-maroon">near side</strong> of its epicycle, so from Earth it appears to loop <strong className="text-maroon">backward</strong>.</>
          : <>The planet rides the <strong>far side</strong> of its epicycle, drifting <strong>forward</strong> against the stars.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Turn the machine</span><span className="tabular-nums">t = {t.toFixed(2)}</span></span>
          <input type="range" min={0} max={TD} step={0.02} value={t} onChange={(e) => setT(Number(e.target.value))} aria-label="Time" className="mt-1 w-full" style={{ accentColor: retro ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Ptolemy&rsquo;s answer to the backward loops, and the technical heart of the <em>Almagest</em>. Keep the <span className="text-purple">Earth</span> at rest and build the planet&rsquo;s motion from two perfect circles: a large <strong>deferent</strong> centred near the Earth, and a small <strong>epicycle</strong> whose centre rides around the deferent while the planet rides around the epicycle. Add the two uniform circular motions and the planet traces a looping <em>rosette</em> — mostly drifting forward, but kinking into a <span className="text-maroon">backward loop</span> each time it swings through the near side of its epicycle, where its motion runs opposite to the deferent&rsquo;s. That backward loop, seen from the fixed Earth, is <strong>retrograde motion</strong> — manufactured entirely from circles, with no need to move the Earth. To match the real planets precisely Ptolemy added two refinements — the <em>eccentric</em> (offsetting the Earth from the deferent&rsquo;s centre) and the <em>equant</em> (letting the motion run uniform as seen from a special offset point) — and the finished machine predicted the sky for <strong>fourteen hundred years</strong>. Compare the modern picture: the very same loop falls out for free from a moving Earth overtaking a slower planet. Two geometries, one appearance — and the deep work of the revolution to come was discovering which one is <em>true</em>.
      </figcaption>
    </figure>
  );
}
