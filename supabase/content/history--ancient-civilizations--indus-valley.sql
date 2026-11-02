-- The Indus Valley Civilization — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/the-indus-valley-civilization @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Rediscovery, planned cities, weights and seals, trade with Meluhha, the
-- undeciphered script, the governance puzzle, the decline around 1900 BCE
-- and the end of the Aryan-invasion theory, and genetic evidence.
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
    'history/ancient-civilizations/the-indus-valley-civilization',
    'research',
    'advanced',
    'read',
    $indus_master$> **The Indus Valley Civilization**, also called the Harappan civilization after its first excavated city, flourished in what is now Pakistan and northwest India from about 3300 to 1300 BCE, reaching its height between about 2600 and 1900 BCE. It covered a larger area than Egypt and Mesopotamia combined, and its cities had planned streets, standardised bricks, and drainage systems unmatched elsewhere for millennia. Yet it is the least understood of the great early civilizations. Its script has not been deciphered, it left no clear palaces, royal tombs, or monumental temples, and no one knows what its people called themselves or how they were governed. This chapter is about what can be known of a civilization that cannot yet be read.

## Rediscovery

Unlike Egypt or Mesopotamia, the Indus civilization left no memory in later literature. Its rediscovery was slow and accidental. In the 1820s a British deserter and traveller, Charles Masson, noticed the ruins at Harappa in the Punjab. In the 1850s, engineers building the railway between Lahore and Multan took bricks from the site for ballast. In the 1870s the archaeologist Alexander Cunningham found a strange seal there, carved with an animal and unknown signs, but did not realise its significance.

The breakthrough came in the early 1920s, when excavations at **Harappa**, led by Daya Ram Sahni, and at **Mohenjo-daro** in Sindh, about 600 kilometres to the southwest, led by R. D. Banerji, found the same distinctive seals, pottery, and bricks. In 1924 John Marshall, Director-General of the Archaeological Survey of India, announced in the *Illustrated London News* that a previously unknown civilization had been found. Comparison with Indus-style seals found in Mesopotamia soon showed that it was as old as Sumer.

## A Vast Civilization

The Indus civilization grew out of a long local history. At **Mehrgarh**, in Balochistan in western Pakistan, people were farming wheat and barley and herding cattle, sheep, and goats from about 7000 BCE, one of the earliest farming sites in South Asia. Over the following millennia, villages and towns spread across the Indus plains. Archaeologists divide the civilization into an Early Harappan phase (about 3300–2600 BCE), a **Mature Harappan** phase (about 2600–1900 BCE), when the great cities flourished, and a Late Harappan phase (about 1900–1300 BCE).

At its height, Harappan material culture covered an area estimated at around a million square kilometres, from the Makran coast near Iran to the upper Ganges–Yamuna region near Delhi, and from Afghanistan to Gujarat. More than a thousand sites are known. Most were villages and small towns, but at least five were large cities: Mohenjo-daro, Harappa, Ganweriwala in Pakistan, and Rakhigarhi and Dholavira in India. Mohenjo-daro may have held some 30,000 to 60,000 people.

Many sites lie along the Indus and its tributaries, but many others lie along the now-dry **Ghaggar-Hakra** river system east of the Indus. Some scholars identify the Ghaggar-Hakra with the Sarasvati river praised in the Rigveda, an identification that is debated and carries political weight in modern India. Geological studies suggest that by the time of the Harappan cities, the Ghaggar-Hakra was fed mainly by monsoon rains rather than by Himalayan glaciers, so it was a seasonal river rather than a great perennial one.

## Planned Cities

The most striking feature of the Indus cities is their planning and uniformity. Mohenjo-daro and Harappa were laid out with main streets running roughly north–south and east–west, dividing the city into blocks, though not on a perfect grid. Most cities had a raised western mound, often called the "citadel", and a larger lower town of houses and workshops.

Buildings were made of **standardised fired bricks** in the proportions 1:2:4 (thickness, width, length), used across hundreds of kilometres. Houses typically faced inward onto courtyards, with blank walls to the street. Many had their own bathing platforms and toilets connected to **covered drains** running beneath the streets, with inspection holes for cleaning. Mohenjo-daro had an estimated 700 wells. No other civilization of the time provided sanitation on such a scale for ordinary households.

The most famous structure is the **Great Bath** at Mohenjo-daro, a rectangular pool about 12 metres long, 7 metres wide, and 2.4 metres deep, made watertight with carefully fitted bricks and a layer of bitumen, with steps at each end. It was probably used for ritual bathing, which suggests that purification by water mattered in Harappan religion, as it does in later South Asian traditions. A large building nearby was long called the "Granary", though whether it stored grain is uncertain.

Harappan trade and craft depended on a standardised system of **weights**: small, carefully cut cubes, usually of chert. They followed a binary progression for smaller units (1, 2, 4, 8, 16, 32, 64) and a decimal one for larger multiples, and they were remarkably consistent across the whole civilization.

Craftspeople produced long carnelian beads drilled with specialised stone drills, shell bangles, glazed faience ornaments, copper and bronze tools, and the famous square **seals** of steatite. The most common seal image is a one-horned animal usually called a "unicorn", shown in front of an object sometimes interpreted as an incense burner or manger; other seals show bulls, elephants, tigers, rhinoceroses, and occasional human or human-animal figures. A small bronze statuette of a young woman from Mohenjo-daro, known as the "Dancing Girl", was made by the lost-wax casting method. A steatite bust of a bearded man is known as the "Priest-King", a label invented by excavators that reflects their assumptions more than any evidence of his role.

{{image: Mohenjo-daro | The Great Bath and the surrounding remains of Mohenjo-daro, in Sindh, Pakistan, one of the largest cities of the Indus civilization.}}

```checkpoint
q: What does the use of standardised bricks and weights across the Indus civilization suggest?
a*: That there was strong coordination or shared standards across a very large area, whatever form of authority produced them.
a: That all the cities were built by a single king in one generation.
x: The cities developed over centuries, and there is no evidence of a single royal builder. Uniformity suggests shared standards, not one ruler.
a: That the Indus people traded only with Egypt.
x: Standards within the civilization say nothing about Egypt; the main external trade partner was Mesopotamia.
a: That every house was the same size.
x: Houses varied considerably in size. The uniformity concerns bricks and weights.
hint: Think about what it takes to keep measurements consistent over hundreds of kilometres.
why: Consistent bricks and weights across a vast region imply effective shared institutions, even though the nature of those institutions is unknown.
---
q: Why do historians treat the label "Priest-King" with caution?
a: Because the statue was found in Mesopotamia.
x: The bust was found at Mohenjo-daro. The problem is the label, not the findspot.
a: Because the statue is a modern forgery.
x: The bust is a genuine Harappan object. The name, not the object, is the problem.
a*: Because the name was invented by excavators and reflects their assumptions; nothing shows that the man was a priest or a king.
a: Because the statue clearly shows a woman.
x: The bust depicts a bearded man. The issue is the role assigned to him.
hint: Who gave the statue its name?
why: Modern labels can carry interpretations that the evidence does not support, especially for a society whose texts cannot be read.
```

## Trade with Mesopotamia

The Indus civilization was linked to a wider world. Mesopotamian texts from the late third millennium BCE mention a distant land called **Meluhha**, reached by sea, which supplied carnelian, ivory, fine woods, and other luxuries. Sargon of Akkad boasted that ships from Meluhha, Magan (probably Oman), and Dilmun (Bahrain) moored at the quay of his capital. Most scholars identify Meluhha with the Indus region. A Mesopotamian cylinder seal from this period belonged to a man named Shu-ilishu, described as an interpreter of the Meluhhan language, and a settlement of Meluhhans is mentioned near Lagash.

The archaeology confirms the texts. Indus seals, weights, and carnelian beads have been found in Mesopotamia and around the Gulf, including at Ur. A Harappan trading outpost at **Shortughai** in northern Afghanistan sits near sources of lapis lazuli, the deep blue stone prized in Mesopotamia. At **Lothal** in Gujarat, a large brick basin has been interpreted as a dockyard, though some archaeologists think it was a reservoir. Indus merchants evidently sailed the Arabian Sea and the Gulf, and the civilization was part of an exchange network stretching from the Indus to the Euphrates.

```checkpoint
q: What links the Mesopotamian land of "Meluhha" to the Indus civilization?
a: Indus texts that describe trade with Mesopotamia.
x: Indus texts cannot be read, so the evidence comes from Mesopotamian texts and archaeology.
a*: Mesopotamian texts describing Meluhha's goods and ships, together with Indus seals, weights, and beads found in Mesopotamia and the Gulf.
a: A bilingual inscription in Indus script and cuneiform.
x: No such bilingual text has been found; its discovery would probably allow decipherment.
a: The discovery of Mesopotamian cities in the Indus valley.
x: There are no Mesopotamian cities in the Indus region. The evidence is of trade, not settlement.
hint: Combine textual and archaeological evidence.
why: The identification rests on matching what Mesopotamian sources say about Meluhha with Indus objects found in Mesopotamia and along the trade routes.
---
q: What does the seal of Shu-ilishu show?
a: That a Mesopotamian king ruled the Indus valley.
x: The seal says nothing of political control. It concerns language and communication.
a: That Mesopotamians could read the Indus script.
x: An interpreter of spoken Meluhhan does not imply anyone could read Indus writing, which remains undeciphered.
a: That Meluhha was in Egypt.
x: The seal identifies an interpreter of Meluhhan; most scholars locate Meluhha in the Indus region, not Egypt.
a*: That contact with Meluhha was regular enough to need professional interpreters of the Meluhhan language in Mesopotamia.
hint: Shu-ilishu's title was "interpreter".
why: A professional interpreter implies sustained, regular contact between Mesopotamia and Meluhha, consistent with the archaeological evidence for trade.
```

## The Undeciphered Script

About five thousand inscribed objects survive, most of them seals, with inscriptions written mainly from right to left. There are around 400 distinct signs, too many for an alphabet and too few for a script of word signs like Chinese, which suggests a mixed system. The inscriptions are extremely short, usually about five signs, and the longest has fewer than thirty.

The script has resisted every attempt at decipherment, for three reasons. There is no bilingual inscription like the Rosetta Stone or Behistun. The language it records is unknown; proposals include an early form of a Dravidian language (the family that includes Tamil, still spoken in South India and, in the case of Brahui, in Balochistan), an Indo-Aryan language, or a language with no living descendants. And the texts are so short that statistical methods have little to work with. Many proposed "decipherments" have been published, often driven by modern political or national agendas, and none has been accepted by specialists.

In 2004 three scholars, Steve Farmer, Richard Sproat, and Michael Witzel, argued that the signs were not writing at all but a system of non-linguistic symbols, like heraldic emblems. Other researchers, including Rajesh Rao and colleagues in 2009, replied with statistical analyses suggesting that the sign sequences have the structure of language. The question remains open. It is possible that the Indus signs will never be read unless a long text or a bilingual inscription is found.

```checkpoint
q: Why has the Indus script not been deciphered?
a: Because no inscriptions have survived.
x: About five thousand inscribed objects survive. The problem is their nature, not their absence.
a: Because the script was deliberately destroyed by the Aryans.
x: There is no evidence of deliberate destruction, and the "Aryan invasion" explanation of the civilization's end has been largely abandoned.
a*: Because there is no bilingual text, the underlying language is unknown, and the inscriptions are too short for effective analysis.
a: Because it has been deciphered, but the results are kept secret.
x: No proposed decipherment has been accepted by specialists, and none is being kept secret.
hint: Compare with the keys used for hieroglyphs and cuneiform.
why: Decipherment usually depends on a bilingual text, a known related language, or long texts; the Indus script has none of these.
---
q: What did Farmer, Sproat, and Witzel argue in 2004?
a*: That the Indus signs may not be a writing system at all, but non-linguistic symbols.
a: That the script recorded an early form of Sanskrit.
x: They argued the opposite of any linguistic decipherment: that the signs may not record language at all.
a: That they had deciphered the script using a bilingual seal.
x: No bilingual seal exists, and they did not claim a decipherment.
a: That the script was borrowed from Mesopotamian cuneiform.
x: The signs bear no resemblance to cuneiform. Their argument concerned whether the signs encode language.
hint: Their thesis was controversial because it challenged the assumption that the signs were writing.
why: Their argument, challenged by statistical studies such as Rao's, shows how basic questions about the Indus script remain unresolved.
```

## A Civilization Without Kings?

Perhaps the most intriguing feature of the Indus civilization is what it lacks. There are no clearly identified palaces, no rich royal tombs, no monumental temples on the scale of Mesopotamian ziggurats, and no images of kings smiting enemies like those of Egypt. Burials are modest. Weapons are relatively rare, and there are few depictions of war. Archaeologists have sometimes called it a "faceless" civilization, and Gregory Possehl described it as a complex society that may have lacked a state in the usual sense.

How such a large society was governed is debated. Suggestions include rule by councils of elites or merchants rather than by kings; a set of independent city-states sharing a common culture; a religious authority; or forms of shared, decentralised power that archaeologists call **heterarchy**. The uniformity of bricks and weights shows that something held the civilization together, but its nature remains unknown.

It would be a mistake to imagine the Indus civilization as a peaceful utopia. Analyses of skeletons from Harappa have found evidence of interpersonal violence, especially in the later phase, and inequality is visible in the size of houses. The absence of evidence for kings and war may partly reflect what Harappan elites chose to depict, and the limits of what survives.

## The Eclipse of the Cities

Around 1900 BCE, the great cities declined. Mohenjo-daro and Harappa were largely abandoned over the following centuries, the script fell out of use, standardised weights and seals disappeared, and long-distance trade with Mesopotamia faded. Settlements moved eastward, towards the Ganges–Yamuna region, and southward into Gujarat. This was a process of **deurbanisation**, not the sudden disappearance of a people. Village life continued, and many Harappan traditions survived in altered forms.

For much of the twentieth century, the decline was explained by the **Aryan invasion theory**. Indo-European-speaking peoples, the composers of the Rigveda, were supposed to have invaded from the northwest and destroyed the cities. In the 1940s the archaeologist Mortimer Wheeler pointed to unburied skeletons at Mohenjo-daro as victims of a final massacre and wrote that the war god "Indra stands accused". In 1964 the archaeologist George Dales showed that the skeletons came from different periods and showed no signs of a single massacre, in an article titled "The Mythical Massacre at Mohenjo-daro". The invasion theory in its dramatic form has been abandoned.

Current explanations emphasise **environmental change**. A weakening of the monsoon around 4,200 years ago, the same period of drought that affected Egypt's Old Kingdom and Mesopotamia's Akkadian empire, reduced rainfall. Rivers shifted course, and the Ghaggar-Hakra system dried out. Trade with Mesopotamia declined as that region experienced its own disruptions. Faced with these pressures, people abandoned the large cities and moved to smaller settlements in regions with more reliable water.

Genetics has added a new dimension. A genome from an individual buried at Rakhigarhi between about 2800 and 2300 BCE, published in 2019, showed ancestry from populations related to ancient Iranian farmers and South Asian hunter-gatherers, but no ancestry from the Eurasian steppe. Other studies show that steppe ancestry entered South Asia mostly between about 2000 and 1500 BCE, after the decline of the Indus cities had begun. This fits a model in which Indo-European languages arrived in South Asia through migration, a gradual movement of people, not a destructive invasion, and after the peak of the Indus civilization. The topic is politically charged in modern India, where some argue that the Indo-Aryans were indigenous and that the Indus civilization was Vedic; the genetic evidence does not support that view, but it also does not support the old picture of conquering Aryans destroying the cities.

```checkpoint
q: What did George Dales show about the skeletons at Mohenjo-daro?
a: That they were victims of a single Aryan massacre.
x: Dales showed the opposite: the skeletons were not from a single event.
a: That they were the remains of royal burials.
x: The skeletons were not in royal tombs; the Indus civilization has none.
a: That they died in a flood.
x: Dales's point was that they did not belong to one event at all.
a*: That they came from different periods and showed no sign of a single massacre, undermining the invasion explanation.
hint: The title of his article was "The Mythical Massacre at Mohenjo-daro".
why: Re-examining the stratigraphy showed the skeletons were from different times, removing the main archaeological support for a violent end.
---
q: How does the genetic evidence relate to the arrival of Indo-European languages in South Asia?
a: It shows that the Indus population was descended entirely from steppe peoples.
x: The Rakhigarhi individual had no steppe ancestry at all.
a*: It suggests steppe ancestry arrived mostly between about 2000 and 1500 BCE, after the Indus decline had begun, consistent with gradual migration rather than invasion.
a: It shows that Indo-European speakers destroyed the Indus cities in a single invasion.
x: Steppe ancestry arrived mostly after the cities had started to decline, and genetics cannot show violent destruction.
a: It shows that Indo-European languages originated in the Indus valley.
x: The Rakhigarhi genome's lack of steppe ancestry argues against that view.
hint: Compare the timing of steppe ancestry with the timing of the Indus decline.
why: The timing points to migration after the Mature Harappan peak, replacing both the old invasion theory and the claim that the Indus civilization was Vedic.
```

## A Place in the Deep History of South Asia

The Indus civilization is not a dead end. Many of its features continued in later South Asian life: some farming practices and crops, styles of jewellery such as shell bangles, techniques of bead-making, and perhaps the importance of ritual bathing. Some scholars have read a seated figure on a famous seal, the so-called "Pashupati" seal, as an early form of the god Shiva or a yogic posture, though this interpretation is speculative. The genetic legacy is clearer: populations related to the Indus people form one of the main ancestral components of most people in South Asia today.

The Indus civilization also challenges assumptions about what early civilizations had to look like. It suggests that a large, sophisticated urban society could exist without visible kings, monumental tombs, or glorification of war. Until its script is read, much about it will remain unknown, and it remains a reminder of how much of the past is still out of reach.

## Further exploration

- **Gregory L. Possehl, *The Indus Civilization: A Contemporary Perspective* (2002).** A comprehensive survey by a leading specialist.
- **Andrew Robinson, *The Indus: Lost Civilizations* (2015).** An accessible introduction, including the problem of the script.
- **Jonathan Mark Kenoyer, *Ancient Cities of the Indus Valley Civilization* (1998).** A richly illustrated account by an excavator of Harappa.
- **Tony Joseph, *Early Indians: The Story of Our Ancestors and Where We Came From* (2018).** The genetic evidence for South Asian history, for a general reader.
- **Upinder Singh, *A History of Ancient and Early Medieval India* (2008).** The standard textbook on early South Asia, setting the Indus civilization in its longer context.$indus_master$,
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
  select $indus_quiz$[
    {"type": "mcq", "prompt": "Which feature of Indus cities was unmatched elsewhere at the time?", "options": ["Monumental royal tombs", "Covered drains and household sanitation on a city-wide scale", "Stone temple-pyramids", "Iron weapons"], "answerIndex": 1, "explanation": "Many houses had bathing areas and toilets connected to covered street drains, an unusual provision for ordinary households.", "id": "q1"},
    {"type": "mcq", "prompt": "Why do most scholars identify Mesopotamia's 'Meluhha' with the Indus region?", "options": ["An Indus bilingual inscription names it", "Mesopotamian texts about Meluhha's goods and ships match Indus objects found in Mesopotamia and the Gulf", "Meluhha is the Indus people's own name for their land", "Greek historians said so"], "answerIndex": 1, "explanation": "The identification rests on combining textual descriptions with archaeological finds such as Indus seals, weights, and carnelian beads.", "id": "q2"},
    {"type": "mcq", "prompt": "What replaced the Aryan invasion theory as the main explanation for the decline of the Indus cities?", "options": ["Conquest by Egypt", "A sudden volcanic eruption", "Environmental change, including a weakening monsoon and shifting rivers, leading to deurbanisation and eastward movement", "A plague introduced by Mesopotamian traders"], "answerIndex": 2, "explanation": "Climate and river changes, together with declining trade, led people to leave the large cities for smaller settlements; it was a transformation, not a massacre.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the 2019 Rakhigarhi genome show?", "options": ["Mostly steppe ancestry", "Egyptian ancestry", "That the Indus people spoke Sanskrit", "Ancestry related to ancient Iranian farmers and South Asian hunter-gatherers, with no steppe ancestry"], "answerIndex": 3, "explanation": "The individual had no steppe ancestry; steppe ancestry entered South Asia mostly after about 2000 BCE.", "id": "q4"},
    {"type": "open", "prompt": "The Indus civilization has been called 'faceless'. What does this mean, and what are the competing explanations for how it was governed?", "rubric": "A strong answer explains the absence of clearly identified palaces, royal tombs, monumental temples, royal images, and depictions of war, with modest burials and relatively few weapons. It sets this against the strong evidence of coordination (standardised bricks in 1:2:4 proportions, uniform weights, planned cities, drainage). It outlines competing explanations: councils of elites or merchants, independent city-states sharing a culture, religious authority, heterarchy. It notes caveats: evidence of interpersonal violence at Harappa and inequality in house sizes, and the limits imposed by the undeciphered script.", "id": "q5"},
    {"type": "open", "prompt": "Why has the Indus script resisted decipherment, and why does the debate over it matter beyond linguistics?", "rubric": "A strong answer explains the lack of a bilingual text, the unknown language (Dravidian, Indo-Aryan, or extinct candidates), the very short inscriptions (around five signs on average, about 400 sign types), and the Farmer–Sproat–Witzel argument that the signs may not be writing, with Rao and colleagues' statistical rejoinder. It explains wider stakes: proposed decipherments often serve modern national or political agendas, especially the claim that the Indus civilization was Vedic and Indo-Aryan, which bears on questions of identity in modern India; the genetic timing of steppe ancestry is relevant here.", "id": "q6"}
  ]$indus_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/the-indus-valley-civilization', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
