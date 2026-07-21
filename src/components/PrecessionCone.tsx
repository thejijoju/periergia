"use client";

import { useState } from "react";

// An interactive precession explorer, embedded in an article via a fenced
// ```precessioncone block (see Reader's `pre` override). Earth's axis, tilted 23.4°,
// slowly wobbles like a spinning top — its direction tracing a great circle among
// the stars over about 26,000 years. So the "pole star" is temporary: it was Thuban
// for the pyramid-builders, is Polaris now, and will be brilliant Vega in ~14,000 AD.
// Slide the millennia and watch the celestial pole drift around its circle, taking
// each bright star in turn (or none at all). currentColor theming; first render
// deterministic (our own era).

const CX = 150, CY = 120, RP = 84; // precession circle (the pole's path)
const PERIOD = 25772; // years
const NOW = 2000;
// bright stars near the pole's circle, at the epoch (year AD) the pole passes them
const STARS: [string, number][] = [["Thuban", -2800], ["Polaris", 2000], ["Vega", 13700], ["Thuban (again)", 23000]];
const ang = (year: number) => ((year - NOW) / PERIOD) * 360; // degrees around the circle, 0 = now (top)
const pos = (year: number) => ({ x: CX + RP * Math.sin((ang(year) * Math.PI) / 180), y: CY - RP * Math.cos((ang(year) * Math.PI) / 180) });

const yearLabel = (y: number) => (y < 0 ? `${Math.abs(y).toLocaleString("en-US")} BC` : `${y.toLocaleString("en-US")} AD`);

export function PrecessionCone() {
  const [year, setYear] = useState(2000);

  const p = pos(year);
  // nearest bright pole star (within ~12° of the pole counts as "the" pole star)
  let near = "", best = 999;
  for (const [n, y] of STARS) {
    let da = Math.abs(((ang(year) - ang(y)) % 360 + 540) % 360 - 180);
    if (da < best) { best = da; near = n.replace(" (again)", ""); }
  }
  const hasPole = best < 25; // angular gap on the circle → roughly whether a bright star marks the pole

  return (
    <figure className="prec-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`In ${yearLabel(year)}, Earth's axis points ${hasPole ? `near ${near}, the pole star of that era` : "at no bright star"}.`}>
        {/* the precession circle — the pole's 26,000-year path */}
        <circle className="text-line" cx={CX} cy={CY} r={RP} fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        {/* ecliptic north pole — centre of the wobble */}
        <circle className="text-faint" cx={CX} cy={CY} r={2.5} fill="currentColor" />
        <text className="text-faint" x={CX} y={CY + 14} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">ecliptic pole</text>

        {/* bright stars along the circle */}
        {STARS.slice(0, 3).map(([n, y]) => {
          const s = pos(y);
          return (
            <g key={n}>
              <circle className="text-ink" cx={s.x} cy={s.y} r={2.4} fill="currentColor" opacity={0.7} />
              <text className="text-muted" x={s.x} y={s.y - 6} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">{n} ({yearLabel(y)})</text>
            </g>
          );
        })}

        {/* the current celestial pole */}
        <line className="text-purple" x1={CX} y1={CY} x2={p.x} y2={p.y} stroke="currentColor" strokeWidth={0.75} strokeDasharray="2 2" opacity={0.6} />
        <circle className="text-purple" cx={p.x} cy={p.y} r={5} fill="currentColor" />
        <text className="text-purple" x={p.x} y={p.y + 16} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">pole now</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={150} fill="currentColor" fontSize={9} fontWeight={600}>{yearLabel(year)}</text>
          <text className="text-muted" x={300} y={172} fill="currentColor" fontSize={9} fontWeight={600}>pole star:</text>
          <text className={hasPole ? "text-purple" : "text-faint"} x={300} y={192} fill="currentColor" fontSize={17} fontWeight={800}>{hasPole ? near : "none bright"}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {yearLabel(year)}: Earth&rsquo;s axis points {hasPole ? <>near <strong className="text-purple">{near}</strong> — the North Star of that age.</> : <>at <strong className="text-faint">no bright star</strong> — there is simply no pole star then.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>The year</span><span className="tabular-nums">{yearLabel(year)}</span></span>
          <input type="range" min={-3000} max={22000} step={100} value={year} onChange={(e) => setYear(Number(e.target.value))} aria-label="The year" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Pyramids (2800 BC)", -2800], ["Now", 2000], ["14,000 AD", 13700]].map(([n, y]) => (
            <button key={n as string} type="button" onClick={() => setYear(y as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The most reliable-seeming landmark in the sky is on the move. Earth&rsquo;s axis stays tilted 23.4&deg;, but its <em>direction</em> slowly wobbles, tracing a great circle among the stars over about <strong>26,000 years</strong> — the same gyroscopic wobble as a spinning top, here driven by the Sun and Moon tugging on the Earth&rsquo;s equatorial bulge. So the celestial pole drifts around that circle, and different stars take their turn marking it: <span className="text-purple">Thuban</span> in Draco stood as pole star when the Egyptians built the pyramids; <span className="text-purple">Polaris</span> holds the post now; and in roughly 14,000 AD the brilliant <span className="text-purple">Vega</span> will blaze near the pole, far brighter than Polaris. Between such alignments there is sometimes no bright pole star at all. This is <em>precession</em> — and the still point around which the whole night turns is itself, we now discover, slowly circling. The most fixed thing in the sky is a passing alignment.
      </figcaption>
    </figure>
  );
}
