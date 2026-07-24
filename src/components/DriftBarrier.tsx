"use client";

import { useState } from "react";

// An interactive metre-size-barrier explorer, embedded via a fenced ```driftbarrier
// block (see Reader's `pre` override). The central drama of accretion theory. Because
// the disk's gas is pressure-supported it orbits slightly slower than a solid body, so
// every solid feels a permanent headwind — and drag makes it spiral toward the Sun. The
// infall time depends catastrophically on size: it is slowest (safest) for tiny grains,
// which move with the gas, and for large bodies, whose inertia ignores the drag — but it
// plunges to a deep minimum at about ONE METRE, where a boulder spirals into the Sun in
// only a few hundred years, thousands of times faster than the disk itself survives.
// Taken at face value the physics says planets cannot form. Drag the size slider through
// the well. Log-log axes; the curve is a baked literal; the marker is a single
// evaluation the engines agree on. currentColor theming; first render at the 1 m minimum.

const PX0 = 48, PX1 = 418, PY0 = 30, PY1 = 158; // plot box
const r1 = (n: number) => Math.round(n * 10) / 10;
const l10 = Math.log10;
const DISK_LIFE = 5e6; // yr
const TMIN = 500; // yr, the drift minimum at 1 m
// x: size log10(m) in [-6, 5]; y: drift time log10(yr) in [2, 9], inverted (short = low)
const xOf = (m: number) => r1(PX0 + (l10(m) + 6) / 11 * (PX1 - PX0));
const yOf = (t: number) => r1(PY1 - (l10(t) - 2) / 7 * (PY1 - PY0));
const driftOf = (m: number) => TMIN * (m + 1 / m) / 2; // yr (Stokes number = size in metres)

const CURVE = "48,41 51.4,42.8 54.7,44.7 58.1,46.5 61.5,48.3 64.8,50.2 68.2,52 71.5,53.8 74.9,55.6 78.3,57.5 81.6,59.3 85,61.1 88.4,63 91.7,64.8 95.1,66.6 98.5,68.4 101.8,70.3 105.2,72.1 108.5,73.9 111.9,75.8 115.3,77.6 118.6,79.4 122,81.2 125.4,83.1 128.7,84.9 132.1,86.7 135.5,88.6 138.8,90.4 142.2,92.2 145.5,94 148.9,95.9 152.3,97.7 155.6,99.5 159,101.4 162.4,103.2 165.7,105 169.1,106.8 172.5,108.7 175.8,110.5 179.2,112.3 182.5,114.2 185.9,116 189.3,117.8 192.6,119.6 196,121.5 199.4,123.3 202.7,125.1 206.1,126.9 209.5,128.7 212.8,130.6 216.2,132.4 219.5,134.1 222.9,135.9 226.3,137.6 229.6,139.3 233,140.8 236.4,142.2 239.7,143.5 243.1,144.4 246.5,145 249.8,145.2 253.2,145 256.5,144.4 259.9,143.5 263.3,142.2 266.6,140.8 270,139.3 273.4,137.6 276.7,135.9 280.1,134.1 283.5,132.4 286.8,130.6 290.2,128.7 293.5,126.9 296.9,125.1 300.3,123.3 303.6,121.5 307,119.6 310.4,117.8 313.7,116 317.1,114.2 320.5,112.3 323.8,110.5 327.2,108.7 330.5,106.8 333.9,105 337.3,103.2 340.6,101.4 344,99.5 347.4,97.7 350.7,95.9 354.1,94 357.5,92.2 360.8,90.4 364.2,88.6 367.5,86.7 370.9,84.9 374.3,83.1 377.6,81.2 381,79.4 384.4,77.6 387.7,75.8 391.1,73.9 394.5,72.1 397.8,70.3 401.2,68.4 404.5,66.6 407.9,64.8 411.3,63 414.6,61.1 418,59.3";
const DISK_Y = 72.1; // yOf(5e6)
const SIZE_TICKS: [string, number][] = [["1 μm", 48], ["1 mm", 148.9], ["1 m", 249.8], ["1 km", 350.7], ["100 km", 418]];
const INIT_L = 0, INIT_X = 249.8, INIT_Y = 145.2; // log10(size)=0 → 1 m, the minimum

function fmtSize(m: number): string {
  if (m < 1e-3) return `${r1(m * 1e6)} μm`;
  if (m < 1) return `${r1(m * 1e3)} mm`;
  if (m < 1e3) return `${r1(m)} m`;
  return `${r1(m / 1e3)} km`;
}
function fmtTime(yr: number): string {
  if (yr >= 1e6) return `${r1(yr / 1e6)} Myr`;
  if (yr >= 1e3) return `${Math.round(yr / 1e3)},000 yr`;
  return `${Math.round(yr)} yr`;
}

export function DriftBarrier() {
  const [lg, setLg] = useState(INIT_L); // log10(size in metres)

  const m = 10 ** lg;
  const t = driftOf(m);
  const mx = lg === INIT_L ? INIT_X : xOf(m);
  const my = lg === INIT_L ? INIT_Y : yOf(t);
  const doomed = t < DISK_LIFE;
  const ratio = DISK_LIFE / t;

  return (
    <figure className="drift-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label={`A ${fmtSize(m)} body spirals into the Sun in about ${fmtTime(t)}, which is ${doomed ? `${Math.round(ratio)} times faster than the disk survives — it is lost` : "longer than the disk lives — it is safe"}.`}>

        {/* the danger zone: below the disk-lifetime line, bodies are lost */}
        <rect x={PX0} y={DISK_Y} width={PX1 - PX0} height={r1(PY1 - DISK_Y)} className="text-maroon" fill="currentColor" opacity={0.06} />
        <line className="text-maroon" x1={PX0} y1={DISK_Y} x2={PX1} y2={DISK_Y} stroke="currentColor" strokeWidth={1} strokeDasharray="4 3" opacity={0.8} />
        <text className="text-maroon" x={PX1 - 2} y={DISK_Y - 4} textAnchor="end" fill="currentColor" fontSize={7} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">disk lifetime (~5 Myr)</text>
        <text className="text-maroon" x={PX0 + 4} y={PY1 - 5} textAnchor="start" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif" opacity={0.85}>lost to the Sun before the disk clears</text>

        {/* the drift-time curve */}
        <polyline points={CURVE} className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.8} />

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={PX0 - 30} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={6.6} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 30} ${(PY0 + PY1) / 2})`}>time to spiral into the Sun</text>
        {SIZE_TICKS.map(([lbl, x]) => (
          <g key={lbl}>
            <line className="text-faint" x1={x} y1={PY1} x2={x} y2={PY1 + 3} stroke="currentColor" strokeWidth={0.7} />
            <text className="text-faint" x={x} y={PY1 + 12} textAnchor={x === PX0 ? "start" : x === PX1 ? "end" : "middle"} fill="currentColor" fontSize={6.3} fontFamily="ui-sans-serif, system-ui, sans-serif">{lbl}</text>
          </g>
        ))}
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 22} textAnchor="middle" fill="currentColor" fontSize={6.8} fontFamily="ui-sans-serif, system-ui, sans-serif">body size (log scale)</text>

        {/* the marker */}
        <line className="text-ink" x1={mx} y1={PY0} x2={mx} y2={PY1} stroke="currentColor" strokeWidth={0.7} opacity={0.35} />
        <circle className={doomed ? "text-maroon" : "text-ink"} cx={mx} cy={my} r={5} fill="currentColor" />
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A <strong className="text-ink">{fmtSize(m)}</strong> body spirals into the Sun in <strong className={doomed ? "text-maroon" : "text-ink"}>{fmtTime(t)}</strong> — {doomed
          ? <><strong className="text-maroon">{Math.round(ratio).toLocaleString("en-US")}× faster than the disk survives.</strong> It is swept away before it can grow.</>
          : <>longer than the disk lasts, so it survives. Only the extremes are safe.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Body size</span><span className="tabular-nums">{fmtSize(m)} · {fmtTime(t)}</span></span>
          <input type="range" min={-6} max={5} step={0.1} value={lg} onChange={(e) => setLg(Number(e.target.value))} aria-label="Body size (log scale)" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Dust grain (1 μm)", -6], ["Pebble (1 cm)", -2], ["Boulder (1 m)", 0], ["Planetesimal (10 km)", 4]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setLg(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The central drama of planet formation, in one curve. The disk&rsquo;s gas is held up partly by its own pressure, so it orbits a little slower than a solid body would — and every solid therefore flies through it into a permanent <strong>headwind</strong> of about 50 m/s. Drag saps orbital energy, and the body <strong className="text-maroon">spirals toward the Sun.</strong> How fast depends brutally on size. Tiny grains are swept along <em>with</em> the gas and feel almost no wind; huge bodies have too much inertia for drag to matter — both are safe. But at about <strong className="text-ink">one metre</strong> a body is large enough to feel the full headwind yet small enough for drag to dominate its motion, and it plunges into the Sun in just a few hundred years — thousands of times faster than the disk&rsquo;s own few-million-year life. Worse still, metre-sized bodies also collide too fast to stick, bouncing or shattering rather than growing. Contact forces are too weak to hold them and their own gravity is far too weak to help. This is the <strong>metre-size barrier</strong>, and taken at face value it says planetesimals — and therefore planets — should never form. They plainly did, so something is missing: the leading answer, the <strong className="text-purple">streaming instability</strong>, lets drifting pebbles pile up and collapse straight into 100-km planetesimals, skipping the deadly metre scale entirely. The barrier is not a settled question but a problem with a strong leading solution — a gap in the middle of an otherwise well-founded story.
      </figcaption>
    </figure>
  );
}
