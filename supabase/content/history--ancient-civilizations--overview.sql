-- The First Civilizations — chapter OVERVIEW master, co-written and human-reviewed.
-- history/ancient-civilizations @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for the First Civilizations block: what 'civilization' means
-- here (Childe's urban revolution), independent invention of states and
-- writing, a rough timeline, and five questions to carry through the block.
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
    'history/ancient-civilizations',
    'research',
    'advanced',
    'read',
    $fcov_master$## Cities, Kings, and Writing

Between about 5,500 and 5,000 years ago, in the floodplain of southern Iraq, a settlement called Uruk grew into something new: a city of perhaps 25,000 to 50,000 people, many of whom did not grow their own food. Over the following three thousand years, comparable societies appeared along the Nile, the Indus, and the Yellow River, around the eastern Mediterranean, and, entirely independently, in Mesoamerica and the Andes. This block takes them one at a time, from Mesopotamia and Egypt to the Olmec, Maya, and the first states of the Andes, and asks a comparative question throughout: what did these societies have in common, and what was genuinely different about each?

## What "Civilization" Means Here

The word *civilization* has a troubled history. For nineteenth-century European writers it meant a ranking, with "civilized" peoples at the top and "savages" and "barbarians" below, and it was used to justify conquest. Historians now use it in a narrower and descriptive sense, for a particular kind of society, not a measure of worth.

The archaeologist V. Gordon Childe, who named the Neolithic Revolution, also proposed an "urban revolution" and in 1950 listed ten features that marked it. Simplified, they are: large, dense settlements; full-time specialists such as craftspeople, priests, and officials; a surplus collected by a central authority as tax or tribute; monumental public buildings; a ruling class; writing or another system of record-keeping; mathematics, astronomy, and calendars; representational art; long-distance trade; and a state organised by residence rather than kinship alone. No list fits every case perfectly. Later Andean states, Wari and then the Inca, kept records with knotted cords rather than writing; the Indus cities have left no clearly identified palaces or royal tombs. But Childe's list remains a useful way of seeing what changed when villages became cities and chiefdoms became states.

## Independent Inventions

The most striking fact about early civilizations is that they arose several times independently. Archaeologists distinguish **primary** or **pristine** states, which developed without a model to copy, from **secondary** states, which formed under the influence of existing ones. Mesopotamia, Egypt, the Indus valley, China, Mesoamerica, and the Andes are usually counted as primary, though how far Egypt and the Indus were stimulated by contact with Mesopotamia is debated.

Writing, too, was invented independently at least three and probably four times: in Mesopotamia around 3300 BCE, in China by about 1200 BCE (the earliest surviving examples are Shang oracle bones), and in Mesoamerica in the first millennium BCE. Egyptian hieroglyphs appear at almost the same time as Mesopotamian cuneiform, and whether they were invented independently or inspired by knowledge of writing in Mesopotamia is unresolved. The Indus script remains undeciphered, and it is not certain that it records language at all. That writing was invented several times, by different people for different purposes, is one of the best arguments that it was a response to the needs of complex societies rather than a single lucky discovery.

## A Rough Timeline

The dates below are approximate, and specialists argue about many of them.

- **c. 4000–3100 BCE:** Uruk and the growth of cities in southern Mesopotamia.
- **c. 3300–3200 BCE:** writing in Mesopotamia; hieroglyphs in Egypt at almost the same time.
- **c. 3100 BCE:** unification of Egypt.
- **c. 3000 BCE:** the first monumental sites of the Norte Chico region of coastal Peru (Caral from about 2600 BCE).
- **c. 2600–1900 BCE:** the mature Indus cities, Harappa and Mohenjo-daro.
- **c. 2600–2560 BCE:** the Great Pyramid of Khufu.
- **c. 2500–1500 BCE:** Kerma, the first kingdom of Kush, in Nubia.
- **c. 2300 BCE:** Sargon of Akkad's empire.
- **c. 1600–1046 BCE:** the Shang dynasty in China.
- **c. 1600–1200 BCE:** palace societies of the eastern Mediterranean.
- **c. 1200–1150 BCE:** the Bronze Age collapse in the eastern Mediterranean.
- **c. 1200–400 BCE:** the Olmec in Mesoamerica; Chavín in the Andes from about 900 BCE.
- **c. 911–609 BCE:** the Neo-Assyrian empire.
- **c. 728–656 BCE:** Kushite pharaohs rule Egypt (driven out by Assyria in the 660s).

## Questions to Carry Through the Block

Five questions recur through these chapters, and they are worth bringing to each one.

1. **What was the surplus, and who controlled it?** Grain in Mesopotamia and Egypt, maize in Mesoamerica, and labour in the Andes. How it was gathered shaped the state.
2. **What did rulers claim to be?** Some were gods, some the gods' representatives, and some, perhaps in the Indus cities, are almost invisible.
3. **What was writing for?** Accounting, divination, royal propaganda, and religion each produced different kinds of writing and different kinds of evidence.
4. **How did these societies end, or did they?** Some collapsed, some were conquered, and some were transformed into successors. Collapse is often less total, and continuity greater, than older accounts suggested.
5. **Whose story survives?** Kings, scribes, and temples left most of the records. Farmers, labourers, women, and slaves appear mostly in the margins, and recovering them takes the methods described in *What is History?*

## Further reading

- **Bruce Trigger, *Understanding Early Civilizations: A Comparative Study* (2003).** The standard systematic comparison of seven early civilizations.
- **Norman Yoffee, *Myths of the Archaic State: Evolution of the Earliest Cities, States, and Civilizations* (2005).** A critical rethinking of how early states formed and what "collapse" meant.
- **James C. Scott, *Against the Grain* (2017).** On why early states were fragile, grain-based, and often avoided.$fcov_master$,
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
  select $fcov_quiz$[
    {"type": "mcq", "prompt": "How do historians use the word 'civilization' in this block?", "options": ["As a ranking of peoples from civilized to savage", "As a description of a particular kind of society, with cities, specialists, surplus, and states, not a measure of worth", "As a synonym for any society that has writing", "As a term for European societies only"], "answerIndex": 1, "explanation": "The nineteenth-century ranking sense has been abandoned; the term now describes a type of complex society, following criteria such as Childe's.", "id": "q1"},
    {"type": "mcq", "prompt": "What is a 'primary' or 'pristine' state?", "options": ["A state founded by migrants from an older civilization", "The first state in any given region to adopt writing", "A state ruled by priests", "A state that developed without an existing state to copy"], "answerIndex": 3, "explanation": "Pristine states, such as early Mesopotamia, China, Mesoamerica, and the Andes, arose without models; secondary states formed under the influence of existing ones.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is the independent invention of writing in several places significant?", "options": ["It suggests writing was a response to the needs of complex societies rather than a one-off discovery", "It shows that writing was invented by a single genius and copied everywhere", "It proves all early civilizations were in contact", "It shows writing was invented before farming"], "answerIndex": 0, "explanation": "Writing appears independently in Mesopotamia, China, and Mesoamerica, and possibly Egypt, which points to common pressures of administration and power rather than diffusion from one source.", "id": "q3"},
    {"type": "open", "prompt": "Choose two of the five questions the overview suggests carrying through the block, and explain why each matters for comparing early civilizations.", "rubric": "A strong answer picks two of: what the surplus was and who controlled it; what rulers claimed to be; what writing was for; how these societies ended or were transformed; and whose story survives. For each, it explains why the question reveals similarities or differences between civilizations, ideally with an example such as grain taxation in Mesopotamia versus labour tribute in the Andes, divine kingship in Egypt versus the near-invisible rulers of the Indus, or administrative versus divinatory writing.", "id": "q4"}
  ]$fcov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
