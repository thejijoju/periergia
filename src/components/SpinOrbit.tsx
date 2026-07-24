"use client";

import { useState } from "react";

// An interactive 3:2 spin-orbit-resonance explorer, embedded via a fenced ```spinorbit
// block (see Reader's `pre` override). Mercury's rotation is unique: it turns exactly
// three times for every two orbits, the only spin-orbit resonance in the solar system,
// stabilized by its high eccentricity (the resonance physics of the Nice-model chapter
// applied to spin rather than orbit). The startling consequence is that a single solar
// day — noon to noon — lasts 176 Earth days, exactly TWO Mercury years; and because the
// orbit is so eccentric, near perihelion the planet's orbital motion briefly outruns its
// spin and the Sun appears to stop and travel BACKWARD across the sky. Scrub through one
// full solar day (two orbits) and watch the counts, and the Sun's sky position reverse.
// All orbital positions, spin angles, and sky azimuths are baked frame arrays (computed
// from Kepler's equation offline) — no live trig, so SSR and client markup match exactly.
// currentColor theming; first render at the start (perihelion).

const SUNX = 133.2, SUNY = 96;
const ORBIT = "192,96 191.9,100.1 191.5,104.2 190.9,108.3 190.1,112.3 189,116.3 187.7,120.3 186.2,124.1 184.4,128 182.4,131.7 180.1,135.3 177.6,138.9 174.9,142.3 172,145.6 168.8,148.7 165.4,151.6 161.7,154.4 157.9,157 153.8,159.4 149.6,161.5 145.1,163.4 140.5,165 135.7,166.3 130.8,167.3 125.7,168 120.5,168.4 115.2,168.4 109.9,168 104.5,167.2 99.1,166 93.7,164.4 88.5,162.4 83.3,159.9 78.2,157.1 73.4,153.8 68.8,150.1 64.5,146 60.4,141.5 56.8,136.7 53.5,131.5 50.7,126.1 48.3,120.4 46.4,114.5 45.1,108.4 44.3,102.2 44,96 44.3,89.8 45.1,83.6 46.4,77.5 48.3,71.6 50.7,65.9 53.5,60.5 56.8,55.3 60.4,50.5 64.5,46 68.8,41.9 73.4,38.2 78.2,34.9 83.3,32.1 88.5,29.6 93.7,27.6 99.1,26 104.5,24.8 109.9,24 115.2,23.6 120.5,23.6 125.7,24 130.8,24.7 135.7,25.7 140.5,27 145.1,28.6 149.6,30.5 153.8,32.6 157.9,35 161.7,37.6 165.4,40.4 168.8,43.3 172,46.4 174.9,49.7 177.6,53.1 180.1,56.7 182.4,60.3 184.4,64 186.2,67.9 187.7,71.7 189,75.7 190.1,79.7 190.9,83.7 191.5,87.8 191.9,91.9 192,96";
const MX = [192, 187.9, 176.4, 159.7, 140.2, 120.1, 100.9, 83.6, 69.1, 57.6, 49.5, 45, 44.1, 46.8, 53.1, 62.9, 76, 91.9, 110.3, 130.1, 150.2, 168.5, 182.9, 191, 191, 182.9, 168.5, 150.2, 130.1, 110.3, 91.9, 76, 62.9, 53.1, 46.8, 44.1, 45, 49.5, 57.6, 69.1, 83.6, 100.9, 120.1, 140.2, 159.7, 176.4, 187.9, 192];
const MY = [96, 119.8, 140.5, 155.8, 165.1, 168.4, 166.4, 160.1, 150.3, 137.9, 123.5, 108, 92, 76.1, 61.1, 47.6, 36.4, 28.2, 24, 24.6, 30.8, 43.1, 61.3, 83.9, 108.1, 130.7, 148.9, 161.2, 167.4, 168, 163.8, 155.6, 144.4, 130.9, 115.9, 100, 84, 68.5, 54.1, 41.7, 31.9, 25.6, 23.6, 26.9, 36.2, 51.5, 72.2, 96];
const SPIN = [0, 23, 46, 68.9, 91.9, 114.9, 137.9, 160.9, 183.8, 206.8, 229.8, 252.8, 275.7, 298.7, 321.7, 344.7, 7.7, 30.6, 53.6, 76.6, 99.6, 122.6, 145.5, 168.5, 191.5, 214.5, 237.4, 260.4, 283.4, 306.4, 329.4, 352.3, 15.3, 38.3, 61.3, 84.3, 107.2, 130.2, 153.2, 176.2, 199.1, 222.1, 245.1, 268.1, 291.1, 314, 337, 0];
const SUNAZ = [180, 180.6, 179.9, 177.2, 172.3, 165.4, 156.8, 146.9, 135.9, 124.2, 112, 99.5, 86.8, 74.2, 61.8, 49.8, 38.5, 28, 18.7, 10.9, 5, 1.2, 359.5, 359.6, 0.4, 0.5, 358.8, 355, 349.1, 341.3, 332, 321.5, 310.2, 298.2, 285.8, 273.2, 260.5, 248, 235.8, 224.1, 213.1, 203.2, 194.6, 187.7, 182.8, 180.1, 179.4, 180];
const N = MX.length;
const r1 = (n: number) => Math.round(n * 10) / 10;
// pre-rounded rotation-marker tips and sky-compass needles (baked to avoid live trig)
const rad = (d: number) => (d * Math.PI) / 180;

export function SpinOrbit() {
  const [i, setI] = useState(0); // frame index (0 = start = perihelion)

  const px = MX[i], py = MY[i];
  // a fixed surface meridian on Mercury, showing the spin
  const sp = rad(SPIN[i]);
  const tipx = r1(px + 11 * Math.cos(sp)), tipy = r1(py + 11 * Math.sin(sp));
  // the sub-solar point (short marker toward the Sun)
  const az = rad(SUNAZ[i]);
  const day = Math.round((i / (N - 1)) * 176);
  const orbits = ((i / (N - 1)) * 2).toFixed(2);
  const rots = ((i / (N - 1)) * 3).toFixed(2);
  const retro = i > 0 && ((SUNAZ[i] - SUNAZ[i - 1] + 540) % 360) - 180 < -1; // sky longitude decreasing

  // sky-compass (right side): the Sun's azimuth around a small dial
  const DCX = 356, DCY = 70, DR = 30;
  const sunx = r1(DCX + DR * Math.cos(az)), suny = r1(DCY + DR * Math.sin(az));

  return (
    <figure className="spinorbit-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 168" className="w-full h-auto" role="img"
        aria-label={`Mercury ${day} Earth-days into its 176-day solar day: it has completed ${orbits} orbits and ${rots} rotations. ${retro ? "Near perihelion the Sun is briefly moving backward across the sky." : ""}`}>

        {/* the orbit */}
        <polyline points={ORBIT} className="text-line" fill="none" stroke="currentColor" strokeWidth={0.9} strokeDasharray="2 3" opacity={0.6} />
        {/* the Sun at the focus */}
        <circle className="text-maroon" cx={SUNX} cy={SUNY} r={7} fill="currentColor" />
        <text className="text-faint" x={SUNX} y={SUNY + 17} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* Mercury: body, spin meridian, and a line to the Sun (its noon) */}
        <line className="text-faint" x1={r1(px)} y1={r1(py)} x2={SUNX} y2={SUNY} stroke="currentColor" strokeWidth={0.5} strokeDasharray="1 2" opacity={0.5} />
        <circle className="text-ink" cx={r1(px)} cy={r1(py)} r={6} fill="currentColor" />
        <line className="text-purple" x1={r1(px)} y1={r1(py)} x2={tipx} y2={tipy} stroke="currentColor" strokeWidth={1.8} />

        {/* the sky compass: where the Sun is in Mercury's sky */}
        <circle className="text-line" cx={DCX} cy={DCY} r={DR} fill="none" stroke="currentColor" strokeWidth={0.8} opacity={0.5} />
        <circle className="text-faint" cx={DCX} cy={DCY} r={2} fill="currentColor" />
        <line className="text-faint" x1={DCX} y1={DCY} x2={sunx} y2={suny} stroke="currentColor" strokeWidth={0.8} opacity={0.6} />
        <circle className={retro ? "text-maroon" : "text-maroon"} cx={sunx} cy={suny} r={4} fill="currentColor" />
        <text className="text-faint" x={DCX} y={DCY - DR - 4} textAnchor="middle" fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun in Mercury&rsquo;s sky</text>
        {retro && <text className="text-maroon" x={DCX} y={DCY + DR + 12} textAnchor="middle" fill="currentColor" fontSize={7} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">moving backward!</text>}

        {/* counters */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={20} y={20} fill="currentColor" fontSize={8} fontWeight={600}>{day} Earth-days</text>
          <text className="text-ink" x={20} y={36} fill="currentColor" fontSize={9} fontWeight={800}>{orbits} orbits</text>
          <text className="text-purple" x={20} y={50} fill="currentColor" fontSize={9} fontWeight={800}>{rots} rotations</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {i >= N - 1
          ? <>One full <strong>solar day</strong> done: <strong className="text-ink">2 orbits</strong>, <strong className="text-purple">3 rotations</strong> — the Sun is back overhead after <strong>176 Earth-days, exactly two Mercury years.</strong></>
          : retro
            ? <>Near <strong className="text-maroon">perihelion</strong>, Mercury&rsquo;s orbit briefly outruns its spin, and the <strong className="text-maroon">Sun stops and slides backward</strong> across the sky.</>
            : <>Mercury turns 3 times for every 2 orbits — the only <strong>spin-orbit resonance</strong> in the solar system. Watch the counts.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Through one solar day (two orbits)</span><span className="tabular-nums">{day} / 176 days</span></span>
          <input type="range" min={0} max={N - 1} step={1} value={i} onChange={(e) => setI(Number(e.target.value))} aria-label="Time through one Mercury solar day" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        For most of the twentieth century Mercury was thought to be tidally locked, one face in eternal day. Then in 1965 radar caught it rotating once every <strong>58.6 days</strong> — and against its <strong>88-day</strong> year that is a ratio of exactly <strong className="text-purple">3 : 2</strong>: three turns for every two orbits, the only spin-orbit resonance known. Why 3:2 and not 1:1? Because Mercury&rsquo;s orbit is the most eccentric of any planet, and tidal torques are overwhelmingly concentrated near <strong>perihelion</strong>; the 3:2 state has the special property that the same face points sunward at <em>alternate</em> perihelia, so the torques balance and the configuration is a stable trap. The consequence is delightful: because Mercury both spins and orbits, a single <strong>solar day</strong> — noon to noon — lasts <strong className="text-ink">176 Earth-days, exactly two Mercury years</strong>. The Sun takes 88 days to cross the sky and 88 more below it, and in that time the planet laps the Sun twice. And near perihelion, where Kepler&rsquo;s second law makes Mercury race along its orbit, its orbital motion briefly outpaces its rotation and the <strong className="text-maroon">Sun halts, reverses, and tracks backward</strong> for a few days before resuming — at some longitudes it even rises, dips back down, and rises again. The resonance physics that rearranged the outer solar system, here writing the strangest day in the solar system onto a single small planet.
      </figcaption>
    </figure>
  );
}
