import "server-only";
import { getSupabase } from "./supabase";

// Server-side demand log. On every real article page load, page.tsx records an
// `article_request` event (via next/server `after`, so it never adds latency).
// Unlike the client `article_read` beacon, this captures EVERY request — people
// who bounce during the (slow) cold generation, visitors landing from search,
// and crawlers — and authoritatively knows whether the page was uncached. That
// makes the analytics dashboard a warming worklist: the most-requested COLD
// articles are the ones worth pre-generating so the next visitor (and Google)
// gets an instant, already-written page.
//
// Crawlers are flagged (`bot`), not dropped, so crawl demand is visible for SEO.
const BOT =
  /bot|crawl|spider|slurp|bingpreview|facebookexternalhit|embedly|quora|pinterest|slackbot|telegrambot|whatsapp|discordbot|preview|monitor|headless|lighthouse|pagespeed|python-requests|curl\//i;

function cap(v: string | null | undefined, n: number): string | null {
  if (!v) return null;
  const s = v.trim();
  return s ? s.slice(0, n) : null;
}

export async function logArticleRequest(opts: {
  nodeId: string;
  title: string;
  path: string;
  cold: boolean;
  headers: Headers;
}): Promise<void> {
  const supabase = getSupabase();
  if (!supabase) return;

  const h = opts.headers;
  const ua = h.get("user-agent") ?? "";
  const row = {
    name: "article_request",
    node_id: cap(opts.nodeId, 200),
    title: cap(opts.title, 300),
    path: cap(opts.path, 300),
    cold: opts.cold,
    bot: BOT.test(ua),
    country: cap(h.get("x-vercel-ip-country"), 8),
    city: cap(decodeURIComponent(h.get("x-vercel-ip-city") ?? ""), 120),
    referrer: cap(h.get("referer"), 300),
    ua: cap(ua, 300),
  };

  try {
    await supabase.from("events").insert(row);
  } catch {
    // Demand logging must never break a page render; swallow write errors.
  }
}
