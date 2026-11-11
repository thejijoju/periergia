-- Napoleon and the Remaking of Europe — canonical master article, co-written and human-reviewed.
-- history/age-of-revolutions/napoleon-and-the-remaking-of-europe @ research/advanced/read.
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
    'history/age-of-revolutions/napoleon-and-the-remaking-of-europe',
    'research',
    'advanced',
    'read',
    $ar_napo_master$> **The general who ended the Revolution and carried it across Europe.** Napoleon Bonaparte, a Corsican artillery officer, seized power in France in 1799, made himself emperor in 1804, and for a decade redrew the map of a continent. His Civil Code spread legal equality from the Rhineland to Mauritius while subordinating wives to husbands; his armies abolished ghettos and feudal dues, yet looted and killed on a vast scale; and he restored slavery in the French Caribbean. This chapter follows his rise, the Egyptian expedition as an Egyptian chronicler saw it, the Code, the campaigns from Austerlitz to Moscow, the end of the Holy Roman Empire, the Spanish rising that set Latin America on the road to independence, Waterloo, and the conservative order built at the Congress of Vienna.

## A Corsican Outsider

Napoleone di Buonaparte was born in Ajaccio on 15 August 1769, one year after the Republic of Genoa ceded Corsica to France. His mother tongues were Corsican and Italian. A royal bursary took him to military school in France, where he was bullied for his accent and poor French and became a Corsican nationalist. He was commissioned as an artillery lieutenant in 1785.

The Revolution made his career. At the siege of Toulon in December 1793 his plan to seize a hill fort dominating the harbour succeeded, and he was promoted brigadier general. On 13 Vendémiaire (5 October 1795) he defended the Convention against a royalist rising with canister fire, Thomas Carlyle's "whiff of grapeshot". In March 1796 he married Joséphine de Beauharnais, born in the French Lesser Antilles to a family that owned enslaved people on sugar plantations, and around then began calling himself Napoleon Bonaparte.

His Italian campaign of 1796–1797 made him famous. He won victories at Arcole and Rivoli, ended Venice's 1,100-year independence, and extracted enormous sums and more than 300 paintings and sculptures, among them the Horses of Saint Mark. Looting art for the Louvre would remain a feature of his conquests.

## Egypt: Conquest, Science and an Egyptian Witness

In May 1798 Bonaparte sailed from Toulon with around 36,000 troops to strike at Britain's route to India; he hoped to link up with Tipu Sultan of Mysore. With the army went 167 scholars, engineers and technicians, who founded the Institut d'Égypte. On 21 July 1798, near the village of Embabeh, the French squares broke the Mamluk-led forces of Murad Bey at the Battle of the Pyramids. French losses were light; estimates of Egyptian losses vary widely, from about 1,500 to as many as 10,000.

```quote
Soldiers! … From the top of those pyramids, forty centuries are contemplating you.
Napoleon Bonaparte · Order of the day before the Battle of the Pyramids · 21 July 1798
```

Bonaparte's proclamations presented him as a liberator freeing Egyptians from Mamluk "slavery", promising to respect religion and property and to govern through councils (*dīwāns*) of local notables. Then, on 1 August, Nelson destroyed most of the French fleet at the Battle of the Nile, cutting the army off. In October 1798 Cairo rose in a revolt centred on al-Azhar; the French shelled the city, fired on the mosque and stormed it, and 5,000 to 6,000 Cairenes were killed or wounded. In Syria in 1799 he had some 1,500 to 5,000 prisoners executed at Jaffa, then failed to take Acre. In August 1799 he left Egypt secretly, without orders. His successor Kléber was assassinated in Cairo in 1800 by a Syrian student, Suleiman al-Halabi, and in 1801 the French capitulated to the British and Ottomans.

The best Egyptian witness was **'Abd al-Rahman al-Jabarti**, a Cairo scholar trained at al-Azhar, who kept a chronicle of the occupation. He corrected the bad Arabic grammar of Bonaparte's proclamation, rejected the republican ideas of liberty and equality, and insisted on revelation over European rationalism; he prayed that God would "strike their tongues with dumbness". Yet he was astonished by French science and technology, admired what he saw as the fairness of French trials, including that of Kléber's assassin, and judged Ottoman rule more tyrannical.

The expedition's legacy is debated. Its scholars produced the *Description de l'Égypte*, foundational for Egyptology. The French found the Rosetta Stone in 1799, but the British took it in 1801, and it has been in the British Museum since 1802; in 2003 Zahi Hawass of Egypt's Supreme Council of Antiquities called for its return as the "icon of our Egyptian identity". To some historians the invasion, which also brought the printing press, marks the start of the modern Middle East; others give more weight to change within Egypt and the Ottoman world, and Juan Cole argues that it crystallised the rhetoric of liberal imperialism.

## Brumaire and the Consulate

Back in France, Bonaparte joined Sieyès, Talleyrand and others in the coup of 18 Brumaire (9 November 1799), and under the constitution that followed real power lay with him as First Consul. A plebiscite approved it, but his brother Lucien falsified the count. Further plebiscites made him consul for life in 1802 and confirmed him as emperor in 1804, again with inflated figures. Historians have called the regime a "dictatorship by plebiscite": prefects governed the departments, and most opposition newspapers were closed.

The regime rebuilt the state: the Council of State, the Legion of Honour, *lycées* and the baccalaureate date from these years. In 1801 Bonaparte signed a **Concordat** with Pope Pius VII. It recognised Catholicism as "the religion of the great majority of the French", not the state religion; the Church gave up its claims to confiscated lands, and the state paid the clergy and nominated the bishops. His view of religion was frankly political: it was, he said in 1800, "by making myself a Moslem that I established myself in Egypt".

## The Civil Code

The most lasting creation was the **Civil Code** of 21 March 1804, called the Code Napoléon from 1807 and still in force in France, much amended. A commission of four jurists drafted it; sources differ on how far Bonaparte himself shaped the text. The Code established equality before the law, religious toleration, secure property and equal inheritance among legitimate children, and swept away the remnants of feudalism. It also confirmed the husband's supremacy. Article 213 declared that "the husband owes protection to his wife, the wife obedience to her husband", the basis of married women's legal incapacity in France until 1938. Divorce by mutual consent was abolished.

The historian Alfred Cobban called the Code "the most effective agency for the propagation of the basic principles of the French Revolution". It was the first civil code widely adopted in Europe, and its reach went far beyond. Governor Decaen extended it to Mauritius by decree in 1808. Louisiana's civil code retains French and Spanish civil-law elements. In Egypt, the Mixed Courts founded under Khedive Isma'il in 1875 used codes inspired by the French Civil Code and British common law, with significant Islamic and local principles. Chile's Civil Code of 1855, drafted by Andrés Bello, is traditionally held to draw on the Napoleonic Code, especially in the law of obligations, though it was no transcription, and scholars disagree about how far Latin American law in general follows the French model.

## Slavery Restored

The same regime that codified equality before the law brought back slavery. As the chapter on the French and Haitian Revolutions describes, the Convention had abolished slavery in all French colonies in 1794, though it took effect only in Saint-Domingue, Guadeloupe and Guiana. The law of 20 May 1802 maintained slavery and the slave trade in colonies returned by the Peace of Amiens, such as Martinique, and where abolition had never been applied, such as Réunion and Mauritius. Consular decrees restored slavery in Guadeloupe in July 1802 and in Guiana that December. Other measures banned Black people and people of colour from entering mainland France. France is the only country to have reinstated slavery after abolishing it.

The Caribbean resisted. In Guadeloupe, the officer **Louis Delgrès** and about 1,000 followers blew themselves up at Matouba on 28 May 1802 rather than surrender. In Saint-Domingue, Leclerc's expedition of some 31,000 troops seized Toussaint Louverture and deported him to the Fort de Joux, where he died in April 1803. Yellow fever, renewed revolt and Dessalines's victory at Vertières destroyed the army, and Haiti declared independence on 1 January 1804. The defeat helped persuade Napoleon to sell Louisiana to the United States in 1803.

Historians disagree about his motives: Yves Benot saw a deliberate policy, while others stress hesitation and opportunism under pressure from a colonial lobby.

```checkpoint
q: Which statement best describes the Civil Code of 1804?
a*: It established equality before the law, religious toleration and secure property, but made the wife owe obedience to her husband.
a: It gave women the same legal rights as men.
x: Article 213 required the wife's obedience, the basis of married women's legal incapacity until 1938.
a: It was the first civil code ever written.
x: Bavaria and Prussia had earlier codes; the French Code was the first widely adopted in Europe.
a: It applied only within France and never spread abroad.
x: It spread across Europe and beyond, for example to Mauritius in 1808, and influenced codes in Egypt and Chile.
hint: Think of Article 213.
why: The Code carried revolutionary principles of legal equality while entrenching patriarchal authority in the family.
---
q: What did the law of 20 May 1802 do?
a: It abolished slavery in all French colonies.
x: That was the Convention's decree of 4 February 1794; the 1802 law went the other way.
a: It recognised the independence of Haiti.
x: France did not recognise Haiti until 1825, and then only in return for an indemnity.
a*: It maintained slavery and the slave trade in colonies returned by the Peace of Amiens and where abolition had never been applied.
a: It granted French citizenship to all free people of colour.
x: The regime brought back discrimination against free people of colour and banned them from entering mainland France.
hint: Think of Martinique and Réunion.
why: Together with the decrees for Guadeloupe and Guiana, it made France the only country to reinstate slavery after abolishing it.
```

## Emperor and Conqueror

On 2 December 1804, at Notre-Dame, with Pope Pius VII present, Napoleon crowned himself Emperor of the French, then crowned Joséphine. Beethoven, who had titled his Third Symphony for Bonaparte, reportedly tore up the title page on hearing that he had made himself emperor; it was published as the *Eroica*.

War with Britain, Austria and Russia resumed. On 21 October 1805 Nelson defeated the Franco-Spanish fleet off Cádiz at **Trafalgar** and was killed by a French marksman; the Royal Navy was never again seriously challenged. On land, though, Napoleon was supreme. On 2 December 1805 he crushed the Russian and Austrian armies at **Austerlitz**. In October 1806 he shattered Prussia at Jena–Auerstedt; the philosopher Hegel, seeing him ride out of Jena the day before the battle, called him "this world-soul". After victory over Russia at Friedland in 1807, Napoleon and Tsar Alexander I made peace at **Tilsit**, on a raft on the River Niemen: Prussia lost about half its territory and population, and a Duchy of Warsaw was created. A costly victory over Austria at Wagram followed in 1809. At its height, he ruled about 40 per cent of Europe's population, directly or through satellite states.

The wars reached beyond Europe: Napoleon courted the Ottoman Sultan Selim III and made a short-lived alliance with Fath-Ali Shah of Persia.

## Remaking Germany and Italy

Napoleon dismantled the Holy Roman Empire. In 1803 the Final Recess secularised the church states and absorbed the free imperial cities; over the whole reorganisation, the number of German states fell from almost 300 to 39. In July 1806 sixteen German states formed the **Confederation of the Rhine** with Napoleon as its "Protector", Bavaria and Württemberg becoming kingdoms. On 6 August 1806 Francis II abdicated and dissolved the Empire. Napoleon's brothers became kings in Naples, Holland and a new Kingdom of Westphalia, and Napoleonic rule abolished feudal remnants and guilds. Historians have linked this reorganisation, and the anti-French reaction it provoked, to the later unification of Germany and Italy, though that long-term connection is contested.

For Jews, the Napoleonic era brought emancipation with strings attached. French Jews had held full civil rights since 1791, and French armies abolished ghettos in Ancona, Venice and Rome. In 1808 Westphalia became the first German state to grant Jews equal rights. Napoleon convened an Assembly of Jewish Notables and, in 1807, a **Grand Sanhedrin** of 71 rabbis and laymen, which declared Jews' loyalty to the French state; Russia's Holy Synod denounced it. But a decree of March 1808, known to Jews as the "Infamous Decree", cancelled or reduced debts owed to Jews and restricted Jewish money-lending and migration for ten years.

## The Continental System

Unable to invade Britain, Napoleon tried to strangle its trade. The Berlin Decree of November 1806 banned commerce with Britain. This **Continental System** was widely evaded through smuggling, often with the connivance of Napoleon's own satellite rulers, while Britain found replacement markets in the Americas. Enforcing it drew Napoleon into his two greatest disasters: Portugal's refusal to comply led to the invasion of the Iberian Peninsula, and Russia's withdrawal in 1810 led to the invasion of 1812.

## Spain, Portugal and the Atlantic

In late 1807 a French army occupied Lisbon, just after the Portuguese royal family and nearly 10,000 people had sailed for Brazil under British escort. Rio de Janeiro became the capital of the Portuguese empire for thirteen years, and Brazil became independent in 1822. The court's arrival also brought more slavery: Rio's enslaved population rose by an estimated 200 per cent between 1808 and 1822.

In Spain, Napoleon exploited a quarrel in the royal family. In May 1808 at Bayonne both Charles IV and his son Ferdinand VII gave up the throne to him, and he gave it to his brother Joseph. On 2 May 1808, the *Dos de Mayo*, Madrid rose against the French; mass executions followed the next day.

{{image: The Third of May 1808 | Goya's *The Third of May 1808*, painted in 1814, commemorates the French executions that followed the Madrid rising of 2 May 1808.}}

The rising spread into the **Peninsular War** of 1808–1814, which gave the world the word *guerrilla*, "little war". The French suffered their first major defeat at Bailén in July 1808, Wellington's British and Portuguese army fought alongside the Spanish, and both sides committed atrocities. The war tied up some 300,000 French-led troops, and an estimated million or more soldiers and civilians died. Napoleon called it "the unlucky war" that ruined him. In besieged Cádiz, a Spanish parliament produced the liberal Constitution of 1812.

The crisis of 1808 crossed the Atlantic. Patriots in Spain and Spanish America rejected the abdications, and juntas formed in America, as in Spain, to rule in the captive Ferdinand's name; the Supreme Junta of Caracas was set up in April 1810. Historians such as Guerra stress that loyalty to Ferdinand was at first nearly universal, but acting for an absent king gave advocates of independence a public platform. In this sense Napoleon indirectly began the independence of Spanish America, as the next chapter, on Latin American Independence, describes.

## 1812: The Catastrophe in Russia

On 24 June 1812 Napoleon crossed the Niemen with around 450,000 frontline troops, by one count only about a third of them native French speakers; Poles, Germans and others filled the ranks of this multinational army. After the bloody battle of **Borodino** on 7 September, Napoleon entered Moscow, but the city was set on fire on the orders of its governor, Rostopchin, and after about six weeks he withdrew. The retreat destroyed his army; only about 75,000 men recrossed the Niemen. Estimates of the Grande Armée's losses run to 580,000–630,000, including 300,000–350,000 dead; total military and civilian deaths may have reached a million. Most of the losses came in summer and autumn, from failed supply, typhus and desertion, not only from the winter. Russians remember the campaign as the "Patriotic War" of 1812.

## From Leipzig to Waterloo

A new coalition defeated Napoleon at Leipzig, the "Battle of the Nations", in October 1813, the largest battle of the wars. The allies entered Paris in March 1814, and Napoleon abdicated and was sent to Elba. In 1815 he escaped and returned to Paris for the Hundred Days. During them, under British pressure, he banned the French slave trade, though not slavery. On 18 June 1815, at **Waterloo**, Wellington's army of British, Dutch, Belgian and German troops, joined in the afternoon by Blücher's Prussians, defeated him in what Wellington called "the nearest-run thing you ever saw in your life". Exiled to Saint Helena in the South Atlantic, Napoleon died there on 5 May 1821, most probably of stomach cancer, as both autopsies found. His follower Las Cases's *Memorial of Saint Helena* created the legend of a liberal Napoleon who had sought to unite Europe.

## The Congress of Vienna

The victors met at the **Congress of Vienna** from September 1814 to June 1815, chaired by the Austrian minister Metternich, with Castlereagh for Britain, Hardenberg for Prussia, Tsar Alexander I, and Talleyrand for defeated France. The Ottoman Empire was invited but sent no delegation. The Final Act, signed on 9 June 1815, aimed at a balance of power rather than simple restoration: a German Confederation of 39 states under Austrian leadership, a Kingdom of the Netherlands as a buffer against France, and a Polish kingdom under the tsar. Russia, Austria and Prussia formed a Holy Alliance, which Castlereagh dismissed as "a piece of sublime mysticism and nonsense", and in the Concert of Europe that followed the powers claimed the right to intervene against revolutions.

The Congress also issued, on 8 February 1815, a Declaration of eight powers condemning the Atlantic slave trade, annexed to the Final Act. Castlereagh drove it under pressure from British public opinion, but it set no date for ending the trade and had no means of enforcement. Some historians have linked the Vienna settlement to the "second slavery" that expanded in the nineteenth-century Americas. Admirers such as Henry Kissinger praised the Congress for building a stable order; critics stress its repression of liberalism and nationalism.

## Hero or Tyrant?

Estimates of the deaths in the Napoleonic wars range from roughly 3.5 to 6 million. Admirers point to the Code and the end of feudalism in much of Europe; critics to plunder, censorship, rigged plebiscites, the reduced rights of women and people of colour, and the restoration of slavery. Andrew Roberts's *Napoleon the Great* defends the epithet, drawing on thousands of newly published letters; reviewers objected that it gives too little weight to the immense collateral damage. Michael Broers has applied ideas from the study of overseas cultural imperialism to Napoleonic Europe, distinguishing an "inner empire" where the reforms took root from an "outer empire" ruled by force.

At the bicentenary of his death in 2021, President Emmanuel Macron chose to commemorate rather than celebrate, and called the restoration of slavery a betrayal of the spirit of the Enlightenment. The activist Louis-Georges Tin called it "a crime, and even a double crime", while the historian Thierry Lentz replied that "we can't reduce him to that". The Dutch historian Pieter Geyl, surveying two centuries of French verdicts, had already drawn the lesson.

```quote
It is impossible that two historians, especially two historians living in different periods, should see any historical personality in the same light.
Pieter Geyl · Napoleon: For and Against · 1947
```

```checkpoint
q: How did Napoleon's actions in Spain affect Spanish America?
a: He granted the Spanish American colonies independence by decree.
x: Joseph Bonaparte never recognised any Spanish American independence.
a*: By forcing the Spanish kings to abdicate in 1808, he created a vacancy that juntas filled in the captive king's name, giving advocates of independence a platform.
a: They had no effect, because the colonies were cut off from Europe.
x: Juntas formed in America in response to the 1808 crisis, as in Caracas in 1810.
a: He invaded Mexico and Venezuela with French armies.
x: The French armies fought in the Iberian Peninsula; the American juntas arose from the political crisis.
hint: Think of the abdications of Bayonne.
why: Loyalty to Ferdinand was at first nearly universal, but ruling in his absence opened the road to independence.
---
q: What did the Congress of Vienna's declaration of 8 February 1815 on the slave trade do?
a: It immediately ended the Atlantic slave trade, enforced by the Royal Navy.
x: It set no date for ending the trade and had no means of enforcement.
a: It abolished slavery throughout the European empires.
x: It concerned only the trade; France, for example, abolished slavery only in 1848.
a: It was opposed by Britain.
x: Britain's Castlereagh drove the declaration under public pressure.
a*: It condemned the slave trade in the name of eight powers but set no date for ending it and had no enforcement.
hint: Think of what the declaration lacked.
why: The gap between condemnation and action helps explain why historians link the settlement to the expansion of slavery in the Americas.
```

## Further exploration

- **Alexander Mikaberidze, *The Napoleonic Wars: A Global History* (2020).** The wars as a world conflict, from the Americas to Persia and India.
- **Al-Jabarti, *Napoleon in Egypt: Al-Jabarti's Chronicle of the French Occupation, 1798*, trans. Shmuel Moreh (2006 edition).** The invasion through the eyes of a Cairo scholar.
- **Juan Cole, *Napoleon's Egypt: Invading the Middle East* (2007).** Uses Arabic and French sources to show the invasion as a model of liberal imperialism.
- **Philippe R. Girard, *The Slaves Who Defeated Napoleon: Toussaint Louverture and the Haitian War of Independence, 1801–1804* (2011).** A multi-archival history of the Leclerc expedition.
- **Michael Broers, *Europe Under Napoleon, 1799–1815* (1996).** The empire seen from conquered Europe.
- **Sudhir Hazareesingh, *The Legend of Napoleon* (2004).** How the Napoleonic myth was made and used in nineteenth-century France.
- **Adam Zamoyski, *Rites of Peace: The Fall of Napoleon and the Congress of Vienna* (2007).** The diplomacy and society of the Congress.$ar_napo_master$,
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
  select $ar_napo_quiz$[
    {"type": "mcq", "prompt": "Which Egyptian scholar kept a chronicle of the French occupation of Cairo, mixing hostility to republican ideas with admiration for French science?", "options": ["'Abd al-Rahman al-Jabarti", "Muhammad Ali", "Suleiman al-Halabi", "Ahmed al-Jazzar"], "answerIndex": 0, "explanation": "Al-Jabarti, trained at al-Azhar, corrected the Arabic of Bonaparte's proclamation, rejected liberty and equality, yet admired French science and the fairness of French trials.", "id": "q1"},
    {"type": "mcq", "prompt": "Where did Louis Delgrès and his followers blow themselves up rather than surrender to the forces restoring slavery in 1802?", "options": ["Saint-Domingue, at Vertières", "Martinique", "Guadeloupe, at Matouba", "Mauritius"], "answerIndex": 2, "explanation": "Delgrès and about 1,000 followers died at Matouba on 28 May 1802; slavery was formally restored in Guadeloupe in July 1802.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Napoleon end the Holy Roman Empire?", "options": ["By annexing Vienna to France in 1805", "By the Treaty of Tilsit with Russia", "By crowning himself Holy Roman Emperor in 1804", "By forming the Confederation of the Rhine under his protection, after which Francis II dissolved the Empire in August 1806"], "answerIndex": 3, "explanation": "Sixteen German states formed the Confederation of the Rhine in July 1806; Francis II abdicated and dissolved the Empire on 6 August 1806.", "id": "q3"},
    {"type": "mcq", "prompt": "What caused most of the Grande Armée's losses in Russia in 1812?", "options": ["Failed supply, typhus and desertion during the summer and autumn, as well as the winter", "The battle of Borodino alone", "The fire of Moscow", "Naval defeat in the Baltic"], "answerIndex": 0, "explanation": "Most losses came before the winter, from logistics failure, disease and desertion; only about 75,000 men recrossed the Niemen.", "id": "q4"},
    {"type": "open", "prompt": "Was Napoleon the heir of the French Revolution or its betrayer? Use evidence from France, Europe and the colonies.", "rubric": "A strong answer weighs the Civil Code (equality before the law, religious toleration, end of feudalism; Cobban's verdict) and its spread to places such as Mauritius, Egypt's Mixed Courts and Chile, the abolition of ghettos and Jewish emancipation, against rigged plebiscites and censorship, Article 213 and women's subordination, the 'Infamous Decree', looting, the human cost of the wars, and the 1802 restoration of slavery (Guadeloupe, Saint-Domingue); it may cite Roberts, Broers' inner and outer empire, Geyl, and the 2021 bicentenary debate.", "id": "q5"},
    {"type": "open", "prompt": "How did the Napoleonic Wars shape the world beyond Europe?", "rubric": "A strong answer discusses the Egyptian expedition and its debated legacy (al-Jabarti, the Rosetta Stone, the 'modern Middle East' thesis, Cole's liberal imperialism), the restoration of slavery and Haitian independence, the sale of Louisiana, the Portuguese court's flight to Brazil, the 1808 Spanish crisis and the American juntas, Ottoman and Persian diplomacy, the spread of the Code, and the Vienna slave-trade declaration of 1815 and its lack of enforcement.", "id": "q6"}
  ]$ar_napo_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions/napoleon-and-the-remaking-of-europe', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
