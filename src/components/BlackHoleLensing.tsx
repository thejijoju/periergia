"use client";

import { useEffect, useRef, useState } from "react";

// An interactive gravitational-lensing renderer, embedded in an article via a
// fenced ```blackholelensing block (see Reader's `pre` override). This is a
// real backward ray tracer for null geodesics in the Schwarzschild metric —
// not a stylised graphic — computed on a <canvas> rather than as an SVG
// vector diagram (the site's usual pattern) because a lensed accretion-disk
// image is fundamentally a raster problem, the same reason every real
// black-hole render, from the Event Horizon Telescope's to Interstellar's
// "Gargantua", is a renderer rather than a hand-drawn figure.
//
// Units: the Schwarzschild radius r_s = 1. Photon sphere at 1.5, ISCO (inner
// disk edge) at 3, outer disk edge at 14. For each pixel, its position in the
// observer's image plane is an impact-parameter vector (bx, by); since a
// Schwarzschild spacetime is spherically symmetric, every individual photon's
// path is planar (the plane containing the observer and its initial
// direction), so the problem reduces to integrating one 2nd-order radial
// ODE per ray:
//
//   d^2r/dλ^2 = b^2/r^3 - bend * 1.5 * b^2/r^4      (bend = 1 for GR, 0 for
//   dφ/dλ = b/r^2                                    "Newtonian" / no lensing)
//
// starting from flat-space initial conditions at a large radius (curvature
// there is negligible regardless of impact parameter, since it's set by
// r_s/r at that radius, not by how deep the ray eventually plunges) and
// integrated inward via RK4 with an adaptive step. The ray's 3D position is
// reconstructed at every step and checked for a crossing of the disk plane
// (world z = 0); the first crossing inside [R_ISCO, R_OUTER] is the visible
// surface. Rays that cross the plane first in the empty gap between the
// horizon and the ISCO are NOT stopped there — they keep integrating, which
// is what lets a ray wrap behind the hole and cross the disk plane a second
// time within the valid annulus, reproducing the famous effect of seeing the
// far side of the disk lensed into view above and below the silhouette,
// with no special-casing required: it falls out of the physics.
//
// Rendered in a fixed dark cosmic palette regardless of site theme (the same
// choice PolarisAltitude's "sky" view makes) since a black-hole image reads
// as astronomical imagery, not a themed UI element. Computed in row batches
// via requestAnimationFrame rather than in one blocking pass, so the image
// visibly resolves rather than freezing the page — apt, given the subject.

const R_S = 1; // Schwarzschild radius, our unit
const R_ISCO = 3; // inner edge of the accretion disk
const R_OUTER = 14; // outer edge of the accretion disk
const R_START = 60; // radius at which integration begins (flat-space init)
const B_MAX = R_OUTER * 1.75; // half-width of the traced impact-parameter window
const ESCAPE_R = R_START * 3;
const MAX_STEPS = 900;
const RES = 220; // backing canvas resolution (square)

type Vec3 = [number, number, number];
const clamp = (v: number, lo: number, hi: number) => Math.max(lo, Math.min(hi, v));
const lerp = (a: number, b: number, t: number) => a + (b - a) * t;

// Orthonormal camera basis for inclination `inc` (radians from the spin
// axis: 0 = face-on/pole-on, PI/2 = edge-on). n = direction from the black
// hole to the observer; right/up span the image plane.
function basis(inc: number): { n: Vec3; right: Vec3; up: Vec3 } {
  const s = Math.sin(inc), c = Math.cos(inc);
  const n: Vec3 = [s, 0, c];
  const right: Vec3 = [0, -1, 0];
  const up: Vec3 = [-c, 0, s];
  return { n, right, up };
}

type Hit = { r: number; x: number; y: number } | null;

// Trace one ray of impact parameter (bx, by). Returns the disk-plane
// crossing point if the ray strikes the visible disk, else null (horizon
// capture or escape to background).
function traceRay(bx: number, by: number, inc: number, bend: number): Hit {
  const b = Math.hypot(bx, by);
  if (b < 1e-4) return null; // ~radial infall — captured, negligible fraction of pixels

  const { n, right, up } = basis(inc);
  const ex = bx / b, ey = by / b;
  const e: Vec3 = [
    right[0] * ex + up[0] * ey,
    right[1] * ex + up[1] * ey,
    right[2] * ex + up[2] * ey,
  ];

  let r = Math.sqrt(R_START * R_START + b * b);
  let phi = Math.atan2(b, R_START);
  let rdot = -R_START / r;

  let prevX = r * (Math.cos(phi) * n[0] + Math.sin(phi) * e[0]);
  let prevY = r * (Math.cos(phi) * n[1] + Math.sin(phi) * e[1]);
  let prevZ = r * (Math.cos(phi) * n[2] + Math.sin(phi) * e[2]);

  const bb = b * b;
  const acc = (rr: number) => bb / (rr * rr * rr) - bend * 1.5 * bb / (rr * rr * rr * rr);
  const dphi = (rr: number) => b / (rr * rr);

  for (let step = 0; step < MAX_STEPS; step++) {
    if (r <= R_S) return null; // swallowed
    if (r > ESCAPE_R && rdot > 0) return null; // escaped to background

    const h = clamp(r * 0.045, 0.02, 1.6);

    // RK4 on the coupled system dr/dλ=rdot, drdot/dλ=acc(r), dφ/dλ=dphi(r)
    const k1r = rdot, k1v = acc(r), k1p = dphi(r);
    const r2 = r + (h / 2) * k1r, rdot2 = rdot + (h / 2) * k1v;
    const k2r = rdot2, k2v = acc(r2), k2p = dphi(r2);
    const r3 = r + (h / 2) * k2r, rdot3 = rdot + (h / 2) * k2v;
    const k3r = rdot3, k3v = acc(r3), k3p = dphi(r3);
    const r4 = r + h * k3r, rdot4 = rdot + h * k3v;
    const k4r = rdot4, k4v = acc(r4), k4p = dphi(r4);

    r = r + (h / 6) * (k1r + 2 * k2r + 2 * k3r + k4r);
    rdot = rdot + (h / 6) * (k1v + 2 * k2v + 2 * k3v + k4v);
    phi = phi + (h / 6) * (k1p + 2 * k2p + 2 * k3p + k4p);

    const x = r * (Math.cos(phi) * n[0] + Math.sin(phi) * e[0]);
    const y = r * (Math.cos(phi) * n[1] + Math.sin(phi) * e[1]);
    const z = r * (Math.cos(phi) * n[2] + Math.sin(phi) * e[2]);

    if ((prevZ < 0) !== (z < 0)) {
      const frac = prevZ / (prevZ - z || 1e-9);
      const xc = prevX + frac * (x - prevX);
      const yc = prevY + frac * (y - prevY);
      const rc = Math.hypot(xc, yc);
      if (rc >= R_ISCO && rc <= R_OUTER) return { r: rc, x: xc, y: yc };
      // crossing outside the disk annulus: keep integrating — this is what
      // lets a ray wrap around and find the disk's far side.
    }
    prevX = x; prevY = y; prevZ = z;
  }
  return null;
}

// Disk surface color: hot pale gold near the inner edge cooling to deep
// orange-red at the outer edge, modulated by a simplified (not fully
// relativistic) Doppler brightness asymmetry from the disk's rotation —
// the approaching side brighter, the receding side dimmer, as in real
// accretion-disk images.
function diskColor(r: number, x: number, y: number, n: Vec3): [number, number, number, number] {
  const t = clamp((r - R_ISCO) / (R_OUTER - R_ISCO), 0, 1);
  const R = lerp(255, 230, t), G = lerp(238, 90, t), B = lerp(200, 35, t);
  const vx = -y / r, vy = x / r; // prograde tangential unit vector
  const approach = clamp(vx * n[0] + vy * n[1], -1, 1);
  const brightness = clamp(0.55 + 0.55 * (1 - t), 0.25, 1.3) * clamp(1 + 0.7 * approach, 0.3, 1.9);
  const a = clamp(brightness, 0, 1.6);
  return [clamp(R * Math.min(1, brightness), 0, 255), clamp(G * Math.min(1, brightness), 0, 255), clamp(B * Math.min(1, brightness), 0, 255), Math.min(1, a) * 255];
}

const STARS = Array.from({ length: 90 }, (_, i) => {
  const x = (i * 63 + 17) % RES;
  const y = (i * 41 + 9) % RES;
  const o = 0.15 + ((i * 11) % 10) / 18;
  return { x, y, o };
});

export function BlackHoleLensing() {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const [incDeg, setIncDeg] = useState(78);
  const [gr, setGr] = useState(true);
  const [rendering, setRendering] = useState(true);
  const jobRef = useRef(0);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx2d = canvas.getContext("2d");
    if (!ctx2d) return;
    const ctx: CanvasRenderingContext2D = ctx2d;

    const myJob = ++jobRef.current;
    setRendering(true);
    const inc = (incDeg * Math.PI) / 180;
    const bend = gr ? 1 : 0;

    const img = ctx.createImageData(RES, RES);
    // background: near-black with a faint scatter of deterministic stars
    for (let p = 0; p < RES * RES; p++) {
      img.data[p * 4] = 8; img.data[p * 4 + 1] = 7; img.data[p * 4 + 2] = 12; img.data[p * 4 + 3] = 255;
    }
    for (const s of STARS) {
      const idx = (s.y * RES + s.x) * 4;
      const v = Math.round(230 * s.o);
      img.data[idx] = v; img.data[idx + 1] = v; img.data[idx + 2] = Math.min(255, v + 15); img.data[idx + 3] = 255;
    }

    let row = 0;
    const { n } = basis(inc);
    const rowsPerFrame = 3;

    function renderRows() {
      if (jobRef.current !== myJob) return; // superseded by a newer render
      const endRow = Math.min(RES, row + rowsPerFrame);
      for (; row < endRow; row++) {
        const by = -(((row + 0.5) / RES - 0.5) * 2 * B_MAX);
        for (let px = 0; px < RES; px++) {
          const bx = ((px + 0.5) / RES - 0.5) * 2 * B_MAX;
          const hit = traceRay(bx, by, inc, bend);
          if (hit) {
            const [R, G, B] = diskColor(hit.r, hit.x, hit.y, n);
            const idx = (row * RES + px) * 4;
            img.data[idx] = R; img.data[idx + 1] = G; img.data[idx + 2] = B; img.data[idx + 3] = 255;
          }
        }
      }
      ctx.putImageData(img, 0, 0);
      if (row < RES) {
        requestAnimationFrame(renderRows);
      } else {
        setRendering(false);
      }
    }
    requestAnimationFrame(renderRows);

    return () => { jobRef.current++; };
  }, [incDeg, gr]);

  return (
    <figure className="my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="mb-3 flex flex-wrap items-center justify-center gap-2">
        {([true, false] as const).map((mode) => (
          <button
            key={String(mode)}
            type="button"
            onClick={() => setGr(mode)}
            className={`font-sans text-[11.5px] rounded-full px-3 py-1 transition-colors ${
              gr === mode ? "bg-purple text-page font-semibold" : "border border-line text-muted hover:text-ink hover:border-ink"
            }`}
          >
            {mode ? "General relativity" : "Newtonian (no lensing)"}
          </button>
        ))}
      </div>

      <div className="relative mx-auto w-full max-w-[360px]" style={{ background: "#08070c", borderRadius: "0.75rem" }}>
        <canvas
          ref={canvasRef}
          width={RES}
          height={RES}
          className="block h-auto w-full rounded-xl"
          style={{ imageRendering: "auto" }}
          role="img"
          aria-label={`A ray-traced image of a Schwarzschild black hole and its accretion disk, viewed at ${incDeg} degrees from face-on, ${gr ? "with" : "without"} gravitational light bending.`}
        />
        {rendering && (
          <div className="pointer-events-none absolute bottom-2 right-2 font-sans text-[10px] tracking-wide text-white/40">
            rendering…
          </div>
        )}
      </div>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Inclination (from face-on)</span>
            <span className="tabular-nums">{incDeg}&deg;</span>
          </span>
          <input
            type="range" min={5} max={89} step={1} value={incDeg}
            onChange={(e) => setIncDeg(Number(e.target.value))}
            aria-label="Inclination" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }}
          />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A real backward ray trace of null geodesics around a Schwarzschild black hole, not a stylised drawing: for every pixel, a light ray is integrated inward from the observer and checked for where it strikes the flat accretion disk. In <span className="text-ink">general relativity</span>, light bends around the hole strongly enough that the far side of the disk is lensed into view above and below the silhouette &mdash; the same effect that gives real black-hole images their ring shape. Toggle to <span className="text-ink">Newtonian</span> and the bending term is switched off: rays travel in straight lines, so the disk is simply foreshortened and the far side stays hidden, exactly as ordinary optics would predict. The brighter arc is the side of the disk rotating toward the observer.
      </figcaption>
    </figure>
  );
}
