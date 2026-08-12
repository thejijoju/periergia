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

type Generator = (rng: () => number) => DrillItem;

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
  note: string;
};

const NUMBERS: Spec[] = [
  { tex: "7", value: "7", natural: true, integer: true, rational: true, algebraic: true, note: "A counting number, so it lies in every system from $\\mathbb{N}$ outward. It is algebraic as a root of $x - 7$." },
  { tex: "-4", value: "-4", natural: false, integer: true, rational: true, algebraic: true, note: "Negative, so not a counting number, but an integer and hence rational ($-4/1$) and algebraic (a root of $x + 4$)." },
  { tex: "0", value: "0", natural: false, integer: true, rational: true, algebraic: true, note: "Zero is an integer. Whether it counts as a natural number is a convention; this lecture starts $\\mathbb{N}$ at $1$, so here it does not." },
  { tex: "\\tfrac{3}{4}", value: "0.75", natural: false, integer: false, rational: true, algebraic: true, note: "A ratio of integers, so rational; algebraic as a root of $4x - 3$. Its decimal terminates because the denominator is a power of $2$." },
  { tex: "-\\tfrac{7}{5}", value: "-1.4", natural: false, integer: false, rational: true, algebraic: true, note: "Rational and algebraic (a root of $5x + 7$), but not an integer." },
  { tex: "0.125", value: "1/8", natural: false, integer: false, rational: true, algebraic: true, note: "A terminating decimal is always rational: $0.125 = 125/1000 = 1/8$." },
  { tex: "0.\\overline{3}", value: "1/3", natural: false, integer: false, rational: true, algebraic: true, note: "A repeating decimal is rational. $x = 0.\\overline3$ gives $10x - x = 3$, so $x = 1/3$. Infinitely many digits does not mean irrational." },
  { tex: "0.\\overline{9}", value: "1", natural: true, integer: true, rational: true, algebraic: true, note: "The trap. $0.\\overline9$ is not close to $1$, it *is* $1$: $10x - x = 9$ gives $x = 1$. So it is a natural number." },
  { tex: "\\sqrt{2}", value: "1.41421...", natural: false, integer: false, rational: false, algebraic: true, note: "Irrational — proved by the parity argument — but algebraic, being a root of $x^2 - 2$." },
  { tex: "\\sqrt{5}", value: "2.23606...", natural: false, integer: false, rational: false, algebraic: true, note: "$5$ is not a perfect square, so $\\sqrt5$ is irrational; it is algebraic as a root of $x^2 - 5$." },
  { tex: "\\sqrt{9}", value: "3", natural: true, integer: true, rational: true, algebraic: true, note: "Simplify first: $\\sqrt9 = 3$. A square root is only irrational when the number under it is not a perfect square." },
  { tex: "\\sqrt{16}", value: "4", natural: true, integer: true, rational: true, algebraic: true, note: "$\\sqrt{16} = 4$, a natural number. The radical sign is not by itself a mark of irrationality." },
  { tex: "\\sqrt[3]{8}", value: "2", natural: true, integer: true, rational: true, algebraic: true, note: "$\\sqrt[3]{8} = 2$. Cube roots of perfect cubes are integers." },
  { tex: "\\sqrt{2}\\cdot\\sqrt{2}", value: "2", natural: true, integer: true, rational: true, algebraic: true, note: "Two irrationals whose product is rational — which is exactly why the irrationals are closed under nothing. $\\sqrt2\\cdot\\sqrt2 = 2$." },
  { tex: "\\sqrt{2} + (3 - \\sqrt{2})", value: "3", natural: true, integer: true, rational: true, algebraic: true, note: "Both terms are irrational and the $\\sqrt2$s cancel, leaving $3$. A sum of irrationals may be rational." },
  { tex: "3 + \\sqrt{2}", value: "4.41421...", natural: false, integer: false, rational: false, algebraic: true, note: "Rational plus irrational is always irrational: if $3+\\sqrt2$ were rational, subtracting $3$ would make $\\sqrt2$ rational. It is algebraic, a root of $x^2 - 6x + 7$." },
  { tex: "\\tfrac{\\sqrt{2}}{2}", value: "0.70710...", natural: false, integer: false, rational: false, algebraic: true, note: "A non-zero rational times an irrational is irrational. Algebraic, as a root of $2x^2 - 1$." },
  { tex: "\\varphi = \\tfrac{1+\\sqrt{5}}{2}", value: "1.61803...", natural: false, integer: false, rational: false, algebraic: true, note: "The golden ratio is irrational but algebraic: it satisfies $x^2 - x - 1 = 0$ exactly." },
  { tex: "\\pi", value: "3.14159...", natural: false, integer: false, rational: false, algebraic: false, note: "Irrational, and transcendental by Lindemann's theorem — it is a root of no polynomial with integer coefficients, which is why the circle cannot be squared." },
  { tex: "e", value: "2.71828...", natural: false, integer: false, rational: false, algebraic: false, note: "Irrational and transcendental, proved by Hermite in 1873." },
  { tex: "\\tfrac{\\pi}{2}", value: "1.57079...", natural: false, integer: false, rational: false, algebraic: false, note: "A non-zero rational multiple of a transcendental number is again transcendental, since scaling by a rational cannot produce a polynomial root." },
  { tex: "2\\pi", value: "6.28318...", natural: false, integer: false, rational: false, algebraic: false, note: "Transcendental, for the same reason as $\\pi/2$: multiplying by a non-zero rational preserves both irrationality and transcendence." },
  { tex: "\\tfrac{22}{7}", value: "3.142857...", natural: false, integer: false, rational: false, algebraic: true, note: "The trap. $22/7$ is a rational approximation to $\\pi$, not $\\pi$ — it is a ratio of integers, so it is rational and algebraic. Its decimal repeats with period $6$." },
  { tex: "\\log_2 3", value: "1.58496...", natural: false, integer: false, rational: false, algebraic: false, note: "Irrational: $\\log_2 3 = p/q$ would give $2^p = 3^q$, even equal to odd. It is transcendental as well, by the Gelfond–Schneider theorem." },
  { tex: "\\log_2 8", value: "3", natural: true, integer: true, rational: true, algebraic: true, note: "Simplify first: $2^3 = 8$, so $\\log_2 8 = 3$. Logarithms are only irrational when the base is not a whole power away." },
  { tex: "-\\sqrt{4}", value: "-2", natural: false, integer: true, rational: true, algebraic: true, note: "$\\sqrt4 = 2$, so this is $-2$: an integer, not a natural number under the convention that $\\mathbb{N}$ starts at $1$." },
  { tex: "\\sqrt{\\tfrac{1}{4}}", value: "1/2", natural: false, integer: false, rational: true, algebraic: true, note: "$\\sqrt{1/4} = 1/2$, a perfectly ordinary rational. The root of a perfect square stays rational even when it is fractional." },
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

type EqSpec = { eq: string; sys: string; note: string };
const EQUATIONS: EqSpec[] = [
  { eq: "x + 2 = 9", sys: "N", note: "$x = 7$, a counting number, so no enlargement is needed at all." },
  { eq: "x + 6 = 4", sys: "Z", note: "$x = -2$. The equation $a + x = b$ has no natural solution when $a \\ge b$; repairing that is exactly what $\\mathbb{Z}$ is for." },
  { eq: "x + 5 = 5", sys: "Z", note: "$x = 0$. Under the convention that $\\mathbb{N}$ starts at $1$, the natural numbers have no additive identity, so even this needs $\\mathbb{Z}$." },
  { eq: "3x = 12", sys: "N", note: "$x = 4$, already a counting number — the division happens to come out whole." },
  { eq: "6x = 3", sys: "Q", note: "$x = 1/2$. Integers have no multiplicative inverses, so a division that does not come out whole needs $\\mathbb{Q}$." },
  { eq: "5x = -2", sys: "Q", note: "$x = -2/5$: negative, so beyond $\\mathbb{N}$, and fractional, so beyond $\\mathbb{Z}$." },
  { eq: "x^2 = 4", sys: "N", note: "$x = 2$ is a solution and is a counting number. (The equation also has the solution $-2$, but the question asks where a solution first exists.)" },
  { eq: "x^2 = 2", sys: "R", note: "No rational squares to $2$ — that is the parity proof — so this equation is what forces the reals." },
  { eq: "x^2 = 3", sys: "R", note: "$3$ is not a perfect square, so $\\sqrt3$ is irrational and only $\\mathbb{R}$ contains a solution." },
  { eq: "x^2 = -1", sys: "C", note: "No real squares to a negative number, so this is the equation that forces $\\mathbb{C}$." },
  { eq: "x^2 + 4 = 0", sys: "C", note: "$x^2 = -4$ has no real solution; in $\\mathbb{C}$ the solutions are $\\pm 2i$." },
  { eq: "2x = 7", sys: "Q", note: "$x = 7/2$, fractional but perfectly rational." },
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

const GENERATORS: Record<string, Generator> = {
  // Which sets does this number belong to? The central drill of the lecture.
  "number-classify": (rng) => {
    const s = pick(rng, NUMBERS);
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
        why: s.rational
          ? "It can be written as a ratio of integers."
          : "No ratio of integers equals it.",
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
  "closure-check": (rng) => {
    const sys = pick(rng, SYSTEMS);
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
  "smallest-system": (rng) => {
    const e = pick(rng, EQUATIONS);
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
  "gcd-euclid": (rng) => {
    const g = pick(rng, [3, 6, 7, 9, 11, 12, 13, 14, 15, 17, 21]);
    let m = Math.floor(rng() * 40) + 11;
    let n = Math.floor(rng() * 40) + 11;
    while (gcd(m, n) !== 1) {
      m = Math.floor(rng() * 40) + 11;
      n = Math.floor(rng() * 40) + 11;
    }
    const a = g * m;
    const b = g * n;
    // Record the algorithm's actual lines so the explanation is the real run.
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
  "divisor-count": (rng) => {
    const base = pick(rng, [
      [2, 3, 3, 2],
      [2, 4, 3, 1],
      [2, 2, 5, 2],
      [3, 2, 5, 1],
      [2, 3, 7, 1],
      [2, 2, 3, 3],
      [3, 3, 2, 2],
      [5, 2, 2, 3],
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
  "decimal-type": (rng) => {
    const n = pick(rng, [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 20, 22, 25, 32, 40, 50, 64]);
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
          why: only25 ? "" : "It cannot: the denominator has a prime factor other than $2$ and $5$, and long division by such a denominator never reaches a remainder of zero.",
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
  "repeating-fraction": (rng) => {
    const preLen = Math.floor(rng() * 2); // 0 or 1 non-repeating digits
    const pre = preLen ? String(Math.floor(rng() * 9) + 1) : "";
    const blockLen = Math.floor(rng() * 2) + 1; // 1 or 2 repeating digits
    let block = "";
    for (let i = 0; i < blockLen; i++) block += String(Math.floor(rng() * 9) + 1);
    const shifted = Number(pre + block); // 10^(pre+block) * x, integer part
    const kept = preLen ? Number(pre) : 0; // 10^pre * x, integer part
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
  "abs-interval": (rng) => {
    const a = Math.floor(rng() * 15) - 5;
    const d = Math.floor(rng() * 5) + 1;
    const strict = rng() < 0.5;
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
        { label: wrongA, correct: false, why: strict ? "The inequality is strict, so the endpoints themselves are excluded — that calls for round brackets." : "The inequality allows equality, so the endpoints are included — that calls for square brackets." },
        { label: wrongB, correct: false, why: `This treats $${a}$ as the left end rather than the centre. $|x ${sign}|$ is the distance from $x$ to $${a}$, so $${a}$ sits in the middle.` },
        { label: wrongC, correct: false, why: `The radius is $${d}$, not $${2 * d}$: the interval runs from $${a} - ${d}$ to $${a} + ${d}$, a total width of $${2 * d}$.` },
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

  const [seed, setSeed] = useState(0);
  const [chosen, setChosen] = useState<Set<number>>(new Set());
  const [typed, setTyped] = useState("");
  const [graded, setGraded] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [asked, setAsked] = useState(0);
  const [streak, setStreak] = useState(0);
  const [best, setBest] = useState(0);

  const item = useMemo(() => (gen ? gen(mulberry32(seed + 1)) : null), [gen, seed]);
  if (!item) return null;

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
      <div className="px-4 sm:px-5 pb-4">
        <p className="font-sans text-[15px] leading-relaxed text-ink mb-3">
          <Rich text={item.prompt} />
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

        <div className="mt-3 flex flex-wrap items-center gap-3">
          <button
            onClick={next}
            className="font-sans text-[13px] font-medium text-maroon hover:underline underline-offset-2"
          >
            {graded ? "Another one →" : "Skip this one →"}
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
