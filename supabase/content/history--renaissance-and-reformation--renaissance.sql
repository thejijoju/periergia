-- The Renaissance — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/the-renaissance @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Humanism, Florence and patronage, the artistic revolution, printing
-- (with its Korean and Chinese precedents), Machiavelli, the Northern
-- Renaissance, women, the Italian Wars, a connected Renaissance (Byzantium,
-- Arabic science, the Ottomans, Ulugh Beg), and the historiography.
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
    'history/renaissance-and-reformation/the-renaissance',
    'research',
    'advanced',
    'read',
    $renaissance_master$> **The Renaissance**, from the French for "rebirth" (in Italian *Rinascimento*; Vasari wrote of a *rinascita*), was a movement of scholars and artists, beginning in the city-states of Italy in the fourteenth century and spreading across Europe by the sixteenth, that sought to revive the learning and art of ancient Greece and Rome. It produced the humanist scholarship of Petrarch and Erasmus, the art of Leonardo, Michelangelo, and Raphael, the printed book, and the political thought of Machiavelli. For a long time it was told as the moment when "the West" invented the modern individual. Historians now see it as one of several cultural revivals of the period, and as a product of exchange with the Byzantine, Islamic, and Ottoman worlds as much as of a European rediscovery of the past. This chapter covers humanism, Florence and its patrons, the artistic revolution, printing, Machiavelli, the Northern Renaissance, women, the Italian Wars, the Renaissance's connections to the wider world, and the debate over what the Renaissance was.

## Humanism

The Renaissance began with a movement of scholars called **humanists**, after the *studia humanitatis*, the study of grammar, rhetoric, poetry, history, and moral philosophy based on classical texts. The poet **Petrarch** (1304–1374) hunted for lost Latin manuscripts in monastery libraries, wrote letters to the long-dead Cicero, and, as earlier chapters described, called the centuries since Rome a "dark" age. Humanists sought to write Latin like Cicero, to read texts critically, and to learn Greek, which few western scholars knew.

Humanist philology could be revolutionary, as **Lorenzo Valla**'s exposure of the Donation of Constantine as a forgery, described in *What is History?*, showed. In Florence, humanists such as Leonardo Bruni, chancellor of the republic, argued that the study of the classics should prepare citizens for active life in the service of their city; the historian **Hans Baron** called this **civic humanism**, though later scholars have questioned how distinctive it was.

## Florence, Patronage, and the Artistic Revolution

The Renaissance flourished first in the wealthy, competitive city-states of northern Italy, especially **Florence**, enriched by banking and the cloth trade. Wealthy families, guilds, and the Church commissioned buildings and art to display piety, power, and prestige. The banking family of the **Medici**, above all **Cosimo** (1389–1464) and his grandson **Lorenzo "the Magnificent"** (1449–1492), dominated Florence's politics and were its greatest patrons.

Artists transformed painting, sculpture, and architecture:

- **Filippo Brunelleschi** engineered the great dome of Florence Cathedral, built between 1420 and 1436 without the wooden frameworks normally used, and demonstrated the rules of **linear perspective**, which allowed painters to create a convincing illusion of three-dimensional space.
- **Donatello**'s bronze *David* (probably 1440s) was the first free-standing nude male statue in Europe since antiquity.
- **Leonardo da Vinci** (1452–1519) painted the *Last Supper* and the *Mona Lisa* and filled notebooks with studies of anatomy, machines, water, and flight.
- **Michelangelo** (1475–1564) carved the marble *David* (1504) and painted the ceiling of the Sistine Chapel (1508–1512).
- **Raphael** painted *The School of Athens* for the pope, depicting the great philosophers of antiquity, including a figure traditionally identified as the Muslim philosopher **Ibn Rushd** (Averroes), whose commentaries on Aristotle, as the chapter on the rise of Islam described, had shaped European learning.
- In Venice, **Titian** became the leading Venetian painter of the sixteenth century.

Artists rose in status from craftsmen to celebrated creative figures, a change recorded in Giorgio Vasari's *Lives of the Artists* (1550), which itself helped shape the idea of the Renaissance.

{{image: The School of Athens | Raphael's The School of Athens (1509–1511), in the Vatican, depicting the philosophers of antiquity, among them a figure traditionally identified as Ibn Rushd (Averroes).}}

```checkpoint
q: Why is the figure usually identified as Ibn Rushd in Raphael's The School of Athens significant?
a*: Because it acknowledges the importance of Islamic scholarship, especially Ibn Rushd's commentaries on Aristotle, in transmitting ancient philosophy to Renaissance Europe.
a: Because it shows that Raphael was a Muslim.
x: Raphael was a Christian painter working for the pope; the inclusion reflects intellectual debts, not his religion.
a: Because Ibn Rushd was a Florentine humanist.
x: Ibn Rushd was a twelfth-century philosopher and judge from Córdoba in al-Andalus.
a: Because the painting was commissioned by the Ottoman sultan.
x: The painting was commissioned by the pope for the Vatican.
hint: Who taught Europe much of its Aristotle?
why: If the traditional identification is right, the painting itself recognises that the classical revival depended on Islamic scholarship, contradicting a purely European story.
---
q: What was the importance of linear perspective?
a: It allowed artists to paint faster.
x: Perspective is about representing space, not speed.
a: It was a religious rule requiring all paintings to show heaven.
x: Perspective was a technique for creating the illusion of depth, not a religious rule.
a*: It allowed painters to create a convincing illusion of three-dimensional space on a flat surface, using mathematical rules demonstrated by Brunelleschi.
a: It was a method of building domes without supports.
x: That was Brunelleschi's engineering achievement for the cathedral, a separate innovation.
hint: Think of lines converging on a vanishing point.
why: Perspective combined mathematics and art and transformed European painting.
```

## Printing

Around 1450, in Mainz, **Johannes Gutenberg** developed a system of printing with movable metal type, an oil-based ink, and a press adapted from wine and paper presses. His Bible, printed around 1455, was the first major book printed with movable type in Europe. Printing spread with astonishing speed: by 1500, presses operated in more than two hundred European towns, and millions of books had been printed.

Gutenberg was not the first to print with movable type. As the chapter on Tang and Song China described, Bi Sheng had invented movable type in China in the 1040s, and in **Korea**, printers used movable metal type by the thirteenth century; the oldest surviving book printed with metal movable type, a Buddhist text known as the *Jikji*, was printed in Korea in 1377. Gutenberg's system, however, suited the small number of letters in European alphabets and spread on a scale that transformed European culture, making possible the rapid spread of humanist learning, scientific ideas, and, from 1517, the Reformation.

## Machiavelli and Political Thought

The Florentine official **Niccolò Machiavelli** (1469–1527), dismissed from office when the Medici returned to power in 1512, wrote ***The Prince*** in 1513, published after his death in 1532. Unlike earlier "mirrors for princes", which urged rulers to be virtuous, Machiavelli analysed how rulers actually gained and kept power, arguing that a prince must sometimes act against conventional morality, and that it is safer to be feared than loved if one cannot be both. His *Discourses on Livy* show a strong commitment to republican government. The adjective "Machiavellian" now means cunning and unscrupulous, but scholars debate whether he was a cynical advocate of power, a patriotic realist, or a republican satirist. Readers of the Indian *Arthashastra*, discussed in the chapter on classical India, will recognise a similar realism.

## The Northern Renaissance

Renaissance ideas spread north through printing, trade, and travel. The Dutch humanist **Desiderius Erasmus** (about 1466–1536), the most famous scholar of his day, satirised clerical corruption in *The Praise of Folly* (1511) and published a new edition of the New Testament in Greek in 1516, laying foundations for the Reformation, though he himself remained Catholic. His friend **Thomas More** wrote *Utopia* (1516), an imagined ideal society partly inspired by reports of newly encountered lands across the Atlantic. In art, Flemish painters such as Jan van Eyck had perfected oil painting, and the German **Albrecht Dürer** combined northern detail with Italian perspective and became famous across Europe through his prints.

## Women and the Renaissance

In 1977 the historian **Joan Kelly** asked, "Did women have a Renaissance?" and answered that "there was no renaissance for women—at least, not during the Renaissance." Humanist education and the opportunities of courts and cities were largely closed to women, and the ideal of the virtuous, silent, obedient wife was reinforced.

Some women nonetheless made their mark. The debate known as the **querelle des femmes**, the "quarrel about women", begun by Christine de Pizan around 1400, with her attack on the *Romance of the Rose* (1401–02) and her *Book of the City of Ladies* (1405), continued through the period, as women and men argued about women's nature and capacities. Humanist women such as **Isotta Nogarola** and **Laura Cereta** wrote and corresponded with scholars, though often facing ridicule. **Isabella d'Este**, marchioness of Mantua, was one of the great art patrons of the age, and painters such as Sofonisba Anguissola and, later, **Artemisia Gentileschi** achieved fame.

## Courts, Diplomacy, and the Italian Wars

Italian states developed new forms of politics and diplomacy, including permanent resident ambassadors, who reported regularly to their governments. But Italy's divisions made it vulnerable. In 1494 the king of France invaded to claim Naples, beginning the **Italian Wars** (1494–1559), in which France, Spain, and the Holy Roman Empire fought for control of the peninsula. In 1527 the troops of the emperor Charles V, many unpaid and mutinous, **sacked Rome**. By 1559 much of Italy was under Spanish domination, and the political world that had nurtured the Renaissance was transformed.

```checkpoint
q: What did Joan Kelly mean by asking "Did women have a Renaissance?"
a: That women were not alive during the Renaissance.
x: The question is about opportunities, not existence.
a*: That the new opportunities of humanist education and public life were largely closed to women, so the period was not a "rebirth" for them in the way it was for elite men.
a: That women created all Renaissance art.
x: Some women were artists and patrons, but Kelly's argument concerned their exclusion.
a: That the Renaissance began with a woman ruler.
x: Kelly's question concerns women's experience, not the origin of the Renaissance.
hint: Who could attend humanist schools and hold public office?
why: Kelly showed that a period celebrated as progressive could restrict women's roles, changing how historians assess the Renaissance.
---
q: Why was Gutenberg's press so transformative even though movable type existed earlier in China and Korea?
a: Because Gutenberg invented paper.
x: Paper came from China centuries earlier, as earlier chapters described.
a: Because Korean and Chinese printing used no ink.
x: Chinese and Korean printers used ink; the difference lay in scale and suitability to scripts.
a: Because only Gutenberg's press could print images.
x: Woodblock printing of images was long established in Asia and Europe.
a*: Because his metal-type system suited the small number of letters in European alphabets and spread rapidly to hundreds of towns, making mass printing cheap and fast.
hint: Compare the number of characters in Chinese with the letters of the Latin alphabet.
why: Printing with a small alphabet scaled easily, which explains the explosive spread of printing in Europe after 1450.
```

## A Connected Renaissance

The Renaissance did not happen in isolation. Much of the Greek learning that humanists prized came from **Byzantium**. The Byzantine scholar **Manuel Chrysoloras** taught Greek in Florence from 1397, and after the fall of Constantinople in 1453, Greek scholars and manuscripts flowed west; the Byzantine cardinal **Bessarion** gave his library of Greek manuscripts to Venice in 1468. Much of the science and philosophy humanists studied had been preserved and developed in Arabic. The historian Hans Belting has argued that the Arab scientist **Ibn al-Haytham**'s optics, translated into Latin, informed the theory of perspective. Copernicus's astronomy, published in 1543, used mathematical techniques developed earlier by astronomers in the Islamic world, such as Nasir al-Din al-Tusi and Ibn al-Shatir.

Exchange with the **Ottoman** empire was constant. Venice and Genoa traded silk, spices, carpets, and alum with the Ottomans; Italian paintings show Turkish carpets and Ottoman dress. In 1479 Venice sent the painter **Gentile Bellini** to Istanbul, where he painted a portrait of Sultan **Mehmed II**, the conqueror of Constantinople, who commissioned Italian art and medals and collected Greek and Latin manuscripts. The great Ottoman architect **Mimar Sinan** (about 1490–1588), designer of the Süleymaniye mosque, was a contemporary of Michelangelo, with whom he is often compared; Sinan's great domed mosques were a sustained response to the dome of Hagia Sophia.

Other societies had their own revivals in these centuries. In Timurid Central Asia, **Ulugh Beg**, grandson of Timur, built a great observatory at Samarkand in the 1420s and compiled a star catalogue (1437) unmatched in accuracy until Tycho Brahe, and Herat under the Timurids saw a flowering of Persian painting and poetry. Africans were also part of Renaissance Europe: Ethiopian monks lived in Rome, at the church of Santo Stefano, and **Alessandro de' Medici**, duke of Florence from 1532, was the son of a servant, Simonetta da Collevecchio, who may have been of African descent; contemporaries called him "il Moro", and the point is still debated.

{{image: Portrait of Mehmed II | Portrait of the Ottoman sultan Mehmed II attributed to Gentile Bellini, dated 1480 and heavily repainted.}}

## What Was the Renaissance?

The modern idea of the Renaissance was shaped by the Swiss historian **Jacob Burckhardt**, whose *The Civilization of the Renaissance in Italy* (1860) presented it as the birth of modernity: "the discovery of the world and of man", the emergence of the self-conscious individual, and the state as a work of art. His picture has been criticised from many sides. Medievalists, such as Charles Homer Haskins in *The Renaissance of the Twelfth Century* (1927), showed that classical learning had revived repeatedly in the Middle Ages. Economic and social historians stressed continuity. Feminist historians, like Kelly, showed whose Renaissance it was. And global historians, such as Jerry Brotton, have shown how much it depended on exchange with Byzantium, the Islamic world, and the Ottomans, and how the idea of a uniquely "Western" Renaissance served later European claims to superiority.

Most historians still use the term, because the revival of classical learning and the transformation of art in fifteenth- and sixteenth-century Europe were real and influential. But they now see the Renaissance as one of several cultural flowerings of the period, connected to its neighbours, and shaped by later generations' needs as much as by its own.

## Further exploration

- **Jerry Brotton, *The Renaissance: A Very Short Introduction* (2006).** A brief introduction with a global perspective.
- **Jacob Burckhardt, *The Civilization of the Renaissance in Italy* (1860).** The classic, influential interpretation.
- **Peter Burke, *The European Renaissance: Centres and Peripheries* (1998).** The Renaissance across Europe.
- **Lisa Jardine, *Worldly Goods: A New History of the Renaissance* (1996).** The Renaissance as consumption, trade, and display.
- **Hans Belting, *Florence and Baghdad: Renaissance Art and Arab Science* (2011).** How Arabic optics shaped perspective.$renaissance_master$,
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
    {"type": "mcq", "prompt": "Who were the humanists?", "options": ["Scholars who studied and imitated classical texts in grammar, rhetoric, poetry, history, and moral philosophy", "Scientists who rejected religion", "Painters of the Sistine Chapel", "Ottoman administrators"], "answerIndex": 0, "explanation": "Humanism, from the studia humanitatis, began with figures such as Petrarch.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Machiavelli argue in The Prince?", "options": ["That rulers should always be morally virtuous", "That Italy should be ruled by the pope", "That kings should abdicate", "That rulers must analyse how power is actually gained and kept, sometimes acting against conventional morality"], "answerIndex": 3, "explanation": "Machiavelli's realism broke with earlier advice literature, and scholars still debate his intentions.", "id": "q2"},
    {"type": "mcq", "prompt": "Which Venetian painter was sent to Istanbul in 1479 and painted a portrait of Mehmed II?", "options": ["Titian", "Gentile Bellini", "Leonardo da Vinci", "Albrecht Dürer"], "answerIndex": 1, "explanation": "Bellini's visit illustrates the close cultural exchange between Renaissance Italy and the Ottoman court.", "id": "q3"},
    {"type": "mcq", "prompt": "Who presented the Renaissance as 'the discovery of the world and of man' in 1860?", "options": ["Giorgio Vasari", "Joan Kelly", "Jacob Burckhardt", "Charles Homer Haskins"], "answerIndex": 2, "explanation": "Burckhardt's influential interpretation has since been criticised by medievalists, feminists, and global historians.", "id": "q4"},
    {"type": "open", "prompt": "How have global historians challenged the idea of the Renaissance as a purely European achievement?", "rubric": "A strong answer discusses Byzantine contributions (Chrysoloras, Bessarion, Greek manuscripts after 1453), Arabic science (Ibn Rushd in The School of Athens, Ibn al-Haytham's optics and perspective per Belting, Copernicus's use of al-Tusi and Ibn al-Shatir), Ottoman exchange (trade, carpets, Bellini and Mehmed II, Sinan's response to Hagia Sophia), parallel revivals (Ulugh Beg, Timurid Herat), Korean and Chinese printing, and African presence (Ethiopian monks, Alessandro de' Medici). It explains how the idea of a uniquely Western Renaissance served later claims of superiority (Brotton).", "id": "q5"},
    {"type": "open", "prompt": "Did women have a Renaissance? Use evidence from the chapter.", "rubric": "A strong answer explains Joan Kelly's argument that humanist education and public opportunities were largely closed to women and that ideals of the silent, obedient wife were reinforced; and weighs counter-evidence such as the querelle des femmes, Isotta Nogarola and Laura Cereta, Isabella d'Este as patron, and painters such as Sofonisba Anguissola and Artemisia Gentileschi. It reaches a reasoned conclusion about differences by class and place.", "id": "q6"}
  ]$renaissance_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/the-renaissance', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
