#!/bin/bash
# usage: check_batch.sh file1.sql file2.sql ...   (paths relative to repo)
# Runs render-check, the Reader's checkpoint parser on each file, and a full
# schema + seed + all-content load into a throwaway Postgres, replaying the
# given files to prove idempotency.
set -u
T=docs/history-curriculum/tools
cd "$(git rev-parse --show-toplevel)" || exit 1
node scripts/render-check.mjs 2>&1 | tail -1
for f in "$@"; do printf '%s: ' "$(basename "$f")"; npx tsx $T/cp.ts "$f" | tail -1; done
D=$(mktemp -d /var/tmp/periergia-pgtest.XXXXXX); B=/usr/lib/postgresql/16/bin
PORT=$(( 20000 + RANDOM % 20000 ))   # unique dir and port so parallel runs do not collide
chown nobody $D
su nobody -s /bin/bash -c "$B/initdb -D $D/data -A trust -U postgres >/dev/null && $B/pg_ctl -D $D/data -o '-k $D -p $PORT -c listen_addresses=' -l $D/log start >/dev/null"
for i in 1 2 3 4 5 6; do psql -h $D -p $PORT -U postgres -c 'select 1' >/dev/null 2>&1 && break; sleep 1; done
P="psql -h $D -p $PORT -U postgres -v ON_ERROR_STOP=1 -q"
$P -f supabase/schema.sql >/dev/null 2>&1
$P -f supabase/seed.sql >/dev/null || echo SEED FAIL
n=0; bad=0
for f in supabase/content/*.sql; do $P -f "$f" >/dev/null 2>$D/e || { echo "FAIL $f"; head -3 $D/e; bad=1; }; n=$((n+1)); done
for f in "$@"; do $P -f "$f" >/dev/null || { echo "REPLAY FAIL $f"; bad=1; }; done
echo "db: applied $n content files, failures=$bad"
su nobody -s /bin/bash -c "$B/pg_ctl -D $D/data stop -m fast >/dev/null"; rm -rf $D
