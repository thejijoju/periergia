"use client";

// A static number line with hops, embedded via a fenced ```numberline block
// whose body is a single expression: "6+3", "9-4", or "4-9". Addition hops
// right, subtraction hops left, one arc per unit step — counting made visible.
// The special case a-b with b > a draws the hops until they hit 0 and then
// dashes the steps still owed off the left edge: the picture of "no answer
// among the counting numbers", and the doorway to negative numbers.
// Geometry is computed from baked constants; currentColor theming throughout.

const W = 440;
const AXIS_Y = 78;
const LABEL_Y = 96;
const PAD = 26;

export function NumberLine({ spec }: { spec: string }) {
  const m = spec.trim().match(/^(\d+)\s*([+-])\s*(\d+)$/);
  if (!m) return null;
  const a = Number(m[1]);
  const op = m[2];
  const b = Number(m[3]);
  const add = op === "+";
  const short = !add && b > a; // runs out of numbers
  const result = add ? a + b : a - b;

  // Axis range: always start at 0; keep a little headroom on the right.
  const max = Math.max(add ? a + b : a, 10) + 1;
  if (max > 24) return null; // this widget is for small, visible counts
  const x = (n: number) => PAD + ((W - 2 * PAD) * n) / max;

  const hops: { from: number; to: number; owed: boolean }[] = [];
  if (add) {
    for (let i = 0; i < b; i++) hops.push({ from: a + i, to: a + i + 1, owed: false });
  } else {
    const real = Math.min(b, a);
    for (let i = 0; i < real; i++) hops.push({ from: a - i, to: a - i - 1, owed: false });
  }
  const owedSteps = short ? b - a : 0;

  const arc = (from: number, to: number, owed: boolean, key: number) => {
    const x1 = x(from);
    const x2 = x(to);
    const mid = (x1 + x2) / 2;
    return (
      <path
        key={key}
        d={`M ${x1} ${AXIS_Y - 4} Q ${mid} ${AXIS_Y - 34} ${x2} ${AXIS_Y - 4}`}
        fill="none"
        stroke="currentColor"
        strokeWidth={1.5}
        strokeDasharray={owed ? "4 4" : undefined}
        className={owed ? "text-faint" : "text-maroon"}
        markerEnd={`url(#nl-arrow-${owed ? "owed" : "hop"})`}
      />
    );
  };

  return (
    <figure className="my-6 not-prose rounded-xl border border-line bg-card p-3 sm:p-4">
      <svg
        viewBox={`0 0 ${W} 112`}
        className="w-full h-auto"
        role="img"
        aria-label={
          short
            ? `${a} minus ${b} on a number line: the hops reach 0 after ${a} steps with ${owedSteps} still owed — no counting number is the answer.`
            : `${a} ${add ? "plus" : "minus"} ${b} on a number line: ${b} hops of one, landing on ${result}.`
        }
      >
        <defs>
          <marker id="nl-arrow-hop" viewBox="0 0 8 8" refX="6" refY="4" markerWidth="5" markerHeight="5" orient="auto">
            <path d="M 1 1 L 7 4 L 1 7 z" fill="currentColor" className="text-maroon" />
          </marker>
          <marker id="nl-arrow-owed" viewBox="0 0 8 8" refX="6" refY="4" markerWidth="5" markerHeight="5" orient="auto">
            <path d="M 1 1 L 7 4 L 1 7 z" fill="currentColor" className="text-faint" />
          </marker>
        </defs>

        {/* axis with an off-the-end arrow to say the line keeps going */}
        <line x1={PAD - 10} y1={AXIS_Y} x2={W - PAD + 12} y2={AXIS_Y} stroke="currentColor" strokeWidth={1.2} className="text-line" />
        <path d={`M ${W - PAD + 6} ${AXIS_Y - 4} L ${W - PAD + 13} ${AXIS_Y} L ${W - PAD + 6} ${AXIS_Y + 4}`} fill="none" stroke="currentColor" strokeWidth={1.2} className="text-line" />

        {Array.from({ length: max + 1 }, (_, n) => (
          <g key={n}>
            <line x1={x(n)} y1={AXIS_Y - 4} x2={x(n)} y2={AXIS_Y + 4} stroke="currentColor" strokeWidth={1} className="text-line" />
            <text x={x(n)} y={LABEL_Y} textAnchor="middle" fontSize={9.5} fill="currentColor" className={n === result && !short ? "text-maroon" : "text-muted"} fontFamily="ui-monospace, SFMono-Regular, Menlo, monospace" fontWeight={n === result && !short ? 700 : 400}>
              {n}
            </text>
          </g>
        ))}

        {hops.map((h, i) => arc(h.from, h.to, h.owed, i))}

        {/* start marker */}
        <circle cx={x(a)} cy={AXIS_Y} r={3.4} fill="currentColor" className="text-ink" />
        {/* landing marker, or the owed steps dashed off the left edge */}
        {short ? (
          <>
            <path
              d={`M ${x(0)} ${AXIS_Y - 4} Q ${x(0) - 16} ${AXIS_Y - 30} ${PAD - 22} ${AXIS_Y - 8}`}
              fill="none"
              stroke="currentColor"
              strokeWidth={1.5}
              strokeDasharray="4 4"
              className="text-faint"
              markerEnd="url(#nl-arrow-owed)"
            />
            <text x={PAD - 2} y={26} fontSize={9.5} fill="currentColor" className="text-faint" fontFamily="ui-sans-serif, system-ui, sans-serif">
              {owedSteps} step{owedSteps === 1 ? "" : "s"} still owed — and no numbers left
            </text>
          </>
        ) : (
          <circle cx={x(result)} cy={AXIS_Y} r={4.2} fill="currentColor" className="text-maroon" />
        )}
      </svg>
      <figcaption className="mt-2 font-sans text-[13px] leading-relaxed text-muted">
        {short ? (
          <>
            ${a} - ${b}$: counting back from {a}, the hops hit $0$ after {a} steps with {owedSteps} still to go. Among these
            numbers, there is no answer.
          </>
        ) : (
          <>
            ${a} {op} {b} = {result}$: start at {a}, {add ? "hop right" : "hop back"} {b} time{b === 1 ? "" : "s"}, land on{" "}
            {result}.
          </>
        )}
      </figcaption>
    </figure>
  );
}
