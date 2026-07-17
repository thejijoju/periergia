"use client";

import { useState } from "react";
import { TopicSearch } from "./TopicSearch";
import { t } from "@/lib/i18n";
import type { SearchItem } from "@/lib/types";

// Header search that starts as a small, discreet icon and expands into a full
// search field when clicked (FlutterFlow-docs style). Collapses back to the
// icon when it loses focus while empty.
export function HeaderSearch({
  searchIndex,
  lang = "en",
}: {
  searchIndex: SearchItem[];
  lang?: string;
}) {
  const [open, setOpen] = useState(false);

  if (!open) {
    return (
      <button
        type="button"
        onClick={() => setOpen(true)}
        aria-label={t(lang, "searchTopic")}
        className="grid place-items-center h-9 w-9 rounded-full text-muted hover:text-purple hover:bg-purple-soft transition-colors"
      >
        <svg width="17" height="17" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.6">
          <circle cx="7" cy="7" r="5" />
          <line x1="11" y1="11" x2="15" y2="15" strokeLinecap="round" />
        </svg>
      </button>
    );
  }

  return (
    <div className="w-full max-w-[420px]">
      <TopicSearch
        searchIndex={searchIndex}
        autoFocus
        onClose={() => setOpen(false)}
        lang={lang}
      />
    </div>
  );
}
