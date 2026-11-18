-- ── User accounts and profiles ────────────────────────────────────────────
-- Stage 1 of docs/COMMUNITY_PLAN.md: accounts (Supabase Auth), a CV-style
-- public profile, and saved learning progress.
--
-- Idempotent, like schema.sql: applied on every push by db-migrate.yml.
-- Kept in its own file because it depends on Supabase's `auth` schema
-- (auth.users, auth.uid()), which a plain Postgres does not have.
--
-- Unlike the content tables, users write these rows themselves through the
-- anon key + their session, so every table has RLS policies saying who may
-- read and write what. The service role still bypasses RLS.

-- One profile per account. `handle` is the public address: /u/<handle>.
create table if not exists profiles (
  id            uuid primary key references auth.users (id) on delete cascade,
  handle        text not null unique
                check (handle ~ '^[a-z0-9][a-z0-9-]{2,29}$'),
  display_name  text not null check (char_length(display_name) between 1 and 80),
  -- What the person says they are. Self-declared for now; verification comes
  -- with university pages (stage 2 of the community plan).
  account_type  text not null default 'independent'
                check (account_type in ('student', 'professor', 'independent')),
  headline      text check (char_length(headline) <= 140),
  bio           text check (char_length(bio) <= 2000),
  location      text check (char_length(location) <= 80),
  institution   text check (char_length(institution) <= 120),
  field         text check (char_length(field) <= 120),
  website       text check (char_length(website) <= 200),
  skills        text[] not null default '{}' check (cardinality(skills) <= 30),
  is_public     boolean not null default true,   -- false: only the owner sees it
  show_progress boolean not null default true,   -- show learning on the page
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

-- Education and work experience, the CV part of the page.
create table if not exists profile_entries (
  id           bigserial primary key,
  user_id      uuid not null references profiles (id) on delete cascade,
  kind         text not null check (kind in ('education', 'experience')),
  title        text not null check (char_length(title) between 1 and 120),        -- degree or role
  organisation text not null check (char_length(organisation) between 1 and 120), -- school or employer
  location     text check (char_length(location) <= 80),
  start_year   int  check (start_year between 1900 and 2100),
  end_year     int  check (end_year between 1900 and 2100),                        -- null = present
  description  text check (char_length(description) <= 1000),
  position     int  not null default 0,
  created_at   timestamptz not null default now()
);
create index if not exists profile_entries_user_idx on profile_entries (user_id, kind, position);

-- What a signed-in reader has opened and passed. node_id is not a foreign key
-- because seed.sql rebuilds the node table on every migration.
create table if not exists user_progress (
  user_id      uuid not null references auth.users (id) on delete cascade,
  node_id      text not null check (char_length(node_id) <= 300),
  visited_at   timestamptz not null default now(),
  completed_at timestamptz,
  primary key (user_id, node_id)
);

alter table profiles        enable row level security;
alter table profile_entries enable row level security;
alter table user_progress   enable row level security;

do $$
begin
  -- profiles: anyone may read public profiles; owners read, create and edit their own.
  if not exists (select 1 from pg_policies where tablename = 'profiles' and policyname = 'read public or own') then
    create policy "read public or own" on profiles for select
      using (is_public or id = auth.uid());
  end if;
  if not exists (select 1 from pg_policies where tablename = 'profiles' and policyname = 'insert own') then
    create policy "insert own" on profiles for insert with check (id = auth.uid());
  end if;
  if not exists (select 1 from pg_policies where tablename = 'profiles' and policyname = 'update own') then
    create policy "update own" on profiles for update
      using (id = auth.uid()) with check (id = auth.uid());
  end if;
  if not exists (select 1 from pg_policies where tablename = 'profiles' and policyname = 'delete own') then
    create policy "delete own" on profiles for delete using (id = auth.uid());
  end if;

  -- profile_entries: visible when the profile is; owners write their own.
  if not exists (select 1 from pg_policies where tablename = 'profile_entries' and policyname = 'read with profile') then
    create policy "read with profile" on profile_entries for select
      using (exists (select 1 from profiles p where p.id = user_id and (p.is_public or p.id = auth.uid())));
  end if;
  if not exists (select 1 from pg_policies where tablename = 'profile_entries' and policyname = 'write own') then
    create policy "write own" on profile_entries for all
      using (user_id = auth.uid()) with check (user_id = auth.uid());
  end if;

  -- user_progress: owners read and write; others see it only on a public
  -- profile that chose to show progress.
  if not exists (select 1 from pg_policies where tablename = 'user_progress' and policyname = 'read own or shown') then
    create policy "read own or shown" on user_progress for select
      using (user_id = auth.uid() or exists (
        select 1 from profiles p where p.id = user_id and p.is_public and p.show_progress));
  end if;
  if not exists (select 1 from pg_policies where tablename = 'user_progress' and policyname = 'write own') then
    create policy "write own" on user_progress for all
      using (user_id = auth.uid()) with check (user_id = auth.uid());
  end if;
end $$;

-- Keep updated_at current.
create or replace function profiles_touch() returns trigger language plpgsql as $$
begin
  new.updated_at := now();
  return new;
end $$;
drop trigger if exists profiles_touch on profiles;
create trigger profiles_touch before update on profiles
  for each row execute function profiles_touch();

-- Table privileges for Supabase's API roles (RLS above narrows them to rows).
grant select on profiles, profile_entries, user_progress to anon;
grant select, insert, update, delete on profiles, profile_entries, user_progress to authenticated;
grant usage, select on sequence profile_entries_id_seq to authenticated;
