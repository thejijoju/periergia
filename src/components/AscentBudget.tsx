"use client";

import { useState } from "react";

// An interactive ascent loss-budget explorer, embedded in an article via a
// fenced ```ascentbudget block (see Reader's `pre` override). Orbital speed at
// LEO is only ~7.67 km/s, yet a launcher must deliver ~9.4 km/s. This builds
// the difference as a stacked bar: orbital velocity you keep, plus gravity loss
// (time spent climbing) and a little drag/steering/altitude overhead, minus the
// free rebate of Earth's eastward rotation. Slide the launch latitude (more
// rebate near the equator) and the thrust-to-weight (a punchier climb spends
// less against gravity) and watch the total the engine must supply. currentColor
// theming (light/dark); first render deterministic (Canaveral, TWR 1.3).

const ORBITAL = 7.67; // km/s kept at 400 km LEO
const OTHER = 0.4; // km/s: drag (0.15) + steering (0.05) + altitude (0.20)
const EQ_SPEED = 0.465; // km/s eastward surface speed at the equator

const AXIS_MAX = 10; // km/s
const X0 = 20;
const X1 = 424;
const Y_BAR = 60;
const H_BAR = 46;

const px = (v: number) => X0 + (v / AXIS_MAX) * (X1 - X0);

// Gravity loss falls as thrust-to-weight rises (a faster climb spends less time
// fighting gravity). Illustrative linear model over a realistic TWR range.
const gravLoss = (twr: number) => Math.max(0.9, Math.min(1.6, 1.5 - 1.25 * (twr - 1.2)));
const rebate = (latDeg: number) => EQ_SPEED * Math.cos((latDeg * Math.PI) / 180);

const SITES = [
  { label: "Kourou (5°N)", lat: 5 },
  { label: "Canaveral (28.5°N)", lat: 28.5 },
  { label: "Baikonur (46°N)", lat: 46 },
];

function seg(v0: number, v1: number, cls: string, opacity: number) {
  return (
    <rect className={cls} x={px(v0)} y={Y_BAR} width={px(v1) - px(v0)} height={H_BAR}
      fill="currentColor" opacity={opacity} />
  );
}

export function AscentBudget() {
  const [lat, setLat] = useState(28.5);
  const [twr, setTwr] = useState(1.3);

  const grav = gravLoss(twr);
  const reb = rebate(lat);
  const gross = ORBITAL + grav + OTHER;
  const total = gross - reb;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 150" className="w-full h-auto" role="img"
        aria-label={`From ${lat.toFixed(0)}° latitude at thrust-to-weight ${twr.toFixed(2)}, the launcher must deliver ${total.toFixed(2)} km/s.`}>
        {/* Stacked positive segments */}
        {seg(0, ORBITAL, "text-purple", 0.85)}
        {seg(ORBITAL, ORBITAL + grav, "text-maroon", 0.8)}
        {seg(ORBITAL + grav, gross, "text-ink", 0.45)}
        {/* Rebate: hatched notch drawn back from the gross end */}
        <rect className="text-purple" x={px(total)} y={Y_BAR} width={px(gross) - px(total)} height={H_BAR}
          fill="currentColor" opacity={0.18} />
        <line className="text-purple" x1={px(total)} y1={Y_BAR} x2={px(total)} y2={Y_BAR + H_BAR}
          stroke="currentColor" strokeWidth={2} />

        {/* Total marker */}
        <line className="text-ink" x1={px(total)} y1={Y_BAR - 8} x2={px(total)} y2={Y_BAR + H_BAR + 8}
          stroke="currentColor" strokeWidth={1.5} strokeDasharray="3 2" />
        <text className="text-ink" x={px(total)} y={Y_BAR - 12} textAnchor="middle" fill="currentColor"
          fontSize={11} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {total.toFixed(2)} km/s
        </text>

        {/* Axis ticks */}
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y_BAR + H_BAR + 1} x2={X1} y2={Y_BAR + H_BAR + 1} />
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          {[0, 2, 4, 6, 8, 10].map((v) => (
            <text key={v} x={px(v)} y={Y_BAR + H_BAR + 14} textAnchor="middle">{v}</text>
          ))}
          <text x={(X0 + X1) / 2} y={Y_BAR + H_BAR + 27} textAnchor="middle" className="text-muted" fontWeight={600}>
            km/s the engine must deliver ⟶
          </text>
        </g>

        {/* In-bar labels */}
        <g fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-card" x={px(ORBITAL / 2)} y={Y_BAR + 27} textAnchor="middle">orbital 7.67</text>
          {grav > 0.7 && (
            <text className="text-card" x={px(ORBITAL + grav / 2)} y={Y_BAR + 27} textAnchor="middle">
              grav {grav.toFixed(1)}
            </text>
          )}
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        7.67 <span className="text-muted">orbital</span> + {grav.toFixed(2)}{" "}
        <span className="text-maroon">gravity</span> + {OTHER.toFixed(2)} <span className="text-muted">drag/steer/alt</span> −{" "}
        {reb.toFixed(2)} <span className="text-purple">rotation rebate</span> ={" "}
        <strong>{total.toFixed(2)} km/s</strong>
      </p>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Launch latitude</span>
            <span className="tabular-nums">{lat.toFixed(0)}°</span>
          </span>
          <input type="range" min={0} max={60} step={0.5} value={lat}
            onChange={(e) => setLat(Number(e.target.value))}
            aria-label="Launch latitude"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Thrust-to-weight at liftoff</span>
            <span className="tabular-nums">{twr.toFixed(2)}</span>
          </span>
          <input type="range" min={1.2} max={1.6} step={0.01} value={twr}
            onChange={(e) => setTwr(Number(e.target.value))}
            aria-label="Thrust-to-weight ratio"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
      </div>
      <div className="mt-3 flex flex-wrap gap-2">
        {SITES.map((s) => (
          <button key={s.label} type="button" onClick={() => setLat(s.lat)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            {s.label}
          </button>
        ))}
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Orbital speed at LEO is only 7.67 km/s — the rest of the ~9.4 km/s is <em>overhead</em>. <span className="text-maroon">Gravity loss</span> (~1.3 km/s) is the price of every second spent climbing rather than orbiting; a punchier thrust-to-weight shortens the climb and shaves a little off it, but structural and g-limits cap how far. Drag and steering are already tiny. The one term working <em>for</em> you is Earth&rsquo;s eastward spin: launch near the equator and it rebates up to 0.47 km/s for free — which is why Kourou beats Baikonur and why almost everything launches east over water. Notice the total barely moves: the ~1.5 km/s of overhead is baked into launching from a rotating planet with an atmosphere, which is why 9.4 has been the number since 1967. Figures are illustrative, tracking the chapter&rsquo;s budget table.
      </figcaption>
    </figure>
  );
}
