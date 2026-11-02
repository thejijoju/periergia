-- Before Writing: the Human Deep Past — chapter OVERVIEW master, co-written and human-reviewed.
-- history/before-writing @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Era overview for the deep past: frames the two chapters below it (Human
-- Origins; the Neolithic Revolution) and explains what kind of knowledge the
-- deep past offers.
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
    'history/before-writing',
    'research',
    'advanced',
    'read',
    $bwov_master$## The Longest Chapter of the Human Story

Squeeze the roughly 300,000-year history of *Homo sapiens* into a single day, and writing is invented at about 11:36 in the evening. Farming begins a little after eleven. Everything taught in most history courses, from the pyramids to the present, happens in the last twenty-four minutes. The rest of the day, more than ninety-five per cent of the time our species has existed, belongs to people who left no written word.

For a long time historians treated that span as someone else's business. The word "prehistory", coined in English by the archaeologist Daniel Wilson in 1851, drew a line: history began with texts, and anything earlier belonged to archaeology, geology, and speculation. That line no longer holds. The methods described in this course's opening chapter, *What is History?*, apply just as well to a stone tool, a hearth, a grain of pollen, or a strand of ancient DNA as to a charter or a chronicle. They are traces, and history is reasoning from traces. The difference is not that the deep past is unknowable but that it is known differently. It is known with more precision about bodies, diets, migrations, and climates than about names, beliefs, and events.

This block covers that deep past in two chapters, each built around one of the two great transformations that happened before writing.

## Two Transformations

**The first transformation is geographical.** A single species that evolved in Africa came to live on every continent except Antarctica, crossing open sea to reach Australia at least 50,000 years ago and reaching the Americas well before the end of the last Ice Age. Along the way it met, and interbred with, other kinds of human, Neanderthals and Denisovans, whose genes many living people still carry. Neanderthals disappear from the record around 40,000 years ago, and on present evidence *Homo sapiens* was the only human species left on Earth not long afterwards. *Human Origins and the Peopling of the Earth* follows that story and asks what can be known about the minds and societies of the people who made it, from the earliest engraved ochre to the cave paintings of Sulawesi and Chauvet.

**The second transformation is economic.** Beginning a little under 12,000 years ago, in at least seven and possibly a dozen or more places independently, people began to cultivate plants and keep animals until those plants and animals changed genetically and came to depend on humans as much as humans depended on them. Farming supported far denser populations than foraging, and it created the conditions, such as surplus, storage, property, and settled villages, from which cities and states would eventually grow. It also, by the evidence of skeletons, made most people's lives shorter, sicker, and more laborious for thousands of years. *The Neolithic Revolution: Farming and Its Costs* asks why people took a path that appears, at first sight, to have made them worse off.

## What Kind of Knowledge This Is

Readers coming to the deep past from later history should expect three differences.

**The evidence is physical, and increasingly scientific.** Radiocarbon dating, luminescence dating, tree rings, ice cores, isotopes in teeth and bones, and above all ancient DNA have transformed the field since the 1990s. Ancient DNA in particular has settled arguments that had run for a century, about whether farming spread across Europe with migrating farmers or by imitation, for example. It has also revealed populations, such as the Denisovans, that were unknown from the fossil record.

**The dates move.** Because the evidence comes from a small number of excavated sites, a single discovery can push back the earliest known date of something by thousands of years. The oldest known figurative painting moved from about 45,500 to at least 51,200 years ago in 2024. The earliest secure evidence for people in the Americas moved from about 13,000 to about 21,000–23,000 years ago over three decades. Dates in these chapters are best read as "at least this old, on present evidence".

**Much that matters most cannot be recovered.** Archaeology can show what people ate and how long they lived. It cannot show what they called themselves, what their songs said, or why they painted what they painted. Anthropologists' studies of modern foraging societies help, but those societies live in specific, often marginal environments and have been in contact with farmers and states for centuries, so they are a guide to possibilities rather than a window into the past. The honest answer to many questions about the deep past is "we do not know", and these chapters say so where it applies.

## Why It Matters for the Rest of History

The deep past is not a prologue to be hurried through. Three themes that run through the whole of this subject begin here.

First, **human beings are one species with a short shared history.** All living people descend from African populations of the last few hundred thousand years, and the genetic differences between human groups are small and recent. Many of the racial categories that later chapters will show doing so much damage, in the Atlantic slave trade, in colonial science, and in the Holocaust, rest on claims the evidence of the deep past directly contradicts.

Second, **the environment is an actor in history.** The ice ages set the sea levels that opened and closed routes between continents. The unusually stable climate of the last 11,700 years, the Holocene, may have been what made farming possible at all. Later chapters on the Bronze Age collapse, the Black Death, and the Little Ice Age return to the same theme.

Third, **the way of life that most people today take for granted is very new.** Settled life, private property, social hierarchy, organised religion, and the state are not timeless features of human nature. They have a history, and that history starts in the period this block describes. Understanding how people lived for the first ninety-five per cent of our species' existence is the only way to see clearly what was gained, and what was lost, when they stopped.

## Further reading

- **David Reich, *Who We Are and How We Got Here* (2018).** The ancient-DNA revolution explained by one of its leaders.
- **Chris Stringer, *Lone Survivors: How We Came to Be the Only Humans on Earth* (2012).** A clear account of human origins from a leading palaeoanthropologist.
- **James C. Scott, *Against the Grain: A Deep History of the Earliest States* (2017).** A provocative argument about farming, grain, and the origins of the state.
- **David Graeber and David Wengrow, *The Dawn of Everything* (2021).** A wide-ranging, much-debated challenge to the standard story of how inequality began.$bwov_master$,
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
  select $bwov_quiz$[
    {"type": "mcq", "prompt": "If the history of Homo sapiens were compressed into a single day, roughly when would writing be invented?", "options": ["Around noon", "Around 6 p.m.", "Around 11:36 p.m.", "A few seconds before midnight"], "answerIndex": 2, "explanation": "Writing is about 5,000 years old against roughly 300,000 years of Homo sapiens, about one-sixtieth of the span, or the last 24 minutes of the day.", "id": "q1"},
    {"type": "mcq", "prompt": "Why does the overview argue that the old boundary between 'history' and 'prehistory' no longer holds?", "options": ["Because historical reasoning from traces applies equally to physical and scientific evidence, not only to texts", "Because writing has been found to be much older than previously thought", "Because prehistoric people kept oral records that have been transcribed", "Because archaeology has been abolished as a separate discipline"], "answerIndex": 0, "explanation": "History is reasoning from traces. Stone tools, pollen, and ancient DNA are traces too, so the deep past is known differently rather than being outside history.", "id": "q2"},
    {"type": "mcq", "prompt": "Why should dates for 'the earliest' of anything in the deep past be read as 'at least this old, on present evidence'?", "options": ["Because radiocarbon dating is unreliable", "Because archaeologists deliberately understate dates", "Because the calendar has changed since the Ice Age", "Because evidence comes from a small number of excavated sites, so a single new discovery can push dates back"], "answerIndex": 3, "explanation": "Sparse sampling means first-known dates are minimums. The oldest figurative painting and the earliest people in the Americas both moved back by thousands of years in recent decades.", "id": "q3"},
    {"type": "open", "prompt": "The overview names three themes from the deep past that run through the rest of history. Choose one and explain why it matters for understanding a later period.", "rubric": "A strong answer identifies one of the three themes (all humans are one young, African-descended species, which undercuts later racial classifications; the environment as an actor in history; settled life, property, hierarchy, and the state as recent historical developments rather than human nature) and links it convincingly to a specific later period or problem, such as racial science and the slave trade, climate and the Bronze Age collapse or Black Death, or the origins of the state.", "id": "q4"}
  ]$bwov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/before-writing', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
