-- Afro-Indigenous Intersections in Early America — canonical master article, co-written and human-reviewed.
-- history/regional-histories/americas/afro-indigenous-intersections-in-early-america @ research/advanced/read.
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
    'history/regional-histories/americas/afro-indigenous-intersections-in-early-america',
    'research',
    'advanced',
    'read',
    $mn_afroindigenous_master$> **Where two histories meet.** African and Native American histories are usually told apart, but in early America they ran together. Native people were enslaved alongside Africans; Black and Native people married, allied and built families in the borderlands; maroons found refuge among Native nations; and enslaved people won freedom in court by proving a Native grandmother. Settler law worked to divide them, through the one-drop rule and blood quantum. Some Native nations adopted plantation slavery, and the citizenship of the Freedmen they once held is still contested today. This chapter follows those entangled lives and the scholars who have recovered them.

## Two Slaveries on One Coast

Before Europeans arrived, many Native societies of the American Southeast took captives in war. Captives were often adopted to replace dead kin, or held in a status that could be temporary. Colonial demand turned this into a commercial trade: Native groups armed with European guns raided other Native peoples and sold the captives to colonists.

Carolina, founded in 1670, made trade with Native peoples, in deerskins and in Indian captives, its core business until the early 1700s. Charles Town (Charleston) shipped enslaved Native people to the Caribbean, where escape was harder, and to other mainland colonies. Its raiding partners succeeded one another: the Westo, then the Savannah (Shawnee), then the Yamasee and Creek, whose raids with Carolina's backing destroyed the Apalachee missions of Spanish Florida in 1704.

The scale is debated. Alan Gallay estimates that between 1670 and 1715 some 24,000 to 51,000 Native captives were exported through Carolina's ports, more than the number of Africans imported into Carolina in the same years; other accounts give "up to 50,000". By the estimates Christina Snyder cites, the Native population of the South fell from about 199,400 in 1685 to about 90,100 in 1715, through slaving, disease and war.

```quote
The trade in Indian slaves was the most important factor affecting the South in the period 1670 to 1715.
Alan Gallay · The Indian Slave Trade · 2002
```

In 1708, Peter H. Wood found, South Carolina held 4,100 enslaved Africans and 1,400 enslaved Native Americans. Women predominated among enslaved Native people and men among Africans, which encouraged unions between the two groups. They worked, lived and intermarried together, and records often failed to tell them apart. New England had made the link early: after the Pequot War of 1636–38 the ship *Desire* carried seventeen Pequot prisoners to the Puritan colony of Providence Island and returned to Boston in February 1638 with cotton, tobacco, salt and enslaved Africans.

The Carolina trade brought on its own crisis. In the Yamasee War (1715–1717) a coalition led by the Yamasee and including Muscogee (Creek), Catawba and Apalachee attacked South Carolina, provoked by traders' abuses, debts and slaving. The colony armed some 400 enslaved Black men against them, and the tide turned in 1716 when the Cherokee sided with the colonists. Afterwards Carolina stopped buying Native captives on a large scale and relied increasingly on enslaved Africans; the regional trade in Native slaves had essentially ended by about 1750.

This was one part of a hemispheric history. Andrés Reséndez estimates, from fragmentary records, that between 2.5 and 5 million Indigenous people were enslaved in the Americas between 1492 and 1900. Unlike the African trade, which took mostly adult men, most were women and children. The chapter on The Conquest of the Americas discusses his argument.

## Kin and Allies in the Borderlands

From the start, colonial authorities feared alliance between Africans and Native peoples. South Carolina in 1725 forbade taking enslaved people to the frontier and in 1751 legislated against keeping Africans near Native Americans; under Governor James Glen (1743–1756) the colony pursued a policy of creating an "aversion" in Native people towards Africans. In the 1730s the Cherokee signed a treaty with Britain to return runaway slaves.

On the Lower Mississippi the fear came partly true. When the Natchez attacked Fort Rosalie and nearby French settlements on 28 November 1729, killing about 230 people, they mostly spared enslaved Africans; some Africans joined them, and some scholars argue the Natchez spared Africans out of a sense of affinity. Governor Étienne Perier ordered enslaved Africans and French troops to massacre the Chaouacha, a small people with no part in the revolt, an act that may have been meant to prevent alliance between the two. In 1731 he sold hundreds of Natchez captives into slavery in Saint-Domingue.

Spanish Florida offered asylum to people escaping slavery in the British colonies; a royal decree of 1693 granted freedom to runaways who became Catholic and served in the militia. In 1738 Governor Manuel de Montiano ordered the building of Fort Mose (Gracia Real de Santa Teresa de Mose), about two miles north of St Augustine: the first legally sanctioned free Black settlement of formerly enslaved people in what became the United States. Its militia captain, Francisco Menéndez, was a Mandinka from the Gambia region who had escaped slavery in Carolina. The Mose militia fought beside Spanish troops and Indian auxiliaries against James Oglethorpe's siege of St Augustine in 1740, and Jane Landers's archival research shows that some of its people married Indian women. Fort Mose is believed to have helped inspire the Stono Rebellion of 1739, whose rebels marched south towards Florida; the chapters on Colonial North America and Atlantic Slave Wars tell that story.

In New England, kinship joined the two peoples. A 1792 census of the Wampanoag at Gay Head (Aquinnah) found that 28 per cent had African ancestry, and Black ancestry is common among the Mashantucket Pequot, Narragansett, Shinnecock and Mashpee. Crispus Attucks, a sailor and whaler from Framingham traditionally counted as the first person killed in the Boston Massacre of 1770, was, most historians agree, of Wampanoag and African descent; whether he was free or a runaway is debated, and eyewitnesses called him a mulatto and an Indian rather than "Negro". The chapter Declarations of Independence: the American Revolution places him in that crowd. Paul Cuffe (1759–1817), merchant, sea captain and abolitionist, was the son of Kofi Slocum, an Ashanti captured as a child and enslaved in Newport, and Ruth Moses, a Wampanoag from Cape Cod. He married a Wampanoag widow, Alice Abel Pequit, and in 1815–16 carried nine free Black families to Sierra Leone.

```checkpoint
q: What does Alan Gallay's research show about the Carolina trade in Native captives between 1670 and 1715?
a*: That an estimated 24,000 to 51,000 Native captives were exported through Carolina's ports, more than the Africans imported in the same years.
a: That it was a minor sideline to the deerskin trade.
x: Gallay calls the trade in Indian slaves the most important factor affecting the South in this period.
a: That it ended when Carolina was founded in 1670.
x: Carolina's trade in Native captives began with its founding in 1670 and lasted into the 1700s.
a: That most of the captives were adult men, as in the African trade.
x: Most Indian slaves were women and children, unlike the African trade.
hint: Compare the number of Native people shipped out with the number of Africans shipped in.
why: The early South was built on Native as well as African slavery, a fact long left out of the standard story.
---
q: What was Fort Mose?
a: A British fort built to capture runaways heading for Florida.
x: Fort Mose was Spanish, and it sheltered runaways from the British colonies rather than capturing them.
a: A Seminole town founded after the Second Seminole War.
x: Fort Mose was ordered built in 1738, long before the Seminole Wars.
a*: A legally sanctioned free Black settlement near St Augustine in Spanish Florida, with a militia led by Francisco Menéndez.
a: A French settlement destroyed in the Natchez revolt.
x: The Natchez attacked Fort Rosalie, a French post on the Mississippi.
hint: Think of Spain's promise of freedom to runaways who became Catholic and served in the militia.
why: Fort Mose was the first such free Black settlement in what became the United States, and its people fought alongside Spanish troops and Indian auxiliaries.
```

## Maroons and the Black Seminoles

People who escaped slavery often went where Native people lived or had lived. In the Great Dismal Swamp on the Virginia–North Carolina border, research suggests that thousands lived between about 1700 and the 1860s, in country Native peoples had used before them; the maroons reused the remains of Native tools. "They were free," says the archaeologist Daniel Sayers, whose research there began in 2002. "They had emancipated themselves."

The greatest of these refuges was Florida. The Seminole formed there in the eighteenth century from Creek (Muscogee) migrants and remnant Florida peoples; the name *Seminole* and the English *maroon* probably both come from the Spanish *cimarrón*, used of runaways. Escaped people, many of them Gullah from the rice coast of Carolina and Georgia, built their own towns near Seminole villages, grew rice and corn, and developed the Afro-Seminole Creole language. These Black Seminoles lived in separate, largely self-governing communities, paying a form of tribute to Seminole leaders but with far more freedom than people enslaved by whites, including the right to bear arms. Whether to call them slaves, vassals or allies is itself debated.

{{image: John Horse | John Horse (Juan Caballo), a Black Seminole leader of African and Seminole descent, who led his people from Florida to Indian Territory and on to Mexico.}}

For the United States this alliance was intolerable. On 27 July 1816 an American gunboat destroyed the Negro Fort at Prospect Bluff on the Apalachicola River, which the British had left to their Black and Native allies, killing most of the roughly 330 people inside by the usual count (Claudio Saunt thinks far fewer). In the First Seminole War (1817–18) breaking up the Florida maroon communities was one of Andrew Jackson's main aims, and his troops burned Bowlegs Town on the Suwannee.

In the Second Seminole War (1835–1842), the longest of the three, Black Seminole leaders such as John Caesar, Abraham and John Horse fought alongside the Seminole, and Black Seminoles and enslaved plantation workers together destroyed twenty-one sugar plantations from Christmas 1835; historians disagree whether this was a separate slave rebellion. General Thomas Jesup, in a letter of December 1836, called it "a negro, not an Indian war" (quoted versions differ slightly). He offered freedom to Black Seminoles who surrendered and accepted removal; John Horse surrendered on those terms, but the promise was only partly kept. More than 500 Black Seminoles went west with the Seminole after 1838.

In Indian Territory they were placed under the slaveholding Creek and threatened by slave raiders. In 1849 John Horse led about 180 Black Seminoles, with the Seminole leader Coacochee (Wild Cat), to Mexico, which had abolished slavery in 1829. Settled at El Nacimiento in Coahuila as border guards, they became the *Mascogos*. From 1870 the US Army recruited their men as the Black Seminole Scouts in Texas. John Horse also founded Wewoka, now the capital of the Seminole Nation of Oklahoma.

## A Grandmother's Freedom: The Freedom Suits

Settler law made Native ancestry a door out of slavery. Virginia's statute of 1662 made a child's status follow the mother's, and Virginia barred Indian slavery from 1705 (or 1691, on some judicial readings), so a person descended in the female line from a free Native woman could claim freedom. In *Hudgins v. Wright* (1806), Jackey Wright sued for her own and her two children's freedom as descendants of Indian women. Chancellor George Wythe ruled for her on a presumption of freedom under the 1776 Virginia Declaration of Rights; the Court of Appeals upheld the result on narrower grounds, that Hudgins had not proved African descent in the maternal line and that Indians had been free since 1705. The legal historian Ariela Gross draws the lesson: "Indians were by default citizens of a free nation; Africans were by default members of an enslaved race."

Marguerite Scypion, whose maternal grandmother was a Natchez woman captured in war, filed the first freedom suit in St Louis in 1805, relying on Spain's abolition of Indian slavery in Louisiana in 1769. After decades of losses and refilings, a unanimous jury freed her and her family in 1836; the ruling withstood appeal to the US Supreme Court in 1838 and is considered to have ended Indian slavery in Missouri. Such victories freed individuals while writing into law the idea that Native descent meant freedom and African descent slavery.

## Drawing the Colour Line: One Drop and Blood Quantum

The same states also worked to erase Native identity where it met Blackness. Patrick Wolfe argued that two racial regimes ran in opposite directions. For Black people the one-drop rule made any African ancestry enough to be Black, enlarging the population that could be enslaved and exploited. For Native people, non-Native ancestry was held to dilute Indianness, and blood quantum rules tended to define Indians out of existence, shrinking claims to land. Behind the two logics, Wolfe argued, lay two targets: labour and land. Critics such as Sai Englert reply that this is too binary, since settler colonies used both elimination and exploitation.

Federal blood quantum was not widely applied until the Indian Reorganization Act of 1934, though the Dawes Rolls had recorded it earlier; before that, tribal belonging rested on kinship and lineage. The one-drop rule was written into state law from Tennessee in 1910 to Virginia in 1930. Virginia's Racial Integrity Act of 1924, pushed by the registrar Walter Plecker, defined a white person as one with "no trace whatsoever of any blood other than Caucasian", apart from a "Pocahontas exception" for people with one-sixteenth or less Native ancestry, and classed Native Americans as "colored". Plecker had most Virginia Indians reclassified, which, the journalist Warren Fiske reported, left six of its eight state-recognised tribes unable to document their continuity for federal recognition, until Congress recognised them in 2018.

Under this pressure some nations distanced themselves from Blackness: Pamunkey bylaws of 1887 forbade members to marry anyone "except White or Indian", and the Chitimacha of Louisiana disenrolled members with any African ancestry in the early twentieth century (about 1903 to 1919). Others carried the burden of suspicion. The Mashpee Wampanoag, many with African ancestry, lost a land-claim trial in 1977–78 when an all-white jury found they had not been a "tribe" at key dates; commentators argue the defence racialised the claim, and the Mashpee won federal recognition only in 2007. The Lumbee of North Carolina, whose origins some genealogists trace to free Black families of Virginia, a framing Lumbee scholars dispute, won full federal recognition when the Lumbee Fairness Act was signed on 18 December 2025.

Family stories of Native ancestry are common among African Americans, and genetics has complicated them: Henry Louis Gates Jr., whose series *African American Lives* (2006) used DNA testing, later wrote that only about 5 per cent of African Americans have at least 12.5 per cent Native ancestry, the equivalent of one great-grandparent. The Sisseton Wahpeton scholar Kim TallBear insists that belonging is political and relational: "People think that there's a DNA test that can prove if somebody is Native American or not. There isn't."

```checkpoint
q: On what basis did Jackey Wright win her freedom in Hudgins v. Wright (1806)?
a: She proved she had been born in a free state.
x: The case was decided in Virginia, a slave state; birthplace was not the issue.
a*: She was descended in the maternal line from Indian women, and Indians in Virginia had been free since 1705.
a: The court ruled that slavery violated the Virginia Declaration of Rights for everyone.
x: Only Chancellor Wythe relied on a presumption of freedom; the appeals court upheld the result on narrower grounds about descent.
a: She had served in the militia of Spanish Florida.
x: That route to freedom applied to runaways in Florida, not to a Virginia court case.
hint: Remember that in Virginia a child's status followed the mother's.
why: Native descent could open a legal path out of slavery, while African descent was presumed to mean slavery.
---
q: What was Patrick Wolfe's argument about the one-drop rule and blood quantum?
a: That both rules were invented by Native nations to protect their land.
x: Wolfe treated both as settler regimes imposed on Black and Native people.
a: That the two rules worked identically, making everyone with mixed ancestry white.
x: Wolfe's point is that they ran in opposite directions.
a: That blood quantum was used to enlarge the enslaved population.
x: It was the one-drop rule that enlarged the population classed as Black; blood quantum tended to shrink the number of Indians.
a*: That they ran in opposite directions: one expanded who counted as Black, the other shrank who counted as Indian, matching settler interest in labour and in land.
hint: Ask what settlers wanted from each people.
why: Wolfe's contrast is influential, although critics such as Sai Englert find it too binary.
```

## Slavery in the Five Nations

From the late 1700s some Cherokee, Chickasaw, Choctaw, Creek (Muscogee) and Seminole, encouraged by the US "civilization" policy, became planters who held enslaved African Americans. (The label "Five Civilized Tribes" comes from that policy, and historians now criticise it.) Among the Cherokee the number of enslaved people grew from 583 in 1809 to 1,592 by 1835. Cherokee law hardened the colour line: an 1824 law banned marriage between Cherokee and enslaved or free Black people, and other laws barred people of African descent from voting, holding office and bearing arms.

One family shows what this meant. Shoe Boots, a Cherokee warrior, had children with Doll, a woman he enslaved. In 1824 he petitioned the Cherokee National Council to free his three children by her and make them citizens, and the Council agreed; twin sons born later were enslaved by his heirs after his death. Tiya Miles tells their story in *Ties That Bind*.

```quote
These is the only children I have as Citizens of this Nation ... how can I think of them having bone of my bone and flesh of my flesh to be called their property
Shoe Boots · Petition to the Cherokee National Council · 1824
```

Enslaved people resisted, as in the 1842 flight towards Mexico from Webbers Falls, which ended when a Cherokee militia recaptured the fugitives. Removal carried slavery west: by one estimate (Doran, 1978) 4,500 to 5,000 enslaved Black people lived in Indian Territory by 1839. The chapter on Native American and Indigenous Studies describes removal.

Why did these nations adopt chattel slavery? Historians offer answers that are not exclusive. Some stress strategic adaptation: elites took up plantation slavery to meet American demands for "civilization" and so defend their land and sovereignty. Others stress the absorption of Euro-American racial ideas: Barbara Krauthamer shows Choctaw and Chickasaw elites coming to equate Blackness with hereditary inferiority and property, and Miles argues that Cherokee leaders linked "progress" with slaveholding and wrote the equation of Blackness with slavery into law. Theda Perdue and Christina Snyder show older Native captivity practices being transformed rather than simply continued. Most historians reject the comfortable story of a "milder" Native slavery: missionaries described Native slaveholders as brutal, even as some Freedmen remembered better treatment.

The Civil War split the nations, as the chapter on The American Civil War describes. Stand Watie, a slaveholder, became the last Confederate general to surrender, while in February 1863 the Union-aligned Cherokee council declared "all negro and other slaves within the lands of the Cherokee Nation" emancipated, the only one of the five to abolish slavery during the war, though few were actually freed.

## Freedmen and Citizenship

The treaties of 1866 required the five nations to abolish slavery. The Cherokee treaty gave Freedmen "all the rights of native Cherokees", and the Creek and Seminole treaties made them citizens. The Choctaw adopted their Freedmen in 1883; the Chickasaw never did, leaving Chickasaw Freedmen stateless until Oklahoma statehood in 1907. The Dawes Commission, which enrolled the nations' citizens between 1898 and 1907, listed many thousands of Freedmen separately from citizens "by blood". Registrars often judged by appearance, so Freedmen with Native ancestry were listed without any blood quantum, and the separate rolls brought unequal land: Choctaw Freedmen typically received under 40 acres per household against about 320 for Choctaw by blood.

Those rolls still decide citizenship. From 1983 the Cherokee Nation required "by blood" cards to vote, excluding Freedmen descendants, and in 2007 a referendum restricted citizenship to "by blood" descendants by 76 to 24 per cent. Principal Chief Chad Smith argued that sovereignty includes the right to define citizenship and that the 1866 treaty did not bind the nation to admit Freedmen descendants; the Cherokee activist David Cornsilk argued that the nation must honour the treaty and not define itself by race. On 30 August 2017 a federal court ruled in *Cherokee Nation v. Nash* that the 1866 treaty gives Freedmen descendants the same citizenship rights as native Cherokees; the nation did not appeal, and in 2021 its Supreme Court ordered "by blood" removed from its constitution. On 23 July 2025 the Muscogee (Creek) Nation Supreme Court likewise held its "by blood" requirement void under the 1866 treaty, though Principal Chief David Hill paused Freedmen enrolment by executive order in August 2025, and in July 2026 Freedmen descendants sued in federal court to enforce the ruling. The Seminole Nation restricted full citizenship to "by blood" descent in 2000, though its Freedmen bands keep council seats, and the Choctaw and Chickasaw constitutions define citizenship by blood.

## Recovering Entangled Histories

For long these lives fell between two fields. The African American historian Tiya Miles, in *Ties That Bind* (2005) and *The House on Diamond Hill* (2010), recovered the Afro-Cherokee world, and with Sharon P. Holland edited *Crossing Waters, Crossing Worlds: The African Diaspora in Indian Country* (2006). The Afro-Indigenous historian Kyle T. Mays argues in *An Afro-Indigenous History of the United States* (2021) that the country was founded on antiblackness and settler colonialism together, and that Black and Native peoples resisted both, sometimes together and sometimes apart. Jack D. Forbes, of Powhatan-Renapé and Lenape descent, showed how mixed Native people were arbitrarily reclassified as Black. The Chickasaw scholar Jodi Byrd adopted the Caribbean poet Kamau Brathwaite's term "arrivant" for enslaved Africans and others forced into the Americas, to set them apart from settlers. Krauthamer, Alaina Roberts, Perdue and Claudio Saunt have added histories of slavery, emancipation and land, and the anthropologist Circe Sturm's *Blood Politics* (2002) studied race and identity in the Cherokee Nation.

Even the names are argued over. William Loren Katz's popular and pioneering *Black Indians: A Hidden Heritage* (1986) spread its title term, though some of its larger claims are hard to verify. Others prefer "Afro-Native" or Mays's "Afro-Indigenous"; Forbes wrote of "Red-Black peoples". "Freedmen" is a treaty term that descendants use, though some reject its suggestion that they had no Native ancestry. Beneath the vocabulary lie the questions this history leaves open: how sovereignty and treaty rights fit together, who decides belonging, and how two peoples whom settler law worked to divide have made their histories together.

## Further exploration

- **Alan Gallay, *The Indian Slave Trade: The Rise of the English Empire in the American South, 1670–1717* (2002).** The Carolina trade in Native captives and its place at the centre of the colonial South.
- **Andrés Reséndez, *The Other Slavery: The Uncovered Story of Indian Enslavement in America* (2016).** Indigenous slavery across the hemisphere from 1492 to 1900.
- **Tiya Miles, *Ties That Bind: The Story of an Afro-Cherokee Family in Slavery and Freedom* (2005).** Shoe Boots, Doll and their descendants.
- **Barbara Krauthamer, *Black Slaves, Indian Masters: Slavery, Emancipation, and Citizenship in the Native American South* (2013).** Slavery and emancipation among the Choctaw and Chickasaw.
- **Kyle T. Mays, *An Afro-Indigenous History of the United States* (2021).** Antiblackness and settler colonialism as twin foundations of the United States.
- **Alaina E. Roberts, *I've Been Here All the While: Black Freedom on Native Land* (2021).** Freedmen and land in Indian Territory after the Civil War.
- **Jack D. Forbes, *Africans and Native Americans: The Language of Race and the Evolution of Red-Black Peoples* (1993).** How the language of race reclassified mixed Native people.$mn_afroindigenous_master$,
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
  select $mn_afroindigenous_quiz$[
    {"type": "mcq", "prompt": "Where did John Horse lead about 180 Black Seminoles, with the Seminole leader Coacochee, in 1849?", "options": ["To Mexico, which had abolished slavery in 1829", "To the Bahamas, where they founded Red Bay", "To Sierra Leone, with Paul Cuffe", "To Fort Mose, near St Augustine"], "answerIndex": 0, "explanation": "They crossed into Mexico, settled at El Nacimiento in Coahuila as border guards, and became known as the Mascogos.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of the five southeastern nations abolished slavery during the American Civil War?", "options": ["The Chickasaw", "The Choctaw", "The Cherokee, through its Union-aligned council in February 1863", "The Creek (Muscogee)"], "answerIndex": 2, "explanation": "The Union-aligned Cherokee National Council passed acts abolishing slavery in February 1863, the only one of the five to do so during the war, though few were actually freed.", "id": "q2"},
    {"type": "mcq", "prompt": "Which nation never adopted its Freedmen after the treaties of 1866, leaving them stateless until Oklahoma statehood in 1907?", "options": ["The Cherokee", "The Seminole", "The Choctaw", "The Chickasaw"], "answerIndex": 3, "explanation": "The Choctaw adopted their Freedmen by an act of 1883; the Chickasaw never did.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the federal court rule in Cherokee Nation v. Nash on 30 August 2017?", "options": ["That the Cherokee Nation could restrict citizenship to people listed 'by blood'", "That under Article 9 of the 1866 treaty, Freedmen descendants have the same citizenship rights as native Cherokees", "That the Dawes Rolls were invalid", "That the Cherokee Nation must move its capital to Wewoka"], "answerIndex": 1, "explanation": "The court held that the 1866 treaty gave Freedmen descendants citizenship rights coextensive with native Cherokees; the Cherokee Nation did not appeal.", "id": "q4"},
    {"type": "open", "prompt": "Why did some members of the Cherokee, Chickasaw, Choctaw, Creek and Seminole nations adopt plantation slavery? Discuss at least two explanations historians have offered.", "rubric": "A strong answer notes that from the late 1700s some members of these nations became planters, encouraged by the US 'civilization' policy, and sets out at least two explanations: strategic adaptation to defend land and sovereignty; the absorption of Euro-American racial ideas equating Blackness with slavery (Krauthamer on the Choctaw and Chickasaw, Miles on the Cherokee); and the transformation of older Native captivity practices (Perdue, Snyder). Credit for noting that most historians reject the idea of a 'milder' Native slavery, and for evidence such as Cherokee slave laws or the 1842 revolt.", "id": "q5"},
    {"type": "open", "prompt": "Explain the conflict between tribal sovereignty and treaty rights in the Freedmen citizenship disputes.", "rubric": "A strong answer explains that the 1866 treaties required the nations to abolish slavery and (variously) adopt their Freedmen; that the Dawes Rolls listed Freedmen separately from citizens 'by blood', and later constitutions used 'by blood' to exclude their descendants. It sets out both sides: tribal governments (e.g. Chad Smith) argue nations decide their own citizenship and that the 1866 treaty did not bind them to admit Freedmen descendants; Freedmen descendants and supporters (e.g. David Cornsilk) argue the treaty binds and a nation should not define itself racially. Credit for citing the 2007 Cherokee referendum, the 2017 Nash ruling and the 2021 Cherokee Supreme Court order, or the Muscogee Supreme Court ruling of July 2025.", "id": "q6"}
  ]$mn_afroindigenous_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/americas/afro-indigenous-intersections-in-early-america', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
