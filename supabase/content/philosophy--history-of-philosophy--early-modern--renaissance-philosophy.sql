-- Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/renaissance-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/renaissance-philosophy',
    'research',
    'advanced',
    'read',
    $renaissance_master$> **Renaissance philosophy is less a single movement than a crowded crossroads between the medieval schools and the new philosophies of the seventeenth century.** This chapter follows the humanists' attack on scholastic Latin and logic, the return of Plato through Byzantine scholars and Marsilio Ficino, Pico della Mirandola's untitled *Oration*, Pietro Pomponazzi's case that the soul is by nature mortal, Machiavelli's realism and the quarrel over how to read him, the revival of scepticism and Montaigne's *Essays*, Marie de Gournay's argument for the equality of the sexes, and the trial of Giordano Bruno.

## A Disputed Border

*Scotus, Ockham and the Late Medieval Debates* ended by asking whether scholasticism declined, and noted that Ficino and Pico, the names most often called "Renaissance", both died before 1500.

Two cautions help. First, "humanism" is a later label: Brian Copenhaver notes that the word came to name the new study of ancient languages only in the nineteenth century. Second, Aristotle never went away. Older accounts pictured a "unified, static, and sterile" university Aristotelianism "beaten into retreat by the rise of Platonism"; David Lines calls that picture "now largely outdated". Charles Lohr counted more Latin commentaries on Aristotle written between 1500 and 1650 than in the whole millennium from Boethius to Pomponazzi, and Charles Schmitt urged historians to speak of "Renaissance Aristotelianisms" in the plural.

## The Humanists against the Schoolmen

Petrarch (1304–1374), "often referred to as the father of humanism", set the tone, as the previous chapter described. He complained that Aristotle's ethics "lacks the words that sting and set afire and urge toward love of virtue and hatred of vice". The humanists, Lines explains, "prized eloquence and saw it as key to the production of virtue": philosophy that did not move its readers to be better had missed its point. Petrarch praised Plato as the "prince of philosophers", though he knew no Greek. Yet humanists did not simply reject Aristotle: Leonardo Bruni (1370–1444), chancellor of Florence and, for Hans Baron, a hero of "civic humanism", retranslated Aristotle's moral philosophy into Ciceronian Latin.

The sharpest humanist critic was Lorenzo Valla (born most likely in 1406; died 1457), "one of the most important humanists of his time", in Lodi Nauta's words, with "a sense of self-importance verging on the pathological". In 1439–40 he showed that the Donation of Constantine, in which Constantine supposedly handed the Western Empire to the Church, was a forgery. Nicholas of Cusa had already called it one, but Valla is credited with the first exposure based on solid philological arguments, that is, on the history of the language itself: its Latin could not have been written in the fourth century. Later scholars added further signs of forgery, such as anachronistic terms and dates that contradict one another. The work was formally published only in 1517.

His *Repastinatio* (a "re-ploughing" of dialectic and philosophy) turned the same tools on scholastic logic. Aristotle's ten categories shrank to three, substance, quality and action, modelled on noun, adjective and verb. Scholastic coinages such as *quidditas* ("whatness") were rejected for breaking the rules of Latin. The syllogism was artificial and "puerile": once you have said that every man is an animal and Socrates is a man, why bother concluding that Socrates is an animal?

Women joined this learned culture against open hostility. Isotta Nogarola of Verona (1418–1466) wrote a *Dialogue on the Equal or Unequal Sin of Adam and Eve* (1451) and, ridiculed, asked why she had been "born a woman, to be scorned by men in words and deeds". Cassandra Fedele spoke before the doge and Senate of Venice on higher education for women. Laura Cereta of Brescia (1469–1499) wrote Latin letters including a "Defense of the Liberal Instruction of Women"; critics replied that a woman should not be educated and that her father must have written them. Her editor Diana Robin calls her an early feminist.

## Plato Returns to Florence

Manuel Chrysoloras began teaching Greek in Florence in 1397. From 1438 a Byzantine delegation led by Emperor John VIII Palaiologos attended the Council of Ferrara–Florence to negotiate the union of the churches, the price demanded for Western help against the Ottomans. With it came Gemistos Plethon, who "reintroduced Plato's ideas to Western Europe" and wrote in Florence *On the Differences of Aristotle from Plato*, attacking the "frail Aristotelian foundation of Scholasticism". His pupil Bessarion became a cardinal and, in Eva Del Soldato's phrase, the "not so grey eminence responsible for the return of Plato in the Western world"; his *Against the Slanderer of Plato* (printed 1469) answered George of Trebizond's attack on Plato as ignorant, impious and vicious.

A famous story says that Cosimo de' Medici heard Plethon lecture and was inspired to found a Platonic Academy in Florence. James Hankins argues that Ficino's preface, the source of the story, was misread: there is no independent evidence the two men met, a language barrier stood between them, and the "Academy" was more an "informal gymnasium". Christopher Celenza agrees that the sources do not show "a formal school … with regular meetings"; Ficino's academy "was not a specific place but a mindset". Arthur Field (1988) treats the Academy as a real circle rooted in Florentine culture. What is documented is a letter of 1462 thanking Cosimo for "the Academy you arranged for us on the estate in Careggi".

## Ficino: Plato for Christians

Marsilio Ficino (1433–1499), son of Cosimo's physician and later a priest, received from Cosimo in 1462 the commission and the manuscript for a Latin Plato. The complete Plato appeared in October 1484, a date "almost certainly chosen for astrological reasons": the first translation of all of Plato into a Western language, standard for over three centuries (see *Plato*). In the late 1480s he began the first full Latin Plotinus (see *Plotinus and Neoplatonism*).

Ficino's Plato was a Christian Plato, the summit of an "ancient theology" handed down from Hermes Trismegistus through Orpheus and Pythagoras to "our divine Plato"; only in the early seventeenth century did Isaac Casaubon show the Hermetic writings to be late antique. Ficino taught that "the purpose of love is the enjoyment of beauty", beauty being the "bait" that draws the soul toward God, and invented the phrase "Platonic love", which meant love as preparation for the love of God, not the modern sexless relationship.

His *Platonic Theology* (written 1469–74, printed 1482) was subtitled *On the Immortality of Souls*, and its first chapter's motto set the stakes:

```quote
"Were the soul not immortal, no creature would be more miserable than man."
Marsilio Ficino · Platonic Theology 1.1 (trans. Allen and Warden) · 1469–74
```

His central argument, from natural desire, runs like this (following the Internet Encyclopedia of Philosophy):

1. The soul's primary goal, a natural desire on which most people act, is to rise to union with God.
2. Nature and God do nothing in vain: a universal natural desire that could never be fulfilled would be "otiose, vain, and even perverse".
3. This union is not reached in this life.
4. So it must be reached after death: the soul is immortal.

God, Ficino added, would be a "wicked tyrant" to plant an aspiration that could not be met. The intellect also works best when freed from "the clouds of phantasmata", the images supplied by the senses, and passive matter could not produce thought. The strongest objection came from Padua, and appears below.

## Pico and the Speech without a Title

Giovanni Pico della Mirandola (1463–1494) studied at Padua with Elia del Medigo, "a Jew and an Averroist Aristotelian". At the end of 1486 he printed 900 theses for a public disputation in Rome, drawn from "ancient and medieval, pagan and Christian, Muslim, and Jewish" authorities, among them Aquinas, Scotus, Ibn Rushd, Ibn Sina, al-Fārābī, Maimonides, Proclus and the "Kabbalist Jews". Behind them lay the conviction that Aristotle and Plato agree "in meaning and content even though they seem to disagree in words". Pico was "the first Christian who described Kabbalah", the Jewish mystical interpretation of scripture, "in detail or treated it as worthwhile". The disputation never happened: Innocent VIII had thirteen theses examined, a commission condemned seven and found six suspect, and when Pico defended them Innocent VIII denounced all 900.

The speech written to open the debate is now called the *Oration on the Dignity of Man*. Pico never gave it a title, and never delivered or published it. His nephew's 1496 edition called it "A Very Elegant Oration"; "On the Dignity of Man" first appears as the book's title in a Basel collection of 1557, though the phrase had been used inside the 1504 edition. In its opening pages, to give Copenhaver's paraphrase, the Creator tells Adam that he, alone of all creatures, can make himself what he wants to be.

From Burckhardt (1860) to Cassirer, Kristeller and Garin, that passage made the *Oration* a manifesto of human freedom. Copenhaver argues that dignity "was not his subject". Pico's aim was "to convince people that they could save their souls by using magic and Kabbalah to change themselves into angels", climbing toward a union in which "we shall be ourselves no longer, but shall be Him, the very one who made us" (Copenhaver's translation). On this reading freedom is a means to losing the self in God. "The *Oration on the Dignity of Man* that located the human condition in freedom and dignity was written—and still is being written—by us post-Kantians, not by Giovanni Pico."

```checkpoint
q: Why do historians such as James Hankins doubt the traditional story of Florence's "Platonic Academy"?
a*: Because there is no independent evidence Cosimo heard Plethon, and the sources do not show a formal school with regular meetings.
a: Because Ficino's Plato translation was not printed until the eighteenth century.
x: The complete Latin Plato was printed in October 1484.
a: Because Cosimo de' Medici opposed the study of Plato.
x: Cosimo commissioned the translation in 1462 and supplied the manuscript.
a: Because the word "Academy" never appears in Ficino's letters.
x: A 1462 letter thanks Cosimo for "the Academy you arranged for us"; the dispute is over what the word meant.
hint: Ask what kind of evidence a formal institution would leave behind.
why: Hankins argues Ficino's preface was misread and the two men may never have met; Celenza calls the academy "not a specific place but a mindset".
---
q: What is Brian Copenhaver's main claim about Pico's *Oration*?
a: That Pico wrote it as a treatise on political liberty.
x: Copenhaver reads it as a religious and magical programme, not a political one.
a: That Pico himself titled it "On the Dignity of Man".
x: Copenhaver stresses that Pico never gave it a title; that title first appears in 1557.
a*: That its subject was not dignity but self-transformation into angels by magic and Kabbalah.
a: That it was the first work ever written on human dignity.
x: Giannozzo Manetti had written a treatise on human dignity shortly after 1450.
hint: Think about where the speech ends up, not where it starts.
why: Copenhaver argues the freedom-and-dignity reading was written "by us post-Kantians", while Pico's goal was a mystical ascent in which we "shall be ourselves no longer".
```

## Pomponazzi: the Soul, by Nature, Is Mortal

Pietro Pomponazzi (1462–1525) taught at Padua and, from 1511, at Bologna. In 1513 the Fifth Lateran Council forbade teaching that the soul is mortal and told philosophers to defend Christian doctrine; three years later Pomponazzi published *On the Immortality of the Soul* (1516). The bull came first, so it was not aimed at his book.

He argued by natural reason and Aristotle alone, without "supposing something from faith or revelation", and "in the way of doubt and not of assertion". Having dismissed Averroes's single shared intellect as "monstrous", he turned on Aquinas's view that each person's intellect is immaterial and survives death (see *Thomas Aquinas*):

1. The human soul is one soul, with powers of growth, sensation and reason, and all of it falls within natural philosophy.
2. As Aristotle said, "the soul does not know at all without some phantasm", a mental image; injuries to the organs show it.
3. Phantasms are produced by the sensitive soul, which works through a bodily organ.
4. So the intellect depends on matter for its object, even though understanding itself uses no organ.
5. What cannot work without the body cannot work once the body is destroyed.
6. So the soul is immortal only "in a relative or qualified sense"; absolutely speaking, it is mortal, "midway between the material and the immaterial".

**The objection from happiness**, Ficino's argument in another form, says humans need an immortal soul to reach their end, the perfection of the intellect. Pomponazzi replied that perfect contemplation belongs only to the rare gifted, healthy and withdrawn person: "even in long centuries, barely one is found". So it cannot be humanity's common end; that end is practical virtue, reachable in this life. **The objection from morality** says that without punishment after death, nothing will stop crime. He replied that "the essential reward of virtue is virtue itself", and that teaching about the afterlife was introduced to keep those incapable of philosophy in order.

His conclusion was that immortality is a "neutral problem": reason proves neither side, so faith decides, and Christians must hold the soul immortal. Was this sincere? Renan read such provisos as a protective screen; Perrone Compagni and others see a coherent medieval separation of natural philosophy from theology. Accused of heresy in 1514 and 1518, he was protected by the papal secretary (later cardinal) Pietro Bembo and was never tried, though copies of his books were burned at Venice, and two of his later works, *On Incantations* and *On Fate*, were placed on the Index in the 1570s.

## Machiavelli and the Effectual Truth

Niccolò Machiavelli (1469–1527) served the Florentine Republic as Second Chancellor until the Medici returned in 1512; in early 1513 he was imprisoned and tortured on a false suspicion of conspiracy. At the end of that year he wrote *The Prince*, published after his death in 1532 (*The Renaissance* gives the setting).

Earlier "mirrors for princes" urged rulers to be good. Machiavelli held that "the only real concern in politics is the acquisition and maintenance of power", and preferred "to go directly to the effectual truth of the thing than to the imagination of it". His *virtù* means not moral virtue but whatever a ruler needs "to maintain his state": above all a flexible disposition, able to move from good to evil and back as fortune dictates. Chapter 17 asks whether it is better to be loved or feared:

```quote
"One can say this in general of men: they are ungrateful, disloyal, insincere and deceitful, timid of danger and avid of profit…. Love is a bond of obligation which these miserable creatures break whenever it suits them to do so; but fear holds them fast by a dread of punishment that never passes."
Niccolò Machiavelli · The Prince, ch. 17 (trans. Allan H. Gilbert, revised) · 1513
```

Set out as an argument:

1. A ruler's aim is to maintain the state.
2. People in general are ungrateful, deceitful and greedy for gain.
3. Love is a bond of obligation that such people break when it suits them; fear holds them by a dread of punishment that does not pass.
4. So, where a ruler cannot have both, it is safer to be feared than loved.

The limit is that he must avoid being hated, above all by keeping his hands off his subjects' property and women. **The moralist's objection** is that this turns politics into plain immorality. Quentin Skinner replies that Machiavelli still preferred conventional virtue, other things being equal, treating vice as a last resort: the prince should do good if he can but be prepared to do evil if he must. Croce saw instead a separate sphere of political necessity.

How to read him is among the oldest debates in political philosophy. Leo Strauss (1958) called him a "teacher of evil". The once-popular "Galileo of politics" reading, of a detached scientist, has "largely gone out of favor". Skinner, Pocock and Viroli read him as a republican, setting *The Prince* beside his *Discourses on the First Ten Books of Livy*; Pocock traced that republicanism to the American founders, and Pettit, Skinner and Viroli draw on it for freedom as non-domination. A line from Alberico Gentili through Spinoza and Rousseau to Garrett Mattingly and Erica Benner reads *The Prince* as satire, irony or a covert warning, an exposé of tyranny rather than advice to it, and Mary Dietz called it a "trap" for the Medici. *Hobbes* and *Authority and the State: the Social Contract and Its Critics* carry the realist question forward.

## The Return of the Sceptics

Before 1562 ancient scepticism was known mostly through Cicero, Augustine and Diogenes Laertius. Sextus Empiricus, the Greek source for Pyrrhonism described in *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*, survived in manuscript, and Pico's nephew Gianfrancesco used one for his *Examination of the Vanity of the Doctrines of the Gentiles* (1520), often called the first use of Pyrrhonism to defend Christianity. Religion raised the stakes: in 1524 Erasmus told Luther, "I take so little pleasure in assertions that I will gladly seek refuge in Scepticism"; Luther answered, "The Holy Spirit is no Sceptic!" (see *The Protestant and Catholic Reformations*).

In 1562 the printer Henri Estienne published at Geneva a Latin translation of Sextus's *Outlines of Pyrrhonism*. That was only the *Outlines*: a complete Latin Sextus followed in 1569, and the Greek text was first printed in 1621. Richard Popkin argued that this revival, meeting the Reformation's quarrel over the "rule of faith", produced a "crisis of doubt" that shaped early modern philosophy. The thesis is influential and contested: critics say it neglects the Academic scepticism of Cicero's *Academica*, which allowed one to follow what is probable, and that Sextus was never wholly forgotten.

## Montaigne: What Do I Know?

Michel de Montaigne (1533–1592), a magistrate at Bordeaux and the friend of Étienne de La Boétie, retired in 1571 to the library in his tower, its beams painted with maxims from Ecclesiastes, Sextus and Lucretius. The *Essays* appeared in 1580, gained a third book in 1588, and were published again in 1595 in Marie de Gournay's edition. He was twice mayor of Bordeaux and remained a Catholic through the Wars of Religion. Around 1576 he struck a medal bearing "I abstain" in Greek and the question "Que sais-je?", "What do I know?"

{{image: Michel de Montaigne | Montaigne in a portrait of the 1570s.}}

His longest essay, the "Apology for Raymond Sebond", defends Sebond's claim that the articles of faith can be shown by natural reason. To the objection that Sebond's arguments prove nothing, Montaigne replies that no human reasoning proves anything conclusively:

1. Animals perceive differently, and we have no criterion for preferring our impressions to theirs.
2. Centuries of philosophy have produced no theory that commands general assent.
3. With fewer senses we would picture a different world, and there may be qualities we cannot perceive.
4. To settle this we would need a criterion, and it runs in a circle: "To judge the appearances that we receive of objects, we would need a judicatory instrument; to verify this instrument, we need a demonstration; to verify the demonstration, an instrument: there we are in a circle" (Donald Frame's translation). If reason is the judge instead, each demonstration needs another, without end.
5. The Academic escape, following probable appearances, needs a criterion of likelihood and so regresses too; following custom rests on something that changes.
6. So "nothing certain can be established about one thing by another, both the judging and the judged being in continual change and motion". Knowledge comes only by divine grace.

Pyrrhonism, he wrote, presents man "naked and empty", "annihilating his judgment to make room for faith". The obvious objection is that this proves too much: it destroys Sebond's arguments along with his critics'. Montaigne seems to know it, calling the move a "final fencer's trick", a "desperate stroke" to be used "reservedly". Hence the debate over his meaning. Popkin read him as a sincere sceptical fideist, putting faith where reason fails. Hartle and Maia Neto reply that the argument is dialectical: it takes the premises of Sebond's secular critics and shows that, if knowledge is what they say, there is none. Others stress his later turn to Cicero's probabilism. *Scepticism and the Answers to It* follows these arguments forward.

In "Of Cannibals" (c. 1580), on the Tupinambá of Brazil, he wrote that "each man calls barbarism whatever is not his own practice". Yet we may call such people barbarians "in respect to the rules of reason, but not in respect to ourselves, who surpass them in every kind of barbarity", a jab at Christians torturing each other in the civil wars. Lévi-Strauss hailed him as "the pioneer of cultural relativism"; others note that ranking degrees of barbarity by reason is not what a thoroughgoing relativist would do.

```checkpoint
q: What was Pomponazzi's reply to the objection that humans need an immortal soul to reach their end?
a: That the intellect works best when freed from the senses.
x: That is Ficino's supporting argument for immortality, not Pomponazzi's reply.
a*: That perfect contemplation is reached by barely one person in centuries, so humanity's common end must be practical virtue in this life.
a: That the Fifth Lateran Council had settled the question in 1513.
x: He argued by natural reason alone, without supposing anything from faith.
a: That the soul is reincarnated until it reaches perfection.
x: He denied that the soul, absolutely speaking, survives the body at all.
hint: How many people actually reach perfect contemplation?
why: Pomponazzi held that a goal so few attain cannot be the end of human beings in general; virtue, its own reward, can be had now.
---
q: What is the "circle" in Montaigne's "Apology for Raymond Sebond"?
a: The cycle of rebirth he borrowed from Pythagoras.
x: The circle concerns how judgments could be verified, not the fate of souls.
a: The way custom always returns society to its starting point.
x: Custom appears in the argument, but as a changeable guide, not as the circle.
a: The proof that God's existence follows from the idea of God.
x: Montaigne argues that no human reasoning proves anything conclusively.
a*: To judge appearances we need an instrument, to verify it a demonstration, and to verify that an instrument again.
hint: Think of what we would need to test a measuring device.
why: Any criterion of truth needs another to support it, so reasoning either circles or regresses forever.
```

## Marie de Gournay: the Equality of Men and Women

Marie de Gournay (1565–1645), whom Montaigne called his "adopted daughter", lived precariously as a single woman writing in Paris and translated Cicero, Tacitus and Virgil. In *Equality of Men and Women* (1622) she argued, as John J. Conley reconstructs it:

1. If women were naturally inferior, the best authorities and the historical record would show it.
2. The philosophers support equality: Plato, "to whom no one denies the title of 'divine,' assigns them the same rights, faculties, and functions in the *Republic*", and so do Aristotle, Cicero and Plutarch.
3. Scripture makes both sexes in the divine image, hence both rational.
4. History shows women's capacity, in Sappho, Hypatia and Catherine of Siena.
5. Any gap in achievement comes from education: if women reach "the heights of excellence" less often, "it is because of this lack of good education".
6. So women's subordination rests on prejudice, not nature.

Her *Ladies' Grievance* (1626) called women's condition a tacit slavery. The argument from education looks forward to *Women Philosophers of the Early Modern Era*.

## Bruno and the Infinite Universe

Giordano Bruno (born at Nola in 1548), a Dominican who fled his order in 1576, held, starting from Copernicus, that the universe is infinite, alive and eternal, "populated by numberless solar systems". Denounced to the Venetian Inquisition in 1592 and sent to Rome, he said he "neither needed nor wished to recant", and was burned alive in the Campo de' Fiori on 17 February 1600.

Nineteenth-century commentators made him a "martyr for science". The record is less tidy. The eight heretical propositions drawn up against him are lost, and Luigi Firpo's reconstruction of the charges is mostly theological (the Trinity, Christ's divinity, the Mass, the transmigration of souls, magic) alongside the plurality of worlds, on which Bruno held firm. Frances Yates (1964) argued he was condemned for religion rather than cosmology, and made him a Hermetic magus; others reject this, and Dilwyn Knox says such readings obscure his stated aim of a "new philosophy".

## Connections and Afterlives

This was a connected Renaissance. Pico drew on Islamic and Jewish philosophers and learned from Jewish teachers, and Judah Abravanel (Leone Ebreo), driven from Spain in 1492, wrote *Dialogues of Love*, "regarded as one of the most important philosophical works of its time". Wang Yangming (1472–1529), the Ming Neo-Confucian of the School of Mind, lived at the same time as Machiavelli, and Mullā Ṣadrā of Safavid Iran was a younger contemporary of Montaigne; both appear in *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*. Descartes drew on Montaigne without naming him. Whether the soul's survival can be proved, whether politics answers to morality, whether reason has a criterion of truth: *Descartes* and *Hobbes* inherited these questions in the form the Renaissance gave them.

## Further exploration

- **Brian P. Copenhaver and Charles B. Schmitt, *Renaissance Philosophy* (1992).** The standard one-volume survey.
- **James Hankins (ed.), *The Cambridge Companion to Renaissance Philosophy* (2007).** A multi-author introduction, including Celenza on the Platonic revival.
- **Christopher S. Celenza, *The Intellectual World of the Italian Renaissance: Language, Philosophy, and the Search for Meaning* (2018).** Humanism, Ficino and Pico in their setting.
- **Brian P. Copenhaver, *Magic and the Dignity of Man: Pico della Mirandola and His Oration in Modern Memory* (2019).** The case that the "dignity" reading is a modern invention.
- **Quentin Skinner, *Machiavelli* (1981).** A short contextual and republican reading.
- **Richard H. Popkin, *The History of Scepticism from Savonarola to Bayle* (2003).** The classic, and contested, account of the sceptical revival.
- **Sarah Bakewell, *How to Live, or A Life of Montaigne in One Question and Twenty Attempts at an Answer* (2010).** A lively general-reader biography.$renaissance_master$,
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
  select $renaissance_quiz$[
    {"type": "mcq", "prompt": "What is true of the title 'Oration on the Dignity of Man'?", "options": ["Pico never gave the speech a title; 'On the Dignity of Man' first appears as the book's title in a Basel collection of 1557", "Pico chose it for the printed version of 1486", "Innocent VIII gave it that title when he condemned the 900 theses", "It was Ficino's name for Pico's speech in his 1484 Plato"], "answerIndex": 0, "explanation": "According to Brian Copenhaver, Pico never titled, delivered or published the speech. His nephew's 1496 edition called it 'A Very Elegant Oration', and the familiar title first appears in 1557. Copenhaver also argues that dignity was not its subject.", "id": "q1"},
    {"type": "mcq", "prompt": "How does Pomponazzi argue that the human soul is, absolutely speaking, mortal?", "options": ["Scripture teaches that the soul dies with the body", "Averroes proved that all humans share one intellect", "The intellect cannot know without phantasms, phantasms need a bodily organ, and what cannot work without the body cannot work after the body is destroyed", "The Fifth Lateran Council required philosophers to teach that the soul is mortal"], "answerIndex": 2, "explanation": "Pomponazzi argued from Aristotle that 'the soul does not know at all without some phantasm', so the intellect depends on matter for its object. He rejected Averroes's single intellect, and the Lateran bull of 1513 forbade teaching mortality.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the printing of Sextus Empiricus is accurate?", "options": ["The complete Greek text was printed at Geneva in 1562", "Henri Estienne's 1562 Latin translation covered only the Outlines of Pyrrhonism; a complete Latin Sextus followed in 1569 and the Greek text in 1621", "Sextus was unknown in Europe before Montaigne discovered him", "Sextus was first printed by Gianfrancesco Pico in 1520"], "answerIndex": 1, "explanation": "The 1562 edition was a Latin translation of the Outlines only. Gianfrancesco Pico had used a Sextus manuscript, but did not print the text; the Greek appeared only in 1621.", "id": "q3"},
    {"type": "mcq", "prompt": "Which reading of Machiavelli is associated with Leo Strauss?", "options": ["That The Prince was a satire meant as a trap for the Medici", "That Machiavelli was a republican theorist of freedom as non-domination", "That he was the detached 'Galileo of politics'", "That he was a 'teacher of evil'"], "answerIndex": 3, "explanation": "Strauss (1958) called Machiavelli a 'teacher of evil'. The trap reading is Mary Dietz's, the republican reading belongs to Skinner, Pocock and Viroli, and the scientific reading has largely gone out of favour.", "id": "q4"},
    {"type": "open", "prompt": "Set out Machiavelli's argument in The Prince, chapter 17, that it is safer to be feared than loved. What is the strongest moral objection, and how have interpreters answered it? Briefly describe two other ways scholars read him.", "rubric": "A strong answer gives the steps: the ruler's aim is to maintain the state; people in general are ungrateful, deceitful and greedy; love is a bond of obligation they break when it suits them, while fear holds them by dread of punishment; so, if one cannot have both, it is safer to be feared. It notes the limit: avoid hatred, chiefly by leaving subjects' property and women alone. It states the objection that this makes politics simple immorality and gives Skinner's reply (conventional virtue preferred other things being equal, vice as a last resort) or Croce's separate sphere of political necessity. It describes at least two readings: Strauss's 'teacher of evil', the republican reading (Skinner, Pocock, Viroli), satire or a 'trap' (Gentili, Spinoza, Rousseau, Mattingly, Benner, Dietz), or the outdated scientific reading.", "id": "q5"},
    {"type": "open", "prompt": "Explain Montaigne's argument in the 'Apology for Raymond Sebond' that no human reasoning proves anything conclusively, including the 'circle' of the criterion. How have scholars disagreed about what he meant by it?", "rubric": "A strong answer explains the setting (defending Sebond's claim that faith can be shown by reason, against the objection that his arguments prove nothing) and the main steps: animals' differing perceptions, endless philosophical disagreement, the limits of our senses, the circle (judging appearances needs an instrument, verifying it a demonstration, verifying that an instrument) or regress, the failure of the Academic and custom-based escapes, and the conclusion that knowledge comes only by grace. It notes the 'fencer's trick' warning. It presents the debate: Popkin's sincere sceptical fideism versus Hartle and Maia Neto's dialectical reading (drawn from the critics' premises), with credit for mentioning his turn to Ciceronian probabilism or the contested Popkin thesis of a sceptical crisis.", "id": "q6"}
  ]$renaissance_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/renaissance-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
