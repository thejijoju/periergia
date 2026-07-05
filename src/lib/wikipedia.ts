import "server-only";

// ── Wikipedia grounding ───────────────────────────────────────────────────
// Before generating a master article, fetch the real Wikipedia article on the
// topic and hand it to the model as reference material. The model writes its
// own text (Wikipedia is CC BY-SA — we must never copy sentences verbatim),
// but checks its facts, dates, names, and figures against a live source
// instead of relying purely on parametric memory. A fetch failure degrades
// gracefully: generation proceeds ungrounded rather than failing.

const UA = { "User-Agent": "Periergia/1.0 (living textbook; article grounding)" };

/** Best-matching Wikipedia title for a topic (search API, first hit). */
async function searchTitle(query: string): Promise<string | null> {
  try {
    const res = await fetch(
      `https://en.wikipedia.org/w/rest.php/v1/search/title?q=${encodeURIComponent(query)}&limit=1`,
      { headers: UA, signal: AbortSignal.timeout(6000) },
    );
    if (!res.ok) return null;
    const data = (await res.json()) as { pages?: { title: string }[] };
    return data.pages?.[0]?.title ?? null;
  } catch {
    return null;
  }
}

/** Plain-text extract of a Wikipedia article, capped so it fits the prompt. */
async function fetchExtract(title: string, maxChars: number): Promise<string | null> {
  try {
    const params = new URLSearchParams({
      action: "query",
      prop: "extracts",
      explaintext: "1",
      format: "json",
      redirects: "1",
      titles: title,
    });
    const res = await fetch(`https://en.wikipedia.org/w/api.php?${params}`, {
      headers: UA,
      signal: AbortSignal.timeout(10000),
    });
    if (!res.ok) return null;
    const data = (await res.json()) as {
      query?: { pages?: Record<string, { extract?: string }> };
    };
    const pages = data.query?.pages ?? {};
    const extract = Object.values(pages)[0]?.extract;
    if (!extract) return null;
    return extract.length > maxChars ? extract.slice(0, maxChars) + "\n[… truncated]" : extract;
  } catch {
    return null;
  }
}

/**
 * Reference text for grounding a generation: the topic's Wikipedia article
 * (exact title, else best search match), as plain text. Null when nothing
 * usable is found — callers generate ungrounded in that case.
 */
export async function fetchWikipediaContext(
  topic: string,
  maxChars = 24000,
): Promise<{ title: string; extract: string } | null> {
  let extract = await fetchExtract(topic, maxChars);
  let title = topic;
  if (!extract) {
    const found = await searchTitle(topic);
    if (!found || found === topic) return null;
    extract = await fetchExtract(found, maxChars);
    title = found;
  }
  return extract ? { title, extract } : null;
}
