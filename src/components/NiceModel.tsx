"use client";

import { useState } from "react";

// An interactive Nice-model explorer, embedded via a fenced ```nicemodel block (see
// Reader's `pre` override). The centrepiece of the lecture: the outer solar system we
// see is NOT the one that formed. The giants began compact, drifted slowly apart as they
// scattered a massive planetesimal disk, and then — when Jupiter and Saturn crossed the
// 2:1 resonance — a system-wide instability flung Uranus and Neptune outward (Neptune
// past Uranus, swapping places), scattered the disk into the Kuiper Belt and Oort Cloud,
// and rained debris on the inner planets. Scrub the timeline and watch the giants' orbits
// evolve through the instability to their present positions. The four orbital tracks are
// baked literals; the moving markers evaluate a piecewise-linear function (pure
// arithmetic, identical in SSR and client). currentColor theming; first render at the
// initial compact configuration.

const PX0 = 48, PX1 = 418, PY0 = 28, PY1 = 150, AMAX = 32;
const r1 = (n: number) => Math.round(n * 10) / 10;
const xOf = (t: number) => r1(PX0 + t * (PX1 - PX0));
const yOf = (a: number) => r1(PY1 - (a / AMAX) * (PY1 - PY0));
const CROSS_X = 270; // xOf(0.6), the 2:1 crossing

// piecewise-linear semi-major-axis histories (AU vs normalized time t in [0,1])
type BP = [number, number][];
const aAt = (bp: BP, t: number): number => {
  for (let i = 1; i < bp.length; i++) {
    if (t <= bp[i][0]) {
      const [t0, a0] = bp[i - 1], [t1, a1] = bp[i];
      return a0 + (a1 - a0) * (t - t0) / (t1 - t0);
    }
  }
  return bp[bp.length - 1][1];
};
const GIANTS: { key: string; name: string; cls: string; bp: BP; curve: string }[] = [
  { key: "J", name: "Jupiter", cls: "text-maroon", bp: [[0, 5.45], [0.6, 5.32], [0.72, 5.22], [1, 5.2]],
    curve: "48,129.2 51.7,129.2 55.4,129.2 59.1,129.2 62.8,129.3 66.5,129.3 70.2,129.3 73.9,129.3 77.6,129.3 81.3,129.3 85,129.3 88.7,129.3 92.4,129.3 96.1,129.3 99.8,129.3 103.5,129.3 107.2,129.4 110.9,129.4 114.6,129.4 118.3,129.4 122,129.4 125.7,129.4 129.4,129.4 133.1,129.4 136.8,129.4 140.5,129.4 144.2,129.4 147.9,129.4 151.6,129.5 155.3,129.5 159,129.5 162.7,129.5 166.4,129.5 170.1,129.5 173.8,129.5 177.5,129.5 181.2,129.5 184.9,129.5 188.6,129.5 192.3,129.5 196,129.6 199.7,129.6 203.4,129.6 207.1,129.6 210.8,129.6 214.5,129.6 218.2,129.6 221.9,129.6 225.6,129.6 229.3,129.6 233,129.6 236.7,129.6 240.4,129.7 244.1,129.7 247.8,129.7 251.5,129.7 255.2,129.7 258.9,129.7 262.6,129.7 266.3,129.7 270,129.7 273.7,129.7 277.4,129.8 281.1,129.8 284.8,129.8 288.5,129.9 292.2,129.9 295.9,129.9 299.6,130 303.3,130 307,130 310.7,130.1 314.4,130.1 318.1,130.1 321.8,130.1 325.5,130.1 329.2,130.1 332.9,130.1 336.6,130.1 340.3,130.1 344,130.1 347.7,130.1 351.4,130.1 355.1,130.1 358.8,130.1 362.5,130.1 366.2,130.1 369.9,130.1 373.6,130.1 377.3,130.1 381,130.1 384.7,130.2 388.4,130.2 392.1,130.2 395.8,130.2 399.5,130.2 403.2,130.2 406.9,130.2 410.6,130.2 414.3,130.2 418,130.2" },
  { key: "S", name: "Saturn", cls: "text-purple", bp: [[0, 8.2], [0.6, 8.55], [0.66, 9.0], [0.72, 9.75], [0.82, 9.55], [1, 9.58]],
    curve: "48,118.7 51.7,118.7 55.4,118.7 59.1,118.7 62.8,118.6 66.5,118.6 70.2,118.6 73.9,118.6 77.6,118.6 81.3,118.5 85,118.5 88.7,118.5 92.4,118.5 96.1,118.4 99.8,118.4 103.5,118.4 107.2,118.4 110.9,118.4 114.6,118.3 118.3,118.3 122,118.3 125.7,118.3 129.4,118.2 133.1,118.2 136.8,118.2 140.5,118.2 144.2,118.2 147.9,118.1 151.6,118.1 155.3,118.1 159,118.1 162.7,118 166.4,118 170.1,118 173.8,118 177.5,118 181.2,117.9 184.9,117.9 188.6,117.9 192.3,117.9 196,117.8 199.7,117.8 203.4,117.8 207.1,117.8 210.8,117.8 214.5,117.7 218.2,117.7 221.9,117.7 225.6,117.7 229.3,117.6 233,117.6 236.7,117.6 240.4,117.6 244.1,117.6 247.8,117.5 251.5,117.5 255.2,117.5 258.9,117.5 262.6,117.4 266.3,117.4 270,117.4 273.7,117.1 277.4,116.8 281.1,116.5 284.8,116.3 288.5,116 292.2,115.7 295.9,115.2 299.6,114.7 303.3,114.3 307,113.8 310.7,113.3 314.4,112.8 318.1,112.9 321.8,113 325.5,113.1 329.2,113.1 332.9,113.2 336.6,113.3 340.3,113.4 344,113.4 347.7,113.5 351.4,113.6 355.1,113.6 358.8,113.6 362.5,113.6 366.2,113.6 369.9,113.6 373.6,113.6 377.3,113.5 381,113.5 384.7,113.5 388.4,113.5 392.1,113.5 395.8,113.5 399.5,113.5 403.2,113.5 406.9,113.5 410.6,113.5 414.3,113.5 418,113.5" },
  { key: "U", name: "Uranus", cls: "text-ink", bp: [[0, 13.5], [0.6, 14.2], [0.66, 16], [0.74, 20.5], [0.85, 19.0], [1, 19.19]],
    curve: "48,98.5 51.7,98.5 55.4,98.4 59.1,98.4 62.8,98.4 66.5,98.3 70.2,98.3 73.9,98.2 77.6,98.2 81.3,98.1 85,98.1 88.7,98 92.4,98 96.1,98 99.8,97.9 103.5,97.9 107.2,97.8 110.9,97.8 114.6,97.7 118.3,97.7 122,97.6 125.7,97.6 129.4,97.6 133.1,97.5 136.8,97.5 140.5,97.4 144.2,97.4 147.9,97.3 151.6,97.3 155.3,97.2 159,97.2 162.7,97.2 166.4,97.1 170.1,97.1 173.8,97 177.5,97 181.2,96.9 184.9,96.9 188.6,96.8 192.3,96.8 196,96.8 199.7,96.7 203.4,96.7 207.1,96.6 210.8,96.6 214.5,96.5 218.2,96.5 221.9,96.4 225.6,96.4 229.3,96.4 233,96.3 236.7,96.3 240.4,96.2 244.1,96.2 247.8,96.1 251.5,96.1 255.2,96 258.9,96 262.6,96 266.3,95.9 270,95.9 273.7,94.7 277.4,93.6 281.1,92.4 284.8,91.3 288.5,90.1 292.2,89 295.9,86.9 299.6,84.7 303.3,82.6 307,80.4 310.7,78.3 314.4,76.1 318.1,74 321.8,71.8 325.5,72.4 329.2,72.9 332.9,73.4 336.6,73.9 340.3,74.4 344,75 347.7,75.5 351.4,76 355.1,76.5 358.8,77 362.5,77.6 366.2,77.5 369.9,77.5 373.6,77.4 377.3,77.4 381,77.3 384.7,77.3 388.4,77.2 392.1,77.2 395.8,77.1 399.5,77.1 403.2,77 406.9,77 410.6,76.9 414.3,76.9 418,76.8" },
  { key: "N", name: "Neptune", cls: "text-muted", bp: [[0, 11.8], [0.6, 12.4], [0.64, 14], [0.7, 24], [0.78, 31.5], [0.9, 29.8], [1, 30.07]],
    curve: "48,105 51.7,105 55.4,104.9 59.1,104.9 62.8,104.9 66.5,104.8 70.2,104.8 73.9,104.7 77.6,104.7 81.3,104.7 85,104.6 88.7,104.6 92.4,104.6 96.1,104.5 99.8,104.5 103.5,104.4 107.2,104.4 110.9,104.4 114.6,104.3 118.3,104.3 122,104.3 125.7,104.2 129.4,104.2 133.1,104.1 136.8,104.1 140.5,104.1 144.2,104 147.9,104 151.6,103.9 155.3,103.9 159,103.9 162.7,103.8 166.4,103.8 170.1,103.8 173.8,103.7 177.5,103.7 181.2,103.6 184.9,103.6 188.6,103.6 192.3,103.5 196,103.5 199.7,103.4 203.4,103.4 207.1,103.4 210.8,103.3 214.5,103.3 218.2,103.3 221.9,103.2 225.6,103.2 229.3,103.1 233,103.1 236.7,103.1 240.4,103 244.1,103 247.8,103 251.5,102.9 255.2,102.9 258.9,102.8 262.6,102.8 266.3,102.8 270,102.7 273.7,101.2 277.4,99.7 281.1,98.2 284.8,96.6 288.5,90.3 292.2,83.9 295.9,77.6 299.6,71.2 303.3,64.9 307,58.5 310.7,54.9 314.4,51.4 318.1,47.8 321.8,44.2 325.5,40.6 329.2,37.1 332.9,33.5 336.6,29.9 340.3,30.4 344,31 347.7,31.5 351.4,32.1 355.1,32.6 358.8,33.1 362.5,33.7 366.2,34.2 369.9,34.8 373.6,35.3 377.3,35.8 381,36.4 384.7,36.3 388.4,36.2 392.1,36.1 395.8,36 399.5,35.9 403.2,35.8 406.9,35.7 410.6,35.6 414.3,35.5 418,35.4" },
];

export function NiceModel() {
  const [t, setT] = useState(0); // normalized time

  const phase = t < 0.6 ? "slow divergent migration" : t < 0.73 ? "the instability" : "settled — today";
  const tx = xOf(t);

  return (
    <figure className="nice-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 196" className="w-full h-auto" role="img"
        aria-label={`The giant planets' orbits over time: beginning compact, then at the 2:1 resonance crossing Uranus and Neptune are flung outward (Neptune past Uranus) to their present distances. Currently showing ${phase}.`}>

        {/* the 2:1 crossing marker */}
        <rect x={CROSS_X} y={PY0} width={r1(PX1 - CROSS_X)} height={PY1 - PY0} className="text-ink" fill="currentColor" opacity={0.03} />
        <line className="text-ink" x1={CROSS_X} y1={PY0 - 2} x2={CROSS_X} y2={PY1} stroke="currentColor" strokeWidth={1} strokeDasharray="3 3" opacity={0.55} />
        <text className="text-ink" x={CROSS_X + 3} y={PY0 + 6} textAnchor="start" fill="currentColor" fontSize={6.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">Jupiter–Saturn cross 2:1 → instability</text>

        {/* y-axis ticks (AU) */}
        {[[5, 130.9], [10, 111.9], [20, 73.8], [30, 35.6]].map(([au, y]) => (
          <g key={au}>
            <line className="text-line" x1={PX0} y1={y as number} x2={PX1} y2={y as number} stroke="currentColor" strokeWidth={0.4} opacity={0.25} />
            <text className="text-faint" x={PX0 - 4} y={(y as number) + 2.5} textAnchor="end" fill="currentColor" fontSize={6} fontFamily="ui-sans-serif, system-ui, sans-serif">{au}</text>
          </g>
        ))}
        <text className="text-faint" x={PX0 - 26} y={(PY0 + PY1) / 2} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif" transform={`rotate(-90 ${PX0 - 26} ${(PY0 + PY1) / 2})`}>distance from Sun (AU)</text>

        {/* axes */}
        <line className="text-line" x1={PX0} y1={PY1} x2={PX1} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <line className="text-line" x1={PX0} y1={PY0} x2={PX0} y2={PY1} stroke="currentColor" strokeWidth={1} />
        <text className="text-faint" x={(PX0 + PX1) / 2} y={PY1 + 13} textAnchor="middle" fill="currentColor" fontSize={6.6} fontFamily="ui-sans-serif, system-ui, sans-serif">time → (hundreds of millions of years)</text>

        {/* the four orbital tracks, revealed up to the current time */}
        {GIANTS.map((g) => (
          <polyline key={g.key} points={g.curve} className={g.cls} fill="none" stroke="currentColor" strokeWidth={1.5} opacity={0.85} />
        ))}

        {/* moving time cursor */}
        <line className="text-faint" x1={tx} y1={PY0} x2={tx} y2={PY1} stroke="currentColor" strokeWidth={0.8} opacity={0.5} />

        {/* current-position markers + labels */}
        {GIANTS.map((g) => {
          const y = yOf(aAt(g.bp, t));
          return (
            <g key={g.key}>
              <circle className={g.cls} cx={tx} cy={y} r={3.4} fill="currentColor" />
              <text className={g.cls} x={PX1 + 1} y={yOf(aAt(g.bp, 1)) + 2.5} textAnchor="end" fill="currentColor" fontSize={6.3} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{g.key}</text>
            </g>
          );
        })}
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {t < 0.6
          ? <>The giants sit <strong>compact</strong> — all inside 15 AU — slowly drifting apart as they scatter a disk of icy debris. Nothing dramatic yet.</>
          : t < 0.73
            ? <>Jupiter and Saturn hit the <strong className="text-ink">2:1 resonance</strong>: eccentricities spike, and <strong className="text-muted">Neptune</strong> is flung <strong>outward past Uranus</strong>, scattering the disk into the Kuiper Belt and inward at the planets.</>
            : <>The planets have <strong>settled</strong> into today&rsquo;s orbits — Neptune now the outermost at 30 AU, having been thrown there. <strong>The solar system is not where it was built.</strong></>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Time since formation</span><span className="tabular-nums">{phase}</span></span>
          <input type="range" min={0} max={1} step={0.01} value={t} onChange={(e) => setT(Number(e.target.value))} aria-label="Time since formation" className="mt-1 w-full" style={{ accentColor: "var(--c-ink)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {[["Compact start", 0], ["Slow drift", 0.45], ["2:1 crossing", 0.62], ["Today", 1]].map(([n, v]) => (
            <button key={n as string} type="button" onClick={() => setT(v as number)}
              className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">{n}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        The outer solar system we see is not the one that formed. In the <strong>Nice model</strong>, the giants began in a <strong>compact configuration</strong> — Jupiter near 5.45 AU, Saturn near 8.2, the ice giants around 11–14 — beyond a massive disk of some 35 Earth masses of leftover icy planetesimals. Scattering that debris, the giants slowly drifted apart over hundreds of millions of years: the ice giants and Saturn gaining angular momentum and moving out, Jupiter (which ejects bodies entirely) creeping in. That gentle drift changed their period ratios until <strong className="text-ink">Jupiter and Saturn crossed the 2:1 resonance</strong> — and there, as resonance always does, their mutual tugs began to accumulate, pumping their eccentricities. The now-eccentric giants destabilized the whole outer system: <strong className="text-ink">Uranus</strong> and <strong className="text-muted">Neptune</strong> were flung outward onto wild orbits (Neptune very likely thrown clean past Uranus, swapping their order), ploughing into the planetesimal disk and scattering it everywhere — outward into the <strong>Kuiper Belt</strong>, to vast distances as the <strong>Oort Cloud</strong>, right out of the system, and inward at the terrestrial planets. As the disk was consumed the eccentricities damped and the planets settled where we find them. One event accounts for six things at once — the giants&rsquo; present orbits and eccentricities, the Kuiper Belt&rsquo;s resonant plutinos, the Jupiter Trojans, the irregular satellites, the depleted asteroid belt, and (originally) the lunar bombardment. That breadth is why the model survives even as its original motivation, the Late Heavy Bombardment, is now itself in doubt.
      </figcaption>
    </figure>
  );
}
