-- Induction, Probability and Inference to the Best Explanation — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/induction-and-probability @ research/advanced/read.
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
    'philosophy/logic-and-reasoning/induction-and-probability',
    'research',
    'advanced',
    'read',
    $induction_master$> **Most of what we believe goes beyond what we have seen, and this chapter asks what entitles us to make that leap.** It sorts the kinds of non-deductive reasoning and asks whether the old line between deduction and induction holds; presses Hume's problem and weighs the main answers to it, from "rule-circular" defences to Reichenbach and Strawson; works through Hempel's ravens and Goodman's "grue"; explains the rival meanings of probability, Bayes's theorem, Dutch books and the Monty Hall problem; and sets out inference to the best explanation, from Peirce to van Fraassen's "bad lot". Along the way it follows the same questions in Nyāya, Buddhist logic, Avicenna and the Mohists.

## Beyond the Evidence

A valid deductive argument, as *Arguments: Validity, Soundness and Form* explains, cannot have true premises and a false conclusion. Most reasoning in daily life and science is not like that: its conclusion says more than its premises, so they could all be true and it false. Such reasoning is called **ampliative**, because it adds to what the premises contain. It comes in several kinds.

An **inductive generalisation** goes from a sample to a population, and its strength depends on the sample's size and representativeness: "Six of the ten people in my book club are Libertarians, therefore about 60% of people are Libertarians" is weak. **Simple enumerative induction** reasons that all observed A's have been B, so the next A will be B; Hume's example is bread of a certain appearance, which has always nourished us. A **statistical syllogism** goes from a generalisation that holds for the most part to a single case: "Almost all people are taller than 26 inches; Gareth is a person; therefore, Gareth is taller than 26 inches." It meets the **reference class problem**, noted by John Venn (1876) and much discussed by Henry Kyburg: an individual belongs to many classes, with different proportions, and nothing in the argument says which to use. An **argument from analogy** reasons that things alike in some respects are probably alike in another, if the shared features are relevant. Finally, **abduction**, or **inference to the best explanation** (IBE), reasons to the hypothesis that would best explain the evidence. You know Tim and Harry had a row that ended their friendship; someone saw them jogging together; the best explanation is that they have made up.

**Is the deductive/inductive line sound?** The *Arguments* chapter noted that Trudy Govier attacked "the hallowed old distinction between inductive and deductive arguments" in 1987 and that Timothy Shanahan proposes dropping it, and left the case to this chapter. Three points suggest the line is less tidy than it looks. It is not, as often said, the difference between reasoning from general to specific and from specific to general: the statistical syllogism runs from general to particular, yet is not deductive. The categories also overlap. The Stanford Encyclopedia of Philosophy (SEP) observes that statistical data alone do not make an inference inductive: concluding that all elephants are grey because that best explains seeing only grey elephants is abductive in form, and Gilbert Harman (1965) treated induction as a special kind of abduction. And the familiar list of "kinds" (generalisation, prediction, statistical syllogism, analogy, causal inference) gathers patterns with little in common except that they are not deductively valid. (The word goes back to Aristotle's *epagōgē*, the move from particulars to a universal, which Cicero rendered *inductio*.) What survives is a difference in how arguments are judged: a deduction is valid or not, while an ampliative argument is stronger or weaker. Can that second kind of judgement be justified at all?

## Hume's Problem, Pressed

*Berkeley and Hume* sets out Hume's argument through eight premises, following Leah Henderson's reconstruction in the SEP. In brief: every inference from experience, "I have found that such an object has always been attended with such an effect, and I foresee, that other objects, which are, in appearance, similar, will be attended with similar effects", rests on a **Uniformity Principle**, that "the course of nature continues always uniformly the same". No demonstration can prove it, since its denial is no contradiction; no argument from experience can prove it without assuming it. Henderson's fuller version spells out two further premises, which the answers below attack: that an argument for a principle may not presuppose it, and that an inference with no chain of reasoning behind it is not justified.

Interpreters disagree whether Hume's "demonstrative" and "probable" reasoning are simply deduction and induction (Salmon) or something else (Okasha, Owen, Garrett). Karl Popper separated Hume's **logical problem** (are we justified in reasoning from experienced instances to unexperienced ones?) from his **psychological problem** (why do reasonable people expect them anyway?). Hume answered the first "no", and the second with **custom**: a propensity to repeat what we have done before without being moved by any reasoning. The label came late: Russell's chapter on induction in *The Problems of Philosophy* (1912) never mentions Hume.

The worry itself is old. Sextus Empiricus (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*) argued that an induction reviews either some particular instances, and is "insecure, since some of the particulars omitted in the induction may contravene the universal", or all of them, which is "toiling at the impossible, since the particulars are infinite and indefinite" (Bury's translation). That concerns the gap between premises and conclusion, not Hume's circle. India's Cārvāka materialists argued that inference needs knowledge of *vyāpti*, an invariable connection, that neither perception nor testimony can supply (*Jains, Ājīvikas and Materialists: India's Other Dissenters*); and al-Ghazālī denied that the link between what is "habitually believed to be a cause" and its effect is necessary (*Al-Ghazālī, Averroes and the Quarrel over Reason*).

```quote
The man who has fed the chicken every day throughout its life at last wrings its neck instead, showing that more refined views as to the uniformity of nature would have been useful to the chicken.
Bertrand Russell · The Problems of Philosophy, ch. VI · 1912
```

## Answering Hume

### Can induction justify itself?

The boldest answer accepts that any argument for induction must use induction and denies that this is vicious. Max Black (1958) offered a "self-supporting" argument for the rule R: "Most instances of A's examined in a wide variety of conditions have been B; hence (probably) The next A to be encountered will be B." Step by step:

1. In most instances of the use of R in arguments with true premises, examined in a wide variety of conditions, R has been successful.
2. R licenses the step from "most examined A's have been B" to "probably, the next A will be B".
3. Premise 1 has exactly that form, with uses of R as the A's and success as B.
4. Therefore, probably, in the next instance of the use of R in an argument with a true premise, R will be successful.

R. B. Braithwaite (1953) distinguished **premise-circularity**, where the conclusion sits among the premises, which is vicious, from **rule-circularity**, where an argument uses the rule whose reliability it concludes. Black's argument is only rule-circular. Deduction is in the same boat: even modus ponens can be justified only by an argument that uses it, as Dummett noted and Lewis Carroll's "Achilles and the Tortoise" (1895) dramatised. Lange concludes that "all that we can reasonably demand of a fundamental form of reasoning is that it endorse itself".

**Objection.** Salmon (1963) replied with **counter-induction**: "Most observed As are Bs; therefore it is not the case that most As are Bs." It supports itself just as well. Most counter-inductive arguments have failed; so, reasoning counter-inductively, they will mostly succeed from now on. If self-support vindicates induction, it vindicates its absurd rival.

**Reply.** Papineau concedes that the argument is "not supposed to do very much": it cannot convert a sceptic, but it shows that inductive practice is consistent and self-endorsing. Stathis Psillos adds a "Fair-Treatment Principle": rely on a rule unless there are specific reasons to doubt it, and against counter-induction there are many.

Others deny that there is one Uniformity Principle at all. Okasha and John D. Norton argue that each induction rests on its own specific empirical presuppositions, turning Hume's circle into a regress. "Perhaps infinite regresses are less bad than vicious circles after all," Okasha suggests.

### Vindication, dissolution, rejection

Hans Reichenbach, in *Experience and Prediction* (1938), thought Hume unanswerable but offered a **pragmatic vindication**, on the model of a physician: "I do not know whether an operation will save the man, but if there is any remedy, it is an operation." Induction aims to find series whose frequencies converge on a limit; the **straight rule** posits that the limit is close to the frequency observed so far. If a limit exists, the straight rule will find it in the long run; if none exists, no method will. Critics answered that infinitely many other rules also converge, and that the argument gives no guidance in the short run, where we live.

P. F. Strawson (*Introduction to Logical Theory*, 1952) called the demand confused. To demand a deductive justification is to demand "that induction shall be shown to be really a kind of deduction"; and asking whether induction as a whole is reasonable is like asking whether the legal system as a whole is legal: "to what legal standards are we appealing?" Being reasonable *means* proportioning belief to evidence, and evidence for a generalisation grows with the number and variety of favourable instances. BonJour objected that we want reason to think inductive conclusions likely to be true, which conformity to our standards does not give; Strawson conceded that whether "induction will continue to be successful" is a "contingent, factual matter".

Popper, as *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine* describes, denied that science uses induction at all; induction, he declared, is a myth. Critics reply that his "corroboration" of surviving hypotheses lets induction back in. Others answer Hume with explanation: the best explanation of observed regularities is a law of nature. "To infer to the best explanation is part of what it is to be rational. If that is not rational, what is?" (Armstrong, 1983).

```checkpoint
q: What is Wesley Salmon's counter-induction objection to Max Black's self-supporting argument for induction?
a*: That an absurd rule, counter-induction, can support itself in exactly the same way, so self-support cannot vindicate a rule.
a: That Black's argument contains its conclusion among its premises.
x: Black's argument is rule-circular, not premise-circular: its premise is a record of past success, not the claim that the rule is reliable.
a: That induction has in fact failed most of the time.
x: The objection does not dispute induction's record; it shows that the form of Black's argument proves too much.
a: That modus ponens cannot be justified without modus ponens.
x: That is a point made in Black's defence, to show that deduction faces the same kind of circularity.
hint: Try applying the counter-inductive rule to its own track record.
why: Counter-induction has mostly failed; reasoning counter-inductively, it will mostly succeed from now on. If self-support vindicates induction, it vindicates this rival too. Papineau replies that the argument is only a consistency check; Psillos appeals to specific reasons to distrust counter-induction.
---
q: According to Goodman's definition, when is an emerald grue?
a: When it is green now and will turn blue at some future time t.
x: This common gloss is wrong: no emerald changes colour. Grue turns on when an object is examined.
a: When it looks green to some observers and blue to others.
x: Grue has nothing to do with differing observers; it combines colour with the time of examination.
a*: When it is examined before a future time t and is green, or is not so examined and is blue.
a: When it is a mixture of green and blue.
x: Grue is a predicate defined by a disjunction, not a mixed colour.
hint: The definition mentions examination.
why: Every emerald examined so far is green and therefore also grue, so the same evidence supports two incompatible predictions about emeralds first examined after t.
```

## Ravens and Grue

Carl Gustav Hempel and Nelson Goodman showed that we lack even a clear account of what induction is. Hempel's paradox of the ravens (1945) combines **Nicod's criterion** (an F that is G confirms "All F are G") with the **equivalence condition** (evidence confirming a hypothesis confirms anything logically equivalent to it). "All ravens are black" is equivalent to "Everything non-black is a non-raven", which a green apple confirms; so the apple confirms that ravens are black. Goodman mocked the prospect of "indoor ornithology". Hempel accepted the conclusion: it looks absurd only because we tacitly use background knowledge. Pure ice held in a colourless flame that stays colourless confirms "All sodium salts burn yellow"; it seems irrelevant only because we know ice contains no sodium salt. Bayesians, from Janina Hosiasson-Lindenbaum (1940) and, best known, I. J. Good (1960), replied that the apple gives at most tiny support, because non-black things vastly outnumber ravens, while a black raven gives more; but, as Chihara warned, "there is no such thing as *the* Bayesian solution".

Goodman's **new riddle of induction** cuts deeper. Confirmation, he noticed, is not a matter of form: "This piece of copper conducts electricity" confirms "All pieces of copper conduct electricity", but "This man in the room is a third son" does not confirm "All men in this room are third sons". In *Fact, Fiction, and Forecast* (London, 1954; Harvard, 1955) he introduced a new predicate. As the SEP paraphrases it, a thing is **grue** if it is examined before some future time t and is green, or is not so examined and is blue. Nothing changes colour; what matters is when an object is examined. Then:

1. Every emerald examined before t has been green.
2. So every emerald examined before t has also been grue.
3. So the evidence confirms "All emeralds are green" and "All emeralds are grue" equally.
4. The two predict different things about emeralds first examined after t: green, or blue.
5. Infinitely many grue-like predicates yield still more incompatible predictions.
6. So no account of induction is complete until it says which predicates are **projectible**, fit to be projected onto unexamined cases.

**Objection.** "Grue" is gerrymandered: it mentions a time, while "green" is purely qualitative. Carnap (1947) proposed that only purely qualitative predicates are projectible; Swinburne adds that you can check whether something is green without knowing the date, but not whether it is grue.

**Reply.** Goodman answered that qualitativeness is relative to language. Take "grue" and "bleen" (examined before t and blue, or not so examined and green) as basic, and "green" becomes the time-involving predicate: examined before t and grue, or not so examined and bleen. Which predicates count as qualitative, Goodman concluded, is relative to the language we start from.

Goodman's own solution was **entrenchment**: "green" has been projected in far more hypotheses than "grue". Like Hume's custom, this describes how we choose rather than justifying it. Critics have worried that it simply favours whatever vocabulary came first. W. V. O. Quine ("Natural Kinds", 1969) answered with similarity: green emeralds form a natural kind and grue ones do not, and evolution gives some reason to trust our innate sense of similarity.

## What Is Probability?

"Probability is the most important concept in modern science, especially as nobody has the slightest notion what it means," Russell said in a 1929 lecture, as later quoted. On the **classical** view of Laplace (1814), probability is the ratio of favourable to "equally possible" cases, which looks circular; the patch, the **principle of indifference** (Keynes's name, 1921), gives equal probabilities when there is no reason to favour any case, but Bertrand's paradoxes (1889) show it yielding inconsistent answers. The **logical** view (Keynes, Carnap) treats probability as degree of support of a hypothesis by evidence. The **frequency** view makes it a proportion, actual (Venn) or in the limit (Reichenbach, von Mises); but a coin tossed once has a frequency of 0 or 1, and the reference class problem returns. The **propensity** view, which Popper proposed for single cases such as a radium atom, was anticipated by Charles Sanders Peirce: a die has a "would-be", "quite analogous to any habit that a man might have".

The **subjective** or **Bayesian** view takes probability as degree of belief. Frank Ramsey called it "the logic of partial belief" in "Truth and Probability", written in 1926 and published in 1931, after his death at 26. Bruno de Finetti defined your degree of belief in E as the price at which you would buy or sell a bet paying 1 if E and 0 if not.

## Bayes's Theorem at Work

Thomas Bayes (c. 1701–1761), a Presbyterian minister, left an "Essay towards Solving a Problem in the Doctrine of Chances", which Richard Price prepared for publication; it was read to the Royal Society in 1763 and printed in the *Philosophical Transactions* volume for that year, so it is cited as 1763 or 1764. Reprints called it *A Method of Calculating the Exact Probability of All Conclusions Founded on Induction*; it has been suggested, though not proven (see Zabell), that Bayes was answering Hume.

**Bayes's rule** says that the **posterior**, the probability of hypothesis H given evidence E, equals the **likelihood** P(E | H) times the **prior** P(H), divided by P(E). Updating by it is **conditionalisation**: on learning E, rule out the possibilities incompatible with E and rescale the rest to sum to one.

**A medical test.** Suppose 1 person in 100 has a disease, and a test detects 90 per cent of cases but falsely flags 9 per cent of healthy people. Of 1,000 people, 10 are ill and 9 of them test positive; of the 990 healthy, about 89 test positive. Only 9 of 98 positives are ill: about 9 per cent. Bayes's rule agrees: (0.9 × 0.01) ÷ (0.9 × 0.01 + 0.09 × 0.99) ≈ 0.092. *Informal Fallacies and Everyday Reasoning* treats this base-rate error with another example.

{{image: Monty Hall problem | The Monty Hall problem: the player has picked a door, and the host opens another to reveal a goat before offering a switch.}}

**Monty Hall.** In 1990 a reader of Marilyn vos Savant's column in *Parade* asked: you pick one of three doors, one hiding a car and two hiding goats; the host, who knows where the car is, opens another door to show a goat and offers a switch. Should you? She said yes. About 10,000 readers wrote in, nearly 1,000 with PhDs, most saying she was wrong. Say you pick door 1 and the host, who always shows a goat and chooses at random when he can, opens door 3. If the car is behind door 1, he opens door 3 half the time; if behind door 2, always; if behind door 3, never. So P(car behind 2) = (1/3 × 1) ÷ (1/3 × 1/2 + 1/3 × 1 + 1/3 × 0) = 2/3. But if the host opens a door at random and merely happens to show a goat, switching wins only half the time. What evidence shows depends on the process that produced it.

**Dutch books.** Why should beliefs obey the laws of probability? A **Dutch book** is "a series of bets bought and sold at prices that collectively guarantee loss, however the world turns out". With credence 0.75 in A and 0.30 in not-A, you would pay \$75 for a ticket paying \$100 if A and \$30 for one paying \$100 if not-A: you pay \$105 and collect \$100 whatever happens. Ramsey: if anyone's beliefs violated these laws, "his choice would depend on the precise form in which the options were offered him, which would be absurd". Kemeny and Lehman (1955) independently proved the converse: coherent credences cannot be Dutch-booked. As Alan Hájek stresses, the argument needs that converse, since the Dutch book theorem alone leaves open that everyone is vulnerable.

**The problem of the priors.** Laplace's **rule of succession** says that, from a uniform prior, after 90 white balls in 100 draws the probability that the next is white is 91/102, about 0.89. But everything hangs on the prior. Coherence and conditionalisation alone do not say whether 100 black ravens should raise your confidence that the next is black: some coherent priors are inductive, some counter-inductive. Subjective Bayesians allow any coherent prior, objective Bayesians add a principle of indifference, and "merging of opinion" theorems show different priors converging as shared evidence grows. De Finetti's theorem on **exchangeable** sequences "may be seen as a natural formalization of Hume's assumption that the past resembles the future", Henderson writes. Many therefore call the Bayesian answer partial. In Colin Howson's words, "Inductive reasoning is justified to the extent that it is sound, given appropriate premises": the prior is where the empirical assumption enters.

```checkpoint
q: One person in 100 has a disease. A test detects 90 per cent of cases and falsely flags 9 per cent of healthy people. Roughly how likely is someone who tests positive to have the disease?
a: About 90 per cent, since the test detects 90 per cent of cases.
x: That confuses the probability of a positive result given disease with the probability of disease given a positive result.
a*: About 9 per cent, since only about 9 of 98 positives in 1,000 people are true.
a: About 50 per cent, since the result is either right or wrong.
x: The two outcomes are not equally likely; the base rate and error rates fix the answer.
a: About 1 per cent, since that is the base rate.
x: The positive result is evidence and raises the probability from 1 per cent to about 9 per cent.
hint: Count 1,000 people: how many are ill, and how many test positive?
why: Ten are ill and 9 of them test positive; about 89 of the 990 healthy people also test positive. Only 9 of 98 positives are true, about 9 per cent, as Bayes's rule confirms.
---
q: In the Monty Hall problem, why does switching win 2/3 of the time under the standard rules, but only 1/2 if the host opens a door at random?
a: Because the car moves after the host opens a door.
x: The car never moves; only the evidence differs.
a: Because vos Savant's readers were right about the standard version.
x: Under the standard rules switching does win 2/3 of the time, as she said.
a: Because in the random version there are only two doors.
x: There are three doors in both versions.
a*: Because a host who knows where the car is and must show a goat gives different evidence from one who shows a goat by chance.
hint: Ask how the evidence was produced.
why: A host who must show a goat never opens the car's door, so his choice carries information about where it is; a host who happens to show one carries less. What evidence shows depends on the process that produced it.
```

## Inference to the Best Explanation

Charles Sanders Peirce coined **abduction** (see *American Pragmatism: Peirce, James and Dewey*): "the process of forming explanatory hypotheses. It is the only logical operation which introduces any new idea."

```quote
The surprising fact, C, is observed. / But if A were true, C would be a matter of course. / Hence, there is reason to suspect that A is true.
Charles Sanders Peirce · Harvard Lectures on Pragmatism · 1903
```

For Peirce abduction belongs to discovery: it suggests hypotheses, deduction draws out their consequences, and induction tests them. He never speaks of the *best* explanation. The modern sense, in which explanation justifies belief, comes from Harman's 1965 paper "The Inference to the Best Explanation"; he is usually credited with the phrase. Peter Lipton (*Inference to the Best Explanation*, 1991) distinguished the **likeliest** explanation, best supported by the evidence, from the **loveliest**, which would give the most understanding if true. Read "best" as "likeliest" and IBE says nothing useful; so Lipton read it as inference to the loveliest, with loveliness a guide to likeliness.

Mill had doubted the method: a hypothesis "is not to be received as probably true because it accounts for all the known phenomena; since this is a condition sometimes fulfilled tolerably well by two conflicting hypotheses." Bas van Fraassen (*Laws and Symmetry*, 1989) sharpened the point. IBE ranks only the hypotheses we happen to have thought of, so it may lead us to "the best of a bad lot", and it is implausible that we are privileged to think of the truth. Replies require the best to be "good enough" (Lipton) or "satisfactory" (Musgrave). Van Fraassen also argued that a probabilistic IBE rule either agrees with Bayes's rule, and is redundant, or departs from it, and can be Dutch-booked. Lipton replied that Bayesians should be "explanationists", letting explanatory considerations guide their priors and likelihoods. Nor is IBE only Western: *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* shows Vācaspati Miśra appealing to it in defending Nyāya's argument for God.

## Induction across Traditions

**Nyāya** built inference (*anumāna*) around *vyāpti*, "pervasion": "Wherever there is smoke, there is fire; like a kitchen hearth and unlike a lake." Pervasion, Stephen Phillips and Anand Vaidya write in the SEP, "is known typically through generalization from cases", positive and negative. Against the Cārvāka challenge Nyāya argued pragmatically that the sceptic "himself relies on such generalizations when he opens his mouth to voice his skepticism, by using words with repeatable meanings", and theoretically that in seeing smoke one perceives the universal smokiness and, by extraordinary perception, its tie to fieriness. "Nyāya thus solves the problem of induction by appeal to extraordinary perception," Matthew Dasti writes in the Internet Encyclopedia of Philosophy. In their summary, Buddhist and Nyāya philosophers turned the Cārvāka argument into an argument for **fallibilism**: inference can give knowledge though it might be wrong.

**Dharmakīrti** (sixth or seventh century CE; his dates are debated) refused to rest the universal premise on the mere absence of counterexamples, grounding it instead in **causation** (smoke must come from fire, or it is "pseudo-smoke") and **identity** of nature (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*). Gillon argues that this fails; Steinkellner dissents. Bimal Krishna Matilal compared the Indian method of co-presence and co-absence (*anvaya* and *vyatireka*) with **Mill's methods**, set out in *A System of Logic* (1843) and counted as four or five (see *Bentham, Mill and Utilitarianism*); the Method of Agreement holds that if instances of a phenomenon share only one circumstance, it is the cause or effect.

**Avicenna**, in the *Demonstration* of *The Book of Healing*, held that Aristotelian induction (*istiqrāʾ*), in Jon McGinnis's words, "does not lead to the absolute, universal, and certain premises that it purports to provide", and set against it experience (*tajriba*), which he thought could give conditional but certain first principles (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*). **The Mohists** reasoned by "extending kinds": "Accept and propose on the basis of kinds (lèi 類)." Their *Lesser Selection* names four techniques, all, in Chris Fraser's account, procedures for analogical argument. (See *Mozi, the Daoists and the Legalists: the Hundred Schools* and *Logic across Traditions*.) Which things count as the same kind is Goodman's and Quine's question about projectible predicates, asked long before them.

From Sextus's gap to the Bayesian's prior, many answers share the fallibilism Phillips and Vaidya find in Nyāya and the Buddhists: inference can give knowledge without a guarantee against error. How science uses such reasoning is the subject of *What Makes Science Science? Method and Demarcation*.

## Further exploration

- **Wesley C. Salmon, *The Foundations of Scientific Inference* (1966).** A classic survey of the attempts to answer Hume.
- **Colin Howson, *Hume's Problem: Induction and the Justification of Belief* (2000).** A Bayesian "logical" answer, in which the prior carries the empirical assumption.
- **John D. Norton, *The Material Theory of Induction* (2021).** Induction without universal rules; free to read online.
- **Ian Hacking, *The Emergence of Probability* (1975).** How the idea of probability arose in the seventeenth century.
- **Michael G. Titelbaum, *Fundamentals of Bayesian Epistemology* (Oxford University Press).** A two-volume textbook on credences, Dutch books and priors.
- **Peter Lipton, *Inference to the Best Explanation* (1991; 2nd ed. 2004).** The standard book on IBE, loveliness and likeliness, and Bayesianism.
- **Bimal Krishna Matilal, *The Character of Logic in India* (1998).** Inference, *vyāpti* and the Buddhist–Nyāya debates.$induction_master$,
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
  select $induction_quiz$[
    {"type": "mcq", "prompt": "What does Reichenbach's 'pragmatic vindication' of induction claim?", "options": ["If nature's frequencies converge on a limit, the straight rule will find it in the long run; if there is no limit, no method will succeed", "Induction can be proved valid by deduction from a priori premises", "Induction is reasonable by definition, so no justification is needed", "Science does not use induction at all, only conjecture and refutation"], "answerIndex": 0, "explanation": "Reichenbach (1938) thought Hume's argument unanswerable but argued that using the straight rule costs nothing: like an operation that is the only possible remedy, it will succeed if anything can. Critics replied that infinitely many other rules also converge and that it gives no short-run guidance. The other options describe a deductive justification, Strawson and Popper.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Hempel respond to his own paradox of the ravens, in which a green apple seems to confirm 'All ravens are black'?", "options": ["He rejected the equivalence condition", "He rejected Nicod's criterion", "He accepted the conclusion, arguing that the appearance of paradox comes from tacitly using background knowledge", "He replaced 'black' with a grue-like predicate"], "answerIndex": 2, "explanation": "Hempel held that a non-black non-raven really does confirm the hypothesis; it seems irrelevant only because of what we already know, as with pure ice that fails to turn a flame yellow confirming 'All sodium salts burn yellow'. Bayesians such as Good later argued the support is real but tiny.", "id": "q2"},
    {"type": "mcq", "prompt": "Your credence is 0.75 that A is true and 0.30 that A is false. You pay 75 units for a ticket that pays 100 units if A, and 30 units for one that pays 100 units if not-A. What happens?", "options": ["You win 5 units whatever happens", "You break even whatever happens", "You win or lose depending on whether A is true", "You lose 5 units whatever happens: a Dutch book"], "answerIndex": 3, "explanation": "You pay 105 in total and exactly one ticket pays 100, so you lose 5 however the world turns out. Credences that violate the laws of probability (here they sum to 1.05) are open to such a Dutch book; Kemeny and Lehman proved that coherent credences are not.", "id": "q3"},
    {"type": "mcq", "prompt": "On what did Dharmakīrti ground the universal premise of an inference, such as the connection between smoke and fire?", "options": ["On the mere failure to observe counterexamples", "On causation and identity of nature", "On the testimony of the Vedas", "On an extraordinary perception of universals"], "answerIndex": 1, "explanation": "Dharmakīrti refused to rest the universal premise on non-observation of counterexamples and grounded it in two relations, causation (smoke must come from fire, or it is 'pseudo-smoke') and identity. Extraordinary perception of universals is the Nyāya answer; Gillon argues Dharmakīrti's grounding fails, and Steinkellner dissents.", "id": "q4"},
    {"type": "open", "prompt": "Set out Goodman's new riddle of induction step by step, making clear what 'grue' means. Then give the strongest objection to it and Goodman's reply, and say how Goodman and Quine proposed to tell projectible predicates from unprojectible ones.", "rubric": "A strong answer defines grue correctly (examined before t and green, or not so examined and blue) and notes that no emerald changes colour: the definition turns on time of examination. It sets out the steps: all emeralds examined before t were green, hence also grue; the evidence confirms 'all emeralds are green' and 'all emeralds are grue' equally; they predict green versus blue for emeralds first examined after t; infinitely many such predicates exist; so we need an account of projectibility. Objection: grue is positional or disjunctive while green is qualitative (Carnap; Swinburne's point that green can be checked without knowing the time). Reply: qualitativeness is relative to language, since with grue and bleen as primitives green becomes the disjunctive, time-involving predicate. It describes Goodman's entrenchment (and the worry that it favours whatever vocabulary came first) and Quine's natural kinds and similarity, with evolution as some reason to trust our sense of similarity. Credit links to Hempel's ravens and Goodman's copper/third-son contrast.", "id": "q5"},
    {"type": "open", "prompt": "Is inference to the best explanation a reliable form of reasoning? Explain what it is, how Lipton understood 'best', and van Fraassen's two objections, with the replies to each.", "rubric": "A strong answer explains IBE as inferring the hypothesis that would best explain the evidence (for example Tim and Harry jogging), distinguishes Peirce's abduction (generating hypotheses, his 1903 schema, no reference to 'best') from the modern sense credited to Harman (1965), and gives Lipton's likeliest/loveliest distinction and his view that loveliness guides likeliness. It states van Fraassen's 'best of a bad lot' objection (we compare only hypotheses we have thought of) with replies that the best must be 'good enough' or 'satisfactory', and his second objection that a probabilistic IBE rule is either redundant with Bayes's rule or Dutch-bookable, with Lipton's reply that explanatory considerations guide Bayesian priors and likelihoods. Credit Mill's earlier doubt that two conflicting hypotheses can both account for the phenomena, and Vācaspati Miśra's use of IBE in India.", "id": "q6"}
  ]$induction_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/induction-and-probability', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
