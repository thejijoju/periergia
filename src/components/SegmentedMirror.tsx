"use client";

import { useMemo, useRef, useState } from "react";

// An interactive, drag-to-rotate 3D model of a segmented telescope mirror,
// embedded in an article via a fenced ```segmentedmirror block (see Reader's
// `pre` override). A giant mirror is built from many small hexagonal segments;
// drag to tilt the disk in 3D and watch the segments stay locked as one
// surface, and toggle between a Keck-scale and an ELT-scale tiling to see how
// the architecture scales with no single big piece of glass. Pure CSS 3D
// transforms (no library); themed via `currentColor` on Tailwind text-* groups
// so it re-themes in light and dark. First render is deterministic (a fixed
// tilt) so SSR and the first client paint agree.

type Hex = { x: number; y: number };

// Flat-top hex grid filling a disk of `rings` rings around the center.
function hexDisk(rings: number, size: number): Hex[] {
  const out: Hex[] = [];
  const s3 = Math.sqrt(3);
  for (let q = -rings; q <= rings; q++) {
    const rMin = Math.max(-rings, -q - rings);
    const rMax = Math.min(rings, -q + rings);
    for (let r = rMin; r <= rMax; r++) {
      out.push({ x: size * 1.5 * q, y: size * s3 * (r + q / 2) });
    }
  }
  return out;
}

// One flat-top hexagon's points, centered at (cx, cy).
function hexPoints(cx: number, cy: number, size: number): string {
  const gap = size * 0.92; // small kerf between segments
  let p = "";
  for (let i = 0; i < 6; i++) {
    const a = (Math.PI / 180) * (60 * i);
    p += `${(cx + gap * Math.cos(a)).toFixed(1)},${(cy + gap * Math.sin(a)).toFixed(1)} `;
  }
  return p.trim();
}

const MODES = {
  keck: { rings: 3, label: "Keck-scale", note: "37 segments ≈ Keck's 36 (10 m)" },
  elt: { rings: 5, label: "ELT-scale", note: "91 segments — the ELT tiles 798 (39 m)" },
} as const;
type ModeKey = keyof typeof MODES;

export function SegmentedMirror() {
  const [mode, setMode] = useState<ModeKey>("keck");
  // Rotation, in degrees. Deterministic default tilt for SSR.
  const [rot, setRot] = useState({ x: 24, y: -26 });
  const drag = useRef<{ px: number; py: number; rx: number; ry: number } | null>(null);
  const [active, setActive] = useState(false);

  const SIZE = 15;
  const { rings, note } = MODES[mode];
  const hexes = useMemo(() => hexDisk(rings, SIZE), [rings]);
  const count = hexes.length;
  const extent = SIZE * 1.5 * rings + SIZE * 2;

  const onDown = (e: React.PointerEvent) => {
    (e.target as Element).setPointerCapture?.(e.pointerId);
    drag.current = { px: e.clientX, py: e.clientY, rx: rot.x, ry: rot.y };
    setActive(true);
  };
  const onMove = (e: React.PointerEvent) => {
    if (!drag.current) return;
    const dx = e.clientX - drag.current.px;
    const dy = e.clientY - drag.current.py;
    const clamp = (v: number, m: number) => Math.max(-m, Math.min(m, v));
    setRot({
      x: clamp(drag.current.rx - dy * 0.4, 62),
      y: clamp(drag.current.ry + dx * 0.4, 62),
    });
  };
  const onUp = () => {
    drag.current = null;
    setActive(false);
  };

  // Specular glint drifts across the disk as it tilts, reading as a reflection.
  const glintX = 50 + rot.y * 0.55;
  const glintY = 40 - rot.x * 0.55;

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div
        className="mx-auto flex touch-none items-center justify-center select-none"
        style={{ perspective: "760px", height: `${extent * 1.7}px`, maxWidth: "100%", cursor: active ? "grabbing" : "grab" }}
        onPointerDown={onDown}
        onPointerMove={onMove}
        onPointerUp={onUp}
        onPointerLeave={onUp}
        role="img"
        aria-label={`A ${count}-segment hexagonal telescope mirror; drag to rotate it in 3D.`}
      >
        <div
          style={{
            transform: `rotateX(${rot.x}deg) rotateY(${rot.y}deg)`,
            transformStyle: "preserve-3d",
            transition: active ? "none" : "transform 0.25s ease-out",
          }}
        >
          <svg
            viewBox={`${-extent} ${-extent} ${extent * 2} ${extent * 2}`}
            width={Math.min(extent * 2, 360)}
            height={Math.min(extent * 2, 360)}
            style={{ display: "block", maxWidth: "100%" }}
          >
            <defs>
              <radialGradient id="mirror-glint" cx={`${glintX}%`} cy={`${glintY}%`} r="65%">
                <stop offset="0%" stopColor="white" stopOpacity="0.55" />
                <stop offset="45%" stopColor="white" stopOpacity="0.12" />
                <stop offset="100%" stopColor="white" stopOpacity="0" />
              </radialGradient>
            </defs>
            {/* The glass segments */}
            {hexes.map((h, i) => (
              <polygon
                key={i}
                className="text-purple"
                points={hexPoints(h.x, h.y, SIZE)}
                fill="currentColor"
                fillOpacity={0.16}
                stroke="currentColor"
                strokeOpacity={0.5}
                strokeWidth={0.8}
              />
            ))}
            {/* The moving specular reflection, clipped to the segment cloud */}
            {hexes.map((h, i) => (
              <polygon key={`g${i}`} points={hexPoints(h.x, h.y, SIZE)} fill="url(#mirror-glint)" />
            ))}
          </svg>
        </div>
      </div>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong>{count} hexagonal segments</strong>, held by computer in such perfect concert that starlight reflects off them as one flawless parabola. <span className="text-muted">Drag to tilt it.</span>
      </p>

      <div className="mt-3 flex flex-wrap items-center justify-center gap-2">
        {(Object.keys(MODES) as ModeKey[]).map((k) => (
          <button
            key={k}
            type="button"
            onClick={() => setMode(k)}
            aria-pressed={mode === k}
            className={`font-sans text-[12px] rounded-md border px-3 py-1.5 transition-colors ${
              mode === k ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink"
            }`}
          >
            {MODES[k].label}
          </button>
        ))}
        <button
          type="button"
          onClick={() => setRot({ x: 24, y: -26 })}
          className="font-sans text-[12px] rounded-md border border-line px-3 py-1.5 text-muted transition-colors hover:text-ink"
        >
          Reset view
        </button>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        {note}. The segmented mirror is the architecture that broke the sag wall: instead of one huge rigid disk (impossible to cast and support past ~8 m), the giant surface is built from dozens or hundreds of small, stiff hexagons, each individually positioned by actuators to a fraction of the wavelength of light. The size of the telescope is decoupled from the size of any single piece of glass — which is why we jumped from 5-metre monoliths to a 39-metre mosaic.
      </figcaption>
    </figure>
  );
}
