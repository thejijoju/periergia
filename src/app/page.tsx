import { Home, type HomeSubject } from "@/components/Home";
import type { SearchItem } from "@/lib/types";
import { getSubjects, getSubjectThemeCount, getSearchIndex } from "@/lib/store";

export default async function Page() {
  const subjectRows = await getSubjects();

  const subjects: HomeSubject[] = await Promise.all(
    subjectRows.map(async (s): Promise<HomeSubject> => {
      const themeCount = await getSubjectThemeCount(s.id);
      return {
        name: s.name,
        slug: s.slug,
        themeCount,
        // Link to the subject index, which redirects to the current first topic
        // at request time — so this static home never carries a stale deep link.
        href: `/learn/${s.slug}`,
      };
    }),
  );

  const searchIndex: SearchItem[] = await getSearchIndex();

  return <Home subjects={subjects} searchIndex={searchIndex} />;
}
