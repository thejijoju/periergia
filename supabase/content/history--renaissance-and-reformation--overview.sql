-- Renaissance, Reformation, and Encounter — chapter OVERVIEW master, co-written and human-reviewed.
-- history/renaissance-and-reformation @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for 1400-1650: the Asian empires and a peripheral Europe,
-- the joining of the hemispheres, words that take sides, the chapters,
-- and questions to carry through.
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
    'history/renaissance-and-reformation',
    'research',
    'advanced',
    'read',
    $rrov_master$## A World on the Move, 1400–1650

The period from about 1400 to 1650 is often told as a European story: the Renaissance, the Reformation, and the "Age of Discovery". This block tells a wider one. In 1400 the world's largest economies and most powerful states were in Asia. Ming China, founded in 1368, sent fleets larger than anything in Europe across the Indian Ocean. The Ottoman empire took Constantinople in 1453 and became the leading power of the Mediterranean. The Safavids unified Iran after 1501, and the Mughals conquered northern India from 1526. In Africa, Songhay controlled the trans-Saharan trade and the kingdom of Kongo engaged the Portuguese as a Christian partner; in the Americas, the Aztec and Inca empires were at their height. Europe's Atlantic kingdoms were, by comparison, small and on the edge of this world.

What changed in these two and a half centuries was the joining of the hemispheres. European ships reached West Africa, India, the Americas, and China, and for the first time trade, people, crops, diseases, and ideas moved regularly around the entire globe. The consequences were catastrophic for the peoples of the Americas and for millions of Africans forced into slavery, transforming for Europe, and significant, but far more limited, for the great Asian empires, which for most of this period dealt with Europeans on their own terms.

## Words That Take Sides

Several familiar terms carry a point of view. **"Discovery"** describes the experience of Europeans arriving in lands already inhabited by millions of people who did not need to be discovered. Historians increasingly speak instead of **"encounter"** or **"contact"**, though these words can make violent conquest sound mutual. **"Exploration"** hides the commercial and military aims of most voyages. **"New World"** was new only to Europeans. And the **"Renaissance"** and **"Reformation"** were movements within Latin Christendom; other civilizations had their own revivals and reformations in the same centuries, from Timurid Samarkand to the Ottoman court and Ming China.

This block uses these terms where they are standard, but tries in each chapter to show events from several sides: from Lisbon and Seville, but also from Tenochtitlan, Cuzco, Kongo, Calicut, Istanbul, and Beijing.

## The Chapters

1. **The Renaissance**, a revival of classical learning and art in Italy and northern Europe, and its connections to the Islamic, Byzantine, and Ottoman worlds.
2. **The Protestant and Catholic Reformations**, the splintering of Latin Christianity and its spread, through missions, to Asia, Africa, and the Americas.
3. **Ming China and the Voyages of Zheng He**, and the myth of Chinese isolation.
4. **European Expansion Overseas**, from the Portuguese in Africa and the Indian Ocean to the Spanish in the Americas.
5. **The Conquest of the Americas**, told through Indigenous as well as Spanish sources.
6. **The Columbian Exchange and the First Global Economy**, including the silver that linked the Americas to China.
7. **The Atlantic Slave Trade**, the largest forced migration in history, including the role of African states.
8. **Atlantic Slave Wars**, the resistance and revolts that made and unmade Atlantic slavery.

## Questions to Carry Through

- **Who held the advantage, where?** Europeans conquered the Americas, but in Asia they were mostly traders who needed permission from powerful rulers. Why the difference?
- **What role did disease play?** Epidemics did more than steel to determine the fate of the Americas.
- **Whose voices survive?** Indigenous and African perspectives survive in codices, chronicles written by Indigenous authors, oral tradition, and the records of resistance, and they change the story.
- **How did the world economy change?** Silver mined by forced Indigenous labour in the Andes ended up paying for Chinese silk and porcelain. Who benefited, and who paid?

## Further reading

- **Felipe Fernández-Armesto, *1492: The Year Our World Began* (2009).** A global view of a single year.
- **Charles C. Mann, *1493: Uncovering the New World Columbus Created* (2011).** The Columbian exchange and the first global economy.
- **Jerry Brotton, *The Renaissance Bazaar: From the Silk Road to Michelangelo* (2002).** The Renaissance as a product of exchange between East and West.$rrov_master$,
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
  select $rrov_quiz$[
    {"type": "mcq", "prompt": "Where were the world's largest economies and most powerful states around 1400?", "options": ["In Western Europe", "In the Americas", "In Asia, including Ming China and the rising Ottoman empire", "In Scandinavia"], "answerIndex": 2, "explanation": "Europe's Atlantic kingdoms were small and peripheral compared with the great Asian empires.", "id": "q1"},
    {"type": "mcq", "prompt": "Why do historians question the term 'Age of Discovery'?", "options": ["Because the lands Europeans reached were already inhabited by millions of people who did not need to be discovered", "Because no voyages took place", "Because it was invented by the Ming", "Because it only refers to Africa"], "answerIndex": 0, "explanation": "The term reflects a European viewpoint; 'encounter' or 'contact' are often preferred, though they can soften violent conquest.", "id": "q2"},
    {"type": "mcq", "prompt": "How did the European position in Asia differ from that in the Americas in this period?", "options": ["Europeans conquered the great Asian empires quickly", "There was no difference", "Europeans never reached Asia", "In Asia Europeans were mostly traders who needed the permission of powerful rulers, while in the Americas they conquered empires"], "answerIndex": 3, "explanation": "The great Asian empires dealt with Europeans largely on their own terms for most of this period.", "id": "q3"},
    {"type": "open", "prompt": "Why does it matter which words historians use for the events of 1400–1650, such as 'discovery', 'exploration', 'New World', and 'Renaissance'?", "rubric": "A strong answer explains that each term carries a European viewpoint: 'discovery' erases inhabitants, 'exploration' hides commercial and military aims, 'New World' was new only to Europeans, and 'Renaissance' and 'Reformation' were Latin Christian movements while other civilizations had their own revivals. It discusses alternatives such as 'encounter' and their own problems, and explains how terminology shapes whose perspective a history adopts.", "id": "q4"}
  ]$rrov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
