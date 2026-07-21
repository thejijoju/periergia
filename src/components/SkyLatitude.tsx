"use client";

import { useState } from "react";

// An interactive pole-altitude-equals-latitude explorer, embedded in an article
// via a fenced ```skylatitude block (see Reader's `pre` override). The single most
// useful fact in positional astronomy: the height of the celestial pole (marked by
// Polaris) above your northern horizon is exactly your latitude. This widget shows
// WHY, from the Earth's own geometry — an observer on the globe, their local
// horizon and zenith, and the direction to the pole (parallel to Earth's axis,
// because the pole is effectively infinitely far). Slide your latitude and watch
// the pole's altitude track it, degree for degree. currentColor theming; first
// render deterministic (latitude 40°, New York).

const CX = 150, CY = 140, R = 82; // Earth cross-section
const rad = (d: number) => (d * Math.PI) / 180;

export function SkyLatitude() {
  const [lat, setLat] = useState(40);
  const L = rad(lat);

  // Observer on the rim at latitude `lat` (0 = equator/right, 90 = north pole/top).
  const ox = CX + R * Math.cos(L);
  const oy = CY - R * Math.sin(L);
  // Local zenith: straight out from Earth's centre through the observer.
  const zx = CX + (R + 46) * Math.cos(L);
  const zy = CY - (R + 46) * Math.sin(L);
  // Direction to the celestial pole: parallel to Earth's axis, i.e. straight up.
  const px = ox, py = oy - 66;
  // Local horizon: perpendicular to the zenith, drawn both ways from the observer.
  const hx = -Math.sin(L), hy = -Math.cos(L); // "north" horizon unit (points toward the pole side)
  const H = 40;
  const circ = 90 - lat; // circumpolar declination threshold, for the readout

  return (
    <figure className="skylat-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At latitude ${lat} degrees, the celestial pole (Polaris) stands ${lat} degrees above the northern horizon.`}>
        {/* Earth's axis */}
        <line className="text-faint" x1={CX} y1={CY - R - 22} x2={CX} y2={CY + R + 12} stroke="currentColor" strokeWidth={1} strokeDasharray="4 3" opacity={0.6} />
        <text className="text-faint" x={CX} y={CY - R - 26} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">N</text>

        {/* Earth */}
        <circle className="text-ink" cx={CX} cy={CY} r={R} fill="currentColor" opacity={0.06} />
        <circle className="text-line" cx={CX} cy={CY} r={R} fill="none" stroke="currentColor" strokeWidth={1} />
        {/* equator (edge-on) */}
        <line className="text-line" x1={CX - R} y1={CY} x2={CX + R} y2={CY} stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-faint" x={CX - R - 4} y={CY + 3} textAnchor="end" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">equator</text>

        {/* latitude arc at the centre */}
        <path d={`M${CX + 26} ${CY} A 26 26 0 0 0 ${CX + 26 * Math.cos(L)} ${CY - 26 * Math.sin(L)}`}
          className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.4} />
        <text className="text-purple" x={CX + 33} y={CY - 12} fill="currentColor" fontSize={9} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{lat}&deg;</text>

        {/* radius to observer */}
        <line className="text-line" x1={CX} y1={CY} x2={ox} y2={oy} stroke="currentColor" strokeWidth={0.75} opacity={0.6} />

        {/* local horizon through the observer */}
        <line className="text-ink" x1={ox - H * hx} y1={oy - H * hy} x2={ox + H * hx} y2={oy + H * hy} stroke="currentColor" strokeWidth={1.6} />
        <text className="text-muted" x={ox + H * hx + 4} y={oy + H * hy + 4} fill="currentColor" fontSize={7.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">horizon</text>

        {/* zenith ray */}
        <line className="text-faint" x1={ox} y1={oy} x2={zx} y2={zy} stroke="currentColor" strokeWidth={1} strokeDasharray="2 2" />
        <text className="text-faint" x={zx + 2} y={zy} fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">zenith</text>

        {/* direction to the pole (parallel to the axis) */}
        <line className="text-maroon" x1={ox} y1={oy} x2={px} y2={py} stroke="currentColor" strokeWidth={1.8} />
        <g className="text-maroon">
          <path d={`M${px} ${py - 3} l3 6 h-6 z`} fill="currentColor" />
          <text x={px + 4} y={py + 2} fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">to Polaris</text>
        </g>

        {/* observer */}
        <circle className="text-ink" cx={ox} cy={oy} r={3} fill="currentColor" />

        {/* the altitude angle, at the observer, between horizon(north) and the pole ray */}
        <text className="text-maroon" x={ox - 30} y={oy - 20} fill="currentColor" fontSize={9} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">alt = {lat}&deg;</text>

        {/* readout panel */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={150} fill="currentColor" fontSize={9} fontWeight={600}>your latitude</text>
          <text className="text-purple" x={300} y={168} fill="currentColor" fontSize={20} fontWeight={800}>{lat}&deg; N</text>
          <text className="text-muted" x={300} y={192} fill="currentColor" fontSize={9} fontWeight={600}>Polaris altitude</text>
          <text className="text-maroon" x={300} y={210} fill="currentColor" fontSize={20} fontWeight={800}>{lat}&deg;</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        The pole star stands <strong className="text-maroon">{lat}&deg;</strong> above your northern horizon — exactly your latitude of <strong className="text-purple">{lat}&deg;</strong>. Stars within <strong>{circ}&deg;</strong> of the pole never set.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Your latitude</span><span className="tabular-nums">{lat}&deg; N</span>
          </span>
          <input type="range" min={0} max={90} step={1} value={lat} onChange={(e) => setLat(Number(e.target.value))}
            aria-label="Your latitude in degrees north" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Equator", 0], ["New York", 40], ["London", 52], ["North Pole", 90]].map(([name, v]) => (
            <button key={name as string} type="button" onClick={() => setLat(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
              {name}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Here is why the sky is a map of where you stand. The celestial pole is so far away that its direction from every point on Earth is the same — parallel to the planet&rsquo;s axis. Stand at the <span className="text-ink">equator</span> and that direction lies flat along your northern horizon, so Polaris sits at altitude 0&deg;. Walk to the <span className="text-ink">North Pole</span> and the axis points straight up, so Polaris rides at your zenith, 90&deg;. In between, the angle from your horizon up to the pole climbs in exact step with your latitude — <span className="text-maroon">pole altitude equals latitude</span>. Measure that one angle with a sextant, or by stacking your fists up from the horizon, and you have read your position on the globe off the sky itself. It is the fact that guided navigators across oceans, and the changing height of the pole as you travel north or south is one of the oldest proofs that the Earth is round. (South of the equator there is no bright pole star, but the same geometry holds for the south celestial pole.)
      </figcaption>
    </figure>
  );
}
