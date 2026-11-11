-- East European Identities: Russia and Ukraine — canonical master article, co-written and human-reviewed.
-- history/regional-histories/europe/east-european-identities-russia-and-ukraine @ research/advanced/read.
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
    'history/regional-histories/europe/east-european-identities-russia-and-ukraine',
    'research',
    'advanced',
    'read',
    $mn_easteurope_master$> **Who owns the past of Rus'?** This chapter follows how Russian, Ukrainian and Belarusian identities were formed and contested, from Kyivan Rus' to the present: the rival inheritances of Rus', the readings of Pereiaslav (1654), the imperial "all-Russian" nation against Mykhailo Hrushevsky's separate Ukrainian history, the language bans, the states of 1917–21, Ukrainization and its destruction, the memory of the OUN and UPA, Crimea and the Crimean Tatars, Belarus, 1991, and the "war over history" around Vladimir Putin's 2021 essay. Each national narrative is attributed; the war since 2022 is left to other chapters.

## Whose Rus'?

Kyivan Rus' was the first East Slavic state, ruled by the Rurik dynasty from the late ninth to the mid-thirteenth century, and it was multi-ethnic: East Slavic, Norse and Finnic. At its height, in the mid-eleventh century, it stretched from the White Sea to the Black Sea, with Kyiv as its capital from about 882 to 1240; around 1200 Kyiv, with perhaps 36,000 to 50,000 people, may have rivalled Paris. Vladimir the Great's conversion, about 988, is told in the chapter on Byzantium: the Empire of New Rome, and the Mongol sack of Kyiv in 1240 in the chapter on The Mongol Empire.

Its people called it simply "Rus'". The compound name "Kievan Rus'" is first found in a Polish text of 1582 and was popularised by nineteenth-century Russian imperial historians. That label already carried an argument, because "the modern nations of Belarus, Russia, and Ukraine all claim Kievan Rus' as their cultural ancestor", and Belarus and Russia take their names from it.

After the state fragmented, its lands went several ways. In the south-west, Galicia–Volhynia was united in 1199. In the north-east, Vladimir-Suzdal grew into Muscovy. The Grand Duchy of Lithuania, "largely Ruthenized", absorbed much of present Belarus and Ukraine, including Kyiv; its chancery wrote in Ruthenian, an ancestor of modern Ukrainian and Belarusian.

Muscovy built its claim step by step. In the 1320s Ivan I won over the metropolitan "of Kiev and all Rus'", who moved his residence from Vladimir to Moscow; in 1493 Ivan III took the title "Sovereign of All Russia"; by the mid-seventeenth century the tsar was "Tsar of All Great, Little, and White Rus'". The terms "Great" and "Little" Rus' came from Byzantine church usage, distinguishing the nearer metropolitanate of Halych ("Little") from the further one of Moscow ("Great"). They were probably geographic rather than hierarchical in origin; "Little Russian" is now derogatory in Ukrainian.

Three readings compete. The Russian imperial and Soviet view treats Kyivan Rus' as the "common cradle" of one Russian people, a view codified in the Soviet textbooks of 1937. The Ukrainian national view, set out by Hrushevsky, traces a separate line through Galicia–Volhynia. A third, proposed in 2006 by the historian Serhii Plokhy, now at Harvard, seeks to "denationalize" Kyivan Rus', separating it "as a multi-ethnic state from the national histories of Russia, Ukraine, and Belarus". The historian Charles Halperin noted in 2010 that the approach does not invalidate the rival claims but "merely relegates such pretensions entirely to the realm of ideology".

## Commonwealth, Cossacks and Pereiaslav

The Union of Lublin of 1 July 1569 created the Polish–Lithuanian Commonwealth. Most of present Ukraine passed to the Polish Crown, while the Belarusian lands stayed in the Grand Duchy. The Union of Brest (1595–96), by which Orthodox bishops accepted papal authority while keeping the Eastern rite, created the Greek Catholic Churches.

On the steppe frontier, peasants fleeing serfdom formed Cossack communities around the Zaporozhian Sich on the lower Dnieper. In 1648 Hetman Bohdan Khmelnytsky led a rising, remembered in Ukraine as the "National Liberation War", that created a Cossack state. It also brought mass atrocities against Poles, Jews and Catholic and Uniate clergy, remembered in Jewish tradition as *Gzeyres Takh Vetat*, the decrees of 1648–49. Estimates of Jewish deaths have fallen over time: older figures of 100,000 or more have given way to recent demographic studies suggesting some tens of thousands at most, perhaps up to about 20,000 in 1648 itself.

The Cossack polity called itself the "Zaporozhian Host"; "Hetmanate" is a term coined by historians in the late nineteenth century. Internally its land was "Ukraine" and its people the "Ruthenian nation"; in dealings with Moscow it was "Little Russia". In January 1654, at Pereiaslav, the Cossack leaders swore allegiance to Tsar Alexis. The tsar's envoy, Vasily Buturlin, refused to swear an oath in return, leaving it uncertain whether the agreement bound the tsar at all; the "March Articles" agreed in Moscow that spring granted broad autonomy. The chapter on Russia from Muscovy to Catherine the Great tells what followed, including Mazepa's defeat at Poltava in 1709; Catherine II abolished the hetmancy in 1764.

What Pereiaslav *meant* has been argued over ever since. Legal historians have read it as incorporation, autonomy, real or personal union, vassalage (Hrushevsky's view), protectorate or mere military alliance. Early Soviet historians saw a pact between feudal lords; from the 1930s under Stalin it became the "unification of two brotherly peoples", and Khmelnytsky a patriot. For the 1954 tercentenary of "Ukraine's reunification with Russia", the Communist Party's "Theses" asserted the common Rus' descent of Russians, Ukrainians and Belarusians. Ukrainian national historians, by contrast, see Pereiaslav as a lost chance for independence. The Cossacks themselves used both names: Pylyp Orlyk's constitution of 1710 calls the land "Little Russia" and "Ukraine".

## Empire and the Ukrainian Question

The idea of an "all-Russian nation", a "triune" people of Great, Little and White Russians, gained political weight in the late eighteenth century, when it helped justify Russian claims to the eastern lands of the partitioned Commonwealth. In the nineteenth century the official view treated Ukrainian and Belarusian as dialects of Russian. Identities were often layered: "for many residents of Dnieper Ukraine it was perfectly normal to be both a Little Russian and Russian", Gogol among them. The liberal Peter Struve defended the all-Russian nation, fearing that a separate Ukrainian identity meant provincialism.

Others thought differently. Taras Shevchenko, born a serf, wrote the *Kobzar*, a cornerstone of modern Ukrainian literature, and was exiled for his links to the Brotherhood of Saints Cyril and Methodius in Kyiv, broken up in 1847. Its founder, Mykola Kostomarov, later argued in his essay "Two Russian Nationalities" (1861) that there were two Rus' peoples and two languages.

The state answered with censorship. The Valuev Circular of 1863, issued by the interior minister Pyotr Valuev, banned religious, educational and primer books in "Little Russian" while allowing fiction. It blamed the "separatist intentions of some of the Little Russians" and quoted the Kiev Censorship Committee:

```quote
A separate Little Russian language never existed, does not exist, and shall not exist, and the tongue used by commoners is nothing but Russian corrupted by the influence of Poland.
Kiev Censorship Committee, quoted in the Valuev Circular · 18 (30) July 1863
```

The Ems Ukaz, signed by Alexander II in 1876, went further, banning Ukrainian printing (except historical documents and, with the censor's approval and in Russian spelling, fiction), imports of Ukrainian books, and plays, lectures and songs in Ukrainian. No Ukrainian books were printed in 1877. Yet enforcement was incomplete, and the ban was eased by 1905 without being formally revoked. The wider imperial setting is in the chapter on Imperial Russia from Napoleon to 1905.

Galicia, under Austria, became the free centre of the movement. In 1894 **Mykhailo Hrushevsky** took the new chair of Ukrainian history at Lviv. His ten-volume *History of Ukraine-Rus'* traced a continuous Ukrainian past from the steppe through Kyivan Rus' to the Cossacks, with Galicia–Volhynia, not Vladimir-Suzdal, as the heir of Kyiv, and with the "popular masses" at the centre. His 1904 essay on "the traditional scheme of 'Russian' history" argued that Ukrainian history was distinct from Russian in origin and development. Hrushevsky is "often considered the country's greatest modern historian".

Imperial officials blamed Ukrainian identity on a "Polish intrigue" and Austria; Ukrainian historians stress Shevchenko, Kostomarov and the failure of the bans. The Russian historian Alexei Miller, in *The Ukrainian Question* (2003), framed the nineteenth century as a contest between competing, mutually exclusive nation-building projects, all-Russian and Ukrainian. (Since 2014, by one account, Miller has supported the Kremlin line.) Geoffrey Hosking argued more broadly that in Russia "state-building had impeded nation-building", a thesis that, replying to a review by Peter Gatrell, Hosking himself called "polemical – and perhaps one-sided".

{{image: Mykhailo Hrushevsky | Mykhailo Hrushevsky, the historian of "Ukraine-Rus'" who led the Central Rada in 1917–18.}}

## Revolution and the Lost States, 1917–21

The **Central Rada** was formed in Kyiv in March 1917, with Hrushevsky at its head. Its First Universal (June 1917) sought autonomy within Russia; the Third (November 1917) proclaimed the Ukrainian People's Republic within a federal Russia, granting minorities national-personal autonomy; the Fourth, of 22 January 1918, declared independence. A rival Soviet Ukrainian government in Kharkiv, backed by Soviet Russia, fought it.

Regimes followed in quick succession, from Pavlo Skoropadsky's German-backed rule as Hetman in 1918 to the Directory, which in January 1919 united with the West Ukrainian People's Republic of Galicia. In 1920 Petliura allied with Poland, a deal Hrushevsky condemned; the Peace of Riga in March 1921 divided Ukrainian lands between Poland and Soviet Ukraine.

For Ukraine's Jews these years were catastrophic: over a thousand pogroms, most in 1919, were committed by units of the republic's army, Denikin's Whites, independent warlords and, less often, Red Army units; the chapter on The Soviet Union gives estimates of the dead from about 35,000 to 250,000. The exiled republic outlived the Soviet one: in 1992 its government in exile handed its symbols of authority to the president of independent Ukraine.

Putin would later claim that Lenin created Ukraine. Plokhy replied:

```quote
Of course, Lenin did not create Ukraine. In 1918, he started a war against an independent Ukrainian state and then replaced it with a puppet state called the Ukrainian Soviet Socialist Republic. ... Lenin was the creator of modern Russia, not Ukraine …
Serhii Plokhy · to BBC News Ukrainian (translated) · February 2022
```

```checkpoint
q: Why does the name "Kievan Rus'" itself matter to the debate over its legacy?
a*: Because the compound name is a later label, first found in 1582 and popularised by Russian imperial historians, while all three modern nations claim the state as their ancestor.
a: Because it was the official name used by the princes of Kyiv.
x: In its own time the state was called simply "Rus'".
a: Because it was invented by Soviet historians in 1954.
x: The name is first found in a Polish text of 1582; the 1954 tercentenary concerned Pereiaslav.
a: Because only Belarus uses it.
x: Belarus, Russia and Ukraine all claim Kyivan Rus' as their cultural ancestor.
hint: Think of what the people of Rus' called their own state.
why: Names of the past are not neutral; the label itself carries a view of who inherited Rus'.
---
q: How did Stalin-era Soviet historians reinterpret the Pereiaslav agreement of 1654?
a: As a feudal pact between lords, of no national significance.
x: That was the earlier Soviet reading, in class terms, before the 1930s.
a: As Ukraine's lost chance for independence.
x: That is the Ukrainian national reading, not the Soviet one.
a*: As the "unification of two brotherly peoples", with Khmelnytsky as a patriot.
a: As a personal union of two equal crowns.
x: Personal union is one of several legal readings, not the Stalin-era line.
hint: Think of the 1954 tercentenary celebrations.
why: The meaning of Pereiaslav shifted with political needs, which is why it remains contested.
```

## Ukrainization, Terror and Famine

From 1923 a policy of **Ukrainization**, part of the wider *korenizatsiia* ("rooting"), promoted the Ukrainian language. By 1929 over 97 per cent of high-school students in the republic were taught in Ukrainian, and by 1931, 373 of 426 newspapers were Ukrainian. Hrushevsky himself returned in 1924. The writer Mykola Khvylovy urged Ukrainian literature to turn from Moscow towards Europe.

The reversal was brutal. A 1930 show trial convicted 45 intellectuals of a fictitious "Union for the Liberation of Ukraine", and some 30,000 more (over 30,000, according to the historian Victoria Malko) were arrested, deported or executed over the decade. Hrushevsky was exiled to Moscow in 1931; Khvylovy and the education commissar Skrypnyk killed themselves in 1933. Almost 300 figures of the cultural revival were shot at Sandarmokh in 1937. In 1959 Jerzy Giedroyc gave this generation its name: the "Executed Renaissance".

The **Holodomor** ("death by hunger"), the man-made famine of 1932–33, struck at the same time. Its course and the debate over whether it was genocide are covered in the chapter on The Soviet Union. That chapter gives "3.5–5 million" as the range of recent scholarship; some scholars put it a little lower, about 3.2 million (Kulchytsky) or about 3.3 million (Snyder), so most estimates fall between about 3 and 5 million. This chapter's concern is memory. The word *holodomor* became standard in the diaspora by the 1980s and was first used publicly in Ukraine by Ivan Drach in 1986; discussion had been banned until glasnost. Since 2006 Ukraine and 33 other UN member states have recognised the famine as genocide. Memory politics also inflated the numbers: President Viktor Yushchenko spoke of ten million dead and, before the US Congress, of twenty. Snyder answered that Yushchenko "does his country a grave disservice" by exaggerating, while insisting that the famine "was a result of purposeful political decisions".

## War, Nationalists and Neighbours

Timothy Snyder's *Bloodlands* (2010) counts an estimated 14 million non-combatants killed by Stalin's and Hitler's regimes in 1933–45 in a region stretching from Poland through Belarus and Ukraine to western Russia, a framing Richard Evans and Omer Bartov criticised. Ukraine's civilian losses are estimated at about seven million, including over a million Jews; Belarus lost about a quarter of its population. The murder of Ukraine's Jews, including at Babi Yar, is told in the chapter on The Holocaust.

No part of this history is more divisive than the nationalist **OUN**. It split in 1940, and the more radical faction under Stepan Bandera (OUN-B) proclaimed a Ukrainian state in German-occupied Lviv on 30 June 1941, pledging cooperation with Nazi Germany. The Germans rejected it and imprisoned Bandera. Snyder characterises Bandera's goal as "a one-party fascist dictatorship free of national minorities". In the Lviv pogroms of 1941, OUN militia, German Einsatzgruppen and local residents killed thousands of Jews; the extent of nationalist responsibility is debated.

The OUN-B founded the **Ukrainian Insurgent Army** (UPA) in October 1942. From 1943 it carried out the ethnic cleansing of Poles in Volhynia and then Eastern Galicia; a commander's order of June 1943 called for the "general physical liquidation of the entire Polish population". Estimates of Polish dead are about 50,000–60,000 in Volhynia and 20,000–25,000 in Eastern Galicia; Poland's Institute of National Remembrance puts the total at up to 100,000. Polish retaliation killed some 2,000–3,000 Ukrainians in Volhynia and 1,000–2,000 in Eastern Galicia, according to the historian Grzegorz Motyka; counting fighters and killings after the war, Grzegorz Rossoliński-Liebe gives 10,000–20,000. Poland's parliament calls the massacres genocide; Ukraine and some non-Polish historians call them ethnic cleansing. Presidents Duda and Zelenskyy commemorated the victims together in Lutsk in July 2023.

Memory remains split. In Ukrainian state commemoration, the UPA were fighters for independence against two tyrannies: Yushchenko made Bandera a Hero of Ukraine in 2010 (annulled in 2011), and a 2015 law honoured the UPA among "fighters for the independence of Ukraine". To Polish memory and to historians such as Rossoliński-Liebe, Per Anders Rudling and John-Paul Himka, they were also perpetrators of ethnic cleansing and anti-Jewish violence. In Soviet and Russian usage, "Banderite" became a slur for any Ukrainian nationalist.

## Crimea and the Crimean Tatars

The Crimean Khanate ruled from 1441 until Russia annexed it in 1783, when Crimean Tatars made up 98 per cent of the peninsula's population. After waves of emigration to the Ottoman Empire, they were 19.4 per cent by 1939.

On 18–20 May 1944, on Stalin's order, at least 191,044 Crimean Tatars were deported, mainly to Uzbekistan, in what they call the *Sürgünlik*. The pretext was collaboration, yet about 40,000 Crimean Tatars served in the Red Army against about 20,000 with the Axis. Estimates of deaths in exile range from 18 per cent (Ediev) to the NKVD's own 27 per cent; Crimean Tatar activists give 46 per cent. Return was banned until perestroika; in 1989 the USSR Supreme Soviet declared the deportations a crime, and about 260,000 people came back. Ukraine and several other states now call the deportation genocide.

In 1954 the Presidium of the USSR Supreme Soviet transferred Crimea from the Russian republic to the Ukrainian one, presenting the transfer as part of the Pereiaslav tercentenary. In 1991 Crimea voted 54.19 per cent for Ukrainian independence, only 37 per cent of its electorate. In 2014 Crimean Tatars mostly boycotted the referendum held under Russian control, and afterwards their Mejlis leaders were barred from the peninsula.

## Belarus: A Quieter Divergence

Belarus shared Kyivan Rus' and the Grand Duchy of Lithuania but took a different road. A Belarusian People's Republic was proclaimed under German occupation on 25 March 1918; its council withdrew to Vilnius and Hrodna when the Red Army took Minsk that December, and went into exile in 1919. Its white-red-white flag was independent Belarus's from 1991 to 1995. Much of the national intelligentsia was executed in the Great Purge. After Lukashenko's election in 1994, a referendum in May 1995, which the OSCE Parliamentary Assembly said violated international standards, made Russian an equal state language, restored Soviet-style symbols and backed integration with Russia. After the disputed election of 2020 the UN cited hundreds of documented cases of torture or ill-treatment of detainees, and in 2022 Russian forces invaded Ukraine partly from Belarusian territory.

## 1991 and After

Ukraine's parliament declared independence on 24 August 1991, and the referendum of 1 December, described in the chapter on Collapse of the Soviet Union and Eastern Europe: the End of the Cold War, approved it with 92.3 per cent of valid votes on a turnout of 84.18 per cent. Every region voted yes, with different margins: 98.67 per cent in Ternopil, 83.90 per cent in Donetsk, 54.19 per cent in Crimea. Under the Budapest Memorandum of 1994, Ukraine gave up the world's third-largest nuclear stockpile for security assurances from Russia, the United States and Britain.

Independent Ukraine argued over its identity in the open. A book published in Moscow in 2003 under President Kuchma's name (reportedly ghost-written) was titled *Ukraine Is Not Russia*. The Orange Revolution of 2004 overturned a rigged election; the Euromaidan of 2013–14, begun when Yanukovych declined to sign an EU association agreement, ended with 108 protesters killed and his flight. The Russian state called it a US-organised "coup"; the radical nationalist groups involved were a minority whose role, scholars have argued, was greatly exaggerated in Russian state media and in some Western media.

Russia annexed Crimea on 18 March 2014, and the war in the Donbas killed 14,200–14,400 people by the end of 2021, according to the UN. On 24 February 2022 Russia launched what Putin called a "special military operation" to "demilitarise and denazify" Ukraine. The war is covered in the chapter on Modern Conflicts since 1991, its international setting in the chapter on The Post-Cold War Era.

## The War over History

On 12 July 2021 Putin published an essay, *On the Historical Unity of Russians and Ukrainians*. It argued that Russians, Ukrainians and Belarusians are one people, the old "triune" nation; questioned Ukraine's borders as drawn between 1954 and 1991; called modern Ukraine an "anti-Russia project"; and compared "the formation of an ethnically pure Ukrainian state, aggressive towards Russia" to a weapon of mass destruction. In February 2022 he declared, in the Kremlin's English translation, that "modern Ukraine was entirely created by Russia or, to be more precise, by Bolshevik, Communist Russia" and that it had "never had stable traditions of real statehood". The essay restates the imperial all-Russian idea.

The replies were swift. President Zelenskyy compared Putin's "brotherhood" to that of Cain and Abel. The Institute of History of Ukraine said the essay reproduced Russian imperial views. Analysts at Carnegie saw a "historical, political, and security predicate for invading"; Anders Åslund called it "one step short of a declaration of war"; Snyder called it "bad history". In April 2022, 91 per cent of Ukrainians polled by the Rating Group rejected the idea that Russians and Ukrainians are one people.

Between these poles lie other voices. The Russian scholar Dmitry Likhachov gave the unity view a cultural form, seeing the two cultures as a "dualistic unity", each "meaningless" without the other; Andreas Kappeler wrote of "unequal brothers". The realist John Mearsheimer blamed NATO and EU enlargement for the crisis of 2014, a view Alexander Motyl and others rebutted. The field itself has changed: in 1995 Mark von Hagen asked "Does Ukraine Have a History?", noting its weak standing in Western academia; in 2024 Georgiy Kasianov answered with a plural, "Does Ukraine Have Histories?". The question is no longer whether there is a Ukrainian history, but how many stories the lands of old Rus' can hold.

```checkpoint
q: What was the significance of Galicia for the Ukrainian national movement before 1914?
a: It was the centre of Russian censorship of Ukrainian books.
x: Galicia was under Austrian rule, outside the reach of the Valuev Circular and the Ems Ukaz.
a*: Under Austrian rule it allowed Ukrainian scholarship and publishing, such as Hrushevsky's chair at Lviv, while these were restricted in the Russian Empire.
a: It was where the Pereiaslav agreement was signed.
x: Pereiaslav lies in Dnieper Ukraine, and the agreement dates from 1654.
a: It was the capital of the Soviet Ukrainian republic.
x: Before 1914 Galicia was an Austrian province; the Soviet Ukrainian republic did not yet exist, and in the 1920s its capital was Kharkiv.
hint: Think about which empire ruled Lviv.
why: The border between empires let a movement banned in one flourish in the other.
---
q: How do Polish and Ukrainian official positions differ on the massacres of Poles in Volhynia and Eastern Galicia (1943–45)?
a: Both governments deny the massacres took place.
x: Both acknowledge them; Presidents Duda and Zelenskyy commemorated the victims together in 2023.
a: Poland calls them ethnic cleansing and Ukraine calls them genocide.
x: It is the other way round.
a: Both agree they were reprisals for Soviet deportations.
x: The UPA's order of June 1943 called for the liquidation of the Polish population, not reprisal against Soviets.
a*: Poland's parliament calls them genocide; Ukraine and some non-Polish historians call them ethnic cleansing.
hint: Think of the 2016 Polish day of remembrance.
why: The dispute is about classification, not about whether the killings happened.
```

## Further exploration

- **Serhii Plokhy, *The Gates of Europe: A History of Ukraine* (2015).** The standard one-volume history of Ukraine.
- **Serhii Plokhy, *The Origins of the Slavic Nations: Premodern Identities in Russia, Ukraine and Belarus* (2006).** The argument for a "denationalised" Kyivan Rus'.
- **Andrew Wilson, *The Ukrainians: Unexpected Nation* (2000).** Identity, myth and politics, later expanded and retitled.
- **Timothy Snyder, *The Reconstruction of Nations: Poland, Ukraine, Lithuania, Belarus, 1569–1999* (2003).** How the heirs of the Commonwealth became modern nations.
- **Alexei Miller, *The Ukrainian Question: The Russian Empire and Nationalism in the Nineteenth Century* (2003).** Russian and Ukrainian nation-building as rival projects.
- **Serhy Yekelchyk, *Ukraine: Birth of a Modern Nation* (2007).** A concise modern history.
- **Andreas Kappeler, *The Russian Empire: A Multi-ethnic History* (2001).** The empire seen through its many peoples.$mn_easteurope_master$,
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
  select $mn_easteurope_quiz$[
    {"type": "mcq", "prompt": "Where did the terms \"Little\" and \"Great\" Rus' originally come from?", "options": ["Byzantine church usage distinguishing the nearer metropolitanate of Halych from the further one of Moscow", "A decree of Catherine II ranking the peoples of the empire", "Hrushevsky's History of Ukraine-Rus'", "The Soviet textbooks of 1937"], "answerIndex": 0, "explanation": "The terms came from Byzantine church usage and were probably geographic rather than hierarchical in origin.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Ems Ukaz of 1876 do?", "options": ["It made Ukrainian an official language of the Russian Empire", "It abolished the Cossack Hetmanate", "It banned Ukrainian-language printing (with narrow exceptions), imports of Ukrainian books, and Ukrainian plays, lectures and songs", "It transferred Crimea to Ukraine"], "answerIndex": 2, "explanation": "Signed by Alexander II, the Ems Ukaz extended the Valuev Circular of 1863; no Ukrainian books were printed in 1877, though enforcement was incomplete and the ban was eased by 1905.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the pretext for the deportation of the Crimean Tatars in May 1944, and why is it contested?", "options": ["Famine relief; few were in fact moved", "Collaboration with the Axis, although about 40,000 Crimean Tatars served in the Red Army against about 20,000 with the Axis", "A population exchange agreed with Turkey", "The transfer of Crimea to the Ukrainian SSR"], "answerIndex": 1, "explanation": "At least 191,044 Crimean Tatars were deported on Stalin's order for alleged collaboration, though twice as many served in the Red Army as with the Axis; the USSR Supreme Soviet declared the deportations a crime in 1989.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Serhii Plokhy propose for the history of Kyivan Rus'?", "options": ["That it was the cradle of a single all-Russian people", "That it was founded by Lithuanians", "That it was the direct ancestor of Ukraine alone, through Galicia–Volhynia", "That it should be 'denationalized', treated as a multi-ethnic state separate from the national histories of Russia, Ukraine and Belarus"], "answerIndex": 3, "explanation": "Plokhy (2006) proposed denationalizing Kyivan Rus'; Halperin noted that this 'merely relegates such pretensions entirely to the realm of ideology'.", "id": "q4"},
    {"type": "open", "prompt": "Explain why the Pereiaslav agreement of 1654 has been read in so many different ways, and how its interpretation changed in Soviet times.", "rubric": "Full marks: notes that Buturlin refused to swear an oath on the tsar's behalf, leaving the legal force uncertain; lists several legal readings (incorporation, autonomy, real or personal union, vassalage, protectorate, military alliance); describes the shift from early Soviet class readings to Stalin-era 'unification of two brotherly peoples' and the 1954 tercentenary; contrasts the Ukrainian national view of a lost chance for independence.", "id": "q5"},
    {"type": "open", "prompt": "Compare Putin's 2021 essay On the Historical Unity of Russians and Ukrainians with the responses of historians and Ukrainians to it.", "rubric": "Full marks: summarises the essay's claims (one people, the triune nation; questioning Ukraine's borders; modern Ukraine as an 'anti-Russia project') and links it to the imperial all-Russian idea; gives attributed responses (Zelenskyy's Cain and Abel, the Institute of History of Ukraine, Åslund, Snyder's 'bad history', Plokhy on Lenin); mentions the 2022 poll in which 91 per cent of Ukrainians rejected the 'one people' thesis; shows awareness that Hrushevsky's separate Ukrainian history is the older counter-narrative.", "id": "q6"}
  ]$mn_easteurope_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/europe/east-european-identities-russia-and-ukraine', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
