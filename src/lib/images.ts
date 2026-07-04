import "server-only";

// ── Article images ────────────────────────────────────────────────────────
// The generator inserts markers like {{image: Standard of Ur | caption}} —
// naming a Wikipedia article, never a URL (models hallucinate URLs). At
// generation time we resolve each marker against the Wikipedia REST API and
// splice in the real image + caption + source link. Markers that don't
// resolve are dropped, so a bad title costs nothing. Resolution happens once,
// before caching, so cached articles carry their images inline.

const MARKER = /^[ \t]*\{\{\s*image:\s*([^|{}\n]+?)\s*\|\s*([^{}\n]+?)\s*\}\}[ \t]*$/gm;

interface WikiSummary {
  thumbnail?: { source: string; width: number; height: number };
  originalimage?: { source: string; width: number; height: number };
  content_urls?: { desktop?: { page?: string } };
}

async function lookupImage(title: string): Promise<{ url: string; page?: string } | null> {
  try {
    const res = await fetch(
      `https://en.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(title.trim().replace(/ /g, "_"))}`,
      {
        headers: { "User-Agent": "Periergia/1.0 (living textbook; article image lookup)" },
        signal: AbortSignal.timeout(6000),
      },
    );
    if (!res.ok) return null;
    const data = (await res.json()) as WikiSummary;
    const thumb = data.thumbnail?.source;
    const original = data.originalimage;
    if (!thumb || !original) return null;
    // Reading-column width: rescale the thumbnail URL up to 960px, but never
    // to (or past) the original's width — Wikimedia 404s on >= original size.
    const url =
      original.width > 1000 ? thumb.replace(/\/\d+px-/, "/960px-") : original.source;
    return { url, page: data.content_urls?.desktop?.page };
  } catch {
    return null;
  }
}

/** Search Wikipedia for the best-matching article title (marker misses, node fallback). */
async function searchTitle(query: string): Promise<string | null> {
  try {
    const res = await fetch(
      `https://en.wikipedia.org/w/rest.php/v1/search/title?q=${encodeURIComponent(query)}&limit=1`,
      {
        headers: { "User-Agent": "Periergia/1.0 (living textbook; article image lookup)" },
        signal: AbortSignal.timeout(6000),
      },
    );
    if (!res.ok) return null;
    const data = (await res.json()) as { pages?: { title: string }[] };
    return data.pages?.[0]?.title ?? null;
  } catch {
    return null;
  }
}

/** Exact title first, then title search — so near-miss markers still resolve. */
async function lookupWithSearch(title: string): Promise<{ url: string; page?: string } | null> {
  const exact = await lookupImage(title);
  if (exact) return exact;
  const found = await searchTitle(title);
  return found && found !== title ? lookupImage(found) : null;
}

const IMG_MD = (caption: string, img: { url: string; page?: string }) =>
  `![${caption}](${img.url})\n\n*${caption}${img.page ? ` — [source](${img.page})` : ""}*`;

/**
 * Replace {{image: Title | caption}} markers with real Wikipedia images.
 * Every article should carry at least one image: if no marker resolves, fall
 * back to the topic's own Wikipedia lead image, placed after the opening
 * definition blockquote.
 */
export async function resolveImageMarkers(body: string, topicTitle?: string): Promise<string> {
  const markers = [...body.matchAll(MARKER)];

  const resolved = await Promise.all(
    markers.map(async (m) => ({
      marker: m[0],
      caption: m[2].trim(),
      img: await lookupWithSearch(m[1]),
    })),
  );

  let out = body;
  let placed = 0;
  for (const r of resolved) {
    out = out.replace(r.marker, r.img ? IMG_MD(r.caption, r.img) : "");
    if (r.img) placed++;
  }

  if (placed === 0 && topicTitle) {
    const fallback = await lookupWithSearch(topicTitle);
    if (fallback) {
      const figure = IMG_MD(topicTitle, fallback);
      // After the definition blockquote (first non-'>' gap), else at the top.
      const lines = out.split("\n");
      const end = lines.findIndex((l, i) => i > 0 && lines[i - 1].startsWith(">") && !l.startsWith(">"));
      if (end > 0) lines.splice(end, 0, "", figure);
      else lines.unshift(figure, "");
      out = lines.join("\n");
    }
  }
  return out;
}
