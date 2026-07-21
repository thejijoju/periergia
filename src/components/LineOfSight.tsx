"use client";

import { useState } from "react";

// An interactive directions-but-not-distances explorer, embedded in an article via
// a fenced ```lineofsight block (see Reader's `pre` override). The deepest lesson
// of the first lecture: the celestial sphere records the DIRECTION to a star but
// not its DISTANCE. Three stars at wildly different depths line up, from Earth,
// into a tidy little pattern — an asterism — on the sphere of directions. Slide the
// middle star's true distance in or out along its sight-line and watch its position
// on the sky never budge: the sphere simply cannot see depth. Reveal the true
// distances and the flat pattern scatters into space. currentColor theming; first
// render deterministic.

const EX = 220, EY = 224; // Earth / observer
const RS = 150; // radius of the celestial sphere (of directions)
const rad = (d: number) => (d * Math.PI) / 180;
// three sight-lines, angle measured from straight up (+ to the right)
const DIRS = [-24, -2, 22];
const FIXED = [78, 96]; // true distances of stars A and C (screen units)

const dir = (d: number) => ({ sx: Math.sin(rad(d)), sy: -Math.cos(rad(d)) });
const at = (angle: number, dist: number) => {
  const u = dir(angle);
  return { x: EX + dist * u.sx, y: EY + dist * u.sy };
};
const onSphere = (angle: number) => at(angle, RS);
// pretend light-year label for a screen distance
const ly = (d: number) => Math.round(d * 6);

export function LineOfSight() {
  const [mid, setMid] = useState(60); // middle star's true distance
  const [reveal, setReveal] = useState(false);

  const dists = [FIXED[0], mid, FIXED[1]];
  const stars = DIRS.map((a, i) => ({ ...at(a, dists[i]), a, d: dists[i] }));
  const ticks = DIRS.map((a) => onSphere(a));
  const arc = `M${onSphere(-34).x} ${onSphere(-34).y} A ${RS} ${RS} 0 0 1 ${onSphere(34).x} ${onSphere(34).y}`;
  const patternPath = ticks.map((t, i) => `${i ? "L" : "M"}${t.x.toFixed(1)} ${t.y.toFixed(1)}`).join(" ");
  const label = ["A", "B", "C"];

  return (
    <figure className="los-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Three stars at different true distances project to the same fixed pattern on the celestial sphere; the middle star's distance can change without moving its place in the sky.`}>
        {/* the celestial sphere of directions */}
        <path d={arc} className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.4} opacity={reveal ? 0.25 : 0.9} strokeDasharray="2 3" />
        <text className="text-purple" x={onSphere(34).x - 4} y={onSphere(34).y + 10} textAnchor="end" fill="currentColor"
          fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={reveal ? 0.4 : 1}>celestial sphere (directions)</text>

        {/* sight-lines from Earth out to the sphere */}
        {DIRS.map((a, i) => {
          const t = onSphere(a);
          return <line key={i} className="text-line" x1={EX} y1={EY} x2={t.x} y2={t.y} stroke="currentColor" strokeWidth={1} strokeDasharray="2 2" opacity={0.55} />;
        })}

        {/* the pattern the three make on the sphere */}
        <path d={patternPath} className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.6} opacity={reveal ? 0.3 : 0.9} />
        {ticks.map((t, i) => (
          <circle key={i} cx={t.x} cy={t.y} r={3.2} className="text-purple" fill="currentColor" opacity={reveal ? 0.35 : 1} />
        ))}

        {/* the true star positions in space */}
        {stars.map((s, i) => (
          <g key={i}>
            <circle cx={s.x} cy={s.y} r={reveal ? 5 : 3.4} className={i === 1 ? "text-maroon" : "text-ink"} fill="currentColor" />
            {reveal && (
              <text x={s.x + 7} y={s.y + 3} className="text-faint" fill="currentColor" fontSize={8} fontWeight={600}
                fontFamily="ui-sans-serif, system-ui, sans-serif">{label[i]} · {ly(s.d)} ly</text>
            )}
            {!reveal && (
              <text x={s.x + 6} y={s.y + 3} className={i === 1 ? "text-maroon" : "text-muted"} fill="currentColor" fontSize={8} fontWeight={700}
                fontFamily="ui-sans-serif, system-ui, sans-serif">{label[i]}</text>
            )}
          </g>
        ))}

        {/* Earth / observer */}
        <circle cx={EX} cy={EY} r={4.5} className="text-ink" fill="currentColor" />
        <text className="text-muted" x={EX} y={EY + 16} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {reveal
          ? <>Stars <strong>A</strong>, <strong className="text-maroon">B</strong>, and <strong>C</strong> span <strong>{ly(FIXED[0])}–{ly(Math.max(mid, FIXED[1]))} light-years</strong> of depth — yet from Earth they flatten into one tidy pattern.</>
          : <>Star <strong className="text-maroon">B</strong> sits <strong>{ly(mid)} light-years</strong> away — slide it and its place in the sky <strong>never moves.</strong> The sphere cannot see depth.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>True distance of star B</span><span className="tabular-nums">{ly(mid)} ly</span>
          </span>
          <input type="range" min={34} max={150} step={1} value={mid} onChange={(e) => setMid(Number(e.target.value))}
            aria-label="True distance of the middle star" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setReveal((v) => !v)} aria-pressed={reveal}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${reveal ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {reveal ? "Hide the depths" : "Reveal the true distances"}
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        When you look at a star you see only the <span className="text-purple">direction</span> to it — the line of sight — never how far along that line it sits. So three stars at utterly different depths, as long as they lie in nearly the same direction, project onto the sphere of directions as a neat little group: an <em>asterism</em>, a pattern. Drag star&nbsp;<span className="text-maroon">B</span> from near to far and its true position in space races in and out, yet its point on the sky holds perfectly still — <span className="text-ink">distance is exactly the information the sphere throws away.</span> This is why the constellations are illusions of perspective: the stars of Orion look like a hunter only from here, and from another star they would scatter into an unrecognisable sprawl. It is also the great limitation that shaped three thousand years of astronomy — we could map every direction in the sky with exquisite precision while remaining almost totally ignorant of how far away anything was. Recovering that missing third dimension, the distance, is one of the longest quests in the whole science.
      </figcaption>
    </figure>
  );
}
