-- Ancient Beginnings (c. 800 BCE – 200 CE) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings',
    'research',
    'advanced',
    'read',
    $ancientoverview_master$> **Three places where people began to give reasons a rival could dispute.** Between about the sixth century BCE and the second century CE, Greek cities, the cities of the Ganges plain and the warring states of China each produced traditions of argument that founded schools lasting for centuries. This overview sets the section's ten chapters side by side: it asks whether the idea of an "Axial Age" helps, explains why nearly everything reaches us through fragments, late compilations and hostile witnesses, compares the problems the three regions shared with what was local to each, and ends with a guide to the chapters.

## Beginnings in the Plural

The chapter *The Presocratics: from Myth to Argument* offers a test for what counts as a beginning. Thales is said to have thought that "all things are full of gods", so the Greeks did not simply drop religion. What was new, that chapter concludes, was "less the dropping of the gods than the giving of reasons open to criticism". Dirk Couprie calls Anaximander the first philosopher because he "also tried to give arguments".

The same test finds philosophy in India and China. The teachers of the Upaniṣads, Brian Black concedes, do not seem to argue linearly from premises, working instead by analogy and metaphor; but they competed for patronage in public contests, and the dialogue form helped make debate "the defining social practice of Indian philosophy". In China the later Mohist Canons, written between the late fourth and mid-third centuries BCE, state versions of the laws of excluded middle and non-contradiction, and, as the Hundred Schools chapter notes, "decisively refute" the old view that ancient Chinese thinkers were uninterested in logic. *What Is Philosophy?* takes up the general question of what counts.

The social setting changed too. In democratic Athens citizens argued their own cases in court, so skill with words became power, and the sophists sold it. In India the *śramaṇas*, wandering renouncers, flourished as cities grew in the Ganges plain in the mid-first millennium BCE, and many of them, the Buddha included, rejected the authority of the Veda. In Warring States China, centralised states promoted "men of service" (*shi*) for ability rather than birth, and the historian Yuri Pines calls the age, for intellectuals, "a golden age".

## Was There an "Axial Age"?

The Presocratics chapter notes that "in roughly the same centuries India and China saw new kinds of thought", Karl Jaspers' "Axial Age". The Presocratics chapter calls the label disputed, and the chapters' evidence suggests two reasons for caution.

The first is chronology: the synchrony looks neat only if the dates hold. After a symposium at Göttingen in 1988 most Western scholars moved the Buddha's life about a century later, so that most now place his death within about twenty years of 400 BCE; not all historians accept the redating. Patrick Olivelle places the earliest Upaniṣads in the seventh to sixth centuries BCE, "give or take a century or so", and warns that any dating "that attempts a precision closer than a few centuries is as stable as a house of cards". Confucius's dates, 551–479 BCE, are traditional, and the *Analects* may have reached its final form centuries after his death.

The second is independence. Most scholars reject the claim that Greek philosophy was simply taken from Egypt, while Babylonian astronomy and mathematics probably contributed to Greek knowledge, though how much is debated. Pyrrho reportedly went with Alexander to India and met "naked wise men"; Christopher Beckwith finds an early Buddhist in him, Johannes Bronkhorst denies any link, and the Stanford Encyclopedia judges there is "at least room for debate". The *Milindapañha*, a Buddhist dialogue with the Indo-Greek king Menander, shows no sign of Greek influence. The contacts the chapters record (Babylonian learning in Greece, Pyrrho in India, the Greek king of the Milindapañha) are few, and their importance is contested.

## Reading Through Other People's Words

One theme runs through most chapters: the founders are almost never available in their own words.

**Fragments.** No complete work by any Presocratic survives. Parmenides' poem was perhaps 800 lines long, and about 160 survive; Anaximander is known from one fragment. Scholars distinguish fragments, apparently word-for-word quotations, from testimonia, later reports. No complete work of the early Stoics survives either, nor any of the many Cynic writings.

**Teachers who wrote nothing.** Socrates, Pythagoras, Pyrrho, the Buddha and Epictetus wrote nothing. Socrates is known through Plato, Xenophon and Aristophanes, each of whom shaped him. The Buddha's teachings were passed on orally "for at least three centuries"; the Upaniṣads were written down only after 500 BCE.

**Late compilation.** The *Analects* may have reached its present form long after Confucius; the *Mozi* is an anthology by many hands; the *Daodejing* was consolidated from collections of sayings; only the seven Inner Chapters of the *Zhuangzi* are conventionally attributed to Zhuangzi. Even the "Hundred Schools" are partly a later filing system: Chad Hansen says that the historians Sima Tan and Sima Qian "fabricated" four of the six schools on Sima Tan's list, and only the Ru and the Mohists were self-aware movements.

**Hostile witnesses.** Early Stoicism is pieced together from largely hostile witnesses such as Plutarch, Galen and Sextus Empiricus. The sophists are known mainly from Plato, whose portrait gave us "sophistry". The Ājīvikas' scriptures are lost, and everything we know of them comes from Buddhist and Jain rivals; even the Cārvāka materialists' famous slogan that perception is the only means of knowledge comes from their opponents. Paul Dundas suspects that "the Jains and Buddhists deliberately distorted Ajivika doctrine"; others reply that where two rival hostile traditions agree, their testimony can be trusted.

The great exceptions are Plato, whose complete works are believed to survive, and Aristotle, with about 31 authentic works. Survival is uneven between regions too, which is worth remembering whenever a comparison seems to favour one of them.

```checkpoint
q: Why do the chapters in this section treat the idea of a single "Axial Age" with caution?
a*: Because many key dates, such as the Buddha's, the Upaniṣads' and the Analects', are uncertain by a century or more, so any precise synchrony is fragile.
a: Because there is no evidence of any philosophical activity in India before the Buddha.
x: The Upaniṣads and the śramaṇa movements are earlier than or contemporary with the Buddha, and the Nāsadīya hymn already raises questions about origins.
a: Because it has been shown that Greek philosophy was taken from Egypt.
x: Most scholars reject that claim; the chapters treat the Greek argumentative form as new.
a: Because Chinese philosophy began only after the Han unification in 221 BCE.
x: Mozi, Mencius, Zhuangzi and the later Mohists all worked in the Warring States period, before 221 BCE.
hint: Think about what Olivelle said about dating the Upaniṣads, and what happened at Göttingen in 1988.
why: The label rests on parallels "in roughly the same centuries". When the Buddha can move by a century and the Upaniṣads' dates are a "house of cards" below a few centuries, the pattern can only be loose.
---
q: Which of these is an example of a "hostile witness" problem rather than a "late compilation" problem?
a: The Analects may have reached its final form centuries after Confucius.
x: That concerns when a sympathetic tradition put its own text together, not a rival reporting on it.
a: Only the seven Inner Chapters of the Zhuangzi are attributed to Zhuangzi.
x: That is a problem of authorship within a compiled book, not of an opponent's report.
a*: Almost everything known about the Ājīvikas comes from Buddhist and Jain texts.
a: The Buddha's teachings were written down centuries after his death.
x: That is a problem of oral transmission and late writing within the Buddhist tradition itself.
hint: Ask who is doing the reporting, and whether they had reason to make the reported view look bad.
why: The Ājīvikas' own scriptures are lost, so their doctrine reaches us only through rival movements, which most scholars regard as coloured by sectarian hostility.
```

## What Recurs: the Self and Human Nature

All three regions argued about what a person is. Greek and Indian thinkers framed it as a question about the soul or self; the Chinese chapters frame it as one about human nature (*xing*). Set side by side, the reasoning has a common shape:

1. **Plato (Greece).** The same thing cannot undergo opposites in the same respect at the same time; a thirsty person can at once desire to drink and refuse; so the soul has parts (reason, appetite and, by further argument, spirit).
2. **Yājñavalkya (India).** The self is what knows, so it "cannot be an object of consciousness"; what cannot be known as an object cannot be given attributes; so it can be described only by negation, "not this, not this".
3. **The Buddha (India).** If there were a self, one could never desire that it be changed; each of the five aggregates (body, feeling, perception, mental formations, consciousness) can be desired to change; so, if a person is nothing but the aggregates, there is no self.
4. **Mencius (China).** Anyone who suddenly sees a child about to fall into a well feels alarm and compassion, not from self-interest; such feelings are "sprouts" that grow into virtues under healthy conditions; so human nature is good.
5. **Xunzi (China).** What we have at birth includes desires that, simply followed, lead to contention and disorder; goodness requires deliberate effort, "artifice"; so human nature is bad, and cultivation transforms it.
6. **Conclusion.** Each tradition reasons from something it takes to be true of experience (inner conflict, what knows, the wish to change oneself, a spontaneous feeling) to a claim about the structure of the person; and in the Buddhist and Chinese cases the chapters show the dispute turning on a hidden premise or a definition.

The chapters' own objections bear out the last step for the Buddhist and Chinese cases. The Sāṃkhya school drew the opposite conclusion from the Buddha's facts about control: there must be a controller beyond the aggregates. Scholars since A. C. Graham have argued that Mencius and Xunzi define "nature" differently, so their quarrel may be partly verbal. **The objection** to the whole comparison, which is this overview's own caution rather than any chapter's, is the same worry writ large: *psuchē*, *ātman* and *xing* are not one concept. **The reply** is that a difference of definition can hide a real disagreement. Xunzi explicitly denies that we have innate moral sprouts, and the Jains, against the Buddhists, insisted that there really are selves, as many as there are living beings.

Within India the range is wide. The identification of self with *brahman* is, in Black's words, "not the only characterization" in the Upaniṣads; what the Buddha's non-self denies is itself debated; and the materialists made the self the conscious body. The canon's own image of non-self was first voiced by a woman:

```quote
Just as, with an assemblage of parts, / The word "chariot" is used, / So, when the aggregates are present, / There's the convention "a being."
Vajirā · Saṃyutta Nikāya 5.10 (trans. Bhikkhu Bodhi) · early canon, date uncertain
```

These lines of thought continue in *Self and No-Self: Personal Identity East and West*.

## What Recurs: Scepticism, Logic and the Forms of Argument

**Scepticism.** Each region turned argument against knowledge itself. Greek Pyrrhonists set opposing appearances against each other until judgement was suspended and tranquillity followed. In India the Cārvāka argued that the universal connection on which inference depends (wherever there is smoke, there is fire) can never be established by perception, an argument Stephen Phillips calls "the Cārvāka argument identifying the problem of induction". In China, Paul Kjellberg and Lisa Raphals compare Zhuangzi with the Pyrrhonists. The replies rhyme as well. The Stoics objected that a sceptic who withholds assent cannot act; the Nyāya logician Gaṅgeśa answered the Cārvāka, in Stephen Phillips's paraphrase, that "the skeptic himself relies on such generalizations when he opens his mouth to voice his skepticism". In both cases one answer was to narrow the doubt: Sextus said the sceptic lives by appearances, and, on Ramkrishna Bhattacharya's revisionist reading, the Cārvākas rejected only inference to the unseen.

**Relativism and self-refutation.** Protagoras' "man is the measure of all things" met the objection that it refutes itself, since those who judge it false must, on his own view, be right. The Jain doctrine of many-sidedness (*anekāntavāda*) met the same charge: if every claim is only "perhaps" true, so is the doctrine. Chad Hansen reads Zhuangzi as holding a mild "perspective relativism", while Steve Coutinho argues that radical relativism would make Zhuangzi's own view no improvement on his rivals'. In each case, perspectivism had to explain its own standing.

**Forms of argument.** Zeno argued by *reductio*; Aristotle built a formal logic of terms, and Chrysippus a logic of propositions joined by "if", "and" and "or"; the Jains formalised a sevenfold predication; the later Mohists defined disputation as contending over which of a pair of terms fits a thing. Paradox-makers appear in Greece and China, from Zeno's runner to Gongsun Long's "white horse is not horse". *Logic across Traditions* compares these systems directly.

## What Recurs: Cultivation and the State

**Ethics as cultivation.** Almost every school asks how a person becomes good. Socrates held that virtue is knowledge; for Aristotle virtues of character come by habituation, which broadly corresponds to Confucian cultivation. The Buddha defined action by intention; the Jains made non-violence so demanding that, in Marie-Hélène Gorisse's words, restrained action comes "very close to one's mere absence of act"; the Bhagavad Gītā teaches action without attachment to its fruits. Pierre Hadot's thesis that ancient philosophy was above all a way of life fits much of this, but is contested: John Cooper holds that reasoning and argument, not spiritual exercises, were central. Not all ethics was cultivation, either. Chris Fraser calls Mohism "the world's earliest form of consequentialism", judging practices by their benefit, though others read its appeal to "Heaven's intent" as a divine command theory.

**Politics and the state.** Greek political philosophy grew from the city-state: Plato's philosopher-rulers and critique of democracy, Aristotle's "political animal", his constitutions and his "natural slavery". The Chinese debate was about how a ruler should order a divided world: by virtue and ritual, as Confucius taught, since coercion leaves people "evasive" and without shame; by benefit, as the Mohists argued; without war, cruel punishment or heavy taxes, as the *Daodejing* advises; or, in Han Fei's answer, by public laws, hidden techniques and reward and punishment, a system that must work for an average ruler. In the Indian chapters politics appears mostly through social order: the early karma teaching is tied to the four *varṇas*, and B. R. Ambedkar attacked the Gītā for defending birth-based hierarchy; the Upaniṣads chapter concludes that detached action can be separated from caste, but that the objection still stands against the text as written.

## What Is Local

Other concerns are more local. The problem of being and change in Parmenides' form, answered by Forms, by atoms or by matter and form, runs through the Greek chapters, though the Jains, too, argued that every existing thing is at once persistent and changing. In India the authority of the Veda divided the schools, and karma, rebirth and liberation were shared ground that Hindus, Buddhists and Jains developed and the materialists rejected; yet Pythagoras also taught that the soul passes into other living things, a reminder that "local" is often a matter of emphasis. In China ritual (*li*) and the right use of names stand near the centre of ethics and government, from Confucius's "rectification of names" to the *Daodejing*'s "The Way that can be spoken of is not the constant Way"; the Confucian chapter observes that Aristotle has nothing like the Confucian emphasis on ritual.

Women appear in all three, unevenly and often through male authors: Gārgī and Maitreyī question Yājñavalkya; the nun Vajirā states the doctrine of non-self; Hipparchia lived the Cynic life; Axiothea and Lasthenia studied at Plato's Academy; Epicurus' Garden welcomed women; Ban Zhao argued that girls should receive a classical education. How far these figures are historical is among the debates the chapters record.

## The Chapters

- *The Presocratics: from Myth to Argument*: the Milesians to the atomists, Parmenides and Zeno, and how fragments are read.
- *Socrates and the Sophists*: the paid teachers of rhetoric, Socrates' cross-examination, his trial, and the Socratic problem.
- *Plato*: the Forms, the divided soul, the *Republic*, the *Symposium*, the Third Man, and whether he built a system.
- *Aristotle*: logic, substance, the four causes, the soul, biology, flourishing, and politics including slavery and women.
- *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*: the Cynics, the Stoa, Epicurus on death, the two sceptical traditions, and the Roman Stoics.
- *The Upanishads and the Beginnings of Indian Philosophy*: *ātman* and *brahman*, karma and rebirth, Gārgī and Maitreyī, dating, and the Bhagavad Gītā.
- *The Buddha and Early Buddhist Philosophy*: the four noble truths, non-self, rebirth without a self, the first nuns and the Abhidharma.
- *Jains, Ājīvikas and Materialists: India's Other Dissenters*: Jain non-violence and many-sidedness, Ājīvika fatalism, and the Cārvāka attack on inference.
- *Confucius, Mencius and Xunzi*: *ren*, *li*, government by virtue, the debate over human nature, and the texts' composition.
- *Mozi, the Daoists and the Legalists: the Hundred Schools*: Mohist inclusive care, the *Daodejing* and *Zhuangzi*, the disputers, and the *fa* tradition.

The story continues in *Late Antiquity and the Medieval World (c. 200 – 1450)*.

```checkpoint
q: The Stoics' "apraxia" objection to the Greek sceptics and the Nyāya reply to the Cārvāka have something in common. What is it?
a: Both claim that inference is never a source of knowledge.
x: That is the Cārvāka position as their opponents reported it, not the objection made against them.
a*: Both argue that the sceptic cannot consistently live, act or speak without relying on what he claims to doubt.
a: Both were made by Buddhist logicians.
x: The apraxia objection came from the Greek Stoics; the pragmatic reply quoted here is Phillips's paraphrase of the Nyāya logician Gaṅgeśa.
a: Both conclude that tranquillity follows suspension of judgement.
x: That is the Pyrrhonist sceptics' own claim, not an objection to them.
hint: Think about what each side says happens when the doubter opens his mouth or reaches for food.
why: The Stoics said that one who withholds assent cannot act; Nyāya said that the sceptic relies on generalisations when he voices his doubt. In both regions one answer was to narrow the doubt, to appearances or to inference beyond the perceptible.
---
q: Why might the dispute between Mencius and Xunzi be described as partly verbal, and why do the chapters think it is not merely verbal?
a: They used different words for "good", but agreed that human nature is good.
x: Xunzi explicitly says human nature is bad (e); the disagreement is not about the word "good".
a: Xunzi lived before Mencius and could not have known his views.
x: Xunzi was born around 310 BCE and attacked Mencius, who was probably long dead.
a: Both accepted that the virtues are innate sprouts, so they agreed in substance.
x: Xunzi explicitly denies that we have innate moral sprouts.
a*: They defined "nature" differently, but Xunzi denies innate moral sprouts and places the models of goodness outside the self.
hint: Compare what each takes xing to mean, then ask whether anything remains in dispute.
why: For Mencius xing is what a thing develops under healthy conditions; for Xunzi it is what we have at birth. Yet Xunzi still rejects the sprouts and locates goodness in the sages' rituals, so a real disagreement remains.
```

## Further exploration

- **James Warren, *Presocratics* (2007).** A short, clear introduction to the first Greek philosophers.
- **André Laks, *The Concept of Presocratic Philosophy* (2018).** How the category "Presocratic" was invented, and what it hides.
- **John Sellars, *Hellenistic Philosophy* (2018).** A thematic introduction to the period covering all the schools.
- **Mark Siderits, *Buddhism as Philosophy* (2nd ed., 2021).** The analytic case for reading Buddhist thought as philosophy.
- **Ethan Mills, *Three Pillars of Skepticism in Classical India* (2018).** Nāgārjuna, Jayarāśi and Śrī Harṣa as sceptics, with comparisons to Western scepticism.
- **A. C. Graham, *Disputers of the Tao: Philosophical Argument in Ancient China* (1989).** The classic account of the Hundred Schools as a single argument.
- **Michael J. Hunter, *Confucius beyond the Analects* (2017).** The case against treating the *Analects* as the authoritative core of Confucius's teaching.$ancientoverview_master$,
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
  select $ancientoverview_quiz$[
    {"type": "mcq", "prompt": "According to the Presocratics chapter, what was most new about the early Greek thinkers?", "options": ["They abandoned all belief in gods", "They were the first people anywhere to study the stars", "They gave reasons for their claims that a rival could examine and dispute", "They wrote complete books that survive intact"], "answerIndex": 2, "explanation": "Thales thought all things full of gods and Parmenides presented his argument as a goddess's revelation, so the gods did not vanish. What was new was the giving of reasons open to criticism. No complete Presocratic work survives, and Babylonian astronomy was older.", "id": "q1"},
    {"type": "mcq", "prompt": "Which pair is correctly matched with its source problem?", "options": ["The Ājīvikas: known almost entirely through Buddhist and Jain rivals", "Plato: known only through fragments quoted by later writers", "Mencius's rival Gaozi: known from his own surviving book", "The Buddha: his teachings were written down in his lifetime"], "answerIndex": 0, "explanation": "The Ājīvika scriptures are lost, so their doctrine reaches us through hostile traditions. Plato's complete works are believed to survive; Gaozi is known only from the Mencius; and the Buddha's teachings were passed on orally for at least three centuries.", "id": "q2"},
    {"type": "mcq", "prompt": "The Buddha's argument from control concludes that there is no self. Which school drew the opposite conclusion from the same facts about control?", "options": ["The Cārvāka materialists", "The Sāṃkhya school, which held that control shows a controller beyond the aggregates", "The Mohists", "The Epicureans"], "answerIndex": 1, "explanation": "The argument is valid only if a person is nothing but the five aggregates. Sāṃkhya rejected that hidden premise and inferred a self that transcends all possible experience.", "id": "q3"},
    {"type": "mcq", "prompt": "Which objection was pressed both against Protagoras' 'man is the measure' and against the Jain doctrine of many-sidedness?", "options": ["That it denies the existence of the gods", "That it makes action impossible", "That it confuses colour with shape", "That it refutes itself: by its own standard, it may be false"], "answerIndex": 3, "explanation": "Protagoras faced the self-refutation (peritropē) argument: those who judge his doctrine false must be right by his own lights. Critics of anekāntavāda argued that if every claim is only 'perhaps' true, so is the doctrine itself.", "id": "q4"},
    {"type": "open", "prompt": "Compare how Plato, the Buddha and Mencius or Xunzi each reason from a fact about inner experience to a conclusion about the person. Where does each argument depend on a definition or hidden premise?", "rubric": "A strong answer reconstructs Plato's argument from inner conflict (the same thing cannot undergo opposites in the same respect; thirst and refusal coexist; so the soul has parts); the Buddha's argument from control (a self could never be desired to change; every aggregate can be; so no self, given the hidden premise that a person is only the aggregates, which Sāṃkhya rejected); and Mencius's child at the well (spontaneous compassion as a sprout, nature as what develops under healthy conditions) or Xunzi's reply (nature as what we have at birth; desires lead to disorder; goodness is artifice). It notes Graham's point that Mencius and Xunzi define xing differently, and the reply that Xunzi still denies innate sprouts. Credit noting that psuchē, ātman and xing are not the same concept.", "id": "q5"},
    {"type": "open", "prompt": "Does the 'Axial Age' idea help or mislead a reader of this section? Use the chapters' evidence about dates and contacts.", "rubric": "A strong answer explains that the label points to new kinds of thought in Greece, India and China in roughly the same centuries, and that the Presocratics chapter calls it disputed. It uses the dating evidence: the Buddha moved about a century later after the 1988 Göttingen symposium; Olivelle's warning that Upanishadic dating closer than a few centuries is a 'house of cards'; Confucius's traditional dates and the debated late compilation of the Analects. It weighs contacts: Babylonian contributions to Greek knowledge (debated), the rejected claim that Greek philosophy came from Egypt, the debate over Pyrrho in India, and the Milindapañha's lack of Greek influence. It reaches a reasoned verdict, for example that the label is useful for setting the traditions side by side but misleading if it implies precise synchrony or a single cause.", "id": "q6"}
  ]$ancientoverview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
