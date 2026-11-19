-- Science and Language — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/science-and-language @ research/advanced/read.
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
    'philosophy/science-and-language',
    'research',
    'advanced',
    'read',
    $sciov_master$> **Science and Language, on this overview's gloss, asks why we should trust science and how words manage to mean anything at all.** This overview shows how the section's four chapters fit together: what, if anything, makes a belief scientific; whether science gets closer to the truth or only better at solving its own puzzles; how a word hooks onto a thing; and what we do with words, and whether the language we speak shapes how we think. It then follows four questions through them: whether evidence alone can settle a question; whether the bond between word and world is natural or made; how traditions beyond Europe tested claims and theorised meaning; and what happens when the words of science are asked to refer.

## What Science and Language Asks

Ask what makes physics more trustworthy than astrology, *What Makes Science Science? Method and Demarcation* observes, and many people will say "the scientific method", as if there were one recipe. The chapter's two questions are about **method**, how evidence can support a general theory when we only ever observe particular cases, and about **demarcation**, the request for a criterion that marks off science from what is not science.

*Revolutions and Realism: Kuhn and After* asks whether science gets closer to the truth, or only better at solving its own puzzles. *Meaning and Reference* asks how a word hooks onto a thing. *Language, Thought and Speech Acts* asks what we do with words, and what words do to us.

On this overview's reading, the section therefore moves from what science claims to know, through what it would take for a theory to be true, to how any words manage to be about the world, and what speakers do with them.

## How Science Works: Method and Demarcation

*What Makes Science Science? Method and Demarcation* starts with Francis Bacon, whose *Novum Organum* was published in 1620. Bacon warned against the **idols**, habits of mind that distort inquiry, and proposed what is usually called **eliminative induction**: tables of presence, absence and degrees of a quality such as heat, from which candidate explanations are struck out. The moon's rays give light without heat, so light cannot be the essence of heat. The chapter then asks how evidence confirms a hypothesis, through **hypothetico-deductivism** and the **Bayesian** view that evidence confirms a hypothesis if it raises its probability.

At its centre is Karl Popper's proposal that science is marked by **falsifiability**. Scientific laws are universal statements; no finite set of observations entails one, but a single true particular report can contradict it. Popper recalled being thrilled by Eddington's eclipse observations of 1919, because Einstein's theory could have failed, while Adler's psychology seemed to fit every case; real support, he concluded, comes only from genuine tests, for which "criteria of refutation have to be laid down beforehand". The strongest objection, the chapter argues, comes from the French physicist Pierre Duhem:

```quote
the physicist can never subject an isolated hypothesis to experimental test, but only a whole group of hypotheses
Pierre Duhem · The Aim and Structure of Physical Theory, translated by Philip P. Wiener (1954) from the second edition (1914) · first published 1906
```

Popper answered that rescuing a theory with an auxiliary hypothesis is legitimate when the new hypothesis is independently testable, as the hypothesis of an unseen planet, Neptune, was, and illegitimate when it is ***ad hoc***. Imre Lakatos replied that what should be judged is a whole **research programme** over time. Larry Laudan argued in 1983 that falsifiability is too lax: it "has the untoward consequence of countenancing as 'scientific' every crank claim which makes ascertainably false assertions". Astrology, critics note, has been tested and has failed.

Work on demarcation revived with *Philosophy of Pseudoscience* (2013), and most participants now agree that no single criterion will do. Sven Ove Hansson's definition shifts the emphasis from method to pretence: something is **pseudoscientific** if it is not scientific and belongs to a non-scientific doctrine whose major proponents try to create the impression that it is scientific. An honest scientist's error is bad science, not pseudoscience. Hansson separates **pseudo-theory promotion**, such as homeopathy or astrology, from **science denial**, which attacks an established finding and manufactures false controversies.

The chapter's hard cases include the 1919 eclipse itself, where, Earman and Glymour argued, the discarding of the main Sobral telescope's images suggested bias, a decision Daniel Kennefick defends, though Schindler disputes his defence; Lysenko's biology; and creationism in American courts. On climate, the chapter dates its claims as of November 2026: the Intergovernmental Panel on Climate Change stated in 2021 that "It is unequivocal that human influence has warmed the atmosphere, ocean and land", and Hansson, in his 2025 revision of the SEP entry, says the consensus "leaves no room for reasonable doubt". Fairness still needs a distinction: rejecting the basic finding with the tactics of denial is one thing, genuine disagreement about magnitudes and impacts the normal stuff of research. "Alternative medicine" is not one thing, and judgement can be made claim by claim. Homeopathy is the standard case: its proponents posit an as yet undefined biophysical mechanism, but none is consistent with established chemistry and physics. Yet some traditional remedies have been tested and adopted: testing, not origin, decides.

## Paradigms and Truth: Revolutions and Realism

*Revolutions and Realism: Kuhn and After* follows Thomas Kuhn's *The Structure of Scientific Revolutions* (1962). A mature science, on Kuhn's picture, alternates between **normal science**, "puzzle-solving" under a shared **paradigm** in which anomalies are ignored or explained away, and **revolution**: troublesome anomalies accumulate into a **crisis**, which may end in the replacement of the old paradigm by a new one. Rival paradigms may be **incommensurable**, "having no common measure", in three ways that Alexander Bird's SEP entry distinguishes: in their problems and standards, in what scientists observe, and in the meanings of key terms. Kuhn named five shared values for choosing between theories (accuracy, consistency, scope, simplicity and fruitfulness), but held that they do not settle choices, and he denied that progress showed nearness to the truth.

{{image: Thomas Kuhn | Thomas S. Kuhn (1922–1996), trained as a physicist, whose *The Structure of Scientific Revolutions* (1962) pictured science as alternating between normal science and revolutions.}}

Was Kuhn a relativist? In the Postscript to the 1970 edition he denied, in substance, that his position was relativist; later, accepting that evaluations are relative to a community's lexicon, he was less inclined to deny it and called it "trivial". Bird argues that "both his supporters and his detractors took his work to be more revolutionary (anti-rationalist, relativist) than it really was"; Michael Liston agrees that the radical reading was wrong, but held "with some justice given his sometimes incautious language", and adds that no realist could accept the thesis, never abandoned by Kuhn, that there is no fact of the matter whether one paradigm or its rival is correct. The chapter also weighs Ludwik Fleck's forgotten study of 1935, read in the English-speaking world mostly as an unappreciated forerunner of Kuhn and by German-speaking scholars as a highly original thinker. Lakatos set out to show that theory change can be rational after all; Paul Feyerabend replied that only the useless "anything goes" survives as an exceptionless rule of method, a line most readers take as a *reductio* of rationalism and some recent scholars as a positive pluralism.

The second half asks whether science is true. **Scientific realism**, in Anjan Chakravartty's SEP analysis, holds that there is a mind-independent world, that theories should be taken literally, and that they give us knowledge of observable things and of **unobservables**, such as electrons. Its main argument, from Putnam, is that realism "is the only philosophy that doesn't make the success of science a miracle"; its main challenge is Laudan's **pessimistic induction** from successful theories now abandoned. Bas van Fraassen's **constructive empiricism** asks only that what a theory says about observable things be true; John Worrall's **structural realism** keeps the structure that survives theory change; the **entity realism** associated with Ian Hacking and Nancy Cartwright believes in the unobservables we can manipulate; Arthur Fine's Natural Ontological Attitude rejects the whole debate.

## How Words Mean: Meaning and Reference

*Meaning and Reference* begins with two pictures of a name. On the first, **Millianism**, in the Stanford Encyclopedia of Philosophy's (SEP) summary, "a name's meaning is simply its referent"; Ruth Barcan Marcus proposed in 1961 that proper names are mere "tags". On the second, a name also carries a way of thinking about its bearer. Gottlob Frege distinguished an expression's **reference**, the thing it stands for, from its **sense**, which in Edward Zalta's SEP gloss "accounts for its cognitive significance—it is the way by which one conceives of the denotation of the term". So "the morning star is identical to the evening star" can be a discovery, while "the morning star is identical to the morning star" is trivial. Keith Donnellan objected to Russell's theory of descriptions that descriptions also have a referential use, and Kripke replied by drawing on Grice's distinction between what is said and what is meant, a link the chapter itself makes to *Language, Thought and Speech Acts*.

At the chapter's centre is Saul Kripke's **modal argument**: a name is a **rigid designator**, picking out the same thing in every possible world in which it exists, while "the teacher of Plato" is not, so a name does not mean a description. The chapter sets out the wide-scope reply of Dummett and others, Kripke's counter, which in the SEP's judgement seemed "to have persuaded most of his audience", and the reply from rigidified descriptions. Kripke's alternative was that reference is fixed at a dubbing and then borrowed along a chain of speakers. Hilary Putnam extended the lesson to natural-kind words such as "water" and "elm": "'meanings' just ain't in the head!" Tyler Burge argued that beliefs themselves depend on what lies outside the head, a view resisted by critics such as Boghossian and Fodor.

The chapter then gives full weight to the Sanskrit debates over what a word like "cow" means: this cow, or cowness? It runs from the grammarians, among them Bhartṛhari, for whom the sentence, not the word, is the given unit, to the quarrel between Mīmāṃsā and Nyāya, and Dharmakīrti's Buddhist account of reference. It ends with naming in early China, among the later Mohists and Xunzi.

## Language in Use: Language, Thought and Speech Acts

*Language, Thought and Speech Acts* begins with the later Wittgenstein's picture of language as a set of activities, and turns to J. L. Austin's **performatives**, utterances such as "I name this ship the *Queen Elizabeth*" that do not describe an act but perform one. Austin argued that the contrast between performatives and statements collapses, and distinguished the **locutionary** act of saying something, the **illocutionary** act done in saying it, and the **perlocutionary** act done by saying it. John Searle built a system of speech acts; Paul Grice explained how speakers convey more than they literally say, through **implicature** governed by a **Cooperative Principle**, a theory challenged by Wayne Davis and by the relevance theory of Deirdre Wilson and Dan Sperber.

These tools then enter a live dispute. Catharine MacKinnon argued that pornography constitutes women's subordination and silencing, and with Andrea Dworkin drafted an ordinance for Minneapolis (1983); the one Indianapolis passed in 1984 was struck down by a federal court in 1985, and the US Supreme Court summarily affirmed in 1986. Rae Langton defended MacKinnon's claims with Austin's tools: a woman whose "No" is not recognised as a refusal suffers **illocutionary disablement**, prevented from refusing, not merely from being obeyed. Ronald Dworkin objected that a right to free speech cannot include a right to "a sympathetic or even competent understanding of what one says". Hornsby, Langton and West replied that valuable free speech requires the absence of *systematic* barriers to uptake. Many critics remain unpersuaded, and the chapter calls the debate open.

The chapter then asks whether language shapes thought. Benjamin Lee Whorf held that "We dissect nature along lines laid down by our native languages", but two famous examples, Hopi time and the "Eskimo words for snow", mix evidence and myth, and experiments have found real but modest effects; the SEP's summary is that neo-Whorfian claims "are much more modest than Whorf's original thesis". Against strong relativity stands Noam Chomsky's argument from the **poverty of the stimulus**, that children's limited data require a language-specific innate endowment. As of November 2026, some argue that large language models are a "possibility proof" that grammar can be extracted from data; replies note that children hear roughly 2 to 7 million words a year while recent models train on "tens of trillions of tokens", and the evidence on whether models prefer humanly possible languages is itself divided.

```checkpoint
q: How does Hansson distinguish pseudo-theory promotion from science denial, as What Makes Science Science? Method and Demarcation reports?
a*: Promotion pushes a theory of its own, such as homeopathy or astrology; denial attacks an established finding and manufactures false controversies.
a: Promotion is honest error by working scientists; denial is deliberate fraud.
x: For Hansson an honest scientist's error is bad science, not pseudoscience of either form.
a: Promotion concerns medicine only; denial concerns physics only.
x: Hansson's examples of denial include tobacco-industry-sponsored denial of disease and climate denial, and of promotion astrology as well as homeopathy.
a: Promotion is unfalsifiable; denial is falsifiable.
x: Hansson's account turns on pretence and defence mechanisms, not on falsifiability; astrology has been tested and has failed.
hint: Ask whether the doctrine is offering a theory of its own or attacking someone else's.
why: Both are pseudoscience on Hansson's definition, because their proponents try to create the impression that a non-scientific doctrine is scientific. Creationism mixes both, though today it is mainly denial.
---
q: Why, according to Kuhn, do his five shared values (accuracy, consistency, scope, simplicity and fruitfulness) not settle a choice between theories?
a: Because scientists do not really hold them.
x: Kuhn said the values belong to science; the problem lies in applying them.
a: Because they apply only to normal science, never to revolutions.
x: Kuhn offered them precisely as values for choosing between theories.
a*: Because they are imprecise, can be applied differently and can conflict, which lets rational scientists disagree.
a: Because truth is the only value that matters, and it cannot be measured.
x: Kuhn denied that progress showed nearness to the truth, and by 1970 denied that "nearness to the truth" makes sense.
hint: Think of two careful scientists who weigh simplicity and accuracy differently.
why: Kuhn argued that this leaves room for reasonable disagreement and spreads the risk of backing a novelty, while science still progresses in puzzle-solving power.
```

## Questions That Run Through the Section

### Can evidence settle the question?

On this overview's reading, one theme runs through both science chapters and reappears in the language half: the gap between evidence and conclusion. Duhem's point is that a failed prediction shows only that one hypothesis in the group must go; "the experiment does not designate which one should be changed." *What Makes Science Science? Method and Demarcation* shows that history makes the problem real. When Uranus strayed from its predicted orbit, astronomers blamed an auxiliary assumption, and Neptune was found in 1846; when Mercury's orbit misbehaved, the same move with a hypothetical planet, "Vulcan", failed. Logic did not say in advance which case was which. Popper answered with a methodological rule and Lakatos with the appraisal of whole programmes, while Laudan argued in 1990 that the significance of underdetermination has been greatly exaggerated.

*Revolutions and Realism: Kuhn and After* takes the gap further. For Kuhn, no rules decide how significant an anomaly is, so the choice between paradigms is "not rationally compelled"; he did not mean that argument is unimportant, only that it is insufficient. And Kyle Stanford's **problem of unconceived alternatives** is, the chapter says, a historical form of the worry that evidence fails to settle which of several rival theories is true.

The gap also lets values in. Rudner argued in 1953 that since no hypothesis is ever completely verified, how much evidence is enough depends on the importance, "in the typically ethical sense, of making a mistake". Heather Douglas allowed values an **indirect** role in deciding how much evidence is enough, but not a **direct** role as reasons in themselves; critics doubt the line is clear-cut. Hugh Lacey, Ernan McMullin and Sandra Mitchell defend versions of the **value-free ideal**, which the SEP describes as, for its defenders, a necessary antidote to individual and institutional interests; Helen Longino, Philip Kitcher and Douglas reject or reformulate it. Whether feminist critics' cases show that values belong inside science, or only that biased science can be corrected by better science, is, the chapter concludes, part of what still divides them from the ideal's defenders.

This overview notes two places where the chapters touch without drawing the connection themselves. *What Makes Science Science?* ends its climate discussion by observing that choices of policy involve values that science alone does not settle; the inductive-risk argument in *Revolutions and Realism* asks whether values also enter earlier, in deciding how much evidence is enough. And Lysenko's biology appears in both chapters, in different roles: in the first as a case where state power, not open criticism among peers, decided a scientific question, in the second as one of the episodes to which defenders of the value-free ideal can point.

On this overview's reading, Chomsky's poverty-of-the-stimulus argument in *Language, Thought and Speech Acts* poses a version of the same gap for a child learning a language. A rule "move the first auxiliary verb" fits the simple data, but children do not try it; the correct rule depends on sentence structure. The dispute, as the chapter presents it, is over whether children ever hear the cases that decide between the two: Geoffrey Pullum and Barbara Scholz found questions of the decisive kind in a corpus of speech to children, and Legate and Yang replied that they make up about 0.05 per cent of the corpus.

### Natural or made: the bond between word and world

*Meaning and Reference* follows an old quarrel. Mīmāṃsā, which needed an authorless Veda, held that meanings are natural, not conventional, and that words themselves are eternal. Nyāya answered with a short argument: if the word–object relation were natural, a word would carry its object's powers, but saying *agni* ("fire") does not burn the mouth; so the relation is a convention, established, Nyāya held, by God's will. Xunzi, the chapter says, took the conventional side: "Names have no inherent appropriateness. We designate them [by some word] in order to name them." The king fixes names, yet, as Goldin puts it, "you cannot make up reality"; the Internet Encyclopedia of Philosophy calls this "a modified conventionalism", though Goldin cautions that the primary concern of Xunzi's chapter on naming "is morality, not linguistics".

Causal theories locate the start of a word's use in an act of naming. For Kripke, reference is fixed at a dubbing and borrowed along a chain of speakers, though "not every sort of causal connection to previous use suffices". Dharmakīrti, on Tom Tillemans's reading, fixes reference "at the time of [establishing] the linguistic convention" by dubbing a sample, "This is blue", after which habit carries it from speaker to speaker. The chapter's own closing list sums up the range: eternal words, divine convention, causal dubbing and royal decree.

In *Language, Thought and Speech Acts* the question returns at the level of acts. Austin and Searle held that an illocution is fixed by convention; Kent Bach and Robert Harnish argue that most illocutions are identified by the hearer's inference from recognisable intentions, keeping convention for institutional acts, while Marina Sbisà defends a conventionalism. On this overview's reading, these are different questions, one about what links a word to its object and the other about what makes an utterance the act it is, but both language chapters keep asking how much is fixed by convention and how much by something else: nature, a causal chain or a speaker's intention.

### How traditions beyond Europe tested claims and theorised meaning

The chapters treat thinkers beyond Europe as working on the same questions. The SEP's own survey of scientific method, *What Makes Science Science?* notes, mentions no one outside Europe. Ibn al-Haytham, active in Cairo, relied systematically on testing, *iʿtibār*, a word his Latin translators rendered as *experimentatio*, and in his *Doubts Concerning Ptolemy* criticised contradictions in Ptolemy's works:

```quote
the seeker after the truth is not one who studies the writings of the ancients and, following his natural disposition, puts his trust in them, but rather the one who suspects his faith in them and questions what he gathers from them, the one who submits to argument and demonstration
Ibn al-Haytham · Doubts Concerning Ptolemy, translated by A. I. Sabra · 1025–28
```

Was he "the first scientist"? Jim Al-Khalili called him "the first true scientist" in 2009, and Matthias Schramm held that he was the first to vary experimental conditions systematically. G. J. Toomer warned against reading his texts anachronistically, and Elaheh Kheirandish has found traces of "experiment" in Arabic optics before him. The title, the chapter concludes, is a claim in a live debate, not a settled fact.

Joseph Needham's question appears in both science chapters. In *The Grand Titration* (1969) he asked why modern science rose "only in the West" when Chinese civilisation had been "much more efficient" in applying natural knowledge. His collaborator Nathan Sivin replied in 1982 that the counterfactual has no useful answer; Andre Gunder Frank saw residual Eurocentrism, and Arun Bala argues that Chinese, Indian, Arabic and ancient Egyptian ideas were indispensable to modern science. As of the SEP entry revised in January 2025, how civilisational differences shape scientific work had "yet to give rise to extended philosophical reflection".

On meaning, Madhav Deshpande warns in the SEP that "the modern distinction of 'sense' versus 'reference' is somewhat blurred in the Sanskrit discussions". Pāṇini argued that words cannot refer only to particulars, and Patañjali concluded that both the individual and the generic form belong to meaning. Bhartṛhari made a claim that *Language, Thought and Speech Acts* distinguishes from Whorf's: there is no cognition in the world that is not permeated by the word, a thesis about all cognition, not about differences between languages. That chapter also notes that the speaker's intention or purport (*tātparya*), which some Indian schools counted among the conditions for a sentence, may be set beside Grice, and that the comparison between early Chinese views of language and Austin is its own, not Chad Hansen's.

Dharmakīrti's account receives the closest comparison. Tillemans contrasts Dignāga's "top-down" version of *apoha*, "exclusion", with a "bottom-up" one in Dharmakīrti: "a causal chain from particular things to perceptions to thoughts and to the utterances of words—in short we have a type of causal theory of reference". He calls it "much like the two-fold process of reference-fixing and reference-borrowing" in modern causal theories, and notes that, like Putnam's, it covers kind terms. *Meaning and Reference* adds, as its own point, that Dharmakīrti therefore faces Kripke's question of which causal links count; Tillemans flags open questions of his own.

### When the words of science refer

On this overview's reading, the two halves of the section meet over reference, though the chapters do not draw the link themselves. In the no-miracles argument as *Revolutions and Realism* reconstructs it, the best explanation of science's success is that our theories are approximately true and their central terms refer to real things. Laudan's pessimistic induction attacks that step: the ether, caloric and phlogiston theories were successful, yet by current lights their central terms refer to nothing. The argument comes from Putnam, who in *Meaning and Reference* holds that experts such as chemists fix the reference of natural-kind words through a **division of linguistic labour**. Kuhn's **semantic** incommensurability concerns the same kind of word: "Newtonian mass is conserved; Einsteinian is convertible with energy". Whether a causal theory of reference helps the realist against Kuhn or Laudan is not a question the chapters take up, and this overview leaves it open.

A second resemblance, also this overview's, links Kuhn's remark that "the proponents of competing paradigms practice their trades in different worlds" with Whorf's line on dissecting nature. Both claim that a scheme of categories shapes what people see, and both, on the chapters' evidence, have been read more modestly than their boldest wording. Kuhn denied that he meant scientists construct reality, and Bird argues that he was taken to be more relativist than he was; neo-Whorfians read Whorf as concerned with the terms in which we *speak*, not the limits of thought.

```checkpoint
q: What was Ronald Dworkin's objection to Langton's argument that pornography silences women, as Language, Thought and Speech Acts presents it?
a: That pornography is not speech at all.
x: Whether pornography is a speech act at all is a separate question, raised by Saul.
a*: That a right to free speech cannot include a right to "a sympathetic or even competent understanding of what one says".
a: That illocution cannot be distinguished from perlocution.
x: Jacobson and Bird questioned that line; Dworkin's objection concerned what the right to free speech includes.
a: That women are never silenced in practice.
x: Dworkin's objection is about the scope of the right, not a denial that speakers can fail to be understood.
hint: Think of creationists and flat-earthers, who are ridiculed and misunderstood.
why: A right to be understood, Dworkin argued, would license regulation "on a massive scale". Hornsby, Langton and West replied that valuable free speech requires only the absence of systematic barriers to uptake; the chapter calls the debate open.
---
q: How did Nathan Sivin respond to Joseph Needham's question of why modern science arose only in the West?
a: He argued that China had in fact produced the Scientific Revolution first.
x: Sivin did not reverse the history; he questioned whether the question could be answered.
a: He blamed Chinese philosophy for neglecting experiment.
x: The chapters report no such claim from Sivin.
a: He agreed with Andre Gunder Frank that the question was purely Eurocentric.
x: Residual Eurocentrism was Frank's charge, a separate response.
a*: He replied that the counterfactual has no useful answer, comparing it to asking why your name did not appear on page 3 of today's newspaper.
hint: Ask whether a question about something that did not happen can have a useful answer.
why: Sivin, Needham's collaborator, replied in 1982 that the counterfactual has no useful answer; the page-3 comparison is reported in *Revolutions and Realism*. Arun Bala, revisiting Needham, argues that Chinese, Indian, Arabic and ancient Egyptian ideas were indispensable to modern science.
```

## The Chapters

- *What Makes Science Science? Method and Demarcation*: Bacon, Ibn al-Haytham, confirmation, Popper, Duhem, Lakatos and Laudan, pseudoscience and its hard cases.
- *Revolutions and Realism: Kuhn and After*: paradigms, incommensurability, Fleck, Lakatos and Feyerabend, realism, explanation and laws, values in science.
- *Meaning and Reference*: Marcus, Frege, Russell, Kripke, Putnam and Burge, the Sanskrit debates, Dharmakīrti, early China.
- *Language, Thought and Speech Acts*: Austin, Searle, Grice, silencing, Confucian and Indian views, Whorf, Chomsky and large language models.

The questions continue in *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*, *Induction, Probability and Inference to the Best Explanation*, *Analytic Philosophy since 1950* and *Minds and Machines: Could AI Think?*

## Further exploration

- **Peter Godfrey-Smith, *Theory and Reality: An Introduction to the Philosophy of Science* (2003).** The standard textbook from the positivists through Popper, Kuhn and Bayesianism.
- **Massimo Pigliucci and Maarten Boudry (eds.), *Philosophy of Pseudoscience: Reconsidering the Demarcation Problem* (2013).** The collection that revived the demarcation debate thirty years after Laudan.
- **Thomas S. Kuhn, *The Structure of Scientific Revolutions* (1962).** The primary text; the 1970 second edition adds the Postscript.
- **Heather Douglas, *Science, Policy, and the Value-Free Ideal* (2009).** The main modern case against the value-free ideal, built on inductive risk.
- **Saul A. Kripke, *Naming and Necessity* (1980; first printed 1972).** The Princeton lectures, with the 1980 Preface that answers the wide-scope reply.
- **Bimal Krishna Matilal, *The Word and the World: India's Contribution to the Study of Language* (1990).** A survey of Indian theories of language and meaning, including Bhartṛhari.
- **J. L. Austin, *How to Do Things with Words* (1962; 2nd edn 1975).** The founding text of speech-act theory.$sciov_master$,
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
  select $sciov_quiz$[
    {"type": "mcq", "prompt": "How did Popper answer the objection, drawn from Duhem, that any theory can be saved by changing an auxiliary hypothesis, as the Science and Language overview reports it from What Makes Science Science? Method and Demarcation?", "options": ["He accepted the objection and abandoned falsifiability", "A rescue is legitimate when the new auxiliary hypothesis is independently testable, as the hypothesis of an unseen planet, Neptune, was, and illegitimate when it is ad hoc", "He argued that good science never uses auxiliary hypotheses", "He held that a programme's hard core must never be blamed"], "answerIndex": 1, "explanation": "The Neptune hypothesis predicted where a planet would be seen and could have failed; an ad hoc rescue yields no new testable predictions. Never blaming the hard core is Lakatos's negative heuristic, and Lakatos replied to Popper that applying the distinction means judging whole research programmes over time.", "id": "q1"},
    {"type": "mcq", "prompt": "What does Laudan's pessimistic induction, as Revolutions and Realism: Kuhn and After presents it, claim to show?", "options": ["That successful past theories such as the ether, caloric and phlogiston theories had central terms that, by current lights, refer to nothing, so success is no reliable sign of approximate truth", "That science aims only at empirical adequacy", "That only the mathematical structure of theories survives revolutions", "That we should believe in the unobservables we can manipulate"], "answerIndex": 0, "explanation": "Laudan's argument (1981) attacks the step in the no-miracles argument from success to approximate truth and reference. Empirical adequacy is van Fraassen's constructive empiricism; surviving structure is Worrall's structural realism, offered as an escape from the pessimistic induction; manipulation is the entity realism associated with Hacking and Cartwright.", "id": "q2"},
    {"type": "mcq", "prompt": "Why, according to Meaning and Reference, did Mīmāṃsā hold that the relation between words and their meanings is natural rather than conventional?", "options": ["Because it held that God established each word's meaning by his will", "Because it held that the king fixes names", "Because it needed an authorless Veda", "Because it held that reference is fixed by dubbing a sample"], "answerIndex": 2, "explanation": "Mīmāṃsā needed an authorless Veda, so it held that meanings are natural, that words signify eternal universals, and that words themselves are eternal. Divine convention is Nyāya's answer, royal fixing of names Xunzi's, and dubbing a sample Dharmakīrti's on Tillemans's reading.", "id": "q3"},
    {"type": "mcq", "prompt": "As of November 2026, what reply to the claim that large language models refute the poverty-of-the-stimulus argument does Language, Thought and Speech Acts record?", "options": ["That the models have strong language-specific innate biases built in", "That children hear more words each year than the models are trained on", "That the BabyLM challenge has already settled the question in Chomsky's favour", "That children hear roughly 2 to 7 million words a year while recent models train on tens of trillions of tokens, so the models are poor examples against an argument about poor input"], "answerIndex": 3, "explanation": "The argument is about learning from poor input, so models trained on vastly more data are, in the replies Dupre's SEP supplement records, 'poor examples'. BabyLM results with smaller training sets are 'still preliminary', and Moro, Greco and Cappa and Kallini and colleagues disagree over whether models prefer humanly possible languages.", "id": "q4"},
    {"type": "open", "prompt": "The overview reads the gap between evidence and conclusion as a theme of the section. Trace it through Duhem, Popper, Lakatos, Laudan, Kuhn and the debate over values in science, and say whether the overview's link to Chomsky's poverty-of-the-stimulus argument holds.", "rubric": "A strong answer recognises that the theme is the overview's own reading. It explains Duhem's point that hypotheses are tested only in groups, so a failed prediction does not designate which to change, with the Uranus/Neptune and Mercury/Vulcan contrast; Popper's rule distinguishing independently testable from ad hoc rescues; Lakatos's appraisal of research programmes; and Laudan's 1990 claim that the significance of underdetermination has been greatly exaggerated. It notes Kuhn's view that paradigm choice is 'not rationally compelled' because no rules decide how significant an anomaly is, and Stanford's problem of unconceived alternatives. It explains Rudner's inductive-risk argument and Douglas's direct/indirect distinction, giving defenders of the value-free ideal (Lacey, McMullin, Mitchell) and its critics (Longino, Kitcher, Douglas) evenhandedly. On Chomsky, credit for seeing that two rules fit the simple data and that Pullum and Scholz, and Legate and Yang, dispute whether children hear the decisive cases, and for judging whether the analogy is apt.", "id": "q5"},
    {"type": "open", "prompt": "Is the bond between a word and what it means natural or made? Compare at least three answers from the section's chapters, including at least one Indian and one Chinese view.", "rubric": "A strong answer sets out Mīmāṃsā's view that meanings are natural and words eternal (because it needed an authorless Veda) against Nyāya's argument that saying agni does not burn the mouth, so the relation is a convention established by God's will; Xunzi's 'Names have no inherent appropriateness', the king's role and Goldin's caution that his concern is morality, not linguistics; Kripke's dubbing and chain of borrowing, with his point that not every causal connection suffices; and Dharmakīrti's dubbing of a sample ('This is blue') passed on by habit, as Tillemans reads him, with the chapter's caveats. Credit for bringing in Austin's conventional procedures and the dispute between conventionalists (Austin, Searle, Sbisà) and intention-based views (Bach and Harnish), while recognising, as the overview says, that these are different questions.", "id": "q6"}
  ]$sciov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/science-and-language', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
