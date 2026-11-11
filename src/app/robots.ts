import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/site";

// AI-training crawlers and aggressive SEO/scraper bots that take content and
// bandwidth while sending zero readers back. The compliant ones honour a
// robots.txt disallow; the rest are hard-blocked in middleware.ts. Search
// engines (Googlebot, Bingbot, DuckDuckBot, Applebot, …) are deliberately NOT
// listed — they're how real readers find the site, so they stay welcome. The
// same goes for the AI search/assistant fetchers (OAI-SearchBot, ChatGPT-User,
// PerplexityBot, Claude-SearchBot, Claude-User): they cite and link the page in
// answers, so they send readers too. Only AI *training* crawlers are listed.
const BLOCKED_BOTS = [
  // AI / LLM training crawlers
  "GPTBot",
  "ClaudeBot",
  "Claude-Web",
  "anthropic-ai",
  "CCBot",
  "Google-Extended",
  "Applebot-Extended",
  "Bytespider",
  "Amazonbot",
  "Omgilibot",
  "Omgili",
  "Diffbot",
  "ImagesiftBot",
  "cohere-ai",
  "YouBot",
  "Meta-ExternalAgent",
  "Meta-ExternalFetcher",
  "FacebookBot",
  "Timpibot",
  "VelenPublicWebCrawler",
  "Scrapy",
  // SEO / data-mining scrapers
  "AhrefsBot",
  "SemrushBot",
  "MJ12bot",
  "DotBot",
  "DataForSeoBot",
  "BLEXBot",
  "PetalBot",
  "serpstatbot",
  "ZoominfoBot",
  "Seekr",
  "SERankingBacklinksBot",
  // AI data crawlers seen in our own logs (Nov 2026) that send no readers
  "ElevenlabsCrawler",
  "RiverBot",
  "Reflectionbot",
];

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      // Everyone else (including search engines) may crawl everything but /api/.
      { userAgent: "*", allow: "/", disallow: "/api/" },
      // Named scrapers: keep out entirely.
      ...BLOCKED_BOTS.map((ua) => ({ userAgent: ua, disallow: "/" })),
    ],
    sitemap: `${SITE_URL}/sitemap.xml`,
  };
}
