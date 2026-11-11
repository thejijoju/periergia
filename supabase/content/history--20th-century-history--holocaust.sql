-- The Holocaust — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-holocaust @ research/advanced/read.
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
    'history/20th-century-history/the-holocaust',
    'research',
    'advanced',
    'read',
    $mn_holocaust_master$> **Six million lives, and how they were taken.** The United States Holocaust Memorial Museum defines the Holocaust as "the systematic, state-sponsored persecution and murder of six million European Jews by the Nazi German regime and its allies and collaborators". This chapter unpacks that definition. It begins with the Jewish worlds of Europe and North Africa, then follows the ghettos, the mass shootings in the East, the decision for genocide and the death camps, country by country. It turns to the Roma and other victims, to Jewish resistance and the rescuers, to what the Allies knew, and to justice, memory and denial, with the debates historians still have.

## Naming the Crime

"Holocaust" comes from a Greek word for a "burnt offering"; by the late 1970s it was the standard name for the Nazi murder of the Jews. Many prefer the Hebrew *Shoah*, "catastrophe". The perpetrators spoke of the "Final Solution". Between 1941 and 1945 Nazi Germany and its collaborators murdered around six million Jews, about two-thirds of Europe's Jews, chiefly by shooting in eastern Europe and by gas in camps in occupied Poland. The museum's definition begins with persecution, which started in 1933; the mass killing is dated from 1941.

Most scholars keep the word "Holocaust" for the Jews, while stressing that Nazi Germany also persecuted and murdered other groups, for different reasons and under different policies. Christopher Browning describes three "clusters of genocidal projects": the killing of disabled people and of Sinti and Roma in the name of "racial purification"; the eradication of Slavic populations in the East; and the Final Solution itself.

## Worlds Before

In 1933 about 9.5 million Jews lived in Europe, where Jews had lived for over two thousand years. Medieval Christians blamed them for the death of Jesus; in the 19th century many states made them full citizens, but nationalism bred a political antisemitism of the "Jewish question" and imagined conspiracies, and racial theories cast Jews as an alien race. Germany's roughly 500,000 Jews, under 1 per cent of the population, were largely assimilated. Further east many lived in small towns, spoke Yiddish and practised Orthodox Judaism. Poland's more than three million Jews were more than a third of Europe's; Salonica's 50,000 were mostly Judeo-Spanish-speaking Sephardim.

The Nazis' reach also extended to Africa. Nearly half a million Jews lived in French Algeria and the protectorates of Tunisia and Morocco. In Italian Libya, where Jewish communities dated back to the 3rd century BCE, Jews made up a quarter of Tripoli's population in 1941, with 44 synagogues.

## Persecution and Closing Doors, 1933–39

The chapter on Hitler and the death of democracy in Germany traces the stab-in-the-back myth, Weimar's crises and the persecution of 1933–39; an outline is enough here. Jews were barred from the civil service and the professions in 1933. The Nuremberg Laws of 1935 reserved citizenship for people of "German or related blood" and banned marriage and sex between Jews and other Germans. In Kristallnacht, 9–10 November 1938, at least 91 Jews were killed outright. Germany was not alone: Romania's own decree of January 1938, issued without German pressure, stripped 225,222 Jews of citizenship.

About 250,000 of Germany's Jews emigrated by 1939, some as far as Shanghai, but almost no country eased its restrictions. At the Évian Conference of July 1938, 32 countries met; only the Dominican Republic, and later Costa Rica, offered real places, and Australia's delegate said that "as we have no real racial problem, we are not desirous of importing one". Golda Meir, an observer not allowed to speak, hoped her people "should not need expressions of sympathy anymore". In 1939 Cuba, the United States and Canada turned away the refugee ship *St. Louis*; 254 of its passengers later died in the Holocaust. Britain's Kindertransport took nearly 10,000 children, often the only members of their families to survive.

## The Ghettos

The conquest of Poland in 1939 brought some 1.7 million Polish Jews under German rule. From 1939–40 local German officials confined them in ghettos, where Jewish councils (*Judenräte*) tried to keep communities alive while obeying German demands.

The Warsaw Ghetto, sealed in November 1940, held up to 460,000 people, more than nine to a room. In 1941 rations for Jews averaged 184 calories a day. Children smuggled food across the wall, and over 80,000 people died of hunger and disease before the deportations began. In Łódź Chaim Rumkowski tried to save the ghetto by making it a centre of war production; on 4 September 1942 he begged, "Fathers and mothers: Give me your children!" He remains among the most controversial figures of the Holocaust. Of about 223,000 Łódź Jews, roughly 10,000 survived.

In Warsaw the historian Emanuel Ringelblum led a secret group, Oyneg Shabbos, that collected diaries, essays, drawings, posters and testimonies. In January 1942 an escapee from Chełmno, Szlama Ber Winer, gave it a report whose information reached London in 1942. The archive was buried in milk cans and metal boxes; two of its three caches were dug up after the war, some 35,000 pages. Ringelblum and his family were found in hiding and shot in 1944 with those who hid them.

{{image: Ringelblum Archive | One of the milk cans in which the Oyneg Shabbos group buried the Warsaw Ghetto's archive, recovered after the war.}}

## The Holocaust by Bullets

On 22 June 1941 Germany and its allies invaded the Soviet Union, a war Hitler saw as one of extermination against "Jewish Bolshevism". Four Einsatzgruppen, about 3,000 men, followed the armies. At first they shot Jewish men in official posts; after Himmler's visits in July and August 1941 they killed women and children too, joined by police battalions, the army and local auxiliaries. Victims were marched out of town, made to undress and shot into pits; many were buried alive, and neighbours as well as occupiers took their property. At Babi Yar outside Kyiv 33,771 Jews were shot on 29–30 September 1941; Dina Pronicheva was one of at least 29 known survivors. In October 1941 Romanian troops, with Einsatzgruppe men, shot or burned 25,000–34,000 Jews in Odessa. Local pogroms, in which Germany's role is debated, killed up to 50,000. By the end of the war 1.5–2 million Jews had been shot. The phrase "Holocaust by bullets" is associated with the priest Patrick Desbois, whose organisation has located the graves and interviewed local witnesses.

## The Decision and Wannsee

No written order from Hitler for the murder of Europe's Jews has been found, and how the decision was reached is fiercely debated. On 30 January 1939 Hitler had told the Reichstag that if "international Jewish financiers" plunged the nations into another world war, the result would be "the annihilation of the Jewish race in Europe". Intentionalists saw a straight line from such words: Lucy Dawidowicz thought he had decided by 1919, Eberhard Jäckel before 1939. Functionalists such as Martin Broszat argued that killing grew "bit by bit" from improvised local massacres in autumn 1941. Most historians now combine the two: there was no master plan, but Hitler was the decisive force in a cumulative radicalisation.

The timing is disputed. Browning sees a decision to kill Soviet Jews in mid-July 1941 and a decision to kill all of Europe's Jews crystallising between late September and late October. Gerlach points to Hitler's meeting with party leaders on 12 December 1941, after the United States entered the war, when, Goebbels recorded, Hitler recalled his prophecy: "The world war is here and the annihilation of the Jews must be the necessary consequence." Peter Longerich doubts it is meaningful to "pick out a single decision"; David Cesarani concluded that the genocide was "rooted in anti-Semitism, but it was shaped by war".

The **Wannsee Conference** of 20 January 1942 is often thought to be where the Holocaust was decided. It was not. The shootings had been under way for seven months, and gassing had begun at Chełmno in December 1941. Fifteen officials met at Heydrich's invitation for about ninety minutes, to coordinate policy and secure SS control; Hitler, Himmler and Goebbels were absent. The minutes spoke of "evacuation", and of Jews set to building roads, "in the course of which action doubtless a large portion will be eliminated by natural causes". Eichmann later testified that "they spoke about methods of killing, about liquidation, about extermination."

## The Death Camps

In Operation Reinhard, from March 1942 to November 1943, the Jews of the General Government in occupied Poland were murdered at Belzec, Sobibor and Treblinka, death camps that reused the staff and gassing technology of the T4 "euthanasia" programme. In 100 days from late July 1942 about 1.47 million Jews were murdered. From Warsaw that summer about 254,000 people were sent to Treblinka; the ghetto's council head, Adam Czerniaków, killed himself when ordered to deliver 6,000 people a day, children included, and Janusz Korczak went to Treblinka with the orphans in his care, refusing to escape. Sources differ on the tolls: Jewish deaths at Treblinka are put at about 800,000–925,000, at Belzec 430,000–600,000, at Sobibor 170,000–250,000 and at Chełmno at least 150,000. Only seven Jewish prisoners of Belzec survived.

**Auschwitz**, opened in 1940 for Polish political prisoners, grew into a complex of over 40 camps, including Birkenau and the IG Farben works at Monowitz. From July 1942 arrivals were "selected": about a fifth to a quarter were taken for labour and most of the rest gassed at once. At least 1.1 million people died there: about 960,000 Jews, 74,000 non-Jewish Poles, 21,000 Roma, 15,000 Soviet prisoners of war and up to 15,000 others, in Franciszek Piper's estimate. A Soviet figure of 4 million stood on a museum plaque until 1990, but the six million total was never based on it. Between 15 May and 9 July 1944 between 434,000 and 437,000 Jews were deported from Hungary, mostly to Auschwitz, where about 80 per cent were gassed on arrival.

```checkpoint
q: What was the purpose of the Wannsee Conference of 20 January 1942?
a*: To coordinate the "Final Solution" among the agencies involved and secure SS control, after mass killing had already begun.
a: To take the decision to murder the Jews, made there by Hitler in person.
x: Hitler, Himmler and Goebbels were absent; the historian Rees calls the participants "second-level functionaries".
a: To plan the invasion of the Soviet Union.
x: The invasion began on 22 June 1941, seven months earlier, and mass shootings had followed it.
a: To agree the emigration of Europe's Jews overseas.
x: Germany had banned Jewish emigration in October 1941; the minutes used "evacuation" as a euphemism for murder.
hint: Think about what had already happened at Chełmno and in the East by January 1942.
why: Wannsee shows the bureaucratic organisation of genocide, but historians such as Longerich and Cesarani stress that it made no new decision.
---
q: Which statement about the death toll at Auschwitz is correct?
a: About 4 million people died there, as a Soviet statement of 1945 claimed.
x: The Soviet figure was based on crematoria capacity and was removed from the museum in 1990.
a: About 2.5 million died, as Rudolf Höss stated.
x: Höss's figure came from Eichmann, and Höss himself thought it far too high.
a*: At least 1.1 million people died there, about 960,000 of them Jews.
a: The revised figure means the six million total must be reduced.
x: The six million total was never based on the 4 million figure for Auschwitz.
hint: Think of Franciszek Piper's research.
why: The correction shows research refining figures, which deniers have tried to exploit.
```

## Across Europe

Germany planned and drove the genocide, but relied on others. Gerlach estimates that non-Germans not under German command caused 5–6 per cent of Jewish deaths, but that their part was crucial in other ways; millions profited from Jewish property, jobs and homes. On 16–17 July 1942 French police arrested 13,152 Jews, including 4,115 children, in the Vel' d'Hiv roundup. Romania was the only ally of the Third Reich to carry out a genocidal campaign of its own without SS direction, in the Iași pogrom and in Transnistria, yet it also had more Jewish survivors than any other Axis country. In Hungary in 1944 ghettoisation and deportation took less than eight weeks, carried out with the eager help of the Hungarian authorities, above all the gendarmerie. In Lithuania historians attribute the near-total destruction to massive collaboration by local paramilitaries, for reasons still debated. At Jedwabne in Poland in July 1941 at least 40 local Poles, with German involvement, killed between 300 and 1,600 Jews.

National figures vary with borders and sources and are approximate:

- **Poland:** about 3 million, some 90 per cent of its Jews.
- **Soviet territory (1941 borders):** about 2.6 million; estimates for Ukraine alone run from 850,000 to 1.6 million.
- **Hungary (wartime borders):** just over 564,000. **Romania and Romanian-ruled territory:** 250,000–380,000.
- **Lithuania:** 190,000–195,000, more than 95 per cent. **Latvia:** about 70,000 of 93,000.
- **Netherlands:** about 102,000, three-quarters. **France:** about 72,500, a quarter. **Greece:** 82–92 per cent.

Estimates of the total run from Raul Hilberg's 5.1 million to about 6.2 million.

## North Africa

Vichy's anti-Jewish laws also applied in Algeria, Tunisia and Morocco; Algeria's Jews lost their French citizenship until October 1943, while Muslim religious leaders in Algiers preached against taking part in the seizure of Jewish property. Under German occupation, from November 1942 to May 1943, Tunisia's Jews faced hostages, fines and the yellow badge, and more than 5,000 were sent to forced labour camps, though they were spared mass deportation. Khaled Abdul-Wahab sheltered Jewish families and became the first Arab nominated as Righteous Among the Nations, though Yad Vashem has not recognised him. In Libya, at Giado, 562 of about 2,600 interned Jews died, mostly of hunger and typhus. In Morocco Sultan Muhammad V reportedly refused to sign off on ghettoisation and deportation, yet signed decrees excluding Jews from some schools and posts; most scholars see him as a protector, while Michel Abitbol thinks his role exaggerated.

## The Other Victims

The Roma and Sinti were placed alongside the Jews as "enemies of the race-based state" in 1935. Estimates of how many were killed mostly run from about 200,000 to 500,000. At Auschwitz about 21,000 of 23,000 Roma died; in May 1944 Roma there resisted with tools and the SS withdrew, but on 2 August, now the Roma genocide remembrance day, the SS gassed the remaining 2,898. West Germany recognised the genocide only in 1982. About 3.3 million Soviet prisoners of war died, mainly of starvation, and more than 1.8 million ethnic Poles were killed. As the chapter on Hitler and the death of democracy in Germany describes, 360,000 people were sterilised in 1933–39, 275,000–300,000 disabled people were murdered under T4, and gay men, Black Germans and others were persecuted.

## Jewish Responses

Bauer argued that resistance included any act that gave Jews dignity and humanity, and that the surprise is not how little resistance there was but how much: schooling, culture, archives, flight and hiding. At the start of 1942 Abba Kovner in Vilna urged, "Let us not go like lambs to the slaughter!" Between 20,000 and 30,000 Jews fought as partisans, and the Bielski brothers' forest camp in Belarus sheltered up to 1,236 people.

The **Warsaw Ghetto Uprising**, the largest single Jewish revolt of the war, began on 19 April 1943, the eve of Passover, led by the young Mordechai Anielewicz; Zivia Lubetkin was among its leaders. They fought, Marek Edelman said, "not to allow the Germans alone to pick the time and place of our deaths". It ended on 16 May with the blowing up of the Great Synagogue; at least 13,000 Jews were killed. On 12 May, as the ghetto burned, Szmul Zygielbojm, a representative of Polish Jewry in London, took his own life.

```quote
By my death, I wish to give expression to my most profound protest against the inaction in which the world watches and permits the destruction of the Jewish people.
Szmul Zygielbojm · Farewell letter, London · May 1943
```

At Treblinka on 2 August 1943 some 200–300 prisoners escaped, and fewer than a hundred survived the war. At Sobibor on 14 October 1943, in a revolt led by Alexander Pechersky with Leon Feldhendler, eleven or twelve SS men were killed and about 300 prisoners escaped; the camp was then closed. The Auschwitz Sonderkommando revolted in October 1944, and the report of two escapees, Vrba and Wetzler, part of the "Auschwitz Protocols", helped halt the Hungarian deportations when it was published in June 1944.

## The Rescuers

About 200,000 Jews survived in hiding across Europe, Gerlach estimates; helpers' motives ranged from altruism to money, and in the East helping could mean death. By 2024 Yad Vashem had recognised 28,707 Righteous Among the Nations, though it stresses that the national figures do not measure rescue. After Georg Ferdinand Duckwitz leaked the deportation plan in September 1943, Danes ferried 7,500 of 8,000 Jews to Sweden. The village of Le Chambon-sur-Lignon sheltered an estimated 800 to 5,000 people, and Carl Lutz and Raoul Wallenberg issued protective passes in Budapest.

**Bulgaria**'s record is contested. In March 1943 the deportation of Jews from Bulgaria proper was halted on 9 March after leaks and an intervention led by the deputy Dimitar Peshev; he and 42 other pro-government deputies then signed a protest, and Metropolitans Kiril of Plovdiv and Stefan of Sofia protested too, and about 48,000 survived. Yet the same government deported 11,343 Jews from its occupied territories in Thrace and Macedonia to Treblinka. Some credit King Boris III; others credit Peshev, the Church and public protest. The Japanese vice-consul in Kaunas, **Chiune Sugihara**, issued over 2,100 transit visas in 1940 against his ministry's instructions. How many he saved is uncertain: "around 6,000" is often cited, but one recent study argues for about 3,000.

## What the World Knew

News of the killing reached the West from 1941, and widely in 1942. In June the BBC broadcast a report of 700,000 Polish Jews killed. In August Gerhart Riegner of the World Jewish Congress cabled from Geneva that a plan to kill the Jews of occupied Europe "at one blow" was under consideration; the State Department treated it as rumour. The Polish courier Jan Karski, smuggled into the Warsaw Ghetto, briefed Eden and, in July 1943, Roosevelt, who asked no questions about the Jews; Karski later recalled that Frankfurter, whom he also met, said he could not believe him. The Allies publicly condemned the extermination in December 1942, but the Bermuda Conference of April 1943 changed neither American quotas nor British policy on Palestine, and the American War Refugee Board was created only in January 1944.

Should the Allies have bombed Auschwitz? Polish appeals reached the Allies as early as January 1941, and in May 1944 Rabbi Michael Dov Weissmandl proposed bombing the railway lines. The American and British authorities declined, even as American bombers struck the IG Farben plant at Monowitz. The survivor Olga Lengyel wrote: "If the Allies could blow up the crematory ovens! The pace of the extermination would at least be slowed." David Wyman argued that it could and should have been done; later historians question whether bombing was accurate enough and warn of the problems of counterfactuals.

```checkpoint
q: Why is Bulgaria's record in the Holocaust described as contested?
a: Because Bulgaria deported all its Jews, but later denied it.
x: About 48,000 Jews in Bulgaria proper survived.
a*: Because it stopped the deportation of Jews from Bulgaria proper, yet deported 11,343 Jews from its occupied territories to Treblinka, and historians disagree over who deserves credit for the rescue.
a: Because Bulgaria stayed neutral and no Jews there were ever threatened.
x: Bulgaria passed antisemitic laws, and its authorities planned and carried out deportations.
a: Because King Boris III publicly refused all German demands from 1941.
x: Credit to Boris is disputed; he later approved expelling Sofia's Jews to the countryside.
hint: Think about Thrace and Macedonia, and about Dimitar Peshev.
why: Bulgaria shows that rescue and deportation could be carried out by the same state at the same time.
---
q: What is at issue in the debate over bombing Auschwitz?
a: Whether the Allies knew the camp existed before 1945.
x: Polish appeals to bomb it reached the Allies in 1941, and Allied aircraft bombed Monowitz in 1944.
a: Whether Allied aircraft could reach the area at all.
x: The Fifteenth Air Force bombed the IG Farben plant at Monowitz several times in 1944.
a: Whether Soviet troops should have liberated it earlier.
x: The debate concerns American and British air power and the decisions of their officials.
a*: Whether bombing the camp or its railway lines was feasible and would have saved lives, and why officials declined.
hint: Think of David Wyman and his critics.
why: The question has become emblematic of the Allied response to the Holocaust.
```

## Liberation and Justice

Soviet troops reached Auschwitz on 27 January 1945, now International Holocaust Remembrance Day. About a third or more of the more than 700,000 people in the camp system that January died before the end, many on death marches. Survivors called themselves the *Sh'erit ha-Pletah*, "the surviving remnant". Many lived for years in displaced persons camps; others met fresh violence, as at Kielce in Poland, where some 40 Jews were killed in July 1946, and in Tripolitania, where a pogrom killed more than 140 in November 1945.

At Nuremberg the International Military Tribunal indicted 24 leading Nazis and tried 22; twelve were sentenced to death. The charges included "crimes against humanity", and by the closing statements the Holocaust had overshadowed the charge of aggression. In 1961 Eichmann, captured in Buenos Aires the year before, was tried in Jerusalem in a trial built, unlike Nuremberg, on survivor testimony; the prosecutor, Gideon Hausner, began: "With me, at this moment, stand six million accusers." Hannah Arendt's report coined "the banality of evil".

The Polish Jewish lawyer **Raphael Lemkin**, who lost 49 relatives, had been shaped by the Armenian genocide, which the chapter on the First World War describes. In *Axis Rule in Occupied Europe* (1944) he named the crime "genocide", from the Greek *genos* and the Latin *-cide*. The Genocide Convention, adopted unanimously on 9 December 1948, defined it as acts "committed with intent to destroy, in whole or in part, a national, ethnical, racial or religious group, as such".

```quote
It is intended rather to signify a coordinated plan of different actions aiming at the destruction of essential foundations of the life of national groups, with the aim of annihilating the groups themselves.
Raphael Lemkin · Axis Rule in Occupied Europe · 1944
```

## How Historians Argue

Raul Hilberg's *The Destruction of the European Jews* (1961) described a bureaucratic "machinery of destruction"; his claim of an "almost complete lack of resistance" was rejected by Bauer. Saul Friedländer wrote an "integrated history" that sets the victims' diaries and letters alongside German policy.

Who were the killers? Browning's study of a reserve police battalion, discussed in the 20th-century overview, found ordinary middle-aged men shaped by conformity: only about a dozen of about 500 stepped aside when offered the chance. Goldhagen's *Hitler's Willing Executioners* (1996) blamed a uniquely German "eliminationist antisemitism". Most scholars were scathing; Bauer observed that the thesis fitted Romania better than Germany.

Is the Holocaust unique? Jäckel held that never before had a state decided to wipe out a people, "including its old people, women, children and infants". In the West German "historians' dispute" of 1986, Nolte's claim that Auschwitz was a "copy" of the Gulag was rejected by Habermas and others. Snyder's *Bloodlands* (2010) set the Holocaust among 14 million non-combatants killed by both regimes in eastern Europe; Richard Evans objected that it did not separate the Holocaust clearly enough from the regimes' other killings. Since about 2000 many scholars have preferred comparison, arguing that uniqueness can demote other victims; some, controversially, trace continuities with the Herero and Nama genocide described in the chapter on Imperial Expansion and Resistance.

## Memory and Denial

For decades memory was confined largely to survivors. Soviet memorials at Babi Yar spoke of "peaceful victims of fascism", obscuring the victims' Jewish identity. France acknowledged its role in 1995, when Jacques Chirac said that "France, that day, committed the irreparable." Survivors such as Primo Levi, whose *If This Is a Man* appeared in 1947, bore witness.

Holocaust denial is an antisemitic fringe claim made against overwhelming evidence, and is illegal in Germany and many other countries. Deniers exploit corrections such as the Auschwitz figure. How historians exposed one denier in court is told in the chapter "What Is History?", in its account of Irving v. Lipstadt.

## Further exploration

- **Raul Hilberg, *The Destruction of the European Jews* (1961).** The founding documentary study of the "machinery of destruction".
- **Saul Friedländer, *The Years of Extermination: Nazi Germany and the Jews, 1939–1945* (2007).** A Pulitzer-winning history that weaves victims' voices into the story.
- **Christopher R. Browning, *The Origins of the Final Solution* (2004).** The standard account of how the decision for genocide evolved, 1939–42.
- **David Cesarani, *Final Solution: The Fate of the Jews 1933–1949* (2016).** Stresses improvisation, war and the victims' experience.
- **Samuel D. Kassow, *Who Will Write Our History?* (2007).** Emanuel Ringelblum and the secret archive of the Warsaw Ghetto.
- **Robert Satloff, *Among the Righteous: Lost Stories from the Holocaust's Long Reach into Arab Lands* (2006).** North Africa, its Arab rescuers and its collaborators.
- **Patrick Desbois, *The Holocaust by Bullets* (2008).** The mass shootings in Ukraine, traced through witnesses and graves.$mn_holocaust_master$,
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
  select $mn_holocaust_quiz$[
    {"type": "mcq", "prompt": "What did the Ringelblum Archive (Oyneg Shabbos) preserve, and how did it survive?", "options": ["German administrative records of the Warsaw Ghetto, captured by the Red Army in 1945", "Diaries, essays, drawings, posters and testimonies collected by a secret group in the Warsaw Ghetto, buried in milk cans and metal boxes, two of whose three caches were recovered after the war", "The minutes of the Wannsee Conference, found in 1947", "Survivor testimonies recorded for the Eichmann trial in 1961"], "answerIndex": 1, "explanation": "Led by the historian Emanuel Ringelblum, Oyneg Shabbos documented ghetto life and death from within. The archive was buried in three caches; two were dug up after the war, about 35,000 pages. Ringelblum and his family were shot in 1944 with those who hid them.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best describes historians' view of the Wannsee Conference of 20 January 1942?", "options": ["It coordinated policy and secured SS control after mass shootings and gassing had already begun; it made no new decision", "It was where Hitler personally ordered the murder of the Jews", "It approved a plan for Jewish emigration to Madagascar", "It planned the invasion of the Soviet Union"], "answerIndex": 0, "explanation": "Fifteen officials met at Heydrich's invitation for about ninety minutes; Hitler, Himmler and Goebbels were absent. The shootings in the East had been under way for seven months, and Chełmno had begun gassing in December 1941. Historians such as Longerich and Cesarani see it as coordination, not decision.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these is the best-supported estimate of the death toll at Auschwitz?", "options": ["About 4 million, as a Soviet statement of 1945 claimed", "About 2.5 million, as Rudolf Höss stated", "About 6 million, the whole Holocaust", "At least 1.1 million, about 960,000 of them Jews, in Franciszek Piper's estimate"], "answerIndex": 3, "explanation": "Piper's research found that at least 1.1 million people died at Auschwitz: about 960,000 Jews, 74,000 non-Jewish Poles, 21,000 Roma, 15,000 Soviet prisoners of war and up to 15,000 others. The Soviet 4 million figure stood on a museum plaque until 1990, but the six million total was never based on it.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is the number of people saved by Chiune Sugihara described as uncertain?", "options": ["Because he issued no visas, only verbal assurances", "Because his visas were all cancelled by the Soviet Union", "Because, although he issued over 2,100 transit visas in 1940, the figure of 'around 6,000' people saved is disputed, and one recent study argues for about 3,000", "Because he worked in Budapest, where records were destroyed"], "answerIndex": 2, "explanation": "Sugihara, Japan's vice-consul in Kaunas, issued over 2,100 transit visas in summer 1940 against his ministry's instructions, letting refugees cross the Soviet Union to Japan. 'Around 6,000' is often cited, but Kitade (2022) argues for about 3,000.", "id": "q4"},
    {"type": "open", "prompt": "How and when was the decision to murder Europe's Jews taken? Explain the intentionalist and functionalist positions and at least two views on the timing.", "rubric": "A strong answer notes that no written Hitler order has been found. It explains intentionalism (a line from Hitler's ideology to genocide: Dawidowicz dates the decision to 1919, Jäckel to before 1939, citing the prophecy of 30 January 1939) and functionalism (Broszat: killing grew 'bit by bit' from improvised local massacres in autumn 1941), and the synthesis most historians now hold: no master plan, but Hitler the decisive force in cumulative radicalisation. It gives at least two timing views, for example Browning (Soviet Jews mid-July 1941; all European Jews mid-September to late October 1941), Gerlach (Hitler's meeting with party leaders on 12 December 1941, recorded by Goebbels), Longerich (no single decision) or Cesarani ('rooted in anti-Semitism, but it was shaped by war'). It should recognise that Wannsee (January 1942) coordinated rather than decided.", "id": "q5"},
    {"type": "open", "prompt": "Using at least three examples from different countries, explain how the fate of Jews depended on local collaboration, rescue and the policies of Germany's allies.", "rubric": "A strong answer uses specific cases. Collaboration: French police in the Vel' d'Hiv roundup (13,152 arrested, including 4,115 children); Romania's own genocidal campaign in Iași and Transnistria (250,000–380,000 dead), yet more survivors than any other Axis country; the Hungarian gendarmerie's help in deporting about 435,000 Jews in under eight weeks in 1944; Lithuanian paramilitaries (over 95 per cent killed); Jedwabne. Rescue: Denmark, where 7,500 of 8,000 Jews were ferried to Sweden; Le Chambon-sur-Lignon; Lutz and Wallenberg in Budapest; Khaled Abdul-Wahab in Tunisia. Ambiguous cases: Bulgaria, which stopped deportation from Bulgaria proper (about 48,000 survived) but deported 11,343 Jews from Thrace and Macedonia, with credit for the rescue disputed; Muhammad V in Morocco. It should note that national figures are approximate ranges, and Gerlach's point that non-German participation, though directly causing 5–6 per cent of deaths, was crucial in other ways.", "id": "q6"}
  ]$mn_holocaust_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-holocaust', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
