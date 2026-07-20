"use client";

import { useState } from "react";

// An interactive "build-the-case" explorer, embedded in an article via a fenced
// ```biosignaturecase block (see Reader's `pre` override). Detecting life is not
// finding one magic molecule but climbing a ladder of confidence, rung by rung,
// ruling out the lifeless forgeries at each step. Modelled on the real biosignature
// confidence scales astronomers now use. The rungs are cumulative — you cannot
// skip one — and, crucially, even the top rung reads "confident," never a single
// triumphant "life confirmed," because an extraordinary claim is a case built over
// years, not a dial that flips. A single gas alone stalls at "candidate" (level 3),
// exactly where honest teams have had to announce real detections. currentColor
// theming; first render deterministic (all rungs met — the full case).

type Rung = { label: string; caught: string };
const RUNGS: Rung[] = [
  { label: "A signal is detected", caught: "a dip, a line, a hint in the data" },
  { label: "The signal is real, not an instrument artifact", caught: "phosphine at Venus faded when the data were re-reduced" },
  { label: "It is a known biosignature gas (O₂, CH₄, …)", caught: "a candidate — but every gas has a lifeless forger" },
  { label: "Abiotic sources are ruled out", caught: "O₂ from photolysis; CH₄ from serpentinising rock" },
  { label: "The planet's context supports it", caught: "rocky, temperate, water vapour, a quiet star" },
  { label: "A second, independent signature agrees", caught: "O₂ and CH₄ together, in disequilibrium — hard to fake at once" },
  { label: "Independently confirmed by others", caught: "another team, another instrument, the same answer" },
];

const VERDICT = [
  { title: "nothing yet", tone: "faint" },
  { title: "a blip", tone: "faint" },
  { title: "real, but unexplained", tone: "muted" },
  { title: "biosignature candidate", tone: "maroon" },
  { title: "abiotic-disfavoured candidate", tone: "maroon" },
  { title: "in a habitable setting", tone: "purple" },
  { title: "a corroborated case", tone: "purple" },
  { title: "confident detection", tone: "purple" },
];

export function BiosignatureCase() {
  // Which rungs the observer claims to have met (order matters).
  const [met, setMet] = useState<boolean[]>(RUNGS.map(() => true));
  const toggle = (i: number) => setMet((s) => s.map((v, j) => (j === i ? !v : v)));

  // Confidence = the highest CONTIGUOUS run of met rungs from the bottom.
  // You cannot claim rung 5 while rung 3 is unmet — the case has a gap.
  let level = 0;
  for (let i = 0; i < RUNGS.length; i++) {
    if (met[i]) level = i + 1;
    else break;
  }
  const v = VERDICT[level];
  const toneText = v.tone === "purple" ? "text-purple" : v.tone === "maroon" ? "text-maroon" : v.tone === "muted" ? "text-muted" : "text-faint";
  const toneBorder = v.tone === "purple" ? "border-purple/60 bg-purple/10" : v.tone === "maroon" ? "border-maroon/50 bg-maroon/5" : "border-line";

  return (
    <figure className="bsc-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="font-sans">
        <p className="text-center text-[12px] text-muted">
          Build the case — each rung rests on the one below it:
        </p>
        <div className="mt-3 space-y-1.5">
          {RUNGS.map((r, i) => {
            const on = met[i];
            const counted = i < level; // part of the contiguous case
            return (
              <button key={i} type="button" onClick={() => toggle(i)} aria-pressed={on}
                className={`flex w-full items-start gap-2.5 rounded-md border px-2.5 py-1.5 text-left transition-colors ${counted ? "border-purple/50 bg-purple/10" : on ? "border-line bg-line/20 opacity-70" : "border-line opacity-55 hover:opacity-90"}`}>
                <span className={`mt-0.5 grid h-4 w-4 shrink-0 place-items-center rounded-full border text-[9px] font-bold ${counted ? "border-purple bg-purple text-card" : on ? "border-muted text-muted" : "border-line text-transparent"}`}>{i + 1}</span>
                <span className="min-w-0">
                  <span className={`block text-[12.5px] font-semibold ${counted ? "text-ink" : "text-muted"}`}>{r.label}</span>
                  <span className="block text-[10.5px] text-faint">{r.caught}</span>
                </span>
              </button>
            );
          })}
        </div>

        {/* the verdict */}
        <div className={`mt-4 rounded-lg border p-3 text-center ${toneBorder}`}>
          <div className="text-[11px] uppercase tracking-wide text-muted">Confidence — level {level} of 7</div>
          <div className={`mt-1 text-[16px] font-bold ${toneText}`}>{v.title}</div>
          <div className="mt-1 text-[10.5px] text-faint">
            {level >= 7
              ? "the strongest a remote detection reaches — a case, built and corroborated, not a single eureka"
              : level >= 3
              ? "a real result worth announcing — but not, on its own, the discovery of life"
              : "keep going — the lifeless explanations have not yet been ruled out"}
          </div>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Every biosignature has a lifeless forger: oxygen can be split from water or carbon dioxide by starlight, methane belched by serpentinising rock — so a <em>single</em> gas is almost never conclusive. Detecting life is therefore not the flip of a switch but the slow building of a <span className="text-purple">case</span> — ruling out the forgeries one by one, insisting on <span className="text-maroon">combinations</span> hard to fake together (oxygen and methane <em>in disequilibrium</em>), reading the gas in the <span className="text-ink">context</span> of a genuinely habitable world, and demanding independent confirmation. Notice you cannot skip a rung: claim the top while a lower one is unmet and the case has a hole. And notice the ceiling. Even a fully corroborated detection reads &ldquo;confident,&rdquo; never a triumphant &ldquo;life, certainly&rdquo; — because <span className="text-ink">extraordinary claims require extraordinary evidence</span>, and the field has been burned before (Viking&rsquo;s reactive soil, the meteorite &ldquo;fossils,&rdquo; Venusian phosphine, an exoplanet&rsquo;s DMS) into treating a real, honest result as a <em>candidate</em> — often no higher than level three — rather than an announcement of company in the universe.
      </figcaption>
    </figure>
  );
}
