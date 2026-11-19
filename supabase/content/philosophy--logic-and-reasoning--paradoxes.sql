-- Paradoxes: the Liar, the Heap and Zeno — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/paradoxes @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- {{image: Title | caption}} markers resolve to real Wikipedia images at read
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
    'philosophy/logic-and-reasoning/paradoxes',
    'research',
    'advanced',
    'read',
    $paradoxes_master$> **A paradox is an argument that seems sound but ends somewhere we cannot accept.** This chapter works through three ancient families of them and what they have taught: Zeno's arguments against motion (the Arrow, the Stadium and the modern quarrel over "supertasks"), the Heap and the theories of vagueness it provoked, and the Liar, with its medieval, Tarskian, Kripkean and dialetheist answers. It traces parallels in the *Zhuangzi*, the Mohist canons and Nāgārjuna, and ends with Russell's paradox and its relatives: the barber, the heterological, Curry's and Yablo's.

## What Makes a Paradox

The philosopher R. M. Sainsbury gave the definition most textbooks now start from:

```quote
"This is what I understand by a paradox: an apparently unacceptable conclusion derived by apparently acceptable reasoning from apparently acceptable premises."
R. M. Sainsbury · Paradoxes, 3rd edition, p. 1 · 2009
```

The definition shows the three ways out. If the conclusion really is unacceptable, then either a **premise** (a claim the argument starts from) is false, or the **reasoning** is faulty, despite appearances. Or the conclusion is acceptable after all, and our sense of absurdity is what must give way. Every response to every paradox in this chapter takes one of those three routes.

W. V. Quine, in an essay of 1962 reprinted as "The Ways of Paradox", sorted paradoxes along these lines. A **veridical** paradox has a surprising but true conclusion. A **falsidical** one hides a fallacy, like the schoolroom "proof" that 2 = 1 which quietly divides by zero; Quine put some of Zeno's arguments here. An **antinomy** reaches a self-contradiction by reasoning we normally trust, and these, Quine thought, bring on crises in thought. Of Russell's paradox he wrote that it "packs a surprise that can be accommodated by nothing less than a repudiation of our conceptual heritage". William Lycan (2010) objected that which box a paradox goes in depends on what we currently know, such as whether anyone has yet found the fallacy.

## Zeno Again: the Arrow and the Stadium

The chapter *The Presocratics: from Myth to Argument* sets out Zeno of Elea's **Dichotomy** step by step: to cross a distance you must first cross half of it, before that a quarter, and so on without end, so the journey seems to need infinitely many sub-journeys. That chapter also gives the standard mathematical answer, that 1/2 + 1/4 + 1/8 + ... sums to 1. Here we go further.

Zeno, born about 490 BCE, survives almost entirely in paraphrase, chiefly through Aristotle and his commentator Simplicius. Aristotle reports four arguments against motion in *Physics* VI.9. His version of the second, in R. P. Hardie and R. K. Gaye's translation, runs: "In a race, the quickest runner can never overtake the slowest, since the pursuer must first reach the point whence the pursued started, so that the slower must always hold a lead." Aristotle speaks of "the slowest"; the familiar tortoise appears in Simplicius, and scholars disagree about when it entered the story. In Nick Huggett's numbers, if Achilles runs at 1 metre per second, the tortoise at 0.1 and the head start is 0.9 m, Achilles must make up 0.9 m, then 0.09 m, then 0.009 m, endlessly; yet he draws level after one second.

The **Arrow** is a different kind of argument. Aristotle says it follows from assuming that time is composed of "nows" (instants). Diogenes Laertius reports a compressed form: "What is in motion moves neither in the place it is nor in one in which it is not." Set out as an argument:

1. Time is composed of instants and nothing else.
2. At any instant, the flying arrow occupies a space equal to itself: it travels no distance during the instant.
3. Whatever occupies a space equal to itself is at rest.
4. So at every instant the arrow is at rest.
5. So, since the flight is made of nothing but instants, the arrow never moves.

Premise 2 looks forced. If the arrow moved *during* an instant, it would be in different places at the instant's beginning and end, and then the instant would have parts, which instants by definition do not.

**Objection.** Aristotle rejected premise 1: time, he said, is not composed of indivisible moments any more than any other magnitude is composed of indivisibles. The modern "at-at" theory instead attacks premise 3 and the step from 4 to 5. Velocity at an instant is not distance over the instant's duration (0 metres over 0 seconds is not a number); it is the limit of average speeds over ever shorter intervals, the derivative of calculus. Motion just *is* being at different places at different times. The arrow therefore has a velocity *at* an instant even though it moves no distance *during* one.

**Reply.** Huggett notes that this "carries the counter-intuitive implication that motion is not something that happens at any instant, but rather only over finite periods of time". Bergson thought the at-at view amounted to the absurdity that "movement is composed of immobilities". Bradley Dowden adds that the paradox still bites for anyone who thinks motion is an intrinsic property of an instant, a propensity to be elsewhere.

The **Stadium**, about rows of bodies passing one another at equal speeds, concludes, Aristotle says, "that half the time is equal to its double". The usual verdict is that Zeno confused relative velocities, though some scholars resist it. On one modern reading the four arguments form a pincer: the Dichotomy and Achilles attack the view that space and time are continuous, the Arrow and Stadium the view that they are discrete.

## Has Zeno Been Answered?

Aristotle's fullest answer, in *Physics* VIII, distinguishes **actual** infinity (infinitely many parts all present at once) from **potential** infinity (a division that can always go on). A continuous run contains infinitely many halves only potentially; in the translation quoted by the Internet Encyclopedia of Philosophy (IEP), "If the units are actual, it is not possible: if they are potential, it is possible." This satisfied nearly all scholars for 1,500 years, and it bears on the debate about infinity in *Kant*. Some historians call it a verbal quibble; Cantor replied in 1887 that every potential infinite presupposes an actual one.

The modern "Standard Solution", following Russell and developed by Grünbaum (1967) and Wesley Salmon, rests on nineteenth-century mathematics: Cauchy's theory of infinite sums, the limit definition of the derivative due to Cauchy and Weierstrass, Dedekind's real numbers (1872) and Cantor's set theory. The theory was needed: as Huggett notes, naive juggling with 1 − 1 + 1 − 1 + ... "leads to the conclusion that 1 = 0". Grünbaum added that a line is made of uncountably many points of zero length, and no sum of zeros gives a length, so length must belong to sets of points. On this view Achilles' path does contain an actual infinity of parts; Zeno's mistake was to think that too many.

Two doubts remain. First, mathematics describes physical space only if space has the structure of the mathematical continuum, and, as Huggett writes, nothing guarantees that a priori; quantum theories of gravity may imply that it does not. Second, there are **supertasks**, J. F. Thomson's 1954 term for completing infinitely many tasks in finite time. Russell had said that Achilles does just that. Max Black (1950–51) and Thomson replied that an infinite series of tasks cannot be completed, whatever the mathematics of the distances says. Thomson's lamp makes the case:

1. Switch a lamp on for half a minute, off for a quarter, on for an eighth, and so on. All the switchings are over within one minute.
2. If this supertask can be completed, then at the end of the minute the lamp is either on or off.
3. It cannot be on, since every "on" is followed by an "off"; it cannot be off, since every "off" is followed by an "on".
4. So the supertask is impossible, and Russell was wrong to describe Achilles' run as one.

**Objection.** Paul Benacerraf (1962) answered that the description fixes the lamp's state at every moment *before* the minute ends and says nothing about the moment *at* the end, which is not in the sequence. Premise 3 does not follow: the lamp could be either on or off. Thomson has shown only that his story is incomplete.

**Reply.** Defenders of Thomson's intuition ask what counts as a "task", and whether a task needs some minimum time; physical versions, from bouncing balls to exotic spacetimes in relativity, are still debated. Dowden's summary is candid: "there is no agreement in the philosophical community on most of the questions".

## Parallels in China and India

Chapter 33 of the *Zhuangzi* lists the ten theses of Hui Shi (active in the late fourth century BCE; dates vary), two of which *Mozi, the Daoists and the Legalists: the Hundred Schools* quotes. It then records twenty-one unexplained paradoxes that "the disputers" used in answering Hui Shi. One, in Chris Fraser's translation, runs: "A one-foot stick, every day take away half of it, in a myriad ages it will not be exhausted." Fraser calls it "a version of Zeno's racetrack paradox"; it belongs to the anonymous disputers, not to Hui Shi. A Mohist canon (B60) seems to reply: in moving a measured length we do not first cover one fraction and then another, but can cross the whole distance in one stage.

Another of the twenty-one should not be equated with Zeno's Arrow: "The barbed arrow at its swiftest, there is a time when it neither moves nor stops." As Fraser notes, Zeno's arrow is at rest at every instant, whereas this arrow is at some time neither moving nor at rest; it is not a Chinese rediscovery of Zeno.

In India, chapter 2 of Nāgārjuna's *Mūlamadhyamakakārikā* argues that motion is impossible. Siderits and O'Brien (1976) compared it with Zeno; Jan Westerhoff thinks the aims were Buddhist. One argument: there is no mover that does not move, so mover and motion depend on each other and neither exists by its own nature (*svabhāva*). Another: "the mover moves" would need two motions, one making it a mover and one by which it moves. The word for going also means passing from life to life, so the point bears on rebirth (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*).

```checkpoint
q: What is the "at-at" answer to Zeno's Arrow?
a*: Motion is being at different places at different times, and velocity at an instant is a limit of average speeds, so the arrow has a velocity at an instant though it moves no distance during one.
a: Time is not made of instants, so premise 1 is false.
x: That is Aristotle's answer. The at-at theory accepts instants and attacks the step from rest at each instant to no motion at all.
a: The arrow really is at rest, and motion is an illusion.
x: That accepts Zeno's conclusion instead of answering it.
a: Zeno confused the speed of the arrow with its speed relative to other arrows.
x: Confusion about relative velocity is the usual diagnosis of the Stadium, not the Arrow.
hint: Think of the derivative in calculus.
why: The at-at theory keeps instants but denies that being at rest at each one adds up to no motion. Its cost, as Huggett and Bergson note, is that motion never happens at any instant, only over intervals.
---
q: Which statement about the one-foot stick paradox is accurate?
a: It is the first of Hui Shi's ten theses.
x: It is not among the ten theses; the *Zhuangzi* lists it with the twenty-one paradoxes of the disputers who answered Hui Shi.
a: It was devised by Nāgārjuna to show that motion is impossible.
x: Nāgārjuna's arguments about motion are in chapter 2 of his *Mūlamadhyamakakārikā*; the stick comes from the Chinese *Zhuangzi*.
a*: It is one of twenty-one unexplained paradoxes that the *Zhuangzi* attributes to the anonymous disputers, and it resembles Zeno's Dichotomy.
a: Chinese sources show that its author discovered Zeno's Arrow independently.
x: The stick resembles the Dichotomy, and the *Zhuangzi*'s arrow paradox is a different one: an arrow neither moving nor at rest.
hint: Look at who, according to *Zhuangzi* chapter 33, used these puzzles.
why: Fraser calls it "a version of Zeno's racetrack paradox"; a Mohist canon (B60) seems to answer it by saying a measured length can be crossed in one stage.
```

## The Heap

The **sorites** takes its name from the Greek *sōros*, "heap". It is usually credited to Eubulides of Miletus, a Megarian philosopher of the mid-fourth century BCE and a contemporary of Aristotle. Diogenes Laertius lists seven puzzles of his, including the Liar, the Heap and its companion the Bald Man: pluck one hair at a time from a full head; at which hair does the man become bald? The Sceptics later used the heap against the Stoics (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*), and some slippery slopes in *Informal Fallacies and Everyday Reasoning* rest on the same vagueness. In Diana Raffman's wording:

1. One grain of wheat does not make a heap.
2. If one grain doesn't make a heap, then two grains don't.
3. If two grains don't make a heap, then three grains don't.
4. ... and so on, until: if 999,999 grains don't make a heap, then one million grains don't.
5. Therefore, one million grains don't make a heap.

Each conditional premise seems undeniable, because one grain cannot turn a non-heap into a heap; Crispin Wright called this feature of words like "heap" their **tolerance**. Each step is **modus ponens** ("if P then Q; P; so Q"), a basic rule of logic. Run backwards, the same reasoning shows that one grain makes a heap.

The root is **vagueness**. C. S. Peirce (1902) traced it not to anyone's ignorance but to the fact that "the speaker's habits of language were indeterminate". A term is vague, most agree, to the extent that it has **borderline cases**. This is not **ambiguity**: fix which sense of "tall" you mean and borderline cases remain.

How the Stoic Chrysippus (third century BCE) answered is disputed. The Stanford Encyclopedia's sorites entry lists him first among **epistemicists**, who hold that there is a sharp line we cannot know. Susanne Bobzien argues otherwise: on her reading, borderline sentences in a sorites series have no "assertibles" (Stoic truth-bearers) corresponding to them, and since we cannot tell where the borderline begins, "it is rational for us to stop answering while still on safe ground". That would mean Chrysippus already saw the problem of higher-order vagueness, described below.

The modern options follow the three routes out.

**Deny a premise: epistemicism.** Roy Sorensen and Timothy Williamson hold that "vagueness is just a form of ignorance". One conditional premise is false: some grain makes the difference. Classical logic and **bivalence** (every statement is true or false) are kept. We cannot find the line, Williamson argues, because meaning is fixed by a pattern of use no one can survey. *Objection:* even its defenders grant that this is intuitively implausible. *Reply:* every rival pays a price too, and this one keeps logic intact.

**Change the semantics: supervaluationism.** Kit Fine (1975) called a vague sentence "super-true" if it is true on every admissible way of making its words precise; a borderline sentence is neither true nor false. It is then super-true that *some* grain crosses the line, though no particular grain does. *Objection:* this yields true "either-or" statements with no true side, and Williamson argues that standard proof rules fail.

**Degrees of truth.** Lotfi Zadeh introduced fuzzy sets in 1965, with membership measured on a scale from 0 to 1, and later, with others, proposed infinite-valued logics for vagueness: as baldness comes in degrees, so does the truth of "he is bald". *Objections:* what exactly is a degree of truth, and why this number rather than that? (*Formal Logic: Propositions, Predicates and Proofs* introduces many-valued logics.)

**Context.** Hans Kamp (1981) argued that each conditional is true in its own context, but asserting them all together makes the context incoherent. Raffman adds a psychological "backward spread": when a speaker marching through a series finally switches category, the earlier cases shift too.

**Accept the conclusion.** Peter Unger (1979) concluded that the negative sorites arguments are sound, so terms such as "heap" and "bald" apply to nothing; in Sorensen's words, Unger concluded "that there are no children".

All of these face **higher-order vagueness**: "borderline case" itself has borderline cases. Twilight lies between day and night, but when does twilight begin? Adding a third value merely relocates the sharp line; as Sorensen puts it, "any finite number of intermediates just delays the inevitable". Most theorists think the sorites solvable, but each solution, as the Stanford Encyclopedia says of supervaluationism, comes "only at a cost to other intuitions".

## The Liar

Eubulides' second famous puzzle asks: "A man says that he is lying. Is what he says true or false?" (Diogenes says only that Eubulides discussed it.) Athenaeus tells that Philitas of Cos wasted away over it. Chrysippus wrote many books on it, almost all lost; Bobzien suggests he found an ambiguity in "I am speaking falsely". The Liar was also discussed in Arabic from the mid-ninth to the mid-thirteenth centuries and in fifteenth-century Shiraz, traditions that, Stephen Read notes, are only starting to be studied.

{{image: Epimenides paradox | Epimenides of Crete, whom Clement of Alexandria identified as the prophet behind the line "The Cretians are alway liars". Said by a Cretan, it sounds like a Liar, but it is not a genuine paradox.}}

The best-known "Liar", Epimenides', is not one. The letter to Titus quotes a Cretan prophet: "The Cretians are alway liars, evil beasts, slow bellies" (King James Version). If that is false, it follows only that some Cretan sometimes tells the truth, who need not be Epimenides. The sentence can simply be false. It seems to have been read as a logical paradox only since the nineteenth century.

Medieval logicians wrote on such **insolubles** from the late twelfth century without, Read observes, any sense of crisis. Thomas Bradwardine wrote his *Insolubles* at Oxford between 1321 and 1324; Ralph Strode called him the first to discover "something worthwhile" about them. Buridan, whose career appears in *Scotus, Ockham and the Late Medieval Debates*, held in his mature *Sophismata* (mid-1350s) that every proposition "virtually implies" another asserting its own truth; "Socrates utters a falsehood", said by Socrates, is false because that implied proposition cannot be true.

Here is the modern argument:

1. Let L be the sentence "L is false".
2. If L is true, then things are as it says, so L is false.
3. If L is false, then things are as it says, so L is true.
4. So L is true if and only if it is false.
5. If every sentence is true or false, L is both, a contradiction; and in classical logic a contradiction implies everything, so every claim would follow.

**Objection.** Deny the assumption in step 5: L is a truth-value **gap**, neither true nor false.

**Reply: the strengthened Liar.** Take S: "S is not true". Every sentence is either true or not true, gaps included. If S is true, it is not true; if it is not true, which is what it says, it is true. Gaps do not help. Nor does banning sentences that mention themselves: Max says "Agnes' claim is true", Agnes says "Max's claim is not true", and neither sentence is about itself.

Tarski's analysis (in Polish, 1933; German, 1935) starts from "Convention T": an account of truth must yield every instance of the schema "'snow is white' is true if and only if snow is white". In a language that can talk about its own semantics, this leads straight to the Liar. So Tarski concluded that a language cannot define its own truth predicate: truth for an **object language** must be defined in a stronger **metalanguage**, and so on up a hierarchy. *Objection:* self-reference is unproblematic in natural languages, and Saul Kripke noted that if two people each say that everything the other says is true, each would need to speak at a higher level than the other.

Kripke's "Outline of a Theory of Truth" (1975) lets a language contain its own, partial, truth predicate. Starting from nothing, one adds true sentences to its extension and false ones to its anti-extension, stage by stage, until a "fixed point" is reached. The Liar never enters either list. But the theory cannot truly say "the Liar is not true", and every new label for the Liar ("neither", "not determinately true") can be built into a new Liar: the problem of **revenge**.

**Dialetheism** takes the third route. A *dialetheia* is a sentence that is true and whose negation is also true; Graham Priest and Richard Routley coined the word in 1981, inspired by Wittgenstein's image of Russell's contradiction as "like a Janus head". Priest's "logic of paradox" lets the Liar be both true and false while blocking the step from contradiction to everything, using the paraconsistent logics of *Formal Logic: Propositions, Predicates and Proofs*; Florencio Asenjo, born in Buenos Aires, had anticipated it in 1966. Priest, Jay Garfield and Deguchi read some of Nāgārjuna's contradictions as dialetheias, a disputed reading. Dialetheism remains a minority view.

## Russell's Paradox and Its Relatives

*Frege, Russell and the Birth of Analytic Philosophy* tells how Russell's paradox overturned Frege's system. For sets: assume every condition defines a set, and take R, the set of all sets that are not members of themselves. If R is a member of R, it is not; if it is not, it is. Zermelo's 1908 axiom of **Separation** lets you collect members only out of a set you already have; the argument then proves only that there is no set of all sets. The barber is often offered as a popular version, but Russell rejected it: "I once had a form suggested to me which was not valid, namely the question whether the barber shaves himself or not," he said in lectures of 1918. It shows only that no such barber exists.

The family is large. Kurt Grelling and Leonard Nelson (1908) called an adjective **heterological** if it does not describe itself: "German" is heterological, since it is not a German word. Is "heterological" heterological? Either answer yields its opposite. **Curry's paradox** (1942) needs no negation. Let k be "If k is true, then time is infinite". Suppose k is true; then, by what it says, time is infinite. So, discharging the supposition, if k is true then time is infinite; but that is k, so k is true, and time is infinite. Any claim could replace "time is infinite", so many logics that tame the Liar are still overwhelmed. Stephen Yablo's paradox (1993) uses an infinite list of sentences, each saying "all the later sentences are untrue", with no sentence about itself; Priest argued that a hidden circularity remains.

Gödel turned a Liar-like construction about *provability* rather than truth into a theorem; *Formal Logic: Propositions, Predicates and Proofs* explains it and warns against loose slogans about sentences that "say of themselves" that they are unprovable.

```checkpoint
q: Why is the Epimenides ("Cretans are always liars", said by a Cretan) not a genuine paradox?
a: Because Epimenides did not actually exist.
x: Whether or not he existed, the logical point concerns the sentence, which can be consistently assigned a truth value.
a*: Because it can simply be false: its falsity requires only that some Cretan sometimes tells the truth, and that need not be Epimenides.
a: Because it was quoted in the Bible rather than in a logic text.
x: Its source does not matter; what matters is whether any assignment of truth or falsity avoids contradiction.
a: Because it is both true and false, as dialetheists say.
x: Dialetheists apply that verdict to genuine Liars; this sentence can be false without contradiction.
hint: What follows if "all Cretans are always liars" is false?
why: A genuine Liar, such as "this sentence is false", has no consistent classical truth value. The Epimenides has one, false, as long as some other Cretan has told the truth.
---
q: What does the "strengthened" Liar show?
a: That Tarski's hierarchy cannot be defined.
x: The strengthened Liar targets truth-value gaps, not Tarski's hierarchy.
a: That self-reference is always illegitimate.
x: The Max-and-Agnes pair and Yablo's list produce paradox without a sentence that mentions itself.
a: That bivalence is true.
x: It shows that abandoning bivalence alone does not escape the paradox; it does not prove bivalence.
a*: That saying the Liar is neither true nor false does not help, since "this sentence is not true" is paradoxical even if there are gaps.
hint: Every sentence, gaps included, is either true or not true.
why: If "S is not true" is true, it is not true; if it is not true, it is. This is the root of the revenge problem that also confronts Kripke's fixed points.
```

## What the Paradoxes Teach

Each family forced a choice. Zeno pushed philosophers towards theories of the continuum, infinite sums and instantaneous velocity; whether physical space and time are such continua remains a question for physics. The heap forces a choice between classical logic with unknowable sharp lines and a non-classical semantics. The Liar, "perhaps the most virulent strain of paradox" in the Stanford Encyclopedia's phrase, has motivated logics with gaps and with gluts, though some logicians argue classical logic can be kept. Russell's paradox gave us axiomatic set theory, which made possible Gödel's and Cohen's independence results.

Some logicians have proposed treating the Liar and the sorites together. Either way, Eubulides' two puzzles, each a few words long, still have no answer that everyone accepts.

## Further exploration

- **R. M. Sainsbury, *Paradoxes* (1987).** The standard introduction, working through Zeno, the sorites, the Liar and Russell; the third edition appeared in 2009.
- **Roy Sorensen, *A Brief History of the Paradox: Philosophy and the Labyrinths of the Mind* (2003).** Twenty-four chapters, each pairing a philosopher with a paradox, from the Greeks to Quine.
- **Wesley C. Salmon (ed.), *Zeno's Paradoxes* (1970).** The classic modern articles, including Russell, Black, Thomson, Grünbaum and Benacerraf; reprinted in 2001.
- **Timothy Williamson, *Vagueness* (1994).** The leading defence of epistemicism: vague words have sharp boundaries we cannot know.
- **Diana Raffman, *Unruly Words: A Study of Vague Language* (2014).** A contextualist-inspired account of vagueness by the author of the Stanford Encyclopedia's sorites entry.
- **Graham Priest, *In Contradiction* (1987).** The case for true contradictions; a second, expanded edition appeared in 2006.
- **Jay L. Garfield, *The Fundamental Wisdom of the Middle Way* (1995).** A translation of and commentary on Nāgārjuna's *Mūlamadhyamakakārikā*, including chapter 2 on motion.$paradoxes_master$,
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
  select $paradoxes_quiz$[
    {"type": "mcq", "prompt": "Which response to the sorites holds that one conditional premise is simply false, because vague words have sharp boundaries whose location we cannot know?", "options": ["Epistemicism, defended by Sorensen and Williamson", "Supervaluationism, proposed by Kit Fine", "Fuzzy logic, based on Zadeh's fuzzy sets", "Nihilism, defended by Peter Unger"], "answerIndex": 0, "explanation": "Epistemicists keep classical logic and bivalence and treat vagueness as ignorance of a hidden line. Supervaluationists deny that any particular grain is the cut-off; degree theorists make truth a matter of degree; Unger accepted the conclusion, that words like 'heap' apply to nothing.", "id": "q1"},
    {"type": "mcq", "prompt": "What was Benacerraf's (1962) objection to Thomson's lamp argument?", "options": ["That the switchings cannot all be fitted into one minute", "That the description fixes the lamp's state at every moment before the minute ends but says nothing about its state at the end, so it could be either on or off", "That the lamp must be on, because the first switching turned it on", "That Russell had already shown supertasks to be impossible"], "answerIndex": 1, "explanation": "The end of the minute is not in the sequence of switchings, so the premise that the lamp can be neither on nor off does not follow. Thomson had shown only that his description is incomplete. Russell, by contrast, held that Achilles does complete infinitely many tasks.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Russell say about the barber who shaves all and only those who do not shave themselves?", "options": ["That it was the form in which he first discovered his paradox", "That it shows naive set theory to be inconsistent", "That it was a form suggested to him which was not valid, and whose contradiction is not very difficult to solve, since there is simply no such barber", "That it was Zermelo's independent discovery"], "answerIndex": 2, "explanation": "In his lectures of 1918 Russell rejected the barber as an invalid form of his paradox. It shows only that no such barber exists, which is why Quine counted it a veridical paradox, unlike the set-theoretic antinomy.", "id": "q3"},
    {"type": "mcq", "prompt": "How does Kripke's 1975 theory of truth handle the Liar?", "options": ["It assigns the Liar both truth and falsity, as dialetheism does", "It bans any sentence that refers to itself", "It places truth for each language in a stronger metalanguage", "It builds up a partial truth predicate in stages until a fixed point, where the Liar is in neither its extension nor its anti-extension"], "answerIndex": 3, "explanation": "Kripke's construction leaves the Liar a gap. Its cost is that the theory cannot truly say 'the Liar is not true', which invites revenge. Tarski's answer is the hierarchy of metalanguages; Priest's dialetheism treats the Liar as both true and false.", "id": "q4"},
    {"type": "open", "prompt": "Set out Zeno's Arrow as a step-by-step argument. Give the strongest objection to it and the best reply, and say whether you think the paradox has been resolved.", "rubric": "A strong answer reconstructs the premises: time is made of instants; at each instant the arrow occupies a space equal to itself and travels no distance; whatever occupies a space equal to itself is at rest; so it is at rest at every instant and, since the flight is only instants, never moves. It explains why the second premise seems forced (motion during an instant would give the instant parts). It presents Aristotle's objection (time is not composed of indivisible nows) and/or the at-at theory (velocity at an instant is a limit of average speeds; motion is being at different places at different times). It gives the reply that motion then never happens at any instant (Huggett), Bergson's charge that movement would be composed of immobilities, and Dowden's point about motion as an intrinsic propensity. Credit distinguishing the Chinese arrow paradox in Zhuangzi 33 (neither moving nor at rest) from Zeno's.", "id": "q5"},
    {"type": "open", "prompt": "Explain the Liar paradox and compare two of the main responses to it (for example Tarski's hierarchy, Kripke's fixed points and Priest's dialetheism). Why does the 'revenge' problem matter?", "rubric": "A strong answer shows that 'this sentence is false' is true if and only if it is false, and that in classical logic the resulting contradiction implies everything. It explains that a gap response meets the strengthened Liar ('this sentence is not true'), and that Liar cycles (Max and Agnes) and Yablo's list arise without a sentence referring to itself. It describes Tarski's Convention T, his conclusion that a language cannot define its own truth predicate, and the hierarchy with its objections (natural-language self-reference; Kripke's case of two speakers each needing a higher level); Kripke's partial predicate built up to a fixed point, which cannot state its own solution; and dialetheism (Priest and Routley, LP, Asenjo), which accepts the Liar as true and false while rejecting explosion. Revenge: whatever status a theory gives the Liar can be used to build a new Liar. Credit the ancient and medieval history (Eubulides, Chrysippus, Bradwardine, Buridan) and noting that the Epimenides is not a genuine paradox.", "id": "q6"}
  ]$paradoxes_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/paradoxes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
