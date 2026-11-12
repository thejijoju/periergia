-- Long Histories of Regions — chapter OVERVIEW master, co-written and human-reviewed.
-- history/regional-histories @ research/advanced/read.
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
    'history/regional-histories',
    'research',
    'advanced',
    'read',
    $mn_regional_master$> **One place, many eras.** The twenty-seven chapters in this section each follow a single region, or a single theme within one, across a long stretch of time: China over four thousand years, Jerusalem from a hill town by a spring to the present, the Pacific over three thousand years of voyaging, Africa before and after the colonial partition, the Indigenous nations of the Americas from the deep past to today's courtrooms. This overview asks what the long regional view offers and what it hides, beginning with the awkward fact that regions are made by people, and often by outsiders. It then draws out the themes that cross the chapters, from empire, slavery and Indigenous survival to faith, land, gender, memory and migration, and ends with a guide to the chapters by region.

## Why Follow One Place?

A region's long history lets patterns appear that a single era cannot show. The chapter on **Chinese History** gives its space to questions that run across four thousand years: why China was repeatedly divided and reunited, whether the "dynastic cycle" explains it, and how the empire lived with the steppe peoples who twice conquered it. The chapter on **Sub-Saharan Africa to 1860** insists that the continent's history before conquest "is not a prelude to colonialism", but a history of migrating farmers, bronze-casters, assemblies as well as kings, and states that "rose, traded, enslaved, argued and reformed". The chapter on **Jerusalem** shows how a deep past shapes the present: a city that Jews, Christians and Muslims each made holy in its own way remains the hardest question of the Israeli–Palestinian conflict.

The danger is the reverse movement, reading the present back into the past. Three modern nations, Belarus, Russia and Ukraine, claim Kyivan Rus' as their ancestor, and the chapter on **East European Identities** shows that even the name "Kievan Rus'" carries an argument: it is first found in a Polish text of 1582 and was popularised by nineteenth-century Russian imperial historians. In July 2021 Vladimir Putin's essay on the "historical unity" of Russians and Ukrainians restated the imperial idea of one people; in April 2022, 91 per cent of Ukrainians polled rejected it. Korea's ancient past has been fought over in the same way, by Japanese colonial scholars, Korean nationalists and a Chinese state project of 2002–07. A long history of one place is never neutral about where that place begins and ends.

## Who Drew the Map?

Regions are not found in nature; someone has to draw them, and the names often reveal who was looking. The chapter on **Indochina and Modern Vietnam** shows France building the colony piece by piece and joining Cochinchina, Annam, Tonkin and Cambodia into the Indochinese Union on 17 October 1887; the explorer-diplomat Auguste Pavie gave Laos its modern name. Yet the frame outlived its makers: in 1930 the new Vietnamese Communist Party was renamed, on Comintern instructions, the Indochinese Communist Party.

In the Pacific, Dumont d'Urville's nineteenth-century division into Melanesia, Micronesia and Polynesia was challenged in 1973 by Andrew Pawley and Roger Green, who proposed a division based on settlement: Near and Remote Oceania. The Tongan and Fijian anthropologist Epeli Hauʻofa went further in 1993, setting the belittling colonial picture of "islands in a far sea" against Oceania as "a sea of islands", its peoples connected rather than separated by water. The chapter on **Central Asia and the Steppe** begins by refusing to see the region as a mere corridor between civilisations; David Christian treats "Inner Eurasia" as a single unit of world history. Even its most famous label is suspect. "The Great Game" was coined by a British officer, Arthur Conolly, but Malcolm Yapp noted that the term became common only after the Second World War, and Marlene Laruelle warns that talk of a "New Great Game" treats Central Asian states as mere pawns.

Borders drawn by outsiders are a theme of their own, and the chapters warn against simple stories. "Sykes–Picot" has become shorthand for borders imposed on the Middle East, but many historians call this a myth: the agreement of 1916 was never implemented as drawn, and Sara Pursley calls the "artificial" Iraq a legend, since Iraq had long existed as a distinct Ottoman region. In 1924 Moscow redrew Central Asia into Soviet national republics; a popular reading sees "divide and rule", while archive-based studies stress competing local claims.

Who writes about a region matters as much as who maps it. In *Orientalism* (1978) Edward Said argued that Western scholarship on "the Orient" was bound up with imperial power. In 1961 John Smail criticised the Eurocentric "angle of vision" that saw Southeast Asia through the deeds of foreigners, and argued that colonial rule should be one part of the region's history rather than its definition. Paul Cohen, a student of John King Fairbank, criticised Fairbank's "impact–response" model of modern China for casting China as passive and called for a "China-centered history of China". Japanese colonial scholars advanced a "stagnation" thesis about Korea that openly served the argument for Japanese domination. Many chapters end with scholars from the region rewriting these stories from within, from the Ibadan School in Nigeria to the Thai historian Thongchai Winichakul, who argued that modern mapping itself created Siam's "geo-body".

National, regional and global frames each light up something different. James Gelvin frames the modern Middle East through a world economy and a world system of nation-states. Sunil Amrith estimates that some 28 million crossings of the Bay of Bengal, in both directions, took place between 1840 and 1940, a history that belongs to no single nation. And the chapter on **The European Union** shows a region deliberately building itself, while its founders' "Eurafrica" reached into Africa.

```checkpoint
q: What did John Smail argue in his essay of 1961 on the history of modern Southeast Asia?
a*: That colonial rule should be one part of Southeast Asia's history rather than its definition.
a: That Southeast Asia had no history worth writing before European colonial rule.
x: Smail argued the opposite, attacking the view that saw the region only through foreigners' deeds.
a: That the region should be studied only as part of the history of China and India.
x: His argument was for an autonomous history of Southeast Asia, not for folding it into its neighbours.
a: That the mainland and the islands could never be treated as one region.
x: Victor Lieberman later argued that Anthony Reid's age-of-commerce pattern fits the islands better than the mainland; Smail's point was different.
hint: His essay asked about "the possibility of an autonomous history".
why: Smail criticised a Eurocentric "angle of vision"; Anthony Reid later gave the argument depth with his history of the region's age of commerce.
---
q: What did Malcolm Yapp argue in "The Legend of the Great Game" (2000)?
a: That the rivalry was the main driver of every Russian advance into Central Asia.
x: Yapp was sceptical of the frame, and Alexander Morrison argues that it explains little about Russian motives.
a: That the phrase was invented by Rudyard Kipling in *Kim*.
x: The phrase is attributed to the British officer Arthur Conolly; *Kim* (1901) made it famous.
a*: That the term became common only after the Second World War, and that British India feared its own population more than a Russian invasion.
a: That British intelligence ran a large network of agents across Central Asia.
x: Yapp noted that the archives show no British intelligence network in Central Asia.
hint: He doubted that the famous label explains much.
why: The debate shows how a catchy outsiders' label can shape a region's history; Marlene Laruelle adds that talk of a "New Great Game" treats Central Asian states as mere pawns.
```

## Empire and Its Aftermaths

Empire runs through nearly every chapter, and not only Europe's. In Africa, Europeans held about a tenth of the continent in the 1870s; by 1914 only Ethiopia and Liberia were independent, and no African state was invited to the Berlin Conference that set the rules for European claims. The Dutch Cultivation System on Java supplied, on some estimates, about half of Dutch state revenue at its peak, and in French Indochina the monopolies of opium, salt and rice alcohol supplied about 44 per cent of the colonial budget in 1920.

Empires also hardened identities. In Rwanda, Belgian identity cards labelled every person Tutsi, Hutu or Twa, freezing categories once permeable; those cards would be checked at the roadblocks of 1994. France divided its Syrian mandate into statelets and recruited Alawites and other minorities into its army, the root of their later prominence. Mahmood Mamdani argued that the colonial state split Africans into citizens and "native" subjects, a legacy the independent states inherited.

Asian and Eurasian empires belong in the same story. The Qianlong emperor ordered the Dzungars' eradication, and Michael Clarke and others estimate that 70–80 per cent of them died from war and disease; recent scholarship calls this the Dzungar genocide. In Soviet Kazakhstan between 38 and 42 per cent of all Kazakhs died in the famine of 1930–33.

How deep did colonialism go? J. F. Ade Ajayi called it "an episode in African history"; Peter Ekeh replied that it was an epoch that transformed everything. Pierre Brocheux and Daniel Hémery describe an "ambiguous colonization" of Indochina, exploitative yet modernising. The aftermaths are still unfolding: the coups of Africa's "Coup Belt", the republic Barbados became in 2021, and the slow arguments about the British crown traced in the chapter on **the British Monarchy**.

## Indigenous Sovereignty and Survival

Several chapters follow peoples who were meant to disappear and did not. Patrick Wolfe's description of settler colonialism as "a structure not an event", a continuing logic that seeks land and so the "elimination of the native", shapes much of the writing, though critics such as J. Kēhaulani Kauanui warn that Indigeneity endures beyond the structure. The chapters show similar legal fictions and reversals. Australia was taken without treaty; in *Mabo* in 1992 the High Court rejected the "enlarged notion of terra nullius" and recognised native title. In Canada the Supreme Court held in *Delgamuukw* (1997) that oral histories must be "placed on an equal footing" with documents as evidence. In 2007 the UN adopted the Declaration on the Rights of Indigenous Peoples by 143 votes to 4; the four opponents, Australia, Canada, New Zealand and the United States, were all settler states, and all later reversed their positions.

Survival is cultural as well as legal. Canada banned the potlatch from 1885 until 1951, and the return of confiscated regalia to the U'mista Cultural Centre was an Indigenous achievement. The Micronesian navigator Mau Piailug guided *Hōkūleʻa* to Tahiti in 1976 when no living Hawaiian knew the old techniques, and an elder told the crew of a later voyage that they had "proven that our ancestors did it". The chapter on **Afro-Indigenous Intersections in Early America** shows that survival raised its own hard questions: Freedmen descendants are still contesting their citizenship in Native nations.

{{image: Hōkūleʻa | Hōkūleʻa, the double-hulled voyaging canoe launched in 1975 to test traditional Pacific navigation.}}

## Slavery and Its Legacies

Slavery appears in almost every region, and the chapters resist simple stories. About 12.5 million people embarked on the Atlantic trade between 1501 and 1866, but Africans were also carried across the Sahara and the Indian Ocean, and slavery existed in many African societies before Europeans arrived. The Sokoto Caliphate was a vast slave society, and Njinga of Ndongo and Matamba was a slave trader on a large scale. Robertson and Klein argued that women were the majority of enslaved people inside Africa. The Timbuktu scholar Ahmad Baba rejected the idea that Black Africans were destined for slavery, but did not oppose slavery itself.

The trade's other ends are in view too. Between 1672 and 1731 ships in which the Royal African Company invested carried 186,748 people to English colonies, and many captives were branded "DoY", for the Duke of York, the future James II. In the American South, Carolina shipped enslaved Native people to the Caribbean, and some Cherokee, Chickasaw, Choctaw, Creek and Seminole planters later held enslaved African Americans. From December 1862 Peruvian slave raiders seized some 1,400 to 1,500 people from Rapa Nui, about half its population. Nathan Nunn has found a robust negative relationship between a country's historical slave exports and its present-day income, findings that are debated.

## Faith and Sacred Ground

Religion is a thread through the regional chapters, as belief, as institution and as contested ground. In Jerusalem even the names are disputed: the Temple Mount is al-Haram al-Sharif in Arabic. Ethiopia's rock-hewn churches at Lalibela are widely understood as a symbolic Jerusalem. Africa's Christians grew from under ten million in 1900 to over 700 million today, a growth that was African-led. When jihadists held Timbuktu in 2012–13, some 350,000 manuscripts were carried to safety. On the Northwest Coast of North America stories of crests and houses work as law and title.

```checkpoint
q: What did the Supreme Court of Canada decide in Delgamuukw v British Columbia (1997)?
a: That oral histories were too unreliable to be used as evidence of Aboriginal title.
x: That was the trial judge's view in 1991, which the Supreme Court reversed.
a*: That oral histories must be accommodated and placed on an equal footing with documentary evidence.
a: That the Gitxsan and Wet'suwet'en held title to 58,000 square kilometres of British Columbia.
x: The Court did not itself grant title; it ordered a new trial, which has never been held.
a: That the potlatch ban had been illegal from its start.
x: The potlatch ban was a separate matter, dropped in the Indian Act revision of 1951.
hint: The case turned on how courts should treat evidence.
why: Chief Justice Lamer held that the laws of evidence must be adapted; commentators still debate how far courts have followed through.
---
q: What position did the Timbuktu scholar Ahmad Baba take in Mi'raj al-Su'ud (1615)?
a: He called for slavery to be abolished everywhere in the Islamic world.
x: He did not oppose slavery itself.
a: He defended the so-called Curse of Ham as a justification for enslavement.
x: He rejected the Curse of Ham.
a: He argued that only war captives from outside Africa could be enslaved.
x: His test was religion, not geography: free Muslims of any ethnic origin could not lawfully be enslaved.
a*: He rejected the idea that Black Africans were destined for slavery, while arguing that free Muslims of any origin could not lawfully be enslaved.
hint: His was a defence of religion-based rather than race-based slavery.
why: Ahmad Baba, deported to Morocco in 1594, shows that arguments about race and slavery had an African and Islamic history long before European abolitionism.
```

## Land and Livelihood

The long view turns attention to how people lived from the land, and how that changed. The chapter on **Indigenous Economies and Environments** follows William Denevan's "pristine myth": Europeans called "wilderness" landscapes that Indigenous nations had shaped with fire, fields and clam gardens, emptied by epidemics. Today Indigenous peoples manage or hold tenure over more than a quarter of the world's land, on one estimate. Disaster appears in the cattle plague of the 1890s, which killed about nine in ten of Ethiopia's cattle, and in the Aral Sea, a tenth of its former size by 2007. The Rapa Nui "ecocide" story is itself under attack: recent research has largely turned against it, and the real catastrophe came from outside.

Peasants are at the centre of several chapters. In 1949 about 89 per cent of Chinese people lived in the countryside, and the chapter on **Rural China** shows the hukou regulation of 1958 dividing citizens into agricultural and non-agricultural households, a distinction two scholars called "caste-like". James C. Scott argued that the upland peoples of "Zomia" deliberately practised "state avoidance".

## Women, Gender and Power

The chapter on **Women in African History** recovers queens, queen mothers, traders and prophets, from the kandakes of Kush to Yaa Asantewaa, and the Women's War of 1929 in south-eastern Nigeria, which British records called the "Aba Riots". It also shows African women scholars arguing among themselves: Oyèrónkẹ́ Oyěwùmí argued that among the Oyo-Yoruba seniority, not gender, was the main organising principle. Elsewhere, Huda Sha'arawi founded the Egyptian Feminist Union in 1923, Iranian protest followed the death of Mahsa Amini in 2022, and Cherokee women, who had taken part in land negotiations as late as 1785, had no seat at New Echota in 1835. Dorothy Ko reads late imperial Chinese footbinding as women's practice and civility without denying its suffering. The African chapter's closing judgement could stand for many regions: women had forms of power that colonial rule diminished, and those forms were themselves shaped by hierarchy, seniority and, sometimes, slavery.

## Memory, Sport and Identity

Regional identities are made in stadiums and ceremonies as well as in archives. The chapter on **Sport in Africa** shows the Confederation of African Football founded in Khartoum in 1957, all 15 African entrants withdrawing from the 1966 World Cup until FIFA gave Africa its own place, and Abebe Bikila winning the 1960 Olympic marathon barefoot in Rome, the capital of Ethiopia's former occupier. South African historians are more cautious than the popular story of the 1995 Rugby World Cup as a founding moment of reconciliation. Eric Hobsbawm and Terence Ranger's *The Invention of Tradition* (1983) joins the two ends of empire: it includes David Cannadine's essay on British royal ritual, badly performed in the early nineteenth century and expertly staged from the late nineteenth, and Ranger's chapter launching the argument that many supposedly ancient "tribal" traditions in Africa were colonial inventions.

States curate memory too. China's 2023 Patriotic Education Law made patriotic history education compulsory, a frame in which the "century of humiliation" looms large; Kazakhstan keeps 31 May as a day of remembrance for the famine; and in November 2025 Indonesia named Suharto a National Hero, reviving debate over his rule.

## Diasporas and Borders

The regional chapters are full of people crossing lines. More than 1.6 million Indians were sent abroad under indenture, and India counted 35.4 million citizens and people of Indian origin abroad in 2024, the world's largest diaspora. Nearly half a million people came to Britain from the Caribbean between 1948 and 1970. The Kurds, an estimated 30–45 million people, are often called the largest ethnic group without a state, and Partition displaced between 12 and 20 million people.

## Reading the Chapters

**Europe.** **East European Identities** follows the rival inheritances of Rus'; **The European Union** traces integration from coal and steel to Brexit; **God Save the Queen** asks how the British monarchy survived, looking from the empire and treaty nations as well as the palace.

**Asia.** **Chinese History** takes four thousand years in one view; **Ming-Qing History** sees the last dynasties from below; **Modern China** follows China and Taiwan from 1911; **The Modern History of Rural China** tells that century from the villages. **Premodern Korean History** runs to 1876. **Modern South Asia**, **Modern Southeast Asia** and **Indochina and Modern Vietnam** follow empire, independence and the Cold War, and **Central Asia and the Steppe** runs from the first horse-breeders to independence.

**The Middle East.** **The Making of the Modern Middle East** asks who made the region; **A History of Modern Syria** follows one state from Ottoman province to the fall of Assad in December 2024; **Jerusalem, a History** covers one city over four thousand years.

**Africa.** **History of Sub-Saharan Africa to 1860** and **Modern African History since 1860** give the continental narrative, and three thematic chapters cut across it: **Health and Healing in African History**, **Women in African History** and **History of Sport in Africa**.

**The Americas.** **Native American and Indigenous Studies** follows Indigenous nations and the field that studies them; **Afro-Indigenous Intersections**, **Indigenous Economies and Environments** and **Indigenous Oral Literatures of the Northwest Coast** take up kinship, land and literature; **Modern American History** treats the twentieth-century United States as a society arguing about who counted as fully American.

**Oceania.** **Pacific Voyagers** tells the settlement of the ocean by skilled navigators, and **The "Settler Revolution" at the Edge of Empire** follows Australia from 1770 to Federation in 1901, from both sides of the frontier.

## Further exploration

- **John Iliffe, *Africans: The History of a Continent* (1995; 3rd ed. 2017).** The standard one-volume survey of the continent's history.
- **Epeli Hauʻofa, *We Are the Ocean: Selected Works* (2008).** Essays, fiction and poetry, including "Our Sea of Islands".
- **Linda Tuhiwai Smith, *Decolonizing Methodologies: Research and Indigenous Peoples* (1999).** The founding text on research by and for Indigenous peoples.
- **Thongchai Winichakul, *Siam Mapped: A History of the Geo-Body of a Nation* (1994).** How mapping created the modern Thai nation-state.
- **Ge Zhaoguang, *What Is China? Territory, Ethnicity, Culture, and History* (trans. Michael Gibbs Hill, 2018).** A Fudan historian on how "China" has been defined.
- **Eugene Rogan, *The Arabs: A History* (2009).** Five centuries of Arab history, told largely from the Arab side.
- **Serhii Plokhy, *The Gates of Europe: A History of Ukraine* (2015).** The standard one-volume history of Ukraine.$mn_regional_master$,
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
  select $mn_regional_quiz$[
    {"type": "mcq", "prompt": "Which four states voted against the UN Declaration on the Rights of Indigenous Peoples in 2007?", "options": ["Australia, Canada, New Zealand and the United States", "Russia, China, Brazil and India", "France, Belgium, Portugal and the Netherlands", "Indonesia, Myanmar, Chile and Argentina"], "answerIndex": 0, "explanation": "The Declaration passed by 143 votes to 4. The four opponents were all settler states, and all later reversed their positions.", "id": "q1"},
    {"type": "mcq", "prompt": "In 1973 Andrew Pawley and Roger Green proposed replacing Dumont d'Urville's division into Melanesia, Micronesia and Polynesia with what?", "options": ["A single region called Austronesia", "A division into Near Oceania and Remote Oceania, based on settlement", "Hauʻofa's 'sea of islands'", "The Polynesian Triangle alone"], "answerIndex": 1, "explanation": "Pawley and Green's Near Oceania (New Guinea, the Bismarck Archipelago and most of the Solomons) and Remote Oceania (everything beyond) is a line in time as well as space. Hauʻofa's 'Our Sea of Islands' came later, in 1993.", "id": "q2"},
    {"type": "mcq", "prompt": "Where is the compound name 'Kievan Rus'' first found, according to the chapter on East European Identities?", "options": ["In the chronicles of Kyiv itself in the eleventh century", "In Byzantine church documents distinguishing 'Great' and 'Little' Rus'", "In a Polish text of 1582, later popularised by nineteenth-century Russian imperial historians", "In Soviet textbooks of 1937"], "answerIndex": 2, "explanation": "Its own people called the state simply 'Rus''. The later label already carried an argument, since Belarus, Russia and Ukraine all claim Kyivan Rus' as their ancestor. The Soviet textbooks of 1937 codified the 'common cradle' view but did not coin the name.", "id": "q3"},
    {"type": "mcq", "prompt": "What share of all Kazakhs died in the famine of 1930–1933, according to the chapter on Central Asia and the Steppe?", "options": ["About 5 per cent", "About 10 per cent", "About 20 per cent", "Between 38 and 42 per cent"], "answerIndex": 3, "explanation": "Between 38 and 42 per cent of all Kazakhs died, the highest proportion of any people in the Soviet famines. The usual estimate of the dead is 1.3–2.3 million, and whether to call it genocide is debated.", "id": "q4"},
    {"type": "open", "prompt": "'Regions are made, not found.' Using at least three regions from this section, explain what this means and why it matters for writing a region's long history.", "rubric": "A strong answer shows that regional names and borders were drawn by particular people for particular purposes, with examples: France joining Cochinchina, Annam, Tonkin and Cambodia into the Indochinese Union in 1887 and Pavie naming Laos, and the frame outliving France in the Indochinese Communist Party; Dumont d'Urville's Pacific labels replaced by Pawley and Green's Near and Remote Oceania, and Hauʻofa's 'sea of islands' against 'islands in a far sea'; Central Asia seen as a corridor, Christian's 'Inner Eurasia', and the 'Great Game' label that Yapp says became common only after the Second World War; Moscow's 1924 delimitation of Central Asian republics; Sykes–Picot as myth and Pursley on the 'artificial' Iraq; Thongchai's 'geo-body'; the name 'Kievan Rus''. It explains why this matters: outsiders' frames (Said's Orientalism, Fairbank's impact–response model criticised by Cohen, Smail's critique of a Eurocentric 'angle of vision', Japan's 'stagnation' thesis on Korea) shape whose actions count, and modern claims can be read back into the past. Credit answers that also note the value of regional frames, such as Reid's maritime Southeast Asia or Amrith's Bay of Bengal migrations.", "id": "q5"},
    {"type": "open", "prompt": "J. F. Ade Ajayi called colonialism 'an episode in African history'; Peter Ekeh replied that it was an epoch that transformed everything. Drawing on chapters from at least two regions, which view do the long regional histories better support?", "rubric": "A strong answer sets out both sides with evidence. For 'epoch': the partition of Africa (a tenth held by Europeans in the 1870s, all but Ethiopia and Liberia by 1914); Rwanda's identity cards and the roadblocks of 1994; France's division of Syria and Alawite recruitment; Mamdani's 'decentralised despotism' inherited by independent states; extraction through the Cultivation System (on some estimates about half of Dutch state revenue) and Indochina's monopolies (about 44 per cent of the colonial budget in 1920); the potlatch ban and boarding schools; terra nullius. For 'episode': Africa before 1860 'not a prelude to colonialism'; the Islamic scholarship of Timbuktu and Sokoto; African-led Christian growth and the Mourides turning a colonial economy to their own ends; Indigenous survival and legal victories such as Mabo, Delgamuukw and McGirt; the revival of navigation aboard Hōkūleʻa; non-European empires such as the Qing conquest of the Dzungars. Credit answers that note Brocheux and Hémery's 'ambiguous colonization' or argue that the answer differs between settler colonies and colonies of exploitation.", "id": "q6"}
  ]$mn_regional_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
