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

/** Replace {{image: Title | caption}} markers with real Wikipedia images. */
export async function resolveImageMarkers(body: string): Promise<string> {
  const markers = [...body.matchAll(MARKER)];
  if (markers.length === 0) return body;

  const resolved = await Promise.all(
    markers.map(async (m) => ({
      marker: m[0],
      caption: m[2].trim(),
      img: await lookupImage(m[1]),
    })),
  );

  let out = body;
  for (const r of resolved) {
    const replacement = r.img
      ? `![${r.caption}](${r.img.url})\n\n*${r.caption}${r.img.page ? ` — [source](${r.img.page})` : ""}*`
      : "";
    out = out.replace(r.marker, replacement);
  }
  return out;
}
