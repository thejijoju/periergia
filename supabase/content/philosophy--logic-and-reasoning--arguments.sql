-- Arguments: Validity, Soundness and Form — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/arguments @ research/advanced/read.
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
    'philosophy/logic-and-reasoning/arguments',
    'research',
    'advanced',
    'read',
    $arguments_master$> **An argument offers reasons for a conclusion, and logic asks when those reasons really do the work.** This first chapter of Logic and Reasoning explains what an argument is and how it differs from an explanation; what makes an argument valid and sound; how logical form lets a single counterexample sink a pattern of reasoning; and the common valid and invalid forms, from modus ponens to affirming the consequent. It traces these ideas through Aristotle, the Stoics, Nyāya and the Mohists, debates whether validity is purely formal, reconstructs Anselm's argument for God and Descartes's "I think, therefore I am", and ends with the gap between valid and persuasive.

## What an Argument Is

In ordinary speech an argument is a quarrel. In logic, as *What Is Philosophy?* explains, it is a set of claims some of which, the **premises**, are offered as reasons for another, the **conclusion**. Matthew McKeon, in the Internet Encyclopedia of Philosophy, stresses that these must be "truth-bearers", things that can be true or false, so a command cannot be part of one, and that what makes sentences an argument is a reasoner offering some as reasons for another.

Indicator words help. "Because", "since", "for" and "as" typically mark premises; "therefore", "thus", "hence" and "so" typically mark conclusions. But, McKeon warns, these words "do not always function in these ways": "Since Tuesday it has rained" contains no premise at all.

The most important look-alike is the **explanation**. Asked "Why did this metal expand?", someone answers, "It was heated, and all metals expand when heated." That is not an attempt to convince anyone that the metal expanded, which everyone already accepts; it says why. One common way to draw the line is by purpose: arguing aims to make acceptable a claim not yet accepted, explaining to make understood something already accepted. Still, it is "generally accepted that the same line of reasoning can function as an explanation in one dialogical context and as an argument in another", and some philosophers treat all explanations as arguments.

Logicians write arguments in **standard form**: premises one per line, then the conclusion, marked "therefore". Premises are **linked** when they support the conclusion only together ("Tom is happy only if he is playing guitar; Tom is not playing guitar; therefore Tom is not happy") and **convergent** when each supports it independently ("Tom said he didn't go to the party"; "No one at the party saw him there"). An argument is **extended** when a premise is itself argued for: "I searched the kitchen and found no keys; so the keys are not in the kitchen" can feed "The keys are in the kitchen or the bedroom; so they are in the bedroom."

## Validity and Soundness

An argument can fail in two ways: its premises may be false, or they may not support the conclusion. Logic keeps these apart. The Internet Encyclopedia's entry "Validity and Soundness" gives the standard definitions. "A deductive argument is said to be valid if and only if it takes a form that makes it impossible for the premises to be true and the conclusion nevertheless to be false." And "A deductive argument is sound if and only if it is both valid, and all of its premises are actually true."

**Validity** is a relation: if the premises were true, the conclusion would have to be. "All toasters are items made of gold. All items made of gold are time-travel devices. Therefore, all toasters are time-travel devices" is valid, and absurd, because its premises are false. **Soundness** adds true premises, so a sound argument's conclusion must be true. Three consequences catch people out. Every invalid argument is unsound. A valid argument can have a false conclusion. And a flawed argument can have a true one: as the entry puts it, "One cannot reject the conclusion of an argument simply by discovering a given argument for that conclusion to be flawed."

Paul Pietroski, in the Stanford Encyclopedia of Philosophy, gives the appeal of valid reasoning: "Any risk of error lies with the premises, as opposed to the reasoning." Modern logic makes the idea exact. Stewart Shapiro writes: "An argument is valid if there is no interpretation (in the semantics) in which its premises are all true and its conclusion false", a model-theoretic definition that traces back to Tarski in 1936.

The idea is old. Robin Smith judges that Aristotle's definition of a deduction (*sullogismos*) corresponds to the modern notion of logical consequence:

```quote
"A deduction is speech (logos) in which, certain things having been supposed, something different from those supposed results of necessity because of their being so."
Aristotle · Prior Analytics I.2, 24b18–20 (trans. Robin Smith) · fourth century BCE
```

The distinction between validity and soundness goes back to the Stoics. As Susanne Bobzien reports, they called an argument valid when the conditional formed from its premises (as the "if" part) and its conclusion (as the "then" part) was correct, and "true", our "sound", when in addition its premises were true.

Not all good reasoning aims at validity. "All swans observed so far have been white. Smoothy is a swan. Therefore, Smoothy is white" makes its conclusion likely, not certain; Smoothy may be a black swan. Such **inductive** arguments are judged strong or weak, and it is a mistake to fault one for being invalid. Whether there really are two kinds of argument is disputed. Trudy Govier attacked "the hallowed old distinction between inductive and deductive arguments" in 1987, and Timothy Shanahan proposes dropping it. *Induction, Probability and Inference to the Best Explanation* takes up that side; this chapter stays with deduction.

## Logical Form and the Counterexample Method

On what the Internet Encyclopedia calls "the dominant understanding among logicians", validity "is determined entirely by its logical form". The form is what remains when the content words are stripped out, leaving words common to reasoning about any subject: "all", "some", "not", "and", "if", "or". "All tigers are mammals. No mammals are creatures with scales. Therefore, no tigers are creatures with scales" has the form "All A are B; no B are C; therefore no A are C". So does "All spider monkeys are elephants. No elephants are animals. Therefore, no spider monkeys are animals." Both are valid; only the first is sound.

Form gives a test. If validity depends only on form, every argument of a valid form is valid. So to show a form invalid, one argument of that form with true premises and a false conclusion is enough: a **counterexample** to the form. (In *What Is Philosophy?* a counterexample refutes a universal claim, such as an analysis of knowledge; here what it refutes is a pattern of reasoning.) "All basketballs are round. The Earth is round. Therefore, the Earth is a basketball" has the form "All A are F; X is F; therefore X is an A", and its absurd conclusion shows the form invalid. Now take "All popes reside at the Vatican. John Paul II resides at the Vatican. Therefore, John Paul II is a pope." Every line is true, but the form is the same, so the argument is invalid: its conclusion is true by luck. Aristotle, as *Aristotle* describes, proved invalidity in just this way, "very much in the spirit of modern logical theory", in Smith's words.

Grammar can hide form. "Tony is a ferocious tiger" lets you infer "Tony is a tiger"; "Clinton is a lame duck" does not let you infer "Clinton is a duck". So logicians build artificial languages in which grammatical and logical form coincide. Frege and Russell argued that natural grammar "misleads us about the structure of the propositions we assert", as *Frege, Russell and the Birth of Analytic Philosophy* recounts; *Formal Logic: Propositions, Predicates and Proofs* teaches those languages.

## Valid Forms and Their Invalid Twins

A few forms recur so often they have names. With P, Q, R and S standing for whole statements:

1. **Modus ponens**: If P then Q; P; therefore Q. "If it is day, it is light; it is day; so it is light."
2. **Modus tollens**: If P then Q; not Q; therefore not P. "If the dog detects an intruder, the dog will bark. The dog did not bark. Therefore, no intruder was detected."
3. **Hypothetical syllogism**: If P then Q; if Q then R; therefore if P then R.
4. **Disjunctive syllogism**: P or Q; not P; therefore Q. "I will choose soup or salad; not soup; so salad."
5. **Constructive dilemma**: If P then Q; if R then S; P or R; therefore Q or S.
6. **Reductio ad absurdum**: assume the denial of what you want to prove and derive a contradiction. There is no smallest positive fraction, for half of it would be smaller still.

Two invalid forms shadow the first two so closely that Bradley Dowden calls each "often mistaken" for its valid twin. **Affirming the consequent**: If P then Q; Q; therefore P. "If she's Brazilian, then she speaks Portuguese. Hey, she does speak Portuguese. So, she is Brazilian." **Denying the antecedent**: If P then Q; not P; therefore not Q. "If someone lives in San Diego, they live in California; Ana doesn't live in San Diego; so she doesn't live in California." An "if" runs one way: P guarantees Q, but Q may have other sources.

The patterns have a long history. Aristotle's *Sophistical Refutations* describes people assuming that because a man with a fever is hot, a man who is hot must have a fever, a passage sometimes claimed as an early statement of affirming the consequent. His successors Theophrastus and Eudemus studied arguments such as "If something is F, it is G; a is F; therefore a is G", which Bobzien calls "forerunners" of modus ponens and modus tollens.

Aristotle's own logic was a logic of terms, built from four **categorical** statements, "Every S is P", "No S is P", "Some S is P" and "Some S is not P", combined into two-premise syllogisms. Medieval students memorised the valid patterns under names such as Barbara: "Every B is C; every A is B; so every A is C." The textbook "All men are mortal; Socrates is a man; so Socrates is mortal" is not Aristotle's example; his syllogistic seems not to admit single individuals at all.

The Stoics, above all Chrysippus, "the second major theorist of logic in antiquity", built instead a logic of whole propositions joined by "if", "and" and "or". Its base was five kinds of "indemonstrable" argument, which include modus ponens, modus tollens and disjunctive syllogism. The Stoics described them in words. Bobzien stresses that the common assumption that they wrote them as five fixed schemas "is false and not supported by textual evidence"; where they did use patterns, they wrote "the first" and "the second" for our P and Q. The fourth, "Either P or Q; P; therefore not Q", is a useful warning: it is valid only because the Stoic "or" excluded both. With an inclusive "or" it fails. *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* tells the school's story.

```checkpoint
q: "All popes reside at the Vatican. John Paul II resides at the Vatican. Therefore, John Paul II is a pope." What is the right verdict?
a*: It is invalid, although every statement in it is true, because an argument of the same form can have true premises and a false conclusion.
a: It is sound, because its premises and conclusion are all true.
x: Soundness requires validity as well as true premises, and this form ("All A are F; X is F; so X is an A") is invalid.
a: It is valid but unsound.
x: Valid but unsound means good form with a false premise. Here the premises are true and the form is bad.
a: It is an example of modus tollens.
x: Modus tollens denies the consequent of a conditional. Nothing here is denied.
hint: Compare the argument that the Earth is a basketball because both are round.
why: Validity depends on form. The basketball argument shares this form and has a false conclusion, a counterexample to the form; the papal conclusion is true by luck.
---
q: Which of these is a valid form?
a: If P then Q; Q; therefore P.
x: That is affirming the consequent: Q may be true for some other reason.
a: If P then Q; not P; therefore not Q.
x: That is denying the antecedent: Q may be true without P.
a*: If P then Q; not Q; therefore not P.
a: Either P or Q (or both); P; therefore not Q.
x: With an inclusive "or", both may be true. The Stoic version was valid only because their "or" excluded both.
hint: Which form does the dog that did not bark illustrate?
why: Modus tollens is valid: if P guaranteed Q and Q is false, P cannot be true. The other options mimic valid forms.
```

## Is Validity Purely Formal? A Debate

The Stanford Encyclopedia's entry on logical consequence sums up the contemporary consensus as "necessary truth preservation in virtue of form". The case for formality, step by step:

1. An argument is valid only if its premises cannot be true while its conclusion is false.
2. If validity depended on what particular content words mean, we could not test an argument by finding a same-form argument with true premises and a false conclusion.
3. We can test arguments that way; it is the core of logical method.
4. So validity depends not on content words but on the arrangement of logical words such as "all", "not" and "if".
5. Therefore validity is a matter of logical form.

**The strongest objection** comes from arguments that seem watertight although their form is not. "Juan is a bachelor. Therefore, he is not married." "My table is circular. Therefore, it is not square shaped." Neither premise can be true with its conclusion false, yet the surface form, "x is F; therefore x is not G", is invalid. Likewise "Peter is Greg's mother's brother's son. Therefore, Peter is Greg's cousin": to see that it follows, "we need to understand their contents too". These are **material** rather than formal consequences. Nor has anyone settled which words count as logical. Tarski suggested that an operation is logical if it is indifferent to which objects it concerns, so that "not" passes and "mother of" fails, but he left a principled boundary open. And necessity alone does not settle validity: "x is water; therefore x is H2O" may never lead from truth to falsehood, but it took chemistry, not logic, to find that out.

**The reply** comes in three versions. Add an implicit premise ("All bachelors are unmarried"), a move the Internet Encyclopedia calls "controversial". Or grant that such inferences are necessary but deny that the necessity is logical. Or reanalyse the form, reading "bachelor" as hiding "not married", so that the logical words are there after all. Each keeps formality at a cost, and the debate remains open.

## Form across Traditions

*Logic across Traditions* compares the traditions in depth; two brief cases follow.

The Indian Nyāya school used a five-step argument for debate and teaching. Matthew Dasti gives the stock example: "There is fire on the hill" (thesis). "Because there is smoke on the hill" (reason). "Wherever there is smoke, there is fire; like a kitchen hearth and unlike a lake" (illustration). "This hill is likewise smoky" (application). "Thus, there is fire on the hill" (conclusion). The general rule rests on *vyāpti*, "pervasion": fire pervades smoke because wherever smoke occurs, fire occurs. It looks deductive, but Brendan Gillon cautions that the earliest known example, in the medical *Caraka-saṃhitā*, "is clearly an analogical one"; deductive versions with the universal "wherever" premise appear later. Nyāya also did not sharply separate bad form from false premises: both are *hetvābhāsa*, "pseudo-reasons". See *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* and *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*.

In China the later Mohists studied *biàn*, disputation or "distinction drawing". Chris Fraser warns that they "tend to treat all argumentation as fundamentally analogical in nature" and did not "formulate an explicit notion of logical consequence". Yet one of their examples makes the point about misleading form. Critics argued that since robbers are people, killing robbers is killing people. The Mohist "Lesser Selection" replies: "robbers are people, but killing robbers is not killing people". Similarly, a white horse is white all over, but a blind horse is not blind all over. Sentences with the same pattern need not support the same inferences, the Mohist counterpart of "lame duck". See *Mozi, the Daoists and the Legalists: the Hundred Schools*.

## Reconstructing Arguments from Prose

Reconstruction means finding the conclusion, numbering the premises, adding what is unsaid and checking validity. The guiding rule is the **principle of charity**: interpret a speaker in the most rational way possible and consider an argument's strongest version. Neil L. Wilson named it in 1959, and Quine and Davidson developed it, Davidson as the injunction to interpret others so as to optimise agreement. In informal logic, Leo Groarke explains, charity often means supplying a "logically minimum" implicit premise, the weakest that links the stated premises to the conclusion.

An argument with an unstated premise is now called an **enthymeme**: "The murderer was very strong, so George cannot be the murderer" assumes "George is not very strong". The word comes from Aristotle's *Rhetoric*, and he is often said to have defined it as a syllogism with a missing premise. Christof Rapp argues that this misreads him: Aristotle's remarks about enthymemes having fewer premises concern choosing premises a public audience can follow, "not about logical incompleteness".

Diagrams help. Richard Whately's *Elements of Logic* (1826) gave probably the first argument map, and Monroe Beardsley's *Practical Logic* (1950) taught readers to number statements, circle indicator words and draw arrows from premises to conclusions.

**A worked example: Anselm.** As *Early Scholasticism: Anselm, Abelard and the Universities* recounts, Anselm argued in his *Proslogion* that God, "that than which no greater can be conceived", must exist. The Stanford Encyclopedia's entry on ontological arguments offers this "first effort":

1. When the fool hears the words "that than which no greater can be conceived" he understands those words.
2. Whatever is understood exists in the understanding.
3. So that than which no greater can be conceived exists in the understanding (from 1 and 2).
4. If that than which no greater can be conceived exists in the understanding, it can be conceived to exist in reality.
5. That than which no greater can be conceived is greater if it exists in reality than if it exists only in the understanding.
6. It is impossible to conceive of something greater than that than which no greater can be conceived.
7. So that than which no greater can be conceived exists in reality (from 3 to 6).

Steps 1 to 3 are cleanly valid. But the authors admit that "it is not exactly clear how we are meant to get to (vii) from (iii), (iv), (v), and (vi)." That is what reconstruction is for: it exposes a gap, to be filled by a further premise or by reading the whole as a reductio (suppose the being existed only in the understanding; then something greater could be conceived, contradicting step 6).

**The objection** is a famous counterexample by parody. The monk Gaunilo ran the same reasoning for an island more excellent than all others, which must then exist. The entry draws the moral: "Since the arguments have the same logical form, either they are both valid or they are both invalid." If both are invalid, Anselm's fails; if both are valid, the believer must find a premise true of God but false of the island.

**The reply** is to find that difference: perhaps islands cannot be maximally great. The entry notes that parodies are tied to particular formulations, and that this reply invites a new parody with a built-in maximum, such as "that score on this test than which no greater score on this test can be conceived". *Early Scholasticism* gives Thomas Williams's alternative reconstruction, which drops premise 5 entirely: which reconstruction is faithful is part of the dispute.

**A cautionary example: Descartes.** "I think, therefore I am" has an indicator word and looks like an enthymeme. Charity seems to supply the missing premise: everything that thinks exists; I think; so I exist. Descartes rejected that reading:

```quote
"When someone says 'I am thinking, therefore I am, or I exist,' he does not deduce existence from thought by means of a syllogism, but recognizes it as something self-evident by a simple intuition of the mind."
René Descartes · Second Replies (trans. Cottingham, Stoothoff and Murdoch) · 1641
```

Interpreters still disagree. Margaret Wilson observed that denying that the cogito is a syllogism is not denying that it is an inference; Lex Newman notes that modus ponens is self-evident yet contains an inference; Hintikka read the cogito as a performance. The lesson: supplying a premise is an interpretive claim, and a charitable reconstruction can make an argument valid while misdescribing what its author was doing. *Descartes* places the passage in his project.

```checkpoint
q: Why does Gaunilo's island argument threaten Anselm's argument?
a: Because it shows that islands, unlike God, do not exist.
x: Gaunilo's point was not about real islands. He built a parallel argument to test the form of Anselm's.
a*: Because it has the same form, so if it is invalid Anselm's is too, and if it is valid Anselm must find a premise true of God but false of the island.
a: Because it proves that God does not exist.
x: A parody can at most show that an argument fails; it cannot prove its conclusion false.
a: Because it shows that Anselm's premises are inductive.
x: The parody concerns form and validity, not induction.
hint: Recall how the basketball argument exposed the papal argument.
why: Same-form testing is the counterexample method: a parallel argument with an absurd conclusion shows that the form is invalid or that the original needs a distinguishing premise.
---
q: Which statement about the enthymeme is accurate?
a: Aristotle defined it as a syllogism with one premise suppressed, and all scholars agree.
x: Rapp argues that Aristotle's remarks about fewer premises concern choosing premises for a public audience, not logical incompleteness.
a: An enthymeme is an argument with a false premise.
x: An enthymeme leaves a component unstated; the unstated premise may well be true.
a: Descartes called the cogito an enthymeme.
x: Descartes denied that the cogito was a syllogism at all, calling it a simple intuition of the mind.
a*: In modern logic it means an argument with an unstated component, which charity tells us to supply in its weakest adequate form.
hint: Think of "The murderer was very strong, so George cannot be the murderer".
why: Modern informal logic uses "enthymeme" for an argument with a suppressed premise and recommends a "logically minimum" implicit premise; tying that definition to Aristotle is contested.
```

## Valid Is Not the Same as Good

"Bill will be at the party, because Bill will be at the party" cannot have a true premise and a false conclusion, yet it gives no reason at all; on McKeon's account it is not even an argument, since the premise is not believed independently of the conclusion. **Begging the question**, deriving a conclusion from premises that presuppose it, is the subtler version, and it is not faulted for invalidity. As Dowden notes, "It is still an open question among logicians as to why some deductively valid arguments are considered to be begging the question and others are not." *Informal Fallacies and Everyday Reasoning* pursues this.

Classical validity also allows arguments that feel wrong. In classical logic "if P then Q" is true whenever P is false or Q is true, so a false statement implies every statement, and from a contradiction anything follows ("explosion"). "The moon is made of green cheese. Therefore, either it is raining in Ecuador now or it is not" counts as valid, though the premise is irrelevant. The ancients knew versions of these "paradoxes", which arise from Philo's conditional; many philosophers since Hugh MacColl in 1908 have found them counterintuitive. **Relevance logicians** require that premises and conclusion share some content, and to block C. I. Lewis's derivation of explosion mainstream relevance logicians reject disjunctive syllogism, which Edwin Mares calls "one of the most controversial aspects of relevance logic". *Paradoxes: the Liar, the Heap and Zeno* meets contradiction in another form.

{{image: Wason selection task | Cards in the Wason selection task. Each has a number on one side and a colour on the other. Which must be turned over to test the rule "if a card shows an even number on one face, then its opposite face is blue"?}}

Validity and persuasiveness also come apart in our heads. In the Wason selection task, devised by Peter Wason in 1966, people see cards showing 3, 8, blue and red and must say which to turn over to test "if a card shows an even number on one face, its opposite face is blue". The answer is the 8 (modus ponens) and the red card (modus tollens); turning the blue card tests nothing, and reasoning from it would be affirming the consequent. In Wason's study, by one report, fewer than one in ten got it right. People do much better when the rule polices a social norm ("if you are drinking alcohol, you must be over 18"), which Cosmides and Tooby took as evidence of a cheater-detecting mechanism, a reading others dispute. In a 1983 study of **belief bias**, Evans, Barston and Pollard found people tending to reject valid arguments with unbelievable conclusions and accept invalid ones with believable conclusions, though they still accepted valid arguments more often than invalid ones. Hugo Mercier and Dan Sperber argue that reasoning's primary function is social, which fits the finding that we seem better at judging others' arguments than at building our own.

That is the value of logical form: it gives a test that does not care whether we like the conclusion. A valid argument shows only that its premises and the denial of its conclusion cannot all stand together. Which to give up is the philosophical question.

## Further exploration

- **Anthony Weston, *A Rulebook for Arguments* (1987).** A short, practical guide to building and assessing arguments; the fifth edition appeared in 2018.
- **Graham Priest, *Logic: A Very Short Introduction* (2000).** A brief, lively introduction to validity, including non-classical logics.
- **Trudy Govier, *A Practical Study of Argument* (1985).** A standard informal-logic textbook on reconstructing arguments, linked and convergent premises and conductive reasoning.
- **Catarina Dutilh Novaes, *The Dialogical Roots of Deduction* (2020).** Argues that deduction grew out of dialogue and debate.
- **Hugo Mercier and Dan Sperber, *The Enigma of Reason* (2017).** The psychology of reasoning, and the case that reasoning is for argument.
- **Jonardon Ganeri (ed.), *Indian Logic: A Reader* (2001).** Primary texts of Indian logic with commentary.
- **Chris Fraser, *The Philosophy of the Mozi* (2016).** A study of Mohist thought, including its theory of disputation.$arguments_master$,
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
  select $arguments_quiz$[
    {"type": "mcq", "prompt": "Which statement about validity and soundness is correct?", "options": ["A valid argument must have true premises", "If an argument for a conclusion is flawed, the conclusion is false", "A sound argument is a valid argument whose premises are all actually true", "An argument with a true conclusion is always valid"], "answerIndex": 2, "explanation": "Validity means it is impossible for the premises to be true and the conclusion false; soundness adds that the premises are actually true. Valid arguments can have false premises, and a flawed argument can still have a true conclusion.", "id": "q1"},
    {"type": "mcq", "prompt": "\"If she's Brazilian, then she speaks Portuguese. She speaks Portuguese. So she is Brazilian.\" Which form is this?", "options": ["Affirming the consequent, an invalid form", "Modus ponens, a valid form", "Modus tollens, a valid form", "Disjunctive syllogism, a valid form"], "answerIndex": 0, "explanation": "The argument affirms the 'then' part (Q) and concludes the 'if' part (P). Dowden notes this fallacy is often mistaken for modus ponens; she could speak Portuguese for other reasons.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Mohist claim that \"robbers are people, but killing robbers is not killing people\" illustrate?", "options": ["That the Mohists had an explicit theory of deductive logical consequence", "That killing is always wrong", "That robbers are not people", "That sentences with the same grammatical pattern need not support the same inferences"], "answerIndex": 3, "explanation": "The Lesser Selection treats it as a case of 'this but not so': a parallel sentence pattern does not guarantee a parallel inference. Fraser holds that the Mohists treated argument as analogical and did not formulate an explicit notion of logical consequence.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Brendan Gillon, what kind of argument is the earliest known example of the five-membered Indian syllogism, in the Caraka-saṃhitā?", "options": ["A strictly deductive argument with a universal premise", "An analogical argument, with deductive versions appearing later", "A statistical argument", "A Stoic indemonstrable translated into Sanskrit"], "answerIndex": 1, "explanation": "Gillon calls the Caraka example 'clearly an analogical one'; deductive versions, which attach a universal rule such as 'wherever there is smoke, there is fire', are found later.", "id": "q4"},
    {"type": "open", "prompt": "Explain the counterexample method for showing that an argument form is invalid, and apply it to Gaunilo's 'lost island' reply to Anselm.", "rubric": "A strong answer explains that validity is (on the dominant view) a matter of logical form, so a single argument of the same form with true premises and a false conclusion shows the form invalid; it may use the basketball or papal examples. It explains that Gaunilo built an argument of the same form as Anselm's concluding that a most excellent island exists, and quotes or paraphrases the SEP point that same-form arguments are both valid or both invalid: if invalid, Anselm's fails; if valid, the defender must find a premise true of God but false of the island. Better answers give the reply that islands cannot be maximally great and the counter-reply of a new parody (the greatest conceivable test score), or mention the SEP caveat that it is 'not exactly clear' how the final step follows.", "id": "q5"},
    {"type": "open", "prompt": "Is validity purely a matter of logical form? Set out the case for the dominant view and the strongest objection, and say how defenders reply.", "rubric": "A strong answer states the view that logical consequence is 'necessary truth preservation in virtue of form', with reasons such as the counterexample method. It gives the objection from material consequences ('Juan is a bachelor, so he is not married'; the cousin example) and/or from the unsettled boundary of logical constants (Tarski's proposal), and notes that necessity alone (water/H2O) seems not to suffice. It describes replies: adding an implicit premise (controversial), calling the necessity non-logical, or reanalysing the form. Better answers note that the debate is unresolved and connect it to how ordinary grammar can mislead (lame duck; the Mohist robbers).", "id": "q6"}
  ]$arguments_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/arguments', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
