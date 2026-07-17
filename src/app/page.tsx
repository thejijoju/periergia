import { cookies } from "next/headers";
import { Home, type HomeSubject } from "@/components/Home";
import type { SearchItem } from "@/lib/types";
import { getSubjects, getSubjectThemeCount, getSearchIndex } from "@/lib/store";
import { normalizeLang, LANG_COOKIE, subjectName } from "@/lib/i18n";

export default async function Page() {
  const lang = normalizeLang((await cookies()).get(LANG_COOKIE)?.value);
  const subjectRows = await getSubjects();

  const subjects: HomeSubject[] = await Promise.all(
    subjectRows.map(async (s): Promise<HomeSubject> => {
      const themeCount = await getSubjectThemeCount(s.id);
      return {
        name: subjectName(lang, s.slug, s.name),
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
