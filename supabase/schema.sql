-- ─────────────────────────────────────────────────────────────────────────
-- Periergia — Supabase / Postgres schema
-- Run once in the Supabase SQL editor (or `psql`), then `npm run seed` to
-- populate the stable syllabus tree. Generated content/quizzes are written by
-- the app's API routes (server-side, service-role) and read back on cache hits.
-- ─────────────────────────────────────────────────────────────────────────

-- Stable syllabus (seeded from src/lib/seed.ts via `npm run seed`)
create table if not exists subjects (
  id          text primary key,
  name        text not null,
  slug        text unique not null,
  description text,
  position    int  not null default 0
);

create table if not exists nodes (
  id         text primary key,               -- e.g. history/revolutions/the-french-revolution
  subject_id text not null references subjects(id) on delete cascade,
  parent_id  text references nodes(id) on delete cascade,
  title      text not null,
  slug       text not null,
  summary    text,
  position   int  not null default 0,
  depth      int  not null default 0
);
create index if not exists nodes_subject_idx on nodes (subject_id);
create index if not exists nodes_parent_idx  on nodes (parent_id);

-- Generate-once content cache, keyed by (node, depth, level, format)
create table if not exists content (
  node_id    text not null references nodes(id) on delete cascade,
  depth      text not null,
  level      text not null,
  format     text not null,
  body       text not null,
  generated  boolean not null default false,
  -- True once a human has read this exact text and signed off on it (shown as
  -- a badge next to the article title). Set manually, never by generation.
  reviewed   boolean not null default false,
  created_at timestamptz not null default now(),
  primary key (node_id, depth, level, format)
);
alter table content add column if not exists reviewed boolean not null default false;

-- Generate-once quiz cache, keyed by (node, level)
create table if not exists quizzes (
  node_id    text not null references nodes(id) on delete cascade,
  level      text not null,
  questions  jsonb not null,
  generated  boolean not null default false,
  created_at timestamptz not null default now(),
  primary key (node_id, level)
);

-- ── Row-level security ────────────────────────────────────────────────────
-- Public app: everyone may READ. WRITES happen server-side with the service
-- role, which bypasses RLS — so no write policies are defined (writes via the
-- anon key are therefore denied by default).
alter table subjects enable row level security;
alter table nodes    enable row level security;
alter table content  enable row level security;
alter table quizzes  enable row level security;

do $$
begin
  if not exists (select 1 from pg_policies where tablename = 'subjects' and policyname = 'public read') then
    create policy "public read" on subjects for select using (true);
  end if;
  if not exists (select 1 from pg_policies where tablename = 'nodes' and policyname = 'public read') then
    create policy "public read" on nodes for select using (true);
  end if;
  if not exists (select 1 from pg_policies where tablename = 'content' and policyname = 'public read') then
    create policy "public read" on content for select using (true);
  end if;
  if not exists (select 1 from pg_policies where tablename = 'quizzes' and policyname = 'public read') then
    create policy "public read" on quizzes for select using (true);
  end if;
end $$;
