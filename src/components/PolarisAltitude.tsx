"use client";

import { useState } from "react";

// An interactive Polaris-altitude globe, embedded in an article via a fenced
// ```polarisaltitude block (see Reader's `pre` override). The master relation
// of celestial navigation: the pole star's altitude above the horizon equals
// the observer's latitude — because both are the same angle, one swept at
// Earth's centre (latitude) and the other swept at the observer's feet
// (altitude), joined by a line to Polaris that is, for practical purposes,
// parallel no matter where on Earth it is drawn (the star is ~433 light-years
// away). Drag the globe to orbit it and confirm the two arcs stay equal from
// any angle; slide latitude or tap a preset to match the article's own
// examples. currentColor theming (light/dark); first render deterministic
// (New York, 40°N).

type V3 = { x: number; y: number; z: number };
const deg = Math.PI / 180;

const sub = (a: V3, b: V3): V3 => ({ x: a.x - b.x, y: a.y - b.y, z: a.z - b.z });
const dot = (a: V3, b: V3) => a.x * b.x + a.y * b.y + a.z * b.z;
const norm = (a: V3): V3 => {
  const l = Math.hypot(a.x, a.y, a.z) || 1;
  return { x: a.x / l, y: a.y / l, z: a.z / l };
};
function rotY(v: V3, a: number): V3 {
  const c = Math.cos(a), s = Math.sin(a);
  return { x: v.x * c + v.z * s, y: v.y, z: -v.x * s + v.z * c };
}
function rotX(v: V3, a: number): V3 {
  const c = Math.cos(a), s = Math.sin(a);
  return { x: v.x, y: v.y * c - v.z * s, z: v.y * s + v.z * c };
}

const R = 96; // globe radius, svg units
const RAY_LEN = R * 2.1; // how far the "to Polaris" rays are drawn
const DIST = 300, FOCAL = 360; // camera distance / focal length
const CX = 150, CY = 154; // viewBox centre (300x290 viewBox)

function observerPos(latDeg: number): V3 {
  const phi = latDeg * deg;
  return { x: 0, y: R * Math.sin(phi), z: R * Math.cos(phi) };
}
function tangentBasis(latDeg: number) {
  const phi = latDeg * deg;
  return {
    zenith: { x: 0, y: Math.sin(phi), z: Math.cos(phi) } as V3,
    horizonDir: { x: 0, y: Math.cos(phi), z: -Math.sin(phi) } as V3,
  };
}

function toCam(p: V3, yaw: number, pitch: number): V3 {
  return rotX(rotY(p, yaw), pitch);
}
function project(p: V3, yaw: number, pitch: number): { x: number; y: number } | null {
  const v = toCam(p, yaw, pitch);
  const z = v.z + DIST;
  if (z <= 1) return null;
  const s = FOCAL / z;
  return { x: CX + v.x * s, y: CY - v.y * s };
}

// Arc from `from` to `to` (both unit vectors, coplanar with the world x=0
// plane — true of every angle this figure draws), swept the short way.
function arcPoints(center: V3, from: V3, to: V3, radius: number, steps: number): V3[] {
  const axisX = from.y * to.z - from.z * to.y;
  const angle = Math.acos(Math.max(-1, Math.min(1, dot(from, to))));
  const sign = axisX < 0 ? -1 : 1;
  const pts: V3[] = [];
  for (let i = 0; i <= steps; i++) {
    const t = (i / steps) * angle * sign;
    const c = Math.cos(t), s = Math.sin(t);
    pts.push({
      x: center.x,
      y: center.y + radius * (from.y * c - from.z * s),
      z: center.z + radius * (from.y * s + from.z * c),
    });
  }
  return pts;
}

type Line = { id: string; pts: V3[]; kind: "equator" | "grid" };
function buildGlobeLines(): Line[] {
  const lines: Line[] = [];
  for (let lat = -60; lat <= 60; lat += 30) {
    const phi = lat * deg;
    const ring: V3[] = [];
    for (let i = 0; i <= 32; i++) {
      const th = (i / 32) * Math.PI * 2;
      ring.push({ x: R * Math.cos(phi) * Math.sin(th), y: R * Math.sin(phi), z: R * Math.cos(phi) * Math.cos(th) });
    }
    lines.push({ id: `lat-${lat}`, pts: ring, kind: lat === 0 ? "equator" : "grid" });
  }
  for (let lon = 0; lon < 8; lon++) {
    const th = (lon / 8) * Math.PI * 2;
    const ring: V3[] = [];
    for (let i = 0; i <= 32; i++) {
      const phi = -Math.PI / 2 + (i / 32) * Math.PI;
      ring.push({ x: R * Math.cos(phi) * Math.sin(th), y: R * Math.sin(phi), z: R * Math.cos(phi) * Math.cos(th) });
    }
    lines.push({ id: `lon-${lon}`, pts: ring, kind: "grid" });
  }
  return lines;
}
const GLOBE_LINES = buildGlobeLines();

function avgCamZ(pts: V3[], yaw: number, pitch: number) {
  let z = 0;
  for (const p of pts) z += toCam(p, yaw, pitch).z;
  return pts.length ? z / pts.length : 0;
}

// Build one <path> per near/far segment run so backface dimming (the far
// hemisphere of the wireframe reads fainter) survives as a single stroke
// rather than one element per segment.
function globeLinePaths(line: Line, yaw: number, pitch: number) {
  const segs: { d: string; near: boolean }[] = [];
  let cur = "";
  let curNear: boolean | null = null;
  for (let i = 0; i < line.pts.length; i++) {
    const p = line.pts[i];
    const near = toCam(p, yaw, pitch).z < 0;
    const s = project(p, yaw, pitch);
    if (!s) { if (cur) segs.push({ d: cur, near: !!curNear }); cur = ""; curNear = null; continue; }
    if (curNear !== null && curNear !== near) { segs.push({ d: cur, near: curNear }); cur = ""; }
    cur += cur ? ` L ${s.x.toFixed(2)} ${s.y.toFixed(2)}` : `M ${s.x.toFixed(2)} ${s.y.toFixed(2)}`;
    curNear = near;
  }
  if (cur) segs.push({ d: cur, near: !!curNear });
  return segs;
}

function pathFrom(pts: V3[], yaw: number, pitch: number): string {
  let d = "";
  for (const p of pts) {
    const s = project(p, yaw, pitch);
    if (!s) continue;
    d += d ? ` L ${s.x.toFixed(2)} ${s.y.toFixed(2)}` : `M ${s.x.toFixed(2)} ${s.y.toFixed(2)}`;
  }
  return d;
}

const PRESETS: [string, number][] = [["Equator", 0], ["New York", 40], ["London", 51.5], ["North Pole", 90]];
const SANS = "ui-sans-serif, system-ui, sans-serif";

export function PolarisAltitude() {
  const [lat, setLat] = useState(40);
  const [yaw, setYaw] = useState(0.55);
  const [pitch, setPitch] = useState(0.28);
  const [dragging, setDragging] = useState(false);

  const obs = observerPos(lat);
  const { horizonDir } = tangentBasis(lat);
  const polarisDir: V3 = { x: 0, y: 1, z: 0 };

  type Item = { z: number; el: React.ReactNode };
  const items: Item[] = [];

  for (const line of GLOBE_LINES) {
    const segs = globeLinePaths(line, yaw, pitch);
    items.push({
      z: avgCamZ(line.pts, yaw, pitch),
      el: (
        <g key={line.id}>
          {segs.map((s, i) => (
            <path
              key={i}
              d={s.d}
              fill="none"
              className={line.kind === "equator" ? "text-purple" : "text-muted"}
              stroke="currentColor"
              strokeWidth={line.kind === "equator" ? 1.3 : 0.8}
              opacity={line.kind === "equator" ? (s.near ? 0.55 : 0.16) : s.near ? 0.5 : 0.12}
            />
          ))}
        </g>
      ),
    });
  }

  // axis, extended to Polaris
  {
    const pts: V3[] = [{ x: 0, y: -RAY_LEN * 0.5, z: 0 }, { x: 0, y: RAY_LEN, z: 0 }];
    items.push({
      z: avgCamZ(pts, yaw, pitch),
      el: (
        <path key="axis" d={pathFrom(pts, yaw, pitch)} className="text-faint" stroke="currentColor"
          strokeWidth={1} strokeDasharray="3 3" opacity={0.6} fill="none" />
      ),
    });
    const p = { x: 0, y: RAY_LEN, z: 0 };
    const s = project(p, yaw, pitch);
    if (s) {
      items.push({
        z: toCam(p, yaw, pitch).z,
        el: (
          <g key="polaris">
            <circle cx={s.x} cy={s.y} r={2.6} className="text-ink" fill="currentColor" />
            <text x={s.x + 8} y={s.y + 3} className="text-muted" fill="currentColor" fontSize={9} fontFamily={SANS}>
              Polaris
            </text>
          </g>
        ),
      });
    }
  }

  // ray from observer to Polaris (maroon, dashed)
  {
    const far = { x: obs.x, y: obs.y + RAY_LEN * 0.7, z: obs.z };
    const pts = [obs, far];
    items.push({
      z: avgCamZ(pts, yaw, pitch) - 4,
      el: (
        <path key="ray" d={pathFrom(pts, yaw, pitch)} className="text-maroon" stroke="currentColor"
          strokeWidth={1.6} strokeDasharray="3 3" opacity={0.85} fill="none" />
      ),
    });
  }

  // altitude arc at the observer (maroon)
  {
    const arcR = 22;
    const pts = arcPoints(obs, horizonDir, polarisDir, arcR, 20);
    items.push({
      z: avgCamZ(pts, yaw, pitch) - 6,
      el: <path key="alt-arc" d={pathFrom(pts, yaw, pitch)} className="text-maroon" stroke="currentColor" strokeWidth={2} fill="none" />,
    });
  }

  // latitude arc at Earth's centre (purple)
  {
    const center: V3 = { x: 0, y: 0, z: 0 };
    const from: V3 = { x: 0, y: 0, z: 1 };
    const to = norm(sub(obs, center));
    const arcR = 32;
    const pts = arcPoints(center, from, to, arcR, 20);
    items.push({
      z: avgCamZ(pts, yaw, pitch) - 5,
      el: <path key="lat-arc" d={pathFrom(pts, yaw, pitch)} className="text-purple" stroke="currentColor" strokeWidth={2} fill="none" />,
    });
  }

  // observer marker
  {
    const s = project(obs, yaw, pitch);
    if (s) {
      items.push({
        z: toCam(obs, yaw, pitch).z - 8,
        el: <circle key="observer" cx={s.x} cy={s.y} r={3} className="text-ink" fill="currentColor" />,
      });
    }
  }

  items.sort((a, b) => b.z - a.z); // far first (painter's algorithm)

  function handlePointerMove(e: React.PointerEvent<SVGSVGElement>) {
    if (!dragging) return;
    setYaw((y) => y + e.movementX * 0.008);
    setPitch((p) => Math.max(-1.1, Math.min(1.1, p + e.movementY * 0.008)));
  }

  return (
    <figure className="my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="grid gap-5 sm:grid-cols-[1fr_auto] sm:items-center">
        <svg
          viewBox="0 0 300 290"
          className="mx-auto block h-auto w-full max-w-[320px] cursor-grab touch-none active:cursor-grabbing"
          role="img"
          aria-label={`A 3D globe showing that at latitude ${lat.toFixed(1)} degrees, Polaris's altitude above the horizon is also ${lat.toFixed(1)} degrees. Drag to orbit.`}
          onPointerDown={(e) => { setDragging(true); e.currentTarget.setPointerCapture(e.pointerId); }}
          onPointerMove={handlePointerMove}
          onPointerUp={() => setDragging(false)}
        >
          {items.map((it) => it.el)}
        </svg>

        <div className="flex flex-row justify-center gap-6 sm:flex-col sm:gap-2 sm:text-right">
          <div>
            <div className="font-sans text-[11px] uppercase tracking-wide text-muted">Your latitude</div>
            <div className="font-sans text-[20px] font-bold tabular-nums text-purple">{lat.toFixed(1)}&deg;</div>
          </div>
          <div>
            <div className="font-sans text-[11px] uppercase tracking-wide text-muted">Polaris altitude</div>
            <div className="font-sans text-[20px] font-bold tabular-nums text-maroon">{lat.toFixed(1)}&deg;</div>
          </div>
        </div>
      </div>

      <p className="mt-1 text-center font-sans text-[11.5px] text-faint">drag the globe to orbit</p>

      <div className="mt-4 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Latitude</span>
            <span className="tabular-nums">{lat.toFixed(1)}&deg;</span>
          </span>
          <input
            type="range" min={0} max={90} step={0.1} value={lat}
            onChange={(e) => setLat(Number(e.target.value))}
            aria-label="Latitude" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }}
          />
        </label>
        <div className="flex flex-wrap gap-2">
          {PRESETS.map(([label, v]) => (
            <button
              key={label} type="button" onClick={() => setLat(v)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink"
            >
              {label}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The <span className="text-purple">purple arc</span> is latitude, swept at Earth&rsquo;s centre between the equatorial plane and the line to the observer. The <span className="text-maroon">maroon arc</span> is Polaris&rsquo;s altitude, swept at the observer between the local horizon and the line of sight to Polaris &mdash; which, at 433 light-years away, points in effectively the same direction from anywhere on Earth. The two angles are drawn from a single piece of geometry, not merely correlated: rotate the globe from any side and they stay locked together.
      </figcaption>
    </figure>
  );
}
