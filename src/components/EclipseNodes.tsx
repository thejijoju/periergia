"use client";

import { useState } from "react";

// An interactive "why not every month" explorer, embedded in an article via a
// fenced ```eclipsenodes block (see Reader's `pre` override). We get a new Moon and
// a full Moon every month, yet eclipses are rare — because the Moon's orbit is
// tilted ~5° to the ecliptic, so the new/full Moon usually rides a little above or
// below the perfect Sun–Earth line and the shadow misses. Only when a node (where
// the tilted orbit crosses the ecliptic) points at the Sun do the shadows align —
// an eclipse season. Slide the node line around and watch the eclipse windows open
// twice a "year." currentColor theming; first render deterministic (a near-miss).

const rad = (d: number) => (d * Math.PI) / 180;
const SUNLON = 40; // the Sun's ecliptic longitude (fixed here)
const TILT = 5.1; // Moon's orbital inclination, degrees
const LIMIT = 1.5; // rough latitude limit within which a shadow can strike
const X0 = 30, X1 = 414, YE = 132, AMP = 40; // ecliptic line + amplitude (px per TILT)
const lx = (lon: number) => X0 + ((((lon % 360) + 360) % 360) / 360) * (X1 - X0);
const yb = (lon: number, Om: number) => YE - (Math.sin(rad(lon - Om)) * AMP);

export function EclipseNodes() {
  const [Om, setOm] = useState(120); // longitude of the ascending node

  const latNew = TILT * Math.sin(rad(SUNLON - Om)); // Moon's latitude at new Moon
  const eclipse = Math.abs(latNew) < LIMIT; // (full Moon has −latNew: same condition)
  const miss = latNew > 0 ? "below" : "above"; // where the new Moon passes

  // the wavy latitude track of the Moon over one orbit
  const track = Array.from({ length: 73 }, (_, i) => i * 5)
    .map((lon, i) => `${i ? "L" : "M"}${lx(lon).toFixed(1)} ${yb(lon, Om).toFixed(1)}`)
    .join(" ");
  const nodes = [Om % 360, (Om + 180) % 360];

  return (
    <figure className="eclnodes-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With the nodes turned ${Math.round(((SUNLON - Om) % 360 + 360) % 360)}° from the Sun, the new Moon passes ${eclipse ? "on the Sun–Earth line — an eclipse season" : `${Math.abs(latNew).toFixed(1)}° ${miss} the line, so the shadow misses`}.`}>
        {/* eclipse limit band around the ecliptic */}
        <rect x={X0} y={YE - (LIMIT / TILT) * AMP} width={X1 - X0} height={(2 * LIMIT / TILT) * AMP} className="text-maroon" fill="currentColor" opacity={0.12} />
        {/* the ecliptic line */}
        <line className="text-line" x1={X0} y1={YE} x2={X1} y2={YE} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={X1} y={YE + 14} textAnchor="end" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">the ecliptic (Earth–Sun plane)</text>

        {/* the Moon's tilted orbit, as its latitude over a month */}
        <path d={track} className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.8} opacity={0.9} />

        {/* nodes: where the orbit crosses the ecliptic */}
        {nodes.map((n, i) => (
          <g key={i} className="text-ink">
            <circle cx={lx(n)} cy={YE} r={3} fill="currentColor" />
            <text x={lx(n)} y={YE + 22} textAnchor="middle" fill="currentColor" fontSize={7} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">node</text>
          </g>
        ))}

        {/* the Sun's direction (fixed) */}
        <line className="text-maroon" x1={lx(SUNLON)} y1={20} x2={lx(SUNLON)} y2={YE + AMP + 4} stroke="currentColor" strokeWidth={1} strokeDasharray="3 2" opacity={0.5} />
        <circle className="text-maroon" cx={lx(SUNLON)} cy={30} r={7} fill="currentColor" opacity={0.9} />
        <text className="text-maroon" x={lx(SUNLON)} y={16} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* new Moon (at Sun's longitude) and full Moon (opposite) */}
        <g className={eclipse ? "text-maroon" : "text-purple"}>
          <circle cx={lx(SUNLON)} cy={yb(SUNLON, Om)} r={5} fill="currentColor" />
          <text x={lx(SUNLON) + 8} y={yb(SUNLON, Om) + 3} fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">new</text>
        </g>
        <g className={eclipse ? "text-maroon" : "text-purple"}>
          <circle cx={lx(SUNLON + 180)} cy={yb(SUNLON + 180, Om)} r={5} fill="currentColor" />
          <text x={lx(SUNLON + 180) + 8} y={yb(SUNLON + 180, Om) + 3} fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">full</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {eclipse
          ? <><strong className="text-maroon">Eclipse season.</strong> A node points at the Sun, so the new Moon covers it (solar eclipse) and the full Moon two weeks later slips into Earth&rsquo;s shadow (lunar eclipse).</>
          : <><span className="text-purple font-semibold">No eclipse.</span> The new Moon passes <strong>{Math.abs(latNew).toFixed(1)}&deg; {miss}</strong> the Sun&rsquo;s direction — its shadow sails over {miss === "above" ? "the top of" : "the bottom of"} the Earth, into space.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Turn of the node line (the months of the year)</span><span className="tabular-nums">{Math.round((((SUNLON - Om) % 360) + 360) % 360)}&deg; from Sun</span></span>
          <input type="range" min={0} max={359} step={1} value={Om} onChange={(e) => setOm(Number(e.target.value))} aria-label="Orientation of the lunar node line" className="mt-1 w-full" style={{ accentColor: eclipse ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setOm(SUNLON)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">Node at the Sun (eclipse)</button>
          <button type="button" onClick={() => setOm(SUNLON + 90)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">Node side-on (no eclipse)</button>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Here is why eclipses are rare despite a new and a full Moon every single month. The Moon&rsquo;s orbit is tilted about <strong>5&deg;</strong> to the ecliptic — the Earth–Sun plane — so as the Moon rounds its orbit it rides a little <em>above</em> the plane, crosses it, dips <em>below</em>, and crosses back (the purple wave). It touches the ecliptic at just two points, the <span className="text-ink">nodes</span>. For a shadow to strike, the new or full Moon must land almost exactly <em>on</em> the ecliptic — inside that narrow band — which only happens when a node is pointed at the Sun. Most months the new Moon misses by a degree or two and its shadow flies past the Earth entirely; twice a year the node line swings to face the Sun and the shadows align, giving an <span className="text-maroon">eclipse season</span> with a solar eclipse at new Moon and a lunar one at full. And now the name from two chapters ago pays off: the Sun&rsquo;s path is called the <em>ecliptic</em> precisely because it is the line on which eclipses occur — the Moon must reach it, at a node, for the sky to go dark.
      </figcaption>
    </figure>
  );
}
