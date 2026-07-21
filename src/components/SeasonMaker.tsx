"use client";

import { useState } from "react";

// An interactive seasons engine, embedded in an article via a fenced
// ```seasonmaker block (see Reader's `pre` override). The seasons are not about
// distance — this widget has no distance input at all. Pick a latitude and a day
// of the year and it draws the Sun's altitude across that day: the PEAK of the
// curve is the noon Sun's height (Mechanism 1, directness) and the WIDTH above the
// horizon is the length of the day (Mechanism 2, duration). Summer is a tall, wide
// curve; winter a low, narrow one — both effects flowing from the same 23.4° tilt,
// reinforcing. currentColor theming; first render deterministic (45° N, June
// solstice).

const OBL = 23.44;
const rad = (d: number) => (d * Math.PI) / 180;
const deg = (r: number) => (r * 180) / Math.PI;
const clamp = (x: number, lo: number, hi: number) => Math.max(lo, Math.min(hi, x));

// Sun's declination for a day of the year (0 = Jan 1); day 81 ≈ the March equinox.
const decOf = (day: number) => OBL * Math.sin(rad((360 * (day - 81)) / 365));
// Sun's altitude (degrees) at hour t (0..24) for latitude φ and declination δ.
const altOf = (t: number, phi: number, dec: number) => {
  const H = rad(15 * (t - 12));
  const s = Math.sin(rad(phi)) * Math.sin(rad(dec)) + Math.cos(rad(phi)) * Math.cos(rad(dec)) * Math.cos(H);
  return deg(Math.asin(clamp(s, -1, 1)));
};

const X0 = 40, X1 = 424, Y0 = 24, YH = 150; // YH = horizon line (alt 0)
const tx = (t: number) => X0 + (t / 24) * (X1 - X0);
const ay = (a: number) => YH - (a / 90) * (YH - Y0);

export function SeasonMaker() {
  const [lat, setLat] = useState(45);
  const [day, setDay] = useState(172); // ~June 21

  const dec = decOf(day);
  const noon = 90 - Math.abs(lat - dec); // noon Sun altitude
  // daylight hours
  const cosH0 = -Math.tan(rad(lat)) * Math.tan(rad(dec));
  const daylight = cosH0 <= -1 ? 24 : cosH0 >= 1 ? 0 : (2 * deg(Math.acos(cosH0))) / 15;
  // rough relative daily heating ∝ sin(noon altitude) × daylight hours
  const heat = Math.max(0, Math.sin(rad(noon))) * daylight;
  const heatMax = 1 * 24; // normalising ceiling
  const season = dec > 4 ? "northern summer" : dec < -4 ? "northern winter" : "near an equinox";

  // altitude curve + shaded daylight region
  const pts: [number, number][] = [];
  for (let t = 0; t <= 24; t += 0.25) pts.push([t, altOf(t, lat, dec)]);
  const curve = pts.filter(([, a]) => a > -1).map(([t, a], i) => `${i ? "L" : "M"}${tx(t).toFixed(1)} ${ay(Math.max(a, 0)).toFixed(1)}`).join(" ");
  const dayPts = pts.filter(([, a]) => a > 0);
  const shade = dayPts.length
    ? `M${tx(dayPts[0][0]).toFixed(1)} ${YH} ` + dayPts.map(([t, a]) => `L${tx(t).toFixed(1)} ${ay(a).toFixed(1)}`).join(" ") + ` L${tx(dayPts[dayPts.length - 1][0]).toFixed(1)} ${YH} Z`
    : "";

  return (
    <figure className="season-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At latitude ${lat}° on day ${day}, the noon Sun reaches ${noon.toFixed(0)}° and the day is ${daylight.toFixed(1)} hours long.`}>
        {/* horizon + grid */}
        <line className="text-line" x1={X0} y1={YH} x2={X1} y2={YH} stroke="currentColor" strokeWidth={1} />
        {[30, 60, 90].map((a) => (
          <g key={a}>
            <line className="text-line" x1={X0} y1={ay(a)} x2={X1} y2={ay(a)} stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 4" opacity={0.5} />
            <text className="text-faint" x={X0 - 4} y={ay(a) + 3} textAnchor="end" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{a}&deg;</text>
          </g>
        ))}
        <text className="text-faint" x={X0 - 4} y={YH + 3} textAnchor="end" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">0&deg;</text>
        {[0, 6, 12, 18, 24].map((t) => (
          <text key={t} className="text-faint" x={tx(t)} y={YH + 13} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{t === 12 ? "noon" : `${t}h`}</text>
        ))}

        {/* daylight-shaded region (duration) */}
        {shade && <path d={shade} className="text-purple" fill="currentColor" opacity={0.14} />}
        {/* the Sun's altitude curve */}
        <path d={curve} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={2.2} strokeLinejoin="round" />
        {/* noon marker (directness) */}
        {noon > 0 && (
          <g className="text-maroon">
            <circle cx={tx(12)} cy={ay(noon)} r={4} fill="currentColor" />
            <line x1={tx(12)} y1={ay(noon)} x2={tx(12)} y2={YH} stroke="currentColor" strokeWidth={0.75} strokeDasharray="2 2" opacity={0.6} />
            <text x={tx(12) + 6} y={ay(noon) - 3} fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">noon {noon.toFixed(0)}&deg;</text>
          </g>
        )}
      </svg>

      {/* readouts */}
      <div className="mt-1 grid grid-cols-3 gap-2 text-center font-sans">
        <div><div className="text-[10px] uppercase tracking-wide text-muted">noon Sun</div><div className="text-[16px] font-bold text-maroon">{noon > 0 ? `${noon.toFixed(0)}°` : "below"}</div></div>
        <div><div className="text-[10px] uppercase tracking-wide text-muted">daylight</div><div className="text-[16px] font-bold text-purple">{daylight.toFixed(1)} h</div></div>
        <div><div className="text-[10px] uppercase tracking-wide text-muted">heating</div>
          <div className="mt-1.5 h-2 rounded-full bg-line overflow-hidden"><div className="h-full bg-maroon" style={{ width: `${clamp((heat / heatMax) * 100, 0, 100)}%` }} /></div>
        </div>
      </div>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Your latitude</span><span className="tabular-nums">{lat}&deg; N</span></span>
          <input type="range" min={0} max={66} step={1} value={lat} onChange={(e) => setLat(Number(e.target.value))} aria-label="Latitude" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Time of year — {season}</span><span className="tabular-nums">Sun at {dec >= 0 ? "+" : ""}{dec.toFixed(0)}&deg;</span></span>
          <input type="range" min={0} max={364} step={1} value={day} onChange={(e) => setDay(Number(e.target.value))} aria-label="Day of the year" className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="flex flex-wrap gap-2">
          {[["June solstice", 172], ["Sept equinox", 265], ["Dec solstice", 355], ["March equinox", 81]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setDay(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Notice what is <em>not</em> here: any control for the Earth&rsquo;s distance from the Sun. The seasons need none. Everything you see flows from one number — the 23.4&deg; tilt — read out at your latitude and the time of year. The curve is the Sun&rsquo;s height through the day, and it carries both seasonal mechanisms at once: its <span className="text-maroon">peak</span> is the noon Sun&rsquo;s altitude (how <em>directly</em> the light strikes — a high Sun concentrates its beam onto a small patch of ground, a low Sun smears it thin), and its <span className="text-purple">width above the horizon</span> is the length of the day (how <em>long</em> the Sun heats). In summer your hemisphere leans sunward, so the Sun is both higher and up longer — a tall, wide curve, a double dose of heat. In winter it leans away — low and brief. Slide from June to December and watch the curve collapse; slide toward the pole and watch it swing from a 24-hour midnight Sun to none at all. The seasons are the shadow of a leaning world, and the distance theory everyone reaches for first is simply not in the picture.
      </figcaption>
    </figure>
  );
}
