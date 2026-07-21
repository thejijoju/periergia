"use client";

import { useState } from "react";

// An interactive longitude-by-time explorer, embedded in an article via a fenced
// ```longitudeclock block (see Reader's `pre` override). Latitude the sky hands you
// for free (the pole's altitude). Longitude is a problem of TIME: the Earth turns
// 15° every hour, so if you compare your LOCAL time (noon = when the Sun is highest)
// to the time at a reference meridian (Greenwich) at that same instant, the
// difference gives your longitude — 15° per hour, 1° per 4 minutes. Carry Greenwich
// time in a box (a marine chronometer) and you can find where you are on a
// featureless ocean. Slide your longitude and watch the chronometer offset. currentColor
// theming; first render deterministic (45° W).

const X0 = 30, X1 = 410, YB = 66; // world strip
const lx = (lon: number) => X0 + ((lon + 180) / 360) * (X1 - X0);
const fmt = (h: number) => {
  h = ((h % 24) + 24) % 24;
  const hr = Math.floor(h);
  const m = Math.round((h - hr) * 60);
  return `${hr.toString().padStart(2, "0")}:${m.toString().padStart(2, "0")}`;
};

export function LongitudeClock() {
  const [lon, setLon] = useState(-45); // longitude, + east

  const greenwich = 12 - lon / 15; // Greenwich time at your local noon
  const dir = lon >= 0 ? "E" : "W";

  return (
    <figure className="lonclock-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At longitude ${Math.abs(lon)}° ${dir === "E" ? "east" : "west"}, when it is local noon the Greenwich chronometer reads ${fmt(greenwich)}.`}>
        {/* world longitude strip */}
        <rect x={X0} y={YB - 18} width={X1 - X0} height={26} className="text-ink" fill="currentColor" opacity={0.06} />
        <rect x={X0} y={YB - 18} width={X1 - X0} height={26} className="text-line" fill="none" stroke="currentColor" strokeWidth={1} />
        {[-90, 90].map((l) => (
          <line key={l} className="text-line" x1={lx(l)} y1={YB - 18} x2={lx(l)} y2={YB + 8} stroke="currentColor" strokeWidth={0.5} strokeDasharray="2 3" opacity={0.5} />
        ))}
        {[[-180, "180°W"], [0, ""], [180, "180°E"]].map(([l, lab]) => (
          <text key={l as number} className="text-faint" x={lx(l as number)} y={YB + 20} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{lab as string}</text>
        ))}
        {/* Greenwich meridian */}
        <line className="text-maroon" x1={lx(0)} y1={YB - 24} x2={lx(0)} y2={YB + 10} stroke="currentColor" strokeWidth={1.4} />
        <text className="text-maroon" x={lx(0)} y={YB - 28} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Greenwich 0°</text>

        {/* your meridian + the Sun overhead (local noon) */}
        <line className="text-purple" x1={lx(lon)} y1={YB - 34} x2={lx(lon)} y2={YB + 10} stroke="currentColor" strokeWidth={1.4} strokeDasharray="3 2" />
        <circle className="text-purple" cx={lx(lon)} cy={YB - 40} r={7} fill="currentColor" opacity={0.9} />
        <text className="text-purple" x={lx(lon)} y={YB + 20} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">you</text>

        {/* the two clocks, as readouts */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-purple" x={130} y={140} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={600}>your local noon</text>
          <text className="text-purple" x={130} y={166} textAnchor="middle" fill="currentColor" fontSize={24} fontWeight={800}>12:00</text>
          <text className="text-maroon" x={310} y={140} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={600}>chronometer (Greenwich)</text>
          <text className="text-maroon" x={310} y={166} textAnchor="middle" fill="currentColor" fontSize={24} fontWeight={800}>{fmt(greenwich)}</text>
          <text className="text-faint" x={220} y={196} textAnchor="middle" fill="currentColor" fontSize={9}>difference {Math.abs(lon / 15).toFixed(1)} h × 15°/h =</text>
          <text className="text-ink" x={220} y={216} textAnchor="middle" fill="currentColor" fontSize={16} fontWeight={800}>{Math.abs(lon)}° {dir}</text>
        </g>
      </svg>

      <div className="mt-2">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Your longitude</span><span className="tabular-nums">{Math.abs(lon)}&deg; {dir}</span></span>
          <input type="range" min={-180} max={180} step={1} value={lon} onChange={(e) => setLon(Number(e.target.value))} aria-label="Your longitude" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The sky hands you your <em>latitude</em> for the price of one angle — the pole star&rsquo;s height above the horizon. <em>Longitude</em> is far harder, and the reason cuts to the heart of this chapter: it is a problem of <span className="text-purple">time.</span> The Earth turns 15&deg; every hour, so every hour of clock difference is 15&deg; of longitude (and one degree is just four minutes of time). Your local time is easy — it is noon when the Sun stands highest. The trick is knowing, at that same instant, what time it is back at <span className="text-maroon">Greenwich</span>; the difference, times 15&deg; per hour, is your longitude. For centuries no clock could keep accurate time through a storm-tossed voyage, and longitude cost countless ships — until John Harrison&rsquo;s marine chronometer let a navigator simply <em>carry Greenwich time in a box.</em> (The alternative used the sky itself as the clock, reading Greenwich time from the Moon&rsquo;s creeping position among the stars.) Solving longitude reshaped world history — and it is why Greenwich became the world&rsquo;s prime meridian, and why every time zone on your phone still descends from the effort to find where a ship stood on an empty sea.
      </figcaption>
    </figure>
  );
}
