-- Lords, Peasants, and Towns in Medieval Europe — canonical master article, co-written and human-reviewed.
-- history/medieval-history/europe-and-byzantium/lords-peasants-and-towns-in-medieval-europe @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The three orders, the case against 'feudalism', the manor and serfdom,
-- the agricultural revolution, towns and guilds, the Church, universities
-- and scholasticism, and the fourteenth-century crisis.
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
    'history/medieval-history/europe-and-byzantium/lords-peasants-and-towns-in-medieval-europe',
    'research',
    'advanced',
    'read',
    $lords_master$> **Medieval European society** is often pictured as a neat "feudal pyramid": a king at the top, granting land to great lords in return for military service, who granted land to knights, who ruled over peasants. Historians now regard that pyramid as largely a later invention. This chapter explains how society in Latin Europe actually worked between about 1000 and 1400: the varied bonds of lordship, the manor and the peasants who did most of the work, the agricultural changes that fed a growing population, the revival of towns and trade, the Church as the greatest landlord of all, the universities, and the crisis of the fourteenth century.

## Those Who Pray, Fight, and Work

Around 1025 the French bishop **Adalbero of Laon** described society as made up of three orders: those who pray (the clergy), those who fight (the nobility and knights), and those who work (everyone else, above all the peasants). Each, he said, depended on the others. This image of the **three orders** was an ideal, presented by a clergyman, and it left out merchants, townspeople, and women, and made the hierarchy seem natural and God-given. But it captured how many people at the top saw their world.

## The Problem with "Feudalism"

The word **feudalism** was invented much later, by lawyers and scholars of the seventeenth and eighteenth centuries, from the medieval Latin *feudum*, "fief". The textbook model goes like this: a lord granted a **fief**, usually land, to a **vassal**, who swore homage and fealty, loyalty, and promised military and other service in return. Kings granted fiefs to great nobles, who granted parts of them to lesser knights, forming a pyramid of personal obligations held together by land.

Two historians changed the way this model is seen. In 1974 **Elizabeth A. R. Brown** published an article called "The Tyranny of a Construct", arguing that "feudalism" was a modern abstraction that forced very different relationships, across different regions and centuries, into a single misleading system. In *Fiefs and Vassals* (1994), **Susan Reynolds** went further, showing that the classic link between vassalage and fiefs was largely a creation of academic lawyers from the twelfth century onwards, and of post-medieval scholars and modern historians reading those lawyers back into earlier centuries. Landholding, lordship, and loyalty existed everywhere, but they took many different forms.

Many historians today therefore prefer to speak of **lordship**: the power that landholders, whether nobles, knights, monasteries, or bishops, exercised over land and the people who worked it. Military service was important, but so were money, kinship, marriage, royal authority, and law. Some historians, particularly in the Marxist tradition, use "feudalism" differently, to mean an economic system in which lords extracted surplus from dependent peasants; in that sense the term remains in use.

```checkpoint
q: Why do many historians now avoid the term "feudalism"?
a*: Because it is a later construct that forces very different relationships across regions and centuries into one misleading system, as Elizabeth Brown and Susan Reynolds argued.
a: Because medieval people had no lords or vassals.
x: Lords and vassals existed; the objection is to forcing them into a single system.
a: Because it was banned by the medieval Church.
x: The word "feudalism" did not exist in the Middle Ages; it was coined by later scholars.
a: Because medieval Europe had no land.
x: Landholding was central to medieval society; the debate concerns how to describe it.
hint: When was the word "feudalism" invented?
why: Brown and Reynolds showed that the neat model was a later abstraction, so historians now emphasise the variety of lordship.
---
q: What did Adalbero of Laon's three orders leave out?
a: The clergy.
x: The clergy were the first order, "those who pray".
a: The nobility.
x: The nobility were the second order, "those who fight".
a*: Merchants, townspeople, and women, among others, and the reality of conflict between the orders.
a: The peasants.
x: The peasants were the main part of the third order, "those who work".
hint: Who did not fit easily into praying, fighting, or working the land?
why: The scheme was a clerical ideal that made hierarchy seem natural while leaving out many groups.
```

## The Manor and the Peasants

Most Europeans, perhaps nine out of ten, were peasants, living in villages and working the land. In much of western Europe, land was organised into **manors**, estates held by a lord. Part of the land, the **demesne**, was farmed directly for the lord; the rest was held by peasant households in return for rents and services.

Many peasants were **serfs**, legally unfree, bound to the land, and subject to the lord's courts. Serfs owed labour services on the lord's demesne (increasingly commuted to money payments from the thirteenth century), payments in kind or cash, and fees on particular occasions: to marry (in England called merchet), when a tenant died (heriot, often the best beast), and to use the lord's mill, oven, or wine press, which peasants were often required to use. Serfs were not slaves: they could not generally be sold as individuals, though they passed with the land when it changed hands, they had customary rights recognised in manorial courts, and they could hold land and pass it to their children. But the line between serfdom and slavery could be blurred, as the chapter on slavery in the global Middle Ages discusses. Free peasants also existed in many regions, and conditions varied greatly across Europe.

Village life was organised around the parish church, the agricultural year, and communal decisions about the open fields, in which each household held scattered strips. Women did a great deal of the work, in fields, households, brewing, spinning, and weaving, and widows could hold land in their own right.

## An Agricultural Revolution

Between about 1000 and 1300, Europe's population roughly doubled, on many estimates from around 40 million to 75 million or more (estimates vary widely). Several changes in farming helped feed it:

- **The heavy plough**, with an iron blade and mouldboard to turn the soil, could work the heavy, fertile clay soils of northern Europe. It needed teams of oxen, encouraging cooperation between households.
- **The three-field rotation**: instead of leaving half the land fallow each year, farmers divided it into three fields, one sown in autumn with wheat or rye, one in spring with oats, barley, or legumes, and one left fallow, increasing the area in use and improving diets.
- **The horse collar** and horseshoes allowed horses, faster than oxen, to pull ploughs and carts.
- **Watermills**, and later windmills, ground grain and powered other work. The Domesday Book of 1086 recorded more than 5,600 mills in England alone.
- **Land clearance**: forests were cut down and marshes drained, and settlers moved east into the lands beyond the Elbe, into Poland and the Baltic.

The **Medieval Climate Anomaly**, a relatively warm period in much of Europe from about 950 to 1250, also helped. By around 1300, though, population was pressing hard on resources, and much poor land had been brought into cultivation.

```checkpoint
q: Which statement about serfs is correct?
a: Serfs were slaves who could be sold individually at market.
x: Serfs were generally bound to the land rather than sold away from it, and they had customary rights.
a*: Serfs were legally unfree and bound to the land, owing labour and fees, but they had customary rights and could hold and inherit land.
a: Serfs were free peasants who owed nothing to lords.
x: Serfs owed substantial labour services and payments to their lords.
a: Serfdom existed only in England.
x: Serfdom existed across much of Europe, in varying forms.
hint: Compare serfdom with slavery.
why: Serfdom combined legal unfreedom with customary rights, a distinctive form of dependence different from chattel slavery.
---
q: How did the three-field rotation increase food production?
a: By eliminating fallow land altogether.
x: One of the three fields was still left fallow each year.
a: By replacing all wheat with rice.
x: Rice was not a crop of northern Europe; the rotation used wheat, rye, oats, barley, and legumes.
a: By using tractors to plough more land.
x: Tractors did not exist; the rotation was a change in field management.
a*: By leaving only a third rather than half of the land fallow each year, and adding spring crops such as oats and legumes.
hint: Compare the fallow share in two- and three-field systems.
why: Using two-thirds of the land each year and adding legumes raised output and improved diets.
```

## Towns, Trade, and Guilds

From the eleventh century, towns grew rapidly across Latin Europe. Some were old Roman cities that revived; others were new foundations around castles, monasteries, bridges, or ports. Townspeople won **charters** from kings and lords granting them rights to govern themselves, hold markets, and regulate trade. In Italy and Flanders, sworn associations of citizens called **communes** sometimes seized self-government by force. A legal principle in many towns held that a serf who lived in a town for a year and a day became free, later summed up in the German phrase *Stadtluft macht frei*, "town air makes free".

Merchants and craftsmen organised themselves in **guilds**, associations that regulated prices, quality, and training through apprenticeship, protected members' interests, and often controlled town government. Guilds also had religious and charitable functions, supporting members' widows and funding chapels.

Trade expanded across Europe. In the twelfth and thirteenth centuries, the **fairs of Champagne** in northeastern France brought Italian and Flemish merchants together to trade cloth, spices, and other goods and to settle debts. In the north, a network of German trading towns, the **Hanseatic League**, dominated commerce in the Baltic and North Sea, from London and Bruges to Novgorod. In Italy, the city-republics of **Venice**, **Genoa**, and **Florence** became great commercial powers. Italian merchants developed new business techniques, many of them borrowed from or paralleled in the Islamic world, as the chapter on the Islamic commercial revolution describes: partnerships, bills of exchange, double-entry bookkeeping, and banks. Florence's gold coin, the florin, first minted in 1252, became a standard currency.

## The Church: Landlord, Power, and Learning

The Church was everywhere in medieval life. Parish priests baptised, married, and buried people; monasteries and bishoprics were among the greatest landowners; and the Church claimed a tenth of everyone's produce in the tithe. Church courts judged marriage, wills, and moral offences.

The Church's relationship with secular rulers was a major source of conflict. In the eleventh century, reforming popes sought to free the Church from control by kings and nobles, who appointed bishops and abbots and profited from Church offices. Pope **Gregory VII** clashed with the German king (later emperor) **Henry IV** over the right to invest bishops with their symbols of office, the **Investiture Controversy**. In 1077 Henry, excommunicated and facing revolt, stood in the snow outside the castle of Canossa in northern Italy for three days to seek the pope's forgiveness. The dispute was settled by compromise in the **Concordat of Worms** in 1122, but the struggle between popes and secular rulers continued for centuries.

The Church also shaped the institutions of learning. From the twelfth century, groups of masters and students organised themselves into **universities**, a new institution: Bologna, famous for law, traditionally dated to 1088 though securely attested only in the twelfth century; Paris, for theology, emerging around 1150 and recognised by the king in 1200; Oxford and Cambridge in England. Teaching followed the method of **scholasticism**, which used logic, especially the newly recovered works of Aristotle, many translated from Arabic, to examine questions of theology and philosophy. Its greatest exponent, **Thomas Aquinas** (died 1274), sought in his *Summa Theologiae* to reconcile reason and faith.

```checkpoint
q: What was at stake in the Investiture Controversy?
a: Whether kings could collect taxes from peasants.
x: The dispute concerned the appointment of bishops and the relationship between Church and secular power.
a: Whether the Church could own land.
x: The Church's landholding was not disputed; the conflict was about appointments.
a*: Whether kings or the Church controlled the appointment and investiture of bishops, and more broadly the balance of power between popes and rulers.
a: Whether universities could teach Aristotle.
x: That was a different question, debated later in the universities.
hint: Think of Canossa in 1077.
why: The controversy was a struggle over who held authority in Christian society, and it shaped Church-state relations for centuries.
---
q: Why were the new universities and scholasticism significant?
a*: Because they created a new institution of learning and used logic, especially Aristotle's, to examine theology and philosophy.
a: Because they rejected all ancient philosophy.
x: Scholastics relied heavily on Aristotle, recovered partly through Arabic translations.
a: Because they were founded by Islamic rulers in Europe.
x: Universities were founded by guilds of masters and students in Latin Europe, though they drew on Arabic learning.
a: Because they taught only practical trades such as carpentry.
x: Universities taught law, theology, medicine, and the liberal arts, not crafts.
hint: Think of Bologna, Paris, and Aquinas.
why: Universities institutionalised advanced learning, and scholasticism applied systematic reasoning to the central questions of the age.
```

## The Crisis of the Fourteenth Century

By 1300 Europe's growth had reached its limits. Population had outrun the supply of good land, and many peasants lived on the edge of subsistence. Then came a series of disasters.

The **Great Famine** of 1315–1317, caused by torrential rains and failed harvests across northern Europe, killed perhaps 10 to 25 per cent of the population of many towns. In 1337 the **Hundred Years' War** began between England and France, a series of conflicts lasting until 1453, in which armies devastated the French countryside. Between 1346 and 1353 the **Black Death** killed perhaps a third to a half (estimates run from 25 to 60 per cent) of Europe's population, as the chapter on the Black Death describes.

The disasters set off social upheaval. With so many workers dead, survivors demanded higher wages and better terms, while lords and governments tried to hold them down with laws such as England's Statute of Labourers of 1351. Revolts followed: the **Jacquerie** in northern France in 1358, the revolt of the wool workers known as the **Ciompi** in Florence in 1378, and the **Peasants' Revolt** in England in 1381, when rebels marched on London and the radical priest John Ball preached: "When Adam delved and Eve span, who was then the gentleman?" The revolts were crushed. But in western Europe, the labour shortage after the Black Death helped bring serfdom gradually to an end, while in central and eastern Europe, from the late fifteenth century, lords tightened it (the "second serfdom"). The divergence would shape European history for centuries.

## Further exploration

- **Chris Wickham, *Medieval Europe* (2016).** A concise history emphasising social and economic change.
- **Susan Reynolds, *Fiefs and Vassals: The Medieval Evidence Reinterpreted* (1994).** The book that transformed the debate over feudalism.
- **Robert Bartlett, *The Making of Europe: Conquest, Colonization and Cultural Change, 950–1350* (1993).** How Latin Europe expanded.
- **Christopher Dyer, *Making a Living in the Middle Ages: The People of Britain, 850–1520* (2002).** Economic life from the peasant's perspective.
- **Barbara Tuchman, *A Distant Mirror: The Calamitous 14th Century* (1978).** A vivid popular account of the fourteenth-century crisis.$lords_master$,
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
  select $lords_quiz$[
    {"type": "mcq", "prompt": "Who argued in Fiefs and Vassals (1994) that the classic link between vassalage and fiefs was largely a creation of later lawyers and historians?", "options": ["Marc Bloch", "Susan Reynolds", "Henri Pirenne", "Thomas Aquinas"], "answerIndex": 1, "explanation": "Reynolds, building on Elizabeth Brown's 1974 critique, transformed the debate over 'feudalism'.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the phrase 'town air makes free' refer to?", "options": ["Clean air in medieval towns", "The principle that a serf who lived in a town for a year and a day became free", "A tax on town residents", "The right of towns to declare war"], "answerIndex": 1, "explanation": "Towns offered an escape from serfdom, which was one reason they attracted migrants from the countryside.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened at Canossa in 1077?", "options": ["The first university was founded", "The Black Death arrived in Europe", "King Henry IV of Germany stood in the snow to seek Pope Gregory VII's forgiveness during the Investiture Controversy", "The Hanseatic League was founded"], "answerIndex": 2, "explanation": "Canossa became a symbol of the struggle between papal and imperial power.", "id": "q3"},
    {"type": "mcq", "prompt": "What was one long-term effect of the labour shortage after the Black Death?", "options": ["Serfdom gradually declined in western Europe while lords later tightened it in eastern Europe", "Serfdom spread across western Europe", "All wages fell", "Towns were abandoned permanently"], "answerIndex": 0, "explanation": "Survivors could demand better terms in the west, while eastern lords, from the late fifteenth century, tightened control, creating a long-lasting divergence.", "id": "q4"},
    {"type": "open", "prompt": "Explain how Europe's population roughly doubled between about 1000 and 1300, and why growth turned into crisis in the fourteenth century.", "rubric": "A strong answer explains the heavy plough, three-field rotation, horse collar, watermills, land clearance and eastward settlement, and the Medieval Climate Anomaly; and then population pressure on limited land by 1300, the Great Famine of 1315–17, the Hundred Years' War, the Black Death, and the social upheaval and revolts that followed (Jacquerie, Ciompi, Peasants' Revolt).", "id": "q5"},
    {"type": "open", "prompt": "Compare the lives of peasants and townspeople in medieval Europe. In what ways was the town a different world?", "rubric": "A strong answer contrasts manorial life (demesne, labour services, fees such as merchet and heriot, manorial courts, open fields, women's work) with towns (charters, communes, freedom after a year and a day, guilds, markets, fairs, the Hanse, Italian city-republics, new business techniques). It notes that the two worlds were linked and that most people remained peasants.", "id": "q6"}
  ]$lords_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/europe-and-byzantium/lords-peasants-and-towns-in-medieval-europe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
