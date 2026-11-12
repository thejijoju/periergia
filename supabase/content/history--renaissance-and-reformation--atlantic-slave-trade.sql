-- The Atlantic Slave Trade — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/the-atlantic-slave-trade @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Beginnings, how the trade worked in Africa, the Middle Passage, the
-- Slave Voyages database and destinations, voices of the enslaved, effects
-- on Africa (Rodney, Nunn), and the Williams thesis.
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
    'history/renaissance-and-reformation/the-atlantic-slave-trade',
    'research',
    'advanced',
    'read',
    $slavetrade_master$> **The Atlantic slave trade** was the largest long-distance forced migration in history. Between the early sixteenth and mid-nineteenth centuries, about 12.5 million Africans were forced onto ships bound for the Americas, and about 10.7 million survived the crossing. The trade built the plantation economies of Brazil and the Caribbean, shaped the societies of the Americas, and had profound and lasting effects on Africa. This chapter covers its beginnings, how it worked on the African coast and at sea, what the database of slave voyages has revealed, where the captives went, the voices of the enslaved, the trade's effects on Africa, and the debate over whether it financed Britain's industrial revolution.

## Beginnings

As earlier chapters described, slavery and slave trading were ancient and widespread, and Africans had been carried north across the Sahara and east across the Indian Ocean for centuries. The Atlantic trade grew from the Portuguese voyages along the African coast in the fifteenth century. In 1444 the first large group of enslaved Africans was landed and sold at Lagos in Portugal. On the island of **São Tomé**, in the Gulf of Guinea, the Portuguese established sugar plantations worked by enslaved Africans by the early sixteenth century, a model for what followed.

The first enslaved Africans were taken to the Americas in the early sixteenth century, as Indigenous populations collapsed. The first known direct voyage from Africa to the Americas sailed in 1519, and regular direct shipments from São Tomé began in 1525. The trade grew slowly at first, then rapidly with the expansion of sugar in Brazil from the late sixteenth century and in the Caribbean from the mid-seventeenth. It reached its peak in the eighteenth century, when more than six million people were taken.

## How the Trade Worked in Africa

European traders did not, for the most part, capture people themselves. For most of the trade's history, and outside Portuguese Angola, Europeans were confined to coastal forts and trading posts, such as **Elmina** in modern Ghana and the island of **Gorée** off Senegal, a small post whose fame today exceeds its role in the trade, and depended on African rulers and merchants, who controlled the supply of captives and set the terms of trade.

People were enslaved in Africa in several ways: as prisoners of war, through raids and kidnapping, as punishment for crimes, through debt, and sometimes as tribute. Powerful states such as **Dahomey**, **Asante**, and **Oyo** sold war captives, while the civil wars of the **Kongo** kingdom (1665–1709) produced many captives. Some rulers tried to limit the trade: the kingdom of **Benin** restricted the sale of male captives for long periods, from the early sixteenth century to the late seventeenth, and Afonso I of Kongo protested against it, as the chapter on European expansion described.

African merchants exchanged captives for goods they valued: above all **textiles**, especially Indian cottons; iron and copper bars; guns and gunpowder; alcohol; and **cowrie shells** from the Maldives, used as currency. The historian **John Thornton** has stressed that African states and merchants were active participants who controlled the trade on the African side, while others, such as Joseph Inikori and Paul Lovejoy, emphasise how European demand, and the guns it supplied, drove warfare and slaving and transformed African politics. Both perspectives can be true: African elites participated, and the trade's victims were overwhelmingly African.

## The Middle Passage

Captives were marched to the coast, often over long distances, and held in forts or pens, sometimes for months, before being packed into ships for the voyage across the Atlantic, known as the **Middle Passage**. Conditions were horrific: people were chained below deck in crowded, airless spaces, with inadequate food and water; disease, especially dysentery, spread rapidly. On average around 12 to 15 per cent of captives died during the crossing, falling somewhat over time, with much higher losses on some voyages. Many more died before embarkation (Patrick Manning estimates some 4 million deaths inside Africa after capture) and in the first months after arrival.

Resistance was constant. Captives refused food, jumped overboard, and revolted; historians estimate that around one in ten voyages experienced a revolt, as the next chapter describes. In 1781 the crew of the British ship *Zong* threw more than 130 Africans overboard, claiming a shortage of water, and the owners then claimed insurance for them as lost cargo; the case, which treated people as cargo, became a cause for abolitionists.

```checkpoint
q: Who controlled the supply of captives on the African side for most of the trade's history?
a*: African rulers and merchants, who controlled the supply and set the terms of trade, while European demand and guns shaped warfare and slaving.
a: European soldiers who conquered the African interior.
x: Apart from Portuguese Angola, Europeans were largely confined to coastal forts and did not conquer the interior until the nineteenth century.
a: Ottoman officials.
x: The Ottomans were not involved in the Atlantic trade on the West African coast.
a: The enslaved people themselves.
x: Captives were victims of the trade, not its controllers.
hint: Think of Dahomey, Asante, and Oyo.
why: Recognising African participation and European demand together gives a fuller picture than either alone.
---
q: What was the Middle Passage?
a: A trade route through the Mediterranean.
x: The Middle Passage was the Atlantic crossing of enslaved Africans.
a: A treaty between Portugal and Spain.
x: That describes Tordesillas, not the Middle Passage.
a*: The forced voyage of enslaved Africans across the Atlantic, in horrific conditions in which, on average, around 12 to 15 per cent died.
a: A route used by Indigenous Americans.
x: The term refers to the transatlantic slave voyage.
hint: Think of the "middle" leg of the so-called triangular trade.
why: The Middle Passage was the deadliest stage of the trade and a central symbol of its cruelty.
```

## Counting the Trade

For a long time the scale of the trade was a matter of guesswork, with estimates ranging widely. The **Slave Voyages** database, developed by historians including David Eltis and David Richardson and now available online, has compiled records of more than 36,000 voyages, perhaps three-quarters or more of all voyages. It has made possible far more reliable estimates: about **12.5 million** people embarked, and about **10.7 million** arrived (David Eltis has since revised the embarkation figure to about 12.75 million).

The database revealed the trade's geography. The largest single destination was **Brazil**, which received nearly half of all captives, around 4.8 million. The **Caribbean** received most of the rest, with the British Caribbean receiving over two million and the French Caribbean and Spanish America over a million each. Mainland **North America**, the future United States, received only about 400,000, less than 4 per cent; its large enslaved population grew mainly through natural increase, in sharp contrast to the Caribbean and Brazil, where death rates on sugar plantations were so high that populations could be maintained only by constant imports.

The database also showed where captives came from: mainly **West Central Africa** (Kongo and Angola), which supplied nearly half, the **Bight of Benin**, the **Bight of Biafra**, and the **Gold Coast**. Portuguese and Brazilian ships carried the most people, followed by British, French, Spanish, and Dutch ships.

## Voices of the Enslaved

Most enslaved people left no written record, but some did. **Olaudah Equiano** published *The Interesting Narrative* in 1789, describing his capture as a child in Igbo country in modern Nigeria, the Middle Passage, enslavement, and his eventual freedom; the historian Vincent Carretta has questioned whether he was born in Africa or in South Carolina, a debate that does not diminish the book's importance. **Ottobah Cugoano**, from the Gold Coast, published an attack on slavery in 1787. **Omar ibn Said**, a Muslim scholar from Senegambia enslaved in North Carolina, wrote an autobiography in Arabic in 1831. These voices, along with songs, oral traditions, religious practices, and archaeology, allow historians to see the trade from the perspective of its victims.

## Effects on Africa

What did the trade do to Africa? The question has been intensely debated.

In *How Europe Underdeveloped Africa* (1972), the Guyanese historian **Walter Rodney** argued that the slave trade and later colonialism drained Africa of people, encouraged warfare, and distorted economies, laying foundations for Africa's later underdevelopment. Demographic historians such as Patrick Manning estimated that the population of western Africa stagnated or declined during the peak of the trade, between about 1750 and 1850, while it would otherwise have grown. More recently, economists such as **Nathan Nunn** have found that the African regions from which the most people were taken are, on average, poorer today, and, with Leonard Wantchekon, that people in those regions show lower levels of trust, plausibly because the trade spread insecurity, betrayal, and kidnapping, sometimes by neighbours and relatives; these findings are themselves debated.

Others have stressed the agency and resilience of African societies, the variety of experiences across regions, and the role of African elites, some of whom grew rich and powerful from the trade. The debate continues, but most historians agree the trade had deep and largely damaging effects on many African societies.

## The Williams Thesis

In *Capitalism and Slavery* (1944), the Trinidadian historian **Eric Williams**, later the first prime minister of independent Trinidad and Tobago, argued that the profits of the slave trade and slave plantations helped finance Britain's industrial revolution, and that Britain abolished the trade and slavery not mainly for humanitarian reasons but because slavery had become less profitable.

Both parts of the thesis have been challenged. Some economic historians argued that slave-trade profits were too small to finance industrialisation. The historian Seymour Drescher, in *Econocide* (1977), argued that the British slave economy was still profitable when abolition came, so that abolition was an economic sacrifice driven by political and moral forces; others, such as David Beck Ryden, have since found evidence of a profitability crisis. In recent decades historians of capitalism have revived interest in the broader links Williams identified, between slavery, cotton, finance, insurance, and industry, and in the role of the enslaved themselves in bringing about abolition, a role Williams himself had stressed, the subject of the next chapter.

```checkpoint
q: What did the Slave Voyages database reveal about where enslaved Africans were taken?
a: That most were taken to North America.
x: Mainland North America received only about 4 per cent of captives.
a*: That Brazil received nearly half, the Caribbean most of the rest, and mainland North America less than 4 per cent.
a: That most were taken to Europe.
x: Relatively few enslaved Africans were taken to Europe compared with the Americas.
a: That the numbers were evenly spread across the Americas.
x: The distribution was highly uneven, concentrated in Brazil and the Caribbean.
hint: Think about sugar.
why: Quantitative evidence corrected a North American-centred view, showing the trade's centre in Brazil and the Caribbean.
---
q: What did Eric Williams argue in Capitalism and Slavery?
a: That slavery played no role in British economic history.
x: Williams argued the opposite, linking slavery to industrialisation.
a: That Britain never took part in the slave trade.
x: Britain was one of the largest slave-trading nations.
a: That African rulers abolished the slave trade.
x: Williams focused on British economic interests, not African abolition.
a*: That profits from slavery helped finance Britain's industrial revolution, and that abolition came mainly when slavery became less profitable.
hint: Think about the title.
why: Williams's thesis linked slavery and capitalism; critics such as Drescher challenged it, but the links he identified remain central to research.
```

## Further exploration

- **David Eltis and David Richardson, *Atlas of the Transatlantic Slave Trade* (2010).** Maps and data from the Slave Voyages database.
- **Marcus Rediker, *The Slave Ship: A Human History* (2007).** The Middle Passage and life on slave ships.
- **John Thornton, *Africa and Africans in the Making of the Atlantic World, 1400–1800* (2nd ed., 1998).** African agency in the Atlantic world.
- **Walter Rodney, *How Europe Underdeveloped Africa* (1972).** A classic and influential argument.
- **Olaudah Equiano, *The Interesting Narrative* (1789).** One of the most important first-person accounts of the trade.$slavetrade_master$,
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
  select $slavetrade_quiz$[
    {"type": "mcq", "prompt": "About how many Africans were forced onto ships in the Atlantic slave trade, and how many survived the crossing?", "options": ["1.2 million embarked, 1 million arrived", "50 million embarked, 40 million arrived", "3 million embarked, 2.5 million arrived", "12.5 million embarked, about 10.7 million arrived"], "answerIndex": 3, "explanation": "Estimates from the Slave Voyages database put embarkations at about 12.5 million and arrivals at about 10.7 million.", "id": "q1"},
    {"type": "mcq", "prompt": "Which destination received the largest share of enslaved Africans?", "options": ["Mainland North America", "Brazil", "Spain", "The Philippines"], "answerIndex": 1, "explanation": "Brazil received nearly half of all captives; mainland North America less than 4 per cent.", "id": "q2"},
    {"type": "mcq", "prompt": "Which kingdom restricted the sale of male captives for long periods?", "options": ["Benin", "Dahomey", "Asante", "Oyo"], "answerIndex": 0, "explanation": "Benin's restrictions show that African rulers made choices about participation in the trade.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Nathan Nunn's research find about regions most affected by the slave trade?", "options": ["They are richer today", "There is no measurable effect", "They are, on average, poorer today, and people there show lower levels of trust", "They became the capitals of colonial states"], "answerIndex": 2, "explanation": "The findings support arguments that the trade had long-term damaging effects on many African societies.", "id": "q4"},
    {"type": "open", "prompt": "Who was responsible for the Atlantic slave trade? Discuss the roles of European and African actors.", "rubric": "A strong answer explains European demand, ships, capital, and plantation economies; European confinement to coastal forts; African rulers and merchants who controlled supply and set terms (Dahomey, Asante, Oyo, Kongo), Benin's restrictions and Afonso's protest; the goods exchanged (Indian textiles, metal, guns, cowries); Thornton's emphasis on African agency and the counterpoint that European demand and guns drove warfare; and notes that the victims were overwhelmingly African.", "id": "q5"},
    {"type": "open", "prompt": "Evaluate the Williams thesis on slavery and British industrialisation.", "rubric": "A strong answer explains Williams's two claims (slavery profits helped finance industrialisation; abolition came when slavery was less profitable), the critiques (profits too small; Drescher's Econocide showing abolition as economic sacrifice), and the revival of interest through the history of capitalism and the role of enslaved resistance. It reaches a reasoned judgement.", "id": "q6"}
  ]$slavetrade_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/the-atlantic-slave-trade', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
