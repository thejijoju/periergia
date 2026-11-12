-- Slavery in the Global Middle Ages — canonical master article, co-written and human-reviewed.
-- history/medieval-history/across-afro-eurasia/slavery-in-the-global-middle-ages @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Post-Roman and Viking-age slavery, the Mediterranean and Black Sea,
-- African and Indian Ocean trades, military slavery, law and religion and
-- serfdom, and the medieval roots of the Atlantic system.
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
    'history/medieval-history/across-afro-eurasia/slavery-in-the-global-middle-ages',
    'research',
    'advanced',
    'read',
    $slavery_master$> **Slavery in the global Middle Ages** is often overlooked, sandwiched between the slave societies of Greece and Rome and the Atlantic slave trade. Yet between about 500 and 1500, people were enslaved and traded across almost every part of Afro-Eurasia: Europeans sold to the Islamic world, Africans carried across the Sahara and the Indian Ocean, Turks and Circassians bought as soldiers who then ruled states, and Slavs whose name became the word "slave". This chapter surveys medieval slavery in Europe, the Mediterranean, Africa, and the Indian Ocean; examines military slavery and its paradoxes; looks at how law and religion regulated slavery and how it differed from serfdom; and shows how medieval systems set patterns the Atlantic world would later industrialise.

## Europe After Rome

The Roman empire had been a slave society, and slavery did not end when Roman rule did. In the early medieval kingdoms, slaves worked on estates and in households, and war captives were commonly enslaved. Over the following centuries, in much of western Europe, slavery on the land gradually gave way to **serfdom**, as lords found it more practical to settle slaves on plots of land with obligations than to work them in gangs, and as the Church encouraged the freeing of slaves as a pious act. By the twelfth century, slavery had largely disappeared from northwestern Europe, lingering longest in Ireland and Scotland, though it persisted in the Mediterranean, Iberia, and the east.

Europeans also became a major source of slaves for others. **Viking** raiders captured people across the British Isles, Francia, and the Baltic. **Dublin**, founded by Vikings, became one of the largest slave markets in western Europe, selling captives to Scandinavia, Iceland, and the Islamic world. In the east, Scandinavian Rus' traders carried slaves, along with furs, down the rivers of Russia to sell in the Islamic world for silver dirhams; the Arab traveller **Ibn Fadlan**, who met Rus' traders on the Volga in 922, described their trade in enslaved women. Venetian, Frankish, and Jewish merchants carried captives from pagan Slavic lands through Prague and Verdun (where many were castrated for sale as eunuchs) to al-Andalus and the Islamic Mediterranean. So many of the people enslaved came from Slavic lands that, on the most widely held view, the Byzantine Greek and medieval Latin words for a Slav (*sklabos*, *sclavus*) came to mean slave, giving English **slave** and its equivalents in many European languages; the derivation has been disputed since the nineteenth century.

## The Mediterranean and the Black Sea

From the thirteenth century, the Italian cities of **Venice** and **Genoa** ran a major slave trade from their trading posts on the Black Sea, such as Tana and **Caffa** in Crimea. They bought Tatars, Circassians, Russians, and others, many sold by their own rulers or captured in raids, and shipped them to the Mamluk sultanate in Egypt, which needed soldiers, and to households in Italy and Spain. In fifteenth-century Florence and Genoa, many wealthy households had enslaved domestic servants, mostly women. Across the Mediterranean, Christians and Muslims enslaved each other's captives in war and piracy, a pattern that continued well into the early modern period.

## Africa and the Indian Ocean

Slavery existed in many African societies, and African captives were traded north and east for more than a millennium before the Atlantic trade.

- **The trans-Saharan trade** carried enslaved people from West and Central Africa across the desert to North Africa and the Middle East, alongside gold, as the chapter on Ghana and Mali describes. Paul Lovejoy estimated about six million people taken across the Sahara between 650 and 1500 alone; estimates for the whole period to about 1900 are higher still, and all such figures are uncertain.
- **The Red Sea and Indian Ocean trades** carried people from East Africa and the Horn of Africa to Arabia, the Persian Gulf, Iraq, and India. Enslaved Africans, many from East Africa, called **Zanj** by Arab writers, worked in the marshes of southern Iraq, where they rose in the great **Zanj revolt** of 869–883, as the chapter on the Islamic commercial revolution described. Africans known in India as **Habshis** served as soldiers, and some rose to great power.

In these systems, many enslaved people, especially women, worked as domestic servants and concubines, and many men as soldiers and labourers. Mortality on the desert crossings was high.

```checkpoint
q: Why do most scholars connect the English word "slave" with the word "Slav"?
a*: Because so many enslaved people traded in medieval Europe and the Mediterranean came from Slavic lands that, on the usual view, the Greek and Latin words for Slav came to mean slave.
a: Because Slavic peoples invented slavery.
x: Slavery is far older than the Slavs and existed across the world.
a: Because the Slavs enslaved most of Europe.
x: The word reflects Slavs being enslaved and sold, not enslaving others.
a: Because the Roman emperors called all slaves Slavs.
x: The connection arose in the medieval period, after Rome, through the trade in Slavic captives.
hint: Think about who was being sold through Prague, Verdun, and Venice.
why: The etymology preserves the scale of the medieval trade in captives from Slavic lands.
---
q: Which statement about the trans-Saharan slave trade is correct?
a: It began only after Europeans arrived in Africa in the fifteenth century.
x: The trans-Saharan trade operated for centuries before European ships reached West Africa.
a: It carried enslaved Europeans south into Africa.
x: The main flow of enslaved people across the Sahara was northward, from sub-Saharan Africa.
a*: It carried enslaved people from West and Central Africa across the desert to North Africa and the Middle East over many centuries, alongside trade in gold.
a: It involved only small numbers of people for a few decades.
x: Historians estimate many millions over more than a thousand years.
hint: Compare its timing with the Atlantic trade.
why: Long before the Atlantic trade, African captives were traded northward across the Sahara on a large scale.
```

## Military Slavery and Its Paradoxes

One of the most distinctive features of medieval slavery in the Islamic world was **military slavery**. From the ninth century, the Abbasid caliphs bought young Turkish boys from the steppe, trained them as soldiers, and used them as an elite army loyal to the ruler rather than to tribes or regions. These slave soldiers were called *ghilman* or **mamluks**, "owned ones". Military slavery spread across the Islamic world.

The paradox was that these slaves could become masters. In 1250 the mamluk soldiers of Egypt overthrew their Ayyubid masters and founded the **Mamluk sultanate**, which ruled Egypt and Syria until 1517. Most Mamluk sultans were themselves former slaves, often bought as boys from the Black Sea region, who then bought and trained new mamluks. The Mamluks defeated the Mongols at Ain Jalut in 1260 and in 1291 took Acre, the last major crusader stronghold.

In India, the first dynasty of the **Delhi Sultanate**, founded in 1206, is known as the Mamluk or "Slave" dynasty, because several of its rulers, beginning with its founder Qutb al-Din Aybak, had been slave soldiers, as the chapter on the Delhi Sultanate describes. Later, the **Ottoman** empire developed the **devshirme**, a levy of Christian boys from the Balkans who were converted to Islam and trained as soldiers, the **Janissaries**, or as administrators. Some became grand viziers, the most powerful officials in the empire. Military slaves could hold great power and wealth, yet their status rested on ties of slavery: Egyptian mamluks were usually freed after training but stayed bound to their former masters, while the Janissaries remained the sultan's slaves. Their status was distinctive to these systems.

## Law, Religion, and the Line with Serfdom

All three Abrahamic religions accepted the existence of slavery, while regulating it.

**Islamic law** forbade the enslavement of Muslims and of protected non-Muslims (*dhimmis*) living under Muslim rule, so new slaves had to come from outside the Islamic world, through war or purchase, or be born to enslaved parents. It encouraged the freeing of slaves as a pious act, and children whom a free master acknowledged as his by an enslaved concubine were born free, and under Sunni law the mother, called *umm walad*, could not be sold and was freed when he died.

**Christian authorities** increasingly condemned the enslavement of Christians by Christians, though they accepted the enslavement of non-Christians and of enemies in war. Religious orders were founded to ransom Christian captives held by Muslims: the **Trinitarians**, approved by the pope in 1198, and the **Mercedarians**, traditionally founded in 1218.

The line between **slavery and serfdom** was not always clear. Serfs were bound to the land and owed labour, but generally could not be sold apart from it and had customary rights, as the chapter on lords and peasants described. In some places, such as early medieval England or Russia, categories of unfree people overlapped with both slavery and serfdom. Historians use these comparisons to understand the many forms unfreedom could take.

```checkpoint
q: What is the paradox of mamluk military slavery?
a: That mamluks were paid more than any free soldier but could never fight.
x: Mamluks were above all soldiers; the paradox concerns their path to power.
a*: That slave soldiers, bought and trained to serve rulers, could become rulers themselves, as in the Mamluk sultanate of Egypt.
a: That mamluks were all freed at birth.
x: Mamluks were bought as boys and trained in slavery; manumission usually came after training.
a: That mamluks were always European Christians.
x: Most early mamluks were Turks from the steppe, later also Circassians.
hint: Who ruled Egypt from 1250 to 1517?
why: Military slavery created elite soldiers whose loyalty and power could turn them into masters of the states they served.
---
q: Which rule of Islamic law shaped where slaves came from?
a: Muslims could enslave any person regardless of religion.
x: Islamic law forbade enslaving Muslims and protected non-Muslims living under Muslim rule.
a: Only women could be enslaved.
x: Both men and women were enslaved, including male soldiers.
a: Slavery was entirely forbidden in Islamic law.
x: Islamic law accepted and regulated slavery while encouraging manumission.
a*: Muslims and protected non-Muslims under Muslim rule could not be enslaved, so slaves had to come from outside the Islamic world.
hint: Think of the need for military slaves from the steppe and captives from Africa and Europe.
why: Legal restrictions on enslaving insiders drove the trade in captives from beyond the Islamic world's borders.
```

## Setting Patterns for the Atlantic

Many features of the later Atlantic slave trade had medieval precedents. In the eastern Mediterranean, Venetians and others grew **sugar** on plantations in Cyprus and Crete, using enslaved alongside free and unfree labour, and historians trace a westward shift of large-scale sugar production, to Sicily, Spain, and then the Atlantic islands of **Madeira** and the Canaries in the fifteenth century, where Portuguese and Spanish planters used enslaved Africans and Canary Islanders. The Portuguese chronicler Gomes Eanes de Zurara, writing about 1453, described the first large public sale of enslaved Africans brought by sea, at Lagos in Portugal in 1444, a scene of families torn apart that he recorded with a mixture of pity and justification.

Ideas also moved. In parts of the medieval Islamic world, some writers increasingly associated slavery with black Africans, and reinterpreted the biblical "curse of Ham" to justify it; Christian writers later adopted and adapted similar arguments. Iberian law on slavery, codified in the thirteenth-century *Siete Partidas* of Castile, was later applied in the Spanish Americas. The Atlantic system, the subject of later chapters, would combine these medieval elements, plantation agriculture, long-distance trade in captives, and racial justification, on an industrial scale never seen before.

## Further exploration

- **Alice Rio, *Slavery After Rome, 500–1100* (2017).** How slavery changed in early medieval Europe.
- **Hannah Barker, *That Most Precious Merchandise: The Mediterranean Trade in Black Sea Slaves, 1260–1500* (2019).** The Italian and Mamluk slave trade.
- **Craig Perry and others (eds.), *The Cambridge World History of Slavery, Vol. 2: AD 500–AD 1420* (2021).** A global survey of medieval slavery.
- **Paul E. Lovejoy, *Transformations in Slavery: A History of Slavery in Africa* (3rd ed., 2011).** Slavery within Africa and its trades.
- **David Wyatt, *Slaves and Warriors in Medieval Britain and Ireland, 800–1200* (2009).** Slavery and the Viking-age slave trade in the British Isles.$slavery_master$,
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
  select $slavery_quiz$[
    {"type": "mcq", "prompt": "Which city founded by Vikings became one of the largest slave markets in western Europe?", "options": ["Paris", "Venice", "Dublin", "Lisbon"], "answerIndex": 2, "explanation": "Dublin's Viking traders sold captives to Scandinavia, Iceland, and the Islamic world.", "id": "q1"},
    {"type": "mcq", "prompt": "Who were the Mamluks of Egypt?", "options": ["Former slave soldiers who overthrew their masters and ruled Egypt and Syria from 1250 to 1517", "Free-born Arab nobles", "Crusader knights", "Byzantine governors"], "answerIndex": 0, "explanation": "The Mamluk sultanate was ruled by former military slaves who bought and trained new mamluks.", "id": "q2"},
    {"type": "mcq", "prompt": "Which religious orders were founded to ransom Christian captives?", "options": ["Templars and Hospitallers", "Franciscans and Dominicans", "Benedictines and Cistercians", "Trinitarians and Mercedarians"], "answerIndex": 3, "explanation": "The Trinitarians (approved 1198) and Mercedarians (traditionally 1218) raised funds to free Christians held captive by Muslims.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Ottoman devshirme involve?", "options": ["A tax on slave markets", "A levy of Christian boys from the Balkans, converted and trained as soldiers or administrators", "The freeing of all slaves", "A treaty with Venice"], "answerIndex": 1, "explanation": "The devshirme produced the Janissaries and senior officials, some of whom became grand viziers.", "id": "q4"},
    {"type": "open", "prompt": "Describe the main slave trades of the medieval world and compare them.", "rubric": "A strong answer covers the Viking and Rus' trades (Dublin, the Volga, Ibn Fadlan), the Slavic trade through Prague and Verdun (and the slave/Slav etymology), the Venetian and Genoese Black Sea trade, the trans-Saharan trade, and the Red Sea and Indian Ocean trades (Zanj, Habshis). It compares sources of captives, destinations, uses (domestic, concubinage, military, agricultural), and the role of religious law.", "id": "q5"},
    {"type": "open", "prompt": "In what ways did medieval slavery set patterns for the Atlantic slave trade?", "rubric": "A strong answer identifies the westward movement of the sugar plantation from Cyprus and Crete through Sicily and Spain to Madeira and the Canaries; the Portuguese trade in Africans by sea from the 1440s (Zurara's account of 1444); the increasing association of slavery with black Africans and reinterpretations of the curse of Ham; Iberian slave law (Siete Partidas) applied in the Americas; and explains how the Atlantic system later combined these on an industrial scale.", "id": "q6"}
  ]$slavery_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/across-afro-eurasia/slavery-in-the-global-middle-ages', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
