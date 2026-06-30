import "server-only";
import type { Content, ContentKey, Node, Quiz, Subject } from "./types";
import { SEED_NODES, SEED_SUBJECTS, themeCount } from "./seed";
import { getSupabase } from "./supabase";

// ── Data store ───────────────────────────────────────────────────────────
// One interface over two backends:
//   • Tree (subjects + nodes): the STABLE syllabus. Served from seed.ts.
//     When Supabase holds it, swap the read functions to query `subjects`/`nodes`.
//   • Cache (content + quizzes): generate-once, keyed by depth/level/format.
//     Persisted to Supabase when configured; otherwise an in-process Map.
//
// The whole app touches the store only through the functions below, so moving
// to Postgres is local to this file.

// ---- Tree (stable) -------------------------------------------------------

export function getSubjects(): Subject[] {
  return [...SEED_SUBJECTS].sort((a, b) => a.position - b.position);
}

export function getSubject(slug: string): Subject | undefined {
  return SEED_SUBJECTS.find((s) => s.slug === slug);
}

export function getSubjectThemeCount(subjectId: string): number {
  return themeCount(subjectId);
}

export function getNodes(subjectId: string): Node[] {
  return SEED_NODES.filter((n) => n.subjectId === subjectId).sort(
    (a, b) => a.depth - b.depth || a.position - b.position,
  );
}

export function getChildren(subjectId: string, parentId: string | null): Node[] {
  return SEED_NODES.filter(
    (n) => n.subjectId === subjectId && n.parentId === parentId,
  ).sort((a, b) => a.position - b.position);
}

export function getNodeByPath(subjectSlug: string, path: string[]): Node | undefined {
  const id = `${subjectSlug}/${path.join("/")}`;
  return SEED_NODES.find((n) => n.id === id);
}

export function getNodeById(id: string): Node | undefined {
  return SEED_NODES.find((n) => n.id === id);
}

/** Ancestor chain (root → ... → node), inclusive — used for breadcrumbs & the right rail. */
export function getAncestors(node: Node): Node[] {
  const chain: Node[] = [];
  let current: Node | undefined = node;
  while (current) {
    chain.unshift(current);
    current = current.parentId ? getNodeById(current.parentId) : undefined;
  }
  return chain;
}

/** First leaf (or first node) of a subject — where a bare /learn/[subject] redirects to. */
export function getFirstLeaf(subjectId: string): Node | undefined {
  const nodes = getNodes(subjectId);
  return nodes.find((n) => getChildren(subjectId, n.id).length === 0) ?? nodes[0];
}

// ---- Cache (generate-once) ----------------------------------------------

const memContent = new Map<string, Content>();
const memQuiz = new Map<string, Quiz>();

const contentKey = (k: ContentKey) => `${k.nodeId}::${k.depth}::${k.level}::${k.format}`;
const quizKey = (nodeId: string, level: string) => `${nodeId}::${level}`;

export async function getCachedContent(k: ContentKey): Promise<Content | null> {
  const supabase = getSupabase();
  if (supabase) {
    const { data } = await supabase
      .from("content")
      .select("node_id, depth, level, format, body, generated")
      .eq("node_id", k.nodeId)
      .eq("depth", k.depth)
      .eq("level", k.level)
      .eq("format", k.format)
      .maybeSingle();
    if (data) {
      return {
        nodeId: data.node_id,
        depth: data.depth,
        level: data.level,
        format: data.format,
        body: data.body,
        generated: data.generated,
      };
    }
    return null;
  }
  return memContent.get(contentKey(k)) ?? null;
}

export async function putCachedContent(c: Content): Promise<void> {
  const supabase = getSupabase();
  if (supabase) {
    await supabase.from("content").upsert(
      {
        node_id: c.nodeId,
        depth: c.depth,
        level: c.level,
        format: c.format,
        body: c.body,
        generated: c.generated,
      },
      { onConflict: "node_id,depth,level,format" },
    );
    return;
  }
  memContent.set(contentKey(c), c);
}

export async function getCachedQuiz(nodeId: string, level: string): Promise<Quiz | null> {
  const supabase = getSupabase();
  if (supabase) {
    const { data } = await supabase
      .from("quizzes")
      .select("node_id, level, questions, generated")
      .eq("node_id", nodeId)
      .eq("level", level)
      .maybeSingle();
    if (data) {
      return {
        nodeId: data.node_id,
        level: data.level,
        questions: data.questions,
        generated: data.generated,
      };
    }
    return null;
  }
  return memQuiz.get(quizKey(nodeId, level)) ?? null;
}

export async function putCachedQuiz(q: Quiz): Promise<void> {
  const supabase = getSupabase();
  if (supabase) {
    await supabase.from("quizzes").upsert(
      { node_id: q.nodeId, level: q.level, questions: q.questions, generated: q.generated },
      { onConflict: "node_id,level" },
    );
    return;
  }
  memQuiz.set(quizKey(q.nodeId, q.level), q);
}
