-- Ghana, Mali, and the Trans-Saharan World — canonical master article, co-written and human-reviewed.
-- history/medieval-history/africa/ghana-mali-and-the-trans-saharan-world @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Gold, salt, and camels; Ghana and al-Bakri; Mali and the Sunjata
-- epic; Mansa Musa; Timbuktu and its manuscripts; Songhay and the Moroccan
-- invasion; and Jenne-jeno.
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
    'history/medieval-history/africa/ghana-mali-and-the-trans-saharan-world',
    'research',
    'advanced',
    'read',
    $mali_master$> **Ghana, Mali, and Songhay** were the great empires of medieval West Africa, built in the grasslands of the Sahel on the southern edge of the Sahara. They grew rich on the **trans-Saharan trade**, which carried West African gold north across the desert in exchange for salt, cloth, horses, and other goods, and linked West Africa to the Islamic world and, indirectly, to Europe. Mali's ruler Mansa Musa became so famous for his wealth that a fourteenth-century European map shows him holding a lump of gold. This chapter explains how the trade worked, describes the three empires, Timbuktu and its manuscripts, and the Moroccan invasion of 1591, and shows how historians combine Arabic chronicles, oral tradition, and archaeology to reconstruct this history.

## Gold, Salt, and Camels

The Sahara is the largest hot desert in the world. Crossing it on foot or with horses was nearly impossible. What made regular trade possible was the **camel**, which can travel for long periods without water, and which spread across North Africa in the early centuries CE. By the eighth century, after the Arab conquest of North Africa, caravans were crossing the desert regularly, a journey of two months or more; later sources describe caravans of a thousand camels or more, guided by Berber nomads who knew the routes and oases.

The trade rested on a striking exchange. West Africa had **gold**, mined in the goldfields of Bambuk and Bure near the upper Senegal and Niger rivers, and later in the Akan forest further south. The Sahel and the forest lands to the south lacked **salt**, essential for health in a hot climate, which was mined in the desert itself, at places such as Taghaza, where buildings were made of slabs of salt. Gold went north; salt, copper, cloth, horses, beads, and manufactured goods came south. West African gold supplied much of the gold used in the Islamic world and medieval Europe, probably including some of the gold of the Fatimid dinars, and later the gold coins that Genoa and Florence began to strike in 1252. Enslaved people were also carried north across the desert, as the chapter on slavery describes.

## Ghana

The earliest of the great Sahelian states known from written sources was **Ghana**, called **Wagadu** by its Soninke people, which flourished from at least the eighth century into the twelfth. (Modern Ghana, far to the south, took its name in 1957 in honour of the ancient empire.) Its power rested on controlling the trade between the goldfields and the desert routes, taxing gold and salt.

The best description comes from the Andalusian geographer **al-Bakri**, who wrote in 1068, using reports from merchants; he never visited. He described a capital of two towns, one inhabited by Muslim merchants, with twelve mosques, and the other the king's town, with his palace, sacred groves, and the shrines of the local religion. The king, who was not Muslim, employed Muslims as ministers and interpreters. Al-Bakri reported that the king kept all gold nuggets for himself, allowing people only gold dust, in order to keep the price of gold high, and that he was rumoured to own a nugget as large as a big stone. The ruins of **Koumbi Saleh**, in modern Mauritania, have long been identified as the merchants' town, though recent scholars increasingly doubt the identification.

Ghana's rulers adopted Islam around 1076, and the kingdom declined during the twelfth century; the Sosso took over its heartland around 1200. A long historiographical tradition, resting on late and ambiguous Arabic sources such as Ibn Khaldun, held that the **Almoravids**, a Berber Muslim movement from the western Sahara, conquered Ghana in 1076–77, but the historians David Conrad and Humphrey Fisher argued in 1982–83 that this "conquest" is a misreading of the sources, and that Ghana's decline came from other causes, such as shifts in trade routes and drought.

## Mali and the Epic of Sunjata

In the thirteenth century, the Mande people of the upper Niger built a new empire, **Mali**. Its founding is told in the **Epic of Sunjata**, preserved by **griots** (*jeliw*), hereditary bards and historians who memorised and performed genealogies, praise songs, and histories. According to the epic, **Sunjata Keita**, a prince born disabled and mocked as a child, overcame his weakness, went into exile, and returned to defeat the sorcerer-king **Sumanguru** of the Sosso at the battle of Kirina, conventionally dated to around 1235, founding the Mali empire. The epic contains historical memory shaped by centuries of performance and must be used critically, as the methods for oral tradition set out by Jan Vansina in *Oral Tradition as History* (1985), and described in the chapter What is History?, require. It also tells of an assembly at Kurukan Fuga where the laws and social order of the empire were established, a tradition some modern West Africans celebrate as an early constitution.

Mali became one of the largest empires in the world in the fourteenth century, stretching from the Atlantic coast to the middle Niger. Its rulers, called *mansa*, were Muslims, while many of their subjects followed local religions, and the empire was held together by trade, tribute, and the prestige of the ruler.

```checkpoint
q: Why was the trans-Saharan trade based on an exchange of gold and salt?
a*: Because West Africa had rich goldfields but the Sahel and forest lands lacked salt, which was mined in the desert, so gold went north and salt came south.
a: Because North Africa had gold and West Africa had salt.
x: It was the reverse: West Africa had gold, and salt was mined in the Sahara.
a: Because both regions had plenty of gold and salt.
x: The trade existed precisely because each region lacked what the other had.
a: Because salt was used as currency only in Europe.
x: Salt was essential for health in West Africa's hot climate, which is why it was in demand there.
hint: Think of Taghaza's salt buildings and Bambuk's goldfields.
why: Complementary scarcities made gold and salt the core of a trade that linked West Africa to the Mediterranean world.
---
q: How should historians use the Epic of Sunjata?
a: As a literal, word-for-word record of events in 1235.
x: The epic has been shaped by centuries of oral performance and cannot be read literally.
a: As pure fiction with no historical value.
x: The epic preserves genuine historical memory, such as the founding of Mali and the conflict with the Sosso.
a*: As oral tradition preserving genuine historical memory, shaped by centuries of performance, to be used critically alongside other evidence.
a: As a document written by Arab geographers.
x: The epic is preserved by Mande griots, not Arab writers.
hint: Recall Vansina's methods for oral tradition.
why: Oral tradition is a vital source for African history, but it must be read with attention to how it was transmitted and shaped.
```

## Mansa Musa

The most famous ruler of Mali was **Mansa Musa** (reigned around 1312–1337). In 1324 he made the pilgrimage, the **hajj**, to Mecca, travelling with a huge retinue and, according to Arabic accounts, so much gold that he and his followers spent and gave away enough in Cairo that, according to al-Umari, the value of gold there stayed depressed for at least twelve years, though the historian Warren Schultz argues the fall was within normal fluctuations. **Al-Umari**, a Damascus-born official of the Mamluk state, wrote about a dozen years later from the accounts of Cairo officials who had met Musa; he recorded the visit and reported Musa's account of a predecessor who had sent fleets of ships into the Atlantic Ocean and then set out himself, never to return, a story that has inspired much speculation but cannot be verified.

Musa's pilgrimage made Mali famous across the Islamic world and Europe. The **Catalan Atlas**, a map made in Majorca and conventionally dated 1375, shows a West African king, labelled "Musse Melly" (Musa of Mali), holding a gold nugget or orb, with a caption calling him the richest and noblest king of all these lands. Musa returned from the hajj with Muslim scholars and the Andalusian poet al-Sahili, whom tradition credits with the **Djinguereber mosque** in **Timbuktu**, built in the characteristic mud-brick style of the Sahel, though the sources firmly attest him only as designer of a royal audience chamber.

The Moroccan traveller **Ibn Battuta** visited Mali in 1352–1353, during the reign of Musa's brother Sulayman. He was impressed by the safety of travel and the justice of the government, and by the people's devotion to Friday prayer, but disapproved of some customs, such as women, including the sultan's daughters, appearing in public scantily clothed, and the meagre gift Sulayman gave him on arrival.

{{image: Catalan Atlas | Detail of the Catalan Atlas (conventionally dated 1375), showing Mansa Musa of Mali holding a piece of gold.}}

## Timbuktu and Its Manuscripts

**Timbuktu**, near the Niger river at the edge of the desert, became a centre of trade from the fourteenth century and, especially in the fifteenth and sixteenth, a great centre of Islamic scholarship. Its mosques, including Sankore, were centres of teaching, and its scholars wrote and collected manuscripts on law, theology, astronomy, medicine, mathematics, and history. Hundreds of thousands of manuscripts survived in family libraries in Timbuktu and the surrounding region. In 2012–2013, when jihadist groups occupied the city, they destroyed shrines and set fire to manuscripts, destroying or stealing some 4,200 manuscripts, but librarians and families smuggled about 350,000 to safety in Bamako.

Timbuktu's scholars also wrote the main local histories of the region, the **Tarikh al-Sudan** (about 1655) and a seventeenth-century chronicle later reworked in the early nineteenth century and published as the Tarikh al-Fattash; these, together with Arabic geographers and oral tradition, are major sources for West African history. Timbuktu's legendary wealth and remoteness later made it, in European imagination, a byword for the ends of the earth.

## Songhay and the Moroccan Invasion

In the fifteenth century, Mali declined as provinces broke away. The city of **Gao**, on the Niger, became the centre of a new empire, **Songhay**, the largest of the three. Its ruler **Sunni Ali** (reigned 1464–1492), a brilliant soldier, captured Timbuktu in 1468–69. His successor **Askia Muhammad** (reigned 1493–1528) made the hajj, strengthened Islamic institutions, and organised an efficient administration.

Songhay fell suddenly. In 1590 the sultan of **Morocco**, Ahmad al-Mansur, eager to seize the source of the gold trade, sent an army across the Sahara, including soldiers armed with firearms, many of them converts from Christianity and Muslim exiles from Spain. At the battle of **Tondibi** in March 1591, the Moroccan musketeers defeated the much larger Songhay army. Morocco could not hold the region for long, losing effective control of its cities soon after 1620, and the gold trade did not enrich it as hoped, partly because European ships were now reaching the West African coast and redirecting trade toward the Atlantic.

Archaeology adds a different perspective. At **Jenne-jeno**, an ancient city on the inland delta of the Niger, excavations by Susan and Roderick McIntosh showed a settlement founded around 250 BCE, long before the Arab trade, that grew into a town of more than 33 hectares by about 1000 CE, with craft specialisation and long-distance exchange but no evidence of a centralised state or rulers. West African urbanism, in other words, did not begin with trans-Saharan trade or Islam, and could take forms quite unlike the cities of other regions.

```checkpoint
q: What did Mansa Musa's pilgrimage of 1324 show about Mali?
a: That Mali was a small, isolated kingdom.
x: The pilgrimage showed Mali's wealth and connections to the Islamic world.
a*: That Mali was enormously wealthy and connected to the Islamic world; his spending reportedly depressed the value of gold in Cairo for years.
a: That Mali was ruled by Egypt.
x: Musa visited Cairo as an independent ruler; Mali was not ruled by Egypt.
a: That Musa had abandoned Islam.
x: The hajj is a Muslim religious duty; Musa was a devout Muslim ruler.
hint: Consider what al-Umari reported about gold in Cairo.
why: The pilgrimage advertised Mali's wealth across the Islamic world and Europe, as the Catalan Atlas shows.
---
q: What did the excavations at Jenne-jeno reveal?
a: That West African towns only began after the arrival of Islam.
x: Jenne-jeno was settled from around 250 BCE, centuries before Islam.
a: That Jenne-jeno was the capital of the Mali empire.
x: Jenne-jeno was a much older town, and no centralised state has been found there.
a: That the town was founded by Moroccan soldiers in 1591.
x: Jenne-jeno is far older than the Moroccan invasion.
a*: A settlement from around 250 BCE that grew into a large town, with craft specialisation and long-distance exchange, but no evidence of centralised rulers, showing that West African urbanism predated Arab trade and took distinctive forms.
hint: Compare the town's date with the arrival of the trans-Saharan trade.
why: Archaeology shows indigenous West African urbanism, challenging the idea that cities came only with outside contact.
```

## Further exploration

- **Michael A. Gomez, *African Dominion: A New History of Empire in Early and Medieval West Africa* (2018).** A major new history of Ghana, Mali, and Songhay.
- **D. T. Niane, *Sundiata: An Epic of Old Mali* (English trans. 1965).** A version of the Sunjata epic as told by a griot.
- **Nehemia Levtzion, *Ancient Ghana and Mali* (1973).** A classic study of the empires.
- **François-Xavier Fauvelle, *The Golden Rhinoceros: Histories of the African Middle Ages* (2018).** Short essays on medieval Africa from the sources.
- **Joshua Hammer, *The Bad-Ass Librarians of Timbuktu: And Their Race to Save the World's Most Precious Manuscripts* (2016).** The rescue of Timbuktu's manuscripts in 2012–2013.$mali_master$,
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
  select $mali_quiz$[
    {"type": "mcq", "prompt": "What made regular trans-Saharan trade possible?", "options": ["The camel, which spread across North Africa in the early centuries CE", "Railways", "Horses alone", "Rivers crossing the Sahara"], "answerIndex": 0, "explanation": "Camels could travel long distances without water, making regular caravans across the desert possible.", "id": "q1"},
    {"type": "mcq", "prompt": "Who wrote the 1068 description of Ghana's twin-town capital?", "options": ["Ibn Battuta", "Al-Umari", "Leo Africanus", "Al-Bakri"], "answerIndex": 3, "explanation": "The Andalusian geographer al-Bakri described the Muslim merchants' town and the king's town from merchants' reports.", "id": "q2"},
    {"type": "mcq", "prompt": "What does the Catalan Atlas of about 1375 show?", "options": ["The voyages of Vasco da Gama", "The Moroccan invasion of Songhay", "Mansa Musa of Mali holding a piece of gold", "The founding of Timbuktu"], "answerIndex": 2, "explanation": "Musa's fame after his 1324 hajj reached Europe, where a mapmaker depicted him as the richest and noblest king of the region.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened at the battle of Tondibi in 1591?", "options": ["Sunjata defeated Sumanguru", "Moroccan musketeers defeated the Songhay army", "Mali conquered Ghana", "The Portuguese took Timbuktu"], "answerIndex": 1, "explanation": "Morocco's firearms defeated the larger Songhay army, though Morocco could not hold the region for long.", "id": "q4"},
    {"type": "open", "prompt": "How do historians combine different kinds of evidence to reconstruct the history of medieval West Africa?", "rubric": "A strong answer discusses Arabic geographers and travellers (al-Bakri, al-Umari, Ibn Battuta), local chronicles (the Tarikh al-Sudan and the reworked Tarikh al-Fattash), oral tradition preserved by griots (the Sunjata epic, read critically following Vansina), European sources such as the Catalan Atlas, Timbuktu's manuscripts, and archaeology (Koumbi Saleh, Jenne-jeno). It explains the strengths and limits of each and how they corroborate or correct each other, such as the debate over the Almoravid 'conquest' of Ghana.", "id": "q5"},
    {"type": "open", "prompt": "Explain how control of the gold and salt trade shaped the rise and fall of Ghana, Mali, and Songhay.", "rubric": "A strong answer explains the gold–salt exchange and the role of the camel and Berber guides; Ghana's taxation and control of nuggets; Mali's expansion and Mansa Musa's wealth; Timbuktu as a centre of trade and scholarship; Songhay under Sunni Ali and Askia Muhammad; and the Moroccan invasion of 1591 aimed at the gold source, together with the redirection of trade to the Atlantic coast by European ships.", "id": "q6"}
  ]$mali_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/africa/ghana-mali-and-the-trans-saharan-world', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
