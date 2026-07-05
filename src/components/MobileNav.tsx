"use client";

import { useEffect, useState } from "react";
import { createPortal } from "react-dom";
import { SubjectTree, type TreeItem, type SubjectLink } from "./SubjectTree";

// Mobile-only navigation. On desktop the full syllabus tree lives in the left
// rail; on a phone that rail is hidden, so tapping a subject would strand the
// reader on a deep leaf with no way to see the rest of the tree. This puts the
// same tree behind a hamburger: a slide-in drawer that shows where you are
// (the active node is highlighted, its ancestors pre-expanded) and lets you
// jump anywhere — including switching subjects via the dropdown at the top.
export function MobileNav({
  subjectName,
  subjectSlug,
  subjectHref,
  subjects,
  items,
  activeId,
}: {
  subjectName: string;
  subjectSlug: string;
  subjectHref: string;
  subjects: SubjectLink[];
  items: TreeItem[];
  activeId: string;
}) {
  const [open, setOpen] = useState(false);
  // Portal the drawer to <body>: the sticky header uses backdrop-blur, and a
  // backdrop-filter ancestor becomes the containing block for position:fixed
  // children — which would otherwise trap the full-screen overlay inside the
  // ~60px header. Portalling escapes that. Guarded so SSR doesn't touch document.
  const [mounted, setMounted] = useState(false);
  useEffect(() => setMounted(true), []);

  // Lock body scroll and close on Escape while the drawer is open.
  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    document.addEventListener("keydown", onKey);
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.removeEventListener("keydown", onKey);
      document.body.style.overflow = prev;
    };
  }, [open]);

  // Navigating to a new node re-renders the page with a new activeId — close.
  useEffect(() => {
    setOpen(false);
  }, [activeId]);

  return (
    <div className="lg:hidden">
      <button
        onClick={() => setOpen(true)}
        aria-label="Open navigation"
        aria-expanded={open}
        className="flex items-center justify-center w-9 h-9 -ml-1.5 rounded-lg text-ink hover:bg-pill transition-colors"
      >
        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round">
          <path d="M3 6h14M3 10h14M3 14h14" />
        </svg>
      </button>

      {mounted &&
        open &&
        createPortal(
          <div className="lg:hidden fixed inset-0 z-50">
            {/* Backdrop */}
            <button
              aria-label="Close navigation"
              onClick={() => setOpen(false)}
              className="absolute inset-0 bg-black/50"
            />
            {/* Drawer */}
            <div className="absolute left-0 top-0 h-full w-[86%] max-w-[340px] bg-card border-r border-line shadow-2xl shadow-black/40 flex flex-col">
              <div className="flex items-center justify-between px-4 h-14 border-b border-line shrink-0">
                <span className="font-sans font-semibold text-[15px] text-ink">Browse</span>
                <button
                  onClick={() => setOpen(false)}
                  aria-label="Close navigation"
                  className="flex items-center justify-center w-9 h-9 -mr-1.5 rounded-lg text-muted hover:bg-pill transition-colors"
                >
                  <svg width="18" height="18" viewBox="0 0 18 18" fill="none" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round">
                    <path d="M4 4l10 10M14 4L4 14" />
                  </svg>
                </button>
              </div>
              <div className="flex-1 overflow-y-auto px-4 py-4">
                <SubjectTree
                  subjectName={subjectName}
                  subjectSlug={subjectSlug}
                  subjectHref={subjectHref}
                  subjects={subjects}
                  items={items}
                  activeId={activeId}
                />
              </div>
            </div>
          </div>,
          document.body,
        )}
    </div>
  );
}
