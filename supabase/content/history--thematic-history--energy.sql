-- History of Energy — canonical master article, co-written and human-reviewed.
-- history/thematic-history/history-of-energy @ research/advanced/read.
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
    'history/thematic-history/history-of-energy',
    'research',
    'advanced',
    'read',
    $mn_energy_master$> **Every society runs on something.** For most of history that meant muscle, fire and plants, with water and wind as precious extras. This chapter follows energy through world history: fire and draught animals; the mills and sails of China, the Islamic world and Europe; coal in Song China and then Britain, and why Britain's coal mattered; steam, oil and electricity; nuclear promise and fear; energy as political power; the hundreds of millions still without electricity; and the solar boom now under way. Throughout runs a historians' argument: do societies ever really "transition" from one fuel to another, or simply add new fuels to old ones?

## Energy as a Way of Reading History

The Czech-Canadian scientist Vaclav Smil has retold history as a story of energy. His *Energy and Civilization: A History* (2017), an expanded version of *Energy in World History* (1994), follows how people have captured and converted energy, from muscle to fossil fuels.

```quote
Energy is the only universal currency
Vaclav Smil · Energy and Civilization: A History · 2017
```

Smil's account tracks each source's share of primary energy, in a sequence from biomass to coal to oil to today's mix, still dominated by coal, oil and gas. On summaries of his figures, fossil fuels overtook traditional biomass worldwide around 1900, and oil passed coal in the 1960s; exact years depend on how energy is counted. Each shift took decades, and Smil doubts that a move to clean energy will be quick: in 2018 he noted that fossil fuels still supplied 90 per cent of the world's primary energy.

Jean-Baptiste Fressoz, in *More and More and More* (2024), challenges the idea of "transition" itself, which began as a word for a future goal, used by forecasters and then policymakers, rather than a historians' description of the past. In absolute amounts every main source has kept growing: more wood was burned in the nineteenth century even as coal boomed, and cars raised both oil use and the coal used for steel. History shows energy additions, not transitions. The chapter on Environmental History introduces this debate.

## Muscle, Fire and Biomass

Claims for the use of fire by members of the genus *Homo* reach back as far as 2 million years. The oldest definitive evidence of fire-making is about 400,000 years old: a site in eastern England, published in December 2025, with burnt soil, fire-cracked handaxes and two pieces of iron pyrite for striking sparks. Fire gave warmth, light, protection, better tools and cooked food, helping humans spread and change their diets.

After farming began, the main engines were human and animal bodies. A genomic study of 264 ancient horses (2021) places the domestication of modern horses' ancestors on the Pontic–Caspian steppe around 2200 BCE.

The Cambridge historian E. A. (Tony) Wrigley called such societies **organic economies**: almost all their energy came from plants capturing sunlight, a flow that scarcely changed from year to year. In early modern England draught animals supplied most mechanical power, so more power meant more land for fodder, and land capped growth. In *Continuity, Chance and Change* (1988) Wrigley distinguished two kinds of growth, calling the first the "advanced organic" economy; a chapter of the same book is titled "The mineral-based energy economy".

That world has not vanished. Energy-poor households still rely heavily on wood, charcoal, crop residues and dung. Women and girls usually gather the fuel and do the cooking, so they bear most of the labour and most of the exposure to indoor smoke.

## Water and Wind: The First Machines

The earliest written reference to a water-driven wheel is in the treatises of Philo of Byzantium (c. 280–220 BCE), and Vitruvius gave the first technical description of a watermill in the late first century BCE. Where the watermill was invented is open to scholarly discussion; Helaine Selin places it in the Persian Empire before 350 BCE. By the second century CE the mill complex at Barbegal in southern France had become, in the words of Kevin Greene (2000), "the greatest known concentration of mechanical power in the ancient world".

In China, Huan Tan's *Xin Lun* (c. 20 CE) implies that waterwheels already worked pounding machinery, and in 31 CE Du Shi, prefect of Nanyang, used water power to blow the bellows of iron furnaces.

The Islamic world turned water power into an industry. By the eleventh century industrial mills for grain, sawing, stamping and sugar, and tide mills too, had spread widely, from al-Andalus and North Africa to Central Asia. In tenth-century Iraq, ship mills of teak and iron on the Tigris and Euphrates could grind 10 tons of flour a day for Baghdad's granary. Great water-raising wheels, norias, lifted water for fields and towns.

{{image: Norias of Hama | The norias of Hama on the Orontes River in Syria, about 20 metres across; they survive today as monuments.}}

In India, whether ancient texts describe water-powered wheels is disputed; geared water-raising wheels arrived from the Islamic world under the Delhi Sultanate (1206–1526).

Medieval Europe built mills on a large scale. The Domesday Book of 1086 recorded more than 5,600 mills in England alone, an undercount; Georges Duby reckoned one mill per 46 peasant households (see the chapter on Lords, Peasants, and Towns in Medieval Europe). Joel Mokyr, following Lynn White, calls medieval Europe perhaps the first society to build an economy on non-human power.

Wind came later: there is no historical evidence of windmills before the ninth century CE. The horizontal windmill appeared in Persia in that century; the geographer Estakhri reported windmills in Khorasan, and they spread across the Middle East and Central Asia and later to China and India. (A story linking them to the caliph Umar, recorded only in the tenth century, is doubtful.) The vertical windmill appeared in north-western Europe in the twelfth century, whether independently or not is debated; the earliest certain reference is from 1185, at Weedley in Yorkshire. From the early fifteenth century Dutch windmills drained wetlands.

## Coal: Song China and Britain

Coal is old: archaeology in China indicates household use from about 3490 BCE, and the Romans worked almost all the major coalfields of England and Wales. But the first great coal industry belonged to Northern Song China (960–1127). In the eleventh century, as forests were cut, ironworks on the Henan–Hebei border switched to coke-burning blast furnaces, using by contemporary estimates at least 140,000 tons of coal a year; Song iron output exceeded 100,000 tonnes a year. Coal became the main household fuel in the capital, Kaifeng, and later Marco Polo described coal burned "through the province of Cathay". The chapter on Tang and Song China sets this in the wider Song economy.

The Domesday Book records no coal mining in England. Yet by 1700 five-sixths of the world's coal was mined in Britain, and by 1760 the English burned two and a half times more coal than wood. Wrigley argued that coal provided an escape from the constraints of the organic economy, since its energy did not depend on the yield of the land; without it, he reckoned, Britain would have run short of good watermill sites by the 1830s. The escape brought dangers of its own.

The German environmental historian Rolf Peter Sieferle made a similar case in *The Subterranean Forest* (1982; English 2001), tracing the shift from an agrarian "solar energy system" to fossil fuels, and why coal-rich Britain industrialised before forested Germany. (Sieferle moved to the far right late in life, and his posthumous *Finis Germania* was called antisemitic; his energy history is cited on its own merits.)

Why did Song coal not lead to an industrial revolution? Pomeranz points to geography: China's biggest deposits lay in the north-west, but between the twelfth and fourteenth centuries population and industry moved south, far from the coal; and dry northern mines needed ventilation, whereas Europe's wet mines needed pumping, which steam supplied. Robert C. Allen adds that Britain's high wages and cheap coal made coal-burning, labour-saving machines pay. Critics reply that coal mattered less: Clark and Jacks argue it was substitutable, and McCloskey that Britain could have imported coal. The chapter on Global History introduces this "Great Divergence" debate.

```checkpoint
q: What did E. A. Wrigley mean by an "organic economy"?
a*: An economy in which almost all energy came from plants capturing sunlight, so land limited growth.
a: An economy based on organic farming without chemicals.
x: Wrigley's term is about energy sources, not farming methods.
a: An economy run by cooperatives rather than markets.
x: The term describes where energy came from, not how the economy was organised.
a: An economy that had already switched to coal.
x: Coal was Wrigley's escape from the organic economy, not part of it.
hint: Think of food, fodder and firewood.
why: In an organic economy more power meant more land, so coal's stored energy broke the ceiling.
---
q: Which explanation does Pomeranz give for why Song China's coal did not drive an industrial revolution?
a: China had no coal deposits of any size.
x: China had large deposits, and Song ironworks burned coal on a large scale.
a: The Song government banned coal mining.
x: Coal markets multiplied in Kaifeng; the problem was location, not prohibition.
a*: The largest deposits lay in the north-west, while population and industry moved south, far from the coal.
a: Chinese engineers never used water power.
x: Water power drove Chinese furnace bellows from the first century CE.
hint: Think of where the coal was and where the people went.
why: For Pomeranz, the accident of coal's location helped decide where industrialisation began.
```

## Steam and the Fossil Economy

Steam began by solving a coal-mining problem: flooded pits. Thomas Savery's pump of 1698 could not drain deep mines; Thomas Newcomen's engine of 1712, at a coalworks in Tipton, could. James Watt's separate condenser (1765) cut fuel use by about three-quarters, and from 1781 rotary motion let steam replace waterwheels. The chapter on The Industrial Revolution tells this story in full, including Andreas Malm's argument in *Fossil Capital* (2016) that cotton masters chose steam to control labour and build mills in towns, not because water ran out.

Efficiency did not save coal. In *The Coal Question* (1865) W. S. Jevons argued that more efficient use raised total consumption. To the idea that economical use of fuel meant using less, he answered: "The very contrary is the truth." This is the "Jevons paradox".

British coal output peaked in 1913 at 287 million tonnes; mining jobs peaked at 1,191,000 in 1920 and had fallen to 360 by 2022. Today China mines about half the world's coal. Fossil energy also reached the dinner table: making ammonia fertiliser by the Haber–Bosch process uses about 1–2 per cent of the world's energy supply.

## Oil's Century

Native Americans knew the oil seeps of Oil Creek for centuries before Edwin Drake struck oil near Titusville, Pennsylvania, on 27 August 1859. The title of "first commercial oil well" is also claimed for Azerbaijan, Ontario, Myanmar, Sichuan, Poland and elsewhere; in Baku, offshore wells were dug in 1803, and between 1898 and 1901 Baku out-produced the United States. The Middle East's first oil well struck at Masjed Soleyman in Persia in 1908. Oil's first big market was kerosene for lamps. The chapter on The Second Industrial Revolution tells this early history.

In the 1960s oil overtook coal, though the exact year is uncertain. The oil shocks then showed the industrial world's dependence. After Egypt and Syria attacked Israel in October 1973, the Arab producers' organisation OAPEC embargoed countries that had supported Israel, and by March 1974 the price had risen from about \$3 to nearly \$12 a barrel. After the Iranian Revolution of 1979, supply fell only about 4 per cent, but crude prices more than doubled within a year, and utilities worldwide switched from oil to coal, gas or nuclear power. The chapter on The Neoliberal Age describes the aftermath; the politics of oil and empire are only touched on here.

## Electricity Transforms Everything

Electricity is not a fuel but a way of moving energy. Edison's Pearl Street Station in New York began generating on 4 September 1882 for 82 customers. Electrification soon became a political project: in 1920 the Soviet state founded GOELRO to electrify the country, and Lenin gave it a slogan.

```quote
Communism is Soviet power plus the electrification of the whole country.
Vladimir Lenin · Our Foreign and Domestic Position and Party Tasks · 1920
```

In 1934 fewer than 11 per cent of American farms had electricity, against nearly 90 per cent in France and Germany; Roosevelt's Rural Electrification Administration (1935) and the act of 1936 funded rural cooperatives. Dams turned rivers into power, from the Hoover Dam (begun 1931) to China's Three Gorges, today the world's largest power station. In India, a Rural Electrification Corporation was set up in 1969, and later schemes reached nearly all households.

## Energy and Power: Carbon Democracy

The political theorist Timothy Mitchell, a scholar of Egypt, argues in *Carbon Democracy* (2011) that a society's energy shapes its politics. Coal moved along narrow, labour-intensive channels, from mine to railway to dock, so miners and railway workers could halt economies by striking; their demands helped bring mass democracy and the welfare state. From the late nineteenth century, miners' unions were often leaders of the left, from Britain and Poland to Japan and Chile. Oil, extracted by fewer workers and moved by pipeline and tanker, is far harder to interrupt, and weakened labour's leverage.

Critics find this too materialist. The chapter on The Neoliberal Age describes a late episode in the politics of coal, the British miners' strike of 1984–85.

## Nuclear Promise and Fear

Nuclear energy entered history as a weapon, at Hiroshima and Nagasaki in August 1945. In December 1953 Eisenhower offered the United Nations "Atoms for Peace", and in 1954 Lewis Strauss, chairman of the US Atomic Energy Commission, told science writers that "our children will enjoy in their homes electrical energy too cheap to meter". His son later claimed he meant fusion, but the speech's context was fission.

The Soviet plant at Obninsk became the first connected to a grid in June 1954, followed by Britain's Calder Hall (1956) and America's Shippingport (1957). World capacity reached 300 gigawatts by 1990, but accidents slowed growth: a partial meltdown at Three Mile Island in the United States in 1979, then, on 26 April 1986, the explosion of reactor 4 at Chernobyl in the Ukrainian SSR. Two workers died in the explosion and 28 of acute radiation sickness; estimates of eventual deaths from long-term effects run from about 4,000 among the most exposed (a UN estimate) to about 16,000 across Europe, with some higher, and about 350,000 people had been resettled by 2000. The chapters on The Soviet Union and on the Collapse of the Soviet Union and Eastern Europe trace the political fallout.

On 11 March 2011 an earthquake and tsunami knocked out cooling at Japan's Fukushima Daiichi plant, and at least 164,000 people were displaced. One death from radiation is suspected, and UN scientists found no documented health effects in residents directly attributable to radiation; the evacuation itself caused at least 51 deaths and was accused of doing more harm than it prevented. Germany decided to phase out its reactors by 2022. In 2023 nuclear power supplied about 9 per cent of the world's electricity, and 65 per cent of France's.

```checkpoint
q: What was the context of Lewis Strauss's 1954 prediction of electricity "too cheap to meter"?
a: He was describing solar panels.
x: Strauss chaired the Atomic Energy Commission and was speaking about nuclear power.
a*: He was chairman of the US Atomic Energy Commission; his son later said he meant fusion, but the speech's context was fission.
a: He was mocking the idea of nuclear power.
x: He was promoting nuclear energy, not mocking it.
a: He was speaking after the Chernobyl disaster.
x: Chernobyl was in 1986, more than thirty years later.
hint: Think of who Strauss was and what his son claimed.
why: The phrase became a symbol of nuclear over-optimism, so its context matters.
---
q: At Fukushima, what caused more deaths: radiation or the evacuation?
a: Radiation, which killed thousands.
x: One death from radiation is suspected; UN scientists found no documented effects attributable to it in residents.
a: Neither; nobody was evacuated.
x: At least 164,000 people were displaced.
a: Both caused exactly the same number.
x: The evacuation caused at least 51 deaths; radiation is suspected in one.
a*: The evacuation, which caused at least 51 deaths, against one suspected radiation death.
hint: Compare 51 with one.
why: Fukushima showed that the response to a nuclear accident can carry risks of its own.
```

## The Great Acceleration and Energy Poverty

After 1945 energy use surged with population, industry and farming: J. R. McNeill and Peter Engelke call this *The Great Acceleration* (2016), and in 2019 the Anthropocene Working Group proposed starting a human-shaped epoch in the mid-twentieth century, a proposal geology's governing bodies rejected in 2024.

The surge was shared unequally. Historically, 5 per cent of countries have produced about 68 per cent of greenhouse-gas emissions, and the lowest-emitting half only 0.74 per cent. According to *Tracking SDG7 2026*, the joint report of the IEA, IRENA, the UN Statistics Division, the World Bank and the WHO, 655 million people had no electricity in 2024, about 86 per cent of them in sub-Saharan Africa; the International Energy Agency's own method gives about 730 million. Depending on the estimate, then, between about 650 and 730 million people lacked electricity in 2024. The previous edition (2023 data) counted about 2.1 billion people without clean cooking, almost all in Asia and Africa.

## The Renewable Transition Now

Augustin Mouchot's solar research in the 1860s was driven by fear that coal would run out. Solar cells cost \$76.67 per watt in 1977 and \$0.36 in 2014, and spot prices reached \$0.13 in 2018, nearly 600 times less. "Swanson's law" describes the pattern: module prices fall about 20 per cent for each doubling of cumulative shipments. Manufacturing shifted to Asia, and Chinese makers became the largest; in 2022 about 40 per cent of the world's polysilicon came from Xinjiang. By Lazard's 2023 analysis of the United States, utility-scale solar and onshore wind were the cheapest sources of new electricity there.

The latest figures can be read two ways. According to Ember's *Global Electricity Review 2026* (April 2026), in 2025 renewables generated 33.8 per cent of the world's electricity, just ahead of coal's 33 per cent, for the first time in about a century; solar supplied about 9 per cent and met roughly three-quarters of demand growth. Yet according to the Energy Institute's *Statistical Review of World Energy* 2026 (June 2026), fossil fuels still supplied about 86 per cent of total energy in 2025, and coal, oil and gas all hit record highs, even though renewables were the largest source of growth; carbon dioxide emissions rose 1.1 per cent. Such shares depend on how energy is counted.

The obstacles are physical as well as political. The IEA has called for grid investment to rise from \$300 billion to over \$600 billion a year by 2030, since power must travel and be balanced. Solar needs far more land per unit of power than gas or nuclear. And mining for lithium, cobalt, nickel and copper has created new conflicts over environmental justice.

## Can This Transition Be Faster?

Benjamin Sovacool (2016) found that the shift from wood to coal in Europe took 96 to 160 years, but pointed to fast national cases such as Ontario's exit from coal (2003–2014), driven by strong government action. Grubler, Wilson and Nemet replied that such comparisons are "apples and oranges". Smil remains sceptical; Fressoz doubts there has ever been a true transition; electricity analysts see 2025 as a tipping point. History gives each side evidence. So far new sources have been piled on top of old ones, and fossil fuels are burned in record amounts; yet in electricity, at least, renewables have now passed coal, the fuel that first freed an island economy from the limits of its land.

## Further exploration

- **Vaclav Smil, *Energy and Civilization: A History* (2017).** The standard long-run synthesis, from muscle and fire to fossil fuels.
- **E. A. Wrigley, *Energy and the English Industrial Revolution* (2010).** The organic economy and coal's escape from the limits of land.
- **Rolf Peter Sieferle, *The Subterranean Forest: Energy Systems and the Industrial Revolution* (2001).** From the agrarian solar-energy system to coal, comparing Britain and Germany.
- **Andreas Malm, *Fossil Capital: The Rise of Steam Power and the Roots of Global Warming* (2016).** Why British cotton masters chose steam, and what it meant for the climate.
- **Timothy Mitchell, *Carbon Democracy: Political Power in the Age of Oil* (2011).** How coal and oil shaped the possibilities of democracy.
- **Jean-Baptiste Fressoz, *More and More and More: An All-Consuming History of Energy* (2024).** The case against the idea of energy "transitions".
- **J. R. McNeill and Peter Engelke, *The Great Acceleration: An Environmental History of the Anthropocene Since 1945* (2016).** Energy and the post-war surge in human impact.$mn_energy_master$,
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
  select $mn_energy_quiz$[
    {"type": "mcq", "prompt": "When and where do the first windmills for which there is historical evidence appear?", "options": ["In Persia in the ninth century CE", "In Roman Britain in the second century CE", "In Han China in the first century CE", "In the Netherlands in the fifteenth century"], "answerIndex": 0, "explanation": "There is no historical evidence of windmills before the ninth century CE; the horizontal windmill first appeared in Persia then. The vertical windmill came to north-western Europe in the twelfth century, and Dutch drainage mills from the fifteenth.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Northern Song ironworks on the Henan–Hebei border do in the eleventh century?", "options": ["They closed because coal was banned", "They switched from charcoal to coke-burning blast furnaces as forests were cut down", "They began using steam engines to pump their mines", "They imported coal from Britain"], "answerIndex": 1, "explanation": "Deforestation pushed Song ironworks to coke-burning blast furnaces, using by contemporary estimates at least 140,000 tons of coal a year.", "id": "q2"},
    {"type": "mcq", "prompt": "What did W. S. Jevons argue in The Coal Question (1865)?", "options": ["That Britain's coal would last for ever", "That coal should be replaced by oil", "That more efficient use of coal would increase total coal consumption", "That steam engines were less efficient than waterwheels"], "answerIndex": 2, "explanation": "Jevons argued that economical use of fuel did not mean lower consumption: \"The very contrary is the truth.\" This is the Jevons paradox.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Ember's Global Electricity Review 2026, what happened in world electricity in 2025?", "options": ["Nuclear became the largest source", "Coal's share rose above 40 per cent", "Oil became the largest source of electricity", "Renewables generated 33.8 per cent, just ahead of coal's 33 per cent, for the first time in about a century"], "answerIndex": 3, "explanation": "Ember found renewables narrowly passed coal in 2025, while the Energy Institute found fossil fuels still supplied about 86 per cent of total energy.", "id": "q4"},
    {"type": "open", "prompt": "Compare Vaclav Smil's and Jean-Baptiste Fressoz's ways of describing the history of energy. What does each emphasise, and what does the difference imply for today's debate about a clean-energy transition?", "rubric": "Full marks: Smil tracks each source's share of primary energy, a sequence from biomass to coal to oil, with fossil fuels overtaking biomass around 1900 and each shift taking decades, making him sceptical of rapid change; Fressoz looks at absolute amounts, showing every source kept growing (more wood burned in the nineteenth century, cars raising oil and coal use), so history shows additions not transitions, and 'transition' began as forecasters' and policymakers' term for a future goal. Good answers connect this to the 2025 data, which can be read both ways (renewables passing coal in electricity per Ember; record fossil use per the Energy Institute).", "id": "q5"},
    {"type": "open", "prompt": "Explain Timothy Mitchell's argument in Carbon Democracy about coal, oil and political power, and give one criticism of it.", "rubric": "Full marks: coal moved along narrow, labour-intensive channels (mines, railways, docks), so miners and railway workers could halt economies by striking, and their demands helped bring mass democracy and the welfare state; oil, extracted by fewer workers and moved by pipeline and tanker, is harder to disrupt and weakened labour's leverage; Criticism: too materialist.", "id": "q6"}
  ]$mn_energy_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/history-of-energy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
