-- History of Sub-Saharan Africa to 1860: Precolonial States and Societies — canonical master article, co-written and human-reviewed.
-- history/regional-histories/africa/history-of-sub-saharan-africa-to-1860-precolonial-states-and-societies @ research/advanced/read.
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
    'history/regional-histories/africa/history-of-sub-saharan-africa-to-1860-precolonial-states-and-societies',
    'research',
    'advanced',
    'read',
    $mn_africa1860_master$> **Africa on its own terms.** Before the European partition, sub-Saharan Africa had a long and crowded history of farmers and iron-smelters, cities and kingdoms, scholars and merchants, and societies that governed themselves without kings. This chapter takes the long view, from the spread of Bantu-speaking farmers to the eve of colonial conquest around 1860. It asks how that past can be known and follows the great themes: mobility, states and "stateless" societies, Islam and literacy, trade, the slave trades and their effects inside Africa, and the upheavals of the nineteenth century. Subjects treated in depth in other chapters are recapped briefly, with pointers to those chapters.

## Recovering Africa's Past

Much of Africa's history before 1860 was not written down by the people who lived it, so historians work from several kinds of evidence at once. The first is oral tradition. In the Mande world of West Africa, hereditary specialists called *jèli* or *jali*, known in English as griots, are trained from childhood in verbal art, music and genealogy. Their best-known work, the epic of Sunjata, founder of Mali, has no single authoritative version; the modern standard text is the account of the griot Djeli Mamoudou Kouyaté, put into French by Djibril Tamsir Niane in 1960. The Belgian historian Jan Vansina (1929–2017) showed how such traditions could be read critically as historical sources, and his *Oral Tradition as History* (1985) became the standard framework. The chapter on What is History? explains his method.

The second kind of evidence is physical and linguistic. At Jenne-jeno, excavated by Roderick and Susan McIntosh from 1977, a town occupied from about 250 BCE had spread over more than 33 hectares by around 1000 CE, probably fed by African rice. Linguistics, too, is evidence, as the Bantu expansion shows.

The third is writing. Arabic geographers mention Ghana from the late eighth century, and in the 970s Ibn Hawqal called its king "the wealthiest king on the face of the earth". West Africans later wrote their own chronicles in Arabic, above all the *Tarikh al-Sudan* of Abd al-Rahman al-Sa'di and the *Tarikh al-Fattash*. These need criticism like any source. The Timbuktu chronicles claimed that Ghana's first rulers were "white" or of Berber origin; modern scholars reject this, and Patrick Munson's excavations at Dhar Tichitt in 1969 revealed a complex culture by 1600 BCE ancestral to the Soninke, Ghana's founders.

## Iron, Nok and the Bantu Expansion

Over the long run, the most important movement in African history was not a conquest but a slow spread of farmers. Between about 6,000 and 1,500 years ago, speakers of Proto-Bantu languages moved out of a homeland in north-western Cameroon and south-eastern Nigeria across Central, Eastern and Southern Africa. One stream moved through the rainforest to central Angola by around 500 BCE; another reached the area west of Lake Victoria at about the same time, where the makers of Urewe pottery ran one of Africa's oldest iron-smelting centres. Bantu speakers reached KwaZulu-Natal by about 300 CE. The core evidence is the close similarity of the languages of sub-equatorial Africa, and genetic evidence agrees.

They did not move into empty land. The south and east were home to Khoisan-speaking foragers, Batwa forest foragers, Nilo-Saharan herders and Cushitic-speaking pastoralists, and herding had reached the far south centuries earlier. Newcomers absorbed, displaced or possibly replaced earlier peoples, but intermarriage and the exchange of languages, rituals and genes were common. Why the expansion happened is still unclear, and most specialists now think of several dispersals rather than one. Critics also warn against circular reasoning that treats a style of pottery as proof of a language.

Firm evidence that Bantu speakers used iron appears only around 400 BCE. Where African iron came from is one of the continent's oldest debates. Between 1945 and 1965 most archaeologists assumed it diffused from Carthage or Meroë. Radiocarbon dates from the late 1960s revived the case for independent invention, though some very early dates remain disputed. Secure dates are early enough: a furnace near Douroula in Burkina Faso dates to the eighth century BCE. Specialists such as Manfred Eggert and Augustin Holl think independent invention most likely, but the question is unresolved.

In central Nigeria, the **Nok culture** (roughly 1500 BCE to 1 BCE) produced the earliest large figurative sculpture in Africa outside Egypt. Its terracottas were first found in 1928 in a tin mine; the archaeologist Bernard Fagg grasped their importance from 1943, after learning that one head had served for a year as a scarecrow in a yam field. Excavations at Taruga in 1961 uncovered iron slag and furnace fragments, and iron metallurgy may have developed there independently around 750–550 BCE.

## Bronze, Kings and Societies Without Rulers

In south-eastern Nigeria in 1938, Isaiah Anozie, digging by his house, found bronzes that the archaeologist Thurstan Shaw excavated from 1959. The **Igbo-Ukwu** objects, made by the lost-wax method, were radiocarbon-dated by Shaw to the ninth century CE, though newer dates place some of the material in the tenth to twelfth centuries; either way they are centuries older than other known bronzes in the region. They are linked to the Nri kingdom and to trade reaching through Gao to North Africa.

Igbo-Ukwu raises a question that runs through African history: what counts as political complexity? The anthology *African Political Systems* (1940), edited by Meyer Fortes and E. E. Evans-Pritchard, set up an influential contrast between states and societies that lacked centralised authority. The latter were called "acephalous" (headless) or "stateless", with no group able to exercise effective control over both people and territory; the Tiv, the Igbo and the Nuer were standard examples. The labels came from colonial-era anthropology and obscure a great deal. Most Igbo communities were governed by consultative assemblies of commoners, often described as republican, with exceptions such as the kings of Onitsha and the priest-kings of Nri and Arochukwu. Jenne-jeno shows that a city could grow without evidence of a centralised ruler.

## Ethiopia from Aksum to Tewodros

The kings of Aksum adopted Christianity in the fourth century; the chapter on Kush and Aksum: Ancient Northeast Africa tells that story. What followed is less widely known. The **Zagwe dynasty** ruled northern Ethiopia and Eritrea from about 1137 to 1270. Tradition credits its king Gebre Meskel Lalibela (r. c. 1181–1221) with eleven rock-hewn churches, a site widely understood as a symbolic Jerusalem, perhaps answering Saladin's capture of the real one in 1187; some scholars date parts of it from the seventh to the thirteenth centuries.

{{image: Church of Saint George, Lalibela | One of the rock-hewn churches of Lalibela, traditionally attributed to the Zagwe king Gebre Meskel Lalibela and understood as a symbolic Jerusalem.}}

Around 1270 Yekuno Amlak founded the **Solomonic dynasty**, which lasted until 1974, and Ge'ez literature entered its most productive period. Emperor Zara Yaqob (r. 1434–1468), reputedly a theological writer himself, founded a new capital at Debre Berhan.

In 1529 Imam Ahmad ibn Ibrahim of the Muslim sultanate of Adal, called Gragn ("the left-handed") in Ethiopian tradition, defeated a larger Ethiopian army at Shimbra Kure and went on to control about three-quarters of Christian Abyssinia. Survivors of a Portuguese force that arrived in 1541 joined Emperor Gelawdewos, and Ahmad was killed in battle in 1543. Much southern territory was then lost through the Oromo migrations. Emperor Fasilides founded Gondar as a permanent capital in 1636. From 1769 to 1855, in the Zemene Mesafint or "Era of the Princes", regional lords held real power and the emperors were figureheads. It ended when Kassa Hailu was crowned Emperor Tewodros II on 11 February 1855.

## The Sahel and the Trans-Saharan World

The camel, introduced to the western Sahara in the third century CE, made regular desert trade possible. The chapter on Ghana, Mali, and the Trans-Saharan World tells this story in detail. The Soninke state of **Ghana** adopted Islam around 1076, but the old belief that the Almoravids of North Africa conquered it in 1076–77 has been challenged: Conrad and Fisher argued in 1982–83 that the "conquest" was a misreading of Arabic sources, while Dierk Lange accepts there was no conquest but argues for Almoravid political pressure.

**Mali**, founded by Sunjata after his victory at Kirina around 1235, lasted to around 1600 and was probably the world's largest gold producer of its day. Mansa Musa's pilgrimage of 1324–25 was so lavish that al-Umari reported the value of gold in Cairo falling for at least twelve years, though Warren Schultz argues the drop was within normal fluctuation, and the huge figures reported for his caravan are treated as rhetorical rather than statistical.

**Songhay** expanded under Sunni Ali (r. 1464–1492), who took Timbuktu in 1468–69. The chronicler al-Sa'di, a Muslim scholar, condemned him as a tyrant who honoured his mother's traditional religion.

```quote
Sunni Ali entered Timbuktu, committed gross iniquity, burned and destroyed the town ...
Abd al-Rahman al-Sa'di · Tarikh al-Sudan · seventeenth century
```

In 1591 a Moroccan army armed with arquebuses and cannon defeated a far larger Songhay army at Tondibi. Further east, around Lake Chad, **Kanem–Bornu** proved the most durable of these states: its rulers had adopted Islam by the eleventh century, when Hummay founded the Sunni Sayfawa dynasty, and the state survived in some form until 1902.

## Scholars, Books and Ajami

Timbuktu had three great mosques that were also centres of learning: Djinguereber, Sidi Yahya and Sankoré. Sankoré, founded in the fourteenth or early fifteenth century with money from a Tuareg woman, reached its golden age in the sixteenth century under the Askias. It is often called a university, but scholars taught their own students, with no evidence of a centralised institution. Ibn Battuta, there in 1352, said nothing about scholarship; the scholarly Aqit clan arrived about a century later.

The most famous Timbuktu scholar, **Ahmad Baba** (1556–1627), of the Aqit family, wrote more than forty books. After the Moroccan conquest he was deported to Morocco in 1594. In *Mi'raj al-Su'ud* (1615) he rejected the idea that Black Africans were destined for slavery and the so-called Curse of Ham. He did not oppose slavery itself: he argued that free Muslims of any ethnic origin could not lawfully be enslaved, a defence of religion-based rather than race-based slavery.

Timbuktu's manuscripts, dated from the late thirteenth to the early twentieth century, are mostly in Arabic, but some are in African languages written in Arabic script, known as **ajami**. Ajami was used for languages from Hausa and Fula to Swahili. Its oldest surviving examples are thirteenth-century tomb inscriptions in Niger containing Songhay words; by the seventeenth century there were whole books and poems, and the Islamic revival of the nineteenth century produced a wave of ajami writing. When jihadists held Timbuktu in 2012–13, 4,203 manuscripts were burned or stolen, but some 350,000 were carried to safety.

```checkpoint
q: Why do historians of the Bantu expansion rely so heavily on linguistics?
a*: Because the close similarity of the languages spoken across sub-equatorial Africa is the core evidence for the expansion, and genetic evidence agrees with it.
a: Because the Bantu-speaking farmers left written records in Arabic script.
x: Ajami writing came many centuries after the expansion began and was used mainly by Muslim communities.
a: Because archaeology has found nothing at all from the period.
x: Archaeology has found pottery, iron furnaces and villages, though critics warn the rainforest record is patchy.
a: Because griots preserved a single authoritative account of the migrations.
x: Griots belong to the Mande world of West Africa, and even the Sunjata epic exists in many variants.
hint: Think about what hundreds of related languages across a huge area imply.
why: Languages that resemble one another across a vast region point to a common origin and spread.
---
q: What did Ahmad Baba argue in Mi'raj al-Su'ud (1615)?
a: That slavery should be abolished throughout the Islamic world.
x: He did not oppose slavery itself; he argued about who could lawfully be enslaved.
a: That the Moroccan conquest of Songhay had been a lawful holy war.
x: He was deported to Morocco after the conquest; his famous argument concerned slavery.
a*: That Black Africans were not destined for slavery, rejecting the Curse of Ham, but that free Muslims of any origin could not lawfully be enslaved.
a: That Timbuktu's scholars should be organised into a single university.
x: Sankoré had no centralised teaching institution, and Ahmad Baba made no such argument.
hint: Think of religion rather than race as the test of who could be enslaved.
why: His argument separated slavery from race while still accepting slavery.
```

## Forest Kingdoms and the Atlantic Age

From the fifteenth century, kingdoms in the forests and savannas of West and West Central Africa faced a new Atlantic world; the chapter on Kongo, Asante, and Dahomey: West Africa in the Atlantic Age covers them in depth. **Benin**, expanded by Oba Ewuare from 1440, built earthworks described as among the largest such structures in the world. **Kongo** law protected the freeborn from enslavement but allowed war captives to be sold. **Oyo**'s cavalry forced Dahomey into tribute from the 1730s and 1740s (formally from 1748 in some accounts); **Asante** rose after Osei Tutu defeated Denkyira in 1701; **Dahomey** took the port of Ouidah in 1727. In the Igbo hinterland the Aro, using the oracle at Arochukwu, became the main suppliers of captives to the ports through a trading network rather than a centralised kingdom.

## The Slave Trades and African Societies

Slavery existed in many African societies before Europeans arrived; John Thornton stresses that Africa already had a very large slave population, and endemic warfare that produced captives. Africans were taken out of the continent along three great routes. Across the Sahara, Paul Lovejoy estimates about 6 million people between 650 and 1500, and about 1.2 million more are estimated to have crossed the Sahara in the nineteenth century; the chapter on Slavery in the Global Middle Ages discusses the older trades. High-end estimates of about 8 million people taken from East Africa between the seventh century and 1920 are contested. The Atlantic trade was the largest and most concentrated: about 12.5 million people embarked between 1501 and 1866 and about 10.7 million arrived in the Americas, as the chapter on The Atlantic Slave Trade explains. Many died before they reached a ship; Patrick Manning estimates 4 million deaths inside Africa after capture.

How much did the Atlantic trade change Africa? Walter Rodney, in *How Europe Underdeveloped Africa* (1972), argued that it was an unequal, essentially colonial relationship that diverted merchants from production and devastated working people through war and kidnapping. Thornton replied that African states and elites took part voluntarily and controlled the trade on their coasts, and that "African manufacturing [at this period] was more than capable of handling competition from preindustrial Europe". Joseph Inikori, Lovejoy and others describe a "gun-slave cycle" in which European guns, gunpowder and horses stimulated slaving indirectly, while Joseph Miller gives great weight to drought, disease and famine in West Central Africa, working together with the trade. The economist Nathan Nunn has found a robust negative relationship between a country's historical slave exports and its present-day income, and, with Leonard Wantchekon, that descendants of heavily raided groups trust their neighbours and local government less. These findings are debated.

In the nineteenth century Britain turned against the trade. Between 1808 and 1860 the Royal Navy captured about 1,600 slave ships and freed more than 150,000 Africans, and Sierra Leone, a Crown colony from 1808, became a base for resettling them. After a British blockade, King Ghezo of Dahomey signed a treaty in 1852 ending slave exports and promoting palm oil instead. But the end of the export trade did not end slavery inside Africa, as Sokoto and Zanzibar show.

## Southern Africa: The Cape and the Mfecane

The chapter on The Swahili Coast and Great Zimbabwe follows Mapungubwe and Great Zimbabwe, whose population probably never exceeded about 10,000, against a traditional estimate of up to 18,000. At the far south, the Dutch East India Company founded a station at the Cape in 1652. Wars with the Khoikhoi over grazing followed, and enslaved people were imported. Britain took the Cape in 1795 and 1806, and from 1835–36 about 12,000 Dutch-speaking settlers left the colony in the Great Trek. On the eastern frontier in 1856–57, after the prophecies of Nongqawuse, the Xhosa slaughtered more than 400,000 cattle and some 40,000 people starved.

In what is now KwaZulu-Natal, **Shaka** (r. 1816–1828) built the Zulu kingdom out of the rivalry between the Mthethwa and the Ndwandwe. The military changes credited to him, including a thrusting spear, regiments quartered in military homesteads and the "horns of the buffalo" formation, built on existing age-set institutions. He was assassinated by his half-brothers in 1828. His successor Dingane was defeated by the Voortrekkers at Blood River (Ncome) in 1838. Across the region new states formed as groups moved and fought: Mzilikazi's Ndebele kingdom, eventually in south-western Zimbabwe; Soshangane's Gaza kingdom; and the Basotho kingdom that Moshoeshoe built by gathering refugees from 1824.

These upheavals are known as the **Mfecane** ("crushing"). J. D. Omer-Cooper's *The Zulu Aftermath* (1966) presented them as a Zulu-driven "revolution" of African state-building. In 1988 Julian Cobbing called the Mfecane an "alibi": a Zulu-centric story that hid the labour demands of slavers at Delagoa Bay and of Cape settlers. Elizabeth Eldredge countered that there is scant evidence of a Delagoa Bay slave trade before 1823, though she too rejects the Zulu-centric story. Dan Wylie showed how settler writers exaggerated Shaka's brutality. The current consensus sees multiple causes, including earlier political centralisation, the Delagoa Bay ivory trade, drought, and raiding by mounted, armed groups from the Cape frontier, and recognises that the idea of an "empty land" served colonial land claims. The traditional death-toll estimates are controversial.

## Reform and Revolution in the Islamic West

The eighteenth and nineteenth centuries brought a wave of Islamic reform movements and jihads in West Africa, many led by Fulani scholars. The first rising came in Futa Jallon in 1725, creating a state led by an *almamy* chosen from two leading families, which fell under French control in 1896. The greatest followed in Hausaland. **Usman dan Fodio** (1754–1817), a scholar who wrote more than a hundred works, made his *hijra* (withdrawal) from the kingdom of Gobir in 1804, which began the jihad; by 1808 his followers controlled Hausaland. The **Sokoto Caliphate**, divided in 1815 between his brother Abdullahi and his son Muhammad Bello, grew to more than thirty emirates and perhaps 10 to 20 million people by 1837, the most populous state in West Africa. It was also a vast slave society: estimates of the enslaved share of its people in the nineteenth century run from a quarter to a half or more. Muhammad al-Kanemi, the effective ruler of Bornu, resisted the jihad and challenged its legitimacy in letters to Usman dan Fodio and then to Muhammad Bello.

Usman's daughter **Nana Asma'u** (1793–1864), who knew Arabic, Fulfulde, Hausa and Tamasheq, wrote poems in ajami and from about 1830 trained women teachers, the *jajis*, who travelled to teach women in their homes; their students formed the *'yan taru*, "those who congregate together". Further west, Seku Amadu founded the Massina Caliphate in 1818, later absorbed by Umar Tall's Toucouleur empire, founded in 1852. To the south, Ilorin broke from Oyo, joined the Sokoto Caliphate, and in about 1835 defeated Oyo, whose old capital was then abandoned.

## East Africa and Madagascar

The chapter on The Swahili Coast and Great Zimbabwe traces the Swahili towns and their Indian Ocean trade. In 1698 Oman took Mombasa from the Portuguese, bringing Zanzibar under Omani rule. **Said bin Sultan**, ruler of Oman from 1804, moved his capital from Muscat to Stone Town on Zanzibar, in 1840 by most accounts. He encouraged Indian merchants and clove plantations worked by enslaved people, while signing treaties with Britain in 1822 and 1845 that restricted the slave trade. When he died in 1856, Oman and Zanzibar were divided.

On Madagascar, Andrianampoinimerina reunited the **Merina** kingdom around 1800, and Radama I signed a treaty with Britain in 1817. Merina expansion was violent: between 1828 and 1840 its forces reportedly killed more than 100,000 people and enslaved more than 200,000.

```checkpoint
q: What did Julian Cobbing mean by calling the Mfecane an "alibi" in 1988?
a: That the Zulu kingdom never existed.
x: Cobbing did not deny the Zulu kingdom; he questioned the story built around it.
a*: That the Zulu-centric story of upheaval hid the labour demands of Delagoa Bay slavers and Cape settlers.
a: That Shaka's military reforms were invented by missionaries.
x: The debate concerns the causes of the upheaval, not whether Shaka's regiments existed.
a: That the Mfecane was a positive revolution of African state-building.
x: That was J. D. Omer-Cooper's view in The Zulu Aftermath (1966), which Cobbing attacked.
hint: An alibi deflects blame from someone else.
why: Cobbing argued that blaming Shaka hid colonial interests; Eldredge and others disputed his evidence, and the consensus now sees multiple causes.
---
q: What was distinctive about Nana Asma'u's work in the Sokoto Caliphate?
a: She led the Sokoto armies against Bornu.
x: The written debate with Bornu was conducted by Usman dan Fodio and Muhammad Bello; Nana Asma'u was a scholar and teacher.
a: She founded the Massina Caliphate.
x: Massina was founded by Seku Amadu in 1818.
a: She translated the Sunjata epic into French.
x: That was Djibril Tamsir Niane, in 1960.
a*: She wrote poems in ajami and trained women teachers (jajis) who taught women in their homes.
hint: Think of the 'yan taru.
why: Her network of women teachers shows how Islamic reform also opened spaces for women's learning.
```

## The Continent on the Eve of Conquest

By 1860 sub-Saharan Africa was changing fast, but largely on its own terms. Many of its largest states were creations of recent decades: the Sokoto Caliphate, the Toucouleur empire, the Zulu and Basotho kingdoms, Merina and Omani Zanzibar, while Ethiopia's Era of the Princes had just ended under Tewodros. European footholds were still limited: the Cape and Natal, Sierra Leone, and coastal forts and trading posts. As the chapter on Imperial Expansion and Resistance explains, Europeans still held only about a tenth of the continent in the 1870s; that chapter follows the partition that came after, and the chapter on Abolition and Emancipation follows the long end of slavery itself.

In the long view, Africa's history before 1860 is not a prelude to colonialism. It is a history of migrating farmers, of sculptors at Nok and bronze-casters at Igbo-Ukwu, of rock-hewn churches and ajami poems, of assemblies as well as kings, and of states that rose, traded, enslaved, argued and reformed. Its debates, over iron, the Almoravids, the slave trades and the Mfecane, are also debates about who gets to tell Africa's story.

## Further exploration

- **John Iliffe, *Africans: The History of a Continent* (1995; 3rd ed. 2017).** The standard one-volume survey of the continent's history.
- **François-Xavier Fauvelle, *The Golden Rhinoceros: Histories of the African Middle Ages* (French 2013; English 2018).** Thirty-four short vignettes built from the surviving sources.
- **Michael A. Gomez, *African Dominion: A New History of Empire in Early and Medieval West Africa* (2018).** A new history of Ghana, Mali and Songhay as empires.
- **Zeinab Badawi, *An African History of Africa: From the Dawn of Humanity to Independence* (2024).** An African journalist's survey of the whole continent.
- **Paul E. Lovejoy, *Transformations in Slavery: A History of Slavery in Africa* (1983; 3rd ed. 2011).** The standard account of slavery within Africa and the trades out of it.
- **Toby Green, *A Fistful of Shells: West Africa from the Rise of the Slave Trade to the Age of Revolution* (2019).** A prize-winning history of West Africa in the Atlantic age.
- **Jan Vansina, *Oral Tradition as History* (1985).** The classic guide to using oral tradition as historical evidence.$mn_africa1860_master$,
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
  select $mn_africa1860_quiz$[
    {"type": "mcq", "prompt": "What is the best-supported location of the homeland from which Proto-Bantu speakers began to spread?", "options": ["The Ethiopian highlands", "North-western Cameroon and south-eastern Nigeria", "The upper Nile valley around Meroë", "The Limpopo valley"], "answerIndex": 1, "explanation": "Between about 6,000 and 1,500 years ago Proto-Bantu speakers spread from this homeland across Central, Eastern and Southern Africa.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Conrad and Fisher argue in 1982–83 about the Almoravids and Ghana?", "options": ["That the Almoravids founded Ghana", "That Ghana conquered the Almoravids", "That Ghana never adopted Islam", "That the Almoravid 'conquest' of Ghana in 1076–77 never happened and came from misreading Arabic sources"], "answerIndex": 3, "explanation": "Dierk Lange agrees there was no conquest but argues for Almoravid political pressure; Ghana's rulers did adopt Islam around 1076.", "id": "q2"},
    {"type": "mcq", "prompt": "Which Ethiopian period, from 1769 to 1855, saw regional lords hold real power while emperors were figureheads?", "options": ["The Zemene Mesafint, the 'Era of the Princes'", "The Zagwe dynasty", "The Gondarine period of Fasilides", "The Ethiopian–Adal War"], "answerIndex": 0, "explanation": "It ended when Kassa Hailu was crowned Emperor Tewodros II in 1855.", "id": "q3"},
    {"type": "mcq", "prompt": "What were the jajis trained by Nana Asma'u?", "options": ["Cavalry commanders of the Sokoto armies", "Copyists of the Timbuktu manuscripts", "Women teachers who travelled to teach women in their homes", "Judges of the Futa Jallon almamate"], "answerIndex": 2, "explanation": "From about 1830 Nana Asma'u trained the jajis, whose students formed the 'yan taru.", "id": "q4"},
    {"type": "open", "prompt": "How did the slave trades affect African societies before 1860? Assess the debate between Walter Rodney and John Thornton and the later economic work of Nathan Nunn.", "rubric": "A strong answer distinguishes the trans-Saharan, East African and Atlantic trades (Atlantic: about 12.5 million embarked, 10.7 million arrived; Manning's estimate of 4 million deaths inside Africa after capture), notes the existing slavery Thornton stresses, sets Rodney's argument that the trade was an unequal, colonial-style relationship that diverted production and devastated working people against Thornton's view that African states and elites took part voluntarily and could compete in manufacturing, mentions the gun-slave cycle (Inikori, Lovejoy) and Miller's emphasis on drought, disease and famine alongside the trade, explains Nunn's findings on income and (with Wantchekon) mistrust while noting they are debated, and recognises that slavery inside Africa, as in Sokoto and Zanzibar, continued after the export trade declined.", "id": "q5"},
    {"type": "open", "prompt": "What are the strengths and limits of the 'state' versus 'stateless' contrast, and of the different kinds of evidence, for understanding precolonial Africa?", "rubric": "A strong answer explains the contrast set up in African Political Systems (1940) and its colonial-era origins, gives examples of 'acephalous' societies (Tiv, Igbo, Nuer) and shows how Igbo assemblies, Nri and Arochukwu, and urban Jenne-jeno complicate it; it discusses oral tradition (griots, the Sunjata epic, Vansina), archaeology (Nok, Igbo-Ukwu, Jenne-jeno, iron furnaces), linguistics (the Bantu expansion) and written sources (Arabic geographers, the Tarikh al-Sudan and Tarikh al-Fattash), with an example of source criticism such as the rejected claim of Berber origins for Ghana's rulers.", "id": "q6"}
  ]$mn_africa1860_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/africa/history-of-sub-saharan-africa-to-1860-precolonial-states-and-societies', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
