"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { SearchBar } from "./SearchBar";
import type { SearchItem } from "@/lib/types";

// Search-any-topic box with a results dropdown. Enter or click jumps straight
// into that topic's reader. Used in the reader header (and could replace the
// home's inline results too).
export function TopicSearch({
  searchIndex,
  placeholder = "Search any topic…",
  size = "sm",
  autoFocus = false,
  onClose,
}: {
  searchIndex: SearchItem[];
  placeholder?: string;
  size?: "sm" | "lg";
  autoFocus?: boolean;
  onClose?: () => void;
}) {
  const router = useRouter();
  const [query, setQuery] = useState("");
  const [open, setOpen] = useState(false);
  const q = query.trim().toLowerCase();

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
    return [...starts.sort(leafFirst), ...includes.sort(leafFirst), ...ctxOnly].slice(0, 8);
  }, [q, searchIndex]);

  const go = (href: string) => {
    setQuery("");
    setOpen(false);
    router.push(href);
  };

  return (
    <div
      className="relative"
      onBlur={(e) => {
        // close only when focus leaves the whole widget
        if (!e.currentTarget.contains(e.relatedTarget as HTMLElement)) {
          setTimeout(() => setOpen(false), 120);
          onClose?.();
        }
      }}
    >
      <SearchBar
        value={query}
        onChange={(v) => {
          setQuery(v);
          setOpen(true);
        }}
        onSubmit={() => results[0] && go(results[0].href)}
        placeholder={placeholder}
        size={size}
        autoFocus={autoFocus}
      />
      {open && q && (
        <div className="absolute z-30 left-0 right-0 mt-2 bg-page border border-line rounded-2xl shadow-[0_12px_40px_-12px_rgba(0,0,0,.25)] overflow-hidden">
          {results.length === 0 ? (
            <p className="px-4 py-3 font-sans text-[13px] text-faint">
              No topics match “{query}”.
            </p>
          ) : (
            results.map((it) => (
              <button
                key={it.href}
                onClick={() => go(it.href)}
                className="block w-full text-left px-4 py-2.5 border-t border-line first:border-t-0 hover:bg-[rgba(0,0,0,0.03)] transition-colors"
              >
                <span className="font-sans text-[14px] text-ink">{it.title}</span>
                <span className="ml-2 font-sans text-[11px] text-whisper">{it.ctx}</span>
              </button>
            ))
          )}
        </div>
      )}
    </div>
  );
}
