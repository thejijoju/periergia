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
    <main className="min-h-screen bg-white text-ink">
      <div className="mx-auto max-w-[560px] px-6 pt-12 pb-16">
        {/* Brand */}
        <Wordmark size="lg" tagline />

        {/* Library strip */}
        <div className="relative mt-4 h-[44px] w-screen left-1/2 -translate-x-1/2 max-w-[560px] sm:rounded-none">
          <Image
            src="/library-strip.png"
            alt="A classical library"
            fill
            sizes="560px"
            className="object-cover"
            priority
          />
        </div>

        {/* Search */}
        <div className="mt-[30px]">
          <SearchBar value={query} onChange={setQuery} />
        </div>

        {/* Browse-mode toggle */}
        <div className="mt-[42px] flex gap-[22px] items-end border-b border-line">
          {(["pills", "list"] as Tab[]).map((t) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              className={`font-serif text-[12px] pb-2 -mb-px border-b-2 ${
                tab === t
                  ? "font-semibold text-ink border-maroon"
                  : "font-normal text-whisper border-transparent"
              }`}
            >
              {t === "pills" ? "Quick pills" : "Full list"}
            </button>
          ))}
        </div>

        {/* Pills view */}
        {tab === "pills" && (
          <div className="mt-[18px] flex flex-wrap gap-[6px] items-center">
            <button
              onClick={() => setPill("Explore")}
              className={`flex-none font-serif text-[10.5px] px-[10px] py-[4px] rounded-full inline-flex items-center whitespace-nowrap transition-colors ${
                pill === "Explore"
                  ? "border-[1.1px] border-ink bg-white text-ink"
                  : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
              }`}
            >
              <span className="text-maroon mr-1">◆</span>Explore
            </button>
            {filtered.map((s) => (
              <Link
                key={s.slug}
                href={s.href}
                onClick={() => setPill(s.name)}
                className={`flex-none font-serif text-[10.5px] px-[10px] py-[4px] rounded-full inline-flex items-center whitespace-nowrap transition-colors ${
                  pill === s.name
                    ? "border-[1.1px] border-ink bg-white text-ink"
                    : "border border-[rgba(33,29,24,.08)] bg-pill text-ink"
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
            <div className="mt-[18px] mb-[2px] flex items-baseline justify-between">
              <span className="font-mono font-semibold text-[11px] tracking-[0.14em] uppercase text-maroon">
                Browse subjects
              </span>
              <span className="font-serif italic text-[12px] text-muted">
                {subjects.length} fields
              </span>
            </div>
            {filtered.map((s, i) => (
              <Link
                key={s.slug}
                href={s.href}
                className="flex justify-between items-center py-[10px] border-t border-line group"
              >
                <span className="font-serif font-medium text-[16px]">
                  <span className="font-mono text-[11px] text-numeral mr-[11px]">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  {s.name}
                </span>
                <span className="font-serif text-[12px] text-whisper group-hover:text-maroon transition-colors">
                  {s.themeCount} themes&nbsp;›
                </span>
              </Link>
            ))}
            {filtered.length === 0 && (
              <p className="py-6 font-serif italic text-[13px] text-faint">
                No subjects match “{query}”.
              </p>
            )}
          </div>
        )}
      </div>
    </main>
  );
}
