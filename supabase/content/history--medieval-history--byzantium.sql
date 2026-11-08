-- Byzantium: the Empire of New Rome — canonical master article, co-written and human-reviewed.
-- history/medieval-history/europe-and-byzantium/byzantium-the-empire-of-new-rome @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- New Rome, Justinian and the Nika riot, seventh-century survival and
-- Greek fire, an empire of Romans (Kaldellis), iconoclasm, the Macedonian
-- revival, Cyril and Methodius and the Rus', the schism, decline and the
-- fall of 1453, and legacies.
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
    'history/medieval-history/europe-and-byzantium/byzantium-the-empire-of-new-rome',
    'research',
    'advanced',
    'read',
    $byz_master$> **Byzantium** is a name modern historians gave to the eastern Roman empire, which survived the fall of the west in the fifth century and lasted until the Ottoman conquest of Constantinople in 1453. Its people never called themselves Byzantines. They called themselves *Romaioi*, Romans, and their state the empire of the Romans; western Europeans, from the ninth century, called them Greeks. For more than a thousand years this empire, ruled from the city Constantine founded as New Rome, preserved Roman law and Greek learning, defended itself against Persians, Arabs, Bulgars, Turks, and crusaders, and spread Orthodox Christianity to the Slavic world. This chapter follows that long history and its legacies.

## New Rome

In 330 CE Constantine dedicated **Constantinople**, built on the site of the Greek city of Byzantium, on the strait of the Bosporus where Europe meets Asia. The site was superb: water on three sides, a deep natural harbour called the Golden Horn, and control of the route between the Black Sea and the Mediterranean. In the early fifth century the emperor Theodosius II built the **Theodosian Walls**, a triple line of fortifications across the landward side, which resisted every attacker for eight centuries.

The city was an argument in stone that it was the new Rome. It had a senate, a forum, and a **Hippodrome**, a huge stadium for chariot races, which was also the place where emperor and people met. Racing fans were organised into rival factions, the Blues and Greens, which were also political forces. At the centre of the city's religious life stood **Hagia Sophia**, "Holy Wisdom", rebuilt by Justinian and completed in 537, its vast dome seeming, as the historian Procopius wrote, to hang from heaven. When envoys of Prince Vladimir of Kiev attended a service there in the tenth century, according to the Russian *Primary Chronicle*, they reported that they did not know whether they were in heaven or on earth.

## Justinian's Ambitions

**Justinian** (reigned 527–565) sought to restore the Roman empire's former greatness. His generals, above all **Belisarius**, reconquered North Africa from the Vandals in 533, Italy from the Ostrogoths after a long, destructive war, and part of southern Spain. His lawyers compiled the **Corpus Iuris Civilis**, which preserved Roman law, as the chapter on Rome described.

Early in his reign, in 532, the Blues and Greens united against the government in the **Nika riot**, named after their cry *Nika!*, "Conquer!", burned much of the city, and proclaimed a rival emperor. According to Procopius, Justinian was ready to flee, until his wife, the empress **Theodora**, a former actress of humble origins, declared that she would rather die an empress, since "royalty is a good burial shroud". Belisarius's troops trapped the rioters in the Hippodrome and, according to Procopius, killed some 30,000 of them.

Justinian's reign was also struck by catastrophe. From 541 the first great outbreak of bubonic plague, the **Plague of Justinian**, spread across the Mediterranean, killing a large share of the population of Constantinople and recurring for two centuries. Ancient DNA has confirmed that it was caused by *Yersinia pestis*, the same bacterium as the later Black Death.

## Survival in the Seventh Century

The seventh century nearly destroyed the empire. A devastating war with Sasanian Persia from 602 to 628 saw the Persians take Syria, Jerusalem, and Egypt and besiege Constantinople in 626, before the emperor **Heraclius** won a stunning counter-attack. Within a decade, Arab armies inspired by Islam took Syria, Palestine, and Egypt, the empire's richest provinces, and later North Africa. Arab fleets and armies besieged Constantinople in 674–678 and again in 717–718.

The city held, thanks to its walls, its navy, and a secret weapon: **Greek fire**, an incendiary liquid, probably petroleum-based, that could be sprayed from ships and burned even on water. Its exact recipe was a state secret and is still unknown. The empire that survived was smaller, poorer, more rural, and more militarised, reorganised into military districts called themes, and centred on Anatolia, the Balkans, and the city itself. It was also more thoroughly Greek-speaking and Christian. Historians often date the shift from "late Roman" to "Byzantine" to this period of survival.

```checkpoint
q: What does the Nika riot reveal about politics in Constantinople?
a*: That the Hippodrome factions were political forces, able to unite against the emperor and nearly topple Justinian.
a: That the people of Constantinople had no political voice.
x: The riot shows the opposite: the racing factions were powerful political forces able to challenge the emperor.
a: That the empire was ruled by the Senate rather than the emperor.
x: Justinian held supreme power; the riot was a challenge to it, not a sign of senatorial rule.
a: That chariot racing was banned in the sixth century.
x: Chariot racing continued; the riot began at the races.
hint: Think about the Blues and Greens.
why: The Hippodrome was where emperor and people met, and the factions' power shows that the "people of the Romans" remained a political force.
---
q: How did Constantinople survive the Arab sieges of the seventh and eighth centuries?
a: By surrendering and paying tribute.
x: The city did not surrender; it resisted successfully.
a: Because the Arabs never reached the city.
x: Arab forces besieged Constantinople in 674–678 and 717–718.
a*: Through its massive walls, its navy, and Greek fire, an incendiary weapon that burned even on water.
a: Because the Franks sent an army to defend it.
x: There was no Frankish relief army; the city defended itself.
hint: Consider fortifications, ships, and a secret weapon.
why: Defensive advantages and naval technology allowed the city to outlast attackers and preserve the empire.
```

## An Empire of Romans

What kind of state was Byzantium? Older western historians, influenced by Gibbon, portrayed it as a decadent, rigid theocracy, all palace intrigue and religious hair-splitting; the word "byzantine" still means needlessly complicated or devious in English. Modern historians reject this caricature.

The historian **Anthony Kaldellis** has argued that Byzantium should be understood as a continuation of the Roman *res publica*, the "republic" of the Romans. Emperors held enormous power and were presented as God's chosen rulers, but their legitimacy also depended on the acceptance of the people, the army, and the senate, and unpopular emperors were regularly overthrown, often violently, by revolts in the city or the army. There was no fixed law of succession: an emperor was whoever could win and hold that acceptance. Political ideology combined Roman law, Christian kingship, and Greek learning.

Byzantine society was highly literate by medieval standards, with a salaried bureaucracy, schools, and a gold coin, the solidus, or *nomisma*, that remained stable for some seven centuries and was used far beyond the empire. Women of the imperial family could hold great power: the empress **Irene** ruled alone as emperor from 797 to 802, and the princess **Anna Komnene** wrote the *Alexiad*, a history of her father's reign and one of the few major historical works by a medieval woman.

## Iconoclasm

The empire's greatest internal struggle was over religious images, **icons**. In the eighth century, emperors, beginning probably with Leo III in the 720s or 730s, banned the veneration of images of Christ and the saints, arguing that it was idolatry, a view perhaps sharpened by the military disasters of the period and by contact with Islam and Judaism, which rejected religious images. Supporters of icons, especially monks, argued that because God had become human in Christ, Christ could be depicted, and that honour paid to an image passed to its subject. This conflict is called **iconoclasm**, "image-breaking".

The images were restored in 787, banned again in 815, and finally restored in 843, an event still celebrated by the Orthodox Church as the Triumph of Orthodoxy. Historians now think the destruction of images was less extensive than later pro-icon sources claimed, since those sources were written by the winners.

## Revival, the Slavs, and the Schism

From the ninth century the empire recovered. Under the **Macedonian dynasty** (867–1056), it reconquered territory in the east and in the Balkans. The emperor **Basil II** (reigned 976–1025) destroyed the Bulgarian empire after decades of war; according to a later chronicler, after his victory at Kleidion in 1014 he blinded 15,000 prisoners, leaving one eye to one man in every hundred to lead the rest home, a story that earned him the name "Bulgar-slayer" but whose numbers are probably exaggerated.

Byzantium's most lasting influence was on the Slavic peoples. In 863 two brothers from Thessalonica, the missionaries **Cyril** and **Methodius**, were sent to Moravia; they created an alphabet, Glagolitic, to translate scripture into Slavonic. Their followers developed the **Cyrillic** alphabet, named after Cyril, which is used today for Russian, Ukrainian, Bulgarian, Serbian, and other languages. In 988 Prince **Vladimir** of Kiev converted to Christianity in its Byzantine form and married the emperor's sister, bringing the Rus' into what historians call the Byzantine commonwealth of Orthodox Christian peoples.

Relations with the Latin West deteriorated. Disputes over the authority of the pope, the wording of the Creed, and church practices led to mutual excommunications between the papal legates and the patriarch of Constantinople in 1054, often taken as the date of the **schism** between the Catholic and Orthodox churches, though the split deepened gradually and was made bitter above all by the Fourth Crusade.

```checkpoint
q: Why was the iconoclast controversy so intense?
a: Because emperors wanted to sell icons to raise money.
x: The controversy was religious and political, not about selling icons.
a*: Because it raised fundamental questions about whether depicting Christ and the saints was idolatry or a legitimate consequence of God becoming human.
a: Because the pope ordered all icons destroyed.
x: The controversy began with Byzantine emperors, and the papacy generally supported icons.
a: Because icons were introduced only in the eighth century.
x: Icons had long been venerated; the dispute concerned whether to allow them.
hint: What did the defenders of icons argue about Christ's humanity?
why: Iconoclasm touched the core of Christian belief about the incarnation, as well as imperial authority, which is why it divided the empire for over a century.
---
q: What was the lasting significance of Cyril and Methodius?
a: They converted the Arabs to Christianity.
x: Their mission was to the Slavs of Moravia.
a: They founded the papacy.
x: The papacy is far older; they were missionaries from Byzantium.
a: They led the Fourth Crusade.
x: They lived in the ninth century, long before the crusades.
a*: Their mission to the Slavs led to the creation of Slavonic scripts, including Cyrillic, still used for many Slavic languages.
hint: Which alphabet is named after one of them?
why: Byzantine missions gave the Slavic world its scripts and its Orthodox Christianity, a cultural legacy that endures today.
```

## Decline and Fall

In 1071 the Seljuk Turks defeated a Byzantine army at **Manzikert** in eastern Anatolia and captured the emperor. Turkish groups spread into Anatolia, the empire's heartland. The emperor **Alexios I Komnenos** appealed to the west for military help, one of the triggers of the First Crusade, as the next chapter describes, and the Komnenian emperors partly restored Byzantine power in the twelfth century.

The decisive blow came from fellow Christians. In 1204 the army of the **Fourth Crusade**, diverted from its goal of Egypt by debts to Venice and by a Byzantine claimant's promises, sacked Constantinople. Crusaders looted the city's churches and palaces; many of the bronze horses and treasures in Venice today came from Constantinople. A Latin empire ruled the city until 1261, when the Byzantine emperor Michael VIII Palaiologos recovered it. But the restored empire was a shadow of its former self, squeezed between Venetians, Serbians, Bulgarians, and the rising power of the **Ottoman** Turks, who took most of its remaining territory in the fourteenth century.

On 29 May 1453, after a siege of nearly two months, the Ottoman sultan **Mehmed II** took Constantinople, using huge cannon to batter the Theodosian Walls. The last emperor, **Constantine XI Palaiologos**, died in the fighting. Mehmed made the city his capital, and Hagia Sophia became a mosque.

## Legacies

Byzantium shaped the worlds that came after it. **Orthodox Christianity** remained the faith of Greeks, Slavs, Romanians, Georgians, and others. In Russia, after 1453, some writers called Moscow the "Third Rome", successor to Rome and Constantinople, and Russian rulers took the title tsar, from "Caesar". Byzantine scholars, such as Manuel Chrysoloras, who began teaching Greek in Florence in 1397, and the many Greeks who fled the Ottoman advance, brought Greek manuscripts and learning to Italy, contributing to the Renaissance. Byzantine administration, court ceremony, and art influenced the Ottoman and Islamic worlds as well. And the Ottoman sultans themselves, ruling from Constantinople, claimed the title of "Caesar of Rome".

## Further exploration

- **Judith Herrin, *Byzantium: The Surprising Life of a Medieval Empire* (2007).** An accessible, thematic introduction.
- **Anthony Kaldellis, *The New Roman Empire: A History of Byzantium* (2023).** A comprehensive narrative history from a leading revisionist.
- **Anthony Kaldellis, *Romanland: Ethnicity and Empire in Byzantium* (2019).** On Byzantine Roman identity.
- **Averil Cameron, *Byzantine Matters* (2014).** A short reflection on why Byzantium matters.
- **Roger Crowley, *1453: The Holy War for Constantinople* (2005).** A narrative of the fall of Constantinople.$byz_master$,
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
  select $byz_quiz$[
    {"type": "mcq", "prompt": "What did the people historians call 'Byzantines' call themselves?", "options": ["Greeks", "Byzantines", "Romans (Romaioi)", "Franks"], "answerIndex": 2, "explanation": "'Byzantine' is a modern label; the empire's people saw themselves as Romans to the end.", "id": "q1"},
    {"type": "mcq", "prompt": "What was Greek fire?", "options": ["A Byzantine festival", "A type of Greek pottery", "The fire that destroyed Constantinople in 1204", "An incendiary liquid, probably petroleum-based, sprayed from ships and burning even on water"], "answerIndex": 3, "explanation": "Greek fire helped Constantinople survive the Arab sieges of 674–678 and 717–718; its recipe remains unknown.", "id": "q2"},
    {"type": "mcq", "prompt": "Which alphabet, still used for Russian and other languages, is named after a Byzantine missionary?", "options": ["Cyrillic", "Latin", "Glagolitic", "Ge'ez"], "answerIndex": 0, "explanation": "Followers of Cyril and Methodius developed Cyrillic, named after Cyril, which spread with Orthodox Christianity.", "id": "q3"},
    {"type": "mcq", "prompt": "Who took Constantinople in 1453?", "options": ["The Fourth Crusade", "The Seljuk Turks", "The Arabs", "The Ottoman sultan Mehmed II"], "answerIndex": 3, "explanation": "Mehmed II's siege, using large cannon against the Theodosian Walls, ended the Roman empire in the east.", "id": "q4"},
    {"type": "open", "prompt": "Why do modern historians reject the image of Byzantium as a decadent, rigid theocracy?", "rubric": "A strong answer explains the origin of the caricature (Gibbon, western prejudice, the pejorative 'byzantine') and presents counter-evidence: survival for over a thousand years through the seventh-century crisis; Kaldellis's argument for a Roman republic in which emperors depended on popular, army, and senate acceptance; literacy, salaried bureaucracy, stable gold coinage; powerful women such as Theodora, Irene, and Anna Komnene; and cultural achievements and influence on the Slavs, Russia, the Renaissance, and the Ottomans.", "id": "q5"},
    {"type": "open", "prompt": "Explain how the Byzantine empire survived the seventh century and why it nonetheless fell in 1453.", "rubric": "A strong answer explains the crises of the seventh century (the Persian war of 602–628, the Arab conquests of Syria, Egypt, and North Africa, the sieges of Constantinople) and the reasons for survival (walls, navy, Greek fire, reorganisation into themes, a smaller but more cohesive state). It then explains decline: Manzikert and Turkish settlement of Anatolia, the 1204 sack by the Fourth Crusade, the weakened Palaiologan state, Ottoman expansion, and Mehmed II's siege with cannon.", "id": "q6"}
  ]$byz_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/europe-and-byzantium/byzantium-the-empire-of-new-rome', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
