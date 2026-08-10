// ── Exportable study assets ───────────────────────────────────────────────
// One-click downloads for a topic: an Anki-importable flashcard deck, Markdown
// study notes, and (via the browser's print dialogue) a PDF. All three are
// generated client-side from the body already on screen, so they cost no server
// round trip and always match the depth/level the reader is actually looking at.
//
// The cards are mined from the parts of an article that are already written as
// retrieval practice — the inline checkpoints and the problems/worked-answers
// pair — rather than being invented by splitting prose. That keeps every card
// something a human wrote as a question with an answer.

export interface ExportMeta {
  title: string;
  nodeId: string;
  url: string;
  depth?: string;
  level?: string;
}

export interface Card {
  front: string;
  back: string;
  tag: "checkpoint" | "problem" | "summary";
}

const FENCE = /^```([a-z0-9-]*)\n([\s\S]*?)^```/gim;
const IMAGE_MARKER = /^[ \t]*\{\{\s*image:\s*([^|{}\n]+?)\s*\|\s*([^{}\n]+?)\s*\}\}[ \t]*$/gm;
const BOOK_MARKER = /^[ \t]*\{\{\s*book:\s*([^|{}\n]+?)\s*\|\s*([^|{}\n]+?)\s*\|\s*([^{}\n]+?)\s*\}\}[ \t]*$/gm;

// ── Checkpoint parsing ────────────────────────────────────────────────────
// Mirrors CheckpointQuiz's line-based spec format: q / a / a* / x / hint / why,
// with questions separated by a line of three or more dashes, and a line that
// doesn't open a new key continuing the previous value.

interface ParsedQuestion {
  question: string;
  correct: string;
  why: string;
}

function parseCheckpoint(spec: string): ParsedQuestion[] {
  return spec
    .split(/^\s*-{3,}\s*$/m)
    .map((raw) => {
      let question = "";
      let correct = "";
      let why = "";
      let cursor: "q" | "a" | "x" | "hint" | "why" | null = null;
      let lastWasCorrect = false;
      const add = (base: string, extra: string) => (base ? `${base} ${extra.trim()}` : extra.trim());

      for (const line of raw.split("\n")) {
        const m = line.match(/^\s*(q|a\*?|x|hint|why)\s*:\s*(.*)$/i);
        if (m) {
          const key = m[1].toLowerCase();
          const val = m[2].trim();
          if (key === "q") {
            question = add(question, val);
            cursor = "q";
          } else if (key === "a*") {
            correct = add(correct, val);
            cursor = "a";
            lastWasCorrect = true;
          } else if (key === "a") {
            cursor = "a";
            lastWasCorrect = false;
          } else if (key === "why") {
            why = add(why, val);
            cursor = "why";
          } else {
            cursor = key === "x" ? "x" : "hint";
          }
          continue;
        }
        const cont = line.trim();
        if (!cont || !cursor) continue;
        if (cursor === "q") question = add(question, cont);
        else if (cursor === "a" && lastWasCorrect) correct = add(correct, cont);
        else if (cursor === "why") why = add(why, cont);
      }
      return { question, correct, why };
    })
    .filter((q) => q.question && q.correct);
}

// ── Problems ↔ worked answers ─────────────────────────────────────────────
// Both sections number their entries "**1.** …". Pair them by number so a card
// carries the problem on the front and its full worked solution on the back.

function section(body: string, heading: RegExp): string {
  const lines = body.split("\n");
  const start = lines.findIndex((l) => heading.test(l));
  if (start < 0) return "";
  const rest = lines.slice(start + 1);
  const end = rest.findIndex((l) => /^##\s/.test(l));
  return (end < 0 ? rest : rest.slice(0, end)).join("\n");
}

function numbered(block: string): Map<string, string> {
  const out = new Map<string, string>();
  if (!block.trim()) return out;
  const parts = block.split(/^(?=\*\*\d+\.\*\*)/m);
  for (const part of parts) {
    const m = part.match(/^\*\*(\d+)\.\*\*\s*([\s\S]*)$/);
    if (m) out.set(m[1], m[2].trim());
  }
  return out;
}

/**
 * Bullets from "Pulling the thread" — each becomes a summary card keyed on its
 * subject term. These bullets use bold for emphasis as well as for subjects, so
 * a naive "first bold phrase" gives useless prompts: a quantity
 * ("**400 nebulae**"), a bare adjective ("**apparent**"), or a whole clause.
 * Accept only what reads as a compact noun phrase — two to five words, or a
 * single word that is capitalised and so plausibly a proper noun ("**Galaxy
 * Zoo**", "**ATLAS³ᴰ**") — and skip the bullet when nothing qualifies. Fewer,
 * better cards: a prompt that names nothing is worse than no card.
 */
function conceptTerm(text: string): string | null {
  for (const m of text.matchAll(/\*\*([^*]+)\*\*/g)) {
    const term = stripInline(m[1]).trim().replace(/[.,;:]+$/, "");
    if (term.length < 4 || /^[\d(]/.test(term)) continue;
    const letters = (term.match(/[A-Za-z]/g) ?? []).length;
    if (letters < 4) continue;
    const words = term.split(/\s+/);
    const compact = words.length >= 2 && words.length <= 5;
    const properNoun = words.length === 1 && /^[A-Z]/.test(term);
    if (!compact && !properNoun) continue;
    return term;
  }
  return null;
}

function summaryCards(body: string): Card[] {
  const block = section(body, /^##\s+Pulling the thread\s*$/i);
  const cards: Card[] = [];
  for (const line of block.split("\n")) {
    const m = line.match(/^\s*[-*]\s+(.*)$/);
    if (!m) continue;
    const text = m[1].trim();
    if (text.length < 60) continue;
    const term = conceptTerm(text);
    if (!term) continue;
    cards.push({
      front: `Summarise what this chapter established about: ${term}`,
      back: stripInline(text),
      tag: "summary",
    });
  }
  return cards;
}

/** Remove markdown emphasis/code markers, keeping the words. */
function stripInline(s: string): string {
  return s
    .replace(/\*\*([^*]+)\*\*/g, "$1")
    .replace(/(^|\W)\*([^*]+)\*/g, "$1$2")
    .replace(/`([^`]+)`/g, "$1")
    .replace(/\[([^\]]*)\]\([^)]*\)/g, "$1")
    .replace(/\s+/g, " ")
    .trim();
}

export function cardsFromBody(body: string): Card[] {
  const cards: Card[] = [];

  // 1. Inline checkpoints — questions written as retrieval practice.
  for (const m of body.matchAll(FENCE)) {
    if (m[1].toLowerCase() !== "checkpoint") continue;
    for (const q of parseCheckpoint(m[2])) {
      const back = q.why ? `${stripInline(q.correct)}\n\n${stripInline(q.why)}` : stripInline(q.correct);
      cards.push({ front: stripInline(q.question), back, tag: "checkpoint" });
    }
  }

  // 2. Problems paired with their worked answers.
  const problems = numbered(section(body, /^##\s+Problems\s*$/i));
  const answers = numbered(section(body, /^##\s+Worked answers\s*$/i));
  for (const [n, problem] of problems) {
    const answer = answers.get(n);
    if (!answer) continue;
    cards.push({
      front: stripInline(problem),
      back: stripInline(answer),
      tag: "problem",
    });
  }

  // 3. Chapter summary bullets.
  cards.push(...summaryCards(body));

  return cards;
}

// ── Anki ──────────────────────────────────────────────────────────────────
// Anki imports plain text natively; the `#key:value` header lines (2.1.55+)
// declare the separator, deck, note type and column order, which is what makes
// this a genuine one-click import rather than a file the reader must configure.
// Fields are flattened to one line each — newlines become <br>, so `#html:true`
// is set and the content is HTML-escaped first.

function ankiField(s: string): string {
  return s
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\t/g, " ")
    .replace(/\r?\n/g, "<br>")
    .trim();
}

export function toAnkiTsv(body: string, meta: ExportMeta): string {
  const cards = cardsFromBody(body);
  const deck = `Periergia::${meta.title.replace(/::/g, "-")}`;
  const head = [
    "#separator:tab",
    "#html:true",
    "#notetype:Basic",
    `#deck:${deck}`,
    "#columns:Front\tBack\tTags",
  ];
  const rows = cards.map(
    (c) => `${ankiField(c.front)}\t${ankiField(c.back)}\t${c.tag} periergia`,
  );
  return `${head.join("\n")}\n${rows.join("\n")}\n`;
}

// ── Markdown study notes ──────────────────────────────────────────────────
// The article as a portable document: widget specs removed (they are
// interactive and meaningless as text), checkpoints rendered as readable Q&A
// with the answer marked, image markers turned into figure captions, and a
// provenance header so the file is still traceable months later.

function checkpointToMarkdown(spec: string): string {
  const qs = parseCheckpoint(spec);
  if (!qs.length) return "";
  const parts = qs.map((q, i) => {
    const lines = [`**Checkpoint ${i + 1}.** ${q.question}`, "", `> **Answer.** ${q.correct}`];
    if (q.why) lines.push(">", `> ${q.why}`);
    return lines.join("\n");
  });
  return parts.join("\n\n");
}

export function toStudyMarkdown(body: string, meta: ExportMeta): string {
  const clean = body
    .replace(FENCE, (_m, lang: string, inner: string) =>
      lang.toLowerCase() === "checkpoint" ? checkpointToMarkdown(inner) : "",
    )
    .replace(IMAGE_MARKER, (_m, title: string, caption: string) => `*Figure — ${title}. ${caption}*`)
    .replace(BOOK_MARKER, (_m, author: string, title: string, year: string) => `- ${author}, *${title}* (${year})`)
    .replace(/\n{3,}/g, "\n\n");

  const meta_lines = [
    `# ${meta.title}`,
    "",
    `*Periergia study notes — ${meta.url}*`,
    meta.depth || meta.level
      ? `*Depth: ${meta.depth ?? "—"} · Level: ${meta.level ?? "—"} · Exported ${new Date().toISOString().slice(0, 10)}*`
      : `*Exported ${new Date().toISOString().slice(0, 10)}*`,
    "",
    "---",
    "",
  ];
  return `${meta_lines.join("\n")}${clean.trim()}\n`;
}

// ── Download helper ───────────────────────────────────────────────────────

/** Filesystem-safe stem from a topic title. */
export function fileStem(title: string): string {
  return (
    title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "")
      .slice(0, 80) || "periergia-topic"
  );
}

export function downloadText(filename: string, text: string, mime: string): void {
  const blob = new Blob([text], { type: `${mime};charset=utf-8` });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  a.remove();
  // Revoke on the next tick — Safari needs the URL to survive the click.
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
