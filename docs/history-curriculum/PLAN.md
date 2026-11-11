# History curriculum: plan

This document is the working plan for Periergia's History subject. It records what has been built, how the rest will be built, and how every article will then be checked. It lives in the repository so the plan and the tools outlive any single working session. Progress is tracked in [STATUS.md](STATUS.md).

## Goal and audience

A complete History curriculum for an **adult general reader**, written as a "living textbook": one authored master chapter per node of the History tree in `src/lib/seed.ts`. It runs from *What is History?* through human origins to the present, then regional and thematic histories.

The curriculum must be **genuinely global**. A solely Western perspective is not acceptable. Every chapter, including those on European subjects, brings in African, Asian, Middle Eastern, Indigenous American and Pacific perspectives and actors where the history involves them. It also names the historiographical debates rather than presenting one view as settled.

## Two phases

1. **Phase 1: finish writing.** Author every remaining chapter and era overview (102 pieces at the time of writing; see STATUS.md), era by era, **source-first** (below). Merge each batch so it is live.
2. **Phase 2: review every article, one by one.** Once everything is written, go through every History article individually. List every checkable claim and verify each one against a source, in two independent passes. Fix everything found, and re-publish. Record each article's claim ledger in `docs/history-curriculum/audits/`.

Phase 2 also re-reviews the 66 articles written before the source-first rule existed (all of *Before Writing* through most of *The Early Modern World*). Those were written from memory, with only quotations, reading lists and uncertain facts checked. They are the priority for review.

## Why source-first

Writing from memory is dangerous. The first independent audits showed it:

- *What Is History?*: both auditors independently found a misquotation of E. P. Thompson ("stocking-knitter" for "stockinger"). They also found about a dozen smaller errors: Napoleon's height in metres, "prehistory" vs "prehistoric", when Bloch wrote *The Historian's Craft*, and others.
- Researching the colonial chapters before writing caught a "100,000 dead" figure for the Túpac Amaru rebellion that no source supports. It also caught a confident claim about where Winthrop's "city upon a hill" sermon was delivered; in fact both the place and the author are disputed.
- The double audits of the two colonial chapters found no outright errors but about 25 overstatements and imprecisions. Examples: Opechancanough as Powhatan's "successor" (he was his brother), King Philip's War destroying "dozens" of towns (the sources say a dozen), Túpac Amaru II as "mestizo" (he was an Indigenous *kuraka*).

The rule: **no specific claim is published unless a source found during the work supports it.** Memory may suggest what to look up; it never counts as confirmation.

## Phase 1 workflow (per chapter)

1. **Scope.** Read the node's summary in `src/lib/seed.ts` (it defines the required coverage). Check what neighbouring chapters already say, to avoid contradictions and to cross-reference correctly (`grep` across `supabase/content/history--*.sql`).
2. **Research notes first.** List the chapter's intended claims: dates, numbers, names, who did, said or wrote what, quotations, attributions to historians, reading-list books. Verify each by web search or by reading the relevant Wikipedia article, and write the verified facts, with their caveats, to `docs/history-curriculum/research/<file-stem>.md`. Record where sources disagree, and record anything that could not be verified so it stays out. See `research/early-modern-period--colonial-*.md` for examples.
3. **Write from the notes only.** About 1,800–2,500 words, beginning with a one-paragraph summary in a blockquote. Include two fenced `checkpoint` blocks of two questions each (four answer options, with an `x:` explanation for every wrong option, plus `hint:` and `why:`), at most one `{{image: Wikipedia Title | caption}}`, and a "Further exploration" list of five to seven verified books. Use direct quotations only when the exact wording has been confirmed.
4. **Quiz.** Six items: four multiple-choice and two open questions with marking rubrics, all drawn from verified notes.
5. **Build** with `tools/build_master.py` and run `tools/check_batch.sh`: render check, checkpoint parser, and a fresh Postgres load of schema, seed and all content.
6. **Audit before merge.** Run two independent audit passes (see Phase 2 method) on each new chapter, apply the fixes, rebuild and re-check.
7. **Merge.** Commit, open a PR, merge, and confirm the `db-migrate` workflow succeeded. Where possible, also confirm the live page at `https://www.periergia.com/learn/<node path>`.

Batches are two or three chapters. Era overviews are written last within each era, once the era's chapters exist.

### Order of the remaining work

1. The Age of Revolutions: 5 chapters and the overview.
2. The Long Nineteenth Century: 11 chapters and the overview.
3. 20th Century History: 20 chapters. The overview already exists.
4. Contemporary History: 6 chapters and the overview.
5. Long Histories of Regions: 27 chapters and the overview.
6. Thematic History: 28 chapters and the overview.

## Phase 2 method (per article)

For each published History article, one at a time:

1. **Extract** the text and quiz: `python3 docs/history-curriculum/tools/extract.py supabase/content/<file>.sql`.
2. **Two independent passes**, following `tools/AUDIT_BRIEF.md`. Pass A works top-down and pass B bottom-up, and neither sees the other's findings. Each pass lists every checkable claim in the body, the checkpoints (including the `x:` explanations) and the quiz. It gives each claim a verdict with a source URL:
   - **CONFIRMED**: a source found now supports it.
   - **WRONG**: a source contradicts it; the correct fact is given.
   - **IMPRECISE**: broadly right but overstated, a contested figure presented as settled, or slightly off.
   - **UNVERIFIED**: searched, nothing found.
3. **Reconcile.** Fix every WRONG and IMPRECISE item. For each UNVERIFIED item, either find a source, soften the wording, or remove the claim.
4. **Record** the merged claim ledger at `docs/history-curriculum/audits/<file-stem>.md`, with each claim's final verdict, source, and the change made.
5. **Rebuild, check and merge**, then mark the article ✅ with the date in STATUS.md.

## Practical limits learned so far

- **Web search** is capped at 200 calls per turn, shared by every agent running at once. Audits should do most of their checking by reading whole Wikipedia articles, where one page settles many claims, and keep each pass to 25 or fewer searches.
- **Wikipedia** is reachable through the session proxy with `curl` (`https://en.wikipedia.org/w/index.php?title=<Title>&action=raw`). The `WebFetch` tool may fail on it, and the API rate-limits parallel fetchers (HTTP 429), so run no more than about four audit agents at once.
- **Britannica** refuses automated requests; don't use it.
- **Cost:** one audit pass takes roughly 15–20 minutes and 100–200k tokens.
- **The cloud session environment** used for this work is "Periergia & Twiggli". It allows `en.wikipedia.org`, `www.britannica.com`, `periergia.com` and `www.periergia.com`.

## Tools (`docs/history-curriculum/tools/`)

| File | Purpose |
|---|---|
| `build_master.py` | `python3 build_master.py NODE_ID TAG "TITLE" BODY.md QUIZ.json OUT.sql [--overview]`: validates checkpoints, rebalances answer positions, and writes the SQL upsert into `supabase/content/`. |
| `check_batch.sh` | `check_batch.sh supabase/content/<file>.sql …`: render check, checkpoint parse, and a full fresh-Postgres load, replaying the given files. |
| `cp.ts` | A standalone copy of the Reader's checkpoint parser, used by `check_batch.sh`. |
| `extract.py` | Prints an article's markdown and quiz JSON from its SQL file, for auditing. |
| `status.ts` | Lists every History node as DONE or TODO, with its content file. |
| `AUDIT_BRIEF.md` | The instructions given to each independent audit pass. |

## Content format reminders

- Authored masters are stored as `content` rows at depth `research`, level `advanced`, format `read`, with `reviewed = true`, plus a curated `quizzes` row per level.
- Each file deletes that node's derived caches so they regenerate from the master.
- The `db-migrate` GitHub Actions workflow applies the schema, the seed and every content file on each push to `main`.
- Section (era) nodes show their overview master above the topic list.
