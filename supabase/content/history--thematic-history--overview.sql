-- Thematic History — chapter OVERVIEW master, co-written and human-reviewed.
-- history/thematic-history @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'history/thematic-history',
    'research',
    'advanced',
    'read',
    $mn_thematic_master$> **One theme, many places.** The twenty-nine chapters in this section each follow a single theme across continents and centuries. Nine of them are *approaches*, ways of doing history that changed what counts as evidence: social, intellectual, global, quantitative, digital, emotional, military, environmental, and women's and gender history. The other twenty are *long-run stories*, from disease, food and energy to slavery, revolutions, capitalism and the empires of the United States, oil and artificial intelligence. This overview draws out the threads between them: empire and its tools, unfree labour, the material base, states that count people, and the people who resisted. It then sets out the pitfalls of the thematic view, from anachronism to flattening analogies and Eurocentrism, and ends with a guide to the chapters.

## Following a Theme Across the World

A theme followed across the world can ask questions that no national history can. The chapter on **Global History** shows how one silver coin connects Andean miners, Spanish officials, Chinese tax-payers and merchants: by one estimate the mines of Potosí and Mexico produced about 80 per cent of the world's silver between 1500 and 1800, and Ming China, which valued silver at about double its price elsewhere, drew in a large share, about 30 per cent by one estimate. Sidney Mintz's *Sweetness and Power* (1985) did the same for sugar, tying the enslaved people who grew cane in the Caribbean to British workers drinking sweetened tea.

The ambition is old and was never only European. Sima Qian's *Records of the Grand Historian* covered some 2,500 years, from the Yellow Emperor to Emperor Wu; Rashid al-Din's *Compendium of Chronicles*, written in Mongol Iran, has been called "the first world history"; and Ibn Khaldun's *Muqaddimah* (1377) explained the rise and fall of dynasties through *'asabiyya*, group solidarity. Beside them, Hegel's claim, in the old English translation, that Africa "is no historical part of the World" looks like one parochial attempt among several. Ibn Khaldun himself knew how much any such survey leaves out.

```quote
There have been numerous sages among the nations of mankind. The knowledge that has not come down to us is larger than the knowledge that has.
Ibn Khaldun · Muqaddimah (1377), trans. Franz Rosenthal (1958)
```

## Approaches: New Evidence, New Lives

Each approach chapter tells of a field that widened both the archive and the cast. Social history, "history from below", read parish registers, court depositions and Inquisition trials: Le Roy Ladurie rebuilt the Pyrenean village of Montaillou from an inquisitor's register, and Carlo Ginzburg recovered the world of the miller Menocchio. It also made new sources: in the late 1930s the US Federal Writers' Project interviewed about 2,300 formerly enslaved people, and Gail Hershatter and Gao Xiaoxian spent ten years interviewing 72 elderly village women in Shaanxi. The field was never only Western. The Mexican historian Luis González y González published a microhistory of San José de Gracia in 1968; Ranajit Guha's Subaltern Studies read colonial records for peasant insurgents' own politics; and historians at Ibadan and Dar es Salaam built an African-centred history, Ibadan drawing on oral evidence and Dar es Salaam stressing African agency. The chapter's verdict is that the miller, the midwife, the sharecropper and the village woman of Shaanxi now stand in the same story as the king and the general.

The other approaches did the same in their own ways. The chapter on **Intellectual History** follows concepts across languages: Yan Fu's 1903 translation of Mill's *On Liberty* was titled "On the boundary between the self and the group". The chapter on **Women and Gender in World History** builds on Joan Scott's argument that gender is a primary way of signifying relationships of power, and the Social History chapter notes that Chen Dongyuan had published the first systematic Chinese women's history in 1928. The chapter on **Histories of Emotions** sets India's theory of *rasa*, China's *qing* and Mencius's "four beginnings" beside Hume and Smith, and Catherine Lutz's study of Ifaluk, where anger could be a moral, pro-social feeling.

Environmental historians read tree rings, ice cores, pollen and lake sediments as well as archives, and Fairhead and Leach showed that a century of colonial policy in Guinea rested on a misreading of the "forest islands" around villages. Digital history asks who did the work: Roberto Busa's concordance of Aquinas was punched onto cards by women keypunch operators in Gallarate, with 70 at the peak in 1962, whose labour Julianne Nyhan calls hidden and devalued. Military history widened from battles to soldiers and societies, and to John Thornton's African armies and Tonio Andrade's finding that a "Great Military Divergence" between China and Europe opened only from the mid-eighteenth century. Quantitative history turned numbers themselves into historical artefacts.

```checkpoint
q: What did James Fairhead and Melissa Leach show in *Misreading the African Landscape* (1996)?
a*: That Kissi and Kuranko villagers had created and enlarged the forest islands, so that population growth meant more forest, not less.
a: That colonial forestry had saved the last relics of an ancient forest around Kissidougou.
x: That was the colonial reading they overturned; officials had treated the forest islands as relics of a vanished forest.
a: That deforestation in Guinea was caused mainly by the Little Ice Age.
x: Their argument was about how villagers made forest, not about climate.
a: That Guinea's forests had been cleared for rubber plantations in the 1890s.
x: The book concerns officials' misreading of the forest islands from the French occupation of 1893 onward, not rubber.
hint: The book's title says what the officials got wrong.
why: The Environmental History chapter draws the lesson that an assumption of decline can itself be a colonial artefact.
---
q: How did Yan Fu title his 1903 Chinese translation of John Stuart Mill's *On Liberty*?
a: "Civilisation and Enlightenment".
x: *Bunmei kaika*, "civilization and enlightenment", was the slogan associated with Fukuzawa Yukichi in Japan.
a: "On the Rights of Man".
x: The title did not speak of rights; it spoke of a boundary.
a*: "On the boundary between the self and the group".
a: "Freedom" (*jiyū*).
x: *Jiyū* was the term in Nakamura Masanao's Japanese translation of *On Liberty* (1872), not Yan Fu's title.
hint: The title recast individual liberty as a line drawn somewhere.
why: The Intellectual History chapter uses it to show that translators' choices are themselves arguments, recasting Mill's individual liberty as a line between the individual and the collective.
```

## Empire and Its Tools, from Cables to Chips

Empire runs through the long-run chapters, and so do its instruments. Daniel Headrick's *The Tools of Empire* (1981) treated steamships, quinine, firearms and cables as elements of imperial expansion rather than sufficient explanations, and the chapters follow each tool to the people it touched. Quinine's story begins with the Quechua use of cinchona bark; in 1865 Manuel Incra Mamani collected high-quinine seeds in Bolivia, whose export was banned, and the Dutch planted them in Java and came to hold a world monopoly. British companies owned, on figures cited to Headrick, two-thirds of the world's cables in 1892. India's railways were built by private English companies promised a guaranteed 5 per cent return, with the risk borne by Indian revenues; the Uganda Railway used more than 30,000 indentured labourers, mostly from Punjab and Gujarat; and the forced labour of France's Congo–Ocean Railway, on which more than 17,000 workers are estimated to have died, fed the Kongo-Wara rebellion.

Commodities were tools too. The chapter on **History and Drugs** notes that colonial opium monopolies raised, at points, close to a sixth of British India's tax revenue. The chapter on **Oil and Empire** follows a concession of 1901 that gave a London millionaire rights over about three-quarters of Persia, and Robert Vitalis's argument, disputed by former employees, that Aramco ran its Dhahran camps as a Jim Crow system. The chapter on **American Empire** sets bases, unincorporated territories and interventions beside Daniel Immerwahr's "pointillist" empire.

Empire was never only European, and the chapters say so: the first major section of the Sui Grand Canal is recorded as using the labour of five million people, the Inca road ran some 40,000 km by most estimates on the labour owed to the state, and Pekka Hämäläinen calls the Comanche an empire, a term Indigenous scholars have questioned. Today's contest is plural as well. The chapter on **AI and Empire** finds the chokepoints in Taiwan's chip foundries, in China's roughly 91 per cent of rare-earth refining on an IEA estimate, and in cables such as 2Africa, built by a Meta-led consortium that includes China Mobile. It also finds the hidden workers: Kenyans labelling violent text for between about \$1.32 and \$2 an hour, by *TIME*'s account, figures their employer disputed.

## Unfree Labour and Its Legacies

Orlando Patterson defined slavery as "the permanent, violent domination of natally alienated and generally dishonored persons", and the chapter on **Slavery: a Global History** follows it from Hammurabi's laws to Korea's *nobi*, the mamluk armies and the Zanj Rebellion. Andrés Reséndez estimates that 2.5 to 5 million Indigenous people were enslaved in the Americas; SlaveVoyages estimates that about 12.5 million captives embarked from Africa. Abolition led to new forms of bound labour rather than an end to them. More than 1.6 million Indians went abroad under indenture, which Hugh Tinker called *A New System of Slavery*; about 215,000 Chinese were shipped from Macau alone between 1851 and 1874. In the United States the Thirteenth Amendment's exception for punishment underpinned convict leasing, which supplied 73 per cent of Alabama's annual state revenue in 1898. At Panama about 5,600 canal workers died, mostly West Indians, against about 350 Americans. In 2021, on estimates by the ILO, Walk Free and the IOM, some 49.6 million people were in modern slavery on any given day.

The chapters complicate easy stories. The chapter on **Abolitionist Women** begins with those who resisted, from Nanny of the Maroons to Elizabeth Freeman's lawsuit of 1781 and Mary Prince's narrative of 1831 ("I have been a slave myself—I know what slaves feel"), and ends with Stephanie Jones-Rogers's evidence that white women were profit-seeking enslavers. Arguments over slavery's place in capitalism, from Eric Williams's *Capitalism and Slavery* (1944) to Edward Baptist's work, which Alan Olmstead judged "flawed beyond repair", run through several chapters.

## Energy, Environment and the Material Base

Several chapters insist that history rests on fuel, soil and climate. E. A. Wrigley called pre-industrial societies "organic economies", capped by the land; Northern Song ironworks already burned, by contemporary estimates, at least 140,000 tons of coal a year; and by one estimate five-sixths of the world's coal was mined in Britain in 1700. Timothy Mitchell argues that coal's narrow channels gave miners the power to strike, and oil's pipelines took it away. Jean-Baptiste Fressoz replies that history shows energy additions rather than transitions, since every main source has kept growing.

The costs are unequal. Historically 5 per cent of countries have produced about 68 per cent of greenhouse-gas emissions, while between about 650 and 730 million people had no electricity in 2024. Dipesh Chakrabarty argued in 2009 that anthropogenic explanations of climate change spell "the collapse of the age-old humanist distinction between natural history and human history". The same ice that records Roman silver smelting, and a rise in lead of about 200-fold since ancient times, also supplies the 800,000-year baseline against which, as Carlo Barbante noted, carbon dioxide is now 50 per cent higher than at any time.

## States Counting and Controlling People

The chapter on **The Global History of Quantitative Data** begins with Uruk, where almost all of some 5,000 archaic tablets are administrative, and with Inca khipus, whose readers have been lost; estimates of the empire's peak population range from 4 to 37 million. Counting served conquest: William Petty's Down Survey of Ireland mapped land so that confiscated estates could pay Cromwell's soldiers. In British India the census of 1901 recorded 1,646 castes and that of 1931 recorded 4,147, while people petitioned to be recorded under higher-status names; whether the census made caste is still argued between Bernard Cohn and Nicholas Dirks and their critics. In 1929 the Women's War in south-eastern Nigeria began with a census dispute.

{{image: Quipu | A khipu: knotted cords on which the Inca recorded census figures and other numbers.}}

States learned to control movement in the same way. As the chapters on **Migration and Diaspora** and **Borders and Borderlands** show, the United States' Chinese Exclusion Act of 1882 was the first major American law to bar a specific national group, and Adam McKeown argued that modern border control grew out of efforts to control Asian migration from the 1880s; the League of Nations standardised the passport in 1920. James C. Scott's *Seeing Like a State* links censuses, surnames and maps to the failures of high-modernist schemes. The present-day cases are as varied: East Germany's Stasi had, when the regime collapsed, 91,015 employees and 173,081 informants, and China's social credit system, often imagined in the West as a single score, is in fact a fragmented set of ratings and blacklists.

## Resistance and the People on the Receiving End

The chapters repeatedly turn from rulers to those they ruled. James C. Scott found resistance in a Malaysian village in foot-dragging and feigned ignorance. At Reni in 1974 Gaura Devi led 27 women to hug the trees, part of the Chipko movement. In 1897 the Hui Aloha ʻĀina gathered 21,269 signatures against the annexation of Hawaiʻi. About 300,000 Ogoni marched in January 1993, and Ken Saro-Wiwa was hanged in 1995. Black sanitation workers in Memphis struck in 1968 under placards reading "I Am A Man". Inuit testimony about the Franklin expedition, long dismissed, was later supported by cut marks on bones and by the finding of *Erebus*, and in 2005 Sheila Watt-Cloutier and Inuit hunters and elders framed climate change as a human-rights issue, the "right to be cold". Erica Chenoweth and Maria Stephan found that major nonviolent campaigns succeeded 53 per cent of the time, against 26 per cent for violent ones.

Agency has its own debates. Vincent Brown warned that Patterson's "social death" could erase the lives the enslaved built; Patterson replied that it described the masters' aim. Michel-Rolph Trouillot called the Haitian Revolution "an unthinkable history", silenced beside the French one.

## Numbers and Quotations Under Dispute

One lesson runs through every chapter: a figure needs a source, and a famous quotation needs checking. The often-repeated "nine million" witches is a myth going back to 1784; named estimates of executions run from about 40,000 to 60,000. Paraguay's old claim of 90 per cent war losses rests on a census that modern scholarship has shown to be a government invention. For the Philippine–American War the chapter on **American Empire** warns that "every figure needs its source". Estimates of the Bengal famine of 1943 range from 0.8 to 3.8 million, with Cormac Ó Gráda's "about 2.1 million" as the consensus. Even counting energy depends on method: according to Ember, renewables generated 33.8 per cent of the world's electricity in 2025, just ahead of coal, while according to the Energy Institute fossil fuels still supplied about 86 per cent of total energy.

Quotations drift too. "Ain't I a Woman?" comes from Frances Dana Gage's version of 1863, not from the report of Sojourner Truth's speech of 1851. Lin Zexu's letter to Queen Victoria was never delivered. And corrections are part of the record: Karen Hao acknowledged that *Empire of AI* had overstated a planned data centre's water use by a factor of about 1,000.

```checkpoint
q: Where does the refrain "Ain't I a Woman?" in Sojourner Truth's Akron speech of 1851 come from?
a: From Marius Robinson's transcript in the *Anti-Slavery Bugle*, published in June 1851.
x: Robinson's text, the most reliable version, does not contain the refrain.
a*: From a very different version published by Frances Dana Gage in 1863.
a: From Truth's own autobiography, dictated in Dutch.
x: Truth spoke Dutch as her first language, but the refrain comes from another writer's later version.
a: From Harriet Beecher Stowe's *Uncle Tom's Cabin*.
x: The novel, serialised from June 1851 and published as a book in 1852, is not the source of the refrain.
hint: It was published twelve years after the speech.
why: Gage also added a Southern dialect and other claims; Nell Irvin Painter's 1996 biography separated the woman from the symbol.
---
q: Who gathered 21,269 signatures on the Kūʻē petitions against the annexation of Hawaiʻi in 1897?
a: The Committee of Safety that overthrew Queen Liliʻuokalani.
x: The Committee of Safety, mostly foreign-born residents and Hawaiian subjects of American descent, carried out the overthrow of 1893.
a: The United States Senate, as evidence for the Newlands Resolution.
x: The Senate never ratified McKinley's treaty; Congress annexed Hawaiʻi by joint resolution in 1898.
a: Grover Cleveland's administration, after he called the overthrow a "substantial wrong".
x: Cleveland blocked annexation, but the petitions were a Native Hawaiian initiative.
a*: The Hui Aloha ʻĀina, with signatures from well over half of Native Hawaiian adults.
hint: Kūʻē means "opposition".
why: The Hui Kālaiʻāina gathered some 17,000 more, and Noenoe K. Silva rediscovered the petitions in 1996.
```

## Pitfalls of the Thematic View

Following a theme across millennia invites three errors. The first is anachronism. The Cyrus Cylinder has been promoted as "the first charter of human rights", a label most scholars reject; the Kouroukan Fouga "charter" was reconstructed from oral tradition at Kankan in 1998; and the universal reading of Magna Carta is largely a later creation. Thomas Dixon warns that "emotions" as a single category is modern, and the chapter on gender calls "third gender" a broad modern label often applied from outside.

The second is the flattening analogy. In the chapter on **AI and Empire**, Orit Halpern cautions against "historical flattening" through broad analogies between past empires and platforms; sceptics add that no platform has annexed territory and that Kenyan moderators took their case to Kenyan courts. Crane Brinton's "anatomy" of revolution rested on four Western cases; John Lynn rejects any continuous "Western way of war".

The third is Eurocentrism. Dipesh Chakrabarty argued that historicism came to non-European peoples "as somebody's way of saying 'not yet' to somebody else". The remedies the chapters describe include Janet Abu-Lughod's thirteenth-century world system, the California School's even-handed comparisons of China and Europe, and Sanjay Subrahmanyam's "connected histories". Even these meet criticism: Jeremy Adelman warned, in a phrase commentators quoted, against "borderless, do-good storytelling" that neglects those who stayed put, and Jan de Vries warned that global microhistory favours unusually cosmopolitan people. The best thematic history, the chapters suggest, compares on equal terms, names its sources, and asks whose categories set the frame.

## Reading the Chapters

**Approaches.** **Social History**, **Intellectual History** and **Global History** set out the main methods; **The Global History of Quantitative Data** and **Digital History** examine numbers and machines; **Histories of Emotions** and **Women and Gender in World History** open feeling and gender to history; **Military History** and **Environmental History** take in war and nature.

**Life and the material world.** **Disease and Epidemics**, **Food in World History**, **History of Energy**, **The Role of Infrastructure in History**, **Urban History** and **Cryo-History** follow pathogens, harvests, fuels, networks, cities and ice.

**Movement, bondage and liberty.** **Migration and Diaspora** and **Borders and Borderlands** follow people and lines; **Slavery: a Global History**, **Abolitionist Women** and **History of Civil Liberties** trace bondage, the fight against it and freedoms won and suspended.

**Upheaval and order.** **Revolutions in Comparison**, **History of Peace and Peacemaking**, **Scandals in History** and **History and Drugs** show societies overturning, settling, exposing and policing themselves.

**Capital and power.** **Global History of Capitalism** and **Capitalism and Labor in the United States** follow capital and labour; **American Empire**, **Oil and Empire** and **AI and Empire** follow power across oceans, pipelines and data.

## Further exploration

- **Dipesh Chakrabarty, *Provincializing Europe: Postcolonial Thought and Historical Difference* (2000).** Why European categories cannot simply be applied to everyone's past.
- **James C. Scott, *Seeing Like a State: How Certain Schemes to Improve the Human Condition Have Failed* (1998).** Legibility, censuses and the failure of high-modernist schemes.
- **Orlando Patterson, *Slavery and Social Death: A Comparative Study* (1982).** The classic comparative definition of slavery.
- **Madhav Gadgil and Ramachandra Guha, *This Fissured Land: An Ecological History of India* (1992).** The foundational ecological history of South Asia.
- **Timothy Mitchell, *Carbon Democracy: Political Power in the Age of Oil* (2011).** How coal and oil shaped the possibilities of democracy.
- **Daniel R. Headrick, *The Tools of Empire: Technology and European Imperialism in the Nineteenth Century* (1981).** Steamships, quinine, guns and cables as instruments of conquest.
- **Noenoe K. Silva, *Aloha Betrayed: Native Hawaiian Resistance to American Colonialism* (2004).** Hawaiian-language sources and the Kūʻē petitions.$mn_thematic_master$,
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
  select $mn_thematic_quiz$[
    {"type": "mcq", "prompt": "In the chapter on AI and Empire, what does Orit Halpern caution against?", "options": ["Treating data labelling as skilled work", "Regulating AI before its benefits are known", "\"Historical flattening\" through broad analogies between past empires and platforms", "Comparing the United States and China as rival AI powers"], "answerIndex": 2, "explanation": "Halpern warns that broad analogies between past empires and today's platforms can flatten history; sceptics add that no platform has annexed territory, while Couldry and Mejias hold that data appropriation is a new phase of colonialism.", "id": "q1"},
    {"type": "mcq", "prompt": "What does the Women and Gender chapter say about the often-repeated claim that nine million people were killed in the European witch-hunts?", "options": ["It is a myth going back to Gottfried Christian Voigt in 1784; named estimates of executions run from about 40,000 to 60,000", "It is Brian Levack's estimate for Europe and British America", "It counts all those prosecuted between 1400 and 1775", "It is the figure in the *Malleus Maleficarum* of 1486"], "answerIndex": 0, "explanation": "About 100,000 people were prosecuted and between 40,000 and 60,000 executed; the estimates have names (Scarre and Callow, Levack, Hutton, Behringer and Roper), while the nine million figure is a myth traced to Voigt in 1784.", "id": "q2"},
    {"type": "mcq", "prompt": "According to the History of Energy chapter, what did Ember's Global Electricity Review 2026 report for 2025?", "options": ["That fossil fuels had fallen below half of the world's total energy supply", "That coal still generated more than half of the world's electricity", "That nuclear power had overtaken coal in electricity generation", "That renewables generated 33.8 per cent of the world's electricity, just ahead of coal's 33 per cent"], "answerIndex": 3, "explanation": "Renewables passed coal in electricity for the first time in about a century; yet the Energy Institute's Statistical Review found that fossil fuels still supplied about 86 per cent of total energy in 2025, a reminder that such shares depend on how energy is counted.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened at Reni, in the Uttarakhand Himalaya, on 25 March 1974?", "options": ["Indira Gandhi imposed a fifteen-year ban on felling in the Himalayan forests", "Gaura Devi led 27 women who hugged the trees to stop commercial logging", "Ramachandra Guha founded the Chipko movement", "The Narmada Bachao Andolan began its campaign against a dam"], "answerIndex": 1, "explanation": "With the village men away, Gaura Devi, head of the women's council, led 27 women in a vigil; after a four-day stand-off joined by neighbouring villages, the contractors left. The felling ban followed in 1980, and Guha later wrote the movement's history in The Unquiet Woods (1989).", "id": "q4"},
    {"type": "open", "prompt": "Choose two of the approaches in this section (for example social, intellectual, environmental, digital, quantitative, emotions, military, global, or women's and gender history). For each, explain how it changed what counts as historical evidence and whose lives count as history.", "rubric": "A strong answer names specific sources and people from the chapters. Examples: social history's parish registers, Inquisition records (Le Roy Ladurie's Montaillou, Ginzburg's miller), the WPA interviews with about 2,300 formerly enslaved people, Hershatter and Gao Xiaoxian's interviews with 72 Shaanxi village women, Subaltern Studies and the Ibadan and Dar es Salaam schools; environmental history's tree rings, ice cores and pollen, and Fairhead and Leach's Kissi and Kuranko villagers; digital history's databases and the hidden women keypunch operators of Busa's index, or Mukurtu's community control; quantitative history's reading of numbers as artefacts (the Indian census's castes, Porter, Scott); the history of emotions' rasa, qing and Lutz's Ifaluk; Scott's gender as a way of signifying relationships of power and Chen Dongyuan's 1928 history; global history's connected histories and Hau'ofa's sea of islands. Credit answers that also note a limit or critique, such as Spivak's question whether the subaltern can speak, Hartman's critical fabulation, Drucker's 'capta', or de Vries's warning about cosmopolitan subjects.", "id": "q5"},
    {"type": "open", "prompt": "'From cables to chips.' Compare one earlier technology of empire with artificial intelligence, and assess whether 'empire' is the right word for the power AI concentrates.", "rubric": "A strong answer uses evidence from the chapters on both sides. For the earlier tool: Headrick's argument that technology was necessary but not sufficient for empire; British companies owning two-thirds of the world's cables in 1892 and cutting Germany's cables in the First World War; India's railways with a guaranteed 5 per cent return; quinine and the Dutch Java monopoly; Hollerith's machines counting colonial populations; oil concessions and Aramco's camps. For AI: chokepoints in Taiwanese chips, Chinese rare-earth refining and Congolese cobalt; Kenyan data workers paid about $1.32–$2 an hour by TIME's account (disputed by Sama); surveillance exported by both Chinese and US firms but also chosen by governments; Couldry and Mejias's data colonialism. For the debate: Halpern's warning against historical flattening, the point that no platform has annexed territory and that Kenyan moderators used Kenyan courts, and the Rockefeller funding of the Dartmouth workshop. Credit answers that reach a reasoned judgement and note African and Indian efforts to build AI on their own terms.", "id": "q6"}
  ]$mn_thematic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
