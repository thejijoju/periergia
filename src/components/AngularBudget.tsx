"use client";

import { useState } from "react";

// An interactive angular-momentum-budget explorer, embedded via a fenced ```angularbudget
// block (see Reader's `pre` override). The honest difficulty at the heart of the nebular
// hypothesis: the Sun holds 99.87% of the solar system's MASS but only 0.61% of its
// ANGULAR MOMENTUM, while Jupiter — a tenth of a percent of the mass — carries 61% of the
// angular momentum. The two budgets are almost exactly inverted. Two stacked bars make it
// vivid; click a body to highlight its slice in both and read its share. A naive collapse
// would have left the Sun spinning near breakup; instead it turns once in 25 days, so the
// infalling material must have shed nearly all its angular momentum — the unsolved
// transport problem. All geometry is pure percentage arithmetic (identical in SSR and
// client); currentColor theming; first render deterministic (nothing selected).

const BX0 = 58, W = 356, BH = 30; // bar left, width, height
const MY = 66, AY = 138; // mass-bar and angular-momentum-bar y

type Body = "sun" | "jupiter" | "other";
const LABEL: Record<Body, string> = { sun: "the Sun", jupiter: "Jupiter", other: "the other planets" };
const COLOR: Record<Body, string> = { sun: "text-maroon", jupiter: "text-purple", other: "text-muted" };
// [body, % of mass, % of angular momentum]
const ROWS: [Body, number, number][] = [
  ["sun", 99.87, 0.61],
  ["jupiter", 0.10, 61],
  ["other", 0.03, 38.39],
];

// cumulative left-offset (in %) before row i, for a given budget column (1 = mass, 2 = L)
function offsetPct(i: number, col: 1 | 2): number {
  let acc = 0;
  for (let k = 0; k < i; k++) acc += ROWS[k][col];
  return acc;
}

export function AngularBudget() {
  const [sel, setSel] = useState<Body | null>(null);

  const bar = (y: number, col: 1 | 2, label: string) => (
    <>
      <text className="text-muted" x={BX0} y={y - 6} fill="currentColor" fontSize={8.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">{label}</text>
      {ROWS.map(([body, , ], i) => {
        const val = ROWS[i][col];
        const x = BX0 + (offsetPct(i, col) / 100) * W;
        const w = (val / 100) * W;
        const active = sel === null || sel === body;
        return (
          <rect key={body} x={Math.round(x * 10) / 10} y={y} width={Math.round(w * 10) / 10} height={BH}
            className={COLOR[body]} fill="currentColor" opacity={active ? 0.9 : 0.28}
            stroke={sel === body ? "currentColor" : "none"} strokeWidth={sel === body ? 1.5 : 0} />
        );
      })}
      <rect x={BX0} y={y} width={W} height={BH} fill="none" className="text-line" stroke="currentColor" strokeWidth={0.8} opacity={0.5} />
    </>
  );

  return (
    <figure className="angbudget-chart my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <svg viewBox="0 0 440 210" className="w-full h-auto" role="img"
        aria-label="The Sun holds 99.87% of the solar system's mass but only 0.61% of its angular momentum; Jupiter holds 0.1% of the mass but 61% of the angular momentum. The two budgets are nearly inverted.">
        {bar(MY, 1, "share of MASS")}
        {bar(AY, 2, "share of ANGULAR MOMENTUM")}

        {/* the striking annotations */}
        <text className="text-maroon" x={BX0 + 4} y={MY + 20} textAnchor="start" fill="currentColor" fontSize={9} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun 99.87%</text>
        <text className="text-purple" x={BX0 + (0.61 / 100) * W + (61 / 100) * W / 2} y={AY + 20} textAnchor="middle" fill="currentColor" fontSize={9} fontWeight={800} fontFamily="ui-sans-serif, system-ui, sans-serif">Jupiter 61%</text>
        <text className="text-maroon" x={BX0} y={AY + BH + 13} textAnchor="start" fill="currentColor" fontSize={6.4} fontFamily="ui-sans-serif, system-ui, sans-serif">Sun 0.61% ↑</text>

        {/* readout */}
        <text className="text-ink" x={BX0 + W} y={22} textAnchor="end" fill="currentColor" fontSize={9.5} fontWeight={700} fontFamily="ui-sans-serif, system-ui, sans-serif">
          {sel === null ? "the budgets are almost exactly inverted" : `${LABEL[sel]}: ${ROWS.find((r) => r[0] === sel)![1]}% of mass · ${ROWS.find((r) => r[0] === sel)![2]}% of angular momentum`}
        </text>
      </svg>

      <p className="mt-1 text-center font-sans text-[13px] text-ink">
        The Sun holds <strong className="text-maroon">99.87% of the mass</strong> but only <strong className="text-maroon">0.61% of the angular momentum</strong>; <strong className="text-purple">Jupiter</strong>, a tenth of a percent of the mass, carries <strong className="text-purple">61%</strong> of it. A naive collapse would leave the Sun spinning near break-up — yet it turns once in <strong>25 days.</strong>
      </p>

      <div className="mt-4 flex flex-wrap gap-2">
        {(Object.keys(LABEL) as Body[]).map((b) => (
          <button key={b} type="button" onClick={() => setSel(sel === b ? null : b)}
            className={`font-sans text-[12px] rounded-md border px-2.5 py-1 transition-colors ${sel === b ? "border-ink text-ink font-semibold" : "border-line text-muted hover:text-ink hover:border-ink"}`}>
            {b === "sun" ? "the Sun" : b === "jupiter" ? "Jupiter" : "the other planets"}
          </button>
        ))}
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A genuine, century-old problem sitting at the centre of an otherwise triumphant theory. The nebular hypothesis says the Sun is the collapsed heart of a spinning cloud — and collapse spins things up fiercely, as 1/<em>r</em>². So the Sun ought to hold the lion&rsquo;s share of the system&rsquo;s <strong>angular momentum</strong>, just as it holds nearly all its mass. It does not. The Sun carries <strong className="text-maroon">99.87% of the mass but a mere 0.61% of the angular momentum</strong>; the planets, a rounding error in mass, hold <strong>99.39%</strong> of it — and <strong className="text-purple">Jupiter alone carries 61%</strong>, a hundred times the Sun&rsquo;s share. The two budgets are nearly a mirror image. Had the material that became the Sun kept its angular momentum, our star would spin near the speed at which it would fly apart; instead it turns leisurely once every 25 days. So almost all of that angular momentum was <em>transported outward</em> on the way in — by magnetic braking (the young Sun&rsquo;s field tethered to the disk), by turbulence within the disk, and by the bipolar jets of its violent youth. These are believed to be the right ingredients, and models using them can make slow-rotating stars — but the problem is <strong>not settled in detail.</strong> It is a clean lesson: a theory can be overwhelmingly correct — we now <em>photograph</em> the disks it predicts — and still carry a first-order puzzle at its heart, exactly like the coronal-heating problem of the Sun.
      </figcaption>
    </figure>
  );
}
