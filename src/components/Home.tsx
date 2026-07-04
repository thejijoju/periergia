"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { useRouter } from "next/navigation";
import { Wordmark } from "./Wordmark";
import { SearchBar } from "./SearchBar";
import { ThemeToggle } from "./ThemeToggle";
import type { SearchItem } from "@/lib/types";

export interface HomeSubject {
  name: string;
  slug: string;
  themeCount: number;
  href: string;
}

// The 9 subjects shown as quick pills on desktop (broad, representative mix).
const CURATED_PILLS = [
  "mathematics",
  "physics",
  "computer-science",
  "biology",
  "psychology",
  "history",
  "economics",
  "finance",
  "philosophy",
];

export function Home({
  subjects,
  searchIndex,
}: {
  subjects: HomeSubject[];
  searchIndex: SearchItem[];
}) {
  const router = useRouter();
  const [query, setQuery] = useState("");
  const q = query.trim().toLowerCase();
  const searching = q.length > 0;

  // Curated pills (the "hint" of what you can learn) — shown when idle.
  const pillSubjects = useMemo(() => {
    const bySlug = new Map(subjects.map((s) => [s.slug, s]));
    return CURATED_PILLS.map((slug) => bySlug.get(slug)).filter(Boolean) as HomeSubject[];
  }, [subjects]);

  // Typing a keyword searches all 659 topics (+ sub-subjects) and lets you drop
  // straight into the matching topic's reader.
  const results = useMemo(() => {
    if (!q) return [] as SearchItem[];
    const starts: SearchItem[] = [];
    const includes: SearchItem[] = [];
    const ctxOnly: SearchItem[] = [];
    for (const it of searchIndex) {
      const t = it.title.toLowerCase();
      if (t.startsWith(q)) starts.push(it);
      else if (t.includes(q)) includes.push(it);
      else if (it.ctx.toLowerCase().includes(q)) ctxOnly.push(it);
    }
    const leafFirst = (a: SearchItem, b: SearchItem) => Number(b.leaf) - Number(a.leaf);
    return [...starts.sort(leafFirst), ...includes.sort(leafFirst), ...ctxOnly].slice(0, 12);
  }, [q, searchIndex]);

  const goTop = () => {
    if (results.length) router.push(results[0].href);
  };

  // Outline chips — no fill colour, modern/Medium-like.
  const chip =
    "flex-none font-sans text-[13px] sm:text-[13.5px] px-3.5 py-1.5 sm:px-4 sm:py-2 rounded-full border border-line text-ink bg-transparent hover:border-ink transition-colors whitespace-nowrap";

  return (
    <main className="relative min-h-screen bg-page text-ink flex flex-col overflow-hidden">
      {/* Theme toggle — top-left */}
      <div className="absolute top-3 left-3 z-10">
        <ThemeToggle />
      </div>
      {/* Faint pixel-grid accent, top-right */}
      <Image
        src="/accent-pixels.png"
        alt=""
        width={432}
        height={230}
        priority
        className="pointer-events-none select-none absolute top-4 right-4 sm:top-6 sm:right-8 w-[190px] sm:w-[260px] lg:w-[320px] h-auto hidden sm:block"
      />

      {/* Brand */}
      <div className="mx-auto w-full max-w-[760px] px-6 sm:px-8 pt-16 sm:pt-24 lg:pt-28 text-center">
        <Wordmark size="lg" tagline />
      </div>

      {/* Full-bleed library strip — the Long Room, Trinity College Dublin */}
      <div className="relative w-full h-[56px] sm:h-[104px] lg:h-[132px] mt-8 sm:mt-12">
        <Image
          src="/library-strip.jpg"
          alt="The Long Room, Trinity College Library, Dublin"
          fill
          sizes="100vw"
          quality={90}
          className="object-cover"
          priority
        />
      </div>

      {/* Controls */}
      <div className="mx-auto w-full max-w-[760px] px-6 sm:px-8 mt-10 sm:mt-14 pb-24 sm:pb-32">
        <SearchBar value={query} onChange={setQuery} onSubmit={goTop} size="lg" />

        {searching ? (
          /* Search → matching topics; Enter or click drops into the reader */
          <div className="mt-6">
            {results.map((it) => (
              <Link
                key={it.href}
                href={it.href}
                className="block py-3 border-t border-line group"
              >
                <span className="font-sans text-[16px] text-ink group-hover:text-maroon transition-colors">
                  {it.title}
                </span>
                <span className="ml-2 font-sans text-[12px] text-whisper">{it.ctx}</span>
              </Link>
            ))}
            {results.length === 0 && (
              <p className="py-8 font-sans text-[14px] text-faint">
                No topics match “{query}”. Try another keyword.
              </p>
            )}
          </div>
        ) : (
          <>
            {/* Idle hint — desktop: curated pills */}
            <div className="hidden sm:flex flex-wrap gap-3 items-center mt-11">
              <span className={`${chip} inline-flex items-center`}>
                <span className="text-maroon mr-1.5">◆</span>Explore
              </span>
              {pillSubjects.map((s) => (
                <Link key={s.slug} href={s.href} className={chip}>
                  {s.name}
                </Link>
              ))}
            </div>

            {/* Idle hint — mobile: full subject list */}
            <div className="sm:hidden mt-8">
              {subjects.map((s, i) => (
                <Link
                  key={s.slug}
                  href={s.href}
                  className="flex justify-between items-center py-4 border-t border-line group"
                >
                  <span className="font-sans font-medium text-[18px]">
                    <span className="font-mono text-[12px] text-numeral mr-4">
                      {String(i + 1).padStart(2, "0")}
                    </span>
                    {s.name}
                  </span>
                  <span className="font-sans text-[13px] text-whisper group-hover:text-maroon transition-colors">
                    {s.themeCount} themes&nbsp;›
                  </span>
                </Link>
              ))}
            </div>
          </>
        )}

        {/* Image credit — mobile: tiny, at the very bottom (scroll to reach) */}
        <p className="sm:hidden mt-28 mb-4 text-center font-sans text-[9.5px] leading-relaxed text-whisper">
          <ImageCredit />
        </p>
      </div>

      {/* Image credit — desktop: unobtrusive, bottom-right corner */}
      <p className="hidden sm:block absolute bottom-4 right-6 text-right font-sans text-[10px] leading-snug text-whisper max-w-[280px]">
        <ImageCredit />
      </p>
    </main>
  );
}

function ImageCredit() {
  return (
    <>
      Library photograph:{" "}
      <a
        href="https://commons.wikimedia.org/wiki/File:Long_Room_Interior,_Trinity_College_Dublin,_Ireland_-_Diliff.jpg"
        target="_blank"
        rel="noopener noreferrer"
        className="underline underline-offset-2 hover:text-maroon"
      >
        The Long Room, Trinity College Dublin
      </a>{" "}
      by David Iliff · {" "}
      <a
        href="https://creativecommons.org/licenses/by-sa/3.0/"
        target="_blank"
        rel="noopener noreferrer"
        className="underline underline-offset-2 hover:text-maroon"
      >
        CC BY-SA 3.0
      </a>
    </>
  );
}
