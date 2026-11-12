-- American Empire: the United States in the World — canonical master article, co-written and human-reviewed.
-- history/thematic-history/american-empire-the-united-states-in-the-world @ research/advanced/read.
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
    'history/thematic-history/american-empire-the-united-states-in-the-world',
    'research',
    'advanced',
    'read',
    $mn_amempire_master$> **From thirteen states to a global power.** A republic warned against permanent alliances became a power with hundreds of bases abroad, territories whose people cannot vote for president, and a record of interventions from Manila to Baghdad. This chapter follows that path from the Monroe Doctrine through 1898 and the Banana Wars to the liberal order, covert action and the War on Terror. It tells the story as much from Honolulu, Havana, Port-au-Prince, Bikini and Okinawa as from Washington, and ends with the historians' question: empire, hegemony, or something else?

## A Republic Warned Against Alliances

George Washington's Farewell Address, published on 19 September 1796, was mostly written by Alexander Hamilton, but the ideas were Washington's. Having tried to keep the country neutral in the war between Britain and revolutionary France, he pointed to the country's "detached and distant situation" and advised: "It is our true policy to steer clear of permanent alliances with any portion of the foreign world." He allowed "temporary alliances for extraordinary emergencies". The more famous phrase, "entangling alliances with none", is not his; it comes from Thomas Jefferson's first inaugural address of 1801.

On 2 December 1823 President James Monroe told Congress that the American continents "are henceforth not to be considered as subjects for future colonization by any European powers". Written chiefly by John Quincy Adams, it was not called the "Monroe Doctrine" until 1850, and for many years the US Navy was too small to enforce it: in practice the Royal Navy did. Latin Americans knew that. When Britain reasserted its rule over the Falkland Islands in 1833 and Washington did nothing, the historian George C. Herring writes, Argentine suspicions of the United States were confirmed. By 1895 the tone had changed. "Today the United States is practically sovereign on this continent," Secretary of State Richard Olney told Britain during a boundary dispute over Venezuela, "and its fiat is law upon the subjects to which it confines its interposition."

## A Continent Taken

In 1845 an unsigned editorial on the annexation of Texas declared it "our manifest destiny to overspread the continent allotted by Providence for the free development of our yearly multiplying millions". Most historians credit the editor John L. O'Sullivan with the phrase, though some argue the journalist Jane Cazneau wrote the piece. Democrats used it to justify annexing Texas as a slave state and going to war with Mexico.

The Mexican–American War (1846–1848) was fought against a country whose northern frontier had already been weakened by Comanche, Apache and Navajo raids. By the Treaty of Guadalupe Hidalgo, Mexico lost more than half of its territory, including present-day California, Nevada and Utah. Mexican deaths, including civilians, may have reached 25,000 (Clodfelter's estimate). A young congressman, Abraham Lincoln, challenged President Polk's account of how the war began, and Ulysses S. Grant, who fought in it, later called it "one of the most unjust ever waged by a stronger against a weaker nation". The dispossession of Native nations, from removal to Wounded Knee, is told in the chapter on Native American and Indigenous Studies. A. G. Hopkins dates American empire from 1898, not from continental expansion; historians of the American West and of settler colonialism dispute that view.

## Hawaiʻi: Overthrow and Annexation

In Hawaiʻi, sugar drove the story: after an 1875 reciprocity treaty, sugar land grew from about 12,000 acres to 125,000 by 1891, and from 1887 the US leased Pearl Harbor. That year a group around Lorrin Thurston forced King Kalākaua, under threat from the militia, to accept the "Bayonet Constitution", which limited the monarch's power and through new property and income qualifications disenfranchised two-thirds of Native Hawaiians.

On 17 January 1893 a Committee of Safety, made up mostly of foreign-born residents and Hawaiian subjects of American descent (accounts of its make-up differ), overthrew Queen Liliʻuokalani. The American minister, John L. Stevens, landed Marines and sailors from USS *Boston*. The queen surrendered under protest:

```quote
That I yield to the superior force of the United States of America whose Minister Plenipotentiary, His Excellency John L. Stevens, has caused United States troops to be landed at Honolulu and declared that he would support the Provisional Government.
Liliʻuokalani · Protest · 17 January 1893
```

President Grover Cleveland called the overthrow a "substantial wrong" and blocked annexation. After a failed royalist rising in 1895, Liliʻuokalani was imprisoned in her own palace and abdicated. In 1897 the Hui Aloha ʻĀina gathered 21,269 signatures on the Kūʻē ("opposition") petitions against annexation, well over half of Native Hawaiian adults, and the Hui Kālaiʻāina collected some 17,000 more. Noenoe K. Silva rediscovered the petitions in 1996, during the doctoral research that became *Aloha Betrayed*.

{{image: Liliʻuokalani | Liliʻuokalani, the last monarch of the Hawaiian Kingdom, overthrown in 1893.}}

McKinley's annexation treaty never won the two-thirds it needed in the Senate, so in wartime in 1898 Congress annexed Hawaiʻi by a joint resolution, the Newlands Resolution, needing only simple majorities. Almost no Native Hawaiians attended the flag ceremony at ʻIolani Palace. Hawaiʻi became a state in 1959; in 1993 Congress apologised, acknowledging that Native Hawaiians "never directly relinquished" their claims to sovereignty.

## 1898: Whose War?

Cubans had been fighting Spain since 1895. Their leader José Martí, killed that year, wrote in an unfinished letter the day before his death: "Viví en el monstruo, y le conozco las entrañas: y mi honda es la de David" ("I lived in the monster and I know its entrails, and my sling is that of David"). After USS *Maine* exploded in Havana harbour in February 1898, from a cause still disputed, the United States went to war, promising in the Teller Amendment not to take sovereignty over Cuba.

Louis A. Pérez Jr. argues that American accounts wrote Cubans out of their own war, which is why he calls it "the War of 1898" rather than the "Spanish–American War". He also argues that McKinley intervened because he feared the Cubans would win on their own. By the Treaty of Paris, negotiated without the Philippine envoy Felipe Agoncillo, Spain gave up Cuba and ceded Puerto Rico, Guam and the Philippines. Cuba became formally independent in 1902, but the Platt Amendment, written word for word into its constitution, gave the United States a right to intervene and naval-base leases. Guantánamo Bay, leased from 1903, is the oldest US overseas naval base; Cuba's government has called it illegal since 1959. On Guam, home of the Chamorro people, the Defense Department today owns about 29 per cent of the island.

## The Philippine–American War

Filipinos had proclaimed independence on 12 June 1898 and formed a republic under Emilio Aguinaldo. McKinley's proclamation of December 1898 offered instead "benevolent assimilation". War began on 4 February 1899. Washington declared it over on 4 July 1902, but resistance went on, in the Moro wars of the south until 1913; at Bud Dajo in 1906 up to 900 people, including women and children, were killed.

After a surprise attack at Balangiga on Samar in September 1901 killed some 45 to 54 American soldiers (counts differ), General Jacob H. Smith ordered his troops to "kill everyone over the age of ten" and make Samar a "howling wilderness". The "water cure" was widely used in interrogation, and General J. Franklin Bell concentrated civilians in zones in Batangas and Laguna. The death toll is disputed and every figure needs its source. The State Department counts over 4,200 American and over 20,000 Filipino combatants killed; modern historians generally put civilian deaths, mostly from famine and disease, at 200,000–250,000; and some estimates reach a million, including a remark attributed in 1901 to another general, James M. Bell, of over 600,000 dead in Luzon, cited by Luzviminda Francisco and called unfounded by the historian John M. Gates. The chapters on Imperial Expansion and Resistance and Modern Southeast Asia set out the debate. Paul Kramer's *The Blood of Government* shows how closely American rule resembled European colonial practice. A 1934 act promised independence after ten years, while reclassifying Filipinos in the United States as aliens; independence came on 4 July 1946.

```checkpoint
q: Whose words were "entangling alliances with none"?
a*: Thomas Jefferson's, in his first inaugural address of 1801.
a: George Washington's, in the Farewell Address of 1796.
x: Washington urged the country to "steer clear of permanent alliances"; the "entangling" phrase is not his.
a: James Monroe's, in his message of 1823.
x: Monroe's message warned Europe against new colonisation in the Americas; it did not use this phrase.
a: Richard Olney's, in his note to Britain of 1895.
x: Olney claimed the United States was "practically sovereign on this continent", the opposite of avoiding commitments.
hint: The phrase is often misattributed to the first president.
why: Jefferson's 1801 inaugural spoke of "peace, commerce, and honest friendship with all nations—entangling alliances with none".
---
q: How was Hawaiʻi annexed in 1898?
a: By a treaty ratified by two-thirds of the Senate.
x: McKinley's 1897 treaty never had the two-thirds support it needed in the Senate.
a: By a plebiscite of Native Hawaiians.
x: Well over half of Native Hawaiian adults had signed petitions against annexation; no plebiscite was held until statehood in 1959.
a*: By the Newlands Resolution, a joint resolution of Congress needing only simple majorities.
a: By the Treaty of Paris with Spain.
x: Hawaiʻi was an independent kingdom, then a republic, never a Spanish colony.
hint: Congress found a way around the two-thirds rule.
why: During the war with Spain, a joint resolution let annexation pass the House and Senate by simple majorities.
```

## Foreign in Law: the Insular Cases and the Territories

How could a republic hold colonies? In the Insular Cases of 1901 the Supreme Court drew a distinction. *Downes v. Bidwell* separated "incorporated" territories, bound for statehood, from "unincorporated" ones, where the Constitution applied only in part, and described their inhabitants as "alien races". In 2022 Justice Neil Gorsuch wrote that the cases "have no foundation in the Constitution and rest instead on racial stereotypes. They deserve no place in our law", yet later that year the Court declined a case that would have tested them.

Puerto Ricans received US citizenship in 1917 and a constitution as a "Commonwealth" (*Estado Libre Asociado*) in 1952, but they cannot vote for president and have only a non-voting resident commissioner in Congress. The independence movement was repressed: on Palm Sunday 1937 police in Ponce fired on a Nationalist march, killing 17 civilians. From 1941 the Navy used most of the island of Vieques for bombing and training until a civil-disobedience campaign drove it out in 2003. Status votes since 2017 have favoured statehood, but Congress has not granted it. American Samoa shows that "decolonisation" means different things to different peoples: those born there are US nationals rather than citizens, and many Samoan leaders prefer it so, fearing that full incorporation would undermine *faʻa Samoa* and communal land.

## The Canal and the Banana Wars

When Colombia's Senate balked at canal terms in 1903, Panama broke away under US naval protection. A Frenchman, Philippe Bunau-Varilla, signing for Panama before any Panamanians could arrive, granted the United States a zone across the isthmus "in perpetuity". The canal, opened in 1914, had a workforce divided by race into a "gold roll" of white Americans and a far larger "silver roll", mostly Black workers from Barbados, Jamaica and elsewhere in the Caribbean.

In 1904 Theodore Roosevelt turned the Monroe Doctrine from a warning to Europe into a claimed right of intervention:

```quote
Chronic wrongdoing, or an impotence which results in a general loosening of the ties of civilized society, may … ultimately require intervention by some civilized nation … to the exercise of an international police power.
Theodore Roosevelt · Annual message to Congress · 6 December 1904
```

Its first application was a customs receivership in the Dominican Republic in 1905. The interventions of 1898–1934 are known as the Banana Wars. Marines occupied Haiti, the first independent Black-led state, from 1915 to 1934, after the National City Bank of New York had pressed Wilson to act; the occupation ended Haiti's ban on foreign ownership of land, and its forced labour caused hundreds to thousands of deaths. Haitians fought back in the *caco* wars under Charlemagne Péralte; estimates of Haitian deaths range from 3,250 rebels killed (a Marine count) to at least 15,000 Haitians in all (Roger Gaillard's estimate). In the Dominican Republic (1916–1924), peasant guerrillas called *gavilleros* resisted in the sugar provinces, while Rafael Trujillo rose through the US-created National Guard. In Nicaragua, Augusto César Sandino fought the Marines from 1927; in 1934 he was executed on the orders of Anastasio Somoza García, whose dynasty ruled until the Sandinistas overthrew it in 1979. Smedley Butler, the most decorated Marine of his era, wrote in 1935: "I was a racketeer; a gangster for capitalism." Franklin Roosevelt's Good Neighbor policy, announced in 1933, ended the Platt Amendment, and the last Marines left Haiti in 1934. The chapter on Latin America after Independence tells the hemisphere's side in more detail.

In Panama, protests over flying Panama's flag in the Zone in January 1964 left about 22 Panamanians and four US soldiers dead; "Martyrs' Day" is seen as a major reason for the Torrijos–Carter Treaties of 1977, which handed the canal to Panama on 31 December 1999. In December 1989 US forces invaded to depose Manuel Noriega: the Pentagon estimated 516 Panamanians killed, a Panamanian human-rights group 2,000–3,000.

## Wilson and the League

Woodrow Wilson's Fourteen Points of January 1918 did not use the word "self-determination", but anti-colonial nationalists read them that way; Erez Manela calls the hopes this raised the "Wilsonian moment". At Paris in 1919, when Japan's racial equality proposal won 11 of 17 votes in the League commission, Wilson ruled, as chairman, that it needed unanimity. At home the Senate rejected the Versailles treaty, and the United States never joined the League.

## The Liberal Order and Its Edges

After the Second World War the United States built a new order; Henry Luce's call for an "American Century", discussed in Modern American History: the United States in the Twentieth Century, named the ambition. At Bretton Woods in July 1944 delegates from 44 Allied nations created the International Monetary Fund and the International Bank for Reconstruction and Development. The Marshall Plan gave about \$13.3 billion to 17 European countries, and in 1949 twelve states signed the North Atlantic Treaty. Geir Lundestad, writing on Western Europe, judged that "this was to a large extent an empire by invitation", while also showing how Washington helped push the Communists out of Italy's government in 1947.

On the edges of that order the view was different. The Battle of Okinawa killed somewhere between 40,000 and 150,000 civilians, depending on the estimate; the United States ruled the island until 1972, and today Okinawa, 0.6 per cent of Japan's land, holds about 62 per cent of the exclusive-use US bases in Japan by one count (a figure often given as 70 per cent). In the Marshall Islands, at Bikini and Enewetak, the United States carried out 67 nuclear tests between 1946 and 1958. The 167 people of Bikini were moved in 1946 and were starving on Rongerik within a year; the Castle Bravo test of 1954 spread fallout over inhabited islands.

## Containment and Covert Action

Containment brought wars and coups that are told fully in Global Cold War and the Arms Race, Latin America in the Cold War, The Vietnam War: the American War in Vietnam, and The Making of the Modern Middle East. In Korea (1950–1953) about a million soldiers and an estimated 1.5–3 million civilians died. In Iran in 1953 the CIA and Britain's MI6 overthrew Prime Minister Mohammad Mosaddegh after he nationalised oil; Washington acknowledged its role in 2013. In Guatemala in 1954 a CIA-trained force of 480 men toppled Jacobo Árbenz, and the CIA's own later search found no evidence of Soviet control; a civil war that included genocide against Maya peoples followed. The Congo crisis of 1960–1965, in which the superpowers backed opposing sides, killed around 100,000 people. In Chile, declassified records show that Nixon and Kissinger knew of the military's plans before the coup of 11 September 1973; under Pinochet, the Valech commission later recognised some 38,000 political prisoners, most of them tortured. In Vietnam 58,281 Americans died, and estimates of Vietnamese dead run into the millions. In 1967 Martin Luther King Jr. called his own government "the greatest purveyor of violence in the world today".

## The Unipolar Moment and the War on Terror

After the Cold War, commentators spoke of a "unipolar moment", told in The Post-Cold War Era. William Wohlforth defined a unipolar system as one "in which a counterbalance is impossible", but a unipolar state is not necessarily an empire. After 11 September 2001, NATO invoked its mutual-defence article for the only time. The invasion of Iraq in 2003, justified by false claims of weapons of mass destruction, was called illegal by UN Secretary-General Kofi Annan; estimates of Iraqi deaths range from 151,000 violent deaths to mid-2006 (Iraq Family Health Survey) to over a million (an ORB poll of 2007). "We don't seek empires," Donald Rumsfeld said in April 2003. "We're not imperialistic. We never have been." Brown University's Costs of War project estimates 4.5–4.7 million deaths across the post-2001 war zones, most of them indirect deaths calculated with a multiplier rather than counted.

Much of this power rested on bases. Britain detached the Chagos Archipelago from Mauritius in 1965 and removed Diego Garcia's people in 1971 to make way for a joint US–British base, later used for two rendition flights; a 2025 treaty recognising Mauritian sovereignty had not entered into force by November 2026. Counts of bases abroad are estimates: David Vine counted about 800 in 2015, and a 2021 Quincy Institute brief by Vine and colleagues about 750 in 80 foreign countries and colonies, though critics dispute what counts as a base. Chalmers Johnson argued in 2004 that the base had become America's version of the colony.

```checkpoint
q: What did Geir Lundestad mean by an "empire by invitation"?
a: That the United States annexed European countries at their request.
x: Lundestad wrote about influence and alliance, not annexation.
a*: That after 1945 Western Europeans largely invited American power in, though the United States also intervened in their politics.
a: That the Philippines invited American rule in 1898.
x: Filipinos had proclaimed independence and fought the United States from 1899.
a: That the United States never interfered in allies' affairs.
x: Lundestad himself showed US interference in Italian and French politics.
hint: He was writing about Western Europe, 1945–1952.
why: Critics add that the "invitation" came from some elites and not others.
---
q: What did the Supreme Court's Insular Cases of 1901 establish?
a: That all territories must become states within ten years.
x: They created a category of "unincorporated" territories not destined for statehood.
a: That Puerto Ricans were full US citizens.
x: Citizenship came by statute in 1917, not from these cases.
a: That the Philippines must be given independence.
x: Independence came only in 1946, after a 1934 act of Congress.
a*: A distinction between "incorporated" territories, bound for statehood, and "unincorporated" ones where the Constitution applies only in part.
hint: Think of Downes v. Bidwell.
why: The distinction, resting on language about "alien races", still governs the territories.
```

## Empire or Hegemony?

William Appleman Williams's *The Tragedy of American Diplomacy* (1959) made the Open Door policy towards China central and called it America's version of "informal empire or free trade imperialism"; the chapter on Global Cold War and the Arms Race introduces his school. Daniel Immerwahr's *How to Hide an Empire* (2019) argues that the United States has always been an empire and has usually hidden it, and that after 1945 it swapped colonies for a "pointillist" network of bases, using synthetic rubber and plastics to choose globalisation over colonisation. Paul Kramer argued in 2011 that the "imperial" is a useful frame for how power works through long-distance connections, and a challenge to "American exceptionalism".

Some embraced the word: in 2001 Max Boot made "The Case for American Empire", and Niall Ferguson wrote that the US is an empire and that this "might not be wholly bad". Liberal internationalists prefer "hegemony": Michael Mandelbaum described the United States as acting as the world's government, and G. John Ikenberry argued that international institutions had taken the place of empire. A. G. Hopkins argues that the United States stopped being an empire once its island territories were decolonised, and that even its later hegemony was limited. Critics such as Johnson and Vine answer that bases, interventions and unincorporated territories make "empire" accurate. A further strand asks who acted: Pérez for Cuba, Silva for Hawaiʻi, and Latin American historians stress the Cuban insurgents, the Kūʻē petitioners, Sandino, the *gavilleros* and Panama's students of 1964. Greg Grandin's *Empire's Workshop* treats Latin America as the testing ground of American power, though some reviewers fault it for making the region a place acted upon.

## Since 2025

These events are too recent for history's verdict, as the chapter on The Post-Cold War Era says, and are recorded here only as dated facts. The administration's National Security Strategy, dated November 2025 and published in December, asserted a "Trump Corollary" to the Monroe Doctrine. On 3 January 2026 US forces struck targets in Venezuela and captured President Nicolás Maduro, taking him to New York for trial; about 80 people died (Venezuela later put the toll at 100), and President Trump said that "American dominance in the Western Hemisphere will never be questioned again". From 28 February 2026 the United States and Israel fought a war on Iran, whose opening strikes the UN Secretary-General condemned and many states called illegal; a memorandum of understanding signed in mid-June 2026 (formally on 17 June) brought a ceasefire that collapsed on 8 July, and fighting resumed in September. On 22 September 2026 the United States, Denmark and Greenland signed an agreement expanding the US military presence while affirming Danish sovereignty and Greenlandic self-determination, as the chapter on Cryo-History: Histories of Cold Places describes. 

## Further exploration

- **Daniel Immerwahr, *How to Hide an Empire: A History of the Greater United States* (2019).** The territories, the bases, and why mainland maps leave them out.
- **Paul A. Kramer, *The Blood of Government: Race, Empire, the United States, and the Philippines* (2006).** Race-making and colonial rule in the Philippine war and occupation.
- **Louis A. Pérez Jr., *The War of 1898: The United States and Cuba in History and Historiography* (1998).** How American accounts wrote Cubans out of their own war.
- **Noenoe K. Silva, *Aloha Betrayed: Native Hawaiian Resistance to American Colonialism* (2004).** Hawaiian-language sources and the Kūʻē petitions.
- **Greg Grandin, *Empire's Workshop: Latin America, the United States, and the Rise of the New Imperialism* (2006).** Latin America as the testing ground for US power.
- **David Vine, *Base Nation: How U.S. Military Bases Abroad Harm America and the World* (2015).** The global network of bases and the people displaced by it.
- **A. G. Hopkins, *American Empire: A Global History* (2018).** The case that the United States was an empire until its island territories were decolonised, and a limited hegemon after 1945.$mn_amempire_master$,
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
  select $mn_amempire_quiz$[
    {"type": "mcq", "prompt": "What was the first application of the Roosevelt Corollary to the Monroe Doctrine?", "options": ["A customs receivership in the Dominican Republic in 1905", "The annexation of Hawaiʻi in 1898", "The occupation of Haiti in 1915", "The purchase of the Virgin Islands in 1917"], "answerIndex": 0, "explanation": "Roosevelt set out the Corollary in December 1904; its first application was the Dominican customs receivership of 1905. The policy is dated 1904–1934.", "id": "q1"},
    {"type": "mcq", "prompt": "What were the Kūʻē petitions of 1897?", "options": ["Petitions by American planters asking Congress to annex Hawaiʻi", "A plebiscite on statehood", "Petitions against annexation, one of which, by the Hui Aloha ʻĀina, gathered 21,269 signatures, well over half of Native Hawaiian adults", "Queen Liliʻuokalani's letter of abdication"], "answerIndex": 2, "explanation": "The Hui Aloha ʻĀina gathered 21,269 signatures and the Hui Kālaiʻāina some 17,000 more; Noenoe K. Silva rediscovered the petitions in 1996 during the research that became Aloha Betrayed.", "id": "q2"},
    {"type": "mcq", "prompt": "Under the Torrijos–Carter Treaties of 1977, when did the Panama Canal pass to Panama?", "options": ["1 October 1979", "4 July 1946", "20 December 1989", "31 December 1999"], "answerIndex": 3, "explanation": "The Canal Zone was abolished in 1979 and the canal itself transferred at noon on 31 December 1999; the 1964 Martyrs' Day protests are seen as a major reason for the handover.", "id": "q3"},
    {"type": "mcq", "prompt": "How do historians usually describe the death toll of the Philippine–American War?", "options": ["As precisely known: exactly 4,200 deaths in all", "As disputed: modern historians generally put civilian deaths at 200,000–250,000, while some estimates reach a million", "As fewer than 10,000 Filipino deaths", "As caused almost entirely by battle wounds"], "answerIndex": 1, "explanation": "Figures must be attributed: the State Department counts over 20,000 Filipino combatants killed, most civilian deaths came from famine and disease, and higher claims such as a reported 600,000 in Luzon are contested.", "id": "q4"},
    {"type": "open", "prompt": "Was the United States an empire? Assess the debate between historians who use the word 'empire' and those who prefer 'hegemony'.", "rubric": "A strong answer sets out several positions with their authors: Williams's 'informal empire' and the Open Door; Lundestad's 'empire by invitation' (with his evidence of US interference in Italy and France); Immerwahr's hidden, 'pointillist' empire of territories and bases; Kramer's imperial frame; Boot and Ferguson embracing empire; Ikenberry and Mandelbaum's hegemony; and Hopkins's view that empire ended with the decolonisation of the island territories. It tests them against evidence such as the Insular Cases and the territories today, the Banana Wars, covert action in Iran, Guatemala and Chile, and base counts (given as attributed estimates), and reaches a reasoned judgement.", "id": "q5"},
    {"type": "open", "prompt": "How did people on the receiving end of American expansion respond to it? Use at least three cases from the chapter.", "rubric": "Good answers draw on specific cases: Liliʻuokalani's protest and the Kūʻē petitions in Hawaiʻi; Cuban insurgents and Martí, and Pérez's argument that US accounts wrote them out of their own war; Aguinaldo's republic and Filipino resistance to 1902 and beyond; the caco wars in Haiti, the gavilleros in the Dominican Republic and Sandino in Nicaragua; Panama's Martyrs' Day in 1964; the Vieques campaign; and Samoan leaders who chose to keep national status to protect communal land. Strong answers note that responses varied, from armed resistance to petition, negotiation and accommodation, and that 'decolonisation' meant different things to different peoples.", "id": "q6"}
  ]$mn_amempire_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/american-empire-the-united-states-in-the-world', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
