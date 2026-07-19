import { NextResponse, type NextRequest } from "next/server";

// Hard-block AI-training crawlers, SEO scrapers, and raw HTTP-library scrapers
// by user-agent — a 403 before the page ever renders. This enforces what
// robots.ts asks politely, for the bots that ignore robots.txt.
//
// Deliberately NOT matched: search-engine crawlers (Googlebot, Bingbot,
// DuckDuckBot, Applebot) — they bring the real readers, so indexing stays open.
// (Google-Extended / Applebot-Extended are robots.txt-only AI-opt-out tokens,
// not request user-agents, so they live in robots.ts, not here.)
//
// What this canNOT stop: residential-proxy scrapers that spoof a real browser
// user-agent and geolocate to a real city. Those are indistinguishable from a
// person at the request level and need a WAF / bot-management challenge
// (Vercel Firewall) — a dashboard setting, not code.
const BLOCKED_UA =
  /GPTBot|OAI-SearchBot|ChatGPT-User|ClaudeBot|Claude-Web|anthropic-ai|CCBot|Bytespider|Amazonbot|PerplexityBot|Omgilibot|Omgili|Diffbot|ImagesiftBot|cohere-ai|YouBot|Meta-ExternalAgent|Meta-ExternalFetcher|FacebookBot|Timpibot|VelenPublicWebCrawler|Scrapy|AhrefsBot|SemrushBot|MJ12bot|DotBot|DataForSeoBot|BLEXBot|PetalBot|serpstatbot|ZoominfoBot|Seekr|python-requests|Go-http-client|node-fetch/i;

export function middleware(req: NextRequest) {
  const ua = req.headers.get("user-agent") ?? "";
  if (BLOCKED_UA.test(ua)) {
    return new NextResponse("Forbidden", {
      status: 403,
      headers: { "content-type": "text/plain; charset=utf-8", "x-robots-tag": "noindex" },
    });
  }
  return NextResponse.next();
}

export const config = {
  // Page routes only — skip Next internals, static assets, and the API routes
  // (so the dwell beacon, analytics dashboard, and signup form are never
  // affected by this filter).
  matcher: ["/((?!_next/static|_next/image|favicon.ico|sitemap.xml|robots.txt|api/).*)"],
};
