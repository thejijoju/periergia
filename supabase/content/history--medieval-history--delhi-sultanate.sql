-- The Delhi Sultanate and Medieval India — canonical master article, co-written and human-reviewed.
-- history/medieval-history/asia/the-delhi-sultanate-and-medieval-india @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Regional kingdoms and temple economies, the Cholas, Mahmud of Ghazni and
-- Somnath, the Delhi Sultanate, Vijayanagara, Bhakti and Sufi devotion,
-- and the politics of telling this history.
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
    'history/medieval-history/asia/the-delhi-sultanate-and-medieval-india',
    'research',
    'advanced',
    'read',
    $delhi_master$> **Medieval India**, between the end of the Gupta empire in the sixth century and the arrival of the Mughals in 1526, was once dismissed as a dark age of fragmentation followed by "Muslim conquest". Historians now see it very differently: as a period of powerful regional kingdoms, monumental temple building, new forms of devotional religion, maritime expansion, and the creation, through the Delhi Sultanate, of a new Indo-Islamic political culture. This chapter covers the regional kingdoms, the Chola navy, the raids of Mahmud of Ghazni, the Delhi Sultanate and its rulers, the southern empire of Vijayanagara, Bhakti and Sufi devotion, and the long argument over how this history should be told.

## Regional Kingdoms and Temple Economies

After the Gupta empire fragmented, as the chapter on classical India described, the king **Harsha** (reigned 606–647) briefly united much of northern India; the Chinese pilgrim Xuanzang visited his court. After his death, no single power dominated the subcontinent for centuries. In the eighth and ninth centuries, three great regional powers, the **Palas** of Bengal, patrons of Buddhism and of the university at Nalanda; the **Pratiharas** of the north; and the **Rashtrakutas** of the Deccan, fought for control of the rich Ganges plain in what historians call the "tripartite struggle". In the northwest and west, **Rajput** clans built kingdoms and forts and claimed descent from ancient warrior lineages.

In the south, the **Chola** dynasty rose to dominate the Tamil lands from the late ninth century. Its greatest kings, **Rajaraja I** (985–1014) and his son **Rajendra I** (1014–1044), conquered Sri Lanka and the Maldives and built a powerful navy. In 1025 Rajendra launched a naval expedition across the Bay of Bengal against the maritime empire of **Srivijaya**, which controlled the Strait of Malacca, as the chapter on Southeast Asia describes, a striking demonstration of medieval Indian sea power. Rajaraja built the vast **Brihadisvara temple** at Thanjavur, completed around 1010.

Temples were the heart of medieval Indian society and economy. Kings and wealthy donors endowed them with land, villages, gold, and cattle; temples employed priests, musicians, dancers, craftsmen, and accountants, lent money, and organised irrigation. Their inscriptions record thousands of gifts and are a major historical source. Temples were also symbols of royal power, which helps explain why rival kings, Hindu as well as Muslim, sometimes attacked or looted them.

## Mahmud of Ghazni

From the late tenth century, Turkic rulers from Afghanistan raided northern India. **Mahmud of Ghazni** led some seventeen raids between about 1000 and 1027, plundering wealthy cities and temples. The most famous was his raid on the temple of **Somnath** in Gujarat in 1025–1026. Mahmud presented his raids as holy war, and his court poets celebrated them; but his main aim was plunder to finance his wars in Central Asia, and he did not establish lasting rule in India beyond the Punjab.

The memory of Somnath has had a long and changing history. The historian **Romila Thapar**, in *Somanatha* (2004), showed that the raid was remembered very differently in Persian chronicles, Sanskrit inscriptions, Jain texts, and later colonial and nationalist writing, and that its later status as a symbol of Hindu–Muslim enmity was shaped largely in the nineteenth and twentieth centuries.

## The Delhi Sultanate

Lasting Muslim rule in northern India began with **Muhammad of Ghor**, another Afghan ruler. In 1191 he was defeated by the Rajput king **Prithviraj Chauhan** at Tarain, but he returned in 1192 and won. When he was assassinated in 1206, his general **Qutb al-Din Aybak**, who had been a slave soldier, became sultan in **Delhi**, founding the **Delhi Sultanate**, which ruled much of northern India, under a series of dynasties, until 1526.

Its first dynasty is called the Mamluk or "Slave" dynasty because several of its rulers had been slave soldiers, as the chapter on slavery described. Aybak began the **Qutb Minar**, a towering minaret in Delhi. His successor **Iltutmish** (1211–1236) consolidated the sultanate and won recognition from the Abbasid caliph. Iltutmish chose his daughter **Razia** as his successor; she ruled as sultan from 1236 to 1240, the only woman to rule the sultanate, before the nobles overthrew her.

The sultanate faced the Mongols, who conquered much of the Islamic world in the thirteenth century. The **Khalji** sultan **Alauddin** (1296–1316) repelled several Mongol invasions, and to pay a large standing army he introduced strict controls on grain prices and markets in Delhi. His general **Malik Kafur** led raids deep into southern India, reaching Madurai in 1311.

The **Tughluq** sultan **Muhammad bin Tughluq** (1325–1351) was brilliant, learned, and erratic. He moved much of Delhi's population to a new capital, Daulatabad in the Deccan, and then back again; he issued a token currency of copper coins, which failed when people forged them in vast numbers. The Moroccan traveller **Ibn Battuta** spent several years at his court as a judge, describing its splendour and its terror. In 1398 the Central Asian conqueror **Timur** sacked Delhi with great slaughter. The sultanate survived under weaker dynasties until 1526, when **Babur**, a descendant of Timur and Chinggis Khan, defeated the last sultan at **Panipat** and founded the Mughal empire.

The sultans ruled a population that remained overwhelmingly non-Muslim. They depended on Hindu chiefs, landholders, and officials to collect revenue, and Persian became the language of administration and high culture. Out of this encounter emerged an **Indo-Islamic** culture, in architecture, music, language (the precursors of Urdu and Hindi), and courtly life.

```checkpoint
q: Why is the first dynasty of the Delhi Sultanate called the "Slave" dynasty?
a*: Because several of its rulers, including its founder Qutb al-Din Aybak, had been slave soldiers.
a: Because it enslaved the entire population of Delhi.
x: The name refers to the rulers' origins, not to the enslavement of Delhi's population.
a: Because it was founded by escaped slaves from Africa.
x: Aybak was a Turkic military slave, part of the mamluk system, not an escaped African slave.
a: Because it abolished slavery in India.
x: Slavery continued under the sultanate.
hint: Recall the mamluk system of military slavery.
why: The name reflects military slavery, in which slave soldiers could rise to become rulers, as in Mamluk Egypt.
---
q: What does Romila Thapar's study of Somnath show?
a: That the raid on Somnath never happened.
x: Thapar accepts that the raid took place; her study concerns how it was remembered.
a: That Mahmud of Ghazni ruled India for a century.
x: Mahmud did not establish lasting rule beyond the Punjab.
a*: That the raid was remembered very differently in different sources, and that its status as a symbol of Hindu–Muslim enmity was largely shaped in the nineteenth and twentieth centuries.
a: That Somnath was a Buddhist monastery.
x: Somnath was a Hindu temple dedicated to Shiva.
hint: Compare Persian chronicles, Sanskrit inscriptions, and colonial writing.
why: Thapar shows how memory of an event can be reshaped over centuries to serve modern political identities.
```

## Vijayanagara and the South

In 1336 two brothers, **Harihara and Bukka**, founded a kingdom in the Deccan that became the empire of **Vijayanagara**, "City of Victory", which dominated southern India for more than two centuries. Its capital, at modern **Hampi**, was one of the largest cities in the world, with great temples, palaces, markets, and irrigation works, admired by Persian and Portuguese visitors. Vijayanagara's greatest king, **Krishnadevaraya** (1509–1529), was a patron of poetry and a successful general. The empire was long rivals with the **Bahmani** sultanate, founded in 1347, and its successor sultanates in the Deccan. In 1565 an alliance of the Deccan sultanates defeated Vijayanagara at Talikota and sacked the capital, whose ruins survive.

Historians note that Vijayanagara, often portrayed as a Hindu bulwark against Islam, borrowed heavily from Islamic courtly culture, employed Muslim soldiers, and its kings sometimes styled themselves "sultan among Hindu kings".

## Bhakti and Sufi Devotion

Medieval India saw a flowering of devotional religion. The **Bhakti** movement emphasised intense personal love and devotion to a god, often Shiva or Vishnu, over ritual and caste hierarchy. It began among the Tamil poet-saints, the **Alvars** and **Nayanars**, between the sixth and ninth centuries, and spread north. Later Bhakti poets included **Kabir** (fifteenth century), a weaver who criticised both Hindu and Muslim formalism and whose verses are revered by Hindus, Muslims, and Sikhs, and, in the sixteenth century, the princess-poet **Mirabai**. **Guru Nanak** (1469–1539), founder of Sikhism, emerged from this world of devotion.

**Sufism**, the mystical tradition of Islam, spread widely in India through orders of saints. The **Chishti** order, founded in India by **Moinuddin Chishti** of Ajmer (died 1236), and led in Delhi by **Nizamuddin Auliya** (died 1325), emphasised love, music, and service to the poor, and its shrines attracted Hindus as well as Muslims. The poet **Amir Khusrau**, a disciple of Nizamuddin, wrote in Persian and in early Hindavi and is credited with shaping North Indian music.

## How Should This History Be Told?

The history of medieval India has been deeply shaped by later politics. In 1817 the British writer James Mill divided Indian history into "Hindu", "Muslim", and "British" periods, a scheme that presented religious communities as the main actors of history and the "Muslim period" as one of foreign conquest. This periodisation influenced both colonial historiography and later Hindu and Muslim nationalisms.

Historians now challenge it. Medieval states were shaped by dynasty, region, class, and language as much as by religion; Hindu and Muslim rulers fought, allied, and borrowed from each other; and most people's lives changed little with the religion of their rulers. The historian **Richard Eaton** examined the evidence for temple destruction under Muslim rulers between 1192 and 1760 and found about eighty documented cases, far fewer than often claimed, and argued that temples were targeted mainly as symbols of the political power of rival kings, a practice Hindu kings also engaged in. His work has been both influential and controversial. The debate continues to matter in modern India, where the medieval past is invoked in disputes over places of worship and national identity.

```checkpoint
q: What was the Bhakti movement?
a: A military alliance of Rajput kings.
x: Bhakti was a religious movement, not a military alliance.
a*: A devotional movement emphasising intense personal love for a god over ritual and caste hierarchy, beginning with Tamil poet-saints.
a: A Persian school of painting.
x: Bhakti was a religious movement expressed mainly in poetry and song.
a: The official religion of the Delhi Sultanate.
x: The sultans were Muslim; Bhakti was a Hindu devotional movement that flourished across regions.
hint: Think of the Alvars, Kabir, and Mirabai.
why: Bhakti offered a path of devotion open to all, challenging ritual and caste hierarchy and shaping Indian religion for centuries.
---
q: Why do historians criticise James Mill's division of Indian history into "Hindu", "Muslim", and "British" periods?
a: Because India had no Muslim rulers.
x: India had many Muslim rulers; the critique concerns organising history by religion.
a: Because Mill ignored the British period.
x: Mill's scheme explicitly included a British period.
a: Because Mill was a medieval Indian historian.
x: Mill wrote in 1817, during British rule.
a*: Because it treats religious communities as the main actors of history and presents the "Muslim period" as foreign conquest, obscuring the roles of dynasty, region, and exchange.
hint: What does labelling periods by religion assume?
why: Mill's scheme shaped colonial and nationalist histories, and historians now emphasise more complex, interacting forces.
```

## Further exploration

- **Richard M. Eaton, *India in the Persianate Age, 1000–1765* (2019).** A major synthesis of medieval and early modern India.
- **Peter Jackson, *The Delhi Sultanate: A Political and Military History* (1999).** The standard history of the sultanate.
- **Romila Thapar, *Somanatha: The Many Voices of a History* (2004).** How one event was remembered over a thousand years.
- **Upinder Singh, *A History of Ancient and Early Medieval India* (2008).** Covers the regional kingdoms and the Cholas.
- **Ibn Battuta, *The Travels of Ibn Battuta*, abridged ed. Tim Mackintosh-Smith (2002).** Includes his years in Delhi.$delhi_master$,
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
  select $delhi_quiz$[
    {"type": "mcq", "prompt": "What did the Chola king Rajendra I do in 1025?", "options": ["Founded the Delhi Sultanate", "Converted to Islam", "Launched a naval expedition across the Bay of Bengal against Srivijaya", "Built the Qutb Minar"], "answerIndex": 2, "explanation": "The expedition demonstrated Chola sea power against the empire controlling the Strait of Malacca.", "id": "q1"},
    {"type": "mcq", "prompt": "Who was the only woman to rule the Delhi Sultanate?", "options": ["Razia", "Mirabai", "Nur Jahan", "Ahilyabai"], "answerIndex": 0, "explanation": "Razia, chosen by her father Iltutmish, ruled from 1236 to 1240 before the nobles overthrew her.", "id": "q2"},
    {"type": "mcq", "prompt": "Which Moroccan traveller served as a judge at the court of Muhammad bin Tughluq?", "options": ["Ibn Khaldun", "Al-Biruni", "Ibn Fadlan", "Ibn Battuta"], "answerIndex": 3, "explanation": "Ibn Battuta spent several years in Delhi and described the court's splendour and terror.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Richard Eaton's study of temple destruction argue?", "options": ["That thousands of temples were destroyed for purely religious reasons", "That about eighty cases are documented between 1192 and 1760, mainly targeting temples as symbols of rival kings' political power", "That no temples were ever destroyed", "That only Hindu kings destroyed temples"], "answerIndex": 1, "explanation": "Eaton's influential and controversial work emphasised the political meaning of temples.", "id": "q4"},
    {"type": "open", "prompt": "Was medieval India a 'dark age'? Use evidence from the chapter to argue a position.", "rubric": "A strong answer discusses regional kingdoms (Harsha, Palas, Pratiharas, Rashtrakutas, Rajputs), the Chola state, navy, and temples, temple economies and inscriptions, the Delhi Sultanate and Indo-Islamic culture, Vijayanagara and Hampi, Bhakti and Sufi devotion, and figures such as Kabir, Guru Nanak, and Amir Khusrau. It reaches a reasoned conclusion and explains why the 'dark age' label arose.", "id": "q5"},
    {"type": "open", "prompt": "Why is the history of medieval India so politically contested, and how have historians tried to tell it differently?", "rubric": "A strong answer explains James Mill's 1817 periodisation and its influence on colonial and nationalist histories; the contested memory of Somnath (Thapar); Eaton's work on temple desecration; the role of the past in modern disputes over places of worship; and historians' emphasis on dynasty, region, class, and exchange, Indo-Islamic culture, and alliances across religious lines (such as Vijayanagara's borrowing).", "id": "q6"}
  ]$delhi_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/asia/the-delhi-sultanate-and-medieval-india', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
