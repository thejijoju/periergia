"use client";

import { useState } from "react";

// An interactive gnomon (shadow-stick) explorer, embedded in an article via a
// fenced ```gnomon block (see Reader's `pre` override). The oldest instrument in
// astronomy: a vertical stick whose noon shadow reads the Sun's altitude, and so
// the season. Slide the day of the year and watch the noon shadow breathe —
// shortest at the summer solstice (high Sun), longest at the winter solstice (low
// Sun). And the loveliest part, shown in the panel: the tilt of the Earth itself
// is just half the difference between the two solstice altitudes — the ancients
// measured the 23.4° obliquity with nothing but a stick and its shadow. currentColor
// theming; first render deterministic (40° N, summer solstice).

const OBL = 23.44;
const rad = (d: number) => (d * Math.PI) / 180;
const decOf = (day: number) => OBL * Math.sin(rad((360 * (day - 81)) / 365));

const GY = 188, BX = 150, H = 56; // ground, stick base x, stick height (px)
const MAXL = 250;

export function Gnomon() {
  const [lat, setLat] = useState(40);
  const [day, setDay] = useState(172); // ~June solstice

  const dec = decOf(day);
  const noon = 90 - Math.abs(lat - dec); // noon Sun altitude (Sun due south)
  const shadowH = noon > 0.5 ? 1 / Math.tan(rad(noon)) : 99; // shadow in stick-heights
  const Lpx = Math.min(MAXL, H * shadowH);
  const capped = H * shadowH > MAXL;

  // tilt measured from the two solstice noon altitudes (clean for mid latitudes)
  const aS = 90 - Math.abs(lat - OBL);
  const aW = 90 - Math.abs(lat + OBL);
  const measuredTilt = (aS - aW) / 2;

  // sun ray: grazes the stick top, continues up-right (south) to the Sun
  const Tx = BX, Ty = GY - H; // stick top
  const Sx = BX - Lpx, Sy = GY; // shadow tip (north / left)
  const ux = (Tx - Sx), uy = (Ty - Sy);
  const un = Math.hypot(ux, uy) || 1;
  const sunx = Tx + (ux / un) * 46, suny = Ty + (uy / un) * 46;
  const season = dec > 4 ? "summer half" : dec < -4 ? "winter half" : "near an equinox";

  return (
    <figure className="gnomon-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At latitude ${lat}°, the noon Sun is ${noon.toFixed(0)}° high and the stick's shadow is ${shadowH.toFixed(2)} times its height.`}>
        {/* sky + ground */}
        <rect x={16} y={20} width={408} height={GY - 20} className="text-card" fill="currentColor" />
        <line className="text-line" x1={16} y1={GY} x2={424} y2={GY} stroke="currentColor" strokeWidth={1.4} />
        <text className="text-faint" x={20} y={GY + 13} fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">north</text>
        <text className="text-faint" x={420} y={GY + 13} textAnchor="end" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">south</text>

        {/* the Sun and its ray */}
        <line className="text-maroon" x1={Sx} y1={Sy} x2={sunx} y2={suny} stroke="currentColor" strokeWidth={1} strokeDasharray="3 2" opacity={0.7} />
        <circle className="text-maroon" cx={sunx} cy={suny} r={7} fill="currentColor" opacity={0.9} />
        <text className="text-muted" x={sunx} y={suny - 11} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{noon.toFixed(0)}&deg;</text>

        {/* the shadow */}
        <line className="text-ink" x1={BX} y1={GY} x2={Sx} y2={GY} stroke="currentColor" strokeWidth={4} opacity={0.35} strokeLinecap="round" />
        {capped && <text className="text-faint" x={Sx + 4} y={GY - 5} fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">…off the ground</text>}

        {/* the gnomon (stick) */}
        <line className="text-ink" x1={BX} y1={GY} x2={Tx} y2={Ty} stroke="currentColor" strokeWidth={3} strokeLinecap="round" />
        <text className="text-muted" x={BX - 6} y={Ty - 4} textAnchor="end" fill="currentColor" fontSize={8} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">gnomon</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={40} fill="currentColor" fontSize={9} fontWeight={600}>noon shadow</text>
          <text className="text-ink" x={300} y={58} fill="currentColor" fontSize={18} fontWeight={800}>{shadowH < 90 ? `${shadowH.toFixed(2)}×` : "∞"}</text>
          <text className="text-faint" x={300} y={72} fill="currentColor" fontSize={7.5}>stick-heights</text>
        </g>
      </svg>

      {/* the tilt-from-two-shadows panel */}
      <div className="mt-1 rounded-lg border border-purple/50 bg-purple/10 px-3 py-2 text-center font-sans">
        <span className="text-[11.5px] text-muted">Summer noon Sun <strong className="text-ink">{aS.toFixed(1)}&deg;</strong> − winter <strong className="text-ink">{aW.toFixed(1)}&deg;</strong>, halved = </span>
        <span className="text-[13px] font-bold text-purple">Earth&rsquo;s tilt {measuredTilt.toFixed(1)}&deg;</span>
      </div>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Your latitude</span><span className="tabular-nums">{lat}&deg; N</span></span>
          <input type="range" min={25} max={66} step={1} value={lat} onChange={(e) => setLat(Number(e.target.value))} aria-label="Latitude" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Time of year — {season}</span><span className="tabular-nums">Sun at {dec >= 0 ? "+" : ""}{dec.toFixed(0)}&deg;</span></span>
          <input type="range" min={0} max={364} step={1} value={day} onChange={(e) => setDay(Number(e.target.value))} aria-label="Day of the year" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="flex flex-wrap gap-2">
          {[["Summer solstice", 172], ["Equinox", 81], ["Winter solstice", 355]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setDay(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A vertical stick and its shadow — the <em>gnomon</em> — is the oldest instrument in astronomy, and it reads the sky with startling reach. Its shortest shadow of the day falls at local noon, pointing true north and measuring the noon Sun&rsquo;s height; track that noon shadow across a year and the seasons appear in its length — <span className="text-ink">shortest at the summer solstice</span>, longest at the winter one, so that a solstice is quite literally the day the noon shadow stops shrinking and begins to grow again (which is exactly what <em>sol-stice</em>, &ldquo;sun-stands-still,&rdquo; means). And then the marvel in the panel above: measure the noon Sun at both solstices and take half their difference, and out drops <span className="text-purple">23.4&deg;</span> — the tilt of the Earth&rsquo;s axis itself, extracted from two shadow-lengths six months apart. The Greeks did essentially this, reading the lean of the world off the ground centuries before anyone knew the Earth <em>had</em> an axis. Every telescope and space probe since is, at heart, a more elaborate gnomon: an instrument for reading the real geometry of the cosmos from the shadows it casts our way.
      </figcaption>
    </figure>
  );
}
