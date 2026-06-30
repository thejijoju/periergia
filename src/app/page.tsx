import { Home, type HomeSubject } from "@/components/Home";
import { getSubjects, getSubjectThemeCount, getFirstLeaf } from "@/lib/store";

export default function Page() {
  const subjects: HomeSubject[] = getSubjects().map((s) => {
    const leaf = getFirstLeaf(s.id);
    return {
      name: s.name,
      slug: s.slug,
      themeCount: getSubjectThemeCount(s.id),
      href: leaf ? `/learn/${s.slug}/${leaf.path.join("/")}` : `/learn/${s.slug}`,
    };
  });

  return <Home subjects={subjects} />;
}
