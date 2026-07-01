"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import { Wordmark } from "./Wordmark";
import { SearchBar } from "./SearchBar";

export interface HomeSubject {
  name: string;
  slug: string;
  themeCount: number;
  href: string;
}

export function Home({ subjects }: { subjects: HomeSubject[] }) {
  const [query, setQuery] = useState("");

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return q ? subjects.filter((s) => s.name.toLowerCase().includes(q)) : subjects;
  }, [subjects, query]);

  // Outline chips — no fill colour, modern/Medium-like.
  const chip =
    "flex-none font-sans text-[13px] sm:text-[13.5px] px-3.5 py-1.5 sm:px-4 sm:py-2 rounded-full border border-[rgba(33,29,24,.18)] text-ink bg-transparent hover:border-ink transition-colors whitespace-nowrap";

  return (
    <main className="relative min-h-screen bg-white text-ink flex flex-col overflow-hidden">
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
        <SearchBar value={query} onChange={setQuery} size="lg" />

        {/* Desktop → pills only */}
        <div className="hidden sm:flex flex-wrap gap-3 items-center mt-11">
          <span className={`${chip} inline-flex items-center`}>
            <span className="text-maroon mr-1.5">◆</span>Explore
          </span>
          {filtered.map((s) => (
            <Link key={s.slug} href={s.href} className={chip}>
              {s.name}
            </Link>
          ))}
          {filtered.length === 0 && (
            <span className="font-sans text-[14px] text-faint">No subjects match “{query}”.</span>
          )}
        </div>

        {/* Mobile → full list only */}
        <div className="sm:hidden mt-8">
          {filtered.map((s, i) => (
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
          {filtered.length === 0 && (
            <p className="py-8 font-sans text-[14px] text-faint">No subjects match “{query}”.</p>
          )}
        </div>

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
