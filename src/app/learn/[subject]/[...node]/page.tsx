import { notFound } from "next/navigation";
import { Reader, type ReaderNode, type Crumb } from "@/components/Reader";
import { SubjectTree, type TreeItem } from "@/components/SubjectTree";
import { HeaderSearch } from "@/components/HeaderSearch";
import { OnThisPage } from "@/components/OnThisPage";
import { Wordmark } from "@/components/Wordmark";
import {
  getSubject,
  getSubjects,
  getNodeByPath,
  getNodes,
  getAncestors,
  getFirstLeaf,
  getSearchIndex,
  getCachedContent,
} from "@/lib/store";
import { SITE_URL } from "@/lib/site";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ subject: string; node: string[] }>;
}) {
  const { subject, node } = await params;
  const n = await getNodeByPath(subject, node);
  if (!n) return { title: "Periergia" };
  const description = (
    n.summary ||
    `${n.title} — read it, listen to it, and test yourself, tuned to your depth and level. Free on Periergia, a living textbook for everything.`
  ).slice(0, 300);
  const url = `${SITE_URL}/learn/${subject}/${n.path.join("/")}`;
  return {
    title: `${n.title} · Periergia`,
    description,
    alternates: { canonical: url },
    openGraph: { title: n.title, description, url, type: "article", siteName: "Periergia" },
  };
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

  // All subjects for the sidebar switcher dropdown. The bare /learn/[slug]
  // route redirects to each subject's current first topic at request time.
  const allSubjects = await getSubjects();
  const subjectLinks = allSubjects.map((s) => ({
    name: s.name,
    slug: s.slug,
    href: `/learn/${s.slug}`,
  }));

  // Build the subject into a nested tree (sub-subject → topic → sub-topic → …).
  const childrenOf = (parentId: string | null): TreeItem[] =>
    subjectNodes
      .filter((n) => n.parentId === parentId)
      .sort((a, b) => a.position - b.position)
      .map((n) => ({
        id: n.id,
        title: n.title,
        href: `/learn/${subj.slug}/${n.path.join("/")}`,
        children: childrenOf(n.id),
      }));
  const items = childrenOf(null);

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

  // Server-render an already-cached read article into the HTML, so crawlers and
  // default-prefs readers get real text. Prefer the richest cached depth (a
  // full Research chapter indexes far better than a skim) and fall back down.
  const DEPTH_PREFERENCE = ["research", "detailed", "medium", "definition", "skim"] as const;
  let initialBody: string | undefined;
  for (const depth of DEPTH_PREFERENCE) {
    for (const level of ["advanced", "easy", "expert"] as const) {
      const cached = await getCachedContent({ nodeId: node.id, depth, level, format: "read" });
      if (cached?.generated) {
        initialBody = cached.body;
        break;
      }
    }
    if (initialBody) break;
  }

  const pageUrl = `${SITE_URL}/learn/${subj.slug}/${node.path.join("/")}`;
  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "Article",
    headline: node.title,
    description: node.summary || undefined,
    author: { "@type": "Organization", name: "Periergia" },
    publisher: { "@type": "Organization", name: "Periergia", url: SITE_URL },
    mainEntityOfPage: pageUrl,
    isAccessibleForFree: true,
  };

  return (
    <div className="min-h-screen bg-white">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
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
              subjectSlug={subj.slug}
              subjectHref={subjectHref}
              subjects={subjectLinks}
              items={items}
              activeId={node.id}
            />
          </div>
        </aside>

        {/* Center */}
        <div className="min-w-0">
          <Reader node={readerNode} initialBody={initialBody} />
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
