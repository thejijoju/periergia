-- The Protestant and Catholic Reformations — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/the-protestant-and-catholic-reformations @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Luther and print, Zwingli, the radicals and Calvin, the English
-- Reformation, the Catholic Reformation, the wars of religion to
-- Westphalia, the Ottoman factor, the global Reformations (Americas, Japan,
-- China, Goa, Kongo, Ethiopia), and legacies.
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
    'history/renaissance-and-reformation/the-protestant-and-catholic-reformations',
    'research',
    'advanced',
    'read',
    $reformation_master$> **The Reformations** of the sixteenth and seventeenth centuries shattered the religious unity of Latin Christendom. Beginning with Martin Luther's protest in 1517, Protestant movements broke with the papacy across much of northern Europe, while the Catholic Church reformed itself and launched missions across the world. The divisions fuelled more than a century of wars that killed millions. They also spread, through missionaries, into Asia, Africa, and the Americas, where Christianity met and adapted to local societies, and they unfolded alongside, and were shaped by, the expanding Ottoman empire. This chapter covers Luther and the printing press, the reformers who followed, the English Reformation, the Catholic Reformation, the wars of religion to the Peace of Westphalia in 1648, the global reach of the Reformations, and their legacies.

## Luther and the Printing Press

By 1500 many Christians in Latin Europe criticised the Church for wealth, worldliness, and abuses, and earlier reformers such as John Wyclif in England and Jan Hus in Bohemia, burned as a heretic in 1415, had challenged its authority. One practice in particular provoked anger: the sale of **indulgences**, certificates that the Church claimed reduced the time a soul would spend in purgatory, sold to raise money, including for rebuilding St Peter's in Rome.

In 1517 **Martin Luther**, a monk and professor of theology at Wittenberg in Saxony, published **Ninety-five Theses** attacking indulgences. His challenge widened into a fundamental rejection of Church teaching. Luther argued that people are saved by God's grace through **faith alone**, not by good works or Church rituals; that **scripture alone**, not the pope or Church tradition, was the authority for Christian belief; and that all believers were in a sense priests. Excommunicated by the pope and summoned before the emperor **Charles V** at the **Diet of Worms** in 1521, he refused to recant. Protected by the elector of Saxony, he translated the Bible into German, shaping the modern German language.

The **printing press**, described in the previous chapter, made the Reformation possible on a scale earlier reformers could not reach. Luther's pamphlets, written in vivid German and illustrated with woodcuts mocking the pope, were printed in hundreds of thousands of copies, one of the first mass media campaigns in history.

The Reformation's message of Christian freedom was taken further than Luther wanted. In 1524–1525 German peasants rose in the **Peasants' War**, demanding relief from serfdom and dues on the basis of scripture. Luther urged the princes to crush them, and perhaps 100,000 were killed.

## Zwingli, Calvin, and the Radicals

Other reformers soon diverged from Luther. In Zurich, **Huldrych Zwingli** led a more radical reform that removed images from churches and taught that the bread and wine of communion were only symbols. **Anabaptists** rejected infant baptism, insisting on adult believers' baptism, and many sought to separate from the state; both Catholics and Protestants persecuted them. In 1534–1535 a group of radical Anabaptists seized the German city of Münster, proclaiming it the New Jerusalem, before being crushed. Peaceful Anabaptist traditions survive in the Mennonites, Amish, and Hutterites.

The French reformer **John Calvin** made **Geneva** a model Protestant city from the 1540s. His *Institutes of the Christian Religion* (first edition 1536) set out a systematic theology emphasising God's sovereignty and **predestination**, the belief that God has already chosen who will be saved. Calvinism spread to France, the Netherlands, Scotland, parts of Germany, Hungary, and later England and its colonies.

## The English Reformation

In England the break with Rome began as a political act. King **Henry VIII**, seeking an annulment of his marriage to Catherine of Aragon, who had not produced a male heir, was refused by the pope, partly because Catherine's nephew was the emperor Charles V. In 1534 Parliament passed the **Act of Supremacy**, making the king head of the Church of England. Henry then **dissolved the monasteries**, seizing their vast lands. Under his son Edward VI the church became more Protestant; under his daughter Mary I, Catholicism was restored and nearly three hundred Protestants were burned; under **Elizabeth I**, the "Elizabethan settlement" of 1559 established a Protestant Church of England with some Catholic forms.

```checkpoint
q: Why was the printing press so important for Luther's Reformation?
a*: Because Luther's pamphlets and Bible translation could be printed in huge numbers, spreading his ideas faster and further than earlier reformers' could.
a: Because Luther invented the printing press.
x: Gutenberg developed the press around 1450, decades before Luther.
a: Because the pope banned printing, so only Protestants could print.
x: Catholics printed extensively too; the press was not a Protestant monopoly.
a: Because the press allowed Luther to print indulgences more cheaply.
x: Luther attacked indulgences; he did not print them.
hint: Compare Luther's reach with that of Jan Hus a century earlier.
why: Printing turned a local protest into a Europe-wide movement, an early example of mass media shaping religion and politics.
---
q: What was the immediate cause of the English break with Rome?
a: Henry VIII's conversion to Lutheran theology.
x: Henry remained theologically conservative; the break was primarily political.
a: A peasant uprising in England.
x: The break was driven from the top, by the king and Parliament.
a*: The pope's refusal to annul Henry VIII's marriage to Catherine of Aragon, leading to the 1534 Act of Supremacy.
a: The Council of Trent.
x: The Council of Trent began in 1545, after the English break.
hint: Think of Catherine of Aragon's nephew.
why: In England, royal politics drove the Reformation, with theology following later under Edward VI and Elizabeth I.
```

## The Catholic Reformation

The Catholic Church responded with its own reform, sometimes called the **Counter-Reformation** to stress its opposition to Protestantism, and the **Catholic Reformation** to stress its roots in earlier reform movements. The **Council of Trent** (1545–1563) reaffirmed Catholic doctrine on salvation, the sacraments, and Church tradition, while reforming abuses: bishops were required to live in their dioceses, and seminaries were founded to train priests.

New religious orders spread reform. The most important was the **Society of Jesus**, the **Jesuits**, founded by the Basque soldier-turned-priest **Ignatius of Loyola** and approved by the pope in 1540. Highly educated and disciplined, the Jesuits founded hundreds of schools and colleges and became the Church's leading missionaries. Mystics such as **Teresa of Ávila** reformed religious life from within. The Church also tightened control: the **Roman Inquisition** was established in 1542 to combat heresy, and the first Roman **Index of Forbidden Books** to take effect was issued in 1559. Baroque art and architecture, emotional and grand, became the visual language of a confident Catholicism.

## The Wars of Religion

Religious division fuelled war, because rulers saw religious unity as essential to political order. In the Holy Roman Empire, the Lutheran princes formed the Schmalkaldic League; after a war with Charles V, the **Peace of Augsburg** in 1555 allowed each prince to choose Lutheranism or Catholicism for his territory, a principle later summed up as *cuius regio, eius religio*, "whose realm, his religion". Calvinists were excluded.

In France, the **Wars of Religion** (1562–1598) pitted Catholics against Calvinist Huguenots. On **St Bartholomew's Day**, 24 August 1572, Catholic mobs and soldiers massacred Huguenots in Paris, and violence spread across France; thousands were killed. The wars ended when the Protestant Henry IV, king since 1589, converted to Catholicism in 1593 and in 1598 issued the **Edict of Nantes**, granting Huguenots limited toleration. In the Netherlands, the **Dutch Revolt** from 1568 against Spanish rule, fuelled by religious and political grievances, led to an independent Dutch Republic.

The most destructive conflict was the **Thirty Years' War** (1618–1648), which began as a revolt of Bohemian Protestants against the Catholic Habsburgs and drew in most of the powers of Europe, including Catholic France fighting on the Protestant side against the Habsburgs. Armies, famine, and disease devastated central Europe; an estimated 4.5 to 8 million people died, and parts of Germany lost a third or more of their population. The **Peace of Westphalia** (1648) recognised the independence of the Dutch Republic and Switzerland, extended religious rights to Calvinists, and confirmed the power of territorial rulers. Political scientists often treat Westphalia as the origin of the modern system of sovereign states, though historians caution that this view simplifies what the treaties actually did.

## The Ottoman Factor

The Reformations unfolded in the shadow of the **Ottoman** empire. In 1526 the Ottomans under **Suleiman the Magnificent** destroyed the Hungarian army at Mohács, and in 1529 they besieged Vienna. Charles V, the leading Catholic ruler, repeatedly had to make concessions to Lutheran princes because he needed their support against the Ottomans, a pressure that helped Protestantism survive. Some Protestants even looked on the Ottomans as preferable to the pope; Dutch rebels, the Sea Beggars, wore crescent medals with the slogan *Liever Turks dan Paaps*, "Rather Turkish than Popish". The Ottoman empire, which granted religious communities considerable autonomy, became a refuge for groups persecuted in Christian Europe, above all for the Sephardic Jews expelled from Spain in 1492, many of whom settled in Istanbul and Salonica.

```checkpoint
q: How did the Ottoman empire influence the course of the Reformation?
a: The Ottomans converted Germany to Islam.
x: There was no such conversion; the Ottoman influence was political and military.
a*: Ottoman military pressure, including the siege of Vienna in 1529, forced Charles V to make concessions to Lutheran princes whose support he needed, helping Protestantism survive.
a: The Ottomans supported the Catholic Inquisition.
x: The Ottomans were rivals of the Catholic Habsburgs, not supporters of the Inquisition.
a: The Ottomans had no contact with Europe in the sixteenth century.
x: The Ottomans controlled much of southeastern Europe and besieged Vienna in 1529.
hint: Why did Charles V need the Lutheran princes?
why: The Ottoman threat shaped Habsburg policy and gave Protestant princes leverage, a non-European factor in a European religious conflict.
---
q: What principle did the Peace of Augsburg (1555) establish?
a: Freedom of religion for every individual.
x: Individuals had no freedom of choice; the prince chose the religion of his territory.
a: That Calvinism was the official religion of the empire.
x: Calvinists were excluded from the Augsburg settlement until Westphalia in 1648.
a: That the pope would appoint all German princes.
x: The settlement concerned religion within the empire, not papal appointment of princes.
a*: That each prince in the Holy Roman Empire could choose Lutheranism or Catholicism for his territory, later summed up as cuius regio, eius religio.
hint: "Whose realm, his religion."
why: Augsburg made religion a matter for territorial rulers, a compromise that held for decades but excluded Calvinists.
```

## The Global Reformations

The Reformations were not only European. The Catholic Reformation in particular was carried around the world by missionaries, often travelling with Portuguese and Spanish ships and empires.

- **In the Americas**, Franciscans, Dominicans, and Jesuits evangelised Indigenous peoples, sometimes defending them against colonists and sometimes destroying their sacred objects and books. Indigenous Christians shaped their own forms of devotion; the cult of the **Virgin of Guadalupe**, who according to tradition appeared to an Indigenous man, Juan Diego, near Mexico City in 1531, became central to Mexican identity.
- **In Japan**, the Jesuit **Francis Xavier** arrived in 1549, and by around 1600 perhaps 300,000 Japanese had become Christians, including some daimyō. The Tokugawa shoguns, fearing foreign influence, banned Christianity in 1614 and crushed a largely Christian rebellion at Shimabara in 1637–1638, after which surviving "hidden Christians" kept their faith secretly for over two centuries.
- **In China**, the Jesuit **Matteo Ricci**, who settled in Beijing in 1601, adopted the dress and learning of a Confucian scholar, impressed officials with European mathematics, maps, and clocks, and argued that Confucian rites honouring ancestors were compatible with Christianity, a position later rejected by the papacy in the long "Chinese Rites controversy".
- **In India**, Portuguese Goa became a centre of Catholic missions, and also of an Inquisition, established in 1560, which persecuted Hindus, Muslims, Jews, and converts suspected of secretly practising their old religions.
- **In Africa**, the kingdom of **Kongo**, whose king was first baptised in 1491, was Christianised under King **Afonso I** (reigned 1509–1542), with its own Kongolese Catholic church. In **Ethiopia**, one of the world's oldest Christian kingdoms, Portuguese Jesuits persuaded Emperor Susenyos to convert to Catholicism in 1622, provoking civil war; his son expelled the Jesuits in the 1630s and restored the Ethiopian Orthodox church.

These encounters show Christianity adapting to, and being reshaped by, the societies it entered, and they reveal the close links between missions and empire.

## Legacies

The Reformations left deep marks. Protestants stressed reading the Bible in one's own language, which encouraged **literacy**, especially in Protestant northern Europe. Arguments over conscience and decades of religious war eventually led some thinkers to argue for **toleration**, though it came slowly. Rulers, Protestant and Catholic, gained control over churches, strengthening the **state**. In 1904–05 the German sociologist **Max Weber** argued in *The Protestant Ethic and the Spirit of Capitalism* that Calvinist ideas encouraged a disciplined, work-centred mentality that favoured capitalism; the thesis has been widely criticised, not least because capitalism flourished in Catholic Italy and in non-Christian societies, but it remains much discussed.

## Further exploration

- **Diarmaid MacCulloch, *Reformation: Europe's House Divided, 1490–1700* (2003).** The standard comprehensive history.
- **Lyndal Roper, *Martin Luther: Renegade and Prophet* (2016).** A biography of Luther.
- **Peter H. Wilson, *Europe's Tragedy: A History of the Thirty Years War* (2009).** The definitive history of the war.
- **R. Po-chia Hsia, *The World of Catholic Renewal, 1540–1770* (2nd ed., 2005).** The Catholic Reformation as a global movement.
- **Liam Matthew Brockey, *Journey to the East: The Jesuit Mission to China, 1579–1724* (2007).** The Jesuits in China.$reformation_master$,
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
  select $reformation_quiz$[
    {"type": "mcq", "prompt": "What did Luther mean by salvation through 'faith alone'?", "options": ["That good works and rituals earn salvation", "That only priests can be saved", "That indulgences guarantee salvation", "That people are saved by God's grace through faith, not by their works or Church rituals"], "answerIndex": 3, "explanation": "Luther's doctrine undercut the Church's sacramental system and the sale of indulgences.", "id": "q1"},
    {"type": "mcq", "prompt": "Which order, founded by Ignatius of Loyola, became the Catholic Church's leading missionaries and educators?", "options": ["The Franciscans", "The Jesuits", "The Templars", "The Dominicans"], "answerIndex": 1, "explanation": "Approved in 1540, the Jesuits founded hundreds of schools and led missions from Japan to Brazil.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened to Christianity in Japan after 1614?", "options": ["The Tokugawa banned it, crushed the Shimabara rebellion, and surviving 'hidden Christians' practised in secret", "It became the state religion", "It merged with Shinto", "Japan became a Protestant country"], "answerIndex": 0, "explanation": "After rapid growth following Francis Xavier's arrival in 1549, Christianity was suppressed as a foreign threat.", "id": "q3"},
    {"type": "mcq", "prompt": "Which treaty ended the Thirty Years' War in 1648?", "options": ["The Peace of Augsburg", "The Edict of Nantes", "The Peace of Westphalia", "The Treaty of Tordesillas"], "answerIndex": 2, "explanation": "Westphalia recognised the Dutch Republic and Switzerland and extended religious rights to Calvinists.", "id": "q4"},
    {"type": "open", "prompt": "Was the Reformation a European event? Use evidence from the chapter to argue a position.", "rubric": "A strong answer discusses European origins (Luther, Calvin, Henry VIII, Trent, the wars of religion) and global dimensions: the Ottoman threat shaping Habsburg concessions; Sephardic Jews finding refuge in the Ottoman empire; Catholic missions in the Americas (Guadalupe), Japan (Xavier, the 1614 ban, Shimabara), China (Ricci, the Rites controversy), India (Goa and its Inquisition), Kongo (Afonso I), and Ethiopia (Susenyos and the expulsion of the Jesuits). It reaches a reasoned conclusion and notes the links between missions and empire.", "id": "q5"},
    {"type": "open", "prompt": "Why did religious division lead to such destructive wars in sixteenth- and seventeenth-century Europe?", "rubric": "A strong answer explains that rulers saw religious unity as essential to political order, and discusses the Schmalkaldic War and Augsburg's cuius regio, the French Wars of Religion and St Bartholomew's Day, the Dutch Revolt, and the Thirty Years' War, in which politics often outweighed religion (Catholic France on the Protestant side). It discusses the human cost and the gradual, limited moves toward toleration (Nantes, Westphalia).", "id": "q6"}
  ]$reformation_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/the-protestant-and-catholic-reformations', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
