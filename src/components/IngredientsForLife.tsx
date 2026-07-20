"use client";

import { useState } from "react";

// An interactive habitable-vs-inhabited explorer, embedded in an article via a
// fenced ```ingredientsforlife block (see Reader's `pre` override). From the
// spray of Enceladus's hidden ocean, Cassini assembled essentially the full
// checklist of ingredients for life. Toggle them to build the verdict — but no
// matter how many boxes are checked, the verdict caps at HABITABLE, never
// INHABITED, because the gap between the two is the unsolved origin-of-life
// question. This is the honest discipline the whole search turns on. currentColor
// theming; first render deterministic (everything Cassini found, checked).

type Ingredient = { key: string; label: string; found: string; essential: boolean };
const INGREDIENTS: Ingredient[] = [
  { key: "water", label: "Liquid water", found: "the subsurface ocean itself", essential: true },
  { key: "energy", label: "Energy", found: "tidal heating + chemical energy", essential: true },
  { key: "h2", label: "Molecular hydrogen (H₂)", found: "hydrothermal vents — and food for methanogens", essential: true },
  { key: "organics", label: "Organic molecules", found: "carbon building blocks, some complex", essential: true },
  { key: "salts", label: "Salts (NaCl)", found: "a salty, rock-contacting ocean", essential: false },
  { key: "silica", label: "Silica nanoparticles", found: "a hot seafloor, ~90 °C+", essential: false },
  { key: "phosphate", label: "Phosphates", found: "phosphorus — in DNA, ATP, membranes", essential: false },
];

export function IngredientsForLife() {
  const [on, setOn] = useState<Record<string, boolean>>(
    Object.fromEntries(INGREDIENTS.map((i) => [i.key, true])),
  );
  const toggle = (k: string) => setOn((s) => ({ ...s, [k]: !s[k] }));
  const habitable = INGREDIENTS.filter((i) => i.essential).every((i) => on[i.key]);
  const nOn = INGREDIENTS.filter((i) => on[i.key]).length;

  return (
    <figure className="ifl-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="font-sans">
        <p className="text-center text-[12px] text-muted">
          What Cassini tasted in Enceladus&rsquo;s plume — toggle each ingredient:
        </p>
        <div className="mt-3 space-y-1.5">
          {INGREDIENTS.map((i) => {
            const active = on[i.key];
            return (
              <button key={i.key} type="button" onClick={() => toggle(i.key)} aria-pressed={active}
                className={`flex w-full items-center gap-2 rounded-md border px-2.5 py-1.5 text-left transition-colors ${active ? "border-purple/60 bg-purple/10" : "border-line opacity-60 hover:opacity-100"}`}>
                <span className={`grid h-4 w-4 shrink-0 place-items-center rounded-sm border text-[10px] ${active ? "border-purple bg-purple text-card" : "border-line text-transparent"}`}>✓</span>
                <span className="text-[12.5px] font-semibold text-ink">{i.label}</span>
                <span className="ml-auto text-right text-[11px] text-faint">{i.found}</span>
              </button>
            );
          })}
        </div>

        {/* the two verdicts */}
        <div className="mt-4 grid grid-cols-2 gap-3">
          <div className={`rounded-lg border p-3 text-center ${habitable ? "border-purple/60 bg-purple/10" : "border-line"}`}>
            <div className="text-[11px] uppercase tracking-wide text-muted">Habitable?</div>
            <div className={`mt-1 text-[15px] font-bold ${habitable ? "text-purple" : "text-muted"}`}>
              {habitable ? "YES ✓" : "not confirmed"}
            </div>
            <div className="mt-1 text-[10.5px] text-faint">
              {habitable ? `all ${nOn} present — a place life could live` : "an essential ingredient is missing"}
            </div>
          </div>
          <div className="rounded-lg border border-maroon/50 bg-maroon/5 p-3 text-center">
            <div className="text-[11px] uppercase tracking-wide text-muted">Inhabited?</div>
            <div className="mt-1 text-[15px] font-bold text-maroon">UNKNOWN</div>
            <div className="mt-1 text-[10.5px] text-faint">Cassini measured chemistry, not life</div>
          </div>
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Piece by piece, from the spray of a tiny moon, Cassini found essentially the full checklist: liquid water, energy, the organic building blocks, the essential nutrient phosphorus, and molecular hydrogen — the very fuel that Earth&rsquo;s most ancient life eats. That makes Enceladus&rsquo;s ocean, as far as we can tell, <span className="text-purple">habitable</span>: a place where life <em>could</em> live. But notice the verdict on the right never moves. <span className="text-maroon">Habitable is not inhabited.</span> A place with all the ingredients is not a place with life — an uninhabited island is habitable without being inhabited — and the gap between the two is exactly the unsolved question of the origin of life. If origins are easy, this ocean, given hundreds of millions of years, probably came alive; if they are hard, it may hold every ingredient and remain forever sterile. Cassini found the ingredients, not the life. Which is why the next mission — flying the plume with instruments built to detect <em>organisms</em> — could turn this one unmoved word, &ldquo;unknown,&rdquo; into the answer to whether we are alone.
      </figcaption>
    </figure>
  );
}
