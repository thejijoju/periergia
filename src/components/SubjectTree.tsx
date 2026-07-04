"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";

// A node in the left-rail syllabus tree. Recursive, so it supports any depth
// (Subject → sub-subject → topic → sub-topic → …).
export interface TreeItem {
  id: string;
  title: string;
  href: string;
  children: TreeItem[];
}

// A switchable subject in the header dropdown.
export interface SubjectLink {
  name: string;
  slug: string;
  href: string;
}

function contains(item: TreeItem, id: string): boolean {
  return item.id === id || item.children.some((c) => contains(c, id));
}

// Left-rail syllabus tree for the current subject. The current location is
// highlighted in purple; every ancestor of it starts expanded. The subject
// name is a dropdown that jumps to any other subject.
export function SubjectTree({
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
  return (
    <nav className="text-[14px]">
      <SubjectSwitcher
        currentName={subjectName}
        currentSlug={subjectSlug}
        currentHref={subjectHref}
        subjects={subjects}
      />
      <div className="mt-4 space-y-0.5">
        {items.map((it) => (
          <TreeRow key={it.id} item={it} activeId={activeId} depth={0} />
        ))}
      </div>
    </nav>
  );
}

function SubjectSwitcher({
  currentName,
  currentSlug,
  currentHref,
  subjects,
}: {
  currentName: string;
  currentSlug: string;
  currentHref: string;
  subjects: SubjectLink[];
}) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  // Close on outside click or Escape.
  useEffect(() => {
    if (!open) return;
    const onDown = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    document.addEventListener("mousedown", onDown);
    document.addEventListener("keydown", onKey);
    return () => {
      document.removeEventListener("mousedown", onDown);
      document.removeEventListener("keydown", onKey);
    };
  }, [open]);

  return (
    <div ref={ref} className="relative">
      <button
        onClick={() => setOpen((o) => !o)}
        aria-haspopup="listbox"
        aria-expanded={open}
        className="group flex w-full items-center gap-1.5 text-left font-sans font-bold text-[16px] tracking-[-0.01em] text-ink hover:text-purple transition-colors"
      >
        <span className="min-w-0 truncate">{currentName}</span>
        <svg
          width="14"
          height="14"
          viewBox="0 0 12 12"
          fill="none"
          stroke="currentColor"
          strokeWidth="1.7"
          className={`shrink-0 text-whisper group-hover:text-purple transition-transform ${open ? "rotate-180" : ""}`}
        >
          <path d="M3 4.5 6 7.5 9 4.5" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      </button>

      {open && (
        <div
          role="listbox"
          className="absolute left-0 top-full z-30 mt-1.5 w-[230px] max-h-[60vh] overflow-y-auto rounded-xl border border-line bg-page shadow-lg shadow-black/5 py-1.5"
        >
          {subjects.map((s) => {
            const active = s.slug === currentSlug;
            return (
              <Link
                key={s.slug}
                href={active ? currentHref : s.href}
                onClick={() => setOpen(false)}
                role="option"
                aria-selected={active}
                className={`block px-3.5 py-1.5 font-sans text-[13.5px] transition-colors ${
                  active
                    ? "text-purple font-semibold bg-purple-soft/50"
                    : "text-ink hover:bg-pill"
                }`}
              >
                {s.name}
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}

function TreeRow({
  item,
  activeId,
  depth,
}: {
  item: TreeItem;
  activeId: string;
  depth: number;
}) {
  const hasChildren = item.children.length > 0;
  // open if this branch leads to the active node
  const onPath = hasChildren && item.children.some((c) => contains(c, activeId));
  const [open, setOpen] = useState(onPath);
  const active = item.id === activeId;

  const size = depth === 0 ? "text-[14px] font-semibold" : depth === 1 ? "text-[13.5px]" : "text-[13px]";
  const rest =
    depth === 0 ? "text-ink hover:text-purple" : "text-muted hover:text-ink";

  return (
    <div>
      <div className="flex items-center gap-1">
        <Link
          href={item.href}
          className={`flex-1 py-1.5 font-sans ${size} transition-colors ${
            active ? "text-purple font-medium" : rest
          }`}
        >
          {item.title}
        </Link>
        {hasChildren && (
          <button
            onClick={() => setOpen((o) => !o)}
            aria-label={open ? "Collapse" : "Expand"}
            className="p-1 text-whisper hover:text-ink"
          >
            <svg
              width="12"
              height="12"
              viewBox="0 0 12 12"
              fill="none"
              stroke="currentColor"
              strokeWidth="1.6"
              className={`transition-transform ${open ? "rotate-180" : ""}`}
            >
              <path d="M3 4.5 6 7.5 9 4.5" strokeLinecap="round" strokeLinejoin="round" />
            </svg>
          </button>
        )}
      </div>

      {hasChildren && open && (
        <div className="ml-1 border-l border-line pl-2 space-y-0.5">
          {item.children.map((c) => (
            <TreeRow key={c.id} item={c} activeId={activeId} depth={depth + 1} />
          ))}
        </div>
      )}
    </div>
  );
}
