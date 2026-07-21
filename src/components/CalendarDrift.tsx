"use client";

import { useState } from "react";

// An interactive calendar-drift explorer, embedded in an article via a fenced
// ```calendardrift block (see Reader's `pre` override). The tropical year is
// 365.2422 days — not a whole number — so any whole-number calendar drifts against
// the seasons unless corrected. The Julian rule (365.25, leap every 4 years) is a
// touch too long and creeps ~3 days per 400 years; the Gregorian refinement
// (skip 3 leap-days per 400 years, via the century rule) trims the average to
// 365.2425, almost exactly right. Slide the years and watch the Julian calendar
// wander off while the Gregorian one hugs the seasons. currentColor theming; first
// render deterministic.

const TRUE_YEAR = 365.2422;
const JULIAN = 365.25;
const GREGORIAN = 365.2425;
const X0 = 150, XW = 250; // bar geometry
const SCALE = XW / 32; // px per day (Julian tops out ~31 days over 4000 yr)

export function CalendarDrift() {
  const [years, setYears] = useState(1257); // 325 AD (Nicaea) → 1582 (Gregorian reform)

  const jul = (JULIAN - TRUE_YEAR) * years; // days the Julian calendar has gained
  const greg = (GREGORIAN - TRUE_YEAR) * years;
  const bar = (d: number) => Math.min(XW, Math.max(1.5, d * SCALE));

  return (
    <figure className="caldrift-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 200" className="w-full h-auto" role="img"
        aria-label={`After ${years} years, the Julian calendar has drifted ${jul.toFixed(1)} days from the seasons; the Gregorian calendar only ${greg.toFixed(2)}.`}>
        {/* "in step with the seasons" line */}
        <line className="text-line" x1={X0} y1={24} x2={X0} y2={164} stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.7} />
        <text className="text-faint" x={X0} y={18} textAnchor="middle" fill="currentColor" fontSize={7.5} fontFamily="ui-sans-serif, system-ui, sans-serif">in step with the seasons</text>

        {/* Julian bar */}
        <text className="text-maroon" x={X0 - 8} y={60} textAnchor="end" fill="currentColor" fontSize={10} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Julian</text>
        <text className="text-faint" x={X0 - 8} y={72} textAnchor="end" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">365.25 d</text>
        <rect className="text-maroon" x={X0} y={44} width={bar(jul)} height={22} fill="currentColor" opacity={0.55} />
        <text className="text-maroon" x={X0 + bar(jul) + 6} y={60} fill="currentColor" fontSize={11} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{jul.toFixed(1)} d off</text>

        {/* Gregorian bar */}
        <text className="text-purple" x={X0 - 8} y={122} textAnchor="end" fill="currentColor" fontSize={10} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Gregorian</text>
        <text className="text-faint" x={X0 - 8} y={134} textAnchor="end" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">365.2425 d</text>
        <rect className="text-purple" x={X0} y={106} width={bar(greg)} height={22} fill="currentColor" opacity={0.6} />
        <text className="text-purple" x={X0 + bar(greg) + 6} y={122} fill="currentColor" fontSize={11} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">{greg.toFixed(2)} d off</text>

        <text className="text-muted" x={X0 + XW / 2} y={184} textAnchor="middle" fill="currentColor" fontSize={8.5} fontFamily="ui-sans-serif, system-ui, sans-serif">true year: 365.2422 days · drift after {years.toLocaleString("en-US")} years</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        After <strong>{years.toLocaleString("en-US")} years</strong>, the <span className="text-maroon">Julian</span> calendar has slipped <strong>{jul.toFixed(1)} days</strong> from the seasons; the <span className="text-purple">Gregorian</span> one, only <strong>{greg.toFixed(2)}</strong>.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Years elapsed</span><span className="tabular-nums">{years.toLocaleString("en-US")} yr</span></span>
          <input type="range" min={0} max={4000} step={1} value={years} onChange={(e) => setYears(Number(e.target.value))} aria-label="Years elapsed" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setYears(1257)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">325 → 1582 AD (the reform)</button>
          <button type="button" onClick={() => setYears(3300)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">Gregorian: 1 day off</button>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Here is the root of leap years, and of that odd rule about century years. The <span className="text-ink">tropical year</span> — equinox to equinox, which governs the seasons — is <strong>365.2422 days</strong>, not a whole number, and that stubborn fraction is the whole problem: a calendar of whole-number years must drift against the seasons unless it is corrected. Julius Caesar&rsquo;s fix was the <span className="text-maroon">Julian</span> calendar — 365.25 days, a leap day every four years — close, but a touch too long, gaining about three days every four centuries. By 1582 it had slipped some ten days, dragging the equinox from March 21 to March 11. Pope Gregory&rsquo;s reform deleted ten days to snap it back, and refined the rule: leap year every four years, <em>except</em> century years, which are leap only if divisible by 400 — so 1700, 1800, and 1900 were skipped, but 1600 and 2000 kept. That removes three leap-days per 400 years, trimming the average to <span className="text-purple">365.2425 days</span> — off the true year by just 26 seconds, a single day&rsquo;s drift in some 3,300 years. The strange leap-century rule is not bureaucratic fussiness; it is a beautifully tuned answer to the fact that Earth&rsquo;s orbit simply refuses to take a whole number of Earth&rsquo;s spins. Even the calendar on your wall is astronomy in disguise.
      </figcaption>
    </figure>
  );
}
