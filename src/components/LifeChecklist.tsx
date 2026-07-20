"use client";

import { useState } from "react";

// An interactive "life detector" that never quite works, embedded in an article
// via a fenced ```lifechecklist block (see Reader's `pre` override). The school
// checklist of life (organization, metabolism, homeostasis, growth,
// reproduction, response, evolution) is a rough field guide, not a definition:
// require too few criteria and it calls fire and crystals alive; require too many
// and it calls a sterile mule or a dormant seed dead. Slide the threshold and
// watch the misclassifications — no setting gets every case right, and the virus
// stays a genuine borderline. currentColor theming; first render deterministic.

const CRITERIA = ["order", "metabolism", "homeostasis", "growth", "reproduction", "response", "evolution"];

type Truth = "alive" | "not" | "borderline";
type Entity = { name: string; truth: Truth; c: boolean[] };
// c is [order, metabolism, homeostasis, growth, reproduction, response, evolution]
const B = (s: string) => s.split("").map((x) => x === "1"); // "1010101" -> booleans
const ENTITIES: Entity[] = [
  { name: "Rabbit", truth: "alive", c: B("1111111") },
  { name: "Bacterium", truth: "alive", c: B("1111111") },
  { name: "Mule (sterile)", truth: "alive", c: B("1111010") },
  { name: "Dormant seed", truth: "alive", c: B("1000000") },
  { name: "Virus", truth: "borderline", c: B("1000101") },
  { name: "Fire", truth: "not", c: B("0101110") },
  { name: "Crystal", truth: "not", c: B("1001110") },
  { name: "Hurricane", truth: "not", c: B("1101010") },
];

const count = (e: Entity) => e.c.filter(Boolean).length;

export function LifeChecklist() {
  const [n, setN] = useState(4); // require at least n of 7 criteria to be "alive"

  const classify = (e: Entity) => count(e) >= n; // the checklist's verdict
  const misjudged = (e: Entity) =>
    e.truth !== "borderline" && classify(e) !== (e.truth === "alive");
  const misses = ENTITIES.filter(misjudged).length;

  return (
    <figure className="lc-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="font-sans">
        <p className="text-center text-[13px] text-ink">
          Call something alive if it meets at least{" "}
          <strong className="tabular-nums text-purple">{n}</strong> of the 7 checklist criteria →{" "}
          {misses === 0
            ? <strong className="text-ink">every clear case right (but the virus stays undecided).</strong>
            : <strong className="text-maroon">{misses} clear {misses === 1 ? "case" : "cases"} misclassified.</strong>}
        </p>

        <label className="mt-3 block">
          <span className="flex justify-between text-[12px] text-muted">
            <span>Criteria required to count as &ldquo;alive&rdquo;</span>
            <span className="tabular-nums">{n} of 7</span>
          </span>
          <input type="range" min={1} max={7} step={1} value={n}
            onChange={(e) => setN(Number(e.target.value))}
            aria-label="Number of checklist criteria required to count as alive" className="mt-1 w-full"
            style={{ accentColor: "var(--c-purple)" }} />
        </label>

        <div className="mt-4 space-y-1.5">
          {ENTITIES.map((e) => {
            const alive = classify(e);
            const wrong = misjudged(e);
            const border = e.truth === "borderline";
            return (
              <div key={e.name} className="flex items-center gap-2 text-[12px]">
                <span className="w-28 shrink-0 text-ink">{e.name}</span>
                <span className="flex gap-0.5" aria-hidden>
                  {e.c.map((on, i) => (
                    <span key={i}
                      className={`inline-block h-2.5 w-2.5 rounded-sm border ${on ? "border-purple bg-purple" : "border-line"}`}
                      title={CRITERIA[i]} />
                  ))}
                </span>
                <span className="w-8 shrink-0 text-right tabular-nums text-faint">{count(e)}/7</span>
                <span
                  className={`ml-1 rounded px-1.5 py-0.5 text-[11px] font-semibold ${
                    border
                      ? "bg-faint/20 text-faint"
                      : alive
                      ? "bg-purple/15 text-purple"
                      : "bg-muted/15 text-muted"
                  }`}>
                  {border ? "?" : alive ? "alive" : "not alive"}
                </span>
                {wrong && (
                  <span className="text-[11px] font-semibold text-maroon">
                    ✗ really {e.truth === "alive" ? "alive" : "not alive"}
                  </span>
                )}
                {border && <span className="text-[11px] text-faint">genuinely borderline</span>}
              </div>
            );
          })}
        </div>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        Each row shows how many of the seven textbook criteria a thing meets. Drag the threshold and no setting works: require just one or two and <span className="text-maroon">fire, crystals, and hurricanes</span> are declared alive; require five or six and the <span className="text-maroon">sterile mule and the dormant seed</span> are declared dead. The best you can do still misfires on at least one clear case — and the <span className="text-faint">virus</span> never resolves, because it does the deepest living thing (heritable, evolving replication) while lacking the machinery (metabolism) we usually demand. The checklist is a rough field guide to Earth&rsquo;s organisms, not a definition: it lists life&rsquo;s <em>symptoms</em>, and there is no threshold on a list of symptoms that cleanly separates the living from the dead. That is why the search for life needs something deeper than a checklist.
      </figcaption>
    </figure>
  );
}
