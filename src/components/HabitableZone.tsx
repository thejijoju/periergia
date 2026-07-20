"use client";

import { useState } from "react";

// An interactive habitable-zone explorer, embedded in an article via a fenced
// ```habitablezone block (see Reader's `pre` override). The classic "Goldilocks"
// band — where starlight keeps surface water liquid — is not a fixed distance: it
// scales as the square root of the star's luminosity, sliding out for bright
// stars and in for dim ones. Slide the star's brightness and a planet's orbit to
// see it fall too hot, just right, or too cold — and see the band's blind spot:
// far beyond it, tidal heating can keep subsurface oceans liquid with no sunlight
// at all (Europa, Enceladus). currentColor theming; first render deterministic
// (the Sun, an Earth-like orbit).

const AU_MIN = -1.3, AU_MAX = 1.7; // log10(AU): ~0.05 to ~50 AU
const X0 = 40, X1 = 424, Y0 = 40, Y1 = 150;
const px = (au: number) => X0 + ((Math.log10(au) - AU_MIN) / (AU_MAX - AU_MIN)) * (X1 - X0);

// Habitable-zone edges scale as sqrt(L); representative inner/outer factors.
const inner = (L: number) => 0.95 * Math.sqrt(L);
const outer = (L: number) => 1.5 * Math.sqrt(L);

export function HabitableZone() {
  const [le, setLe] = useState(0); // log10 stellar luminosity (L/Lsun)
  const [de, setDe] = useState(0); // log10 planet orbital distance (AU)
  const L = Math.pow(10, le);
  const d = Math.pow(10, de);
  const inn = inner(L), out = outer(L);
  const state = d < inn ? "hot" : d <= out ? "hz" : "cold";

  return (
    <figure className="hz-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 235" className="w-full h-auto" role="img"
        aria-label={`Around a star of ${L} solar luminosities, the habitable zone runs ${inn.toFixed(2)} to ${out.toFixed(2)} AU; a planet at ${d.toFixed(2)} AU is ${state === "hz" ? "in the habitable zone" : state === "hot" ? "too hot" : "too cold"}.`}>
        {/* the star */}
        <circle className="text-maroon" cx={X0} cy={(Y0 + Y1) / 2} r={7 + Math.min(6, Math.log10(L + 0.01) + 3)}
          fill="currentColor" opacity={0.85} />

        {/* cold / ocean-world band beyond the outer edge */}
        <rect className="text-purple" x={px(out)} y={Y0} width={Math.max(0, X1 - px(out))} height={Y1 - Y0}
          fill="currentColor" opacity={0.1} />
        <text className="text-purple" x={(px(out) + X1) / 2} y={Y0 + 13} textAnchor="middle" fill="currentColor"
          fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.8}>
          ocean moons? tidal heat, no sunlight
        </text>

        {/* the habitable zone band */}
        <rect className="text-ink" x={px(inn)} y={Y0} width={Math.max(1, px(out) - px(inn))} height={Y1 - Y0}
          fill="currentColor" opacity={0.16} />
        <rect x={px(inn)} y={Y0} width={Math.max(1, px(out) - px(inn))} height={Y1 - Y0}
          className="text-ink" fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.5} />
        <text className="text-ink" x={(px(inn) + px(out)) / 2} y={Y0 - 6} textAnchor="middle" fill="currentColor"
          fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">habitable zone</text>

        {/* axis */}
        <line className="text-line" x1={X0} y1={Y1} x2={X1} y2={Y1} stroke="currentColor" strokeWidth={1} />
        {[0.1, 1, 10].map((au) => (
          <g key={au}>
            <line className="text-line" x1={px(au)} y1={Y1} x2={px(au)} y2={Y1 + 4} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={px(au)} y={Y1 + 14} textAnchor="middle" fill="currentColor" fontSize={8}
              fontFamily="ui-sans-serif, system-ui, sans-serif">{au} AU</text>
          </g>
        ))}
        <text className="text-muted" x={(X0 + X1) / 2} y={Y1 + 30} textAnchor="middle" fill="currentColor" fontSize={9.5}
          fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from the star (log) ⟶</text>

        {/* the planet */}
        <line className={state === "hz" ? "text-purple" : state === "hot" ? "text-maroon" : "text-faint"}
          x1={px(d)} y1={Y0} x2={px(d)} y2={Y1} stroke="currentColor" strokeWidth={1} strokeDasharray="2 2" opacity={0.7} />
        <circle className={state === "hz" ? "text-purple" : state === "hot" ? "text-maroon" : "text-ink"}
          cx={px(d)} cy={(Y0 + Y1) / 2} r={5} fill="currentColor" />
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A planet at <strong className="tabular-nums">{d.toFixed(2)} AU</strong> around a{" "}
        <strong className="tabular-nums">{L >= 1 ? L.toFixed(L < 10 ? 1 : 0) : L.toFixed(2)}</strong>-luminosity star is{" "}
        {state === "hz"
          ? <strong className="text-purple">in the habitable zone — surface water can stay liquid.</strong>
          : state === "hot"
          ? <strong className="text-maroon">too hot — surface water boils away.</strong>
          : <><strong className="text-ink">too cold for surface water</strong> — but a moon here could still hide a tidal-heated ocean.</>}
      </p>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Star brightness</span><span className="tabular-nums">{L >= 1 ? L.toFixed(L < 10 ? 1 : 0) : L.toFixed(3)} L<sub>☉</sub></span>
          </span>
          <input type="range" min={-3} max={2} step={0.1} value={le} onChange={(e) => setLe(Number(e.target.value))}
            aria-label="Stellar luminosity (log, solar units)" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Planet orbit</span><span className="tabular-nums">{d.toFixed(2)} AU</span>
          </span>
          <input type="range" min={AU_MIN} max={AU_MAX} step={0.05} value={de} onChange={(e) => setDe(Number(e.target.value))}
            aria-label="Planet orbital distance (log, AU)" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The habitable zone is the band of distances where a star&rsquo;s warmth can keep <em>surface</em> water liquid — Earth sits in it, Venus (too close) cooked itself in a runaway greenhouse, Mars (too far) froze. But the band is not fixed: because received starlight follows the inverse-square law, its distance scales as roughly <span className="text-ink">√L</span>, sliding out to ~5&nbsp;AU around a bright star and in to ~0.1&nbsp;AU around a dim red dwarf. And it has a blind spot. It asks only one question — can <em>starlight</em> keep <em>surface</em> water liquid? — yet life needs only liquid water and energy, and neither must come from a star. Far beyond the zone, <span className="text-purple">tidal heating</span> — the frictional warmth of a moon flexed by its giant planet&rsquo;s gravity — keeps subsurface oceans liquid under insulating ice, on worlds like Europa and Enceladus. The best abodes for life may lie exactly where the Goldilocks chart says not to look.
      </figcaption>
    </figure>
  );
}
