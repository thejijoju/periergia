-- The Columbian Exchange and the First Global Economy — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/new-world-economy @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Crops, animals, and diseases; Potosí and where its silver went; sugar
-- and the plantation complex; from Indigenous to African labour;
-- mercantilism and new institutions; and unequal transformations across
-- four continents.
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
    'history/renaissance-and-reformation/new-world-economy',
    'research',
    'advanced',
    'read',
    $exchange_master$> **The Columbian exchange**, a term coined by the historian Alfred Crosby in 1972, describes the transfer of plants, animals, diseases, and people between the Eastern and Western Hemispheres after 1492. Together with the flows of American silver that followed, it created the first truly global economy. Maize and cassava became staples in Africa, sweet potatoes fed a population boom in China, chillies transformed the cuisines of India, Korea, and Thailand, horses transformed life on the American plains, and silver mined largely by Indigenous labour, much of it forced, in the Andes paid for Chinese silk and Indian cotton. This chapter follows these exchanges, the silver of Potosí and where it went, sugar and the plantation complex, the turn from Indigenous to African labour, the commercial institutions of the Atlantic economy, and how the new world economy transformed Africa, Asia, Europe, and the Americas.

## Crops and Animals

The hemispheres had been separated for more than ten thousand years, and each had domesticated its own plants and animals, as the chapter on the Neolithic Revolution described. After 1492 they were mixed on a global scale.

From the Americas to the rest of the world went **maize**, **potatoes**, **cassava** (manioc), **sweet potatoes**, **tomatoes**, **chilli peppers**, **peanuts**, **beans**, **squash**, **cacao**, and **tobacco** (the sweet potato had already reached Polynesia centuries earlier, by about 1000–1200 CE, as the chapter on Pacific voyagers describes). Their impact was enormous:

- In **Africa**, maize and cassava, brought by Portuguese traders, became major staple crops, and remain among the most important foods on the continent today.
- In **China**, maize and sweet potatoes, which grow on hillsides and poor soils where rice cannot, helped support a population that roughly doubled in the eighteenth century, from about 150–160 million in 1700, after the losses of the Ming–Qing transition, to about 300 million by 1800, and allowed settlement of upland regions, with environmental costs such as deforestation and erosion.
- In **South and Southeast Asia**, chilli peppers became central to cuisines from India to Thailand, and in **Korea**, chillies, unknown there until the early seventeenth century, later became essential to kimchi.
- In **Europe**, potatoes, which produce more calories per hectare than grain, fed growing populations, especially in Ireland and northern Europe, from the eighteenth century, with tragic consequences when blight struck in the 1840s.

From the Eastern Hemisphere to the Americas went **wheat**, **rice**, **sugar cane**, **bananas**, and later **coffee**, and domestic animals: **horses**, **cattle**, **pigs**, **sheep**, **goats**, and **chickens**. Livestock multiplied on the grasslands of the Americas, often trampling Indigenous fields. Horses transformed the lives of peoples on the North American plains, such as the **Comanche** and Lakota. Horses spread to Plains peoples through Indigenous trade by the early 1600s, earlier than once thought, and by the eighteenth and nineteenth centuries such peoples had become formidable mounted hunters and warriors.

The most devastating exchange was of **diseases**, as the chapter on the conquest of the Americas described. Smallpox, measles, influenza, and other Afro-Eurasian diseases killed the majority of the Indigenous population of the Americas, while the exchange in the other direction was far smaller; ancient-DNA studies published in 2024 point strongly to an American origin for the syphilis bacterium's family, though how it reached Europe in the 1490s is still discussed.

```checkpoint
q: Why did maize and sweet potatoes matter so much in China?
a*: Because they grew on hillsides and poor soils where rice could not, helping support a population that roughly doubled in the eighteenth century and allowing settlement of upland regions.
a: Because they replaced rice entirely.
x: Rice remained central; American crops supplemented it.
a: Because they were used only to feed horses.
x: They were important human foods in China.
a: Because they were brought to China by Zheng He.
x: Zheng He's voyages ended before 1492; American crops arrived later, mainly through Spanish and Portuguese trade.
hint: Think about land where rice cannot grow.
why: American crops expanded the land that could be farmed, contributing to China's population growth, with environmental costs.
---
q: How did horses transform life for peoples such as the Comanche?
a: Horses were native to the Americas and always used.
x: Horses had gone extinct in the Americas long before and were reintroduced by Europeans.
a: Horses made them settle down as farmers.
x: Horses generally encouraged mobile hunting and raiding on the plains rather than settled farming.
a*: Reintroduced horses allowed peoples of the plains to become formidable mounted hunters and warriors in the eighteenth century.
a: Horses carried European diseases that wiped them out.
x: The horse culture of the plains flourished for over a century before the US military and settler expansion.
hint: Think of mounted bison hunting.
why: The Columbian exchange empowered some Indigenous peoples even as it devastated others.
```

## Potosí and the Silver That Circled the World

In 1545 Spanish colonists, guided by an Indigenous man, identified a mountain of silver ore, the **Cerro Rico**, "Rich Mountain", at **Potosí** in the high Andes of modern Bolivia. Within decades Potosí had become the largest city in the Americas, comparable to the great cities of Europe, with a population of perhaps 120,000–160,000 or more in the early seventeenth century, at over 4,000 metres above sea level. Together with mines at Zacatecas in Mexico, Potosí made Spanish America the world's main source of silver for three centuries.

The silver was extracted largely by Indigenous labour, forced through the mit'a and alongside it by paid and contract workers. In the 1570s the viceroy Francisco de Toledo reorganised the old Inca labour tax, the **mit'a**, described in the chapter on the Inca, into a colonial draft that forced thousands of Andean men each year to work in the mines of Potosí, under brutal and dangerous conditions. Refining used **mercury**, mined at Huancavelica in Peru, which poisoned workers. Potosí became a symbol of fabulous wealth, "worth a Potosí" meant priceless in Spanish, and of the human cost of colonial extraction.

Where did the silver go? Much was shipped to **Seville**, where it paid for Spain's wars and debts and flowed on through Europe to bankers in Genoa and Antwerp. But much of it ended up in **Asia**. Europeans had little that Asian consumers wanted, except silver, so silver flowed east to pay for Chinese silk and porcelain, Indian cotton textiles, and spices. Some went directly across the Pacific on the **Manila galleons**, which crossed the Pacific from 1565 and ran between Acapulco and Manila from its founding in 1571, to be exchanged with Chinese merchants, as the chapter on Ming China described. Historians estimate that between a third and a half of the silver mined in the Americas ended up in China, drawn there by the Ming's demand for silver for taxes and trade.

In Europe, the influx of silver, together with population growth, contributed to the **Price Revolution**, a long rise in prices across the sixteenth century, when prices in western Europe roughly tripled or quadrupled; how much was caused by silver and how much by population growth is debated.

{{image: Potosí | An early depiction of the Cerro Rico of Potosí, the silver mountain worked by forced Indigenous labour under the colonial mit'a.}}

## Sugar and the Plantation Complex

**Sugar** cane, domesticated in New Guinea and spread through India and the Islamic world, had been grown with enslaved and unfree labour in the Mediterranean and then on the Atlantic islands, as earlier chapters described. In the Americas it became the basis of what the historian **Philip Curtin** called the **plantation complex**: large estates producing a single export crop, using huge numbers of enslaved workers, owned by a small elite, and dependent on long-distance trade.

The first great sugar economy was **Brazil**, in Pernambuco and Bahia, which by around 1600 was the world's largest sugar producer. In the seventeenth century the plantation complex spread to the Caribbean, beginning with the English colony of **Barbados** in the 1640s, a transformation known as the "sugar revolution", and then to Jamaica, the French colony of Saint-Domingue, and Cuba. Sugar made fortunes for planters and merchants and transformed European diets, as a luxury became a mass commodity.

## From Indigenous to African Labour

Colonists first relied on Indigenous labour, through enslavement, the encomienda, and later labour drafts such as the mit'a and the Mexican *repartimiento*. As Indigenous populations collapsed, Spanish laws restricted Indigenous enslavement, and in Brazil and the Caribbean, planters turned increasingly to **enslaved Africans**, who had some immunity to Afro-Eurasian diseases and could be bought through the Atlantic slave trade, as the next chapter describes. This turn created the racialised system of Atlantic slavery, in which African descent came to be identified with enslavement.

## Mercantilism and New Institutions

European governments sought to profit from colonial trade through policies later called **mercantilism**: the belief that a nation's wealth depended on accumulating precious metals and running a trade surplus, and that colonies existed to supply raw materials and buy the mother country's goods. Laws such as England's **Navigation Acts** (from 1651) required colonial trade to be carried in English ships. The so-called **triangular trade**, carrying European manufactures to Africa, enslaved Africans to the Americas, and sugar, tobacco, and other produce to Europe, is a simplification of complex trade patterns, but it captures how the Atlantic economy linked three continents.

The Atlantic and Asian trades also produced new commercial institutions. The Dutch **VOC**, founded in 1602, was the first company whose shares were traded publicly on a permanent stock exchange, the **Amsterdam Exchange**, and the Bank of Amsterdam, founded in 1609, became a model of public banking. Marine insurance spread risk on long voyages. These institutions helped make the Dutch Republic the leading commercial power of the seventeenth century, as later chapters describe.

## A Transformed World

The new world economy transformed every continent, but unequally:

- **The Americas** suffered demographic collapse, colonisation, and the creation of plantation and mining economies dependent on forced labour, alongside the emergence of new, mixed societies.
- **Africa** gained new crops, maize and cassava, that became staples, while millions of its people were taken in the Atlantic slave trade. African merchants imported Indian textiles, European metals and guns, and cowrie shells from the Maldives, long used as currency in West Africa and now shipped there in vast quantities.
- **Asia**, above all China and India, drew in vast quantities of silver for its manufactured goods, a sign of Asian economic strength in this period.
- **Europe** gained silver, sugar, new foods, and new commercial institutions, and its Atlantic powers grew rich from colonial trade. Historians such as Kenneth Pomeranz have argued that the land and resources of the Americas, the "ghost acres" in Pomeranz's phrase, later gave Europe an advantage that helped it industrialise, a debate discussed in later chapters.

```checkpoint
q: Why did so much American silver end up in China?
a: Because China conquered the Spanish colonies.
x: China never conquered Spanish America; the silver arrived through trade.
a*: Because Ming China's economy and taxes ran on silver, and Europeans used silver to pay for Chinese silk and porcelain, partly via the Manila galleons.
a: Because silver was worthless in Europe.
x: Silver was valuable in Europe, but it bought more in China, where demand was high.
a: Because the Inca had traded silver to China before 1492.
x: There was no trade between the Inca and China before the Spanish conquest.
hint: Recall the Single Whip reform and the Manila galleons.
why: Chinese demand for silver drew American silver across the world, making China central to the first global economy.
---
q: What was the plantation complex?
a: A system of small family farms growing many crops for local use.
x: The plantation complex was the opposite: large estates producing a single export crop.
a: A Chinese system of rice farming.
x: The term describes Atlantic plantation economies, not Chinese rice farming.
a: A type of Inca storehouse.
x: Inca storehouses were qollqa; the plantation complex was a colonial Atlantic system.
a*: Large estates producing a single export crop such as sugar, using large numbers of enslaved workers, owned by a small elite, and dependent on long-distance trade.
hint: Think of Brazil and Barbados.
why: The plantation complex combined monoculture, enslaved labour, and global trade, shaping the Atlantic world for centuries.
```

## Further exploration

- **Alfred W. Crosby, *The Columbian Exchange: Biological and Cultural Consequences of 1492* (1972).** The book that named the exchange.
- **Charles C. Mann, *1493: Uncovering the New World Columbus Created* (2011).** A popular global account.
- **Kris Lane, *Potosí: The Silver City That Changed the World* (2019).** The history of Potosí and its global reach.
- **Sidney W. Mintz, *Sweetness and Power: The Place of Sugar in Modern History* (1985).** Sugar, slavery, and consumption.
- **Philip D. Curtin, *The Rise and Fall of the Plantation Complex: Essays in Atlantic History* (2nd ed., 1998).** The plantation complex from the Mediterranean to the Americas.$exchange_master$,
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
  select $exchange_quiz$[
    {"type": "mcq", "prompt": "Who coined the term 'Columbian exchange'?", "options": ["Christopher Columbus", "Adam Smith", "Alfred Crosby, in 1972", "Eric Williams"], "answerIndex": 2, "explanation": "Crosby's book named the transfer of plants, animals, diseases, and people between the hemispheres.", "id": "q1"},
    {"type": "mcq", "prompt": "Which American crops became major staples in Africa?", "options": ["Maize and cassava", "Wheat and rice", "Coffee and sugar", "Barley and oats"], "answerIndex": 0, "explanation": "Brought by Portuguese traders, maize and cassava remain among Africa's most important foods.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the colonial mit'a at Potosí?", "options": ["A voluntary wage system", "A tax paid in gold", "A Spanish religious festival", "A forced labour draft that compelled thousands of Andean men each year to work in the silver mines"], "answerIndex": 3, "explanation": "Viceroy Toledo adapted the Inca labour tax in the 1570s into a brutal draft for the mines.", "id": "q3"},
    {"type": "mcq", "prompt": "Which company was the first to have its shares traded publicly on a permanent stock exchange?", "options": ["The English East India Company", "The Dutch VOC", "The Casa de Contratación", "The Hanseatic League"], "answerIndex": 1, "explanation": "Founded in 1602, the VOC's shares traded on the Amsterdam Exchange.", "id": "q4"},
    {"type": "open", "prompt": "Follow the silver of Potosí: who mined it, where did it go, and who benefited?", "rubric": "A strong answer explains the 1545 discovery, the mit'a draft and mercury poisoning, Potosí's size; the flow to Seville, Spain's wars and debts, and European bankers; the Price Revolution debate; and the flow to Asia to pay for silk, porcelain, and Indian cottons, including the Manila galleons and the estimate that between a third and a half reached China. It concludes about the unequal distribution of costs and benefits.", "id": "q5"},
    {"type": "open", "prompt": "How did the Columbian exchange transform Africa, Asia, Europe, and the Americas differently?", "rubric": "A strong answer covers the Americas (demographic collapse, plantations and mines, horses for plains peoples), Africa (maize and cassava, the slave trade, imports of textiles and cowries), Asia (sweet potatoes and maize in China, chillies, silver flowing in for manufactures), and Europe (silver, sugar, potatoes, new institutions, Pomeranz's 'ghost acres'). It explains why the effects were unequal.", "id": "q6"}
  ]$exchange_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/new-world-economy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
