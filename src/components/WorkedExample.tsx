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
