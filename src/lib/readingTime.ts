// ── Reading time ──────────────────────────────────────────────────────────
// "40 min read" under the article title. Derived from the body that is actually
// on screen, so it re-computes when the reader switches depth or level — a Skim
// and a Detailed master differ by an order of magnitude and a fixed per-topic
// estimate would be wrong for both.
//
// Counting rules matter more than the words-per-minute constant here. We drop
// the things a reader does not read linearly (widget specs, image markers, math
// delimiters, markdown punctuation) so the count reflects prose, and we keep
// checkpoint questions, which are read. Interactive widgets and the quiz are
// deliberately not modelled: this is time-to-read, not time-to-master.

// Words per minute for dense expository prose with equations. Popular reading
// estimators use 200-265 for general text; the lower half of that range fits
// this material, which is technical but written to be read straight through.
const WPM = 250;

const IMAGE_MARKER = /\{\{\s*image:[^{}]*\}\}/g;
const BOOK_MARKER = /\{\{\s*book:\s*([^|{}]*)\|\s*([^|{}]*)\|[^{}]*\}\}/g;
// Fenced widget specs (```rocketequation, ```supplydemand, …) are configuration,
// not prose. Checkpoints are the exception: the reader reads them.
const FENCE = /^```([a-z0-9-]*)\n([\s\S]*?)^```/gim;

/** Strip markup that isn't read as prose, keeping checkpoint text. */
export function readableText(body: string): string {
  return body
    .replace(FENCE, (_m, lang: string, inner: string) =>
      lang.toLowerCase() === "checkpoint" ? inner : " ",
    )
    .replace(IMAGE_MARKER, " ")
    .replace(BOOK_MARKER, (_m, author: string, title: string) => `${author} ${title}`)
    .replace(/!\[[^\]]*\]\([^)]*\)/g, " ") // resolved images
    .replace(/\[([^\]]*)\]\([^)]*\)/g, "$1") // links → their text
    .replace(/\$\$?/g, " ") // math delimiters (the symbols inside still count)
    .replace(/[#>*_`|~-]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();
}

export function wordCount(body: string): number {
  const text = readableText(body);
  return text ? text.split(" ").length : 0;
}

/**
 * Minutes to read `body`. Rounded to the nearest 5 minutes once past 20, so a
 * long article reads "50 min" rather than a falsely precise "49 min"; short
 * pieces keep single-minute resolution, where the difference is meaningful.
 */
export function readingMinutes(body: string): number {
  const words = wordCount(body);
  if (!words) return 0;
  const raw = words / WPM;
  if (raw < 1) return 1;
  if (raw <= 20) return Math.round(raw);
  return Math.round(raw / 5) * 5;
}

/** "40 min read" — or "" when there is nothing to measure. */
export function readingLabel(body: string): string {
  const m = readingMinutes(body);
  return m ? `${m} min read` : "";
}
