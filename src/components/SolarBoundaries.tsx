"use client";

import { useState } from "react";

// An interactive "where does the solar system end?" explorer, embedded via a fenced
// ```solarboundaries block (see Reader's `pre` override). The conceptual payoff of the
// lecture: the question has two defensible answers separated by a factor of ~833, and
// the gap is the point. Toggle between the WIND boundary — the heliopause at ~120 AU,
// where the solar wind yields to interstellar gas, crossed by the Voyagers — and the
// GRAVITY boundary — the outer Oort Cloud at ~100,000 AU (1.58 light-years), where the
// Sun's gravitational grip finally fails. Both live on one logarithmic axis spanning
// five decades, so you can see that the Voyagers have "left the solar system" and are
// nowhere near leaving it, simultaneously. All positions are baked literals (log10 of
// fixed distances) for byte-identical SSR/client markup; currentColor theming. First
// render deterministic (the wind boundary).

const AX = 150, X0 = 40, X1 = 418; // axis geometry; log10 scale over 1..1e5 AU

// feature: label, distance (AU), pre-computed x, which boundary it belongs to
const DECADES: [string, number][] = [["1", 40], ["10", 115.6], ["100", 191.2], ["1,000", 266.8], ["10,000", 342.4], ["100,000", 418]];

type Mode = "wind" | "gravity";

export function SolarBoundaries() {
  const [mode, setMode] = useState<Mode>("wind");
  const wind = mode === "wind";

  return (
    <figure className="boundaries-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={wind
          ? "The heliopause, the wind boundary, at about 120 AU — roughly four times Neptune's distance — crossed by the Voyager spacecraft."
          : "The gravitational boundary, the outer Oort Cloud, at about 100,000 AU or 1.58 light-years — some 833 times farther out than the heliopause."}>

        {/* the log axis */}
        <line className="text-line" x1={X0} y1={AX} x2={X1} y2={AX} stroke="currentColor" strokeWidth={1} />
        {DECADES.map(([lbl, x]) => (
          <g key={lbl}>
            <line className="text-faint" x1={x} y1={AX - 3} x2={x} y2={AX + 3} stroke="currentColor" strokeWidth={0.7} opacity={0.6} />
            <text className="text-faint" x={x} y={AX + 14} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{lbl}</text>
          </g>
        ))}
        <text className="text-faint" x={(X0 + X1) / 2} y={AX + 26} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">distance from the Sun (AU, log scale)</text>

        {/* Sun */}
        <circle className="text-maroon" cx={X0} cy={AX} r={6} fill="currentColor" />
        <text className="text-faint" x={X0} y={AX - 12} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun</text>

        {/* Neptune — the last planet, for reference (always shown, faint) */}
        <circle className="text-faint" cx={151.7} cy={AX} r={2.6} fill="currentColor" opacity={0.7} />
        <text className="text-faint" x={151.7} y={AX - 10} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.8}>Neptune</text>

        {/* the WIND boundary group: heliosphere structure + Voyagers */}
        <g opacity={wind ? 1 : 0.28}>
          {/* heliosphere shaded band from Sun to heliopause */}
          <rect className="text-purple" x={X0} y={AX - 26} width={197.2 - X0} height={52} fill="currentColor" opacity={wind ? 0.07 : 0.04} />
          <line className="text-purple" x1={185.9} y1={AX - 20} x2={185.9} y2={AX + 20} stroke="currentColor" strokeWidth={0.9} strokeDasharray="2 2" opacity={0.7} />
          <text className="text-purple" x={185.9} y={AX + 40} textAnchor="middle" fill="currentColor" fontSize={5.8} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>term. shock</text>
          <line className="text-purple" x1={197.2} y1={AX - 30} x2={197.2} y2={AX + 24} stroke="currentColor" strokeWidth={1.6} />
          <text className="text-purple" x={197.2} y={AX - 34} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">heliopause</text>
          <text className="text-purple" x={197.2} y={AX - 25} textAnchor="middle" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">~120 AU</text>
          <circle className="text-ink" cx={208} cy={AX} r={3} fill="currentColor" />
          <text className="text-ink" x={214} y={AX - 6} textAnchor="start" fill="currentColor" fontSize={6.2} fontFamily="ui-sans-serif, system-ui, sans-serif">Voyager 1</text>
        </g>

        {/* the GRAVITY boundary group: Oort Cloud shell */}
        <g opacity={wind ? 0.28 : 1}>
          <rect className="text-maroon" x={289.6} y={AX - 26} width={418 - 289.6} height={52} fill="currentColor" opacity={wind ? 0.04 : 0.09} />
          <line className="text-maroon" x1={289.6} y1={AX - 22} x2={289.6} y2={AX + 22} stroke="currentColor" strokeWidth={0.9} strokeDasharray="2 2" opacity={0.7} />
          <text className="text-maroon" x={300} y={AX - 30} textAnchor="middle" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">Oort Cloud</text>
          <line className="text-maroon" x1={418} y1={AX - 30} x2={418} y2={AX + 24} stroke="currentColor" strokeWidth={1.6} />
          <text className="text-maroon" x={418} y={AX - 34} textAnchor="end" fill="currentColor" fontSize={7.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">gravity edge</text>
          <text className="text-maroon" x={418} y={AX - 25} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">~100,000 AU</text>
        </g>

        {/* headline readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className={wind ? "text-purple" : "text-maroon"} x={X0} y={30} fill="currentColor" fontSize={9} fontWeight={700}>{wind ? "where the Sun's WIND stops" : "where the Sun's GRAVITY stops"}</text>
          <text className={wind ? "text-purple" : "text-maroon"} x={X0} y={52} fill="currentColor" fontSize={20} fontWeight={800}>{wind ? "~120 AU" : "~100,000 AU"}</text>
          <text className="text-muted" x={X0} y={66} fill="currentColor" fontSize={7.5}>{wind ? "the heliopause — Voyager 1 crossed it in 2012" : "the outer Oort Cloud — 1.58 light-years"}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {wind
          ? <>The <strong className="text-purple">wind</strong> answer: the solar system ends at the <strong>heliopause, ~120 AU</strong>, where the solar wind yields to interstellar gas. <strong>The Voyagers have left.</strong></>
          : <>The <strong className="text-maroon">gravity</strong> answer: it ends at the <strong>Oort Cloud&rsquo;s edge, ~100,000 AU</strong> — <strong>833× farther</strong>. By this measure the Voyagers are nowhere near leaving.</>}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {(["wind", "gravity"] as Mode[]).map((m) => (
          <button key={m} type="button" onClick={() => setMode(m)}
            className={`font-sans text-[12px] rounded-md border px-3 py-1 transition-colors ${mode === m ? (m === "wind" ? "border-purple text-purple font-semibold" : "border-maroon text-maroon font-semibold") : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {m === "wind" ? "the wind boundary (heliosphere)" : "the gravity boundary (Oort Cloud)"}
          </button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A question that sounds elementary — <em>where does the solar system end?</em> — has two honest answers a thousandfold apart, and the gap is the lesson. Track the Sun&rsquo;s <strong className="text-purple">wind</strong>, and the edge is the <strong>heliopause</strong> at about <strong>120 AU</strong> (roughly four times Neptune&rsquo;s distance), where the solar wind&rsquo;s outward push finally balances the pressure of interstellar gas. We have crossed it: <strong>Voyager 1 in 2012 at 121 AU, Voyager 2 in 2018 at 119 AU</strong> — the only human objects ever to do so, still transmitting. But track the Sun&rsquo;s <strong className="text-maroon">gravity</strong> instead, and the edge is the outer <strong>Oort Cloud</strong> near <strong>100,000 AU — 1.58 light-years</strong>, where icy bodies still orbit the Sun on million-year paths. That boundary lies about <strong>833 times farther out.</strong> Why so different? The heliopause is a <em>pressure balance</em> between two thin plasmas, and the wind thins as it spreads over an ever-larger sphere; the Oort edge is <em>gravitational competition</em> with the galaxy, and gravity falls only as 1/<em>r</em>², is never shielded, and never cancels — so it reaches vastly farther. The Voyagers have simultaneously left the solar system and are nowhere near leaving it. &ldquo;Where does X end?&rdquo; often has no single answer, because a star&rsquo;s influence takes several forms with very different ranges — a lesson that returns when we argue about what counts as a planet.
      </figcaption>
    </figure>
  );
}
