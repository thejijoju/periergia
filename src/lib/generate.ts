import "server-only";
import type {
  Content,
  ContentKey,
  Depth,
  GradeResult,
  Level,
  Node,
  Quiz,
  QuizQuestion,
} from "./types";
import { type Mode, getMode } from "./modes";
import { getAnthropic, MODEL } from "./anthropic";
import { normalizeLang, getLang } from "./i18n";
import { getAncestors, getCachedContent, putCachedContent } from "./store";
import { resolveImageMarkers } from "./images";
import { fetchWikipediaContext } from "./wikipedia";

// ── Generation core ──────────────────────────────────────────────────────
// Content, quizzes, and open-answer grading. Each function uses Claude when a
// key is configured and otherwise returns a structured placeholder so the full
// product loop works offline. Callers cache the results (see store.ts).

// The depth ladder is the course progression — from a first-day orientation to
// a doctoral-seminar chapter. Word targets are deliberate: the longer tiers
// should read like real textbook sections/chapters, with headed subsections,
// not a padded blurb. Length must always serve substance — more sections,
// examples, causes/consequences, and evidence — never filler.
const DEPTH_GUIDE: Record<Depth, string> = {
  skim: "a 2–3 sentence orientation — just the gist, no headings",
  definition: "a precise ~150-word definition with the key terms, in one or two tight paragraphs",
  medium:
    "a clear, self-contained ~700-word explanation a curious learner can follow, organized into 3–4 short headed sections with concrete examples",
  detailed:
    "a thorough ~2,600-word-MINIMUM treatment — a full, self-contained textbook chapter with 6–8 headed subsections that cover origins, the core ideas or narrative, worked or concrete examples with real names, numbers, and dates, causes and consequences, real-world applications, and the nuances and debates. Go deep and be genuinely comprehensive; never stop at an overview or trail off into a summary. If the required coverage below is richer than ~2,600 words can hold, run longer rather than cut any of it",
  research:
    "a rigorous ~3,500-word-MINIMUM, doctoral-seminar-grade chapter: the full narrative or theory in depth, the historiography and scholarly debates, key thinkers and landmark works, primary-source quotation, competing interpretations, and the open questions at the research frontier — organized with clear section headings. This should read like a serious chapter, not an article. If the required coverage below is richer than ~3,500 words can hold, run longer rather than cut any of it",
};

const LEVEL_GUIDE: Record<Level, string> = {
  easy: "Explain for a bright beginner. Plain language, vivid analogies, no jargon without defining it.",
  advanced: "Explain for an advanced student. Assume fundamentals; use correct terminology.",
  expert: "Explain for an expert. Be precise and dense; engage edge cases and debates.",
};
// Level changes vocabulary and assumed background ONLY — never length or which
// facts appear. Only the depth tier above controls how much ground is covered.
const LEVEL_LENGTH_GUARD =
  "The level below changes how you explain things — plainer or more technical language, more or " +
  "fewer worked-through basics — but it must NEVER shorten the article or drop any required " +
  "coverage. An 'advanced' or 'expert' reader still gets the full depth-tier length and every " +
  "required fact, just explained with more assumed background and precision, not less content.";

// How each learning mode should render the topic. All modes produce Markdown;
// visual/immersive modes produce a described storyboard/experience (real image,
// video, and 3D generation arrive as later "format plugins").
const MODE_GUIDE: Record<Mode, string> = {
  read: "A clear, well-structured explanatory article with short sections.",
  listen: "A clear, spoken-style explanation that flows well when read aloud.",
  podcast: "A lively two-host podcast script (label lines **Host A** / **Host B**) that explains the topic through natural conversation.",
  story: "A short narrative story that teaches the topic through characters and plot, then a one-line note on the lesson.",
  song: "Original song lyrics with verses and a chorus that capture the key ideas, plus a short note on the intended tune/mood.",
  image: "A vivid, detailed description of one illustrative image (written as an image-generation prompt), then a caption explaining what it shows and why.",
  sketch: "A simple annotated sketch described step by step — what to draw and label — so the concept is conveyed visually.",
  comic: "A short comic laid out panel by panel (**Panel 1**, **Panel 2**, …), each with a caption and any dialogue.",
  video: "A short explainer-video storyboard: numbered scenes, each with on-screen visuals and the narration for that scene.",
  animation: "An animation storyboard describing the key frames and motion that bring the concept to life, with narration.",
  model3d: "A description of an interactive 3D model: its parts, how they relate in space, and what to rotate or zoom to understand it.",
  mindmap: "A mind map as a nested bulleted outline: the central idea, its main branches, and sub-branches.",
  timeline: "A chronological timeline as a dated list, each entry a date/period in bold followed by a short description.",
  quiz: "A short set of understanding-check questions, each followed by its answer.",
  tutor: "An interactive tutor opening: greet the learner, explain the first idea simply, then ask one question to check understanding.",
  simulate: "A described interactive simulation: the setup, the variables the learner can change, and what happens as they do.",
  roleplay: "A roleplay scenario: set the scene, give the learner a role, and voice a relevant character they can converse with.",
  teachback: "A 'teach it back' exercise: a scenario where the learner must explain the topic, with hints and what a strong explanation includes.",
  debate: "A structured debate: state the motion, then alternating arguments **For** and **Against**, ending with what to weigh.",
  build: "A hands-on project: a numbered, step-by-step guide to make or do something that embodies the concept.",
  game: "A simple text game that teaches the topic: its rules, how to play, and an engaging first round.",
  puzzle: "A puzzle or riddle whose solution requires understanding the topic, followed by the worked solution.",
  duel: "A rapid-fire challenge — a series of quick questions of rising difficulty — with the answers after.",
  speedrun: "A speedrun cram sheet: only the essential facts to grasp the topic as fast as possible, tightly ordered.",
  adventure: "A short choose-your-path adventure that teaches the topic through branching choices (number the options at each step).",
  ar: "A described augmented-reality experience: what virtual elements appear in the learner's space and how they interact to learn.",
  vr: "A described virtual-reality experience: the immersive world the learner steps into and what they do there to grasp the concept.",
};

async function nodeContext(node: Node): Promise<string> {
  const ancestors = await getAncestors(node);
  return ancestors.map((n) => n.title).join(" › ");
}

// ---- Content -------------------------------------------------------------

// The canonical, most-worked generation for a node: research depth, advanced
// level, the plain "read" format — the "ten-minute article". Every shorter
// depth is DERIVED from this one vetted text (a tightly-constrained
// adaptation, forbidden from inventing anything the master doesn't contain)
// instead of independently re-rolling a fresh generation from raw notes for
// each combination — so facts and editorial judgment stay identical all the
// way down the ladder. Only the master pays the full "write from scratch" cost.
//
// Within Research depth itself, every level (easy/advanced/expert) serves the
// master body VERBATIM — no rewrite pass at all. A "just reword it for this
// level" pass is exactly the kind of extra generation that can quietly trim
// or soften the flagship article, and there is no length ladder to justify
// the risk at the top tier: Research is the ten-minute article, full stop,
// at every level.
const MASTER_DEPTH: Depth = "research";
const MASTER_LEVEL: Level = "advanced";

// Discipline-aware math. Quantitative subjects render notation as LaTeX;
// everyone else (history, literature, law…) writes numbers as plain prose —
// otherwise '63 kg' and '40,000 chests' come out italicised in math font.
const QUANTITATIVE_SUBJECTS = new Set([
  "mathematics",
  "physics",
  "chemistry",
  "astronomy-and-space",
  "engineering-and-technology",
  "computer-science",
  "statistics",
  "economics",
  "finance",
]);

function mathRule(node: Node): string {
  return QUANTITATIVE_SUBJECTS.has(node.subjectSlug)
    ? "Write all mathematics as LaTeX: inline math in $…$ (e.g. $r_e$, $\\beta_i$) and standalone " +
        "equations in $$…$$ on their own lines — never as plain text or Unicode approximations. " +
        "Escape literal dollar amounts as \\$ (e.g. \\$100) so currency is never mistaken for math.\n\n"
    : "This is not a mathematical subject: do NOT use LaTeX or $…$/$$…$$ math notation anywhere. " +
        "Write every number, quantity, range, and unit as ordinary prose text — '63–65 kg', " +
        "'40,000 chests', 'about 2,560 tonnes a year' — never italicised or set as an equation. " +
        "Write money with the currency named (e.g. '21 million silver dollars', '£5,000'), never " +
        "with a bare $ sign, so nothing is mistaken for math.\n\n";
}

const DEFINITION_CALLOUT_RULE =
  "ALWAYS begin with a definition callout: a single Markdown blockquote (a line starting " +
  "with '> ') of one or two plain, jargon-free sentences that define the topic in simple " +
  "terms, starting with the term in bold — e.g. '> **State management** is a concept focused " +
  "on maintaining and controlling the state of an application…'. Then continue with the " +
  "requested content. (For song lyrics, still open with this one-line definition blockquote " +
  "before the lyrics.)\n\n";

// Image density is subject-aware. Most subjects illustrate a narrative with
// 2–4 images; content-dense subjects (economics) are carried by the ideas, not
// a visual storyline, so they cap at 2.
const IMAGE_LIGHT_SUBJECTS = new Set(["economics"]);
const MAX_IMAGES_LIGHT = 2;

function imageRule(node: Node): string {
  const light = IMAGE_LIGHT_SUBJECTS.has(node.subjectSlug);
  const density = light
    ? `insert AT MOST ${MAX_IMAGES_LIGHT} image markers — this is a content-dense subject carried ` +
      "by its ideas, not a visual storyline, so use images sparingly (aim for one or two) and only " +
      "where a picture genuinely clarifies a concept"
    : "at 2 to 4 natural points, insert an image marker";
  const guidance = light
    ? "When you do include an image, reach for the concrete people, institutions, artifacts, and " +
      "events behind the idea — a portrait of a key economist (e.g. John Maynard Keynes, Milton " +
      "Friedman, Irving Fisher), a central bank or stock exchange, a banknote or bond certificate, " +
      "a famous episode (a bank run, the 1929 crash, Weimar hyperinflation) — never an abstract " +
      "diagram of the concept itself. "
    : "Abstract or quantitative subjects (finance, mathematics, law, philosophy) are NOT an " +
      "exception — every article still needs its 2–4 images. Reach for the concrete people, places, " +
      "institutions, artifacts, and events behind the idea: portraits of key thinkers, the " +
      "institutions and places, physical artifacts, and the real episodes the concept explains. ";
  return (
    "Illustrate the article with real images: " +
    density +
    ", each ALONE on its own line, in the form {{image: <exact English Wikipedia article title> | <one-line caption>}} " +
    "— e.g. {{image: Standard of Ur | The Standard of Ur (c. 2600 BCE), war and peace panels in shell and lapis lazuli}}. " +
    "The title must be a real English Wikipedia article about a concrete, photographable subject " +
    "central to the topic — an artifact, person, building, artwork, map, or place — whose article " +
    "will carry a good lead image (prefer specific artifacts and people over abstract concepts). " +
    guidance +
    "Never write image markdown or URLs yourself; the system resolves markers to real images."
  );
}

// Belt-and-suspenders: strip any image markers beyond `max` so a content-dense
// subject can never exceed its cap even if the model over-illustrates.
function capImageMarkers(body: string, max: number): string {
  let n = 0;
  return body.replace(
    /^[ \t]*\{\{\s*image:[^{}\n]*\}\}[ \t]*$/gm,
    (marker) => (++n <= max ? marker : ""),
  );
}

// `onText`, when passed, receives the model's text deltas as they stream in, so
// a caller (the /api/content/stream route) can forward them to the reader and
// the article visibly writes itself instead of appearing after a 20–50s blank.
// The returned Content is still the final, image-resolved body for caching.
export async function generateContent(
  node: Node,
  key: ContentKey,
  onText?: (t: string) => void,
): Promise<Content> {
  const trail = await nodeContext(node);
  const client = getAnthropic();

  // Non-English reading language: build (and cache) the vetted English version
  // at this exact depth/level/format, then TRANSLATE it — so every language
  // inherits the same fact-checked article rather than regenerating from
  // scratch. Falls back to the English text if we can't translate.
  const lang = normalizeLang(key.lang);
  if (lang !== "en") {
    const enKey: ContentKey = { ...key, lang: "en" };
    let en = await getCachedContent(enKey);
    if (!en?.generated) {
      en = await generateContent(node, enKey);
      if (en.generated) await putCachedContent(en);
    }
    if (!client || !en.generated) {
      return { ...key, body: en.body, generated: en.generated, reviewed: false };
    }
    const body = await translateBody(en.body, lang, client);
    return { ...key, body, generated: true, reviewed: false };
  }

  if (!client) {
    return { ...key, body: placeholderContent(node, key, trail), generated: false, reviewed: false };
  }

  const isMasterKey = key.depth === MASTER_DEPTH && key.level === MASTER_LEVEL && key.format === "read";
  if (isMasterKey) return createMasterContent(node, key, trail, client, onText);

  const masterKey: ContentKey = { nodeId: node.id, depth: MASTER_DEPTH, level: MASTER_LEVEL, format: "read" };
  let master = await getCachedContent(masterKey);
  if (!master?.generated) {
    // Building the master silently (no stream) is unavoidable here — the reader
    // asked for a shorter tier, so we stream that, not the master underneath.
    master = await createMasterContent(node, masterKey, trail, client);
    if (master.generated) await putCachedContent(master);
  }

  // Research depth, any level, "read" format: this IS the ten-minute article —
  // serve it unchanged rather than risk a rewrite pass quietly shortening it.
  // It inherits the master's reviewed flag too, since the text is identical.
  if (key.depth === MASTER_DEPTH && key.format === "read") {
    return { ...key, body: master.body, generated: master.generated, reviewed: master.reviewed };
  }

  return distillContent(node, key, master.body, trail, client, onText);
}

// Translate a finished English article into another language while preserving
// everything that isn't prose: Markdown structure, LaTeX math, image URLs, and
// — critically — the identifier inside a ```example block (it's a program key,
// not text). Proper nouns and work titles stay in the original so reference
// lists and affiliate links still point to the real books.
async function translateBody(
  body: string,
  lang: string,
  client: NonNullable<ReturnType<typeof getAnthropic>>,
): Promise<string> {
  const langName = getLang(lang).englishName;
  const system =
    `You are an expert literary and technical translator. Translate the GitHub-flavored Markdown ` +
    `article the user sends into ${langName}, for an educated reader. Render it naturally and ` +
    `idiomatically — not word for word — preserving meaning, tone, and structure.\n\n` +
    `Output ONLY the translated Markdown, with no preamble or notes. Obey these rules exactly:\n` +
    `- Keep ALL Markdown syntax intact: heading levels (##), lists, tables, blockquotes, bold/italic markers, and links.\n` +
    `- Do NOT alter anything inside a fenced code block (\`\`\` … \`\`\`). In particular, leave a \`\`\`example block and the identifier on the line inside it (e.g. factor-of-safety) EXACTLY as written — it is a program key, not prose.\n` +
    `- Do NOT translate mathematics: leave every $…$ and $$…$$ LaTeX expression byte-for-byte unchanged.\n` +
    `- Leave URLs and image links unchanged. For an {{image: Title | caption}} marker, keep the Title unchanged and translate only the caption after the "|".\n` +
    `- Keep people's names and the ORIGINAL titles of books and works as they are (you may append a translation of a title in parentheses); never translate them away, so reference lists still name the real works.`;
  const stream = client.messages.stream({
    model: MODEL,
    max_tokens: 24000,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: body }],
  });
  const message = await stream.finalMessage();
  return textOf(message.content).trim() || body;
}

async function createMasterContent(
  node: Node,
  key: ContentKey,
  trail: string,
  client: NonNullable<ReturnType<typeof getAnthropic>>,
  onText?: (t: string) => void,
): Promise<Content> {
  const mode = key.format as Mode; // the `format` field holds the learning mode
  const spec = getMode(mode);

  const system =
    "You are Periergia, a living textbook for everything. You write clear, accurate, " +
    "engaging content that fits the reader's chosen mode, depth, and level. Output GitHub-flavored " +
    "Markdown only. No preamble, no meta-commentary, no closing summary.\n\n" +
    mathRule(node) +
    DEFINITION_CALLOUT_RULE +
    "NEVER present a topic as dry, abstract theory. Ground it in the real world: weave in " +
    "concrete examples and the relevant historical, political, economic, or cultural events " +
    "that shaped or illustrate it — with real names, places, and dates. Give context for why " +
    "the idea emerged and why it matters. Where the topic naturally overlaps with other fields " +
    "or topics, draw those connections so the reader sees how ideas link together.\n\n" +
    "Bring the topic's voices and artifacts into the text: where it enriches the material, " +
    "quote short passages from primary sources — speeches, letters, poems, memoirs — with " +
    "attribution, and point to specific images or photographs by name (e.g. 'the Ravenna " +
    "mosaics of Justinian and Theodora', 'Dorothea Lange's Migrant Mother'). Unless the mode " +
    "makes it inappropriate, close with a short '## Further exploration' section: an annotated " +
    "list of real biographies, primary texts, autobiographies, narratives, poems, and notable " +
    "images that invite the reader deeper — each named precisely (author, title, year) with one " +
    "line on why it's worth their time. Name only real, verifiable works; never fabricate " +
    "citations, quotations, or URLs — omit rather than invent.\n\n" +
    imageRule(node);

  const coverageRule = node.summary
    ? `Required coverage — this is a hard requirement, not a suggestion: you must include ` +
      `EVERY fact, name, date, quote, and figure below, explained clearly at the chosen level. ` +
      `Do not stop the narrative early, do not wave at later material with "continues in X", and ` +
      `do not relegate any of it to "Further exploration" — weave all of it into the article body ` +
      `itself, even if that means running well past the target length: ${node.summary}\n\n`
    : "";

  // Ground the master in the live Wikipedia article: real dates, names, and
  // figures to verify against, plus material the model's memory may lack. On
  // any conflict the curated node.summary wins (it carries our own editorial
  // corrections); a fetch failure just means generating ungrounded.
  const wiki = await fetchWikipediaContext(node.title);
  const groundingRule = wiki
    ? `Reference material — the current English Wikipedia article "${wiki.title}" is included ` +
      `below. Use it to VERIFY every date, name, number, and sequence of events you write, and ` +
      `mine it for substance worth covering — but write entirely in your own words and structure ` +
      `(never copy or lightly paraphrase its sentences; it is CC BY-SA licensed), go beyond it ` +
      `in depth and narrative quality, and where it conflicts with the required coverage above, ` +
      `the required coverage wins.\n\n<wikipedia>\n${wiki.extract}\n</wikipedia>\n\n`
    : "";

  const prompt =
    `Present **${node.title}** (in the path ${trail}) as a **${spec.label}**.\n\n` +
    `Mode: ${spec.label} — ${MODE_GUIDE[mode]}\n` +
    `Depth: ${key.depth} — ${DEPTH_GUIDE[key.depth]}.\n` +
    `Level: ${key.level}. ${LEVEL_GUIDE[key.level]} ${LEVEL_LENGTH_GUARD}\n\n` +
    coverageRule +
    groundingRule +
    `Create it now.`;

  // Stream: at this max_tokens the SDK refuses a non-streaming call (it could
  // exceed the HTTP timeout). Thinking + text share the budget; the research
  // tier targets ~3,500 words, so keep generous headroom against a cutoff.
  const stream = client.messages.stream({
    model: MODEL,
    max_tokens: 24000,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: prompt }],
  });
  if (onText) stream.on("text", onText);
  const message = await stream.finalMessage();
  let raw = textOf(message.content).trim();
  if (IMAGE_LIGHT_SUBJECTS.has(node.subjectSlug)) raw = capImageMarkers(raw, MAX_IMAGES_LIGHT);
  const body = await resolveImageMarkers(raw, node.title);

  return { ...key, body: body || placeholderContent(node, key, trail), generated: true, reviewed: false };
}

// Adapts the canonical master article into a different depth/level/mode.
// Constrained to the master's own facts — this is what keeps every rung of
// the ladder consistent with the one excellent, fact-checked source instead
// of each being its own independent (and independently fallible) generation.
async function distillContent(
  node: Node,
  key: ContentKey,
  masterBody: string,
  trail: string,
  client: NonNullable<ReturnType<typeof getAnthropic>>,
  onText?: (t: string) => void,
): Promise<Content> {
  const mode = key.format as Mode;
  const spec = getMode(mode);

  // Images and section structure scale with depth. A "skim" (2–3 sentences) or
  // "definition" (~150 words) must not sprout images, headings, or sections —
  // forcing the full article's "2–4 images + callout" rules onto them is what
  // bloated them to 250–950 words. Only medium and up get images.
  const wantsImages = DEPTH_ORDER[key.depth] >= DEPTH_ORDER.medium;
  const brief = DEPTH_ORDER[key.depth] <= DEPTH_ORDER.definition;

  const briefRule =
    key.depth === "skim"
      ? "This is a SKIM: output ONLY the opening definition callout blockquote — a 2–3 sentence " +
        "orientation capturing the gist — and NOTHING after it. No further paragraphs, headings, " +
        "lists, or images.\n\n"
      : key.depth === "definition"
        ? "This is a DEFINITION: output the definition callout blockquote and at most one tight " +
          "paragraph, ~150 words total. No headings, lists, images, or 'Further exploration'.\n\n"
        : "";

  const system =
    "You are Periergia, a living textbook for everything. You are given the full, already " +
    "researched and fact-checked canonical article on a topic below, and must adapt it into a " +
    "different depth, level, and format — never introducing a single fact, name, date, quote, or " +
    "figure that is not already present in that canonical text. Output GitHub-flavored Markdown " +
    "only. No preamble, no meta-commentary, no closing summary.\n\n" +
    mathRule(node) +
    DEFINITION_CALLOUT_RULE +
    (wantsImages ? imageRule(node) : "Do NOT include any images or image markers in this short entry.\n\n") +
    briefRule;

  const shorter = DEPTH_ORDER[key.depth] < DEPTH_ORDER[MASTER_DEPTH];
  const coverageRule = shorter
    ? `Select only the most essential facts from the canonical article to fit this shorter depth. ` +
      `You do not need everything, but add nothing beyond what the canonical article contains.\n\n`
    : `Preserve every fact, name, date, quote, and figure from the canonical article — this is the ` +
      `same depth tier as the canonical article, so this should carry the same substance, just in ` +
      `the requested level's register and the requested mode's form.\n\n`;

  const prompt =
    `Canonical article on **${node.title}** (${trail}) — your ONLY source of facts:\n\n` +
    `"""\n${masterBody}\n"""\n\n` +
    `Adapt it into a **${spec.label}**.\n` +
    `Mode: ${spec.label} — ${MODE_GUIDE[mode]}\n` +
    `Depth: ${key.depth} — ${DEPTH_GUIDE[key.depth]}.\n` +
    `Level: ${key.level}. ${LEVEL_GUIDE[key.level]} ${LEVEL_LENGTH_GUARD}\n\n` +
    coverageRule +
    `Create it now.`;

  const stream = client.messages.stream({
    model: MODEL,
    max_tokens: 16000,
    thinking: { type: "adaptive" },
    system,
    messages: [{ role: "user", content: prompt }],
  });
  if (onText) stream.on("text", onText);
  const message = await stream.finalMessage();
  // Short depths get no images at all — pass no topicTitle so the "at least one
  // image" fallback in resolveImageMarkers doesn't splice a lead image into a
  // 2–3 sentence skim or a one-paragraph definition.
  let raw = textOf(message.content).trim();
  if (wantsImages && IMAGE_LIGHT_SUBJECTS.has(node.subjectSlug)) {
    raw = capImageMarkers(raw, MAX_IMAGES_LIGHT);
  }
  const body = await resolveImageMarkers(raw, wantsImages ? node.title : undefined);

  return { ...key, body: body || placeholderContent(node, key, trail), generated: true, reviewed: false };
}

const DEPTH_ORDER: Record<Depth, number> = {
  skim: 0,
  definition: 1,
  medium: 2,
  detailed: 3,
  research: 4,
};

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
    `Include 4 multiple-choice and 2 open-ended questions.` +
    (node.summary
      ? ` The questions must test these core concepts — make sure each is covered by at least one question: ${node.summary}`
      : "");

  const res = await client.messages.create({
    model: MODEL,
    max_tokens: 8192,
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
    max_tokens: 2048,
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

  // Leads with a definition callout (blockquote), then sections so the
  // "On this page" outline has anchors to track on scroll.
  return [
    `> **${t}** — ${node.summary || `a concept in ${trail}.`}`,
    ``,
    `_This is placeholder text; set an \`ANTHROPIC_API_KEY\` to generate the real, original entry tuned to your depth, level, and format._`,
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
