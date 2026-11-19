-- Scepticism and the Answers to It — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/scepticism @ research/advanced/read.
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
    'philosophy/epistemology/scepticism',
    'research',
    'advanced',
    'read',
    $scepticism_master$> **Can we know anything at all, and if not, how should we live?** This chapter sets out the regress argument (Agrippa's trilemma, also pressed in India) and the four ways of answering it; the dream argument in Zhuangzi, al-Ghazālī and Descartes; and the modern argument from brains in vats and closure. It weighs the main answers, from Moore and Wittgenstein to contextualism, externalism and Putnam, and ends with the Pyrrhonist's claim that doubt, rightly lived, brings calm.

## What the Sceptic Claims

Nobody knows whether the number of stars in the Milky Way is even; that is ordinary ignorance. **Philosophical scepticism** says we do not know things we ordinarily think we know, such as that the sun will come out tomorrow. Juan Comesaña and Peter Klein, in the *Stanford Encyclopedia of Philosophy* (SEP), define scepticism about a field as the claim that "the only justified attitude with respect to propositions in F is suspension of judgment". Suspending judgement is a genuine attitude, not mere lack of opinion; Greek *skepsis* means investigation, and a sceptic is literally an inquirer.

**Local** scepticism targets one subject matter; **radical** scepticism afflicts most of our beliefs. Comesaña and Klein sort three kinds, with labels used "without any particular claim to historical accuracy". *Humean* scepticism grants knowledge from experience and deduction but denies knowledge reached by non-deductive inference such as induction; that problem belongs to *Induction, Probability and Inference to the Best Explanation*. *Cartesian* scepticism denies that we are justified in believing anything about the external world, allowing knowledge only of our own mental states: it seems to me that I have hands. *Pyrrhonian* scepticism is universal: we know no proposition, not even that it seems to us that we have hands.

Is global scepticism self-refuting? Comesaña and Klein argue that it is formally consistent: it refutes itself only on an extra principle, that being committed to a claim commits you to its being justified, and the Pyrrhonist suspends judgement on that too. Duncan Pritchard, in the *Internet Encyclopedia of Philosophy* (IEP), notes that the modern debate treats scepticism as a **paradox**: claims that each seem plausible but together lead to a devastating conclusion. Something must give.

## The Regress: Agrippa's Trilemma

The history of the ancient sceptics, from Pyrrho of Elis to Sextus Empiricus, is told in *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*, and their return through Montaigne in *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*; here what matters is how their tools work. (One surprise: Richard Bett argues that Pyrrho himself "was arguably no Pyrrhonian skeptic", since he probably held the dogmatic view that things are by nature indeterminate.)

The **Ten Modes**, preserved by Sextus (*Outlines of Pyrrhonism* 1.36–163) and Diogenes Laertius, collect ways in which appearances conflict: between animals, people, senses, conditions such as age or emotion, positions and so on. A tower looks round from afar and square close up; honey is sweet to most people and bitter to someone with jaundice. On one reading (Annas and Barnes) we cannot settle such disputes because we are ourselves a party to them: there is no "view from nowhere". The *Zhuangzi* (ch. 2, in Chad Hansen's translation) runs the first mode independently: people who sleep in the damp get pains, but would eels? Of people, eels and monkeys, "does any know the correct place to live?"

The sharpest tool is the **Five Modes** ascribed to Agrippa, of whom "almost nothing is known": disagreement, infinite regress, relativity, hypothesis (an assumption made without argument) and circularity. Three of them combine into what is now called **Agrippa's trilemma**. Here it is step by step, following Comesaña and Klein's reconstruction. A belief is **basically** justified if it is justified without being inferred from other beliefs, and **inferentially** justified if it is justified by them.

1. If a belief is justified, it is justified either basically or inferentially.
2. No belief is basically justified (an unsupported starting point is mere assertion: the mode of hypothesis).
3. So a justified belief must be justified by its place in a chain of inference.
4. Every such chain is infinite, or loops back on itself, or ends in beliefs that are not justified.
5. An infinite chain justifies nothing (the mode of infinite regress).
6. A circular chain justifies nothing (the mode of circularity).
7. A chain that ends in unjustified beliefs justifies nothing.
8. So no belief is justified.

In practice it is a game of questions: refuse to give a reason and you have merely assumed your claim; give the claim itself and you argue in a circle; give another and the question returns. Turned on theories of knowledge themselves, it becomes what Chisholm (1973) called "the problem of the criterion". In 1968 Hans Albert named it the **Münchhausen trilemma**, drawing on Karl Popper, who had credited a similar trilemma to J. F. Fries without mentioning Sextus.

**The answers each reject a premise.** **Foundationalism** rejects premise 2: some beliefs are justified by experience rather than by other beliefs. **Infinitism** rejects premise 5, "the answer … that has received the least attention", defended by Klein himself. **Coherentism** (BonJour, Lehrer) rejects premise 6: beliefs are justified by fitting together. Its standing **objection** is that a coherent system could be swapped wholesale between two people, keeping its coherence but not its justification. A fourth answer, which Comesaña and Klein call **"positism"**, rejects premise 7: chains end in posits that are neither justified nor unjustified. It draws on Wittgenstein's *On Certainty* and on Ortega y Gasset's *Ideas y Creencias* (1940). The **objection** is that it turns "a doxastic necessity into an epistemic virtue": what we cannot help believing is not thereby reasonable. Many now combine options, as in Haack's "foundherentism" (1993).

India produced the same argument. Nāgārjuna held that a means of knowledge must be established by another (a regress, like testing a scale with a second scale), by itself (then proof is idle) or by mutual support (a circle, like "father" and "son"), as *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* explains. Around 800 Jayarāśi Bhaṭṭa argued that every means of knowledge is flawed or needs a further means, which stands in the same need (*Jains, Ājīvikas and Materialists: India's Other Dissenters*). In the twelfth century Śrīharṣa set out, in Nilanjan Das's description, "to demonstrate the instability of rational inquiry within philosophy", since for any argument "there is always an equally persuasive counterargument": the Greek *isostheneia*, equipollence, in a new setting. Ethan Mills sees in these three an Indian "skepticism about philosophy" resembling Pyrrhonism, though not all Indologists accept that each was a sceptic.

```checkpoint
q: In Agrippa's trilemma, which premise does coherentism reject?
a*: That a circular chain of reasons cannot justify.
a: That some beliefs are justified without being inferred from others.
x: That premise (no basic beliefs) is the one foundationalism rejects.
a: That an infinite chain of reasons cannot justify.
x: Rejecting that premise is infinitism, defended by Klein.
a: That a chain ending in unjustified beliefs cannot justify.
x: Rejecting that premise is what Comesaña and Klein call "positism", drawn from Wittgenstein and Ortega y Gasset.
hint: Coherentists say beliefs are justified by how they fit together.
why: Coherentists such as BonJour and Lehrer hold that mutual support among beliefs can justify, so they deny that every "circle" is vicious. The objection is that a whole coherent system could be swapped between two people without carrying its justification with it.
---
q: Who coined the name "Münchhausen trilemma"?
a: Sextus Empiricus, in the Outlines of Pyrrhonism.
x: Sextus records the Five Modes, ascribed to Agrippa, but the Münchhausen name is modern.
a: Karl Popper, in 1935.
x: Popper discussed a related trilemma and credited it to Fries; he did not coin this name.
a*: Hans Albert, in 1968.
a: Roderick Chisholm, in 1973.
x: Chisholm named "the problem of the criterion", the same argument turned on theories of knowledge.
hint: The name came from a German philosopher writing after Popper.
why: Hans Albert coined the name in 1968, working from a trilemma ("dogmatism versus infinite regress versus psychologism") that Popper had credited to J. F. Fries.
```

## Dreaming, East and West

The most famous sceptical scenario is the dream. The *Zhuangzi* imagines a "great awakening" (2:12, in Hansen's translation): "When we dream, we don't know it as a dream, and in our dreams, judge something else as a dream. On awakening, we know it was a dream, and there could be another greater awakening in which we know a greater dream." The butterfly dream and its rival readings are in *Mozi, the Daoists and the Legalists: the Hundred Schools*.

Al-Ghazālī (*Al-Ghazālī, Averroes and the Quarrel over Reason*) used the dream more radically. In his *Deliverance from Error*, after doubting the senses, he asked: "what assurance have you that you may not suddenly experience a state which would have the same relation to your waking state as the latter has to your dreaming…?" (McCarthy's translation). His target was not the senses but the first truths of reason, so he could not argue his way out: any proof would need the very truths in doubt.

Descartes' version, in the First Meditation (1641), is set out in *Descartes*; here is the argument itself. A formal version, which Gary Ebbs gives after Barry Stroud, runs as follows for any belief *p* about the world around me:

1. If I know that *p*, then I know that I am not dreaming that *p*.
2. I do not know that I am not dreaming that *p*.
3. So I do not know that *p*.

Premise 2 rests on a principle Stroud calls *Dream*: "Anything that can be going on or that one can experience in one's waking life can also be dreamt about." The dream need not make my belief false: if I dream that I have hands, I do not thereby know I have them, though I do. It threatens knowledge, not truth.

**Objection.** Dream arguments refute themselves. To say dreams resemble waking life, we must tell the two apart, which the conclusion denies. **Reply.** Lex Newman points out that the premise, as Descartes restates it in the Sixth Meditation, speaks only of what we *think of* as waking and dreaming: "every sensory experience I have ever thought I was having while awake I can also think of myself as sometimes having while asleep." That is compatible with the conclusion.

Descartes went further, to a deceiving God and then the **evil demon**: "some malicious demon of the utmost power and cunning" (in the Cottingham, Stoothoff and Murdoch translation; the Latin is *genium aliquem malignum*, and the French version of 1647 has *mauvais génie*; "malin génie", a common label in French commentary, is not Descartes' wording). Newman argues that the deeper worry is that our minds may be built to err. Medieval thinkers had asked whether God could deceive us (*Scotus, Ockham and the Late Medieval Debates*), and Augustine had answered doubt with "si enim fallor, sum" ("even if I err, I am"; see *Augustine and Early Christian Philosophy*).

Myles Burnyeat and Williams argued that the ancients never posed scepticism about the external world at all, because the modern version depends on a creator who might have made our faculties misfit the world; a paradox one thinker feels torn by is, in Katja Vogt's words, "foreign to antiquity". Fine replies that Sextus' talk of "externally underlying things" may give the ancients their own version.

{{image: Brain in a vat | The modern demon: a brain kept alive in a vat and fed the experiences of a normal life.}}

## Brains in Vats and the Closure Argument

The modern successor of the demon is a brain that "resides in a vat where it is electrically stimulated to have precisely the same sensory experiences that you now have". The scenario is often traced to Gilbert Harman's *Thought* (1973), was made famous by Hilary Putnam, and underlies the 1999 film *The Matrix*. Such a story is a **sceptical hypothesis**: if it were true I would not know some ordinary truth, and I could not tell it apart from a situation in which I did.

The modern argument adds the **closure principle**. In Pritchard's form: "If an agent knows P, and knows that P entails Q, then that agent knows Q." Now let H be "I have hands" and BIV be "I am a handless brain in a vat":

1. I do not know that I am not a BIV.
2. If I know H, then, since H entails that I am not a handless BIV, I know that I am not a BIV (by closure).
3. So I do not know H.

Any claim about the world can replace H, so the conclusion is scepticism about the external world. Pritchard states the paradox as three claims that cannot all be true: I cannot know that sceptical hypotheses are false; if I cannot, I do not know very much; and a lot of what I believe, I know. The answers divide by which they give up: some deny premise 1, some deny closure, contextualists relativise both to the conversation, and the sceptic accepts the conclusion.

## Answer One: Common Sense and Hinges

Moore's "Proof of an External World" (1939) held up one hand and then the other. *Frege, Russell and the Birth of Analytic Philosophy* sets out the proof, the charge that it begs the question, Wright's diagnosis that its warrant fails to "transmit", and Pryor's defence. Neo-Mooreans run the sceptic's argument backwards: since I know I have hands, I know I am not a brain in a vat. But on Tom Baldwin's reading that was not Moore's aim: he later said the proof answered "there are no material things", not "Nobody knows for certain that there are any material things".

Wittgenstein's *On Certainty* (1969) answered Moore and the sceptic together. "My having two hands is, in normal circumstances, as certain as anything that I could produce in evidence for it," he wrote (§250, in Denis Paul and Anscombe's translation). "That is why I am not in a position to take the sight of my hand as evidence for it." Some propositions are **hinges**: our doubts turn on them, so they cannot themselves be doubted (see *Wittgenstein*, which also covers the debate over what hinges are). Wright built a stronger answer on this: we are **entitled** to accept that we are not in a sceptical scenario without evidence, "because unless we were we would not be justified in believing any proposition". The standing objection is the one raised against "positism": a necessity of belief is not yet a reason.

## Answer Two: Deny Closure

Fred Dretske (1970) attacked premise 2.

```quote
You take your son to the zoo, see several zebras, and, when questioned by your son, tell him they are zebras. Do you know they are zebras? … Do you know that these animals are not mules cleverly disguised by the zoo authorities to look like zebras?
Fred Dretske · "Epistemic Operators" · 1970
```

Your evidence, Dretske argued, "does not count toward their not being mules cleverly disguised". So you know they are zebras without knowing they are not disguised mules: "knows that" does not "penetrate" to everything a statement presupposes. Robert Nozick (*Philosophical Explanations*, 1981) explained why: among his conditions on knowledge is **sensitivity**: if *p* were false, you would not believe *p*. My belief that I have hands is sensitive: if I had none, after some accident, I would know it. My belief that I am not a brain in a vat is not: a brain in a vat would believe it too. So I know H but not that I am not a BIV, and closure fails. (*What Is Knowledge? From Plato to the Gettier Problem* examines sensitivity and its rivals as definitions of knowledge.)

**Objection.** This yields what Keith DeRose (1995) called the "abominable conjunction": "I know that I have hands but I don't know that I'm not a handless brain in a vat." Closure itself is enormously plausible, and sensitivity has counterexamples, such as Vogel's ice-cold lemonade left out in the sun. **Reply.** Closure-deniers say the oddness of the conjunction can be explained without making it false, and Nozick denied one closure principle while affirming another.

A rival condition keeps closure. On **safety** (Sosa, Williamson, Pritchard), a belief is knowledge only if it is true in all nearby situations where I hold it. If brain-in-vat worlds are far off, my belief that I am not envatted is safe, so I know it after all. This **neo-Moorean** answer denies premise 1, but critics say it makes a mystery of why scepticism ever tempted us.

## Answer Three: Contextualism

Contextualists hold that the standards for truly saying "S knows that p" vary with the speaker's conversation, as the standards for "tall" or "flat" do. It is a thesis about the word "know", not about knowledge itself. DeRose's **bank cases** (1992) give the intuition. On a Friday a couple consider depositing their pay on Saturday. When little hangs on it, the husband says he knows the bank will be open, having been there on a Saturday two weeks before; when a bill depends on it and his wife notes that banks change their hours, he says, with the same evidence, that he does not know. Both claims seem right.

DeRose's "Rule of Sensitivity" says that asserting that someone knows *p* tends to raise the standard so that the belief must be sensitive. Mentioning brains in vats raises it so high that, in that conversation, we know neither that we are not envatted nor that we have hands; in ordinary talk we know both. Closure holds within each context. David Lewis put it memorably:

```quote
Examine it, and straightway it vanishes.
David Lewis · "Elusive Knowledge" · 1996
```

For Lewis you know *p* when your evidence rules out every possibility of its falsehood except those you may properly ignore, and "a possibility that is not ignored is ipso facto not properly ignored": mention the demon and you can no longer ignore it.

**Objections.** It changes the subject: it tells us when *sentences* about knowledge are true, and still needs some independent argument that we are justified in denying sceptical hypotheses (Feldman, Conee). Schiffer found its "error theory" implausible: it is unlikely that we are "bamboozled by our own words", and "speakers would know what they were saying if knowledge sentences were indexical", that is, if their content shifted with context. Rivals keep the meaning of "know" fixed and let practical stakes affect knowledge itself ("pragmatic encroachment").

```checkpoint
q: What is epistemic contextualism, strictly, a theory of?
a: The way knowledge itself comes and goes as our circumstances change.
x: That is closer to its rival, pragmatic encroachment, which lets the stakes affect knowledge itself.
a*: The truth conditions of sentences of the form "S knows that p", which vary with the speaker's context.
a: The context in which a belief was formed, which decides whether it is reliable.
x: Reliability of belief-forming processes is reliabilism, an externalist theory of justification.
a: The cultural context that makes different societies count different things as knowledge.
x: Contextualism concerns the conversational standards for using the word "know", not cultural relativism.
hint: Compare the word "tall".
why: DeRose's formulation concerns how strong an epistemic position S must be in for a speaker's assertion "S knows that P" to be true. That is why critics say it changes the subject from knowledge to "knowledge"-sentences.
---
q: What is the "abominable conjunction"?
a: Moore's claim that he both knows he has hands and is not dreaming.
x: Moore in fact conceded, late in life, that he could not know for certain he was not dreaming.
a: The coherentist's combination of beliefs that support one another in a circle.
x: That is the subject of Agrippa's trilemma, not of closure.
a: Wittgenstein's view that hinges are both certain and not known.
x: The phrase concerns closure, not Wittgenstein's hinges.
a*: The claim, which closure-deniers must allow, "I know I have hands but I don't know I'm not a handless brain in a vat".
hint: DeRose coined it against Dretske and Nozick.
why: If closure fails, one can know an ordinary truth while failing to know that it entails the falsity of a sceptical hypothesis. DeRose (1995) found the result abominable; closure-deniers reply that its oddness can be explained away.
```

## Answer Four: Externalism, Evidence and Meaning

Pritchard observes that nearly all the answers above are **externalist**: they make knowledge depend on facts, such as reliability or safety, that the knower need not be able to check by reflection. **Internalists** demand some condition knowable by reflection alone. On Alvin Goldman's reliabilism (1979), a belief is justified when a reliable process produced it (see *What Is Knowledge? From Plato to the Gettier Problem*); then a normal perceiver knows she has hands though she cannot prove she is not envatted. The **objection** is the "new evil demon problem": the demon's victims have experiences just like ours and seem as justified as we are, though their processes are unreliable. The "new sceptics", Stroud, Nagel and Fumerton, reply that an externalist answer is not the one we wanted, which was to determine "from the inside" whether we know.

Timothy Williamson (*Knowledge and Its Limits*, 2000) attacks the sceptic's picture of evidence. If our evidence is what we know, then in the good case we have more evidence than the brain in a vat. The victim cannot tell he is in the bad case, but we in the good case may still know we are not. He also argues, from someone who warms very slowly from cold at dawn to hot at noon, that no mental state is "luminous" (always knowable when one is in it), undermining the Cartesian assumption that our own experiences, at least, are perfectly accessible. Critics target the argument's margin-for-error premise.

**Disjunctivists** deny that a true perception and a matching hallucination share a common experience. For John McDowell (1982) an appearance can be "either a mere appearance or the fact that such-and-such is the case making itself perceptually manifest to someone", so the sceptic cannot assume we have the same evidence in both cases. We still cannot tell which case we are in, critics object; but disjunctivism aims only to rebut an argument that we *cannot* know. Pritchard's *Epistemic Angst* (2015) combines it with hinges; *Perception and the External World* treats it as a theory of perception.

Putnam's "Brains in a Vat" (1981) is the boldest answer, because it claims the hypothesis cannot even be truly stated. In his version all of us have always been envatted, by machinery that arose by cosmic chance. His principle is that "one cannot refer to certain kinds of things, e.g. trees, if one has no causal interaction at all with them" (see *Meaning and Reference*). In the simplest reconstruction:

1. If I am a BIV, then my word "brain" does not refer to brains.
2. My word "brain" refers to brains.
3. So I am not a BIV.

**Objection** (Brueckner, Wright): if I do not already know whether I speak English or "vat-English", I cannot help myself to premise 2. **Reply** (Christensen): disquotation holds within whatever language I actually speak, and "we don't need to know which of these languages we are speaking in order to know we are speaking the one we are speaking". Even so, Wright notes a limit: the argument leaves untouched a brain removed from its skull last night, whose words still refer to real things. At best it defeats one sceptical hypothesis, not Cartesian scepticism in general.

## The Sceptic's Own Answer

For the Pyrrhonist, scepticism is not a problem but a cure: suspending judgement brings **tranquillity** (*ataraxia*). The Stoics objected that action requires assent, so a sceptic cannot act. Sextus replied that the sceptic lives "without belief" by following appearances, nature, feelings, customs and the skills he has learned (*Hellenistic Philosophy: Stoics, Epicureans and Sceptics* summarises the exchange).

Can the Pyrrhonist live this way? "In the past 40 years, scholars have paid attention to this question more than to any other interpretive issue," writes Benjamin Morison. Michael Frede argued that the sceptic keeps ordinary beliefs and rejects only dogma about "non-evident matters investigated by the sciences". Burnyeat and Jonathan Barnes held that he rejects all belief. Barnes named the two positions, borrowing "rustic" from Galen for the believer in nothing and coining **"urbane"** for Frede's sceptic. Morison concludes that "the urbane interpretation is still standing".

Hume (*Berkeley and Hume*) rejected the extreme position he called "Pyrrhonian" as harmful and psychologically impossible to sustain: action, employment and the occupations of common life, he argued, overturn it. He recommended a "mitigated" or "Academic" scepticism, which lowers our confidence and limits our inquiries. Zhuangzi offers another model. Hansen calls his scepticism "broad but weak": it denies final certainty but allows degrees of knowledge, and it "should provoke curiosity, not paralysis". Kjellberg and Raphals compare it with Sextus. Nāgārjuna, too, claimed in Berger's paraphrase to "assert no thesis", and his dismantling of views was meant to lead to insight.

No answer has won. But each teaches something about knowledge: that it may not need a proof, that its standards may vary, that evidence may be what we know. That is the sceptic's lasting gift.

## Further exploration

- **Barry Stroud, *The Significance of Philosophical Scepticism* (1984).** The classic case that scepticism is far harder to escape than it looks.
- **Richard Bett (ed.), *The Cambridge Companion to Ancient Scepticism* (2010).** Pyrrhonists and Academics, by leading scholars.
- **Harald Thorsrud, *Ancient Scepticism* (2009).** A short, clear introduction to the Greek sceptics.
- **Ethan Mills, *Three Pillars of Skepticism in Classical India: Nāgārjuna, Jayarāśi, and Śrī Harṣa* (2018).** Indian "skepticism about philosophy", compared with Pyrrhonism.
- **Paul Kjellberg and Philip J. Ivanhoe (eds), *Essays on Skepticism, Relativism, and Ethics in the Zhuangzi* (1996).** The debate over what kind of sceptic Zhuangzi was.
- **Keith DeRose, *The Case for Contextualism: Knowledge, Skepticism and Context*, vol. 1 (2009).** The fullest statement of contextualism by its leading defender.
- **Duncan Pritchard, *Epistemic Angst: Radical Skepticism and the Groundlessness of Our Believing* (2015).** Wittgenstein's hinges combined with disjunctivism.$scepticism_master$,
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
  select $scepticism_quiz$[
    {"type": "mcq", "prompt": "In the Pyrrhonian 'rustic versus urbane' debate, what is the urbane sceptic?", "options": ["A sceptic who rejects all belief, even about whether honey tastes sweet", "A sceptic who keeps ordinary everyday beliefs and rejects only dogma about non-evident matters", "An Academic sceptic who acts on persuasive impressions", "A sceptic who claims to know that nothing can be known"], "answerIndex": 1, "explanation": "Jonathan Barnes coined 'urbane' for Michael Frede's reading, on which the sceptic rejects only assent to the 'non-evident matters investigated by the sciences', and took 'rustic' from Galen for the sceptic who rejects all belief (Burnyeat's and Barnes's own reading). The Academics' 'persuasive' impression belongs to Carneades, and claiming to know that nothing can be known is 'negative dogmatism', which Sextus rejects.", "id": "q1"},
    {"type": "mcq", "prompt": "How does al-Ghazālī's dream doubt in the Deliverance from Error differ from Descartes' dream argument?", "options": ["Al-Ghazālī's targets the first truths of reason; Descartes' targets beliefs from the senses about the world", "Al-Ghazālī doubts God's existence; Descartes does not", "Al-Ghazālī escapes by a proof from the cogito; Descartes by divine illumination", "There is no difference: Descartes copied it from a French translation"], "answerIndex": 0, "explanation": "Al-Ghazālī asks what assurance we have that a state might not come which stands to waking as waking stands to dreaming, and aims this at reason's primary truths, which is why no proof could cure him; he was rescued by a light God cast into his breast. He never doubted God. No translation existed in Descartes' day (the French one dates from 1842), and the theory that Golius translated it orally for him rests on circumstantial evidence.", "id": "q2"},
    {"type": "mcq", "prompt": "Why, according to Nozick, do I know that I have hands without knowing that I am not a brain in a vat?", "options": ["Because I can prove I have hands but cannot prove I am not envatted", "Because my belief that I have hands is safe but my belief that I am not a brain in a vat is not", "Because the word 'vat' cannot refer for a brain in a vat", "Because my belief that I have hands is sensitive (if I had none, I would not believe I had), while my belief that I am not envatted is not"], "answerIndex": 3, "explanation": "Nozick's sensitivity condition requires that if p were false, I would not believe p. A brain in a vat would still believe it was not one, so that belief is insensitive; hence closure fails. Safety is the rival condition that keeps closure, and the point about reference is Putnam's.", "id": "q3"},
    {"type": "mcq", "prompt": "What limit does Crispin Wright identify in Putnam's argument that we are not brains in vats?", "options": ["It assumes that Descartes' evil demon exists", "It is invalid, because its conclusion does not follow from its premises", "It does not touch a brain that was removed from its skull only last night, whose words still refer to real things", "It applies only to the film The Matrix"], "answerIndex": 2, "explanation": "Putnam's argument relies on the claim that words refer only to things their users have causally interacted with. A recently envatted brain has interacted with real brains and trees, so its words still refer to them and the argument cannot exclude its situation. At best it rules out one sceptical hypothesis, not Cartesian scepticism in general.", "id": "q4"},
    {"type": "open", "prompt": "Set out Agrippa's trilemma (the regress argument) step by step. Then explain the four main answers to it, saying which premise each rejects, and give the strongest objection to one of them.", "rubric": "A strong answer distinguishes basic from inferential justification and gives the steps: a justified belief is justified basically or inferentially; there are no basic justified beliefs (the mode of hypothesis); so justification requires a chain of inference; every chain is infinite, circular or ends in unjustified beliefs; none of these justifies (modes of regress and circularity); so no belief is justified. It matches foundationalism to the denial of basic beliefs, infinitism (Klein) to the infinite chain, coherentism (BonJour, Lehrer) to the circle, and 'positism' (from Wittgenstein's On Certainty and Ortega y Gasset) to chains ending in posits. It gives an objection, such as the swapped-coherent-system objection to coherentism or the charge that positism makes 'a doxastic necessity into an epistemic virtue'. Credit noting Comesaña and Klein's warning that Pyrrhonists do not themselves assert the argument, the name Münchhausen trilemma (Albert, 1968), Chisholm's 'problem of the criterion', mixed views such as Haack's foundherentism, and Nāgārjuna's parallel argument about the means of knowledge.", "id": "q5"},
    {"type": "open", "prompt": "Set out the closure argument for scepticism about the external world. Then compare two answers to it, for example Dretske and Nozick's denial of closure and DeRose's contextualism, giving an objection to each.", "rubric": "A strong answer states the closure principle (if one knows P and knows that P entails Q, one knows Q) and the argument: I do not know I am not a brain in a vat; if I know I have hands I know I am not a (handless) brain in a vat; so I do not know I have hands. It explains Dretske's zebra case and Nozick's sensitivity condition, which make closure fail, with the objection of DeRose's 'abominable conjunction', Vogel's lemonade counterexample to sensitivity, and the reply that the oddness can be explained away. It explains contextualism as a thesis about the word 'know' whose standards rise when sceptical hypotheses are mentioned (DeRose's Rule of Sensitivity, the bank cases, Lewis's 'Examine it, and straightway it vanishes'), keeping closure within each context, with objections: it changes the subject to knowledge-sentences (Feldman, Conee), Schiffer's 'bamboozled' objection to its error theory, and odd consequences. Credit mention of Pritchard's three-claim paradox, Moore's or the neo-Moorean (safety) answer, Wittgenstein's hinges, or the new sceptics' complaint that externalist answers are not what we wanted.", "id": "q6"}
  ]$scepticism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/scepticism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
