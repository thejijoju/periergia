-- Imperial Russia from Napoleon to 1905 — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/imperial-russia-from-napoleon-to-1905 @ research/advanced/read.
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
    'history/modern-era-19th-century/imperial-russia-from-napoleon-to-1905',
    'research',
    'advanced',
    'read',
    $mn_russia_master$> **The autocracy that modernised without reforming itself.** Between Napoleon's defeat and the revolution of 1905 the Russian Empire freed its serfs, conquered the Caucasus and Central Asia and laid a railway to the Pacific, yet its tsars never gave up unlimited power. This chapter follows the Decembrists, Nicholas I's "Orthodoxy, Autocracy and Nationality", the Crimean War, Alexander II's Great Reforms, the revolutionaries who killed him, the counter-reforms, Russification and pogroms that followed, Witte's industrialisation, defeat by Japan and the revolution of 1905, seen from Warsaw, Kiev, Helsinki, the Caucasus, Central Asia, Siberia and the Pale of Settlement as well as from St Petersburg.

## An Empire, Not a Nation

The earlier story is told in the chapter on Russia from Muscovy to Catherine the Great, and the war of 1812 and the Congress of Vienna, which placed a Polish kingdom under the tsar, in the chapter on Napoleon and the Remaking of Europe. The empire's first and only census, in 1897, counted 125,640,021 people, the world's third most populous state after the British and Qing empires. It asked mother tongue, not nationality, and "Great Russian" speakers were only 44.31 per cent; officials counted Ukrainian and Belarusian as dialects of Russian. About 69 per cent of subjects were Orthodox, 11 per cent Muslim, 9 per cent Catholic and 4 per cent Jewish.

Historians disagree about how to describe such a state. Geoffrey Hosking argues that the needs of the empire impeded the formation of a Russian nation; Andreas Kappeler insists on a multi-ethnic history rather than a history of "Russia". Officials called the Russification of Ukrainians and Belarusians the "organic consolidation" of an "all-Russian" nation, a claim Ukrainian and Belarusian nationalists rejected. Dates here are Gregorian; Russia's Julian, or Old Style (OS), calendar ran 12 days behind in the nineteenth century and 13 from 1900.

## The Decembrists and Nicholas I

Alexander I died suddenly in December 1825. His brother Konstantin had privately renounced the throne, so the next brother, Nicholas, was heir, and the confusion over the oath gave a conspiracy of officers its chance. On 14 December (OS) they led about 3,000 soldiers into Senate Square in St Petersburg, refusing to swear allegiance to Nicholas. About 9,000 loyal troops faced them; at the end of the day Nicholas ordered grapeshot, and rebels fleeing across the frozen Neva were fired on and many drowned. Five leaders, among them Pavel Pestel, were hanged in 1826, and many others were sent to hard labour in Siberia. Wives such as Maria Volkonskaya followed them into exile. "In one sense," Hosking writes, "the reign of Nicholas I was a protracted epilogue to the Decembrist rising."

Nicholas (reigned 1825–1855) ruled by vigilance. His political police, the Third Section, had a staff of only 16 and some 300 gendarmes at first, but relied on informers and opened letters. In 1833 the education minister, Sergey Uvarov, told educators to teach "in the joint spirit of Orthodoxy, Autocracy and Nationality", which Hosking calls Russia's first statewide political ideology since the sixteenth century.

For non-Russians the reign ended local autonomies, including the Jewish communal *qahal* in 1844. An edict of 1827 conscripted Jewish boys for 25 years; many were taken, officially from twelve but in practice often younger, into "Cantonist" schools, where some were pressured to convert. When the Poles rose in 1830, as the chapter on Nationalism and the Making of Nation-States describes, the Sejm deposed Nicholas as king; after defeat Polish autonomy was ended, Vilnius University closed, and thousands left in the "Great Emigration". Emilia Plater fought for the rising in Lithuania. Finland kept its autonomy, partly because Finnish soldiers had helped crush the Poles.

## The Crimean Shock

Nicholas's demand to protect the sultan's Orthodox subjects led Russia to occupy the Danubian Principalities in 1853, and the Ottomans declared war; most historians see the dispute over the Holy Places as a pretext. Britain and France joined in 1854, besieged Sevastopol and took it in September 1855. Nicholas died mid-war. The empire had under 1,600 kilometres of railway, none near Crimea. Russian dead are estimated at 450,000 to 630,000, most from disease, and Ottoman estimates range from 45,400 to 400,000; nearly 200,000 Crimean Tatars were displaced. The Jamaican-born nurse Mary Seacole ran a "British Hotel" for sick officers. The Treaty of Paris (1856) closed the Black Sea to warships. Grand Duke Konstantin Nikolayevich admitted that Russia was "both weaker and poorer than the first-class powers".

A. J. P. Taylor thought the war "was fought against Russia, not in favour of Turkey". Orlando Figes stresses religion and Russian resentment of Western double standards: Mikhail Pogodin complained to Nicholas in 1853 that France could take Algeria and England annex Indian principalities without disturbing the balance of power, while Russian moves did. Nicholas annotated the memorandum approvingly.

## The Great Reforms

Alexander II drew the lesson. The emancipation of 1861 is told in the chapter on Abolition and Emancipation; here it was one reform among several. Landlords kept "cut-off" lands, the state advanced 75 per cent of the price, and peasants repaid it over 49 years, holding land through the village commune (*mir*). In many places peasants refused to believe the manifesto was genuine, and troops dispersed them. The traditional verdict stresses too little land and heavy payments; a 2018 study by Markevich and Zhuravskaya found "substantial increases in agricultural productivity, industrial output, and peasants' nutrition".

From 1864 elected councils, the zemstvos, spent on schools and medicine, though they were weighted towards nobles and absent from most borderlands. A judicial reform brought open trials and juries. Dmitry Milyutin, war minister, introduced universal conscription in 1874 for all classes, nobles included, with six years' service instead of twenty-five, and the reign abolished corporal punishment. Educated Jews could live outside the Pale. After Karakozov tried to shoot the tsar in 1866, the government turned more conservative.

The borderlands saw both faces of the reign. "Gentlemen, let us have no dreams!" Alexander told Polish nobles in 1856. The January Uprising of 1863–64 became a guerrilla war across Poland, Lithuania, Belarus and Ukraine; Prussia helped suppress it, and its leader Romuald Traugutt was hanged in 1864. Figures for the repression differ: official data give 396 executed and 18,672 exiled to Siberia, Norman Davies 80,000 deported. To weaken the Polish gentry, the *szlachta*, the 1864 emancipation in Congress Poland was more generous than the Russian one. Finland fared differently: in 1863 Alexander reconvened its Diet, the first since 1809, and began raising Finnish to official status alongside Swedish. Finns still remember him as "the Good Tsar", and after the war of 1877–78 Bulgarians hailed him as the "Tsar Liberator".

```checkpoint
q: What did Dmitry Milyutin's military reform of 1874 introduce?
a*: Universal conscription for all classes, nobles included, with six years' service instead of twenty-five.
a: Elected district and provincial councils to fund schools and medicine.
x: Those were the zemstvos of 1864, a separate reform.
a: A professional army recruited only from serfs.
x: The reform did the opposite, extending service to every class.
a: Flogging and branding as standard army punishments.
x: Milyutin abolished corporal punishment and branding.
hint: Think of who now had to serve, and for how long.
why: The reform answered the Crimean defeat by building a modern mass army.
---
q: How did the 1864 emancipation in Congress Poland compare with the Russian one of 1861?
a: It was harsher, because the Poles had rebelled.
x: Despite the rising, Polish peasants received better terms.
a: It freed no one; Polish serfdom lasted until 1905.
x: Emancipation in Poland came in 1864.
a*: It was more generous, imposed after the January Uprising to weaken the Polish gentry.
a: It was identical, since one law covered the whole empire.
x: Poland received separate and different terms.
hint: Who did the tsar want to weaken in Poland?
why: Emancipation was also a weapon of imperial rule, setting peasants against the rebel gentry.
```

## Conquest in the Caucasus

Russia had annexed the Georgian kingdom of Kartli-Kakheti in 1801. North of the mountains the Caucasian War lasted from 1817 to 1864. Its great resistance leader was Imam Shamil, an Avar and Naqshbandi Sufi, imam from 1834, who destroyed Vorontsov's column at Dargo in 1845. In 1859 he surrendered at Gunib to Baryatinsky, whose army in the Caucasus numbered some 250,000; after exile in Kaluga he made the pilgrimage to Mecca, met Emir Abdelkader there, and died in Medina in 1871.

The Circassians of the north-west suffered worst. In 1857 Milyutin proposed their mass expulsion; in Charles King's summary of his view, "eliminating the Circassians was to be an end in itself – to cleanse the land of hostile elements". Alexander II endorsed the plan. From 1862 General Nikolay Yevdokimov ordered the clearance of the western Caucasus: villages and food were burned, and survivors were driven to the Black Sea coast. Russian field reports called it *ochishchenie*, "cleansing".

The numbers rest on fragmentary data. Russian and Soviet estimates of those who left in the early 1860s range from about 312,000 to 493,000; Ottoman records show over a million Caucasus immigrants by 1879. Many died in camps at Trabzon and Varna. Walter Richmond estimates at least 625,000 dead, Shenfield between one and one and a half million. Circassians call it *Tsitsekun*. Georgia (2011) and Ukraine (2025) recognise it as genocide; Russia rejects the term. The diaspora settled across the Ottoman Balkans, Anatolia and the Levant.

## Central Asia and Siberia

On the Kazakh steppe Kenesary Qasymuly, who proclaimed himself khan of the Kazakhs, revolted from 1837 against Russian forts and Cossack raids. In 1865 Mikhail Chernyayev took Tashkent, exceeding his vague orders; a Governor-Generalship of Turkestan under Konstantin von Kaufman followed in 1867. Bukhara became a vassal in 1868, Khiva a protectorate in 1873, and Kokand was annexed in 1876. At Geok Tepe in 1881 Skobelev's army took the Teke Turkmen fortress after a siege and, by his own report, killed 8,000 people "of both sexes" in the pursuit; estimates of Teke dead run from at least 14,000 to 20,000.

Older accounts framed this as a "Great Game" with Britain; Alexander Morrison argues that the Great Game tells us little about Russian motives, which lay in prestige, frontier insecurity and conflicts with the khanates. In 1898 about 1,500 men, mostly Kyrgyz, under the Naqshbandi sheikh Dukchi Ishan attacked the Russian barracks at Andijan; 18 rebels, the sheikh among them, were executed.

In Siberia, Mikhail Speransky's statute of 1822 classed non-Slavic peoples as *inorodtsy*, with varying protections such as exemption from military service and protected grazing land; the term later grew pejorative. Siberian regionalists admitted that native peoples had suffered violence "of almost genocidal proportion" from colonisation. By the 1820s almost all Yakuts were nominally Orthodox while keeping older practices, and a Yakut literature arose late in the century.

## Intelligentsia, Populism and Terror

Alexander Herzen's *Kolokol* ("The Bell"), published in London, was smuggled into Russia. Nikolay Chernyshevsky wrote *What Is to Be Done?* (1863) in prison; its ascetic revolutionary Rakhmetov inspired a generation, and Lenin later borrowed the title. In 1874, "the mad summer" in Peter Kropotkin's phrase, thousands of students went "to the people" in the villages; the peasants were suspicious, and more than a thousand were arrested by the autumn.

In 1878 Vera Zasulich shot the St Petersburg governor, Trepov, after he had a political prisoner flogged; a jury acquitted her. In 1879 the movement split: Georgy Plekhanov's "Black Repartition" kept to propaganda and later seeded Russian Marxism, while *Narodnaya Volya* ("People's Will") chose terror and "sentenced" Alexander II to death. Fewer than fifty men and women ever sat on its Executive Committee, and Jews, especially women, were well represented in the party.

On 1 March 1881 (OS), shortly after the tsar approved Loris-Melikov's proposals for limited consultative representation, the terrorists struck. Andrei Zhelyabov had planned the attack but was arrested two days before, and Sophia Perovskaya directed it, signalling with a handkerchief. After a first bomb damaged the carriage, Ignacy Hryniewiecki, of Polish noble descent, threw the fatal one and died that evening; a fourteen-year-old delivery boy was also killed. Perovskaya was hanged in April, the first woman in Russia executed for a political crime. Hesya Helfman's sentence was deferred because she was pregnant, then commuted; Vera Figner, arrested in 1883, served twenty years.

## Counter-Reform, Russification and the Pogroms

Alexander III (reigned 1881–1894) cancelled Loris-Melikov's proposals on the advice of Konstantin Pobedonostsev, his former tutor, who called democracy "the insupportable dictatorship of vulgar crowd". Noble land captains were set over peasant communes in 1889. In 1887 Lenin's elder brother, Aleksandr Ulyanov, was hanged for plotting to kill the tsar.

Russification pressed on every frontier. In Ukraine the Valuev Circular of 1863 banned religious and educational books in Ukrainian, quoting the Kiev censors that "a separate Little Russian language never existed, does not exist, and shall not exist"; the Ems Ukaz of 1876 banned almost all Ukrainian printing. The national poet Taras Shevchenko, born a serf, had been exiled as a private soldier to the Orenburg region. Lithuanian printing in the Latin script was banned from 1865 to 1904, a ban defeated by book smuggling. In Poland, Polish was banned in schools and offices in the 1880s, and by Russian estimates a third of Congress Poland's people took part in clandestine teaching by the early 1900s. Nicholas II's February Manifesto of 1899 asserted imperial authority over Finnish law; 523,000 Finns signed a petition against it, and Governor-General Bobrikov was assassinated in 1904. Finns call these years the "times of oppression".

Jews bore the harshest burden. Most lived in the Pale of Settlement, which at its height held over five million Jews, about 40 per cent of the world's Jews. After the assassination, in which Helfman's role was exaggerated, more than 200 anti-Jewish riots broke out in 1881–82, mostly in Ukraine; at least 40 Jews were killed in 1881. Jewish students organised self-defence in Odessa, and Leon Pinsker, as the Nationalism chapter describes, called for Jewish *Auto-Emancipation*. The May Laws of 1882 barred new Jewish settlement outside towns, and about 20,000 Jews were expelled from Moscow in 1891. More than two million Jews left the Russian Empire between 1880 and 1920, mainly to the United States. Others organised: women were about a third of the members of the Jewish Labour Bund, founded in Vilna in 1897.

Were the pogroms organised by the state? Hans Rogger, I. Michael Aronson and John Klier found no evidence of central organisation in 1881–82, though authorities often tolerated violence and discriminatory laws fed it. At Kishinev in 1903, after blood-libel agitation in the newspaper *Bessarabets*, 47 to 49 Jews were killed, and Tolstoy and Gorky blamed the government. *The Times* printed a dispatch supposedly from the interior minister, Plehve, ordering officials not to stop the rioters, but it was a forgery. For the later wave some historians argue that local officials and the secret police incited many pogroms.

## Muslim Reformers: Gasprinsky and the Jadids

Among the empire's Muslims the answer to conquest was education. Ismail Gasprinsky, a Crimean Tatar, founded the newspaper *Tercüman* ("Interpreter") in 1883, read across the empire's Turkic regions and in Egypt and Iran. In 1884 he opened the first "new method" (*usul-i jadid*) school, teaching reading phonetically in the mother tongue alongside geography, history, mathematics and science. His daughter Şefiqa edited the women's paper *Alem-i Nisvan*.

```quote
Our ignorance is the main reason for our backward condition. … We must be able to read in order to overcome our isolation; we must learn European ideas from European sources.
Ismail Gasprinsky · Russian Muslims · 1881
```

His followers, the Jadids, called themselves "progressives". Mahmudkhoja Behbudiy carried their ideas to Turkestan and Abdurauf Fitrat to Bukhara. Their schools banned corporal punishment and encouraged girls, though few attended. They clashed with traditionalist scholars, the *qadimists*, a conflict Adeeb Khalid reads as a struggle over cultural authority within Central Asian society.

## Witte, the Railway and the War with Japan

Sergei Witte, whose father came from a Lutheran Baltic German family, a former railway manager, was finance minister from 1892 to 1903; his tariffs, foreign loans and gold standard are described in the chapter on the Second Industrial Revolution. The Trans-Siberian Railway was begun in 1891, when Tsarevich Nicholas inaugurated construction at Vladivostok; until the line around Lake Baikal was finished in 1904, travellers crossed the lake by ferry.

Nicholas II came to the throne in 1894. During his 1891 visit to Japan, when a policeman attacked him at Ōtsu, he came, Rotem Kowner argues, to regard the Japanese as weak and inferior. Russia leased Port Arthur in 1898 and took timber concessions on the Yalu; Japan offered to recognise Russian dominance in Manchuria in return for a free hand in Korea, whose emperor, Gojong, sought neutrality. War began in February 1904. The Baltic Fleet sailed for about seven months to meet destruction at Tsushima in May 1905, with 5,045 Russian dead. The military story is told from the Japanese side in the chapter on the Meiji Restoration; Witte led the Russian delegation that made peace at Portsmouth.

## The Revolution of 1905

On Sunday 9 January 1905 (OS), Father Georgy Gapon's Assembly of Russian Factory Workers marched to the Winter Palace with a petition, after a strike at the Putilov works had spread to about 150,000 workers. The tsar was not there. Troops opened fire; official figures put the dead at about a hundred, other estimates at several hundred, and contemporaries claimed thousands. Nicholas wrote in his diary: "A difficult day! … Lord, how painful and sad!"

{{image: Bloody Sunday (1905) | Petitioners led by Father Georgy Gapon near the Narva Gate, St Petersburg, January 1905.}}

About 414,000 workers struck that January. Textile workers at Ivanovo-Voznesensk formed an early soviet; the crew of the battleship *Potemkin* mutinied; peasants seized land. Amid a general strike in October and the formation of the St Petersburg Soviet, Nicholas signed the October Manifesto, prepared on Witte's advice, which promised civil liberties and a legislative Duma. But pogroms followed in 660 towns, killing at least 400 Jews in Odessa; the Black Hundreds incited violence, and Nicholas privately approved of the rioters as loyal subjects. A Moscow rising in December was crushed with artillery. The scale of repression is contested: Kovalevsky told the Duma that more than 14,000 had been executed by April 1906, while other figures are far lower. The Fundamental Laws of 1906 kept ministers, army and foreign policy in the tsar's hands, and the first Duma was dissolved after 73 days.

The revolution belonged to the borderlands too. In Congress Poland 93.2 per cent of industrial workers struck; Rosa Luxemburg said Poland "in 1905 marched at the head of the Russian Revolution". After a general strike in Finland, the reform of 1906 created a parliament elected by universal suffrage, making Finland the first European territory where women could stand for election. Latvian peasants fought Baltic German nobles; Georgian peasants in Guria ran their own republic. Ukrainians founded 34 newspapers in 1905 alone, and Gasprinsky helped found a Union of Muslims.

```quote
Without the 'dress rehearsal' of 1905, the victory of the October Revolution in 1917 would have been impossible.
Lenin · "Left-Wing" Communism: An Infantile Disorder · 1920
```

Lenin's verdict reads 1905 backwards from 1917. Other historians see a missed constitutional turn: the October Manifesto and the Duma created a limited constitutional monarchy that the Fundamental Laws then hollowed out. Either way, the autocracy had survived by conceding what it would not honour.

```checkpoint
q: What did Hans Rogger, I. Michael Aronson and John Klier conclude about the pogroms of 1881–82?
a: That Plehve ordered them in a secret dispatch.
x: The dispatch printed in The Times concerned Kishinev in 1903, and it was a forgery.
a*: That there was no evidence of central organisation, though authorities often tolerated the violence and discriminatory laws fed it.
a: That Narodnaya Volya organised them to provoke revolution.
x: They found no such evidence; their question was the role of the state.
a: That the riots caused no deaths.
x: At least 40 Jews were killed in 1881 alone.
hint: Distinguish central planning from local toleration.
why: The finding shifts the question from a plot at the top to the climate the state's own laws created.
---
q: What made Finland's parliamentary reform of 1906 notable?
a: It voted for full independence from Russia.
x: Finland remained a grand duchy of the empire.
a: It restored the Diet for the first time since 1809.
x: That happened in 1863, under Alexander II.
a: It made Russian the sole official language.
x: Finns had resisted Russification; the 1900 Language Manifesto made Russian the language of administration.
a*: Elected by universal suffrage, it made Finland the first European territory where women could stand for election.
hint: Think about who could stand as candidates.
why: The non-Russian borderlands turned the revolution of 1905 to their own ends.
```

## Further exploration

- **Andreas Kappeler, *The Russian Empire: A Multi-Ethnic History* (2001).** The standard account of the empire as a multinational state rather than "Russia".
- **Orlando Figes, *Crimea: The Last Crusade* (2010).** The Crimean War from Russian, French and Ottoman as well as British archives.
- **Walter Richmond, *The Circassian Genocide* (2013).** The conquest, expulsion and diaspora of the Circassians.
- **Alexander Morrison, *The Russian Conquest of Central Asia: A Study in Imperial Expansion, 1814–1914* (2020).** An archive-based history that rejects the "Great Game" frame.
- **Adeeb Khalid, *The Politics of Muslim Cultural Reform: Jadidism in Central Asia* (1998).** The Jadids in their own terms.
- **John Doyle Klier, *Russians, Jews, and the Pogroms of 1881–1882* (2011).** The most thorough study; it rejects the idea of a state-organised pogrom wave.
- **Yuri Slezkine, *Arctic Mirrors: Russia and the Small Peoples of the North* (1994).** Siberia's Indigenous peoples under tsars and Soviets.$mn_russia_master$,
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
  select $mn_russia_quiz$[
    {"type": "mcq", "prompt": "Which three principles did Sergey Uvarov's circular of 1833 tell Russian educators to teach in?", "options": ["Liberty, equality and fraternity", "Land, liberty and the commune", "Orthodoxy, autocracy and nationality", "Faith, tsar and fatherland"], "answerIndex": 2, "explanation": "Uvarov asked for education 'in the joint spirit of Orthodoxy, Autocracy and Nationality', the doctrine known as Official Nationality, which Hosking calls Russia's first statewide political ideology since the sixteenth century.", "id": "q1"},
    {"type": "mcq", "prompt": "Who directed the assassination of Alexander II on 1 March 1881 (Old Style) after Andrei Zhelyabov's arrest?", "options": ["Sophia Perovskaya", "Vera Zasulich", "Vera Figner", "Hesya Helfman"], "answerIndex": 0, "explanation": "Perovskaya signalled the bomb-throwers with a handkerchief; she was hanged in April 1881, the first woman in Russia executed for a political crime. Zasulich had shot Trepov in 1878.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Ems Ukaz of 1876 do?", "options": ["Abolished the Pale of Settlement", "Granted Finland its own currency", "Expelled the Circassians from the western Caucasus", "Banned almost all printing in Ukrainian"], "answerIndex": 3, "explanation": "It extended the Valuev Circular of 1863, which had banned religious and educational books in Ukrainian; the restrictions eased only in 1905.", "id": "q3"},
    {"type": "mcq", "prompt": "What was distinctive about Ismail Gasprinsky's 'new method' (usul-i jadid) schools, the first opened in 1884?", "options": ["They taught only in Russian to assimilate Muslims", "They taught reading phonetically in the mother tongue, with geography, history, mathematics and science", "They were run by the Holy Synod", "They admitted only the sons of the nobility"], "answerIndex": 1, "explanation": "Gasprinsky's schools combined phonetic literacy in the mother tongue with modern subjects; his followers, the Jadids, clashed with traditionalist qadimists.", "id": "q4"},
    {"type": "open", "prompt": "Should the expulsion of the Circassians in the 1860s be called a genocide? Assess the evidence and the debate.", "rubric": "A strong answer describes Milyutin's 1857 proposal of mass expulsion, Alexander II's endorsement and Yevdokimov's clearance from 1862 (burned villages and food, survivors driven to the coast, 'ochishchenie'); gives the ranges of refugees (Russian estimates about 312,000–493,000; Ottoman records over a million immigrants by 1879) and deaths (Richmond at least 625,000; Shenfield one to one and a half million), stressing that the data are fragmentary; notes deaths in camps at Trabzon and Varna; and sets recognition by Georgia (2011) and Ukraine (2025) against Russia's rejection of the term.", "id": "q5"},
    {"type": "open", "prompt": "Was the revolution of 1905 a 'dress rehearsal' for 1917, a missed constitutional turn, or a revolution of the borderlands? Discuss.", "rubric": "A strong answer explains Bloody Sunday, the strikes, soviets, mutiny and peasant risings, and the October Manifesto prepared on Witte's advice; weighs Lenin's 1920 'dress rehearsal' verdict against the view that the Manifesto and Duma created a limited constitutional monarchy hollowed out by the Fundamental Laws of 1906; and uses the borderlands (Poland's strikes and Luxemburg's claim, Finland's universal suffrage and women's right to stand for election, Latvia, Guria, the Ukrainian press revival, the Union of Muslims), together with the pogroms after the Manifesto and the contested scale of repression.", "id": "q6"}
  ]$mn_russia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/imperial-russia-from-napoleon-to-1905', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
