-- Chinese History — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/chinese-history @ research/advanced/read.
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
    'history/regional-histories/asia/chinese-history',
    'research',
    'advanced',
    'read',
    $mn_chinesehist_master$> **Four thousand years in one view.** This chapter takes the long view of Chinese history before the ruptures of the nineteenth century, from the first farming villages and the Shang oracle bones to the High Qing empire of the Qianlong emperor. Most periods have chapters of their own, so the space goes instead to the questions historians argue about across the whole span: why China was repeatedly divided and reunited, and whether the "dynastic cycle" explains it; how far the examinations opened office to talent; how the empire lived with the steppe peoples who twice conquered it; whether the "tribute system" describes China's foreign relations; what "China" has meant; and why industrialisation came first to Europe. A closing section names the turning points from 1839 to the present and points to the chapters that tell that story.

## Many Beginnings

China did not start from a single centre. Farming began about 10,000 years ago, at different times in different regions: rice along the Yangzi, carbon-dated to about 8,000 years ago, and millet in the Yellow River valley from about 7000 BCE. The Liangzhu culture of the Yangzi delta (3300–2300 BCE), with a walled centre near Hangzhou and elite burials of jade and silk, may be among the oldest state societies in East Asia. In the north, most archaeologists regard Erlitou in Henan (c. 1750–1530 BCE by recent radiocarbon dating; older estimates began about 1900) as China's first state-level society. Chinese archaeologists generally identify it with the Xia dynasty of later texts; some Western scholars call that premature, since no writing has been found there. The neat succession of Xia, Shang and Zhou is a later construction.

The Shang (c. 1600–1046 BCE) left the oldest Chinese writing. Diviners heated ox shoulder blades and turtle shells, read the cracks, and carved question and interpretation on the bone. More than 150,000 inscribed fragments are known, with some 4,000 to 5,000 distinct characters, of which fewer than half can be read with confidence; estimates of the securely read run from about 1,200 to 2,000. Villagers sold the bones as "dragon bones" for medicine until Wang Yirong recognised the writing in 1899.

The Zhou, who overthrew the Shang around 1046 BCE and nominally lasted until 256 BCE, justified their conquest with the **Mandate of Heaven**: rule was conditional on just government, and a successful revolt proved that the Mandate had passed. It did not require noble birth: the Han and Ming were founded by commoners, and non-Han dynasties such as the Qing also claimed it. Its corollary was a right of rebellion, stated most sharply by Mencius.

```quote
The people are of supreme importance; the altars of soil and grain come next; last comes the ruler.
Mencius · The Mencius, 7B:14 (tr. D. C. Lau)
```

The Ming founder had such passages cut from official editions of the Mencius, and when Japan adopted Tang institutions in the Taihō Code of 701 its rulers grounded their right in descent rather than in a conditional Mandate. The chapter on Ancient China: Shang, Zhou, and the Hundred Schools tells this early story in full.

## Philosophers and the First Empire

The Western Zhou fell in 771 BCE, and the Spring and Autumn and Warring States periods that followed were the age of the Hundred Schools: Confucius (c. 551–479 BCE), whose *Analects* were compiled long after his death; Laozi, whose name is an honorific meaning "old teacher" and who may be legendary; and the Legalists, first put into practice in the state of Qin by Shang Yang's reforms of the fourth century BCE.

Qin conquered its rivals, and in 221 BCE its king took the title *Shi Huangdi*, "First Emperor". The title *huangdi* lasted until 1912, and "Qin" probably gave the West its word "China". The Qin standardised script, weights, measures and coinage. Sima Qian's story that the emperor burned books and buried some 460 scholars alive is doubted by some modern historians, partly because Qin and early Han writings quote the Classics freely. The Terracotta Army, more than 8,000 figures, was found in 1974 by farmers digging a well.

{{image: Great Wall of China | The Great Wall near Beijing. The best-known stretches are Ming brick and stone, built after 1449, not Qin.}}

The Qin also joined existing walls, the earliest from the seventh century BCE, into the first "Great Wall". Two popular beliefs need correcting. The best-known sections are Ming work, built in brick and stone after the defeat at Tumu in 1449; a national survey in 2012 counted 21,196 km of walls, trenches and related works from all periods. And the wall cannot be seen with the naked eye from the Moon. NASA says it is barely visible even from low Earth orbit, and only in near-perfect conditions.

## Han, Division and Reunion

The Han dynasty (206 BCE–220 CE) kept much of the Qin state but gave Confucian learning official standing: in 136 BCE Emperor Wu abolished academic chairs outside the Five Classics, and in 124 BCE he founded an Imperial University. Sima Qian's *Shiji* set the form that all the official dynastic histories copied. The chapters on Han China (206 BCE–220 CE) and The Silk Roads cover the Han, the Xiongnu and the routes west.

After 220 China stayed divided for more than three and a half centuries. In the north the Sixteen Kingdoms (304–439) were mostly founded by Xiongnu, Xianbei, Jie, Di and Qiang rulers, and Han Chinese migrated south in great numbers to the Yangzi. Buddhism, which had reached China along the Silk Roads in the first century CE, put down deep roots, as the cave temples of Dunhuang, Yungang and Longmen show.

The Sui reunified China in 589 and built the Grand Canal. The Tang (618–907) made Chang'an the world's most populous city for much of the dynasty. The rebellion of An Lushan (755–763) broke the dynasty's power. Its death toll is **disputed**. The census fell from 52,919,309 in 755 to 16,900,000 in 764, and that paper gap of about 36 million has been quoted as a death toll, but Matthew White, whose figure Steven Pinker used, later revised his estimate to about 13 million. Scholars attribute much of the fall to the collapse of registration; Hans Bielenstein called a literal reading "comically naive". Deaths were certainly in the millions, but the census overstates them. The chapter on Tang and Song China covers both dynasties in depth.

## Song, the Steppe Conquerors and the Yuan

The Song, founded in 960, inherited a north where the Sixteen Prefectures had been ceded to the Khitan Liao, and from 1005 it paid the Liao to keep the peace Yet the Song saw a commercial and technological revolution. Estimates of population by about 1100 range from some 90 million to over 120 million. Merchants in Sichuan issued paper notes, the *jiaozi*, taken over by the state in 1023 and regarded by numismatists as the first paper money. Printing, gunpowder and the compass, three of the "four great inventions" with paper, were all in use. Francis Bacon, who did not know they were Chinese, wrote that printing, gunpowder and the magnet "have changed the whole face and state of things throughout the world". The Japanese historian Naitō Konan argued that the changes between the mid-Tang and the early Song marked China's passage from a "medieval" to an "early modern" age.

Khubilai proclaimed the Great Yuan in 1271, claimed the Mandate of Heaven, and destroyed the Song by 1279. The Yuan was the first conquest dynasty to rule all of China proper, ranking its subjects in four classes with southern Chinese last. The fall in registered population, from about 120 million before the conquest to about 59 million in the census of 1290, is **disputed**: Mote reads it as a failure to record people, Brook as people removed from the census by enserfment, and McNeill and Morgan point to plague, which in the fourteenth century may have killed about a quarter of the population. Marco Polo's China belongs to the chapter on The Mongol Empire. The Red Turban rebellion, which began in 1351, ended Yuan rule in China in 1368.

## Ming and the High Qing

The Ming founder, the Hongwu emperor, was one of only two founders of a major Chinese dynasty born into a peasant family; the other was the Han founder, Liu Bang. The Muslim eunuch admiral Zheng He led seven voyages between 1405 and 1433; the first fleet had 317 ships and almost 28,000 men. Then the voyages stopped, and after Esen's Oirat Mongols captured an emperor at Tumu in 1449 the Ming turned defensive in the north. Whether China then "turned inward" is a debate. Some older surveys describe the later Ming as increasingly isolationist, yet the Portuguese settled at Macau from 1557 and American silver flowed in through Manila. The chapter on Ming China and the Voyages of Zheng He sets out the case against the "myth of isolation". By one estimate (Peter Nolan's) the Ming–Qing transition cost some 25 million lives.

Hong Taiji proclaimed the Great Qing in 1636, and the Manchus took Beijing in 1644 after the Ming general Wu Sangui opened the Shanhai Pass. The Kangxi emperor (reigned 1661–1722), whose 61-year reign was the longest of any Chinese emperor, took Taiwan in 1683 and agreed the Treaty of Nerchinsk with Russia in 1689; the chapter on The Rise of Absolutism sets him beside Louis XIV. His grandson Qianlong (reigned 1735–1796) sponsored the vast *Siku Quanshu* compilation while literary inquisitions suppressed some 3,100 works. His campaigns conquered the Dzungar Mongols and Xinjiang in 1755–59, and he ordered what is now called the Dzungar genocide: the Qing scholar Wei Yuan estimated that of some 600,000 Dzungars, 40 per cent died of smallpox, 20 per cent fled and 30 per cent were killed by Qing troops. The Qing roughly doubled the Ming's territory, and by modern estimates at the end of Qianlong's reign it ruled about a third of the world's population and had the largest economy in the world, with a population that rose from roughly 150–160 million in 1700 to about 303 million in 1791.

That confidence shaped Qianlong's reply to the first British embassy, led by Lord Macartney and received at Chengde in 1793.

```quote
Our Celestial Empire possesses all things in prolific abundance and lacks no product within its own borders. There was therefore no need to import the manufactures of outside barbarians in exchange for our own produce.
Qianlong emperor · edict to George III · 1793 (tr. Backhouse and Bland)
```

A popular story holds that the embassy failed because Macartney refused to kowtow. There was a dispute over ceremony, but it was not the reason the mission failed.

```checkpoint
q: What happened to registered population during the An Lushan rebellion, and how do historians read it?
a*: It fell by about 36 million, but much of the fall reflects the collapse of registration, and one revised estimate of deaths is about 13 million.
a: The census rose, showing that the rebellion did little harm.
x: The census fell sharply, from about 53 million in 755 to about 17 million in 764.
a: It fell by about 36 million, and historians agree that all of them were killed.
x: Scholars attribute much of the fall to lost registration; Bielenstein called a literal reading "comically naive", and Matthew White revised his figure to 13 million.
a: Census records for the period do not survive, so there is no evidence at all.
x: Censuses survive for both 755 and 764; the problem is how to interpret them.
hint: Ask what a census measures: people, or people the state can still count?
why: The paper gap is real but mostly measures a state losing control of its registers, so deaths were in the millions but well below 36 million.
---
q: Which statement about the Great Wall is supported by the evidence?
a: It is clearly visible to the naked eye from the Moon.
x: NASA says it is barely visible even from low Earth orbit, and not from the Moon.
a: It was built in one campaign by the First Emperor.
x: The Qin joined walls that went back to the seventh century BCE, and later dynasties built much more.
a*: The most famous stretches are Ming work, built in brick and stone after the defeat at Tumu in 1449.
a: Its surviving brick sections are mostly Han.
x: The best-known brick and stone stretches are Ming, built after 1449.
hint: Think about which dynasty faced the Oirat disaster of 1449.
why: The Ming turned defensive after Tumu and built most of the wall visitors see today.
```

## Unity, Division and the Dynastic Cycle

The novel *Romance of the Three Kingdoms*, attributed to Luo Guanzhong, opens in its standard seventeenth-century edition by Mao Lun and Mao Zonggang with a famous line: "After a long split, a union will occur; after a long union, a split will occur." Long divisions after 220 and 907 each ended in reunion. Unlike the western Roman empire, the Qin–Han empire was reassembled again and again.

The traditional explanation is the **dynastic cycle**. A founder wins the Mandate; peace brings prosperity and population growth; then come corruption, disaster and famine; rebellion follows, the Mandate passes, and a new dynasty begins. The official histories built this shape into their form. From Ban Gu's *Book of Han*, each dynasty had its own history, and from the Tang writing it became a state task.

Historians have criticised the idea. John K. Fairbank and Edwin Reischauer wrote in 1960 that "the concept of the dynastic cycle … has been a major block to the understanding of the fundamental dynamics of Chinese history", valid only as "a somewhat superficial political pattern" above deeper change, such as the Song's commercial revolution. Yet the idea lives on. In 1945 Huang Yanpei asked Mao Zedong how the Communists would escape it; Mao answered "democracy", with the public keeping oversight of the government. In 2021 the Chinese Communist Party's third historical resolution named the party's "self-revolution" as "the second answer".

## The Examination State

The imperial examinations lasted about 1,300 years, from the Sui (the *jinshi* or "presented scholar" degree is dated to 607) to their abolition in 1905. They had Han antecedents: candidates recommended as "filial and incorrupt", at a quota of one per 200,000 households, were examined from 132 CE. Wu Zetian expanded the system greatly. Under the Ming its content narrowed to the Neo-Confucian orthodoxy of Zhu Xi (1130–1200), and the *jinshi* became essential for high office.

Did the examinations make imperial China open to talent? Ping-ti Ho, in *The Ladder of Success in Imperial China* (1962), used lists of *jinshi* graduates to argue for substantial upward mobility under the Ming. On Ho's own figures, the share of *jinshi* from families with no degree holder in the previous three generations fell from 47.5 per cent under the Ming to 19.1 per cent under the Qing. Against the optimistic reading, most of the population lacked the education to compete, and in the late empire only a small fraction, by some estimates about 1 per cent, of the two or three million annual candidates passed. Office could also be reached by nomination, purchase or clerical promotion.

Korea and Vietnam adopted the system, and Macaulay and Stafford Northcote (of the Northcote–Trevelyan Report) knew Chinese institutions. Not everyone welcomed the comparison: in 1854 Lord Monteagle opposed open examinations in the House of Lords partly because they were a Chinese system.

## The Steppe Frontier

For two thousand years the most dangerous frontier lay to the north. Regimes founded by steppe and frontier peoples ruled the north from 304 to 581; the Khitan Liao (916–1125), Tangut Xia (1038–1227) and Jurchen Jin (1115–1234) held parts of the north in the Song era; and two conquest dynasties, the Mongol Yuan and the Manchu Qing, ruled all of China proper.

Thomas Barfield's *The Perilous Frontier* (1989) offered the most influential model. When the Xiongnu split in 60 BCE, he argued, the weaker party adopted an "inner frontier strategy" of alliance with the Han. In reviewers' summaries, his broader "outer frontier strategy" has nomad empires extracting subsidies and trade from China rather than conquering it, and so depending on Chinese dynasties. Nicola Di Cosmo (2002) and Christopher Beckwith (2009) have criticised this picture of needy nomads, which casts the steppe peoples as dependants rather than actors with their own aims.

## China and the World: Tribute and Trade

For much of the twentieth century China's foreign relations were explained by the **tribute system**, a model created by John K. Fairbank and Teng Ssu-yu in the early 1940s and made influential by Fairbank's edited volume *The Chinese World Order* (1968). Tribute missions were real: Ryukyu sent 57 between 1372 and 1398. But Peter Perdue argues that *gong*, the Chinese term, is an "inadequate translation", and that the model "turned a flexible practice … into an overly formalized ritual system". In practice Japan, Korea, Ryukyu and Vietnam pursued their own agendas while sending tribute.

The language of tribute also hides how commercial China's links often were. Song coins served as a currency across maritime Asia; under the Yuan, Quanzhou was among the largest ports in the world; and Ming and Qing China absorbed Japanese and American silver.

## What Is "China"?

The Qing raises the hardest question. Ping-ti Ho argued in 1967 that the Manchus succeeded because they were sinicised. From the mid-1990s a group of American historians, among them Evelyn Rawski, Mark Elliott, Crossley, Perdue and Millward, read the Qing's Manchu-language archives and found an Inner Asian as well as a Chinese empire. The **New Qing History** crystallised around Rawski's 1996 address to the Association for Asian Studies, "Re-envisioning the Qing"; Ho replied with "In Defense of Sinicization". Some Chinese scholars accuse the school of imperialist motives, while others welcome it, and Elliott says it does not separate the Qing from "China". The Qing itself defined China (*Dulimbai gurun*) as including Manchuria, Mongolia, Xinjiang and Tibet.

Timothy Brook's *Great State* (2019) pushes the question back further. The conventional answer is that a unified China began with the Qin in 221 BCE. Brook argues that China's sense of itself as a unified "great state" derives instead from the Mongol *yeke ulus*, and that the Ming, the Qing, the Republic and the People's Republic all inherited an imperial form built by Mongols and Manchus; one reviewer judged the argument unlikely to be popular in China. The Fudan historian Ge Zhaoguang's *What Is China?* (2018) offers a Chinese scholar's view that the meaning of "China" has itself changed over time.

## The Great Divergence

If the Song had paper money, printing and gunpowder, and the Qing had the world's largest economy, why did industrialisation begin in Britain? Joseph Needham, whose *Science and Civilisation in China* began to appear in 1954, asked in *The Grand Titration* (1969) why modern science took "its meteoric rise only in the West" when China had been "much more efficient than occidental in applying" natural knowledge. Mark Elvin's *The Pattern of the Chinese Past* (1973) answered with a "high-level equilibrium trap", and Eric Jones's *The European Miracle* (1981) gave the older Eurocentric answer.

Kenneth Pomeranz's *The Great Divergence* (2000), borrowing a term coined by Samuel Huntington in 1996, transformed the debate. Pomeranz and the "California school" argue that the Yangzi Delta was comparable to the most advanced parts of Europe until about 1800, and that coal and colonies made the difference; China's coal lay in the northwest, far from the economic core that had moved south after the Song. Critics answer with wage data. Broadberry and Gupta find English silver wages three times those of the Yangzi Delta by 1600 (though grain wages were only about 15 per cent higher), and with Zhai dates the divergence to about 1700; Goldstone's 2021 review places it only after 1750 or 1800; Maddison argued that western Europe's output per person had already pulled ahead of every other region. The chapter on The Industrial Revolution gives the European side. What is at stake is large: China held between a fifth and a third of humanity for most of the last two thousand years.

```checkpoint
q: What is Peter Perdue's main criticism of the "tribute system" model?
a: That China never received tribute missions at all.
x: Tribute missions were real; Ryukyu, for example, sent 57 between 1372 and 1398.
a*: That it turned a flexible practice into an overly formal ritual system and mistranslated the Chinese term.
a: That the model was invented by Chinese officials to deceive Europeans.
x: The model was created by the historians Fairbank and Teng in the 1940s.
a: That it exaggerates the importance of trade in China's foreign relations.
x: Critics argue the opposite: the tribute language tends to hide how commercial China's ties were.
hint: Think about what "gong" meant in practice to Korea, Japan or Vietnam.
why: Perdue calls "gong" an inadequate translation of the practice and criticises the model as an overly formalized ritual system; other scholars stress that neighbours pursued their own agendas.
---
q: What did the New Qing History argue, against Ping-ti Ho?
a: That the Qing was a purely Chinese dynasty that abandoned its Manchu identity.
x: That is close to the sinicisation thesis that Ho defended.
a: That the Qing should not be considered part of Chinese history at all.
x: Mark Elliott says the school does not separate the Qing from "China".
a: That the Mongols, not the Qin, created the idea of a unified China.
x: That is Timothy Brook's argument in Great State, not the New Qing History's.
a*: That, read through Manchu-language archives, the Qing was an Inner Asian as well as a Chinese empire.
hint: Which archives did these historians add to the Chinese ones?
why: Beginning with Rawski's 1996 address, the school used Manchu sources to show a multi-ethnic empire ruling Inner Asia on its own terms.
```

## From 1839 to the Present

Here only the turning points are named. The First Opium War (1839–42) ended with the Treaty of Nanking and the cession of Hong Kong, as the chapter on The Opium Wars describes. The Taiping rebellion (1850–64) controlled about a third of China proper; the most widely cited death toll is 20 to 30 million, or 5 to 10 per cent of the population, while estimates of 73 to 100 million exist but are contested. Defeat by Japan in 1894–95 and the Boxer indemnity of 450 million taels in 1901 belong to the chapter on The Taiping Rebellion and the Late Qing. The examinations were abolished in 1905; the Wuchang Uprising of October 1911 led to a Republic on 1 January 1912, and the abdication of the six-year-old Puyi in February ended more than two thousand years of imperial rule. The years 1839 to 1949 are now framed as a "century of humiliation", a concept prominent in China's patriotic education.

On 1 October 1949 Mao proclaimed the People's Republic, and the Republic's government withdrew to Taiwan. The famine of the Great Leap Forward, with deaths estimated from about 15 million to 45 million or more (Frank Dikötter gives at least 45 million, and some estimates reach 55 million), and the Cultural Revolution are the subjects of the chapters on Maoism and The Cultural Revolution. Reform and opening began in 1978, the Tiananmen crisis came on 4 June 1989, Hong Kong returned in 1997 and Macau in 1999, and China joined the World Trade Organization in 2001 and later overtook Japan as the world's second-largest economy, as the chapter on China Today: the Economic Miracle and Infrastructural Revolution describes. The deep past still frames these events, from a party that speaks of escaping the dynastic cycle to a state that, on Brook's reading, inherited the imperial form of the Mongols and Manchus.

## Further exploration

- **Patricia Buckley Ebrey, *The Cambridge Illustrated History of China* (1996; 3rd ed. 2022).** The standard one-volume illustrated survey, from prehistory to the present.
- **Valerie Hansen, *The Open Empire: A History of China to 1600* (2000; 2nd ed. to 1800, 2015).** Premodern China seen through its contacts with the wider world.
- **Timothy Brook, *Great State: China and the World* (2019).** Argues that the Mongols, not the Qin, created the "great state" model of China.
- **Ge Zhaoguang, *What Is China? Territory, Ethnicity, Culture, and History* (trans. Michael Gibbs Hill, 2018).** A Fudan historian on how "China" has been defined.
- **Thomas J. Barfield, *The Perilous Frontier: Nomadic Empires and China, 221 BC to AD 1757* (1989).** The classic model of the steppe frontier.
- **Peter C. Perdue, *China Marches West: The Qing Conquest of Central Eurasia* (2005).** Qing expansion and the destruction of the Dzungars.
- **Kenneth Pomeranz, *The Great Divergence: China, Europe, and the Making of the Modern World Economy* (2000).** The Yangzi Delta and England compared.$mn_chinesehist_master$,
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
  select $mn_chinesehist_quiz$[
    {"type": "mcq", "prompt": "Roughly what share of the 4,000 or more distinct characters in the Shang oracle-bone script can scholars read today?", "options": ["Fewer than half", "Almost all of them", "None; the script is undeciphered", "Exactly three-quarters"], "answerIndex": 0, "explanation": "Estimates of the characters securely read run from about 1,200 to 2,000 of some 4,000 to 5,000; the majority remain undeciphered or disputed.", "id": "q1"},
    {"type": "mcq", "prompt": "Which historian called the dynastic cycle 'a major block to the understanding of the fundamental dynamics of Chinese history'?", "options": ["Ping-ti Ho", "Timothy Brook", "John K. Fairbank", "Naitō Konan"], "answerIndex": 2, "explanation": "Fairbank (writing with Reischauer) accepted the cycle only as a somewhat superficial political pattern above deeper change.", "id": "q2"},
    {"type": "mcq", "prompt": "What does Timothy Brook argue in Great State (2019)?", "options": ["That China's unity began with the Qin in 221 BCE", "That the tribute system was a purely ritual institution", "That the Qing was sinicised soon after 1644", "That China's sense of itself as a unified 'great state' derives from the Mongol yeke ulus"], "answerIndex": 3, "explanation": "Brook argues that the Ming, Qing, Republic and People's Republic inherited an imperial form built by the Mongols and Manchus.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is the census fall from about 53 million (755) to about 17 million (764) not read as a death toll of 36 million?", "options": ["Because the 764 census was forged by the Song", "Because much of the fall reflects the collapse of registration during the An Lushan rebellion", "Because the population actually rose in those years", "Because the 755 census counted foreigners only"], "answerIndex": 1, "explanation": "Scholars attribute much of the drop to lost registration; Matthew White revised his estimate to about 13 million, and Bielenstein called a literal reading 'comically naive'.", "id": "q4"},
    {"type": "open", "prompt": "How far did the imperial examinations make China a society open to talent?", "rubric": "A strong answer describes the system's span (Sui, 607, to 1905) and its narrowing to Zhu Xi's Neo-Confucianism under the Ming; sets out Ping-ti Ho's 'ladder of success' argument and Ho's figures showing the share of jinshi from families without degree holders falling from 47.5 per cent under the Ming to 19.1 per cent under the Qing; weighs this against the many excluded by lack of education, a pass rate estimated at about 1 per cent, and other routes to office such as purchase and nomination; and may note the system's influence on Korea, Vietnam and Britain.", "id": "q5"},
    {"type": "open", "prompt": "Was the Qing a Chinese empire, an Inner Asian empire, or both? Use the historiographical debate in your answer.", "rubric": "A strong answer contrasts Ping-ti Ho's sinicisation thesis (1967; 'In Defense of Sinicization') with the New Qing History begun by Evelyn Rawski's 1996 address and developed by Elliott, Crossley, Perdue and Millward from Manchu-language archives; notes Chinese reactions and Elliott's view that the school does not separate the Qing from 'China'; uses evidence such as the Qing definition of China as including Manchuria, Mongolia, Xinjiang and Tibet, the Dzungar conquest, and the doubling of territory; and may bring in Brook's Great State or Ge Zhaoguang's What Is China?.", "id": "q6"}
  ]$mn_chinesehist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/chinese-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
