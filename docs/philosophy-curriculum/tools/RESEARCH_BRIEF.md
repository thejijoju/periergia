# Research brief (Phase 1, source-first)

You are preparing the verified research notes from which a chapter of a global philosophy textbook for adult general readers will be written. The writer will use ONLY what your notes contain, so a fact you leave out will not appear, and a fact you get wrong will be published.

## Inputs
- The chapter's node id and its required coverage (the seed summary), given in your prompt.
- The house rules (read `docs/philosophy-curriculum/PLAN.md`): the curriculum is global (Indian, Chinese, Islamic, Jewish, Japanese, African and Latin American philosophy are philosophy; women philosophers appear where they actually were); scholarly debates, including debates about how to interpret a philosopher, are named as debates; and every chapter reconstructs at least one ARGUMENT step by step, so your notes must state the key arguments precisely (premises, conclusion, the main objection, the reply) with sources (the Stanford Encyclopedia of Philosophy, plato.stanford.edu, and the Internet Encyclopedia of Philosophy, iep.utm.edu, are the preferred sources for arguments and interpretations).

## Method
1. Draft a list of 60–100 specific claims the chapter will need: dates, numbers, names, places, who did/said/wrote what, short quotations (only famous, quotable lines; for each, the exact work and passage and the translation used, because many famous philosophy quotations are paraphrases or misattributions: record any you find to be misattributed under NOT VERIFIED with the evidence), attributions of interpretations to scholars, and 5–7 reading-list books (author, exact title, first publication year; recent, reputable, ideally including non-Western or diverse scholarship).
2. Verify each against a source you actually read now:
   - Primary method for arguments and interpretations: the Stanford Encyclopedia of Philosophy (`curl -s https://plato.stanford.edu/entries/<entry>/`) and the Internet Encyclopedia of Philosophy (`curl -s https://iep.utm.edu/<entry>/`); strip the HTML and grep.
   - For dates, names and biography: English Wikipedia raw wikitext via curl through the proxy, e.g. `curl -s "https://en.wikipedia.org/w/index.php?title=Stamp_Act_1765&action=raw"` saved under your own scratch folder and grepped. Wait ~2 seconds between fetches (the API rate-limits). WebFetch may fail on Wikipedia; curl works.
   - WebSearch: AT MOST 20 calls (a budget of 200 per turn is shared by all agents). Use it for quotations, book details, and historians' arguments that Wikipedia does not settle.
   - Never count memory as confirmation.
3. Where sources disagree, or a figure is an estimate, say so and give the range.

## Output
Write the notes to the file path given in your prompt, in this form:

```
# Verified facts — <chapter title> (researched <date>)
## <topic>
- <fact, stated precisely, with any caveat> [source: <URL>]
...
## Reading list (verified)
- Author, *Exact Title* (year) — one-line description [source: URL]
## Quotations (verified wording)
- "..." — speaker, work, date [source: URL]
## Debates
- <debate, who argues what> [source: URL]
## NOT VERIFIED — do not use
- <claim> (why)
```

Do not edit anything else in the repository. Your final message: the notes file path, counts (facts verified, items not verified), searches used, and any surprises (things commonly believed that the sources contradict).
