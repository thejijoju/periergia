-- The Persian Empire — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/the-persian-empire @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Cyrus and the Cyrus Cylinder, Darius's empire (satrapies, Royal Road,
-- Persepolis), Ahura Mazda and Zoroaster, the Greco-Persian Wars from both
-- sides, Alexander, and the Parthian and Sasanian empires to the Arab
-- conquest.
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
    'history/classical-antiquity/the-persian-empire',
    'research',
    'advanced',
    'read',
    $persia_master$> **The Persian Empire** founded by Cyrus the Great in the 550s BCE was the largest state the world had yet seen, stretching from the Aegean to the Indus and from Central Asia to Egypt. Western readers usually meet it as the enemy in Herodotus's story of the Greek victories at Marathon and Salamis. Seen from Persepolis rather than Athens, it looks very different: a pragmatic, multilingual empire that ruled dozens of peoples with relatively light control, built roads and canals, and lasted more than two centuries. This chapter covers the Achaemenid empire and the later Iranian empires, Parthian and Sasanian, that carried its tradition until the Arab conquest of the seventh century CE.

## Cyrus the Great

The Persians were an Iranian-speaking people settled in Fars, in southwest Iran, a region the Greeks called Persis. Around 550 BCE their king **Cyrus II** overthrew the Median king Astyages, who had dominated the Iranian plateau. Within twenty years Cyrus had conquered Lydia in western Anatolia, defeating its famously wealthy king Croesus around 547 BCE; much of Central Asia; and, in 539 BCE, Babylon, which brought with it Mesopotamia and the Levant. His son **Cambyses** added Egypt in 525 BCE.

Cyrus's reputation rests partly on how he treated the conquered. The **Cyrus Cylinder**, a clay cylinder inscribed in Akkadian cuneiform and found at Babylon in 1879, announces that Babylon's god Marduk chose Cyrus to replace the impious last Babylonian king, that Cyrus entered the city peacefully, and that he restored gods and peoples deported to Babylon to their homes. The Hebrew Bible praises Cyrus as the "anointed" of the God of Israel for allowing the Judahite exiles to return, as the chapter on the Levant described.

From the late 1960s the Shah of Iran promoted the cylinder as "the first charter of human rights", and in 1971 a replica was given to the United Nations, where it is displayed. Historians are more cautious. The text belongs to a long Mesopotamian tradition of royal inscriptions in which a new king presents himself as the chosen of the local gods and his predecessor as wicked. It is propaganda aimed at Babylonians, and it shows a policy of respecting local cults and elites when that helped secure control, not a concept of human rights. That pragmatic tolerance was nonetheless real, and it was one reason the empire held together.

{{image: Cyrus Cylinder | The Cyrus Cylinder, a Babylonian royal inscription made soon after 539 BCE celebrating Cyrus's conquest of Babylon. Modern claims that it is a charter of human rights misread its genre.}}

```checkpoint
q: How do most historians interpret the Cyrus Cylinder?
a*: As royal propaganda in a Mesopotamian tradition, presenting Cyrus as Marduk's chosen king, which also reflects a real policy of respecting local cults.
a: As the first charter of human rights, as the Shah of Iran claimed.
x: That modern claim misreads the text's genre. It is a royal inscription in the Mesopotamian tradition, not a statement of rights.
a: As a forgery made in the nineteenth century.
x: The cylinder was excavated at Babylon in 1879 and is accepted as genuine.
a: As a letter from Cyrus to the Greek cities.
x: The text is in Akkadian cuneiform and addressed to a Babylonian audience.
hint: Who was the intended audience, and in what tradition was it written?
why: Reading the cylinder in its genre shows a new king legitimising his rule to Babylonians, while confirming a pragmatic Persian policy of tolerance.
---
q: Why did the policy of respecting local religions help the Persian empire?
a: Because the Persians had no religion of their own.
x: The Persians worshipped Ahura Mazda and other gods; tolerance was a political choice, not a lack of belief.
a: Because it made the empire's subjects convert to Persian religion.
x: The policy did not require conversion; it left local religions in place.
a*: Because ruling many peoples through local cults and elites, rather than forcing change, reduced resistance and secured cooperation.
a: Because it allowed the Persians to avoid collecting taxes.
x: The Persians collected tribute systematically; tolerance did not replace taxation.
hint: Think about the cost of ruling a hostile population.
why: Respecting local gods and elites made Persian rule acceptable to many subjects, an economical way of holding a huge and diverse empire.
```

## Darius and the Machinery of Empire

After Cambyses died in 522 BCE, the throne was seized by **Darius I**, a member of a collateral branch of the royal family. His account of how he came to power, carved in three languages on the cliff at **Behistun**, the inscription that later unlocked cuneiform, claims that he overthrew a usurping magus named Gaumata, who was impersonating Cambyses's brother Bardiya. Many historians suspect that Darius killed the real Bardiya and invented the impostor story to legitimise a coup. Behistun is a reminder that the most famous Persian source is also a piece of political self-justification.

Darius (reigned 522–486 BCE) organised the empire for the long term:

- **Satrapies.** The empire was divided into provinces, about twenty according to Herodotus, each governed by a **satrap**, usually a Persian noble. Satraps collected tribute and kept order, while royal secretaries and garrison commanders, reporting separately to the king, helped keep them loyal.
- **The Royal Road.** Darius improved older routes into a road of about 2,700 kilometres from Sardis in western Anatolia to Susa in Iran, with more than a hundred way stations where royal messengers could change horses. Herodotus wrote that nothing mortal travelled faster, and that neither snow nor rain nor heat nor darkness stopped them, words later borrowed as the unofficial motto of the United States Postal Service.
- **Coinage and standards.** Darius issued the gold **daric** and silver coins, and standardised weights and measures.
- **Canals.** He completed a canal linking the Nile to the Red Sea, recording the achievement in inscriptions along its route.
- **Persepolis.** From about 518 BCE he built a ceremonial capital at **Persepolis**. Reliefs on the great audience hall, the Apadana, show delegations from across the empire, Lydians, Egyptians, Babylonians, Indians, Arabians, and others, bringing gifts to the king, an image of a harmonious empire of many peoples.

Thousands of clay tablets found at Persepolis, mostly in the Elamite language and dating from about 509 to 493 BCE, record the food rations paid to workers and officials across the Persepolis region, including many employed on the royal building works. They show a workforce of men, women, and children from across the empire, paid in grain, wine, and beer, with skilled workers paid more and extra rations given to women who had recently given birth (double for a son). The tablets show a paid, rationed workforce, not gangs of chattel slaves, although many of these dependent workers (*kurtaš*) were deportees or otherwise unfree.

The empire was multilingual by design. Royal inscriptions were written in Old Persian, Elamite, and Babylonian, and the everyday language of administration across the empire was **Aramaic**, already used by the Assyrian and Babylonian administrations, which the Persians spread from Egypt to Afghanistan.

{{image: Persepolis | Ruins of Persepolis, the ceremonial capital begun by Darius I around 518 BCE. Reliefs on its staircases show delegations from across the empire bringing gifts to the king.}}

```checkpoint
q: What do the Persepolis Fortification tablets show about the workers of the Persepolis region?
a: That the city was built entirely by enslaved war captives without pay.
x: The tablets record rations paid to workers, including higher pay for skilled workers, which does not fit unpaid slavery.
a*: That a mixed workforce of men, women, and children from across the empire was paid in rations, with higher pay for skill and extra rations for new mothers.
a: That only Persian men worked on the site.
x: The tablets show men, women, and children from many parts of the empire.
a: That the workers were paid in gold coins.
x: Rations of grain, wine, and beer were the main form of payment recorded.
hint: Look at what the tablets record: rations.
why: Administrative records reveal an organised, paid labour force, correcting assumptions about slave-built monuments.
---
q: Why should historians treat Darius's Behistun inscription with caution as a source for how he became king?
a: Because it is written in a language no one can read.
x: Behistun's three languages have been deciphered; indeed it was the key to cuneiform.
a: Because it was carved by Darius's enemies.
x: Behistun was commissioned by Darius himself, which is precisely why it may be biased.
a: Because it was carved centuries after Darius's death.
x: The inscription dates from Darius's own reign, around 520 BCE.
a*: Because it is Darius's own justification of a disputed seizure of power, and the story of an impostor Bardiya may have been invented to legitimise a coup.
hint: Who benefited from the version of events the inscription tells?
why: A ruler's account of his own accession is a classic case of a source with a strong motive to shape the story.
```

## Ahura Mazda and the Lie

The Achaemenid kings worshipped **Ahura Mazda**, the "Wise Lord", and Darius's inscriptions repeatedly credit him for their success. They also condemn "the Lie" (*drauga*), a force of disorder akin to the Zoroastrian falsehood opposed to truth and order (*arta*), and associate rebels with it. These ideas are closely related to the teachings attributed to **Zoroaster** (Zarathustra), the prophet whose hymns, the *Gathas*, form the oldest part of the Zoroastrian scripture, the Avesta.

Zoroaster's dates are very uncertain, with scholarly estimates ranging from about 1500 BCE to the sixth century BCE; most now favour a date around 1000 BCE, give or take a century or two. His teaching presented the world as a struggle between truth and falsehood, in which humans choose sides and are judged after death. Whether the Achaemenid kings were Zoroastrians in a strict sense is debated, since their inscriptions never mention Zoroaster. Zoroastrianism became the established religion of the later Sasanian empire.

Some scholars argue that Zoroastrian ideas, such as a final judgement, resurrection, heaven and hell, and angels and demons, influenced Judaism during and after the Persian period, and through it Christianity and Islam. The extent of that influence is contested, but the Persian empire was the setting in which the Judahite community rebuilt itself, and the two traditions were in contact for centuries.

## The Wars with Greece, from Both Sides

To the Greeks, and to later Western tradition, the **Greco-Persian Wars** were a heroic defence of freedom against an Asian despot. The story comes almost entirely from Herodotus, who wrote a generation later, from the Greek side.

In outline: Greek cities in Ionia, on the coast of Anatolia, under Persian rule, revolted in 499 BCE, with help from Athens and Eretria, and in 498 burned the provincial capital at Sardis. Persia crushed the revolt in 494–493 BCE. In 490 BCE a Persian expedition sent to punish Athens and Eretria was defeated by the Athenians at **Marathon**. In 480 BCE Darius's son **Xerxes** led a huge invasion. A small Greek force, led by the Spartan king Leonidas, held the pass of **Thermopylae** for several days before being outflanked and destroyed. Xerxes took and burned Athens, but the Greek fleet defeated the Persian navy at **Salamis**. In 479 BCE the Greeks won on land at **Plataea** and at sea at Mycale.

From the Persian side, the picture changes. Persian royal sources are almost silent about Greece, suggesting that these campaigns, though significant, were wars on a distant western frontier, not struggles for the empire's survival. Herodotus's figures for Xerxes's army, more than 1.7 million soldiers, are impossible on logistical grounds, as Ibn Khaldun's method would show; modern estimates mostly range from about 100,000 to a few hundred thousand. And the defeat did not end Persian influence in the Greek world. Persia later used its wealth more than its armies: Persian gold helped Sparta build the fleet that defeated Athens in the Peloponnesian War, and in the **King's Peace** of 387/386 BCE the Greek cities accepted Persian control of Ionia. For a century after Salamis, the Persian king was often the arbiter of Greek politics. Modern historians of Persia, such as Pierre Briant, have done much to tell the story from the empire's own records.

```checkpoint
q: Why are Herodotus's figures for the size of Xerxes's army rejected by modern historians?
a: Because Herodotus deliberately underestimated the Persian army.
x: Herodotus's figure of more than 1.7 million soldiers is an overestimate, not an underestimate.
a: Because Persian records give a precise smaller figure.
x: Persian records are almost silent about the Greek campaigns; the objection is logistical.
a*: Because an army of over 1.7 million could not have been supplied with food and water or moved through Greece; modern estimates are around 100,000–300,000.
a: Because the battle of Thermopylae never took place.
x: Thermopylae is well attested; the doubt concerns the army's size, not the battle.
hint: Think about Ibn Khaldun's test of plausibility.
why: Logistical analysis, of the kind Ibn Khaldun recommended, shows that ancient armies on this scale were impossible.
---
q: What does the King's Peace of 387/386 BCE show about Persia's role in Greek affairs after Salamis?
a*: That Persia remained a powerful arbiter of Greek politics, and the Greek cities accepted Persian control of Ionia.
a: That Persia had no further involvement with the Greeks.
x: Persia was deeply involved, using its wealth to influence Greek politics for decades.
a: That the Greeks conquered the Persian empire.
x: That came later with Alexander. In 387/386 BCE the Greeks accepted Persian control of Ionia.
a: That Athens and Sparta united to drive out the Persians.
x: The King's Peace reflected Greek division, with Persian support shaping outcomes.
hint: What did the Greek cities concede?
why: After the famous defeats, Persia used money and diplomacy to dominate Greek affairs, a perspective lost when the story ends at Salamis.
```

## Alexander and the Fall of the Achaemenids

In 334 BCE **Alexander of Macedon** crossed into Asia. He defeated Persian armies at the Granicus, at **Issus** in 333 BCE, and decisively at **Gaugamela** in northern Iraq in 331 BCE. The last Achaemenid king, **Darius III**, fled east and was killed by one of his own satraps, Bessus, in 330 BCE.

In the same year Alexander's troops burned the palaces of **Persepolis**. Ancient sources disagree about why. Some present it as deliberate revenge for Xerxes's burning of Athens; others tell a story of a drunken feast at which an Athenian courtesan, Thaïs, urged the king to set the fire. Whatever the motive, the fall of Persepolis helped preserve its administrative archives: thousands of unbaked clay tablets lay protected under a collapsed part of the fortification wall until their excavation in 1933. Alexander then presented himself as the heir of the Achaemenid kings, adopted Persian court dress and ceremony, and married Persian noblewomen, as the chapter on Alexander and the Hellenistic world describes.

## Parthians and Sasanians

The Persian imperial tradition outlived the Achaemenids by nearly a thousand years.

The **Parthians**, an Iranian people from the northeast, broke away from the Seleucid successors of Alexander in the third century BCE and built an empire, ruled by the Arsacid dynasty, that by the second century BCE stretched from Mesopotamia to Afghanistan, whose chief capital became **Ctesiphon** on the Tigris. The Parthians were Rome's great eastern rival. In 53 BCE they destroyed a Roman army at **Carrhae** and killed its commander, Crassus, using mounted archers and heavily armoured cavalry; the "Parthian shot", a backwards shot from a horse in retreat, is often said to be the origin of the English "parting shot", though the link is unproven. The Parthian state was relatively decentralised, with powerful noble families, and it profited from its position on the Silk Roads between Rome and China.

In 224 CE **Ardashir I**, from Fars, overthrew the Parthians and founded the **Sasanian** empire, which claimed a glorious Iranian past, though how much the early Sasanians knew of the Achaemenids is debated. Its second king, **Shapur I**, claimed victories over three Roman emperors and in 260 CE captured the emperor **Valerian**, an event celebrated in a rock relief at Naqsh-e Rostam showing Roman emperors submitting to Shapur on horseback, one of them kneeling (the figures are usually identified as Valerian and Philip the Arab). The Sasanians made **Zoroastrianism** a state religion, with a powerful priesthood, though Christians, Jews, Manichaeans, and Buddhists lived within the empire, sometimes tolerated and sometimes persecuted.

Under **Khosrow I** (reigned 531–579), the Sasanian empire reformed its taxes and army and patronised learning, including translations of Greek and Indian works. Its long rivalry with Rome, and then with the eastern Roman empire based at Constantinople, culminated in a catastrophic war from 602 to 628 CE, in which Khosrow II's armies took Jerusalem and Egypt and besieged Constantinople before the emperor Heraclius counter-attacked deep into Iran. Both empires were exhausted. Within a decade, Arab armies inspired by the new religion of Islam defeated the Sasanians at **al-Qadisiyya** (around 636) and **Nahavand** (642). The last Sasanian king, Yazdegerd III, was killed in 651.

Iran became part of the Islamic world, and most of its people eventually converted to Islam. But Persian language, literature, and statecraft endured and shaped the Islamic caliphates in turn, and around 1010 the poet Ferdowsi completed the *Shahnameh*, the "Book of Kings", an epic of Iranian history from mythical times to the Arab conquest, which remains central to Iranian identity.

```checkpoint
q: What does the relief of Shapur I and Valerian at Naqsh-e Rostam commemorate?
a: A peace treaty between equal partners.
x: The relief shows Roman emperors submitting to the mounted Persian king, which is a scene of triumph, not of equal partners.
a: The Parthian victory at Carrhae.
x: Carrhae was a Parthian victory in 53 BCE; the relief commemorates a later Sasanian triumph.
a: Alexander's conquest of Persia.
x: The relief celebrates a Sasanian victory over Rome, not Alexander.
a*: The Sasanian capture of the Roman emperor Valerian in 260 CE, presented as a triumph of Persia over Rome.
hint: Roman emperors are shown as captive and suppliant.
why: Capturing a Roman emperor was an unprecedented humiliation for Rome, and the relief proclaimed Sasanian power.
---
q: Why did the Sasanian empire fall so quickly to the Arab armies in the 630s and 640s?
a: Because it had never fought a major war before.
x: The Sasanians had fought Rome for centuries, including a huge war just before the Arab conquest.
a*: Because it was exhausted by the devastating war with the eastern Roman empire from 602 to 628, followed by internal turmoil.
a: Because the Arabs had much larger armies.
x: Arab armies were not necessarily larger; the Sasanians' weakness was exhaustion and internal turmoil.
a: Because the Sasanians converted to Christianity and stopped fighting.
x: The Sasanian state remained Zoroastrian until its fall.
hint: Consider what happened in the decade before the conquest.
why: The great war of 602–628 drained both empires, leaving the Sasanians unable to resist a new power from Arabia.
```

## Further exploration

- **Pierre Briant, *From Cyrus to Alexander: A History of the Persian Empire* (English trans. 2002).** The standard scholarly history of the Achaemenid empire.
- **Lloyd Llewellyn-Jones, *Persians: The Age of the Great Kings* (2022).** A readable history told from the Persian side.
- **Herodotus, *The Histories*, trans. Tom Holland (2013).** The Greek account of the wars, best read critically.
- **Touraj Daryaee, *Sasanian Persia: The Rise and Fall of an Empire* (2009).** A concise history of the Sasanians.
- **Matthew P. Canepa, *The Two Eyes of the Earth: Art and Ritual of Kingship between Rome and Sasanian Iran* (2009).** On the relationship between Rome and Sasanian Iran.$persia_master$,
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
  select $persia_quiz$[
    {"type": "mcq", "prompt": "What was a satrap?", "options": ["A Persian priest of Ahura Mazda", "A provincial governor who collected tribute and kept order", "A royal messenger on the Royal Road", "A Greek mercenary"], "answerIndex": 1, "explanation": "Darius divided the empire into satrapies, each governed by a satrap, usually a Persian noble, checked by officials reporting separately to the king.", "id": "q1"},
    {"type": "mcq", "prompt": "Which language was the everyday language of administration across the Achaemenid empire?", "options": ["Greek", "Old Persian", "Aramaic", "Latin"], "answerIndex": 2, "explanation": "Royal inscriptions used Old Persian, Elamite, and Babylonian, but Aramaic served as the common administrative language from Egypt to Afghanistan.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened at Carrhae in 53 BCE?", "options": ["The Parthians destroyed a Roman army and killed its commander, Crassus", "Alexander defeated Darius III", "The Arabs defeated the Sasanians", "Shapur I captured Valerian"], "answerIndex": 0, "explanation": "Parthian horse archers and armoured cavalry defeated Crassus's legions, establishing Parthia as Rome's great eastern rival.", "id": "q3"},
    {"type": "mcq", "prompt": "Why are Persian royal sources important for reassessing the Greco-Persian Wars?", "options": ["They give detailed accounts that confirm Herodotus exactly", "They prove the Persians won at Salamis", "They were written by Greek historians", "They are almost silent about Greece, suggesting the wars were frontier campaigns rather than struggles for the empire's survival"], "answerIndex": 3, "explanation": "The near-silence of Persian sources, and Persia's continued influence through wealth and diplomacy, put the Greek victories in a different perspective.", "id": "q4"},
    {"type": "open", "prompt": "How did the Achaemenid empire hold together such a large and diverse territory? Use at least three examples from the chapter.", "rubric": "A strong answer discusses several of: pragmatic tolerance of local religions and elites (the Cyrus Cylinder in context, restoration of the Judahite exiles); the satrapy system with separate royal officials as checks; the Royal Road and messenger system; standard coinage and measures; Aramaic as a common administrative language; the ideology of the Persepolis reliefs and of Ahura Mazda against the Lie; and paid labour recorded in the Fortification tablets. Better answers note the limits and the use of force against rebels.", "id": "q5"},
    {"type": "open", "prompt": "Explain how the Persian imperial tradition continued after Alexander, through the Parthians and Sasanians, and why the Sasanian empire fell.", "rubric": "A strong answer describes the Parthian Arsacid empire, its chief capital at Ctesiphon, Carrhae, its decentralised structure and Silk Road position; the Sasanian founding by Ardashir I in 224 CE, Shapur I's capture of Valerian, Zoroastrianism as state religion, Khosrow I's reforms; the war of 602–628 with the eastern Roman empire; and the Arab conquest (al-Qadisiyya, Nahavand, Yazdegerd III's death in 651). It notes the endurance of Persian culture, e.g. Ferdowsi's Shahnameh.", "id": "q6"}
  ]$persia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/the-persian-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
