// ── schema.org structured data ────────────────────────────────────────────
// The syllabus tree is genuinely courseware, and saying so in JSON-LD lets
// search engines index it as such rather than as loose articles. The mapping
// follows the tree's own shape, which keeps the claims honest:
//
//   subject / section node (has children)  →  Course        (+ hasPart list)
//   leaf topic node (an article)           →  LearningResource + Article
//   every page                             →  BreadcrumbList
//
// Marking a single article as a Course would be an overclaim, and marking a
// whole subject as an Article would be an underclaim; the node's position in
// the tree already tells us which it is.
//
// Where a field can be filled from something real, it is: `timeRequired` comes
// from the same reading-time measurement shown under the title, and `teaches`
// from the article's own section headings — so the markup describes the page
// that exists rather than asserting a shape for the crawler's benefit.

import { readingMinutes } from "./readingTime";

export interface SdCrumb {
  label: string;
  url?: string;
}

export interface SdChild {
  title: string;
  url: string;
  description?: string;
}

export interface StructuredDataInput {
  title: string;
  description?: string;
  pageUrl: string;
  siteUrl: string;
  subjectName: string;
  crumbs: SdCrumb[];
  /** Children of a section node; empty/absent for a leaf topic. */
  children?: SdChild[];
  /** The article body, when one is server-rendered into the page. */
  body?: string;
  /** Reader level of the served variant ("advanced" | "easy" | "expert"). */
  level?: string;
  /** True once a human has reviewed this exact text. */
  reviewed?: boolean;
  inLanguage?: string;
}

const PROVIDER = (siteUrl: string) => ({
  "@type": "Organization",
  name: "Periergia",
  url: siteUrl,
});

/** ISO 8601 duration from whole minutes: 45 → "PT45M". */
export function isoDuration(minutes: number): string | undefined {
  if (!minutes || minutes <= 0) return undefined;
  if (minutes < 60) return `PT${minutes}M`;
  const h = Math.floor(minutes / 60);
  const m = minutes % 60;
  return m ? `PT${h}H${m}M` : `PT${h}H`;
}

// Structural headings carry no subject matter — they are the same in every
// chapter — so they would pollute `teaches` with boilerplate.
const BOILERPLATE = new Set([
  "pulling the thread",
  "further reading",
  "problems",
  "worked answers",
  "summary",
]);

/** The article's own H2 headings, which in a curated master are its learning points. */
export function teachesFromBody(body: string | undefined, limit = 12): string[] {
  if (!body) return [];
  const out: string[] = [];
  for (const m of body.matchAll(/^##\s+(.+?)\s*$/gm)) {
    const heading = m[1]
      .replace(/\*\*([^*]+)\*\*/g, "$1")
      .replace(/[*_`]/g, "")
      .trim();
    if (!heading || BOILERPLATE.has(heading.toLowerCase())) continue;
    out.push(heading);
    if (out.length >= limit) break;
  }
  return out;
}

/** Strip inline markdown so a description reads as plain prose. */
function plain(s: string): string {
  return s
    .replace(/\*\*([^*]+)\*\*/g, "$1")
    .replace(/(^|\W)\*([^*]+)\*/g, "$1$2")
    .replace(/`([^`]+)`/g, "$1")
    .replace(/\[([^\]]*)\]\([^)]*\)/g, "$1")
    .replace(/\$\$?/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

/** Trim to a whole sentence or word under `max`, so a description never ends mid-word. */
function clip(s: string, max = 300): string {
  if (s.length <= max) return s;
  const cut = s.slice(0, max);
  const sentence = cut.lastIndexOf(". ");
  if (sentence > max * 0.5) return cut.slice(0, sentence + 1);
  return `${cut.slice(0, cut.lastIndexOf(" "))}…`;
}

/**
 * Every curated master opens with a `>` blockquote lede — a one-paragraph
 * statement of what the chapter argues, written by hand. That is a far better
 * description than any template, so prefer it when the node's own summary is
 * absent (which it is for most of the tree).
 */
function ledeFromBody(body: string | undefined): string | null {
  if (!body) return null;
  const out: string[] = [];
  for (const line of body.split("\n")) {
    if (/^>\s?/.test(line)) out.push(line.replace(/^>\s?/, "").trim());
    else if (out.length) break;
    else if (line.trim()) break; // content began without a lede
  }
  const text = plain(out.join(" "));
  return text.length >= 40 ? clip(text) : null;
}

/**
 * Resolve a non-empty description. `description` is a REQUIRED field for
 * Google's Course rich result, and omitting it fails validation — so this must
 * never return empty. Order of preference: the node's own summary, the
 * article's hand-written lede, a list of what a section contains, and only then
 * a generic line.
 */
function resolveDescription(
  supplied: string | undefined,
  title: string,
  subjectName: string,
  children: SdChild[],
  body: string | undefined,
): string {
  const own = supplied && plain(supplied);
  if (own && own.length >= 20) return clip(own);

  const lede = ledeFromBody(body);
  if (lede) return lede;

  if (children.length) {
    const names = children.map((c) => c.title);
    const list =
      names.length > 1
        ? `${names.slice(0, -1).join(", ")} and ${names[names.length - 1]}`
        : names[0];
    return clip(
      `${title} — a ${names.length}-part course in ${subjectName}, covering ${list}. Free to read, with inline checkpoints and an end-of-chapter test.`,
    );
  }

  return clip(
    `${title} — a lesson in ${subjectName}. Read it at the depth and level you choose, listen to it, and test yourself. Free on Periergia.`,
  );
}

/** Map the reader's level onto a human-readable educationalLevel. */
function educationalLevel(level?: string): string {
  switch (level) {
    case "easy":
      return "Beginner";
    case "expert":
      return "Expert";
    case "advanced":
      return "Advanced";
    default:
      return "Advanced";
  }
}

function breadcrumbList(crumbs: SdCrumb[], pageUrl: string, siteUrl: string) {
  const items = [{ label: "Home", url: siteUrl }, ...crumbs];
  return {
    "@type": "BreadcrumbList",
    itemListElement: items.map((c, i) => ({
      "@type": "ListItem",
      position: i + 1,
      name: c.label,
      item: c.url ?? (i === items.length - 1 ? pageUrl : undefined),
    })),
  };
}

/**
 * Build the JSON-LD graph for a syllabus page. Returns an array of top-level
 * nodes, which is the form crawlers accept in a single ld+json script.
 */
export function buildStructuredData(input: StructuredDataInput): object[] {
  const {
    title,
    description,
    pageUrl,
    siteUrl,
    subjectName,
    crumbs,
    children = [],
    body,
    level,
    reviewed,
    inLanguage = "en",
  } = input;

  const provider = PROVIDER(siteUrl);
  const isSection = children.length > 0;
  const minutes = body ? readingMinutes(body) : 0;
  const duration = isoDuration(minutes);
  const teaches = teachesFromBody(body);

  // Required by Google's Course rich result, and absent from ~78% of nodes in
  // the seed, so it must be resolved rather than passed through.
  const resolvedDescription = resolveDescription(
    description,
    title,
    subjectName,
    children,
    body,
  );

  const graph: object[] = [breadcrumbList(crumbs, pageUrl, siteUrl)];

  // The parent Course a leaf belongs to — the section directly above it.
  const parentCrumb = crumbs.length >= 2 ? crumbs[crumbs.length - 2] : undefined;

  if (isSection) {
    // A node with children is a course: a named, ordered group of lessons.
    const totalMinutes = minutes; // an overview article, when the section has one
    graph.push({
      "@context": "https://schema.org",
      "@type": "Course",
      name: title,
      description: resolvedDescription,
      url: pageUrl,
      provider,
      inLanguage,
      isAccessibleForFree: true,
      educationalLevel: educationalLevel(level),
      about: subjectName,
      ...(teaches.length ? { teaches } : {}),
      hasCourseInstance: {
        "@type": "CourseInstance",
        courseMode: "online",
        ...(isoDuration(totalMinutes) ? { courseWorkload: isoDuration(totalMinutes) } : {}),
      },
      hasPart: children.map((c, i) => ({
        "@type": "LearningResource",
        position: i + 1,
        name: c.title,
        url: c.url,
        description:
          c.description && plain(c.description).length >= 20
            ? clip(plain(c.description))
            : `${c.title} — a lesson in ${title}.`,
        isAccessibleForFree: true,
      })),
    });
    return graph;
  }

  // A leaf topic is a lesson: a learning resource that is also an article.
  graph.push({
    "@context": "https://schema.org",
    "@type": ["LearningResource", "Article"],
    name: title,
    headline: title,
    description: resolvedDescription,
    url: pageUrl,
    mainEntityOfPage: pageUrl,
    inLanguage,
    isAccessibleForFree: true,
    learningResourceType: ["Lesson", "Reading"],
    educationalLevel: educationalLevel(level),
    educationalUse: "self-study",
    about: subjectName,
    ...(teaches.length ? { teaches } : {}),
    ...(duration ? { timeRequired: duration } : {}),
    author: provider,
    publisher: provider,
    provider,
    // Every article carries inline checkpoints and an end-of-chapter quiz, so
    // the assessment claim describes something the page actually contains.
    ...(body
      ? {
          hasPart: {
            "@type": "Quiz",
            name: `${title} — test yourself`,
            educationalUse: "self-assessment",
            isAccessibleForFree: true,
          },
        }
      : {}),
    ...(parentCrumb?.url
      ? {
          isPartOf: {
            "@type": "Course",
            name: parentCrumb.label,
            url: parentCrumb.url,
            provider,
          },
        }
      : {}),
    ...(reviewed ? { creativeWorkStatus: "Reviewed" } : {}),
  });

  return graph;
}

/** Drop undefined values so the emitted JSON-LD carries no empty keys. */
export function serializeJsonLd(graph: object[]): string {
  return JSON.stringify(graph, (_k, v) => (v === undefined ? undefined : v));
}
