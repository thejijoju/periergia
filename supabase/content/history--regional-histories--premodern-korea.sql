-- Premodern Korean History — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/premodern-korean-history @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
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
    'history/regional-histories/asia/premodern-korean-history',
    'research',
    'advanced',
    'read',
    $mn_korea_master$> **Korea before the modern rupture.** This chapter follows Korea from its dolmens and the shadowy state of Gojoseon through the Three Kingdoms and Silla's unification in 668; Goryeo, the age of celadon, of the Tripitaka Koreana carved against the Mongols, and of the oldest surviving book printed with metal type; and the five centuries of Joseon, with its Neo-Confucian state, yangban elite, enslaved *nobi*, King Sejong's alphabet, the Imjin War and the Manchu invasions, to the so-called "hermit kingdom" forced open by Japan in 1876. It also asks how this past has been fought over by Korean nationalists, Japanese colonial scholars and Chinese state projects.

## Dolmens, Myths and Gojoseon

Korean pottery goes back to at least 8000 BC, perhaps 10,000 BC, and in the Mumun period (c. 1500–300 BC) villagers farmed rice and the first chiefdoms appeared. Their elites left dolmens: the peninsula has over 35,000, approximately 40 per cent of the world's total. Migrants carrying wet-rice farming are linked to the Yayoi culture in Japan, conventionally dated from around 300 BC (radiocarbon dates suggest earlier).

The first Korean polity in written sources is **Gojoseon** (Old Chosŏn), in the northern peninsula and southern Manchuria, its capital later near Pyongyang. Mark Byington writes that it is "entirely unclear as to whether it was a state-level polity", and the South Korean hypothesis that Bronze Age sites in Liaoxi, in western Manchuria, were an early centre of Gojoseon is not widely supported by Chinese and Japanese scholars.

Tradition gives Gojoseon a founder, **Dangun**. In the myth, first recorded by the monk Iryeon around 1280, a bear and a tiger ask the heavenly prince Hwanung to make them human; the tiger gives up, the bear becomes a woman, and her son by Hwanung is Dangun. The founding date of 2333 BC comes from a chronicle of 1485. Most professional historians treat Dangun as myth. A rival legend made a Chinese prince, Gija, the bringer of civilisation; as the historians Peterson and Margulies put it, Dangun suited those who wanted Korea independent, Gija those who wanted to show its affinity to China.

Firmer history begins with Wiman, a refugee from Yan who seized Gojoseon's throne in 194 BCE. In 108 BCE the Han emperor Wu conquered his kingdom and set up four commanderies, as the chapter on Han China (206 BCE–220 CE) describes; one, Lelang near Pyongyang, lasted until 313 CE.

## The Three Kingdoms and Gaya

Korea's oldest surviving chronicle, the *Samguk sagi*, completed by Kim Busik in 1145, dates the founding of Silla to 57 BCE, Goguryeo to 37 BCE and Baekje to 18 BCE. These traditional dates are not reliable: Chinese records mention Goguryeo before 37 BCE, and archaeology suggests that it predates Silla. Buddhism reached Goguryeo in 372 and Baekje in 384, and was accepted in Silla after the martyrdom of the official Ichadon in 527.

**Goguryeo** (Koguryŏ) under Gwanggaeto (Kwanggaet'o, r. 391–412) and Jangsu (r. 413–491), who moved the capital to Pyongyang in 427, ruled much of Manchuria. It then held off China. The *Book of Sui* claims over a million troops were mobilised against it in 612 (a modern estimate is about 670,000); at the Salsu River Eulji Mundeok routed a column of about 305,000. The wars helped bring down the Sui in 618, as the chapter on Tang and Song China notes, and Tang Taizong's invasion of 645 also failed.

**Baekje** (Paekche) passed Chinese writing, Buddhism and crafts to Yamato Japan, as the chapter on Medieval Japan: Court, Samurai, and Shogun describes. **Silla**, with its capital at Gyeongju, was organised by a "bone-rank" system that fixed office, dress, house size and marriage by birth. Silla also had three reigning queens, the first Seondeok (632–647), and traced descent through both parents, which suggests a relatively high status for women. **Gaya**, a confederacy known for its iron, in the Nakdong valley, was absorbed by Silla in 532 and 562.

## Unification: Silla and Balhae

Silla won by allying with the Tang. Together they destroyed Baekje in 660, defeated a Yamato fleet sent to restore it at Baekgang in 663, and took Goguryeo, divided by the quarrels of its dead strongman Yeon Gaesomun's sons, in 668. Then Silla turned on its ally: in the Silla–Tang War (670–676) it drove the Tang from the land south of the Taedong River.

Unified Silla began the temple of Bulguksa and the Seokguram grotto in 751, and a sutra found at Bulguksa, printed between 704 and 751, is among the world's earliest woodblock prints. In the 9th century the maritime magnate Jang Bogo dominated East Asian sea trade.

North of Silla, Dae Joyeong founded **Balhae** (Parhae) in 698. It ruled much of Manchuria and northern Korea until the Khitan Liao conquered it in 926; Goryeo took in perhaps around 100,000 refugees, though estimates differ. A Balhae envoy told the Japanese court in 727 or 728 that Balhae had "recovered the lost land of Goguryeo". Who Balhae "belongs" to is now an argument between states. Silla itself fragmented from 892.

```checkpoint
q: Why should the founding dates 57 BCE, 37 BCE and 18 BCE for Silla, Goguryeo and Baekje be treated with caution?
a*: Because they are traditional dates from a chronicle completed in 1145, and other evidence suggests that Goguryeo predates Silla.
a: Because they come from Chinese sources hostile to Korea.
x: They come from the Samguk sagi, a Korean chronicle of 1145.
a: Because the three kingdoms were all founded on the same day.
x: Nothing in the sources suggests that; the issue is the late and unreliable chronicle.
a: Because the dates were invented by Japanese colonial scholars.
x: The dates are much older; they appear in Kim Busik's Samguk sagi.
hint: Think about when and by whom they were written down, and which kingdom the evidence suggests came first.
why: The dates come from a chronicle written over a thousand years later, and they place Silla first, which other evidence contradicts.
---
q: How did Silla unify most of the peninsula?
a: By defeating the Tang single-handed and then conquering Baekje and Goguryeo.
x: Silla first allied with the Tang; it fought them only after 670.
a: By marriage alliance with Goguryeo.
x: Goguryeo was destroyed by Silla and the Tang in 668.
a*: By allying with the Tang to destroy Baekje (660) and Goguryeo (668), then expelling the Tang south of the Taedong River in 670–676.
a: By inviting a Japanese army to help it.
x: Yamato Japan sent a fleet to aid Baekje, and it was defeated at Baekgang in 663.
hint: An alliance, then a war against the ally.
why: Unification needed Chinese power, and keeping it needed Silla to turn on that power.
```

## Goryeo: Examinations, Celadon and a Pluralist Court

Wang Geon founded **Goryeo** in 918 and reunited the peninsula by 936, marrying 29 women from powerful regional families. The name, from Goguryeo, gave the West "Korea". In 958 King Gwangjong introduced civil service examinations, which lasted until 1894, and in 1018–19 Gang Gam-chan defeated a Liao army of 100,000 at Kwiju.

Goryeo's place in the world is debated. Song, Liao and Jin all described it as a vassal. Henry Em and Remco Breuker argue that until 1270 its rulers held a "pluralist" outlook: they claimed a ritual status reserved for the Son of Heaven while recognising the empires around them, and the sinologist Hans Bielenstein calls Goryeo's professions of vassalage an "official fiction".

Buddhism was the state religion. Potters took celadon techniques from China and by the 12th century had made them their own, with a jade-green glaze, *bisaek*, and *sanggam* inlay, unique to Goryeo. In 1170 officers seized power; from 1196 the Choe family ruled, and before them Yi Ui-min, a man of *nobi* (slave) background.

## The Mongol Century, the Tripitaka and Metal Type

The Mongols invaded in 1231. The court withdrew to Ganghwa Island while the mainland suffered a series of campaigns, often counted as six major ones, until peace in 1259; in 1254 alone an estimated 206,800 captives were taken. The invaders burned the woodblocks of Goryeo's first Buddhist canon, carved in 1011–87.

Goryeo carved it again. From 1237, over twelve years, craftsmen cut the **Tripitaka Koreana**: more than 81,000 woodblocks holding about 52 million characters, kept at Haeinsa since 1398 and the oldest intact version of the Chinese Buddhist canon. Robert Buswell compared the effort to the Apollo programme. Contrary to legend, it contains some errors.

Yi Gyu-bo's writings record ritual texts printed with metal type in about 1234, but no copy survives. The oldest *surviving* book printed with movable metal type is the *Jikji*, a Buddhist text printed at Heungdeok Temple in Cheongju in 1377, 78 years before Gutenberg's 42-line Bible; its one surviving volume is in the Bibliothèque nationale de France. The chapters on Tang and Song China (for Bi Sheng's clay type) and The Renaissance give the wider story.

After 1270 Goryeo became a "son-in-law" state of the Yuan; its kings married Mongol princesses. It was made to support Khubilai's attacks on Japan: for 1274 a force of 30,500 built the ships, and the fleet carried 6,000 to 8,000 Korean troops and 7,000 Korean sailors, as the chapters on The Mongol Empire and Medieval Japan: Court, Samurai, and Shogun describe. King Gongmin (r. 1351–74) pushed back Yuan influence, and in 1388 the general Yi Seong-gye, ordered to attack Ming Liaodong, turned his army back from Wihwa Island, seized power, and in 1392 founded a new dynasty.

## Joseon: A Neo-Confucian State

**Joseon** (Chosŏn) lasted from 1392 to 1897, ruled from Hanseong, modern Seoul. Its founders, led by Jeong Do-jeon, made Neo-Confucianism the state creed and discouraged Buddhism; the law code, the *Gyeongguk daejeon*, reached its final form in 1485. Joseon sent tribute to the Ming and then the Qing, a relationship the chapter on Ming China and the Voyages of Zheng He explains.

At the top were the **yangban**, the "two branches" of civil and military officials, whose standing rested on examination success. Below came the *jungin*, specialists such as interpreters and physicians; the commoners, the largest group; and the "base" people, including *nobi*, butchers and shamans. Yangban politics could be lethal: in literati purges between 1498 and 1545 the reformer Jo Gwang-jo was executed (1519). The same class produced the great philosophers Yi Hwang (Toegye) and Yi I (Yulgok).

## Sejong and Hangul

**Sejong the Great** (r. 1418–1450) re-established the Hall of Worthies and pushed the northern border to roughly its present line. His reign produced an agricultural manual, a medical compendium, astronomical instruments and a rain gauge developed in 1441 under Crown Prince Munjong with Jang Yeong-sil, and in 1426 he granted female state *nobi* 100 days' maternity leave.

His most lasting work was an alphabet, announced to the court in the twelfth month of 1443 by the Korean calendar and promulgated in the ninth month of 1446 through the *Hunminjeongeum* and its commentary, the *Haerye*. The exact day is not known; South Korea's Hangul Day on 9 October is a modern reckoning.

{{image: Hunminjeongeum | The first page of the Hunminjeongeum, through which King Sejong promulgated the new Korean alphabet in 1446}}

```quote
The sounds of our country's language are different from those of the Middle Kingdom and are not confluent with the sounds of characters. Therefore, among the ignorant people, there have been many who, having something they want to put into words, have in the end been unable to express their feelings.
Sejong · Preface to the Hunminjeongeum (one English translation) · 1446
```

Officials objected that a native script departed from Chinese civilisation; historians add elitism and self-interest. Hangul spread slowly, with women and Buddhists among its first users, and only in November 1894 did it become the preferred script for official documents.

## Nobi and Women: Who Paid for the Confucian Order?

The **nobi**, owned by the state or private masters, held a hereditary status that could also be imposed for crime or debt. They could be bought, sold and inherited, though most farmed apart from their masters with their own families. Estimates of their numbers range from about 10 per cent on average to 30 per cent or more between the 15th and 17th centuries; in one Seoul register of 1663, 73 per cent were *nobi*. Most government *nobi* were freed in 1801, and the system was abolished in 1894.

Were they slaves? The American historian **James Palais** argued in 1995 that Joseon was a "slave society", since *nobi* were roughly 30 per cent of the people. **Rhee Young-hoon** and **Yang Donghyu** compared *nobi* with American slavery, while others have argued that most *nobi* living apart from their masters were closer to serfs, and a 2010 Seoul National University critique held that Palais lacked empirical support and that 18th-century *nobi* were effectively tenants. The Korean word for an actual slave is *noye*, not *nobi*.

In Goryeo, women could mix freely with men, own property and inherit land. **Martina Deuchler** (1992) argues that from the 15th to the 17th century Neo-Confucian reformers built patrilineal clans that cut daughters out of inheritance and stigmatised remarriage: from 1477 the sons of remarried women were increasingly barred from the examinations, and yangban women were secluded. **Choi Jae-seok** replied in 2005 that patrilineal elements went back to Silla. Others, following **JaHyun Kim Haboush**'s translation of Lady Hyegyeong's memoirs, stress women's own voices and agency.

## The Imjin War, 1592–1598

On 23 May 1592 Hideyoshi's armies landed at Busan, the first step of a plan to conquer Ming China; the chapter on the Tokugawa Shogunate gives Japan's side. Some 158,800 Japanese, counting labourers and sailors, armed with arquebuses, took Hanseong on 10 June, after King Seonjo had fled, and Pyongyang on 20 July. In the capital, the slave registers burned.

Admiral **Yi Sun-sin** cut Japanese sea supply; at Hansan Island in August 1592 the Japanese lost 59 ships and the Koreans no ships. His covered, spike-roofed **turtle ships**, first mentioned in 1413, became famous, though no Korean source of his time calls them ironclad. "Righteous armies" under leaders such as Gwak Jae-u and warrior monks under Hyujeong fought behind the lines, and a Ming army retook Pyongyang in 1593.

Japan invaded again in 1597 with orders, as quoted, to "mow down everyone universally, without discriminating between young and old, men and women". After Wŏn Gyun's fleet was destroyed at Chilcheollyang, Yi with 13 ships defeated about 133 Japanese warships at Myeongnyang on 26 October 1597 (the often-cited figure of about 330 includes support vessels). After Hideyoshi's death the Japanese withdrew; at Noryang on 16 December 1598 Yi was killed by a bullet, saying, as tradition records, "Do not announce my death."

Estimates of the war's dead run from about one million to, by Samuel Hawley's reckoning, at least two million from war and famine, and arable land fell to 66 per cent of its prewar extent. Kyoto's "Ear Mound" holds the noses of tens of thousands of Koreans and Chinese; 38,000 is one figure often cited. Tens of thousands of Koreans were carried to Japan, many resold through Portuguese traders; captive potters founded kilns such as Arita's. Chillies, later essential to kimchi as the chapter on The Columbian Exchange and the First Global Economy notes, were first recorded in 1614 as having come from Japan, as "Japanese mustard", an origin now debated.

JaHyun Kim Haboush argued in *The Great East Asian War and the Birth of the Korean Nation* (2016) that out of the Japanese and Manchu invasions Koreans emerged with a new sense of themselves as one people.

## Under the Qing

The next blows came from Manchuria. The Later Jin invaded in 1627 and forced "brotherly relations"; in 1636–37 Hong Taiji came with about 100,000–120,000 men, and King Injo, after holding out in Namhansanseong, knelt three times and bowed nine times before him at Samjeondo. Joseon broke with the Ming and sent two princes as hostages. Returning women abducted by Qing troops, the *hwanhyang-nyeo*, were often rejected by their families, although the government said they should not be considered disgraced.

Joseon's elite saw their country as the heir of the fallen Ming, "Little China", and kept using Ming reign names long afterwards. About two centuries of external peace followed, though famines in 1670–71 and 1695–96 may have killed 23–33 per cent of the population. Kings Yeongjo and Jeongjo led a revival; Jeongjo built Hwaseong Fortress (1794–96) to honour his father, Crown Prince Sado, whom Yeongjo had put to death.

*Silhak* ("practical learning") scholars, many from factions shut out of power, urged land reform and the study of Korea's own past; one, Jeong Yak-yong, spent 1801–1818 in exile because his family was linked to Catholicism. That faith came through Chinese-language Jesuit books, and persecutions from 1791 to 1866 killed 8,000–10,000 Korean Christians. In 1860 Choe Je-u founded *Donghak*, "Eastern Learning"; he was beheaded in 1864.

## The "Hermit Kingdom" and 1876

"Hermit kingdom" is a Western label, from William Elliot Griffis's *Corea: The Hermit Nation* (1882). Joseon had long sent missions to Beijing and traded with Japan through Tsushima; strict exclusion of the West was a 19th-century policy, above all of the **Heungseon Daewongun**, regent from 1864 to 1873, summed up by Bruce Cumings as "no treaties, no trade, no Catholics, no West, and no Japan".

In 1866, after nine French priests were killed, a French squadron occupied Ganghwa, seized books from the royal archive and withdrew. In 1871 a US expedition attacked the Ganghwa forts, losing 3 dead against Korean dead estimated at 243 to about 350.

Japan succeeded where they had failed. After a clash near Ganghwa in 1875, the treaty of February 1876 declared Korea "an independent state", undermining Qing suzerainty, opened three ports and gave the Japanese extraterritoriality. What followed, from the Donghak rising of 1894 to annexation in 1910, is told in the chapters on The Meiji Restoration, The Taiping Rebellion and the Late Qing, and Japan's Empire in Asia, 1895–1945.

```checkpoint
q: Why is "ironclad" a doubtful description of Yi Sun-sin's turtle ships?
a: Because the turtle ships never existed.
x: Turtle ships are mentioned as early as 1413, and Yi revived them.
a*: Because no Korean source from Yi's time calls them ironclad; the spiked, covered roof is what is well attested.
a: Because they were made entirely of stone.
x: They were wooden ships with covered, spiked roofs.
a: Because they were built by the Ming navy.
x: They were Korean ships revived by Yi Sun-sin.
hint: Ask what the contemporary Korean sources actually say.
why: The "ironclad" image owes more to later writers than to the sources of the 1590s.
---
q: Where does the phrase "hermit kingdom" come from, and why is it misleading?
a: It was Sejong's own name for Joseon, chosen to reject China.
x: It is a Western label from 1882, centuries after Sejong.
a: It was used in the Ganghwa Treaty of 1876.
x: The treaty called Korea "an independent state".
a: It describes Korea's isolation from China throughout the Joseon period.
x: Joseon sent regular tribute missions to Beijing.
a*: It comes from Griffis's 1882 book; Joseon traded with Japan and sent missions to China, and strict exclusion of the West was mainly a 19th-century policy.
hint: Who coined it, and when?
why: The label turns a specific policy of the 1860s into a timeless national character.
```

## How Korea's Past Has Been Written

Japanese scholars, before and during colonial rule, advanced two theses. The **stagnation** thesis, set out by the economist Fukuda Tokuzō in 1904, placed Korea far behind in development and used this openly to argue for Japanese domination. The **heteronomy** thesis held that Korean history was driven by outsiders; Hyung Il Pai shows how colonial finds at Lelang served it, Stella Xu has studied both theses, and Sang Mee Oh traces them into American scholarship from the 1880s to the 1960s.

Korean historians answered differently. **Sin Chae-ho**'s *A New Reading of History* (1908) founded a nationalist history of the *minjok*, the nation, with Dangun as founder and Manchuria as ancestral land; Pai sees in later Dangun studies a "progressively ultra-nationalistic trend". The Marxist **Paek Nam-un** argued in the 1930s that Korea had followed universal stages of development, and after 1945 the "sprouts of capitalism" school found commerce growing in late Joseon. Owen Miller argues that the politics of "stagnation" were more tangled than the nationalist rebuttal allows.

The Gwanggaeto stele of 414, near Ji'an on the Yalu, has a passage on the year 391 that Japanese army-sponsored scholars read as saying Wa (Japan) subjugated Baekje and Silla; Korean scholars read Goguryeo as the subject. In 1972 the Zainichi scholar Lee Jin-hui accused the Japanese army of altering the stone, but the Chinese scholars Wang Jianqun and Xu Jianxin found no deliberate falsification. Suematsu Yasukazu's 1949 thesis of a Japanese colony, Mimana, has lost support for lack of archaeological evidence, yet Mimana remains, in E. Taylor Atkins's words, "among the most disputed issues in East Asian historiography".

From 2002 to 2007 the Chinese Academy of Social Sciences' **Northeast Project** treated Gojoseon, Goguryeo and Balhae as regional regimes of China, provoking outrage in South Korea in 2004, though premodern China itself regarded Goguryeo as Korean. Korean scholars see Balhae as a Goguryeo elite ruling Mohe subjects, Chinese scholars as a Mohe-majority Tang local regime, and Russian scholars doubt the evidence can settle it. The two Koreas divide too: the South keeps 3 October as National Foundation Day, while the North declared Dangun a real person after announcing in 1993 that it had "excavated" his supposed tomb.

## Further exploration

- **Michael J. Seth, *A Concise History of Korea: From the Neolithic Period Through the Nineteenth Century* (2006).** The standard one-volume survey of premodern Korea, later reissued as *A Concise History of Premodern Korea*.
- **Ki-baik Lee, *A New History of Korea* (1984).** The classic South Korean survey by a leading Korean historian, in English translation.
- **Carter J. Eckert, Ki-baik Lee et al., *Korea, Old and New: A History* (1990).** A Harvard–Seoul collaborative survey.
- **Martina Deuchler, *The Confucian Transformation of Korea: A Study of Society and Ideology* (1992).** How Neo-Confucianism remade kinship, inheritance and women's place.
- **James B. Palais, *Confucian Statecraft and Korean Institutions: Yu Hyŏngwŏn and the Late Chosŏn Dynasty* (1996).** A monumental study of Joseon institutions.
- **Samuel Hawley, *The Imjin War: Japan's Sixteenth-Century Invasion of Korea and Attempt to Conquer China* (2005).** The fullest English narrative of the war.
- **JaHyun Kim Haboush, *The Great East Asian War and the Birth of the Korean Nation* (2016).** Argues that the Imjin War forged a Korean national identity.$mn_korea_master$,
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
  select $mn_korea_quiz$[
    {"type": "mcq", "prompt": "What is the Jikji, printed at Heungdeok Temple in Cheongju in 1377?", "options": ["The oldest surviving book printed with movable metal type", "The first book ever printed with metal type", "The first edition of the Tripitaka Koreana", "The document that promulgated hangul"], "answerIndex": 0, "explanation": "Metal type is recorded in Korea around 1234, but no copy of that earlier book survives; the Jikji is the oldest that does, 78 years before Gutenberg's 42-line Bible.", "id": "q1"},
    {"type": "mcq", "prompt": "What is known about the date of hangul's promulgation?", "options": ["It was promulgated on 9 October 1446", "It was promulgated on 15 January 1443", "It was announced in the twelfth month of 1443 and promulgated in the ninth month of 1446, on a day that is not known", "It was promulgated in 1894"], "answerIndex": 2, "explanation": "South Korea's Hangul Day on 9 October is a modern reckoning; the exact day of promulgation is unknown. In 1894 hangul became the preferred script for official documents.", "id": "q2"},
    {"type": "mcq", "prompt": "What did James Palais argue about Joseon's nobi?", "options": ["That they were a tiny group of household servants", "That Joseon was a 'slave society' because nobi made up roughly 30 per cent or more of the population", "That nobi did not exist after 1392", "That they were free tenants with no hereditary status"], "answerIndex": 1, "explanation": "Palais's 1995 thesis was challenged by Rhee Young-hoon and Yang Donghyu, by scholars who saw most non-resident nobi as closer to serfs, and by a 2010 Seoul National University critique.", "id": "q3"},
    {"type": "mcq", "prompt": "At Myeongnyang on 26 October 1597, how many ships did Yi Sun-sin command against roughly how many Japanese warships?", "options": ["330 against 13", "133 against 330", "59 against none", "13 against about 133"], "answerIndex": 3, "explanation": "The often-cited figure of about 330 Japanese ships counts support vessels.", "id": "q4"},
    {"type": "open", "prompt": "How have Japanese colonial, Korean nationalist and Chinese state projects shaped the writing of premodern Korean history?", "rubric": "A strong answer explains the colonial stagnation thesis (Fukuda Tokuzō, 1904) and heteronomy thesis (Lelang; Stella Xu, Hyung Il Pai); Sin Chae-ho's minjok history, Dangun and Manchuria, and Pai's criticism; Paek Nam-un and the 'sprouts of capitalism' school, with Owen Miller's caution; the Gwanggaeto stele, the sinmyo passage, Lee Jin-hui's accusation and the findings of Wang Jianqun and Xu Jianxin, and the decline of Suematsu's Mimana thesis; and the Northeast Project (2002–2007) and the dispute over Goguryeo and Balhae, including Korean, Chinese and Russian positions.", "id": "q5"},
    {"type": "open", "prompt": "Did Neo-Confucianism transform the lives of Korean women and nobi under Joseon? Weigh the evidence and the debates.", "rubric": "A strong answer contrasts women's position in Goryeo (mixing, property, inheritance) with Joseon's patrilineal reforms as argued by Martina Deuchler (inheritance, remarriage rule of 1477, seclusion), notes Choi Jae-seok's critique and Haboush's emphasis on women's voices (Lady Hyegyeong); for nobi it gives the range of estimates (about 10 per cent to 30–40 per cent), the 1663 Seoul register, Palais's slave-society thesis and Rhee Young-hoon's serf comparison and the SNU critique, the noye/nobi distinction, and the decline to abolition in 1894.", "id": "q6"}
  ]$mn_korea_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/premodern-korean-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
