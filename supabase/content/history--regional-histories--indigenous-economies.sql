-- Indigenous Economies and Environments — canonical master article, co-written and human-reviewed.
-- history/regional-histories/americas/indigenous-economies-and-environments @ research/advanced/read.
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
    'history/regional-histories/americas/indigenous-economies-and-environments',
    'research',
    'advanced',
    'read',
    $mn_indigecon_master$> **Landscapes made by people.** The Americas that Europeans called "wilderness" were, in large part, worlds that Indigenous nations had shaped over thousands of years: prairies and oak woodlands kept open by fire, beaches terraced into clam gardens, fields of maize, beans and squash, Amazonian soils blackened with charcoal and refuse, and forests full of trees that people had domesticated. This chapter looks at how those economies worked, from Plains bison hunting to the potlatch and continental trade in copper, obsidian and shell, then follows the argument over the "pristine myth", the ecological damage of dispossession, and today's revival of Indigenous fire, fisheries and co-management.

## Managed Lands, Not Untouched Ones

Two ideas run through this chapter. Indigenous peoples of the Americas actively managed their environments with knowledge built up over generations; and the image of an empty, untouched continent was largely produced by the catastrophe of conquest itself. The chapter on North America before Columbus describes the continent's farmers, towns and confederacies; this one asks how they made a living, and what happened when that living was taken from them.

## Fire as a Tool

Many of the ecosystems Europeans first saw had burned every one to three years. Low-intensity "cultural burning" turned forest into grassland or savanna, or cleared the undergrowth, making the mosaic that colonists mistook for nature's own design. Burning gave hunters clearer sightlines and better forage for deer, elk and bison; it raised nut yields, eased travel, reduced ticks, and removed the fuel for catastrophic fires. For the Karuk of northern California, beargrass for basketry is best one to three years after a burn, and hazel shoots in the first year or two.

The evidence comes from charcoal and pollen in sediments and fire scars in tree rings. At Cliff Palace Pond in Kentucky, frequent low-severity fires from about 1000 BCE to 1800 CE coincide with more fire-adapted oak, chestnut and hickory; in New Mexico's Jemez Mountains, fires tracked human population rather than climate. On the prairies, early accounts of open grassland, the spread of woodland after settlement, and official efforts to outlaw Indigenous burning point to deliberate fire keeping the prairie open, though this remains an argument rather than a settled consensus.

How far burning reshaped whole regions is debated. The ecologist Jon E. Keeley argued in 2002 that Native burning in California's coastal ranges significantly enlarged grassland and open shrubland. Emily Russell had been more cautious in 1983: "There is no strong evidence that Indians purposely burned large areas.... The presence of Indians did, however, undoubtedly increase the frequency of fires above the low numbers caused by lightning." M. Kat Anderson's *Tending the Wild* (2005), built on interviews with Native Californians, argues that California was a managed landscape, not a wilderness.

## Clam Gardens and Salmon on the Northwest Coast

On the Pacific coast from Alaska to California, people farmed the sea. To build a clam garden, they rolled boulders down to the low-tide line to make a wall. Sediment collected behind it and formed a flatter beach where clams thrive, and the walls were maintained and raised over generations. The Kwakʼwala name is lux̌ʷxiwēys; in Haida, k'yuu kudhlk'aat'iija. More than 2,000 have been identified, and dates range from about 1,000 to at least 3,500 years old. The Kwakwaka'wakw Clan Chief Adam Dick (Kwaxsistalla) said they had existed "since the beginning of time". A 2014 study on Quadra Island, British Columbia, found about four times as many butter clams in gardens as on unwalled beaches.

Salmon were the other great staple. At Celilo Falls (Wyam) on the Columbia River, people fished and traded for 11,000 years or more (some estimates say 15,000), until The Dalles Dam flooded the falls in 1957. Before two dams were built on Washington's Elwha River in the early twentieth century, an estimated 392,000 salmon and trout returned each year, a staple for the Lower Elwha Klallam.

## The Buffalo Economy

Before horses, Plains peoples drove bison into pounds or over cliffs at "buffalo jumps". Horses spread north from Spanish New Mexico from the early 1600s, and much faster after the Pueblo Revolt of 1680, and by the early 1700s mounted hunting was well established; some farming peoples changed their whole way of life. The Cheyenne left their cornfields at the Biesterfeldt village, moved west and became mounted hunters. The Comanche built Comanchería on the southern plains on horses and bison. Pekka Hämäläinen's *The Comanche Empire* (2008) won the Bancroft Prize, though Indigenous scholars such as Jameson Sweet (Lakota/Dakota) have criticised the "empire" framing he extended to the Lakota in *Lakota America* (2019). The chapter on the Columbian Exchange tells the wider story of the horse.

Bison also fed the fur trade as pemmican (Cree *pimîhkân*; Lakota *wasná*), dried meat pounded with fat. How many bison there were is uncertain. The often-cited figure of 60 million comes from Ernest Thompson Seton (1929), who scaled up from livestock carrying capacity, and is often linked to a vast herd Colonel R. I. Dodge described in 1871. Later estimates of what the grasslands could feed are lower, around 25–30 million (M. Scott Taylor) or 28–30 million (Dan Flores). Hämäläinen, drawing on Flores, estimates that by the 1830s the Comanche and their allies were killing about 280,000 bison a year on the southern plains, near the limit of sustainability, and that a long drought from 1845 into the 1860s brought a widespread collapse of southern herds.

The final destruction was of another order. In the winter of 1872–73 alone more than 1.5 million hides went east by rail, many to become industrial machine belts. President Grant pocket-vetoed a federal bison-protection bill in 1874. The Secretary of the Interior, Columbus Delano, had already set out the government's view.

```quote
While I would not seriously regret the total disappearance of the buffalo from our western prairies, in its effect on the Indians, regarding it rather as a means of hastening their sense of dependence upon the products of the soil and their own labors...
Columbus Delano, Secretary of the Interior · Annual Report · 1873
```

By 1889 only a few hundred wild bison remained, roughly a thousand counting captive animals. Andrew Isenberg (2000) gives a multi-causal account in which horses, the robe market, drought and cattle all played a part, Native market hunters among them. But the collapse of 1870–1885 was driven overwhelmingly by commercial hide hunting and settler expansion. As the herds vanished, Plains nations were made dependent on government rations.

## Fields: Maize, Milpa and the Three Sisters

Maize was domesticated once, about 9,000 years ago, from teosinte in southern Mexico, as the chapter on Mesoamerica describes, and reached New Mexico and Arizona about 4,100 years ago. In the Mesoamerican **milpa** (from Nahuatl), maize, beans and squash grow together, often with a dozen other crops, typically for two years of cultivation followed by eight of fallow.

{{image: Three Sisters (agriculture) | Maize, beans and squash grown together: the "Three Sisters" polyculture that spread from Mesoamerica across much of North America.}}

In the **Three Sisters** polyculture, maize is a trellis for climbing beans, the beans fix nitrogen, and the broad squash leaves shade out weeds. The geographer Carl Sauer called it "a symbiotic plant complex of North and Central America without an equal elsewhere". The Haudenosaunee agronomist Jane Mt. Pleasant found that Haudenosaunee fields were not tilled, which limited erosion, and her modern trials of the polyculture produced more energy and protein than any local monoculture, with maize yields of 22–76 bushels per acre. Hart and Feranec estimate lower Wendat yields of 8–22 bushels.

Farming in eastern North America did not begin with maize. Until the 1970s and 1980s most archaeologists thought it had been imported from Mexico, but seed evidence showed that the **Eastern Agricultural Complex** was one of about ten independent centres of plant domestication in the world. By about 1800 BCE people in Illinois were cultivating goosefoot, sunflower, marsh elder and squash; maize arrived only after about 200 BCE. The raised lake fields of the Valley of Mexico, the chinampas, are described in the chapter on Moctezuma's Mexico.

## Cahokia and Amazonia

Cahokia, near modern St Louis, was a Mississippian city of about 1050–1350 CE with, around 1100, perhaps 10,000–20,000 people, though estimates range from 6,000 to 40,000. Maize became important in the American Bottom only around 900 CE; before that, most crops belonged to the older Eastern Agricultural Complex. Cahokians spread their fields between lowland and upland so that a single flood could not destroy the food supply, and they built channels and levees.

Why Cahokia declined is debated. One explanation is "ecocide": that deforestation, overhunting and pollution undermined the city. Others point to droughts around 1100–1250, major floods recorded in the sediments of Horseshoe Lake, and social unrest. In 2021 the archaeologist Caitlin Rankin found no evidence of human-caused erosion or flooding at Cahokia, a direct challenge to the ecocide story. The city was largely abandoned by about 1350 and entirely by about 1400.

In Amazonia, people improved notoriously poor soils. **Terra preta** ("black earth") is a dark, fertile soil made by adding charcoal, bone, broken pottery, compost and manure; it holds up to 9 per cent black carbon, against about 0.5 per cent in the soils around it. Whether it was made deliberately, built up in middens, or enriched already fertile patches is debated. Its extent is very uncertain: estimates run from 0.1–0.3 per cent of lowland forested Amazonia to 3.2 per cent, or 10 per cent or more. The forest itself bears a human imprint: a 2017 study by Levis and colleagues found domesticated tree species far more likely to be dominant, and concluded that Amazonian forests are "structured to an important extent" by Indigenous plant domestication.

```checkpoint
q: What does the evidence from clam gardens show about Northwest Coast economies?
a*: That people built and maintained rock walls at the low-tide line that created more productive clam beaches.
a: That Northwest Coast peoples relied only on wild foods they did not manage.
x: Clam gardens were built and maintained structures, a form of mariculture.
a: That clam gardens were introduced by European settlers in the nineteenth century.
x: Some are dated to well over a thousand years old, and the Swinomish garden of 2022 is believed to be the first built in the US in over 200 years.
a: That clam gardens were used to raise salmon.
x: They created flatter beaches where clams thrive; salmon fisheries were a separate economy.
hint: Think of what sediment does when it collects behind a wall of boulders.
why: Clam gardens are one of the clearest cases of Indigenous peoples engineering an ecosystem to increase its yield.
---
q: What did Caitlin Rankin's 2021 study contribute to the debate about Cahokia's decline?
a: It proved that overhunting alone destroyed the city.
x: Rankin's work challenged, rather than supported, explanations that blame environmental damage by Cahokians.
a: It showed that Cahokia was founded in the 1400s.
x: Cahokia flourished from about 1050 and was abandoned by about 1350–1400.
a*: It found no evidence of human-caused erosion or flooding, challenging the "ecocide" explanation.
a: It established that Cahokia had exactly 40,000 people.
x: Population estimates remain a range, from about 6,000 to 40,000.
hint: The debate pits environmental self-destruction against other causes such as drought, floods and unrest.
why: Rankin's findings weaken the idea that Cahokians destroyed their own environment.
```

## Exchange Across a Continent

Goods moved across North America for thousands of years. People of the Old Copper complex around the western Great Lakes worked nearly pure native copper from Isle Royale and the Keweenaw Peninsula, with artefacts dated from about 6500 to 1580 BCE. The Hopewell tradition of about 100 BCE to 500 CE was a network rather than a single society, whose burials hold copper, mica, obsidian and marine shell from far away. Mound City in Ohio held hundreds of pounds of obsidian traced to Obsidian Cliff in Yellowstone, roughly 1,500–2,000 miles away; the Ohio Hopewell may have made pilgrimages there, or traded through intermediaries.

On the Pacific coast, dentalium tusk shells, harvested from deep water mainly by the Nuu-chah-nulth, travelled as far as the Plains and Alaska. Among the Yurok of northern California they were the most important unit of exchange and sacred wealth, valued by length. In the north-east, **wampum**, beads of quahog and whelk shell, recorded treaties and histories in strings and belts such as the Two Row Wampum. Colonists treated it as currency, legal tender in New England from 1637 to 1661.

## The Potlatch and Gift Economies

Among Northwest Coast peoples such as the Haida, Tlingit, Kwakwaka'wakw and Coast Salish, the **potlatch**, a gift-giving feast, was a primary institution of government and economy. At potlatches, rights to territories and resources were stated and affirmed, and names and titles passed on. Gifts before colonisation included stored food such as oolichan oil, canoes, slaves and ornamental "coppers", but never productive territories. Anthropologists' theories of gift exchange, with concepts such as reciprocity and inalienable possessions, grew from Marcel Mauss's debate with Bronisław Malinowski.

The famous competitive, destructive potlatches of the late nineteenth century were partly a colonial development: epidemics left titles vacant for commoners to compete over, and mass-produced trade goods inflated the scale of giving. The missionary William Duncan called it, in 1875, "by far the most formidable of all obstacles in the way of Indians becoming Christians, or even civilized". Canada banned it by an amendment to the *Indian Act* passed in 1884, in force from 1885, with two to six months' imprisonment. Not all Indigenous voices opposed a ban: some Coast Tsimshian and Nisga'a chiefs had petitioned for one in 1883. Others refused it outright.

```quote
We will dance when our laws command us to dance, we will feast when our hearts desire to feast. Do we ask the white man, 'Do as the Indian does'? No, we do not. Why, then, will you ask us, 'Do as the white man does'?
Chief O'wax̱a̱laga̱lis of the Kwagu'ł · Speech to Franz Boas · published 1888
```

Enforcement was weak until 1921, when Chief Dan Cranmer's potlatch led to 20 people being imprisoned. The ban was dropped in 1951, and potlatching revived strongly from the 1970s.

## Markets, Furs and Skins

European trade drew Indigenous economies into Atlantic markets. The chapter on Colonial North America describes the fur-trade wars of the Haudenosaunee and Richard White's "middle ground" in the Great Lakes. The ecological cost was lasting: beaver did not noticeably recover until about the mid-twentieth century.

In the south-east, Charleston became the hub of a trade in deerskins and Indian slaves involving the Cherokee, Muscogee (Creek), Choctaw, Chickasaw and others, reportedly exporting some 53,000–54,000 skins a year in the early 1700s. White-tailed deer were becoming scarce in Cherokee country by 1750, and the trade tied these nations to guns, cloth, knives and kettles while encouraging slave raiding. Kathryn Braund's *Deerskins and Duffels* (1993) tells this story from the Creek side.

## The Wilderness Myth and Its Critics

In 1992 the geographer William Denevan named the belief that Indigenous peoples had barely touched the land "the pristine myth". He argued that by 1492 Indigenous activity had changed the extent and make-up of forests, created and expanded grasslands, and reshaped the ground with countless earthworks. That humanised landscape, he argued, had largely disappeared by the mid-eighteenth century, so that the landscape of 1750 was more "pristine" than that of 1492, not because of European clearing but because of population collapse. Denevan's edited volume on the population of the Americas in 1492 put the hemisphere at 43–65 million; his 1992 article reportedly worked with a figure of 53.9 million. Koch and colleagues (2019) estimate a fall from more than 60 million to about 6 million by 1600, and suggest that forest regrowth may have caused a dip in atmospheric carbon dioxide around 1610, a debated claim.

The nineteenth-century writers who spread the image of a pristine wilderness, such as Longfellow, Parkman and Thoreau, were describing land already emptied by epidemics, where reduced burning had let forest grow back. William Cronon's *Changes in the Land* (1983) contrasted Native usufruct rights, the right to the nuts, fish, wood or game a place yields, with English law, which made the land itself a commodity. In "The Trouble with Wilderness" (1995) he argued that the idea of untouched wilderness is a cultural invention. The idea had costs: Yellowstone, home to the Tukudeka (Sheepeaters), long described as its only year-round residents, and used by many other nations, became a park in 1872 and tribes were effectively excluded, and the historian Mark David Spence argued that such parks were "preserved" by removing the people who used them.

Charles C. Mann's popular *1491* (2005) brought this argument to a wide audience, arguing that restoring the landscape of 1491 would mean creating "the world's largest gardens". It is an entry point rather than an authority: a *Geographical Review* forum printed eight critiques, David Henige attacked high population counts, and Betty Meggers argued for small, low-impact Amazonian populations.

A second debate concerns the "ecological Indian". Shepard Krech III's *The Ecological Indian* (1999) argued that Native North Americans were ecologists, deeply aware of the connections between people, animals and land, but not conservationists in the modern sense, citing wasteful bison jumps and participation in the beaver and deer trades. Vine Deloria Jr. found neither his evidence nor his arguments convincing and objected to a non-Indian presuming to characterise the Native past; John Mohawk and Louis Warren also criticised the book. The debate is best understood as a contest over a stereotype. Krech himself accepted that colonists' "wilderness" was often a managed landscape.

## Dispossession and Its Ecological Consequences

Taking the land also meant breaking the systems that managed it. Spanish authorities banned burning in California. The sociologist Kari Norgaard and Sara Worl note that "fire suppression was mandated by the very first session of the California Legislature in 1850 during the apex of genocide in the northern part of the state", and by the early twentieth century suppression was federal policy. The Dawes Act of 1887 broke up reservations into allotments and sold "surplus" land to settlers, railroads and corporations; Native-held land fell by about 90–100 million acres, nearly two-thirds, before the Indian Reorganization Act ended allotment in 1934.

Extraction followed. Thousands of Diné (Navajo) uranium miners from 1944 onwards were not told of the risks, and in 1979 the Church Rock tailings dam broke, the largest radioactive release in US history. In 2005 the Navajo Nation banned uranium mining on its land. The Potawatomi philosopher Kyle Powys Whyte argues, in his essay "Our Ancestors' Dystopia Now", that many Indigenous peoples have already lived through the environmental catastrophe colonialism brought.

```checkpoint
q: What was William Denevan's "pristine myth"?
a: His claim that the Americas in 1492 were an untouched wilderness.
x: That is the belief Denevan named in order to reject it.
a*: The belief, which he rejected, that Indigenous peoples had little or no effect on the environment.
a: The idea that Europeans cleared most of the forests of the Americas before 1750.
x: Denevan argued that the landscape became less humanised by 1750 because of population collapse, not European clearing.
a: A theory that bison numbers were exaggerated.
x: The pristine myth concerns the human shaping of landscapes in general, not bison counts.
hint: Who, in Denevan's view, had shaped the landscape of 1492?
why: Denevan argued the "untouched" landscape was a product of Indigenous population collapse, not a natural state.
---
q: How do historians such as Isenberg explain the near-extinction of the bison?
a: As caused mainly by Native hunters overhunting the herds.
x: Native market hunting is part of the story, but the final collapse of 1870–1885 was driven overwhelmingly by commercial hide hunting and settler expansion.
a: As the result of a single disease brought by cattle.
x: Disease is one factor among many, not the sole cause.
a: As a natural fluctuation that would have happened anyway.
x: Hide hunting, policy and settlement were human causes.
a*: As the result of many causes combined, with commercial hide hunting and settler expansion driving the final collapse.
hint: Think of the 1.5 million hides shipped east in one winter.
why: The multi-causal account includes horses, drought and markets, but does not shift the blame onto Native hunters.
```

## The Present: Knowledge, Co-management and Conservation

Indigenous nations have pressed their rights through courts, protests and agreements. In the Pacific Northwest, the "fish wars" of activists such as Billy Frank Jr. (Nisqually) led to the Boldt decision of 1974, which read the 1854–55 Stevens treaties' guarantee of "the right of taking fish at all usual and accustomed grounds and stations" to mean that tribes were entitled to up to half the harvestable fish; the Supreme Court largely endorsed it in 1979. The tribes became co-managers of the fisheries, with their own biologists. In 2007 a federal court held that the treaties also protect salmon habitat, and a 2013 injunction ordered Washington State to replace its worst salmon-blocking culverts by 2030.

Dams are coming down: the Elwha's two by 2014, with strong support from the Lower Elwha Klallam, and four on the Klamath in 2023–24 after a campaign in which the Yurok and Karuk were central. The Standing Rock protests of 2016–17 are discussed in the chapter on Native American and Indigenous Studies.

On land, the Haida Nation declared Gwaii Haanas a Haida Heritage Site in 1985 to stop logging, and the 1993 Gwaii Haanas Agreement created a board with equal Haida and federal representation, one of the best-known models of co-management. Bears Ears National Monument in Utah, proclaimed in 2016 and co-managed with five tribes, has been cut, restored and, according to reports, cut again in July 2026. The InterTribal Buffalo Council, founded in 1992 after a 1991 meeting, now has more than 80 member tribes managing more than 20,000 bison. Tribes are bringing back cultural burning, from the Southern Sierra Miwuk Nation working with Yosemite fire crews to the Confederated Tribes of Grand Ronde burning to grow camas. Clam gardens are being restored too, and in 2022 the Swinomish Tribe built what is believed to be the first new one in the United States in more than 200 years.

Globally, Garnett and colleagues (2018) estimate that Indigenous peoples manage or hold tenure over at least about 38 million square kilometres in 87 countries, more than a quarter of the world's land. The ecologist Fikret Berkes defines **traditional ecological knowledge** as "a cumulative body of knowledge, practice, and belief" handed down through generations, and scholars debate how it should relate to Western science and whether the term itself appropriates Indigenous knowledge. The Potawatomi botanist Robin Wall Kimmerer's *Braiding Sweetgrass* (2013) braids "indigenous ways of knowing, scientific knowledge" and her own story. Dina Gilio-Whitaker, a Colville descendant, traces the long Indigenous fight for environmental justice from colonisation to Standing Rock.

## Further exploration

- **William Cronon, *Changes in the Land: Indians, Colonists, and the Ecology of New England* (1983).** The classic environmental history of contact, property and landscape.
- **M. Kat Anderson, *Tending the Wild: Native American Knowledge and the Management of California's Natural Resources* (2005).** California as a tended landscape, drawing on Native Californian testimony.
- **Kathryn E. Holland Braund, *Deerskins and Duffels: The Creek Indian Trade with Anglo-America, 1685–1815* (1993).** The deerskin trade seen from the Creek side.
- **Andrew C. Isenberg, *The Destruction of the Bison: An Environmental History, 1750–1920* (2000).** A multi-causal account of the bison's near-extinction.
- **Robin Wall Kimmerer, *Braiding Sweetgrass: Indigenous Wisdom, Scientific Knowledge, and the Teachings of Plants* (2013).** A Potawatomi botanist on reciprocity and knowledge.
- **Dina Gilio-Whitaker, *As Long as Grass Grows: The Indigenous Fight for Environmental Justice, from Colonization to Standing Rock* (2019).** Indigenous environmental justice from a scholar of Colville descent.
- **Shepard Krech III, *The Ecological Indian: Myth and History* (1999).** The provocative book at the centre of the "ecological Indian" debate, best read alongside its critics.$mn_indigecon_master$,
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
  select $mn_indigecon_quiz$[
    {"type": "mcq", "prompt": "Why did Canada's potlatch ban, passed in 1884 and in force from 1885, target the potlatch?", "options": ["Because the potlatch was the Northwest Coast's main institution for affirming rights, titles and wealth, and missionaries such as William Duncan saw it as the chief obstacle to Christianisation", "Because the potlatch was a form of trade in alcohol", "Because all Northwest Coast chiefs had asked for it to be banned", "Because the potlatch involved the sale of productive territories to settlers"], "answerIndex": 0, "explanation": "The potlatch was a primary institution of government and economy where rights and titles were affirmed. Duncan called it the most formidable obstacle to Christianisation. Some Coast Tsimshian and Nisga'a chiefs petitioned for a ban in 1883, but others refused it, and productive territories were never given away.", "id": "q1"},
    {"type": "mcq", "prompt": "What did William Cronon contrast in Changes in the Land (1983)?", "options": ["Maize and wheat farming", "Native usufruct rights to what a place yields and English law that treated land itself as a commodity", "Spanish and French colonial religion", "Hopewell and Mississippian trade networks"], "answerIndex": 1, "explanation": "Cronon contrasted Native rights to the nuts, fish, wood or game a place yielded with English property law, which made the land itself a commodity, and showed that Native people shaped New England ecosystems, for example by burning.", "id": "q2"},
    {"type": "mcq", "prompt": "What is terra preta?", "options": ["A raised lake field in the Valley of Mexico", "A type of obsidian traded from Yellowstone", "A dark, fertile Amazonian soil made by adding charcoal, bone, pottery, compost and manure to poor soils", "A shell bead used as currency in New England"], "answerIndex": 2, "explanation": "Terra preta is an anthropogenic 'black earth' holding up to 9 per cent black carbon, against about 0.5 per cent in surrounding soils; its extent and how deliberately it was made are debated.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about pre-slaughter bison numbers best reflects the evidence?", "options": ["There were certainly 100 million bison", "Bison numbers were never more than a million", "Exact counts survive from Plains nations' censuses", "Seton's 60 million is an extrapolation; carrying-capacity estimates suggest roughly 25–30 million"], "answerIndex": 3, "explanation": "The 60 million figure is Seton's 1929 extrapolation, often linked to Dodge's 1871 sighting; estimates based on what the grasslands could feed (Taylor, Flores) are around 25–30 million, so numbers should be given as ranges.", "id": "q4"},
    {"type": "open", "prompt": "Using examples from fire, clam gardens and agriculture, explain what William Denevan meant by the 'pristine myth' and why it matters for how we understand the Americas in 1492.", "rubric": "A strong answer explains that Denevan (1992) rejected the belief that Indigenous peoples had little effect on the land; gives examples such as cultural burning that kept prairies and woodlands open, clam gardens on the Northwest Coast, the Three Sisters and milpa, Cahokia's fields or terra preta; notes his argument that the humanised landscape of 1492 largely disappeared by about 1750 because of population collapse, not European clearing; and considers why the 'wilderness' idea mattered, for example in excluding tribes from national parks such as Yellowstone (Cronon, Spence). Better answers acknowledge debate, such as Russell's caution about the scale of burning or criticism of high population figures.", "id": "q5"},
    {"type": "open", "prompt": "How have Indigenous nations used courts, agreements and their own knowledge to regain a role in managing their environments since the 1970s? Discuss at least two examples.", "rubric": "A strong answer uses examples such as the Boldt decision (1974) and tribal co-management of Pacific Northwest fisheries, the Haida's Gwaii Haanas and its equal-representation board (1993), the InterTribal Buffalo Council (1991), dam removals on the Elwha and Klamath with tribal support, the revival of cultural burning or clam gardens, or Bears Ears co-management and its instability. Better answers connect these to earlier dispossession (fire suppression, allotment, the bison's destruction), discuss traditional ecological knowledge (Berkes's definition and debates over it, Kimmerer), and use Garnett et al. (2018) rather than unsupported statistics.", "id": "q6"}
  ]$mn_indigecon_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/americas/indigenous-economies-and-environments', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
