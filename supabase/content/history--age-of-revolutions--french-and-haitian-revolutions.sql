-- French and Haitian Revolutions — canonical master article, co-written and human-reviewed.
-- history/age-of-revolutions/french-and-haitian-revolutions @ research/advanced/read.
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
    'history/age-of-revolutions/french-and-haitian-revolutions',
    'research',
    'advanced',
    'read',
    $ar_frhai_master$> **Two revolutions, one Atlantic world.** In 1789 the French declared that "men are born and remain free and equal in rights", then spent years arguing about whether that sentence applied to women, to the poor, and to the half a million enslaved Africans in France's richest colony, Saint-Domingue. The enslaved settled the argument themselves. Their uprising of 1791 forced the French Republic to abolish slavery in 1794, defeated Napoleon's attempt to restore it, and in 1804 created Haiti, the first independent state in the Americas founded by people who had freed themselves from slavery. This chapter follows both revolutions and the ways each exposed the other's limits, from the Estates-General to the Terror, from the northern plain of Saint-Domingue to Haiti's independence, and the crushing indemnity France imposed on Haiti in 1825.

## A Kingdom in Debt

France had helped the United States win independence, and paid for that war mainly with loans. By 1788 half of the monarchy's revenue went on servicing its debt. The debt itself was not unusually large compared with Britain's; the deeper problem was a tax system riddled with exemptions and unevenly collected. When finance ministers proposed a universal land tax in 1786–1787, an Assembly of Notables and then the law courts, the *parlements*, refused, insisting that only an **Estates-General**, a national assembly of the three orders of clergy, nobility, and commoners, could approve new taxes. None had met since 1614.

The Estates-General opened at Versailles on 5 May 1789. Its 1,200 or so deputies brought grievance lists, the *cahiers de doléances*, drawn up across the country. The Third Estate, representing roughly 98 per cent of some 28 million people, had been given double representation, but the courts ruled that voting would be by order, so clergy and nobility could outvote it. The abbé **Sieyès** had asked in a famous pamphlet *What Is the Third Estate?*, and answered that it was the nation. On 17 June 1789 the Third Estate declared itself the **National Assembly**. Locked out of their hall three days later, the deputies met in an indoor tennis court and swore not to separate until France had a constitution; of 577 present, only one refused.

## 1789: The Revolution Takes Shape

When Louis XVI dismissed his popular minister Necker on 11 July, Parisians feared a royal coup. On 14 July a crowd joined by soldiers stormed the **Bastille**, a royal fortress with large stores of arms. Eighty-three attackers died; the governor was killed and his head paraded on a pike. The fortress held only seven prisoners, but it was a potent symbol of arbitrary royal power, and 14 July is France's national day.

In the countryside a panic known as the **Great Fear** spread from late July, fed by rumours of an aristocratic plot to starve the people. Peasants attacked manor houses above all to burn the documents recording their feudal dues. The historian Georges Lefebvre, who studied the Fear in detail, concluded that the peasants did not need the Revolution to rise; when the panic came they were already moving. On the night of **4 August 1789**, the Assembly responded by declaring that it "abolishes the feudal system entirely", and decrees over the following week cancelled church tithes and established equality before the law.

On 26 August the Assembly adopted the **Declaration of the Rights of Man and of the Citizen**. Lafayette drafted it, consulting Thomas Jefferson.

```quote
Men are born and remain free and equal in rights. Social distinctions may be founded only upon the general good.
Declaration of the Rights of Man and of the Citizen · Article I · 26 August 1789
```

Its limits appeared at once. Delegates for colonial landowners persuaded the Assembly that its principles should not apply in the colonies, and the planters and merchants of the Club de Massiac organised against the abolitionist Society of the Friends of the Blacks. The constitution of 1791 gave the vote only to men over 25 who paid a certain level of tax. In October 1789 thousands of Parisian market women, angry at the price of bread, marched to Versailles and brought the royal family back to Paris. The playwright **Olympe de Gouges**, one of France's earliest public opponents of slavery, answered the Assembly in 1791 with a *Declaration of the Rights of Woman and of the Female Citizen*: if a woman had the right to mount the scaffold, she wrote, she must equally have the right to mount the speaker's platform. She was guillotined in 1793.

## From Monarchy to Republic

The Revolution divided France over religion. The **Civil Constitution of the Clergy** of 1790 made priests elected state employees; when they were required to swear loyalty to it, the majority refused, and the Pope condemned it. In June 1791 the royal family fled Paris in disguise, but the king was recognised and arrested at **Varennes**, and trust in him collapsed.

War with Austria and Prussia began in April 1792 and went badly. On 10 August 1792 Parisian National Guards and volunteers stormed the Tuileries palace, and the monarchy was suspended; in the September Massacres that followed, crowds killed between 1,100 and 1,600 prisoners in Paris, most of them common criminals. After a victory at Valmy, the new Convention proclaimed the **First Republic** in September 1792 and began a new calendar, with 1792 as Year One. Louis XVI was tried, condemned by a narrow vote, and guillotined on 21 January 1793.

## The Terror

Facing foreign war, rebellion, and economic crisis, the Republic created a Revolutionary Tribunal and a **Committee of Public Safety**, dominated from mid-1793 by the Jacobins around **Maximilien Robespierre**. The Law of Suspects of September 1793 allowed the arrest of anyone thought hostile to the Revolution. Between September 1793 and July 1794 some 300,000 people were arrested and about 16,600 were officially executed after trial, while many thousands more were killed without trial or died in prison; estimates of these range from 10,000 to 40,000. In February 1794 Robespierre defended terror as "nothing more than speedy, severe and inflexible justice", an emanation of virtue.

The worst violence came in the **Vendée**, in western France, where a rebellion against conscription and the treatment of the Church broke out in March 1793. Republican forces crushed it with mass drownings in the Loire at Nantes and "infernal columns" that killed tens of thousands of civilians. Estimates of the total dead in the war range from about 117,000 to 450,000. Some writers have called it genocide; most specialists reject that label while acknowledging massacres on an extraordinary scale.

On **9 Thermidor** (27 July 1794) Robespierre's enemies in the Convention had him arrested, and he was executed the next day. A more moderate regime, the **Directory**, governed from 1795, amid inflation, hunger, revenge killings, and plots from left and right, until General **Napoleon Bonaparte** seized power in the coup of 18 Brumaire (9 November 1799). Most historians treat that coup as the end of the Revolution.

## Saint-Domingue: The Richest Colony

On the eve of the Revolution, French colonies held about 700,000 enslaved people, about half a million of them in **Saint-Domingue**, the western third of the island of Hispaniola. Colonial products made up about a third of France's exports. Saint-Domingue's plantations produced, by one estimate, around 60 per cent of the world's coffee. Because deaths exceeded births on the plantations, the colony depended on constant imports: about 20,000 enslaved Africans arrived in 1787 alone, and most of the enslaved had been born in Africa, the largest group from the region of Kongo.

Colonial society was sharply divided. About 40,000 whites were split between rich planters and poorer artisans and overseers. Around 28,000 free people of colour, many educated and some themselves owners of plantations and enslaved people, faced laws that barred them from many offices and professions. Resistance among the enslaved had a long history: in the 1750s the maroon leader **François Mackandal** organised resistance and was burned at the stake in 1758.

## The Rising of 1791

The Revolution in France reached Saint-Domingue first as a struggle over the rights of free people of colour. Two of their leaders, **Julien Raimond** and **Vincent Ogé**, lobbied in Paris; both owned enslaved people and did not seek abolition. When the colonial authorities refused to grant those rights, Ogé led an armed rising in October 1790. He was captured, broken on the wheel, and beheaded in February 1791.

Then the enslaved rose. In August 1791 elite enslaved men, drivers and coachmen, met to plan a revolt, and on the night of 22–23 August 1791 the plantations of the northern plain began to burn. Within weeks some 100,000 people had joined, and in two months, by contemporary counts, about 4,000 whites had been killed and hundreds of plantations destroyed; white militias killed many thousands of Black people in reprisal. Haitian tradition holds that the rising was launched at a Vodou ceremony at **Bois Caïman**, led by Dutty Boukman. Historians debate it: the earliest written account comes from a hostile colonist, Boukman is first named in print only in 1843, and some scholars call the ceremony a myth, while others accept that it happened but doubt details of the traditional story. Many rebel leaders at first claimed to be fighting for the King of France.

## Abolition, 1793–1794

In 1793 Britain and Spain went to war with the French Republic, and both hoped to seize Saint-Domingue. The French commissioner **Léger-Félicité Sonthonax**, a member of the Friends of the Blacks, needed soldiers. He first freed enslaved men who would fight for the Republic, then on 29 August 1793 proclaimed emancipation in the north; his colleague Polverel extended it to the west and south. Their motives were largely strategic, to keep the colony from Britain and Spain.

Three deputies from Saint-Domingue, a white colonist, Louis Dufay; a Black officer, **Jean-Baptiste Belley**; and a free man of colour, Jean-Baptiste Mills, then took their seats in the Convention in Paris. On **4 February 1794** (16 Pluviôse Year II), the Convention decreed that slavery was abolished in all French colonies and that all men living there, without distinction of colour, were French citizens. Freedom on the ground was limited: freed people were often bound to plantations by labour rules, and the decree was never applied in Martinique, which Britain occupied, or in France's Indian Ocean colonies, which refused it.

```checkpoint
q: Why did the French Republic abolish slavery in its colonies in February 1794?
a*: Because the uprising of the enslaved in Saint-Domingue and the war with Britain and Spain led commissioners to free the enslaved, and the Convention then extended abolition to all colonies.
a: Because the Declaration of the Rights of Man of 1789 had already abolished slavery.
x: The Assembly accepted in 1789 that the Declaration would not apply in the colonies.
a: Because Napoleon ordered it.
x: Napoleon came to power only in 1799, and in 1802 he moved to restore slavery.
a: Because the planters of the Club de Massiac requested it.
x: The Club de Massiac was the planters' lobby against abolition.
hint: Think of what happened in Saint-Domingue from August 1791.
why: Abolition came from the actions of the enslaved and the pressures of war as much as from revolutionary principle.
---
q: What did Olympe de Gouges argue in her Declaration of the Rights of Woman (1791)?
a: That women should not take part in politics.
x: She argued the opposite: that women deserved the same rights as men.
a: That the monarchy should be abolished immediately.
x: She opposed the execution of Louis XVI and dedicated her declaration to the queen.
a*: That women deserved equal rights; if they could mount the scaffold, they should also be able to mount the speaker's platform.
a: That slavery should be extended to new colonies.
x: She was one of France's earliest public opponents of slavery.
hint: Think of the scaffold and the platform.
why: De Gouges exposed the gap between the Revolution's universal language and its exclusion of women.
```

## Toussaint Louverture

The man who came to lead the revolution, **Toussaint Louverture**, was born around 1743 on the Bréda plantation. Historians long believed, as C. L. R. James did in 1938, that he was enslaved until 1791. In fact he had been freed in the 1770s, and before the revolution he owned land and enslaved people himself. In August 1793 he announced himself to the colony: "I want Liberty and Equality to reign in St. Domingue." He fought at first with the Spanish, then in May 1794 switched to the French Republic, which had now abolished slavery. Over the following years he fought the British, who withdrew in 1798, defeated his rival André Rigaud, and in 1801 occupied Spanish Santo Domingo, freeing its slaves.

His constitution of 1801 declared that slavery was "forever abolished" in Saint-Domingue and that "all men are born, live and die free and French". It also made him governor for life, kept the colony French, and bound the formerly enslaved to work on the plantations, a system his nephew Moïse rebelled against and Toussaint repressed.

{{image: Toussaint Louverture | A portrait of Toussaint Louverture, leader of the Haitian Revolution.}}

## Napoleon's War and Haitian Independence

Napoleon resolved to restore French control. In December 1801 he sent his brother-in-law **Leclerc** with an expedition that eventually numbered about 31,000 soldiers. Toussaint came to terms in May 1802, but in June he was seized by trickery and deported to France. As he boarded the ship, he declared: "In overthrowing me you have cut down in Saint Domingue only the trunk of the tree of liberty; it will spring up again from the roots, for they are numerous and they are deep." He died in a prison in the Jura mountains in April 1803.

A law of May 1802 maintained slavery in the colonies where the 1794 abolition had never been applied, such as Martinique, and in July 1802 Napoleon decreed its restoration in Guadeloupe, where the officer **Louis Delgrès** and his followers blew themselves up rather than surrender. When Saint-Domingue's people saw that France meant to re-enslave them, they rose again, and in October 1802 the Black and mixed-race generals **Dessalines**, Christophe, and Pétion deserted the French. Yellow fever devastated the French army; Leclerc himself died of it, and of the 31,000 men sent only 7,000 to 8,000 survived. After their defeat at **Vertières** in November 1803, the French evacuated.

On **1 January 1804**, at Gonaïves, Jean-Jacques Dessalines, born into slavery, declared independence and gave the country an Indigenous Taíno name, **Haiti**. It was the first independent nation of Latin America and the Caribbean, and the second in the Americas after the United States. In the following months, on Dessalines's orders, 3,000 to 5,000 of the remaining French white civilians were killed, a massacre some historians, such as Philippe Girard, call genocide, and which others explain by fear of a French return and re-enslavement. Dessalines crowned himself emperor in October 1804; the new state's constitution of 1805 declared all citizens "Black" and barred whites from owning land.

## The Price of Recognition

France did not accept Haiti's independence. In July 1825 a French squadron of warships arrived at Port-au-Prince with an ordinance from King Charles X: France would recognise Haiti in return for **150 million francs**, payable in five instalments, to compensate the former colonists, plus a halving of duties on French goods. President Jean-Pierre Boyer accepted to avoid invasion. The first instalment alone was about six times Haiti's annual revenue, and Haiti borrowed it from a French bank, creating a "double debt". In 1838 France reduced the total to 90 million francs. Haiti made its final indemnity payments in the 1880s, but loans taken to pay it were only paid off in 1947.

A 2022 investigation by the *New York Times* estimated that Haiti paid about 112 million francs in all, around 560 million dollars in today's money, and, with fifteen economists, that the lost growth over two centuries could amount to between 21 and 115 billion dollars, a model-based estimate. The French president François Hollande called it "the ransom of independence". The United States, wary of a nation founded by a slave revolt, did not recognise Haiti until 1862.

## Echoes Across the Atlantic

The revolutions in France and Haiti, the critic Edward Said wrote of C. L. R. James's account, "criss-cross and answer each other like voices in a fugue". The Haitian example terrified slaveholders. Refugees from Saint-Domingue fled with enslaved people to Philadelphia, Charleston, and New Orleans; Thomas Jefferson, himself a slaveholder, refused diplomatic relations with Haiti. Planned or actual slave rebellions followed in Virginia in 1800, Louisiana in 1811, and Cuba in 1812, where sugar slavery expanded to replace Haiti's lost output. Haiti also sheltered and armed revolutionaries: President Alexandre Pétion gave Simón Bolívar refuge, arms, and men in 1815–1816, asking in return that he abolish slavery in the lands he freed, as the chapter on Latin American independence describes.

The Haitian anthropologist Michel-Rolph Trouillot argued that Western observers found the Haitian Revolution literally unthinkable, a revolution of enslaved Africans that did not fit their categories, and so it was long silenced in Western histories that celebrated 1789.

## Interpreting the Revolutions

Historians have read the French Revolution in very different ways. Marxist historians such as Georges Lefebvre and Albert Soboul saw a bourgeois revolution driven by class conflict, with a popular movement of Parisian *sans-culottes* and a Terror forced by war and counter-revolution. **François Furet**, leader of the "revisionist" school, argued in 1978 that the Revolution was above all a political and ideological event, and that revolutionary ideology itself drove the Terror. Since then, historians such as **Lynn Hunt** have turned to political culture, gender, the provinces, and the colonies.

The Haitian Revolution has been reinterpreted too. C. L. R. James's *The Black Jacobins* (1938) placed it at the heart of the age of revolution and argued that the enslaved took revolutionary ideals more seriously than the French. More recent historians, such as Laurent Dubois and Sudhir Hazareesingh, stress the independent agency of the enslaved, many of them African-born, and the African, Caribbean, and European traditions they drew on.

```checkpoint
q: What was the 1825 indemnity?
a: A payment by France to Haiti to compensate for slavery.
x: It was the reverse: Haiti was made to pay France.
a*: A payment of 150 million francs demanded by France, backed by warships, in return for recognising Haiti's independence, to compensate the former colonists.
a: A loan from the United States to rebuild Haiti.
x: The United States did not recognise Haiti until 1862.
a: A tax Toussaint Louverture imposed on French merchants.
x: Toussaint died in 1803; the indemnity was imposed by Charles X in 1825.
hint: Think of the "ransom of independence".
why: The indemnity forced the formerly enslaved to pay for their own freedom and weighed on Haiti's economy for over a century.
---
q: Why did Michel-Rolph Trouillot call the Haitian Revolution "unthinkable"?
a: Because it never really happened.
x: Trouillot's point was that it happened but did not fit Western categories.
a: Because it was planned in secret.
x: The term refers to how observers understood it, not to secrecy.
a: Because it was led by Napoleon.
x: Napoleon fought against the Haitian Revolution.
a*: Because Western observers could not conceive of enslaved Africans making a successful revolution, so it was long silenced in Western histories.
hint: Think of silences in the writing of history.
why: Trouillot showed how power shapes which events enter history.
```

## Further exploration

- **C. L. R. James, *The Black Jacobins: Toussaint L'Ouverture and the San Domingo Revolution* (1938).** The classic anticolonial history linking Paris and Saint-Domingue.
- **Laurent Dubois, *Avengers of the New World: The Story of the Haitian Revolution* (2004).** The standard modern narrative.
- **Sudhir Hazareesingh, *Black Spartacus: The Epic Life of Toussaint Louverture* (2020).** A prize-winning biography.
- **Michel-Rolph Trouillot, *Silencing the Past: Power and the Production of History* (1995).** Why the Haitian Revolution was silenced.
- **Lynn Hunt, *Inventing Human Rights: A History* (2007).** How rights came to seem self-evident.
- **François Furet, *Interpreting the French Revolution* (1978; English trans. 1981).** The revisionist challenge.
- **Albert Soboul, *The Parisian Sans-Culottes and the French Revolution, 1793–4* (1958; English trans. 1964).** The Marxist classic of popular revolution.$ar_frhai_master$,
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
  select $ar_frhai_quiz$[
    {"type": "mcq", "prompt": "What did the National Assembly declare on the night of 4 August 1789?", "options": ["That France was a republic", "That it abolished the feudal system entirely", "That slavery was abolished in the colonies", "That the king was deposed"], "answerIndex": 1, "explanation": "The August Decrees cancelled feudal dues and tithes and established equality before the law.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in Saint-Domingue on the night of 22–23 August 1791?", "options": ["The great uprising of the enslaved began on the northern plain", "Toussaint Louverture declared independence", "Napoleon's army landed at Le Cap", "Vincent Ogé was executed"], "answerIndex": 0, "explanation": "Within weeks some 100,000 people had joined the revolt.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Convention decree on 4 February 1794 (16 Pluviôse Year II)?", "options": ["The execution of Louis XVI", "The Law of Suspects", "The recognition of Haitian independence", "The abolition of slavery in all French colonies, with citizenship for all men there"], "answerIndex": 3, "explanation": "The decree followed emancipation proclaimed in Saint-Domingue by Sonthonax and Polverel in 1793.", "id": "q3"},
    {"type": "mcq", "prompt": "How much did France demand from Haiti in 1825 in return for recognising its independence?", "options": ["15 million francs", "1.5 billion francs", "150 million francs", "Nothing, recognition was unconditional"], "answerIndex": 2, "explanation": "The total was reduced to 90 million francs in 1838; loans taken to pay it were cleared only in 1947.", "id": "q4"},
    {"type": "open", "prompt": "How did the French and Haitian revolutions expose each other's contradictions?", "rubric": "A strong answer explains the universal language of the 1789 Declaration and its exclusion of the colonies, the Club de Massiac and the Friends of the Blacks, the campaign of the free people of colour (Raimond, Ogé), the 1791 uprising and its role in forcing the abolitions of 1793–1794, Toussaint's constitution and its limits, Napoleon's restoration of slavery and the war of 1802–1803, and independence in 1804; it may draw on James, Said's 'fugue', Trouillot, and Dubois.", "id": "q5"},
    {"type": "open", "prompt": "Assess the competing interpretations of the French Revolution.", "rubric": "A strong answer contrasts the Marxist reading (Lefebvre, Soboul: class conflict, sans-culottes, a Terror forced by war) with Furet's revisionism (politics and ideology driving the Terror), mentions later approaches (Hunt's political culture, gender, regions, colonies), and uses evidence such as the Great Fear, 4 August, the Terror's scale, and the Vendée.", "id": "q6"}
  ]$ar_frhai_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions/french-and-haitian-revolutions', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
