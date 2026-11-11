-- The 'Settler Revolution' at the Edge of Empire: Australia, 1770-1901 — canonical master article, co-written and human-reviewed.
-- history/regional-histories/oceania-and-the-pacific/the-settler-revolution-at-the-edge-of-empire-australia-1770-1901 @ research/advanced/read.
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
    'history/regional-histories/oceania-and-the-pacific/the-settler-revolution-at-the-edge-of-empire-australia-1770-1901',
    'research',
    'advanced',
    'read',
    $mn_australia_master$> **A continent claimed, contested and federated.** In 1770 James Cook claimed the east coast of a continent whose peoples had lived there for at least 50,000 years, possibly 65,000. Eighteen years later a fleet of convicts and marines founded a penal colony at Sydney Cove. By 1901 six self-governing colonies, grown on wool, gold and migration, had united as the Commonwealth of Australia. This chapter follows the story from both sides of the frontier: Aboriginal and Torres Strait Islander people who traded, fought, petitioned and voted; convicts, squatters, diggers and Chinese and Pacific Islander workers; *terra nullius*; the frontier wars; James Belich's "settler revolution"; and the debates that still divide historians.

## Country Before Cook

The ancestors of Aboriginal Australians arrived at least 50,000 years ago, possibly 65,000; the Madjedbebe rock shelter in Arnhem Land is perhaps the oldest known site. The chapter on Human Origins describes that first crossing into Sahul.

By the eighteenth century the continent was home to about 600 nations speaking some 250 languages with their dialects. Estimates of their number run from about 300,000 (the Australian Bureau of Statistics) to a median of about 2.2 million, within a range of roughly one to four million (a 2026 study by Bradshaw and colleagues); older archaeological estimates suggested about 750,000.

These societies shaped their country: certain groups practised fire-stick farming, and Bill Gammage's *The Biggest Estate on Earth* (2011) describes Aboriginal land management, above all by fire. Nor were they isolated. From at least the 1720s, and possibly the mid-1600s, Makassan trepang fishermen from Indonesia visited the north coast every year; Aboriginal people adopted their dugout canoes and metal harpoon heads. Torres Strait Islanders, a Melanesian people distinct from Aboriginal Australians, had by 2,500 years ago built a maritime culture of their own, with gardens on some islands.

## 1770: Cook, Banks and the Claim

The chapter on Pacific Voyagers follows Cook's voyages across Oceania. His instructions told him to take possession of "Convenient Situations" with "the Consent of the Natives". On 29 April 1770 his crew landed at Botany Bay, Kamay. Two Gweagal men opposed the landing, and one was wounded with small shot. The historian Nicholas Thomas notes that the famous painting by E. Phillips Fox, showing Cook restraining his men, is misleading: Cook was the first to fire. Cook concluded that the local people only wanted the British to leave.

Further north, while the damaged *Endeavour* was repaired at the Endeavour River, a quarrel with the Guugu Yimithirr over green turtles ended when an elder presented a broken-tipped spear as a peace offering, a meeting re-enacted in Cooktown every year since 1959 with Guugu Yimithirr participation. Cook wrote admiringly of the people he met:

```quote
From what I have said of the Natives of New Holland they may appear to some to be the most wretched people upon Earth, but in reality they are far more happier than we Europeans
James Cook · Endeavour journal · 1770
```

On 22 August 1770, on an island in Kaurareg country in the Torres Strait (Bedanug, now Possession Island), Cook hoisted the British colours and "took possession of the whole Eastern Coast" under the name New South Wales. In 2001 the Kaurareg won native title over that island. It was the expedition's botanist, Joseph Banks, who later promoted Botany Bay for settlement; Cook had no role in promoting colonisation.

## Terra Nullius: A Later Doctrine

Australia is often said to have been taken as *terra nullius*, "land belonging to no one". The phrase was not used in the eighteenth century. Frost, Attwood and others argue that the concept was widely accepted at the time of settlement; Borch argues that it developed as a legal theory in the nineteenth century. Stuart Banner traces its first known legal use in Australia to 1819, when, in a tax dispute, British law officers advised that New South Wales had been acquired as "desert and uninhabited", as the chapter on the British Empire notes.

The doctrine then hardened. Batman's Treaty of 6 June 1835, made with Wurundjeri and Boonwurrung elders, was the only documented European attempt to negotiate occupation by treaty; Governor Bourke's proclamation of 26 August 1835 declared it void, asserting the Crown's sole right to distribute land. In *Cooper v Stuart* (1889) the Privy Council described New South Wales as "a tract of territory practically unoccupied, without settled inhabitants or settled law".

The doctrine was overturned by Torres Strait Islanders. In 1982 Eddie Mabo and other Meriam people of Mer (Murray Island) began the case that the High Court decided on 3 June 1992: in *Mabo v Queensland (No 2)* it rejected the "enlarged notion of terra nullius" and recognised native title, leading to the Native Title Act 1993. It changed land law, not British sovereignty. Paul Keating said the decision "establishes a fundamental truth, and lays the basis for justice".

## The First Fleet and the Convict Colony

The American Revolution had closed Britain's outlet for convicts in America. The **First Fleet** of eleven ships under Captain Arthur Phillip left Portsmouth in May 1787; by Mollie Gillen's count 1,373 people landed, among them 543 male and 189 female convicts. Phillip found Botany Bay unsuitable and on 26 January 1788 landed at Sydney Cove in Port Jackson; the colony was formally proclaimed on 7 February.

Between 1788 and 1868 about 162,000 to 164,000 convicts were transported to Australia (sources differ). About 70 per cent were English or Welsh and 24 per cent Irish, with a few Māori, Chinese and people enslaved in the Caribbean. Some 24,000, one in seven, were women, mostly convicted of theft; none were transported for prostitution. About 3,600 were political prisoners, among them Irish rebels and Chartists such as William Cuffay, whom the chapter on the Victorian Era mentions.

By 1821 convicts, former convicts and their children owned two-thirds of the colony's cultivated land. Transportation to New South Wales was suspended in 1840, ended in Van Diemen's Land in 1853, and continued to Western Australia from 1850 until the last ship, the *Hougoumont*, arrived in January 1868.

## The Epidemic of 1789

Phillip had been instructed to live "in amity and kindness" with the Aboriginal people. In April 1789, about fifteen months after the British arrived, an epidemic, usually described as smallpox, devastated the Aboriginal people of the Sydney region while sparing the colonists. Phillip thought perhaps half had died; **Bennelong** also believed that half of the Eora of the district had died.

What the disease was, and where it came from, remain unresolved. Campbell and Macknight argue that smallpox came overland from Makassan visitors in the north. Butlin, Day and Warren argue that it was released, accidentally or deliberately, from the First Fleet surgeons' inoculation material, a view that has resonated with Aboriginal scholars including Professors Maynard and Marcia Langton; Keneally and Blainey reject deliberate release. Others, Ford and Carmody, think it was chickenpox. Watkin Tench knew the surgeons had "variolous matter in bottles", but called the link "a supposition so wild as to be unworthy of consideration".

```checkpoint
q: Who promoted Botany Bay as a site for British settlement after the Endeavour voyage?
a*: Joseph Banks, the expedition's botanist.
a: James Cook, in his journal of 1770.
x: Cook claimed the east coast, but he had no role in promoting its colonisation.
a: Arthur Phillip, who then chose Botany Bay as the colony's site.
x: Phillip rejected Botany Bay and settled at Sydney Cove in Port Jackson.
a: Governor Bourke, in his proclamation of 1835.
x: Bourke's 1835 proclamation voided Batman's Treaty; it had nothing to do with choosing Botany Bay.
hint: Think of the scientist on board the Endeavour.
why: Banks, not Cook, promoted Botany Bay; Cook's role was the charting and the claim of 1770.
---
q: What is the current state of knowledge about the epidemic of 1789 in the Sydney region?
a: It was certainly smallpox deliberately released by the colonists.
x: Deliberate release is one argued view, but it is rejected by others and not proven.
a: It was certainly chickenpox brought by the First Fleet.
x: Chickenpox is one hypothesis among three, not an established fact.
a*: Both the disease and its origin are disputed: Makassan smallpox spreading overland, release from the First Fleet's inoculation material, and chickenpox have all been argued.
a: It killed colonists and Aboriginal people in equal numbers.
x: It devastated the Aboriginal people of the Sydney region while sparing the British.
hint: Historians offer three competing explanations.
why: The epidemic's devastation is documented, but its nature and origin remain unresolved.
```

## The Frontier Wars

Conflict began within months of January 1788 and lasted until at least 1928, the year of the Coniston massacre; some sources extend it to 1934 and the Caledon Bay crisis. Aboriginal people fought these wars as resistance, and their leaders appear in the colonists' own records.

**Pemulwuy**, a Bidjigal man of the Dharug nation and possibly a *carradhy* or cleverman, led a guerrilla war from 1790 for twelve years. In December 1790 he killed Phillip's huntsman, McIntyre; Phillip first ordered ten Bidjigal killed in reprisal, then, at Tench's suggestion, six captured instead; the expedition found no one. His raids reached Parramatta and the Hawkesbury until he was shot dead in 1802; his head was sent to Joseph Banks and has never been found. Governor King wrote to Banks that "although a terrible pest to the colony, he was a brave and independent character."

Around Bathurst, the Wiradjuri resisted the spread of settlement under **Windradyne**. Governor Brisbane declared martial law on 14 August 1824; in December Windradyne walked to Parramatta to meet the governor. On 10 June 1838 at **Myall Creek**, a party of stockmen, assigned convicts and former convicts led by the free settler John Henry Fleming, killed at least 28 unarmed Wirraayaraay people, most of them women, children and old men. After a first acquittal, seven were convicted at a second trial and hanged; Fleming was never tried.

As the frontier moved north, colonial governments raised Native Police forces, in Port Phillip from 1837 and in northern New South Wales (later Queensland) from 1848: Aboriginal men, some recruited at gunpoint, led by officers. In 2025 Victoria's Yoorrook Justice Commission concluded that British policies there constituted genocide. Queensland was the bloodiest frontier, yet the Kalkadoon held settlers out of western Queensland for ten years until the battle at Battle Mountain in September 1884. In Western Australia, the Bunuba fighter **Jandamarra** resisted until his death in 1897.

How many died is disputed. Richard Broome's estimates run to some 1,700 to 2,000 settlers and 17,000 to 20,000 Aboriginal people between 1788 and 1928; Henry Reynolds put Aboriginal deaths at over 30,000 in 2022. The University of Newcastle's Colonial Frontier Massacres project, led by Lyndall Ryan, which counts only massacres of six or more people, recorded at its 2022 stage more than 10,000 Aboriginal lives lost in at least 414 massacres between 1788 and 1930, and by 2025 some 438 massacres (its authors have estimated 11,000 to 14,000 victims), about half involving police or soldiers. Evans and Ørsted-Jensen reckoned "probably no less than 100,000" nationally, an estimate Richards and Finnane criticised as resting on too little systematic data. The Australian War Memorial does not commemorate these wars, though after Rachel Perkins's series *The Australian Wars* (2022) its chair promised a broader depiction.

## Van Diemen's Land: War, Exile and Survival

The British settled in Van Diemen's Land (Tasmania) in 1803, among an Aboriginal population estimated at 3,000 to 7,000 (Ryan argues for about 7,000). As settlers and sheep multiplied, Aboriginal people fought what colonists called the **Black War** and Ryan calls the Tasmanian War. Some 600 to 900 Aboriginal people and more than 200 colonists died by 1832. Broome calls it the most successful Aboriginal resistance in Australia's history, and Governor Arthur admitted that the British were "the first aggressors". In 1830 the "Black Line" of 2,200 soldiers, convicts and civilians swept the island and captured two people.

George Augustus Robinson's "friendly missions" of 1830–34 depended on Aboriginal guides, among them Truganini, Woureddy, Kikatapula and Mannalargenna. About 220 survivors were moved to Wybalenna on Flinders Island, where they did not simply submit. In 1846, led by Walter George Arthur and Mary Ann Arthur, they sent the first petition by Indigenous Australians to a reigning monarch:

```quote
Your Majesty's petitioners pray that you will not allow Dr Jeanneret to come again among us... he put many of us into jail for talking to him because we would not be his slaves.
Wybalenna petitioners to Queen Victoria · Petition · 1846
```

**Truganini**, a Nuenonne woman of Bruny Island, guided Robinson's missions, and in Port Phillip in 1841 she joined Tunnerminnerwait and Maulboyheenner in armed raids; the two men were hanged, but she was acquitted. When she died in Hobart in 1876 she was widely, but wrongly, described as the last Aboriginal Tasmanian. Against her wishes her skeleton was displayed in the Tasmanian Museum from 1904 until 1947; she was cremated only in 1976, after campaigning by the Tasmanian Aboriginal Centre. Fanny Cochrane Smith and the Cape Barren Island community survived, and scholars and the Palawa community reject the "extinction myth".

## Squatters, Sheep and the Settler Revolution

From the 1820s graziers drove sheep and cattle beyond the official "limits of location". These squatters were legalised in 1836 with £10 grazing licences, and by 1840 they were among the colony's wealthiest men, mocked as the "squattocracy". New colonies followed at Swan River (1829), South Australia (1836) and Port Phillip, which became Victoria in 1851; by 1850 the Port Phillip district held 75,000 Europeans, 5 million sheep and about 2,000 Aboriginal people. Many Aboriginal men worked as shepherds and stockmen, keeping their connection to country; the Waste Land Act of 1848 gave traditional owners limited rights to live, hunt and gather on pastoral leases.

The New Zealand historian James Belich gives this chapter its title. In *Replenishing the Earth* (2009), as reviewers summarise it, he argues that from about 1800 a settler revolution made settlement explosive, and treats the American West and Britain's settler colonies as one Anglo-world. Settler economies, he contends, boomed on migration, went bust, and were rescued by staple exports such as wool, gold and refrigerated meat, which bound them more tightly to Britain. Norman Etherington found the model too neat, doubting its neglect of real export profits. Australia shows the swings: population grew from 430,000 in 1851 to 1.7 million in 1871, and then in the 1890s falling wool prices and the collapse of Melbourne's land boom brought bank suspensions, a fifth off the economy and unemployment of almost a third.

## Gold, Eureka and the Chinese Diggers

In February 1851 gold was found at Ophir near Orange, and within months at Ballarat and Bendigo in Victoria, whose population rose from 75,000 to 500,000 in a decade. Among the newcomers were Chinese men, mostly from Guangdong: about 19,000 to 20,000 were on the Victorian fields by the end of 1855. Many worked in cooperatives, and merchants such as Lowe Kong Meng in Melbourne and Mei Quong Tart in Sydney became prominent figures.

Diggers resented the compulsory licence, first set at 30 shillings a month in 1851, and the "licence hunts" that enforced it. At Ballarat the Reform League, influenced by the Chartism that the chapter on the Victorian Era describes, organised protest, and on 29 November 1854 some 10,000 people gathered at Bakery Hill under the new Southern Cross flag; the next day Peter Lalor led the rebels' oath. At dawn on 3 December 1854 fighting broke out at the **Eureka Stockade**. The registrar recorded 27 deaths, and Peter Lalor listed 22 rebel dead; most casualties were rebels. All thirteen men tried for high treason, among them the African American John Joseph, were acquitted; Clare Wright has recovered the part women played. The licence gave way to a £1 miner's right that carried the vote. Whether Eureka was the birth of Australian democracy is debated: some see it that way, while others note that self-government was already under way.

{{image: Eureka Rebellion | A contemporary painting of the fighting at the Eureka Stockade, Ballarat, December 1854.}}

## Self-Government and the Vote

New South Wales, Victoria and Van Diemen's Land gained self-governing constitutions in 1855–56, South Australia in 1856–57, Queensland in 1859 and Western Australia only in 1890. Their secret ballot, introduced from 1856, spread to the United States as the "Australian ballot". Men gained the vote in South Australia, Victoria and New South Wales by 1858, and in 1899 Queensland formed the world's first Labor government, which lasted a week.

Democracy's boundaries were drawn by race. Queensland excluded Aboriginal men from voting from 1885, and Western Australia applied a property test to Aboriginal, Asian and African men. Yet when South Australia gave women the vote and the right to stand for parliament in 1894–95, Aboriginal women were included. At Point McLeay, now Raukkan, more than 100 Aboriginal people, women among them, were enrolled, and about 70 per cent voted in 1896.

## Chinese, Islanders and the Roots of White Australia

Hostility to Chinese diggers began at Bendigo in 1854. At Lambing Flat in New South Wales on 30 June 1861, 2,000 to 3,000 miners under a banner reading "Roll Up – No Chinese" attacked about 2,000 Chinese miners, beating many. Between 1875 and 1888 every colony excluded further Chinese immigration, and in 1896 an intercolonial conference extended the restrictions to "all coloured races".

Queensland's sugar relied on another labour system. From 1863 to 1908 between 55,000 and 62,500 Pacific Islanders, mostly from Vanuatu and the Solomon Islands, were brought to Queensland, recruited by means ranging from negotiation to kidnapping at gunpoint, a trade known as "blackbirding"; about 15,000 died while working there.

After conventions in the 1890s, referendums in each colony approved union between 1898 and 1900. The Commonwealth of Australia was proclaimed in Centennial Park, Sydney, on **1 January 1901**, with Barton as interim Prime Minister; New Zealand and Fiji stayed out. The constitution excluded "aboriginal natives" from population counts until the 1967 referendum. In 1901 the new parliament passed the Pacific Island Labourers Act, under which between about 4,000 and 7,500 Islanders were deported, and the Immigration Restriction Act, drafted by Deakin, which imposed a fifty-word dictation test in any European language an officer chose: a racial bar that avoided naming race, because Britain objected to explicit racial bars. The White Australia policy it founded was dismantled only in stages, between 1949 and 1973.

```checkpoint
q: What did the Immigration Restriction Act 1901 use to exclude non-European migrants?
a: An explicit ban on all Asian immigrants named in the Act.
x: Britain objected to explicit racial bars, so the Act avoided naming race.
a*: A dictation test of fifty words in any European language chosen by the officer.
a: A licence fee of 30 shillings a month.
x: The 30-shilling monthly licence was the goldfields mining licence of the 1850s.
a: A requirement to own property worth £10.
x: The £10 sum was the annual grazing licence for squatters from 1836.
hint: The test could be given in a language the migrant did not know.
why: The dictation test let officials exclude anyone while keeping race out of the law's wording.
---
q: Why is Truganini no longer described as "the last Aboriginal Tasmanian"?
a: Because she was born in Victoria, not Tasmania.
x: She was a Nuenonne woman of Bruny Island, Tasmania.
a: Because she outlived everyone at Wybalenna and died in the 1900s.
x: She died in Hobart in 1876.
a: Because she was acquitted in Port Phillip in 1841.
x: Her acquittal is true but has nothing to do with the description.
a*: Because Aboriginal Tasmanians survived her, including Fanny Cochrane Smith and the Cape Barren Island community, and the "extinction myth" is rejected.
hint: Think of who lived on after 1876.
why: Scholars and the Palawa community reject the extinction myth; Aboriginal Tasmanians survived and are still there.
```

## The History Wars and the Century's Legacy

In 1968 W. E. H. Stanner named historians' neglect of Aboriginal people "the great Australian silence". Henry Reynolds's *The Other Side of the Frontier* (1981) told the frontier from the Aboriginal side, and Ryan wrote Tasmanian Aboriginal history as one of survival, not extinction. Then came a backlash. Geoffrey Blainey criticised a "black armband" view of history in 1993, and John Howard took up the phrase in 1996. In *The Fabrication of Aboriginal History* (2002) Keith Windschuttle counted only 118 Aboriginal people killed by the British in Van Diemen's Land on what he called credible evidence, and accused Ryan and Reynolds of fabrication. Robert Manne's collection *Whitewash* found his arguments unpersuasive and unsupported; Marcia Langton, the Yiman and Bidjara anthropologist, was among his critics. Whether Tasmania's history was genocide remains argued: Lemkin, Kuper and Diamond cited it as a textbook example and Kiernan treats it as genocide, Windschuttle and Minogue denied it, and Reynolds is more circumspect.

Aboriginal scholars have also reshaped how colonial sources are read. The legal academic Larissa Behrendt, Eualeyai and Kamilaroi on her father's side, reads the colonial story of Eliza Fraser, on Butchulla country in 1836, for its stereotypes in *Finding Eliza* (2016). A newer debate surrounds Bruce Pascoe's *Dark Emu* (2014), which argues from explorers' accounts that pre-colonial Aboriginal society included agriculture, aquaculture such as the eel traps of Budj Bim, and villages. In *Farmers or Hunter-Gatherers?* (2021) the anthropologist Peter Sutton and the archaeologist Keryn Walshe charged Pascoe with selective quotation and argued that ranking farming above hunting and gathering undervalues Aboriginal economies. Aboriginal opinion is itself divided: the Noongar scholar Hannah McGlade called the book misleading and offensive, and Pascoe's own Aboriginal identity has been disputed by Warren Mundine and supported by Langton. The quarrel is over categories and evidence, not over whether Aboriginal people shaped their land; on that, all agree.

The century from Cook to Federation made a nation that was British, democratic and self-consciously white, on land taken without treaty. By 1901 the recorded Indigenous population was some 90,000 to 95,000, a minimum estimate. Yet the people who had resisted, petitioned and voted endured, and their descendants, from the Meriam plaintiffs in *Mabo* to the Kaurareg on Possession Island, would win recognition in the colonisers' own courts. The chapter on the British Empire sets this story in Britain's wider empire, and the chapter on Imperial Expansion and Resistance follows conquest and resistance in Africa and Asia.

## Further exploration

- **Richard Broome, *Aboriginal Australians: A History Since 1788* (5th edn 2019; first published 1982 with a different subtitle).** The standard survey of Aboriginal history since colonisation.
- **Henry Reynolds, *The Other Side of the Frontier* (1981).** The first major history of the frontier from the Aboriginal side.
- **Lyndall Ryan, *Tasmanian Aborigines: A History since 1803* (2012).** Invasion, war, incarceration, survival and resurgence, rejecting the "extinction" story.
- **Grace Karskens, *The Colony: A History of Early Sydney* (2009).** Convicts, Aboriginal Sydney and the early colony; a Prime Minister's Literary Award winner.
- **James Belich, *Replenishing the Earth: The Settler Revolution and the Rise of the Anglo-World, 1783–1939* (2009).** The book behind this chapter's title.
- **Clare Wright, *The Forgotten Rebels of Eureka* (2013).** The women of Eureka; winner of the Stella Prize.
- **Larissa Behrendt, *Finding Eliza: Power and Colonial Storytelling* (2016).** An Aboriginal scholar reads colonial narratives against the grain.$mn_australia_master$,
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
  select $mn_australia_quiz$[
    {"type": "mcq", "prompt": "Which people brought the case in which the High Court rejected terra nullius as a basis of Australian land law in 1992?", "options": ["Eddie Mabo and other Meriam people of Mer (Murray Island) in the Torres Strait", "The Wurundjeri and Boonwurrung elders who signed Batman's Treaty", "The Wybalenna petitioners of Flinders Island", "The Guugu Yimithirr of the Endeavour River"], "answerIndex": 0, "explanation": "Mabo v Queensland (No 2), begun in 1982 by Eddie Mabo and other Meriam people and decided on 3 June 1992, rejected the 'enlarged notion of terra nullius' and recognised native title.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the University of Newcastle's Colonial Frontier Massacres project, led by Lyndall Ryan, record at its 2022 stage?", "options": ["About 118 Aboriginal deaths with credible evidence", "Probably no less than 100,000 Aboriginal deaths nationally", "More than 10,000 Aboriginal lives lost in at least 414 massacres of six or more people, 1788–1930", "Exactly 1,700 settler deaths and 20,000 Aboriginal deaths, a count every historian accepts"], "answerIndex": 2, "explanation": "The project counts only massacres of six or more people; its 2022 figure was more than 10,000 Aboriginal lives in at least 414 massacres. The 118 figure is Windschuttle's for Van Diemen's Land, 100,000 is Evans and Ørsted-Jensen's contested estimate, and Broome's own estimates (some 1,700 to 2,000 settlers and 17,000 to 20,000 Aboriginal people) are offered as estimates, not exact counts.", "id": "q2"},
    {"type": "mcq", "prompt": "Who was Pemulwuy?", "options": ["A Wiradjuri leader who met Governor Brisbane at Parramatta in 1824", "A Bunuba fighter in Western Australia who died in 1897", "A Nuenonne woman who guided George Augustus Robinson's missions", "A Bidjigal man of the Dharug nation who led a twelve-year guerrilla war around Sydney from 1790"], "answerIndex": 3, "explanation": "Pemulwuy led resistance around Parramatta and the Hawkesbury until he was shot dead in 1802; Governor King called him 'a brave and independent character'. The other options describe Windradyne, Jandamarra and Truganini.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened at Point McLeay (Raukkan) in South Australia in 1896?", "options": ["The Eureka oath was sworn", "More than 100 Aboriginal people, women among them, were on the electoral roll and about 70 per cent of them voted", "The first anti-Chinese riot took place", "The Commonwealth of Australia was proclaimed"], "answerIndex": 1, "explanation": "South Australia's 1894–95 women's suffrage law included Aboriginal women, and at Point McLeay more than 100 Aboriginal people, women among them, were enrolled and about 70 per cent voted in 1896.", "id": "q4"},
    {"type": "open", "prompt": "Was terra nullius the basis of the British claim to Australia in 1788, or a later legal rationalisation? Use the evidence and historians discussed in the chapter.", "rubric": "A strong answer notes that the term was not used in the eighteenth century; sets out the disagreement between Frost and Attwood (the concept was widely accepted) and Borch (a nineteenth-century legal theory), with Banner dating its first known legal use to the 1819 'desert and uninhabited' advice; uses later evidence such as Bourke's 1835 voiding of Batman's Treaty and Cooper v Stuart (1889); notes Cook's instructions to act 'with the Consent of the Natives'; and explains that Mabo (1992), brought by Meriam plaintiffs, rejected terra nullius as a basis of land law but not of British sovereignty.", "id": "q5"},
    {"type": "open", "prompt": "How far does James Belich's idea of a 'settler revolution' help to explain Australia's history between 1788 and 1901, and what does it leave out?", "rubric": "A strong answer paraphrases Belich's argument as reviewers summarise it (explosive settlement from about 1800, boom, bust and rescue by staple exports, closer ties to Britain, one Anglo-world including the American West); applies it to Australian evidence such as squatting and wool, the gold rushes (population from 430,000 in 1851 to 1.7 million in 1871) and the 1890s depression; mentions criticism such as Etherington's doubts about its neglect of export profits; and asks what a settler-centred model omits, such as Aboriginal and Torres Strait Islander resistance and dispossession, Chinese and Pacific Islander workers, and the racial exclusions of White Australia.", "id": "q6"}
  ]$mn_australia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/oceania-and-the-pacific/the-settler-revolution-at-the-edge-of-empire-australia-1770-1901', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
