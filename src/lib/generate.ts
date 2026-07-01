import "server-only";
import type {
  Content,
  ContentKey,
  Depth,
  Format,
  GradeResult,
  Level,
  Node,
  Quiz,
  QuizQuestion,
} from "./types";
import { getAnthropic, MODEL } from "./anthropic";
import { getAncestors } from "./store";

// ── Generation core ──────────────────────────────────────────────────────
// Content, quizzes, and open-answer grading. Each function uses Claude when a
// key is configured and otherwise returns a structured placeholder so the full
// product loop works offline. Callers cache the results (see store.ts).

const DEPTH_GUIDE: Record<Depth, string> = {
  skim: "a 2–3 sentence orientation — just the gist",
  definition: "a precise one-paragraph definition with the key terms",
  medium: "a clear ~350-word explanation a curious learner can follow",
  detailed: "a thorough ~700-word treatment with examples and nuance",
  research: "a rigorous, research-grade account citing key thinkers and open questions",
};

const LEVEL_GUIDE: Record<Level, string> = {
  easy: "Explain for a bright beginner. Plain language, vivid analogies, no jargon without defining it.",
  advanced: "Explain for an advanced student. Assume fundamentals; use correct terminology.",
  expert: "Explain for an expert. Be precise and dense; engage edge cases and debates.",
};

async function nodeContext(node: Node): Promise<string> {
  const ancestors = await getAncestors(node);
  return ancestors.map((n) => n.title).join(" › ");
}

// ---- Content -------------------------------------------------------------

export async function generateContent(node: Node, key: ContentKey): Promise<Content> {
  const trail = await nodeContext(node);
  const client = getAnthropic();
  if (!client) {
    return { ...key, body: placeholderContent(node, key, trail), generated: false };
  }

  const system =
    "You are Periergia, a living textbook for everything. You write clear, accurate, " +
    "engaging explanations that fit the reader's chosen depth and level. Output GitHub-flavored " +
    "Markdown only: a short bolded lead sentence, then prose with the occasional subheading, " +
    "list, or example where it genuinely helps. No preamble, no meta-commentary, no closing summary.";

  const prompt =
    `Write the entry for **${node.title}** (in the path ${trail}).\n\n` +
    `Depth: ${key.depth} — ${DEPTH_GUIDE[key.depth]}.\n` +
    `Level: ${key.level}. ${LEVEL_GUIDE[key.level]}\n\n` +
    `${node.summary ? `Context: ${node.summary}\n\n` : ""}` +
    `Write the entry now.`;

  // Stream so longer (detailed/research) entries don't hit HTTP timeouts.
  const stream = client.messages.stream({
    model: MODEL,
    max_tokens: 4096,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: prompt }],
  });
  const message = await stream.finalMessage();
  const body = textOf(message.content).trim();

  return { ...key, body: body || placeholderContent(node, key, trail), generated: true };
}

// Concatenate the text blocks of a Claude response.
function textOf(content: { type: string }[]): string {
  return content
    .filter((b) => b.type === "text")
    .map((b) => (b as unknown as { text: string }).text)
    .join("");
}

// ---- Quiz ----------------------------------------------------------------

const QUIZ_SCHEMA = {
  type: "object",
  additionalProperties: false,
  properties: {
    questions: {
      type: "array",
      items: {
        type: "object",
        additionalProperties: false,
        properties: {
          type: { type: "string", enum: ["mcq", "open"] },
          prompt: { type: "string" },
          options: { type: "array", items: { type: "string" } },
          answerIndex: { type: "integer" },
          rubric: { type: "string" },
        },
        required: ["type", "prompt"],
      },
    },
  },
  required: ["questions"],
} as const;

export async function generateQuiz(node: Node, level: Level): Promise<Quiz> {
  const client = getAnthropic();
  if (!client) {
    return { nodeId: node.id, level, questions: placeholderQuiz(node), generated: false };
  }

  const trail = await nodeContext(node);
  const system =
    "You write short, fair quizzes that test understanding (not trivia recall) of a topic. " +
    "Produce a mix of multiple-choice and one or two open-ended questions. For MCQ, give exactly " +
    "4 plausible options and the 0-based index of the correct one. For open questions, give a " +
    "concise rubric describing what a correct answer must include.";
  const prompt =
    `Write 6 questions testing understanding of **${node.title}** (${trail}) at the ${level} level. ` +
    `Include 4 multiple-choice and 2 open-ended questions.`;

  const res = await client.messages.create({
    model: MODEL,
    max_tokens: 2048,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: prompt }],
    output_config: { format: { type: "json_schema", schema: QUIZ_SCHEMA } },
  });

  const text = textOf(res.content) || "{}";
  let parsed: { questions?: Omit<QuizQuestion, "id">[] };
  try {
    parsed = JSON.parse(text);
  } catch {
    parsed = { questions: [] };
  }
  const questions: QuizQuestion[] = (parsed.questions ?? []).map((q, i) => ({
    id: `q${i + 1}`,
    ...q,
  }));

  return {
    nodeId: node.id,
    level,
    questions: questions.length ? questions : placeholderQuiz(node),
    generated: questions.length > 0,
  };
}

// ---- Grading (open answers) ---------------------------------------------

const GRADE_SCHEMA = {
  type: "object",
  additionalProperties: false,
  properties: {
    correct: { type: "boolean" },
    score: { type: "number" },
    feedback: { type: "string" },
  },
  required: ["correct", "score", "feedback"],
} as const;

export async function gradeOpenAnswer(
  question: QuizQuestion,
  answer: string,
): Promise<GradeResult> {
  const client = getAnthropic();
  if (!client) {
    const ok = answer.trim().length >= 30;
    return {
      correct: ok,
      score: ok ? 0.7 : 0.2,
      feedback: ok
        ? "Thanks — a substantive answer. (Connect Claude to get real, rubric-based grading and tailored feedback.)"
        : "Try to say more — explain the idea in your own words. (Connect Claude for real grading.)",
    };
  }

  const system =
    "You are a fair, encouraging grader. Judge the answer against the rubric. Return a score from " +
    "0 to 1, whether it is essentially correct, and one or two sentences of specific, kind feedback.";
  const prompt =
    `Question: ${question.prompt}\n\nRubric for a correct answer: ${question.rubric ?? "Demonstrates clear understanding of the concept."}\n\nStudent's answer: ${answer}`;

  const res = await client.messages.create({
    model: MODEL,
    max_tokens: 512,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: prompt }],
    output_config: { format: { type: "json_schema", schema: GRADE_SCHEMA } },
  });
  const text = textOf(res.content) || "{}";
  try {
    const g = JSON.parse(text) as GradeResult;
    return { correct: !!g.correct, score: Math.max(0, Math.min(1, g.score ?? 0)), feedback: g.feedback ?? "" };
  } catch {
    return { correct: false, score: 0, feedback: "Could not grade this answer — please try again." };
  }
}

// ── Placeholders (offline / no key) ───────────────────────────────────────

function placeholderContent(node: Node, key: ContentKey, trail: string): string {
  const t = node.title;
  const subject = trail.split(" › ")[0];
  const lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt " +
    "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco " +
    "laboris nisi ut aliquip ex ea commodo consequat.";
  const lorem2 =
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla " +
    "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt " +
    "mollit anim id est laborum.";

  // Sectioned so the "On this page" outline has anchors to track on scroll.
  return [
    `**${t}** — ${node.summary || `an entry in ${trail}.`} _This is placeholder text; set an \`ANTHROPIC_API_KEY\` to generate the real, original entry tuned to your depth, level, and format._`,
    ``,
    `## Overview`,
    lorem,
    ``,
    lorem2,
    ``,
    `## Origins & context`,
    `Where ${t} comes from and how it fits within ${subject}. ${lorem}`,
    ``,
    `## Key ideas`,
    `The handful of ideas that carry most of the weight in ${t}.`,
    ``,
    `- The first core idea, stated plainly.`,
    `- A second idea, and why it follows.`,
    `- A third, with an everyday analogy.`,
    ``,
    lorem2,
    ``,
    `## How it works`,
    lorem,
    ``,
    `## Why it matters`,
    `What ${t} lets you understand or do once it clicks. ${lorem2}`,
    ``,
    `## Common questions`,
    `The questions most people have when meeting ${t} for the first time. When you're ready, hit **Test yourself**.`,
  ].join("\n");
}

function formatLabel(f: Format): string {
  return f === "text" ? "text" : f === "voice" ? "audio" : f;
}

function placeholderQuiz(node: Node): QuizQuestion[] {
  return [
    {
      id: "q1",
      type: "mcq",
      prompt: `What is the best one-line description of "${node.title}"?`,
      options: [
        node.summary || `The central idea of ${node.title}.`,
        "An unrelated concept from a different subject.",
        "A common misconception about the topic.",
        "None of the above.",
      ],
      answerIndex: 0,
    },
    {
      id: "q2",
      type: "open",
      prompt: `In your own words, explain "${node.title}" to someone new to it.`,
      rubric: "Mentions the core idea clearly and why it matters.",
    },
  ];
}
