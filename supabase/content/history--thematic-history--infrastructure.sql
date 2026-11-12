-- The Role of Infrastructure in History: its Powers and Limitations — canonical master article, co-written and human-reviewed.
-- history/thematic-history/the-role-of-infrastructure-in-history-its-powers-and-limitations @ research/advanced/read.
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
    'history/thematic-history/the-role-of-infrastructure-in-history-its-powers-and-limitations',
    'research',
    'advanced',
    'read',
    $mn_infra_master$> **The skeleton of power and everyday life.** Roads, canals, aqueducts, railways, cables, sewers, grids and dams rarely make the headlines of history, yet they decide who can move, trade, drink clean water, send a message or be governed from afar. This chapter follows infrastructure around the world, from the Persian Royal Road, qanats and China's Grand Canal through the canals, railways and cables of the imperial age to sewers, grids, great dams, the American Interstate and the Belt and Road. It asks what infrastructure gave states power to do, and where that power failed: in the people it bypassed or displaced, the schemes that ignored local knowledge, the budgets that ran away and the bridges that fell down.

## What Counts as Infrastructure

Infrastructure is commonly defined as the facilities and systems that serve a country, city or area, from roads and sewers to grids and telecommunications. The anthropologist Brian Larkin defines infrastructures as "built networks that facilitate the flow of goods, people, or ideas and allow for their exchange over space", and offers a shorter formula that has been widely quoted.

```quote
Infrastructures are matter that enable the movement of other matter.
Brian Larkin · "The Politics and Poetics of Infrastructure" · 2013
```

Larkin's point is that infrastructures are both things and the relations between things, and that their form matters as well as their function. Susan Leigh Star, in "The Ethnography of Infrastructure" (1999), stressed different properties: infrastructure is embedded in other structures, is "built on an installed base", and "becomes visible upon breakdown". Larkin stresses that infrastructures are also aesthetic and political signs, often meant to be seen. Paul N. Edwards has argued that to be modern is to live within and by means of infrastructures operating at many scales.

The sociologist Michael Mann gave historians a tool for linking all this to politics. In 1984 he introduced the term **infrastructural power**, which he contrasted with the "despotic power" of state elites over civil society. In a later formulation (1993) he described it as the institutional capacity of a state, despotic or not, to penetrate its territories and implement decisions logistically. A shorthand often used is that despotic power is power *over* society, infrastructural power power *through* it. This chapter is in a sense a history of that capacity: how it was built, whom it reached and where it stopped.

## Roads and Couriers

The earliest great road networks were instruments of command. The Persian **Royal Road**, rebuilt by the Achaemenids and probably perfected under Darius I, ran some 2,700 km from Susa to Sardis, with 111 posting stations where royal couriers changed horses; a journey of ninety days on foot was supposed to take them nine. "There is nothing in the world that travels faster than these Persian couriers," wrote Herodotus. The road's place in Darius's empire is told in the chapter on The Persian Empire.

Rome's Via Appia dates to 312 BC. At the empire's height its roads totalled more than 400,000 km, over 80,500 km of them stone-paved, and Augustus founded an official relay post. A recent study using coin finds suggests they also helped integrate distant regions economically over time. The chapter on Rome and the Ancient Roman World places them in the wider story of the empire.

In the Andes the Inca *Qhapaq Ñan*, some 40,000 km by most estimates and partly inherited from earlier cultures such as the Wari and Tiwanaku, worked without wheels, served by relay runners, llama caravans and storehouses and maintained through labour owed to the state (the *mit'a*). After the Spanish conquest, forced resettlement of Andean people led to much of the network being abandoned for new roads to centres of Spanish power. Yet infrastructure can outlast its builders: a 2021 study found that communities in Peru within 20 km of the Inca road still have higher wages, nutrition and schooling than similar communities farther away. The chapter on The Inca Empire describes the road in its heyday.

## Water and the State

Rome's first aqueduct, the Aqua Appia, was commissioned in 312 BC by the same censor who built the Via Appia; by the third century AD the city had eleven aqueducts with some 780–800 km of conduit, most of their water going to public baths. Maintenance was politics: Frontinus, the water commissioner from AD 97, blamed losses on theft by private users and corrupt officials, though he may have overstated it. When besieging Ostrogoths cut the aqueducts in 537, the city's shrunken population never fully restored them.

{{image: Pont du Gard | The Pont du Gard in southern France carried a Roman aqueduct that could deliver up to 40,000 cubic metres of water a day.}}

A humbler technology proved more durable. The **qanat**, an underground gravity-fed channel tapping an aquifer, with vertical shafts for maintenance, was developed in ancient Iran around 3,000 years ago (some suggest a southeast Arabian origin). It spread from Afghanistan to Algeria and Oman, and through al-Andalus to Spanish America. Qanats resist drought and war damage but need communal upkeep; in Afghanistan farmers have abandoned channels kept for centuries in favour of diesel-pumped tube wells.

China's **Grand Canal** shows both the power and the cost of hydraulic works. Emperor Yang of Sui completed the network in 604–609 to carry the rice of the south to his capital and armies; the first major section is recorded as using the labour of five million people, and canal conscription helped bring down the dynasty in 618. The Ming renovated it almost entirely in 1411–1415; 165,000 labourers dredged the Shandong section alone. But when the Yellow River changed course in 1855 and severed the canal in Shandong, sea shipping and new railways let it languish. The chapters on Tang and Song China and on Ming China and the Voyages of Zheng He tell its earlier history.

Did such works create despotism? The German-American sinologist **Karl Wittfogel** argued in *Oriental Despotism* (1957) that large-scale irrigation and flood control required central coordination and bureaucracy, producing "hydraulic" states of total power in Egypt, Mesopotamia, China, India, Mexico and Peru. His critics turned the argument round. Joseph Needham argued that he misread Chinese history; Robert McC. Adams found nothing linking early Mesopotamian dynastic authority to canal administration; Jacques Gernet argued that existing states made great irrigation works possible, not the reverse.

```quote
Archeological evidence now makes it appear that in at least three of the areas that Wittfogel cites as exemplifying his 'hydraulic hypothesis'—Mesopotamia, China, and Mexico—full-fledged states developed well before large-scale irrigation.
Robert Carneiro · Science · August 1970
```

Carneiro granted that irrigation "unquestionably" increased state power once states existed. And Bali offers a counter-example altogether. Its *subak* rice terraces, developed from the ninth century, whose World Heritage-listed core covers nearly 20,000 hectares, are irrigated cooperatively through a network of water temples, without a central despot; the anthropologist J. Stephen Lansing's work made the case famous. The chapter on Environmental History adds a newer challenge to Wittfogel from Ling Zhang.

## Canals, Rails and Wires

The industrial age built networks of a new speed and reach. The **Erie Canal**, begun in 1817 and opened in 1825, ran 363 miles from Albany to Buffalo. Many of its labourers were newly arrived Irish immigrants. An old claim that over 1,000 workers died of "swamp fever" is doubted by recent research, which finds no contemporary reports or mass graves. The canal's tolls quickly made it profitable, the cost of shipping a barrel of flour from Rochester to Albany fell from \$3 to 75 cents, and New York City gained a decisive advantage over other American ports.

The **Suez Canal**, opened in 1869, had an ancient predecessor: a Nile–Red Sea canal begun under Necho II and completed by Darius I. Ferdinand de Lesseps's company used forced labour until 1864, and some sources estimate that 1.5 million people worked on the canal. The death toll is contested. In his nationalisation speech of 1956 Nasser cited 120,000 dead; the company's chief medical officer reported no more than 2.49 deaths per thousand in 1866, from which a generous extrapolation gives a few thousand deaths at most. The canal cut 24 days from the steamship voyage between London and Bombay, and in 1875 Egypt's indebted Khedive sold his 44% stake to Britain, a story the chapters on British Empire and Decolonization take up.

At **Panama**, de Lesseps's French company went bankrupt in 1889 with an estimated 22,000 dead; in 1888 nine-tenths of its 40,000 workers were Afro-Caribbean. The United States then backed Panama's secession from Colombia in 1903 and built the canal between 1904 and 1914. William Gorgas's mosquito control nearly eliminated yellow fever and malaria, but about 5,600 workers still died, the great majority West Indians, against about 350 Americans. Pay was split into a "gold roll", mostly white Americans, and a "silver roll", mostly West Indian labourers; the system was racially coded, and the gold roll was tied to American or Panamanian citizenship. Panama took full control of its canal only at the end of 1999.

Railways spread from Britain's Stockton and Darlington (1825) and Liverpool and Manchester (1830) lines, described in the chapter on The Industrial Revolution. They also show **path dependence**: George Stephenson's gauge of 4 ft 8½ in, taken from colliery tramways, now serves more than half the world's railways, though nothing made it inherently best.

America's first transcontinental railroad, joined at Promontory Summit in 1869, was built on federal bonds and 21.1 million acres of land entitlement. Chinese workers, many from Guangdong, did most of the Central Pacific's heavy labour: a late-1865 snapshot shows about 3,000 Chinese and 1,700 white workers, and estimates of the peak workforce run from about 10,000 to 15,000 Chinese at any one time, with more over the whole project because of turnover. It crossed Plains nations' lands in violation of treaties, and the Union Pacific hired marksmen to kill the bison on which they lived. Russia's **Trans-Siberian Railway**, begun in 1891 and opened in 1904, became a continuous all-Russian route from Moscow to Vladivostok only in 1916; about four million peasant migrants arrived in Siberia in 1906–1914 (see the chapter on Imperial Russia from Napoleon to 1905).

Wires followed. Gutta-percha, a tree latex brought to Europe from Singapore, made submarine cables possible. The first transatlantic cable of 1858 failed after three weeks; a durable link was laid in 1866, cutting communication from "two weeks to two minutes", as the chapter on The Second Industrial Revolution describes. By 1872 every continent but Antarctica was connected, mostly by British companies. Today submarine cables carry about 99% of the world's data traffic across the oceans.

```checkpoint
q: What did Robert Carneiro and other critics argue against Wittfogel's "hydraulic hypothesis"?
a*: That in several of Wittfogel's own cases states existed before large-scale irrigation, so states built the irrigation rather than irrigation creating the states.
a: That irrigation had no effect at all on state power once states existed.
x: Carneiro granted that irrigation "unquestionably" increased state power once states existed.
a: That irrigation always required a single central ruler, as Bali's subak proves.
x: Bali's subak is cited against Wittfogel precisely because it was run cooperatively through water temples, without a central despot.
a: That Wittfogel had underestimated the importance of irrigation in Western feudal societies.
x: The criticism concerned the timing and direction of cause in Mesopotamia, China and Mexico, not Western feudalism.
hint: Think about which came first, the state or the canals.
why: Carneiro wrote in 1970 that in Mesopotamia, China and Mexico full-fledged states developed well before large-scale irrigation; Adams and Gernet made similar arguments.
---
q: What do the conflicting death tolls for the Suez Canal's construction show?
a: That the company's figures were proved accurate by later excavations.
x: No such excavations are cited; the toll remains contested.
a: That Nasser's figure of 120,000 is universally accepted.
x: The company's medical data implies far fewer deaths, so the figure is disputed.
a*: That the toll is contested, ranging from Nasser's 120,000 to a few thousand at most extrapolated from the company's medical reports.
a: That no one died building the canal, because forced labour ended in 1864.
x: Forced labour was used until 1864, and deaths occurred on any reckoning.
hint: Compare a nationalist leader's speech with a company's medical returns.
why: Nasser cited 120,000 in 1956; the company's chief medical officer reported no more than 2.49 deaths per thousand in 1866, which suggests a few thousand at most.
```

## Tools of Empire

**Daniel Headrick**, in *The Tools of Empire* (1981), showed how steamships, quinine, firearms and cables helped Europeans conquer and hold vast territories, while treating technology as an element of imperialism rather than a sufficient explanation; the chapter on Imperial Expansion and Resistance discusses his argument. Colonial railways make the point concretely. India's first passenger train ran from Bombay to Thane in 1853, built by private English companies promised a guaranteed 5% return, with the risk borne by Indian revenues. The economist Dave Donaldson estimates that when the railway reached the average district, real agricultural income rose by about 16%, and with Robin Burgess he finds that famine mortality became much less sensitive to rainfall once railways arrived. Historians who stress the cost of the guarantees and the continued export of grain during famines contest this rosy picture, as the chapter on British Empire explains.

In Africa railways were often built with coerced or indentured labour. The Uganda Railway from Mombasa to Lake Victoria (1896–1901) used more than 30,000 indentured labourers, mostly from Punjab and Gujarat, several thousand of whom died; many who stayed founded East Africa's Indian community. France's Congo–Ocean Railway (1921–1934) was built with forced labour recruited from what is now southern Chad and the Central African Republic, and more than 17,000 workers are estimated to have died. Its brutality fed the Kongo-Wara rebellion of 1928–1931.

## Sewers, Grids and Dams

Infrastructure also transformed health. London lost more than 30,000 people to cholera in three epidemics between 1831 and 1854. In the hot summer of 1858, the **Great Stink**, Disraeli called the Thames "a Stygian pool, reeking with ineffable and intolerable horrors", and tabled a bill letting the Metropolitan Board of Works borrow £3 million. Joseph Bazalgette's system of 82 miles of intercepting sewers and 1,100 miles of street sewers, built from 1859 to 1875, rested on a wrong premise: its aim was to remove the miasma, or bad air, then blamed for disease. It worked anyway, because it removed the cholera bacterium from drinking water. Yet a network protects only those connected to it: the 1866 outbreak killed 5,596 Londoners, 93% of them in an East End district not yet linked to the system. The chapter on The Victorian Era tells the wider story.

Electricity became a symbol of modernity and of political ambition. "Communism is Soviet power plus the electrification of the whole country," Lenin declared in 1920, as the GOELRO electrification plan was drawn up. In the United States, where fewer than 11% of farms had power in 1934, the New Deal's Rural Electrification Administration lent to cooperatives, and almost all farms were connected by 1952, though David Beito argues private firms had already been spreading rural supply.

Big dams became the twentieth century's grandest symbols of progress. Nehru called India's Bhakra Dam the "New Temple of Resurgent India". The Tennessee Valley Authority (1933) became the American model for modernising agrarian societies abroad, though historians criticise its displacement of over 125,000 valley residents. Egypt's Aswan High Dam (1960–1970) resettled 100,000–120,000 Nubians in Egypt and Sudan; Egypt began compensating its displaced Nubians only in 2019–20. Kariba on the Zambezi moved about 57,000 Tonga people; Ghana's Akosombo, built mainly to power an aluminium smelter, moved about 80,000 people from 700 villages. In India the Narmada Bachao Andolan, founded by Medha Patkar in 1985, mobilised Adivasis and farmers against the Sardar Sarovar dam; in 1993, after a critical independent review commissioned by the Bank, India cancelled the World Bank's loan. In 2000 the World Commission on Dams estimated that large dams had displaced 40–80 million people worldwide, many neither counted nor compensated. China's Three Gorges Dam, covered in the chapter on China Today: the Economic Miracle and Infrastructural Revolution, added more than a million more.

## Who Is Served, Who Is Bypassed

America's Interstate Highway System, authorised in 1956 and paid for mainly by a petrol tax, now carries about a quarter of all American vehicle miles. Between 1957 and 1977 its construction displaced over 475,000 households and about one million people, often routed through cheap land in minority neighbourhoods and sometimes used to divide white from Black areas; "freeway revolts" cancelled or rerouted some urban routes.

Housing finance drew similar lines. In the 1930s the Home Owners' Loan Corporation mapped 239 cities, grading the lowest districts red as "hazardous", and the Federal Housing Administration's manuals warned against "inharmonious racial groups". Between 1945 and 1959 African Americans received less than 2% of federally insured home loans. Historians debate which agency mattered most: the HOLC maps are the famous symbol, but Price Fishback and colleagues argue that the FHA built its own redlining method before the maps and that the maps themselves had little effect on lending, while others still give them a major role.

New York's **Robert Moses**, never elected, ran its parks, parkways, bridges and expressways from the 1920s to the 1960s. Robert Caro's *The Power Broker* (1974) cast him as a power-hungry builder whose works hurt poor and minority communities, and alleged that he built parkway overpasses too low for buses to keep poorer people from his beaches. That story is disputed: Steve Woolgar and Geoff Cooper call it an "urban legend" and Kenneth Jackson rejects any nefarious intent, while a Moses aide said the low bridges were meant to stop future legislatures from admitting commercial vehicles, buses included, which Caro read as support for his account. Stephen Graham and Simon Marvin argue in *Splintering Urbanism* (2001) that the ideal of standard networks serving everyone is giving way to "premium network spaces" for the well-off.

## Seeing Like a State and the Price of Ambition

**James C. Scott**, in *Seeing Like a State* (1998), argued that states make societies "legible" through surnames, maps and censuses, and that "high modernist" schemes fail when they ignore local practical knowledge; his examples include Soviet collectivisation, Brasília and Tanzania's forced villagisation of 1973–1975 (the chapter on The Global History of Quantitative Data introduces his ideas). Russell Hardin replied that collectivisation failed from bad incentives instead. Britain's Tanganyika groundnut scheme (1946–1951), which ignored warnings on soil and rainfall and cost £36 million, was called "the worst fiasco in recent British colonial history".

Bent Flyvbjerg sums up megaprojects with an "iron law": "over budget, over time, under benefits, over and over again". Boston's Big Dig, planned at \$2.8 billion, cost \$14.6 billion. Albert Hirschman offered a gentler view in 1967: his "Hiding Hand" holds that planners underestimate difficulties, but also underestimate people's ability to solve them, so ignorance lets worthwhile projects start. Some white elephants have no such redemption: Sri Lanka's Mattala airport, opened in 2013 with high-interest Chinese loans, was dubbed by *Forbes* "the world's emptiest international airport".

Infrastructure must also be maintained. Minneapolis's I-35W bridge, rated "structurally deficient" since 1990, collapsed in 2007, killing 13; Genoa's Morandi bridge partly collapsed in 2018, killing 43. Bazalgette's sewers still serve London but overflow in storms, and the £5 billion Thames Tideway Tunnel opened only in 2025.

```checkpoint
q: What does the 1866 cholera outbreak reveal about Bazalgette's sewer system?
a: That the system had failed completely across London.
x: The deaths were concentrated in one area not yet connected; elsewhere the system protected people.
a*: That an infrastructure protects only those connected to it: 93% of the 5,596 deaths were in an East End area not yet linked.
a: That the miasma theory behind the system was correct after all.
x: The miasma premise was wrong; the sewers worked because they removed the cholera bacterium from water.
a: That cholera had nothing to do with water supply.
x: The system worked precisely by removing the bacterium from drinking water.
hint: Look at where the deaths were concentrated.
why: The outbreak killed 5,596 Londoners, 93% of them in an East End district not yet connected and supplied by the East London Water Company.
---
q: How do Flyvbjerg and Hirschman differ on megaprojects?
a: Flyvbjerg thinks overruns are rare; Hirschman thinks they are universal.
x: Flyvbjerg's "iron law" holds that overruns are systematic, with about one in ten major projects on budget.
a: Both argue that planners usually overestimate the difficulties.
x: Both stress underestimation; they disagree about its consequences.
a: Hirschman argues that only private firms should build infrastructure.
x: The Hiding Hand concerns how planners misjudge difficulty and problem-solving, not who builds.
a*: Flyvbjerg sees systematic overruns and shortfalls; Hirschman's "Hiding Hand" holds that underestimating difficulties lets worthwhile projects begin.
hint: One is an "iron law", the other a "hand".
why: Flyvbjerg's iron law is "over budget, over time, under benefits, over and over again"; Hirschman argued that ignorance of difficulties is offset by underestimated problem-solving ability.
```

## Infrastructure as Geopolitics

Infrastructure has long been a weapon of rivalry as well as development. The Aswan High Dam was built with Soviet help after the United States and Britain withdrew their funding offers in 1956, prompting Nasser to nationalise the Suez Canal Company. China's **TAZARA** railway (1970–1975), built with about 13,000 Chinese technicians and 38,000 African labourers, gave Zambian copper an outlet avoiding white-ruled Rhodesia and South Africa, though by 2014/15 it carried under 2% of its design capacity (see the chapter on Maoism).

In 2013 Xi Jinping announced what became the **Belt and Road Initiative**, now involving more than 150 countries, from Kenya's \$3.6 billion Mombasa–Nairobi railway to a "Digital Silk Road" of cables. Brahma Chellaney coined the phrase "debt-trap diplomacy" in 2017, with Sri Lanka as his "exhibit A"; that year a Chinese company took a 99-year lease on its Hambantota port. Deborah Brautigam and Meg Rithmire called that narrative "a lie, and a powerful one": Hambantota was about 5% of Sri Lanka's 2017 debt service, and Chinese banks have never seized an asset. Sceptics point to a 2025 finding by the Lowy Institute that 54 developing countries owe more in repayments to China than to Paris Club lenders. Italy, the Philippines and Panama have stepped back, and Beijing now promotes "small and beautiful" projects.

Meanwhile Western megaprojects stall: California's high-speed railway, approved in 2008, is not expected to open its first segment before 2033, and Britain's HS2 lost its northern legs in 2021–23. The contrast with China's rapid buildout, told in the chapter on China Today: the Economic Miracle and Infrastructural Revolution, frames the stakes of the green and digital transitions. Across three thousand years the lesson is consistent. Infrastructure gives states reach, makes markets and changes lives for generations; but it serves some people and bypasses others, its costs fall unevenly, and it lasts only as long as someone pays to keep it working.

## Further exploration

- **Daniel R. Headrick, *The Tools of Empire: Technology and European Imperialism in the Nineteenth Century* (1981).** Steamships, quinine, guns and cables as instruments of conquest.
- **James C. Scott, *Seeing Like a State: How Certain Schemes to Improve the Human Condition Have Failed* (1998).** Legibility, high modernism and why grand schemes fail.
- **Brian Larkin, *Signal and Noise: Media, Infrastructure, and Urban Culture in Nigeria* (2008).** Radio, cinema and electricity in colonial and postcolonial Kano.
- **Jo Guldi, *Roads to Power: Britain Invents the Infrastructure State* (2012).** How centralised road-building made the British state, from the 1720s to 1848.
- **Ashley Carse, *Beyond the Big Ditch: Politics, Ecology, and Infrastructure at the Panama Canal* (2014).** The canal's water and the rural Panamanians whose lives it reshaped.
- **Julie Greene, *The Canal Builders: Making America's Empire at the Panama Canal* (2009).** The workers who built the canal, West Indians above all.
- **Sunil Amrith, *Unruly Waters: How Rains, Rivers, Coasts, and Seas Have Shaped Asia's History* (2018).** Dams, monsoons and water engineering in modern Asia.$mn_infra_master$,
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
  select $mn_infra_quiz$[
    {"type": "mcq", "prompt": "How did Michael Mann distinguish infrastructural power from despotic power?", "options": ["Infrastructural power is the capacity of a state, despotic or not, to penetrate its territories and logistically implement decisions; despotic power is elites' power over civil society", "Infrastructural power belongs only to democracies, despotic power only to monarchies", "Infrastructural power means owning roads and canals; despotic power means owning armies", "They are two names for the same thing"], "answerIndex": 0, "explanation": "Mann contrasted elites' 'despotic power' over civil society with 'infrastructural power', the institutional capacity of a state, despotic or not, to penetrate its territories and implement decisions: power through society rather than over it.", "id": "q1"},
    {"type": "mcq", "prompt": "Why is Bali's subak system cited against Karl Wittfogel's 'hydraulic despotism'?", "options": ["It was built by a single all-powerful king", "It shows complex irrigation managed cooperatively through water temples, without a central despot", "It used no water at all", "It was introduced by the Dutch in the twentieth century"], "answerIndex": 1, "explanation": "The subak rice terraces, developed from the ninth century, are irrigated cooperatively through water temples, showing that complex irrigation does not require a despotic central state.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the World Commission on Dams estimate in its 2000 report?", "options": ["That large dams had displaced no more than 1 million people", "That all displaced people had been fully compensated", "That large dams had displaced an estimated 40–80 million people worldwide, many neither counted nor compensated", "That dams had no effects downstream"], "answerIndex": 2, "explanation": "The Commission estimated 40–80 million people displaced by large dams worldwide, many neither counted nor compensated, with downstream livelihoods affected but unrecognised.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the status of the story that Robert Moses built parkway overpasses too low for buses to keep poorer people from his beaches?", "options": ["It is proved by Moses's own written orders", "It was invented in 2007", "It is accepted by all historians of New York", "It is disputed: Robert Caro alleged it, Woolgar and Cooper call it an 'urban legend', and Kenneth Jackson rejects nefarious intent"], "answerIndex": 3, "explanation": "Caro made the allegation in The Power Broker (1974); it is contested, though a Moses aide said low bridges were meant to deter commercial traffic.", "id": "q4"},
    {"type": "open", "prompt": "Using at least two examples from different continents, explain how infrastructure has served some people while bypassing or displacing others.", "rubric": "Strong answers use specific cases such as London's 1866 cholera outbreak (93% of deaths in an unconnected East End district), US Interstate displacement (over 475,000 households, 1957–77) and redlining, Nubians displaced by the Aswan High Dam, the Tonga at Kariba, Akosombo's 80,000 resettled, or the Narmada movement; they note that a network protects or benefits only those connected to it, and that costs fell on poorer, minority or Indigenous groups.", "id": "q5"},
    {"type": "open", "prompt": "Was colonial infrastructure a benefit or a burden to colonised peoples? Discuss with reference to railways.", "rubric": "Good answers weigh evidence on both sides: Donaldson's estimate of a roughly 16% rise in real agricultural income in Indian districts reached by rail and reduced famine sensitivity to rainfall, against the guarantee system that put risk on Indian revenues and grain exports during famines; forced or indentured labour and deaths on the Uganda and Congo–Ocean railways and the Kongo-Wara rebellion; Headrick's view of technology as a tool, not sole cause, of empire. They present the debate as a debate.", "id": "q6"}
  ]$mn_infra_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/the-role-of-infrastructure-in-history-its-powers-and-limitations', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
