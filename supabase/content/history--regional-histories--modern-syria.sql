-- A History of Modern Syria — canonical master article, co-written and human-reviewed.
-- history/regional-histories/middle-east/a-history-of-modern-syria @ research/advanced/read.
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
    'history/regional-histories/middle-east/a-history-of-modern-syria',
    'research',
    'advanced',
    'read',
    $mn_syria_master$> **From Ottoman province to shattered and remade state.** Modern Syria was carved from a larger Ottoman "Syria", divided by France into statelets, and won independence in 1946 only to fall into decades of coups. Hafez al-Assad built a security state that crushed Hama in 1982 and passed power to his son Bashar. The uprising of 2011 became a war that drew in Russia, Iran, Turkey, the United States, the Islamic State and the Kurds, until the regime fell in December 2024. This chapter follows that story through Syrian voices and the debates over notables and peasants, sect and class, belief and fear, and revolution and proxy war.

## Greater Syria under the Ottomans

After the Ottoman conquest of 1516–17, described in the chapter on the Ottomans, "Syria" was governed as provinces centred on Damascus, Aleppo and Tripoli. In late Ottoman usage the word often meant the whole land from the Taurus mountains to Sinai. Under the Tanzimat's Vilayet Law of 1864 it was reorganised into smaller provinces, Syria (Damascus) in 1865 and Aleppo in 1866, with Beirut split off in 1888, each with a governor appointed from Istanbul and a new provincial assembly.

In 1860 a Druze–Maronite civil war in Mount Lebanon, which killed an estimated 7,000–11,000 people (some claims exceed 20,000), spilled into Damascus. From 9 to 17 July crowds of Druze, Bedouin, Muslim townsmen and Kurdish irregulars destroyed the Christian quarter of Bab Tuma. The toll is disputed: Eugene Rogan puts the Christian dead at about 5,000, other estimates at anywhere from about 2,500 to 15,000. The Algerian exile Abd al-Qadir al-Jaza'iri sheltered Christians in his house and faced down the rioters. Fuad Pasha restored order with some 357 executions, and France landed about 6,000 troops.

Arab political thought grew alongside. The Aleppan writer Abd al-Rahman al-Kawakibi attacked Ottoman despotism in *The Nature of Tyranny*; Arab students in Paris founded the secret society al-Fatat in 1909; and the Arab Congress of 1913 asked for autonomy, not independence. Djemal Pasha, the Ottoman governor whom Arabs called "the Butcher", executed more than thirty nationalists in 1915–16; the hangings in Damascus and Beirut on 6 May 1916 are still remembered as Martyrs' Day.

## Faisal's Kingdom and Maysalun

As the chapter on the First World War describes, Arab forces reached Damascus at the end of September 1918, and an Arab government was set up under Faisal, son of Sharif Hussein. A Syrian National Congress, elected in 1919, met that June (later presided over by Hashim al-Atassi), and the American King–Crane Commission was greeted in Damascus with leaflets reading "Independence or Death". On 8 March 1920 the Congress proclaimed Faisal king of an Arab Kingdom of Syria and rejected a French mandate.

The kingdom lasted less than five months. When General Gouraud demanded that the Arab army disband, Faisal accepted, but his war minister, Yusuf al-Azma, marched out to fight. At Maysalun on 24 July 1920 a French force of 9,000–12,000, mostly Senegalese and Algerian units with tanks and aircraft, routed a much smaller army of regulars, Bedouin and volunteers in about four hours. French figures claimed 42 French and about 150 Syrians killed; al-Azma was among the dead, and the French entered Damascus the next day. Faisal later became king of Iraq. The historian Ali Allawi writes that Maysalun "has gone down in Arab history as a synonym for heroism and hopeless courage against huge odds, as well as for treachery and betrayal".

## The Mandate: Dividing to Rule

France had been granted the mandate at San Remo in April 1920; the chapter on the Interwar Period discusses what the mandate system meant, and the chapter on The Making of the Modern Middle East summarises how France divided its territory. In full, the partition of 1920–21 created a State of Greater Lebanon, proclaimed on 1 September 1920 as a "safe haven" for Maronite Christians, which most of its Muslims at first rejected; an Alawite State on the coast; separate States of Damascus and of Aleppo; a Jabal Druze State in the south (1921); and an autonomous Sanjak of Alexandretta in the north-west. Damascus and Aleppo were united as the State of Syria in 1925; the Jabal Druze and Alawite states were folded in only in 1936.

The divisions lasted. Between 1926 and 1939 Alawites, about a tenth of Syrians and historically among the poorest, together with other minorities supplied most of the local recruits to France's Army of the Levant, the root of their later prominence in the Syrian army.

## The Great Syrian Revolt, 1925–27

The largest challenge to French rule began among the Druze, angered by the forced labour, disarmament and taxes imposed by a French officer, Captain Carbillet. When the High Commissioner, General Sarrail, imprisoned a Druze delegation that had come to complain, **Sultan al-Atrash** defeated French columns at al-Kafr and al-Mazraa in July and August 1925 and declared revolt on 23 August. Damascus nationalists joined him in a provisional government, with Abd al-Rahman Shahbandar as vice-president, and Hama rose in October under Fawzi al-Qawuqji.

{{image: Sultan al-Atrash | Sultan al-Atrash, the Druze leader who declared the Great Syrian Revolt against French rule in August 1925.}}

In Damascus rebels led by Hasan al-Kharrat, *qabaday* (strongman) of the al-Shaghour quarter, briefly seized Sarrail's residence, the Azm Palace, and withdrew under heavy bombardment. Rebels' bodies were displayed in Damascus in October 1925, al-Kharrat was killed in a French ambush on Christmas Day, and by spring 1926 artillery had destroyed much of Damascus. France raised its forces to about 50,000 and crushed the Druze in spring 1927; al-Atrash fled to Transjordan, returning under a pardon in 1937. The dead ran into the thousands, but no reliable total has been established.

How should the revolt be read? Michael Provence calls it the largest and longest-lasting anti-colonial insurgency in the inter-war Arab East. He sees a popular, rural and locally rooted rising, led by war-hardened former Ottoman officers, while many of Damascus's landowning elite collaborated with France. His critics say he plays down the politics of those urban notables, which earlier accounts had placed at the centre.

## Notables, Alexandretta and Independence

That earlier account belongs above all to Philip Khoury, who asked why one urban landowning and bureaucratic elite kept dominating politics after the Ottomans and under France. After the revolt, notables of the National Bloc, led by Hashim al-Atassi, pursued independence by negotiation, a strategy Khoury captured in the title of a part of his book, "Honorable Cooperation". Daniel Pipes praised his research but accused him of a "dogmatic Marxism" and of neglecting pan-Syrian nationalism.

After a 50-day strike in 1936, a treaty of independence was signed with France's Popular Front government, but the French parliament never ratified it. Meanwhile Syria lost Alexandretta, a mixed district that a French estimate counted as 39 per cent Turkish; it became the Hatay State in 1938 and was annexed by Turkey in 1939. Women demonstrated in Damascus against the loss.

Independence was recognised in 1944, after Vichy rule and an Allied invasion, but France held on. On 29 May 1945 French forces shelled Damascus and stormed the parliament, trying to arrest President Shukri al-Quwatli; by one estimate about 1,000 Syrians were killed before British troops intervened. The last French soldiers left on 17 April 1946, still celebrated as Evacuation Day.

```checkpoint
q: How did France divide its Syrian mandate in 1920–21?
a*: Into Greater Lebanon, an Alawite State, separate States of Damascus and Aleppo, a Jabal Druze State and an autonomous Sanjak of Alexandretta.
a: Into a single Syrian state under King Faisal.
x: Faisal's kingdom was destroyed at Maysalun in July 1920, and France then divided the territory.
a: Into two states only, Syria and Lebanon.
x: The two-part shape came later; in 1920–21 there were several statelets, and the Druze and Alawite states joined Syria only in 1936.
a: Into Turkish, Kurdish and Arab zones agreed with Atatürk.
x: Only Alexandretta later passed to Turkey, in 1939; there was no Kurdish zone.
hint: Think of the separate regions, religious and urban, that France set up.
why: Dividing the territory along religious and regional lines shaped Syria's politics long afterwards, including the minorities' later role in the army.
---
q: How does Michael Provence's view of the Great Syrian Revolt differ from an account centred on urban notables?
a: He argues the revolt was planned and led by the National Bloc in Damascus.
x: Provence stresses rural leadership and notes that many Damascus landowners collaborated with France.
a: He argues the revolt was a Druze tribal feud with no nationalist content.
x: He calls it the largest and longest-lasting anti-colonial insurgency in the inter-war Arab East.
a*: He sees it as a popular, rural rising led by former Ottoman officers, with many urban landowners collaborating.
a: He argues it was organised by Britain from Transjordan.
x: Al-Atrash fled to Transjordan only after the revolt was defeated; it began among Syria's Druze.
hint: Think of countryside against city, officers against landowners.
why: Khoury's work had stressed the notables' politics of negotiation; Provence's critics say he underplays it.
```

## Coups, Union and the Ba'th, 1949–70

Parliamentary rule lasted barely three years. On 30 March 1949, after defeat in the 1948 war, Colonel Husni al-Za'im overthrew al-Quwatli in a bloodless coup; in May his government approved by decree a Saudi oil pipeline (Tapline) deal that parliament had stalled. Claims of CIA involvement remain "highly controversial", resting on memoirs that contradict each other. Two more coups followed that year, and Adib Shishakli ruled until 1954. Between 1946 and 1956 Syria had 20 cabinets and four constitutions.

Fearing communism, Syrian politicians and officers asked Nasser for union. His terms, in one historian's summary, were a plebiscite, the dissolution of parties and the withdrawal of the army from politics. The United Arab Republic followed in February 1958, but Egyptian centralisation, Abd al-Hamid al-Sarraj's security apparatus and the nationalisations of 1961 alienated Syrian business and the army, and a coup ended it that September.

On 8 March 1963 the Ba'th Party's Military Committee, whose leading figures Muhammad Umran, Salah Jadid and Hafez al-Assad were all Alawites, seized power with Nasserist and independent allies. A state of emergency imposed then lasted 48 years. In 1966 Jadid's neo-Ba'thist faction ousted the party's founders, and Assad became defence minister; in that post he lost the Golan Heights to Israel in June 1967. The Kurds, 5–10 per cent of the population, had already been singled out: a census of 1962 in Hasakah province stripped about 120,000 Kurds of citizenship, leaving them "foreigners" or unregistered in their own country.

## Hafez al-Assad's Security State

Assad, born in 1930 to a poor Alawite peasant family in Qardaha, took power in his "Corrective Movement" of November 1970 and imprisoned Jadid until his death. Patrick Seale, whose biography drew on access to Assad himself, wrote that his rule "began with an immediate and considerable advantage: the government he displaced was so detested that any alternative came as a relief". The 1973 constitution made the Ba'th "the leading party in the society and the state". To answer Sunni objections, Assad obtained a fatwa in 1973–74 from the Lebanese Shia cleric Musa al-Sadr declaring Alawites part of Shia Islam.

The state rested on several intelligence agencies, the *mukhabarat*, and on units such as his brother Rifaat's Defence Companies. Alawites, as Hinnebusch notes, held a near-monopoly of security and intelligence posts, while Sunnis such as the defence minister Tlass held high office but, as one account puts it, "none had power separate from" Assad. Abroad, Syrian troops, thousands rising to tens of thousands, entered Lebanon's civil war in 1976 and stayed until 2005; the chapter on The Making of the Modern Middle East covers Lebanon and the wars with Israel.

A personality cult surrounded the president. Lisa Wedeen argued that it did not need to be believed.

```quote
Asad's cult operates as a disciplinary device, generating a politics of public dissimulation in which citizens act as if they revere their leader.
Lisa Wedeen · Ambiguities of Domination · 1999
```

Seale's insider portrait, stressing Assad's patience and caution without hiding his ruthlessness, remains indispensable, though Pipes called Seale the regime's leading apologist in the West. A deeper debate concerns the regime's character. Nikolaos van Dam stressed sectarian, regional and tribal loyalties: minorities and the rural poor rose through the army and the party until an Alawite officer faction prevailed. Hanna Batatu foregrounded class, tracing the Ba'th's base to peasants and the "lesser rural notables" while also examining the influence of Alawite officers and asking directly whether the regime was sectarian. A reviewer framed it as a "great debate": did the regime's character come from its rural or its Alawite background? Most Alawites, it should be remembered, stayed relatively poor.

## The Islamist Uprising and Hama, 1982

From 1976 an Islamist insurgency, begun by Marwan Hadid's Fighting Vanguard and joined in 1979 by the Muslim Brotherhood, waged a campaign of assassinations whose victims were mostly Alawites. After an attempt on Assad's life in 1980, Rifaat's forces killed imprisoned Islamists in Tadmor prison at Palmyra (estimates run from 500 to 1,100), and Brotherhood membership became a capital offence.

On 2 February 1982 insurgents rose in Hama, killing about 70 Ba'thists. The army and the Defence Companies besieged the city for 27 days with about 12,000 troops, shelling and bombing the old city. Estimates of the dead range from 5,000 to 40,000. Amnesty International first estimated 10,000–25,000; the journalist Robert Fisk gave 10,000, later 20,000; the Syrian Human Rights Committee gives 25,000 or 30,000–40,000. For decades Hama was a memory Syrians did not speak aloud. Salwa Ismail, drawing on more than 150 interviews in Syria between 2002 and 2011, argues in *The Rule of Violence* that the prison and the massacre were instruments of government, shaping how Syrians saw themselves.

## Bashar and the False Spring

Hafez's heir Basil died in 1994, so when Hafez died on 10 June 2000 his son Bashar, recalled from training as an ophthalmologist in London, succeeded him once the minimum presidential age had been lowered from 40 to 34. A brief "Damascus Spring" of political forums and reform petitions followed; by 2001 Riad Seif and others were in prison. Bashar's "social market economy" from 2005 enriched cronies such as his cousin Rami Makhlouf, while economists estimated unemployment at 24.4 per cent against an official 8.1. From 2006–07 to 2010 came the worst drought on instrumental record, and in February 2011 the Syrian Agricultural Workers Union complained that lifting subsidies on farm inputs had made it worse.

## 2011: Revolution

In early 2011 security forces in Daraa under Assad's cousin Atef Najib arrested and tortured about 15 boys for graffiti that read "The people want the fall of the regime" and "Your turn, Doctor". Protests spread from March; demonstrators chanted "peaceful, peaceful", and at funerals in Daraa on 25 March they cried "We do not want your bread, we want dignity". Assad blamed a "foreign plot". He lifted the emergency law on 21 April and besieged Daraa four days later; the mutilated body of a 13-year-old, Hamza Ali al-Khateeb, became a national symbol. By late July defected officers had formed the Free Syrian Army.

Why did Syria rise? Kelley and colleagues argued in 2015 that human-caused climate change made the drought two to three times more likely, driving rural collapse, migration and unrest. Selby, Dahi, Fröhlich and Hulme replied in 2017 that there was no sound basis for blaming the drought on climate change, that migration was far smaller than claimed, and that there was no evidence it helped start the war. Other causes named include repression, crony liberalisation, unemployment, corruption, the Arab Spring's example and the Daraa trigger.

Syrians themselves insisted on what the uprising was. The lawyer Razan Zaitouneh co-founded the Violations Documentation Center and was a leading figure in the Local Coordination Committees, which organised and recorded the protests. Samar Yazbek, a novelist from an Alawite family in Jableh, joined the uprising and went into exile months later; her diaries, *A Woman in the Crossfire*, won the PEN Pinter writer of courage award in 2012. On 9 December 2013 Zaitouneh, Wael Hamadeh, Samira Khalil and Nazem Hammadi were abducted in rebel-held Douma, most likely by the Islamist group Jaysh al-Islam; their fate is unknown. Khalil's husband, the writer Yassin al-Haj Saleh, had spent 16 years in Assad's prisons, from 1980 to 1996, for membership of a communist party, the last year in Tadmor. His *The Impossible Revolution*, like Robin Yassin-Kassab and Leila Al-Shami's *Burning Country*, insists that a civic, largely nonviolent revolution came first, before militarisation and foreign intervention turned it into what is also widely described as a proxy war.

## A War of Many Wars

The chapter on Modern Conflicts since 1991 sets Syria among the wars of the Arab Spring. Iran sent its Quds Force and Afghan and Pakistani militias, and Hezbollah fought openly from 2013. Russia began air strikes on 30 September 2015 from its base at Hmeimim. Against the regime stood the Free Syrian Army; the jihadist al-Nusra Front, founded in 2012 by Abu Mohammad al-Julani with al-Qaeda backing and later reborn as Hay'at Tahrir al-Sham (HTS), which ruled Idlib; and Turkish-backed factions. Kurds ran a self-governing Autonomous Administration from 2012, whose Kurdish-led Syrian Democratic Forces (SDF), backed by a US-led coalition, took the Islamic State's capital, Raqqa, in 2017; Turkey attacked them from 2016. The battle for Aleppo, from 2012 to 2016, was called "Syria's Stalingrad".

The regime's weapons defined the war. Barrel bombs were identified from August 2012, and in 2014 the UN Security Council demanded an end to them. On 21 August 2013 sarin killed an estimated 281–1,729 people in the Ghouta; the research institute GPPi documented 336 chemical attacks between 2012 and 2019. A military photographer, "Caesar", smuggled out images of about 11,000 dead detainees, and Amnesty estimated that 5,000–13,000 people were executed at Sednaya prison in 2011–15. Loyalists sprayed a slogan on homes in retaken towns: "Assad or we burn the country".

The human cost is counted in different ways. The UN identified at least 350,209 people killed between 2011 and 2021, "certainly an under-count", and estimates based on the Syrian Observatory for Human Rights reached about 656,000 by March 2025. By 2015 nearly half the population had been driven from their homes; by 2023 a World Bank estimate based on satellite images of night-time lights put the fall in economic activity since 2010 at 84 per cent.

## The Fall of Assad and the Transition

On 27 November 2024 HTS and its allies launched an offensive. Aleppo fell within days, Hama on 5 December and Homs on the night of 7–8 December, and on 8 December Assad flew to Moscow. Sednaya's gates were opened, and Israel moved into the Golan buffer zone.

Events since are recent, and figures provisional. Ahmed al-Sharaa, the former al-Julani, was declared president on 29 January 2025; a constitutional declaration of 13 March set a five-year transition. From 6 March massacres of Alawites swept the coast. Tallies of the dead run from the UN Commission of Inquiry's some 1,400, mostly civilians, to the Syrian Observatory's figures of more than 1,600. The UN commission found likely war crimes by government-affiliated factions and by pro-Assad fighters, but no evidence of a governmental policy or plan. In July 2025, in the Druze south, the Observatory counted 823 mostly Druze civilians executed by government forces. From October 2025 indirect elections, without a popular vote, chose most of the two-thirds of a new assembly not appointed by the president. The United States lifted most sanctions in mid-2025 and repealed the Caesar Act that December, and al-Sharaa visited the White House that November. A government offensive in January 2026 took up to 80 per cent of the Kurdish-led region, which was fully integrated into the state in August 2026. By one UN-cited count, some 1.7 million refugees had returned by late June 2026.

## A Century's Lessons

Syria's century turns on three questions. The first is minority rule: France recruited minorities into its army, and the Assads filled their security posts largely with Alawites, yet most Alawites stayed relatively poor, and the coastal massacres of 2025 showed the cost of treating "regime" and "Alawite" as the same thing. The second is sectarianism, which 1860, Hama and the civil war can make look timeless, though van Dam, Batatu and Ismail explain it through armies, rural classes and state violence. The third is outside powers, from French generals to Nasser, Moscow, Tehran, Ankara and Washington. Syrians, from the leaflet-writers of 1919 to the documenters of 2011, kept insisting that the country's history was theirs to make.

```checkpoint
q: What is Lisa Wedeen's argument about the Assad personality cult?
a: That most Syrians sincerely revered Hafez al-Assad.
x: Wedeen argues the cult worked without belief, through acting "as if".
a*: That it worked as a disciplinary device, making citizens act as if they revered their leader.
a: That the cult was imposed by Soviet advisers.
x: Wedeen analyses the cult as a Syrian instrument of rule, not a foreign import.
a: That it had no political effect at all.
x: She argues it enforced compliance and isolated citizens through public dissimulation.
hint: Think of the phrase "politics of as if".
why: Her point is that domination did not need belief; requiring public performance was enough.
---
q: What did Selby, Dahi, Fröhlich and Hulme conclude about the drought and the 2011 uprising?
a: That climate change made the drought two to three times more likely and caused the war.
x: That was the argument of Kelley and colleagues (2015), which Selby and his co-authors challenged.
a: That there had been no drought at all.
x: The drought of 2006–07 to 2010 was the worst on instrumental record; they disputed its causes and effects.
a: That 1.5 million drought migrants started the uprising.
x: They argued that migration was far smaller than claimed.
a*: That there was no sound basis for blaming the drought on climate change, and no evidence it contributed to the war's onset.
hint: Think of who answered the 2015 climate argument.
why: Most historians weigh repression, crony liberalisation, unemployment and the Arab Spring's example alongside any environmental stress.
```

## Further exploration

- **Philip S. Khoury, *Syria and the French Mandate: The Politics of Arab Nationalism, 1920–1945* (1987).** The classic study of the urban notables and the National Bloc.
- **Michael Provence, *The Great Syrian Revolt and the Rise of Arab Nationalism* (2005).** The revolt seen from the countryside and its former Ottoman officers.
- **Patrick Seale, *Asad of Syria: The Struggle for the Middle East* (1988).** A biography of Hafez al-Assad written with access to its subject.
- **Lisa Wedeen, *Ambiguities of Domination: Politics, Rhetoric, and Symbols in Contemporary Syria* (1999).** How the Assad cult worked through the "politics of as if".
- **Salwa Ismail, *The Rule of Violence: Subjectivity, Memory and Government in Syria* (2018).** Prisons, massacres and the memory of Hama, from Syrians' own testimony.
- **Yassin al-Haj Saleh, *The Impossible Revolution: Making Sense of the Syrian Tragedy* (2017).** A former political prisoner on the revolution and the war.
- **Robin Yassin-Kassab and Leila Al-Shami, *Burning Country: Syrians in Revolution and War* (2016).** The revolution told through Syrian testimonies.$mn_syria_master$,
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
  select $mn_syria_quiz$[
    {"type": "mcq", "prompt": "Who proclaimed Faisal king of the Arab Kingdom of Syria on 8 March 1920?", "options": ["The Syrian National Congress", "The League of Nations", "General Gouraud", "The Ottoman sultan"], "answerIndex": 0, "explanation": "The Syrian National Congress, first convened in 1919 and later presided over by Hashim al-Atassi, proclaimed Faisal king and rejected a French mandate; the kingdom ended after the French victory at Maysalun on 24 July 1920.", "id": "q1"},
    {"type": "mcq", "prompt": "Which estimate range for the dead at Hama in February 1982 does the chapter give?", "options": ["Fewer than 1,000", "Exactly 38,000", "From 5,000 to 40,000", "About 350,000"], "answerIndex": 2, "explanation": "Estimates range from 5,000 to 40,000: Amnesty International first estimated 10,000–25,000, Robert Fisk 10,000 and later 20,000, and the Syrian Human Rights Committee 25,000 or 30,000–40,000.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the 1962 census in Hasakah province do?", "options": ["It gave Kurdish official status as a national language", "It created the Autonomous Administration of North and East Syria", "It recorded Kurds as a majority of Syria's population", "It stripped about 120,000 Kurds of Syrian citizenship"], "answerIndex": 3, "explanation": "About 120,000 Kurds were classed as 'foreigners' or left unregistered. Kurds make up 5–10 per cent of Syrians; Kurdish was recognised as a national language only by decree under the post-Assad government.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Lisa Wedeen mean by the 'politics of as if' in Hafez al-Assad's Syria?", "options": ["Syrians sincerely believed the regime's claims about its leader", "The personality cult worked by making citizens act as if they revered their leader, whether or not they believed it", "The regime pretended to be democratic in order to win Western aid", "Opposition parties acted as if they were loyal while planning a coup"], "answerIndex": 1, "explanation": "Wedeen argues the cult was a disciplinary device generating public dissimulation; compliance, not belief, was what it required.", "id": "q4"},
    {"type": "open", "prompt": "Was the Assad regime best understood as sectarian (Alawite) rule? Use the arguments of historians named in the chapter and evidence from 1920 to 2025.", "rubric": "A strong answer traces minority recruitment into France's Army of the Levant (1926–39); notes that the Ba'th Military Committee of 1963 (Umran, Jadid, Assad) were Alawites and that Alawites held a near-monopoly of security posts under Hafez, while Sunnis such as Tlass held high but dependent office; and contrasts van Dam (sectarian, regional and tribal loyalties) with Batatu (the rural 'lesser notables' and peasants as the Ba'th's base, while examining Alawite officers), the 'great debate' over a rural or Alawite character. It should note that most Alawites stayed relatively poor and that the 2025 coastal massacres showed the danger of equating 'regime' with 'Alawite', and reach a balanced judgement.", "id": "q5"},
    {"type": "open", "prompt": "Was the conflict that began in Syria in 2011 a revolution, a civil war or a proxy war?", "rubric": "A strong answer describes the uprising's origins (the Daraa graffiti and arrests of early 2011, chants of 'peaceful, peaceful' and 'we want dignity', the Local Coordination Committees and Razan Zaitouneh's documentation work) and the Syrian voices that insist on its revolutionary, civic character (al-Haj Saleh, Yazbek, Yassin-Kassab and Al-Shami). It traces militarisation (the Free Syrian Army, al-Nusra and HTS, the Islamic State, the Kurdish-led SDF) and foreign intervention (Iran and Hezbollah from 2013, Russia from 2015, Turkey and the US-led coalition), and weighs the causes debate (Kelley et al. on drought against Selby et al.; repression, crony liberalisation, unemployment). Good answers conclude that the labels describe different phases and perspectives rather than excluding one another.", "id": "q6"}
  ]$mn_syria_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/middle-east/a-history-of-modern-syria', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
