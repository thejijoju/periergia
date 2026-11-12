-- Environmental History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/environmental-history @ research/advanced/read.
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
    'history/thematic-history/environmental-history',
    'research',
    'advanced',
    'read',
    $mn_envhist_master$> **The past, with the rest of nature put back in.** Environmental history studies human choices made within the limits, and under the pressures, of the non-human world: climate and rivers, forests and soils, microbes, animals and fuels. This chapter explains what the field is and how it arose, then shows how the work is done through worked examples: the Little Ice Age and the seventeenth-century crisis, China's rivers, India's forests and the Chipko movement, a misread African landscape, and Latin America's forests and fevers. It ends with the field's big arguments: whether its stories are too often tales of decline, whether any landscape was ever "pristine", and whether we live in an "Anthropocene", and if so whose.

## What environmental history is

There is no single accepted definition, but the most widely quoted is Donald Worster's of 1988: environmental history is the study of the "interaction between human cultures and the environment in the past". He divided the field into three clusters that are still a starting point: nature itself and its change over time; how humans have used nature; and what humans have thought about it, in ideas, ethics, laws and myths.

What makes the field distinctive is its evidence. Environmental historians read archives, but also tree rings, ice cores, pollen, glaciers and lake sediments.

The questions are old. Hippocrates' *Airs, Waters, Places* related peoples' temperaments to their surroundings, and Ibn Khaldun and Montesquieu treated climate as a key determinant of human behaviour. The modern field's most important ancestor was the French journal *Annales*, founded in 1929 by Lucien Febvre and Marc Bloch, which turned historians towards agriculture, demography and geography. Fernand Braudel's *The Mediterranean and the Mediterranean World in the Age of Philip II* (1949) began with "geographical time", the time of the environment, in which change is slow and almost imperceptible and history repeats itself in cycles. Emmanuel Le Roy Ladurie published a history of climate since the year 1000 (*Histoire du climat depuis l'an mil*) in 1967.

As a self-conscious field, though, environmental history first emerged in the United States out of the environmental movement of the 1960s and 1970s. Roderick Nash's *Wilderness and the American Mind* (1967) became a classic, and 1972 is generally taken as the year the term "environmental history" was coined. The American Society for Environmental History was founded in 1977; Europe followed with an institute at St Andrews in 1991 and a European society in 1999.

## The classics and the movement behind them

Three American scholars shaped the field's early agenda. Alfred W. Crosby coined the phrase "Columbian exchange" in 1972, and the chapter on The Columbian Exchange and the First Global Economy tells that story. His *Ecological Imperialism* (1986) went further, asking why Europeans managed to build settler societies in temperate lands across the world, the "Neo-Europes" of North America, Australia, New Zealand and southern South America. His answer was biological: the "portmanteau biota" of microbes, weeds, crops and livestock that travelled with Europeans devastated local populations and remade landscapes. Crosby explicitly rejected explanations based on innate European superiority.

Donald Worster's *Dust Bowl* (1979) argued that the disaster of the 1930s on the southern Plains was produced by American capitalist culture, which set out to dominate and exploit the land. William Cronon's *Changes in the Land* (1983), discussed in the chapter on Indigenous Economies and Environments, showed how Native and English ideas of property shaped New England's ecology. His *Nature's Metropolis* (1991) widened the field's gaze to cities. It traced the "elaborate and intimate linkages" between Chicago and the countryside, as grain stopped travelling in sacks stamped with a farm family's name and became a graded bulk commodity.

The field carried the moral energy of the movement it grew from. Rachel Carson's *Silent Spring* (1962) attacked the careless spraying of pesticides such as DDT; its title came from Keats's line "And no birds sing". Chemical companies attacked her. Carson did not call for an outright ban on DDT; she warned that overuse would breed resistance. When the United States banned DDT in 1972, the ban covered agricultural use, and DDT was never banned for fighting malaria, which is why claims that Carson caused millions of malaria deaths have been widely rebutted. After an oil spill off Santa Barbara and a fire on Cleveland's Cuyahoga River in 1969, an estimated 20 million Americans took part in the first Earth Day on 22 April 1970. The Environmental Protection Agency began work that December, and the Clean Air Act amendments of 1970 and the Clean Water Act of 1972 followed, the latter passed over President Nixon's veto.

The movement also had older roots, and an older quarrel. Gifford Pinchot, first chief of the US Forest Service, stood for utilitarian conservation: scientific management of resources for use. A letter of 1 February 1905 from the Agriculture Secretary, which Pinchot reportedly drafted, told foresters to resolve conflicts by "the greatest good of the greatest number in the long run". John Muir, founding president of the Sierra Club, wanted nature preserved for its own sake. The two broke in 1897, and their test case was the Hetch Hetchy valley in Yosemite, which San Francisco wanted as a reservoir and Congress granted in 1913.

```quote
Dam Hetch Hetchy! As well dam for water-tanks the people's cathedrals and churches, for no holier temple has ever been consecrated by the heart of man.
John Muir · The Yosemite · 1912
```

Neither side spoke for the Miwok and Paiute peoples who had used the valley seasonally for more than 6,000 years. In the same way Yellowstone, created in 1872 and widely considered the world's first national park, excluded the Native peoples who had used the land for at least 11,000 years. The national-park idea then travelled, to the Belgian Congo (Albert, now Virunga, 1925), South Africa (Kruger, 1926) and Argentina (Nahuel Huapi, 1922) among others. At the 1972 Stockholm conference Indira Gandhi tied environmental care to the relief of poverty. The Montreal Protocol of 1987, which protects the ozone layer from chemicals such as CFCs, became the first universally ratified treaty in UN history; Kofi Annan called it "perhaps the single most successful international agreement to date". The later climate treaties of Kyoto and Paris are covered in the Contemporary History overview.

## Worked example: the Little Ice Age and the seventeenth-century crisis

Climate is the field's most dramatic actor, and the best example is the "Little Ice Age", a term introduced by François Matthes in 1939. It is conventionally placed between the sixteenth and nineteenth centuries, though some prefer roughly 1300 to 1850. The first lesson is caution. It was a period of regional cooling, strongest around the North Atlantic, and not a true ice age of global extent. The Intergovernmental Panel on Climate Change found largely independent regional changes rather than a globally synchronous cooling. NASA identifies three especially cold intervals, beginning about 1650, 1770 and 1850. Proposed causes include low solar activity (the Maunder Minimum), volcanic eruptions, changes in ocean circulation and natural variability.

Historians have linked the cold to the "General Crisis" of the seventeenth century. That debate began in the 1950s: Eric Hobsbawm saw an economic crisis, Hugh Trevor-Roper a crisis between societies and their states. Geoffrey Parker's *Global Crisis* (2013), introduced in the overview of The Early Modern World, recast it as a worldwide crisis worsened by climate, using tree rings, ice cores and pollen beside written records. The 1640s saw more state breakdowns than any period before or since. Parker suggests the crisis may have killed perhaps as much as a third of the world's population, but that is a rough and contested estimate, not a count. In China, warm-weather crops such as oranges were abandoned in Jiangxi; rainfall in the north fell far below average in 1632–1641, and scholars link drought and famine to the fall of the Ming in 1644, as the chapter on Ming-Qing History explains. In the Ottoman Empire, Sam White argues, cold and drought unravelled the empire's provisioning and settlement systems and fed the Celali Rebellion (about 1595–1610), which halted a long period of growth.

Yet climate does not write the whole script. Dagomar Degroot's *The Frigid Golden Age* (2018) shows that the Dutch Republic was resilient and even adaptive in the cold: its merchants profited from harvest failures elsewhere, its commanders exploited shifting winds, and its inventors found opportunity in the freeze. The same cold produced collapse in one place and a golden age in another, and the difference lay in human institutions.

```checkpoint
q: What is the best way to describe the Little Ice Age, according to current scholarship?
a*: An uneven, largely regional cooling, strongest around the North Atlantic, with especially cold intervals rather than a single synchronous global freeze.
a: A true global ice age that froze the whole planet at once from 1300 to 1850.
x: Climate scientists stress that it was not a globally synchronous ice age.
a: A myth invented by nineteenth-century painters with no basis in scientific evidence.
x: Tree rings, ice cores and other records show real cooling; the debate is about its extent and timing.
a: A warm period that helped every society expand.
x: It was a cooling, and while some societies such as the Dutch adapted, others suffered drought and famine.
hint: Think of what the IPCC found about whether the changes were synchronous.
why: Presenting the Little Ice Age as regional and uneven guards against simple climate determinism.
---
q: What does Dagomar Degroot's study of the Dutch Republic add to the story of the seventeenth-century crisis?
a: It proves that the Little Ice Age never affected Europe.
x: Degroot accepts that the Dutch Republic lived through the Little Ice Age; his point is how it responded.
a: It shows that the Dutch Republic collapsed first and worst.
x: He argues the opposite: the Dutch were resilient and even adaptive.
a*: It shows that some societies adapted and even profited, so climate shaped outcomes through human institutions rather than dictating them.
a: It shows that witch trials caused the cold.
x: Historians have linked witch trials to the cold as scapegoating, not as a cause of it.
hint: Think of merchants, winds and inventors.
why: Degroot's case is a counterweight to stories in which climate simply brings catastrophe.
```

## Worked example: China's rivers and retreating elephants

Mark Elvin's *The Retreat of the Elephants* (2004) covers about 3,000 years of written record and follows wild elephants as they withdrew southward, while forests were cleared and land was farmed. Reviewers have noted that it reads more as a set of essays than as one chronological history, built around water control and regional case studies.

Rivers are the great theme. Ling Zhang's *The River, the Plain, and the State* (2016) studies the Yellow River's breach of 1048, which turned the Hebei plain in Northern Song China into a shifting delta for eighty years. Against Karl Wittfogel's idea of a "hydraulic mode of production", Zhang proposes a "hydraulic mode of consumption", in which river, plain and state together drained the region's resources.

China also enters the debate on energy. Northern Song China already used coal on a large scale for iron in the eleventh century. Kenneth Pomeranz's *The Great Divergence* (2000) argues that Britain escaped its ecological limits through conveniently located coal and New World resources, while China's large coal deposits lay in the northwest, far from the Yangzi delta.

## Worked example: India's forests and the environmentalism of the poor

Indian scholars changed the field's sense of whom it was about. Madhav Gadgil and Ramachandra Guha's *This Fissured Land: An Ecological History of India* (Delhi, 1992) became the foundational ecological history of South Asia. Guha's *The Unquiet Woods* (1989) placed the Chipko movement of the Uttarakhand Himalaya within a long tradition of peasant resistance to state forestry. Chipko, meaning "hugging", opposed commercial logging. At Reni on 25 March 1974, with the village men away, Gaura Devi, head of the women's council, led 27 women who hugged the trees and kept an all-night vigil; after a four-day stand-off, joined by neighbouring villages, the contractors left; in 1980 Indira Gandhi imposed a fifteen-year ban on felling in the Himalayan forests. The chapter on Modern South Asia sets Chipko in the wider history of independent India. The women's leading role has made it a reference point for ecofeminism, though how far it reflected the movement's own ideas is debated.

In 1989 Guha also published a sharp critique of American "deep ecology". He argued that the wilderness ideal was rooted in American history and inappropriate for the Third World, where setting land aside, for example as tiger reserves, had moved resources from the poor to the rich. His essay was reprinted in *Varieties of Environmentalism* (1997), written with Joan Martínez-Alier, which popularised the phrase "environmentalism of the poor". The Bhopal disaster of 3 December 1984, when gas leaked from a pesticide plant and at least 3,787 people died by official count (over 16,000 by other claims), is widely considered the world's worst industrial disaster.

## Worked example: misreading the African landscape

One of the field's most influential books turned a familiar story upside down. In Kissidougou, Guinea, round "forest islands" surround many villages. From the French occupation of 1893 onward, officials read them as the last relics of a vanished forest, and built a century of policy on that reading. James Fairhead and Melissa Leach, in *Misreading the African Landscape* (1996), showed the reverse: Kissi and Kuranko villagers had created and enlarged the forest islands, so that population growth there meant more forest, not less. The lesson reaches far beyond Guinea: an assumption of decline can itself be a colonial artefact.

James McCann's *Green Land, Brown Land, Black Land* (1999) and *The Myth of Wild Africa* (1992) by Jonathan Adams and Thomas McShane carry similar arguments across the continent. There is action as well as scholarship: Wangari Maathai's Green Belt Movement, founded in Kenya in 1977, has planted more than 51 million trees, and Maathai received the Nobel Peace Prize in 2004.

## Worked example: Latin American forests and disease

Warren Dean's *With Broadax and Firebrand* (1995) is a history of the destruction of Brazil's Atlantic forest, and Shawn William Miller's *An Environmental History of Latin America* (2007) surveys the region. Latin America and the Caribbean also show how disease environments shaped empire. J. R. McNeill's *Mosquito Empires* (2010) argues that sugar plantations widened the scope for yellow fever and malaria in the Greater Caribbean. "Differential resistance" between seasoned local populations and newly arrived European troops helps explain why Spain held its Caribbean colonies against rivals for so long, and why imperial powers lost mainland empires in the revolutionary wars of the late eighteenth and early nineteenth centuries.

The Americas may even appear in Antarctic ice. A dip in atmospheric carbon dioxide around 1610, the "Orbis spike", is most often explained by forests growing back over farmland after tens of millions of Indigenous Americans died of introduced disease, though a South American drought is an alternative explanation.

## Energy and extinction

Energy has been called history's motor. The pre-industrial world ran on wood and muscle, and in 1700, by one estimate, five-sixths of the world's coal was mined in Britain. Vaclav Smil describes a sequence of transitions from biomass to coal to oil: fossil fuels matched traditional biomass worldwide only in the late 1890s, and oil overtook coal in the 1960s. Jean-Baptiste Fressoz replies that "transition" was a politicians' word for a future goal, and that new sources were historically added on top of old ones; more wood was burned in the nineteenth century even as coal grew. Andreas Malm's argument that British cotton masters chose steam to control labour rather than because water ran out is discussed in the chapter on The Industrial Revolution.

Extinction runs through the whole human story. Most of the world's large animals vanished in the late Pleistocene, as the chapter on Human Origins and the Peopling of the Earth describes, and whether humans, climate or both were to blame is still debated. The passenger pigeon, perhaps 3 to 5 billion birds at its peak, was hunted by Native peoples, but railways and the telegraph turned the hunt into an industry. The last of the species, Martha, died at the Cincinnati Zoo on 1 September 1914. Today extinction rates are estimated at 100 to 1,000 times the background rate, and whether this is already a "sixth" mass extinction is debated.

## The big debates

**Decline, and the stories we tell.** Environmental histories have tended to be "declensionist": tales of decline under human pressure, a form of the lost-golden-age story. In "A Place for Stories" (1992) Cronon took two books on the Dust Bowl published in 1979, sharing sources and most facts. Worster blamed capitalist culture; Paul Bonnifield told a story of human endurance in the face of hardship. Same evidence, opposite stories: the difference lay in where each narrative began and ended. Fairhead and Leach's Guinea and Degroot's Dutch Republic are reminders that the story is not always decline.

**The "pristine" landscape.** Cronon's "The Trouble with Wilderness" (1995) called the idea of untouched wilderness a fantasy, and the chapter on Indigenous Economies and Environments shows how Native peoples shaped the "wild" Americas. Guha's critique and the exclusions at Yellowstone and Hetch Hetchy show what the myth cost the people who lived there.

**Determinism and activism.** Some historians stress forces "not of human origin"; others warn against climate determinism, and the debate over drought and the Syrian civil war, discussed in A History of Modern Syria, is a modern case. The field has also argued over activism: it often promoted a moral agenda, while steadily becoming more scholarly.

**The Anthropocene, and whose?** In 2000 Paul Crutzen and Eugene Stoermer proposed that humans had made a new geological epoch, the Anthropocene; Crutzen dated it to the Industrial Revolution. Rival start dates range from early farming to 1610 to the 1950s. An Anthropocene Working Group, set up in 2009, proposed in 2023 a start in 1952, marked by plutonium in the sediments of Crawford Lake, Canada. On 4 March 2024 the Subcommission on Quaternary Stratigraphy rejected the proposal by 12 votes to 4, with 2 abstentions, and on 20 March the International Union of Geological Sciences confirmed the rejection. Any new proposal would have to start the process afresh, after what was widely reported as a cooling-off period of about a decade. The reasons included the very recent start and the difficulty of fixing one date for changes that began at different times in different places. The word, it said, would remain "an invaluable descriptor of human impact on the Earth system".

Historians had already asked whose Anthropocene it was. Andreas Malm coined "Capitalocene" in 2009, and it was popularised by Jason W. Moore, who dates the problem to the "long sixteenth century" (from about 1450) and capitalism's appetite for "Cheap Nature". Kathryn Yusoff (2018) argued that the Anthropocene's universal "we" erases Black and brown suffering under slavery and colonial extraction, and others propose a "Plantationocene". The Kolkata-born historian Dipesh Chakrabarty argued that climate change forces historians to think of humans also as a species and a geophysical force.

```quote
Anthropogenic explanations of climate change spell the collapse of the age-old humanist distinction between natural history and human history.
Dipesh Chakrabarty · "The Climate of History: Four Theses" · 2009
```

**Who bears the cost?** Recent work stresses inequality. The 1982 protests at Warren County, North Carolina, against a PCB landfill in a mainly African American county are often taken as the start of the US environmental justice movement. The South African-born scholar Rob Nixon called the gradual, dispersed harm of pollution and degradation "slow violence", whose main casualties are the poor.

```checkpoint
q: What did Fairhead and Leach show about the "forest islands" of Kissidougou, Guinea?
a: That they were relics of a great forest destroyed by local farmers.
x: That was the colonial and official reading their book overturned.
a*: That villagers had created and enlarged them, so that more people there meant more forest, not less.
a: That French officials had planted them after 1893.
x: The officials misread the islands as remnants; it was Kissi and Kuranko villagers who made them.
a: That they appeared only after the Green Belt Movement began in 1977.
x: The Green Belt Movement was in Kenya; the Guinea forest islands long predated it.
hint: Think of the book's title: a misreading.
why: The case is a classic warning against assuming that every environmental story is one of decline.
---
q: What happened to the proposal to make the Anthropocene a formal geological epoch in 2024?
a: It was approved, with a start date of 1610.
x: The 1610 Orbis spike was one candidate, but the formal proposal used 1952, and it was rejected.
a: It was postponed until after the Paris climate talks.
x: The decision had nothing to do with the climate treaties; the stratigraphers voted on it.
a: It was approved with a start date in the Industrial Revolution.
x: Crutzen suggested that start, but the formal proposal was for 1952, and it was rejected.
a*: The Subcommission on Quaternary Stratigraphy rejected it on 4 March by 12 to 4 with 2 abstentions, and the IUGS confirmed the rejection on 20 March.
hint: Think of the vote of the stratigraphers and what followed.
why: The term remains in wide use as a descriptor, though not as a formal unit of geological time.
```

## Further exploration

- **Alfred W. Crosby, *Ecological Imperialism: The Biological Expansion of Europe, 900–1900* (1986).** How the plants, animals and microbes that travelled with Europeans remade the temperate world.
- **Donald Worster, *Dust Bowl: The Southern Plains in the 1930s* (1979).** A classic argument that a culture of exploitation produced an ecological disaster.
- **Madhav Gadgil and Ramachandra Guha, *This Fissured Land: An Ecological History of India* (1992).** The foundational ecological history of South Asia.
- **Mark Elvin, *The Retreat of the Elephants: An Environmental History of China* (2004).** Three millennia of Chinese environmental change.
- **James Fairhead and Melissa Leach, *Misreading the African Landscape* (1996).** How a century of policy in Guinea rested on a false story of deforestation.
- **Dagomar Degroot, *The Frigid Golden Age: Climate Change, the Little Ice Age, and the Dutch Republic, 1560–1720* (2018).** Adaptation and resilience in a cold century.
- **J. R. McNeill, *Something New Under the Sun: An Environmental History of the Twentieth-Century World* (2000).** The global century of unprecedented environmental change.$mn_envhist_master$,
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
  select $mn_envhist_quiz$[
    {"type": "mcq", "prompt": "Which definition of environmental history, given by Donald Worster in 1988, is the most widely quoted?", "options": ["The \"interaction between human cultures and the environment in the past\"", "The history of national parks and the laws that created them", "The study of climate change since the Industrial Revolution", "The history of the environmental movement since 1962"], "answerIndex": 0, "explanation": "Worster defined the field broadly as the interaction between human cultures and the environment in the past, and divided it into nature itself, human uses of nature, and human thought about nature.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Carson's Silent Spring (1962) actually call for, and what did the US ban of 1972 cover?", "options": ["A total worldwide ban on DDT, which the US imposed for all uses in 1972", "A ban on all pesticides, which the US imposed in 1962", "A warning against overuse, which would breed resistance; the 1972 US ban covered agricultural use, not anti-malarial use", "Increased DDT spraying to fight malaria"], "answerIndex": 2, "explanation": "Carson never called for an outright DDT ban. The US banned DDT for agricultural use in 1972, and it was never banned for anti-malarial use, which is why claims that she caused malaria deaths have been widely rebutted.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Ling Zhang propose in The River, the Plain, and the State (2016), her study of the Yellow River's breach of 1048?", "options": ["That the river had no effect on the Northern Song state", "That the Yellow River was dammed for the first time in 1048", "That Karl Wittfogel's hydraulic mode of production fully explains Song history", "A \"hydraulic mode of consumption\", in which river, plain and state together drained the region's resources"], "answerIndex": 3, "explanation": "Against Wittfogel's \"hydraulic mode of production\", Zhang argued that the river, the Hebei plain and the state drained the region's resources over eighty years of a shifting delta.", "id": "q3"},
    {"type": "mcq", "prompt": "Who coined the term \"Capitalocene\", and when?", "options": ["Paul Crutzen, in 2000", "Andreas Malm, in 2009", "Dipesh Chakrabarty, in 2009", "Jason W. Moore, in 1987"], "answerIndex": 1, "explanation": "Andreas Malm coined \"Capitalocene\" in 2009; it was then taken up by Donna Haraway and popularised by Jason W. Moore. Crutzen popularised \"Anthropocene\".", "id": "q4"},
    {"type": "open", "prompt": "Using the debate over the Dust Bowl and the case of Kissidougou in Guinea, explain what critics mean when they call environmental history \"declensionist\", and why it matters.", "rubric": "A strong answer defines declensionist narratives as stories of decline under human pressure (a lost-golden-age form). It uses Cronon's \"A Place for Stories\" (1992): Worster and Bonnifield, both in 1979, used shared sources to tell opposite stories (capitalist culture causing disaster v. the triumph of human endurance), showing that narrative choices shape conclusions. It uses Fairhead and Leach (1996): officials since 1893 read forest islands as relics of lost forest, but villagers had created them, so population growth meant more forest. It may add Degroot's adaptive Dutch Republic, and concludes that decline is a claim to be tested, not assumed, and that false decline stories can drive harmful policy.", "id": "q5"},
    {"type": "open", "prompt": "Why was the Anthropocene rejected as a formal geological epoch in 2024, and why do historians such as Malm, Moore, Yusoff and Chakrabarty argue over the term itself?", "rubric": "A strong answer gives the facts precisely: the Subcommission on Quaternary Stratigraphy voted 12 against, 4 for, with 2 abstentions on 4 March 2024, and the IUGS confirmed the rejection on 20 March; the reasons included the very recent (1952) start and shallow record and the difficulty of fixing one date for changes that began at different times in different places; the IUGS said the term would remain an invaluable descriptor. It then explains the historians' debate: the \"Capitalocene\" (coined by Malm in 2009, popularised by Moore) and Yusoff's critique argue that a universal \"anthropos\" hides unequal responsibility rooted in capitalism, slavery and colonialism; Chakrabarty argues that climate change collapses the distinction between natural and human history and makes humans a geophysical force.", "id": "q6"}
  ]$mn_envhist_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/environmental-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
