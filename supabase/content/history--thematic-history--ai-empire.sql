-- AI and Empire — canonical master article, co-written and human-reviewed.
-- history/thematic-history/ai-and-empire @ research/advanced/read.
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
    'history/thematic-history/ai-and-empire',
    'research',
    'advanced',
    'read',
    $mn_aiempire_master$> **Who holds power through the machine?** Artificial intelligence is often called radically new, but the question of how technology serves empire is old. This chapter traces computing's roots in censuses, code-breaking and Cold War military funding; compares today's chips, minerals, data centres and undersea cables with the telegraphs and steamships that historians call "tools of empire"; follows the hidden workers of Kenya, the Philippines and Venezuela; asks who exports surveillance; and sets the US–China contest beside African and Indian efforts to build AI on their own terms. Whether "empire" is the right word is itself the central debate.

## An Old Question About a New Technology

The classic study of technology and empire is Daniel R. Headrick's *The Tools of Empire* (1981), which examined steam transport, firearms, communications and medicine while treating technology as one element in imperial expansion, not a sufficient explanation; the chapter on Imperial Expansion and Resistance discusses it. His *The Invisible Weapon* (1991) turned to submarine telegraph cables.

Cables are the clearest precedent. Britain sought a worldwide network running through its own territory, the All Red Line, and in 1870, at the government's behest, Bombay was linked to London by submarine cable; lines crossing foreign territory were seen as a wartime risk. Figures cited to Headrick show British companies owning two-thirds of the world's cables in 1892 and still 42.7 per cent in 1923. In the First World War Britain's own telegraphs ran almost uninterrupted while it quickly cut Germany's cables worldwide. The chapter on The Role of Infrastructure in History: its Powers and Limitations tells the earlier story of the Atlantic cables.

The fear that communications could keep poorer nations subordinate after formal empire is also older than AI: in *Mass Communications and American Empire* (1969) Herbert Schiller argued just that about imported equipment and foreign-produced software, a thesis later called "electronic colonialism".

## Census, Code and Cold War

Computing was born in the service of states. Herman Hollerith's tabulators were used for the US census of 1890, which (with other changes) took six years to process against eight for 1880. Census bureaus around the world leased his equipment, and his machines counted people in Europe and Canada but also in Puerto Rico, Cuba and the Philippines, under United States control after 1898. His company became part of what was renamed IBM in 1924, a story followed in the chapter on The Global History of Quantitative Data.

Bletchley Park, where, with its outstations, 8,995 people worked in January 1945, about three-quarters of them women, was the hub of an imperial network. The Government Code and Cypher School set up the Far East Combined Bureau in Hong Kong in 1935. The bureau moved to Singapore in August 1939. In 1942 its naval staff went on to Colombo in Ceylon and then to Kilindini at Mombasa in Kenya, while its army and air force staff went to the Wireless Experimental Centre outside Delhi. The chapter on Technological Advancements and the Digital Age describes Colossus and the wartime machines.

{{image: Bletchley Park | The mansion at Bletchley Park, hub of a wartime code-breaking network that reached Colombo, Mombasa and Delhi, and in November 2023 the venue of the first international AI Safety Summit.}}

A common simplification needs correcting here. The Dartmouth workshop on artificial intelligence in the summer of 1956 was funded by the Rockefeller Foundation, not the military. The military money came afterwards. President Eisenhower created the Advanced Research Projects Agency (ARPA) on 7 February 1958, in response to Sputnik. In June 1963 ARPA gave MIT about \$2 million for Project MAC, which absorbed the AI group founded by Marvin Minsky and John McCarthy, then \$3 million a year until the 1970s, with similar grants to Carnegie Mellon and Stanford. J. C. R. Licklider's motto was "fund people, not projects!"

The biggest Cold War computing project was SAGE, an air-defence network whose first direction centre opened in June 1958 and which fused radar data into a single picture of North American airspace. Its cost, estimated at \$8–12 billion, has been put at well above the Manhattan Project's, and IBM, which built its computers, benefited immensely. Paul N. Edwards's *The Closed World* is a classic account.

Military money also shaped what AI researchers did. After the Mansfield Amendment of 1969, ARPA was pressed to fund "mission-oriented direct research", and it moved towards autonomous tanks and battle-management systems. The Strategic Computing Initiative (1983–1993), a reply to Japan's Fifth Generation project, cost the Defense Department about \$1 billion. From April 2017 the Pentagon's Project Maven applied AI image recognition to drone footage; in June 2018, after employee protests, Google said it would not renew its contract, and, as Kate Crawford recounts, the work moved to Palantir.

```checkpoint
q: Who funded the 1956 Dartmouth workshop on artificial intelligence?
a*: The Rockefeller Foundation, a private philanthropy.
a: The US Department of Defense, through ARPA.
x: ARPA was not created until February 1958, after Sputnik; its large AI grants began in 1963.
a: IBM, as part of its work on the SAGE air-defence network.
x: IBM built SAGE's computers, but it did not fund the Dartmouth workshop.
a: The British Government Code and Cypher School.
x: The School ran Bletchley Park's wartime code-breaking; it had nothing to do with Dartmouth.
hint: The military money came afterwards.
why: McCarthy approached the Rockefeller Foundation in 1955. Military funding through ARPA, such as the grant of about \$2 million for MIT's Project MAC in 1963, came later.
---
q: Where did the naval staff of Britain's Far East Combined Bureau go in 1942, after leaving Singapore?
a: In Bletchley Park itself, which absorbed all overseas code-breaking.
x: The Far East Combined Bureau stayed overseas, as an outstation of an imperial network.
a: In Canberra, Australia.
x: Its naval staff moved west across the Indian Ocean, via Colombo to East Africa, not to Australia.
a*: To Colombo in Ceylon and then Kilindini, at Mombasa in Kenya.
a: In the Wireless Experimental Centre outside Delhi.
x: That was where the army and air force staff went; the naval staff went elsewhere.
hint: Follow the naval staff west across the Indian Ocean.
why: The bureau was founded in Hong Kong in 1935 and moved to Singapore in August 1939; in 1942 its naval staff went on to Colombo and then Kilindini, showing how wartime code-breaking ran on the geography of empire.
```

## The Material Empire: Chips, Minerals, Power and Cables

AI is often imagined as weightless. Crawford's *Atlas of AI* (2021) begins its survey of AI's material costs at a lithium mine at Silver Peak in Nevada; the salt flats of the "Lithium Triangle" of Bolivia, Chile and Argentina belong to the same story.

The tightest chokepoint is the chip. Taiwan's TSMC holds roughly 70 per cent of the world's contract chip-making market, and *Foreign Policy* reported in February 2023 that it made over 90 per cent of the most advanced chips. The idea that this makes Taiwan too important to attack, the "silicon shield", was current by 2000; in early 2023 Matthew Pottinger challenged it, arguing that China does not behave in ways that seem rational to democratic audiences. By 2025 the American firm Nvidia controlled more than 80 per cent of the market for chips used to train and run AI models, and became the first company worth both \$4 trillion and \$5 trillion.

Minerals are a second chokepoint, and here China commands. The International Energy Agency (IEA) estimated that in 2024 China accounted for about 91 per cent of rare-earth refining and 94 per cent of sintered permanent-magnet production; in 2025 it introduced two waves of export controls, the second later suspended for a year. Cobalt comes overwhelmingly from the Democratic Republic of the Congo, whose share of world output has been estimated at anywhere from about two-thirds to over 80 per cent in recent years; Siddharth Kara's *Cobalt Red* (2023) describes its artisanal mines and child labour.

Then there is energy. The IEA estimated that data centres used about 415 terawatt-hours in 2024, about 1.5 per cent of world electricity, and projected about 945 by 2030, just under 3 per cent, with AI the main driver and the United States, then China, adding most. Yet it also noted that data centres account for only about a tenth of the growth in demand to 2030, less than air conditioning or electric vehicles. Water estimates vary greatly with location and cooling. A cautionary case: in November 2025, after fact-checking by Andy Masley and others, the journalist Karen Hao acknowledged that her book *Empire of AI* had overstated the water use of a planned data centre in Chile by a factor of about 1,000, because of a unit error in a government document she had relied on; she issued a correction the following month.

In May 2024 Microsoft and G42 announced a \$1 billion geothermal-powered data centre at Olkaria in Kenya; by 2025–26 it was reported stalled. In May 2026 Kenya's president, William Ruto, was reported as saying that "one data centre requires 1,000MW and our installed capacity is 2,300MW", so that running it would mean shutting down half the country. Analysts disputed his figures, putting Kenya's capacity nearer 3,000 MW, and reports also blamed disagreements over payment guarantees.

Finally, the cables, which carry almost all the world's data. 2Africa, led by Meta with a consortium including China Mobile and MTN, is the largest ever built: 45,000 km with 46 landing stations in 33 countries, its core declared complete in November 2025. Xi Jinping announced the Digital Silk Road, the digital arm of the Belt and Road Initiative, in 2015, covering 5G, fibre-optic cables, satellites and data centres; in 2018 the PEACE cable, owned by a subsidiary of the Chinese firm Hengtong and linking Pakistan and East Africa to Europe, entered production. The All Red Line has successors, no longer only British.

## Data Colonialism and the Hidden Workforce

The boldest historical claim about AI is that it is a new colonialism. Nick Couldry and Ulises A. Mejias argue in *The Costs of Connection* (2019) that the data economy reorganises human life into a continuous source of raw material for capitalist accumulation, and in *Data Grab* (2024), according to a review in *Lawfare*, they do not use colonialism as a metaphor. Shoshana Zuboff's *The Age of Surveillance Capitalism* (2019) makes a related case without the colonial frame, describing a logic of accumulation, pioneered by Google, that "unilaterally claims human experience as free raw material for translation into behavioral data". The chapter on Technological Advancements and the Digital Age discusses Zuboff and her critics.

In India the language became literal in 2016. On 8 February the regulator TRAI banned Facebook's zero-rated "Free Basics" service under rules against discriminatory data tariffs. The next day the Facebook board member Marc Andreessen, replying to a critic who called Free Basics "internet colonialism", tweeted: "Anti-colonialism has been economically catastrophic for the Indian people for decades. Why stop now?" He deleted the tweet and apologised, and Facebook rejected the sentiment.

The colonial argument is strongest on labour. In January 2023 *TIME* reported that workers in Kenya employed by the contractor Sama had labelled violent and sexually abusive text to make ChatGPT less toxic, taking home between about \$1.32 and \$2 an hour depending on seniority and performance, while OpenAI's contracts paid Sama \$12.50 an hour; one worker described the experience as "torture". Sama disputed the figures, saying its workers earned \$1.46 to \$3.74 an hour after tax. Sama had been founded in 2008 by Leila Janah, who presented "microwork" as a way to help poor workers worldwide; that tension between exploitation and opportunity runs through the subject. In 2022 Daniel Motaung, a former Sama moderator, sued Sama and Meta in Kenya, alleging trauma, low pay and union-busting. In April 2026 Meta ended its Sama contract after reports that workers were viewing private footage from Meta's AI glasses, and Sama laid off more than 1,000 workers in Kenya.

The same pattern appears elsewhere. Scale AI's Remotasks platform in the Philippines relied on freelance contractors outside labour law; the *Washington Post* in 2023 described "digital sweatshops", with pay for some tasks falling below a cent after it expanded to India and Venezuela. In 2022 Hao and Andrea Paola Hernández argued in *MIT Technology Review* that Venezuela's economic collapse had made it "ground zero" for exploitation in data labelling.

Hao's *Empire of AI* (2025), based on about 260 interviews and reporting from Kenya, Colombia, Venezuela and the Philippines, portrays OpenAI as an empire, with chapters titled "A Civilizing Mission" and "Plundered Earth". OpenAI declined to cooperate and Sam Altman publicly criticised the book. Hao herself likens OpenAI to the East India Company, and some reviewers set the book beside William Dalrymple's history of that company, *The Anarchy* (2019), as the story of another corporate empire.

## Surveillance and Its Exporters

In 2018 Joy Buolamwini and Timnit Gebru's "Gender Shades" study found that commercial gender-classification systems from IBM, Microsoft and Face++ misclassified darker-skinned women at rates as high as 34.7 per cent, against under 1 per cent for lighter-skinned men; IBM dropped its general facial-recognition products in 2020. The American firm Clearview AI says its database holds more than 70 billion images scraped from the internet.

China built the largest system: its "Skynet" network had an estimated 200 million cameras in 2019, and over 700 million cameras were reported in China in 2023. In Xinjiang, the Integrated Joint Operations Platform, reported by Human Rights Watch and the *Washington Post* in 2018, gathers biometric data, including DNA, to track individuals, particularly Uyghurs, and since at least 2017 police have forced Uyghurs to install a monitoring app on their phones. Re-education camps were set up from 2017.

Who exports this technology? Steven Feldstein's *AI Global Surveillance Index* (Carnegie Endowment, September 2019) found at least 75 of 176 countries actively using AI for surveillance. Chinese firms such as Huawei, Hikvision, Dahua and ZTE (the rise of Huawei and ZTE in Shenzhen is told in the chapter on China Today: the Economic Miracle and Infrastructural Revolution) supplied 63 countries, and Huawei alone at least 50. But US firms, including IBM, Palantir and Cisco, supplied 32. The index did not separate lawful from abusive use. Nor are governments mere recipients: the African Digital Rights Network found forms of digital authoritarianism used by governments in ten African countries, from Egypt and Ethiopia to Kenya, Nigeria and South Africa. Surveillance is exported, but it is also chosen.

```checkpoint
q: What did Steven Feldstein's 2019 AI Global Surveillance Index find about suppliers of AI surveillance technology?
a: That Chinese firms were the only suppliers.
x: The index found US firms, including IBM, Palantir and Cisco, supplying 32 countries.
a*: That Chinese firms supplied 63 countries, Huawei alone at least 50, and US firms 32.
a: That US firms supplied more countries than Chinese firms did.
x: Chinese firms supplied 63 countries, almost twice the US firms' 32.
a: That only authoritarian states used AI for surveillance.
x: The index did not separate lawful from abusive use; it counted at least 75 of 176 countries using AI surveillance.
hint: Surveillance exports are not only Chinese.
why: Feldstein's index for the Carnegie Endowment found Chinese suppliers in 63 countries and American ones in 32, though it relied on open-source reporting.
---
q: What did Karen Hao acknowledge in November 2025 about her book Empire of AI?
a: That she had invented the Kenyan workers' testimony.
x: Her correction concerned a water figure, not the testimony of workers.
a: That her comparison of OpenAI with an empire was a mistake.
x: Her correction concerned a water figure; the imperial comparison is the book's thesis.
a: That OpenAI had cooperated with her after all.
x: OpenAI declined to cooperate with the book.
a*: That the book overstated the water use of a planned data centre in Chile by a factor of about 1,000, through a unit error.
hint: It concerned environmental costs, and a mistake with units.
why: After fact-checking by Andy Masley and others, Hao acknowledged the error, reported by Wired, a reminder that environmental figures need care.
```

## AI Nationalism and the US–China Contest

If some see a corporate empire, others see a contest of states. In 2018 the British investor Ian Hogarth popularised the term "AI nationalism", predicting that AI policy would become central to governments. The year before, on 20 July 2017, China's State Council had issued its Next Generation Artificial Intelligence Development Plan, aiming to make China the leading AI power by 2030; some analysts link the shift to AlphaGo's defeat of the Go player Lee Sedol in 2016. That September Vladimir Putin offered a blunter verdict.

```quote
Whoever becomes the leader in this sphere will become the ruler of the world.
Vladimir Putin · remarks reported by Fortune (in translation) · 2017
```

The United States answered with chips. From 7 October 2022 it imposed export controls aimed at China's ability to obtain and make advanced chips; they were revised repeatedly afterwards, loosened and tightened by turns. Policy swung too: President Biden's Executive Order 14110 of October 2023 on "safe, secure, and trustworthy" AI was revoked by President Trump on 20 January 2025, and his order of 23 January aimed to maintain "global AI dominance". On 21 January the White House announced Stargate, a \$500 billion AI venture of OpenAI, SoftBank, Oracle and MGX, though Bloomberg reported in August 2025 that it had not raised the funds for its initial budget. Here, as in China's "national AI teams" of firms such as Baidu, Tencent and Alibaba, corporate and state power blur.

The balance remained lopsided. The Stanford AI Index 2025 counted 40 notable AI models from US institutions in 2024, against 15 from China and 3 from Europe, and US private AI investment of about \$109 billion, roughly twelve times China's. Yet the Hangzhou firm DeepSeek's R1 model of January 2025, discussed in the chapter on Technological Advancements and the Digital Age, showed that controls did not settle the race. The IMF warned in January 2024 that poorer countries were less ready to capture AI's benefits, which could widen income gaps between countries.

## Sovereignty, Languages and Decolonising AI

Britain held the first international AI Safety Summit at Bletchley Park on 1–2 November 2023, and its declaration was signed by 28 countries, including both the United States and China. At the Paris AI Action Summit of February 2025, the US vice-president, JD Vance, warned against "excessive regulation" and argued that it "could kill a transformative industry just as it's taking off"; the United States and Britain declined to sign the summit's declaration on inclusive and sustainable AI. The fourth summit, held in New Delhi in February 2026, was the first hosted by a country of the Global South.

Many governments outside the great powers frame AI as a development tool under their own control. The African Union's Executive Council endorsed a Continental Artificial Intelligence Strategy at Accra, Ghana, in July 2024. India approved its IndiaAI Mission in March 2024 with ₹10,371.92 crore, nearly 45 per cent of it for shared computing, and in January 2025 its minister announced plans for native AI models for Indian languages on more than 18,000 subsidised graphics chips. Its Bhashini platform (2022) aims to cover all 22 languages listed in India's constitution, and BharatGen (2024) is a government-funded open-source multilingual model.

Language is a cultural frontier. The World Economic Forum noted in 2024 that most AI chatbots were trained on only about 100 of the world's roughly 7,000 languages, and models trained mostly on English data tend to present Western views as the norm. Grassroots efforts push back: BLOOM (2022), from a volunteer workshop, covers 46 languages, and Masakhane, founded by South African researchers in 2019 (its name means "we build together" in isiZulu), aims to strengthen research on African languages "for Africans, by Africans".

Some of the sharpest critics came from inside the industry. Timnit Gebru co-led Google's Ethical AI team until December 2020, when she left in a dispute over a paper on large language models; Google said it accepted her resignation, and Gebru says she did not resign. In December 2021 she founded the Distributed AI Research Institute (DAIR) to "counter Big Tech's pervasive influence on the research, development and deployment of AI". Crawford writes as a principal researcher at Microsoft Research. In 2020 Shakir Mohamed, Marie-Therese Png and William Isaac proposed a "decolonial AI", built on a critical technical practice, reverse tutelage and reverse pedagogies, and renewed affective and political communities.

## Is "Empire" the Right Word?

The colonial analogy's defenders, Couldry and Mejias above all, hold that the appropriation of data is not like colonialism but a new phase of it. Critics urge precision: Orit Halpern cautions against "historical flattening" through broad analogies between past empires and platforms, and others say the concept treats colonialism as a single essence or obscures how data power works differently in different places. Sceptics can also point to differences of kind: no platform has annexed territory, and the Kenyan moderators took their case to Kenyan courts.

The genealogy is real: Hollerith's colonial censuses, Bletchley's imperial outstations, ARPA's grants, SAGE and Maven. So is the concentration of chokepoints in a few places and firms, as with British cables in 1892. But Headrick himself treated technology as necessary, not sufficient, for empire, and the first AI workshop was paid for by a philanthropy, not an army. Whether AI must concentrate power like the tools before it, or can be governed differently through regulation, open models, local languages and organised workers, is a question this history frames but cannot answer. On how historians themselves now use these tools, see the chapter on Digital History.

## Further exploration

- **Nick Couldry and Ulises A. Mejias, *The Costs of Connection: How Data Is Colonizing Human Life and Appropriating It for Capitalism* (2019).** The founding statement of "data colonialism"; *Data Grab* (2024) is the shorter popular sequel.
- **Karen Hao, *Empire of AI: Dreams and Nightmares in Sam Altman's OpenAI* (2025).** OpenAI as an empire, with reporting from Kenya, Venezuela, Colombia, Chile and the Philippines; note the corrected Chile water figure.
- **Kate Crawford, *Atlas of AI: Power, Politics, and the Planetary Costs of Artificial Intelligence* (2021).** The minerals, labour, data and state power behind AI.
- **Joy Buolamwini, *Unmasking AI: My Mission to Protect What Is Human in a World of Machines* (2023).** Facial-recognition bias, by the co-author of "Gender Shades".
- **Daniel R. Headrick, *The Invisible Weapon: Telecommunications and International Politics, 1851–1945* (1991).** Submarine cables and imperial power, the best precedent for AI's infrastructure.$mn_aiempire_master$,
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
  select $mn_aiempire_quiz$[
    {"type": "mcq", "prompt": "According to figures cited to Daniel Headrick, what share of the world's submarine cables did British companies own and operate in 1892?", "options": ["Two-thirds", "About one-tenth", "None, because cables were state-owned", "Exactly half"], "answerIndex": 0, "explanation": "British companies owned and operated two-thirds of the world's cables in 1892, and still 42.7 per cent in 1923, a precedent for today's concentrated digital infrastructure.", "id": "q1"},
    {"type": "mcq", "prompt": "What did TIME report in January 2023 about Kenyan workers employed by Sama on OpenAI's project, and how did Sama respond?", "options": ["That they earned more than OpenAI paid Sama, which Sama confirmed", "That they had never seen harmful content, which Sama denied", "That they took home between about $1.32 and $2 an hour, depending on seniority and performance; Sama disputed this, saying they earned $1.46–$3.74 after tax", "That they were all employed directly by OpenAI in California"], "answerIndex": 2, "explanation": "TIME reported take-home pay of between about $1.32 and $2 an hour while OpenAI paid Sama $12.50 an hour; Sama disputed the figures, saying workers earned $1.46–$3.74 an hour after tax.", "id": "q2"},
    {"type": "mcq", "prompt": "Who did Steven Feldstein's 2019 AI Global Surveillance Index find supplying AI surveillance technology?", "options": ["Only Chinese firms", "Chinese firms to 63 countries and US firms such as IBM, Palantir and Cisco to 32", "Only European firms", "Only US firms"], "answerIndex": 1, "explanation": "Chinese firms, especially Huawei, Hikvision, Dahua and ZTE, supplied 63 countries (Huawei alone at least 50), but US firms supplied 32: surveillance exports are not only Chinese.", "id": "q3"},
    {"type": "mcq", "prompt": "Where and when did the African Union's Executive Council endorse its Continental Artificial Intelligence Strategy?", "options": ["Addis Ababa, 2017", "New Delhi, February 2026", "Bletchley Park, November 2023", "Accra, Ghana, July 2024"], "answerIndex": 3, "explanation": "The Executive Council endorsed the development-oriented strategy at its session in Accra on 18–19 July 2024.", "id": "q4"},
    {"type": "open", "prompt": "Is \"colonialism\" the right word for the power of AI and data companies? Weigh the arguments on both sides.", "rubric": "Strong answers present Couldry and Mejias's claim that data colonialism is not a metaphor but a new phase of colonial appropriation, and use evidence such as Global South data labour (Sama in Kenya, Remotasks in the Philippines, Venezuela), the Free Basics dispute and Andreessen's 2016 tweet, and Hao's Empire of AI (which likens OpenAI to the East India Company). They also give critics their due: Orit Halpern's warning against 'historical flattening', the charge that the concept essentialises colonialism or ignores local differences, the absence of territorial conquest, and the agency of Global South governments and workers. They treat the question as a debate, not a settled finding.", "id": "q5"},
    {"type": "open", "prompt": "How far does the material infrastructure of AI resemble the nineteenth-century 'tools of empire' that Daniel Headrick described?", "rubric": "Good answers compare British cable dominance (two-thirds of world cables in 1892, the All Red Line, cutting Germany's cables in the First World War) with today's chokepoints: TSMC and Taiwan, Nvidia's 80%+ share, US export controls from 2022, China's dominance of rare-earth refining, DRC cobalt, energy-hungry data centres (IEA: about 1.5% of world electricity in 2024) and cables such as 2Africa and the Digital Silk Road (announced 2015). They note Headrick's own caution that technology was an element of empire, not a sufficient cause, and differences such as the role of private firms and rival states, and the care needed with environmental figures (Hao's corrected Chile water figure).", "id": "q6"}
  ]$mn_aiempire_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/ai-and-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
