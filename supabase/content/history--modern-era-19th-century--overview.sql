-- The Long Nineteenth Century (1815–1914) — chapter OVERVIEW master, co-written and human-reviewed.
-- history/modern-era-19th-century @ research/advanced/read.
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
    'history/modern-era-19th-century',
    'research',
    'advanced',
    'read',
    $mn_ov19_master$> **A century that shrank the world and divided it.** Between Napoleon's defeat in 1815 and the outbreak of war in 1914, steam, steel, cables and capital bound the world into a single economy, and a handful of states came to rule or dominate most of it. The same century ended legal slavery across the Americas and serfdom in Russia, made the idea that every people deserves a state a force that redrew maps, and sent tens of millions across oceans, freely, under contract or by force. This overview draws the era's chapters together around connecting themes, from integration and emancipation to empire, resistance and the road to 1914, and sets out the debates historians are still having about them.

## A World Bound Together

The century's first and most visible change was speed. The first transatlantic cable carried messages in 1858, a lasting one was laid in 1866, and by 1870 Bombay was linked to London by cable. After the German Empire moved to gold in the early 1870s, the United States in effect in 1873 (formally in 1900), India in 1893, and Russia and Japan in 1897. As **The Second Industrial Revolution** shows, after about 1870 a new cluster of technologies ran on cheap steel, electricity, synthetic chemistry and oil, and on laboratories that made invention a business. On some measures the United States had overtaken Britain in manufacturing by the 1890s, and German steel output passed Britain's in 1893.

Integration was not equality. On Paul Bairoch's estimates, India's share of world industrial output fell from about a quarter in 1750 to under 2 per cent in 1900. The machines needed raw materials from what historians call "commodity frontiers": rubber from Leopold II's Congo and the Amazon, tin from Malaya, nitrate from the provinces Chile won from Bolivia and Peru in the War of the Pacific, which left Bolivia landlocked. **Latin America after Independence** follows the export booms in guano, coffee and Argentine beef, and asks whether they developed the region or kept it dependent. Andre Gunder Frank argued that integration into world capitalism itself produced underdevelopment; Fernando Henrique Cardoso and Enzo Faletto wrote of "dependent development"; the historian D. C. M. Platt objected that the evidence did not show foreign trade destroying an autonomous path of growth.

Looking back from 1919, John Maynard Keynes said that a Londoner of the pre-war years had regarded this world as "normal, certain, and permanent". Kevin O'Rourke and Jeffrey Williamson treat the convergence of commodity prices as the evidence of a first globalisation, followed by a backlash of tariffs and immigration restriction. Flynn and Giráldez dispute the dating, tracing globalisation back to the sixteenth-century silver trade.

## People on the Move

That world moved people as well as goods. More than 30 million Europeans migrated to the United States between 1836 and 1914. Argentina, whose constitution of 1853 required the promotion of European immigration, received about 3.8 million immigrants between 1861 and 1920, some 2.3 million of them Italians and many of the rest Spaniards, though not all of them stayed. Hunger and persecution drove others: a million or more people emigrated from Ireland during the Great Famine of 1845–1852, and more than two million Jews left the Russian Empire between 1880 and 1920.

Much of this movement was not free. When slavery ended in the British colonies, the plantations turned to India: from 1834 to 1917 more than 1.6 million Indians were shipped under indenture to colonies from Mauritius to Fiji, bound by penal labour laws. About 215,000 Chinese were shipped from Macau between 1851 and 1874, mainly to Cuba and Peru. As **Abolition and Emancipation** explains, the Colonial Secretary Lord John Russell feared in 1840 that indenture would become "a new system of slavery". Historians still debate whether it was slavery under another name or a harsh but distinct form of contract labour. Meanwhile the United States barred Chinese labourers from 1882. Other movements were expulsions: the Circassians driven from the western Caucasus to the Ottoman Empire, as **Imperial Russia from Napoleon to 1905** recounts, and the Yaqui deported from Sonora by Porfirio Díaz.

## Freedom and Its Limits

The century ended legal bondage across the Americas. The British Empire abolished slavery in 1833, France in 1848, the Netherlands in 1863, the United States in 1865, and Brazil, last in the Americas, in 1888. Russia freed more than 23 million serfs in 1861. Its tsar, Alexander II, had warned the Moscow nobility after defeat in the Crimean War:

```quote
It is better to abolish serfdom from above, than to wait for that time when it starts to abolish itself from below.
Alexander II · Speech to the Moscow nobility · 30 March 1856 (Old Style)
```

Three patterns recur in **Abolition and Emancipation**. First, abolition was usually gradual and hedged, through transitions such as British "apprenticeship", ten years of state-supervised plantation labour in Suriname, and Brazil's Free Womb Law, which bound freed children to serve their mothers' owners until 21. Second, owners were often compensated and the freed never were. Britain paid owners £20 million, about 40 per cent of the government's annual income; France paid 126 million gold francs; Russian lords were paid through the peasants' own redemption payments. Brazil's Golden Law and the American Thirteenth Amendment paid owners nothing, but they paid the freed nothing either. Third, the pace was again and again set from below, by the rebels of Demerara in 1823 and of Jamaica's Baptist War in 1831, by the rising in Martinique in May 1848, which did not wait for the abolition decree from Paris to arrive, and by the hundreds of thousands who fled to Union lines in the United States.

What freedom meant afterwards was fought over everywhere. **The American Civil War** shows Reconstruction's amendments granting citizenship and barring racial exclusion from the vote, and then the violence that overthrew it; between 1890 and 1908 most Black Southerners were effectively stripped of the vote. "The slave went free; stood a brief moment in the sun; then moved back again toward slavery," wrote W. E. B. Du Bois. Antislavery also served empire: the Brussels Conference of 1889–1890 is widely seen as lending humanitarian language to the conquest of Africa, yet colonial rulers were slow to free anyone. In French Sudan the enslaved left in their thousands from 1905, and Richard Roberts and Martin Klein argue that it was this exodus, not French policy, that destroyed slavery there as a labour system. Why abolition happened remains disputed, from Eric Williams's economic explanation and Seymour Drescher's reply to Christopher Leslie Brown's "moral capital", but historians increasingly give a central place to the enslaved.

```checkpoint
q: Which statement best describes how owners and the freed were treated in the century's emancipations?
a*: Owners were often compensated, by the state as in Britain and France or through peasants' redemption payments as in Russia, while the freed were compensated nowhere.
a: The freed were usually given land and money to begin their new lives.
x: British freed people received nothing, and in the United States Sherman's grant of coastal land to freed families was reversed.
a: Every abolition compensated owners, including Brazil's Golden Law of 1888.
x: Brazil's Golden Law freed the 600,000 to 700,000 still enslaved without compensation to owners.
a: Neither owners nor the freed were compensated anywhere.
x: Britain paid owners £20 million, and a French law of 1849 paid owners 126 million gold francs.
hint: Compare Britain's £20 million with what the formerly enslaved received.
why: Compensation flowed to owners in Britain, France, the Netherlands and Russia, never to the people who had been held in bondage.
---
q: What did the Colonial Secretary Lord John Russell fear in 1840 about Indian indenture?
a: That it would be too expensive for the planters to sustain.
x: His hesitation was about the system's nature, not its cost.
a: That Indian workers would refuse to travel to the colonies.
x: More than 1.6 million Indians went overseas under indenture between 1834 and 1917.
a*: That it would become "a new system of slavery", a phrase the historian Hugh Tinker later took as the title of his indictment.
a: That it would end the British abolition of slavery.
x: Indenture grew after abolition as the plantations' new source of labour; it did not reverse the 1833 Act.
hint: Think of the title of Hugh Tinker's book of 1974.
why: Indenture's penal labour laws made absence a crime, and historians still debate whether it was slavery under another name.
```

## Nations Made and Unmade

The idea that every "people", defined by language, culture or history, deserved its own state redrew maps across the century. **Nationalism and the Making of Nation-States** follows it from Herder's folk songs through the "springtime of the peoples" of 1848 to the unification of Italy in 1861 and of Germany in 1871, the latter achieved through three wars. Ernest Renan in 1882 called a nation "a daily plebiscite" and warned that forgetfulness was essential to its creation.

Nations had to be made after states were founded. On one estimate only about 2.5 per cent of Italians could speak standard Italian in 1861. Germany pushed Polish out of the primary schools of Posen. Meiji Japan created a standard language, promoted State Shinto and annexed the Ryukyu Kingdom as Okinawa Prefecture in 1879. The century's great multinational empires tried other formulas. The Habsburg Compromise of 1867 created a dual monarchy of Austria and Hungary, while pressure on Hungary's own minorities to adopt Hungarian grew. The Ottoman Nationality Law of 1869 created a common Ottoman citizenship regardless of religion. Russia, whose census of 1897 found that only 44.31 per cent of its subjects spoke "Great Russian", pursued Russification instead, banning almost all Ukrainian printing in 1876.

Nationalism was never only European. **Latin America after Independence** follows Benito Juárez, the Zapotec liberal who led Mexico against the French intervention, and José Martí's fight for Cuba. In Egypt, Ahmed 'Urabi gave force to the slogan "Egypt for the Egyptians"; the Indian National Congress first met in 1885. In 1897 the First Zionist Congress sought a home in Palestine, and in 1899 Yusuf Diya al-Khalidi answered: "In the name of God, let Palestine be left alone." The United States, too, had its nation remade: **The American Civil War** shows eleven states seceding to protect slavery and a war that killed roughly 700,000–750,000 soldiers. Historians still argue whether nations are modern inventions, as Ernest Gellner and Benedict Anderson held, or rest on older "ethnic cores", as Anthony D. Smith replied. Partha Chatterjee objected that treating anti-colonial nationalism as a copy of European models left even colonised peoples' imaginations colonised.

## Empire and Resistance

As late as the 1870s Europeans controlled about a tenth of Africa, almost all of it on the coasts. By 1914 only Ethiopia and Liberia lay outside European control. By 1913, **British Empire** notes, Britain alone ruled about 412 million people, roughly 23 per cent of the world's population. Yet the Victorians were not always sure how they had acquired it:

```quote
We seem, as it were, to have conquered and peopled half the world in a fit of absence of mind.
J. R. Seeley · The Expansion of England · 1883
```

**Imperial Expansion and Resistance** shows what made conquest possible. Quinine, steamships, railways, the telegraph and the Maxim gun were the tools, which Daniel Headrick later treated as a necessary but not a sufficient explanation. The ideas behind them included a "civilising mission" and social Darwinism. The Berlin Conference of 1884–85, to which no African state was invited, set rules for claims and confirmed Leopold II's Congo, though historians warn against the common claim that it "carved up" the continent by itself. The costs were vast and are still counted: estimates of the Congo's population decline under Leopold run from 1.2 million to 10 million, with disease the main direct killer. In German South West Africa about 40,000 to 80,000 Herero died, around 80 per cent of the people. In India the Great Famine of 1876–78 killed between 5.6 and 9.6 million while wheat was exported to England, and the Delhi durbar proclaiming Victoria Empress of India met in the middle of it.

Resistance took many forms. Ethiopia under Menelik II and the empress Taytu defeated Italy at Adwa in 1896. The Zulu won at Isandlwana in 1879, though they lost the war. Yaa Asantewaa led the Asante rising of 1900, and the British never captured the Golden Stool. Samori Touré resisted France for sixteen years. Others fought in German East Africa, Aceh, the Philippines and New Zealand. In India the great rising of 1857 still carries rival names, from "Mutiny" to "First War of Independence". Resistance and collaboration were two sides of the same story: about 80 per cent of the forces that crushed the Indian revolt were Indian.

{{image: Battle of Adwa | The Battle of Adwa, 1 March 1896, where Ethiopian forces defeated the Italian invasion.}}

Settler states expanded too. Australia was claimed by proclamation, not treaty, and Argentina's Conquest of the Desert and Chile's "Pacification" of Araucanía took Indigenous lands, as **Latin America after Independence** shows, while Mexico lost about half its territory, counting Texas, by the treaty of 1848. Why empire happened is still argued. J. A. Hobson and Lenin pointed to surplus and finance capital; Robinson and Gallagher pointed to strategy and "informal empire"; Cain and Hopkins to the City of London's "gentlemanly capitalism". Whether it paid, and what Britain's empire left behind, divides historians as sharply as ever, from Niall Ferguson's favourable verdict to Caroline Elkins's argument that violence was integral to it.

## Answering the West

States outside Western Europe did not simply submit; many tried to reform fast enough to survive. The Ottoman Tanzimat began in 1839. **The Opium Wars** opens the Chinese story: a first war with Britain ended in the Treaty of Nanjing of 1842, which opened five ports and ceded Hong Kong Island, and a second ended in 1860 with an Anglo-French force burning the Old Summer Palace. As **The Taiping Rebellion and the Late Qing** shows, the deadliest catastrophe came from within. Somewhere around 20 to 30 million people died in the Taiping war, most of them from famine and plague. The dynasty survived through provincial armies and the Self-Strengthening Movement, then lost to Japan in 1895, suppressed reform in 1898, and fell in 1911–12.

**The Meiji Restoration** shows Japan's leaders dissolving the samurai class they came from, building a conscript army and railways, and issuing in 1889 East Asia's first parliamentary constitution, which Ethiopian reformers later used as a model. Japan also became an empire, taking Taiwan in 1895 and annexing Korea in 1910. In Russia, **Imperial Russia from Napoleon to 1905** follows an autocracy that freed its serfs and industrialised under Sergei Witte without giving up unlimited power. Historians debate the comparisons: Immanuel Hsu and others saw China's self-strengthening as superficial and contrasted it with Meiji Japan, while Mary Wright, who judged it ultimately doomed, credited the restoration with extending the dynasty's life by some sixty years. Alexander Gerschenkron argued that latecomers industrialised in sharper spurts, with the state standing in for what was missing.

```checkpoint
q: Why does calling Japan's victory of 1905 the first defeat of a European power by a non-European state need care?
a: Because Russia was not a European power.
x: Russia was a European great power; that is what made the victory so striking abroad.
a*: Because Ethiopia had already defeated Italy at Adwa in 1896; what was new in 1905 was an Asian victory over a European great power in a modern war between great powers.
a: Because China had defeated Japan in 1895.
x: Japan defeated China in 1894–1895 and took Taiwan.
a: Because the war ended in a Russian victory at Tsushima.
x: At Tsushima in May 1905 Japan destroyed or captured all eleven Russian battleships.
hint: Think of what happened on 1 March 1896.
why: Adwa and Tsushima both inspired people under or threatened by European rule, but they were different kinds of victory.
---
q: What point did the historian Robinson make in 1972 that puts the colonised at the centre of the history of empire?
a: That empire was driven mainly by surplus capital seeking investment abroad.
x: That is J. A. Hobson's "taproot" argument.
a: That technology alone explains European conquest.
x: Daniel Headrick treated technology as a necessary but not a sufficient explanation, and Robinson's point concerned people, not tools.
a: That colonised peoples almost never resisted conquest.
x: The era saw resistance from Adwa and Isandlwana to Maji Maji, Aceh and the Philippines.
a*: That empire depended on local collaboration, as soldiers such as Eritrean askaris, Hausa troops and the Force Publique show.
hint: Think of who made up most of the forces that crushed the Indian rising of 1857.
why: Resistance and collaboration were two sides of the same story, and empires could not have been run without local intermediaries.
```

## Reform, Revolt and the Road to 1914

Inside the industrial states the century's politics were a contest over who counted. **The Victorian Era** follows the Chartists, whose petitions Parliament rejected, and the slow widening of the British vote in 1867 and 1884. Even after 1884 all women and 40 per cent of men had no vote, and the matchwomen of Bow had to strike in 1888 to win their demands. Workers organised across the industrial world. American workers struck for an eight-hour day in 1886, the Second International called the first May Day demonstrations in 1890, and Germany's Social Democrats became the largest party in the Reichstag in 1912. Women pressed their own claims, from J. S. Mill's motion of 1867 to Kishida Toshiko's speeches in Japan and Qiu Jin's writing against footbinding and forced marriage in China.

Revolution and reaction alternated. Historians long called the revolutions of 1848 a failure; Christopher Clark argues that they produced a "revolution in government". In Russia, terrorists killed Alexander II in 1881, and his successor turned to counter-reform and Russification, while more than 200 anti-Jewish riots broke out in 1881–82. Amid defeat by Japan came the revolution of 1905, which won a legislative Duma; but the Fundamental Laws of 1906 kept ministers, army and foreign policy in the tsar's hands. Abroad, Japan's victory electrified many. Sun Yat-sen later recalled that "We regarded that Russian defeat by Japan as the defeat of the West by the East." By 1911 Díaz had been driven from Mexico, and in February 1912 the last Qing emperor abdicated.

The century closed on the networks it had built. The Second International's anti-war resolutions failed in July 1914. The major socialist parties backed their nations, the International effectively collapsed on 4 August, and the laboratories, railways and factories of the age turned to war. That war, and what it did to the empires and nations made in the nineteenth century, is where **20th Century History** begins.

## Further exploration

- **Jürgen Osterhammel, *The Transformation of the World: A Global History of the Nineteenth Century* (English edition 2014).** A global, non-Eurocentric frame for the century.
- **Kevin H. O'Rourke and Jeffrey G. Williamson, *Globalization and History: The Evolution of a Nineteenth-Century Atlantic Economy* (1999).** The economics of the first globalisation and the backlash against it.
- **Seymour Drescher, *Abolition: A History of Slavery and Antislavery* (2009).** A global synthesis across five centuries.
- **Benedict Anderson, *Imagined Communities: Reflections on the Origin and Spread of Nationalism* (1983).** The classic modernist theory of nations as imagined communities.
- **A. Adu Boahen, *African Perspectives on Colonialism* (1987).** A Ghanaian historian reinterprets conquest and colonial rule from the side of the colonised.
- **Pankaj Mishra, *From the Ruins of Empire: The Revolt Against the West and the Remaking of Asia* (2012).** How Asian intellectuals answered Western power.
- **Hugh Tinker, *A New System of Slavery: The Export of Indian Labour Overseas 1830–1920* (1974).** The classic indictment of indenture.$mn_ov19_master$,
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
  select $mn_ov19_quiz$[
    {"type": "mcq", "prompt": "Which country was the last in the Americas to abolish slavery, and how?", "options": ["Brazil, by the Golden Law (Lei Áurea) of 13 May 1888, which freed those still enslaved without compensation to owners", "Cuba, by the Moret Law of 1870, which freed every enslaved person at once", "The United States, by the Emancipation Proclamation of 1863", "Argentina, by the constitution of 1853"], "answerIndex": 0, "explanation": "Brazil's Golden Law, signed by Princess Isabel as regent, freed the 600,000 to 700,000 people still enslaved; Cuba's patronato had ended in 1886, and mass flight from the São Paulo coffee plantations helped force Brazil's decision.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these did the Berlin Conference of 1884–85 actually do?", "options": ["It drew nearly all of Africa's final colonial borders", "It invited African states to negotiate their own frontiers", "It declared free trade across a broadly defined Congo Basin, confirmed the territories of Leopold II's association and set a principle of effective occupation for new coastal claims", "It abolished slavery throughout Africa"], "answerIndex": 2, "explanation": "No African state was invited. Historians warn against saying that Berlin 'carved up' Africa: the median African border reached its final form only in 1908, through many bilateral treaties.", "id": "q2"},
    {"type": "mcq", "prompt": "On Paul Bairoch's estimates, what happened to India's share of world industrial output between 1750 and 1900?", "options": ["It doubled as Bombay's mills expanded", "It stayed at about a quarter", "It rose from under 2 per cent to about a quarter", "It fell from about a quarter to under 2 per cent"], "answerIndex": 3, "explanation": "Integration into the world economy was not equality. Bombay had 136 cotton mills by 1900, but India's overall share of world industry had collapsed; historians debate how far colonial rule was responsible.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the most widely cited range for the number of people who died in the Taiping war of 1850–1864, and what killed most of them?", "options": ["About 750,000, mostly in battle", "Some 20 to 30 million, most of them from famine and plague", "About 2 million, mostly in the fall of Nanjing", "Over 100 million, mostly from foreign intervention"], "answerIndex": 1, "explanation": "There was no census and only about a tenth of Taiping records survive, so every figure is an estimate; higher figures of 70 million or more are poorly sourced and contested.", "id": "q4"},
    {"type": "open", "prompt": "Compare how two states outside Western Europe tried to reform in order to survive Western power in the nineteenth century, and how far they succeeded.", "rubric": "A strong answer compares two of: Qing China (the Self-Strengthening Movement and Tongzhi Restoration, arsenals and the Beiyang Fleet, defeat by Japan in 1895, the Hundred Days of 1898, the New Policies and the fall of the dynasty in 1911–12); Meiji Japan (abolition of the domains and the samurai, conscription, the land tax, railways and zaibatsu, the 1889 constitution, treaty revision, and its own empire in Taiwan and Korea); Imperial Russia (the Great Reforms after the Crimean War, Witte's industrialisation, autocracy kept, defeat by Japan and 1905); the Ottoman Empire (the Tanzimat, the Nationality Law of 1869, the 1876 constitution and Abdul Hamid II's autocracy). It engages with debates such as Hsu's contrast between China and Japan, Wright's or Kwong's views of the Qing restoration, or Gerschenkron on latecomers, and notes who paid for reform, such as Japanese farmers or Russian peasants.", "id": "q5"},
    {"type": "open", "prompt": "'Abolition was something people seized as well as something governments granted.' Using examples from at least two regions, assess this view of the nineteenth century's emancipations.", "rubric": "A strong answer weighs government action (the British Acts of 1807 and 1833 and the West Africa Squadron, the French decree of 1848, Russia's emancipation 'from above' in 1861, Lincoln's Proclamation and the Thirteenth Amendment, Brazil's Golden Law) against action from below (Demerara 1823, the Baptist War of 1831, Martinique in May 1848, the St Croix revolt, the contrabands and Black soldiers in the US, the flight to Jabaquara in Brazil, the Banamba exodus). It notes the limits of freedom: apprenticeship, compensation for owners but not the freed, Russian redemption payments, indenture, Black Codes and the overthrow of Reconstruction. It may refer to the historiographical debate (Williams, Drescher, Brown; Berlin and McPherson on 'who freed the slaves').", "id": "q6"}
  ]$mn_ov19_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
