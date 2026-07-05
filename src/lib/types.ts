// ── Periergia domain model ───────────────────────────────────────────────
// The syllabus tree is STABLE (generated once per subject, then stored).
// Per-node content is generated on demand at a chosen depth/level/format and
// cached, keyed by (nodeId, depth, level, format).

import type { Mode } from "./modes";

export type Depth = "skim" | "definition" | "medium" | "detailed" | "research";
export type Level = "easy" | "advanced" | "expert";

export const DEPTHS: { id: Depth; label: string }[] = [
  { id: "skim", label: "Skim" },
  { id: "definition", label: "Definition" },
  { id: "medium", label: "Medium" },
  { id: "detailed", label: "Detailed" },
  { id: "research", label: "Research" },
];

export const LEVELS: { id: Level; label: string }[] = [
  { id: "easy", label: "Easy" },
  { id: "advanced", label: "Advanced" },
  { id: "expert", label: "Expert" },
];

export interface Subject {
  id: string;
  name: string;
  slug: string;
  description: string;
  position: number;
}

export interface Node {
  id: string;
  subjectId: string;
  subjectSlug: string;
  parentId: string | null;
  title: string;
  slug: string;
  summary: string;
  position: number;
  /** slug path from the subject root to this node, e.g. ["revolutions", "french-revolution"] */
  path: string[];
  depth: number; // tree depth (0 = top-level chapter)
}

export interface ContentKey {
  nodeId: string;
  depth: Depth;
  level: Level;
  /** The learning mode (read/listen/podcast/…). Named `format` to match the DB column. */
  format: Mode;
}

export interface Content extends ContentKey {
  /** Markdown body (for text); for voice the same body is read aloud client-side. */
  body: string;
  generated: boolean; // true when produced by Claude, false for placeholder
  /** True once a human has read this exact text and signed off on it. */
  reviewed: boolean;
}

export interface QuizQuestion {
  id: string;
  type: "mcq" | "open";
  prompt: string;
  options?: string[]; // mcq only
  answerIndex?: number; // mcq only
  rubric?: string; // open only — what a correct answer must contain
}

export interface Quiz {
  nodeId: string;
  level: Level;
  questions: QuizQuestion[];
  generated: boolean;
}

export interface GradeResult {
  correct: boolean;
  score: number; // 0..1
  feedback: string;
}

/** A searchable entry (sub-subject or topic) for the client-side topic search. */
export interface SearchItem {
  title: string;
  ctx: string; // "Subject › Sub-subject"
  href: string;
  leaf: boolean; // true for a topic, false for a sub-subject
}
