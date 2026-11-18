-- Socrates and the Sophists — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/socrates-and-the-sophists @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/socrates-and-the-sophists',
    'research',
    'advanced',
    'read',
    $socrates_master$> **In fifth-century Athens, philosophy turned towards human life.** Paid teachers called sophists toured the Greek world offering to make young men effective speakers and successful citizens, while an Athenian stoneworker's son, Socrates (469–399 BCE), questioned anyone who claimed to know what courage or justice was. This chapter explains who the sophists were and why "relativism" fits only one of them, and him doubtfully. It sets out Socrates' method of cross-examination step by step, his claims that virtue is knowledge and that nobody does wrong willingly, and his trial and death. It ends with the "Socratic problem": Socrates wrote nothing, so we know him only through Plato, Xenophon and Aristophanes, each of whom shaped him.

## A Turn to Human Affairs

The chapter on *The Presocratics: from Myth to Argument* followed the first Greek attempts to explain nature by argument. Aristotle later reported that Socrates concerned himself with ethics rather than nature and was the first to ask "what is it?" (*ti esti*) of things like courage and justice. From that testimony grew the textbook "turn from nature to man". It is a simplification: several so-called Presocratics also explored ethics, and some were Socrates' contemporaries.

Still, something changed in Athens, and the change was social as much as intellectual. The political setting is described in the History chapter on *Ancient Greece*; what matters here is its effect on education. Democracy meant that citizens spoke in the Assembly and argued their own cases in the courts, before juries largely made up of elderly, disabled and poor volunteers who needed the three-obol daily fee. Those who could afford it prepared for public life by studying with rhetoricians and sophists from abroad. Skill with words had become power.

## Who Were the Sophists?

The Greek *sophistēs* comes from *sophia*, wisdom, and first meant a sage or expert. In the fifth century BCE it also came to mean a new kind of professional educator who travelled from city to city teaching many subjects, above all public speaking and the successful conduct of life. The sophists belonged to no organisation, shared no common body of beliefs and founded no schools, and their writings are almost entirely lost.

That matters, because most of what we know about them comes from Plato, who worked hard to separate the true philosopher from the sophist, partly to show that the Athenians had been wrong to class Socrates as one. The modern sense of "sophistry", clever but dishonest argument, descends from Plato's hostile portrait, which considerably distorts the reality.

They were well paid. In Plato, Hippias boasts of earning more than 150 minas on one visit to Sicily, something like thirty years' wages for a skilled craftsman; Socrates says that Protagoras earned more than ten sculptors, Phidias included, and that he himself could afford only Prodicus' one-drachma lecture, not the fifty-drachma course. Conservative Athenians such as Anytus, later one of Socrates' accusers, nonetheless thought them subversive, largely unfairly.

### Protagoras and the measure of all things

Protagoras of Abdera (c. 490 – c. 420 BCE) claimed in Plato's dialogue named after him to be the first to call himself openly a sophist. He taught *euboulia*, "good deliberation" about one's household and the city's affairs, and was respected enough that in 444/3 BCE Pericles had him draft the laws of the new colony of Thurii in southern Italy. Only a handful of genuine fragments of his writing survive. The most famous opened his book *Truth*:

```quote
"Man is the measure of all things, of the things that are that they are and of the things that are not that they are not."
Protagoras · Truth (DK 80B1, preserved by Plato and Sextus Empiricus) · fifth century BCE
```

Another fragment says he was not able to know whether the gods exist or what they are like, because the subject is obscure and life is short. He is often called the first known agnostic, which is not the same as an atheist, although some hostile sources treated the two as one.

Was he a relativist? **Relativism** is the view that truth is not the same for everyone but holds only relative to a person or community. In the *Theaetetus*, Plato reads the measure doctrine this way: as each thing appears to me, so it is for me, so that one wind can be cold to me and warm to you. Yet the same dialogue makes Protagoras say that a wise teacher, like a doctor, replaces worse appearances with better ones, which implies that some judgments really are better. Plato also pressed an objection apparently first formulated by Democritus, called *peritropē* or self-refutation:

1. On Protagoras' view, every judgment is true for the person who makes it.
2. Many people judge that Protagoras' doctrine is false.
3. So their judgment that the doctrine is false is true.
4. Therefore the doctrine is false, even by its own lights.

The reply is to restore the qualifier the argument drops: the doctrine is false *for its opponents*. The cost is that each of us is shut inside our own appearances, and it becomes unclear what Protagoras was paid to teach. His answer, in Plato's version, is that teaching replaces worse appearances with *better*, more useful ones, not falser with truer. Scholars still argue whether he was a subjectivist, a social relativist or a pluralist, and Richard Bett doubts that "relativism" is the right category at all. The key caution: Protagoras is the only sophist to whom ancient sources ascribe relativistic views, and even in his case the evidence is ambiguous.

### Gorgias and the power of speech

Gorgias of Leontini (dates given as c. 485–380 or 483–375 BCE) dazzled Athens in 427 BCE, when he arrived leading an embassy seeking help against Syracuse. Plato's *Meno* says he never claimed to teach virtue; he taught speaking. His *Encomium of Helen* argues that Helen of Troy is blameless whether she went because of the gods, force, love or persuasive speech, which he calls "a powerful lord" that acts on the soul as drugs act on the body.

### Nature against convention

Many of these thinkers joined a debate over ***nomos*** (law, custom, convention) and ***phusis*** (nature): are moral rules grounded in nature, or mere human convention? Antiphon, in a papyrus fragment, sets nature against convention: nature prompts us to our own advantage, and breaking a convention harms us only if we are found out. In Plato's *Gorgias*, Callicles, who may be Plato's invention, says that by the law of nature the strong should take more. In the *Republic*, Thrasymachus declares that "justice is nothing other than the advantage of the stronger", though he makes other, conflicting claims, and scholars divide over which is central.

Others defended convention. Protagoras' "Great Speech" in Plato tells how Zeus gave justice and shame to *all* humans, not to a few experts, a myth widely read as a defence of democratic participation. As one modern authority sums up, there is no uniform sophistic position in this debate.

## Socrates in Athens

Socrates was born in 469 BCE in the district of Alopece, outside the city wall. His father, Sophroniscus, was a stoneworker, and his mother, Phaenarete, became a midwife. He fought as a hoplite (heavy infantryman) at Potidaea, Delium and Amphipolis. He married Xanthippe and had three sons (some ancient sources add a second wife, Myrto); the picture of Xanthippe as a shrew comes from Xenophon and later writers, not Plato. All ancient sources agree he was strikingly ugly.

{{image: Socrates | A portrait bust of Socrates. Every ancient source agrees on his unusual looks: snub nose, bulging eyes and a face compared to a satyr's.}}

Twice he defied power. In 406 BCE, serving by lot on the Council's presiding committee, he alone opposed an illegal mass trial of the generals after the battle of Arginusae. Under the Thirty, the oligarchy of 404–403, he refused an order to fetch Leon of Salamis for execution. Unlike the sophists, he never took money and insisted he was no teacher, yet modern scholars call him a central figure of the sophistic period.

## The Oracle and Socratic Ignorance

In Plato's *Apology*, his speech at his trial, Socrates tells how his friend Chaerephon asked the oracle at Delphi whether anyone was wiser than Socrates, and was told no one was. Puzzled, Socrates questioned politicians, who lacked wisdom; poets, who composed by inspiration, not understanding; and craftsmen, who knew their crafts but thought they knew much more. Of one man he examined he says, in G. M. A. Grube's translation: "I am wiser than this man; it is likely that neither of us knows anything worthwhile, but he thinks he knows something when he does not." So his only wisdom is not thinking he knows what he does not. Scholars call this awareness "simple ignorance", as against the "double ignorance" of not knowing and thinking one does.

The famous "I know that I know nothing" appears nowhere in Plato in that form. It is a later paraphrase, found in Cicero's Latin and in the Greek of Diogenes Laertius, and scholars such as Gail Fine and C. C. W. Taylor argue that it misreads Plato. Socrates does claim some moral knowledge, for instance that it is shameful to do wrong. The best reading is that he disclaims expert, definitional knowledge while holding convictions that have survived long testing. Whether his professions of ignorance are sincere or **irony** (saying less than one means) is disputed.

He took the oracle as a command to examine his fellow citizens and shame them into caring for their souls more than for wealth and reputation. He called himself a gadfly stinging a sluggish horse, and a midwife who delivers other people's ideas and tests them.

```checkpoint
q: Which ancient thinker is the only sophist to whom ancient sources ascribe relativistic views?
a*: Protagoras, and even in his case the evidence is ambiguous.
a: Gorgias, in his Encomium of Helen.
x: The Helen is a display of the power of persuasive speech, not a claim that truth is relative to each person.
a: Thrasymachus, in Plato's Republic.
x: Thrasymachus makes claims about justice serving the stronger, but scholars read him as a natural-right theorist, a legalist, an egoist or a nihilist; ancient sources do not credit him with general relativism.
a: All the sophists, as a shared school doctrine.
x: The sophists shared no common body of beliefs and founded no schools, and they took opposite sides in the nomos–phusis debate.
hint: Think of the man who wrote that "man is the measure of all things".
why: The measure fragment is the source of the relativist reading, but Plato's Theaetetus also gives Protagoras views that imply some judgments are better than others, so even his relativism is uncertain.
---
q: According to Plato's Apology, in what way did Socrates conclude he was wiser than others?
a: He knew the true definitions of the virtues, which others did not.
x: He disclaimed exactly this expert, definitional knowledge; his conversations usually end without a definition.
a: He had been taught by the oracle at Delphi.
x: The oracle gave one answer to Chaerephon's question; it taught Socrates nothing, and the reply puzzled him.
a*: He did not think he knew what he did not know, whereas those he questioned did.
a: He had studied natural philosophy more thoroughly than anyone in Athens.
x: Plato's Socrates says he abandoned natural inquiry; his examinations concerned how to live.
hint: Compare "simple" with "double" ignorance.
why: Socrates' advantage was awareness of his own ignorance. The phrase "I know that I know nothing" is a later paraphrase, not his words in Plato.
```

## The Elenchus: How Socrates Argued

Socrates' method is the **elenchus**, Greek for "cross-examination" or "refutation". The person questioned must answer according to his own beliefs. Socrates starts from his claim to know a virtue, wins agreement to further premises, and shows that they contradict the original claim. The conversation usually ends in **aporia**, an impasse. A good definition, for Socrates, must cover every case of the thing, cover nothing else, and state the essence that makes it what it is.

### Courage in the *Laches*

In the *Laches*, set in 424 BCE, Laches and Nicias are asked for advice about the military training of young men, and Socrates steers them to a prior question.

1. **Premise.** An expert in instilling a quality must know what it is. Training aims at courage, so an adviser must be able to say what courage is.
2. **Laches' first answer:** courage is staying at one's post and not running away. But it fails to cover every case: there is courage in retreat (Laches himself had praised Socrates' conduct in the retreat from Delium), and at sea, in illness, in poverty and in politics.
3. **Laches' second answer:** courage is endurance of the soul. Both agree courage is always admirable. Foolish endurance is not admirable, so courage is not just any endurance; yet wise endurance seems *less* brave, since the expert diver seems less courageous than the ignorant one. Laches admits defeat.
4. **Nicias' answer:** courage is knowledge of what is to be feared and dared. Socrates takes this as knowledge of future goods and evils; but such knowledge cannot be limited to the future, and would be the whole of virtue.
5. **Conclusion.** Nicias had agreed that courage is only *part* of virtue. His definition makes it both part and whole: a contradiction, and aporia.

**The strongest objection** is what Gregory Vlastos called "the problem of the Socratic elenchus". The argument shows only that Nicias' beliefs are inconsistent, not *which* one is false. Perhaps the error lies in the premise that courage is only part of virtue. How, then, can Socrates claim to have refuted anything?

**The best reply**, from "constructivists" such as Vlastos, is that the elenchus can establish truths over time: some of Socrates' beliefs have survived examination after examination, and that record gives them standing. Non-constructivists, such as Hugh Benson, answer that the method can only expose inconsistency. The dialogue adds a twist: in the *Protagoras*, Socrates defends almost exactly Nicias' definition. Either the *Laches* refutes Socrates' own view, or the definition is true of courage but cannot distinguish it from the rest of virtue, pointing towards the unity of the virtues. As one commentator admits, that reading "is not obvious".

## Virtue, Knowledge and Doing Wrong

Behind the questioning stood convictions so surprising they are called the Socratic **paradoxes**. *Virtue is knowledge*: health, beauty and wealth benefit us only when wisdom guides their use, and virtue always benefits, so virtue must be a kind of knowledge. Linked to this is the *unity of virtue*: justice, wisdom, courage, piety and self-control are somehow one.

*No one does wrong willingly.* Everyone desires the good, so wrongdoing comes from ignorance of it. Socrates therefore denies **akrasia**, weakness of will, the experience of knowing what is best and doing otherwise; in the *Protagoras* he argues that "being overcome by pleasure" makes no sense if the good is pleasure and the agent measures pleasures correctly. At his trial he drew a pointed corollary: if he had corrupted the young, he had done it unwillingly, and the remedy was instruction, not prosecution.

Finally, *it is better to suffer injustice than to do it*, and it is never right to do wrong, even in return for wrong: a rejection of the traditional rule of helping friends and harming enemies. Socrates appears to have been the first to make *eudaimonia* (happiness, living well) the goal of ethics.

## Trial and Death

In 399 BCE Meletus, a young poet, with Anytus and Lycon, charged that Socrates "does criminal wrong by not recognizing the gods that the city recognizes, and furthermore by introducing new divinities; and he also does criminal wrong by corrupting the youth" (as recorded by Diogenes Laertius). They asked for death.

Why? Socrates blamed old prejudices spread by Aristophanes' comedy *Clouds*. But the politics were raw. Alcibiades, an associate, had defected to Sparta; Critias, another, had led the Thirty. After democracy returned in 403, an amnesty barred prosecutions for acts under the Thirty, and some scholars argue that political suspicion had to be dressed in religious charges. Others stress real religious fear among jurors. I. F. Stone argued that Socrates was an anti-democrat who in effect courted death.

The jury probably numbered 501, though neither Plato nor Xenophon says so. Socrates remarks that thirty votes the other way would have acquitted him, which implies about 280 to 221; that is an inference, not a figure Plato gives. He then proposed a counter-penalty: first free meals at public expense, an honour for benefactors, then fines of one mina and of thirty minae, the latter guaranteed by Plato, Crito and others. At this stage, after the guilty verdict and before the vote on the sentence, he said:

```quote
"The unexamined life is not worth living for a human being."
Socrates, as written by Plato · Apology 38a · set in 399 BCE
```

The death penalty then passed by a larger majority than the conviction; the exact figures are uncertain. Execution waited about thirty days, while the sacred ship made its annual voyage to Delos. In Plato's *Crito*, his friend Crito, ready to bribe the guards and with the money for an escape, begs him to escape. Socrates refuses, voicing the personified Laws of Athens, who say that by living in the city he agreed to its rule. The *Phaedo* describes his last day, though Plato was not present. Socrates drinks "the drug"; whether it was hemlock, and whether Plato idealised the scene, are debated.

## The Socratic Problem

Because Socrates wrote nothing, separating the historical man from the characters who bear his name is called the **Socratic problem**. **Aristophanes**' *Clouds* (423 BCE) shows him running a "thinkery", studying the heavens and teaching the "Weaker Argument"; Kenneth Dover held that the character blends several intellectuals. **Xenophon**, who left Athens in 401 and missed the trial, gives a practical Socrates who advises on money and praises self-mastery; even his oracle story differs. Leo Strauss nonetheless championed him as the more reliable witness. **Plato**, about twenty-five at the trial, shows more realism about people and places than once thought, but may have shaped the character for his own purposes. **Aristotle**, born fifteen years after Socrates died, relied mostly on Plato.

In 1818 Friedrich Schleiermacher turned scholarship from Xenophon to Plato: a Socrates as plain as Xenophon's could never have been so influential. Vlastos later argued that Plato's early dialogues record the historical Socrates' philosophy; Charles Kahn replied that they are Plato's literary constructions. The chapter on *Plato* takes up the dialogues in their own right.

Two women figure in the story. Socrates claims to have learned rhetoric from Aspasia of Miletus, Pericles' partner, slandered by comic poets but portrayed in Socratic dialogues as a skilled speaker; and to have learned about love from Diotima of Mantinea in the *Symposium*, whom most modern scholars think Plato invented, though Mary Ellen Waithe has argued she may have been a real woman. Almost every ancient school except the Epicureans claimed Socrates as founder or model. Aristippus of Cyrene, a Greek city in North Africa, founded the Cyrenaic school and taught his daughter Arete, who taught her son. Plato's Socrates asked his hearers to give little thought to Socrates and much more to the truth. They have been arguing about both ever since.

```checkpoint
q: In the Laches, why does Nicias' definition of courage as knowledge of what is to be feared and dared fail?
a: Because the expert diver is less brave than the ignorant one.
x: That example undermines Laches' second definition, courage as endurance, not Nicias' definition.
a*: Because it turns out to be knowledge of all good and evil, the whole of virtue, while Nicias had agreed courage is only a part.
a: Because there is courage in retreat as well as in standing firm.
x: This counter-example refutes Laches' first definition, staying at one's post.
a: Because Socrates proves that courage cannot be a kind of knowledge.
x: Socrates proves no such thing; elsewhere, in the Protagoras, he defends nearly the same definition.
hint: Look at step 5 of the reconstruction.
why: The definition clashes with Nicias' earlier agreement that courage is a part of virtue, producing a contradiction and aporia.
---
q: When, in Plato's account, did Socrates say that the unexamined life is not worth living?
a: After he had been sentenced to death, while refusing to escape.
x: The refusal to escape is in the Crito, weeks later; the line comes in the Apology.
a: In his opening defence, before any vote.
x: The line comes at Apology 38a, after the first vote, while he discusses possible penalties.
a: On his last day, just before drinking the drug.
x: His last day is told in the Phaedo; his final recorded words concern a cock owed to Asclepius.
a*: In the penalty phase, after the guilty verdict and before the vote on the death sentence.
hint: Remember that the jury voted twice.
why: The line falls at Apology 38a, during the counter-penalty speech; the vote for death comes just after, at 38b.
```

## Further exploration

- **Gregory Vlastos, *Socrates, Ironist and Moral Philosopher* (1991).** The founding modern account of a historical Socrates in Plato's early dialogues.
- **Charles H. Kahn, *Plato and the Socratic Dialogue: The Philosophical Use of a Literary Form* (1996).** The main challenge to Vlastos, reading the "Socratic" dialogues as Plato's literary creations.
- **Debra Nails, *The People of Plato: A Prosopography of Plato and Other Socratics* (2002).** The reference work on everyone who appears in the dialogues.
- **Robin Waterfield, *Why Socrates Died: Dispelling the Myths* (2009).** The trial set firmly in its political context.
- **Emily Wilson, *The Death of Socrates* (2007).** The death and its long afterlife in culture.
- **W. K. C. Guthrie, *The Sophists* (1971).** A classic survey of the sophists and their debates.
- **Michael Gagarin and Paul Woodruff (eds.), *Early Greek Political Thought from Homer to the Sophists* (1995).** Translations of the surviving sophistic fragments.$socrates_master$,
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
  select $socrates_quiz$[
    {"type": "mcq", "prompt": "What did the Greek word sophistēs come to mean in the fifth century BCE, in addition to its older sense of 'sage' or 'expert'?", "options": ["A professional educator who travelled between cities teaching for fees, above all public speaking", "A priest who interpreted the oracle at Delphi", "A member of a formal philosophical school with fixed doctrines", "A dishonest arguer who deliberately uses fallacies"], "answerIndex": 0, "explanation": "Sophists were travelling professional teachers, especially of rhetoric and the successful conduct of life. They founded no schools and shared no doctrines; the sense of 'dishonest arguer' comes from Plato's hostile portrait.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the sophists and relativism best reflects the evidence?", "options": ["All the sophists taught that truth is relative to each person", "Gorgias' Encomium of Helen is the classic statement of sophistic relativism", "Protagoras is the only sophist to whom ancient sources ascribe relativistic views, and even his case is ambiguous", "Relativism was the official doctrine of the sophists' school in Athens"], "answerIndex": 2, "explanation": "The sophists shared no doctrines and had no school. Only Protagoras is credited with relativism, and Plato's Theaetetus also gives him views implying some judgments are better than others.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Socrates interpret the Delphic oracle's reply that no one was wiser than he?", "options": ["As proof that he possessed the true definitions of the virtues", "As a sign that he should become a paid teacher of wisdom", "As confirmation of his skill in natural philosophy", "As meaning that his only wisdom lay in not thinking he knew what he did not know"], "answerIndex": 3, "explanation": "After examining politicians, poets and craftsmen, Socrates concluded that he was wiser only in being aware of his ignorance. 'I know that I know nothing' is a later paraphrase, not his words in Plato.", "id": "q3"},
    {"type": "mcq", "prompt": "Plato's Socrates says that if thirty votes had gone the other way he would have been acquitted. What is the status of the figure '280 to 221'?", "options": ["It is the vote Plato explicitly reports in the Apology", "It is an inference from that remark, assuming a jury of 501", "It is the vote for the death sentence, not the conviction", "It comes from Aristophanes' Clouds"], "answerIndex": 1, "explanation": "Neither Plato nor Xenophon gives the jury size or the totals. With a jury of probably 501, the thirty-vote remark implies about 280 to 221; the figure is a modern inference.", "id": "q4"},
    {"type": "open", "prompt": "Set out the elenchus of the Laches on courage in your own words, then explain Vlastos's 'problem of the Socratic elenchus' and one response to it.", "rubric": "A strong answer reconstructs the stages: the premise that an expert must know what courage is; Laches' 'staying at one's post' refuted by courage in retreat and other cases; 'endurance of the soul' refuted because foolish endurance is not admirable while wise endurance seems less brave; Nicias' 'knowledge of what is to be feared and dared' collapsing into knowledge of all good and evil, contradicting his agreement that courage is only part of virtue. It explains the problem (showing beliefs inconsistent does not show which is false) and gives the constructivist reply (beliefs that repeatedly survive testing gain standing) or the non-constructivist view (the method only exposes inconsistency), ideally noting the Protagoras twist.", "id": "q5"},
    {"type": "open", "prompt": "Why is it hard to know what the historical Socrates thought? Compare at least two of the ancient sources.", "rubric": "A strong answer notes that Socrates wrote nothing and explains the Socratic problem. It contrasts Aristophanes' comic Socrates of the Clouds (423 BCE: a 'thinkery', study of the heavens, the 'Weaker Argument', possibly a blend of several intellectuals), Xenophon's practical moralist (absent from the trial, but championed by Strauss), and Plato's Socrates (closer to events but possibly shaped for Plato's purposes), and may mention Aristotle's dependence on Plato, Schleiermacher's preference for Plato, or the Vlastos–Kahn debate.", "id": "q6"}
  ]$socrates_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/socrates-and-the-sophists', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
