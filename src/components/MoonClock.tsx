"use client";

import { useState } from "react";

// An interactive Moon-clock explorer, embedded in an article via a fenced
// ```moonclock block (see Reader's `pre` override). The phase is a clock: because
// a Moon's phase is just its angle from the Sun, the phase fixes when the Moon
// rises, culminates, and sets. New rides with the Sun by day; first quarter rules
// the evening; full is up all night, rising as the Sun sets; last quarter haunts
// the predawn. Slide the phase and watch the Moon's "up" band slide around the
// 24-hour day. currentColor theming; first render deterministic (full Moon).

const rad = (d: number) => (d * Math.PI) / 180;
const X0 = 40, X1 = 424, TL = 150; // timeline geometry
const tx = (h: number) => X0 + (h / 24) * (X1 - X0);

const nameOf = (s: number) => {
  if (s < 3 || s > 357) return "New Moon";
  if (s < 87) return "Waxing crescent"; if (s < 93) return "First quarter";
  if (s < 177) return "Waxing gibbous"; if (s < 183) return "Full Moon";
  if (s < 267) return "Waning gibbous"; if (s < 273) return "Last quarter";
  return "Waning crescent";
};
const fmt = (h: number) => {
  h = ((h % 24) + 24) % 24;
  const hr = Math.floor(h) % 24;
  const ap = hr < 12 ? "am" : "pm";
  const h12 = hr % 12 === 0 ? 12 : hr % 12;
  const m = Math.round((h - Math.floor(h)) * 60);
  return `${h12}:${m.toString().padStart(2, "0")} ${ap}`;
};

export function MoonClock() {
  const [s, setS] = useState(180); // phase, 0 new … 180 full … 360 new

  const elong = s <= 180 ? s : 360 - s;
  const waxing = s < 180;
  const rise = (6 + s / 15) % 24; // new rises ~6am; each 15° of phase = 1h later
  const high = (rise + 6) % 24;
  const set = (rise + 12) % 24;

  // moon-up band as 1–2 segments on a 24h line
  const segs: [number, number][] = set > rise ? [[rise, set]] : [[rise, 24], [0, set]];

  return (
    <figure className="moonclock-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`A ${nameOf(s).toLowerCase()} rises about ${fmt(rise)}, is highest about ${fmt(high)}, and sets about ${fmt(set)}.`}>
        {/* the phase icon */}
        <g transform="translate(64 54)">
          <circle r={26} className="text-ink" fill="currentColor" />
          <path d={`M0 ${-26} A 26 26 0 0 ${waxing ? 1 : 0} 0 26 Z`} className="text-card" fill="currentColor" />
          <ellipse cx={0} cy={0} rx={Math.abs(26 * Math.cos(rad(elong)))} ry={26} className={elong < 90 ? "text-card" : "text-ink"} fill="currentColor" />
          <circle r={26} fill="none" className="text-line" stroke="currentColor" strokeWidth={1} />
        </g>
        <text className="text-purple" x={104} y={48} fill="currentColor" fontSize={13} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{nameOf(s)}</text>
        <text className="text-muted" x={104} y={64} fill="currentColor" fontSize={9} fontFamily="ui-sans-serif, system-ui, sans-serif">{elong.toFixed(0)}&deg; from the Sun</text>

        {/* the day: sunlight band 6–18 */}
        <rect x={tx(6)} y={TL - 30} width={tx(18) - tx(6)} height={16} className="text-maroon" fill="currentColor" opacity={0.16} />
        <circle cx={tx(12)} cy={TL - 22} r={4} className="text-maroon" fill="currentColor" />
        <text className="text-maroon" x={tx(12)} y={TL - 34} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">daytime</text>

        {/* the Moon-up band */}
        {segs.map(([a, b], i) => (
          <rect key={i} x={tx(a)} y={TL + 6} width={tx(b) - tx(a)} height={16} className="text-purple" fill="currentColor" opacity={0.28} />
        ))}
        <text className="text-purple" x={tx((rise + 6) % 24 === high ? high : 12)} y={TL + 40} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Moon above the horizon</text>

        {/* axis */}
        <line className="text-line" x1={X0} y1={TL} x2={X1} y2={TL} stroke="currentColor" strokeWidth={1} />
        {[0, 6, 12, 18, 24].map((h) => (
          <g key={h}>
            <line className="text-line" x1={tx(h)} y1={TL - 3} x2={tx(h)} y2={TL + 3} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={tx(h)} y={TL + 54} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{h === 0 || h === 24 ? "12am" : h === 12 ? "12pm" : h < 12 ? `${h}am` : `${h - 12}pm`}</text>
          </g>
        ))}

        {/* rise / high / set markers */}
        {([["rise", rise], ["high", high], ["set", set]] as [string, number][]).map(([lab, h]) => (
          <g key={lab} className="text-ink">
            <line x1={tx(h)} y1={TL + 4} x2={tx(h)} y2={TL + 24} stroke="currentColor" strokeWidth={1.4} />
            <text x={tx(h)} y={TL - 4} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.75}>{lab}</text>
          </g>
        ))}
      </svg>

      <div className="mt-1 grid grid-cols-3 gap-2 text-center font-sans">
        {([["rises", rise], ["highest", high], ["sets", set]] as [string, number][]).map(([lab, h]) => (
          <div key={lab}><div className="text-[10px] uppercase tracking-wide text-muted">{lab}</div><div className="text-[14px] font-bold text-ink tabular-nums">{fmt(h)}</div></div>
        ))}
      </div>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Phase</span><span className="tabular-nums">{s}&deg; of the cycle</span></span>
          <input type="range" min={0} max={360} step={1} value={s} onChange={(e) => setS(Number(e.target.value))} aria-label="Moon phase" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["New", 0], ["First quarter", 90], ["Full", 180], ["Last quarter", 270]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setS(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A Moon&rsquo;s phase <em>is</em> its angle from the Sun, so the phase is a clock. The <span className="text-maroon">new</span> Moon sits in the Sun&rsquo;s direction — it rises at dawn, crosses the sky by day, and is lost in the glare. The <span className="text-purple">first quarter</span> trails the Sun by a quarter-turn: it rises at noon, rides highest at sunset, and rules the first half of the night. The <span className="text-purple">full</span> Moon lies opposite the Sun, so it rises exactly as the Sun sets and is up all night long — which is why &ldquo;the Moon rises as the Sun sets&rdquo; is specifically a full-Moon thing. The <span className="text-purple">last quarter</span> rises near midnight and haunts the predawn sky. So a crescent low in the west after sunset must be young and waxing; a Moon high at midnight must be full; a half-Moon in the morning must be last quarter. Read the shape and the place together, and the whole orbit is legible at a glance — and the Moon rises about fifty minutes later each day, the visible signature of its eastward march around us.
      </figcaption>
    </figure>
  );
}
