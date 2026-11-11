-- The Modern History of Rural China — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/the-modern-history-of-rural-china @ research/advanced/read.
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
    'history/regional-histories/asia/the-modern-history-of-rural-china',
    'research',
    'advanced',
    'read',
    $mn_ruralchina_master$> **Most of modern China's history happened in villages.** In 1949 about 89 per cent of Chinese people lived in the countryside, and the great upheavals of the twentieth century, from banditry and revolution to famine, reform and mass migration, were above all rural experiences. This chapter follows the village from the crisis of the Republican era and the reformers who tried to rebuild it, through land reform, collectivisation and the famine of the Great Leap Forward, to the household registration system that fixed peasants in place, the farm contracts and rural industries of the reform era, and the tax revolts, land seizures and migration of recent decades. It ends with the state's campaigns against poverty and for "rural revitalisation", and with the historians who have argued over how far villagers made their own history.

## An Old Argument About the Peasant Economy

Any history of the modern countryside starts from an argument about what came before it. As the chapter on Ming-Qing History describes, Kenneth Pomeranz argued in *The Great Divergence* (2000) that the Yangzi Delta was comparable with England until about 1800. **Philip C. C. Huang** had already proposed the idea of **involution**, and in 2002 turned it against Pomeranz. In *The Peasant Family and Rural Development in the Yangzi Delta, 1350–1988* (1990), Huang described "involutionary commercialization": peasant families poured ever more labour into each unit of land, raising total output while the return to each workday fell. Growth, in short, without development.

The debate has a second front. Loren Brandt's *Commercialization and Agricultural Development: Central and Eastern China, 1870–1937* (1989) is grouped with work, including Thomas Rawski's, that finds substantial growth in rural output and incomes as markets spread in the late nineteenth and early twentieth centuries, and Ramon Myers set Brandt, Rawski and David Faure against Huang's involution. Pomeranz's own earlier rural book, *The Making of a Hinterland* (1993), traced how an inland region of western Shandong and its neighbours slid from core to periphery after the Yellow River changed course in the 1850s, as the state abandoned it.

## Crisis in the Republican Countryside

After 1911 the countryside became a place of armed men. As the chapter on Modern China describes, warlord armies multiplied many times over between 1916 and 1924, and banditry grew with them: by one estimate there were 20 million bandits by 1930. The most notorious, "White Wolf" (Bai Lang), led an army of several thousand, by some estimates more than 20,000, across five provinces until his rebellion was crushed in 1914. Villagers defended themselves. The **Red Spear Society** of the 1920s brought together smallholders and tenants in Henan, Hebei and Shandong against bandits, warlords and tax collectors, and later against Communists or the Japanese. Elizabeth Perry's *Rebels and Revolutionaries in North China, 1845–1945* (1980) is the classic study. The Communist state suppressed such societies in a campaign in 1953.

## Reformers in the Village

Chinese intellectuals went to the villages to understand this crisis and to repair it. The most influential observer was the anthropologist **Fei Xiaotong** (1910–2005). After his first fieldwork ended in tragedy, when his wife and fellow researcher Wang Tonghui drowned going for help after he was injured in a tiger trap, he went on to study under Bronisław Malinowski at the London School of Economics, and his thesis on Kaixiangong village in Jiangsu became *Peasant Life in China* (1939). In the late 1940s he published *From the Soil* (*Xiangtu Zhongguo*), lectures and essays describing a people "inseparable from the soil". Fei likened rural society to the ripples spreading from a pebble dropped in water, with each person at the centre of rings of kin and acquaintance that weakened with distance. He called this the "differential mode of association" (*chaxu geju*) and contrasted it with the Western "organizational mode", in which people join groups as equal members.

{{image: Fei Xiaotong | Fei Xiaotong, whose From the Soil remains the classic Chinese portrait of village society}}

Others tried to rebuild the village directly. The **Rural Reconstruction Movement**, begun in the 1920s by **James Yen** (Yan Yangchu), **Liang Shuming** and others, sought a "middle way" between the Nationalist state and Communist revolution, and ran hundreds of village projects. Yen's mass education campaigns of the 1920s drew more than five million students. His experiment at Ding Xian in Hebei (1926–1937) combined People's Schools with hybrid pigs, cooperatives, village drama and village health workers. Liang, a philosopher, ran rural reconstruction in Zouping County, Shandong, from 1931 to 1937. He argued that Chinese villages could not be neatly divided into classes, since a single lineage held both "haves" and "have-nots"; class struggle would set kinsmen against each other. War and lack of money curtailed the movement in the later 1930s.

## Revolution from the Countryside

The Communists offered a different answer. As the chapter on Maoism describes, Mao Zedong built his strategy on the peasantry. His *Report on an Investigation of the Peasant Movement in Hunan*, published on 28 March 1927 after 32 days in the villages around Changsha, defied the party leadership's focus on workers and endorsed peasant violence: "A revolution is not a dinner party." Maurice Meisner saw two "heresies" in the report, bypassing the urban working class and relying on peasant initiative; Roy Hofheinz Jr. thought Mao's real novelty was insisting that only the poorest peasants could turn the village upside down.

**Land reform** turned that insistence into policy. Villagers were classified by how much of their income came from exploiting others rather than their own labour, and landlords' land was seized at struggle meetings where the poor "spoke bitterness" against them. Deng Yingchao observed in 1947 that "women function as great mobilizers when they speak bitterness", and land titles issued to adult household members gave women some economic independence. The Outline Land Law of October 1947 drove the campaign during the civil war. By the Communist victory, over 25 million hectares had been redistributed in Communist areas, according to Brian DeMare, while a Nationalist-backed "Homecoming Legion" of dispossessed landlords took revenge on villagers. The Land Reform Law of 1950 was officially milder, protecting middle peasants, and reform was largely complete by 1952. About 43 per cent of cultivated land went to about 60 per cent of the rural population. Hu Yaobang had to explain that "annihilating" the landlord class meant seizing its property, not killing landlords, but the killing was real. Estimates of deaths in land reform and the parallel campaign against counter-revolutionaries range from 200,000 to 5 million: Benedict Stavis gave 200,000–800,000 for land reform, the *Cambridge History of China* 1–2 million executed, and Lee Feigon 2–5 million.

## Collectives, Communes and Famine

The land was soon taken back. Mutual aid teams gave way to cooperatives, and by June 1956 over 60 per cent of rural households were in higher-level cooperatives, earning **work points** rather than owning their harvest. Liang Shuming spoke for the countryside in 1953 and was denounced by Mao for it.

```quote
The workers are up in the ninth heaven whereas the peasants are down in the ninth hell.
Liang Shuming, as quoted by Mao Zedong · Central People's Government Council · September 1953
```

In 1958 Mao declared "People's communes are good", and some 25,000–26,000 communes were formed, averaging about 5,000 households. They ran communal mess halls, abolished private plots and at first promised "free supply". The famine that followed belongs to the chapter on Maoism, which sets out estimates from 15 million to 45 million or more, with most recent scholarly estimates around 30–45 million. It was overwhelmingly a rural famine: urban residents had fixed rations, and by one estimate 95 per cent or more of the dead held rural registration. In Xinyang, Henan, people starved at the doors of grain warehouses, and the local post office confiscated 1,200 letters begging for help. Local leadership mattered, as Chen Yixin shows in a volume edited by Felix Wemheuer and Kimberley Manning, setting radical Anhui under Zeng Xisheng, where Wan Li later counted 3–4 million "abnormal" deaths, against Jiangxi, whose leaders quietly limited the Leap. Xin Meng, Nancy Qian and Pierre Yared found more deaths where more food per head was produced, and argue that inflexible state procurement explains at least half of the mortality. In Xiaogang, Anhui, 67 of 120 villagers died. Liu Shaoqi's verdict of 1961–62, reached after 44 days in Hunan villages, was "three parts natural disaster, seven parts man-made".

Ralph Thaxton's study of Da Fo village in Henan found that food output did not collapse; what collapsed was villagers' access to it, as the state took the grain. People survived by covert resistance: stealing crops and eating them green. Afterwards the communes retreated, devolving accounting to the production team in 1962 and restoring private plots and sidelines.

## The Hukou Wall and the Barefoot Doctors

Behind the communes stood a wall. The **hukou** regulation of 9 January 1958 divided citizens into agricultural and non-agricultural households. Urban registration brought rations, housing, jobs and pensions; rural households had to provide for themselves, and quotas allowed only 0.15–0.2 per cent of people to change status each year. The scholar Kam Wing Chan concludes that the system "effectively forbade the peasantry to exit agriculture", and Sulamith Heins Potter and Jack Potter called the rural–urban distinction "caste-like". The flow ran the other way when, as the chapter on The Cultural Revolution describes, some 17 million urban youths were sent down to the countryside.

The Mao era also brought something to the villages. In his "June 26 Directive" of 1965 Mao attacked the urban bias of medicine, and from 1968 **barefoot doctors**, trained for months (later typically three to six) in Western and Chinese medicine, vaccination, sanitation and childbirth, were posted across the countryside, with a target of one per 1,000 people and a woman doctor required in each village. Rural reconstruction had pioneered village health workers in the 1930s; the Alma-Ata Declaration on primary health care of 1978 in turn drew some inspiration from the barefoot doctors. Mobo Gao, who grew up in a Jiangxi village, argues in *Gao Village* that rural people gained from such clinics and schools. The scheme collapsed with the communes: cooperative medical coverage fell from 90 per cent to 4.8 per cent by 1984.

```checkpoint
q: What did Philip C. C. Huang mean by "involution" in the rural economy of the Yangzi Delta?
a*: Families put ever more labour into each unit of land, so total output rose while the return to each workday fell.
a: Peasants abandoned farming for factory work in the cities.
x: Huang's involution describes intensification within the household farm, not a move to urban industry.
a: Landlords seized peasant land, causing output to collapse.
x: Involution is about rising total output with falling returns per day of labour, not collapsing output.
a: Commercialisation raised both output and incomes steadily from 1870 to 1937.
x: That is closer to the view of Loren Brandt and Thomas Rawski, set against Huang's.
hint: Think of "growth without development".
why: Huang's idea frames a long debate with Pomeranz, Brandt and Rawski over whether the late-imperial and Republican countryside was growing or stagnating.
---
q: How did the hukou system of 1958 shape the Great Leap famine?
a: It moved urban residents into the countryside to grow food.
x: Hukou fixed people in place; the later sending-down of youth was a separate policy.
a: It guaranteed rural households the same grain rations as urban ones.
x: Urban registration brought fixed rations; rural households had to provide for themselves.
a*: Urban hukou holders received fixed rations while rural households fended for themselves, so the famine fell overwhelmingly on the countryside.
a: It had no connection to the famine, which affected cities and villages equally.
x: By one estimate 95 per cent or more of the dead held rural registration.
hint: Think of who was entitled to rations.
why: The registration system turned a national disaster into a rural one and helped create what the Potters called a "caste-like" divide.
```

## Who Made Reform?

Reform began, in the story told ever since, in **Xiaogang**. In December 1978 eighteen farmers, led by Yen Jingchang, secretly agreed to divide the collective land into family plots, deliver a quota to the state and keep the surplus, and to raise the children of anyone sentenced to death for it. "We all secretly competed," Yen recalled; local accounts say the next harvest exceeded the previous five combined. As the chapter on China Today notes, this is a founding legend, and its details vary between accounts, even the number of signers, and reporters found that farmers' and officials' versions diverge. Household contracting also had precedents, in Yongjia county, Wenzhou, in 1956 and in the *sanzi yibao* policies of the early 1960s.

What is clear is that the centre followed the villages. The Third Plenum of December 1978 still banned contracting to households, but by the end of 1979 Anhui reported that 10 per cent of its teams were doing it. Deng Xiaoping backed the experiments in Anhui's Fengyang and Feixi counties in 1980, a "No. 1 Document" made the **household responsibility system** official in 1982, and the communes were dismantled from 1983, though the land stayed collectively owned. Kate Xiao Zhou argues in *How the Farmers Changed China* (1996) that farmers, not leaders, drove decollectivisation, in a movement that was spontaneous, leaderless and unorganised, without ideology or political aims; other accounts credit Deng and provincial leaders such as Wan Li in Anhui and Zhao Ziyang in Sichuan.

Villagers then built factories. **Township and village enterprises**, grown from commune and brigade workshops, numbered 1.5 million in 1978 and over 12 million by 1985; their employment rose from 28 million to a peak of 135 million in 1996. Many were private firms that "wore a red hat" by registering as collectives, a point stressed by Yasheng Huang. Fei Xiaotong, rehabilitated in 1980 after being branded a "big Rightist" in 1957, is thought to have helped persuade the government to promote such rural industry. From the mid-1990s they declined and were widely privatised; in 1997 the World Bank attributed some 60 per cent of China's air and water pollution to them.

## "The Peasants' Lives Are Truly Bitter"

By the 1990s villagers were paying for local government through a thicket of taxes and fees. Wen Tiejun, later of Renmin University, gave the problem a name, *sannong*, the "three rural problems" of agriculture, villages and peasants. In March 2000 **Li Changping**, a township party secretary in Qipan, Hubei, wrote to Premier Zhu Rongji.

```quote
农民真苦，农村真穷，农业真危险
Li Changping · Letter to Premier Zhu Rongji · March 2000
```

The line is usually translated "the peasants' lives are truly bitter, the countryside truly poor, agriculture truly in danger". When *Southern Weekend* published the letter that year, its readers made Li their Person of the Year, and his book *I Told the Premier the Truth* followed in 2002. In January 2004 the writers **Chen Guidi and Wu Chuntao** published *An Investigation of China's Peasantry*, an account of tax extortion and violence against peasants in Anhui; it sold nearly 200,000 copies in two months before it was banned in March 2004, and later appeared in English as *Will the Boat Sink the Water?* (2006).

Reform came from the top. The agricultural tax, by one account 41 per cent of state revenue in 1949, was about 1 per cent of tax revenue by 2004. Premier Wen Jiabao announced in March 2005 a nationwide exemption from 2006, and on 29 December 2005 the National People's Congress Standing Committee annulled the 1958 Agricultural Tax Regulations with effect from 1 January 2006; the Associated Press called it a "2,600-year-old" tax, while other sources say over 2,000 years. Hu Jintao's campaign for "Building a New Socialist Countryside" followed from 2006. Meanwhile Wen Tiejun led a "New Rural Reconstruction" movement that revived the name of the 1930s reformers, and in 2003 an institute named after James Yen opened in Dingzhou, the old Ding Xian.

## Migrants, Left-Behind Children and Land

The largest change was departure. One estimate puts the number who moved from countryside to city between 1978 and 1999 at 174 million, and women were most of the early workers in the export zones. China's National Bureau of Statistics counts rural-registered people working outside farming for six months or more a year: 252.78 million in 2011, 277.5 million in 2015, 299.73 million in 2024 and 301.15 million in 2025, with an average age above 43 and about a third over 50. The system's dangers were exposed in 2003, when Sun Zhigang, a 27-year-old graduate from Hubei, died after a beating in a Guangzhou custody-and-repatriation centre, held for lacking a temporary residence permit; after the *Southern Metropolis Daily* reported it, the custody-and-repatriation system was abolished. The rules have since loosened, notably with a 2014 plan to end the agricultural/non-agricultural distinction.

Behind the migrants stayed their children. Counts of children left behind by one or both parents rose from 22.9 million in the 2000 census to 61 million in 2010; UNICEF put the number at about 69 million in 2018, roughly 30 per cent of rural children. In Bijie, Guizhou, in 2015, four left-behind siblings, aged 5 to 13, died after drinking pesticide; the Ministry of Civil Affairs set up an office for left-behind children in 2016.

Land became the flashpoint. After 2006 local governments relied increasingly on selling land, as the chapter on China Today describes, and by one estimate some 50 million farmers had lost their land by 2010–11. Sun Liping of Tsinghua University estimated up to 180,000 "mass incidents" in 2010, and Yu Jianrong of the Chinese Academy of Social Sciences wrote in 2010 that land disputes lay behind 65 per cent of rural disturbances. In September 2011 villagers in **Wukan**, Guangdong, marched under the banner "Give us back our farmland". They expelled their officials and, after their representative Xue Jinbo died in police custody in December, withstood a police siege until the Guangdong party chief Wang Yang conceded; in March 2012 they elected their protest leader Lin Zuluan village head by secret ballot. In 2016 Lin was arrested after writing a letter about land seizures, confessed to bribery on state television, and nine villagers were jailed.

## Poverty Alleviation and Revitalisation

By the World Bank's measure of \$1.90 a day, China's poverty rate fell from 88 per cent in 1981 to 0.7 per cent in 2015. Under Xi Jinping, **Targeted Poverty Alleviation**, which followed his visit to Shibadong village in Hunan in 2013 and was adopted in 2014, registered poor households, paired cadres with them and sent "first secretaries" to villages. In November 2020 the government announced that absolute poverty had been eliminated by its own national line of 2,300 yuan a year (at 2010 prices), and on 25 February 2021 Xi declared "complete victory": 98.99 million rural people lifted out in eight years. At the World Bank's higher line for upper-middle-income countries about 13 per cent remained poor, academics reported one-off transfers to push households over the line, and in May 2020 Premier Li Keqiang said that 600 million people had a monthly income of only about 1,000 yuan. The next goal, **rural revitalisation**, announced in 2017, aims at "decisive progress" by 2035 and full revitalisation by 2050, and was written into law in 2021.

## Did Villagers Make Their Own History?

The question that runs through this chapter is how far rural people shaped events rather than suffered them. Thaxton, drawing on some 400 interviews over twenty years in Da Fo, traces covert resistance under Mao into "righteous" retaliation in the reform era. The anthropologist **Yan Yunxiang**, working in Xiajia village in Heilongjiang, follows the rise of the individual and the couple, and the decline of patriarchal authority, through *Private Life under Socialism* (2003) and *The Individualization of Chinese Society* (2009). Jacob Eyferth's study of papermakers in rural Sichuan, *Eating Rice from Bamboo Roots* (2009), reads the revolution as a redistribution of skill and technical control, from villages to cities and from men to women. Mobo Gao, writing about his own Jiangxi village, finds the Mao era less bleak, and the reform era's gains less clear-cut, than usually told.

```checkpoint
q: Why do historians call the Xiaogang story of December 1978 a "founding legend"?
a: Because Xiaogang never existed.
x: Xiaogang is a real village in Fengyang County, Anhui, where 67 of 120 villagers died in the famine.
a*: Because it became the celebrated origin of the household responsibility system, while its details and authenticity are disputed.
a: Because the central government invented household contracting and only later credited the village.
x: The Third Plenum of 1978 still banned household contracting; the centre followed local practice.
a: Because it was the first village to form a people's commune.
x: The first communes were formed in 1958; Xiaogang is famous for leaving collective farming.
hint: Think about the difference between what is remembered and what can be verified.
why: Xiaogang stands for the bottom-up origin of reform, a view argued by Kate Zhou, but the story has been retold and contested.
---
q: What was China's 2020–21 claim to have eliminated absolute poverty measured against?
a: The World Bank's line for upper-middle-income countries.
x: At that higher line about 13 per cent of people remained poor.
a: Li Keqiang's figure of 1,000 yuan a month.
x: Li Keqiang cited that figure to show how many people still had very low incomes.
a: The number of TVEs in each county.
x: Poverty counts were based on household income, not rural enterprise numbers.
a*: China's own national poverty line of 2,300 yuan a year at 2010 prices.
hint: Whose poverty line was it?
why: The claim was announced in November 2020 and declared on 25 February 2021 by the national line; higher international lines tell a different story.
```

The voices of Fei Xiaotong, Li Changping, Chen Guidi and Wu Chuntao and the villagers of Wukan suggest that China's countryside was never simply a backdrop to decisions made elsewhere.

## Further exploration

- **Fei Xiaotong, *From the Soil: The Foundations of Chinese Society* (Chinese 1947; English trans. 1992).** The classic Chinese sociology of the village, translated by Gary Hamilton and Wang Zheng.
- **Brian DeMare, *Land Wars: The Story of China's Agrarian Revolution* (2019).** Land reform told from the archives of the work teams.
- **Ralph A. Thaxton Jr., *Catastrophe and Contention in Rural China: Mao's Great Leap Forward Famine and the Origins of Righteous Resistance in Da Fo Village* (2008).** The famine and its long aftermath in one Henan village.
- **Kate Xiao Zhou, *How the Farmers Changed China: Power of the People* (1996).** The case that farmers, not leaders, made reform.
- **Yunxiang Yan, *Private Life under Socialism* (2003).** A Chinese anthropologist's study of family and intimacy in a northern village.
- **Jacob Eyferth, *Eating Rice from Bamboo Roots: The Social History of a Community of Handicraft Papermakers in Rural Sichuan, 1920–2000* (2009).** The revolution as a struggle over skill.
- **Chen Guidi and Wu Chuntao, *Will the Boat Sink the Water?* (Chinese 2004; English 2006).** The banned reportage on taxes and violence in rural Anhui.$mn_ruralchina_master$,
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
  select $mn_ruralchina_quiz$[
    {"type": "mcq", "prompt": "What did Fei Xiaotong's 'differential mode of association' (chaxu geju) describe?", "options": ["A society of equal members joining formal groups, as in the West", "Rural society as rings of kin and acquaintance spreading outward from each person, like ripples from a pebble dropped in water", "The division of villages into landlords and tenants for land reform", "The household registration system introduced in 1958"], "answerIndex": 1, "explanation": "In From the Soil (late 1940s), Fei contrasted the Chinese 'differential mode', in which each person sits at the centre of widening rings of relationships, with the Western 'organizational mode' of equal group membership.", "id": "q1"},
    {"type": "mcq", "prompt": "Which judgement on the Great Leap famine did Liu Shaoqi deliver in 1961–62, after 44 days in Hunan villages?", "options": ["That the famine was caused entirely by drought and floods", "That reports of famine were exaggerated by local cadres", "That the communes should be expanded further", "That it was 'three parts natural disaster, seven parts man-made'"], "answerIndex": 3, "explanation": "Liu attributed the famine 30 per cent to nature and 70 per cent to human error, repeating the judgement at the Seven Thousand Cadres Conference in January 1962.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened to China's agricultural tax in 2005–06?", "options": ["The National People's Congress Standing Committee annulled the 1958 Agricultural Tax Regulations with effect from 1 January 2006", "It was doubled to pay for rural revitalisation", "It was replaced by a tax on migrant workers' wages", "It was abolished in 1958 together with private plots"], "answerIndex": 0, "explanation": "Wen Jiabao announced a nationwide exemption in March 2005, and on 29 December 2005 the NPC Standing Committee annulled the 1958 regulations from 1 January 2006. By one account the tax had been 41 per cent of state revenue in 1949; by 2004 it was about 1 per cent of tax revenue.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the villagers of Wukan, Guangdong, achieve in early 2012?", "options": ["They won urban hukou for every resident", "They founded the first township and village enterprise", "They elected their protest leader, Lin Zuluan, by secret ballot after protests over land sold without compensation", "They were the first village to sign a household contract"], "answerIndex": 2, "explanation": "After protests from September 2011 under the banner 'Give us back our farmland', the death of Xue Jinbo in custody and a police siege, Guangdong's party chief conceded and villagers elected Lin Zuluan; he was arrested in 2016.", "id": "q4"},
    {"type": "open", "prompt": "Who made China's rural reforms of the late 1970s and early 1980s: farmers or leaders? Use the Xiaogang story and the views of historians in your answer.", "rubric": "A strong answer explains the household responsibility system (land contracted to households, quota delivered to the state, surplus kept); presents Xiaogang (December 1978) as a founding legend whose details are disputed; notes that the Third Plenum still banned household contracting while Anhui reported 10 per cent of teams doing it by end-1979, and that the 1982 No. 1 Document made it official; sets Kate Xiao Zhou's argument that farmers drove a spontaneous, leaderless movement against accounts crediting Deng Xiaoping and provincial leaders such as Wan Li and Zhao Ziyang; and reaches a reasoned judgement.", "id": "q5"},
    {"type": "open", "prompt": "How did the hukou system shape the lives of rural Chinese people from 1958 to the present?", "rubric": "A strong answer explains the 1958 division into agricultural and non-agricultural registration and the urban benefits (rations, housing, jobs, pensions) denied to rural people; links it to the overwhelmingly rural toll of the Great Leap famine (hedged as one estimate); cites Kam Wing Chan or the Potters' 'caste-like' verdict; discusses migrant workers (National Bureau of Statistics figures of about 300 million in the mid-2020s), left-behind children (UNICEF's estimate of about 69 million in 2018), the Sun Zhigang case of 2003, and later reforms such as the 2014 plan.", "id": "q6"}
  ]$mn_ruralchina_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/the-modern-history-of-rural-china', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
