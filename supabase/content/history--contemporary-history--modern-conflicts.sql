-- Modern Conflicts since 1991 — canonical master article, co-written and human-reviewed.
-- history/contemporary-history/modern-conflicts-since-1991 @ research/advanced/read.
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
    'history/contemporary-history/modern-conflicts-since-1991',
    'research',
    'advanced',
    'read',
    $mn_conflicts_master$> **War after the Cold War.** The end of the Cold War brought hopes of a "new world order", yet for millions of people the decades since 1991 have been years of war, flight and mass killing. This chapter follows the Gulf War and the fate of Iraq's Kurds and Shia; Srebrenica, Rwanda and the war in Congo; Chechnya; the September 11 attacks and the long wars in Afghanistan and Iraq; the rise and fall of the Islamic State; the Arab Spring and the wars in Libya, Syria and Yemen; Darfur, Sudan and Tigray; Russia's wars in Georgia and Ukraine; and, briefly, Gaza since October 2023. It asks how war itself changed, why the dead are so hard to count, and what is at stake for civilians, refugees and the great powers. Every death toll is an estimate with its source, and figures after 2024 are provisional.

## A New World Order? The Gulf War, 1990–91

The *Global Cold War and the Arms Race* chapter ends with the dissolution of the Soviet Union on 26 December 1991. The first great war of the new era had already been fought. On 2 August 1990 Iraq invaded Kuwait. The UN Security Council demanded withdrawal that day (Resolution 660), imposed a total embargo on 6 August (Resolution 661), and on 29 November authorised "all necessary means" if Iraq had not left Kuwait by 15 January 1991 (Resolution 678).

A US-led coalition of 42 countries, the broadest military alliance since the Second World War, gathered; its largest contributors were the United States, Saudi Arabia, Britain and Egypt. Operation Desert Storm opened with an air campaign on 17 January 1991; the ground offensive began on 24 February, a ceasefire came within 100 hours, and Kuwait was liberated on 28 February. Casualty figures vary widely: the coalition lost 292 killed; over 1,000 Kuwaiti civilians were killed and 600 went missing; estimates of Iraqi military dead run from 20,000 to 50,000, and 3,664 Iraqi civilians were killed directly. The organisation Medact put total Iraqi losses, including the uprisings that followed, at 142,500–206,000.

Gorbachev had used the phrase "new world order" earlier, in his 1988 UN speech, meaning nuclear disarmament, a stronger UN and great-power co-operation. President George H. W. Bush made it his own.

```quote
Out of these troubled times, our fifth objective — a new world order — can emerge: a new era — freer from the threat of terror, stronger in the pursuit of justice, and more secure in the quest for peace.
George H. W. Bush · Address to a joint session of Congress · 11 September 1990
```

For Iraqis the new order looked different. On 15 February 1991 Bush urged "the Iraqi military and the Iraqi people to take matters into their own hands and force Saddam Hussein, the dictator, to step aside". In March, Shia Arabs in the south and Kurds in the north rose and took most of Iraq's cities within two weeks. The Republican Guard crushed them, and the United States did not intervene in the south, leaving a legacy of mistrust among Shia Arabs. Estimates of the dead, mostly civilians, range from 25,000 to 180,000. Nearly two million Iraqis fled, 1.5 million of them Kurds. Security Council Resolution 688 condemned the repression, and Operation Provide Comfort protected and fed Kurdish refugees. The northern no-fly zone made possible a semi-autonomous Kurdistan Region.

## Safe Areas That Were Not Safe: Somalia and Bosnia

The UN intervened in Somalia to relieve the famine of 1992, but in the Battle of Mogadishu on 3–4 October 1993 eighteen US soldiers and, by most estimates, between about 200 and 700 Somalis, fighters and civilians, were killed, and the UN mission's military operations ended.

Yugoslavia's wars of 1991–2001 are told in more detail in *Collapse of the Soviet Union and Eastern Europe: the End of the Cold War*. They killed between 130,000 (Humanitarian Law Center) and 140,000 (International Center for Transitional Justice) people, slightly over half of them civilians, and displaced some four million. In Bosnia the Research and Documentation Center in Sarajevo counted 101,040 dead or disappeared by 2012: 62,013 Bosniaks, 24,953 Serbs and 8,403 Croats.

The war's emblem is **Srebrenica**. In July 1995 the Army of Republika Srpska under Ratko Mladić overran this UN-declared "safe area", defended by 370 lightly armed Dutch peacekeepers. It killed more than 8,000 Bosniak men and boys and forcibly removed 25,000–30,000 Bosniaks, mainly women and children. The list of the missing and killed holds 8,372 names. Kofi Annan, the UN Secretary-General, called it in 2005 "a terrible crime – the worst on European soil since the Second World War". The international tribunal (2004) and the International Court of Justice (2007) ruled it genocide, and Karadžić and Mladić were convicted of genocide and sentenced to life imprisonment.

In Kosovo in 1998–99, an estimated 800,000 Kosovo Albanians fled and 7,000–9,000 were killed by Yugoslav forces, according to figures cited by the *New York Times*. NATO bombed Yugoslavia from 24 March 1999 without Security Council authorisation. An independent international commission concluded that "the NATO military intervention was illegal but legitimate".

## Rwanda and Africa's Great War

Rwanda's genocide took place during a civil war that began in 1990, when the Rwandan Patriotic Front (RPF), a predominantly Tutsi rebel army, invaded from Uganda. On 6 April 1994 President Habyarimana's plane was shot down. For about a hundred days, from 7 April to 19 July, the army, the Presidential Guard, the gendarmerie and the *interahamwe* militias, aided by local people, killed Tutsi, and moderate Hutu and Twa. Victims were often murdered by their neighbours. Roadblocks checked identity cards that recorded ethnicity, and anyone holding a Tutsi card was killed.

The toll is debated. Most scholarly estimates put the Tutsi dead at between about 500,000 and 662,000; Human Rights Watch counted 507,000, and a 2020 symposium in the *Journal of Genocide Research* concluded 500,000–600,000, about two-thirds of Rwanda's Tutsi. The Rwandan government counts 1,074,017 victims, 94 per cent of them Tutsi, a figure the symposium judged not credible. Between 250,000 and 500,000 women were raped, and about 400,000 children were orphaned.

The UN force, UNAMIR, under Roméo Dallaire, had only a limited mandate, and his request to raid arms caches was refused; it still sheltered thousands at the Amahoro Stadium. The French-led Opération Turquoise from 23 June was not able to save significant numbers of lives. The RPF took Kigali on 4 July, and the génocidaires fled, mostly into Zaire, amid some two million Rwandan refugees, mostly Hutu.

Rwanda's community *gacaca* courts tried 1,958,634 cases before closing in 2012, but did not try crimes by the RPF. A UNHCR team led by Robert Gersony concluded in 1994 that the RPF had killed "between 25,000 and 45,000 persons" from April to August; the UN suppressed his findings, and a summary leaked only in 2010. Alison Des Forges estimated about 30,000 killed by the RPF. The Rwandan government denied the allegations, and Kagame attributed killings to "rogue soldiers". Scott Straus's interviews with perpetrators argue that war and state power, not ancient hatreds, drove the genocide.

Next door came the **Second Congo War** (1998–2003), "Africa's World War". It began when Laurent-Désiré Kabila turned on his Rwandan and Ugandan backers, and drew in nine African states and about 25 armed groups. The International Rescue Committee estimated 5.4 million excess deaths from 1998 to 2007, mostly from disease and malnutrition; the Human Security Report Project (2010) argued that the early surveys were unreliable and the later ones used too low a baseline death rate, revising excess deaths for 2001–07 to about 860,000. Violence continued in the Kivus and Ituri.

```checkpoint
q: Which statement best reflects scholarly estimates of the Tutsi killed in the Rwandan genocide of 1994?
a*: Most scholarly estimates fall between about 500,000 and 662,000, while the Rwandan government counts over one million.
a: Exactly 1,074,017, a figure accepted by all researchers.
x: That is the Rwandan government's count; a 2020 scholarly symposium judged it not credible.
a: About 50,000, mostly soldiers killed in the civil war.
x: The victims were overwhelmingly civilians, and the numbers were ten times higher or more.
a: Between 5 and 6 million, most of them from disease.
x: That confuses Rwanda with the International Rescue Committee's estimate for the Congo wars.
hint: Compare Human Rights Watch, the Journal of Genocide Research symposium and the government.
why: Death tolls are estimates whose range depends on method and source, so they should be given with their sources.
---
q: Why was the Second Congo War's death toll disputed?
a: Because no organisation ever tried to estimate it.
x: The International Rescue Committee published repeated mortality surveys.
a: Because the war killed almost no civilians.
x: Most estimated deaths were civilians dying of disease and malnutrition.
a*: Because the Human Security Report Project argued that the IRC's early surveys were unreliable and its later ones used too low a baseline, revising excess deaths for 2001–07 to about 860,000.
a: Because the war lasted only a few weeks.
x: It ran from 1998 to 2003, and violence continued afterwards in the east.
hint: Think about how "excess deaths" are calculated.
why: Excess-mortality estimates depend heavily on what death rate is assumed for peacetime.
```

## Chechnya

Russia fought its own wars in Chechnya. In the first (1994–96), Yeltsin sent the army to "establish constitutional order"; 30,000–100,000 Chechen civilians died and more than half a million were displaced. The second began in 1999, after apartment bombings in Russian cities killed over 300 people; they were blamed on Chechens, though no Chechen claimed them. In 2003 the UN called Grozny "the most destroyed city on Earth". Total deaths in the second war are estimated at 50,000–80,000. The Beslan school siege of 2004 left at least 334 dead.

## September 11 and Afghanistan, 2001–2021

On 11 September 2001 nineteen al-Qaeda hijackers seized four airliners. Two struck the Twin Towers in New York and one the Pentagon; the fourth crashed in Pennsylvania after its passengers revolted. The attacks killed 2,977 victims from more than 90 countries, the deadliest terrorist attack in history. NATO invoked its mutual-defence clause, Article 5, for the only time.

The US-led invasion of Afghanistan, with the Northern Alliance, toppled the Taliban, who had refused to hand over bin Laden without evidence. A Taliban insurgency was under way by 2003, and roadside bombs became its main weapon. Foreign troops peaked at about 140,000 in 2011, the year bin Laden was killed in Pakistan. After a US–Taliban deal in 2020, the Taliban took Kabul on 15 August 2021, and the last US aircraft left on 30 August, ending the longest war in US history.

Afghans paid most. The Costs of War Project at Brown University puts total deaths at 176,000–212,000 or more, including 46,319 civilians; IPPNW and PSR estimated 106,000–170,000 civilian deaths. When Kabul fell, 2.6 million Afghans were still refugees and 4 million were displaced at home. These are not the dead of the Soviet war of 1979–89, which the Cold War chapter describes.

## Iraq, 2003–2011, and the Counting of the Dead

The invasion of Iraq began on 20 March 2003. Its justification, that Iraq held weapons of mass destruction and supported al-Qaeda, collapsed: no stockpiles were found, and the 9/11 Commission found no credible link between Saddam and al-Qaeda. Occupation slid into insurgency and sectarian civil war; US withdrawal was completed in 2011. Coalition military dead numbered 4,826, of whom 4,508 were American.

Iraqi deaths are the most disputed of the era, and the dispute is a lesson in method. Iraq Body Count, compiling deaths from media, NGO and official records, counts 186,901–210,296 violent civilian deaths from March 2003 to 2023, including the war against the Islamic State, and warns that it may miss many. Household surveys reached higher figures: the Iraq Family Health Survey estimated 151,000 violent deaths to June 2006, while a 2006 *Lancet* study estimated 654,965 excess deaths in the same period. Overall estimates run from about 150,000 to over a million. Across all the post-9/11 war zones, the Costs of War Project estimates 905,000–940,000 people killed directly, 3.6–3.8 million indirectly (using an assumed ratio of four indirect deaths per direct one) and 38 million displaced.

## The Rise and Fall of the Islamic State

From the wreckage came the Islamic State. It grew out of al-Qaeda in Iraq, openly expanded into the Syrian war in 2013, and in 2014 declared a worldwide caliphate. In June 2014 a few thousand of its fighters (estimates run from 1,500 to 5,500) took Mosul from an Iraqi force nominally 60,000 strong but hollowed out by "ghost soldiers"; about 500,000 civilians fled. At its height it ruled, by different estimates, some 8 to 12 million people.

Its cruelty was deliberate and filmed: beheadings, destruction of cultural sites, persecution of Christians, Shia and Mandaeans, and attacks abroad. From August 2014, at Sinjar, it attacked the Yazidis, a Kurdish-speaking religious minority who call it the "74th firman". The UN reports about 5,000 Yazidis killed and some 6,000–7,000 women and girls abducted; a 2017 survey estimated up to 10,800 abducted in all. YPG and PKK fighters opened an escape corridor from Mount Sinjar, and the UN, the European Parliament, the United States and Iraq, among others, recognise the crime as genocide.

The battle for Mosul (October 2016 – July 2017), called the toughest urban battle since the Second World War, killed 9,606–11,000 residents by an Associated Press count; Amnesty International attributed 5,805 civilian deaths in four months to Iraqi and coalition strikes. The caliphate lost its last territory at Baghuz in March 2019, and its leader, Baghdadi, died in a US raid that October. Affiliates still held territory in the Sahel in 2025.

## The Arab Spring and Its Wars

On 17 December 2010 Mohamed Bouazizi, a Tunisian fruit seller whose goods had been confiscated, set himself alight. Within weeks Tunisia's Ben Ali had fled and, after 18 days of protest, Egypt's Mubarak resigned. Crowds chanted *ash-shaʻb yurīd isqāṭ an-niẓām*, "the people want to bring down the regime". Hope gave way to an "Arab Winter": Egypt's elected president Morsi was removed in 2013, and civil wars broke out in Libya, Syria and Yemen.

In **Libya** the Security Council authorised "all necessary measures" to protect civilians in March 2011. NATO bombing helped the rebels, and Gaddafi was captured and killed on 20 October. Death estimates are inconsistent, and militias' refusal to disarm led to a second civil war.

**Syria**'s was the longest and deadliest of these wars. Peaceful protests from March 2011 met lethal force; Iran, Hezbollah and Russia intervened for Assad, while Turkey, Qatar and the United States backed rebels. On 21 August 2013 Assad's forces attacked Ghouta with sarin, killing an estimated 281–1,729 people. The UN documented at least 350,209 identified people killed from 2011 to 2021, "certainly an under-count"; estimates based on the Syrian Observatory for Human Rights reached about 656,000 by March 2025. Of a pre-war population of about 22 million, 6.7 million were refugees by December 2022, Turkey hosting the most, and 13 million were displaced overall. Assad fled to Moscow on 8 December 2024 after a rebel offensive led by HTS, but violence continued: the Syrian Observatory recorded 1,614 civilians killed in massacres of Alawites in March 2025, adding that the real number was much higher (provisional).

In **Yemen** the Houthis took Sanaa in 2014 and a Saudi-led coalition intervened in March 2015, in a war widely seen as part of the Saudi–Iranian rivalry. The UN counts over 150,000 killed in fighting and estimates of more than 227,000 dead from famine and lack of health care; a UN Development Programme projection put total deaths at 377,000 by the end of 2021. A UN-brokered truce began in April 2022.

## Sudan, Darfur and Tigray

Some of the deadliest wars drew the least attention. In **Darfur** from 2003, the Sudanese government answered rebels drawn largely from the non-Arab Fur, Zaghawa and Masalit peoples with ethnic cleansing by the Janjaweed militia. The UN estimated 300,000 dead (the government said 10,000) and about three million displaced; the ICC issued an arrest warrant for President Omar al-Bashir in 2009. Sudan's civil war since April 2023, between the army and the RSF, had displaced over 14 million people by July 2026; deaths are highly uncertain and could exceed 150,000–400,000, and famine has been confirmed in several regions (all provisional). In January 2025 the US government determined that the RSF and allied militias had committed genocide. After El Fasher fell to the RSF in October 2025, one estimate put the dead at 60,000–70,000, and satellite-based estimates ran as high as 150,000; these figures are very uncertain. In Ethiopia's **Tigray war** (2020–22), fought by federal and Eritrean forces against the TPLF with massacres by all sides, between 100,000 and 600,000 people were killed.

## Russia's Wars: Georgia, Crimea and Ukraine

In August 2008, after South Ossetian shelling of Georgian villages, Georgia attacked Tskhinvali on the night of 7–8 August and Russia launched a full invasion on 8 August, later recognising Abkhazia and South Ossetia. About 192,000 people were displaced, and Georgians were ethnically cleansed from South Ossetia. An EU report found that hostilities began with a large Georgian operation, but that there was "no way to assign overall responsibility for the conflict to one side alone".

In February 2014, after Ukraine's Euromaidan protests and President Yanukovych's ouster, Russian forces without insignia seized Crimea, which Russia annexed on 18 March after a referendum held under occupation: the first annexation of part of a European state by another since the Second World War. Russian-backed forces seized parts of the Donbas; on 17 July 2014 their forces shot down the airliner MH17, killing 298. The UN counted 14,200–14,400 killed there by the end of 2021, including 3,404 civilians.

On 24 February 2022 Russia launched a full-scale invasion, which it called a "special military operation". Its forces retreated from around Kyiv by April, revealing the massacre at Bucha; Mariupol fell after a siege. In March 2023 the ICC issued an arrest warrant for Putin over the deportation of children. As of August 2026 Russia occupied roughly a fifth of Ukraine, and peace negotiations had stalled.

All figures for this war are provisional. The UN human rights office had verified 17,257 civilians killed by 31 August 2026 and believes the true number is higher. Military losses are state secrets, and governments publish self-serving figures and independent estimates are partial or modelled: BBC Russian and Mediazona estimated 518,224–633,384 Russian forces killed (to November 2026; 285,881 confirmed by name, excluding the separatist militias); the name-based project UALosses counted 106,285 Ukrainian soldiers killed and 105,786 missing (to October 2026), and CSIS estimated 125,000–150,000 Ukrainian military dead (to July 2026). UNHCR recorded 5.7 million Ukrainian refugees in September 2025, and some 6–7 million had fled the country in all, in Europe's largest refugee crisis since the Second World War. In May 2022 Finland and Sweden applied to join NATO.

```checkpoint
q: What did the EU's 2009 (Tagliavini) report conclude about the Russo-Georgian war of 2008?
a: That Russia alone started the war without any prior fighting.
x: The report found that open hostilities began with a large Georgian operation against Tskhinvali.
a*: That hostilities began with a Georgian operation against Tskhinvali, but there was no way to assign overall responsibility to one side alone.
a: That the war never involved Russian troops.
x: Russia launched a full invasion on 8 August 2008.
a: That NATO had invaded Georgia.
x: NATO was not a party to the war; a ceasefire was brokered by France's President Sarkozy.
hint: The report refused to blame one side alone.
why: Official inquiries often distribute responsibility, and their exact wording matters.
---
q: Why must military death tolls in the Russo-Ukrainian war be treated with particular caution?
a: Because no estimates have ever been published.
x: Several organisations publish estimates, including BBC Russian with Mediazona and CSIS.
a: Because both governments publish full, audited casualty lists.
x: Military losses are state secrets on both sides.
a: Because the war ended in 2022.
x: As of 2026 the war continued and peace talks had stalled.
a*: Because losses are state secrets, governments publish self-serving figures and independent counts are partial or modelled, and the figures are still changing.
hint: Who knows the real figures, and who publishes them?
why: Figures for ongoing wars are provisional and must be dated and attributed.
```

## Israel and Gaza since October 2023

On 7 October 2023 a Hamas-led attack on Israel killed 1,195 Israelis and foreign nationals, at least 815–828 of them civilians (an AFP tally cited by Human Rights Watch), and took 251 hostages. Israel's air campaign and ground invasion followed. The Gaza Health Ministry reported 74,370 Palestinians killed as of 9 October 2026, without separating combatants from civilians; a *Lancet* study in January 2025 suggested the ministry's count underestimated traumatic deaths. In January 2026 senior Israeli military officials were reported to estimate about 70,000 Gazans killed, while the IDF said it was still analysing the data; it has claimed some 22,000 combatants killed before the October 2025 ceasefire, a figure not independently verified. Israel's Defense Ministry reported 1,152 security personnel killed on all fronts from 7 October 2023 to October 2025, including on that day. Nearly all of Gaza's 2.3 million people were displaced. South Africa brought a genocide case against Israel at the International Court of Justice; a UN Commission of Inquiry concluded in September 2025 that four of the five acts defined as genocide had been committed, while Israel and its supporters, including the United States, reject the charge. All these figures are provisional.

## The Changing Character of War

Mary Kaldor's *New and Old Wars* (1999) argued that post-Cold War "new wars" are fought by shifting networks of state and non-state forces, in the name of identity rather than ideology, controlling populations through fear and financed by predatory economies. Critics replied that much of this is not new: De Waal saw wars in weakly governed states, and Edward Newman found historical precedents, though he granted that Bosnia fits.

Technology changed too. The United States made "targeted killing" by drone, outside any judicial procedure, a routine instrument. The Bureau of Investigative Journalism counted 429 CIA strikes in Pakistan up to about 2017, killing 2,514–4,023 people, of whom 424–969 were civilians; US officials disputed the civilian figures, and researchers warned that trackers might undercount. Defenders call drones more humane and accurate; critics point to secrecy, and a 2016 order requiring annual reports of civilian deaths was revoked in 2019. Then cheap drones spread: drones were prominent in the 2020 war between Azerbaijan and Armenia, and in Ukraine small first-person-view drones dominate the front.

## Protection, Law and the Question of Decline

Rwanda and Srebrenica forced a question that Kofi Annan put in 2000.

```quote
if humanitarian intervention is, indeed, an unacceptable assault on sovereignty, how should we respond to a Rwanda, to a Srebrenica—to gross and systematic violations of human rights that offend every precept of our common humanity?
Kofi Annan · Millennium Report · 2000
```

The answer was the **Responsibility to Protect** (R2P), proposed by a Canadian-sponsored commission in 2001 and endorsed unanimously at the 2005 World Summit, with force permitted only through the Security Council. In 2011 the Security Council invoked it to authorise force in Libya; Russia and China, saying it had become regime change, later vetoed resolutions on Syria. Iraq raised the opposite problem. Annan said in 2004 that "From our point of view and the UN Charter point of view, it [the war] was illegal", while its supporters relied on earlier Security Council resolutions; Britain's Chilcot report (2016) called the process of establishing the legal basis "far from satisfactory" and found that peaceful options had not been exhausted.

Has violence declined? Steven Pinker's *The Better Angels of Our Nature* (2011) argued that it has, thanks to states, commerce, literacy and reason. Taleb and Cirillo found no decline in the lethality of war once its rare catastrophic events are allowed for; Aaron Clauset (2018) found the "long peace" plausibly a matter of chance; and Bear Braumoeller's *Only the Dead* (2019) found no consistent trend except fewer uses of force between states since the Cold War. Congo, Syria, Sudan and Ukraine are the test cases, and for the people living through them the question is not abstract.

## Further exploration

- **Mary Kaldor, *New and Old Wars: Organized Violence in a Global Era* (1999).** The influential and contested "new wars" thesis.
- **Scott Straus, *The Order of Genocide: Race, Power, and War in Rwanda* (2006).** Interviews with perpetrators show how war and state power drove the killing.
- **Jason K. Stearns, *Dancing in the Glory of Monsters: The Collapse of the Congo and the Great War of Africa* (2011).** The Congo wars told through interviews with their protagonists.
- **Ali A. Allawi, *The Occupation of Iraq: Winning the War, Losing the Peace* (2007).** An Iraqi minister's history of the occupation.
- **Carter Malkasian, *The American War in Afghanistan: A History* (2021).** A comprehensive history by a former adviser.
- **Yassin al-Haj Saleh, *The Impossible Revolution: Making Sense of the Syrian Tragedy* (2017).** A Syrian dissident and former political prisoner on the revolution and the war.
- **Serhii Plokhy, *The Russo-Ukrainian War: The Return of History* (2023).** A history of the war that won the Arenberg Prize in 2024.$mn_conflicts_master$,
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
  select $mn_conflicts_quiz$[
    {"type": "mcq", "prompt": "What did the Independent International Commission on Kosovo conclude about NATO's 1999 bombing of Yugoslavia?", "options": ["That it was legal because the Security Council had authorised it", "That the NATO military intervention was illegal but legitimate", "That it was both illegal and illegitimate", "That it had been requested by Serbia"], "answerIndex": 1, "explanation": "NATO bombed from 24 March 1999 without Security Council authorisation; the commission judged the intervention 'illegal but legitimate', a formula central to later debates on humanitarian intervention.", "id": "q1"},
    {"type": "mcq", "prompt": "Which estimate of the Second Congo War's death toll did the Human Security Report Project (2010) propose after criticising the International Rescue Committee's baseline death rate?", "options": ["About 860,000 excess deaths", "5.4 million excess deaths", "About 50,000 deaths", "Over 20 million deaths"], "answerIndex": 0, "explanation": "The IRC estimated 5.4 million excess deaths (1998–2007); the Human Security Report Project argued the early surveys were unreliable and the later baseline too low, revising 2001–07 excess deaths to about 860,000.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these Iraq War death estimates comes from a body count rather than a population survey?", "options": ["The 2006 Lancet study's 654,965 excess deaths", "The Iraq Family Health Survey's 151,000 violent deaths", "The 2013 PLOS Medicine study's estimate of about 461,000 deaths", "Iraq Body Count's 186,901–210,296 violent civilian deaths (2003–2023)"], "answerIndex": 3, "explanation": "Iraq Body Count compiles deaths from media, NGO and official records, giving a minimum; the Lancet, IFHS and PLOS Medicine figures come from household surveys.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the UN, roughly how many Yazidis were killed, and how many women and girls trafficked, by the Islamic State from August 2014?", "options": ["About 500 killed and 1,000 trafficked", "About 50,000 killed and 100,000 trafficked", "About 5,000 killed and thousands of women and girls abducted", "No Yazidis were killed; they were only displaced"], "answerIndex": 2, "explanation": "The UN reports about 5,000 Yazidis killed and some 6,000–7,000 women and girls abducted (a 2017 survey estimated up to 10,800); the crime has been recognised as genocide by the UN, the European Parliament, the United States, Iraq and others.", "id": "q4"},
    {"type": "open", "prompt": "Why are the death tolls of wars since 1991 so contested? Use at least two examples.", "rubric": "A strong answer distinguishes methods: body counts that give minimums (Iraq Body Count's 186,901–210,296 violent civilian deaths; the UN's 350,209 identified dead in Syria, 'certainly an under-count'; OHCHR's 17,257 verified civilian deaths in Ukraine to August 2026); population surveys (Iraq Family Health Survey 151,000 violent deaths; the 2006 Lancet study's 654,965 excess deaths, later criticised); and excess-mortality models (IRC's 5.4 million for Congo against the Human Security Report Project's ~860,000; Costs of War's assumed four indirect deaths per direct death). It may note interested sources (Rwanda's government count of 1,074,017 against scholarly estimates of about 500,000–662,000; Ukrainian and Russian military losses as state secrets) and conclude that figures should be given as attributed, dated ranges, with post-2024 figures provisional.", "id": "q5"},
    {"type": "open", "prompt": "Did the failures of Rwanda and Srebrenica change how the international community responds to mass atrocities? Discuss with reference to the Responsibility to Protect.", "rubric": "A good answer explains the failures: UNAMIR's limited mandate and refused request to raid arms caches; Opération Turquoise saving few lives; 370 Dutch peacekeepers unable to protect the Srebrenica 'safe area', where more than 8,000 Bosniak men and boys were killed. It cites Annan's 2000 question and the Responsibility to Protect (2001 commission; unanimous endorsement at the 2005 World Summit; force only via the Security Council). It weighs outcomes: Kosovo as 'illegal but legitimate'; Libya 2011, where the Security Council invoked it to authorise force, which Russia and China said became regime change, followed by vetoes on Syria; continued mass killing in Syria, Darfur, Sudan and Tigray. Strong answers reach a balanced judgement.", "id": "q6"}
  ]$mn_conflicts_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/contemporary-history/modern-conflicts-since-1991', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
