-- Hitler and the Death of Democracy in Germany, 1918-1945 — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/hitler-and-the-death-of-democracy-in-germany-1918-1945 @ research/advanced/read.
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
    'history/20th-century-history/hitler-and-the-death-of-democracy-in-germany-1918-1945',
    'research',
    'advanced',
    'read',
    $mn_hitler_master$> **How a democracy died.** Germany's first democracy, born in defeat and revolution in 1918, was destroyed within fifteen years. This chapter follows the Weimar Republic through its fragile constitution, the crises of 1923 and the Depression, to the backroom deal that made Adolf Hitler chancellor in January 1933. It then traces how the Nazis dismantled the republic within months, how the Third Reich mixed terror with consent, whom it persecuted, from Jews, Roma and disabled people to gay men, Black Germans, political opponents and forced labourers, how women and resisters lived under it, and how it ended in 1945, with the debates historians still have.

## Revolution and Its Choices, 1918–19

The chapter on the First World War tells how a sailors' mutiny in late October 1918 became a revolution. What matters here are the choices that followed, as workers' and soldiers' councils took power across Germany with little bloodshed. On 9 November Chancellor Max von Baden announced, without authorisation, that the Kaiser had abdicated, and handed his office to **Friedrich Ebert** of the Social Democrats (SPD). Ebert's colleague Philipp Scheidemann proclaimed a republic from a Reichstag window, partly to forestall the revolutionary Karl Liebknecht, who proclaimed a socialist republic hours later.

Ebert's provisional government promised a free press and equal, secret elections, but it kept most of the imperial officer corps, administration and judiciary, and in a secret pact with Groener of the army command Ebert promised to leave the army's command structure alone in return for its support. A month later he told returning troops, "No enemy overcame you", words that helped give rise to the myth that the army had been "stabbed in the back".

The left split. Rosa Luxemburg's programme for the new Communist Party (KPD), founded at the turn of the year, said communists could never take power without the clear will of the majority, but the party voted to boycott the elections. In January 1919 a rising in Berlin, in which communists were a minority, was crushed by troops and Freikorps units; the SPD's Gustav Noske had by then taken charge of military affairs. On 15 January Luxemburg and Liebknecht were captured, clubbed and shot, and the killers largely went unpunished. Most historians think a Bolshevik-style council government was all but impossible; the debate is whether the SPD needed to rely so heavily on the old army and the Freikorps.

On 19 January 1919, in the first national election in which women voted on equal terms with men, the SPD won 38 per cent and formed the "Weimar Coalition" with the Catholic Centre and the German Democratic Party; the Assembly, meeting at Weimar, elected Ebert president. Scheidemann, who had asked in May, "What hand should not wither that puts itself and us in these fetters?", resigned rather than sign the peace treaty. Under an Allied ultimatum the Assembly voted to accept Versailles on 22 June 1919; its terms, and the argument over whether it was too harsh, are in the chapter on the First World War.

## A Constitution with an Emergency Door

The constitution of 11 August 1919 was in many ways a model of democracy. Every German over 20 could vote, women gained equal civil rights "in principle", and the Reichstag was elected by proportional representation with no threshold: in July 1932, 14 parties won seats, one with 40,800 votes out of more than 37 million.

Above parliament stood a president elected for seven years, who could dissolve the Reichstag and appoint and dismiss the chancellor, an office some have called an *Ersatzkaiser*, a substitute emperor. And **Article 48** let the president, in a serious threat to public order, take emergency measures and suspend basic rights, from personal liberty to free assembly. The text never defined an emergency.

Ebert used Article 48 136 times, generally by agreement with parliament. His successor Paul von Hindenburg used it 109 times in three years, largely to bypass parliament. The numbers show democracy draining away: in 1930 the Reichstag passed 98 laws against 5 emergency decrees; in 1932 it sat on only 13 days and passed 5 laws, against 60 decrees. Karl Dietrich Bracher called presidential rule the "25/48/53 formula", after the articles that let the president dissolve the Reichstag, rule by decree and appoint the chancellor.

## Years of Crisis, 1919–23

The republic was attacked from the start: the Kapp Putsch of March 1920 collapsed only before a general strike, and right-wing assassins murdered Matthias Erzberger in 1921 and Walther Rathenau in 1922. The stab-in-the-back myth, an antisemitic and anti-communist conspiracy theory, blamed defeat on traitors at home, and the Nazis called the republic's founders "the November criminals".

In January 1923, after repeated German defaults on reparations deliveries, France and Belgium occupied the Ruhr. The government paid for passive resistance by printing money. A dollar had cost about 320 marks in mid-1922; by November 1923 it cost 4.2 trillion. Savings were wiped out, while debtors gained. German officials blamed reparations; British and French experts, backed by later study of the records, argued that stabilisation was deliberately delayed in hope of relief. Gustav Stresemann ended passive resistance in September, and a new currency, the Rentenmark, introduced in mid-November 1923, ended the inflation.

In the same crisis Adolf Hitler struck. Austrian-born, he had joined the small German Workers' Party, forerunner of the Nazi party, in 1919. On 8 November 1923, inspired by Mussolini's March on Rome, he burst into Munich's Bürgerbräukeller with about 600 SA men and fired a shot into the ceiling. Next day a march on the Feldherrnhalle ended with some 15 Nazis, four police officers and a bystander dead. The court gave Hitler five years' "fortress confinement", the mildest form of imprisonment, and the judge refused to deport him because he "thinks and feels like a German"; he served about nine months. In prison he began, with help from Rudolf Hess and Emil Maurice, ***Mein Kampf*** (1925–26), which called for *Lebensraum* (living space) in the East and treated the forged *Protocols of the Elders of Zion* as genuine. From now on he would seek power legally.

## The Golden Twenties and the Crash

From 1924 to 1929 the republic stabilised. The Dawes Plan eased reparations, the Locarno treaties of 1925 settled the western borders, Germany joined the League of Nations in 1926, and Stresemann won the Nobel Peace Prize. Berlin was a capital of the Bauhaus, cabaret, jazz and the "new woman". In 1925, after Ebert's death, voters elected Hindenburg, candidate of the monarchist right, as president; in 1928 the Nazis won only about 2.6 per cent of the vote.

The chapter on the Interwar Period sets the Depression in its world context. In Germany by 1932 about six million people were unemployed, close to a third of the workforce. The last parliamentary coalition collapsed in March 1930 over the cost of unemployment insurance, and Hindenburg appointed **Heinrich Brüning** of the Centre Party to head the first "presidential cabinet", governing by decree. Brüning cut spending, wages and benefits; historians broadly agree that his austerity made the crisis worse and helped the Nazis.

The Nazi vote surged: 18.3 per cent and 107 seats in September 1930; 37.3 per cent and 230 seats in July 1932, making them the largest party. Nazis and Communists together now held a majority of seats, so no democratic majority was possible. Party membership, on one estimate, passed 1.4 million by the end of 1932. In the presidential election of 1932 the Social Democrats backed Hindenburg, who beat Hitler in the run-off by 53 per cent to about 37. In November 1932, the last free election, the Nazis fell to 33.1 per cent, losing two million votes.

## The Backroom Deal of January 1933

Hitler did not win power; he was handed it. After Brüning's fall in 1932, Hindenburg appointed **Franz von Papen**, whose cabinet lifted a ban on the SA and SS and, on 20 July 1932, deposed the SPD-led government of Prussia, home to 61 per cent of Germans. Bracher argued that after this coup the democrats lost their fighting spirit. Hindenburg, who privately dismissed Hitler as a "Bohemian corporal", refused to make him chancellor in August. In November some twenty figures from industry, finance and agriculture petitioned the president to appoint him. Kurt von Schleicher became chancellor in December, but Papen, now his enemy, persuaded Hindenburg to appoint Hitler at the head of a coalition with the conservative nationalists that would "rein him in". On **30 January 1933** Hitler became chancellor, with only three Nazis in the cabinet, but with Wilhelm Frick at the Reich Interior Ministry and Hermann Göring at the Prussian one. As the 20th-century overview puts it, the appointment was the result not of an electoral majority but of conservative elites' fatal confidence that they could use him.

```checkpoint
q: What did Article 48 of the Weimar constitution allow?
a*: It allowed the president, in a serious threat to public order, to take emergency measures and suspend basic rights by decree.
a: It allowed the Reichstag to remove the president by a simple majority.
x: Article 48 gave powers to the president, not to the Reichstag; the Reichstag could only revoke his decrees.
a: It set a threshold of votes that parties needed to win Reichstag seats.
x: Weimar's proportional representation had no threshold at all.
a: It banned the Communist Party.
x: It was a general emergency power; Hitler's government later used an emergency decree against the Communists.
hint: Think of the president's emergency powers.
why: Ebert used it to defend the republic; Hindenburg used it to govern around parliament, preparing the way for dictatorship.
---
q: How did Hitler become chancellor on 30 January 1933?
a: He won an absolute majority in the November 1932 Reichstag election.
x: In November 1932 the Nazis fell to 33.1 per cent of the vote.
a: He seized power in an armed coup.
x: His armed coup, the Beer Hall Putsch, had failed in 1923; afterwards he sought power legally.
a*: Hindenburg appointed him after Papen persuaded the president that a cabinet of conservatives could contain him.
a: He defeated Hindenburg in the 1932 presidential election.
x: Hindenburg beat Hitler in the run-off, by 53 per cent to about 37.
hint: Think of Papen and Hindenburg.
why: Hitler was handed power by conservative elites who believed they could control him.
```

## The Seizure of Power, 1933–34

On the evening of 27 February 1933 the Reichstag burned. Police arrested inside Marinus van der Lubbe, a Dutch council communist who was not a member of the KPD. Who set it remains an open question. In 1998 Ian Kershaw wrote that nearly all historians agreed, following Fritz Tobias (1962), that van der Lubbe acted alone. Benjamin Carter Hett argued in 2014 that Tobias's work was flawed, and an affidavit by an SA man, Hans-Martin Lennings, made in 1955 and published in 2019, says his squad brought van der Lubbe to a Reichstag already burning. Richard Evans calls theories of a Nazi plot conspiracy theory. A court in Leipzig acquitted the communist defendants; van der Lubbe was beheaded in 1934 and pardoned by Germany in 2008.

{{image: Reichstag fire | The Reichstag building in Berlin burning on the night of 27 February 1933.}}

Whoever lit it, the regime used the fire at once. The next day an Article 48 decree suspended basic rights "until further notice", as it turned out until 1945. Communists, including all the KPD's deputies, were arrested en masse. Even in the election of 5 March, held under this terror, the Nazis won only 43.9 per cent. On 23 March, in the Kroll Opera House, with SA men inside and outside the chamber, the Reichstag voted on the **Enabling Act**, which let the cabinet make laws, even ones departing from the constitution, for four years. Communist deputies were excluded and 26 Social Democrats arrested or in hiding. The Centre Party voted for it after Ludwig Kaas was promised written guarantees that never came. It passed by 444 votes to 94; only the SPD voted against, and the SPD's Otto Wels was the only speaker to oppose it.

```quote
No Enabling Act gives you the power to destroy ideas that are eternal and indestructible.
Otto Wels · Speech to the Reichstag against the Enabling Act · 23 March 1933
```

The constitution was never repealed but became a dead letter. *Gleichschaltung*, "coordination", followed. State parliaments were dissolved, "non-Aryan" and unreliable officials purged, Jewish businesses boycotted and books burned. On 2 May the SA occupied the trade unions' offices and arrested their leaders. The SPD was banned in June, and by July the Nazis were the only legal party.

In the **Night of the Long Knives**, 30 June to 2 July 1934, the SS and police murdered the SA leader Ernst Röhm, whose ambitions alarmed the army, along with enemies such as Schleicher. At least 85 people were killed, though estimates run up to 700–1,000; Hitler told the Reichstag 74. A law declared the killings legal "as acts of self-defence by the State", and Hitler said he had become "the supreme judge of the German people". When Hindenburg died on 2 August 1934 the offices of president and chancellor were merged, and soldiers swore an oath of unconditional obedience to Hitler personally.

## Terror and Consent

Dachau opened in March 1933 for political opponents. In 1933–34 some 50,000 prisoners, on Jane Caplan's estimate, were held in about 70 early camps, about 80 per cent of their inmates communists and 10 per cent social democrats. The Communist leader Ernst Thälmann spent over eleven years in solitary confinement before he was shot at Buchenwald in 1944.

The Gestapo itself was small: in 1939 Stettin and Frankfurt am Main had 41 officers between them. As Robert Gellately showed, it depended on ordinary citizens' denunciations. Many Germans were won over by recovery: unemployment fell from six million in 1933 to under a million by 1937, partly by pushing women out of work and through conscription and rearmament financed by deficits. Real wages fell by about a quarter between 1933 and 1938, but the regime offered the dream of a *Volksgemeinschaft*, a "people's community", leisure through Strength Through Joy and the promise of a "people's car". In 1936 Hitler demanded an economy "fit for war within four years". By 1939 the Party's Eher publishing house owned or controlled over two-thirds of German newspapers and magazines, and Hitler Youth membership was compulsory.

## The Racial State and Its Victims

Under a sterilisation law of July 1933, drafted under Weimar and closely resembling an American "model" eugenics law, courts ordered compulsory sterilisation, often for conditions that were not hereditary; an estimated 360,000 people were sterilised between 1933 and 1939. The **Nuremberg Laws** of September 1935 banned marriage and sex between Jews and other Germans and restricted citizenship to those of "German or related blood"; in November they were extended to "Gypsies, Negroes, and their bastards". By 1939 about 250,000 German Jews had emigrated, losing up to 90 per cent of their assets to a flight tax. In the pogrom of **Kristallnacht**, 9–10 November 1938, Nazis attacked more than 1,400 synagogues and prayer rooms and some 7,000 businesses, killed at least 91 Jews outright, with the toll from later deaths and suicides running into the hundreds or more, and sent about 30,000 Jewish men to camps. Kershaw found that most Bavarians disapproved of the violence.

Disabled people were the first to be murdered systematically. Under **Aktion T4**, authorised by Hitler in October 1939 and backdated to the outbreak of war, patients were killed in six killing centres, among them Hadamar and Hartheim; between 275,000 and 300,000 were killed by 1945. In 1941 Bishop Clemens von Galen of Münster preached against the killings, provoking what Evans calls the "strongest, most explicit and most widespread protest movement against any Nazi policy since the beginning of the Third Reich". Hitler suspended T4 that August, but killing continued in decentralised form until 1945, and T4 personnel later ran the death camps of Operation Reinhard. Galen himself had earlier linked heresy with the "sins of the Jews".

Roma and Sinti had been policed by a central office since before the First World War; the Nazis interned them from 1935 and in December 1942 ordered their deportation to Auschwitz, where about 21,000 of 23,000 died. Estimates of all Roma and Sinti killed range from about 200,000 to 500,000, and West Germany recognised the genocide only in 1982. Gay men were persecuted under Paragraph 175, a law of 1871 that the Nazis broadened in 1935; an estimated 100,000 were arrested, and of the 5,000–6,000 sent to camps perhaps 60 per cent died. Black Germans were targeted too: in 1937 a Gestapo commission sterilised at least 385, and perhaps 500 or more, children of German mothers and African soldiers of the French occupation. In 1940 some German units massacred captured Black French colonial soldiers, killing several thousand after capture. Jehovah's Witnesses and so-called "asocials" also filled the camps.

## Women in the Nazi State

Nazi ideology cast women as wives and mothers. From 1936 women could not become judges or prosecutors. Marriage loans, at first on condition the wife gave up paid work, had a quarter forgiven for each child, and from 1939 mothers of four or more received a Cross of Honour; yet large families actually became fewer. Women were also agents of the regime: Wendy Lower counts thirteen million women, a third of all women, in Nazi organisations, and women served as guards at Ravensbrück, the women's camp. Gisela Bock stressed women as victims of Nazi policy; Claudia Koonz argued that women were not innocent bystanders but helped make state murder possible, in the name of interests they defined as maternal.

## War, Forced Labour and Genocide

The chapter on the Interwar Period follows the road to war, from the remilitarisation of the Rhineland to the invasion of Poland in September 1939. On 30 January 1939 Hitler had told the Reichstag that if "international Jewish financiers" plunged the nations into another world war, the result would be "the annihilation of the Jewish race in Europe".

The war economy ran on coercion. About 12 million people from almost twenty countries, two-thirds of them from Central and Eastern Europe, were taken to work in the Reich. In late summer 1944 German records listed 7.6 million foreign civilian workers and prisoners of war in Germany, a fifth to a quarter of the workforce. Eastern workers wore an "OST" badge and lived under guard; the historian Jan Gross estimates that no more than 15 per cent of Polish workers volunteered. Most survivors were compensated only through a foundation set up in 2000.

The war in the East became the setting for genocide: as the 20th-century overview describes, some six million European Jews were murdered, alongside Roma, disabled people, Soviet prisoners and others. The Holocaust, treated in its own chapter, grew out of the persecution traced here; how the decision for it was reached is a question for that chapter.

## Resistance

Resistance was real but weak. The SPD and KPD kept underground networks but could not cooperate, and the Gestapo infiltrated them; they achieved little beyond survival and short strikes. A carpenter, Georg Elser, missed Hitler with a bomb in November 1939 by 13 minutes. In Munich the students of the **White Rose**, among them Hans and Sophie Scholl, wrote six leaflets from June 1942; the second denounced the murder of Jews. Caught at the university, the Scholls and Christoph Probst were tried before Roland Freisler's People's Court and guillotined on 22 February 1943.

```quote
Somebody, after all, had to make a start. What we wrote and said is also believed by many others. They just don't dare express themselves as we did.
Sophie Scholl · as reported at her trial before the People's Court · 22 February 1943
```

That winter, in Berlin's Rosenstrasse, non-Jewish wives protested against the detention of about 1,800 Jewish husbands, the only mass public demonstration by Germans against the deportation of Jews. On 20 July 1944 Claus von Stauffenberg's bomb only slightly wounded Hitler; the coup collapsed within hours, over 7,000 people were arrested and 4,980 executed, only about 200 of them linked to the plot. Historians debate the plotters' motives: many were conservative nationalists, not democrats, and Christian Gerlach has argued that some knew of mass murder from 1941, though Peter Hoffmann and others dispute his conclusions. Memory divided: West Germany honoured the White Rose and 20 July, East Germany the communist resistance.

```checkpoint
q: Why is the cause of the Reichstag fire of February 1933 still debated?
a: Because the communist defendants confessed at Leipzig.
x: The communist defendants were acquitted.
a*: Because the long-accepted view that van der Lubbe acted alone has been challenged, notably by Hett and by an SA man's affidavit published in 2019, while Evans rejects Nazi-plot theories.
a: Because van der Lubbe was never found.
x: He was arrested inside the building and executed in 1934.
a: Because the fire did not lead to any change in the law.
x: The next day's decree suspended basic rights and stayed in force until 1945.
hint: Think of Tobias, Hett and Lennings.
why: The fire's political use is certain; its origin is not, and historians still weigh the evidence.
---
q: What was Aktion T4?
a: The sterilisation law of July 1933.
x: That law ordered compulsory sterilisation; T4, from 1939, was a programme of killing.
a: The December 1942 order to deport Roma and Sinti to Auschwitz.
x: That order concerned Roma and Sinti, not the "euthanasia" killing of disabled people.
a: The law under which gay men were prosecuted.
x: Gay men were prosecuted under Paragraph 175, a law of 1871.
a*: The programme to murder disabled people, authorised by Hitler in 1939, which killed 275,000–300,000 people by 1945.
hint: Think of Bishop von Galen's sermons of 1941.
why: Disabled people were the first victims of systematic Nazi murder, and T4's personnel went on to run death camps.
```

## 1945: The Reckoning

In March 1945 Hitler said the German people "had proven to be the weaker" and ordered the destruction of Germany's industrial infrastructure. On 30 April, with Soviet troops about 500 metres away, he shot himself in Berlin. Germany surrendered unconditionally on 7–8 May. At Nuremberg some two dozen leading figures were tried, and twelve were sentenced to death. German women cleared the rubble of the cities, and Soviet soldiers raped hundreds of thousands, perhaps up to two million, German women. Other reckonings came slowly: the Nazi version of Paragraph 175 stayed in West German law until 1969, and the Roma genocide was recognised only in 1982.

## Why Did Weimar Die?

Why did the republic fail? Some speak of a "democracy without democrats"; others weigh economic causes, institutional flaws such as Article 48, and individual choices, from Brüning's austerity to the deal of January 1933. Bracher argued in 1955 that collapse was not inevitable and that the end began with presidential government in 1930.

A deeper argument concerns the ***Sonderweg***, or "special path". Hans-Ulrich Wehler argued that Germany modernised economically but not politically, leaving the Prussian landed elite in control of army and state. Blackbourn and Eley replied that there was no "normal" path to deviate from.

How Hitler's state worked is a third debate. "Intentionalists" such as Bracher stressed Hitler's ideology and will, and saw Nazi Germany as totalitarian. "Functionalists" saw something messier: Martin Broszat described a welter of competing institutions, and Hans Mommsen called Hitler a "weak dictator" presiding over "cumulative radicalisation". Kershaw rejected the "weak dictator" but accepted Hitler's limited part in daily government. Borrowing an official's phrase of 1934, he argued that the regime's servants were "working towards the Führer": rival agencies competed to anticipate Hitler's wishes, radicalising policy as they did so.

Finally there is the question of the German people. Gellately argued that most Germans came to back the regime, which publicised its camps rather than hiding them; Kershaw found popular indifference to the fate of the Jews. Goldhagen's *Hitler's Willing Executioners* (1996) blamed a uniquely German "eliminationist antisemitism"; Raul Hilberg called it "totally wrong about everything". Götz Aly argued that the regime bought support with welfare paid for by plundering Jews and occupied Europe; Tooze disputed his figures, and Evans criticised its "economic reductionism".

Weimar's lessons were written into law. West Germany's Basic Law of 1949 created a constructive vote of no confidence, a weak president, and basic rights that could not be suspended. Weimar's constitution also travelled: South Korea's first constitution was based on it. The warning it leaves is that a democracy can be dismantled from inside, through emergency powers, by elites who believe they can control those who mean to destroy it.

## Further exploration

- **Richard J. Evans, *The Coming of the Third Reich* (2003).** The standard narrative of how democracy was destroyed.
- **Ian Kershaw, *Hitler 1889–1936: Hubris* (1998).** The standard biography's first volume.
- **Benjamin Carter Hett, *The Death of Democracy: Hitler's Rise to Power and the Downfall of the Weimar Republic* (2018).** How conservatives' attempt to co-opt Hitler brought him to power.
- **Robert Gellately, *Backing Hitler: Consent and Coercion in Nazi Germany* (2001).** Popular support, the press and denunciation.
- **Adam Tooze, *The Wages of Destruction: The Making and Breaking of the Nazi Economy* (2006).** Rearmament, forced labour and racial war.
- **Claudia Koonz, *Mothers in the Fatherland: Women, the Family, and Nazi Politics* (1987).** Women as agents, not only victims.
- **Raffael Scheck, *Hitler's African Victims: The German Army Massacres of Black French Soldiers in 1940* (2006).** The 1940 massacres of Black French soldiers.$mn_hitler_master$,
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
  select $mn_hitler_quiz$[
    {"type": "mcq", "prompt": "By what vote did the Reichstag pass the Enabling Act on 23 March 1933, and which party voted against it?", "options": ["444 to 94, with only the SPD voting against", "444 to 94, with the Centre Party voting against", "Unanimously, with no party voting against", "288 to 81, with the KPD voting against"], "answerIndex": 0, "explanation": "The Act passed by 444 votes to 94. The Communist deputies had been excluded, the Centre Party voted for it after Ludwig Kaas was promised written guarantees that never came, and only the SPD voted against; Otto Wels was the only speaker to oppose it.", "id": "q1"},
    {"type": "mcq", "prompt": "How did the use of Article 48 change between Ebert and Hindenburg?", "options": ["Ebert never used it; Hindenburg used it only once", "Both presidents used it only with the Reichstag's prior written consent", "Ebert used it 136 times, generally by agreement with parliament; Hindenburg used it 109 times in three years, largely to bypass parliament", "Hindenburg abolished it in 1930"], "answerIndex": 2, "explanation": "Ebert invoked Article 48 136 times, generally by agreement with parliament; Hindenburg used it 109 times in three years, largely to bypass it. By 1932 the Reichstag passed 5 laws against 60 emergency decrees.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the Reichstag fire of 27 February 1933 best reflects the state of historical knowledge?", "options": ["Historians agree the Communist Party planned it, as the Leipzig court found", "Who set it remains open: Kershaw wrote that nearly all historians thought van der Lubbe acted alone, but Hett and a 1955 affidavit published in 2019 challenge that view, while Evans rejects Nazi-plot theories", "The fire was an accident caused by faulty wiring", "Van der Lubbe escaped and was never identified"], "answerIndex": 1, "explanation": "Van der Lubbe was arrested inside the building. The Leipzig court acquitted the communist defendants. The single-arsonist view (Tobias, Kershaw) has been challenged by Hett and by the Lennings affidavit, while Evans calls Nazi-plot theories conspiracy theory.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these was a victim group of Nazi persecution in the 1930s, alongside Jews?", "options": ["Members of the German Labour Front, as a group", "The Reich governors installed in the states", "Members of the League of German Girls, as a group", "The children of German mothers and African soldiers of the French occupation, at least 385 of whom were sterilised by a Gestapo commission in 1937"], "answerIndex": 3, "explanation": "In 1937 a Gestapo commission sterilised at least 385, perhaps 500 or more, Black German children of German mothers and African soldiers; the other options were organisations or officials of the regime itself.", "id": "q4"},
    {"type": "open", "prompt": "Explain how Hitler came to be appointed chancellor on 30 January 1933, and why many historians describe this as a backroom deal rather than an electoral victory.", "rubric": "A strong answer notes that the Nazis became the largest party in July 1932 (37.3 per cent) but never won a majority in a free election, and fell to 33.1 per cent in November 1932; that from 1930 presidential cabinets (Brüning, Papen, Schleicher) governed by Article 48 decree rather than through parliament; that Papen, Schleicher's enemy, persuaded Hindenburg to appoint Hitler in a coalition with the conservative DNVP that would 'rein him in', with only three Nazis in the cabinet; and that Hindenburg refused Schleicher a dissolution. It may mention the industrialists' petition of November 1932, Papen's Prussian coup, and Hett's argument that conservatives tried to co-opt Hitler. It should conclude that power was handed to Hitler by conservative elites who believed they could control him.", "id": "q5"},
    {"type": "open", "prompt": "Was the Third Reich held together mainly by terror or by consent? Use evidence and at least two historians' views.", "rubric": "A strong answer weighs both. Terror: the Reichstag Fire Decree suspending basic rights until 1945; early camps holding some 50,000 prisoners, about 80 per cent communists (Caplan); Dachau; the Night of the Long Knives; persecution of Jews, Roma and Sinti, disabled people, gay men and Black Germans. Consent: the fall in unemployment from six million to under a million by 1937; the Volksgemeinschaft and Strength Through Joy; about 90 per cent approval in the 1934 plebiscite; the small Gestapo's reliance on citizens' denunciations (Gellately), and Gellately's argument that most Germans came to back the regime. It should present at least two views as debate, for example Gellately on consent; Kershaw on popular indifference to the fate of the Jews; Aly's 'convenience dictatorship' and Tooze's and Evans's criticism of it; or Goldhagen and his critics. It may note limits to consent, such as the Galen protests against T4 or Bavarian disapproval of Kristallnacht.", "id": "q6"}
  ]$mn_hitler_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/hitler-and-the-death-of-democracy-in-germany-1918-1945', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
