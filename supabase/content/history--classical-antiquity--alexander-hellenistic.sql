-- Alexander and the Hellenistic World — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/alexander-and-the-hellenistic-world @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Philip and Macedon, Alexander's conquest and its debated aims, the
-- successor kingdoms from Egypt to Bactria, Alexandria and Hellenistic
-- science, philosophy and cultural mixing, and absorption by Rome and
-- Parthia.
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
    'history/classical-antiquity/alexander-and-the-hellenistic-world',
    'research',
    'advanced',
    'read',
    $alex_master$> **Alexander the Great** conquered the Persian empire in about a decade and died at thirty-two, leaving no capable heir and no plan for what came next. The kingdoms his generals carved out of his conquests, in Egypt, Syria and Mesopotamia, Macedon, and as far east as Afghanistan and India, are known as the **Hellenistic** world, from *Hellenizein*, "to speak Greek" or "to act like a Greek". For three centuries Greek-speaking dynasties ruled from the Nile to the Indus, and Greek culture mixed with Egyptian, Persian, Jewish, Indian, and Central Asian traditions. This chapter covers the conquest, the successor kingdoms, the science and philosophy of the age, and its absorption by Rome and Parthia.

## Philip and the Rise of Macedon

**Macedon**, in northern Greece, was long regarded by southern Greeks as a backward kingdom on the edge of the Greek world, ruled by kings rather than citizens. Its transformation was the work of **Philip II** (reigned 359–336 BCE). He reorganised the army around a heavy infantry phalanx armed with the **sarissa**, a pike five to six metres long, combined with elite cavalry, the Companions. He used gold from Macedonian mines, diplomacy, and marriage alliances as well as force. In 338 BCE he defeated Athens and Thebes at **Chaeronea** and organised the Greek states into the League of Corinth under his leadership, planning an invasion of Persia. In 336 BCE he was assassinated by one of his bodyguards at his daughter's wedding.

## The Conquest

His son **Alexander**, aged twenty, had been tutored by Aristotle. He secured his position by force, destroying the rebellious city of Thebes in 335 BCE, and in 334 BCE crossed into Asia with about 40,000 men.

The campaign moved with astonishing speed:

- **334 BCE:** victory at the river Granicus in northwest Anatolia; the coastal cities of Anatolia taken.
- **333 BCE:** victory over Darius III at **Issus**, near the modern border of Turkey and Syria; Darius's family captured.
- **332 BCE:** the seven-month siege of **Tyre**, which Alexander took by building a causeway to the island city; then Egypt, which surrendered without a fight. At the oracle of Ammon at Siwa in the western desert, Alexander was reportedly greeted as the son of the god, and he founded **Alexandria** on the coast.
- **331 BCE:** decisive victory over Darius at **Gaugamela** in northern Iraq; Babylon and Susa taken.
- **330 BCE:** Persepolis burned, as the chapter on the Persian Empire described; Darius killed by his own satrap Bessus.
- **329–327 BCE:** hard fighting in Bactria and Sogdiana (modern Afghanistan, Uzbekistan, and Tajikistan) against guerrilla resistance; Alexander married **Roxana**, the daughter of a local noble.
- **326 BCE:** invasion of the Punjab and victory over the Indian king Porus at the river Hydaspes. At the river Hyphasis, his exhausted army refused to go further, and Alexander turned back.
- **325 BCE:** a disastrous march through the Gedrosian desert in southern Iran, in which many died.
- **323 BCE:** Alexander died in Babylon in June, aged thirty-two, probably of illness, though poison was rumoured.

## What Did Alexander Want?

Alexander's aims have been argued over since antiquity. As he advanced, he increasingly presented himself as the successor of the Persian kings rather than as a Greek avenger. He adopted elements of Persian royal dress and ceremony, appointed Persians as satraps, trained Iranian youths in Macedonian fighting methods, and in 324 BCE held mass weddings at Susa in which he and about ninety of his officers married Persian and Iranian noblewomen. He attempted to introduce **proskynesis**, the Persian court gesture of bowing before the king, which his Macedonians resisted as fit only for gods. Tensions rose: he had his general Parmenion and Parmenion's son executed, killed his friend Cleitus in a drunken quarrel, and executed the historian Callisthenes.

In the early twentieth century the historian William Tarn portrayed Alexander as a visionary who dreamed of the "unity of mankind". Later historians, notably A. B. Bosworth, saw instead a brilliant but ruthless conqueror whose campaigns killed huge numbers of people and whose integration of Persians was a practical means of governing a vast empire with too few Macedonians. Most current scholarship leans toward the second view.

Alexander's reputation varies sharply by place. In Zoroastrian tradition he was remembered as "accursed", the destroyer of Persepolis and of sacred texts. In the *Alexander Romance*, a fantastical biography that was translated into dozens of languages from Ethiopic to Old Norse, he became a legendary hero who explored the depths of the sea and the edges of the world. In Persian literature, as Iskandar, he was absorbed into the line of Iranian kings. Many Islamic commentators identified him with Dhu al-Qarnayn, "the two-horned one" of the Qur'an, though this identification is debated.

```checkpoint
q: Why did Alexander adopt Persian court customs and marry his officers to Iranian noblewomen?
a*: Because he presented himself as the successor of the Persian kings, and integrating the Persian elite helped him govern a vast empire with relatively few Macedonians.
a: Because he had converted to Zoroastrianism.
x: There is no evidence of conversion; his adoption of Persian customs was political.
a: Because his Macedonian soldiers demanded it.
x: His Macedonians strongly resisted these changes, especially proskynesis.
a: Because the Persian empire had already defeated Macedon.
x: Alexander had conquered Persia; the policy concerned how to rule it.
hint: How could a small number of Macedonians rule an empire of millions?
why: Adopting Persian kingship and co-opting Iranian elites was a practical strategy for governing a conquered empire, whatever larger vision Alexander may have had.
---
q: Why do Zoroastrian and Persian literary traditions remember Alexander so differently?
a: Because some sources describe a different man.
x: The sources refer to the same Alexander; they differ because of who remembered him and why.
a: Because Alexander never reached Iran.
x: Alexander conquered Iran and burned Persepolis, which is central to the Zoroastrian memory.
a*: Because Zoroastrian tradition remembered him as the destroyer of Persepolis and sacred texts, while later Persian literature absorbed him into the line of Iranian kings.
a: Because all Persian sources praised him equally.
x: Zoroastrian sources called him accursed, so the traditions were not uniform.
hint: Consider what each tradition valued.
why: Alexander's memory was shaped by later communities' needs, from religious grievance to literary adoption into Iranian kingship.
```

## The Successor Kingdoms

Alexander's death left his empire without an adult heir. His generals, the **Diadochi** or "successors", fought each other for forty years. His half-brother, his posthumously born son by Roxana, and his mother were all killed. By around 280 BCE three major dynasties had emerged:

- **The Ptolemies** in Egypt, founded by Alexander's general Ptolemy, ruling from Alexandria until 30 BCE.
- **The Seleucids**, founded by Seleucus, ruling a vast territory from Anatolia and Syria to Iran, with capitals at Antioch and Seleucia on the Tigris. Around 303 BCE Seleucus ceded his easternmost territories to the Indian emperor Chandragupta Maurya in exchange for 500 war elephants.
- **The Antigonids** in Macedon and much of mainland Greece.

Smaller kingdoms also arose, such as **Pergamon** in western Anatolia, a centre of learning with a great library. In the far east, Greek settlers in Bactria founded the **Greco-Bactrian** kingdom around 250 BCE, and later **Indo-Greek** kingdoms in what are now Afghanistan, Pakistan, and northwest India. Excavations at **Ai Khanoum** in northern Afghanistan revealed a Greek city on the Oxus river with a theatre, a gymnasium, and an inscription of moral maxims copied from Delphi, more than 4,000 kilometres from Greece. One Indo-Greek king, Menander (around 150 BCE), appears in a Buddhist text, the *Milindapanha* ("Questions of Milinda"), as a king who debates with a Buddhist monk and is converted.

Hellenistic kings ruled as absolute monarchs over largely non-Greek populations, with Greek and Macedonian settlers forming a privileged minority. In Egypt, the Ptolemies presented themselves to Egyptians as pharaohs, built temples to Egyptian gods, and issued bilingual decrees such as the one recorded on the **Rosetta Stone**, while running a Greek-speaking administration that extracted Egypt's wealth through taxes and royal monopolies. They also adopted the Egyptian royal practice of brother–sister marriage.

```checkpoint
q: Why did Seleucus give up territory to Chandragupta Maurya?
a: Because he was defeated and captured.
x: Seleucus was not captured; he made an agreement with Chandragupta.
a*: In exchange for 500 war elephants, in an agreement that ended conflict on his eastern frontier.
a: Because the territory had no value.
x: The territories were significant; Seleucus gained something he valued more.
a: Because Alexander had ordered it in his will.
x: Alexander left no such arrangement; the deal was made around 303 BCE.
hint: What military resource did India offer?
why: The exchange shows how Hellenistic and Indian states interacted, and the elephants proved important in the wars between Alexander's successors.
---
q: What does Ai Khanoum reveal about the Hellenistic world?
a: That Greek culture never spread beyond the Mediterranean.
x: Ai Khanoum, in northern Afghanistan, is direct evidence of Greek culture far beyond the Mediterranean.
a: That the Persians built a Greek-style capital in Iran.
x: Ai Khanoum was a Greek settlement in Bactria, not a Persian capital.
a: That Alexander founded the city personally in 323 BCE.
x: Its founding date and founder are uncertain, and Alexander died in Babylon in 323 BCE.
a*: That Greek settlers built a city with a theatre, gymnasium, and Delphic maxims more than 4,000 kilometres from Greece, in Central Asia.
hint: Where is the Oxus river?
why: A Greek city deep in Central Asia shows how far Hellenistic settlement and culture reached.
```

## Alexandria and Hellenistic Science

**Alexandria**, founded by Alexander, became the greatest city of the Mediterranean world, with perhaps half a million inhabitants by the first century BCE: Greeks, Egyptians, and one of the largest Jewish communities anywhere. Its harbour was marked by the Pharos lighthouse, one of the wonders of the ancient world.

The Ptolemies founded the **Museum**, a research institution supported by the crown, and the **Library of Alexandria**, which aimed to collect every book in Greek. Ships docking at Alexandria were reportedly searched for books, which were copied, with the copies sometimes returned and the originals kept. The Jewish scriptures were translated into Greek in Alexandria in the third and second centuries BCE, producing the **Septuagint**, the version later used by early Christians.

The period produced some of the most important science of the ancient world:

- **Euclid**, working in Alexandria around 300 BCE, systematised geometry in the *Elements*, which remained a standard textbook for over two thousand years.
- **Archimedes** of Syracuse (died 212 BCE) calculated the value of pi between narrow bounds, studied levers, buoyancy, and the areas and volumes of curved figures, and designed war machines to defend his city against Rome.
- **Eratosthenes**, head of the Library, estimated the circumference of the Earth around 240 BCE by comparing the angle of the sun's rays at Alexandria and Syene (Aswan) at noon on the summer solstice. His result was close to the true value.
- **Aristarchus** of Samos proposed that the Earth goes around the sun, an idea that found few supporters in antiquity.
- **Herophilus** and **Erasistratus** in Alexandria dissected human bodies, distinguishing nerves from blood vessels.
- The **Antikythera mechanism**, a bronze geared device recovered from a shipwreck off a Greek island and dated to the second or first century BCE, modelled the movements of the sun, moon, and probably the planets, and predicted eclipses. Nothing of comparable mechanical complexity is known again until medieval Europe.

The Library's end is the subject of persistent myths. There was no single dramatic destruction. A fire during Julius Caesar's war in Alexandria in 48 BCE probably destroyed some books, and the institution declined over the following centuries through reduced royal support, civil conflicts, and neglect. The story that the Arab conquerors burned it in 642 CE appears only in sources written centuries later and is rejected by most historians.

{{image: Antikythera mechanism | A fragment of the Antikythera mechanism, a geared astronomical calculator from the second or first century BCE, recovered from a shipwreck off a Greek island.}}

```checkpoint
q: How did Eratosthenes estimate the circumference of the Earth?
a: By sailing around the world and measuring the distance travelled.
x: No one sailed around the world in antiquity. His method used geometry and a single measured distance.
a: By observing the shadow of the Earth on the moon during an eclipse only.
x: Lunar eclipses showed the Earth was round, but Eratosthenes's measurement used shadows at two places on Earth.
a*: By comparing the angle of the sun's rays at noon on the summer solstice at Alexandria and Syene, and using the distance between them.
a: By copying a figure from Babylonian records.
x: Eratosthenes made his own calculation using observation and geometry.
hint: At Syene, the sun was directly overhead at noon on the solstice.
why: The difference in the sun's angle at two places, combined with the distance between them, gives the fraction of the Earth's circumference, an elegant use of geometry.
---
q: What is the best-supported account of how the Library of Alexandria ended?
a*: It declined gradually over centuries, through reduced support, conflicts, and neglect, with no single destruction.
a: It was destroyed in a single fire set by Julius Caesar.
x: Caesar's fire in 48 BCE probably destroyed some books, but the Library continued afterwards.
a: It was burned by Arab conquerors in 642 CE.
x: This story appears only in much later sources and is rejected by most historians.
a: It was moved intact to Rome.
x: There is no evidence of the Library being moved to Rome.
hint: Be suspicious of dramatic single-event stories.
why: The evidence points to slow decline rather than a single catastrophe, and dramatic stories often reflect later agendas.
```

## Hellenistic Philosophy, Religion, and Culture

A form of Greek called **koine**, "common" Greek, became the shared language of trade, government, and learning from the Mediterranean to Central Asia. The New Testament was later written in it.

New philosophies addressed how individuals could live well in a world of large, distant kingdoms where most people had little political power. **Stoicism**, founded by Zeno of Citium around 300 BCE and named after the painted porch (*stoa*) in Athens where he taught, held that virtue is the only true good, that people should accept what they cannot control, and that all humans share in a universal reason, making them citizens of one world. **Epicureanism**, founded by Epicurus, taught that the aim of life is tranquillity and freedom from fear, including fear of the gods and of death, and that the universe is made of atoms moving in a void. The **Cynics**, such as Diogenes, rejected social conventions altogether, and the **Sceptics** questioned whether certain knowledge was possible. Stoicism in particular later shaped Roman thought and early Christianity.

Religions also travelled and mixed. The Egyptian goddess **Isis** acquired worshippers across the Mediterranean; the Ptolemies promoted a new god, Serapis, combining Egyptian and Greek features. In **Gandhara**, in modern Pakistan and Afghanistan, Greek artistic styles later contributed to some of the earliest images of the Buddha in human form, though much of this art dates from the later Kushan period.

Cultural mixing could also provoke resistance. In Judea, under Seleucid rule, the king **Antiochus IV** attempted to suppress Jewish practices and rededicated the Temple in Jerusalem to Zeus around 167 BCE. The resulting **Maccabean revolt** led to an independent Jewish kingdom under the Hasmonean dynasty. The rededication of the Temple is commemorated in the festival of **Hanukkah**.

```checkpoint
q: Why did philosophies such as Stoicism and Epicureanism appeal in the Hellenistic period?
a: Because they taught people how to win elections in the city-states.
x: Most people in Hellenistic kingdoms had little political power; these philosophies focused on individual life rather than winning politics.
a: Because they were imposed by Alexander as state religions.
x: These were philosophical schools chosen by individuals, not state religions imposed by rulers.
a: Because they rejected all ethics.
x: Both schools were centrally concerned with ethics and how to live.
a*: Because they offered ways to live well and find peace of mind in a world of large, distant kingdoms where individuals had little control.
hint: Think about the shift from the city-state to the great kingdoms.
why: With political power concentrated in distant monarchs, philosophy turned toward personal virtue and tranquillity.
---
q: What was the Maccabean revolt a reaction against?
a: Roman occupation of Judea.
x: The revolt took place in the 160s BCE against the Seleucids; Roman rule came later.
a*: The Seleucid king Antiochus IV's suppression of Jewish practices and rededication of the Jerusalem Temple to Zeus.
a: Egyptian invasion of Judea.
x: The revolt was against the Seleucid king Antiochus IV, not Egypt.
a: The spread of Buddhism into Judea.
x: Buddhism was not a factor; the conflict concerned Seleucid policy toward Jewish religion.
hint: The festival of Hanukkah commemorates its outcome.
why: Attempts to impose Hellenistic religious practices provoked a revolt that established an independent Jewish kingdom.
```

## The End of the Hellenistic Kingdoms

From the second century BCE, the Hellenistic kingdoms were absorbed by two expanding powers. In the west, Rome defeated Macedon at **Pydna** in 168 BCE, destroyed Corinth in 146 BCE, inherited the kingdom of Pergamon by its last king's will in 133 BCE, and reduced the Seleucid kingdom to a Roman province in 63 BCE. In the east, the **Parthians** took Iran and Mesopotamia from the Seleucids during the second century BCE. The last major Hellenistic kingdom, Ptolemaic Egypt, fell to Rome with the death of **Cleopatra VII** in 30 BCE.

Yet the Hellenistic world did not simply end. Greek remained the main language of the eastern Mediterranean for another thousand years, and the eastern Roman empire was, in language and culture, a Greek state. Hellenistic science and philosophy were preserved and developed in Arabic in the Islamic world and later recovered in Latin Europe. Rome itself was profoundly shaped by the Greek culture it conquered; as the Roman poet Horace put it, captive Greece took its savage conqueror captive.

## Further exploration

- **Peter Green, *Alexander to Actium: The Historical Evolution of the Hellenistic Age* (1990).** A comprehensive history of the Hellenistic world.
- **A. B. Bosworth, *Conquest and Empire: The Reign of Alexander the Great* (1988).** A critical scholarly account of Alexander.
- **Robin Lane Fox, *Alexander the Great* (1973).** A vivid and more admiring biography.
- **Graham Shipley, *The Greek World After Alexander, 323–30 BC* (2000).** A thematic survey of the period.
- **Lucio Russo, *The Forgotten Revolution* (English trans. 2004).** A provocative argument about the scale of Hellenistic science.$alex_master$,
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
  select $alex_quiz$[
    {"type": "mcq", "prompt": "Which battle in 331 BCE decided the fate of the Achaemenid empire?", "options": ["Granicus", "Issus", "Gaugamela", "Hydaspes"], "answerIndex": 2, "explanation": "At Gaugamela in northern Iraq, Alexander decisively defeated Darius III; Babylon and Susa fell soon after.", "id": "q1"},
    {"type": "mcq", "prompt": "What were the three main successor dynasties after Alexander's death?", "options": ["Ptolemies, Seleucids, and Antigonids", "Achaemenids, Parthians, and Sasanians", "Julio-Claudians, Flavians, and Severans", "Mauryas, Guptas, and Kushans"], "answerIndex": 0, "explanation": "The Ptolemies in Egypt, the Seleucids from Anatolia to Iran, and the Antigonids in Macedon emerged from the wars of the successors.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Antikythera mechanism?", "options": ["A Roman siege engine", "A geared bronze device that modelled the movements of the sun, moon, and probably planets, and predicted eclipses", "A Greek musical instrument", "A water clock from Alexandria"], "answerIndex": 1, "explanation": "Recovered from a shipwreck and dated to the second or first century BCE, it shows remarkable mechanical sophistication.", "id": "q3"},
    {"type": "mcq", "prompt": "Which festival commemorates the outcome of the Maccabean revolt?", "options": ["Passover", "Purim", "Sukkot", "Hanukkah"], "answerIndex": 3, "explanation": "Hanukkah commemorates the rededication of the Jerusalem Temple after the revolt against the Seleucid king Antiochus IV.", "id": "q4"},
    {"type": "open", "prompt": "Assess the competing interpretations of Alexander's aims, from 'unity of mankind' to 'ruthless conqueror'. Which is better supported?", "rubric": "A strong answer sets out Tarn's visionary view and Bosworth's critical view, and uses evidence: adoption of Persian dress and ceremony, Persian satraps, the Susa weddings, proskynesis and Macedonian resistance, killings of Parmenion, Cleitus, and Callisthenes, the destruction of Thebes and Persepolis, the human cost of campaigns, and the practical problem of governing with few Macedonians. It reaches a reasoned conclusion and may note how different later traditions (Zoroastrian, Persian, Islamic, the Alexander Romance) remembered him.", "id": "q5"},
    {"type": "open", "prompt": "What made the Hellenistic world culturally distinctive? Use examples of science, philosophy, and cultural mixing.", "rubric": "A strong answer discusses koine Greek as a shared language; Alexandria's Museum and Library, the Septuagint, and scientists such as Euclid, Archimedes, Eratosthenes, Aristarchus, and Herophilus, and the Antikythera mechanism; philosophies addressing individual life (Stoicism, Epicureanism, Cynics, Sceptics); and mixing of traditions (Ptolemies as pharaohs, Isis and Serapis, Ai Khanoum, Gandharan art, Menander in the Milindapanha), with resistance such as the Maccabean revolt. It may correct myths about the Library's destruction.", "id": "q6"}
  ]$alex_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/alexander-and-the-hellenistic-world', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
