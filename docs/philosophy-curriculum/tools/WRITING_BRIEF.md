# Writing brief (Phase 1)

You are writing one master chapter of Periergia's Philosophy curriculum, for an adult general reader, from a file of verified research notes. Read `docs/philosophy-curriculum/PLAN.md` first.

## The one rule
Use ONLY facts in the research notes. Do not add dates, numbers, names, quotations, or attributions from memory, even if you are sure. If the chapter needs a fact the notes lack, leave it out (or write around it). Respect every caveat in the notes ("estimates range", "disputed", "legend"), and never use anything listed under "NOT VERIFIED".

## Perspective and method
Global and plural: bring in the other traditions that worked on the same questions wherever the notes allow, and the women philosophers the notes name. Present interpretive debates as debates. Explain ideas for a reader with no philosophy background: define every technical term at first use.

**Arguments, not just opinions.** At least one argument in the chapter is set out step by step as a short numbered list (premises, then the conclusion), followed by the strongest objection and the best reply, all from the notes. Don't write "X thought Y" without saying why X thought it.

## Form (see the model chapter: `supabase/content/history--what-is-history.sql`, readable with `python3 docs/history-curriculum/tools/extract.py <file>`)
- Markdown body, about 3,000–3,600 words of prose (excluding checkpoints and reading list; era overviews about 2,000–2,600), British spelling, plain clear prose, no bullet-heavy sections except short lists.
- Opens with a one-paragraph blockquote summary (`> **Bold lead.** …`) saying what the chapter covers.
- `##` section headings; no `#` title.
- At most one `{{image: Exact Wikipedia Article Title | caption}}` (choose an article whose lead image fits the caption).
- Zero to two ```quote blocks: the quoted line, then `Author · Work · Date` on the next line; only for wording verified in the notes.
- Exactly two ```checkpoint blocks, each with two questions separated by `---`. Each question: `q:`; four options as `a:` lines, exactly one `a*:`; an `x:` line right after every wrong option explaining why it is wrong; then `hint:` and `why:`.
- Ends with `## Further exploration`: 5–7 books from the notes' verified reading list, as `- **Author, *Title* (year).** One-line description.`
- Cross-references to other chapters ("as the chapter on X describes") to chapters in the Philosophy tree in `src/lib/seed.ts` (they will all exist; name them by their exact titles) and to History chapters that exist (`ls supabase/content/history--*`).

## Quiz
A JSON array of six items: four `{"type":"mcq","prompt","options":[4],"answerIndex","explanation"}` (vary answerIndex across 0–3) and two `{"type":"open","prompt","rubric"}`; all from the notes.

## Build and check
```
python3 docs/history-curriculum/tools/build_master.py <node-id> <short_tag> "<Title>" <body.md> <quiz.json> supabase/content/philosophy--<path with -- separators>.sql
bash docs/history-curriculum/tools/check_batch.sh supabase/content/philosophy--<path with -- separators>.sql
```
Both must pass (render clean, checkpoints parse, db failures=0). Keep body.md and quiz.json in the scratch folder you are given. Do not commit, and do not edit other repository files.

Final message: the SQL path, word count, and a list of any facts you wanted but left out because the notes lacked them.
