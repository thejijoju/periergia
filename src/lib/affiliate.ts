// Affiliate monetization for Further Reading citations.
//
// Every article ends with a Further Reading / Further Exploration list written
// in one fixed house style:
//
//     - **Author, *Title* (year).** A sentence about the book.
//
// We turn each real BOOK citation into affiliate search links — at RENDER time,
// so all existing and future articles are monetized with zero per-article
// editing. Two kinds of entries are left as plain text on purpose:
//   • journal articles / papers — their title is in "quotes" and the italic is
//     a journal name (e.g. *Nature*); you don't buy those in a bookstore.
//   • reference works and free sites with no personal author (e.g. "The
//     *Stanford Encyclopedia of Philosophy*.").
//
// Two stores are supported and shown side by side when both are configured:
//   • Amazon Associates — widest catalog, global reach. Tag from
//     NEXT_PUBLIC_AMAZON_TAG, defaulting to our live Associates ID.
//   • Bookshop.org — supports independent bookstores, pays 10%, US/UK only.
//     Numeric affiliate id from NEXT_PUBLIC_BOOKSHOP_ID (no default; empty =
//     Bookshop links off).
//
// Both identifiers are public by design — they ride in every affiliate URL —
// so keeping the Amazon default in source is fine. Set an env var to an empty
// string to turn that store off without a code change; with NEITHER store
// configured the transform is a no-op and nothing changes.

// NOTE: Next.js only inlines process.env.NEXT_PUBLIC_* when accessed as a
// static literal member expression, so each id is read on its own line.
const AMAZON_ENV = process.env.NEXT_PUBLIC_AMAZON_TAG;
const AMAZON_TAG = (AMAZON_ENV === undefined ? "periergialear-20" : AMAZON_ENV).trim();

const BOOKSHOP_ENV = process.env.NEXT_PUBLIC_BOOKSHOP_ID;
const BOOKSHOP_ID = (BOOKSHOP_ENV === undefined ? "" : BOOKSHOP_ENV).trim();

const HEADING = /^##\s+Further\s+(?:Reading|Exploration)\b/i;
const ANY_HEADING = /^#{1,6}\s+/;
const BULLET = /^\s*[-*]\s+/;

// The disclosure required under the heading (FTC + Amazon Associates Operating
// Agreement), phrased for whichever stores are actually live.
function disclosure(): string {
  const a = !!AMAZON_TAG;
  const b = !!BOOKSHOP_ID;
  if (a && b) {
    return "_Some titles below are affiliate links to Amazon and Bookshop.org (which supports independent bookstores). As an Amazon Associate, periergia earns from qualifying purchases, and we earn a commission from Bookshop.org — at no extra cost to you._";
  }
  if (b) {
    return "_Some titles below are affiliate links to Bookshop.org, which supports independent bookstores. periergia earns a commission from qualifying purchases — at no extra cost to you._";
  }
  return "_Some titles below are affiliate links. As an Amazon Associate, periergia earns from qualifying purchases — at no extra cost to you._";
}

function enc(query: string): string {
  return encodeURIComponent(query.replace(/\s+/g, " ").trim());
}

// A tagged Amazon books search — robust when we have a title + author but no
// ISBN. `i=stripbooks` scopes to Books so results land on real editions.
function amazonSearchUrl(query: string): string {
  return `https://www.amazon.com/s?k=${enc(query)}&i=stripbooks&tag=${encodeURIComponent(AMAZON_TAG)}`;
}

// A Bookshop.org keyword search behind our affiliate prefix. The `/a/<id>/`
// segment sets the affiliate cookie (last-touch attribution, 10% commission);
// the reader lands on the search results and any purchase in that session is
// credited to us.
function bookshopSearchUrl(query: string): string {
  return `https://bookshop.org/a/${encodeURIComponent(BOOKSHOP_ID)}/search?keywords=${enc(query)}`;
}

// The trailing affiliate tag(s) appended to a book bullet. When both stores are
// live each is named ("Amazon ↗ · Bookshop ↗"); with a single store a neutral
// "Find it ↗" reads cleaner.
function affiliateTrailer(query: string): string {
  const stores: Array<{ name: string; url: string }> = [];
  if (AMAZON_TAG) stores.push({ name: "Amazon", url: amazonSearchUrl(query) });
  if (BOOKSHOP_ID) stores.push({ name: "Bookshop", url: bookshopSearchUrl(query) });
  if (stores.length === 0) return "";
  if (stores.length === 1) return ` · [Find it ↗](${stores[0].url})`;
  return " · " + stores.map((s) => `[${s.name} ↗](${s.url})`).join(" · ");
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

  const trailer = affiliateTrailer(`${title} ${author}`);
  if (!trailer) return null;
  return `${line.replace(/\s+$/, "")}${trailer}`;
}

// Rewrite a full markdown body: within each Further Reading/Exploration
// section, affiliate the book bullets and drop the disclosure under the
// heading. No-op when no store is configured or the body has no such section.
export function injectAffiliateLinks(md: string): string {
  if ((!AMAZON_TAG && !BOOKSHOP_ID) || !md) return md;

  const lines = md.split("\n");
  const out: string[] = [];
  const note = disclosure();
  let inSection = false;
  let sectionHeadingAt = -1;
  let linkedInSection = 0;

  const flushDisclosure = () => {
    if (linkedInSection > 0 && sectionHeadingAt >= 0) {
      out.splice(sectionHeadingAt + 1, 0, "", note);
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
