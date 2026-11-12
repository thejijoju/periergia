-- Slavery: a Global History — canonical master article, co-written and human-reviewed.
-- history/thematic-history/slavery @ research/advanced/read.
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
    'history/thematic-history/slavery',
    'research',
    'advanced',
    'read',
    $mn_slavery_master$> **An institution found almost everywhere.** Slavery appears in the law codes of Mesopotamia, underpinned classical Athens and Roman Italy, existed in China, India and Korea, supplied the armies of the Islamic world, moved millions across the Sahara and the Indian Ocean, and reached its greatest scale in the Atlantic plantation world. This chapter takes the long, comparative view: how historians define slavery; bondage in the ancient, Asian, Islamic, African, European and Indigenous American worlds; the Atlantic system and the "second slavery" of the nineteenth century; and abolition, slavery's afterlives, reparations and modern slavery. Where other chapters tell part of the story in detail, this one points to them.

## What Is Slavery?

The commonest definition of slavery is legal: a slave is a person owned as property. The Jamaican-American historical sociologist **Orlando Patterson** deliberately did not make property his starting point in *Slavery and Social Death: A Comparative Study* (1982). He offered instead a definition built on power.

```quote
the permanent, violent domination of natally alienated and generally dishonored persons
Orlando Patterson · Slavery and Social Death · 1982
```

For Patterson slavery began, or was imagined as beginning, as a substitute for death, typically the death of a war captive. The captive was spared but suffered **social death**: loss of name, kin and honour, and total dependence on a master. His "ultimate slaves" were palace eunuchs, trusted and powerful yet despised. Critics, among them the historian Vincent Brown, warned that "social death" could erase the political and social lives the enslaved built for themselves. In a 2018 preface Patterson answered that social death was a *slaveholder ideology*, the masters' aim rather than a description of the slaves' inner lives.

A second framework comes from the classicist **Moses Finley**, whose *Ancient Slavery and Modern Ideology* appeared in 1980. Finley distinguished societies in which slaves were few and economically marginal from true slave societies, in which slaves were a large share of the population and the main source of the elite's income. He named only five genuine slave societies: classical Greece and Roman Italy, and in modern times the US South, the Caribbean and Brazil. Critics find the list too short and its criteria rigid: Noel Lenski adds the Sokoto Caliphate among others, James Palais argued that premodern Korea was a slave society, and some Pacific Northwest peoples also held large enslaved populations.

Even the word is contested. Most scholars trace English "slave", through Old French *esclave*, to Byzantine Greek and Late Latin terms for the Slavs, so many of whom were enslaved in the eighth and ninth centuries. This is the widespread view, but it has been disputed since the nineteenth century.

## The Ancient World

The Laws of **Hammurabi**, who ruled c. 1792–1750 BCE, distinguish free persons, a dependent class whose meaning is still debated, and male and female slaves. Laws cover slave sales and the harbouring of fugitives, and the final law orders that a slave who says "You are not my master", once proven a slave, shall have his ear cut off. In Egypt slavery existed from at least the Old Kingdom, though Egyptian terms do not map neatly onto "slave". Most Egyptologists now hold that the Great Pyramids were not built by slaves.

{{image: Code of Hammurabi | The stele of the Laws of Hammurabi. The code separates free persons from slaves, and its final law punishes a slave who denies his master.}}

In **Greece** numbers are uncertain. Athens probably had the largest slave population, perhaps up to 80,000 in the sixth and fifth centuries BCE, though the lowest estimate, for Demosthenes' time, is about 20,000. Slaves worked in households and in the Laurion silver mines, where the general Nicias leased out 1,000 of them. Sparta's **helots**, a state-owned, land-bound majority, are often likened to serfs rather than chattel slaves. Aristotle argued in his *Politics* that some people are slaves "by nature" and others only by law, calling the slave, in one translation, "a piece of property" and "a tool for action". The Stoic Seneca disagreed, and the argument had a long afterlife: at the Valladolid debate of 1550–51 Juan Ginés de Sepúlveda called Amerindians natural slaves, while Bartolomé de las Casas denied that the category applied to them.

**Rome** was Finley's other ancient slave society. On one estimate 20 to 30 per cent of Italy's population was enslaved by the end of the first century BCE, at least one to two million people, but such figures rest on assumptions; writing of estimates of the Roman slave supply, Keith Bradley warned: "None of these figures is capable of proof." Roman law held that slaves "are either born or made", through war, piracy, kidnapping or child abandonment. Rome's great slave revolt, led by **Spartacus** in 73–71 BCE, began when about 70 gladiators escaped a school at Capua; ancient figures put the rebels at some 120,000 people, and according to Appian Crassus crucified 6,000 captives after his victory.

## China, India and Korea

In **China** slaves were classed among the "base people". **Wang Mang** abolished slavery in 9 CE as part of a radical land reform, only for it to be reinstated in 12 CE. Large-scale slavery on the Greek or Roman model, however, did not develop. Slavery declined during the Song commercial boom; the Qing held about two million slaves at their conquest and gradually turned slaves and bondservants into peasants; and slavery was abolished by a Qing edict of 1909, effective in 1910.

In **India** the meaning of the Vedic *dāsa* is disputed: enemy, servant or slave. By the start of the common era the *Arthashastra*, the *Manusmriti* and the *Mahabharata* show slavery as an established institution, and Ashoka's edicts mention duties towards slaves. In **Korea** the hereditary *nobi* of the Goryeo and Joseon dynasties could be bought, sold or given away, and at their peak in mid-Joseon may have made up more than 30 per cent of the population. Whether they were slaves is debated: James Palais argued that premodern Korea was a slave society, while others treat many *nobi* as closer to serfs or tenants. Most government *nobi* were freed in 1801 and the system was abolished in 1894.

## The Islamic World and the Eastern Trades

Because Islamic law forbade enslaving Muslims and protected non-Muslims under Muslim rule, slaves came from beyond the frontiers, as Slavery in the Global Middle Ages explains. One distinctive result was **military slavery**. *Mamluk* means "one who is owned". The Abbasid caliph al-Muʿtaṣim (r. 833–842) built large armies of Turkish slave soldiers, and military slavery lasted into the nineteenth century: Egypt's mamluk elite until Muhammad Ali massacred it in 1811, and mamluk rule in Iraq until 1831. The Ottoman **Janissaries** were recruited from the 1380s through the *devshirme*, a levy of Christian boys, mostly from the Balkans, which also produced many grand viziers; the levy dwindled in the seventeenth century, with small levies into the 1680s, and was abolished early in Ahmed III's reign after a failed revival in 1703. Here Patterson's paradox is sharpest: legally owned men who commanded armies and ran states.

In the **Zanj Rebellion** (869–883), enslaved and freed Africans who had been put to work clearing nitrous topsoil and in the salt flats of southern Iraq rose under Ali ibn Muhammad, took Basra in 871 and held out until their capital fell in 883. Contemporary death tolls are, in modern historians' view, gross exaggerations. Further north, the Crimean Khanate exported, on Dariusz Kołodziejczyk's estimate, about two million captives from Muscovy and Poland-Lithuania to the Ottoman world between 1500 and 1700.

The trades from Africa to the Islamic world are hard to measure. **Paul Lovejoy** estimates about six million people taken across the Sahara between 650 and 1500, and totals for the whole period from the seventh century to the twentieth range, on Ronald Segal's figures, from 10 to 18 million. Tidiane N'Diaye and Olivier Pétré-Grenouilleau put the number taken from East Africa at about 8 million and the Saharan trade at 9 million, but William Gervase Clarence-Smith notes that estimating the Indian Ocean trade has been controversial. These figures, also discussed in Migration and Diaspora, are far less certain than the Atlantic ones. These trades did not shrink as the Atlantic trade closed: the East African trade grew enormously in the nineteenth century.

The traffic also ran the other way across the Mediterranean. Robert C. Davis estimates that 1 million to 1.25 million Europeans were taken to Tunis, Algiers and Tripoli by **Barbary corsairs** between the early sixteenth and mid-eighteenth centuries, but his figure is a contested extrapolation that assumes a steady rate of capture over 250 years; contemporary observers estimated some 35,000 European slaves in the Barbary states, mostly in Algiers, in the seventeenth century. Most captives were seamen, though raids reached Ireland and Iceland. Christians enslaved Muslims too, in Mediterranean galleys, and the Barbary story is sometimes used polemically to play down the Atlantic trade.

## Medieval Europe: Slaves and Serfs

Slavery did not vanish with Rome. About 10 per cent of the people recorded in England's Domesday Book (1086) were slaves. Verdun was a centre where captives, many of them Slavs, were castrated for sale as eunuchs in al-Andalus, and Genoese Caffa in Crimea was a major Black Sea market. Alongside slavery stood **serfdom**, and the difference mattered: serfs generally could not be bought or sold as individuals, though they might pass with the land. A "second serfdom" then spread in central and eastern Europe, eroded by the Habsburg Serfdom Patent of 1781 and Prussia's edict of 1807, and ended only in 1848 in the Habsburg lands and in 1861 in Russia. In the Romanian principalities Roma were enslaved for about five centuries; by the nineteenth century some 150,000–200,000 were held at any one time, until emancipation in 1843–1856.

```checkpoint
q: What did Moses Finley mean by a "slave society"?
a*: A society in which slaves were a large share of the population and the elite's main source of income, as in classical Greece, Roman Italy, the US South, the Caribbean and Brazil.
a: Any society in which slavery was legal.
x: Finley distinguished societies that merely had slaves from slave societies, so legality alone was not enough.
a: A society in which slaves had seized political power, like the Mamluk sultanate.
x: Finley's test was demographic and economic, not about who ruled.
a: A society that enslaved only foreigners, as Islamic law required.
x: Finley's distinction says nothing about the origin of the enslaved.
hint: Think of the difference between "having slaves" and depending on them.
why: Finley's five-society list remains influential, though critics add cases such as the Sokoto Caliphate and premodern Korea.
---
q: Why do historians treat Robert Davis's estimate of 1 to 1.25 million Europeans enslaved by Barbary corsairs with caution?
a: Because no Europeans were ever enslaved in North Africa.
x: Large numbers of European captives, mostly seamen, were held in Tunis, Algiers and Tripoli.
a: Because it is based on a complete register of captives kept in Algiers.
x: Davis's total is an extrapolation, not a count from a register.
a*: Because it extrapolates from an assumed constant capture rate over 250 years, possibly from the peak period.
a: Because Davis counted only Muslims enslaved in Christian galleys.
x: Davis's figure concerns Europeans taken to North Africa.
hint: How was the total actually calculated?
why: Peter Earle suggests Davis extrapolated from the peak years, and John Wright notes that all such figures are back-calculations.
```

## Indigenous American Slaveries

Slavery in the Americas did not begin with Africans. Some Native American peoples held war captives as slaves before and after contact; among some Pacific Northwest peoples about a quarter of the population was enslaved, and the status was hereditary. After 1492 Europeans enslaved Indigenous people on a vast scale. In *The Other Slavery* (2016), **Andrés Reséndez** estimates that 2.5 to 5 million Indigenous people were enslaved in the Americas, most of them women and children, often under other names: encomienda, repartimiento, mission labour and debt peonage. He argues that enslavement, not disease alone, drove much of the Indigenous population collapse, especially in the Caribbean, a claim debated alongside the epidemiological view described in The Conquest of the Americas. Afro-Indigenous Intersections in Early America and Native American and Indigenous Studies follow these histories further.

## The Atlantic System

The SlaveVoyages database estimates that about 12.5 million captives embarked from Africa and about 10.7 million survived the voyage; about 2 million died in the Middle Passage. Philip Curtin, whose census of 1969 was one of the first systematic estimates, later wrote *The Rise and Fall of the Plantation Complex* (1990), which popularised the term **plantation complex**. The Atlantic Slave Trade tells that story, including how the trade worked on the African coast.

In the Atlantic world slavery was bound to **race**, and colonial law tied it to African descent. Barbados's Slave Code of 1661, the first comprehensive English colonial slave act and a model for others, set out to protect slaves "as we do men's other goods and Chattels". Virginia in 1662 adopted *partus sequitur ventrem*, a Roman doctrine under which children followed their mother's status, so that children of enslaved women, including those fathered by their enslavers, were born enslaved. France's Code Noir (1685) regulated its colonies.

## Law, Life and Resistance

Slave codes usually denied enslaved people legal marriage and restricted their movement, assembly and, in places, education. After the Stono Rebellion of 1739, South Carolina in 1740 passed the first law forbidding anyone to teach enslaved people to write; seven Southern states passed such laws by 1834. Africans brought Islam, Catholicism from Kongo and African religions across the Atlantic, and in the United States many worshipped in secret "hush harbors" and "invisible churches" beyond white supervision. Resistance ran from everyday refusal to flight and open war: maroon communities such as Palmares and the great revolts from Stono to the Baptist War in Jamaica are told in Atlantic Slave Wars.

## The Second Slavery

Slavery in the nineteenth-century Americas was not a dying relic. In 1988 the historian **Dale Tomich** coined the term **second slavery** for new zones of mass slave production tied to industrialisation: cotton in the US South, sugar in Cuba and coffee in Brazil. Ada Ferrer's *Freedom's Mirror* (2014) follows the Haitian Revolution and the rise of Cuba's second slavery side by side.

The United States must be read in this hemispheric web. Haiti's revolution sent shockwaves through the slaveholding South, echoed in Gabriel's conspiracy (1800), the German Coast uprising (1811), Denmark Vesey's conspiracy (1822) and Nat Turner's rebellion (1831). France's failure to reconquer Saint-Domingue helped persuade Napoleon to sell Louisiana in 1803, opening lands that would become part of the cotton kingdom. The Indian Removal Act of 1830 cleared Native nations from the land, and economic historians link its passage to land interests and slavery. Through a domestic trade often called a "second Middle Passage", about one million enslaved people were forced from the Upper South to the Deep South, breaking families apart. The enslaved population grew from about 700,000 in 1790 to almost four million in 1860. Walter Johnson's *River of Dark Dreams* (2013) places the Mississippi Valley's cotton kingdom in this imperial, global setting. Haiti meanwhile carried antislavery outward, as Pétion's republic aided Simón Bolívar, but paid dearly for its freedom: France demanded an indemnity of 150 million francs in 1825, later reduced to 90 million in all, as Atlantic Slave Wars describes.

## Slavery within Africa

African societies had their own slaveries, which Paul Lovejoy's *Transformations in Slavery* (1983) traces alongside the effects of the external trades. Rough estimates suggest that about a third of the population was enslaved in Senegambia and among the Asante and Yoruba, and a quarter to a half in the nineteenth-century **Sokoto Caliphate**; when British rule was imposed on northern Nigeria, some 1 to 2.5 million people were enslaved in the former caliphate's lands. As the Atlantic trade closed, enslaved labour within Africa expanded into production for export, a paradox explored in Abolition and Emancipation.

## Abolitions Across the World

Abolition came piecemeal, over two centuries. Britain banned its slave trade in 1807 and passed the Slavery Abolition Act in 1833, effective in 1834, freeing about 800,000 people; slaveowners, not the enslaved, received £20 million in compensation. Slavery was prohibited in East India Company territories in 1843 and in British India under the Indian Penal Code of 1860, in force from 1862. Korea abolished *nobi* status in 1894 and China ended it by an edict of 1909, effective in 1910. In the United States the Thirteenth Amendment, ratified in December 1865, ended slavery at the close of the war whose course The American Civil War follows. Brazil was last in the Americas: Princess Isabel signed the Lei Áurea on 13 May 1888, declaring slavery "extinct in Brazil", with no compensation for owners. Mauritania became the last country to abolish slavery, by decree in 1981, but only criminalised it in 2007, and hereditary servitude persists. The full chronology, and the role of the enslaved and of abolitionists, are in Abolition and Emancipation.

## Slavery and Capitalism

The biggest historiographical debate concerns slavery's place in the rise of modern capitalism. In *Capitalism and Slavery* (1944) the Trinidadian historian **Eric Williams** argued that profits from slavery helped finance Britain's industrial revolution, that abolition followed the decline of the West Indian sugar economy and the rise of free-trade interests, and that the self-emancipation of the enslaved helped end the system. Seymour Drescher, his leading critic, still called the book a classic, and David Brion Davis wrote that Williams's decline thesis had been "wholly discredited by other scholars". In the Caribbean, however, as Hilary Beckles noted, it continues to enjoy fundamental academic respect, and Ryden (2009) finds support for the profitability crisis Williams described.

The debate revived with the "new history of capitalism". In *The Half Has Never Been Told* (2014) **Edward Baptist** argued that rising cotton-picking productivity was driven by torture and that slavery was central to American capitalism; Sven Beckert's *Empire of Cotton* (2014) made a global case, and historians of capitalism link cotton slavery to credit and finance. Eric Foner and Daina Ramey Berry praised Baptist's book; economic historians did not. Alan Olmstead called Baptist's study "flawed beyond repair", attributing productivity gains mainly to better cotton seed, and Eric Hilt judged its economic analysis badly flawed. Walter Johnson, for his part, rejects the "new history of capitalism" label and places himself in the tradition of W. E. B. Du Bois.

```checkpoint
q: What did Dale Tomich mean by the "second slavery"?
a: The revival of slavery in Europe after the fall of Rome.
x: Tomich's concept concerns the nineteenth-century Americas.
a*: New nineteenth-century zones of mass slave production, cotton in the US South, sugar in Cuba and coffee in Brazil, tied to industrialisation.
a: The enslavement of Europeans by Barbary corsairs.
x: That was a Mediterranean trade of the sixteenth to eighteenth centuries.
a: The serfdom that spread in eastern Europe in the early modern period.
x: That is the "second serfdom", a different concept.
hint: Think of cotton, sugar and coffee after 1800.
why: Tomich's term insists that nineteenth-century slavery was remade by industrial capitalism, not a relic of the past.
---
q: Which statement best describes the reception of Eric Williams's Capitalism and Slavery?
a: It was immediately accepted by all British historians.
x: British publishers at first refused to publish it, and critics such as Drescher challenged it.
a: It was forgotten until Edward Baptist rediscovered it in 2014.
x: The book was influential long before 2014; Drescher called it a classic in 1987.
a: It argued that abolition was purely the work of British humanitarians.
x: Williams stressed economic decline and the self-emancipation of the enslaved.
a*: Critics such as Drescher and Davis rejected its central claims, but it remains highly respected among Caribbean historians.
hint: Compare Davis's verdict with Hilary Beckles's.
why: The Williams thesis divides historians to this day, and the debate has revived with the new history of capitalism.
```

## Afterlives

Emancipation did not bring equality. In the American South **sharecropping** spread during Reconstruction, and the crop-lien system kept many in debt. The Thirteenth Amendment itself left an exception:

```quote
Neither slavery nor involuntary servitude, except as a punishment for crime whereof the party shall have been duly convicted, shall exist within the United States, or any place subject to their jurisdiction.
Thirteenth Amendment to the United States Constitution · Section 1 · 1865
```

Black Codes and vagrancy laws fed **convict leasing**, which fell mostly on Black men and which Douglas A. Blackmon's *Slavery by Another Name* describes as a distinct form of bondage; it was phased out only after 1941. Jim Crow segregation, upheld in *Plessy v. Ferguson* (1896), was largely overturned only by the Civil Rights Act of 1964 and the Voting Rights Act of 1965, as Modern American History: the United States in the Twentieth Century describes.

## Reparations

Demands for repair have grown. The Caribbean Community (CARICOM) created a Reparations Commission in 2013 and in 2014 approved a ten-point plan seeking, in general terms, a formal apology, development and education programmes, help with public health, cultural institutions and debt cancellation. A report by the Brattle Group, prepared for a 2023 symposium of the University of the West Indies and the American Society of International Law, estimated reparations for transatlantic chattel slavery across 31 countries at more than \$100 trillion (\$100–131 trillion); no government has accepted it. The Netherlands apologised in 2022 and 2023, with an education fund but no compensation. In the United States Ta-Nehisi Coates's "The Case for Reparations" (2014) revived the debate. Critics question liability across generations.

## Modern Slavery

Legal abolition did not end coercion. In estimates published in 2022, the ILO, Walk Free and the IOM reckoned that in 2021 some 49.6 million people were in **modern slavery** on any given day: 27.6 million in forced labour and 22 million in forced marriage, more than 12 million of them children. The UN's Palermo Protocol (2000) provides the main international definition of trafficking. The term itself is debated. Julia O'Connell Davidson argues that "modern slavery" blurs distinct abuses of labour, debt, marriage and migration and can serve immigration control; her critics reply that she defines slavery out of existence. Methodologists have criticised the Global Slavery Index for extrapolating from surveyed countries to others. The debate returns to this chapter's first question: what slavery is.

## Further exploration

- **Orlando Patterson, *Slavery and Social Death: A Comparative Study* (1982).** The classic comparative definition of slavery as domination, natal alienation and dishonour.
- **Paul E. Lovejoy, *Transformations in Slavery: A History of Slavery in Africa* (1983; 3rd ed. 2011).** Slavery within Africa and the effects of the external trades.
- **Andrés Reséndez, *The Other Slavery: The Uncovered Story of Indian Enslavement in America* (2016).** Indigenous enslavement from Columbus to the twentieth century; winner of the Bancroft Prize.
- **Eric Williams, *Capitalism and Slavery* (1944).** The Trinidadian historian's foundational argument linking slavery, industrialisation and abolition.
- **Edward E. Baptist, *The Half Has Never Been Told: Slavery and the Making of American Capitalism* (2014).** The cotton kingdom and US capitalism; read alongside its critics.
- **Ada Ferrer, *Freedom's Mirror: Cuba and Haiti in the Age of Revolution* (2014).** The Haitian Revolution and the rise of Cuba's second slavery.
- **Walter Johnson, *River of Dark Dreams: Slavery and Empire in the Cotton Kingdom* (2013).** The Mississippi Valley's cotton economy in global and imperial context.$mn_slavery_master$,
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
  select $mn_slavery_quiz$[
    {"type": "mcq", "prompt": "How did Orlando Patterson define slavery in Slavery and Social Death (1982)?", "options": ["As the ownership of one person by another as property, and nothing more", "As the permanent, violent domination of natally alienated and generally dishonored persons", "As any form of unpaid labour", "As a system found only in the Atlantic world"], "answerIndex": 1, "explanation": "Patterson deliberately did not define slavery primarily as property; he stressed domination, natal alienation and dishonour, which he called 'social death'.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Brazilian Lei Áurea of 13 May 1888 do?", "options": ["It banned only the import of new slaves", "It freed the children of enslaved mothers", "It compensated slaveowners for their losses", "It declared slavery extinct in Brazil, with no compensation for owners"], "answerIndex": 3, "explanation": "Signed by Princess Isabel, it made Brazil the last country in the Americas to abolish slavery.", "id": "q2"},
    {"type": "mcq", "prompt": "Which country was the last to abolish slavery, by presidential decree in 1981, and criminalised it only in 2007?", "options": ["Mauritania", "Brazil", "Korea", "China"], "answerIndex": 0, "explanation": "Mauritania's 1981 decree carried no criminal law; a 2007 law allowed slaveholders to be prosecuted, and hereditary servitude persists.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the ILO, Walk Free and IOM estimates published in 2022, how many people were in modern slavery on any given day in 2021?", "options": ["About 4 million", "About 12.5 million", "About 49.6 million", "About 150 million"], "answerIndex": 2, "explanation": "The estimate comprised 27.6 million in forced labour and 22 million in forced marriage; critics question the breadth of the term and the methods behind such figures.", "id": "q4"},
    {"type": "open", "prompt": "Compare Orlando Patterson's and Moses Finley's approaches to defining and classifying slavery, and assess their critics.", "rubric": "A strong answer explains Patterson's definition (permanent, violent domination; natal alienation; dishonour; social death; his decision not to start from property) and Vincent Brown's critique that social death can erase the enslaved's own lives, with Patterson's 2018 reply calling it a slaveholder ideology; explains Finley's distinction between societies with slaves and slave societies and his five genuine slave societies (classical Greece, Roman Italy, the US South, the Caribbean, Brazil); and notes critics who add cases such as the Sokoto Caliphate (Lenski) and premodern Korea (Palais).", "id": "q5"},
    {"type": "open", "prompt": "How have historians debated the relationship between slavery and capitalism, from Eric Williams to the 'new history of capitalism'?", "rubric": "A strong answer sets out Williams's Capitalism and Slavery (1944): slave profits helped finance British industrialisation, abolition followed West Indian decline and free-trade interests, and the self-emancipation of the enslaved mattered; notes Drescher's and Davis's criticism alongside continuing Caribbean support (Beckles) and Ryden; explains Tomich's 'second slavery' (cotton, Cuban sugar, Brazilian coffee); presents Baptist's argument about torture and cotton productivity, Beckert's global case and Johnson's position, and the economic historians' replies (Olmstead's 'flawed beyond repair', seed varieties; Hilt).", "id": "q6"}
  ]$mn_slavery_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/slavery', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
