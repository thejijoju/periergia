-- Nationalism and the Making of Nation-States — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/nationalism-and-the-making-of-nation-states @ research/advanced/read.
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
    'history/modern-era-19th-century/nationalism-and-the-making-of-nation-states',
    'research',
    'advanced',
    'read',
    $mn_nation_master$> **One people, one state?** In the nineteenth century the idea that every "people", defined by language, culture or history, deserved a state of its own redrew maps around the world. This chapter follows it from Herder's folk songs and Haiti's declaration of 1804, through the Greek war, the revolutions of 1848 and the unifications of Italy and Germany, to the empires that tried to contain it: the Habsburg monarchy with its Compromise of 1867, and the Ottoman Empire with its Tanzimat reforms and hope of a common Ottoman citizenship. It looks at Irish, Polish and Hungarian movements; at Meiji Japan, which built a nation from above and absorbed Ryukyu and the Ainu; at 'Urabi's Egypt, the Indian National Congress, and Zionism and an early Palestinian reply to it. It ends with the historians' argument over whether nations are ancient communities or modern inventions.

## What Is a Nation?

In a lecture at the Sorbonne in 1882, Ernest Renan called a nation "a daily plebiscite", a community that keeps choosing to exist, and added a warning: "Forgetfulness, and I would even say historical error, are essential in the creation of a nation." Nations were made by choice and mobilisation, and also by selective memory. The principle at stake, as the philosopher Ernest Gellner later put it, was that "the political and the national unit should be congruent". In a world of empires, where peoples lived intermingled, that principle meant upheaval wherever it was tried.

## Herder, Fichte and the Spirit of a People

Johann Gottfried Herder (1744–1803), a Prussian-born pupil of Kant, argued that language and cultural tradition, rather than the state, bound a nation together. Language, he wrote in 1772, is "the natural organ of the understanding", and true German culture lived among the common people, *das Volk*, whose songs, poetry and dances expressed the spirit of a people. He inspired the Brothers Grimm to collect folk tales. "A poet is the creator of the nation around him," he wrote in 1773.

Herder was a pluralist rather than a chauvinist. Each nation, he held, carried its own standard of perfection that could not be measured against others, and he warned that "national glory is a deceiving seducer". Napoleon gave the idea a harder edge. After Prussia's defeat at Jena in 1806, described in the chapter on Napoleon and the Remaking of Europe, Johann Gottlieb Fichte delivered his *Addresses to the German Nation* in occupied Berlin in 1807–08, stressing the distinctiveness of the German language and traditions. One influential reading holds that Fichte and the poets of the 1813–15 war pushed German nationalism in an ethnic rather than a civic direction. Elsewhere, national epics such as the Finnish *Kalevala* were collected or composed.

## Haiti and the Creole Pioneers

The century's first new nation was not in Europe. On 1 January 1804, at Gonaïves, Jean-Jacques Dessalines proclaimed the independence of **Haiti**, the first independent nation of Latin America and the Caribbean, born of the only successful slave revolution, as the chapter on the French and Haitian Revolutions recounts. The new state took the Taíno name for the island, "land of high mountains", as a tribute to its Indigenous predecessors. Its constitution of 1805 declared that Haitians "shall hence forward be known only by the generic appellation of Blacks" and barred white men, with some exceptions, from owning property; historians debate whether this was a radical racialisation of citizenship or an assertion of Black sovereignty. In 1804 Dessalines ordered the massacre of the remaining white French, killing 3,000 to 5,000. France recognised Haiti only in 1825, in exchange for an indemnity of 150 million francs.

In Spanish America, criollo elites had long nursed a sense of difference from the peninsular Spaniards they called *gachupines*. In 1648 Miguel Sánchez's account of the Virgin of Guadalupe suggested that God had blessed Mexico and its criollos. Bourbon reforms that favoured peninsulares sharpened criollo grievances, and criollos such as Hidalgo, Bolívar and San Martín led the wars described in the chapter on Latin American Independence; Bolívar himself stayed in Haiti in 1816. Benedict Anderson later called these American creole states, with their creole officials and printers, the "Creole pioneers" of nationhood, ahead of Europe.

Independence did not settle who belonged. In Mexico, Benito Juárez, a Zapotec, became the first Indigenous president (1858–1872) and led Liberal resistance to Maximilian's French-backed empire. In 1891 José Martí, who organised Cuban émigré tobacco workers in Tampa and Key West, published "Nuestra América" ("Our America") in New York; he was killed at Dos Ríos in 1895.

## Breaking Away from the Ottomans

In the Balkans, nationalism grew inside a multi-religious empire. The Serbian Revolution (1804–1835) turned an Ottoman province into a constitutional monarchy. Greek ambitions were at first not narrowly national: Rigas Feraios had imagined a "Balkan Republic" of all Balkan peoples, Turks included, and the Filiki Eteria (Friendly Society), founded by merchants in Odessa in 1814, aimed, some historians argue, at reviving a Byzantine-style empire rather than founding a nation-state.

The Greek War of Independence (1821–1829), fought under the slogan "Freedom or death", saw massacres on both sides. Revolutionaries killed Muslims and Jews at Tripolitsa; on Chios in 1822 Ottoman forces killed at least 25,000 Greeks (some estimates are far higher) and sold about 45,000, mostly women and children, into slavery. In St. Clair's phrase the war was "a series of opportunist massacres". Byron's poetry and Delacroix's paintings rallied European opinion, and in 1827 British, French and Russian fleets destroyed the Ottoman–Egyptian fleet at Navarino. Yet independent Greece, recognised in 1830, held under a million people, with perhaps three times as many Greeks still under Ottoman rule: hence the *Megali Idea* of uniting all Greeks. At the Congress of Berlin in 1878 the great powers recognised independent Romania, Serbia and Montenegro but divided Bulgaria without letting Bulgarians take part.

## The Springtime of the Peoples, 1848

From January 1848 to October 1849 the most widespread revolutionary wave in European history touched over fifty countries, with no real coordination among the revolutionaries. German liberals called it the "springtime of the peoples". Its causes mixed liberalism and nationalism with the food crisis of 1845–47. Serfdom was abolished in Austria and Hungary.

Yet the springtime set nations against each other: German against Pole in Posen, German against Dane in Schleswig, German against Czech in Bohemia. The Czech historian František Palacký refused to join the German pre-parliament at Frankfurt, arguing instead for a federal Austria with autonomy for its Slavic peoples. In Pest the revolution began on 15 March 1848 with Sándor Petőfi's poem: "We swear by the God of the Hungarians; we swear, we shall be slaves no more." But the Hungarian Diet required its deputies to speak Hungarian, and Croats, Serbs, Romanians and some Slovaks fought for the Habsburgs against Lajos Kossuth's government. Hungary declared independence in 1849 and was crushed with Russian help. The Frankfurt National Assembly offered an imperial crown to Frederick William IV of Prussia, who privately likened it to "a dog collar". Outside Europe, New Granada's (Colombia's) liberal government, in power from 1849, abolished slavery in 1851, and Brazil and Chile saw revolts. Historians long called 1848 a failure; Christopher Clark argues that it produced a "revolution in government".

## Italy: A Kingdom in Search of Italians

The *Risorgimento*, or "rising again", began with conspirators. In 1831 Giuseppe Mazzini founded Young Italy in exile, aiming at "One, free, independent, republican nation". After the failures of 1848–49, leadership passed to the monarchy of Piedmont-Sardinia and its prime minister from 1852, Cavour, a modernizer of railways, banks and free trade. In 1859, in secret alliance with Napoleon III, Piedmont fought Austria and gained Lombardy; in 1860 the central Italian duchies joined, while Savoy and Nice were ceded to France.

Then came Giuseppe Garibaldi, the "Hero of the Two Worlds", who had spent fourteen years in exile, much of it fighting in South America. In May 1860 he and 1,089 volunteers with obsolete muskets landed in Sicily, and by September they had entered Naples. Cavour sent the army through the Papal States to stop him marching on Rome, and Garibaldi handed his conquests to Victor Emmanuel II, proclaimed King of Italy on 17 March 1861. Venetia followed in 1866 and Rome in 1870.

Unification also looked like conquest. Piedmont's constitution, taxes and officials were imposed on the rest of Italy, a process Martin Clark calls "Piedmontization". In the South, "brigandage" insurrections followed, a mixture of spontaneous peasant movement and Bourbon-clerical reaction, while northern correspondents depicted the South as "barbaric". Nor was there a common tongue: Tullio De Mauro estimated that only about 2.5 per cent of Italians could speak standard Italian in 1861, though Arrigo Castellani put it at nearly 10 per cent.

## Germany: Iron and Blood

The 39 states of the German Confederation were already being bound together by the Prussian customs union (Zollverein) and the railways. In 1862 Otto von Bismarck became minister president of Prussia, and during a conflict over the army budget he declared:

```quote
Not through speeches and majority decisions will the great questions of the day be decided—that was the great mistake of 1848 and 1849—but by iron and blood.
Otto von Bismarck · speech to the Budget Committee of the Prussian House of Representatives · 30 September 1862
```

Three wars followed: against Denmark in 1864, against Austria in 1866, and against France in 1870–71, which Bismarck provoked by editing the Ems telegram. On 18 January 1871 Wilhelm I was proclaimed emperor in the Hall of Mirrors at Versailles; France ceded Alsace and part of Lorraine and paid 5 billion francs. The new empire excluded Austria. Historians debate whether Bismarck had a master plan or simply expanded Prussian power, and stress forces beyond him, from railways to Roon and Moltke's army.

{{image: Proclamation of the German Empire | Wilhelm I is proclaimed emperor in the Hall of Mirrors at Versailles, 18 January 1871.}}

The new nation-state then set about making Germans. In the *Kulturkampf* it fought the Catholic Church. In Posen, German became the language of schooling and administration, and Polish was pushed out of the primary schools; between 1885 and 1890 more than 30,000 non-citizens, Poles and Jews, were expelled from the eastern provinces, and a Settlement Commission bought land for German settlers.

```checkpoint
q: Why did Renan say that "forgetfulness" was essential to the creation of a nation?
a*: Because nations rest on selective, sometimes mistaken memories of a shared past, leaving out the conflicts and divisions that made them.
a: Because he believed nations should abolish the teaching of history.
x: Renan was describing how nations work, not proposing to abolish history teaching.
a: Because he thought nations were natural and ancient and needed no memory at all.
x: His "daily plebiscite" treats the nation as a continuing choice, not a fixed natural fact.
a: Because the new nation-states of his time had no written records.
x: The problem was not a lack of records but the way memory selected among them.
hint: Think of what nations prefer to forget.
why: Renan saw that national unity depended on forgetting conflict and division, a point modern historians of nationalism have developed.
---
q: How did the revolutions of 1848 reveal a problem within nationalism itself?
a: They showed that nationalists everywhere cooperated closely across borders.
x: Over fifty countries were affected with no real coordination among revolutionaries.
a: They showed that only monarchs could be nationalists.
x: Frederick William IV of Prussia refused the imperial crown that the Frankfurt Assembly offered him.
a*: Rival nations claimed the same lands and people, so Germans clashed with Poles, Danes and Czechs, and Serbs and Romanians fought against Hungarian rule.
a: They showed that national movements had no interest in language.
x: The Hungarian Diet even required its deputies to speak Hungarian.
hint: Think of Posen, Schleswig, Bohemia and Hungary.
why: In mixed regions one people's national liberation often meant another people's subordination.
```

## Empires of Many Peoples: Habsburgs, Poles and Irish

The Austrian Empire held Germans, Hungarians, Czechs, Poles, Croats, Romanians, Serbs and many others. After defeats in 1859 and 1866, and near bankruptcy, Franz Joseph came to terms with Hungary. The Compromise of 1867 created a dual monarchy of Austria and Hungary, with separate parliaments but common foreign affairs and defence. Many Hungarians saw it as a betrayal of 1848. Austria's constitution of 1867 and Hungary's Nationalities Law of 1868 are cited as early minority-rights laws, yet Magyarisation pressure grew. In 1910 Hungarian speakers were 54.5 per cent of Hungary's population, but 96 per cent of civil servants and 97 per cent of judges had Hungarian as their first language; a law of 1907 (the Lex Apponyi) required non-state primary schools to teach their pupils Hungarian, and the Černová massacre of that year killed 15 Slovaks. Was the empire a "prison of nations"? Pieter Judson and Tara Zahra argue that many Habsburg subjects were "nationally indifferent", identifying with no single nation.

Poles rose in the November Uprising of 1830–31 and again in January 1863, when the insurgent government declared that "all sons of Poland are free and equal citizens" and promised land to peasants. Both risings were crushed, the second followed by executions, deportations to Siberia and restrictions on Polish. In Ireland, Daniel O'Connell mobilised Catholic Ireland to win Catholic emancipation in 1829. The Great Famine of 1845–1852 killed roughly a million people, and a million or more emigrated. Gladstone's Home Rule bills of 1886 and 1893 failed, and cultural nationalists founded the Gaelic Athletic Association (1884) and the Gaelic League (1893).

## Ottomanism: A Nation of Citizens?

Ottoman reformers tried to build loyalty to the empire itself. The **Tanzimat** ("Reorganisation") opened with the Edict of Gülhane in 1839 and brought secular courts, modern schools, railways and codified law, along with heavy foreign debt. The Reform Edict of 1856, issued under British and French pressure after the Crimean War, promised equality regardless of creed, and the Nationality Law of 1869 created a common Ottoman citizenship regardless of religion or ethnicity. This was **Ottomanism**, the "Unity of the Peoples". Many non-Muslims rejected it as the end of their privileges, and many Muslims as the end of their superior position.

The Young Ottomans, a secret society founded in 1865, wanted constitutional government, and Namık Kemal championed "freedom and fatherland" (*vatan*); his play *Vatan Yahut Silistre* (Homeland, or Silistra) led to his exile to Cyprus. Midhat Pasha dreamed of an empire where "there would be neither Muslim nor non-Muslim but only Ottomans". The constitution of December 1876 drew on the Armenian National Constitution of 1863. But Abdul Hamid II prorogued parliament in 1878 and ruled autocratically for about three decades, using ceremony and schooling, as Selim Deringil shows, to build an Ottoman citizenry. Historians still debate whether the Tanzimat strengthened the state or hastened its fragmentation.

## Meiji Japan: A Nation Made from Above

Japan offers the clearest case of a state making a nation. Imperial rule was declared restored on 3 January 1868, and the Charter Oath promised: "Knowledge shall be sought throughout the world so as to strengthen the foundation of imperial rule." In 1871 the domains were abolished and replaced by prefectures. Male conscription came in 1873 (the wealthy could buy exemption), and the conscript army crushed Saigō Takamori's Satsuma Rebellion. The state created a standard language based on the Tokyo samurai dialect, promoted State Shinto at the cost of tens of thousands of destroyed Buddhist images and temples, and issued a constitution on a Prusso-German model in 1889. The Imperial Rescript on Education of 1890, memorised by pupils, urged them, "should emergency arise", to "offer yourselves courageously to the State".

Fukuzawa Yukichi wrote that "Heaven never created a man above another nor a man below another", yet an unsigned 1885 editorial usually attributed to him urged Japan to distance itself from "backward" neighbours. Carol Gluck argues that the new national ideology was less consistent and more contested than usually supposed. Nation-building also meant internal colonisation. The Ryukyu Kingdom was annexed as Okinawa Prefecture in 1879, cutting its tributary tie to Qing China, and an act of 1899 designated the Ainu of Hokkaido a "former" indigenous people subject to assimilation.

## "Egypt for the Egyptians"

In Egypt, the Khedive Isma'il's debts placed the country's finances under Anglo-French control, while Turks, Circassians and Albanians held most elite posts. Ya'qub Sanu's satirical magazine *Abu Naddara* is credited with the slogan "Egypt for the Egyptians". Ahmed **'Urabi**, the first Egyptian political and military leader to rise from the *fellahin*, the peasantry, gave it force. In September 1881 he demanded the dismissal of Turco-Circassian generals and an elected government, and the Khedive Tewfik gave way. Opposed by Europeans, large landowners and the old elite but supported by most of the population, 'Urabi became minister of war in 1882. That July the British fleet bombarded Alexandria; in September British forces defeated him at Tel el-Kebir, and he was exiled to Ceylon. Juan Cole argues that his movement was a broad social revolution cut off by Britain; Roger Owen was sceptical. A later leader, Mustafa Kamil, admired Meiji Japan as an "Eastern" modernizer.

## India: The Congress Begins

The Indian National Congress met first in Bombay in December 1885: 72 delegates, mostly lawyers, organised by A. O. Hume, a retired British civil servant, with the viceroy's approval. It has been called the first modern nationalist movement in the non-European British Empire. The theory that Hume founded it as a "safety valve" against revolt rests on sources now said to be fictional, and the debate over whose initiative it was remains open. Its early Moderate leaders petitioned for the "Indianisation" of the services, and Dadabhai Naoroji set out his "drain theory" in *Poverty and Un-British Rule in India* (1901). Bal Gangadhar Tilak declared, "Swaraj is my birthright and I shall have it!", and turned Ganesh worship into a public festival to reach beyond the elite, which also sharpened Hindu–Muslim divisions.

## Zionism and a Letter from Jerusalem

After pogroms in 1871 and 1881 the Odessa doctor Leon Pinsker called for Jewish *Auto-Emancipation*. Theodor Herzl, a Viennese journalist, published *Der Judenstaat* (The Jewish State) in 1896. He said the Dreyfus affair had made him a Zionist, though scholars such as Jacques Kornberg doubt it and point to the rise of Karl Lueger in Vienna. The First Zionist Congress at Basel in 1897 declared that "Zionism seeks to establish a home in Palestine for the Jewish people, secured under public law."

In 1899 Yusuf Diya al-Khalidi, several times mayor of Jerusalem, wrote to the Chief Rabbi of France, intending the letter for Herzl. Historically, he granted, Palestine had been the Jews' country, but it was part of the Ottoman Empire and "inhabited by people other than only Israelites". He closed with a plea:

```quote
In the name of God, let Palestine be left alone.
Yusuf Diya al-Khalidi · letter to Zadoc Kahn, intended for Theodor Herzl · 1 March 1899
```

## Ancient Roots or Modern Inventions?

Were nations ancient communities awakening, or something new? Primordialism, the view that nations are fixed and natural, is now widely rejected by scholars. "Modernists" argued that nations were products of modernity. For Gellner, industrial society needed a standardised, literate high culture spread by mass schooling. Anderson defined the nation as "an imagined political community—and imagined as both inherently limited and sovereign", imagined because its members never know most of their fellows, and traced it to "print capitalism" and vernacular literacy. Eric Hobsbawm and Terence Ranger's *The Invention of Tradition* (1983) noted the paradox that modern nations generally claim to be "rooted in the remotest antiquity". Eugen Weber showed that well into the nineteenth century many French people spoke Breton, Basque, Flemish or other tongues until schools, conscription and courts turned "peasants into Frenchmen", much as Italy and Japan made their citizens.

Critics answered. Anthony D. Smith, Gellner's former student, argued that nationalism is modern but builds on older "ethnic cores", with myths of common ancestry and attachment to a homeland, and that modernist definitions are Eurocentric. In their debate at Warwick in 1995, Gellner replied to Smith that some nations have "navels", genuine ancient roots, and some do not, and that this is "inessential". Partha Chatterjee objected that if colonised peoples could only copy "modular" forms invented in Europe and the Americas, "Even our imaginations must remain forever colonized"; anti-colonial nationalism, he argued, first claimed sovereignty in an inner, spiritual domain of its own. As the chapter What is History? explains, interpretations like these are arguments over evidence and perspective, and the cases in this chapter, from Haiti and Japan to Egypt and Palestine, are the evidence they argue over.

```checkpoint
q: What did the Meiji state's policies towards Ryukyu and the Ainu show about nation-building?
a: That Japan's nation-state respected the independence of neighbouring peoples.
x: Ryukyu was annexed as Okinawa Prefecture in 1879, ending its tributary tie to Qing China.
a*: That making a nation could mean absorbing other peoples and pressing them to assimilate, a form of internal colonisation.
a: That the Ainu were granted full recognition as an independent indigenous nation in 1899.
x: The 1899 act designated the Ainu a "former" indigenous people subject to assimilation.
a: That Japan copied the Ottoman policy of Ottomanism exactly.
x: Meiji Japan built its nation around the emperor, State Shinto and a standard language, not a creed-blind Ottoman citizenship.
hint: Think of the "Ryukyu Disposition" and the 1899 act.
why: Like Germanisation in Posen or Magyarisation in Hungary, Meiji nation-building turned minorities into targets of assimilation.
---
q: What was Partha Chatterjee's objection to Benedict Anderson's theory?
a: That nations are fixed, natural and ancient.
x: That is primordialism, which Chatterjee did not defend.
a: That print capitalism played no part in European nationalism.
x: His objection concerned colonised peoples, not Europe's print culture.
a: That nationalism was invented in sixteenth-century England.
x: That is Liah Greenfeld's argument, not Chatterjee's.
a*: That treating anti-colonial nationalism as a copy of European "modular" forms leaves even colonised peoples' imaginations colonised; their nationalism first claimed an inner, spiritual domain.
hint: Think of the word "modular".
why: Chatterjee insisted that anti-colonial nationalisms were creative, not merely derivative.
```

## Further exploration

- **Benedict Anderson, *Imagined Communities: Reflections on the Origin and Spread of Nationalism* (1983).** The classic modernist theory of nations as imagined communities.
- **Partha Chatterjee, *The Nation and Its Fragments* (1993).** The anti-colonial critique of Anderson.
- **Christopher Clark, *Revolutionary Spring: Europe Aflame and the Fight for a New World, 1848–1849* (2023).** A global-minded history of 1848.
- **Pieter M. Judson, *The Habsburg Empire: A New History* (2016).** Argues that the empire was not a "prison of nations".
- **Carol Gluck, *Japan's Modern Myths: Ideology in the Late Meiji Period* (1985).** Meiji national ideology as contested and multiple.
- **Juan R. I. Cole, *Colonialism and Revolution in the Middle East: Social and Cultural Origins of Egypt's 'Urabi Movement* (1993).** 'Urabi's movement as social revolution.
- **Rashid Khalidi, *The Hundred Years' War on Palestine* (2020).** Opens with Yusuf Diya al-Khalidi's 1899 letter.$mn_nation_master$,
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
  select $mn_nation_quiz$[
    {"type": "mcq", "prompt": "What name did Haiti's founders give their new state in 1804, and why?", "options": ["Saint-Domingue, to keep the colonial name", "Haiti, from the Taíno name for the island, as a tribute to its Indigenous predecessors", "Hispaniola, to claim the whole island", "Gonaïves, after the town where independence was declared"], "answerIndex": 1, "explanation": "The name Haiti (Ayiti), 'land of high mountains', was taken from the Taíno name for the island.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Ottoman Nationality Law of 1869 create?", "options": ["A separate state for each millet", "A Turkish-only citizenship for Muslims", "A common Ottoman citizenship regardless of religion or ethnicity", "The abolition of the sultanate"], "answerIndex": 2, "explanation": "It expressed Ottomanism, the hope of a 'Unity of the Peoples' that would hold the empire together.", "id": "q2"},
    {"type": "mcq", "prompt": "Who was the first Egyptian political and military leader to rise from the fellahin (peasantry)?", "options": ["Mustafa Kamil", "The Khedive Tewfik", "Ya'qub Sanu", "Ahmed 'Urabi"], "answerIndex": 3, "explanation": "'Urabi demanded an elected government in 1881 and was defeated by the British at Tel el-Kebir in 1882.", "id": "q3"},
    {"type": "mcq", "prompt": "How did Benedict Anderson define the nation?", "options": ["As an imagined political community, imagined as both inherently limited and sovereign", "As a fixed, natural and ancient ethnic group", "As a daily plebiscite", "As a political principle that the political and national unit should be congruent"], "answerIndex": 0, "explanation": "The 'daily plebiscite' is Renan's phrase and the congruence principle is Gellner's; primordialism holds that nations are fixed and natural.", "id": "q4"},
    {"type": "open", "prompt": "Compare how states 'made' their nations after unification or restoration in Italy, Germany and Meiji Japan.", "rubric": "A strong answer discusses Italy (Piedmontization, southern 'brigandage', the language problem shown by De Mauro's and Castellani's estimates), Germany (the Kulturkampf and Germanisation of Poles in Posen, expulsions of 1885–90, the Settlement Commission) and Japan (abolition of the domains, conscription, a standard language, State Shinto, the Rescript on Education, the annexation of Ryukyu and the 1899 Ainu act); it may draw on Weber's 'peasants into Frenchmen' and Renan on forgetting.", "id": "q5"},
    {"type": "open", "prompt": "Are nations ancient or modern? Assess the debate using examples from the chapter.", "rubric": "A strong answer sets out the modernist case (Gellner on industrial society and schooling, Anderson on print capitalism and imagined communities, Hobsbawm and Ranger on invented traditions), the ethno-symbolist reply (Smith's ethnic cores, the Warwick debate and Gellner's 'navels'), the rejection of primordialism, and Chatterjee's anti-colonial critique of 'modular' nationalism; it tests these against cases such as Herder, Haiti and the creole pioneers, Italy, Meiji Japan, Ottomanism or Egypt.", "id": "q6"}
  ]$mn_nation_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/nationalism-and-the-making-of-nation-states', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
