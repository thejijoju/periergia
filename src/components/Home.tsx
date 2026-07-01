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

type Tab = "pills" | "list";

export function Home({ subjects }: { subjects: HomeSubject[] }) {
  const [tab, setTab] = useState<Tab>("pills");
  const [query, setQuery] = useState("");
  const [pill, setPill] = useState("Explore");

  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    return q ? subjects.filter((s) => s.name.toLowerCase().includes(q)) : subjects;
  }, [subjects, query]);

  return (
    <main className="relative min-h-screen bg-white text-ink flex flex-col overflow-hidden">
      {/* Faint pixel-grid accent, top-right (from the periergia.com reference) */}
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

      {/* Full-bleed library strip — high-res panorama, crisp at any height */}
      <div className="relative w-full h-[64px] sm:h-[140px] lg:h-[190px] mt-8 sm:mt-12">
        <Image
          src="/library-strip.jpg"
          alt="A classical library"
          fill
          sizes="100vw"
          className="object-cover"
          priority
        />
      </div>

      {/* Controls */}
      <div className="mx-auto w-full max-w-[760px] px-6 sm:px-8 mt-10 sm:mt-16 pb-24 sm:pb-32">
        {/* Search */}
        <SearchBar value={query} onChange={setQuery} size="lg" />

        {/* Browse-mode toggle */}
        <div className="mt-12 sm:mt-16 flex gap-8 items-end border-b border-line">
          {(["pills", "list"] as Tab[]).map((t) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              className={`font-serif text-[14px] sm:text-[16px] pb-3 -mb-px border-b-2 transition-colors ${
                tab === t
                  ? "font-semibold text-ink border-maroon"
                  : "font-normal text-whisper border-transparent hover:text-ink"
              }`}
            >
              {t === "pills" ? "Quick pills" : "Full list"}
            </button>
          ))}
        </div>

        {/* Pills view */}
        {tab === "pills" && (
          <div className="mt-7 sm:mt-9 flex flex-wrap gap-2.5 sm:gap-3 items-center">
            <button
              onClick={() => setPill("Explore")}
              className={`flex-none font-serif text-[14px] sm:text-[15px] px-4 py-2 sm:px-5 sm:py-2.5 rounded-full inline-flex items-center whitespace-nowrap transition-colors ${
                pill === "Explore"
                  ? "border-[1.5px] border-ink bg-white text-ink"
                  : "border border-[rgba(33,29,24,.1)] bg-pill text-ink hover:border-ink"
              }`}
            >
              <span className="text-maroon mr-1.5">◆</span>Explore
            </button>
            {filtered.map((s) => (
              <Link
                key={s.slug}
                href={s.href}
                onClick={() => setPill(s.name)}
                className={`flex-none font-serif text-[14px] sm:text-[15px] px-4 py-2 sm:px-5 sm:py-2.5 rounded-full inline-flex items-center whitespace-nowrap transition-colors ${
                  pill === s.name
                    ? "border-[1.5px] border-ink bg-white text-ink"
                    : "border border-[rgba(33,29,24,.1)] bg-pill text-ink hover:border-ink"
                }`}
              >
                {s.name}
              </Link>
            ))}
          </div>
        )}

        {/* Full list view */}
        {tab === "list" && (
          <div>
            <div className="mt-7 sm:mt-9 mb-1 flex items-baseline justify-between">
              <span className="font-mono font-semibold text-[11px] sm:text-[12px] tracking-[0.14em] uppercase text-maroon">
                Browse subjects
              </span>
              <span className="font-serif italic text-[13px] sm:text-[14px] text-muted">
                {subjects.length} fields
              </span>
            </div>
            {filtered.map((s, i) => (
              <Link
                key={s.slug}
                href={s.href}
                className="flex justify-between items-center py-4 sm:py-5 border-t border-line group"
              >
                <span className="font-serif font-medium text-[18px] sm:text-[21px]">
                  <span className="font-mono text-[12px] text-numeral mr-4">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  {s.name}
                </span>
                <span className="font-serif text-[13px] sm:text-[14px] text-whisper group-hover:text-maroon transition-colors">
                  {s.themeCount} themes&nbsp;›
                </span>
              </Link>
            ))}
            {filtered.length === 0 && (
              <p className="py-8 font-serif italic text-[14px] text-faint">
                No subjects match “{query}”.
              </p>
            )}
          </div>
        )}
      </div>
    </main>
  );
}
