"use client";

import { useMemo, useState } from "react";
import katex from "katex";

// An interactive, infinitely-regenerating practice box embedded in an article
// via a fenced ```example block (see Reader's `pre` override). It poses a
// randomized problem, and on "Reveal" shows the full step-by-step solution;
// "Try another" rolls fresh numbers. The first render is deterministic (seed 0)
// so server and client markup match — randomness only kicks in on regenerate.

type Example = {
  title: string;
  question: string;
  steps: string[]; // KaTeX (display) — the worked solution
  note?: string; // plain-text takeaway
};

type Generator = (rng: () => number) => Example;

// Small, dependency-free seeded PRNG so a given seed always yields the same
// example (keeps SSR and the first client paint identical — no hydration mismatch).
function mulberry32(a: number): () => number {
  return function () {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

function sample(rng: () => number, pool: number[], k: number): number[] {
  const a = [...pool];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a.slice(0, k);
}

function returnPool(min = -40, max = 45, step = 5): number[] {
  const p: number[] = [];
  for (let v = min; v <= max; v += step) if (v !== 0) p.push(v);
  return p;
}

function pricePool(min = 10, max = 55, step = 5): number[] {
  const p: number[] = [];
  for (let v = min; v <= max; v += step) p.push(v);
  return p;
}

// Format to at most one decimal, without a stray "-0" or trailing ".0".
function f(x: number): string {
  const r = Math.round(x * 10) / 10;
  if (Object.is(r, -0) || r === 0) return "0";
  return Number.isInteger(r) ? `${r}` : r.toFixed(1);
}

// Signed sum, e.g. [-40, 25, 30] -> "-40 + 25 + 30".
function sumExpr(nums: number[]): string {
  return nums
    .map((n, i) => (i === 0 ? `${n}` : n < 0 ? `- ${Math.abs(n)}` : `+ ${n}`))
    .join(" ");
}

const mean = (xs: number[]) => xs.reduce((a, b) => a + b, 0) / xs.length;

const GENERATORS: Record<string, Generator> = {
  "arithmetic-mean": (rng) => {
    const rs = sample(rng, returnPool(), 3);
    const total = rs.reduce((a, b) => a + b, 0);
    return {
      title: "Arithmetic mean return",
      question: `Three one-year returns: ${rs.map((r) => `${r}%`).join(", ")}. What is their arithmetic (simple) mean?`,
      steps: [`\\bar{R} = \\frac{${sumExpr(rs)}}{3} = \\frac{${total}}{3} = ${f(total / 3)}\\%`],
      note: "Add the per-period returns and divide by how many there are. It answers “what was a typical year?” — but it quietly assumes you began each period with the same amount invested.",
    };
  },

  "geometric-mean": (rng) => {
    const rs = sample(rng, returnPool(), 3);
    const factors = rs.map((r) => 1 + r / 100);
    const prod = factors.reduce((a, b) => a * b, 1);
    const geo = (Math.pow(prod, 1 / 3) - 1) * 100;
    const facStr = factors.map((x) => `(${x.toFixed(2)})`).join("");
    return {
      title: "Geometric mean return",
      question: `Three years of returns: ${rs.map((r) => `${r}%`).join(", ")}. What single steady annual rate would have grown the money to the same ending amount — the geometric mean?`,
      steps: [
        `\\bar{R}_{Gi} = \\sqrt[3]{${facStr}} - 1`,
        `= \\sqrt[3]{${prod.toFixed(3)}} - 1 = ${f(geo)}\\%`,
      ],
      note: `The arithmetic mean of these same returns is ${f(mean(rs))}%. Because the returns vary, the geometric mean comes out lower — it is the rate the money actually compounded at.`,
    };
  },

  "harmonic-mean": (rng) => {
    const amount = sample(rng, [300, 400, 500, 600, 800, 1000], 1)[0];
    const prices = sample(rng, pricePool(), 3).sort((a, b) => a - b);
    const invSum = prices.reduce((a, p) => a + 1 / p, 0);
    const H = 3 / invSum;
    const arithP = mean(prices);
    return {
      title: "Harmonic mean — average cost per share",
      question: `You invest $${amount} every month, buying shares at $${prices[0]}, $${prices[1]}, and $${prices[2]}. What is your average cost per share?`,
      steps: [
        `\\bar{P}_H = \\cfrac{3}{\\frac{1}{${prices[0]}} + \\frac{1}{${prices[1]}} + \\frac{1}{${prices[2]}}} = \\frac{3}{${invSum.toFixed(4)}} = \\$${H.toFixed(2)}`,
      ],
      note: `The plain average of the three prices is $${arithP.toFixed(2)} — higher. Spending a fixed dollar amount buys more shares when they are cheap, so your average cost lands below the simple average. That is why the harmonic mean is the right tool for averaging prices paid.`,
    };
  },

  "trimmed-mean": (rng) => {
    const rs = sample(rng, returnPool(-45, 55), 5);
    const sorted = [...rs].sort((a, b) => a - b);
    const middle = sorted.slice(1, 4);
    return {
      title: "Trimmed mean",
      question: `Five returns, sorted low to high: ${sorted.map((r) => `${r}%`).join(", ")}. Compute the 20% trimmed mean — drop the single lowest and single highest, then average the rest.`,
      steps: [`\\bar{R}_{\\text{trim}} = \\frac{${sumExpr(middle)}}{3} = ${f(mean(middle))}\\%`],
      note: `The plain mean of all five is ${f(mean(sorted))}%. Trimming discards the extreme ${sorted[0]}% and ${sorted[4]}%, so a single outlier can’t dominate the average.`,
    };
  },

  "winsorized-mean": (rng) => {
    const rs = sample(rng, returnPool(-45, 55), 5);
    const sorted = [...rs].sort((a, b) => a - b);
    const wins = [...sorted];
    wins[0] = sorted[1];
    wins[4] = sorted[3];
    return {
      title: "Winsorized mean",
      question: `Five returns, sorted low to high: ${sorted.map((r) => `${r}%`).join(", ")}. Compute the winsorized mean — replace the lowest with the next value up and the highest with the next value down, then average all five.`,
      steps: [
        `\\text{low } ${sorted[0]}\\% \\rightarrow ${sorted[1]}\\%, \\quad \\text{high } ${sorted[4]}\\% \\rightarrow ${sorted[3]}\\%`,
        `\\bar{R}_{\\text{wins}} = \\frac{${sumExpr(wins)}}{5} = ${f(mean(wins))}\\%`,
      ],
      note: `The plain mean is ${f(mean(sorted))}%. Trimmed drops the outliers; winsorized keeps all five observations but caps the extremes at the nearest kept value.`,
    };
  },
};

function Tex({ tex }: { tex: string }) {
  const html = useMemo(
    () => katex.renderToString(tex, { displayMode: true, throwOnError: false }),
    [tex],
  );
  return <span dangerouslySetInnerHTML={{ __html: html }} />;
}

export function WorkedExample({ spec }: { spec: string }) {
  const kind = spec.trim();
  const gen = GENERATORS[kind];
  const [seed, setSeed] = useState(0);
  const [revealed, setRevealed] = useState(false);

  // seed + 1 so the first (deterministic) example still gets a non-zero seed.
  const example = useMemo(() => (gen ? gen(mulberry32(seed + 1)) : null), [gen, seed]);
  if (!example) return null;

  return (
    <div className="worked-example">
      <div className="we-head">{example.title} · your turn</div>
      <p className="we-q">{example.question}</p>

      {revealed && (
        <div>
          {example.steps.map((s, i) => (
            <div key={i} className="we-step">
              <Tex tex={s} />
            </div>
          ))}
          {example.note && <p className="we-note">{example.note}</p>}
        </div>
      )}

      <div className="we-actions">
        {!revealed && (
          <button type="button" onClick={() => setRevealed(true)}>
            Reveal answer
          </button>
        )}
        <button
          type="button"
          className="we-secondary"
          onClick={() => {
            setSeed((s) => s + 1);
            setRevealed(false);
          }}
        >
          Try another &#8635;
        </button>
      </div>
    </div>
  );
}
