-- The Crusades — canonical master article, co-written and human-reviewed.
-- history/medieval-history/europe-and-byzantium/the-crusades @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Clermont and motives, the First Crusade and the Rhineland massacres,
-- Saladin and the Third Crusade, the Fourth Crusade and after, the
-- military orders and wider crusading, and consequences and memory.
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
    'history/medieval-history/europe-and-byzantium/the-crusades',
    'research',
    'advanced',
    'read',
    $crusades_master$> **The Crusades** were a series of holy wars, called by popes from 1095 onwards, in which Latin Christians fought to conquer or defend Jerusalem and the Holy Land, and later to fight Muslims in Spain, pagans in the Baltic, and heretics and political enemies in Europe itself. They established Latin states in the Levant for two centuries, sacked the Christian city of Constantinople, and left a long and contested shadow over relations between Christians, Muslims, and Jews. This chapter explains why the crusades began, follows the main expeditions from Clermont to the fall of Acre in 1291, describes the wider crusading movement, and examines how the crusades have been remembered.

## The Call at Clermont

In November 1095, at a church council at **Clermont** in central France, **Pope Urban II** preached a sermon calling on Christians to go east, help their fellow Christians of the Byzantine empire against the Seljuk Turks, and free Jerusalem, which had been under Muslim rule since the 630s. According to one chronicler, the crowd responded with the cry *Deus vult*, "God wills it". Those who took the vow sewed a cloth cross onto their clothes, and the movement later took its name from the Latin *crux*, "cross".

Several forces combined to make the appeal so powerful:

- **Byzantine appeals.** The emperor Alexios I Komnenos, facing the Seljuk advance after the defeat at Manzikert in 1071, had asked the pope for western mercenaries.
- **Papal ambitions.** The reforming papacy, fresh from its struggles with the German emperor, sought to lead Latin Christendom and perhaps to heal the schism with the Orthodox Church.
- **Religious motivation.** Urban offered participants the remission of penance for their sins, a powerful promise to warriors anxious about salvation. Jerusalem, the site of Christ's death and resurrection, held an immense place in the Christian imagination.
- **Social and economic factors.** Older historians stressed land-hungry younger sons and adventurers seeking wealth. The historian **Jonathan Riley-Smith**, studying the records of individual crusaders, showed that crusading was enormously expensive, that charters show many crusaders selling or mortgaging property to go, and that very few made any profit; for most, piety rather than profit was the main motive, though motives were always mixed.

## The First Crusade

Before the main armies set out, popular bands, the so-called **People's Crusade**, led by preachers such as Peter the Hermit, marched east in 1096. Some of these groups, and some crusading forces, massacred Jewish communities in the cities of the Rhineland, such as Speyer, Worms, and Mainz, regarding them as enemies of Christ closer to home. These **Rhineland massacres** were the first large-scale massacres of Jews in Latin Christian Europe, and they are remembered in Jewish chronicles and liturgy.

The main armies of knights, led by great lords from France, Normandy, Flanders, and southern Italy, travelled to Constantinople and crossed into Anatolia in 1097. Helped by divisions among Muslim rulers, they took Nicaea, besieged and captured Antioch after terrible suffering in 1098, and reached Jerusalem. On 15 July 1099 they stormed the city and massacred many of its Muslim and Jewish inhabitants; modern estimates put the dead at 3,000–10,000. Christian chroniclers described the slaughter in triumphant terms; the Muslim historian Ibn al-Athir, writing later, recorded it as a catastrophe.

The crusaders established four **crusader states**: the County of Edessa, the Principality of Antioch, the County of Tripoli, and the Kingdom of Jerusalem. Their Latin rulers, often called Franks by the local population, were a small minority ruling over Muslims, Eastern Christians, and Jews, and they depended on a constant flow of new crusaders and on the support of Italian maritime cities such as Venice, Genoa, and Pisa.

```checkpoint
q: What did Jonathan Riley-Smith's research suggest about the motives of crusaders?
a*: That crusading was costly, many crusaders sold or mortgaged property to go, and religious motivation was usually central, though motives were mixed.
a: That most crusaders went to get rich from plunder.
x: Riley-Smith's work showed that crusading was very expensive and that very few crusaders profited from it.
a: That crusaders were forced to go by the pope.
x: Crusading was voluntary, undertaken by taking a vow.
a: That crusaders were mainly peasants seeking land.
x: The main crusading armies were led by nobles and knights, though popular bands also went.
hint: Look at what crusaders did with their property before leaving.
why: Records of individual crusaders revealed the costs of crusading, undermining purely materialist explanations.
---
q: What were the Rhineland massacres of 1096?
a: Attacks by Muslim forces on crusader camps.
x: The Rhineland massacres took place in Germany, against Jewish communities.
a: The killing of crusaders by the Byzantine army.
x: Relations with Byzantium were tense but this was not the Rhineland massacres.
a*: The killing of Jewish communities in Rhineland cities by crusading groups, who regarded Jews as enemies of Christ.
a: A Viking raid on the Rhineland.
x: The Viking age was largely over by 1096, and the massacres were carried out by crusaders.
hint: Who lived in Speyer, Worms, and Mainz?
why: The crusade's religious fervour turned violently against Jews in Europe, beginning a pattern of persecution linked to crusading.
```

## Saladin and the Third Crusade

Muslim rulers gradually united against the crusader states. In 1144 **Zengi**, ruler of Mosul and Aleppo, captured Edessa. The **Second Crusade** (1147–1149), led by the kings of France and Germany, failed miserably at Damascus. Zengi's son Nur al-Din promoted the idea of *jihad* against the Franks and united Syria.

The decisive figure was **Saladin** (Salah al-Din), a Kurdish commander who made himself ruler of Egypt and Syria. On 4 July 1187 he destroyed the army of the Kingdom of Jerusalem at the **Horns of Hattin** near the Sea of Galilee, and in October he took Jerusalem itself. Unlike the crusaders in 1099, he took the city by negotiated surrender: Franks who could pay a ransom were allowed to leave, Eastern Christians could stay, but thousands who could not pay were enslaved.

The fall of Jerusalem launched the **Third Crusade** (1189–1192), led by three of Europe's most powerful rulers: the emperor Frederick Barbarossa, who drowned in a river in Anatolia on the way; King Philip II of France; and King **Richard I** of England, known as the Lionheart. The crusaders recaptured the port city of **Acre** in 1191, after which Richard had about 2,700 Muslim prisoners executed when ransom negotiations stalled. Richard won victories but could not take Jerusalem. In 1192 he and Saladin agreed the **Treaty of Jaffa**, which left Jerusalem in Muslim hands but allowed Christian pilgrims to visit. Saladin became a model of chivalry in later European legend, and a hero of Muslim and Arab resistance in modern memory.

## The Fourth Crusade and After

The **Fourth Crusade** (1202–1204) never reached the Holy Land. Its leaders contracted with **Venice** for a fleet to carry them to Egypt, but too few crusaders arrived to pay. To settle the debt, the crusaders first attacked the Christian city of Zara on the Adriatic for Venice, and then agreed to support a Byzantine prince's claim to the throne in Constantinople in exchange for money and troops. When the promises were not kept, the crusaders stormed and sacked **Constantinople** in April 1204, as the chapter on Byzantium described. The pope condemned the attack, but the damage was done: the sack deepened the hostility between Latin and Orthodox Christians for centuries.

Later crusades to the east had mixed results. The emperor **Frederick II**, excommunicated at the time, recovered Jerusalem in 1229 not by war but by a treaty with the sultan of Egypt; the city was lost again in 1244. King **Louis IX** of France led two crusades and was captured in Egypt in 1250. In the second half of the thirteenth century the **Mamluk** sultans of Egypt, who had defeated the Mongols, as the chapter on the Mongol empire describes, took the crusader cities one by one. In 1291 **Acre**, the last major crusader stronghold, fell.

## Military Orders and the Wider Crusading World

The crusades produced a new kind of institution, the **military orders**: communities of knights who took monastic vows of poverty, chastity, and obedience but fought as soldiers. The **Templars**, founded around 1120 to protect pilgrims, became rich and powerful, with estates and a banking network across Europe. In 1307 King Philip IV of France, who owed them money, had the Templars arrested on charges of heresy and immorality; under pressure, the pope dissolved the order in 1312. The **Hospitallers**, originally caring for sick pilgrims, survived by moving to Rhodes and later Malta. The **Teutonic Knights** turned to the Baltic.

Crusading spread beyond the Holy Land:

- **The Reconquista** in the Iberian peninsula, where Christian kingdoms fought the Muslim states of al-Andalus, was given crusading status. A decisive Christian victory came at **Las Navas de Tolosa** in 1212, and the last Muslim kingdom, Granada, fell in 1492.
- **The Baltic crusades** led by the Teutonic Knights and others conquered and forcibly converted the pagan peoples of Prussia and Livonia, and fought Lithuania, the last pagan state in Europe.
- **Crusades against heretics and political enemies** within Europe included the **Albigensian Crusade** (1209–1229) against the Cathars of southern France, a brutal war that also extended the French crown's power. At the sack of Béziers in 1209, a papal legate was later reported to have said, "Kill them all; God will know his own", a remark recorded some ten years later by the German monk Caesarius of Heisterbach and of uncertain authenticity, but expressive of the war's ferocity. Popes also proclaimed crusades against Christian political opponents, such as the Hohenstaufen emperors.

```checkpoint
q: Why did the Fourth Crusade end by sacking Constantinople?
a: Because the pope ordered the crusaders to destroy the Byzantine empire.
x: The pope condemned the attack on Constantinople; it was not papal policy.
a*: Because the crusaders were in debt to Venice and became entangled in a Byzantine succession dispute, and when promised payments failed, they stormed the city.
a: Because Constantinople had been captured by Muslims.
x: Constantinople was a Christian city in 1204; it fell to the Ottomans only in 1453.
a: Because the crusaders were trying to reach Jerusalem by land through the city.
x: The crusade was meant to go to Egypt by sea; the diversion arose from debt and politics.
hint: Who built the fleet, and who paid for it?
why: Debt to Venice and Byzantine dynastic politics diverted the crusade into an attack on a Christian city, with lasting consequences for Latin-Orthodox relations.
---
q: What made the military orders such as the Templars unusual?
a: They were armies of mercenaries paid by Muslim rulers.
x: The military orders were Christian institutions fighting for the crusader states.
a: They were orders of women who cared for pilgrims.
x: The major military orders were male fighting orders, though some had female branches.
a: They were founded by the Byzantine emperor.
x: They were founded in the Latin crusader states and supported by the papacy.
a*: Their members took monastic vows of poverty, chastity, and obedience while also serving as soldiers.
hint: Think of monk and knight combined.
why: The military orders fused religious life with warfare, a new institution born of the crusading movement.
```

## Consequences and Memory

The crusades had complex consequences. They intensified trade between Europe and the eastern Mediterranean, enriching Venice and Genoa. They deepened hostility between Latin and Orthodox Christians. They were associated with recurring violence against Jews in Europe. And they contributed to the growth of papal taxation and the idea of holy war in Latin Christianity.

For Muslim contemporaries, the crusades were for a long time seen as one series of Frankish invasions among many threats, and a less serious one than the Mongols. The historian **Carole Hillenbrand** has shown how Muslim sources viewed them, and Amin Maalouf's *The Crusades Through Arab Eyes* (1983) brought those perspectives to a wide audience. Interest in the crusades in the Arab and Muslim world revived in the nineteenth and twentieth centuries, with European colonialism, when European writers and politicians themselves sometimes described imperial ventures as new crusades.

The crusades remain politically charged. After the attacks of 11 September 2001, the American president's description of the response as a "crusade" was widely criticised for its connotations in the Muslim world, while jihadist propaganda describes Western powers as "crusaders", and some far-right movements in the West use crusading imagery. Historians increasingly stress that the crusades were complex, varied, and specific to their medieval context, and that both romantic and simplistic modern uses distort them.

```checkpoint
q: How did Muslim contemporaries generally view the crusades, according to historians such as Carole Hillenbrand?
a: As the single greatest threat the Islamic world ever faced.
x: Contemporaries generally considered the Mongols a far greater threat.
a: As a welcome alliance against the Byzantines.
x: The crusades were seen as invasions, not alliances.
a*: As one series of Frankish invasions among many threats, generally less serious than the Mongols, with interest reviving much later in the colonial era.
a: As a purely religious debate with no military dimension.
x: The crusades were wars, and Muslim sources describe them as such.
hint: Who invaded the Middle East from the east in the thirteenth century?
why: Muslim sources place the crusades within a wider context of threats, a perspective that challenges Eurocentric accounts.
---
q: Why do historians caution against modern uses of crusading imagery?
a*: Because both romantic and simplistic modern uses distort a complex, varied medieval phenomenon for contemporary political purposes.
a: Because the crusades never happened.
x: The crusades are extremely well documented; the problem is how they are used today.
a: Because only Muslims remember the crusades.
x: Crusading imagery is used by many groups, in both the West and the Muslim world.
a: Because the crusades had no consequences.
x: The crusades had major consequences for trade, religious relations, and violence against Jews.
hint: Consider "crusade" in political speeches and propaganda.
why: Modern political uses flatten the crusades into a clash of civilisations, ignoring their medieval complexity.
```

## Further exploration

- **Thomas Asbridge, *The Crusades: The War for the Holy Land* (2010).** A comprehensive narrative from both Christian and Muslim perspectives.
- **Jonathan Riley-Smith, *The Crusades: A History* (3rd ed., 2014).** A standard scholarly history emphasising religious motivation.
- **Carole Hillenbrand, *The Crusades: Islamic Perspectives* (1999).** The crusades as seen in Muslim sources.
- **Amin Maalouf, *The Crusades Through Arab Eyes* (1983; English translation 1984).** A vivid narrative drawing on Arab chroniclers.
- **Christopher Tyerman, *God's War: A New History of the Crusades* (2006).** A detailed scholarly account of the whole crusading movement.$crusades_master$,
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
  select $crusades_quiz$[
    {"type": "mcq", "prompt": "Who called the First Crusade at Clermont in 1095?", "options": ["Pope Gregory VII", "Pope Urban II", "Emperor Alexios I", "Richard the Lionheart"], "answerIndex": 1, "explanation": "Urban II offered remission of penance to those who went east to aid Byzantium and free Jerusalem.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened at the Horns of Hattin in 1187?", "options": ["Saladin destroyed the army of the Kingdom of Jerusalem, leading to the fall of the city", "The crusaders took Jerusalem", "The Templars were founded", "Richard I and Saladin signed a treaty"], "answerIndex": 0, "explanation": "Saladin's victory led to his capture of Jerusalem in October 1187 and to the Third Crusade.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Frederick II recover Jerusalem in 1229?", "options": ["By a great battle", "By bribing the Templars", "By alliance with the Mongols", "By treaty with the sultan of Egypt"], "answerIndex": 3, "explanation": "Frederick, excommunicated at the time, recovered the city through negotiation; it was lost again in 1244.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these was NOT part of the wider crusading movement?", "options": ["The Reconquista in Iberia", "The Baltic crusades", "The Albigensian Crusade against the Cathars", "The Mongol conquest of Baghdad"], "answerIndex": 3, "explanation": "The Mongol sack of Baghdad in 1258 was not a crusade; the other three were given crusading status by the papacy.", "id": "q4"},
    {"type": "open", "prompt": "What motivated people to go on crusade? Assess religious and material explanations.", "rubric": "A strong answer explains Urban II's appeal and the remission of penance, the significance of Jerusalem, Byzantine appeals, and papal ambitions, as well as older materialist explanations (land-hungry younger sons, plunder). It uses Riley-Smith's evidence (crusaders selling or mortgaging property, returning poorer) to argue that piety was usually central, while recognising mixed motives and the role of Italian commercial interests, especially in the Fourth Crusade.", "id": "q5"},
    {"type": "open", "prompt": "How have the crusades been remembered, and why do historians warn against modern political uses of them?", "rubric": "A strong answer discusses medieval Muslim views (one threat among many, less than the Mongols; Hillenbrand; Maalouf), the colonial-era revival of interest, Saladin's dual legacy, Jewish memory of the Rhineland massacres, Orthodox memory of 1204, and modern political uses (the 2001 'crusade' remark, jihadist propaganda, far-right imagery). It explains how such uses flatten a complex medieval phenomenon into a clash of civilisations.", "id": "q6"}
  ]$crusades_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/europe-and-byzantium/the-crusades', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
