-- Logic and Reasoning — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/logic-and-reasoning @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'philosophy/logic-and-reasoning',
    'research',
    'advanced',
    'read',
    $logicov_master$> **Logic asks when reasons really support a conclusion, and this section follows that question from everyday argument to the limits of thought.** This overview explains what logic studies and how the six chapters fit together, from validity and form through fallacies, formal systems, induction and paradox to the logics of other traditions. It then follows three questions through them all: is validity a matter of form or content, are deduction and induction really two kinds of reasoning, and does "logic" name one subject or many? It ends with a guide to the chapters.

## What Logic Studies

In ordinary speech an argument is a quarrel. In logic it is a set of claims some of which, the **premises**, are offered as reasons for another, the **conclusion**. Logic, in Brendan Gillon's definition, "seeks to distinguish good reasoning from bad". An argument can fail in two ways: its premises may be false, or they may not support the conclusion.

The Internet Encyclopedia of Philosophy (IEP) gives the standard definitions. "A deductive argument is said to be valid if and only if it takes a form that makes it impossible for the premises to be true and the conclusion nevertheless to be false." It is **sound** if it is valid and all its premises are actually true. **Validity** is a relation, a matter of what would follow: "All toasters are items made of gold. All items made of gold are time-travel devices. Therefore, all toasters are time-travel devices" is valid, and absurd, because its premises are false.

The idea is old. Robin Smith judges that the core of Aristotle's definition of a deduction, "resulting of necessity", corresponds to the modern notion of logical consequence:

```quote
"A deduction is speech (logos) in which, certain things having been supposed, something different from those supposed results of necessity because of their being so."
Aristotle · Prior Analytics I.2, 24b18–20 (trans. Robin Smith) · fourth century BCE
```

Not every tradition asked the question Aristotle's way. Gillon distinguishes four angles from which reasoning can be studied: **ontic** (when do some facts require another?), **epistemic** (when does knowing some facts let us know another?), **dialectic** (when must someone who accepts some statements accept another?) and **linguistic** (which forms of sentence mark forms of inference?). The linguistic angle is the one that leads to today's formal logic; the study of reasoning in India, he writes, took the other three. So a "good" argument could mean one that is formally valid, one that is a source of knowledge, or a winning move in debate. All three senses appear in the chapters that follow.

## Form and Formal Systems

*Arguments: Validity, Soundness and Form* introduces the tool on which much of the section depends. On what the IEP calls "the dominant understanding among logicians", validity "is determined entirely by its logical form", the pattern left when content words are stripped out and only words such as "all", "not" and "if" remain. If that is right, a single argument of a given form with true premises and a false conclusion, a **counterexample**, shows the form invalid. "All basketballs are round. The Earth is round. Therefore, the Earth is a basketball" exposes "All popes reside at the Vatican. John Paul II resides at the Vatican. Therefore, John Paul II is a pope": every line of the second is true, but its form is the same, so its conclusion is true by luck.

The chapter names the forms that recur, such as **modus ponens** ("If P then Q; P; therefore Q") and **modus tollens** ("If P then Q; not Q; therefore not P"), and their invalid twins, affirming the consequent and denying the antecedent. It also insists that valid is not the same as good. "Bill will be at the party, because Bill will be at the party" cannot have a true premise and a false conclusion, yet it gives no reason at all.

Grammar can hide form. "Tony is a ferocious tiger" lets you infer that Tony is a tiger; "Clinton is a lame duck" does not make Clinton a duck. So logicians build artificial languages in which grammatical and logical form coincide, and *Formal Logic: Propositions, Predicates and Proofs* teaches them. **Propositional logic** treats whole statements as units joined by connectives ("not", "and", "or", "if") whose meaning a truth table fixes; the same tables then test validity by calculation. **Predicate logic** looks inside sentences with the quantifiers "for all" and "there is", and proofs chain steps each licensed by a rule.

{{image: George Boole | George Boole, from *The Illustrated London News*, 21 January 1865. His *Mathematical Analysis of Logic* (1847) is commonly taken to mark the start of modern logic.}}

Calculation has limits. Kurt Gödel proved first-order logic complete in his 1929 dissertation: every valid argument is derivable, so provability and validity coincide. His incompleteness theorems of 1931 concern something else, formal theories rich enough for elementary arithmetic; any consistent such system has statements it can neither prove nor disprove, which, Panu Raatikainen warns, is not the same as showing "that there are truths that cannot be proved". In 1936 Alonzo Church and Turing independently showed that no mechanical procedure can always decide first-order validity. Leibniz's dream of settling disputes by calculation, as the chapter puts it, has a precise limit.

## Arguments in the Wild

*Informal Fallacies and Everyday Reasoning* turns to arguments in daily life. A fallacy, on the Stanford Encyclopedia of Philosophy's (SEP's) working definition, is "an argument that seems to be better than it really is". The SEP traces the textbook list to two "fountainheads", Aristotle's *Sophistical Refutations* and Locke, and calls them "uneasy bedfellows": Aristotle's items are logical mistakes, while Locke's *ad*-arguments are moves often legitimately used in dialogue.

That mixed inheritance is why so many "fallacies" have respectable twins. "Most reasoning of this kind is not fallacious," the IEP says of the appeal to authority; and absence of evidence is sometimes evidence of absence. Hence the central debate. The **Fallacy Fork** of Maarten Boudry, Fabio Paglieri and Massimo Pigliucci (2015) holds that a fallacy defined strictly, as an invalid form, rarely applies to real arguments, while one defined loosely no longer separates good reasoning from bad, so the real work is done by assessing each argument in its context. Defenders reply that Douglas Walton's **critical questions** give checkable criteria; a middle position keeps the names as prompts for questions, not verdicts.

The chapter ends with base rates, bias and the news, and with a warning that applies to the whole section, the **fallacy fallacy**. A flawed argument leaves its conclusion where it was, unsupported, not refuted.

## Reasoning beyond the Evidence

Most of what we believe goes beyond what we have seen. *Induction, Probability and Inference to the Best Explanation* deals with **ampliative** reasoning, whose conclusion says more than its premises, so that they could all be true and it false. Such arguments are judged stronger or weaker, not valid or invalid, and the chapter asks whether that kind of judgement can be justified at all.

At its centre is Hume's problem. Every inference from experience, in the chapter's summary, rests on a principle that "the course of nature continues always uniformly the same", which no demonstration can prove and no argument from experience can prove without assuming it. The answers range from Max Black's "self-supporting" argument, which Wesley Salmon met with **counter-induction**, a rule that supports itself just as well, to Strawson's claim that asking whether induction as a whole is reasonable is like asking whether the legal system as a whole is legal. Nelson Goodman's "grue" goes deeper. A thing is grue, as the SEP paraphrases him, if it is examined before some future time and is green, or is not so examined and is blue. Every emerald examined so far is both, so the same evidence confirms incompatible predictions, and an account of induction must say which predicates are fit to be projected.

Probability supplies a second set of tools. Bayes's rule says how to update a belief on evidence, and the chapter's worked cases, a medical test and the Monty Hall problem, show that what evidence shows depends on how common things are and on the process that produced it. But the problem of the priors remains: some coherent priors are inductive, some counter-inductive, and many therefore call the Bayesian answer to Hume partial. Many of the answers, the chapter suggests, share the **fallibilism** that Stephen Phillips and Anand Vaidya find in Nyāya and Buddhist philosophy: inference can give knowledge without a guarantee against error.

```checkpoint
q: Why does a single argument with true premises and a false conclusion show that a form of argument is invalid?
a*: Because on the dominant view validity depends only on form, so every argument of a valid form must be valid.
a: Because any argument with a false conclusion is invalid.
x: A valid argument can have a false conclusion if one of its premises is false, as the gold toasters show.
a: Because a valid argument must have true premises.
x: Validity is a relation between premises and conclusion; soundness is what adds true premises.
a: Because the counterexample proves that the conclusion of the original argument is false.
x: The papal argument's conclusion is true; the counterexample shows that its form does not guarantee it.
hint: Compare the basketball argument with the papal one.
why: If validity is a matter of form, one same-form argument with true premises and a false conclusion shows that the form cannot guarantee truth, so arguments of that form are invalid even when their conclusions happen to be true.
---
q: What does the Fallacy Fork claim?
a: That fallacies are always formal errors and never informal ones.
x: The fork argues that the strict, formal definition has very limited applicability to real arguments.
a: That ad hominem arguments are always legitimate.
x: The fork concerns fallacy-naming in general; the chapter shows when ad hominem is and is not a mistake.
a*: That a named fallacy defined strictly rarely applies to real arguments, and one defined loosely cannot tell good reasoning from bad.
a: That Locke invented the informal fallacies.
x: Locke described *ad*-arguments but never called them fallacies; the SEP says he gave birth to the *ad*-fallacies "inadvertently".
hint: The fork has two horns: strict and loose definitions.
why: Boudry, Paglieri and Pigliucci conclude that the real work lies in assessing each argument in context; defenders point to Walton's critical questions, and a middle position uses fallacy names as prompts, not verdicts.
```

## Paradoxes at the Limits

*Paradoxes: the Liar, the Heap and Zeno* starts from R. M. Sainsbury's definition:

```quote
"This is what I understand by a paradox: an apparently unacceptable conclusion derived by apparently acceptable reasoning from apparently acceptable premises."
R. M. Sainsbury · Paradoxes, 3rd edition, p. 1 · 2009
```

The definition shows the three ways out: reject a premise, fault the reasoning, or accept the conclusion. The chapter follows three ancient families. Zeno's arguments against motion pushed philosophers towards theories of the continuum, infinite sums and instantaneous velocity. The **sorites**, usually credited to Eubulides of Miletus, among whose puzzles Diogenes Laertius lists the Heap and its companion the Bald Man, runs by modus ponens from "One grain of wheat does not make a heap" to "one million grains don't make a heap". It forces a choice between classical logic with sharp lines we cannot know, the **epistemicism** of Roy Sorensen and Timothy Williamson, and non-classical treatments such as supervaluations or degrees of truth. The Liar, a sentence L that says "L is false", is true if and only if it is false. Calling it neither true nor false meets the strengthened Liar, a sentence S that says "S is not true", and every new label for the Liar can be built into a new one, the problem of **revenge**. Answers range from Tarski's hierarchy of languages to Graham Priest's **dialetheism**, which lets the Liar be both true and false. Russell's paradox, finally, gave us axiomatic set theory.

The paradoxes test the earlier chapters' tools: the sorites is a chain of modus ponens, and Gödel turned a Liar-like construction about provability into a theorem. Eubulides' two puzzles, the chapter concludes, still have no answer that everyone accepts.

## Logic across Traditions

*Logic across Traditions* compares how civilisations studied what makes a reason good, and shows that they did not all mean the same thing by the question. Aristotle built a logic of **terms**, linking two through a third, the middle term. The Stoics built a logic of whole **propositions**, and Philo's account of "if" introduced truth-functionality into logic; their logic "faded into oblivion" in late antiquity, "to be resurrected only in the 20th century".

In India, Gillon traces a path from analogy to deduction: the earliest known example of the five-membered argument, in the medical *Caraka-saṃhitā*, is analogical. The Buddhist Dignāga's "wheel of reasons" sorted reasons by whether they occur in similar and dissimilar cases; Navya-Nyāya built a precise technical language in which Daniel Ingalls found versions of De Morgan's laws; and the Jains asked in what respect a predicate holds. In China the later Mohists studied disputation and saw that grammar hides quantifiers. Loving people, in A. C. Graham's translation, "requires loving all people without exception", while riding horses "is (rather) riding some horses". Chris Fraser holds that they did not "formulate an explicit notion of logical consequence", though they had "a rigorous system of quantifiers". In the Arabic tradition Ibn Taymiyya argued that the syllogism is no better than analogy. In Latin, fourteenth-century logicians wrote on **consequences**, and the medieval concept of consequence may, the SEP suggests, be argued to be "the main precursor of the modern concept of logical consequence".

## Three Questions That Run Through the Section

### Form or content?

The case for formality is set out in *Arguments: Validity, Soundness and Form*:

1. An argument is valid only if its premises cannot be true while its conclusion is false.
2. If validity depended on what particular content words mean, we could not test an argument by finding a same-form argument with true premises and a false conclusion.
3. We can test arguments that way; it is the core of logical method.
4. So validity depends not on content words but on the arrangement of logical words such as "all", "not" and "if".
5. Therefore validity is a matter of logical form.

**The objection** draws on several chapters. Some arguments seem watertight although their form is not: "Juan is a bachelor. Therefore, he is not married." No one has settled which words count as logical. Goodman noticed that confirmation is not a matter of form. Hahn and Oaksford argued that even affirming the consequent can lend support, depending on content and prior probabilities rather than form. Marshall Willman notes that the Mohists held the rules of inference to depend partly on what particular words mean. Dignāga rejected "Sound is eternal, because it is audible" although, with the rule "whatever is audible is eternal", it is valid; in Gillon's words he "rules out the syllogism as a bad syllogism, rather than, as we would, accept it as a valid syllogism with an unpersuasive premiss."

**The reply** keeps form. Defenders add an implicit premise ("All bachelors are unmarried"), deny that the necessity is logical, or reanalyse the form; each keeps formality at a cost, and the debate remains open. This overview adds that several objections concern something other than validity. Ibn Taymiyya held that certainty and probability "differ only according to the subject matter", but, the *Logic across Traditions* chapter replies on his behalf, his target was narrower: the claim that no certain knowledge can be acquired except through the syllogism. Validity transmits certainty only from premises already certain. Dignāga's demand was for independent evidence for the general rule. On this reading form tells us what follows, while knowledge, evidence and debate decide whether an argument is any good.

### Deductive or inductive?

Trudy Govier attacked "the hallowed old distinction between inductive and deductive arguments" in 1987, and Timothy Shanahan proposes dropping it. The statistical syllogism runs from general to particular yet is not deductive. This overview would add that the traditions complicate the line too, since, as *Logic across Traditions* notes, India's earliest arguments were analogical, Chinese argument remained largely so, and Ibn Taymiyya argued that deduction never escaped analogy. What survives, the induction chapter argues, is a difference in how arguments are judged: a deduction is valid or not, while an ampliative argument is stronger or weaker.

### One logic or many?

Classical logic is **bivalent** (every statement is true or false), truth-functional, and explosive (from a contradiction anything follows), and the formal-logic chapter shows each feature challenged. Jan Łukasiewicz built a three-valued logic; L. E. J. Brouwer's intuitionists denied that the law of excluded middle holds universally; paraconsistent and relevance logics reject explosion. The paradoxes press the same question: the heap forces a choice between classical logic with unknowable sharp lines and a non-classical semantics, and the Liar has motivated logics with gaps and with gluts, though some logicians argue classical logic can be kept, and dialetheism remains a minority view. I. M. Bocheński, according to a review of the English translation of his history of logic, treated ancient, scholastic, mathematical and Indian logic as four varieties of one logic, while Tom Tillemans says that Dharmakīrti's theory of argument and Aristotle's rest on "considerably different philosophies of logic". *Logic across Traditions* leaves the matter where the section as a whole leaves it: whether these are rival logics or rival views of what logic is for remains open.

```checkpoint
q: Why did Dignāga reject "Sound is eternal, because it is audible", although with the rule "whatever is audible is eternal" the argument is valid?
a: Because he thought its form was invalid.
x: Gillon notes that we would call it valid; Dignāga's objection is not to its form.
a*: Because audibility occurs in no similar and no dissimilar case, so there is no independent evidence for the general rule.
a: Because the Mohists had shown that sound is not eternal.
x: The Mohists belong to the Chinese tradition; the wheel of reasons is Dignāga's own test.
a: Because Nyāya forbade any argument about sound.
x: Dignāga's own model of a good argument is about sound: "sound is non-eternal, because it is produced".
hint: Where, apart from sound, can audibility be found?
why: The argument falls in the wheel's "uniquely deviating" cell; Gillon says Dignāga rules it out as a bad syllogism rather than accepting it as valid with an unpersuasive premise, which shows how far good reasoning was tied to evidence and knowledge rather than form alone.
---
q: Which response to the Liar takes Sainsbury's third way out, accepting the apparently unacceptable conclusion?
a: Tarski's hierarchy of object language and metalanguage.
x: Tarski concluded that a language cannot define its own truth predicate and placed truth in a stronger metalanguage; he does not accept the contradiction.
a: Treating the Liar as a truth-value gap.
x: A gap denies the premise that every sentence is true or false, and it meets the strengthened Liar.
a: Kripke's fixed-point theory of truth.
x: Kripke's construction leaves the Liar in neither the extension nor the anti-extension of "true", which is a gap response.
a*: Priest's dialetheism, which lets the Liar be both true and false.
hint: Which answer embraces the contradiction itself?
why: Dialetheism accepts that the Liar is both true and false and uses a paraconsistent logic to block the step from contradiction to everything; it remains a minority view.
```

## The Chapters

- *Arguments: Validity, Soundness and Form*: validity and soundness, the counterexample method, valid and invalid forms, and reconstructing arguments.
- *Informal Fallacies and Everyday Reasoning*: the classic fallacies and their legitimate twins, modern fallacy theory, the Fallacy Fork, and the news.
- *Formal Logic: Propositions, Predicates and Proofs*: truth tables, quantifiers, proofs, Gödel, Church and Turing, and what classical logic leaves out.
- *Induction, Probability and Inference to the Best Explanation*: Hume's problem, ravens and grue, Bayes's rule, and explanation.
- *Paradoxes: the Liar, the Heap and Zeno*: Zeno and supertasks, vagueness, the Liar, and Russell's paradox.
- *Logic across Traditions*: Greek, Indian, Chinese, Arabic, Hebrew and Latin logic, and the formal revolution.

The questions continue in *What Is Philosophy?*, *Truth*, *Possibility and Necessity* and *What Makes Science Science? Method and Demarcation*.

## Further exploration

- **Graham Priest, *Logic: A Very Short Introduction* (2000).** A brief, lively introduction to validity, including non-classical logics.
- **C. L. Hamblin, *Fallacies* (1970).** The book that ended "the standard treatment" and launched modern fallacy theory.
- **Susan Haack, *Philosophy of Logics* (1978).** What formal logic captures, and the case for and against its rivals.
- **Peter Lipton, *Inference to the Best Explanation* (1991; 2nd ed. 2004).** The standard book on IBE, loveliness and likeliness, and Bayesianism.
- **R. M. Sainsbury, *Paradoxes* (1988).** The standard introduction, working through Zeno, the sorites, the Liar and Russell; the third edition appeared in 2009.
- **Bimal Krishna Matilal, *The Character of Logic in India* (1998).** A posthumous survey of Indian logic from debate to Navya-Nyāya by its leading modern interpreter.
- **William Kneale and Martha Kneale, *The Development of Logic* (1962).** The classic one-volume history of logic from Aristotle to the twentieth century.$logicov_master$,
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
  select $logicov_quiz$[
    {"type": "mcq", "prompt": "Which two 'fountainheads' does the Stanford Encyclopedia name for the textbook list of fallacies, calling them 'uneasy bedfellows'?", "options": ["Plato and the sophists", "Aristotle and Locke", "Whately and Mill", "Hamblin and Walton"], "answerIndex": 1, "explanation": "Aristotle's Sophistical Refutations supplies logical mistakes; Locke's ad-arguments are moves often legitimately used in dialogue, and Locke never called them fallacies. That mixed inheritance is why so many 'fallacies' have respectable twins. Hamblin and Walton are modern fallacy theorists.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about Gödel's results is accurate?", "options": ["His completeness theorem shows that every truth of arithmetic can be proved", "He showed that first-order logic is undecidable", "His incompleteness theorem shows that there are truths that cannot be proved by any means", "His first incompleteness theorem shows that any consistent formal system rich enough for elementary arithmetic has statements it can neither prove nor disprove"], "answerIndex": 3, "explanation": "Completeness (1929 dissertation) concerns first-order logic: every valid argument is derivable. Incompleteness (1931) concerns formal theories of arithmetic and, as Raatikainen warns, is about derivability in a given system, not provability in any absolute sense. Undecidability was shown by Church and Turing in 1936.", "id": "q2"},
    {"type": "mcq", "prompt": "On the definition the SEP paraphrases, when is something 'grue'?", "options": ["When it is examined before some future time t and is green, or is not so examined and is blue", "When it is green now and will turn blue at a future time", "When it looks green to some observers and blue to others", "When it is a mixture of green and blue"], "answerIndex": 0, "explanation": "No emerald changes colour: grue turns on when a thing is examined. Every emerald examined so far is green and so also grue, so the same evidence confirms incompatible predictions, and an account of induction must say which predicates are projectible.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Brendan Gillon, from which of his four perspectives was reasoning NOT mainly studied in classical India?", "options": ["The ontic perspective", "The epistemic perspective", "The linguistic perspective", "The dialectic perspective"], "answerIndex": 2, "explanation": "Gillon writes that the study of reasoning in India was ontic, epistemic and dialectic, 'and not from the linguistic perspective, the perspective best known to modern thinkers'. The linguistic angle is the one that leads to today's formal logic.", "id": "q4"},
    {"type": "open", "prompt": "Is validity purely a matter of logical form? Set out the argument for the dominant view, then draw objections from at least two other chapters of this section, and say how a defender of formality might reply.", "rubric": "A strong answer gives the case for formality (validity means the premises cannot be true with the conclusion false; the counterexample method presupposes that validity depends on form, not content words). It draws objections from across the section: material consequences such as 'Juan is a bachelor, so he is not married' and the unsettled boundary of logical words (Arguments); Goodman's point that confirmation is not a matter of form (Induction); Hahn and Oaksford's claim that even affirming the consequent can lend support depending on content and priors (Fallacies); Willman on the Mohists, Dignāga's rejection of the valid 'Sound is eternal, because it is audible' and Ibn Taymiyya's claim that certainty and probability differ only by subject matter (Logic across Traditions). Replies: an implicit premise (controversial), non-logical necessity, reanalysing the form; Ibn Taymiyya need not deny that the syllogism's form is valid; Dignāga's demand was for independent evidence. Better answers note that the debate remains open, and may weigh the overview's own suggestion that form fixes what follows while knowledge and evidence decide whether an argument is good.", "id": "q5"},
    {"type": "open", "prompt": "Does 'logic' name one subject or many? Use evidence from the formal-logic, paradoxes and traditions chapters.", "rubric": "A strong answer explains that classical logic is bivalent, truth-functional and explosive, and that each feature has been challenged (modal, many-valued, intuitionistic, paraconsistent and relevance logics; Brouwer on excluded middle), and that whether 'if' is the material conditional is debated. It shows how the paradoxes press the question (the sorites's choice between unknowable sharp lines and non-classical semantics; logics with gaps and gluts for the Liar; dialetheism as a minority view; some logicians argue classical logic can be kept). It uses the traditions: Gillon's four perspectives and India's ontic, epistemic and dialectic study of reasoning; Nyāya's refusal to separate validity from cogency; Tillemans's warning about calling Buddhist reason theory 'logic'; Dharmakīrti versus Aristotle on stating the conclusion; Bocheński treating them, according to a review, as four varieties of one logic. Better answers distinguish rival logics from rival views of what logic is for, and note that the question remains open.", "id": "q6"}
  ]$logicov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
