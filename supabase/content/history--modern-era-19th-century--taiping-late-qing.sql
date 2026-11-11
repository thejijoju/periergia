-- The Taiping Rebellion and the Late Qing — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/the-taiping-rebellion-and-the-late-qing @ research/advanced/read.
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
    'history/modern-era-19th-century/the-taiping-rebellion-and-the-late-qing',
    'research',
    'advanced',
    'read',
    $mn_taiping_master$> **The deadliest civil war of the nineteenth century, and the dynasty that outlived it by half a century.** Between 1850 and 1864 a failed examination candidate named Hong Xiuquan, convinced that he was the younger brother of Jesus, built a Heavenly Kingdom that ruled much of the Yangzi valley from Nanjing, before it was destroyed by Chinese armies raised by provincial scholars such as Zeng Guofan. Somewhere around 20 to 30 million people died. This chapter follows that war and its fellow rebellions, then the Qing's long attempt at recovery under the Empress Dowager Cixi, through defeat by Japan, failed reform, and the Boxers, to the revolution of 1911 that ended more than two thousand years of imperial rule.

## An Empire Under Strain

Under the Qianlong Emperor (r. 1735–96) the Qing was at the height of its power. The historian Jonathan Spence titles his chapter on Qianlong's reign "Like the sun at midday", though signs of decay, such as the corruption of the emperor's favourite Heshen, were already visible.

The deeper pressure was people. China's population, about 150 million in 1700, doubled over the following century and stood at roughly 400 to 450 million by the eve of the Taiping war. Fast-ripening rice, New World crops such as sweet potatoes, and smallpox inoculation all played a part. "The population continues to grow, but the land does not," Qianlong himself remarked. The scholar **Hong Liangji** raised the same worries as his contemporary Malthus.

```quote
Flood, drought, and pestilence are the means of Heaven to temper the problem.
Hong Liangji · Zhi Ping Pian · 1793
```

The Qing taxed lightly and at fixed rates, so its revenue did not keep pace. The **White Lotus Rebellion**, a millenarian uprising in the mountain borderlands of central China from the mid-1790s, took eight years to crush; even an imperial decree later admitted that extortion by local officials had goaded the people into rebellion.

Foreign pressure then arrived from the sea. As the chapter on the Opium Wars describes, a first war ended in the Treaty of Nanjing of 1842, which opened five ports and ceded Hong Kong Island, and a second ended in 1860 with an Anglo-French force burning the Old Summer Palace and the Xianfeng Emperor in flight. But for most Chinese people in the 1850s, the catastrophe that reshaped their lives came from within.

## Hong Xiuquan's Heavenly Vision

**Hong Xiuquan** was a Hakka, born in 1814 in Hua county near Guangzhou. He failed the first-level civil-service examination, held in Guangzhou, again and again; pass rates were tiny. In Guangzhou in 1836 he was handed *Good Words to Exhort the Age*, Christian tracts written by **Liang Fa**, a Chinese convert. After his third failure, in 1837, he suffered a breakdown and dreamed of Heaven, where a father with a golden beard gave him a sword to slay demons, aided by an "elder brother". After his fourth and final failure, in 1843, he read the tracts closely and concluded that he was the son of God and the younger brother of Jesus, sent to destroy the worship of demons.

Meanwhile **Feng Yunshan** had founded a God Worshipping Society in Guangxi, which by 1850 had more than 10,000 followers. From 1848 an illiterate charcoal burner, **Yang Xiuqing**, spoke in trance as the voice of God the Father. Hong rewrote the Bible and presented his faith as a restoration of China's ancient worship of Shangdi. One historian calls the result a "dynamic new Chinese religion": Taiping Christianity. Its first members were Hakka, Guangdong locals, and Zhuang, many of them miners; almost none were landlords, and the landed gentry largely sided with the Qing.

## The Heavenly Kingdom at War

Around the turn of 1851 a rebel army of about 10,000 routed Qing forces at Jintian in Guangxi, and on 11 January 1851 Hong proclaimed himself Heavenly King of the **Taiping Tianguo**, the Heavenly Kingdom of Great Peace. Because they refused the queue, Qing officials called them the "long-haired bandits"; the Taiping in turn called the Manchus "demons". They marched north and captured **Nanjing** on 19 March 1853, renaming it Tianjing, the "Heavenly Capital". On taking the city they killed its Manchu population, about 30,000 to 40,000 people by different counts.

Then the leadership turned on itself. In September 1856, on Hong's orders, Wei Changhui and Qin Rigang killed the East King Yang Xiuqing, his family, and followers; more than 20,000 people died in the purges (some accounts say over 27,000), and Hong then executed the killers. This **Tianjing Incident** is widely seen as the turning point of the war.

Hong's cousin **Hong Rengan**, who had lived in Hong Kong and worked with missionaries, reached Nanjing in 1859 and became effectively prime minister. His *New Treatise on Aids to Administration* proposed railways, steamships, banks, and newspapers. In 1860–61 Taiping armies overran southern Jiangsu and then Zhejiang, the richest region of the empire, but were repulsed from Shanghai.

The Western powers at first stayed officially neutral, and visiting missionaries were disillusioned; one saw "no signs of anything resembling Christianity" in Nanjing. After the Taiping refused to spare Shanghai and took Ningbo in December 1861, Britain and France intervened in a limited way. The **Ever Victorious Army**, Chinese soldiers under Western officers, was later commanded by the British officer Charles Gordon. Historians still debate why Britain shifted from armed neutrality to intervention, whether it wanted a weak Qing or a stable one for trade, and how decisive that help was.

## Life in the Heavenly Kingdom

Opium, gambling, tobacco, alcohol, polygamy and concubinage, slavery, and prostitution were banned, some on pain of death. Footbinding was forbidden; Hakka women had never bound their feet. Buddhist and Confucian books and temples were destroyed or converted, and the libraries of the Yangzi delta were almost wiped out.

Women fought in large numbers in the early years, unusually for a nineteenth-century army, though far fewer after 1853; some became leaders, among them **Hong Xuanjiao**, known as Hong's sister, Su Sanniang, and Qiu Ersao. A later and disputed story holds that the Taiping held examinations for women for the first time in Chinese history, and that a Nanjing woman, Fu Shanxiang, passed and served at the East King's court. Yet the sexes were strictly separated in their own camps, and until 1855 even married couples could not live together. Hong himself lived secluded in his palace from 1853 with many women in his inner chambers.

The **Land System of the Heavenly Dynasty**, promulgated in 1853, abolished private landownership in principle. Land was to be allotted equally to individuals, regardless of sex, and society organised in units of twenty-five families, each with a granary and a church. It was never systematically carried out, largely because of continuous war; in practice existing landholding and taxes often stayed in place.

## Zeng Guofan and the Fall of Nanjing

The Qing's regular armies could not stop the Taiping. The dynasty was saved by Han Chinese scholar-officials. **Zeng Guofan**, a Hunanese scholar, was at home mourning his mother in 1852 when he was ordered to raise local forces. His **Xiang Army** grew out of local militia and was paid for by gentry, merchants, and provincial transit taxes rather than by Beijing. Its soldiers were loyal to their commanders. His pupil **Li Hongzhang** raised the Huai Army from Anhui in 1862, and Zuo Zongtang led a third, the Chu Army.

The Xiang Army took Anqing in September 1861 after a year-long siege, helped by a British-enforced blockade on rice sales to the rebels; starvation and cannibalism were reported. Nanjing was besieged from May 1862. Hong ordered his people to eat "manna", ate weeds himself, fell ill, and died on 1 June 1864; whether he took poison is uncertain. On 19 July Qing forces mined the wall and stormed the city, which burned for a week. Zeng's reports claimed that 100,000 or more rebels were killed (some accounts give 200,000 to 300,000); the true toll, including civilians, is unknown. Hong Rengan, executed that November, was the only Taiping prince who never recanted.

## Counting the Dead, Naming the War

There was no census, and only about a tenth of Taiping records survive, so every figure is an estimate. The most widely cited range is **20 to 30 million dead**, roughly 5 to 10 per cent of the population, most of them from famine and plague rather than in battle. Some estimates run to 70 million or more; those figures count famine, flight, and lost births differently, are poorly sourced, and are contested. Both sides committed massacres, and the Xiang Army used scorched-earth tactics and refused to take prisoners.

Even the name is disputed. Qing sources spoke of rebellion and chaos; the People's Republic calls it the "Taiping Heavenly Kingdom Movement"; the Chinese historian Jian Youwen called it a "revolutionary movement"; Jürgen Osterhammel speaks of the "Taiping Revolution". Stephen Platt (2012) and Tobie Meyer-Fong (2013) have argued that "rebellion" presumes the Qing's legitimacy and preferred "civil war". Zeng Guofan's memory is as divided: condemned as a traitor who served a foreign dynasty, he was praised by both Mao Zedong and Chiang Kai-shek.

## An Empire of Rebellions

The Taiping war was not the only one. In the north the **Nian Rebellion** (1851–1868), triggered partly by Yellow River floods, fought under the slogan "kill the rich and aid the poor". In Guangdong the Punti–Hakka Clan Wars killed between 500,000 and more than a million people. Spence argues that a key reason for the Taiping defeat was their failure to coordinate with these other rebellions.

Muslim communities rose too. In Yunnan, after an anti-Muslim massacre in Kunming in 1856, **Du Wenxiu** ruled a "Pacified South State" from Dali as Sultan Sulayman until 1872, using anti-Manchu rather than anti-Han rhetoric; up to a million people died in Yunnan. In the northwest the **Dungan Revolt** (1862–1877) brought massacres of Han by Hui and of Hui by Han, with war deaths estimated, very high, at 8 to 12 million. Zuo Zongtang's armies crushed it and went on to reconquer Xinjiang, which became a province in 1884.

```checkpoint
q: Who did most to defeat the Taiping?
a*: Han Chinese scholar-officials such as Zeng Guofan and Li Hongzhang, with regional armies paid for locally.
a: The Manchu Eight Banners, the dynasty's regular army.
x: The Banners and Green Standard troops failed to stop the Taiping; that is why new armies were needed.
a: The Ever Victorious Army acting alone.
x: The Western-officered force fought around Shanghai, but the main campaigns, such as Anqing and Nanjing, were won by the Xiang Army.
a: The Nian rebels, who turned against the Taiping.
x: The Nian sometimes cooperated with the Taiping; they were themselves crushed by Li Hongzhang and Zuo Zongtang.
hint: Think of the Xiang and Huai armies.
why: The regional armies saved the dynasty but shifted military power from Beijing to provincial leaders whose soldiers were loyal to their commanders.
---
q: What does the most widely cited estimate say about the Taiping war's death toll?
a: About 2 million, almost all killed in battle.
x: The standard range is far higher, and most deaths came from famine and plague.
a: Exactly 73 million, according to the Qing census.
x: There was no census; figures of 70 million or more are poorly sourced and contested.
a*: Roughly 20 to 30 million, mostly from famine and plague, though every figure is an estimate.
a: Around 500,000, the same as the Punti–Hakka Clan Wars.
x: The Punti–Hakka wars alone killed 500,000 to over a million; the Taiping war was far deadlier.
hint: Think of what killed most people, and of the missing records.
why: With no census and few surviving Taiping records, historians give the toll as a range.
```

## Self-Strengthening

In 1861 a de facto foreign ministry, the Zongli Yamen, was created, and the reign of the boy Tongzhi Emperor (1861–1875) gave its name to the **Tongzhi Restoration**, an effort to restore the Confucian order while adopting practical Western techniques. The Imperial Maritime Customs, run by foreign inspectors under Robert Hart, raised revenue for arsenals and schools.

Zeng and Li founded the **Jiangnan Arsenal** in Shanghai in 1865, and Zuo Zongtang planned the Fuzhou Navy Yard. Government-supervised steamship, mining, and textile companies followed. From 1872 the **Chinese Educational Mission** sent 120 boys to New England under Yung Wing; conservatives had them recalled in 1881. Li Hongzhang, who launched many of the later projects and built the Beiyang Fleet, was called by foreigners the "Bismarck of the East".

Historians divide over the results. Immanuel Hsu and others see the movement as superficial and contrast it with Meiji Japan, whose background the chapter on the Tokugawa Shogunate describes. Luke Kwong argued that it was meant only as adaptive reform and should not be judged a failure. In the Sino-French War of 1884–1885 the Qing armies performed better than in their other nineteenth-century wars. Mary Wright called the Restoration "the last stand of Chinese conservatism", but also credited its leaders with reviving the dynasty for another sixty years.

{{image: Empress Dowager Cixi | The Empress Dowager Cixi, who dominated the Qing court from 1861 until her death in 1908.}}

## Cixi: Despot or Scapegoat?

**Cixi**, a Manchu, was a concubine of the Xianfeng Emperor and mother of his only surviving son. In the Xinyou Coup of 1861 she, the Empress Dowager Ci'an, and Prince Gong ousted the eight regents, and she ruled "behind the curtain". When Tongzhi died in 1875 she installed her nephew as the Guangxu Emperor, and after formally retiring in 1889 she remained decisive, ending the reforms of 1898 and keeping Guangxu under house arrest until his death in November 1908, a day before her own. Tests in 2008 found arsenic in Guangxu's remains; who poisoned him is not proven.

The image of a cruel, extravagant reactionary owes much to Bland and Backhouse's *China Under the Empress Dowager* (1910), based on gossip. In the 1970s Sue Fawn Chung became the first scholar writing in English to base an account on court documents, and Jung Chang's biography of 2013 offers a strongly favourable account that others have criticised. The sharpest dispute concerns a famous story: that before 1894 Cixi diverted money meant for the navy to the Summer Palace, symbolised by its Marble Boat, and so helped lose the war with Japan. Defenders, following Chang, point instead to cuts in naval funding made by Guangxu and the official Weng Tonghe. Neither charge nor acquittal is settled; the real question is whether one woman has been made to carry the blame for a whole system's failures.

## Defeat by Japan and the Hundred Days

In 1894 a peasant rebellion in Korea drew in Qing and Japanese troops. In the war that followed, Japan crushed the Beiyang Fleet at the Yalu River and took Port Arthur, followed by a massacre for which estimates range from 2,600 to 20,000 or more. The Treaty of Shimonoseki of April 1895 recognised Korea's independence, ceded Taiwan and the Penghu Islands, and imposed an indemnity of 200 million taels. In 1897–1898 the European powers and Russia scrambled for leased territories.

In April 1895 examination candidates led by the scholar **Kang Youwei** petitioned against the treaty in what is considered China's first modern political movement. Between June and September 1898 the Guangxu Emperor issued reform edicts on education, examinations, administration, and the army. Their main lasting result was the Imperial University of Peking. On 21 September Cixi ended the experiment. Kang and his student, the journalist **Liang Qichao**, escaped to Japan; six reformers were beheaded in Beijing. One of them, Tan Sitong, is remembered for words about reform and bloodshed.

```quote
Seen from the world, no successful reforms were made without bleeding. ... If there is anyone to be, just start from me.
Tan Sitong · one English rendering · September 1898
```

## The Boxers

In Shandong, drought, floods, and resentment of missionaries who protected their converts in lawsuits gave rise to the **Society of Righteous and Harmonious Fists**. Its members practised spirit possession and claimed invulnerability to bullets; their slogan, from 1898, was "Support the Qing, destroy the foreigners". Young women joined as the Red Lanterns, led by Lin Hei'er, the "Holy Mother of the Yellow Lotus", even though Boxer belief treated adult women as polluting. The historian Joseph Esherick calls "Boxer Rebellion" a misnomer, since the Boxers never rebelled against the Qing.

After foreign forces stormed the Dagu forts in June 1900, Cixi issued a de facto declaration of war on the foreign powers. For fifty-five days the foreign legations in Beijing were besieged, with about 3,000 Chinese Christians sheltering inside. One estimate puts the dead in north China at 32,000 Chinese Christians and some 200 missionaries. An eight-nation force, its largest contingent Japanese, relieved Beijing in August. Cixi fled to Xi'an, and foreign troops looted the capital and carried out punitive expeditions with summary executions, rape, and village burnings. Li Hongzhang, Zhang Zhidong, and other southern viceroys refused the war edict and kept their provinces neutral, a striking refusal by Han regional authorities to aid the court.

The Boxer Protocol of 1901, signed by Li shortly before his death, imposed an indemnity of 450 million taels, payable with interest over thirty-nine years. Whether the Boxers were anti-imperialist patriots or xenophobes has long divided textbooks in the People's Republic and elsewhere.

## The Last Decade

After 1901 Cixi backed the more radical **New Policies**. The civil service examinations were abolished in 1905, modern schools opened, and students went abroad, mostly to Japan. The court promised a constitution and elected provincial assemblies in 1909, but in May 1911 its new cabinet, eight or nine of thirteen members Manchu, alienated the constitutionalists. Hsu dismissed the New Policies as largely "a noisy demonstration"; Douglas Reynolds treats them as a revolution in their own right.

Others had given up on the dynasty. **Sun Yat-sen**, a doctor educated in Honolulu and Hong Kong, came from the same area as Hong Xiuquan and reportedly identified with him; he founded the Revive China Society in 1894, and some Taiping veterans joined the anti-Qing cause. In Tokyo in 1905 he helped found the Revolutionary Alliance, funded through overseas Chinese branches, whose uprisings repeatedly failed. The feminist **Qiu Jin**, who wrote against footbinding and forced marriage, was beheaded in 1907 at thirty-one after a failed plot.

## 1911

In 1911 the court moved to nationalise provincial railway companies with foreign loans, and Sichuan erupted in protest. On 9 October a bomb went off by accident in a revolutionary workshop in Hankou, and the next day New Army units rose in Wuchang. Sun, in the United States, read about it in the newspapers. Provinces declared independence, and revolutionaries massacred Manchu garrisons, with an estimated 10,000 to 20,000 killed in Xi'an alone. On 1 January 1912 the Republic of China was proclaimed in Nanjing with Sun as provisional president; he agreed to give way to the Qing prime minister Yuan Shikai if Yuan secured the abdication. On 12 February 1912 the six-year-old emperor Puyi abdicated, ending 267 years of Qing rule.

## Interpreting the Late Qing

Philip Kuhn's study of the gentry militias helped shift attention to change originating within Qing society, and Kenneth Pomeranz argued that the Yangzi Delta was comparable to England as late as about 1800, a challenge to the old image of a stagnant, closed China that the chapter on Ming China and the Voyages of Zheng He also questions for an earlier era; others answer that England was already ahead. The Chinese Communist Party read the Taiping as proto-communist peasant revolutionaries, while Paul Cohen's study of the Boxers separates the event, the experience of those who lived it, and the myths later built on it. Together these approaches show a dynasty that survived internal collapse and foreign aggression for half a century, until many Chinese concluded it could not be saved.

```checkpoint
q: Why does Joseph Esherick call "Boxer Rebellion" a misnomer?
a: Because the Boxers were organised by foreign missionaries.
x: The Boxers attacked missionaries and Chinese Christians.
a*: Because the Boxers never rebelled against the Qing; their slogan was "Support the Qing, destroy the foreigners".
a: Because the uprising took place in Japan.
x: The Boxers arose in Shandong and besieged the legations in Beijing.
a: Because the Boxers fought for a Taiping restoration.
x: The Taiping had been destroyed decades earlier; the Boxers backed the Qing.
hint: Think of the Boxers' slogan.
why: The name reflects how foreigners saw the movement, not what its members fought for.
---
q: How do historians disagree about the Empress Dowager Cixi?
a: All historians agree that she personally lost the war with Japan by spending the navy's money.
x: The navy-funds story is contested; some point to cuts made by Guangxu and Weng Tonghe.
a: Historians agree that she supported the Hundred Days' Reform throughout.
x: She ended the reform in September 1898 and placed Guangxu under house arrest.
a: Historians agree that she never held real power.
x: She ruled "behind the curtain" from 1861 and remained decisive even after retiring in 1889.
a*: Some follow an older image of a cruel reactionary, while revisionists such as Sue Fawn Chung and Jung Chang see a pragmatist made into a scapegoat, and the navy-funds story remains disputed.
hint: Think of where the hostile image came from.
why: Much of Cixi's reputation rests on a 1910 book built on gossip, which later historians have challenged with court documents.
```

## Further exploration

- **Jonathan D. Spence, *God's Chinese Son: The Taiping Heavenly Kingdom of Hong Xiuquan* (1996).** The classic narrative of Hong's visions and his kingdom.
- **Stephen R. Platt, *Autumn in the Heavenly Kingdom: China, the West, and the Epic Story of the Taiping Civil War* (2012).** The war in its global setting, centred on Hong Rengan and Zeng Guofan.
- **Philip A. Kuhn, *Rebellion and Its Enemies in Late Imperial China: Militarization and Social Structure, 1796–1864* (1970).** How gentry-led militias defeated the rebels and changed the state.
- **Tobie Meyer-Fong, *What Remains: Coming to Terms with Civil War in 19th Century China* (2013).** Survivors, loss, and the commemoration of the dead.
- **Joseph W. Esherick, *The Origins of the Boxer Uprising* (1987).** The social roots of the Boxers in western Shandong.
- **Paul A. Cohen, *History in Three Keys: The Boxers as Event, Experience, and Myth* (1997).** The Boxers as event, lived experience, and myth.
- **Henrietta Harrison, *The Missionary's Curse and Other Tales from a Chinese Catholic Village* (2013).** A Shanxi Catholic village across three centuries, including 1900.$mn_taiping_master$,
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
  select $mn_taiping_quiz$[
    {"type": "mcq", "prompt": "What did Hong Xiuquan come to believe after his final examination failure in 1843?", "options": ["That he was the son of God and the younger brother of Jesus, sent to destroy the worship of demons", "That he was the reincarnation of Confucius", "That he was the rightful heir of the Qianlong Emperor", "That he was a Buddhist saint sent to restore the White Lotus"], "answerIndex": 0, "explanation": "Reading Liang Fa's Christian tracts in the light of his earlier vision, Hong concluded that he was God's son and Jesus's younger brother, and began the movement that became the Taiping Heavenly Kingdom.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the Taiping Land System of 1853 is accurate?", "options": ["It was fully carried out across Taiping territory", "It restored land to the landed gentry", "It abolished private landownership in principle and allotted land regardless of sex, but was never systematically implemented", "It was copied from the Treaty of Nanjing"], "answerIndex": 2, "explanation": "The Land System promised equal allotment to individuals, men and women alike, in units of twenty-five families, but continuous war meant it was never systematically applied.", "id": "q2"},
    {"type": "mcq", "prompt": "How was Zeng Guofan's Xiang Army mainly financed?", "options": ["By loans from British banks", "By the Boxer indemnity", "By the imperial treasury in Beijing", "By local gentry, merchants, and provincial transit taxes"], "answerIndex": 3, "explanation": "The Xiang Army grew from local militia and was paid for locally rather than by Beijing, and its soldiers were loyal to their commanders.", "id": "q3"},
    {"type": "mcq", "prompt": "During the Boxer crisis of 1900, what did Li Hongzhang, Zhang Zhidong, and other southern viceroys do?", "options": ["They led their armies to relieve the Boxers in Beijing", "They refused the court's war edict and kept their provinces neutral", "They joined the Eight-Nation Alliance", "They declared independence from the Qing"], "answerIndex": 1, "explanation": "The Mutual Protection of the Southeast was a striking refusal by most Han regional authorities to aid the court.", "id": "q4"},
    {"type": "open", "prompt": "Why do historians give the Taiping war's death toll as a range, and why do some prefer to call it a civil war rather than a rebellion?", "rubric": "A strong answer notes that there was no census and only about a tenth of Taiping records survive; that the most cited range is 20 to 30 million, mostly from famine and plague; that higher figures of 70 million or more count famine, flight, and lost births differently and are contested; and that Meyer-Fong and Platt argued that 'rebellion' presumes the Qing's legitimacy, while others use 'movement' or 'revolution'.", "id": "q5"},
    {"type": "open", "prompt": "Was the Self-Strengthening Movement a failure? Use evidence from the chapter, including the debate about Cixi, to support your view.", "rubric": "A strong answer weighs achievements (the Zongli Yamen, the Jiangnan Arsenal, merchant companies, the Educational Mission, a better showing in the Sino-French War, survival of the dynasty for another half-century as Mary Wright argued) against criticisms (Hsu's view that it was superficial, the comparison with Meiji Japan, defeat by Japan in 1894–95), and treats the claim that Cixi diverted navy funds to the Summer Palace as disputed rather than settled, noting the counter-argument about cuts by Guangxu and Weng Tonghe and the influence of Bland and Backhouse's gossip-based book.", "id": "q6"}
  ]$mn_taiping_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/the-taiping-rebellion-and-the-late-qing', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
