"use client";

import { useState } from "react";

// An interactive "power forces a choice" explorer, embedded in an article via a
// fenced ```powerthrust block (see Reader's `pre` override). Once a rocket's
// power source is separate from its propellant, the master equation F = 2P/v_e
// binds: at a fixed jet power, thrust and exhaust velocity are inversely
// proportional — you cannot have both. On log-log axes that law is a straight
// line of slope −1; picking a power source slides the whole line up or down,
// and the six-order-of-magnitude gap between a solar array and chemistry is why
// ion drives sip propellant but can't launch, and why anything wanting thrust
// AND exhaust velocity has to go nuclear. Themed by `currentColor` (light/dark);
// first render deterministic (solar-electric at 30 km/s).

const XLOG0 = 3; // v_e = 1 km/s (10^3 m/s)
const XLOG1 = 5; // v_e = 100 km/s (10^5 m/s)
const YLOG0 = -1; // thrust = 0.1 N
const YLOG1 = 8; // thrust = 100 MN

const X0 = 50;
const X1 = 424;
const Y0 = 14;
const Y1 = 196;

const px = (ve: number) => X0 + ((Math.log10(ve) - XLOG0) / (XLOG1 - XLOG0)) * (X1 - X0);
const py = (F: number) =>
  Y1 - ((Math.min(YLOG1, Math.max(YLOG0, Math.log10(F))) - YLOG0) / (YLOG1 - YLOG0)) * (Y1 - Y0);

// Jet power (W) of each source. Chemistry's is the Saturn V first stage's ~43 GW.
const SOURCES = [
  { label: "Solar array · 10 kW", P: 1e4, note: "electric propulsion" },
  { label: "Nuclear-electric · 1 MW", P: 1e6, note: "reactor + ion thrusters" },
  { label: "Chemistry · 43 GW", P: 4.3e10, note: "Saturn V first stage" },
] as const;

// F = 2P/v_e across the v_e window, as a log-log path.
function tradePath(P: number): string {
  const N = 60;
  let d = "";
  for (let i = 0; i <= N; i++) {
    const ve = Math.pow(10, XLOG0 + (i / N) * (XLOG1 - XLOG0));
    d += `${i === 0 ? "M" : "L"}${px(ve).toFixed(1)} ${py((2 * P) / ve).toFixed(1)}`;
  }
  return d;
}

function fmtThrust(F: number): string {
  if (F >= 1e6) return `${(F / 1e6).toFixed(F >= 1e7 ? 0 : 1)} MN`;
  if (F >= 1e3) return `${(F / 1e3).toFixed(0)} kN`;
  if (F >= 1) return `${F.toFixed(1)} N`;
  return `${(F * 1000).toFixed(0)} mN`;
}

function fmtVe(ve: number): string {
  return `${(ve / 1000).toFixed(ve < 1e4 ? 1 : 0)} km/s`;
}

// Time for a 1-tonne probe (a = F/1000) to gain 1 km/s of Δv.
function fmtTime(F: number): string {
  const a = F / 1000; // m/s² on a 1000 kg probe
  const sec = 1000 / a; // to gain 1 km/s
  if (sec < 90) return `${sec.toFixed(0)} s`;
  if (sec < 5400) return `${(sec / 60).toFixed(0)} min`;
  if (sec < 1.5 * 86400) return `${(sec / 3600).toFixed(0)} hours`;
  if (sec < 400 * 86400) return `${(sec / 86400).toFixed(0)} days`;
  return `${(sec / (365.25 * 86400)).toFixed(1)} years`;
}

export function PowerThrustTrade() {
  const [srcIdx, setSrcIdx] = useState(0); // solar array
  const [logVe, setLogVe] = useState(Math.log10(3e4)); // 30 km/s

  const P = SOURCES[srcIdx].P;
  const ve = Math.pow(10, logVe);
  const F = (2 * P) / ve;

  const DEC_X = [3, 4, 5]; // 1, 10, 100 km/s
  const DEC_Y = [-1, 1, 3, 5, 7]; // 0.1 N … 10 MN

  return (
    <figure className="sd-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`At ${SOURCES[srcIdx].label} and ${fmtVe(ve)}, the master equation gives ${fmtThrust(F)} of thrust.`}>
        {/* Decade gridlines */}
        <g className="text-line" stroke="currentColor" strokeWidth={0.6} opacity={0.5}>
          {DEC_X.map((lx) => (
            <line key={`vx${lx}`} x1={px(Math.pow(10, lx))} y1={Y0} x2={px(Math.pow(10, lx))} y2={Y1} />
          ))}
          {DEC_Y.map((ly) => (
            <line key={`hy${ly}`} x1={X0} y1={py(Math.pow(10, ly))} x2={X1} y2={py(Math.pow(10, ly))} />
          ))}
        </g>
        {/* Axes */}
        <g className="text-muted" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* All three source lines, faint; the active one bold */}
        {SOURCES.map((s, i) => (
          <path key={s.label} className={i === srcIdx ? "text-maroon" : "text-faint"}
            d={tradePath(s.P)} fill="none" stroke="currentColor"
            strokeWidth={i === srcIdx ? 2.6 : 1} opacity={i === srcIdx ? 1 : 0.5}
            strokeLinejoin="round" />
        ))}

        {/* Dot + guides on the active line */}
        <g className="text-faint" stroke="currentColor" strokeWidth={1} strokeDasharray="2 3" opacity={0.7}>
          <line x1={px(ve)} y1={py(F)} x2={px(ve)} y2={Y1} />
          <line x1={X0} y1={py(F)} x2={px(ve)} y2={py(F)} />
        </g>
        <circle className="text-maroon" cx={px(ve)} cy={py(F)} r={4} fill="currentColor" />

        {/* Axis labels + decade ticks */}
        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={(X0 + X1) / 2} y={236} textAnchor="middle">exhaust velocity vₑ (log) ⟶</text>
          <text x={13} y={(Y0 + Y1) / 2} textAnchor="middle"
            transform={`rotate(-90 13 ${(Y0 + Y1) / 2})`}>thrust (log) ⟶</text>
        </g>
        <g className="text-faint" fill="currentColor" fontSize={8.5}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={px(1e3)} y={Y1 + 12} textAnchor="middle">1</text>
          <text x={px(1e4)} y={Y1 + 12} textAnchor="middle">10</text>
          <text x={px(1e5)} y={Y1 + 12} textAnchor="middle">100 km/s</text>
          <text x={X0 - 4} y={py(0.1) + 3} textAnchor="end">0.1 N</text>
          <text x={X0 - 4} y={py(1e3) + 3} textAnchor="end">1 kN</text>
          <text x={X0 - 4} y={py(1e6) + 3} textAnchor="end">1 MN</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        <strong>{SOURCES[srcIdx].note}</strong> at vₑ = <strong className="tabular-nums">{fmtVe(ve)}</strong> →{" "}
        <span className="font-semibold text-maroon">{fmtThrust(F)}</span> of thrust. A one-tonne probe gains
        1 km/s in <strong>{fmtTime(F)}</strong>.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Exhaust velocity</span>
            <span className="tabular-nums">{fmtVe(ve)}</span>
          </span>
          <input type="range" min={XLOG0} max={XLOG1} step={0.01} value={logVe}
            onChange={(e) => setLogVe(Number(e.target.value))}
            aria-label="Exhaust velocity (log scale)"
            className="mt-1 w-full" style={{ accentColor: "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {SOURCES.map((s, i) => (
            <button key={s.label} type="button" onClick={() => setSrcIdx(i)}
              aria-pressed={i === srcIdx}
              className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${
                i === srcIdx ? "border-ink bg-ink text-card" : "border-line text-muted hover:text-ink hover:border-ink"
              }`}>
              {s.label}
            </button>
          ))}
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        F = 2P/vₑ, drawn on log-log axes where it becomes a straight line of slope −1: at a fixed jet power, every gain in exhaust velocity is paid for one-for-one in thrust. The three lines are the same law at three power levels. Chemistry sits absurdly high because combustion is a ~43 GW furnace — it hands you huge thrust <em>and</em> moderate vₑ for free, which is why the trade never bit for five chapters. Leave chemistry and your power collapses a million-fold to a solar array&rsquo;s kilowatts; push vₑ up to ion-drive speeds and the thrust drops to a fraction of a newton — superb propellant economy, but a one-tonne probe needs <em>months</em> to change its speed by 1 km/s. Wanting both thrust and vₑ means wanting enormous compact power, and the only compact enormous power is nuclear.
      </figcaption>
    </figure>
  );
}
