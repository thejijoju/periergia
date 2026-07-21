"use client";

import { useState } from "react";

// An interactive "great coincidence" explorer, embedded in an article via a fenced
// ```eclipsesizes block (see Reader's `pre` override). The Sun is ~400× larger than
// the Moon and, by pure chance, ~400× farther away — so the two factors cancel and
// they appear almost the same size in our sky (~0.5°). That near-match is what lets
// a total eclipse hide the blinding disk while baring the corona. But the Moon's
// orbit is elliptical, so its apparent size wobbles: near perigee it just covers the
// Sun (total, corona), near apogee it falls a hair short (annular, a ring of fire).
// Slide the Moon's distance and watch it tip between them. currentColor theming;
// first render deterministic (near mean distance — a total eclipse).

const SUN_ARCMIN = 32.0; // Sun's angular diameter (~0.53°), roughly constant
const MOON_DIAM = 3474; // km
const PX_PER_ARCMIN = 3.2;
const CX = 150, CY = 118;

export function EclipseSizes() {
  const [dist, setDist] = useState(378000); // Moon distance, km (perigee ~356500, apogee ~406700)

  const moonArcmin = (MOON_DIAM / dist) * (180 / Math.PI) * 60; // angular diameter, arcmin
  const rSun = (SUN_ARCMIN / 2) * PX_PER_ARCMIN;
  const rMoon = (moonArcmin / 2) * PX_PER_ARCMIN;
  const total = rMoon >= rSun; // Moon covers the whole Sun?

  return (
    <figure className="eclsize-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`The Moon appears ${moonArcmin.toFixed(1)} arcminutes across versus the Sun's ${SUN_ARCMIN}; it ${total ? "fully covers the Sun — a total eclipse, corona visible" : "falls just short — an annular eclipse, a ring of Sun remains"}.`}>
        {/* corona streamers — only when the disk is fully covered */}
        {total && (
          <g className="text-muted">
            {Array.from({ length: 24 }, (_, i) => {
              const a = (i / 24) * 2 * Math.PI;
              const r0 = rMoon + 2, r1 = rMoon + 12 + (i % 3) * 7;
              return <line key={i} x1={CX + r0 * Math.cos(a)} y1={CY + r0 * Math.sin(a)} x2={CX + r1 * Math.cos(a)} y2={CY + r1 * Math.sin(a)} stroke="currentColor" strokeWidth={1} opacity={0.4} />;
            })}
          </g>
        )}
        {/* the Sun's disk */}
        <circle cx={CX} cy={CY} r={rSun} className="text-maroon" fill="currentColor" opacity={0.9} />
        {/* the Moon's dark disk on top (a silhouette) */}
        <circle cx={CX} cy={CY} r={rMoon} className="text-card" fill="currentColor" />
        {total
          ? <circle cx={CX} cy={CY} r={rMoon} fill="none" className="text-muted" stroke="currentColor" strokeWidth={0.75} opacity={0.5} />
          : <circle cx={CX} cy={CY} r={rSun} fill="none" className="text-maroon" stroke="currentColor" strokeWidth={0.75} opacity={0.6} />}

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-maroon" x={300} y={70} fill="currentColor" fontSize={9} fontWeight={600}>Sun</text>
          <text className="text-maroon" x={300} y={86} fill="currentColor" fontSize={15} fontWeight={800}>{SUN_ARCMIN.toFixed(1)}&prime;</text>
          <text className="text-ink" x={300} y={112} fill="currentColor" fontSize={9} fontWeight={600}>Moon</text>
          <text className="text-ink" x={300} y={128} fill="currentColor" fontSize={15} fontWeight={800}>{moonArcmin.toFixed(1)}&prime;</text>
          <text className={total ? "text-maroon" : "text-purple"} x={300} y={158} fill="currentColor" fontSize={13} fontWeight={800}>{total ? "TOTAL" : "ANNULAR"}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {total
          ? <><strong className="text-maroon">Total eclipse.</strong> The Moon covers the blinding disk exactly, and the Sun&rsquo;s ghostly <span className="text-muted">corona</span> blazes out — one of nature&rsquo;s greatest sights.</>
          : <><strong className="text-purple">Annular eclipse.</strong> The Moon is a touch too small to cover the Sun, leaving a brilliant <span className="text-maroon">ring of fire</span> — no corona.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Moon&rsquo;s distance</span><span className="tabular-nums">{Math.round(dist / 1000)},000 km</span></span>
          <input type="range" min={356500} max={406700} step={100} value={dist} onChange={(e) => setDist(Number(e.target.value))} aria-label="Moon distance in km" className="mt-1 w-full" style={{ accentColor: total ? "var(--c-maroon)" : "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setDist(356500)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">Perigee (closest → total)</button>
          <button type="button" onClick={() => setDist(406700)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">Apogee (farthest → annular)</button>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Savour the coincidence. The Sun is about <strong>400 times larger</strong> than the Moon — and, by pure chance, about <strong>400 times farther away.</strong> Angular size is real size divided by distance, so those two factors of 400 cancel exactly, and the Sun and Moon appear almost the same size in our sky, each about half a degree. That near-perfect match is the whole reason a total eclipse is so extraordinary: the Moon hides the dazzling disk precisely while leaving the faint <span className="text-muted">corona</span> — the Sun&rsquo;s million-times-dimmer outer atmosphere — visible for a few minutes. But the match is not perfect. The Moon&rsquo;s orbit is slightly elliptical, so its apparent size breathes: near <span className="text-maroon">perigee</span> it is a hair larger than the Sun and covers it completely (total), while near <span className="text-purple">apogee</span> it falls just short and a blinding ring remains (annular). And it is not even permanent — the Moon is drifting away, so total eclipses will one day cease. We live in the brief cosmic window when a small Moon exactly fits a vast Sun, and we happen to have the eyes to see it.
      </figcaption>
    </figure>
  );
}
