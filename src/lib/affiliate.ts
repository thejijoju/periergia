// Affiliate monetization for Further Reading citations.
//
// Every article ends with a Further Reading / Further Exploration list written
// in one fixed house style:
//
//     - **Author, *Title* (year).** A sentence about the book.
//
// We turn each real BOOK citation into an Amazon search link carrying our
// Associates tag — at RENDER time, so all existing and future articles are
// monetized with zero per-article editing. Two kinds of entries are left as
// plain text on purpose:
//   • journal articles / papers — their title is in "quotes" and the italic is
//     a journal name (e.g. *Nature*); you don't buy those on Amazon.
//   • reference works and free sites with no personal author (e.g. "The
//     *Stanford Encyclopedia of Philosophy*.").
//
// The tag defaults to our Amazon Associates ID and can be overridden by
// NEXT_PUBLIC_AMAZON_TAG (inlined at build). It is safe to keep in source and
// to expose — an Associates tag is public by design (it rides in every
// affiliate URL). Set the env var to an empty string to disable monetization
// entirely without a code change.

const DEFAULT_TAG = "periergialear-20";
const ENV_TAG = process.env.NEXT_PUBLIC_AMAZON_TAG;
const TAG = (ENV_TAG === undefined ? DEFAULT_TAG : ENV_TAG).trim();

// Amazon's required associate disclosure, verbatim in spirit (FTC + Associates
// Operating Agreement). Rendered once, directly under the section heading.
const DISCLOSURE =
  "_Some titles below are affiliate links. As an Amazon Associate, periergia earns from qualifying purchases — at no extra cost to you._";

const HEADING = /^##\s+Further\s+(?:Reading|Exploration)\b/i;
const ANY_HEADING = /^#{1,6}\s+/;
const BULLET = /^\s*[-*]\s+/;

// A tagged Amazon books search — robust when we have a title + author but no
// ISBN. `i=stripbooks` scopes the search to Books so results land on real
// editions rather than unrelated merch.
function amazonSearchUrl(query: string): string {
  const k = encodeURIComponent(query.replace(/\s+/g, " ").trim());
  return `https://www.amazon.com/s?k=${k}&i=stripbooks&tag=${encodeURIComponent(TAG)}`;
}

// Given a single "- ..." bullet, return the affiliated version, or null to
// leave the bullet exactly as it was.
function affiliateBullet(line: string): string | null {
  // Parse ONLY the bold citation head — never the trailing description, which
  // may itself contain quotes or italics (e.g. Hobsbawm's "short twentieth
  // century") that would fool the book/article test.
  const head = line.match(/^\s*[-*]\s+\*\*(.+?)\*\*/);
  if (!head) return null;
  const citation = head[1];

  if (citation.includes('"')) return null; // quoted title ⇒ article/paper

  const ital = citation.match(/\*([^*]+)\*/);
  if (!ital || ital.index === undefined) return null; // no italic work ⇒ skip
  const title = ital[1].trim();
  if (title.length < 3) return null;

  // Author = whatever precedes the italic title, minus the trailing comma.
  const author = citation
    .slice(0, ital.index)
    .replace(/\*+/g, "")
    .replace(/[,\s]+$/, "")
    .trim();
  if (!author || /^(the|an?)$/i.test(author)) return null; // reference work / site

  const url = amazonSearchUrl(`${title} ${author}`);
  return `${line.replace(/\s+$/, "")} · [Find it ↗](${url})`;
}

// Rewrite a full markdown body: within each Further Reading/Exploration
// section, affiliate the book bullets and drop an FTC disclosure under the
// heading. No-op when no tag is configured or the body has no such section.
export function injectAffiliateLinks(md: string): string {
  if (!TAG || !md) return md;

  const lines = md.split("\n");
  const out: string[] = [];
  let inSection = false;
  let sectionHeadingAt = -1;
  let linkedInSection = 0;

  const flushDisclosure = () => {
    if (linkedInSection > 0 && sectionHeadingAt >= 0) {
      out.splice(sectionHeadingAt + 1, 0, "", DISCLOSURE);
    }
    sectionHeadingAt = -1;
    linkedInSection = 0;
  };

  for (const line of lines) {
    if (HEADING.test(line)) {
      flushDisclosure(); // close any prior section first
      inSection = true;
      out.push(line);
      sectionHeadingAt = out.length - 1;
      continue;
    }
    if (inSection && ANY_HEADING.test(line)) {
      flushDisclosure();
      inSection = false;
      out.push(line);
      continue;
    }
    if (inSection && BULLET.test(line)) {
      const aff = affiliateBullet(line);
      if (aff) {
        out.push(aff);
        linkedInSection++;
        continue;
      }
    }
    out.push(line);
  }
  flushDisclosure(); // section ran to end of document

  return out.join("\n");
}
