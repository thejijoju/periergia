"""Package an authored master (markdown body + quiz JSON) as a supabase/content SQL upsert.

usage: build_master.py NODE_ID TAG TITLE BODY.md QUIZ.json OUT.sql [--overview] [--about "text"]

Also rebalances the correct option's position in every ```checkpoint question so
answers are spread across positions (deterministic), and validates structure.
"""
import json, re, sys, argparse

ap = argparse.ArgumentParser()
ap.add_argument("node"); ap.add_argument("tag"); ap.add_argument("title")
ap.add_argument("body"); ap.add_argument("quiz"); ap.add_argument("out")
ap.add_argument("--overview", action="store_true")
ap.add_argument("--about", default="")
a = ap.parse_args()

body = open(a.body, encoding="utf-8").read().strip()
TARGETS = [0, 2, 1, 3, 2, 0, 3, 1, 1, 3, 0, 2, 3, 1, 2, 0]
k = 0


def fix(m):
    global k
    out = []
    for q in m.group(1).split("\n---\n"):
        lines = q.strip("\n").splitlines()
        head = [l for l in lines if l.startswith("q:")]
        tail = [l for l in lines if l.startswith(("hint:", "why:"))]
        units = []
        for l in lines:
            if re.match(r"a\*?:", l):
                units.append([l])
            elif l.startswith("x:"):
                units[-1].append(l)
        assert len(head) == 1 and len(units) == 4 and len(tail) == 2, q[:80]
        correct = [i for i, u in enumerate(units) if u[0].startswith("a*")]
        assert len(correct) == 1, q[:80]
        for u in units:
            assert (len(u) == 1) == u[0].startswith("a*"), ("each wrong option needs one x:", q[:80])
        c = units.pop(correct[0])
        units.insert(TARGETS[k % len(TARGETS)], c)
        k += 1
        out.append("\n".join(head + [l for u in units for l in u] + tail))
    return "```checkpoint\n" + "\n---\n".join(out) + "\n```"


body = re.sub(r"```checkpoint\n(.*?)\n```", fix, body, flags=re.S)
open(a.body, "w", encoding="utf-8").write(body + "\n")

quiz = json.load(open(a.quiz, encoding="utf-8"))
for i, q in enumerate(quiz):
    q["id"] = f"q{i+1}"
    if q["type"] == "mcq":
        assert len(q["options"]) == 4 and 0 <= q["answerIndex"] < 4 and q.get("explanation")
    else:
        assert q["type"] == "open" and q.get("rubric")
qj = "[\n" + ",\n".join("    " + json.dumps(q, ensure_ascii=False) for q in quiz) + "\n  ]"
mt, qt = f"${a.tag}_master$", f"${a.tag}_quiz$"
assert mt not in body and qt not in qj

kind = ("chapter OVERVIEW master, co-written and human-reviewed" if a.overview
        else "canonical master article, co-written and human-reviewed")
overview_note = ("-- This node is a chapter (it has child topics); the app renders this overview\n"
                 "-- article above the chapter's topic list (see the section-overview branch in\n"
                 "-- src/app/learn/[subject]/[...node]/page.tsx).\n") if a.overview else ""
about = "".join(f"-- {l}\n" if l else "--\n" for l in a.about.split("\n")) + "--\n" if a.about else ""

sql = f"""-- {a.title} — {kind}.
-- {a.node} @ research/advanced/read.
{overview_note}-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
{about}-- {{{{image: Title | caption}}}} markers resolve to real Wikipedia images at read
-- time via /api/resolve-images (see src/components/Reader.tsx). A curated,
-- human-reviewed quiz is inserted at the bottom (generated = true).
--
-- Every other depth/level/mode for this node is a cached distillation DERIVED
-- from this master (see src/lib/generate.ts), so when the master body changes
-- those rows are stale. The upsert only touches the row when something actually
-- differs, and the delete below fires only in that case — dropping the derived
-- caches so the next request re-distills from the updated master. Replaying an
-- unchanged file is a complete no-op.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    '{a.node}',
    'research',
    'advanced',
    'read',
    {mt}{body}{mt},
    true,
    true
  )
  on conflict (node_id, depth, level, format) do update
    set body = excluded.body, generated = excluded.generated, reviewed = excluded.reviewed
    where content.body is distinct from excluded.body
       or content.generated is distinct from excluded.generated
       or content.reviewed is distinct from excluded.reviewed
  returning node_id
)
delete from content
where node_id in (select node_id from master)
  and not (depth = 'research' and level = 'advanced' and format = 'read');

-- Curated, human-reviewed quiz — same set served at every level.
with q as (
  select {qt}{qj}{qt}::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select '{a.node}', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
"""
open(a.out, "w", encoding="utf-8").write(sql)
print(f"wrote {a.out}: {len(body.split())} words, {k} checkpoint questions, {len(quiz)} quiz items")
