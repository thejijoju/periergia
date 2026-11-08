-- European Expansion Overseas (Age of Exploration) — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/european-expansion-overseas-age-of-exploration @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Motives and borrowed technologies, Portugal in Africa (Benin, Kongo),
-- da Gama at Calicut, the Portuguese in the Indian Ocean and Asian and
-- Ottoman resistance, Columbus and Tordesillas, Magellan and Lapulapu, the
-- Spanish empire, and different outcomes by region.
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
    'history/renaissance-and-reformation/european-expansion-overseas-age-of-exploration',
    'research',
    'advanced',
    'read',
    $expansion_master$> **European expansion overseas** between about 1415 and 1600 took Portuguese and Spanish ships down the coast of Africa, around the Cape of Good Hope into the Indian Ocean, and across the Atlantic to the Americas, and in 1519–1522 around the world. It is often called the "Age of Discovery" or "Age of Exploration", but for the Africans, Indians, Malays, Chinese, and Indigenous Americans who met the newcomers, nothing was being discovered. This chapter examines the motives and technologies behind the voyages, the Portuguese route to India and how Indian Ocean powers responded, Columbus and the division of the world at Tordesillas, Magellan's circumnavigation and the Filipino resistance that killed him, the Spanish colonial system, and the very different outcomes of expansion in the Americas, Africa, and Asia.

## Motives and Means

Contemporaries summed up the motives as "God, gold, and glory". Iberian rulers and adventurers sought access to gold, spices, and other goods without going through Venetian and Muslim middlemen; to spread Christianity and fight Islam, continuing the crusading tradition of the Reconquista; and to win land, titles, and fame. Portugal, a small kingdom facing the Atlantic, with experienced fishermen and merchants and a monarchy keen for new revenue, led the way.

The ships and techniques Europeans used were largely borrowed or adapted from others. The **magnetic compass** came originally from China; the **lateen** triangular sail, which allowed ships to sail closer to the wind, was used by Arab and Mediterranean sailors; the **astrolabe**, used to measure latitude by the height of the sun or stars, had been refined by scholars in the Islamic world. Portuguese shipbuilders combined these in the **caravel**, a small, manoeuvrable ship. Sailors learned the *volta do mar*, the "turn of the sea", sailing far out into the Atlantic to catch winds that would carry them home.

## Portugal, Africa, and the Route to India

Portugal's expansion began in 1415 with the capture of **Ceuta**, a Muslim port in Morocco. Prince **Henry**, a son of the king, later called "the Navigator", sponsored voyages down the African coast and the settlement of Atlantic islands such as **Madeira**, where sugar plantations worked by enslaved people would become a model for the Americas, as the chapter on slavery described. (The story that Henry founded a school of navigation at Sagres is a later legend.) In 1434 Portuguese sailors passed Cape Bojador, long thought impassable. They traded for gold and enslaved people on the West African coast, and in 1482 built the fortress of **Elmina** in what is now Ghana.

African rulers dealt with the Portuguese on their own terms. In the kingdom of **Benin**, artists cast bronze plaques depicting Portuguese soldiers and merchants, with their beards, helmets, and guns, as foreign trading partners in the service of the *oba*. In **Kongo**, the king converted to Christianity, as the chapter on the Reformations described; but by 1526 King **Afonso I** wrote to the king of Portugal complaining that Portuguese traders were kidnapping his subjects, including nobles, and that "our country is being completely depopulated", a warning of what the Atlantic slave trade would become.

In 1488 **Bartolomeu Dias** rounded the southern tip of Africa, the Cape of Good Hope. In 1497–1499 **Vasco da Gama** sailed around the Cape and up the East African coast to Malindi, where he obtained a pilot who guided him across the Indian Ocean to **Calicut** on the southwest coast of India, which he reached in May 1498. The ruler of Calicut, the **Zamorin**, received him but was unimpressed by the gifts he offered, such as cloth, hats, and washbasins, goods of little value in one of the richest trading cities in the world. Indian Ocean merchants had been trading for centuries; what the Portuguese brought was not goods but guns.

## The Portuguese in the Indian Ocean

The Portuguese realised they could not compete with Asian merchants on equal terms. Instead, they used naval force to control trade. The viceroy **Afonso de Albuquerque** seized key ports: **Goa** in India in 1510, **Melaka** in 1511, and **Hormuz** at the entrance to the Persian Gulf in 1515. The Portuguese **Estado da Índia** tried to force Asian ships to buy passes, *cartazes*, and to pay customs at Portuguese forts, and attacked those that did not.

Asian powers resisted. In 1509 a combined fleet of the **Mamluk** sultanate of Egypt and the **Gujarati** sultanate was defeated by the Portuguese at **Diu**. The **Ottomans**, after conquering Egypt in 1517, sent fleets into the Indian Ocean, besieging Diu in 1538 and supporting the sultanate of **Aceh** in Sumatra with guns and gunners. The Ottoman admiral and cartographer **Piri Reis** produced a world map in 1513 that drew on Columbus's own lost chart.

The Portuguese never controlled the Indian Ocean. Their power rested on a chain of fortified trading posts; much trade simply bypassed them, and Asian merchants, Gujarati, Arab, Malay, and Chinese, continued to dominate commerce. In East Asia, the Portuguese depended entirely on local permission: they settled in **Macau** from 1557 with the consent of Ming officials, and traded at **Nagasaki** in Japan from 1571, where Japanese artists painted *namban* ("southern barbarian") screens showing the strange-looking newcomers.

```checkpoint
q: Why was the Zamorin of Calicut unimpressed by Vasco da Gama's gifts in 1498?
a*: Because the cloth, hats, and washbasins da Gama offered were of little value in one of the richest trading cities of the Indian Ocean.
a: Because he had never seen Europeans before and was afraid.
x: The issue was the value of the gifts in a rich trading city, not fear.
a: Because the gifts were stolen from Calicut.
x: The gifts came from Portugal; they were simply modest by Calicut's standards.
a: Because the Zamorin was a vassal of Portugal.
x: Calicut was an independent kingdom; the Portuguese were newcomers.
hint: Compare the wealth of Calicut and the gifts.
why: The episode shows how marginal Europe was in the rich Indian Ocean economy, and why the Portuguese turned to force.
---
q: What was the basis of Portuguese power in the Indian Ocean?
a: Control of all trade between Asia and Africa.
x: Much trade bypassed the Portuguese, and Asian merchants continued to dominate.
a: Conquest of the Mughal and Ming empires.
x: The Portuguese did not conquer either empire and in China depended on Ming permission.
a*: A chain of fortified ports, such as Goa, Melaka, and Hormuz, and naval force used to demand passes and customs from Asian ships.
a: A treaty with the Ottomans granting them a monopoly.
x: The Ottomans fought the Portuguese in the Indian Ocean.
hint: Think of Albuquerque's conquests and the cartaz.
why: The Portuguese built a maritime network of forts rather than a territorial empire, and their control was always partial.
```

## Columbus and Tordesillas

**Christopher Columbus**, a Genoese navigator, believed he could reach Asia by sailing west, underestimating the size of the Earth. (Educated Europeans already knew the Earth was round; what Columbus got wrong was its size.) After years of seeking sponsors, he was backed by **Queen Isabella and King Ferdinand** of Castile and Aragon, who in January 1492 had conquered Granada, the last Muslim kingdom in Spain, and in March expelled the Jews. On 12 October 1492 Columbus reached an island in the Bahamas, inhabited by the **Taíno**, and went on to Cuba and Hispaniola. He believed until his death that he had reached Asia.

To avoid conflict between Spain and Portugal, the pope proposed a line dividing the world, and in 1494 the two kingdoms agreed the **Treaty of Tordesillas**, assigning lands to the west of a line in the Atlantic to Spain and those to the east to Portugal. The line explains why Brazil, which Pedro Álvares Cabral reached in 1500, became Portuguese, and why Portuguese is spoken there today. The peoples of the lands being divided were, of course, not consulted.

## Magellan, Lapulapu, and the First Circumnavigation

In 1519 **Ferdinand Magellan**, a Portuguese navigator sailing for Spain, set out with five ships to reach the Spice Islands by sailing west. His fleet passed through the strait at the southern tip of South America that bears his name and crossed the Pacific, far wider than anyone in Europe had imagined, with terrible suffering from starvation and scurvy. In the Philippines, Magellan tried to force local rulers to accept Christianity and Spanish authority. In April 1521, at the battle of **Mactan**, he was killed by the forces of the chief **Lapulapu**, who is honoured today as a national hero in the Philippines. One ship, under **Juan Sebastián Elcano**, returned to Spain in 1522 with eighteen survivors of some 270 men, completing the first circumnavigation of the globe.

## The Spanish Empire

Spain built a vast land empire in the Americas, as the next chapter describes, after the conquests of the Aztec and Inca empires. It governed through **viceroyalties**, New Spain, centred on Mexico City, and Peru, centred on Lima, with royal officials, courts, and the Church, and regulated trade through the **Casa de Contratación** in Seville, founded in 1503. Colonists received grants of Indigenous labour, the **encomienda**. From 1571 Spain also ruled the **Philippines** from Manila, linking the Americas and Asia through the Manila galleons, as the chapter on Ming China described.

From 1600, new competitors joined: the English **East India Company** (1600) and the Dutch **VOC** (1602), whose story continues in the chapter on trading companies.

## Different Worlds, Different Outcomes

The consequences of European expansion varied enormously by region:

- **In the Americas**, conquest, epidemic disease, and colonisation led to demographic catastrophe and European rule, as the next chapter describes.
- **In Africa**, Europeans remained largely confined to coastal forts and trading posts for centuries, dependent on African rulers and merchants, while the Atlantic slave trade grew into a catastrophe for many African societies.
- **In Asia**, the great empires, Ming and Qing China, Mughal India, Safavid Iran, Tokugawa Japan, and the Ottomans, dealt with Europeans largely on their own terms until the eighteenth century and later. Europeans were one group of merchants and soldiers among many.

Why the difference? Historians point to disease, which devastated the Americas but not Afro-Eurasia, whose populations shared the same diseases; to the size and military power of the Asian empires; and to geography and the tropical diseases, such as malaria, that killed Europeans in Africa. These differences would shape the world for centuries.

```checkpoint
q: Why did Brazil become Portuguese-speaking?
a: Because the Portuguese conquered it from Spain.
x: Brazil was never Spanish; it fell on Portugal's side of a dividing line.
a*: Because under the Treaty of Tordesillas (1494) the lands east of a line in the Atlantic were assigned to Portugal, and the line ran through eastern South America.
a: Because Columbus landed there in 1492.
x: Columbus reached the Caribbean, not Brazil; Cabral reached Brazil in 1500.
a: Because the Indigenous peoples chose Portugal as their ruler.
x: The peoples of Brazil were not consulted about the treaty.
hint: Recall the line drawn in 1494.
why: A treaty between two European crowns, ignoring the inhabitants, shaped the language map of South America.
---
q: Why did European expansion have such different outcomes in the Americas and in Asia?
a: Because Asian peoples welcomed European rule.
x: Asian empires generally kept Europeans in a subordinate position as traders.
a: Because Europeans never reached Asia.
x: Europeans reached India in 1498 and China and Japan in the sixteenth century.
a: Because the Americas had no states.
x: The Americas had large states, such as the Aztec and Inca empires.
a*: Because disease devastated the Americas while Afro-Eurasian populations shared the same diseases, and the great Asian empires were large and militarily powerful.
hint: Think about immunity and imperial power.
why: Disease and the strength of Asian empires explain why Europeans conquered the Americas but traded on others' terms in Asia for centuries.
```

## Further exploration

- **Sanjay Subrahmanyam, *The Portuguese Empire in Asia, 1500–1700* (2nd ed., 2012).** The Portuguese in Asia seen in an Asian context.
- **Giancarlo Casale, *The Ottoman Age of Exploration* (2010).** The Ottomans in the Indian Ocean.
- **Felipe Fernández-Armesto, *Pathfinders: A Global History of Exploration* (2006).** Exploration by many peoples.
- **Laurence Bergreen, *Over the Edge of the World* (2003).** Magellan's voyage.
- **J. H. Elliott, *Empires of the Atlantic World: Britain and Spain in America, 1492–1830* (2006).** A comparison of the Spanish and British empires.$expansion_master$,
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
  select $expansion_quiz$[
    {"type": "mcq", "prompt": "Which of these technologies used by Iberian sailors originated outside Europe?", "options": ["The magnetic compass, from China", "Gunpowder cannon, from Portugal", "The caravel's hull, from England", "The printing press, from Spain"], "answerIndex": 0, "explanation": "The compass came from China, and the lateen sail and astrolabe were developed in the Arab and Islamic world.", "id": "q1"},
    {"type": "mcq", "prompt": "What did King Afonso I of Kongo complain of in 1526?", "options": ["That the Portuguese refused to trade", "That the Ottomans had invaded", "That the pope had excommunicated him", "That Portuguese traders were kidnapping his subjects and depopulating his country"], "answerIndex": 3, "explanation": "His letters to the king of Portugal warned of the devastation the slave trade was bringing.", "id": "q2"},
    {"type": "mcq", "prompt": "Who killed Ferdinand Magellan at Mactan in 1521?", "options": ["Portuguese soldiers", "Malay pirates", "The forces of the Filipino chief Lapulapu", "Chinese sailors"], "answerIndex": 2, "explanation": "Lapulapu is honoured as a national hero in the Philippines; Elcano completed the circumnavigation.", "id": "q3"},
    {"type": "mcq", "prompt": "Which power sent fleets into the Indian Ocean to oppose the Portuguese, including besieging Diu in 1538?", "options": ["The Ming dynasty", "The Ottoman empire", "The Aztec empire", "The Holy Roman Empire"], "answerIndex": 1, "explanation": "After conquering Egypt in 1517, the Ottomans contested the Indian Ocean and supported Aceh.", "id": "q4"},
    {"type": "open", "prompt": "Tell the story of Vasco da Gama's arrival in India from the perspective of Calicut and the Indian Ocean world.", "rubric": "A strong answer explains the long-established Indian Ocean trading world (Arab, Gujarati, Malay, Chinese, Swahili merchants), the Zamorin's unimpressed reaction to modest gifts, the Portuguese turn to force (cartazes, forts at Goa, Melaka, Hormuz), Asian resistance (Diu 1509, Ottoman fleets, Aceh), and the limits of Portuguese control. It contrasts this with the European narrative of 'discovery'.", "id": "q5"},
    {"type": "open", "prompt": "Why did European expansion lead to conquest in the Americas but mainly trade in Asia and coastal posts in Africa before 1700?", "rubric": "A strong answer explains disease (catastrophic in the Americas, shared across Afro-Eurasia), the size and power of Asian empires (Ming, Mughals, Safavids, Ottomans, Tokugawa), the dependence on African rulers and merchants on the coast, malaria and tropical disease, and the role of Indigenous allies in the Americas. It uses examples such as Macau, Nagasaki, Elmina, and Benin's bronze plaques.", "id": "q6"}
  ]$expansion_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/european-expansion-overseas-age-of-exploration', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
