import { notFound } from "next/navigation";
import { after } from "next/server";
import { headers, cookies } from "next/headers";
import { normalizeLang, LANG_COOKIE, subjectName } from "@/lib/i18n";
import { logPageRequest } from "@/lib/demand";
import { EXCLUDE_KEY } from "@/lib/analyticsOptOut";
import { Reader, type ReaderNode, type Crumb } from "@/components/Reader";
import { SectionLanding } from "@/components/SectionLanding";
import { SubjectTree, type TreeItem } from "@/components/SubjectTree";
import { HeaderSearch } from "@/components/HeaderSearch";
import { OnThisPage } from "@/components/OnThisPage";
import { Wordmark } from "@/components/Wordmark";
import { ThemeToggle } from "@/components/ThemeToggle";
import { LanguageSwitcher } from "@/components/LanguageSwitcher";
import { MobileNav } from "@/components/MobileNav";
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

// Summaries double as generation specs — they can carry {{image}} markers and
// ALL-CAPS instruction sentinels. Strip that machinery so a clean human
// sentence reaches search snippets and section-landing cards.
function cleanNodeSummary(summary: string | null | undefined): string {
  return (summary || "")
    .replace(/\{\{[^}]*\}\}/g, "")
    .split(
      /\s(?:GIVE|Place an image|Include an image|Quote from|Then read|Note the chronology|do NOT|Continues in)\b/,
    )[0]
    .trim();
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ subject: string; node: string[] }>;
}) {
  const { subject, node } = await params;
  const n = await getNodeByPath(subject, node);
  if (!n) return { title: "Periergia" };
  // Summaries double as generation specs (they can contain image markers and
  // ALL-CAPS instructions like "GIVE …"/"do NOT …"). Strip that machinery so a
  // clean human sentence reaches the search snippet — cut at the first
  // instruction sentinel, drop {{image}} markers, and trim to a sentence.
  const description = (
    cleanNodeSummary(n.summary) ||
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

  // Reading language (cookie set by the switcher). Subject names translate to it
  // wherever they appear; deeper topic titles stay English for now.
  const lang = normalizeLang((await cookies()).get(LANG_COOKIE)?.value);
  const subjName = subjectName(lang, subj.slug, subj.name);

  const subjectNodes = await getNodes(subj.id);
  const firstLeaf = await getFirstLeaf(subj.id);
  const subjectHref = firstLeaf
    ? `/learn/${subj.slug}/${firstLeaf.path.join("/")}`
    : `/learn/${subj.slug}`;

  // All subjects for the sidebar switcher dropdown. The bare /learn/[slug]
  // route redirects to each subject's current first topic at request time.
  const allSubjects = await getSubjects();
  const subjectLinks = allSubjects.map((s) => ({
    name: subjectName(lang, s.slug, s.name),
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

  // A node with children is a *section* (e.g. an "Introduction" chapter), not a
  // topic — show a landing that lists its topics rather than generating an
  // article that would try to "define" the section's title.
  const sectionChildren = subjectNodes
    .filter((n) => n.parentId === node.id)
    .sort((a, b) => a.position - b.position);
  const isSection = sectionChildren.length > 0;

  // Breadcrumb: subject → ancestors → current (current has no href).
  const ancestors = await getAncestors(node); // includes self as last element
  const crumbs: Crumb[] = [
    { label: subjName, href: subjectHref },
    ...ancestors.map((n, i) => {
      const isSelf = i === ancestors.length - 1;
      return {
        label: n.title,
        href: `/learn/${subj.slug}/${n.path.join("/")}`,
        current: isSelf,
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

  // Reader's country (Vercel geo header) picks the local Amazon marketplace and
  // matching Associates tag for the Further Reading affiliate links.
  const hdrs = await headers();
  const country = hdrs.get("x-vercel-ip-country") || undefined;

  // Server-render an already-cached read article into the HTML, so crawlers and
  // default-prefs readers get real text. Prefer the richest cached depth (a
  // full Research chapter indexes far better than a skim) and fall back down.
  const DEPTH_PREFERENCE = ["research", "detailed", "medium", "definition", "skim"] as const;
  let initialBody: string | undefined;
  let initialDepth: (typeof DEPTH_PREFERENCE)[number] | undefined;
  let initialLevel: "advanced" | "easy" | "expert" | undefined;
  let initialReviewed = false;
  if (isSection) {
    // A section (chapter) normally shows a landing that lists its topics. But if
    // it carries a curated OVERVIEW master (research/advanced/read), render that
    // article instead, with the chapter's topics linked beneath it.
    const cached = await getCachedContent({
      nodeId: node.id,
      depth: "research",
      level: "advanced",
      format: "read",
      lang,
    });
    if (cached?.generated) {
      initialBody = cached.body;
      initialDepth = "research";
      initialLevel = "advanced";
      initialReviewed = cached.reviewed;
    }
  } else {
    for (const depth of DEPTH_PREFERENCE) {
      for (const level of ["advanced", "easy", "expert"] as const) {
        const cached = await getCachedContent({ nodeId: node.id, depth, level, format: "read", lang });
        if (cached?.generated) {
          initialBody = cached.body;
          initialDepth = depth;
          initialLevel = level;
          initialReviewed = cached.reviewed;
          break;
        }
      }
      if (initialBody) break;
    }
  }
  // A section with no overview article falls back to the plain topic-list landing.
  const showLanding = isSection && !initialBody;

  // Demand log for the warming worklist: record this article request server-side
  // AFTER the response (next/server `after`), so it adds no latency. Skip Next's
  // speculative link prefetches and the owner's own visits (?mine sets the
  // exclude cookie), and mark the request "cold" when nothing was cached — those
  // are the exact pages worth pre-generating for the next visitor and for SEO.
  const isPrefetch = hdrs.get("next-router-prefetch") === "1";
  const optedOut = (await cookies()).get(EXCLUDE_KEY)?.value === "1";
  if (!isPrefetch && !optedOut) {
    const cold = !initialBody && !showLanding;
    const reqPath = `/learn/${subj.slug}/${node.path.join("/")}`;
    after(() =>
      logPageRequest({
        name: "article_request",
        nodeId: node.id,
        title: node.title.replace(/\s*\*+$/, ""),
        path: reqPath,
        cold,
        headers: hdrs,
      }),
    );
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
    <div className="min-h-screen bg-page">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      {/* Sticky header — mobile menu (phones) + wordmark + search + theme */}
      <header className="sticky top-0 z-20 bg-page backdrop-blur border-b border-line">
        <div className="pl-4 pr-4 sm:pr-6 lg:pl-[2cm] lg:pr-8 py-3 flex items-center gap-2 sm:gap-4">
          <MobileNav
            subjectName={subjName}
            lang={lang}
            subjectSlug={subj.slug}
            subjectHref={subjectHref}
            subjects={subjectLinks}
            items={items}
            activeId={node.id}
          />
          <div className="shrink-0">
            <Wordmark size="sm" underline={false} />
          </div>
          <div className="ml-auto flex items-center gap-1 justify-end min-w-0">
            <HeaderSearch searchIndex={searchIndex} lang={lang} />
            <LanguageSwitcher />
            <ThemeToggle />
          </div>
        </div>
      </header>

      <div className="lg:grid lg:grid-cols-[248px_minmax(0,1fr)_240px] lg:gap-10 px-4 pr-4 sm:pr-6 lg:pl-[2cm] lg:pr-8 py-8 lg:py-12">
        {/* Left rail — full subject curriculum, hugging the left edge */}
        <aside className="hidden lg:block">
          <div className="sticky top-24 max-h-[calc(100vh-7rem)] overflow-y-auto pr-2">
            <SubjectTree
              subjectName={subjName}
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
          {showLanding ? (
            <SectionLanding
              title={node.title}
              subjectName={subjName}
              lang={lang}
              items={sectionChildren.map((c) => ({
                title: c.title,
                href: `/learn/${subj.slug}/${c.path.join("/")}`,
                summary: cleanNodeSummary(c.summary),
              }))}
            />
          ) : (
            <>
              <Reader
                node={readerNode}
                initialBody={initialBody}
                initialDepth={initialDepth}
                initialLevel={initialLevel}
                initialReviewed={initialReviewed}
                country={country}
                lang={lang}
              />
              {isSection && (
                <SectionLanding
                  variant="compact"
                  title={node.title}
                  subjectName={subjName}
                  lang={lang}
                  items={sectionChildren.map((c) => ({
                    title: c.title,
                    href: `/learn/${subj.slug}/${c.path.join("/")}`,
                    summary: cleanNodeSummary(c.summary),
                  }))}
                />
              )}
            </>
          )}
        </div>

        {/* Right rail — "on this page" scroll-spy outline */}
        <aside className="hidden lg:block">
          <div className="sticky top-24">
            <OnThisPage lang={lang} />
          </div>
        </aside>
      </div>
    </div>
  );
}
