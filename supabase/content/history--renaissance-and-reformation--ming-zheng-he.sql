-- Ming China and the Voyages of Zheng He — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/ming-china-and-the-voyages-of-zheng-he @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The founding of the Ming, Yongle and Beijing, Zheng He's seven voyages
-- and the Galle inscription, why the voyages stopped, sea bans and
-- smugglers, silver and the Single Whip, the Great Wall, and the myth of
-- isolation.
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
    'history/renaissance-and-reformation/ming-china-and-the-voyages-of-zheng-he',
    'research',
    'advanced',
    'read',
    $ming_master$> **Ming China** (1368–1644) was the largest economy and one of the most powerful states in the world. Between 1405 and 1433 its admiral Zheng He led seven voyages of great "treasure fleets" across the Indian Ocean to Arabia and East Africa, decades before Portuguese ships rounded Africa. Then the voyages stopped, the government banned private maritime trade, and the Ming rebuilt the Great Wall. For a long time this was told as the story of a China that turned its back on the world. Historians now see a more complicated picture: a Ming economy that depended on silver from Japan and the Americas, coasts alive with smugglers, and a state that chose its priorities for its own reasons. This chapter covers the founding of the Ming, the Yongle emperor, Zheng He's voyages and why they ended, the sea bans, the Great Wall, the silver economy, and the myth of Ming isolation.

## The Founding of the Ming

The Mongol Yuan dynasty, weakened by epidemics, floods, famine, and factional conflict, collapsed in the mid-fourteenth century amid great rebellions, as the chapters on the Mongols and the Black Death described. From these emerged **Zhu Yuanzhang**, born into a poor peasant family, orphaned in 1344 when an epidemic, amid famine, killed his parents, who became a Buddhist monk and then a rebel commander. In 1368 he founded the **Ming** ("bright") dynasty, ruling as the **Hongwu emperor** (1368–1398), with his capital at Nanjing, and drove the Mongols back to the steppe.

Hongwu sought to rebuild an agrarian society of self-sufficient villages, distrusting merchants and the scholar-officials alike. He was a ferocious autocrat. In 1380 he accused his chief minister of treason, abolished the office of chancellor, and in this and later purges about 100,000 people, by common estimates, were executed or died. From then on, emperors governed directly through the six ministries, with the help of secretaries, and, increasingly, court **eunuchs**.

## The Yongle Emperor

After Hongwu's death, his son, the Prince of Yan, seized the throne from his nephew in a civil war and ruled as the **Yongle emperor** (1402–1424). Yongle was ambitious and energetic. He moved the capital to **Beijing**, his power base near the northern frontier, building the imperial palace known as the **Forbidden City** between 1406 and 1420. He sponsored the **Yongle Encyclopedia**, a vast compilation of Chinese knowledge in over 11,000 volumes. He led campaigns against the Mongols and invaded Vietnam. And he launched the great maritime expeditions.

## The Voyages of Zheng He

The commander of the voyages, **Zheng He** (1371–1433 or 1435), was a Muslim from Yunnan in the southwest, born Ma He. Captured as a boy when Ming armies conquered Yunnan, he was castrated and served in the household of the future Yongle emperor, rising to become one of his most trusted commanders.

Between 1405 and 1433, Zheng He led **seven voyages**. The first fleet reportedly comprised 317 ships carrying almost 28,000 men. The largest vessels, the "treasure ships", are described as enormous in later Chinese sources, a novel of 1597 and the official *History of Ming* compiled under the Qing; accounts from the voyages themselves give no dimensions, and claims that they were over 120 metres long are doubted by many historians and naval architects, who suggest they were smaller, but even on sceptical estimates they were very large ships for their time, far larger than the Portuguese caravels that would later sail the same ocean.

The fleets sailed to Champa (in modern Vietnam), Java, Sumatra, and Melaka; to Sri Lanka and the ports of southern India, especially **Calicut**; to Hormuz in the Persian Gulf, Aden, and, on the last voyage, members of the fleet reached Mecca; and to the East African coast, including Mogadishu and Malindi, as the chapter on the Swahili coast described. A stone tablet dated 1409 and set up at **Galle**, Sri Lanka, records offerings in three languages, **Chinese, Tamil, and Persian**, to the Buddha, to a Hindu god, and to Allah, reflecting the multi-religious world of the Indian Ocean and the fleet's diplomatic approach.

The voyages were not voyages of exploration in search of unknown lands; these were known routes, long used by Arab, Persian, Indian, and Chinese merchants. Their purposes were political and commercial: to display Ming power and wealth, to draw rulers into the **tribute system**, in which foreign states acknowledged the emperor's supremacy and received gifts and trading rights in return, to promote trade under state control, and, according to one rumour, to search for Yongle's overthrown nephew. The fleets were not purely peaceful: Zheng He's forces destroyed a pirate base at Palembang in 1407, and in 1411 they captured Alakeshvara, the ruler of Kotte in Sri Lanka, and brought him to China. Envoys from dozens of states came to the Ming court, bringing exotic gifts, including giraffes brought by envoys from Bengal and Malindi in 1414–1415, hailed at court as the mythical qilin.

{{image: Zheng He | A modern statue of Zheng He, the Ming admiral who led seven voyages across the Indian Ocean between 1405 and 1433.}}

```checkpoint
q: Why do historians avoid calling Zheng He's voyages "voyages of exploration"?
a*: Because the fleets followed known sea routes already used by Arab, Persian, Indian, and Chinese merchants, and their aims were political and commercial, not the discovery of unknown lands.
a: Because the voyages never left Chinese waters.
x: The fleets sailed as far as Arabia and East Africa.
a: Because Zheng He was not Chinese.
x: Zheng He was a Chinese Muslim from Yunnan serving the Ming emperor.
a: Because the voyages reached the Americas.
x: There is no credible evidence that Zheng He's fleets reached the Americas.
hint: Who had been sailing these routes for centuries?
why: The voyages projected Ming power along established Indian Ocean networks, rather than exploring the unknown.
---
q: What does the trilingual Galle inscription, dated 1409, reveal?
a: That the Ming fleet converted Sri Lanka to Islam.
x: The inscription records offerings to three religions, not conversion.
a: That Sri Lanka was a province of China.
x: Sri Lanka was not a Chinese province; the inscription is diplomatic.
a*: That the fleet made offerings to the Buddha, a Hindu god, and Allah in Chinese, Tamil, and Persian, reflecting the multi-religious Indian Ocean world and Ming diplomacy.
a: That Zheng He reached Europe.
x: The inscription is in Sri Lanka and concerns the Indian Ocean.
hint: Count the languages and religions.
why: The inscription shows the Ming adapting to a world of many faiths and languages, a pragmatic diplomacy.
```

## Why the Voyages Stopped

After Yongle's death in 1424, the voyages were halted, briefly revived for a final expedition in 1431–1433, and then ended for good. According to a later story, an official even destroyed the records of the voyages to prevent their revival. Why did the Ming abandon its navy at the height of its power?

Historians point to several reasons:

- **Cost.** Critics at court called the voyages wasteful, though several modern historians, such as Edward Dreyer, argue that they did not overburden the treasury.
- **The northern frontier.** The Mongol threat remained the Ming's greatest strategic concern. In 1449, at the **Tumu crisis**, the Mongols defeated a Ming army and captured the emperor himself. Resources and attention went north.
- **Court politics.** The voyages were led by eunuchs, and civil officials, rivals of the eunuchs at court, opposed eunuch power and expensive foreign ventures.
- **Internal transport.** With the capital in Beijing, the Grand Canal was rebuilt between 1411 and 1415, making it possible to supply the north by inland waterway rather than by sea.

The decision made sense for the Ming, whose main challenges were on land. It looks like a turning point mainly in hindsight, to historians who know that Portuguese ships would reach India some sixty-five years later. Popular claims, such as Gavin Menzies's book *1421* (2002), that Zheng He's fleets discovered America, have no credible evidence and are rejected by historians.

## Sea Bans, Smugglers, and Silver

From 1371 the Ming restricted maritime trade, under policies known as **haijin**, "sea bans", which forbade private overseas trade and allowed foreign trade only through official tribute missions. The bans aimed to control the coasts and prevent piracy, but they could not stop demand. Smuggling flourished, and in the sixteenth century, coastal raiders known as *wokou*, often called "Japanese pirates", though most were Chinese, ravaged the coast. In 1567 the Ming lifted the ban for Chinese merchants sailing from the Fujian port of Yuegang, legalising much of the trade.

Ming China's economy was booming. The population grew to perhaps 160–200 million by 1600; cities flourished; porcelain, silk, and tea were produced for domestic and foreign markets; and commercial culture produced great novels, such as *Journey to the West*. The economy came to run on **silver**. Through the sixteenth century local officials converted taxes and labour service into silver payments, and in 1580 the senior grand secretary Zhang Juzheng extended this **Single Whip** reform across the empire.

China did not produce enough silver itself. It came from **Japan**, whose mines boomed in the sixteenth century, and from the **Americas**. From 1565 the **Manila galleons**, sailing from **Manila** in the Philippines after the Spanish founded it in 1571, carried silver from Mexico across the Pacific to exchange for Chinese silk and porcelain brought by Chinese merchants. The historians Dennis Flynn and Arturo Giráldez have argued that world trade was "born" in 1571, when silver began to flow directly from the Americas to China. A large share of the silver mined in the Americas, by estimates ranging from a third to a half, ended up in China. The chapter on the Columbian exchange follows this silver from the mines of Potosí.

## The Great Wall

The **Great Wall** that visitors see today is largely a Ming creation. Earlier states and dynasties, from the seventh century BCE and the Qin onward, had built walls, mostly of rammed earth, along the northern frontier. The Ming, after the Tumu crisis and repeated Mongol raids, including one by Altan Khan that reached the outskirts of Beijing in 1550, built and rebuilt walls in brick and stone, with watchtowers and garrisons, especially in the sixteenth century. The wall reflects the Ming's central strategic priority: defending the north against the steppe.

## The Myth of Isolation

The image of a Ming China that closed itself off, stagnated, and fell behind a dynamic Europe was popular in nineteenth- and twentieth-century European writing, and it helped justify imperialism. Historians such as Timothy Brook, and those who have traced the global silver trade, have challenged it. Ming China was deeply connected to the world economy through silver, porcelain, and silk; its coasts and merchant communities, including Chinese diasporas in Southeast Asia, were outward-looking; and it welcomed foreign knowledge, as the Jesuit Matteo Ricci found in Beijing. What the Ming state restricted was not contact but unregulated contact.

The Ming fell in 1644. Climate cooling in the **Little Ice Age**, droughts and famines, the disruption of silver imports, fiscal crisis, and peasant rebellions combined. The rebel Li Zicheng captured Beijing, and the last Ming emperor hanged himself on a hill behind the Forbidden City. A Ming general then allowed the **Manchus**, from the northeast, through the Great Wall, and they founded the **Qing** dynasty, which ruled China until 1912.

```checkpoint
q: Which reason best explains why the Ming ended the treasure voyages?
a: Because Zheng He's fleets were destroyed by the Portuguese.
x: The Portuguese did not reach India until 1498, decades after the voyages ended.
a*: Because the voyages were criticised as expensive, the Mongol threat on the northern frontier demanded resources, and civil officials opposed eunuch-led ventures.
a: Because the Ming had no ships capable of long voyages.
x: The Ming built some of the largest ships of their age.
a: Because a treaty with Spain banned Chinese voyages.
x: There was no such treaty; Spain had no presence in Asia until the sixteenth century.
hint: Think about the Tumu crisis of 1449.
why: Strategic priorities on land, cost, and court politics made the voyages expendable for the Ming.
---
q: Why do historians reject the idea that Ming China was "isolated"?
a: Because the Ming conquered Europe.
x: The Ming never reached Europe militarily; the argument concerns economic and cultural connections.
a: Because the Ming never had any maritime restrictions.
x: The Ming did impose sea bans; the point is that they regulated rather than ended contact.
a: Because the Ming abolished the Great Wall.
x: The Ming rebuilt and extended the Great Wall.
a*: Because Ming China was deeply connected to the world economy through silver from Japan and the Americas, its exports of silk and porcelain, and Chinese merchant diasporas.
hint: Follow the silver.
why: Silver flows show China at the centre of the early global economy, contradicting the image of a closed China.
```

## Further exploration

- **Timothy Brook, *The Troubled Empire: China in the Yuan and Ming Dynasties* (2010).** A history of the Yuan and Ming, including climate and trade.
- **Edward L. Dreyer, *Zheng He: China and the Oceans in the Early Ming Dynasty, 1405–1433* (2007).** A scholarly study of the voyages.
- **Louise Levathes, *When China Ruled the Seas: The Treasure Fleet of the Dragon Throne, 1405–1433* (1994).** A popular account of the treasure fleets.
- **Timothy Brook, *The Confusions of Pleasure: Commerce and Culture in Ming China* (1998).** Ming commercial society.
- **Dennis O. Flynn and Arturo Giráldez, "Born with a 'Silver Spoon': The Origin of World Trade in 1571" (1995).** The argument for silver and the birth of global trade.$ming_master$,
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
  select $ming_quiz$[
    {"type": "mcq", "prompt": "Who was Zheng He?", "options": ["A Portuguese navigator", "The founder of the Ming dynasty", "A Muslim eunuch from Yunnan who commanded seven Ming voyages across the Indian Ocean", "A Japanese pirate"], "answerIndex": 2, "explanation": "Born Ma He, he served the Yongle emperor and led the treasure fleets between 1405 and 1433.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the Tumu crisis of 1449?", "options": ["A Mongol victory in which the Ming emperor was captured", "The burning of the treasure fleet", "The founding of Manila", "A Japanese invasion of China"], "answerIndex": 0, "explanation": "The crisis showed that the northern frontier was the Ming's greatest strategic concern.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did Ming China's demand for silver matter for world trade?", "options": ["Because China exported silver to Europe", "Because silver was banned in China", "Because China mined all the world's silver", "Because taxes were increasingly paid in silver, drawing silver from Japan and the Americas into China"], "answerIndex": 3, "explanation": "After 1571 Manila galleons carried American silver to exchange for Chinese goods, which some historians call the birth of world trade.", "id": "q3"},
    {"type": "mcq", "prompt": "Which claim about Zheng He do historians reject?", "options": ["That he reached East Africa", "That his fleets discovered America in 1421", "That he was a Muslim", "That his fleets visited Calicut"], "answerIndex": 1, "explanation": "Gavin Menzies's claim in 1421 has no credible evidence and is rejected by historians.", "id": "q4"},
    {"type": "open", "prompt": "Why did the Ming end the treasure voyages, and was this a mistake?", "rubric": "A strong answer explains cost (and the debate over it), the northern Mongol threat and the Tumu crisis, Confucian opposition to eunuch power, and the rebuilt Grand Canal after the move to Beijing; it argues that the decision made sense for the Ming's priorities and looks like a turning point mainly in hindsight, aware of the later Portuguese arrival. Better answers weigh the counterfactual carefully.", "id": "q5"},
    {"type": "open", "prompt": "Was Ming China 'isolated'? Use evidence from the chapter.", "rubric": "A strong answer discusses the sea bans and their limits (smuggling, wokou, the 1567 lifting at Yuegang), the silver economy and Single Whip reform, imports of Japanese and American silver via Manila, exports of silk and porcelain, Chinese diasporas, the Zheng He voyages, and openness to foreign knowledge (Ricci). It explains how the myth of isolation served later imperialism and reaches a reasoned conclusion.", "id": "q6"}
  ]$ming_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/ming-china-and-the-voyages-of-zheng-he', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
