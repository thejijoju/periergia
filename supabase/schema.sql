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

-- Self-hosted engagement analytics. One row per reader interaction (currently
-- 'article_read', fired when a reader leaves an article), written server-side by
-- /api/track and read back as JSON by the token-gated /api/events. Kept in our
-- own DB so the data is fully ours — no dependence on a paid analytics tier.
create table if not exists events (
  id       bigserial primary key,
  ts       timestamptz not null default now(),
  name     text not null,
  node_id  text,
  title    text,
  path     text,
  depth    text,
  level    text,
  seconds  integer,
  dwell    text,
  country  text,
  city     text,
  referrer text,
  ua       text
);
-- Demand log fields (article_request events, written server-side on page load):
-- `bot` flags a crawler UA (kept, not dropped, so we can see crawl demand for
-- SEO); `cold` marks a request that hit an UNCACHED article — i.e. the exact
-- pages worth pre-warming.
alter table events add column if not exists bot  boolean;
alter table events add column if not exists cold boolean;
create index if not exists events_ts_idx   on events (ts desc);
create index if not exists events_name_idx on events (name);

-- Interest list for the gated "Research" tier. One row per email (upserted, so
-- a repeat signup refreshes rather than duplicates). Written server-side by
-- /api/research-signup; read back however the events dashboard is (token-gated).
create table if not exists research_signups (
  email    text primary key,
  ts       timestamptz not null default now(),
  node_id  text,
  title    text,
  path     text,
  country  text,
  referrer text,
  ua       text
);
create index if not exists research_signups_ts_idx on research_signups (ts desc);

-- Reader-reported errors and suggested edits, written server-side by
-- /api/feedback. One row per submission (no upsert — two reports about the same
-- article are two facts, not a duplicate). `status` tracks triage so the queue
-- can be worked through: new → accepted/rejected/fixed. May contain an email
-- address (optional, only when the reader wants a reply), so this is PII and
-- stays server-only like events and research_signups.
create table if not exists content_feedback (
  id       bigserial primary key,
  ts       timestamptz not null default now(),
  node_id  text not null,
  title    text,
  kind     text not null default 'error',   -- error | suggestion | unclear
  message  text not null,
  quote    text,                            -- the passage the reader had selected
  email    text,
  depth    text,
  level    text,
  path     text,
  country  text,
  referrer text,
  ua       text,
  status   text not null default 'new'
);
create index if not exists content_feedback_ts_idx     on content_feedback (ts desc);
create index if not exists content_feedback_node_idx   on content_feedback (node_id);
create index if not exists content_feedback_status_idx on content_feedback (status);

-- ── Row-level security ────────────────────────────────────────────────────
-- Public app: everyone may READ. WRITES happen server-side with the service
-- role, which bypasses RLS — so no write policies are defined (writes via the
-- anon key are therefore denied by default).
alter table subjects enable row level security;
alter table nodes    enable row level security;
alter table content  enable row level security;
alter table quizzes  enable row level security;
-- events has RLS on and NO policy: neither read nor write is allowed via the
-- anon key. Only the server's service-role client (which bypasses RLS) touches
-- it, keeping the analytics private.
alter table events   enable row level security;
-- research_signups holds email addresses (PII): RLS on, NO policy, so only the
-- server's service-role client can read or write it. Never exposed to anon.
alter table research_signups enable row level security;
-- content_feedback may hold an email address and free text: RLS on, NO policy,
-- so only the server's service-role client can touch it.
alter table content_feedback enable row level security;

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
