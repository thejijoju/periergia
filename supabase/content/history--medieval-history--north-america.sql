-- North America before Columbus — canonical master article, co-written and human-reviewed.
-- history/medieval-history/the-americas/north-america-before-columbus @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The pristine myth and population debates, the Ancestral Puebloans and
-- Chaco, the Hohokam, Cahokia and the Mississippians, the Haudenosaunee
-- Confederacy, the Pacific Northwest, and the Norse.
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
    'history/medieval-history/the-americas/north-america-before-columbus',
    'research',
    'advanced',
    'read',
    $northam_master$> **North America before Columbus** was not an empty wilderness waiting to be discovered. It was home to millions of people in hundreds of societies, from farming towns in the deserts of the Southwest to a city of perhaps 10,000 to 20,000 people on the Mississippi, from political confederacies in the northeast to wealthy, ranked societies of fishers on the Pacific coast. This chapter describes some of these societies between about 800 and 1500 CE: the Ancestral Puebloans and Chaco Canyon, the Hohokam, the Mississippian culture and Cahokia, the Haudenosaunee Confederacy, and the peoples of the Pacific Northwest; it also covers the brief Norse presence and the long debate over how many people lived in North America and how the continent's history should be told.

## The Myth of an Empty Land

For a long time, European and American writers imagined North America before 1492 as a thinly peopled wilderness, inhabited by small, mobile bands who left the land untouched. In 1992 the geographer William Denevan called this "**the pristine myth**". It served a purpose: an empty land could be settled without guilt.

Estimates of the population of North America north of Mexico in 1492 have varied enormously. In 1939 the anthropologist Alfred Kroeber estimated under a million. In 1983 Henry Dobyns argued for as many as 18 million, emphasising the impact of epidemics that spread ahead of European settlers. Most recent estimates fall between about 2.5 and 7 million, but the uncertainty is huge, and the debate is not merely academic: higher estimates imply a far greater demographic catastrophe after 1492.

Much of the evidence for these societies comes from archaeology. Increasingly it comes also from **Indigenous oral history** and the work of Indigenous scholars, and from collaboration between archaeologists and the descendant communities of the people they study, encouraged in the United States by the Native American Graves Protection and Repatriation Act of 1990.

## Ancestral Puebloans and Chaco Canyon

In the dry Four Corners region of the American Southwest, where Arizona, New Mexico, Colorado, and Utah meet, the **Ancestral Puebloans** grew maize, beans, and squash using careful water management, and built multi-storey stone and adobe villages. (They were long called the "Anasazi", a Navajo word sometimes translated "ancestors of enemies"; their descendants, the Hopi, Zuni, and other Pueblo peoples, prefer "Ancestral Puebloans".)

Between about 900 and 1150, after a build-up from around 850, **Chaco Canyon** in New Mexico became the centre of a remarkable regional system. Its "great houses", such as **Pueblo Bonito**, had hundreds of rooms on several storeys, with large circular ceremonial chambers called kivas. Straight roads ran out from the canyon across the desert, linking it to outlying great houses. Some buildings appear to be aligned with the movements of the sun and moon. Chaco worked turquoise from mines across the Southwest and imported shell, copper bells, and scarlet macaws from Mexico and the Gulf of California, and residues of **cacao** found on jars at Pueblo Bonito show that chocolate, from Mesoamerica nearly 2,000 kilometres away, was drunk there. How Chaco was governed, and whether it was mainly a residential, ceremonial, or pilgrimage centre, is debated.

After about 1150, Chaco declined, and many Ancestral Puebloans moved to more defensible sites, such as the cliff dwellings of **Mesa Verde** in Colorado. A severe drought between 1276 and 1299, documented in tree rings, together with conflict, led to the abandonment of the Four Corners region. People migrated south and east, to the Rio Grande valley and the Hopi and Zuni lands, where their descendants live today. Pueblo oral traditions describe these migrations as a purposeful journey, not a mysterious "disappearance".

In southern Arizona, the **Hohokam** built hundreds of kilometres of irrigation canals in the Salt and Gila river valleys, some of which were later reused by the modern city of Phoenix.

```checkpoint
q: What do the cacao residues found at Pueblo Bonito reveal?
a*: That the people of Chaco Canyon obtained chocolate from Mesoamerica, nearly 2,000 kilometres away, showing long-distance connections.
a: That cacao trees grew in New Mexico.
x: Cacao cannot grow in the dry Southwest; it had to come from far to the south.
a: That the Spanish brought chocolate to Chaco.
x: The residues date from centuries before the Spanish arrived.
a: That Chaco was a colony of the Aztec empire.
x: Chaco flourished long before the Aztec empire and was not a colony; the cacao shows exchange, not rule.
hint: Where does cacao grow?
why: Imported cacao, macaws, and copper bells show that the Southwest was linked to Mesoamerica by long-distance exchange.
---
q: Why do historians reject the idea that the Ancestral Puebloans mysteriously "disappeared"?
a: Because they never left the Four Corners region.
x: They did leave the Four Corners region around 1300; what is rejected is the idea of disappearance.
a: Because they were all killed by the Spanish.
x: The migration happened around 1300, long before the Spanish arrived.
a*: Because they migrated to the Rio Grande and Hopi and Zuni lands, where their descendants live today, and their oral traditions describe the migration.
a: Because they moved to Mexico and founded the Aztec empire.
x: Their descendants are the Pueblo peoples of the Southwest, not the Aztecs.
hint: Who are the Hopi and Zuni?
why: The "disappearance" story erased living descendants; archaeology and oral tradition show a migration.
```

## Cahokia and the Mississippians

From around 900 CE, maize farming spread across the river valleys of the eastern woodlands, and from about 1000 grew the **Mississippian** culture, which built towns with large earthen platform mounds topped by temples and elite houses across the Mississippi valley and the southeast.

The largest centre was **Cahokia**, near modern St Louis. Around 1050 it grew rapidly, in what archaeologists call a "big bang", into a city that at its height around 1100 may have had 10,000 to 20,000 people (estimates range from 6,000 to 40,000), comparable to London at the time. Its central feature, **Monks Mound**, rises about 30 metres and is the largest earthen structure in the Americas north of Mexico. The city had about 120 earthen mounds spread over some 16 square kilometres, the largest grouped around a great plaza. A ring of wooden posts, nicknamed "Woodhenge", may have been used to track the sun. In a burial mound known as **Mound 72**, archaeologists found a high-status man and woman laid on a bed of thousands of shell beads; over about a century some 270 people were buried in the mound, more than half of them apparently sacrificed, including mass graves of young women, evidence of a powerful and stratified society.

Cahokia declined after about 1200 and was largely abandoned by about 1350 and entirely by about 1400, apart from a brief later reoccupation, for reasons that may include flooding, drought, conflict, and political breakdown. Mississippian chiefdoms continued elsewhere, at sites such as Moundville in Alabama (largely abandoned by about 1500) and Etowah in Georgia, and the Spanish expedition of Hernando de Soto encountered surviving chiefdoms such as Coosa in 1539–1543, shortly before European diseases devastated them.

{{image: Cahokia | Monks Mound at Cahokia, near St Louis, the largest earthen structure in the Americas north of Mexico.}}

## The Haudenosaunee Confederacy

In what is now New York State, five nations, the Mohawk, Oneida, Onondaga, Cayuga, and Seneca, formed the **Haudenosaunee** ("People of the Longhouse") **Confederacy**, known to the French as the Iroquois. They lived in villages of longhouses, farmed maize, beans, and squash, the "three sisters", and traced descent through women.

According to Haudenosaunee tradition, the confederacy was founded by the Peacemaker and his spokesman **Hiawatha**, who persuaded the warring nations to accept the **Great Law of Peace**, establishing a grand council of chiefs to resolve disputes by consensus. **Clan mothers** chose and could remove the chiefs. The date of founding is debated: some scholars, linking a tradition to a solar eclipse, have proposed 1142, while many archaeologists favour about 1450, and some place it later still, as late as the seventeenth century. A sixth nation, the Tuscarora, joined in 1722.

Some writers have argued that the confederacy influenced the authors of the United States Constitution, and in 1988 the US Congress passed a resolution acknowledging that influence. Historians remain divided on how direct it was, and the Haudenosaunee Confederacy, which still meets, is often described as one of the oldest participatory political systems in the world.

## The Pacific Northwest

On the Pacific coast from Alaska to northern California, peoples such as the Tlingit, Haida, Kwakwaka'wakw, and Coast Salish built wealthy, densely populated societies without staple crops such as maize, though they tended camas beds and built clam gardens. Abundant salmon, shellfish, sea mammals, and forests of cedar supported permanent villages of large plank houses, carved and painted crest poles, and ocean-going canoes. These societies were ranked, with nobles, commoners, and slaves, and leaders gained status by giving away wealth at great ceremonial feasts known as **potlatches**. They show, as the chapter on human origins noted for foragers elsewhere, that complex, hierarchical societies did not require agriculture.

## The Norse in North America

Around the year 1000, Norse sailors from Greenland reached North America, as the chapter on early medieval Europe described. Icelandic sagas tell of **Vinland**, a land of grapes, explored by Leif Erikson. At **L'Anse aux Meadows** in Newfoundland, archaeologists found a Norse settlement, and wood cut with metal Norse tools has been dated, using tree rings that record a burst of solar radiation in 993, to 1021. The sagas describe encounters, trade, and fighting with Indigenous people the Norse called *Skrælingar*. The Norse presence was brief and left no lasting impact; the connection between the hemispheres would come five centuries later, with far greater consequences.

```checkpoint
q: What does Mound 72 at Cahokia suggest about Mississippian society?
a: That Cahokia was an egalitarian society with no leaders.
x: Elite burials accompanied by well over a hundred apparently sacrificed people are strong evidence of hierarchy.
a*: That Cahokia was a powerful, stratified society in which elite people were buried with great wealth and many apparently sacrificed people.
a: That Cahokia was founded by the Norse.
x: Cahokia was a Mississippian city with no connection to the Norse.
a: That Cahokia had no religion.
x: The burial and the mounds point to an elaborate religious and political order.
hint: Consider the beads and the sacrificed people.
why: The burial reveals stark inequality and ritual power at the centre of the largest city north of Mexico.
---
q: Why are the societies of the Pacific Northwest important for understanding human history?
a: Because they were the first farmers in North America.
x: Pacific Northwest peoples did not grow staple crops like maize; that is precisely their significance.
a: Because they founded the Haudenosaunee Confederacy.
x: The Haudenosaunee lived in the northeast, far from the Pacific coast.
a: Because they had no contact with other peoples.
x: They traded widely along the coast; their importance lies in complexity without staple-crop farming.
a*: Because they built wealthy, ranked, densely populated societies without agriculture, showing that complexity did not require farming.
hint: What was their main food source?
why: Abundant natural resources supported social complexity without staple-crop farming, challenging the link between agriculture and hierarchy.
```

## Further exploration

- **Charles C. Mann, *1491: New Revelations of the Americas Before Columbus* (2005).** A popular synthesis challenging the myth of an empty continent.
- **Timothy Pauketat, *Cahokia: Ancient America's Great City on the Mississippi* (2009).** An accessible account of Cahokia.
- **Stephen Lekson, *A History of the Ancient Southwest* (2009).** A provocative history of the Southwest, including Chaco.
- **Kathleen DuVal, *Native Nations: A Millennium in North America* (2024).** A sweeping Indigenous-centred history.
- **Ned Blackhawk, *The Rediscovery of America: Native Peoples and the Unmaking of U.S. History* (2023).** United States history with Native Americans at the centre.$northam_master$,
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
  select $northam_quiz$[
    {"type": "mcq", "prompt": "What did William Denevan call 'the pristine myth'?", "options": ["The belief that North America before 1492 was a thinly peopled, untouched wilderness", "The belief that Vikings discovered America", "The belief that Cahokia was built by Europeans", "The belief that the Inca ruled North America"], "answerIndex": 0, "explanation": "Denevan showed that Indigenous peoples had shaped the landscape and that an 'empty' land was a convenient myth for settlers.", "id": "q1"},
    {"type": "mcq", "prompt": "What is Monks Mound?", "options": ["A Pueblo great house", "A Norse burial mound", "The largest earthen structure in the Americas north of Mexico, at Cahokia", "A Haudenosaunee longhouse"], "answerIndex": 2, "explanation": "Monks Mound rises about 30 metres at the centre of Cahokia, the largest Mississippian city.", "id": "q2"},
    {"type": "mcq", "prompt": "What role did clan mothers play in the Haudenosaunee Confederacy?", "options": ["They led the armies", "They had no political role", "They negotiated with the Norse", "They chose and could remove the chiefs"], "answerIndex": 3, "explanation": "Women held significant political authority in the confederacy, which traced descent through women.", "id": "q3"},
    {"type": "mcq", "prompt": "What caused the abandonment of the Four Corners region by the Ancestral Puebloans around 1300?", "options": ["A Spanish invasion", "A severe drought from 1276 to 1299, documented in tree rings, together with conflict", "An earthquake", "An epidemic brought by the Norse"], "answerIndex": 1, "explanation": "People migrated to the Rio Grande and Hopi and Zuni lands, where their descendants live today.", "id": "q4"},
    {"type": "open", "prompt": "Using examples from the chapter, show why the idea of a 'pristine' North America before 1492 is wrong.", "rubric": "A strong answer uses examples such as Chaco Canyon's great houses, roads, and imports from Mesoamerica; Hohokam canals; Cahokia's size, mounds, and Mound 72; the Haudenosaunee Confederacy; the ranked Pacific Northwest societies; and population debates (Kroeber, Dobyns, current estimates). It explains why the myth served settler interests and why population estimates matter for understanding the catastrophe after 1492.", "id": "q5"},
    {"type": "open", "prompt": "How do archaeology, oral history, and Indigenous scholarship together change the history of pre-Columbian North America?", "rubric": "A strong answer explains how archaeology (tree rings, cacao residues, excavation of Cahokia and Mound 72) provides material evidence; how oral traditions (Pueblo migration accounts, Haudenosaunee Great Law) supply meanings and correct ideas of 'disappearance'; and how collaboration and NAGPRA have changed relations with descendant communities. It notes challenges, such as dating oral traditions (the debate over the Haudenosaunee founding).", "id": "q6"}
  ]$northam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/the-americas/north-america-before-columbus', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
