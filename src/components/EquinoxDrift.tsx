"use client";

import { useState } from "react";

// An interactive equinox-precession explorer, embedded in an article via a fenced
// ```equinoxdrift block (see Reader's `pre` override). Precession drags the celestial
// equator around, so the vernal equinox — the zero point of right ascension and the
// anchor of the astrological signs — slides westward along the ecliptic at about 50
// arcseconds a year, a full sign (~30°) every ~2,150 years. The signs were fixed to
// the constellations over two thousand years ago; since then the equinox has drifted
// almost a whole sign, so the Sun now sits in a different constellation than your
// "sign" claims. Slide the centuries and watch the equinox creep. currentColor
// theming; first render deterministic (today).

// Constellations the equinox passes through, westward from the Aries/Pisces boundary.
const SEQ = ["Pisces", "Aquarius", "Capricornus", "Sagittarius", "Scorpius", "Libra", "Virgo", "Leo", "Cancer", "Gemini", "Taurus", "Aries"];
const BASE_YEAR = -130; // when the signs were fixed: equinox at the Aries/Pisces boundary
const RATE = 50 / 3600; // degrees per year, westward
const DMAX = 90; // degrees of drift shown across the strip (3 constellations)
const X0 = 24, X1 = 416;
const lx = (deg: number) => X0 + (Math.max(0, Math.min(DMAX, deg)) / DMAX) * (X1 - X0);

export function EquinoxDrift() {
  const [year, setYear] = useState(2025);

  const drift = (year - BASE_YEAR) * RATE; // degrees the equinox has slid west since −130
  const constellation = SEQ[Math.floor(drift / 30) % 12];

  return (
    <figure className="eqdrift-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 170" className="w-full h-auto" role="img"
        aria-label={`Since the signs were fixed, the vernal equinox has drifted ${drift.toFixed(0)}° west and now lies in ${constellation}.`}>
        <text className="text-muted" x={X0} y={30} fill="currentColor" fontSize={8} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">the real constellations — the equinox drifts westward ⟶</text>

        {/* constellation bands (fixed to the real stars) */}
        {[0, 1, 2].map((i) => {
          const name = SEQ[i];
          return (
            <g key={name}>
              <rect x={lx(i * 30)} y={40} width={lx((i + 1) * 30) - lx(i * 30)} height={30} className={name === constellation ? "text-purple" : "text-ink"} fill="currentColor" opacity={name === constellation ? 0.18 : 0.05} />
              <line className="text-line" x1={lx(i * 30)} y1={40} x2={lx(i * 30)} y2={70} stroke="currentColor" strokeWidth={0.6} opacity={0.5} />
              <text className="text-faint" x={(lx(i * 30) + lx((i + 1) * 30)) / 2} y={58} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">{name}</text>
            </g>
          );
        })}

        {/* where the signs still say the equinox is (fixed, at the Aries boundary) */}
        <g className="text-faint">
          <line x1={lx(0)} y1={34} x2={lx(0)} y2={80} stroke="currentColor" strokeWidth={1} strokeDasharray="2 2" />
          <text x={lx(0) + 2} y={92} textAnchor="start" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">the sign &ldquo;Aries&rdquo; begins here</text>
        </g>

        {/* the actual equinox now */}
        <g className="text-purple">
          <line x1={lx(drift)} y1={34} x2={lx(drift)} y2={80} stroke="currentColor" strokeWidth={1.8} />
          <path d={`M${lx(drift)} ${34} l-4 -6 h8 z`} fill="currentColor" />
          <text x={lx(drift)} y={106} textAnchor="middle" fill="currentColor" fontSize={8} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">actual equinox</text>
        </g>

        <text className="text-muted" x={(X0 + X1) / 2} y={132} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={600} fontFamily="ui-sans-serif, system-ui, sans-serif">drifted {drift.toFixed(0)}° west in {(year - BASE_YEAR).toLocaleString("en-US")} years</text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        In <strong>{year} AD</strong> the vernal equinox lies in <strong className="text-purple">{constellation}</strong> — so an astrological &ldquo;Aries&rdquo; born now actually has the Sun in <strong>{constellation}</strong>.
      </p>

      <div className="mt-4">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted"><span>The year</span><span className="tabular-nums">{year} AD</span></span>
          <input type="range" min={-130} max={4000} step={10} value={year} onChange={(e) => setYear(Number(e.target.value))} aria-label="The year" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }} />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Precession does more than move the pole: because it drags the whole celestial equator around, it slides the point where the ecliptic crosses it — the <span className="text-purple">vernal equinox</span>, our zero of right ascension and the anchor of the seasons — westward along the ecliptic at about <strong>50 arcseconds a year</strong> (a full degree every 72 years, a complete circuit in 26,000). Two consequences follow. First, since the equinox is the origin of the coordinate grid, and it is moving, the right ascension and declination of <em>every</em> star slowly change — which is why star catalogues must state an <em>epoch</em> (modern ones use J2000): the addresses of the last chapter are not quite permanent after all. Second, the checkable one: the astrological signs were pinned to the constellations over two thousand years ago, but the equinox has since drifted almost a whole sign, so the Sun now sits in a different constellation than your &ldquo;sign&rdquo; claims — an Aries really has the Sun in Pisces, and only in a few centuries will the equinox slide on into Aquarius. The very framework we built to pin down the fixed stars is itself in slow, stately motion.
      </figcaption>
    </figure>
  );
}
