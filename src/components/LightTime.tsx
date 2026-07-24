"use client";

import { useState } from "react";

// An interactive light-travel-time explorer, embedded in an article via a fenced
// ```lighttime block (see Reader's `pre` override). The single best intuition for the
// scale of the solar system: express distance as the TIME light takes to cross it.
// Drag the slider — "minutes since a flash left the Sun" — and watch an expanding
// wavefront sweep outward past the planets, each lighting up as the light finally
// reaches it. The Sun is 8.3 light-minutes away; Neptune is 4.2 light-HOURS. Light, the
// fastest thing there is, needs a substantial fraction of a day just to cross our own
// system — and because radio travels at the same speed, this delay IS the communication
// lag to every spacecraft we fly. Positions use a square-root axis so the huddled inner
// planets and the far-flung outer ones both fit. currentColor theming; first render
// deterministic (8.3 min — light just reaching Earth: we never see the Sun as it is,
// only as it was). Coordinates rounded so SSR and client markup match exactly.

// name, light-minutes from Sun, and PRE-COMPUTED axis x (see note). Math.sqrt differs by
// a last ULP between Node (SSR) and browser V8, so the static planet positions are baked
// as literals to guarantee byte-identical markup in both engines (no hydration mismatch);
// only the state-dependent wavefront is computed live. Regenerate with xOf if TMAX/X0/X1
// change.
const PLANETS: [string, number, number][] = [
  ["Mercury", 3.2, 47.8], ["Venus", 6, 101.5], ["Earth", 8.3, 129.3], ["Mars", 12.7, 165.7],
  ["Jupiter", 43.3, 270.6], ["Saturn", 79.7, 322.8], ["Uranus", 162, 383.5], ["Neptune", 252, 421.3],
];

const TMIN = 2.6, TMAX = 260; // minutes — axis runs from just inside Mercury to just past Neptune
const X0 = 30, X1 = 424, AX = 150; // axis geometry (drawing units)
const START = 8.3; // initial slider value (light just reaching Earth)
const START_X = 129.3; // xOf(START), frozen to match the baked geometry
const r1 = (n: number) => Math.round(n * 10) / 10;
// log axis: the honest spacing for distances spanning two orders of magnitude — and it
// separates the huddled inner planets enough that their labels don't collide. Below TMIN
// the wavefront sits at the Sun (light only just departing).
const xOf = (min: number) => X0 + ((Math.log(Math.max(min, TMIN)) - Math.log(TMIN)) / (Math.log(TMAX) - Math.log(TMIN))) * (X1 - X0);

export function LightTime() {
  const [t, setT] = useState(START); // minutes since the flash left the Sun

  // frozen at the initial value so SSR/client markup match; live (single sqrt, engines
  // agree) once the slider moves — after hydration, so it never enters the comparison
  const frontX = t === START ? START_X : r1(xOf(t));
  const reached = PLANETS.filter(([, m]) => m <= t);
  const auNow = (t / 8.317) * 1.0; // light travels 1 AU in 8.317 light-minutes
  const kmNow = auNow * 149.6; // million km
  const hrs = t / 60;
  const timeLabel = t < 60 ? `${r1(t)} min` : `${(hrs).toFixed(1)} hr`;
  // the body the wavefront has most recently passed / is heading toward
  const last = reached.length ? reached[reached.length - 1][0] : null;
  const next = PLANETS.find(([, m]) => m > t)?.[0] ?? null;

  return (
    <figure className="lighttime-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={`${timeLabel} after a flash of light leaves the Sun, the wavefront has reached ${last ?? "no planet yet"}${next ? ` and is still travelling toward ${next}` : " — it has passed every planet"}.`}>

        {/* the axis line from the Sun outward */}
        <line className="text-line" x1={X0} y1={AX} x2={X1} y2={AX} stroke="currentColor" strokeWidth={1} />

        {/* the expanding wavefront (a vertical sweep) and its faint trail */}
        <rect className="text-purple" x={X0} y={AX - 44} width={r1(frontX - X0)} height={88} fill="currentColor" opacity={0.07} />
        <line className="text-purple" x1={frontX} y1={AX - 46} x2={frontX} y2={AX + 46} stroke="currentColor" strokeWidth={2} />
        <circle className="text-purple" cx={frontX} cy={AX} r={4} fill="currentColor" />

        {/* the Sun at the origin */}
        <circle className="text-maroon" cx={X0} cy={AX} r={7} fill="currentColor" />
        <text className="text-faint" x={X0} y={AX + 22} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* planets along the axis, lighting up once the wavefront passes them */}
        {PLANETS.map(([name, m, x], i) => {
          const lit = m <= t;
          const up = i % 2 === 0; // alternate labels above/below to avoid crowding
          return (
            <g key={name}>
              <circle className={lit ? "text-ink" : "text-faint"} cx={x} cy={AX} r={lit ? 4 : 2.6} fill="currentColor" opacity={lit ? 1 : 0.55} />
              <text className={lit ? "text-ink" : "text-faint"} x={x} y={up ? AX - 14 : AX + 26} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={lit ? 700 : 500} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={lit ? 1 : 0.7}>{name}</text>
              <text className="text-faint" x={x} y={up ? AX - 5 : AX + 36} textAnchor="middle" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.75}>{m < 60 ? `${m}m` : `${r1(m / 60)}h`}</text>
            </g>
          );
        })}

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={X0} y={26} fill="currentColor" fontSize={8.5} fontWeight={600}>time since the flash left the Sun</text>
          <text className="text-purple" x={X0} y={50} fill="currentColor" fontSize={22} fontWeight={800}>{timeLabel}</text>
          <text className="text-muted" x={X1} y={26} textAnchor="end" fill="currentColor" fontSize={8.5} fontWeight={600}>the light is now</text>
          <text className="text-ink" x={X1} y={48} textAnchor="end" fill="currentColor" fontSize={13} fontWeight={800}>{auNow < 100 ? auNow.toFixed(1) : Math.round(auNow)} AU out</text>
          <text className="text-faint" x={X1} y={62} textAnchor="end" fill="currentColor" fontSize={7.5}>{kmNow < 1000 ? Math.round(kmNow) : (kmNow / 1000).toFixed(2) + " billion"} {kmNow < 1000 ? "million km" : "km"}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {last === null
          ? <>The flash has only just left the Sun — even <strong>Mercury</strong> is still minutes away.</>
          : next
            ? <>{r1(t)} minutes on, the light has swept past <strong className="text-ink">{last}</strong> and is still racing toward <strong className="text-purple">{next}</strong>.</>
            : <>Over <strong className="text-purple">four hours</strong> later, the light finally reaches <strong>Neptune</strong> — the edge of the planetary system.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Minutes since a flash of light left the Sun</span><span className="tabular-nums">{timeLabel}</span></span>
          <input type="range" min={0} max={TMAX} step={0.1} value={t} onChange={(e) => setT(Number(e.target.value))} aria-label="Minutes since a flash of light left the Sun" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Reaching Earth (8.3 min)", 8.3], ["Reaching Mars (12.7 min)", 12.7], ["Reaching Jupiter (43 min)", 43.3], ["Reaching Neptune (4.2 hr)", 252]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setT(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The honest way to feel the size of the solar system is to measure it in <strong>time</strong> — how long light, the fastest thing there is, takes to cross it. The Sun is <strong className="text-ink">8.3 light-minutes</strong> away: the sunlight on your hands right now left its surface eight minutes ago, so we never see the Sun as it <em>is</em>, only as it <em>was</em>. Run the slider outward and the numbers grow relentlessly — Jupiter is three-quarters of an hour out, and <strong>Neptune is 4.2 light-hours</strong> from the Sun. Light that crosses the whole Earth seven times a second still needs a substantial fraction of a day to cross our own planetary system. And this is not a party trick, because radio waves travel at exactly the same speed: light-travel time <em>is</em> the communication delay to every spacecraft we fly. A round-trip command to a Mars rover takes anywhere from 9 to 42 minutes, so <strong>you cannot drive it</strong> — by the time you see the obstacle, the rover has been parked in front of it for a quarter of an hour. Every rover must be substantially autonomous; every landing must execute itself before the news that it began has even arrived. Distance, in this system, is measured in patience.
      </figcaption>
    </figure>
  );
}
