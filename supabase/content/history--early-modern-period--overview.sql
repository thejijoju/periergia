-- The Early Modern World — chapter OVERVIEW master, co-written and human-reviewed.
-- history/early-modern-period @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for c. 1550-1800: gunpowder empires and global
-- connections, why 'early modern', the seventeenth-century global crisis,
-- the chapters, and questions to carry through.
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
    'history/early-modern-period',
    'research',
    'advanced',
    'read',
    $emov_master$## Gunpowder Empires and Global Connections, c. 1550–1800

Between the mid-sixteenth century and the end of the eighteenth, most of the world's people lived under a handful of great land empires. The historians Marshall Hodgson and William McNeill called the Islamic ones the **"gunpowder empires"**: the **Ottomans**, ruling from the Balkans to Arabia and North Africa; the **Safavids** in Iran; and the **Mughals** in India. To these can be added the **Qing** in China, who conquered the Ming in 1644 and doubled China's territory into Mongolia, Tibet, and Xinjiang; **Russia**, which expanded across Siberia to the Pacific; and the Tokugawa shoguns, who unified Japan. These states used artillery and muskets, large armies, and growing bureaucracies to rule vast and diverse populations, and for most of this period they were richer and more powerful than the states of western Europe.

At the same time, the world was becoming more connected. European trading companies, armed and backed by their states, built networks of forts and ports from West Africa to Indonesia. The Atlantic economy, built on silver, sugar, and slavery, linked Europe, Africa, and the Americas. And in Europe, new ways of investigating nature, the Scientific Revolution, and new ideas about politics and society, the Enlightenment, began to reshape thought, drawing on knowledge from across the world.

## Why "Early Modern"?

Historians call this period **"early modern"**, a term invented to describe Europe between the Renaissance and the French Revolution. Applying it to the world as a whole is debated. Its defenders argue that many regions shared features in these centuries: growing states with standing armies and bureaucracies, expanding commerce and cities, the spread of print and literacy, and global exchanges of goods, crops, and ideas. Its critics warn that it can imply that every society was heading toward the same "modern" destination defined by Europe. This block uses the term as a label for a period, not as a claim about the direction of history.

## A World in Crisis

The seventeenth century brought a wave of crises across the northern hemisphere. A period of cooler climate known as the **Little Ice Age**, at its most severe in the mid-seventeenth century, brought failed harvests, famine, and disease. In *Global Crisis* (2013), the historian **Geoffrey Parker** showed how this climate stress coincided with wars, rebellions, and state breakdowns across the world: the fall of the Ming in 1644, the Thirty Years' War, revolts in the Ottoman empire, the English Civil War, and uprisings from Russia to Spain's empire. States that survived often emerged stronger and more centralised.

## The Chapters

1. **The Ottomans**, from frontier principality to world empire, and its long transformation to 1923.
2. **Ottoman Social and Cultural History**, the empire from the inside.
3. **Safavid Iran**, the dynasty that made Iran Shi'a.
4. **The Mughal Empire**, India's last great empire.
5. **The Tokugawa Shogunate**, two and a half centuries of peace in Japan.
6. **Russia from Muscovy to Catherine the Great**, the making of the largest state on earth.
7. **The Rise of Absolutism**, the early modern state in Europe, compared with its Asian contemporaries.
8. **The Scientific Revolution**, and the global knowledge it drew on.
9. **The Enlightenment**, its ideas, its global sources, and its blind spots.
10. **Trading Companies and Empires**, the VOC and the East India Company.
11. **Kongo, Asante, and Dahomey**, West and Central African states in the Atlantic age.
12. **Colonial North America**, from Indigenous, African, and settler perspectives.
13. **Colonial Latin America**, three centuries of Spanish and Portuguese rule.

The history of the Qing dynasty, the largest of these empires, continues in the chapter *Ming-Qing History*.

## Questions to Carry Through

- **How did empires rule diversity?** The Ottomans, Mughals, Qing, and Russians ruled many religions and peoples. What mix of tolerance, accommodation, and force did they use?
- **When did Europe pull ahead?** Historians debate whether Europe's economic lead over China and India began before 1800 or only with industrialisation, the "Great Divergence" debate taken up in later chapters.
- **Whose knowledge?** The new science and the Enlightenment drew on information gathered across the world, often through colonial networks. Who received credit?
- **Decline or transformation?** Older histories described the Ottoman, Mughal, and Safavid empires as "declining" after 1700. Many historians now see transformation, decentralisation, and adaptation instead.

## Further reading

- **Douglas E. Streusand, *Islamic Gunpowder Empires: Ottomans, Safavids, and Mughals* (2011).** A comparative history of the three empires.
- **Geoffrey Parker, *Global Crisis: War, Climate Change and Catastrophe in the Seventeenth Century* (2013).** The worldwide crisis of the seventeenth century.
- **John Darwin, *After Tamerlane: The Global History of Empire since 1405* (2007).** Empires across Eurasia, with Europe as one player among many.$emov_master$,
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
  select $emov_quiz$[
    {"type": "mcq", "prompt": "Which empires did Hodgson and McNeill call the 'gunpowder empires'?", "options": ["Britain, France, and Spain", "The Aztecs and Inca", "The Ottomans, Safavids, and Mughals", "Rome and Han China"], "answerIndex": 2, "explanation": "The term describes the large Islamic empires that used artillery, muskets, and bureaucracy to rule vast territories.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Geoffrey Parker argue in Global Crisis?", "options": ["That the cooler climate of the Little Ice Age coincided with wars, rebellions, and state breakdowns across the world", "That the seventeenth century was a time of peace", "That only Europe experienced crisis", "That the crisis was caused by the printing press"], "answerIndex": 0, "explanation": "Parker linked climate stress to crises from Ming China to the Thirty Years' War.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is the label 'early modern' debated when applied to the whole world?", "options": ["Because it was invented in China", "Because the period never existed", "Because it only refers to the Americas", "Because it can imply that every society was heading toward a 'modern' destination defined by Europe"], "answerIndex": 3, "explanation": "The block uses the term as a period label, not as a claim about the direction of history.", "id": "q3"},
    {"type": "open", "prompt": "Choose two of the block's questions (ruling diversity, when Europe pulled ahead, whose knowledge, decline or transformation) and explain why they matter for understanding the early modern world.", "rubric": "A strong answer explains two of the questions with examples, such as Ottoman, Mughal, Qing, and Russian rule of many peoples; the Great Divergence debate; the global sources of new scientific and Enlightenment knowledge and who received credit; and the revision of 'decline' narratives for the Ottoman, Safavid, and Mughal empires.", "id": "q4"}
  ]$emov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
