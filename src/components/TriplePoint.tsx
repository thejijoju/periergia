"use client";

import { useState } from "react";

// An interactive phase diagram of water, embedded via a fenced ```triplepoint block (see
// Reader's `pre` override). The decisive physics of the Mars lecture: below the triple-point
// pressure (6.11 mbar) the LIQUID phase does not exist at any temperature — ice sublimates
// straight to vapour. Mars's surface pressure is 6.36 mbar, within 4% of that threshold, so
// rivers are thermodynamically impossible today. Drag the slider to thicken Mars's early
// atmosphere and watch the liquid-water window open; thin it back to today and it closes.
//
// Every phase-boundary coordinate and every pressure-step y is a baked literal (the pressure
// axis is logarithmic, computed offline and frozen); only the temperature axis is a live
// linear map (multiply/add), so SSR and client render identically — no log/pow at runtime.

const X0 = 55, X1 = 410, YT = 30, YB = 180;
const xOf = (T: number) => Math.round((X0 + ((T - 150) / 170) * (X1 - X0)) * 10) / 10;

// baked phase boundaries (pixel coords; pressure is log-scaled offline)
const SUBLIM = "312.2,144.3 295,158.3 263.8,180";
const VAPOR = "312.2,144.3 368.2,109.8 410,88.2";
const MELT = "312.2,144.3 311,90 310,43";
const LIQUID = "312.2,144.3 311,90 310,43 410,43 410,88.2 368.2,109.8";
const TP = { x: 312.2, y: 144.3 };
const MARS = { x: 180.3, y: 143.5 };
const EARTH = { x: 343.2, y: 43.4 };

type P = { label: string; y: number; xR: number; possible: boolean; note: string };
const PRESSURES: P[] = [
  { label: "3 mbar", y: 158.3, xR: 0, possible: false, note: "Below the triple point — liquid water is impossible at any temperature; ice can only sublimate to vapour." },
  { label: "6.36 mbar — Mars today", y: 143.5, xR: 313.5, possible: true, note: "Barely above the limit. Liquid is permitted only in a sliver near 0 °C — and nowhere on Mars is both that warm and that low. In practice: no rivers." },
  { label: "12 mbar — deepest basins", y: 131, xR: 333.8, possible: true, note: "In Hellas, 7 km down, pressure allows liquid — but it is far too cold there for ice to melt. The two conditions never meet." },
  { label: "50 mbar — a modest early air", y: 102.8, xR: 381.7, possible: true, note: "Now liquid water is possible wherever it is warm enough — a real window opens." },
  { label: "200 mbar — a thick early air", y: 75.4, xR: 410, possible: true, note: "Rivers, lakes, and deltas are thermodynamically allowed across a broad temperature range — the ancient Mars the rocks record." },
  { label: "600 mbar", y: 53.7, xR: 410, possible: true, note: "A substantial atmosphere; liquid water is stable over most of the surface's temperature range." },
  { label: "1013 mbar — Earth", y: 43.4, xR: 410, possible: true, note: "Earth's sea-level pressure, for comparison: liquid water across a wide band of temperatures." },
];
const XL = 310.5; // melting line — near-vertical, so the liquid window's left edge is ~constant

export function TriplePoint() {
  const [i, setI] = useState(1); // start at Mars today
  const p = PRESSURES[i];

  return (
    <figure className="triplepoint-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label="Phase diagram of water on pressure-temperature axes. Below the triple-point pressure of 6.11 millibar the liquid field vanishes and ice sublimates directly to vapour. Mars today sits at 6.36 millibar, essentially at that threshold, so liquid water is impossible; thickening the early atmosphere opens a liquid-water window, as Earth at 1013 millibar enjoys.">

        {/* axes */}
        <line x1={X0} y1={YB} x2={X1} y2={YB} className="text-line" stroke="currentColor" strokeWidth={0.8} opacity={0.6} />
        <line x1={X0} y1={YT} x2={X0} y2={YB} className="text-line" stroke="currentColor" strokeWidth={0.8} opacity={0.6} />
        {[200, 250, 300].map((T) => (
          <text key={T} className="text-faint" x={xOf(T)} y={YB + 11} textAnchor="middle" fill="currentColor" fontSize={6}
            fontFamily="ui-sans-serif, system-ui, sans-serif">{T} K</text>
        ))}
        {[["6", 144.3], ["10", 131], ["100", 89.1], ["1000", 43.7]].map(([lab, yy]) => (
          <text key={lab as string} className="text-faint" x={X0 - 3} y={(yy as number) + 2} textAnchor="end" fill="currentColor" fontSize={5.6}
            fontFamily="ui-sans-serif, system-ui, sans-serif">{lab}</text>
        ))}
        <text className="text-faint" x={X0 - 3} y={YT - 4} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">mbar</text>

        {/* liquid-stability field */}
        <polygon points={LIQUID} className="text-purple" fill="currentColor" opacity={0.16} />
        {/* boundaries */}
        <polyline points={SUBLIM} className="text-line" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        <polyline points={VAPOR} className="text-line" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />
        <polyline points={MELT} className="text-line" fill="none" stroke="currentColor" strokeWidth={1} opacity={0.7} />

        {/* region labels */}
        <text className="text-faint" x={150} y={95} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">ICE</text>
        <text className="text-purple" x={352} y={70} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">LIQUID</text>
        <text className="text-faint" x={300} y={172} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">VAPOUR</text>

        {/* triple-point reference line + point */}
        <line x1={X0} y1={TP.y} x2={X1} y2={TP.y} className="text-ink" stroke="currentColor" strokeWidth={0.6} strokeDasharray="2 3" opacity={0.45} />
        <text className="text-ink" x={X1} y={TP.y - 3} textAnchor="end" fill="currentColor" fontSize={6} opacity={0.7} fontFamily="ui-sans-serif, system-ui, sans-serif">triple point · 6.11 mbar</text>
        <circle cx={TP.x} cy={TP.y} r={2.6} className="text-ink" fill="currentColor" />

        {/* current-pressure line + the liquid window it permits */}
        <line x1={X0} y1={p.y} x2={X1} y2={p.y} className="text-maroon" stroke="currentColor" strokeWidth={1.1} opacity={0.85} />
        {p.possible && p.xR - XL > 1.5 && (
          <line x1={XL} y1={p.y} x2={p.xR} y2={p.y} className="text-maroon" stroke="currentColor" strokeWidth={4} opacity={0.5} />
        )}

        {/* Mars and Earth markers */}
        <circle cx={MARS.x} cy={MARS.y} r={3.4} className="text-maroon" fill="currentColor" />
        <text className="text-maroon" x={MARS.x} y={MARS.y + 12} textAnchor="middle" fill="currentColor" fontSize={6.6} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">Mars (210 K)</text>
        <circle cx={EARTH.x} cy={EARTH.y} r={3.4} className="text-ink" fill="currentColor" />
        <text className="text-ink" x={EARTH.x + 5} y={EARTH.y + 3} textAnchor="start" fill="currentColor" fontSize={6.6} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Earth</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong>{p.label}</strong>, liquid water is{" "}
        {p.possible
          ? <strong className="text-maroon">permitted</strong>
          : <strong className="text-maroon">impossible at any temperature</strong>}.{" "}
        <span className="text-muted">{p.note}</span>
      </p>

      <div className="mt-4">
        <input type="range" min={0} max={PRESSURES.length - 1} step={1} value={i}
          onChange={(e) => setI(Number(e.target.value))}
          className="w-full accent-maroon" aria-label="Surface pressure" />
        <div className="mt-1 flex justify-between font-sans text-[10px] text-faint">
          <span>3 mbar (thin)</span><span>← thicken the atmosphere →</span><span>1013 mbar</span>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Water&rsquo;s triple point — the one pressure and temperature at which ice, liquid, and vapour coexist — sits at <strong>6.11 mbar</strong> and 273 K, and it draws a hard line: <strong>below 6.11 mbar the liquid phase does not exist at any temperature.</strong> Heat ice at that pressure and it sublimates straight to vapour, exactly as dry ice does in open air. Mars&rsquo;s mean surface pressure is <strong>6.36 mbar</strong> — within four percent of the threshold — so across almost the whole planet, at almost all times, liquid water is not merely unlikely but <em>thermodynamically forbidden</em>. That is why Mars is a frozen desert with polar caps and buried ice but no rivers: the water is still there; the atmosphere is not. And it sharpens the puzzle the valley networks pose. Since liquid water is impossible at today&rsquo;s pressure, the branching riverbeds cannot record merely a <em>warmer</em> Mars — they demand a <em>thicker</em> one. Slide the atmosphere back up and the liquid window reopens; the whole causal chain of this lecture exists to explain how Mars lost the pressure that closed it.
      </figcaption>
    </figure>
  );
}
