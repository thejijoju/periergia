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

// Bookshop.org runs two independent stores that each ship within their own
// country: the US store (bookshop.org) and the UK store (uk.bookshop.org).
//
// Per Bookshop's own guidance, a STOREFRONT url automatically carries the
// affiliate cookie, so any purchase a reader makes in that session is credited
// to us — no per-book ISBN needed. (Per-book /a/<id>/ product links attribute
// too but require each book's page URL, which we can't derive from a title +
// author; a keyword search does NOT carry the cookie.) So each "Bookshop ↗"
// points at our storefront: the reader lands on our Bookshop store, searches,
// and any purchase credits us. Configure by storefront SLUG (the name in
// bookshop.org/shop/<slug>), which is the enable switch — empty means no link.
const BOOKSHOP_STOREFRONT_US = (process.env.NEXT_PUBLIC_BOOKSHOP_STOREFRONT ?? "periergia").trim();
const BOOKSHOP_STOREFRONT_UK = (process.env.NEXT_PUBLIC_BOOKSHOP_STOREFRONT_UK ?? "").trim();

// Whether any Amazon tag / Bookshop id is configured at all.
const AMAZON_ENABLED = !!(AMAZON_TAG_NA || AMAZON_TAG_EU);
const BOOKSHOP_ENABLED = !!(BOOKSHOP_STOREFRONT_US || BOOKSHOP_STOREFRONT_UK);

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

// Resolve a reader's country to the Bookshop STOREFRONT that can serve them.
// Only the US and UK stores exist, each shipping within its own country, so
// readers elsewhere get no Bookshop link (they keep their local Amazon link).
// Returns null when there's no serviceable, configured storefront.
function bookshopMarket(country?: string): { host: string; slug: string } | null {
  const c = (country ?? "").toUpperCase();
  if ((c === "GB" || c === "UK") && BOOKSHOP_STOREFRONT_UK) {
    return { host: "uk.bookshop.org", slug: BOOKSHOP_STOREFRONT_UK };
  }
  if (c === "US" && BOOKSHOP_STOREFRONT_US) {
    return { host: "bookshop.org", slug: BOOKSHOP_STOREFRONT_US };
  }
  return null;
}

// Our Bookshop.org storefront URL. Bookshop's guidance: a storefront url
// automatically carries the affiliate cookie, so any purchase the reader makes
// in that session is credited to us (10% commission) — no per-book ISBN needed.
// The reader lands on our store and searches for the book from there. The
// `query` is unused (search urls don't carry the cookie) but kept in the
// signature to mirror amazonSearchUrl. Empty when Bookshop can't serve them.
// eslint-disable-next-line @typescript-eslint/no-unused-vars
function bookshopSearchUrl(query: string, country?: string): string {
  const m = bookshopMarket(country);
  if (!m) return "";
  return `https://${m.host}/shop/${encodeURIComponent(m.slug)}`;
}

// The stores that can serve this reader, primary first (Amazon leads: it's
// present for everyone and geo-routed; Bookshop is the US-only second option).
function storesFor(query: string, country?: string): Array<{ name: string; url: string }> {
  const stores: Array<{ name: string; url: string }> = [];
  const amazonUrl = amazonSearchUrl(query, country);
  if (amazonUrl) stores.push({ name: "Amazon", url: amazonUrl });
  const bookshopUrl = bookshopSearchUrl(query, country);
  if (bookshopUrl) stores.push({ name: "Bookshop", url: bookshopUrl });
  return stores;
}

// Given a "- ..." bullet, make the BOOK TITLE itself the affiliate link (so it
// reads as an obvious, tappable link rather than a subtle trailing tag), and
// append a small "· Bookshop ↗" for any additional store. Returns null to leave
// the bullet unchanged.
function affiliateBullet(line: string, country?: string): string | null {
  // Split the bullet into: lead ("- **"), the bold CITATION head, the closing
  // "**", and the trailing description. We only ever touch the citation — never
  // the description, which may carry its own quotes/italics (e.g. Hobsbawm's
  // "short twentieth century") that would fool the book/article test.
  const parts = line.match(/^(\s*[-*]\s+\*\*)([\s\S]+?)(\*\*)([\s\S]*)$/);
  if (!parts) return null;
  const [, lead, citation, closeBold, rest] = parts;

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

  const stores = storesFor(`${title} ${author}`, country);
  if (stores.length === 0) return null;
  const [primary, ...secondary] = stores;

  // Wrap the title italic (the first `*…*` in the citation) in the primary
  // store's link, keeping it italic: `*Title*` → `[*Title*](url)`.
  const linkedCitation = citation.replace(/\*[^*]+\*/, (t) => `[${t}](${primary.url})`);
  const trailer = secondary.length
    ? " · " + secondary.map((s) => `[${s.name} ↗](${s.url})`).join(" · ")
    : "";
  return `${lead}${linkedCitation}${closeBold}${rest.replace(/\s+$/, "")}${trailer}`;
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
