import { after } from "next/server";
import { cookies, headers } from "next/headers";
import { Home, type HomeSubject } from "@/components/Home";
import type { SearchItem } from "@/lib/types";
import { getSubjects, getSubjectThemeCount, getSearchIndex } from "@/lib/store";
import { normalizeLang, LANG_COOKIE, subjectName } from "@/lib/i18n";
import { logPageRequest } from "@/lib/demand";
import { EXCLUDE_KEY } from "@/lib/analyticsOptOut";

export default async function Page() {
  const cookieStore = await cookies();
  const lang = normalizeLang(cookieStore.get(LANG_COOKIE)?.value);

  // Traffic log: record the homepage visit server-side (after the response, so
  // no latency), skipping Next's prefetches and the owner's own ?mine visits —
  // so the dashboard reflects ALL world traffic, not only article requests.
  const hdrs = await headers();
  if (hdrs.get("next-router-prefetch") !== "1" && cookieStore.get(EXCLUDE_KEY)?.value !== "1") {
    after(() => logPageRequest({ name: "page_view", path: "/", title: "Home", headers: hdrs }));
  }

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

  return <Home subjects={subjects} searchIndex={searchIndex} lang={lang} />;
}
