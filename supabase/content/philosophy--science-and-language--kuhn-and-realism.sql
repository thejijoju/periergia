-- Revolutions and Realism: Kuhn and After — canonical master article, co-written and human-reviewed.
-- philosophy/science-and-language/kuhn-and-realism @ research/advanced/read.
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
    'philosophy/science-and-language/kuhn-and-realism',
    'research',
    'advanced',
    'read',
    $kuhn_master$> **Does science get closer to the truth, or only better at solving its own puzzles?** This chapter follows Thomas Kuhn's account of paradigms, normal science and revolutions, the forgotten anticipation of it by Ludwik Fleck, and the replies of Imre Lakatos and Paul Feyerabend. It then sets out the debate over scientific realism, from the no-miracles argument and the pessimistic induction to structural and entity realism, and ends with explanation, laws of nature and the place of values in science.

## A Historian Reads Aristotle

Thomas Samuel Kuhn (1922–1996), born in Cincinnati, Ohio, was trained as a physicist, taking a Harvard doctorate in physics in 1949. But he was also teaching a science course for humanities students in James B. Conant's General Education in Science programme, built around historical case studies. The decisive moment, as the Internet Encyclopedia of Philosophy (IEP) tells it, came on a summer day in 1947. Kuhn had found Aristotle's physics bewildering, until he realised he had been reading Aristotle's idea of motion through Newtonian categories. Then came a "more or less sudden" ability to understand Aristotle on his own terms, undistorted by later science.

In 1956 Harvard denied him tenure, the committee feeling that his first book, *The Copernican Revolution* (1957), was too popular in approach. At Berkeley, Stanley Cavell introduced him to Wittgenstein, and Paul Feyerabend discussed a draft of his next book with him. *The Structure of Scientific Revolutions* appeared in 1962, from the University of Chicago Press and, ironically, in the logical positivists' own series, the "International Encyclopedia of Unified Science" (an irony noted in *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*). Kuhn called his method "history for philosophical purposes".

```quote
History, if viewed as a repository for more than anecdote or chronology, could produce a decisive transformation in the image of science by which we are now possessed.
Thomas S. Kuhn · The Structure of Scientific Revolutions · 1962
```

The image he meant to transform is the one described in *What Makes Science Science? Method and Demarcation*, including Karl Popper's picture of science as bold conjecture and attempted refutation. Here Popper appears only as the foil against whom Kuhn and Lakatos defined themselves.

## Normal Science, Crisis and Revolution

On Kuhn's picture, a mature science alternates between two phases that differ in kind. Before either comes a **pre-paradigm** period of competing schools that disagree about procedures, theories and even metaphysics. Then one school's achievement is so impressive that adherents drift away from the others, and the field acquires a **paradigm**. Kuhn's examples include Ptolemy's planetary computations and Lavoisier's use of the balance.

**Normal science**, the work most scientists do most of the time, is "puzzle-solving". Like someone doing a crossword or a chess problem, the normal scientist expects a solution to exist, knows the methods, and takes failure as a reflection on her skill. The guiding theory is neither tested nor confirmed, and results that do not fit, **anomalies**, are ignored or explained away. This was the heart of Kuhn's objection to Popper, recorded in *Logical Positivism and Its Critics*: in normal science, Popper's sort of testing does not occur.

Only an accumulation of troublesome anomalies, especially ones that undermine normal practice (doubts about a widely used instrument, say), produces a widespread loss of confidence, which Kuhn called a **crisis**. A crisis may end in a **revolution**: the replacement of the old paradigm by a new one. No rules decide how significant an anomaly is, so the choice is "not rationally compelled", which leaves room for reasonable disagreement. Older scientists may never convert; younger ones often accept the new paradigm, the IEP reports, "through something like a religious conversion", trusting its future puzzle-solving. Kuhn did not mean that argument is unimportant, only that it is insufficient, and he repudiated the idea that outcomes are fixed by social or political forces. Afterwards, textbooks make the revolution "invisible", rewriting history so the current paradigm seems born mature. Something may also be lost: the new science may lack an explanation the old one had, a loss known as **Kuhn-loss**.

Kuhn compared the change in a scientist's perceptual world to a **gestalt switch**, like seeing the duck-rabbit figure first as a duck and then as a rabbit, while admitting he was unsure whether this was only an analogy. The IEP points to its limit: the viewer of the drawing can step back and know it is the same drawing, but a scientific community has "no answer sheet".

{{image: Rabbit–duck illusion | The duck-rabbit, one drawing that can be seen as either animal. Kuhn compared a change of paradigm to the switch from seeing the duck to seeing the rabbit, while doubting that it was more than an analogy.}}

He went further: "In a sense I am unable to explicate further, the proponents of competing paradigms practice their trades in different worlds." Kuhn denied that he meant scientists construct reality. Paul Hoyningen-Huene later read him in a neo-Kantian way, with a fixed world-in-itself and a changing world of appearances.

## Incommensurability and the Charge of Relativism

The most troublesome word was **incommensurable**, "having no common measure", a term that goes back to Euclid. In 1962 both Kuhn and Feyerabend applied it to successive scientific theories. Kuhn's cases included Newton against his Aristotelian and Cartesian predecessors, and Lavoisier against Priestley in chemistry.

Alexander Bird's Stanford Encyclopedia of Philosophy (SEP) entry distinguishes three kinds. Rival paradigms may set different problems and judge solutions by different standards (**methodological** incommensurability); what scientists observe may depend on their theory (**observational**); and key terms may change meaning (**semantic**). Kuhn's example: "Newtonian mass is conserved; Einsteinian is convertible with energy". So Newton's theory is not simply a special case of Einstein's. From the 1980s Kuhn recast the point in terms of taxonomy: a field sorts its objects into kinds, and one taxonomy cannot be mapped onto its successor. In Ian Hacking's summary (1993), after a revolution the individual things are the same, but scientists work in a world of new kinds.

How, then, can one paradigm be better than another? Kuhn named five shared values for choosing between theories, in an essay collected in *The Essential Tension* (1977): **accuracy, consistency, scope, simplicity and fruitfulness**. They belong to science but do not settle choices, because they are imprecise, can be applied differently and can conflict. That, Kuhn argued, lets rational scientists disagree, and spreads the risk of backing a novelty. And science does progress: a new paradigm must keep pretty well all its predecessor's power to solve quantitative problems. But Kuhn denied that this showed nearness to the truth, and by 1970 denied that "nearness to the truth" makes sense. Progress is like Darwinian evolution: science moves away from problems, not towards a fixed goal.

Dudley Shapere's 1964 review stressed the relativist implications, and charges of irrationalism and relativism followed Kuhn for the rest of his life. He thought them inaccurate. In the Postscript to the 1970 edition he denied, in substance, that his position was relativist, and presented himself as a believer in scientific progress; later he called the charge "trivial", while admitting his view looked idealist, though "an idealism like none other". In 1992 he derided sociologists for whom scientific "negotiations" turn only on interests and power, and called his own work "pretty straight internalist".

How relativist Kuhn really was remains a debate. Bird argues that he rejected both "convergent" realism and an "extreme relativism" that denies any measure of progress, and that "both his supporters and his detractors took his work to be more revolutionary (anti-rationalist, relativist) than it really was". Michael Liston, in the IEP, agrees that the radical reading was wrong, but held "with some justice given his sometimes incautious language", and adds that no realist could accept the thesis, never abandoned by Kuhn, that there is no fact of the matter whether one paradigm or its rival is correct.

## Paradigms under Scrutiny: Masterman and Fleck

The sharpest critique of the word "paradigm" came from Margaret Masterman (1910–1986), founder of the Cambridge Language Research Unit, at an international colloquium in the philosophy of science in London in 1965. She found at least twenty-one senses of "paradigm" in *Structure*, and called the book "at once scientifically perspicuous and philosophically obscure", while praising Kuhn as "one of the outstanding philosophers of science of our time". The papers appeared as *Criticism and the Growth of Knowledge* (1970), edited by Lakatos and Alan Musgrave. Kuhn's reply, the "Postscript—1969", split the term in two: the **disciplinary matrix**, "the constellation of shared commitments" of a community, and **exemplars**, concrete solved problems that students learn to imitate and that set the standard for new solutions. Kuhn called exemplars "the most novel and least understood aspect of this book".

Many of these ideas had appeared a generation earlier. Ludwik Fleck (1896–1961), a Polish-Jewish physician and microbiologist born in Lvov, published in 1935 the book translated in 1979 as *Genesis and Development of a Scientific Fact*, a history of the concept of syphilis. A **thought collective**, a community exchanging ideas, develops a **thought style** within which facts are produced, and thought styles are often incommensurable. The expert, Fleck wrote, "is already a specially molded individual who can no longer escape the bonds of tradition and of the collective". Deported to Auschwitz and then Buchenwald, he survived to be liberated in 1945. His book was forgotten. Kuhn had read it in 1949 and mentioned it in his Preface, but, the SEP notes, "remained silent" about Fleck's theory of thought styles. How much Kuhn owed Fleck is disputed: English-speaking scholars mostly see Fleck as an unappreciated forerunner, German-speaking scholars as an original thinker who went beyond Kuhn.

## Lakatos: Research Programmes

Imre Lakatos (1922–1974), born Imre Lipsitz in Debrecen, Hungary, fled after the 1956 Uprising and became Professor of Logic at the London School of Economics. He complained, in effect, that Kuhn turned scientific revolution into a matter of mob psychology, and set out to show that theory change can be rational after all.

His unit of appraisal was not a single theory but a **research programme**: a sequence of theories sharing a **hard core**, made resistant to refutation "by methodological fiat", surrounded by a **protective belt** of auxiliary hypotheses. The logic is the problem of auxiliaries discussed in *Logical Positivism and Its Critics*. If the core plus the auxiliaries predicts an observation, and the observation fails, something in the combination is false, but logic does not say what. The **negative heuristic** says: never blame the core. The **positive heuristic** suggests how to adjust the belt. "All theories, in this sense, are born refuted and die refuted. But are they [all] equally good?"

No, said Lakatos. A programme is **progressive** if its new theories predict novel facts and some of those predictions are confirmed, as when Newtonian mechanics predicted the return of Halley's comet and the comet duly appeared, or when Einstein predicted the bending of light. It is **degenerating** if it only patches its belt. His example was Marxism, whose early bold predictions (the absolute impoverishment of workers, the first revolution in the most industrial country) failed, after which auxiliary hypotheses were "cooked up after the event".

## Feyerabend: Against Method

Paul Feyerabend (1924–1994), born in Vienna, had been influenced by Popper before breaking with his school. *Against Method* (1975) was planned as half of a debate with Lakatos, and dedicated "To IMRE LAKATOS Friend and Fellow-Anarchist". "I was to attack the rationalist position," Feyerabend recalled, "Imre was to restate and defend it, making mincemeat of me in the process." Lakatos died before writing his part.

Feyerabend argued that there are no useful exceptionless rules of method; insist on a rule that never inhibits progress, and the only one left is the useless "anything goes". His case study was Galileo, who, he argued, won through rhetoric, propaganda and "epistemological tricks"; if Galileo was a great scientist, rules that would condemn him are defective. Against Lakatos he posed a dilemma. If the methodology tells scientists to abandon degenerating programmes, it may kill ones that would have recovered; if it only appraises and gives no advice, as Lakatos replied, it is "scarcely distinguishable from 'Anything goes'". The SEP finds no trace of a Lakatosian counterargument in their correspondence.

Feyerabend himself called "anything goes" not a principle he held but "the terrified exclamation of a rationalist who takes a closer look at history". Most readers therefore take it as a *reductio*, an argument that rationalism leads to absurdity; some recent scholars read it as a positive pluralism. In *Science in a Free Society* (1978) he proposed separating science and state, with lay juries supervising experts, in a society where "all traditions have equal rights and equal access to the centers of power". Teaching at Berkeley as, in his words, "Mexicans, Blacks, Indians entered the university", he asked: "Who was I to tell these people what and how to think?"

```checkpoint
q: According to Kuhn, what happens to anomalies during normal science?
a*: They are usually ignored or explained away, and only an accumulation of serious anomalies produces a crisis.
a: Scientists treat each one as a refutation and abandon the theory.
x: Kuhn argued that normal science does not test its guiding theory in this way; that was his objection to Popper.
a: They are settled by sociological negotiation over interests and power.
x: Kuhn derided that view of science and called his own work "pretty straight internalist".
a: They are solved by applying the five shared values of theory choice.
x: Accuracy, consistency, scope, simplicity and fruitfulness guide choice between theories; they do not dissolve anomalies.
hint: Think of the crossword solver who blames herself, not the puzzle.
why: Normal science is puzzle-solving within a paradigm, so failures reflect on the scientist. Only when troublesome anomalies pile up, especially ones that undermine normal practice, does confidence collapse into crisis.
---
q: What is Feyerabend's dilemma against Lakatos's methodology of research programmes?
a: Either it is falsificationism, or it is Kuhn's mob psychology.
x: The dilemma concerns whether the methodology gives advice, not which rival it resembles.
a: Either the hard core is refutable, or science has no hard core.
x: Lakatos made the core irrefutable by methodological fiat; Feyerabend's dilemma does not target that step.
a*: If it tells scientists to drop degenerating programmes, it may kill ones that would recover; if it only appraises, it is scarcely distinguishable from "anything goes".
a: Either Galileo was a great scientist, or rhetoric is irrational.
x: Galileo is Feyerabend's case against fixed rules of method in general, not the dilemma aimed at Lakatos.
hint: Ask what the methodology tells a scientist to do next.
why: A programme degenerating now might progress later, so a firm rule is risky; but a methodology that never advises offers no guidance at all.
```

## Is Science True? The No-Miracles Argument

By the end of the 1980s, Bird notes, a "new realism" occupied the centre of philosophy of science. **Scientific realism**, in Anjan Chakravartty's SEP analysis, has three dimensions: there is a mind-independent world; theories should be taken literally, as true or false; and they give us knowledge of observable things and of **unobservables**, such as electrons. Its main argument comes from Putnam (whose work on meaning appears in *Analytic Philosophy since 1950*): realism "is the only philosophy that doesn't make the success of science a miracle". Reconstructed:

1. Our best scientific theories are extraordinarily successful: they make accurate predictions, including novel ones, and allow precise causal manipulation.
2. If they were far from the truth about the unobservable world, this success would be a miracle, an inexplicable coincidence.
3. We should prefer an explanation that needs no miracle.
4. The best explanation of the success is that the theories are approximately true and their central terms refer to real things.
5. So we should believe our best theories are approximately true.

Step 3 is an **inference to the best explanation**, examined in *Induction, Probability and Inference to the Best Explanation*.

**Objection: the pessimistic induction.** Larry Laudan's "A Confutation of Convergent Realism" (1981) turned to history. The ether theory of light, the caloric theory of heat and phlogiston chemistry were all empirically successful, yet by current lights their central terms refer to nothing, so they were not even approximately true. So success is no reliable sign of approximate truth, and step 4 fails; by induction, our current theories are probably false too. Laudan added cases the other way round: eighteenth-century chemical atomism and Wegener's continental drift had terms that referred, yet the theories failed.

**Replies.** Realists restrict the argument to *mature* theories that made novel predictions without *ad hoc* adjustment, so many of Laudan's cases drop out. Or they become **selective realists**, committed only to the parts that did the work. Kitcher (1993) separated "working posits" from idle parts; Psillos (1999) argued that it is enough to show "that the theoretical laws and mechanisms which generated the successes of past theories have been retained in our current scientific image". Critics answer that the "working" parts are identified only in hindsight, by checking what survived, and Kyle Stanford (2006) added the **problem of unconceived alternatives**, a historical form of the worry that evidence fails to settle which of several rival theories is true.

Two further objections target the argument directly. Bas van Fraassen answered that the success of current theories "is no miracle", because "any scientific theory is born into a life of fierce competition, a jungle red in tooth and claw. Only the successful theories survive". Realists reply that selection explains why we *have* successful theories, not why *this* theory succeeds. Others charge a **base-rate fallacy**: without knowing how many theories are true to begin with, success alone does not make truth probable. Worrall replies that this rests on a misleading formalisation, and the same charge has been turned against the pessimistic induction.

## Middle Ways: Empiricism, Structure and Entities

Van Fraassen's own view, in *The Scientific Image* (1980), widely credited with rehabilitating anti-realism, is **constructive empiricism**.

```quote
Science aims to give us theories which are empirically adequate; and acceptance of a theory involves as belief only that it is empirically adequate.
Bas C. van Fraassen · The Scientific Image · 1980
```

A theory is **empirically adequate** if what it says about observable things is true. Observable means observable by the unaided senses: the moons of Jupiter count, since astronauts could see them, but cells under a microscope do not. Critics objected that this line has no special significance for knowledge.

**Structural realism**, defended by John Worrall in 1989, seeks "the best of both worlds". When Fresnel's theory of light, with its elastic-solid ether, gave way to Maxwell's electromagnetic field, the ether vanished but Fresnel's equations survived. "There was continuity or accumulation in the shift, but the continuity is one of form or structure, not of content." Belief in structure escapes the pessimistic induction without making success a miracle. Worrall's version says we can *know* only structure; the ontic version of James Ladyman and Steven French suggests there may be nothing beyond it.

**Entity realism**, associated with Ian Hacking and Nancy Cartwright, says we should believe in the unobservables we can manipulate to intervene elsewhere. In *Representing and Intervening* (1983) Hacking drew the moral from a Stanford experiment in which electrons and positrons were sprayed in a search for fractional charges: if you can spray them, they are real. Critics ask whether one can coherently believe in entities while doubting the theories that describe them. Arthur Fine's **Natural Ontological Attitude** rejects the whole debate: accept the certified results of science like homely truths, without the realist's emphatic "REALLY" or the anti-realist's reinterpretation.

```checkpoint
q: What does Laudan's pessimistic induction claim to show?
a: That no scientific theory has ever been empirically successful.
x: The argument depends on past theories having been successful; that is the point of the ether and caloric.
a*: That success is no reliable sign of approximate truth, since successful past theories had central terms that referred to nothing.
a: That unobservable entities exist only if we can manipulate them.
x: That is Hacking's entity realism, a realist position, not Laudan's argument.
a: That only the mathematical structure of theories survives revolutions.
x: That is Worrall's structural realism, offered as a way of escaping the pessimistic induction.
hint: Think of theories that worked well but spoke of things we now think do not exist.
why: If success and reference come apart in history, the key step of the no-miracles argument fails. Realists reply by restricting the argument to mature theories or by being realist only about what did the work.
---
q: How does van Fraassen's constructive empiricism differ from scientific realism?
a: It denies that theories make any claims about observable things.
x: Empirical adequacy is precisely about what a theory says of observable things being true.
a: It holds that theories are true only within a paradigm.
x: That sounds like one reading of Kuhn; van Fraassen does not relativise truth to paradigms.
a: It holds that only the structure of a theory can be known.
x: That is Worrall's epistemic structural realism.
a*: It says science aims only at empirical adequacy, and accepting a theory involves believing only that it is empirically adequate.
hint: What does a scientist commit to, for van Fraassen, in accepting a theory?
why: The realist believes accepted theories are true, unobservable parts included. Van Fraassen asks only that what they say about observable things be true.
```

## Explanation and Laws

Realists say theories *explain*, but what is an explanation? On Carl Hempel and Oppenheim's **deductive-nomological** model (1948), it is a sound deductive argument whose premises include at least one law of nature. Counterexamples followed. A flagpole's height and the sun's angle let us deduce the shadow's length, a good explanation; but the shadow's length lets us deduce the pole's height, which fits the model yet explains nothing. (The case is usually credited to Sylvain Bromberger.) Rivals include Wesley Salmon's **causal** account, the **unification** account of Michael Friedman and Philip Kitcher, and van Fraassen's **pragmatic** view of explanations as answers to why-questions in context.

Laws are puzzling too. "All gold spheres are less than a mile in diameter" is accidental; "All uranium spheres are less than a mile in diameter" seems law-like, given uranium's critical mass. On Lewis's **best-system** view, laws are the generalisations of the true system that best balances simplicity and strength; for Armstrong and others they are relations of necessitation between universals. Cartwright's *How the Laws of Physics Lie* (1983) argued that fundamental laws face a dilemma: "Rendered as descriptions of fact, they are false; amended to be true, they lose their fundamental explanatory force."

## Values in Science

Is good science free of values? The **value-free ideal** treats **epistemic** values, such as Kuhn's accuracy and simplicity, as proper to science, and **contextual** values (moral, social, political) as threats. Its defenders can point to "Deutsche Physik" in Nazi Germany and to Lysenkoism in the Soviet Union, where the geneticist Nikolai Vavilov died in prison.

Rudner challenged the ideal in 1953. Scientists accept or reject hypotheses; no hypothesis is ever completely verified; so how much evidence is enough depends on the importance, "in the typically ethical sense, of making a mistake". Wrongly judging a drug safe is worse than wrongly judging it unsafe. Richard Jeffrey replied that scientists should only assign probabilities; Isaac Levi that community standards fix acceptance. Hempel used the term **inductive risk**. Heather Douglas (2000) extended it to the choice of methods and the classification of data, with a case study of dioxin and cancer in rats, and in *Science, Policy, and the Value-Free Ideal* (2009) allowed values an **indirect** role, deciding how much evidence is enough, but not a **direct** role as reasons in themselves. Critics doubt the line is clear-cut, and the debate is live: Hugh Lacey, Ernan McMullin and Sandra Mitchell defend versions of the ideal; Helen Longino, Kitcher and Douglas reject or reformulate it.

Feminist philosophers of science, discussed more widely in *Feminist Philosophy*, have argued in different directions. For Longino, in *Science as Social Knowledge* (1990), a method is "objective to the degree that it permits transformative criticism", which needs shared standards and equality of intellectual authority among critics. Sandra Harding (1935–2025) proposed **strong objectivity**: the knowers and their methods should be scrutinised by the same standards as the objects of knowledge, a task she held can be done only from the perspective of the marginalised. Evelyn Fox Keller (1936–2023) pointed to how gamete research cast the egg as passive and the sperm as active, a picture later corrected. Whether such cases show that values belong inside science, or only that biased science can be corrected by better science, is part of what still divides these critics from defenders of the value-free ideal.

Harding's later work joined these questions to postcolonial ones that reach back to Joseph Needham, who asked in *The Grand Titration* (1969) why modern science rose "only in the West" when Chinese civilisation had been "much more efficient" in applying natural knowledge. Nathan Sivin compared the question to asking why your name did not appear on page 3 of today's newspaper; Andre Gunder Frank saw residual Eurocentrism. Arun Bala argues that Chinese, Indian, Arabic and ancient Egyptian ideas were indispensable to modern science. As of the SEP entry revised in January 2025, how civilisational differences shape scientific work had "yet to give rise to extended philosophical reflection". Kuhn's opening promise, that history could transform our image of science, is still being tested.

## Further exploration

- **Thomas S. Kuhn, *The Structure of Scientific Revolutions* (1962).** The primary text; the 1970 second edition adds the Postscript, and the 2012 50th-anniversary edition an introductory essay by Ian Hacking.
- **Ludwik Fleck, *Genesis and Development of a Scientific Fact* (1935; English 1979).** The study of syphilis and thought styles that anticipated Kuhn, with a foreword by Kuhn in the English edition.
- **Peter Godfrey-Smith, *Theory and Reality: An Introduction to the Philosophy of Science* (2003; 2nd ed. 2021).** A standard introduction covering Kuhn, Lakatos, Feyerabend and realism.
- **Ian Hacking, *Representing and Intervening: Introductory Topics in the Philosophy of Natural Science* (1983).** A readable classic and the origin of entity realism.
- **Heather Douglas, *Science, Policy, and the Value-Free Ideal* (2009).** The main modern case against the value-free ideal, built on inductive risk.
- **Sandra Harding, *Sciences from Below: Feminisms, Postcolonialities, and Modernities* (2008).** Feminist and postcolonial perspectives on science and objectivity.
- **Arun Bala, *The Dialogue of Civilizations in the Birth of Modern Science* (2006).** Chinese, Indian, Arabic and Egyptian contributions to modern science, revisiting Needham.$kuhn_master$,
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
  select $kuhn_quiz$[
    {"type": "mcq", "prompt": "In Kuhn's Postscript to the 1970 edition of Structure, what are 'exemplars'?", "options": ["The five shared values of accuracy, consistency, scope, simplicity and fruitfulness", "The whole constellation of a community's shared commitments", "Concrete solved problems that students learn to imitate and that set the standard for new solutions", "Anomalies that trigger a crisis"], "answerIndex": 2, "explanation": "Answering Margaret Masterman's charge that Structure used 'paradigm' in at least twenty-one senses, Kuhn split the term into the disciplinary matrix (the constellation of shared commitments) and exemplars (concrete problem-solutions). He called exemplars 'the most novel and least understood aspect of this book'.", "id": "q1"},
    {"type": "mcq", "prompt": "In Lakatos's methodology of scientific research programmes, when is a programme 'progressive'?", "options": ["When its new theories predict novel facts and some of those predictions are confirmed", "When it never adjusts its auxiliary hypotheses", "When its hard core has been tested and confirmed directly", "When most scientists in the field accept it"], "answerIndex": 0, "explanation": "A progressive programme predicts novel facts, some of which are corroborated, as when Newtonian mechanics predicted the return of Halley's comet. A degenerating programme only patches its protective belt after the event; Lakatos's example was Marxism. The hard core is protected from refutation by methodological fiat, so it is never tested directly.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these is a realist reply to Laudan's pessimistic induction?", "options": ["Van Fraassen's claim that successful theories survive as the fittest organisms do", "Fine's Natural Ontological Attitude, which accepts science without an emphatic 'REALLY'", "Stanford's problem of unconceived alternatives", "Worrall's structural realism, which holds that what survives theory change is the structure, as Fresnel's equations survived in Maxwell's theory"], "answerIndex": 3, "explanation": "Structural realism is a form of selective realism: belief is confined to the structure that is retained across revolutions, escaping the pessimistic induction without making success a miracle. Van Fraassen's Darwinian point is an anti-realist objection to the no-miracles argument; Stanford's problem is a further challenge to realism; Fine rejects the debate altogether.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Heather Douglas mean by allowing values an 'indirect' but not a 'direct' role in science?", "options": ["Values may influence which topics are funded, but never anything inside research", "Values may help decide how much evidence is enough to accept a claim, but may not serve as reasons for the claim in themselves", "Values may be held by scientists privately but not expressed in publications", "Only epistemic values may play any role, and contextual values none"], "answerIndex": 1, "explanation": "Extending Rudner's argument from inductive risk, Douglas (2000; 2009) argued that judging the consequences of error properly shapes how much evidence is required, as in her dioxin case study, but that values must not stand in for evidence. Critics doubt the direct/indirect line is clear-cut, and defenders of the value-free ideal such as Lacey, McMullin and Mitchell continue the debate.", "id": "q4"},
    {"type": "open", "prompt": "Set out the no-miracles argument for scientific realism step by step. Then explain Laudan's pessimistic induction and assess one realist reply to it.", "rubric": "A strong answer gives the steps: our best theories are highly successful (including novel predictions); if they were far from the truth this success would be a miracle; we should prefer a non-miraculous explanation (an inference to the best explanation); the best explanation is approximate truth and reference of central terms; so we should believe them approximately true. It presents Laudan (1981): successful past theories such as the ether, caloric and phlogiston theories had non-referring central terms, so success is no reliable sign of approximate truth, and current theories are probably false too; ideally it notes his converse cases (chemical atomism, continental drift). It assesses a reply: restriction to mature, non-ad hoc theories; selective realism (Kitcher's working posits, Psillos on retained laws and mechanisms); Worrall's structural realism (Fresnel to Maxwell); or entity realism. Credit for the counter-reply that 'working' parts are identified only in hindsight, Stanford's unconceived alternatives, van Fraassen's Darwinian dissolution, or the base-rate objection.", "id": "q5"},
    {"type": "open", "prompt": "Was Kuhn a relativist? Explain what in Structure invited the charge, how Kuhn responded, and how present-day interpreters such as Bird and Liston judge the question.", "rubric": "A strong answer explains the sources of the charge: paradigm choice is 'not rationally compelled'; conversion is compared to 'something like a religious conversion'; incommensurability (methodological, observational, semantic, later taxonomic); the claim that rival scientists work 'in different worlds'; the denial that science approaches the truth. It notes Shapere's 1964 review and Lakatos's complaint about mob psychology. It gives Kuhn's responses: the five shared values that make disagreement rational; progress as increasing puzzle-solving power; his denial of relativism in the 1970 Postscript and later description of the charge as 'trivial'; his 1992 rejection of the Strong Programme. It reports Bird's view that supporters and detractors alike took Kuhn to be more relativist than he was, and Liston's that the radical reading was wrong but had 'some justice', since Kuhn never abandoned the thesis that there is no fact of the matter whether one paradigm or its rival is correct. Credit for treating it as a live interpretive debate and reaching a reasoned verdict.", "id": "q6"}
  ]$kuhn_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/science-and-language/kuhn-and-realism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
