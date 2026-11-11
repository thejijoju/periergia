-- Imperial Expansion and Resistance — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/imperial-expansion-and-resistance @ research/advanced/read.
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
    'history/modern-era-19th-century/imperial-expansion-and-resistance',
    'research',
    'advanced',
    'read',
    $mn_imperial_master$> **Conquest, and the many ways people fought it.** As late as the 1870s Europeans controlled about a tenth of Africa, almost all of it on the coasts; by 1914 only Ethiopia and Liberia lay outside European control, while empires also advanced across Asia and the Pacific. This chapter compares the European, American and Japanese empires of about 1850–1914, what the Berlin Conference did and did not do, and the tools and ideas of conquest. Above all it follows the people who resisted, from Menelik and Taytu at Adwa, Samori Touré and Yaa Asantewaa to the Herero, Maji Maji, Aceh, the Philippine Republic and the Māori, and ends with the argument over why empire happened and whether it paid.

## The Shape of the Scramble

In the 1870s European possessions in Africa were mostly coastal footholds such as the British Cape Colony and French Algeria. Within a generation almost the whole continent had been claimed, and by the end of the century Europe had added almost 9 million square miles, about a fifth of the world's land area, to its overseas possessions.

The empires were unequal. Measured by Africa's population, Britain ruled nearly 30 per cent, France 15, Portugal 11, Germany 9, Belgium 7 and Italy 1. France held the largest area, but much of it was the thinly peopled Sahara; Nigeria alone had more subjects than all of French West Africa or the whole German colonial empire. Liberia kept its independence partly because the powers treated it as under United States protection; Ethiopia kept its by defeating an invasion.

Almost every colonial regime justified itself as a crusade against slavery; the Brussels Anti-Slavery Conference of 1889–90 made this its central theme. The claim was self-serving. In French West Africa, after the French abolished slavery in 1905, more than a million enslaved people left their masters between 1906 and 1911, an exodus driven by the enslaved themselves, as the chapter *Abolition and Emancipation* describes.

## Berlin, 1884–85: What It Did and Did Not Do

The Berlin Conference is often said to have "carved up" Africa. It did not. Convened by Bismarck, with Portugal's initiative and Leopold II's lobbying, it met from November 1884 to February 1885, with fourteen countries attending. No African state was invited; Sultan Barghash of Zanzibar asked to send a representative and was refused.

The General Act of Berlin declared free trade across a broadly defined "Congo Basin" and free navigation on the Congo and Niger rivers. It confirmed the territories of Leopold's International Association of the Congo, and its Article 35 set a "principle of effective occupation" for new claims on the African coast.

Apart from what became the Congo Free State, the Act created no new colonies, and even that name does not appear in it. A 2024 study found that the only borders set at Berlin were those of the Congo region, later revised; the median African border reached its final form only in 1908, through many bilateral treaties. Historians such as Sybil Crowe, Matthew Craven and Simon Katzenellenbogen, whose chapter on the subject is titled "It didn't happen at Berlin", warn against overstating the conference, noting among other things that many earlier agreements were never put into effect.

## Tools and Ideas

Conquest needed technology. Quinine, used widely against malaria from the mid-nineteenth century, is credited with ending Africa's reputation as the "white man's grave". Its origins were Indigenous: Quechua peoples used cinchona bark, and the name comes from their word for bark. Steamships, railways and the telegraph followed. Then there was the **Maxim gun**, invented in London in 1884 by the American-born Hiram Maxim, the first fully automatic machine gun. At the Shangani in 1893, 700 soldiers with five Maxims fought off some 3,500 Ndebele warriors (some accounts say 5,000).

```quote
Whatever happens, we have got / The Maxim gun, and they have not.
Hilaire Belloc, spoken by his character "Blood" · The Modern Traveller · 1898
```

Belloc's poem is satire, and the boast belongs to a character, not to the poet. Some historians argue that the Maxim's power has been embellished by myth: it was decisive mainly in pitched battles on open ground. Africans and Asians acquired it too; the Philippine Republic had 42 Maxims in January 1899. Daniel Headrick, whose *The Tools of Empire* (1981) made technology central, later called technology a "necessary, if not sufficient" explanation of empire.

Ideas justified what the tools made possible. The *mission civilisatrice*, the "civilising mission", was a hallmark of the French project. Jules Ferry told the Chamber of Deputies on 28 July 1885 that "It is a right for the superior races, because they have a duty. They have the duty to civilize the inferior races"; Georges Clemenceau answered him. Kipling's "The White Man's Burden" (1899) was written to urge the United States to take the Philippines. Social Darwinism mattered too: the historian Mohamed Adhikari counts an ideology that placed racial struggle above practical considerations, such as the value of Indigenous labour, among the reasons for German conduct in Namibia. Nor was the idea only European: Japan would claim its own civilising mission in Korea.

## Ethiopia: Diplomacy, Mobilisation and Adwa

Ethiopia's survival was not luck. **Menelik II**, king of Shewa from 1866 and emperor from 1889, was himself an empire-builder. He conquered southern lands of the Oromo, Wolayta and Gurage and paid for modern rifles with ivory, coffee, gold and slave-trade revenues.

The Treaty of Wuchale (1889) existed in two versions. In the Italian text, Article 17 obliged Ethiopia to conduct its foreign relations through Italy, in effect a protectorate; in the Amharic text, using Italy's good offices was optional. The empress **Taytu Betul**, who with Menelik had founded Addis Ababa, led the hard line against Italy, and Menelik rejected Italy's protectorate claim in 1891 and formally denounced the treaty in 1893. In September 1895 he issued an *awaj*, a general call to arms.

At **Adwa** on 1 March 1896 an Ethiopian army estimated at 73,000 to over 100,000, mostly armed with modern rifles imported from France and Russia, met an Italian force of roughly 14,500 to 17,800, including Eritrean *askaris*. Taytu commanded her own contingent, and when Menelik considered retreat during the battle, she and Ras Mengesha persuaded him to commit his reserve of 25,000. Italian and colonial dead numbered about 6,000; Ethiopian dead are estimated at between about 3,900 and 7,000. About 800 captured Eritrean askaris, regarded as traitors, had their right hand and left foot cut off.

{{image: Battle of Adwa | The Battle of Adwa, 1 March 1896, where Ethiopian forces defeated the Italian invasion.}}

The Italian government fell, and the Treaty of Addis Ababa made Italy recognise Ethiopian independence, which lasted until Fascist Italy's invasion of 1935–36. Adwa became a rallying point for African nationalists and Pan-Africanists.

## West and Southern Africa: Strategies of Resistance

**Samori Touré**, a Malinke Muslim, built a state across parts of present-day Guinea, Sierra Leone, Mali, Côte d'Ivoire and Burkina Faso, and resisted France from 1882 to 1898. He bought breech-loaders through British Freetown, offered in 1885 to put his state under British protection, and signed treaties with France whose protectorate clauses he regarded as unenforceable. His blacksmiths learned to repair and even build French rifles. After the Brussels Act of 1890 cut off his British supply, he fought from 1891 a war of manoeuvre and scorched earth, moving his whole state eastward with a retinue of about 120,000 people. He was not a simple hero: forced conversions provoked a rebellion he crushed, and in 1897 he destroyed the city of Kong after it revolted. Captured in 1898, he died in exile in Gabon.

In southern Africa, the British High Commissioner Sir Bartle Frere, on his own initiative, sent the Zulu king **Cetshwayo** an ultimatum he could not accept: disband his army and accept a British resident. At **Isandlwana** on 22 January 1879 about 20,000 Zulu under Ntshingwayo kaMahole, using the "horns of the buffalo" envelopment, defeated part of Chelmsford's column; more than 1,300 on the British side died. Britain still won the war, exiled Cetshwayo and split Zululand into thirteen chiefdoms, which led to a Zulu civil war.

The **Asante** kingdom, whose rise is told in *Kongo, Asante, and Dahomey*, had been occupied by British troops in 1896 and its king, Prempeh I, exiled. In Kumasi in March 1900, Governor Frederick Hodgson demanded the Golden Stool so that he could sit on it. **Yaa Asantewaa**, Queen Mother of Ejisu, led the rising that followed and besieged the British in the Kumasi fort. A relief force broke the siege, and Britain annexed Asante and exiled her to the Seychelles, where she died in 1921. But the British never captured the Golden Stool.

## Islam and Resistance: Algeria and Sudan

France's North African empire began earlier, with the landing of 34,000 troops in Algeria in June 1830. In 1832 **Abd al-Qadir**, son of a Sufi scholar, was chosen *amir al-mu'minin* to lead the resistance. He used truces with France, recognised in treaties of 1834 and 1837, to build a state in the interior. Bugeaud answered with scorched earth and fast columns, and in 1843 raided his mobile capital, the *smala*. Abd al-Qadir surrendered in 1847. Several historians estimate that 500,000 to a million Algerians died from war, famine and disease in the first three decades of conquest, out of about 3 million. Whether the violence was genocidal is debated.

In Sudan, **Muhammad Ahmad** proclaimed himself the Mahdi in 1881 against Turco-Egyptian rule. His followers, the Ansar, destroyed an Egyptian army under the British officer William Hicks in 1883 and took Khartoum in January 1885, killing Gordon. The Mahdist state lasted until 1899; it was harsh, and by some contested estimates Sudan's population fell by half under its rule. At **Omdurman** in 1898, Kitchener's Anglo-Egyptian army lost 47–48 dead and the Mahdists about 12,000 killed, and the killing of wounded Mahdists caused controversy.

```checkpoint
q: What did the Berlin Conference of 1884–85 actually do?
a*: It declared free trade in the Congo Basin, confirmed Leopold's association's territories, and set an "effective occupation" rule for new coastal claims.
a: It drew most of Africa's modern borders.
x: A 2024 study found only Congo-region borders were set there; most borders came from later bilateral treaties.
a: It included African rulers, such as the Sultan of Zanzibar, as full delegates.
x: No African state was invited, and Zanzibar's request to attend was refused.
a: It created the Congo Free State by name.
x: The name does not appear in the General Act; it was announced in August 1885.
hint: Think about trade, rivers and coasts rather than lines on a map.
why: Berlin set rules for the Scramble, but the partition itself happened through many later agreements.
---
q: Which explanation best fits the Ethiopian victory at Adwa?
a: Italy withdrew before any battle was fought.
x: The armies met at Adwa on 1 March 1896, and Italy lost about 6,000 dead.
a: Ethiopian forces fought mainly with spears and shields.
x: The Ethiopian army was mostly armed with modern rifles imported from France and Russia.
a*: Ethiopia combined diplomacy, a general mobilisation, large numbers and imported modern rifles, with leaders such as Taytu Betul pressing the fight.
a: The Italian commander chose to retreat and was caught on the march.
x: Baratieri attacked, under pressure from Rome, after his brigadiers argued against retreat.
hint: Think of the awaj and the arms Menelik had bought.
why: Adwa shows that organisation, numbers and imported arms could defeat a European army.
```

## Leopold's Congo

"Belgium needs a colony", read a paperweight Leopold gave a minister in 1860. Through supposedly scientific and humanitarian front bodies, and with Stanley in his employ, he obtained the **Congo Free State** as his personal possession from 1885 to 1908. The rubber boom that followed the inflatable tyre turned it into a machine for extraction. Decrees of 1891–92 declared "vacant" land the property of the state and handed concessions to companies such as ABIR. The state's domain revenue rose from about 150,000 francs in 1890 to more than 18 million in 1901.

The Force Publique, more than 19,000 strong by about 1900, enforced quotas with hostage-taking, the *chicotte* (a hippo-hide whip) and severed hands, collected as proof that cartridges had been used on people. Congolese voices survive too: in the 1950s missionaries, working with their Congolese colleague Charles Lonkama, recorded survivors' accounts of officers such as Fiévez, "the Devil of the Equator".

Protest began with an African American, George Washington Williams, whose open letter to Leopold appeared in 1890 and who, in a letter to the US Secretary of State, called the Congo regime's abuses "crimes against humanity". Roger Casement's consular report, published in 1904, and E. D. Morel's Congo Reform Association built an international campaign, though it sought Belgian annexation, not the end of colonialism. Belgium annexed the Congo in 1908.

How many died is uncertain. There was no census before 1924, and modern estimates of the population decline run from 1.2 million to 10 million. Hochschild's figure of about 10 million is at the high end; the demographer Jean-Paul Sanderson argues for 1 to 5 million. Disease, above all sleeping sickness, was the main direct killer, made worse by the disruption of the rubber regime. Most historians do not apply the legal term genocide, because there was no intent to destroy a group, but many describe atrocity on a vast scale.

## Germany in Africa: Genocide and Maji Maji

In German South West Africa, now Namibia, settler impunity for murder and rape and the loss of Herero cattle to rinderpest lay behind the uprising that **Samuel Maharero** launched in January 1904. Between 123 and about 160 Germans were killed; the rebels generally spared women, children and missionaries. After defeat at Waterberg in August, the Herero fled into the Omaheke desert, where Germans guarded or poisoned the waterholes. Then came Lothar von Trotha's order:

```quote
Within the German boundaries, every Herero, with or without firearms, with or without cattle, will be shot. I won't accommodate women and children anymore.
Lothar von Trotha · Extermination order (English translation) · 2 October 1904
```

Historians debate whether he intended killing or expulsion; the Kaiser withdrew the order in December. The **Nama** under Hendrik Witbooi, once German allies, changed sides in 1904 and fought on after his death. Survivors were held in concentration camps, where about half of all prisoners died; on Shark Island the death rate was far higher. In all, about 40,000 to 80,000 Herero, around 80 per cent of the people, and about 10,000 Nama, about half, died. In 2015 the German government described the events as genocide, and in 2021 Foreign Minister Heiko Maas said Germany would now officially call them genocide. The accompanying €1.1 billion of development aid over 30 years explicitly rejects legal responsibility, and most Herero and Nama organisations rejected the deal.

In German East Africa, head taxes, forced labour and Governor Götzen's 1902 order that villages grow cotton for export fed the **Maji Maji** rising of 1905. The spirit medium Kinjikitile Ngwale gave out *maji*, water said to turn bullets to water, and the revolt spread from the Matumbi to many other peoples. Machine guns broke the attacks at Mahenge, and Ngoni fighters threw away their medicine crying "The maji is a lie!" German officers then made famine a weapon: "Only hunger and want can bring about a final submission", one wrote. Between 75,000 and 300,000 people died, overwhelmingly from famine. John Iliffe describes a movement born of peasant grievance, sanctified and extended by prophetic religion, which finally crumbled; Tanzanian nationalists later claimed it as the first stirring of national unity, while later historians stress a series of distinct revolts.

## Asia and the Pacific

France attacked Da Nang in 1858, citing the persecution of missionaries, gained territory by the Treaty of Saigon in 1862, made Cambodia a protectorate in 1863 and conquered Tonkin in the 1880s. In Vietnam the **Cần Vương** ("Aid the King") movement of 1885–96 rose in the name of the boy-emperor Hàm Nghi, who was captured in 1888 and exiled to Algeria, one of many resistance leaders the empires moved across the world.

The Dutch invaded the sultanate of **Aceh** in 1873, and their first commander was killed. Leadership of the resistance passed to Muslim scholars, the *ulama*, inspired by holy-war literature. After the death of Teuku Umar, his widow **Cut Nyak Dhien** led guerrillas until her capture in 1905; she is now a National Hero of Indonesia. On the advice of the scholar Christiaan Snouck Hurgronje, the Dutch split the aristocracy from the ulama. Some 50,000–70,000 Acehnese died, and guerrilla resistance lasted until 1942.

Filipinos had proclaimed independence in June 1898 and founded a republic under Emilio Aguinaldo, but Spain ceded the islands to the United States. War began in February 1899; Aguinaldo turned to guerrilla war and was captured in 1901. After townspeople at Balangiga killed 54 US soldiers, General Jacob H. Smith reportedly ordered his troops to "kill everyone over the age of ten". Over 20,000 Filipino combatants and over 4,200 Americans died, along with 200,000–250,000 Filipino civilians, mostly from famine and disease.

In **New Zealand**, Māori who resisted fought the colonial government and its Māori allies from 1845 to 1872. At the peak, about 18,000 British and colonial troops faced some 4,000 to 5,000 Māori fighters, whose engineered *pā* fortifications, with anti-artillery bunkers, made frontal assaults costly. The Māori King movement resisted land sales, and after 1863 more than 1.2 million hectares were confiscated from "loyal" and "rebel" tribes alike.

China and Japan show two other responses. Qing reformers launched the Self-Strengthening Movement, but defeat by Japan in 1895 cost China Taiwan, where local people resisted the Japanese for months; the Boxer Uprising and the eight-power intervention of 1900, described in *The Taiping Rebellion and the Late Qing*, ended with a crushing indemnity. Japan, forced open by Perry's ships in 1853–54 and saddled with unequal treaties, modernised after 1868 and became an empire itself, taking Taiwan and later Korea and joining the powers against the Boxers. In India, meanwhile, the great rising of 1857, whose rebels proclaimed the aged Mughal Bahadur Shah Zafar emperor, had already shaken British rule; even its name, "Mutiny" or "First War of Independence", is still contested.

```checkpoint
q: How did Germany acknowledge the Herero and Nama genocide in 2021?
a: It paid legal reparations agreed with Herero and Nama organisations.
x: The deal explicitly rejected legal responsibility and reparations, and most Herero and Nama organisations rejected it.
a*: It officially called the events genocide and offered €1.1 billion of development aid over 30 years, while rejecting legal responsibility.
a: It denied that the events were genocide.
x: Foreign Minister Maas said Germany would officially call the events genocide.
a: It used the word genocide for the first time, having never before accepted any responsibility.
x: A German minister accepted moral responsibility, and used the term genocide, in 2004; the government formally acknowledged it in 2015.
hint: Think about the difference between aid and reparations.
why: The deal shows how contested the politics of colonial memory remain.
---
q: What does the Aceh War show about Dutch colonial conquest?
a: It was a short, cheap campaign that ended in 1873.
x: It began in 1873 and cost 15–20 million guilders a year, nearly bankrupting the colonial government.
a: The Acehnese welcomed Dutch rule after the first expedition.
x: The first expedition's commander was killed, and guerrilla resistance lasted until 1942.
a: It was settled at the Berlin Conference.
x: Berlin dealt with Africa, and the Netherlands came away with no African zones there.
a*: Resistance led by the ulama and leaders such as Cut Nyak Dhien lasted decades, and the Dutch relied on dividing the aristocracy from the scholars.
hint: Think about who led the resistance and how long it lasted.
why: Aceh shows how expensive and prolonged conquest could be when resistance had deep religious and social roots.
```

## Why Empire?

**J. A. Hobson**, in *Imperialism: A Study* (1902), found the "taproot of imperialism" in a capitalist oligarchy: because wealth at home was badly distributed, consumption lagged and surplus capital was pushed abroad. His book also contains antisemitic allusions to financiers and endorses repressing "unprogressive races", a reminder that critics of empire were not free of its prejudices. **Lenin**'s *Imperialism, the Highest Stage of Capitalism* (written 1916) drew heavily on Hobson but argued that imperialism was "the monopoly stage of capitalism", driven by finance capital and the export of capital, and it led to war between the powers.

Others looked elsewhere. Robinson and Gallagher argued in 1953 that Britain preferred informal empire through free trade and turned to formal rule only when that failed, and later explained the Scramble through the strategic calculations of an "official mind" reacting to crises on the periphery, such as Egypt in 1882. Cain and Hopkins point to "gentlemanly capitalism", the finance and services of the City of London rather than industry. Hans-Ulrich Wehler's "social imperialism" sees elites using imperial jingoism to win working-class support at home. And in 1972 Robinson made a point that puts the colonised at the centre: empire depended on local collaboration, as the Eritrean askaris, Hausa troops, Force Publique soldiers, Macabebe Scouts and Māori *kūpapa* all show. Resistance and collaboration were two sides of the same story.

## Did Empire Pay?

For some, spectacularly: Leopold's Congo made fortunes for the king and the concessionaires from coerced labour. For states the picture was mixed. Germany's wars were ruinously expensive, and a dispute over money for the war in South West Africa led to the "Hottentot election" of 1907. The Aceh War cost 15–20 million guilders a year.

For Britain, Davis and Huttenback's *Mammon and the Pursuit of Empire* (1986) found that imperial returns were not high compared with investment at home and abroad, and that empire worked as a transfer from the tax-paying middle class to the elites who owned imperial enterprise. Patrick O'Brien (1988) stressed the heavy burden of defence. Yet the colonised often paid most directly, through hut and head taxes, forced labour, and indemnities such as the war costs Hodgson demanded of the Asante and the Boxer indemnity imposed on China.

## From Resistance to Nationalism

Most armed resistance was defeated, but it was not forgotten. Adwa inspired Pan-Africanists; Tanzanian nationalists claimed Maji Maji; Herero representatives invoked the genocide against apartheid; Samori's great-grandson Ahmed Sékou Touré led Guinea to independence; Phan Bội Châu carried Cần Vương into modern Vietnamese nationalism. The ideas of nationhood traced in *Nationalism and the Making of Nation-States* would be turned against the empires in the twentieth century.

## Further exploration

- **Adam Hochschild, *King Leopold's Ghost: A Story of Greed, Terror and Heroism in Colonial Africa* (1998).** The bestselling account of the Congo Free State and the campaign against it; its death estimate is at the high end.
- **Raymond Jonas, *The Battle of Adwa: African Victory in the Age of Empire* (2011).** The Ethiopian and Italian stories converging at Adwa.
- **A. Adu Boahen, *African Perspectives on Colonialism* (1987).** A Ghanaian historian reinterprets conquest and colonial rule from the side of the colonised.
- **David Olusoga and Casper W. Erichsen, *The Kaiser's Holocaust: Germany's Forgotten Genocide and the Colonial Roots of Nazism* (2010).** A narrative history of the Herero and Nama genocide; its argument for continuity with Nazism is debated.
- **Daniel R. Headrick, *The Tools of Empire: Technology and European Imperialism in the Nineteenth Century* (1981).** Quinine, steamers and guns as the enablers of conquest.
- **Pankaj Mishra, *From the Ruins of Empire: The Revolt Against the West and the Remaking of Asia* (2012).** How Asian intellectuals answered Western power.
- **Thomas Pakenham, *The Scramble for Africa* (1991).** A classic narrative of the partition, written largely from the European side.$mn_imperial_master$,
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
  select $mn_imperial_quiz$[
    {"type": "mcq", "prompt": "Which borders, according to a 2024 study, were actually set at the Berlin Conference of 1884–85?", "options": ["Those of the Congo region, later revised", "The whole of Africa's modern borders", "The borders of Ethiopia and Liberia", "None at all, because the conference never met"], "answerIndex": 0, "explanation": "The conference set rules such as free trade in the Congo Basin and effective occupation of coasts; most African borders took final shape decades later through bilateral treaties.", "id": "q1"},
    {"type": "mcq", "prompt": "What was the key difference between the Italian and Amharic texts of the Treaty of Wuchale (1889)?", "options": ["The Amharic text ceded Eritrea; the Italian text did not", "The Italian text set a date for Italian withdrawal", "The Italian text's Article 17 obliged Ethiopia to conduct foreign relations through Italy, while the Amharic text made it optional", "There was no difference; Menelik simply changed his mind"], "answerIndex": 2, "explanation": "The Italian version amounted to a protectorate; Menelik rejected the protectorate claim in 1891 and denounced the treaty in 1893, leading to war and Adwa in 1896.", "id": "q2"},
    {"type": "mcq", "prompt": "What range do modern estimates give for the population decline in Leopold's Congo Free State?", "options": ["Exactly 10 million", "Under 100,000", "About 50 million", "From about 1.2 million to 10 million"], "answerIndex": 3, "explanation": "With no census before 1924, figures are uncertain: Hochschild's 10 million is at the high end, Sanderson argues for 1 to 5 million, and disease was the main direct killer.", "id": "q3"},
    {"type": "mcq", "prompt": "Who led the Asante rising of 1900 after Governor Hodgson demanded the Golden Stool?", "options": ["Cut Nyak Dhien", "Yaa Asantewaa, Queen Mother of Ejisu", "Taytu Betul", "Samori Touré"], "answerIndex": 1, "explanation": "Yaa Asantewaa led the siege of the Kumasi fort; she was exiled to the Seychelles, but the British never captured the Golden Stool.", "id": "q4"},
    {"type": "open", "prompt": "Compare the strategies of resistance used by at least three colonised peoples between about 1850 and 1914, and explain why some succeeded where most failed.", "rubric": "A strong answer compares strategies such as Ethiopian diplomacy, mobilisation and imported rifles at Adwa; Samori Touré's arms purchases, treaties and mobile scorched-earth war; Zulu tactics at Isandlwana; Māori pā fortifications; religious mobilisation (the Mahdi, Abd al-Qadir, Maji Maji's maji, Aceh's ulama); and guerrilla war in Aceh and the Philippines. It notes that technology was not the only factor (Headrick, the Maxim 'myth'), that resisters such as Menelik and Samori had their own empires and coercion, and that colonial armies relied on local soldiers.", "id": "q5"},
    {"type": "open", "prompt": "Why did the powers build empires in this period, and did empire pay? Assess at least two historians' explanations.", "rubric": "A strong answer explains Hobson's underconsumption and surplus capital, Lenin's monopoly and finance capital, Robinson and Gallagher's informal empire and 'official mind', Cain and Hopkins's gentlemanly capitalism, Wehler's social imperialism and Robinson's collaboration theory, with critiques (Italy's lack of capital, small investment in tropical Africa). On profits it contrasts Leopold's Congo with costly wars (Germany, Aceh), Davis and Huttenback and O'Brien on modest returns and taxpayer costs, and the costs borne by the colonised through taxes, forced labour and indemnities.", "id": "q6"}
  ]$mn_imperial_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/imperial-expansion-and-resistance', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
