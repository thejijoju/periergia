-- Hellenistic Philosophy: Stoics, Epicureans and Sceptics — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/hellenistic-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/hellenistic-philosophy',
    'research',
    'advanced',
    'read',
    $hellenistic_master$> **After Alexander, Greek philosophy asked how to live well.** Between the death of Alexander the Great in 323 BCE and the battle of Actium in 31 BCE, three schools dominated: the Stoics, the Epicureans and the Sceptics, with the Cynics as their unruly forerunners. This chapter explains the Stoic system of logic, physics and ethics, with its claims that virtue is the only good and that some things are "up to us" and others are not; Epicurus' atoms, his account of pleasure and his cure for the fear of death; and the two sceptical traditions, Pyrrhonian and Academic. It sets out the Epicurean argument that death is nothing to us step by step, with the modern deprivation objection and Lucretius' symmetry argument, and ends with the Roman Stoics Seneca, Epictetus and Marcus Aurelius and their long afterlife.

## Philosophy after Alexander

"Hellenistic philosophy" conventionally means Greek philosophy from the death of Alexander (323 BCE) to the battle of Actium (31 BCE). The dates fit neatly: Aristotle died in 322, and Diogenes the Cynic is often said to have died in 323, though his dates are uncertain. *Alexander and the Hellenistic World*, in History, tells the political story. A popular explanation, put forward for instance by A. C. Grayling, is that the insecurity of the new kingdoms and the loss of the old city-states' independence drove people to seek inner security through philosophy. That is an interpretation, not a settled fact.

What the schools did share is a framework called **eudaimonism**: the view that happiness (*eudaimonia*, flourishing) is the end "for the sake of which everything is done, but which is not itself done for the sake of anything". They disagreed about what that highest good (*summum bonum*) or end (*telos*) is, which is why Cicero titled his survey of their quarrels *De Finibus*, "On Ends". Epicurus put the practical point sharply: philosophy that does not heal the soul is no better than medicine that cannot cure the body.

The French scholar Pierre Hadot made this the key to ancient thought. In *Philosophy as a Way of Life* (French 1981, English 1995) and *What Is Ancient Philosophy?* he argued that the choice of a way of life "stands at the beginning" of ancient philosophy; becoming a Stoic or an Epicurean was more like a conversion, and doctrine served "spiritual exercises" such as attention, meditation, memorising doctrines, rehearsing future misfortunes and examining one's conscience. Hadot did not deny the ancients' theoretical achievements. His thesis is influential but contested. John M. Cooper, in *Pursuits of Wisdom* (2012), accepts that ancient philosophy was a way of life but holds that reasoning and argument, not spiritual exercises, were central to it. Matthew Sharpe has defended Hadot against Cooper.

## The Cynics: a Shortcut to Virtue

The Cynics' name means "dog-like" (*kunikos*); why is disputed. It may come from the Cynosarges gymnasium where Socrates' companion Antisthenes taught, from Antisthenes' nickname, or from Diogenes "the Dog". The ancient biographer Diogenes Laertius makes Antisthenes the first Cynic, controversially, since Plato and Xenophon never call him a dog. Cynicism was a way of life more than a doctrine. Its core was *askēsis*, "training", and ancient writers called it "a shortcut to virtue". None of the many Cynic writings survive; we have anecdotes and sayings.

Diogenes of Sinope, on the Black Sea (born c. 413–403 BCE, died c. 324–321 BCE; estimates vary), was exiled after a scandal about "debasing the currency". Scholars divide over whether this happened or is a fiction symbolising his aim to "revalue the currency", since the Greek *nomisma* means both coinage and custom. He lived in a large ceramic storage jar (*pithos*); the familiar "barrel" is a later Latin reinterpretation, beginning with Seneca, and barrels did not exist in his time. When Alexander offered him any favour he liked, Diogenes is said to have replied "Stand out of my light". Asked where he came from, he said, "I am a citizen of the world [*kosmopolitēs*]", possibly coining the word. He carried a lamp in daylight "looking for a human being", not, as the usual mistranslation has it, "an honest man". Plato reportedly called him "Socrates gone mad".

{{image: Diogenes | A Roman mosaic of Diogenes of Sinope, made in the second or third century CE. He lived in a large storage jar (pithos); the "barrel" of popular retellings is a later invention.}}

Hipparchia of Maroneia, in Thrace (born c. 350–330 BCE; estimates vary), is the best-known woman Cynic philosopher, and the only woman with her own entry among the 82 philosophers in Diogenes Laertius. She married the Cynic Crates against her parents' wishes and lived the Cynic life with him in public. When Theodorus the Atheist mocked her, she asked whether he thought she had decided wrongly "if I devote that time to philosophy, which I otherwise should have spent at the loom". Her treatises and letters are lost.

## The Stoa: Zeno, Cleanthes and Chrysippus

The traditional lineage runs from Crates to Zeno of Citium (c. 334–262 BCE; sources differ by a year or so), from a city in Cyprus with a large Phoenician population. The story goes that after a shipwreck Zeno read Xenophon's memoir of Socrates in an Athenian bookshop, asked where such men could be found, and was pointed to Crates passing by. The story is too neat to be reliable history, but it records a real debt: Stoicism grew out of Cynicism. From about 300 BCE Zeno taught in a public space, the Stoa Poikilē, the "painted porch" on the north side of the Athenian Agora, which gave the school its name.

Cleanthes of Assos, a former boxer who supported himself as a night-time water-carrier, followed him; his *Hymn to Zeus* is his largest surviving fragment. Chrysippus of Soli (c. 280–206 BCE; sources differ slightly), head from around 230, was "by all accounts its foremost theorist and systematizer"; an ancient saying held that "without Chrysippus, there would have been no Stoa". He wrote hundreds of books, more than 700 by one ancient count, though sources disagree. No complete work by any of the three survives; early Stoicism is pieced together from summaries and from largely hostile witnesses such as Plutarch, Galen and Sextus Empiricus.

The Stoics divided philosophy into logic, physics and ethics, and pictured the whole as an egg: logic the shell, ethics the white, physics the yolk. (Scholars disagree about how far the ethics depends on the physics.)

## Stoic Logic and Physics

Aristotle's logic, described in the chapter *Aristotle*, is a logic of terms ("every S is P"). After Diodorus Cronus and his pupil Philo had begun a logic of propositions, Chrysippus built a logic of whole propositions joined by "if", "and" and "or": a **propositional logic**. The Stanford Encyclopedia calls him "the second major theorist of logic in antiquity". Its base was five "indemonstrables", basic valid argument forms. In a modern simplification (the Stoics described them in words and wrote "the first" and "the second" where we write *p* and *q*):

1. If *p* then *q*; *p*; therefore *q*.
2. If *p* then *q*; not *q*; therefore not *p*.
3. Not both *p* and *q*; *p*; therefore not *q*.
4. Either *p* or *q*; *p*; therefore not *q* (Stoic "or" excludes both).
5. Either *p* or *q*; not *p*; therefore *q*.

Every syllogism, they held, either is one of these or can be reduced to them by rules; they acknowledged valid arguments that are not syllogisms, but assumed these could somehow be transformed into syllogisms. Chrysippus also worked on the Liar and the Sorites (paradoxes treated in *Paradoxes: the Liar, the Heap and Zeno*), and the likeness of his logic to Gottlob Frege's is "especially striking"; *Logic across Traditions* sets it beside Nyāya and Mohist logic.

Stoic physics is a **corporealism**: only bodies exist, since only bodies act or are acted upon; even the soul and wisdom are bodies. An active principle, God or Zeus, identified with reason (*logos*), a designing fire and *pneuma* ("breath"), pervades passive matter. The cosmos is a providentially governed living thing, and every event follows from preceding causes by fate, "a certain natural everlasting ordering of the whole".

Two objections follow at once. The "Lazy Argument" says that if it is fated that I recover, I will recover whether or not I call the doctor, so action is pointless. Chrysippus replied that events are "co-fated": recovery is fated together with calling the doctor. The deeper objection is that if my actions come from prior causes, they are not in my power. Chrysippus answered with a cylinder and a spinning top (or cone). Each needs a push to start, but once pushed, the cylinder rolls and the top spins through its own nature. So an outside impression starts the process, but whether we **assent** to it, accept it as true and act on it, depends on our own character: "assent will be in our power". This is an early **compatibilism**, the view that responsibility fits with determinism, though not freedom to do otherwise. *Free Will and Determinism* follows the debate. A related image of a dog tied to a cart, which follows willingly or is dragged, is reported by Hippolytus as Zeno's and Chrysippus'; its authorship is disputed, and some scholars, Susanne Bobzien among them, place it later.

## Virtue the Only Good

For the Stoics, virtue is the perfected condition of reason, a form of knowledge, and all-or-nothing; whoever has one virtue has them all. Their argument that only virtue is good, reported by Diogenes Laertius, is short: "just as heating, not chilling is the peculiar characteristic of what is hot, so too benefiting, not harming is the peculiar characteristic of what is good. But wealth and health no more do benefit than they harm. Therefore wealth and health are not something good." Life, health, pleasure, beauty and wealth, and their opposites, death, disease, pain and poverty, are "indifferent". So a virtuous person on the rack is fully happy, a conclusion Aristotle had refused.

The school softened this. Against those in Zeno's circle, such as Aristo, who treated all indifferents alike, Chrysippus defended the mainstream view that health and wealth are "preferred": they have value, are "according to nature", and it is one's proper function to select them in normal circumstances. Ancient critics such as Plutarch and Cicero pressed a dilemma: either preferred indifferents are really good, which contradicts the thesis, or they are pursued for some goal beyond happiness, which abandons the claim that happiness is the final end.

Passions (*pathē*), such as fear or grief, are excessive impulses resting on false judgements that something indifferent is good or bad. The sage is free of passion (*apatheia*), but not the unfeeling robot of caricature: he has "good feelings" and involuntary "pre-emotions". Ethics rests on *oikeiōsis*, "appropriation": every creature seeks from birth to preserve itself, and in adults reason extends that concern outwards. Since all humans share reason, they are fellow citizens, with Zeus, of one cosmic city; justice reaches even "the most distant Mysian". This **cosmopolitanism** took up Diogenes' word.

```checkpoint
q: How did Chrysippus answer the objection that, if all events are fated, our actions are not in our power?
a*: With his cylinder: an impression starts the process, as a push starts a cylinder, but assent comes from our own nature.
a: He denied that all events are fated.
x: Chrysippus held that everything happens by fate; his answer was meant to fit with that.
a: He said the swerve of atoms breaks the chain of causes.
x: The swerve is an Epicurean idea, attested in Lucretius; the Stoics rejected uncaused motion.
a: He said the gods intervene to free the wise.
x: Stoic God is the reason running through the fated order, not an outside force overriding it.
hint: Think of two shapes given the same push.
why: The same push makes a cylinder roll and a top spin, because of their shapes; likewise our assent flows from our character, so it is "in our power" even though fated.
---
q: Why did the Stoics hold that health and wealth are not good?
a: Because they are pleasures, and pleasure is bad.
x: Pleasure too is classed as indifferent, neither good nor bad.
a: Because they are illusions with no real existence.
x: The Stoics were corporealists; health and wealth are real, just not good.
a*: Because what is good always benefits, and health and wealth can harm as much as benefit.
a: Because only the gods can possess them.
x: Nothing in the argument concerns the gods; it turns on what benefits.
hint: Compare heat, which always heats.
why: As heating is the mark of the hot, benefiting is the mark of the good; health and wealth can be misused, so they are "indifferent", though Chrysippus called them "preferred".
```

## Epicurus and the Garden

Epicurus (341–270 BCE) was an Athenian citizen raised on Samos, who studied with a follower of Democritus and in 307/306 bought a property in Athens known as "the Garden", which gave his school its name. Unlike the Pythagoreans, Epicurus refused to let members pool their property, since that would imply distrust among friends; the Garden "welcomed many female students", including Themista, Leontion and others; Leontion wrote a lost work against Theophrastus and was slandered as a courtesan, possibly by rival schools. It was very unusual for a school to accept women, non-citizens, slaves and the poor; Epicurus' will freed his slave Mys, whom ancient sources name as a member of the circle, and others. Three letters and forty *Principal Doctrines* survive in Diogenes Laertius; parts of his *On Nature* were found at Herculaneum, buried in 79 CE.

The physics is atomism: only atoms and void exist, in an infinite universe. Motion requires empty space, so there is void; the universe has no edge, since there is nothing beyond the all to mark one. The Latin poet Lucretius, whose *De Rerum Natura* is our fullest source for this physics, adds the **swerve**: a tiny random deviation of atoms "at no fixed region of space or fixed time" (in Long and Sedley's translation). Without it, atoms falling in parallel "like drops of rain" would never collide, and Lucretius links it to free action. The swerve is attributed to Epicurus but not attested in his surviving works, and how far he relied on it is debated.

The ethics is hedonism: pleasure is the only intrinsic good and pain the only intrinsic evil. But the goal is freedom from bodily pain (*aponia*) and mental disturbance (*ataraxia*), not feasting. Epicurus sorted desires into the natural and necessary, the natural but unnecessary, and the empty, such as desire for fame or great wealth. Justice is a compact neither to harm nor be harmed, and one cannot live pleasantly without living prudently, honourably and justly. Friendship "had its beginning as a result of utility, but is to be chosen for its own sake". The gods exist but, being blessed, take no interest in us. The later Epicurean Philodemus records a "four-part cure" (*tetrapharmakos*): "Don't fear god, / Don't worry about death; / What is good is easy to get, / What is terrible is easy to endure."

Two warnings. The "eat, drink and be merry" Epicurus is a later caricature; in the Middle Ages he appeared as "proprietor of the kitchen, the tavern, and the brothel". And the famous "Epicurean paradox" of evil ("Is God willing to prevent evil, but not able?") is found in no text of Epicurus; its attribution to Epicurus rests only on the Christian writer Lactantius (a similar, unattributed trilemma appears earlier in Sextus Empiricus), and one scholar argues it comes from a non- or anti-Epicurean source. *The Problem of Evil* discusses the argument itself.

## Is Death Nothing to Us?

```quote
"Death, therefore, the most awful of evils, is nothing to us, seeing that, when we are, death is not come, and, when death is come, we are not."
Epicurus · Letter to Menoeceus 125 (trans. R. D. Hicks) · late fourth or early third century BCE
```

Behind this lies the physics: the soul is made of atoms too delicate to survive the body, which scatter at death, so sensation ends. Step by step, following one modern reconstruction:

1. Death is annihilation.
2. The living have not yet been annihilated.
3. So death does not affect the living, and is not bad for them.
4. For something to be bad for somebody, that person has to exist.
5. The dead do not exist.
6. So death is not bad for the dead.
7. Therefore death is bad for neither the living nor the dead.

It follows that fearing death is foolish: it pains us now for something that cannot pain us when it comes. Note that the argument concerns being dead, not painful dying.

**The strongest objection** is the deprivation account, set out by Thomas Nagel in "Death" (1970). Things can be bad for us not only by causing bad experiences but by taking goods away, as missing a joyous occasion through being unconscious is bad though you never feel it. Death is bad because it makes a life as a whole worse than it would otherwise have been. The objection denies that something must be experienced to be bad, and many who hold it reject premise 4 as well; on some views, desires can be thwarted without our knowing.

**The Epicurean reply** is the "timing puzzle": if death harms me, when, and who is harmed? Not while I live, and not afterwards, when there is no one. Deprivationists have offered answers (before death, after it, at no determinate time, which is Nagel's view, or timelessly), and the debate continues.

Lucretius added a second argument, now called the **symmetry argument**. In the translation of Rolfe Humphries: "Look back at time … before our birth. In this way Nature holds before our eyes the mirror of our future after death. Is this so grim, so gloomy?" We do not mind not having existed before birth; non-existence after death is relevantly the same; so we should not mind it either. Replies: death, unlike a late birth, deprives us of future goods; Nagel adds that I could not have been born much earlier and still been me, though I could have lived longer (he later admitted this rests on questionable assumptions); and Derek Parfit argues we are rationally biased towards future goods. *The Meaning of Life and the Fear of Death* pursues these questions, including Bernard Williams' claim that immortality would be bad for us.

## The Sceptics

**Pyrrho of Elis** (c. 365/360 – c. 275/270 BCE) wrote nothing. He reportedly went with Alexander to India and met "naked wise men" (*gymnosophistai*); Diogenes Laertius says his philosophy came from that meeting, without clear basis. According to his follower Timon, things are by nature undetermined (Timon's three Greek words are *adiaphora*, *astathmēta* and *anepikrita*), so we should be without opinions, saying of each thing that it "no more is than is not"; the result is tranquillity. Whether things are themselves indeterminate or we simply cannot know them is debated. So is Indian influence: Christopher Beckwith finds in Pyrrho an early Buddhist, Richard Bett has doubted (though less firmly in recent work) that subtle ideas could pass through interpreters, and Johannes Bronkhorst denies any link. The Stanford Encyclopedia judges there is "at least room for debate". Compare *The Buddha and Early Buddhist Philosophy*. The stories of friends saving him from carts and cliffs are hostile inventions.

Meanwhile, under Arcesilaus (head from c. 268/266 BCE), Plato's Academy turned sceptical, reviving Socrates the questioner and attacking the Stoic "cognitive impression", which the Stoics took as the criterion of truth. Carneades (214–129/8 BCE), from Cyrene on the North African coast, studied the Stoics so closely that he said "If Chrysippus had not been, I would not have been". The Stoics' main objection to all this was **apraxia**, inaction: action requires assent, the sceptic withholds assent, so the sceptic cannot act. Arcesilaus replied that one can act on "the reasonable"; Carneades that one can act on the "persuasive" impression, tested more carefully the more is at stake, as one checks whether a coil in a dark room is a rope or a snake.

In the first century BCE Aenesidemus left the Academy to revive a more radical scepticism in Pyrrho's name. Its method was to set opposing appearances against each other until they balance ("equipollence"), leading to suspension of judgement (*epochē*) and then tranquillity. His Ten Modes (arguments from differences between animals, people, senses, circumstances and customs) and the later Five Modes of Agrippa (disagreement, infinite regress, relativity, unargued hypothesis and circularity) survive in Sextus Empiricus, a doctor of the second or third century CE, whose *Outlines of Pyrrhonism* defines scepticism as "an ability to set out oppositions" leading "first to suspension of judgment and afterwards to tranquillity". Tranquillity follows suspension "as a shadow follows a body", arriving as unexpectedly as the effect the painter Apelles got by throwing his sponge at a picture he could not finish. Against apraxia, Sextus says the sceptic lives by appearances, guided by nature, feelings such as hunger, customs and laws, and the crafts. Whether the sceptic then holds ordinary beliefs (Michael Frede) or none (Myles Burnyeat, Jonathan Barnes) is a central and much-discussed question. Scholars have also noted parallels with the Buddhist Nāgārjuna. *Scepticism and the Answers to It* takes the modes forward.

```checkpoint
q: What was the Stoic "apraxia" objection to scepticism?
a: That sceptics were dishonest, since they secretly held beliefs.
x: That is closer to a modern interpretive debate; the apraxia charge is about the possibility of acting.
a*: That action requires assent, so someone who suspends all assent cannot act.
a: That scepticism leads to fear of death.
x: The sceptics claimed it leads to tranquillity; the objection concerned action, not fear.
a: That Pyrrho had to be rescued from carts and cliffs.
x: Those stories are hostile inventions, illustrating the charge rather than stating it.
hint: Think of the Stoic sequence impression, assent, impulse.
why: Stoics held that acting requires assenting to an impression; Arcesilaus, Carneades and Sextus each replied that one can act on the reasonable, the persuasive or appearances.
---
q: Which statement about the Epicurean swerve is accurate?
a: Epicurus explains it in detail in his Letter to Herodotus.
x: The swerve is not attested in Epicurus' surviving works.
a: It is a Stoic doctrine about assent.
x: The Stoics rejected uncaused motion; the swerve is Epicurean.
a: It was invented by Sextus Empiricus.
x: Sextus was a Pyrrhonist sceptic, not an Epicurean.
a*: Our main Epicurean source for it is Lucretius, who uses it to explain collisions and free action.
hint: Which Epicurean source survives at greatest length?
why: Lucretius says atoms would fall like raindrops without it and ties it to the will; how far Epicurus relied on it is debated.
```

## Rome: Cicero, Seneca, Epictetus and Marcus Aurelius

By the end of the period philosophers had moved to Rome and Alexandria. Cicero (106–43 BCE), a pupil of the Academic Philo of Larissa, wrote in a short burst a series of works aiming to cover "the whole of philosophy"; long valued mainly as a source, he is increasingly studied as a philosopher. The only complete Stoic works we have are from the Roman imperial era.

Seneca (born at Córdoba c. 4–1 BCE, died 65 CE) was exiled to Corsica, recalled as Nero's tutor and became his adviser, and was compelled to kill himself after being accused of complicity in a conspiracy, probably wrongly, though there is no consensus. His 124 *Letters to Lucilius* and his essays, including *On the Shortness of Life*, survive. He also faced the charge of hypocrisy: an accuser claimed he had amassed 300 million sesterces serving Nero. His contemporary Musonius Rufus argued in lectures such as "That Women Too Should Study Philosophy" that men's and women's capacity for virtue is the same.

Musonius taught Epictetus (born in the 50s CE, died around 135), a slave of Epaphroditus, an administrator at Nero's court, later freed, who after Domitian expelled the philosophers (around 89–93 CE) taught at Nicopolis in north-western Greece. He wrote nothing; his pupil Arrian compiled the *Discourses* and the *Handbook*, which opens with the Stoic distinction this chapter's summary promised:

```quote
"Some things are up to us and some things are not up to us. Our opinions are up to us, and our impulses, desires, aversions–in short, whatever is our own doing. Our bodies are not up to us, nor are our possessions, our reputations, or our public offices, or, that is, whatever is not our own doing."
Epictetus · Encheiridion 1.1 (trans. Nicholas P. White) · first–second century CE
```

The rest follows: "What upsets people is not things themselves but their judgments about the things." Marcus Aurelius (121–180 CE), emperor from 161, read Epictetus and wrote twelve books of private notes in Greek "to himself", partly on campaign; "Meditations" is a modern title, and he rarely if ever labels himself a Stoic. He reminds himself not to "say more to yourself than the first impressions report", and he endowed chairs in Athens for the Platonic, Aristotelian, Stoic and Epicurean traditions alike.

## Afterlives

Lucretius' poem was rediscovered in 1417 by Poggio Bracciolini. Sextus was printed in Latin in 1562 and reshaped Montaigne and Hume, as *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne* shows; Cicero's lost *Hortensius* turned Augustine to philosophy (*Augustine and Early Christian Philosophy*). Justus Lipsius fused Stoicism with Christianity in the sixteenth century. In 1979 Aaron Beck and colleagues wrote that "the philosophical origins of cognitive therapy can be traced back to the Stoic philosophers", and Albert Ellis named Epictetus among his influences. The founders of cognitive therapy saw the Stoics as forerunners; the therapy was not derived from them. Today a "Modern Stoicism" movement runs an annual Stoic Week, and Emily Austin's *Living for Pleasure* argues for an Epicurean life. Hadot himself felt that Epicureanism and Stoicism "could nourish the spiritual life of men and women of our times".

## Further exploration

- **John Sellars, *Hellenistic Philosophy* (2018).** A thematic introduction to the period covering all the schools.
- **A. A. Long, *Hellenistic Philosophy: Stoics, Epicureans, Sceptics* (1974).** The classic short survey that launched modern interest.
- **A. A. Long and D. N. Sedley, *The Hellenistic Philosophers* (1987).** The standard sourcebook of translated texts with commentary.
- **Martha C. Nussbaum, *The Therapy of Desire* (1994).** Philosophy as therapy in the Epicureans, Sceptics and Stoics.
- **James Warren, *Facing Death: Epicurus and His Critics* (2004).** The Epicurean arguments about death, including symmetry.
- **Pierre Hadot, *Philosophy as a Way of Life* (1995).** The influential and contested "way of life" thesis.
- **A. A. Long, *Epictetus: A Stoic and Socratic Guide to Life* (2002).** The best first book on Epictetus.$hellenistic_master$,
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
  select $hellenistic_quiz$[
    {"type": "mcq", "prompt": "Where did the Cynic Diogenes of Sinope live, according to the ancient evidence?", "options": ["In a wooden barrel", "In a large ceramic storage jar (pithos)", "In the Stoa Poikilē", "In Epicurus' Garden"], "answerIndex": 1, "explanation": "Diogenes lived in a pithos, a large ceramic storage jar. The 'barrel' is a later Latin reinterpretation beginning with Seneca; barrels did not exist in his time.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these is one of the Stoic 'indemonstrables', in modern simplified form?", "options": ["If p then q; p; therefore q", "Every S is P; every P is Q; therefore every S is Q", "Either p or q; p; therefore q", "Some S is P; therefore every S is P"], "answerIndex": 0, "explanation": "The first indemonstrable is what we call modus ponens. The Stoic logic was propositional; 'every S is P' belongs to Aristotle's term logic, and the other options are invalid (with exclusive 'or', p gives not-q).", "id": "q2"},
    {"type": "mcq", "prompt": "What is the status of the so-called 'Epicurean paradox' about God and evil ('Is God willing to prevent evil, but not able?')?", "options": ["It is the central argument of Epicurus' Letter to Menoeceus", "It was composed by Lucretius in De Rerum Natura", "It is found in Epicurus' Principal Doctrines", "It is found in no text of Epicurus and is attributed to him only by the Christian writer Lactantius"], "answerIndex": 3, "explanation": "No text of Epicurus contains it. Lactantius reports it without a source, one scholar argues it comes from a non- or anti-Epicurean source, and the popular wording reached us via Bayle and Hume.", "id": "q3"},
    {"type": "mcq", "prompt": "In the Pyrrhonian scheme of Aenesidemus and Sextus Empiricus, what leads to suspension of judgement (epochē)?", "options": ["A cognitive impression that guarantees its own truth", "The swerve of atoms in the soul", "Opposing appearances and arguments of equal weight (equipollence)", "Obedience to the laws of one's city"], "answerIndex": 2, "explanation": "The sceptic sets out oppositions until they balance (equipollence); suspension follows, and then tranquillity. The cognitive impression was the Stoic criterion the sceptics attacked.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Epicurean argument that death is nothing to us step by step, then explain Thomas Nagel's deprivation objection and one Epicurean reply. Add Lucretius' symmetry argument and one reply to it.", "rubric": "A strong answer reconstructs the argument: death is annihilation (the atomic soul scatters and sensation ends); the living are not yet annihilated, so death does not affect them; for something to be bad for someone, that person must exist; the dead do not exist; so death is bad for neither the living nor the dead, and fearing it is foolish. It notes the argument concerns being dead, not painful dying. It gives Nagel's objection (1970): things can be bad by depriving us of goods, not only by causing bad experiences (e.g. missing a joyous occasion while unconscious), so death makes a life worse than it would have been. It gives the Epicurean 'timing puzzle' reply: when is the dead person harmed, and who is the subject? It states the symmetry argument (we do not mind pre-natal non-existence; post-mortem non-existence is relevantly similar) and one reply: death deprives us of future goods; Nagel's point that one could not have been born much earlier and still be oneself; or Parfit's rational bias towards the future.", "id": "q5"},
    {"type": "open", "prompt": "Explain how Chrysippus tried to reconcile Stoic determinism with moral responsibility, and say why scholars call his view compatibilist.", "rubric": "A strong answer explains that for the Stoics every event follows from prior causes by fate. It presents the Lazy Argument and Chrysippus' reply that outcomes are 'co-fated' with the actions that bring them about (recovery with calling the doctor). It explains the cylinder and spinning top (or cone): an outside push starts each moving, but each moves according to its own nature; likewise an impression starts the process, but assent depends on our own character, so 'assent will be in our power'. It notes this is compatibilism because responsibility is made consistent with determinism, without freedom to do otherwise. It may mention the dog-and-cart image and the dispute over whether it goes back to Zeno and Chrysippus.", "id": "q6"}
  ]$hellenistic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/hellenistic-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
