"use client";

import { useState } from "react";

// An interactive spectrum laboratory, embedded via a fenced ```spectrumlab block (see
// Reader's `pre` override). Kirchhoff's three laws, live: a hot DENSE source gives a
// CONTINUOUS rainbow; a hot THIN gas gives bright EMISSION lines at its element's
// characteristic wavelengths; a cool gas in front of a hotter source gives dark
// ABSORPTION lines at exactly the same wavelengths. Pick an element and flip between
// the three arrangements — the fingerprint (the pattern of wavelengths) never changes,
// only whether it prints bright-on-dark or dark-on-bright. Unlike our other charts,
// the spectrum itself uses real fixed colors (a rainbow is a physical object, the same
// in light and dark theme); the chrome still uses currentColor. First render
// deterministic (absorption, hydrogen — the Sun's most famous lines).

const L0 = 390, L1 = 700; // wavelength range, nm
const X0 = 24, X1 = 416, BY = 64, BH = 74; // spectrum band geometry
const xOf = (nm: number) => X0 + ((nm - L0) / (L1 - L0)) * (X1 - X0);
const r2 = (n: number) => Math.round(n * 100) / 100;

// approximate visible-light color for a wavelength (fixed, theme-independent)
function waveColor(nm: number): string {
  if (nm < 440) return "#7c3aed";
  if (nm < 490) return "#3b82f6";
  if (nm < 510) return "#06b6d4";
  if (nm < 565) return "#22c55e";
  if (nm < 590) return "#eab308";
  if (nm < 625) return "#f97316";
  return "#dc2626";
}

// spectral fingerprints (principal visible lines, nm)
const ELEMENTS: Record<string, number[]> = {
  Hydrogen: [656.3, 486.1, 434.0, 410.2],
  Sodium: [589.0, 589.6],
  Helium: [587.6, 667.8, 501.6, 447.1],
  Calcium: [393.4, 396.8, 422.7],
};

type Mode = "continuous" | "emission" | "absorption";

export function SpectrumLab() {
  const [mode, setMode] = useState<Mode>("absorption");
  const [elem, setElem] = useState("Hydrogen");

  const lines = ELEMENTS[elem];

  return (
    <figure className="spectrum-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 200" className="w-full h-auto" role="img"
        aria-label={mode === "continuous" ? "A continuous rainbow spectrum with no lines." : mode === "emission" ? `Bright emission lines of ${elem} on a dark background.` : `A continuous spectrum crossed by the dark absorption lines of ${elem}.`}>
        <defs>
          <linearGradient id="specRainbow" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#6d28d9" />
            <stop offset="16%" stopColor="#3b82f6" />
            <stop offset="34%" stopColor="#06b6d4" />
            <stop offset="48%" stopColor="#22c55e" />
            <stop offset="62%" stopColor="#eab308" />
            <stop offset="76%" stopColor="#f97316" />
            <stop offset="100%" stopColor="#dc2626" />
          </linearGradient>
        </defs>

        {/* source description */}
        <text className="text-muted" x={(X0 + X1) / 2} y={30} textAnchor="middle" fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {mode === "continuous" ? "a hot, dense glowing object — Kirchhoff's 1st law" : mode === "emission" ? `a hot, thin cloud of ${elem.toLowerCase()} gas — Kirchhoff's 2nd law` : `a hot dense source seen through cooler ${elem.toLowerCase()} gas — Kirchhoff's 3rd law`}
        </text>

        {/* the spectrum band */}
        {mode === "emission" ? (
          <>
            <rect x={X0} y={BY} width={X1 - X0} height={BH} fill="#0b0b10" rx={3} />
            {lines.map((nm) => (
              <rect key={nm} x={r2(xOf(nm) - 1.4)} y={BY} width={2.8} height={BH} fill={waveColor(nm)} />
            ))}
          </>
        ) : (
          <>
            <rect x={X0} y={BY} width={X1 - X0} height={BH} fill="url(#specRainbow)" rx={3} />
            {mode === "absorption" && lines.map((nm) => (
              <rect key={nm} x={r2(xOf(nm) - 1.3)} y={BY} width={2.6} height={BH} fill="#0b0b10" />
            ))}
          </>
        )}
        <rect x={X0} y={BY} width={X1 - X0} height={BH} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.8} rx={3} opacity={0.6} />

        {/* wavelength axis */}
        {[400, 450, 500, 550, 600, 650, 700].map((nm) => (
          <g key={nm}>
            <line className="text-line" x1={r2(xOf(nm))} y1={BY + BH} x2={r2(xOf(nm))} y2={BY + BH + 4} stroke="currentColor" strokeWidth={0.7} />
            <text className="text-faint" x={r2(xOf(nm))} y={BY + BH + 14} textAnchor="middle" fill="currentColor" fontSize={6.5} fontFamily="ui-sans-serif, system-ui, sans-serif">{nm}</text>
          </g>
        ))}
        <text className="text-faint" x={(X0 + X1) / 2} y={BY + BH + 26} textAnchor="middle" fill="currentColor" fontSize={7} fontFamily="ui-sans-serif, system-ui, sans-serif">wavelength (nanometres)</text>

        {/* line labels for the element (skip in continuous mode) */}
        {mode !== "continuous" && lines.map((nm, i) => (
          <text key={nm} className="text-muted" x={r2(xOf(nm))} y={BY - 6 - (i % 2) * 9} textAnchor="middle" fill="currentColor" fontSize={6.2} fontFamily="ui-sans-serif, system-ui, sans-serif">{nm}</text>
        ))}

        {/* verdict */}
        <text className={mode === "continuous" ? "text-muted" : "text-purple"} x={(X0 + X1) / 2} y={BY + BH + 48} textAnchor="middle" fill="currentColor" fontSize={9.5} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {mode === "continuous" ? "an unbroken rainbow — no lines, no fingerprint" : mode === "emission" ? `bright lines: the fingerprint of ${elem}` : `dark lines at the SAME wavelengths: still the fingerprint of ${elem}`}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        {mode === "continuous"
          ? <>A hot, dense source gives <strong>every</strong> colour — a pure rainbow, carrying no chemical information.</>
          : mode === "emission"
            ? <>A hot, thin gas glows <strong>only</strong> at its own characteristic wavelengths — <strong className="text-purple">{elem}&rsquo;s barcode</strong>, bright on dark.</>
            : <>The cool gas <strong>subtracts</strong> exactly the colours it would emit — <strong className="text-purple">{elem}&rsquo;s barcode</strong>, printed dark on the rainbow. These are the Sun&rsquo;s Fraunhofer lines.</>}
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {(["continuous", "emission", "absorption"] as Mode[]).map((m) => (
          <button key={m} type="button" onClick={() => setMode(m)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${mode === m ? "border-ink text-ink font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {m === "continuous" ? "1 · hot dense (continuous)" : m === "emission" ? "2 · hot thin gas (emission)" : "3 · cool gas in front (absorption)"}
          </button>
        ))}
      </div>
      <div className="mt-2 flex flex-wrap gap-2">
        {Object.keys(ELEMENTS).map((e) => (
          <button key={e} type="button" onClick={() => setElem(e)} disabled={mode === "continuous"}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${elem === e && mode !== "continuous" ? "border-purple text-purple font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"} ${mode === "continuous" ? "opacity-40" : ""}`}>
            {e}
          </button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Kirchhoff&rsquo;s three laws — the grammar of starlight. A hot, <strong>dense</strong> object (a star&rsquo;s interior) gives a <em>continuous</em> rainbow. A hot, <strong>thin</strong> gas gives bright <em>emission lines</em> — only its own characteristic colours, a pattern unique to each element, as distinctive as a fingerprint. And a <strong>cool</strong> gas in front of a hotter source gives dark <em>absorption lines</em> at <em>exactly the same wavelengths</em> — an element absorbs precisely the colours it would emit. Flip between the second and third arrangements and watch: the pattern never moves, only bright-on-dark becomes dark-on-bright. This is how Kirchhoff read the Sun in 1859: its dense interior makes the rainbow, its cooler atmosphere stamps in the dark Fraunhofer lines, and matching those dark lines to the bright laboratory lines of known elements revealed — without ever touching the Sun — exactly what it is made of. The same barcode is readable in the light of a star ten thousand light-years away, because sodium is sodium everywhere in the universe. Comte&rsquo;s &ldquo;forever unknowable&rdquo; composition of the stars was being broadcast to us all along.
      </figcaption>
    </figure>
  );
}
