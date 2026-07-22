"use client";

import { useState } from "react";

// An interactive Newton's-cannonball explorer, embedded via a fenced ```newtoncannon
// block (see Reader's `pre` override). Newton's own thought experiment, and the deepest
// picture of what an orbit IS. Fire a cannonball horizontally from an impossibly high
// mountain: too slow and it arcs to the ground; faster and it lands farther away as the
// Earth curves from under it; fast enough and the surface curves away exactly as fast as
// the ball falls — it falls forever AROUND the Earth. That is an orbit: perpetual
// falling, sideways fast enough to keep missing the ground. Faster still and it escapes
// entirely. The trajectory is numerically integrated under real inverse-square gravity
// (GM of the Earth, km and seconds), so the threshold speeds are physically genuine.
// currentColor theming; first render deterministic; coordinates rounded for SSR parity.

const GM = 398600; // Earth's GM, km^3/s^2
const RE = 6371; // Earth radius, km
const H = 800; // Newton's impossibly high mountain, km (tall enough to see)
const R0 = RE + H;
const VCIRC = Math.sqrt(GM / R0); // ≈ 7.5 km/s — circular orbit speed at the muzzle
const VESC = Math.sqrt((2 * GM) / R0); // ≈ 10.5 km/s — escape speed at the muzzle

const EC = { x: 150, y: 132 }; // Earth centre on screen
const PX_PER_KM = 72 / RE; // draw Earth at 72 px radius
const r1 = (n: number) => Math.round(n * 10) / 10; // SSR/client identical strings

// Integrate the trajectory (leapfrog) from the mountaintop, fired horizontally at v km/s.
// Returns the polyline points and how the flight ends. The FATE is decided by physics —
// hit the ground, or escape iff the total energy is non-negative — never by merely
// leaving the drawn frame (a bound ellipse can swing far outside the picture and return).
function trajectory(v: number): { pts: string; fate: "ground" | "orbit" | "escape" } {
  let x = 0, y = R0; // km, Earth centre at origin, muzzle straight "up" on screen
  let vx = v, vy = 0; // fired horizontally (screen-rightward)
  const dt = 5; // s
  const pts: string[] = [];
  // energy decides bound vs unbound up front: E = v²/2 − GM/r0
  let fate: "ground" | "orbit" | "escape" = v * v / 2 - GM / R0 >= 0 ? "escape" : "orbit";
  const maxSteps = 3200; // ~2.6 low orbits — enough to close the ellipse visibly
  for (let i = 0; i < maxSteps; i++) {
    const r = Math.hypot(x, y);
    if (r <= RE) { fate = "ground"; break; }
    if (r > 7 * RE) break; // far off-screen — stop drawing (fate already known)
    const a = -GM / (r * r * r); // acceleration/r factor
    vx += a * x * dt;
    vy += a * y * dt;
    x += vx * dt;
    y += vy * dt;
    if (i % 4 === 0) pts.push(`${r1(EC.x + x * PX_PER_KM)},${r1(EC.y - y * PX_PER_KM)}`);
  }
  return { pts: pts.join(" "), fate };
}

export function NewtonCannon() {
  const [v, setV] = useState(5.0); // muzzle speed, km/s

  const { pts, fate } = trajectory(v);
  const muzzle = { x: EC.x, y: r1(EC.y - R0 * PX_PER_KM) };

  return (
    <figure className="cannon-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A cannonball fired at ${v.toFixed(1)} km/s ${fate === "ground" ? "falls back to Earth" : fate === "orbit" ? "falls around the Earth in orbit" : "escapes Earth entirely"}.`}>

        {/* the Earth */}
        <circle className="text-purple" cx={EC.x} cy={EC.y} r={r1(RE * PX_PER_KM)} fill="currentColor" opacity={0.25} />
        <circle className="text-purple" cx={EC.x} cy={EC.y} r={r1(RE * PX_PER_KM)} fill="none" stroke="currentColor" strokeWidth={1.2} opacity={0.8} />
        <text className="text-purple" x={EC.x} y={EC.y + 4} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>

        {/* the impossibly high mountain */}
        <polygon points={`${EC.x - 7},${r1(EC.y - RE * PX_PER_KM + 1)} ${EC.x + 7},${r1(EC.y - RE * PX_PER_KM + 1)} ${muzzle.x},${muzzle.y}`} className="text-muted" fill="currentColor" opacity={0.7} />

        {/* the trajectory */}
        <polyline points={pts} fill="none"
          className={fate === "ground" ? "text-maroon" : fate === "orbit" ? "text-ink" : "text-maroon"}
          stroke="currentColor" strokeWidth={1.5} opacity={0.9} strokeLinejoin="round" strokeLinecap="round" />

        {/* the cannonball at the muzzle */}
        <circle className="text-ink" cx={muzzle.x} cy={muzzle.y} r={3} fill="currentColor" />

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={352} y={34} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={600}>{v.toFixed(1)} km/s</text>
          <text className={fate === "orbit" ? "text-purple" : "text-maroon"} x={352} y={54} textAnchor="middle" fill="currentColor" fontSize={12} fontWeight={800}>
            {fate === "ground" ? "falls back" : fate === "orbit" ? "ORBIT!" : "escapes"}
          </text>
          <text className="text-faint" x={352} y={70} textAnchor="middle" fill="currentColor" fontSize={7}>
            {fate === "ground" ? "too slow — hits the ground" : fate === "orbit" ? "falling around the Earth forever" : "never coming back"}
          </text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {fate === "ground" && <>At <strong>{v.toFixed(1)} km/s</strong> the ball arcs down and hits the ground — the Earth curves away, but not fast enough.</>}
        {fate === "orbit" && <>At <strong>{v.toFixed(1)} km/s</strong> the ground curves away as fast as the ball falls: it <strong className="text-purple">falls around the Earth forever</strong>. That is an orbit.</>}
        {fate === "escape" && <>At <strong>{v.toFixed(1)} km/s</strong> the ball beats gravity entirely and <strong className="text-maroon">escapes</strong>, never to return.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Muzzle speed</span><span className="tabular-nums">{v.toFixed(1)} km/s</span></span>
          <input type="range" min={1} max={12} step={0.1} value={v} onChange={(e) => setV(Number(e.target.value))} aria-label="Cannonball speed" className="mt-1 w-full" style={{ accentColor: fate === "orbit" ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Too slow (5)", 5.0], [`Orbit (${VCIRC.toFixed(1)})`, Math.round(VCIRC * 10) / 10], [`Escape (${(VESC + 0.3).toFixed(1)})`, Math.round((VESC + 0.3) * 10) / 10]].map(([n, val]) => (
            <button key={n as string} type="button" onClick={() => setV(val as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Newton&rsquo;s own thought experiment, and the deepest picture of what an orbit <em>is.</em> Fire a cannonball horizontally from an impossibly high mountain. Too slow, and it arcs to the ground. Faster, and it lands farther away — the Earth&rsquo;s surface <em>curving away</em> beneath its fall. Fire it <strong>fast enough</strong>, and the surface curves away at exactly the rate the ball falls: it never gets closer to the ground, and <strong className="text-purple">falls around the Earth forever.</strong> An orbit is not a special celestial motion — it is <em>perpetual falling</em>, done sideways fast enough to keep missing the ground. The Moon does exactly this; so does every satellite; so do the astronauts of the ISS, who float not because gravity is absent but because they are in constant free fall. Faster still and the ball <strong className="text-maroon">escapes</strong> — the escape speed at Earth&rsquo;s surface, about 11.2 km/s, is the wall every rocket ever launched has had to beat. Newton conceived the artificial satellite three centuries before we launched one — and the trajectories drawn here are integrated under his actual inverse-square gravity, thresholds and all.
      </figcaption>
    </figure>
  );
}
