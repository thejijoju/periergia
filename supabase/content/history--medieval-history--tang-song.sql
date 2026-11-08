-- Tang and Song China — canonical master article, co-written and human-reviewed.
-- history/medieval-history/asia/tang-and-song-china @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The Sui and the Grand Canal, the cosmopolitan Tang and Wu Zetian, the
-- An Lushan rebellion, the Song economic revolution and inventions,
-- scholar-officials and Neo-Confucianism, the loss of the north, and the
-- industrial-revolution debate.
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
    'history/medieval-history/asia/tang-and-song-china',
    'research',
    'advanced',
    'read',
    $tangsong_master$> **Tang and Song China**, from the reunification of China in 589 to the Mongol conquest in 1279, produced the most cosmopolitan dynasty and then the most commercial and technologically inventive society in the medieval world. Tang Chang'an was a world city of a million people, open to merchants, monks, and ideas from across Asia. The Song that followed had cities larger than any in Europe, paper money, mass printing, an iron industry not matched in Europe until the eighteenth century, and a government run by officials chosen through competitive examinations. This chapter follows the Sui and Tang, the catastrophe of the An Lushan rebellion, the Song economic revolution and its inventions, Neo-Confucianism and the scholar-officials, the loss of the north, and the long debate over why Song China did not have an industrial revolution.

## The Sui and the Grand Canal

After the fall of the Han in 220 CE, China was divided for more than three and a half centuries, as the chapter on Han China described. In 589 the **Sui** dynasty reunified it. The Sui was short-lived, but its second emperor, Yangdi, built the **Grand Canal**, linking the Yellow River in the north with the Yangzi in the south. For the first time, the rice surpluses of the fertile south could be shipped cheaply to the political centres and armies of the north. The canal, extended over later centuries to some 1,800 kilometres, became the economic spine of imperial China. Its cost in forced labour, together with failed and costly wars in Korea, helped bring down the Sui in 618.

## The Tang: A Cosmopolitan Empire

The **Tang** dynasty (618–907) became one of the most powerful and open states in Chinese history. Its second emperor, **Taizong** (reigned 626–649), extended Chinese control deep into Central Asia, and Tang armies and diplomats dealt with Turks, Tibetans, Koreans, and the Abbasid caliphate.

The Tang capital, **Chang'an**, was a planned city laid out in a great grid of walled wards, with perhaps a million people within and around its walls. Its East and West Markets drew merchants from across Asia. Sogdian and Persian traders, Buddhist monks from India and Central Asia, Nestorian Christians, Zoroastrians, and Manichaeans lived there, and foreign fashions, music, and foods were popular among the elite. The Tang was also the great age of Chinese **Buddhism**, with monasteries owning vast lands and the pilgrim Xuanzang returning from India in 645 with hundreds of texts.

The only woman in Chinese history to rule as emperor in her own name, **Wu Zetian**, did so in this period. A former concubine of Taizong, she became empress of his son, ruled through him and her sons, and in 690 declared her own dynasty, the Zhou, ruling until 705. Later Confucian historians portrayed her as a ruthless usurper; modern historians emphasise her able government, her patronage of Buddhism, and her expansion of the **civil service examinations**, which recruited officials through tests in the Confucian classics and literary composition and helped weaken the power of the old aristocratic families.

Tang culture is remembered above all for its **poetry**. **Li Bai** (701–762) wrote exuberant poems of wine, moonlight, and freedom; **Du Fu** (712–770) wrote of the sufferings of ordinary people in war and rebellion. Their poems, along with those of hundreds of others, are still memorised by Chinese schoolchildren.

## The An Lushan Rebellion

In 755 **An Lushan**, a general of Sogdian and Turkic descent who commanded the armies of the northeastern frontier, rebelled and captured both Luoyang and Chang'an. The emperor fled, and his favourite consort, Yang Guifei, blamed for the disaster, was killed at the demand of his troops. The rebellion lasted until 763 and devastated the north.

The government's census figures fell from about 53 million people in 754 to about 17 million in 764. This is often quoted as evidence of a vast death toll, but historians caution that much of the drop reflects the collapse of the registration system, as the state lost control over large areas and people avoided being counted, not only deaths. The real loss of life was nonetheless enormous.

The Tang survived for another century and a half, but in a weakened form. Military governors in the provinces became effectively independent, foreign influence came to be viewed with more suspicion, and in 845 the government launched a great persecution of Buddhism, closing thousands of monasteries and seizing their lands. A massive rebellion led by Huang Chao (875–884) sacked Chang'an, and the dynasty ended in 907, followed by half a century of division known as the Five Dynasties and Ten Kingdoms.

{{image: Chang'an | A plan of the Tang capital Chang'an, laid out on a grid of walled wards around two great markets.}}

```checkpoint
q: Why do historians caution against reading the fall in census figures after the An Lushan rebellion purely as a death toll?
a*: Because much of the drop reflects the collapse of the state's ability to register people, as it lost control of territory and people avoided being counted.
a: Because no one died in the rebellion.
x: The rebellion caused enormous loss of life; the caution concerns how to interpret the census figures.
a: Because the census was invented after the rebellion.
x: Census records existed before the rebellion, which is why a comparison is possible.
a: Because the population actually grew during the rebellion.
x: The population certainly suffered; the issue is how much of the fall in the figures reflects deaths.
hint: What does a census measure?
why: Census figures record who the state could count, so a collapse of administration can look like a collapse of population.
---
q: Why is Wu Zetian historically significant?
a: She was the first woman to rule any state in history.
x: Many women had ruled states before her; she was unique in Chinese history specifically.
a: She ended the Tang dynasty permanently in 690.
x: Her Zhou dynasty lasted until 705, after which the Tang was restored.
a*: She was the only woman in Chinese history to rule as emperor in her own name, and she expanded the civil service examinations.
a: She banned Buddhism throughout China.
x: She was a major patron of Buddhism; the great persecution came in 845.
hint: Think of the title she took.
why: Wu Zetian broke the convention of male rule and strengthened the examination system, though later historians portrayed her harshly.
```

## The Song Economic Revolution

The **Song** dynasty (960–1279) was founded by a general, Zhao Kuangyin, who was determined that generals would never again overthrow the state. The Song deliberately placed civil officials above military commanders. Its rulers faced powerful neighbours: the Khitan Liao empire in the north, to which the Song agreed in 1005 to pay annual tribute in silver and silk, and the Tangut kingdom of Western Xia in the northwest.

Militarily cautious, the Song presided over an economic transformation that some historians call China's "medieval economic revolution":

- **Agriculture.** A fast-ripening, drought-resistant rice from Champa, in what is now Vietnam, was introduced in the early eleventh century, allowing two harvests a year in parts of the south. Population grew from perhaps 60 million in the Tang to over 100 million by around 1100.
- **Cities.** The Northern Song capital, **Kaifeng**, and later the Southern Song capital, **Hangzhou**, were among the largest cities in the world, with populations of perhaps a million, open markets, restaurants, theatres, and night life. A famous painted scroll, *Along the River During the Qingming Festival*, attributed to Zhang Zeduan, shows the bustle of a Song city.
- **Money.** The Song minted coins in enormous quantities, and merchants in Sichuan began using paper notes in the early eleventh century, which the government took over and issued from 1024, the world's first government paper money. Overprinting later caused inflation.
- **Industry.** Iron production rose dramatically; one historian, Robert Hartwell, estimated output in the late eleventh century at about 125,000 tons a year, a level Europe did not reach until the eighteenth century, though the figure is debated. Coal was used as fuel.

## Printing, Compasses, and Gunpowder

Song China saw a cluster of inventions with world-changing consequences:

- **Printing.** Woodblock printing was already used in the Tang; the *Diamond Sutra* from Dunhuang, dated 868, is the earliest dated printed book, as the chapter on the Silk Roads described. In the Song, printing became widespread, making books cheap for scholars and examination candidates. In the 1040s a craftsman named **Bi Sheng** invented movable type made of baked clay, described by the scholar Shen Kuo, though woodblocks remained more practical for a script with thousands of characters.
- **The compass.** Chinese scholars had long known that magnetised needles point north. The earliest known reference to the compass used for navigation at sea comes from a Chinese text of around 1119.
- **Gunpowder.** Gunpowder emerged from Daoist alchemical experiments in the Tang. A Song military manual of 1044 gives the earliest known formulas, and the Song used gunpowder in fire arrows, bombs, and early fire-lances.

Printing, the compass, and gunpowder, along with paper, were later called China's "four great inventions". All reached the Islamic world and Europe, where they transformed warfare, navigation, and the spread of ideas.

```checkpoint
q: Which change helped Song China's population grow to over 100 million?
a: The abolition of all taxes on farmers.
x: The Song state collected substantial taxes; growth came from agricultural change.
a*: The introduction of fast-ripening Champa rice, allowing two harvests a year in parts of the south.
a: The import of potatoes from the Americas.
x: American crops reached China only after 1492, centuries later.
a: The end of all wars with northern neighbours.
x: The Song faced continual pressure from the Liao, Western Xia, and later the Jin and Mongols.
hint: Where did the new rice come from?
why: A fast-ripening rice variety allowed more harvests, supporting a much larger population and commercial growth.
---
q: Why was government paper money significant?
a: Because it ended the use of coins in China.
x: The Song continued to mint coins in enormous quantities alongside paper money.
a: Because it caused prices to fall permanently.
x: Overprinting of paper money later caused inflation, not lasting deflation.
a: Because it was invented in Europe and copied by China.
x: Paper money originated in China; Europe adopted it centuries later.
a*: Because the Song were the first government to issue paper money, from 1024, building on notes used by Sichuan merchants.
hint: Think of Sichuan merchants and 1024.
why: Paper money made large transactions easier in a highly commercial economy, an innovation centuries ahead of Europe.
```

## Scholar-Officials and Neo-Confucianism

The Song made the **civil service examinations** the main route into government. Candidates sat local, provincial, and metropolitan examinations in the Confucian classics and in essay writing, with papers recopied by clerks to prevent examiners recognising handwriting. Success brought prestige and office, and tens of thousands of men competed in each cycle. The examinations created a class of **scholar-officials**, the literati, educated in the same texts and values, who dominated Chinese government and culture for the next nine centuries.

In response to the challenge of Buddhism and Daoism, Song thinkers developed **Neo-Confucianism**, which provided Confucianism with a metaphysics, explaining the universe in terms of principle (*li*) and vital energy (*qi*), and a path of moral self-cultivation. Its greatest synthesiser, **Zhu Xi** (1130–1200), selected four texts, the *Analects*, *Mencius*, the *Great Learning*, and the *Doctrine of the Mean*, as the **Four Books**, the core of Confucian education. From 1313, under the Mongol Yuan dynasty, his commentaries became the official basis of the examinations, which they remained until 1905.

The period also saw the spread of **foot-binding** among elite families, the practice of tightly binding young girls' feet to keep them small, which became a mark of status and femininity and, over the following centuries, spread widely through Chinese society, causing great suffering until it was suppressed in the twentieth century.

## The Loss of the North and the Mongol Conquest

In 1127 the **Jurchen**, a people from Manchuria who had overthrown the Liao and founded the Jin dynasty, captured Kaifeng and carried off the retired emperor and the emperor himself. A Song prince escaped south and re-established the dynasty at **Hangzhou**. This **Southern Song** (1127–1279), though it ruled only the south, was rich and culturally brilliant. It created China's first permanent standing navy, with paddle-wheel warships, and its maritime trade with Southeast Asia, India, and the Islamic world boomed through ports such as Quanzhou.

The Song's end came from the Mongols, as the chapter on the Mongol empire describes. The Mongols destroyed the Jin in 1234 and then turned on the Song. The decisive siege of the river fortress of Xiangyang lasted from 1268 to 1273; the Mongols took Hangzhou in 1276, and the last Song loyalists were defeated in a naval battle at Yamen in 1279.

## An Industrial Revolution That Never Was?

Historians have long debated why Song China, with its cities, commerce, paper money, printing, and iron industry, did not go on to an industrial revolution. The Japanese historian **Naitō Konan** argued in the early twentieth century that the transition from Tang to Song marked China's entry into an "early modern" age. The historian **Mark Elvin**, in *The Pattern of the Chinese Past* (1973), proposed a "high-level equilibrium trap": China's agriculture became so efficient and labour so abundant and cheap that there was little incentive to invent labour-saving machinery.

Other explanations point to the Mongol conquest and the devastation it caused, to the later Ming state's suspicion of maritime trade, or reject the question as Eurocentric: it asks why China did not do what Britain later did, rather than understanding China's own path. The comparison of China and Europe became central to the "Great Divergence" debate, discussed in later chapters.

```checkpoint
q: What did Mark Elvin's "high-level equilibrium trap" argue?
a: That China was too poor to develop new technology.
x: Elvin's argument is about China's success, not poverty.
a: That the Mongols banned all machines in China.
x: Elvin's argument concerns long-term economic structures, not a Mongol ban.
a*: That Chinese agriculture became so efficient and labour so abundant and cheap that there was little incentive to develop labour-saving machinery.
a: That Neo-Confucianism forbade scientific inquiry.
x: Neo-Confucianism did not forbid inquiry; Elvin's argument is economic.
hint: Think about the cost of labour.
why: Elvin argued that a highly productive but labour-intensive economy reduced incentives for the kind of mechanisation that drove industrialisation in Britain.
---
q: Why do some historians call the question "why didn't Song China industrialise?" Eurocentric?
a*: Because it judges China by whether it followed Britain's later path, rather than understanding China's own development.
a: Because Song China actually had a full industrial revolution.
x: Song China did not industrialise in the modern sense; the critique concerns how the question is framed.
a: Because Europe had no industry in the Song period.
x: The critique is not about European industry in that period; it is about measuring China against a European model.
a: Because China had no economy worth studying.
x: Song China had one of the most advanced economies in the world.
hint: Whose path is being used as the standard?
why: Asking why one society did not follow another's path can obscure the logic of its own historical development.
```

## Further exploration

- **Mark Edward Lewis, *China's Cosmopolitan Empire: The Tang Dynasty* (2009).** A thematic history of the Tang.
- **Dieter Kuhn, *The Age of Confucian Rule: The Song Transformation of China* (2009).** A history of the Song.
- **Valerie Hansen, *The Open Empire: A History of China to 1800* (2nd ed., 2015).** China's interactions with the outside world.
- **Mark Elvin, *The Pattern of the Chinese Past* (1973).** The classic argument about China's economic history.
- **Patricia Buckley Ebrey, *The Inner Quarters: Marriage and the Lives of Chinese Women in the Sung Period* (1993).** Women's lives in Song China, including foot-binding.$tangsong_master$,
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
  select $tangsong_quiz$[
    {"type": "mcq", "prompt": "Why was the Grand Canal so important to imperial China?", "options": ["It linked the Yellow River and the Yangzi, letting southern rice reach the northern capitals and armies", "It connected China to India", "It was the border with the Mongols", "It carried silk to Rome"], "answerIndex": 0, "explanation": "Built under the Sui, the canal became the economic spine of imperial China.", "id": "q1"},
    {"type": "mcq", "prompt": "Who was the only woman to rule China as emperor in her own name?", "options": ["Yang Guifei", "Ban Zhao", "Wu Zetian", "Cixi"], "answerIndex": 2, "explanation": "Wu Zetian declared her own Zhou dynasty and ruled from 690 to 705.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these was NOT one of the Song developments described in the chapter?", "options": ["Government-issued paper money", "Movable type invented by Bi Sheng", "The earliest known gunpowder formulas", "The steam engine"], "answerIndex": 3, "explanation": "Song China had paper money, movable type, the navigational compass, and gunpowder, but not the steam engine.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened in 1127?", "options": ["The Mongols conquered China", "The Jurchen Jin captured Kaifeng, and the Song re-established themselves in the south at Hangzhou", "The Tang dynasty fell", "Zhu Xi's commentaries became the basis of the examinations"], "answerIndex": 1, "explanation": "The loss of the north began the Southern Song period.", "id": "q4"},
    {"type": "open", "prompt": "Describe the Song economic revolution and explain why historians debate why it did not lead to an industrial revolution.", "rubric": "A strong answer describes Champa rice and population growth over 100 million, great cities (Kaifeng, Hangzhou), paper money from 1024, iron output (Hartwell's estimate, debated) and coal, printing, the compass, gunpowder, and maritime trade. It then explains Naitō Konan's 'early modern' thesis, Elvin's high-level equilibrium trap, the effects of the Mongol conquest and later Ming policy, and the critique that the question is Eurocentric.", "id": "q5"},
    {"type": "open", "prompt": "How did the civil service examinations and Neo-Confucianism shape Chinese government and society from the Song onwards?", "rubric": "A strong answer explains the expansion of examinations (from the Tang and Wu Zetian to the Song), anonymised papers, the scholar-official class, and the decline of aristocratic power; Neo-Confucianism's metaphysics of li and qi and self-cultivation; Zhu Xi and the Four Books becoming the exam curriculum from 1313 to 1905; and social consequences, such as the spread of foot-binding among elites.", "id": "q6"}
  ]$tangsong_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/medieval-history/asia/tang-and-song-china', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
