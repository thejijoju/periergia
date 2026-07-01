import { notFound } from "next/navigation";
import { Reader, type ReaderNode } from "@/components/Reader";
import { SubjectsRail, type RailSubject } from "@/components/SubjectsRail";
import { SyllabusTree, type TreeItem } from "@/components/SyllabusTree";
import {
  getSubjects,
  getSubject,
  getNodeByPath,
  getNodes,
  getAncestors,
  getFirstLeaf,
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

  // Left rail — all subjects
  const allSubjects = await getSubjects();
  const railSubjects: RailSubject[] = await Promise.all(
    allSubjects.map(async (s): Promise<RailSubject> => {
      const leaf = await getFirstLeaf(s.id);
      return {
        name: s.name,
        slug: s.slug,
        href: leaf ? `/learn/${s.slug}/${leaf.path.join("/")}` : `/learn/${s.slug}`,
      };
    }),
  );

  // Right rail — this subject's syllabus tree
  const subjectNodes = await getNodes(subj.id);
  const treeItems: TreeItem[] = subjectNodes.map((n) => ({
    id: n.id,
    title: n.title,
    href: `/learn/${subj.slug}/${n.path.join("/")}`,
    depth: n.depth,
    isLeaf: !subjectNodes.some((c) => c.parentId === n.id),
  }));

  const ancestors = await getAncestors(node);
  const readerNode: ReaderNode = {
    id: node.id,
    title: node.title,
    summary: node.summary,
    trail: [subj.name, ...ancestors.map((n) => n.title)],
  };

  return (
    <div className="min-h-screen bg-white">
      {/* Mobile top bar */}
      <header className="lg:hidden sticky top-0 z-10 bg-white/95 backdrop-blur border-b border-line px-5 py-3">
        <SubjectsRailMobile subjects={railSubjects} activeSlug={subj.slug} subjectName={subj.name} />
      </header>

      <div className="mx-auto max-w-[1280px] lg:grid lg:grid-cols-[200px_minmax(0,1fr)_220px] lg:gap-10 px-5 sm:px-8 py-8 lg:py-12">
        {/* Left rail */}
        <aside className="hidden lg:block">
          <div className="sticky top-12">
            <SubjectsRail subjects={railSubjects} activeSlug={subj.slug} />
          </div>
        </aside>

        {/* Center */}
        <div className="min-w-0">
          <Reader node={readerNode} />
        </div>

        {/* Right rail */}
        <aside className="hidden lg:block">
          <div className="sticky top-12">
            <SyllabusTree subjectName={subj.name} items={treeItems} activeId={node.id} />
          </div>
        </aside>
      </div>
    </div>
  );
}

// Compact mobile header: wordmark + the active subject name.
function SubjectsRailMobile({
  subjects,
  activeSlug,
  subjectName,
}: {
  subjects: RailSubject[];
  activeSlug: string;
  subjectName: string;
}) {
  void subjects;
  void activeSlug;
  return (
    <div className="flex items-center justify-between">
      <a
        href="/"
        className="font-serif font-bold text-[18px] tracking-[-0.01em] border-b-2 border-maroon pb-0.5 text-ink"
      >
        Periergia
      </a>
      <span className="font-mono text-[10px] tracking-[0.12em] uppercase text-whisper">
        {subjectName}
      </span>
    </div>
  );
}
