-- Central Asia and the Steppe — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/central-asia-and-the-steppe @ research/advanced/read.
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
    'history/regional-histories/asia/central-asia-and-the-steppe',
    'research',
    'advanced',
    'read',
    $mn_centralasia_master$> **The heart of Eurasia, not a corridor.** Central Asia is often seen only as a space between other civilisations. This chapter looks at it from within: the grasslands where the domestic horse was first bred, the herding peoples who built empires from the Xiongnu to the Turks, the merchant cities of Sogdiana and the scholars of Samanid Bukhara, Timur and his heirs, and the Kazakh, Uzbek and Dzungar states that Russia and Qing China conquered. It then follows the region through Soviet rule, the Kazakh famine of 1930–1933 and the drying of the Aral Sea, the mass detentions in China's Xinjiang, and independence after 1991 and the debates over each stage.

## The Steppe and the Horse

The historian David Christian has argued that "Inner Eurasia" is a single unit of world history, because its societies lived above all from animals, where the farmers of "Outer Eurasia" lived from plants. The animal that mattered most was the horse, and where it was first tamed is a lively debate. The **Botai culture** of northern Kazakhstan (c. 3700–3100 BCE) left enormous numbers of horse bones, corral-like enclosures and layers of horse dung. In 2009 Outram and colleagues reported bit-wear on horse teeth and what they read as mare's milk in Botai pottery. Others replied that Botai horses were wild animals that were hunted, and later studies found no evidence that Botai people consumed dairy.

Genetics changed the question. In 2018 ancient genomes showed that modern domestic horses do not descend from Botai horses; the same study argued that Przewalski's horses are feral descendants of Botai horses, though whether the Botai horses were domesticated at all is still disputed. Studies by Librado and colleagues in 2021 and 2024 traced the modern lineage to the **Volga–Don region** of the Pontic–Caspian steppe around **2200 BCE**, whence it spread rapidly across Eurasia, as the chapter on The Neolithic Revolution: Farming and Its Costs also reports. The 2024 study argued against domestic herds accompanying the **Yamnaya** herders of around 3000 BCE, and whether the Yamnaya rode at all is disputed: a 2023 study found skeletal traits it attributes to riding, while the archaeozoologist William T. Taylor argues that domestication long postdates them. The clearest early evidence is the pairs of horses buried with spoke-wheeled chariots by the Sintashta and Petrovka cultures southeast of the Urals (c. 2100–1700 BCE).

## Scythians, Saka and Xiongnu

The Greeks called the steppe horsemen north of the Black Sea **Scythians**, a name that seems to come from their own word for "archers"; the Persians called northern nomads **Saka**. The Scythians, Eastern Iranian speakers, had moved west from Central Asia to the Pontic steppe in the ninth and eighth centuries BCE. Yet their culture of burial mounds (kurgans) and the "animal style" seems to have begun in the east, where the kurgan of Arzhan 1 in Tuva is older than western ones; the "Golden Man" armour from the Issyk kurgan near Almaty shows the wealth of Saka elites.

On China's northern frontier, **Modu** became *chanyu* of the **Xiongnu** in 209 BCE and united a powerful confederation. In 200 BCE he surrounded the Han founder at Baideng, and the resulting *heqin* treaties, marriage alliances with growing "gifts", set the pattern for about sixty years; the wars that followed are told in the chapter on Han China (206 BCE–220 CE). Whether the Xiongnu were linked to the **Huns** who appeared in Europe in the 370s remains possible but unproven.

## Nomads and Farmers: a Debate

How did nomad empires relate to their farming neighbours? Older ideas that steppe nomads could be self-sufficient have not survived scrutiny. **Anatoly Khazanov**, a Moscow-trained Soviet anthropologist who emigrated in 1985, argued in *Nomads and the Outside World* (1984) that nomads were "never autarkic" but depended on the sedentary world, a view most specialists now share. **Thomas Barfield**, in *The Perilous Frontier* (1989), argued that steppe empires rose in tandem with unified Chinese empires and lived off them by raiding and extortion. **Nicola Di Cosmo** departed from this dependence model, rebuilding the frontier from archaeology and a critical reading of the Han historian Sima Qian, our earliest detailed source on the Xiongnu. **Christopher Beckwith** (*Empires of the Silk Road*, 2009) calls Central Eurasia the core of civilisation, not a land of barbarians; critics call his account flawed and hyperdiffusionist.

## Sogdians and Turks

Between the fourth and eighth centuries the merchants of **Sogdiana**, the land around Samarkand, became the great middlemen of Eurasian trade, as the chapter on The Silk Roads describes. Their language was a lingua franca. In the Arab conquest Samarkand's ruler submitted, while Divashtich of Panjakent resisted in the mountains, leaving the documents of Mount Mugh; Sogdians who fled to Khujand were massacred, and from 722 many, Nestorian Christians among them, moved east. Panjakent's murals of around 740 include a scene from the Indian Panchatantra fables, later known in Arabic as *Kalila wa-Dimna*.

The steppe meanwhile produced a new power. In 552 **Bumin Qaghan** of the Ashina clan overthrew his Rouran overlord, who had earlier rebuffed him, by the Chinese chronicles' account, as "my blacksmith slave", possibly a mark of the Turks' vassal duty of supplying iron. His **First Turkic Khaganate** (552–603) was the first state to use the name "Türk" politically, though Sogdian was a court language. The Turks devised their own script, and in the early eighth century raised the **Orkhon inscriptions** in Mongolia, Old Turkic and Chinese steles for the prince Kul Tigin and his brother Bilge Qaghan. The **Uyghur Khaganate** (744–840) followed; its khagan Bögü converted to Manichaeism in 762–763 and made it the official faith.

In 751 an Abbasid army with Karluk allies defeated the Tang at **Talas**. The famous story that Chinese prisoners taken there taught papermaking to the Islamic world is disputed, and the An Lushan rebellion of 755, described in the chapter on Tang and Song China, did more than Talas to end Tang power in the west.

## Islam and the Persian Revival

Islam did not at first change who lived in Central Asia, which remained mainly Iranian-speaking. The **Samanids** (819–999), a Persianate Sunni dynasty of Iranian *dehqan* origin, ruled from Samarkand and then, after Ismail Samani united the family's lands in 892, from Bukhara. They patronised the poets Rudaki and Ferdowsi and the young Ibn Sina (Avicenna), born near Bukhara. Bukhara was said to rival Baghdad, and scholars credit the Samanids with doing more than their rivals the Buyids or Saffarids to revive Persian, while Arabic remained the language of science and religion. By their end Sogdian had given way to New Persian and conversion to Islam was virtually complete. Turkic military slaves held real power by 945, and in 999 the state fell to the Ghaznavids and the Muslim **Kara-Khanids**. In 1072–74 Mahmud al-Kashgari compiled the *Dīwān Lughāt al-Turk*, the first comprehensive dictionary of the Turkic languages.

## Mongols and Timur

The Mongol conquest of 1219–1221 and the Chagatai khanate that followed are described in the chapter on The Mongol Empire. From that khanate's western half came **Timur** (Tamerlane), born into the Turkicised Mongol Barlas clan near Kesh (Shahrisabz), south of Samarkand. Later Timurid histories give his birth as 1336, but most sources from his own lifetime imply a date in the late 1320s, and the historian Beatrice Manz calls 1336 "probably an invention". Timur held power by 1370. Not a descendant of Chinggis Khan, he took instead the title *güregen*, "son-in-law", through marriage to a Chinggisid wife. His campaigns reached Isfahan, Baghdad and Delhi (1398), and in 1402 he captured the Ottoman sultan Bayezid I at Ankara; scholars estimate that they killed millions. Ibn Khaldun, who met him at Damascus in 1401, called him "sultan of the Mongols and Tatars". He died in 1405 at Otrar, setting out to invade Ming China.

{{image: Ulugh Beg Madrasa | The madrasa that Timur's grandson Ulugh Beg built in Samarkand.}}

His grandson **Ulugh Beg** (1394–1449) built a madrasa and an observatory in Samarkand, before he was overthrown and killed by his own son. Uzbek dynasties later drove Babur, founder of the Mughals, out of Ferghana and Samarkand, a story told in the chapter on The Mughal Empire.

```checkpoint
q: What does genetic evidence suggest about the Botai culture and the origin of the domestic horse?
a*: That modern domestic horses do not descend from Botai horses, and that their lineage arose in the Volga–Don region around 2200 BCE.
a: That Botai horses were the direct ancestors of all modern domestic horses.
x: A 2018 genome study found that modern domestic horses do not descend from Botai horses.
a: That the horse was first domesticated in Han China.
x: The evidence points to the western steppe, long before the Han dynasty.
a: That the Yamnaya certainly rode domestic horses around 3000 BCE.
x: The 2024 study argued against domestic horse herds accompanying the Yamnaya, and Yamnaya riding is disputed.
hint: Think of the Pontic–Caspian steppe.
why: Ancient genomes overturned the idea that Botai was the cradle of the domestic horse, though one study argues that Przewalski's horses descend from Botai horses.
---
q: Why did Timur take the title güregen ("son-in-law") rather than khan?
a: Because he was a Persian noble with no link to the steppe.
x: He was born into the Barlas, a Turkicised Mongol clan, and contemporaries called him a Mongol.
a: Because the Ottoman sultan forbade him to use the title.
x: Timur defeated and captured the Ottoman sultan Bayezid I in 1402.
a*: Because he was not descended from Chinggis Khan, and gained a link to that lineage by marriage.
a: Because he ruled only as governor for the Ming emperor.
x: Timur died while setting out to invade Ming China.
hint: Who was entitled to be khan in the Mongol world?
why: Descent from Chinggis Khan conferred legitimacy, so Timur claimed it by marriage instead.
```

## Khanates, Kazakhs and Dzungars

After the Timurids, Uzbek dynasties ruled the oasis cities: the **Khanate of Bukhara** from 1501, which in 1785 became an emirate under the Manghit dynasty, who were not descended from Chinggis Khan and so called themselves emirs rather than khans; the Khanate of **Khiva**; and from 1709 the Khanate of **Kokand**.

On the steppe, the **Kazakh Khanate** emerged when Kerei and Janibek broke away from Abu'l-Khayr's Uzbek khanate, a successor of the Golden Horde, around 1465 in the date commonly accepted by Kazakh historians. It later divided into three *zhuz*, or hordes, the Senior, Middle and Junior. In 1723 a Dzungar invasion brought what Kazakhs remember as the "Great Disaster", and in 1731 Abu'l Khayr, khan of the Junior Zhuz, swore allegiance to the Russian empress Anna, seeking help against his rivals. Ablai Khan later reunited the Kazakhs and balanced between Russia and Qing China, but after his death in 1781 the khanate split again, and Russia abolished the khans in the 1820s.

The **Dzungar Khanate** (1634–1758) of the Oirat Mongols has been called the last nomadic empire. After Amursana's rebellion of 1755, the Qianlong Emperor ordered the Dzungars' eradication. "Show no mercy at all to these rebels," ran his orders, in Peter Perdue's translation. "Only the old and weak should be saved."

Michael Clarke and others estimate that 70–80 per cent of the Dzungars died from war and disease, roughly 420,000–480,000 people; higher figures of 600,000–800,000 found in some popular works exceed the total population Wei Yuan recorded. The Qing scholar Wei Yuan wrote that of some 600,000 Dzungars, 40 per cent of households died of smallpox, 20 per cent fled to Russia or the Kazakhs and 30 per cent were killed by Qing troops. Recent scholarship calls this the Dzungar genocide, as the chapter on Chinese History explains.

## The Russian Conquest and the "Great Game"

Russia's advance began with failures, at Khiva in 1717 and 1839. Then, as the chapter on Imperial Russia from Napoleon to 1905 describes, came Kenesary Qasymuly's Kazakh revolt (1837–1847), the capture of Tashkent in 1865, Bukhara's defeat in 1868, the fall of Khiva in 1873 and the abolition of Kokand in 1876. At **Geok Tepe** in 1881 Russian forces killed thousands of Tekke Turkmen (estimates run from about 6,000 to 20,000), and a clash at Panjdeh in 1885 brought Britain close to war.

That rivalry gave the age its famous name, coined by a British officer, Arthur Conolly, who was executed in Bukhara in 1842.

```quote
You've a great game, a noble game, before you
Arthur Conolly · letter to Henry Rawlinson · July 1840
```

Kipling's *Kim* (1901) made "the Great Game" famous, but does it explain much? Malcolm Yapp, in "The Legend of the Great Game" (2000), noted that the term became common only after the Second World War, that British India feared its own population more than a Russian invasion, and that the archives show no British intelligence network in Central Asia. Gerald Morgan and Robert Middleton were similarly sceptical, while Evgeny Sergeev treats it as real great-power competition. Alexander Morrison argues that it explains little about Russian motives. Critics such as Marlene Laruelle add that talk of a "New Great Game" today treats Central Asian states as mere pawns.

Russian rule ended in catastrophe. In 1916 a decree conscripting Central Asian men into labour battalions set off a revolt, whose suppression and the flight to China caused an estimated 100,000–500,000 deaths, mostly Kyrgyz and Kazakhs. Kyrgyz estimates put the toll at up to 270,000, which the historian Edward Sokol reckoned as perhaps 40 per cent of the Kyrgyz, and Kyrgyz memory calls it the *Ürkün*, the "exodus".

## Soviet Central Asia: Making Nations

In February 1918 the Bolsheviks stormed Kokand, seat of an autonomous Turkestan government, and faced **Basmachi** resistance into the early 1930s. In 1924 Moscow redrew the map in the **national-territorial delimitation**: the old states were partitioned, and Uzbek and Turkmen Soviet republics were created that year, with Tajik, Kyrgyz and Kazakh republics following in 1929 and 1936. Bukhara and Samarkand, with their large Tajik populations, stayed in Uzbekistan. Even names were unsettled: the Kazakhs were officially called "Kyrgyz", and the Kyrgyz "Kara-Kyrgyz". From 1923 *korenizatsiia*, "indigenisation", promoted local languages and non-Russian cadres.

A popular reading sees the borders as deliberate "divide and rule"; archive-based studies stress competing ethnic, economic and local claims, and note that the lines were never meant to be international frontiers. Terry Martin's *The Affirmative Action Empire* (2001) argued that the Soviet state systematically promoted non-Russian nations and elites, building on Yuri Slezkine's image of the USSR as a "communal apartment". Francine Hirsch, in *Empire of Nations* (2005), showed how former imperial ethnographers and local elites supplied the census and border knowledge that shaped the national units. Adeeb Khalid, in *Making Uzbekistan* (2015), stresses the agency of Central Asian reformers, the Jadids.

## The Kazakh Famine

In Kazakhstan the famine known as the ***Asharshylyq*** began in late 1930, a year before the worst of the Ukrainian famine, and lasted through 1933. It followed a livestock-killing freeze, a *zhut*, in 1927–28, and the 1928 "Small October" campaign under the republic's party chief **Filipp Goloshchyokin** that confiscated herds from wealthier Kazakhs. In 1930–31 a third of livestock was confiscated, grain was seized, districts were "blacklisted" from trade, and nomads were forced to settle. Herds fell by 80 per cent.

The usual estimate is that 1.3–2.3 million people died, most of them Kazakhs; others put the toll at about 1.75 million or above 2 million. Between 38 and 42 per cent of all Kazakhs died, the highest proportion of any people in the Soviet famines, as the chapter on The Soviet Union: History of the Soviet Empire records. Sarah Cameron's publisher gives "more than 1.5 million", a quarter of Kazakhstan's population; Robert Kindler's gives nearly a third of the Kazakh population. Between 665,000 and 1.1 million people fled abroad or to other republics, and thousands were shot at the Chinese border. Soviet schools later blamed the weather.

Whether to call it genocide is debated, and Kazakh historians led the way. After independence Zhulduzbek Abylkhozhin and Makash Tatimov spoke of "Goloshchyokin's genocide", and a parliamentary commission chaired by Manash Kozybayev concluded in 1992:

```quote
the magnitude of the tragedy was so monstrous that we can, with full moral authority, designate it as a manifestation of the politics of genocide
Kazakhstan parliamentary commission chaired by Manash Kozybayev · 1992
```

Later official Kazakh history spoke instead of a "humanitarian catastrophe". Cameron, in *The Hungry Steppe* (2018), ties the famine to Moscow's project of turning nomads into a modern Soviet Kazakh nation, and says there is evidence it fits an expanded definition of genocide. Niccolò Pianciola shows that Kazakh livestock was requisitioned to feed Moscow, Leningrad and the army, a "hierarchy of consumption", and argues that in Lemkin's sense all Soviet nomads were victims. Stephen Wheatcroft calls the policies "criminal acts of negligence" rather than intentional genocide. Today 31 May is a day of remembrance in Kazakhstan.

## The Aral Sea and Semipalatinsk

The **Aral Sea**, once the world's fourth-largest lake, began shrinking in the 1960s as Soviet irrigation diverted the Amu Darya and Syr Darya; by 2007 it was a tenth of its former size, split into separate lakes, and in 2014 its eastern basin dried out completely. Visiting Moynaq in 2010, the UN Secretary-General Ban Ki-moon called it "one of the planet's worst environmental disasters". A Kazakh dam of 2005 has partly restored its northern part. On the steppe, the Soviet Union carried out some 456–468 nuclear tests at **Semipalatinsk** between 1949 and 1989, as the chapter on Global Cold War and the Arms Race notes; Kazakh experts estimate that 1.5 million people were exposed to fallout. The site was closed on 29 August 1991.

```checkpoint
q: Why do many historians now treat the "Great Game" with caution?
a: Because Britain and Russia never had any interests in Central Asia.
x: Both empires had interests; the debate is about how far rivalry explains events.
a*: Because scholars such as Yapp and Morrison argue that it explains little about Russian motives or British concerns, and Laruelle that talk of a "New Great Game" treats Central Asians as pawns.
a: Because the phrase was invented by Soviet historians in the 1930s.
x: It came from the British officer Arthur Conolly in 1840 and was popularised by Kipling's Kim.
a: Because Kipling's novel Kim disproved it.
x: Kim popularised the phrase; it did not disprove anything.
hint: Think of Malcolm Yapp's 2000 lecture.
why: The rivalry was real in some form, but the frame hides the motives of the empires and the agency of Central Asians.
---
q: Which statement best describes the debate over the Kazakh famine of 1930–1933?
a: All historians agree it was intended as genocide from the start.
x: Wheatcroft, for one, calls it criminal negligence rather than intentional genocide.
a: It is agreed that the famine was caused by bad weather alone.
x: That was the Soviet school explanation; historians stress confiscation of herds, grain requisitions and forced settlement.
a: Kazakhstan's state has never used the word genocide about it.
x: The Kozybayev commission used it in 1992, though later official history preferred "humanitarian catastrophe".
a*: Kazakh historians and a 1992 parliamentary commission called it genocide, while others such as Wheatcroft see criminal negligence, and Cameron and Pianciola argue it fits a broader definition.
hint: Remember who first used the word, and what Wheatcroft argued.
why: The famine's causes are well documented; the dispute is over intent and the definition of genocide.
```

## Xinjiang under the People's Republic

Xinjiang, which the Qing reconquered and made a province in 1884 (see the chapter on The Taiping Rebellion and the Late Qing), followed a different path. A First East Turkestan Republic (1933–34) was destroyed by Hui forces amid a Soviet-backed intervention on behalf of the provincial governor; a second, born of the Ili rebellion of 1944, was absorbed into the People's Republic in 1949. After riots in Ürümqi in 2009 left over a hundred dead, and attacks attributed to Uyghur militants, the government announced a "Strike Hard" campaign against terrorism in 2014. From 2017, under the regional party secretary **Chen Quanguo**, the authorities detained large numbers of Uyghurs, as well as Kazakhs, Kyrgyz and others, in camps they called "vocational education and training centers". The researcher Adrian Zenz estimated in 2020 that up to 1.8 million people had been held; other reporting speaks of over an estimated one million. Chinese government statistics show birth rates in the mainly Uyghur prefectures of Hotan and Kashgar falling by more than 60 per cent between 2015 and 2018.

China's position is that these are counter-terrorism and vocational training measures. It denied the camps until 2018, said in 2019 that the centres had closed, and denies human-rights abuses. The US State Department declared the policies a genocide in 2021. The UN Human Rights Office said in 2022 that China's actions "may constitute" crimes against humanity, without using the word genocide. At the UN, mainly North American and European states have signed letters condemning the policies, and mainly Asian and African states letters supporting them as counter-terrorism. Among scholars, Barry Sautman denies the genocide claims, while Magnus Fiskesjö calls his work "genocide-denialist".

## Independent Central Asia

Kazakhstan was the last Soviet republic to declare independence, on 16 December 1991; in Turkmenistan, Saparmurat Niyazov had opposed independence for his own republic. As the chapter on Collapse of the Soviet Union and Eastern Europe: the End of the Cold War notes, the old leaders mostly stayed on. Islam Karimov ruled Uzbekistan from 1989 until his death in 2016, when Shavkat Mirziyoyev succeeded him; Nursultan Nazarbayev led Kazakhstan until handing over to Kassym-Jomart Tokayev in 2019.

Tajikistan's civil war (1992–1997) killed 50,000–100,000 people. At Andijan in Uzbekistan in May 2005, troops fired on protesters; the government counted 187 dead, others estimate several hundred. That year Kyrgyzstan's Tulip Revolution overthrew President Askar Akayev. In January 2022 protests in Kazakhstan over a sudden rise in gas prices brought in troops of the Russian-led CSTO alliance; 238 people were killed and more than 9,900 arrested. The region's pasts, from the *Ürkün* to the *Asharshylyq*, are now argued over by its own historians.

## Further exploration

- **Peter B. Golden, *Central Asia in World History* (2011).** A short survey from prehistory to the present.
- **David Christian, *A History of Russia, Central Asia and Mongolia, Volume I: Inner Eurasia from Prehistory to the Mongol Empire* (1998).** Treats Inner Eurasia as a coherent ecological and historical unit.
- **Peter C. Perdue, *China Marches West: The Qing Conquest of Central Eurasia* (2005).** The Qing, the Dzungars and Russia.
- **Alexander Morrison, *The Russian Conquest of Central Asia: A Study in Imperial Expansion, 1814–1914* (2020).** An archive-based history that rejects the "Great Game" frame.
- **Adeeb Khalid, *Central Asia: A New History from the Imperial Conquests to the Present* (2021).** The region from the Russian and Qing conquests to independence.
- **Sarah Cameron, *The Hungry Steppe: Famine, Violence, and the Making of Soviet Kazakhstan* (2018).** The Kazakh famine and its place in Soviet nation-making.
- **James A. Millward, *Eurasian Crossroads: A History of Xinjiang* (2007; revised 2021).** Xinjiang's long history, with a new chapter on recent policy.$mn_centralasia_master$,
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
  select $mn_centralasia_quiz$[
    {"type": "mcq", "prompt": "Where do genetic studies by Librado and colleagues (2021, 2024) place the origin of the modern domestic horse lineage?", "options": ["The Botai culture of northern Kazakhstan, c. 3500 BCE", "The Volga–Don region of the Pontic–Caspian steppe, c. 2200 BCE", "The Orkhon valley of Mongolia, c. 700 CE", "The Ferghana valley, c. 1000 BCE"], "answerIndex": 1, "explanation": "Ancient genomes trace the modern domestic lineage to the Volga–Don region around 2200 BCE; a 2018 study showed that modern domestic horses do not descend from Botai horses.", "id": "q1"},
    {"type": "mcq", "prompt": "Which dynasty, ruling from Samarkand and then Bukhara between 819 and 999, is credited with reviving Persian language and culture and patronised Rudaki, Ferdowsi and the young Ibn Sina?", "options": ["The Timurids", "The Shaybanids", "The Manghits", "The Samanids"], "answerIndex": 3, "explanation": "The Samanids, a Persianate Sunni dynasty of Iranian dehqan origin, made Bukhara a cultural centre said to rival Baghdad.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Kozybayev parliamentary commission in Kazakhstan conclude in 1992 about the famine of 1930–1933?", "options": ["That it could be designated a manifestation of the politics of genocide", "That it was caused by bad weather alone", "That it was a minor local food shortage", "That it began after the Ukrainian famine had ended"], "answerIndex": 0, "explanation": "The commission said the tragedy was so monstrous that it could be designated a manifestation of the politics of genocide; later official history preferred 'humanitarian catastrophe', and historians such as Wheatcroft see criminal negligence rather than intent.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the UN Human Rights Office say in 2022 about China's policies in Xinjiang?", "options": ["That they were legitimate vocational training", "That they amounted to genocide", "That they 'may constitute' crimes against humanity", "That the camps had never existed"], "answerIndex": 2, "explanation": "The OHCHR said China's actions 'may constitute' crimes against humanity without using the word genocide; the US State Department declared genocide in 2021, while China calls the measures counter-terrorism and vocational training and denies abuses.", "id": "q4"},
    {"type": "open", "prompt": "How have historians explained the relationship between steppe nomads and settled states? Compare at least two views.", "rubric": "A strong answer contrasts the older idea that nomads could be self-sufficient with Khazanov's argument (Nomads and the Outside World, 1984) that nomads were 'never autarkic' and depended on the sedentary world, now the majority view; explains Barfield's argument (The Perilous Frontier, 1989) that steppe empires rose in tandem with unified Chinese empires and lived off them by raiding and extortion; notes that Di Cosmo departed from this dependence model using archaeology and a critical reading of Sima Qian; and may mention Beckwith's claim that Central Eurasia was the core of civilisation and the criticism of it. It illustrates with examples such as the Xiongnu and the heqin treaties.", "id": "q5"},
    {"type": "open", "prompt": "Was the Soviet delimitation of Central Asia in 1924 a policy of 'divide and rule'? Assess the debate.", "rubric": "A strong answer describes the 1924 national-territorial delimitation (partition of Bukhara and Khorezm, Uzbek and Turkmen SSRs in 1924, Tajik, Kyrgyz and Kazakh republics in 1929 and 1936, Bukhara and Samarkand left in Uzbekistan) and korenizatsiia from 1923; sets the popular 'divide and rule' reading against archive-based studies stressing competing ethnic, economic and local claims and borders never meant as international frontiers; uses Terry Martin's 'affirmative action empire', Hirsch's account of ethnographers and local elites shaping national units, Slezkine's 'communal apartment', and Khalid's emphasis on Central Asian (Jadid) agency; and reaches a reasoned judgement.", "id": "q6"}
  ]$mn_centralasia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/central-asia-and-the-steppe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
