-- Mesoamerican Cultures: Olmec, Maya, and Teotihuacan — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/mesoamerican-cultures-olmec-maya-and-teotihuacan @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The shared Mesoamerican world (maize and nixtamalization, calendars,
-- ballgame, sacrifice), the Olmec, Teotihuacan, the Classic Maya, the
-- decipherment of Maya writing, and the Classic Maya collapse.
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
    'history/ancient-civilizations/mesoamerican-cultures-olmec-maya-and-teotihuacan',
    'research',
    'advanced',
    'read',
    $mesoam_master$> **Mesoamerica** is the cultural region stretching from central Mexico through Guatemala and Belize into parts of Honduras and El Salvador. Between about 1500 BCE and 900 CE, without contact with the Old World, its peoples built cities, calendars, writing, and states. This chapter covers the Olmec, often called the region's "mother culture"; the great planned metropolis of Teotihuacan; and the Maya, whose script is the only fully developed writing system of the pre-Columbian Americas to have been substantially deciphered. It ends with the "collapse" of the Classic Maya cities, which was real, dramatic, and much less final than the word suggests, since millions of Maya people live in the region today.

## A Shared World

Mesoamerica was never a single state. It was a region of many peoples speaking many languages, from the Maya languages in the east to Zapotec, Mixtec, and Nahuatl further west, who shared a set of practices and ideas over more than two thousand years.

At the base was **maize**, domesticated from the wild grass teosinte in southwest Mexico about 9,000 years ago, as the Neolithic chapter described, together with beans and squash, a combination that is nutritionally complementary and agriculturally efficient. Mesoamericans also developed **nixtamalization**, cooking maize with lime or wood ash. This makes the niacin in maize available to the body and improves its protein, preventing the deficiency disease pellagra. When maize spread to Europe and Africa without nixtamalization, pellagra followed.

Other shared features include:

- **Two interlocking calendars**: a 260-day ritual calendar, made of 20 named days combined with numbers from 1 to 13, and a 365-day solar calendar of 18 months of 20 days plus 5 extra days considered unlucky. The two cycles coincide every 52 years, a period known as the **Calendar Round**, which had great ritual significance.
- **The ballgame**, played on I-shaped courts with a heavy solid rubber ball that players struck with their hips. Rubber balls from the site of El Manatí, in the Olmec region, date to around 1600 BCE. The game had religious meaning, and in some contexts losers, or captives, were sacrificed.
- **Pyramids** and plazas as the centres of cities, built as platforms for temples.
- **Bloodletting and sacrifice**: rulers and nobles drew their own blood as an offering to the gods, and captives were sacrificed. A famous carved lintel from the Maya city of Yaxchilan, dated to 709 CE, shows Lady K'abal Xook pulling a thorn-studded rope through her tongue before her husband, the king.
- **Writing and calendrical inscriptions**, developing from the first millennium BCE.

```checkpoint
q: Why was nixtamalization so important?
a*: Because cooking maize with lime or ash released its niacin and improved its protein, preventing pellagra in populations that relied on maize.
a: Because it made maize grow faster in the fields.
x: Nixtamalization is a way of preparing harvested maize, not a farming technique.
a: Because it turned maize into an alcoholic drink.
x: The process involves cooking maize with an alkali; it is about nutrition, not fermentation.
a: Because it was a ritual performed only by priests.
x: Nixtamalization was an everyday household food-preparation technique.
hint: What happened when maize spread to Europe without this technique?
why: The technique made maize a complete staple. Where maize was adopted without it, diet-related disease followed.
---
q: What is the Calendar Round?
a: A stone wheel used to grind maize.
x: The Calendar Round is a period of time, not an object.
a: The 365-day solar year.
x: The 365-day calendar is one of the two cycles that make up the Calendar Round.
a*: The 52-year period after which the 260-day ritual calendar and the 365-day solar calendar return to the same combination.
a: The period between eclipses.
x: Eclipse cycles were also tracked, but the Calendar Round is the meshing of the two calendars.
hint: Think of two gears turning together.
why: Because 260 and 365 share a common multiple at 52 years, any combination of dates recurs only after that period, which gave the 52-year cycle great ritual importance.
```

## The Olmec

The first Mesoamerican society to build monumental centres and spread a recognisable art style was the **Olmec**, on the humid Gulf Coast of Mexico in the modern states of Veracruz and Tabasco. ("Olmec" is a later Aztec name meaning "rubber people"; what they called themselves is unknown.) Their first great centre, **San Lorenzo**, flourished from about 1200 to 900 BCE, followed by **La Venta**, from about 900 to 400 BCE, with a large earthen pyramid and buried offerings of jade and serpentine.

The Olmec are most famous for their **colossal heads**, seventeen of which are known: huge portraits carved from basalt boulders up to three metres tall, probably of rulers, wearing helmet-like headdresses. The basalt was quarried in the Tuxtla Mountains, tens of kilometres away, and moved, probably on rafts and by sledge, without draught animals or wheels. The Olmec also carved jade, and their art features "were-jaguar" figures combining human infants and jaguars.

Olmec style appears far beyond the Gulf Coast, in highland Mexico and as far as El Salvador. This led to the idea that the Olmec were Mesoamerica's **"mother culture"**, from which all later civilizations derived. Other archaeologists argued for a **"sister cultures"** model, in which several regional societies developed in parallel and exchanged ideas, with the Olmec as one influential participant. The debate continues, and the truth may lie between the two. A stone block found at Cascajal in 2006, carved with signs that may be the earliest writing in the Americas, from around 900 BCE, would support an Olmec role in the origins of writing, though its dating and status are disputed.

{{image: Olmec colossal heads | An Olmec colossal head from San Lorenzo, carved from a basalt boulder probably as a portrait of a ruler, around 1200–900 BCE.}}

## Teotihuacan: The City of the Gods

In the Valley of Mexico, about 40 kilometres northeast of modern Mexico City, rose **Teotihuacan**, the largest city of the pre-Columbian Americas. At its height, between about 100 and 550 CE, it covered some 20 square kilometres and held perhaps 100,000 people or more, making it one of the largest cities in the world at the time. Its name, given centuries later by the Aztecs, means "the place where the gods were born". What its own people called it is unknown.

Teotihuacan was planned on a grand scale. A broad avenue more than two kilometres long, later called the **Avenue of the Dead**, ran through the city, aligned about 15.5 degrees east of north. Along it stood the **Pyramid of the Sun**, one of the largest structures in the ancient Americas, the Pyramid of the Moon, and the Temple of the Feathered Serpent, beneath which archaeologists found the remains of some 200 people sacrificed at its dedication. Between 2003 and 2015, a team led by Sergio Gómez excavated a sealed tunnel beneath that temple, finding thousands of offerings.

Most people lived in more than two thousand **apartment compounds**, walled residential blocks housing extended families or groups of artisans, with painted murals. Some neighbourhoods were inhabited by migrants from Oaxaca and the Maya region, who kept their own customs, making Teotihuacan a multiethnic city. Its obsidian workshops supplied tools and blades across Mesoamerica.

Teotihuacan's government is a puzzle similar to that of the Indus cities. Its art shows no clear portraits of individual rulers and no royal tombs have been securely identified, which has led some archaeologists to propose a form of collective or corporate rule. Around 550 CE, the city's civic and ceremonial centre was burned and many monuments deliberately damaged, probably in an internal revolt. The city declined, but its memory remained sacred: the Aztecs, nearly a thousand years later, made pilgrimages to its ruins.

Teotihuacan's influence reached far beyond the Valley of Mexico. Maya inscriptions record that in 378 CE a figure named **Siyaj K'ak'**, associated with Teotihuacan, arrived at the Maya city of Tikal on the very day that Tikal's king died, and a new ruler, the son of a figure the epigraphers call "Spearthrower Owl", was installed. Whether this was a conquest, an alliance, or something else is debated, but it shows Teotihuacan intervening directly in Maya politics.

```checkpoint
q: Why is Teotihuacan's form of government a puzzle?
a: Because its inscriptions say it had no rulers.
x: Teotihuacan left very little writing; the puzzle arises from what its art and burials lack, not from an inscription.
a*: Because its art shows no clear portraits of individual rulers and no royal tombs have been securely identified, which suggests the possibility of collective rule.
a: Because it was ruled directly by the Maya.
x: Teotihuacan influenced the Maya, as the events of 378 CE at Tikal show, not the other way round.
a: Because it was abandoned before it could form a government.
x: Teotihuacan was a huge, long-lived city, which must have had effective government.
hint: Compare it with the Indus cities.
why: A great city without visible kings challenges the assumption that early states were always ruled by glorified individual monarchs.
---
q: What do the events recorded at Tikal in 378 CE reveal?
a: That Tikal conquered Teotihuacan.
x: The influence went the other way: a figure associated with Teotihuacan arrived at Tikal, and a new ruler was installed.
a: That Teotihuacan and the Maya never had contact.
x: The episode is direct evidence of contact and intervention.
a: That the Maya script was invented at Teotihuacan.
x: The episode concerns politics, not the origins of writing.
a*: That Teotihuacan intervened directly in Maya politics, with a new ruler installed at Tikal on the day of the old king's death.
hint: Siyaj K'ak' arrived on the day Tikal's king died.
why: Maya inscriptions record Teotihuacan's direct role in installing a new dynasty at Tikal, showing long-distance political power in Mesoamerica.
```

## The Maya

The **Maya** lived in the Yucatán Peninsula and the surrounding lowlands and highlands of what are now southern Mexico, Guatemala, Belize, and parts of Honduras and El Salvador. Maya civilization had deep roots. In the Preclassic period, cities such as **El Mirador** in northern Guatemala, flourishing around 300 BCE to 150 CE, built pyramids among the largest in the world. In 2018, an airborne lidar survey sponsored by the PACUNAM foundation mapped more than 2,100 square kilometres of northern Guatemala through the forest canopy and identified some 61,000 structures, including houses, fortifications, causeways, and field systems, revealing a far denser and more connected landscape than ground surveys had shown.

The **Classic period** (about 250–900 CE) was the height of Maya city-states. Dozens of independent kingdoms, each ruled by a *k'uhul ajaw*, "holy lord", competed for power and prestige. The greatest were **Tikal** and **Calakmul**, whose rivalry dominated the sixth and seventh centuries, each building networks of allied and subordinate cities. Calakmul's dynasty, known as the Kaanul or "Snake" kingdom, was a superpower; with its ally Caracol, it defeated Tikal in 562 CE. Other important cities included **Palenque**, where King **K'inich Janaab' Pakal** (reigned 615–683) was buried in an elaborate tomb beneath the Temple of the Inscriptions, discovered by the archaeologist Alberto Ruz in 1952, and **Copán**, with its Hieroglyphic Stairway.

Maya cities were centres of royal ritual and display. Kings and queens commissioned stone monuments called stelae recording their accessions, wars, rituals, and genealogies, along with dates. Warfare was frequent and aimed at capturing rivals, tribute, and prestige as well as territory.

```checkpoint
q: What did the 2018 lidar survey in northern Guatemala reveal?
a: That the Maya never lived in the lowland forests.
x: The survey showed dense settlement in the lowland forests.
a: The first Maya writing.
x: Lidar maps the ground surface; it does not reveal inscriptions.
a*: Some 61,000 structures hidden under the forest canopy, revealing a far denser and more connected Maya landscape than previously known.
a: That Maya cities were built by Teotihuacan.
x: The survey mapped Maya settlement; it says nothing to support such a claim.
hint: Lidar can see the ground through trees.
why: Remote sensing revealed houses, causeways, fortifications, and fields on a scale that changed estimates of Maya population and landscape.
---
q: Which statement about Classic Maya politics is correct?
a*: Many independent kingdoms, each ruled by a "holy lord", competed, with Tikal and Calakmul leading rival networks of allies.
a: The Maya were united in a single empire ruled from one capital.
x: The Classic Maya were divided into many competing kingdoms.
a: Maya cities never fought each other.
x: Warfare between Maya cities was frequent, such as Calakmul and Caracol's defeat of Tikal in 562 CE.
a: Maya kings were elected by popular vote.
x: Maya rulers were hereditary "holy lords", not elected.
hint: Think of the rivalry between Tikal and Calakmul.
why: Classic Maya politics was a system of competing city-states and alliances, comparable to the city-states of Sumer or classical Greece.
```

## Reading the Maya

Maya writing is a **logosyllabic** system: some signs represent whole words (logograms), and others represent syllables, combining a consonant and a vowel. Scribes could write a word either with a logogram or by spelling it out in syllables, or both together. The script was used on monuments, ceramics, and painted books made of bark paper, called codices.

Its decipherment is one of the great intellectual achievements of the twentieth century, and it began with a misunderstanding. In the sixteenth century the Spanish bishop **Diego de Landa**, who in 1562 burned Maya books at Maní as works of the devil, also recorded what he thought was a Maya "alphabet", asking a Maya informant to write the signs for Spanish letters. Only four Maya codices are generally accepted as surviving. For centuries Landa's "alphabet" seemed useless. In 1952 the Soviet linguist **Yuri Knorozov** realised that it was actually a list of syllables, since the informant had written the sounds of the Spanish letter names, and used it to show that the script was largely phonetic. Western scholars, led by J. Eric S. Thompson, who believed the inscriptions were mainly about calendars and astronomy, resisted his work for years, partly because of Cold War politics.

The second breakthrough came in 1960, when **Tatiana Proskouriakoff**, studying monuments at Piedras Negras, showed that the dates on stelae fell within human lifespans and recorded births, accessions, and deaths of rulers. The inscriptions were history, not just astronomy. From the 1970s, scholars such as Linda Schele, Peter Mathews, and David Stuart, working in collaborative conferences such as the Palenque Round Tables, combined these approaches. Today most Maya inscriptions can be read, and the political history of the Classic period, with names, dates, wars, and alliances, has been reconstructed in detail.

The Maya also developed sophisticated mathematics and astronomy. They used a **base-20** (vigesimal) positional number system with a symbol for **zero**, one of the few independent inventions of zero in history. The **Long Count** calendar counted days from a starting point equivalent to 11 August 3114 BCE in our calendar, allowing dates to be recorded across thousands of years; the earliest known Long Count dates, from the first century BCE, come from sites outside the Maya heartland. The Dresden Codex contains tables predicting the movements of Venus and eclipses with great accuracy. The end of a major Long Count cycle on 21 December 2012 produced a wave of popular claims about the end of the world; Maya inscriptions themselves record dates thousands of years beyond it.

{{image: Temple of the Inscriptions | The Temple of the Inscriptions at Palenque, built over the tomb of King K'inich Janaab' Pakal, discovered in 1952.}}

```checkpoint
q: What was Yuri Knorozov's key insight into Diego de Landa's "alphabet"?
a: That Landa had invented the signs himself.
x: Landa recorded genuine Maya signs; the misunderstanding was about what they represented.
a: That the "alphabet" was a list of numbers.
x: Maya numbers were already understood. Knorozov's insight concerned the phonetic signs.
a: That the signs recorded the Zapotec language.
x: Knorozov showed the signs recorded the sounds of Maya, not Zapotec.
a*: That the signs were syllables, written by a Maya informant for the sounds of Spanish letter names, which showed the script was largely phonetic.
hint: How would a Maya scribe write the sound of the Spanish letter "b", pronounced "bay"?
why: Recognising the "alphabet" as syllabic unlocked the phonetic part of the script and transformed decipherment.
---
q: What did Tatiana Proskouriakoff demonstrate in 1960?
a: That Maya inscriptions recorded only astronomical observations.
x: She showed the opposite: inscriptions recorded human history.
a*: That the dates on Maya monuments matched human lifespans and recorded the births, accessions, and deaths of rulers.
a: That the Maya script was an alphabet.
x: Her breakthrough was historical, not about the type of script.
a: That the Maya had no rulers.
x: Her work revealed the rulers and their life events.
hint: She looked at patterns in the dates on monuments at Piedras Negras.
why: Showing that inscriptions recorded the lives of real rulers turned Maya texts into a source for political history.
```

## The Classic Maya "Collapse"

Between about 800 and 950 CE, the great cities of the southern Maya lowlands declined. Kings stopped erecting dated monuments; the last known Long Count date, from Toniná, corresponds to 909 CE. Royal courts disappeared, and over the following decades populations fell sharply and many cities were abandoned to the forest.

Explanations have changed over time, and most researchers now combine several factors:

- **Drought.** Sediment cores from lakes in the Yucatán show a series of severe droughts in the ninth and tenth centuries. One study published in 2018, using the isotopic composition of gypsum in Lake Chichancanab, estimated that annual rainfall fell by about 40 to 50 per cent at times, with even sharper drops in peak years.
- **Warfare**, which intensified in the late Classic period, as inscriptions and fortifications show.
- **Environmental pressure**, as large populations cleared forests and farmed intensively.
- **Political breakdown**, as the authority of holy lords, who claimed to guarantee rain and prosperity, failed when they could not deliver.

The word "collapse" is misleading in two ways. First, it was regional. In the northern Yucatán, cities such as **Chichén Itzá** flourished after 900 CE, and Mayapán later became a major centre, until shortly before the Spanish arrived. Second, the Maya people did not disappear. The **Popol Vuh**, the sacred book of the K'iche' Maya, was written down in the Latin alphabet in the sixteenth century, preserving Maya creation stories. Millions of people speak Maya languages today in Mexico, Guatemala, and Belize. What collapsed was the system of divine kingship and the great royal cities, not Maya civilization or its people.

The later history of Mesoamerica, including the rise of the Aztec empire and its encounter with the Spanish, continues in the chapter *Moctezuma's Mexico*.

```checkpoint
q: Which factor do most researchers now include in explaining the Classic Maya collapse?
a: An invasion by the Spanish.
x: The collapse took place in the ninth and tenth centuries, about six hundred years before the Spanish arrived.
a*: Severe droughts, documented in lake sediment cores, combined with warfare, environmental pressure, and political breakdown.
a: A single volcanic eruption.
x: No single eruption explains a decline spread over many cities and more than a century.
a: The disappearance of the Maya people.
x: The Maya people did not disappear; millions speak Maya languages today.
hint: Lake sediments record rainfall.
why: Climate data from lake cores, combined with evidence of warfare and political failure, supports a multi-causal explanation.
---
q: Why is the word "collapse" misleading for the end of the Classic Maya period?
a: Because no cities were ever abandoned.
x: Many southern lowland cities were abandoned; the term exaggerates other aspects.
a: Because the Maya moved to South America.
x: There was no migration to South America. Maya populations remained in Mesoamerica.
a: Because the Maya were conquered by the Inca.
x: The Inca never reached Mesoamerica.
a*: Because it was regional, with northern cities such as Chichén Itzá flourishing afterwards, and the Maya people and their culture continued to the present.
hint: What happened in the northern Yucatán, and who speaks Maya languages today?
why: The end of divine kingship in the southern lowlands was dramatic, but Maya civilization and people continued, which "collapse" obscures.
```

## Further exploration

- **Michael D. Coe, *Breaking the Maya Code* (3rd ed., 2012).** The story of the decipherment, by one of its participants.
- **Simon Martin and Nikolai Grube, *Chronicle of the Maya Kings and Queens* (2nd ed., 2008).** The dynastic history of the Classic Maya cities, reconstructed from inscriptions.
- **Michael D. Coe and Stephen Houston, *The Maya* (9th ed., 2015).** The standard introduction.
- **Richard A. Diehl, *The Olmecs: America's First Civilization* (2004).** A clear survey of Olmec archaeology.
- **Simon Martin, *Ancient Maya Politics* (2020).** A detailed analysis of how Maya kingdoms competed and allied.
- **Dennis Tedlock (trans.), *Popol Vuh* (revised ed., 1996).** The K'iche' Maya book of creation.$mesoam_master$,
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
  select $mesoam_quiz$[
    {"type": "mcq", "prompt": "What is the debate between the 'mother culture' and 'sister cultures' models about?", "options": ["Whether the Olmec were the single source of later Mesoamerican civilization or one of several interacting regional societies", "Whether the Maya were descended from the Inca", "Whether women ruled Olmec cities", "Whether Teotihuacan was founded by the Olmec"], "answerIndex": 0, "explanation": "The 'mother culture' view sees the Olmec as the origin of later civilizations; the 'sister cultures' view sees parallel development with exchange.", "id": "q1"},
    {"type": "mcq", "prompt": "Which feature best describes Teotihuacan?", "options": ["A small Maya ceremonial centre", "An Olmec capital on the Gulf Coast", "An Aztec city founded in 1325", "A planned metropolis of perhaps 100,000 or more people, with the Avenue of the Dead and apartment compounds"], "answerIndex": 3, "explanation": "Teotihuacan, at its height between about 100 and 550 CE, was among the largest cities in the world, planned along the Avenue of the Dead and home to migrants from across Mesoamerica.", "id": "q2"},
    {"type": "mcq", "prompt": "What made Tatiana Proskouriakoff's 1960 work a breakthrough?", "options": ["She found the tomb of Pakal", "She showed that Maya inscriptions recorded the lives of real rulers", "She burned the Maya codices", "She invented the Long Count"], "answerIndex": 1, "explanation": "By showing that monument dates fitted human lifespans, she proved the inscriptions were historical records.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is it misleading to say the Maya 'disappeared'?", "options": ["Because they moved to Peru", "Because the collapse affected only one city", "Because northern cities flourished afterwards and millions of people speak Maya languages today", "Because the Maya were never a real civilization"], "answerIndex": 2, "explanation": "The end of Classic divine kingship in the southern lowlands did not end Maya civilization or the Maya people.", "id": "q4"},
    {"type": "open", "prompt": "Explain the decipherment of Maya writing. Why did it take so long, and what changed it?", "rubric": "A strong answer explains the logosyllabic nature of the script; the destruction of codices by Landa (1562) leaving only four; Landa's misunderstood 'alphabet'; Knorozov's 1952 insight that it was syllabic; the resistance of J. Eric S. Thompson and the influence of Cold War politics; Proskouriakoff's 1960 demonstration that inscriptions were historical; and the collaborative work of Schele, Mathews, Stuart, and others from the 1970s. It notes the result: most inscriptions are now readable and Classic political history has been reconstructed.", "id": "q5"},
    {"type": "open", "prompt": "Using evidence from the chapter, explain the causes of the Classic Maya collapse and assess how far 'collapse' is the right word.", "rubric": "A strong answer explains drought evidence from lake cores (including the 2018 Lake Chichancanab study suggesting rainfall fell by around 40–50 per cent), intensified warfare, environmental pressure from large populations, and the failure of divine kingship, with the last Long Count date at 909 CE. It then assesses the term: the decline was concentrated in the southern lowlands; northern centres such as Chichén Itzá and Mayapán flourished afterwards; the Popol Vuh was written in the sixteenth century; and millions of people speak Maya languages today. It reaches a reasoned conclusion about what actually collapsed.", "id": "q6"}
  ]$mesoam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/mesoamerican-cultures-olmec-maya-and-teotihuacan', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
