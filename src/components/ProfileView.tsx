import Link from "next/link";
import { accountTypeLabel, type Profile, type ProfileEntry } from "@/lib/accountTypes";

// The CV-style profile page body. Plain (no hooks) so both the server page
// and the owner's private-profile fallback can render it.

export interface ProgressGroup {
  subject: string;
  items: { id: string; title: string; href: string; completed: boolean }[];
}

function years(e: ProfileEntry): string {
  if (!e.start_year && !e.end_year) return "";
  return `${e.start_year ?? ""}–${e.end_year ?? "present"}`;
}

/** Only http(s) links are rendered as links. */
function safeUrl(u: string | null): string | null {
  return u && /^https?:\/\/\S+$/i.test(u) ? u : null;
}

function Entries({ title, list }: { title: string; list: ProfileEntry[] }) {
  if (!list.length) return null;
  return (
    <section className="mt-10">
      <h2 className="font-serif text-[22px]">{title}</h2>
      <ol className="mt-3 flex flex-col gap-5 border-l border-line pl-5">
        {list.map((e, i) => (
          <li key={e.id ?? i}>
            <div className="font-sans text-[15px] font-semibold">{e.title}</div>
            <div className="font-sans text-[14px]">{e.organisation}</div>
            <div className="font-sans text-[13px] text-muted">
              {[years(e), e.location].filter(Boolean).join(" · ")}
            </div>
            {e.description && (
              <p className="mt-1.5 font-serif text-[15.5px] leading-relaxed whitespace-pre-line">{e.description}</p>
            )}
          </li>
        ))}
      </ol>
    </section>
  );
}

export function ProfileView({
  profile,
  entries,
  progress,
  counts,
  memberSince,
  ownerSlot,
}: {
  profile: Profile;
  entries: ProfileEntry[];
  progress: ProgressGroup[] | null;
  counts: { read: number; passed: number } | null;
  memberSince?: string;
  ownerSlot?: React.ReactNode;
}) {
  const website = safeUrl(profile.website);
  const sub = [profile.field, profile.institution].filter(Boolean).join(" · ");
  return (
    <article>
      <header className="flex items-start gap-4">
        <div className="shrink-0 w-16 h-16 sm:w-20 sm:h-20 rounded-full bg-pill flex items-center justify-center font-serif text-[28px] sm:text-[34px]">
          {profile.display_name.charAt(0).toUpperCase()}
        </div>
        <div className="min-w-0 flex-1">
          <h1 className="font-serif text-[28px] sm:text-[34px] leading-tight break-words">{profile.display_name}</h1>
          <div className="mt-1 flex flex-wrap items-center gap-2">
            <span className="rounded-full border border-line px-2.5 py-0.5 font-sans text-[12px] text-muted">
              {accountTypeLabel(profile.account_type)}
            </span>
            {!profile.is_public && (
              <span className="rounded-full bg-pill px-2.5 py-0.5 font-sans text-[12px] text-muted">Private — only you can see this</span>
            )}
          </div>
          {profile.headline && <p className="mt-2 font-sans text-[15px]">{profile.headline}</p>}
          {sub && <p className="mt-1 font-sans text-[14px] text-muted">{sub}</p>}
          <p className="mt-1 font-sans text-[13px] text-faint">
            {[profile.location, memberSince ? `Member since ${memberSince}` : null].filter(Boolean).join(" · ")}
            {website && (
              <>
                {" · "}
                <a href={website} rel="nofollow noopener noreferrer ugc" target="_blank" className="underline hover:text-ink">
                  {website.replace(/^https?:\/\//i, "").replace(/\/$/, "")}
                </a>
              </>
            )}
          </p>
        </div>
        {ownerSlot}
      </header>

      {profile.bio && (
        <section className="mt-10">
          <h2 className="font-serif text-[22px]">About</h2>
          <p className="mt-2 font-serif text-[16.5px] leading-relaxed whitespace-pre-line">{profile.bio}</p>
        </section>
      )}

      {profile.skills.length > 0 && (
        <section className="mt-10">
          <h2 className="font-serif text-[22px]">Interests and skills</h2>
          <ul className="mt-3 flex flex-wrap gap-2">
            {profile.skills.map((s) => (
              <li key={s} className="rounded-full border border-line px-3 py-1 font-sans text-[13px]">
                {s}
              </li>
            ))}
          </ul>
        </section>
      )}

      <Entries title="Education" list={entries.filter((e) => e.kind === "education")} />
      <Entries title="Experience" list={entries.filter((e) => e.kind === "experience")} />

      {counts && (
        <section className="mt-10">
          <h2 className="font-serif text-[22px]">Learning on Periergia</h2>
          <p className="mt-2 font-sans text-[14px] text-muted">
            {counts.read} {counts.read === 1 ? "lesson" : "lessons"} read · {counts.passed}{" "}
            {counts.passed === 1 ? "checkpoint" : "checkpoints"} passed
          </p>
          {progress?.map((g) => (
            <div key={g.subject} className="mt-5">
              <h3 className="font-sans text-[13px] uppercase tracking-wide text-muted">{g.subject}</h3>
              <ul className="mt-2 flex flex-col gap-1.5">
                {g.items.map((it) => (
                  <li key={it.id} className="font-sans text-[14.5px] flex items-baseline gap-2">
                    <span aria-hidden className={it.completed ? "text-ink" : "text-faint"}>
                      {it.completed ? "✓" : "○"}
                    </span>
                    <Link href={it.href} className="hover:underline">
                      {it.title}
                    </Link>
                    {it.completed && <span className="font-sans text-[12px] text-muted">passed</span>}
                  </li>
                ))}
              </ul>
            </div>
          ))}
          {counts.read === 0 && (
            <p className="mt-2 font-sans text-[14px] text-faint">Nothing yet.</p>
          )}
        </section>
      )}
    </article>
  );
}
