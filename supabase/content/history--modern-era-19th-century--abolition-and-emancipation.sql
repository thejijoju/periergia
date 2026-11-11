-- Abolition and Emancipation — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/abolition-and-emancipation @ research/advanced/read.
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
    'history/modern-era-19th-century/abolition-and-emancipation',
    'research',
    'advanced',
    'read',
    $mn_abol_master$> **The century that ended legal bondage.** Between the British ban on the slave trade in 1807 and the abolition of slavery in Brazil in 1888, legal slavery was ended across the Americas, and serfdom in Russia; in Africa, the Ottoman world and the Indian Ocean, the process stretched into the twentieth century. This chapter follows the British, French, Dutch, American, Spanish and Brazilian emancipations, the freeing of Russia's serfs, and abolition in Africa and the Islamic world. It asks what freedom meant under apprenticeship and the new indentured labour that carried Indians and Chinese across the world, and it centres the enslaved themselves, whose risings, strikes and mass flight repeatedly forced governments to move faster than they intended.

## An Age of Abolitions

The chapter on the Atlantic slave trade describes how the trade carried Africans to the Americas, and the debate begun by Eric Williams about whether profit or principle ended the trade. The chapter on Atlantic slave wars tells the story of resistance from maroon communities to the Haitian Revolution, and the chapter on the French and Haitian revolutions shows how the enslaved of Saint-Domingue won the first abolition in 1794 and founded Haiti in 1804. This chapter picks up the story in the nineteenth century, when abolition became a law in one country after another.

The dates make a long, uneven line: Haiti 1804; Chile 1823; Mexico 1829; the British Empire 1833–1838; Tunisia 1846; France and Denmark 1848; Argentina 1853; Peru and Venezuela 1854; Russia's serfs 1861; the Netherlands 1863; the United States 1865; Puerto Rico 1873; Cuba 1886; Brazil 1888.

Three patterns recur. Abolition was usually gradual and hedged, with transitions designed to keep the formerly enslaved working for their old owners. Owners were frequently compensated, and the enslaved never were. And the pace was again and again set from below, by people who refused to wait.

## Britain: Ending the Trade

British abolitionism was a mass movement. The Society for the Abolition of the Slave Trade was founded in 1787 by nine Quakers and three Anglicans, among them **Thomas Clarkson**, while **William Wilberforce** led the campaign in Parliament. Hundreds of petitions in 1792 carried some 400,000 signatures, and those of 1814 about 1.375 million.

Parliament moved slowly: a motion of 1791 was defeated, and one of 1792 was made "gradual" and stalled in the Lords. The **Slave Trade Act** finally passed under Lord Grenville's "Ministry of All the Talents": the Commons voted 283 to 16 on 23 February 1807, and the Act came into force on 1 May. It fined traders up to £100 for each enslaved person found aboard, but it freed no one already enslaved. Britain then paid Portugal and Spain to restrict their trades, bans that smugglers widely ignored.

## The West Africa Squadron

From 1808 the Royal Navy's **West Africa Squadron** patrolled the African coast. By 1860 it had seized about 1,600 slave ships and freed about 150,000 Africans, yet it caught only about 6 per cent of transatlantic slavers, and almost 1,600 of its sailors died between 1830 and 1865, mostly of disease. It also depended on African labour, notably Kru sailors; by one estimate African and diaspora sailors made up a fifth of its crews.

Courts at Freetown in Sierra Leone emancipated more than 80,000 "liberated Africans" between 1808 and 1871. Historians disagree about its meaning. The political scientists Chaim Kaufmann and Robert Pape count Britain's sixty-year campaign against the slave trade among the most costly moral actions any state has undertaken; others call it "unfit and inadequate", and Howard W. French argues that its impact has been overstated as a prop for a flattering image of British history.

## The Rebels Who Forced the Pace

Abolishing the trade did not free anyone, and British abolitionists in the 1820s still talked of gradual change. Enslaved people in the colonies did not accept the wait. The risings in Demerara and Jamaica are told in the chapter on Atlantic slave wars; here what matters is how they pushed Britain towards emancipation.

In **Demerara** (now Guyana) in August 1823, between 9,000 and 12,000 enslaved people rose, believing that Parliament had abolished slavery and that the planters were withholding it. They were led by **Jack Gladstone** and his father **Quamina**, a deacon in the missionary John Smith's church, and the rising was largely nonviolent. Jack was enslaved on the "Success" plantation, owned by John Gladstone (later Sir John), father of the future prime minister William Gladstone. Hundreds were killed in the suppression and dozens executed. Smith died in jail under sentence of death, and the news strengthened the abolitionist movement in Britain.

In **Jamaica** at Christmas 1831, up to 60,000 of the island's 300,000 enslaved people joined the **Baptist War**, led by the Baptist deacon **Samuel Sharpe**. It was planned as a peaceful general strike demanding wages of half the going rate. Fourteen whites were killed; about 500 rebels were killed, and an estimated 310 to 340 were executed afterwards. The historian Gelien Matthews argues that these revolts reshaped British abolitionism, pushing it from the gradualist view that the enslaved were "not fit for freedom" towards immediate emancipation; the brutality of the reprisals, reported by missionaries such as William Knibb, is widely seen as hastening the 1833 Act. *The History of Mary Prince* (1831) was the first account of a Black enslaved woman's life published in Britain, and the Quaker **Elizabeth Heyrick** had demanded *Immediate, Not Gradual Abolition* in 1824.

## 1833: Freedom with Conditions

The **Slavery Abolition Act** passed under Earl Grey's government, its second reading in the Commons unopposed a week before Wilberforce died, and came into force on 1 August 1834. It freed about 800,000 people, most of them in the West Indies, with some 66,000 in Mauritius and about 40,000 at the Cape, but excluded the territories of the East India Company.

Freedom came with conditions. Children under six were freed at once; everyone else became an "apprentice", obliged to work up to 45 hours a week unpaid for their former owners, field workers until 1840 and others until 1838. Only Antigua and Bermuda chose full freedom in 1834. On the first day of the new system, in Port of Spain, Trinidad, a crowd of mostly elderly, unarmed people drowned out the governor by chanting "Pas de six ans. Point de six ans" ("Not six years"). A renewed abolitionist campaign in Britain, which sent investigators to the colonies, ended apprenticeship early, on 1 August 1838.

The owners, meanwhile, were paid. The Act granted "the Sum of Twenty Million Pounds Sterling", about 40 per cent of the government's annual income and about 5 per cent of national output. More than 40,000 awards were made, and about half the money went to absentee owners and creditors in Britain. The largest single recipient was John Gladstone, owner of the Success plantation, who received over £100,000. The formerly enslaved received nothing. Since 2009 the Legacies of British Slavery project at University College London, led first by Nicholas Draper and Catherine Hall, has used the compensation records to identify slave-owners, to counter what they call a "selective forgetting" that remembers abolition but not slavery.

Freedom remained contested. In 1865 at **Morant Bay**, Jamaica, the Baptist preacher Paul Bogle led a rising over poverty, land, and taxes that kept most Black Jamaicans from voting; under Governor Edward Eyre's martial law soldiers killed some 439 people outright, and hundreds more were executed after summary trials.

```checkpoint
q: What did Sam Sharpe's Baptist War in Jamaica originally plan to do?
a*: Stage a peaceful general strike demanding wages of half the going rate.
a: Seize Kingston and declare an independent republic.
x: It was planned as a strike, not a bid to found a state.
a: Help the Accompong Maroons attack British forts.
x: The Accompong Maroons in fact helped to suppress the rising.
a: Flee to Haiti by sea.
x: The plan was to stay and demand wages on the estates.
hint: Think of a withdrawal of labour rather than an army.
why: The rebels claimed the rights of free workers, and the violent repression helped push Britain to abolish slavery in 1833.
---
q: How did the British Slavery Abolition Act of 1833 treat the formerly enslaved and their owners?
a: The formerly enslaved received land and the owners nothing.
x: No land was granted, and owners were paid £20 million.
a: Both groups were compensated equally.
x: The enslaved received no compensation at all.
a*: Owners received £20 million, while most of the formerly enslaved were made to work unpaid as "apprentices" until 1838.
a: Everyone was freed immediately and unconditionally on 1 August 1834.
x: Only children under six were freed at once; the rest became unpaid "apprentices".
hint: Who was paid, and who kept working?
why: Emancipation was designed to protect owners' interests, and a renewed campaign ended apprenticeship two years early.
```

## France, Denmark and the Netherlands

France had abolished slavery in 1794 and restored it under Napoleon in 1802. The man most associated with its second abolition was **Victor Schœlcher**, who had seen slavery in Mexico, Cuba and the American South and moved from gradualism to immediatism. After the revolution of February 1848 he became under-secretary for the colonies and drafted the decree of **27 April 1848**, which abolished slavery in all French colonies, granted citizenship to the freed, and called slavery "an attack on human dignity" and a violation of the republican motto "Liberty – Equality – Fraternity".

The enslaved did not wait for the decree to arrive. On 21 May 1848 in Saint-Pierre, Martinique, an enslaved man named Romain was arrested for drumming; an uprising followed, and on 23 May the governor declared abolition. Guadeloupe followed on 27 May; Réunion only in December. In all, 251,019 people were freed, from the Caribbean to Senegal and Réunion. A law of 1849 paid owners 126 million gold francs, and nothing to the freed. In French West Africa, by contrast, slavery persisted; it was formally abolished there only in 1905.

In the **Danish West Indies**, a plan for gradual abolition over twelve years provoked a revolt on St Croix, and on 3 July 1848 Governor Peter von Scholten declared immediate emancipation. The **Netherlands** abolished slavery on 1 July 1863. Owners received nearly ƒ10 million for 32,911 people in Suriname, while the freed were bound to ten years of state-supervised plantation labour, and so were not fully free until 1873. Surinamese commemorate the day as **Keti Koti**, "the chain is cut"; the Dutch prime minister apologised for slavery in 2022, and the king in 2023, without offering compensation.

## Russia: Emancipation from Above

Russian serfdom was not slavery, but its abolition belonged to the same age and invites comparison. After defeat in the Crimean War, Tsar **Alexander II** warned the Moscow nobility in 1856 that change was coming either way.

```quote
It is better to abolish serfdom from above, than to wait for that time when it starts to abolish itself from below.
Alexander II · Speech to the Moscow nobility · 30 March 1856 (Old Style)
```

The Emancipation Manifesto of 3 March 1861 (19 February in the Russian calendar of the time) freed more than 23 million people. Household serfs received freedom but no land. Peasants received land, but landlords kept the "cut-off lands", and peasants had to pay for their allotments through redemption payments, state loans paid to the landlords, holding the land through the village commune. Redemption payments were abolished only in 1907. Russian lords were thus compensated through the peasants' own payments, as British, French and Dutch owners were by the state; the freed were compensated nowhere.

## The United States: Emancipation through War

On the eve of the Civil War almost four million people were enslaved in the United States. Emancipation began with their own feet. In May 1861 three men escaped to Union lines at Fort Monroe, and General Benjamin Butler declared them "contraband of war" rather than return them; Congress followed with Confiscation Acts in 1861 and 1862. Abraham Lincoln's **Emancipation Proclamation** of 1 January 1863, justified as a "military necessity", declared free those enslaved in the states in rebellion, more than 3.5 million people, but excluded the nearly 500,000 in the loyal border states. It also allowed Black men to enlist, and nearly 200,000, most of them formerly enslaved, served in the Union army and navy.

The **Thirteenth Amendment**, ratified in December 1865, abolished slavery and "involuntary servitude, except as a punishment for crime", an exception that later enabled convict leasing. Owners received no compensation.

The historian Manisha Sinha places Black abolitionists at the centre of the movement. **Frederick Douglass** escaped from slavery in Maryland in 1838; he published his *Narrative* in 1845 and founded the *North Star* in Rochester in 1847. Formerly enslaved women were central too, among them **Sojourner Truth** and **Harriet Tubman**, who made some thirteen missions rescuing about seventy people and guided the Combahee Ferry raid of 1863 that freed more than 700. In 1852 Douglass asked a Rochester audience:

```quote
What, to the American slave, is your 4th of July? I answer: a day that reveals to him, more than all other days in the year, the gross injustice and cruelty to which he is the constant victim.
Frederick Douglass · Speech at Corinthian Hall, Rochester · 5 July 1852
```

## The Spanish Caribbean

Spain agreed in 1817 to end the trade by 1820, but Cuba went on importing Africans until 1867. War broke the system. When Carlos Manuel de Céspedes proclaimed Cuban independence in 1868, beginning the Ten Years' War, he freed his own slaves. Spain's **Moret Law** of 1870 freed children born after 1868, the elderly and those who served in Spain's army, and the peace of 1878 freed slaves who had fought on either side. Puerto Rico abolished slavery in 1873. In Cuba a law of 1880 replaced slavery with the *patronato*, a bound transition in which *patrocinados* received small stipends and could buy their freedom; by 1886 only about 25,000 remained, and a royal decree ended it that October.

## Brazil: The Last Abolition in the Americas

Brazil received about 4.8 million of the roughly 10.7 million Africans who survived the crossing to the Americas, nearly half, more than any other country. A law of 1831 banned imports but was not enforced; only the Eusébio de Queirós Law of 1850 effectively ended the trade. The enslaved resisted throughout. In Salvador, Bahia, in January 1835, during Ramadan, about 600 enslaved and freed African Muslims, mostly Yoruba, many of them literate in Arabic, rose in the **Malê revolt**. It was betrayed, and in the aftermath many were flogged and some 200 deported to the Bight of Benin.

Abolition came by stages. The **Free Womb Law** of 1871 freed the children of enslaved mothers but bound them to serve their mothers' owners until 21; by 1884 only 118 of some 400,000 such children had been handed to the state. Meanwhile a mass movement grew, led by figures such as Joaquim Nabuco, José do Patrocínio and André Rebouças and counting some 230 abolitionist organisations, and the lawyer **Luís Gama**, himself sold into slavery as a boy, won freedom in court for hundreds of captives.

The decisive blow came from the enslaved. After 1885 thousands fled the coffee plantations of São Paulo, helped by Antônio Bento's *caifazes*, to the quilombo of Jabaquara near Santos, and the army asked not to be used to hunt fugitives. On 13 May 1888 Princess Isabel, as regent, signed the **Lei Áurea**, or Golden Law: "From the date of this law, slavery is declared extinct in Brazil." It freed the 600,000 to 700,000 people still enslaved, without compensation to owners; planters' anger helped bring down the monarchy in 1889. Brazil's Black movement today contests the image of 13 May as a gift from the princess.

{{image: Lei Áurea | The Lei Áurea of 13 May 1888, which declared slavery extinct in Brazil.}}

```checkpoint
q: What happened in Martinique in May 1848?
a: French troops landed to enforce the abolition decree against the planters' wishes.
x: The decree had not yet arrived; it was the enslaved, not troops, who acted.
a*: An uprising of the enslaved, after Romain's arrest for drumming, led the governor to declare abolition on 23 May, before the Paris decree arrived.
a: Planters voted to free the enslaved in return for compensation.
x: Compensation came later, by law in 1849, and planters did not initiate abolition.
a: Victor Schœlcher led a revolt in Saint-Pierre.
x: Schœlcher drafted the decree in Paris; the rising was by the enslaved.
hint: Who acted before the official news arrived?
why: As in Brazil in 1888, the enslaved set the timing of their own freedom.
---
q: Which statement about Brazil's abolition is accurate?
a: The Free Womb Law of 1871 freed all enslaved people immediately.
x: It freed only children of enslaved mothers, who still owed service until 21.
a: Brazil abolished slavery before Cuba.
x: Cuba ended the patronato in 1886; Brazil was last in the Americas, in 1888.
a: The law of 1831 effectively ended the slave trade to Brazil.
x: The 1831 law was not enforced; the trade effectively ended after 1850.
a*: Mass flight from São Paulo's plantations after 1885 helped force the Golden Law of 13 May 1888, which paid no compensation to owners.
hint: Think of the quilombo of Jabaquara.
why: Brazil's abolition combined a mass social movement with the self-liberation of the enslaved.
```

## Africa and the Islamic World

Abolition in Africa was slower and, at first, paradoxical. As the Atlantic trade closed, enslaved people were redirected into African plantations producing exports.

In the Ottoman Empire reform was gradual and often nominal: a decree of 1857 banned the African trade, but women were still openly sold in 1908. **Tunisia**, under Ahmed Bey, abolished slavery in 1846, one of the earliest abolitions in the Muslim world; **Egypt** abolished it in 1895. In **Zanzibar** the Frere Treaty of 1873 banned imports and a decree of 1897 removed slavery's legal status, though concubines were excluded until 1909, and only about 12,000 people applied for freedom.

Antislavery also served empire. The Brussels Conference of 1889–1890 is widely seen as lending humanitarian language to the European conquest of Africa. Yet colonial rulers were often slow to free anyone. In French Sudan (now Mali), the enslaved left in their thousands from 1905 in the **Banamba exodus**; Martin Klein argues that it was this exodus, not French policy, that destroyed slavery as a labour system there. In Northern Nigeria, Paul Lovejoy and Jan Hogendorn show, British rule removed slavery's legal status and encouraged self-purchase rather than freeing people outright; slavery was abolished only in 1936. In British India, where an estimate later made by the official Bartle Frere put the enslaved at 8 to 9 million in 1841, many were never told of the 1843 Act and slid into debt bondage.

Mauritania was the last country to abolish slavery, in 1981, and criminalised it only in 2007. Campaigners such as Biram Dah Abeid, himself descended from slaves, still challenge hereditary servitude there.

## Indenture: A New System of Slavery?

The plantations still needed labour, and the British Empire found it in India. From 1834, when the *Atlas* carried 36 labourers from Calcutta to Mauritius, until 1917, more than 1.6 million Indians were shipped under indenture to colonies from Mauritius and Natal to British Guiana, Trinidad and Fiji. Workers signed five-year contracts, known as *girmit*, and were bound by penal labour laws that made absence a crime. In 1840 the Colonial Secretary Lord John Russell hesitated to approve the scheme for fear it would become "a new system of slavery", a phrase the historian Hugh Tinker took as the title of his classic indictment in 1974.

China supplied a parallel trade. From Macau about 215,000 people were shipped between 1851 and 1874, mainly to Cuba and Peru, with deaths of up to 40 per cent on some voyages. In Cuba, some 2,000 Chinese indentured men fought for the rebels in the Ten Years' War. Indentured workers resisted through strikes and desertion. After Gopal Krishna Gokhale's resolution of 1910 ended indenture to Natal, nationalist pressure and declining profitability ended the whole system in 1917. Historians still debate whether indenture was slavery under another name or a harsh but distinct form of contract labour.

## Explaining Abolition

Why did abolition happen? The chapter on the Atlantic slave trade sets out Eric Williams's argument that British abolition followed the economic decline of the West Indies, and Seymour Drescher's reply that British slavery was still profitable, making abolition an "econocide". The debate continues: David Beck Ryden has found evidence of a profitability crisis supporting Williams, and Catherine Hall and her colleagues describe a schism between Caribbean and Anglo-American historians. Christopher Leslie Brown's *Moral Capital* argued instead that the crisis of empire around the American Revolution made antislavery a way for Britain, and individual Britons, to claim virtue. Others, such as Michael Taylor, stress how strongly the British establishment backed the West India interest until 1833.

Increasingly, historians give a central place to the enslaved. Williams himself pointed to the self-emancipation of slave rebels from Haiti to Jamaica. From Demerara to Martinique, from the contrabands of 1861 to the flight to Jabaquara and the exodus from Banamba, abolition was something people seized as well as something governments granted. Its memory remains contested, from France's 2001 law naming slavery a crime against humanity and the Dutch apologies to the Trevelyan family's 2023 reparations fund for Grenada.

## Further exploration

- **Seymour Drescher, *Abolition: A History of Slavery and Antislavery* (2009).** A global synthesis across five centuries.
- **Christopher Leslie Brown, *Moral Capital: Foundations of British Abolitionism* (2006).** How the imperial crisis of the American Revolution turned antislavery sentiment into organised action.
- **Manisha Sinha, *The Slave's Cause: A History of Abolition* (2016).** US abolition with African Americans and slave resistance at its centre.
- **Emilia Viotti da Costa, *Crowns of Glory, Tears of Blood: The Demerara Slave Rebellion of 1823* (1994).** The rebellion through the enslaved's own complaints and testimony.
- **João José Reis, *Slave Rebellion in Brazil: The Muslim Uprising of 1835 in Bahia* (1993).** The Malê revolt reconstructed from police and trial records.
- **Angela Alonso, *The Last Abolition: The Brazilian Antislavery Movement, 1868–1888* (2021).** Brazil's abolition as a social movement.
- **Hugh Tinker, *A New System of Slavery: The Export of Indian Labour Overseas 1830–1920* (1974).** The classic indictment of indenture.$mn_abol_master$,
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
  select $mn_abol_quiz$[
    {"type": "mcq", "prompt": "What were the apprentices in Port of Spain, Trinidad, protesting on 1 August 1834 when they chanted \"Pas de six ans\"?", "options": ["The six-year period of unpaid 'apprenticeship' imposed on them instead of full freedom", "A six-year delay before the slave trade would be banned", "A tax of six shillings on freed people", "Six years of military service required of freed men"], "answerIndex": 0, "explanation": "Under the 1833 Act most of the formerly enslaved had to work up to 45 hours a week unpaid; a renewed abolitionist campaign ended apprenticeship early in 1838.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Tsar Alexander II tell the Moscow nobility in 1856?", "options": ["That serfdom was essential to Russia's survival", "That serfs would receive their land free of charge", "That it was better to abolish serfdom from above than to wait for it to abolish itself from below", "That only household serfs would ever be freed"], "answerIndex": 2, "explanation": "The 1861 Manifesto freed more than 23 million people, but peasants paid redemption payments for their land until 1907.", "id": "q2"},
    {"type": "mcq", "prompt": "Which exception does the Thirteenth Amendment (1865) to the US Constitution contain?", "options": ["Slavery could continue in the border states", "Owners would be compensated by the federal government", "Indian Territory was exempt", "Involuntary servitude remained allowed as a punishment for crime"], "answerIndex": 3, "explanation": "The punishment-for-crime exception, taken from the Northwest Ordinance of 1787, later enabled convict leasing.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the historian Martin Klein, what destroyed slavery as a labour system in French Sudan (now Mali)?", "options": ["The Brussels Act of 1890", "The mass departure of enslaved people in the Banamba exodus from 1905", "The decree of 27 April 1848", "Compensation paid to slave-owners by France"], "answerIndex": 1, "explanation": "Klein argues the exodus, not French policy, ended slavery as a labour system there.", "id": "q4"},
    {"type": "open", "prompt": "How far did enslaved people themselves force the pace of abolition in the nineteenth century?", "rubric": "A strong answer uses several cases: Demerara (1823) and the Baptist War (1831–32) and their effect on British abolitionism (Matthews); the Port of Spain protest against apprenticeship; Martinique in May 1848, where an uprising brought abolition before the decree arrived; St Croix 1848; flight to Union lines and Black soldiers in the US; mass flight from São Paulo plantations before 1888; the Banamba exodus. It weighs these against parliamentary campaigns, economic explanations (Williams, Drescher) and Brown's 'moral capital', and notes that governments still shaped the terms.", "id": "q5"},
    {"type": "open", "prompt": "What did freedom mean for the formerly enslaved after legal abolition? Discuss compensation, transitional labour systems and indenture.", "rubric": "A strong answer notes that owners were compensated (Britain's £20 million, France's 126 million francs, the Dutch payments, Russian redemption payments) while the freed received nothing; describes transitional systems that kept people working (British apprenticeship to 1838, Dutch state supervision to 1873, Brazil's Free Womb Law, Cuba's patronato); discusses the 13th Amendment's exception; explains Indian and Chinese indenture and the 'new system of slavery' debate (Russell, Tinker); and may mention Morant Bay (1865) or slow abolition in colonial Africa and India.", "id": "q6"}
  ]$mn_abol_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/abolition-and-emancipation', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
