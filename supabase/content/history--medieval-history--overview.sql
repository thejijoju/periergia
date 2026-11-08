-- The Medieval World — chapter OVERVIEW master, co-written and human-reviewed.
-- history/medieval-history @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for the Medieval World: the global Middle Ages, the forces
-- connecting Afro-Eurasia, how the block is organised, and questions to
-- carry through.
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
    'history/medieval-history',
    'research',
    'advanced',
    'read',
    $mwov_master$## A Thousand Years, Many Worlds

"The Middle Ages" is a European idea. Italian humanists of the fourteenth and fifteenth centuries coined it for the centuries between the fall of Rome and what they saw as their own revival of classical culture, as the chapter *What is History?* described. Applied to China under the Tang and Song, to the Abbasid caliphate in Baghdad, to the empires of Mali and Angkor, or to the Inca, the label makes little sense: these were not "middle" periods for the people who lived in them, and many were high points of prosperity and creativity.

This block uses "medieval" only as a convenient name for the roughly thousand years from about 500 to 1500 CE. Historians increasingly speak of a **global Middle Ages**, studying these centuries not as the story of Europe with other regions attached, but as a period in which most of Afro-Eurasia became more connected than ever before, while the Americas developed along their own paths, unconnected to the Old World until 1492.

## A More Connected Old World

Several forces knitted Afro-Eurasia together in these centuries.

- **World religions.** Christianity spread through Europe and into Ethiopia and Central Asia; Islam, founded in the seventh century, spread within a century from Spain to Central Asia and later into West Africa, East Africa, India, and Southeast Asia; Buddhism spread across East and Southeast Asia. Each created communities of belief, learning, law, and pilgrimage that crossed political borders.
- **Trade networks.** The Indian Ocean, the Silk Roads, the trans-Saharan routes, and the Mediterranean carried goods, people, and ideas on a growing scale. Muslim, Jewish, Armenian, Indian, Chinese, and Swahili merchants built diasporas and commercial institutions that linked distant markets.
- **Empires of the steppe.** In the thirteenth century the Mongols created the largest land empire in history, stretching from Korea to Hungary, which for a time made travel across Eurasia easier than ever before.
- **Disease.** The same connections carried plague. The Black Death of the fourteenth century killed perhaps a third to a half of the populations it reached, from China to Western Europe and North Africa.

The world's population grew from perhaps 200 to 250 million around 500 CE to roughly 400 million by 1300, before the Black Death caused a sharp fall. A warmer climate in much of the northern hemisphere from about 950 to 1250, sometimes called the Medieval Climate Anomaly, helped farming expand in some regions, while the onset of cooler, more unstable conditions from the early fourteenth century contributed to famines.

## How This Block Is Organised

The chapters are grouped by region, and then by the forces that connected the regions:

1. **Europe and Byzantium:** early medieval Europe; lords, peasants, and towns; sex, love, and marriage; Byzantium; and the Crusades.
2. **The Islamic World:** the rise of Islam and the caliphates; and the Islamic commercial revolution.
3. **Asia:** Tang and Song China; medieval Japan; the Delhi Sultanate and medieval India; and Angkor, Srivijaya, and Southeast Asia.
4. **Africa:** Ghana, Mali, and the trans-Saharan world; and the Swahili coast and Great Zimbabwe.
5. **The Americas:** North America before Columbus; the Aztec world in *Moctezuma's Mexico*; and the Inca.
6. **Across Afro-Eurasia:** the Mongol empire; the Black Death; and slavery in the global Middle Ages.

## Questions to Carry Through

- **Where was the centre?** For most of this period, the largest cities, richest economies, and most advanced technologies were in China, the Islamic world, and India, not in Western Europe. How and when did that change?
- **What did religion do?** Religions shaped law, education, art, and politics, and also justified conquest, persecution, and holy war.
- **Who travelled, and who was moved?** Merchants, pilgrims, scholars, and soldiers travelled by choice. Millions of enslaved people, from Slavic, African, Turkic, and other lands, were moved by force.
- **How do we know?** Sources multiply in this period, from chronicles and charters to merchant letters, travel accounts such as Ibn Battuta's, and archaeology. But much of the world, including most of Africa and the Americas, must still be reconstructed largely from archaeology, oral tradition, and the records of outsiders.

## Further reading

- **Catherine Holmes and Naomi Standen (eds.), *The Global Middle Ages* (2018).** Essays that rethink the period on a world scale.
- **Valerie Hansen, *The Year 1000: When Explorers Connected the World — and Globalization Began* (2020).** A lively argument for connection around 1000 CE.
- **Chris Wickham, *Medieval Europe* (2016).** A concise, authoritative history of Europe in the period.$mwov_master$,
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
  select $mwov_quiz$[
    {"type": "mcq", "prompt": "Why is the label 'Middle Ages' problematic outside Europe?", "options": ["Because it was invented by Arab historians", "Because it is a European humanist idea, and periods such as Tang and Song China or the Abbasid caliphate were not 'middle' periods for those who lived in them", "Because no history happened between 500 and 1500", "Because it only applies to the Americas"], "answerIndex": 1, "explanation": "The term reflects Renaissance Europeans' view of their own past and fits poorly elsewhere, which is why historians speak of a global Middle Ages.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these did NOT connect Afro-Eurasia in the medieval period?", "options": ["The spread of world religions", "Indian Ocean and trans-Saharan trade", "Regular transatlantic voyages between Europe and the Americas", "The Mongol empire"], "answerIndex": 2, "explanation": "The Americas developed separately from the Old World until 1492; the Norse visit to Newfoundland around 1021 left no lasting connection.", "id": "q2"},
    {"type": "mcq", "prompt": "Where were the largest cities and richest economies for most of the medieval period?", "options": ["Mainly in Western Europe", "In China, the Islamic world, and India", "Only in the Americas", "Evenly spread across the world"], "answerIndex": 1, "explanation": "For most of the period, China, the Islamic lands, and India outweighed Western Europe in cities, wealth, and technology.", "id": "q3"},
    {"type": "open", "prompt": "What do historians gain by studying a 'global Middle Ages' rather than only European medieval history?", "rubric": "A strong answer explains that the term 'medieval' is European and that a global approach reveals connections (religions, trade networks, the Mongols, plague, slavery) and comparisons across regions; it corrects a Eurocentric view in which Europe was the centre when it was often peripheral; and it raises questions about sources for regions known mainly through archaeology or outsiders' records. Better answers give concrete examples.", "id": "q4"}
  ]$mwov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
