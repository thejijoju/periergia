import "server-only";
import type { Content, ContentKey, Node, Quiz, SearchItem, Subject } from "./types";
import { SEED_NODES, SEED_SUBJECTS } from "./seed";
import { getSupabase } from "./supabase";

// ── Data store ───────────────────────────────────────────────────────────
// One interface over two backends:
//   • Tree (subjects + nodes): the STABLE syllabus. Read from Supabase when
//     configured (and seeded — see `npm run seed`), otherwise from seed.ts.
//     The tree is small and immutable per deploy, so it's loaded once and
//     memoized in-process.
//   • Cache (content + quizzes): generate-once, keyed by depth/level/format.
//     Persisted to Supabase when configured; otherwise an in-process Map.
//
// The whole app touches the store only through the functions below, so the
// backend choice is local to this file.

// ---- Tree (stable, memoized) ---------------------------------------------

interface Tree {
  subjects: Subject[];
  nodes: Node[];
  source: "supabase" | "seed";
}

let treePromise: Promise<Tree> | null = null;

// DB rows are snake_case; the node id encodes its path (`subject/seg/seg`), so
// `subjectSlug` and `path` are reconstructed rather than stored.
function rowToNode(r: {
  id: string;
  subject_id: string;
  parent_id: string | null;
  title: string;
  slug: string;
  summary: string | null;
  position: number;
  depth: number;
}): Node {
  return {
    id: r.id,
    subjectId: r.subject_id,
    subjectSlug: r.subject_id,
    parentId: r.parent_id,
    title: r.title,
    slug: r.slug,
    summary: r.summary ?? "",
    position: r.position,
    path: r.id.split("/").slice(1),
    depth: r.depth,
  };
}

async function loadTree(): Promise<Tree> {
  if (treePromise) return treePromise;
  treePromise = (async () => {
    const supabase = getSupabase();
    if (supabase) {
      const { data: subs } = await supabase.from("subjects").select("*").order("position");
      // Supabase caps every query at 1000 rows and the taxonomy is past that —
      // a single select silently drops the highest-position rows (later topics
      // in every big theme). Page through explicitly, ordered by id for a
      // stable cursor; consumers re-sort by depth/position themselves.
      const nds: Parameters<typeof rowToNode>[0][] = [];
      const page = 1000;
      for (let from = 0; ; from += page) {
        const { data } = await supabase
          .from("nodes")
          .select("*")
          .order("id")
          .range(from, from + page - 1);
        if (!data || data.length === 0) break;
        nds.push(...(data as Parameters<typeof rowToNode>[0][]));
        if (data.length < page) break;
      }
      if (subs && subs.length && nds.length) {
        return {
          subjects: subs as Subject[],
          nodes: nds.map(rowToNode),
          source: "supabase" as const,
        };
      }
      // Supabase configured but not yet seeded → fall back to seed so the app
      // still works. Run `npm run seed` to populate Postgres.
    }
    return { subjects: SEED_SUBJECTS, nodes: SEED_NODES, source: "seed" as const };
  })();
  return treePromise;
}

/** Test/ops hook: drop the memoized tree so the next read reloads from source. */
export function invalidateTree(): void {
  treePromise = null;
}

export async function treeSource(): Promise<Tree["source"]> {
  return (await loadTree()).source;
}

export async function getSubjects(): Promise<Subject[]> {
  const { subjects } = await loadTree();
  return [...subjects].sort((a, b) => a.position - b.position);
}

export async function getSubject(slug: string): Promise<Subject | undefined> {
  const { subjects } = await loadTree();
  return subjects.find((s) => s.slug === slug);
}

export async function getSubjectThemeCount(subjectId: string): Promise<number> {
  const { nodes } = await loadTree();
  return nodes.filter((n) => n.subjectId === subjectId).length;
}

export async function getNodes(subjectId: string): Promise<Node[]> {
  const { nodes } = await loadTree();
  return nodes
    .filter((n) => n.subjectId === subjectId)
    .sort((a, b) => a.depth - b.depth || a.position - b.position);
}

export async function getChildren(subjectId: string, parentId: string | null): Promise<Node[]> {
  const { nodes } = await loadTree();
  return nodes
    .filter((n) => n.subjectId === subjectId && n.parentId === parentId)
    .sort((a, b) => a.position - b.position);
}

export async function getNodeByPath(subjectSlug: string, path: string[]): Promise<Node | undefined> {
  const id = `${subjectSlug}/${path.join("/")}`;
  const { nodes } = await loadTree();
  return nodes.find((n) => n.id === id);
}

export async function getNodeById(id: string): Promise<Node | undefined> {
  const { nodes } = await loadTree();
  return nodes.find((n) => n.id === id);
}

/** Ancestor chain (root → ... → node), inclusive — used for breadcrumbs & the right rail. */
export async function getAncestors(node: Node): Promise<Node[]> {
  const { nodes } = await loadTree();
  const byId = new Map(nodes.map((n) => [n.id, n]));
  const chain: Node[] = [];
  let current: Node | undefined = node;
  while (current) {
    chain.unshift(current);
    current = current.parentId ? byId.get(current.parentId) : undefined;
  }
  return chain;
}

/** First leaf (or first node) of a subject — where a bare /learn/[subject] redirects to. */
export async function getFirstLeaf(subjectId: string): Promise<Node | undefined> {
  const nodes = await getNodes(subjectId);
  const childless = (id: string) => !nodes.some((n) => n.parentId === id);
  return nodes.find((n) => childless(n.id)) ?? nodes[0];
}

/** Flat client-side search index over every sub-subject + topic. */
export async function getSearchIndex(): Promise<SearchItem[]> {
  const { subjects, nodes } = await loadTree();
  const subjById = new Map(subjects.map((s) => [s.id, s]));
  const titleById = new Map(nodes.map((n) => [n.id, n.title]));
  const out: SearchItem[] = [];
  for (const n of nodes) {
    const subj = subjById.get(n.subjectId);
    if (!subj) continue;
    const parentTitle = n.parentId ? titleById.get(n.parentId) : undefined;
    out.push({
      title: n.title,
      ctx: parentTitle ? `${subj.name} › ${parentTitle}` : subj.name,
      href: `/learn/${subj.slug}/${n.path.join("/")}`,
      leaf: n.depth >= 1,
    });
  }
  return out;
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
