-- Medieval Japan: Court, Samurai, and Shogun — canonical master article, co-written and human-reviewed.
-- history/medieval-history/asia/medieval-japan-court-samurai-and-shogun @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Nara and the Chinese model, the Heian court and its women writers, the
-- rise of the samurai and the Genpei War, the Kamakura shogunate and the
-- Mongol invasions, Kamakura Buddhism, and the Ashikaga to the Warring
-- States.
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
    'history/medieval-history/asia/medieval-japan-court-samurai-and-shogun',
    'research',
    'advanced',
    'read',
    $japan_master$> **Medieval Japan** shows how an island society borrowed heavily from a great neighbour and then went its own way. From the seventh century, Japanese rulers built a Chinese-style state, capital, and Buddhist culture. By the year 1000, the court in Kyoto had produced a refined aristocratic culture and, in the work of women writers such as Murasaki Shikibu, some of the world's first great novels. Over the following centuries, power passed from the court to a warrior class, the samurai, and their military governments, the shogunates, which faced Mongol invasions and eventually dissolved into a century of civil war. This chapter follows that path from Nara to the Warring States.

## Learning from China

By the sixth century CE, a confederation of clans in central Japan, the **Yamato**, had become the dominant power on the main islands. Buddhism arrived from the Korean kingdom of Baekje in the mid-sixth century (traditionally 538 or 552), along with Chinese writing, which Japanese scribes adapted to write their very different language.

In the seventh century, Japanese rulers consciously imitated Tang China. A set of principles traditionally attributed to Prince **Shōtoku** and dated to 604, the so-called Seventeen-Article Constitution, urged harmony, Buddhist devotion, and obedience to the ruler. The **Taika reforms**, begun in 645, aimed to create a centralised state on the Chinese model, with land redistributed by the government, a census, and a tax system. Japanese rulers took the title *tennō*, "heavenly sovereign", usually translated emperor, and claimed descent from the sun goddess Amaterasu.

In 710 the court built a new capital at **Nara**, laid out on a grid modelled on Chang'an. The Nara period saw the compilation of the first Japanese histories, the *Kojiki* (712) and the *Nihon shoki* (720), which wove myths of the gods together with the history of the imperial line, and a massive investment in Buddhism. At the temple of Tōdai-ji, a colossal bronze Buddha was dedicated in 752 in a ceremony in which the Indian monk Bodhisena painted in the statue's eyes. Japan sent periodic embassies to Sui and Tang China (nineteen between 607 and 839), carrying monks, students, and envoys; the last sailed in 838, and a mission planned for 894 was cancelled.

## The Heian Court and Its Writers

In 794 the capital moved to **Heian-kyō**, modern **Kyoto**, which remained the imperial capital until the court moved to Tokyo in 1868–69. The **Heian period** (794–1185) was the age of the court aristocracy. Real power at court passed to the **Fujiwara** family, who married their daughters to emperors and ruled as regents for their grandsons, and from the late eleventh century emperors who abdicated and ruled as "cloistered" retired emperors (*insei*) clawed influence back from them.

The Heian court developed a culture of extraordinary refinement, centred on poetry, calligraphy, music, incense, the colours of layered robes, and the appreciation of beauty and its transience, an aesthetic summed up in the Heian phrase *mono no aware*, "the pathos of things", which the eighteenth-century scholar Motoori Norinaga made the key to *Genji*. The development of the **kana** syllabaries, simplified forms of Chinese characters used to write Japanese sounds, made it easier to write in Japanese rather than in Chinese, which men at court were expected to use for official purposes.

Women of the court, writing in kana, produced the masterpieces of the age. **Murasaki Shikibu**, a lady-in-waiting to an empress, wrote *The Tale of Genji* in the early eleventh century, a long narrative of the loves and losses of an imperial prince and the women around him, often called the world's first novel. **Sei Shōnagon**, another lady-in-waiting, wrote *The Pillow Book*, a witty collection of lists, observations, and anecdotes of court life. These works give an unusually intimate picture of an elite world, though one that ignored almost everyone outside it.

{{image: The Tale of Genji | A twelfth-century illustrated handscroll of The Tale of Genji, written by Murasaki Shikibu in the early eleventh century.}}

```checkpoint
q: Why did women writers produce so many of the masterpieces of Heian literature?
a*: Because men were expected to write in Chinese for official purposes, while women wrote in Japanese using the kana syllabaries, the medium of the new prose literature.
a: Because men at court were not allowed to read.
x: Men at court were highly literate, but were expected to write official texts in Chinese.
a: Because the Fujiwara banned men from writing fiction.
x: There was no such ban; the pattern came from the conventions of language and genre.
a: Because Buddhism forbade men to write.
x: Many Buddhist monks wrote extensively; the pattern concerns language and genre at court.
hint: Think about which script each group used.
why: The division between Chinese for official writing and kana for Japanese prose gave women writers a central role in creating Japanese literature.
---
q: How did the Fujiwara family exercise power during the Heian period?
a: By overthrowing the emperors and ruling as kings.
x: The Fujiwara never displaced the imperial line; they controlled it from within.
a: By commanding the samurai armies directly.
x: The Fujiwara were courtiers; the rise of warrior power came later and eventually displaced them.
a*: By marrying their daughters to emperors and ruling as regents for their imperial grandsons.
a: By controlling the Buddhist monasteries only.
x: Their power came primarily from marriage politics and regency at court.
hint: Think of grandfathers and regents.
why: The Fujiwara dominated the court through kinship with the imperial family, a pattern of indirect rule that recurred in Japanese history.
```

## The Rise of the Samurai

While the court cultivated poetry, power in the provinces passed to men who could fight. Provincial landholders, estate managers, and officials organised armed bands to defend their interests, collect taxes, and suppress rebels. These mounted warriors, skilled with the bow and later the sword, became known as **samurai** or *bushi*. Two great warrior houses, the **Taira** and the **Minamoto**, both descended from branches of the imperial family, rose to power by serving the court and its factions.

In the twelfth century they came into open conflict. The Taira dominated the court for a time, but in the **Genpei War** (1180–1185), the Minamoto destroyed them, culminating in the naval battle of **Dan-no-ura** in 1185, in which the child emperor Antoku, a Taira grandson, drowned. The war became the subject of the *Tale of the Heike*, a great epic of warrior valour and Buddhist reflection on the impermanence of power.

## The Kamakura Shogunate

The victorious Minamoto leader, **Minamoto no Yoritomo**, established a military government at **Kamakura**, far from Kyoto in eastern Japan. In 1192 the emperor granted him the title of **shogun**, "barbarian-subduing generalissimo", a title that would be held by the military rulers of Japan until 1867. His government, later called the *bakufu* ("tent government"), appointed military governors and stewards across the provinces, creating a dual system in which the imperial court continued to exist in Kyoto, with prestige and ritual authority, while real power lay with the warriors.

After Yoritomo's death, power passed to the family of his widow, **Hōjō Masako**, a formidable political figure known as the "nun shogun", whose relatives ruled as regents for puppet shoguns, much as the Fujiwara had ruled for emperors.

The Kamakura shogunate faced the gravest external threat in Japanese history before the twentieth century. The Mongol ruler of China, **Khubilai Khan**, demanded Japan's submission and, when refused, sent invasion fleets in **1274** and **1281**. The fleets were built and largely crewed with the help of the Mongols' Korean vassal, Goryeo. The second fleet was traditionally said to carry some 140,000 men; modern estimates are far lower, from about 14,000 (Thomas Conlan) to about 70,000, but it was much larger than the first. Japanese warriors resisted fiercely and, in 1281, behind a stone wall built along Hakata Bay after the first attack. A typhoon devastated the second fleet; whether a storm also struck the first, perhaps only as it withdrew, is debated. Japanese believed the storms were *kamikaze*, "divine winds", sent by the gods, a belief later used in nationalist propaganda in the Second World War. Underwater archaeology off Takashima has found remains of the 1281 fleet, a mixture of ocean-going Chinese ships, Korean vessels, and flat-bottomed craft of river type, some hastily built.

The cost of defence, and the shogunate's inability to reward warriors with land from a defensive war, weakened it. In 1333 the emperor **Go-Daigo** rebelled and destroyed the Kamakura regime, briefly attempting to restore direct imperial rule.

```checkpoint
q: What was the relationship between the shogun and the emperor under the Kamakura system?
a: The shogun replaced the emperor and abolished the imperial court.
x: The imperial court continued in Kyoto; the shogunate did not abolish it.
a*: The emperor and court remained in Kyoto with prestige and ritual authority, while the shogun's military government held real power.
a: The emperor commanded the samurai, and the shogun ran religious ceremonies.
x: The roles were the reverse: the shogun controlled the military and the emperor's role was largely ceremonial.
a: The shogun was elected by the samurai each year.
x: The shogunate was hereditary in practice, and Yoritomo received the title from the emperor.
hint: Where were the court and the bakufu located?
why: Japan developed a dual system of legitimate but powerless emperors and powerful military rulers, which lasted until the Meiji Restoration of 1867–68.
---
q: How should historians interpret the "kamikaze" that wrecked the Mongol fleets?
a: As proof that the gods protected Japan.
x: Historians explain the storms naturally; the divine interpretation was a contemporary belief later used for propaganda.
a: As an invention of twentieth-century writers; there were no storms.
x: Contemporary sources and archaeology support the occurrence of a storm, certainly in 1281.
a: As a Japanese naval victory with no role for weather.
x: The storms played a major role, though Japanese defence also mattered.
a*: As real storms (certainly in 1281, possibly in 1274) that, together with Japanese resistance and, in 1281, a defensive wall, defeated the invasions, later turned into a nationalist myth.
hint: What has underwater archaeology found?
why: Combining sources and archaeology shows how natural events, military resistance, and later myth-making combined in the memory of the invasions.
```

## Religion in the Kamakura Age

The Kamakura period saw new forms of Buddhism that reached far beyond the court and the great monasteries. **Pure Land** Buddhism, taught by Hōnen and his disciple **Shinran**, promised rebirth in the Pure Land of the Buddha Amida to anyone who called on his name with faith, offering salvation to ordinary people. **Nichiren** taught devotion to the *Lotus Sutra*. **Zen** Buddhism, brought from China by monks such as **Eisai** and **Dōgen**, emphasised meditation and direct insight; it appealed especially to the warrior class and deeply influenced Japanese arts.

## The Ashikaga and the Age of Civil War

After Go-Daigo's restoration failed, the warrior **Ashikaga Takauji** established a new shogunate in Kyoto, taking the title of shogun in 1338; it is named Muromachi after the district where the third shogun, Yoshimitsu, built his palace in 1378. For more than half a century, from 1336 to 1392, rival imperial courts in the north and south competed for legitimacy. The **Ashikaga** or **Muromachi** shogunate (1338–1573) presided over a flowering of culture shaped by Zen: the **Noh** theatre, perfected by Zeami; ink painting; the tea ceremony; rock gardens; and buildings such as the Golden Pavilion (Kinkaku-ji) in Kyoto (rebuilt after a fire in 1950).

But the Ashikaga shoguns never controlled the provinces as firmly as their predecessors. Regional military lords, later called *daimyō*, grew powerful. A succession dispute set off the **Ōnin War** (1467–1477), fought largely in Kyoto, which destroyed much of the capital and ended effective shogunal authority. Japan entered the **Sengoku**, or Warring States, period, a century of civil war between daimyō, which ended only with the unification of Japan under Oda Nobunaga, Toyotomi Hideyoshi, and Tokugawa Ieyasu in the late sixteenth and early seventeenth centuries, as the chapter on the Tokugawa shogunate describes.

A note of caution about the samurai: the idea of **bushidō**, "the way of the warrior", as a code of absolute loyalty and readiness to die, is largely a creation of the seventeenth century and later, popularised internationally by Nitobe Inazō's *Bushido: The Soul of Japan* (1899). Medieval samurai were often pragmatic, switched sides, and fought for land and reward.

## Further exploration

- **Conrad Totman, *A History of Japan* (2nd ed., 2005).** A comprehensive history of Japan.
- **Murasaki Shikibu, *The Tale of Genji*, trans. Royall Tyler (2001).** The great novel of the Heian court.
- **Sei Shōnagon, *The Pillow Book*, trans. Meredith McKinney (2006).** Observations of court life.
- **Karl Friday, *Samurai, Warfare and the State in Early Medieval Japan* (2004).** The real history of the early samurai.
- **Thomas Conlan, *In Little Need of Divine Intervention: Takezaki Suenaga's Scrolls of the Mongol Invasions of Japan* (2001).** The Mongol invasions of Japan reassessed.$japan_master$,
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
  select $japan_quiz$[
    {"type": "mcq", "prompt": "Which city did the Nara capital imitate?", "options": ["Rome", "Baghdad", "Constantinople", "Chang'an"], "answerIndex": 3, "explanation": "Nara, built in 710, was laid out on a grid modelled on the Tang capital Chang'an.", "id": "q1"},
    {"type": "mcq", "prompt": "Who wrote The Tale of Genji?", "options": ["Sei Shōnagon", "Murasaki Shikibu", "Hōjō Masako", "Zeami"], "answerIndex": 1, "explanation": "Murasaki Shikibu, a lady-in-waiting at the Heian court, wrote it in the early eleventh century.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the title 'shogun' come to mean after 1192?", "options": ["The military ruler of Japan, holding real power while the emperor kept ritual authority", "A Buddhist abbot", "The emperor's eldest son", "A Chinese ambassador"], "answerIndex": 0, "explanation": "From Minamoto no Yoritomo onwards, shoguns headed military governments until 1867.", "id": "q3"},
    {"type": "mcq", "prompt": "Why should historians be cautious about the idea of bushidō as the code of medieval samurai?", "options": ["Because samurai never existed", "Because samurai were all Buddhist monks", "Because the idea of bushidō as a code of absolute loyalty is largely a creation of the seventeenth century and later, popularised by Nitobe in 1899", "Because bushidō was invented by the Mongols"], "answerIndex": 2, "explanation": "Medieval samurai were often pragmatic and fought for land and reward.", "id": "q4"},
    {"type": "open", "prompt": "How did power in Japan shift from the imperial court to the warrior class between 900 and 1500?", "rubric": "A strong answer explains the Fujiwara regency and court culture; the rise of armed provincial landholders and the Taira and Minamoto; the Genpei War and Dan-no-ura; Yoritomo's Kamakura bakufu and the dual system; the Hōjō regents; the strain of the Mongol invasions; Go-Daigo's restoration and the Ashikaga; the growth of daimyō power and the Ōnin War leading to the Warring States.", "id": "q5"},
    {"type": "open", "prompt": "How did Japan both borrow from China and develop its own distinct culture in the medieval period?", "rubric": "A strong answer discusses borrowing (Buddhism, writing, the Taika reforms, Nara on the Chang'an model, embassies to the Tang until 838 (a planned 894 mission was cancelled), Zen from China) and distinctive developments (kana and women's prose literature, mono no aware, the dual emperor–shogun system, Pure Land and Nichiren Buddhism, Noh, tea, and gardens), reaching a reasoned conclusion.", "id": "q6"}
  ]$japan_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/asia/medieval-japan-court-samurai-and-shogun', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
