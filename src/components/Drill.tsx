"use client";

import { useMemo, useState } from "react";
import { Rich } from "./RichText";

// ── Infinite drill ────────────────────────────────────────────────────────
// A fenced ```drill block in article markdown becomes a self-test that never
// runs out. Where a ```checkpoint asks a fixed set of authored questions once,
// and a ```example reveals a worked solution, a drill *grades* the reader and
// then rolls a fresh instance of the same question type, forever. It exists for
// the handful of ideas per lecture that have to become automatic rather than
// merely understood — which set a number belongs to, which operations a system
// is closed under — and it keeps a streak so the reader can see the idea go
// from shaky to solid.
//
// Spec: the generator name on its own line, e.g.
//
//   ```drill
//   number-classify
//   ```
//
// Every generator is a pure function of a seeded PRNG, so the first render is
// deterministic (server and client agree) and randomness only starts on "Next".
// Questions are constructed, not sampled from a list, so the supply is
// genuinely unbounded and every instance carries its own explanation.

type Option = { label: string; correct: boolean; why?: string };

type DrillItem = {
  title: string;
  prompt: string;
  // "choice" — exactly one option is right.
  // "multi"  — any number of options are right; the whole selection is graded.
  // "text"   — the reader types the answer; `accept` lists normalised forms.
  mode: "choice" | "multi" | "text";
  options?: Option[];
  accept?: string[];
  answerLabel?: string;
  placeholder?: string;
  hint?: string;
  why: string;
};

type Level = 1 | 2 | 3;
type Generator = (rng: () => number, lvl: Level) => DrillItem;

// Same seeded PRNG as WorkedExample: identical seed, identical question.
function mulberry32(a: number): () => number {
  return function () {
    a |= 0;
    a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

const pick = <T,>(rng: () => number, xs: readonly T[]): T => xs[Math.floor(rng() * xs.length)];

function shuffle<T>(rng: () => number, xs: T[]): T[] {
  const a = [...xs];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(rng() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

function gcd(a: number, b: number): number {
  a = Math.abs(a);
  b = Math.abs(b);
  while (b) [a, b] = [b, a % b];
  return a;
}

function factorise(n: number): [number, number][] {
  const out: [number, number][] = [];
  let m = n;
  for (let d = 2; d * d <= m; d++) {
    let e = 0;
    while (m % d === 0) {
      m /= d;
      e++;
    }
    if (e) out.push([d, e]);
  }
  if (m > 1) out.push([m, 1]);
  return out;
}

const factorTex = (f: [number, number][]) =>
  f.map(([p, e]) => (e === 1 ? `${p}` : `${p}^{${e}}`)).join(" \\cdot ");

// ── Number classification ────────────────────────────────────────────────
// The core drill of the first lecture: given a number, say which of the
// nested systems it lives in. Every entry is written in a form that has to be
// simplified before it can be classified, because that is where readers slip.

type Spec = {
  tex: string; // how the number is written
  value: string; // what it actually is, once simplified
  natural: boolean;
  integer: boolean;
  rational: boolean;
  algebraic: boolean;
  d: 1 | 2 | 3; // how much simplification it takes before it can be classified
  note: string;
};

const NUMBERS: Spec[] = [
  { tex: "7", value: "7", natural: true, integer: true, rational: true, algebraic: true, d: 1, note: "A counting number, so it lies in every system from $\\mathbb{N}$ outward. It is algebraic as a root of $x - 7$." },
  { tex: "-4", value: "-4", natural: false, integer: true, rational: true, algebraic: true, d: 1, note: "Negative, so not a counting number, but an integer and hence rational ($-4/1$) and algebraic (a root of $x + 4$)." },
  { tex: "0", value: "0", natural: false, integer: true, rational: true, algebraic: true, d: 1, note: "Zero is an integer. Whether it counts as a natural number is a convention; this lecture starts $\\mathbb{N}$ at $1$, so here it does not." },
  { tex: "\\tfrac{3}{4}", value: "0.75", natural: false, integer: false, rational: true, algebraic: true, d: 1, note: "A ratio of integers, so rational; algebraic as a root of $4x - 3$. Its decimal terminates because the denominator is a power of $2$." },
  { tex: "-\\tfrac{7}{5}", value: "-1.4", natural: false, integer: false, rational: true, algebraic: true, d: 1, note: "Rational and algebraic (a root of $5x + 7$), but not an integer." },
  { tex: "0.125", value: "1/8", natural: false, integer: false, rational: true, algebraic: true, d: 1, note: "A terminating decimal is always rational: $0.125 = 125/1000 = 1/8$." },
  { tex: "0.\\overline{3}", value: "1/3", natural: false, integer: false, rational: true, algebraic: true, d: 2, note: "A repeating decimal is rational. $x = 0.\\overline3$ gives $10x - x = 3$, so $x = 1/3$. Infinitely many digits does not mean irrational." },
  { tex: "0.\\overline{9}", value: "1", natural: true, integer: true, rational: true, algebraic: true, d: 3, note: "The trap. $0.\\overline9$ is not close to $1$, it *is* $1$: $10x - x = 9$ gives $x = 1$. So it is a natural number." },
  { tex: "\\sqrt{2}", value: "1.41421...", natural: false, integer: false, rational: false, algebraic: true, d: 1, note: "Irrational — proved by the parity argument — but algebraic, being a root of $x^2 - 2$." },
  { tex: "\\sqrt{5}", value: "2.23606...", natural: false, integer: false, rational: false, algebraic: true, d: 2, note: "$5$ is not a perfect square, so $\\sqrt5$ is irrational; it is algebraic as a root of $x^2 - 5$." },
  { tex: "\\sqrt{9}", value: "3", natural: true, integer: true, rational: true, algebraic: true, d: 2, note: "Simplify first: $\\sqrt9 = 3$. A square root is only irrational when the number under it is not a perfect square." },
  { tex: "\\sqrt{16}", value: "4", natural: true, integer: true, rational: true, algebraic: true, d: 2, note: "$\\sqrt{16} = 4$, a natural number. The radical sign is not by itself a mark of irrationality." },
  { tex: "\\sqrt[3]{8}", value: "2", natural: true, integer: true, rational: true, algebraic: true, d: 2, note: "$\\sqrt[3]{8} = 2$. Cube roots of perfect cubes are integers." },
  { tex: "\\sqrt{2}\\cdot\\sqrt{2}", value: "2", natural: true, integer: true, rational: true, algebraic: true, d: 3, note: "Two irrationals whose product is rational — which is exactly why the irrationals are closed under nothing. $\\sqrt2\\cdot\\sqrt2 = 2$." },
  { tex: "\\sqrt{2} + (3 - \\sqrt{2})", value: "3", natural: true, integer: true, rational: true, algebraic: true, d: 3, note: "Both terms are irrational and the $\\sqrt2$s cancel, leaving $3$. A sum of irrationals may be rational." },
  { tex: "3 + \\sqrt{2}", value: "4.41421...", natural: false, integer: false, rational: false, algebraic: true, d: 3, note: "Rational plus irrational is always irrational: if $3+\\sqrt2$ were rational, subtracting $3$ would make $\\sqrt2$ rational. It is algebraic, a root of $x^2 - 6x + 7$." },
  { tex: "\\tfrac{\\sqrt{2}}{2}", value: "0.70710...", natural: false, integer: false, rational: false, algebraic: true, d: 3, note: "A non-zero rational times an irrational is irrational. Algebraic, as a root of $2x^2 - 1$." },
  { tex: "\\varphi = \\tfrac{1+\\sqrt{5}}{2}", value: "1.61803...", natural: false, integer: false, rational: false, algebraic: true, d: 2, note: "The golden ratio is irrational but algebraic: it satisfies $x^2 - x - 1 = 0$ exactly." },
  { tex: "\\pi", value: "3.14159...", natural: false, integer: false, rational: false, algebraic: false, d: 1, note: "Irrational, and transcendental by Lindemann's theorem — it is a root of no polynomial with integer coefficients, which is why the circle cannot be squared." },
  { tex: "e", value: "2.71828...", natural: false, integer: false, rational: false, algebraic: false, d: 1, note: "Irrational and transcendental, proved by Hermite in 1873." },
  { tex: "\\tfrac{\\pi}{2}", value: "1.57079...", natural: false, integer: false, rational: false, algebraic: false, d: 2, note: "A non-zero rational multiple of a transcendental number is again transcendental, since scaling by a rational cannot produce a polynomial root." },
  { tex: "2\\pi", value: "6.28318...", natural: false, integer: false, rational: false, algebraic: false, d: 2, note: "Transcendental, for the same reason as $\\pi/2$: multiplying by a non-zero rational preserves both irrationality and transcendence." },
  { tex: "\\tfrac{22}{7}", value: "3.142857...", natural: false, integer: false, rational: false, algebraic: true, d: 3, note: "The trap. $22/7$ is a rational approximation to $\\pi$, not $\\pi$ — it is a ratio of integers, so it is rational and algebraic. Its decimal repeats with period $6$." },
  { tex: "\\log_2 3", value: "1.58496...", natural: false, integer: false, rational: false, algebraic: false, d: 3, note: "Irrational: $\\log_2 3 = p/q$ would give $2^p = 3^q$, even equal to odd. It is transcendental as well, by the Gelfond–Schneider theorem." },
  { tex: "\\log_2 8", value: "3", natural: true, integer: true, rational: true, algebraic: true, d: 2, note: "Simplify first: $2^3 = 8$, so $\\log_2 8 = 3$. Logarithms are only irrational when the base is not a whole power away." },
  { tex: "-\\sqrt{4}", value: "-2", natural: false, integer: true, rational: true, algebraic: true, d: 2, note: "$\\sqrt4 = 2$, so this is $-2$: an integer, not a natural number under the convention that $\\mathbb{N}$ starts at $1$." },
  { tex: "\\sqrt{\\tfrac{1}{4}}", value: "1/2", natural: false, integer: false, rational: true, algebraic: true, d: 2, note: "$\\sqrt{1/4} = 1/2$, a perfectly ordinary rational. The root of a perfect square stays rational even when it is fractional." },
];

// ── Closure facts ─────────────────────────────────────────────────────────

type Sys = { key: string; tex: string; name: string };
const SYSTEMS: Sys[] = [
  { key: "N", tex: "\\mathbb{N}", name: "the natural numbers" },
  { key: "Z", tex: "\\mathbb{Z}", name: "the integers" },
  { key: "Q", tex: "\\mathbb{Q}", name: "the rationals" },
  { key: "R", tex: "\\mathbb{R}", name: "the reals" },
  { key: "I", tex: "\\mathbb{R}\\setminus\\mathbb{Q}", name: "the irrationals" },
];

type Op = { key: string; phrase: string };
const OPS: Op[] = [
  { key: "add", phrase: "add them" },
  { key: "sub", phrase: "subtract one from the other" },
  { key: "mul", phrase: "multiply them" },
  { key: "div", phrase: "divide one by the other (the divisor not zero)" },
];

// closed[system][operation] -> [isClosed, justification]
const CLOSURE: Record<string, Record<string, [boolean, string]>> = {
  N: {
    add: [true, "A sum of counting numbers is a counting number — no exception exists."],
    sub: [false, "$3 - 5 = -2$, which is not a natural number. This single failure is what forces the construction of $\\mathbb{Z}$."],
    mul: [true, "A product of counting numbers is a counting number."],
    div: [false, "$3 \\div 5 = 0.6$, not a natural number. This failure is what forces the construction of $\\mathbb{Q}$."],
  },
  Z: {
    add: [true, "Sums of integers are integers."],
    sub: [true, "Every integer has an additive inverse, so $a - b = a + (-b)$ never leaves $\\mathbb{Z}$."],
    mul: [true, "Products of integers are integers."],
    div: [false, "$3 \\div 6 = 0.5$, not an integer. Only $\\mathbb{Q}$ repairs this."],
  },
  Q: {
    add: [true, "$\\frac ab + \\frac cd = \\frac{ad+bc}{bd}$ is again a ratio of integers with non-zero denominator."],
    sub: [true, "Same computation with a minus sign; the result is again a ratio of integers."],
    mul: [true, "$\\frac ab \\cdot \\frac cd = \\frac{ac}{bd}$, again rational."],
    div: [true, "$\\frac ab \\div \\frac cd = \\frac{ad}{bc}$, rational whenever the divisor is non-zero. This closure is what makes $\\mathbb{Q}$ a field."],
  },
  R: {
    add: [true, "$\\mathbb{R}$ is a field: sums of reals are real."],
    sub: [true, "$\\mathbb{R}$ is a field: differences of reals are real."],
    mul: [true, "$\\mathbb{R}$ is a field: products of reals are real."],
    div: [true, "$\\mathbb{R}$ is a field: every non-zero real has a real reciprocal."],
  },
  I: {
    add: [false, "$\\sqrt2 + (-\\sqrt2) = 0$, which is rational. The irrationals are closed under nothing — they are a leftover, not a system."],
    sub: [false, "$\\sqrt2 - \\sqrt2 = 0$, rational. Being a set difference, $\\mathbb{R}\\setminus\\mathbb{Q}$ inherits no structure."],
    mul: [false, "$\\sqrt2 \\cdot \\sqrt2 = 2$, rational."],
    div: [false, "$\\sqrt2 \\div \\sqrt2 = 1$, rational."],
  },
};

// ── Which system first solves this equation ───────────────────────────────

type EqSpec = { eq: string; sys: string; d: 1 | 2 | 3; note: string };
const EQUATIONS: EqSpec[] = [
  { eq: "x + 2 = 9", sys: "N", d: 1, note: "$x = 7$, a counting number, so no enlargement is needed at all." },
  { eq: "x + 6 = 4", sys: "Z", d: 1, note: "$x = -2$. The equation $a + x = b$ has no natural solution when $a \\ge b$; repairing that is exactly what $\\mathbb{Z}$ is for." },
  { eq: "x + 5 = 5", sys: "Z", d: 3, note: "$x = 0$. Under the convention that $\\mathbb{N}$ starts at $1$, the natural numbers have no additive identity, so even this needs $\\mathbb{Z}$." },
  { eq: "3x = 12", sys: "N", d: 1, note: "$x = 4$, already a counting number — the division happens to come out whole." },
  { eq: "6x = 3", sys: "Q", d: 1, note: "$x = 1/2$. Integers have no multiplicative inverses, so a division that does not come out whole needs $\\mathbb{Q}$." },
  { eq: "5x = -2", sys: "Q", d: 2, note: "$x = -2/5$: negative, so beyond $\\mathbb{N}$, and fractional, so beyond $\\mathbb{Z}$." },
  { eq: "x^2 = 4", sys: "N", d: 3, note: "$x = 2$ is a solution and is a counting number. (The equation also has the solution $-2$, but the question asks where a solution first exists.)" },
  { eq: "x^2 = 2", sys: "R", d: 2, note: "No rational squares to $2$ — that is the parity proof — so this equation is what forces the reals." },
  { eq: "x^2 = 3", sys: "R", d: 2, note: "$3$ is not a perfect square, so $\\sqrt3$ is irrational and only $\\mathbb{R}$ contains a solution." },
  { eq: "x^2 = -1", sys: "C", d: 2, note: "No real squares to a negative number, so this is the equation that forces $\\mathbb{C}$." },
  { eq: "x^2 + 4 = 0", sys: "C", d: 3, note: "$x^2 = -4$ has no real solution; in $\\mathbb{C}$ the solutions are $\\pm 2i$." },
  { eq: "2x = 7", sys: "Q", d: 2, note: "$x = 7/2$, fractional but perfectly rational." },
];

const SYS_LABEL: Record<string, string> = {
  N: "$\\mathbb{N}$ — the natural numbers",
  Z: "$\\mathbb{Z}$ — the integers",
  Q: "$\\mathbb{Q}$ — the rationals",
  R: "$\\mathbb{R}$ — the reals",
  C: "$\\mathbb{C}$ — the complex numbers",
};
const SYS_ORDER = ["N", "Z", "Q", "R", "C"];

// ── Generators ────────────────────────────────────────────────────────────

// ── Counting ──────────────────────────────────────────────────────────────
// The very first lesson's drills. Deliberately concrete: a row of marks to
// count, a next-number, a single-digit sum. They exist so that a reader who is
// genuinely starting at the beginning has something to practise, and so does a
// reader who simply wants the small facts to become instant.

const ONES = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
const TEENS = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];
const TENS = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

// English name of a whole number below 1000.
function words(n: number): string {
  if (n < 10) return ONES[n];
  if (n < 20) return TEENS[n - 10];
  if (n < 100) {
    const t = Math.floor(n / 10);
    const r = n % 10;
    return r === 0 ? TENS[t] : `${TENS[t]}-${ONES[r]}`;
  }
  const h = Math.floor(n / 100);
  const r = n % 100;
  return r === 0 ? `${ONES[h]} hundred` : `${ONES[h]} hundred and ${words(r)}`;
}

const PLACE_NAMES = ["ones", "tens", "hundreds", "thousands"];

const GENERATORS: Record<string, Generator> = {
  // ── Counting ────────────────────────────────────────────────────────────

  // Count a row of marks. The answer is a number; the lesson is that the
  // answer does not depend on the order you count them in.
  "count-objects": (rng, lvl) => {
    const [lo, hi] = lvl === 1 ? [4, 10] : lvl === 2 ? [9, 20] : [18, 40];
    const n = Math.floor(rng() * (hi - lo + 1)) + lo;
    const glyph = pick(rng, ["●", "▲", "★", "◆", "■"]);
    const row = Array.from({ length: n }, () => glyph).join(" ");
    const fives = Math.floor(n / 5);
    const rest = n % 5;
    return {
      title: "How many?",
      prompt: `Count them. How many marks are there?\n\n${row}`,
      mode: "text",
      accept: [String(n), words(n)],
      answerLabel: String(n),
      placeholder: "a number",
      hint: "Touch each mark once and say the next counting word. Or group them in fives and count the groups.",
      why: `There are $${n}$ — that is ${words(n)}. Counting in fives is quicker and far less error-prone: ${
        fives > 0
          ? `${fives} group${fives === 1 ? "" : "s"} of five is $${fives * 5}$${rest ? `, and $${rest}$ more makes $${n}$` : ""}`
          : "here there is not even one full group of five, so count them singly"
      }. However you group them, and in whatever order you count them, the answer is the same — which is the first real theorem about counting.`,
    };
  },

  // The successor and predecessor: every number has a next one.
  "count-on": (rng, lvl) => {
    const pool =
      lvl === 1
        ? [3, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 19, 20]
        : lvl === 2
          ? [9, 19, 20, 29, 30, 39, 49, 50, 59, 69, 70, 79, 89, 90, 99, 100, 24, 36, 48, 55, 62, 74, 81, 96]
          : [99, 100, 109, 110, 199, 200, 299, 300, 399, 400, 500, 599, 700, 799, 800, 899, 900, 999, 1000, 1099, 1200, 1999, 2000];
    const n = pick(rng, pool);
    const after = rng() < 0.5;
    const ans = after ? n + 1 : n - 1;
    const roll = (after && n % 10 === 9) || (!after && n % 10 === 0);
    return {
      title: after ? "What comes next?" : "What came before?",
      prompt: after
        ? `Counting upward, what number comes immediately after $${n}$?`
        : `Counting downward, what number comes immediately before $${n}$?`,
      mode: "text",
      accept: [String(ans), words(ans)],
      answerLabel: String(ans),
      placeholder: "a number",
      hint: after
        ? "Add one. Watch what happens when the last digit is a 9 — it rolls over to 0 and the digit to its left goes up by one."
        : "Take one away. Watch what happens when the last digit is a 0 — you must borrow from the digit to its left.",
      why: `$${n} ${after ? "+" : "-"} 1 = ${ans}$${
        roll
          ? after
            ? " — a rollover: the ones digit was already at its largest, so it returns to $0$ and the digit to its left climbs by one"
            : " — a rollover: the ones digit had nothing left to give, so it drops to $9$ and the digit to its left falls by one"
          : ""
      }. Every counting number has exactly one number immediately after it, which is why counting never stops: there is no largest number.`,
    };
  },

  // Single-digit addition, framed as counting on. Includes 1 + 1.
  "add-count-on": (rng, lvl) => {
    let a: number, b: number;
    if (lvl === 1) {
      // sums that stay within ten — the facts to know first
      a = Math.floor(rng() * 8) + 1;
      b = Math.floor(rng() * (10 - a)) + 1;
    } else if (lvl === 2) {
      // a bigger number plus a small one, with the ones NOT crossing a ten:
      // 22 + 5 rather than 28 + 7, so only the ones digit moves.
      a = Math.floor(rng() * 8) * 10 + Math.floor(rng() * 8) + 11;
      b = Math.floor(rng() * (9 - (a % 10))) + 1;
    } else {
      // crossing a ten, which is where the ones roll over and carry
      a = Math.floor(rng() * 8) * 10 + Math.floor(rng() * 4) + 16;
      b = 10 - (a % 10) + Math.floor(rng() * 5);
    }
    const s = a + b;
    const chain = Array.from({ length: Math.min(b, 9) }, (_, i) => a + i + 1).join(", ");
    return {
      title: "Counting on",
      prompt: `What is $${a} + ${b}$?`,
      mode: "text",
      accept: [String(s), words(s)],
      answerLabel: String(s),
      placeholder: "a number",
      hint: `Start at $${a}$ and count on $${b}$ more, one at a time. If the ones cross a ten, split the second number to land on the ten first.`,
      why: `Start at $${a}$ and count on $${b}$: ${chain}. So $${a} + ${b} = ${s}$.${
        a !== b
          ? ` And because addition does not care about order, $${b} + ${a} = ${s}$ as well — which nearly halves the number of facts there are to learn.`
          : ` This one is a double: $${a} + ${a} = ${s}$.`
      }${s === 10 ? " It is also one of the pairs that make ten, the facts worth knowing best of all." : ""}${
        Math.floor(a / 10) !== Math.floor(s / 10) && a > 10
          ? ` Crossing the ten is easier in two steps: $${a} + ${10 - (a % 10)} = ${a + 10 - (a % 10)}$, then $+ ${b - (10 - (a % 10))}$ makes $${s}$.`
          : ""
      }`,
    };
  },

  // Adding whole tens: the same counting-on, one place to the left.
  "add-tens": (rng, lvl) => {
    let a: number, b: number, note: string;
    if (lvl === 1) {
      // both are whole tens, sum stays under a hundred: 10 + 20
      const ta = Math.floor(rng() * 7) + 1;
      const tb = Math.floor(rng() * (9 - ta)) + 1;
      a = ta * 10;
      b = tb * 10;
      note = `Count in tens: $${ta}$ tens plus $${tb}$ tens is $${ta + tb}$ tens, which is $${a + b}$. It is the single-digit fact $${ta} + ${tb} = ${ta + tb}$ with every number one place to the left.`;
    } else if (lvl === 2) {
      // a whole ten added to an ordinary two-digit number: only the tens move
      a = Math.floor(rng() * 8) * 10 + Math.floor(rng() * 9) + 11;
      b = (Math.floor(rng() * 6) + 1) * 10;
      note = `Only the tens digit moves: $${Math.floor(a / 10)}$ tens plus $${b / 10}$ tens is $${Math.floor(a / 10) + b / 10}$ tens, and the $${a % 10}$ ones are untouched. So $${a} + ${b} = ${a + b}$.`;
    } else {
      // crossing a hundred, or three-digit tens
      a = (Math.floor(rng() * 5) + 4) * 10 + Math.floor(rng() * 10);
      b = (Math.floor(rng() * 5) + 5) * 10;
      note = `The tens cross a hundred: $${Math.floor(a / 10)} + ${b / 10} = ${Math.floor(a / 10) + b / 10}$ tens, which is $${(Math.floor(a / 10) + b / 10) * 10}$, plus the $${a % 10}$ ones — $${a + b}$. Ten tens make a hundred, exactly as ten ones make a ten.`;
    }
    const s = a + b;
    return {
      title: "Adding tens",
      prompt: `What is $${a} + ${b}$?`,
      mode: "text",
      accept: [String(s), words(s < 1000 ? s : 0)].filter((x) => x !== "zero" || s === 0),
      answerLabel: String(s),
      placeholder: "a number",
      hint: "Count in tens rather than in ones. How many tens does each number have?",
      why: note,
    };
  },

  // Column addition: any size, place by place, with the carries narrated.
  "column-add": (rng, lvl) => {
    let a: number, b: number;
    if (lvl === 1) {
      // two-digit plus two-digit, NO carrying: 32 + 21
      const a1 = Math.floor(rng() * 6) + 1, a0 = Math.floor(rng() * 5);
      const b1 = Math.floor(rng() * (8 - a1)) + 1, b0 = Math.floor(rng() * (9 - a0));
      a = a1 * 10 + a0;
      b = b1 * 10 + b0;
    } else if (lvl === 2) {
      // two- and three-digit with carrying
      a = Math.floor(rng() * 850) + 45;
      b = Math.floor(rng() * 850) + 45;
    } else {
      // big: four or five digits
      a = Math.floor(rng() * 90000) + 1000;
      b = Math.floor(rng() * 90000) + 1000;
    }
    const s = a + b;
    // Narrate the column-by-column addition, carries included.
    const da = String(a).split("").reverse().map(Number);
    const db = String(b).split("").reverse().map(Number);
    const places = ["ones", "tens", "hundreds", "thousands", "ten-thousands", "hundred-thousands"];
    const steps: string[] = [];
    let carry = 0;
    for (let i = 0; i < Math.max(da.length, db.length); i++) {
      const x = da[i] ?? 0, y = db[i] ?? 0;
      const tot = x + y + carry;
      const digit = tot % 10;
      const newCarry = Math.floor(tot / 10);
      steps.push(
        `${places[i]}: $${x} + ${y}${carry ? ` + ${carry}` : ""} = ${tot}$${newCarry ? ` — write $${digit}$, carry $1$` : ` — write $${digit}$`}`,
      );
      carry = newCarry;
    }
    if (carry) steps.push(`the carry becomes a new leading $1$`);
    return {
      title: "Adding, column by column",
      prompt: `What is $${a} + ${b}$?`,
      mode: "text",
      accept: [String(s)],
      answerLabel: String(s),
      placeholder: "a number",
      hint: "Add the ones to the ones, the tens to the tens, and so on from the right. When a column reaches ten, write the ones digit and carry the one into the next column.",
      why: `Work from the right, one place at a time — ${steps.join("; ")}. So $${a} + ${b} = ${s}$. A carry is just the $9\\to10$ flip from counting: ten in one column becomes one in the next.`,
    };
  },

  // Subtraction as counting back.
  "sub-count-back": (rng, lvl) => {
    let a: number, b: number;
    if (lvl === 1) {
      a = Math.floor(rng() * 9) + 2; // 2..10
      b = Math.floor(rng() * a) + 1;
    } else if (lvl === 2) {
      b = Math.floor(rng() * 9) + 1;
      a = b + Math.floor(rng() * 10); // difference 0..9, minuend up to 18
    } else {
      b = Math.floor(rng() * 9) + 1;
      a = Math.floor(rng() * 60) + 21;
    }
    const d = a - b;
    const chain = Array.from({ length: Math.min(b, 9) }, (_, i) => a - i - 1).join(", ");
    return {
      title: "Counting back",
      prompt: `What is $${a} - ${b}$?`,
      mode: "text",
      accept: [String(d), words(d)],
      answerLabel: String(d),
      placeholder: "a number",
      hint: `Start at $${a}$ and count back $${b}$ steps. Or ask instead: what must be added to $${b}$ to reach $${a}$?`,
      why: `Start at $${a}$ and count back $${b}$: ${chain}. So $${a} - ${b} = ${d}$. Check it forwards — $${d} + ${b} = ${a}$ — which is exactly what subtraction means: the number you must add to $${b}$ to reach $${a}$.`,
    };
  },

  // Division as the fourth way of counting: how many jumps fit.
  "divide-groups": (rng, lvl) => {
    const d = lvl === 1 ? pick(rng, [2, 5, 10]) : lvl === 2 ? pick(rng, [3, 4, 6]) : pick(rng, [7, 8, 9, 12]);
    const q = Math.floor(rng() * (lvl === 1 ? 8 : 10)) + 2;
    const withRemainder = lvl === 3 && rng() < 0.5;
    const r = withRemainder ? Math.floor(rng() * (d - 1)) + 1 : 0;
    const a = d * q + r;
    const jumps = Array.from({ length: q }, (_, i) => d * (i + 1)).join(", ");
    if (withRemainder) {
      return {
        title: "How many jumps fit?",
        prompt: `How many whole jumps of $${d}$ fit into $${a}$, and how much is left over? (Answer like "4 r 2".)`,
        mode: "text",
        accept: [`${q}r${r}`, `${q} r ${r}`, `${q} r${r}`, `${q}r ${r}`, `${q} remainder ${r}`, `${q} rest ${r}`],
        answerLabel: `${q} r ${r}`,
        placeholder: "e.g. 4 r 2",
        hint: `Count jumps of $${d}$ upward — ${d}, ${2 * d}, … — and stop before you pass $${a}$. Whatever is short of $${a}$ is the remainder.`,
        why: `Jumps of $${d}$: ${jumps} — that is $${q}$ whole jumps, reaching $${d * q}$, with $${r}$ left over to get to $${a}$. So $${a} \\div ${d} = ${q}$ remainder $${r}$. Check: $${q} \\times ${d} + ${r} = ${a}$. ✓`,
      };
    }
    return {
      title: "How many jumps fit?",
      prompt: `What is $${a} \\div ${d}$? (How many jumps of $${d}$ does it take to reach $${a}$?)`,
      mode: "text",
      accept: [String(q), words(q)],
      answerLabel: String(q),
      placeholder: "a number",
      hint: `Count jumps of $${d}$ upward — $${d}$, $${2 * d}$, … — until you land exactly on $${a}$, and count how many jumps that took.`,
      why: `Jumps of $${d}$: ${jumps}. It took $${q}$ jumps to reach $${a}$, so $${a} \\div ${d} = ${q}$. The other reading is sharing: $${a}$ things dealt into $${d}$ equal piles puts $${q}$ in each. Check by multiplying back: $${q} \\times ${d} = ${a}$. ✓`,
    };
  },

  // Which is bigger? Order comes from counting: whichever you reach later is larger.
  "compare-numbers": (rng, lvl) => {
    const digits = lvl === 1 ? 2 : lvl === 2 ? 3 : 4;
    const lo = Math.pow(10, digits - 1);
    const hi = Math.pow(10, digits) - 1;
    const a = Math.floor(rng() * (hi - lo + 1)) + lo;
    // Harder levels are weighted towards near-ties, where the difference sits
    // in a low place and the eye is tempted to compare from the wrong end.
    const near = rng() < (lvl === 1 ? 0.3 : lvl === 2 ? 0.55 : 0.8);
    const b = near
      ? Math.max(lo, Math.min(hi, a + (Math.floor(rng() * 19) - 9)))
      : Math.floor(rng() * (hi - lo + 1)) + lo;
    const rel = a > b ? ">" : a < b ? "<" : "=";
    const sa = String(a);
    const sb = String(b);
    let firstDiff = -1;
    for (let i = 0; i < sa.length; i++)
      if (sa[i] !== sb[i]) {
        firstDiff = i;
        break;
      }
    return {
      title: "Which is larger?",
      prompt: `Which sign belongs between these two numbers? $${a} \\;\\square\\; ${b}$`,
      mode: "choice",
      options: [
        { label: "$<$  (less than)", correct: rel === "<", why: rel === "<" ? "" : `$${a}$ is not less than $${b}$.` },
        { label: "$=$  (equal to)", correct: rel === "=", why: rel === "=" ? "" : "The two numbers are different." },
        { label: "$>$  (greater than)", correct: rel === ">", why: rel === ">" ? "" : `$${a}$ is not greater than $${b}$.` },
      ],
      hint: "Both numbers have the same number of digits, so compare them place by place from the left. The first place where they differ decides it.",
      why:
        rel === "="
          ? `They are the same number, so $${a} = ${b}$.`
          : `$${a} ${rel} ${b}$. Compare from the left: the digits agree until the ${PLACE_NAMES[sa.length - 1 - firstDiff]} place, where $${sa[firstDiff]}$ meets $${sb[firstDiff]}$ — and that settles it, because a difference in a higher place outweighs everything below it put together. Underneath, the meaning is about counting: the larger number is the one you reach later when counting upward.`,
    };
  },

  // Skip counting — the bridge from counting to multiplication.
  "skip-count": (rng, lvl) => {
    const step = lvl === 1 ? pick(rng, [2, 5, 10]) : lvl === 2 ? pick(rng, [3, 4, 6]) : pick(rng, [7, 8, 9, 11, 12, 25]);
    const k = Math.floor(rng() * 4) + 1;
    const start = step * k;
    const shown = [start, start + step, start + 2 * step, start + 3 * step];
    const ans = start + 4 * step;
    return {
      title: "Skip counting",
      prompt: `Continue the pattern. What comes next? $${shown.join(",\\ ")},\\ \\ldots$`,
      mode: "text",
      accept: [String(ans), words(ans)],
      answerLabel: String(ans),
      placeholder: "a number",
      hint: "Work out the gap between one number and the next, then add that gap once more.",
      why: `The numbers go up by $${step}$ each time, so the next is $${shown[3]} + ${step} = ${ans}$. Counting in ${step}s is the same as multiplying by $${step}$: this list is $${step}\\times${k}$, $${step}\\times${k + 1}$, $${step}\\times${k + 2}$, $${step}\\times${k + 3}$, and the answer is $${step}\\times${k + 4} = ${ans}$. Multiplication is repeated counting, which is precisely why it is quicker than counting.`,
    };
  },

  // Place value: what a digit is worth depends on where it stands.
  "place-value": (rng, lvl) => {
    const digits = lvl === 1 ? 3 : lvl === 2 ? 4 : 5;
    const lo = Math.pow(10, digits - 1);
    const n = Math.floor(rng() * (Math.pow(10, digits) - lo)) + lo;
    const s = String(n);
    const idx = Math.floor(rng() * digits);
    const placeFromRight = digits - 1 - idx;
    const digit = Number(s[idx]);
    const worth = digit * Math.pow(10, placeFromRight);
    const askWorth = rng() < 0.5;
    const place = PLACE_NAMES[placeFromRight];
    return {
      title: "Place value",
      prompt: askWorth
        ? `In the number $${n}$, what is the digit in the ${place} place actually worth?`
        : `In the number $${n}$, which digit stands in the ${place} place?`,
      mode: "text",
      accept: askWorth ? [String(worth), words(worth)] : [String(digit), words(digit)],
      answerLabel: String(askWorth ? worth : digit),
      placeholder: "a number",
      hint: "Read the places from the right: ones, tens, hundreds, thousands, ten-thousands. A digit is worth itself times the value of its place.",
      why: `$${n}$ breaks up as ${s
        .split("")
        .map((d, i) => `$${d} \\times ${Math.pow(10, digits - 1 - i)}$`)
        .join(" + ")} $= ${n}$. The digit in the ${place} place is $${digit}$, and it is worth $${digit} \\times ${Math.pow(10, placeFromRight)} = ${worth}$. That is what place value means, and it is why our numerals beat tally marks and Roman numerals: ten symbols say everything, and where a symbol stands tells you its size.`,
    };
  },

  // Numerals and number words, in both directions.
  "number-word": (rng, lvl) => {
    const pool =
      lvl === 1
        ? [7, 12, 15, 19, 20, 30, 40, 42, 55, 60, 68, 70, 90, 99]
        : lvl === 2
          ? [100, 101, 110, 115, 200, 250, 304, 342, 400, 415, 500, 560, 607, 700, 713, 800, 890, 900, 999]
          : [305, 406, 507, 608, 709, 801, 902, 1000, 1006, 1040, 1305, 2018, 4090, 7003, 9909];
    const n = pick(rng, pool);
    const toWords = rng() < 0.5;
    const w = words(n);
    return {
      title: "Numerals and names",
      prompt: toWords ? `Write $${n}$ in words.` : `Write "${w}" as a numeral.`,
      mode: "text",
      accept: toWords ? [w, w.replace(/ and /g, " "), w.replace(/-/g, " "), w.replace(/-/g, " ").replace(/ and /g, " ")] : [String(n)],
      answerLabel: toWords ? w : String(n),
      placeholder: toWords ? "in words" : "a number",
      hint: toWords
        ? "Say the thousands, then the hundreds, then the tens, then the ones."
        : "Thousands first, then hundreds, then tens, then ones — and remember that a part you never say aloud still needs a zero holding its place.",
      why: `$${n}$ is "${w}". ${
        String(n).includes("0")
          ? `Note the zero${(String(n).match(/0/g) || []).length > 1 ? "s" : ""}: nothing is said aloud for ${(String(n).match(/0/g) || []).length > 1 ? "them" : "it"}, but the numeral must still show ${(String(n).match(/0/g) || []).length > 1 ? "them" : "a $0$"}, because the zero is what holds the other digits in their places.`
          : "The words follow the places exactly — thousands, hundreds, tens, ones — which is the whole design of the system."
      }`,
    };
  },

  // Pairs that make ten (or a hundred, or a thousand) — the facts every later
  // mental method leans on.
  "make-ten": (rng, lvl) => {
    const target = lvl === 1 ? 10 : lvl === 2 ? 100 : 1000;
    const a =
      lvl === 1
        ? Math.floor(rng() * 9) + 1
        : lvl === 2
          ? (Math.floor(rng() * 9) + 1) * (rng() < 0.5 ? 10 : 1) + (rng() < 0.5 ? Math.floor(rng() * 9) + 1 : 0)
          : Math.floor(rng() * 989) + 11;
    const b = target - a;
    return {
      title: `Pairs that make ${target}`,
      prompt: `What must be added to $${a}$ to make $${target}$?`,
      mode: "text",
      accept: [String(b), words(b < 1000 ? b : 0)].filter((s) => s !== "zero" || b === 0),
      answerLabel: String(b),
      placeholder: "a number",
      hint: `Count on from $${a}$ to $${target}$ — or go up to the next round number first, then the rest of the way.`,
      why: `$${a} + ${b} = ${target}$, so the missing number is $${b}$. These are the facts every mental method leans on: crossing a ten, crossing a hundred, and every subtraction done by counting up rather than back.`,
    };
  },

  // A mixed capstone: one of the three operations, chosen at random.
  "mixed-arithmetic": (rng, lvl) => {
    const op = pick(rng, ["+", "-", "\\times", "\\div"]);
    let a: number, b: number, ans: number, method: string;
    if (op === "+") {
      a = lvl === 1 ? Math.floor(rng() * 8) + 1 : lvl === 2 ? Math.floor(rng() * 18) + 2 : Math.floor(rng() * 80) + 11;
      b = lvl === 1 ? Math.floor(rng() * (9 - a)) + 1 : Math.floor(rng() * 9) + 1;
      ans = a + b;
      method = `count on $${b}$ from $${a}$`;
    } else if (op === "-") {
      b = Math.floor(rng() * 9) + 1;
      a = lvl === 1 ? b + Math.floor(rng() * 9) : lvl === 2 ? b + Math.floor(rng() * 12) : Math.floor(rng() * 60) + 21;
      ans = a - b;
      method = `count back $${b}$ from $${a}$, or ask what must be added to $${b}$ to reach $${a}$`;
    } else if (op === "\\times") {
      a = lvl === 1 ? pick(rng, [2, 5, 10]) : lvl === 2 ? pick(rng, [3, 4, 6]) : pick(rng, [7, 8, 9, 12]);
      b = Math.floor(rng() * 9) + 2;
      ans = a * b;
      method = `$${b}$ groups of $${a}$, which is $${a}$ added $${b}$ times`;
    } else {
      b = lvl === 1 ? pick(rng, [2, 5, 10]) : lvl === 2 ? pick(rng, [3, 4, 6]) : pick(rng, [7, 8, 9]);
      ans = Math.floor(rng() * 8) + 2;
      a = b * ans;
      method = `count jumps of $${b}$ up to $${a}$ — it takes $${ans}$`;
    }
    return {
      title: "Mixed practice",
      prompt: `What is $${a} ${op} ${b}$?`,
      mode: "text",
      accept: [String(ans), words(ans < 1000 ? ans : 0)].filter((s) => s !== "zero" || ans === 0),
      answerLabel: String(ans),
      placeholder: "a number",
      hint: "Decide first which kind of counting this is: on, back, in jumps — or counting how many jumps fit.",
      why: `$${a} ${op} ${b} = ${ans}$ — ${method}.${
        op === "-" ? ` Check it forwards: $${ans} + ${b} = ${a}$.` : op === "\\times" ? ` And $${b} \\times ${a}$ is the same $${ans}$, since turning the rectangle changes nothing.` : op === "\\div" ? ` Check by multiplying back: $${ans} \\times ${b} = ${a}$.` : ` And $${b} + ${a}$ is the same $${ans}$.`
      }`,
    };
  },

  // ── Number systems ──────────────────────────────────────────────────────

  // Which sets does this number belong to? The core drill of lecture two.
  "number-classify": (rng, lvl) => {
    const pool = NUMBERS.filter((x) => (lvl === 1 ? x.d === 1 : lvl === 2 ? x.d <= 2 : true));
    const s = pick(rng, pool);
    const opts: Option[] = [
      {
        label: "A natural number ($\\mathbb{N}$)",
        correct: s.natural,
        why: s.natural
          ? "It is one — the number simplifies to a counting number."
          : "It is not: $\\mathbb{N}$ holds only $1, 2, 3, \\ldots$",
      },
      {
        label: "An integer ($\\mathbb{Z}$)",
        correct: s.integer,
        why: s.integer ? "It is one." : "It is not a whole number once simplified.",
      },
      {
        label: "A rational number ($\\mathbb{Q}$)",
        correct: s.rational,
        why: s.rational ? "It can be written as a ratio of integers." : "No ratio of integers equals it.",
      },
      {
        label: "Irrational",
        correct: !s.rational,
        why: s.rational ? "It is rational, so it cannot also be irrational." : "It is — no fraction equals it.",
      },
      {
        label: "Algebraic",
        correct: s.algebraic,
        why: s.algebraic
          ? "It is a root of some polynomial with integer coefficients."
          : "It is a root of no such polynomial — that is what transcendental means.",
      },
      {
        label: "Transcendental",
        correct: !s.algebraic,
        why: s.algebraic ? "It is algebraic, so not transcendental." : "It is — no integer polynomial has it as a root.",
      },
    ];
    return {
      title: "Which sets does it belong to?",
      prompt: `Tick every label that applies to $${s.tex}$. Simplify it first.`,
      mode: "multi",
      options: opts,
      hint: "Work out what the number actually equals before deciding. Then remember the nesting: every natural number is an integer, every integer is rational, every rational is algebraic.",
      why: `$${s.tex} = ${s.value}$. ${s.note} Remember the nesting $\\mathbb{N} \\subset \\mathbb{Z} \\subset \\mathbb{Q} \\subset \\mathbb{R}$: a label that applies drags every larger one along with it.`,
    };
  },

  // Is this system closed under this operation?
  "closure-check": (rng, lvl) => {
    const keys = lvl === 1 ? ["N", "Z"] : lvl === 2 ? ["N", "Z", "Q", "R"] : ["N", "Z", "Q", "R", "I"];
    const sys = SYSTEMS.find((s) => s.key === pick(rng, keys))!;
    const op = pick(rng, OPS);
    const [closed, note] = CLOSURE[sys.key][op.key];
    return {
      title: "Closed, or not?",
      prompt: `Take any two numbers from $${sys.tex}$ (${sys.name}) and ${op.phrase}. Must the answer always land back inside $${sys.tex}$?`,
      mode: "choice",
      options: shuffle(rng, [
        {
          label: "Yes — the system is closed under this operation.",
          correct: closed,
          why: closed ? "" : "One counterexample is enough to break closure, and there is one here.",
        },
        {
          label: "No — some pair escapes the system.",
          correct: !closed,
          why: !closed ? "" : "There is no escaping pair: the operation succeeds for every pair, with no exceptions.",
        },
      ]),
      hint: "Closure is a claim about *every* pair. To refute it you need only one escaping pair; to confirm it you need a reason that covers all of them.",
      why: note,
    };
  },

  // The smallest system in which an equation becomes solvable.
  "smallest-system": (rng, lvl) => {
    const pool = EQUATIONS.filter((e) => (lvl === 1 ? e.d === 1 : lvl === 2 ? e.d <= 2 : true));
    const e = pick(rng, pool);
    const opts: Option[] = SYS_ORDER.map((k) => ({
      label: SYS_LABEL[k],
      correct: k === e.sys,
      why:
        SYS_ORDER.indexOf(k) < SYS_ORDER.indexOf(e.sys)
          ? "Too small — this system contains no solution at all."
          : "This system does contain a solution, but a smaller one already does, and the question asks for the smallest.",
    }));
    return {
      title: "Which system does it need?",
      prompt: `What is the smallest of our number systems in which $${e.eq}$ has a solution?`,
      mode: "choice",
      options: opts,
      hint: "Solve the equation first, then ask which system that particular answer lives in.",
      why: `${e.note} Each enlargement in the chain $\\mathbb{N}\\subset\\mathbb{Z}\\subset\\mathbb{Q}\\subset\\mathbb{R}\\subset\\mathbb{C}$ exists precisely to solve equations the previous system could not.`,
    };
  },

  // Greatest common divisor by the Euclidean algorithm.
  "gcd-euclid": (rng, lvl) => {
    const g = lvl === 1 ? pick(rng, [2, 3, 4, 5, 6]) : lvl === 2 ? pick(rng, [6, 7, 9, 11, 12, 13, 14, 15]) : pick(rng, [17, 19, 21, 23, 26, 33, 35]);
    const span = lvl === 1 ? 8 : lvl === 2 ? 30 : 90;
    const base = lvl === 1 ? 2 : 11;
    let m = Math.floor(rng() * span) + base;
    let n = Math.floor(rng() * span) + base;
    let guard = 0;
    while ((gcd(m, n) !== 1 || m === n) && guard++ < 200) {
      m = Math.floor(rng() * span) + base;
      n = Math.floor(rng() * span) + base;
    }
    const a = g * m;
    const b = g * n;
    const lines: string[] = [];
    let x = Math.max(a, b);
    let y = Math.min(a, b);
    while (y !== 0) {
      const q = Math.floor(x / y);
      const r = x - q * y;
      lines.push(`$${x} = ${q}\\cdot${y} + ${r}$`);
      [x, y] = [y, r];
    }
    return {
      title: "Greatest common divisor",
      prompt: `Use the Euclidean algorithm to compute $\\gcd(${a},\\ ${b})$.`,
      mode: "text",
      accept: [String(g)],
      answerLabel: String(g),
      placeholder: "a whole number",
      hint: "Divide the larger by the smaller, keep the remainder, repeat. Stop when the remainder is zero; the answer is the last non-zero remainder.",
      why: `${lines.join("; ")}. The last non-zero remainder is $${g}$, so $\\gcd(${a}, ${b}) = ${g}$ — and indeed $${a} = ${g}\\cdot${a / g}$ and $${b} = ${g}\\cdot${b / g}$, with $${a / g}$ and $${b / g}$ sharing no factor.`,
    };
  },

  // Count the divisors from the prime factorisation.
  "divisor-count": (rng, lvl) => {
    if (lvl === 3) {
      const [p, e1, q, e2, r, e3] = pick(rng, [
        [2, 2, 3, 1, 5, 1],
        [2, 3, 3, 2, 5, 1],
        [2, 1, 3, 1, 7, 2],
        [2, 2, 5, 1, 7, 1],
        [3, 2, 5, 2, 2, 1],
      ]);
      const n = Math.pow(p, e1) * Math.pow(q, e2) * Math.pow(r, e3);
      const count = (e1 + 1) * (e2 + 1) * (e3 + 1);
      return {
        title: "How many divisors?",
        prompt: `The number $${n}$ factors as $${p}^{${e1}} \\cdot ${q}^{${e2}} \\cdot ${r}^{${e3}}$. How many positive divisors does it have?`,
        mode: "text",
        accept: [String(count)],
        answerLabel: String(count),
        placeholder: "a whole number",
        hint: "One independent choice of exponent per prime. Multiply the numbers of choices.",
        why: `The exponents may be chosen independently: $${e1 + 1}$ ways for $${p}$, $${e2 + 1}$ for $${q}$, $${e3 + 1}$ for $${r}$. So the count is $${e1 + 1} \\times ${e2 + 1} \\times ${e3 + 1} = ${count}$. Unique factorisation is what makes this a multiplication rather than a search.`,
      };
    }
    const base =
      lvl === 1
        ? pick(rng, [
            [2, 2, 3, 1],
            [2, 1, 3, 1],
            [2, 3, 3, 1],
            [3, 1, 5, 1],
            [2, 2, 5, 1],
          ])
        : pick(rng, [
            [2, 3, 3, 2],
            [2, 4, 3, 1],
            [2, 2, 5, 2],
            [3, 2, 5, 1],
            [2, 3, 7, 1],
            [2, 5, 3, 2],
            [7, 2, 2, 2],
          ]);
    const [p, e1, q, e2] = base;
    const n = Math.pow(p, e1) * Math.pow(q, e2);
    const count = (e1 + 1) * (e2 + 1);
    return {
      title: "How many divisors?",
      prompt: `The number $${n}$ factors as $${p}^{${e1}} \\cdot ${q}^{${e2}}$. How many positive divisors does it have?`,
      mode: "text",
      accept: [String(count)],
      answerLabel: String(count),
      placeholder: "a whole number",
      hint: "A divisor is built by choosing an exponent for each prime independently. How many choices are there for each?",
      why: `The exponent of $${p}$ may be any of $0, 1, \\ldots, ${e1}$ — that is $${e1 + 1}$ choices — and the exponent of $${q}$ any of $${e2 + 1}$. The choices are independent, so the divisor count is $${e1 + 1} \\times ${e2 + 1} = ${count}$. This is why unique factorisation matters: it turns a counting problem into a multiplication.`,
    };
  },

  // Does 1/n terminate or repeat, and why?
  "decimal-type": (rng, lvl) => {
    const pool =
      lvl === 1
        ? [2, 3, 4, 5, 6, 8, 9, 10, 20, 25]
        : lvl === 2
          ? [7, 11, 12, 13, 15, 16, 22, 32, 40, 50, 64]
          : [14, 17, 24, 28, 35, 36, 44, 48, 55, 80, 96, 125, 128, 160, 200, 250];
    const n = pick(rng, pool);
    const f = factorise(n);
    const only25 = f.every(([p]) => p === 2 || p === 5);
    return {
      title: "Terminate or repeat?",
      prompt: `Does the decimal expansion of $\\tfrac{1}{${n}}$ terminate, or does it repeat forever?`,
      mode: "choice",
      options: shuffle(rng, [
        {
          label: "It terminates.",
          correct: only25,
          why: only25
            ? ""
            : "It cannot: the denominator has a prime factor other than $2$ and $5$, and long division by such a denominator never reaches a remainder of zero.",
        },
        {
          label: "It repeats forever.",
          correct: !only25,
          why: !only25 ? "" : "It does not: the denominator's only prime factors are $2$ and $5$, so the division terminates.",
        },
      ]),
      hint: "Factorise the denominator. Our base is $10 = 2 \\times 5$ — which primes can therefore be cleared?",
      why: `$${n} = ${factorTex(f)}$. ${
        only25
          ? "Its only prime factors are $2$ and $5$, the primes dividing the base $10$, so the expansion terminates."
          : `It contains the prime factor $${f.find(([p]) => p !== 2 && p !== 5)![0]}$, which does not divide $10$, so the long division never reaches remainder $0$ and the expansion repeats.`
      } The general rule: $1/n$ in lowest terms terminates exactly when $n$ has no prime factors other than $2$ and $5$.`,
    };
  },

  // Turn a repeating decimal back into a fraction.
  "repeating-fraction": (rng, lvl) => {
    const preLen = lvl === 1 ? 0 : lvl === 2 ? Math.floor(rng() * 2) : 1;
    const blockLen = lvl === 1 ? 1 : lvl === 2 ? Math.floor(rng() * 2) + 1 : 2;
    const pre = preLen ? String(Math.floor(rng() * 9) + 1) : "";
    let block = "";
    for (let i = 0; i < blockLen; i++) block += String(Math.floor(rng() * 9) + 1);
    const shifted = Number(pre + block);
    const kept = preLen ? Number(pre) : 0;
    const denom = (Math.pow(10, blockLen) - 1) * Math.pow(10, preLen);
    const numer = shifted - kept;
    const g = gcd(numer, denom);
    const shown = `0.${pre}\\overline{${block}}`;
    return {
      title: "Repeating decimal to fraction",
      prompt: `Write $${shown}$ as a fraction in lowest terms. Type it as a/b.`,
      mode: "text",
      accept: [`${numer / g}/${denom / g}`, `${numer}/${denom}`],
      answerLabel: `${numer / g}/${denom / g}`,
      placeholder: "e.g. 4/11",
      hint: "Multiply by a power of ten to clear the non-repeating digits, then by another to shift exactly one period, and subtract. The infinite tails cancel.",
      why: `Let $x = ${shown}$. Then $10^{${preLen}}x = ${kept}.\\overline{${block}}$ and $10^{${preLen + blockLen}}x = ${shifted}.\\overline{${block}}$. Subtracting cancels the tails: $${denom}x = ${shifted} - ${kept} = ${numer}$, so $x = \\tfrac{${numer}}{${denom}} = \\tfrac{${numer / g}}{${denom / g}}$. Every repeating decimal is rational, and this is the method that proves it.`,
    };
  },

  // |x - a| < d, read as a distance, is an interval.
  "abs-interval": (rng, lvl) => {
    const a = lvl === 1 ? Math.floor(rng() * 9) + 1 : lvl === 2 ? Math.floor(rng() * 15) - 4 : Math.floor(rng() * 21) - 10;
    const d = lvl === 3 ? Math.floor(rng() * 8) + 1 : Math.floor(rng() * 5) + 1;
    const strict = lvl === 1 ? true : rng() < 0.5;
    const lo = a - d;
    const hi = a + d;
    const inner = strict ? "<" : "\\le";
    const open = strict ? ["(", ")"] : ["[", "]"];
    const right = `$${open[0]}${lo},\\ ${hi}${open[1]}$`;
    const wrongA = `$${strict ? "[" : "("}${lo},\\ ${hi}${strict ? "]" : ")"}$`;
    const wrongB = `$${open[0]}${a},\\ ${a + 2 * d}${open[1]}$`;
    const wrongC = `$${open[0]}${lo - d},\\ ${hi + d}${open[1]}$`;
    const sign = a < 0 ? `+ ${-a}` : `- ${a}`;
    return {
      title: "Absolute value as distance",
      prompt: `Write the solution set of $|x ${sign}| ${inner} ${d}$ as an interval.`,
      mode: "choice",
      options: shuffle(rng, [
        { label: right, correct: true },
        {
          label: wrongA,
          correct: false,
          why: strict
            ? "The inequality is strict, so the endpoints themselves are excluded — that calls for round brackets."
            : "The inequality allows equality, so the endpoints are included — that calls for square brackets.",
        },
        {
          label: wrongB,
          correct: false,
          why: `This treats $${a}$ as the left end rather than the centre. $|x ${sign}|$ is the distance from $x$ to $${a}$, so $${a}$ sits in the middle.`,
        },
        {
          label: wrongC,
          correct: false,
          why: `The radius is $${d}$, not $${2 * d}$: the interval runs from $${a} - ${d}$ to $${a} + ${d}$, a total width of $${2 * d}$.`,
        },
      ]),
      hint: `Read $|x ${sign}|$ as "the distance from $x$ to $${a}$". Which points are within $${d}$ of $${a}$?`,
      why: `$|x ${sign}| ${inner} ${d}$ says $x$ is ${strict ? "strictly within" : "within"} $${d}$ of $${a}$, which is $${lo} ${inner} x ${inner} ${hi}$ — the interval $${open[0]}${lo}, ${hi}${open[1]}$, centred on $${a}$ with radius $${d}$. Reading absolute value as distance rather than as a case split is what makes the $\\varepsilon$–$\\delta$ definition of a limit readable later.`,
    };
  },
};


// ── Component ─────────────────────────────────────────────────────────────

const norm = (s: string) => s.trim().toLowerCase().replace(/\s+/g, "").replace(/^\+/, "");

export function Drill({ spec }: { spec: string }) {
  const kind = spec.trim().split("\n")[0].trim();
  const gen = GENERATORS[kind];

  // Every drill opens on a solved instance — "this is how it's done" — and
  // only then hands the reader the same kind of problem. Example and practice
  // come from the same generator, so the pattern demonstrated is exactly the
  // pattern to be applied. Stepping the difficulty up returns to a worked
  // example at the new level, because a harder band is a new pattern to see
  // before it is a new problem to solve.
  const [phase, setPhase] = useState<"example" | "practice">("example");
  const [exSeed, setExSeed] = useState(0);
  // The solution stays hidden until asked for — try it in your head first.
  const [revealed, setRevealed] = useState(false);
  const [seed, setSeed] = useState(0);
  // Difficulty is the reader's to set. Every generator takes it and varies the
  // numbers, the pool it samples from, or both — a level is a different band of
  // question, not the same question with a harder skin.
  const [lvl, setLvl] = useState<Level>(1);
  const [chosen, setChosen] = useState<Set<number>>(new Set());
  const [typed, setTyped] = useState("");
  const [graded, setGraded] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [asked, setAsked] = useState(0);
  const [streak, setStreak] = useState(0);
  const [best, setBest] = useState(0);

  const item = useMemo(() => (gen ? gen(mulberry32(seed + 1), lvl) : null), [gen, seed, lvl]);
  // Offset the example's seed well clear of the practice seeds so the reader
  // does not immediately meet the very question they were just shown solved.
  const example = useMemo(
    () => (gen ? gen(mulberry32(exSeed * 7 + 9973), lvl) : null),
    [gen, exSeed, lvl],
  );
  if (!item || !example) return null;

  const options = item.options ?? [];
  const correctSet = new Set(options.map((o, i) => (o.correct ? i : -1)).filter((i) => i >= 0));

  const isRight = (() => {
    if (!graded) return false;
    if (item.mode === "text") return (item.accept ?? []).some((a) => norm(a) === norm(typed));
    if (item.mode === "multi")
      return chosen.size === correctSet.size && [...chosen].every((i) => correctSet.has(i));
    return chosen.size === 1 && correctSet.has([...chosen][0]);
  })();

  const submit = () => {
    if (graded) return;
    if (item.mode === "text" && !typed.trim()) return;
    if (item.mode !== "text" && chosen.size === 0) return;
    setGraded(true);
    setAsked((n) => n + 1);
    const right =
      item.mode === "text"
        ? (item.accept ?? []).some((a) => norm(a) === norm(typed))
        : item.mode === "multi"
          ? chosen.size === correctSet.size && [...chosen].every((i) => correctSet.has(i))
          : chosen.size === 1 && correctSet.has([...chosen][0]);
    if (right) {
      setStreak((s) => {
        const next = s + 1;
        setBest((b) => Math.max(b, next));
        return next;
      });
    } else {
      setStreak(0);
    }
  };

  const setLevel = (l: Level) => {
    if (l === lvl) return;
    setLvl(l);
    setPhase("example");
    setRevealed(false);
    setExSeed((s) => s + 1);
    setSeed((s) => s + 1);
    setChosen(new Set());
    setTyped("");
    setGraded(false);
    setShowHint(false);
    setStreak(0);
  };

  const next = () => {
    setSeed((s) => s + 1);
    setChosen(new Set());
    setTyped("");
    setGraded(false);
    setShowHint(false);
  };

  const toggle = (i: number) => {
    if (graded) return;
    setChosen((prev) => {
      const s = new Set(prev);
      if (item.mode === "multi") {
        if (s.has(i)) s.delete(i);
        else s.add(i);
      } else {
        s.clear();
        s.add(i);
      }
      return s;
    });
  };

  // ── Worked example ──────────────────────────────────────────────────────
  // The same generator, fully solved: prompt, answer, and the explanation the
  // practice phase would have given. Nothing to do but read it.
  if (phase === "example") {
    const exOptions = example.options ?? [];
    return (
      <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
        <div className="px-4 sm:px-5 pt-3.5 pb-1 flex flex-wrap items-center gap-x-2 gap-y-1">
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">
            ◆ Worked example
          </span>
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper">
            · {example.title}
          </span>
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper ml-auto">
            {lvl === 1 ? "gentle" : lvl === 2 ? "standard" : "hard"}
          </span>
        </div>
        <div className="px-4 sm:px-5 pb-4">
          <p className="font-sans text-[13px] leading-relaxed text-muted mb-2">
            {revealed
              ? "Here is the whole solution. When it makes sense, try one yourself."
              : "First, one example. Try it in your head, then reveal the solution."}
          </p>
          <p className="font-sans text-[15px] leading-relaxed text-ink mb-3">
            <Rich text={example.prompt} />
          </p>

          {!revealed ? (
            <button
              onClick={() => setRevealed(true)}
              className="font-sans text-[13px] font-medium px-3.5 py-2 rounded-xl border border-line text-ink hover:border-ink transition-colors"
            >
              Reveal the solution
            </button>
          ) : (
            <>
              {example.mode === "text" ? (
                <p className="font-sans text-[14px] text-ink">
                  <span className="text-whisper">Answer: </span>
                  <span className="font-mono font-medium text-[var(--ok-text)]">
                    {example.answerLabel}
                  </span>
                </p>
              ) : (
                <div className="space-y-2">
                  {exOptions.map((opt, i) => (
                    <div
                      key={i}
                      className={`flex w-full items-center gap-3 text-left font-sans text-[14px] px-4 py-2 rounded-xl border ${
                        opt.correct
                          ? "border-[var(--ok-border)] bg-[var(--ok-bg)] text-[var(--ok-text)] font-medium"
                          : "border-line text-faint"
                      }`}
                    >
                      <span className="font-mono text-[11px] text-numeral shrink-0">
                        {String.fromCharCode(65 + i)}
                      </span>
                      <span className="flex-1">
                        <Rich text={opt.label} />
                      </span>
                      {opt.correct && <span className="shrink-0 font-sans text-[13px]">✓</span>}
                    </div>
                  ))}
                </div>
              )}

              <p className="mt-2.5 font-sans text-[13px] leading-relaxed text-muted">
                <Rich text={example.why} />
              </p>

              <div className="mt-3.5 flex flex-wrap items-center gap-3">
                <button
                  onClick={() => setPhase("practice")}
                  className="font-sans text-[13px] font-medium px-3.5 py-2 rounded-xl border border-maroon text-maroon hover:bg-purple-soft/40 transition-colors"
                >
                  Your turn →
                </button>
                <button
                  onClick={() => {
                    setExSeed((s) => s + 1);
                    setRevealed(false);
                  }}
                  className="font-sans text-[13px] text-whisper hover:text-maroon underline underline-offset-2"
                >
                  Show me another one
                </button>
              </div>
            </>
          )}
        </div>
      </div>
    );
  }

  return (
    <div className="my-6 not-prose border border-line rounded-2xl bg-page overflow-hidden">
      <div className="px-4 sm:px-5 pt-3.5 pb-1 flex flex-wrap items-center gap-x-2 gap-y-1">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-maroon">
          ∞ Drill
        </span>
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper">
          · {item.title}
        </span>
        {asked > 0 && (
          <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper ml-auto">
            streak {streak}
            {best > 0 && ` · best ${best}`}
          </span>
        )}
      </div>
      <div className="px-4 sm:px-5 pb-2.5 flex items-center gap-1.5">
        <span className="font-mono text-[10px] uppercase tracking-[0.16em] text-whisper mr-0.5">
          level
        </span>
        {([1, 2, 3] as Level[]).map((l) => (
          <button
            key={l}
            onClick={() => setLevel(l)}
            aria-pressed={l === lvl}
            className={`font-sans text-[12px] px-2.5 py-1 rounded-lg border transition-colors ${
              l === lvl
                ? "border-maroon text-maroon font-medium"
                : "border-line text-muted hover:border-ink hover:text-ink"
            }`}
          >
            {l === 1 ? "gentle" : l === 2 ? "standard" : "hard"}
          </button>
        ))}
      </div>
      <div className="px-4 sm:px-5 pb-4">
        <p className="font-sans text-[15px] leading-relaxed text-ink mb-1.5">
          <Rich text={item.prompt} />
        </p>
        <p className="font-sans text-[12.5px] text-whisper mb-3">
          {item.mode === "text"
            ? "Type your answer, then press Check."
            : item.mode === "multi"
              ? "Tick every answer that is true, then press Check."
              : "Pick one answer."}
        </p>

        {item.mode === "text" ? (
          <div className="flex flex-wrap items-center gap-2">
            <input
              value={typed}
              onChange={(e) => setTyped(e.target.value)}
              onKeyDown={(e) => {
                if (e.key === "Enter") submit();
              }}
              disabled={graded}
              placeholder={item.placeholder}
              className="font-mono text-[14px] px-3 py-2 rounded-xl border border-line bg-page text-ink w-44 disabled:text-faint"
            />
            {!graded && (
              <button
                onClick={submit}
                className="font-sans text-[13px] font-medium px-3 py-2 rounded-xl border border-line text-ink hover:border-ink"
              >
                Check
              </button>
            )}
          </div>
        ) : (
          <div className="space-y-2">
            {options.map((opt, i) => {
              const isPicked = chosen.has(i);
              let tone: string;
              let badge: string | null = null;
              if (graded && opt.correct) {
                tone = "border-[var(--ok-border)] bg-[var(--ok-bg)] text-[var(--ok-text)] font-medium";
                badge = "✓";
              } else if (graded && isPicked) {
                tone = "border-[var(--bad-border)] bg-[var(--bad-bg)] text-[var(--bad-text)]";
                badge = "✗";
              } else if (isPicked) {
                tone = "border-ink text-ink";
                badge = "•";
              } else if (graded) {
                tone = "border-line text-faint";
              } else {
                tone = "border-line text-ink hover:border-ink";
              }
              return (
                <div key={i}>
                  <button
                    disabled={graded}
                    onClick={() => toggle(i)}
                    className={`flex w-full items-center gap-3 text-left font-sans text-[14px] px-4 py-2 rounded-xl border ${tone} transition-colors disabled:cursor-default`}
                  >
                    <span className="font-mono text-[11px] text-numeral shrink-0">
                      {String.fromCharCode(65 + i)}
                    </span>
                    <span className="flex-1">
                      <Rich text={opt.label} />
                    </span>
                    {badge && <span className="shrink-0 font-sans text-[13px]">{badge}</span>}
                  </button>
                  {/* An option's own explanation appears once graded, and only
                      where it is informative: a wrong pick, or a right answer
                      the reader missed. */}
                  {graded && opt.why && (isPicked !== opt.correct) && (
                    <p className="mt-1.5 mb-1 pl-4 pr-2 font-sans text-[13px] leading-relaxed text-muted border-l-2 border-[var(--bad-border)]">
                      <Rich text={opt.why} />
                    </p>
                  )}
                </div>
              );
            })}
          </div>
        )}

        {!graded && item.mode !== "text" && (
          <button
            onClick={submit}
            disabled={chosen.size === 0}
            className="mt-3 font-sans text-[13px] font-medium px-3 py-1.5 rounded-xl border border-line text-ink hover:border-ink disabled:text-faint disabled:hover:border-line"
          >
            {item.mode === "multi" ? "Check selection" : "Check"}
          </button>
        )}

        {graded && (
          <p
            className={`mt-3 font-sans text-[13px] font-semibold ${
              isRight ? "text-[var(--ok-text)]" : "text-[var(--bad-text)]"
            }`}
          >
            {isRight
              ? streak >= 5
                ? `Right — ${streak} in a row.`
                : "Right."
              : item.mode === "text"
                ? `Not quite — the answer is ${item.answerLabel}.`
                : item.mode === "multi"
                  ? "Not quite — the full correct selection is marked above."
                  : "Not quite — the right answer is marked above."}
          </p>
        )}

        {graded && (
          <p className="mt-1.5 font-sans text-[13px] leading-relaxed text-muted">
            <Rich text={item.why} />
          </p>
        )}

        {!graded && item.hint && (
          <div className="mt-2.5">
            {showHint ? (
              <p className="font-sans text-[13px] leading-relaxed text-muted">
                <span className="font-semibold">Hint:</span> <Rich text={item.hint} />
              </p>
            ) : (
              <button
                onClick={() => setShowHint(true)}
                className="font-sans text-[13px] text-whisper hover:text-maroon underline underline-offset-2"
              >
                Show hint
              </button>
            )}
          </div>
        )}

        {graded && isRight && streak >= 5 && lvl < 3 && (
          <p className="mt-2 font-sans text-[13px] leading-relaxed text-muted">
            {streak} in a row at this level — that one is in place.{" "}
            <button
              onClick={() => setLevel((lvl + 1) as Level)}
              className="font-medium text-maroon hover:underline underline-offset-2"
            >
              Step up to {lvl === 1 ? "standard" : "hard"} →
            </button>
          </p>
        )}

        <div className="mt-3 flex flex-wrap items-center gap-3">
          <button
            onClick={next}
            className="font-sans text-[13px] font-medium text-maroon hover:underline underline-offset-2"
          >
            {graded ? "Another one →" : "Skip this one →"}
          </button>
          <button
            onClick={() => {
              setPhase("example");
              setRevealed(false);
              setExSeed((s) => s + 1);
            }}
            className="font-sans text-[13px] text-whisper hover:text-maroon underline underline-offset-2"
          >
            Show me one solved
          </button>
          {asked > 0 && (
            <span className="font-sans text-[12px] text-whisper">
              {asked} answered. Keep going until the answer is automatic — the questions never run out.
            </span>
          )}
        </div>
      </div>
    </div>
  );
}
