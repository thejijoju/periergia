import type { MetadataRoute } from "next";
import { getSubjects, getNodes } from "@/lib/store";
import { SITE_URL } from "@/lib/site";

// Every subject and every topic page — regenerated per request, so new topics
// enter the sitemap as soon as the taxonomy migration lands.
export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const subjects = await getSubjects();
  const out: MetadataRoute.Sitemap = [
    { url: SITE_URL, changeFrequency: "weekly", priority: 1 },
  ];
  for (const s of subjects) {
    out.push({
      url: `${SITE_URL}/learn/${s.slug}`,
      changeFrequency: "weekly",
      priority: 0.8,
    });
    const nodes = await getNodes(s.id);
    for (const n of nodes) {
      out.push({
        url: `${SITE_URL}/learn/${s.slug}/${n.path.join("/")}`,
        changeFrequency: "monthly",
        priority: n.depth === 0 ? 0.7 : 0.6,
      });
    }
  }
  return out;
}
