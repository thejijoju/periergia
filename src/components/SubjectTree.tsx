"use client";

import { useState } from "react";
import Link from "next/link";

export interface TreeTopic {
  id: string;
  title: string;
  href: string;
}

export interface TreeGroup {
  id: string;
  title: string;
  href: string;
  topics: TreeTopic[];
}

// Left-rail syllabus tree for the current subject:
// Subject → sub-subjects (collapsible) → topics. The current location is
// highlighted in purple; the sub-subject containing it starts expanded.
export function SubjectTree({
  subjectName,
  subjectHref,
  groups,
  activeId,
}: {
  subjectName: string;
  subjectHref: string;
  groups: TreeGroup[];
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
        {groups.map((g) => (
          <Group key={g.id} group={g} activeId={activeId} />
        ))}
      </div>
    </nav>
  );
}

function Group({ group, activeId }: { group: TreeGroup; activeId: string }) {
  const hasActive = group.id === activeId || group.topics.some((t) => t.id === activeId);
  const [open, setOpen] = useState(hasActive);
  const groupActive = group.id === activeId;

  return (
    <div>
      <div className="flex items-center gap-1">
        <Link
          href={group.href}
          className={`flex-1 py-1.5 font-sans font-semibold text-[14px] transition-colors ${
            groupActive ? "text-purple" : "text-ink hover:text-purple"
          }`}
        >
          {group.title}
        </Link>
        {group.topics.length > 0 && (
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

      {open && group.topics.length > 0 && (
        <ul className="ml-1 border-l border-line">
          {group.topics.map((t) => {
            const active = t.id === activeId;
            return (
              <li key={t.id}>
                <Link
                  href={t.href}
                  className={`block py-1 pl-3 -ml-px text-[13.5px] transition-colors ${
                    active
                      ? "text-purple font-medium border-l-2 border-purple"
                      : "text-muted hover:text-ink border-l-2 border-transparent"
                  }`}
                >
                  {t.title}
                </Link>
              </li>
            );
          })}
        </ul>
      )}
    </div>
  );
}
