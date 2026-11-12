-- Cryo-History: Histories of Cold Places — canonical master article, co-written and human-reviewed.
-- history/thematic-history/cryo-history-histories-of-cold-places @ research/advanced/read.
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
    'history/thematic-history/cryo-history-histories-of-cold-places',
    'research',
    'advanced',
    'read',
    $mn_cryo_master$> **The past read from ice, and from the people who live with it.** Cold places are often told as empty stages for heroic explorers. This chapter treats them instead as homelands and as archives. It follows the Thule ancestors of the Inuit, the Greenland Norse, the Sámi and the peoples of Siberia; the "cold rush" for whales, seals and furs; explorers who borrowed Inuit knowledge and often wrote Inuit out of the story; ice cores that record volcanoes and Roman lead; the cold chain; the claims and treaties over Antarctica and the Arctic; and the melt of glaciers and permafrost, from the Andes and the Himalaya to Greenland, as one of the great historical events of our time.

## Reading the Cold

"Cryosphere" joins the Greek *kryos* ("cold, frost, ice") and *sphaira* ("globe"). About 70% of the world's fresh water is frozen in Antarctica; melted, it would raise sea level by almost 60 m. Permafrost underlies around 15% of the exposed land of the Northern Hemisphere.

Historians long treated these places as edges, interesting chiefly when Europeans tried to cross them. Recent scholarship has turned that view around. Julie Cruikshank's *Do Glaciers Listen?* (2005) set Tlingit and Athapaskan oral histories of the Mount Saint Elias region, at the end of the Little Ice Age, beside the measurements of explorers. In the oral histories glaciers are sentient beings that respond to human behaviour; in the explorers' accounts they are objects to be surveyed. Cruikshank's point was that "local knowledge" is itself history. Bathsheba Demuth's *Floating Coast* (2019) wrote the environmental history of the Bering Strait across its Russian and American shores, and Adrian Howkins's *The Polar Regions* (2016) compared the Arctic and Antarctica from early exploration to the present. The chapter on Environmental History introduces the wider field these books belong to.

## The First Northern Histories

The deep history of the Arctic is Indigenous. The Thule people, ancestors of all modern Inuit, developed in coastal Alaska by about 1000 CE. They brought kayaks, large skin boats called umiaks, dog sleds and cooperative open-sea whaling; the whaleboat captain, the *umialik*, is still a prominent figure in Alaskan Arctic communities. The Thule spread east across northern Canada and reached Greenland by the thirteenth century. There they met the older Dorset culture, whom Inuit call the *Tuniit*; by the fifteenth century the Thule had replaced them.

Greenland also had European settlers. As the chapters on Early Medieval Europe and North America before Columbus describe, Norse colonists reached Greenland in the late tenth century. Settlers from Iceland led by Erik the Red founded farms after 986 CE; at their height they numbered between 2,000 and 10,000, with recent estimates trending lower. They exported the goods of the cold: walrus ivory, narwhal tusks, polar bear and seal skins, much of it hunted far to the north. The Western Settlement disappeared in the mid-fourteenth century; a marriage at Hvalsey in 1408 is the last written record of the Norse in Greenland; the Eastern Settlement was gone by the mid-fifteenth century.

Why they vanished is debated. Jared Diamond, in *Collapse* (2005), blamed overgrazing, soil erosion, conflict with the Inuit and a cultural conservatism that refused to adopt Inuit ways. Other scholars, among them Jette Arneborg, disagree. Isotope and excavation evidence suggests that marine foods, mainly seal, came to supply roughly half to four-fifths of Norse Greenlanders' diet in the later centuries of settlement, so "refused to adapt" is contested. The alternative picture is planned emigration: walrus ivory lost value as Russian walrus and African elephant ivory reached Europe, trading ships stopped coming, the climate cooled, and plague freed land in Iceland and Norway. Inuit kept their own memory of the Norse in three stories published by Hinrich Rink in 1866–71. In 1721 Denmark–Norway sent the missionary Hans Egede to re-Christianise the Norse. He found none, missionised the Inuit instead, and so began Danish colonisation.

## Sápmi and Siberia

The Sámi are the Indigenous people of Sápmi, spanning northern Norway, Sweden, Finland and Russia's Kola Peninsula. Reindeer herding is their best-known livelihood, though by 2007 only about 10% of Sámi were connected to it. Around 1720 the missionary Thomas von Westen burned or confiscated drums and sacred objects in Norway; of the thousands of Sámi drums that once existed, only about 70 are known to survive. After the Kautokeino rebellion of 1852, the skulls of its two executed leaders were taken for research and reburied only in 1997. Norwegianization suppressed Sámi languages for about a century from the 1850s. The Alta dam controversy of the late 1970s and early 1980s rallied a Sámi rights movement, and the Sámi Parliament of Norway opened at Karasjok in 1989. In 2023 a Norwegian truth commission reported that Norwegianization had been wider and more intrusive than previously known.

In Siberia the Russian state advanced through fur tribute, as the chapter on Russia from Muscovy to Catherine the Great describes. In the far north-east the Chukchi, both Maritime sea-mammal hunters and Reindeer herders, fought wars of conquest from 1701. Major Dmitry Pavlutsky's notoriously brutal campaigns ended with his death in 1747, and in 1764 Russia abandoned its Anadyr fort, which had cost about 1,380,000 rubles against 29,150 in taxes. The Nenets, a Samoyedic people numbering just under 50,000 at Russia's 2021 census, developed large-scale reindeer herding in the eighteenth century; oil and gas development in the Yamalo-Nenets region now threatens it.

## The Cold Rush

From the sixteenth century the polar seas became a frontier of extraction. Basque whalers worked Labrador from the second quarter of the century, the English opened Spitsbergen whaling in 1611–13, and rival European fleets fought over the grounds until 1638. In the Bering Strait the boom was fierce: after Thomas Welcome Roys returned with a big catch of bowheads in 1848, over 2,000 whales were taken in 1850 and more than 2,600 in 1852; catches then fell and the fleet moved on to the Sea of Okhotsk, though Bering Strait whaling went on into the early twentieth century, a story at the heart of Demuth's book.

The twentieth century industrialised the slaughter. Antarctic shore whaling began on South Georgia in 1904; by 1930/31, 41 factory ships took over 37,000 whales in a season. A 2014 study estimated that at least 2.9 million large whales were killed in the twentieth century, a lower bound that corrects Soviet catches for illegal under-reporting. The International Whaling Commission, created in 1946, imposed a moratorium on commercial whaling from 1986, while Alaska Natives continue subsistence whaling under its aboriginal provisions.

Seals and sea otters followed. English sealers brought back as many as 40,000 skins from South Georgia and the Magellan Strait in 1778, in a trade that over the following decades drove fur seals close to extinction. In the North Pacific, Russian *promyshlenniki* forced Aleut (Unangan) hunters into the sea-otter trade, which brought the otter near extinction. When the United States bought Alaska in 1867 for \$7.2 million, only about 10,500 of its roughly 60,000 inhabitants were under the Russian company at all.

```checkpoint
q: What does recent research suggest about the end of the Norse settlements in Greenland?
a*: That falling ivory prices, ending trade, cooling and land freed in plague-hit Iceland and Norway may have encouraged planned emigration.
a: That the Norse died out because they refused to eat seal or learn from the Inuit.
x: Isotope and excavation evidence suggests seal and other marine foods came to supply roughly half to four-fifths of their diet, so "refused to adapt" is contested.
a: That they survived until Hans Egede found them in 1721.
x: Egede found no Norse and missionised the Inuit instead.
a: That the Thule people arrived only after the Norse had left.
x: The Thule moved into Greenland from around 1200, while the Norse were still there.
hint: Think about what the Norse were exporting, and who stopped buying it.
why: The revised view treats the Greenland Norse as adaptable people responding to changing markets and climate, against Jared Diamond's picture of collapse through conservatism.
---
q: Why did Russia abandon its fort at Anadyr in 1764?
a: Because the Chukchi had accepted Russian rule peacefully.
x: The Chukchi fought wars of conquest from 1701 and Pavlutsky's campaigns were notoriously brutal.
a: Because whalers had exhausted the local bowhead population.
x: The Bering Strait whaling boom began in 1848, long after 1764.
a*: Because it had cost about 1,380,000 rubles while bringing in only 29,150 in taxes.
a: Because it had been sold to the United States.
x: Alaska, not Chukotka, was sold to the United States, and only in 1867.
hint: Compare what the fort cost with what it collected.
why: Chukchi resistance made conquest ruinously expensive, a reminder that cold peoples could set limits on empires.
```

## Explorers and the People Who Already Lived There

In 1845 Sir John Franklin sailed with HMS *Erebus* and HMS *Terror* and 129 men to complete the Northwest Passage. The ships were beset off King William Island from 1846; Franklin died in June 1847; a note dated 25 April 1848 recorded that the 105 survivors had abandoned the ships three days earlier. No one survived. Starvation, scurvy, cold and lead poisoning have all been proposed; the lead hypothesis remains debated.

Inuit knew the expedition's fate first. In 1854 John Rae of the Hudson's Bay Company, told by Inuit of white men who had starved near the Back River, reported evidence of cannibalism. Lady Jane Franklin enlisted Charles Dickens, who in *Household Words* called the Inuit "covetous, treacherous, and cruel" and their testimony unreliable. Cut marks found later on bones supported Rae and the Inuit. In the 1860s Charles Francis Hall, guided by Ipirvik and Taqulittuq, gathered extensive Inuit testimony, and the Inuk historian Louie Kamookak spent years collecting oral histories. When Parks Canada found the wreck of *Erebus* on 2 September 2014, the find was hailed as corroborating Inuit testimony. *Terror* was found in 2016 after the Inuk hunter Sammy Kogvik recalled seeing a mast in the ice; Kamookak said Parks Canada had ignored local stories about it.

Roald Amundsen learned the lesson the Admiralty had not. Wintering at what is now Gjoa Haven during the first transit of the Northwest Passage (1903–06), he learned from Netsilik Inuit to use sled dogs and wear animal skins, which he found invaluable at the South Pole. His party of five reached the pole on 14 December 1911, killing dogs for food along the way at a camp they called the Butchers' Shop. Robert Falcon Scott's party of five, man-hauling on the plateau, arrived 34 days later. All five died on the return.

{{image: Roald Amundsen | Roald Amundsen, who learned to use sled dogs and skin clothing from Netsilik Inuit.}}

```quote
I am just going outside and may be some time.
Lawrence Oates · as recorded in Scott's diary · March 1912
```

Britain made Scott's death heroic, as Francis Spufford's *I May Be Some Time* (1996) shows. Historians still argue: Roland Huntford's *Scott and Amundsen* (1979) blamed Scott's leadership, while Susan Solomon's scientific analysis stressed the weather that defeated him. Ernest Shackleton's *Endurance* sank in the Weddell Sea in 1915; Shackleton and five others sailed a small boat about 800 miles to South Georgia, and the Chilean Navy tug *Yelcho* under Luis Pardo rescued the men left on Elephant Island in August 1916. (The famous advertisement for "men wanted for hazardous journey" is generally regarded as apocryphal.)

The North Pole was murkier. Frederick Cook's claim was judged unproven. Robert Peary claimed the pole in April 1909 with the African American explorer Matthew Henson and four Inuit, Ootah, Egingwah, Seegloo and Ooqueah. Wally Herbert's reassessment in *The Noose of Laurels* (1989) concluded that Peary probably did not reach it, though he may have come within about 60 miles. If the claims of Cook, Peary and Byrd are rejected, the first verified arrival was the airship *Norge*, carrying Amundsen and others, on 12 May 1926. Peary also removed the Cape York meteorite, which Inuit had used as a source of iron, and in 1897 brought six Inughuit to New York, where most died of tuberculosis; the American Museum of Natural History faked the burial of one, Qisuk, and displayed his skeleton. It returned to Greenland only in 1993.

## Colonial Cold

The twentieth-century state came north often at Indigenous expense. In 1953 Canada moved Inuit families from Inukjuak to Grise Fiord and Resolute in the High Arctic, partly to assert sovereignty. In the same year Denmark relocated about 130 Inughuit from Old Thule, beside the new US air base, to Qaanaaq; in 2003 Denmark's Supreme Court upheld compensation for the move, which the government accepted had been a serious and unlawful interference. In the 1960s and 1970s Danish doctors fitted about 4,500 Greenlandic Inuit women and girls, some as young as 12, with contraceptive coils; Prime Minister Mette Frederiksen apologised in Nuuk on 24 September 2025.

In the Soviet north, cold was part of the punishment; the chapter on The Soviet Union: History of the Soviet Empire covers the Gulag as a whole. Dalstroy mined Kolyma's gold with prison labour from 1931, and tens of thousands died; of 10,000–12,000 Poles sent to Kolyma in 1940–41, only a few hundred at most survived to be released. Norilsk's camp archives record 16,806 prisoner deaths, yet its mortality was in most periods lower than across the camp system as a whole: the coldest places were not always the deadliest.

## Ice as an Archive

Ice is also a document. Cores hold annual snow layers, isotopes recording past temperature, and bubbles of ancient air. Volcanic fallout dates them: Laki (1783) appears in Greenland ice but not Antarctic, Tambora (1815) in both. The Soviet station at Vostok yielded in the late 1990s a 420,000-year record of four glacial cycles; the European EPICA core reached about 800,000 years; and in 2025 the Beyond EPICA project reported ice at least 1.2 million years old. Its coordinator, Carlo Barbante, noted that carbon dioxide is now 50% higher than at any time in the past 800,000 years.

Ice records human activity too. In 1969 Murozumi, Chow and Patterson showed that lead in Greenland ice had risen about 200-fold since ancient times. As the chapter on What is History? notes, the same ice tracks Roman silver smelting: a 2018 study by Joseph McConnell and colleagues found emissions accelerating with Carthaginian and Roman mining in Iberia and falling with the Antonine Plague. Historians welcomed it as a new kind of evidence, though lead tracks silver mining rather than the whole economy. In 1985 British Antarctic Survey scientists reported the ozone hole, damage done by CFCs, the refrigerants in use since 1930. The Little Ice Age is now seen as regional rather than globally synchronous; the chapter on Environmental History sets out the debate between Geoffrey Parker, who ties it to the seventeenth century's crises, and Dagomar Degroot, who stresses adaptation.

## The Cold Chain

People have stored cold for millennia: a cuneiform tablet of about 1780 BCE from Mari records an ice house, Persians built the *yakhchal* pit, and in seventeenth-century India ice was brought from the Himalayas. From 1806 Frederic Tudor shipped New England ice to the tropics, reaching Calcutta in 1833 and driving out Indian competitors. Mechanical refrigeration followed, as the chapters on Food in World History and The Second Industrial Revolution describe.

The knowledge often came from the cold. Clarence Birdseye, in Labrador in 1912–15, learned from Inuit that fish frozen instantly at −40 °C tasted fresh when thawed; his quick-freezing business and patents sold in 1929 for \$22 million. Frederick McKinley Jones, a Black American inventor, designed a mobile refrigeration unit for trucks around 1938–40. Susanne Freidberg's *Fresh* (2009) shows how refrigeration remade the idea of freshness. In 2020 only an estimated 25–30 countries had the ultracold chains that some vaccines need.

## Who Owns the Cold?

Antarctica has no Indigenous people; its 1,000 to 5,000 inhabitants all live at research stations. Its politics were imperial all the same. Seven states had claims; Britain took Argentina and Chile to the International Court of Justice, and India tried to bring Antarctica before the UN in 1956 and 1958. The twelve countries active there during the International Geophysical Year signed the Antarctic Treaty on 1 December 1959. It bans military activity, nuclear tests and new claims south of 60°S, and freezes the existing claims without settling them. The Madrid Protocol (in force 1998) bans mineral-resource activity other than science. Its 2048 date is often misread as an expiry: from then any consultative party may request a review conference, but the ban does not lapse automatically.

The Arctic is inhabited and divided among states. The Arctic Council, created in 1996, includes Indigenous organisations such as the Inuit Circumpolar Council and the Saami Council as Permanent Participants; in March 2022, after Russia invaded Ukraine, the seven other member states paused participation. Cargo on Russia's Northern Sea Route rose from 3.87 million tonnes in 2012 to 37.9 million in 2024, mostly Russian exports. In 2007 Russian submersibles planted a flag on the seabed at the North Pole, and China called itself a "near-Arctic state" in 2018.

Greenland sits at the centre. A Danish colony until 1953, it gained home rule in 1979 and self-government in 2009. In 2019 Donald Trump proposed buying it; Frederiksen called it "an absurd discussion". From January 2025 he sought US control again; in early 2026 he refused to rule out force and threatened tariffs, then ruled out force and dropped the tariffs on 21 January 2026 after talks with NATO's Mark Rutte. A January 2025 poll had found 85% of Greenlanders opposed joining the United States. On 22 September 2026 the United States, Denmark and Greenland signed a security agreement expanding the US military footprint while affirming Danish sovereignty and Greenlandic self-determination.

```checkpoint
q: What is the correct reading of 2048 for the Madrid Protocol's ban on Antarctic mining?
a: The ban expires automatically in 2048.
x: This is a common misreading; the ban does not lapse automatically.
a*: From 2048 any consultative party may request a review conference, but the ban does not lapse automatically.
a: Mining becomes legal for the seven claimant states in 2048.
x: Nothing in the protocol opens mining to claimants in 2048.
a: The whole Antarctic Treaty ends in 2048.
x: The treaty has no such end date; 2048 concerns a possible review of the protocol.
hint: Distinguish a review point from an expiry date.
why: 2048 is fifty years after the protocol came into force, when a review can be requested, not when protection ends.
---
q: What happened when Parks Canada found the wreck of HMS Erebus in 2014?
a: It disproved the Inuit accounts gathered by Rae and Hall.
x: The find was widely presented as corroborating Inuit testimony.
a: It showed that Franklin's men had reached the Pacific.
x: The ship lay near King William Island, and no one survived.
a: It confirmed Dickens's view of the Inuit evidence.
x: Dickens called the Inuit "covetous, treacherous, and cruel" and dismissed their testimony; the wreck vindicated it.
a*: It was hailed as corroborating Inuit testimony, which Louie Kamookak and others had collected.
hint: Think about whose knowledge located the ship.
why: The wrecks turned a long dismissal of Inuit oral history into an acknowledgement of its accuracy.
```

## The Melt

The Arctic is warming much faster than the globe, though the multiple depends on definitions: north of 60°N, warming from 1971 to 2019 was about three times the global rate, and Rantanen and colleagues (2022) found that inside the Arctic Circle it has been nearly four times as fast since 1979. Arctic sea ice reached its record minimum of about 3.4 million km² on 16 September 2012, a record that still stands. The US National Snow and Ice Data Center put the 2026 minimum at about 4.60 million km² on 12 September, tied for tenth lowest, and the twenty years from 2007 to 2026 are the twenty lowest minima on record. As the centre's Walt Meier put it: "We've plateaued, but we're still low relative to the earlier part of the record."

Permafrost holds about twice as much carbon as the atmosphere, and its thaw undermines northern towns: in 2020 a fuel tank at Norilsk collapsed on thawing ground. Around 1.4 billion people depend on the five main Himalayan rivers. Peru holds about 70% of the world's tropical glaciers and lost 29% of its glacier area between 2000 and 2016. Meltwater lakes can burst: on 13 December 1941 Lake Palcacocha destroyed much of Huaraz, killing, on estimates that vary widely, from about 1,800 to several thousand people. Mark Carey's *In the Shadow of Melting Glaciers* (2010) shows how Andean people, engineers and the state lived with such hazards. In 2025 a German court dismissed the Huaraz farmer Saúl Luciano Lliuya's claim against the utility RWE, but accepted in principle that a major emitter can be liable for climate harm abroad. In 2005 the Inuk leader Sheila Watt-Cloutier and 62 Inuit hunters and elders petitioned the Inter-American Commission on Human Rights, framing climate change as a human-rights issue: the "right to be cold".

The melt also opens archives. Ötzi the Iceman emerged from Alpine ice in 1991; ice-patch archaeologists recover arrows and textiles in the Yukon and Norway; the chapter on The Inca Empire describes the frozen children of Llullaillaco. In 1997 permafrost at Brevig Mission, an Iñupiat village in Alaska that lost 72 of its roughly 80 people in 1918, yielded the samples that let scientists sequence the 1918 influenza virus. The cold kept the past, and the peoples of cold places kept its memory.

## Further exploration

- **Bathsheba Demuth, *Floating Coast: An Environmental History of the Bering Strait* (2019).** The Russian and North American Arctic around the Bering Strait, told as environmental history.
- **Julie Cruikshank, *Do Glaciers Listen? Local Knowledge, Colonial Encounters, and Social Imagination* (2005).** Tlingit and Athapaskan oral histories of glaciers set against explorers' science.
- **Sheila Watt-Cloutier, *The Right to Be Cold* (2015).** An Inuk leader's memoir of contaminants, climate change and Inuit rights.
- **Mark Carey, *In the Shadow of Melting Glaciers: Climate Change and Andean Society* (2010).** Peru's Cordillera Blanca and how people lived with glacial hazards after 1941.
- **Adrian Howkins, *The Polar Regions: An Environmental History* (2016).** The Arctic and Antarctica compared, from early exploration to the present.
- **Francis Spufford, *I May Be Some Time: Ice and the English Imagination* (1996).** Why Britain made polar death heroic.
- **Susanne Freidberg, *Fresh: A Perishable History* (2009).** How refrigeration made the modern idea of freshness.$mn_cryo_master$,
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
  select $mn_cryo_quiz$[
    {"type": "mcq", "prompt": "From whom did Roald Amundsen learn to use sled dogs and wear animal skins, methods he later found invaluable at the South Pole?", "options": ["Netsilik Inuit, while wintering at what is now Gjoa Haven during his 1903–06 Northwest Passage voyage", "Sámi herders in northern Norway", "Chukchi hunters in Siberia", "Robert Falcon Scott's Terra Nova party"], "answerIndex": 0, "explanation": "During the first transit of the Northwest Passage (1903–06) Amundsen wintered at today's Gjoa Haven and learned these methods from Netsilik Inuit; his polar party wore clothing modelled on Netsilik garments.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Charles Dickens describe the Inuit whose testimony John Rae reported in 1854 about the fate of Franklin's men?", "options": ["As \"honest witnesses\" to be trusted", "As subjects for the Admiralty alone", "As \"covetous, treacherous, and cruel\"", "As \"an awful place\""], "answerIndex": 2, "explanation": "Writing in Household Words, Dickens called the Inuit \"covetous, treacherous, and cruel\" and dismissed their testimony. Cut marks on bones later supported Rae and the Inuit, and the wrecks of Erebus (2014) and Terror (2016) were found where Inuit accounts pointed.", "id": "q2"},
    {"type": "mcq", "prompt": "How fast has the Arctic warmed compared with the globe, according to the figures in this chapter?", "options": ["Exactly as fast as the global average", "About three times as fast north of 60°N from 1971 to 2019, and nearly four times as fast inside the Arctic Circle since 1979 (Rantanen and colleagues, 2022)", "Ten times as fast everywhere north of the Arctic Circle since 1900", "More slowly, because sea ice reflects sunlight"], "answerIndex": 1, "explanation": "The multiple depends on how the Arctic is defined and the period chosen: about three times for the region north of 60°N (1971–2019), nearly four times inside the Arctic Circle since 1979.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened at Huaraz, Peru, on 13 December 1941?", "options": ["Peru signed the Antarctic Treaty there", "The Chacaltaya glacier disappeared", "A German court heard a climate case there", "Lake Palcacocha burst and destroyed much of the city, killing from about 1,800 to several thousand people"], "answerIndex": 3, "explanation": "The glacial lake outburst flood from Lake Palcacocha devastated Huaraz; estimates of the dead range from about 1,800 to several thousand. Mark Carey's In the Shadow of Melting Glaciers begins its history of the Cordillera Blanca there.", "id": "q4"},
    {"type": "open", "prompt": "Compare Jared Diamond's explanation of why the Norse settlements in Greenland disappeared with the revised view described in this chapter. Which evidence supports the revision?", "rubric": "A strong answer sets out Diamond's argument in Collapse (2005): overgrazing, soil erosion, conflict with the Inuit and a cultural conservatism that refused to adopt Inuit ways. It then gives the revised view (associated with Jette Arneborg and others): planned emigration as walrus ivory lost value against Russian walrus and African elephant ivory, trade ships stopped coming, the climate cooled, and plague freed land in Iceland and Norway. It cites the isotope and excavation evidence that seal and other marine foods came to supply roughly half to four-fifths of the Norse diet, which makes \"refused to adapt\" hard to sustain. Credit answers that note the last written record (a marriage at Hvalsey in 1408), the Thule arrival from around 1200, or Inuit stories of the Norse published by Rink.", "id": "q5"},
    {"type": "open", "prompt": "\"Explorers borrowed Indigenous knowledge and erased it from the story.\" Assess this claim using at least two examples from the chapter.", "rubric": "Good answers use specific cases: Amundsen's dogs and skin clothing learned from Netsilik Inuit; Birdseye's quick-freezing learned from Inuit in Labrador; Peary's reliance on Inuit sledgers (Ootah, Egingwah, Seegloo, Ooqueah) and his removal of the Cape York meteorite and of six Inughuit to New York; Dickens's dismissal of Inuit testimony on Franklin, later vindicated by cut marks on bones, Hall's and Kamookak's collected testimony, and the finding of Erebus (2014) and Terror (2016). Strong answers also weigh the other side, for example that Amundsen openly adopted Netsilik methods and found them invaluable, or that historians such as Cruikshank now treat oral history as evidence, and may mention the Scott–Amundsen debate (Huntford versus Solomon).", "id": "q6"}
  ]$mn_cryo_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/cryo-history-histories-of-cold-places', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
