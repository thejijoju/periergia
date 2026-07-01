import { Home, type HomeSubject } from "@/components/Home";
import { getSubjects, getSubjectThemeCount, getFirstLeaf } from "@/lib/store";

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

  return <Home subjects={subjects} />;
}
