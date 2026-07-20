"use client";

import { useState } from "react";

// An interactive conic-section orbit explorer, embedded in an article via a
// fenced ```orbitshape block (see Reader's `pre` override). Launch horizontally
// from a fixed radius and vary the speed (as a multiple k of the local circular
// speed): vis-viva makes the orbit a conic whose eccentricity is exactly
// e = |k² − 1|. Below circular speed the launch point is apogee (a small
// ellipse dipping inward); above it, apogee swings out; at k = √2 the ellipse
// opens into a parabola and the body escapes; beyond, a hyperbola. Earth sits at
// the focus. currentColor theming (light/dark); first render deterministic
// (k = 1.2). Distances are drawn in units of the launch radius, so open orbits
// correctly run off the frame.

const CX = 220;
const CY = 125;
const S = 48; // px per launch-radius (circular orbit is drawn at this radius)
const R_EARTH = 12; // px, the central body
const R_DRAW_MAX = 44; // stop sampling a conic once r exceeds this (× launch radius)

const px = (x: number) => CX + x * S;
const py = (y: number) => CY - y * S;

// Conic r(θ) = p/(1 + e cosθ) with p = k², rotated so the launch point (an
// apsis) sits at screen-right. k<1 → launch is apogee (rotate 180°); else it's
// perigee. Returns an SVG path, broken where r runs past the draw limit.
function orbitPath(k: number): string {
  const e = Math.abs(k * k - 1);
  const p = k * k;
  const omega = k < 1 ? Math.PI : 0;
  const co = Math.cos(omega), so = Math.sin(omega);
  const N = 240;
  let d = "";
  let pen = false;
  for (let i = 0; i <= N; i++) {
    const th = (-Math.PI + (i / N) * 2 * Math.PI);
    const denom = 1 + e * Math.cos(th);
    if (denom <= 1e-3) { pen = false; continue; } // asymptote of an open orbit
    const r = p / denom;
    if (r > R_DRAW_MAX || r <= 0) { pen = false; continue; }
    const x0 = r * Math.cos(th), y0 = r * Math.sin(th);
    const x = x0 * co - y0 * so, y = x0 * so + y0 * co;
    d += `${pen ? "L" : "M"}${px(x).toFixed(1)} ${py(y).toFixed(1)}`;
    pen = true;
  }
  return d;
}

const SQRT2 = Math.SQRT2;

function classify(k: number): { label: string; cls: string } {
  const e = Math.abs(k * k - 1);
  if (e < 0.02) return { label: "Circular orbit", cls: "text-purple" };
  if (k < SQRT2 - 0.01) return { label: "Elliptical orbit — bound", cls: "text-purple" };
  if (k <= SQRT2 + 0.01) return { label: "Parabola — just escaping", cls: "text-maroon" };
  return { label: "Hyperbola — escaping", cls: "text-maroon" };
}

export function OrbitShape() {
  const [k, setK] = useState(1.2);
  const e = Math.abs(k * k - 1);
  const bound = k < SQRT2 - 0.005;
  const a = bound ? 1 / (2 - k * k) : Infinity; // × launch radius
  const rp = bound ? a * (1 - e) : k * k / (1 + e); // perigee (× launch radius)
  const ra = bound ? a * (1 + e) : Infinity; // apogee
  const { label, cls } = classify(k);

  // Launch point sits at screen-right, one launch-radius out.
  const lx = px(1), ly = py(0);

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`Launching at ${k.toFixed(2)}× circular speed gives a ${label.toLowerCase()} with eccentricity ${e.toFixed(2)}.`}>
        {/* reference circular orbit */}
        <circle className="text-line" cx={CX} cy={CY} r={S} fill="none" stroke="currentColor"
          strokeWidth={1} strokeDasharray="2 4" opacity={0.6} />
        {/* the orbit */}
        <path className={cls} d={orbitPath(k)} fill="none" stroke="currentColor" strokeWidth={2.6}
          strokeLinejoin="round" />
        {/* Earth at the focus */}
        <circle className="text-purple" cx={CX} cy={CY} r={R_EARTH} fill="currentColor" opacity={0.22} />
        <circle className="text-purple" cx={CX} cy={CY} r={R_EARTH} fill="none" stroke="currentColor" strokeWidth={1.2} />
        {/* launch point + velocity arrow (tangential, i.e. vertical here) */}
        <g className={cls}>
          <circle cx={lx} cy={ly} r={3.6} fill="currentColor" />
          <line x1={lx} y1={ly} x2={lx} y2={ly - 14 - 10 * (k - 1)} stroke="currentColor" strokeWidth={2} />
          <path d={`M${lx - 3} ${ly - 12 - 10 * (k - 1)} L${lx} ${ly - 18 - 10 * (k - 1)} L${lx + 3} ${ly - 12 - 10 * (k - 1)} Z`}
            fill="currentColor" />
        </g>
        <text className="text-muted" x={lx + 6} y={ly + 4} fill="currentColor" fontSize={9} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">launch</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        At <strong className="tabular-nums">{k.toFixed(2)}×</strong> circular speed →{" "}
        <span className={`font-semibold ${cls}`}>{label}</span>, eccentricity{" "}
        <strong className="tabular-nums">{e.toFixed(2)}</strong>.{" "}
        {bound
          ? <>Perigee <strong>{rp.toFixed(2)}</strong>, apogee <strong>{ra.toFixed(2)}</strong> × the launch radius.</>
          : <strong className="text-maroon">It never comes back.</strong>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Launch speed (× local circular speed)</span>
            <span className="tabular-nums">{k.toFixed(2)}×</span>
          </span>
          <input type="range" min={0.6} max={1.7} step={0.01} value={k}
            onChange={(ev) => setK(Number(ev.target.value))}
            aria-label="Launch speed as a multiple of circular speed"
            className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setK(1)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Circular (1.00×)
          </button>
          <button type="button" onClick={() => setK(Number(SQRT2.toFixed(2)))}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Escape (√2 = 1.41×)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        Vis-viva, v² = μ(2/r − 1/a), made visible. Launch horizontally at some multiple <em>k</em> of the local circular speed and the orbit is a conic section with eccentricity exactly <strong>e = |k² − 1|</strong>. Slower than circular and you&rsquo;ve made the launch point the <em>apogee</em> — the orbit dips toward Earth and (if perigee reaches the ground) you&rsquo;ve drawn a ballistic missile. Faster, and apogee swings outward; at exactly √2 × circular speed the ellipse opens into a <span className="text-maroon">parabola</span> and the body escapes forever; beyond that, a hyperbola. Every trajectory in the two-body problem is one of these four curves, and which one you get is set by a single number — the speed.
      </figcaption>
    </figure>
  );
}
