# Periergia

> _περιέργεια — Greek for intellectual curiosity._

**A living textbook for everything.** Wikipedia's breadth, a dev-docs reading
experience, but the content is generated to fit *you* — your depth, your level,
your preferred way of learning — and then it tests you.

Open a subject → move through its syllabus tree → read a topic at the depth and
level you choose → listen to it → **test yourself**. The 3-column docs layout
(subjects · content · your position in the syllabus) is styled in the
**"Reading Room"** design: Spectral serif, ink `#211d18`, a maroon `#7c2d2d`
accent, on a clean white ground.

This is the v1 of the architecture worked out in the *Living textbook* session,
implemented in the visual language of `Periergia.dc.html` (the "Lean Home" 3a +
the read/listen/see/test Reader 2a).

---

## What's built (v1)

- **Lean Home** (`/`) — underlined wordmark, tagline, library strip, search with
  **voice input**, and a **Quick pills / Full list** toggle over the subjects.
- **3-column Reader** (`/learn/[subject]/[...node]`) — left subjects rail · center
  book-style content · right syllabus tree (your position), responsive to a
  single phone-style column on mobile.
- **Three control axes** on every topic:
  - **Depth** — skim → definition → medium → detailed → research
  - **Level** — easy → advanced → expert
  - **Format** — **Read** + **Listen** live; **Watch** / **See (3D)** shown as
    coming-soon format plugins.
- **Test yourself** — 6-question quizzes (multiple-choice + open-ended), with
  **open answers graded by Claude** against a rubric.
- **Voice** via the browser's Web Speech API (TTS for Listen, speech-to-text for
  search) — free, zero infra.
- **6 curated subjects** with stable, hand-authored syllabus trees: History,
  Mathematics, Physics, English Literature, Economics, Computer Science.
- **No accounts** — progress and reader preferences saved in `localStorage`.

It runs **today with no secrets**: content/quiz/grading fall back to structured
placeholders, and the syllabus tree + content cache live in memory. Add keys to
light up the real thing — no rework.

### Decisions (locked)

| | |
|---|---|
| Formats v1 | Text + Voice + Test |
| Subjects | Curated ~6, stored trees |
| Accounts | None — browser-saved progress |
| Database | Supabase (Postgres + Storage) |
| Content model | Claude `claude-opus-4-8`, adaptive thinking, streamed; cached per (node, depth, level, format) |

---

## Run it

```bash
npm install
npm run dev          # http://localhost:3000
```

No environment variables required. To enable real generation and persistence,
copy `.env.example` → `.env.local` and fill in:

- `ANTHROPIC_API_KEY` — turns on Claude content, quizzes, and open-answer
  grading (defaults to `claude-opus-4-8`; override with `PERIERGIA_MODEL`).
- `NEXT_PUBLIC_SUPABASE_URL` + `SUPABASE_SERVICE_ROLE_KEY` — persist the
  generated-content cache to Postgres (the stable tree still seeds from
  `src/lib/seed.ts`).

---

## Architecture

```
Home (3a)  ──▶  /learn/[subject]/[...node]  (3-column Reader)
                       │
   ┌───────────────────┼─────────────────────────────┐
   │ left rail         │ center                       │ right rail
   │ SubjectsRail      │ Reader  ── depth/level/format│ SyllabusTree
   │ (all subjects)    │   ├─ /api/content (cached)   │ (your position)
   │                   │   └─ Test ▶ /api/quiz        │
   └───────────────────┴─────────────────────────────┘

src/lib
  types.ts      domain model (Depth, Level, Format, Subject, Node, Quiz…)
  seed.ts       6 subjects + stable syllabus trees (the "generate-once" tree)
  store.ts      ONE interface over the data: tree (seed) + cache (memory|Supabase)
  supabase.ts   env-gated Postgres client (null ⇒ in-memory fallback)
  anthropic.ts  env-gated Claude client + model id
  generate.ts   content / quiz / grading — Claude when keyed, placeholders otherwise
  progress.ts   localStorage progress + reader prefs (no accounts)
```

**Stable tree, generated leaves.** Unlike a stateless generate-everything app,
the syllabus tree is fixed so you can read a subject start-to-finish. Each
node's content is generated **on demand** at the chosen depth/level/format and
**cached** (generate-once). The voice format reads the cached text aloud — no
separate generation.

**Swapping in Supabase is local to `store.ts`.** The tree read functions and the
content/quiz cache are the only Postgres touch-points; set the env vars and the
cache writes/reads move from an in-process `Map` to Postgres with no other code
changes.

### Database schema (Supabase / Postgres)

```sql
-- Stable syllabus (seeded from src/lib/seed.ts)
create table subjects (
  id text primary key,
  name text not null,
  slug text unique not null,
  description text,
  position int not null default 0
);

create table nodes (
  id text primary key,            -- e.g. history/revolutions/the-french-revolution
  subject_id text references subjects(id),
  parent_id text references nodes(id),
  title text not null,
  slug text not null,
  summary text,
  position int not null default 0,
  depth int not null default 0
);

-- Generate-once cache, keyed by depth/level/format
create table content (
  node_id text not null,
  depth text not null,
  level text not null,
  format text not null,
  body text not null,
  generated boolean not null default false,
  created_at timestamptz default now(),
  primary key (node_id, depth, level, format)
);

create table quizzes (
  node_id text not null,
  level text not null,
  questions jsonb not null,
  generated boolean not null default false,
  created_at timestamptz default now(),
  primary key (node_id, level)
);
```

Storage buckets (audio for premium TTS, later video/3D assets) drop in beside
this when those format plugins land.

---

## Tech

Next.js 15 (App Router) · React 19 · TypeScript · Tailwind CSS · `@anthropic-ai/sdk`
· `@supabase/supabase-js` · `react-markdown` · Web Speech API.

## Roadmap

1. Wire live Supabase (seed the tree, point the cache at Postgres).
2. Subject/Chapter landing pages (Medium-style columns).
3. Format plugins: **Game** (AI-generated interactive), **Watch** (narrated
   slides), **See** (3D for geometry / molecules / anatomy).
4. Accounts + cross-device progress (Supabase Auth — the data layer is ready).
