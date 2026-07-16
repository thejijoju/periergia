import Link from "next/link";

export interface SectionItem {
  title: string;
  href: string;
  summary?: string;
}

/**
 * Landing shown for a *section* node — one that has children (e.g. an
 * "Introduction" chapter). A section is a grouping inside its subject, not a
 * topic to be defined, so instead of generating an article about the section's
 * title we list the topics it contains. Rendered inside the page's center
 * column (which already applies `min-w-0`).
 */
export function SectionLanding({
  title,
  subjectName,
  items,
  variant = "full",
}: {
  title: string;
  subjectName: string;
  items: SectionItem[];
  // "full": the chapter's own landing page (big header + topic cards).
  // "compact": the same cards under a chapter overview article — no page header,
  // just a labeled "explore this chapter" list.
  variant?: "full" | "compact";
}) {
  if (variant === "compact") {
    return (
      <nav className="mx-auto mt-12 max-w-[720px] border-t border-line pt-6">
        <p className="font-mono text-[10px] font-semibold uppercase tracking-[0.12em] text-whisper">
          Explore this chapter
        </p>
        <ul className="mt-4 space-y-3">
          {items.map((it) => (
            <li key={it.href}>
              <Link
                href={it.href}
                className="group block rounded-xl border border-line bg-card p-4 transition-colors hover:border-ink"
              >
                <div className="text-base font-bold text-ink transition-colors group-hover:text-purple">
                  {it.title}
                </div>
                {it.summary ? (
                  <p className="mt-1 text-sm text-muted line-clamp-2">{it.summary}</p>
                ) : null}
              </Link>
            </li>
          ))}
        </ul>
      </nav>
    );
  }

  return (
    <div>
      <p className="text-xs font-semibold uppercase tracking-wide text-faint">{subjectName}</p>
      <h1 className="mt-1 text-3xl font-bold tracking-tight text-ink">{title}</h1>
      <p className="mt-2 text-muted">
        {items.length} {items.length === 1 ? "topic" : "topics"} in this section.
      </p>

      <ul className="mt-8 space-y-3">
        {items.map((it) => (
          <li key={it.href}>
            <Link
              href={it.href}
              className="group block rounded-xl border border-line bg-card p-5 transition-colors hover:border-ink"
            >
              <div className="text-lg font-bold text-ink transition-colors group-hover:text-purple">
                {it.title}
              </div>
              {it.summary ? (
                <p className="mt-1.5 text-sm text-muted">{it.summary}</p>
              ) : null}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
