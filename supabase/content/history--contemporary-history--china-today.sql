-- China Today: the Economic Miracle and Infrastructural Revolution — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/china-today-the-economic-miracle-and-infrastructural-revolution @ research/advanced/read.
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
    'history/contemporary-history/china-today-the-economic-miracle-and-infrastructural-revolution',
    'research',
    'advanced',
    'read',
    $mn_chinatoday_master$> **Forty years that remade a country and the world economy.** In December 1978 China's Communist Party turned from Maoist campaigns to economic growth. Over the next four decades China became the world's second-largest economy and, by the World Bank's count, close to 800 million people left extreme poverty. This chapter follows the reforms from Xiaogang's secret farm contract and Shenzhen to Tiananmen, the layoffs of the 1990s and the World Trade Organization; the building boom of dams, high-speed railways and new cities, and the land sales and local debt that paid for it; the Belt and Road abroad; and the costs in displacement, pollution and debt. It ends with a question economists still argue over: can the model last?

## From Campaigns to Experiments

Deng Xiaoping's return to power after the Cultural Revolution is told in the chapter on the Cultural Revolution. On 18 December 1978 the third plenary session of the party's 11th Central Committee launched what became known as **reform and opening**, and Deng, often called its "General Architect", replaced Hua Guofeng as paramount leader. A debate that year over the slogan "practice is the sole criterion for testing truth" defeated Hua's "Two Whatevers", the promise to uphold whatever Mao had said and done.

The story is not Deng's alone. Hua had already begun to combine a Soviet-style industrial push with an opening to the capitalist world, and under him China sought foreign investment. Hu Yaobang as general secretary and Zhao Ziyang as premier carried out reforms, while a more cautious wing gathered around Chen Yun, who wanted markets kept inside the "cage" of the plan.

The starting point was poor but not empty. From 1970 the economy had stagnated, yet in 1981 China's poorest people were better fed, educated and healthier than the poorest in India and Pakistan. The scholar Lin Chun stresses that Mao-era human capital and collectively owned land mattered for what followed. Deng called the reforms a "large scale experiment": major changes almost always began as local trials before national adoption, and officials were rarely punished when a trial failed, a contrast often drawn with the Soviet Union's top-down perestroika.

## Xiaogang and the Return of the Family Farm

The most celebrated trial began in **Xiaogang**, a village in Fengyang County, Anhui, where 67 of 120 people had died in the Great Leap famine described in the chapter on Maoism. In December 1978, in the story told ever since in Chinese media, eighteen farmers signed a secret and illegal agreement to divide the collective land into family plots. Each household would hand a quota to the state and keep the surplus, and they pledged that if any of them was caught and sentenced to death, the others would raise his children until the age of eighteen. The 1979 harvest, the story goes, exceeded those of the previous five years combined.

Xiaogang became the founding legend of the **household responsibility system**. Deng endorsed it for poor regions in April 1980, a central "No. 1 document" made it official in 1982, and from 1983 the people's communes were dismantled, though the land stayed publicly owned. Agricultural output grew by 8.2 per cent a year, against 2.7 per cent before reform. Zhao Ziyang later recalled that "by 1984, farmers actually had more grain than they could sell." Beyond the fields grew **township and village enterprises**, nominally owned by local governments but in practice often private, which took market share from the state sector through the 1980s.

## Shenzhen and the Special Economic Zones

The opening to the world began in Guangdong, where officials under the provincial party secretary Xi Zhongxun, father of Xi Jinping, wanted a showcase of reform. Guangdong proposed special status for Shenzhen, Zhuhai and Shantou, along with Xiamen in Fujian, and Deng coined the term "special zones". Shenzhen was established in 1980; fourteen coastal cities were opened in 1984, and Shanghai's Pudong in 1990. The zones faced Hong Kong, Macau and Taiwan.

Shenzhen is usually described as a fishing village that became a megacity. **Juan Du**, in *The Shenzhen Experiment* (2020), calls that a myth. The area was the seat of Bao'an County, a border market town amid farming and fishing villages, long a crossing point for people trying to escape to Hong Kong. By her count it had some 300,000 people or more when the zone was founded, and its growth owed much to the village collectives already there.

What followed is not in dispute. Between 1980 and 1990 Shenzhen's population grew sixfold and its economy about sixtyfold. Before 1980 its output was 0.2 per cent of Hong Kong's; in 2018 it overtook its neighbour. Huawei and ZTE grew up there, and by 2025 the city had about 18.2 million people.

{{image: Shenzhen | Shenzhen, a border county seat when it became a Special Economic Zone in 1980, had about 18 million people by 2025.}}

## Prices, Tiananmen and the Southern Tour

Freeing prices proved the hardest step. From 1985 a **dual-track price system** let goods within the plan keep plan prices while output beyond it sold at market prices. **Isabella Weber** argues that China's rejection, in 1986 and 1988, of "big bang" price liberalisation was decisive: markets grew at the margin of the plan, whereas shock therapy in Eastern Europe brought collapsing output and soaring inflation. Even the attempt at radical price reform in 1988 produced China's first spiralling inflation since the 1940s, with bank runs and panic buying.

Inflation and corruption fed the protests of 1989. Beginning on 15 April, after the death of Hu Yaobang, demonstrations spread to some 400 cities; workers protested against rising prices and the erosion of the "iron rice bowl" of guaranteed state jobs. About a million people filled Tiananmen Square on 17 May, and on 3–4 June the army crushed the movement. Estimates of the dead range from several hundred to the low thousands. The crackdown, ordered by Deng himself, came as communism was collapsing in Eastern Europe, as the chapter on the collapse of the Soviet Union describes. Political reform ended, Western arms embargoes followed, and economic reform came to a virtual halt.

Deng, aged 87 and holding no formal post, restarted it. On his **southern tour** of January and February 1992, through Shenzhen, Zhuhai, Guangzhou and Shanghai, he declared that "development is of overriding importance" and warned military leaders that "those who do not promote reform should be brought down from their leadership positions", forcing the party leader, Jiang Zemin, to back reform. The words most often attributed to him, "To get rich is glorious", are probably a misquotation of his line that some areas and people should get rich first and help others towards common prosperity. Later that year the party adopted the formula of a "socialist market economy". The tour widened the gap between coast and interior, and it did not revive political reform.

```checkpoint
q: What does Juan Du argue about the story that Shenzhen grew from a "fishing village"?
a*: That it is a myth, because Shenzhen was a county seat and border market town amid farming and fishing villages, with about 300,000 people at founding.
a: That it is accurate, because Shenzhen had only a few hundred inhabitants in 1979.
x: Du argues the opposite: by her count the area had about 300,000 people when the zone was founded.
a: That Shenzhen was in fact a large industrial city before 1949.
x: Du stresses a market town, its villages and their collectives, not a pre-1949 industrial city.
a: That the zone's growth owed nothing to the people already living there.
x: Du argues that the village collectives already there contributed much to its growth.
hint: Think about what was already there before 1980.
why: Du's *The Shenzhen Experiment* shows that the "fishing village" story erases the people and institutions already present.
---
q: How did the dual-track price system work, and why does Isabella Weber think it mattered?
a: All prices were freed overnight in 1985, which ended inflation.
x: That describes the "big bang" China rejected; the 1988 attempt at radical price reform in fact caused severe inflation.
a: The state fixed every price permanently, banning markets.
x: Under the dual track, output beyond the plan was sold at market prices.
a*: Goods within the plan kept plan prices while extra output sold at market prices, letting markets grow at the margin rather than through shock therapy.
a: Prices were set by advisers from Eastern Europe.
x: Weber contrasts China with Eastern Europe, where shock therapy was applied; China rejected it.
hint: Two prices for the same good existed side by side.
why: Weber argues that rejecting shock therapy in 1986 and 1988 spared China the collapse that big-bang liberalisation brought to Eastern Europe.
```

## Smashing the Iron Rice Bowl and Joining the WTO

The 1990s belonged to **Zhu Rongji**, vice-premier from 1991 and premier from 1998 to 2003. By the mid-1990s government revenue, excluding that of state enterprises, had fallen to about 11 per cent of national output, and the 1994 tax-sharing reform raised the centre's share. Local governments were left with less than half of tax revenue but more than 70 per cent of spending, and with the proceeds of land sales: the root, as later sections show, of land finance and local debt.

Zhu's reform of state enterprises saved the largest and let thousands of small and medium firms go under. The official term was *xiagang*, "stepping down from the post". Estimates of layoffs from the mid-1990s to the early 2000s run from 27 to 35 million, concentrated in the Northeast and old industrial bases. Thousands of protests followed, mostly petitions for promised benefits rather than political opposition, and the New Left saw *xiagang* as a betrayal of socialist-era guarantees.

On 11 December 2001, after fifteen years of trying, China joined the **World Trade Organization** on harsher terms than other developing countries. Across the reform era its average tariff fell from 56 to 15 per cent and trade rose from under a tenth to 64 per cent of output. The effects reached far beyond China: studies of the "China shock", described in the chapter on Globalization, estimate that Chinese imports cost the United States between about 550,000 manufacturing jobs and 2.4 million jobs in all, depending on method, with the harm concentrated in particular towns.

## Growth and the Great Exit from Poverty

Growth averaged close to 10 per cent a year from 1979 to 2010, and output rose from about US\$150 billion in 1978 to some US\$19 trillion in 2024; China passed Japan as the world's second-largest economy in 2010 and became the largest by purchasing power by the mid-2010s.

The result was what the overview of the twentieth century calls "the greatest mass exit from poverty in history". A 2022 report by the World Bank and China's Development Research Center found that the number of people living on less than \$1.90 a day fell by close to 800 million over four decades, close to three-quarters of the world's reduction in extreme poverty. In November 2020 the government declared absolute poverty eliminated by its own line, though at a higher international line about 13 per cent of people remained poor. Some scholars, among them Sullivan, Moatsos and Hickel, ask whether part of the measured gain reflects the loss of free provision from the Mao era. Inequality rose sharply from a low base, though its measures differ.

## The People Who Built It

The growth was built by migrants. The **hukou** household registration system, formalised in 1958, divided Chinese into rural and urban residents. After 1978 villagers, most of the early export-zone workers women, flooded into the factories, living in company dormitories or shanty towns without urban benefits; since the 1980s an estimated 200 million people have lived outside the places where they are registered. The World Bank's Shahid Yusuf credits hukou with helping China avoid widespread slums, but its inequity is plain. Reforms from 2014 abolished the rural–urban distinction in principle, while keeping strict limits on the largest cities.

In 2024 China counted almost 300 million rural migrant workers, nearly a third of them over fifty. A UNICEF report of 2018 counted about 69 million children left behind by one or both migrating parents. Darker was 2010, when a spate of suicides struck Foxconn's Shenzhen complex, which employed up to 300,000 people: at least ten workers died (fourteen by some counts), and survivors included Tian Yu, paralysed at seventeen. Foxconn raised wages and installed "suicide-prevention netting".

The state reshaped families too. The **one-child policy**, imposed in 1980, promised a "demographic dividend" of fewer dependants per worker, and the party credits it, disputedly, with China's economic rise. It was enforced with coercion: between 1980 and 2014, 108 million people were sterilised. It deepened son preference, though Susan Greenhalgh also notes greater investment in daughters' education. All limits were lifted in 2021, and the labour force is now shrinking.

## Building on a Continental Scale

The **Three Gorges Dam** on the Yangtze was approved by the National People's Congress in 1992 with only 67.75 per cent in favour. Completed in 2006 and fully operational in 2012, it is the world's largest power station. Its reservoir was expected to flood 13 cities, 140 towns and 1,350 villages, and estimates of the people displaced range from about 1.13 million to 1.4 million, some moved as far as Hebei. The baiji river dolphin is functionally extinct, a loss some Chinese government scholars attribute to the dam.

The **South–North Water Transfer** pursued an idea Mao reportedly raised in 1952: "there's plenty of water in the south, not much water in the north. If at all possible, borrowing some water would be good." Its eastern and central routes began carrying Yangtze water north in 2013 and 2014, after more than 500 billion yuan of investment and the resettlement of about 330,000 people around the Danjiangkou Reservoir.

Most striking is **high-speed rail**, built almost from nothing. The first 350 km/h line, Beijing to Tianjin, opened on 1 August 2008; by January 2011 the network was already the world's longest, and it passed 50,000 kilometres at the end of 2025, roughly two-thirds of the world's high-speed track. Speed had costs: the railway minister, Liu Zhijun, was removed for corruption in 2011, a collision at Wenzhou that July killed 40 people, and many lines lose money.

Expressways, non-existent before 1988, reached 190,700 kilometres by the end of 2024. Shanghai overtook Singapore as the world's busiest container port in 2010, and four of the five busiest are now Chinese. The 55-kilometre Hong Kong–Zhuhai–Macau Bridge, opened in 2018, is the world's longest sea crossing.

## New Cities and the "Ghost City" Debate

China was 18 per cent urban in 1978 and, by official figures, 67 per cent at the end of 2024, with cities spreading outward onto farmland. Some districts were built ahead of their people. **Kangbashi**, in Ordos, Inner Mongolia, was launched in 2003 for a million residents; in 2009 and 2010 Al Jazeera and *Time* made it famous as a "ghost city" of perhaps 20,000 to 30,000. **Wade Shepard** argued that the label was premature, since the district was five years old when filmed, and that most such places fill up in time; the 2020 census counted about 119,000 people there. Scholars note that "ghost city" is a misnomer for such underoccupied districts, and that the share of housing in use fell from 84 per cent in 2010 to 78 per cent in 2020.

## How It Was Built: State Firms, Land and Debt

Behind the concrete stood a capable state that sets long-range targets, such as 60,000 kilometres of high-speed rail by 2030. Estimates of the state sector's share of output range from about a quarter to 40 per cent. Local officials whose regions grew fastest were more likely to be promoted, which made local governments "hungry for investment".

Their fuel was land. Urban land belongs to the state, and local governments sell the right to use it; in 2019, 38 per cent of their revenue came from land sales and land-backed finance. Barred from borrowing directly, they created **local government financing vehicles** that borrowed against land. When the global financial crisis struck, Beijing announced a stimulus of 4 trillion yuan in November 2008, its largest share for railways, roads and airports, but only 1.2 trillion came from the central government; the rest fell mostly on localities. The stimulus is blamed for the debt surge that followed. The IMF put these vehicles' debt at US\$8 trillion, 47 per cent of national output, at the end of 2023.

Property bound it together. Land values tripled between 2005 and 2009, and estimates of real estate's weight in the economy run from about 15 to 30 per cent, depending on definition. In 2020, under Xi Jinping's slogan that "houses are for living, not for speculation", the state capped developers' borrowing. **Evergrande**, the world's most indebted developer, collapsed in 2021 owing about 2 trillion yuan, and a Hong Kong court ordered its liquidation in 2024. Families who had paid for unfinished flats were left waiting.

## The Model Exported: the Belt and Road

In 2013 Xi announced a "Silk Road Economic Belt" and a "21st-Century Maritime Silk Road". The **Belt and Road Initiative** now spans projects, mostly financed by loans, in some 150 countries: railways in Laos and Indonesia, the China–Pakistan Economic Corridor, ports at Piraeus, Gwadar and Hambantota. Its motives include exporting surplus capacity, finding markets and resources, and developing China's own west.

**Hambantota**, in Sri Lanka, became the test case. Championed by President Mahinda Rajapaksa after the United States and India declined to fund it, the port was built with Chinese loans and lost money; in 2017 a new government leased it to China Merchants Port for 99 years for \$1.12 billion. That year **Brahma Chellaney** coined the phrase "debt-trap diplomacy", arguing that such lending aimed "to facilitate Chinese access to natural resources" rather than to support local economies. **Deborah Brautigam** and **Meg Rithmire** called the narrative "a lie, and a powerful one": Hambantota accounted for only about 5 per cent of Sri Lanka's 2017 debt service, and Chinese banks have not seized assets. A middle view holds that Chinese loans are often expensive and opaque and China is a major creditor, but that evidence of a plan to seize assets is lacking; recipient governments sought the loans.

```checkpoint
q: How did the 1994 fiscal reform help create China's system of "land finance"?
a: It gave local governments most of the tax revenue, so they no longer needed land sales.
x: The reform did the reverse, cutting localities' share of tax revenue below half.
a*: It cut local governments' share of tax revenue while leaving them most spending and the proceeds of land sales, pushing them to raise money from land.
a: It privatised all urban land, letting families sell it freely.
x: Urban land remains state-owned; local governments sell use rights.
a: It abolished local governments and centralised all building in Beijing.
x: Local governments remained, and became the main builders and borrowers.
hint: Compare who collected the taxes with who did the spending.
why: The gap between local revenue and spending, filled by land sales and land-backed borrowing, lies behind local debt and the property boom.
---
q: What evidence do Deborah Brautigam and Meg Rithmire offer against the "debt-trap" reading of Hambantota?
a: That Sri Lanka never borrowed from China.
x: The port was built with Chinese loans.
a: That China handed Hambantota back to Sri Lanka in 2017.
x: In 2017 Sri Lanka leased the port to China Merchants Port for 99 years.
a: That the port was a great commercial success.
x: The port lost money for years after it opened, so it did not make the loans affordable.
a*: That Hambantota made up only about 5 per cent of Sri Lanka's 2017 debt service, and Chinese banks have not seized assets.
hint: Look at how large the port loan was within Sri Lanka's total debts.
why: Their point is that the port was a small part of Sri Lanka's debt burden and that a lease for cash is not a seizure, though Chinese loans can still be costly and opaque.
```

## The Costs: Air, Water and Soil

The environment paid for the speed. In January 2013 fine-particle pollution in Beijing neared 1,000 micrograms per cubic metre at its peak, and that October Harbin closed its schools and airport in smog. The following spring the premier turned the government against it.

```quote
We will resolutely declare war against pollution as we declared war against poverty.
Li Keqiang · Government work report to the National People's Congress (as translated by Chinese state media) · 5 March 2014
```

Between 2013 and 2018 fine particles in 74 major cities fell by 42 per cent. Soil and water proved harder: a 2014 government report found 19.4 per cent of farmland polluted. China is also the largest total emitter of carbon dioxide, though not per head.

## Can the Model Last?

Under Xi Jinping the party promised in 2013 that markets would play a "decisive" role, yet tightened its control of companies, and campaigns for "common prosperity" from 2021 justified crackdowns on technology and private tutoring firms. Official growth was 5.0 per cent in 2025, half the old pace, and outside estimates such as the Rhodium Group's for 2024 put real growth far lower. Youth unemployment stood at 16.5 per cent in December 2025, and the population is ageing.

Scholars disagree about what drove the miracle, and so about its future. **Barry Naughton** describes an economy "growing out of the plan" without a blueprint, and writes that "Chinese policymakers genuinely believe they are creating a system that merges the efficiency of the market with the ability of the government to steer the economy." **Yuen Yuen Ang** calls the method "directed improvisation", the centre setting direction and localities experimenting, and argues that Xi has rolled back many of Deng's limits on power. **Yasheng Huang** holds that rural private enterprise drove the 1980s and that the 1990s turn to urban, state-led growth was a wrong path. **Ezra Vogel**'s admiring biography of Deng sits beside critics who insist that Tiananmen belongs to the same record.

The sharpest warning comes from **Michael Pettis**. With investment that neared half of output in the 2010s and is still about 40 per cent, and household consumption about 40 per cent, he argues, growth depends on ever more debt, and China must either cut investment and accept slower growth or face a financial contraction. His 2011 forecast of growth near 3 per cent within the decade proved too gloomy, as Arthur Kroeber argued, but the property crisis and local debts keep his question alive: can a model built on state capacity, land and credit turn into one driven by its own people's spending?

## Further exploration

- **Ezra F. Vogel, *Deng Xiaoping and the Transformation of China* (2011).** The standard, broadly admiring biography of the reform era's architect.
- **Barry Naughton, *The Chinese Economy: Adaptation and Growth* (2nd ed., 2018).** The standard textbook on how China's economy works and how it changed.
- **Isabella M. Weber, *How China Escaped Shock Therapy: The Market Reform Debate* (2021).** How China's reformers rejected big-bang price liberalisation in the 1980s.
- **Yuen Yuen Ang, *How China Escaped the Poverty Trap* (2016).** The theory of "directed improvisation".
- **Yasheng Huang, *Capitalism with Chinese Characteristics* (2008).** The case that rural entrepreneurship drove early growth.
- **Jenny Chan, Mark Selden and Pun Ngai, *Dying for an iPhone: Apple, Foxconn, and the Lives of China's Workers* (2020).** Factory life through fieldwork in twelve cities, beginning with the survivor Tian Yu.
- **Juan Du, *The Shenzhen Experiment* (2020).** A history of Shenzhen that dismantles the "fishing village" myth.$mn_chinatoday_master$,
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
  select $mn_chinatoday_quiz$[
    {"type": "mcq", "prompt": "What did the eighteen farmers of Xiaogang, Anhui, secretly agree to do in December 1978?", "options": ["Divide the collective land into family plots, hand a quota to the state and keep the surplus", "Open a factory to export goods to Hong Kong", "Petition Beijing to abolish the hukou system", "Leave the village together to work in Shenzhen"], "answerIndex": 0, "explanation": "In the celebrated founding story of the household responsibility system, the farmers signed an illegal agreement to farm family plots, delivering a quota to the state and keeping the rest; the practice was made official nationally in 1982.", "id": "q1"},
    {"type": "mcq", "prompt": "Which estimate of the number of people displaced by the Three Gorges Dam reflects the sources?", "options": ["About 13,000", "Between about 1.13 million and 1.4 million", "Exactly 3 million", "About 330,000"], "answerIndex": 1, "explanation": "Estimates of Three Gorges displacement range from about 1.13 million to 1.4 million. About 330,000 were resettled for the South–North Water Transfer around the Danjiangkou Reservoir.", "id": "q2"},
    {"type": "mcq", "prompt": "Roughly how long was China's high-speed rail network at the end of 2025?", "options": ["About 8,000 kilometres", "About 20,000 kilometres", "More than 50,000 kilometres", "More than 190,000 kilometres"], "answerIndex": 2, "explanation": "The network, which had essentially not existed before the Beijing–Tianjin line opened in 2008, passed 50,000 kilometres at the end of 2025, roughly two-thirds of the world's high-speed track. 190,700 kilometres is the length of China's expressways at the end of 2024.", "id": "q3"},
    {"type": "mcq", "prompt": "Who coined the phrase \"debt-trap diplomacy\" in 2017?", "options": ["Deborah Brautigam", "Isabella Weber", "Michael Pettis", "Brahma Chellaney"], "answerIndex": 3, "explanation": "Brahma Chellaney coined the term in 2017. Deborah Brautigam and Meg Rithmire are among its leading critics, pointing out that Hambantota made up only about 5 per cent of Sri Lanka's 2017 debt service.", "id": "q4"},
    {"type": "open", "prompt": "Explain how China's local governments paid for the building boom, and why this has left a problem of debt.", "rubric": "A strong answer explains that the 1994 tax-sharing reform left local governments with under half of tax revenue but over 70 per cent of spending, plus land-sale proceeds; that urban land is state-owned and localities sell use rights (38 per cent of their revenue came from land in 2019); that, barred from borrowing directly, they created local government financing vehicles borrowing against land; that the 2008 stimulus of 4 trillion yuan relied mostly on local funding; and that the IMF put financing-vehicle debt at US$8 trillion (47 per cent of output) at end-2023, while the property bust, including Evergrande's collapse, has weakened the land revenue on which the system rests. Credit answers that note the promotion incentives that made local governments 'hungry for investment'.", "id": "q5"},
    {"type": "open", "prompt": "Scholars disagree about what caused China's economic miracle and whether the model can last. Compare at least two of their views.", "rubric": "A strong answer accurately presents at least two positions: Naughton's 'growing out of the plan' without a blueprint; Weber's argument that rejecting shock therapy in favour of the dual-track price system was decisive; Ang's 'directed improvisation' and her view that Xi has rolled back many of Deng's limits on power; Huang's case that rural private enterprise drove the 1980s and the 1990s state-led turn was a wrong path; Lin Chun on Mao-era human capital and collective land; and on the future, Pettis's argument that investment that neared half of output in the 2010s and household consumption around 40 per cent make growth debt-dependent (with his too-pessimistic 2011 forecast noted). Credit answers that weigh the evidence rather than simply listing names, and that acknowledge the human costs alongside growth.", "id": "q6"}
  ]$mn_chinatoday_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/china-today-the-economic-miracle-and-infrastructural-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
