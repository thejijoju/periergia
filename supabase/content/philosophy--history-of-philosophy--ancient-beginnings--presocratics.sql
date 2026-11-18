-- The Presocratics: from Myth to Argument — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/presocratics @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/presocratics',
    'research',
    'advanced',
    'read',
    $presocratics_master$> **From stories about gods to reasons a rival could dispute.** In the sixth and fifth centuries BCE a scattered group of Greek thinkers began to explain the world by its own principles and, just as importantly, to back their claims with arguments others could test. This chapter follows them from Miletus to Italy and Sicily: the Milesians, Xenophanes and Pythagoras, Heraclitus, Parmenides' argument against coming-to-be, Zeno's paradoxes, and the answers of Empedocles, Anaxagoras and the atomists. It explains why we know them only from fragments quoted by later writers, and why the story of a march "from myth to reason" is itself debated.

## Philosophers Before Philosophy

The Stanford Encyclopedia of Philosophy describes the Presocratics as "6th and 5th century BCE Greek thinkers who introduced a new way of inquiring into the world". The label is modern, coined in the eighteenth century and made current by Hermann Diels in the nineteenth, to contrast Socrates' moral questions with predecessors supposedly concerned only with the cosmos. It fits badly: the last of them were contemporaries of Socrates and even Plato, several wrote about ethics, and "pre-" suggests a warm-up act. Patricia Curd defines them instead as the early Greek thinkers not influenced by Socrates; André Laks and Glenn Most prefer "early Greek philosophy".

Their inquiries spanned what we now split into the sciences, theology, ethics and philosophy. Aristotle called them *physiologoi*, "inquirers into nature", as against the *theologoi* who told stories of the gods. What united them, in Curd's words, was perhaps "the commitment to explain the world naturalistically, in terms of its own inherent principles".

## Reading from Fragments

No complete work by any of them survives. We have **fragments** (passages later writers quoted, apparently word for word) and **testimonia** (later reports of what someone thought or how they lived), and every source chose its material for its own purposes. Parmenides' poem was perhaps 800 lines long; about 160 survive. Heraclitus is known from a little over a hundred fragments, Anaximander from one.

The chain runs through Aristotle, his pupil Theophrastus, and the sixth-century CE commentator Simplicius, who still had some original texts. Simplicius copied out a long stretch of Parmenides "because of the scarcity of Parmenides' treatise", which is why we appear to have his whole central argument. Behind much of the tradition lies **doxography** (from Greek *doxa*, "opinion"): handbooks summarising earlier views topic by topic. Biographers such as Diogenes Laertius (third century CE) are useful but uncritical, and many of their stories seem invented to fit the philosophers' writings.

Modern readers cite Diels's collection *Die Fragmente der Vorsokratiker* (1903, later revised by Walther Kranz), which numbers each thinker's evidence as "A" (testimonia) or "B" (fragments): "Heraclitus B12" is his twelfth fragment. And the evidence is still growing: the Derveni Papyrus, found in 1962 in a tomb in northern Greece, quotes Heraclitus, and a papyrus identified in Strasbourg in 1994 added unknown lines of Empedocles.

## The Milesians: Water, the Boundless and Air

The story traditionally begins in Miletus, a trading city in Ionia, on the west coast of what is now Turkey. Its three thinkers are often presented as master and pupil in turn, though that may not be correct, and all their dates are approximate.

**Thales**, who seems to have lived around the beginning of the sixth century BCE, probably wrote no book. Aristotle names him the first to inquire into "causes and principles" and reports that he made water the first principle (*archē*) of things, guessing that water's role in nourishment and growth was the reason. Whether Thales meant that things come from water or still *are* water is disputed. Herodotus says he predicted a solar eclipse that halted a battle, but modern scholars doubt it: nobody then could predict where a solar eclipse would be seen. Thales is also reported to have said that "all things are full of gods" — these thinkers did not simply throw the gods out.

**Anaximander** (c. 610 – 546 BCE), said to be the first to write a treatise in prose, called the source of things *to apeiron*, "the boundless" or "the indefinite". His one fragment says that things "give penalty and recompense to one another for their injustice in accordance with the ordering of time". What matters most is that he argued. A passage in Aristotle that probably goes back to him runs: water, air and fire are opposites that act against one another; if any one were boundless it would long since have destroyed the others; they all still exist; so the source must be something other than any of them. As Dirk Couprie puts it, he "did not just utter apodictic statements, but also tried to give arguments. This is what makes him the first philosopher." He also explained why the earth does not fall: at the centre, at equal distances from everything, it has no more reason to move one way than another. This is often called the first known use of the **principle of sufficient reason**, the idea that nothing happens without a reason why it happens this way rather than that.

**Anaximenes** (died about 528 BCE) made air the basic stuff (Theophrastus suggests because a principle should be neutral without seeming to be nothing). He added a mechanism: rarefied, air becomes fire; condensed, it becomes wind, cloud, water, earth and stone. One process explained many differences.

## Gods, Numbers and Souls: Xenophanes and Pythagoras

**Xenophanes of Colophon** (c. 570 – c. 478 BCE), a wandering poet, turned the critical spirit on religion. Homer and Hesiod, he complained, gave the gods "theft, adultery, and mutual deception"; and people make gods in their own image.

```quote
But if horses or oxen or lions had hands or could draw with their hands and accomplish such works as men, horses would draw the figures of the gods as similar to horses, and the oxen as similar to oxen, and they would make the bodies of the sort which each of them had.
Xenophanes · Fragment B15 (trans. Michael Patzia) · 6th–5th century BCE
```

"Ethiopians say that their gods are snub-nosed and black; Thracians that theirs are blue-eyed and red-haired." He spoke of "one god greatest among gods and men", often read as early monotheism, though the plural "gods" in the same line makes that reading problematic. He said the rainbow goddess Iris "is by nature cloud". Yet he was modest about knowledge: no one has seen "the clear and certain truth", but "opinion is allotted to all".

**Pythagoras** (c. 570 – c. 490 BCE) left Samos for Croton in southern Italy around 530 BCE. He wrote nothing. The early evidence makes him famous not for mathematics but as an expert on the soul: it is immortal and passes into other living things, and all living beings are kin. He founded a strict way of life governing diet and ritual. Xenophanes mocked him for hearing a dead friend's soul in a barking dog. Of the famous theorem, the scholar Carl Huffman writes that there is "not a jot of evidence for a proof by Pythagoras"; the story rests on verses reported almost a thousand years later, and the Babylonians knew the rule long before. The mathematical cosmology of later Pythagoreans such as Philolaus, for whom "all things that are known have number", is usually dated after Pythagoras, though that consensus has been strongly challenged.

Pythagoreanism gave an unusually large role to women. A late catalogue lists 17 women among its members. The most famous, Theano, is variously called Pythagoras' wife, daughter or pupil; an early source says simply that she "became famous". Reliable evidence about her is thin, and the writings circulated under her name and other Pythagorean women's names are later works of uncertain authorship.

```checkpoint
q: Why does the scholar Dirk Couprie call Anaximander "the first philosopher"?
a*: Because he did not just state his view but tried to give arguments for it.
a: Because he was the first Greek to write about the gods.
x: Hesiod and Homer wrote about the gods long before; Couprie's point is about the form of Anaximander's thinking, not its subject.
a: Because he proved that the earth is a sphere.
x: Anaximander explained why the earth stays where it is, at the centre; he offered no proof about its shape.
a: Because he was the first to use the word "philosophy".
x: The story that a Greek coined the word "philosophy" is attached to Pythagoras, and it is rejected; Couprie's reason is quite different.
hint: Think about what Anaximander added to the bare claim that the source of things is "the boundless".
why: Anaximander argued that if one of the opposites were boundless it would have destroyed the others. Offering reasons that a rival could examine is what Couprie takes to mark the start of philosophy.
---
q: What does the early evidence suggest Pythagoras was mainly famous for in his own time?
a: Proving the theorem about right-angled triangles that bears his name.
x: No early source links him to the theorem; the story rests on verses reported almost a thousand years later, and the Babylonians knew the rule long before.
a: Discovering the musical ratios by listening to blacksmiths' hammers.
x: The hammer stories are described by scholars as clearly false; the ratios appear in the later Pythagorean Philolaus.
a*: Teaching about the soul's immortality and rebirth, and founding a strict way of life.
a: Writing the first prose book on nature.
x: Pythagoras wrote nothing; the first prose treatise is credited to Anaximander.
hint: Xenophanes mocked him for hearing a dead friend's voice in a dog's bark.
why: Early evidence presents Pythagoras as an authority on the soul, ritual and a disciplined way of life. His reputation as a mathematician is largely a later construction.
```

## Heraclitus: the River and the Logos

**Heraclitus of Ephesus**, active around 500 BCE, wrote one book of compressed, riddling sayings. He claims to speak according to the *logos* (account, word, argument): "it is wise to agree that all things are one." He stresses the unity of opposites: "Sea is the purest and most polluted water: for fish drinkable and healthy, for men undrinkable and harmful." The world is "everliving fire, kindling in measures and being quenched in measures", made by no god or human — the first surviving Greek use of *kosmos* for "world". And "War is father of all and king of all."

The saying "you cannot step into the same river twice" is not his wording but a paraphrase by Plato and later Plutarch. The fragment most scholars accept says something subtler:

```quote
On those stepping into rivers staying the same other and other waters flow.
Heraclitus · Fragment B12 (trans. Daniel W. Graham) · c. 500 BCE
```

On Daniel Graham's reading, the river stays the same river *because* its waters change: constancy through change, not mere flux. The slogan *panta rhei*, "everything flows", is not a fragment at all, and few modern scholars think he said it. Plato's reading still has defenders, so this remains a debate.

## Parmenides and the Problem of Change

**Parmenides of Elea**, south of Naples, was active in the early to mid fifth century BCE. His poem tells of a young man carried by chariot to a goddess who reveals two things: the way of "Truth" and "the beliefs of mortals", a cosmology she calls "deceptive".

{{image: Parmenides | A portrait head inscribed with Parmenides' name, made in the first century CE and found at Elea in the 1960s, centuries after his death.}}

There are, the goddess says, only two routes of inquiry: that something *is* and cannot not be, and that it *is not* and must not be. The second is "a path wholly without report", for you could neither apprehend "what is not" nor point it out. In simplified form, the argument against coming-to-be runs:

1. There are only two routes: what is (and cannot not be), and what is not (and must not be).
2. What is not cannot be known or pointed out, "for the same thing is for thinking and for being".
3. So what is not cannot be spoken of or thought.
4. If what-is came into being, it came either from what is not or from what is. Not from what is not (by 3); not from what is (it would already be). And what could have made it begin "later rather than before"?
5. Therefore what-is neither came to be nor will perish: "generation is extinguished and destruction unheard of".

He goes on to argue that what-is is whole, uniform, unmoving and complete, and tells mortals not to trust "aimless sight and echoing hearing" but to "judge by reason". The question in step 4, "why later rather than before?", is the same style of reasoning Anaximander used about the earth.

**The strongest objection.** Bertrand Russell and G. E. L. Owen held that the argument rests on a confusion about negative statements. Russell's paraphrase: when you think, you think of *something*, so whatever can be thought of must exist at all times, so there can be no change. But speaking of something that does not exist is not the same as speaking of nothing. On this view Parmenides traded on a puzzle, now called "Parmenides' paradox", rather than proving anything.

**A reply.** John Palmer reads "what is not" as short for "what is not *and must not be*": the impossible. One genuinely cannot conceive or point out a round square, so Parmenides makes a sound point about what *necessarily* is not, and does not fall into Russell's trap. The argument then concerns what must be; changing things still exist, as the goddess's cosmology describes, but cannot be objects of unwavering understanding. Palmer calls him "the first philosopher rigorously to distinguish what must be, what must not be, and what is but need not be".

Whether Parmenides thought change and plurality illusions is exactly what is disputed. Some read him as a strict monist (only one unchanging thing exists); others as setting conditions any fundamental entity must meet, compatible with many such entities; many ancient readers took reality to be one in account but many in perception. His cosmology was serious too: he recognised that the moon shines by light reflected from the sun.

## Zeno and the Paradoxes of Motion

**Zeno of Elea** (born about 490 BCE), Parmenides' close associate, reportedly wrote forty arguments; few survive, mostly in paraphrase. Aristotle preserves and names the paradoxes of motion. They are *reductios*: they assume an opponent's view for argument's sake and derive an absurdity. The **Dichotomy**:

1. To run from A to B, a runner must first reach the halfway point; before that, the quarter point; and so on without end.
2. So the run requires completing infinitely many shorter runs.
3. Infinitely many runs cannot be completed in a finite time.
4. So the runner never reaches B; and since nothing depended on this runner or distance, no motion is possible.

In the **Achilles**, swift Achilles never overtakes a tortoise with a head start, since whenever he reaches where it was, it has moved on.

**Objections.** Aristotle replied that the time divides just as the distance does, so each sub-run takes its own fraction of a finite total; he added a distinction between a run that is only *potentially* divisible and an actual infinite series of runs. The modern "standard solution" adds that some infinite series have finite sums, 1/2 + 1/4 + 1/8 + ... = 1, made rigorous in the nineteenth century. Premise 3 is false.

**Why it is not quite over.** Summing a series is not obviously the same as completing infinitely many *actions*; philosophers still argue about such "supertasks". And whether real space and time have the structure of the mathematical continuum is a question for physics. The chapter Paradoxes: the Liar, the Heap and Zeno takes this further.

Zeno's purpose is also debated. The conventional view, from Plato's *Parmenides*, is that he defended Parmenides' monism; but Plato's Zeno claims only "a sort of support", paying back Parmenides' mockers "with the same results and worse", and Jonathan Barnes thought Zeno simply "mocked the mockers". Aristotle called him the inventor of dialectic.

```checkpoint
q: The sentence "you cannot step into the same river twice" is best described as:
a: The exact wording of Heraclitus' best-attested fragment.
x: The fragment most scholars accept as genuine (B12) says that "other and other waters flow" on those stepping into rivers that stay the same; it does not say you cannot step in twice.
a*: A later paraphrase, found in Plato and Plutarch, of Heraclitus' thought.
a: A saying of Parmenides attacking Heraclitus.
x: The saying is attributed to Heraclitus, not Parmenides; it reaches us through Plato's Cratylus and Plutarch.
a: The meaning of Heraclitus' slogan "panta rhei".
x: "Panta rhei" is not a fragment either; few modern scholars think Heraclitus said it.
hint: Ask who first wrote these words down, and whether they claim to be quoting.
why: Plato and Plutarch paraphrase Heraclitus this way. The likely genuine fragment, B12, suggests rather that the river stays the same through its changing waters.
---
q: What is the main point of the modern "standard solution" to Zeno's Dichotomy?
a: Motion is an illusion, as Parmenides showed.
x: That would accept Zeno's conclusion rather than answer it.
a: Space is made of indivisible atoms, so the halving must stop.
x: That was the atomists' response to infinite divisibility, not the modern mathematical solution.
a: Diogenes the Cynic refuted it by standing up and walking.
x: Walking shows that motion happens but not where the argument goes wrong; as one scholar notes, it "would not impress Zeno".
a*: An infinite series of ever-shorter distances can add up to a finite total, so the run can be completed in finite time.
hint: Think about 1/2 + 1/4 + 1/8 + ...
why: The standard solution denies the premise that infinitely many sub-runs must take infinite time. Critics still ask whether infinitely many actions can really be completed, and whether real space is a mathematical continuum.
```

## Answering Parmenides: Empedocles, Anaxagoras and the Atomists

Ancient writers and most modern scholars read the next generation as answering Parmenides, though Palmer warns that the idea that he made change everyone's central problem "has no real ancient authority". Each accepted that nothing comes from nothing, and explained change another way.

**Empedocles of Acragas** in Sicily (born early in the fifth century BCE) wrote in Parmenides' metre. Four "roots" — earth, water, air, fire — are moved by Love, which unites, and Strife, which separates: "at one time they grew to be only one / Out of many, at another time again they separate to be many out of one." He also called himself "an immortal god, no longer mortal". The story that he leapt into Etna is legend.

**Anaxagoras of Clazomenae** (500–428 BCE), the first philosopher known to have lived in Athens, put it plainly: "no thing comes to be or passes away, but is mixed together and dissociated from the things that are." Everything has "a share of everything", and Mind (*nous*) set the original mixture spinning. Charged with impiety for calling the sun a red-hot stone, he left Athens. Aristotle said that, in making mind the cause of order, he "appeared as a sober man among the random chatterers who preceded him".

The **atomists**, Leucippus and Democritus (born about 460 BCE), embraced what Parmenides forbade: "what is not", the void, exists no less than body. Reality is endlessly many unchanging atoms (*atomos* means "uncuttable"), differing in shape, arrangement and position, moving in an infinite void; change is rearrangement. Leucippus reportedly reasoned that motion requires void, and there is motion, so there is void. Aristotle reports that the problem of endless divisibility led them to posit indivisible units, a possible answer to Zeno. Democritus: "By convention sweet and by convention bitter ... in reality atoms and void."

The period shades into the Sophists: Gorgias' *On Nature, or On What-Is-Not* argued that nothing meets Parmenides' demands, a story taken up in Socrates and the Sophists.

## From Myth to Argument?

This chapter's title echoes Wilhelm Nestle's *Vom Mythos zum Logos* ("from myth to reason", 1940). Curd contrasts Hesiod's "god-saturated" world with the Presocratic *kosmos*, "an ordered natural arrangement that is inherently intelligible and not subject to supra-natural intervention"; Barnes said they "changed the course of human thought from myth to philosophy and science". But Curd also notes that scholars disagree about how sharp the break was. Thales thought all things full of gods; Anaximander's cosmos runs on justice; Parmenides' argument is a goddess's revelation, modelled on initiation into mysteries; Empedocles called himself a god; the Pythagoreans were a religious community. F. M. Cornford argued in 1912 that this speculation grew out of religious thought, and a 1999 collection edited by Richard Buxton, *From Myth to Reason?*, questioned the whole polarity. A fair summary: what was new was less the dropping of the gods than the giving of reasons open to criticism.

Nor did the Greeks work alone. Ionian cities traded closely with Egypt and Mesopotamia, and Babylonian astronomy and mathematics contributed significantly to Greek knowledge. But some ancient travel stories were later attempts to claim eastern wisdom for Greek heroes, and the claim that Greek philosophy was simply taken from Egypt is rejected by most scholars, as the History chapter Ancient Greece discusses. What scholars generally treat as new is the argumentative form. In roughly the same centuries India and China saw new kinds of thought — Karl Jaspers' disputed "Axial Age" — explored in The Upanishads and the Beginnings of Indian Philosophy, The Buddha and Early Buddhist Philosophy, and Confucius, Mencius and Xunzi.

The legacy was immediate. Plato described his Forms in language echoing Parmenides and took Heraclitus as a model for the changing world of the senses (see Plato); Aristotle's theory of the continuum answered Zeno; the Stoics drew on Heraclitus. Much later Nietzsche, Heidegger and Karl Popper, in "Back to the Presocratics" (1958), returned to them.

## Further exploration

- **James Warren, *Presocratics* (2007).** A short, clear introduction to the whole period.
- **Patricia Curd and Daniel W. Graham (eds.), *The Oxford Handbook of Presocratic Philosophy* (2008).** Authoritative essays, including on the sources and the Near Eastern context.
- **Daniel W. Graham (ed. and trans.), *The Texts of Early Greek Philosophy* (2010).** The complete fragments and selected reports, Greek with facing English.
- **André Laks and Glenn W. Most (eds. and trans.), *Early Greek Philosophy* (2016).** The new nine-volume standard edition in the Loeb Classical Library.
- **André Laks, *The Concept of Presocratic Philosophy* (2018).** How the category "Presocratic" was invented, and what it hides; translated by Glenn W. Most.
- **M. M. Sassi, *The Beginnings of Philosophy in Greece* (2018).** How philosophy emerged from its cultural setting.
- **Dorota Dutsch, *Pythagorean Women Philosophers: Between Belief and Suspicion* (2020).** The women of the Pythagorean tradition and how far the evidence can be trusted.$presocratics_master$,
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
  select $presocratics_quiz$[
    {"type": "mcq", "prompt": "What do the letters \"A\" and \"B\" mean in the Diels–Kranz numbering of Presocratic evidence (as in \"Heraclitus B12\")?", "options": ["\"A\" marks reports about a thinker's life and views (testimonia); \"B\" marks passages taken to be direct quotations (fragments)", "\"A\" marks authentic works; \"B\" marks forgeries", "\"A\" marks Aristotle's reports; \"B\" marks reports by all later writers", "\"A\" marks prose; \"B\" marks verse"], "answerIndex": 0, "explanation": "Diels's edition sorts each thinker's evidence into testimonia (A) and fragments the editors take to be direct quotations (B). Because no complete work survives, this distinction between someone's own words and later reports about them matters a great deal.", "id": "q1"},
    {"type": "mcq", "prompt": "Which argument for the 'boundless' (apeiron) probably goes back to Anaximander?", "options": ["Water is needed for nourishment and growth, so it must be the source of everything", "Air changes into fire when rarefied and into stone when condensed", "The elements are opposites that destroy one another, so if one were boundless it would long since have destroyed the others; since they all still exist, the source must be something else", "What is not cannot be thought, so nothing can come into being"], "answerIndex": 2, "explanation": "Aristotle reports this argument without naming Anaximander, but scholars think it probably goes back to him. The first option is Aristotle's guess about Thales, the second is Anaximenes' mechanism, and the fourth is Parmenides.", "id": "q2"},
    {"type": "mcq", "prompt": "How did the atomists Leucippus and Democritus respond to Parmenides' claim that 'what is not' cannot be?", "options": ["They agreed and concluded that motion is an illusion", "They made change the mixing and separating of four roots by Love and Strife", "They said Mind set an original mixture spinning", "They held that 'what is not', the void, exists no less than body, so change is the rearrangement of unchanging atoms in the void"], "answerIndex": 3, "explanation": "The atomists deliberately embraced the existence of the void. Leucippus reasoned that motion requires void and there is motion, so there is void. Love and Strife belong to Empedocles, and Mind to Anaxagoras.", "id": "q3"},
    {"type": "mcq", "prompt": "Which piece of evidence best counts against describing the Presocratics as having simply explained the world without gods?", "options": ["Democritus said that sweet and bitter exist only by convention", "Thales reportedly said that all things are full of gods, and Parmenides presented his argument as a goddess's revelation", "Anaximander wrote the first treatise in prose", "Zeno argued that motion is impossible"], "answerIndex": 1, "explanation": "The gods did not disappear: Thales, Parmenides, Empedocles and the Pythagoreans all kept religious elements. That is why many scholars locate the novelty less in abandoning the gods than in giving reasons open to criticism.", "id": "q4"},
    {"type": "open", "prompt": "Set out Parmenides' argument against coming-to-be in your own words, then give the strongest objection to it and one reply on his behalf.", "rubric": "A strong answer reconstructs the steps: only two routes of inquiry (what is, what is not); what is not cannot be known, thought or pointed out; so what-is cannot have come from what is not, nor from what is (it would already be), and there is no reason it should begin later rather than earlier; so there is no coming-to-be or perishing. It gives the Russell/Owen objection that the argument confuses talking about something that does not exist with talking about nothing. It gives Palmer's reply that 'what is not' means what must not be (the impossible), so the point concerns the inconceivability of what necessarily is not. Credit noting that whether Parmenides denied the reality of change is itself debated.", "id": "q5"},
    {"type": "open", "prompt": "Explain Zeno's Dichotomy paradox and assess whether the modern mathematical answer fully resolves it.", "rubric": "A strong answer explains that to cover a distance one must first cover half, then half of the remainder, and so on, so the run seems to require infinitely many sub-runs, which supposedly cannot be completed in finite time; hence no motion. It presents Aristotle's reply (divide the time as well as the distance; potential versus actual infinity) and the modern standard solution (an infinite series such as 1/2 + 1/4 + 1/8 ... has a finite sum, made rigorous in the nineteenth century). It assesses remaining worries: whether infinitely many actions (supertasks) can be completed, and whether real space and time are a mathematical continuum. Credit noting that Zeno's purpose (defending Parmenides or mocking his critics) is debated.", "id": "q6"}
  ]$presocratics_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/presocratics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
