-- The Scientific Revolution — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/the-scientific-revolution @ research/advanced/read.
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
    'history/early-modern-period/the-scientific-revolution',
    'research',
    'advanced',
    'read',
    $em_scirev_master$> **Between Copernicus's book of 1543 and Newton's death in 1727**, European scholars transformed how nature was studied. The earth was moved from the centre of the universe; the heavens and the earth were found to obey the same mathematical laws; the body was mapped by dissection and experiment; and new institutions, instruments, and methods of experiment and mathematics took shape. Historians call this the **Scientific Revolution**. This chapter covers its main figures and ideas, from Copernicus to Newton, and the new institutions of science. It also asks two questions historians now take seriously. How much did this "revolution" depend on knowledge from the Islamic world, Asia, Africa, and the Americas? And was it a revolution at all?

## Was There a Scientific Revolution?

The phrase itself became common only in the twentieth century. Some historians question whether a single, sudden revolution happened at all, pointing to its long roots in medieval and Islamic science and to the slow spread of the new ideas. The historian Steven Shapin began his short book on the subject with a deliberate paradox.

```quote
There was no such thing as the Scientific Revolution, and this is a book about it.
Steven Shapin · The Scientific Revolution · 1996
```

Others, such as David Wootton, argue that something genuinely new did emerge: the idea of discovery itself, of facts established by experiment, and of laws of nature expressed in mathematics. Both sides agree that the story is more complicated, and more global, than the old picture of a few European geniuses overturning ignorance.

## The Inheritance

Medieval European natural philosophy, taught in the universities, was based on Aristotle, whose works had reached Latin Europe in the twelfth and thirteenth centuries partly through Arabic translations and commentaries, such as those of Ibn Rushd (Averroes), and partly directly from Greek. Astronomy followed **Ptolemy**, whose second-century system placed the earth at the centre, with the sun, moon, and planets moving on circles within circles.

Astronomers in the Islamic world had long criticised Ptolemy's models. **Nasir al-Din al-Tusi**, who directed the **Maragha** observatory in northwestern Iran (founded in 1259 under the Mongol Ilkhans), had devised in 1247 a geometrical device, now called the **Tusi couple**, which produced straight-line motion from two circles. In fourteenth-century Damascus, **Ibn al-Shatir** built models of the moon and planets that are mathematically very close to those Copernicus later used. Copernicus used the Tusi couple, and historians such as George Saliba and F. Jamil Ragep have argued that he must have learned of these techniques through channels still not fully traced, perhaps via Byzantine Greek manuscripts. The case is strong, though no chain of transmission has been found and some historians allow for independent invention.

## The Heavens Moved

**Nicolaus Copernicus**, a Polish cleric and astronomer, published *On the Revolutions of the Heavenly Spheres* in 1543, the year of his death. He placed the sun near the centre, with the earth as one of the planets, rotating daily and orbiting yearly. His system was no more accurate than Ptolemy's, and few accepted it at first.

The Danish nobleman **Tycho Brahe** built the finest observatory in Europe at Uraniborg, on the island of Hven, and made naked-eye measurements of unprecedented precision. His assistant **Johannes Kepler** used Tycho's data on Mars to show, in 1609, that Mars moves in an **ellipse**, not a circle, sweeping out equal areas in equal times, and later that this held for all the planets; a third law, in 1619, related their periods to their distances from the sun.

**Galileo Galilei** turned a newly invented Dutch device, the **telescope**, to the sky in 1609 and in *The Starry Messenger* (1610) reported mountains on the moon, countless stars in the Milky Way, and four moons orbiting Jupiter. He also studied motion, showing with experiments on inclined planes that falling bodies accelerate uniformly. Galileo wrote that the book of nature is written in the language of mathematics. His *Dialogue Concerning the Two Chief World Systems* (1632), which ridiculed the earth-centred view, led to his **trial** by the Roman Inquisition in 1633. He was forced to recant and spent his last years under house arrest. The trial has become a symbol of conflict between science and religion, but historians stress that it also involved church politics, Galileo's provocation of the pope, and the genuine lack, at the time, of proof that the earth moved.

## Body and Blood

In the same year as Copernicus's book, 1543, **Andreas Vesalius**, a Flemish anatomist who had taught at Padua, published in Basel *On the Fabric of the Human Body*, based on his own dissections, with magnificent woodcut illustrations. He corrected errors in the ancient physician Galen, many of which came from dissecting animals rather than humans. In 1628 the English physician **William Harvey** showed by experiment and calculation that the blood **circulates**, pumped by the heart. (In the thirteenth century the Damascus-born physician Ibn al-Nafis, working in Cairo, had already described the pulmonary circulation, the passage of blood through the lungs; whether European anatomists knew of his work is debated.)

## New Methods

Two philosophers proposed new methods for knowledge. The English statesman **Francis Bacon**, in *Novum Organum* (1620), urged the patient collection of observations and experiments, organised and shared, to build knowledge step by step. The French philosopher **René Descartes**, in the *Discourse on Method* (1637), began by doubting everything except his own thinking, and pictured nature as a machine of matter in motion, explained by mathematics.

Experiment became a public, social activity. **Robert Boyle**'s air pump, used to study the vacuum and air pressure in the 1650s and 1660s, was an expensive instrument whose results were witnessed by gentlemen and reported in detail so that others could trust them. New societies met to discuss experiments and publish results: the **Royal Society** of London (1660), whose *Philosophical Transactions* from 1665 is the oldest continuous scientific journal, and the Paris **Académie des sciences** (1666).

Women were largely excluded from these institutions, but not from science. The duchess **Margaret Cavendish** wrote works of natural philosophy and in 1667 became the first woman to attend a meeting of the Royal Society. The German artist and naturalist **Maria Sibylla Merian** travelled to the Dutch colony of Surinam in 1699 and published *The Metamorphosis of the Insects of Surinam* (1705), based on her own observations and on knowledge from Indigenous and enslaved African informants.

## Newton

**Isaac Newton** (1642–1727), a Cambridge professor, brought the threads together. His *Mathematical Principles of Natural Philosophy*, the *Principia* (1687), stated three laws of motion and a law of **universal gravitation**, showing that the same force that makes an apple fall holds the moon in its orbit and the planets in theirs, and deriving Kepler's laws from it. He also showed that white light is composed of colours, and developed the calculus, which the German philosopher **Gottfried Wilhelm Leibniz** discovered independently, leading to a bitter dispute over priority.

```quote
If I have seen further it is by standing on the shoulders of Giants.
Isaac Newton · letter to Robert Hooke (spelling modernised) · 5 February 1675/6
```

Newton also spent years on alchemy and biblical prophecy. The economist John Maynard Keynes, who bought many of his papers, called him not the first of the age of reason but "the last of the magicians". Science, magic, and religion were not yet separate; most natural philosophers saw their work as revealing God's design.

```checkpoint
q: What did Islamic astronomers such as al-Tusi and Ibn al-Shatir contribute to the Scientific Revolution?
a*: They developed mathematical devices and models, such as the Tusi couple, that Copernicus also used, though how he learned of them is debated.
a: They proved that the earth orbits the sun before Copernicus.
x: They criticised and reformed Ptolemy's models but kept the earth at the centre.
a: They invented the telescope.
x: The telescope was invented in the Netherlands around 1608.
a: Nothing, since Islamic science had ended by the tenth century.
x: Islamic astronomy flourished at Maragha in the thirteenth century and Damascus in the fourteenth.
hint: Think of the Maragha observatory.
why: Copernicus's mathematics owed a debt to a long Islamic tradition of criticising Ptolemy.
---
q: Why was Galileo tried by the Roman Inquisition in 1633?
a: Because he invented the telescope.
x: Galileo improved and used the telescope; he was tried for his support of Copernicus.
a: Because he denied that God existed.
x: Galileo was a Catholic believer.
a*: Because his Dialogue of 1632 defended the sun-centred system against church teaching and appeared to mock the pope's views.
a: Because he published Newton's laws.
x: Newton's Principia appeared in 1687, after Galileo's death.
hint: Think of the Dialogue Concerning the Two Chief World Systems.
why: The trial involved theology, church politics, and the state of the evidence, not simply science against religion.
```

## A Global Science

The new science drew on knowledge from across the world, often gathered through trade, empire, and missionary work, and often without credit to its sources. The historian James Poskett has argued that the Scientific Revolution was a global event.

- **The Americas.** In 1552 the Nahua physician **Martín de la Cruz** wrote an illustrated herbal of Aztec medicine at the College of Santa Cruz in Tlatelolco, translated into Latin by another Nahua scholar, Juan Badiano. In the 1570s the Spanish physician Francisco Hernández spent years in New Spain cataloguing thousands of plants with the help of Indigenous healers and artists. The bark of the Andean **cinchona** tree, used against fever and later the source of quinine, reached Europe through the Jesuits from the late 1630s.
- **India.** The great Dutch botanical work *Hortus Malabaricus* (1678–1693), describing the plants of Kerala, was compiled by the Dutch governor Hendrik van Rheede with the help of local experts, above all the Ezhava physician **Itty Achuden**, whose knowledge came from his family's palm-leaf manuscripts. Linnaeus later drew on it. In Kerala, a school of mathematicians from **Madhava** (about 1340–1425) onwards had developed infinite series for trigonometric functions long before similar results in Europe, though there is no evidence that Europeans learned of them.
- **The Ottoman world.** In 1577 the astronomer **Taqi al-Din** opened an observatory at Istanbul with instruments rivalling Tycho's; it was demolished in 1580 after religious and political opposition.
- **China.** The Jesuit **Matteo Ricci** and the Chinese scholar-official **Xu Guangqi** translated the first six books of Euclid's geometry into Chinese in 1607. Jesuits ran the imperial astronomical bureau, and in the 1670s Ferdinand Verbiest equipped the Beijing observatory with new instruments. The Kangxi emperor studied geometry with Jesuit tutors, but used Western learning to bolster imperial authority, keeping much of it under court control, as Catherine Jami has argued.
- **Japan.** As the chapter on the Tokugawa described, Japanese scholars studied European science and medicine through Dutch books, *rangaku*.
- **India again.** In the 1720s and 1730s the Rajput ruler **Jai Singh II** of Amber built great masonry observatories, the **Jantar Mantar**, at Delhi, Jaipur, and other cities, combining Islamic, Hindu, and European astronomy.

Knowledge travelled in many directions, but the new institutions, the Royal Society and the academies, increasingly defined what counted as science, and the names of non-European informants were often lost.

```checkpoint
q: What role did Indigenous and non-European experts play in the new botany and medicine?
a: None, since European naturalists worked only from ancient Greek texts.
x: Naturalists such as Hernández, van Rheede, and Merian relied heavily on local informants.
a*: They supplied much of the knowledge, as with Martín de la Cruz's Nahua herbal, Itty Achuden's contribution to the Hortus Malabaricus, and the informants of Merian in Surinam, though they often went uncredited.
a: They were the official members of the Royal Society.
x: The Royal Society's fellows were European gentlemen; non-European experts were rarely credited.
a: They opposed all exchange of knowledge with Europeans.
x: Knowledge was exchanged widely, though often on unequal terms.
hint: Think of the Hortus Malabaricus.
why: Much of early modern natural history rested on knowledge gathered through empire from non-European experts.
---
q: What were the Royal Society and the Académie des sciences?
a: Universities founded by the church to teach Aristotle.
x: They were new learned societies, independent of the universities' traditional curriculum.
a: Royal courts that tried Galileo.
x: Galileo was tried by the Roman Inquisition.
a: Observatories in Istanbul and Delhi.
x: Those were Taqi al-Din's and Jai Singh's observatories.
a*: New institutions, founded in London in 1660 and Paris in 1666, where experiments were discussed, witnessed, and published.
hint: Think of the Philosophical Transactions.
why: Scientific societies made experiment a public, shared activity and helped define what counted as science.
```

## Legacy

By 1727 the new science had won over the educated elite of Europe. It offered a picture of a universe governed by laws discoverable by reason, a picture that inspired the thinkers of the **Enlightenment**, the subject of the next chapter. Whether its success in Europe explains Europe's later economic and military power, and why a similar revolution did not occur in China or the Islamic world, are questions, sometimes called the "Needham question" after the historian of Chinese science Joseph Needham, that historians still debate, and that many now consider wrongly posed.

## Further exploration

- **Steven Shapin, *The Scientific Revolution* (1996).** A short, provocative introduction.
- **David Wootton, *The Invention of Science: A New History of the Scientific Revolution* (2015).** A defence of the revolution.
- **James Poskett, *Horizons: A Global History of Science* (2022).** Science as a global story.
- **George Saliba, *Islamic Science and the Making of the European Renaissance* (2007).** The Islamic background to Copernicus.
- **Londa Schiebinger, *Plants and Empire: Colonial Bioprospecting in the Atlantic World* (2004).** Merian, the peacock flower, and colonial knowledge.
- **Steven Shapin and Simon Schaffer, *Leviathan and the Air-Pump: Hobbes, Boyle, and the Experimental Life* (1985).** Experiment and its witnesses.$em_scirev_master$,
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
  select $em_scirev_quiz$[
    {"type": "mcq", "prompt": "What did Kepler show in 1609?", "options": ["That the earth is at the centre of the universe", "That blood circulates through the body", "That Jupiter has four moons", "That Mars moves in an ellipse, not a circle"], "answerIndex": 3, "explanation": "Kepler used Tycho Brahe's precise observations of Mars.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Newton's Principia (1687) demonstrate?", "options": ["That a single law of universal gravitation governs both falling bodies on earth and the motion of the planets", "That the sun goes round the earth", "That light is a single colour", "That Aristotle's physics was correct"], "answerIndex": 0, "explanation": "Newton united heavens and earth, deriving Kepler's laws from gravitation.", "id": "q2"},
    {"type": "mcq", "prompt": "Who was Itty Achuden?", "options": ["The founder of the Royal Society", "An Ezhava physician whose knowledge underpinned the Dutch botanical work Hortus Malabaricus", "A Jesuit astronomer in Beijing", "An Ottoman astronomer at Istanbul"], "answerIndex": 1, "explanation": "His palm-leaf manuscripts supplied much of the Hortus's account of Kerala's plants.", "id": "q3"},
    {"type": "mcq", "prompt": "What was the Tusi couple?", "options": ["A pair of telescopes made by Galileo", "A Chinese translation of Euclid", "A geometrical device by Nasir al-Din al-Tusi producing straight-line motion from two circles, later used by Copernicus", "A Mughal observatory"], "answerIndex": 2, "explanation": "It is part of the evidence for Islamic influence on Copernicus's mathematics.", "id": "q4"},
    {"type": "open", "prompt": "Was there a 'Scientific Revolution'? Evaluate the debate.", "rubric": "A strong answer explains the traditional story (Copernicus to Newton, new methods, institutions), Shapin's sceptical view (long medieval and Islamic roots, slow change, the role of magic and religion), and Wootton's defence (discovery, facts, laws of nature), reaching a reasoned conclusion.", "id": "q5"},
    {"type": "open", "prompt": "How global was the Scientific Revolution?", "rubric": "A strong answer discusses Islamic astronomy (Maragha, al-Tusi, Ibn al-Shatir) and Copernicus, Ibn al-Nafis, knowledge from the Americas (Martín de la Cruz, Hernández, cinchona), India (Hortus Malabaricus and Itty Achuden, the Kerala school, Jai Singh's observatories), the Ottomans (Taqi al-Din), China (Ricci and Xu Guangqi, Verbiest), Japan's rangaku, and Merian in Surinam; and it considers who received credit and the role of empire, as argued by Poskett and Schiebinger.", "id": "q6"}
  ]$em_scirev_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/the-scientific-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
