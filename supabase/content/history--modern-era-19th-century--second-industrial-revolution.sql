-- The Second Industrial Revolution — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/the-second-industrial-revolution @ research/advanced/read.
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
    'history/modern-era-19th-century/the-second-industrial-revolution',
    'research',
    'advanced',
    'read',
    $mn_secondind_master$> **Steel, science and a shrinking world.** Between about 1870 and 1914 a second wave of industrialisation ran on steel, electricity, synthetic chemistry, oil and the internal-combustion engine, and on laboratories that made invention a business. This chapter follows the new technologies from the Bessemer converter to Ford's assembly line; the cables, steamships and refrigerated holds that made a first global economy; and the corporations that ran it. It shows the United States and Germany overtaking Britain, Japan, Russia and India building industries of their own, and the raw materials, from Congo rubber to Chilean nitrate and Malayan tin, that fed the machines. It ends with the workers, women and children who laboured, and with historians' debates.

## A Second Revolution?

The chapter on the Industrial Revolution follows Britain's transformation to the mid-nineteenth century. After it came a slowdown in important inventions, and then, from around 1870 until the First World War began in 1914, a new cluster: the second industrial revolution, sometimes called the "Technological Revolution". Its roots lay in machine tools, interchangeable parts and the steelmaking of the 1850s and 1860s. Its main centres were Britain, Germany and the United States, but also France, the Low Countries and Japan.

Patrick Geddes introduced the idea of a "second industrial revolution" in 1910; David Landes and Alfred Chandler made it standard among scholars, though some still have reservations about it. Vaclav Smil calls 1867–1914 "The Age of Synergy", because its great innovations emerged together and rested on science and engineering.

Growth was not smooth. Prices of almost all goods fell, causing business failures and periods called "depressions" even as the world economy grew. The Long Depression began in 1873, and British opinion held that Britain was in continuous depression until as late as 1896.

## Cheap Steel

Steel had been too expensive for bridges or building frames, so the first revolution was built of wrought iron. In 1856 **Henry Bessemer** patented a process that blew air through molten pig iron, burning off excess carbon and impurities while the heat of oxidation kept the metal molten.

At first licensees made steel that was "rotten hot and rotten cold", until Robert Mushet added spiegeleisen, a manganese-bearing alloy. The price of steel fell from £40 a long ton to £6–7, and steel rails lasted more than ten times as long as iron. The Siemens–Martin open hearth (1865) became the leading method by the early twentieth century, and the "basic" process of Sidney Gilchrist Thomas and his cousin Percy Gilchrist (1877–78) removed phosphorus, opening the phosphoric ores of Lorraine, Belgium and Germany.

{{image: Bessemer process | A schematic diagram of a Bessemer converter, which made steel cheap by blowing air through molten iron.}}

**Andrew Carnegie** opened his Edgar Thomson Steel Works in 1875 and cut the price of steel rails from \$100 a ton to \$18 by the 1890s. US steel output passed Britain's by 1889 and reached 26 million tons a year by 1910. Steel, railways and coal fed one another: in the 1880s the United States laid 75,000 miles of track.

## Chemistry and the Laboratory

The new industries rested on science in a way the old ones had not. In 1856 **William Henry Perkin**, trying in London to synthesise the antimalarial quinine, made mauveine by accident, the first synthetic dye to be sold commercially. The industry soon became German. BASF, founded in 1865, built its works at Ludwigshafen because Mannheim's council feared the pollution. Bayer launched Aspirin in 1899, and from 1898 to 1910 also sold heroin as a cough suppressant, presented as a non-addictive substitute for morphine.

By 1913 eight German firms, led by BASF, Bayer and Hoechst, made almost 90 per cent of the world's dyestuffs and sold about 80 per cent of their output abroad. Chandler called them "the world's first truly managerial industrial enterprises". Germany's lead rested on universities and industrial laboratories.

In 1909 **Fritz Haber** made ammonia from atmospheric nitrogen in the laboratory; **Carl Bosch** scaled the process up for BASF, and the first plant opened in 1913. Haber–Bosch freed Germany, and eventually the world, from dependence on mined Chilean nitrate and guano, and by one estimate about half the nitrogen in human bodies now comes from it. Haber also became known as the "father of chemical warfare" for weaponising chlorine gas at the Second Battle of Ypres; his wife Clara Immerwahr, the first woman to earn a chemistry doctorate at the University of Breslau, killed herself on 2 May 1915.

## Electric Light and the War of the Currents

In 1876 **Thomas Edison** built a laboratory at Menlo Park, New Jersey, now considered the first industrial research laboratory. He held 1,093 US patents, many for inventions largely made by his staff. Electric light came from two directions: Joseph Swan's lamps lit a Newcastle street in 1879 and London's Savoy Theatre in 1881, while Edison patented a carbon-filament lamp. Edison's Pearl Street Station in New York began generating direct current on 4 September 1882, at first for 400 lamps belonging to 82 customers.

Direct current travelled poorly. **Nikola Tesla**, a Serb from the Austrian Empire who had worked briefly for Edison, developed in 1887 a polyphase alternating-current motor, which George Westinghouse licensed in 1888. The "war of the currents" followed. The engineer Harold P. Brown, apparently in collusion with the Edison company, publicly electrocuted dogs and a horse in 1888 to show that AC was deadly. A famous story adds that Edison killed the elephant Topsy in 1903 to discredit AC. It is a myth: Edison was never at Luna Park and the killing had nothing to do with the war of the currents, though an Edison company crew filmed it.

AC won: Westinghouse lit the Chicago exposition of 1893 and won most of the Niagara Falls contract. Charles Parsons's steam turbine (1884) made electricity cheap, but household electrification became common only in the 1920s, and then only in cities.

## Engines, Cars and Oil

Nicolaus Otto's four-stroke engine of 1876 was the first widely used internal-combustion engine. **Gottlieb Daimler** and **Wilhelm Maybach** designed a high-speed petrol engine in 1883, and **Karl Benz** applied for a patent for an "automobile fueled by gas" in January 1886. In August 1888, supposedly without telling her husband, **Bertha Benz** drove the car about 106 km from Mannheim to Pforzheim with her two sons, buying fuel at a pharmacy in Wiesloch and having a shoemaker nail leather to the brakes. That year Benz began selling the Motorwagen commercially, among the first cars offered for sale.

Oil was first sold as kerosene for lamps. Edwin Drake's 1859 well in Pennsylvania is considered the first modern oil well; Drake adapted the cable-tool method of salt-well drillers, a technique first developed in ancient China. **John D. Rockefeller**'s Standard Oil used secret railway rebates and buy-outs to control 88 per cent of the refined oil flowing in the United States by 1890. Ida Tarbell exposed it in McClure's in 1902–04, and in 1911 the Supreme Court ordered it broken up under the Sherman Antitrust Act of 1890.

Yet the world's oil centre for a time was not American. At **Baku**, on the Caspian in the Russian Empire, Robert and Ludvig Nobel, brothers of Alfred, opened a refinery in 1876; Ludvig's *Zoroaster* (1878) was the world's first successful oil tanker. Between 1898 and 1901 Baku produced more oil than the United States, and by 1901 about half the world's oil. It was not only a Nobel story: Armenians reportedly ran almost a third of the region's oil business, and the Azerbaijanis Zeynalabdin Taghiyev and Musa Nagiyev were among its leading magnates.

## Wiring the World

The first transatlantic cable carried its first official messages on 16 August 1858, including Queen Victoria's to President Buchanan. Three weeks later it failed, after Wildman Whitehouse applied excessive voltage. The *Great Eastern* laid a lasting cable in 1866. Cables were insulated with gutta-percha, a latex from Southeast Asian trees whose name comes from Malay. By 1870 Bombay was linked to London by cable, and by 1872 Singapore and Australia, and British cable systems dominated the world until 1911. By 1890 merchants in England could order goods from India or China by telegraph for delivery by steamship, cutting out middlemen. Marconi's wireless crossed the Atlantic in 1901.

The telephone had a disputed birth. On 14 February 1876 Alexander Graham Bell's lawyer filed his patent application on the same day that Elisha Gray's lawyer filed a caveat. Bell's patent was granted on 7 March, and three days later he said "Mr. Watson, come here, I want to see you" through a liquid transmitter similar to Gray's design. Antonio Meucci's voice-transmission devices, developed from 1849 onwards and later called the *telettrofono*, are credited by several sources as the first telephone; he filed a caveat in 1871 but let it lapse after 1874. A 2002 US House resolution declared that if he had been able to pay the \$10 fee, "no patent could have been issued to Bell"; Canada's House of Commons replied by declaring Bell the inventor. The telephone also opened a new job for women: in 1878 a Boston exchange replaced its boy operators with women, starting with Emma Nutt.

```checkpoint
q: What happened to the first transatlantic telegraph cable of 1858?
a*: It carried messages, including Queen Victoria's to President Buchanan, but failed after three weeks when excessive voltage was applied.
a: It worked continuously until it was replaced in 1902.
x: It failed after only three weeks; a lasting cable came in 1866.
a: It was cut deliberately by the Royal Navy in wartime.
x: The failure came from Wildman Whitehouse's excessive voltage, not sabotage.
a: It was never laid because gutta-percha insulation was not yet known.
x: Gutta-percha insulated the first transatlantic cable itself.
hint: Think of Wildman Whitehouse.
why: The 1858 failure shows that the new networks were hard-won; a working cable took until 1866.
---
q: Why is the story that Edison killed the elephant Topsy to discredit AC misleading?
a: Because Topsy was killed by Westinghouse, not Edison.
x: Westinghouse had nothing to do with it either.
a: Because Topsy was never killed.
x: The elephant was killed in 1903, and an Edison company crew filmed it.
a*: Because Edison was never at Luna Park and the killing was not part of the war of the currents, though an Edison company crew filmed it.
a: Because the war of the currents ended in 1850.
x: The war of the currents was fought in the late 1880s and early 1890s.
hint: Separate who filmed it from who staged it.
why: The real anti-AC stunts were Harold P. Brown's electrocutions of animals in 1888; the Topsy story is a later myth.
```

## The First Globalisation

In 1882 the refrigerated sailing ship *Dunedin* carried almost 5,000 sheep and lamb carcasses from New Zealand to London in 98 days, with only one condemned, and began the frozen meat trade. Gustavus Swift's ice-cooled railway car of 1878 ushered in an "era of cheap beef" from Chicago, and wars spread canned food to working-class men.

After the German Empire moved from silver to gold in the early 1870s, others followed: the United States in effect in 1873 (formally in 1900), India in 1893, Russia and Japan in 1897. More than 30 million Europeans migrated to the United States between 1836 and 1914, but the Chinese Exclusion Act of 1882 barred Chinese labourers from immigrating. More than 1.6 million Indians went overseas under indenture, and some 140,000 to 150,000 Chinese labourers were shipped to Cuba before that trade ended in the mid-1870s.

Kevin O'Rourke and Jeffrey Williamson treat the convergence of commodity prices as the core evidence of a first globalisation, argue that mass migration narrowed wage gaps across the Atlantic economy, and describe a backlash of tariffs and immigration restriction. Looking back from 1919, John Maynard Keynes caught the confidence of the age:

```quote
The inhabitant of London ... regarded this state of affairs as normal, certain, and permanent, except in the direction of further improvement, and any deviation from it as aberrant, scandalous, and avoidable.
John Maynard Keynes · The Economic Consequences of the Peace · 1919
```

## Big Business and the Assembly Line

Chandler argued that railways created the modern business enterprise, with departments, lines of authority and accounting that other industries copied. By 1900 a few corporations, some organised as trusts, dominated US steel, oil, sugar, meatpacking and farm machinery. In 1901 the banker J. P. Morgan merged Carnegie Steel and two rivals into U.S. Steel, the world's first billion-dollar corporation. In Germany cartels were legal and enforceable in court, and banks were central to financing industry.

**Frederick Winslow Taylor**, once a foreman at Midvale Steel, replaced rule of thumb with the scientific study of tasks, with managers planning and workers executing; his *Principles of Scientific Management* appeared in 1911. Moulders at the Watertown Arsenal walked out against the system that year, and historians question Taylor's story of the pig-iron handler "Schmidt". Lenin called Taylorism "a 'scientific' system of sweating" in 1913, then, in power in 1918, urged Russians to learn from it.

Chicago's meatpackers had used "disassembly lines" since 1867. Henry Ford's moving assembly line, begun at Highland Park, Michigan, in October 1913, cut the final assembly of a Model T from 12.5 man-hours to about 93 minutes. Prices fell steeply, from about \$825 in 1908 to \$575 in 1912 by one count, or from \$780 in 1910 to \$360 in 1916 by another. Ford's best-known line needs a caveat:

```quote
Any customer can have a car painted any color that he wants so long as it is black.
Henry Ford · My Life and Work · 1922
```

In fact, from 1908 to 1913 the Model T was not available in black at all, but in grey, green, blue and red; the black-only policy began in 1914. That January Ford announced the \$5 day, more than doubling minimum pay for qualifying men. It answered high turnover (in 1913 Ford had to hire 963 men to add 100), and eligibility depended on approval by the company's Social Department investigators.

## Challengers: America, Germany and the Late Developers

By 1900, on one measure, Britain still made 24 per cent of the world's industrial output, against 19 per cent for the United States and 13 per cent for Germany. On other measures the lead had already gone: the United States overtook Britain in manufacturing by 1895, and on Paul Bairoch's estimates Germany's share of world manufacturing in 1913, 14.8 per cent, exceeded Britain's 13.6. German steel output had passed Britain's in 1893, and by 1911–13 Germany made about a quarter of the world's steel. Explanations include a late start that allowed copying of best practice, heavier research spending, no costly worldwide empire to defend, and Lorraine's industry after 1871. Most governments raised tariffs; Britain, unusually, kept free trade.

Elsewhere, states drove industry. Japan's industrialisation belongs to the wider story told in the chapter The Meiji Restoration. Under the slogan *fukoku kyōhei*, "rich nation, strong army", the government built model factories with foreign experts, then sold many to well-connected entrepreneurs; after the late 1880s most growth came from private *zaibatsu* such as Mitsui and Mitsubishi. The Tomioka Silk Mill opened in 1872 with about 210 women workers, recruited despite rumours that the wine-drinking foreigners drank workers' blood. Silk exports paid for imported technology, by the 1890s Japanese textiles competed with British goods in China and India, and the Yahata steelworks lit its first blast furnace in 1901.

In Russia, Sergei Witte, Minister of Finance from 1892 to 1903, pushed the Trans-Siberian Railway, raised tariffs, borrowed abroad and adopted gold, and industrial output grew about 8 per cent a year in the 1890s, among the fastest in the world, though peasants were still 80 per cent of the population. In India, Bombay had 136 cotton mills by 1900, owned by families such as the Tatas, Petits, Wadias and Sassoons, their workers crowded into chawls in Girangaon, the "mill village". Jamsetji Tata named a Bombay mill "Svadeshi" before the Swadeshi movement began, and the Tata Iron and Steel Company was founded in 1907 with Indian money, making steel at Jamshedpur from 1912. Yet India's share of world industrial output had fallen, on Bairoch's estimates, from about a quarter in 1750 to under 2 per cent in 1900.

## Commodity Frontiers

Machines needed raw materials from far away. Jason W. Moore coined the concept of "commodity frontiers", which historians such as Sven Beckert describe as places at the edge of capitalism's expansion where raw materials are turned into commodities. After the inflatable tyre created a rubber boom around 1890, King Leopold II's Congo Free State extracted rubber with forced labour, quotas, hostage-taking and severed hands, as the chapter Imperial Expansion and Resistance describes; estimates of the population decline range from 1.2 million to 10 million, the demographer Jean-Paul Sanderson argues for 1 to 5 million, and disease was the main direct killer. In the Amazon, Julio César Arana's company enslaved Indigenous peoples of the Putumayo. Brazil's monopoly ended after rubber seeds smuggled out in 1876 were planted by the British in Malaya and Ceylon.

In Malaya some 40,000 Chinese miners worked the tin of Larut by about 1870; wars between rival societies ended with the Pangkor Treaty of 1874 and British intervention, and Malaya was the world's largest tin producer by 1883. Chile fought Bolivia and Peru in the War of the Pacific (1879–84), triggered by a Bolivian tax on a Chilean nitrate company with British capital, and won the nitrate provinces, leaving Bolivia landlocked. Some historians stress Chilean elites' interest in nitrate wealth, others geopolitics. Nitrate taxes then supplied roughly half of Chile's government revenue, with estimates from 45 to over 50 per cent.

## Labour, Women and Children

Workers organised: the Knights of Labor grew from about 100,000 members in 1884 to over 700,000 by 1886. On 1 May 1886 between 300,000 and half a million American workers struck for an eight-hour day, singing "Eight Hours for work. Eight hours for rest. Eight hours for what we will." In Chicago on 4 May a bomb was thrown at police at the Haymarket; seven policemen and at least four workers died. Historians disagree over who killed the police: Paul Avrich thought most died from their own side's gunfire, while Timothy Messer-Kruse believes protesters shot several. Eight anarchists were convicted, though none was shown to have thrown the bomb, and four were hanged. The Second International, founded in 1889, called for demonstrations on 1 May 1890, the origin of May Day. Germany's Social Democrats became the largest party in the Reichstag in 1912. Unrest was global: in 1907 troops crushed a riot at Japan's Ashio copper mine, and unrest spread to the Besshi mine, and in July 1908 Bombay's mill workers struck for six days after Bal Gangadhar Tilak was sentenced to six years for sedition, a strike whose size is uncertain (contemporary reports said about 14,000; later estimates run to over 100,000).

Women's work was central. In July 1888 about 1,400 women and girls, mostly Irish or of Irish descent, walked out of the Bryant & May match factory in London, where white phosphorus caused "phossy jaw"; they won the end of fines and founded a union. In the United States women were about 14 per cent of the paid workforce in 1870. New department stores, from Au Bon Marché in Paris to Selfridges in London (1909) and Mitsukoshi in Tokyo (1904), gave middle-class women respectable public spaces of their own. In Japan's textile mills most workers were women, half of them under 20, sent by their fathers, to whom they handed their wages. Children worked too: the 1900 census counted about 1.75 million American children aged 10 to 15 at work, most on farms but many in mills, mines and factories, as Lewis Hine's photographs of the 1910s documented.

```checkpoint
q: Why did Henry Ford introduce the \$5 day in 1914?
a: Because the Sherman Antitrust Act required it.
x: The Sherman Act concerned monopolies, not wages.
a*: Partly to cure high turnover on the assembly line, with eligibility policed by the Social Department.
a: Because the Model T's price was rising and workers could not afford it.
x: Model T prices were falling steeply in these years.
a: Because the Second International demanded it.
x: The Second International had no say over Ford's pay.
hint: Think of the 963 men hired to add 100.
why: Historians debate how far the \$5 day was generosity and how far a cure for turnover and a tool of social control.
---
q: What did the Matchgirls' strike of 1888 achieve?
a: A ban on all women's factory work in Britain.
x: The strikers wanted better conditions, not to stop working.
a: The immediate closure of Bryant & May.
x: The firm continued; the women won concessions from it.
a: An eight-hour day for all British workers.
x: The eight-hour day was the aim of the 1886 US strikes, not the outcome of the matchgirls' strike.
a*: The abolition of fines and deductions and the founding of the largest union of women and girls in the country.
hint: Think of what Annie Besant's exposé complained of.
why: The strike showed that low-paid women, often dismissed as unorganisable, could win.
```

## Interpreting the Age

Was this a new revolution? Joel Mokyr argued that after 1870 the feedback between science and technique accelerated, but that the difference from the first revolution was a matter of degree, since many techniques still emerged with little scientific basis. Robert Gordon sees 1870–1970 as a "Special Century" built on one-time "Great Inventions" such as electricity and clean water.

On Britain's relative decline, an older view and Martin Wiener's cultural argument blamed British entrepreneurs; Deirdre McCloskey found British steelmakers performed about as well as German and American ones, and William Lazonick says the debate is far from settled. Alexander Gerschenkron argued that latecomers such as Russia industrialised in sharper spurts, with the state and banks standing in for missing prerequisites. Flynn and Giráldez dispute O'Rourke and Williamson's dating of globalisation, looking back to the sixteenth-century silver trade, and for India historians debate whether colonial rule drove deindustrialisation or brought investment.

The age ended in war. The Second International's anti-war resolutions failed in July 1914; the major socialist parties backed their nations, and the International collapsed on 4 August. The networks, laboratories and factories of the Second Industrial Revolution now served the war.

## Further exploration

- **David S. Landes, *The Unbound Prometheus: Technological Change and Industrial Development in Western Europe from 1750 to the Present* (1969).** The classic case for a "second" industrial revolution.
- **Alfred D. Chandler Jr., *The Visible Hand: The Managerial Revolution in American Business* (1977).** The prize-winning argument that salaried managers built the modern corporation.
- **Vaclav Smil, *Creating the Twentieth Century: Technical Innovations of 1867–1914 and Their Lasting Impact* (2005).** The "Age of Synergy" and its inventions.
- **Kevin H. O'Rourke and Jeffrey G. Williamson, *Globalization and History: The Evolution of a Nineteenth-Century Atlantic Economy* (1999).** The economics of the first globalisation and the backlash against it.
- **Robert J. Gordon, *The Rise and Fall of American Growth: The U.S. Standard of Living Since the Civil War* (2016).** How the "Great Inventions" transformed daily life.
- **Jürgen Osterhammel, *The Transformation of the World: A Global History of the Nineteenth Century* (English edition 2014).** A global, non-Eurocentric frame for the century.
- **Adam Hochschild, *King Leopold's Ghost: A Story of Greed, Terror and Heroism in Colonial Africa* (1998).** The Congo rubber terror and the campaign against it.$mn_secondind_master$,
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
  select $mn_secondind_quiz$[
    {"type": "mcq", "prompt": "What did the Bessemer process, patented in 1856, do to the price of steel?", "options": ["Cut it from about £40 a long ton to £6–7", "Doubled it, because the process used so much fuel", "Left it unchanged until the 1920s", "Cut it from £6 to £4 a long ton"], "answerIndex": 0, "explanation": "Blowing air through molten pig iron made steel cheap enough for rails; with the later open-hearth process, steel also replaced wrought iron in bridges and building frames.", "id": "q1"},
    {"type": "mcq", "prompt": "Between 1898 and 1901, which place produced more oil than the United States?", "options": ["Titusville, Pennsylvania", "The Ruhr", "Baku, in the Russian Empire", "Port Chalmers, New Zealand"], "answerIndex": 2, "explanation": "Baku, developed by the Nobel brothers' Branobel and by Armenian and Azerbaijani oilmen, produced about half the world's oil by 1901.", "id": "q2"},
    {"type": "mcq", "prompt": "What is true of Henry Ford's remark that customers could have a car 'any color ... so long as it is black'?", "options": ["The Model T was only ever made in black", "Ford never said it", "It applied to the Model T's first five years only", "From 1908 to 1913 the Model T was not available in black; the black-only policy began in 1914"], "answerIndex": 3, "explanation": "The early Model T came in grey, green, blue and red; Ford dated the remark to 1909 in his 1922 memoir, but black-only began only in 1914.", "id": "q3"},
    {"type": "mcq", "prompt": "What triggered the War of the Pacific (1879–84) between Chile, Bolivia and Peru?", "options": ["A dispute over Amazon rubber", "A Bolivian tax on a Chilean nitrate company with British capital", "Malayan tin exports", "The Chinese Exclusion Act"], "answerIndex": 1, "explanation": "Chile won the nitrate provinces and left Bolivia landlocked; nitrate taxes then supplied roughly half of Chile's government revenue.", "id": "q4"},
    {"type": "open", "prompt": "How and why did the United States and Germany overtake Britain as industrial powers between 1870 and 1914?", "rubric": "A strong answer uses evidence such as US steel passing Britain's by 1889 and manufacturing by 1895, Germany's 14.8 per cent of world manufacturing against Britain's 13.6 in 1913, German steel passing Britain's in 1893 and the German dye firms' near-90 per cent of world dyestuffs; it explains factors such as cheap steel (Carnegie), research laboratories (Menlo Park, BASF), big business, trusts, cartels and banks (Chandler, U.S. Steel), the advantages of a late start, research spending, Lorraine, and Britain's free trade against others' tariffs; and it notes the debate over British entrepreneurial failure (Wiener against McCloskey), and that measures differ, since on one 1900 measure Britain still led.", "id": "q5"},
    {"type": "open", "prompt": "Was the Second Industrial Revolution a story of Western invention alone? Discuss with examples from at least three regions outside Western Europe and North America.", "rubric": "A strong answer discusses late industrialisers (Japan's model factories, Tomioka, silk, women mill workers and Yahata; Witte's Russia and Gerschenkron's model; Bombay's mills and Tata's steelworks), Baku's oil and its Armenian and Azerbaijani magnates, and the commodity frontiers that supplied raw materials, including Congo rubber (estimates of population decline from 1.2 to 10 million, Sanderson's 1–5 million), the Putumayo, Malayan tin and Chinese miners, Chilean nitrate and the War of the Pacific, and gutta-percha; it may mention migration and indenture, labour unrest in Japan and Bombay, and debates over Indian deindustrialisation.", "id": "q6"}
  ]$mn_secondind_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/the-second-industrial-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
