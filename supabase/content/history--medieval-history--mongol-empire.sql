-- The Mongol Empire — canonical master article, co-written and human-reviewed.
-- history/medieval-history/across-afro-eurasia/the-mongol-empire @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Temüjin and 1206, the Mongol army, the conquests from Zhongdu to
-- Baghdad and Ain Jalut, the four khanates, the Pax Mongolica and its
-- travellers, religious policy and women's power, and destruction and
-- legacy.
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
    'history/medieval-history/across-afro-eurasia/the-mongol-empire',
    'research',
    'advanced',
    'read',
    $mongols_master$> **The Mongol empire**, created by Chinggis Khan and his successors in the thirteenth century, was the largest contiguous land empire in history, stretching at its height from Korea to Hungary and from Siberia to the Persian Gulf. It was built by a nomadic people numbering perhaps a million, and its conquests killed millions. It also, for a few generations, connected Eurasia as never before, making it possible for merchants, missionaries, and envoys to travel from China to Europe. This chapter follows Temüjin's rise, the Mongol army and its conquests, the four successor khanates, the Pax Mongolica and its travellers, Mongol rule and religious policy, and the empire's long legacy.

## Temüjin Becomes Chinggis Khan

The Mongols were one of many nomadic peoples of the eastern steppe, living by herding horses, sheep, goats, and camels, moving with the seasons, and organised into clans and tribes that frequently fought each other. Most of what is known of Chinggis Khan's early life comes from *The Secret History of the Mongols*, a Mongol chronicle written in the thirteenth century, which mixes history and legend.

**Temüjin** was born around 1162. When he was a boy, his father, a minor chief, was poisoned by enemies, and his family was abandoned by their followers and lived in poverty. Temüjin survived captivity and rivalry, built alliances, and through a mixture of military skill, loyalty to followers, and ruthlessness toward enemies, united the Mongol and Turkic tribes of the steppe. In **1206**, at a great assembly, a *kurultai*, he was proclaimed **Chinggis Khan**, usually understood to mean "universal" or "fierce" ruler. (The name is often spelled Genghis.)

Chinggis reorganised steppe society for war. He broke up the old tribes and mixed their members into military units organised on a **decimal system**: units of ten, a hundred, a thousand, and ten thousand men, commanded by officers he chose largely for loyalty and ability rather than birth. He created an elite guard and issued laws and decrees, later called the *Yasa*.

## The Mongol War Machine

The Mongol army was made up almost entirely of mounted archers. Each warrior had several horses, allowing armies to move great distances fast. Mongol soldiers were superb riders and archers, trained from childhood through hunting, and the army used sophisticated tactics: feigned retreats to draw enemies into ambushes, coordinated movements of separate columns, and intelligence gathered by spies and merchants. When the Mongols needed to take walled cities, they recruited Chinese and Persian engineers to build siege engines and catapults.

The Mongols also used terror deliberately. Cities that surrendered were often spared, though required to pay tribute and provide soldiers; cities that resisted were frequently destroyed and their populations massacred, sparing only craftsmen and others the Mongols found useful. Reports of these massacres spread ahead of the armies and encouraged surrender.

## The Conquests

Chinggis Khan's armies first attacked the Tangut kingdom of Xi Xia and the Jurchen Jin dynasty of northern China, taking the Jin capital at Zhongdu, modern Beijing, in 1215. In 1218 the Khwarazmian empire, which ruled Iran and Central Asia, killed a Mongol trade caravan and envoys at Otrar. Chinggis's revenge was devastating. Between 1219 and 1221 Mongol armies destroyed the Khwarazmian empire and sacked great cities of Central Asia and Iran, such as Bukhara, Samarkand, Merv, and Nishapur, with enormous slaughter. Chinggis died in 1227.

His successors continued the expansion. Under his son **Ögedei** (reigned 1229–1241), who built a capital at **Karakorum** in Mongolia, the Mongols destroyed the Jin in 1234. A great western campaign led by Chinggis's grandson **Batu** and the general **Subutai** conquered the steppe north of the Black Sea and the principalities of the Rus', sacking Kiev in 1240, and in 1241 defeated Polish and German knights at Legnica and a Hungarian army at Mohi. Then, in 1242, the Mongols withdrew. Traditionally this is attributed to news of Ögedei's death, which required the princes to return for the election of a new khan; other factors, such as the lack of grazing for horses in Hungary, may also have played a part.

Under **Möngke** (reigned 1251–1259), his brother **Hülegü** led an army into the Middle East, destroyed the Ismaili fortresses of Alamut, and in 1258 **sacked Baghdad**, killing the last Abbasid caliph and perhaps hundreds of thousands of its inhabitants, as the chapter on the rise of Islam described. In 1260, however, the **Mamluks** of Egypt defeated a Mongol army at **Ain Jalut** in Palestine, halting the Mongol advance in the Middle East.

Another brother, **Khubilai**, completed the conquest of China. He proclaimed the **Yuan** dynasty in 1271, built a new capital at Dadu, modern Beijing, and destroyed the Southern Song by 1279, as the chapter on Tang and Song China described. His invasions of Japan, Vietnam, and Java failed.

```checkpoint
q: How did Chinggis Khan reorganise Mongol society for war?
a*: By breaking up the old tribes and mixing their members into decimal military units commanded by officers chosen largely for loyalty and ability.
a: By preserving the old tribal structure and leaders.
x: Chinggis deliberately broke up the old tribes to weaken rival loyalties.
a: By recruiting a professional infantry army from China.
x: The core Mongol army was mounted archers; Chinese and Persian engineers were recruited for sieges.
a: By electing officers in annual assemblies of soldiers.
x: Officers were appointed by Chinggis, chosen largely for loyalty and ability.
hint: Think of units of ten, a hundred, a thousand, and ten thousand.
why: Replacing tribal loyalties with a merit-based military hierarchy created a cohesive and disciplined army.
---
q: Why did the Mongols withdraw from Hungary in 1242?
a: Because they were decisively defeated by European armies.
x: The Mongols had won at Legnica and Mohi; their withdrawal followed victories.
a: Because the pope converted them to Christianity.
x: The Mongol leaders were not converted; papal envoys reached them later with little success.
a*: Traditionally because news of Ögedei's death required the princes to return for the election of a new khan, possibly together with other factors such as limited grazing.
a: Because the Black Death struck their army.
x: The Black Death came more than a century later.
hint: What happened in Mongolia in late 1241?
why: Succession politics, and possibly environmental limits, shaped Mongol strategy as much as battlefield results.
```

## Four Khanates

After Möngke's death in 1259, a civil war between Khubilai and his brother Ariq Böke broke the unity of the empire. It divided into four **khanates**, ruled by descendants of Chinggis Khan:

- **The Yuan dynasty** in China and Mongolia, under Khubilai and his successors, which ruled until 1368.
- **The Ilkhanate** in Iran and Iraq, founded by Hülegü. Its rulers converted to Islam under Ghazan Khan in 1295 and patronised Persian culture; the minister **Rashid al-Din** wrote the *Compendium of Chronicles*, one of the first attempts at a history of the whole world. The Ilkhanate collapsed in 1335.
- **The Golden Horde** (the Jochid khanate) on the steppes north of the Black and Caspian seas, with its capital at Sarai on the Volga. It dominated the Rus' principalities, which paid it tribute, a period later called the "Tatar yoke", until 1480.
- **The Chagatai khanate** in Central Asia.

## The Pax Mongolica

In conquered lands, the Mongols needed to govern, collect taxes, and extract wealth, and they relied heavily on local administrators, Persian, Chinese, Uyghur, and others. They protected trade, which enriched them. A network of relay stations, the *yam*, provided horses and supplies for official messengers and travellers, who carried metal passes called *paiza*. Historians speak of a **Pax Mongolica**, a Mongol peace, in which travel across Eurasia was safer than ever before, though the peace was relative and the khanates often fought each other.

This peace brought a remarkable series of travellers:

- **John of Plano Carpini** (1245–1247) and **William of Rubruck** (1253–1255), Franciscan friars sent by the pope and the king of France, travelled to the Mongol court and wrote detailed accounts. Rubruck described a religious debate at Karakorum between Christians, Muslims, and Buddhists, staged by the khan.
- **Marco Polo**, a Venetian merchant, travelled to China with his father and uncle and, by his account, served Khubilai Khan for years before returning in 1295. His book, written in collaboration with the romance writer Rustichello of Pisa while both were prisoners in Genoa, became hugely popular. In 1995 the historian Frances Wood asked whether Marco Polo had really gone to China, noting that he did not mention the Great Wall, tea, or foot-binding; later scholars, such as Hans Ulrich Vogel in a 2013 study of his descriptions of Yuan currency and salt production, have argued that his detailed and accurate information shows he did.
- **Rabban Sauma**, a Christian monk of the Church of the East born near Beijing, travelled west in the 1280s and, as an envoy of the Ilkhan, met the pope and the kings of France and England in 1287–1288, a journey from East to West that reversed Marco Polo's.

The Mongols were generally tolerant of religions, as long as religious leaders prayed for the khan and did not oppose Mongol rule. Christians, Muslims, Buddhists, Daoists, and others received patronage. Mongol women of the ruling family held considerable power: **Sorghaghtani Beki**, widow of Chinggis's son Tolui, secured the throne for her sons Möngke and Khubilai, and Ögedei's widow **Töregene** ruled as regent.

{{image: Mongol Empire | A map of the Mongol empire at its greatest extent in the late thirteenth century, stretching from Korea to eastern Europe.}}

```checkpoint
q: What was the Pax Mongolica?
a: A treaty ending all wars between the Mongol khanates.
x: The khanates often fought each other; the Pax Mongolica describes conditions for travel and trade.
a*: A period of relatively safe travel and trade across Eurasia under Mongol rule, supported by relay stations and passes for official travellers.
a: A Mongol religious law requiring all subjects to convert.
x: The Mongols were generally tolerant of different religions.
a: The surrender of Europe to the Mongols.
x: Western Europe was never conquered by the Mongols.
hint: Think of the yam and the paiza.
why: Mongol protection of trade and travel connected Eurasia, enabling travellers such as Marco Polo and Rabban Sauma.
---
q: Why do most historians now believe Marco Polo did travel to China, despite Frances Wood's doubts?
a: Because he mentioned the Great Wall, tea, and foot-binding in detail.
x: These were precisely the omissions Wood pointed out.
a: Because Chinese sources record his official appointments by name.
x: No Chinese source clearly names Marco Polo; the argument rests on his own detailed information.
a: Because he brought back a passport signed by Khubilai Khan that survives today.
x: No such document survives; the argument is based on the content of his account.
a*: Because his detailed and accurate information about matters such as Yuan currency and salt production could hardly have come from anyone who had not been there.
hint: Think about Hans Ulrich Vogel's study.
why: Accurate details about administration and economy, unlikely to be known secondhand, support the authenticity of his journey.
```

## Destruction and Legacy

The Mongol conquests caused immense destruction. Cities in Central Asia, Iran, and Iraq were destroyed, irrigation systems damaged, and populations massacred. In China, census figures suggest a fall from over 100 million people under the Song and Jin to around 60 million under the Yuan, though, as with the census after the An Lushan rebellion, part of this fall reflects the breakdown of registration. Modern estimates of total deaths from the conquests run to many millions, though they are very uncertain.

Mongol rule also had lasting effects. It reunified China, whose capital remained at Beijing. It shaped the rise of Moscow, which grew powerful as a collector of tribute for the Golden Horde before throwing off its control. It brought Persian, Chinese, and European worlds into contact and spread technologies and ideas, including, by some accounts, gunpowder weapons, printing, and Chinese medicine westward and Islamic astronomy eastward. The connected world it created also helped spread the **Black Death** in the fourteenth century, as the next chapter describes.

The khanates declined in the fourteenth century. The Yuan was overthrown by the Chinese **Ming** dynasty in 1368. In Central Asia, **Timur** (Tamerlane, 1336–1405), a Turkic-Mongol conqueror who claimed connection to Chinggis Khan through marriage, built a new empire, sacking Delhi in 1398 and defeating the Ottomans in 1402. His descendant **Babur** founded the Mughal empire in India in 1526. For centuries, descent from Chinggis Khan remained a source of legitimacy across Central Asia; the last ruler of Chinggisid descent was deposed in Bukhara in 1920.

Historians' assessment of the Mongols has shifted. Older accounts, written largely from the perspective of the conquered, emphasised destruction and barbarism. Since the late twentieth century, historians such as Thomas Allsen, and the popular writer Jack Weatherford, have emphasised the Mongols' role in connecting Eurasia, their administrative pragmatism, and their religious tolerance. Both destruction and connection are part of the story.

## Further exploration

- **Timothy May, *The Mongol Conquests in World History* (2012).** A concise global history of the Mongol empire.
- **David Morgan, *The Mongols* (2nd ed., 2007).** A standard scholarly introduction.
- **Jack Weatherford, *Genghis Khan and the Making of the Modern World* (2004).** A popular, sympathetic reappraisal.
- ***The Secret History of the Mongols*, trans. Urgunge Onon (2001).** The Mongols' own chronicle.
- **Marie Favereau, *The Horde: How the Mongols Changed the World* (2021).** A history centred on the Golden Horde.$mongols_master$,
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
  select $mongols_quiz$[
    {"type": "mcq", "prompt": "What happened at the kurultai of 1206?", "options": ["The Mongols converted to Islam", "The empire split into four khanates", "Temüjin was proclaimed Chinggis Khan", "Baghdad was sacked"], "answerIndex": 2, "explanation": "The great assembly recognised Temüjin as ruler of the united Mongol and Turkic tribes.", "id": "q1"},
    {"type": "mcq", "prompt": "Who halted the Mongol advance in the Middle East at Ain Jalut in 1260?", "options": ["The Mamluks of Egypt", "The crusaders", "The Byzantines", "The Delhi Sultanate"], "answerIndex": 0, "explanation": "The Mamluk victory set a limit to Mongol expansion in the Middle East.", "id": "q2"},
    {"type": "mcq", "prompt": "Which khanate dominated the Rus' principalities, who paid it tribute until 1480?", "options": ["The Ilkhanate", "The Chagatai khanate", "The Yuan", "The Golden Horde"], "answerIndex": 3, "explanation": "The Golden Horde ruled from Sarai on the Volga; Moscow grew powerful as its tribute collector.", "id": "q3"},
    {"type": "mcq", "prompt": "Who was Rabban Sauma?", "options": ["A Mongol general", "A Christian monk born near Beijing who travelled west and met the pope and the kings of France and England", "Marco Polo's father", "The founder of the Ming dynasty"], "answerIndex": 1, "explanation": "His journey from East to West in the 1280s reversed Marco Polo's and was made possible by Mongol connections.", "id": "q4"},
    {"type": "open", "prompt": "Should historians emphasise the destruction or the connections created by the Mongol empire? Argue using evidence from the chapter.", "rubric": "A strong answer weighs destruction (massacres at Merv, Nishapur, Baghdad; damaged irrigation; population decline with the caveat about census figures) against connection (the Pax Mongolica, yam and paiza, travellers such as Rubruck, Marco Polo, and Rabban Sauma, Rashid al-Din's world history, religious tolerance, transfers of technology and knowledge, the role of women such as Sorghaghtani Beki). It notes the shift in historiography (Allsen, Weatherford) and the role of the plague, and reaches a reasoned conclusion.", "id": "q5"},
    {"type": "open", "prompt": "How did a nomadic people of perhaps a million conquer the largest land empire in history?", "rubric": "A strong answer explains Chinggis Khan's reorganisation of the tribes into decimal units with officers chosen for loyalty and ability, the mobility of mounted archers with several horses, tactics such as feigned retreat, intelligence, recruitment of Chinese and Persian siege engineers, the deliberate use of terror and the sparing of cities that surrendered, the divisions among enemies, and pragmatic governance through local administrators.", "id": "q6"}
  ]$mongols_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/across-afro-eurasia/the-mongol-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
