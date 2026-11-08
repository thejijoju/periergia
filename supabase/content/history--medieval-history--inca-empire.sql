-- The Inca Empire — canonical master article, co-written and human-reviewed.
-- history/medieval-history/the-americas/the-inca-empire @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- From Cuzco to empire, how the Inca state worked (roads, mit'a,
-- storehouses, khipu, resettlement), religion and capacocha, Machu Picchu,
-- epidemic and civil war, and the Spanish conquest to 1572.
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
    'history/medieval-history/the-americas/the-inca-empire',
    'research',
    'advanced',
    'read',
    $inca_master$> **The Inca empire**, which its people called **Tawantinsuyu**, "the four parts together", was the largest state in the Americas before 1492 and one of the largest in the world. In less than a century, from around 1438 to the 1520s, the Inca expanded from a small kingdom around Cuzco to rule perhaps ten million people along some 4,000 kilometres of the Andes, from Ecuador to central Chile. They did so without writing in the usual sense, without markets or money for most purposes, and without wheeled vehicles, using roads, storehouses, labour obligations, and knotted-cord records. Within a decade of the Spanish arrival, the empire was conquered. This chapter covers the rise of the Inca, how their state worked, their religion, Machu Picchu, the epidemic and civil war that preceded the conquest, and the conquest itself.

## From Cuzco to Empire

The Inca began as one of many small polities in the southern Andes, centred on **Cuzco**, in a high valley in modern Peru. According to Inca tradition, their rise began around 1438, when an attack on Cuzco by the neighbouring Chanka people was repelled by a prince who took the name **Pachacuti**, "he who overturns the world" or "earthquake". Pachacuti seized the throne, rebuilt Cuzco as an imperial capital, and launched the conquests that created the empire. His son **Topa Inca** and grandson **Huayna Capac** extended it north into Ecuador and south into Chile and Argentina. Inca chronology before the Spanish conquest depends on oral traditions recorded later, so these dates are approximate.

The Inca built on the long Andean traditions described in the chapter on the first civilizations of the Andes: vertical ecology, terracing, freeze-dried food, labour obligations, and khipu records, inherited from earlier states such as Wari and Tiwanaku.

## How the Inca State Worked

**Roads.** The Inca built a road network, the *Qhapaq Ñan*, of some 30,000 to 40,000 kilometres, running along the coast and through the mountains, with stairways cut into slopes, causeways across marshes, and suspension bridges woven from grass over gorges. One such bridge, at Q'eswachaka, is still rebuilt by local communities every year. Way stations called *tambos* provided lodging and supplies at regular intervals, and relay runners called **chasquis** carried messages and khipus across the empire, reportedly covering some 240 kilometres in a day.

**Labour, not money.** The Inca economy did not rely on markets or money for most purposes. Instead, subjects owed the state **labour**, a system called **mit'a**: households took turns working on state and religious lands, building roads and terraces, serving in the army, or producing cloth. In return, the state provided food, chicha (maize beer), and feasts, following Andean ideas of reciprocity.

**Storehouses.** The state stored food, cloth, and weapons in thousands of storehouses called *qollqa*, built in rows on hillsides where cool air helped preserve their contents. These stores supported armies, workers, and the population in bad years. Spanish soldiers were astonished by their abundance.

**Records.** Inca officials recorded census data, tribute, and stores on **khipus**, knotted cords, as the chapter on the Andes described, kept by specialists called *khipukamayuq*.

**Resettlement and language.** The Inca moved whole communities, called *mitmaqkuna*, from one region to another, to settle new lands, secure frontiers, and break up potential rebels. They spread **Quechua** as a common administrative language, which is why it is still spoken by millions of people in the Andes.

**Cloth.** Fine woven cloth, *cumbi*, was among the most valuable goods in the empire, given as gifts to secure loyalty. Much of it was woven by the *aqllakuna*, "chosen women", selected young and trained in temples.

{{image: Qhapaq Ñan | A section of the Inca road network, the Qhapaq Ñan, which ran some 30,000 to 40,000 kilometres through the Andes.}}

```checkpoint
q: How did the Inca state obtain the labour and goods it needed without relying on money or markets?
a*: Through the mit'a, a system of rotating labour obligations owed by households, with the state providing food, drink, and feasts in return.
a: By paying workers in gold coins.
x: The Inca did not use coinage; gold was used for religious and royal objects.
a: By importing slaves from Africa.
x: The Inca had no contact with Africa before the Spanish conquest.
a: By trading with the Aztec empire.
x: There is no evidence of direct contact between the Inca and Aztec empires.
hint: Think of reciprocity and rotating work.
why: The Inca built their state on labour obligations and reciprocity, an economic system very different from those based on markets and money.
---
q: Why did the Inca resettle whole communities as mitmaqkuna?
a: To punish all their subjects equally.
x: Resettlement served specific strategic and economic purposes, not general punishment.
a: Because their capital was flooded every year.
x: Resettlement had political and economic aims, not flood relief.
a*: To settle new lands, secure frontiers, and break up potential rebellions by moving communities to new regions.
a: Because the Spanish ordered it.
x: The practice predates the Spanish conquest.
hint: Compare it with Assyrian deportations.
why: Moving populations was a tool of imperial control and development, used by empires from Assyria to the Inca.
```

## Religion, Mummies, and Sacrifice

The Inca ruler, the **Sapa Inca**, claimed descent from **Inti**, the sun god. The most sacred temple in Cuzco, the **Coricancha**, was dedicated to the sun, its walls reportedly covered with sheets of gold. Andean religion also honoured *huacas*, sacred places, objects, and ancestors, including mountains, springs, and stones.

Dead rulers were mummified and continued to be treated as living: they kept their palaces, lands, and servants, were consulted on important matters, and were brought out for festivals. Because a new ruler did not inherit his predecessor's property, which remained with the dead king's mummy and his lineage, each new Sapa Inca needed to conquer new lands to acquire wealth of his own. Some historians, such as Geoffrey Conrad and Arthur Demarest, have argued that this **split inheritance** helped drive Inca expansion.

The Inca also practised human sacrifice, though on a smaller scale than the Mexica. In the **capacocha** ceremony, selected children were taken to Cuzco and then to high mountain summits, where they were sacrificed. In 1999 archaeologists found three children's bodies, frozen and extremely well preserved, near the summit of the volcano Llullaillaco in Argentina, at more than 6,700 metres, about 500 years after their deaths.

## Machu Picchu

The most famous Inca site, **Machu Picchu**, stands on a ridge above the Urubamba river. It was built, probably in the mid-fifteenth century, as a royal estate, likely for Pachacuti, with palaces, temples, and terraces, and may have housed several hundred people. A study of radiocarbon dates published in 2021 suggested that it was occupied from around 1420, earlier than previously thought. The site was abandoned after the Spanish conquest; the Spanish apparently never found it. It was publicised internationally in 1911 by the American explorer **Hiram Bingham**, though local farmers had known it all along, and objects Bingham removed to Yale University were returned to Peru only between 2011 and 2012.

## Epidemic and Civil War

Before the Spanish arrived in Peru, their diseases did. Around the 1520s, an epidemic, probably **smallpox**, spread south from Central America. It killed **Huayna Capac**, the Sapa Inca, and his designated heir. Two of his sons, **Huáscar**, based in Cuzco, and **Atahualpa**, commanding the northern armies in Ecuador, fought a devastating civil war for the throne. Atahualpa's generals won and captured Huáscar just as the Spanish appeared.

## The Spanish Conquest

In 1532 **Francisco Pizarro** led about 168 Spanish soldiers into the Inca empire. On 16 November 1532, at **Cajamarca**, Atahualpa, fresh from victory and accompanied by thousands of unarmed attendants, met the Spanish in the town square. A friar presented him with a breviary and demanded his submission to Christianity and the Spanish king; when Atahualpa reportedly let the book fall, the hidden Spanish soldiers attacked with cannon, horses, and steel, killing thousands and capturing the Sapa Inca.

Atahualpa offered a ransom for his release: a room filled once with gold and twice with silver. The Spanish collected it, melting down masterpieces of Inca metalwork, and then, in July 1533, executed him. They marched on Cuzco and installed a puppet ruler, **Manco Inca**. In 1536 Manco rebelled and besieged Cuzco for months, then withdrew to the remote region of **Vilcabamba**, where an independent Inca state survived until 1572, when the Spanish captured and executed its last ruler, **Túpac Amaru**.

The conquest was made possible by the epidemic, the civil war, which divided the Inca and gave the Spanish allies among Huáscar's supporters and among peoples resentful of Inca rule, and Spanish military technology and ruthlessness. The population of the Andes collapsed over the following century from disease, war, and the harsh demands of colonial rule, including a Spanish version of the mit'a that forced Andean people to work in the silver mines of **Potosí**, as later chapters describe. Yet Andean culture, language, and religion survived and adapted, and Quechua and Aymara remain living languages spoken by millions.

```checkpoint
q: How did the epidemic of the 1520s help make the Spanish conquest of the Inca possible?
a: It killed all the Inca soldiers, leaving no army.
x: The Inca still had large armies; the epidemic's main political effect was the succession crisis.
a*: It killed the Sapa Inca Huayna Capac and his heir, leading to a civil war between Huáscar and Atahualpa that divided the empire just as the Spanish arrived.
a: It infected the Spanish, making them immune to Inca weapons.
x: Immunity to disease has nothing to do with weapons; the point is the effect on Inca politics.
a: It was deliberately spread by Pizarro.
x: The epidemic spread south ahead of the Spanish, before Pizarro's expedition.
hint: Who died, and what happened next?
why: Disease removed the ruler and his heir, triggering a civil war that the Spanish could exploit.
---
q: What happened to Atahualpa after he was captured at Cajamarca?
a: He was released after the ransom was paid and ruled until his death.
x: The Spanish collected the ransom but did not release him.
a: He escaped to Vilcabamba and founded an independent state.
x: Vilcabamba was the refuge of Manco Inca and his successors, after Atahualpa's death.
a: He converted to Christianity and became king of Spain.
x: Atahualpa never ruled Spain; he was executed in Peru.
a*: He paid a vast ransom in gold and silver, but the Spanish executed him in July 1533.
hint: Think of the room filled with gold.
why: The ransom and execution show the Spanish combination of greed and ruthlessness that marked the conquest.
```

## Further exploration

- **Terence N. D'Altroy, *The Incas* (2nd ed., 2014).** The standard scholarly account of the Inca empire.
- **Kim MacQuarrie, *The Last Days of the Incas* (2007).** A narrative of the conquest and the Vilcabamba resistance.
- **John Hemming, *The Conquest of the Incas* (1970).** The classic history of the conquest.
- **Gary Urton, *Inka History in Knots* (2017).** Khipus and Inca record-keeping.
- **Felipe Guaman Poma de Ayala, *The First New Chronicle and Good Government* (c. 1615).** An illustrated Andean account of Inca and colonial society.$inca_master$,
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
  select $inca_quiz$[
    {"type": "mcq", "prompt": "What does Tawantinsuyu mean?", "options": ["Land of gold", "City of the sun", "The four parts together", "Great road"], "answerIndex": 2, "explanation": "The Inca called their empire Tawantinsuyu, divided into four quarters meeting at Cuzco.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the mit'a?", "options": ["A system of rotating labour obligations owed to the state", "A gold coin", "A type of suspension bridge", "The Inca sun temple"], "answerIndex": 0, "explanation": "Households took turns working for the state in return for food, drink, and feasts.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Hiram Bingham do in 1911?", "options": ["Built Machu Picchu", "Publicised Machu Picchu internationally, though local farmers had always known it", "Captured Atahualpa", "Deciphered the khipu"], "answerIndex": 1, "explanation": "Objects Bingham took to Yale were returned to Peru only in 2011–2012.", "id": "q3"},
    {"type": "mcq", "prompt": "Where did an independent Inca state survive until 1572?", "options": ["Cuzco", "Cajamarca", "Quito", "Vilcabamba"], "answerIndex": 3, "explanation": "After Manco Inca's rebellion, the Inca held out at Vilcabamba until the execution of Túpac Amaru.", "id": "q4"},
    {"type": "open", "prompt": "How did the Inca govern a vast empire without writing, money, or wheeled vehicles?", "rubric": "A strong answer explains the road network and tambos, chasquis, khipus and khipukamayuq, the mit'a and reciprocity, storehouses, mitmaqkuna resettlement, Quechua as a common language, cloth as a political gift, and religion and royal mummies, drawing on earlier Andean traditions. Better answers compare with other empires (Assyria, Persia, Rome).", "id": "q5"},
    {"type": "open", "prompt": "Explain how disease, civil war, and Spanish action together brought down the Inca empire.", "rubric": "A strong answer explains the 1520s epidemic killing Huayna Capac and his heir, the civil war between Huáscar and Atahualpa, Pizarro's 168 men at Cajamarca and the capture of Atahualpa, the ransom and execution, the installation and rebellion of Manco Inca, Vilcabamba until 1572, and the allies the Spanish found among Inca enemies. It reaches a reasoned conclusion about the relative importance of factors.", "id": "q6"}
  ]$inca_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/the-americas/the-inca-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
