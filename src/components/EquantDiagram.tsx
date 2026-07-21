"use client";

import { useState } from "react";

// An interactive equant explorer, embedded in an article via a fenced ```equantdiagram
// block (see Reader's `pre` override). The equant was Ptolemy's most brilliant and most
// controversial device. The Earth sits offset from the centre of the deferent (the
// "eccentric"); the equant is a second offset point, on the opposite side of the centre.
// Ptolemy's rule: the epicycle's centre moves at UNIFORM ANGULAR SPEED as seen from the
// EQUANT — not from the centre, and not from the Earth. The dots below sit at equal
// angular steps as seen from the equant; watch how UNEVENLY they fall around the circle,
// so the motion is fast near the Earth and slow far from it. It fit the data beautifully
// — but it quietly broke the "circle dogma" of true uniform circular motion, and that
// blemish is one of the things Copernicus most wanted to remove. currentColor theming;
// first render deterministic.

const OX = 154, OY = 126, R = 84, E = 26; // centre, radius, eccentricity offset
const earth = { x: OX - E, y: OY };
const equant = { x: OX + E, y: OY };
const rad = (d: number) => (d * Math.PI) / 180;

// point where a ray from the equant at screen-angle phi meets the deferent circle
function onCircleFromEquant(phiDeg: number) {
  const d = { x: Math.cos(rad(phiDeg)), y: Math.sin(rad(phiDeg)) };
  const ux = equant.x - OX, uy = equant.y - OY; // equant relative to centre
  const b = ux * d.x + uy * d.y;
  const c = ux * ux + uy * uy - R * R; // < 0 (equant inside circle)
  const s = -b + Math.sqrt(b * b - c);
  return { x: equant.x + s * d.x, y: equant.y + s * d.y };
}

// dots at equal angular steps as seen from the equant (30° apart) — visibly uneven on circle
const STEPS = Array.from({ length: 12 }, (_, i) => i * 30);

export function EquantDiagram() {
  const [phi, setPhi] = useState(45);
  const M = onCircleFromEquant(phi);

  // angular speed on the circle around the CENTRE is non-uniform: compare a small step
  const M2 = onCircleFromEquant(phi + 3);
  const a1 = Math.atan2(M.y - OY, M.x - OX);
  const a2 = Math.atan2(M2.y - OY, M2.x - OX);
  let dCentre = a2 - a1;
  dCentre = ((dCentre + Math.PI) % (2 * Math.PI)) - Math.PI;
  const fast = Math.abs(dCentre) > rad(3); // moves faster than the uniform equant rate

  return (
    <figure className="equant-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`The epicycle centre moves uniformly as seen from the equant, but that makes its motion around the circle non-uniform — faster near the Earth, slower far from it.`}>

        {/* deferent */}
        <circle className="text-line" cx={OX} cy={OY} r={R} fill="none" stroke="currentColor" strokeWidth={1.1} opacity={0.7} />

        {/* equal-equant-angle dots — note how uneven they are around the circle */}
        {STEPS.map((s) => {
          const p = onCircleFromEquant(s);
          return <circle key={s} className="text-faint" cx={p.x} cy={p.y} r={1.8} fill="currentColor" opacity={0.7} />;
        })}

        {/* the three special points */}
        {/* centre */}
        <circle className="text-faint" cx={OX} cy={OY} r={2.2} fill="currentColor" />
        <text className="text-faint" x={OX} y={OY - 7} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">centre</text>
        {/* Earth (eccentric) */}
        <circle className="text-purple" cx={earth.x} cy={earth.y} r={4} fill="currentColor" />
        <text className="text-purple" x={earth.x} y={earth.y + 14} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
        {/* equant */}
        <circle className="text-maroon" cx={equant.x} cy={equant.y} r={4} fill="currentColor" />
        <text className="text-maroon" x={equant.x} y={equant.y + 14} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">equant</text>

        {/* the uniform-from-equant spoke to the moving epicycle centre */}
        <line className="text-maroon" x1={equant.x} y1={equant.y} x2={M.x} y2={M.y} stroke="currentColor" strokeWidth={1.3} opacity={0.85} />
        {/* the (non-uniform) view from the centre */}
        <line className="text-faint" x1={OX} y1={OY} x2={M.x} y2={M.y} stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 2" opacity={0.6} />
        {/* the epicycle centre itself */}
        <circle className={fast ? "text-maroon" : "text-ink"} cx={M.x} cy={M.y} r={4.2} fill="currentColor" />
        <text className={fast ? "text-maroon" : "text-muted"} x={M.x} y={M.y - 8} textAnchor="middle" fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">epicycle centre</text>

        <text className={fast ? "text-maroon" : "text-ink"} x={220} y={240} textAnchor="middle" fill="currentColor" fontSize={9.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {fast ? "near the Earth → moving FAST around the circle" : "far from the Earth → moving SLOW around the circle"}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        Equal steps <em>as seen from the</em> <strong className="text-maroon">equant</strong> land <strong>unevenly</strong> around the circle — so the motion is not truly uniform about the centre, only about that special offset point.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Uniform angle at the equant</span><span className="tabular-nums">{Math.round(phi)}°</span></span>
          <input type="range" min={0} max={360} step={1} value={phi} onChange={(e) => setPhi(Number(e.target.value))} aria-label="Angle at the equant" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Ptolemy&rsquo;s most brilliant and most controversial device. To match the planets&rsquo; observed speeding-up and slowing-down, he first offset the <span className="text-purple">Earth</span> from the <span className="text-faint">centre</span> of the deferent (the <em>eccentric</em>), and then introduced a second offset point — the <strong className="text-maroon">equant</strong>, on the far side of the centre — and decreed that the epicycle&rsquo;s centre sweeps out <strong>equal angles in equal times as seen from the equant.</strong> The faint dots mark equal equant-angles: see how they bunch up on the far side and spread out near the Earth, so the point races around the near part of its circle and dawdles on the far part. This fit the data superbly and let the <em>Almagest</em> predict the sky for fourteen centuries. But it was a quiet betrayal of the <em>circle dogma</em>: the motion is uniform only as seen from an arbitrary point that is <em>neither</em> the centre <em>nor</em> the Earth — so the planet does not, strictly, move uniformly around its circle at all. Purists found it a blemish for a thousand years; Copernicus would cite his wish to banish the equant, and restore <em>true</em> uniform circular motion, as a prime motive for moving the Earth. It is the most revealing crack in the ancient machine: it worked, but it wasn&rsquo;t quite <em>right</em>.
      </figcaption>
    </figure>
  );
}
