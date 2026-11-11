import { NextResponse, type NextRequest } from "next/server";
import { LANG_COOKIE, normalizeLang } from "@/lib/i18n";

const COUNTRY_COOKIE = "periergia_country";

// Hard-block AI-training crawlers, SEO scrapers, and raw HTTP-library scrapers
// by user-agent — a 403 before the page ever renders. This enforces what
// robots.ts asks politely, for the bots that ignore robots.txt.
//
// Deliberately NOT matched: search-engine crawlers (Googlebot, Bingbot,
// DuckDuckBot, Applebot) — they bring the real readers, so indexing stays open.
// Nor the AI *search/assistant* fetchers (OAI-SearchBot, ChatGPT-User,
// PerplexityBot, Perplexity-User, Claude-SearchBot, Claude-User): they fetch a
// page when someone asks ChatGPT/Perplexity/Claude a question and cite it with a
// link, so they send readers. Only the AI *training* crawlers stay blocked.
// (Google-Extended / Applebot-Extended are robots.txt-only AI-opt-out tokens,
// not request user-agents, so they live in robots.ts, not here.)
//
// What this canNOT stop: residential-proxy scrapers that spoof a real browser
// user-agent and geolocate to a real city. Those are indistinguishable from a
// person at the request level and need a WAF / bot-management challenge
// (Vercel Firewall) — a dashboard setting, not code.
const BLOCKED_UA =
  /GPTBot|ClaudeBot|Claude-Web|anthropic-ai|CCBot|Bytespider|Amazonbot|Omgilibot|Omgili|Diffbot|ImagesiftBot|cohere-ai|YouBot|Meta-ExternalAgent|Meta-ExternalFetcher|FacebookBot|Timpibot|VelenPublicWebCrawler|Scrapy|AhrefsBot|SemrushBot|MJ12bot|DotBot|DataForSeoBot|BLEXBot|PetalBot|serpstatbot|ZoominfoBot|Seekr|SERankingBacklinksBot|ElevenlabsCrawler|RiverBot|Reflectionbot|python-requests|Go-http-client|node-fetch/i;

export function middleware(req: NextRequest) {
  const ua = req.headers.get("user-agent") ?? "";
  if (BLOCKED_UA.test(ua)) {
    return new NextResponse("Forbidden", {
      status: 403,
      headers: { "content-type": "text/plain; charset=utf-8", "x-robots-tag": "noindex" },
    });
  }
  // Article pages are cached per language: /learn/<subject>/<…node> is served
  // from /lang/<reader's language>/learn/… (the URL in the address bar stays the
  // same). The language comes from the switcher's cookie, English by default.
  const { pathname } = req.nextUrl;
  let res: NextResponse;
  if (/^\/learn\/[^/]+\/.+/.test(pathname)) {
    const url = req.nextUrl.clone();
    url.pathname = `/lang/${normalizeLang(req.cookies.get(LANG_COOKIE)?.value)}${pathname}`;
    res = NextResponse.rewrite(url);
  } else {
    res = NextResponse.next();
  }
  // The reader's country (Vercel geo header) for the Amazon links in the cached
  // article, read in the browser by Reader.
  const country = req.headers.get("x-vercel-ip-country");
  if (country && req.cookies.get(COUNTRY_COOKIE)?.value !== country) {
    res.cookies.set(COUNTRY_COOKIE, country, { path: "/", maxAge: 60 * 60 * 24 * 30, sameSite: "lax" });
  }
  return res;
}

export const config = {
  // Page routes only — skip Next internals, static assets, and the API routes
  // (so the dwell beacon, analytics dashboard, and signup form are never
  // affected by this filter).
  matcher: ["/((?!_next/static|_next/image|favicon.ico|sitemap.xml|robots.txt|api/).*)"],
};
