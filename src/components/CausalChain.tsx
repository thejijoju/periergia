"use client";

import { useState } from "react";

// An interactive of Mars's size-to-death causal chain, embedded via a fenced ```causalchain
// block (see Reader's `pre` override). This is the capstone of Unit II: the eight links that
// convert the isolated fact "Mars has no magnetic field" into a sequence running from a
// planet's radius to its habitability, with independent evidence at nearly every step. Drag
// the slider to run the chain forward; each link lights up and its evidence appears below.
//
// Pure layout — no trig, no computed geometry beyond a linear stack — so SSR and client render
// identically.

type S = { t: string; d: string };
const STEPS: S[] = [
  { t: "Mars is small", d: "Radius 3,390 km — a surface-to-volume ratio 1.88× Earth's. (Why so small? Its feeding zone was truncated by Jupiter's excursion — the Mars problem of L5–L6. Its size is the root of the whole story.)" },
  { t: "It cooled about twice as fast", d: "Heat is generated throughout a planet's volume but lost only through its surface, and A/V = 3/R. A small world runs down fast — Mars shed its internal heat roughly twice as quickly as Earth." },
  { t: "The core stopped convecting", d: "Rapid cooling starved the core of the vigorous heat flow a dynamo needs. InSight's seismology shows the core is still LIQUID — so it did not freeze solid; it stopped convecting vigorously enough. The requirement that failed was heat flow, exactly as L7 specifies." },
  { t: "The dynamo died — before 4.1 Gyr ago", d: "Mars Global Surveyor found intensely magnetized ancient crust — but NONE around the Hellas and Argyre impact basins. Those impacts (≈4.1 Gyr) heated the rock past its Curie point and erased its magnetism, and no field ever re-magnetized it. So the dynamo was already gone by 4.1 Gyr — within the first ~500 Myr of the planet's life." },
  { t: "The solar wind reached the atmosphere", d: "With no magnetosphere, the solar wind (L2) — charged particles at 400–750 km/s — struck the upper atmosphere directly. And Mars's low escape velocity (5.03 km/s vs Earth's 11.19) made escape easy. Small size penalised Mars twice: it killed the shield AND lowered the barrier." },
  { t: "The atmosphere was stripped away", d: "This is measured, not just inferred: MAVEN has watched Mars lose its air since 2014, and seen the loss spike tenfold or more during solar storms — direct proof that solar activity drives it. The isotopes give the total: argon enriched in its heavy isotope implies ~two-thirds has escaped, and D/H is 5–6× Earth's." },
  { t: "Pressure fell below the triple point", d: "Surface pressure dropped past 6.11 mbar — the pressure below which liquid water cannot exist at ANY temperature. Below it, ice sublimates straight to vapour, skipping the liquid phase entirely. Mars now sits at 6.36 mbar, within 4% of that threshold." },
  { t: "A frozen desert", d: "Rivers stopped; lakes froze and sublimated or retreated underground; the remaining water locked into polar caps and buried ground ice. The surface has been essentially static ever since — apart from wind and the occasional impact." },
];

const NX = 66, NW = 308, NH = 26, TOP = 18, GAP = 34;

export function CausalChain() {
  const [cur, setCur] = useState(0);
  const s = STEPS[cur];

  return (
    <figure className="causalchain-scene my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox={`0 0 440 ${TOP + STEPS.length * GAP + 6}`} className="w-full h-auto" role="img"
        aria-label="The eight-link causal chain from Mars's small size to its death as a frozen desert: small size, faster cooling, core convection ceasing, the dynamo dying before 4.1 billion years ago, the solar wind reaching the atmosphere, the atmosphere being stripped away, surface pressure falling below the triple point, and a frozen desert.">
        {STEPS.map((st, i) => {
          const y = TOP + i * GAP;
          const on = i <= cur;
          const isCur = i === cur;
          return (
            <g key={i}>
              {i > 0 && (
                <path d={`M${NX + NW / 2} ${y - GAP + NH} L${NX + NW / 2} ${y}`}
                  className={on ? "text-maroon" : "text-line"} stroke="currentColor" strokeWidth={on ? 1.4 : 0.8} opacity={on ? 0.8 : 0.5} />
              )}
              <rect x={NX} y={y} width={NW} height={NH} rx={5}
                className={isCur ? "text-maroon" : on ? "text-maroon" : "text-line"}
                fill="currentColor" opacity={isCur ? 0.9 : on ? 0.22 : 0.08} />
              <rect x={NX} y={y} width={NW} height={NH} rx={5}
                className={isCur ? "text-maroon" : "text-line"} fill="none" stroke="currentColor" strokeWidth={isCur ? 1.4 : 0.7} opacity={isCur ? 1 : 0.5} />
              <circle cx={NX + 14} cy={y + NH / 2} r={8} className={on ? "text-maroon" : "text-muted"} fill="currentColor" opacity={on && !isCur ? 0.5 : 0.9} />
              <text x={NX + 14} y={y + NH / 2 + 3} textAnchor="middle" className={isCur ? "text-card" : "text-ink"} fill="currentColor"
                fontSize={8.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{i + 1}</text>
              <text x={NX + 30} y={y + NH / 2 + 3.2} className={isCur ? "text-card" : on ? "text-ink" : "text-faint"} fill="currentColor"
                fontSize={9.5} fontWeight={isCur ? 800 : 600} fontFamily="ui-sans-serif, system-ui, sans-serif">{st.t}</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-2 text-center font-sans text-[13px] text-ink">
        <strong className="text-maroon">Step {cur + 1} of 8 — {s.t}.</strong>{" "}
        <span className="text-muted">{s.d}</span>
      </p>

      <div className="mt-4">
        <input type="range" min={0} max={STEPS.length - 1} step={1} value={cur}
          onChange={(e) => setCur(Number(e.target.value))}
          className="w-full accent-maroon" aria-label="Step along the causal chain" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>a small planet</span><span>run the chain →</span><span>a frozen desert</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        This is what Lecture 7 promised, and it is the strongest single demonstration in the block that comparative planetology <em>explains</em> rather than catalogues. Eight links carry you from a single number — Mars&rsquo;s radius — to the fact that its surface is a frozen desert, and there is independent evidence at nearly every one: the crater-dated demagnetized basins that fix when the dynamo died, MAVEN watching the air escape in real time, the argon and deuterium isotopes that integrate the total loss, and the triple point that turns &ldquo;cold and dry&rdquo; into a thermodynamic prohibition. Small size penalises Mars twice over — it killed the magnetic shield <em>and</em> lowered the escape barrier — and everything downstream follows. The honest caveats remain: producing a genuinely warm early Mars is hard in climate models, and the carbon budget does not fully balance. But as a causal chain from a planet&rsquo;s <em>size</em> to its <em>habitability</em>, with a date attached to the critical step, it is as complete as anything in the solar system.
      </figcaption>
    </figure>
  );
}
