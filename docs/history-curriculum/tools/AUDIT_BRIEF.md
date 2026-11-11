# Fact-audit brief

You are auditing one chapter of a history textbook (an adult, general-reader site). Your job is to find errors, not to praise. You must NOT edit any repository files.

## Get the text
Run: `python3 docs/history-curriculum/tools/extract.py <SQL_FILE>`
It prints the chapter's markdown, then its quiz JSON. Audit both (including checkpoint answers and the "x:" explanations, which are also factual claims).

## What to check
List every checkable claim: dates, numbers, names, places, who did/said/wrote what, titles of works, attributions of ideas to historians, direct quotations, and every reading-list entry (author, exact title, year). Skip pure opinion/framing.

For each claim, VERIFY IT WITH A SOURCE YOU ACTUALLY FIND NOW.

Budget rule (important): WebSearch is capped at 200 calls per turn SHARED by all agents running at once, so use AT MOST 25 WebSearch calls. Do most checking with WebFetch on English Wikipedia articles (https://en.wikipedia.org/wiki/<Title>), which is reachable and lets one page confirm many claims: fetch the article for each main topic of a section and check every claim it covers, asking WebFetch a precise question that lists the claims. Use WebSearch only for claims Wikipedia does not settle (quotations, reading-list entries, scholarly attributions). www.britannica.com refuses automated fetches; don't try it. Prefer encyclopedias (Wikipedia with care, checking its cited figures), museum/university/government pages, publisher pages, library catalogues, journal pages. Do not count your own memory as confirmation: if you could not find a source, the verdict is UNVERIFIED, not CONFIRMED.

Be efficient: group related claims into one search where sensible. Prioritise claims that are specific, surprising, numerical, or attributed to a named person. If you run out of budget, say which claims you did not reach.

## Verdicts
- CONFIRMED — a source you found supports it (give URL).
- WRONG — a source contradicts it (give URL and the correct fact).
- IMPRECISE — broadly right but overstated, a contested figure presented as settled, or a date/number slightly off (give URL and better wording).
- UNVERIFIED — you searched and found nothing either way.

## Report format (your final message)
1. A line: "Searches attempted: N, searches that returned results: M". If WebSearch is failing, stop early and say so plainly.
2. A table of every claim that is WRONG, IMPRECISE or UNVERIFIED: | # | exact quote from the text | verdict | what the source says | source URL | suggested fix |
3. A count of CONFIRMED claims, with a compact list (claim → URL).
Keep the report factual and terse. Do not rewrite the chapter.
