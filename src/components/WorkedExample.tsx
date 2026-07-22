"use client";

import { useMemo, useState } from "react";
import katex from "katex";
import { t } from "@/lib/i18n";

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

// Scientific notation as KaTeX, e.g. 7.7e-5 -> "7.7\times10^{-5}".
function sci(x: number, d = 1): string {
  if (x === 0) return "0";
  const e = Math.floor(Math.log10(Math.abs(x)));
  const m = x / Math.pow(10, e);
  return `${m.toFixed(d)}\\times10^{${e}}`;
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

  // ── Machine design — stress, shafts, and fasteners ────────────────────────

  "factor-of-safety": (rng) => {
    const Sy = sample(rng, [250, 300, 350, 400, 450, 500, 620], 1)[0];
    const sigma = sample(rng, [80, 100, 120, 140, 160, 180, 200], 1)[0];
    const n = Sy / sigma;
    return {
      title: "Factor of safety",
      question: `A steel component with yield strength Sy = ${Sy} MPa carries a working stress of σ = ${sigma} MPa. What is its factor of safety against yielding?`,
      steps: [`n = \\frac{S_y}{\\sigma} = \\frac{${Sy}}{${sigma}} = ${n.toFixed(2)}`],
      note: `A factor of safety of ${n.toFixed(2)} means the part carries about ${n.toFixed(2)}× the stress needed to begin yielding. Static machine design typically uses n ≈ 1.5–3 with known loads and materials, and more when either is uncertain; n < 1 would already have failed.`,
    };
  },

  "axial-stress": (rng) => {
    const F = sample(rng, [5, 10, 15, 20, 25, 30, 40, 50], 1)[0]; // kN
    const d = sample(rng, [8, 10, 12, 16, 20, 25], 1)[0]; // mm
    const A = (Math.PI * d * d) / 4; // mm^2
    const sigma = (F * 1000) / A; // MPa
    return {
      title: "Axial (normal) stress",
      question: `A round rod of diameter d = ${d} mm carries an axial tensile load F = ${F} kN. Find the normal stress in the rod.`,
      steps: [
        `A = \\frac{\\pi d^2}{4} = \\frac{\\pi (${d})^2}{4} = ${A.toFixed(1)}\\ \\text{mm}^2`,
        `\\sigma = \\frac{F}{A} = \\frac{${F * 1000}\\ \\text{N}}{${A.toFixed(1)}\\ \\text{mm}^2} = ${sigma.toFixed(1)}\\ \\text{MPa}`,
      ],
      note: `Stress is force per unit area — the same load through a thinner rod means higher stress. Because 1 N/mm² equals 1 MPa, working in newtons and millimetres gives megapascals directly.`,
    };
  },

  "shaft-torsion-stress": (rng) => {
    const T = sample(rng, [50, 80, 100, 150, 200, 300, 400], 1)[0]; // N·m
    const d = sample(rng, [20, 25, 30, 35, 40, 50], 1)[0]; // mm
    const tau = (16 * (T * 1000)) / (Math.PI * d ** 3); // MPa
    return {
      title: "Torsional shear stress in a shaft",
      question: `A solid circular shaft of diameter d = ${d} mm transmits a torque T = ${T} N·m. Find the maximum torsional shear stress at the surface.`,
      steps: [
        `\\tau_{\\max} = \\frac{16 T}{\\pi d^3} = \\frac{16\\,(${T * 1000}\\ \\text{N·mm})}{\\pi (${d})^3} = ${tau.toFixed(1)}\\ \\text{MPa}`,
      ],
      note: `The shear stress is greatest at the outer surface and zero at the centre. Note the strong dependence on size: τ scales as 1/d³, so a modest increase in diameter sharply reduces the stress.`,
    };
  },

  "shaft-diameter-design": (rng) => {
    const T = sample(rng, [50, 100, 150, 200, 250, 300], 1)[0]; // N·m
    const tauA = sample(rng, [40, 50, 60], 1)[0]; // MPa allowable
    const d = Math.cbrt((16 * (T * 1000)) / (Math.PI * tauA)); // mm
    const std = Math.ceil(d / 5) * 5;
    return {
      title: "Designing a shaft diameter",
      question: `A solid shaft must transmit T = ${T} N·m without its shear stress exceeding the allowable τ_allow = ${tauA} MPa. Find the minimum required diameter.`,
      steps: [
        `d = \\left(\\frac{16 T}{\\pi\\,\\tau_{\\text{allow}}}\\right)^{1/3} = \\left(\\frac{16\\,(${T * 1000})}{\\pi (${tauA})}\\right)^{1/3} = ${d.toFixed(1)}\\ \\text{mm}`,
        `\\Rightarrow\\ \\text{use a standard } ${std}\\ \\text{mm shaft}`,
      ],
      note: `This just inverts the torsion formula to solve for d. In practice you round UP to the next standard size (here ${std} mm), which also builds in a little extra margin.`,
    };
  },

  "bending-stress-shaft": (rng) => {
    const M = sample(rng, [50, 100, 150, 200, 250, 300, 400], 1)[0]; // N·m
    const d = sample(rng, [20, 25, 30, 40, 50], 1)[0]; // mm
    const sigma = (32 * (M * 1000)) / (Math.PI * d ** 3); // MPa
    return {
      title: "Bending stress in a round shaft",
      question: `A solid round shaft of diameter d = ${d} mm carries a bending moment M = ${M} N·m. Find the maximum bending stress.`,
      steps: [
        `\\sigma = \\frac{32 M}{\\pi d^3} = \\frac{32\\,(${M * 1000}\\ \\text{N·mm})}{\\pi (${d})^3} = ${sigma.toFixed(1)}\\ \\text{MPa}`,
      ],
      note: `For a solid circular cross-section, σ = 32M/(πd³). Like torsional stress, bending stress falls off as 1/d³, and its maximum is at the surface farthest from the neutral axis.`,
    };
  },

  "bolt-tightening-torque": (rng) => {
    const F = sample(rng, [10, 15, 20, 25, 30], 1)[0]; // kN preload
    const d = sample(rng, [8, 10, 12, 16, 20], 1)[0]; // mm
    const K = 0.2;
    const T = K * (F * 1000) * (d / 1000); // N·m
    return {
      title: "Bolt tightening torque",
      question: `A bolt of nominal diameter d = ${d} mm must reach a preload of F = ${F} kN. Using a nut factor K = ${K}, estimate the tightening torque.`,
      steps: [
        `T = K F d = (${K})(${F * 1000}\\ \\text{N})(${(d / 1000).toFixed(3)}\\ \\text{m}) = ${T.toFixed(1)}\\ \\text{N·m}`,
      ],
      note: `The nut factor K (≈ 0.2 for dry steel) bundles thread and head friction — most of the torque fights friction, not bolt stretch. That is why torque is only a rough proxy for preload, and why critical joints use angle-of-turn or direct-tension methods instead.`,
    };
  },

  // ── Rockets — the Tsiolkovsky equation and what falls out of it ────────────

  "rocket-mass-ratio": (rng) => {
    const g0 = 9.80665;
    const dv = sample(rng, [3.12, 3.9, 5.0, 6.0, 9.4, 12.0], 1)[0]; // km/s
    const isp = sample(rng, [300, 320, 350, 380, 420, 450], 1)[0]; // s
    const ve = isp * g0; // m/s
    const x = (dv * 1000) / ve;
    const R = Math.exp(x);
    const zeta = 1 - 1 / R;
    return {
      title: "Mass ratio and propellant fraction",
      question: `A stage must deliver Δv = ${dv} km/s using an engine of specific impulse I_sp = ${isp} s. Find its required mass ratio R and the fraction ζ of liftoff mass that is propellant.`,
      steps: [
        `v_e = I_{sp}\\,g_0 = ${isp}\\times 9.80665 = ${ve.toFixed(0)}\\ \\text{m/s}`,
        `x = \\frac{\\Delta v}{v_e} = \\frac{${(dv * 1000).toFixed(0)}}{${ve.toFixed(0)}} = ${x.toFixed(3)}`,
        `R = e^{x} = e^{${x.toFixed(3)}} = ${R.toFixed(2)}`,
        `\\zeta = 1 - \\frac{1}{R} = ${(zeta * 100).toFixed(1)}\\%`,
      ],
      note: `Every exhaust velocity worth of Δv costs a factor of e in mass ratio. At x = ${x.toFixed(2)}, the stage is ${(zeta * 100).toFixed(1)}% propellant, leaving only ${(100 - zeta * 100).toFixed(1)}% for tanks, engines, structure, and payload combined.`,
    };
  },

  "rocket-payload-fraction": (rng) => {
    const g0 = 9.80665;
    const dv = sample(rng, [7.0, 8.0, 9.4], 1)[0]; // km/s
    const isp = sample(rng, [320, 350, 380, 420, 450], 1)[0]; // s
    const eps = sample(rng, [0.05, 0.06, 0.08, 0.1, 0.12], 1)[0];
    const ve = isp * g0;
    const R = Math.exp((dv * 1000) / ve);
    const lam = (1 / R - eps) / (1 - eps);
    return {
      title: "Payload fraction of a single stage",
      question: `A single stage has structural coefficient ε = ${eps} and specific impulse I_sp = ${isp} s. What payload fraction λ can it deliver for a Δv of ${dv} km/s (to low Earth orbit)?`,
      steps: [
        `R = e^{\\Delta v / v_e} = e^{${(dv * 1000).toFixed(0)}/${ve.toFixed(0)}} = ${R.toFixed(2)}`,
        `\\lambda = \\frac{1/R - \\varepsilon}{1 - \\varepsilon} = \\frac{${(1 / R).toFixed(4)} - ${eps}}{1 - ${eps}} = ${(lam * 100).toFixed(2)}\\%`,
      ],
      note:
        lam < 0
          ? `Negative — the algebra forbids this vehicle. Its structure alone outweighs everything that reaches orbit, so there is nothing left for payload: it cannot lift itself, let alone cargo. This is exactly why single-stage-to-orbit is so nearly impossible.`
          : `The payload lives in the thin sliver left after propellant and structure. Only ${(lam * 100).toFixed(2)}% of liftoff mass arrives as payload here, and a small rise in ε would erase even that. Margin, not average performance, is what kills single-stage designs.`,
    };
  },

  "rocket-propulsive-efficiency": (rng) => {
    const ve = sample(rng, [2.8, 3.0, 3.4, 4.4], 1)[0]; // km/s
    const v = sample(rng, [1, 2, 3, 4, 6, 8], 1)[0]; // km/s
    const u = v / ve;
    const eta = (2 * u) / (1 + u * u);
    return {
      title: "Propulsive efficiency",
      question: `A vehicle with exhaust velocity v_e = ${ve} km/s is moving at v = ${v} km/s. What fraction of the engine's jet power actually goes into the vehicle — its propulsive efficiency?`,
      steps: [
        `u = \\frac{v}{v_e} = \\frac{${v}}{${ve}} = ${u.toFixed(3)}`,
        `\\eta_p = \\frac{2u}{1 + u^2} = \\frac{${(2 * u).toFixed(3)}}{${(1 + u * u).toFixed(3)}} = ${(eta * 100).toFixed(1)}\\%`,
      ],
      note: `Propulsive efficiency peaks at 100% when v = v_e — there the exhaust is left exactly at rest in the ground frame, keeping none of the energy. Here u = ${u.toFixed(2)} gives ${(eta * 100).toFixed(1)}%. This is why launch (where v starts at zero) is so wasteful, and why an ion drive — huge v_e, modest v — throws most of its jet power away and is right not to care.`,
    };
  },

  // ── Thermochemistry & the nozzle — where v_e comes from and why it is capped ─

  "rocket-exhaust-velocity": (rng) => {
    const Ru = 8.314;
    const props = [
      { n: "hydrolox (fuel-rich)", Tc: 3400, M: 11, g: 1.22 },
      { n: "methalox", Tc: 3550, M: 19, g: 1.2 },
      { n: "kerolox", Tc: 3670, M: 23, g: 1.22 },
      { n: "hydrogen/fluorine", Tc: 4000, M: 20, g: 1.23 },
    ];
    const p = props[sample(rng, [0, 1, 2, 3], 1)[0]];
    const brk = sample(rng, [0.75, 0.8, 0.85], 1)[0];
    const A = (2 * p.g) / (p.g - 1);
    const core = (Ru * p.Tc) / (p.M / 1000); // m^2/s^2
    const ve = Math.sqrt(A * core * brk);
    return {
      title: "Ideal exhaust velocity",
      question: `A ${p.n} engine has chamber temperature T_c = ${p.Tc} K, mean exhaust molecular weight M = ${p.M} g/mol, and γ = ${p.g}, expanding to a bracket value of ${brk}. Find its ideal exhaust velocity.`,
      steps: [
        `\\frac{2\\gamma}{\\gamma-1} = \\frac{2(${p.g})}{${p.g}-1} = ${A.toFixed(2)}`,
        `\\frac{R_u T_c}{M} = \\frac{8.314\\times ${p.Tc}}{${(p.M / 1000).toFixed(3)}} = ${(core / 1e6).toFixed(3)}\\times 10^{6}\\ \\text{m}^2/\\text{s}^2`,
        `v_e = \\sqrt{${A.toFixed(2)}\\times ${(core / 1e6).toFixed(3)}\\times 10^{6}\\times ${brk}} = ${ve.toFixed(0)}\\ \\text{m/s}`,
      ],
      note: `Real engines reach roughly 90–97% of this ideal (frozen-flow and boundary-layer losses). The whole result rides on T_c/M — a hot flame helps, but a light exhaust molecule helps far more, which is why the number is stuck near 4.5 km/s.`,
    };
  },

  "rocket-propellant-comparison": (rng) => {
    const props = [
      { n: "hydrolox", Tc: 3400, M: 11 },
      { n: "methalox", Tc: 3550, M: 19 },
      { n: "kerolox", Tc: 3670, M: 23 },
      { n: "hypergolic", Tc: 3400, M: 25 },
      { n: "solid (APCP)", Tc: 3000, M: 28 },
    ];
    const [ia, ib] = sample(rng, [0, 1, 2, 3, 4], 2);
    const a = props[ia];
    const b = props[ib];
    const ratio = Math.sqrt(a.Tc / a.M / (b.Tc / b.M));
    const winner = ratio >= 1 ? a : b;
    const pct = (ratio >= 1 ? ratio - 1 : 1 / ratio - 1) * 100;
    return {
      title: "Which propellant has the higher exhaust velocity?",
      question: `Propellant A (${a.n}) burns at T_c = ${a.Tc} K with exhaust M = ${a.M} g/mol. Propellant B (${b.n}) burns at T_c = ${b.Tc} K with M = ${b.M} g/mol. Using v_e ∝ √(T_c/M), which wins, and by what factor?`,
      steps: [
        `\\frac{v_{e,A}}{v_{e,B}} = \\sqrt{\\frac{T_A/M_A}{T_B/M_B}} = \\sqrt{\\frac{${a.Tc}/${a.M}}{${b.Tc}/${b.M}}} = ${ratio.toFixed(3)}`,
      ],
      note: `${winner.n} wins, by about ${pct.toFixed(0)}%. Flame temperature barely varies across chemical propellants (all pinned near 3,400 K by dissociation and melting), so the ranking is set almost entirely by molecular weight — light exhaust is destiny.`,
    };
  },

  "nozzle-expansion-regime": (rng) => {
    const pe = sample(rng, [0.1, 0.15, 0.2, 0.3, 0.5, 0.7], 1)[0]; // bar
    const pa = sample(rng, [0, 0.3, 1.0], 1)[0]; // bar
    let regime: string;
    let safe: boolean;
    let detail: string;
    if (pa === 0) {
      regime = "under-expanded";
      safe = true;
      detail =
        "In vacuum there is no ambient pressure, so p_e always exceeds p_a: the plume simply keeps expanding outside the bell. Separation is impossible — a vacuum nozzle can be made as large as mass allows.";
    } else if (Math.abs(pe - pa) < 1e-9) {
      regime = "matched";
      safe = true;
      detail = "Exit pressure equals ambient — perfectly matched at this altitude, and all the extractable energy is in the jet.";
    } else if (pe > pa) {
      regime = "under-expanded";
      safe = true;
      detail = "Exit pressure exceeds ambient: a modest performance loss as the gas finishes expanding outside the bell, but safe — nothing separates.";
    } else {
      const sep = pe < 0.35 * pa;
      regime = "over-expanded";
      safe = !sep;
      detail = sep
        ? "Over-expanded past the Summerfield threshold: the flow separates from the wall, asymmetrically and unsteadily, driving oscillating side loads that can crack the nozzle or tear it off the engine."
        : "Over-expanded but still above the Summerfield threshold: the flow stays attached and safe, at a small performance cost.";
    }
    return {
      title: "Nozzle expansion regime and flow separation",
      question: `A nozzle exhausts at p_e = ${pe} bar into ambient pressure p_a = ${pa} bar${pa === 0 ? " (vacuum)" : ""}. Classify the expansion and determine whether the flow separates.`,
      steps: [
        `p_e = ${pe}\\ \\text{bar}, \\quad p_a = ${pa}\\ \\text{bar} \\;\\Rightarrow\\; \\text{${regime}}`,
        pa === 0
          ? `\\text{vacuum: no ambient pressure, so separation cannot occur}`
          : `\\text{Summerfield: separates if } p_e < 0.35\\,p_a = ${(0.35 * pa).toFixed(3)}\\ \\text{bar} \\;\\Rightarrow\\; \\text{${safe ? "attached (safe)" : "separates — side loads"}}`,
      ],
      note: detail,
    };
  },

  // ── Staging — the loophole, and its diminishing returns ───────────────────

  "staging-payload-fraction": (rng) => {
    const g0 = 9.80665;
    const isp = sample(rng, [300, 320, 350, 380, 420], 1)[0];
    const eps = sample(rng, [0.06, 0.08, 0.09, 0.1, 0.12], 1)[0];
    const dv = sample(rng, [9.0, 9.4, 10.0], 1)[0]; // km/s total
    const n = sample(rng, [1, 2, 3, 4], 1)[0];
    const ve = isp * g0;
    const dvi = (dv * 1000) / n;
    const Ri = Math.exp(dvi / ve);
    const li = (1 / Ri - eps) / (1 - eps);
    const impossible = li < 0;
    const lt = impossible ? li : Math.pow(li, n);
    return {
      title: "Staged payload fraction",
      question: `A rocket with I_sp = ${isp} s and structural coefficient ε = ${eps} per stage must deliver Δv = ${dv} km/s, split evenly across ${n} stage${n === 1 ? "" : "s"}. What payload fraction reaches orbit?`,
      steps: [
        `v_e = ${isp}\\times 9.80665 = ${ve.toFixed(0)}\\ \\text{m/s}, \\quad \\Delta v_{\\text{stage}} = ${dv}/${n} = ${(dvi / 1000).toFixed(2)}\\ \\text{km/s}`,
        `R_i = e^{\\Delta v_{\\text{stage}}/v_e} = ${Ri.toFixed(3)}, \\quad \\lambda_i = \\frac{1/R_i - \\varepsilon}{1-\\varepsilon} = ${(li * 100).toFixed(2)}\\%`,
        impossible
          ? `\\lambda_i < 0 \\Rightarrow \\text{the stage cannot lift its own empty tanks}`
          : `\\lambda_{\\text{total}} = \\lambda_i^{${n}} = ${(lt * 100).toFixed(2)}\\%`,
      ],
      note: impossible
        ? `Negative per-stage payload: ${n} stage${n === 1 ? "" : "s"} is not enough — this design is impossible, dragging empty tanks through Δv they don't need. Split the mission across more stages and the payloads multiply into a positive number.`
        : `The per-stage payload fractions MULTIPLY, because each stage's payload is everything above it. Going from one stage to ${n} turned an often-impossible mission into ${(lt * 100).toFixed(2)}% to orbit — with the same engine and materials, just by dropping dead tanks.`,
    };
  },

  "staging-min-stages": (rng) => {
    const g0 = 9.80665;
    const isp = sample(rng, [300, 320, 350, 380], 1)[0];
    const eps = sample(rng, [0.06, 0.08, 0.09, 0.1], 1)[0];
    const dv = sample(rng, [9.0, 9.4, 12.0, 13.0], 1)[0]; // km/s
    const ve = isp * g0;
    const dvmax = ve * Math.log(1 / eps); // one stage, zero payload
    let n = 1;
    while ((dv * 1000) / n >= dvmax) n++;
    return {
      title: "Minimum stages to reach the target",
      question: `An engine gives I_sp = ${isp} s, every stage has ε = ${eps}, and the mission needs Δv = ${dv} km/s. What is the most Δv a single stage can ever deliver, and the fewest stages needed for a positive payload?`,
      steps: [
        `\\Delta v_{\\max} = v_e\\ln(1/\\varepsilon) = ${ve.toFixed(0)}\\ln(1/${eps}) = ${dvmax.toFixed(0)}\\ \\text{m/s}`,
        `\\text{one stage carrying zero payload tops out here} < ${(dv * 1000).toFixed(0)}\\ \\text{m/s (the mission)}`,
        `\\text{smallest } n \\text{ with } \\tfrac{${(dv * 1000).toFixed(0)}}{n} < \\Delta v_{\\max}: \\quad n_{\\min} = ${n}`,
      ],
      note: `The impossibility theorem caps one stage at Δv_max = v_e ln(1/ε) — carrying nothing. Staging chains that reach as many times as needed, so any mission beyond Δv_max forces at least ${n} stage${n === 1 ? "" : "s"}. This is the quantitative link between the ceiling and the loophole.`,
    };
  },

  "staging-marginal-gain": (rng) => {
    const g0 = 9.80665;
    const isp = sample(rng, [320, 350, 380], 1)[0];
    const eps = sample(rng, [0.08, 0.09, 0.1], 1)[0];
    const dv = sample(rng, [9.0, 9.4], 1)[0]; // km/s
    const n = sample(rng, [2, 3, 4], 1)[0];
    const ve = isp * g0;
    const lam = (k: number) => {
      const Ri = Math.exp((dv * 1000) / k / ve);
      const li = (1 / Ri - eps) / (1 - eps);
      return Math.pow(li, k);
    };
    const a = lam(n);
    const b = lam(n + 1);
    const gain = (b - a) * 100;
    return {
      title: "The marginal value of one more stage",
      question: `With I_sp = ${isp} s, ε = ${eps}, and Δv = ${dv} km/s split evenly, compare the payload fraction at ${n} stages versus ${n + 1}. How much does the extra stage buy?`,
      steps: [
        `\\lambda_{${n}} = ${(a * 100).toFixed(2)}\\%, \\quad \\lambda_{${n + 1}} = ${(b * 100).toFixed(2)}\\%`,
        `\\text{gain} = \\lambda_{${n + 1}} - \\lambda_{${n}} = ${gain.toFixed(2)}\\text{ points}`,
      ],
      note: `Only +${gain.toFixed(2)} points of payload for a whole extra stage — another engine, another set of avionics, and another separation event that can kill the mission. The gains collapse after two stages while the costs stay flat, which is why real rockets stop at two or three.`,
    };
  },

  // ── Ascent — the loss budget of getting off a planet ──────────────────────

  "orbital-velocity": (rng) => {
    const mu = 3.986e14;
    const Re = 6371; // km
    const alt = sample(rng, [200, 400, 800, 1200, 2000, 20200, 35786], 1)[0];
    const r = (Re + alt) * 1000; // m
    const v = Math.sqrt(mu / r);
    return {
      title: "Circular orbital velocity",
      question: `How fast must a satellite move to hold a circular orbit ${alt} km above Earth's surface? (μ = 3.986×10¹⁴ m³/s², R⊕ = 6,371 km.)`,
      steps: [
        `r = R_\\oplus + h = 6371 + ${alt} = ${Re + alt}\\ \\text{km}`,
        `v = \\sqrt{\\frac{\\mu}{r}} = \\sqrt{\\frac{3.986\\times10^{14}}{${(r / 1e6).toFixed(3)}\\times10^{6}}} = ${v.toFixed(0)}\\ \\text{m/s}`,
      ],
      note: `Higher orbits are SLOWER — v ∝ 1/√r — because gravity is weaker up high, so less centripetal force is needed to hold the circle. The ISS at 400 km does 7,673 m/s; a geostationary satellite at 35,786 km only about 3,070.`,
    };
  },

  "gravity-loss": (rng) => {
    const g0 = 9.80665;
    const sg = sample(rng, [0.3, 0.35, 0.4, 0.5, 1.0], 1)[0];
    const t = sample(rng, [300, 420, 480, 540], 1)[0];
    const dv = g0 * sg * t;
    return {
      title: "Gravity loss during ascent",
      question: `A rocket burns for ${t} s at an average flight-path sine of sin γ = ${sg} (a value of 1 means straight up the whole way). How much Δv does it lose to gravity?`,
      steps: [
        `\\Delta v_{\\text{grav}} = \\int g\\sin\\gamma\\,dt \\approx g_0\\,\\overline{\\sin\\gamma}\\,t = 9.80665\\times ${sg}\\times ${t} = ${dv.toFixed(0)}\\ \\text{m/s}`,
      ],
      note:
        sg >= 1
          ? `Straight up the whole way bleeds ${(dv / 1000).toFixed(2)} km/s to gravity — enough to make orbit nearly impossible. This is why rockets pitch over as fast as they safely can.`
          : `At sin γ = ${sg} the loss is ${(dv / 1000).toFixed(2)} km/s, versus ${((g0 * 1 * t) / 1000).toFixed(2)} km/s if it had gone straight up for the same time. Gravity loss is the price of time spent climbing slowly, so the whole game is to get horizontal fast.`,
    };
  },

  "launch-rebate": (rng) => {
    const sites = [
      { n: "Kourou", lat: 5 },
      { n: "Cape Canaveral", lat: 28.5 },
      { n: "Baikonur", lat: 46 },
      { n: "a mid-latitude site", lat: 51 },
      { n: "a polar site", lat: 90 },
    ];
    const s = sites[sample(rng, [0, 1, 2, 3, 4], 1)[0]];
    const dir = sample(rng, [0, 1], 1)[0] === 0 ? "east" : "west";
    const rebate = 465 * Math.cos((s.lat * Math.PI) / 180);
    return {
      title: "Earth-rotation rebate",
      question: `A rocket launches ${dir}ward from ${s.n} (latitude ${s.lat}°). How much velocity does Earth's rotation give it — or cost it? (Equatorial surface speed 465 m/s.)`,
      steps: [
        `v_{\\text{rot}} = 465\\cos(${s.lat}°) = ${rebate.toFixed(0)}\\ \\text{m/s}`,
        dir === "east"
          ? `\\text{eastward} \\Rightarrow \\text{a free head start of } +${rebate.toFixed(0)}\\ \\text{m/s}`
          : `\\text{westward} \\Rightarrow \\text{forgo it AND cancel it}: -2\\times${rebate.toFixed(0)} = -${(2 * rebate).toFixed(0)}\\ \\text{m/s}`,
      ],
      note:
        dir === "east"
          ? `Launching east near the equator is nearly free Δv — which is why spaceports cluster on east-facing coastlines close to the equator (Kourou, at 5°, collects almost the full 465).`
          : `Launching west pays the rebate twice, as a penalty. Only Israel does it — over the Mediterranean, to avoid overflying hostile neighbours — at the cost of roughly a fifth of its payload, spent on geopolitics.`,
    };
  },

  // ── Engine cycles — the machine that squeezes the fixed lemon ──────────────

  "pump-power": (rng) => {
    const mdot = sample(rng, [150, 200, 250, 300, 500], 1)[0];
    const pc = sample(rng, [250, 300, 350], 1)[0]; // chamber / injection, bar
    const pt = sample(rng, [3, 4, 5], 1)[0]; // tank, bar
    const rho = sample(rng, [810, 1000, 1140], 1)[0]; // RP-1, water-ish, LOX
    const dp = (pc - pt) * 1e5; // Pa
    const Phyd = (mdot * dp) / rho; // W
    const eta = sample(rng, [55, 60, 65, 70], 1)[0] / 100;
    const Pturb = Phyd / eta;
    return {
      title: "Turbopump power balance",
      question: `A turbopump moves ${mdot} kg/s of propellant (density ${rho} kg/m³) from a ${pt}-bar tank up to a ${pc}-bar injection pressure. (a) What hydraulic power does that take? (b) If the turbopump is ${Math.round(eta * 100)}% efficient overall, how much power must the turbine extract from the hot preburner gas?`,
      steps: [
        `\\Delta p = (${pc} - ${pt})\\times10^5 = ${(dp / 1e7).toFixed(2)}\\times10^{7}\\ \\text{Pa}`,
        `P_{\\text{hyd}} = \\frac{\\dot m\\,\\Delta p}{\\rho} = \\frac{${mdot}\\times ${(dp / 1e7).toFixed(2)}\\times10^{7}}{${rho}} = ${(Phyd / 1e6).toFixed(2)}\\ \\text{MW}`,
        `P_{\\text{turb}} = \\frac{P_{\\text{hyd}}}{\\eta} = \\frac{${(Phyd / 1e6).toFixed(2)}}{${eta.toFixed(2)}} = ${(Pturb / 1e6).toFixed(2)}\\ \\text{MW}\\ (\\approx ${(Pturb / 745700).toFixed(0)}\\ \\text{hp})`,
      ],
      note: `That power comes from burning propellant in the preburner — the engine spends a small power-station's worth of energy just to feed itself. The RD-170's real turbopump runs at ~190 MW, more than a widebody airliner's takeoff power, in a package the size of a refrigerator — the highest power-density machine ever built.`,
    };
  },

  "gg-penalty": (rng) => {
    const fgg = sample(rng, [2, 3, 4, 5], 1)[0] / 100; // fraction dumped
    const ggIsp = sample(rng, [80, 100, 120], 1)[0]; // s, poorly expanded
    const main = sample(rng, [330, 350, 360], 1)[0]; // s
    const eff = (1 - fgg) * main + fgg * ggIsp;
    const pen = main - eff;
    const penPct = (pen / main) * 100;
    const payload = penPct * 4; // 1% Isp ~ 4% payload, two-stage
    return {
      title: "The gas-generator penalty",
      question: `A gas-generator engine burns ${Math.round(
        fgg * 100,
      )}% of its propellant in the gas generator, whose dumped exhaust delivers an effective specific impulse of only ${ggIsp} s; the main chamber gives ${main} s. (a) What is the vehicle's effective Isp? (b) How much is lost versus an ideal closed cycle that routes that exhaust into the chamber? (c) At 1% Isp ≈ 4% payload for a two-stage vehicle, what does it cost in payload?`,
      steps: [
        `I_{sp,\\text{eff}} = (1-${fgg})\\times ${main} + ${fgg}\\times ${ggIsp} = ${eff.toFixed(1)}\\ \\text{s}`,
        `\\Delta I_{sp} = ${main} - ${eff.toFixed(1)} = ${pen.toFixed(1)}\\ \\text{s} = ${penPct.toFixed(2)}\\%`,
        `\\text{payload cost} \\approx ${penPct.toFixed(2)}\\% \\times 4 = ${payload.toFixed(1)}\\%`,
      ],
      note: `Dumping a few percent of propellant overboard to spin the pump costs a few percent of Isp — and through the rocket equation's exponential, that is roughly ${payload.toFixed(0)}% of payload on every flight, forever. Clawing it back is exactly why staged combustion endures the oxygen-rich metallurgy nightmare.`,
    };
  },

  "expander-scaling": (rng) => {
    const k = sample(rng, [2, 3, 4, 5], 1)[0]; // linear scale factor
    const need = k ** 3;
    const avail = k ** 2;
    const frac = avail / need; // = 1/k
    return {
      title: "Why a big expander-cycle engine can't exist",
      question: `An expander cycle drives its turbopump only with heat the fuel picks up from the chamber wall. Scale a working expander engine up by a linear factor of ${k} (every dimension ×${k}). Required pump power grows with propellant flow (∝ volume, r³); available wall-heating power grows with surface area (r²). What fraction of the required power can the walls still supply?`,
      steps: [
        `\\text{required power} \\propto r^3 \\Rightarrow \\times ${k}^3 = ${need}`,
        `\\text{available heating} \\propto r^2 \\Rightarrow \\times ${k}^2 = ${avail}`,
        `\\frac{\\text{available}}{\\text{required}} = \\frac{${avail}}{${need}} = \\frac{1}{${k}} \\approx ${frac.toFixed(2)}`,
      ],
      note: `Scaling up ${k}× leaves the walls able to supply only 1/${k} of the power the pump now needs — surface-to-volume falls as 1/r. This square–cube squeeze confines the expander cycle to small upper-stage engines like the RL10; it can never power a booster.`,
    };
  },

  // ── Reusability — when the physics is locked, the leverage is economics ────

  "propellant-fraction": (rng) => {
    const tot = sample(rng, [400, 450, 500], 1)[0]; // tonnes of propellant
    const ratio = 2.6; // oxidizer:fuel by mass
    const fuel = tot / (1 + ratio); // t
    const ox = tot - fuel; // t
    const cost = ox * 1000 * 0.1 + fuel * 1000 * 2.0; // $ (LOX $0.10/kg, RP-1 $2/kg)
    const launch = sample(rng, [50, 60, 70], 1)[0] * 1e6; // $ total launch
    const frac = (cost / launch) * 100;
    return {
      title: "Propellant is nearly free",
      question: `A kerolox rocket burns ${tot} tonnes of propellant at a 2.6:1 oxidizer:fuel mass ratio. Liquid oxygen costs $0.10/kg and RP-1 kerosene $2.00/kg, and the whole launch costs $${launch / 1e6} million. What is the propellant bill, and what fraction of the launch is it?`,
      steps: [
        `\\text{fuel} = \\frac{${tot}}{1+2.6} = ${fuel.toFixed(1)}\\ \\text{t},\\quad \\text{oxidizer} = ${ox.toFixed(1)}\\ \\text{t}`,
        `\\text{cost} = ${ox.toFixed(1)}{\\times}10^3{\\times}0.10 + ${fuel.toFixed(1)}{\\times}10^3{\\times}2.00 \\approx \\$${(cost / 1e3).toFixed(0)}\\text{k}`,
        `\\frac{\\text{propellant}}{\\text{launch}} = \\frac{\\$${(cost / 1e3).toFixed(0)}\\text{k}}{\\$${(launch / 1e6).toFixed(0)}\\text{M}} = ${frac.toFixed(2)}\\%`,
      ],
      note: `Propellant is a fraction of a percent of the launch cost — liquid oxygen is cheaper than milk by volume. The machine you burn it in is the entire expense, which is exactly why recovering that machine (reusability) is worth a brutal payload penalty: you re-pay only the nearly-free propellant, not the vehicle.`,
    };
  },

  "reuse-breakeven": (rng) => {
    const B = sample(rng, [30, 40, 50], 1)[0]; // first-stage build, $M
    const R = sample(rng, [1, 2, 3], 1)[0]; // refurbishment, $M
    const S = sample(rng, [10, 15, 20], 1)[0]; // new second stage, $M
    const F = sample(rng, [8, 10, 12], 1)[0]; // fixed ops, $M
    const N = sample(rng, [2, 5, 10, 20], 1)[0]; // flights per booster
    const expend = B + S + 0.5 + F;
    const reused = B / N + R + S + 0.5 + F;
    const save = expend - reused;
    return {
      title: "The reusability break-even",
      question: `A first stage costs $${B}M to build; refurbishing it between flights costs $${R}M; a fresh expendable second stage is $${S}M; propellant is $0.5M; fixed operations are $${F}M per flight. Compare an expendable flight with a reused flight on the booster's ${N}th flight (amortize the build across ${N} flights).`,
      steps: [
        `\\text{expendable} = ${B} + ${S} + 0.5 + ${F} = \\$${expend.toFixed(1)}\\text{M}`,
        `\\text{reused }(N{=}${N}) = \\frac{${B}}{${N}} + ${R} + ${S} + 0.5 + ${F} = \\$${reused.toFixed(1)}\\text{M}`,
        `\\text{saving} = ${expend.toFixed(1)} - ${reused.toFixed(1)} = \\$${save.toFixed(1)}\\text{M per flight}`,
      ],
      note: `Amortizing the $${B}M booster across ${N} flights cuts its per-flight share from $${B}M to $${(B / N).toFixed(1)}M. The gains flatten fast — most of the benefit lands in the first several reuses — so the payoff needs a high flight rate, the lever the Space Shuttle could never pull.`,
    };
  },

  "reuse-dollar-per-kg": (rng) => {
    const expCost = sample(rng, [60, 65, 70], 1)[0]; // $M expendable total
    const expPay = sample(rng, [21, 22, 23], 1)[0]; // t to LEO expendable
    const tax = sample(rng, [30, 32, 35, 40], 1)[0] / 100; // payload penalty
    const reuPay = expPay * (1 - tax);
    const reuCost = sample(rng, [28, 30, 32], 1)[0]; // $M reused total
    const expPerKg = (expCost * 1e6) / (expPay * 1000);
    const reuPerKg = (reuCost * 1e6) / (reuPay * 1000);
    const ratio = expPerKg / reuPerKg;
    return {
      title: "Does reuse still win on $/kg?",
      question: `Expendable: $${expCost}M delivers ${expPay} t to LEO. Recovering the first stage costs ${Math.round(
        tax * 100,
      )}% of the payload but drops the total to $${reuCost}M. Work out the cost per kilogram each way — does reuse still win?`,
      steps: [
        `\\text{expendable} = \\frac{\\$${expCost}\\text{M}}{${expPay}\\ \\text{t}} = \\$${expPerKg.toFixed(0)}\\text{/kg}`,
        `\\text{reused payload} = ${expPay}{\\times}(1-${tax.toFixed(2)}) = ${reuPay.toFixed(1)}\\ \\text{t}`,
        `\\text{reused} = \\frac{\\$${reuCost}\\text{M}}{${reuPay.toFixed(1)}\\ \\text{t}} = \\$${reuPerKg.toFixed(0)}\\text{/kg}\\quad(${ratio.toFixed(2)}\\times\\text{ cheaper})`,
      ],
      note: `Reuse carries ${Math.round(
        tax * 100,
      )}% less payload yet still wins on $/kg, because the cost fell faster than the payload did. That is the whole trade: concede a third of the payload to the rocket equation, and cut the cost per kilogram anyway — the first move in the field that gives up the physics battle to win the economics war.`,
    };
  },

  // ── Two-body problem — the geometry of falling ─────────────────────────────

  "kepler-third-law": (rng) => {
    const mu = 3.986e14;
    const Re = 6371; // km
    const alt = sample(rng, [400, 800, 1200, 2000, 20200, 35786], 1)[0]; // km
    const a = (Re + alt) * 1000; // m (circular ⇒ a = r)
    const T = 2 * Math.PI * Math.sqrt(a ** 3 / mu); // s
    return {
      title: "Kepler's Third Law: the period of an orbit",
      question: `A satellite is in a circular orbit ${alt} km above Earth's surface. How long does one orbit take? (μ = 3.986×10¹⁴ m³/s², R⊕ = 6,371 km.)`,
      steps: [
        `a = R_\\oplus + h = 6371 + ${alt} = ${Re + alt}\\ \\text{km}`,
        `T = 2\\pi\\sqrt{\\frac{a^3}{\\mu}} = 2\\pi\\sqrt{\\frac{(${((Re + alt) / 1000).toFixed(3)}\\times10^{6})^3}{3.986\\times10^{14}}} = ${T.toFixed(0)}\\ \\text{s}`,
        `T = ${T.toFixed(0)}\\ \\text{s} = ${(T / 60).toFixed(1)}\\ \\text{min} = ${(T / 3600).toFixed(2)}\\ \\text{h}`,
      ],
      note: `Higher orbits are slower in BOTH speed and period — T grows as a^(3/2). The ISS at 400 km takes ~92 min; a GPS satellite at 20,200 km takes ~12 h; geostationary at 35,786 km takes exactly one day and so hangs motionless in the sky. This "higher is slower" fact is the whole mechanism behind slowing down to catch up.`,
    };
  },

  "vis-viva": (rng) => {
    const mu = 3.986e14;
    const Re = 6371; // km
    const hp = sample(rng, [200, 300, 400, 500], 1)[0]; // perigee altitude, km
    const ha = sample(rng, [1000, 3000, 5000, 20000, 35786], 1)[0]; // apogee altitude, km
    const rp = (Re + hp) * 1000;
    const ra = (Re + ha) * 1000;
    const a = (rp + ra) / 2;
    const vp = Math.sqrt(mu * (2 / rp - 1 / a));
    const va = Math.sqrt(mu * (2 / ra - 1 / a));
    return {
      title: "Vis-viva: speed at perigee and apogee",
      question: `An elliptical orbit has perigee altitude ${hp} km and apogee altitude ${ha} km. Find the speed at each end. (μ = 3.986×10¹⁴ m³/s², R⊕ = 6,371 km.)`,
      steps: [
        `r_p = ${Re + hp}\\ \\text{km},\\quad r_a = ${Re + ha}\\ \\text{km},\\quad a = \\frac{r_p+r_a}{2} = ${((rp + ra) / 2 / 1000).toFixed(0)}\\ \\text{km}`,
        `v_p = \\sqrt{\\mu\\left(\\frac{2}{r_p}-\\frac{1}{a}\\right)} = ${vp.toFixed(0)}\\ \\text{m/s}`,
        `v_a = \\sqrt{\\mu\\left(\\frac{2}{r_a}-\\frac{1}{a}\\right)} = ${va.toFixed(0)}\\ \\text{m/s}`,
      ],
      note: `The body races through perigee (${(vp / 1000).toFixed(2)} km/s) and crawls through apogee (${(va / 1000).toFixed(2)} km/s) — Kepler's Second Law, equal areas in equal times. Vis-viva gives the speed anywhere in any orbit from just two numbers: where you are (r) and the size of the orbit (a).`,
    };
  },

  "kepler-equation": (rng) => {
    const e = sample(rng, [10, 20, 30, 40], 1)[0] / 100; // eccentricity
    const Tmin = sample(rng, [90, 100, 120], 1)[0]; // period, minutes
    const tmin = sample(rng, [10, 15, 20, 25], 1)[0]; // time since perigee, minutes
    const M = (2 * Math.PI * tmin) / Tmin; // rad
    let E = M;
    const it: number[] = [];
    for (let i = 0; i < 3; i++) {
      const f = E - e * Math.sin(E) - M;
      const fp = 1 - e * Math.cos(E);
      E = E - f / fp;
      it.push(E);
    }
    return {
      title: "Kepler's equation: where is the satellite at time t?",
      question: `A satellite has period ${Tmin} min and eccentricity e = ${e}. At ${tmin} minutes past perigee, find the eccentric anomaly E by solving Kepler's equation M = E − e·sin E with Newton's method (start E₀ = M).`,
      steps: [
        `M = \\frac{2\\pi}{T}(t-t_0) = \\frac{2\\pi\\times ${tmin}}{${Tmin}} = ${M.toFixed(4)}\\ \\text{rad}`,
        `E_{n+1} = E_n - \\frac{E_n - ${e}\\sin E_n - M}{1 - ${e}\\cos E_n}`,
        `E_1 = ${it[0].toFixed(4)},\\quad E_2 = ${it[1].toFixed(4)},\\quad E_3 = ${it[2].toFixed(5)}\\ \\text{rad}`,
      ],
      note: `Kepler's equation is transcendental — E cannot be isolated by any formula (and that has been proven), so it must be solved numerically. Newton's method converges in three or four iterations, and every GPS receiver solves it this way billions of times a day. "Exactly solvable" is not the same as "has a closed-form formula."`,
    };
  },

  // ── Escaping chemistry — the power–thrust trade beyond the wall ────────────

  "power-thrust-trade": (rng) => {
    const P = sample(rng, [2, 5, 10, 25], 1)[0]; // kW, fixed power
    const veHigh = sample(rng, [20, 30, 40], 1)[0]; // km/s, ion-like
    const veLow = sample(rng, [3, 4], 1)[0]; // km/s, chemical-like
    const Fh = (2 * (P * 1000)) / (veHigh * 1000); // N
    const Fl = (2 * (P * 1000)) / (veLow * 1000); // N
    const ratio = veHigh / veLow;
    return {
      title: "The power–thrust trade: F = 2P/v_e",
      question: `A thruster is fed a fixed ${P} kW of power. What ideal thrust does it make at an ion-like v_e = ${veHigh} km/s, versus a chemical-like v_e = ${veLow} km/s?`,
      steps: [
        `F = \\frac{2P}{v_e}:\\quad F_{\\text{ion}} = \\frac{2\\times ${P}{\\times}10^3}{${veHigh}{\\times}10^3} = ${(Fh * 1000).toFixed(0)}\\ \\text{mN}`,
        `F_{\\text{chem}} = \\frac{2\\times ${P}{\\times}10^3}{${veLow}{\\times}10^3} = ${(Fl * 1000).toFixed(0)}\\ \\text{mN}`,
        `\\frac{F_{\\text{chem}}}{F_{\\text{ion}}} = \\frac{${veHigh}}{${veLow}} = ${ratio.toFixed(1)}\\times`,
      ],
      note: `At fixed power, thrust and exhaust velocity are inversely proportional: ${ratio.toFixed(
        1,
      )}× more v_e buys ${ratio.toFixed(1)}× less thrust. Chemistry hides this because combustion delivers gigawatts — the trade never bites until you leave chemistry and your power collapses to kilowatts.`,
    };
  },

  "ion-thrust-time": (rng) => {
    const P = sample(rng, [2300, 4000, 7000], 1)[0]; // W
    const ve = sample(rng, [20000, 30000, 40000], 1)[0]; // m/s
    const eff = sample(rng, [60, 65, 70], 1)[0] / 100;
    const m = sample(rng, [1000, 1200, 1500, 2000], 1)[0]; // kg
    const dv = sample(rng, [5, 8, 11.5], 1)[0]; // km/s
    const F = (eff * 2 * P) / ve; // N
    const a = F / m; // m/s^2
    const years = (dv * 1000) / a / (3600 * 24 * 365.25);
    return {
      title: "Ion propulsion: the thrust, and the years it must run",
      question: `An ion thruster runs at ${(P / 1000).toFixed(
        1,
      )} kW and v_e = ${(ve / 1000).toFixed(0)} km/s, ${Math.round(
        eff * 100,
      )}% efficient, on a ${m} kg spacecraft. Find its thrust and acceleration, then the continuous thrust time to build ${dv} km/s of Δv.`,
      steps: [
        `F = \\eta\\,\\frac{2P}{v_e} = ${eff.toFixed(2)}\\times\\frac{2\\times ${P}}{${ve}} = ${(F * 1000).toFixed(0)}\\ \\text{mN}`,
        `a = \\frac{F}{m} = \\frac{${F.toFixed(3)}}{${m}} = ${sci(a)}\\ \\text{m/s}^2 \\approx ${sci(a / 9.80665)}\\,g`,
        `t = \\frac{\\Delta v}{a} = \\frac{${dv}{\\times}10^3}{${sci(a)}} = ${years.toFixed(1)}\\ \\text{years of continuous thrust}`,
      ],
      note: `A push the weight of a couple of coins, sustained for years, out-performs a rocket launch. Ion missions are limited not by propellant (a wardrobe of xenon suffices) but by TIME and POWER — the exact inversion of every chemical mission.`,
    };
  },

  "nuclear-ve-lever": (rng) => {
    const Tn = sample(rng, [2700, 2900, 3000], 1)[0]; // K, nuclear (H2)
    const Tc = sample(rng, [3400, 3600], 1)[0]; // K, chemical
    const Mc = sample(rng, [16, 18, 20], 1)[0]; // chemical products
    const ratio = Math.sqrt(Tn / 2 / (Tc / Mc));
    return {
      title: "Nuclear thermal: the molecular-weight lever",
      question: `Nuclear thermal heats pure hydrogen (M = 2) to ${Tn} K; a chemical engine burns to products (M ≈ ${Mc}) at ${Tc} K. Using v_e ∝ √(T/M), which wins, and by how much?`,
      steps: [
        `\\frac{v_{e,\\text{nuc}}}{v_{e,\\text{chem}}} = \\sqrt{\\frac{T_n/M_n}{T_c/M_c}} = \\sqrt{\\frac{${Tn}/2}{${Tc}/${Mc}}}`,
        `= \\sqrt{\\frac{${(Tn / 2).toFixed(0)}}{${(Tc / Mc).toFixed(0)}}} = \\sqrt{${(Tn / 2 / (Tc / Mc)).toFixed(2)}} = ${ratio.toFixed(2)}`,
        `\\text{nuclear wins by } ${ratio.toFixed(2)}\\times\\ \\text{despite running } ${Tc - Tn}\\ \\text{K cooler}`,
      ],
      note: `Molecular weight is the lever: dropping M from ${Mc} to 2 is a factor of ${(
        Mc / 2
      ).toFixed(
        0,
      )} inside the square root, which crushes the modest temperature disadvantage. Nuclear thermal pulls M to its floor of 2 by heating pure hydrogen with fission instead of burning a heavy oxidizer.`,
    };
  },

  // ── Perturbations — tuning the Earth's flaws into tools ────────────────────

  "nodal-precession": (rng) => {
    const J2 = 1.0826e-3;
    const Re = 6378; // km
    const mu = 3.986e5; // km³/s²
    const alt = sample(rng, [400, 600, 800, 1000, 1200], 1)[0];
    const inc = sample(rng, [28, 45, 52, 63, 90, 98], 1)[0]; // deg
    const a = Re + alt;
    const n = Math.sqrt(mu / a ** 3); // rad/s
    const OmegaDot = -1.5 * J2 * (Re / a) ** 2 * n * Math.cos((inc * Math.PI) / 180); // rad/s
    const degDay = OmegaDot * (180 / Math.PI) * 86400;
    return {
      title: "J2 nodal precession: how fast the orbit plane swivels",
      question: `A circular orbit at ${alt} km altitude and inclination ${inc}° has its ascending node dragged around by Earth's equatorial bulge (J2). How many degrees per day does the node move, and which way? (J2 = 1.0826×10⁻³, R⊕ = 6,378 km, μ = 3.986×10⁵ km³/s².)`,
      steps: [
        `a = 6378 + ${alt} = ${a}\\ \\text{km},\\quad n = \\sqrt{\\mu/a^3} = ${sci(n)}\\ \\text{rad/s}`,
        `\\dot\\Omega = -\\tfrac{3}{2}J_2\\left(\\tfrac{R_\\oplus}{a}\\right)^2 n\\cos i = -\\tfrac{3}{2}(1.0826{\\times}10^{-3})(${(Re / a).toFixed(4)})^2(${sci(n)})\\cos ${inc}°`,
        `\\dot\\Omega = ${degDay.toFixed(3)}\\ \\text{°/day}\\quad(${degDay < 0 ? "\\text{westward regression}" : degDay > 0 ? "\\text{eastward advance}" : "\\text{no precession}"})`,
      ],
      note: `J2 is the master perturbation of low orbit — about 1000× any other. Prograde orbits (i<90°) regress westward; a polar orbit (90°) doesn't precess at all; retrograde orbits (i>90°) advance eastward — which is exactly what sun-synchronous orbits exploit.`,
    };
  },

  "sun-synchronous": (rng) => {
    const J2 = 1.0826e-3;
    const Re = 6378;
    const mu = 3.986e5;
    const alt = sample(rng, [500, 600, 700, 800, 1000], 1)[0];
    const a = Re + alt;
    const n = Math.sqrt(mu / a ** 3);
    const target = (0.9856 * (Math.PI / 180)) / 86400; // rad/s, eastward
    const cosI = target / (-1.5 * J2 * (Re / a) ** 2 * n);
    const i = (Math.acos(cosI) * 180) / Math.PI;
    return {
      title: "Designing a sun-synchronous orbit",
      question: `A sun-synchronous orbit must precess its node eastward at 0.9856°/day to track the Sun. What inclination achieves that at ${alt} km altitude (circular)? (J2 = 1.0826×10⁻³, R⊕ = 6,378 km, μ = 3.986×10⁵ km³/s².)`,
      steps: [
        `a = 6378 + ${alt} = ${a}\\ \\text{km},\\quad n = \\sqrt{\\mu/a^3} = ${sci(n)}\\ \\text{rad/s}`,
        `\\dot\\Omega = +0.9856°/\\text{day} = ${sci(target)}\\ \\text{rad/s}`,
        `\\cos i = \\frac{\\dot\\Omega}{-\\tfrac{3}{2}J_2 (R_\\oplus/a)^2 n} = ${cosI.toFixed(4)}\\;\\Rightarrow\\; i = ${i.toFixed(1)}°`,
      ],
      note: `The inclination lands just past polar (retrograde, i>90°) — every Earth-observation satellite sits near 98°. Eastward precession requires cos i < 0, so a sun-synchronous orbit MUST be retrograde. The bulge that ruins the two-body ellipse freezes the lighting for free, forever.`,
    };
  },

  "critical-inclination": (rng) => {
    const J2 = 1.0826e-3;
    const Re = 6378;
    const mu = 3.986e5;
    const a = 26560; // km — a Molniya-class semi-major axis
    const e = 0.74;
    const inc = sample(rng, [45, 55, 63.4, 70, 90], 1)[0];
    const n = Math.sqrt(mu / a ** 3);
    const factor = 5 * Math.cos((inc * Math.PI) / 180) ** 2 - 1;
    const wDot = 0.75 * J2 * (Re ** 2 / (a ** 2 * (1 - e ** 2) ** 2)) * n * factor; // rad/s
    const degDay = wDot * (180 / Math.PI) * 86400;
    return {
      title: "The critical inclination: freezing the apogee",
      question: `A Molniya-class orbit (a = 26,560 km, e = 0.74) at inclination ${inc}°: how fast does its argument of perigee drift, and what does that do to the apogee held over the far north? (J2 = 1.0826×10⁻³, R⊕ = 6,378 km, μ = 3.986×10⁵ km³/s².)`,
      steps: [
        `5\\cos^2 i - 1 = 5\\cos^2 ${inc}° - 1 = ${factor.toFixed(3)}`,
        `\\dot\\omega = \\tfrac{3}{4}J_2\\frac{R_\\oplus^2}{a^2(1-e^2)^2}\\,n\\,(5\\cos^2 i - 1) = ${degDay.toFixed(3)}\\ \\text{°/day}`,
        inc === 63.4
          ? `\\text{At }63.4°,\\ 5\\cos^2 i - 1 = 0 \\Rightarrow \\dot\\omega = 0:\\ \\text{the apogee is frozen in place.}`
          : `\\text{The apogee migrates }${Math.abs(degDay).toFixed(2)}°/\\text{day — it will not stay over the north.}`,
      ],
      note: `The factor (5cos²i − 1) vanishes at i = 63.43° (cos²i = 1/5), so the argument of perigee stops drifting and the apogee stays locked over the far north for free. Every Molniya satellite flies at 63.4° — J2 tuned against itself.`,
    };
  },

  // ── Rendezvous — the great inversion ──────────────────────────────────────

  "hohmann-transfer": (rng) => {
    const mu = 3.986e5; // km³/s²
    const Re = 6378;
    const alt1 = sample(rng, [300, 400, 500], 1)[0];
    const alt2 = sample(rng, [20200, 35786], 1)[0]; // GPS or GEO
    const r1 = Re + alt1;
    const r2 = Re + alt2;
    const at = (r1 + r2) / 2;
    const v1 = Math.sqrt(mu / r1);
    const v2 = Math.sqrt(mu / r2);
    const vp = Math.sqrt(mu * (2 / r1 - 1 / at));
    const va = Math.sqrt(mu * (2 / r2 - 1 / at));
    const dv1 = vp - v1;
    const dv2 = v2 - va;
    const hours = (Math.PI * Math.sqrt(at ** 3 / mu)) / 3600;
    return {
      title: "A Hohmann transfer, via vis-viva",
      question: `Move from a ${alt1} km circular orbit up to a ${alt2} km circular orbit. Find both burns and the total Δv. (μ = 3.986×10⁵ km³/s², R⊕ = 6,378 km.)`,
      steps: [
        `v_1 = \\sqrt{\\mu/r_1} = ${v1.toFixed(3)},\\quad v_2 = \\sqrt{\\mu/r_2} = ${v2.toFixed(3)}\\ \\text{km/s}\\quad(a_t = ${at.toFixed(0)}\\ \\text{km})`,
        `v_p = \\sqrt{\\mu(2/r_1 - 1/a_t)} = ${vp.toFixed(3)},\\quad v_a = \\sqrt{\\mu(2/r_2 - 1/a_t)} = ${va.toFixed(3)}\\ \\text{km/s}`,
        `\\Delta v = (v_p - v_1) + (v_2 - v_a) = ${dv1.toFixed(3)} + ${dv2.toFixed(3)} = ${(dv1 + dv2).toFixed(3)}\\ \\text{km/s}`,
      ],
      note: `Two prograde burns, joined by a half-ellipse coast of about ${hours.toFixed(1)} hours. Note the apogee crawl: at ${va.toFixed(2)} km/s you arrive slower than the ${v2.toFixed(2)} km/s circular speed, so the second burn speeds you UP to stay high — higher is slower. That Δv then becomes propellant through the rocket equation: vis-viva is the exchange rate between where things go and what it costs.`,
    };
  },

  "plane-change": (rng) => {
    const theta = sample(rng, [28.5, 45, 51.6, 63], 1)[0]; // deg
    const vLow = sample(rng, [7.67, 7.73, 7.79], 1)[0]; // LEO speed, km/s
    const vHigh = sample(rng, [1.5, 1.6, 1.8], 1)[0]; // slow apogee speed
    const dvLow = 2 * vLow * Math.sin((theta * Math.PI) / 360);
    const dvHigh = 2 * vHigh * Math.sin((theta * Math.PI) / 360);
    return {
      title: "The plane-change penalty: turn where you are slow",
      question: `Tilt an orbital plane by ${theta}°. What does it cost at LEO speed (${vLow} km/s), versus at a slow ${vHigh} km/s apogee? (Δv = 2v·sin(θ/2).)`,
      steps: [
        `\\Delta v = 2v\\sin(\\theta/2) = 2v\\sin(${(theta / 2).toFixed(2)}°)`,
        `\\text{at LEO: } 2(${vLow})\\sin(${(theta / 2).toFixed(2)}°) = ${dvLow.toFixed(2)}\\ \\text{km/s}`,
        `\\text{at apogee: } 2(${vHigh})\\sin(${(theta / 2).toFixed(2)}°) = ${dvHigh.toFixed(2)}\\ \\text{km/s}\\quad(${(dvLow / dvHigh).toFixed(1)}\\times\\text{ cheaper})`,
      ],
      note: `Changing direction is ruinous: a ${theta}° tilt at LEO costs ${dvLow.toFixed(
        1,
      )} km/s — comparable to an entire LEO-to-GEO transfer — because you are rotating a long velocity vector. The cost is ∝ v, so you turn where you are slow (high up). This is also why launch latitude matters: geography sets your starting plane, and plane changes reach all the way up to GEO.`,
    };
  },

  "phasing": (rng) => {
    const mu = 3.986e5;
    const r = 6771; // ISS-like radius, km
    const drop = sample(rng, [10, 20, 30, 50], 1)[0]; // km lower
    const gap = sample(rng, [8, 12, 16, 20], 1)[0]; // deg behind
    const T = (2 * Math.PI * Math.sqrt(r ** 3 / mu)) / 60; // min
    const Tph = (2 * Math.PI * Math.sqrt((r - drop) ** 3 / mu)) / 60;
    const perOrbit = 360 * ((T - Tph) / T); // deg gained per orbit
    const orbits = gap / perOrbit;
    return {
      title: "Phasing: catch up by dropping down",
      question: `You trail a target by ${gap}° in a ${r - 6371} km orbit (period ${T.toFixed(1)} min). Drop ${drop} km into a lower phasing orbit — how fast do you close the gap, and in how many orbits? (μ = 3.986×10⁵ km³/s².)`,
      steps: [
        `T_{\\text{phasing}} = 2\\pi\\sqrt{(r-${drop})^3/\\mu} = ${Tph.toFixed(2)}\\ \\text{min}\\quad(\\text{vs } ${T.toFixed(2)})`,
        `\\text{angle gained/orbit} = 360°\\times\\frac{T - T_{\\text{ph}}}{T} = ${perOrbit.toFixed(2)}°`,
        `\\text{orbits to close } ${gap}° = ${gap}/${perOrbit.toFixed(2)} \\approx ${orbits.toFixed(1)}\\ \\text{orbits}`,
      ],
      note: `Dropping lower makes your orbit FASTER (shorter period), so you gain ${perOrbit.toFixed(
        2,
      )}° on the target every lap and catch it from below — then rise back to match. To catch something ahead, you slow down. Altitude is the throttle for relative angular position; the catch-up is gentle, which is why rendezvous takes hours to days.`,
    };
  },

  // ── Interplanetary — patched conics and theft ─────────────────────────────

  "interplanetary-transfer": (rng) => {
    const muSun = 1.327e11; // km³/s²
    const AU = 1.496e8; // km
    const dests = [
      { name: "Mars", au: 1.524 },
      { name: "Venus", au: 0.723 },
      { name: "Jupiter", au: 5.203 },
    ];
    const dest = dests[sample(rng, [0, 1, 2], 1)[0]];
    const r1 = AU;
    const r2 = dest.au * AU;
    const v1 = Math.sqrt(muSun / r1);
    const v2 = Math.sqrt(muSun / r2);
    const at = (r1 + r2) / 2;
    const vt1 = Math.sqrt(muSun * (2 / r1 - 1 / at)); // transfer speed at Earth's orbit
    const vt2 = Math.sqrt(muSun * (2 / r2 - 1 / at)); // transfer speed at the planet's orbit
    const vDep = Math.abs(vt1 - v1);
    const vArr = Math.abs(v2 - vt2);
    const days = (Math.PI * Math.sqrt(at ** 3 / muSun)) / 86400;
    const outer = dest.au > 1;
    return {
      title: "An interplanetary Hohmann transfer, in the Sun's frame",
      question: `Design a heliocentric transfer from Earth (1.000 AU) to ${dest.name} (${dest.au.toFixed(
        3,
      )} AU). Find the departure and arrival hyperbolic-excess speeds and the trip time. (μ_☉ = 1.327×10¹¹ km³/s², 1 AU = 1.496×10⁸ km.)`,
      steps: [
        `v_1 = \\sqrt{\\mu_\\odot/r_1} = ${v1.toFixed(3)},\\quad v_2 = \\sqrt{\\mu_\\odot/r_2} = ${v2.toFixed(3)}\\ \\text{km/s}\\quad(a_t = ${(
          at / AU
        ).toFixed(3)}\\ \\text{AU})`,
        `v_{t1} = \\sqrt{\\mu_\\odot(2/r_1 - 1/a_t)} = ${vt1.toFixed(3)},\\quad v_{t2} = \\sqrt{\\mu_\\odot(2/r_2 - 1/a_t)} = ${vt2.toFixed(3)}\\ \\text{km/s}`,
        `v_\\infty^{\\text{dep}} = |v_{t1} - v_1| = ${vDep.toFixed(3)},\\quad v_\\infty^{\\text{arr}} = |v_2 - v_{t2}| = ${vArr.toFixed(3)}\\ \\text{km/s}`,
        `t = \\pi\\sqrt{a_t^3/\\mu_\\odot} = ${days.toFixed(1)}\\ \\text{days} \\approx ${(
          days / 30.44
        ).toFixed(1)}\\ \\text{months}`,
      ],
      note: `Earth is a free ${v1.toFixed(
        1,
      )} km/s launch platform: you inherit its orbital speed and pay only the ${vDep.toFixed(
        2,
      )} km/s of excess. Departing ${
        outer
          ? "prograde (with Earth's motion) climbs you outward"
          : "retrograde (against Earth's motion) drops you sunward"
      } — ${dest.name} is ${
        outer ? "higher and slower" : "lower and faster"
      }. These v∞ are speeds relative to the planets at the sphere-of-influence boundaries, not engine burns; the actual burn is smaller, by the Oberth effect.`,
    };
  },

  "oberth-departure": (rng) => {
    const muE = 3.986e5; // km³/s²
    const Re = 6378;
    const alt = sample(rng, [200, 300, 400], 1)[0];
    const vinf = sample(rng, [2.9, 3.2, 3.5, 3.8], 1)[0];
    const r = Re + alt;
    const vPark = Math.sqrt(muE / r);
    const vEsc = Math.sqrt((2 * muE) / r);
    const vHyp = Math.sqrt(vinf ** 2 + vEsc ** 2);
    const oberth = vHyp - vPark;
    const naive = vEsc - vPark + vinf;
    const saving = naive - oberth;
    const pct = (100 * saving) / naive;
    return {
      title: "The Oberth effect: one deep burn beats escape-then-add",
      question: `From a ${alt} km parking orbit you need a hyperbolic excess of v∞ = ${vinf} km/s to depart. Compare the single deep burn against escaping first and adding v∞ out in slow space. (μ⊕ = 3.986×10⁵ km³/s², R⊕ = 6,378 km.)`,
      steps: [
        `v_{\\text{park}} = \\sqrt{\\mu/r} = ${vPark.toFixed(3)},\\quad v_{\\text{esc}} = \\sqrt{2\\mu/r} = ${vEsc.toFixed(3)}\\ \\text{km/s}`,
        `\\Delta v_{\\text{Oberth}} = \\sqrt{v_\\infty^2 + v_{\\text{esc}}^2} - v_{\\text{park}} = ${vHyp.toFixed(3)} - ${vPark.toFixed(3)} = ${oberth.toFixed(3)}\\ \\text{km/s}`,
        `\\Delta v_{\\text{naive}} = (v_{\\text{esc}} - v_{\\text{park}}) + v_\\infty = ${(
          vEsc - vPark
        ).toFixed(3)} + ${vinf} = ${naive.toFixed(3)}\\ \\text{km/s}\\quad(\\text{saves } ${saving.toFixed(
          3,
        )},\\ ${pct.toFixed(0)}\\%)`,
      ],
      note: `The energy a burn adds is v·Δv — proportional to how fast you already move. Down deep at ${vPark.toFixed(
        1,
      )} km/s you are moving fastest, so one hard burn there dumps the propellant's whole energy into the ship; escaping first and adding v∞ out where you crawl wastes energy in the exhaust. Burn deep, burn fast, burn once. This is the "trans-Mars injection" kick, and it is why you never spiral out slowly.`,
    };
  },

  "gravity-assist": (rng) => {
    const planets = [
      { name: "Jupiter", mu: 1.267e8, muStr: "1.267×10⁸", R: 71492 },
      { name: "Saturn", mu: 3.793e7, muStr: "3.793×10⁷", R: 60268 },
    ];
    const p = planets[sample(rng, [0, 1], 1)[0]];
    const vinf = sample(rng, [4, 5, 6, 7], 1)[0];
    const mult = sample(rng, [3, 5, 10], 1)[0];
    const rp = mult * p.R;
    const e = 1 + (rp * vinf ** 2) / p.mu;
    const delta = 2 * Math.asin(1 / e) * (180 / Math.PI);
    const maxGain = 2 * vinf;
    const massRatio = Math.exp(maxGain / 4.4);
    return {
      title: "A gravity assist: the turn angle and the free Δv",
      question: `A spacecraft flies past ${p.name} with v∞ = ${vinf} km/s at a periapsis of ${mult} ${p.name} radii. Find the flyby eccentricity, the turn angle, and the maximum heliocentric speed it can gain. (μ = ${p.muStr} km³/s², R = ${p.R.toLocaleString(
        "en-US",
      )} km.)`,
      steps: [
        `r_p = ${mult}R = ${rp.toLocaleString("en-US")}\\ \\text{km},\\quad e = 1 + \\frac{r_p v_\\infty^2}{\\mu} = ${e.toFixed(
          3,
        )}`,
        `\\delta = 2\\arcsin(1/e) = 2\\arcsin(${(1 / e).toFixed(3)}) = ${delta.toFixed(1)}°`,
        `\\Delta v_{\\max} = 2v_\\infty = ${maxGain.toFixed(1)}\\ \\text{km/s}\\quad(\\text{a rocket would need mass ratio } e^{\\Delta v/v_e} \\approx ${massRatio.toFixed(
          0,
        )})`,
      ],
      note: `Relative to ${p.name} the speed in equals the speed out — gravity only ROTATES the velocity by ${delta.toFixed(
        0,
      )}°. But added back to ${p.name}'s motion around the Sun, that rotation changes the heliocentric speed by up to 2v∞ = ${maxGain.toFixed(
        1,
      )} km/s — free Δv no chemical rocket could carry (mass ratio ≈ ${massRatio.toFixed(
        0,
      )}). Fly closer and you turn more, but into worse radiation. The energy is stolen from ${p.name}, which slows in its orbit by roughly 10⁻²⁴ km/s.`,
    };
  },

  // ── The orbital commons — hypervelocity debris ────────────────────────────

  "debris-energy": (rng) => {
    const grams = sample(rng, [0.5, 1, 5, 10, 100], 1)[0];
    const v = sample(rng, [8, 10, 12, 14], 1)[0]; // km/s
    const m = grams / 1000; // kg
    const vms = v * 1000; // m/s
    const KE = 0.5 * m * vms ** 2; // J
    const tnt = KE / 4184; // grams of TNT
    const bullet = 0.5 * 0.004 * 900 ** 2; // 4 g at 900 m/s = 1620 J
    const ratio = KE / bullet;
    const tntStr = tnt >= 1000 ? `${(tnt / 1000).toFixed(1)} kg` : `${tnt.toFixed(0)} g`;
    return {
      title: "A fleck of paint hits like a bullet",
      question: `A ${grams}-gram debris fragment strikes a satellite at ${v} km/s. Find its kinetic energy, its TNT equivalent, and how it compares to a high-powered rifle bullet (4 g at 900 m/s ≈ 1,620 J). (1 g TNT = 4,184 J.)`,
      steps: [
        `KE = \\tfrac{1}{2}mv^2 = \\tfrac{1}{2}(${m}\\,\\text{kg})(${vms.toLocaleString(
          "en-US",
        )}\\,\\text{m/s})^2 = ${sci(KE, 2)}\\ \\text{J}`,
        `\\text{TNT-equivalent} = ${Math.round(KE).toLocaleString("en-US")}/4184 = ${tnt.toFixed(
          0,
        )}\\ \\text{g of TNT}`,
        `\\text{vs a rifle bullet: } ${Math.round(KE).toLocaleString(
          "en-US",
        )}/1620 \\approx ${ratio.toFixed(0)}\\times`,
      ],
      note: `Kinetic energy scales as v², and orbital speed is so high that a mere ${grams}-gram fragment carries the punch of ${tntStr} of TNT — about ${ratio.toFixed(
        0,
      )}× a rifle bullet. This is why a lost bolt is a bomb and a paint chip has cratered Shuttle windows. The 1–10 cm population is the deadliest: lethal, yet too small to track and dodge.`,
    };
  },

  "debris-closing-speed": (rng) => {
    const mu = 3.986e5; // km³/s²
    const Re = 6378;
    const alt = sample(rng, [400, 800, 1200], 1)[0];
    const v = Math.sqrt(mu / (Re + alt)); // km/s
    const theta = sample(rng, [15, 45, 90, 150, 180], 1)[0]; // crossing angle, deg
    const vrel = 2 * v * Math.sin((theta * Math.PI) / 360);
    return {
      title: "Why the crossing angle sets the lethality",
      question: `Two objects share a ${alt} km circular orbit altitude but cross at ${theta}°. How fast do they close? (μ = 3.986×10⁵ km³/s², R⊕ = 6,378 km.)`,
      steps: [
        `v = \\sqrt{\\mu/(R_\\oplus + ${alt})} = ${v.toFixed(3)}\\ \\text{km/s}\\quad(\\text{both objects})`,
        `v_{\\text{rel}} = 2v\\sin(\\theta/2) = 2(${v.toFixed(2)})\\sin(${(theta / 2).toFixed(
          1,
        )}°) = ${vrel.toFixed(2)}\\ \\text{km/s}`,
      ],
      note: `Same speed, different directions: the closing speed is the vector difference, 2v·sin(θ/2) — near zero for a co-moving pair, √2·v for a right-angle crossing, up to 2v ≈ ${(
        2 * v
      ).toFixed(
        1,
      )} km/s head-on. The ~10 km/s typical collision is why debris is hypervelocity. It is the very same 2v·sin(θ/2) as the plane-change penalty — geometry rotating a velocity vector.`,
    };
  },

  "collision-pairs": (rng) => {
    const n = sample(rng, [2000, 5000, 10000, 40000], 1)[0];
    const pairs = (n * (n - 1)) / 2;
    const n2 = n * 2;
    const pairs2 = (n2 * (n2 - 1)) / 2;
    const growth = pairs2 / pairs;
    return {
      title: "Why collisions grow as the square of the population",
      question: `Low Earth orbit holds about ${n.toLocaleString(
        "en-US",
      )} tracked objects. How many distinct pairs could collide — and what happens to that count if the population doubles?`,
      steps: [
        `\\text{pairs} = \\frac{n(n-1)}{2} = \\frac{${n.toLocaleString(
          "en-US",
        )}\\cdot${(n - 1).toLocaleString("en-US")}}{2} = ${sci(pairs, 2)}`,
        `\\text{double to } ${n2.toLocaleString("en-US")}:\\ \\frac{n(n-1)}{2} = ${sci(pairs2, 2)}`,
        `\\text{ratio} = ${growth.toFixed(2)}\\times \\approx 4\\times\\quad(\\text{grows as } n^2)`,
      ],
      note: `Collisions need pairs, and the pair count grows as n²/2 — so doubling the population roughly quadruples the collision opportunities. Each collision spawns thousands of fragments that add to n, raising the rate again: the quadratic feedback behind the Kessler cascade. Past a critical density each collision causes more than one more — an orbital R₀ > 1 — and it runs away.`,
    };
  },

  // ── Seeing through the atmosphere — telescopes ────────────────────────────

  "atmosphere-scale-height": (rng) => {
    const H = 8; // km, teaching value for the scale height
    const sites = [
      { name: "Mauna Kea", alt: 4.2 },
      { name: "the Atacama plateau", alt: 5.1 },
      { name: "a cruising airliner", alt: 12 },
      { name: "a stratospheric balloon", alt: 35 },
    ];
    const s = sites[sample(rng, [0, 1, 2, 3], 1)[0]];
    const above = Math.exp(-s.alt / H);
    const below = 1 - above;
    const h90 = H * Math.log(10);
    return {
      title: "The exponential ocean of air",
      question: `Earth's atmosphere thins as P(h) = P₀·e^(−h/H) with scale height H ≈ 8 km. ${s.name.charAt(0).toUpperCase() + s.name.slice(1)} sits at ${s.alt} km. What fraction of the atmosphere's mass lies below it, and how high must you climb to get above 90% of the air?`,
      steps: [
        `\\text{fraction above} = e^{-h/H} = e^{-${s.alt}/8} = ${above.toFixed(3)}`,
        `\\text{fraction below} = 1 - e^{-h/H} = ${below.toFixed(3)} \\approx ${(below * 100).toFixed(
          0,
        )}\\%`,
        `\\text{above }90\\%:\\ h = H\\ln 10 = 8(2.303) = ${h90.toFixed(1)}\\ \\text{km}`,
      ],
      note: `At ${s.alt} km you are already above ${(below * 100).toFixed(
        0,
      )}% of the atmosphere — and an even larger share of its water vapor, which hugs the ground. The exponential fall-off means a modest climb escapes a lot of barrier, which is the whole reason observatories crowd onto a few high, dry peaks (and why balloons go to ~35 km, above 99%).`,
    };
  },

  "seeing-limit": (rng) => {
    const D = sample(rng, [4, 8, 10, 39], 1)[0]; // m
    const lambdaNm = sample(rng, [500, 550, 700], 1)[0]; // visible only — keeps 1.22λ/r0 valid
    const r0cm = sample(rng, [10, 15, 20], 1)[0]; // Fried parameter, cm
    const lam = lambdaNm * 1e-9;
    const arc = 206265;
    const diffAs = (1.22 * lam / D) * arc;
    const seeAs = (1.22 * lam / (r0cm / 100)) * arc;
    const factor = seeAs / diffAs; // = D / r0
    return {
      title: "The seeing limit: why a giant sees like a toy",
      question: `A ${D}-meter telescope observes at ${lambdaNm} nm. Compare its diffraction-limited resolution (θ = 1.22λ/D) with what the atmosphere allows, given a Fried parameter r₀ = ${r0cm} cm. (1 rad = 206,265″.)`,
      steps: [
        `\\theta_{\\text{diff}} = 1.22\\lambda/D = ${diffAs.toFixed(4)}''`,
        `\\theta_{\\text{seeing}} = 1.22\\lambda/r_0 = ${seeAs.toFixed(2)}''\\quad(r_0 = ${r0cm}\\ \\text{cm})`,
        `\\text{degradation} = D/r_0 = ${factor.toFixed(0)}\\times\\ \\Rightarrow\\ \\text{the ${D} m mirror resolves like a ${r0cm} cm one}`,
      ],
      note: `Beyond ~${r0cm} cm of aperture, a bigger ground telescope buys only LIGHT (area ∝ D²), not sharpness — its resolution is pinned at r₀ by turbulence. This is why big ground scopes are "seeing-limited," why the 2.4 m Hubble out-resolves an 8 m from the ground (vacuum, no seeing), and why adaptive optics exists: to win the diffraction limit back.`,
    };
  },

  "rayleigh-scattering": (rng) => {
    const shortNm = sample(rng, [400, 450, 500], 1)[0];
    const longNm = sample(rng, [700, 1000, 2200], 1)[0];
    const ratio = (longNm / shortNm) ** 4;
    const isIR = longNm >= 1000;
    return {
      title: "Why the sky is blue and the infrared sees through dust",
      question: `Rayleigh scattering scales as 1/λ⁴. How much more strongly is ${shortNm} nm light scattered than ${longNm} nm light?`,
      steps: [
        `\\frac{\\text{scatter}(${shortNm})}{\\text{scatter}(${longNm})} = \\left(\\frac{${longNm}}{${shortNm}}\\right)^4 = ${
          ratio >= 100 ? Math.round(ratio) : ratio.toFixed(1)
        }\\times`,
      ],
      note: isIR
        ? `Because scattering collapses as 1/λ⁴, ${longNm} nm infrared light is scattered ~${Math.round(
            ratio,
          )}× LESS than ${shortNm} nm — so it slips through haze and interstellar dust that stop visible light. This is why infrared astronomy sees into dusty stellar nurseries and the galactic center that optical telescopes cannot.`
        : `Blue is scattered ~${ratio.toFixed(
            1,
          )}× more than red — which is why the day sky is blue (scattered blue fills it), sunsets are red (blue scattered out of the long horizon path), and objects low on the horizon look reddened and dimmed to astronomers.`,
    };
  },

  // ── Three bodies — the unsolvable problem and its five points ──────────────

  "lagrange-distance": (rng) => {
    const systems = [
      { name: "Sun–Earth", R: 1.496e8, mu: 3.0e-6, tag: "where JWST and SOHO sit" },
      { name: "Sun–Jupiter", R: 7.784e8, mu: 9.54e-4, tag: "Jupiter's Hill radius" },
      { name: "Earth–Moon", R: 3.844e5, mu: 1.215e-2, tag: "the cislunar gateway region" },
    ];
    const s = systems[sample(rng, [0, 1, 2], 1)[0]];
    const r = s.R * Math.cbrt(s.mu / 3);
    const pct = (100 * r) / s.R;
    return {
      title: "Locating L1 and L2 with the Hill radius",
      question: `In the ${s.name} system (mass parameter μ = ${sci(
        s.mu,
        2,
      ).replace("\\times10^{", "×10^").replace("}", "")}, separation R = ${sci(s.R, 3)
        .replace("\\times10^{", "×10^")
        .replace("}", "")} km), estimate the distance from the smaller body to L1 and L2 using r ≈ R·(μ/3)^(1/3).`,
      steps: [
        `r \\approx R\\left(\\tfrac{\\mu}{3}\\right)^{1/3} = ${sci(s.R, 3)}\\left(\\tfrac{${sci(
          s.mu,
          2,
        )}}{3}\\right)^{1/3}`,
        `r \\approx ${sci(r, 3)}\\ \\text{km} \\approx ${pct.toFixed(2)}\\%\\ \\text{of } R`,
      ],
      note: `Both L1 (sunward/inner) and L2 (anti-sunward/outer) sit at roughly this same distance — the Hill radius, where the smaller body's gravity perturbs the orbital period to match. For ${s.name} that is ${s.tag}. L1 and L2 are unstable saddles, so a spacecraft flies a looping halo orbit around the empty point and station-keeps with a few m/s per year.`,
    };
  },

  "lagrange-stability": (rng) => {
    const systems = [
      { name: "Sun–Earth", ratio: 333000 },
      { name: "Sun–Jupiter", ratio: 1048 },
      { name: "Earth–Moon", ratio: 81.3 },
      { name: "Pluto–Charon", ratio: 8.1 },
      { name: "an equal-mass binary star", ratio: 1 },
    ];
    const s = systems[sample(rng, [0, 1, 2, 3, 4], 1)[0]];
    const thresh = (25 + Math.sqrt(621)) / 2;
    const stable = s.ratio > thresh;
    return {
      title: "Are the triangular points L4 and L5 stable?",
      question: `The triangular Lagrange points are stable only if the primaries' mass ratio exceeds (25+√621)/2. For ${s.name} (mass ratio ${s.ratio.toLocaleString(
        "en-US",
      )}), are L4 and L5 stable?`,
      steps: [
        `\\text{threshold} = \\tfrac{25+\\sqrt{621}}{2} = ${thresh.toFixed(2)}`,
        `m_1/m_2 = ${s.ratio.toLocaleString("en-US")} \\ ${
          stable ? ">" : "<"
        }\\ ${thresh.toFixed(2)} \\Rightarrow \\textbf{${stable ? "stable" : "unstable"}}`,
      ],
      note: stable
        ? `A large mass hierarchy makes L4/L5 stable — so they trap material for the age of the solar system. This is why Sun–Jupiter L4/L5 hold over a million Trojan asteroids in two swarms (60° ahead and behind), and why Earth–Moon L4/L5 are proposed for space colonies (free station-keeping). The stability is counterintuitive: L4/L5 are potential-energy MAXIMA, and the Coriolis force in the rotating frame curls an escaping body back into a loop.`
        : `Below the 24.96 threshold the triangular points cannot hold a population — a body there drifts away. Comparable-mass systems (equal binaries, Pluto–Charon) have no stable Trojans. Stability is a gift of a strong mass hierarchy, delivered by the Coriolis force in the rotating frame.`,
    };
  },

  "lyapunov-horizon": (rng) => {
    const systems = [
      { name: "the solar system", tau: 5, unit: "Myr" },
      { name: "Pluto's orbit", tau: 15, unit: "Myr" },
      { name: "Hyperion's tumble", tau: 40, unit: "days" },
    ];
    const s = systems[sample(rng, [0, 1, 2], 1)[0]];
    const nTau = sample(rng, [10, 20, 30], 1)[0];
    const t = nTau * s.tau;
    const amp = Math.exp(nTau);
    return {
      title: "The prediction horizon: determined, yet unknowable",
      question: `A chaotic system's errors grow as e^(t/τ). ${s.name.charAt(0).toUpperCase() + s.name.slice(1)} has a Lyapunov time τ ≈ ${s.tau} ${s.unit}. By how much is a tiny initial uncertainty amplified after ${nTau} Lyapunov times, and how long is that?`,
      steps: [
        `t = ${nTau}\\,\\tau = ${t.toLocaleString("en-US")}\\ \\text{${s.unit}}`,
        `\\text{amplification} = e^{t/\\tau} = e^{${nTau}} = ${sci(amp, 2)}`,
      ],
      note: `After ~20 Lyapunov times a ${sci(amp, 1).replace(
        "\\times10^{",
        "×10^",
      ).replace("}", "")}-fold blow-up swallows any measurement, so the future is uncomputable — not from randomness but from exponential error growth. Each extra digit of initial precision buys only ONE more Lyapunov time (logarithmic), so no instrument can reach far. Determinism ≠ predictability: this is the chaos Poincaré glimpsed in 1890.`,
    };
  },

  // ── The photon economy — counting scarce light ────────────────────────────

  "magnitude-flux": (rng) => {
    const bright = [
      { name: "the Sun", m: -26.7 },
      { name: "Vega", m: 0 },
      { name: "a naked-eye star", m: 2 },
      { name: "the faintest naked-eye star", m: 6 },
    ];
    const faint = [
      { name: "a small-telescope star", m: 12 },
      { name: "a Hubble Deep Field galaxy", m: 25 },
      { name: "the faintest detected galaxy", m: 30 },
    ];
    const b = bright[sample(rng, [0, 1, 2, 3], 1)[0]];
    const f = faint[sample(rng, [0, 1, 2], 1)[0]];
    const dm = f.m - b.m;
    const ratio = 10 ** (0.4 * dm);
    return {
      title: "Magnitude arithmetic: a difference is a ratio",
      question: `How many times fainter is ${f.name} (magnitude ${f.m}) than ${b.name} (magnitude ${b.m})? Use m₁ − m₂ = −2.5·log₁₀(F₁/F₂).`,
      steps: [
        `\\Delta m = ${f.m} - (${b.m}) = ${dm.toFixed(1)}\\ \\text{mag}`,
        `F_{\\text{bright}}/F_{\\text{faint}} = 10^{0.4\\,\\Delta m} = 10^{${(0.4 * dm).toFixed(
          2,
        )}} = ${ratio >= 1e4 ? sci(ratio, 1) : Math.round(ratio).toLocaleString("en-US")}`,
      ],
      note: `Five magnitudes is defined as exactly 100× in brightness, so the scale is logarithmic — a magnitude DIFFERENCE is a flux RATIO, never a sum. And it runs backward: brighter means a smaller (even negative) number, a 3,000-year-old inheritance from Hipparchus counting stars by eye. The one payoff: it compresses the universe's ~10²³ range of brightness into a handful of readable numbers.`,
    };
  },

  "distance-modulus": (rng) => {
    const M = sample(rng, [-5, -2, 1, 3, 5], 1)[0];
    const dmod = sample(rng, [5, 10, 15, 20, 25], 1)[0]; // m − M
    const m = M + dmod;
    const dPc = 10 * 10 ** (dmod / 5);
    const dLy = dPc * 3.26;
    return {
      title: "The distance modulus: brightness into distance",
      question: `A standard candle has absolute magnitude M = ${M} and is observed at apparent magnitude m = ${m}. How far away is it? Use m − M = 5·log₁₀(d/10 pc).`,
      steps: [
        `m - M = ${m} - (${M}) = ${dmod}`,
        `d = 10\\cdot 10^{(m-M)/5} = 10\\cdot 10^{${(dmod / 5).toFixed(
          1,
        )}} = ${sci(dPc, 2)}\\ \\text{pc}`,
        `\\quad = ${sci(dLy, 2)}\\ \\text{ly}\\quad(1\\,\\text{pc}=3.26\\,\\text{ly})`,
      ],
      note: `This is the inverse-square law written as a subtraction: knowing an object's true brightness (M) and measuring how faint it looks (m), the gap m − M gives its distance. Identify a "standard candle" — a Cepheid, a Type Ia supernova — and every rung of the cosmic distance ladder is this one equation. The great dimmer is also the great measuring stick.`,
    };
  },

  "snr-integration": (rng) => {
    const snr1 = sample(rng, [5, 10, 20], 1)[0];
    const t1 = sample(rng, [1, 2, 4], 1)[0]; // hours
    const snr2 = sample(rng, [40, 50, 100], 1)[0];
    const N1 = snr1 ** 2;
    const factor = (snr2 / snr1) ** 2;
    const t2 = t1 * factor;
    return {
      title: "The tyranny of the square root",
      question: `Photons arrive at random, so a count of N has noise √N and SNR = √N. You reach SNR = ${snr1} in ${t1} h on a source. How many photons was that, and how long to reach SNR = ${snr2}?`,
      steps: [
        `N = \\text{SNR}^2 = ${snr1}^2 = ${N1}\\ \\text{photons for SNR}=${snr1}`,
        `\\text{SNR}\\propto\\sqrt{t}\\ \\Rightarrow\\ t_2 = t_1\\left(\\tfrac{\\text{SNR}_2}{\\text{SNR}_1}\\right)^2 = ${t1}\\times${factor.toFixed(
          0,
        )} = ${t2.toLocaleString("en-US")}\\ \\text{h}`,
      ],
      note: `Because SNR grows only as √N, precision is brutally expensive: doubling SNR needs 4× the light, ten times deeper needs 100×. This is why deep astronomy is time-hungry — the Hubble Deep Field stared ~10 days to pull 3,000 galaxies from "empty" sky — and why aperture is prized (area ∝ D²: photons, hence SNR, scale with the square of the mirror).`,
    };
  },

  // ── The high-energy universe — the light of violence ──────────────────────

  "wien-temperature": (rng) => {
    const b = 2.898e-3; // m·K
    const objects = [
      { name: "a red giant's surface", T: 3000 },
      { name: "the Sun's surface", T: 5800 },
      { name: "a hot blue star", T: 30000 },
      { name: "supernova-shocked gas", T: 3e6 },
      { name: "a neutron-star accretion disk", T: 2e7 },
    ];
    const o = objects[sample(rng, [0, 1, 2, 3, 4], 1)[0]];
    const lam = b / o.T; // m
    const nm = lam * 1e9;
    const eV = (1.986e-25 / lam) / 1.602e-19;
    const band =
      nm > 750 ? "infrared" : nm > 380 ? "visible" : nm > 10 ? "ultraviolet" : nm > 0.01 ? "X-ray" : "gamma-ray";
    const lamStr = nm >= 1000 ? `${(nm / 1000).toFixed(1)}\\ \\mu\\text{m}` : nm >= 1 ? `${nm.toFixed(nm < 10 ? 2 : 0)}\\ \\text{nm}` : `${(nm * 1000).toFixed(1)}\\ \\text{pm}`;
    const eStr = eV >= 1000 ? `${(eV / 1000).toFixed(1)}\\ \\text{keV}` : `${eV.toFixed(2)}\\ \\text{eV}`;
    const Tstr = o.T >= 1e6 ? `${(o.T / 1e6).toFixed(0)}\\times10^6` : o.T.toLocaleString("en-US");
    return {
      title: "Wien's law: what temperature emits X-rays?",
      question: `At what wavelength does ${o.name} (T = ${o.T.toLocaleString(
        "en-US",
      )} K) radiate most strongly, and in which band? Use λ_peak = b/T with b = 2.898×10⁻³ m·K.`,
      steps: [
        `\\lambda_{\\text{peak}} = \\frac{b}{T} = \\frac{2.898\\times10^{-3}}{${Tstr}} = ${lamStr}`,
        `E_{\\text{peak}} = hc/\\lambda \\approx ${eStr}\\ \\Rightarrow\\ \\textbf{${band}}`,
      ],
      note: `Hotter means shorter-wavelength, higher-energy light. The Sun at ~5,800 K peaks in the visible (why we see it). To peak in the X-ray you need MILLIONS of degrees — a temperature ordinary stars never reach, found only where matter falls into a compact object or is shock-heated by an explosion. X-rays are the light of million-degree matter, and million-degree matter is the signature of violence.`,
    };
  },

  "accretion-efficiency": (rng) => {
    const G = 6.674e-11;
    const c = 3e8;
    const Msun = 1.989e30;
    const bodies = [
      { name: "a neutron star", M: 1.4, R: 10 }, // R in km
      { name: "a white dwarf", M: 0.6, R: 7000 },
      { name: "a 10 M☉ black hole (ISCO)", M: 10, R: 89 }, // ~3 Schwarzschild radii
    ];
    const o = bodies[sample(rng, [0, 1, 2], 1)[0]];
    const M = o.M * Msun;
    const R = o.R * 1000; // m
    const ePerKg = (G * M) / R; // J/kg
    const frac = ePerKg / c ** 2; // fraction of mc²
    const vsFusion = frac / 0.007;
    return {
      title: "Accretion vs fusion: the most efficient furnace",
      question: `How much energy is released per kilogram of matter falling onto ${o.name} (M = ${o.M} M☉, R = ${o.R.toLocaleString(
        "en-US",
      )} km)? Express it as a fraction of mc², and compare to fusion (0.7%). Use E/m ≈ GM/R.`,
      steps: [
        `E/m = GM/R = \\frac{(6.674\\times10^{-11})(${o.M}\\times1.989\\times10^{30})}{${(
          R
        ).toLocaleString("en-US")}} = ${sci(ePerKg, 2)}\\ \\text{J/kg}`,
        `\\frac{E}{mc^2} = \\frac{${sci(ePerKg, 2)}}{(3\\times10^8)^2} = ${(frac * 100).toFixed(
          frac < 0.01 ? 3 : 1,
        )}\\%`,
        `\\text{vs fusion's } 0.7\\%:\\ ${vsFusion.toFixed(vsFusion < 1 ? 2 : 0)}\\times`,
      ],
      note: `${
        frac > 0.05
          ? `Falling onto ${o.name} converts ~${(frac * 100).toFixed(
              0,
            )}% of rest-mass energy to radiation — roughly ${vsFusion.toFixed(
              0,
            )}× more efficient than the fusion that lights the stars.`
          : `A white dwarf is far less compact (big radius, shallow well), so it yields only ~${(
              frac * 100
            ).toFixed(2)}% — far less than a neutron star.`
      } Compactness is everything: the energy scales as M/R, so the deepest wells (neutron stars, black holes) blaze in X-rays as infalling matter dies. Scorpius X-1, the first cosmic X-ray source, is a neutron star doing exactly this.`,
    };
  },

  "grazing-angle": (rng) => {
    const E = sample(rng, [2, 5, 10, 30], 1)[0]; // keV
    const refE = 1; // keV → ~1°
    const refAngle = 1; // degree
    const angle = refAngle * (refE / E); // critical angle ~ 1/E
    const arcmin = angle * 60;
    return {
      title: "The grazing-incidence telescope: skipping X-rays",
      question: `X-rays reflect only if they strike a mirror within the critical grazing angle, which scales roughly as 1/E. If 1 keV X-rays reflect within ~1° of the surface, what is the critical angle for ${E} keV X-rays?`,
      steps: [
        `\\theta_c \\approx 1° \\times \\frac{1\\ \\text{keV}}{E} = 1° \\times \\frac{1}{${E}} = ${angle.toFixed(
          2,
        )}° = ${arcmin.toFixed(1)}'`,
      ],
      note: `An X-ray struck head-on plows into a mirror and is absorbed — it will only "skip" off a surface hit nearly edge-on, like a stone grazing water. At ${E} keV that means within ${angle.toFixed(
        2,
      )}° of the surface, so an X-ray mirror is a long, nearly-cylindrical barrel, not a dish — and to gather enough of the scarce X-rays, dozens of shells are nested inside one another (Chandra's Wolter optics, polished to atomic smoothness for 0.5″ vision). Higher energies graze shallower, which is why hard X-rays are so hard to focus — and gamma rays cannot be focused at all.`,
    };
  },

  // ── The great collectors — aperture and the sag wall ──────────────────────

  "light-gathering": (rng) => {
    const scopes = [
      { name: "the human eye", D: 0.007 },
      { name: "Galileo's telescope", D: 0.04 },
      { name: "the Hale 200-inch", D: 5.08 },
      { name: "a Keck telescope", D: 10 },
    ];
    const i = sample(rng, [0, 1, 2, 3], 1)[0];
    const big = sample(rng, [10, 39], 1)[0]; // Keck or ELT
    const small = scopes[i];
    const bigName = big === 39 ? "the ELT" : "a Keck telescope";
    // avoid comparing Keck to Keck
    const sm = small.name === "a Keck telescope" && big === 10 ? scopes[2] : small;
    const ratio = (big / sm.D) ** 2;
    const mags = 2.5 * Math.log10(ratio);
    return {
      title: "Aperture is king: light-gathering",
      question: `A telescope's collecting area scales as D². How many times more light does ${bigName} (${big} m) gather than ${sm.name} (${sm.D} m)?`,
      steps: [
        `\\frac{A_{\\text{big}}}{A_{\\text{small}}} = \\left(\\frac{D_{\\text{big}}}{D_{\\text{small}}}\\right)^2 = \\left(\\frac{${big}}{${sm.D}}\\right)^2 = ${
          ratio >= 1e4 ? sci(ratio, 1) : Math.round(ratio).toLocaleString("en-US")
        }\\times`,
        `\\text{depth gain} = 2.5\\log_{10}(${
          ratio >= 1e4 ? sci(ratio, 1) : Math.round(ratio)
        }) = ${mags.toFixed(1)}\\ \\text{magnitudes fainter}`,
      ],
      note: `Double the diameter, quadruple the light; ten times the diameter, a hundred times the light. Because detection is a matter of collecting enough photons (the photon economy), ${bigName} can reach objects ~${
        ratio >= 1e4 ? sci(ratio, 1).replace("\\times10^{", "×10^").replace("}", "") : Math.round(ratio).toLocaleString("en-US")
      }× fainter than ${sm.name} in the same exposure — ${mags.toFixed(
        1,
      )} magnitudes deeper. Every jump in aperture is a jump into the faint, distant, early universe. Aperture is the currency that buys faintness.`,
    };
  },

  "mirror-sag-mass": (rng) => {
    const D = sample(rng, [8, 10, 20, 39], 1)[0]; // target diameter, m
    const D0 = 5.08; // Hale
    const m0 = 14.5; // tonnes
    const massRatio = (D / D0) ** 3; // rigid mirror mass ∝ D³
    const mass = m0 * massRatio;
    const sagRatio = (D / D0) ** 4; // sag ∝ D⁴ at fixed thickness
    return {
      title: "The sag wall: why a rigid giant is impossible",
      question: `A rigid mirror's droop scales as D⁴ and, once thickened to stay stiff, its mass as D³. The Hale mirror is ${D0} m and 14.5 tonnes. Scale that design to ${D} m: how much would it sag, and weigh?`,
      steps: [
        `\\text{sag} \\propto D^4:\\ \\left(\\tfrac{${D}}{${D0}}\\right)^4 = ${sagRatio.toFixed(
          sagRatio < 100 ? 1 : 0,
        )}\\times\\ \\text{worse (at fixed thickness)}`,
        `\\text{mass} \\propto D^3:\\ 14.5\\times\\left(\\tfrac{${D}}{${D0}}\\right)^3 = ${
          mass >= 1000 ? Math.round(mass).toLocaleString("en-US") : mass.toFixed(0)
        }\\ \\text{tonnes}`,
      ],
      note: `${
        mass > 1000
          ? `${Math.round(mass).toLocaleString("en-US")} tonnes — as much as a warship. `
          : `${mass.toFixed(0)} tonnes. `
      }You cannot cast it (14.5 tonnes already took 8 months to cool without cracking), support it, or slew it across the sky. Fighting the D⁴ sag by thickening the glass drives the mass up as D³, and the mass wins — so the rigid-mirror paradigm dies near 5–8 m. The escape isn't a better rigid mirror; it's abandoning rigidity: a thin actively-controlled meniscus, or a mosaic of small hexagonal segments.`,
    };
  },

  "aperture-depth": (rng) => {
    const D1 = sample(rng, [1, 2, 4], 1)[0];
    const D2 = sample(rng, [8, 10, 39], 1)[0];
    const areaRatio = (D2 / D1) ** 2;
    const mags = 2.5 * Math.log10(areaRatio);
    return {
      title: "Aperture and limiting magnitude",
      question: `The faintest detectable object improves by 2.5 magnitudes for every factor of 100 in collected photons. How many magnitudes deeper does a ${D2} m telescope reach than a ${D1} m one (same exposure)?`,
      steps: [
        `\\text{light ratio} = (D_2/D_1)^2 = (${D2}/${D1})^2 = ${Math.round(areaRatio).toLocaleString(
          "en-US",
        )}\\times`,
        `\\Delta m = 2.5\\log_{10}(${Math.round(areaRatio).toLocaleString("en-US")}) = ${mags.toFixed(
          2,
        )}\\ \\text{magnitudes deeper}`,
      ],
      note: `Doubling the diameter is worth exactly 2.5·log₁₀(4) = 1.5 magnitudes of depth — and each 1.5 magnitudes roughly doubles the volume of space (and the number of objects) within reach. That is why the four-century quest for aperture never stopped: every factor of 2 in mirror size is a large, permanent expansion of the observable universe. (On the ground the resolution payoff, θ = 1.22λ/D, is stolen by seeing unless adaptive optics recovers it — but light-gathering is always realized.)`,
    };
  },
  // ── Space telescopes (building-jwst) ──
  "redshift-band": (rng) => {
    const lines = [
      { name: "Lyman-α", rest: 121.6 },
      { name: "the 4000-Å break", rest: 400 },
      { name: "Hα", rest: 656.3 },
    ];
    const li = sample(rng, [0, 1, 2], 1)[0];
    const z = sample(rng, [7, 8, 9, 10, 11, 13], 1)[0];
    const line = lines[li];
    const obs = line.rest * (1 + z); // nm
    const obsUm = obs / 1000;
    const past = obs > 1700;
    return {
      title: "Redshift into the infrared",
      question: `Cosmic expansion stretches every wavelength by a factor (1 + z). At what wavelength is ${line.name} (rest ${line.rest} nm) observed if it comes from a galaxy at z = ${z}? Hubble's reach ends near 1.7 µm.`,
      steps: [
        `\\lambda_{\\text{obs}} = \\lambda_{\\text{rest}}(1+z) = ${line.rest}\\,\\text{nm}\\times(1+${z}) = ${Math.round(
          obs,
        ).toLocaleString("en-US")}\\,\\text{nm} = ${obsUm.toFixed(2)}\\,\\mu\\text{m}`,
      ],
      note: `${obsUm.toFixed(2)} µm — ${
        past
          ? "well past Hubble's ~1.7 µm cutoff, so only an infrared telescope like JWST can see it"
          : "still within reach of Hubble's near-infrared channel"
      }. This is the first link in JWST's forced-design chain: to see the early universe you must build an infrared telescope, and everything else — the cold, L2, the sunshield, the folding — follows from that one redshift.`,
    };
  },

  "wien-selfglow": (rng) => {
    const T = sample(rng, [40, 80, 150, 300], 1)[0];
    const peak = 2.898e6 / T; // nm
    const peakUm = peak / 1000;
    const inBand = peakUm >= 0.6 && peakUm <= 28;
    return {
      title: "Why the telescope must be cold",
      question: `A warm telescope glows with its own thermal light. By Wien's law, at what wavelength does a telescope at ${T} K peak? JWST's infrared science band runs about 0.6–28 µm.`,
      steps: [
        `\\lambda_{\\text{peak}} = \\frac{b}{T} = \\frac{2.898\\times10^{6}\\,\\text{nm·K}}{${T}\\,\\text{K}} = ${Math.round(
          peak,
        ).toLocaleString("en-US")}\\,\\text{nm} = ${peakUm.toFixed(1)}\\,\\mu\\text{m}`,
      ],
      note: `${peakUm.toFixed(1)} µm — ${
        inBand
          ? "squarely inside JWST's science band, so the telescope's own glow would drown the faint infrared it is trying to see"
          : "outside the science band, cold enough that its self-glow no longer swamps the signal"
      }. A room-temperature (300 K) telescope peaks at 9.7 µm, right where JWST works, which is why it must be chilled to about 40 K. Infrared forces cold; cold forces the sunshield and L2.`,
    };
  },

  "jwst-resolution": (rng) => {
    const lamUm = sample(rng, [0.7, 2, 4, 10], 1)[0];
    const lam = lamUm * 1e-6;
    const D = 6.5;
    const thetaRad = (1.22 * lam) / D;
    const thetaAs = thetaRad * 206265;
    return {
      title: "JWST's diffraction-limited sharpness",
      question: `Above the atmosphere a telescope reaches its full diffraction limit, θ = 1.22 λ/D, with no seeing to blur it. What is JWST's resolution (6.5 m mirror) at ${lamUm} µm?`,
      steps: [
        `\\theta = \\frac{1.22\\,\\lambda}{D} = \\frac{1.22\\times ${sci(lam, 2)}\\,\\text{m}}{6.5\\,\\text{m}} = ${sci(
          thetaRad,
          2,
        )}\\,\\text{rad}`,
        `\\theta = ${sci(thetaRad, 2)}\\times 206265 = ${thetaAs.toFixed(3)}\\,\\text{arcsec}`,
      ],
      note: `About ${thetaAs.toFixed(
        2,
      )} arcsec at ${lamUm} µm — sharpness set purely by the optics, no atmosphere to blur it and no adaptive optics needed. Longer wavelengths give coarser resolution (θ ∝ λ), one price of working in the infrared, which JWST buys back with its large 6.5 m aperture.`,
    };
  },

  // ── Hubble & interferometry (hubble-and-interferometry) ──
  "aberration-tolerance": (rng) => {
    const lamNm = sample(rng, [500, 550, 633], 1)[0];
    const errUm = sample(rng, [1.0, 1.5, 2.2, 3.0], 1)[0];
    const tolNm = lamNm / 20;
    const errNm = errUm * 1000;
    const times = errNm / tolNm;
    return {
      title: "How badly was the mirror wrong?",
      question: `A telescope mirror must hold its shape to about λ/20 or the image blurs. At ${lamNm} nm, how large is that tolerance — and how many times over it was Hubble's ${errUm}-µm figuring error?`,
      steps: [
        `\\text{tolerance} = \\lambda/20 = ${lamNm}/20 = ${tolNm.toFixed(1)}\\,\\text{nm}`,
        `\\frac{\\text{error}}{\\text{tolerance}} = \\frac{${errNm.toLocaleString(
          "en-US",
        )}\\,\\text{nm}}{${tolNm.toFixed(1)}\\,\\text{nm}} = ${Math.round(times)}\\times`,
      ],
      note: `About ${Math.round(
        times,
      )} times the allowable error. Notice how tiny the absolute number is — ${errUm} µm is roughly one-fiftieth the width of a human hair — yet where surfaces must be true to a fraction of a wavelength it is a catastrophe. The mirror was ground to that precision to match a measuring instrument that was itself 1.3 mm out of adjustment. The glass was perfect; the organization was not.`,
    };
  },

  "interferometry-resolution": (rng) => {
    const Bkm = sample(rng, [100, 1000, 6000, 12700], 1)[0];
    const B = Bkm * 1000;
    const lam = 1.3e-3;
    const thetaRad = (1.22 * lam) / B;
    const uas = thetaRad * 206265 * 1e6;
    return {
      title: "Resolution from the baseline",
      question: `An interferometer's resolution is θ ≈ 1.22 λ/B, where B is the separation of the dishes, not the size of any one. Observing at 1.3 mm with a baseline of ${Bkm.toLocaleString(
        "en-US",
      )} km, what resolution do you get? (M87*'s shadow is ~42 µas.)`,
      steps: [
        `\\theta = \\frac{1.22\\,\\lambda}{B} = \\frac{1.22\\times ${sci(lam, 1)}\\,\\text{m}}{${sci(
          B,
          2,
        )}\\,\\text{m}} = ${sci(thetaRad, 2)}\\,\\text{rad}`,
        `\\theta = ${sci(thetaRad, 2)}\\times 206265\\times 10^{6} = ${Math.round(uas).toLocaleString(
          "en-US",
        )}\\,\\mu\\text{as}`,
      ],
      note: `About ${Math.round(uas).toLocaleString("en-US")} µas — ${
        uas <= 42
          ? "fine enough to resolve M87*'s 42-µas shadow"
          : "still coarser than the 42-µas shadow, so you need a longer baseline"
      }. The sharpness comes from the ${Bkm.toLocaleString(
        "en-US",
      )} km separation, not from the size of any dish: spread the telescopes farther apart and the image sharpens, as if you had a mirror as wide as the gap between them.`,
    };
  },

  "single-dish-diameter": (rng) => {
    const uas = sample(rng, [20, 42, 50], 1)[0];
    const thetaRad = uas / 1e6 / 206265;
    const lam = 1.3e-3;
    const D = (1.22 * lam) / thetaRad; // m
    const Dkm = D / 1000;
    return {
      title: "The impossible single dish",
      question: `To reach a resolution of ${uas} µas at 1.3 mm with one dish, how big must it be? Invert θ = 1.22 λ/D.`,
      steps: [
        `\\theta = ${uas}\\,\\mu\\text{as} = \\frac{${uas}}{10^{6}\\times 206265}\\,\\text{rad} = ${sci(
          thetaRad,
          2,
        )}\\,\\text{rad}`,
        `D = \\frac{1.22\\,\\lambda}{\\theta} = \\frac{1.22\\times ${sci(lam, 1)}}{${sci(
          thetaRad,
          2,
        )}} = ${sci(D, 2)}\\,\\text{m} \\approx ${Math.round(Dkm).toLocaleString("en-US")}\\,\\text{km}`,
      ],
      note: `About ${Math.round(Dkm).toLocaleString(
        "en-US",
      )} km across — the size of a continent or the whole planet. You cannot build a single mirror that big, which is exactly why interferometry exists: combine widely separated dishes so their baseline plays the role of D, synthesizing the resolution of an aperture no one could ever cast.`,
    };
  },
  // ── The human as payload (human-as-payload) ──
  "consumables-mass": (rng) => {
    const crew = sample(rng, [3, 4, 6], 1)[0];
    const days = sample(rng, [10, 180, 500, 1000], 1)[0];
    const kg = crew * days * 5;
    const t = kg / 1000;
    return {
      title: "The consumables explosion",
      question: `A person in space needs about 5 kg of consumables (oxygen, water, food) per day. How much must a crew of ${crew} carry for a ${days}-day mission with no recycling?`,
      steps: [
        `M = 5\\,\\tfrac{\\text{kg}}{\\text{person·day}}\\times ${crew}\\,\\text{crew}\\times ${days}\\,\\text{days} = ${kg.toLocaleString(
          "en-US",
        )}\\,\\text{kg} = ${t.toLocaleString("en-US", { maximumFractionDigits: 1 })}\\,\\text{tonnes}`,
      ],
      note: `${t.toFixed(1)} tonnes${
        days >= 1000
          ? " — comparable to the entire dry mass of a substantial spacecraft, burned just to keep the crew breathing, drinking, and eating"
          : ""
      }. Because this mass is consumed every day, it grows with crew × days, and duration is the enemy: a Mars-length trip is ~100× the days of an Apollo one. A robot's power is a fixed one-time mass; a human's rations must be supplied continuously — which is why long missions must recycle.`,
    };
  },

  "return-stacking": (rng) => {
    const dv = sample(rng, [3000, 4000, 5000], 1)[0];
    const ve = 3400;
    const R = Math.exp(dv / ve);
    const R2 = R * R;
    return {
      title: "The return penalty stacks",
      question: `The rocket equation gives a mass ratio e^(Δv/v_e), with v_e ≈ 3,400 m/s. A round trip carries the return propellant out with it, so a ${dv.toLocaleString(
        "en-US",
      )} m/s leg is effectively paid twice. Find the single-leg ratio and the compounded round-trip ratio.`,
      steps: [
        `R = e^{\\Delta v/v_e} = e^{${dv}/3400} = ${R.toFixed(2)}`,
        `R_{\\text{round}} \\approx R\\times R = ${R.toFixed(2)}^2 = ${R2.toFixed(1)}`,
      ],
      note: `One leg needs ${R.toFixed(
        1,
      )} kg of stack per kg delivered; carrying the return capability out with you compounds that to about ${R2.toFixed(
        0,
      )}× — the return trip is many times harder, not twice, because the rocket equation is exponential and multiplicative. This is why "every kilogram home costs many kilograms out," why Mars (a deeper well) is far worse than the Moon, and why making propellant at the destination (ISRU) is the only way to make crewed return tractable.`,
    };
  },

  "recycling-savings": (rng) => {
    const crew = sample(rng, [3, 4, 6], 1)[0];
    const days = sample(rng, [180, 500, 1000], 1)[0];
    const recov = sample(rng, [0.9, 0.93, 0.98], 1)[0];
    const open = 3.5 * crew * days;
    const closed = open * (1 - recov);
    const saved = open - closed;
    return {
      title: "What recycling saves",
      question: `A crew of ${crew} needs 3.5 kg of water per person per day over ${days} days. How much water must be launched with ${Math.round(
        recov * 100,
      )}% recovery, versus none — and how much is saved?`,
      steps: [
        `\\text{open loop} = 3.5\\times ${crew}\\times ${days} = ${open.toLocaleString("en-US")}\\,\\text{kg}`,
        `\\text{with recovery} = ${open.toLocaleString("en-US")}\\times(1-${recov}) = ${Math.round(
          closed,
        ).toLocaleString("en-US")}\\,\\text{kg},\\quad \\text{saved} = ${Math.round(saved).toLocaleString(
          "en-US",
        )}\\,\\text{kg}`,
      ],
      note: `Recycling turns ${(open / 1000).toFixed(1)} tonnes of water into ${(closed / 1000).toFixed(
        2,
      )} tonnes, saving ${(saved / 1000).toFixed(
        1,
      )} tonnes. The recycler is a fixed one-time mass while un-recycled consumables grow with duration, so the longer the mission the more decisively recycling wins. Food, though, cannot be recovered — every calorie is launched — so once the water and air loops are closed it comes to dominate what remains.`,
    };
  },
  // ── The body in space (physiology-load) ──
  "bone-loss": (rng) => {
    const months = sample(rng, [6, 12, 30], 1)[0];
    const rate = 1.5; // %/month, weight-bearing bone
    const lost = rate * months;
    const factor = (rate * 12) / 0.75; // vs 0.75%/yr osteoporosis
    return {
      title: "The dissolving skeleton",
      question: `In weightlessness, unloaded weight-bearing bone dissolves at about 1.5% per month (Wolff's law). Uncorrected, how much is lost over a ${months}-month mission, and how does the rate compare with earthly osteoporosis (~0.75% per year)?`,
      steps: [
        `\\text{lost} = 1.5\\,\\tfrac{\\%}{\\text{month}}\\times ${months}\\,\\text{months} = ${lost.toFixed(0)}\\%`,
        `\\frac{1.5\\%/\\text{mo}\\times 12}{0.75\\%/\\text{yr}} = \\frac{18\\%/\\text{yr}}{0.75\\%/\\text{yr}} = ${factor.toFixed(0)}\\times \\text{ faster}`,
      ],
      note: `${lost.toFixed(0)}% of the weight-bearing skeleton, at roughly ${factor.toFixed(
        0,
      )}× the pace of the worst earthly bone disease — a postmenopausal year compressed into a month. Over a ~30-month Mars trip that reaches ~45% uncorrected (~30% even with daily exercise). The freed calcium risks kidney stones far from any hospital, and much of the loss is permanent: even "recovered" bone comes back with weaker internal architecture.`,
    };
  },

  "artificial-gravity": (rng) => {
    const rpm = sample(rng, [1.5, 2, 3, 4], 1)[0];
    const g = 9.81;
    const omega = (rpm * 2 * Math.PI) / 60;
    const r = g / omega ** 2;
    return {
      title: "The centrifuge that cures everything",
      question: `Artificial gravity from spinning a spacecraft obeys a = ω²r. To produce a full 1 g at ${rpm} rpm, what radius is needed? (The inner ear tolerates only about 2 rpm before Coriolis sickness.)`,
      steps: [
        `\\omega = ${rpm}\\,\\text{rpm}\\times\\frac{2\\pi}{60} = ${omega.toFixed(3)}\\,\\text{rad/s}`,
        `r = \\frac{g}{\\omega^2} = \\frac{9.81}{${omega.toFixed(3)}^2} = ${Math.round(r).toLocaleString(
          "en-US",
        )}\\,\\text{m}`,
      ],
      note: `About ${Math.round(r).toLocaleString("en-US")} m${
        rpm <= 2
          ? " — a rotating structure hundreds of metres across, far beyond anything ever launched"
          : ", and though that radius is smaller, " + rpm + " rpm is above the ~2 rpm comfort limit, so the crew would be sick from Coriolis forces"
      }. Artificial gravity is the only countermeasure that would fix bone, muscle, heart, fluid, and eyes at once — yet the trap (comfortable means enormous, compact means sickening) is why no spacecraft has ever flown a centrifuge.`,
    };
  },

  "plasma-shift": (rng) => {
    const base = sample(rng, [4.8, 5.0, 5.2], 1)[0]; // L of blood
    const drop = sample(rng, [10, 12, 15], 1)[0]; // % lost
    const lostL = base * (drop / 100);
    const left = base - lostL;
    return {
      title: "The blood the body throws away",
      question: `In freefall ~2 L of fluid shifts headward; the body's pressure sensors misread this as overload and shed ${drop}% of blood volume. Starting from ${base} L, how much blood volume is lost, and what remains?`,
      steps: [
        `\\text{lost} = ${base}\\,\\text{L}\\times ${drop}\\% = ${lostL.toFixed(2)}\\,\\text{L}`,
        `\\text{remaining} = ${base} - ${lostL.toFixed(2)} = ${left.toFixed(2)}\\,\\text{L}`,
      ],
      note: `The body discards about ${lostL.toFixed(
        2,
      )} L of blood volume it will desperately need later. With no gravity to pump against, the heart also deconditions and rounds — so on return, the reduced volume and a weakened heart together leave the astronaut unable to stand: blood pools in the legs and the brain is starved (orthostatic intolerance). The fluid shift is the hub from which the heart, the balance system, and even the eyeball's shape all go wrong.`,
    };
  },
  // ── Radiation, and the wall (radiation) ──
  "radiation-dose": (rng) => {
    const oneWay = sample(rng, [4, 6, 8], 1)[0];
    const rate = 1.8; // mSv/day, deep space
    const surface = 350; // mSv
    const career = 600; // mSv
    const transit = 2 * oneWay * 30.44 * rate;
    const total = transit + surface;
    const pct = (total / career) * 100;
    return {
      title: "A career's dose in one trip",
      question: `Curiosity's RAD instrument measured ~1.8 mSv/day in deep space. For a Mars mission with a ${oneWay}-month transit each way plus ~350 mSv on the surface, what total dose does a crew accumulate — against a ~600 mSv career limit?`,
      steps: [
        `\\text{transit} = 2\\times ${oneWay}\\,\\text{mo}\\times 30.44\\,\\tfrac{\\text{day}}{\\text{mo}}\\times 1.8\\,\\tfrac{\\text{mSv}}{\\text{day}} = ${Math.round(
          transit,
        ).toLocaleString("en-US")}\\,\\text{mSv}`,
        `\\text{total} = ${Math.round(transit).toLocaleString("en-US")} + 350 = ${Math.round(
          total,
        ).toLocaleString("en-US")}\\,\\text{mSv} = ${Math.round(pct)}\\%\\text{ of the career limit}`,
      ],
      note: `About ${Math.round(total).toLocaleString("en-US")} mSv — ${
        total > career ? Math.round(pct - 100) + "% OVER a whole career's allowance in a single mission" : "most of a career's allowance in one mission"
      }. The dose is a rate, so it is set by time exposed: the only countermeasure that scales is to go faster, which hands the radiation problem back to propulsion. A nuclear engine that shortens the trip is, in effect, a medical device.`,
    };
  },

  "cancer-risk": (rng) => {
    const dose = sample(rng, [330, 660, 1000], 1)[0]; // mSv
    const doseSv = dose / 1000;
    const perSv = 5; // % excess fatal cancer per sievert
    const risk = doseSv * perSv;
    return {
      title: "Turning dose into risk",
      question: `A biologically-weighted dose of ${dose} mSv is received on a mission. Using the rough rule of ~5% excess lifetime fatal-cancer risk per sievert, what excess risk does it imply?`,
      steps: [
        `${dose}\\,\\text{mSv} = ${doseSv.toFixed(2)}\\,\\text{Sv}`,
        `\\text{excess risk} = 5\\%\\times ${doseSv.toFixed(2)} = ${risk.toFixed(1)}\\%`,
      ],
      note: `About a ${risk.toFixed(
        1,
      )}% increase in lifetime fatal-cancer risk — a real, quantifiable price paid by every crew member, on top of the acute danger of any solar storm. And the sievert is already biologically weighted: the heavy galactic-cosmic-ray nuclei are counted up to ~20× as damaging per unit energy as X-rays, which is why a modest energy deposition becomes a career's worth of risk. Radiation cannot be built away, only reduced and then accepted.`,
    };
  },

  "faster-safer": (rng) => {
    const from = sample(rng, [8, 9], 1)[0];
    const to = sample(rng, [3, 4], 1)[0];
    const rate = 1.8;
    const dFrom = from * 30.44 * rate;
    const dTo = to * 30.44 * rate;
    const saved = dFrom - dTo;
    return {
      title: "Faster travel is safer travel",
      question: `The galactic-cosmic-ray dose is proportional to time in deep space. If better propulsion cuts a one-way transit from ${from} months to ${to} months (at ~1.8 mSv/day), how much transit dose is saved per leg?`,
      steps: [
        `d_{${from}} = ${from}\\times 30.44\\times 1.8 = ${Math.round(dFrom)}\\,\\text{mSv},\\quad d_{${to}} = ${to}\\times 30.44\\times 1.8 = ${Math.round(dTo)}\\,\\text{mSv}`,
        `\\text{saved per leg} = ${Math.round(dFrom)} - ${Math.round(dTo)} = ${Math.round(saved)}\\,\\text{mSv}`,
      ],
      note: `Roughly ${Math.round(
        saved,
      )} mSv saved on each leg — because dose scales with time, cutting the transit by ${(
        (1 - to / from) *
        100
      ).toFixed(
        0,
      )}% cuts the transit dose by the same fraction. There is no shield that scales against the galactic bombardment, so spending less time out there is the strongest lever we have. That is why radiation is partly a propulsion problem, and why the engine cancelled in 1973 was, in effect, a piece of medical equipment.`,
    };
  },
  // ── Life Support: Closing the Loop (life-support) ──
  "water-recycling": (rng) => {
    const crew = sample(rng, [3, 4, 6], 1)[0];
    const days = sample(rng, [500, 780, 1000], 1)[0];
    const perDay = 3.5; // kg water per person per day
    const rec = 0.9; // 90% recovery
    const open = crew * days * perDay;
    const resupplyDay = crew * perDay * (1 - rec);
    const resupply = resupplyDay * days;
    return {
      title: "Water: the loop that closes tightest",
      question: `Water is the crew's largest need by mass, ~3.5 kg per person per day. For a crew of ${crew} on a ${days}-day mission, how much water must be carried open-loop — and how much if the recycling system recovers 90%?`,
      steps: [
        `\\text{open} = ${crew}\\times ${days}\\times 3.5 = ${Math.round(open).toLocaleString("en-US")}\\,\\text{kg} \\approx ${(open / 1000).toFixed(1)}\\,\\text{t}`,
        `\\text{resupply} = ${crew}\\times 3.5\\times (1-0.9)\\times ${days} = ${Math.round(resupply).toLocaleString("en-US")}\\,\\text{kg}`,
      ],
      note: `Open-loop that is ${(open / 1000).toFixed(1)} tonnes of water — prohibitive to launch. Recycling 90% collapses it to about ${Math.round(resupply).toLocaleString("en-US")} kg, a tenfold cut. Water closes so well because recycling it is purification, not transformation: you only separate the water from its contaminants. That is why "today's coffee is tomorrow's coffee" — exactly what the Earth has always done with every drop, just run in days instead of eons.`,
    };
  },

  "oxygen-loop": (rng) => {
    const crew = sample(rng, [1, 3, 4], 1)[0];
    const o2 = 0.84; // kg O2 per person per day
    const perO2Water = 1.12; // kg water electrolyzed per kg O2 (2H2O -> 2H2 + O2, by mass ~1.125)
    const water = crew * o2 * perO2Water;
    const sabatier = 0.5; // fraction of O2 recovered by closing the loop
    return {
      title: "Turning the oxygen problem into a water problem",
      question: `Each crew member consumes ~0.84 kg of O₂ a day, made by electrolysing water (2H₂O → 2H₂ + O₂; ~1.12 kg of water per kg of O₂). For a crew of ${crew}, how much water must be split per day — and what does the Sabatier reaction change?`,
      steps: [
        `\\text{water/day} = ${crew}\\times 0.84\\times 1.12 = ${water.toFixed(2)}\\,\\text{kg}`,
        `\\text{CO}_2 + 4\\,\\text{H}_2 \\rightarrow \\text{CH}_4 + 2\\,\\text{H}_2\\text{O}\\ \\Rightarrow\\ \\text{recovers} \\approx ${Math.round(sabatier * 100)}\\%\\text{ of the O}_2`,
      ],
      note: `About ${water.toFixed(2)} kg of water electrolysed a day for ${crew === 1 ? "one crew member" : `${crew} crew`}. Electrolysis converts the oxygen problem into a water problem — and water is already recycled at 90%+, so oxygen comes from a resource you regenerate anyway. Sabatier then recombines the exhaled CO₂ with the electrolysis hydrogen to recover water, closing the air loop to ~50%; the rest escapes because the carbon leaves as vented methane, carrying oxygen atoms with it.`,
    };
  },

  "loop-closure": (rng) => {
    const crew = sample(rng, [3, 4, 6], 1)[0];
    const water = 3.5, oxy = 0.84, food = 0.66; // kg/person/day
    const open = water + oxy + food; // ~5
    const closed = water * 0.1 + oxy * 0.5 + food; // 90% water, 50% O2, food open
    const openCrew = open * crew;
    const closedCrew = closed * crew;
    const cut = (1 - closed / open) * 100;
    return {
      title: "The payoff: what closing the loops saves",
      question: `Open-loop life support runs ~5 kg per person per day (3.5 water + 0.84 O₂ + 0.66 food). If water is 90% recycled and oxygen 50% recycled but food stays open, what is the new daily resupply for a crew of ${crew}, and by how much is it cut?`,
      steps: [
        `\\text{per person} = 3.5(0.1) + 0.84(0.5) + 0.66 = ${closed.toFixed(2)}\\,\\text{kg/day}`,
        `\\text{crew of }${crew}:\\ ${crew}\\times ${closed.toFixed(2)} = ${closedCrew.toFixed(1)}\\,\\text{kg/day}\\ \\ (\\text{vs }${openCrew.toFixed(1)}\\text{ open}),\\ \\ -${Math.round(cut)}\\%`,
      ],
      note: `Closing water and oxygen drops resupply from ${open.toFixed(2)} to ${closed.toFixed(2)} kg per person per day — about a ${Math.round(cut)}% cut. Notice what now dominates the remainder: food, at 0.66 kg, is the largest surviving term, because no machine can make it. That is why the food loop — closeable only by bringing living plants aboard — is the next frontier, and why life support is the difference between visiting space and living there.`,
    };
  },
  // ── Mission Architecture: How You Actually Get There and Back (mission-architecture) ──
  "mass-ratio": (rng) => {
    const dv = sample(rng, [1900, 2000, 2400, 3100], 1)[0];
    const ve = sample(rng, [3000, 3050, 3100], 1)[0];
    const r = Math.exp(dv / ve);
    const propFrac = (1 - 1 / r) * 100;
    return {
      title: "The rocket equation, one maneuver at a time",
      question: `A maneuver needs a velocity change of ${dv.toLocaleString("en-US")} m/s, using an engine whose exhaust velocity is ${ve.toLocaleString("en-US")} m/s. What mass ratio does the rocket equation demand — how many kilograms of fuelled vehicle per kilogram left after the burn?`,
      steps: [
        `\\frac{m_0}{m_f} = e^{\\Delta v / v_e} = e^{${dv}/${ve}} = e^{${(dv / ve).toFixed(3)}} = ${r.toFixed(2)}`,
        `\\text{propellant fraction} = 1 - \\tfrac{1}{${r.toFixed(2)}} = ${propFrac.toFixed(0)}\\%`,
      ],
      note: `A mass ratio of ${r.toFixed(2)} — every kilogram you want left after the burn needs ${r.toFixed(2)} kg on the pad, so ${propFrac.toFixed(0)}% of the vehicle is just propellant for this one maneuver. This is the multiplier that makes landed-and-returned mass so expensive: a payload that must be both landed and launched back pays this ratio twice over, once for descent and once for ascent.`,
    };
  },

  "landed-cascade": (rng) => {
    const payload = sample(rng, [1, 2, 4], 1)[0]; // t returned from the surface
    const rAsc = Math.exp(1900 / 3050); // ~1.86
    const rDesc = Math.exp(2000 / 3050); // ~1.93
    const rLoi = Math.exp(800 / 3050); // ~1.30
    const surface = payload * rAsc;
    const llo = surface * rDesc;
    const approach = llo * rLoi;
    return {
      title: "Why landed-and-returned mass compounds",
      question: `You want to return ${payload} t from the lunar surface to lunar orbit. With an ascent ratio of 1.86, a descent ratio of 1.93, and a lunar-orbit-insertion ratio of 1.30, how much mass must reach low lunar orbit before descent — and how much must approach the Moon?`,
      steps: [
        `\\text{on surface at ascent} = ${payload}\\times 1.86 = ${surface.toFixed(1)}\\,\\text{t}`,
        `\\text{in lunar orbit before descent} = ${surface.toFixed(1)}\\times 1.93 = ${llo.toFixed(1)}\\,\\text{t}`,
        `\\text{approaching the Moon} = ${llo.toFixed(1)}\\times 1.30 = ${approach.toFixed(1)}\\,\\text{t}`,
      ],
      note: `Returning just ${payload} t from the surface takes ${llo.toFixed(1)} t in lunar orbit and ${approach.toFixed(1)} t approaching the Moon — and each of those still had to be sent from Earth and launched off it, multiplying again. That is the compounding cascade: every kilogram you insist on landing and returning costs several kilograms in lunar orbit and a large multiple more on the pad. Leave the heavy return vehicle in orbit (lunar-orbit rendezvous) and you spare it this entire multiplication.`,
    };
  },

  "dv-budget": (rng) => {
    const launch = sample(rng, [9300, 9400, 9500], 1)[0];
    const legs = [launch, 3100, 800, 2000, 1900, 1000];
    const total = legs.reduce((a, b) => a + b, 0);
    const frac = (launch / total) * 100;
    return {
      title: "Reading the Δv ledger",
      question: `Add up the Apollo Δv budget: launch to low Earth orbit ${launch.toLocaleString("en-US")}, trans-lunar injection 3,100, lunar-orbit insertion 800, descent 2,000, ascent 1,900, and trans-earth injection 1,000 m/s. What is the total, and what share is just getting off the Earth?`,
      steps: [
        `\\text{total} = ${launch} + 3100 + 800 + 2000 + 1900 + 1000 = ${total.toLocaleString("en-US")}\\,\\text{m/s}`,
        `\\text{launch share} = ${launch}/${total.toLocaleString("en-US")} = ${frac.toFixed(0)}\\%`,
      ],
      note: `About ${total.toLocaleString("en-US")} m/s in all, of which launch alone is ${frac.toFixed(0)}% — more than the entire round trip to the surface and back combined. That is why "low Earth orbit is halfway to anywhere." And notice the line that isn't there: braking back into Earth's atmosphere at ~11 km/s costs no propellant, because the atmosphere donates that deceleration for free — the same gift that makes aerobraking so valuable at Mars.`,
    };
  },
  // ── Risk, Failure, and Organizations (risk-and-organizations) ──
  "risk-gap": (rng) => {
    const mgmt = 100000; // "1 in mgmt" per flight, management estimate
    const eng = sample(rng, [100, 200], 1)[0]; // "1 in eng", engineers
    const losses = 2, flights = 135; // the real Shuttle record
    const actual = flights / losses; // "1 in actual"
    const gap = mgmt / eng;
    const mgmtOff = mgmt / actual;
    const engOff = actual / eng;
    return {
      title: "The gap in the numbers is the gap in the culture",
      question: `NASA management put the chance of losing a Shuttle at about 1 in ${mgmt.toLocaleString("en-US")} per flight; the engineers put it near 1 in ${eng}. The real record was ${losses} losses in ${flights} flights. How far apart were management and engineers, and which was closer to reality?`,
      steps: [
        `\\text{belief gap} = \\frac{1/${eng}}{1/${mgmt.toLocaleString("en-US")}} = ${gap.toLocaleString("en-US")}\\times`,
        `\\text{reality} = \\frac{${losses}}{${flights}} \\approx \\tfrac{1}{${Math.round(actual)}};\\quad \\text{management off by } {\\sim}${Math.round(mgmtOff).toLocaleString("en-US")}\\times,\\ \\text{engineers off by } {\\sim}${engOff.toFixed(1)}\\times`,
      ],
      note: `Management believed the vehicle was about ${gap.toLocaleString("en-US")}× safer than its own engineers did — and reality (~1 in ${Math.round(actual)}) sided with the engineers, who were off by less than a factor of two while management was off by roughly ${Math.round(mgmtOff).toLocaleString("en-US")}×. An organization whose leadership thinks its machine is a thousand times safer than the people who built it will under-weight every warning and be shocked by the disaster the engineers saw coming. Feynman's point: the number gap is the culture gap, made measurable.`,
    };
  },

  "program-losses": (rng) => {
    const flights = sample(rng, [50, 135, 250], 1)[0];
    const pEng = 1 / 100;
    const pMgmt = 1 / 100000;
    const eEng = flights * pEng;
    const eMgmt = flights * pMgmt;
    return {
      title: "Per-flight odds become program losses",
      question: `A per-flight risk is small, but a program flies many times. Over ${flights} flights, how many catastrophic losses are expected at the engineers' ~1-in-100 estimate versus management's ~1-in-100,000?`,
      steps: [
        `\\text{engineers: } ${flights}\\times \\tfrac{1}{100} = ${eEng.toFixed(2)}\\text{ losses}`,
        `\\text{management: } ${flights}\\times \\tfrac{1}{100000} = ${eMgmt.toFixed(4)}\\text{ losses}`,
      ],
      note: `At the engineers' rate you expect about ${eEng.toFixed(1)} losses over ${flights} flights; at management's rate, essentially zero (${eMgmt.toFixed(4)}). The real Shuttle program lost 2 in 135 — squarely in line with the engineers and nowhere near management's near-impossible odds. A small per-flight risk is not a small program risk: fly enough times and the rare catastrophe becomes expected, which is exactly why "we've gotten away with it so far" is no defense.`,
    };
  },

  "at-least-one": (rng) => {
    const n = sample(rng, [25, 50, 135], 1)[0];
    const oneIn = sample(rng, [100, 200], 1)[0];
    const p = 1 / oneIn;
    const none = Math.pow(1 - p, n);
    const atLeastOne = (1 - none) * 100;
    return {
      title: "The odds of at least one disaster",
      question: `If each flight carries a ${`1-in-${oneIn}`} chance of catastrophic loss, what is the probability of at least one loss over a ${n}-flight program?`,
      steps: [
        `P(\\text{none}) = \\left(1 - \\tfrac{1}{${oneIn}}\\right)^{${n}} = ${none.toFixed(3)}`,
        `P(\\text{at least one}) = 1 - ${none.toFixed(3)} = ${atLeastOne.toFixed(0)}\\%`,
      ],
      note: `About a ${atLeastOne.toFixed(0)}% chance of at least one catastrophe over ${n} flights — even though any single flight looks safe. Rare per-flight risks compound relentlessly across a program, so a culture that treats each successful flight as reassurance is misreading luck as safety. The honest question is never "did this flight survive?" but "what is the real per-flight risk, and how many times are we rolling the dice?"`,
    };
  },
  // ── What Is Life? The Question at the Threshold (what-is-life) ──
  "codon-code": (rng) => {
    const bases = sample(rng, [2, 3, 4, 5], 1)[0];
    const len = sample(rng, [1, 2, 3], 1)[0];
    const codons = Math.pow(bases, len);
    const enough = codons >= 20;
    return {
      title: "Why the genetic code uses triplets",
      question: `Every organism on Earth encodes proteins with the same code: strings of chemical "letters" read in fixed-length words. With ${bases} kinds of letter and words of length ${len}, how many distinct words are possible — and is that enough to specify the 20 amino acids of life?`,
      steps: [
        `\\text{words} = ${bases}^{${len}} = ${codons.toLocaleString("en-US")}`,
        `${codons} ${enough ? "\\geq" : "<"} 20 \\Rightarrow \\text{${enough ? "enough" : "not enough"} to name 20 amino acids}`,
      ],
      note: `${bases} letters in words of ${len} give ${codons.toLocaleString("en-US")} combinations${enough ? "" : " — too few"}. Real life uses 4 bases and words of length 3, giving 4³ = 64 codons: two letters (4² = 16) fall short of 20 amino acids, but three suffice with room to spare. That this exact code — the same 64→20 mapping — is shared by every organism from bacteria to whales is the strongest evidence that all Earth life descends from a single common ancestor. Whether the code is a necessity of life or just that ancestor's frozen accident, we cannot tell from one example.`,
    };
  },

  "entropy-export": (rng) => {
    const watts = sample(rng, [80, 100, 120], 1)[0]; // resting metabolic heat, W
    const hours = sample(rng, [1, 12, 24], 1)[0];
    const T = 310; // K, body temperature
    const Q = watts * hours * 3600; // J of heat exported
    const dS = Q / T; // J/K exported to surroundings
    return {
      title: "Life feeds on negative entropy",
      question: `A resting human radiates about ${watts} W of waste heat at a body temperature of 310 K. Over ${hours} ${hours === 1 ? "hour" : "hours"}, how much entropy does that heat dump into the surroundings? (Entropy exported = heat ÷ temperature.)`,
      steps: [
        `Q = ${watts}\\,\\text{W}\\times ${hours}\\,\\text{h}\\times 3600\\,\\tfrac{\\text{s}}{\\text{h}} = ${sci(Q, 2)}\\,\\text{J}`,
        `\\Delta S = \\frac{Q}{T} = \\frac{${sci(Q, 2)}}{310} = ${sci(dS, 2)}\\,\\text{J/K}`,
      ],
      note: `About ${sci(dS, 2)} J/K of entropy exported to the environment in ${hours} ${hours === 1 ? "hour" : "hours"} — far more than the tiny internal disorder the body prevents by staying alive. That is the bargain Schrödinger described: an organism holds its own improbable order only by dumping a greater disorder outward, so the total entropy still rises and the second law is obeyed. Metabolism is the machinery of the trade; stop the heat-producing throughput and the order decays — death is the moment the export stops.`,
    };
  },

  "protein-space": (rng) => {
    const len = sample(rng, [4, 6, 8], 1)[0];
    const seqs = Math.pow(20, len);
    return {
      title: "The improbable order of one protein",
      question: `Proteins are chains built from 20 kinds of amino acid. How many distinct sequences are possible for a short chain just ${len} amino acids long?`,
      steps: [
        `\\text{sequences} = 20^{${len}} = ${sci(seqs, 2)}`,
      ],
      note: `A mere ${len}-unit chain already has ${sci(seqs, 2)} possible sequences — and real proteins run to hundreds of units, so a single specific one is an almost unimaginably improbable arrangement. Life maintains vast numbers of exactly these improbable, low-entropy structures against the universe's pull toward disorder — which is why the thermodynamic view sees life as an island of order held up by a constant throughput of energy. It also sharpens the N=1 problem: every protein we know is drawn from the same 20-letter alphabet, and with one example we cannot say whether that alphabet is necessary or merely ours.`,
    };
  },
  // ── The Origin of Life: From Chemistry to Biology (origins) ──
  "sequence-space": (rng) => {
    const len = sample(rng, [10, 20, 40], 1)[0];
    const seqs = Math.pow(4, len);
    return {
      title: "Why assembly is a needle in a haystack",
      question: `RNA is a chain of 4 kinds of nucleotide "letter." Miller-Urey makes the letters easily — but a working self-replicator needs a specific sequence. How many distinct sequences are possible for a chain just ${len} letters long?`,
      steps: [
        `\\text{sequences} = 4^{${len}} = ${sci(seqs, 2)}`,
      ],
      note: `Even a ${len}-letter RNA has ${sci(seqs, 2)} possible sequences, and only a vanishing fraction fold into anything functional — so finding a self-replicating ribozyme by blind chance is a needle in an astronomically large haystack. This is exactly why making the building blocks (easy, even cosmic) is not making life (hard, unsolved): the bricks come free, but the specific functional arrangement does not. It is the gulf between a bucket of letters and a book that writes itself.`,
    };
  },

  "origin-odds": (rng) => {
    const nHab = sample(rng, [100_000_000, 300_000_000, 1_000_000_000], 1)[0];
    const exp = sample(rng, [3, 6, 9, 12], 1)[0];
    const p = Math.pow(10, -exp);
    const expected = nHab * p;
    return {
      title: "Easy or hard: counting living worlds",
      question: `Suppose the galaxy has about ${sci(nHab, 0)} potentially habitable worlds, and life arises on each with probability 10^-${exp}. How many worlds would have an independent origin of life?`,
      steps: [
        `\\text{worlds with life} = ${sci(nHab, 0)}\\times 10^{-${exp}} = ${expected >= 1 ? sci(expected, 1) : expected.toExponential(1)}`,
      ],
      note: `${expected >= 2 ? `About ${sci(expected, 1)} living worlds — a galaxy teeming with life` : `Only about ${expected.toFixed(2)} — essentially just Earth, and we may be alone`}. That is the whole drama of the origin: the same habitable worlds give a crowded cosmos or a lonely one depending entirely on this one probability, which swings the answer by orders of magnitude. And with a single known origin (Earth), we cannot measure it — one coin flip landing heads reveals that heads is possible, not how likely. Only a second, independent origin would pin it down.`,
    };
  },

  "great-filter": (rng) => {
    const eOrigin = sample(rng, [0, 1], 1)[0]; // 1 or 0.1
    const eEuk = sample(rng, [3, 4, 5], 1)[0]; // the hard eukaryotic step
    const eInt = sample(rng, [1, 2], 1)[0];
    const pO = Math.pow(10, -eOrigin), pE = Math.pow(10, -eEuk), pI = Math.pow(10, -eInt);
    const reachEuk = pO * pE;
    const reachInt = reachEuk * pI;
    return {
      title: "The great filter: life common, minds rare",
      question: `Reaching intelligence takes a series of steps. Say simple life arises on a fraction ${pO} of habitable worlds, the leap to complex (eukaryotic) cells clears on 10^-${eEuk}, and intelligence on 10^-${eInt}. What fraction of worlds reach complex life, and what fraction reach minds?`,
      steps: [
        `\\text{complex} = ${pO}\\times 10^{-${eEuk}} = ${reachEuk.toExponential(1)}`,
        `\\text{intelligent} = ${reachEuk.toExponential(1)}\\times 10^{-${eInt}} = ${reachInt.toExponential(1)}`,
      ],
      note: `Simple life on a fraction ${pO} of worlds, but intelligence on only about ${reachInt.toExponential(1)} — because the odds multiply, one fantastically hard step (here the eukaryotic leap at 10^-${eEuk}) can leave a galaxy full of microbial slime and nearly empty of anyone to talk to. Earth's own history hints at exactly this: the origin looked easy, but the jump to complex cells took ~2 billion years and may have been a one-off fluke. "Are we alone?" must be asked at every rung of the ladder, not just the first.`,
    };
  },
  // ── Habitability and the Cosmic Distance Ladder (habitability) ──
  "hz-distance": (rng) => {
    const L = sample(rng, [0.01, 0.25, 4, 25], 1)[0];
    const dHz = Math.sqrt(L);
    return {
      title: "Where is the habitable zone?",
      question: `A star's habitable zone sits roughly at d ≈ √(L/L☉) AU, where L is its luminosity. For a star ${L < 1 ? `only ${L}×` : `${L}×`} as luminous as the Sun, about how far out is the habitable zone?`,
      steps: [
        `d_{HZ} \\approx \\sqrt{${L}} = ${dHz.toFixed(2)}\\,\\text{AU}`,
      ],
      note: `About ${dHz.toFixed(2)} AU — ${L < 1 ? `far closer in than Earth, because a dim star must be hugged tightly for warmth (a red dwarf's zone can sit inside Mercury's orbit, where planets risk tidal locking and flares)` : `farther out than Earth, because a bright star's warmth reaches a comfortable level only at a distance`}. The zone is not a fixed place but a band that slides with the star's brightness as √L — which is why "in the habitable zone" always means in *this* star's zone. And remember its blind spot: tidal heating can keep oceans liquid far beyond any star's zone, with no sunlight at all.`,
    };
  },

  "parallax": (rng) => {
    const p = sample(rng, [0.05, 0.1, 0.2, 0.77], 1)[0]; // arcseconds
    const dpc = 1 / p;
    const dly = dpc * 3.26;
    return {
      title: "Parallax: distance from a tiny shift",
      question: `A nearby star shifts by a parallax angle of ${p} arcseconds as Earth moves across its orbit. How far away is it, in parsecs and light-years? (distance in parsecs = 1 ÷ parallax in arcseconds.)`,
      steps: [
        `d = \\frac{1}{p} = \\frac{1}{${p}} = ${dpc.toFixed(2)}\\,\\text{pc}`,
        `d = ${dpc.toFixed(2)}\\times 3.26 = ${dly.toFixed(1)}\\,\\text{light-years}`,
      ],
      note: `About ${dpc.toFixed(2)} parsecs (${dly.toFixed(1)} light-years). Parallax is the gold standard for nearby stars because it is pure geometry — the measured angle and the known size of Earth's orbit, no assumptions about the star itself. But the angles are minuscule (even the nearest star shifts by under an arcsecond), so it fades out at galactic scales; beyond it, the ladder must switch to standard candles. This is the rung on which all the higher rungs are ultimately calibrated.`,
    };
  },

  "standard-candle": (rng) => {
    const fainter = sample(rng, [25, 100, 400, 10000], 1)[0];
    const calib = sample(rng, [10, 100], 1)[0]; // pc
    const ratio = Math.sqrt(fainter);
    const dist = ratio * calib;
    return {
      title: "Standard candle: brightness gives distance",
      question: `A standard candle looks ${fainter.toLocaleString("en-US")}× fainter than an identical calibrator star at a known ${calib} pc. Since brightness falls as the inverse square of distance, how far away is it?`,
      steps: [
        `\\frac{d}{d_{cal}} = \\sqrt{${fainter.toLocaleString("en-US")}} = ${ratio.toLocaleString("en-US")}`,
        `d = ${ratio.toLocaleString("en-US")}\\times ${calib} = ${dist.toLocaleString("en-US")}\\,\\text{pc}`,
      ],
      note: `About ${dist.toLocaleString("en-US")} parsecs. The whole game of measuring cosmic distances comes down to this: if you know an object's *true* luminosity (a "standard candle") and measure how bright it *looks*, the inverse-square law hands you the distance. A Cepheid reveals its true luminosity through its pulse period (Leavitt's law); a Type Ia supernova through the consistent physics of its explosion. Find one in a distant galaxy, measure its faintness, and you have measured the galaxy — the trick that unlocked the scale of the universe.`,
    };
  },
  // ── Ocean Worlds: Europa, Enceladus, and the Seas Beneath the Ice (ocean-worlds) ──
  "methanogen-balance": (rng) => {
    const n = sample(rng, [1, 3, 5], 1)[0]; // moles of CH4 to make
    const h2 = 4 * n, co2 = n, h2o = 2 * n;
    const massIn = co2 * 44 + h2 * 2, massOut = n * 16 + h2o * 18;
    return {
      title: "The fuel in Enceladus's plume",
      question: `Earth's most ancient life, methanogens, live on the reaction CO₂ + 4H₂ → CH₄ + 2H₂O — and Enceladus's ocean has both CO₂ and H₂. To make ${n} molecule${n > 1 ? "s" : ""} of methane, how much hydrogen and carbon dioxide are consumed, and does mass balance?`,
      steps: [
        `${co2}\\,\\text{CO}_2 + ${h2}\\,\\text{H}_2 \\rightarrow ${n}\\,\\text{CH}_4 + ${h2o}\\,\\text{H}_2\\text{O}`,
        `\\text{mass in} = ${co2}(44) + ${h2}(2) = ${massIn}\\,\\text{u} = ${n}(16) + ${h2o}(18) = ${massOut}\\,\\text{u} \\;\\checkmark`,
      ],
      note: `${n} CH₄ needs ${h2} H₂ and ${co2} CO₂, and the ${massIn} atomic mass units in balance the ${massOut} out — nothing is lost, only rearranged, with energy released for the cell to live on. You may recognise the reaction: it is the Sabatier reaction from the life-support chapter, run there by a machine to recover water, and here by living cells as their source of energy. The hydrogen Cassini tasted in the plume is not just a sign of hot water meeting rock — it is *food*, the exact fuel some of Earth's oldest life would eat.`,
    };
  },

  "ocean-volume": (rng) => {
    const R = sample(rng, [1560, 2410, 2630], 1)[0]; // moon radius, km (Europa, Callisto, Ganymede)
    const depth = sample(rng, [60, 100, 150], 1)[0]; // ocean depth, km
    const vol = 4 * Math.PI * R * R * depth; // thin-shell volume, km^3
    const earth = 1.335e9; // km^3, Earth's oceans
    const ratio = vol / earth;
    return {
      title: "How much water is down there?",
      question: `A subsurface ocean is a thin shell: its volume is about 4πR²×(depth), with R the moon's radius. For a moon of radius ${R.toLocaleString("en-US")} km with an ocean ${depth} km deep, what is the ocean's volume — and how does it compare to Earth's ${earth.toExponential(1)} km³ of ocean?`,
      steps: [
        `V \\approx 4\\pi R^2 h = 4\\pi (${R.toLocaleString("en-US")})^2(${depth}) = ${sci(vol, 1)}\\,\\text{km}^3`,
        `\\frac{V}{V_\\oplus} = \\frac{${sci(vol, 1)}}{${sci(earth, 1)}} = ${ratio.toFixed(1)}\\times`,
      ],
      note: `About ${sci(vol, 1)} km³ — roughly ${ratio.toFixed(1)} times all the water in Earth's oceans, in a single hidden sea beneath the ice. This is the quiet shock of the ocean worlds: liquid water, life's one non-negotiable, is not rare in the outer solar system but abundant, tucked in the dark beneath frozen shells. Understanding subsurface oceans jumped the count of potentially habitable places in our own system from essentially one to many — and implies the universe is far wetter than its frozen surfaces suggest.`,
    };
  },

  "signal-delay": (rng) => {
    const targets: [string, number][] = [["Jupiter", 5.2], ["Saturn", 9.6], ["Europa", 5.2]];
    const [name, au] = targets[sample(rng, [0, 1, 2], 1)[0]];
    const oneWayMin = (au * 149.6e6) / 299792 / 60; // minutes
    return {
      title: "Why probes must think for themselves",
      question: `A radio command travels at the speed of light. When a spacecraft at ${name} (about ${au} AU from the Sun, roughly the same from Earth) flies through a plume, how long does a one-way signal take — and what does that mean for controlling it live? (1 AU = 1.496×10⁸ km, c = 299,792 km/s.)`,
      steps: [
        `t = \\frac{${au}\\times 1.496\\times 10^8\\,\\text{km}}{299{,}792\\,\\text{km/s}} = ${(oneWayMin * 60).toFixed(0)}\\,\\text{s} \\approx ${oneWayMin.toFixed(0)}\\,\\text{min}`,
        `\\text{round trip} \\approx ${(2 * oneWayMin).toFixed(0)}\\,\\text{min}`,
      ],
      note: `About ${oneWayMin.toFixed(0)} minutes each way — ${(2 * oneWayMin).toFixed(0)} minutes for a command and its reply. A plume flythrough is over in seconds, so no one on Earth can steer it in real time; the spacecraft must execute the encounter on its own, decisions baked in years before launch. This is the deep-space reality behind every ocean-world mission: the rocket equation gets the payload there, but light-speed makes it act alone — a robot tasting an alien sea hundreds of millions of kilometres beyond any hope of live control.`,
    };
  },
  // ── Biosignatures: How Would We Know? (biosignatures) ──
  "methane-lifetime": (rng) => {
    const life = sample(rng, [8, 10, 12], 1)[0]; // methane lifetime, years
    const ageGyr = sample(rng, [4.5, 3.0, 2.0], 1)[0]; // atmosphere age, billions of years
    const ageYr = ageGyr * 1e9;
    const times = ageYr / life;
    return {
      title: "Why methane shouldn't be there",
      question: `In an oxygen-rich atmosphere, methane is destroyed with a lifetime of about ${life} years. If the atmosphere is ${ageGyr} billion years old, how many methane lifetimes have elapsed — and what does that say about any methane still present today?`,
      steps: [
        `N = \\frac{\\text{age}}{\\text{lifetime}} = \\frac{${ageGyr}\\times 10^9\\,\\text{yr}}{${life}\\,\\text{yr}} = ${sci(times, 1)}`,
        `\\text{starting methane surviving} \\sim e^{-N} \\approx 0 \\;\\;(N = ${sci(times, 1)})`,
      ],
      note: `About ${sci(times, 1)} lifetimes have passed — so any methane present at the start was wiped out hundreds of millions of times over and should be utterly gone. Yet methane IS still in the air, sitting beside the oxygen that eats it. The only way to keep it there is a source continuously resupplying it as fast as it burns, at a planetary scale. On Earth that source is life. This is the disequilibrium argument: not "we found methane," but "methane cannot persist here unless something keeps making it" — the fire-and-fuel logic that turns a humble gas into a biosignature.`,
    };
  },

  "transit-signal": (rng) => {
    // Atmospheric transmission signal ~ 2 * Rp * H / Rstar^2 (annulus area / stellar disc).
    const cases: [string, number, number, number][] = [
      // label, planet radius (km), scale height (km), star radius (km)
      ["an Earth twin, Sun-like star", 6371, 8, 696000],
      ["a super-Earth, red-dwarf star", 9500, 12, 150000],
      ["a warm Neptune, Sun-like star", 24600, 30, 696000],
    ];
    const [label, rp, H, rs] = cases[sample(rng, [0, 1, 2], 1)[0]];
    const signal = (2 * rp * H) / (rs * rs); // fractional depth of the atmospheric annulus
    const ppm = signal * 1e6;
    return {
      title: "Reading an atmosphere across the light-years",
      question: `During a transit, starlight grazing a planet's atmosphere carries its chemical fingerprint. The signal is roughly the atmospheric annulus over the stellar disc, 2·Rₚ·H / R★². For ${label} — planet radius ${rp.toLocaleString("en-US")} km, atmospheric scale height ${H} km, star radius ${rs.toLocaleString("en-US")} km — how deep is that signal?`,
      steps: [
        `\\delta \\approx \\frac{2 R_p H}{R_\\star^2} = \\frac{2(${rp.toLocaleString("en-US")})(${H})}{(${rs.toLocaleString("en-US")})^2} = ${sci(signal, 1)}`,
        `= ${sci(signal, 1)}\\times 10^6\\,\\text{ppm} = ${ppm.toFixed(ppm < 10 ? 1 : 0)}\\,\\text{ppm of the starlight}`,
      ],
      note: `Only about ${ppm.toFixed(ppm < 10 ? 1 : 0)} parts per million — a change of a few thousandths of a percent in the star's brightness, and the biosignature gases hide inside even that sliver. This is why reading the air of a small, temperate world sits at the very edge of what the largest telescopes can do, and why JWST and its successors matter: the fingerprint is real and readable, but faint almost beyond belief. Compare the cases — a big puffy planet around a small star gives a signal tens of times larger, which is exactly why our first atmosphere measurements came from hot Jupiters, not Earth twins.`,
    };
  },

  "false-positive-odds": (rng) => {
    // Independent biosignatures multiply their (abiotic) false-positive probabilities.
    const p1 = sample(rng, [10, 20, 25], 1)[0]; // % chance oxygen is abiotic here
    const p2 = sample(rng, [20, 30, 40], 1)[0]; // % chance methane is abiotic here
    const joint = (p1 / 100) * (p2 / 100) * 100; // % chance BOTH are abiotic coincidence
    return {
      title: "Why two signatures beat one",
      question: `Suppose that, on some world, there is a ${p1}% chance its oxygen is abiotic (photolysis, no life) and, independently, a ${p2}% chance its methane is abiotic (serpentinising rock). If both gases coexist in disequilibrium, what is the rough chance that a lifeless explanation accounts for BOTH at once — and why does that make the pair so much stronger than either gas alone?`,
      steps: [
        `P(\\text{both abiotic}) \\approx P_1\\times P_2 = ${(p1 / 100).toFixed(2)}\\times ${(p2 / 100).toFixed(2)} = ${(joint / 100).toFixed(3)}`,
        `= ${joint.toFixed(1)}\\% \\;\\;\\text{vs. } ${p1}\\% \\text{ or } ${p2}\\% \\text{ for a single gas}`,
      ],
      note: `Only about ${joint.toFixed(1)}% — far below the ${p1}% or ${p2}% a single gas leaves on the table. Nature can forge oxygen, and nature can forge methane, but to forge BOTH at once, in the same air, held in mutual chemical conflict, it must run two independent tricks in concert — and independent flukes multiply, so their combined probability collapses. (Treat the two as independent only as a teaching idealisation; real cases share some causes.) This is the whole strategy against false positives: never trust one molecule, hunt for combinations in disequilibrium that a lifeless world would have to fake several times over. It is why the gold standard is not oxygen, and not methane, but oxygen AND methane, together.`,
    };
  },
  // ── Are We Alone? Drake, Fermi, and the Great Filter (drake-and-fermi) ──
  "drake-count": (rng) => {
    // N = R* · fp · ne · fl · fi · fc · L. Left factors are measured; the biology
    // and the lifetime are guesses spanning many orders of magnitude.
    const Rstar = 1.5, fp = 1, ne = 0.2, fc = 0.1; // the settled-ish part
    const fl = sample(rng, [1, 0.01, 1e-6], 1)[0]; // origin of life: easy … hard
    const fi = sample(rng, [0.1, 0.001], 1)[0]; // intelligence follows … rarely
    const L = sample(rng, [200, 1e4, 1e6], 1)[0]; // lifetime, years
    const N = Rstar * fp * ne * fl * fi * fc * L;
    return {
      title: "Filling in the Drake equation",
      question: `Take the measured factors as R∗ = 1.5 stars/yr, fₚ = 1, nₑ = 0.2, f_c = 0.1. Now choose fₗ = ${sci(fl, 0)} (does life arise?), fᵢ = ${sci(fi, 0)} (does intelligence follow?), and a civilisation lifetime L = ${sci(L, 0)} years. How many communicating civilisations N does the galaxy hold right now — and what does the answer feel like?`,
      steps: [
        `N = R_\\ast f_p n_e f_l f_i f_c L`,
        `= (1.5)(1)(0.2)(${sci(fl, 0)})(${sci(fi, 0)})(0.1)(${sci(L, 0)}) = ${sci(N, 1)}`,
      ],
      note: `N ≈ ${sci(N, 1)}. Notice how little the measured left-hand factors did and how violently the guesses on the right moved the answer: swapping an easy origin of life for a hard one, or a long-lived civilisation for a short one, slides N across many orders of magnitude — published estimates span about fourteen. The Drake equation never calculated whether we are alone. It organised our ignorance, showing that the whole answer lives in three things we cannot yet measure: whether life begins, whether minds follow, and — above all — how long a civilisation lasts.`,
    };
  },

  "galaxy-crossing": (rng) => {
    const pct = sample(rng, [1, 2, 5], 1)[0]; // percent of light speed
    const span = 100000; // light-years across the galaxy
    const cross = span / (pct / 100); // years to cross at that fraction of c
    const ageGyr = 13; // galaxy age, billions of years
    const fraction = cross / (ageGyr * 1e9);
    return {
      title: "Why the galaxy should already be full",
      question: `Fermi's argument needs no warp drive. A probe travelling at just ${pct}% of light speed crosses the galaxy's ${span.toLocaleString("en-US")} light-years in how long — and how does that compare to the galaxy's ${ageGyr}-billion-year age? (Ignore stops; they change the number little.)`,
      steps: [
        `t = \\frac{${span.toLocaleString("en-US")}\\,\\text{ly}}{${pct/100}\\,c} = ${sci(cross, 1)}\\,\\text{yr}`,
        `\\frac{t}{\\text{age}} = \\frac{${sci(cross, 1)}}{${sci(ageGyr * 1e9, 0)}} = ${sci(fraction, 1)}`,
      ],
      note: `About ${sci(cross, 1)} years to cross — only ${sci(fraction, 1)} of the galaxy's age, well under a thousandth of the time available. That is the heart of the paradox: any civilisation with the will to expand has had, thousands of times over, more than enough time to reach every star system, including ours — so the galaxy should be full of their probes and traces. Yet we see nothing. "Where is everybody?" is not idle wonder; it is a quantitative contradiction between how much time there has been and how empty the sky looks.`,
    };
  },

  "contemporaries": (rng) => {
    const total = sample(rng, [1e6, 1e4, 100], 1)[0]; // civilisations that ever arose
    const L = sample(rng, [300, 1e4, 1e6], 1)[0]; // years each broadcasts
    const T = 1e10; // ~10 Gyr window over which they arose
    const now = total * (L / T); // how many are broadcasting simultaneously
    return {
      title: "How the lifetime empties the galaxy",
      question: `Suppose ${sci(total, 0)} civilisations arose across the galaxy's ~10-billion-year history, spread evenly in time, and each broadcasts for L = ${sci(L, 0)} years. How many are broadcasting at the SAME time as us — and why does this make L the factor that decides everything?`,
      steps: [
        `N_\\text{now} = N_\\text{total}\\times\\frac{L}{T} = ${sci(total, 0)}\\times\\frac{${sci(L, 0)}}{10^{10}}`,
        `= ${sci(now, 1)}\\ \\text{broadcasting right now}`,
      ],
      note: `Only about ${sci(now, 1)} contemporaries — even though ${sci(total, 0)} civilisations may have come and gone. This is why the lifetime L dominates the Drake equation: the galaxy holds detectable civilisations at any one moment only in proportion to how long each one lasts, so a short-lived civilisation leaves almost no overlap with anyone else. If technological species reliably destroy themselves within a few centuries, the galaxy can be dotted with the ruins of thousands and still be silent tonight. To guess how long others last, we must guess how long WE will — which is why this factor turns the whole question into a mirror.`,
    };
  },
  // ── The Celestial Sphere and the Daily Sky (celestial-sphere) ──
  "pole-latitude": (rng) => {
    const alt = sample(rng, [23, 35, 40, 52, 60], 1)[0]; // measured Polaris altitude
    const circ = 90 - alt;
    return {
      title: "Reading your latitude off the sky",
      question: `A navigator, alone on the open ocean, measures Polaris standing ${alt}° above the northern horizon. What is their latitude — and, from there, which stars never set (are circumpolar) and which never rise?`,
      steps: [
        `\\text{latitude} = \\text{altitude of the pole} = ${alt}°\\ \\text{N}`,
        `\\text{circumpolar if } \\delta > 90° - ${alt}° = ${circ}°;\\quad \\text{never rises if } \\delta < -${circ}°`,
      ],
      note: `Their latitude is ${alt}° N — the pole star's height above the horizon simply is your latitude, no instruments beyond a way to measure the angle. From there the rest of the sky follows: any star closer to the pole than the pole is to the horizon never sets, so stars with declination above ${circ}° are circumpolar, wheeling around Polaris all night; stars with declination below −${circ}° never clear the horizon at all. One measured angle fixes both where you stand and the whole shape of your sky. This is the fact that let sailors cross oceans and gave the Greeks a proof that the Earth is round.`,
    };
  },

  "circumpolar": (rng) => {
    const lat = sample(rng, [30, 40, 52, 64], 1)[0];
    const dec = sample(rng, [72, 55, 20, -20, -55, -72], 1)[0];
    const limit = 90 - lat;
    const verdict = dec > limit ? "circumpolar — it never sets" : dec < -limit ? "never rises — it is always below the horizon" : "rises and sets each day";
    return {
      title: "Circumpolar, or forever hidden?",
      question: `From latitude ${lat}° N, consider a star of declination ${dec >= 0 ? "+" : ""}${dec}°. Does it never set, never rise, or rise and set? (Circumpolar if declination exceeds 90° − latitude; never rises if it is below −(90° − latitude).)`,
      steps: [
        `90° - L = 90° - ${lat}° = ${limit}°`,
        `\\delta = ${dec >= 0 ? "+" : ""}${dec}° \\;\\Rightarrow\\; ${dec > limit ? `${dec}° > ${limit}°` : dec < -limit ? `${dec}° < -${limit}°` : `-${limit}° \\le ${dec}° \\le ${limit}°`}`,
      ],
      note: `From ${lat}° N the circumpolar threshold is 90° − ${lat}° = ${limit}°, so this star ${verdict}. The whole three-way sorting of the sky — always up, sometimes up, never up — is set by that one number, your latitude. Raise your latitude and the pole climbs, the never-setting cap grows, and more of the sky is locked permanently above the horizon; at the North Pole the entire visible sky is circumpolar and nothing rises or sets at all. It is exactly why the Southern Cross is invisible from most of the north: it sits too far south of the celestial equator ever to clear the horizon.`,
    };
  },

  "sky-rate": (rng) => {
    const span = sample(rng, [0.5, 5, 15, 30], 1)[0]; // an angle to traverse, degrees
    const minutes = (span / 15) * 60; // at 15°/hour
    return {
      title: "The steady turning of the sky",
      question: `The whole sky wheels westward at 15° per hour (a full 360° turn in about 24 hours). How long does it take a point on the sky to move ${span}° — and what does that tell you about ${span === 0.5 ? "how long sunset lasts" : "tracking the sky with a telescope"}?`,
      steps: [
        `\\text{rate} = \\frac{360°}{24\\,\\text{h}} = 15°/\\text{h} = 0.25°/\\text{min}`,
        `t = \\frac{${span}°}{0.25°/\\text{min}} = ${f(minutes)}\\,\\text{min}`,
      ],
      note: `About ${f(minutes)} minutes. ${span === 0.5 ? "The Sun and Moon are each roughly 0.5° wide, so the Sun takes about two minutes to sink its own diameter below the horizon — which is why sunset is not instant but a slow slide." : `A telescope left fixed lets its target drift ${span}° in just ${f(minutes)} minutes, so any telescope must turn steadily westward at 15° per hour to hold a star still in its field — the sky is always sliding.`} Behind the number is the through-line of the whole course: this 15°-per-hour march is not the sky moving at all, but the shadow of the Earth turning beneath it, one rotation a day.`,
    };
  },
  // ── The Sun's Path and the Seasons (seasons) ──
  "noon-sun": (rng) => {
    const lat = sample(rng, [30, 40, 45, 52], 1)[0];
    const station = sample(rng, [0, 1, 2], 1)[0]; // 0 summer, 1 equinox, 2 winter
    const dec = station === 0 ? 23.4 : station === 2 ? -23.4 : 0;
    const name = station === 0 ? "June solstice" : station === 2 ? "December solstice" : "an equinox";
    const alt = 90 - Math.abs(lat - dec);
    const altS = 90 - Math.abs(lat - 23.4), altW = 90 - Math.abs(lat + 23.4);
    return {
      title: "How high is the noon Sun?",
      question: `At latitude ${lat}° N, how high does the Sun climb at noon on ${name}? (Use noon altitude = 90° − |latitude − declination|, with the Sun's declination +23.4° at the June solstice, 0° at an equinox, −23.4° at the December solstice.)`,
      steps: [
        `a = 90° - |{\\,}${lat}° - (${dec >= 0 ? "+" : ""}${dec}°){\\,}| = 90° - ${Math.abs(lat - dec).toFixed(1)}° = ${alt.toFixed(1)}°`,
        `\\text{summer } ${altS.toFixed(1)}° \\;\\text{vs winter } ${altW.toFixed(1)}° \\;\\Rightarrow\\; \\text{a } ${(altS - altW).toFixed(1)}° \\text{ swing}`,
      ],
      note: `The noon Sun stands ${alt.toFixed(1)}° high on ${name}. Across the year at ${lat}° N it swings a full ${(altS - altW).toFixed(1)}° — from ${altS.toFixed(1)}° in June to ${altW.toFixed(1)}° in December — and that swing, driven entirely by the 23.4° tilt, is half the story of the seasons (the other half is the changing length of the day). A high Sun near overhead pours concentrated light onto the ground; a low Sun smears the same beam thin. No change in the Earth's distance from the Sun appears anywhere in the reasoning.`,
    };
  },

  "season-intensity": (rng) => {
    const lat = sample(rng, [35, 40, 45, 50], 1)[0];
    const altS = 90 - Math.abs(lat - 23.4), altW = 90 - Math.abs(lat + 23.4);
    const ratio = Math.sin(altS * Math.PI / 180) / Math.sin(altW * Math.PI / 180);
    return {
      title: "Why the summer Sun bakes",
      question: `The intensity of sunlight on the ground scales as the sine of the Sun's altitude. At latitude ${lat}° N the noon Sun reaches ${altS.toFixed(1)}° at the June solstice and ${altW.toFixed(1)}° at the December solstice. How many times more intense is the noon sunlight in summer than in winter — from directness alone?`,
      steps: [
        `\\frac{I_\\text{summer}}{I_\\text{winter}} = \\frac{\\sin ${altS.toFixed(1)}°}{\\sin ${altW.toFixed(1)}°} = \\frac{${Math.sin(altS*Math.PI/180).toFixed(3)}}{${Math.sin(altW*Math.PI/180).toFixed(3)}}`,
        `\\approx ${ratio.toFixed(2)}\\times`,
      ],
      note: `About ${ratio.toFixed(2)} times more intense at noon in summer — and that is before counting the longer summer day, which piles on more hours of heating still. The two mechanisms, directness and duration, both spring from the same tilt and multiply together. Compare this with the distance effect: the Earth's distance to the Sun varies only ~3% over the year, a mere ~7% change in received sunlight — and, damningly, the Earth is actually closest in January, the depth of northern winter. The tilt beats distance by a mile, and points the opposite way.`,
    };
  },

  "tilt-geography": (rng) => {
    const obl = sample(rng, [23.4, 10, 40, 90], 1)[0];
    const polar = 90 - obl;
    const real = obl === 23.4;
    return {
      title: "The tilt carves the globe",
      question: `A planet's axial tilt draws four special latitudes: the tropics (where the Sun can stand overhead) at ±tilt, and the polar circles (the edge of the midnight Sun and polar night) at ±(90° − tilt). For an axial tilt of ${obl}°${real ? " (Earth's)" : ""}, where do these lines fall — and what would that world's seasons be like?`,
      steps: [
        `\\text{tropics} = \\pm${obl}°\\ \\text{latitude}`,
        `\\text{polar circles} = \\pm(90° - ${obl}°) = \\pm${polar}°`,
      ],
      note: `${real ? "For Earth's 23.4° tilt, the tropics sit at ±23.4° and the polar circles at ±66.6° — exactly the lines printed on every globe, each one nothing but the obliquity written onto the planet." : `A ${obl}° tilt would put the tropics at ±${obl}° and the polar circles at ±${polar}°.`} ${obl <= 10 ? "So small a tilt gives a narrow tropical band, polar circles crowded near the poles, and barely any seasons at all (like Jupiter's 3°)." : obl >= 40 ? "So large a tilt gives sprawling tropics and polar circles that reach far toward the equator, with violent seasons — at 90° the planet essentially rolls around the Sun, like Uranus." : "Change the tilt and you redraw the map: the whole geography of climate is a shadow of this one angle."} It is a striking measure of how much of a world's character rides on a single number set, for Earth, by an ancient collision.`,
    };
  },
  // ── The Moon: Phases and the Monthly Cycle (phases) ──
  "synodic-month": (rng) => {
    const sid = 27.32; // sidereal month, days
    const year = sample(rng, [365.25, 687, 4333], 1)[0]; // Earth, Mars, Jupiter year
    const world = year === 687 ? "Mars" : year === 4333 ? "Jupiter" : "Earth";
    const syn = 1 / (1 / sid - 1 / year);
    return {
      title: "Why the phase cycle beats the orbit",
      question: `The Moon orbits in a sidereal month of ${sid} days (relative to the stars), yet the phase cycle — new Moon to new Moon — is longer, because the phase depends on the angle to the moving Sun. If a moon like ours orbited ${world} (year ${year} days) in ${sid} days, how long would its phase cycle (synodic month) be? Use 1/T_syn = 1/T_sid − 1/T_year.`,
      steps: [
        `\\frac{1}{T_\\text{syn}} = \\frac{1}{${sid}} - \\frac{1}{${year}} = ${(1/sid - 1/year).toFixed(5)}\\,\\text{/day}`,
        `T_\\text{syn} = ${syn.toFixed(2)}\\,\\text{days}`,
      ],
      note: `${syn.toFixed(2)} days — ${(syn - sid).toFixed(2)} days longer than the orbit itself. During one orbit the planet carries the moon part-way around the Sun, so the Sun's direction shifts and the moon must travel a little further to catch up and return to the same phase. ${world === "Earth" ? "For our Moon this gives the familiar 29.5-day synodic month — the one lunar calendars actually count, which is why lunar months run 29–30 days and drift against the solar year." : `Because ${world}'s year is so long, the Sun barely drifts, so the phase cycle sits only a little above the ${sid}-day orbit — the slower the planet's own orbit, the closer synodic and sidereal months become.`} The phase you watch carries the fingerprint of the planet's year.`,
    };
  },

  "moonrise-delay": (rng) => {
    const rate = sample(rng, [12, 13, 14], 1)[0]; // moon's daily eastward motion, deg/day
    const delayMin = (rate / 15) * 60; // Earth rotates 15°/hr
    return {
      title: "Why moonrise slips later each day",
      question: `The Moon orbits eastward against the stars by about ${rate}° per day. The Earth rotates 15° per hour. By roughly how much later does the Moon rise each day — and what does that delay reveal?`,
      steps: [
        `\\Delta t = \\frac{${rate}°}{15°/\\text{hr}} = ${(rate/15).toFixed(2)}\\,\\text{hr} = ${delayMin.toFixed(0)}\\,\\text{min}`,
      ],
      note: `About ${delayMin.toFixed(0)} minutes later each day. Having drifted ${rate}° eastward overnight, the Moon needs the Earth to turn an extra ${rate}° to lift it back to the horizon, and at 15° per hour that extra turn takes ${delayMin.toFixed(0)} minutes. So the steadily slipping time of moonrise is nothing but the Moon's own orbital motion — the very motion that drives the phases — showing up on the clock. Watch moonrise march later night after night and you are literally watching the Moon travel around its orbit, one ${rate}° step per day.`,
    };
  },

  "sun-distance": (rng) => {
    const angle = sample(rng, [87, 89, 89.85], 1)[0]; // Sun–Moon elongation at half moon
    const ratio = 1 / Math.cos((angle * Math.PI) / 180);
    return {
      title: "Aristarchus reaches for the Sun",
      question: `At a half (quarter) Moon, the Sun–Moon–Earth angle at the Moon is exactly 90°, so Earth, Moon, and Sun form a right triangle. If the Moon and Sun are measured to be ${angle}° apart in the sky at that instant, how many times farther is the Sun than the Moon? (Sun distance ÷ Moon distance = 1 ÷ cos of that angle.)`,
      steps: [
        `\\frac{d_\\text{Sun}}{d_\\text{Moon}} = \\frac{1}{\\cos ${angle}°} = \\frac{1}{${Math.cos((angle * Math.PI) / 180).toFixed(5)}} \\approx ${ratio.toFixed(0)}\\times`,
      ],
      note: `The Sun comes out about ${ratio.toFixed(0)} times farther than the Moon. This is Aristarchus's method, around 270 BC — flawless geometry, but agonisingly sensitive: he measured 87° and got ~19×, while the true angle is 89.85° (fantastically close to 90°) giving ~390×. His number was far too small, yet the conclusion still held and still stunned: the Sun is vastly farther, and therefore vastly larger, than the Moon — indeed far bigger than the Earth. That single deduction planted the heliocentric seed eighteen centuries before Copernicus, and it began, like the whole cosmic distance ladder, with someone reasoning carefully from the geometry of the Moon.`,
    };
  },
  // ── Eclipses: When the Shadows Align (eclipses) ──
  "angular-size": (rng) => {
    const dist = sample(rng, [356500, 384400, 406700], 1)[0]; // perigee / mean / apogee, km
    const label = dist === 356500 ? "at perigee (closest)" : dist === 406700 ? "at apogee (farthest)" : "at its mean distance";
    const moonArcmin = (3474 / dist) * (180 / Math.PI) * 60; // angular diameter, arcmin
    const sun = 32.0;
    const kind = moonArcmin >= sun ? "TOTAL — the Moon fully covers the Sun, baring the corona" : "ANNULAR — the Moon falls short, leaving a ring of Sun";
    return {
      title: "Does the Moon cover the Sun?",
      question: `The Moon is 3,474 km across. ${label.charAt(0).toUpperCase() + label.slice(1)}, ${dist.toLocaleString("en-US")} km away, how big does it look (angular diameter = size ÷ distance, in arcminutes) — and, against the Sun's ${sun}′, is the eclipse total or annular?`,
      steps: [
        `\\theta = \\frac{3474}{${dist.toLocaleString("en-US")}}\\times\\frac{180}{\\pi}\\times 60 = ${moonArcmin.toFixed(1)}'`,
        `${moonArcmin.toFixed(1)}' ${moonArcmin >= sun ? "\\ge" : "<"} ${sun}' \\;\\Rightarrow\\; ${moonArcmin >= sun ? "\\text{total}" : "\\text{annular}"}`,
      ],
      note: `The Moon spans ${moonArcmin.toFixed(1)}′ ${label}, versus the Sun's ${sun}′ — so this eclipse is ${kind}. This is the great coincidence in numbers: the two are so nearly matched (~0.5° each) that the Moon's slight change of distance, over its elliptical orbit, tips the result from total to annular and back. The Sun is ~400× larger than the Moon but ~400× farther, and those factors cancel to leave a small Moon that just barely fits a vast Sun — the reason a total eclipse can hide the disk yet reveal the corona.`,
    };
  },

  "saros": (rng) => {
    const n = sample(rng, [1, 2, 3], 1)[0]; // number of saros cycles
    const days = 6585.32 * n;
    const years = Math.floor(days / 365.25);
    const rem = Math.round(days - years * 365.25);
    const westShift = (n * 120) % 360; // ~1/3 day → ~120° west per saros
    return {
      title: "Predicting an eclipse with the saros",
      question: `The saros cycle is 6,585.32 days — after it, the Sun–Earth–Moon geometry nearly repeats and a very similar eclipse recurs. After ${n} saros cycle${n > 1 ? "s" : ""}, how long has passed (in years and days), and how far west has the eclipse path shifted (the leftover ⅓-day rotates the Earth ~120° west each cycle)?`,
      steps: [
        `t = ${n}\\times 6585.32 = ${days.toFixed(0)}\\,\\text{days} = ${years}\\,\\text{yr} \\; ${rem}\\,\\text{d}`,
        `\\text{path shift} = ${n}\\times 120° = ${westShift === 0 ? "360° \\;(\\text{back near the start})" : westShift + "°\\ \\text{west}"}`,
      ],
      note: `${n} saros = ${years} years and ${rem} days${n === 1 ? " — the classic 18 years, 11⅓ days" : ""}. Because the extra third of a day spins the Earth about 120° westward, the twin eclipse falls a third of the way around the world each cycle, and it takes ${n === 3 ? "exactly these three saroses (~54 years)" : "three saroses (~54 years)"} to bring a similar eclipse back to roughly the same place. This is how the Babylonians did the seemingly magical: keep centuries of records, spot the 18-year rhythm, and foretell the darkening of the Sun years ahead — an early, stunning proof that the heavens run on knowable law, not divine whim.`,
    };
  },

  "earth-slowing": (rng) => {
    const yearsAgo = sample(rng, [1000, 2000, 2700], 1)[0];
    const c = yearsAgo / 100; // centuries
    const dtSec = 31 * c * c; // accumulated clock offset, seconds (ΔT ≈ 31 s × centuries²)
    const dtHr = dtSec / 3600;
    const deg = dtHr * 15; // Earth turns 15°/hr
    return {
      title: "An eclipse as a message across time",
      question: `Tidal friction slowly lengthens the day, and the clock error accumulates as roughly ΔT ≈ 31 seconds × (centuries)². For an eclipse recorded ${yearsAgo.toLocaleString("en-US")} years ago, how large is that accumulated offset — and how far around the Earth (in longitude, at 15° per hour) does it move where the eclipse was seen?`,
      steps: [
        `\\Delta T \\approx 31\\times(${c})^2 = ${dtSec.toFixed(0)}\\,\\text{s} \\approx ${dtHr.toFixed(1)}\\,\\text{hr}`,
        `\\text{longitude} = ${dtHr.toFixed(1)}\\,\\text{hr}\\times 15°/\\text{hr} = ${deg.toFixed(0)}°`,
      ],
      note: `About ${dtHr.toFixed(1)} hours — some ${deg.toFixed(0)}° of longitude. If the Earth had never slowed, an eclipse from ${yearsAgo.toLocaleString("en-US")} years ago would have been seen from a place ${deg.toFixed(0)}° away. So the gap between where an ancient scribe says a total eclipse went dark and where steady-spin physics puts it is exactly the accumulated slowing of the Earth — and it lets us measure how fast the planet was turning millennia ago. A Babylonian pressing a stylus into clay was unknowingly sending a precise geophysical measurement across the ages, readable only because a total eclipse falls on so narrow a path that where it was seen pins the Earth's spin to within minutes.`,
    };
  },
  // ── Coordinates: the addresses of the sky (coordinates) ──
  "ra-conversion": (rng) => {
    const h = sample(rng, [2, 5, 13, 18, 21], 1)[0];
    const m = sample(rng, [0, 15, 30, 45], 1)[0];
    const deg = h * 15 + m * 0.25;
    return {
      title: "Right ascension is hours — and time",
      question: `A star has right ascension ${h}h ${m.toString().padStart(2, "0")}m. What is that in degrees around the celestial equator (24h = 360°, so 1h = 15°) — and what does the same number tell you about when the star is highest in the sky?`,
      steps: [
        `\\text{RA} = ${h}\\times 15° + ${m}\\times 0.25° = ${deg.toFixed(2)}°`,
        `\\text{it crosses the meridian when local sidereal time} = ${h}\\text{h }${m.toString().padStart(2, "0")}\\text{m}`,
      ],
      note: `${h}h ${m.toString().padStart(2, "0")}m works out to ${deg.toFixed(1)}° eastward from the vernal equinox. But the beauty is the double meaning: because the sky turns exactly one hour of right ascension per hour of time, that same "${h}h ${m.toString().padStart(2, "0")}m" is also a clock reading — the star rides highest, due south, when your local sidereal clock shows ${h}h ${m.toString().padStart(2, "0")}m. Right ascension is measured in hours precisely because a star's celestial longitude and the time it transits are the same number. Position and time are one system.`,
    };
  },

  "longitude-fix": (rng) => {
    const lonDeg = sample(rng, [30, 45, 75, 120], 1)[0];
    const west = sample(rng, [0, 1], 1)[0] === 1;
    const gTime = west ? 12 + lonDeg / 15 : 12 - lonDeg / 15;
    const gh = Math.floor(gTime), gm = Math.round((gTime - gh) * 60);
    return {
      title: "Finding your longitude at sea",
      question: `It is local noon — the Sun is at its highest, so your own clock reads 12:00. At that instant your chronometer, still keeping Greenwich time, reads ${gh}:${gm.toString().padStart(2, "0")}. What is your longitude? (Earth turns 15° per hour.)`,
      steps: [
        `\\Delta t = |12{:}00 - ${gh}{:}${gm.toString().padStart(2, "0")}| = ${(lonDeg / 15).toFixed(1)}\\,\\text{hr}`,
        `\\text{longitude} = ${(lonDeg / 15).toFixed(1)}\\,\\text{hr}\\times 15°/\\text{hr} = ${lonDeg}°\\ ${west ? "W" : "E"}`,
      ],
      note: `You are at ${lonDeg}° ${west ? "west" : "east"}. Your local noon happens ${(lonDeg / 15).toFixed(1)} hours ${west ? "after" : "before"} Greenwich noon, and every hour of that difference is 15° of longitude — so the clock difference, times fifteen, is your position east or west. This is the whole secret of celestial navigation, and its hard part: local time is free from the Sun, but you must also know Greenwich time out on the open sea, which is why John Harrison's chronometer — Greenwich time carried in a box — was one of the most valuable inventions in history. Latitude comes from an angle; longitude comes from a clock.`,
    };
  },

  "lunar-clock": (rng) => {
    const gap = sample(rng, [3, 5, 8], 1)[0]; // degrees the Moon has moved from a star
    const hours = gap / 0.5; // Moon moves ~0.5°/hr against the stars
    return {
      title: "The Moon as a clock in the sky",
      question: `Before reliable sea-clocks, navigators read Greenwich time from the Moon, which drifts eastward against the background stars at about 0.5° per hour. If tables say the Moon should sit right beside a certain star at Greenwich noon, and you measure it ${gap}° past that star, how many hours of Greenwich time have elapsed since noon?`,
      steps: [
        `t = \\frac{${gap}°}{0.5°/\\text{hr}} = ${hours.toFixed(0)}\\,\\text{hr}`,
        `\\text{Greenwich time} \\approx 12{:}00 + ${hours.toFixed(0)}\\text{h} = ${(12 + hours) % 24}{:}00`,
      ],
      note: `About ${hours.toFixed(0)} hours — so it is roughly ${(12 + hours) % 24}:00 at Greenwich, read from nothing but the Moon's position. This was the "lunar distance" method: the Moon's steady creep among the stars turns the whole sky into a clock face, and with precise pre-computed tables a navigator could read Greenwich time without any mechanical timepiece at all. It leaned entirely on the coordinate grid and exact tables of celestial motion — the sky itself pressed into service as the reference clock that longitude demands. The Moon, humanity's oldest calendar, became for a while its clock at sea.`,
    };
  },
  // ── Timekeeping: the two days, and the calendar (timekeeping) ──
  "sidereal-day": (rng) => {
    const degPerDay = sample(rng, [59, 60, 61], 1)[0] / 60; // ~1°/day (varies slightly)
    const minutes = degPerDay * 4; // 1° of rotation = 4 minutes (15°/hr)
    const cumDays = sample(rng, [7, 30, 182], 1)[0];
    const cumMin = cumDays * minutes;
    return {
      title: "Why the solar day is longer",
      question: `Each day the Earth moves about ${degPerDay.toFixed(2)}° around its orbit, so after one true (sidereal) spin it must turn that much EXTRA to bring the Sun back to noon. At 15° per hour, how many minutes does that add — and after ${cumDays} days, how much earlier does a given star rise?`,
      steps: [
        `\\Delta t = \\frac{${degPerDay.toFixed(2)}°}{15°/\\text{hr}} = ${minutes.toFixed(1)}\\,\\text{min per day}`,
        `${cumDays}\\,\\text{days}\\times ${minutes.toFixed(1)}\\,\\text{min} = ${cumMin.toFixed(0)}\\,\\text{min} \\approx ${(cumMin / 60).toFixed(1)}\\,\\text{hr}`,
      ],
      note: `About ${minutes.toFixed(1)} minutes a day — the gap between the solar day (24h, noon to noon) and the sidereal day (23h 56m, star to star). It is the same "chasing the moving Sun" accounting as the phase-month: rotation measured against a moving reference adds a catch-up each cycle. And its visible signature is the seasonal sky: a given star rises ~4 minutes earlier every night, so after ${cumDays} days it is up ${(cumMin / 60).toFixed(1)} hours earlier — and over a full year the 4-minutes-a-day accumulates to 24 hours, one complete turn, cycling the whole zodiac through the evening across the seasons.`,
    };
  },

  "leap-year": (rng) => {
    const year = sample(rng, [1700, 1900, 2000, 2100, 2024, 2400], 1)[0];
    const by4 = year % 4 === 0;
    const century = year % 100 === 0;
    const by400 = year % 400 === 0;
    const leap = century ? by400 : by4;
    const why = !by4 ? "not divisible by 4" : century && !by400 ? "a century year not divisible by 400 — skipped" : century && by400 ? "a century year divisible by 400 — kept" : "divisible by 4, not a century year";
    return {
      title: "Is it a leap year?",
      question: `The Gregorian rule: a leap year is divisible by 4, EXCEPT century years, which are leap only if divisible by 400. Is ${year} a leap year?`,
      steps: [
        `${year} \\div 4 = ${by4 ? "\\text{whole}" : "\\text{not whole}"}${century ? `;\\;\\; ${year} \\div 400 = ${by400 ? "\\text{whole}" : "\\text{not whole}"}` : ""}`,
        `\\Rightarrow\\; ${leap ? "\\text{LEAP year (366 days)}" : "\\text{common year (365 days)}"}`,
      ],
      note: `${year} is ${leap ? "a leap year" : "NOT a leap year"} — ${why}. This is the Gregorian refinement at work: because 365.25 (a leap day every 4 years) is slightly too long, the rule REMOVES three leap-days every 400 years by skipping the century years not divisible by 400 — which is exactly why 1900 was a common year but 2000 was a leap year. Those 97 leap-days per 400 years give an average year of 365 + 97/400 = 365.2425 days, within half a minute of the true 365.2422 — the whole odd rule is a finely tuned patch on the fact that the year is not a whole number of days.`,
    };
  },

  "calendar-drift": (rng) => {
    const cal = sample(rng, [0, 1], 1)[0]; // 0 Julian, 1 Gregorian
    const yearLen = cal === 0 ? 365.25 : 365.2425;
    const name = cal === 0 ? "Julian" : "Gregorian";
    const err = yearLen - 365.2422; // days per year
    const span = sample(rng, [400, 1000, 1257], 1)[0];
    const drift = err * span;
    const perDay = 1 / err; // years to drift one day
    return {
      title: "How fast does a calendar wander?",
      question: `The ${name} calendar year is ${yearLen} days, while the true tropical year is 365.2422 days. By how much does it drift from the seasons over ${span.toLocaleString("en-US")} years, and how many years does it take to slip a full day?`,
      steps: [
        `\\text{error} = ${yearLen} - 365.2422 = ${err.toFixed(4)}\\,\\text{day/yr}`,
        `\\text{drift} = ${err.toFixed(4)}\\times ${span} = ${drift.toFixed(1)}\\,\\text{days};\\quad \\text{1 day in } ${perDay.toFixed(0)}\\,\\text{yr}`,
      ],
      note: `The ${name} calendar drifts about ${drift.toFixed(1)} days over ${span.toLocaleString("en-US")} years — one full day every ${perDay.toFixed(0)} years. ${cal === 0 ? "That is why the Julian calendar, adopted when the equinox sat near March 21, had slipped some ten days by 1582, dragging the equinox to March 11 and prompting the Gregorian reform." : "That is astonishing accuracy — a single day's error only after more than three millennia — which is why the Gregorian calendar, with its century-year leap rule, is the one the world still runs on."} The calendar is, at bottom, a shadow of Earth's orbital geometry: a workable whole-number calendar forever chasing a year that is 365.2422 days long.`,
    };
  },
  // ── Precession: the slow sky (precession) ──
  "precession-rate": (rng) => {
    const arcsec = sample(rng, [50], 1)[0]; // arcseconds per year
    const years = sample(rng, [72, 2160, 26000], 1)[0];
    const moved = (arcsec * years) / 3600; // degrees
    const full = (360 * 3600) / arcsec; // years for a full circuit
    return {
      title: "How fast the equinox slides",
      question: `Precession slides the vernal equinox westward along the ecliptic at about ${arcsec} arcseconds per year. How far does it move in ${years.toLocaleString("en-US")} years (3600 arcseconds = 1°), and how long is one full 360° circuit?`,
      steps: [
        `\\Delta = \\frac{${arcsec}'' \\times ${years}}{3600} = ${moved.toFixed(moved < 10 ? 1 : 0)}°`,
        `\\text{full circuit} = \\frac{360°\\times 3600}{${arcsec}''} = ${Math.round(full).toLocaleString("en-US")}\\,\\text{yr}`,
      ],
      note: `About ${moved.toFixed(moved < 10 ? 1 : 0)}° in ${years.toLocaleString("en-US")} years, and a full circle in roughly ${Math.round(full / 1000)},000 years — the ~26,000-year precession cycle. ${years === 2160 ? "That ~30° in ~2,160 years is one whole zodiac sign — which is why the astrological signs have slipped nearly a full sign out of step with the constellations since antiquity." : years === 72 ? "So the equinox moves a full degree — twice the Moon's width — in a human lifetime, slow but quite measurable." : "One lap of the wobble carries the pole star, the equinox, and every star's coordinates all the way around."} The motion is glacial, but over the long baseline of recorded history it is unmistakable — which is exactly how Hipparchus caught it.`,
    };
  },

  "pole-star": (rng) => {
    const target = sample(rng, [0, 1, 2], 1)[0];
    const data: [string, number, string][] = [
      ["Thuban", -2800, "when the Egyptians raised the pyramids"],
      ["Polaris", 2000, "our own era"],
      ["Vega", 13700, "far in the future"],
    ];
    const [star, year, era] = data[target];
    const fromNow = year - 2000;
    return {
      title: "Which star marks the pole?",
      question: `The celestial pole circles among the stars once every ~26,000 years, so the "North Star" keeps changing. Around ${era}, roughly ${Math.abs(fromNow) < 200 ? "today" : (Math.abs(fromNow).toLocaleString("en-US") + (fromNow < 0 ? " years ago" : " years from now"))}, which bright star sits nearest the pole?`,
      steps: [
        `\\text{pole moves } 360° \\text{ in } {\\sim}26{,}000\\,\\text{yr} \\;\\Rightarrow\\; {\\sim}1° \\text{ per } 72\\,\\text{yr}`,
        `\\text{era} \\approx ${year < 0 ? Math.abs(year) + "\\,\\text{BC}" : year + "\\,\\text{AD}"} \\;\\Rightarrow\\; \\text{pole star} = \\text{${star}}`,
      ],
      note: `${star}. The pole star is not a fixed fixture of the sky but a passing alignment: Thuban in Draco marked it ~5,000 years ago, Polaris marks it now, and in about 12,000 years the brilliant Vega will — far brighter than our modest Polaris. Between such alignments there is sometimes no bright star near the pole at all. The still point around which the whole night wheels is itself slowly circling, once every 26,000 years, as Earth's axis wobbles like a spinning top.`,
    };
  },

  "coord-epoch": (rng) => {
    const yrs = sample(rng, [50, 100, 500], 1)[0];
    const arcsecMoved = 50 * yrs; // total precession in arcsec
    const arcminMoved = arcsecMoved / 60;
    return {
      title: "Why catalogues need a date",
      question: `Because the equinox — the zero point of the coordinate grid — drifts at ~50 arcseconds per year, the right ascension and declination of every star slowly change too. Over ${yrs} years, roughly how far does the grid shift (in arcminutes), and what does that force star catalogues to specify?`,
      steps: [
        `50''/\\text{yr}\\times ${yrs}\\,\\text{yr} = ${arcsecMoved.toLocaleString("en-US")}'' = ${arcminMoved.toFixed(1)}'`,
        `\\Rightarrow\\; \\text{coordinates must be tagged with an EPOCH (e.g. J2000)}`,
      ],
      note: `About ${arcminMoved.toFixed(1)} arcminutes over ${yrs} years — ${arcminMoved > 30 ? "roughly the width of the full Moon, or more" : "small, but far larger than the precision of a good telescope"}. Because the whole grid is anchored to the drifting equinox, a star's listed RA and dec are only valid for a stated date, so every catalogue specifies an EPOCH — modern ones use J2000, the coordinates as of the year 2000. The addresses we so carefully assigned are not quite permanent: give a star's coordinates and you must also say WHEN, because the framework itself is in motion. It is the fitting close to the observed sky — even the scaffolding we measure it with slowly moves.`,
    };
  },

  "eratosthenes": (rng) => {
    // shadow angle between two cities a known meridian distance apart → Earth circumference
    const theta = sample(rng, [5.0, 7.2, 7.2, 9.0, 10.0, 12.0], 1)[0]; // degrees
    const dist = sample(rng, [500, 700, 800, 900, 1000], 1)[0]; // km along the meridian
    const frac = 360 / theta;
    const circ = dist * frac; // km
    return {
      title: "Measuring the Earth with a shadow",
      question: `At noon on the solstice the Sun is straight overhead at the southern city (a vertical stick casts no shadow), while ${dist} km due north a stick casts a shadow showing the Sun ${theta}° from vertical. The Sun's rays are parallel, so that ${theta}° is the central angle between the cities. What is the Earth's circumference?`,
      steps: [
        `\\frac{${theta}°}{360°} = \\frac{${dist}\\,\\text{km}}{C} \\;\\Rightarrow\\; C = ${dist}\\,\\text{km}\\times\\frac{360°}{${theta}°}`,
        `C = ${dist}\\times ${f(frac)} \\approx ${Math.round(circ).toLocaleString("en-US")}\\,\\text{km}`,
      ],
      note: `About ${Math.round(circ / 1000)},000 km — ${Math.abs(circ - 40075) / 40075 < 0.12 ? "within roughly ten percent of the true 40,000 km" : "the right order of magnitude for the true 40,000 km"}. This is Eratosthenes' method (~240 BC): the shadow angle equals the difference in latitude, ${theta}° is ${frac === 50 ? "exactly 1/50" : `1/${f(frac)}`} of a full circle, so the north–south distance is that same fraction of the whole circumference. The entire planet, measured with a stick, a shadow, and geometry — the same gnomon method as the seasons chapter, and a direct rebuke to any notion that the ancients were unsophisticated.`,
    };
  },

  "stellar-parallax": (rng) => {
    // absence of parallax → a lower bound on how far the stars must be
    const limitArcsec = sample(rng, [60, 120, 180], 1)[0]; // naked-eye resolution limit, arcsec
    const limitRad = (limitArcsec / 206265); // small-angle: radians
    // if the star showed no shift bigger than the limit, distance > baseline / angle.
    // baseline = 1 AU (half-orbit gives ~1 AU of transverse shift for the parallax half-angle)
    const dMinAU = 1 / limitRad; // AU
    const dMinLy = dMinAU / 63241; // ly
    return {
      title: "Why the Greeks saw no parallax",
      question: `If the Earth orbits the Sun, a nearby star should shift by a parallax angle over the year. The naked eye cannot resolve anything finer than about ${limitArcsec} arcseconds. Since the Greeks saw NO shift, how far away (in AU) must the stars be for their parallax to hide below that limit? (Use the 1 AU orbital baseline; 206,265 arcsec = 1 radian.)`,
      steps: [
        `\\theta < ${limitArcsec}'' = \\frac{${limitArcsec}}{206265}\\,\\text{rad} = ${sci(limitRad, 1)}\\,\\text{rad}`,
        `d > \\frac{1\\,\\text{AU}}{\\theta} = \\frac{1}{${sci(limitRad, 1)}} \\approx ${Math.round(dMinAU).toLocaleString("en-US")}\\,\\text{AU} \\approx ${dMinLy.toFixed(2)}\\,\\text{ly}`,
      ],
      note: `More than ${Math.round(dMinAU).toLocaleString("en-US")} AU — thousands of times beyond Saturn, an almost unimaginable gulf of empty space. The Greeks' parallax reasoning was sound: no visible shift meant EITHER the Earth doesn't move OR the stars are staggeringly far away. Rather than swallow such an enormous, near-empty universe, they reasonably concluded the Earth stands still. They were wrong — the stars really are that remote (the nearest, at ~0.77 arcsec, is ~78× below naked-eye resolution) — but the logic was good; only the instruments were lacking. Stellar parallax was finally measured in 1838, with telescopes, vindicating Aristarchus two thousand years late.`,
    };
  },

  "synodic-period": (rng) => {
    // time between retrogrades (oppositions) of an outer planet from its sidereal period
    const planets: [string, number][] = [["Mars", 1.881], ["Jupiter", 11.86], ["Saturn", 29.46]];
    const [name, P] = planets[sample(rng, [0, 1, 2], 1)[0]];
    const S = 1 / (1 - 1 / P); // synodic period, years (Earth E = 1 yr)
    return {
      title: "How often a planet goes retrograde",
      question: `${name} takes ${P} years to orbit the Sun; Earth takes 1 year. Retrograde (a backward loop) happens once each time the faster Earth laps ${name} — at opposition. Using 1/S = 1/E − 1/P with E = 1 yr, how long between successive retrogrades of ${name}?`,
      steps: [
        `\\frac{1}{S} = \\frac{1}{1} - \\frac{1}{${P}} = 1 - ${f(1 / P)} = ${f(1 - 1 / P)}`,
        `S = \\frac{1}{${f(1 - 1 / P)}} \\approx ${S.toFixed(2)}\\,\\text{yr}`,
      ],
      note: `About ${S.toFixed(2)} years between retrogrades. ${P > 20 ? "For the slow outer planets S approaches one year — Earth laps them almost once per orbit, so they go retrograde roughly annually." : name === "Jupiter" ? "Jupiter loops back about every 13 months." : "Mars, only a little slower than Earth, is the hardest to lap — over two years between its dramatic retrograde loops."} In the heliocentric picture this synodic period IS the overtaking rhythm — Earth catching and passing the outer planet. In Ptolemy's geocentric machine the same rhythm had to be built in by hand, by tying each planet's epicycle to the Sun's motion: a coincidence the old system could reproduce but never explain, and a fingerprint of the moving Earth it refused to admit.`,
    };
  },

  "elongation-distance": (rng) => {
    // inner-planet distance from the Sun, from its greatest elongation: r = sin(elong) AU
    const data: [string, number][] = [["Venus", 46], ["Mercury", 23], ["Venus", 47], ["Mercury", 28]];
    const [name, elong] = data[sample(rng, [0, 1, 2, 3], 1)[0]];
    const au = Math.sin((elong * Math.PI) / 180);
    return {
      title: "Measuring a planet's distance from the Sun",
      question: `${name} is an inner planet: it never gets more than about ${elong}° from the Sun in our sky (its greatest elongation). At that moment the Earth–${name} sight-line is tangent to ${name}'s orbit, so the Sun–${name}–Earth angle is 90°. With the Earth–Sun distance as 1 AU, what is ${name}'s distance from the Sun?`,
      steps: [
        `\\sin(${elong}°) = \\frac{r_{\\text{planet}}}{r_{\\text{Earth}}} = \\frac{r}{1\\,\\text{AU}}`,
        `r = \\sin(${elong}°) \\approx ${au.toFixed(2)}\\,\\text{AU}`,
      ],
      note: `About ${au.toFixed(2)} AU — ${name === "Venus" ? "so Venus orbits at roughly three-quarters of the Earth's distance" : "so Mercury huddles at about a third of the Earth's distance, deep in the Sun's glare"}. This is Copernicus's most beautiful argument: heliocentrism does not merely fit the sky's angles, it lets you MEASURE the planets' distances and build a true scale model — Mercury 0.39, Venus 0.72, Earth 1.00, Mars 1.52, Jupiter 5.2, Saturn 9.5 AU — read straight off the sky. The geocentric model could fit the same angles but could never tell you how far away the planets were, or even their correct order. Turning the flat sky of appearances into a measured, three-dimensional solar system was powerful evidence that the model captured something real.`,
    };
  },

  "kepler-third": (rng) => {
    // Kepler's third law, T^2 = a^3 (T in years, a in AU) — solve either direction
    const forward = sample(rng, [0, 1], 1)[0] === 0;
    if (forward) {
      const a = sample(rng, [4, 9, 16, 25], 1)[0]; // AU (perfect cubes-of-roots for clean T)
      const T = Math.pow(a, 1.5);
      return {
        title: "From distance to period",
        question: `An asteroid orbits the Sun with a semi-major axis of a = ${a} AU. Using Kepler's third law, T² = a³ (with T in years and a in AU), how long is its year?`,
        steps: [
          `T^2 = a^3 = ${a}^3 = ${(a * a * a).toLocaleString("en-US")}`,
          `T = a^{3/2} = ${a}^{1.5} = ${T.toLocaleString("en-US")}\\,\\text{yr}`,
        ],
        note: `${T.toLocaleString("en-US")} years. Kepler's third law binds every orbit in the solar system with one exact rule: square the period, cube the distance, and you get the same number. Just timing how long a body takes to circle the Sun tells you how far away it orbits — the whole architecture of the solar system falls out of the periods. And the law reaches far beyond the planets Kepler knew: the moons of Jupiter, comets, the Moon, and every spacecraft we launch all obey it. Newton would later show this 3/2-power law is the exact fingerprint of an inverse-square gravity.`,
      };
    }
    const a = sample(rng, [4, 9, 16, 25], 1)[0];
    const T = Math.pow(a, 1.5);
    return {
      title: "From period to distance",
      question: `A comet takes T = ${T.toLocaleString("en-US")} years to orbit the Sun. Using Kepler's third law, T² = a³, what is the semi-major axis of its orbit (in AU)?`,
      steps: [
        `a^3 = T^2 = ${T.toLocaleString("en-US")}^2 = ${(T * T).toLocaleString("en-US")}`,
        `a = T^{2/3} = ${T.toLocaleString("en-US")}^{2/3} = ${a}\\,\\text{AU}`,
      ],
      note: `${a} AU. The third law works both ways: measure a period and you know the distance; know a distance and you know the period. This is what made heliocentrism's scale model exact and self-consistent — the planets are not independent objects but members of a single system governed by one rule, T² = a³, holding to better than a tenth of a percent across every planet from Mercury to Saturn. The harmony Kepler chased his whole life turned out to be real: not mystical music, but an exact mathematical law — and, unknowingly, a direct clue to gravity.`,
    };
  },

  "orbit-eccentricity": (rng) => {
    // perihelion/aphelion and the speed ratio from a and e
    const bodies: [string, number, number][] = [["Mars", 1.524, 0.093], ["Mercury", 0.387, 0.206], ["Halley's Comet", 17.8, 0.967], ["Earth", 1.0, 0.017]];
    const [name, a, e] = bodies[sample(rng, [0, 1, 2, 3], 1)[0]];
    const peri = a * (1 - e), apo = a * (1 + e);
    const speedRatio = (1 + e) / (1 - e);
    return {
      title: "Closest, farthest, and fastest",
      question: `${name} orbits with semi-major axis a = ${a} AU and eccentricity e = ${e}. Find its perihelion distance a(1−e) and aphelion distance a(1+e), and the ratio of its speed at perihelion to its speed at aphelion, (1+e)/(1−e).`,
      steps: [
        `\\text{perihelion} = a(1-e) = ${a}(1-${e}) = ${f(peri)}\\,\\text{AU}`,
        `\\text{aphelion} = a(1+e) = ${a}(1+${e}) = ${f(apo)}\\,\\text{AU}`,
        `\\frac{v_{\\text{peri}}}{v_{\\text{apo}}} = \\frac{1+e}{1-e} = ${f(speedRatio)}`,
      ],
      note: `${name} swings from ${f(peri)} AU at perihelion to ${f(apo)} AU at aphelion, moving ${speedRatio > 3 ? `about ${speedRatio.toFixed(0)}× faster` : `${((speedRatio - 1) * 100).toFixed(0)}% faster`} when closest than when farthest. ${e > 0.9 ? "A comet's wildly stretched orbit makes the effect enormous — it whips through perihelion near the Sun and crawls for decades through the frozen aphelion far beyond the planets." : e < 0.05 ? "The orbit is so nearly circular that the swing is tiny — which is exactly why the ellipse stayed hidden for two thousand years." : "The Sun sitting off-centre at one focus is what makes the distance, and so the speed, vary — Kepler's second law in action."} By Kepler's second law the planet sweeps equal areas in equal times, so it must run fastest at perihelion and slowest at aphelion.`,
    };
  },

  "venus-size": (rng) => {
    // apparent size of Venus (crescent vs full) from its Earth-distance at the two conjunctions
    const rV = sample(rng, [0.72], 1)[0]; // Venus orbital radius, AU
    const near = 1 - rV; // inferior conjunction: Venus between Earth and Sun (crescent)
    const far = 1 + rV; // superior conjunction: Venus across the Sun (full)
    const ratio = far / near; // apparent-size ratio (angular size ∝ 1/distance)
    return {
      title: "Why the crescent Venus looks bigger",
      question: `Venus orbits the Sun at ${rV} AU. When it passes between the Earth and the Sun (a thin crescent) its distance from us is 1 − ${rV} AU; when it is on the far side of the Sun (full) its distance is 1 + ${rV} AU. Since apparent size is inversely proportional to distance, how many times larger does the crescent Venus appear than the full Venus?`,
      steps: [
        `d_{\\text{crescent}} = 1-${rV} = ${f(near)}\\,\\text{AU}, \\quad d_{\\text{full}} = 1+${rV} = ${f(far)}\\,\\text{AU}`,
        `\\frac{\\text{size}_{\\text{crescent}}}{\\text{size}_{\\text{full}}} = \\frac{d_{\\text{full}}}{d_{\\text{crescent}}} = \\frac{${f(far)}}{${f(near)}} \\approx ${ratio.toFixed(1)}\\times`,
      ],
      note: `About ${ratio.toFixed(1)} times larger. This size swing is the clinching detail of Galileo's decisive test. If Venus orbits the Sun, the crescent phase happens when Venus is NEAR us (between Earth and Sun, showing its dark side) and the full phase when it is FAR (across the Sun, showing its lit face) — so the crescent must look big and the full must look small, by exactly this factor. Galileo saw precisely that. The Ptolemaic model, which pins Venus forever between us and the Sun, can only ever show a crescent and cannot produce a full Venus at all — so it was refuted, decisively, by the eye.`,
    };
  },

  "apple-moon": (rng) => {
    // inverse-square dilution of surface gravity out to a given distance in Earth radii
    const d = sample(rng, [10, 20, 30, 60], 1)[0];
    const a = 9.8 / (d * d);
    const atMoon = d === 60;
    return {
      title: "How far does the apple's gravity reach?",
      question: `Gravity at the Earth's surface (1 Earth radius from the centre) accelerates a falling apple at 9.8 m/s². If gravity weakens as the inverse square of distance, what acceleration does it produce at ${d} Earth radii from the centre${atMoon ? " — the distance of the Moon" : ""}?`,
      steps: [
        `a = \\frac{9.8}{${d}^2} = \\frac{9.8}{${(d * d).toLocaleString("en-US")}}`,
        `a \\approx ${sci(a, 1)}\\,\\text{m/s}^2`,
      ],
      note: `About ${a >= 0.01 ? a.toFixed(3) : (a * 1000).toFixed(1) + " thousandths of a"} m/s² — gravity diluted ${(d * d).toLocaleString("en-US")}-fold. ${atMoon ? "And here is the moment the heavens and the Earth become one: the Moon's ACTUAL orbital acceleration, computed independently from its orbital size and 27.3-day period (a = 4π²r/T²), is also about 2.7 thousandths of a m/s². The two numbers — apple gravity diluted by the inverse square, and the Moon's real acceleration from pure geometry — agree to one percent. The force pulling the apple down IS the force holding the Moon in orbit: the Moon is falling, just moving sideways fast enough to keep missing the Earth." : "Newton's question was whether this same diluted pull, carried all the way out to 60 Earth radii, could account for the Moon's orbit — and when he did that calculation, the numbers matched. Try the 60-Earth-radii case to see the unification land."}`,
    };
  },

  "weigh-the-sun": (rng) => {
    // Newton's form of Kepler III: M = 4π² a³ / (G T²) — weigh the central body from an orbit
    const G = 6.674e-11;
    const systems: [string, string, number, string, number, string, string][] = [
      ["the Sun", "Earth's orbit", 1.496e11, "1.50 × 10¹¹", 3.156e7, "3.16 × 10⁷", "1.99 × 10³⁰ kg — the Sun, weighed from the Earth's yearly orbit"],
      ["Jupiter", "its moon Io", 4.217e8, "4.22 × 10⁸", 1.528e5, "1.53 × 10⁵", "1.9 × 10²⁷ kg — Jupiter, weighed from Io's 1.8-day orbit"],
      ["the Earth", "the Moon's orbit", 3.844e8, "3.84 × 10⁸", 2.36e6, "2.36 × 10⁶", "6.0 × 10²⁴ kg — the Earth, weighed from the Moon's monthly orbit"],
    ];
    const [body, orbiter, aM, aStr, T, tStr, answer] = systems[sample(rng, [0, 1, 2], 1)[0]];
    const M = (4 * Math.PI * Math.PI * Math.pow(aM, 3)) / (G * T * T);
    return {
      title: "Weighing the heavens",
      question: `Newton's form of Kepler's third law is T² = 4π²a³/(GM), where M is the mass of the central body. Using ${orbiter} — orbital radius a = ${aStr} m, period T = ${tStr} s — and G = 6.67 × 10⁻¹¹, weigh ${body}.`,
      steps: [
        `M = \\frac{4\\pi^2 a^3}{G\\,T^2} = \\frac{4\\pi^2 (${sci(aM, 2)})^3}{(6.67\\times 10^{-11})(${sci(T, 2)})^2}`,
        `M \\approx ${sci(M, 2)}\\,\\text{kg}`,
      ],
      note: `About ${answer}. This is the spectacular bonus Newton's derivation added to Kepler's harmonic law: because the central mass M appears explicitly, any orbit becomes a scale. Measure how far and how fast something orbits, and you can weigh whatever it circles — no touching required. Moons weigh planets; planets weigh the Sun; and centuries later, stars orbiting the galactic centre would weigh the galaxy itself (and reveal, shockingly, that most of its mass is invisible — dark matter). Kepler's version, in years and AU, gave only relative distances; Newton's version weighs worlds.`,
    };
  },

  "doppler-shift": (rng) => {
    // clock a source's velocity from the shift of a known line: v = c·Δλ/λ
    const c = 299792; // km/s
    const dirRecede = sample(rng, [0, 1], 1)[0] === 1;
    const vTrue = sample(rng, [600, 1500, 3000, 15000], 1)[0] * (dirRecede ? 1 : -1);
    const rest = 656.3; // hydrogen's Hα line, nm
    const obs = rest * (1 + vTrue / c);
    const dl = obs - rest;
    return {
      title: "Clocking a star with a barcode",
      question: `Hydrogen's Hα line sits at exactly 656.3 nm in the laboratory. In the spectrum of a distant source you measure it at ${obs.toFixed(1)} nm. Using Δλ/λ = v/c (with c = 300,000 km/s), how fast is the source moving, and toward or away from us?`,
      steps: [
        `\\Delta\\lambda = ${obs.toFixed(1)} - 656.3 = ${dl >= 0 ? "+" : ""}${dl.toFixed(1)}\\,\\text{nm}`,
        `v = c\\,\\frac{\\Delta\\lambda}{\\lambda} = 300{,}000 \\times \\frac{${dl >= 0 ? "" : "-"}${Math.abs(dl).toFixed(1)}}{656.3} \\approx ${vTrue >= 0 ? "+" : "-"}${Math.abs(vTrue).toLocaleString("en-US")}\\,\\text{km/s}`,
      ],
      note: `About ${Math.abs(vTrue).toLocaleString("en-US")} km/s ${dirRecede ? "AWAY from us — the line is shifted redward (longer wavelength), a REDSHIFT" : "TOWARD us — the line is shifted blueward (shorter wavelength), a BLUESHIFT"}. Because the rest wavelengths of the elements are known precisely from the laboratory, any measured shift converts directly into a velocity — a speedometer for objects we can never visit. ${Math.abs(vTrue) >= 10000 ? "Speeds this large are the realm of the galaxies — and the discovery that nearly all galaxies are redshifted, receding faster the farther they are, revealed the expanding universe and founded modern cosmology." : "Applied to stars, this technique detects binary companions and even exoplanets, from the tiny rhythmic wobble their gravity induces in their sun."} All of it read from the position of a dark line in a rainbow.`,
    };
  },

  "photon-energy": (rng) => {
    // the energy of the atomic jump behind a spectral line: E(eV) ≈ 1240/λ(nm)
    const lines: [string, number][] = [["hydrogen's red Hα line", 656.3], ["sodium's yellow D line", 589.0], ["helium's yellow line — the one that betrayed a new element in the Sun", 587.6], ["calcium's violet K line", 393.4]];
    const [name, lam] = lines[sample(rng, [0, 1, 2, 3], 1)[0]];
    const E = 1240 / lam;
    return {
      title: "The energy behind a spectral line",
      question: `Every spectral line marks an electron jumping between two energy levels, absorbing or emitting a photon of exactly the gap's energy. A photon's energy in electron-volts is E ≈ 1240/λ, with λ in nanometres. What jump energy lies behind ${name}, at ${lam} nm?`,
      steps: [
        `E = \\frac{1240}{\\lambda} = \\frac{1240}{${lam}}`,
        `E \\approx ${E.toFixed(2)}\\,\\text{eV}`,
      ],
      note: `About ${E.toFixed(2)} electron-volts — the exact spacing between two rungs on the energy ladder inside the atom. This is WHY the fingerprints exist: each element's atoms have their own unique set of energy levels, so their own unique set of possible jumps, so their own unique set of line wavelengths — the same everywhere in the universe, because atoms are built the same everywhere. Kirchhoff and Bunsen used the fingerprints for half a century before quantum theory explained them — one more case of the pattern that runs through this whole story: the exact empirical law first (Kepler, Newton, Kirchhoff), the deep cause later.`,
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

export function WorkedExample({ spec, lang = "en" }: { spec: string; lang?: string }) {
  const kind = spec.trim();
  const gen = GENERATORS[kind];
  const [seed, setSeed] = useState(0);
  const [revealed, setRevealed] = useState(false);

  // seed + 1 so the first (deterministic) example still gets a non-zero seed.
  const example = useMemo(() => (gen ? gen(mulberry32(seed + 1)) : null), [gen, seed]);
  if (!example) return null;

  return (
    <div className="worked-example">
      <div className="we-head">{example.title} · {t(lang, "yourTurn")}</div>
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
            {t(lang, "reveal")}
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
          {t(lang, "tryAnother")} &#8635;
        </button>
      </div>
    </div>
  );
}
