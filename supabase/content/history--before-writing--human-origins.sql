-- Human Origins and the Peopling of the Earth — canonical master article, co-written and human-reviewed.
-- history/before-writing/human-origins @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- From an African origin about 300,000 years ago to every continent but
-- Antarctica: other humans, interbreeding, the dispersal, symbolic minds,
-- Sahul, the Americas, the Ice Age world, and how foragers lived. Interleaved
-- checkpoint self-tests after each major section.
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
    'history/before-writing/human-origins',
    'research',
    'advanced',
    'read',
    $origins_master$> **The peopling of the Earth** is the story of how one species, *Homo sapiens*, which evolved in Africa some 300,000 years ago, came to live on every continent except Antarctica. It crossed open sea to Australia, walked across a land bridge into the Americas, and absorbed or outlasted every other kind of human it met. Almost none of this story was known in 1980. It has been reconstructed since from fossils, stone tools, art, and above all ancient DNA, and its most important conclusion is the simplest: every living person belongs to one young, closely related, African-descended family.

## One Human Species Among Several

For most of the last two million years there was more than one kind of human on Earth. *Homo erectus* had left Africa by about 1.8 million years ago; its remains at Dmanisi in Georgia are that old, and its descendants spread as far as Java and China. Over the following hundreds of thousands of years, populations in different regions diverged. **Neanderthals** evolved in Europe and western Asia. Their eastern relatives, the **Denisovans**, were first identified in 2010 not from a skeleton but from the DNA in a single finger bone found in Denisova Cave in Siberia. On islands, small-bodied humans evolved in isolation: *Homo floresiensis* on Flores in Indonesia, nicknamed "the hobbit", which survived until at least about 50,000 years ago, and *Homo luzonensis* in the Philippines. In southern Africa, the small-brained *Homo naledi* was alive between roughly 335,000 and 236,000 years ago, at the same time as early *Homo sapiens*.

The old image of human evolution as a single line marching from ape to modern human is therefore wrong. The real picture is a bushy family tree with many branches alive at once, and with branches that occasionally grew back together through interbreeding. *Homo sapiens* is the only branch still living, which makes it easy to forget how recent and unusual that solitude is.

```checkpoint
q: Which statement best reflects current understanding of human evolution?
a*: For most of the last two million years several kinds of human coexisted, and Homo sapiens is the only one that survives.
a: Humans evolved in a single line, each species replacing the one before it.
x: This "march of progress" picture is the one the evidence has overturned. Several human species lived at the same time, sometimes in the same regions.
a: Homo sapiens evolved separately in Africa, Europe, and Asia from local Homo erectus populations.
x: This is the old "multiregional" model in its strong form. Fossil and genetic evidence points to a recent African origin for Homo sapiens, with only limited interbreeding with other humans.
a: Neanderthals were the direct ancestors of modern Europeans.
x: Neanderthals were a separate population that diverged from our ancestors hundreds of thousands of years ago. Modern non-Africans carry a small share of Neanderthal DNA from interbreeding, not direct descent.
hint: Think of a bush rather than a ladder.
why: Fossils such as Homo naledi and Homo floresiensis, and the genetic discovery of the Denisovans, show many human lineages alive at once. Our species' status as the only human is recent.
---
q: How were the Denisovans first identified?
a: From a complete skeleton excavated in Siberia.
x: No complete Denisovan skeleton has been found. Their discovery was unusual precisely because it did not depend on skeletal remains.
a: From cave paintings depicting a distinct human type.
x: Art cannot identify a population genetically. The Denisovans were recognised from biological evidence.
a*: From the DNA extracted from a single finger bone found in Denisova Cave.
a: From written accounts by early Homo sapiens.
x: The Denisovans lived tens of thousands of years before writing existed.
hint: The discovery was made in a genetics laboratory.
why: The Denisovans were the first human population identified primarily from ancient DNA, an example of how genetics now reveals what the fossil record alone could not.
```

## An African Origin

The oldest fossils attributed to *Homo sapiens* come from **Jebel Irhoud** in Morocco, dated in 2017 to about 300,000 years ago (the published estimate was roughly 315,000). Their faces look strikingly modern; their braincases are longer and lower than ours, and the globular skull shape typical of living people appears to have developed gradually afterwards. Other early fossils come from the opposite side of the continent, at Omo Kibish in Ethiopia, now dated to at least about 233,000 years ago, and from Florisbad in South Africa.

The wide spread of these sites has changed how origins are pictured. Instead of a single cradle in East Africa, many researchers now favour a **pan-African model**, in which *Homo sapiens* emerged from a network of populations across the continent that were sometimes isolated by deserts and forests and sometimes reconnected, exchanging genes and ideas over hundreds of thousands of years. The model fits the archaeological record, in which new tool-making techniques appear in different parts of Africa at different times rather than spreading from one centre.

Genetics points the same way. Africa holds by far the greatest human genetic diversity: two populations within Africa can differ more from each other than either differs from Europeans or East Asians. That is the signature an African homeland would leave, since the people who left Africa took only a part of the continent's genetic variation with them. One consequence matters for all later history. The visible differences used to sort people into "races" are a thin, recent, and geographically variable layer on top of a shared ancestry, and they do not correspond to deep biological divisions.

{{image: Jebel Irhoud | Fossils from Jebel Irhoud in Morocco, dated to about 300,000 years ago, are the oldest known remains attributed to Homo sapiens, and their location far from East Africa supports a continent-wide origin.}}

```checkpoint
q: Why is the location of the Jebel Irhoud fossils significant?
a: It proves Homo sapiens evolved in North Africa and spread south.
x: One site cannot establish a single point of origin. Other early fossils come from Ethiopia and South Africa.
a*: Together with early fossils in Ethiopia and South Africa, it suggests Homo sapiens emerged across Africa rather than in a single region.
a: It shows Homo sapiens evolved outside Africa and later migrated in.
x: Morocco is in Africa. The find strengthens, rather than weakens, the case for an African origin.
a: It shows that early Homo sapiens had fully modern skulls by 300,000 years ago.
x: The Jebel Irhoud faces are modern-looking, but their braincases are not. The modern rounded skull developed later.
hint: Look at where the other early sites are.
why: Early fossils at opposite ends of the continent support the pan-African model, in which our species emerged from interconnected populations across Africa.
---
q: Why does greater genetic diversity in Africa support an African origin for Homo sapiens?
a: Because African environments caused faster genetic mutation.
x: Mutation rates are broadly similar across human populations. The pattern reflects population history, not different mutation speeds.
a: Because Africa was settled more recently than other continents.
x: It is the reverse. More diversity indicates a longer history of human populations, not a shorter one.
a: Because African populations interbred more with Neanderthals.
x: Neanderthal ancestry is found mainly outside Africa, because interbreeding happened after people left. It does not explain Africa's higher diversity.
a*: Because populations that left Africa carried only part of the continent's variation, so the longest-established populations retain the most diversity.
hint: Think about what a small group of emigrants takes with them.
why: Each migration from a homeland carries a sample of its genetic variation. The homeland keeps the most diversity, which is the pattern seen in Africa.
```

## Leaving Africa

*Homo sapiens* left Africa more than once. A jawbone from **Misliya Cave** in Israel, dated to roughly 177,000 to 194,000 years ago, and burials at **Skhul and Qafzeh**, also in Israel, from about 120,000 to 90,000 years ago, show modern humans in southwest Asia long before the main dispersal. A disputed skull fragment from Apidima in Greece may be older still. These early groups seem to have left little or no trace in the ancestry of living people. They were, in effect, failed or absorbed expeditions.

The dispersal that produced nearly all living non-Africans came later, sometime after about 60,000 years ago. Its people spread quickly, reaching Australia by at least about 50,000 years ago and Europe by about 45,000 years ago. Two routes are debated: a southern route along the coasts of Arabia and South Asia, and a northern route through the Levant. The answer may be both.

Ancient DNA has made this chronology much sharper. In 2024, researchers sequenced genomes from people buried at **Ranis** in Germany around 45,000 years ago, and found they belonged to the same small population as a woman from **Zlatý kůň** in the Czech Republic. These people represent the earliest known branch of the out-of-Africa population, and they left no descendants among living people. Their genomes also date the moment when the ancestors of all non-Africans interbred with Neanderthals: a single extended period of mixing roughly 45,000 to 49,000 years ago. Every living person of non-African ancestry carries the trace of that encounter.

```checkpoint
q: What do the fossils from Misliya, Skhul, and Qafzeh show about Homo sapiens leaving Africa?
a: That the ancestors of all living non-Africans left Africa about 180,000 years ago.
x: These early groups seem to have contributed little or nothing to living populations. The main ancestral dispersal came after about 60,000 years ago.
a: That Homo sapiens evolved in the Levant and then moved into Africa.
x: Earlier fossils in Africa, at Jebel Irhoud and Omo, place our origins in Africa. The Levant sites record movement out of it.
a*: That modern humans left Africa more than once, and that some early dispersals left little trace in living people.
a: That modern humans never met Neanderthals in southwest Asia.
x: The Levant was a meeting zone; Neanderthals and modern humans both used it, at different times and possibly together.
hint: Compare the dates of these sites with the main dispersal.
why: The Levant fossils show early ventures out of Africa. Genetics shows that the population ancestral to living non-Africans left much later.
---
q: What did the 2024 genomes from Ranis and Zlatý kůň help establish?
a*: That the Neanderthal ancestry shared by all non-Africans came from a mixing period roughly 45,000 to 49,000 years ago.
a: That Neanderthals were the ancestors of modern Europeans.
x: The genomes show mixing between separate populations, not descent from Neanderthals.
a: That all living Europeans descend directly from the Ranis population.
x: The Ranis population left no known descendants among living people. Its importance is as an early branch, not an ancestor.
a: That interbreeding with Neanderthals happened repeatedly over 200,000 years.
x: The genomes point to a single extended period of mixing shared by all non-Africans, dated to about 45,000–49,000 years ago.
hint: These are the oldest high-quality modern-human genomes from Europe.
why: Because the Ranis people lived close to the time of mixing, the length of the Neanderthal segments in their DNA allowed the mixing to be dated precisely.
```

## Meeting the Other Humans

The encounter with Neanderthals left a measurable inheritance: about 2 per cent of the genome of people with ancestry outside Africa derives from them. Some of those genes appear to have helped modern humans adapt to new environments, affecting skin, hair, and immune responses. Others were harmful and have been steadily removed by natural selection. Through later back-migrations, some Neanderthal ancestry also reached populations within Africa.

The Denisovans left an even stranger legacy. They are known from only a handful of fossils, including the finger bone, some teeth, a jaw from Tibet, and, as protein and DNA studies showed in 2025, a well-preserved skull from **Harbin** in northeast China at least 146,000 years old, which had previously been assigned to a separate species. Yet people in Papua New Guinea and Aboriginal Australians carry several per cent Denisovan DNA, and a Denisovan version of the gene *EPAS1* helps Tibetans live at high altitude. The genome of a girl from Denisova Cave, published in 2018, showed that she had a Neanderthal mother and a Denisovan father. These populations were not separate species in the strict sense of being unable to interbreed. They were human populations that had been apart for hundreds of thousands of years.

Neanderthals disappear from the archaeological record around 40,000 years ago, a few thousand years after modern humans arrived in Europe. Why they vanished is still debated. Explanations include competition with incoming modern humans, small and fragmented populations that were vulnerable to bad luck and inbreeding, climate swings, and absorption through interbreeding. Most specialists think several factors combined. The once-popular idea that Neanderthals were simply too stupid to survive has not held up. They made sophisticated tools, controlled fire, cared for injured members of their group, buried at least some of their dead, and may have made simple symbolic marks.

```checkpoint
q: Why do people in Papua New Guinea carry Denisovan DNA, although Denisovan fossils are known mainly from Siberia and China?
a: Because Denisovans migrated to Papua New Guinea and replaced the local population.
x: Living Papuans are overwhelmingly descended from modern humans. The Denisovan share is a few per cent, which indicates mixing, not replacement.
a: Because the Denisovan DNA was introduced in the last few centuries by contact with Asia.
x: The Denisovan segments in Papuan genomes are ancient, the result of mixing tens of thousands of years ago.
a: Because Papuans descend from a separate out-of-Africa migration that was mainly Denisovan.
x: Papuans descend from the same broad out-of-Africa population as other non-Africans, with extra Denisovan mixing along the way.
a*: Because the ancestors of Papuans interbred with Denisovan populations somewhere in Asia during their migration, and the fossil record of where Denisovans lived is very incomplete.
hint: The fossil record shows where bones survived and were found, not everywhere a population lived.
why: Genetic evidence reveals mixing in places and times the sparse fossil record cannot document, which is why Denisovan ancestry is highest far from the few Denisovan fossil sites.
---
q: Which explanation of Neanderthal extinction is best supported by current evidence?
a: Neanderthals lacked the intelligence to make tools or use fire.
x: Neanderthals made sophisticated tools and controlled fire. The "dim-witted cave man" image is outdated.
a*: Several factors probably combined, including small fragmented populations, competition with modern humans, climate instability, and absorption through interbreeding.
a: A single catastrophic volcanic eruption wiped them out in one year.
x: No single catastrophe explains a disappearance that took place across Europe and Asia over thousands of years.
a: They were all killed in deliberate warfare by modern humans.
x: There is no evidence of systematic warfare. Competition and demographic weakness are better supported than organised extermination.
hint: Most specialists avoid single-cause explanations here.
why: The evidence fits a gradual disappearance of small populations under several pressures, rather than one decisive cause.
```

## Minds Without Writing

When did people begin to think the way living humans do, with language, symbols, art, and long-term planning? For much of the twentieth century the standard answer was a **"human revolution"** around 50,000–40,000 years ago, marked by the sudden appearance in Europe of cave art, carved figurines, musical instruments, and elaborate burials at the start of the period archaeologists call the Upper Palaeolithic. The carved ivory "Lion Man" from Hohlenstein-Stadel in Germany, about 40,000 years old, and the bone flutes from Hohle Fels nearby seemed to mark a sudden awakening.

That picture has been overturned, largely by evidence from Africa and Asia. In 2000 the archaeologists Sally McBrearty and Alison Brooks published "The revolution that wasn't", arguing that the components of modern behaviour appear gradually in Africa over the previous 200,000 years. At **Blombos Cave** in South Africa, pieces of ochre engraved with cross-hatched patterns date to roughly 75,000 years ago, alongside shell beads. Shell beads from Morocco may be as much as 140,000 years old. The European "revolution" looked sudden partly because Europe had been studied far more intensively than anywhere else, and because modern humans arrived there with these behaviours already developed.

Asia has upended the chronology of art itself. On the Indonesian island of Sulawesi, a painting at **Leang Tedongnge** of a life-size warty pig was dated in 2021 to at least 45,500 years ago. In 2024 a panel at **Leang Karampuang** showing human-like figures interacting with a pig was dated to at least 51,200 years ago, the oldest known figurative art and, apparently, the oldest known picture that tells a story. The great painted caves of Europe, such as **Chauvet** in France, with its lions, rhinoceroses, and horses painted about 36,000 years ago, are spectacular, but they are neither the first nor the only.

What these images and objects meant to the people who made them is unrecoverable with certainty. Interpretations range from hunting magic and shamanic ritual to storytelling, teaching, and simple pleasure. What can be said is that the capacity for symbolic thought is old, widespread, and shared by all living human populations, and that the evidence for it is limited mainly by what has survived and where archaeologists have looked.

{{image: Chauvet Cave | Painted horses in Chauvet Cave, France, made about 36,000 years ago. Once thought to mark the dawn of human art, they are now known to be younger than paintings in Sulawesi.}}

```checkpoint
q: Why has the idea of a sudden "human revolution" in Europe around 50,000–40,000 years ago been largely abandoned?
a: Because European cave art has been shown to be a modern forgery.
x: The European art is genuine and securely dated. The problem lies in treating it as the beginning of symbolic behaviour.
a*: Because evidence from Africa and Asia shows symbolic behaviour appearing earlier and more gradually, and Europe's record looked sudden partly because it was studied most.
a: Because Neanderthals, not modern humans, made all European cave art.
x: The great European painted caves are attributed to modern humans. Possible Neanderthal symbolism is a separate, much-debated question.
a: Because genetic evidence shows modern humans never reached Europe.
x: Modern humans reached Europe by about 45,000 years ago; the Ranis genomes are one piece of direct evidence.
hint: Consider where archaeologists had done most of their digging.
why: Engraved ochre and beads in Africa and figurative art in Sulawesi predate the European record, showing that the "revolution" was an artefact of uneven research.
---
q: What does the Leang Karampuang painting on Sulawesi show?
a: The earliest known depiction of farming.
x: The painting is around 40,000 years older than the first farming. It shows human-like figures and a pig.
a: That figurative art began in Europe and spread to Asia.
x: The Sulawesi painting is older than any known European figurative art, which undermines the idea of a European origin.
a: That the painters were Denisovans.
x: Nothing links the painting to Denisovans. It is attributed to modern humans, who had reached the region by this time.
a*: That figurative, narrative art existed at least 51,200 years ago, far from Europe.
hint: The 2024 date was a minimum age from mineral crusts over the paint.
why: Dated to at least 51,200 years ago, the panel is the oldest known figurative art and suggests storytelling through images was already established as modern humans spread through Asia.
```

## Across the Sea to Sahul

At the height of the ice ages, Australia, New Guinea, and Tasmania formed a single continent, **Sahul**, and much of Southeast Asia formed another, **Sunda**. Even at the lowest sea levels, the islands between them, a region called Wallacea, were never joined to either, so reaching Sahul required several open-water crossings, at least one probably of several tens of kilometres, out of sight of land. These are among the earliest firm evidence of seafaring anywhere. They imply boats or rafts, planning, and groups large enough to found a population.

People reached Sahul at least 50,000 years ago. A rock shelter at **Madjedbebe** in northern Australia has been dated to about 65,000 years ago, a claim that some archaeologists accept and others dispute. At **Lake Mungo** in New South Wales, the burials known as Mungo Lady and Mungo Man, around 40,000–42,000 years old, include the oldest known ritual cremation and a body sprinkled with ochre. Aboriginal Australians are the descendants of these first arrivals. Their cultures represent one of the longest continuous human traditions in the world, and the return of the Mungo remains to their traditional custodians in 2017 is a reminder that the deep past is also the ancestry of living people.

## Into the Americas

The Americas were the last continents reached by humans, and their peopling has been one of the most bitterly argued questions in archaeology. For much of the twentieth century the dominant model was **"Clovis first"**. Distinctive fluted spear points found from the 1930s onwards, dating to about 13,000 years ago, were thought to mark the first people, big-game hunters who walked from Siberia across the land bridge of **Beringia** and through an ice-free corridor between the North American ice sheets.

The model collapsed in stages. At **Monte Verde** in southern Chile, the archaeologist Tom Dillehay excavated a camp, with wooden structures, plant remains, and even a footprint, dated to about 14,500 years ago, far to the south of any land bridge. After years of resistance, a group of leading sceptics visited the site in 1997 and accepted it. Human coprolites (fossilised faeces) from the Paisley Caves in Oregon gave similar dates. Then, in 2021, fossilised human footprints at **White Sands** in New Mexico were dated to between about 23,000 and 21,000 years ago, during the Last Glacial Maximum, when the ice-free corridor was closed. The original dates came from seeds of aquatic plants, which critics argued might give misleadingly old results, but two independent methods, pollen dating and optically stimulated luminescence on quartz grains, confirmed them in 2023.

Genetics adds its own chronology. The ancestors of Native Americans separated from East Asian populations perhaps 25,000–20,000 years ago, and then appear to have lived in relative isolation, possibly in Beringia itself, for several thousand years, a scenario known as the **"Beringian standstill"**. Many researchers now favour a route down the Pacific coast, by boat or on foot along the shoreline, exploiting rich marine resources, sometimes called the "kelp highway". Claims for much earlier arrivals, such as a site in California claimed to be 130,000 years old, are rejected by most specialists. The question is no longer whether people arrived before Clovis, but how long before, and by what route.

{{image: Monte Verde | Monte Verde in southern Chile, where a camp dated to about 14,500 years ago overturned the "Clovis first" model of the peopling of the Americas.}}

```checkpoint
q: Why did the White Sands footprints matter so much for the "Clovis first" debate?
a*: Dated to roughly 23,000–21,000 years ago, they place people in North America during the Last Glacial Maximum, long before Clovis and when the ice-free corridor was closed.
a: They showed that Clovis people made footprints, confirming the model.
x: The footprints are thousands of years older than Clovis, so they undermine the model rather than confirm it.
a: They proved people reached the Americas 130,000 years ago.
x: The White Sands dates are about 21,000–23,000 years. Claims of 130,000-year-old sites are rejected by most specialists.
a: They showed that people reached South America before North America.
x: White Sands is in New Mexico. It concerns early presence in North America, not the order of arrival.
hint: Compare the footprint dates with the 13,000-year Clovis date.
why: Footprints from the Last Glacial Maximum are hard to reconcile with a migration through a corridor that was closed, and push human presence back by about 8,000 years.
---
q: What was the main reason for the original scepticism about the White Sands dates, and how was it addressed?
a: The footprints might have been made by animals; DNA tests confirmed they were human.
x: The footprints' human origin was not the main dispute, and no DNA was recovered. The dispute concerned dating.
a: The site had been disturbed by construction; new excavations found undisturbed layers.
x: The objection concerned the material used for radiocarbon dating, not disturbance.
a*: The radiocarbon dates came from aquatic plant seeds that could give misleadingly old results; independent dating of pollen and quartz grains confirmed the age.
a: The footprints were too faint to measure; 3D scanning resolved the problem.
x: The prints were clear. The question was how old the sediments containing them were.
hint: Aquatic plants can take up "old" carbon from water.
why: Corroboration by independent methods, a principle from source criticism, is what turned a contested date into a widely accepted one.
```

## The Ice Age World

The people who spread across the Earth did so in a world very different from today's. During the **Last Glacial Maximum**, roughly 26,000 to 19,000 years ago, ice sheets kilometres thick covered much of North America and northern Europe, and sea levels were about 120 metres lower than now. Land bridges joined Britain to Europe across what is now the North Sea (a lost landscape called Doggerland), Siberia to Alaska, and New Guinea to Australia. Much of the evidence of coastal life from this period now lies under the sea, one reason that coastal migration routes are hard to prove.

The world also held many more large animals than it does now: mammoths, giant ground sloths, sabre-toothed cats, giant kangaroos, wombat-like diprotodons, and dozens of other genera. Most disappeared in the late Pleistocene. In 1967 the geoscientist Paul Martin proposed the **overkill hypothesis**, that newly arrived human hunters drove them to extinction. The pattern of timing gives it support: large animals disappeared in Australia not long after people arrived, around 45,000–40,000 years ago, and in the Americas around 13,000–11,000 years ago, again soon after human arrival. In Africa, where large animals had evolved alongside humans for a very long time, far fewer were lost. Against this, the American extinctions also coincided with sharp climate change at the end of the Ice Age, and some species declined before people could have reached them. Most researchers now see human hunting and climate change as working together, with the balance differing by region. Either way, the extinctions are an early example of humans reshaping their environment on a continental scale.

```checkpoint
q: Which piece of evidence most strongly supports a human role in the late Pleistocene megafaunal extinctions?
a: Extinctions happened at the same time on every continent.
x: They did not. The point is that their timing differed by continent, in a way that tracks human arrival.
a: African megafauna suffered the heaviest losses.
x: Africa lost comparatively few large animals, which supporters of the hypothesis explain by long coevolution with humans.
a: Cave paintings show humans hunting every extinct species.
x: Art depicts some animals but cannot show the causes of extinction. The key evidence is chronological.
a*: In Australia and the Americas, large animals disappeared not long after humans arrived, at very different times on each continent.
hint: Line up the dates of extinction with the dates of human arrival.
why: Extinctions that follow human arrival on different continents at different times suggest humans were a key factor, even if climate change also played a role.
---
q: Why is evidence for coastal migration routes in the Ice Age particularly hard to find?
a: Because Ice Age people never lived on coasts.
x: Coasts were rich in food and probably attractive; the difficulty is preservation, not absence.
a*: Because sea levels were about 120 metres lower, so the Ice Age coastlines are now under water.
a: Because coastal sites are always destroyed by erosion within a few years.
x: Erosion is a problem, but the main issue is much larger than ordinary coastal erosion.
a: Because radiocarbon dating does not work near the sea.
x: Radiocarbon dating can be used on coastal sites, with corrections for marine carbon.
hint: Think about where the shoreline was 20,000 years ago.
why: Rising seas after the Ice Age drowned the old coasts, along with much of the evidence for people who lived and travelled along them.
```

## How Foragers Lived

For all of this period, every human being lived by **foraging**: hunting, fishing, and gathering wild plants. Reconstructing how they lived combines archaeology with comparison to foraging societies studied by anthropologists in the last two centuries, such as the Ju/'hoansi of the Kalahari, the Hadza of Tanzania, and Aboriginal Australian communities. That comparison must be made with care. Recent foragers live mostly in deserts, forests, and Arctic regions that farmers did not want, and they have long been in contact with farmers, traders, and states. They are evidence of what is possible for foragers, not snapshots of the Palaeolithic.

With that caution, several patterns stand out. Most recent foragers live in small, mobile bands with strong norms of **sharing** and active resistance to anyone who tries to dominate others; the anthropologist James Woodburn called such societies "immediate-return", meaning food is eaten soon after it is obtained rather than stored. In 1966 Marshall Sahlins provocatively called foragers "the original affluent society", arguing that they met their needs with fewer hours of work than farmers. Later studies have qualified this, since processing food and making tools take time too, but the basic point, that foraging was not a desperate struggle for survival, has largely stood.

Life was short on average but not for everyone. Child mortality was very high. A widely cited comparison of recent foragers by Michael Gurven and Hillard Kaplan (2007) found, however, that those who survived childhood commonly lived into their sixties and beyond. The question of **violence** is contested. Some sites show lethal conflict: at Jebel Sahaba in Sudan, about 13,400 years ago, many of the buried bear wounds from projectiles, and at Nataruk in Kenya, about 10,000 years ago, a group of men, women, and children appear to have been killed together. How common such violence was, and whether it increased with settled life, is still argued.

Not all foragers were mobile or egalitarian. At **Sungir** in Russia, about 34,000 years ago, two children and an adult were buried with thousands of mammoth-ivory beads that would have taken many thousands of hours to make, a hint of inherited status long before farming. Later foragers in Japan (the Jōmon) and on the northwest coast of North America lived in permanent villages, stored food, and developed marked social ranks. The deep past offers not one "natural" way of human life but many.

By the end of the last Ice Age, about 11,700 years ago, *Homo sapiens* lived on every continent but Antarctica, in a world population that was probably a few million. Within a few thousand years, in several places at once, some of them would begin to farm.

```checkpoint
q: Why must anthropologists' studies of recent foragers be used with caution as evidence for Palaeolithic life?
a: Because recent foragers are genetically different from Palaeolithic humans.
x: Recent foragers are fully modern humans like everyone else. The issue is their circumstances, not their biology.
a: Because recent foragers do not share food.
x: Sharing is in fact one of the most consistent features of recent foraging societies.
a*: Because they live mostly in marginal environments and have long been in contact with farmers and states, so they are not unchanged survivals of the past.
a: Because no anthropologist has ever studied a foraging society directly.
x: Many have, over long periods; the Ju/'hoansi and Hadza are among the best-studied societies on Earth.
hint: Where do recent foragers live, and who are their neighbours?
why: Ethnographic analogy shows what foraging societies can be like, but recent foragers live in specific modern contexts and cannot simply stand in for Ice Age populations.
---
q: What does the Sungir burial suggest about early human societies?
a*: That some foraging societies may have marked status in ways that included children, long before farming.
a: That all Palaeolithic societies were strictly egalitarian.
x: The Sungir burial is evidence against that assumption, since children received extraordinarily rich grave goods.
a: That mammoth ivory was a common, low-value material.
x: The value lies in the labour: thousands of beads would have taken many thousands of hours to make.
a: That farming had already begun 34,000 years ago.
x: There is no evidence of farming at Sungir, which belongs to a foraging society long before agriculture.
hint: Children cannot have earned such wealth themselves.
why: Lavish grave goods for children hint at status that was inherited or assigned, showing that social differentiation was possible among foragers.
```

## Further exploration

- **David Reich, *Who We Are and How We Got Here* (2018).** The genetic revolution in human origins, including the Neanderthal and Denisovan discoveries.
- **Svante Pääbo, *Neanderthal Man: In Search of Lost Genomes* (2014).** The sequencing of the Neanderthal genome, by the scientist who led it and later received the 2022 Nobel Prize.
- **Chris Stringer, *Lone Survivors: How We Came to Be the Only Humans on Earth* (2012).** Fossils, archaeology, and genetics on the origins of our species.
- **Rebecca Wragg Sykes, *Kindred: Neanderthal Life, Love, Death and Art* (2020).** A vivid, evidence-based portrait of the Neanderthals.
- **Jennifer Raff, *Origin: A Genetic History of the Americas* (2022).** The peopling of the Americas, including the collapse of "Clovis first".
- **Billy Griffiths, *Deep Time Dreaming: Uncovering Ancient Australia* (2018).** The archaeology of Aboriginal Australia and the history of how it was uncovered.$origins_master$,
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
  select $origins_quiz$[
    {"type": "mcq", "prompt": "Which statement best summarises current evidence on where Homo sapiens originated?", "options": ["In a single valley in East Africa about 200,000 years ago", "Across interconnected populations in Africa, with the oldest fossils (Jebel Irhoud, Morocco) about 300,000 years old", "Separately in Africa, Europe, and Asia from local Homo erectus", "In the Levant, before spreading into Africa"], "answerIndex": 1, "explanation": "Early fossils from Morocco, Ethiopia, and South Africa, plus Africa's high genetic diversity, support a pan-African origin.", "id": "q1"},
    {"type": "mcq", "prompt": "About what share of the genome of people with ancestry outside Africa derives from Neanderthals?", "options": ["About 2 per cent", "About 20 per cent", "About 50 per cent", "None at all"], "answerIndex": 0, "explanation": "Non-Africans carry roughly 2 per cent Neanderthal DNA from a period of mixing about 45,000–49,000 years ago.", "id": "q2"},
    {"type": "mcq", "prompt": "What overturned the 'Clovis first' model of the peopling of the Americas?", "options": ["The discovery of Clovis points in Siberia", "Genetic evidence that Native Americans came from Europe", "Written records from early Spanish explorers", "Sites such as Monte Verde (about 14,500 years old) and the White Sands footprints (about 23,000–21,000 years old), which predate Clovis"], "answerIndex": 3, "explanation": "Securely dated pre-Clovis sites, with White Sands confirmed by independent pollen and quartz dating, showed people arrived thousands of years before Clovis.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is the oldest securely dated figurative art significant for the 'human revolution' debate?", "options": ["It is in France, confirming a European origin for art", "It was made by Neanderthals", "It is in Sulawesi and at least 51,200 years old, older than any European figurative art", "It depicts the first farmers"], "answerIndex": 2, "explanation": "The Sulawesi painting undermines the idea that symbolic art began suddenly in Europe; with African evidence such as Blombos, it points to an older, more widespread capacity.", "id": "q4"},
    {"type": "open", "prompt": "Explain how ancient DNA has changed our understanding of the Neanderthals and Denisovans. Include at least two specific findings from the chapter.", "rubric": "A strong answer explains that ancient DNA revealed interbreeding (about 2 per cent Neanderthal ancestry in non-Africans, dated to roughly 45,000–49,000 years ago using the Ranis genomes) and identified the Denisovans from a finger bone before any substantial fossil was known. It may mention Denisovan ancestry in Papuans and Aboriginal Australians, the Denisovan EPAS1 variant in Tibetans, the 2018 genome of a girl with a Neanderthal mother and Denisovan father, or the 2025 identification of the Harbin skull as Denisovan. Better answers draw the conclusion that these were human populations rather than wholly separate species, and that genetics can reveal populations and events that fossils cannot.", "id": "q5"},
    {"type": "open", "prompt": "Why must modern foraging societies be used with care as evidence for how people lived in the Ice Age, and what can they still tell us?", "rubric": "A strong answer explains that recent foragers live mostly in marginal environments and have long been in contact with farmers, traders, and states, so they are not unchanged survivals of the past. It then identifies what they can still suggest when combined with archaeology: possibilities and patterns such as sharing norms, mobility, high child mortality but long adult lifespans for survivors, and work patterns (Sahlins's 'original affluent society' and its critics). The best answers note that the deep past also included non-egalitarian foragers (Sungir, Jōmon, the Pacific Northwest), so there was no single 'natural' way of life.", "id": "q6"}
  ]$origins_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/before-writing/human-origins', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
