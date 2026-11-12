-- Mesopotamia — canonical master article, co-written and human-reviewed.
-- history/ancient-civilizations/mesopotamia @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Uruk to the fall of Babylon (c. 3500–539 BCE) and the modern recovery:
-- irrigation and salinity, writing as accounting, Sumer, Akkad and Ur III,
-- Hammurabi's laws, mathematics and astronomy, Gilgamesh, Assyria, the
-- Neo-Babylonian empire, and the decipherment of cuneiform.
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
    'history/ancient-civilizations/mesopotamia',
    'research',
    'advanced',
    'read',
    $meso_master$> **Mesopotamia**, Greek for "the land between the rivers", is the plain of the Tigris and Euphrates in what is now Iraq and parts of Syria and Turkey. It is where the archaeological record first shows cities, writing, written law, and territorial empire. None of those things was invented as a grand design. Writing began as bookkeeping for temple rations, law codes as royal advertisements, and empire as one city's attempt to control its rivals' water and trade. This chapter follows three thousand years of Mesopotamian history, from Uruk around 3500 BCE to the fall of Babylon to Persia in 539 BCE, and asks how a civilization that left more written records than almost any other ancient society was almost entirely forgotten until the nineteenth century.

## A Difficult Garden

Southern Mesopotamia does not look like a cradle of civilization. It is flat, hot, and nearly rainless, with too little rainfall for farming without irrigation. It has almost no stone, metal, or good timber. What it has is river water and silt. The Tigris and Euphrates flood in spring, when snowmelt from the Anatolian and Zagros mountains arrives, which is the wrong time of year for the region's crops: the floods come as grain is ripening rather than when fields need watering. Farming therefore depended on canals, dykes, and basins to capture water and release it when needed. Where irrigation worked, the yields of barley were extraordinarily high.

Irrigation had a long-term cost. River water carries dissolved salts, and in a hot climate with poor drainage, evaporation leaves those salts in the soil. In an influential 1958 study, Thorkild Jacobsen and Robert McCormick Adams argued that salinisation in southern Mesopotamia shows up in the records as a shift from wheat to barley, which tolerates salt better, and a decline in yields between about 2400 and 1700 BCE, contributing to the south's long-term decline relative to the north. The scale of the effect is debated, but the problem was real. It is an early example of a civilization's success at shaping its environment creating problems that later generations had to live with.

The lack of local raw materials had a different consequence. Stone, copper, tin, timber, and precious stones had to be imported from Anatolia, Iran, Afghanistan, the Gulf, and the Indus valley. Long-distance trade was a necessity from the start, and Mesopotamian cities were always entangled with their neighbours.

```checkpoint
q: Why did agriculture in southern Mesopotamia depend so heavily on irrigation?
a*: Because rainfall was too low for farming, and the river floods came at the wrong time of year for the crops, so water had to be captured and controlled.
a: Because the rivers never flooded.
x: The rivers did flood, every spring. The difficulty was the timing of the flood, not its absence.
a: Because the soil was too rocky for ploughing.
x: Southern Mesopotamia is a flat alluvial plain of fine silt with almost no stone, so rocky soil was not the problem.
a: Because the government banned rain-fed farming.
x: There was no such ban. Irrigation was a response to climate, not a legal requirement.
hint: Think about both the amount of rain and the timing of the flood.
why: With little rain and floods that arrived as crops were ripening, farmers needed canals and basins to store and release water when the fields needed it.
---
q: What long-term problem did Jacobsen and Adams link to irrigation in southern Mesopotamia?
a: Flooding of cities by uncontrolled canals.
x: Floods were a risk, but the problem Jacobsen and Adams identified was gradual and chemical.
a: The exhaustion of copper mines.
x: Southern Mesopotamia had no copper mines; it imported copper.
a*: Salinisation, as evaporation left salts in irrigated soil, pushing farmers from wheat towards more salt-tolerant barley and reducing yields.
a: The spread of malaria from stagnant canals.
x: Disease may well have been a problem, but it was not the subject of their study.
hint: What does evaporating river water leave behind?
why: Salts accumulated in poorly drained irrigated fields, a slow environmental cost of the very system that made the region's agriculture possible.
```

## Uruk and the First Cities

Between about 4000 and 3100 BCE, the settlement of **Uruk** in southern Iraq grew into what was probably the largest city in the world. By around 3100 BCE it may have held 25,000 to 50,000 people, and in the following centuries it was enclosed by a wall about nine kilometres long, credited in later legend to its king Gilgamesh. At its centre stood monumental temple complexes, especially the precinct of Eanna, dedicated to the goddess Inanna.

Archaeologists call this period the **Uruk period**, and the changes it records amount to an urban revolution. Large numbers of people lived from food they did not produce themselves. There were specialists in pottery, metalwork, weaving, and administration. A cylinder seal, a small stone cylinder carved with a design and rolled across wet clay, let an official mark goods and documents as his responsibility. Mass-produced, crude "bevelled-rim bowls", found in huge numbers, are widely thought to have been used to distribute rations of grain to workers. Uruk-style buildings and pottery also appear far up the Euphrates in Syria and in southwest Iran, at sites such as Habuba Kabira, suggesting colonies or trading posts set up to secure raw materials. The archaeologist Guillermo Algaze has called this the "Uruk world system".

Uruk was not unique for long. By the early third millennium BCE, southern Mesopotamia, the land later called **Sumer**, was divided among a dozen or more independent city-states, including Ur, Lagash, Umma, Kish, Nippur, and Eridu. Each was a city with its surrounding farmland and villages, dedicated to a patron god who was believed to own it.

{{image: Uruk | The site of Uruk in southern Iraq. By about 3100 BCE it was probably the largest city in the world, and it is where the earliest known writing appears.}}

## Writing Begins as Accounting

The earliest known writing comes from Uruk, around 3350–3200 BCE. It does not record stories, prayers, or the deeds of kings. About 85 per cent of the earliest tablets are administrative records: quantities of barley, beer, sheep, textiles, and labour, written by pressing a stylus into clay. Most of the rest are lists of words, such as professions, animals, and vessels, used to train scribes. Writing was invented to keep accounts for large institutions that had outgrown memory.

How it was invented is debated. The archaeologist Denise Schmandt-Besserat proposed that small clay tokens, used for thousands of years in the Near East to represent goods, were sealed in clay envelopes; their shapes were pressed onto the outside to show what was inside, and eventually the impressions replaced the tokens. The theory is influential, but many specialists think it explains the number signs better than the rest of the script.

Early writing used pictures, but it quickly became abstract. Signs were made of wedge-shaped impressions, which is why the script is called **cuneiform**, from the Latin *cuneus*, "wedge". Over centuries scribes added signs that represented sounds rather than things, which allowed them to write names, grammar, and eventually any word. Cuneiform was used to write Sumerian, a language unrelated to any known language, and was then adapted for Akkadian, a Semitic language related to Hebrew and Arabic, and for Hittite, Elamite, and others. It remained in use for more than three thousand years; the latest datable cuneiform tablet, an astronomical almanac from Uruk, dates from 79/80 CE.

Literature came centuries after accounting. By the middle of the third millennium BCE scribes were writing hymns, proverbs, and royal inscriptions. The earliest author known by name is traditionally **Enheduanna**, daughter of Sargon of Akkad and high priestess of the moon god at Ur around 2300 BCE, to whom hymns to Inanna are attributed, though whether she composed them is debated: the surviving copies are centuries later.

```checkpoint
q: What were most of the earliest written documents from Uruk?
a: Epic poems such as the story of Gilgamesh.
x: Literary texts came centuries later. The Gilgamesh poems date from around 2100 BCE and after.
a*: Administrative records of goods and labour, plus word lists used to train scribes.
a: Royal inscriptions boasting of military victories.
x: Royal inscriptions also appear later. The earliest tablets are overwhelmingly economic.
a: Religious prayers and hymns.
x: Hymns appear later. Among the earliest named authors is traditionally Enheduanna, around 2300 BCE.
hint: Writing was invented by people managing large institutions.
why: About 85 per cent of the earliest tablets are accounts, showing that writing began as a tool of administration before it became a medium for literature.
---
q: Why is the script called "cuneiform"?
a: Because it was invented by a scribe named Cuneus.
x: There was no such scribe. The name is descriptive and was given by modern scholars.
a: Because it was written only on clay cones.
x: Most cuneiform was written on flat or slightly curved clay tablets. The name refers to the marks, not the shape of the object.
a: Because it was used only for writing Sumerian.
x: Cuneiform was used for many languages, including Akkadian, Hittite, and Elamite.
a*: Because its signs are made of wedge-shaped impressions, from the Latin cuneus, "wedge".
hint: Look at the shape of the marks a reed stylus leaves in clay.
why: Pressing the end of a cut reed into clay leaves wedge-shaped marks, which give the script its modern name.
```

## Sumer: Gods, Temples, and Rival Cities

Each Sumerian city belonged, in its people's belief, to its god: Uruk to Inanna and An, Ur to the moon god Nanna, Nippur to Enlil, the chief god of the pantheon. Temples were enormous economic institutions that owned land, herds, and workshops and employed hundreds of people. The **ziggurat**, a stepped platform of mud brick with a shrine on top, became the characteristic monument; the best-preserved, at Ur, was built around 2100 BCE.

Kings emerged alongside the temples, first, perhaps, as war leaders, then as permanent rulers who presented themselves as the gods' stewards. The **Sumerian King List**, compiled centuries later, claims that "kingship descended from heaven" and lists dynasties ruling one city after another, with fantastically long reigns before a great flood. It is a political document, written to argue that only one city at a time held legitimate kingship over Sumer, and historians use it with great caution.

The city-states fought constantly, mostly over land and water. The longest-documented conflict, between Lagash and its neighbour Umma over a fertile border strip, lasted several generations. The **Stele of the Vultures** (around 2450 BCE), erected by King Eannatum of Lagash, shows his soldiers in close formation marching over the bodies of their enemies, with vultures carrying off the remains, and records the oath sworn to fix the boundary. Around 2350 BCE a later ruler of Lagash, Uruinimgina (formerly read Urukagina), issued reforms claiming to protect widows and orphans from the powerful and to cancel abuses by officials. His inscription uses the Sumerian word *amargi*, usually translated "freedom" and literally "return to the mother", meaning release from debt bondage; the word is first attested a few decades earlier, under his predecessor Enmetena.

The wealth of the period's elites was revealed in the 1920s when Leonard Woolley excavated the **Royal Cemetery of Ur** (around 2600–2500 BCE). Some tombs contained not only gold, lapis lazuli, and musical instruments but dozens of attendants who had died, apparently by poison or, according to a later study of the skulls, by blows to the head, to accompany their rulers into death. One of the richest tombs belonged to a woman named Puabi, whose cylinder seal gives her the title *nin*, usually translated "queen".

```checkpoint
q: Why do historians treat the Sumerian King List with caution?
a: Because it was written in a script that has not been deciphered.
x: The King List is written in Sumerian cuneiform, which has been read since the early twentieth century.
a: Because it lists only women rulers.
x: The King List names overwhelmingly male rulers, with a few exceptions such as Kubaba of Kish.
a*: Because it was compiled later as a political argument that legitimate kingship passed from one city to another, and includes legendary rulers with impossibly long reigns.
a: Because it was forged in the nineteenth century.
x: The King List survives on genuine ancient tablets. The problem is its purpose, not its authenticity.
hint: Ask what the compilers wanted to prove.
why: Source criticism treats the King List as evidence of how later rulers wanted the past to look, not as a neutral record of events.
---
q: What does Uruinimgina's reform inscription show?
a*: That rulers presented themselves as protectors of the weak against abuses, and it uses the word amargi, release from debt bondage.
a: That Lagash had abolished kingship.
x: Uruinimgina was himself a ruler. His reforms presented him as a just king, not as the end of kingship.
a: That Sumerian cities had no debt or debt bondage.
x: The reforms address debt bondage directly, which shows it existed.
a: That Lagash conquered all of Mesopotamia.
x: Lagash was one city-state among many. Uruinimgina was defeated by Lugalzagesi of Umma.
hint: The word amargi is often translated "freedom".
why: The inscription records an ideal of royal justice, protecting widows, orphans, and debtors, that recurs throughout Mesopotamian history, including in Hammurabi's laws.
```

## Akkad and Ur III: The First Empires

Around 2300 BCE, **Sargon of Akkad** conquered the Sumerian city-states and much of northern Mesopotamia, creating what is often called the first empire, a state that ruled many cities and peoples from a single centre. His capital, Akkade, has never been found. His grandson **Naram-Sin** went further, claiming divinity, writing his name with the sign for a god, and calling himself "king of the four quarters" of the world. Later tradition remembered Sargon as the model of a great king and Naram-Sin as an example of arrogance punished: a Sumerian poem called *The Curse of Akkade* blames the empire's fall on his offences against Enlil. The empire collapsed around 2150 BCE amid revolts and attacks by the Gutians from the Zagros mountains; a severe drought around 2200 BCE, sometimes called the 4.2-kiloyear event, may have contributed, though how much is debated.

After a period of fragmentation, the **Third Dynasty of Ur** (around 2112–2004 BCE), known as Ur III, built one of the most intensely bureaucratic states in history. Its founder Ur-Nammu is credited with the oldest surviving law code, about three centuries earlier than Hammurabi's, though some scholars attribute it to his son Shulgi. Under his son **Shulgi**, the state standardised weights, measures, and the calendar, built roads and way stations, and recorded the movement of goods in astonishing detail. At Puzrish-Dagan near Nippur, a single livestock collection centre has yielded some 12,000–15,000 tablets recording individual sheep and goats. Ur III fell in 2004 BCE when the Elamites from southwest Iran sacked Ur, a disaster commemorated in the *Lament for Ur*.

```checkpoint
q: What made Sargon of Akkad's state different from the earlier Sumerian city-states?
a: It was the first state to use writing.
x: Writing had been used for about a thousand years before Sargon.
a: It was ruled by priests rather than kings.
x: Sargon was a king, and his dynasty emphasised royal power, Naram-Sin even claiming divinity.
a: It was the first state in Egypt.
x: Akkad was in Mesopotamia. Egypt had been unified some eight centuries earlier.
a*: It was a territorial empire, ruling many cities and peoples from one centre instead of governing a single city and its hinterland.
hint: Compare the area ruled with that of a single Sumerian city-state.
why: By conquering and governing numerous city-states, Sargon created a new form of political organisation, often counted as the first empire.
---
q: Which statement about the Ur III state is correct?
a: It left almost no written records.
x: Ur III is among the best-documented states of the ancient world, with tens of thousands of administrative tablets.
a*: Its founder Ur-Nammu is credited with the oldest surviving law code, and the state recorded its economy in extraordinary bureaucratic detail.
a: It was founded by Hammurabi.
x: Hammurabi ruled Babylon roughly three centuries later. Ur III was founded by Ur-Nammu.
a: It was conquered by the Persians.
x: Ur III fell to the Elamites in 2004 BCE. The Persians conquered Mesopotamia much later, in 539 BCE.
hint: Ur-Nammu reigned around 2100 BCE.
why: Ur III's laws, standardised measures, and enormous archives make it a landmark in the history of the bureaucratic state.
```

## Babylon and Hammurabi's Laws

After the fall of Ur, Amorite dynasties, descendants of people from the Syrian steppe who spoke a Semitic language, took power in many Mesopotamian cities. One of them ruled **Babylon**, a minor town until **Hammurabi** (reigned about 1792–1750 BCE) conquered his rivals and united southern and central Mesopotamia. From then on, Babylon was the region's leading city, and southern Mesopotamia became known as Babylonia.

Hammurabi is remembered for his laws, inscribed near the end of his reign on a black stone stele 2.25 metres tall, now in the Louvre. It was found in 1901–02 not in Babylon but at Susa in Iran, where an Elamite king had carried it as war booty in the twelfth century BCE. At the top, Hammurabi stands before the sun god Shamash, god of justice. Below, a prologue and epilogue frame about 282 laws on theft, trade, debt, marriage, inheritance, slavery, medicine, and building, each in the form "If a man does X, then Y."

The laws are famous for retaliation, "an eye for an eye", but that principle applied only between equals. The code divides society into free persons (*awilum*), a dependent class (*mushkenum*), and slaves (*wardum*), with penalties that vary by status. Blinding a free man's eye cost the attacker his own eye; injuring a commoner or a slave in the same way was punished with payments in silver instead. A builder whose house collapsed and killed the owner's son was to have his own son put to death.

Whether these were laws in the modern sense is doubtful. Thousands of court records and contracts survive from Hammurabi's time, and they almost never cite the code. Many scholars, following Fritz Rudolf Kraus and later the French Assyriologist Jean Bottéro, read it instead as a royal monument and a work of learned literature: a demonstration that Hammurabi was the just king the gods required, set out in the same "if... then" form that Babylonian scholars used for omens and medical diagnoses. The epilogue itself invites a wronged man to come before the stele and have it read to him, so that he "may examine his case" and calm his troubled heart. The laws record an ideal of justice and a way of reasoning, not necessarily the rules courts applied.

{{image: Code of Hammurabi | The stele of Hammurabi's laws, about 1754 BCE, showing the king before the sun god Shamash. It was found at Susa in Iran, where it had been taken as war booty.}}

```checkpoint
q: Under Hammurabi's laws, what happened to a man who blinded a slave?
a: He was blinded in return.
x: Retaliation in kind applied between free persons. Penalties for harming slaves were different.
a*: He paid half of the slave's value, to the slave's owner.
a: Nothing, because slaves had no legal protection.
x: The laws did protect slaves, though as property: a payment was due to the owner.
a: He was enslaved himself.
x: Enslavement was not the penalty for this offence in the code.
hint: The penalty depended on the victim's status.
why: Hammurabi's laws applied "an eye for an eye" only between free persons; for lower-status victims they set payments, and for slaves the payment went to the owner.
---
q: Why do many scholars doubt that Hammurabi's laws were applied in courts like a modern legal code?
a: Because the stele was found in Iran, far from Babylon.
x: The stele was carried to Susa as booty centuries later. Its findspot says nothing about how it was used in Hammurabi's kingdom.
a: Because the laws were written in a language no one in Babylon could read.
x: The laws are written in Akkadian, Babylon's main written language, and the epilogue envisages them being read aloud.
a: Because Hammurabi abolished them after a few years.
x: There is no evidence of their abolition; the text was copied by scribes for over a thousand years.
a*: Because the many surviving court records and contracts from the period almost never cite them, suggesting the laws were more a royal monument and a model of just reasoning.
hint: Compare the code with what courts actually wrote down.
why: The near-absence of references to the code in practice suggests it functioned as royal propaganda and scholarly literature, displaying the king's justice rather than dictating verdicts.
```

## Scribes, Stars, and Base Sixty

Mesopotamian scribes trained for years in schools called *eduba*, "tablet houses", copying signs, word lists, proverbs, and literature. Thousands of their exercise tablets survive, complete with mistakes and teachers' corrections. Their training extended to mathematics and astronomy, and both left a lasting legacy.

Mesopotamian mathematics used a **sexagesimal**, or base-60, system, with place value: the position of a digit determined its value, as in our decimal system. Sixty divides evenly by 2, 3, 4, 5, 6, 10, 12, 15, 20, and 30, which made calculations with fractions easy. A small tablet from about 1800 BCE known as **YBC 7289** shows a square with its diagonals and gives the square root of 2 in base 60 as 1;24,51,10, which is accurate to about six decimal places. Another, **Plimpton 322**, lists sets of numbers that fit the relationship now known as Pythagoras' theorem, more than a thousand years before Pythagoras.

Astronomy grew out of divination. Mesopotamian scholars believed the gods wrote messages in the sky, so they observed it carefully. Astronomers in Babylon kept nightly records, the **Astronomical Diaries**, probably from the mid-eighth century BCE (the earliest surviving diary dates from 652 BCE) until 61 BCE, one of the longest scientific observation programmes in history, and developed mathematical methods to predict the movements of the moon and planets and the timing of eclipses. The 60 minutes in an hour, 60 seconds in a minute, and 360 degrees in a circle all descend from Mesopotamian base-60 counting, passed on through Greek astronomers.

The best-known Mesopotamian literary work is the **Epic of Gilgamesh**, about a king of Uruk who, after the death of his friend Enkidu, searches for immortality and fails. It developed over more than a thousand years, from Sumerian poems around 2100 BCE to the standard Akkadian version attributed to a scholar named Sin-leqi-unninni, who lived sometime between about 1300 and 1000 BCE. In 1872 George Smith, an assistant at the British Museum, found on a tablet from Nineveh a flood story strikingly like Noah's: the hero Utnapishtim is warned by a god, builds a boat, and sends out birds to find land. The discovery caused a sensation, because it showed that the biblical flood story had older Mesopotamian parallels.

```checkpoint
q: Which modern measurement comes from Mesopotamian base-60 mathematics?
a*: The 60 minutes in an hour and 360 degrees in a circle.
a: The 10 digits of the decimal system.
x: The decimal system descends from Indian numerals transmitted through the Islamic world, not from Mesopotamian base 60.
a: The 12 months of the year.
x: Twelve months relate to lunar cycles and were used by many cultures; the clearest base-60 survivals are in time and angle measurement.
a: The 7-day week.
x: The week has a different history, linked to the seven visible planets and to Jewish tradition.
hint: Think about where the number 60 appears today.
why: Through Greek astronomers who adopted Babylonian methods, base-60 counting survived in the division of hours, minutes, and degrees.
---
q: Why did George Smith's 1872 discovery attract so much attention?
a: It was the first Mesopotamian tablet ever found.
x: Thousands of tablets had already been excavated. What mattered was the content of this one.
a: It proved the biblical flood was a historical event.
x: The discovery showed a literary parallel, not historical proof of a flood.
a*: It revealed a Mesopotamian flood story, in the Epic of Gilgamesh, closely paralleling the story of Noah, showing that the biblical account had older parallels.
a: It contained the earliest known law code.
x: Smith's tablet was part of the Epic of Gilgamesh, a literary text, not a law code.
hint: The story's hero builds a boat and sends out birds.
why: The parallel challenged the assumption that the Bible was the oldest record of these traditions and placed it within a wider Near Eastern literary world.
```

## Assyria: Empire by Terror and Administration

In northern Mesopotamia, the city of **Ashur** on the Tigris gave its name to Assyria. Its merchants first appear in history around 1900 BCE, running a trading network to **Kanesh** in central Anatolia, where some 23,000 tablets record shipments of tin and textiles, family letters, and contracts. Assyria grew into a regional power in the later second millennium BCE, but its great age came with the **Neo-Assyrian empire** (911–609 BCE), which at its height controlled territory from Iran to Egypt and became the largest empire the world had yet seen.

Assyria's power rested on a professional army, an efficient provincial system, and deliberate terror. Royal inscriptions and palace reliefs describe and depict flaying, impalement, and piles of severed heads, intended to frighten other states into submission. Tiglath-Pileser III (reigned 745–727 BCE) reorganised the empire into provinces governed by royal officials and made **mass deportation** a standard policy: conquered populations were moved across the empire to break local resistance and to settle and farm new land. The Israeli historian Bustenay Oded estimated in 1979 that about 4.4 million people were deported over some 250 years, a figure that is necessarily uncertain; other estimates are as low as one and a half million. The northern kingdom of Israel was conquered in 722 BCE and much of its population deported; its people became the "lost tribes" of later tradition.

The reliefs from Sennacherib's palace at Nineveh show the siege of the Judahite city of Lachish in 701 BCE in vivid detail. His annals also claim that he shut up King Hezekiah of Judah in Jerusalem "like a caged bird", and the Hebrew Bible records the same campaign from the other side, one of the earliest events attested independently by both sides. **Ashurbanipal** (reigned 669–about 631 BCE), who was proud of his ability to read cuneiform, assembled a great library at Nineveh, whose surviving tablets and fragments, now mostly in the British Museum, number about 30,000. Much of what is known of Mesopotamian literature, including the standard Epic of Gilgamesh, survives partly because the fire that destroyed Nineveh baked many of the library's clay tablets.

Within twenty years of Ashurbanipal's death, the empire collapsed with startling speed. An alliance of Babylonians and Medes sacked Nineveh in 612 BCE, and the last Assyrian forces were defeated by 609 BCE.

```checkpoint
q: What was the main purpose of Assyria's policy of mass deportation?
a: To reduce the empire's population and so lower food demand.
x: Deportation moved people rather than eliminating them, often to farm underused land.
a: To spread the Assyrian religion by force.
x: Assyria did not usually require conquered peoples to adopt its gods; the policy was political and economic.
a: To punish only people who had committed crimes.
x: Whole communities were deported after conquest, regardless of individual guilt.
a*: To break local resistance by uprooting conquered populations, and to resettle and develop other parts of the empire.
hint: Think about what happens to a rebellion when its community is scattered.
why: Moving populations across the empire undermined local loyalties and put labour where the state wanted it.
---
q: Why did so much Mesopotamian literature survive in Ashurbanipal's library at Nineveh?
a: Because the tablets were written on durable papyrus.
x: The library's texts were on clay tablets, not papyrus, which survives poorly outside Egypt's dry climate.
a*: Because when Nineveh was burned in 612 BCE, the fire baked many of the clay tablets, preserving them under the ruins.
a: Because the Medes and Babylonians carefully preserved the library after conquering the city.
x: The conquerors sacked and burned the city. Survival was an accident of destruction, not deliberate preservation.
a: Because the tablets were copied onto stone monuments.
x: The tablets themselves survived; they were not transferred to stone.
hint: Remember what fire does to clay.
why: The destruction of Nineveh preserved its library by firing the tablets, an example of how survival in the archaeological record can depend on accident.
```

## Babylon's Last Glory and the Forgetting

After Assyria's fall, the **Neo-Babylonian empire** inherited much of its territory. Its greatest king, **Nebuchadnezzar II** (reigned 605–562 BCE), rebuilt Babylon on a vast scale, with the blue-glazed **Ishtar Gate**, decorated with bulls and dragons, and a processional way lined with lions. In 587 or 586 BCE his army destroyed Jerusalem and its temple and deported much of Judah's elite to Babylonia, beginning the period known as the Babylonian exile, which shaped Jewish identity and the Hebrew Bible. The famous Hanging Gardens of Babylon appear in no Babylonian text, and the Assyriologist Stephanie Dalley has argued that they were actually at Nineveh, built by Sennacherib. The question is unresolved.

In 539 BCE the Persian king **Cyrus the Great** took Babylon after defeating the Babylonian army at Opis, by his own account without battle. Babylonia became a province of the Persian empire, and later of Alexander's empire and its successors. The Babylonian language faded from everyday use, replaced by Aramaic, but scholars continued to write cuneiform in temples for centuries, mostly astronomical texts, until the script died out in the first century CE.

Then Mesopotamia was forgotten. For nearly two thousand years, all that was known of it came from the Bible and Greek writers, filtered through their own concerns. Decipherment began with Old Persian inscriptions (Georg Friedrich Grotefend, 1802), and its key was the **Behistun inscription**, a monumental relief carved on a cliff in western Iran by the Persian king Darius I around 520 BCE, in three languages written in cuneiform: Old Persian, Elamite, and Babylonian. Between 1835 and 1847 Henry Rawlinson, a British officer, copied it at considerable risk, and Old Persian, the simplest of the three scripts, was deciphered first, providing a key to the others. In 1857 the Royal Asiatic Society held a test: four scholars, Rawlinson, Edward Hincks, William Henry Fox Talbot, and Julius Oppert, translated a newly discovered Assyrian inscription independently. Their translations agreed closely enough to show that Akkadian had really been deciphered. Sumerian was recognised as a separate language later in the nineteenth century.

Today the main threats to Mesopotamia's heritage are modern: looting of archaeological sites, especially after the 2003 invasion of Iraq, and the deliberate destruction of sites such as Nimrud by the Islamic State in 2015. The civilization that invented writing to record its possessions continues to lose them.

{{image: Ishtar Gate | A reconstruction of the Ishtar Gate of Babylon, built under Nebuchadnezzar II in the sixth century BCE, now in the Pergamon Museum in Berlin.}}

```checkpoint
q: Why was the Behistun inscription the key to deciphering cuneiform?
a: Because it included a Greek translation, like the Rosetta Stone.
x: Behistun has no Greek text. Its three versions are all in cuneiform scripts.
a: Because it was the oldest cuneiform text ever found.
x: Behistun dates from around 520 BCE, late in the history of cuneiform. Its value lay in being trilingual.
a*: Because it repeated the same text in three languages, and once the simpler Old Persian version was read, it provided a key to the Babylonian version.
a: Because it explained the cuneiform script in a list of signs.
x: The inscription is a royal account of Darius' rise to power, not a guide to the script.
hint: Compare it with the Rosetta Stone, but without Greek.
why: A trilingual text lets a known or more easily decoded version unlock the others. Old Persian's simple script was the way in.
---
q: What was the purpose of the Royal Asiatic Society's 1857 test?
a*: To check the decipherment of Akkadian by having four scholars translate a new inscription independently and compare the results.
a: To decide which scholar would be allowed to excavate Nineveh.
x: The test concerned translation, not excavation rights.
a: To prove that cuneiform was a hoax.
x: Many people were sceptical of the decipherment, but the test was designed to check it, and it confirmed it.
a: To translate the Behistun inscription for the first time.
x: Behistun had already been copied and largely deciphered. The 1857 test used a newly found inscription.
hint: This is an application of corroboration.
why: Independent translations that agreed closely showed the decipherment worked, an early example of designing a test to confirm a scholarly claim.
```

## Further exploration

- **Marc Van De Mieroop, *A History of the Ancient Near East, ca. 3000–323 BC* (3rd ed., 2015).** The standard one-volume history.
- **Jean Bottéro, *Mesopotamia: Writing, Reasoning, and the Gods* (1992).** Essays on Mesopotamian thought, including the reading of Hammurabi's laws.
- **Andrew George (trans.), *The Epic of Gilgamesh* (Penguin, 1999).** The authoritative modern translation.
- **Gwendolyn Leick, *Mesopotamia: The Invention of the City* (2001).** A history told through ten cities.
- **Irving Finkel, *The Ark Before Noah* (2014).** A British Museum curator on a newly read flood tablet and the history of cuneiform scholarship.
- **Eckart Frahm, *Assyria: The Rise and Fall of the World's First Empire* (2023).** A recent history of Assyria.$meso_master$,
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
  select $meso_quiz$[
    {"type": "mcq", "prompt": "What were most of the earliest cuneiform tablets from Uruk?", "options": ["Epic poems", "Administrative records of goods and labour, plus word lists for training scribes", "Law codes", "Royal letters to Egypt"], "answerIndex": 1, "explanation": "About 85 per cent of the earliest tablets are accounts; writing began as a tool of institutional bookkeeping.", "id": "q1"},
    {"type": "mcq", "prompt": "Which ruler issued the oldest surviving law code?", "options": ["Hammurabi of Babylon", "Sargon of Akkad", "Nebuchadnezzar II", "Ur-Nammu of Ur"], "answerIndex": 3, "explanation": "Ur-Nammu, founder of the Third Dynasty of Ur around 2100 BCE, is credited with laws about three centuries before Hammurabi's (some scholars attribute them to his son Shulgi).", "id": "q2"},
    {"type": "mcq", "prompt": "Why do many scholars doubt that Hammurabi's laws functioned as a code applied in courts?", "options": ["The stele was carved after his death", "Surviving court records and contracts almost never cite them", "They were written in Sumerian, which no one spoke", "They contradict the Hebrew Bible"], "answerIndex": 1, "explanation": "Thousands of legal documents survive without reference to the code, suggesting it was a royal monument and model of just reasoning rather than binding legislation.", "id": "q3"},
    {"type": "mcq", "prompt": "What made the 1857 Royal Asiatic Society test convincing evidence that Akkadian had been deciphered?", "options": ["Four scholars translated a new inscription independently, and their versions closely agreed", "A native speaker of Akkadian confirmed the translation", "The inscription was bilingual with Greek", "Rawlinson translated it alone in record time"], "answerIndex": 0, "explanation": "Independent agreement is corroboration: if the decipherment were wrong, four separate translations would not have converged.", "id": "q4"},
    {"type": "open", "prompt": "Using examples from the chapter, explain how Mesopotamian rulers used writing and monuments to present their power. How should a historian read such sources?", "rubric": "A strong answer draws on several examples: the Sumerian King List as an argument for a single legitimate kingship; the Stele of the Vultures; Uruinimgina's reforms presenting the ruler as protector of the weak; Naram-Sin's claim of divinity; Hammurabi's stele showing the king before Shamash with prologue and epilogue; Assyrian reliefs and inscriptions using terror as message, and Sennacherib's 'caged bird'. It then explains source-critical reading: these are statements of royal ideology aimed at specific audiences, to be checked against independent evidence such as administrative records, the Hebrew Bible's account of 701 BCE, or archaeology.", "id": "q5"},
    {"type": "open", "prompt": "Mesopotamia left more written records than almost any ancient civilization, yet it was largely forgotten for two thousand years. Explain why, and how it was recovered.", "rubric": "A strong answer explains that cuneiform and the Akkadian and Sumerian languages fell out of use (Aramaic replacing Babylonian, the script surviving only among temple scholars until about the first century CE), so knowledge passed only through the Bible and Greek writers. It describes the recovery: excavation of sites such as Nineveh and its library, decipherment through the trilingual Behistun inscription copied by Rawlinson, the 1857 test, and later recognition of Sumerian. Better answers note the role of chance in survival (clay tablets baked when Nineveh burned) and current threats such as looting and the destruction of Nimrud.", "id": "q6"}
  ]$meso_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/ancient-civilizations/mesopotamia', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
