"use client";

import { useState } from "react";

// The nested number systems as nested regions, embedded via a fenced
// ```numbersets block (see Reader's `pre` override). The chain
// N ⊂ Z ⊂ Q ⊂ R ⊂ C is stated in one line of prose and forgotten in one more;
// seeing it as containment, with real numbers sitting in the ring they belong
// to, is what makes it stick. Tap any number to light up every system that
// contains it — which is exactly the question the drill below then asks over
// and over.
//
// Geometry is baked literals (concentric ellipses about (220,155), each chip
// checked to sit inside its own ring and outside the next one in), so server
// and client markup are byte-identical and the diagram needs no layout pass.

type Chip = {
  label: string;
  x: number;
  y: number;
  // Which rings contain it, outermost listed by key.
  sets: string[];
  note: string;
};

const RINGS: { key: string; label: string; rx: number; ry: number; ly: number }[] = [
  { key: "C", label: "ℂ  complex", rx: 212, ry: 142, ly: 26 },
  { key: "R", label: "ℝ  real", rx: 182, ry: 118, ly: 50 },
  { key: "Q", label: "ℚ  rational", rx: 140, ry: 88, ly: 80 },
  { key: "Z", label: "ℤ  integer", rx: 100, ry: 60, ly: 108 },
  { key: "N", label: "ℕ  natural", rx: 60, ry: 33, ly: 135 },
];

const CHIPS: Chip[] = [
  // innermost: counting numbers
  { label: "1", x: 200, y: 165, sets: ["N", "Z", "Q", "R", "C"], note: "The first counting number, so it lies in every system." },
  { label: "7", x: 240, y: 165, sets: ["N", "Z", "Q", "R", "C"], note: "A counting number — natural, integer, rational, real, complex." },
  { label: "√9", x: 220, y: 183, sets: ["N", "Z", "Q", "R", "C"], note: "√9 = 3. A radical sign does not make a number irrational; only a non-perfect square does." },
  // integers that are not natural
  { label: "0", x: 150, y: 155, sets: ["Z", "Q", "R", "C"], note: "Zero is an integer. This lecture starts ℕ at 1, so zero sits in the next ring out." },
  { label: "−4", x: 290, y: 155, sets: ["Z", "Q", "R", "C"], note: "Negative, so not a counting number, but an integer and therefore rational." },
  { label: "−√4", x: 220, y: 208, sets: ["Z", "Q", "R", "C"], note: "−√4 = −2. Simplify before classifying." },
  // rationals that are not integers
  { label: "3/4", x: 100, y: 155, sets: ["Q", "R", "C"], note: "A ratio of integers that is not whole — the ring ℚ was built for exactly this." },
  { label: "22/7", x: 340, y: 155, sets: ["Q", "R", "C"], note: "A rational approximation to π, not π. It is an ordinary fraction; its decimal repeats with period 6." },
  { label: "0.125", x: 150, y: 205, sets: ["Q", "R", "C"], note: "A terminating decimal is always rational: 0.125 = 1/8." },
  { label: "0.333…", x: 292, y: 205, sets: ["Q", "R", "C"], note: "A repeating decimal is rational too: 0.333… = 1/3. Infinitely many digits is not irrationality." },
  // irrationals: real but not rational
  { label: "√2", x: 55, y: 155, sets: ["R", "C"], note: "Irrational — no fraction squares to 2 — but algebraic, being a root of x² − 2." },
  { label: "π", x: 385, y: 155, sets: ["R", "C"], note: "Irrational and transcendental: the root of no polynomial with integer coefficients." },
  { label: "φ", x: 110, y: 95, sets: ["R", "C"], note: "The golden ratio (1+√5)/2. Irrational, but algebraic: it satisfies x² − x − 1 = 0." },
  { label: "log₂3", x: 330, y: 95, sets: ["R", "C"], note: "Irrational: log₂3 = p/q would give 2^p = 3^q, an even number equal to an odd one." },
  { label: "e", x: 220, y: 245, sets: ["R", "C"], note: "Irrational and transcendental, proved by Hermite in 1873." },
  // complex but not real
  { label: "i", x: 95, y: 50, sets: ["C"], note: "The square root of −1. No real number squares to a negative, which is the failure that forces ℂ." },
  { label: "2+3i", x: 345, y: 50, sets: ["C"], note: "A complex number with a non-zero imaginary part, so it lies outside ℝ." },
];

export function NumberSets() {
  const [active, setActive] = useState<number | null>(null);
  const chip = active === null ? null : CHIPS[active];
  const lit = new Set(chip?.sets ?? []);

  return (
    <figure className="my-7 not-prose rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg
        viewBox="0 0 440 310"
        className="w-full h-auto"
        role="img"
        aria-label="Nested number systems: the natural numbers sit inside the integers, inside the rationals, inside the reals, inside the complex numbers, with the irrationals occupying the part of the reals outside the rationals."
      >
        {RINGS.map((r) => {
          const on = lit.has(r.key);
          return (
            <g key={r.key}>
              <ellipse
                cx={220}
                cy={155}
                rx={r.rx}
                ry={r.ry}
                className={on ? "text-maroon" : "text-line"}
                fill="currentColor"
                fillOpacity={on ? 0.07 : 0.03}
                stroke="currentColor"
                strokeWidth={on ? 1.6 : 0.9}
              />
              <text
                x={220}
                y={r.ly}
                textAnchor="middle"
                className={on ? "text-maroon" : "text-muted"}
                fill="currentColor"
                fontSize={9}
                fontFamily="ui-sans-serif, system-ui, sans-serif"
                letterSpacing={0.4}
              >
                {r.label}
              </text>
            </g>
          );
        })}

        {/* The irrationals are not a ring of their own — they are what is left
            of ℝ once ℚ is removed, which is why they are labelled and not
            drawn. */}
        <text
          x={95}
          y={215}
          textAnchor="middle"
          className="text-faint"
          fill="currentColor"
          fontSize={8}
          fontStyle="italic"
          fontFamily="ui-sans-serif, system-ui, sans-serif"
        >
          irrationals = ℝ ∖ ℚ
        </text>

        {CHIPS.map((c, i) => {
          const on = i === active;
          return (
            <g
              key={c.label}
              onClick={() => setActive(on ? null : i)}
              style={{ cursor: "pointer" }}
            >
              <rect
                x={c.x - c.label.length * 3.1 - 5}
                y={c.y - 9}
                width={c.label.length * 6.2 + 10}
                height={16}
                rx={8}
                className={on ? "text-maroon" : "text-line"}
                fill="currentColor"
                fillOpacity={on ? 0.9 : 0.12}
                stroke="currentColor"
                strokeWidth={0.7}
              />
              <text
                x={c.x}
                y={c.y + 2}
                textAnchor="middle"
                className={on ? "text-page" : "text-ink"}
                fill="currentColor"
                fontSize={9.5}
                fontFamily="ui-monospace, SFMono-Regular, Menlo, monospace"
              >
                {c.label}
              </text>
            </g>
          );
        })}
      </svg>

      <figcaption className="mt-3 font-sans text-[13px] leading-relaxed text-muted">
        {chip ? (
          <>
            <span className="font-semibold text-ink">{chip.label}</span> lies in{" "}
            <span className="font-semibold text-ink">
              {chip.sets
                .slice()
                .reverse()
                .map((k) => RINGS.find((r) => r.key === k)!.label.split("  ")[0])
                .join(" ⊂ ")}
            </span>
            . {chip.note}
          </>
        ) : (
          <>
            Each system contains the one inside it: every counting number is an integer, every
            integer is a rational, every rational is a real. Tap any number to light up the
            systems that contain it. The irrationals are the shaded region of ℝ outside ℚ — and
            because they are a leftover rather than a ring in their own right, they are closed
            under nothing: √2 · √2 = 2 lands back in ℚ.
          </>
        )}
      </figcaption>
    </figure>
  );
}
