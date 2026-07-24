"use client";

import { useState } from "react";

// An interactive gravitational-focusing explorer, embedded via a fenced ```gravfocus
// block (see Reader's `pre` override). Once bodies reach a kilometre, gravity takes over
// and growth becomes secure — because a gravitating body does not merely hit what it runs
// into; it PULLS in passing bodies that would otherwise have missed. Its effective
// capture cross-section exceeds its geometric one by the focusing factor F = 1 +
// (v_esc/v_rel)^2. The picture holds the reach FIXED and shrinks the body inside it, so
// you see directly how tiny a large planetesimal is compared with the volume it gathers
// from — and because F grows with mass, the biggest body accretes fastest and RUNS AWAY
// from the pack. Drag the radius and switch the swarm's temperature. The escape velocity
// is a single evaluation the engines agree on; first render frozen at a cold 1,000 km
// body. currentColor theming.

const CX = 140, CY = 116, REACH = 82; // centre and the drawn "reach" radius
const RHO = 3000; // kg/m^3
const K_VESC = 1.2953e-3; // v_esc = K·R(metres), for density 3000 (v_esc = R·sqrt(8πGρ/3))
const r1 = (n: number) => Math.round(n * 10) / 10;
const vescOf = (rKm: number) => K_VESC * rKm * 1000; // m/s
const focusOf = (rKm: number, vrel: number) => 1 + (vescOf(rKm) / vrel) ** 2;

const VRELS: [string, number][] = [["cold swarm (10 m/s)", 10], ["stirred (50 m/s)", 50], ["hot (100 m/s)", 100]];
const INIT_R = 1000, INIT_V = 10;

// three incoming pebbles that get bent inward (fixed schematic trajectories)
const PEBBLES = [-58, -22, 34];

export function GravFocus() {
  const [rKm, setRKm] = useState(INIT_R); // body radius, km
  const [vrel, setVrel] = useState(INIT_V); // relative velocity, m/s

  const vesc = vescOf(rKm);
  const F = focusOf(rKm, vrel);
  const bodyR = Math.max(1.6, Math.min(REACH, r1(REACH / Math.sqrt(F))));
  const strong = F >= 10;

  return (
    <figure className="gravfocus-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 232" className="w-full h-auto" role="img"
        aria-label={`A ${rKm} km body in a ${vrel} m/s swarm has escape velocity ${Math.round(vesc)} m/s and a focusing factor of ${Math.round(F)}, so its effective capture area is ${Math.round(F)} times its geometric one.`}>

        {/* the gravitational reach (effective capture cross-section) */}
        <circle className={strong ? "text-purple" : "text-faint"} cx={CX} cy={CY} r={REACH} fill="currentColor" opacity={strong ? 0.08 : 0.05} />
        <circle className={strong ? "text-purple" : "text-faint"} cx={CX} cy={CY} r={REACH} fill="none" stroke="currentColor" strokeWidth={1.1} strokeDasharray="4 3" opacity={0.85} />

        {/* incoming pebbles, bent into the body by its gravity */}
        {PEBBLES.map((dy, i) => {
          const captured = Math.abs(dy) < REACH;
          const path = `M ${CX + 120},${r1(CY + dy)} Q ${CX + 54},${r1(CY + dy * 0.28)} ${CX + bodyR + 1},${CY}`;
          return (
            <g key={i}>
              {captured
                ? <path d={path} className="text-ink" fill="none" stroke="currentColor" strokeWidth={0.9} strokeDasharray="2 2" opacity={0.6} />
                : <line x1={CX + 120} y1={r1(CY + dy)} x2={CX - 60} y2={r1(CY + dy)} className="text-faint" stroke="currentColor" strokeWidth={0.8} strokeDasharray="2 2" opacity={0.5} />}
              <circle cx={CX + 120} cy={r1(CY + dy)} r={1.8} className="text-muted" fill="currentColor" />
            </g>
          );
        })}

        {/* the body's actual physical size */}
        <circle className="text-maroon" cx={CX} cy={CY} r={bodyR} fill="currentColor" />

        {/* labels */}
        <line className="text-faint" x1={CX} y1={CY - REACH} x2={CX} y2={CY - REACH - 12} stroke="currentColor" strokeWidth={0.6} opacity={0.6} />
        <text className={strong ? "text-purple" : "text-faint"} x={CX} y={CY - REACH - 16} textAnchor="middle" fill="currentColor" fontSize={7.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">gravitational reach</text>
        <text className="text-maroon" x={CX} y={CY + REACH + 18} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">actual body ({rKm} km)</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={44} fill="currentColor" fontSize={8} fontWeight={600}>focusing factor</text>
          <text className={strong ? "text-purple" : "text-ink"} x={300} y={68} fill="currentColor" fontSize={22} fontWeight={800}>{F >= 100 ? Math.round(F).toLocaleString("en-US") : F.toFixed(1)}×</text>
          <text className="text-muted" x={300} y={92} fill="currentColor" fontSize={7.5}>it gathers from that many</text>
          <text className="text-muted" x={300} y={102} fill="currentColor" fontSize={7.5}>times its own cross-section</text>
          <text className="text-faint" x={300} y={122} fill="currentColor" fontSize={7.5}>escape speed {Math.round(vesc).toLocaleString("en-US")} m/s</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A <strong className="text-maroon">{rKm} km</strong> body in a {vrel === 10 ? "dynamically cold" : vrel === 50 ? "stirred" : "hot"} swarm reaches out to capture from <strong className={strong ? "text-purple" : "text-ink"}>{F >= 100 ? Math.round(F).toLocaleString("en-US") : F.toFixed(1)}× its own area.</strong> {strong
          ? <>Because that reach <strong>grows with mass</strong>, the biggest body accretes fastest and <strong className="text-purple">runs away</strong> from the pack.</>
          : <>Small bodies barely focus at all — they collide only with what they physically strike.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Body radius</span><span className="tabular-nums">{rKm} km · {F >= 100 ? Math.round(F).toLocaleString("en-US") : F.toFixed(1)}×</span></span>
          <input type="range" min={1} max={2000} step={1} value={rKm} onChange={(e) => setRKm(Number(e.target.value))} aria-label="Body radius in km" className="mt-1 w-full" style={{ accentColor: strong ? "var(--c-purple)" : "var(--c-maroon)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          {VRELS.map(([lbl, v]) => (
            <button key={v} type="button" onClick={() => setVrel(v)}
              className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${vrel === v ? "border-ink text-ink font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>{lbl}</button>
          ))}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Above a kilometre or so, gravity takes over and growth becomes secure. A body without appreciable gravity collides only with what it physically runs into — its cross-section is just its geometric area. But a gravitating body <strong>bends the paths</strong> of objects passing nearby, pulling in ones that would have missed, so its <em>effective</em> capture area exceeds its geometric one by the focusing factor <strong className="text-ink">F = 1 + (v<sub>esc</sub>/v<sub>rel</sub>)²</strong>. The effect is negligible when the body&rsquo;s escape speed is far below the swarm&rsquo;s relative velocity, and enormous when the reverse holds — so it is strongest for <strong>large bodies</strong> in a <strong>dynamically cold</strong> swarm: a 1,000 km body among slow-moving neighbours reaches out to <strong className="text-purple">seventeen thousand times</strong> its own cross-section. Now the decisive point: because F <em>grows with mass</em>, the biggest body in a region accretes fastest, which makes it bigger still, which widens its advantage further — a positive feedback in mass called <strong className="text-purple">runaway growth</strong>, which builds Moon-to-Mars-sized embryos in only ten to a hundred thousand years. It self-limits when the growing embryo clears its feeding zone and stirs up its neighbours (raising v<sub>rel</sub>, which throttles the focusing), handing over to a slower, orderly <strong>oligarchic</strong> phase — and finally to the giant impacts that finished the terrestrial planets.
      </figcaption>
    </figure>
  );
}
