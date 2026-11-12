-- Ancient Israel and the Levant — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/ancient-israel-and-the-levant @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The alphabet, the Phoenicians, the emergence of Israel, the Hebrew Bible
-- as a historical source, the two kingdoms in external records, the
-- development of monotheism, and exile and return.
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
    'history/ancient-civilizations/ancient-israel-and-the-levant',
    'research',
    'advanced',
    'read',
    $levant_master$> **The Levant**, the strip of land along the eastern Mediterranean coast that today includes Israel, the Palestinian territories, Lebanon, Syria, and Jordan, was a small and contested corridor between the great powers of Egypt and Mesopotamia. Its peoples were rarely powerful, and they were conquered again and again. Yet two inventions that came out of this corridor changed the world more than any empire did: the **alphabet**, ancestor of most of the scripts used today, and a scripture-centred **monotheism** that became the foundation of Judaism, Christianity, and Islam. This chapter covers both, and it also deals with one of the most sensitive problems in ancient history: how to use the Hebrew Bible as a historical source.

## A Corridor Between Empires

The Levant is small. From the coast to the desert is rarely more than 150 kilometres, and the land is divided by mountains, valleys, and the deep rift of the Jordan River and Dead Sea. Rainfall farming was possible, unlike in Egypt or southern Mesopotamia, but harvests were uncertain, and there were no great river valleys to support large states. Instead, the region was home to many small city-states and, later, small kingdoms.

Its location made it valuable to others. The coastal route between Egypt and Mesopotamia and Anatolia ran through it, and so did trade routes from Arabia. During the Late Bronze Age, as the previous chapter described, the cities of **Canaan**, the ancient name for much of the region, were vassals of Egypt, and their rulers' letters survive among the Amarna archive. When the Bronze Age system collapsed around 1200 BCE, Egyptian control ended, and new peoples and polities emerged: the Phoenician cities on the coast, the Philistines in the southwest, the Aramaeans in Syria, and Israel, Judah, Ammon, Moab, and Edom inland.

## The Alphabet

The earliest alphabetic writing comes not from a centre of power but from its margins. Inscriptions found at **Wadi el-Hol** in Egypt, dating to around 1900–1800 BCE, and at **Serabit el-Khadim**, an Egyptian turquoise-mining site in Sinai, show that people who spoke a Semitic language, probably workers, soldiers, or traders in contact with Egypt, borrowed Egyptian hieroglyphic signs and used them in a new way. Each sign stood for the first sound of the Semitic word for the thing it pictured. A picture of an ox's head, *alp* in their language, stood for the sound at the start of that word; a house, *bet*, stood for "b". This is the **acrophonic principle**. A claim that clay cylinders from Umm el-Marra in Syria, of about 2300 BCE, carry alphabetic signs would push the story back several centuries, but it is disputed.

The result was revolutionary in its simplicity. Instead of hundreds of signs, an alphabet needed only a couple of dozen, each for a single consonant. It could be learned in weeks rather than years, which in principle broke the monopoly of professional scribes. By around 1000 BCE the **Phoenician alphabet** had settled into a standard form of 22 letters, all consonants, written from right to left. Ugarit had already developed its own 30-sign alphabet written in cuneiform wedges, showing that the alphabetic idea was in the air across the region.

From Phoenician, the alphabet spread in several directions. The Greeks adopted it, probably in the early eighth century BCE (some argue earlier), and added letters for vowels, using Phoenician signs for consonants that Greek did not need. *Alpha* and *beta* preserve *alp* and *bet*, and the word alphabet comes from them. From Greek came the Etruscan and then the Latin alphabet, the script of this text. The Aramaic alphabet, descended from Phoenician, became the administrative script of the Persian empire and the ancestor of the square Hebrew script, of Syriac, and of Arabic, and possibly influenced the Brahmi script of India. Almost every alphabet in use today descends from that adaptation of Egyptian pictures by Semitic speakers nearly four thousand years ago.

```checkpoint
q: What is the acrophonic principle in the invention of the alphabet?
a*: Each sign stood for the first sound of the word for the object it pictured, as the ox's head, alp, stood for the initial sound of alp.
a: Each letter was invented as an abstract shape with no connection to pictures.
x: The earliest letters were pictures borrowed from Egyptian hieroglyphs. The innovation was in how they were used.
a: Each sign stood for a whole word, as in Egyptian hieroglyphs.
x: That describes logographic writing. The alphabet's innovation was that signs stood for single sounds.
a: Each sign stood for a syllable combining a consonant and a vowel.
x: That is a syllabary, like Linear B. The early alphabet recorded consonants only.
hint: Think about where alpha and beta come from.
why: By using a picture for the first sound of its name, the inventors turned a few dozen images into a complete system for writing sounds.
---
q: What did the Greeks add when they adopted the Phoenician alphabet?
a: Pictures for every word in Greek.
x: The Greeks kept a small set of letters; they did not return to word signs.
a: Letters written from top to bottom.
x: Greek eventually settled on left-to-right writing, but the key innovation was vowels, not direction.
a*: Letters for vowels, often by reusing Phoenician signs for consonants that Greek did not need.
a: An entirely new set of letters unrelated to Phoenician.
x: Greek letters are clearly descended from Phoenician ones, as their names and shapes show.
hint: Phoenician wrote only consonants.
why: Adding vowels made the alphabet a fuller representation of speech, and this Greek version became the ancestor of the Latin alphabet.
```

## The Phoenicians

The coastal cities of **Tyre, Sidon, and Byblos**, in modern Lebanon, survived the Bronze Age collapse better than most and flourished in the early Iron Age. The Greeks called their people *Phoinikes*, possibly after the costly purple dye they made from murex sea snails; the Phoenicians called themselves after their cities, or Canaanites. Byblos was so closely associated with the papyrus trade that the Greek word for papyrus, *byblos*, gave rise to *biblion*, "book", and ultimately to the word Bible.

The Phoenicians were the great seafaring traders of the Iron Age Mediterranean. They founded colonies and trading posts across it: Kition on Cyprus, Motya in Sicily, Gadir (modern Cádiz) beyond the Strait of Gibraltar, and above all **Carthage** in modern Tunisia, traditionally founded from Tyre in 814 BCE, which would later become Rome's great rival. Herodotus reports that Phoenician sailors working for the Egyptian king Necho II, around 600 BCE, sailed around Africa from the Red Sea, taking three years. He doubted one detail of their story, that while sailing west around the south of Africa they had the sun on their right, which is exactly what would happen in the southern hemisphere, and is why many historians think the voyage may have happened.

The Hebrew Bible describes King Hiram of Tyre supplying cedar and craftsmen for Solomon's temple in Jerusalem. Whatever the historical details, the account reflects real connections: inland Israel and Judah depended on Phoenician ports, ships, and skills.

## Israel Emerges

The earliest certain mention of Israel outside the Bible appears on the **Merneptah Stele**, an Egyptian victory monument of about 1208 BCE, which lists peoples and places defeated in Canaan and declares: "Israel is laid waste, his seed is not." The hieroglyphic sign used with the name marks Israel as a people rather than a city or territory. So by the late thirteenth century BCE a group called Israel existed in Canaan.

Where did it come from? The biblical narrative tells of the patriarchs, slavery in Egypt, the Exodus under Moses, forty years in the wilderness, and a rapid conquest of Canaan under Joshua. Archaeology has not found evidence for this sequence as described. There is no archaeological trace of a mass migration through Sinai, and several cities said to have been conquered were abandoned or at most small settlements at the relevant time. Ai had been abandoned for more than a thousand years, according to excavations from the 1930s onward; at Jericho, Kathleen Kenyon's excavations in the 1950s dated the great destruction to about 1550 BCE, and recent Italian–Palestinian work has found only a modest Late Bronze Age town.

What archaeology does show is that around 1200–1000 BCE, the central highlands of Canaan, previously thinly settled, filled with hundreds of small, unwalled farming villages. Surveys by Israel Finkelstein and others documented this pattern. The villages' pottery and building styles were largely continuous with Canaanite traditions, though some features were distinctive, such as "four-room houses" and an apparent absence of pig bones. Most archaeologists now think the early Israelites emerged largely from within Canaanite society, perhaps including people who left the declining lowland cities and pastoral groups who settled down, rather than arriving as an invading army. A small group with memories of escape from Egypt may have contributed to the later tradition, but this cannot be demonstrated.

```checkpoint
q: What is significant about the Merneptah Stele?
a: It describes the Exodus from the Egyptian point of view.
x: The stele does not mention an Exodus; it lists peoples defeated in Canaan.
a*: It contains the earliest mention of Israel outside the Bible, identifying Israel as a people in Canaan around 1208 BCE.
a: It records the founding of Jerusalem by King David.
x: The stele is about two centuries earlier than the traditional date of David and does not mention Jerusalem.
a: It proves that Israel was a large kingdom by 1208 BCE.
x: The stele marks Israel as a people, not a kingdom or city, and says nothing about its size.
hint: Look at the determinative sign used with the name.
why: The stele places a people called Israel in Canaan at the end of the thirteenth century BCE, the starting point for any historical reconstruction.
---
q: What does the archaeology of the central highlands around 1200–1000 BCE suggest about the origins of Israel?
a: That Israel arrived as a large invading army that destroyed Canaanite cities.
x: Excavations do not show the pattern of destruction this would require, and some cities named in the conquest story were unoccupied at the time.
a: That Israel came from Mesopotamia in a single migration.
x: The highland villages' material culture is largely continuous with Canaanite traditions, not Mesopotamian ones.
a: That the highlands were densely occupied by cities before Israel appeared.
x: The highlands were thinly settled before about 1200 BCE; the new villages are what changed.
a*: That early Israel emerged largely from within Canaanite society, as new villages spread across the highlands with mostly Canaanite material culture.
hint: Compare the pottery and houses with earlier Canaanite styles.
why: Settlement surveys show a gradual growth of small villages with Canaanite roots, which most archaeologists interpret as indigenous emergence rather than conquest.
```

## The Bible as a Historical Source

This is the point at which the methods of *What is History?* matter most. The Hebrew Bible is a collection of texts written, edited, and compiled over many centuries, mostly between the eighth and fourth centuries BCE, by people with strong religious and political purposes. It contains law, poetry, prophecy, and narrative. Its narratives about the distant past were written long after the events they describe. As with Herodotus, Sima Qian, or the Sumerian King List, historians test its claims against independent evidence and ask why each part was written.

From the late twentieth century, scholars divided sharply over how much history the Bible's accounts of early Israel contain. So-called **minimalists**, associated with scholars in Copenhagen and Sheffield, argued that most of the narrative about early Israel, including the united monarchy of David and Solomon, was a later literary creation of the Persian or Hellenistic periods. **Maximalists** argued that the texts preserve substantial reliable memory. Most scholars today occupy a middle ground: the texts contain real historical information, especially from the ninth century BCE onwards, embedded in later theological interpretation, and each claim must be assessed individually.

The case of **David** shows how this works. For a long time there was no evidence for him outside the Bible. Then in 1993–94, excavators at Tel Dan in northern Israel found fragments of an Aramaic inscription from the ninth century BCE in which a king of Damascus boasts of killing a king of Israel and a king of the "House of David". The **Tel Dan Stele** shows that within about 150 years of his traditional dates, a dynasty in Judah traced itself to a founder called David. It does not confirm the Bible's portrait of a great king ruling a large united kingdom from Jerusalem. Archaeologists still argue, using sites such as Khirbet Qeiyafa and debates over dating pottery layers, about whether tenth-century Judah was a substantial state or a small highland chiefdom.

{{image: Tel Dan Stele | The Tel Dan Stele, a ninth-century BCE Aramaic inscription that refers to the "House of David", the earliest widely accepted reference to David's dynasty outside the Bible.}}

```checkpoint
q: What does the Tel Dan Stele establish about King David?
a: That David ruled a large empire from Egypt to the Euphrates.
x: The stele says nothing about the extent of David's rule. It refers only to his dynasty.
a: That David was a purely mythical figure.
x: The stele points the other way: a dynasty named after David existed within about 150 years of his traditional dates.
a*: That by the ninth century BCE a dynasty in Judah was known as the "House of David", tracing itself to a founder of that name.
a: That David built the Jerusalem temple.
x: The stele does not mention the temple, which the Bible attributes to Solomon.
hint: The inscription mentions a dynasty, not a reign.
why: The stele is independent evidence for a Davidic dynasty, but it cannot by itself confirm the Bible's account of David's kingdom.
---
q: Which statement best describes the current scholarly approach to the Hebrew Bible as a historical source?
a*: The texts contain real historical information, particularly from the ninth century BCE onwards, within later theological interpretation, and each claim must be tested individually.
a: Every narrative should be accepted as accurate unless proven false.
x: That approach ignores the texts' late composition and theological purposes, which the methods of source criticism require historians to consider.
a: The Bible contains no historical information and should be ignored.
x: Many details from the ninth century BCE onwards are confirmed by independent sources, such as Assyrian records.
a: Only the books of law contain historical information.
x: Historical information appears in narrative books such as Kings, often corroborated by external sources.
hint: Think about the middle ground between minimalists and maximalists.
why: Treating the Bible like any other ancient source, neither accepting nor rejecting it wholesale, allows historians to identify what is corroborated and what reflects later interpretation.
```

## Two Kingdoms Among the Empires

From the ninth century BCE, the evidence becomes much stronger, because the great empires began to record their dealings with the region. The Bible describes two kingdoms: **Israel** in the north, larger and richer, with its capital at Samaria, and **Judah** in the south, centred on Jerusalem.

External sources confirm that the northern kingdom was a significant power. The Assyrian king Shalmaneser III's **Kurkh Monolith** records that at the battle of Qarqar in 853 BCE, "Ahab the Israelite" brought 2,000 chariots to a coalition against Assyria, more than any other ally (some scholars suspect a scribal error for 200). The Moabite **Mesha Stele** (about 840 BCE) records how Moab had been oppressed by Omri, king of Israel, before King Mesha threw off Israelite rule, a story told from the opposite side in the Bible. Shalmaneser's **Black Obelisk** shows a king, usually identified as Jehu of the house of Omri, bowing before him with tribute, often described as the earliest surviving image of an Israelite or Judahite king.

Assyria destroyed the northern kingdom in 722 BCE (or 720, by some reckonings) and deported much of its population. Judah survived as an Assyrian vassal. A tunnel cut through rock to bring water from the Gihon spring into Jerusalem is usually attributed to its king Hezekiah, preparing for rebellion (some archaeologists date it a century earlier); an inscription found in the tunnel in 1880 describes the moment when the two teams of diggers, working from opposite ends, met. In 701 BCE Sennacherib's army devastated Judah, as the chapter on Mesopotamia described, but Jerusalem itself was not taken. Around 622 BCE, according to the Bible, King **Josiah** carried out a religious reform after a "book of the law" was found in the Temple; many scholars connect this book with an early form of Deuteronomy and see Josiah's reign as a key period in shaping Israel's history and law. In 587 or 586 BCE the Babylonians under Nebuchadnezzar II destroyed Jerusalem and its Temple. Ostraca (inscribed potsherds) from the fortress of Lachish record the last days of Judah before the Babylonian conquest.

```checkpoint
q: Why are sources such as the Kurkh Monolith and the Mesha Stele valuable for the history of Israel?
a: Because they were written by Israelite scribes.
x: They were written by Assyrian and Moabite rulers, which is precisely why they are independent of the Bible.
a: Because they record the Exodus.
x: These ninth-century sources concern the kingdoms of Israel and its neighbours, not the Exodus.
a: Because they prove that Judah was more powerful than Israel.
x: The Kurkh Monolith suggests the opposite: the northern kingdom of Israel was the stronger power in the ninth century.
a*: Because they are independent, non-biblical sources from other kingdoms that confirm and sometimes contradict the biblical account.
hint: Who wrote them?
why: Sources from outside Israel and Judah, especially enemies, provide corroboration and alternative perspectives, the core of source criticism.
---
q: What does the evidence from the ninth century BCE suggest about the northern kingdom of Israel?
a: That it was a minor vassal of Judah.
x: External sources show Israel as the more powerful of the two kingdoms in this period.
a*: That it was a significant regional power, credited with 2,000 chariots at Qarqar and to rule over neighbouring Moab.
a: That it did not exist.
x: It is named in Assyrian and Moabite inscriptions.
a: That it was conquered by Egypt.
x: Israel was eventually conquered by Assyria in 722 BCE, not Egypt.
hint: Look at the Kurkh Monolith and the Mesha Stele.
why: Independent sources show a strong northern kingdom under the Omride dynasty, more prominent than the biblical narrative, written largely from Judah's perspective, might suggest.
```

## From Many Gods to One

Monotheism, the belief that only one god exists, did not appear fully formed. The evidence suggests that the religion of ancient Israel and Judah developed over centuries from a form of worship that recognised several gods.

The god of Israel and Judah was **Yahweh**. Inscriptions from Kuntillet Ajrud in the Sinai (around 800 BCE) and from Khirbet el-Qom (later eighth century BCE) contain blessings "by Yahweh and his Asherah", suggesting that many people worshipped Yahweh alongside a female consort, a practice the biblical prophets condemned. The Bible itself preserves traces of older beliefs, such as references to Yahweh as the chief among other gods. Scholars often describe a stage of **monolatry**, worship of one god while accepting that other gods exist, before full monotheism. The prophets' demand for exclusive worship of Yahweh, Josiah's centralisation of worship in Jerusalem, and above all the crisis of the Babylonian exile pushed the religion towards the explicit statement, in the later chapters of the book of Isaiah, that Yahweh alone is God and the gods of other nations are nothing.

## Exile and Return

The **Babylonian exile** transformed Judah's religion and identity. Deported to Babylonia, the elite of Judah had to explain their catastrophe without their Temple, king, or land. Much of the Hebrew Bible was written, edited, or compiled in response, presenting the disaster as divine punishment for unfaithfulness and preserving the people's identity through law, sacred history, Sabbath observance, and circumcision rather than territory.

In 539 BCE Cyrus of Persia took Babylon. The **Cyrus Cylinder**, a clay cylinder inscribed in Akkadian cuneiform, describes his policy of restoring gods to their sanctuaries and returning displaced peoples; it does not mention the Judahites specifically, but it is consistent with the biblical account that Cyrus allowed exiles to return and rebuild the Temple. The **Second Temple** was completed, by tradition, around 516–515 BCE, and Judah, now the Persian province of **Yehud**, became a small temple community. Many scholars think that the Torah, the first five books of the Bible, reached something close to its final form in this Persian period.

Not everyone returned. Communities of Judahites remained in Babylonia, and papyri from **Elephantine**, an island on the Nile in southern Egypt, show a Jewish military garrison in the fifth century BCE serving the Persians, with its own temple to Yahweh, a reminder that ancient Judaism was more varied than later tradition remembered. The scattering of the people of Judah across the empires, and their survival as a people without a state, began here. It is the beginning of the Jewish diaspora, and of a religion that would shape the history of much of the world.

```checkpoint
q: What do the inscriptions from Kuntillet Ajrud suggest about religion in Israel and Judah around 800 BCE?
a: That everyone already worshipped Yahweh alone.
x: Blessings "by Yahweh and his Asherah" suggest that worship of Yahweh alongside other deities was common.
a*: That Yahweh was probably worshipped alongside Asherah, whether as a goddess or a cult symbol, a practice the prophets condemned.
a: That Yahweh was unknown before the exile.
x: The inscriptions date from about 800 BCE, two centuries before the exile, and name Yahweh.
a: That the Israelites worshipped only Egyptian gods.
x: The inscriptions name Yahweh and Asherah, not Egyptian deities.
hint: Read the phrase "by Yahweh and his Asherah" carefully.
why: Inscriptions show popular religion that differed from later biblical ideals, supporting the view that monotheism developed gradually.
---
q: Why was the Babylonian exile so important for the development of Judaism?
a: Because it ended all religious practice among the Judahites.
x: The opposite happened: the exile intensified religious reflection and writing.
a: Because the exiles adopted Babylonian religion entirely.
x: The exiles preserved a distinct identity and religion in Babylonia.
a: Because the exile created the Phoenician alphabet.
x: The alphabet predates the exile by many centuries.
a*: Because, without Temple, king, or land, the exiles preserved their identity through scripture, law, and practices such as the Sabbath, and much of the Bible was shaped in response.
hint: How do you keep a religion alive without its Temple?
why: The crisis of exile transformed a temple-and-kingdom religion into one centred on scripture and practice, able to survive without a state.
```

## Further exploration

- **Israel Finkelstein and Neil Asher Silberman, *The Bible Unearthed* (2001).** An influential and accessible archaeological account of early Israel, from the critical side of the debate.
- **William G. Dever, *What Did the Biblical Writers Know and When Did They Know It?* (2001).** A response from an archaeologist who sees more history in the texts.
- **Mark S. Smith, *The Early History of God* (2nd ed., 2002).** The development of Israelite religion from polytheism to monotheism.
- **Josephine Quinn, *In Search of the Phoenicians* (2018).** Who the Phoenicians were, and whether they saw themselves as a single people.
- **John Man, *Alpha Beta: How 26 Letters Shaped the Western World* (2000).** A popular history of the alphabet.$levant_master$,
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
  select $levant_quiz$[
    {"type": "mcq", "prompt": "Where does the earliest evidence for alphabetic writing come from?", "options": ["The royal libraries of Nineveh", "Inscriptions in Egypt and Sinai made by Semitic speakers adapting Egyptian signs, from about 1900–1800 BCE", "Greek temples of the eighth century BCE", "Phoenician colonies in Spain"], "answerIndex": 1, "explanation": "Inscriptions at Wadi el-Hol and Serabit el-Khadim show Semitic speakers using Egyptian pictures for the first sounds of their own words.", "id": "q1"},
    {"type": "mcq", "prompt": "Which source contains the earliest mention of 'Israel' outside the Bible?", "options": ["The Tel Dan Stele", "The Mesha Stele", "The Merneptah Stele, about 1208 BCE", "The Cyrus Cylinder"], "answerIndex": 2, "explanation": "Merneptah's victory monument names Israel as a people in Canaan in the late thirteenth century BCE.", "id": "q2"},
    {"type": "mcq", "prompt": "What does the Kurkh Monolith record about Ahab of Israel?", "options": ["That he brought a reported 2,000 chariots to the battle of Qarqar in 853 BCE", "That he was defeated by Moab", "That he built the Jerusalem temple", "That he was deported to Babylon"], "answerIndex": 0, "explanation": "Shalmaneser III's inscription lists Ahab's large chariot force, evidence that the northern kingdom was a significant power.", "id": "q3"},
    {"type": "mcq", "prompt": "What does the Elephantine archive show?", "options": ["That all Jews returned to Judah after the exile", "That the alphabet was invented in Egypt", "That the Persians destroyed the Second Temple", "That a Jewish garrison in fifth-century BCE Egypt had its own temple to Yahweh"], "answerIndex": 3, "explanation": "The papyri reveal a Jewish military community on the Nile with its own temple, showing that ancient Judaism was more varied than later tradition remembered.", "id": "q4"},
    {"type": "open", "prompt": "How should historians use the Hebrew Bible as a source for the history of ancient Israel? Illustrate your answer with at least two examples from the chapter.", "rubric": "A strong answer explains that the Bible was written and edited over centuries, mostly between the eighth and fourth centuries BCE, with religious and political purposes, so it must be tested against independent evidence like any ancient source. It describes the minimalist–maximalist debate and the middle ground. Examples might include: the absence of archaeological evidence for the Exodus and conquest (Jericho, Ai) and the highland settlement pattern; the Tel Dan Stele and what it does and does not show about David; ninth-century corroboration from the Kurkh Monolith, Mesha Stele, and Black Obelisk; Sennacherib's annals for 701 BCE; or the Kuntillet Ajrud inscriptions as evidence against an early monotheism.", "id": "q5"},
    {"type": "open", "prompt": "Trace the development from the worship of Yahweh among other gods to explicit monotheism. What role did the Babylonian exile play?", "rubric": "A strong answer uses evidence such as the Kuntillet Ajrud and Khirbet el-Qom blessings 'by Yahweh and his Asherah', biblical traces of Yahweh among other gods, monolatry as an intermediate stage, the prophets' demand for exclusive worship, Josiah's centralisation around 622 BCE, and the explicit monotheism of the later chapters of Isaiah. It explains how the exile, without Temple, king, or land, pushed Judahite religion towards scripture, law, and practices such as the Sabbath, and how much of the Bible was shaped in response, laying foundations for Judaism's survival without a state.", "id": "q6"}
  ]$levant_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/ancient-israel-and-the-levant', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
