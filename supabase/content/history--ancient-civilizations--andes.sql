-- The First Civilizations of the Andes — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/the-first-civilizations-of-the-andes @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The vertical archipelago, Caral and Norte Chico, Chavín, Paracas and
-- Nazca (including the 2024 AI-found geoglyphs), the Moche and Sipán,
-- Tiwanaku and Wari, and the khipu.
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
    'history/ancient-civilizations/the-first-civilizations-of-the-andes',
    'research',
    'advanced',
    'read',
    $andes_master$> **The Andes** of western South America saw one of the world's handful of independent paths to civilization. Monumental cities rose on the coast of Peru around 3000 BCE, as early as the pyramids of Egypt, and for four thousand years a succession of societies, Caral, Chavín, Paracas, Nazca, Moche, Tiwanaku, and Wari, built temples, cities, and states in one of the most extreme environments on Earth, culminating in the Inca empire. They did so without large draught animals, without wheeled transport, without markets in the usual sense, and without writing as other civilizations knew it. This chapter asks how, and what the Andean case shows about the assumptions built into the idea of "civilization" itself.

## A Vertical World

The central Andes compress extraordinary environmental contrasts into a short distance. Along the Pacific coast of Peru lies one of the driest deserts on Earth, where rain may not fall for years. Cutting across it are about fifty short rivers running down from the mountains, creating narrow green oases. Offshore, the cold Humboldt Current produces one of the richest fisheries in the world, full of anchovies and sardines. Inland, the land rises steeply through valleys to high plateaus, the *puna*, above 4,000 metres, too cold for most crops but good for grazing, and then falls away eastward into the forests of the Amazon basin.

Andean peoples turned this vertical landscape into an advantage. The anthropologist John Murra described a pattern he called the **"vertical archipelago"**: communities controlled land at several altitudes, growing maize in warm valleys, potatoes and quinoa higher up, and herding llamas and alpacas on the puna, exchanging products between zones through kinship and obligation rather than markets.

Andean farmers domesticated a distinctive set of plants and animals: the potato, in hundreds of varieties; quinoa; the llama, used as a pack animal and for meat and wool; the alpaca, for fine wool; the guinea pig; and cotton, grown on the coast for textiles and fishing nets. They developed **freeze-drying**: by leaving potatoes out to freeze at night and thaw and be trampled by day, they produced *chuño*, which could be stored for years. They built agricultural terraces on mountainsides and, around Lake Titicaca, raised fields that used water channels to protect crops from frost.

```checkpoint
q: What did John Murra mean by the "vertical archipelago"?
a*: A pattern in which communities controlled land at several altitudes, each with different resources, and exchanged products between zones.
a: A chain of islands off the Peruvian coast controlled by Andean states.
x: The archipelago is a metaphor. It refers to zones at different altitudes on land, not literal islands.
a: A system of tall stone towers used for defence.
x: The concept concerns land use and exchange across altitudes, not architecture.
a: A trade route linking the Andes to Mesoamerica.
x: Murra's concept describes exchange within the Andean landscape, not long-distance trade to Mexico.
hint: Think of altitude zones as islands of different resources.
why: Controlling several ecological zones allowed Andean communities to secure a varied supply of food and materials without relying on markets.
---
q: Why was chuño important in the Andes?
a: Because it was a sacred drink used only in rituals.
x: Chuño is a food, freeze-dried potato, not a drink.
a: Because it was used as currency in markets.
x: Andean economies relied mainly on exchange through kinship and obligation rather than markets with currency.
a*: Because freeze-dried potatoes could be stored for years, protecting communities against bad harvests and supplying armies and workers.
a: Because it could only be grown on the coast.
x: Chuño is made in the cold highlands, where nights freeze; it depends on high altitude.
hint: Think about storage in a harsh, unpredictable environment.
why: Long-term food storage was essential in a high-risk environment, and stored chuño later supported Inca armies and labour projects.
```

## Caral and the First Cities

In the Supe valley, about 180 kilometres north of Lima, lies **Caral**, excavated since 1994 by the Peruvian archaeologist **Ruth Shady**. Radiocarbon dates show that its monumental core was built from around 2600 BCE, and nearby sites in the region known as Norte Chico, such as Áspero and Sechín Bajo, are older still, with monumental construction around 3000 BCE or earlier. Caral had six large platform mounds, sunken circular plazas, and residential areas for different social groups. The builders used *shicras*, mesh bags of stones, as fill, which may have helped the structures withstand earthquakes.

Two features of the Norte Chico sites surprised archaeologists. First, they are **preceramic**: they were built before pottery was used in the region, overturning the assumption that pottery comes before cities. Second, their economy seems to have combined irrigation farming inland, especially of cotton, squash, and beans, with fishing on the coast. The archaeologist Michael Moseley proposed in 1975 that Andean civilization had **maritime foundations**, with anchovies and other fish providing the protein and cotton nets the means to catch them. The theory is debated, but the link between coastal fishing and inland farming is well supported. Caral was made a UNESCO World Heritage Site in 2009, and it is now recognised as one of the oldest urban centres in the Americas, contemporary with early Mesopotamian and Egyptian civilization.

## Chavín: A Shared Religion

From around 900 BCE, a religious centre at **Chavín de Huántar**, in the northern highlands, spread its distinctive art style across much of Peru, in a period archaeologists call the Early Horizon. Chavín's temple was honeycombed with dark underground galleries. At the centre of one stands the **Lanzón**, a granite carving of a fanged deity nearly five metres tall, reachable only through narrow passages. Archaeologists have found conch-shell trumpets and studied the acoustics of the galleries, which channelled sound and light in disorienting ways. Carvings show figures transforming into jaguars and holding the San Pedro cactus, a source of the hallucinogen mescaline, suggesting that ritual involved altered states of consciousness.

The spread of Chavín style across the Andes is usually interpreted as the expansion of a religious cult and pilgrimage network rather than a political empire. It shows that shared religious ideas could unite a large region before any state did.

## Paracas, Nazca, and the Lines

On the south coast of Peru, the **Paracas** culture (around 800 BCE–100 CE) is known for spectacular textiles, wrapped in layers around the dead in desert tombs and preserved by the dry climate. Some of the deceased had their skulls deliberately elongated by binding in infancy, a practice found in several Andean cultures.

Its successor, the **Nazca** culture (around 100 BCE–700 CE), is famous for the **Nazca lines**: enormous figures and lines made by removing the dark surface stones of the desert to expose lighter ground beneath. They include straight lines many kilometres long, geometric shapes, and figures of animals and plants, such as a hummingbird, a monkey, and a spider, some of them large enough to be appreciated fully only from the air. The German mathematician Maria Reiche studied and protected them for decades from the 1940s. In 2024 a team led by Masato Sakai of Yamagata University, working with IBM, used artificial intelligence to identify candidate sites and then confirmed 303 new figurative geoglyphs in the field, nearly doubling the number known.

Why the Nazca made them is debated. Interpretations include astronomical alignments, ritual pathways walked by processions, offerings to gods associated with water and fertility, and markers of social groups. Water was a constant concern: the Nazca also built *puquios*, spiral-shaped wells and underground channels that tapped groundwater, some of which are still in use. Claims that the lines were made by or for extraterrestrials have no basis and reflect a long habit of refusing to credit Indigenous peoples with their own achievements.

{{image: Nazca lines | The hummingbird geoglyph on the Nazca desert in Peru, made by removing dark surface stones to expose the lighter ground below.}}

```checkpoint
q: What made the Norte Chico sites such as Caral surprising to archaeologists?
a: They were built by Spanish settlers.
x: Caral is about 4,500 years old, thousands of years before the Spanish arrived.
a*: They are monumental urban centres from around 3000–2600 BCE, built before pottery was used in the region, contemporary with early Egypt and Mesopotamia.
a: They contain the earliest known writing in the Americas.
x: No writing has been found at Caral. The surprise concerns their age and preceramic character.
a: They show that the Andes had no farming before the Inca.
x: Norte Chico relied on irrigated farming of cotton, squash, and beans, combined with fishing.
hint: Consider both the dates and the absence of pottery.
why: Caral and its neighbours showed that monumental urban life arose very early in the Andes, before pottery, overturning assumptions about the order of developments.
---
q: Why do archaeologists reject the claim that the Nazca lines were made by or for extraterrestrials?
a: Because the lines were made in the twentieth century.
x: The lines date from the Nazca period, roughly 100 BCE–700 CE.
a: Because they cannot be seen from the air.
x: Some figures are best seen from the air, which is precisely why such claims arose. The figures can, however, be made with simple surveying techniques.
a: Because the lines were made by Inca engineers.
x: The Nazca culture predates the Inca by more than a thousand years.
a*: Because the lines can be explained by the Nazca's own techniques, culture, and concerns, and the extraterrestrial claim reflects a refusal to credit Indigenous peoples with their achievements.
hint: Who had the means and motives to make the lines?
why: The lines fit Nazca technology, art, and ritual concerns such as water. "Ancient alien" claims are a recurring pattern of denying non-European peoples their own history.
```

## The Moche: Lords of the North Coast

On the north coast of Peru, the **Moche** (around 100–800 CE) built large adobe pyramids, such as the Huaca del Sol and Huaca de la Luna near modern Trujillo, and irrigation systems that turned desert valleys into farmland. They are best known for their ceramics: realistic portrait vessels of individuals, vessels showing daily life, animals, illness, and sexual acts, and painted scenes of warfare, ritual, and myth.

Some painted scenes show a "sacrifice ceremony", in which captured warriors are killed and their blood offered in a goblet to elaborately dressed figures. Scholars long debated whether these scenes depicted real rituals or myths. In 1987 the Peruvian archaeologist **Walter Alva** excavated an unlooted royal tomb at **Sipán**, containing a ruler, now known as the Lord of Sipán, buried with gold, silver, and turquoise ornaments matching those worn by a figure in the sacrifice scenes. Later finds at San José de Moro included burials of women dressed as a priestess figure from the same scenes. The art showed real ceremonies, performed by real people. In 2005 archaeologists at El Brujo found the tattooed mummy of a high-status woman, the **Señora de Cao**, buried with war clubs and other symbols of power, suggesting that Moche women could hold political authority.

The Moche suffered from severe climate disruptions, including the **El Niño** events that periodically bring torrential rain and floods to the desert coast and collapse the fisheries, as well as periods of drought. These pressures probably contributed to political changes and decline around 600–800 CE.

```checkpoint
q: How did the excavation of the Lord of Sipán's tomb change interpretations of Moche art?
a: It showed that Moche art depicted only myths with no basis in reality.
x: The tomb showed the opposite: a real ruler buried with the regalia shown in the sacrifice scenes.
a: It proved the Moche were part of the Inca empire.
x: The Moche flourished centuries before the Inca.
a*: It revealed a real ruler buried with regalia matching a figure in the "sacrifice ceremony" scenes, showing that the art depicted actual rituals.
a: It showed that the Moche had no social hierarchy.
x: The rich tomb is strong evidence of social hierarchy.
hint: Compare the objects in the tomb with the figures in the paintings.
why: Matching excavated regalia to painted scenes allowed archaeologists to show that Moche art recorded real ceremonies and roles.
---
q: How did El Niño events affect societies like the Moche?
a*: They brought torrential rains and floods to the desert coast and collapsed the fisheries, disrupting farming, food supply, and political stability.
a: They brought reliable, gentle rains that improved farming.
x: El Niño brings extreme, destructive rain to the desert coast and damages the fisheries.
a: They had no effect, because the Moche lived in the mountains.
x: The Moche lived on the north coast, which is directly exposed to El Niño.
a: They caused volcanic eruptions that destroyed Moche cities.
x: El Niño is a climatic phenomenon involving ocean temperatures and rainfall, not volcanoes.
hint: El Niño warms the Pacific off Peru.
why: Severe climate shocks strained Moche irrigation and food supplies, contributing to political change and decline.
```

## Tiwanaku and Wari: The First Highland States

Between about 500 and 1000 CE, two large states arose in the highlands, often seen as predecessors of the Inca.

**Tiwanaku**, near the southern shore of Lake Titicaca in modern Bolivia, at about 3,800 metres above sea level, became a major ceremonial and urban centre with monumental stone architecture, such as the Akapana platform and the Gateway of the Sun, carved with a staff-holding deity. Its people farmed using **raised fields**, platforms of earth surrounded by water channels that stored the sun's heat and protected crops from frost. Experiments in the 1980s showed that such fields could produce very high yields. Tiwanaku's influence spread through colonies in lower valleys and through caravans of llamas carrying goods across the region.

**Wari**, centred near Ayacucho in Peru, built a more clearly expansionist state, with planned administrative centres such as Pikillacta near Cuzco, linked by roads. Many archaeologists see Wari as the first Andean empire and as a model for Inca administration. Wari officials used **khipus**, knotted cords for record-keeping, centuries before the Inca. Both Tiwanaku and Wari declined around 1000 CE, a period that coincided with a long drought in the region.

## Records Without Writing: The Khipu

The Andes are the only region where a large state, the Inca empire, was administered without writing as it is usually understood. Instead, Andean peoples used **khipus**: arrangements of knotted cords, usually of cotton or camelid fibre, hanging from a main cord. About a thousand survive, mostly from the Inca period.

In the early twentieth century, the American scholar Leland Locke showed that many khipus record numbers in a **decimal positional system**: the position of a knot cluster on a cord indicated units, tens, hundreds, and so on, and different types of knots represented different digits. Spanish chroniclers described specialists called *khipukamayuq* who used khipus to record census figures, tribute, labour obligations, and stores. In 2018 a study by Manuel Medrano and Gary Urton matched a group of colonial-era khipus to a Spanish census record of the same village, confirming in detail how they encoded population data.

Whether khipus also recorded language, such as names, histories, or narratives, is one of the great open questions of Andean studies. Spanish sources claimed that khipukamayuq could recite histories from them, and features such as colour, fibre type, and knot direction may have carried meaning beyond numbers. In 2017 the anthropologist Sabine Hyland studied two khipus held by a village in highland Peru, which villagers said recorded letters, and proposed that some of their features might represent sounds. If khipus did encode language, the Andes would have had a writing system unlike any other, made of thread rather than marks on a surface. The question remains unresolved, and it challenges the narrow definition of writing in Childe's list of the features of civilization.

{{image: Quipu | An Inca khipu, a set of knotted cords used to record numbers and possibly other information. Many khipus use a decimal positional system.}}

```checkpoint
q: What did Leland Locke demonstrate about khipus?
a: That they recorded the Quechua language phonetically.
x: Whether khipus recorded language is still unresolved. Locke's demonstration concerned numbers.
a: That they were purely decorative objects.
x: Locke showed that khipus carried systematic numerical information.
a: That they were invented by the Spanish after the conquest.
x: Khipus were used by the Inca and earlier by Wari, long before the Spanish arrived.
a*: That many khipus record numbers in a decimal positional system, with knot position indicating units, tens, hundreds, and so on.
hint: Think about place value.
why: Locke showed that khipus were a sophisticated numerical recording system, used for administration such as census and tribute.
---
q: Why does the khipu challenge narrow definitions of "civilization"?
a: Because it proves that the Andes had an alphabet.
x: Khipus are not an alphabet, and whether they recorded language at all is still debated.
a*: Because a large state was administered with knotted cords rather than writing as usually defined, which questions treating writing as a requirement for civilization.
a: Because khipus were used only by farmers, not by states.
x: Khipus were central to state administration, used by specialists to record census, tribute, and stores.
a: Because khipus were found only in Mesoamerica.
x: Khipus are Andean; they are not known from Mesoamerica.
hint: Recall Childe's list of the features of civilization.
why: The Andes show that complex states could keep detailed records by other means, which suggests that the definition of civilization should focus on what records do rather than their form.
```

## Toward the Inca

By around 1400 CE, the Andes had seen four thousand years of urban and state-building traditions: monumental architecture, shared religious centres, irrigation and terracing, colonies at different altitudes, roads, administrative centres, labour obligations, and khipu records. The Inca, whose empire is the subject of a later chapter, did not invent these institutions. They inherited them and combined them on a scale never seen before, building the largest state in the Americas in less than a century before the Spanish conquest.

The Andean case shows that there is more than one way to build a civilization. It did without wheels, iron tools, large draught animals, markets, and conventional writing, and it built some of the most impressive engineering in the ancient world. Measuring it against a checklist drawn from Mesopotamia or Egypt says more about the checklist than about the Andes.

## Further exploration

- **Michael E. Moseley, *The Incas and Their Ancestors: The Archaeology of Peru* (revised ed., 2001).** The standard archaeological survey of the Andes before and including the Inca.
- **Jerry D. Moore, *A Prehistory of South America* (2014).** A wide-ranging, readable introduction.
- **Gary Urton, *Signs of the Inka Khipu* (2003).** A key study of the khipu and the question of whether it recorded language.
- **Richard L. Burger, *Chavín and the Origins of Andean Civilization* (1992).** The classic study of Chavín.
- **Charles C. Mann, *1491: New Revelations of the Americas Before Columbus* (2005).** A popular synthesis of research on the pre-Columbian Americas.$andes_master$,
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
  select $andes_quiz$[
    {"type": "mcq", "prompt": "Which of the following did Andean civilizations do without?", "options": ["Monumental architecture", "Irrigation and terracing", "Wheeled transport and large draught animals", "Large states"], "answerIndex": 2, "explanation": "Andean societies built cities, terraces, roads, and the largest state in the Americas without wheels for transport or large draught animals such as oxen or horses.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Michael Moseley's 'maritime foundations' hypothesis propose?", "options": ["That Andean civilization began with traders from Asia", "That rich coastal fisheries, combined with cotton for nets, helped support the first Andean monumental centres", "That the Inca were seafarers", "That Caral was built by fishermen from Mesoamerica"], "answerIndex": 1, "explanation": "Moseley argued that anchovies and other marine resources, caught with cotton nets, underpinned early coastal centres such as those of Norte Chico.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the 2024 AI-assisted survey of the Nazca region achieve?", "options": ["It deciphered the khipu", "It confirmed 303 new figurative geoglyphs, nearly doubling the number known", "It dated Caral to 5000 BCE", "It found the tomb of the Lord of Sipán"], "answerIndex": 1, "explanation": "A team led by Masato Sakai used AI to identify candidate sites and confirmed 303 new figurative geoglyphs in the field.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the main unresolved question about khipus?", "options": ["Whether they recorded numbers", "Whether they were used by the Inca", "Whether they also encoded language, such as names and narratives", "Whether they were made of thread"], "answerIndex": 2, "explanation": "The numerical system is well understood; whether khipus also recorded language remains open, with studies such as Hyland's suggesting phonetic elements.", "id": "q4"},
    {"type": "open", "prompt": "Using the Andes as your main example, assess whether writing should be treated as a defining feature of civilization.", "rubric": "A strong answer explains Childe's list and the role of writing in it, then uses Andean evidence: Caral's monumental urbanism around 3000–2600 BCE, the Chavín religious network, Moche states, Tiwanaku and Wari as highland states, Wari and Inca khipus as administrative records (Locke's decimal system; Medrano and Urton matching khipus to a census), and the open question of linguistic khipus. It reaches a reasoned conclusion, for example that what matters is the ability to record and administer, not the particular form of marks on a surface.", "id": "q5"},
    {"type": "open", "prompt": "How does the Moche case illustrate the value of combining art, archaeology, and environmental evidence?", "rubric": "A strong answer explains how Moche ceramics depicted a 'sacrifice ceremony', how the excavation of the Lord of Sipán (1987) and the priestess burials at San José de Moro showed the scenes depicted real rituals and roles, and how the Señora de Cao suggests female political authority. It then explains how environmental evidence of El Niño floods and droughts helps explain Moche political change and decline around 600–800 CE. Better answers draw the general lesson about corroborating different kinds of evidence.", "id": "q6"}
  ]$andes_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/the-first-civilizations-of-the-andes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
