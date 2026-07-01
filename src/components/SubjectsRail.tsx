import Link from "next/link";

export interface RailSubject {
  name: string;
  slug: string;
  href: string;
}

// Left rail — top-level subjects (History, Mathematics, …).
export function SubjectsRail({
  subjects,
  activeSlug,
}: {
  subjects: RailSubject[];
  activeSlug: string;
}) {
  return (
    <nav className="text-[14px]">
      <div className="font-mono font-semibold text-[10px] tracking-[0.12em] uppercase text-whisper">
        Subjects
      </div>
      <ul className="mt-3 space-y-1">
        {subjects.map((s) => {
          const active = s.slug === activeSlug;
          return (
            <li key={s.slug}>
              <Link
                href={s.href}
                className={`block font-sans text-[15px] py-1.5 transition-colors ${
                  active ? "text-maroon font-semibold" : "text-ink hover:text-maroon"
                }`}
              >
                {s.name}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
