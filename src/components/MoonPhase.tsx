"use client";

import { useState } from "react";

// An interactive Moon-phase explorer, embedded in an article via a fenced
// ```moonphase block (see Reader's `pre` override). The phases are not a shadow —
// this widget has no Earth-shadow in it anywhere. The Moon is a sphere, always
// exactly half-lit by the Sun; as it orbits, we view that unchanging lit
// hemisphere from a changing angle and so see a changing FRACTION of it. The
// left panel is the top-down truth (Sun to the left, Earth centre, Moon on its
// orbit, its lit half always facing the Sun); the right panel is what we see from
// Earth. Slide the Moon around and read off the phase. currentColor theming;
// first render deterministic (first quarter).

const rad = (d: number) => (d * Math.PI) / 180;
const EX = 108, EY = 122, ORB = 66; // orrery: Earth centre + orbit radius
const DR = 42, DCX = 342, DCY = 108; // phase disk: radius + centre

const nameOf = (s: number) => {
  if (s < 3 || s > 357) return "New Moon";
  if (s < 87) return "Waxing crescent";
  if (s < 93) return "First quarter";
  if (s < 177) return "Waxing gibbous";
  if (s < 183) return "Full Moon";
  if (s < 267) return "Waning gibbous";
  if (s < 273) return "Last quarter";
  return "Waning crescent";
};

export function MoonPhase() {
  const [s, setS] = useState(90); // 0 new, 90 first quarter, 180 full, 270 last quarter

  const beta = 180 - s; // Moon's direction from Earth (Sun is at 180°, to the left)
  const mx = EX + ORB * Math.cos(rad(beta));
  const my = EY - ORB * Math.sin(rad(beta));
  const elong = s <= 180 ? s : 360 - s; // angle from the Sun, 0..180
  const waxing = s < 180;
  const illum = (1 - Math.cos(rad(elong))) / 2;

  return (
    <figure className="moon-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With the Moon ${elong.toFixed(0)}° from the Sun, ${(illum * 100).toFixed(0)}% of its lit half faces us: a ${nameOf(s).toLowerCase()}.`}>
        {/* ── left: the top-down orrery ── */}
        {/* sunlight from the left */}
        {[70, 105, 140, 175].map((y, i) => (
          <g key={i} className="text-maroon">
            <line x1={12} y1={y} x2={54} y2={y} stroke="currentColor" strokeWidth={1} opacity={0.4} />
            <path d={`M54 ${y} l-6 -3 v6 z`} fill="currentColor" opacity={0.4} />
          </g>
        ))}
        <text className="text-maroon" x={12} y={40} fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">sunlight →</text>

        {/* Moon's orbit */}
        <circle className="text-line" cx={EX} cy={EY} r={ORB} fill="none" stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.6} />
        {/* Earth */}
        <circle className="text-purple" cx={EX} cy={EY} r={8} fill="currentColor" opacity={0.85} />
        <text className="text-muted" x={EX} y={EY + 20} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>

        {/* line of sight Earth→Moon */}
        <line className="text-faint" x1={EX} y1={EY} x2={mx} y2={my} stroke="currentColor" strokeWidth={0.75} strokeDasharray="2 2" opacity={0.7} />

        {/* the Moon, half-lit toward the Sun (left) */}
        <g>
          <circle cx={mx} cy={my} r={9} className="text-ink" fill="currentColor" opacity={0.9} />
          {/* lit hemisphere = left half (facing the Sun) */}
          <path d={`M ${mx} ${my - 9} A 9 9 0 0 0 ${mx} ${my + 9} Z`} className="text-card" fill="currentColor" />
          <path d={`M ${mx} ${my - 9} A 9 9 0 0 0 ${mx} ${my + 9} Z`} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.5} />
        </g>

        {/* divider */}
        <line className="text-line" x1={228} y1={24} x2={228} y2={196} stroke="currentColor" strokeWidth={1} opacity={0.4} />
        <text className="text-faint" x={150} y={214} textAnchor="middle" fill="currentColor" fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">the truth, from above</text>

        {/* ── right: what we see from Earth (dark disk + lit half + terminator ellipse) ── */}
        <circle cx={DCX} cy={DCY} r={DR} className="text-ink" fill="currentColor" />
        <path d={`M${DCX} ${DCY - DR} A ${DR} ${DR} 0 0 ${waxing ? 1 : 0} ${DCX} ${DCY + DR} Z`} className="text-card" fill="currentColor" />
        <ellipse cx={DCX} cy={DCY} rx={Math.abs(DR * Math.cos(rad(elong)))} ry={DR} className={elong < 90 ? "text-card" : "text-ink"} fill="currentColor" />
        <circle cx={DCX} cy={DCY} r={DR} fill="none" className="text-line" stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={DCX} y={DCY + DR + 18} textAnchor="middle" fill="currentColor" fontSize={8} fontFamily="ui-sans-serif, system-ui, sans-serif">what we see from Earth</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong className="text-purple">{nameOf(s)}</strong> — the Moon is <strong>{elong.toFixed(0)}&deg;</strong> from the Sun, so <strong>{(illum * 100).toFixed(0)}%</strong> of its lit half faces us. {waxing ? "Waxing (growing)." : s > 357 || s < 3 ? "" : "Waning (shrinking)."}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Moon&rsquo;s place in its orbit</span><span className="tabular-nums">{s}&deg; of the cycle</span></span>
          <input type="range" min={0} max={360} step={1} value={s} onChange={(e) => setS(Number(e.target.value))} aria-label="Moon's place in its orbit" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["New", 0], ["First quarter", 90], ["Full", 180], ["Last quarter", 270]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setS(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Notice there is no shadow anywhere in this picture — the Earth casts none on the Moon here, and yet all the phases appear. That is the whole point: the phases are <em>not</em> the Earth&rsquo;s shadow. The Moon is a ball, and the Sun lights exactly half of it at every moment — a permanent day side and night side, shown on the left always facing the sunlight. What changes is only our <span className="text-purple">angle of view</span> as the Moon orbits. When the Moon sits between us and the Sun its lit half faces away and we see darkness (new); a quarter-turn later we catch the lit half edge-on (a half-disk); opposite the Sun its lit face turns fully toward us (full). The lit edge always bulges toward the Sun, which is why a crescent&rsquo;s bright side points to where the Sun has just set. The changing Moon is not the Moon changing at all — it is our view of an unchanging half-lit sphere, read from a moving vantage point.
      </figcaption>
    </figure>
  );
}
