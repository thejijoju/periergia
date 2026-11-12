-- Capitalism and Labor in the United States — canonical master article, co-written and human-reviewed.
-- history/thematic-history/capitalism-and-labor-in-the-united-states @ research/advanced/read.
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
    'history/thematic-history/capitalism-and-labor-in-the-united-states',
    'research',
    'advanced',
    'read',
    $mn_uslabor_master$> **Capital and the people who did the work.** This chapter tells the economic history of the United States as the history of its capitalism and of the people who worked inside it: indentured servants and enslaved Africans, Lowell's mill women, Irish canal diggers, Chinese railway builders, immigrants from Southern and Eastern Europe, Mexican farmworkers, Black sanitation workers in Memphis and warehouse workers at Amazon. It follows institutions from Hamilton's debt plan to the New Deal and the rescue of 2008, the great strikes and the decline of unions, and the historians' debates, from the new labour history to the "new history of capitalism" and its critics.

## Merchants, Servants and the Enslaved

The colonial economy rested on staple crops and on labour that was not free. Tobacco was the great crop of the Chesapeake and rice of South Carolina; just before the Revolution tobacco made up about a quarter of the value of colonial exports.

Northern merchants, too, were tied into the Atlantic slave economy. In the classic textbook triangle, enslaved people grew sugar in the West Indies, molasses was distilled into rum in New England, and rum was traded in West Africa for more captives.

Much colonial labour was bound by contract. Between the 1630s and the Revolution, roughly half or more of white immigrants to the Thirteen Colonies came as indentured servants (estimates run from just under half to two-thirds), most of them young. The pattern was uneven: of English emigrants to Virginia and Maryland in 1773–76, 96 per cent were indentured, against 2 per cent of those bound for New England. Yet by 1775 only 2–3 per cent of the colonial labour force were indentured servants. The chapter on Colonial North America describes how Virginia and Maryland turned from servants to enslaved Africans and wrote racial slavery into law.

## Hamilton's Design

Independence left about \$77 million of debt, federal and state. In his *First Report on the Public Credit* (January 1790), Alexander Hamilton proposed to pay holders of securities at face value and to have the federal government assume the states' debts; in the Compromise of 1790 he won assumption in exchange for placing the capital on the Potomac, as Jefferson and Madison wished.

A Bank of the United States followed in 1791, which Jefferson and Madison opposed as unconstitutional and as serving merchants and investors at the expense of the majority. Hamilton's *Report on Manufactures* (December 1791) proposed bounties and moderate tariffs to foster industry, and he funded the debt with import duties and a controversial whiskey tax.

## Wage Work and the Market Revolution

The early republic's courts treated workers' combinations with suspicion. In 1806 Philadelphia journeymen shoemakers were prosecuted for criminal conspiracy to raise wages; only in *Commonwealth v. Hunt* (1842) did a Massachusetts court hold that peaceable combinations of workers were not in themselves illegal.

The historian Charles Sellers called the decades after 1815 a "market revolution" and saw in it the triumph of capitalism over democracy; Daniel Walker Howe replied that most farm families welcomed wider markets. The Erie Canal, opened in 1825, many of whose labourers were Irish, repaid its roughly \$7 million cost from tolls within about a decade.

The most famous experiment in factory labour was the mills the Boston Associates built at Waltham, Lowell and Lawrence. Their workforce was Yankee women who worked about 73 hours a week, lived in company boarding houses under strict moral rules, and were paid about half of men's wages. They struck, or "turned out", against a wage cut in 1834 and a rent rise in 1836, and in 1845 formed the Lowell Female Labor Reform Association, one of the first unions of working women in the United States. Investors, meanwhile, drew dividends averaging, by one account, 14 per cent a year in 1846–50. As the Yankee women left, owners turned to Irish immigrants fleeing the Great Famine. The mills spun cotton grown by enslaved people in the South, as the chapter on The Industrial Revolution describes.

## Slavery's Capitalism

By the 1860 census four million people were enslaved in the United States. About a million were forcibly moved from the Upper South to the cotton lands of the Deep South, most of them through the domestic slave trade, what Ira Berlin called the "Second Middle Passage". In 1860 Southern slaveholders held enslaved people collectively valued at more than \$3 billion. The chapter on Slavery: a Global History follows this "second slavery" and its cotton economy in detail.

How central was slavery to American capitalism? Historians of the "new history of capitalism" answer: very. Sven Beckert's *Empire of Cotton* (2014) and Edward Baptist's *The Half Has Never Been Told* (2014) placed cotton slavery at the heart of American and global development, and Baptist argued that rising cotton-picking productivity was driven by torture. Seth Rockman's *Scraping By* (2009) set free and enslaved workers side by side in early Baltimore, and Beckert and Rockman's edited volume *Slavery's Capitalism* (2016) gathered the field.

Economic historians pushed back hard. Alan Olmstead judged Baptist's study "flawed beyond repair" and attributed productivity gains mainly to improved cotton varieties; Eric Hilt called Baptist's estimate of cotton's share of the economy "a disastrously mishandled undertaking". Olmstead and Paul Rhode (2018) charged Beckert, Baptist and Walter Johnson with misusing evidence, and a 2020 study rejected the thesis that slavery was necessary for American development.

In the North, as Eric Foner's *Free Soil, Free Labor, Free Men* (1970) showed, slavery's opponents built an ideology around free labour. Lincoln and the Republicans argued that wage work differed from slavery so long as a labourer could expect to rise to self-employment; as the political theorist Michael Sandel notes, they did not challenge the notion that a lifetime of wage labour was comparable to slavery. In his annual message of December 1861, Lincoln told Congress: "Labor is prior to and independent of capital. Capital is only the fruit of labor, and could never have existed if labor had not first existed."

Emancipation did not end unfree labour. The Thirteenth Amendment (1865) abolished slavery "except as a punishment for crime", the constitutional basis for convict leasing: in 1898, 73 per cent of Alabama's annual state revenue came from convict leasing. Sharecroppers typically paid landowners one-half to two-thirds of the crop, under a crop-lien system of credit. The chapter on The American Civil War tells how emancipation came.

```checkpoint
q: Which group made up the largest share of white immigrants to the Thirteen Colonies between the 1630s and the Revolution, by the estimates in this chapter?
a*: Indentured servants, roughly half or more of white immigrants.
a: Convicts transported against their will.
x: Involuntary convicts were about 55,000 of some half a million European immigrants, a minority.
a: Free wage labourers paid by the day.
x: Roughly half or more of white immigrants were bound by indenture, not free wage contracts.
a: Redemptioners from Britain.
x: Redemptioners were mostly non-British Europeans such as Germans, and they were a subset of the indentured.
hint: Think of contracts that bound a worker for years in return for passage.
why: Bound labour, white and Black, was the foundation of the colonial workforce, though by 1775 indentured servants were only 2–3 per cent of it.
---
q: What is the main criticism economic historians such as Alan Olmstead made of Edward Baptist's *The Half Has Never Been Told*?
a: That it ignored slavery altogether.
x: The book is entirely about slavery and its place in American capitalism.
a: That it denied that cotton was grown by enslaved people.
x: No one in the debate denies this; the argument concerns productivity and economic weight.
a*: That it misread the evidence, attributing productivity gains to torture rather than mainly to improved cotton varieties.
a: That it exaggerated Northern opposition to slavery.
x: The criticism concerned Baptist's economic analysis, not abolitionism.
hint: Think of seed and the whip.
why: The "new history of capitalism" debate turns on how far American growth depended on slavery and how evidence about productivity should be read.
```

## Corporations and the Gilded Age

In the "Gilded Age", named from Mark Twain and Charles Dudley Warner's 1873 novel, coal output rose 800 per cent and railway mileage 567 per cent between 1865 and 1898. Andrew Carnegie, a Scottish immigrant who began as a bobbin boy, built a steel empire and in "The Gospel of Wealth" (1889) urged the rich to use their fortunes for society. John D. Rockefeller's Standard Oil refined over 90 per cent of the country's oil by the end of the 1870s, and in 1882 became a trust; by 1900 trusts dominated steel, oil, sugar, meat and farm machinery. (The chapter on The Second Industrial Revolution tells these firms' story.) The Sherman Antitrust Act (1890) was meant to curb such combinations, yet from 1893 until the 1930s courts used it against unions, treated as cartels of workers, and in *Lochner v. New York* (1905) the Supreme Court struck down a limit on bakers' hours as a violation of "freedom of contract".

The workforce was remade by migration. Some 20 million immigrants arrived in the Gilded Age, increasingly from Italy, Poland, Austria-Hungary, Russia and Greece, many of them Jews driven from Eastern Europe. Chinese labourers did much of the building of the Central Pacific Railroad; they struck in 1867; the strike was broken, though the company later quietly raised wages. Their reward was exclusion: the Chinese Exclusion Act of 1882 was the first major federal law to bar all members of a single national group, and it was not repealed until 1943.

## The Great Strikes

On 14 July 1877, after the Baltimore and Ohio cut wages for the third time in a year, railway workers struck at Martinsburg, West Virginia. The strike spread nationwide, involved about 100,000 workers at its height and became a general strike in St. Louis. Militias, the National Guard and federal troops sent by President Hayes put it down; an estimated 126 to 160 people were killed.

The Knights of Labor, whose leader Terence Powderly called strikes "a relic of barbarism", grew to over 700,000 members by 1886, the largest labour organisation of its day. The Knights admitted women and some 60,000 African Americans, and in the Thibodaux massacre in Louisiana in 1887 at least 35, perhaps 50, Black sugar workers and family members were killed; yet they excluded Asians, and Knights in Tacoma expelled the city's Chinese residents in 1885. The Knights shrank after the Haymarket bombing in Chicago in May 1886 (told in the chapter on The Second Industrial Revolution). In their place rose the American Federation of Labor, founded in December 1886 by craft unions under the London-born cigar maker Samuel Gompers. Craft unions generally welcomed European immigrants but often excluded women, Black and Chinese workers.

At Carnegie Steel's Homestead Works in Pennsylvania in 1892, Henry Clay Frick, who ran the company for its main owner, Carnegie, locked out the Amalgamated Association of Iron and Steel Workers. On 6 July strikers fought off some 300 Pinkerton agents arriving by barge; seven workers and between three and eight Pinkertons were killed. Over 4,000 state militia then arrived, and after an anarchist with no link to the union shot Frick, sympathy ebbed; the union was broken. In 1894 Pullman workers struck against wage cuts made without any cut in the rents of the company town, and Eugene Debs's American Railway Union boycotted trains carrying Pullman cars; at its peak about 250,000 workers in 27 states took part. A federal injunction and some 12,000 Army troops broke the strike; about 30 people were killed in Chicago and, by one estimate, around 40 more elsewhere, and Debs went to jail.

{{image: Homestead strike | The Homestead strike of 1892 at Carnegie Steel's works in Pennsylvania.}}

## Wobblies, Reformers and Fordism

The Industrial Workers of the World, founded in Chicago in June 1905 by Big Bill Haywood, Debs, Lucy Parsons, Mother Jones and others, was the only American union of its day to welcome all workers, including women, immigrants, African Americans and Asians, and it had wings in Britain, Canada, Australia and New Zealand.

```quote
This is the Continental Congress of the working class. We are here to confederate the workers of this country into a working-class movement that shall have for its purpose the emancipation of the working class from the slave bondage of capitalism.
William D. "Big Bill" Haywood · Founding convention of the IWW, Chicago · June 1905
```

In the Lawrence "Bread and Roses" strike of 1912 the IWW united workers of more than 51 nationalities, mostly immigrant women. Repression was fierce: at Bisbee in 1917 some 1,200 to 1,300 strikers and sympathisers were deported in cattle cars to the New Mexico desert. At Ludlow, Colorado, on 20 April 1914, the National Guard and guards of the Rockefeller-controlled Colorado Fuel and Iron attacked a tent colony of striking miners and their families, killing about 21 people, mostly wives and children. In New York, the Triangle Shirtwaist fire of 1911, described in the chapter on Modern American History: the United States in the Twentieth Century, killed 146 garment workers, mostly Italian and Jewish immigrants, behind locked doors.

Managers sought control of the work itself through Frederick Winslow Taylor's scientific management (1911) and what Antonio Gramsci called "Fordism", mass production joined to mass consumption; the Soviet Union imported both. Ford fought the United Auto Workers longest, beating organisers at the "Battle of the Overpass" in 1937, and recognised the union only in 1941. Meanwhile the Great Migration carried some six million Black Americans from the rural South to other regions' cities between 1910 and 1970, and the Immigration Act of 1924 sharply restricted immigration.

## Depression and the New Deal

The crash of October 1929, which the chapter on The Interwar Period sets in global context, erased about 90 per cent of the stock market's peak value by July 1932, and unemployment reached an estimated 22.5 to 24.9 per cent. As jobs vanished, hundreds of thousands of Mexicans and Mexican Americans, including US citizens, were "repatriated" to Mexico.

The New Deal rebuilt the rules. Glass–Steagall (1933) separated commercial from investment banking. The National Labor Relations Act (Wagner Act) of 1935 guaranteed private-sector workers the right to organise, bargain and strike, but excluded agricultural and domestic workers; the Social Security Act of the same year excluded them too, leaving 65 per cent of African American workers initially outside it. The Fair Labor Standards Act of 1938 set a minimum wage of 25 cents an hour and banned "oppressive child labor", but at first excluded farmworkers. Whether these exclusions were racially designed is debated in the chapter on Modern American History.

The law alone did not organise anyone. In 1935 John L. Lewis of the United Mine Workers and other AFL leaders launched what became, in 1938, the separate Congress of Industrial Organizations (CIO), which built industrial unions and was open to African Americans. In the Flint sit-down strike of 1936–37, workers occupied General Motors plants for 44 days, backed by a women's Emergency Brigade, while Governor Frank Murphy refused to use force against them. GM recognised the UAW, whose membership leapt from 30,000 to 500,000 within a year. U.S. Steel signed without a strike, but at Republic Steel on Memorial Day 1937 Chicago police killed ten pickets.

A. Philip Randolph, leader of the Brotherhood of Sleeping Car Porters, pressed the state from the other side: his threatened march on Washington led Roosevelt in 1941 to ban discrimination in defence industries. The next year the Bracero Program began bringing Mexican farmworkers north; by 1964 it had issued about 4.6 million contracts.

```checkpoint
q: Which workers did the Wagner Act of 1935 exclude from its protection of the right to organise?
a: Steelworkers and car workers.
x: Industrial workers in steel and cars were the very workers the CIO organised under the Act.
a*: Agricultural and domestic workers, among others.
a: All immigrants.
x: The Act made no such exclusion; immigrant workers were at the heart of the CIO drives.
a: Railway workers only.
x: The exclusions that mattered most fell on farm and household labour.
hint: Think of the fields and the household.
why: The exclusion of farm and domestic workers left many Black workers and farmworkers outside the New Deal's labour protections.
---
q: What happened in the Flint sit-down strike of 1936–37?
a: Federal troops cleared the plants by force.
x: Governor Frank Murphy refused to use force against the strikers.
a: The UAW lost and was dissolved.
x: The strike ended in victory; UAW membership grew from 30,000 to 500,000 within a year.
a: Steelworkers struck against U.S. Steel.
x: U.S. Steel signed with the CIO without a strike; Flint concerned General Motors.
a*: Workers occupied General Motors plants for 44 days until GM recognised the United Auto Workers.
hint: Think of workers who stayed inside the factory.
why: Flint showed how industrial unions, backed by a sympathetic state, could defeat the largest corporations.
```

## The Postwar Accord

Peace brought the largest strike wave in American history: four to five million workers struck in 1945–46. Congress answered with the Taft–Hartley Act of 1947, passed over Truman's veto, which among other things required union leaders to swear they were not Communists. The CIO's postwar drive to organise Southern textile mills, Operation Dixie, largely failed.

In the North an accommodation emerged. In 1950 Walter Reuther, UAW president since 1946, signed a five-year contract with GM that traded a commitment not to strike for rising wages tied to living costs and productivity, health care and pensions, a bargain that came to be called the "Treaty of Detroit". Union density peaked in 1954 at almost 35 per cent. The sharp narrowing of incomes in the 1940s, which lasted into the 1970s, is called the "Great Compression"; Paul Krugman credited it partly to unions.

The accord left many outside. In Memphis in 1968, after two of their colleagues were crushed in a garbage compactor, more than 1,300 Black sanitation workers struck carrying placards that read "I Am A Man". Martin Luther King Jr. gave his "I've Been to the Mountaintop" speech in their support on 3 April and was assassinated the next day; the city then recognised their union. In California, Filipino grape workers led by Larry Itliong began the Delano grape strike in 1965, and the mainly Mexican National Farm Workers Association of César Chávez and Dolores Huerta joined a week later; the two merged into what became the United Farm Workers. A consumer boycott of grapes won contracts in 1970, and because farmworkers had been left out of the Wagner Act, California passed its own farm labour law in 1975.

## Deindustrialisation and the Retreat of Unions

From the late twentieth century the industrial heartland became the Rust Belt. Competition from Germany and Japan, the high interest rates of the Volcker shock (1979–82), the move of plants to the lower-wage South, automation and trade liberalisation all played a part. Manufacturing employment has declined since 1979, although manufacturing value added reached a record in current dollars in 2024.

In August 1981 about 13,000 air traffic controllers struck; President Reagan fired 11,345 of them and banned them from federal service for life, as the chapter on The Neoliberal Age describes. Major strikes and lockouts fell from 381 in 1970 to 11 in 2010. The other face of American deindustrialisation was industrialisation abroad, in Mexico's maquiladoras after NAFTA (1994) and in China. How many American jobs trade cost is disputed: David Autor, David Dorn and Gordon Hanson estimate that Chinese import competition cost about 1.5 million US manufacturing jobs in 1990–2007, while Caliendo, Dvorkin and Parro attribute only about 16 per cent of the 2000–07 losses (some 550,000 jobs) to China. Meanwhile came financialisation, which Greta Krippner defines as a "pattern of accumulation in which profit making occurs increasingly through financial channels rather than through trade and commodity production".

## 2008 and After

The Great Recession (December 2007 to June 2009) cost about 8.7–8.8 million jobs; unemployment peaked at 10.0 per cent in October 2009. Congress created a rescue fund of up to \$700 billion (the chapter on The Neoliberal Age tells the crisis), and median household wealth fell 35 per cent between 2005 and 2010.

Workers began to push back. Nearly half a million workers struck in 2018 alone, the most since 1986, and over 400,000 in 2019, including statewide teachers' strikes. In a vote counted on 1 April 2022, workers at Amazon's JFK8 warehouse on Staten Island chose the Amazon Labor Union by 2,654 to 2,131, the first union of Amazon workers in the United States to win an election overseen by the National Labor Relations Board. In 2023, under Shawn Fain, the UAW struck Ford, GM and Stellantis simultaneously for the first time and won contracts including 25 per cent raises at Ford. Yet according to the Bureau of Labor Statistics release of 18 February 2026, union density in 2025 was 10.0 per cent of wage and salary workers (14.7 million members), an estimate built on 11 months of data because a government shutdown stopped the October survey. The rate was 32.9 per cent in the public sector and 5.9 per cent in the private sector, against 20.1 per cent overall in 1983.

How much this matters for inequality is argued. Estimates of how much of the rise in wage inequality union decline explains range from about a fifth to a third (Western and Rosenfeld) up to around a half. Thomas Piketty, Emmanuel Saez and Gabriel Zucman find a sharp rise in the top 1 per cent's share of income; Gerald Auten and David Splinter, measuring after-tax income differently, find the share barely changed.

## Historians and the American Worker

Before the 1960s, labour history meant the "Wisconsin school" of John R. Commons, which studied unions as institutions. The "new labour history", inspired by E. P. Thompson, turned to workers' culture and community. Its leaders were Herbert Gutman (*Work, Culture, and Society in Industrializing America*, 1976) and David Montgomery, a former machinist, whose *The Fall of the House of Labor* (1987) remains a classic. Lizabeth Cohen's *Making a New Deal* (1990) showed Chicago's ethnic workers forging a "culture of unity" that made the CIO possible, while Jefferson Cowie's *The Great Exception* (2016) argues that the New Deal order was an anomaly, made possible partly by the closing of mass immigration. Behind them lies the old question of American "exceptionalism" framed by Werner Sombart's *Why Is There No Socialism in the United States?* (1906). More recently the new historians of capitalism have put slavery and finance back at the centre, in what one reviewer calls one of the field's first large-scale syntheses, Jonathan Levy's *Ages of American Capitalism* (2021); their critics in economic history insist that the numbers be got right.

## Further exploration

- **David Montgomery, *The Fall of the House of Labor: The Workplace, the State, and American Labor Activism, 1865–1925* (1987).** The classic of the new labour history.
- **Seth Rockman, *Scraping By: Wage Labor, Slavery, and Survival in Early Baltimore* (2009).** Free and unfree workers side by side in an early-republic city.
- **Tera W. Hunter, *To 'Joy My Freedom: Southern Black Women's Lives and Labors After the Civil War* (1997).** Black domestic workers and washerwomen in Atlanta.
- **Lizabeth Cohen, *Making a New Deal: Industrial Workers in Chicago, 1919–1939* (1990).** How ethnic workers became New Deal and CIO loyalists.
- **Jefferson Cowie, *Stayin' Alive: The 1970s and the Last Days of the Working Class* (2010).** Deindustrialisation and the politics of class.
- **Jonathan Levy, *Ages of American Capitalism: A History of the United States* (2021).** A synthesis from the new history of capitalism.$mn_uslabor_master$,
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
  select $mn_uslabor_quiz$[
    {"type": "mcq", "prompt": "In Hamilton's financial programme of 1790, what did the federal government take on in exchange for placing the permanent capital on the Potomac?", "options": ["The states' war debts", "The ownership of the western lands", "The cost of the Erie Canal", "Responsibility for the slave trade"], "answerIndex": 0, "explanation": "In the Compromise of 1790 Hamilton won federal assumption of the states' debts in exchange for siting the capital on the Potomac, as Jefferson and Madison wanted.", "id": "q1"},
    {"type": "mcq", "prompt": "What was distinctive about the Industrial Workers of the World when it was founded in Chicago in 1905?", "options": ["It admitted only skilled craftsmen", "It was the only American union to welcome all workers, including women, immigrants, African Americans and Asians", "It opposed all strikes as a relic of barbarism", "It was founded by Samuel Gompers"], "answerIndex": 1, "explanation": "Unlike the craft unions of the AFL, the IWW sought to organise all workers; its founders included Big Bill Haywood, Eugene Debs, Lucy Parsons and Mother Jones.", "id": "q2"},
    {"type": "mcq", "prompt": "According to the Bureau of Labor Statistics release of 18 February 2026, what share of US wage and salary workers were union members in 2025?", "options": ["About 35 per cent", "20.1 per cent", "10.0 per cent", "5.9 per cent"], "answerIndex": 2, "explanation": "The 2025 rate was 10.0 per cent (14.7 million members), an estimate built on 11 months of data; 5.9 per cent was the private-sector rate, 20.1 per cent the 1983 rate, and almost 35 per cent the 1954 peak.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened in the PATCO strike of August 1981?", "options": ["Congress passed the Taft–Hartley Act", "General Motors recognised the United Auto Workers", "Memphis recognised its sanitation workers' union", "President Reagan fired 11,345 striking air traffic controllers and banned them from federal service"], "answerIndex": 3, "explanation": "About 13,000 controllers struck on 3 August 1981; Reagan fired 11,345 of them, a signal of the new climate for unions.", "id": "q4"},
    {"type": "open", "prompt": "How central was slavery to the development of American capitalism? Discuss the 'new history of capitalism' and its critics.", "rubric": "A strong answer uses the evidence of the cotton economy (four million enslaved by 1860, about a million moved by the domestic slave trade, enslaved people valued at more than $3 billion in 1860, Northern mills and merchants tied to slave-grown cotton and the triangular trade), sets out the arguments of Beckert, Baptist (including the 'torture' explanation of productivity), Rockman and Levy, and weighs the critiques of Olmstead, Hilt, Olmstead and Rhode (2018) and the 2020 study (improved cotton varieties, cotton's share of the economy, misuse of evidence), reaching a reasoned judgement.", "id": "q5"},
    {"type": "open", "prompt": "Was the New Deal order of strong unions an exception in American history? Use evidence from before and after the 1930s.", "rubric": "A strong answer contrasts the repression of earlier labour movements (1877, Homestead, Pullman, the IWW, Ludlow, the Sherman Act used against unions) with the Wagner Act, the CIO and Flint, notes the New Deal's exclusions of farm and domestic workers and the limits shown by Operation Dixie, Memphis and Delano, describes the postwar accord (Treaty of Detroit, density near 35 per cent in 1954, the Great Compression) and its decline (Taft–Hartley, deindustrialisation, PATCO, trade, density of 10.0 per cent in 2025), and engages with Cowie's 'great exception' argument and Cohen's account of how the CIO was built.", "id": "q6"}
  ]$mn_uslabor_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/capitalism-and-labor-in-the-united-states', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
