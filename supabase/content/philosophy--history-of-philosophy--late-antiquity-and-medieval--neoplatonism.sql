-- Plotinus and Neoplatonism — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/neoplatonism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/neoplatonism',
    'research',
    'advanced',
    'read',
    $neoplatonism_master$> **The last great school of ancient philosophy, and one of its longest afterlives.** This chapter follows Plotinus (204/5–270 CE) and the Platonists who came after him: his system of three realities, the One, Intellect and Soul; the "procession and return" by which everything comes from the One and turns back to it; and the soul's own return through virtue and contemplation. It sets out step by step his argument that the first principle must be absolutely simple, with two objections, and his account of evil as privation, with Proclus' objection. It then follows Porphyry, Iamblichus, Hypatia and Proclus, the end of the Athenian school in 529, and the routes by which this philosophy entered Christian, Islamic and Jewish thought.

## Platonists, Not "Neoplatonists"

No one in antiquity called himself a Neoplatonist. The word was invented by European scholars in the early nineteenth century to mark Plotinus as the start of a new phase. Plotinus and his successors called themselves simply "Platonists", as the chapter on *Plato* notes, and Plotinus saw himself as an expositor of Plato, not a "new" Platonist. The Stanford Encyclopedia of Philosophy calls the label "to some extent a misnomer": their project was a grand synthesis of almost the whole Greek tradition, Aristotle included, rejecting only Epicureanism and the Stoic claim that everything real is a body. Nor was there one school, only several over some three centuries; later talk of an unbroken "golden chain" of teachers was a claim, not a fact. Even the end-date is a convention: one standard account runs to the Arab conquests of the seventh century, another stops at 529.

## Plotinus' Life

Almost everything we know about Plotinus comes from his pupil Porphyry, who edited his writings and prefaced them, probably in 301, with a *Life of Plotinus* that scholars treat as broadly reliable. Porphyry says only that Plotinus was "a native of Egypt"; a later source names a place that may be Lycopolis (modern Asyut). Plotinus never spoke of his ancestry or childhood, and whether he was a Hellenised Egyptian, a Greek or a Roman is speculation.

{{image: Plotinus | A white marble head, often identified as Plotinus. The identification is plausible but not proven: Porphyry says Plotinus refused to have his portrait painted.}}

At 28, around 232, he turned to philosophy in Alexandria. Every teacher disappointed him until a friend took him to Ammonius Saccas, and he said, "this is the man I was looking for". He stayed eleven years. Ammonius is one of the most enigmatic figures of ancient philosophy: he apparently published nothing, and even the meaning of his surname and the claim that he came from India are disputed. In 243 Plotinus joined the emperor Gordian III's campaign against Persia because, Porphyry says, he wanted to learn the wisdom of the Persians and the Indians. Gordian died on campaign, probably murdered, and Plotinus escaped with difficulty to Antioch. There is no evidence that Indian thought influenced him. Modern scholars have compared him with the Indian non-dualist school of Advaita Vedānta (J. F. Staal's *Advaita and Neoplatonism*, 1961), and Radhakrishnan and Coomaraswamy drew on Plotinus to explain Indian monism; these are comparisons, not proof of contact, worth setting beside *The Upanishads and the Beginnings of Indian Philosophy*.

Late in 244 Plotinus settled in Rome, where he taught for more than 25 years. A session began with readings from commentaries on Plato and Aristotle, then turned to the "difficulties" they raised, then to his own analysis. His circle included Porphyry, Amelius, the doctor Eustochius, several senators, and women: Gemina, in whose house he lived, her daughter, also Gemina, and Amphiclea. The emperor Gallienus and his wife Salonina honoured him, and he asked them to rebuild a ruined town in Campania as a city of philosophers governed by Plato's *Laws*; the plan came to nothing. He began writing only around 253, at about fifty, and his treatises were "reminders" of classroom discussion, which he would not revise. He died in 270 in seclusion on an estate in Campania. (Porphyry was then in Sicily; Plotinus did not die there, despite a common confusion.)

Porphyry arranged the 54 treatises, splitting and joining some to reach that number, into six sets of nine: the *Enneads*, from the Greek *ennea*, "nine". They run from ethics, through the physical world, to Soul, Intellect and finally the One, from easier to harder.

## The One, Intellect and Soul

Plotinus' system has three realities beyond the senses, which scholars call **hypostases** (the Greek word, roughly "what stands its ground", later gained new meanings in Christian debates about the Trinity). They are the One, Intellect and Soul.

The **One**, also called the Good, is absolute unity. Plotinus identified it with the One of Plato's *Parmenides* and with the Form of the Good, which the *Republic* places "beyond being". Because every predicate names something a being is, no predicate fits the One: it can be described only negatively, by saying what it is not, and all positive talk of it is metaphor. Yet he calls it "the power of all things", identical with its own unconstrained will.

**Intellect** (*nous*) is a "one-many". It contains the Platonic Forms, the perfect patterns of things, but for Plotinus these are not inert abstractions: they are living intellects, the thoughts of a universal mind. Intellect is identical with what it thinks, so it grasps everything at once rather than step by step, as we see a face before we analyse it.

**Soul** is the outward activity of Intellect, carrying images of the Forms into the world below. The sensible world rests in Soul, not the other way round. Below Soul comes Nature, a silently contemplative aspect of soul that produces the natural world, and at the very bottom **matter**, where the chain gives out like darkness at the edge of light: formless and passive, "no thing", but not simply nothing.

Two points set this apart from the religions that later borrowed it. It is not a story of creation: the world comes from the One eternally, without a beginning in time. And the world is good. In the treatise usually called "Against the Gnostics", full title "Against those who say that the maker of the world is evil and the world is evil", Plotinus defended the goodness and beauty of the cosmos against those who thought it the work of a foolish or malevolent maker.

## Procession and Return

How does anything come from the One? The usual modern word is "emanation", which the overview *The History of Philosophy* also uses; but the scholar Christian Wildberg warns that it is misleading, with "obviously materialist connotations", as if something leaked out. The Neoplatonists spoke instead of **procession** (*proodos*) and **return** (*epistrophē*), and nothing spatial or material is meant.

The mechanism is what scholars call the theory of two activities. Everything has an internal activity that makes it what it is, and an external activity that flows from it, as heat flows from fire, without diminishing the source. Behind this lies a **principle of plenitude**: any real possibility must be realised, so the One's power necessarily overflows. What proceeds is at first indeterminate. It becomes a new reality by turning back towards its source and contemplating it: Intellect is formed by looking back to the One, Soul by looking back to Intellect. Add "abiding" (*monē*), the source's remaining what it is, and you have the triad later Platonists made central: abiding, procession and return. What drives the return is love (*erōs*): every level strives towards the Good.

## Why the First Principle Must Be Simple

Why put an unknowable One at the top, rather than a divine mind? Plotinus' answer is an argument about explanation, assembled here from the treatises the Stanford Encyclopedia cites:

1. Whatever is prior to something, and explains it, must be simpler than it. A cause more complex than its effect would not account for the effect; it would itself need explaining.
2. Every multiplicity is made of parts, each of which is one, and is gathered into a whole by some single unifying factor. So every "many" presupposes unity.
3. So unity is prior to multiplicity, logically and therefore in reality.
4. If the first principle were composite in any way, it would presuppose its parts and whatever unifies them, and so would not be first.
5. Therefore the first principle is utterly uncompounded: the absolute One.

Two conclusions follow. Lacking nothing, the One is self-sufficient, the Good that everything else seeks. And since every predicate names something a being is, it is "beyond being", approachable only by negation and analogy.

**The first objection** is the one the Stanford Encyclopedia calls "the fundamental challenge all Neoplatonists struggled to meet": if the One is perfectly simple and does nothing, how can a diverse world come from it? The reply is the theory of two activities and the principle of plenitude. Perfect things overflow, as fire gives off heat or the sun light, without losing anything. What proceeds is other than the One, and so already multiple; turning back to its source, it becomes Intellect, the one-many. Proclus later refined the reply with a "law of mean terms": a cause produces things like itself before things unlike it, so the chain of reality has no leaps.

**The second objection** is a paradox of language. If no predicate applies to the One, then calling it "the One", "the Good", a "cause" or even "beyond being" already says something about it. Plotinus felt this keenly and wrestled repeatedly with the limits of thought and words. His reply is that these names are pointers, not descriptions: reasoning can bring us towards the One, but reaching it is a matter of experiential contact, not of a true sentence. Not everyone was satisfied. Iamblichus placed a "wholly unspeakable" principle above the causal One, and Damascius, the last head of the Athenian school, pressed the objection furthest, asking whether such a principle can coherently be called a cause, or a One, at all. *What Exists? Ontology and Universals* and *God: Arguments For and Against* take up the wider questions.

```checkpoint
q: Why does Plotinus hold that the first principle must be absolutely simple?
a*: Because every multiplicity presupposes unity, so anything composite would depend on its parts and would not be first.
a: Because Plato's dialogues say so explicitly.
x: Plotinus draws on Plato, but this argument turns on what explanation requires, not on authority.
a: Because a simple principle is easier for human minds to know.
x: The opposite: the One is beyond being and cannot be grasped by any predicate.
a: Because the world was created at a moment in time.
x: For Plotinus the world comes from the One eternally, with no beginning in time.
hint: Ask what a composite thing depends on.
why: A cause more complex than its effect would itself need explaining; every many is made of ones and unified by something, so unity comes first.
---
q: What does Christian Wildberg's warning about the word "emanation" concern?
a: That Plotinus never wrote about how things come from the One.
x: He wrote a great deal about it; the issue is the word.
a: That the word was invented by Augustine.
x: Nothing in the warning concerns Augustine; it concerns the word's connotations.
a*: That it suggests something material leaking out, whereas the Neoplatonists spoke of procession and return.
a: That the One loses some of its power whenever something proceeds from it.
x: The theory of two activities says the source is not diminished.
hint: Think of what flows out of a pipe.
why: Wildberg says "emanation" has "obviously materialist connotations"; the ancients spoke of proodos and epistrophē, and nothing spatial is meant.
```

## Evil as Privation

If everything comes from the Good, where does evil come from? Plotinus answered in the treatise "On the Nature and Source of Evil". Step by step:

1. Everything real comes from the Good, and what proceeds from the Good cannot be a source of evil.
2. Matter, the lowest limit of procession, has no form at all: it is pure lack, or **privation**, of form, and as non-being it has no power to act.
3. Moral evil arises when the soul turns downward and is misled by the reflections of goodness that appear in matter.
4. So evil does not come "from above", and there is no independent evil principle.

The last step was aimed at dualists such as the Gnostics and Manichaeans, for whom good and evil were rival powers. Matter, for Plotinus, is the primary cause of evil because it is complete privation, but it is only the precondition of wickedness, not an agent.

**Proclus' objection**, in a whole treatise *On the Existence of Evils*, was that this makes matter evil, yet matter is itself produced, ultimately from the Good; so the Good would be the cause of evil. And calling matter evil does not explain why souls go wrong. His alternative was that evil has no cause and no proper existence of its own, only a "parasitic existence" (*parhypostasis*): it is an unintended by-product of actions aimed at some good. Augustine, independently, also held evil to be a privation of good, as *Augustine and Early Christian Philosophy* explains. Proclus' version reached the Middle Ages through the writer known as Pseudo-Dionysius, and through him dominated medieval discussion. *The Problem of Evil* follows the question to the present.

## The Soul's Return

For Plotinus the human soul shares in the movement of return. Not all of it ever left: something of each soul stays "undescended" in the intelligible world. Porphyry's *Life* opens by saying Plotinus "seemed ashamed of being in the body", though scholars debate whether Porphyry overstated this.

The way back is a ladder of virtues: "civic" virtues regulate the body's impulses, "purificatory" virtues free the soul from concern with the body, "theoretical" virtues follow, and above them stand the patterns of the virtues in Intellect itself. Living by them makes a person "resemble God". The goal was not ordinary civic goodness but deification. At the top, a soul prepared by purification can reach a complete experiential "union" or "contact" with the One, which scholars call *henōsis*. Porphyry reports that Plotinus attained it four times while he knew him. The *Enneads*, in Porphyry's arrangement, end with the words *phugē monou pros monon*, in Armstrong's translation "the flight of the alone to the alone".

That phrase has often been used to contrast a solitary pagan mysticism with Christian community. The scholar Kevin Corrigan calls the contrast "simply false or too simplistic": Plotinus' mysticism is not "solitary" in the sense often supposed. Whether he was a "mystic" at all is controversial, partly because no one agrees what the word means; Edward Moore says the label "fails to express the philosophical rigor of his thought". Plotinus' last words, as Porphyry reports them, state the same aim, though the wording varies by translator: one version is "to bring back the god in us to the divine in the All".

## Porphyry and Iamblichus

Porphyry (c. 234 – c. 305), probably from Tyre in Phoenicia, studied with Plotinus in Rome from 263 to 268, first writing a refutation of his teacher and then recanting before the class. Late in life he married Marcella, a widow with seven children, justifying it by her philosophical nature. His *On Abstinence from Animal Food* defends vegetarianism partly on grounds of justice to animals. He was the first Platonist to comment on Aristotle, holding that Plato and Aristotle agreed on essentials. In the preface to his short *Isagoge* ("Introduction") he declined three questions as too deep for beginners: whether genera and species exist or are only concepts; if they exist, whether they are bodies; and whether they are separate from sensible things or in them. Through Boethius' Latin translation these questions fixed the terms of the medieval problem of universals, taken up in *Early Scholasticism: Anselm, Abelard and the Universities*. His *Against the Christians*, which among other things dated the Book of Daniel after the events it "predicted", is lost, known only from Christian refuters and repeatedly ordered destroyed.

Iamblichus (c. 242 – c. 325), a Syrian, founded a school at Apamea. He rejected the undescended soul: the soul descends entirely, changed even in its essence, and so needs the gods' help. Hence **theurgy** ("god-work"): ritual prayer, offering and sacrifice, which he ranked above discursive philosophy for the soul's salvation. It was not magic, since the gods cannot be compelled, and scholars now resist reading his quarrel with Porphyry simply as religion against philosophy. An alleged oracle summed up later opinion: "the Syrian is inspired, the Phoenician is (only) learned". Women philosophers appear in these circles too, such as Sosipatra of Pergamon, philosopher and seer, known from the biographer Eunapius. The emperor Julian, who died in 363, was himself a Neoplatonist, but after him the pagan revival could not withstand Christianity.

## Hypatia of Alexandria

Hypatia (born c. 350–370, murdered 415), philosopher, astronomer and mathematician, taught the Neoplatonism of Plotinus rather than of Iamblichus. All her known students were Christians, among them Synesius of Cyrene, later a bishop, and the church historian Socrates Scholasticus says she "succeeded to the school of Plato and Plotinus". No philosophical writing of hers survives. In March 415 a Christian mob killed her, against the background of a feud between the prefect Orestes, whom she advised, and Bishop Cyril. Socrates presents the murder as political; no concrete evidence ties Cyril to it directly, though many believed he was responsible. Much of her modern fame is legend. The Library of Alexandria had ceased to exist in any recognisable form centuries before her birth, so her death had nothing to do with its burning; she did not invent the astrolabe; and the theory that she died over the date of Easter is dismissed by historians such as Alan Cameron and Edward Watts.

## Proclus and the School at Athens

In the early fifth century a Platonist school was revived in Athens under Plutarch of Athens. Its heads called themselves "successors" of Plato, but it was a new foundation: Plato's own Academy, whose sceptical phase *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* describes, had ended in the first century BCE.

**Proclus** (412–485), born in Constantinople, came to Athens at 18 and led the school for almost fifty years. His day began with a prayer to the sun; he practised theurgy, which, his biographer Marinus says, he learned from Plutarch's daughter Asclepigenia; and he once spent about a year in exile to avoid anti-pagan trouble. His *Elements of Theology* proves some two hundred propositions in the style of Euclid's geometry, establishing the One as ultimate cause and then treating gods, intellects and souls. At its heart is the triad Plotinus had sketched:

```quote
"Every effect remains in its cause, proceeds from it, and reverts upon it."
Proclus · Elements of Theology, proposition 35 (trans. E. R. Dodds) · fifth century CE
```

Proclus kept the three hypostases but criticised Plotinus, rejecting the One as cause of itself, the undescended soul and the identification of evil with matter. Between the One and everything else he placed the **henads** ("unities"), through which the traditional gods found a place in the metaphysics of the One. Hegel called Proclus "the culminating point" of Neoplatonic philosophy.

```checkpoint
q: What was Proclus' objection to Plotinus' account of evil?
a: That evil is an independent power rivalling the Good.
x: Proclus, like Plotinus, rejected any independent evil principle.
a*: That making matter evil makes the Good its cause, since matter is produced; evil is instead a by-product of actions aimed at good.
a: That evil is an illusion caused by the senses.
x: Proclus gave evil a "parasitic existence", not the status of an illusion.
a: That evil comes from the theurgic rites of rival schools.
x: Theurgy, for Proclus, was a way to the divine, not a source of evil.
hint: Ask where matter itself comes from.
why: Matter is produced, ultimately from the Good, so calling it evil makes the Good the cause of evil; Proclus gives evil only a parasitic existence (parhypostasis).
---
q: Which statement about the Athenian school that ended in 529 is accurate?
a: It was the Academy Plato founded, in continuous operation since his time.
x: Plato's Academy ended in the first century BCE; the later school claimed succession without continuity.
a: Its closure ended the teaching of Greek philosophy everywhere.
x: Philosophy went on being taught in Alexandria and Constantinople to the end of the sixth century.
a: Its last members settled at Harran, where the school is known to have survived.
x: Where they went after 532 is unknown; the Harran theory is unproven.
a*: It was a fifth-century Platonist foundation whose heads called themselves Plato's successors.
hint: When was Plutarch of Athens active?
why: The school was revived in the early fifth century under Plutarch of Athens; its link with Plato's Academy was a claim, not an institutional fact.
```

## The End of the Athenian School

The usual story is that in 529 Justinian (reigned 527–565) "closed the Academy". It rests chiefly on the chronicler Malalas, who says Justinian ordered "that no one was any longer allowed to teach philosophy and astronomy", probably aimed at non-Christians such as Neoplatonists and Manichaeans; a related law allowed only the orthodox to teach and receive public salaries. The historian Edward Watts argues that the evidence is thin, other sources are silent, the edict was probably not aimed specifically at Athens, and contemporaries did not treat it as dramatic. *Byzantium: the Empire of New Rome* describes Justinian's reign, and *The Fall of the Roman Empire* the world before it.

Seven philosophers led by Damascius, among them Simplicius, went to the court of the Persian king Khosrow I, having heard he was a philosopher-king. Disappointed, they left, and the Roman–Persian treaty of 532 guaranteed that they might return home and live in safety "without being forced to adopt opinions which they did not hold". Where most of them went next is unknown; a theory that they founded a lasting school at Harran has been influential but is unproven. Nor did philosophy end in 529. Greek philosophy went on being taught in Alexandria and Constantinople to the end of the sixth century, by teachers who had embraced or come to terms with Christianity, because Christian theology needed its logic and ontology.

## Afterlives: Christian, Islamic and Jewish

Christian thought was formed by these Platonists early. Augustine read "the books of the Platonists" in Latin translation in Milan in 386, and they precipitated his conversion; whether he read mainly Plotinus or Porphyry was hotly debated, and most scholars now accept some of both. Boethius, executed in 524 (or possibly 526), translated Porphyry's *Isagoge*, which became the standard medieval textbook. Most influential of all was a writer who posed as Dionysius the Areopagite, Paul's Athenian convert, and wrote between Proclus' death and the 520s, probably as a pupil of Proclus. His *Divine Names* and *Mystical Theology* carried Proclus into the Church; Eriugena translated him into Latin in the ninth century, Aquinas read him, and the triad of abiding, procession and return may be said to structure Aquinas' *Summa*. As Dodds put it, "Proclus was [...] conquering Europe in the guise of an early Christian." In Byzantium Michael Psellos studied Proclus, and his pupil Ioane Petritsi translated the *Elements* into Georgian.

In the Islamic world Plotinus arrived under another name. In the circle of al-Kindī, probably in the 830s or 840s, parts of *Enneads* IV–VI were reworked in Arabic as the *Theology of Aristotle*: "an interpretation or reworking of Plotinus, and not just a translation", in which the One became a creating God, described as "pure being". Whether the circle really thought it was Aristotle's is doubted; perhaps they saw Plotinus as completing Aristotle. The same circle adapted Proclus' *Elements* as what Latin readers called the *Book of Causes*, which passed in the West as Aristotle's until Aquinas recognised its source. Al-Kindī himself argued that God is a simple "true One", in a work that defends learning from foreigners:

```quote
"We must not be ashamed to admire the truth or to acquire it, from wherever it comes."
al-Kindī · On First Philosophy (trans. Peter Adamson) · ninth century CE
```

Al-Fārābī, Avicenna (who doubted the *Theology*'s authenticity yet annotated it), Suhrawardī and later Mullā Ṣadrā all drew on this Arabic Plotinus, as *Falsafa: al-Kindī, al-Fārābī and Avicenna* explains. Jewish philosophy received it by the same route. Isaac Israeli in the tenth century drew on the Arabic Plotinus, and Solomon ibn Gabirol wrote the *Fountain of Life* in Arabic, a "modified Plotinian universe"; Latin readers knew him as "Avicebron" and took him for a Muslim or a Christian until the nineteenth century. Maimonides, too, received Neoplatonic thought through the *Theology*, as *Jewish Philosophy: from Saadia to Maimonides* describes. In all three religions one point stuck: the pagan Platonists' world had no beginning, and scripture spoke of creation.

The Renaissance revived these Platonists directly. Gemistos Plethon, Bessarion and above all Marsilio Ficino, who in the late 1480s made the first full Latin translation of Plotinus, put them back at the centre of European thought, as *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne* explains. The Cambridge Platonists, Leibniz, Hegel and Bergson all show their influence.

## Further exploration

- **Dominic J. O'Meara, *Plotinus: An Introduction to the Enneads* (1993).** The short standard introduction to Plotinus' thought.
- **Pierre Hadot, *Plotinus or the Simplicity of Vision* (1993).** The classic account of Plotinus' philosophy as a spiritual life, translated by Michael Chase.
- **Peter Adamson, *Philosophy in the Hellenistic and Roman Worlds* (2015).** A lively survey with chapters on Plotinus, Porphyry, Iamblichus, Proclus and Hypatia's world.
- **Radek Chlup, *Proclus: An Introduction* (2012).** A modern introduction to Proclus' philosophy.
- **Edward J. Watts, *Hypatia: The Life and Legend of an Ancient Philosopher* (2017).** Separates the evidence about Hypatia from the legend.
- **Peter Adamson, *The Arabic Plotinus: A Philosophical Study of the "Theology of Aristotle"* (2002).** How Plotinus became "Aristotle" in Arabic.
- **Mark Edwards, *Neoplatonic Saints: The Lives of Plotinus and Proclus by their Students* (2000).** The ancient lives of both philosophers in translation.$neoplatonism_master$,
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
  select $neoplatonism_quiz$[
    {"type": "mcq", "prompt": "What did the philosophers we now call 'Neoplatonists' call themselves?", "options": ["Platonists", "New Academics", "Neoplatonists", "Gnostics"], "answerIndex": 0, "explanation": "'Neoplatonism' is a modern label from early nineteenth-century scholarship; Plotinus and his successors called themselves Platonists and saw themselves as expositors of Plato.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about Plotinus' life is supported by the evidence?", "options": ["He died in Sicily, where he had retired in 268", "He was certainly born at Lycopolis and was of Indian descent", "He joined Gordian III's campaign against Persia, hoping to learn Persian and Indian wisdom", "He founded the Athenian school that Justinian closed"], "answerIndex": 2, "explanation": "Porphyry reports the Persian expedition of 243 and its motive. Plotinus died in Campania (it was Porphyry who was in Sicily); his birthplace is uncertain; the Athenian school was a fifth-century foundation.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the 'theory of two activities' meant to explain?", "options": ["Why the soul needs theurgic ritual", "How a diverse world can proceed from the One without diminishing it", "Why Plato and Aristotle disagreed", "How the world began at a moment in time"], "answerIndex": 1, "explanation": "Each thing has an internal activity and an external one that flows from it, like heat from fire, without loss to the source; this answers the challenge of how many come from the simple One. The procession is eternal, not a beginning in time.", "id": "q3"},
    {"type": "mcq", "prompt": "Which work, circulating in Latin as Aristotle's, was an Arabic adaptation of Proclus' Elements of Theology?", "options": ["The Theology of Aristotle", "The Isagoge", "The Fountain of Life", "The Book of Causes (Liber de causis)"], "answerIndex": 3, "explanation": "The Book of Causes came from al-Kindī's circle and passed as Aristotle's until Aquinas recognised its source in Proclus. The Theology of Aristotle reworked Plotinus' Enneads IV–VI.", "id": "q4"},
    {"type": "open", "prompt": "Set out Plotinus' argument that the first principle must be absolutely simple, then explain one objection and the reply to it.", "rubric": "A strong answer reconstructs the argument: what is prior and explanatory must be simpler than what depends on it, since a more complex cause would itself need explaining; every multiplicity is made of parts that are each one and is unified by something single, so every many presupposes unity; unity is therefore prior to multiplicity; a composite first principle would presuppose its parts and their unifier and so would not be first; so the first is the absolute One, self-sufficient, the Good, and beyond being. It then gives either (a) the objection that a simple, inactive One cannot explain a diverse world, with the reply from the theory of two activities and the principle of plenitude (perfect things overflow without loss, what proceeds is other and so multiple and becomes Intellect by turning back), perhaps adding Proclus' law of mean terms; or (b) the ineffability paradox, that naming the One already says something of it, with the reply that names are pointers and contact is experiential, noting that Iamblichus and Damascius pressed the problem further.", "id": "q5"},
    {"type": "open", "prompt": "Compare Plotinus' and Proclus' accounts of evil, and explain why the 'flight of the alone to the alone' should not simply be read as a solitary mysticism.", "rubric": "A strong answer explains that for Plotinus everything comes from the Good; matter, the last limit of procession, is complete privation of form and powerless, the precondition of moral evil when the soul is misled by reflections of goodness in matter; so there is no independent evil principle, against Gnostic and Manichaean dualism. It gives Proclus' objection in On the Existence of Evils: matter is itself produced, ultimately from the Good, so calling it evil makes the Good the cause of evil, and it does not explain wicked souls; evil instead has only a parasitic existence (parhypostasis), a by-product of actions aimed at good, passed to the Middle Ages through Pseudo-Dionysius. It notes Augustine's independent privation view. On the phrase, it attributes the wording to Armstrong's translation of the last words of the Enneads (phugē monou pros monon) and reports Corrigan's judgement that contrasting it with Christian community is 'simply false or too simplistic', and that whether 'mystic' fits Plotinus is itself debated.", "id": "q6"}
  ]$neoplatonism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/neoplatonism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
