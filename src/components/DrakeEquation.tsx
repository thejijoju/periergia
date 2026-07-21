"use client";

import { useState } from "react";

// An interactive Drake-equation explorer, embedded in an article via a fenced
// ```drakeequation block (see Reader's `pre` override). The equation was never a
// calculation — it was an agenda for a three-day meeting — and published estimates
// of N span some fourteen orders of magnitude. The point of this widget is to feel
// exactly that: the first three factors are now measured (star formation, planets
// everywhere, ~1/5 of Sun-like stars with an Earth in the zone), so they barely
// move the answer, while the biological and civilisational factors — above all the
// lifetime L — swing N from "a crowded, silent-should-be-loud galaxy" all the way
// down to "us, alone." currentColor theming; first render deterministic.

type F = {
  key: string; label: string; note: string;
  lo: number; hi: number; val: number; log: boolean; known: boolean;
};

const INIT: F[] = [
  { key: "Rstar", label: "R∗", note: "new stars per year", lo: 1, hi: 3, val: 1.5, log: false, known: true },
  { key: "fp", label: "fₚ", note: "stars with planets", lo: 0.1, hi: 1, val: 1, log: false, known: true },
  { key: "ne", label: "nₑ", note: "habitable worlds per system", lo: 0.01, hi: 5, val: 0.2, log: false, known: true },
  { key: "fl", label: "fₗ", note: "…on which life arises", lo: 1e-20, hi: 1, val: 1, log: true, known: false },
  { key: "fi", label: "fᵢ", note: "…that evolve intelligence", lo: 1e-9, hi: 1, val: 0.01, log: true, known: false },
  { key: "fc", label: "f_c", note: "…that broadcast", lo: 1e-3, hi: 1, val: 0.1, log: true, known: false },
  { key: "L", label: "L", note: "years a civilisation lasts", lo: 100, hi: 1e9, val: 1e4, log: true, known: false },
];

const fmt = (x: number) => {
  if (x === 0) return "0";
  if (x >= 0.01 && x < 1) return x.toFixed(x < 0.1 ? 3 : 2);
  if (x >= 1 && x < 1e4) return x >= 100 ? x.toFixed(0) : x.toPrecision(2);
  const e = Math.floor(Math.log10(Math.abs(x)));
  const m = x / Math.pow(10, e);
  return `${m.toFixed(1)}×10${sup(e)}`;
};
const sup = (n: number) => {
  const map: Record<string, string> = { "-": "⁻", "0": "⁰", "1": "¹", "2": "²", "3": "³", "4": "⁴", "5": "⁵", "6": "⁶", "7": "⁷", "8": "⁸", "9": "⁹" };
  return String(n).split("").map((c) => map[c] ?? c).join("");
};

// N meter runs on a log axis from "alone" (1e-3) to "teeming" (1e6).
const MLO = -3, MHI = 6, X0 = 40, X1 = 424;
const mx = (logN: number) => X0 + ((Math.min(MHI, Math.max(MLO, logN)) - MLO) / (MHI - MLO)) * (X1 - X0);

export function DrakeEquation() {
  const [f, setF] = useState<F[]>(INIT);
  const set = (i: number, val: number) => setF((s) => s.map((x, j) => (j === i ? { ...x, val } : x)));
  const reset = () => setF(INIT);

  const N = f.reduce((p, x) => p * x.val, 1);
  const logN = Math.log10(N);
  const verdict =
    N < 1 ? { t: "us — alone, or nearly", tone: "text-maroon" }
    : N < 100 ? { t: "a scattered few — and far apart", tone: "text-ink" }
    : { t: "a crowded galaxy — so where is everybody?", tone: "text-purple" };

  return (
    <figure className="drake-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      {/* the equation, live */}
      <p className="text-center font-sans text-[12.5px] text-muted">
        N = {f.map((x) => (
          <span key={x.key} className={x.known ? "text-purple" : "text-maroon"}>
            <span className="font-semibold">{x.label}</span><span className="text-faint">(</span><span className="tabular-nums">{fmt(x.val)}</span><span className="text-faint">) </span>
          </span>
        ))}
      </p>

      {/* the N meter */}
      <svg viewBox="0 0 440 92" className="mt-2 w-full h-auto" role="img"
        aria-label={`With these factors, the Drake equation gives about ${fmt(N)} communicating civilisations in the galaxy: ${verdict.t}.`}>
        <line className="text-line" x1={X0} y1={54} x2={X1} y2={54} stroke="currentColor" strokeWidth={1} />
        {[-3, -1, 1, 3, 5].map((e) => (
          <g key={e}>
            <line className="text-line" x1={mx(e)} y1={54} x2={mx(e)} y2={58} stroke="currentColor" strokeWidth={1} />
            <text className="text-faint" x={mx(e)} y={68} textAnchor="middle" fill="currentColor" fontSize={7.5}
              fontFamily="ui-sans-serif, system-ui, sans-serif">10{sup(e)}</text>
          </g>
        ))}
        <text className="text-maroon" x={X0} y={84} fill="currentColor" fontSize={8} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">alone</text>
        <text className="text-purple" x={X1} y={84} textAnchor="end" fill="currentColor" fontSize={8} fontWeight={700}
          fontFamily="ui-sans-serif, system-ui, sans-serif">teeming</text>
        {/* the pointer */}
        <line x1={mx(logN)} y1={20} x2={mx(logN)} y2={54} className={verdict.tone} stroke="currentColor" strokeWidth={1.4} strokeDasharray="2 2" opacity={0.7} />
        <circle cx={mx(logN)} cy={54} r={4.5} className={verdict.tone} fill="currentColor" />
        <text x={mx(logN)} y={15} textAnchor="middle" className={verdict.tone} fill="currentColor" fontSize={11} fontWeight={800}
          fontFamily="ui-sans-serif, system-ui, sans-serif">N ≈ {fmt(N)}</text>
      </svg>

      <p className={`mt-1 text-center font-sans text-[13px] font-semibold ${verdict.tone}`}>{verdict.t}</p>

      {/* the sliders */}
      <div className="mt-4 grid gap-x-5 gap-y-3 sm:grid-cols-2">
        {f.map((x, i) => (
          <label key={x.key} className="block">
            <span className="flex justify-between font-sans text-[11.5px]">
              <span className={x.known ? "text-purple" : "text-maroon"}>
                <span className="font-semibold">{x.label}</span> <span className="text-muted">{x.note}</span>
              </span>
              <span className="tabular-nums text-ink">{fmt(x.val)}</span>
            </span>
            <input type="range"
              min={x.log ? Math.log10(x.lo) : x.lo}
              max={x.log ? Math.log10(x.hi) : x.hi}
              step={x.log ? 0.1 : (x.hi - x.lo) / 100}
              value={x.log ? Math.log10(x.val) : x.val}
              onChange={(e) => set(i, x.log ? Math.pow(10, Number(e.target.value)) : Number(e.target.value))}
              aria-label={`${x.label}: ${x.note}`} className="mt-1 w-full"
              style={{ accentColor: x.known ? "var(--c-purple)" : "var(--c-maroon)" }} />
          </label>
        ))}
      </div>
      <div className="mt-3 flex items-center justify-between gap-2">
        <span className="font-sans text-[10.5px] text-faint">
          <span className="text-purple">■</span> measured &nbsp; <span className="text-maroon">■</span> deep unknown
        </span>
        <button type="button" onClick={reset}
          className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
          Reset
        </button>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Frank Drake wrote this down in 1961 as the agenda for a three-day meeting, not as a sum to be solved — and that is exactly what it still is. Slide the factors and watch: the three <span className="text-purple">measured</span> terms on the left barely move the needle, because the exoplanet revolution has all but settled them — nearly every star has planets, and roughly a fifth of Sun-like stars carry an Earth-sized world in the habitable zone, the nearest perhaps four light-years away. The whole answer now lives in the <span className="text-maroon">unknown</span> terms on the right, and above all in <span className="text-maroon">L</span>, the lifetime of a civilisation — a single factor that swings N across the entire meter, from a galaxy that should be loud to a galaxy holding only us. Published estimates of N span some fourteen orders of magnitude. The equation does not calculate whether we are alone; it shows, with total clarity, that the answer hinges on the three things we cannot yet measure — whether life begins, whether minds follow, and whether civilisations survive themselves.
      </figcaption>
    </figure>
  );
}
