-- Moctezuma's Mexico — canonical master article, co-written and human-reviewed.
-- history/medieval-history/the-americas/moctezuma-s-mexico @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Tenochtitlan, the Triple Alliance and tribute, religion and sacrifice,
-- markets and everyday life, Moctezuma and the Quetzalcoatl myth, the
-- conquest, Nahua and Spanish sources, and the Aztec afterlife.
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
    'history/medieval-history/the-americas/moctezuma-s-mexico',
    'research',
    'advanced',
    'read',
    $aztec_master$> **Moctezuma's Mexico** was the world of the Mexica, often called the Aztecs, at its height in the early sixteenth century. Their capital, **Tenochtitlan**, built on an island in a lake in the Valley of Mexico, was one of the largest cities in the world, and their Triple Alliance ruled a tribute empire stretching from the Gulf of Mexico to the Pacific. Within two years of the arrival of the Spanish in 1519, the city lay in ruins. This chapter describes Tenochtitlan, the Triple Alliance and its tribute empire, Mexica religion and the meaning of sacrifice, markets and everyday life, Moctezuma II and the myths later attached to him, the conquest and the role of Indigenous allies and disease, how we know about it from Nahua as well as Spanish sources, and the Aztec legacy in Mexican identity.

## The Lake City

The Mexica were Nahuatl-speaking latecomers to the Valley of Mexico. Their own histories told of a long migration from a homeland called **Aztlan**, from which the name "Aztec" derives, guided by their patron god **Huitzilopochtli**, until they saw an eagle perched on a cactus on an island in Lake Texcoco, the sign that they should settle. The traditional date of the founding of **Tenochtitlan** is 1325. The eagle on the cactus is today the emblem on the flag of Mexico.

Tenochtitlan grew into a magnificent city of 200,000 to 400,000 people on most estimates, linked to the shore by great causeways and supplied with fresh water by aqueducts from the springs of Chapultepec. Much of its food was grown on **chinampas**, artificial islands of mud and vegetation built up in the shallow lake, which produced several crops a year. Canals ran through the city, filled with canoes. At its centre, in a walled sacred precinct, stood the **Templo Mayor**, a great pyramid crowned by twin shrines to Huitzilopochtli, god of the sun and war, and **Tlaloc**, god of rain and fertility.

When the Spanish first saw the city in 1519, the soldier **Bernal Díaz del Castillo** later wrote that some of his companions asked whether what they saw was a dream, comparing it to the enchanted cities of chivalric romances.

## The Triple Alliance and Its Empire

In 1428 Tenochtitlan joined two other cities of the valley, Texcoco and Tlacopan, in a **Triple Alliance** that overthrew the dominant power of the region. Over the following ninety years, the alliance, increasingly dominated by Tenochtitlan, conquered much of central and southern Mexico.

The Aztec empire was a **tribute empire**, not a territorial state with direct administration. Conquered city-states kept their own rulers but had to deliver regular tribute: maize, beans, cotton cloth, feathers, jade, gold, cacao, and warriors' costumes. A sixteenth-century manuscript, the **Codex Mendoza**, lists the provinces and their tribute in pictorial form. Some powerful neighbours, notably **Tlaxcala**, were never conquered; the Mexica and the Tlaxcalans fought ritualised "flower wars", whose purpose, at least in part, was to capture prisoners for sacrifice. The resentment of tributary peoples and the hostility of Tlaxcala would prove decisive in 1519–1521.

## Religion and the Meaning of Sacrifice

Mexica religion was shaped by a belief that the universe was unstable and had already been destroyed and recreated four times; they lived in the age of the Fifth Sun. The gods had sacrificed themselves to create the sun and humanity, and humans owed them a debt that had to be repaid. **Human sacrifice**, most often of war captives, was believed to nourish the gods, especially the sun, and keep the cosmos in motion. Sacrifices were carried out on the Templo Mayor and at other temples, often by removing the heart.

The scale of sacrifice has long been debated. Post-conquest chroniclers, some drawing on Nahua informants, gave enormous figures, such as 80,400 victims at the rededication of the Templo Mayor in 1487, a number most historians consider greatly exaggerated. Spanish writers had every reason to exaggerate the practices of the people they conquered, and Nahua writers sometimes inflated numbers to glorify their ancestors' power. But archaeology confirms that sacrifice was real and substantial. Since 2015, archaeologists in Mexico City have excavated the **Huei Tzompantli**, a great rack and tower of human skulls described by the conquistadors, containing the skulls of more than 600 people, including women and children. Historians seek to understand sacrifice within the Mexica worldview, as part of religion and politics, while recognising its violence.

## Markets and Everyday Life

Much of Mexica life had nothing to do with war or sacrifice. In the twin city of **Tlatelolco**, a great **market** drew, according to Cortés, as many as 60,000 people a day, selling food, cloth, pottery, tools, feathers, slaves, and medicines, with judges to settle disputes and check measures. Cacao beans and lengths of cotton cloth served as currency. Long-distance merchants called *pochteca* travelled far beyond the empire's borders and also acted as spies.

Mexica society was hierarchical, with nobles, commoners, and enslaved people, but also had institutions that impressed the Spanish. Children were expected to attend school, boys at the *telpochcalli* for commoners, which trained warriors, or the *calmecac* for nobles and priests, which taught religion, history, and the calendar. Nahuatl poetry, including verses attributed to the poet-king **Nezahualcoyotl** of Texcoco, reflected on the brevity of life.

```checkpoint
q: Why do historians treat Spanish figures for Aztec sacrifice with caution?
a*: Because the Spanish had strong reasons to exaggerate the practices of the people they conquered, and some figures, such as 80,400 at one dedication, are implausibly high.
a: Because the Aztecs never practised human sacrifice.
x: Archaeology, including the Huei Tzompantli, confirms that sacrifice was real.
a: Because the Spanish never witnessed any Aztec rituals.
x: Spanish conquistadors did witness and describe Aztec temples and rituals; the problem is exaggeration.
a: Because the Aztecs kept no records.
x: The Aztecs kept pictorial records, and Nahua accounts were written after the conquest.
hint: Who benefited from portraying the Aztecs as bloodthirsty?
why: Sources written by conquerors often exaggerate the violence of the conquered to justify conquest, so they must be checked against archaeology.
---
q: What kind of empire did the Triple Alliance rule?
a: A centralised state with governors directly administering every province.
x: Conquered city-states usually kept their own rulers.
a: An empire based on trade only, with no military conquest.
x: The empire was built through military conquest, with tribute as its main purpose.
a*: A tribute empire, in which conquered city-states kept their rulers but delivered regular tribute to the alliance.
a: A confederation of equal cities in which Tenochtitlan had no special power.
x: Tenochtitlan increasingly dominated the alliance.
hint: Think of the Codex Mendoza.
why: Indirect rule through tribute made the empire cheap to run but left resentful subjects ready to ally with the Spanish.
```

## Moctezuma II and the Myths

**Moctezuma II** (Motecuhzoma Xocoyotzin) became *huey tlatoani*, "great speaker", in 1502. He was an experienced warrior and a devout, austere ruler who emphasised the distinction between nobles and commoners at court.

Popular histories often claim that Moctezuma believed Hernán Cortés to be the god **Quetzalcoatl**, returning from the east as prophesied, and that this belief paralysed him. Historians such as Matthew Restall and Camilla Townsend have shown that the identification of Cortés with Quetzalcoatl appears only in sources written decades after the conquest, mostly by Spanish friars and by Nahua writers in a colonial context, building on a self-serving speech about an awaited returning lord that Cortés put into Moctezuma's mouth in his letter of 1520; the story was probably elaborated afterwards to make sense of the defeat. Moctezuma's actions, receiving the Spanish with lavish diplomatic hospitality, are better explained by Mesoamerican customs of diplomacy and his attempt to assess and manage unknown and dangerous visitors.

## The Conquest

In 1519 **Hernán Cortés** landed on the Gulf coast with about 500 Spanish soldiers, horses, and cannon, in defiance of the governor of Cuba. Crucial to his success was a young Nahua woman, **Malintzin**, known as Doña Marina or La Malinche, who had been sold or given into slavery among the Maya and was given to the Spanish. Speaking Nahuatl and Maya, and soon Spanish, she became Cortés's interpreter, adviser, and the mother of his son.

Cortés allied with the **Tlaxcalans** and other enemies of the Mexica, who supplied tens of thousands of warriors. In November 1519 he entered Tenochtitlan and was received by Moctezuma, whom he soon took hostage. In May 1520, while Cortés was away, his deputy Pedro de Alvarado massacred Mexica nobles at a religious festival, provoking an uprising. Moctezuma was killed in June 1520, in circumstances that Spanish and Nahua sources describe differently. On the night of 30 June–1 July 1520, known to the Spanish as the **Noche Triste**, the Spanish fled the city, losing hundreds of Spaniards and thousands of their Indigenous allies.

Then **smallpox** struck. Brought by a member of a Spanish expedition, it swept through the Valley of Mexico in 1520, killing a large part of the population, probably including Moctezuma's successor Cuitláhuac. Cortés regrouped with his Indigenous allies, built boats to control the lake, and besieged Tenochtitlan from May 1521. After months of fighting, starvation, and disease, the city fell on 13 August 1521, and its last ruler, **Cuauhtémoc**, was captured.

Historians now stress that the conquest was won less by a few hundred Spaniards than by an alliance of tens of thousands of Indigenous warriors who sought to overthrow Mexica domination, together with the catastrophic effect of disease. Many of those allies would soon discover that the new rulers were worse.

{{image: Florentine Codex | An illustration from Book XII of the Florentine Codex, compiled by Bernardino de Sahagún with Nahua scholars, showing the conquest from a Nahua perspective.}}

## How We Know

The conquest is documented from both sides. On the Spanish side are Cortés's own letters to the emperor Charles V, which justify his actions, and the *True History of the Conquest of New Spain* by Bernal Díaz, written decades later. On the Nahua side, the most important source is the **Florentine Codex**, a twelve-book encyclopedia of Nahua life researched from 1545 and copied in its final form in about 1575–1577 by the Franciscan friar **Bernardino de Sahagún** with Nahua scholars and elders, in Nahuatl and Spanish, with illustrations. Its twelfth book tells the story of the conquest from the Nahua perspective. In 1959 the Mexican historian **Miguel León-Portilla** published a collection of such Nahua accounts, translated into English as *The Broken Spears*, which brought the "vision of the vanquished" to a wide audience. Nahua annals written in Nahuatl in the colonial period have since been used by historians such as Camilla Townsend to tell the story from Indigenous perspectives.

## The Aztec Afterlife

The Spanish built Mexico City on the ruins of Tenochtitlan, using its stones for churches and palaces. The lake was gradually drained. Yet the Aztec past never vanished. In colonial and modern Mexico, it became a source of identity. Mexican nationalists from the nineteenth century onwards celebrated Cuauhtémoc as a hero of resistance and placed the eagle and cactus on the national flag. Malintzin's reputation has been contested: the word *malinchismo* came to mean preferring the foreign over the Mexican, while feminist and Chicana writers have reclaimed her as a survivor and as the symbolic mother of a mixed, *mestizo* nation. In 1978 workers in central Mexico City uncovered a great stone disc showing the dismembered goddess Coyolxauhqui, leading to the excavation of the **Templo Mayor**, which can now be visited in the heart of the city that replaced Tenochtitlan.

```checkpoint
q: What did historians such as Restall and Townsend conclude about the story that Moctezuma thought Cortés was the god Quetzalcoatl?
a: That it was confirmed by contemporary Aztec records.
x: The Quetzalcoatl identification appears only in sources written decades after the conquest.
a*: That it appears only in later colonial sources and was probably invented afterwards to explain the defeat.
a: That Cortés himself invented it in his first letter.
x: Cortés's letters never claim he was taken for a god; the Quetzalcoatl story was added decades later.
a: That Moctezuma publicly declared Cortés a god.
x: There is no reliable contemporary evidence of this; his conduct fits Mesoamerican diplomacy.
hint: When were the sources containing the story written?
why: Source criticism shows how a later explanation of defeat became a durable myth.
---
q: Why do historians emphasise Indigenous allies and disease in explaining the fall of Tenochtitlan?
a: Because the Spanish army outnumbered the Mexica.
x: The Spanish were a few hundred; their Indigenous allies numbered tens of thousands.
a: Because the Mexica had no army.
x: The Mexica had a large, experienced army that defeated the Spanish on the Noche Triste.
a: Because the Mexica surrendered without fighting.
x: The siege lasted months, with fierce resistance.
a*: Because tens of thousands of Indigenous warriors, such as the Tlaxcalans, fought against the Mexica, and smallpox devastated the city's population and leadership.
hint: Who made up most of Cortés's forces?
why: The conquest was an Indigenous war in which the Spanish were a small but decisive part, amplified by epidemic disease.
```

## Further exploration

- **Camilla Townsend, *Fifth Sun: A New History of the Aztecs* (2019).** The Aztecs told through Nahuatl sources.
- **Matthew Restall, *When Montezuma Met Cortés* (2018).** A revisionist account of the encounter and its myths.
- **Miguel León-Portilla (ed.), *The Broken Spears: The Aztec Account of the Conquest of Mexico* (1962).** Nahua accounts of the conquest.
- **Inga Clendinnen, *Aztecs: An Interpretation* (1991).** A study of Mexica religion and society, including sacrifice.
- **Matthew Restall, *Seven Myths of the Spanish Conquest* (2003).** Popular myths about the conquest corrected.$aztec_master$,
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
  select $aztec_quiz$[
    {"type": "mcq", "prompt": "What were chinampas?", "options": ["Aztec temples", "Aztec warriors", "Spanish ships", "Artificial islands of mud and vegetation in the lake, used for intensive farming"], "answerIndex": 3, "explanation": "Chinampas produced several crops a year and fed Tenochtitlan's large population.", "id": "q1"},
    {"type": "mcq", "prompt": "Which neighbouring state was never conquered by the Triple Alliance and allied with Cortés?", "options": ["Texcoco", "Tlaxcala", "Tlacopan", "Tlatelolco"], "answerIndex": 1, "explanation": "The Tlaxcalans supplied tens of thousands of warriors to the Spanish.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the Florentine Codex?", "options": ["A twelve-book encyclopedia of Nahua life compiled by Sahagún with Nahua scholars, including a Nahua account of the conquest", "Cortés's letters to Charles V", "A Spanish law code", "A Maya calendar"], "answerIndex": 0, "explanation": "Its twelfth book tells the conquest from the Nahua perspective.", "id": "q3"},
    {"type": "mcq", "prompt": "When did Tenochtitlan fall?", "options": ["8 November 1519", "30 June 1520", "13 August 1521", "1325"], "answerIndex": 2, "explanation": "After a months-long siege, with smallpox and starvation devastating the city, Cuauhtémoc was captured on 13 August 1521.", "id": "q4"},
    {"type": "open", "prompt": "Why did the Aztec empire fall to a few hundred Spaniards? Evaluate the main explanations.", "rubric": "A strong answer explains the role of Indigenous allies (Tlaxcala and resentful tributaries), smallpox in 1520, Malintzin's role as interpreter, Spanish weapons and horses, and Mexica politics, and rejects the Quetzalcoatl myth using source criticism (Restall, Townsend). It reaches a reasoned conclusion that the conquest was largely an Indigenous war amplified by epidemic disease.", "id": "q5"},
    {"type": "open", "prompt": "How should historians interpret Aztec human sacrifice?", "rubric": "A strong answer explains the Mexica worldview (the Fifth Sun, debt to the gods, nourishing the sun), the evidence (archaeology of the Templo Mayor and Huei Tzompantli with over 600 skulls) and the problems with Spanish sources (exaggeration, implausible figures like 80,400). It discusses how to understand sacrifice in its religious and political context without excusing its violence.", "id": "q6"}
  ]$aztec_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/the-americas/moctezuma-s-mexico', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
