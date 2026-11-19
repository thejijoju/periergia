-- Aristotle — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/aristotle @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/aristotle',
    'research',
    'advanced',
    'read',
    $aristotle_master$> **Aristotle (384–322 BCE) reorganised almost everything that could be known.** Plato's student for twenty years and then founder of his own school, he invented formal logic, asked what the most real things are, analysed change into matter and form, explained things by four kinds of cause, and founded biology on observation and dissection. This chapter explains those ideas, his account of the soul as the form of the body, and his ethics of flourishing and virtue, setting out his "function argument" step by step with its strongest objection. It presents his politics plainly, including "natural slavery" and his views of women, with the scholarly debate. It ends with his afterlife as "the First Teacher" of Islamic philosophers, a guide to Jewish thinkers such as Maimonides, and "the Philosopher" of Latin Christendom.

## A Life between Macedon and Athens

Aristotle was born in 384 BCE in Stagira, a small city in the Macedonian region of north-eastern Greece. His father, Nicomachus, was physician to King Amyntas III of Macedon; his mother, Phaestis, came from a family of Chalcis on the island of Euboea. Both died while he was young. The medical family is a likely, though not certain, source of his interest in living things. A caution: his biography rests on insecure, mostly late sources, chiefly Diogenes Laertius.

At about seventeen he went to Athens to study in Plato's Academy and stayed about twenty years, until Plato's death in 347. Why he then left is uncertain: the traditional story is disappointment that Plato's nephew Speusippus took over the school, and anti-Macedonian feeling may also have played a part. He then spent about three years at Assos, in present-day Turkey, where its ruler was Hermias, whose niece (or adopted daughter) Pythias he married, and about two years on Lesbos with Theophrastus.

In 343 Philip II of Macedon summoned him to tutor his thirteen-year-old son, Alexander. This famous episode is one of the least known. Little concrete is known about their interaction, and the teaching probably lasted only two or three years, since by about fifteen Alexander was already acting for his father; some scholars allow up to eight. The History chapter *Alexander and the Hellenistic World* follows the pupil.

In 335 Aristotle returned to Athens and founded a school in a public exercise ground sacred to Apollo Lykeios: the Lyceum. Its members became known as Peripatetics, a name that probably comes from a covered walkway (*peripatos*) on the grounds, rather than, as the popular story has it, from lecturing on foot. Ancient sources credit him and his school with studies of the constitutions of 158 states. When Alexander died in 323, anti-Macedonian anger boiled over. Aristotle left Athens after Alexander's death and died at Chalcis in 322. An oft-repeated ancient tale has him refusing to let Athens "sin twice against philosophy", recalling the execution described in *Socrates and the Sophists*.

{{image: Aristotle | A portrait bust of Aristotle. Ancient writers left two opposed pictures of his character, one hostile and one admiring.}}

## Lecture Notes and the Map of Knowledge

He may have written as many as 200 treatises; about 31 surviving works are judged authentic. They read like lecture notes and drafts, reworked for use inside the school. His polished works for the public, including dialogues, are lost except for fragments.

Aristotle divided knowledge into three kinds. The **theoretical** sciences, first philosophy (later called metaphysics), mathematics and physics, aim at truth. The **practical** sciences, ethics and politics, aim at acting well. The **productive** sciences aim at making: crafts, rhetoric and poetry. Under the last falls the *Poetics*, whose claim that tragedy works "through pity and fear" to a *catharsis* of such emotions is still argued over: purgation, purification or clarification?

## The Invention of Formal Logic

Aristotle's logical works contain the earliest formal study of logic that we have. Later editors grouped them as the *Organon*, "instrument", a title he never used. His central notion is the deduction (*sullogismos*): in Robin Smith's translation, "speech (*logos*) in which, certain things having been supposed, something different from those supposed results of necessity because of their being so".

He studied deductions built from four kinds of sentence, later lettered A, E, I and O: *Every S is P*; *No S is P*; *Some S is P*; and *Not every S is P*. A syllogism has two premises and a conclusion using exactly three terms; the "middle term" appears in both premises and drops out. Here is a valid syllogism of the form medieval logicians named *Barbara* (the example is ours):

1. Every animal is mortal.
2. Every human is an animal.
3. Therefore, every human is mortal.

The form is valid whatever terms replace "animal", "mortal" and "human", and Aristotle made that visible by writing letters in place of terms, as modern logic uses variables. The schoolroom "All men are mortal; Socrates is a man; therefore Socrates is mortal" is not his: it is a later textbook example (John Stuart Mill uses it), and Aristotle's system seems to exclude sentences about individuals altogether. He sorted premise pairs into three "figures" by the position of the middle term, showed that fourteen combinations yield a conclusion of necessity, and proved the valid forms of the second and third figures by reducing them to the self-evident first figure; the remaining combinations he rejected by counterexample.

There were limits. The syllogistic covers only a small part of valid reasoning and cannot handle relations: in it, the inferences from "John loves Mary" to "Something loves Mary" and to "John loves something" have nothing in common, whereas Gottlob Frege's logic, from 1879, treats both by one rule. Nor was it the only ancient logic. The logic of "if", "or" and "and" was developed by Diodorus Cronus, Philo and above all the Stoic Chrysippus, whom many ancients thought the greatest logician, as *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* explains. Still, Aristotle's system was taught, by and large without rival, from the fourth to the nineteenth century CE; Kant thought nothing significant had been added in two millennia. *Logic across Traditions* sets it beside other traditions' logics.

## Substance: What Is Most Real?

The *Categories* lists ten kinds of thing that can be said, including substance (a horse), quantity (two feet long), quality (white), relation (double), place (in the market-place) and time (yesterday). The first is basic. A **substance** is what other things depend on: whiteness exists only as the colour of something. Aristotle's favourite examples of "primary" substances are an individual man and an individual horse; species and genera, "man" and "animal", are "secondary". "Were primary substances not to exist," he says, "then no other entity would exist." This is firmly anti-Platonic: for Plato, as the chapter *Plato* explains, the most real things are Forms beyond the perceived world; here they are concrete individuals like Socrates.

Yet in Book Zeta of the *Metaphysics* he reopens "What is substance?" and points towards form: "by form I mean the essence of each thing and the primary substance." How this fits the *Categories*, and whether forms are universal or particular, are among the longest-running controversies in Aristotle scholarship.

## Form, Matter and Change

Parmenides and Zeno, met in *The Presocratics: from Myth to Argument*, had argued that change is impossible. Aristotle's answer is **hylomorphism**, from the Greek for matter (*hulē*) and form (*morphē*): ordinary things are composites of matter and form. In every change something persists, the matter, and something is gained or lost, a form. When Socrates gets a tan, Socrates persists, his pallor is lost and a tan is gained. So: change requires matter and form; there is change; so there are matter and form.

**Potentiality** (*dunamis*) is a capacity to become or do something; **actuality** (*energeia*) is being or doing it. Wood is potentially a table or a bowl. This is not mere possibility: bronze is potentially a statue but not potentially butter.

To understand anything, says *Physics* II.3, we ask four questions, the **four causes** (*aitia*). The *material* cause is "that out of which", the bronze of a statue; the *formal* cause is its form or pattern; the *efficient* cause is "the primary source of the change", the sculptor ("the father is the cause of the child"); the *final* cause is "that for the sake of which", as health is the cause of walking about. Not everything has all four: a chance meeting at the market has no final cause. Because *aitia* is wider than our "cause", some scholars translate it "explanation". The final cause is the most controversial, for it says nature acts for ends. *Causation* follows the four causes into later debate.

The eternally circling heavens, *Metaphysics* Lambda argues, are moved by something "that moves without being moved", as an object of desire moves things. This **unmoved mover** is pure activity of understanding, "active understanding of active understanding" in Reeve's translation of the phrase often rendered "thought thinking itself".

## The Soul as the Form of the Body

For Aristotle everything alive has a soul (*psuchē*), plants included, because a soul is what makes a living body alive. *On the Soul* defines it as "a first actuality of a natural body which has life in potentiality": soul is to body as form to matter. Hence, he says, "it is not necessary to ask whether soul and body are one, just as it is not necessary to ask whether the wax and its shape are one."

Souls form a ladder of capacities: all living things have nutrition (plants only that), animals add perception, and among natural creatures only humans add intellect. The soul is therefore generally not separable from the body, a view that cuts across the debate in *The Mind–Body Problem*. But Aristotle adds that some parts may be separable, because they are the actuality of no bodily organ. That remark, and the obscure "active mind" of *De Anima* III.5, seeded centuries of dispute over whether there is one intellect for all humanity.

## The Biologist of the Lagoon

Aristotle and Theophrastus originated the science of biology, Aristotle for animals and Theophrastus for plants. On Lesbos Aristotle spent about two years studying the lagoon of Pyrrha, now the Gulf of Kalloni. His works on animals rest on his own observation, on fishermen and beekeepers, and on less reliable travellers' reports. He named some 500 species and described about 35 in enough detail to show he dissected them.

Many observations were excellent, such as the four-chambered stomach of ruminants and the heart forming early in hens' eggs opened at intervals. One famous case shows him cautious rather than prophetic. Fishermen told him that a special arm of the male octopus, the hectocotylus, is used in mating. Aristotle recorded the claim but doubted it, thinking the arm served only for attachment. Modern zoology, from the nineteenth century on, found the fishermen right.

The errors were serious too. He thought thinking happens near the heart and the brain is a cooling organ; that men are hotter than women; that in reproduction the male supplies form and the female only matter; and that some insects arise spontaneously from decaying matter. In 1628 William Harvey showed that the heart is a pump and the blood circulates. Peter Medawar dismissed the zoology as "a strange and generally speaking rather tiresome farrago of hearsay, imperfect observation, wishful thinking and credulity…", yet modern observation has confirmed many of its surprising claims.

```checkpoint
q: Which of these is a valid syllogism in Aristotle's own system, rather than a later textbook example?
a*: Every animal is mortal; every human is an animal; therefore every human is mortal.
a: All men are mortal; Socrates is a man; therefore Socrates is mortal.
x: This is a later textbook example (J. S. Mill uses it), and Aristotle's syllogistic seems to exclude sentences about individuals.
a: If it is day, it is light; it is day; therefore it is light.
x: This "if... then" inference belongs to propositional logic, developed above all by the Stoic Chrysippus, not to Aristotle's term logic.
a: John loves Mary; therefore something loves Mary.
x: Relational inferences like this are exactly what Aristotle's subject–predicate logic cannot handle; Frege's logic can.
hint: Aristotle's sentences have the forms "Every S is P", "No S is P", "Some S is P" and "Not every S is P".
why: This is the form later named Barbara: three terms, two premises, and a middle term ("animal") that drops out of the conclusion.
---
q: What did Aristotle say about the hectocotylus, the special arm of the male octopus?
a: He discovered that it transfers sperm, and was proved right at once.
x: He doubted the mating function; it was the fishermen's claim, confirmed only by modern zoology.
a: He dismissed the fishermen as superstitious and never described the arm.
x: He described the arm and recorded the fishermen's claim; he doubted only its role in reproduction.
a*: He reported the fishermen's claim that it is used in mating but doubted it, thinking it served only for attachment.
a: He thought it was the octopus's organ of thought.
x: Nothing in his account suggests this; he placed thinking near the heart.
hint: In this case the specialists he consulted knew more than he did.
why: Aristotle allowed the arm served only for attachment; zoologists from the nineteenth century on confirmed the fishermen.
```

## Flourishing: the Function Argument

The *Nicomachean Ethics* begins with ends. We want most things for the sake of something else; the highest good is wanted for itself. Everyone calls it *eudaimonia*, "happiness" or better "flourishing": living well. The dispute is over what it consists in, and Aristotle's answer, in Book I chapter 7, is the **function argument** (*ergon*, a thing's characteristic work):

1. Happiness is agreed to be the highest good, but we must say what it consists in.
2. For anything with a function, such as a flautist, a sculptor, an eye or a hand, its good and its "doing well" lie in performing that function well.
3. A human being has a function.
4. That function must be peculiar to humans: not nutrition, shared with plants, nor perception, shared with animals, but the active life of the part of the soul that has reason.
5. Doing a function well requires the relevant excellence (*aretē*, "virtue" in a broad sense).
6. Therefore the human good is activity of soul in accordance with excellence, and with the best and most complete excellence, over a complete life.

```quote
"Human good turns out to be activity of soul in accordance with virtue … For one swallow does not make a summer."
Aristotle · Nicomachean Ethics I.7, 1098a16–18 (trans. W. D. Ross) · fourth century BCE
```

The Greek *ear* in the proverb means spring, and translators such as Rackham and Sachs write "one swallow does not make a spring"; either way, flourishing belongs to a whole life, not a good day. It also needs some external goods, such as friends and some wealth.

**The strongest objection** is that premise 3 is assumed, not argued. That flautists and eyes have functions does not show that a human being as such has one; a person is not a tool or an organ. **The best reply**, from the scholar Angier as summarised in the *Internet Encyclopedia of Philosophy*, rests on the craft analogy. A master craftsman's specialised activity draws on a range of subordinate skills; so acting well as a human draws on an inclusive set of capacities organised under reason. The human "function" is not one task but the reason-directed exercise of all our capacities.

A second objection, that the conclusion is too general to show that the traditional virtues are what flourishing needs, meets the reply that Book I is explicitly an "outline", filled in by the later accounts of each virtue.

## Virtue, the Mean and Practical Wisdom

Intellectual virtues come by teaching; virtues of character come by habituation. A virtue of character is a stable disposition (*hexis*) to feel and act appropriately, so, against Socrates, it is not just knowledge; yet Joe Sachs warns against reducing it to habit, since character involves choice. Each such virtue lies in a **mean** between excess and deficiency: courage lies between cowardice and rashness. The mean is "relative to us", not an average: if ten pounds of food is too much and two too little, it does not follow that everyone should eat six. Sometimes great anger is the mean. Finding it needs **practical wisdom** (*phronēsis*), which cannot be learned solely from general rules; ethics gives no decision procedure.

On **akrasia**, weakness of will, Aristotle says that Socrates' denial of it clearly conflicts with the appearances, yet concludes that in a way Socrates was right after all: the weak-willed person knows only as a drunk or an actor reciting lines knows. Unlike Socrates, he insists that emotions can rival or bypass reason. Finally, Book X calls the life of contemplation the happiest, the life of practical virtue happy "in a secondary way". Whether this clashes with the rest of the work is debated; Richard Kraut, in the Stanford Encyclopedia, argues it does not, since the philosophic life needs the ethical virtues too.

```checkpoint
q: In the function argument, why is the human function not perception?
a: Because perception is often mistaken.
x: The argument does not turn on reliability; it asks what is peculiar to humans.
a*: Because perception is shared with other animals, and the function must be peculiar to humans.
a: Because perception belongs to the body, and the function belongs only to the soul.
x: For Aristotle perception is itself a capacity of soul; animals have perceptual souls.
a: Because only the gods perceive things truly.
x: The argument's contrast is with plants and animals, not with the gods.
hint: Look at step 4 of the reconstruction.
why: Nutrition is shared with plants and perception with animals, so the human function is the active life of the part of the soul that has reason.
---
q: What does Aristotle mean by saying that the virtuous mean is "relative to us"?
a: That each person may decide for themselves what counts as virtue.
x: The mean is fixed by the situation and judged by practical wisdom, not by personal preference.
a: That the mean is the arithmetic midpoint between two extremes.
x: His food example rejects this: if ten pounds is too much and two too little, it does not follow that one should eat six.
a: That virtue always means feeling only mild emotions.
x: He allows that sometimes great anger is the mean.
a*: That the right amount depends on the person and the situation, as the right diet depends on who is eating.
hint: Think of the diet example.
why: The mean is not arithmetic; finding it requires practical wisdom about the particular case.
```

## Politics: the Political Animal, Slaves and Women

The human good is lived in a community. In Carnes Lord's translation, "man is by nature a political animal", more so than any bee, because "nature does nothing in vain, and man alone among the animals has speech", which reveals the just and the unjust. The city (*polis*) grows naturally from household to village; it "comes to be for the sake of life, and exists for the sake of the good life" (in Fred Miller's rendering). It is prior by nature to the individual, as the body is to a hand; one who cannot live in a city is "either a beast or a god".

A citizen is one entitled to share in deliberative or judicial office. Constitutions are correct when they aim at the common advantage, kingship (one), aristocracy (few) and polity (many), and deviant when they serve the rulers: tyranny, oligarchy and democracy, which is really rule by the poor.

The same work defends slavery. A **natural slave**, Aristotle says, is one "who participates in reason only to the extent of perceiving it, but does not have it"; slaves are "living tools"; war to capture people naturally suited to be ruled but unwilling is called just. Yet he also argues that many actually enslaved, war captives and slaves' children, are not slaves by nature, and that nature fails to make the difference visible. Edward Clayton notes that the theory thus undermines the two main real sources of slaves. Fred Miller observes that Aristotle asserts "without evidence" that natural slaves cannot deliberate, and gives no reason why such rule should serve the master rather than the slave.

On women he is equally plain: "the male is by nature more capable of leadership than the female, unless he is constituted in some way contrary to nature", and "the slave is wholly lacking the deliberative element; the female has it but it lacks authority; the child has it but it is incomplete." The husband always rules. His biology, in which the female supplies only matter, is one root of these views. What "lacks authority" (*akuron*) means is debated: that women's reason cannot command men, because of temperament or Greek custom, or that it lacks authority over their own emotions; Clayton points to the vicious circle of exclusion. Some read the arguments about slaves and women as so weak they must be ironic; Miller rejects that. The debate continues in work by Fortenbaugh, Modrak, Deslauriers, Mayhew, Garnsey and Pellegrin.

## Three Religious Civilisations

Some seven centuries of Greek commentary followed Aristotle, but in the Latin West he was practically unknown from about 600 to 1100, apart from Boethius' Latin logic.

The decisive revival came in Arabic. Under the ʿAbbasid caliphs, especially in Baghdad, Greek philosophy was translated into Arabic, much via Syriac (see the History chapter *The Rise of Islam and the Caliphates*). The Nestorian Christian physician Hunayn ibn Ishaq (d. 873), his son and their associates made the whole corpus available. One confusion mattered: the so-called *Theology of Aristotle* was really an adapted translation of Plotinus. Arabic philosophers called Aristotle "the First Teacher". Avicenna (Ibn Sīnā, c. 970–1037) is a central figure in *Falsafa: al-Kindī, al-Fārābī and Avicenna*; Averroes (Ibn Rushd, 1126–1198), born in Córdoba, wrote short, middle and long commentaries and became known in Latin Europe simply as "the Commentator", as *Al-Ghazālī, Averroes and the Quarrel over Reason* explains.

Maimonides (1138–1204) wrote his *Guide of the Perplexed* in Judeo-Arabic under the influence of this Neoplatonised Aristotelianism, stressing the limits of human knowledge. He judged Aristotle superior to earlier philosophers, yet held that neither creation nor Aristotle's eternal world can be demonstrated, and preferred the creation taught by Moses; see *Jewish Philosophy: from Saadia to Maimonides*.

Latin Christendom received Aristotle in the twelfth and thirteenth centuries, translated from Arabic and Greek. In 1210 a synod at Sens forbade reading his natural philosophy at Paris; by Aquinas's day the Paris arts curriculum consisted largely of his works. Thomas Aquinas, who called him simply "the Philosopher", sought to reconcile him with Christian faith; *Thomas Aquinas* examines a synthesis praised as brilliant and attacked as distorting Aristotle. Dante called him "the master of those who know". In 1277 Bishop Stephen Tempier of Paris prohibited 219 theses discussed in the arts faculty. Its targets and effects are disputed; Pierre Duhem's claim that it marked the birth of modern science is no longer endorsed by specialists.

The break came when Galileo's mathematical and experimental science challenged Aristotle's physics and cosmology, a story told in the History chapter *The Scientific Revolution*; even then universities went on teaching him. In the twentieth century he returned in ethics. G. E. M. Anscombe's "Modern Moral Philosophy" (1958) urged philosophers to drop the notion of moral obligation, and Philippa Foot, Alasdair MacIntyre and Rosalind Hursthouse developed virtue ethics, now set beside Confucian, Buddhist and Hindu traditions, as *Virtue Ethics, Greek and Confucian* explains. His own first sentence in the *Metaphysics* sums up the career:

```quote
"All men by nature desire to know."
Aristotle · Metaphysics I.1, 980a21 (trans. W. D. Ross, 1908) · fourth century BCE
```

## Further exploration

- **Jonathan Barnes, *Aristotle: A Very Short Introduction* (2000).** A brief, lucid overview by a leading scholar.
- **Christopher Shields, *Aristotle* (2nd ed., 2014).** A rigorous philosophical introduction to the whole system.
- **Jonathan Lear, *Aristotle: The Desire to Understand* (1988).** Aristotle's philosophy organised around the drive to know.
- **Armand Marie Leroi, *The Lagoon: How Aristotle Invented Science* (2014).** A biologist follows Aristotle's zoology on Lesbos.
- **Dimitri Gutas, *Greek Thought, Arabic Culture* (1998).** The standard account of how Aristotle reached Arabic in ʿAbbasid Baghdad.
- **Carlo Natali, *Aristotle: His Life and School* (2013).** The best general account of his life and the Lyceum.
- **Edith Hall, *Aristotle's Way: How Ancient Wisdom Can Change Your Life* (2018).** An accessible, ethics-centred introduction by a classicist; reviewers criticised its handling of slavery and women.$aristotle_master$,
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
  select $aristotle_quiz$[
    {"type": "mcq", "prompt": "Where does the name 'Peripatetic' for Aristotle's school probably come from?", "options": ["Aristotle's habit of lecturing while walking", "A covered walkway (peripatos) on the school's grounds", "The Greek word for a travelling teacher", "The god Apollo Lykeios, to whom the site was sacred"], "answerIndex": 1, "explanation": "The name probably comes from a covered walkway on the school's property. The popular story about lecturing on foot is less likely; Apollo Lykeios gave the Lyceum, not the Peripatetics, its name.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of the following best describes a limit of Aristotle's syllogistic logic?", "options": ["It could not handle relations, such as the inferences from 'John loves Mary' to 'Something loves Mary' and to 'John loves something'", "It could not prove that any argument was valid", "It used no variables, only concrete examples such as Socrates", "It was ignored until Frege revived it in 1879"], "answerIndex": 0, "explanation": "Aristotle's term logic is built on subject–predicate sentences and cannot treat relations, which Frege's logic handles by one rule. Aristotle did use letters as variables, proved validity, seems to have excluded sentences about individuals, and was taught by and large without rival for centuries.", "id": "q2"},
    {"type": "mcq", "prompt": "According to Aristotle's De Anima, what is the soul?", "options": ["An immortal substance imprisoned in the body", "A fine material breath that leaves the body at death", "A capacity found only in human beings", "The form of a living body: its first actuality"], "answerIndex": 3, "explanation": "Aristotle defines the soul as 'a first actuality of a natural body which has life in potentiality'. Plants and animals have souls too, and soul is related to body as the shape of wax is to the wax.", "id": "q3"},
    {"type": "mcq", "prompt": "What is true of the so-called Theology of Aristotle, read by philosophers in Arabic?", "options": ["It was Aristotle's lost dialogue On Philosophy", "It was Averroes' long commentary on the Metaphysics", "It was really an adapted translation of Plotinus", "It was composed by Maimonides in Judeo-Arabic"], "answerIndex": 2, "explanation": "The Theology of Aristotle was an adapted translation of parts of Plotinus' Enneads, a confusion that coloured how Aristotle was read in the Islamic world.", "id": "q4"},
    {"type": "open", "prompt": "Set out Aristotle's function argument (Nicomachean Ethics I.7) step by step, then state its strongest objection and the best reply.", "rubric": "A strong answer reconstructs the steps: happiness (eudaimonia) is the highest good but needs specifying; the good of anything with a function (flautist, sculptor, eye, hand) lies in performing it well; humans have a function; it must be peculiar to humans, so not nutrition (shared with plants) or perception (shared with animals) but the active life of the rational part of the soul; performing it well requires excellence (aretē); so the human good is activity of soul in accordance with excellence over a complete life ('one swallow does not make a summer', or 'spring' in other translations). It states the objection that premise 3 is assumed, since tools and organs having functions does not show that humans as such do, and gives the craft-analogy reply (Angier): as a master craft draws on subordinate skills, living well as a human draws on an inclusive set of capacities organised under reason. It may add the objection that the conclusion is too general and the 'outline' reply.", "id": "q5"},
    {"type": "open", "prompt": "Explain Aristotle's theory of natural slavery and his view of women's capacity to deliberate, and describe one point of scholarly debate about each.", "rubric": "A strong answer states plainly that Aristotle defined the natural slave as one who perceives reason but does not have it, called slaves 'living tools' and called war to capture natural slaves just; and that he held the male more fitted to rule and the female's deliberative capacity to 'lack authority' (akuron). For slavery it notes his admission that many actually enslaved (war captives, slaves' children) are not slaves by nature, Clayton's point that this undercuts the real sources of slaves, or Miller's point that the claim is asserted 'without evidence'. For women it notes the debate over whether akuron means that women's reason cannot command men or lacks authority over their own emotions, or the claim that the arguments are ironic, which Miller rejects. It may connect the views to his biology, in which the female supplies only matter.", "id": "q6"}
  ]$aristotle_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/aristotle', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
