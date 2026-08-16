"use client";

import { useMemo, useRef, useState } from "react";
import { fireConfetti } from "@/lib/confetti";

// ── Place the number on the line ──────────────────────────────────────────
// A fenced ```lineplace block becomes an infinite estimation exercise: a
// number line with only its endpoints (and light ticks) labelled, a target
// number, and the instruction to click where it lives. Comparing two written
// numbers is one skill; knowing WHERE a number sits — that 470 lives just
// left of halfway between 0 and 1000 — is a different one, and it is the
// classic weak spot once numbers get big. Graded by distance, with the true
// spot revealed on every attempt; streak and levels match the drill widget.

const W = 440;
const AXIS_Y = 64;
const PAD = 30;

type Level = 1 | 2 | 3;

// Same seeded PRNG as the drills: deterministic first render, SSR-safe.
function mulberry32(a: number): () => number {
  return function () {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

const CFG: Record<Level, { max: number; tick: number; tol: number }> = {
  1: { max: 10, tick: 1, tol: 0.45 }, // click the right integer
  2: { max: 100, tick: 10, tol: 4 },
  3: { max: 1000, tick: 100, tol: 40 },
};

export function LinePlace() {
  const [lvl, setLvl] = useState<Level>(1);
  const [seed, setSeed] = useState(0);
  const [guess, setGuess] = useState<number | null>(null);
  const [asked, setAsked] = useState(0);
  const [streak, setStreak] = useState(0);
  const [best, setBest] = useState(0);
  const svgRef = useRef<SVGSVGElement | null>(null);

  const { max, tick, tol } = CFG[lvl];
  const target = useMemo(() => {
    const rng = mulberry32(seed * 4 + lvl + 11);
    // Keep clear of the labelled endpoints so the answer is never given away.
    const lo = max * 0.06;
    const hi = max * 0.94;
    const raw = lo + rng() * (hi - lo);
    return lvl === 1 ? Math.round(raw) : Math.round(raw / (max / 200)) * (max / 200);
  }, [seed, lvl, max]);

  const x = (v: number) => PAD + ((W - 2 * PAD) * v) / max;
  const value = (px: number) => Math.max(0, Math.min(max, ((px - PAD) / (W - 2 * PAD)) * max));

  const graded = guess !== null;
  const off = graded ? Math.abs(guess - target) : 0;
  const isRight = graded && off <= tol;

  const place = (e: React.MouseEvent<SVGSVGElement>) => {
    if (graded || !svgRef.current) return;
    const rect = svgRef.current.getBoundingClientRect();
    const px = ((e.clientX - rect.left) / rect.width) * W;
    const v = value(px);
    const snapped = lvl === 1 ? Math.round(v) : Math.round(v);
    setGuess(snapped);
    setAsked((n) => n + 1);
    if (Math.abs(snapped - target) <= tol) {
      setStreak((s) => {
        const next = s + 1;
        setBest((b) => Math.max(b, next));
        fireConfetti({ x: e.clientX, y: e.clientY, count: next % 5 === 0 ? 150 : 45 });
        return next;
      });
    } else {
      setStreak(0);
    }
  };

  const next = () => {
    setSeed((s) => s + 1);
    setGuess(null);
  };

  const setLevel = (l: Level) => {
    if (l === lvl) return;
    setLvl(l);
    setSeed((s) => s + 1);
    setGuess(null);
    setStreak(0);
  };

  const half = target > max / 2;
  const nearTick = Math.round(target / tick) * tick;

  return (
    <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
      <div className="px-4 sm:px-5 pt-3.5 pb-1 flex flex-wrap items-center gap-x-2 gap-y-1">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">∞ Drill</span>
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper">· Place it on the line</span>
        {asked > 0 && (
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper ml-auto">
            streak {streak}
            {best > 0 && ` · best ${best}`}
          </span>
        )}
      </div>
      <div className="px-4 sm:px-5 pb-2.5 flex items-center gap-1.5">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper mr-0.5">level</span>
        {([1, 2, 3] as Level[]).map((l) => (
          <button
            key={l}
            onClick={() => setLevel(l)}
            aria-pressed={l === lvl}
            className={`font-sans text-[12px] px-2.5 py-1 rounded-lg border transition-colors ${
              l === lvl ? "border-maroon text-maroon font-medium" : "border-line text-muted hover:border-ink hover:text-ink"
            }`}
          >
            {l === 1 ? "0–10" : l === 2 ? "0–100" : "0–1000"}
          </button>
        ))}
      </div>
      <div className="px-4 sm:px-5 pb-4">
        <p className="font-sans text-[15px] leading-relaxed text-ink mb-1.5">
          Where does <span className="font-mono font-semibold text-maroon">{target}</span> live? Click its spot on the
          line.
        </p>

        <svg
          ref={svgRef}
          viewBox={`0 0 ${W} 96`}
          onClick={place}
          className={`w-full h-auto ${graded ? "" : "cursor-crosshair"}`}
          role="img"
          aria-label={`Number line from 0 to ${max}. Click where ${target} belongs.`}
        >
          <line x1={PAD - 8} y1={AXIS_Y} x2={W - PAD + 8} y2={AXIS_Y} stroke="currentColor" strokeWidth={1.2} className="text-line" />
          {Array.from({ length: Math.floor(max / tick) + 1 }, (_, i) => {
            const v = i * tick;
            const labelled = v === 0 || v === max || (lvl === 1 && graded);
            return (
              <g key={v}>
                <line x1={x(v)} y1={AXIS_Y - 4} x2={x(v)} y2={AXIS_Y + 4} stroke="currentColor" strokeWidth={1} className="text-line" />
                {labelled && (
                  <text x={x(v)} y={AXIS_Y + 18} textAnchor="middle" fontSize={9.5} fill="currentColor" className="text-muted" fontFamily="ui-monospace, SFMono-Regular, Menlo, monospace">
                    {v}
                  </text>
                )}
              </g>
            );
          })}
          {/* halfway hint tick, slightly taller */}
          <line x1={x(max / 2)} y1={AXIS_Y - 7} x2={x(max / 2)} y2={AXIS_Y + 7} stroke="currentColor" strokeWidth={1} className="text-faint" />

          {graded && (
            <>
              {/* the reader's click */}
              <circle cx={x(guess!)} cy={AXIS_Y} r={4.5} fill="currentColor" className={isRight ? "text-[var(--ok-text)]" : "text-[var(--bad-text)]"} />
              <text x={x(guess!)} y={AXIS_Y - 12} textAnchor="middle" fontSize={9.5} fill="currentColor" className={isRight ? "text-[var(--ok-text)]" : "text-[var(--bad-text)]"} fontFamily="ui-sans-serif, system-ui, sans-serif">
                you: {guess}
              </text>
              {/* the true spot */}
              <line x1={x(target)} y1={AXIS_Y - 8} x2={x(target)} y2={AXIS_Y + 8} stroke="currentColor" strokeWidth={2} className="text-maroon" />
              <text x={x(target)} y={AXIS_Y + 30} textAnchor="middle" fontSize={9.5} fill="currentColor" className="text-maroon" fontFamily="ui-sans-serif, system-ui, sans-serif" fontWeight={700}>
                {target}
              </text>
            </>
          )}
        </svg>

        {graded && (
          <>
            <p className={`mt-2 font-sans text-[13px] font-semibold ${isRight ? "text-[var(--ok-text)]" : "text-[var(--bad-text)]"}`}>
              {isRight ? (off === 0 ? "Exactly right." : `Close enough — you were off by ${Math.round(off)}.`) : `Not quite — you were off by ${Math.round(off)}.`}
            </p>
            <p className="mt-1 font-sans text-[13px] leading-relaxed text-muted">
              {target} is {half ? "past" : "before"} halfway ({max / 2}), {target === nearTick ? `right on ${nearTick}` : `${target < nearTick ? "just before" : "just past"} ${nearTick}`}
              {lvl > 1 ? ` — the ticks mark every ${tick}.` : "."} Judging position, not just order, is what makes big numbers meaningful.
            </p>
            <button onClick={next} className="mt-2.5 font-sans text-[13px] font-medium text-maroon hover:underline underline-offset-2">
              Another one →
            </button>
          </>
        )}

        {!graded && asked > 0 && (
          <p className="mt-1.5 font-sans text-[12px] text-whisper">{asked} placed. The questions never run out.</p>
        )}
      </div>
    </div>
  );
}
