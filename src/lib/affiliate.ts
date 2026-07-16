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
//   • Amazon Associates — widest catalog, global reach. GEO-ROUTED: each reader
//     is sent to their local Amazon marketplace (amazon.co.uk, amazon.de, …)
//     with the tag registered for that marketplace, because an Associates tag
//     only earns on the store it belongs to. Amazon tags are per-region:
//     the "-20" suffix is the North-America program (amazon.com/.ca/.com.mx)
//     and "-21" is the UK/EU program (amazon.co.uk/.de/.fr/.it/.es/…). Tags come
//     from NEXT_PUBLIC_AMAZON_TAG (North America) and NEXT_PUBLIC_AMAZON_TAG_EU
//     (UK/EU), each defaulting to our live Associates IDs.
//   • Bookshop.org — supports independent bookstores, pays 10%. US and UK are
//     separate stores that each ship only within their own country, so the
//     Bookshop link is shown only to readers that store can serve. US id from
//     NEXT_PUBLIC_BOOKSHOP_ID (defaults to our live id); UK id from
//     NEXT_PUBLIC_BOOKSHOP_ID_UK (no default).
//
// All identifiers are public by design — they ride in every affiliate URL — so
// keeping the Amazon defaults in source is fine. Set an env var to an empty
// string to turn that store/region off without a code change; with NOTHING
// configured the transform is a no-op and nothing changes.

// NOTE: Next.js only inlines process.env.NEXT_PUBLIC_* when accessed as a
// static literal member expression, so each id is read on its own line.
const AMAZON_NA_ENV = process.env.NEXT_PUBLIC_AMAZON_TAG;
const AMAZON_TAG_NA = (AMAZON_NA_ENV === undefined ? "periergialear-20" : AMAZON_NA_ENV).trim();

const AMAZON_EU_ENV = process.env.NEXT_PUBLIC_AMAZON_TAG_EU;
const AMAZON_TAG_EU = (AMAZON_EU_ENV === undefined ? "periergialear-21" : AMAZON_EU_ENV).trim();

// Bookshop.org runs two independent stores, each with its own affiliate id:
// the US store (bookshop.org, ships within the US) and the UK store
// (uk.bookshop.org, ships within the UK). NEXT_PUBLIC_BOOKSHOP_ID is the US id
// (default: our live id); NEXT_PUBLIC_BOOKSHOP_ID_UK is the UK id (no default).
const BOOKSHOP_US_ENV = process.env.NEXT_PUBLIC_BOOKSHOP_ID;
const BOOKSHOP_ID_US = (BOOKSHOP_US_ENV === undefined ? "126258" : BOOKSHOP_US_ENV).trim();

const BOOKSHOP_UK_ENV = process.env.NEXT_PUBLIC_BOOKSHOP_ID_UK;
const BOOKSHOP_ID_UK = (BOOKSHOP_UK_ENV === undefined ? "" : BOOKSHOP_UK_ENV).trim();

// Whether any Amazon tag / Bookshop id is configured at all.
const AMAZON_ENABLED = !!(AMAZON_TAG_NA || AMAZON_TAG_EU);
const BOOKSHOP_ENABLED = !!(BOOKSHOP_ID_US || BOOKSHOP_ID_UK);

// Country (ISO-2, from Vercel's x-vercel-ip-country) → local Amazon host. The
// North-America hosts bill against the "-20" tag; the European hosts against
// "-21". Anything not listed (incl. unknown/rest-of-world) falls back to
// amazon.com on the North-America tag, which still earns on any .com purchase.
const AMAZON_HOSTS_NA: Record<string, string> = {
  US: "www.amazon.com",
  CA: "www.amazon.ca",
  MX: "www.amazon.com.mx",
};
const AMAZON_HOSTS_EU: Record<string, string> = {
  GB: "www.amazon.co.uk",
  UK: "www.amazon.co.uk",
  IE: "www.amazon.co.uk",
  DE: "www.amazon.de",
  AT: "www.amazon.de",
  FR: "www.amazon.fr",
  BE: "www.amazon.fr",
  LU: "www.amazon.fr",
  IT: "www.amazon.it",
  ES: "www.amazon.es",
  PT: "www.amazon.es",
  NL: "www.amazon.nl",
  SE: "www.amazon.se",
  PL: "www.amazon.pl",
};

// Resolve a reader's country to the Amazon host + the tag that earns there.
// Returns an empty tag when that region's tag is not configured, so the caller
// can skip the Amazon link for that reader.
function amazonMarket(country?: string): { host: string; tag: string } {
  const c = (country ?? "").toUpperCase();
  const euHost = AMAZON_HOSTS_EU[c];
  if (euHost) return { host: euHost, tag: AMAZON_TAG_EU };
  const naHost = AMAZON_HOSTS_NA[c];
  if (naHost) return { host: naHost, tag: AMAZON_TAG_NA };
  return { host: "www.amazon.com", tag: AMAZON_TAG_NA }; // rest of world
}

const HEADING = /^##\s+Further\s+(?:Reading|Exploration)\b/i;
const ANY_HEADING = /^#{1,6}\s+/;
const BULLET = /^\s*[-*]\s+/;

// The disclosure required under the heading (FTC + Amazon Associates Operating
// Agreement), phrased for the stores this particular reader actually sees
// (Bookshop is only shown where it can ship, so a non-US reader may get Amazon
// alone even when a Bookshop id is configured).
function disclosure(country?: string): string {
  const a = !!amazonMarket(country).tag;
  const b = !!bookshopMarket(country);
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

// A tagged Amazon books search on the reader's local marketplace — robust when
// we have a title + author but no ISBN. `i=stripbooks` scopes to Books so
// results land on real editions. Empty string when the region's tag is unset.
function amazonSearchUrl(query: string, country?: string): string {
  const { host, tag } = amazonMarket(country);
  if (!tag) return "";
  return `https://${host}/s?k=${enc(query)}&i=stripbooks&tag=${encodeURIComponent(tag)}`;
}

// Resolve a reader's country to the Bookshop store that can serve them. Only
// the US and UK stores exist, each shipping within its own country, so readers
// elsewhere get no Bookshop link (they keep their local Amazon link). Returns
// null when there's no serviceable, configured store for this reader.
function bookshopMarket(country?: string): { host: string; id: string } | null {
  const c = (country ?? "").toUpperCase();
  if ((c === "GB" || c === "UK") && BOOKSHOP_ID_UK) {
    return { host: "uk.bookshop.org", id: BOOKSHOP_ID_UK };
  }
  if (c === "US" && BOOKSHOP_ID_US) {
    return { host: "bookshop.org", id: BOOKSHOP_ID_US };
  }
  return null;
}

// A Bookshop.org keyword search behind our affiliate prefix. The `/a/<id>/`
// segment sets the affiliate cookie (last-touch attribution, 10% commission);
// the reader lands on the search results and any purchase in that session is
// credited to us. Empty string when Bookshop can't serve this reader.
function bookshopSearchUrl(query: string, country?: string): string {
  const m = bookshopMarket(country);
  if (!m) return "";
  return `https://${m.host}/a/${encodeURIComponent(m.id)}/beta-search?keywords=${enc(query)}`;
}

// The trailing affiliate tag(s) appended to a book bullet. When both stores are
// live each is named ("Amazon ↗ · Bookshop ↗"); with a single store a neutral
// "Find it ↗" reads cleaner.
function affiliateTrailer(query: string, country?: string): string {
  const stores: Array<{ name: string; url: string }> = [];
  const amazonUrl = amazonSearchUrl(query, country);
  if (amazonUrl) stores.push({ name: "Amazon", url: amazonUrl });
  const bookshopUrl = bookshopSearchUrl(query, country);
  if (bookshopUrl) stores.push({ name: "Bookshop", url: bookshopUrl });
  if (stores.length === 0) return "";
  if (stores.length === 1) return ` · [Find it ↗](${stores[0].url})`;
  return " · " + stores.map((s) => `[${s.name} ↗](${s.url})`).join(" · ");
}

// Given a single "- ..." bullet, return the affiliated version, or null to
// leave the bullet exactly as it was.
function affiliateBullet(line: string, country?: string): string | null {
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

  const trailer = affiliateTrailer(`${title} ${author}`, country);
  if (!trailer) return null;
  return `${line.replace(/\s+$/, "")}${trailer}`;
}

// Rewrite a full markdown body: within each Further Reading/Exploration
// section, affiliate the book bullets and drop the disclosure under the
// heading. No-op when no store is configured or the body has no such section.
export function injectAffiliateLinks(md: string, country?: string): string {
  if ((!AMAZON_ENABLED && !BOOKSHOP_ENABLED) || !md) return md;

  const lines = md.split("\n");
  const out: string[] = [];
  const note = disclosure(country);
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
      const aff = affiliateBullet(line, country);
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
