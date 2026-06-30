import Link from "next/link";

export interface TreeItem {
  id: string;
  title: string;
  href: string;
  depth: number; // 0 = chapter
  isLeaf: boolean;
}

// Right rail — your position in the subject's syllabus (docs-style sub-tree).
export function SyllabusTree({
  subjectName,
  items,
  activeId,
}: {
  subjectName: string;
  items: TreeItem[];
  activeId: string;
}) {
  return (
    <nav className="text-[13px]">
      <div className="font-mono font-semibold text-[10px] tracking-[0.12em] uppercase text-whisper">
        {subjectName}
      </div>
      <ul className="mt-3 space-y-0.5">
        {items.map((it) => {
          const active = it.id === activeId;
          return (
            <li key={it.id} style={{ paddingLeft: `${it.depth * 14}px` }}>
              {it.isLeaf ? (
                <Link
                  href={it.href}
                  className={`block font-serif py-1 border-l-2 pl-3 -ml-px transition-colors ${
                    active
                      ? "border-maroon text-maroon font-medium"
                      : "border-transparent text-muted hover:text-ink"
                  }`}
                >
                  {it.title}
                </Link>
              ) : (
                <div className="font-serif text-[13px] py-1 pl-3 text-ink font-medium">
                  {it.title}
                </div>
              )}
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
