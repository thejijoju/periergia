import Link from "next/link";
import { accountTypeLabel, type Profile, type ProfileEntry } from "@/lib/accountTypes";
import { ProfileTabs } from "./ProfileTabs";

// The CV-style profile page: an identity card (photo, name, current degree,
// university, previous studies, counts) beside a sidebar (contact / follow,
// networks, recent activity), then tabs for the CV and learning progress.
// Plain (no hooks) so the server page and the owner's private fallback can
// both render it; interactive parts are passed in as slots.

export interface ProgressGroup {
  subject: string;
  items: { id: string; title: string; href: string; completed: boolean }[];
}

export interface Activity {
  title: string;
  href: string;
  completed: boolean;
  when: string;
}

function years(e: ProfileEntry): string {
  if (!e.start_year && !e.end_year) return "";
  if (e.start_year && e.start_year === e.end_year) return String(e.start_year);
  return `${e.start_year ?? ""}–${e.end_year ?? "present"}`;
}

/** Only http(s) links are rendered as links. */
function safeUrl(u: string | null): string | null {
  return u && /^https?:\/\/\S+$/i.test(u) ? u : null;
}

const card = "rounded-2xl border border-line bg-card";
const sideHead = "font-sans text-[12px] uppercase tracking-wide text-muted";

function EntryList({ list }: { list: ProfileEntry[] }) {
  return (
    <ol className="mt-3 flex flex-col gap-5 border-l border-line pl-5">
      {list.map((e, i) => (
        <li key={e.id ?? i}>
          <div className="font-sans text-[15px] font-semibold">{e.title}</div>
          <div className="font-sans text-[14px]">{e.organisation}</div>
          <div className="font-sans text-[13px] text-muted">{[years(e), e.location].filter(Boolean).join(" · ")}</div>
          {e.description && (
            <p className="mt-1.5 font-serif text-[15.5px] leading-relaxed whitespace-pre-line">{e.description}</p>
          )}
        </li>
      ))}
    </ol>
  );
}

export function ProfileView({
  profile,
  entries,
  progress,
  counts,
  stats,
  activity,
  memberSince,
  actionSlot,
}: {
  profile: Profile;
  entries: ProfileEntry[];
  progress: ProgressGroup[] | null;
  counts: { read: number; passed: number } | null;
  stats?: { followers: number; following: number; publications: number };
  activity?: Activity[];
  memberSince?: string;
  /** Follow / Edit profile buttons (client components). */
  actionSlot?: React.ReactNode;
}) {
  const website = safeUrl(profile.website);
  const education = entries.filter((e) => e.kind === "education");
  const experience = entries.filter((e) => e.kind === "experience");
  // "Previous": the most recent finished education entry.
  const previous = education
    .filter((e) => e.end_year)
    .sort((a, b) => (b.end_year ?? 0) - (a.end_year ?? 0))[0];
  const latestJob = experience[0];
  const networks = Array.from(
    new Set([profile.institution, ...entries.map((e) => e.organisation)].filter((x): x is string => Boolean(x))),
  ).slice(0, 8);

  const cv = (
    <div>
      {latestJob && (
        <section className={`${card} p-4`}>
          <div className={sideHead}>Latest experience</div>
          <div className="mt-2 font-sans text-[15px] font-semibold">{latestJob.title}</div>
          <div className="font-sans text-[14px]">{latestJob.organisation}</div>
          <div className="font-sans text-[13px] text-muted">{[years(latestJob), latestJob.location].filter(Boolean).join(" · ")}</div>
        </section>
      )}
      {profile.bio && (
        <section className="mt-8">
          <h2 className="font-serif text-[22px]">About</h2>
          <p className="mt-2 font-serif text-[16.5px] leading-relaxed whitespace-pre-line">{profile.bio}</p>
        </section>
      )}
      {education.length > 0 && (
        <section className="mt-8">
          <h2 className="font-serif text-[22px]">Education</h2>
          <EntryList list={education} />
        </section>
      )}
      {experience.length > 0 && (
        <section className="mt-8">
          <h2 className="font-serif text-[22px]">Experience</h2>
          <EntryList list={experience} />
        </section>
      )}
      {profile.skills.length > 0 && (
        <section className="mt-8">
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
      {!profile.bio && !entries.length && !profile.skills.length && (
        <p className="font-sans text-[14px] text-faint">No CV details yet.</p>
      )}
    </div>
  );

  const learning = counts ? (
    <div>
      <p className="font-sans text-[14px] text-muted">
        {counts.read} {counts.read === 1 ? "lesson" : "lessons"} read · {counts.passed}{" "}
        {counts.passed === 1 ? "checkpoint" : "checkpoints"} passed
      </p>
      {progress?.map((g) => (
        <div key={g.subject} className="mt-5">
          <h3 className={sideHead}>{g.subject}</h3>
          <ul className="mt-2 flex flex-col gap-1.5">
            {g.items.map((it) => (
              <li key={it.id} className="font-sans text-[14.5px] flex items-baseline gap-2">
                <span aria-hidden className={it.completed ? "text-ink" : "text-faint"}>
                  {it.completed ? "✓" : "○"}
                </span>
                <Link href={it.href} className="hover:underline">
                  {it.title}
                </Link>
                {it.completed && <span className="text-[12px] text-muted">passed</span>}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  ) : (
    <p className="font-sans text-[14px] text-faint">Learning progress is private.</p>
  );

  return (
    <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_260px]">
      <div className="min-w-0">
        {/* Identity card */}
        <section className={`${card} p-5 sm:p-6`}>
          <div className="flex flex-col sm:flex-row gap-5">
            <div className="shrink-0 flex flex-col items-center sm:items-start">
              {profile.avatar_url ? (
                // eslint-disable-next-line @next/next/no-img-element
                <img
                  src={profile.avatar_url}
                  alt={profile.display_name}
                  className="w-36 h-44 object-cover rounded-lg border border-line"
                />
              ) : (
                <div className="w-36 h-44 rounded-lg border border-line bg-pill flex items-center justify-center font-serif text-[52px]">
                  {profile.display_name.charAt(0).toUpperCase()}
                </div>
              )}
              {memberSince && <div className="mt-2 font-sans text-[12px] text-faint">Member since {memberSince}</div>}
            </div>
            <div className="min-w-0 flex-1">
              <div className="flex flex-wrap items-baseline gap-x-3">
                <h1 className="font-serif text-[30px] sm:text-[34px] leading-tight break-words">{profile.display_name}</h1>
                {!profile.is_public && (
                  <span className="rounded-full bg-pill px-2.5 py-0.5 font-sans text-[12px] text-muted">Private</span>
                )}
              </div>
              <div className="font-sans text-[14px] text-muted">{accountTypeLabel(profile.account_type)}</div>
              <div className="mt-3 h-px bg-line" />
              {(profile.degree || profile.field) && (
                <div className="mt-3 font-sans text-[16px]">
                  {profile.degree && <span className="font-semibold">{profile.degree}</span>}
                  {profile.degree && profile.field && <span className="mx-2" />}
                  {profile.field}
                </div>
              )}
              {profile.institution && <div className="font-sans text-[14.5px]">{profile.institution}</div>}
              {profile.location && <div className="mt-0.5 font-sans text-[13px] text-muted">{profile.location}</div>}
              {profile.headline && <p className="mt-3 font-serif text-[16px] leading-snug">{profile.headline}</p>}
              {previous && (
                <div className="mt-3 font-sans text-[13px]">
                  <span className="text-faint">Previously </span>
                  <span className="font-medium">{previous.title}</span>
                  <span className="text-muted"> · {previous.organisation}</span>
                </div>
              )}
              {website && (
                <a
                  href={website}
                  rel="nofollow noopener noreferrer ugc"
                  target="_blank"
                  className="mt-2 inline-block font-sans text-[13px] text-muted underline hover:text-ink"
                >
                  {website.replace(/^https?:\/\//i, "").replace(/\/$/, "")}
                </a>
              )}
              {stats && (
                <dl className="mt-5 grid grid-cols-3 max-w-sm text-center">
                  {(
                    [
                      ["Followers", stats.followers],
                      ["Following", stats.following],
                      ["Publications", stats.publications],
                    ] as const
                  ).map(([k, v]) => (
                    <div key={k} className="border-r border-line last:border-r-0">
                      <dt className="font-sans text-[12px] text-muted">{k}</dt>
                      <dd className="font-sans text-[20px] text-ink">{v}</dd>
                    </div>
                  ))}
                </dl>
              )}
            </div>
          </div>
        </section>

        <div className="mt-6">
          <ProfileTabs
            tabs={[
              { id: "cv", label: "CV", content: cv },
              { id: "learning", label: "Learning", content: learning },
            ]}
          />
        </div>
      </div>

      {/* Sidebar */}
      <aside className="flex flex-col gap-4">
        <div className={`${card} p-4 flex flex-col gap-2`}>
          {actionSlot}
          {profile.contact_email && (
            <a
              href={`mailto:${profile.contact_email}`}
              className="text-center rounded-full border border-line px-4 py-2 font-sans text-[13.5px] hover:border-ink"
            >
              ✉ Contact me
            </a>
          )}
        </div>
        {networks.length > 0 && (
          <div className={`${card} p-4`}>
            <div className={sideHead}>Networks</div>
            <ul className="mt-2 flex flex-col gap-1 font-sans text-[13.5px]">
              {networks.map((n) => (
                <li key={n}>{n}</li>
              ))}
            </ul>
          </div>
        )}
        {activity && activity.length > 0 && (
          <div className={`${card} p-4`}>
            <div className={sideHead}>Recent activity</div>
            <ul className="mt-2 flex flex-col gap-2 font-sans text-[13px]">
              {activity.map((a) => (
                <li key={a.href}>
                  <span className="text-muted">{a.completed ? "Passed " : "Read "}</span>
                  <Link href={a.href} className="hover:underline">
                    {a.title}
                  </Link>
                  <div className="text-[11.5px] text-faint">{a.when}</div>
                </li>
              ))}
            </ul>
          </div>
        )}
      </aside>
    </div>
  );
}
