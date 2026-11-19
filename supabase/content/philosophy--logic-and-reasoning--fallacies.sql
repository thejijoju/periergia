-- Informal Fallacies and Everyday Reasoning — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/fallacies @ research/advanced/read.
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
    'philosophy/logic-and-reasoning/fallacies',
    'research',
    'advanced',
    'read',
    $fallacies_master$> **A fallacy is, on one working definition, "an argument that seems to be better than it really is".** This chapter teaches the classic informal fallacies, from ad hominem and the straw man to the slippery slope and the appeal to authority, and shows when each is a mistake and when it is good reasoning. It traces how the list was assembled, from Aristotle, Nyāya and the Mohists to Locke, Whately and modern theory, weighs the argument that fallacy-naming should be abandoned, and ends with everyday claims and the news: base rates, bias and lateral reading.

## What Is a Fallacy?

In everyday speech a "fallacy" is often just a popular false belief. Scholars mostly mean a kind of bad *argument*: the Stanford Encyclopedia of Philosophy (SEP) adopts the working definition "an argument that seems to be better than it really is". The seeming matters: a fallacy is worth naming because it looks respectable.

An **argument** here means a set of claims, the **premises**, offered as support for another claim, the **conclusion**. The chapter *Arguments: Validity, Soundness and Form* explains when an argument is **valid** (the conclusion cannot be false if the premises are true) and introduces **formal fallacies**, arguments that instantiate an identifiable invalid pattern, such as **affirming the consequent** ("If she's Brazilian, she speaks Portuguese; she speaks Portuguese; so she's Brazilian"). This chapter concerns **informal fallacies**: faults whose weakness, as the SEP puts it, is better exposed without formal languages; the tools for testing form are developed in *Formal Logic: Propositions, Predicates and Proofs*.

The definition turns out to be surprisingly hard. What the Australian logician C. L. Hamblin in 1970 presented as the nearly universal definition (later called the "standard definition") defined a fallacy as an argument "that seems to be valid but is not so". That is too narrow and too wide at once. Begging the question, one of the oldest fallacies, is perfectly *valid*: the conclusion follows, because it was already assumed. And many good everyday arguments are inductive, never meant to be valid at all. The Internet Encyclopedia of Philosophy (IEP) finds researchers "deeply divided" over the definition, and adds a rule worth keeping: "A charge of fallacious reasoning always needs to be justified."

One caution: the word "sophistical" carries Plato's hostile portrait of the sophists as dishonest arguers, which, as *Socrates and the Sophists* explains, is unfair to the historical teachers.

## How the List Was Made

The SEP names two "fountainheads" of the textbook list, Aristotle and Locke, and calls them "uneasy bedfellows".

**Aristotle.** The history "begins with Aristotle's work, On Sophistical Refutations", which reads as a continuation of his *Topics*, a treatise on argument in question-and-answer debate (see *Aristotle*). It opens: "Let us now treat of sophistical refutations, that is, arguments which appear to be refutations but are really fallacies and not refutations" (in the translation the SEP quotes). Aristotle discusses thirteen ways a refutation can be sophistical, in two groups: six that *depend on language* (equivocation, amphiboly, combination and division of words, accent, form of expression) and seven that *do not* (accident, *secundum quid*, the consequent, non-cause, begging the question, *ignoratio elenchi* and many questions). These are not the modern formal and informal fallacies under other names. (On one reading *ignoratio elenchi* is not a separate fallacy, so some count twelve.) Such arguments persuade because "the inexperienced are like those who view things from a distance".

**Middle Ages.** Medieval Latin textbooks trained students for disputation; the seventh tract of Peter of Spain's thirteenth-century *Tractatus* is devoted to fallacies. The IEP notes that this is "why so many fallacies have Latin names". In the Islamicate world, theologians developed full theories of *jadal*, "dialectic" or "disputation theory", around the turn of the ninth and tenth centuries.

**The early moderns.** Francis Bacon's *New Organon* (1620) described four "idols" that stand to the interpretation of nature as fallacies stand to logic. The Port-Royal *Logic* of Arnauld and Nicole (1662) kept eight of Aristotle's thirteen, treated *post hoc, ergo propter hoc* under false cause, and added imperfect enumeration and hasty generalisation, the first inductive fallacies.

Then came Locke. In *An Essay Concerning Human Understanding* (1690), Book IV, chapter xvii, §§19–22, almost as an afterthought, he described three kinds of argument "that men, in their reasoning with others, do ordinarily make use of to prevail on their assent; or at least so to awe them as to silence their opposition": *ad verecundiam* (literally an appeal to modesty: deferring to people of eminence), *ad ignorantiam* (demanding that the opponent accept the proof offered or produce a better one), and *ad hominem*, "to press a man with consequences drawn from his own principles or concessions". He contrasted them with *ad judicium*, argument from knowledge and probability. (On his theory of knowledge, see *Locke*.) But Locke never called these arguments fallacies, and his ad hominem was not an insult; it was the respectable move of showing that an opponent's view conflicts with the opponent's own commitments. Locke, in the SEP's phrase, intentionally created a class of *ad*-arguments and "inadvertently" gave birth to the *ad*-fallacies.

Isaac Watts's *Logick* (1724) added appeals to faith, passions and the people, and introduced "false cause"; his description of disputers who attack "images of straw" of their own making may be the origin of "straw man". Jeremy Bentham's 1824 work on political fallacies (the *Handbook of Political Fallacies* in Larrabee's edition; not the *Anarchical Fallacies* of *Bentham, Mill and Utilitarianism*) catalogued about thirty tricks used to defeat reform in Parliament, including attempts "to draw aside attention from the measure to the man". Richard Whately's *Elements of Logic* (1826) defined a fallacy as "any unsound mode of arguing, which appears to demand our conviction, and to be decisive of the question at hand, when in fairness it is not", and filed Locke's *ad*-arguments as "fallacies only when they are used unfairly". John Stuart Mill's *A System of Logic* (1843) gave the first extensive treatment of inductive fallacies and separated moral causes of error, such as bias, from intellectual ones.

{{image: Charles Leonard Hamblin | C. L. Hamblin (1922–1985), the Australian philosopher, logician and computer pioneer whose book Fallacies (1970) launched modern fallacy theory.}}

**The twentieth century.** Irving Copi's textbook *Introduction to Logic* listed eighteen informal fallacies, eleven Aristotelian and seven from the post-Lockean *ad*-tradition. In 1970 Hamblin's *Fallacies*, the first book-length work on the subject in modern times, judged this "standard treatment" harshly:

```quote
as debased, worn-out and dogmatic a treatment as could be imagined—incredibly tradition bound, yet lacking in logic and in historical sense alike, and almost without connection to anything else in modern Logic at all.
C. L. Hamblin · Fallacies, p. 12 · 1970
```

Hamblin's book, which includes a chapter on the Indian tradition, began modern fallacy theory. The SEP's verdict is that the list "has grown as a hodgepodge collection of items, proposed at various time and from different perspectives". Aristotle's items are logical mistakes with no proper use outside contentious debate; Locke's are moves often legitimately used in dialogue. That mixed inheritance is why so many "fallacies" have respectable twins.

## Other Traditions: Nyāya and the Later Mohists

The *Nyāya-sūtra*, attributed to Gautama (Akṣapāda) and dated around the second century CE, devotes much of its text to debate (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*). It distinguishes *vāda*, honest discussion aimed at truth, from *jalpa* and *vitaṇḍā*, debates aimed at victory. Among its sixteen topics are quibbles (*chala*), futile rejoinders (*jāti*, of which Book 5 lists twenty-four) and points of defeat (*nigrahasthāna*, twenty-two grounds for losing a debate, from bad arguments to breaches of procedure).

Most important are the *hetvābhāsa*, "pseudo-reasons" or "specious reasons". The sūtra names five kinds without examples (under names partly different from the later standard ones used here); modern accounts explain them as follows, with traditional examples (the Mazda one is the IEP's). A reason may be **deviating** (*savyabhicāra*), not reliably tied to what it is meant to prove: "my mother must be visiting, since there is a Mazda parked outside". It may be **contradictory** (*viruddha*), proving the opposite: "Sound is eternal because it is produced." It may be **unestablished** (*asiddha*), not actually belonging to the subject. It may be **rebutted** (*bādhita*) by stronger evidence such as perception: "Fire is cold because it is a substance." Or it may be **counterbalanced** (*satpratipakṣa*) by an equally strong argument the other way: "Sound is eternal, because it is audible" against "Sound is non-eternal, because it is produced." Notice that Nyāya does not sharply separate a bad inference from a false premise: both are pseudo-reasons.

In China the later Mohists (see *Mozi, the Daoists and the Legalists: the Hundred Schools*) studied reasoning by analogy and parallel wording, and warned, in Chris Fraser's translation of the "Lesser Selection": "Things have respects in which they are similar, yet it doesn't follow that they are completely similar." "White horses are horses, so riding white horses is riding horses" works; "carts are wood, so riding carts is riding wood" does not. The Mohists used this distinction to answer a charge of inconsistency: "robbers are people, but killing robbers is not killing people." *Logic across Traditions* returns to this case.

## The Classic Fallacies, and When They Are Not

Most named fallacies have legitimate cousins. The SEP's entry on informal logic distinguishes patterns that "seem inherently mistaken" (equivocation, post hoc, hasty generalisation) from those, like ad hominem and the appeal to pity, that "can play a legitimate logical role". Several examples below come from the SEP and the IEP; the rest are invented for illustration.

**Ad hominem** ("to the person") brings negative features of an arguer or their situation to bear on their view. The *abusive* form rejects a view because of something unflattering about its holder: "Don't listen to the councillor's flood plan; she was fined for speeding." The *circumstantial* form alleges self-interest; *tu quoque* ("you too") rejects advice because the adviser does not follow it, as when a daughter dismisses her smoking father's warning against smoking. But character is sometimes relevant: if a witness has been convicted of lying, an attorney rightly concludes that the witness should not simply be trusted, though not that the witness is lying now.

**Straw man**: distorting an opponent's view to make it easier to refute. If someone argues that industrialisation causes global warming and her critic replies to the claim that all ills are due to industrialisation, two things go wrong: she does not hold that view, and its falsity would not refute what she does hold. Though Port-Royal and Watts described the move, Douglas Walton traced its first textbook appearance to Stuart Chase's *Guides to Straight Thinking* (1956), and Hamblin's *Fallacies* does not mention it at all. Not every simplification is a straw man; the fault is a distortion that is both inaccurate and unfavourable. The remedy is the principle of charity, now nicknamed "steelmanning": answer the strongest version.

**Begging the question** (*petitio principii*, from Aristotle's "asking for the initial thing") assumes what is to be proved. Whately's example argued that unlimited freedom of speech benefits the State because it serves the Community for everyone to speak without limit: the premise is the conclusion in other words. Subtler versions assume a disputed point: "Capital punishment is murder, so capital punishment is wrong" begs the question against anyone who denies that execution is murder. Since the argument is valid, the fault is best seen as epistemic, concerning knowledge: on Biro and Siegel's account, the premises cannot be known independently of the conclusion.

**False dilemma**: a premise that offers too few options, typically treating two claims that could both be false as if one must be true. The IEP's example: "Will you contribute \$20 to our environmental fund, or are you on the side of environmental destruction?" The form is fine; the premise is false. "Will you contribute or won't you?" is a genuine dilemma, because "everything is either black or not black, but not everything is either black or white."

**Slippery slope**: from a first step, a chain of steps leads to an unwanted end, so we should not take the first step. Whether this is fallacious, the IEP says, depends "on the probabilities involved in each step". Suppose each of three steps is 80 per cent likely given the one before. Then 0.8 times 0.8 times 0.8 is about 0.51: roughly an even chance of reaching the bottom. Some slopes rest on vagueness instead, like the heap and the beard of the ancient Sorites puzzle (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* and *Paradoxes: the Liar, the Heap and Zeno*). The SEP's example of a slope argument that cannot be "summarily dismissed" is Churchill's argument against the Munich Agreement of 1938, that it would embolden Germany.

**Appeal to authority** (*ad verecundiam*). The IEP is blunt: "Most reasoning of this kind is not fallacious, and much of our knowledge properly comes from listening to authorities." The fallacy is relying on someone who is not an authority on the subject, who cannot be trusted, who is misquoted, or when the experts disagree. Walton's **critical questions** for an argument from expert opinion make this checkable. They ask how credible the expert is, whether she is expert in this field, what exactly she asserted, whether she is personally reliable, whether other experts agree, and whether her claim rests on evidence. Even good authority can mislead: Theophilus Painter's 1923 count of 24 human chromosome pairs was repeated on his authority until 1956, when the correct number, 23, was established. (*Testimony, Trust and Social Epistemology* asks when trust is rational.)

**Appeal to ignorance** (*ad ignorantiam*) takes a lack of proof that something is true as proof that it is false, or the reverse. Yet absence of evidence is sometimes evidence of absence. If a timetable does not list a station, the train probably does not stop there. The critical questions are how far the search has gone, which side carries the **burden of proof** (the duty to back up a claim), and how strong the proof must be. "It has not been proven that the defendant is guilty; therefore, the defendant is not guilty" is not a fallacy in court, because the **presumption of innocence** puts the burden on the prosecution; Justinian's *Digest* (sixth century) put proof on the one who asserts, not the one who denies. "Not guilty" is a legal status fixed by that burden, not a finding that the accused did nothing.

Briefer cases follow the same pattern. **Post hoc** infers causation from mere succession, but correlations are often good evidence, so the fault lies only in leaping "hastily". **Hasty generalisation** draws a rule from too small a sample. **Equivocation** shifts a word's meaning mid-argument ("The end of life is death; happiness is the end of life; so happiness is death"); Moore charged Mill's step from "desired" to "desirable" with just this, as *Bentham, Mill and Utilitarianism* describes. The **genetic fallacy** is discrediting a claim by its origin when the origin is irrelevant; but the origin is sometimes relevant, as when a plan comes from the person who stands to profit, and the chapter on *Nietzsche* asks whether his genealogy of morality commits it. Threats (*ad baculum*) can be good reasons to *act* but are no evidence for *belief*.

Last comes the **fallacy fallacy**: inferring that a conclusion is false because an argument for it is bad. If Alice argues badly that Ginger is a cat, Bob cannot conclude that Ginger is not a cat. A flawed argument leaves its conclusion where it was, unsupported, not refuted.

```checkpoint
q: Why does Locke's ad hominem differ from the modern fallacy of the same name?
a*: Because for Locke it meant pressing an opponent with consequences drawn from their own principles or concessions, a legitimate move.
a: Because Locke used it only for abusive personal insults.
x: The abusive form is a modern category; none of the modern forms is what Locke described.
a: Because Locke called it the worst of all fallacies.
x: Locke never used the word "fallacy" for these arguments.
a: Because Locke's ad hominem concerned appeals to experts.
x: Deference to eminent people is Locke's ad verecundiam, not his ad hominem.
hint: Think about whose commitments the arguer is using.
why: Locke's ad hominem shows that an opponent's view conflicts with the opponent's own commitments; the SEP calls it an acceptable mode of argumentation, not a fallacy.
---
q: When is "it has not been proven guilty, so it is not guilty" a reasonable inference?
a: Never, because every appeal to ignorance is a fallacy.
x: Walton's critical questions show that some appeals to ignorance are legitimate.
a: Whenever the defendant is popular.
x: Popularity is irrelevant; that would be an appeal to the people.
a*: In a criminal trial, where the presumption of innocence puts the burden of proof on the prosecution.
a: Only if the defendant has confessed.
x: A confession is evidence of guilt, not a reason for a verdict of not guilty.
hint: Ask which side has to prove its case.
why: The verdict "not guilty" is a legal status fixed by the burden of proof, so the inference is sound within the rules, though it does not show that the accused did nothing.
```

## Modern Theories: Dialogues, Schemes and Probabilities

After Hamblin, theorists tried to say what makes a fallacy wrong. The first major answer treats arguing as a regulated **dialogue**. The pragma-dialectical school of Frans van Eemeren and Rob Grootendorst at the University of Amsterdam models argument as a critical discussion for resolving a difference of opinion, governed by ten rules: for example, the parties must not prevent each other from advancing or doubting standpoints; whoever advances a standpoint must defend it if asked; and an attack must relate to the standpoint actually advanced. A fallacy is simply "every violation" of these rules. The straw man is a natural example of breaking the third. The definition drops the requirement that a fallacy *seem* good.

A second answer is Douglas Walton's. He defined a fallacy as "a deceptively bad argument that impedes the progress of a dialogue", and analysed common patterns as **argumentation schemes**: patterns of defeasible reasoning (reasoning that creates a presumption which further information can overturn) that are, as the SEP puts it, "sometimes used fairly, and, other times, fallaciously". Each scheme has critical questions, like those for expert opinion above.

A third is **Bayesian**, treating good reasoning as updating degrees of belief by probability. Hahn and Oaksford (2007) argued that many so-called fallacies are good arguments that "considerably raise the probability of the conclusion"; even affirming the consequent can lend support, depending on content and prior probabilities rather than form. In an example Boudry and his colleagues use, someone who falls ill after eating foraged mushrooms and blames the mushrooms is reasoning sensibly about likelihoods, not committing the post hoc fallacy. The chapter *Induction, Probability and Inference to the Best Explanation* develops this way of thinking.

## Should We Give Up on Fallacies? The Fallacy Fork

These developments prompted a radical argument. In 2015 Maarten Boudry, Fabio Paglieri and Massimo Pigliucci proposed what Boudry later popularised as the **Fallacy Fork**. Set out step by step:

1. Any named fallacy must be defined either strictly, as a demonstrably invalid form of argument, or loosely, with qualifications about context and probability.
2. Defined strictly, it "has very limited applicability in real life", because real arguments are rarely meant as deductions.
3. Defined loosely, it can "no longer be held up as an effective tool for discriminating good and bad forms of reasoning", because "almost every known type of fallacy is a close neighbor to sound inferences or acceptable moves in a debate".
4. Theories without schemes, such as pragma-dialectics, meet their own version of the same dilemma.
5. Therefore, naming fallacies is not an effective way to tell good reasoning from bad; the real work is done by assessing each argument in its context.

The fork sharpens older doubts: Hamblin's, that we have no theory of fallacy, and Gerald Massey's (1981), that we have no general method for proving an argument *invalid*, since an argument fitting an invalid form may also fit a valid one.

**Objection one.** The loose horn is not empty. Walton's schemes and critical questions give principled, checkable criteria for when an ad hominem or an appeal to an expert is fair and when it is fallacious.

**Reply.** That confirms the fork's moral: the deciding is done by critical questions about the particular case, not by the label. As Schwartz observed in 1981, "Some appeals to authority are fallacious; most are not", and "the hard work comes in judging and showing that this condition holds, and that is where the fallacy-label-texts leave off".

**Objection two.** Some fallacies really are inherently mistaken, such as equivocation and hasty generalisation, and names are useful mental shortcuts. Defenders such as Steven Novella argue that fallacy names still help to police arguments.

**Reply.** A middle position grants this but changes how the names are used: as prompts for questions, not as verdicts. And whoever charges a fallacy, the IEP reminds us, carries the burden of proof.

## Everyday Reasoning and the News

Many everyday errors are mistakes about probability and evidence, often driven by our wishes.

**Base rates.** A **base rate** is how common something is in the first place. Imagine 1,000 drivers stopped at random, of whom 1 is drunk. A breath test never misses a drunk driver, but wrongly flags 50 of the 999 sober ones. So 51 drivers test positive, and only 1 of them is drunk: a positive result means about a 1 in 51 chance, roughly 2 per cent, of being drunk. When a condition is rarer than a test's false-positive rate, most positives are false. Counting people, as here, rather than juggling percentages, helps people get such problems right (a point associated with Gigerenzer). Kahneman and Tversky blamed the "representativeness heuristic", judging by resemblance rather than frequency; others argue that the errors largely reflect how information is presented.

**Linda.** In Tversky and Kahneman's best-known problem, people read a description of a woman called Linda and are asked which is more probable: that she is a bank teller, or a bank teller and an active feminist. Most people choose the second, which cannot be more probable than the first, since every feminist bank teller is a bank teller.

**Confirmation bias and motivated reasoning.** **Confirmation bias**, a term coined by the psychologist Peter Wason, is the tendency to seek, interpret and remember information that confirms what we already believe. In a classic 1979 Stanford study, people with opposite views on the death penalty read the same mixed evidence, and 23 per cent reported that their views had become more extreme; replications have been mixed. A later claim that correcting people's errors makes them believe more strongly, the "backfire effect", has largely failed to replicate, including in a study of 10,100 participants on 52 issues. Ziva Kunda's account of **motivated reasoning** (1990) distinguished goals of accuracy from goals of reaching a desired conclusion, and noted that several kinds of bias weaken when people aim at accuracy. Still, explaining *why* we err does not say *what* the error is; that remains the logician's question.

**Reading the news.** For online claims, the most useful habit may be **lateral reading**. In a study by Sam Wineburg and Sarah McGrew (2017; published 2019), ten historians, ten fact-checkers and twenty-five Stanford undergraduates evaluated websites. As the study is reported, the historians and students read "vertically", staying on a site and being misled by its surface; the fact-checkers quickly left it and opened new tabs to see what others said about the source, reaching better conclusions in a fraction of the time. Mike Caulfield turned such habits into four moves, called **SIFT**: *Stop*; *Investigate* the source; *Find* better coverage; *Trace* claims to their original context.

These habits connect back to the fallacies: investigating a source asks Walton's critical questions, and tracing a quotation guards against the straw man. And the fallacy fallacy keeps us honest: a bad argument for a claim, or a bad person making it, does not make it false. As James Madison wrote in *Federalist* No. 40, the prudent enquiry is "not so much *from whom* the advice comes, as whether the advice be *good*."

```checkpoint
q: In the breath-test example, why does a positive result mean only about a 2 per cent chance that the driver is drunk?
a: Because the test misses most drunk drivers.
x: In the example the test never misses a drunk driver.
a*: Because drunk drivers are so rare that the 50 false positives among sober drivers swamp the 1 true positive.
a: Because most drivers who are stopped are drunk.
x: Only 1 driver in 1,000 is drunk in the example.
a: Because the test result is irrelevant to drunkenness.
x: The test is informative; the problem is the low base rate.
hint: Count how many of the 51 positive results come from sober drivers.
why: When a condition is rarer than a test's false-positive rate, most positives are false; counting cases makes this visible.
---
q: What did the fact-checkers in Wineburg and McGrew's study do differently from the historians and students?
a: They read each website more slowly and thoroughly.
x: Reading a site closely, or "vertically", is what misled the others.
a: They trusted sites with professional design.
x: Surface cues like design misled the vertical readers.
a: They relied on their own prior beliefs.
x: That would invite confirmation bias, not better judgement.
a*: They left the site quickly and opened new tabs to see what others said about the source.
hint: The technique is called lateral reading.
why: Reading laterally let the fact-checkers reach better-warranted conclusions in a fraction of the time, as the study is reported.
```

## Further exploration

- **C. L. Hamblin, *Fallacies* (1970).** The book that ended "the standard treatment" and launched modern fallacy theory.
- **Christopher W. Tindale, *Fallacies and Argument Appraisal* (2007).** An introduction treating fallacies within the study of argumentation.
- **Frans H. van Eemeren and Rob Grootendorst, *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach* (2004).** The ten rules of critical discussion and the fallacies as their violations.
- **Douglas Walton, Chris Reed and Fabrizio Macagno, *Argumentation Schemes* (2008).** Patterns of everyday reasoning and the critical questions that test them.
- **Bimal Krishna Matilal, *The Character of Logic in India* (1998).** Indian debate theory, its kinds of debate and its pseudo-reasons.
- **Scott Aikin and John Casey, *Straw Man Arguments: A Study in Fallacy Theory* (2022).** A recent study of straw, weak and hollow men.
- **Mike Caulfield and Sam Wineburg, *Verified: How to Think Straight, Get Duped Less, and Make Better Decisions about What to Believe Online* (2023).** Lateral reading and SIFT for the news.$fallacies_master$,
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
  select $fallacies_quiz$[
    {"type": "mcq", "prompt": "How did Aristotle group the thirteen ways a refutation can be sophistical in the Sophistical Refutations?", "options": ["Into fallacies that depend on language and fallacies that do not", "Into formal and informal fallacies, in the modern sense", "Into deductive and inductive fallacies", "Into fallacies of authority, danger, delay and confusion"], "answerIndex": 0, "explanation": "Aristotle distinguished six language-dependent fallacies (such as equivocation and amphiboly) from seven that do not depend on language (such as accident, begging the question and many questions). This is not the modern formal/informal distinction; inductive fallacies entered the list later, with the Port-Royal Logic; and authority, danger, delay and confusion are Bentham's headings for political fallacies.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the history of the 'straw man' is supported by the sources?", "options": ["Aristotle named it in the Sophistical Refutations", "Hamblin's Fallacies (1970) made it the centrepiece of the standard treatment", "Walton found its first textbook inclusion in Stuart Chase's Guides to Straight Thinking (1956), and Watts's 'images of straw' (1724) may be the origin of the name", "Locke introduced it alongside ad hominem in 1690"], "answerIndex": 2, "explanation": "Port-Royal and Isaac Watts described attacking views one's opponents do not hold, and Watts's phrase 'images of straw' may be the origin of the term. Walton traced its first textbook appearance to Chase (1956); Hamblin's Fallacies does not mention it at all.", "id": "q2"},
    {"type": "mcq", "prompt": "According to the IEP, when is a slippery-slope argument fallacious?", "options": ["Always, because any chain of consequences is speculative", "Never, because the future is uncertain", "Only when it concerns vague words such as 'heap'", "It depends on the probabilities involved in each step: with three steps each 80 per cent likely, the end is reached only about half the time"], "answerIndex": 3, "explanation": "Slope arguments can be reasonable (the SEP cites Churchill's 1938 argument against the Munich Agreement). The question is how probable each step is: 0.8 times 0.8 times 0.8 is about 0.51.", "id": "q3"},
    {"type": "mcq", "prompt": "One in 1,000 drivers is drunk. A breath test never misses a drunk driver but wrongly flags 50 of the 999 sober drivers. Roughly how likely is a driver who tests positive to be drunk?", "options": ["About 99 per cent", "About 2 per cent, since only 1 of the 51 positives is a drunk driver", "About 50 per cent", "About 95 per cent, since the test is 95 per cent accurate"], "answerIndex": 1, "explanation": "Because drunk drivers are rarer than the test's false-positive rate, the 50 false positives swamp the single true one: 1 in 51 is roughly 2 per cent. Neglecting the base rate leads people to answer far too high.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Fallacy Fork of Boudry, Paglieri and Pigliucci step by step. Then give the strongest objection to it and the best reply, and say how it relates to the earlier criticisms of Hamblin and Massey.", "rubric": "A strong answer states the dilemma: a named fallacy is defined either strictly, as a demonstrably invalid form (then it has very limited applicability, since real arguments are rarely meant as deductions), or loosely, with qualifications about context and probability (then it no longer discriminates good from bad reasoning, since almost every fallacy is a close neighbour of a sound inference or acceptable move); even pragma-dialectics meets a version of it; so fallacy-naming should give way to context-specific assessment. It presents an objection, such as Walton's argumentation schemes and critical questions as principled criteria, or the claim that some fallacies (equivocation, hasty generalisation) are inherently mistaken and that names are useful (Novella), and a reply (Schwartz: the hard work lies in judging the case, not in the label; names as prompts for questions, not verdicts; the burden of proof on whoever charges a fallacy). Credit links to Hamblin's attack on the 'standard treatment' and the point that we have no theory of fallacy, and to Massey's asymmetry thesis that invalidity cannot be proved by instantiating an invalid form.", "id": "q5"},
    {"type": "open", "prompt": "Choose two of the classic informal fallacies (for example ad hominem, appeal to authority, appeal to ignorance or slippery slope). For each, define it, give an example, and explain when the same pattern of reasoning is not a fallacy. Compare this with how Nyāya classified bad reasons.", "rubric": "A strong answer defines each chosen fallacy accurately and distinguishes fallacious from legitimate uses: ad hominem (abusive, circumstantial, tu quoque; a witness convicted of lying; Locke's original ad hominem from the opponent's own commitments); appeal to authority (most such appeals are not fallacious; Walton's six critical questions; the Painter chromosome case); appeal to ignorance (the timetable example; burden of proof and the presumption of innocence, where 'not guilty' is a legal status); slippery slope (depends on step probabilities; Churchill on Munich in 1938). It describes Nyāya's five hetvābhāsa (deviating, contradictory, unestablished, rebutted, counterbalanced) with an example, notes that Nyāya did not sharply separate invalidity from false premises, and may mention jāti and nigrahasthāna and the distinction between vāda and jalpa/vitaṇḍā. Credit noting the fallacy fallacy.", "id": "q6"}
  ]$fallacies_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/fallacies', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
