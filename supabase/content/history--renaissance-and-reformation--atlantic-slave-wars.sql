-- Atlantic Slave Wars — canonical master article, co-written and human-reviewed.
-- history/renaissance-and-reformation/atlantic-slave-wars @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The African wars that fed the trade, resistance at sea, maroons and
-- their wars, the great uprisings, the Haitian Revolution, and how
-- rebellion pushed abolition, through to Brazil in 1888.
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
    'history/renaissance-and-reformation/atlantic-slave-wars',
    'research',
    'advanced',
    'read',
    $slavewars_master$> **Atlantic slavery was made and unmade by violence.** Wars and raids in Africa produced the captives; violence and terror kept enslaved people on ships and plantations; and the enslaved fought back constantly, by running away, building free communities in the wilderness, revolting on ships, and rising up on plantations. In Saint-Domingue, between 1791 and 1804, they won the only successful slave revolution in history and founded Haiti. This chapter covers the African wars that supplied the trade, resistance at sea, maroon communities and their wars, the great uprisings from Stono to Jamaica's Baptist War, the Haitian Revolution, and how resistance pushed abolition, ending with the long road to emancipation in Brazil in 1888. It tells this history as one in which enslaved people were not passive victims waiting to be freed, but actors who shaped their own liberation.

## Wars That Fed the Trade

The Atlantic trade depended on a supply of captives, and in many parts of Africa that supply came from war. Some wars were fought for other reasons and their prisoners sold; others were driven, at least in part, by the profits of slaving and the guns that it brought.

- **Dahomey**, on the Bight of Benin, became a powerful military state in the eighteenth century, with a regular army that included a corps of women soldiers. It conducted frequent campaigns against neighbours and sold many captives to European traders, while also using enslaved labour at home.
- **Asante**, in the forests of the Gold Coast, expanded through war in the eighteenth century, controlling gold and trade and selling war captives.
- The **Kongo** kingdom was torn apart after its defeat by the Portuguese at the battle of Mbwila in 1665 by decades of civil war, which produced large numbers of captives. In this turmoil, a young Kongolese woman, **Kimpa Vita**, led a Christian religious movement seeking to restore the kingdom, before she was burned as a heretic in 1706.

Many of those who were enslaved had been soldiers, and their military experience shaped later revolts in the Americas.

## Resistance at Sea

Enslaved Africans resisted from the moment of capture. On ships, they refused to eat, jumped overboard, and organised revolts. Historians studying the Slave Voyages database estimate that roughly one voyage in ten experienced a revolt, and that resistance raised the costs of the trade, which may have reduced the number of people taken.

The most famous shipboard revolt took place in 1839, when Mende captives on the Spanish schooner ***Amistad***, led by **Sengbe Pieh**, known as Cinqué, seized the ship off Cuba. The ship was captured off Long Island by the US Navy, and after a legal battle that reached the US Supreme Court, the Africans were declared free in 1841 and some returned to Sierra Leone.

## Maroons

Enslaved people escaped from plantations throughout the Americas, and some built independent communities in mountains, forests, and swamps, known as **maroons**, from the Spanish *cimarrón*.

The largest was **Palmares**, in the interior of northeastern Brazil, which grew in the seventeenth century into a federation of settlements with perhaps thousands, and by some estimates tens of thousands, of inhabitants, who farmed, traded, and defended themselves against repeated Portuguese and Dutch expeditions for most of the century. Its last leader, **Zumbi**, was killed in 1695. The anniversary of his death, 20 November, is celebrated in Brazil as the Day of Black Consciousness.

In **Jamaica**, maroon communities fought the British in the **First Maroon War** (1728–1739). Among their leaders was **Queen Nanny** of the Windward Maroons, an Akan woman now a national hero of Jamaica, and **Cudjoe** of the Leeward Maroons. In 1739–1740 the British signed treaties recognising maroon freedom and land, in exchange for the maroons' agreement to return future runaways, a bitter compromise. In the **Second Maroon War** (1795–1796), the British defeated the maroons of Trelawny Town and deported many to Nova Scotia, from where some later went to Sierra Leone. In **Suriname**, maroon peoples such as the Saamaka won treaties in the eighteenth century and still live as distinct communities today.

```checkpoint
q: What was Palmares?
a*: A large federation of maroon settlements in northeastern Brazil, which resisted Portuguese and Dutch expeditions for most of the seventeenth century.
a: A Portuguese sugar plantation.
x: Palmares was a community of escaped enslaved people that resisted the Portuguese.
a: A slave-trading fort on the African coast.
x: Palmares was in the interior of Brazil, not Africa.
a: A Jamaican treaty.
x: The Jamaican maroon treaties were signed in 1739–1740; Palmares was in Brazil.
hint: Think of Zumbi.
why: Palmares shows how enslaved people built and defended free societies, and it remains a powerful symbol in Brazil.
---
q: Why were the British treaties with the Jamaican maroons in 1739–1740 a bitter compromise?
a: Because the maroons gave up their freedom.
x: The treaties recognised maroon freedom and land.
a: Because the British agreed to end slavery in Jamaica.
x: Slavery in Jamaica continued until 1834–1838.
a*: Because the maroons gained recognition of their freedom and land but agreed to return future runaways to the British.
a: Because the maroons were deported to Africa.
x: Deportation followed the Second Maroon War of 1795–1796, and only affected the Trelawny Town maroons.
hint: What did the maroons promise in return?
why: The treaties secured maroon freedom at the cost of turning maroons against other enslaved people, a dilemma of survival.
```

## Uprisings

Large-scale revolts broke out across the Americas:

- **Stono (1739)**, in South Carolina, the largest revolt in the British mainland colonies before the American Revolution. Some twenty enslaved people, many probably from **Kongo** and possibly Catholic soldiers, seized weapons and marched south toward Spanish Florida, which promised freedom to runaways, killing some twenty colonists before being defeated by the militia.
- **Tacky's Revolt (1760)**, in Jamaica, led by **Tacky**, an Akan man from the Gold Coast, and others known as Coromantees. It spread across the island and took months to suppress; around five hundred rebels were killed or executed.
- **Demerara (1823)**, in British Guiana, where some ten thousand or more enslaved people rose, believing that emancipation had been decreed in Britain and withheld by local officials. The revolt was crushed brutally, and a British missionary, John Smith, accused of encouraging it, died in prison, a case that outraged British public opinion.
- **The Baptist War (1831–1832)**, in Jamaica, led by **Samuel Sharpe**, a Baptist deacon, began as a planned strike and became a great rebellion involving perhaps 60,000 people. Hundreds of rebels were killed or executed; Sharpe was hanged, reportedly declaring that he would rather die on the gallows than live in slavery. The rebellion convinced many in Britain that slavery could not last.
- **The Malê revolt (1835)**, in Salvador, Brazil, was organised by enslaved and free African Muslims, many of them Yoruba and Hausa, who wrote in Arabic.

## The Haitian Revolution

The French colony of **Saint-Domingue**, the western part of Hispaniola, was in the 1780s the richest colony in the world, producing much of the world's sugar and coffee with the labour of nearly half a million enslaved people, most born in Africa.

In August 1791, after a ceremony at **Bois Caïman** traditionally associated with the Vodou priest **Dutty Boukman**, the enslaved people of the northern plain rose in revolt, burning plantations. Over the following years, amid war between France, Britain, and Spain, a former enslaved coachman, **Toussaint Louverture**, became the revolution's leading general and statesman. In 1794 revolutionary France abolished slavery in its colonies, and Toussaint, allying with France, became governor of Saint-Domingue.

In 1802 **Napoleon**, seeking to restore slavery, as he did in Guadeloupe, sent a large army under his brother-in-law, General Leclerc. Toussaint was captured by treachery and deported to France, where he died in prison in 1803. His successor **Jean-Jacques Dessalines** led the final war of independence. Black and mixed-race armies, helped by yellow fever that destroyed the French troops, defeated the French, and on **1 January 1804** Dessalines declared the independence of **Haiti**, taking the Taíno name for the island.

Haiti was the first state in the Americas to abolish slavery permanently and the first founded by formerly enslaved people. Its example inspired the enslaved and terrified slaveholders across the Americas. The world's powers isolated it: the United States refused to recognise it until 1862, and in 1825 France forced Haiti, under threat of invasion, to pay a huge indemnity of 150 million francs, later reduced to 90 million, to compensate former slaveholders for their "property", a debt that burdened Haiti's economy for more than a century. As the chapter *What is History?* described, Michel-Rolph Trouillot showed how the revolution was long "silenced" in Western histories of the Age of Revolutions.

{{image: Toussaint Louverture | A portrait of Toussaint Louverture, leader of the Haitian Revolution, the only successful slave revolution in history.}}

```checkpoint
q: Why is the Haitian Revolution historically unique?
a: Because it was the first revolution in the Americas.
x: The American Revolution came earlier, in 1775–1783.
a*: Because it was the only successful slave revolution in history, creating the first state in the Americas founded by formerly enslaved people and permanently abolishing slavery.
a: Because it was led by Napoleon.
x: Napoleon tried to suppress the revolution and restore slavery.
a: Because Haiti remained a French colony afterwards.
x: Haiti declared independence on 1 January 1804.
hint: Who led it, and what did it achieve?
why: The enslaved overthrew slavery and colonial rule together, an achievement long silenced in Western histories.
---
q: What was the 1825 indemnity France imposed on Haiti?
a: A payment by France to Haiti for the damage of war.
x: The payment went the other way, from Haiti to France.
a: A treaty recognising Haitian independence without conditions.
x: Recognition came only with the indemnity, which was a heavy condition.
a: A loan from the United States.
x: The indemnity was imposed by France; the US did not recognise Haiti until 1862.
a*: A huge payment Haiti was forced to make under threat of invasion to compensate former slaveholders, a debt that burdened Haiti for more than a century.
hint: Who was compensated?
why: Haiti was made to pay for its own freedom, a burden that shaped its later history.
```

## Rebellion and Abolition

Abolition is often told as the achievement of European and American reformers, such as William Wilberforce and Thomas Clarkson in Britain, and abolitionist movements, including formerly enslaved writers such as Equiano and Cugoano, did mobilise public opinion. But historians increasingly stress that the resistance of the enslaved was a decisive force, making slavery dangerous, expensive, and morally indefensible.

**Britain** abolished the slave trade in 1807 and, from 1808, used the Royal Navy's **West Africa Squadron** to intercept slave ships, freeing perhaps 150,000 Africans over the following decades, many of whom were settled in Sierra Leone. After the Demerara revolt and the Baptist War, Parliament passed the **Slavery Abolition Act** in 1833, which took effect in 1834. Enslaved people were forced into a period of "apprenticeship" until 1838, and the British government paid **£20 million**, around 40 per cent of its annual budget, in compensation, not to the enslaved, but to the slaveholders. The formerly enslaved received nothing.

Emancipation elsewhere came slowly. France abolished slavery again in 1848. In the **United States**, enslaved people's resistance, such as **Nat Turner**'s revolt in Virginia in 1831, and the mass flight of enslaved people to Union lines during the Civil War, helped bring about emancipation, confirmed by the Thirteenth Amendment in 1865. Spain abolished slavery in Cuba in 1886. The last country in the Americas to abolish slavery was **Brazil**, the largest importer of enslaved Africans, where the **Golden Law** (*Lei Áurea*) of 13 May 1888 freed the remaining enslaved people, after years of mass flight from plantations and abolitionist campaigning, including by Afro-Brazilian activists such as the lawyer **Luís Gama**. The aftermath of emancipation, and the struggles of freed people for land, rights, and dignity, continue in later chapters.

## Further exploration

- **C. L. R. James, *The Black Jacobins: Toussaint L'Ouverture and the San Domingo Revolution* (1938).** The classic history of the Haitian Revolution, by a Trinidadian historian.
- **Laurent Dubois, *Avengers of the New World: The Story of the Haitian Revolution* (2004).** A modern history of the revolution.
- **Vincent Brown, *Tacky's Revolt: The Story of an Atlantic Slave War* (2020).** The revolt of 1760 as part of a wider Atlantic war.
- **Richard Price (ed.), *Maroon Societies: Rebel Slave Communities in the Americas* (3rd ed., 1996).** Maroon communities across the Americas.
- **Michel-Rolph Trouillot, *Silencing the Past* (1995).** How the Haitian Revolution was silenced in Western history.$slavewars_master$,
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
  select $slavewars_quiz$[
    {"type": "mcq", "prompt": "Who was Zumbi?", "options": ["A Portuguese governor", "The last leader of the maroon federation of Palmares in Brazil, killed in 1695", "A Haitian general", "A Jamaican Baptist deacon"], "answerIndex": 1, "explanation": "The anniversary of his death, 20 November, is Brazil's Day of Black Consciousness.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in the Amistad case?", "options": ["Enslaved Mende captives seized a Spanish ship in 1839 and were declared free by the US Supreme Court in 1841", "A British naval victory over France", "A treaty with the Jamaican maroons", "The founding of Sierra Leone"], "answerIndex": 0, "explanation": "Led by Sengbe Pieh, the captives won their freedom, and some returned to Sierra Leone.", "id": "q2"},
    {"type": "mcq", "prompt": "When did Haiti declare independence?", "options": ["1791", "1794", "1 January 1804", "1825"], "answerIndex": 2, "explanation": "Dessalines declared independence after the defeat of Napoleon's expedition, taking the Taíno name for the island.", "id": "q3"},
    {"type": "mcq", "prompt": "Under Britain's 1833 abolition, who received the £20 million in compensation?", "options": ["The formerly enslaved", "The Royal Navy", "African rulers", "The slaveholders"], "answerIndex": 3, "explanation": "Slaveholders were compensated for their 'property'; the formerly enslaved received nothing and were forced into 'apprenticeship' until 1838.", "id": "q4"},
    {"type": "open", "prompt": "How did the resistance of enslaved people contribute to the end of Atlantic slavery?", "rubric": "A strong answer discusses everyday and shipboard resistance (revolts on about one voyage in ten, the Amistad), maroon communities (Palmares, Jamaica, Suriname), uprisings (Stono, Tacky's Revolt, Demerara, the Baptist War, the Malê revolt), the Haitian Revolution and its impact, the link between Demerara and the Baptist War and British abolition in 1833, flight to Union lines in the US Civil War, and mass flight in Brazil before 1888. It compares this with accounts focused on European abolitionists.", "id": "q5"},
    {"type": "open", "prompt": "Why is the Haitian Revolution so significant, and why was it 'silenced' for so long?", "rubric": "A strong answer explains Saint-Domingue's wealth and enslaved population, the 1791 uprising and Bois Caïman, Toussaint Louverture, French abolition in 1794, Napoleon's attempt to restore slavery, Dessalines and independence in 1804, and the first permanent abolition. It explains isolation (US non-recognition until 1862, the 1825 indemnity) and Trouillot's argument that the revolution was 'unthinkable' to contemporaries and minimised in Western histories.", "id": "q6"}
  ]$slavewars_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/renaissance-and-reformation/atlantic-slave-wars', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
