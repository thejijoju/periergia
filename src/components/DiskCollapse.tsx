"use client";

import { useState } from "react";

// An interactive collapse-to-disk explorer, embedded via a fenced ```diskcollapse block
// (see Reader's `pre` override). The physical heart of the lecture: why a collapsing
// cloud makes a flat DISK rather than a sphere. Drag the collapse slider and watch a
// schematic cross-section flatten — because rotation resists gravity only in the
// equatorial plane. Along the axis (top and bottom) nothing opposes gravity, so material
// falls freely and the cloud squashes; in the plane, rotation supports the material and
// collapse stalls. Sphere to ellipsoid to pancake, inevitably. Meanwhile conservation of
// angular momentum spins the cloud up as 1/r^2 — an imperceptible turn once per million
// years becomes a furious whirl. The ellipse geometry is pure arithmetic (identical in
// SSR and client); the single readout value is a lone evaluation the engines agree on.
// currentColor theming; first render deterministic (mid-collapse).

const CX = 150, CY = 118, R = 96; // centre and full cloud radius (drawing units)
const R_CLOUD_AU = 63240; // 1 light-year, the starting radius
const r1 = (n: number) => Math.round(n * 10) / 10;

// map collapse fraction s in [0,1] to the equatorial radius in AU (log sweep, 1 ly -> ~1 AU)
const radiusAU = (s: number) => R_CLOUD_AU * Math.pow(10, -4.8 * s);
// rotation period from conservation of angular momentum: P ∝ r^2, anchored at 1 Myr / 1 ly
const periodYr = (rAU: number) => 1e6 * (rAU / R_CLOUD_AU) ** 2;

function fmtRadius(au: number): string {
  if (au >= 1000) return `${Math.round(au / 100) * 100} AU`;
  return `${Math.round(au)} AU`;
}
function fmtPeriod(yr: number): string {
  if (yr >= 1) return `${yr >= 1000 ? Math.round(yr / 100) * 100 : Math.round(yr)} yr`;
  const hr = yr * 8766;
  return hr >= 1 ? `${Math.round(hr)} hr` : `${Math.round(hr * 60)} min`;
}

export function DiskCollapse() {
  const [s, setS] = useState(0.5); // collapse fraction

  // shape: the equatorial (horizontal) radius shrinks modestly then holds (rotation
  // support); the polar (vertical) radius collapses freely toward a thin disk.
  const rx = R * (1 - 0.32 * s);
  const ry = R * (1 - 0.92 * s);
  const star = 3 + 9 * s; // the protostar grows as mass funnels to the centre
  const rAU = radiusAU(s);
  const P = periodYr(rAU);
  const disky = s > 0.6;

  return (
    <figure className="diskcollapse-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 236" className="w-full h-auto" role="img"
        aria-label={`A rotating cloud ${s < 0.2 ? "still nearly spherical" : s < 0.6 ? "flattening into an ellipsoid" : "collapsed into a thin rotating disk"}; having contracted to about ${fmtRadius(rAU)}, it now turns once every ${fmtPeriod(P)}.`}>

        {/* rotation axis */}
        <line className="text-faint" x1={CX} y1={CY - R - 8} x2={CX} y2={CY + R + 8} stroke="currentColor" strokeWidth={0.7} strokeDasharray="3 3" opacity={0.5} />
        <text className="text-faint" x={CX + 5} y={CY - R - 2} textAnchor="start" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">rotation axis</text>

        {/* the collapsing cloud cross-section */}
        <ellipse cx={CX} cy={CY} rx={r1(rx)} ry={r1(ry)} className="text-purple" fill="currentColor" opacity={0.13} />
        <ellipse cx={CX} cy={CY} rx={r1(rx)} ry={r1(ry)} className="text-purple" fill="none" stroke="currentColor" strokeWidth={1.3} opacity={0.8} />

        {/* the protostar growing at the centre */}
        <circle className="text-maroon" cx={CX} cy={CY} r={r1(star)} fill="currentColor" />

        {/* polar free-fall arrows (top & bottom): nothing resists gravity along the axis,
            so material falls INWARD toward the centre */}
        {[-1, 1].map((dir) => {
          const poleY = CY + dir * ry;
          return (
            <g key={dir}>
              <line className="text-ink" x1={CX} y1={r1(poleY + dir * 20)} x2={CX} y2={r1(poleY + dir * 8)} stroke="currentColor" strokeWidth={1.4} />
              <polygon className="text-ink" points={`${CX - 3},${r1(poleY + dir * 11)} ${CX + 3},${r1(poleY + dir * 11)} ${CX},${r1(poleY + dir * 4)}`} fill="currentColor" />
            </g>
          );
        })}
        <text className="text-ink" x={CX + 46} y={r1(CY - ry - 12)} textAnchor="middle" fill="currentColor" fontSize={6.6} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">free fall</text>

        {/* equatorial support: rotation holds the material out */}
        {[-1, 1].map((dir) => (
          <g key={dir}>
            <circle className="text-ink" cx={r1(CX + dir * rx)} cy={CY} r={2.4} fill="currentColor" />
          </g>
        ))}
        <text className="text-ink" x={CX} y={CY + R + 20} textAnchor="middle" fill="currentColor" fontSize={6.6} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">equator: rotation resists collapse</text>

        {/* readout */}
        <g fontFamily="ui-sans-serif, system-ui, sans-serif">
          <text className="text-muted" x={300} y={40} fill="currentColor" fontSize={8} fontWeight={600}>equatorial radius</text>
          <text className="text-purple" x={300} y={58} fill="currentColor" fontSize={16} fontWeight={800}>{fmtRadius(rAU)}</text>
          <text className="text-muted" x={300} y={82} fill="currentColor" fontSize={8} fontWeight={600}>one rotation takes</text>
          <text className="text-maroon" x={300} y={100} fill="currentColor" fontSize={16} fontWeight={800}>{fmtPeriod(P)}</text>
        </g>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {disky
          ? <>Collapsed to a thin <strong className="text-purple">disk</strong>: flattened along the axis, held wide by rotation — and spun up to a turn every <strong className="text-maroon">{fmtPeriod(P)}</strong>. This is why the solar system is <strong>flat</strong>.</>
          : s < 0.2
            ? <>A nearly <strong>spherical</strong> cloud, turning imperceptibly. Drag onward and watch what rotation does as it contracts.</>
            : <>Flattening: the poles fall freely while the equator resists — an <strong className="text-purple">ellipsoid</strong> on its way to a disk.</>}
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>Collapse progress</span><span className="tabular-nums">{fmtRadius(rAU)} · {fmtPeriod(P)}/turn</span></span>
          <input type="range" min={0} max={1} step={0.02} value={s} onChange={(e) => setS(Number(e.target.value))} aria-label="Collapse progress" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Why does a collapsing cloud make a flat <strong>disk</strong> rather than a sphere? Gravity pulls equally in every direction, so the naive answer is a shrinking ball — but the solar system is emphatically flat, all eight planets orbiting within a few degrees of one plane. The resolution is <strong>rotation</strong>, and the conservation of <strong>angular momentum</strong>. Every cloud spins a little, and as it contracts its spin rate rises as 1/<em>r</em>² — the figure-skater&rsquo;s pirouette, the very law behind Kepler&rsquo;s equal areas. A turn once per million years becomes, after enough collapse, a turn every few hours. And rotation resists gravity <em>only in the equatorial plane.</em> Along the rotation axis nothing opposes gravity, so material there <strong className="text-ink">falls freely</strong> and the cloud squashes; in the plane, rotation supports the material and inward collapse <strong>halts</strong> at the radius where spin balances gravity. Sphere becomes ellipsoid becomes pancake — inevitably, for any cloud with any rotation at all. This single fact explains all four regularities Kant noticed in 1755: the planets share a direction and a plane because they inherited one disk&rsquo;s rotation; the Sun spins that way because it formed at the disk&rsquo;s centre; the orbits are near-circular because disk material in rotational balance already moves on near-circular paths. <strong className="text-ink">The flatness of the solar system is not a curiosity — it is a fossil of the spinning cloud that made it.</strong>
      </figcaption>
    </figure>
  );
}
