-- What Makes Science Science? Method and Demarcation — canonical master article, co-written and human-reviewed.
-- philosophy/science-and-language/scientific-method @ research/advanced/read.
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
    'philosophy/science-and-language/scientific-method',
    'research',
    'advanced',
    'read',
    $method_master$> **What, if anything, makes a belief scientific, and how can we tell science from its imitations?** This chapter starts with Francis Bacon's plan for a new logic of discovery and the testing practices of Ibn al-Haytham and others, then asks how evidence confirms a hypothesis. At its centre is Karl Popper's proposal that science is marked by falsifiability, set out step by step with the objection from Pierre Duhem and Quine, Popper's reply, and the counter-replies of Imre Lakatos and Larry Laudan. It ends with what philosophers now say about pseudoscience, and with hard cases: the 1919 eclipse, Lysenko's biology, creationism in American courts, climate denial and alternative medicine.

## Is There a Scientific Method?

Ask what makes physics more trustworthy than astrology and many people will say "the scientific method", as if there were one recipe: observe, guess, test, repeat. Philosophers have found it hard to say what the recipe is, whether there is only one, and whether it is what separates science from everything else.

Two questions run through this chapter. The first is about **method**: how can evidence support a general theory when we only ever observe particular cases? The second is the **demarcation problem**: the request for a criterion that marks off science from what is not science. Karl Popper introduced the German term for it, *Abgrenzungsproblem*, in 1933. At first he meant the line between empirical science and "metaphysical" systems, and in *Logik der Forschung* (1935) also mathematics and logic; only in a lecture given in 1953 and published in 1957 did he describe his lifelong question as how to "distinguish between science and pseudo-science". Bartley stressed in 1968 that these are different problems.

Sven Ove Hansson adds a caution in the Stanford Encyclopedia of Philosophy (SEP): careful fact-finding is not confined to science. Journalists, detectives and mechanics test claims against evidence, and so do the traditional agricultural experimenters and animal trackers of indigenous societies.

## Bacon's New Logic

The most famous attempt to write a method down came from Francis Bacon (1561–1626), the lawyer who rose to be lord chancellor before Parliament impeached him for taking bribes in 1621. He planned a "Great Instauration", a renewal of all knowledge in six parts. Its second part, published in 1620, was the *Novum Organum* ("New Organon"), two books of Latin aphorisms whose title answers Aristotle's logical works, the *Organon*. Neither book nor plan was ever finished.

{{image: Novum Organum | The engraved title page of Bacon's *Novum Organum*, showing a ship passing between the Pillars of Hercules.}}

Bacon began with the obstacles. Experiments help the deceitful senses, because "the sense judges only the experiment whereas the experiment judges the thing". Deeper are the **idols**, habits of mind that distort inquiry. The Idols of the Tribe are rooted in human nature, which Bacon compared to "an enchanted glass"; the Idols of the Cave belong to the individual, shaped by education and circumstance; the Idols of the Market are imposed by words, "the greatest nuisance" of all; the Idols of the Theatre are the dogmas of philosophical systems. The first two are built into us, the last two are social.

His image for the right method is famous. The empirics are like "the ant", only storing up and using things; the dogmatists are like "spiders", spinning webs from their own entrails; the true philosopher is like "the bee", gathering material from flowers in order "to convert and digest it". Induction by simply listing agreeing cases he dismissed as "a childish thing". He proposed instead what is usually called **eliminative induction**: draw up a table of presence (every known case of, say, heat), a table of absence (cases where heat would be expected but is missing) and a table of degrees (where it varies), then strike out candidate explanations. The sun's rays are hot, but the moon's give light without heat, so light cannot be the essence of heat. What survives the exclusions, Bacon promised, will be "affirmative, solid, and both true and well defined".

Knowledge, for Bacon, was for use: "human knowledge and human power come to the same thing". It was also to be collaborative, and the founding of the Royal Society in 1660 marked the peak of his reputation. Mill later criticised Baconians for neglecting what scientists actually do. Popper rejected its starting point: observation is always selective and shaped by theory, so science starts from problems, not from a neutral heap of observations.

## Before and Beyond Bacon

Bacon did not invent testing. Medieval Latin writers such as Robert Grosseteste, Albertus Magnus, Roger Bacon and William of Ockham had written on observation and induction. The SEP's own survey of scientific method runs from Aristotle to Mill and mentions no one outside Europe, an omission worth noticing.

Ibn al-Haytham (c. 965–c. 1040), known in Latin as Alhazen, born in Basra and active in Cairo, relied systematically on testing, *iʿtibār*, a word his Latin translators rendered as *experimentatio*. Among his experiments were studies of light entering a darkened room through small holes, used to show that light travels in straight lines. (His theory of vision is described in *Perception and the External World*.) In his *Doubts Concerning Ptolemy* (1025–28) he criticised contradictions in Ptolemy's works, aiming to repair the system rather than replace it.

```quote
the seeker after the truth is not one who studies the writings of the ancients and, following his natural disposition, puts his trust in them, but rather the one who suspects his faith in them and questions what he gathers from them, the one who submits to argument and demonstration
Ibn al-Haytham · Doubts Concerning Ptolemy, translated by A. I. Sabra · 1025–28
```

Was he "the first scientist"? Jim Al-Khalili called him "the first true scientist" in 2009, and Matthias Schramm (1963) held that he was the first to vary experimental conditions systematically. Others urge caution. G. J. Toomer, reviewing Schramm, accepted him as a major figure in creating experimental techniques but warned against reading his texts anachronistically; and Elaheh Kheirandish (2009) has found traces of "experiment" in Arabic optics before him. The title is a claim in a live debate, not a settled fact.

In Song China, the official and polymath Shen Kuo (1031–1095), in his *Dream Pool Essays* (1088), gave the first description of the magnetic-needle compass and of magnetic declination, and reasoned from marine fossils far inland to the slow formation of land. Joseph Needham asked why China, after long leadership, did not produce the Scientific Revolution; his collaborator Nathan Sivin replied (1982) that the counterfactual has no useful answer. Indian theories of inference, and Avicenna on experience, are treated in *Induction, Probability and Inference to the Best Explanation*.

## Testing Hypotheses

In the nineteenth century the canonical debate on method set William Whewell, with his "consilience of inductions", against Mill's inductivism and his methods of agreement and difference. An approach Whewell is often taken to have anticipated, best known from Hempel's account in *Philosophy of Natural Science* (1966), is called **hypothetico-deductivism**: propose a hypothesis, deduce from it, together with auxiliary assumptions, "test implications", and check them. Hempel's illustration was Semmelweis's work on childbed fever. A failed implication refutes the hypothesis; a successful one supports it without proving it.

This simple picture has a famous bug, the **tacking paradox**. If a hypothesis *h* entails evidence *e*, so does "*h* and *c*" for any irrelevant *c*, so *e* would equally confirm "Einstein's theory is true and the moon is made of cheese". Hempel's ravens and Goodman's "grue", the other classic puzzles, are set out in the chapter on induction.

Many philosophers now treat confirmation in **Bayesian** terms (Bayes's theorem is explained in that chapter): evidence confirms a hypothesis if it raises the hypothesis's probability. One result matters here. If a hypothesis entails evidence that was not certain beforehand, the evidence confirms it, and the more surprising the evidence, the stronger the confirmation; evidence already certain confirms nothing. On a common reading, this gives a Bayesian rationale for Popper's love of risky predictions. It also creates the **problem of old evidence**, raised by Zahar (1973) and made famous by Glymour (1980): the anomaly in Mercury's orbit had long been known, yet seemed to support general relativity strongly. One reply draws on Einstein's emphasis that he derived the result without positing any special auxiliary hypotheses.

## Popper's Asymmetry

*Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine* tells Popper's story; here the focus is demarcation. In that 1953 lecture Popper recalled being thrilled by Eddington's eclipse observations of 1919, the first important confirmation of Einstein's theory of gravitation. Einstein's theory predicted a bending of starlight by the Sun about twice what a Newtonian calculation gave, so it could have failed. Freud's and Adler's theories seemed different. When Popper reported a case to Adler, Adler analysed it in terms of feelings of inferiority without having seen the child, and, asked how he could be sure, appealed to his thousandfold experience; with this case, Popper replied, it had presumably become a thousand-and-one-fold. A theory that fits everything, Popper concluded, is weak, not strong; real support comes only from genuine tests, for which "criteria of refutation have to be laid down beforehand".

The argument can be set out step by step:

1. Scientific laws are universal statements, and every universal statement is a prohibition: "All As are X" says the same as "No A is not-X". The conservation of energy can be put as "There is no perpetual motion machine".
2. No finite set of particular observations entails a universal statement, so a law can never be verified (Hume's point about induction).
3. But one true **basic statement**, a particular, publicly checkable report such as "there is an A that is not X, here", contradicts the law, which is then refuted by *modus tollens* (if a law implies something false, the law is false). Universal statements, as Popper put it, "are never derivable from singular statements, but can be contradicted by singular statements."
4. So what lets a theory clash with experience is **falsifiability**, being logically incompatible with some possible basic statement, not verifiability.
5. Therefore a theory compatible with every possible observation, or kept compatible by rescue after each failure, forbids nothing and is not empirical science; a theory that risks refutation, as Einstein's did, is.

Popper's sorting followed: physics and chemistry were sciences, psychoanalysis a pre-science, astrology and phrenology pseudosciences. Marxism had been scientific at first, but when its predictions failed it was "immunized" against refutation. Popper was no positivist, though: unscientific ideas can be enlightening, and "what was a metaphysical idea yesterday can become a testable scientific theory tomorrow". Adolf Grünbaum (1979, 1984) disputed his reading of Freud: psychoanalysis is testable, he argued, and has fared badly.

## The Objection: Duhem's Problem

The strongest objection attacks step 3. It comes from the French physicist and historian of science Pierre Duhem (1861–1916).

```quote
the physicist can never subject an isolated hypothesis to experimental test, but only a whole group of hypotheses
Pierre Duhem · The Aim and Structure of Physical Theory, translated by Philip P. Wiener (1954) from the second edition (1914) · first published 1906
```

A failed prediction, Duhem went on, shows only that one hypothesis in the group must go; "the experiment does not designate which one should be changed." So there is no "crucial experiment". Foucault's finding that light travels more slowly in water than in air was taken to refute the theory that light is a stream of particles, but strictly it condemned only the whole package of assumptions behind it. Quine generalised the point in 1951 to all of science. The result, **Duhem–Quine underdetermination**, says that evidence alone does not dictate which part of a theory to revise.

History shows the problem is real. When Uranus strayed from its predicted orbit, astronomers did not abandon Newton; they blamed the auxiliary assumption that there were only seven planets. Adams and Le Verrier calculated where an unseen planet must be, and Neptune was found in 1846. When Mercury's orbit misbehaved, the same move was tried with a hypothetical planet, "Vulcan", and failed; only general relativity explained the anomaly. Logic did not say in advance which case was which. If any theory can be saved by adjusting the rest, falsifiability seems to draw no clean line.

## Popper's Reply: Independent or Ad Hoc

Popper answered that falsifiability is a feature of a theory's logical form joined to a **methodological rule**. Rescuing a theory with an auxiliary hypothesis is legitimate when the new hypothesis is **independently testable**: the Neptune hypothesis predicted where a planet would be seen, and could have failed. A rescue is illegitimate when it is ***ad hoc***, made only to save the theory and yielding no new testable predictions; that, he held, is what Marxism's defenders did, breaking "the methodological rule that we must accept falsification".

He also separated the logic of falsification, where one counter-instance suffices, from its methodology, where a single conflicting result is never enough and a scientist rightly keeps a theory until a better one is available. Even basic statements are accepted by a decision, like a jury's verdict, and stay open to revision:

"The piles are driven down from above into the swamp, but not down to any natural or 'given' base; and if we stop driving the piles deeper, it is not because we have reached firm ground. We simply stop when we are satisfied that the piles are firm enough to carry the structure, at least for the time being."

Falsificationism, on this reading, says how science *ought* to proceed, not how every scientist behaves.

## Counter-Replies: Lakatos and Laudan

The Hungarian-born Imre Lakatos (1922–1974) drew a different moral. As Stephen Thornton's SEP entry puts Lakatos's point, had Galle not found Neptune nobody would have abandoned Newton; the failure would have been blamed on the atmosphere or a hidden asteroid belt. Every great theory lives among anomalies: "All theories, in this sense, are born refuted and die refuted." So what should be judged is a **research programme**, a hard core protected by a belt of auxiliary hypotheses, over time. A programme is **progressive** if its successive versions predict novel facts and some are confirmed, as when Halley's comet returned as predicted; it is **degenerating** if it does not, and degenerating programmes count as pseudoscientific. Popper's line between independent and ad hoc rescues thus becomes a judgement about a whole history, not a one-shot logical test. Lakatos found Popper's criterion "a rather stunning one": a theory could be scientific with not a shred of evidence in its favour.

Thomas Kuhn's rival criterion was puzzle-solving within a tradition: astrology, on his view, has never been a science, because its failures "did not give rise to research puzzles" (see *Revolutions and Realism: Kuhn and After*).

The sharpest counter-reply came from the American philosopher Larry Laudan (1941–2022). In "The Demise of the Demarcation Problem" (1983) he argued that falsifiability is too lax: it "has the untoward consequence of countenancing as 'scientific' every crank claim which makes ascertainably false assertions". Most pseudosciences, critics note, are not unfalsifiable at all. Astrology has been tested and has failed: in a double-blind study by Carlson in *Nature* (1985), with committees of scientists and of astrologers involved, natal astrology did no better than chance. For Laudan the history of failed criteria showed that the real question is which beliefs are well founded; words like "pseudoscience" are "hollow phrases which do only emotive work for us". He also argued (1990) that the significance of underdetermination has been greatly exaggerated: that someone *can* cling to a theory come what may is a psychological fact; that it is always *rational* to do so has never been shown.

```checkpoint
q: In Popper's argument, why can a scientific law be refuted but never verified?
a*: Because no finite number of particular observations entails a universal statement, but one true particular observation can contradict it.
a: Because laws describe only things that cannot be observed.
x: Popper's basic statements are observable, publicly checkable reports; that is what lets them test laws.
a: Because every observation is mistaken.
x: Popper held that observations are fallible and accepted by decision, not that they are always wrong.
a: Because scientists agree in advance never to give up a law.
x: That is closer to protecting a research programme's hard core; Popper's rule was that falsification must be accepted.
hint: Think about the logical form of "All As are X".
why: This is the asymmetry. A universal claim goes beyond every finite set of instances, but one counter-instance contradicts it by modus tollens, so falsifiability, not verifiability, is what lets theories clash with experience.
---
q: How did Popper answer the objection that any theory can be saved by changing an auxiliary hypothesis?
a: He accepted it and abandoned falsifiability.
x: He kept falsifiability, adding a methodological rule about auxiliaries.
a: He argued that good science never needs auxiliary hypotheses.
x: He accepted that theories are tested with auxiliaries; the Neptune hypothesis was a legitimate one.
a*: A rescue is legitimate when the new auxiliary is independently testable, as the Neptune hypothesis was, and illegitimate when it is ad hoc.
a: He said that only experiments repeated a thousand times count.
x: He did require reproducible effects for falsification, but that is not his answer to Duhem's problem.
hint: What did the hypothesis of an unseen planet predict?
why: Neptune's predicted position could have been wrong; an ad hoc rescue risks nothing. Lakatos replied that applying this distinction means judging whole research programmes over time.
```

## The Revival of Demarcation

Laudan's essay was widely read as a death certificate, and work on demarcation waned. It revived with *Philosophy of Pseudoscience* (2013), edited by Massimo Pigliucci and Maarten Boudry, which opens with Pigliucci's "belated response" to Laudan. Most participants now agree that no single criterion will do. Dupré suggested that science is a **family-resemblance** concept, whose members share overlapping features rather than one essence; Schindler objects that resemblances cannot settle membership without a prior view of which features matter. Lists of criteria have multiplied (one survey gathered 70 from 21 lists). Boudry suggests dropping "demarcation" while keeping the diagnosis: there are comparatively few ways to fake epistemic warrant, and they look alike across fields.

Hansson's definition shifts the emphasis from method to pretence. Something is **pseudoscientific** if it is not scientific and is part of a non-scientific doctrine whose major proponents try to create the impression that it is scientific; it conflicts with the most reliable knowledge currently available. An honest scientist's error is **bad science**, not pseudoscience, because no deviant doctrine is being promoted. The label is also time-bound: Newton's gravitation was excellent nineteenth-century science, but insisting on it today, except as an approximation, would be pseudoscientific. The word has always been an insult; its oldest known English use, in 1796, called alchemy "a fantastical pseudo-science".

Hansson distinguishes two forms. **Pseudo-theory promotion** pushes a theory of its own, such as homeopathy or astrology, and claims to fit mainstream science. **Science denial** attacks an established finding and manufactures false controversies: relativity deniers in the 1930s, tobacco-industry-sponsored denial of disease, climate denial. Creationism mixes both, though today it is mainly denial. What makes pseudoscience worth naming is its defence mechanisms: a palaeontologist who misidentifies a bone will be persuaded by colleagues, while a creationist who believes humans lived alongside *Tyrannosaurus rex* has strategies to make that belief immune to evidence. Hansson notes a paradox: near-unanimity on the cases, from astrology and dowsing to Holocaust denial, with controversy mainly over psychodynamic theories, yet almost complete disagreement on general criteria.

## Hard Cases

**The 1919 eclipse.** The test Popper admired was itself contested. Eddington's expedition on Príncipe and Andrew Crommelin and C. R. Davidson's at Sobral in Brazil photographed stars near the Sun during the eclipse of 29 May 1919; general relativity predicted about twice the Newtonian-based deflection. At Sobral the main telescope's blurred images, which gave values nearer the Newtonian figure, were discarded in favour of a small backup instrument. Earman and Glymour (1980) argued that this suggested bias, a charge popularised by Collins and Pinch in *The Golem* (1993). Daniel Kennefick replies that the decision was defensible and not Eddington's, since the Astronomer Royal Frank Dyson's team analysed the Sobral plates, and that a 1979 re-measurement supported the result; Schindler (2013) disputes Kennefick's defence. Either way, the lesson is Duhem's: even a "crucial" test depended on judgements about instruments.

**Lysenko's biology.** From 1928 Trofim Lysenko rejected Mendelian genetics and promoted "vernalization", treating wheat seeds with moisture and cold, and the inheritance of acquired characteristics, while Soviet propaganda trumpeted faked results. The geneticist Nikolai Vavilov was arrested in 1940 and died in prison in 1943. In 1948 an academy session approved by Stalin declared Lysenko's doctrine "the only correct theory"; thousands of biologists lost their posts or their freedom, and the ban on criticism lasted until the mid-1960s. Here state power, not open criticism among peers, decided a scientific question; Lakatos treated such episodes as "external" to the rational history of science.

**Creationism in court.** In *McLean v. Arkansas* (1982), Judge William Overton struck down a law requiring "balanced treatment" for creation science. A witness against the law, the philosopher Michael Ruse, whose testimony shaped Overton's five marks of science: guided by natural law, explanatory by reference to it, testable, tentative and falsifiable. Laudan (1982) objected that it would have been more cogent to show that creation science is bad, false science, since its claims are testable and have failed. Ruse replied that the US Constitution bars teaching non-science that is religion by another name, not false science, and that falsifiability, however "rough and ready", is "good enough for the job at hand, and in law that is what counts". The SEP's account of this dispute is by Ruse himself, a participant. In *Kitzmiller v. Dover* (2005), Judge John E. Jones III ruled that intelligent design "is not science", partly because it invokes supernatural causation.

```checkpoint
q: What is the difference between bad science and pseudoscience on Hansson's account?
a: Bad science is any science that turns out to be false.
x: Hansson's definition turns on promoting a doctrine, not on falsity; Newton's gravitation was good science in its day.
a*: Pseudoscience belongs to a non-scientific doctrine whose proponents try to make it look scientific; an honest scientist's error is bad science.
a: Pseudoscience is any claim that cannot be tested.
x: That is a strict Popperian test; Hansson notes that astrology, for example, has been tested and failed.
a: There is no difference; both are simply mistakes.
x: Hansson separates a one-off error, which is bad science, from sustained promotion of a rejected claim, which is pseudoscience.
hint: Think of the palaeontologist who misidentifies a bone and accepts correction.
why: The mark is a deviant doctrine with a pretence of scientific standing, often protected by immunising strategies. Mistakes made while trying to do science properly are bad science.
---
q: What was Laudan's objection to the McLean ruling?
a: That creation science is in fact good science.
x: Laudan thought creationism false; his complaint was about the reason the court gave.
a: That courts should never decide cases involving science.
x: His concern was the demarcation criteria the judge adopted, not the court's right to rule.
a: That falsifiability was too strict a test for the court to use.
x: Laudan's worry was the opposite: falsifiability counts crank claims as scientific when they are falsifiable.
a*: That it would have been more cogent to show creation science is false science, since its claims are testable and have failed.
hint: Recall Laudan's view of whether pseudosciences are unfalsifiable.
why: Laudan held that creationist claims had been tested and refuted. Ruse replied that the Constitution bars non-science that is religion by another name, so "not science" was the right legal question.
```

## Denial, Dissent and Alternative Medicine

Live controversies need dates: what follows is the position as of November 2026. The Intergovernmental Panel on Climate Change stated in 2021 that "It is unequivocal that human influence has warmed the atmosphere, ocean and land." A 2013 survey found 97 per cent of research abstracts taking a position endorsed human-caused warming, and a 2021 study estimated over 99 per cent of papers from 2012 to 2020. Hansson, in his 2025 revision of the SEP entry, says the consensus "leaves no room for reasonable doubt". Fairness still needs a distinction: rejecting the basic finding with the tactics of denial (Diethelm and McKee list conspiracy theories, cherry-picking, fake experts, moving the goalposts and other fallacies) is one thing; genuine scientific disagreement about magnitudes and impacts is the normal stuff of research. Choices of policy, finally, involve values that science alone does not settle.

"Alternative medicine" is not one thing, and judgement can be made claim by claim; Hansson notes that the label is applied both to whole doctrines (homeopathy) and to specific claims (that the MMR vaccine causes autism). Homeopathy, devised by Samuel Hahnemann in 1796, is the standard case: Australia's National Health and Medical Research Council found in 2015 no condition for which there is reliable evidence that it works, a 2005 *Lancet* meta-analysis found the results compatible with placebo effects, and NHS England stopped funding it in 2017. Proponents posit an as yet undefined biophysical mechanism, but none is consistent with established chemistry and physics. Yet some traditional remedies have been tested and adopted, which is the point: testing, not origin, decides.

Popper's single test did not survive as a definition, but its core did. Taking risks with evidence, accepting refutation and refusing ad hoc rescue still mark the difference between inquiry and its imitations. Haack's reported advice is a fitting close: rather than stamp a claim "pseudoscientific", say exactly what is wrong with it.

## Further exploration

- **Massimo Pigliucci and Maarten Boudry (eds.), *Philosophy of Pseudoscience: Reconsidering the Demarcation Problem* (2013).** The collection that revived the demarcation debate thirty years after Laudan.
- **Massimo Pigliucci, *Nonsense on Stilts: How to Tell Science from Bunk* (2010).** Accessible case studies on science, near-science and pseudoscience.
- **Samir Okasha, *Philosophy of Science: A Very Short Introduction* (2002).** A brief introduction to induction, falsification, explanation and realism.
- **Peter Godfrey-Smith, *Theory and Reality: An Introduction to the Philosophy of Science* (2003).** The standard textbook from the positivists through Popper, Kuhn and Bayesianism.
- **Michael D. Gordin, *On the Fringe: Where Science Meets Pseudoscience* (2021).** A historian's short account of the fringe, including Lysenkoism.
- **Naomi Oreskes and Erik M. Conway, *Merchants of Doubt: How a Handful of Scientists Obscured the Truth on Issues from Tobacco Smoke to Global Warming* (2010).** A history of manufactured doubt.
- **Daniel Kennefick, *No Shadow of a Doubt: The 1919 Eclipse That Confirmed Einstein's Theory of Relativity* (2019).** The eclipse expeditions and the dispute over their data.$method_master$,
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
  select $method_quiz$[
    {"type": "mcq", "prompt": "What is the point of Bacon's tables of presence, absence and degrees?", "options": ["To exclude candidate explanations until a well-defined form remains", "To list as many agreeing cases as possible and generalise from them", "To record the predictions of a bold conjecture before testing it", "To calculate the probability of a hypothesis given the evidence"], "answerIndex": 0, "explanation": "Bacon's induction is eliminative: the moon's rays give light without heat, so light can be excluded as the form of heat. He dismissed induction by simple enumeration as \"a childish thing\".", "id": "q1"},
    {"type": "mcq", "prompt": "What does the Uranus–Neptune and Mercury–Vulcan contrast show about testing theories?", "options": ["That Newton's theory was refuted by the discovery of Neptune", "That a single observation always settles which hypothesis is false", "That logic alone does not say whether to blame the main theory or an auxiliary assumption", "That planets cannot be studied scientifically"], "answerIndex": 2, "explanation": "Blaming an auxiliary assumption saved Newton's theory when Neptune was found in 1846, but the same move failed for Mercury, whose anomaly only general relativity explained. This is Duhem's point: an experiment does not designate which hypothesis to change.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did Laudan argue that falsifiability is too lax a criterion of science?", "options": ["Because no theory can ever be falsified", "Because it excludes all of physics", "Because it was designed only for mathematics", "Because it counts as scientific every crank claim that makes ascertainably false assertions"], "answerIndex": 3, "explanation": "Laudan (1983) noted that many pseudosciences make testable claims that have been tested and have failed; astrology, for example, later failed Carlson's 1985 double-blind test. Falsifiable, on his view, does not mean scientific.", "id": "q3"},
    {"type": "mcq", "prompt": "On Lakatos's account, what makes a research programme pseudoscientific?", "options": ["Having any anomalies at all", "Degenerating: failing to predict novel facts that are then confirmed", "Protecting a hard core with auxiliary hypotheses", "Being unpopular among scientists"], "answerIndex": 1, "explanation": "For Lakatos all theories are \"born refuted and die refuted\", and every programme has a protected hard core. A progressive programme predicts novel facts, some of which are confirmed; a degenerating one does not.", "id": "q4"},
    {"type": "open", "prompt": "Set out Popper's argument from the asymmetry between verification and falsification, then explain the Duhem–Quine objection and how Popper replied to it.", "rubric": "A strong answer states that laws are universal statements (prohibitions), that no finite set of observations verifies them, but a single accepted basic statement can contradict them by modus tollens, so falsifiability marks empirical science. It explains Duhem's point that hypotheses are tested only in groups, so a failed prediction does not say which to drop (Uranus/Neptune vs Mercury/Vulcan), and gives Popper's reply: auxiliary hypotheses are legitimate if independently testable, illegitimate if ad hoc, with falsification as a methodological rule. Better answers add Lakatos's or Laudan's counter-reply.", "id": "q5"},
    {"type": "open", "prompt": "Using Hansson's account of pseudoscience, explain how you would distinguish science denial from genuine scientific disagreement, with reference to one case from the chapter (for example climate science, creationism or homeopathy).", "rubric": "A strong answer gives Hansson's definition (a non-scientific doctrine whose proponents try to make it seem scientific, at odds with the most reliable available knowledge), distinguishes bad science from pseudoscience and pseudo-theory promotion from denial, and notes denial's tactics (manufactured controversy, cherry-picking, fake experts, moving goalposts) and immunising strategies. It separates rejecting a basic finding, such as the IPCC's statement on human influence, from disagreement over magnitudes, impacts or policy values, and judges alternative medicine claim by claim. Better answers note the debate over criteria (Laudan, Pigliucci, Boudry) and date current claims.", "id": "q6"}
  ]$method_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/science-and-language/scientific-method', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
