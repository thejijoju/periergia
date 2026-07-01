import { notFound } from "next/navigation";
import { Reader, type ReaderNode } from "@/components/Reader";
import { SubjectTree, type TreeGroup } from "@/components/SubjectTree";
import { TopicSearch } from "@/components/TopicSearch";
import { Wordmark } from "@/components/Wordmark";
import {
  getSubject,
  getNodeByPath,
  getNodes,
  getAncestors,
  getFirstLeaf,
  getSearchIndex,
} from "@/lib/store";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ subject: string; node: string[] }>;
}) {
  const { subject, node } = await params;
  const n = await getNodeByPath(subject, node);
  return { title: n ? `${n.title} · Periergia` : "Periergia" };
}

export default async function ReaderPage({
  params,
}: {
  params: Promise<{ subject: string; node: string[] }>;
}) {
  const { subject, node: nodePath } = await params;
  const subj = await getSubject(subject);
  if (!subj) notFound();
  const node = await getNodeByPath(subject, nodePath);
  if (!node) notFound();

  const subjectNodes = await getNodes(subj.id);
  const firstLeaf = await getFirstLeaf(subj.id);
  const subjectHref = firstLeaf
    ? `/learn/${subj.slug}/${firstLeaf.path.join("/")}`
    : `/learn/${subj.slug}`;

  // Group the subject into sub-subjects → topics for the left tree.
  const groups: TreeGroup[] = subjectNodes
    .filter((n) => n.depth === 0)
    .map((sub) => ({
      id: sub.id,
      title: sub.title,
      href: `/learn/${subj.slug}/${sub.path.join("/")}`,
      topics: subjectNodes
        .filter((n) => n.parentId === sub.id)
        .map((t) => ({ id: t.id, title: t.title, href: `/learn/${subj.slug}/${t.path.join("/")}` })),
    }));

  const ancestors = await getAncestors(node);
  const trail = [subj.name, ...ancestors.map((n) => n.title)];
  const readerNode: ReaderNode = {
    id: node.id,
    title: node.title,
    summary: node.summary,
    trail,
  };

  const searchIndex = await getSearchIndex();

  return (
    <div className="min-h-screen bg-white">
      {/* Sticky header — wordmark + jump-to-any-topic search */}
      <header className="sticky top-0 z-20 bg-white/95 backdrop-blur border-b border-line">
        <div className="mx-auto max-w-[1280px] px-5 sm:px-8 py-3 flex items-center gap-4">
          <div className="shrink-0">
            <Wordmark size="sm" />
          </div>
          <div className="ml-auto w-full max-w-[380px] min-w-0">
            <TopicSearch searchIndex={searchIndex} />
          </div>
        </div>
      </header>

      <div className="mx-auto max-w-[1280px] lg:grid lg:grid-cols-[230px_minmax(0,1fr)_210px] lg:gap-10 px-5 sm:px-8 py-8 lg:py-12">
        {/* Left rail — nested syllabus tree with purple current highlight */}
        <aside className="hidden lg:block">
          <div className="sticky top-24 max-h-[calc(100vh-7rem)] overflow-y-auto pr-2">
            <SubjectTree
              subjectName={subj.name}
              subjectHref={subjectHref}
              groups={groups}
              activeId={node.id}
            />
          </div>
        </aside>

        {/* Center */}
        <div className="min-w-0">
          <Reader node={readerNode} />
        </div>

        {/* Right rail — "you are here" */}
        <aside className="hidden lg:block">
          <div className="sticky top-24">
            <PositionCard trail={trail} />
          </div>
        </aside>
      </div>
    </div>
  );
}

function PositionCard({ trail }: { trail: string[] }) {
  return (
    <nav className="text-[13px]">
      <div className="font-mono font-semibold text-[10px] tracking-[0.12em] uppercase text-whisper">
        Where you are
      </div>
      <ol className="mt-3 space-y-1.5">
        {trail.map((t, i) => {
          const last = i === trail.length - 1;
          return (
            <li key={i} style={{ paddingLeft: `${i * 10}px` }}>
              {last ? (
                <span className="font-sans font-medium text-purple">
                  {t}
                  <span className="block font-mono text-[9px] tracking-[0.1em] uppercase text-purple/60">
                    You are here
                  </span>
                </span>
              ) : (
                <span className="font-sans text-muted">{t}</span>
              )}
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
