import { Home, type HomeSubject, type SearchItem } from "@/components/Home";
import { getSubjects, getSubjectThemeCount, getFirstLeaf, getNodes } from "@/lib/store";

export default async function Page() {
  const subjectRows = await getSubjects();

  const subjects: HomeSubject[] = await Promise.all(
    subjectRows.map(async (s): Promise<HomeSubject> => {
      const [themeCount, leaf] = await Promise.all([
        getSubjectThemeCount(s.id),
        getFirstLeaf(s.id),
      ]);
      return {
        name: s.name,
        slug: s.slug,
        themeCount,
        href: leaf ? `/learn/${s.slug}/${leaf.path.join("/")}` : `/learn/${s.slug}`,
      };
    }),
  );

  // Full search index over every sub-subject + topic, so a keyword lands the
  // reader directly on the matching topic.
  const searchIndex: SearchItem[] = [];
  for (const s of subjectRows) {
    const nodes = await getNodes(s.id);
    const titleById = new Map(nodes.map((n) => [n.id, n.title]));
    for (const n of nodes) {
      const parentTitle = n.parentId ? titleById.get(n.parentId) : undefined;
      searchIndex.push({
        title: n.title,
        ctx: parentTitle ? `${s.name} › ${parentTitle}` : s.name,
        href: `/learn/${s.slug}/${n.path.join("/")}`,
        leaf: n.depth >= 1,
      });
    }
  }

  return <Home subjects={subjects} searchIndex={searchIndex} />;
}
