# Writing brief (Phase 1)

You are writing one master chapter of Periergia's History curriculum, for an adult general reader, from a file of verified research notes. Read `docs/history-curriculum/PLAN.md` first.

## The one rule
Use ONLY facts in the research notes. Do not add dates, numbers, names, quotations, or attributions from memory, even if you are sure. If the chapter needs a fact the notes lack, leave it out (or write around it). Respect every caveat in the notes ("estimates range", "disputed", "legend"), and never use anything listed under "NOT VERIFIED".

## Perspective
Global and plural: show the history from the viewpoints of the different peoples involved, including the enslaved, Indigenous peoples, women, colonised and non-Western actors, and ordinary people, wherever the notes allow. Present historians' debates as debates.

## Form (see the model chapter: `supabase/content/history--age-of-revolutions--french-and-haitian-revolutions.sql`, readable with `python3 docs/history-curriculum/tools/extract.py <file>`)
- Markdown body, about 2,200–3,000 words, British spelling, plain clear prose, no bullet-heavy sections except short lists.
- Opens with a one-paragraph blockquote summary (`> **Bold lead.** …`) saying what the chapter covers.
- `##` section headings; no `#` title.
- At most one `{{image: Exact Wikipedia Article Title | caption}}` (choose an article whose lead image fits the caption).
- Zero to two ```quote blocks: the quoted line, then `Author · Work · Date` on the next line; only for wording verified in the notes.
- Exactly two ```checkpoint blocks, each with two questions separated by `---`. Each question: `q:`; four options as `a:` lines, exactly one `a*:`; an `x:` line right after every wrong option explaining why it is wrong; then `hint:` and `why:`.
- Ends with `## Further exploration`: 5–7 books from the notes' verified reading list, as `- **Author, *Title* (year).** One-line description.`
- Cross-references to other chapters ("as the chapter on X describes") only to chapters that exist; check with `ls supabase/content/history--*` and the titles in `src/lib/seed.ts`.

## Quiz
A JSON array of six items: four `{"type":"mcq","prompt","options":[4],"answerIndex","explanation"}` (vary answerIndex across 0–3) and two `{"type":"open","prompt","rubric"}`; all from the notes.

## Build and check
```
python3 docs/history-curriculum/tools/build_master.py <node-id> <short_tag> "<Title>" <body.md> <quiz.json> supabase/content/history--<era>--<slug>.sql
bash docs/history-curriculum/tools/check_batch.sh supabase/content/history--<era>--<slug>.sql
```
Both must pass (render clean, checkpoints parse, db failures=0). Keep body.md and quiz.json in the scratch folder you are given. Do not commit, and do not edit other repository files.

Final message: the SQL path, word count, and a list of any facts you wanted but left out because the notes lacked them.
