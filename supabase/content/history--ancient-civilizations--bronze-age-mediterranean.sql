-- The Bronze Age Mediterranean and Its Collapse — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/the-bronze-age-mediterranean-and-its-collapse @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Minoan and Mycenaean palaces, Linear B, the Hittites and the Amarna
-- letters, the Uluburun shipwreck, the collapse around 1200 BCE as systems
-- collapse, and the world after it.
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
    'history/ancient-civilizations/the-bronze-age-mediterranean-and-its-collapse',
    'research',
    'advanced',
    'read',
    $bronze_master$> **The Late Bronze Age** in the eastern Mediterranean, roughly 1600 to 1200 BCE, was an international system of great kingdoms, Egypt, the Hittites, Babylon, Assyria, and Mitanni, together with the palace societies of Crete and mainland Greece and the trading cities of the Levant coast. Its rulers wrote to each other as "brothers", exchanged princesses and gold, and depended on long-distance trade for the copper and tin that made bronze. Then, within a few decades around 1200 BCE, most of it fell apart: palaces burned, writing systems were forgotten, and great powers vanished. This chapter describes that connected world and the long argument over why it collapsed, an argument that has become a case study in how complex systems fail.

## Bronze and the Problem of Tin

Bronze is an alloy of roughly nine parts copper to one part tin. It is harder than copper and easier to cast, and for two thousand years it was the material of weapons, tools, and prestige objects across western Eurasia. Copper was fairly widely available; Cyprus was a major source, and the island's name is linked to the word copper itself. Tin was not. The tin used in the eastern Mediterranean came from distant and uncertain sources, including Central Asia, Anatolia, and western Europe, and moved through long chains of merchants and rulers.

That dependence matters for the story. A Bronze Age kingdom could not arm itself without imported metal, so the great powers had a shared interest in keeping trade routes open, and a shared vulnerability if they closed.

## Palaces of Crete and Greece

On Crete, from about 1900 BCE, the society archaeologists call **Minoan** built large palace complexes at Knossos, Phaistos, Malia, and elsewhere: multi-storey buildings around central courts, with storerooms holding huge jars of oil and grain, workshops, and brilliantly painted walls. The name "Minoan", a modern coinage after the legendary King Minos, was popularised by **Arthur Evans**, who excavated Knossos from 1900; what the Cretans called themselves is unknown. Evans also heavily reconstructed parts of the palace in reinforced concrete, according to his own interpretations, which still shapes what visitors see. The Minoans wrote in a script now called **Linear A**, which has not been deciphered.

On the volcanic island of Thera (Santorini), north of Crete, a huge eruption buried the town of **Akrotiri** under ash, preserving houses with vivid frescoes much as Vesuvius later preserved Pompeii. Radiocarbon dates long placed the eruption in the later seventeenth century BCE, about a century earlier than the date of around 1500 BCE that archaeologists derived from Egyptian chronology. Since 2018, revised radiocarbon calibration and new samples have allowed dates in the sixteenth century BCE, narrowing the gap, but the exact date is still unsettled. The eruption did not destroy Minoan civilization, which continued for more than a century, but it may have weakened it.

On the Greek mainland, a warlike society called **Mycenaean**, after its best-known site, Mycenae, built fortified palaces at Mycenae, Tiryns, Pylos, and Thebes. Heinrich Schliemann, a wealthy German businessman turned archaeologist, excavated the shaft graves at Mycenae in 1876 and found gold death masks, one of which he claimed as the face of Agamemnon. The mask is in fact centuries older than any possible Trojan War. Around 1450 BCE Mycenaeans appear to have taken control of Knossos.

The Mycenaeans wrote in **Linear B**, adapted from Linear A. In 1952 **Michael Ventris**, an English architect who had worked on the script as a hobby since his schooldays, showed that it recorded an early form of Greek, and he worked out the details with the philologist John Chadwick. The decipherment surprised many specialists, including Ventris himself, who had expected an unknown language. The tablets do not contain literature or history. They are administrative records: rations, livestock, textiles, chariot wheels, bronze allocated to smiths, and offerings to gods, among them Zeus, Hera, and Poseidon. Many survived only because the palaces that held them burned, firing the clay.

{{image: Knossos | Part of the palace of Knossos on Crete, centre of the Minoan world, as reconstructed by Arthur Evans in the early twentieth century.}}

```checkpoint
q: What did Michael Ventris's decipherment of Linear B reveal?
a*: That Mycenaean palace records were written in an early form of Greek, and that they were mainly administrative accounts.
a: That the Minoans spoke an early form of Egyptian.
x: Linear B was the Mycenaean script, and it recorded Greek. The Minoans' Linear A remains undeciphered.
a: That Homer's Iliad was written down in the Bronze Age.
x: The tablets contain no literature; they are records of goods, people, and offerings. Homer's epics were written down centuries later.
a: That Linear A and Linear B recorded the same language.
x: Linear B was adapted from Linear A, but Linear A appears to record a different, still unknown language.
hint: Think about what kind of documents the tablets are and what language they use.
why: Linear B showed that the Mycenaeans spoke Greek and that their writing served the palace administration, much as the earliest Mesopotamian writing did.
---
q: Why should modern visitors to Knossos be cautious about what they see?
a: Because the site is a modern forgery.
x: Knossos is a genuine Bronze Age palace. The issue is the extent of modern reconstruction.
a: Because nothing at Knossos is older than the Roman period.
x: The palace dates from the Bronze Age, from about 1900 BCE onwards.
a*: Because Arthur Evans reconstructed parts of the palace in concrete according to his own interpretations, which shape the visible site.
a: Because the palace was never excavated.
x: Knossos has been excavated extensively since 1900.
hint: The reconstruction was done in reinforced concrete.
why: Evans's restorations embody one interpretation of the evidence, so the site itself is partly an argument, not simply a survival.
```

## Great Kings and Their Letters

In Anatolia, the **Hittites** ruled a powerful kingdom from their capital at Hattusa, in central Turkey. Their language, deciphered by the Czech scholar Bedřich Hrozný in 1915, is the oldest attested Indo-European language, related distantly to Greek, Latin, and Sanskrit. Thousands of tablets from Hattusa record treaties, laws, rituals, and royal letters, including correspondence of Queen Puduhepa, who played an unusually prominent role in diplomacy alongside her husband Hattusili III.

The best window into how the great powers dealt with one another is the **Amarna letters**, about 380 clay tablets found in 1887 at Amarna in Egypt, the capital built by Akhenaten. They date from roughly the 1360s to the 1330s BCE and are mostly written in Akkadian cuneiform, the diplomatic language of the age, even between rulers who did not speak it. The letters reveal a club of "Great Kings", the rulers of Egypt, Babylon, Assyria, Mitanni, the Hittites, and Alashiya (Cyprus), who addressed each other as "brother", exchanged lavish gifts, and arranged royal marriages. They also complained constantly. The Babylonian king Burna-Buriash protested that Egyptian gold sent to him proved short in weight when put in the furnace, and that his messenger had been detained for two years.

Other Amarna letters come from Egypt's vassals in Canaan, local rulers of cities such as Byblos and Jerusalem, who flattered the pharaoh, accused one another of disloyalty, and begged for troops against raiders and outlaws they called *'Apiru*. The system was hierarchical: great kings dealt with each other as equals, while lesser rulers were expected to obey.

The relationship between Egypt and the Hittites was settled some fifteen years after the battle of Kadesh by the peace treaty of about 1259 BCE between Ramesses II and Hattusili III, discussed in the chapter on Ancient Egypt. Hittite texts also refer to a western land called *Wilusa*, which many scholars identify with Homer's Ilios (Troy), and to a power called *Ahhiyawa*, probably the Mycenaean Greeks. They show Mycenaeans active on the Anatolian coast and offer tantalising, though inconclusive, evidence about the background to the Trojan War legend.

```checkpoint
q: Why were the Amarna letters written mainly in Akkadian cuneiform?
a: Because all the kings involved were Babylonian.
x: The correspondents included rulers of Egypt, the Hittites, Mitanni, and Cyprus. Akkadian was a shared diplomatic language, not their native tongue.
a*: Because Akkadian was the international diplomatic language of the age, used even between rulers who did not speak it.
a: Because Egyptian hieroglyphs had not yet been invented.
x: Hieroglyphs had been in use for nearly two thousand years by this time.
a: Because the letters were written centuries later by Babylonian scholars.
x: The letters are contemporary documents found in Akhenaten's capital.
hint: Compare it with the role of French in nineteenth-century European diplomacy.
why: A common written language let scribes across the Near East communicate, a sign of how integrated the Late Bronze Age system was.
---
q: What do the Amarna letters reveal about the Late Bronze Age international system?
a: That all rulers were treated as equals.
x: Great kings called each other "brother", but vassal rulers in Canaan were expected to obey and flatter the pharaoh.
a: That Egypt had no contact with other powers.
x: The letters themselves are evidence of intense contact between Egypt and other states.
a: That the great powers never quarrelled.
x: The letters are full of complaints, including Burna-Buriash's protest about fake gold.
a*: That a small group of Great Kings dealt with each other as equals, exchanging gifts and marriages, while lesser rulers were treated as vassals.
hint: Compare the letters between kings with those from vassals.
why: The archive shows a structured diplomatic system with a clear hierarchy, held together by gifts, marriages, and a shared language.
```

## A Shipwreck Full of the World

The most vivid evidence of Bronze Age trade lies on the seabed. In 1982 a sponge diver off **Uluburun**, on the southern coast of Turkey, reported "metal biscuits with ears". They were copper ingots, shaped like stretched oxhides for easy carrying, from a ship that sank in the late fourteenth century BCE. Excavated between 1984 and 1994 by teams led by George Bass and Cemal Pulak, the wreck carried about ten tonnes of copper in some 350 ingots and about one tonne of tin, the ratio needed to make bronze.

The rest of the cargo was a catalogue of the connected world: glass ingots coloured blue with cobalt; ebony from Africa; elephant and hippopotamus ivory; amber, probably from the Baltic; jars of terebinth resin from the Levant, probably used for incense; Cypriot pottery; Mycenaean weapons; and a gold scarab bearing the name of Nefertiti. Where the ship came from and where it was going are still debated. Its cargo was valuable enough to suggest a royal shipment, perhaps a gift between rulers of the kind the Amarna letters describe. One sunken ship confirms what the letters say: the Late Bronze Age Mediterranean was a single interconnected economy.

{{image: Uluburun shipwreck | Copper oxhide ingots from the Uluburun shipwreck, which sank off southern Turkey in the late fourteenth century BCE carrying enough copper and tin to make about eleven tonnes of bronze.}}

```checkpoint
q: Why is the ratio of copper to tin in the Uluburun cargo significant?
a: It shows that the ship's crew made bronze on board.
x: There is no evidence of metalworking on the ship. The ratio reflects the purpose of the cargo, not activity aboard.
a: It shows that tin was more valuable than gold.
x: The ratio says nothing about relative value; it matches the proportions of the alloy.
a*: About ten tonnes of copper to one of tin, close to the roughly nine-to-one proportions of bronze, so the cargo was raw material for making bronze.
a: It proves the ship came from Cornwall.
x: The ship's origin is debated, and the cargo came from many regions. The ratio does not identify a home port.
hint: Recall the composition of bronze.
why: The ingots were the raw materials for bronze, the strategic metal of the age, travelling together in the right proportions.
---
q: What does the variety of the Uluburun cargo suggest about the Late Bronze Age?
a*: That the eastern Mediterranean was an interconnected economy linking Africa, Europe, and western Asia.
a: That trade was confined to neighbouring cities.
x: The cargo came from Africa, the Baltic, the Levant, Cyprus, Egypt, and Greece, which points to long-distance networks.
a: That the ship belonged to pirates who had looted many places.
x: Nothing indicates piracy; the cargo's composition suggests organised trade or a royal gift.
a: That Egypt was isolated from the rest of the Mediterranean.
x: The Egyptian scarab and other goods show Egypt was part of the same network.
hint: List the places the goods came from.
why: Goods from three continents on a single ship confirm the picture of an integrated international system given by the diplomatic letters.
```

## Around 1200 BCE: The Collapse

Between about 1200 and 1150 BCE, this system unravelled. The palaces of mainland Greece were destroyed one after another; Pylos burned around 1180 BCE. The Hittite capital Hattusa was gradually abandoned and burned in the early twelfth century BCE, and the Hittite empire disappeared. The prosperous port of **Ugarit** on the Syrian coast was destroyed and never rebuilt as a city. Some cities in Cyprus and the Levant were damaged or abandoned, though recent work shows that destruction there was less widespread than once thought, and some Cypriot centres prospered. Linear B writing vanished, and with it literacy in Greece for some four centuries. Egypt survived, but weakened, and lost its empire in the Levant.

The best-known contemporary account comes from Egypt. On the walls of his mortuary temple at Medinet Habu, **Ramesses III** recorded a great victory around 1177 BCE (the date varies with Egyptian chronology) over a coalition of peoples from the sea: "No land could stand before their arms," the inscription says, listing the lands they had overrun. Egyptian texts name these groups, including the Peleset, probably the Philistines who later settled on the coast of Canaan, and others whose identities are uncertain. Modern scholars call them the **Sea Peoples**, a collective term coined by nineteenth-century Egyptologists, although Egyptian texts describe some of these groups as "of the sea".

For a long time the Sea Peoples were blamed for the whole collapse, as waves of invaders who swept across the Mediterranean. Most historians now think that explanation is too simple. Some of the Sea Peoples were probably themselves refugees displaced by the crisis, and many destructions cannot be attributed to them. Texts from Ugarit give a sense of how fast things went wrong. In one letter, the last king of Ugarit, Ammurapi, writes to the king of Alashiya (Cyprus) that enemy ships have arrived and burned his cities, while his own troops and ships are away in Hittite service. (For decades, these final letters were said to have been found in a kiln, never sent, as Ugarit fell; later study of the excavation records showed that the kiln story was a misunderstanding, a reminder that dramatic archaeological stories need checking too.)

Historians now favour **multiple, interacting causes**:

- **Drought.** Pollen and sediment cores from the region, including the Sea of Galilee and the Dead Sea, indicate a prolonged dry period. Letters show the Hittites, at the end, desperate for grain shipments from Egypt and Ugarit.
- **Earthquakes.** Some destructions may have been caused by a series of earthquakes in the region, sometimes called an "earthquake storm", though this is hard to prove at any individual site, and recent studies suggest earthquakes were less influential than once believed.
- **Famine and disease** following drought.
- **Migration and raiding**, including the Sea Peoples.
- **Internal unrest**, as overstretched palaces lost the ability to feed and control their populations.
- **Breakdown of trade**, which cut the copper and tin on which elites and armies depended.

The historian Eric Cline, in *1177 B.C.: The Year Civilization Collapsed* (2014), argued that the very interconnectedness of the Late Bronze Age made it vulnerable. When several shocks hit at once, failures in one part of the system spread to the others, a pattern known from the study of complex systems as **systems collapse**. Cline's later book *After 1177 B.C.* (2024) stressed the other half of the story: which societies proved resilient, and how.

```checkpoint
q: Why have most historians moved away from blaming the Sea Peoples alone for the Bronze Age collapse?
a: Because the Sea Peoples have been shown never to have existed.
x: The Sea Peoples are attested in Egyptian records; the question is how much of the collapse they caused.
a: Because the collapse affected only Egypt.
x: Egypt survived. The palaces of Greece, the Hittite empire, and Ugarit are among the most severe cases.
a: Because the Sea Peoples were Egyptian soldiers.
x: Egyptian records present them as enemies, though some later served as mercenaries. They were not the Egyptian army.
a*: Because evidence points to several interacting causes, such as drought, earthquakes, and internal unrest, and some Sea Peoples may themselves have been displaced by the crisis.
hint: Think about refugees as well as invaders.
why: Scholars now see the Sea Peoples as both a symptom and an agent of a wider crisis with many causes.
---
q: What is meant by "systems collapse" in Eric Cline's account?
a: The deliberate dismantling of trade by a single power.
x: Cline's argument is that no single actor caused the collapse; interconnection spread failures.
a*: Failure that spreads through an interconnected system when several shocks hit at once, so problems in one part trigger failures elsewhere.
a: A collapse caused only by climate change.
x: Climate change is one factor, but systems collapse means several shocks interacting through connections.
a: The collapse of a single palace's administrative records.
x: The term describes the whole international system, not one site.
hint: Think about how interdependence can be a weakness.
why: The integration that made the Late Bronze Age prosperous also allowed simultaneous shocks to cascade across the whole region.
```

## After the Fall

The centuries after the collapse are sometimes called a "Dark Age", especially in Greece, where population fell sharply, monumental building stopped, and writing disappeared until the Greeks adopted the Phoenician alphabet in the eighth century BCE. The term exaggerates. What ended was the palace system and its elites; many villages and much ordinary life continued.

The collapse also opened space for new developments. **Iron**, which could be smelted from ores found almost everywhere, gradually replaced bronze for tools and weapons, possibly in part, as Anthony Snodgrass suggested, because the tin trade had broken down. Smaller, more local polities emerged in place of the old empires: the Phoenician city-states, Israel and Judah, the Philistine cities, the Aramaean kingdoms of Syria, and the Neo-Hittite states of southern Anatolia. The alphabet, simpler than cuneiform or hieroglyphs, spread through these new societies. Assyria, which survived the crisis, would eventually build the largest empire the region had yet seen. The world after 1200 BCE was poorer and more fragmented, but some of its innovations proved more durable than the palaces they replaced.

Out of Mycenaean memory, transmitted orally through the dark centuries, came the Greek epic tradition. Homer's *Iliad* and *Odyssey*, written down probably in the eighth or seventh century BCE, preserve some Bronze Age details, such as boar's-tusk helmets and huge body shields, mixed with the world of later centuries. Whether a real Trojan War lies behind the poems remains unknown. Troy itself, at Hisarlik in northwest Turkey, was excavated by Schliemann and many successors, and levels from around 1300–1180 BCE show a substantial city that suffered destruction.

```checkpoint
q: Why did iron come into wider use after the Bronze Age collapse?
a: Because iron had just been discovered.
x: Iron objects had been made for centuries before the collapse; the change was in how widely it was used.
a*: Because iron ores are found almost everywhere, while bronze depended on a long-distance tin trade that had probably been disrupted.
a: Because iron was much more beautiful than bronze.
x: Bronze was the prestige metal; iron's advantage was practical.
a: Because iron was a Hittite secret that was finally revealed.
x: The idea of a Hittite iron monopoly is a modern legend; the shift is explained by the availability of ore and the collapse of trade.
hint: Compare where copper, tin, and iron ore are found.
why: The collapse disrupted the tin supply, making locally available iron increasingly attractive, though the transition took centuries.
---
q: Why do many historians object to calling the period after 1200 BCE a "Dark Age"?
a: Because there was no decline at all.
x: There was real decline in Greece, including loss of writing and population. The objection is to the term's exaggeration.
a: Because written sources from the period are abundant.
x: Written sources are scarce, especially in Greece, which is partly why the term was used.
a: Because the term refers only to Egypt.
x: The term is mainly used for Greece, not Egypt.
a*: Because what ended was the palace system and its elites, while much ordinary life continued, and the period saw innovations such as iron and the alphabet.
hint: Consider who lost most in the collapse.
why: The label reflects the loss of elite records and monuments more than the experience of most people, and overlooks important innovations.
```

## Further exploration

- **Eric H. Cline, *1177 B.C.: The Year Civilization Collapsed* (2014; revised 2021).** The standard accessible account of the collapse.
- **Eric H. Cline, *After 1177 B.C.: The Survival of Civilizations* (2024).** Resilience and recovery after the collapse.
- **Trevor Bryce, *Letters of the Great Kings of the Ancient Near East* (2003).** The Amarna letters and Hittite correspondence explained.
- **Margalit Fox, *The Riddle of the Labyrinth* (2013).** The decipherment of Linear B, including the overlooked work of Alice Kober.
- **Cemal Pulak, "The Uluburun Shipwreck: An Overview" (1998).** The excavator's account of the wreck and its cargo.$bronze_master$,
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
  select $bronze_quiz$[
    {"type": "mcq", "prompt": "Why did the great powers of the Late Bronze Age depend on long-distance trade?", "options": ["Because bronze required tin, which came from distant sources such as Central Asia, Anatolia, and western Europe", "Because they had no copper of their own anywhere", "Because iron was banned", "Because their kings were required to trade by treaty"], "answerIndex": 0, "explanation": "Copper was relatively available, but tin was scarce and distant, so the strategic metal of the age depended on long trade chains.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Michael Ventris show in 1952?", "options": ["That Linear A recorded Egyptian", "That Linear B recorded an early form of Greek", "That the Indus script was alphabetic", "That Hittite was a Semitic language"], "answerIndex": 1, "explanation": "Ventris, with John Chadwick, showed that the Mycenaean Linear B tablets were written in Greek and were mainly administrative records.", "id": "q2"},
    {"type": "mcq", "prompt": "Which explanation of the Bronze Age collapse best reflects current scholarship?", "options": ["A single invasion by the Sea Peoples", "A sudden volcanic eruption on Thera", "Several interacting shocks, including drought, earthquakes, migration, unrest, and trade breakdown, cascading through an interconnected system", "The invention of iron weapons by the Hittites"], "answerIndex": 2, "explanation": "Historians such as Eric Cline describe a 'systems collapse' in which multiple pressures interacted, and the Sea Peoples were partly a symptom of the crisis.", "id": "q3"},
    {"type": "mcq", "prompt": "What did later study of the excavation records show about the 'kiln' letters from Ugarit?", "options": ["They were found baking in a kiln as the city fell", "The story that they were found in a kiln was a misunderstanding", "They were modern forgeries", "They were written in Linear B"], "answerIndex": 1, "explanation": "The dramatic kiln story did not survive scrutiny of the excavation records, a reminder that archaeological narratives also need source criticism.", "id": "q4"},
    {"type": "open", "prompt": "Using the Amarna letters and the Uluburun shipwreck, describe the Late Bronze Age international system, and explain why its interconnectedness was both a strength and a weakness.", "rubric": "A strong answer describes the club of Great Kings (Egypt, Babylon, Assyria, Mitanni, Hittites, Alashiya) addressing each other as brothers, exchanging gifts and marriages, using Akkadian as a diplomatic language, with vassals below them; and the Uluburun cargo (about ten tonnes of copper and one of tin, plus goods from Africa, the Baltic, the Levant, Egypt, and Greece) as evidence of an integrated economy. It explains that integration brought prosperity and strategic metals but meant that drought, earthquakes, migration, and unrest could cascade across the system around 1200 BCE, as in Cline's systems-collapse argument.", "id": "q5"},
    {"type": "open", "prompt": "Was the period after 1200 BCE a 'Dark Age'? Argue a position using evidence from the chapter.", "rubric": "A strong answer acknowledges real losses (destruction of palaces, end of the Hittite empire and Ugarit, loss of Linear B literacy in Greece for about four centuries, population decline) and real continuities and innovations (village life continued, spread of iron, the alphabet, new polities such as the Phoenician cities, Israel and Judah, Philistines, Aramaeans, Neo-Hittite states, Assyria's survival, the oral tradition behind Homer). It reaches a reasoned judgement about the term, noting that it reflects the loss of elite records more than the experience of most people.", "id": "q6"}
  ]$bronze_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/the-bronze-age-mediterranean-and-its-collapse', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
