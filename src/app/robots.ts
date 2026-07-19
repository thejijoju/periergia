import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/site";

// AI-training crawlers and aggressive SEO/scraper bots that take content and
// bandwidth while sending zero readers back. The compliant ones honour a
// robots.txt disallow; the rest are hard-blocked in middleware.ts. Search
// engines (Googlebot, Bingbot, DuckDuckBot, Applebot, …) are deliberately NOT
// listed — they're how real readers find the site, so they stay welcome.
const BLOCKED_BOTS = [
  // AI / LLM training crawlers
  "GPTBot",
  "OAI-SearchBot",
  "ChatGPT-User",
  "ClaudeBot",
  "Claude-Web",
  "anthropic-ai",
  "CCBot",
  "Google-Extended",
  "Applebot-Extended",
  "Bytespider",
  "Amazonbot",
  "PerplexityBot",
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
