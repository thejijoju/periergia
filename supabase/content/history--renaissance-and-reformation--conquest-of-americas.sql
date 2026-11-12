-- The Conquest of the Americas — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/the-conquest-of-the-americas @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The Taíno and the encomienda, Mexico and Peru, the demographic collapse
-- and its causes, the Valladolid debate, Portuguese Brazil, Indigenous
-- accounts, and Restall's myths of the conquest.
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
    'history/renaissance-and-reformation/the-conquest-of-the-americas',
    'research',
    'advanced',
    'read',
    $conquest_master$> **The conquest of the Americas** in the sixteenth century overthrew the largest states in the Western Hemisphere and began one of the deadliest demographic catastrophes in human history, proportionally perhaps the worst. A few thousand Europeans, with the help of hundreds of thousands of Indigenous allies and an invisible army of diseases, conquered the Aztec and Inca empires and brought most of the Caribbean, Mesoamerica, and the Andes under Spanish rule, while the Portuguese began to colonise Brazil. This chapter covers the Caribbean and the Taíno, the conquests of Mexico and Peru, the demographic collapse and the debate over its causes and scale, the great debate at Valladolid over the rights of Indigenous peoples, Portuguese Brazil, the Indigenous accounts that survive, and the myths that have grown up around the conquest.

## The Caribbean: The First Catastrophe

The **Taíno** of the Greater Antilles, the islands of Hispaniola, Cuba, Puerto Rico, and Jamaica, lived in agricultural chiefdoms, growing cassava and maize, with villages governed by chiefs called *caciques*. When Columbus arrived in 1492, estimates for Hispaniola alone range from tens of thousands to a million or more; a 2020 study of ancient DNA points to the lower end, a few tens of thousands.

Within a generation the Taíno population had collapsed. The Spanish demanded gold and labour, assigning groups of Taíno to colonists through the **encomienda**, which in principle required the colonists to protect and convert them but in practice became forced labour. War, overwork, famine, disruption of farming, enslavement, and, from 1518–19, smallpox, destroyed Taíno society. By 1514 perhaps 30,000 remained on Hispaniola, the smallpox epidemic killed perhaps a third of the survivors, and by 1542 only about 2,000 were left; and the Spanish turned to importing enslaved Africans.

Some Spaniards protested. In 1511 the Dominican friar **Antonio de Montesinos** preached a sermon in Santo Domingo in December 1511 condemning the colonists; as Las Casas later recorded it, he asked: "Are these not men? Have they not rational souls?" The Spanish crown issued the **Laws of Burgos** in 1512 to regulate the treatment of Indigenous people, but they were widely ignored. One of the colonists who heard such sermons, **Bartolomé de las Casas**, gave up his own encomienda, became a Dominican friar, and spent the rest of his life campaigning against the abuse of Indigenous peoples.

## Mexico and Peru

The conquest of the **Aztec empire** (1519–1521) and the **Inca empire** (from 1532) are described in detail in the chapters *Moctezuma's Mexico* and *The Inca Empire*. In both cases, the same pattern appears:

- **Indigenous allies.** In Mexico, the Tlaxcalans and other enemies of the Mexica provided tens of thousands of warriors; in Peru, the Spanish exploited the civil war between Atahualpa and Huáscar and found allies among peoples resentful of Inca rule.
- **Disease.** Smallpox struck Tenochtitlan in 1520, and an epidemic, often identified as smallpox though this is debated, reached the Andes in the 1520s, years before Pizarro's 1532 invasion, killing the Inca ruler Huayna Capac and his heir.
- **Spanish advantages.** Steel weapons and armour, horses, and some firearms, together with ruthlessness, such as the seizure of rulers at Tenochtitlan and Cajamarca.
- **Interpreters.** Malintzin in Mexico, and others in Peru, made communication and alliance possible.

The conquest was not completed in 1521 or 1533. The Maya kingdoms of Yucatán and Guatemala resisted for decades; the last independent Maya kingdom, the Itza capital of Nojpetén in Guatemala, fell only in **1697**. The Inca state at Vilcabamba held out until 1572, and many Indigenous peoples on the frontiers of the Spanish empire, from northern Mexico to southern Chile, were never fully conquered in the colonial period.

## The Demographic Collapse

The Indigenous population of the Americas fell catastrophically in the century after 1492. In the 1960s the historians Woodrow Borah and Sherburne Cook estimated that the population of central Mexico fell from about 25 million on the eve of the conquest (1518) to around one million by 1605; critics have argued for much lower starting figures. Their figures are debated, and estimates for the population of the whole Western Hemisphere in 1492 range from about 8 million to over 100 million, with most recent estimates, following William Denevan, between about 45 and 60 million, or a little more. Whatever the exact numbers, most historians agree that the Indigenous population fell by something like 80 to 90 per cent in many regions over the following century.

The causes are debated:

- **Epidemic disease** was the largest single cause. Indigenous Americans had no previous exposure to Afro-Eurasian diseases such as smallpox, measles, influenza, and typhus, which struck in repeated waves. In Mexico, huge epidemics called *cocoliztli* in 1545 and 1576 killed millions; a study of ancient DNA published in 2018 identified *Salmonella enterica* Paratyphi C, a form of enteric fever, in victims of the 1545 epidemic, though whether it was the main cause is still debated.
- **Violence, forced labour, and enslavement.** War, massacres, the encomienda, labour in mines, and the disruption of farming and food supplies made people more vulnerable to disease and reduced births. The historian Andrés Reséndez, in *The Other Slavery* (2016), argued that the enslavement of Indigenous people, which continued despite being outlawed, was a major cause of the population collapse, especially in the Caribbean.
- **Social collapse.** The deaths of elders, leaders, and parents destroyed communities' ability to recover.

Historians therefore reject the idea that the catastrophe was simply an unavoidable "accident" of disease: colonial conditions made epidemics far deadlier. Some scientists have even linked the collapse to the global climate, arguing that reforestation of abandoned farmland in the Americas absorbed enough carbon to contribute to a dip in atmospheric carbon dioxide around 1610, though this remains debated.

```checkpoint
q: Why do historians reject the view that the Indigenous population collapse was simply an accident of disease?
a*: Because war, forced labour, enslavement, and the disruption of food supplies and communities made epidemics far deadlier and reduced recovery.
a: Because disease played no role in the collapse.
x: Disease was the largest single cause; the point is that colonial conditions made it deadlier.
a: Because the population did not actually fall.
x: The population fell catastrophically, by perhaps 80 to 90 per cent in many regions.
a: Because Europeans brought medicine that made disease worse.
x: The problem was not European medicine but the combination of new diseases and colonial violence.
hint: Think about the effect of overwork and famine on resistance to disease.
why: Disease and colonial exploitation worked together, so the catastrophe was not purely natural.
---
q: What did the 2018 ancient DNA study of the 1545 cocoliztli epidemic find?
a: That the epidemic was smallpox.
x: The study identified a form of enteric fever, not smallpox.
a: That the epidemic was caused by poisoned water.
x: The study found a bacterial pathogen, not poison.
a*: Salmonella enterica Paratyphi C, a form of enteric fever, in victims of the epidemic.
a: That no one died in the epidemic.
x: The cocoliztli epidemics killed millions.
hint: It was a bacterial infection related to typhoid.
why: Ancient DNA is identifying the specific diseases behind the catastrophe, revealing more than one killer.
```

## The Valladolid Debate

The conquest raised a profound question for Spanish theologians and jurists: by what right did Spain rule the peoples of the Americas, and how should they be treated? In 1550–1551, at **Valladolid** in Spain, the king convened a council to hear a debate between **Bartolomé de las Casas** and the humanist scholar **Juan Ginés de Sepúlveda**.

Sepúlveda argued, drawing on Aristotle's idea of "natural slaves", described in the chapter on ancient Greece, that the Indigenous peoples were naturally inferior, that practices such as human sacrifice justified war against them, and that Spanish rule would civilise them. Las Casas argued that Indigenous peoples were fully rational human beings, with legitimate rulers and societies, who should be converted only by peaceful persuasion, and denounced the cruelty of the conquest, as he had in his *Short Account of the Destruction of the Indies* (written 1542, printed 1552). The council reached no formal decision.

Las Casas's campaigning influenced the **New Laws** of 1542, which tried to limit the encomienda and forbade the enslavement of Indigenous people, though colonists resisted them fiercely. Ironically, Las Casas at one point suggested that enslaved Africans could replace Indigenous labour, a view he later deeply regretted. His writings, translated across Europe, were used by Spain's Protestant rivals in propaganda of uniquely Spanish cruelty, later called the "Black Legend" (a term popularised by the Spanish writer Julián Juderías in 1914), which conveniently overlooked the crimes of other European colonisers.

## Portuguese Brazil

Pedro Álvares Cabral reached Brazil in 1500. At first the Portuguese traded with the coastal **Tupi** peoples for brazilwood, a source of red dye that gave the land its name. From 1534 the crown divided the coast into hereditary captaincies granted to nobles, and in 1549 established a royal government at Salvador. Jesuit missionaries, such as Manuel da Nóbrega, gathered Indigenous people into mission villages. The colonists' main economic activity became **sugar**, grown on plantations in the northeast. They first enslaved Indigenous people, who died in large numbers from disease and overwork, and then increasingly imported enslaved Africans. Brazil would become the largest single destination of the Atlantic slave trade, as later chapters describe.

## Indigenous Accounts

The conquest is not known only from Spanish sources. Indigenous people recorded their own experiences:

- **The Florentine Codex**, compiled by Bernardino de Sahagún with Nahua scholars, whose twelfth book tells the conquest of Mexico from the Nahua point of view, as the chapter on Moctezuma's Mexico described.
- **Felipe Guaman Poma de Ayala**, an Andean noble, wrote *The First New Chronicle and Good Government* around 1615, a letter of nearly 1,200 pages to the king of Spain, illustrated with almost 400 drawings, describing Andean history and denouncing the abuses of colonial officials, priests, and colonists. It lay unnoticed in the Royal Library in Copenhagen, where it had been since at least the 1660s, until the scholar Richard Pietschmann found it in 1908.
- **Titu Cusi Yupanqui**, the Inca ruler of Vilcabamba, dictated an account of the conquest in 1570.
- **Inca Garcilaso de la Vega**, son of a Spanish conquistador and an Inca noblewoman, wrote the *Royal Commentaries of the Incas* (1609), a history of the Inca from the perspective of a proud mestizo.

These sources show the conquest not as an inevitable triumph but as a catastrophe, a negotiation, and, for many, an ongoing struggle to preserve land, culture, and dignity under colonial rule.

{{image: Guaman Poma | A drawing from Felipe Guaman Poma de Ayala's First New Chronicle and Good Government (about 1615), an Andean account denouncing colonial abuses.}}

## The Myths of the Spanish Conquest

In *Seven Myths of the Spanish Conquest* (2003), the historian **Matthew Restall** identified popular beliefs that distort the story. Among them:

- **The myth of exceptional men**: the conquest was not the work of a few geniuses like Cortés and Pizarro, but of many people, including Indigenous allies.
- **The myth of the white conquistador**: the conquerors included Africans, free and enslaved, such as **Juan Garrido**, an African conquistador who fought in Mexico, and, above all, huge numbers of Indigenous warriors.
- **The myth of completion**: the conquest took centuries and was never complete.
- **The myth of Native desolation**: Indigenous peoples did not simply vanish or give up; they adapted, resisted, used Spanish courts, and preserved their languages and cultures, which survive among millions today.
- **The myth of superiority**: Spanish success came from disease, alliances, and circumstances, not from inherent European superiority.

## Further exploration

- **Matthew Restall, *Seven Myths of the Spanish Conquest* (2003).** Popular myths about the conquest dismantled.
- **Andrés Reséndez, *The Other Slavery: The Uncovered Story of Indian Enslavement in America* (2016).** Indigenous enslavement and the population collapse.
- **Bartolomé de las Casas, *A Short Account of the Destruction of the Indies* (1552).** The famous denunciation of the conquest.
- **Noble David Cook, *Born to Die: Disease and New World Conquest, 1492–1650* (1998).** The role of epidemic disease.
- **Camilla Townsend, *Malintzin's Choices: An Indian Woman in the Conquest of Mexico* (2006).** The conquest through the life of Malintzin.$conquest_master$,
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
  select $conquest_quiz$[
    {"type": "mcq", "prompt": "What was the encomienda?", "options": ["A Spanish ship", "An Indigenous religious festival", "A treaty with the Inca", "A grant of Indigenous labour to colonists, which in practice became forced labour"], "answerIndex": 3, "explanation": "Encomenderos were supposed to protect and convert Indigenous people but exploited their labour.", "id": "q1"},
    {"type": "mcq", "prompt": "Who debated at Valladolid in 1550–1551?", "options": ["Cortés and Moctezuma", "Bartolomé de las Casas and Juan Ginés de Sepúlveda", "Luther and the pope", "Pizarro and Atahualpa"], "answerIndex": 1, "explanation": "Sepúlveda used Aristotle's 'natural slaves' to justify conquest; Las Casas defended Indigenous peoples' rationality and rights.", "id": "q2"},
    {"type": "mcq", "prompt": "When did the last independent Maya kingdom fall?", "options": ["1521", "1533", "1697", "1572"], "answerIndex": 2, "explanation": "The Itza capital of Nojpetén in Guatemala held out until 1697, showing the conquest was long and incomplete.", "id": "q3"},
    {"type": "mcq", "prompt": "What is Guaman Poma's First New Chronicle and Good Government?", "options": ["An illustrated Andean account of nearly 1,200 pages denouncing colonial abuses", "A Spanish conquistador's memoir", "A Nahua codex", "A papal bull"], "answerIndex": 0, "explanation": "Written around 1615 and rediscovered in Copenhagen in 1908, it is a major Indigenous source.", "id": "q4"},
    {"type": "open", "prompt": "Explain the causes of the Indigenous population collapse in the Americas after 1492, and why historians reject calling it simply an accident of disease.", "rubric": "A strong answer discusses the scale and the debate over estimates (Borah and Cook, ranges for 1492), disease (smallpox, measles, typhus, cocoliztli and the 2018 Paratyphi C finding), war, forced labour, encomienda, enslavement (Reséndez), famine and social collapse, and explains how colonial conditions made epidemics deadlier and prevented recovery.", "id": "q5"},
    {"type": "open", "prompt": "Using Restall's 'myths of the Spanish conquest', explain how Indigenous and African perspectives change the story of the conquest.", "rubric": "A strong answer explains several myths (exceptional men, white conquistador, completion, Native desolation, superiority) and corrects them with evidence: Indigenous allies such as the Tlaxcalans, African conquistadors such as Juan Garrido, Maya resistance until 1697, Vilcabamba, Indigenous use of courts and survival of languages, and Indigenous sources (Florentine Codex, Guaman Poma, Titu Cusi Yupanqui, Inca Garcilaso).", "id": "q6"}
  ]$conquest_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/the-conquest-of-the-americas', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
