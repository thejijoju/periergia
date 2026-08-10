"use client";

import { useMemo, useState } from "react";
import {
  cardsFromBody,
  downloadText,
  fileStem,
  toAnkiTsv,
  toStudyMarkdown,
  type ExportMeta,
} from "@/lib/exports";

// ── Take it with you ──────────────────────────────────────────────────────
// One-click study assets for the article on screen: an Anki-importable deck
// mined from the inline checkpoints and worked problems, Markdown notes, and a
// print view the browser saves as PDF. Everything is produced in the browser
// from the body already rendered, so the download always matches the depth and
// level the reader chose, and no server round trip is involved.

function track(name: string, nodeId: string, title: string, extra?: Record<string, unknown>) {
  try {
    const body = JSON.stringify({
      name,
      nodeId,
      title,
      path: typeof window !== "undefined" ? window.location.pathname : null,
      ...extra,
    });
    const blob = new Blob([body], { type: "application/json" });
    if (navigator.sendBeacon?.("/api/track", blob)) return;
    fetch("/api/track", {
      method: "POST",
      body,
      headers: { "Content-Type": "application/json" },
      keepalive: true,
    }).catch(() => {});
  } catch {
    /* analytics must never break the UI */
  }
}

export function StudyExports({
  body,
  nodeId,
  title,
  depth,
  level,
}: {
  body: string;
  nodeId: string;
  title: string;
  depth?: string;
  level?: string;
}) {
  const [done, setDone] = useState<string | null>(null);

  // Card count is worth showing: it tells the reader what they're getting, and
  // an article with no checkpoints or problems honestly offers no deck.
  const cardCount = useMemo(() => cardsFromBody(body).length, [body]);
  const stem = useMemo(() => fileStem(title), [title]);

  if (!body.trim()) return null;

  const meta: ExportMeta = {
    title,
    nodeId,
    url: typeof window !== "undefined" ? window.location.href : `https://periergia.com`,
    depth,
    level,
  };

  const flash = (label: string) => {
    setDone(label);
    setTimeout(() => setDone((d) => (d === label ? null : d)), 2200);
  };

  const anki = () => {
    downloadText(`${stem}-anki.txt`, toAnkiTsv(body, meta), "text/tab-separated-values");
    track("export_anki", nodeId, title, { cards: cardCount });
    flash("anki");
  };

  const markdown = () => {
    downloadText(`${stem}.md`, toStudyMarkdown(body, meta), "text/markdown");
    track("export_markdown", nodeId, title);
    flash("markdown");
  };

  const pdf = () => {
    track("export_pdf", nodeId, title);
    flash("pdf");
    // The print stylesheet strips the rails, controls and interactive widgets;
    // "Save as PDF" in the browser's print dialogue produces the file. This
    // beats shipping a PDF renderer for a document whose typography is already
    // defined in CSS — and it prints correctly at any paper size.
    window.print();
  };

  return (
    <>
    {/* Provenance for the printed copy only: the print stylesheet strips links
        and chrome, so without this a saved PDF has no way back to its source. */}
    <p className="hidden print:block mt-6 font-sans text-[9pt] text-ink">
      Periergia &middot; {meta.url}
    </p>

    <div className="mt-6 rounded-2xl border border-line bg-card px-5 py-4 print:hidden">
      <div className="flex flex-wrap items-baseline justify-between gap-x-3 gap-y-1">
        <span className="font-mono text-[10px] font-semibold uppercase tracking-[0.12em] text-whisper">
          Take it with you
        </span>
        {cardCount > 0 && (
          <span className="font-sans text-[12px] text-faint">
            {cardCount} card{cardCount === 1 ? "" : "s"} from this chapter&rsquo;s checkpoints and problems
          </span>
        )}
      </div>

      <div className="mt-3 flex flex-wrap gap-2">
        {cardCount > 0 && (
          <ExportButton onClick={anki} active={done === "anki"} label="Anki deck" done="Downloaded">
            <path d="M3 4.5h10M3 8h10M3 11.5h6" strokeLinecap="round" />
          </ExportButton>
        )}
        <ExportButton onClick={markdown} active={done === "markdown"} label="Markdown notes" done="Downloaded">
          <path d="M8 2.5v8m0 0L5 7.5m3 3 3-3M3 13h10" strokeLinecap="round" strokeLinejoin="round" />
        </ExportButton>
        <ExportButton onClick={pdf} active={done === "pdf"} label="PDF / print" done="Opening…">
          <path d="M4.5 6V2.5h7V6M4.5 11.5H3V6h10v5.5h-1.5M4.5 9.5h7v4h-7z" strokeLinejoin="round" />
        </ExportButton>
      </div>

      <p className="mt-2.5 font-sans text-[12px] leading-relaxed text-faint">
        The Anki file imports directly &mdash; File &rsaquo; Import in Anki; deck, note type and
        columns are set in the file. PDF uses your browser&rsquo;s print dialogue: choose
        &ldquo;Save as PDF&rdquo;.
      </p>
    </div>
    </>
  );
}

function ExportButton({
  onClick,
  active,
  label,
  done,
  children,
}: {
  onClick: () => void;
  active: boolean;
  label: string;
  done: string;
  children: React.ReactNode;
}) {
  return (
    <button
      onClick={onClick}
      className="inline-flex items-center gap-1.5 rounded-full border border-line bg-page px-3.5 py-1.5 font-sans text-[12.5px] text-ink transition-colors hover:border-ink"
    >
      <svg width="13" height="13" viewBox="0 0 16 16" fill="none" stroke="currentColor" strokeWidth="1.3" className="text-maroon">
        {children}
      </svg>
      {active ? done : label}
    </button>
  );
}
