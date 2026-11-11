-- Globalization — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/globalization @ research/advanced/read.
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
    'history/contemporary-history/globalization',
    'research',
    'advanced',
    'read',
    $mn_globalization_master$> **One world market, and the argument over it.** "Globalization" is a late-twentieth-century word for a far older process: the knitting together of distant economies by trade, migration, money and ideas. This chapter sketches the deep history briefly and concentrates on the years since 1945: the Bretton Woods and GATT order, the shipping container, NAFTA, and the "hyper-globalization" that followed the World Trade Organization's founding in 1995 and China's entry in 2001. It asks who won and who lost, from Bangladeshi garment workers and Filipino migrants to America's factory towns; follows financial contagion and the protests from Chiapas to Seattle; and ends with the backlash and the debate over whether globalization is going into reverse.

## A Word and Its Ages

The word is newer than the thing. The French economist François Perroux was one of the first to use a related term, *mondialisation*, in something like the modern sense, in the early 1960s; it entered everyday speech in the 1990s.

When the process began depends on what is measured. Andre Gunder Frank pushed an "archaic globalization" back to Sumer–Indus trade in the third millennium BCE; critics call the definition too broad. Earlier chapters follow other candidates: the routes of *The Silk Roads*, and the Islamic trading world that the chapter on the Islamic commercial revolution calls "a globalization before globalization". Dennis Flynn and Arturo Giráldez date globalization to the sixteenth century, when the first circumnavigation and the Manila galleons joined the Americas to Asia and American silver flowed to China, a silver flow that *The Columbian Exchange and the First Global Economy* describes. Kevin O'Rourke and Jeffrey Williamson ask instead when prices in distant markets began to converge, and answer the 1820s, after steamships and railways cut transport costs; that globalization was also decisively shaped by nineteenth-century imperialism and colonialism.

The chapters on the Second Industrial Revolution and the twentieth-century overview describe that first globalization at its height before 1914. From 1914 to 1945 war, depression and protection, including the American Smoot–Hawley tariff of 1930, drove a first wave of deglobalization, as the chapter on the interwar period relates. On most measures, pre-1914 levels of trade openness were not regained until the later twentieth century.

## Rebuilding the World Economy, 1944–1971

In July 1944 delegates of 44 Allied countries met at Bretton Woods, New Hampshire, and created the International Monetary Fund and the International Bank for Reconstruction and Development, now part of the World Bank Group. The United States, holding two-thirds of the world's gold, insisted the system rest on gold and the dollar, fixed at \$35 an ounce. Britain's John Maynard Keynes wanted surplus countries forced to adjust as well as debtors; the US Treasury's Harry Dexter White rejected the plan.

The General Agreement on Tariffs and Trade (GATT), signed by 23 nations in Geneva on 30 October 1947, did the same work for trade: over successive negotiating rounds the average tariffs of its major participants fell from about 22 per cent to about 5 per cent. Dani Rodrik reads this era as one in which states chose democracy and national autonomy and accepted limited globalization. The monetary half of the settlement ended on 15 August 1971, when the United States stopped converting dollars into gold.

## The Box

Post-war trade's most consequential technology was a steel box. Malcom McLean, a North Carolina trucking entrepreneur, grasped that his business was moving cargo, not ships. With the engineer Keith Tantlinger he developed the modern intermodal container, and on 26 April 1956 a converted wartime tanker, the *Ideal X*, sailed from Port Newark, New Jersey, to Houston carrying 58 trailer bodies. Loading cargo by hand then cost \$5.86 a ton; containers brought it down to 16 cents.

{{image: Containerization | Standard containers move between ship, train and lorry without being unpacked, the change that made long-distance trade dramatically cheaper.}}

Containers spread slowly until the International Organization for Standardization fixed common dimensions in January 1968. War helped: in 1967 the US government invited McLean's Sea-Land to serve South Vietnam, which brought it 40 per cent of its revenue in 1968–69. As Marc Levinson shows in *The Box*, almost no one foresaw the consequences. Dockers' jobs and old waterfronts such as San Francisco's piers declined as deep-water container ports rose.

## Free Trade on a Continent: NAFTA and Chiapas

The North American Free Trade Agreement (NAFTA) between Canada, Mexico and the United States took effect on 1 January 1994, immediately removing tariffs on more than half of Mexico's exports to the US. Campaigning for the presidency in 1992, Ross Perot had warned what would follow.

```quote
We have got to stop sending jobs overseas. … there will be a giant sucking sound going south.
Ross Perot · second presidential debate · October 1992
```

Economists mostly disagreed: in a 2012 survey of economists, 95 per cent said Americans had on average benefited, and most studies found small overall gains alongside real harm to a minority of trade-exposed workers. Mexico's experience was more divided. Export assembly plants, the *maquiladoras*, and commercial farms in the north prospered. But subsidised American maize poured in, and researchers such as Timothy Wise find that most smallholder maize growers, many of them Indigenous, suffered falling prices and incomes. A 2005 World Bank study found extreme rural poverty, on its national measure, rising from about 37 per cent in the early 1990s to about 52 per cent in 1996–98, but blamed mainly the 1995 financial crisis, weak agriculture and falling farm prices rather than NAFTA alone. The promise that NAFTA would reduce migration was not fulfilled.

The sharpest answer came on NAFTA's first day, when about 3,000 armed insurgents of the Zapatista Army of National Liberation (EZLN), mostly Maya, seized six towns in the highlands of Chiapas. A 1992 constitutional amendment ending land redistribution had fed peasant grievance; their demands ran from work, land and food to democracy, justice and peace. A ceasefire followed on 12 January, and through their spokesman, Subcomandante Marcos, the Zapatistas inspired a new international movement. Mexico also soon showed the financial side of integration: in December 1994, after the uprising and the assassination of the presidential candidate Luis Donaldo Colosio, a sudden devaluation set off the "Tequila crisis", one of the first international financial crises ignited by capital flight.

```checkpoint
q: Why did Kevin O'Rourke and Jeffrey Williamson date the beginning of large-scale globalization to the 1820s?
a*: Because commodity prices in distant markets began to converge after steamships and railways cut transport costs.
a: Because the word "globalization" was first used then.
x: François Perroux was one of the first to use a related term, *mondialisation*, in the early 1960s.
a: Because that was when the first circumnavigation of the globe took place.
x: The circumnavigation is the sixteenth-century starting point favoured by Flynn and Giráldez, not O'Rourke and Williamson.
a: Because trade between Sumer and the Indus resumed then.
x: Sumer–Indus trade in the third millennium BCE is Andre Gunder Frank's "archaic globalization".
hint: Think about what economists can measure across distant markets.
why: Different definitions produce different start dates: contact versus integrated markets in which prices move together.
---
q: Which statement best summarises the evidence on NAFTA's effects?
a: It caused a dramatic fall in US national income.
x: Most studies found small aggregate gains for the US, not a large loss.
a: It made every group in Mexico better off.
x: Commercial farms and export assembly gained, but most smallholder maize producers lost.
a*: Small overall gains, with concentrated losses for some trade-exposed workers and for Mexican smallholder maize farmers.
a: It ended migration from Mexico to the United States.
x: The prediction that NAFTA would reduce migration was not met.
hint: Look for an answer that separates the average from particular groups.
why: Trade agreements can raise average income while harming specific workers and regions, which is why averages alone settle little.
```

## Hyper-globalization: The WTO, China and the Second Unbundling

The Uruguay Round agreements, signed by 123 nations at Marrakesh in April 1994, replaced GATT with the World Trade Organization from 1 January 1995; it now has 166 members covering over 98 per cent of world trade. Trade surged. On World Bank figures, world exports plus imports rose from a low of 25 per cent of world GDP in 1970 to a pre-crisis high of about 61 per cent in 2008 (briefly exceeded in 2022); a Chicago Fed measure with a different denominator gives about 19 rising to 55 per cent. Subramanian and Kessler called the surge since the mid-1990s "hyperglobalization", borrowing Rodrik's word.

China was at its centre. It became a WTO member on 11 December 2001, after fifteen years of trying to join GATT. In 1991 it supplied only 1 per cent of US imports; by 2023, on WTO data cited by China's commerce ministry, it was the world's largest exporter, with 14.2 per cent of all merchandise exports. Firms split production into stages across borders; UNCTAD estimated in 2013 that such value-added trade contributed about 30 per cent of GDP in developing countries, against 18 per cent in developed ones.

Richard Baldwin's *The Great Convergence* (2016) calls this the "second unbundling". Steam and cheap transport had first separated production from consumption, helping today's rich nations raise their share of world income from about a fifth in 1820 to around two-thirds by 1990 (figures vary by measure). From about 1990 information and communication technology, the age of the internet, slashed the cost of moving ideas, letting firms spread the stages of production across borders, and the rich nations' share fell back towards its level of 1900.

## Who Won and Who Lost?

The most famous picture of the winners and losers is a curve. In a 2013 World Bank paper Christoph Lakner and Branko Milanović ranked the world's population by income and showed how much each slice gained between 1988 and 2008. The result, shaped like an elephant raising its trunk, became the "elephant curve". Households around the middle of the global distribution, largely in China and elsewhere in Asia, gained roughly 70–80 per cent; the global top 1 per cent gained about 60 per cent; but near the 80th percentile, where many working- and middle-class people in rich countries sat, incomes barely grew, and the very poorest, many in sub-Saharan Africa, gained little. Adam Corlett of the Resolution Foundation replied in 2016 that the dip owed much to shifting country populations and to weak growth in Japan and the former Soviet states; holding populations fixed, the weakest point grew by about 40 per cent. The World Inequality Report of 2018 redrew the curve for 1980–2016 and found that the top 1 per cent captured about twice as much of the growth as the poorest half of humanity.

In the West the losses were concentrated in places. In "The China Syndrome" (2013) the economists Autor, Dorn and Hanson showed that American regions most exposed to Chinese imports suffered "higher unemployment, lower labor force participation, and reduced wages", and in 2016 they reported that offsetting gains elsewhere had "yet to materialize". Estimates of US jobs lost to the China shock range from about 550,000 manufacturing jobs (Caliendo, Dvorkin and Parro, some 15–16 per cent of the 2000–07 fall in manufacturing employment) to 2.0–2.4 million once knock-on effects are counted (Acemoglu, Autor, Dorn, Hanson and Price, 2016). Jaravel and Sager estimate consumer savings of about \$411,000 per job lost. Counting cheaper goods, Autor, Dorn and Hanson themselves found in 2021 that only areas holding about 6.3 per cent of Americans saw average real incomes fall on net: the damage was deep but local, the gains large but thinly spread. They oppose tariffs as the remedy.

The losses had political consequences. Autor, Dorn, Hanson and Majlesi found in 2020 that trade-exposed US areas polarised between 2000 and 2016 and shifted towards Republican presidential candidates, and Colantone and Stanig have linked British regions' exposure to Chinese imports to the vote to leave the European Union. In the 2020s a "China Shock 2.0" of electric vehicles, solar panels and batteries has hit Europe in particular.

## The Global South: Factories, Mines and Migrants

The South's winners and losers are as varied as the North's. Bangladesh's garment industry began when Desh Garments, with South Korea's Daewoo, sent 130 Bangladeshis to Busan for training in 1979. When the last textile quotas, under the Multi Fibre Arrangement's successor agreement, expired on 1 January 2005, Bangladesh was expected to be crushed by Chinese competition; instead its exports rose. Garments earned about US\$38.7 billion in the 2025–26 financial year, roughly four-fifths of merchandise exports, making Bangladesh the world's second-largest apparel exporter. About 54 per cent of its roughly 4.2 million garment workers are women. Naila Kabeer, listening to women in Dhaka, found factory wages giving many of them room to renegotiate the norms of purdah.

The cost was paid in lives. More than 110 people died in the Tazreen Fashions fire in November 2012. On 24 April 2013 the Rana Plaza building at Savar near Dhaka, built on a former pond without proper permits, collapsed, killing more than 1,100 people. Cracks had appeared the day before; the shops and bank inside closed, but factory owners ordered their workers back. Brands sourcing there included Benetton, Mango and Primark, and two factories had passed private social audits that missed the structural danger. Amnesty International called it "the most shocking recent example of business-related human rights abuse". Over 200 brands then signed a legally binding Accord on Fire and Building Safety with global unions; as of 31 August 2026 the programme, run since 2020 by a national council, covered some 1,770 factories in mid-2026.

Many people of the South joined the global economy by moving. The Philippine government calls its overseas workers national "heroes": by 2019 more than 15 million Filipinos lived abroad, making up a fifth to a quarter of the world's merchant seafarers and sending home \$32.2 billion that year, though the emigration of nurses left Philippine hospitals badly stretched. The World Bank estimated that low- and middle-income countries received about \$685 billion in remittances in 2024, led by India (\$129 billion) and Mexico (\$68 billion), and describes this as more than foreign direct investment and official aid combined.

For commodity exporters, globalization meant boom and bust. Chinese and other emerging-market demand drove a commodities boom from about 2000 to 2014. *The Economist* popularised "Africa Rising" in December 2011, and Africa's economy grew 50 per cent in 2005–15 against 23 per cent for the world. But prices peaked in 2011, and Patrick Bond argued that the label appeared just as commodity-led growth ended, to be followed by fiscal crises, debt defaults and protests.

On the World Bank's estimates, the number of people in extreme poverty fell from about 2 billion in 1990 to about 660 million in 2019, mostly because of China, before Covid-19 reversed some progress. Such figures depend on the international poverty line, which was \$1.90 a day at 2011 prices until September 2022 and then \$2.15 at 2017 prices; in 2025 the Bank moved the line to \$3.00 at 2021 prices, which changes every number. Defenders such as Jagdish Bhagwati credit trade-led growth; critics note that sub-Saharan Africa gained least.

## Contagion

Money moved faster than goods, and so did crises. In 1989 John Williamson coined "Washington Consensus" for ten reforms, including trade liberalisation, market-set interest rates, openness to foreign direct investment and privatisation (he excluded free capital movements), promoted by the IMF, the World Bank and the US Treasury. On 2 July 1997 Thailand floated the baht, and crisis spread to Indonesia, South Korea, Malaysia, the Philippines, Hong Kong and Laos. The IMF organised \$40 billion of programmes for South Korea, Thailand and Indonesia; in Indonesia, riots helped force Suharto from power in May 1998. Malaysia's Mahathir blamed the financier George Soros and imposed capital controls. Recovery proved fast.

The crisis divided economists in unexpected ways. Joseph Stiglitz, World Bank chief economist from 1997, argued in *Globalization and Its Discontents* (2002) that IMF austerity, high interest rates and premature liberalisation worsened the Asian crisis and Argentina's depression, describing the Washington Consensus as a blend of ideology and bad economics; critics replied that he mistook government failures for market failures. Bhagwati, a leading defender of free trade, had argued in "The Capital Myth" (1998) that free capital flows, unlike trade in goods, are crisis-prone, and blamed a "Wall Street-Treasury complex"; the IMF disputed this. Rodrik framed the political cost as a trilemma: "democracy, national sovereignty and global economic integration are mutually incompatible: we can combine any two of the three, but never have all three simultaneously and in full."

The largest contagion began in the rich world. Lehman Brothers' bankruptcy on 15 September 2008, the largest in US history, is often seen as the climax of the global financial crisis; it reached developing countries through falling trade, commodity prices and remittances. In the "Great Trade Collapse" from late 2008 to mid-2009, world GDP fell by about 1 per cent but world trade by about 10 per cent, in almost every country at once, as credit dried up and supply chains passed on the shock.

```checkpoint
q: What did Branko Milanović's "elephant curve" suggest about income growth from 1988 to 2008?
a: That all income groups in the world gained roughly equally.
x: The curve's shape shows very unequal gains, which is why it looks like an elephant.
a*: That the global middle, largely in Asia, and the global top 1 per cent gained most, while many in rich countries' working and middle classes gained little.
a: That the poorest people in sub-Saharan Africa gained most.
x: The very poorest gained relatively little in the original curve.
a: That the global top 1 per cent lost income.
x: The top 1 per cent gained strongly, around 60 per cent.
hint: Picture the trunk and the dip in the curve.
why: The curve became a shorthand for globalization's uneven distribution, though Corlett and others dispute how to read the dip.
---
q: Why is Jagdish Bhagwati's 1998 article "The Capital Myth" surprising?
a: Because he argued for the abolition of the WTO.
x: Bhagwati advised GATT and the WTO and defended free trade.
a: Because he praised the IMF's handling of the Asian crisis.
x: He blamed a "Wall Street-Treasury complex" for pushing capital liberalisation.
a: Because he denied that capital flows had any effect on emerging economies.
x: His argument was that capital flows are crisis-prone, not irrelevant.
a*: Because a leading defender of free trade argued that free capital flows, unlike trade in goods, are prone to crises.
hint: Think of "widgets and dollars".
why: The trade-versus-capital distinction shows that critics and defenders of globalization could agree that capital liberalisation was risky.
```

## From Chiapas and Seattle to Porto Alegre

At the end of 1999 protest reached the heart of the system. The WTO's third ministerial conference met in Seattle from 30 November to 3 December 1999 to launch a "Millennium Round". At least 40,000 protesters came, from unions and churches to anarchists and environmentalists, an alliance nicknamed "Teamsters and turtles". Police used tear gas, the mayor declared a curfew, and more than 500 people were jailed.

Yet the talks failed for reasons inside the hall as much as outside. Developing countries resented being shut out while the United States and the European Union sought a deal on agriculture, and demanded that Uruguay Round promises, such as access for textiles, be honoured first. The Malaysian economist Martin Khor blamed "the untransparent and undemocratic nature of the WTO system, the blatant manipulation of that system by the major powers, and the refusal of many developing countries" to go on accepting it. Talks resumed at Doha in November 2001, where protest could be kept away, but the Doha Round remains unfinished, stuck above all on agriculture, and bilateral deals multiplied instead.

The movement spread. At the G8 summit in Genoa in July 2001 a carabiniere shot dead a 23-year-old protester, Carlo Giuliani. From January 2001 a World Social Forum met in Porto Alegre, Brazil, as a rival to the World Economic Forum at Davos, under the slogan "another world is possible", drawing 155,000 registered participants by 2005. Many activists rejected the label "anti-globalization" for "alter-globalization" or "global justice": they wanted a different globalization, not none. Fair trade offered a market route instead. The first certification label, Max Havelaar, was launched in the Netherlands in 1988, and by 2011 more than 1.2 million farmers and workers in over 60 countries took part, though critics note that certification costs fall on Southern producers and dispute how much they gain.

## Backlash and the Deglobalization Debate

The backlash came through the ballot box. Jeffry Frieden observes that in 2016, for the first time since the 1930s, both major US parties had candidates for the presidential nomination openly hostile to economic integration. That June the United Kingdom voted by 51.9 per cent to leave the European Union, which it did on 31 January 2020. The United States began a trade war with China with tariffs on 22 January 2018; China retaliated from April, and the Biden administration kept the tariffs and added levies on Chinese electric vehicles and solar panels.

The tariff story was still moving at the time of writing (November 2026), and what follows may change. On 2 April 2025, "Liberation Day", President Trump imposed a minimum 10 per cent tariff on almost all US imports under an emergency-powers law; the average effective US tariff rate rose from 2.5 per cent in January to about 27 per cent in April, the highest in over a century, and US and Chinese tariffs on each other's goods reached 145 and 125 per cent before being modified. In February 2026 the Supreme Court ruled the emergency-powers tariffs illegal, requiring refunds of about \$166 billion. A replacement 10 per cent global tariff under another law was also ruled illegal by the Court of International Trade, a decision under appeal; the effective tariff rate stood at 12.1 per cent on 21 July 2026. That replacement tariff lapsed on 24 July and was succeeded by new tariffs of 10–12.5 per cent on about sixty countries; the situation may change again.

Is globalization ending? Some see a second great deglobalization after the 1930s', this time driven by democratic votes rather than autocracies: a trade slowdown after 2008, deepened by Brexit, the trade war, a "Second Cold War" and Covid-19. Others, including the former WTO director-general Pascal Lamy and Michael Bordo, say it is too soon to diagnose. One VoxEU analysis attributes about 60 per cent of the post-2008 fall in goods trade relative to GDP to shrinking trade in fuels and minerals, largely reflecting lower commodity prices, and many firms have diversified rather than retreated, adopting a "China-plus-many" strategy that adds Vietnam, India and Mexico.

Rodrik's trilemma offers one reading of the moment: voters reclaiming democracy and sovereignty at the expense of integration. *The Economist*, following Albert Hirschman, offers a rejoinder: diversified trade can strengthen sovereignty by making a nation harder for any one partner to coerce. Either way, the argument over globalization is no longer between protesters outside a conference hall and officials inside it. It has moved into governments themselves.

## Further exploration

- **Marc Levinson, *The Box: How the Shipping Container Made the World Smaller and the World Economy Bigger* (2006).** The container revolution, from Malcom McLean to Vietnam to just-in-time production.
- **Joseph E. Stiglitz, *Globalization and Its Discontents* (2002).** A former World Bank chief economist's indictment of the IMF and the Washington Consensus.
- **Jagdish Bhagwati, *In Defense of Globalization* (2004).** The leading economist's case for trade-led globalization as a force for social good.
- **Dani Rodrik, *The Globalization Paradox* (2011).** The trilemma and the critique of hyperglobalization.
- **Branko Milanović, *Global Inequality: A New Approach for the Age of Globalization* (2016).** The elephant curve and globalization's winners and losers.
- **Richard Baldwin, *The Great Convergence: Information Technology and the New Globalization* (2016).** How the "second unbundling" shifted industry to a few developing economies.
- **Naila Kabeer, *The Power to Choose: Bangladeshi Women and Labour Market Decisions in London and Dhaka* (2000).** Bangladeshi women garment workers' own accounts of work and choice.$mn_globalization_master$,
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
  select $mn_globalization_quiz$[
    {"type": "mcq", "prompt": "Which institutions were created at the Bretton Woods conference of July 1944?", "options": ["The International Monetary Fund and the International Bank for Reconstruction and Development", "The World Trade Organization and the World Social Forum", "GATT and NAFTA", "The European Union and the Appellate Body"], "answerIndex": 0, "explanation": "Delegates of 44 Allied countries created the IMF and the IBRD, now part of the World Bank Group. GATT followed in 1947 and the WTO only in 1995.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in Chiapas, Mexico, on 1 January 1994, the day NAFTA took effect?", "options": ["Mexico's peso was devalued", "About 3,000 armed Zapatista insurgents, mostly Maya, seized six towns", "The WTO held its first ministerial conference", "The World Social Forum first met"], "answerIndex": 1, "explanation": "The Zapatista Army of National Liberation rose on NAFTA's first day; the peso devaluation came in December 1994, and the World Social Forum first met in Porto Alegre in 2001.", "id": "q2"},
    {"type": "mcq", "prompt": "Which finding about the 'China shock' did Autor, Dorn and Hanson report in 2021?", "options": ["That no American manufacturing jobs were lost to Chinese imports", "That tariffs were the best remedy for trade-exposed regions", "That, counting lower prices, only areas holding about 6.3 per cent of Americans saw average real incomes fall", "That the shock caused all of the decline in US manufacturing"], "answerIndex": 2, "explanation": "Counting cheaper goods, only areas holding about 6.3 per cent of the US population saw average real incomes fall on net, though losses were concentrated in trade-exposed places; the authors oppose tariffs as the remedy.", "id": "q3"},
    {"type": "mcq", "prompt": "Why should global extreme-poverty figures always be quoted with their poverty line and date?", "options": ["Because the World Bank stopped measuring poverty in 2019", "Because poverty has been measured in the same way since 1990", "Because the figures include only China", "Because the World Bank's line has been revised, from $1.90 (2011 prices) to $2.15 (2017 prices) in 2022 and to $3.00 (2021 prices) in 2025, which changes every number"], "answerIndex": 3, "explanation": "Each revision of the international poverty line shifts the estimates; the fall from about 2 billion (1990) to about 660 million (2019) depends on the line used.", "id": "q4"},
    {"type": "open", "prompt": "Using the elephant curve and its critics, explain who gained and who lost from globalization between 1988 and 2008, and why the evidence is disputed.", "rubric": "A strong answer explains Lakner and Milanović's curve: large gains (roughly 70–80 per cent) for the global middle, largely in China and Asia; about 60 per cent for the global top 1 per cent; near-stagnation around the 80th percentile, where many rich-country working and middle classes sat; little for the very poorest, many in sub-Saharan Africa. It notes Corlett's critique (changing country populations, weak Japan and former Soviet states; holding populations fixed the weakest point grew about 40 per cent) and the World Inequality Report's 1980–2016 version (top 1 per cent captured about twice the growth of the bottom half). Credit for linking this to the China-shock evidence and to Global South outcomes such as Bangladesh.", "id": "q5"},
    {"type": "open", "prompt": "Is globalization ending? Assess the evidence for and against 'deglobalization' since 2008.", "rubric": "A strong answer sets out the case for deglobalization (trade slowdown after the 2008 Great Trade Collapse; Brexit 2016/2020; the US–China trade war from 2018; Covid-19 supply shocks; US tariffs from April 2025, with the caveat that these were still changing in 2026, including the Supreme Court ruling of February 2026) and the case against (Lamy and Bordo: too soon to say; the VoxEU finding that about 60 per cent of the fall in the goods-trade ratio reflects lower commodity prices; firms diversifying through 'China-plus-many'). Credit for using Rodrik's trilemma or the Hirschman rejoinder to interpret the backlash.", "id": "q6"}
  ]$mn_globalization_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/globalization', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
