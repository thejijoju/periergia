-- Pacific Voyagers: the Settlement of Oceania — canonical master article, co-written and human-reviewed.
-- history/regional-histories/oceania-and-the-pacific/pacific-voyagers-the-settlement-of-oceania @ research/advanced/read.
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
    'history/regional-histories/oceania-and-the-pacific/pacific-voyagers-the-settlement-of-oceania',
    'research',
    'advanced',
    'read',
    $mn_pacific_master$> **The greatest feat of seafaring before modern times.** Over roughly three thousand years, people sailing double-hulled and outrigger canoes, and finding their way by stars, swells and birds, settled the islands of Remote Oceania, from Micronesia to the far corners of the Polynesian Triangle. This chapter follows them from the first crossings to Near Oceania, through the Lapita voyagers, to the late settlement of Hawaiʻi, Rapa Nui and Aotearoa New Zealand. It weighs the evidence for contact with South America, Tongan and Hawaiian chiefly power, the debate over Rapa Nui's supposed "ecocide", the arrival of Europeans, and the modern revival of navigation aboard *Hōkūleʻa*, guided by the Micronesian master navigator Mau Piailug.

## A Sea of Islands

In 1993 the Tongan and Fijian anthropologist **Epeli Hauʻofa**, who taught at the University of the South Pacific in Suva, published an essay called "Our Sea of Islands". He contrasted the belittling colonial view of "islands in a far sea" with Oceania as "a sea of islands", whose peoples were connected rather than separated by the water. The settlement of the Pacific, this chapter argues with him, was the work of skilled, deliberate navigators, not of lucky accidents.

In 1973 Andrew Pawley and Roger Green proposed replacing Dumont d'Urville's nineteenth-century labels, Melanesia, Micronesia and Polynesia, with a division based on settlement. **Near Oceania** means New Guinea, the Bismarck Archipelago and the Solomon Islands (except the Santa Cruz group). **Remote Oceania** means everything beyond: Santa Cruz, Vanuatu, Fiji and New Caledonia, together with all of Polynesia and Micronesia. The line between them is also a line in time.

## The First Crossings

During the Ice Ages low seas joined New Guinea, Tasmania and Australia into a continent called **Sahul**, but the islands of Wallacea remained an island world, so the first people to reach Sahul had to cross open water, as the chapter on human origins and the peopling of the earth describes. People settled Sahul and Near Oceania most likely between about 60,000 and 40,000 years ago, though some researchers argue for earlier dates.

The Bismarcks and the Solomons were never joined to Sahul, so reaching them also meant voyaging. At **Kilu Cave** on Buka Island, the earliest known site in the Solomon Islands chain, people lived from about 29,000 years ago; getting there from Nissan Island meant crossing at least 60 kilometres of open sea. The archaeologist Matthew Spriggs suggested that the settlement of Manus, in the Admiralty Islands, "may represent a real threshold in voyaging ability": it required a blind crossing of some 60 to 90 kilometres, out of sight of land.

## Austronesians and the Lapita Voyagers

The settlers of Remote Oceania came from a much later movement. The Austronesian expansion began from Taiwan around 5,000 years ago, part of the spread of farming peoples discussed in the chapter on the Neolithic Revolution. Austronesian seafarers developed the double canoe, the outrigger, planked hulls lashed together, and the **crab-claw sail**, developed by at least 2000 BCE. By one reckoning, voyagers sailing east from the Philippines settled the Mariana Islands in Micronesia around 1500 BCE.

Further south, archaeologists trace the advance by a pottery decorated with tooth-like stamped patterns, which they call **Lapita**, after a site in New Caledonia excavated in 1952. Classic Lapita pottery appears in the Bismarck Archipelago between about 1600 and 1200 BCE, suddenly and fully formed, with no earlier stages. Most specialists read this, following Roger Green and Peter Bellwood, as the arrival of migrants rather than a local development, a view known as the "Triple-I" model (intrusion, innovation, integration). Jim Allen and J. Peter White argued in the 1980s and 1990s that it developed locally.

Between about 1300 and 900 BCE, Lapita voyagers spread thousands of kilometres east (some 4,500 in a straight line), through the Solomons, Vanuatu and New Caledonia to Fiji, Tonga and Samoa. Tonga was reached by about 900 BCE. They were the first people to settle the islands beyond the Solomons. Ancient DNA from Lapita skeletons in Vanuatu and Tonga shows descent from Neolithic peoples of Taiwan and the northern Philippines; the Papuan ancestry seen in many Pacific peoples today came with later movements. Lapita settlers brought pigs, dogs and chickens and crops such as taro, yams and breadfruit, and traded obsidian and shells over long distances.

## Canoes, Stars and Swells

The voyagers sailed outrigger canoes and double-hulled canoes, two hulls lashed side by side with a platform between them for people, food and gear; large Tongan *kalia* could carry up to a hundred people. There is no evidence that Polynesian navigators carried instruments. Instead they read the environment. A navigator memorised the rising and setting points of a sequence of stars for each route; some star compass systems name as many as 150 stars, though most have a few dozen. They read the long ocean swells, more reliable than local wind waves. They watched birds such as white terns and noddies, which fly out to fish in the morning and return to land at night, and clouds, which can reflect the green of a lagoon. Marshall Islanders made **stick charts** of coconut-frond ribs and shells that mapped how islands disrupted the swells, studied on shore rather than carried at sea. All this knowledge passed orally from master to apprentice, often in song.

```checkpoint
q: Why does the Pleistocene settlement of Manus, in the Admiralty Islands, matter to historians of voyaging?
a*: It required a blind crossing of some 60 to 90 kilometres out of sight of land, which Matthew Spriggs suggested "may represent a real threshold in voyaging ability".
a: It was the first island reached by Lapita potters from Taiwan.
x: Manus was settled in the Pleistocene, tens of thousands of years before the Lapita expansion began.
a: It was joined to Australia by dry land during the Ice Ages.
x: Only New Guinea, Tasmania and Australia were joined as Sahul; islands beyond had to be reached by sea.
a: It is where the crab-claw sail was invented.
x: The crab-claw sail is an Austronesian development of much later date, by about 2000 BCE.
hint: Think about whether the voyagers could see their destination.
why: Manus shows that people in Near Oceania were making deliberate open-sea crossings long before the Austronesian expansion.
---
q: What was the Lapita culture?
a: A Micronesian kingdom centred on the island of Pohnpei.
x: Pohnpei's Nan Madol was built much later, from around 1180 CE, and is not Lapita.
a: A culture of South American raft-sailors who settled Polynesia from the east.
x: That was Thor Heyerdahl's theory, which the evidence overwhelmingly rejects; Lapita origins lie to the west.
a*: A seafaring Austronesian culture, known by its stamped pottery, whose voyagers were the first to settle the islands from Vanuatu to Tonga and Samoa.
a: The first people to settle Sahul, about 60,000 years ago.
x: Sahul was settled tens of thousands of years before Lapita, which appears around 1600 BCE.
hint: Think of pottery and the islands from Vanuatu to Samoa.
why: Lapita voyagers, descended from peoples of Taiwan and the northern Philippines, were the first settlers of the islands beyond the Solomons.
```

## The Long Pause and the Short Chronology

Having reached Fiji, Tonga and Samoa by about 900 BCE, the eastward movement stopped. The so-called "long pause" between the settlement of West and East Polynesia lasted well over a thousand years, nearly two thousand on the short chronology described below. Nobody knows why.

An older "long chronology", still found in many books, had East Polynesia settled from about 700 CE, Hawaiʻi by 900, Rapa Nui by 1000 and New Zealand by 1200. In 2011 Janet Wilmshurst, Terry Hunt, Carl Lipo and Atholl Anderson re-examined 1,434 radiocarbon dates from across East Polynesia and kept only the most reliable, from short-lived materials. They concluded that East Polynesia was settled first in the Society Islands at about **1025–1120 CE**, some four centuries later than previously assumed. After a gap, settlement spread "in one major pulse to all remaining islands" at about **1190–1290 CE**. Mulrooney and colleagues criticised the study, defending longer chronologies based on a broader range of dates, and the authors replied. The short chronology is now widely accepted, but contested. If it is right, the voyagers reached almost all of East Polynesia within a few centuries of first arriving in the Society Islands.

Some voyages ran back west, founding Polynesian-speaking "outliers" such as Tikopia in the Solomons. Scientists track such movements partly through the Pacific rat, which cannot swim long distances; the Otago molecular anthropologist Lisa Matisoo-Smith used its DNA to model human colonisation.

## Hawaiʻi, Rapa Nui and Aotearoa

The three corners of the "Polynesian Triangle", Hawaiʻi, Rapa Nui and New Zealand, were all settled late. For **Hawaiʻi**, early estimates as far back as 300 CE are now generally rejected; one recent survey of radiocarbon dates puts arrival at about 940–1130, while Wilmshurst and her colleagues place Hawaiʻi in the great pulse of about 1190–1290.

For **Rapa Nui** (Easter Island), estimates have ranged from 400 to 1300 CE; the current best estimate is the twelfth century, and Hunt and Lipo's dates from Anakena imply arrival around 1200. The settlers probably came from Mangareva, some 2,600 kilometres away, or the Marquesas.

**Aotearoa New Zealand** was settled last. No human remains or artefacts are confidently older than a layer of volcanic ash from an eruption of Mount Tarawera around 1314, and genetic studies of Māori suggest first settlement around 1250–1300, with the main settlement in the decades after. At **Wairau Bar** (Te Pokohiwi), one of the earliest sites, moa eggshell dates occupation to 1288–1300. DNA and isotope studies by Matisoo-Smith and Michael Knapp showed that some of those buried there had grown up in East Polynesia, and that they formed a reasonably large group: a planned migration, not a canoe of castaways. An older European synthesis of Māori traditions, with a single "great fleet" arriving around 1350, is now increasingly treated as myth. The settlers hunted the moa to extinction within about a century and a half of arrival and cleared about 40 per cent of the forest.

## The Sweet Potato and South America

The sweet potato is native to the Americas, yet it was growing in Polynesia long before Columbus. The earliest archaeological evidence is carbonised fragments from Mangaia in the Cook Islands, dated to 988–1155 CE, so it was being grown in central Polynesia by about 1000–1200 CE, and from there it spread to Rapa Nui, Hawaiʻi and New Zealand. It is an exception to the post-1492 spread traced in the chapter on the Columbian exchange. Even the name travelled: Proto-Polynesian *kumala* (Māori *kūmara*) resembles the Quechua and Aymara *k'umar*. The linguists Willem Adelaar and Pieter Muysken call the similarity "near proof of incidental contact between inhabitants of the Andean region and the South Pacific". A 2018 study argued that the plant arrived naturally, carried by birds or floating seeds, but critics found flaws in its method, and the consensus favours human contact.

In 2020 a genetic study led by Alexander Ioannidis found Native American ancestry in several East Polynesian populations, from the Marquesas to Rapa Nui, traced to a single contact around **1150–1230 CE** and most closely matching Indigenous peoples of present-day Colombia, the Zenú. A 2024 study of ancient Rapanui genomes found about 10 per cent Native American ancestry from mixing around 1250–1430, without settling where the meeting happened. The authors of the 2020 study allowed that Polynesians may have sailed to South America and come home, and several outside scholars thought a meeting in South America more likely. Either way, this was a small, late contact, not evidence that South Americans first peopled Polynesia.

## Chiefdoms, Kingdoms and Stone

The archaeologist Patrick Kirch argues that the ancestral Polynesian societies were chiefdoms; his *The Evolution of the Polynesian Chiefdoms* (1984) is a standard account. In Tonga, the **Tuʻi Tonga** line, centred at Muʻa on Tongatapu, built a far-reaching maritime chiefdom whose power is said to have been at its height in the thirteenth century, with influence lasting into the sixteenth. The Tongan scholar ʻOkusitino Mahina has discussed the oral traditions of this period. Archaeology and linguistics confirm Tongan influence from ʻUvea and Rotuma to Samoa and Niue, and tributary chiefdoms brought annual offerings, the *ʻinasi*, to Muʻa after the harvest. "Maritime chiefdom" is the term some academics prefer; others call it an empire, and the label is still debated. Samoans, led by the forebears of the Malietoa family, later expelled the Tongans. Tongans also raised the Haʻamonga ʻa Maui, a five-metre trilithon of coral-limestone slabs.

In **Hawaiʻi**, Kirch argues in *How Chiefs Became Kings* (2010) that chiefs had been replaced before European contact by divine kings ruling what he calls archaic states. In Micronesia, on Pohnpei, work began around 1180 CE on **Nan Madol**, a megalithic complex built of basalt "logs", and on Kosrae the comparable centre of Leluh followed.

## Rapa Nui and the "Ecocide" Debate

Rapa Nui is famous for its *moai*, the great stone figures carved between about 1100 and 1680 CE. Some 887 have been counted, nearly half still at Rano Raraku, the quarry.

In *Collapse* (2005), Jared Diamond, drawing on earlier collapse interpretations, from Thor Heyerdahl and William Mulloy to the palaeoecologists John Flenley and Paul Bahn, made Rapa Nui a parable of self-inflicted ruin: islanders cut down their forests to move statues, their population outgrew the land, and society collapsed into war before Europeans arrived. Barbara A. West put the pre-collapse peak at about 15,000 people, against 2,000 to 3,000 at contact in 1722.

Recent research has largely turned against this story. Terry Hunt and Carl Lipo argue that settlement was late, that the Pacific rat was a major cause of deforestation, and that the population grew until European contact. Douglas Owsley's skeletal study of 1994 found that few deaths were directly caused by violence. Mulrooney and colleagues concluded in 2010 that "there is no conclusive evidence for the proposed precontact collapse", and in 2021 DiNapoli and Lipo found steady growth to 1722, with the island never holding more than a few thousand people. The 2024 ancient-DNA study found no sign of a seventeenth-century population crash, and a 2025 sediment-core study found a megadrought from about 1550 that coincided with cultural change but did not support an abrupt collapse.

The real catastrophe came from outside. When Jacob Roggeveen landed on Easter Sunday 1722, his men killed ten or twelve islanders. In December 1862 Peruvian slave raiders began seizing people: some 1,400 to 1,500 were taken, about half the population. About a dozen returned, bringing smallpox. By 1877 only 111 Rapa Nui remained on the island. Chile annexed it in 1888, turned it into a sheep ranch and confined the islanders to Hanga Roa; they gained Chilean citizenship only in 1966.

```checkpoint
q: What does the revised "short chronology" of Wilmshurst, Hunt, Lipo and Anderson (2011) say about the settlement of East Polynesia?
a: That East Polynesia was settled from about 700 CE and New Zealand by 1200.
x: That is the older "long chronology", which the 2011 study argued was too early.
a*: That the Society Islands were settled about 1025–1120 CE, and the remaining islands in one rapid pulse about 1190–1290 CE.
a: That Rapa Nui was settled from South America before any Polynesian arrived.
x: All the evidence points to a western, Austronesian origin; South American contact came later and was small.
a: That all of Polynesia was settled within a century of the Lapita arrival in Tonga.
x: A "long pause" of well over a thousand years separated the settlement of West and East Polynesia.
hint: The study used only the most reliable, short-lived radiocarbon samples.
why: By discarding less reliable dates, the study made East Polynesian settlement later and faster than once thought, though critics contest its method.
---
q: What does recent research suggest about the decline of Rapa Nui's population?
a: That it collapsed in the seventeenth century through deforestation and warfare.
x: Several studies, including ancient DNA published in 2024, found no evidence of a pre-contact collapse.
a: That a megadrought from about 1550 caused an abrupt collapse of society.
x: A 2025 sediment-core study found the drought but said the evidence does not support an abrupt pre-contact collapse.
a: That the population was never larger than 111 people.
x: 111 is the number left by 1877, after the slave raids and disease.
a*: That the population grew until European contact, and the catastrophe came with disease and the Peruvian slave raids of 1862–63.
hint: Look at what happened after 1862.
why: The "ecocide" parable blamed the islanders; the evidence points to the effects of outside violence and epidemic.
```

## Europeans Enter the Pacific

**Ferdinand Magellan**'s fleet crossed the Pacific in 98 days, as the chapter on European expansion overseas describes, and reached Guam on 6 March 1521, the first known European contact in Micronesia. The Chamorro came out to meet them in fast outrigger *proas*; after a confrontation, Magellan's men burned 40 to 50 houses and killed seven men. Later visitors brought similar violence: on Álvaro de Mendaña's voyage of 1595 about 200 Marquesans were killed in two weeks, by Queirós's estimate.

On the first of **James Cook**'s three voyages (1768–1779), in the Society Islands in July 1769, he took aboard **Tupaia**, a navigator and priest of Raʻiātea trained in the schools of learning at the Taputapuatea marae. Tupaia helped draw a chart naming 74 islands; Lars Eckstein and Anja Schwarz argue that it maps voyaging routes across nearly the whole Polynesian Triangle in a system he invented to translate wayfinding into the logic of Cook's compass. In New Zealand some Māori welcomed him as a *tohunga*, an expert, and through him Cook could speak with Māori. Tupaia died at Batavia in 1770; when Cook returned in 1773, Māori called out for him by name. In 1778 Cook reached Hawaiʻi.

Cook was killed at Kealakekua Bay in February 1779. Whether Hawaiians had taken him for the god Lono has been fiercely argued. Marshall Sahlins said they had; Gananath Obeyesekere replied in *The Apotheosis of Captain Cook: European Mythmaking in the Pacific* (1992) that the deification was itself a European myth. The Native Hawaiian population, perhaps about 300,000 before 1778 by one estimate, fell to under 40,000 by 1900, and the Māori population fell by more than half, from perhaps 100,000 in 1769 to about 42,000 in 1896. The chapters on the British Empire and on imperial expansion and resistance follow what came next in New Zealand.

## Drift or Design?

How had the islands been found at all? Cook himself leaned towards accident: after meeting Tahitians blown to Atiu, he thought such storms explained "how the South Seas, may have been peopled". In 1956 the New Zealand historian **Andrew Sharp** argued in *Ancient Voyagers in the Pacific* that islands more than about 300 miles from their neighbours were settled only by accidental drift, not deliberate navigation. Critics pointed out that every drifting canoe would also have needed fertile couples, crop plants, pigs, dogs and chickens, and computer simulations in the 1970s found settlement by drift alone extremely unlikely.

A different challenge came from the Norwegian **Thor Heyerdahl**, who in 1947 drifted on the balsa raft *Kon-Tiki* from Peru to the Tuamotus in 101 days, after being towed out to sea. He claimed Polynesia had been settled from South America by fair-haired "Tiki people", and held that Polynesians were too primitive, in his view, to sail against the wind. Archaeological, linguistic and genetic evidence has overwhelmingly rejected the theory, now described as pseudoscientific and racially controversial. The genetic traces of South American contact do not rescue it: that contact was later, small, and may have been made by Polynesians sailing east.

## Hōkūleʻa and Mau Piailug

The answer came from the sea. In the 1960s David Lewis sailed from Tahiti to New Zealand without instruments and recorded living navigators such as Hipour of Puluwat. In 1973 the anthropologist **Ben Finney**, the artist Herb Kawainui Kāne and the sailor Tommy Holmes founded the **Polynesian Voyaging Society**, and in 1975 it launched ***Hōkūleʻa***, a performance-accurate replica of a double-hulled voyaging canoe.

{{image: Hōkūleʻa | Hōkūleʻa, the double-hulled voyaging canoe launched in 1975 to test traditional navigation.}}

But in 1975 no living Hawaiian knew the old techniques of deep-sea voyaging. The society turned to **Mau Piailug** of Satawal in the Caroline Islands, a master navigator of the Weriyeng school, initiated at about eighteen, and the only one of the few remaining Micronesian navigators willing to share his knowledge with outsiders. On 1 May 1976 *Hōkūleʻa* left Maui. On the thirty-first day Mau predicted land, white terns appeared, and the atoll of Mataiva came into view. When the canoe reached Papeʻete on 4 June, about 17,000 people, half the population of Tahiti, came to welcome it. Quarrels among the crew turned physical, and Mau went home from Tahiti. Yet in 1980 Mau's student **Nainoa Thompson** navigated to Tahiti and back, the first Native Hawaiian in modern times to do so without instruments, and on the Voyage of Rediscovery of 1985–87 crews from across Polynesia sailed together. When Nomuka appeared on the horizon, the Tongan captain Sione Taupeamuhu, who had doubted it could be done, said: "Now I can believe the stories of my ancestors."

```quote
You've proven that it could be done. And you've also proven that our ancestors did it.
Sir James Hēnare, elder of Tai Tokerau · To the crew of Hōkūleʻa · Voyage of Rediscovery, 1985–87
```

The revival helped drive the Hawaiian Renaissance and a return to canoe-building in New Zealand, Rarotonga and Tahiti. In 2007 Mau held the first initiation ceremony for navigators on Satawal in 56 years, among them five Native Hawaiians.

## Islanders Telling Their Own History

The history of Oceania is increasingly written by its own people. Hauʻofa's sea of islands has been developed by the Samoan New Zealand historian **Damon Salesa**, whose *An Indigenous Ocean* (2023) keeps Pacific peoples at the centre of their own stories. The Ngāi Tahu archaeologist **Atholl Anderson** helped rewrite the chronology of settlement, and Tracey Banivanua Mar's *Decolonisation and the Pacific* (2016) treats the end of empire in the Pacific as an Indigenous and international process. Together with the navigators of *Hōkūleʻa*, they have turned an old European puzzle, how "primitive" people could have reached such remote islands, into a story of knowledge, planning and skill.

## Further exploration

- **Patrick Vinton Kirch, *On the Road of the Winds: An Archaeological History of the Pacific Islands before European Contact* (2000; revised edition 2017).** The standard archaeological synthesis, from Sahul to European contact.
- **Epeli Hauʻofa, *We Are the Ocean: Selected Works* (2008).** Essays, fiction and poetry, including "Our Sea of Islands".
- **Christina Thompson, *Sea People: The Puzzle of Polynesia* (2019).** A readable history of how outsiders and Polynesians have explained the settlement of Polynesia.
- **Atholl Anderson, Judith Binney and Aroha Harris, *Tangata Whenua: An Illustrated History* (2014).** Māori history from Pacific origins to the present.
- **Damon Salesa, *An Indigenous Ocean: Pacific Essays* (2023).** Prize-winning essays by a Samoan New Zealand historian.
- **Nicholas Thomas, *Islanders: The Pacific in the Age of Empire* (2010).** Islanders as agents in the encounter with empire.
- **Terry Hunt and Carl Lipo, *The Statues That Walked: Unraveling the Mystery of Easter Island* (2011).** The main case against the ecocide thesis.$mn_pacific_master$,
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
  select $mn_pacific_quiz$[
    {"type": "mcq", "prompt": "Who proposed the terms Near Oceania and Remote Oceania, and in what year?", "options": ["Dumont d'Urville, in the nineteenth century", "Andrew Pawley and Roger Green, in 1973", "James Cook, in 1778", "Epeli Hauʻofa, in 1993"], "answerIndex": 1, "explanation": "Pawley and Green proposed the terms in 1973 to replace Dumont d'Urville's categories of Melanesia, Micronesia and Polynesia with a division based on how the islands were settled.", "id": "q1"},
    {"type": "mcq", "prompt": "According to the revised chronology of Wilmshurst, Hunt, Lipo and Anderson (2011), when were the Society Islands first settled?", "options": ["About 1025–1120 CE", "About 300 CE", "About 700 CE", "About 1500 BCE"], "answerIndex": 0, "explanation": "Their analysis of the most reliable radiocarbon dates put first East Polynesian settlement in the Society Islands at about 1025–1120 CE, with the remaining islands settled in one pulse about 1190–1290 CE. The chronology is widely accepted but contested.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the 2020 genetic study led by Alexander Ioannidis find?", "options": ["That Polynesia was first settled from South America, as Heyerdahl claimed", "That there was no contact between Polynesia and the Americas before 1492", "That the sweet potato reached Polynesia by natural dispersal", "Native American ancestry in East Polynesians from a contact event about 1150–1230 CE"], "answerIndex": 3, "explanation": "The study dated a single contact to about 1150–1230 CE, closest to Indigenous peoples of present-day Colombia (the Zenú). It came after Polynesian settlement, may have involved Polynesians sailing east, and does not support Heyerdahl.", "id": "q3"},
    {"type": "mcq", "prompt": "Who navigated Hōkūleʻa without instruments from Hawaiʻi to Tahiti in 1976?", "options": ["Nainoa Thompson", "Ben Finney", "Mau Piailug of Satawal", "Tupaia of Raʻiātea"], "answerIndex": 2, "explanation": "Mau Piailug, a master navigator of the Weriyeng school from Satawal in the Caroline Islands, guided the canoe to Papeʻete in 1976; Nainoa Thompson, whom he trained, navigated the voyage of 1980.", "id": "q4"},
    {"type": "open", "prompt": "Was the settlement of Remote Oceania the result of accidental drift or deliberate voyaging? Discuss the debate and the evidence.", "rubric": "A strong answer sets out Andrew Sharp's 1956 drift thesis (deliberate voyages only within about 300 miles) and Cook's earlier leaning towards accident; explains the counter-arguments (canoes would need fertile couples, crops and animals; computer simulations in the 1970s found drift alone extremely unlikely); describes the experimental answer of David Lewis, Ben Finney, the Polynesian Voyaging Society and Mau Piailug's 1976 voyage; cites Wairau Bar evidence of a sizeable planned founding group; and distinguishes Heyerdahl's rejected South American origin theory from the later, small-scale contact shown by genetics.", "id": "q5"},
    {"type": "open", "prompt": "Assess the 'ecocide' interpretation of Rapa Nui's history.", "rubric": "A strong answer explains Jared Diamond's account in Collapse (2005), drawing on earlier collapse interpretations, of deforestation, overpopulation and pre-contact collapse, with Barbara West's attributed estimate of about 15,000; then weighs the counter-evidence: Hunt and Lipo's late settlement and the role of the Pacific rat, Owsley's skeletal study, Mulrooney et al. (2010), DiNapoli and Lipo's steady growth to 1722 with a few thousand people, and the 2024 ancient-DNA study; and identifies the post-contact catastrophe: the killings of 1722, the Peruvian slave raids of 1862–63, smallpox, 111 Rapa Nui by 1877, and Chilean annexation and confinement.", "id": "q6"}
  ]$mn_pacific_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/oceania-and-the-pacific/pacific-voyagers-the-settlement-of-oceania', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
