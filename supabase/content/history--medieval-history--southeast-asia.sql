-- Angkor, Srivijaya, and Medieval Southeast Asia — canonical master article, co-written and human-reviewed.
-- history/medieval-history/asia/angkor-srivijaya-and-medieval-southeast-asia @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Funan and the straits, Indianisation and localisation, Srivijaya and
-- Borobudur, Angkor and the lidar discoveries, Pagan, Dai Viet, Majapahit,
-- Theravada Buddhism and Islam, and Melaka.
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
    'history/medieval-history/asia/angkor-srivijaya-and-medieval-southeast-asia',
    'research',
    'advanced',
    'read',
    $sea_master$> **Southeast Asia**, the region between India and China, was long described as a cultural borrower, a place of "Indianised" or "Sinicised" states that took their religions and political ideas from their great neighbours. Historians now stress how Southeast Asian societies selected, adapted, and transformed those ideas to build states of their own: a maritime empire that controlled the busiest sea lane in Asia, the largest Buddhist monument in the world at Borobudur, and, at Angkor, the largest religious monument on Earth within a city that sprawled across at least a thousand square kilometres. This chapter covers Funan and the early trade, Srivijaya, Borobudur, the Khmer empire and Angkor, Pagan, Dai Viet, and Majapahit, the spread of Theravada Buddhism and Islam, and the rise of Melaka.

## Between India and China

Southeast Asia sits on the sea routes between the Indian Ocean and the South China Sea. Ships sailing between India and China had to pass through the narrow **Strait of Malacca** between the Malay Peninsula and Sumatra, or the Sunda Strait between Sumatra and Java, and wait in Southeast Asian ports for the monsoon winds to change. Those who controlled the straits and ports could grow rich on trade.

The earliest known state in the region, called **Funan** by the Chinese sources that are our main written evidence for it, flourished in the Mekong delta from around the first to the sixth century CE. Its port at **Oc Eo**, in modern Vietnam, has yielded Indian jewellery, Chinese bronzes, and a Roman gold medallion of the emperor Antoninus Pius, evidence of a trade network reaching from Rome to China.

From the early centuries CE, Southeast Asian rulers adopted Hindu and Buddhist religion, Sanskrit as a language of royal inscriptions, Indian scripts, and Indian ideas of kingship. In the 1940s the French scholar **George Coedès** described the region's early kingdoms as "Indianised states", implying a cultural colonisation from India. Later historians, notably **O. W. Wolters**, argued for "localisation": Southeast Asian elites actively chose and reshaped Indian ideas to fit local beliefs and needs, such as the idea of a ruler as a man of exceptional spiritual prowess, around whom followers gathered in shifting circles of power, a pattern for which Wolters adopted the Indian term **mandala**.

## Srivijaya: Lords of the Straits

From the seventh century, a maritime power based at **Palembang** in southern Sumatra, known as **Srivijaya**, came to dominate the Strait of Malacca and the trade between India and China from the late seventh century into the eleventh. Srivijaya was not a territorial empire in the usual sense but a network of ports and allied chiefs, held together by trade, tribute, and the ruler's prestige and wealth. It also became a major centre of Buddhist learning: the Chinese monk **Yijing** stopped there in 671 on his way to India and advised other Chinese pilgrims to study in Srivijaya before going on to India.

Srivijaya's power was broken in **1025**, when the Chola king Rajendra I of southern India sent a naval expedition that sacked its ports, as the chapter on the Delhi Sultanate and medieval India described. Its centre shifted to Jambi, and successor states in Sumatra lasted into the thirteenth century as trade patterns changed.

On the island of **Java**, the Sailendra dynasty built **Borobudur** around 800 CE, a colossal Buddhist monument in the form of a stepped mountain, covered with 2,672 relief panels depicting the Buddha's lives and teachings and crowned with stupas, the largest Buddhist monument in the world. Nearby, around the mid-ninth century, the great Hindu temple complex of **Prambanan** was built.

{{image: Borobudur | Borobudur in central Java, built around 800 CE, the largest Buddhist monument in the world.}}

```checkpoint
q: What did O. W. Wolters mean by "localisation"?
a*: That Southeast Asian elites actively selected and reshaped Indian ideas to fit local beliefs and needs, rather than simply receiving them.
a: That Southeast Asia rejected all Indian influence.
x: Southeast Asians adopted many Indian ideas; localisation describes how they adapted them.
a: That Indian rulers conquered and directly governed Southeast Asia.
x: There is little evidence of Indian conquest; the spread of ideas came through trade and choice.
a: That Southeast Asian states were all local villages with no wider contacts.
x: Southeast Asian states were deeply connected to India and China through trade.
hint: Compare it with Coedès's idea of "Indianised states".
why: Localisation restores Southeast Asian agency, treating borrowing as an active process of adaptation.
---
q: How did Srivijaya build its power?
a: By conquering all of India.
x: Srivijaya was a maritime power in Sumatra; it did not conquer India.
a: By building a large army of war elephants to rule the interior.
x: Its power was maritime, based on ports and trade, not on inland conquest.
a*: By controlling the ports and straits on the route between India and China, through a network of allied ports held together by trade and tribute.
a: By banning all foreign ships from the region.
x: Srivijaya depended on foreign trade, so it sought to attract and control shipping, not ban it.
hint: Think about the Strait of Malacca.
why: Control of the key sea lane between the Indian Ocean and China made Srivijaya rich and powerful for centuries.
```

## Angkor and the Khmer Empire

The greatest mainland power was the **Khmer** empire, centred in what is now Cambodia. In 802 its founder, **Jayavarman II**, held a ceremony on the Kulen hills proclaiming himself a universal monarch, independent of a power the inscriptions call "Java", probably the island of Java (the identification is debated). His successors built their capital at **Angkor**, near the great lake of the Tonle Sap.

Khmer kings built temple-mountains representing Mount Meru, the centre of the Hindu and Buddhist universe. The most famous, **Angkor Wat**, was built in the first half of the twelfth century by **Suryavarman II** and dedicated to the god Vishnu; it is the largest religious monument in the world by area, with galleries of reliefs depicting Hindu epics and the king's army. Later in the century, **Jayavarman VII** (reigned from 1181 to around 1218), a devout Mahayana Buddhist, rebuilt the capital as Angkor Thom, with the **Bayon** temple at its centre, its towers carved with enormous serene faces. His inscriptions record the construction of more than a hundred hospitals and of rest houses along roads.

Angkor was far larger than its stone temples. From the 1950s the French archaeologist Bernard-Philippe Groslier argued, most fully in 1979, that Angkor was a "**hydraulic city**", whose vast reservoirs, called *barays*, and canals irrigated rice fields to feed a huge population. Some scholars argued the reservoirs were mainly symbolic. In 2007 a mapping project using satellite and radar imagery and ground survey showed that Angkor was a low-density urban complex covering at least 1,000 square kilometres, one of the largest pre-industrial urban landscapes in the world, with a sophisticated system for managing water. Airborne **lidar** surveys led by Damian Evans in 2012 and 2015 then mapped the landscape beneath the forest in detail, revealing a grid of roads, canals, ponds, and house mounds.

**Zhou Daguan**, a member of a Chinese embassy from the Yuan court, stayed at Angkor in 1296–1297 and wrote an account describing the royal processions, markets run by women, Chinese traders, slaves, and daily life. It is the only detailed eyewitness account of life in Angkor to survive, though only in part, written while the city was still a flourishing capital.

Angkor declined in the fourteenth and fifteenth centuries. Traditional accounts blame attacks from the Thai kingdom of **Ayutthaya**, which sacked the city around 1431. Tree-ring studies have revealed a series of severe droughts alternating with intense monsoons in the fourteenth and fifteenth centuries that may have damaged the water system. The shift to Theravada Buddhism, which did not require huge royal temple-building, and the growth of maritime trade also drew the Khmer elite south toward the Mekong, near modern Phnom Penh. Angkor Wat itself was never fully abandoned and remained a Buddhist pilgrimage site.

{{image: Angkor Wat | Angkor Wat, built in the first half of the twelfth century by Suryavarman II, the largest religious monument in the world by area.}}

## Pagan, Dai Viet, and Majapahit

Other powerful states rose across the region:

- **Pagan** (Bagan), in Burma, was unified by King **Anawrahta** from 1044 and became a great Theravada Buddhist kingdom. Its kings and nobles built thousands of temples and stupas on the plain beside the Irrawaddy, of which more than 2,000 survive. Already weakened by tax-free donations of land to the Buddhist monkhood, Pagan collapsed after Mongol invasions in 1287.
- **Dai Viet**, in northern Vietnam, had been under Chinese rule for about a thousand years. In 938 the Vietnamese leader Ngo Quyen defeated a fleet of the southern Chinese kingdom of Southern Han on the Bach Dang River, winning independence. Dai Viet adopted Chinese-style government and Confucian examinations while fiercely resisting Chinese control. Its Tran dynasty repelled three Mongol invasions in the thirteenth century, including a famous victory in 1288, again on the Bach Dang, where Vietnamese forces planted iron-tipped stakes in the riverbed to trap the Mongol fleet at low tide. After a Ming Chinese occupation in the early fifteenth century, **Le Loi** drove the Chinese out in 1427 and took the throne in 1428.
- **Majapahit**, in eastern Java, founded in 1293 after defeating a Mongol expedition, became the most powerful state of the Indonesian archipelago in the fourteenth century under its chief minister **Gajah Mada**. A court poem of 1365, the *Nagarakretagama*, describes the kingdom and claims authority over much of maritime Southeast Asia; how far that claimed empire was real is debated.

## Theravada Buddhism, Islam, and Melaka

Two religious changes transformed Southeast Asia between the eleventh and fifteenth centuries. **Theravada** Buddhism, the tradition preserved in Sri Lanka, spread to Burma, Thailand, Cambodia, and Laos, where it became, and remains, the dominant religion, with monasteries at the heart of village life.

**Islam** spread through the maritime world of the archipelago, carried by Muslim merchants from Arabia, Persia, India, and China. One of the earliest known Muslim kingdoms was **Samudra Pasai** in northern Sumatra, whose first sultan died in 1297. In the fifteenth century, Islam spread rapidly through the ports, often adopted by rulers who saw advantages in joining the Muslim trading network.

The most important of these ports was **Melaka**, founded around 1400 by **Parameswara**, a prince from Palembang in Sumatra who had earlier ruled Singapura, on the strait that bears its name. Melaka's rulers converted to Islam, sought protection from Ming China, which Zheng He's fleets visited, as the chapter on Ming China describes, and built a cosmopolitan entrepôt where merchants from Gujarat, Tamil Nadu, Arabia, China, Java, and Ryukyu traded spices, textiles, and porcelain. A Portuguese apothecary and official, Tomé Pires, wrote that whoever was lord of Melaka had his hands on the throat of Venice. In 1511 the Portuguese captured Melaka, beginning a new era of European involvement in the region.

```checkpoint
q: What did remote sensing (satellite, radar, and lidar surveys) reveal about Angkor?
a: That Angkor was only a single temple complex with no surrounding city.
x: Remote sensing revealed the opposite: a vast urban landscape around the temples.
a*: A low-density urban complex of roads, canals, ponds, and houses covering at least 1,000 square kilometres, with a sophisticated water management system.
a: That Angkor was built by the Chinese.
x: Angkor was built by the Khmer; remote sensing mapped its landscape, not its builders' origins.
a: That Angkor was abandoned before Angkor Wat was built.
x: Angkor Wat was built in the twelfth century, at the height of the Khmer empire.
hint: Satellites, radar, and lidar can map what lies beneath the forest canopy.
why: Remote sensing transformed understanding of Angkor from a set of temples into one of the largest pre-industrial urban landscapes.
---
q: Why did Melaka become so important in the fifteenth century?
a: Because it was the capital of the Khmer empire.
x: Melaka was a port on the Malay Peninsula, not a Khmer capital.
a: Because it was the birthplace of Theravada Buddhism.
x: Theravada Buddhism developed in Sri Lanka; Melaka's rulers became Muslim.
a: Because it was founded by the Portuguese.
x: Melaka was founded around 1400 by Parameswara and captured by the Portuguese in 1511.
a*: Because it controlled the strait between the Indian Ocean and the South China Sea and became a cosmopolitan Muslim entrepôt for merchants from across Asia.
hint: Recall Tomé Pires's remark about Venice.
why: Melaka's position on the key sea lane made it the hub of Asian trade, which is why the Portuguese seized it.
```

## Further exploration

- **Victor Lieberman, *Strange Parallels: Southeast Asia in Global Context, c. 800–1830* (2 vols., 2003–2009).** A comparative history of Southeast Asia alongside Europe, China, Japan, and South Asia.
- **O. W. Wolters, *History, Culture, and Region in Southeast Asian Perspectives* (revised ed., 1999).** The classic statement of localisation.
- **Michael Coe and Damian Evans, *Angkor and the Khmer Civilization* (2nd ed., 2018).** Including the lidar discoveries.
- **Zhou Daguan, *A Record of Cambodia: The Land and Its People*, trans. Peter Harris (2007).** The eyewitness account of Angkor.
- **Anthony Reid, *A History of Southeast Asia: Critical Crossroads* (2015).** A wide-ranging history of the region.$sea_master$,
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
  select $sea_quiz$[
    {"type": "mcq", "prompt": "What is Borobudur?", "options": ["A Khmer palace", "A Vietnamese fortress", "A mosque in Melaka", "The largest Buddhist monument in the world, built in Java around 800 CE"], "answerIndex": 3, "explanation": "Built by the Sailendra dynasty, Borobudur is a stepped monument covered with 2,672 relief panels.", "id": "q1"},
    {"type": "mcq", "prompt": "Who described Angkor as an eyewitness in 1296–1297?", "options": ["Zhou Daguan", "Ibn Battuta", "Marco Polo", "Tomé Pires"], "answerIndex": 0, "explanation": "Zhou Daguan, a member of a Yuan embassy, wrote the only detailed eyewitness account of life in Angkor to survive.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Dai Viet defeat a Mongol fleet in 1288?", "options": ["With gunpowder cannon", "By planting iron-tipped stakes in the Bach Dang riverbed to trap the fleet at low tide", "By paying tribute", "With help from the Khmer"], "answerIndex": 1, "explanation": "The Tran dynasty repelled three Mongol invasions; the Bach Dang stakes echoed a victory of 938.", "id": "q3"},
    {"type": "mcq", "prompt": "Which state is generally regarded as one of the earliest Muslim kingdoms in Southeast Asia?", "options": ["Srivijaya", "Angkor", "Samudra Pasai in northern Sumatra", "Pagan"], "answerIndex": 2, "explanation": "Its first sultan died in 1297; Islam spread through the ports of the archipelago in the following centuries.", "id": "q4"},
    {"type": "open", "prompt": "Compare the 'Indianisation' and 'localisation' interpretations of early Southeast Asian states.", "rubric": "A strong answer explains Coedès's 'Indianised states' (adoption of Hindu and Buddhist religion, Sanskrit, scripts, kingship) and Wolters's localisation (active selection and adaptation by Southeast Asian elites, the mandala of shifting power around a ruler of spiritual prowess). It uses examples such as Funan, Srivijaya as a Buddhist centre, Borobudur, Jayavarman II's 802 ceremony, Angkor's temple-mountains, and later Theravada and Islam, and reaches a conclusion about agency.", "id": "q5"},
    {"type": "open", "prompt": "Why did Angkor decline in the fourteenth and fifteenth centuries? Evaluate the explanations.", "rubric": "A strong answer discusses attacks from Ayutthaya (traditionally around 1431), tree-ring evidence of severe droughts alternating with intense monsoons that may have damaged the water system mapped by remote sensing, the shift to Theravada Buddhism reducing royal temple-building, and the attraction of maritime trade drawing the elite toward the Mekong. It notes that Angkor Wat was never fully abandoned and weighs the factors.", "id": "q6"}
  ]$sea_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/asia/angkor-srivijaya-and-medieval-southeast-asia', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
