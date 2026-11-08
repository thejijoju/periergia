-- Early Medieval Europe — canonical master article, co-written and human-reviewed.
-- history/medieval-history/europe-and-byzantium/early-medieval-europe @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The successor kingdoms, Justinian, monks and missionaries, the
-- Carolingians and Charlemagne, Vikings, Magyars and Saracens, and why
-- historians reject the 'Dark Ages'.
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
    'history/medieval-history/europe-and-byzantium/early-medieval-europe',
    'research',
    'advanced',
    'read',
    $earlyeu_master$> **Early medieval Europe**, from the end of Roman rule in the west in the late fifth century to about 1000 CE, was long called the "Dark Ages". It is true that Western Europe in these centuries was poorer, less urban, and less literate than the Roman world before it, or than the Byzantine and Islamic worlds around it. But it was also the period in which new kingdoms took shape, Christianity spread across the continent, monks preserved and copied ancient learning, and Charlemagne built an empire whose legacy shaped Europe for a thousand years. This chapter follows the successor kingdoms, the role of the Church, the Carolingians, and the raiders who reshaped Europe around the year 900, and explains why historians now reject the label "Dark Ages".

## The Successor Kingdoms

As Roman government in the west collapsed in the fifth century, as the chapter on the fall of Rome described, its provinces came under the rule of kings whose followers had entered the empire as allies, settlers, or invaders:

- **The Visigoths** ruled southern Gaul and then Spain, from Toledo, until the Arab conquest of 711.
- **The Ostrogoths** under **Theodoric** (ruled 493–526) ruled Italy, preserving much of Roman administration and employing Roman senators. One of them, the philosopher **Boethius**, wrote *The Consolation of Philosophy* while awaiting execution on Theodoric's orders in 524; it became one of the most widely read books of the Middle Ages.
- **The Vandals** ruled North Africa from Carthage until 533.
- **The Franks** in northern Gaul were united under **Clovis** (ruled about 481–511), whose dynasty is called the **Merovingians**. Unlike most other Germanic rulers, who followed the Arian form of Christianity, regarded as heretical by most Roman Christians, Clovis converted to Catholic Christianity, which won him the support of the Gallo-Roman bishops and population.
- **The Anglo-Saxons**, from northern Germany and Denmark, settled in eastern Britain from the fifth century, forming a number of kingdoms. The ship burial at **Sutton Hoo** in East Anglia, from around 625 and excavated in 1939, revealed a king buried with gold, weapons, and silver from Byzantium, showing long-distance connections even in this "dark" age.
- **The Lombards** invaded Italy in 568 and ruled much of it for two centuries.

These kingdoms mixed Roman and Germanic traditions. Kings issued written law codes, in Latin, combining Roman law with customary law; Latin remained the language of the Church and of writing; and the populations of Roman provinces, far more numerous than the newcomers, gradually merged with them. The languages of France, Spain, and Italy descend from the Latin spoken in these provinces.

In the east, the Roman empire continued. The emperor **Justinian** (reigned 527–565) reconquered North Africa, Italy, and southern Spain, codified Roman law, and built the great church of **Hagia Sophia** in Constantinople, completed in 537. But the long Gothic War in Italy (535–554) devastated the peninsula, and the plague of 541 struck the whole Mediterranean. The story of the eastern empire continues in the chapter on Byzantium.

{{image: Sutton Hoo helmet | The helmet from the Sutton Hoo ship burial in East Anglia, about 625 CE, part of a royal burial that included silver from the eastern Roman empire.}}

```checkpoint
q: Why was Clovis's conversion to Catholic Christianity politically important?
a*: Because most other Germanic rulers were Arian Christians, and Catholic conversion won Clovis the support of the Gallo-Roman bishops and population.
a: Because it made him the first Christian king in history.
x: Earlier rulers, including Roman emperors and other kings, were Christian. Clovis's choice mattered because of which form of Christianity he chose.
a: Because it allowed him to conquer Constantinople.
x: The Franks never conquered Constantinople; Clovis's power was in Gaul.
a: Because it ended all contact between the Franks and Rome.
x: Catholic conversion strengthened ties with the Roman Church rather than ending them.
hint: Think about the religion of the people Clovis ruled.
why: Sharing the faith of his Roman subjects and their bishops gave Clovis legitimacy and support that Arian rulers lacked.
---
q: What does the Sutton Hoo burial show about early medieval England?
a: That England was completely cut off from the rest of the world.
x: Silver from Byzantium in the burial shows long-distance connections.
a: That the Anglo-Saxons had no kings.
x: The burial is that of a king, most likely Rædwald of East Anglia.
a*: That Anglo-Saxon kings were wealthy and connected to distant regions, including the eastern Roman empire.
a: That Vikings had already settled in England by 625.
x: Viking raids on England began in the late eighth century, long after Sutton Hoo.
hint: Where did the silver come from?
why: The burial's wealth and imported objects challenge the image of an isolated, impoverished "Dark Age".
```

## Monks, Missionaries, and the Church

The Christian Church was the most important institution linking the successor kingdoms. Bishops, usually from Roman aristocratic families, led cities and often acted as their governors. The bishop of Rome, the **pope**, gradually claimed leadership of the western Church.

**Monasticism**, which had begun in the deserts of Egypt and Syria, spread across the west. Around 530 **Benedict of Nursia** wrote a *Rule* for his monastery at Monte Cassino in Italy, setting out a balanced life of prayer, work, and study under an abbot, which became the model for western monasteries. Monasteries became centres of learning, farming, and copying manuscripts, and later of great wealth.

Ireland, never part of the Roman empire, became a centre of monastic Christianity after its conversion, traditionally credited to **Patrick** in the fifth century. Irish monks such as **Columba**, who founded a monastery on the island of **Iona** in 563, and **Columbanus**, who founded monasteries in France, Switzerland, and Italy, travelled as missionaries. In 597 Pope **Gregory the Great** sent a mission led by Augustine to convert the Anglo-Saxon kingdom of Kent. The monk **Bede**, writing in Northumbria, completed his *Ecclesiastical History of the English People* in 731, a major work of history that popularised dating events from the birth of Christ. Anglo-Saxon missionaries, such as **Boniface**, in turn converted much of Germany; Boniface was killed in Frisia in 754.

## The Carolingians and Charlemagne

By the seventh century the Merovingian kings had lost much of their power to their chief officials, the **mayors of the palace**. One mayor, **Charles Martel**, defeated an Arab raiding army near Tours (or Poitiers) in 732, a battle later mythologised as having saved Christian Europe, though most historians now see it as one of many raids rather than a decisive turning point. His son **Pippin III** deposed the last Merovingian king in 751 with the approval of the pope and became king himself, founding the **Carolingian** dynasty.

Pippin's son **Charlemagne** (Charles the Great, ruled 768–814) built the largest state in Western Europe since Rome. He conquered the Lombard kingdom of Italy in 774, fought the pagan Saxons for three decades, forcing their conversion with great brutality (the Frankish annals record the execution of 4,500 Saxons at Verden in 782), and destroyed the Avar khaganate in central Europe. On Christmas Day 800, in St Peter's in Rome, **Pope Leo III** crowned Charlemagne emperor. The coronation revived the title of emperor in the west for the first time since 476, offended the emperors in Constantinople, and set up a long-running question about whether popes made emperors or emperors protected popes. Charlemagne even exchanged embassies with the Abbasid caliph Harun al-Rashid, who sent him an elephant named Abul-Abbas.

Charlemagne governed through counts, checked by royal envoys called *missi dominici*, and through annual assemblies. He also sponsored a revival of learning known as the **Carolingian Renaissance**, led by scholars such as **Alcuin of York**. Scribes developed a clear new script, **Carolingian minuscule**, the ancestor of the lower-case letters used in this text. Carolingian monasteries copied ancient texts on a huge scale; most of the classical Latin literature that survives today survives because it was copied in this period.

Carolingian unity did not last. By Frankish custom, the kingdom was divided among heirs, and after civil war Charlemagne's grandsons divided the empire by the **Treaty of Verdun** in 843 into a western kingdom (the ancestor of France), an eastern kingdom (the ancestor of Germany), and a middle kingdom stretching from the Low Countries to Italy, which soon fragmented. The border between French- and German-speaking lands, and centuries of conflict over the lands in between, can be traced back to this division.

{{image: Charlemagne | A ninth-century equestrian statuette believed to represent Charlemagne or his grandson Charles the Bald.}}

```checkpoint
q: Why was Charlemagne's coronation as emperor in 800 controversial?
a: Because Charlemagne refused to accept the title.
x: Charlemagne accepted the title; the controversy lay in its implications.
a*: Because it revived the western imperial title, offending the emperors in Constantinople, and raised the question of whether popes made emperors.
a: Because it was performed in Constantinople by the patriarch.
x: The coronation took place in St Peter's in Rome, by Pope Leo III.
a: Because Charlemagne was not a Christian.
x: Charlemagne was a Christian ruler who forcibly converted the Saxons.
hint: Who else claimed to be the Roman emperor in 800?
why: The coronation challenged Byzantine claims and created a lasting question about the relationship between papal and imperial power.
---
q: Why is the Carolingian Renaissance important for knowledge of classical literature?
a: Because Carolingian scholars wrote all the classical texts themselves.
x: The classical texts were written in antiquity; the Carolingians copied them.
a: Because it introduced Greek as the language of western learning.
x: Latin remained the language of western learning; the Carolingian revival focused on Latin texts.
a: Because it destroyed pagan texts, leaving only Christian ones.
x: Carolingian scribes preserved many pagan classical texts.
a*: Because Carolingian monasteries copied ancient texts on a large scale, and most surviving classical Latin literature survives through these copies.
hint: Where do the oldest manuscripts of many Latin authors come from?
why: Mass copying in a new clear script preserved much of Latin literature for later generations.
```

## Vikings, Magyars, and Saracens

In the ninth and tenth centuries, Europe faced attacks from several directions. From the north came the **Vikings**, Scandinavian seafarers whose shallow-draught longships could cross the sea and sail up rivers. Their first famous raid was on the monastery of **Lindisfarne** in Northumbria in 793. Over the following century, Vikings raided and traded across Europe, besieged Paris in 845, and settled in large parts of England, where the area under their control became known as the **Danelaw**. In 911 the Frankish king granted land around Rouen to the Viking leader Rollo, creating **Normandy**.

Vikings were not only raiders. They were also traders and settlers, who sold slaves and furs, founded towns such as Dublin and York, settled Iceland from around 870 and Greenland in the late tenth century, and reached North America: the settlement at **L'Anse aux Meadows** in Newfoundland has been dated, using tree rings that record a burst of solar radiation, to 1021. In the east, Scandinavian traders and warriors known as **Varangians** or Rus' travelled down the rivers of Russia and Ukraine to Constantinople and Baghdad, and helped found the state of **Kievan Rus'**.

From the east came the **Magyars**, horse-riding nomads who settled in the Hungarian plain and raided deep into Germany, Italy, and France until the German king **Otto I** defeated them at the **Lechfeld** in 955. Otto was crowned emperor in Rome in 962, beginning what was later called the Holy Roman Empire. From the south, Muslim raiders, whom Europeans called Saracens, attacked the coasts of Italy and southern France and in 846 sacked the outskirts of Rome. By around 1000, the Magyars and Scandinavians had largely converted to Christianity, and new Christian kingdoms, such as Hungary, Poland, Denmark, and Norway, had joined Latin Europe.

## Why Not "Dark Ages"?

The term "Dark Ages" goes back to the Italian poet **Petrarch** in the fourteenth century, who contrasted the darkness of the centuries after Rome with the light of classical antiquity. Later Protestant and Enlightenment writers added the idea of an age darkened by superstition and Church authority.

Historians now reject the label for several reasons. It is too broad: the Byzantine and Islamic worlds flourished in these centuries. It ignores real achievements in the west, such as the copying of classical texts, monastic learning, law codes, and art such as the illuminated *Book of Kells*. And much of the "darkness" reflects the scarcity of sources rather than an absence of activity.

Historians do not deny that Western Europe went through real decline. Archaeology shows that trade, towns, coinage, and building in stone declined sharply in many regions after the end of Roman rule, as the chapter on the fall of Rome discussed. The Belgian historian **Henri Pirenne** argued in *Mohammed and Charlemagne* (1937) that the decisive break came not with the Germanic kingdoms but with the Arab conquests, which, he believed, closed the Mediterranean to trade and forced Europe to turn inward: "without Mohammed, Charlemagne would be inconceivable". His thesis has been heavily criticised and revised, notably by Michael McCormick, who used a wide range of evidence to show that trade between Europe and the Islamic world continued, including, grimly, a large trade in enslaved Europeans sold to Muslim lands. But Pirenne's question, how Western Europe's place in the wider world changed in these centuries, remains central.

```checkpoint
q: Which statement best describes the Vikings?
a: They were only raiders and never settled or traded.
x: The Vikings were also traders and settlers, founding towns and settlements from Dublin to Iceland and Greenland.
a: They never reached North America.
x: The Norse settlement at L'Anse aux Meadows in Newfoundland is dated to 1021.
a*: They raided, traded, and settled across a vast area, from Dublin and Normandy to Kievan Rus' and Newfoundland.
a: They were Christian missionaries from Scandinavia.
x: Most Vikings were pagans during the raiding period; Scandinavia converted around the end of the first millennium.
hint: Think of Dublin, Normandy, Iceland, and L'Anse aux Meadows.
why: The Vikings were a diverse seafaring culture whose raids, trade, and settlement reshaped much of Europe and beyond.
---
q: What was Henri Pirenne's thesis?
a*: That the Arab conquests, by breaking Mediterranean unity, rather than the Germanic kingdoms, marked the real break between antiquity and the Middle Ages.
a: That the fall of Rome was caused by the Vikings.
x: Pirenne focused on the Arab conquests, centuries before the Vikings.
a: That the early Middle Ages were a time of great prosperity in the west.
x: Pirenne accepted that the west declined; his thesis concerned the cause.
a: That Charlemagne conquered the Islamic world.
x: Charlemagne fought on the Spanish frontier but never conquered the Islamic world.
hint: "Without Mohammed, Charlemagne would be inconceivable."
why: Pirenne shifted attention from the Germanic invasions to the Islamic world, and though his thesis has been revised, his question remains central.
```

## Further exploration

- **Chris Wickham, *The Inheritance of Rome: A History of Europe from 400 to 1000* (2009).** The authoritative modern history of the period.
- **Peter Brown, *The Rise of Western Christendom* (3rd ed., 2013).** Christianity in the early medieval world.
- **Rosamond McKitterick, *Charlemagne: The Formation of a European Identity* (2008).** A scholarly study of Charlemagne.
- **Neil Price, *The Children of Ash and Elm: A History of the Vikings* (2020).** A comprehensive modern account of the Vikings.
- **Michael McCormick, *Origins of the European Economy* (2001).** Communications and commerce in the early medieval Mediterranean.$earlyeu_master$,
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
  select $earlyeu_quiz$[
    {"type": "mcq", "prompt": "What did Pope Leo III do on Christmas Day 800?", "options": ["Excommunicated Charlemagne", "Crowned Charlemagne emperor in St Peter's, Rome", "Called the First Crusade", "Moved the papacy to Avignon"], "answerIndex": 1, "explanation": "The coronation revived the western imperial title and raised lasting questions about papal and imperial power.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Treaty of Verdun (843) do?", "options": ["Divided the Carolingian empire into western, eastern, and middle kingdoms among Charlemagne's grandsons", "Ended the Viking raids", "United England", "Created the Holy Roman Empire"], "answerIndex": 0, "explanation": "The division foreshadowed France and Germany and the contested lands between them.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is Carolingian minuscule significant?", "options": ["It was a secret code used by monks", "It replaced Latin with Greek", "It was the script of the Vikings", "It is the ancestor of modern lower-case letters and helped preserve classical texts in a clear script"], "answerIndex": 3, "explanation": "Developed under the Carolingians, this clear script carried much of classical Latin literature to later ages.", "id": "q3"},
    {"type": "mcq", "prompt": "Where is the Norse settlement dated by tree rings to 1021 CE?", "options": ["Dublin", "Normandy", "L'Anse aux Meadows, Newfoundland", "Iceland"], "answerIndex": 2, "explanation": "Tree rings recording a burst of solar radiation dated wood cut by the Norse at this North American site to 1021.", "id": "q4"},
    {"type": "open", "prompt": "Should historians call early medieval Europe the 'Dark Ages'? Argue using evidence from the chapter.", "rubric": "A strong answer explains Petrarch's origin of the term and later Protestant and Enlightenment uses; evidence against it (Byzantine and Islamic flourishing, monastic learning, Carolingian copying of classical texts, Sutton Hoo's connections, law codes, art such as the Book of Kells, scarcity of sources); and evidence of real decline (archaeology of trade, towns, coinage). It may discuss Pirenne's thesis and McCormick's revision, and reaches a reasoned conclusion.", "id": "q5"},
    {"type": "open", "prompt": "How did the Church shape the successor kingdoms of early medieval Europe?", "rubric": "A strong answer discusses bishops as leaders of cities, the papacy's growing claims, Clovis's Catholic conversion, Benedictine monasticism, Irish and Anglo-Saxon missionaries (Columba, Columbanus, Augustine of Canterbury, Bede, Boniface), the forced conversion of the Saxons, the papal role in the Carolingian accession and Charlemagne's coronation, and monasteries as centres of learning and copying.", "id": "q6"}
  ]$earlyeu_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/europe-and-byzantium/early-medieval-europe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
