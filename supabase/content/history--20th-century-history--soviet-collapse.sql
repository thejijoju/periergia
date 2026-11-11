-- Collapse of the Soviet Union and Eastern Europe: the End of the Cold War — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/collapse-of-the-soviet-union-and-eastern-europe-the-end-of-the-cold-war @ research/advanced/read.
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
    'history/20th-century-history/collapse-of-the-soviet-union-and-eastern-europe-the-end-of-the-cold-war',
    'research',
    'advanced',
    'read',
    $mn_collapse_master$> **How an empire came apart, mostly without a war.** Between 1985 and 1991 the communist order in Eastern Europe and the Soviet Union dissolved. Mikhail Gorbachev set out to repair the Soviet system and instead loosened its grip, but many of the decisive moves were made by others: Polish shipyard workers, Hungarian reformers, East German churchgoers, Czech students, Armenian and Baltic crowds, Ukrainian voters. This chapter follows the road from the Brezhnev Doctrine to the "Sinatra Doctrine", the revolutions of 1989, German reunification, the Baltic drive for independence and the end of the USSR in 1991; then shock therapy, the enlargement of NATO and the EU, and Yugoslavia's wars; and the debates over who, or what, ended the Cold War.

## Glasnost and Perestroika

In March 1985 the Politburo elected its youngest member, **Mikhail Gorbachev**, 54, as general secretary. His first aim was to revive a stagnating economy, and he came to believe that this required political reform too. *Glasnost*, "openness", was an old Russian word that he turned into a slogan. *Perestroika*, "restructuring", a term popularised in this sense by the sociologist Tatyana Zaslavskaya, was meant not to abolish the planned economy but to make socialism work. Perestroika worsened shortages, and critics called it *katastroika*.

As the chapter on the Soviet Union describes, the Chernobyl disaster of April 1986 tested glasnost from the start; Gorbachev later wrote that Chernobyl, "even more than my launch of perestroika, was perhaps the real cause of the collapse of the Soviet Union." In December 1986 Andrei Sakharov returned to Moscow from almost seven years of internal exile. The Moscow party chief **Boris Yeltsin** attacked the slow pace of reform in October 1987, was sacked, and began to remake himself as a rebel. In 1988 a party conference approved an elected legislature, the Congress of People's Deputies. Its first session, in May and June 1989, was broadcast live and uncensored and transfixed the population.

## The Nations Speak First

Glasnost let the non-Russian nations speak, and they spoke before Moscow's satellites did. The chapter on the Soviet Union recounts the Jeltoqsan protests in Alma-Ata in December 1986 and the killing of 21 demonstrators, mostly women, in Tbilisi in April 1989. The Jeltoqsan death toll is still disputed, from an official 2 to at least 200 in sources cited by the US Library of Congress.

In July 1987 some 300 Crimean Tatars demonstrated near the Kremlin for the right to return to the homeland from which they had been deported in 1944. In June 1988 spontaneous night-time singing at the Tallinn Song Festival Grounds gave the Baltic movement its name, the **Singing Revolution**. Popular fronts formed in all three Baltic republics that year, among them Lithuania's Sąjūdis, and on 16 November 1988 Estonia declared that its laws took precedence over Soviet law, the first such declaration of sovereignty.

The Caucasus showed both the hope and the danger. In February 1988 the regional soviet of Nagorno-Karabakh voted to join Armenia, and within days close to a million people, more than a quarter of Armenia's population, were demonstrating peacefully in Yerevan. Violence followed. In the Sumgait pogrom against Armenians that month, 32 people died according to Soviet officials and more than 200 according to Armenian sources; Armenia's Azerbaijani minority, some 160,000–200,000 people, was driven out, mostly in late 1988. The First Nagorno-Karabakh War, which lasted until 1994, displaced about 724,000 Azerbaijanis and 300,000–500,000 Armenians.

Workers and believers moved too. In July 1989 coal miners struck in the Kuzbass, the Donbas and Vorkuta and won concessions, and in July 1990 they founded the Independent Union of Miners, the USSR's first independent trade union. In Ukraine, 10,000 Greek Catholics gathered at Zarvanytsia in July 1988, the largest gathering since their church was outlawed in 1946.

## From the Brezhnev Doctrine to the Sinatra Doctrine

The **Brezhnev Doctrine** had justified the invasion of Czechoslovakia in 1968. Gorbachev abandoned it in stages. At the United Nations on 7 December 1988 he announced unilateral cuts of 500,000 in the Soviet armed forces, including withdrawals from Eastern Europe, and declared that "freedom of choice is a universal principle to which there should be no exceptions." In July 1989 he told the Council of Europe that "any interference in domestic affairs" of states, "friends, allies or any others", was inadmissible, without naming the doctrine he was burying. (The summits and arms treaties of these years belong to the chapter on the Global Cold War and the Arms Race.)

The burial was announced with a joke. In Helsinki on 25 October 1989, two days after a speech by Eduard Shevardnadze, the Foreign Ministry spokesman Gennadi Gerasimov gave the new policy a name.

```quote
We now have the Frank Sinatra doctrine. He has a song, 'I Did It My Way'. So every country decides on its own which road to take.
Gennadi Gerasimov · Helsinki · 25 October 1989
```

Asked whether this included rejecting communist parties, he said that "political structures must be decided by the people who live there." The **Sinatra Doctrine** was retrospective: Poland had installed a non-communist government a month earlier. When East Germany's rulers hoped for Soviet help that year, the soldiers stayed in their barracks under strict orders not to intervene.

## Poland: Solidarity and the Round Table

Poland led. **Solidarity** was born in August 1980 at the Lenin Shipyard in Gdańsk, in a strike that began in defence of a crane operator, **Anna Walentynowicz**, fired five months before retirement. She and Alina Pienkowska turned a strike over pay into a strike of solidarity with other workplaces, and the electrician **Lech Wałęsa** led it to victory. By September 1981 Solidarity, the first independent trade union recognised by the state in a Warsaw Pact country, had about 10 million members. General Wojciech Jaruzelski declared martial law in December 1981, but the union survived underground with the support of the Church and money from the Vatican and the United States.

New strikes in 1988 forced the regime to talk. The **Round Table** opened in Warsaw on 6 February 1989, co-chaired by Wałęsa and the interior minister, Czesław Kiszczak; its agreement, signed on 5 April (some accounts give 6 April), legalised Solidarity and set partly free elections. On 4 June 1989, the day of the Tiananmen massacre in Beijing, Poles voted. Only 161 of the 460 seats in the Sejm were open to free contest, and Solidarity won every one; in a recreated Senate it took 99 of 100. On 24 August Tadeusz Mazowiecki became the first non-communist prime minister in the Eastern Bloc. The Soviet Union voiced no protest.

## Hungary Opens the Border

Hungary's communists reformed themselves out of power. In May 1989 Hungary began dismantling its 240-kilometre fence on the Austrian border, and in June between 100,000 and 250,000 people attended the reburial of Imre Nagy, executed in 1958.

On 19 August 1989, at a **Pan-European Picnic** near Sopron, which its patrons, Otto von Habsburg and the reformer Imre Pozsgay, saw as a test of Moscow's reaction, a border gate was opened for three hours. More than 600 East Germans ran through, and the guards under Árpád Bella let them go. The prime minister, Miklós Németh, recalled "no knocking on my door by the Soviet ambassador, no telephone calls from Moscow." On 11 September Hungary opened its border to East Germans altogether; by the end of the month more than 30,000 had left for the West.

## Leipzig and the Wall

In East Germany, Leipzig's Monday demonstrations grew out of peace prayers at St Nicholas Church. The first, on 4 September 1989, was organised by two young women, Katrin Hattenhauer and Gesine Oltmanns. The decisive night was 9 October. The state massed some 8,000 police and armed units amid rumours of a "Chinese solution"; some 70,000 people marched (estimates start at 40,000), chanting "*Wir sind das Volk!*" ("We are the people!"), and no one fired. Honecker was deposed, and on 4 November about half a million people filled East Berlin's Alexanderplatz.

On the evening of **9 November 1989** Günter Schabowski read out a new travel regulation at a press conference. Asked when it took effect, he answered: "As far as I know, it takes effect immediately, without delay." Crowds gathered at the crossings, and late that night Harald Jäger, commanding the checkpoint at Bornholmer Straße, opened the gate. The Wall that Reagan had challenged Gorbachev to "tear down" in 1987 was open. The next day Bulgaria's Politburo ousted Todor Zhivkov.

```checkpoint
q: What was the "Sinatra Doctrine"?
a*: Gennadi Gerasimov's name, in October 1989, for the Soviet policy of letting each Eastern European country choose its own road.
a: Gorbachev's plan to station more Soviet troops in Eastern Europe.
x: Gorbachev announced cuts of 500,000 troops, including withdrawals from Eastern Europe.
a: The American policy of containing communism in Europe.
x: It was a Soviet policy, named by a Soviet spokesman after Sinatra's song "My Way".
a: The doctrine used to justify the invasion of Czechoslovakia in 1968.
x: That was the Brezhnev Doctrine, which the Sinatra Doctrine replaced.
hint: Think of Frank Sinatra's song "My Way".
why: The phrase was retrospective: Poland already had a non-communist government when Gerasimov coined it.
---
q: What happened at the Pan-European Picnic of 19 August 1989?
a: Hungary and Austria signed a treaty abolishing all border controls.
x: The gate was opened for three hours as a symbolic gesture; Hungary opened the border fully to East Germans only on 11 September.
a: Soviet troops dispersed East Germans trying to reach Austria.
x: There was no Soviet intervention; the prime minister recalled no calls from Moscow.
a*: A border gate near Sopron was opened for three hours and more than 600 East Germans crossed into Austria.
a: The Berlin Wall was opened.
x: The Wall opened on 9 November 1989.
hint: It took place on the Hungarian–Austrian border.
why: The picnic tested Moscow's reaction and opened a route that turned East Germans' exodus into a flood.
```

## Prague and Bucharest

In Czechoslovakia the opposition had a long memory. **Charter 77** (1977) invoked the human rights commitments of the Helsinki Final Act; its signatories were dismissed, exiled or imprisoned. The playwright **Václav Havel** wrote in *The Power of the Powerless* (1978) of citizens forced to "live within a lie", and was imprisoned from 1979 to 1983.

On 17 November 1989 riot police beat a student march in Prague. A false report that a student had been killed fuelled the protests. Crowds grew to 800,000 at Letná, demonstrators jingled their keys, and after a two-hour general strike on 27 November the party gave up its monopoly. There were 568 injured and no deaths. On 29 December Havel was elected president. The Czech Republic and Slovakia later separated peacefully, on 1 January 1993.

Romania was the exception. In Timișoara on 16 December 1989, a protest by the Hungarian minority against the eviction of the pastor László Tőkés became a citywide revolt; workers bussed in to crush it joined it instead. On 21 December Ceaușescu's rally in Bucharest, broadcast live, dissolved into booing, and shooting followed. The next day the army changed sides. Ceaușescu and his wife fled by helicopter, were captured, tried by a drumhead military tribunal, and shot on 25 December, the only leaders executed in the revolutions of 1989. The death toll is contested. The official figure is 689; fuller counts give about 1,100 to 1,300 killed, one of them (1,104) finding 942 after the National Salvation Front had taken power, much of it in confused fighting against supposed "terrorists". In January 1990 Front officials claimed up to 7,000 deaths, and media at the time reported 60,000 or more and a mass grave at Timișoara; those reports proved false.

Beyond Europe, Mongolia held free elections in 1990, and states including Ethiopia, Angola and Mozambique abandoned Marxism–Leninism. Communist parties kept their monopoly only in China, Cuba, Laos, North Korea and Vietnam.

## Germany United

East Germans voted in their first free elections on 18 March 1990, for parties favouring unification, and on **3 October 1990** Germany was reunified. The **Two Plus Four Treaty**, signed in Moscow in September by the two German states and the four wartime Allies, ended Allied rights, capped German forces at 370,000, barred foreign troops and nuclear weapons from the former East Germany, and confirmed the Oder–Neisse border with Poland. By July 1990 Gorbachev had dropped his opposition to a united Germany in NATO. Unity proved hard to feel: as eastern industry closed, a 1993 survey found only 22 per cent of West Germans and 11 per cent of East Germans felt they were one nation.

## The Baltic Road

On 23 August 1989, the fiftieth anniversary of the Molotov–Ribbentrop Pact, up to two million people joined hands in the **Baltic Way**, a 675-kilometre chain from Vilnius through Riga to Tallinn.

{{image: Baltic Way | The Baltic Way of 23 August 1989: up to two million people joined hands across Estonia, Latvia and Lithuania.}}

On **11 March 1990** Lithuania's Supreme Council under Vytautas Landsbergis declared independence restored, the first Soviet republic to do so; Moscow answered with an economic blockade. That year the Soviet Communist Party gave up its monopoly of power, and republican elections swept it from office in the Baltic states, Moldova and Georgia. In Russia itself Yeltsin became head of the republic's parliament and declared Russian sovereignty.

Force failed to stop the drift. On 13 January 1991 Soviet troops and KGB special forces stormed the television tower in Vilnius and killed 14 unarmed civilians; six more people died at the barricades in Riga. Lithuanians voted 93.2 per cent for independence that February. In a Union referendum on 17 March, about 77 per cent of voters in the nine republics that took part backed a "reformed" union; the Baltic states, Armenia, Georgia and Moldova boycotted it. In June Yeltsin was elected president of Russia with about 57–59 per cent of the vote.

## August 1991 and the End of the Union

A new Union Treaty, strongly backed by the Central Asian republics, was due to be signed on 20 August 1991. On 19 August hardliners, among them Yanayev, Pavlov, Yazov, Kryuchkov and Pugo, formed a State Committee on the State of Emergency and put Gorbachev under house arrest in Crimea. Yeltsin spoke from a tank outside the White House in Moscow; troops refused to storm it, and the coup collapsed on 21 August. Three men died in a tunnel clash. Estonia and Latvia declared full independence during the coup, Ukraine on 24 August, and on 6 September the USSR recognised the Baltic states.

The Union's fate was sealed in Ukraine. On 1 December 1991 more than 90 per cent of Ukrainian voters (92.3 per cent of valid votes) backed independence, a blow Gorbachev had not expected. A week later, as the chapter on the Soviet Union recounts, the leaders of Russia, Ukraine and Belarus declared the USSR at an end, and on 21 December eleven of the twelve remaining republics, all but Georgia, signed the Alma-Ata Protocol. On 25 December Gorbachev resigned on television; that evening the Soviet flag was lowered and the Russian tricolour raised. In Central Asia the old leaders mostly stayed on; Tajikistan slid into civil war, and wars in Karabakh, Transnistria, South Ossetia, Abkhazia and Chechnya followed.

```checkpoint
q: Why was the Ukrainian referendum of 1 December 1991 so important?
a: It confirmed that Ukraine wished to remain in a reformed Soviet Union.
x: More than 90 per cent voted for independence.
a*: More than 90 per cent voted for independence, and a week later the leaders of Russia, Ukraine and Belarus declared the Union at an end.
a: It brought Gorbachev back to power after the August coup.
x: The coup had collapsed on 21 August; the referendum was a vote on independence that weakened Gorbachev further.
a: It made Ukraine the first Soviet republic to declare independence.
x: Lithuania was the first, on 11 March 1990; Ukraine declared independence on 24 August 1991.
hint: Serhii Plokhy argues that Ukraine and Russia, not the United States, ended the USSR.
why: The vote was a blow Gorbachev had not expected, and it ended his hopes of keeping a union together.
---
q: Which statement best describes the death toll of the Romanian revolution of 1989?
a: About 60,000–70,000, as reported at the time.
x: Those early media figures, and the Timișoara "mass grave", were later shown to be false.
a: No one died; it was as peaceful as Prague.
x: Romania was the violent exception; there was shooting from 21 December.
a: Exactly 7,000, the figure given by the new government.
x: That was a claim by National Salvation Front officials in January 1990, not an established count.
a*: Counts range from an official 689 to about 1,100–1,300, most of them killed after Ceaușescu fell.
hint: Many deaths came in confused fighting after 22 December.
why: The Romanian toll shows how revolutions generate rumours and why historians weigh competing counts.
```

## Shock Therapy and Its Costs

The new governments inherited broken economies. Poland's inflation reached 639.6 per cent in 1989. The Balcerowicz plan, drawn up with advice from Jeffrey Sachs, took effect on 1 January 1990 as a sudden package of laws: **shock therapy**. Hyperinflation stopped and shortages ended, but output fell for two years, 1,675 industrial plants were liquidated, and unemployment rose from 0.3 per cent to 16.9 per cent by 1994. By 2008, however, Poland's output was 77 per cent above its 1989 level.

Russia's experience was harsher. Price liberalisation began on 2 January 1992, and inflation reached 2,509 per cent that year. Voucher privatisation transferred 12,000–14,000 firms by 1994, but assets concentrated in the hands of insiders and new oligarchs, a process Russians mocked as *prikhvatizatsiya*, "grab-itization". Output fell by roughly 40–50 per cent over the 1990s, and poverty, measured at under $4 a day, rose from about 2 per cent of Russians in 1987–88 to 50 per cent in 1993–95. Male life expectancy fell from 64.2 years in 1989 to 57.6 in 1994; Steven Rosefielde estimated 3.4 million premature deaths in Russia between 1990 and 1998.

Why remains a debate. Defenders of shock therapy point to Poland and argue that Russia's reforms were applied incompletely and with too little Western aid. Critics, among them Joseph Stiglitz, Kristen Ghodsee and Mitchell Orenstein, link the speed of the reforms to Russia's mortality crisis, which the economist Isabella Weber describes as beyond any previous peacetime experience of an industrialised country. Others note that the Soviet economy was already collapsing and that Russia's rushed privatisation was a domestic political choice meant to create a capitalist class loyal to Yeltsin. Demographers dispute how much of the mortality crisis to blame on policy, on alcohol, or on the collapse itself.

## NATO, the EU and "Not One Inch"

Poland, Hungary and Czechoslovakia formed the Visegrád Group in February 1991 to seek integration into the European Union and NATO. Poland, Hungary and the Czech Republic joined NATO in 1999, and seven more states, including the three Baltic republics, in 2004. On 1 May 2004 ten countries, eight of them formerly communist, joined the European Union in its largest enlargement; Bulgaria and Romania followed in 2007.

Whether this broke a promise is argued. On 9 February 1990, discussing German unification, Baker, for the United States, floated a hypothetical bargain, telling Gorbachev, according to the record of the meeting, that "not an inch of NATO's present military jurisdiction will spread in an eastern direction"; Gorbachev later recalled it as "not one inch eastward". Nothing of the kind was written into any treaty. Gorbachev said in 2014 that the assurance concerned only East Germany, though he felt later enlargement violated its spirit. Blanton and Savranskaya of the National Security Archive argued in 2017 that the talks were "not at all narrowly limited" to East Germany; Hannes Adomeit replied that exploratory talk is not a commitment. M. E. Sarotte finds that no binding promise was made, but that Moscow's grievance carried real psychological weight.

## Yugoslavia: The Dark Counterpoint

Yugoslavia broke up in war. Slobodan Milošević rose to power in Serbia in 1987, replacing communism with Serbian nationalism. Slovenia and Croatia declared independence on 25 June 1991; Slovenia's war lasted ten days, but Croatia's lasted until 1995, destroyed Vukovar, and killed over 20,000.

Bosnia suffered most. From April 1992 Bosnian Serb forces, backed by Milošević and the Yugoslav army, seized about 70 per cent of the country through ethnic cleansing, with camps including rape camps; between 12,000 and 50,000 women were raped, mainly by Serb forces. The siege of Sarajevo lasted 1,425 days and killed about 14,000 people. At **Srebrenica** in July 1995, a declared UN "safe area" guarded by 370 lightly armed Dutch soldiers, Bosnian Serb forces under Ratko Mladić killed more than 8,000 Bosniak men and boys, a crime ruled genocide by the international tribunal and the International Court of Justice. Counts of Bosnia's war dead range from 97,207 to 102,622. The Dayton Agreement of 1995 kept Bosnia as one state of two entities. In 1999 NATO bombed Yugoslavia over Kosovo without UN Security Council approval, killing at least 489 civilians (489–528 according to Human Rights Watch). The Yugoslav wars killed between 130,000 (Humanitarian Law Center) and 140,000 (International Center for Transitional Justice).

Historians debate whether the wars sprang from unresolved ethnic tensions or from elites who manipulated nationalism. The International Criminal Tribunal for the former Yugoslavia, at The Hague from 1993 to 2017, indicted 161 people and convicted 90, Mladić among them; Milošević died in his cell before a verdict. Critics have called some sentences too light, while statistical studies by Hashimoto and Gray find statistical disparities, though bias cannot be proven: Serbs were more likely to be convicted and to receive longer sentences.

## Who Ended the Cold War?

Answers divide sharply. Triumphalists credit Reagan's military build-up and pressure; Raymond Garthoff argued that Reagan's confrontation probably delayed the end by two or three years. Archie Brown gives the decisive role to leadership and ideas, above all Gorbachev's. Vladislav Zubok argues that Gorbachev's reforms drained the state and empowered separatism, and that collapse was not inevitable. Edward Walker points instead to the Soviet ethnofederal system and nationality policy, which gave the republics the institutions and legitimacy to secede. Stephen Kotkin (with a contribution by Jan Gross) sees 1989 as the implosion of a bankrupt communist establishment more than a triumph of dissidents, while Padraic Kenney stresses grassroots movements that predated glasnost. Serhii Plokhy challenges the story of American victory: Bush wanted to preserve the USSR, as his Kyiv speech of 1 August 1991 showed (William Safire's column dubbed it "Chicken Kiev"), and it was Ukraine's voters and the leaders of Russia and Ukraine who ended the Union. Even the date is disputed: the Bush–Gorbachev summit at Malta in December 1989, German unity in 1990, or, as many historians prefer, 26 December 1991.

## Further exploration

- **Stephen Kotkin, *Armageddon Averted: The Soviet Collapse, 1970–2000* (2001).** A short account of the system's long decline and its elite's choice not to fight.
- **Serhii Plokhy, *The Last Empire: The Final Days of the Soviet Union* (2014).** How Ukraine and Russia, not the United States, ended the USSR.
- **Vladislav M. Zubok, *Collapse: The Fall of the Soviet Union* (2021).** Gorbachev's reforms as the main cause of a collapse that was not inevitable.
- **Archie Brown, *The Human Factor: Gorbachev, Reagan, and Thatcher, and the End of the Cold War* (2020).** The case for leadership and ideas.
- **Padraic Kenney, *A Carnival of Revolution: Central Europe 1989* (2002).** Grassroots and youth movements across Central Europe, from over 200 interviews.
- **M. E. Sarotte, *Not One Inch: America, Russia, and the Making of Post–Cold War Stalemate* (2021).** NATO enlargement and the dispute over the "promise".
- **Kristen Ghodsee and Mitchell A. Orenstein, *Taking Stock of Shock: Social Consequences of the 1989 Revolutions* (2021).** The human costs of the transition.$mn_collapse_master$,
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
  select $mn_collapse_quiz$[
    {"type": "mcq", "prompt": "What did Gennadi Gerasimov mean by the \"Sinatra Doctrine\" in October 1989?", "options": ["That each Eastern European country could decide its own road, after Sinatra's song 'My Way'", "That Soviet troops would defend communist governments wherever they were threatened", "That the Soviet Union would leave the United Nations", "That Eastern Europe would adopt American-style capitalism at once"], "answerIndex": 0, "explanation": "Gerasimov coined the phrase in Helsinki on 25 October 1989, saying that political structures 'must be decided by the people who live there'. It was retrospective: Poland already had a non-communist government.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened in Poland's elections of 4 June 1989?", "options": ["The communists won a large majority in free elections", "Solidarity was banned and its leaders interned", "Solidarity won every one of the 161 Sejm seats open to free contest and 99 of 100 seats in the Senate", "Lech Wałęsa was elected president"], "answerIndex": 2, "explanation": "The Round Table agreement of early April 1989 allowed only partly free elections. Within weeks Tadeusz Mazowiecki became the first non-communist prime minister in the Eastern Bloc, and the Soviet Union voiced no protest. Wałęsa became president in 1990.", "id": "q2"},
    {"type": "mcq", "prompt": "How did the Berlin Wall come to be opened on the night of 9 November 1989?", "options": ["NATO troops crossed into East Berlin", "Günter Schabowski announced a new travel regulation as taking effect 'immediately, without delay', crowds gathered, and Harald Jäger opened the Bornholmer Straße crossing", "Soviet troops dismantled the Wall on Gorbachev's orders", "The East German parliament voted to reunify Germany"], "answerIndex": 1, "explanation": "The opening followed months of exodus via Hungary and mass demonstrations in Leipzig and East Berlin; reunification came only on 3 October 1990.", "id": "q3"},
    {"type": "mcq", "prompt": "What did M. E. Sarotte conclude about the claim that the West broke a promise not to expand NATO eastward?", "options": ["That a binding treaty promise was signed in 1990 and broken", "That no such words were ever spoken", "That NATO enlargement was proposed by Gorbachev", "That no binding promise was made, but the grievance carries real psychological weight"], "answerIndex": 3, "explanation": "Baker's assurance of 9 February 1990, remembered as 'not one inch eastward', was said in the context of German unification and written into no treaty. Blanton and Savranskaya argue the talks were broader than East Germany; Adomeit replies that exploratory talk is not a commitment.", "id": "q4"},
    {"type": "open", "prompt": "Who, or what, ended the Cold War and the Soviet Union? Assess at least three interpretations.", "rubric": "A strong answer compares several views: the triumphalist case for Reagan's pressure (and Garthoff's argument that confrontation delayed the end); Archie Brown's emphasis on leadership and ideas, above all Gorbachev's; Zubok's argument that Gorbachev's reforms drained the state and empowered separatism; Walker's structural account of Soviet nationality policy; Kotkin and Gross on the implosion of the communist establishment versus Kenney's grassroots movements; and Plokhy's case that Ukraine's referendum and the leaders of Russia and Ukraine, not the United States, ended the USSR. It uses evidence such as the Sinatra Doctrine, the Polish elections, Leipzig, the Baltic Way, the August 1991 coup and the 1 December 1991 Ukrainian vote, and notes the dispute over when the Cold War ended.", "id": "q5"},
    {"type": "open", "prompt": "Compare the peaceful and violent ends of communism in Eastern Europe and the former Soviet Union, 1988–1995.", "rubric": "A strong answer contrasts negotiated or peaceful transitions (Poland's Round Table, Hungary, Leipzig and the Wall, the Velvet Revolution with no deaths, the Baltic Way) with violence: Romania (death counts from an official 689 to about 1,100–1,300, with false contemporary reports of tens of thousands), Vilnius in January 1991 (14 civilians killed), Sumgait and the Karabakh war, and Yugoslavia (130,000–140,000 dead, Srebrenica ruled genocide). It explains factors such as Soviet troops staying in barracks, the choices of local elites, and nationalism, and gives death tolls as ranges with their sources.", "id": "q6"}
  ]$mn_collapse_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/collapse-of-the-soviet-union-and-eastern-europe-the-end-of-the-cold-war', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
