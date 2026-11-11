-- Native American and Indigenous Studies — canonical master article, co-written and human-reviewed.
-- history/regional-histories/americas/native-american-and-indigenous-studies @ research/advanced/read.
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
    'history/regional-histories/americas/native-american-and-indigenous-studies',
    'research',
    'advanced',
    'read',
    $mn_native_master$> **Nations, not a vanished past.** The Indigenous peoples of the Americas were never one people, and they are not a closed chapter of prehistory. They are hundreds of nations with their own names, laws and histories, and they are still here: more than 570 federally recognised tribal nations in the United States, more than 600 First Nations governments in Canada, and over a thousand Indigenous languages still spoken across the hemisphere. After a brief look at the deep past and the catastrophe after 1492, this chapter follows the nineteenth and twentieth centuries, from removal, Wounded Knee, allotment and the boarding schools to termination, Red Power and today's struggles over sovereignty. It ends with the field itself, the Indigenous scholars who have remade it, and its debates over genocide, settler colonialism and evidence.

## Many Nations, a Long Past

People reached the Americas from northeast Asia by way of Beringia, and most scholars place them south of the North American ice sheets between 15,000 and 20,000 years ago, though footprints at White Sands have been dated to 21,000–23,000 years ago; the chapter on Human Origins and the Peopling of the Earth tells that story. Their descendants built the civilisations described in the chapters on Mesoamerica, the Andes and the Inca Empire, and, north of Mexico, societies as different as Chaco, the city of Cahokia (perhaps 15,000–20,000 people around 1100 CE) and the Haudenosaunee Confederacy, which became the Six Nations when it accepted the Tuscarora in 1722. The chapter on North America before Columbus describes them.

The languages still used belong to over a hundred families and isolates, and UNESCO counts most of them as critically endangered. The 2020 US census counted 3.7 million people who identified as American Indian or Alaska Native alone, and 9.67 million alone or in combination; Canada's 2021 census counted 1,807,250 First Nations, Inuit and Métis people, about 5 per cent of the population. Recognition can take generations: the Lumbee Tribe of North Carolina, who first sought it in 1888, won it only in December 2025.

## Catastrophe and Its Numbers

How many people lived in the Americas in 1492 is one of history's most argued questions. Estimates for the hemisphere range from about 8 million to over 100 million; most recent ones, following William Denevan, fall between 45 and 60 million. For the lands north of Mexico, Alfred Kroeber proposed under a million in 1939 and Henry Dobyns as many as 18 million in 1983; most estimates now lie between about 2.5 and 7 million. The numbers carry moral weight; as Francis Jennings put it, "Scholarly wisdom long held that Indians were so inferior in mind and works that they could not possibly have created or sustained large populations." Critics of high counts, such as David Henige, reply that they rest on arbitrary formulas applied to unreliable sources.

The collapse itself, from epidemics worsened by war, enslavement and dispossession, is told in the chapters on The Conquest of the Americas and The Columbian Exchange and the First Global Economy, and the early encounters in the north in Colonial North America. In most regions Indigenous populations reached their lowest point only around 1900, when the US Census Bureau counted 237,196 American Indians. Was it genocide? David Stannard's *American Holocaust* (1992) rejects the idea of "inadvertent" disease and puts deaths close to 100 million; Russell Thornton stresses that epidemics spread even without direct contact and treats warfare as a comparatively minor cause overall. Many scholars find genocide in particular episodes, of which California is among the most widely cited.

## A Structure, Not an Event

One framework has shaped much recent writing. The historian Patrick Wolfe (1949–2016), English-born and working in Australia, argued that **settler colonialism** differs from colonies built to exploit native labour: it wants land, and so seeks to "eliminate the native". It is, in his phrase, "a structure not an event", a continuing logic rather than a single conquest. The sociologist Sai Englert summarises the view of Wolfe and Lorenzo Veracini as "structural, eliminatory, and land based"; for Wolfe, elimination can mean killing but also "child abduction, religious conversion, resocialization in total institutions such as missions or boarding schools". Wolfe distinguished it from genocide while noting that it had sometimes taken genocidal form.

The framework has critics. Sai Englert and others question its sharp division between eliminating Indigenous peoples and exploiting their labour. J. Kēhaulani Kauanui warns that the slogan is often quoted instead of engaged with, and that Indigeneity endures beyond the structure.

## Law and Removal

In the early United States, dispossession was shaped by law as well as war. In *Johnson v. M'Intosh* (1823) Chief Justice John Marshall laid the foundations of the "doctrine of discovery" in US law: Native nations could sell their land only to the federal government. The Cherokee, among whom Sequoyah had created a syllabary in the 1820s and Elias Boudinot had worked on the first Native American newspaper, the *Cherokee Phoenix*, went to the Supreme Court as Georgia, where gold was found in 1828, sought their land. In *Cherokee Nation v. Georgia* (1831) Marshall called it a "domestic dependent nation" whose relation to the United States resembled "that of a ward to its guardian". In *Worcester v. Georgia* (1832) the Court struck down a Georgia law requiring whites in Cherokee territory to hold a state licence, laying a foundation of tribal sovereignty. Andrew Jackson is often quoted as replying, "John Marshall has made his decision; now let him enforce it!", but the line first appeared in Horace Greeley's history of 1864, nearly twenty years after Jackson's death, and is believed to be apocryphal.

The ruling did not stop removal. Jackson had signed the **Indian Removal Act** on 28 May 1830, and under Jackson and Van Buren more than 60,000 people from at least eighteen nations were moved west of the Mississippi, mostly to Indian Territory, now Oklahoma. For the Cherokee, Muscogee (Creek), Seminole, Chickasaw and Choctaw nations, the forced journeys of 1830–50 became the **Trail of Tears**; over 4,000 enslaved people of African descent went with them. Estimates of the total dead range from about 13,200 to 16,700.

Removal divided the Cherokee. In 1835 a minority, the Treaty Party, signed the Treaty of New Echota without Principal Chief John Ross or the National Council; nearly 16,000 Cherokee petitioned against it, and the Senate ratified it anyway. Historians of Cherokee women note that women, who had taken part in land negotiations as late as 1785, had no seat at New Echota. From May 1838 soldiers drove the Cherokee into camps and then west through the winter of 1838–39. Estimates of Cherokee deaths run from about 4,000 to 8,000. The Cherokee call it *nu na da ul tsun yi*, "the place where they cried". Robert Remini, Jackson's biographer, argued that removal saved the southern nations from annihilation; since the 2000s many scholars have called it ethnic cleansing, genocide or settler colonialism, some all three.

## Wars and Treaties in the West

From 1851 Congress funded moving western nations onto reservations, and in 1871 it stopped making treaties with them altogether. In California, where the Native population fell from about 150,000 in 1848 to 30,000 in 1870, Benjamin Madley estimates that settlers killed between about 9,500 and 16,100 Native people from 1846 to 1873; in 2019 Governor Gavin Newsom called it genocide and apologised. In Minnesota, Dakota people facing starvation and broken annuity promises went to war in 1862; afterwards 38 Dakota men were hanged at Mankato on 26 December 1862, the largest mass execution in US history. From 1864 the Diné (Navajo) were forced on the Long Walk to Bosque Redondo and held there until 1868; estimates of those who died on the marches and in the camp run as high as 3,500. The Sand Creek massacre of 1864 appears in the chapter on The American Civil War.

The Treaty of Fort Laramie (1868) created the Great Sioux Reservation, including the Black Hills, "set apart for the absolute and undisturbed use and occupation of the Indians". In 1874 Custer's expedition found gold there. At the Little Bighorn, the Greasy Grass to the Lakota, on 25–26 June 1876, Lakota, Northern Cheyenne and Arapaho fighters led by Crazy Horse and Gall, and inspired by the visions of Sitting Bull (Tȟatȟáŋka Íyotake), defeated the 7th Cavalry; US dead numbered 268, Custer among them. It was not a simple contest of Native against white: the Crow and Arikara allied with the United States against Lakota expansion. The United States took the Black Hills in 1877. In 1980 the Supreme Court ruled that the taking required compensation, but the Sioux have refused the money, worth over \$2 billion by 2022, and demand the land.

From the Northern Paiute prophet Wovoka (Jack Wilson) in 1889 spread the **Ghost Dance**, which took a more millenarian form among the Lakota. On 29 December 1890, at Wounded Knee Creek on the Pine Ridge Reservation, the 7th Cavalry, armed with four Hotchkiss guns, surrounded Spotted Elk's Miniconjou band during a disarmament, and a massacre followed. Between 250 and 300 Lakota were killed; 25 soldiers were killed and several more later died of their wounds.

```checkpoint
q: What did the Supreme Court decide in Worcester v. Georgia (1832)?
a*: That Georgia could not impose its licensing law on Cherokee territory, a ruling that became a foundation of tribal sovereignty.
a: That the Cherokee Nation was a foreign state entitled to sue in federal court.
x: In Cherokee Nation v. Georgia (1831) the Court declined jurisdiction, calling the Cherokee a "domestic dependent nation".
a: That removal west of the Mississippi was constitutional.
x: Removal rested on the Indian Removal Act of 1830 and on treaties such as New Echota, not on Worcester.
a: That Native nations could freely sell land to private buyers.
x: Johnson v. M'Intosh (1823) held that they could sell only to the federal government.
hint: Think of what tribal sovereignty means for state law.
why: Worcester affirmed Cherokee self-government, yet removal went ahead regardless, showing the gap between law and power.
---
q: Why do the Sioux nations still refuse the compensation awarded for the Black Hills?
a: Because the Supreme Court ruled that the land had been sold legally.
x: In 1980 the Court ruled that the 1877 taking required just compensation.
a: Because the sum was too small to be worth collecting.
x: The award, \$17.1 million plus interest, was worth over \$2 billion by 2022.
a*: Because they want the land itself, which the 1868 Fort Laramie Treaty had set apart for them.
a: Because the Black Hills had always belonged to the Crow.
x: The 1868 treaty placed the Black Hills inside the Great Sioux Reservation.
hint: Think about what the 1868 treaty said the land was "set apart" for.
why: Accepting the money would mean accepting the loss of land that the treaty had guaranteed.
```

## Allotment and Citizenship

The next assault was on communal land. The **Dawes Act** of 1887 divided reservation land into individual allotments held in trust for 25 years and opened the "surplus" to white settlers. It also required a federal definition of who was an Indian, encouraging reliance on "blood quantum". Between 1887 and 1934 Native nations lost about 100 million acres, roughly two-thirds of the land they held in 1887. The Curtis Act of 1898 extended allotment to the Five Tribes and abolished their governments and courts, preparing the way for the state of Oklahoma. The Indian Citizenship Act of 1924 made Native people born in the United States citizens, partly in recognition of their service in the First World War, but voting was left to the states, and in 1938 seven states still barred Indians from voting.

## Boarding Schools and Residential Schools

If allotment aimed at land, the schools aimed at children. In 1879 the army officer Richard Henry Pratt founded the Carlisle Indian Industrial School in Pennsylvania, the model for off-reservation boarding schools. In an 1892 speech Pratt said: "A great general has said that the only good Indian is a dead one … In a sense, I agree with the sentiment, but only in this: that all the Indian there is in the race should be dead." The slogan associated with him is "Kill the Indian, save the man". Children's hair was cut, their names changed and their languages forbidden; later investigations found physical, emotional and sexual abuse. Most deaths came from infectious disease. In 2024 the US Interior Department's Federal Indian Boarding School Initiative reported that at least 973 American Indian, Alaska Native and Native Hawaiian children had died at the 417 federal schools it identified, a minimum figure, and in October 2024 President Joe Biden formally apologised. Yet, as Julie Davis argues, the schools were sites of "both victimization and agency".

Canada built a parallel system. The **Indian Act** of 1876 defined "Indian status" and governed reserves; amendments banned the potlatch from 1885 and the Sun Dance from 1895. Attendance was made compulsory from 1894 and, for all status children aged 7 to 15, from 1920, and about 150,000 children passed through them before the last federally funded school closed in 1997. The government apologised in 2008, and the **Truth and Reconciliation Commission**, chaired by Justice Murray Sinclair, issued 94 Calls to Action in 2015 and concluded that the system was "cultural genocide". At least 4,100 student deaths have been documented; Sinclair suggested the true number was over 6,000. In 2022 Pope Francis apologised and called it genocide, the House of Commons unanimously called for it to be recognised as genocide, and scholars still debate which term fits. The **Sixties Scoop** then took an estimated 20,000 Indigenous children into foster care or adoption, mostly with white families.

In May 2021 Tk'emlúps te Secwépemc announced that a ground-penetrating radar survey at the former Kamloops Indian Residential School had found the probable remains of 215 children, a figure the survey's report revised in July to about 200 anomalies interpreted as probable burials. In June the Cowessess First Nation reported up to 751 unmarked graves at the Marieval cemetery, a community cemetery used by adults and children, Native and non-Native. These were findings of **possible unmarked graves**: radar detects anomalies, not bodies, and the anthropologist who led the Kamloops survey said only excavation could confirm human remains. Few sites have been excavated, some partial excavations found no human remains, and many communities choose not to disturb possible burials. A "residential school denialism" has used these gaps. Indigenous communities and scholars reply that only a minority of media stories spoke of "mass graves", and that the documented deaths of thousands of children are not in dispute.

## From the Indian New Deal to Termination

Federal policy swung again. The **Indian Reorganization Act** of 1934, centrepiece of Commissioner John Collier's "Indian New Deal", ended allotment and encouraged tribes to adopt constitutions. Tribes voted on it: 172 accepted it and 75 rejected it, among them the Navajo, embittered by a livestock-reduction programme that took half their herds, and critics have long argued that its model constitutions imposed a standard form of government.

After the Second World War came **termination**. Following House Concurrent Resolution 108 in 1953, the United States ended its recognition of more than 100 tribes and bands by 1964, affecting more than 12,000 people. Senator Arthur Watkins of Utah compared it to the Emancipation Proclamation; the Northern Cheyenne senator Ben Nighthorse Campbell later put it differently: "In Washington's infinite wisdom, it was decided that tribes should no longer be tribes, never mind that they had been tribes for thousands of years." The Relocation Act of 1956 paid Native people to move to cities such as Los Angeles, Denver and Chicago. In 1950 only a small minority of American Indians lived in cities; between the 1950s and 1980s as many as 750,000 moved to them.

## Red Power

The cities and campuses produced a new politics. The National Indian Youth Council held "fish-ins" in the Pacific Northwest from the 1960s to defend treaty fishing rights. Vine Deloria Jr., executive director of the National Congress of American Indians in 1964–67, published *Custer Died for Your Sins: An Indian Manifesto* (1969), with essays on termination, anthropologists and Indian humour; the phrase "Red Power" is attributed to him.

{{image: Occupation of Alcatraz | The occupation of Alcatraz Island by Indians of All Tribes, 1969–71.}}

On 20 November 1969 **Indians of All Tribes**, led by Richard Oakes (Mohawk), LaNada Means and others, occupied Alcatraz Island, claiming it under the 1868 Fort Laramie Treaty and, with pointed irony, "by right of discovery". They held it for nineteen months. The **American Indian Movement** (AIM), founded in Minneapolis in 1968 against police brutality and urban poverty and led by Dennis Banks, Clyde and Vernon Bellecourt and Russell Means, took the Trail of Broken Treaties protest to Washington in 1972. On 27 February 1973 about 200 Oglala Lakota and AIM members seized **Wounded Knee**, the site of the 1890 massacre, after a failed attempt to impeach the Pine Ridge tribal president, Richard Wilson. The siege by federal marshals and the FBI lasted 71 days. Frank Clearwater and Lawrence "Buddy" Lamont (Oglala) were killed, a marshal was paralysed, and the activist Ray Robinson disappeared and was later found to have been killed on the reservation, allegedly by AIM members.

## Self-Determination and Sovereignty Today

On 8 July 1970 President Richard Nixon repudiated forced termination and called for "a new era in which the Indian future is determined by Indian acts and Indian decisions". The Indian Self-Determination and Education Assistance Act of 1975 let tribes run federal programmes themselves. The **Indian Child Welfare Act** (ICWA) of 1978 answered surveys that found 25–35 per cent of Native children in some states removed from their families, mostly to non-Native homes; it gave tribes jurisdiction over their children's custody cases. In *Haaland v. Brackeen* (2023) the Supreme Court upheld it, seven to two.

The **Native American Graves Protection and Repatriation Act** (NAGPRA) of 1990 requires federally funded institutions to return human remains and sacred objects to descendants and nations; rules revised in 2024 require them to defer to Native traditional knowledge. Its hardest test was Kennewick Man, a skeleton about 9,000 years old found in 1996: scientists fought to study him, while a coalition of Columbia Plateau tribes, among them the Umatilla, Colville, Yakama, Nez Perce and Wanapum, claimed him as an ancestor. DNA analysis in 2015 found him more closely related to modern Native Americans than to any other living population, and in 2016 Congress ordered his return; he was reburied in February 2017.

Treaties remain law. In *McGirt v. Oklahoma* (2020) the Supreme Court ruled, five to four, that the Muscogee (Creek) reservation had never been disestablished and remained "Indian country" for federal criminal law; Oklahoma's courts applied the reasoning to other nations, so that much of eastern Oklahoma is Indian country.

```quote
Today we are asked whether the land these treaties promised remains an Indian reservation for purposes of federal criminal law. Because Congress has not said otherwise, we hold the government to its word.
Justice Neil Gorsuch · McGirt v. Oklahoma · 9 July 2020
```

At Standing Rock in 2016–17, young people and elders, among them the tribal historian LaDonna Brave Bull Allard, camped against the Dakota Access Pipeline, which crosses under Lake Oahe near the reservation and threatened its water and burial sites. Members of more than 300 tribes joined the "water protectors". The Army denied the pipeline's easement in December 2016, but construction resumed under President Trump. In Canada, **Idle No More**, founded in 2012 by three First Nations women and a non-Native ally, used round dances and blockades against a government bill.

```checkpoint
q: What did the 2021 ground-penetrating radar surveys at Kamloops and Marieval report?
a: Mass graves confirmed by excavation.
x: The surveys detected anomalies, not bodies; the survey leader said only excavation could confirm human remains.
a*: Possible unmarked graves, identified as anomalies that only excavation could confirm.
a: The first evidence that any children had died at residential schools.
x: Thousands of student deaths had already been documented.
a: Proof that no children had died at the schools.
x: At least 4,100 student deaths are documented and not in dispute.
hint: Think about what radar can and cannot detect.
why: The difference between possible graves and confirmed remains lies at the centre of the debate, which denialists have exploited.
---
q: What did McGirt v. Oklahoma (2020) decide?
a: That the Muscogee (Creek) Nation must accept money for its land.
x: That resembles the Black Hills dispute; McGirt concerned criminal jurisdiction.
a: That Oklahoma's statehood had abolished the reservations within it.
x: The Court held that Congress had never disestablished the Muscogee reservation.
a: That the Indian Child Welfare Act was constitutional.
x: That was Haaland v. Brackeen (2023).
a*: That the Muscogee (Creek) reservation still exists as "Indian country" for federal criminal law.
hint: Gorsuch said the Court would hold the government "to its word".
why: McGirt showed that nineteenth-century treaties remain law unless Congress clearly says otherwise.
```

## A Global Movement and Living Languages

On 13 September 2007 the UN General Assembly adopted the **Declaration on the Rights of Indigenous Peoples** (UNDRIP) by 143 votes to 4. The four opponents, Australia, Canada, New Zealand and the United States, were all settler states, and all later reversed their positions. The Declaration is not binding, but it gives a common language of rights to what the UN then counted as some 370 million Indigenous people. Elsewhere in the hemisphere, Chile's "Pacification" of Araucanía and Argentina's Conquest of the Desert appear in the chapter on Latin America after Independence, and the largely Maya Zapatista rising of 1994 in the chapter on The Mexican Revolution.

Languages are being reclaimed. Among the Wampanoag, the linguist Jessie Little Doe Baird led the revival of Wôpanâak from colonial-era documents, including a Bible translation, so that children speak it fluently for the first time in over a century. Language nests on Māori and Hawaiian models immerse young children, and apps exist in Cree, Cherokee, Lakota, Ojibwe, Navajo and other languages.

## Remaking the Field

Native American and Indigenous Studies grew out of the same activism. The University of Minnesota approved a Department of American Indian Studies in 1969 and the first Convocation of American Indian Scholars met at Princeton in 1970. The Crow Creek Dakota scholar Elizabeth Cook-Lynn named the field's two key concepts as Indigenousness and **sovereignty**, the second marking its difference from other ethnic studies.

The field also questioned research itself. The Māori scholar Linda Tuhiwai Smith (Ngāti Awa and Ngāti Porou) opened *Decolonizing Methodologies* (1999) with a challenge:

```quote
The word itself, 'research', is probably one of the dirtiest words in the indigenous world's vocabulary.
Linda Tuhiwai Smith · Decolonizing Methodologies · 1999
```

Western research, she argued, was "inextricably linked to European imperialism and colonialism"; she proposed *kaupapa Māori* research in its place. A related question is the standing of **oral tradition** as evidence. In *Delgamuukw v. British Columbia* (1997) Canada's Supreme Court held that oral histories, which Gitxsan and Wet'suwet'en elders had given in their own languages, could be admitted as evidence of Aboriginal title. Yet oral tradition can also be set against science: in his late book *Red Earth, White Lies* Deloria rejected the Bering land-bridge account in favour of traditional histories. Taking oral tradition seriously means weighing it, as historians weigh any source.

Ned Blackhawk, a Western Shoshone (Te-Moak) historian at Yale, argues in the National Book Award-winning *The Rediscovery of America* (2023) that Native peoples were central, not peripheral, to US history. Others differ in emphasis: Roxanne Dunbar-Ortiz and Jeffrey Ostler emphasise settler colonialism and genocide, while Pekka Hämäläinen's *Indigenous Continent* (2022) stresses four centuries of Native power, often read as a challenge to a story told only in terms of victims. Between destruction and endurance lies the history this field tells.

## Further exploration

- **Ned Blackhawk, *The Rediscovery of America: Native Peoples and the Unmaking of U.S. History* (2023).** A prize-winning synthesis that puts Native nations at the centre of US history.
- **Vine Deloria Jr., *Custer Died for Your Sins: An Indian Manifesto* (1969).** The Red Power-era classic on termination, anthropologists and Indian humour.
- **Linda Tuhiwai Smith, *Decolonizing Methodologies: Research and Indigenous Peoples* (1999).** The founding text on research by and for Indigenous peoples.
- **Roxanne Dunbar-Ortiz, *An Indigenous Peoples' History of the United States* (2014).** US history retold as settler colonialism.
- **Pekka Hämäläinen, *Indigenous Continent: The Epic Contest for North America* (2022).** Four centuries of Native power across the continent.
- **Jeffrey Ostler, *Surviving Genocide: Native Nations and the United States from the American Revolution to Bleeding Kansas* (2019).** Genocide and survival east of the Mississippi.
- **Nick Estes, *Our History Is the Future: Standing Rock versus the Dakota Access Pipeline, and the Long Tradition of Indigenous Resistance* (2019).** Standing Rock in a long tradition of resistance.$mn_native_master$,
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
  select $mn_native_quiz$[
    {"type": "mcq", "prompt": "What did Patrick Wolfe mean by calling settler colonialism \"a structure not an event\"?", "options": ["That settler colonialism was a single conquest completed in the colonial period", "That settler colonialism is a continuing logic aimed at acquiring land and eliminating the native, not a one-off episode", "That settler colonies depended mainly on exploiting Indigenous labour", "That colonial violence left no lasting institutions"], "answerIndex": 1, "explanation": "Wolfe argued that settler colonialism seeks land and therefore to 'eliminate the native', through a continuing structure that can include child abduction and boarding schools, rather than through a single event; he contrasted it with colonies built on exploiting native labour.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the 1830s removal of the southern nations is supported by the evidence?", "options": ["The Treaty of New Echota was approved by Principal Chief John Ross and the Cherokee National Council", "Andrew Jackson's words 'John Marshall has made his decision; now let him enforce it!' are recorded in an 1832 transcript", "More than 60,000 people from at least eighteen nations were moved west under Jackson and Van Buren", "Removal was agreed by all historians to have saved the southern nations from annihilation"], "answerIndex": 2, "explanation": "More than 60,000 people were removed. New Echota was signed by the minority Treaty Party, not Ross or the National Council; the Marshall quotation first appeared in 1864 and is believed apocryphal; and Remini's view that removal saved the nations is contested by scholars who call it ethnic cleansing or genocide.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Dawes Act of 1887 do?", "options": ["Divided communal reservation land into individual allotments and opened the 'surplus' to white settlers", "Ended allotment and encouraged tribes to adopt their own constitutions", "Made all Native people born in the United States citizens", "Required museums to return human remains to Native nations"], "answerIndex": 0, "explanation": "The Dawes Act allotted communal land; between 1887 and 1934 Native nations lost about 100 million acres, two-thirds of their land base. The Indian Reorganization Act (1934) ended allotment, the Indian Citizenship Act (1924) conferred citizenship, and NAGPRA (1990) governs repatriation.", "id": "q3"},
    {"type": "mcq", "prompt": "What did DNA analysis of Kennewick Man published in 2015 show?", "options": ["That he was unrelated to any living population", "That he was most closely related to Europeans", "That he was too recent to fall under NAGPRA", "That he was more closely related to modern Native Americans than to any other living population"], "answerIndex": 3, "explanation": "The analysis supported the Columbia Plateau tribes' claims of ancestry; Congress ordered his return in 2016 and he was reburied in 2017, ending a long dispute between scientists and tribes under NAGPRA.", "id": "q4"},
    {"type": "open", "prompt": "In 2021 several First Nations announced the results of ground-penetrating radar surveys at former residential schools. Explain what was found, why the findings became controversial, and why Indigenous communities and scholars argue that the controversy should not obscure the schools' record.", "rubric": "A strong answer explains that Tk'emlúps te Secwépemc first announced 215 probable burials at Kamloops, revised to about 200 anomalies interpreted as probable burials and that Cowessess reported up to 751 unmarked graves at the Marieval community cemetery; that these are possible unmarked graves, since radar detects anomalies rather than bodies and only excavation can confirm remains; that few sites have been excavated, some partial excavations found none, and many communities choose not to disturb burials; that 'residential school denialism' has exploited these gaps; and that only a minority of media stories spoke of 'mass graves', while at least 4,100 student deaths are documented (perhaps over 6,000, per Murray Sinclair) and are not in dispute. Credit mention of the TRC's 'cultural genocide' finding and the later debate over whether 'genocide' is the right term.", "id": "q5"},
    {"type": "open", "prompt": "Compare two ways historians have framed the history of Native nations and the United States: as a story of settler colonialism and genocide, and as a story of Native power and endurance. Use named scholars and at least two episodes from the chapter.", "rubric": "A strong answer presents Patrick Wolfe's settler colonialism ('a structure not an event', elimination, land-based) and its use by Roxanne Dunbar-Ortiz and Jeffrey Ostler, noting critics such as Sai Englert and J. Kēhaulani Kauanui; it contrasts Pekka Hämäläinen's emphasis on Native power and Ned Blackhawk's argument that Native peoples were central to US history. It draws on episodes such as removal (called ethnic cleansing, genocide or settler colonialism; defended by Remini), the California killings (Madley's estimates; Newsom's 2019 apology), boarding schools (Pratt's aims versus Julie Davis's 'victimization and agency'), and Red Power, McGirt or Standing Rock as evidence of continuing sovereignty. Credit an answer that argues the frameworks can be combined.", "id": "q6"}
  ]$mn_native_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/americas/native-american-and-indigenous-studies', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
