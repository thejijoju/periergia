


// ── Inline checkpoint quiz ────────────────────────────────────────────────
// A fenced ```checkpoint block in article markdown becomes a short set of
// self-test questions rendered in the flow of the text, so the reader
// retrieves each idea where they just learned it instead of only at the end
// of the chapter. Retrieval beats rereading; a checkpoint asks 2-5 questions
// around one concept, attacking it from different angles.
//
// Spec format (line-based; a line that doesn't start a new key continues the
// previous value). Questions are separated by a line of three or more dashes:
//
//   q: Why can't a thin shell cool itself by expanding?
//   a*: Expansion barely moves its radius, so the overlying weight is unchanged
//   a: Degenerate pressure does not depend on temperature
//   x: True of the core, but this shell is non-degenerate — the runaway here
//     is geometric, not a matter of the equation of state.
//   a: The envelope reflects the released heat back onto the shell
//   x: Envelopes are not mirrors; the released energy does escape. What fails
//     is the cooling that expansion normally provides.
//   hint: What sets the pressure at the shell — the shell itself, or what sits on top of it?
//   why: Pressure at the shell is hydrostatic — the weight of everything above,
//     which depends on radius. A thin shell can double its thickness while its
//     radius barely moves, so expansion changes nothing.
//   ---
//   q: A second question on the same idea...
//   a*: ...
//
// Keys:
//   q:     the question
//   a:     an option;  a*:  the correct option
//   x:     why the option immediately above is wrong (optional, per option)
//   hint:  shown on request before answering
//   why:   shown once the question is answered correctly
//
// Wrong picks stay marked, reveal their own `x:` explanation, and the reader
// keeps trying (learning-first, not exam-first). A single-question spec with
// no `x:` lines is still valid, so earlier articles render unchanged.

interface CheckpointQuestion {
  question: string;
  options: string[];
  wrongWhy: (string | undefined)[];
  answerIndex: number;
  hint?: string;
  why?: string;
}

function parseQuestion(raw: string): CheckpointQuestion | null {
  const lines = raw.split("\n");
  let question = "";
  const options: string[] = [];
  const wrongWhy: (string | undefined)[] = [];
  let answerIndex = -1;
  let hint = "";
  let why = "";
  // Which value the current continuation lines append to.
  let cursor: "q" | "a" | "x" | "hint" | "why" | null = null;

  const append = (base: string, extra: string) =>
    base ? `${base} ${extra.trim()}` : extra.trim();

  for (const line of lines) {
    const m = line.match(/^\s*(q|a\*?|x|hint|why)\s*:\s*(.*)$/i);
    if (m) {
      const key = m[1].toLowerCase();
      const val = m[2].trim();
      if (key === "q") {
        question = append(question, val);
        cursor = "q";
      } else if (key === "a" || key === "a*") {
        if (key === "a*") answerIndex = options.length;
        options.push(val);
        wrongWhy.push(undefined);
        cursor = "a";
      } else if (key === "x") {
        // Attaches to the option most recently declared.
        if (options.length) {
          wrongWhy[options.length - 1] = append(wrongWhy[options.length - 1] ?? "", val);
          cursor = "x";
        }
      } else if (key === "hint") {
        hint = append(hint, val);
        cursor = "hint";
      } else {
        why = append(why, val);
        cursor = "why";
      }
    } else if (line.trim() && cursor) {
      // Continuation of the previous value.
      if (cursor === "q") question = append(question, line);
      else if (cursor === "hint") hint = append(hint, line);
      else if (cursor === "why") why = append(why, line);
      else if (cursor === "x" && options.length)
        wrongWhy[options.length - 1] = append(wrongWhy[options.length - 1] ?? "", line);
      else if (options.length)
        options[options.length - 1] = append(options[options.length - 1], line);
    }
  }

  if (!question || options.length < 2 || answerIndex < 0) return null;
  return {
    question,
    options,
    wrongWhy,
    answerIndex,
    hint: hint || undefined,
    why: why || undefined,
  };
}

function parseSpec(raw: string): CheckpointQuestion[] {
  return raw
    .split(/^\s*-{3,}\s*$/m)
    .map(parseQuestion)
    .filter((q): q is CheckpointQuestion => q !== null);
}

import { readFileSync } from "fs";
const body = readFileSync(process.argv[2], "utf8");
const blocks = [...body.matchAll(/```checkpoint\n([\s\S]*?)```/g)].map(m => m[1]);
let bad = 0;
blocks.forEach((b, i) => {
  const qs = parseSpec(b);
  const raw = b.split(/^---$/m).length;
  const issues = qs.map((q: any) => JSON.stringify(q)).filter(s => !s.includes('"correct"') && false);
  console.log(`block ${i+1}: ${qs.length}/${raw} parsed`, qs.map((q: any) => Object.keys(q).join(",")).join(" | "));
  if (qs.length !== raw) bad++;
});
console.log(bad ? "PARSE PROBLEMS" : "all checkpoints parse");
