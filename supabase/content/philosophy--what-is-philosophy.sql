-- What Is Philosophy? — canonical master article, co-written and human-reviewed.
-- philosophy/what-is-philosophy @ research/advanced/read.
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
    'philosophy/what-is-philosophy',
    'research',
    'advanced',
    'read',
    $whatisphil_master$> **Philosophy is the practice of asking the most general questions there are, and of answering them with reasons that anyone can check.** This opening chapter explains what makes a question philosophical, how an argument works, why a single counterexample can sink a theory, and what thought experiments are for. It then explains why philosophers keep reading their own past, maps the main branches of the subject and the traditions that have practised it, from Greece and India to China, the Islamic world, Japan, Africa and Latin America, and ends with a guide to how this curriculum is organised.

## What Makes a Question Philosophical?

The word comes from the Ancient Greek *philosophía*, "love of wisdom", built from *phílos* ("loving, friend of") and *sophía* ("wisdom"). A famous story says that Pythagoras invented it, but the story is a later legend, first found in Heraclides of Pontus in Plato's school, and it rests on a picture of the philosopher, as someone who lacks wisdom but strives for it, that scholars regard as thoroughly Platonic. The classicist Walter Burkert showed in 1960 that it could not belong to the historical Pythagoras.

For most of its history "philosophy" covered nearly all rational inquiry. "Natural philosophy" included what we now call physics, chemistry and biology, which is why Newton's great work of 1687, now considered a physics book, was titled *Philosophiæ Naturalis Principia Mathematica*. Bertrand Russell drew a lesson from this in *The Problems of Philosophy* (1912). Whenever a subject reaches definite knowledge, he argued, it leaves philosophy and takes a name of its own, as astronomy did; what remains are the questions still unanswered. On this view philosophy is not a failed science but the place where questions live before anyone knows how to settle them.

There is no agreed definition of philosophy, and the search for one is itself a field, **metaphilosophy**, "the philosophy of philosophy". One widely used description calls philosophy "a systematic study of general and fundamental questions concerning topics like existence, knowledge, mind, reason, language, and value", an inquiry that also reflects on its own methods and assumptions. Kant is often credited with gathering the subject under four questions: What can I know? What should I do? What may I hope? What is the human being? Wilfrid Sellars put it more broadly: philosophy aims "to understand how things in the broadest possible sense of the term hang together in the broadest possible sense of the term".

Philosophical questions, then, are **general** (not "is this witness lying?" but "what is knowledge, and can testimony give it?") and **fundamental**: other inquiries take their answers for granted. They cannot be settled by observation alone, which is why philosophy leans so heavily on reasoning. Philosophers also disagree about what kind of activity this is. For the ancient Stoics it was training for *eudaimonia*, the flourishing life; Wittgenstein treated it as therapy for confusions that arise when we are misled by the forms of our language; Husserl wanted a "rigorous science"; Quine saw it as continuous with the empirical sciences.

Where does the impulse come from? In Plato's *Theaetetus*, the young Theaetetus says that Socrates' questions make him dizzy, and Socrates replies that this wonder is the mark of a philosopher and the beginning of philosophy. Aristotle's *Metaphysics* agrees that wonder is what first led people to philosophise.

Socrates (469–399 BCE) made the awareness of ignorance into a method. In Plato's *Apology*, the oracle at Delphi declares that no one is wiser than Socrates. Puzzled, he questions politicians, poets and craftsmen, and concludes that he is better off than they are in one respect only: he is aware of his ignorance. (The slogan "I know that I know nothing" misstates him; he says rather that human wisdom is worth little or nothing.) His technique, the **elenchus**, was cross-examination: take a confident answer to a "what is it?" question and test it, as when the definitions of piety that Euthyphro offers or accepts fail one by one. Scholars still debate what such questioning can prove.

```quote
the unexamined life is not worth living for human beings
Socrates, in Plato · Apology 38a · 399 BCE
```

## Arguments: Premises and Conclusions

In everyday speech an argument is a quarrel. In philosophy it is a set of statements, some of which, the **premises**, are offered as reasons for another, the **conclusion**. Words such as "because" and "since" often mark a premise; "therefore" and "so" often mark a conclusion.

Arguments are judged in two separate ways: by their form and by their premises. A **deductive** argument is **valid** when it is impossible for all its premises to be true and its conclusion false. A valid argument whose premises are actually true is **sound**. The classic example:

1. All humans are living beings.
2. All living beings are mortal.
3. Therefore, all humans are mortal.

Validity concerns structure, not truth: "All fish can fly; all salmon are fish; so all salmon can fly" is valid but unsound. Much good reasoning is not deductive. An **inductive** argument, such as concluding "all ravens are black" from many black ravens, makes its conclusion likely rather than certain, and is judged strong or weak. **Abduction**, inference to the best explanation, is how a doctor diagnoses an illness from its symptoms. Both are "ampliative": their conclusions go beyond their premises, which makes them useful and risky. Even this classification is debated; Trudy Govier criticised "the hallowed old distinction" between deduction and induction in 1987. The chapter Arguments: Validity, Soundness and Form goes further.

Careful argument grew up in several places, often in reaction to bad arguments. In Greece, reflection on the manipulative arguments associated with the Sophists (see Socrates and the Sophists) helped shape philosophical method, and Aristotle catalogued fallacies in his *Sophistical Refutations*. In India, the *Nyāya-sūtra*, attributed to Gautama and dated to around the second century CE, sets out an argument in five parts. The medical treatise the *Caraka-saṃhitā* illustrates the pattern:

1. Proposition: the soul is eternal.
2. Reason: because it is unproduced.
3. Example: space is unproduced, and it is eternal.
4. Application: just as space is unproduced, so is the soul.
5. Conclusion: therefore, the soul is eternal.

The example step puts the general principle on display, so an opponent can test it. Much of the *Nyāya-sūtra* concerns the rules of debate, and Nāgārjuna, writing at roughly the same time, attacked its key terms one by one. In China, according to the scholar Chris Fraser, "Mozi and his followers initiated philosophical argumentation and debate", giving tightly reasoned arguments in a search for objective moral standards; they tested a statement by its precedent among the sage kings, by what people see and hear, and by its benefit when put into practice.

## Counterexamples: the Case of Knowledge

Many philosophical claims are universal, and a single **counterexample**, one case where the claim fails, is enough to refute them: "all prime numbers are odd" is refuted by the number 2.

The most famous counterexample in modern philosophy concerns knowledge. What separates knowing something from merely believing it? A natural answer, the **justified true belief** analysis, says that a person knows a statement P when P is true, the person believes P, and the person is justified (has good reasons) in believing it. The justification condition is often traced to Plato, whose Socrates notes in the *Theaetetus* that a true opinion produced by a lawyer's sophistry is not knowledge. But calling this "the traditional analysis" is, in the Stanford Encyclopedia's words, "a bit of a convenient fiction": it was spelled out mainly in the twentieth century, by its attackers.

In 1963 Edmund Gettier published a three-page paper, "Is Justified True Belief Knowledge?". In one case, Smith has strong evidence that Jones owns a Ford, and infers "Either Jones owns a Ford, or Brown is in Barcelona", with no idea where Brown is. In fact Jones is driving a rented car, but by sheer coincidence Brown is in Barcelona. Smith's belief is true, believed and justified; yet surely he does not *know* it. Step by step:

1. If the justified true belief analysis is correct, every justified true belief is knowledge.
2. Smith's belief that "Jones owns a Ford, or Brown is in Barcelona" is true, believed and justified.
3. Smith does not know that "Jones owns a Ford, or Brown is in Barcelona".
4. Therefore, the analysis is false: justification, truth and belief together are not enough for knowledge.

The argument is valid, so resisting it means rejecting a premise, and almost no one rejects premise 3. The usual response accepts the conclusion and tries to repair the analysis.

**The objection.** Gettier shows only that a fourth condition is needed. Smith's belief rests on a falsehood, that Jones owns a Ford. Add "no false lemmas" (a lemma is a step in reasoning): you know P only if your belief was not inferred from anything false. Smith then fails to know, and the analysis is saved.

**The reply.** Some Gettier-style cases involve no inference at all. In one, first given by Carl Ginet and published by Alvin Goldman in 1976, Henry drives through a county full of fake barn façades and happens to look at the only real barn. His belief that it is a barn is true and justified, and it is not inferred from a falsehood; he simply sees it. Yet he could so easily have been looking at a fake that his being right seems lucky, and he does not seem to know. So "no false lemmas" fails. Today it is nearly universally accepted among epistemologists that the justified true belief analysis has counterexamples, though most agree that each of its three conditions is necessary.

Gettier was not the first. Around 770 CE the Buddhist philosopher Dharmottara described someone who takes a mirage for water, yet water is then found under a rock at that very spot; Śrīharṣa gave similar cases in twelfth-century India, and Russell described a stopped clock that happens to show the right time. The chapter What Is Knowledge? From Plato to the Gettier Problem tells the whole story.

```checkpoint
q: An argument has true premises and a true conclusion, but the premises do not guarantee the conclusion. Which description fits it?
a*: It is not valid, so it is not sound, even though its conclusion happens to be true.
a: It is sound, because everything in it is true.
x: Soundness requires validity as well as true premises. An argument whose premises do not guarantee its conclusion is not valid, so it cannot be sound, however true its parts.
a: It is valid, because its conclusion is true.
x: Validity is about structure: whether true premises would guarantee the conclusion. A true conclusion reached by a faulty route does not make the argument valid.
a: It is a counterexample.
x: A counterexample is a particular case that refutes a general claim. Nothing here is a case being used against a generalisation.
hint: Validity is about the link between premises and conclusion; soundness adds the truth of the premises.
why: A valid argument is one where true premises make the conclusion certain; a sound argument is a valid one with true premises. True statements can be linked by an invalid argument.
---
q: Why does the fake-barn case answer the "no false lemmas" repair to the justified true belief analysis?
a: Because Henry's belief about the barn is false.
x: Henry is looking at the one real barn, so his belief is true. A false belief could never be a counterexample to an analysis of knowledge that requires truth.
a: Because Henry has no justification at all for his belief.
x: Henry sees what looks like a barn in good light; his perceptual belief is justified. That is what makes the case a problem.
a*: Because Henry's justified true belief is not inferred from any falsehood, yet it still seems to be luck rather than knowledge.
a: Because it shows that belief is not necessary for knowledge.
x: The case does not touch the belief condition. Henry does believe he sees a barn; the puzzle is that a justified true belief can still fall short of knowledge.
hint: The repair blamed Smith's false starting point. Does Henry have one?
why: "No false lemmas" works only for cases where a belief is inferred from a falsehood. The fake-barn case removes the inference but keeps the luck, so the repaired analysis still counts Henry as knowing when he does not.
```

## Thought Experiments

A **thought experiment**, in the Stanford Encyclopedia's description, typically sets up a situation in the imagination, lets it run, sees what happens and draws a conclusion. Gettier's cases are thought experiments of this kind.

Lucretius, in *De Rerum Natura*, imagined throwing a spear at the supposed edge of the universe. If it flies through, there was no edge; if it bounces back, something beyond stopped it. Either way there is no edge, so space is infinite. The case shows the method's fallibility too: we now know space can be finite without an edge.

The puzzle of the **Ship of Theseus** began as a report. Plutarch tells how the Athenians kept Theseus' ship by replacing its rotten planks, so that it "became a standing example among the philosophers". In *De Corpore* (1655) Hobbes added a twist: suppose someone rebuilds a second ship from the old planks. One line of reasoning says the repaired ship is Theseus', since ships survive gradual repair; another says the rebuilt one is, since ships survive being taken apart and reassembled. Together they imply that one ship survives twice over. The puzzle returns in Identity, Change and Persons.

In ethics, Philippa Foot in 1967 compared a judge who can stop a riot only by framing and executing one innocent person with a tram driver who can steer from five workmen onto one. She judged that killing was wrong in the first case but not the second, and explained the difference by the distinction between doing harm and allowing it. Judith Jarvis Thomson, who named "the trolley problem" in 1976, later (in 1985) moved the choice to a bystander, who chooses between killing one and *letting* five die, which undermined Foot's explanation. These cases return in Consequentialism: What Makes Right Acts Right? and Deontology: Duty and Respect.

How can imagining teach us anything? James Robert Brown holds that some thought experiments give *a priori* knowledge, gained by reasoning rather than observation, of the laws of nature. John D. Norton replies that any thought experiment is really an argument, often in disguise, built from ordinary empirical premises, its vivid details strictly redundant. Critics ask Brown how to tell good thought experiments from bad.

## Why Philosophy Keeps Reading Its Past

Philosophers still read Plato, Nāgārjuna and Kant as contributors to live arguments. This was not always welcomed. For a long time most analytic philosophers (the tradition that grew from Frege and Russell) held that the history of philosophy had little to do with doing philosophy, and was largely a series of mistakes. A more positive attitude emerged in the 1970s. Reading the past, its defenders argue, exposes assumptions we did not know we held, shows the strengths of positions we find uncongenial, and suggests new roles for philosophy by showing how it once fitted into wider ways of life. Charles Taylor went further in 1984: "Philosophy and the history of philosophy are one", since we cannot do the first without the second.

The past is also reread because it is hard to read. Socrates wrote nothing; everything we know of him is second-hand and much of it disputed, and each age, as the Stanford Encyclopedia puts it, produces a Socrates of its own. And unlike intellectual history, the history of philosophy asks not only what past thinkers meant but whether they were right. The History of Philosophy overview takes up how that history should be read.

## The Branches of Philosophy

The branches are neither complete nor sharply divided. **Logic** studies good reasoning and fallacies. **Epistemology** asks what knowledge is, where it comes from (perception, memory, inference, testimony) and whether scepticism, the doubt that we know anything, can be answered. **Metaphysics** asks about the most general features of reality: what exists, causation, space and time, identity through change, free will, and why there is something rather than nothing. The **philosophy of mind** asks how mind relates to body and what consciousness is. **Ethics** covers what makes actions right (with consequentialism, deontology and virtue ethics as the main families), applied questions, and whether there are moral facts at all. **Political philosophy** asks about legitimacy, justice, liberty and equality; **aesthetics** about beauty and art. The **philosophy of science** asks what separates science from pseudoscience; the **philosophy of language** asks about meaning, reference and truth. The **philosophy of religion** examines religious claims without presupposing one tradition's assumptions, which distinguishes it from theology.

## The Traditions of Philosophy

Each tradition had its own words for the enterprise. Arabic *falsafa* is a loan word from Greek. Classical Indian schools are often called *darśana*, from "to see". The Japanese *tetsugaku*, coined by Nishi Amane and first printed in 1874, became the standard word in Chinese, Korean and Vietnamese, although Nishi himself did not think philosophy in the Western sense existed in the East.

**Greek and European** philosophy began in the sixth century BCE with the Presocratics, such as Thales. **Indian** philosophy runs from the Vedas and Upanishads through Buddhism and Jainism, which stood outside Vedic authority, to the classical schools, whose theory of the sources of knowledge (perception, inference, testimony) developed over almost twenty centuries. **Chinese** philosophy took shape in the "Hundred Schools" (Confucians, Daoists, Mohists, Legalists), absorbed Buddhism from the first century CE and produced Neo-Confucianism from the eleventh. **Islamic** philosophy is usually said to begin with al-Kindī in the ninth century, after Greek works were translated into Arabic in Baghdad (see The Rise of Islam and the Caliphates), and runs through Avicenna, al-Ghazālī and Averroes to Mullā Ṣadrā (c. 1571–1636); scholars debate how far it grew from the Greek inheritance and how far from Qur'anic wisdom. **Jewish** philosophy runs from Philo of Alexandria, who harmonised scripture with Greek philosophy, through Saadia Gaon to Maimonides. **Japanese** philosophy grew from the meeting of Shintō, Confucian and Buddhist thought, and in the twentieth century produced the Kyoto School. **African** philosophy was largely oral before the twentieth century, with written roots in ancient Egypt (*The Maxims of Ptahhotep*) and seventeenth-century Ethiopia, where Zera Yacob's *Hatata* was once claimed to be a later forgery; many scholars, including its recent translators, accept his authorship, but the question remains disputed. **Latin American** philosophy runs from indigenous thought and colonial scholasticism to positivism and the philosophy of liberation.

Whether all this is "philosophy" is itself argued over. One view treats Chinese thought as wisdom literature, sayings meant to move people to a way of life, and reserves "philosophy" for systematic argument. Derrida reportedly said in Shanghai in 2001 that China "does not have any philosophy, only thought"; another report renders it as no philosophy *but* thought, and the difference matters. Against the narrow view, when Jesuits published the first major European translation of the *Analects* in 1687, seventeenth-century European philosophers immediately recognised it as philosophy, and Peter K. J. Park has argued that the more common eighteenth-century view was that philosophy began in India or Africa. Parallel debates arose over whether Placide Tempels' *Bantu Philosophy* (1945) was philosophy or, as Hountondji argued, "ethnophilosophy", and over Augusto Salazar Bondy's sceptical answer in 1968 to whether a distinctive Latin American philosophy exists, against Leopoldo Zea's defence. This curriculum, like the History of Philosophy overview, treats all these traditions as philosophy and names the debates where they arise.

```checkpoint
q: Which of the following best explains why Russell thought philosophy seems to make little progress?
a: Philosophers refuse to use arguments.
x: Russell's point had nothing to do with a lack of argument. Philosophy, as this chapter shows, is built from arguments.
a*: When a field reaches settled knowledge, it leaves philosophy and becomes a separate discipline, as astronomy did.
a: Philosophical questions are meaningless.
x: Russell treated the remaining questions as real and important; their value, he thought, lay partly in their very uncertainty.
a: Philosophy has stopped asking new questions.
x: The point is the reverse: philosophy keeps the questions that no other discipline has yet learned how to answer.
hint: Think of Newton's book about "natural philosophy".
why: Settled subjects take their own names, so what is left under the name "philosophy" is, by definition, the unsettled questions.
---
q: A student says that Indian philosophy cannot count as philosophy because it lacks rigorous argument. Which point from the chapter most directly answers this?
a: The word "philosophy" is Greek, so only Greek thought counts.
x: This supports the student's view rather than answering it, and the word's origin does not settle what counts; *falsafa* and *tetsugaku* show the practice being recognised across languages.
a: Indian philosophy is mainly about religion.
x: Much Greek and medieval European philosophy was also about religion; this would not show a lack of argument, and the student's claim concerns argument.
a: Indian philosophers did not write anything down.
x: This is false, and the *Nyāya-sūtra* and the *Caraka-saṃhitā* are counterexamples to it.
a*: The *Nyāya-sūtra* sets out a five-part form of argument and devotes much of its length to the rules of debate.
hint: Look for a piece of evidence about Indian theories of argument.
why: A counterexample refutes a universal claim. A tradition with an explicit theory of argument and debate cannot be said to lack rigorous argument.
```

## How to Use This Curriculum

The curriculum has two halves, meant to be read together. The first, History of Philosophy, tells one story from the first arguments in Greece, India and China to the present, in five sections: Ancient Beginnings (c. 800 BCE – 200 CE); Late Antiquity and the Medieval World (c. 200 – 1450); Renaissance and Early Modern Philosophy (c. 1450 – 1800); The Nineteenth Century; and The Twentieth Century and After. Its chapters ask who argued what, when, in answer to whom, and why it mattered; its overview is the place to start.

The second half takes the problems themselves, in eight sections: Logic and Reasoning; Knowledge (Epistemology); Reality (Metaphysics), which includes the arguments about God and the problem of evil; Mind; Ethics; Political Philosophy; Art and Beauty (Aesthetics); and Science and Language. Each chapter follows one problem across the traditions that worked on it, so that Free Will and Determinism, for example, draws on Greek, Indian and modern European thinkers alike.

The halves cross-reference each other, and there is no single right order. Every chapter sets out at least one argument step by step, with the strongest objection and the best reply, as this one did with Gettier; try deciding which premise you would reject. Where scholars disagree, the chapters name the debate rather than settle it. The aim, in Socrates' spirit, is to examine your own beliefs.

## Further exploration

- **Bertrand Russell, *The Problems of Philosophy* (1912).** The classic short introduction for general readers, including the chapter "The Value of Philosophy".
- **Thomas Nagel, *What Does It All Mean? A Very Short Introduction to Philosophy* (1987).** Nine central problems, from how we know anything to the meaning of life, left open for the reader.
- **Jennifer Nagel, *Knowledge: A Very Short Introduction* (2014).** A clear introduction to epistemology that covers both Dharmottara and Gettier.
- **Bryan W. Van Norden, *Taking Back Philosophy: A Multicultural Manifesto* (2017).** An argument for including non-Western philosophy in the discipline.
- **Peter K. J. Park, *Africa, Asia, and the History of Philosophy: Racism in the Formation of the Philosophical Canon, 1780–1830* (2013).** How Africa and Asia were written out of philosophy's origin story.
- **Peter Adamson and Jonardon Ganeri, *Classical Indian Philosophy* (2020).** An accessible survey from the Vedas to Nyāya and Buddhist philosophy.
- **Pierre Hadot, *Philosophy as a Way of Life* (English edition 1995).** Ancient philosophy as a practice of living rather than a body of theory.$whatisphil_master$,
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
  select $whatisphil_quiz$[
    {"type": "mcq", "prompt": "Which statement about the story that Pythagoras coined the word \"philosophy\" is best supported?", "options": ["It is a later legend, first found in Heraclides of Pontus, which scholars doubt belongs to the historical Pythagoras", "It is recorded in Pythagoras' own writings", "It was invented by Russell in The Problems of Philosophy", "It is confirmed by Aristotle's Metaphysics"], "answerIndex": 0, "explanation": "The story first appears in Heraclides of Pontus, in Plato's school, and depends on a Platonic picture of the philosopher; Walter Burkert showed in 1960 that it could not belong to the historical Pythagoras.", "id": "q1"},
    {"type": "mcq", "prompt": "An argument is sound when:", "options": ["Its conclusion is true", "It persuades most people who hear it", "It is valid and all its premises are true", "Its premises are likely to make the conclusion true"], "answerIndex": 2, "explanation": "Validity means true premises would guarantee the conclusion; soundness adds that the premises are in fact true. Making a conclusion likely describes a strong inductive argument.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the purpose of the 'no false lemmas' condition, and why did the fake-barn case answer it?", "options": ["It required knowledge to be certain; the fake-barn case showed that certainty is impossible", "It ruled out beliefs inferred from falsehoods; the fake-barn case gives a lucky justified true belief that involves no inference from a falsehood", "It required beliefs to be based on perception; the fake-barn case shows perception is unreliable", "It removed the justification condition; the fake-barn case shows justification is needed"], "answerIndex": 1, "explanation": "Smith's belief in Gettier's case was inferred from the false belief that Jones owns a Ford. Henry simply sees the one real barn, so the repair does not exclude his case, yet his being right seems a matter of luck.", "id": "q3"},
    {"type": "mcq", "prompt": "In Foot's and Thomson's trolley cases, why did moving the choice from the tram driver to a bystander matter?", "options": ["It made the number of people at risk larger", "It showed that thought experiments cannot be used in ethics", "It proved that consequences are all that matter morally", "The bystander chooses between killing one and letting five die, which undermined Foot's explanation in terms of doing versus allowing"], "answerIndex": 3, "explanation": "Foot explained the driver's case as a choice between killing one and killing five. Thomson's bystander chooses between killing one and letting five die, which removed the basis of Foot's explanation; Thomson herself later argued, in 2008, that the bystander may not turn the trolley.", "id": "q4"},
    {"type": "open", "prompt": "Set out Gettier's case against the justified true belief analysis of knowledge as a numbered argument. Then give the strongest objection and the best reply described in the chapter.", "rubric": "A strong answer states the analysis (knowledge as true, believed and justified), describes the Ford/Barcelona case, and sets out premises such as: if the analysis is correct every justified true belief is knowledge; Smith's belief is true, believed and justified; Smith does not know; therefore the analysis is false. It notes the argument is valid. It gives the 'no false lemmas' repair (Smith's belief rests on the falsehood that Jones owns a Ford) and the reply from the fake-barn case (a justified true belief from perception, not inferred from any falsehood, which still seems lucky rather than knowledge). Better answers mention earlier cases such as Dharmottara's mirage or Russell's stopped clock, or the caveat that the 'traditional' analysis was largely articulated by its twentieth-century critics.", "id": "q5"},
    {"type": "open", "prompt": "Some have claimed that philosophy is a Western enterprise and that other traditions have 'thought' or 'wisdom' rather than philosophy. Using evidence from the chapter, assess this claim.", "rubric": "A strong answer explains the view (philosophy as systematic argument and theory versus wisdom literature aimed at a way of life) and notes Derrida's reported remark with its two versions. It brings counter-evidence: the Nyāya five-part argument and the Nyāya-sūtra's treatment of debate; the Mohists' explicit, step-by-step argument; seventeenth-century Europeans recognising the Analects as philosophy in 1687; Park's argument that the eighteenth century commonly placed philosophy's origins in India or Africa; and the words falsafa, darśana and tetsugaku. Better answers recognise that the question is itself philosophical, note parallel debates over African ethnophilosophy (Tempels, Hountondji) and Latin American philosophy (Salazar Bondy, Zea), and avoid simply asserting a conclusion without reasons.", "id": "q6"}
  ]$whatisphil_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/what-is-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
