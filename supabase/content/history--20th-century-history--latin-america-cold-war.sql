-- Latin America in the Cold War — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/latin-america-in-the-cold-war @ research/advanced/read.
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
    'history/20th-century-history/latin-america-in-the-cold-war',
    'research',
    'advanced',
    'read',
    $mn_latamcw_master$> **The hemisphere where the Cold War was hottest for those who lived it.** For many Europeans the Cold War was a long armed standoff; for millions of Latin Americans it meant coups, torture, massacres and exile. This chapter runs from the overthrow of Guatemala's reforming government in 1954 through the Cuban Revolution and the Alliance for Progress to the dictatorships of Brazil, Chile, Argentina and Uruguay, Operation Condor and the disappeared, the wars in Central America, and the churches that sided with the poor. It ends with the truth commissions, the return of democracy, and the debate over how far the United States was responsible.

## A Cold War Fought at Home

The historian Gilbert Joseph has described the Cold War as one of the most violent periods in Latin America's history. Yet its fiercest struggles were not simply between Washington and Moscow. They were over land, wages, votes and the meaning of democracy, between peasants and landowners, unions and employers, reformers and armies. Superpower rivalry gave those struggles new weapons and new labels: a land reform could be branded communist, and a general who tortured students could call himself a defender of the free world. The chapter on Latin America after Independence describes earlier US interventions in the region and the dependency theorists who explained its economic subordination; this chapter begins in 1944.

## Guatemala: The Ten Years of Spring

In June 1944 protests that began at Guatemala's university, joined by middle-class people, students and workers, forced the dictator Jorge Ubico to resign; in October junior officers overthrew his successor. Ubico had made huge concessions to the **United Fruit Company**, Guatemala's largest landowner and employer, which controlled its railways and docks and virtually owned its only Atlantic port. The decade that followed is remembered as the "Ten Years of Spring". In 1950 a largely free election brought **Jacobo Árbenz** to power, the first transfer of power between democratically elected leaders in Guatemala's history. Árbenz had ties to some members of the communist Guatemalan Party of Labour, which was legalised under him, but he did not try to build a communist state.

His central measure was **Decree 900**, the agrarian reform of June 1952. It redistributed uncultivated land on large estates, compensating owners with bonds valued on their own previous tax declarations, and abolished unpaid labour and the forced relocation of Indigenous workers. By 1954 about 100,000 families, perhaps a sixth of the population, had received land and credit. Indigenous Guatemalans were major beneficiaries, though one historian argues that Ladinos (Guatemalans of mixed or Spanish descent) benefited disproportionately. In 1953 the government took about 234,000 acres of uncultivated United Fruit land.

Eisenhower authorised a CIA operation, and in June 1954, as the chapter on the Global Cold War and the Arms Race describes, a small CIA-trained force invaded. Washington exaggerated the extent of communist influence around Árbenz. Guatemalans did resist, as at Puerto Barrios, where police and armed dockworkers drove off the attackers, but the army would not defend the president, and Árbenz resigned on 27 June. His successor, Carlos Castillo Armas, reversed about 95 per cent of the land redistribution, returned all of United Fruit's land, and executed many Árbenz supporters; estimates run from hundreds to 5,000. Watching the coup was a 26-year-old Argentine, Ernesto "Che" Guevara, who went on to Mexico and joined the Cuban revolutionaries. Historians still argue whether Washington acted mainly for United Fruit or from anticommunist conviction. In 2011 Guatemala's president formally apologised to Árbenz's son.

```quote
It was a crime to Guatemalan society and it was an act of aggression to a government starting its democratic spring.
Álvaro Colom · apology for the 1954 coup · 20 October 2011
```

## Cuba: Revolution and Its Critics

On 26 July 1953 Fidel and Raúl Castro led a failed attack on the Moncada Barracks; Castro's trial speech, published as *History Will Absolve Me*, made him famous. When the rebels' boat, the *Granma*, landed in December 1956, no more than about twenty of its 82 men survived to reach the Sierra Maestra. Women such as Celia Sánchez and Vilma Espín were leading strategists, and Frank País ran the urban underground until he was killed in 1957. The dictator Fulgencio Batista fled on 1 January 1959; estimates of those his forces had killed range from several hundred to 20,000.

Revolutionary tribunals executed several hundred people in 1959. When the United States cut Cuban sugar imports, Cuba nationalised most US-owned assets, and Washington broke relations and tightened its embargo. A literacy campaign in 1961 mobilised about 105,000 student volunteers; by 1962, by official figures, literacy had reached 96 per cent. In April 1961 about 1,400 CIA-trained exiles landed at the Bay of Pigs and surrendered within three days; that December Castro declared himself a Marxist–Leninist. The revolution soon had critics among former sympathisers: from 1965 gay men were sent to labour camps, and in 1971 the arrest of the poet Heberto Padilla drew international condemnation. In 1980 the Mariel boatlift carried about 125,000 Cubans to Florida.

Cubans call the missile crisis of 1962 the "October Crisis"; from Havana it looked like the climax of a US sabotage campaign, Operation Mongoose. The crisis itself is told in the chapter on the Global Cold War and the Arms Race. For a decade Cuba tried to spread revolution, backing guerrillas in Venezuela, and Guevara, who called for "many Vietnams", was executed in Bolivia in 1967. Above all, the revolution convinced Latin American armies and Washington alike that the next Cuba could be anywhere.

## The Alliance for Progress

Kennedy's answer mixed reform with counter-insurgency. The **Alliance for Progress**, signed at Punta del Este, Uruguay, in August 1961, promised $20 billion of US funds over ten years, matched by $80 billion of Latin American investment. Critics noted that this came to only about $10 per Latin American a year.

```quote
Those who make peaceful revolution impossible will make violent revolution inevitable.
John F. Kennedy · address on the first anniversary of the Alliance for Progress · 13 March 1962
```

The record belied the rhetoric. During the 1960s thirteen constitutional governments in Latin America were replaced by military regimes; in the Dominican Republic the freely elected Juan Bosch was overthrown in 1963, and in 1965 President Johnson sent troops into its civil war. "The most striking failure of the Alliance of Progress", the historian Peter Smith concluded, "occurred within the political realm."

## Brazil, 1964

In 1964 Brazil's armed forces overthrew President **João Goulart**, whose reforms, including land reform, had stalled in Congress; generals ruled until 1985. The United States prepared Operation Brother Sam, a naval task force, in case the plotters needed it; they did not. Ambassador Lincoln Gordon justified the coup by claiming Goulart planned one of his own, but in 2005 admitted he had no more evidence than press rumours, and historians find no firm evidence for it. In 1968 Institutional Act No. 5, "the coup within the coup", suspended habeas corpus and opened the way to torture and killing. An amnesty law of 1979 covered crimes on both sides; no perpetrator has been punished.

Brazil's National Truth Commission, reporting in 2014, listed 434 killed or disappeared, and Human Rights Watch estimates that about 20,000 were tortured. The commission stressed that these were only proven cases, named 377 state agents as responsible for crimes against humanity, and estimated that at least 8,350 Indigenous people were killed, a figure the armed forces dispute.

## Chile: Allende and Pinochet

In September 1970 the socialist **Salvador Allende** won Chile's presidential election with 36.6 per cent of the vote. Minutes of a June 1970 meeting record Henry Kissinger saying he did not see why the United States should "stand by and watch a country go communist due to the irresponsibility of its own people", and the CIA director's notes of President Nixon's instructions read "make the economy scream". Allende nationalised copper and the banks; inflation reached 140–150 per cent in 1972, a truckers' strike paralysed the country, and the CIA funded opposition newspapers. On **11 September 1973** the armed forces attacked the presidential palace. Allende made a last radio broadcast, promising that "much sooner than later, the great avenues will again be opened", and took his own life.

Under General **Augusto Pinochet**, tens of thousands were held in the National Stadium, the singer Víctor Jara was tortured and killed at the nearby Chile Stadium, and at least 200,000 Chileans went into exile. Cardinal Raúl Silva Henríquez founded a committee, COPACHI, to defend the persecuted. The secret police, DINA, hunted opponents abroad, killing the former minister Orlando Letelier and his American colleague Ronni Moffitt with a car bomb in Washington in 1976. From 1975 economists trained at the University of Chicago, the **Chicago Boys**, imposed "shock therapy": austerity, deregulation and privatisation. Admirers spoke of a "Chilean miracle"; critics point to the crash of 1982, widening inequality, and Alejandro Foxley's estimate that about 44 per cent of families were poor by the regime's end. By 2011 the Chilean state recognised some 3,065 people killed or disappeared and more than 38,000 political prisoners, most of them tortured: 40,018 recognised victims in all.

```checkpoint
q: What was Decree 900 in Guatemala?
a*: Árbenz's 1952 agrarian reform, which redistributed uncultivated land on large estates to some 100,000 families.
a: The law by which Castillo Armas returned land to United Fruit.
x: Castillo Armas repealed Decree 900; he did not issue it.
a: A decree nationalising Guatemala's copper mines.
x: Copper nationalisation belongs to Allende's Chile, not Guatemala.
a: The order by which the United States launched the 1954 invasion.
x: The US operation was code-named PBSuccess; Decree 900 was a Guatemalan law.
hint: Think of land and the "Ten Years of Spring".
why: The land reform threatened United Fruit's uncultivated holdings and helped bring on the 1954 coup.
---
q: Which statement about Brazil's 1964 coup is supported by the evidence?
a: US marines landed in Brazil to overthrow Goulart.
x: Operation Brother Sam was prepared but stood down; no US force landed.
a: Ambassador Gordon proved that Goulart was planning his own coup.
x: Gordon later admitted he had only press rumours, and historians find no firm evidence of such a plan.
a*: The United States prepared naval support for the plotters, but the Brazilian military did not need it and it was stood down.
a: The coup restored Goulart's land reforms.
x: The coup overthrew Goulart, whose reforms had stalled.
hint: Think of Operation Brother Sam.
why: The case shows both US readiness to intervene and the Brazilian military's own initiative.
```

## Argentina and the Disappeared

Argentina's violence began before its coup, with the Triple A death squad and the killings and kidnappings of left-wing guerrillas. In 1975 General Jorge Videla declared that "as many people as necessary must die in Argentina so that the country will again be secure". On 24 March 1976 a junta led by Videla seized power.

Its hallmark was **disappearance**. People were seized and taken to some 340 secret detention centres; some 5,000 prisoners passed through the Navy Mechanics School (ESMA) alone, and only a few hundred survived. On "death flights" prisoners were thrown into the South Atlantic. How many disappeared is contested: the national commission CONADEP documented 8,961 cases while stressing the true number was higher; a 1978 count by the regime's own intelligence service gave 22,000 killed or disappeared since 1975; human-rights organisations give 30,000. About 30 per cent of the disappeared were women. The junta also took babies born to imprisoned mothers, because, as General Ramón Camps put it, "subversive parents will raise subversive children".

The first public challenge came from mothers. On 30 April 1977 **Azucena Villaflor** and about a dozen women walked to the Plaza de Mayo, in front of the presidential palace, to demand news of their children. Defying the ban on assembly, the **Mothers of the Plaza de Mayo** marched every Thursday in white headscarves embroidered with their children's names. In December 1977 Villaflor, two other founding Mothers and two French nuns were themselves disappeared; DNA later identified their remains. The Grandmothers of the Plaza de Mayo estimate that up to 500 children were stolen; by July 2025 they had identified 140 grandchildren.

{{image: Mothers of the Plaza de Mayo | The Mothers of the Plaza de Mayo, whose weekly marches and white headscarves became a worldwide symbol of the search for the disappeared.}}

After leaving office, Kissinger praised the junta for "wiping out terrorist forces"; under Carter, the human-rights official Patricia Derian said of Kissinger's encouragement that "with an imperial wave of his hand, an American could sentence people to death". Defeat in the Falklands/Malvinas War of 1982 broke the regime, and Raúl Alfonsín took office in December 1983.

## Uruguay and Operation Condor

In Uruguay, the urban guerrillas of the Tupamaros provoked an army-led counter-insurgency, and in June 1973 President Juan María Bordaberry began a "civic-military" dictatorship that lasted until 1985. Uruguay had the highest number of political prisoners per head in the world, and almost a tenth of its people emigrated. About 180 Uruguayans are known to have been killed, most of them in Argentina and neighbouring countries.

That pattern had a name. In November 1975 Chile's DINA hosted intelligence officers from Argentina, Bolivia, Paraguay and Uruguay in Santiago and created **Operation Condor** (Brazil joined in 1976), a network for hunting opponents across borders. Its victims included Letelier and Moffitt, the former Bolivian president Juan José Torres and two former Uruguayan legislators murdered in Buenos Aires. The CIA kept DINA's chief, Manuel Contreras, as a contact until 1977 and paid him once, in 1975. Two figures must be kept apart. Claims of 50,000 or 60,000 deaths attached to "Condor" count the whole repression of the regimes it linked; the political scientist Patrice McSherry counts at least 402 people killed or disappeared in cross-border Condor operations themselves.

## Central America: Revolution and Counter-Revolution

In the 1980s the Cold War's centre of gravity in Latin America moved to Central America.

In **Nicaragua**, the murder of the opposition editor Pedro Joaquín Chamorro in 1978 sparked an insurrection against the Somoza dictatorship that killed between 10,000 and 50,000 people, and the Sandinista Front (FSLN) took power in July 1979. Its opponents, the **Contras**, included former members of Somoza's National Guard, disillusioned revolutionaries, and Miskito, Mayangna and Rama peoples of the Atlantic coast, who clashed with the government over land. The Reagan administration armed the Contras and the CIA mined Nicaragua's harbours; in 1986 the International Court of Justice found that the United States had broken international law. When Congress banned funding, officials secretly sold arms to Iran and diverted the proceeds to the Contras, the **Iran–Contra affair**. The Contra war killed between 32,000 and 43,000 people. In 1990, after the White House said its embargo would continue unless she won, Violeta Chamorro defeated the Sandinista Daniel Ortega.

In **El Salvador**, war between the government and the FMLN guerrillas lasted from 1979 to the peace accords of 1992. According to the UN, more than 75,000 people were killed and about 8,000 disappeared. Archbishop **Óscar Romero** of San Salvador, appointed in 1977 as a conservative, was transformed by the murder of his friend, the Jesuit Rutilio Grande: "If they have killed him for doing what he did, then I too have to walk the same path." On 23 March 1980 he appealed to soldiers to disobey orders to kill: "In the name of God ... I beg you, I beseech you, I order you in the name of God: stop the repression!" The next day he was shot while saying Mass; the UN Truth Commission later named Roberto D'Aubuisson as having ordered the killing. In December 1981, at **El Mozote**, the US-trained Atlácatl Battalion killed more than 811 civilians; the survivor Rufina Amaya lost her husband and four children. A US official told the Senate there was "no evidence" of a systematic massacre.

In **Guatemala**, the war that followed 1954 lasted from 1960 to 1996. In 1978 at **Panzós**, Q'eqchi' Maya peasants who had marched into the town square to press land claims were massacred by the army; Greg Grandin counts some three dozen dead and calls it "the last colonial massacre". In 1980 K'iche' and Ixil peasants occupied the Spanish Embassy to protest army killings; among those who died was Vicente Menchú, father of Rigoberta Menchú, whose memoir later carried the Maya's suffering to the world. In 1981–83 the army destroyed, by its own admission, 440 Maya villages; the truth commission counted at least 626 army massacres over the whole war. General Efraín Ríos Montt told Reagan his strategy was not "scorched earth" but "scorched Communists"; Reagan said he was getting a "bum rap". The UN-backed truth commission counts over 200,000 killed or disappeared in the whole war; other estimates start at 140,000, and the anthropologist David Stoll argues the commission's projections are too high.

```checkpoint
q: Which statement about Operation Condor's death toll is most accurate?
a: Condor operations killed 60,000 people across borders.
x: Figures of 50,000–60,000 lump together the whole repression of the regimes, not cross-border Condor operations.
a*: The regimes linked by Condor killed tens of thousands, but cross-border Condor operations themselves killed several hundred: McSherry counts at least 402.
a: Condor killed no one; it only exchanged information.
x: Condor's victims included Letelier and Moffitt, Torres and two Uruguayan legislators.
a: Condor was a US operation run directly from Washington.
x: Condor was created by Chile's DINA with the intelligence services of South American dictatorships, though the CIA kept Contreras as a contact.
hint: Distinguish the network's own operations from all the repression of its members.
why: Keeping the figures apart shows both the scale of state terror and the specific character of Condor.
---
q: Why did the Mothers of the Plaza de Mayo matter?
a: They led the guerrilla resistance to the Argentine junta.
x: They were unarmed mothers demanding news of their children.
a: They negotiated the junta's surrender after the Falklands/Malvinas War.
x: Defeat in the war forced the military out; the Mothers did not negotiate it.
a: They were a government commission that counted the disappeared.
x: The official commission was CONADEP, chaired by Ernesto Sábato.
a*: They openly defied the junta's ban on assembly to demand news of disappeared children, and became a symbol of the search for the disappeared.
hint: Think of Thursdays and white headscarves.
why: Ordinary women turned private grief into public protest at great personal risk; some of their founders were themselves disappeared.
```

## Liberation Theology and the Churches

Many who stood up to the regimes did so as Christians. In 1968 the Peruvian priest **Gustavo Gutiérrez** outlined a "theology of liberation", and with thinkers such as Leonardo Boff in Brazil and Jon Sobrino in El Salvador argued that the Church must make a "preferential option for the poor". The bishops' conference at Medellín (1968) embraced its themes, and Puebla (1979), more cautiously, adopted the phrase; grassroots "base ecclesial communities" spread through poor neighbourhoods and villages. In 1984 the Vatican under Cardinal Ratzinger criticised the movement's use of Marxist analysis. The churches became shelters and witnesses, from Chile's COPACHI to the Guatemalan archdiocese's report *Guatemala: Nunca Más*, and they paid for it: many victims were priests, nuns and catechists, and the head of the Guatemalan project, Bishop Juan Gerardi, was murdered in 1998.

## Truth Commissions and the Return to Democracy

Democracy returned unevenly: in Argentina in 1983; in Uruguay and Brazil in 1985; in Chile in 1990, after 56 per cent voted "No" to Pinochet in a 1988 plebiscite; and in Central America through elections and peace accords between 1990 and 1996.

Latin America pioneered the **truth commission**. Argentina's CONADEP, chaired by the writer Ernesto Sábato, published *Nunca Más* ("Never Again") in 1984, and in 1985 the former junta was put on trial: Videla and Massera were sentenced to life. El Salvador's UN commission attributed about 85 per cent of atrocities to state forces and allied death squads and 5 per cent to the FMLN. Guatemala's Commission for Historical Clarification, whose three commissioners included a Maya woman, reported in 1999 that 93 per cent of violations were committed by state forces and allied paramilitaries, that 83 per cent of identified victims were Maya, and that state agents had "committed acts of genocide against groups of Mayan people" in 1981–83. President Clinton then apologised for US support of forces that committed atrocities.

Truth did not always bring justice. President Menem pardoned Argentina's convicted junta leaders in 1989–90, but laws halting prosecutions were annulled in 2003–05 and trials resumed. Brazil's amnesty still stands, Uruguayans twice voted to keep theirs, and El Salvador passed a blanket amnesty five days after its truth commission reported. Pinochet was arrested in London in 1998 and died in 2006 facing about 300 criminal charges. In 2013 a Guatemalan court convicted Ríos Montt of genocide against the Ixil Maya, the first former head of state tried for genocide by his own country's courts; ten days later the Constitutional Court overturned the verdict, and some signatories of the peace accords rejected the genocide charge.

## The Debate over US Responsibility

How much of this was Washington's doing? Older radical accounts saw the United States crushing popular movements across the hemisphere; conservative accounts saw intervention vindicated by the eventual triumph of democracy and markets. The record shows deep involvement: the Church Committee called US covert action in Chile from 1963 to 1973 "extensive and continuous". Yet a 2000 US intelligence report concluded that the CIA "did not instigate" the 1973 coup, though it knew of the plotting, and the Chilean historian **Sebastián Hurtado** finds no documentary evidence that Washington coordinated the coup itself. Kissinger told Nixon "we didn't do it" but "we helped them".

Recent historians have put Latin Americans back at the centre. **Hal Brands** rejects both the radical and the triumphalist accounts, describing overlapping struggles in which Latin Americans held centre stage and the Cuban Revolution militarised the conflict. **Tanya Harmer** describes an "inter-American" Cold War in which Havana, Santiago and Brasília were actors, not pawns. **Greg Grandin** sees a struggle between two visions of democracy, a social, participatory one and a narrower liberal order, and disputes the view that US intervention paved the way for democracy. Some argue that Cuban "subversion" was exaggerated to justify intervention; others note that Cuba really did arm guerrillas. Whatever the balance, the juntas and death squads were Latin American, and so were the mothers, priests, peasants and commissioners who resisted them and recorded the truth.

## Further exploration

- **Greg Grandin, *The Last Colonial Massacre: Latin America in the Cold War* (2004; updated ed. 2011).** Guatemala as a case study of a Cold War fought over two visions of democracy.
- **Hal Brands, *Latin America's Cold War* (2010).** A multinational synthesis that restores Latin American agency.
- **Tanya Harmer, *Allende's Chile and the Inter-American Cold War* (2011).** Chile's 1970–73 crisis as a contest shaped by Havana, Santiago, Brasília and Washington.
- **Gilbert M. Joseph and Daniela Spenser (eds.), *In from the Cold: Latin America's New Encounter with the Cold War* (2008).** Essays on how ordinary Latin Americans used, shaped and suffered the conflict.
- **Vanni Pettinà, *Historia mínima de la Guerra Fría en América Latina* (2018).** A concise synthesis from Mexico that treats the region's politics as autonomous.
- **Patrick Iber, *Neither Peace nor Freedom: The Cultural Cold War in Latin America* (2015).** Writers, intellectuals and the cultural battles of the era.$mn_latamcw_master$,
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
  select $mn_latamcw_quiz$[
    {"type": "mcq", "prompt": "Which estimate range for Argentina's disappeared reflects the sources?", "options": ["About 500 documented cases", "CONADEP documented 8,961 cases; a 1978 regime intelligence count gave 22,000 killed or disappeared; human-rights organisations give 30,000", "Exactly 60,000, according to CONADEP", "About 2,300, according to Chile's Rettig Report"], "answerIndex": 1, "explanation": "CONADEP documented 8,961 disappearances while noting the true number was higher; the regime's own 1978 count gave 22,000 and human-rights groups give 30,000. The Rettig figures refer to Chile, and 500 is the Grandmothers' estimate of stolen children.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Guatemala's Commission for Historical Clarification conclude in 1999?", "options": ["That most violations were committed by the guerrillas", "That no genocide had taken place", "That the violence had begun only in 1990", "That state agents committed acts of genocide against Maya groups in 1981–83, and that state forces and allied paramilitaries committed 93 per cent of violations"], "answerIndex": 3, "explanation": "The commission attributed 93 per cent of violations to state forces and allied paramilitaries and 3 per cent to insurgents, and found acts of genocide against Maya groups in 1981–83.", "id": "q2"},
    {"type": "mcq", "prompt": "How does the political scientist Patrice McSherry's estimate for Operation Condor differ from claims of 50,000–60,000 deaths?", "options": ["Her figure of at least 402 counts only cross-border Condor operations, while the larger claims count the whole repression of the regimes Condor linked", "She estimates far more deaths, about 400,000", "She argues that Condor never existed", "She counts only deaths inside Chile"], "answerIndex": 0, "explanation": "The large figures lump together all the regimes' repression; McSherry's figure of at least 402 refers to cross-border Condor operations themselves.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Archbishop Óscar Romero ask of Salvadoran soldiers in his homily of 23 March 1980?", "options": ["To join the FMLN guerrillas", "To leave the country", "To disobey orders to kill and stop the repression", "To support military aid from the United States"], "answerIndex": 2, "explanation": "Romero told soldiers not to obey orders contrary to God's law: \"I beg you, I beseech you, I order you in the name of God: stop the repression!\" He was shot the next day; he had earlier written to Carter opposing military aid.", "id": "q4"},
    {"type": "open", "prompt": "How far was the United States responsible for the 1973 coup in Chile? Use evidence and at least two historians' or official views.", "rubric": "A strong answer notes Nixon's order to stop Allende ('make the economy scream'), Kissinger's 1970 remark, CIA funding of the opposition press and the Church Committee's 'extensive and continuous' covert action; balances this against the 2000 US intelligence report that the CIA did not instigate the coup and Sebastián Hurtado's finding of no evidence of US coordination of the coup itself; and weighs Chilean actors, polarisation and economic crisis (Harmer's inter-American Cold War). Kissinger's 'we didn't do it' but 'we helped them' can be used.", "id": "q5"},
    {"type": "open", "prompt": "Explain the roles Latin Americans themselves played in resisting the dictatorships and recording what happened, with at least two examples.", "rubric": "A strong answer gives concrete examples such as the Mothers and Grandmothers of the Plaza de Mayo (Azucena Villaflor, weekly Thursday marches, identification of stolen grandchildren), Archbishop Romero and liberation theology's option for the poor, Chile's COPACHI, the Guatemalan Church's report and Bishop Gerardi, Rigoberta Menchú, and truth commissions such as CONADEP's Nunca Más and Guatemala's Commission for Historical Clarification; it notes the risks they ran and connects to the historians' shift towards Latin American agency.", "id": "q6"}
  ]$mn_latamcw_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/latin-america-in-the-cold-war', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
