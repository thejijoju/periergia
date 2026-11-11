-- The Soviet Union: History of the Soviet Empire — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-soviet-union-history-of-the-soviet-empire @ research/advanced/read.
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
    'history/20th-century-history/the-soviet-union-history-of-the-soviet-empire',
    'research',
    'advanced',
    'read',
    $mn_soviet_master$> **A revolution that became an empire of nations.** Out of the revolutions of 1917, civil war and famine, the Bolsheviks built the Union of Soviet Socialist Republics: a state of more than a hundred peoples that first promoted its nations' languages and leaders, and then subjected them to collectivisation, famine, terror, the Gulag and mass deportation. This chapter follows the Soviet Union from 1917 to 1991, treating the war, the Cold War and the final years briefly because other chapters cover them. It looks at the Union from its edges as well as from Moscow, from Ukrainian and Kazakh villages, Chechen and Crimean Tatar exiles and the cotton fields of Central Asia, and ends with the arguments historians still have about what the Soviet Union was.

## A State of Many Nations

When it ended in 1991, the Soviet Union had an estimated 293 million people from more than a hundred ethnic groups. A 1990 estimate put Russians at just under 51 per cent, Ukrainians at about 15 per cent and Uzbeks at nearly 6 per cent: Russians were barely a majority. Institutions were formally neutral between nationalities, and Stalin himself was Georgian, yet Russians were overrepresented at the top. That tension between a union of equal nations and a state run from Moscow runs through the whole story. The chapter on Imperial Russia from Napoleon to 1905 describes the empire, and the borderlands, that the Soviet state inherited.

## 1917: Two Revolutions, Two Calendars

Russia used the Julian, or Old Style, calendar until 1918, so its dates ran behind the New Style dates used in the West, which is why the revolutions' names do not match the months given in the chapter on the First World War. The **February Revolution** began in Petrograd on 23 February Old Style (8 March New Style), when protests against food rationing were joined by women marking International Women's Day. Within days Nicholas II abdicated, ending Romanov rule. A Provisional Government then shared power uneasily with the Petrograd Soviet of workers' and soldiers' deputies.

The Bolsheviks, led by Vladimir Lenin, won support with the slogans "peace, land, and bread" and "All power to the Soviets". The **October Revolution** began on 25 October Old Style (7 November New Style), and the Winter Palace, seat of the Provisional Government, was taken that night with few casualties. But the Bolsheviks won only about a quarter of the seats (175 of some 765 deputies) in elections to a Constituent Assembly, which met for one day in January 1918 and was dissolved. Lenin had already created a secret police, the **Cheka**, in December 1917. In March 1918 the regime made peace with Germany at Brest-Litovsk, as Finland, Lithuania, Latvia, Ukraine and others declared independence.

## Civil War, Terror and Famine

The Civil War killed an estimated 7 to 12 million people, most of them civilians; the historian Andrea Graziosi finds that the great majority of civilian excess deaths in 1914–22 came from starvation and epidemics. After an attempt on Lenin's life in August 1918 the Bolsheviks launched the **Red Terror**, whose dead are estimated at anywhere from about 50,000 to 600,000; estimates of the Whites' terror range from 20,000 to 300,000, and estimates of the Jews killed in pogroms in Ukraine run from about 35,000 to 250,000. Earlier, in February 1918, the Bolsheviks had stormed Kokand, seat of an autonomous government in Turkestan, massacring between 10,000 and 25,000 people, and the Basmachi resistance in Central Asia was largely crushed by the mid-1920s, though fighting continued into the early 1930s.

Under **War Communism**, from June 1918, the state nationalised industry and requisitioned grain by force. By 1921 the harvest was about 37 per cent of normal. Peasants rose in revolt, and in March 1921 the Kronstadt sailors, demanding freely elected soviets and free speech, were crushed. The famine of 1921–22 in the Volga and Ural regions, including Tatarstan, killed about 5 million people (estimates range from 1 to 10 million), even though American and international relief was feeding over 10 million people a day at the peak.

## NEP and the Making of the Union

In March 1921 Lenin retreated. The **New Economic Policy** (NEP) replaced requisitioning with a tax in kind and let peasants sell their surplus; private traders, the "NEPmen", reappeared. Stalin abandoned it from 1928.

On 30 December 1922 delegations from Russia, Ukraine, Byelorussia and the Transcaucasian federation of Georgia, Armenia and Azerbaijan approved the treaty creating the **Union of Soviet Socialist Republics**, which had fifteen republics by the end. The same day the ailing Lenin accused Stalin and two colleagues of "Great Russian chauvinism" over their treatment of Georgian Bolsheviks. In the dictated notes known as his "Testament" he went further.

```quote
Stalin is too coarse and this defect, although quite tolerable in our midst and in dealing among us Communists, becomes intolerable in a Secretary-General. That is why I suggest that the comrades think about a way of removing Stalin from that post...
Vladimir Lenin · Postscript to his "Testament" · January 1923
```

Lenin died on 21 January 1924, and Stalin stayed. Yet the early Union also did something remarkable. From 1923 the policy of ***korenizatsiia*** ("indigenisation") promoted each republic's "native" nationality: schooling and administration in its language, local people raised into government and the party, national districts for minorities, and new alphabets so that national languages could be taught. The historian Terry Martin called the result an "affirmative action empire", the first of Europe's multiethnic states to promote the national consciousness of its minorities systematically, with what he calls the world's first mass affirmative action programmes. In Ukraine the Bolshevik Mykola Skrypnyk led Ukrainisation as Commissar of Education. It did not last. Between 1933 and 1938 indigenisation stopped being enforced, republican leaderships were purged and the press began to praise Russian language and culture; in Martin's account Stalin re-established the Russians as the leading nationality. Skrypnyk killed himself in July 1933 rather than recant, and the writers cut down in the 1930s are remembered as the "Executed Renaissance".

## Revolution from Above

From 1928 Stalin launched what the overview of the twentieth century calls a "revolution from above". In a 1931 speech he warned that the country lagged far behind the advanced countries and had to catch up fast or go under. The **First Five-Year Plan** (1928–32) built new industrial centres such as Magnitogorsk, a steel town in the southern Urals modelled on Gary, Indiana.

The countryside paid. In November 1929 the party ordered rapid **collectivisation**: 7.5 per cent of peasant households were in collective farms in October 1929, 52.7 per cent by February 1930. Peasants slaughtered their livestock rather than surrender it, and women led many of the riots, the *bab'i bunty*. In March 1930 Stalin blamed officials who had become "dizzy with success" and briefly slowed the drive. Alongside it ran **dekulakisation**, the "liquidation of the kulaks as a class", although only about 1 per cent of peasants employed labourers. Some 2.1–2.3 million people were deported to "special settlements" in 1930–33.

## The Famines of 1930–33

Collectivisation brought famine, and it fell hardest on two nations. In Ukraine the famine of 1932–33, the **Holodomor** ("death by hunger"), killed 3.5–5 million people according to recent scholarship. The "Law of Spikelets" of August 1932 allowed prosecution even for gleaning grain. From November villages and farms could be "blacklisted": loans called in, shops closed, food and livestock confiscated. In Ukraine 37 of 392 districts were blacklisted, as were Cossack villages in the Kuban and on the Volga, and some blacklisted areas around Kharkiv had death rates above 40 per cent. In January 1933 Stalin signed a secret directive restricting peasants' travel out of Ukraine and the Kuban; Kotkin reads it as an attempt to contain famine-borne disease, others as deliberate. When the Welsh journalist Gareth Jones reported the famine in March 1933, *The New York Times*' Walter Duranty echoed Soviet denials.

In Kazakhstan the famine, the ***Asharshylyq***, began in late 1930 and was proportionally worse still. Collectivisation was combined with the forced settlement of nomadic herders and crushing quotas of grain and livestock. Between 1.3 and 2.3 million people died, 38–42 per cent of all Kazakhs, the highest proportion of any people; Kazakhs fell from about 60 per cent of the republic's population to 38 per cent. Between 665,000 and 1.1 million became refugees, and thousands were shot fleeing to China.

```checkpoint
q: What was korenizatsiia?
a*: A policy from 1923 that promoted each republic's own nationality, language and local leaders, before it was quietly abandoned in the 1930s.
a: A campaign to make Russian the only language of schooling across the Union.
x: That is close to the opposite: korenizatsiia taught and administered in national languages.
a: The forced settlement of Kazakh nomads in the 1930s.
x: Sedentarisation was part of collectivisation in Kazakhstan, which brought famine, not indigenisation.
a: Lenin's plan to return land to the landlords under the NEP.
x: The NEP let peasants sell their surplus; it did not restore landlords, and it concerned the economy, not nationality.
hint: The word means "indigenisation".
why: Korenizatsiia is the heart of Terry Martin's "affirmative action empire", a state that built nations as well as ruling them.
---
q: Which statement about the Kazakh famine of 1930–33 matches the evidence?
a: It killed few people because nomads could move their herds away.
x: Between 1.3 and 2.3 million died, and some who fled were shot at the Chinese border.
a: It began only after the Ukrainian famine had ended.
x: It began in late 1930, before the worst of the Ukrainian famine.
a*: Between 38 and 42 per cent of all Kazakhs died, the highest proportion of any group in the Soviet famines.
a: It is universally agreed to have been a genocide.
x: A Kazakh commission called it genocide, but others see it as part of the wider Soviet famine.
hint: Think of the share of a whole people, not just the total.
why: Forced sedentarisation and collectivisation made the Kazakhs, proportionally, the worst-hit nation of the famines.
```

## Terror, the Gulag and Deported Peoples

The camp system known as the **Gulag** was set up in 1930. Between 1930 and 1953 about 14 million people passed through its camps and 4 million through its labour colonies. The "tentative consensus" of historians is that roughly 1.5–1.7 million people died in detention or soon after release; higher estimates, up to 6 million, are disputed.

The **Great Terror** peaked between September 1936 and August 1938. Show trials condemned Zinoviev, Kamenev, Bukharin and others, and the Red Army's high command was purged, but most victims were ordinary people. NKVD Order No. 00447 of July 1937 set regional quotas for shooting and for the camps, later exceeded many times over; this "kulak operation" alone executed more than 370,000 people. "National operations" targeted Poles, Finns, Latvians, Greeks, Chinese and others. The official count of verifiable executions in 1937–38 is 681,692, or about 680,000; total deaths, including those who died in detention, are estimated at 700,000 to 1.2 million.

Whole nations were declared enemies. In 1937 nearly 172,000 Soviet Koreans were moved from the Far East to Central Asia on the pretext of stopping Japanese espionage. In 1941 the entire population of the Volga German republic was deported to Siberia and Kazakhstan. In 1943–44 the Kalmyks, the Chechens and Ingush and the Crimean Tatars followed, and other peoples of the Caucasus were deported too. Of 496,000 Chechens and Ingush deported in February 1944, at least a quarter died; Chechens remember it as *Aardakh*, "the Exodus". The Crimean Tatars, at least 191,044 people, including party members and Red Army soldiers, were sent mainly to Uzbekistan in May 1944, and tens of thousands died in exile. In all, forced migrations inside the Soviet Union affected at least 6 million people.

## War and Late Stalinism

The Soviet Union's war began with the Molotov–Ribbentrop Pact and the invasion of eastern Poland, as the chapters on the Interwar Period and the Second World War describe. In April–May 1940, on an order signed by Stalin and five other leaders, nearly 22,000 Polish officers, police and members of the intelligentsia were shot in the Katyn massacre. After Germany invaded in 1941 the Soviet peoples fought what they called the Great Patriotic War. The Eastern Front saw, by one estimate, more than 80 per cent of all the combat of the Second World War; Stalingrad, from the summer of 1942 to 2 February 1943, was its turning point; and Soviet war dead numbered about 27 million. The Second World War chapter tells this story, and the chapter on the Yalta Conference covers the Allied bargaining over the peace.

Victory brought no relief. A famine in 1946–47 killed between several hundred thousand and 2 million people. A 1946 party resolution attacked two journals for publishing Anna Akhmatova and Mikhail Zoshchenko, the Jewish Anti-Fascist Committee was destroyed amid a campaign against "rootless cosmopolitans", and in January 1953 nine eminent Moscow doctors, mostly Jewish, were accused of plotting to poison Soviet leaders. Stalin died on 5 March 1953, and within a month the doctors were cleared.

## An Empire in Eastern Europe

How Soviet power came to stretch across Eastern Europe belongs to the chapter on the Global Cold War and the Arms Race; here the question is how it was held. In June 1953 a builders' strike in East Berlin became a rising of over a million people across East Germany, put down with Soviet forces. In 1955 the USSR and seven Eastern Bloc states formed the **Warsaw Pact**. In October 1956 a revolution began in Budapest, and Imre Nagy's government declared Hungary's withdrawal from the Pact; Soviet forces attacked on 4 November, about 2,500 Hungarians were killed (estimates run from some 2,000 to 3,000), 200,000 fled, and Nagy was later executed. In August 1968 the "Prague Spring" of the Czechoslovak leader Alexander Dubček was ended by an invasion that rose to about half a million troops from the USSR, Poland, Bulgaria and Hungary. The "Brezhnev Doctrine", first set out in *Pravda* that September, stood until 1989, when it was superseded by the so-called "Sinatra Doctrine" as revolutions swept Eastern Europe; the chapter on the Global Cold War and the Arms Race follows that story.

## Khrushchev, the Thaw and the Superpower

After midnight on 25 February 1956, at a closed session of the 20th Party Congress, Nikita Khrushchev spoke for about four hours against Stalin's "cult of personality". Stalin, he said, had turned to mass repression and the physical destruction even of people who had committed no crime. The speech was not published in the USSR until 1989, but copies were mailed around the country.

The "Thaw" that followed brought real change. An amnesty in 1953 freed many prisoners, and in 1954 inmates at Kengir, in Kazakhstan, men and women, governed their camp for 40 days before tanks crushed them. Chechens, Ingush and Kalmyks were allowed home in 1957, though Crimean Tatars and Volga Germans were not. In 1962 Aleksandr Solzhenitsyn's *One Day in the Life of Ivan Denisovich*, the first account of the camps published in the Soviet Union, appeared with Khrushchev's approval. The limits were clear too. The **Virgin Lands** campaign from 1954 ploughed up Kazakh pasture over the objections of Kazakh party leaders and caused severe soil erosion, and in 1962 troops at Novocherkassk fired on workers striking over food prices. When his colleagues removed him in October 1964, Khrushchev drew his own lesson.

```quote
Could anyone have dreamed of telling Stalin that he didn't suit us anymore and suggesting he retire? Not even a wet spot would have remained where we had been standing. Now everything is different. The fear is gone, and we can talk as equals. That's my contribution.
Nikita Khrushchev, as quoted by Taubman · On his removal · October 1964
```

By then the Soviet Union was a nuclear superpower, and the chapter on the Global Cold War and the Arms Race covers the arms race. On 4 October 1957 it launched **Sputnik 1**, setting off the space race, and on 12 April 1961 Yuri Gagarin became the first person in space, taking off from Baikonur, in Kazakhstan.

## Stagnation, Cotton and Dissent

Gorbachev later called Leonid Brezhnev's rule (1964–82) the "Era of Stagnation": industrial growth slowed in the 1970s as heavy and arms industry came before consumer goods. In Central Asia the Amu Darya and Syr Darya rivers were diverted to irrigate cotton, "white gold", and by 1988 Uzbekistan was the world's largest cotton exporter. The **Aral Sea**, once the world's fourth-largest lake, began to shrink in the 1960s and by 2007 was a tenth of its original size, devastating the fishing industry of Karakalpakstan and Kyzylorda; Ban Ki-moon, as UN Secretary-General, called it "clearly one of the worst environmental disasters of the world".

{{image: Aral Sea | The Aral Sea then and now: Soviet irrigation for cotton drained what had been the world's fourth-largest lake.}}

Dissenters faced prison, labour camps, psychiatric hospitals or expulsion abroad. Solzhenitsyn won the Nobel Prize in Literature in 1970; after *The Gulag Archipelago* appeared in Paris in 1973, he was stripped of his citizenship and expelled in 1974. Andrei Sakharov, who had helped build the first Soviet megaton hydrogen bomb, won the Nobel Peace Prize in 1975 and was exiled to the closed city of Gorky in 1980 after protesting the invasion of Afghanistan; his wife Yelena Bonner was later exiled there too. Mustafa Dzhemilev, deported as a Crimean Tatar baby in 1944, grew up in Uzbekistan, became a dissident and survived a 303-day hunger strike through force-feeding.

## Afghanistan, Chernobyl and the End

Soviet troops entered Afghanistan in December 1979 and stayed until February 1989; officially 14,453 Soviet soldiers and an estimated 1–3 million Afghans died, and millions of Afghans fled to Pakistan and Iran. On 26 April 1986 reactor 4 at Chernobyl, in the Ukrainian SSR, exploded. The government acknowledged it publicly only two days later, by which time radiation alarms had sounded in Sweden; well over 100,000 people were evacuated.

Mikhail Gorbachev, general secretary from 1985, sought to renew the system through *glasnost* ("openness") and *perestroika* ("restructuring"). The nations answered. In December 1986 Kazakhs protested in Alma-Ata when their leader was replaced by a Russian; in April 1989 soldiers killed 21 demonstrators, mostly women, in Tbilisi; in August 1989 about two million people formed a 675-kilometre human chain across Estonia, Latvia and Lithuania. After a failed coup in August 1991, the leaders of Russia, Ukraine and Belarus declared the Union at an end, and on 26 December 1991 it was formally dissolved. All fifteen republics became independent states, and all but the three Baltic states and Georgia joined the new Commonwealth of Independent States in December 1991 (Georgia joined in 1993).

```checkpoint
q: What did Khrushchev's Secret Speech of February 1956 do?
a: It was published in Pravda the next morning for every Soviet citizen to read.
x: It was given to a closed session and not published in the USSR until 1989, though copies were circulated.
a*: It denounced Stalin's cult of personality and his repressions before a closed session of the 20th Party Congress.
a: It announced the founding of the Warsaw Pact.
x: The Warsaw Pact was signed in 1955, the year before.
a: It ordered the deportation of the Chechens and Ingush.
x: Those deportations took place in 1944; in 1957, under Khrushchev, they were allowed home.
hint: It was titled "On the Cult of Personality and Its Consequences".
why: The speech opened the Thaw, though it blamed Stalin personally rather than the system that had empowered him.
---
q: Why is the Aral Sea often cited in arguments about Soviet rule in Central Asia?
a: Because Soviet engineers filled it to create a fishing industry.
x: The sea shrank under Soviet rule, and its fishing industry was devastated.
a: Because it was the launch site of Sputnik.
x: Sputnik and Gagarin flew from Baikonur, in Kazakhstan.
a: Because Gorbachev ordered it drained to grow wheat.
x: The rivers feeding it were diverted from the 1960s to irrigate cotton, long before Gorbachev.
a*: Because the rivers feeding it were diverted to grow cotton, and it shrank to a tenth of its size by 2007.
hint: Think of "white gold".
why: The Aral Sea shows how decisions made for the Union's economy reshaped the lands and lives of Central Asians.
```

## How Historians Have Argued

During the Cold War, Western study of the Soviet Union was dominated by the **totalitarian model** of Carl Friedrich and Zbigniew Brzezinski, building on Hannah Arendt: an official ideology, a single mass party usually under one leader, terror, and control of weapons and media. Richard Pipes and Robert Conquest stressed ideology, continuity from Lenin to Stalin and Stalin's personal will; Conquest estimated some 20 million deaths from Stalin's purges. From the 1960s and 1970s **revisionists** such as Sheila Fitzpatrick, a founder of Soviet social history, and J. Arch Getty, who saw a chaotic system in which Stalin often reacted rather than planned, wrote history "from below". The quarrel was bitter: traditionalists called revisionists apologists for terror, and Peter Kenez titled his review of Pipes "The Prosecution of Soviet History". Whether Stalin continued Lenin's work or broke with it remains unresolved, as the overview of the twentieth century notes. Lenin's Testament is the classic evidence for rupture, the Red Terror and the Cheka for continuity.

The opening of the **archives after 1991** changed the terms. The documents confirmed mass killing ordered from the centre by quota, but also totals well below Conquest's highest estimates, though the count of executions roughly matched his own 1968 estimate; Fitzpatrick noted that the scholars most active in mining them were revisionist "archive rats". Stephen Kotkin's *Magnetic Mountain* (1995) treated Stalinism as a "civilization" defined against capitalism; it is often summarised as showing how the people of Magnitogorsk learned to "speak Bolshevik", taking on the identities the regime offered. Sometimes called "post-revisionist", it has critics, such as Anna Krylova, who argue that it leaves Soviet people only the regime's language to think in.

**Was the Soviet Union an empire?** It was formally a federation that built national languages and elites, a paradox caught by Martin's "affirmative action empire" and Francine Hirsch's "empire of nations". Mark Beissinger argues that the line between a multinational empire and a multinational state is blurred, and that empire is partly a matter of how subjects come to see authority. The famines, deportations, Russification from the late 1930s, the annexation of the Baltic states and Central Asian cotton are the strongest evidence for "empire"; the promotion of local leaders, such as Uzbekistan's party chief Sharof Rashidov, the strongest against.

**Was the Holodomor genocide?** Scholars agree the famine was man-made. Raphael Lemkin, who coined the word genocide, called Ukraine "perhaps the classic example of Soviet genocide" in 1953, and historians such as Norman Naimark and Stanislav Kulchytsky agree; Anne Applebaum sees a famine planned to undermine Ukrainian identity. R. W. Davies and Stephen Wheatcroft, Kotkin and Getty find no intent to kill Ukrainians as such; Michael Ellman calls it a crime against humanity rather than genocide; and Conquest came to argue that Stalin could have prevented the famine but was "consciously abetting it". Ukraine, the European Parliament and dozens of states recognise the Holodomor as genocide; Russia's Duma condemned the Soviet regime in 2008 but explicitly rejected the genocide label. The Kazakh famine has a quieter parallel debate: a Kazakh parliamentary commission called it genocide, and the historian Sarah Cameron, who ties it to the Soviet project of turning nomads into a modern Soviet nation, argues that it fits the broader idea of genocide set out by Lemkin.

The argument is not only academic. In 2005 Vladimir Putin called the Union's collapse "a major geopolitical disaster of the century", in the Kremlin's English translation (often rendered "the greatest geopolitical catastrophe"). Memorial, the society founded during the Soviet collapse to document Stalinist crimes, was closed by Russian courts in December 2021 and shared the Nobel Peace Prize the following year.

## Further exploration

- **Terry Martin, *The Affirmative Action Empire: Nations and Nationalism in the Soviet Union, 1923–1939* (2001).** The archival study of indigenisation and its reversal into "enemy nations".
- **Francine Hirsch, *Empire of Nations: Ethnographic Knowledge and the Making of the Soviet Union* (2005).** How ethnographers classifying peoples helped make the Union.
- **Sarah Cameron, *The Hungry Steppe: Famine, Violence, and the Making of Soviet Kazakhstan* (2018).** The Kazakh famine from Russian and Kazakh sources.
- **Stephen Kotkin, *Magnetic Mountain: Stalinism as a Civilization* (1995).** Everyday life and belief in the steel town of Magnitogorsk.
- **Anne Applebaum, *Gulag: A History* (2003).** A Pulitzer Prize-winning history of the camps.
- **Adeeb Khalid, *Central Asia: A New History from the Imperial Conquests to the Present* (2021).** Central Asia through conquest, revolution, Soviet rule and after.
- **Serhii Plokhy, *Chernobyl: History of a Tragedy* (2018).** The disaster of 1986 and the Soviet system that produced it.$mn_soviet_master$,
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
  select $mn_soviet_quiz$[
    {"type": "mcq", "prompt": "Why do the 'February' and 'October' Revolutions of 1917 seem to fall in March and November in some accounts?", "options": ["Russia still used the Julian (Old Style) calendar, so 23 February and 25 October Old Style were 8 March and 7 November New Style", "The revolutions were renamed by Stalin in the 1930s", "Historians disagree about which year the revolutions took place", "The revolutions lasted from February to March and from October to November"], "answerIndex": 0, "explanation": "Russia used the Julian calendar until 1918; the February Revolution began on 23 February Old Style (8 March New Style) and the October Revolution on 25 October Old Style (7 November New Style).", "id": "q1"},
    {"type": "mcq", "prompt": "Which range for deaths in the Ukrainian famine of 1932–33, the Holodomor, reflects recent scholarship?", "options": ["About 100,000", "About 20 million", "3.5–5 million", "1.3–2.3 million"], "answerIndex": 2, "explanation": "Recent scholarship estimates 3.5–5 million deaths in Soviet Ukraine; 1.3–2.3 million is the range for the Kazakh famine, and a 2003 UN statement by 25 countries gave a higher 7–10 million.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the opening of the Soviet archives after 1991 show about the Great Terror?", "options": ["That it had been invented by Western propaganda", "That Stalin had no knowledge of it", "That it was confined to the party and army elite", "That killing was centrally ordered by quota, with about 680,000 recorded executions in 1937–38, though totals were below the highest earlier Western estimates"], "answerIndex": 3, "explanation": "Documents such as NKVD Order No. 00447 and the count of 681,692 verifiable executions confirmed mass killing ordered by quota from the centre, while showing totals lower than Conquest's highest estimates.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened to the Chechens and Ingush in February 1944?", "options": ["They were granted their own union republic", "About 496,000 were deported to Kazakhstan and Kyrgyzstan, and at least a quarter died", "They were evacuated ahead of the German army and returned in 1945", "They were drafted together into a single Red Army division"], "answerIndex": 1, "explanation": "In the deportation Chechens call Aardakh, 'the Exodus', about 496,000 people were deported; at least a quarter died, and they were allowed home only from 1957.", "id": "q4"},
    {"type": "open", "prompt": "Was the Soviet Union an empire? Use at least two pieces of evidence from the chapter on each side of the argument.", "rubric": "A strong answer explains the paradox of a federation of national republics that also ruled them from Moscow. Evidence for 'empire' can include the Holodomor and Kazakh famine, the deportations of whole peoples, the reversal of korenizatsiia and promotion of Russian culture from the late 1930s, Russian overrepresentation at the top, the annexation of the Baltic states, the satellite empire in Eastern Europe, and Central Asian cotton and the Aral Sea. Evidence against or complicating it can include korenizatsiia and national languages, Terry Martin's 'affirmative action empire', Hirsch's 'empire of nations', non-Russian leaders such as Stalin, and the promotion of local party leaders such as Rashidov. Credit answers that mention Beissinger's point that the line between multinational empire and multinational state is blurred.", "id": "q5"},
    {"type": "open", "prompt": "Explain why historians disagree about whether the Holodomor was a genocide.", "rubric": "A strong answer notes that scholars agree the famine was man-made and killed 3.5–5 million people, then sets out both sides: Lemkin, Naimark, Kulchytsky and Applebaum see an attack on Ukrainians as a nation (with evidence such as blacklisting, the Law of Spikelets, the January 1933 travel directive and the reversal of Ukrainisation), while Davies and Wheatcroft, Kotkin and Getty find no intent to kill Ukrainians as such, and Ellman calls it a crime against humanity rather than genocide. It may mention Conquest's 'consciously abetting it', Kotkin's reading of the travel directive as disease control, the political recognition by Ukraine, the European Parliament and dozens of states, and the parallel debate over the Kazakh famine.", "id": "q6"}
  ]$mn_soviet_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-soviet-union-history-of-the-soviet-empire', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
