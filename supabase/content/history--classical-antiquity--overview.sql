-- The Classical World — chapter OVERVIEW master, co-written and human-reviewed.
-- history/classical-antiquity @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for the Classical World: the great Eurasian empires, the
-- Axial Age and its critics, comparing Rome and Han China, and recurring
-- themes of the block.
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
    'history/classical-antiquity',
    'research',
    'advanced',
    'read',
    $cwov_master$## An Age of Empires and Ideas

Between about 600 BCE and 600 CE, much of Eurasia came under the rule of a few very large states. The Persian Achaemenid empire, founded in the 550s BCE, was the largest the world had yet seen. It was followed by Alexander's conquests and the Hellenistic kingdoms, by the Mauryan empire in India, by the Roman empire in the Mediterranean, by the Qin and Han empires in China, and by the Parthian and Sasanian empires in Iran. At their height, Han China counted about 58 million people in its census of 2 CE, and the Roman empire perhaps 60 to 75 million in the second century; each held perhaps a quarter to a third of the world's population.

The same centuries produced many of the ideas that still frame much of the world: Greek philosophy, science, and political theory; the teachings of the Buddha and the Jain teacher Mahavira; the Confucian and Daoist classics; the Hebrew Bible in something like its final form; Roman law; Christianity; and, by the end of the period, the beginnings of Islam. This block covers those empires and asks how they were held together, what they believed, how they connected, and why most of them eventually broke apart.

## The "Axial Age" and Its Critics

In 1949 the German philosopher Karl Jaspers proposed that between roughly 800 and 200 BCE, several civilizations independently underwent a similar intellectual transformation, which he called the **Axial Age**. Thinkers in Greece, Israel, Iran, India, and China, he argued, began to question inherited traditions, to reflect on the human condition in universal terms, and to imagine a transcendent order against which kings and societies could be judged. The Hebrew prophets, Zoroaster (whose dates may lie centuries earlier), the Buddha, Confucius, the perhaps legendary Laozi, and Plato are the usual examples.

The idea is attractive and widely used, but historians criticise it. The dates of several key figures, such as Zoroaster, are very uncertain. The "axial" traditions grew over many centuries rather than appearing in a single burst. The concept also leaves out major figures who do not fit, such as Jesus and Muhammad, and tends to treat a selection of famous male thinkers as if they represented whole societies. It is best used as a question to ask, why did these ideas appear in these places at roughly this time, rather than as an explanation. Possible answers include the growth of cities and literacy, the spread of coinage and trade, the competition between states that gave independent thinkers patrons, and the experience of living in large, diverse empires.

## Comparing Empires

The classical empires invite comparison, and historians increasingly make it. The historian Walter Scheidel and others have compared Rome and Han China in detail, finding remarkable similarities in size, population, reliance on peasant taxation, use of military force, and bureaucratic administration, as well as revealing differences. China's empire was reconstituted again and again after periods of division, while Rome's western half was never lastingly reunited. Explaining that difference, whether through geography, the strength of a shared written language and elite culture, or the role of steppe nomads, is one of the big questions of world history.

Several themes recur through this block:

- **Holding territory together.** Roads, coinage, standard laws and measures, provincial governors, garrisons, and shared elite cultures were the tools of empire, from the Persian Royal Road to the Roman road network and the Qin standard script.
- **Tolerance and its limits.** Large empires ruled many peoples, and most were pragmatic about local religion and custom when it did not threaten their power, from Cyrus in Babylon to Ashoka's edicts. They could also be brutal to those who resisted.
- **Connection.** The Silk Roads and the Indian Ocean linked the empires, carrying silk, spices, and silver, but also Buddhism, Christianity, and disease.
- **Endings.** By around 600 CE, the western Roman empire had broken up, the Han had fallen in 220 and China had been divided for more than three centuries before the Sui reunified it in 589, the Gupta empire had fragmented, and the Sasanian and Byzantine empires were exhausting each other. Pandemics and pressure from steppe peoples played a part in several of these stories.

## The Chapters

The block runs roughly from west to east:

1. **The Persian Empire**, from Cyrus to the Arab conquest of Sasanian Iran.
2. **Ancient Greece**, the city-states, democracy, and philosophy.
3. **Alexander and the Hellenistic World**, the conquest of Persia and the Greek kingdoms that followed.
4. **Rome and the Ancient Roman World**, from city-state to empire.
5. **The Fall of the Roman Empire**, and the long debate about it.
6. **Classical India**, from the Mauryas to the Guptas.
7. **Han China**, China's formative empire.
8. **The Silk Roads**, which connected them all.

## Further reading

- **Walter Scheidel (ed.), *Rome and China: Comparative Perspectives on Ancient World Empires* (2009).** Essays comparing the two great empires.
- **Karl Jaspers, *The Origin and Goal of History* (1949; English trans. 1953).** The book that proposed the Axial Age.
- **Ian Morris, *Why the West Rules — For Now* (2010).** A sweeping, debated comparison of East and West over the long run.$cwov_master$,
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
  select $cwov_quiz$[
    {"type": "mcq", "prompt": "What did Karl Jaspers mean by the 'Axial Age'?", "options": ["The period when the first cities were built", "A period, roughly 800–200 BCE, when several civilizations independently developed new reflective and universal religious and philosophical ideas", "The age of the Roman Empire", "The invention of the wheel and axle"], "answerIndex": 1, "explanation": "Jaspers argued that thinkers from Greece to China transformed thought in this period; historians now treat the idea as a question rather than an explanation.", "id": "q1"},
    {"type": "mcq", "prompt": "Which difference between Rome and Han China do comparative historians highlight?", "options": ["China's empire was repeatedly reconstituted after division, while Rome's western half was never lastingly reunited", "Rome had no army", "Han China had no bureaucracy", "Rome was much more populous than Han China"], "answerIndex": 0, "explanation": "Both were huge, comparable empires, but China repeatedly reunified while the western Roman empire did not, a major question in world history.", "id": "q2"},
    {"type": "mcq", "prompt": "Why do historians criticise the 'Axial Age' concept?", "options": ["Because none of the thinkers it names existed", "Because dates such as Zoroaster's are uncertain, the traditions developed over centuries, and it treats a few famous thinkers as representing whole societies", "Because it applies only to Europe", "Because it was invented in the Middle Ages"], "answerIndex": 1, "explanation": "The concept compresses long and uncertain developments into a single moment and focuses on a narrow set of elite thinkers.", "id": "q3"},
    {"type": "open", "prompt": "Choose one of the recurring themes of the block (holding territory together, tolerance and its limits, connection, or endings) and explain why it is useful for comparing two classical empires.", "rubric": "A strong answer chooses one theme and illustrates it with at least two empires, e.g. roads, coinage, and standard scripts (Persian Royal Road, Roman roads, Qin standardisation); pragmatic tolerance (Cyrus, Ashoka) and its limits; Silk Road and Indian Ocean connections carrying goods, religions, and disease; or the endings of Rome, Han, Gupta, and Sasanian Iran, including pandemics and steppe pressure. It explains what the comparison reveals that studying one empire alone would not.", "id": "q4"}
  ]$cwov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
