-- The Neolithic Revolution: Farming and Its Costs — canonical master article, co-written and human-reviewed.
-- history/before-writing/neolithic-revolution @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Farming invented independently in at least seven regions, and why it made
-- most people worse off before it made anyone better off: domestication, the
-- Holocene, the Fertile Crescent, the other centres, skeletal costs, the
-- demographic transition, inequality, spread, and secondary products.
-- Interleaved checkpoint self-tests after each major section.
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
    'history/before-writing/neolithic-revolution',
    'research',
    'advanced',
    'read',
    $neolithic_master$> **The Neolithic Revolution** is the name given to the shift from foraging to farming, which began a little under 12,000 years ago and happened independently in at least seven, and possibly a dozen or more, parts of the world. It made possible everything usually called civilization: villages, cities, writing, states, and the population of eight billion alive today. It also, by the evidence of skeletons, left most of the people who lived through it shorter, sicker, and harder-worked than their foraging ancestors. The central puzzle of this chapter is how both of those things can be true, and why people took a path that so often seems to have made them worse off.

## What Actually Changed

The archaeologist V. Gordon Childe popularised the phrase "Neolithic Revolution" in *Man Makes Himself* (1936), placing the invention of farming alongside the Industrial Revolution as one of the two great turning points in human history. ("Neolithic", meaning "new stone age", had been coined in 1865 by John Lubbock for the period of polished stone tools.) The word "revolution" captured the scale of the change. It misleads about the speed. Seen from the inside, the transition was slow, piecemeal, and invisible to the people living through it.

Three things that are easy to run together need to be kept apart.

**Cultivation** means deliberately tending wild plants: clearing ground, sowing seed, weeding, and harvesting. People can cultivate wild plants for centuries without changing them.

**Domestication** is a biological change. Under human selection, plants and animals evolve traits that suit human use and often make them dependent on people. Wild wheat and barley scatter their seeds when ripe, because the stalk holding the seeds (the rachis) shatters; domesticated forms have a tough rachis that holds the seeds until a farmer harvests them. A plant that cannot disperse its own seed cannot survive without farmers. Domesticated seeds also tend to be larger and to germinate together, without the staggered dormancy that protects wild plants. Domesticated animals typically became smaller, more docile, and more variable in coat colour than their wild ancestors.

**Sedentism**, living in one place all year round, is a third change, and it did not always go with the other two. Some foragers settled permanently where wild food was rich enough, and some early farmers stayed mobile.

Archaeobotanists, who study plant remains from excavations, have shown that domestication was **protracted**. In southwest Asia, the proportion of tough-rachis cereals in excavated samples rose slowly over one to two thousand years after cultivation began. No one invented farming; it emerged from generations of small decisions whose cumulative effect no individual could see.

```checkpoint
q: What distinguishes domestication from cultivation?
a*: Cultivation is the human practice of tending plants; domestication is the genetic change in plants or animals that results from human selection.
a: Cultivation involves plants, while domestication involves only animals.
x: Both terms apply to plants, and domestication applies to animals too. The difference is between a human practice and a biological change.
a: Domestication always comes first, and cultivation follows.
x: The order is the reverse. People cultivated wild plants for generations before domesticated forms emerged.
a: They are two words for the same thing.
x: People can cultivate wild plants without changing them genetically, so the two must be distinguished.
hint: One describes what people do; the other describes what happens to the organism.
why: Cultivation is a behaviour, domestication an evolutionary outcome. Separating them is what revealed that domestication took a very long time.
---
q: Why does a tough, non-shattering rachis matter so much as a marker of domestication?
a: Because it makes the grain more nutritious.
x: The rachis holds the seeds to the stalk; it does not affect nutritional value.
a: Because it allows the plant to spread its seed more widely in the wild.
x: The opposite is true. A tough rachis keeps seeds on the stalk, which is a disadvantage for a wild plant.
a*: Because it keeps seeds on the stalk until harvest, which helps the harvester but means the plant depends on people to sow it.
a: Because it makes the plant resistant to drought.
x: Drought resistance is unrelated to the rachis. Its significance is in seed dispersal.
hint: Think about what happens to the seeds of a plant whose stalk does not shatter.
why: Harvesting unconsciously selected for plants that kept their seeds. The trait benefits the farmer and creates a plant that cannot reproduce well without human help.
```

## Why Then?

Humans with fully modern minds had existed for more than a hundred thousand years before anyone farmed. Then, within a few thousand years of the end of the last Ice Age, farming began in several unconnected regions. A satisfactory explanation has to account for that timing.

The most widely accepted answer is **climate**. In 2001 Peter Richerson, Robert Boyd, and Robert Bettinger argued that agriculture was "impossible during the Pleistocene but mandatory during the Holocene". The Ice Age climate swung violently over decades, which made long-term investment in particular plants in particular places too risky, and its low levels of atmospheric carbon dioxide reduced plant productivity. The Holocene, which began about 11,700 years ago, was warmer, wetter, and above all more stable. Once it began, people in favourable regions who intensified their use of plants would gradually outcompete those who did not.

Climate explains when farming became possible, not why particular people took it up. The main explanations proposed over the last century are:

- **The oasis theory** (Childe): drying climates forced people, plants, and animals together around water sources. The climate evidence does not fit the timing well.
- **The "hilly flanks" theory** (Robert Braidwood, 1950s): farming began where the wild ancestors of crops grew naturally, in the uplands around the Fertile Crescent. This explains where, but not why.
- **Population pressure and the "broad spectrum revolution"** (Lewis Binford, Kent Flannery, Mark Cohen): as forager populations grew, people turned to less-preferred foods such as small seeds, which needed more processing, and eventually to cultivation.
- **Social explanations**: Brian Hayden argued that ambitious individuals promoted food production to host competitive feasts. Jacques Cauvin argued for a "revolution of symbols", a change in religious thinking that came before the economic change.
- **Niche construction**: people had long reshaped their environments, by burning, clearing, and tending, and domestication was a slow coevolution between humans and certain species rather than a deliberate invention.

Most researchers now combine several of these. The transition looks less like a solution to a single problem and more like a gradual drift, under the new conditions of the Holocene, into a way of life that, once established, was very hard to leave.

```checkpoint
q: According to Richerson, Boyd, and Bettinger, why did farming begin in the Holocene rather than earlier?
a: Because human intelligence had only just evolved to the level needed for farming.
x: Humans with modern cognitive abilities had existed for over 100,000 years. The change was environmental, not mental.
a*: Because the Ice Age climate was too unstable and low in carbon dioxide for farming, while the stable Holocene made it viable and then competitively advantageous.
a: Because the wild ancestors of crops did not exist before the Holocene.
x: Wild cereals were harvested long before; at Ohalo II in Israel, about 23,000 years ago, people were already collecting wild grains.
a: Because a single invention, the plough, was made at the start of the Holocene.
x: The plough came thousands of years after the first farming. Early farmers used digging sticks and hoes.
hint: The key word in their argument is "stability".
why: A volatile climate punishes long-term investment in plants and places. The stable Holocene rewarded it, so farming became first possible and then hard to avoid.
---
q: What is the main weakness of the "hilly flanks" theory as an explanation?
a: The wild ancestors of crops did not grow in the hills of the Fertile Crescent.
x: They did; that is the theory's strength. It correctly identifies where wild progenitors grew.
a: It has been disproved by radiocarbon dating.
x: Dating has refined the chronology but has not overturned the observation about wild progenitors.
a: It applies only to animal domestication.
x: Braidwood's theory concerned both plants and animals in the uplands of southwest Asia.
a*: It explains where farming began, but not why people started farming when they did.
hint: Ask what the theory leaves unanswered.
why: Being where wild cereals grew was necessary but not sufficient. People had lived near them for millennia without farming, so the timing needs another explanation.
```

## The Fertile Crescent

The best-studied centre is southwest Asia, in the arc of land from the Levant through southeastern Turkey to the Zagros Mountains of Iran, known since the early twentieth century as the **Fertile Crescent**. Here the story starts before farming. At **Ohalo II**, on the shore of the Sea of Galilee, people about 23,000 years ago were already harvesting wild barley and wheat, grinding grain, and possibly cultivating small plots. From about 15,000 years ago, the **Natufian** culture of the Levant built stone houses and lived in permanent or semi-permanent villages while still foraging, harvesting wild cereals with sickles and storing food. Sedentism came first; domestication followed.

Between about 11,500 and 10,000 years ago, the region's "founder crops" were domesticated: emmer and einkorn wheat, barley, lentils, peas, chickpeas, bitter vetch, and flax. Goats and sheep followed, then cattle and pigs, by around 10,500 years ago. The settlement at **Jericho** had a massive stone tower by about 8000 BCE, whose purpose is still debated.

The most famous site of the period is **Göbekli Tepe** in southeastern Turkey, where from about 9500 BCE people carved and erected massive T-shaped limestone pillars decorated with foxes, snakes, vultures, and other animals, arranged in circular enclosures. Its excavator, Klaus Schmidt, interpreted it as a ritual centre built by foragers, "first the temple, then the city", and argued that the need to feed large work parties might have encouraged cultivation. More recent excavation under Lee Clare has found houses, cisterns, hearths, and tools for processing grain, and similar pillared sites have been found nearby, such as Karahan Tepe. Göbekli Tepe now looks more like a settlement with spectacular communal buildings than a temple standing alone in an empty landscape, though the debate continues.

Later, at **Çatalhöyük** in central Turkey (about 7100–5950 BCE), several thousand people lived in a dense cluster of mud-brick houses entered through the roofs, with no streets. They buried their dead beneath the floors and decorated their walls with paintings and bulls' horns. The excavator Ian Hodder found remarkably little evidence of social hierarchy: houses were of similar size, with no palaces or obvious temples, and men and women seem to have had similar diets and workloads. Early farming villages were not necessarily unequal societies.

{{image: Göbekli Tepe | Carved T-shaped pillars at Göbekli Tepe in southeastern Turkey, raised from about 9500 BCE. Once interpreted as a temple built by foragers, the site now appears also to have been a settlement.}}

```checkpoint
q: What does the Natufian culture show about the relationship between settled life and farming?
a: That farming had to come before people could live in permanent villages.
x: The Natufians did the reverse: they lived in permanent or semi-permanent villages while still relying on wild foods.
a: That settled life led people to abandon cereals.
x: The Natufians harvested and stored wild cereals intensively, which set the stage for later domestication.
a*: That people could become largely sedentary while still foraging, so settled life came before domestication.
a: That farming began first in Europe and spread to the Levant.
x: The Natufians are in the Levant, and their sequence predates European farming by thousands of years.
hint: Natufian villages predate domesticated crops.
why: The Natufians show that sedentism and domestication are separable, and in this region settled life came first.
---
q: How has recent excavation changed the interpretation of Göbekli Tepe?
a*: Finds of houses, cisterns, and grain-processing tools suggest it was also a settlement, not only a ritual centre.
a: It has shown the site was built by farmers rather than foragers.
x: The site's early phases still predate fully domesticated crops. The change concerns what the site was, not who built it.
a: It has proven that the site was only a temple with no one living nearby.
x: The newer evidence points the other way, towards people living at the site.
a: It has redated the site to the Bronze Age.
x: Göbekli Tepe remains firmly dated to about 9500 BCE onwards, long before the Bronze Age.
hint: Think about what the "first the temple, then the city" idea assumed about the surrounding landscape.
why: New evidence of everyday life complicates the image of an isolated temple, showing how one excavation's interpretation can be revised by the next.
```

## Many Centres, Many Crops

Farming was not invented once and spread. It was invented several times, in different environments, with different plants and animals.

**China** had at least two centres. In the north, along the Yellow River, people domesticated broomcorn and foxtail millet, with early evidence from sites such as Cishan around 8000 BCE. In the Yangzi valley to the south, rice was domesticated in a long process that ran roughly from 8000 to 4000 BCE, with specialists debating when to call it complete. Pigs, chickens, and silkworms were also domesticated in China. People in East Asia had been making pottery for more than ten thousand years before farming; pots from Xianrendong Cave are about 20,000 years old.

**New Guinea** is the most striking case of independent invention. At **Kuk Swamp** in the highlands, people were draining wetlands and cultivating taro, bananas, and yams with evidence of mounds and ditches by about 7,000 years ago and plant use stretching back perhaps 10,000 years, entirely independently of Asia.

In **Mesoamerica**, squash was domesticated about 10,000 years ago (seeds from Guilá Naquitz Cave in Oaxaca), and maize was domesticated from a wild grass called **teosinte** in the Balsas River valley of southwest Mexico by about 9,000 years ago. Teosinte's ears hold a few hard-cased kernels and look almost nothing like corn. Turning it into the large-cobbed maize of later Mesoamerica took thousands of years of selection, and maize did not become a staple capable of supporting dense populations until long after its domestication began.

In **South America**, people in the Andes domesticated potatoes, quinoa, llamas, alpacas, and guinea pigs. In the southwestern Amazon, recent work has found that people in the Llanos de Moxos of Bolivia were cultivating squash and manioc around 10,000 years ago on artificial "forest islands". The Amazon, once imagined as an untouched wilderness, was a landscape shaped by people for millennia.

**Africa** had several centres. Cattle herding spread across a then-green Sahara by around 7,000–8,000 years ago, before the region dried out. Sorghum was domesticated in the eastern Sahel by about 3000 BCE, pearl millet in the western Sahel by about 2500 BCE, African rice in the inland delta of the Niger, and yams in the forest zone of West Africa. In Ethiopia, teff and enset were domesticated.

**Eastern North America** independently domesticated a set of seed plants, including sunflower, squash, and goosefoot, by about 5,000 years ago, well before maize arrived from Mexico.

In *Guns, Germs, and Steel* (1997), Jared Diamond argued that these centres differed greatly in the wealth of domesticable species available, which gave southwest Asia a head start, and that farming spread more easily along Eurasia's east–west axis, where climates are similar at the same latitude, than along the north–south axes of the Americas and Africa. The argument has been widely influential and widely criticised, especially for underplaying human choices and for treating the eventual outcome, European conquest, as the natural end point of the story. It does make one useful point: geography shaped which options people had.

{{image: Teosinte | Teosinte, the wild grass from which maize was domesticated. Turning this wild grass, with its few hard kernels, into the large-cobbed maize of later Mesoamerica took thousands of years of selection.}}

```checkpoint
q: Which case provides the clearest evidence that farming was invented independently in many places?
a: Wheat farming spreading from the Fertile Crescent into Europe.
x: That is a case of spread from one centre, not independent invention.
a: Maize farming spreading from Mexico into North America.
x: That is diffusion from Mesoamerica. Eastern North America's own earlier seed crops are better evidence of independent invention.
a: Rice farming spreading from China into Southeast Asia.
x: This again is spread from an existing centre rather than an independent start.
a*: The cultivation of taro and bananas at Kuk Swamp in New Guinea, with no connection to other farming centres.
hint: Look for a centre with different crops and no plausible link to others.
why: New Guinea's farmers used local plants in a distinct environment, with no plausible contact with other early farming regions, which makes it a clear case of independent invention.
---
q: What does the history of maize domestication show about the speed of the agricultural transition?
a: That maize became a high-yielding staple within a few generations of domestication.
x: Early maize had tiny cobs. It took thousands of years to become productive enough to support large populations.
a*: That domestication was a long process: thousands of years separated the first domesticated maize from maize that could support dense populations.
a: That maize was domesticated from a wild plant already very similar to modern corn.
x: Teosinte looks very different from maize, with a few hard-cased kernels. That difference is why the transformation took so long.
a: That maize was first domesticated in South America and moved north.
x: Maize was domesticated in southwest Mexico, in the Balsas River valley, and spread south and north from there.
hint: Compare teosinte with a modern corn cob.
why: Maize's slow transformation from teosinte is a clear example of the protracted nature of domestication, which was gradual rather than revolutionary.
```

## The Costs of Farming

If farming was such an advance, it should have made people healthier. The skeletons say otherwise. In *Paleopathology at the Origins of Agriculture* (1984), Mark Nathan Cohen and George Armelagos gathered studies of skeletal remains from many regions before and after the adoption of farming. The pattern was consistent:

- **Stature fell**, often by several centimetres, a sign of poorer childhood nutrition.
- **Enamel defects** (lines in tooth enamel caused by interrupted growth in childhood) became more common, recording episodes of hunger or illness.
- **Tooth decay** increased sharply on carbohydrate-rich diets of grain and porridge.
- **Signs of anaemia** in the skull became more frequent.
- **Wear on joints and bones** showed heavy, repetitive labour, such as grinding grain on stone querns.

The reasons are not hard to find. Foragers ate a varied diet from dozens or hundreds of species; farmers relied heavily on a few staples, so a bad harvest meant hunger. Dense, settled populations living beside their own waste and their animals were ideal for infectious disease. Many of the great "crowd diseases" of later history came from domesticated animals and could only persist in large populations. Measles, for example, diverged from the cattle disease rinderpest; a 2020 genetic study dated the split to around the sixth century BCE, when cities were large enough to sustain it.

In 1987 Jared Diamond called agriculture "the worst mistake in the history of the human race". The phrase is deliberately provocative, and it hides an important fact. Despite worse individual health, farming populations grew much faster than foraging ones. The French demographer Jean-Pierre Bocquet-Appel called this the **Neolithic demographic transition**: cemetery evidence from many regions shows a sharp rise in the proportion of children, meaning higher birth rates. Settled women did not have to carry small children over long distances, and grain porridge allowed earlier weaning, so birth intervals shortened. Farmers had more children than foragers, even if they and their children were less healthy. Over generations, numbers won.

```checkpoint
q: What does the skeletal evidence collected by Cohen and Armelagos show about the health of early farmers compared with foragers?
a: Farmers were taller and healthier because they had a reliable food supply.
x: The evidence shows the reverse: farmers were usually shorter and showed more signs of nutritional stress.
a*: Early farmers generally show more signs of poor nutrition, disease, and heavy labour, such as reduced stature, enamel defects, and tooth decay.
a: There were no measurable differences between the two groups.
x: The differences were consistent across many regions; that consistency is why the study was so influential.
a: Foragers suffered more tooth decay because they ate more sugar.
x: Tooth decay increased with farming, because grain-based diets are rich in carbohydrates.
hint: Look at what the bones and teeth record.
why: Across many regions, the shift to farming is accompanied by signs of worse nutrition, more infectious disease, and harder labour.
---
q: If early farmers were less healthy than foragers, why did farming spread?
a: Because farmers lived longer on average than foragers.
x: The skeletal evidence suggests the opposite. Farming's advantage was not individual longevity.
a: Because foragers voluntarily abandoned foraging once they saw farmers' wealth.
x: There is no evidence of a simple voluntary switch, and early farmers were not obviously wealthier.
a: Because farming required less work than foraging.
x: Farming generally required more labour, as the skeletal evidence of heavy work shows.
a*: Because farming populations had higher birth rates and grew faster, so over generations they outnumbered foragers.
hint: Think about population rather than individual well-being.
why: The Neolithic demographic transition, with shorter birth intervals and more children, allowed farming communities to grow and expand even though individuals were often worse off.
```

## Storage, Property, and Inequality

Farming created **surplus** that could be stored, and stored wealth can be owned, inherited, stolen, taxed, and fought over. It is easy to conclude that inequality followed directly. The evidence suggests a slower and more complicated path.

Many early farming villages, like Çatalhöyük, show little sign of hierarchy. A 2017 study led by Timothy Kohler compared the sizes of excavated houses at dozens of sites around the world as a measure of wealth inequality. Inequality generally rose after farming began, but slowly over thousands of years, and it rose much higher in Eurasia than in the Americas. The authors linked this to large domesticated animals such as oxen and horses, which let a minority with draught animals farm more land and accumulate more wealth. Inequality was a consequence of particular kinds of farming, not of farming as such.

The first states did not appear until about 5,000 years after the first domestication. In *Against the Grain* (2017), the political scientist James C. Scott argued that one reason is that only certain crops make states possible. Cereals such as wheat, barley, rice, and maize ripen at the same time, grow above ground where they can be seen, and can be dried, stored, measured, and transported. That makes them easy to tax. Root crops such as cassava or potatoes can be left in the ground and harvested as needed, which makes them hard for a tax collector to assess. Scott points out that no early state was built on root crops. Early states were grain states, and many people avoided them when they could.

In *The Dawn of Everything* (2021), David Graeber and David Wengrow pushed further, arguing that early farmers often practised what they called "play farming" for centuries without committing to it, and that many prehistoric societies moved deliberately between different political arrangements, sometimes seasonally. Their book has been criticised by many archaeologists for selective use of evidence, but it has helped popularise the point that the road from farming to kings was neither straight nor inevitable.

```checkpoint
q: What did Kohler and colleagues' study of house sizes suggest about farming and inequality?
a*: That inequality rose slowly after farming began, and much higher in Eurasia, where large draught animals allowed some households to farm more land.
a: That inequality appeared immediately and at the same level wherever farming began.
x: The study found inequality rose slowly and to very different levels in different regions.
a: That farming societies were always more equal than foraging ones.
x: The study measured inequality among farming sites and found it generally increasing over time, not lower than among foragers.
a: That house size has no relationship with wealth.
x: The study used house size as its measure of wealth because larger houses generally indicate greater wealth in these contexts.
hint: Compare the Old World and the New World in the study.
why: Inequality was not an automatic result of farming. It grew over thousands of years and depended on particular technologies, especially draught animals.
---
q: Why, according to James C. Scott, did the earliest states depend on cereal crops?
a: Because cereals provide more calories per hectare than any other crop.
x: Scott's argument is not about calories. Some root crops are very productive; the issue is whether a crop can be taxed.
a: Because cereals were the only crops that had been domesticated.
x: Many other crops had been domesticated, including roots and tubers. Scott's question is why states formed around grain specifically.
a*: Because cereals ripen together, are visible, and can be stored and measured, which makes them easy for officials to assess and tax.
a: Because root crops cannot be stored at all.
x: Some root crops can be stored. Scott's point is that tubers left in the ground are hard to count and confiscate.
hint: Think like a tax collector.
why: Scott argues that legibility, how easily a crop can be counted and seized, made grain the foundation of the first states.
```

## How Farming Spread

Once farming existed, how did it reach other regions? There are two basic possibilities. **Demic diffusion** means that farmers themselves migrated, bringing crops and animals with them. **Cultural diffusion** means that local foragers adopted crops and techniques from neighbours. For a century archaeologists argued about which was more important, mainly by studying pottery styles and tool types.

Ancient DNA has settled the question for Europe. Genomes from early European farmers show that their ancestry came largely from farmers in Anatolia and the Aegean, who spread across Europe from about 8,500 years ago, reaching Britain around 4000 BCE. They mixed with local hunter-gatherers, whose share of the population's ancestry grew over the following centuries. In Europe, farming spread mainly by migration. A second large migration, of people with ancestry from the Pontic–Caspian steppe around 5,000 years ago, reshaped European populations again. In Britain, people associated with the Beaker culture replaced around 90 per cent of the existing gene pool within a few centuries after about 2500 BCE.

Similar large-scale movements of farmers carried agriculture elsewhere. **Bantu-speaking** farmers spread from the region of modern Cameroon and Nigeria across much of central, eastern, and southern Africa over the last 5,000 years, eventually bringing iron working as well. **Austronesian-speaking** farmers and sailors spread from Taiwan, about 5,000 years ago, through the Philippines and Indonesia and eventually across the Pacific to Hawai'i and Rapa Nui, and westward to Madagascar. Some archaeologists and linguists, notably Peter Bellwood and Colin Renfrew, have argued that many of the world's great language families spread with farming.

In other places, foragers adopted farming themselves, or chose not to. Along the Baltic coast, hunter-gatherers lived beside farmers for well over a thousand years before adopting farming, and in many regions foraging and farming coexisted for millennia. Farming did not sweep everything before it. Where it spread, it often did so through population growth and migration rather than persuasion.

```checkpoint
q: What has ancient DNA shown about how farming spread into Europe?
a: That European hunter-gatherers independently invented farming.
x: Genomes of early European farmers show ancestry mainly from Anatolia and the Aegean, which points to migration rather than independent invention.
a: That farming spread entirely through trade, with no movement of people.
x: The genetic evidence shows substantial movement of people, which rules out a purely cultural spread.
a: That modern Europeans have no hunter-gatherer ancestry.
x: Farmers mixed with hunter-gatherers, so modern Europeans carry hunter-gatherer ancestry alongside farmer and steppe ancestry.
a*: That farming spread mainly through the migration of farmers from Anatolia and the Aegean, who then mixed with local hunter-gatherers.
hint: Whose genes do early European farmers carry?
why: Ancient genomes show a large movement of people from Anatolia and the Aegean, settling a long debate between demic and cultural diffusion.
---
q: What do the Bantu and Austronesian expansions have in common?
a: Both spread farming entirely by trade without the movement of people.
x: Both are associated with large-scale movement of farming populations.
a*: Both involved the migration of farming peoples over very large areas, spreading languages as well as crops.
a: Both began in Europe and spread to other continents.
x: The Bantu expansion began in west-central Africa and the Austronesian expansion in Taiwan.
a: Both were driven by the domestication of the horse.
x: Neither expansion relied on horses. The Austronesian expansion depended on sailing canoes.
hint: Think about what moved with the farmers.
why: Both expansions carried farming, people, and language families across vast regions, an example of farming spreading through demographic expansion.
```

## Herders and the Secondary Products Revolution

Animals were first domesticated for meat. In 1981 the archaeologist Andrew Sherratt argued that a **"secondary products revolution"** followed some thousands of years later, as people began to exploit animals for products that did not require killing them: milk, wool, and their strength for ploughing and pulling carts. This greatly increased the value of livestock and made new ways of life possible, including **pastoralism**, a way of life based mainly on herding that could use dry grasslands and mountains unsuitable for crops.

Milk raises a revealing puzzle. Most adult mammals, including most humans, lose the ability to digest lactose, the sugar in milk, after weaning. **Lactase persistence**, the ability to digest it in adulthood, evolved independently in several dairying populations in Europe, Africa, and the Middle East. A 2022 study led by Richard Evershed, combining milk residues in ancient pottery with ancient DNA, found that people in Europe were using milk for thousands of years before lactase persistence became common. It concluded that the gene spread fastest during periods of famine and disease, when people who could not digest milk suffered most. Farming changed human biology as well as the biology of plants and animals.

Domestication did not always begin with farmers. **Dogs** were domesticated from wolves by foragers more than 15,000 years ago; a dog buried with two people at Bonn-Oberkassel in Germany is about 14,000 years old. **Horses** were domesticated much later; ancient DNA traces the lineage of modern domestic horses to the steppe of the lower Volga and Don rivers around 2200 BCE.

```checkpoint
q: What did the 2022 study of milk use and lactase persistence find?
a: That lactase persistence evolved before people began using milk.
x: The sequence was the reverse. Milk was used for thousands of years before lactase persistence became common.
a: That lactase persistence is equally common in all human populations.
x: Lactase persistence varies widely, being common in some dairying populations and rare in many others.
a*: That people used milk for thousands of years before the ability to digest it as adults became common, and that the gene spread fastest in times of famine and disease.
a: That milk was never consumed in prehistoric Europe.
x: Residues in ancient pottery show that milk products were widely used in prehistoric Europe.
hint: Compare when milk residues appear with when the gene became common.
why: The study shows that people adapted to milk culturally, through cheese and fermented products, long before natural selection favoured lactase persistence under the pressure of famine and disease.
---
q: Which animal was domesticated by foragers rather than farmers?
a*: The dog.
a: The goat.
x: Goats were domesticated by early farming communities in southwest Asia.
a: The horse.
x: Horses were domesticated by steppe peoples thousands of years after farming began.
a: The cow.
x: Cattle were domesticated by farming communities in southwest Asia and separately in South Asia.
hint: Which domestication happened before the end of the Ice Age?
why: Dogs were domesticated from wolves more than 15,000 years ago, long before farming, showing that domestication did not begin with agriculture.
```

## A Trap, Not a Choice

Why, then, did people farm? The question assumes a decision, and the evidence suggests that no one ever made one. Foragers who tended wild stands of cereals, kept a few animals, and settled near reliable food were making sensible short-term choices. Each step made the next one more likely. Settled life allowed more children. More people needed more food, which encouraged more intensive cultivation. Domesticated plants and animals came to depend on people and people on them. Once a population had grown on the basis of farming, it could not go back to foraging without most of its members starving. The transition worked like a ratchet, easy to turn forward and almost impossible to reverse.

That makes the Neolithic Revolution one of the clearest examples in history of a change whose overall consequences nobody intended. It also makes it the foundation of nearly everything that follows in this subject. The villages of the Fertile Crescent would become the cities of Mesopotamia. Grain surpluses would feed priests, soldiers, and scribes, and the need to record those surpluses would lead to writing itself. The next block, *The First Civilizations*, begins there.

## Further exploration

- **V. Gordon Childe, *Man Makes Himself* (1936).** The book that named the Neolithic Revolution, still worth reading as a classic of its time.
- **James C. Scott, *Against the Grain: A Deep History of the Earliest States* (2017).** A provocative argument about grain, taxation, and the long gap between farming and the state.
- **Peter Bellwood, *First Farmers: The Origins of Agricultural Societies* (2005).** A global survey linking the spread of farming with the spread of languages.
- **Ian Hodder, *The Leopard's Tale: Revealing the Mysteries of Çatalhöyük* (2006).** The excavator's account of one of the world's most remarkable early villages.
- **David Graeber and David Wengrow, *The Dawn of Everything* (2021).** A wide-ranging and contested challenge to the standard story of farming and inequality.
- **Jared Diamond, *Guns, Germs, and Steel* (1997).** Influential and much-criticised; best read alongside its critics.
- **David Reich, *Who We Are and How We Got Here* (2018).** Includes the ancient-DNA evidence for how farming spread into Europe.$neolithic_master$,
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
  select $neolithic_quiz$[
    {"type": "mcq", "prompt": "Why does the chapter describe the 'Neolithic Revolution' as misleading about speed?", "options": ["Because farming was invented in a single year", "Because domestication was protracted, taking one to two thousand years or more in each region", "Because farming was abandoned and reinvented many times", "Because the term was invented by Jared Diamond"], "answerIndex": 1, "explanation": "Archaeobotanical evidence shows domesticated traits spreading slowly over many centuries; the change was revolutionary in effect but gradual in pace.", "id": "q1"},
    {"type": "mcq", "prompt": "In how many regions do researchers think farming was invented independently?", "options": ["Only one, the Fertile Crescent", "Two: the Fertile Crescent and China", "Every region with human settlement", "At least seven, and possibly a dozen or more"], "answerIndex": 3, "explanation": "Independent centres include southwest Asia, China, New Guinea, Mesoamerica, South America, Africa, and eastern North America.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Bocquet-Appel's 'Neolithic demographic transition' explain?", "options": ["Why farming populations grew faster despite worse health: higher birth rates through shorter birth intervals", "Why farmers lived longer than foragers", "Why populations fell after farming began", "Why foragers had more children than farmers"], "answerIndex": 0, "explanation": "Cemetery evidence shows more children after farming began. Settled life and weaning foods shortened birth intervals, so farming populations outgrew foragers.", "id": "q3"},
    {"type": "mcq", "prompt": "According to James C. Scott, why were the earliest states 'grain states'?", "options": ["Because grain was the most nutritious food", "Because root crops had not yet been domesticated", "Because cereals ripen together, grow visibly, and can be stored and measured, making them easy to tax", "Because grain was used as money everywhere"], "answerIndex": 2, "explanation": "Scott's argument concerns legibility: officials could assess, collect, and store grain far more easily than crops left in the ground.", "id": "q4"},
    {"type": "open", "prompt": "The chapter calls the Neolithic Revolution 'a trap, not a choice'. Explain this argument and assess whether you find it convincing.", "rubric": "A strong answer explains the ratchet: small, sensible short-term steps (tending wild cereals, settling near rich resources) increased population and dependence on cultivated plants and animals; once populations grew, returning to foraging was impossible without mass starvation; so no one ever 'decided' to farm. It uses evidence from the chapter, such as protracted domestication, worse skeletal health, and the demographic transition. A strong assessment considers counter-evidence or qualifications, such as foragers who coexisted with farmers for long periods or chose not to farm (the Baltic), Graeber and Wengrow's 'play farming', and regional variation.", "id": "q5"},
    {"type": "open", "prompt": "How did ancient DNA resolve the debate between demic and cultural diffusion for the spread of farming into Europe, and what does the comparison with the Baltic suggest?", "rubric": "A strong answer defines demic diffusion (farmers migrating) and cultural diffusion (foragers adopting farming), explains that genomes of early European farmers show mainly Anatolian and Aegean ancestry, with hunter-gatherer ancestry increasing later through mixing, so farming spread mainly by migration. It notes later population turnover (steppe ancestry; the Beaker replacement of about 90 per cent of Britain's gene pool). It uses the Baltic case, where hunter-gatherers lived beside farmers for over a millennium before adopting farming, to show that the process varied regionally and was not always a simple replacement.", "id": "q6"}
  ]$neolithic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/before-writing/neolithic-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
