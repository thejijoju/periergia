-- Augustine and Early Christian Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/augustine @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/augustine',
    'research',
    'advanced',
    'read',
    $augustine_master$> **How Christianity took in Greek philosophy, and the thinker who did most to shape the result.** Early Christians disagreed about what philosophy was for. This chapter follows that encounter, from Justin Martyr and Tertullian to Augustine of Hippo (354–430): his *Confessions*, his answer to the sceptics ("if I am mistaken, I exist"), set beside Descartes, his puzzle about time, evil as a lack of good, grace and original sin, the *City of God*, and the debates over his views of women, sexuality and slavery. It ends with Boethius, whose *Consolation of Philosophy* asked how God can know the future if we are free.

## Athens and Jerusalem

From the second century, educated Christians asked how their faith related to the Greek schools. Justin Martyr (born c. 90–100, died c. 165), "Justin the Philosopher", from a Greek family at Flavia Neapolis (modern Nablus) in Samaria, tells in his *Dialogue with Trypho* how he searched for wisdom. A Stoic could not explain God to him, a Peripatetic (a follower of Aristotle) was too eager for his fee, and a Pythagorean demanded that he first learn music, astronomy and geometry. He became a Platonist, and was finally converted after meeting an old man. That is a literary self-portrait, but its message is clear: philosophy was a road to Christianity. Justin held that the divine Word, the **Logos**, had shown itself before Christ, so that Socrates and Heraclitus had in effect been Christians. He was beheaded around 165, under Marcus Aurelius.

At Alexandria, Clement (c. 150 – c. 215), deeply shaped by Plato and the Stoics, treated philosophy as the Greeks' preparation for the gospel. Origen (c. 185 – c. 253) used philosophy "as an ancillary to the exposition and harmonization of scripture"; most scholars think his teacher Ammonius was Ammonius Saccas, the teacher of Plotinus, though that is disputed.

Tertullian of Carthage (c. 155 – c. 220) supplied the most famous line on the other side. In *On the Prescription of Heretics*, chapter 7, he asked, in Peter Holmes's translation: "What indeed has Athens to do with Jerusalem? What concord is there between the Academy and the Church?" It is often read as a blanket rejection of reason, but the context is narrower. The treatise attacks heretics, and the chapter argues that heresies come from philosophy: Valentinus from Plato's school, Marcion's god from the Stoics. Tertullian's target is philosophical speculation set against the authority of scripture, and he himself used Stoic ideas, holding that God is in a Stoic sense bodily. The slogan *credo quia absurdum*, "I believe because it is absurd", is a misattribution: he wrote "credible because unfitting… certain because impossible", and the "absurd" form is, as Peter Harrison has shown, an early-modern construction.

## A Roman African

Aurelius Augustinus was born on 13 November 354 at Thagaste in the Roman province of Numidia, now Souk Ahras in Algeria. His mother, Monnica, was a devout Christian; his father, Patricius, was baptised on his deathbed. Whether he should be called a Berber is debated. Many accounts say scholars "generally agree" that the family was Berber, though heavily Romanised and Latin-speaking; Monnica's name is the usual evidence. The Stanford Encyclopedia's Christian Tornau is more cautious: the name "may suggest a Berber or Punic origin", but "there is little in Augustine's work to indicate an African rather than a Roman identity". Black and African theologians and postcolonial readers have either stressed his African identity or read him as a voice of Roman imperialism; Justo González calls him a "mestizo" of both heritages. He was a Roman African, probably of Berber descent on his mother's side; how much that mattered to him is disputed.

{{image: Augustine of Hippo | Saint Augustine as imagined by Philippe de Champaigne around 1645, more than twelve centuries after his death.}}

He studied rhetoric at Madauros and Carthage and never mastered Greek. At about eighteen, in Carthage, he took a partner, whom he never names, and lived faithfully with her for some fourteen years; their son was Adeodatus. At the same age Cicero's lost *Hortensius* turned him to philosophy, as *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* notes. For nine years he was a "hearer" among the Manichees, followers of a dualistic religion of Persian origin that taught two rival principles, good and evil.

In 383 he went to Rome, then won the chair of rhetoric at Milan, the western capital. There Bishop Ambrose taught him to read the Bible allegorically, and in 386 he read the "books of the Platonists" in Marius Victorinus' Latin translation: most scholars now think some treatises of Plotinus and probably a selection of Porphyry, the thinkers of *Plotinus and Neoplatonism*. He knew them in Latin and in selection, not the Greek whole. In Milan, too, he sent his partner away to make room for an advantageous marriage, which never took place.

In the summer of 386, as he tells it, he was in a garden in Milan when he heard a child's voice chanting "*tolle lege, tolle lege*", "take and read". He opened Paul's letters at random, read Romans 13:13–14, "not in rioting and drunkenness, not in chambering and wantonness", and was converted. Ambrose baptised him at Easter 387. Monnica died at Ostia in 387 or 388. Ordained priest at Hippo Regius (modern Annaba) in 391, "apparently against his will", he was bishop there from about 395–396 until his death on 28 August 430, as the Vandals besieged the city.

## The Confessions: Philosophy in Autobiography

The *Confessions*, thirteen books written about 396–400, is probably Augustine's most original work, "philosophy in autobiography" (Mann's phrase) rather than an autobiography in the modern sense. Many have called it the first autobiography; it is unique in ancient literature and greatly shaped the later genre. Books 1–9 tell his life up to Monnica's death; Books 10–13 turn to memory, time and Genesis. It opens, in J. G. Pilkington's translation: "Thou hast formed us for Thyself, and our hearts are restless till they find rest in Thee."

The narrative is itself philosophy. In Book 2 he and some friends steal pears they do not want and mostly throw away; Augustine dissects the act as sin chosen for its own sake, a disordered love of lesser goods. In Book 8 he is torn between two wills, both his own. As a youth he had prayed, "Give me chastity and continence, but not yet" (8.7.17): a genuine line, of which the popular "Lord, make me chaste, but not yet" is a paraphrase.

Augustine drew no line between philosophy and theology: Christianity was "the true philosophy". His method was later labelled "faith seeking understanding", and a proof-text he often cited was Isaiah 7:9 in its Old Latin version, "*nisi credideritis, non intellegetis*" ("unless you believe, you will not understand"). Faith comes first in time; understanding is higher in value.

## Answering the Sceptics: "If I Am Mistaken, I Exist"

His earliest surviving work, *Against the Academics* (386), was written to escape the "despair" of thinking truth unattainable. The Academic sceptics, Plato's later successors, whom Augustine knew from Cicero, held that nothing can be known for certain. He needed only to show that some knowledge is immune to doubt, and offered three kinds: self-referential knowledge (the sceptic at least knows what he is rejecting); knowledge of how things appear ("something appears white to me"); and truths of logic and mathematics, valid awake or dreaming.

From the second kind grew his signature argument, which first appears just after *Against the Academics*, recurs in his later works and is put most crisply in the *City of God* 11.26: "*si enim fallor, sum*". In R. W. Dyson's translation: "I do not at all fear the arguments of the Academics when they say, What if you are mistaken? For if I am mistaken, I exist." Step by step:

1. The sceptic objects: "What if you are mistaken?"
2. Suppose I am mistaken in believing that I exist.
3. Only something that exists can be mistaken.
4. So if I am mistaken, I exist.
5. So whether or not I am mistaken, I exist: my belief that I exist cannot be false.
6. By the same reasoning I know that I live and that I know this; and I know that I love this existing and knowing.

The last step mattered to Augustine: being as certain of his willing as of his existing, he knew his choices were his own, against the Manichees, who blamed evil on an alien substance in the soul.

The strongest objection is the sceptic's own: certainty about one's own mind gives no knowledge of the world outside. The reply is that this was never Augustine's aim. It was enough that, however much is conceded about the senses, an inner area of certainty remains, from which the mind can climb towards God as unchanging truth. He paired it with a theory of **illumination**: we see mathematical and moral truths not through the senses or a teacher's words but "for ourselves", by an inner light from God, as Plato's sun makes things visible to the eye.

In the seventeenth century the cogito was soon recognised as an Augustinian idea. The Stanford Encyclopedia judges Augustine's argument "similar to (and probably inspired)" Descartes's "I think, therefore I am", but notes that Augustine made "no attempt to found a coherent and comprehensive philosophy on it". Descartes agreed. In a letter of 1640 to Andreas Colvius he reported reading the passage in the town library: Augustine "does use it to prove the certainty of our existence. He goes on to show that there is a certain likeness of the Trinity in us… I, on the other hand, use the argument to show that this I which is thinking is an immaterial substance with no bodily element. These are two very different things." The inference, he added, could "have occurred to any writer". *Descartes* and *Scepticism and the Answers to It* take the story on; Avicenna's "flying man" (*Falsafa: al-Kindī, al-Fārābī and Avicenna*) is another forerunner.

## Time and Memory

Book 11 begins with Genesis, "In the beginning". God, Augustine says, created time along with changeable things and is himself timelessly eternal, so there was no "before". But what is time?

```quote
"What then is time? If no one asks me, I know: if I wish to explain it to one that asketh, I know not."
Augustine · Confessions 11.14.17 (trans. E. B. Pusey) · c. 396–400
```

His reasoning runs:

1. Time has three parts: past, present and future.
2. The past no longer exists; the future does not yet exist.
3. The present has no length: any "present" year, day or hour divides into parts already past and parts still to come, so the present shrinks to a point without duration.
4. Yet we speak of long and short times, and we measure them.
5. What we measure cannot be the non-existent past or future, nor a present with no length.
6. So past and future exist in the mind: as present memory of things past, present attention to things present, and present expectation of things to come (11.20.26).
7. Evidence: when I recite a psalm I know by heart, the words pass from expectation, through attention, into memory (11.28.38).
8. So time is "a distension of the soul", *distentio animi* (11.26.33), a stretching-out of the mind. This is the nearest the book comes to a definition, and it may echo Plotinus.

An obvious objection: if time is in the mind, what was measured before there were minds, and how do different people share one time? The reply is that this subjectivist reading overstates him. His purpose in Book 11 is ethical and first-personal: against the soul's scattering across past and future he sets Paul's "straining forward" towards God's eternity, and elsewhere he discusses the cosmic time of the physical world. Still, Husserl, Heidegger and Ricœur paid the passage enormous attention, some of them "credited Augustine with their own subjectivist understanding of time". *Time* returns to the question.

## Evil as Privation

"Where does evil come from?" haunted Augustine from youth. The Manichees' two warring principles freed God from blame at the cost of his omnipotence. After reading the Platonists, Augustine adopted Plotinus' view that evil is not a substance but a **privation**, a lack or corruption of good. God, wholly good, made everything that exists, so everything is good in its degree; created things, made from nothing, are changeable and can lose goodness; evil is that loss. Like illness, an absence of health, it can exist only while some good remains. So there is no evil substance to rival God.

Moral evil is an evil will, which has no "efficient" cause, only a "deficient" one: the will's own turning away from God. Of two people of equal disposition facing the same temptation, one yields and one resists, and the difference can only be free choice (*City of God* 12.6). Critics reply that some evils seem positive, not gaps: Todd Calder argues that pain is bad in itself, not just an absence of pleasure. Privation theorists answer that pain's badness lies in disorder, a lack of proper order in the organism. John Hick named this family of answers the "Augustinian theodicy" in 1966; *The Problem of Evil* weighs it.

```checkpoint
q: What does Augustine's argument "si fallor, sum" claim to show?
a*: That I cannot be mistaken in believing that I exist, because only something that exists can be mistaken.
a: That the external world certainly exists.
x: Augustine did not claim this; the sceptic's objection that inner certainty proves nothing about the outside world is exactly what he set aside.
a: That the self is an immaterial substance with no bodily element.
x: That was Descartes's use of the argument, which Descartes himself said was "very different" from Augustine's.
a: That all knowledge comes from the senses.
x: Augustine argued the opposite: logical and mathematical truths hold even in dreams, and his theory of illumination is non-empiricist.
hint: Think about what a mistake requires.
why: Being mistaken requires a mistaken someone, so the doubt "what if you are mistaken?" itself guarantees that I exist.
---
q: Why does Augustine conclude that past and future exist "in the mind"?
a: Because God told Moses so in Genesis.
x: Genesis frames Book 11, but the conclusion comes from an argument about measurement, not from a revealed statement.
a: Because he held that time existed before creation.
x: He held the opposite: God created time with changeable things, so there was no time "before" creation.
a*: Because we measure times, yet the past and future do not exist and the present has no length, so what we measure must be memory and expectation.
a: Because he denied that time exists at all.
x: He did not deny time; he relocated what we measure to memory, attention and expectation.
hint: Ask what it is we measure when we say a time was long.
why: Since none of the three parts of time exists outside the mind in a measurable form, Augustine locates them in present memory, attention and expectation.
```

## Will, Grace and Original Sin

Augustine's *voluntas*, will, is broader than anything in Aristotle or the Stoics; some scholars say he "discovered" the will, while Frede stressed his Stoic debts. In *On Free Choice of the Will* free will is a good, but an "intermediate" one that can be misused, and so the source of moral evil.

His thinking then shifted. Around 395–397, answering Simplicianus on Paul's letter to the Romans, he concluded that even the beginning of faith is a gift of grace, and that fallen humanity is a "lump of sin" from which God justly saves some. Later he summed up (in the Stanford Encyclopedia's translation of the *Retractations*): "I tried hard to maintain the free decision of the human will, but the grace of God was victorious." Earlier Christians such as Origen had seen salvation as cooperation between grace and human effort; Augustine rejected that, and was the first author to use the phrase "original sin" and to add the idea of inherited guilt, which Eastern Orthodoxy rejects.

The issue came to a head with Pelagius, a British ascetic who held that humans are by nature free and able not to sin. Augustine and the African bishops secured his teaching's condemnation in 418, and Augustine spent his last decade fighting Julian of Aeclanum, who accused him of denying free will. His formula: Adam was able not to sin; after the Fall we are not able not to sin; grace restores the ability not to sin and will in the next life give the inability to sin. God's foreknowledge, he added, does not compel us, since God foreknows our choices as what they are, our own (*City of God* 5.9–10). Whether his view of grace broke with his earlier thought is debated, Flasch stressing rupture and Carol Harrison continuity. *Free Will and Determinism* takes up the problem.

## The City of God

When Alaric's Goths sacked Rome in 410, pagans blamed the abandonment of the old gods, as *The Fall of the Roman Empire* recounts. The *City of God* (412–426), twenty-two books, was prompted by the sack but "by no means just a response". Books 1–10 refute Roman religion and Greek philosophy as roads to happiness; Books 11–22 tell the story of two cities.

```quote
"Two cities have been formed by two loves: the earthly by the love of self, even to the contempt of God; the heavenly by the love of God, even to the contempt of self."
Augustine · City of God 14.28 (trans. Marcus Dods) · 412–426
```

Neither city is the Church or the state; the two are mixed in history and separated only at the end, and the city of God lives here as a resident alien. Against Cicero, who defined a commonwealth by justice, Augustine defined a people by what it loves, and concluded that Rome had never been truly just: "Justice being taken away, then, what are kingdoms but great robberies?" (4.4, Dods). No empire is sacred, though medieval "political Augustinianism" later mapped the two cities onto Church and State.

War springs from sin and the lust for power, but Christianity does not demand pacifism: a war can be relatively just if defensive, properly declared or commanded by legitimate authority, and the main test is intention. Ambrose and Cicero came before him, and he wrote no systematic doctrine. Against the Donatists, a rival African church, he justified religious coercion by love: those we love "ought to be both prevented from evil and compelled to good". Critics ask whether compulsion can produce a change of heart.

Slavery he called the unnatural domination of humans over humans, a result of sin: God "did not intend that His rational creature, who was made in His image, should have dominion over anything but the irrational creation". Yet it could keep order, and he repeated the apostle's call for slaves to obey (19.15). As the Stanford Encyclopedia's Christian Tornau observes, like most ancient Christian theologians he had "little or no interest in social reform"; whether this is acceptance of slavery or a theological reframing of it is still argued. *Authority and the State: the Social Contract and Its Critics* follows his political legacy.

## Women and Sexuality

"Outright misogyny is rare in Augustine," Tornau writes, but he took women's subordination for granted. Against much earlier Christian opinion he held that woman too is made in God's image, since the image lies in the intellectual soul, not the body. Yet in *On the Trinity* he mapped man and woman onto higher and lower reason, so that woman is God's image as a human being "but not qua woman", giving inequality metaphysical weight. In his first dialogues, at Cassiciacum, Monnica takes part and is credited with a philosophy of her own; their mixed company of women, teenagers and the unlettered appeals to today's "Philosophy for All" movement.

His "concupiscence" means disordered desire in general. The first sin was disobedience rooted in pride, punished by the disobedience of our own selves, seen most plainly in sexual arousal the will cannot control. Unlike most earlier Christian writers, he thought there would have been sex in paradise, without concupiscence; since the Fall, concupiscence accompanies every conception and passes on original sin. He insisted that rape victims who did not consent remain without sin. Elaine Pagels, in *Adam, Eve and the Serpent*, criticised him energetically for his effect on Christian sexual morality; Lamberigts offered a moderate defence. Hannah Arendt, who wrote her dissertation on his concept of love, blamed him for making love of neighbour an instrument of one's own happiness.

## Boethius and the Consolation of Philosophy

A century later, Anicius Manlius Severinus Boethius was born, about 475–480, into the Roman aristocracy. He served Theoderic, the Ostrogothic king of Italy (493–526), whose rule *Early Medieval Europe* describes, as consul in 510 and later Master of Offices. He planned to translate all of Plato and Aristotle, and managed Aristotle's logic and Porphyry's *Isagoge*, with commentaries; for centuries these were practically the only Aristotle in Latin. Through him the Middle Ages inherited Porphyry's questions about **universals**, general kinds such as "human": are they real or mere concepts, bodily or not, separate from things or in them?

After defending a former consul accused of treason, he was himself charged with treason and magic, imprisoned, and executed in 524 or, as many now think, 526. In prison he wrote the *Consolation of Philosophy*, a prose dialogue with verse interludes between Boethius and Lady Philosophy, which makes no explicit reference to Christianity, itself a puzzle. She shows him that fortune turns like a wheel and that perfect happiness is God, beyond fortune's reach. Then he raises the hardest problem:

1. God foresees everything infallibly.
2. If God foresees that I will do something, I will necessarily do it; otherwise God's foreknowledge would be mere opinion.
3. So nothing we do or will is free, and reward, punishment and prayer are pointless.

One objection is that this is a logical slip: "necessarily, if God knows I will act, I will act" does not yield "my act is necessary". John Marenbon argues it is no fallacy, since to know a future event is to judge it fixed. Philosophy's reply goes deeper. Everything known is grasped "according to the capacity of those who know it", and God is eternal: eternity is not endless time but "the whole, simultaneous and perfect possession of unbounded life" (V.6). So God sees our future acts as we see present ones, without causing them. If I see you walking, you must be walking, but only conditionally; my seeing does not force you. Many modern commentators take this as exposing a logical fallacy about necessity; Marenbon reads it as the Aristotelian necessity of the present, and some recent scholars deny Boethius was an incompatibilist at all. His definition of eternity became the starting point for almost every later medieval discussion of God and time.

```checkpoint
q: What was the main purpose of Augustine's City of God?
a: To argue that the Roman empire was God's chosen instrument.
x: Augustine deliberately refused to give any empire a sacred status.
a*: To refute Roman religion and Greek philosophy as paths to happiness and trace two cities defined by two loves.
a: To identify the city of God with the Church and the earthly city with the state.
x: Neither city is identical with Church or state; that mapping was later "political Augustinianism".
a: To give a systematic doctrine of just war.
x: Augustine discussed war, but never wrote a systematic doctrine of it.
hint: Two loves, two cities.
why: Books 1–10 attack the pagan alternatives; Books 11–22 tell the story of the cities formed by love of God and love of self.
---
q: How does Lady Philosophy reconcile God's foreknowledge with human freedom in Boethius' Consolation?
a: She denies that God knows the future.
x: She keeps God's infallible knowledge; the problem is to show it does not compel.
a: She argues that humans are not really free.
x: Her purpose is to defend freedom, so that reward, punishment and prayer make sense.
a: She says God changes his mind as events unfold.
x: An eternal God who possesses all his life at once does not change his mind.
a*: God is eternal and sees our future acts as present, so his knowledge no more forces them than our seeing forces what we see.
hint: Consider what "eternity" means in her definition.
why: Eternity is the whole, simultaneous possession of unbounded life, so God's knowledge is like seeing, which imposes only conditional necessity.
```

## Afterlives

Augustine was "the greatest influence on medieval Latin philosophy", in the words of the Stanford Encyclopedia's entry on medieval philosophy, though its entry on Augustine stresses that he lived in late antiquity rather than a "medieval" world. Anselm developed his proof of God from *On Free Choice of the Will* (*Early Scholasticism: Anselm, Abelard and the Universities*); *Thomas Aquinas* drew on Boethius' answer on foreknowledge. Luther, Calvin and the Jansenists took up his teaching on grace; Husserl, Heidegger, Ricœur, Arendt and Wittgenstein, whose *Philosophical Investigations* opens with Augustine on learning language, all read him closely.

One of his best-known lines is often misquoted. "*Dilige, et quod vis fac*", "Love, and do what thou wilt", from a sermon on the First Letter of John (around 407), means in context that silence, rebuke, correction or sparing should all spring from love, not that love licenses anything; *ama et fac quod vis* is a misquotation. Boethius' *Consolation* was translated by King Alfred, Jean de Meun, Chaucer and Elizabeth I, and echoed by Dante and Christine de Pizan. "Along with Augustine and Aristotle," Marenbon writes, "he is the fundamental philosophical and theological author in the Latin tradition."

## Further exploration

- **Peter Brown, *Augustine of Hippo: A Biography* (1967; new edition 2000).** The classic life, reissued with an epilogue.
- **James J. O'Donnell, *Augustine: A New Biography* (2005).** A full modern biography of Augustine.
- **Gareth B. Matthews, *Augustine* (2005).** A philosopher's introduction, including the cogito-like argument and time.
- **Robin Lane Fox, *Augustine: Conversions to Confessions* (2015; UK title *Augustine: Conversions and Confessions*).** The first forty-three years of his life, by an Oxford ancient historian.
- **Justo L. González, *The Mestizo Augustine: A Theologian Between Two Cultures* (2016).** Augustine as both Roman and African.
- **David E. Wilhite, *Ancient African Christianity* (2017).** The African Christian world of Tertullian and Augustine.
- **John Marenbon, *Boethius* (2003).** The standard philosophical study of Boethius.$augustine_master$,
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
  select $augustine_quiz$[
    {"type": "mcq", "prompt": "What was Tertullian's question \"What indeed has Athens to do with Jerusalem?\" aimed at, in its original context?", "options": ["Heretics who drew their teachings from philosophy, against the authority of scripture and the apostolic churches", "All use of reason by Christians", "The Roman emperor's persecution of Christians", "The Platonists of Alexandria who taught Origen"], "answerIndex": 0, "explanation": "It comes from On the Prescription of Heretics 7, which argues that heresies spring from philosophy (Valentinus from Plato's school, Marcion from the Stoics). Tertullian himself used Stoic ideas, and the slogan 'credo quia absurdum' is a later misattribution.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Descartes's letter of 1640 to Colvius, how did his use of the 'I exist' argument differ from Augustine's?", "options": ["Augustine had used it to prove that the external world exists", "Augustine had never used the argument at all", "Augustine used it to prove the certainty of our existence and a likeness of the Trinity in us, while Descartes used it to show that the thinking I is an immaterial substance", "Augustine used it to found a complete system of philosophy, which Descartes rejected"], "answerIndex": 2, "explanation": "Descartes found the passage in the town library and called the two uses 'very different things'. The Stanford Encyclopedia likewise notes that Augustine made no attempt to found a comprehensive philosophy on the argument.", "id": "q2"},
    {"type": "mcq", "prompt": "What does Augustine mean by calling evil a 'privation'?", "options": ["Evil is a substance opposed to God, as the Manichees taught", "Evil is matter, as distinct from form", "Evil is an illusion that does not affect anyone", "Evil is a lack or corruption of the good a thing should have, as illness is an absence of health"], "answerIndex": 3, "explanation": "Since God made everything and all that exists is good in its degree, evil cannot be a thing; it is the loss of goodness in changeable creatures. Augustine rejected both Manichean dualism and Plotinus' equation of matter with evil.", "id": "q3"},
    {"type": "mcq", "prompt": "How does Lady Philosophy define eternity in Boethius' Consolation of Philosophy (in John Marenbon's wording)?", "options": ["Time without beginning or end", "The whole, simultaneous and perfect possession of unbounded life", "The endless repetition of the same cosmic cycle", "The moment at which time began"], "answerIndex": 1, "explanation": "Eternity is not endless duration but the possession of all of life at once. So God sees our future acts as present, which, Philosophy argues, does not force them.", "id": "q4"},
    {"type": "open", "prompt": "Set out Augustine's 'si fallor, sum' argument step by step, give the strongest objection to it and the best reply, and compare it with Descartes's cogito.", "rubric": "A strong answer reconstructs the argument: the sceptic asks 'what if you are mistaken?'; suppose I am mistaken that I exist; only something that exists can be mistaken; so if I am mistaken, I exist; so my belief that I exist cannot be false; likewise I know that I live, know and will. It notes the anti-Manichean point that certainty of willing makes my choices my own. It gives the objection that inner, subjective certainty yields no knowledge of the external world, and the reply that Augustine only needed an inner area of certainty from which to ascend to God and truth. It compares with Descartes: similar and probably an inspiration, but Augustine built no system on it; Descartes himself (letter to Colvius, 1640) said Augustine used it for the certainty of existence and a likeness of the Trinity, he for the mind as an immaterial substance.", "id": "q5"},
    {"type": "open", "prompt": "Explain Augustine's argument in Confessions XI that time is a 'distension of the soul', and assess the objection that it makes time merely subjective.", "rubric": "A strong answer sets out the steps: time has three parts; past and future do not exist; the present has no extension; yet we measure times; so what we measure must be in the mind, as memory, attention and expectation; the recited psalm as evidence; hence distentio animi. It states the objection (what was measured before minds existed, and how minds share one time) and the reply that Book 11 is ethical and first-personal, contrasting the soul's dispersion with Paul's straining forward to God's eternity, and that Augustine discusses cosmic time elsewhere. It may note that Husserl, Heidegger and Ricœur took up the passage, some reading their own subjectivism into it, and the context of God's creation of time with the world.", "id": "q6"}
  ]$augustine_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/augustine', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
