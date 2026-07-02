"use client";

import { useState } from "react";
import Link from "next/link";

// A node in the left-rail syllabus tree. Recursive, so it supports any depth
// (Subject → sub-subject → topic → sub-topic → …).
export interface TreeItem {
  id: string;
  title: string;
  href: string;
  children: TreeItem[];
}

function contains(item: TreeItem, id: string): boolean {
  return item.id === id || item.children.some((c) => contains(c, id));
}

// Left-rail syllabus tree for the current subject. The current location is
// highlighted in purple; every ancestor of it starts expanded.
export function SubjectTree({
  subjectName,
  subjectHref,
  items,
  activeId,
}: {
  subjectName: string;
  subjectHref: string;
  items: TreeItem[];
  activeId: string;
}) {
  return (
    <nav className="text-[14px]">
      <Link
        href={subjectHref}
        className="block font-sans font-bold text-[16px] tracking-[-0.01em] text-ink hover:text-purple transition-colors"
      >
        {subjectName}
      </Link>
      <div className="mt-4 space-y-0.5">
        {items.map((it) => (
          <TreeRow key={it.id} item={it} activeId={activeId} depth={0} />
        ))}
      </div>
    </nav>
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
