# Audit ledger — What Is Philosophy? (18 Nov 2026)

File: `supabase/content/philosophy--what-is-philosophy.sql`. Written source-first from `research/what-is-philosophy.md`; two independent passes (A top-down, B bottom-up; about 75 claims confirmed by each) against SEP (pythagoras, knowledge-analysis, logic-india, mohism, thought-experiment, doing-allowing, epistemology-india, comparphil-chiwes, latin-american-philosophy, socrates, mulla-sadra, sellars), IEP (deductive-inductive-arguments, analytic-philosophy) and Wikipedia. No claim found WRONG. Pass A also confirmed that every section and chapter title the chapter names matches `src/lib/seed.ts`.

| Claim (before) | Verdict | Source | Change |
|---|---|---|---|
| Thomson "named 'the trolley problem' in 1976, moved the choice to a bystander" | IMPRECISE (A, B) | SEP doing-allowing; WP Trolley problem | "…in 1976, later (in 1985) moved the choice to a bystander" |
| "Euthyphro offers five definitions of piety" | IMPRECISE (A, B) | WP Euthyphro (4th suggested by Socrates) | "the definitions of piety that Euthyphro offers or accepts fail one by one" |
| Sellars quote with commas | IMPRECISE (B) | SEP sellars (PSIM) | exact SEP wording, no commas |
| Norton: "every thought experiment is an argument in disguise" | IMPRECISE, borderline (A) | SEP thought-experiment | "any thought experiment is really an argument, often in disguise" |
| Mullā Ṣadrā (1571–1636) | IMPRECISE, minor (A) | SEP mulla-sadra | "c. 1571–1636" |
| Nagel: "from other minds to the meaning of life" | IMPRECISE (A) | catalogue contents | "from how we know anything to the meaning of life" |
| Taylor: "Philosophy and the history of philosophy are one" | UNVERIFIED (A, B) | research notes: IEP metaphilosophy quotes Taylor 1984: 17 | kept |
| Analytic view of history as "largely a series of mistakes"; 1970s change | UNVERIFIED (A, B) | research notes: IEP metaphilosophy; IEP analytic-philosophy (1970s) | kept |
| Park: earlier view began philosophy in "India or Africa" | IMPRECISE (B) / CONFIRMED (A) | SEP comparphil-chiwes ("India and/or Africa") | kept |
| Jesuits' 1687 *Confucius Sinarum Philosophus*; Europeans "immediately recognised it as philosophy" | IMPRECISE (B) / CONFIRMED (A) | SEP comparphil-chiwes | kept |
| *tetsugaku* standard in Chinese, Korean and Vietnamese | UNVERIFIED (Vietnamese, A) | research notes: WP Nishi Amane | kept |
| Russell: value "partly in their very uncertainty" (quiz) | UNVERIFIED (A, B; text blocked) | search excerpts of ch. XV ("largely in its very uncertainty") | kept |
| Burkert "showed" (1960) | CONFIRMED with note (B) | SEP pythagoras ("demonstrated"; Riedweg 2005 partly defends) | kept |
| Hatata: "most scholars now accept his authorship" | KNOWN_ISSUE | research/early-modern--early-modern-beyond-europe.md (Wion 2021; Cantor/Egid/Merawi 2024) | "many scholars, including its recent translators, accept his authorship, but the question remains disputed" |
| Wittgenstein: "therapy for confusions caused by ordinary language" | KNOWN_ISSUE | research/twentieth--wittgenstein.md (PI §§90, 116 via IEP/WP) | "confusions that arise when we are misled by the forms of our language" |
