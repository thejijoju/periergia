import { notFound } from "next/navigation";
import { Reader, type ReaderNode, type Crumb } from "@/components/Reader";
import { SubjectTree, type TreeGroup } from "@/components/SubjectTree";
import { HeaderSearch } from "@/components/HeaderSearch";
import { OnThisPage } from "@/components/OnThisPage";
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

  // Breadcrumb: subject → ancestors → current (current has no href).
  const ancestors = await getAncestors(node); // includes self as last element
  const crumbs: Crumb[] = [
    { label: subj.name, href: subjectHref },
    ...ancestors.map((n, i) => {
      const isSelf = i === ancestors.length - 1;
      return {
        label: n.title,
        href: isSelf ? undefined : `/learn/${subj.slug}/${n.path.join("/")}`,
      };
    }),
  ];

  const readerNode: ReaderNode = {
    id: node.id,
    title: node.title,
    summary: node.summary,
    crumbs,
  };

  const searchIndex = await getSearchIndex();

  return (
    <div className="min-h-screen bg-white">
      {/* Sticky header — wordmark + expandable search icon */}
      <header className="sticky top-0 z-20 bg-white/95 backdrop-blur border-b border-line">
        <div className="mx-auto max-w-[1280px] px-5 sm:px-8 py-3 flex items-center gap-4">
          <div className="shrink-0">
            <Wordmark size="sm" />
          </div>
          <div className="ml-auto flex justify-end min-w-0">
            <HeaderSearch searchIndex={searchIndex} />
          </div>
        </div>
      </header>

      <div className="mx-auto max-w-[1280px] lg:grid lg:grid-cols-[240px_minmax(0,1fr)_210px] lg:gap-10 px-5 sm:px-8 py-8 lg:py-12">
        {/* Left rail — full subject curriculum with purple current highlight */}
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

        {/* Right rail — "on this page" scroll-spy outline */}
        <aside className="hidden lg:block">
          <div className="sticky top-24">
            <OnThisPage />
          </div>
        </aside>
      </div>
    </div>
  );
}
