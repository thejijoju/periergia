"use client";

import { useState } from "react";

// An interactive step-through of Venus's runaway greenhouse, embedded via a fenced ```runaway
// block (see Reader's `pre` override). Drag the slider through five states — a young ocean
// world, the Stage-1 water-vapour feedback that boils the ocean into the sky, the Stage-2
// photodissociation that lets hydrogen escape and destroys the water for good, the Stage-3
// accumulation of volcanic CO2 to 92 bar, and the closing verdict: Earth holds as much CO2,
// but locked in limestone, because it kept its water. Every geometric quantity is a per-stage
// literal scaled by pure arithmetic, so SSR and client render identically (no trig, no solver).
// currentColor theming: purple stands in for water/steam, maroon for heat and CO2.

type S = {
  label: string; head: string; body: string;
  temp: number; ocean: number; atm: number; atmHot: boolean;
  bar: string; water: string; co2: string; h: number; rev: boolean;
};

const STAGES: S[] = [
  {
    label: "Young Venus", head: "A young ocean world",
    body: "Four billion years ago Venus plausibly had oceans, like the young Earth — the D/H evidence (see the next box) points to it. Its carbon dioxide is locked away in silicate rock, and a modest greenhouse keeps the surface temperate and habitable.",
    temp: 290, ocean: 1.0, atm: 1, atmHot: false, bar: "≈1 bar", water: "oceans", co2: "in the crust", h: 0, rev: true,
  },
  {
    label: "Stage 1 · runaway feedback", head: "Warming boils the ocean into the sky",
    body: "The surface warms slightly; warmer oceans evaporate more water; water vapour is itself a powerful greenhouse gas, so it traps more heat and warms the surface further. Past a threshold the loop stops converging — it runs away, until the entire ocean is airborne as steam. This stage is still reversible: cool the planet and the water would rain back out.",
    temp: 500, ocean: 0.14, atm: 3, atmHot: false, bar: "dense steam", water: "evaporating", co2: "in the crust", h: 0, rev: true,
  },
  {
    label: "Stage 2 · water destroyed", head: "Ultraviolet light destroys the water",
    body: "With the whole ocean airborne, the cold trap that normally freezes water out is overwhelmed. Vapour reaches high altitude, where solar ultraviolet photodissociates it: H₂O → 2H + O. Hydrogen is the lightest element and escapes to space (L7's retention criterion); the heavy oxygen stays behind and oxidises the rock. This step is irreversible — the hydrogen is gone, and the water can never be reassembled.",
    temp: 600, ocean: 0.0, atm: 3, atmHot: true, bar: "dry steam", water: "split by UV", co2: "in the crust", h: 3, rev: false,
  },
  {
    label: "Stage 3 · CO₂ accumulates", head: "Carbon dioxide builds without limit",
    body: "No liquid water means no carbon–silicate cycle: nothing weathers rock, nothing forms carbonate, nothing removes CO₂. Volcanoes keep outgassing it and it simply accumulates — for billions of years — until it reaches 92 bar. That is a +510 K greenhouse over a 737 K surface, locked in permanently.",
    temp: 737, ocean: 0.0, atm: 6, atmHot: true, bar: "92 bar CO₂", water: "none", co2: "in the air", h: 1, rev: false,
  },
  {
    label: "The verdict", head: "Earth has as much CO₂ — but in rock",
    body: "The twist: Earth holds roughly as much total CO₂ as Venus — perhaps 60–100 bars of it, locked in limestone, chalk and marine shells. The difference between a living world and an oven is not how much CO₂ a planet has, but where it is. The agent that moved Earth's carbon from the air into the stone was liquid water — and that is exactly what Venus lost.",
    temp: 737, ocean: 0.0, atm: 6, atmHot: true, bar: "92 bar CO₂", water: "none", co2: "in the air", h: 0, rev: false,
  },
];

const r1 = (n: number) => Math.round(n * 10) / 10;

// column geometry (all constant)
const COLX = 60, COLW = 128, COLTOP = 60, GROUNDY = 206, ROCKH = 18;
const OCEANMAX = 62;           // ocean band height at ocean = 1.0
// thermometer
const THX = 250, THTOP = 62, THBOT = 210, THH = THBOT - THTOP;
// fixed escaping-hydrogen positions (static → hydration-safe)
const HPOS = [
  { x: 92, y: 40 }, { x: 128, y: 30 }, { x: 162, y: 44 },
];

export function Runaway() {
  const [step, setStep] = useState(0);
  const s = STAGES[step];

  const oceanH = r1(s.ocean * OCEANMAX);
  const oceanY = r1(GROUNDY - ROCKH - oceanH);
  const tintOp = r1(0.05 + s.atm * 0.045);
  const thFrac = Math.max(0, Math.min(1, (s.temp - 250) / 500));
  const thH = r1(thFrac * THH);
  const thY = r1(THBOT - thH);

  return (
    <figure className="runaway-scene my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label="Step-through of Venus's runaway greenhouse: a young ocean world, warming that boils the ocean into the sky, ultraviolet destruction of the airborne water as hydrogen escapes to space, unchecked accumulation of volcanic carbon dioxide to 92 bar, and the verdict that Earth holds as much carbon dioxide but locked in rock because it kept its water.">

        {/* sun */}
        <circle className="text-maroon" cx={28} cy={26} r={11} fill="currentColor" opacity={0.85} />
        <g className="text-maroon" stroke="currentColor" strokeWidth={1} opacity={0.5}>
          <line x1={28} y1={8} x2={28} y2={2} /><line x1={45} y1={20} x2={51} y2={17} />
          <line x1={12} y1={20} x2={6} y2={17} /><line x1={44} y1={36} x2={50} y2={39} />
        </g>

        {/* space / planet column */}
        <rect x={COLX} y={COLTOP} width={COLW} height={GROUNDY - COLTOP} rx={5}
          className="text-line" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        {/* atmosphere tint */}
        <rect x={COLX} y={COLTOP} width={COLW} height={GROUNDY - COLTOP} rx={5}
          className={s.atmHot ? "text-maroon" : "text-purple"} fill="currentColor" opacity={tintOp} />
        {/* rock */}
        <rect x={COLX} y={GROUNDY - ROCKH} width={COLW} height={ROCKH}
          className="text-muted" fill="currentColor" opacity={0.55} />
        <text className="text-faint" x={COLX + COLW / 2} y={GROUNDY - ROCKH / 2 + 3} textAnchor="middle"
          fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">
          rock · CO₂ {s.co2}
        </text>
        {/* ocean */}
        {oceanH > 0.5 && (
          <>
            <rect x={COLX} y={oceanY} width={COLW} height={oceanH}
              className="text-purple" fill="currentColor" opacity={0.55} />
            <text className="text-ink" x={COLX + COLW / 2} y={oceanY + oceanH / 2 + 3} textAnchor="middle"
              fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
              ocean
            </text>
          </>
        )}
        {/* atmosphere label */}
        <text className={s.atmHot ? "text-maroon" : "text-purple"} x={COLX + COLW / 2} y={COLTOP + 14}
          textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">{s.bar}</text>

        {/* escaping hydrogen */}
        {HPOS.slice(0, s.h).map((p, i) => (
          <g key={i} className="text-ink" opacity={0.85}>
            <line x1={p.x} y1={p.y + 12} x2={p.x} y2={p.y} stroke="currentColor" strokeWidth={0.9} />
            <path d={`M${p.x - 2.5} ${p.y + 3} L${p.x} ${p.y} L${p.x + 2.5} ${p.y + 3}`}
              fill="none" stroke="currentColor" strokeWidth={0.9} />
            <text x={p.x + 4} y={p.y + 9} fill="currentColor" fontSize={7} fontWeight={800}
              fontFamily="ui-sans-serif, system-ui, sans-serif">H</text>
          </g>
        ))}
        {s.h > 0 && (
          <text className="text-faint" x={COLX + COLW / 2} y={COLTOP - 6} textAnchor="middle"
            fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">
            hydrogen escaping to space
          </text>
        )}

        {/* thermometer */}
        <rect x={THX} y={THTOP} width={12} height={THH} rx={6}
          className="text-line" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        <rect x={THX} y={thY} width={12} height={thH} rx={6}
          className="text-maroon" fill="currentColor" opacity={0.85} />
        <text className="text-maroon" x={THX + 18} y={thY + 4} textAnchor="start"
          fill="currentColor" fontSize={11} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{s.temp} K</text>
        <text className="text-faint" x={THX + 6} y={THBOT + 12} textAnchor="middle"
          fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">surface</text>

        {/* state panel */}
        <text className="text-faint" x={THX + 18} y={thY + 18} textAnchor="start"
          fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">water: {s.water}</text>
        <text className={s.rev ? "text-muted" : "text-maroon"} x={THX + 18} y={thY + 29} textAnchor="start"
          fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {s.rev ? "still reversible" : "irreversible"}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] font-semibold text-ink">
        {s.label} — <span className={s.atmHot ? "text-maroon" : "text-ink"}>{s.head}</span>
      </p>
      <p className="mx-auto mt-1 max-w-prose text-center font-sans text-[12.5px] leading-snug text-muted">
        {s.body}
      </p>

      <div className="mt-4">
        <input type="range" min={0} max={STAGES.length - 1} step={1} value={step}
          onChange={(e) => setStep(Number(e.target.value))}
          className="w-full accent-maroon" aria-label="Runaway greenhouse stage" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          {STAGES.map((st, i) => (
            <button key={i} type="button" onClick={() => setStep(i)}
              className={`px-0.5 ${i === step ? "font-bold text-maroon" : "hover:text-ink"}`}>
              {i}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The runaway greenhouse is not one event but a chain of three, each stage handing off to the next and two of them impossible to undo. Stage&nbsp;1 is an ordinary positive feedback — warming, evaporation, more water vapour, more warming — of the kind Earth also has; the difference is only that on Venus it fails to converge and empties the ocean into the air. Stage&nbsp;2 is where the loss becomes permanent: airborne water reaches sunlight fierce enough to break it apart, and the freed hydrogen is too light to hold, so it leaks away forever. Stage&nbsp;3 is the slow finish — with no water to weather rock and bury carbon, volcanic CO₂ has nowhere to go but the sky, and over aeons it piles up to ninety-two bars. The verdict at the end is the whole point of the lecture: Earth carries just as much carbon dioxide, but liquid water long ago carried ours down into the rock. Venus is what a rocky planet becomes when it loses the one substance that files its carbon away.
      </figcaption>
    </figure>
  );
}
