"use client";

import { useState } from "react";

// An interactive solar-vs-sidereal day explorer, embedded in an article via a
// fenced ```solarsidereal block (see Reader's `pre` override). A "day" is really
// two things. The sidereal day (star to star) is Earth's true rotation, 23h 56m.
// The solar day (noon to noon) is ~4 minutes longer, because while the Earth spins
// it also moves ~1° around its orbit, so it must turn an extra ~1° to bring the Sun
// back to noon — exactly the "chasing the moving Sun" logic of the phase month.
// Slide the days forward: the arrow to the Sun swings around while the arrow to a
// fixed star holds still, and a given star rises 4 minutes earlier each day, coming
// full circle in a year. currentColor theming; first render deterministic.

const rad = (d: number) => (d * Math.PI) / 180;
const CX = 130, CY = 122, R = 74; // Sun centre + orbit radius

export function SolarSiderealDay() {
  const [days, setDays] = useState(30);

  const a = (days / 365) * 360; // orbital angle travelled, degrees
  const E = { x: CX + R * Math.cos(rad(a)), y: CY - R * Math.sin(rad(a)) };
  // direction from Earth to the Sun (toward centre) and to a fixed far star (up)
  const toSun = { x: (CX - E.x), y: (CY - E.y) };
  const nSun = Math.hypot(toSun.x, toSun.y) || 1;
  const sun = { x: E.x + (toSun.x / nSun) * 30, y: E.y + (toSun.y / nSun) * 30 };
  const star = { x: E.x, y: E.y - 30 }; // fixed direction (up)

  const earlyMin = days * 4; // a star rises ~4 min earlier per day
  const eh = Math.floor(earlyMin / 60), em = Math.round(earlyMin % 60);

  return (
    <figure className="ssd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`After ${days} days, the Earth has moved ${a.toFixed(0)}° around its orbit, so a given star now rises about ${eh}h ${em}m earlier by the clock.`}>
        {/* orbit */}
        <circle className="text-line" cx={CX} cy={CY} r={R} fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        {/* Sun */}
        <circle className="text-maroon" cx={CX} cy={CY} r={11} fill="currentColor" opacity={0.9} />
        <text className="text-maroon" x={CX} y={CY + 24} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* start position (ghost) */}
        <circle className="text-faint" cx={CX + R} cy={CY} r={4} fill="currentColor" opacity={0.4} />

        {/* to a fixed distant star */}
        <line className="text-ink" x1={E.x} y1={E.y} x2={star.x} y2={star.y - 6} stroke="currentColor" strokeWidth={1} strokeDasharray="2 2" opacity={0.7} />
        <text className="text-ink" x={star.x} y={star.y - 10} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">✦ far star</text>

        {/* to the Sun */}
        <line className="text-maroon" x1={E.x} y1={E.y} x2={sun.x} y2={sun.y} stroke="currentColor" strokeWidth={1.4} />

        {/* Earth */}
        <circle className="text-purple" cx={E.x} cy={E.y} r={6} fill="currentColor" />
        <text className="text-purple" x={E.x + 9} y={E.y + 3} fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={272} y={54} fill="currentColor" fontSize={9} fontWeight={600}>sidereal day (stars)</text>
          <text className="text-ink" x={272} y={72} fill="currentColor" fontSize={15} fontWeight={800}>23h 56m</text>
          <text className="text-muted" x={272} y={100} fill="currentColor" fontSize={9} fontWeight={600}>solar day (Sun)</text>
          <text className="text-maroon" x={272} y={118} fill="currentColor" fontSize={15} fontWeight={800}>24h 00m</text>
          <text className="text-muted" x={272} y={150} fill="currentColor" fontSize={9} fontWeight={600}>after {days} days a star rises</text>
          <text className="text-purple" x={272} y={168} fill="currentColor" fontSize={15} fontWeight={800}>{eh}h {em.toString().padStart(2, "0")}m earlier</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {days >= 364
          ? <>A full year: the star rises <strong>~24 h earlier</strong> — all the way back around. The whole sky has cycled through the seasons.</>
          : <>The Earth has swept <strong>{a.toFixed(0)}&deg;</strong> around its orbit, so the Sun&rsquo;s direction has shifted while the <span className="text-ink">far star</span> holds still.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Days elapsed</span><span className="tabular-nums">{days} d</span></span>
          <input type="range" min={0} max={365} step={1} value={days} onChange={(e) => setDays(Number(e.target.value))} aria-label="Days elapsed" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A day is not one thing but two. The <span className="text-ink">sidereal day</span> — one true spin of the Earth relative to the fixed stars — is <strong>23 hours 56 minutes.</strong> But the day we live by is the <span className="text-maroon">solar day</span>, noon to noon, and it is about <strong>four minutes longer</strong>, because while the Earth turns it is also sliding about one degree around its orbit each day, shifting the Sun&rsquo;s direction. After one full spin relative to the stars, the Sun is not quite back to noon; the Earth must turn an <em>extra</em> ~1&deg; to catch it, and at 15&deg; per hour that degree takes four minutes. It is exactly the &ldquo;chasing the moving Sun&rdquo; logic that made the phase-month longer than the orbit-month — rotation measured against a moving reference (the Sun) versus a fixed one (the stars). And it has a visible signature: because the star-clock runs four minutes fast against our Sun-clock, a given star rises about four minutes earlier every night — half an hour a week, two hours a month — until, over a year, it comes all the way around. That drift <em>is</em> the changing seasonal sky: Orion on winter evenings, Scorpius on summer ones, the whole zodiac wheeling through the year as the Earth&rsquo;s orbital motion, tallied four minutes at a time.
      </figcaption>
    </figure>
  );
}
