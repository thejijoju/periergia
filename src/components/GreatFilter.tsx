"use client";

import { useState } from "react";

// An interactive Great-Filter explorer, embedded in an article via a fenced
// ```greatfilter block (see Reader's `pre` override). The Fermi paradox implies
// that somewhere on the road from dead matter to a galaxy-spanning civilisation
// sits at least one near-impossible step almost nothing passes. Drag the filter
// along that road: if it falls BEHIND our present position, the hard step is done
// and our future is open (good news); if it falls AHEAD, civilisations reliably
// die before they spread — and so may we (a prophecy of doom). The sting, which
// this widget makes visceral: every step we find OTHERS have also passed pushes
// the filter later, toward us — so discovering abundant alien life is ominous, and
// a sterile universe is a reprieve. currentColor theming; first render
// deterministic (filter behind us, at the origin of life).

// The road, dead matter -> galaxy-spanning civilisation. "us" sits at index 5
// (we are technological, not yet expansionist across the stars).
const STEPS = [
  "habitable planet",
  "origin of life",
  "complex cells",
  "intelligence",
  "technology",
  "star-spanning civilisation",
];
const US = 4.5; // between "technology" (4) and "expansion" (5): our present rung

const X0 = 30, X1 = 424, Y = 92;
const sx = (i: number) => X0 + (i / (STEPS.length - 1)) * (X1 - X0);

export function GreatFilter() {
  const [filter, setFilter] = useState(1); // index of the near-impossible step

  const behind = filter < US;
  const verdict = behind
    ? { head: "The filter is behind us", tone: "text-purple",
        body: "We are rare because we already passed the near-impossible step. The hard part is done; our future is open." }
    : { head: "The filter is ahead of us", tone: "text-maroon",
        body: "Civilisations reliably reach roughly our stage and then fail before they spread. We are approaching the same barrier that silenced everyone else." };

  return (
    <figure className="gf-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 150" className="w-full h-auto" role="img"
        aria-label={`With the Great Filter at "${STEPS[filter]}", the barrier lies ${behind ? "behind our present position — reassuring" : "ahead of our present position — ominous"}.`}>
        {/* the road */}
        <line className="text-line" x1={X0} y1={Y} x2={X1} y2={Y} stroke="currentColor" strokeWidth={2} />
        <text className="text-faint" x={X0} y={Y + 26} fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">dead matter</text>
        <text className="text-faint" x={X1} y={Y + 26} textAnchor="end" fill="currentColor" fontSize={8}
          fontFamily="ui-sans-serif, system-ui, sans-serif">the galaxy</text>

        {/* the steps */}
        {STEPS.map((s, i) => {
          const isFilter = i === filter;
          return (
            <g key={s}>
              <circle cx={sx(i)} cy={Y} r={isFilter ? 7 : 4}
                className={isFilter ? "text-maroon" : "text-ink"} fill="currentColor" opacity={isFilter ? 1 : 0.55} />
              {isFilter && (
                <circle cx={sx(i)} cy={Y} r={11} className="text-maroon" fill="none" stroke="currentColor" strokeWidth={1.4} opacity={0.6} />
              )}
              <text x={sx(i)} y={i % 2 ? Y - 16 : Y - 30} textAnchor="middle"
                className={isFilter ? "text-maroon" : "text-muted"} fill="currentColor" fontSize={7.5}
                fontWeight={isFilter ? 700 : 500} fontFamily="ui-sans-serif, system-ui, sans-serif">{s}</text>
              <line x1={sx(i)} y1={i % 2 ? Y - 13 : Y - 27} x2={sx(i)} y2={Y - 8}
                className={isFilter ? "text-maroon" : "text-line"} stroke="currentColor" strokeWidth={0.75} opacity={0.5} />
            </g>
          );
        })}

        {/* the filter wall */}
        <line x1={sx(filter)} y1={Y - 6} x2={sx(filter)} y2={Y + 6} className="text-maroon" stroke="currentColor" strokeWidth={3} />

        {/* "us" marker */}
        <g className="text-purple">
          <line x1={sx(US)} y1={Y} x2={sx(US)} y2={Y + 34} stroke="currentColor" strokeWidth={1.4} strokeDasharray="3 2" opacity={0.7} />
          <path d={`M${sx(US)} ${Y + 34} l-4 -6 h8 z`} fill="currentColor" />
          <text x={sx(US)} y={Y + 46} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={800}
            fontFamily="ui-sans-serif, system-ui, sans-serif">us, now</text>
        </g>
      </svg>

      <div className={`mt-1 rounded-lg border p-3 text-center ${behind ? "border-purple/60 bg-purple/10" : "border-maroon/50 bg-maroon/5"}`}>
        <div className={`text-[14px] font-bold ${verdict.tone}`}>{verdict.head}</div>
        <div className="mt-1 text-[11.5px] text-faint">{verdict.body}</div>
      </div>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Where is the near-impossible step?</span>
            <span className="tabular-nums text-ink">{STEPS[filter]}</span>
          </span>
          <input type="range" min={0} max={STEPS.length - 1} step={1} value={filter}
            onChange={(e) => setFilter(Number(e.target.value))}
            aria-label="Position of the Great Filter along the road to galactic civilisation" className="mt-1 w-full"
            style={{ accentColor: behind ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setFilter(1)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Life is the filter (behind us)
          </button>
          <button type="button" onClick={() => setFilter(5)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Expansion is the filter (ahead)
          </button>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The galaxy&rsquo;s silence means almost nothing completes the road from dead matter to a star-spanning civilisation — so somewhere on it sits at least one <span className="text-maroon">near-impossible step</span>, the Great Filter. Everything turns on where it lies relative to <span className="text-purple">us</span>. If it is <span className="text-purple">behind</span> us — if the origin of life, say, or the leap to complex cells almost never happens — then we are simply rare, the hard part is done, and our future is open. If it is <span className="text-maroon">ahead</span> — if civilisations reliably destroy themselves before they spread — then the silence is the silence of countless dead predecessors, and we are walking toward the same wall. Here is the sting the search cannot escape: every rung we discover that <em>others also climbed</em> pushes the filter later, toward us. So finding an alien biosphere — proof that the origin of life is easy — would be <span className="text-maroon">ominous</span>, and finding the universe sterile might be a <span className="text-purple">reprieve</span>. In this one strange corner of science, dead rocks are the good news. (The inference is not airtight — going quiet is not going extinct, and we can only observe from a rung we happened to survive to — but the sting is real enough to take seriously.)
      </figcaption>
    </figure>
  );
}
