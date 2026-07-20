"use client";

import { useState } from "react";

// An interactive Apollo-architecture mass comparison, embedded in an article via
// a fenced ```architecturemass block (see Reader's `pre` override). The whole
// case for lunar-orbit rendezvous rests on one fact: mass that must be landed AND
// launched back off a world compounds through the rocket equation. A return
// vehicle that STAYS in lunar orbit (LOR) is merely delivered there; the same
// vehicle in a direct-ascent plan must be decelerated onto the surface and
// re-accelerated off it, so its translunar mass is multiplied by the descent AND
// ascent mass ratios. Slide the return-vehicle mass and watch LOR stay under a
// single Saturn V while direct ascent shoots past it toward the never-built Nova.
// currentColor theming; first render deterministic (the ~30 t Apollo CSM).

const VE = 3050; // m/s, LM-class engine exhaust velocity
const R_DESC = Math.exp(2000 / VE); // ~1.93 — descent mass ratio
const R_ASC = Math.exp(1900 / VE); // ~1.86 — ascent mass ratio
const LM_TRANSLUNAR = 15; // t — the minimal lander LOR still sends
const SATURN_V = 47; // t to a translunar trajectory (one Saturn V)
const NOVA = 95; // t — the never-built ~2x rocket direct ascent needed

const M_MAX = 150; // t (y-axis top)
const X0 = 52, X1 = 424, Y0 = 18, Y1 = 196;
const py = (t: number) => Y1 - Math.min(1, t / M_MAX) * (Y1 - Y0);

// Bar geometry: two bars centred in the plot.
const BAR_W = 78;
const LOR_X = 150, DIR_X = 300;

export function ArchitectureMass() {
  const [m, setM] = useState(30); // return-vehicle (CSM-class) mass, tonnes

  // LOR: the return vehicle only rides to lunar orbit; a minimal lander lands.
  const lor = m + LM_TRANSLUNAR;
  // Direct ascent: the whole return vehicle must land AND relaunch.
  const direct = m * R_DESC * R_ASC;
  const lorFits = lor <= SATURN_V;

  return (
    <figure className="am-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 250" className="w-full h-auto" role="img"
        aria-label={`With a ${m}-tonne return vehicle, lunar-orbit rendezvous needs about ${Math.round(lor)} tonnes on a translunar trajectory; direct ascent needs about ${Math.round(direct)} tonnes.`}>
        <g className="text-line" stroke="currentColor" strokeWidth={1}>
          <line x1={X0} y1={Y1} x2={X1} y2={Y1} />
          <line x1={X0} y1={Y0} x2={X0} y2={Y1} />
        </g>

        {/* rocket-capability threshold lines */}
        <line className="text-ink" x1={X0} y1={py(SATURN_V)} x2={X1} y2={py(SATURN_V)} stroke="currentColor"
          strokeWidth={1.2} strokeDasharray="5 3" opacity={0.75} />
        <text className="text-ink" x={X1 - 2} y={py(SATURN_V) - 4} textAnchor="end" fill="currentColor"
          fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          one Saturn V · 47 t
        </text>
        <line className="text-maroon" x1={X0} y1={py(NOVA)} x2={X1} y2={py(NOVA)} stroke="currentColor"
          strokeWidth={1.2} strokeDasharray="5 3" opacity={0.7} />
        <text className="text-maroon" x={X1 - 2} y={py(NOVA) - 4} textAnchor="end" fill="currentColor"
          fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          never-built Nova · ~95 t
        </text>

        {/* LOR bar */}
        <rect className="text-purple" x={LOR_X - BAR_W / 2} y={py(lor)} width={BAR_W} height={Y1 - py(lor)}
          fill="currentColor" opacity={0.85} rx={2} />
        <text className="text-purple" x={LOR_X} y={py(lor) - 5} textAnchor="middle" fill="currentColor"
          fontSize={11} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {Math.round(lor)} t
        </text>
        <text className="text-muted" x={LOR_X} y={Y1 + 14} textAnchor="middle" fill="currentColor" fontSize={9.5}
          fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">lunar-orbit rendezvous</text>

        {/* Direct-ascent bar (clipped at top of plot, with an arrow if over) */}
        <rect className="text-maroon" x={DIR_X - BAR_W / 2} y={py(direct)} width={BAR_W} height={Y1 - py(direct)}
          fill="currentColor" opacity={0.85} rx={2} />
        <text className="text-maroon" x={DIR_X} y={py(direct) - 5} textAnchor="middle" fill="currentColor"
          fontSize={11} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {Math.round(direct)} t
        </text>
        <text className="text-muted" x={DIR_X} y={Y1 + 14} textAnchor="middle" fill="currentColor" fontSize={9.5}
          fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">direct ascent</text>

        <g className="text-muted" fill="currentColor" fontSize={10} fontWeight={600}
          fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text x={16} y={(Y0 + Y1) / 2} textAnchor="middle" transform={`rotate(-90 16 ${(Y0 + Y1) / 2})`}>
            mass sent toward the Moon (t)
          </text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        A <strong className="tabular-nums">{m} t</strong> return vehicle →{" "}
        <span className="text-purple font-semibold">{Math.round(lor)} t</span> by LOR{" "}
        {lorFits ? <span className="text-purple">(fits one Saturn V)</span> : <span className="text-maroon">(over one Saturn V)</span>}{" "}
        vs <span className="text-maroon font-semibold">{Math.round(direct)} t</span> direct{" "}
        <strong className="text-maroon">— {(direct / lor).toFixed(1)}× more, needing the Nova that was never built.</strong>
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Return-vehicle mass (the ride home)</span><span className="tabular-nums">{m} t</span>
          </span>
          <input type="range" min={10} max={40} step={1} value={m}
            onChange={(e) => setM(Number(e.target.value))}
            aria-label="Return-vehicle mass in tonnes" className="mt-1 w-full"
            style={{ accentColor: "var(--c-purple)" }} />
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button type="button" onClick={() => setM(30)}
            className="font-sans text-[12px] rounded-md border border-line px-2.5 py-1 text-muted transition-colors hover:text-ink hover:border-ink">
            Apollo CSM (~30 t)
          </button>
        </div>
      </div>

      <figcaption className="mt-3 font-sans text-[12px] text-faint leading-snug">
        The heavy mother ship — the crew&rsquo;s ride home, with the return propellant and the Earth-entry heat shield — never <em>needs</em> to touch the Moon. In <span className="text-purple">lunar-orbit rendezvous</span> it simply waits in orbit while a stripped-down lander goes down and back, so its mass is only <em>delivered</em> to the Moon. In <span className="text-maroon">direct ascent</span> that same vehicle must be decelerated onto the surface and then re-accelerated off it, so its mass is multiplied by the descent ratio (&times;{R_DESC.toFixed(2)}) <em>and</em> the ascent ratio (&times;{R_ASC.toFixed(2)}) — a compounding that, for the real ~30&nbsp;t Apollo command ship, is the difference between fitting on one Saturn V and needing a rocket twice its size. This is the whole of John Houbolt&rsquo;s argument, and the reason landed-and-returned mass is the most expensive mass in any mission: don&rsquo;t carry the return vehicle through velocity changes it does not need to experience.
      </figcaption>
    </figure>
  );
}
