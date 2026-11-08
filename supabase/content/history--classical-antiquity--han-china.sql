-- Han China (206 BCE–220 CE) — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/han-china-206-bce-220-ce @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- From Qin to Han, the Xiongnu and Emperor Wu, Zhang Qian, the salt and
-- iron debate, the Confucian state and Han history-writing, paper and
-- technology, Wang Mang and the Eastern Han, and collapse into the Three
-- Kingdoms.
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
    'history/classical-antiquity/han-china-206-bce-220-ce',
    'research',
    'advanced',
    'read',
    $han_master$> **The Han dynasty** (206 BCE–220 CE) ruled China for four centuries, almost exactly the same period as the Roman republic's final age and the early Roman empire, and over a similar number of people. It took the harsh unified state created by Qin and made it last, by combining Qin's centralised administration with Confucian ideas of moral government. It pushed Chinese power deep into Central Asia, opening the routes later called the Silk Roads, produced the model for all later Chinese history-writing, and invented paper. Its legacy was so deep that the majority people of China still call themselves the Han. This chapter covers its founding, its wars, its state and society, the interruption of Wang Mang, and its long collapse into the Three Kingdoms.

## From Qin to Han

The Qin empire, which unified China in 221 BCE, did not survive its founder by long. After the First Emperor died in 210 BCE, rebellions broke out, beginning in 209 BCE with a revolt by two conscript officers, Chen Sheng and Wu Guang, who were facing execution for arriving late to their posts because of rain. Qin collapsed in 206 BCE, and two rebel leaders fought for control: **Xiang Yu**, an aristocratic general, and **Liu Bang**, a former minor official of peasant origin. Liu Bang won in 202 BCE and founded the Han dynasty, becoming Emperor Gaozu, with his capital at Chang'an, near modern Xi'an.

The Han kept much of the Qin system, including the division of the empire into commanderies administered by appointed officials, the standard script, and centralised taxation and conscription, while softening Qin's notoriously harsh laws. At first Liu Bang also granted large kingdoms to relatives and allies, but over the following century the emperors reduced their power, especially after a failed rebellion of seven kingdoms in 154 BCE.

Historians divide the dynasty into two halves: the **Western Han** (206 BCE–9 CE), ruled from Chang'an, and, after an interruption, the **Eastern Han** (25–220 CE), ruled from Luoyang further east.

## The Xiongnu and Emperor Wu

The Han's greatest external challenge came from the **Xiongnu**, a confederation of nomadic peoples of the Mongolian steppe, united under a ruler called the *chanyu*. Mobile horse archers, the Xiongnu could raid Chinese territory and retreat into the steppe before Chinese armies could respond. In 200 BCE Liu Bang himself was surrounded by Xiongnu forces at Baideng and barely escaped. The Han then adopted a policy known as *heqin*, "peace through kinship": Han princesses were sent as brides to the chanyu, together with regular gifts of silk, grain, and wine, in return for peace. Critics saw it as tribute paid to barbarians.

**Emperor Wu** (Han Wudi, reigned 141–87 BCE), one of the longest-reigning and most forceful rulers in Chinese history, abandoned this policy. His generals, notably Wei Qing and Huo Qubing, launched massive campaigns into the steppe and drove the Xiongnu back. The Han took the **Hexi Corridor**, the narrow strip of land between mountains and desert in modern Gansu, and extended its defensive walls and garrisons westward to Dunhuang.

To find allies against the Xiongnu, Emperor Wu sent the envoy **Zhang Qian** west in 138 BCE. Zhang Qian was captured by the Xiongnu and held for about ten years, during which he married and had a son, before escaping and continuing west to Ferghana, Sogdiana, and Bactria. He failed to secure an alliance, but returned with detailed reports of the kingdoms of Central Asia and of the powerful "heavenly horses" of Ferghana. Emperor Wu later sent armies to Ferghana, in a costly campaign around 104–101 BCE, to obtain these horses. Zhang Qian's journeys are traditionally seen as the opening of the **Silk Roads**, the subject of the next chapter.

Emperor Wu also expanded south, conquering the kingdom of Nanyue in modern Guangdong and northern Vietnam in 111 BCE, and northeast into the Korean peninsula in 108 BCE. These wars were extremely expensive. To pay for them, his government established **state monopolies on salt and iron** in 117 BCE, along with other measures to control trade and prices. In 81 BCE, after his death, officials and Confucian scholars debated these policies at court in the **Debate on Salt and Iron**, recorded in a famous text: the officials defended state control as necessary for defence and stability, while the scholars argued that the state should not compete with the people for profit and should govern by moral example. The debate over the proper economic role of the state continued throughout Chinese history.

```checkpoint
q: What was the heqin policy toward the Xiongnu?
a*: Sending Han princesses as brides to the Xiongnu ruler, with regular gifts, in exchange for peace.
a: A series of military campaigns into the steppe.
x: That describes Emperor Wu's later policy, which replaced heqin.
a: Building the Great Wall to keep the Xiongnu out entirely.
x: Walls were part of Han defence, but heqin was a diplomatic policy of marriage and gifts.
a: Converting the Xiongnu to Confucianism.
x: Heqin was a diplomatic arrangement, not a missionary policy.
hint: The term means "peace through kinship".
why: Heqin used marriage alliances and gifts to buy peace from a militarily powerful nomadic confederation, a policy critics saw as humiliating tribute.
---
q: Why did Emperor Wu establish state monopolies on salt and iron?
a: To make salt and iron free for all peasants.
x: The monopolies raised revenue for the state; they did not make goods free.
a: Because Confucian scholars demanded it.
x: Confucian scholars criticised the monopolies in the Debate on Salt and Iron.
a*: To raise revenue for his expensive military campaigns and to strengthen state control over key resources.
a: Because the Xiongnu controlled all salt and iron mines.
x: The monopolies concerned production within the Han empire, not Xiongnu resources.
hint: What did the wars against the Xiongnu cost?
why: The monopolies financed expansion and asserted state economic power, prompting a lasting debate about the proper role of the state.
```

## The Confucian State

Qin had ruled through Legalist principles. The Han gradually made **Confucianism** the official ideology of the state, though in practice they combined it with Legalist methods of administration and law, a mixture sometimes summed up as "Confucian on the outside, Legalist on the inside".

Under Emperor Wu, the scholar **Dong Zhongshu** developed a Confucian theory of the cosmos in which the emperor, as the Son of Heaven, linked Heaven, Earth, and humanity, and in which natural disasters and strange events signalled Heaven's disapproval of bad government. In 124 BCE an **Imperial Academy** (*Taixue*) was founded to train future officials in the **Five Classics**, a group of texts associated with Confucius. Officials were recruited partly through recommendation of men of good character and learning by local officials, and partly through examination of candidates. This was not yet the full civil service examination system of later dynasties, which developed under the Sui and Tang, but it established the ideal that government should be run by men educated in the Confucian classics, chosen for merit and virtue. At its height, the Academy had tens of thousands of students.

Han history-writing also set the pattern for later centuries. **Sima Qian**'s *Records of the Grand Historian*, discussed in the chapters *What is History?* and *Ancient China*, was completed under Emperor Wu. Under the Eastern Han, **Ban Gu** wrote the *Book of Han*, the first history devoted to a single dynasty, a model followed by official historians for the next two thousand years. It was completed after his death by his sister **Ban Zhao**, one of the most learned women of ancient China, who also wrote *Lessons for Women*, a guide to female conduct emphasising humility and obedience to husbands, and also arguing that girls should be educated.

```checkpoint
q: What does the phrase "Confucian on the outside, Legalist on the inside" mean for the Han state?
a: That the Han openly rejected Confucianism.
x: The Han made Confucianism the official ideology; the phrase describes how it was combined with Legalist practice.
a*: That the Han presented themselves through Confucian ideology while keeping Legalist methods of centralised administration and law.
a: That Confucian scholars ruled the provinces and Legalists ruled the capital.
x: The phrase describes a combination of ideology and method, not a geographical division.
a: That Legalism was banned and Confucianism enforced by law.
x: Legalist methods remained central to Han administration.
hint: Compare Han ideology with Han administration.
why: The Han legitimised their rule through Confucian values while governing with the efficient administrative tools inherited from Qin.
---
q: How did Han recruitment of officials differ from the later Chinese examination system?
a: The Han used no education or merit at all.
x: The Han emphasised education in the classics and recommendation for virtue and learning.
a: The Han system was identical to the later examination system.
x: The full competitive examination system developed later, under the Sui and Tang.
a: The Han chose officials only from the imperial family.
x: Officials were recruited from a wider educated class, not only the imperial family.
a*: The Han relied largely on recommendation by officials, with some examination, rather than a full competitive examination system, though they established the ideal of officials educated in the classics.
hint: The full examination system belongs to later dynasties.
why: The Han laid the ideological foundations of meritocratic government, which later dynasties formalised in competitive examinations.
```

## An Inventive and Populous Empire

A census taken in 2 CE recorded about 57.7 million people, one of the earliest and most detailed censuses in the world, comparable to the population of the Roman empire at the same time. Most people were peasant farmers who paid taxes in grain and cloth and owed labour and military service to the state.

The Han period was technologically inventive:

- **Paper.** Tradition credits the court official **Cai Lun** with inventing paper in 105 CE, but archaeologists have found fragments of paper, including one with a drawn map, dating from the second century BCE. Cai Lun probably improved and standardised a process that already existed, using bark, hemp, rags, and fishing nets. Paper, cheaper than silk and lighter than bamboo strips, eventually transformed writing across the world; it reached the Islamic world in the eighth century and Europe centuries later.
- **Iron.** Chinese ironworkers produced cast iron in large quantities, making ploughs, tools, and weapons, using blast furnaces powered in some cases by water wheels.
- **Science and engineering.** In 132 CE the scholar **Zhang Heng** built a seismoscope, a bronze vessel designed to indicate the direction of a distant earthquake. Han China also used the wheelbarrow, the horse collar, and improved methods of farming.

Han tombs reveal everyday life and belief in vivid detail. At **Mawangdui**, near Changsha, the tomb of the Lady Dai, who died around 168 BCE, contained her remarkably preserved body, silk garments, lacquerware, food, and a library of texts on silk, including early versions of the *Daodejing* and medical works.

## Wang Mang and the Eastern Han

By the end of the first century BCE, the Western Han court was weakened by weak emperors and powerful consort families, the relatives of empresses. In 9 CE **Wang Mang**, a member of one such family who had acted as regent, took the throne for himself and declared a new dynasty, the Xin ("New"). Wang Mang attempted radical reforms inspired by ancient texts: nationalising land and redistributing it, banning the sale of slaves, and reforming the currency. The reforms were resisted by landowners and poorly implemented. Disaster followed: the Yellow River changed its course, causing floods and famine across the northern plain, and rebels known as the **Red Eyebrows**, who painted their foreheads, rose up. Wang Mang was killed in 23 CE.

Liu Xiu, a member of the Han imperial clan, restored the dynasty in 25 CE as Emperor Guangwu, with a new capital at Luoyang, beginning the **Eastern Han**. The Eastern Han reasserted Chinese power in Central Asia, where the general **Ban Chao**, brother of Ban Gu and Ban Zhao, campaigned for decades. In 97 CE he sent an envoy, **Gan Ying**, to reach the Roman empire, known to the Chinese as Daqin. Gan Ying reached the Persian Gulf but turned back, reportedly because Parthian sailors told him the sea journey would take years, perhaps to protect their profits as middlemen. In 166 CE, Chinese sources record the arrival of an embassy from "Andun", king of Daqin, probably a group of merchants claiming to represent the emperor Marcus Aurelius (Marcus Aurelius Antoninus). Buddhism also began to reach China under the Eastern Han, carried by merchants and missionaries from Central Asia.

```checkpoint
q: Why did Wang Mang's reforms fail?
a: Because they were too cautious and changed nothing.
x: Wang Mang's reforms were radical, including land nationalisation and a ban on selling slaves.
a: Because the Xiongnu conquered China.
x: The Xiongnu did not conquer China; the main problems were internal and environmental.
a*: Because powerful landowners resisted them, they were badly implemented, and a catastrophic Yellow River flood and the Red Eyebrows rebellion followed.
a: Because Confucian scholars refused to serve him.
x: Wang Mang drew heavily on Confucian ideals; his failure came from resistance, implementation, and disaster.
hint: Think about who opposed land reform, and what happened to the Yellow River.
why: Radical reforms threatened powerful interests, and environmental catastrophe turned discontent into rebellion.
---
q: What does the story of Gan Ying suggest about contact between Han China and Rome?
a*: That the two empires knew of each other but contact was largely indirect, with Parthian middlemen having an interest in keeping them apart.
a: That Han and Roman officials met regularly.
x: Direct contact was rare and indirect; Gan Ying turned back before reaching Rome.
a: That Rome conquered parts of China.
x: Rome never reached China; contact was mainly through intermediaries.
a: That China and Rome had no knowledge of each other at all.
x: Chinese sources describe Daqin, and Roman sources mention the Seres, the silk people, so each knew something of the other.
hint: Who profited from trade between them?
why: Gan Ying's journey and the 166 CE embassy show awareness and occasional indirect contact, shaped by intermediaries in Parthia.
```

## Decline and the Three Kingdoms

The Eastern Han court was weakened by fierce struggles between three groups: the **consort families** of empresses, the court **eunuchs**, who served the emperor personally and often controlled young or weak rulers, and the Confucian scholar-officials. In 166 and 169 CE, eunuchs persecuted their scholar opponents in the "Partisan Prohibitions", purging hundreds of officials. Meanwhile, powerful landowning families accumulated estates and dependent peasants, reducing the state's tax base, and many peasants fell into debt and hardship.

In 184 CE a religious movement called the Way of Great Peace, led by **Zhang Jue**, launched the **Yellow Turban Rebellion**, so named for the yellow headcloths its followers wore, promising a new age of peace. The rebellion was suppressed, but the generals and regional warlords who crushed it became the real powers in China. In 189 CE the warlord Dong Zhuo seized the capital. Over the following decades, warlords such as **Cao Cao** fought for control. In 220 CE Cao Cao's son Cao Pi forced the last Han emperor to abdicate, ending the dynasty.

China then split into the **Three Kingdoms** of Wei, Shu, and Wu. Their wars were later romanticised in the fourteenth-century novel *Romance of the Three Kingdoms*, one of the most beloved works of Chinese literature. China would not be lastingly reunified until the Sui dynasty in 589, more than three and a half centuries later. Yet unlike the western Roman empire, it was reunified, and the ideal of a single Chinese state, which the Han had made seem natural, never disappeared.

The Han left a name. The majority ethnic group of China calls itself the **Han** people (*Hanren*), Chinese characters are *hanzi*, "Han characters", and the Chinese language itself is *Hanyu*, "the Han language". Few dynasties in any civilization have so completely become the name of a people.

```checkpoint
q: What was the main consequence of the Yellow Turban Rebellion for the Han dynasty?
a: It overthrew the Han immediately and founded a new dynasty.
x: The rebellion was suppressed; the Han lasted until 220 CE.
a: It made Buddhism the official religion of China.
x: The Yellow Turbans followed a Daoist-influenced movement, and Buddhism did not become the state religion.
a: It ended the influence of the court eunuchs permanently.
x: The rebellion's main effect was to empower military commanders, not to settle court politics.
a*: The generals and warlords who suppressed it became the real powers in China, leading to the dynasty's breakdown and the Three Kingdoms.
hint: Who gained power by crushing the rebellion?
why: Suppressing the rebellion shifted power from the court to regional military commanders, who eventually ended the dynasty.
---
q: Why is it significant that the majority people of China call themselves "Han"?
a: Because the Han dynasty was founded by a foreign people.
x: The Han dynasty was founded by Liu Bang, a Chinese commoner; the significance concerns identity.
a*: Because it shows how deeply the Han dynasty shaped Chinese identity, so much that its name became the name of the people and their script.
a: Because it shows that China was never divided after the Han.
x: China was divided for more than three centuries after the Han.
a: Because the name was imposed by the Qin dynasty.
x: The Qin preceded the Han; the name comes from the Han dynasty.
hint: Think about "Hanren" and "hanzi".
why: The Han made the unified empire and its culture seem natural, and its name became the name of Chinese identity itself.
```

## Further exploration

- **Michael Loewe, *The Government of the Qin and Han Empires, 221 BCE–220 CE* (2006).** A concise account of how the early empire was governed.
- **Mark Edward Lewis, *The Early Chinese Empires: Qin and Han* (2007).** A thematic history of the period.
- **Burton Watson (trans.), *Records of the Grand Historian: Han Dynasty* (revised ed., 1993).** Sima Qian's account of the early Han.
- **Nicola Di Cosmo, *Ancient China and Its Enemies* (2002).** The Xiongnu and the steppe frontier.
- **Walter Scheidel (ed.), *Rome and China* (2009).** Comparative essays on the two empires.$han_master$,
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
  select $han_quiz$[
    {"type": "mcq", "prompt": "Who founded the Han dynasty?", "options": ["Liu Bang, a former minor official of peasant origin", "Ying Zheng, the First Emperor", "Wang Mang", "Cao Cao"], "answerIndex": 0, "explanation": "Liu Bang defeated Xiang Yu in 202 BCE and became Emperor Gaozu.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the purpose of Zhang Qian's mission in 138 BCE?", "options": ["To buy silk from Rome", "To convert India to Confucianism", "To negotiate with the Parthians for elephants", "To find allies in Central Asia against the Xiongnu"], "answerIndex": 3, "explanation": "Zhang Qian failed to secure an alliance but brought back knowledge of Central Asia that helped open the Silk Roads.", "id": "q2"},
    {"type": "mcq", "prompt": "What was debated in the Debate on Salt and Iron of 81 BCE?", "options": ["Whether to invade Korea", "Whether the state should hold monopolies on salt and iron, or govern by moral example and leave profit to the people", "Whether to adopt Buddhism", "Whether to move the capital to Luoyang"], "answerIndex": 1, "explanation": "Officials defended state control for defence; Confucian scholars argued the state should not compete with the people for profit.", "id": "q3"},
    {"type": "mcq", "prompt": "What ended the Han dynasty in 220 CE?", "options": ["A Xiongnu invasion", "A Roman invasion", "Cao Cao's son Cao Pi forcing the last emperor to abdicate, after decades of warlord power following the Yellow Turban Rebellion", "Wang Mang's usurpation"], "answerIndex": 2, "explanation": "Warlords who had suppressed the Yellow Turbans became the real power; the dynasty's end led to the Three Kingdoms.", "id": "q4"},
    {"type": "open", "prompt": "How did the Han make the unified empire created by Qin last?", "rubric": "A strong answer explains continuity with Qin (commanderies, standard script, central taxation) combined with softer laws and Confucian ideology; reduction of the kingdoms after 154 BCE; Dong Zhongshu and the Imperial Academy; recruitment by recommendation and examination; 'Confucian on the outside, Legalist on the inside'; Emperor Wu's expansion and its costs, the salt and iron monopolies and their debate. Better answers compare the Han's durability with Qin's rapid collapse.", "id": "q5"},
    {"type": "open", "prompt": "Compare the end of the Han dynasty with the end of the western Roman empire. What was similar, and what was different?", "rubric": "A strong answer identifies similarities (court instability, powerful landowners eroding the tax base, rebellions, generals and warlords taking power, pressure from frontier peoples, division into rival states) and differences (China's eventual reunification under the Sui in 589 versus the west's permanent fragmentation; the persistence of a unified ideal, shared script, and Confucian elite culture in China; the name 'Han' becoming Chinese identity). It reaches a reasoned conclusion about why China reunified.", "id": "q6"}
  ]$han_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/han-china-206-bce-220-ce', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
