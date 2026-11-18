"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { Wordmark } from "@/components/Wordmark";
import { authClient, useSession } from "@/lib/account";
import { ACCOUNT_TYPES, type AccountType, type Profile, type ProfileEntry } from "@/lib/accountTypes";

const HANDLE_RE = /^[a-z0-9][a-z0-9-]{2,29}$/;

function suggestHandle(name: string): string {
  const base = name
    .normalize("NFKD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .slice(0, 24);
  return base.length >= 3 ? base : "";
}

const emptyEntry = (kind: ProfileEntry["kind"], position: number): ProfileEntry => ({
  kind,
  title: "",
  organisation: "",
  location: null,
  start_year: null,
  end_year: null,
  description: null,
  position,
});

const input =
  "w-full rounded-xl border border-line bg-card px-3 py-2 font-sans text-[14.5px] text-ink outline-none focus:border-ink";
const label = "block font-sans text-[13px] text-muted mb-1";

function Field({
  name,
  hint,
  children,
}: {
  name: string;
  hint?: string;
  children: React.ReactNode;
}) {
  return (
    <div>
      <span className={label}>{name}</span>
      {children}
      {hint && <span className="mt-1 block font-sans text-[12px] text-faint">{hint}</span>}
    </div>
  );
}

export default function EditProfile() {
  const router = useRouter();
  const session = useSession();
  const [loaded, setLoaded] = useState(false);
  const [exists, setExists] = useState(false);
  const [p, setP] = useState<Omit<Profile, "id">>({
    handle: "",
    display_name: "",
    account_type: "independent",
    headline: "",
    bio: "",
    location: "",
    institution: "",
    field: "",
    website: "",
    skills: [],
    avatar_url: null,
    degree: "",
    contact_email: "",
    is_public: true,
    show_progress: true,
  });
  const [skillsText, setSkillsText] = useState("");
  const [entries, setEntries] = useState<ProfileEntry[]>([]);
  const [handleTouched, setHandleTouched] = useState(false);
  const [status, setStatus] = useState<"idle" | "saving" | "error">("idle");
  const [message, setMessage] = useState("");

  useEffect(() => {
    if (session === null) router.replace("/signin");
    if (!session) return;
    const sb = authClient()!;
    (async () => {
      const { data: prof } = await sb.from("profiles").select("*").eq("id", session.user.id).maybeSingle();
      if (prof) {
        setExists(true);
        setHandleTouched(true);
        setP({ ...(prof as Profile) });
        setSkillsText(((prof as Profile).skills ?? []).join(", "));
        const { data: ents } = await sb
          .from("profile_entries")
          .select("*")
          .eq("user_id", session.user.id)
          .order("position");
        setEntries((ents as ProfileEntry[]) ?? []);
      }
      setLoaded(true);
    })();
  }, [session, router]);

  const set = <K extends keyof typeof p>(k: K, v: (typeof p)[K]) => setP((prev) => ({ ...prev, [k]: v }));

  const setEntry = (i: number, patch: Partial<ProfileEntry>) =>
    setEntries((prev) => prev.map((e, j) => (j === i ? { ...e, ...patch } : e)));

  const year = (v: string) => (v.trim() === "" ? null : Math.trunc(Number(v)) || null);

  const save = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!session) return;
    const sb = authClient()!;
    const handle = p.handle.trim().toLowerCase();
    if (!HANDLE_RE.test(handle)) {
      setStatus("error");
      setMessage("Your address must be 3–30 characters: lower-case letters, digits and hyphens.");
      return;
    }
    if (!p.display_name.trim()) {
      setStatus("error");
      setMessage("Please give your name.");
      return;
    }
    const website = p.website?.trim() ?? "";
    if (website && !/^https?:\/\/\S+$/i.test(website)) {
      setStatus("error");
      setMessage("The website should start with https://");
      return;
    }
    const contact = p.contact_email?.trim() ?? "";
    if (contact && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contact)) {
      setStatus("error");
      setMessage("The contact email does not look like an email address.");
      return;
    }
    const clean = entries.filter((x) => x.title.trim() && x.organisation.trim());
    for (const x of clean) {
      if (x.start_year && x.end_year && x.end_year < x.start_year) {
        setStatus("error");
        setMessage(`“${x.title}”: the end year is before the start year.`);
        return;
      }
    }
    setStatus("saving");
    const nul = (s: string | null) => (s && s.trim() ? s.trim() : null);
    const row = {
      id: session.user.id,
      handle,
      display_name: p.display_name.trim(),
      account_type: p.account_type,
      headline: nul(p.headline),
      bio: nul(p.bio),
      location: nul(p.location),
      institution: nul(p.institution),
      field: nul(p.field),
      website: nul(website),
      avatar_url: p.avatar_url,
      degree: nul(p.degree),
      contact_email: nul(p.contact_email),
      skills: skillsText
        .split(",")
        .map((s) => s.trim())
        .filter(Boolean)
        .slice(0, 30)
        .map((s) => s.slice(0, 60)),
      is_public: p.is_public,
      show_progress: p.show_progress,
    };
    const { error } = await sb.from("profiles").upsert(row);
    if (error) {
      setStatus("error");
      setMessage(error.code === "23505" ? `The address “${handle}” is taken — try another.` : error.message);
      return;
    }
    // Replace the CV entries wholesale: small lists, simplest correct sync.
    const del = await sb.from("profile_entries").delete().eq("user_id", session.user.id);
    const ins = clean.length
      ? await sb.from("profile_entries").insert(
          clean.map((x, i) => ({
            user_id: session.user.id,
            kind: x.kind,
            title: x.title.trim(),
            organisation: x.organisation.trim(),
            location: nul(x.location),
            start_year: x.start_year,
            end_year: x.end_year,
            description: nul(x.description),
            position: i,
          })),
        )
      : { error: null };
    if (del.error || ins.error) {
      setStatus("error");
      setMessage((del.error ?? ins.error)!.message);
      return;
    }
    router.push(`/u/${handle}`);
  };

  const [uploading, setUploading] = useState(false);
  const uploadPhoto = async (file: File | undefined) => {
    if (!file || !session) return;
    if (!/^image\/(jpeg|png|webp)$/.test(file.type) || file.size > 3 * 1024 * 1024) {
      setStatus("error");
      setMessage("Use a JPEG, PNG or WebP image under 3 MB.");
      return;
    }
    setUploading(true);
    const sb = authClient()!;
    const ext = file.type.split("/")[1].replace("jpeg", "jpg");
    const path = `${session.user.id}/avatar-${Date.now()}.${ext}`;
    const { error } = await sb.storage.from("avatars").upload(path, file, { contentType: file.type, upsert: true });
    setUploading(false);
    if (error) {
      setStatus("error");
      setMessage(`The photo did not upload: ${error.message}`);
      return;
    }
    set("avatar_url", sb.storage.from("avatars").getPublicUrl(path).data.publicUrl);
    setStatus("idle");
  };

  const signOut = async () => {
    await authClient()?.auth.signOut();
    router.push("/");
  };

  if (!loaded) {
    return <main className="min-h-screen bg-page text-ink flex items-center justify-center font-sans text-[14px] text-muted">Loading…</main>;
  }

  const section = (kind: ProfileEntry["kind"], title: string, titleLabel: string, orgLabel: string) => (
    <section className="mt-10">
      <h2 className="font-serif text-[22px]">{title}</h2>
      <div className="mt-3 flex flex-col gap-4">
        {entries.map((x, i) =>
          x.kind !== kind ? null : (
            <div key={i} className="rounded-2xl border border-line bg-card p-4 grid gap-3 sm:grid-cols-2">
              <Field name={titleLabel}>
                <input className={input} value={x.title} maxLength={120} onChange={(e) => setEntry(i, { title: e.target.value })} />
              </Field>
              <Field name={orgLabel}>
                <input className={input} value={x.organisation} maxLength={120} onChange={(e) => setEntry(i, { organisation: e.target.value })} />
              </Field>
              <Field name="From (year)">
                <input className={input} inputMode="numeric" value={x.start_year ?? ""} onChange={(e) => setEntry(i, { start_year: year(e.target.value) })} />
              </Field>
              <Field name="To (year)" hint="Leave empty if ongoing">
                <input className={input} inputMode="numeric" value={x.end_year ?? ""} onChange={(e) => setEntry(i, { end_year: year(e.target.value) })} />
              </Field>
              <div className="sm:col-span-2">
                <Field name="Current degree or level" hint="e.g. Master 2, BA year 3, PhD candidate">
              <input className={input} maxLength={80} value={p.degree ?? ""} onChange={(e) => set("degree", e.target.value)} />
            </Field>
            <Field name="Public contact email (optional)" hint="Shown as a Contact button on your page">
              <input className={input} type="email" maxLength={200} value={p.contact_email ?? ""} onChange={(e) => set("contact_email", e.target.value)} />
            </Field>
            <Field name="Location">
                  <input className={input} value={x.location ?? ""} maxLength={80} onChange={(e) => setEntry(i, { location: e.target.value })} />
                </Field>
              </div>
              <div className="sm:col-span-2">
                <Field name="Description">
                  <textarea className={`${input} min-h-[70px]`} value={x.description ?? ""} maxLength={1000} onChange={(e) => setEntry(i, { description: e.target.value })} />
                </Field>
              </div>
              <button
                type="button"
                onClick={() => setEntries((prev) => prev.filter((_, j) => j !== i))}
                className="justify-self-start font-sans text-[13px] text-maroon hover:underline"
              >
                Remove
              </button>
            </div>
          ),
        )}
        <button
          type="button"
          onClick={() => setEntries((prev) => [...prev, emptyEntry(kind, prev.length)])}
          className="self-start rounded-full border border-line px-3.5 py-1.5 font-sans text-[13px] hover:border-ink"
        >
          + Add {kind === "education" ? "education" : "experience"}
        </button>
      </div>
    </section>
  );

  return (
    <main className="min-h-screen bg-page text-ink px-4 py-6">
      <div className="mx-auto max-w-2xl">
        <div className="flex items-center">
          <Wordmark size="sm" underline={false} />
          <button onClick={signOut} className="ml-auto font-sans text-[13px] text-muted hover:text-ink">
            Sign out
          </button>
        </div>
        <h1 className="mt-10 font-serif text-[30px] leading-tight">{exists ? "Edit your profile" : "Create your profile"}</h1>
        <p className="mt-1 font-sans text-[14px] text-muted">Signed in as {session?.user.email}</p>

        <form onSubmit={save} className="mt-8">
          <section className="flex items-center gap-4">
            {p.avatar_url ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={p.avatar_url} alt="" className="w-24 h-28 object-cover rounded-lg border border-line" />
            ) : (
              <div className="w-24 h-28 rounded-lg border border-line bg-pill flex items-center justify-center font-serif text-[34px]">
                {(p.display_name || "?").charAt(0).toUpperCase()}
              </div>
            )}
            <div className="flex flex-col gap-2 font-sans text-[13.5px]">
              <label className="cursor-pointer self-start rounded-full border border-line px-3.5 py-1.5 hover:border-ink">
                {uploading ? "Uploading…" : p.avatar_url ? "Change photo" : "Add a photo"}
                <input
                  type="file"
                  accept="image/jpeg,image/png,image/webp"
                  className="sr-only"
                  onChange={(e) => uploadPhoto(e.target.files?.[0])}
                />
              </label>
              {p.avatar_url && (
                <button type="button" onClick={() => set("avatar_url", null)} className="self-start text-muted hover:text-ink">
                  Remove photo
                </button>
              )}
              <span className="text-[12px] text-faint">JPEG, PNG or WebP, under 3 MB. Saved when you save the profile.</span>
            </div>
          </section>

          <section className="mt-10">
            <h2 className="font-serif text-[22px]">I am a…</h2>
            <div className="mt-3 grid gap-2 sm:grid-cols-3">
              {ACCOUNT_TYPES.map((t) => (
                <label
                  key={t.id}
                  className={`cursor-pointer rounded-2xl border px-4 py-3 ${p.account_type === t.id ? "border-ink bg-card" : "border-line"}`}
                >
                  <input
                    type="radio"
                    name="account_type"
                    className="sr-only"
                    checked={p.account_type === t.id}
                    onChange={() => set("account_type", t.id as AccountType)}
                  />
                  <span className="block font-sans text-[14.5px] font-medium">{t.label}</span>
                  <span className="block font-sans text-[12.5px] text-muted">{t.hint}</span>
                </label>
              ))}
            </div>
          </section>

          <section className="mt-10 grid gap-4 sm:grid-cols-2">
            <Field name="Name">
              <input
                className={input}
                required
                maxLength={80}
                value={p.display_name}
                onChange={(e) => {
                  set("display_name", e.target.value);
                  if (!handleTouched) set("handle", suggestHandle(e.target.value));
                }}
              />
            </Field>
            <Field name="Profile address" hint={`periergia.com/u/${p.handle || "your-name"}`}>
              <input
                className={input}
                required
                maxLength={30}
                value={p.handle}
                onChange={(e) => {
                  setHandleTouched(true);
                  set("handle", e.target.value.toLowerCase().replace(/[^a-z0-9-]/g, ""));
                }}
              />
            </Field>
            <div className="sm:col-span-2">
              <Field name="Headline" hint="One line, e.g. “History student interested in the early modern world”">
                <input className={input} maxLength={140} value={p.headline ?? ""} onChange={(e) => set("headline", e.target.value)} />
              </Field>
            </div>
            <Field name={p.account_type === "independent" ? "School or organisation (optional)" : "University"}>
              <input className={input} maxLength={120} value={p.institution ?? ""} onChange={(e) => set("institution", e.target.value)} />
            </Field>
            <Field name={p.account_type === "professor" ? "What you teach or research" : "What you study"}>
              <input className={input} maxLength={120} value={p.field ?? ""} onChange={(e) => set("field", e.target.value)} />
            </Field>
            <Field name="Location">
              <input className={input} maxLength={80} value={p.location ?? ""} onChange={(e) => set("location", e.target.value)} />
            </Field>
            <Field name="Website">
              <input className={input} maxLength={200} placeholder="https://" value={p.website ?? ""} onChange={(e) => set("website", e.target.value)} />
            </Field>
            <div className="sm:col-span-2">
              <Field name="About you">
                <textarea className={`${input} min-h-[120px]`} maxLength={2000} value={p.bio ?? ""} onChange={(e) => set("bio", e.target.value)} />
              </Field>
            </div>
            <div className="sm:col-span-2">
              <Field name="Interests and skills" hint="Separated by commas, e.g. Ottoman history, Latin, palaeography">
                <input className={input} value={skillsText} onChange={(e) => setSkillsText(e.target.value)} />
              </Field>
            </div>
          </section>

          {section("education", "Education", "Degree or course", "School or university")}
          {section("experience", "Experience", "Role", "Organisation")}

          <section className="mt-10 flex flex-col gap-3 font-sans text-[14px]">
            <h2 className="font-serif text-[22px]">Privacy</h2>
            <label className="flex items-start gap-2">
              <input type="checkbox" className="mt-1" checked={p.is_public} onChange={(e) => set("is_public", e.target.checked)} />
              <span>Anyone with the link can see my profile (otherwise only you can)</span>
            </label>
            <label className="flex items-start gap-2">
              <input type="checkbox" className="mt-1" checked={p.show_progress} onChange={(e) => set("show_progress", e.target.checked)} />
              <span>Show what I have read and passed on Periergia</span>
            </label>
          </section>

          <div className="mt-10 flex items-center gap-4">
            <button
              type="submit"
              disabled={status === "saving"}
              className="rounded-full bg-ink text-page font-sans text-[14px] font-medium px-5 py-2.5 disabled:opacity-60"
            >
              {status === "saving" ? "Saving…" : "Save profile"}
            </button>
            {exists && (
              <Link href={`/u/${p.handle}`} className="font-sans text-[14px] text-muted hover:text-ink">
                Cancel
              </Link>
            )}
          </div>
          {status === "error" && <p className="mt-3 font-sans text-[13.5px] text-maroon">{message}</p>}
        </form>
      </div>
    </main>
  );
}
