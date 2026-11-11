-- Ming-Qing History — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/ming-qing-history @ research/advanced/read.
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
    'history/regional-histories/asia/ming-qing-history',
    'research',
    'advanced',
    'read',
    $mn_mingqing_master$> **China's last two dynasties, seen from below.** Between 1368 and 1912 the Ming and then the Qing ruled China. Other chapters tell the story of their emperors, voyages and wars. This chapter looks instead at how people lived and argued in these centuries: a founder's dream of self-sufficient villages overtaken by silver, cotton and commercial printing; late-Ming novels, philosophers and women writers; the Manchu conquest and the queue; a multiethnic empire; the High Qing state and its censors; a population that roughly doubled in the eighteenth century; and the strains that set the stage for the crises of the nineteenth. Throughout, it sets out how historians in China and elsewhere disagree.

## Two Dynasties, One Long Era

The narrative of reigns is told elsewhere. The chapter on Chinese History gives the long view; the chapter on Ming China and the Voyages of Zheng He covers the founding of the Ming, the Yongle emperor, the voyages and the rebuilt Great Wall; and the chapters on The Opium Wars and The Taiping Rebellion and the Late Qing carry the story from the 1790s to 1912.

Many patterns traced here ran across the change of dynasty in 1644, and some began with one man. **Zhu Yuanzhang**, born in 1328 into a peasant family in what is now Anhui, lost his parents and a brother to an epidemic in 1344, became a begging novice monk, and joined the Red Turban rebels in 1352. As the Hongwu emperor (r. 1368–1398) he imagined a society of self-sufficient farming villages. Under the *lijia* system, introduced empire-wide in 1381, households were grouped into units of 110, whose ten wealthiest families supplied headmen in rotation to collect taxes and organise labour service. The Yellow Registers recorded households; the Fish-Scale Registers recorded every parcel of land and its tax. Soldiering became a hereditary household obligation under the *weisuo* system, with each military family supplying one soldier per generation and garrisons farming to feed themselves.

Hongwu kept the land tax low, gave land to peasants, banned slavery and the slave trade, and returned hundreds of thousands of monks and nuns to lay life. He distrusted merchants, forcibly moving wealthy families, fixing prices and banning travel beyond 100 *li* (about 58 km) without a permit. He was also brutal: after executing his chancellor in 1380 he abolished the post and governed the ministries directly, and about 100,000 people, by common estimates, died in his political purges. His census of 1393 counted about 60.5 million people, though the historian Timothy Brook thinks the real figure was closer to 75 million: the census was a fiscal count that people tried to evade. Michael Szonyi's study of Fujian genealogies shows military families negotiating with these demands rather than simply obeying.

## Silver and the Single Whip

Hongwu's world of taxes paid in grain and labour did not last. Through the sixteenth century local officials converted obligations into payments in silver, and in 1580 the senior grand secretary **Zhang Juzheng**, who governed for the young Wanli emperor, extended this **Single Whip** reform across the empire, commuting land tax, poll tax, labour service and local levies into a single silver payment. Conversion was never complete, but by the end of the Ming about 70 per cent of labour obligations in the south, and about half in the north, had become silver surcharges.

Taxing in silver made China hungry for the metal, and supply came from Japan and Spanish America. From 1565 to 1815 the Manila galleons carried Chinese goods across the Pacific to Acapulco and brought American silver back. All figures here are estimates. Brook puts official domestic silver production in the mid-fifteenth century at 22–30 tons a year, against American imports alone of 150–345 tons a year in 1597–1602; Wakeman reckoned that at least 250–265 tons a year entered China in the first third of the seventeenth century. Estimates of the share of all American silver that ended up in China run between a third and a half. Richard von Glahn, the leading specialist, calls 1550–1650 China's "silver century". This is one reason historians now reject the old image of an isolated Ming, a "myth" examined in the chapter on Ming China and the Voyages of Zheng He; the chapter on The Columbian Exchange and the First Global Economy follows the silver from the American side.

Did silver also bring the Ming down? In the 1630s and 1640s silver became scarce and dear: by Jonathan Spence's figures a tael of silver that had cost 1,000 copper coins cost twice that by 1640 and three times that by early 1643, crushing peasants who sold their crops for copper but paid taxes in silver. Flynn and Giráldez, who date the "birth" of world trade to 1571, and many surveys stress the silver flow, and an older "silver crisis" thesis, citing Japan's closure in 1639 and Spanish restrictions, linked its faltering to the Ming collapse. Von Glahn, however, argued in 1996 that Chinese demand for money, not swings in imports, drove the trade, and he and Brook doubt that a silver shortage was the decisive cause of the Ming's fall.

## Jiangnan and the Commercial Boom

By 1600 China held perhaps 160–200 million people, possibly more; scholars' estimates range from Fairbank's 160 million to Mote's 231 million. Its most commercial region was **Jiangnan**, roughly southern Jiangsu and Anhui and Zhejiang, with Suzhou as its hub. Suzhou grew from 339,000 people in the mid-sixteenth century to 650,000 by its end. Rice, cotton and silk were the great long-distance trades; Songjiang prefecture was the hub of cotton cloth, and in some Jiangnan districts cotton overtook rice as the main crop. Merchants from Huizhou dominated the salt trade and much long-distance wholesaling. The porcelain town of Jingdezhen grew from about 50 kilns in the fifteenth century to about 300 in the late sixteenth, most of them privately run. Private silk workshops employed up to several hundred wage workers.

Officially, merchants remained despised; none of the 312 *jinshi* graduates of 1544 came from a merchant family. A gazetteer writer contrasted an idealised early Ming with his own day:

```quote
Those who went out as merchants became numerous, and the ownership of land was no longer esteemed. As men matched wits using their assets, fortunes rose and fell unpredictably.
Zhang Tao · Gazetteer of Sheh County · 1609
```

## Print, Novels and Dissent

The boom had a cultural side. By the early sixteenth century printing had become the main way texts circulated, and during the Wanli era (1573–1620) rising literacy, urban readers and cheaper production created unprecedented growth in commercial publishing. "Bookshop boats" plied the waterways. About two-thirds of output was non-literary, but this was also the age of the great novels: *Water Margin*, in print by the mid-to-late sixteenth century; *Journey to the West*, attributed to Wu Cheng'en; and *Jin Ping Mei*, published around 1610 under a pseudonym, a novel of manners set in a merchant's household. Feng Menglong published 120 vernacular stories in 1620–1627.

Thought grew restless too. The philosopher **Li Zhi** (1527–1602), building on Wang Yangming, attacked the orthodoxy of Zhu Xi, wrote that "the childlike heart-mind is the genuine heart-mind", and denied that women were inferior to men in native intelligence. Accused of heresy, he killed himself in prison in 1602. The Jesuit **Matteo Ricci**, who in 1601 became the first European to enter the Forbidden City, translated the first parts of Euclid with the scholar-official **Xu Guangqi**, who also experimented with sweet potatoes and wrote a treatise on agriculture.

{{image: Matteo Ricci | Matteo Ricci, the Jesuit who reached Macau in 1582 and in 1601 became the first European to enter the Forbidden City.}}

At court, politics soured. From the 1590s the Wanli emperor let eunuchs collect provincial taxes, and from 1596 sent eunuch mining-tax commissioners into the provinces before abandoning the scheme in 1606. Under the Tianqi emperor the eunuch Wei Zhongxian had critics from the Donglin faction, named after an academy in Wuxi, tortured to death.

## Women in the Inner Quarters

For a long time Ming and Qing women appeared in histories mainly as victims. Since the 1980s a cohort of scholars, among them Susan Mann, Dorothy Ko, Ebrey and Furth, has rewritten that picture by reading what women themselves wrote.

**Footbinding** is the hardest test. Practised since the Song, it became more severe and widespread by the late Ming and reached the lower classes under the Qing. The Manchus, whose women did not bind, banned it in 1636, 1638 and 1664, but few Han complied and the Kangxi emperor gave up in 1668. Some estimates put the share of Chinese women with bound feet by the nineteenth century at 40–50 per cent, though figures vary widely by region and group. May Fourth reformers and feminist critics saw violence against women. Dorothy Ko, in *Cinderella's Sisters* (2005), argues that binding was understood as attire and a mark of civility and femininity, carried out by women on girls; an encyclopedia of 1591 classed it under "Female Adornments" with hairstyles and ear-piercing, and elite women's writings show pride as well as pain. Ko does not deny the suffering, but she challenges the idea that binding was only male erotic coercion. Laurel Bossen and Hill Gates argue instead that it kept girls at hand-spinning and weaving, and declined when factory textiles destroyed that work.

The **cult of widow chastity** raises similar questions. In the Ming chaste widows became heroes, honoured with arches, shrines and biographies, and widow suicide rose sharply. The Qing made chastity awards a bureaucratic tool of moral reform. Mark Elvin and Susan Mann documented the steep rise in honoured widows; Mann tied the "cult" to the Manchus' wish to display Confucian credentials and stressed women's own despair; T'ien Ju-k'ang linked suicides to the anxieties of men who failed the examinations; Jennifer Holmgren pointed to widows' shrinking property rights.

Yet a Ming saying held that "a woman without talent is virtuous" at the very moment women's writing was booming. Anthologies of women's poetry began in 1557, and editors may even have forged women's poems to meet demand. The courtesan-poet Liu Rushi urged her husband, the scholar Qian Qianyi, to die for the Ming after 1644 (he instead aided the resistance); Qin Liangyu held Ming military rank in Sichuan; Wang Zhenyi (1768–1797) wrote on astronomy and lunar eclipses; and the Qing poet Gu Taiqing, wife of a Manchu prince, wrote the earliest extant Chinese novel by a woman. Mann's *Precious Records* (1997) showed elite women as writers and actors rather than mere victims of Confucian patriarchy.

```checkpoint
q: Why did taxing in silver tie Ming China to the wider world?
a*: Because commuting taxes into silver raised demand that was met largely by Japanese and American silver, much of it via the Manila galleons.
a: Because the Ming mined all the silver it needed at home.
x: Domestic production was small compared with imports from Japan and the Americas.
a: Because the Single Whip reform banned trade with foreigners.
x: The reform concerned taxation, not a ban on trade.
a: Because Hongwu's lijia system required silver payments from 1381.
x: Hongwu's system relied mainly on taxes in kind and labour service.
hint: Think of where the metal came from after the Single Whip reform.
why: Silver linked Chinese taxpayers to mines in Japan and Spanish America, which is why historians reject the image of an isolated Ming.
---
q: How does Dorothy Ko interpret footbinding?
a: As a practice forced on women only by male desire, with no role for women themselves.
x: Ko challenges exactly this reading, while not denying the pain.
a: As a Manchu custom imposed on the Han after 1644.
x: Manchu women did not bind, and the Qing tried to ban the practice.
a*: As attire and a marker of civility and femininity, carried out by women on girls, whose writings show pride as well as pain.
a: As a way of keeping girls at spinning and weaving.
x: That is the argument of Laurel Bossen and Hill Gates.
hint: Think of the 1591 encyclopedia's category "Female Adornments".
why: Ko's revisionism asks historians to see women as actors within the practice, without denying its suffering.
```

## Conquest: Famine, Hair and Massacre

The Ming fell amid the cold and drought of the Little Ice Age. Famine struck the north, and peasant rebel bands, active from 1628, grew huge after the famines of 1640–1642. In April 1644 Li Zicheng's rebels took Beijing and the last Ming emperor hanged himself; in May the general Wu Sangui went over to the Manchus at the Shanhai Pass. The conquest that followed took until 1683 and, by Peter Nolan's estimate, cost some 25 million lives.

The official *Ming History* claimed that the rebel Zhang Xianzhong killed 600 million people in Sichuan, an impossible number; historians estimate up to a million. At Yangzhou in May 1645 Qing forces sacked the city after its defence by Shi Kefa. Wang Xiuchu's eyewitness *A Record of Ten Days in Yangzhou* gives over 800,000 victims, a figure considered likely exaggerated, and his own diary shows the killing ended on the sixth day.

Then came hair. On 21 July 1645 the regent Dorgon ordered all Han men to shave their foreheads and wear the Manchu queue, on pain of death: "keep the hair and lose the head, or keep the head and lose the hair". What offended most was the shaving. Resistance was crushed in massacres such as the three at Jiading, carried out largely by Han defectors. Enforcement took up to ten years, and the queue remained a sign of submission until 1912. The writer Lu Xun later remarked that the Chinese of those days revolted "not because the country was on the verge of ruin, but because they had to wear queues". On the coast, edicts of 1661, 1664 and 1679 forced whole populations inland to cut off Koxinga's loyalists and, after his death, his heirs' Zheng regime on Taiwan. Loyalist thinkers such as Huang Zongxi, whose *Waiting for the Dawn* condemned selfish autocracy, and Gu Yanwu reflected on defeat.

## Banners and a Multiethnic Empire

The conquerors were organised in **Eight Banners**, created by Nurhaci in 1601 and 1615 and extended to Mongol and Han banners between 1635 and 1642. By Elliott's estimate about two million people lived in the banner system by 1644. Afterwards bannermen received stipends, land and housing, lived in garrisons and took over Beijing's inner city, while Han Green Standard troops did most of the routine military governing.

The Qing ruled Han China through a Ming-style bureaucracy, and Mongols and Tibetans through a separate Court of Colonial Affairs, the Lifan Yuan. It ruled Tibet from 1720, as a protectorate or a subordinate part of the empire depending on the scholar, and conquered the Dzungars in 1755–1759, with catastrophic loss of life described in the chapter on Central Asia and the Steppe. The Qing called its state "China" (*Zhongguo*, in Manchu *Dulimbai Gurun*) and counted Manchuria, Mongolia, Xinjiang and Tibet within it.

Was this a Chinese empire or an Inner Asian one? The **New Qing History**, associated with Rawski (1996), Elliott, Crossley, Perdue and Millward, challenges the older view that the Manchus ruled because they were sinicised, absorbed into Chinese culture. Ping-ti Ho replied in 1998 with "In Defense of Sinicization". The school has drawn criticism in China, which intensified under Xi Jinping, while Zhao Gang and Yuanchong Wang argue that the Qing presented itself as "China"; Elliott insists the school does not separate the Qing from China. The historian Ge Zhaoguang's *What Is China?* examines the Ming–Qing making of "China" and its frontiers.

## The High Qing State

Under the Kangxi (r. 1661–1722), Yongzheng (r. 1722–1735) and Qianlong (r. 1735–1796) emperors, the Qing state reached its height; the chapter on The Rise of Absolutism sets Kangxi beside Louis XIV. In about 1712 Kangxi froze the quota of the labour-service tax, promising never to raise it. Yongzheng merged that tax into the land tax, which the historian Lin Qian sees as continuing the Single Whip by lightening the burden on the landless, and he turned an informal "meltage fee" into a formal surcharge to pay local officials and curb extortion. Whether he came to the throne legitimately is disputed; some Chinese historians, among them Qin Hui, believe he forged the succession edict.

Yongzheng also issued edicts from 1723 abolishing the hereditary "mean" status of several groups, including the musician households of Shanxi and Shaanxi, the "fallen people" of Zhejiang and the boat people of the south. The legal line between "good" and "mean" people, which covered slaves, bondservants, actors and prostitutes, nonetheless lasted to the end of the dynasty.

Jesuits ran the court observatory, but after Rome condemned the Chinese rites, Kangxi declared in 1721 that "Westerners should not be allowed to preach in China, to avoid further trouble", and Yongzheng proscribed Catholicism in 1724.

Culture flourished under watchful eyes. The *Siku Quanshu*, compiled from 1772 to 1782, filled 36,381 volumes in each of seven copies; during its compilation about 3,000 works were banned or destroyed, most of them late-Ming writings with anti-Manchu content. Qianlong's reign saw 53 cases of literary persecution. In the same decades Cao Xueqin wrote *Dream of the Red Chamber*, which circulated in manuscript before a 120-chapter edition was printed in 1791–1792.

## Population: Boom and Strain

China's population rose from roughly 150–160 million in 1700 to about 303 million in 1791. Fast-ripening rice allowed two or three crops a year, and William Rowe explains the growth by New World crops, especially sweet potatoes, grown on poor land as food for the poor; smallpox inoculation; better midwifery; and campaigns against infanticide. Sweet potatoes are traditionally said to have arrived in Fujian from Luzon in the 1590s, though the dates and the first introducer are disputed. Growth was fastest in highlands and borderlands, as millions of Han migrated to Yunnan, Guizhou and Taiwan.

Contemporaries worried. Qianlong observed that "the population continues to grow, but the land does not". In 1793 the scholar **Hong Liangji** argued that households had multiplied twentyfold in a century while land could at most increase fivefold. His bleak conclusion:

```quote
Flood, drought, and pestilence are the means of Heaven to temper the problem.
Hong Liangji · Zhi Ping Pian · 1793
```

Historians have argued ever since about whether China was a Malthusian trap. **Ping-ti Ho**'s *Studies on the Population of China* (1959) showed that official tax-unit figures were not head counts. James Lee and **Wang Feng**, in *One Quarter of Humanity* (1999), accepted that nearly all women married but rejected the Malthusian picture of unchecked fertility: Chinese families limited births within marriage, and also through female infanticide and neglect. A reviewer, while largely approving, noted its high degree of generalisation. The strain was nonetheless real: marriages and births declined in the early nineteenth century, and migration into the upper Yangzi and Han river highlands caused erosion and flooding.

## The Great Divergence Debate

Why did industrialisation come first in Britain rather than China? Kenneth Pomeranz's *The Great Divergence* (2000), a founding work of the "California School", argued that the Yangzi Delta was comparable with England until about 1800, and that coal and colonies made the difference. **Philip C. C. Huang** answered with "involution": in the Yangzi Delta, families poured ever more labour into cash crops and low-return household sidelines, raising total output while returns per workday fell, "growth without development". The two men debated in the *Journal of Asian Studies* in 2002–2003. Others, as the chapter on Chinese History explains, date the divergence earlier, while Jack Goldstone places it after 1750 or even 1800.

## Overstretch

Qianlong's later reign looked dazzling but was costly. His Ten Great Campaigns, of which only the Dzungar and Xinjiang wars enlarged the empire, cost more than 151 million taels by Zhuang Jifa's estimate, and his favourite Heshen came to symbolise corruption. From 1757 Western trade was confined to Canton, and in 1793 the Macartney embassy failed, though not because Macartney refused to kowtow; the chapter on The Opium Wars follows both stories.

Inside the empire, discontent took religious form. Wang Lun led a millenarian rising in Shandong in 1774. The **White Lotus Rebellion**, which began around 1794–1796 as a tax protest among poor highland settlers in Sichuan, Hubei and Shaanxi, complained that "the officials have forced the people to rebel". It was put down only by 1804, by stockaded villages and gentry militias, and it ended the myth of Manchu military invincibility. In 1813 the Eight Trigrams sect even attacked the Forbidden City. The chapter on The Taiping Rebellion and the Late Qing takes up the story from there.

```checkpoint
q: What did James Lee and Wang Feng argue in One Quarter of Humanity (1999)?
a: That China's population was checked mainly by famine and war, as Malthus thought.
x: They rejected that Malthusian picture.
a*: That Chinese families controlled fertility within marriage, and through female infanticide and neglect, so China was not a simple Malthusian trap.
a: That official population figures were accurate head counts.
x: Ping-ti Ho had shown that tax-unit figures were not head counts.
a: That population fell sharply in the eighteenth century.
x: It rose from about 150–160 million in 1700 to about 303 million in 1791.
hint: Think of choices made inside families.
why: Lee and Wang challenged the view, going back to Malthus and echoed by Hong Liangji, that only positive checks limited Chinese population.
---
q: What did Philip Huang mean by "involution"?
a: That China's economy shrank in absolute size during the Qing.
x: Total output rose; it was returns per workday that fell.
a: That the Yangzi Delta matched England until about 1800.
x: That is Kenneth Pomeranz's argument, which Huang criticised.
a: That the Qing deliberately banned industry.
x: Involution describes household economic choices, not a state ban.
a*: That more labour per unit of land raised total output while returns per workday fell: growth without development.
hint: Think of "growth without development".
why: Huang's thesis is the main alternative to the California School's account of the Great Divergence.
```

## Further exploration

- **William T. Rowe, *China's Last Empire: The Great Qing* (2009).** The best short synthesis of Qing social and economic history.
- **Timothy Brook, *The Confusions of Pleasure: Commerce and Culture in Ming China* (1998).** How commerce transformed Ming society and culture.
- **Richard von Glahn, *The Economic History of China: From Antiquity to the Nineteenth Century* (2016).** The standard survey, strong on silver and markets.
- **Michael Szonyi, *The Art of Being Governed: Everyday Politics in Late Imperial China* (2017).** How ordinary Ming families dealt with the state.
- **Dorothy Ko, *Cinderella's Sisters: A Revisionist History of Footbinding* (2005).** Footbinding as women's practice, fashion and civility.
- **Susan Mann, *Precious Records: Women in China's Long Eighteenth Century* (1997).** Elite women through their own writing.
- **Ge Zhaoguang, *What Is China? Territory, Ethnicity, Culture, and History* (2018).** A Chinese historian on the making of "China" and its frontiers.$mn_mingqing_master$,
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
  select $mn_mingqing_quiz$[
    {"type": "mcq", "prompt": "What did the Single Whip reform, extended across the empire by Zhang Juzheng in 1580, do?", "options": ["Commuted land tax, poll tax, labour service and local levies into a single payment in silver", "Banned all trade with Japan", "Created the hereditary weisuo military households", "Froze the labour-service tax quota for ever"], "answerIndex": 0, "explanation": "Conversion was never complete, but it raised China's demand for silver from Japan and Spanish America.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Dorgon's order of 21 July 1645 require of Han Chinese men?", "options": ["To bind their daughters' feet", "To move inland from the coast", "To shave the forehead and wear the Manchu queue, on pain of death", "To register in the Eight Banners"], "answerIndex": 2, "explanation": "The slogan ran 'keep the hair and lose the head, or keep the head and lose the hair'; the queue remained a symbol of submission until 1912.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about footbinding is best supported by the chapter?", "options": ["It began under the Qing", "The Manchus required it of their own women", "It disappeared after Kangxi's ban of 1664", "Some estimates put the share of women with bound feet by the nineteenth century at 40–50 per cent"], "answerIndex": 3, "explanation": "The Manchus banned it in 1636, 1638 and 1664 but few Han complied, and Kangxi gave up in 1668.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Hong Liangji argue in his essay of 1793?", "options": ["That China should open more ports to Western trade", "That households had multiplied twentyfold in a century while land could at most increase fivefold", "That footbinding should be abolished", "That the Qing was not a Chinese dynasty"], "answerIndex": 1, "explanation": "Hong concluded that flood, drought and pestilence were the means of Heaven to temper the problem.", "id": "q4"},
    {"type": "open", "prompt": "Did silver make or break the Ming? Use the evidence and the historians' arguments in your answer.", "rubric": "A strong answer explains the Single Whip reform and the resulting demand for silver; the supply from Japan and Spanish America via the Manila galleons, giving the inflow as attributed estimates (Brook, Wakeman) and the share of American silver as between a third and a half; von Glahn's 'silver century'; the scarcity of the 1630s–1640s and its effect on peasants paying tax in silver (Spence's exchange-rate figures); the older silver-crisis thesis and Flynn and Giráldez's emphasis on silver, against von Glahn's view that Chinese demand for money drove the trade and his and Brook's doubt that a shortage decided the Ming's fall; and the other causes of collapse such as Little Ice Age famine and rebellion. It may link silver to the rejection of the 'isolated Ming'.", "id": "q5"},
    {"type": "open", "prompt": "Were women in Ming and Qing China victims of Confucian patriarchy, or historical actors? Discuss with reference to historians' debates.", "rubric": "A strong answer covers footbinding (its spread, the failed Manchu bans, the 40–50 per cent estimate, with its regional variation) and its interpretations: May Fourth and feminist readings of violence, Dorothy Ko's argument about attire, civility and women's own practice (the 1591 'Female Adornments' category) without denying suffering, and Bossen and Gates on girls' textile labour; the widow-chastity cult and the explanations of Mann, T'ien Ju-k'ang and Holmgren; and the boom in women's writing (anthologies from 1557, Liu Rushi, Wang Zhenyi, Gu Taiqing) set against the saying 'a woman without talent is virtuous'. It reaches a balanced conclusion, perhaps drawing on Mann's Precious Records.", "id": "q6"}
  ]$mn_mingqing_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/ming-qing-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
