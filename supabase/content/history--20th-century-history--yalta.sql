-- The Yalta Conference — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-yalta-conference @ research/advanced/read.
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
    'history/20th-century-history/the-yalta-conference',
    'research',
    'advanced',
    'read',
    $mn_yalta_master$> **Eight days that sketched the postwar world.** From 4 to 11 February 1945, Roosevelt, Churchill and Stalin met at the Livadia Palace near Yalta, in Crimea, while the Red Army stood about 65 kilometres from Berlin. They agreed to divide a defeated Germany into zones; they promised free elections in Poland; Stalin secretly undertook to fight Japan in return for concessions in East Asia; and they settled the voting rule that made the United Nations possible. This chapter follows those bargains and what became of them, gives weight to the Poles, Chinese, Balts, Koreans and Soviet citizens whose futures were decided without them, and ends with the long argument over whether Yalta was realistic statecraft or a "betrayal".

## The Road to Crimea

Yalta was the second meeting of the "Big Three". At the first, in Tehran from 28 November to 1 December 1943, the British and Americans committed themselves to a second front in France, and Stalin agreed to enter the war against Japan once Germany was defeated. Churchill also proposed moving Poland westward at Germany's expense, with its eastern border on a variant of the Curzon Line, as Stalin wanted. Roosevelt asked to be excused from the Polish discussion, citing Polish-American voters before the 1944 election. The Polish government-in-exile in London was not involved; Moscow had already broken off relations with it.

At Dumbarton Oaks in Washington, from August to October 1944, the Allies drafted proposals for a United Nations. According to the American diplomat Charles Bohlen, they settled all but two issues: how the Security Council would vote, and the Soviet demand that all 16 Soviet republics be admitted.

The other strand ran through Moscow. In October 1944, as Churchill later told it in his memoirs, he pushed across the table to Stalin a sheet dividing influence in south-eastern Europe by percentage: Romania 90 per cent Russian; Greece 90 per cent British, "in accord with" the United States; Yugoslavia and Hungary 50–50; Bulgaria 75 per cent Russian. Stalin made a large tick in blue pencil and handed it back. Churchill called it the "naughty document". These opening figures were later revised in the Soviets' favour for Bulgaria and Hungary. Moscow had already promised in September to keep the Red Army out of Greece, and Britain agreed to return all former Soviet citizens liberated from the Germans.

The status of this "percentages agreement" needs care. It was secret, informal and never signed, and it played no formal part at Yalta. Churchill's own account of 1953 was long the main source, and Soviet historians denied it, though later work, notably Albert Resis's in 1978, also drew on the British record of the talks. Churchill told his War Cabinet that the figures were only an interim guide for the immediate wartime future, and Roosevelt for months did not know their full contents. In the end every country on the list except Greece fell under Communist rule.

## Eight Days at Livadia

Roosevelt had wanted a Mediterranean venue, but Stalin said his doctors opposed long journeys and proposed Yalta. The sessions were held at Livadia, the summer palace of Tsar Nicholas II, where the Americans also stayed; the Soviet and British delegations lodged in nearby palaces. Charles de Gaulle was not invited, a slight he long resented.

{{image: Yalta Conference | Churchill, Roosevelt and Stalin at the Livadia Palace, February 1945; Roosevelt had two months to live.}}

The military map shaped everything: the Western Allies stood on Germany's western border, while Soviet forces had driven the Germans from Poland, Romania and Bulgaria. Roosevelt wanted the Soviet Union in the Pacific war, where American planners worked with figures of up to a million casualties for an invasion of Japan, and in the United Nations. Churchill pressed for free elections, above all in Poland. Stalin wanted a Soviet sphere in Eastern and Central Europe. James F. Byrnes, of the American delegation, put the Western predicament plainly: "it was not a question of what we would let the Russians do, but what we could get the Russians to do."

Roosevelt was a sick man: tests in March 1944 had found hypertension, coronary artery disease and congestive heart failure. In the State Department team was Alger Hiss, who had helped draft the American text of the Declaration on Liberated Europe; he was a member of the delegation, not its chief negotiator, a point that matters for the later controversy.

## Germany: Zones and Reparations

The leaders confirmed the zones already drawn for occupied Germany and divided Berlin. France was to get a fourth zone, carved from the American and British ones, and when Roosevelt backed Churchill's case for a French seat on the Allied Control Council, Stalin gave way. They agreed to disarm Germany, break up its General Staff, control or eliminate its war industry, punish war criminals and wipe out the Nazi party, ending the regime whose rise the chapter on Hitler and the Death of Democracy in Germany, 1918-1945 traces.

Reparations, which could include the use of German labour, were left vaguer. The protocol set up an Allied Reparation Commission in Moscow, which was to take the Soviet proposal of 20 billion dollars, half of it for the Soviet Union, only "as a basis for discussion". The British wanted no figure named at all. At Potsdam, Byrnes said that no one had agreed to $20 billion; Molotov replied that the Americans had accepted it as a basis for discussion.

## Poland

Stalin told the others that "For the Soviet government, the question of Poland was one of honor", and of security, since Poland had been a corridor for invasions of Russia. Two questions were tangled together: where Poland would lie, and who would govern it.

Yalta confirmed the Curzon Line, a line first proposed in 1919, as Poland's eastern border, with small variations of five to eight kilometres. Churchill and Roosevelt asked Stalin to reconsider, especially over the city of Lwów (Lviv); he refused, and reportedly asked whether they wanted him to tell the Russian people that he was less Russian than Lord Curzon. In return Poland was to gain substantial German territory in the north and west, with the final western frontier left to a peace conference. For the first time the Soviets openly backed a frontier on the Western rather than the Eastern Neisse. Churchill warned that "it would be a pity to stuff the Polish goose so full of German food that it got indigestion."

Two authorities claimed to govern Poland. One was the government-in-exile in London, whose armed forces in the West, nearly 200,000 troops, were fighting under Allied command. The other was the Soviet-sponsored, Communist-dominated "Lublin Committee", proclaimed in July 1944, which at the end of the year declared itself the provisional government and was recognised by Moscow in January 1945. Yalta's compromise was that the government "now functioning in Poland" would be reorganised on a broader democratic basis, including democratic leaders from Poland and from Poles abroad.

```quote
...pledged to the holding of free and unfettered elections as soon as possible on the basis of universal suffrage and secret ballot.
Declaration on Poland · Yalta Conference · 11 February 1945
```

Language calling for supervised elections was dropped. Admiral William D. Leahy told Roosevelt the wording was so elastic that the Soviets could "stretch it all the way from Yalta to Washington without ever technically breaking it."

The same gap between promise and enforcement ran through the **Declaration on Liberated Europe**. Invoking the Atlantic Charter, the three powers undertook to help freed peoples create "democratic institutions of their own choice" and to form interim governments that would hold free elections. The only mechanism was that the three would consult together, and Molotov secured language that weakened enforcement further.

```checkpoint
q: What did the Yalta agreement on Poland provide for the country's government?
a*: The Soviet-backed provisional government was to be reorganised on a broader democratic basis and pledged to free elections.
a: The London government-in-exile was to return to Warsaw and take power.
x: The formula built on the provisional government already functioning in Poland, not on the London government.
a: Elections were to be held under Allied supervision within three months.
x: Language calling for supervised elections was dropped, and no date was set.
a: Poland was to be governed jointly by the Allied Control Council.
x: The Allied Control Council was the body for occupied Germany, not Poland.
hint: Think of Leahy's warning that the wording could be stretched "from Yalta to Washington".
why: The formula promised free elections but left the Lublin government in place and set no means of enforcement.
---
q: How did the Yalta protocol treat the Soviet reparations figure of 20 billion dollars?
a: As a binding total, half of it payable to the Soviet Union.
x: The figure was not binding; the Americans later denied having agreed to it at all.
a: As a figure rejected outright by all three powers.
x: The Soviet proposal was written into the protocol, though only for discussion.
a*: As a basis for discussion for an Allied Reparation Commission in Moscow.
a: As a figure to be fixed by the United Nations at San Francisco.
x: Reparations were left to a commission of the three powers, not the United Nations.
hint: The British wanted no figure named before the question had been studied.
why: The vague wording allowed Byrnes and Molotov to disagree at Potsdam about what had been accepted.
```

## The United Nations Bargain

Yalta settled the two questions left open at Dumbarton Oaks. Under the "Yalta formula", each permanent member of the Security Council could veto any action by the Council but not procedural decisions, so no single power could block debate; the Soviets had earlier wanted a veto even on discussion. Stalin had asked for seats for all 16 Soviet republics; Roosevelt and Churchill agreed to two, Ukraine and Byelorussia.

The founding conference met in San Francisco from 25 April to 26 June 1945, with delegates from 50 Allied nations, and the veto remained the price of the whole enterprise: in the words of an adviser to the American delegation, "it was either the Charter with the veto or no Charter at all". Poland, lacking an agreed government, was absent; a space was left for its signature. Roosevelt, who had hoped to attend, died on 12 April.

## The Far East Bargain

The most secret agreement at Yalta concerned Asia. Signed on 11 February, it provided that "in two or three months after Germany has surrendered and the war in Europe is terminated", the Soviet Union would enter the war against Japan, on conditions. The status quo in Outer Mongolia, which China claimed, was to be preserved. The "former rights of Russia" violated by Japan's attack of 1904 were to be restored: southern Sakhalin returned to the Soviet Union; the port of Dairen (Dalian) internationalised with Soviet interests safeguarded, and Port Arthur leased again as a Soviet naval base; and the main Manchurian railways run by a joint Soviet–Chinese company, with China keeping sovereignty in Manchuria. Finally, "The Kuril islands shall be handed over to the Soviet Union."

China, an ally that had met Britain and the United States at Cairo in 1943, had no seat at Yalta. The clauses on Mongolia, the ports and the railways required the concurrence of Chiang Kai-shek, which Roosevelt undertook to obtain, yet the three leaders also agreed that the Soviet claims would be fulfilled without question once Japan was defeated. China was told in stages, receiving the full terms only by mid-1945, and the agreement was made public only in February 1946.

The Soviet Union declared war on 8 August, three months after Germany's surrender; the chapter on Japan's Empire in Asia, 1895–1945 describes the invasion of Manchuria that followed. On 14 August a Sino-Soviet treaty turned the Yalta terms into Chinese commitments, including acceptance of Outer Mongolia's independence if a referendum confirmed it, which it did that October. The railway returned to China in 1952 and Port Arthur in 1955, but southern Sakhalin and the Kurils remain Russian, and Japan holds that it is not bound by a document to which it did not agree.

Korea is absent from the formal record. Declassified records show that on 8 February, without Churchill, Roosevelt proposed a Soviet, American and Chinese trusteeship of 20 to 30 years; Stalin said it should be as short as possible. The division came later, on 10 August 1945, when two Americans, Dean Rusk and Charles Bonesteel, picked the 38th parallel from a *National Geographic* map without consulting any Korea experts.

## Those Not at the Table

**Poles** were the most conspicuous absentees. On 13 February the government-in-exile declared that the Yalta decisions could not be recognised and did not bind the Polish nation, and that the new border amounted to a new partition of Poland, this time by its allies. In General Anders's II Corps, many of whose soldiers came from the lost eastern lands, the news provoked despair, and some took their own lives. Of about 3 million Roman Catholic Poles who had lived east of the Curzon Line, recent research suggests about 2.1 to 2.2 million died, fled, emigrated or were expelled to the former German lands in the west.

**Chinese** sovereignty in Manchuria and China's claim to Outer Mongolia were bargained away by others. The historian Rana Mitter argues that China's war against Japan has been neglected in Western memory; the secret Yalta deal is part of that story.

**The Baltic peoples** were not named at Yalta. The United States refused, from the Welles Declaration of July 1940 onwards, to recognise their annexation by the Soviet Union, and kept that policy for five decades; but after the Red Army returned, deportations resumed on a larger scale, with about 90,000 people deported from the Baltic states in March 1949 alone, and the armed resisters known as the Forest Brothers fought on for years.

**Koreans** were discussed only as a people not yet ready to rule themselves. When a trusteeship of up to five years was announced in December 1945, it invigorated a Korean movement demanding immediate independence.

**Soviet citizens** in the West were covered by separate Soviet–American and Soviet–British agreements signed on 11 February for the mutual return of liberated prisoners of war and civilians. Return was mandatory, regardless of consent, but only for Soviet citizens within the borders of 1 September 1939, which exempted people from the Baltic states, western Ukraine and western Belarus, as well as the old émigrés of the Civil War era. About 4.2 million people were repatriated. An estimated 80 per cent of those from within the pre-1939 borders returned willingly; about 500,000 stayed in the West, and the historian Viktor Zemskov estimates that a million would have stayed had return been wholly voluntary.

The forced cases are what people remember. At Lienz in May and June 1945, about 32,000 Cossacks who had surrendered to the British were sent back, by force where necessary; their officers were tricked into attending a "conference", and across the Cossack handovers of 1945–47 roughly 3,000 old émigrés were handed over in breach of the Yalta terms. Other forced handovers brought suicides and self-harm. Historians judge this differently. Nicholas Bethell and later critics charged the Allies with duplicity, and Julius Epstein called it a war crime. More recent accounts drawing on Soviet archives stress that most of those forced back were collaborators, and cite Soviet archival figures showing 6.5 per cent of returnees arrested during screening and 14.5 per cent sent to labour battalions, which they take to disprove claims of universal persecution. Those figures come from the Soviet state itself, and the newer framing remains contested.

```checkpoint
q: Why did the Yalta repatriation agreements not cover people from the Baltic states?
a: Because the Baltic states had been represented at Yalta and refused to sign.
x: The Baltic states were not represented at Yalta, and were not even named there.
a*: Because they covered only Soviet citizens within the borders of 1 September 1939, before the annexations of 1939–40.
a: Because the United States had recognised the Baltic states as part of the Soviet Union.
x: The United States refused for five decades to recognise the annexation.
a: Because all Baltic people had been repatriated before the conference.
x: The agreements were signed in February 1945; the returns came afterwards.
hint: Look at the date that defined who counted as a Soviet citizen.
why: The 1939 cut-off excluded those annexed afterwards, and Soviet attempts at Potsdam to extend the agreements failed.
---
q: Which statement about the Far East agreement of 11 February 1945 is accurate?
a: China's government negotiated its terms at Yalta.
x: China was not at Yalta and was told of the terms only in stages.
a: It was published immediately after the conference.
x: It was kept secret and made public only in February 1946.
a: It promised Soviet entry into the war against Japan within one month of Germany's surrender.
x: The agreement said two or three months; the Soviet Union declared war three months after the German surrender.
a*: It promised the Kuril islands and southern Sakhalin to the Soviet Union in return for entering the war against Japan.
hint: Think of the territories that remain disputed between Russia and Japan.
why: The secret agreement traded Soviet entry into the Pacific war for territory and rights, some of them China's, decided without China.
```

## After Yalta

Roosevelt reported to Congress on 1 March, seated, an unprecedented concession to his disability: "I come from the Crimea with a firm belief that we have made a start on the road to a world of peace." In London a three-day Commons debate ended in a vote of confidence, but 25 MPs drafted an amendment of protest, and a junior minister, Henry Strauss, resigned from the government. Churchill remarked: "Poor Neville Chamberlain believed he could trust Hitler. He was wrong. But I don't think I am wrong about Stalin."

The Polish settlement soon came apart. On 11 March Roosevelt warned Churchill that Americans would not support "participation in a fraud or a mere whitewash of the Lublin government"; on 21 March Harriman cabled that the Soviet programme was "the establishment of totalitarianism". In March the NKVD general Ivan Serov invited leaders of the Polish underground, including the Home Army commander Leopold Okulicki, to talks under a guarantee of safety, then had them arrested. Sixteen were tried in Moscow in June, deliberately at the same time as the talks there that formed a new Polish government on 28 June, dominated by the Lublin leaders with the former exile prime minister Stanisław Mikołajczyk as a deputy. America and Britain recognised it in early July. Elections in January 1947 led to a Communist state by 1949, and more than 100,000 Polish soldiers in the West chose not to go home.

The Big Three met again at Potsdam from 17 July to 2 August 1945, Truman now in Roosevelt's place and, after the British election, Attlee in Churchill's. They confirmed four German zones, moved Germany's eastern border provisionally to the Oder–Neisse line and agreed that each power would take reparations from its own zone. They accepted that "the transfer to Germany of German populations… will have to be undertaken" from Poland, Czechoslovakia and Hungary; the overview of the twentieth century describes the expulsions that followed, and the chapter on the Second World War covers Potsdam's ultimatum to Japan. The German–Polish border was finally settled only in 1990.

## Realism or Betrayal?

In the United States, Yalta came to be seen badly, especially among Republicans, conservative Democrats and Americans with East European roots. The 1952 Republican platform promised to "repudiate all commitments contained in secret understandings such as those of Yalta which aid Communist enslavements", though the effort to do so fizzled out after Stalin's death. The Hiss case fed claims that Yalta had been shaped by a Soviet agent: a decoded Soviet cable of March 1945 mentions an agent who attended Yalta and then went to Moscow, as Hiss did, but the identification remains contested. Polish Communists used Yalta to tell Poles that the West had sacrificed them. In 2005, in Riga, President George W. Bush said that "The agreement at Yalta followed in the unjust tradition of Munich and the Molotov-Ribbentrop Pact"; the historian John Lewis Gaddis called the comparison "a bit much".

Historians' positions have shifted with the evidence. Early accounts blamed Stalin for breaking his promises, Revisionists, as the overview of the twentieth century explains, laid more responsibility on the United States. Gaddis argued in 1972 that neither side bore sole responsibility; after the Soviet archives opened, he put prime responsibility on Stalin.

In *We Now Know* (1997), written after Soviet archives opened, Gaddis placed the decisive weight on Stalin's own personality and choices rather than on geography or tradition.

Two books of 2010 frame the current debate. Serhii Plokhy, using Soviet as well as Western archives, argues that Stalin's aims and the Red Army's presence decided Eastern Europe's fate, and that the Western leaders did about as well as could be expected The reviewer Andrew Nagorski thought he went too far in claiming Yalta preserved some political pluralism in Poland. Fraser Harbutt treats Yalta as a hinge between a Churchill–Stalin European order, sketched in Moscow in October 1944, and the American-led division of East and West; critics note how little of his book concerns the conference itself.

Underneath lies one question: did Yalta divide Europe, or recognise where the armies stood? Its defenders note that the texts promised free elections, not spheres of influence, that the division followed the Red Army and Stalin's later breaches, and that Churchill's own planners rated the odds of a war to force a fair deal for Poland as unfavourable. Its critics point to texts elastic enough to be stretched without breaking, and to the percentages bargain, which the historian Naimark counts with Yalta and Potsdam among the arrangements that placed Eastern Europe, initially at least, in the Soviet sphere. The Far East deal divides opinion too: critics saw a needless sacrifice of Chinese sovereignty, while Tsuyoshi Hasegawa's argument that Soviet entry did more than the atomic bomb to force Japan's surrender partly vindicates Roosevelt's priority. What no side disputes is that the Poles, Balts, Chinese and Koreans whose futures were settled in February 1945 were not asked.

## Further exploration

- **S. M. Plokhy, *Yalta: The Price of Peace* (2010).** An archive-based account, using Soviet sources, arguing that the Western leaders did about as well as the military situation allowed.
- **Fraser J. Harbutt, *Yalta 1945: Europe and America at the Crossroads* (2010).** Places Yalta in the shift from a Churchill–Stalin European order to a US-led East–West one.
- **Anne Applebaum, *Iron Curtain: The Crushing of Eastern Europe, 1944–1956* (2012).** How Soviet-backed regimes were imposed in Poland, Hungary and East Germany after Yalta.
- **Rana Mitter, *Forgotten Ally: China's World War II, 1937–1945* (2013).** China's war, and how its allies treated it.
- **Tsuyoshi Hasegawa, *Racing the Enemy: Stalin, Truman, and the Surrender of Japan* (2005).** The Far Eastern consequences of Yalta and the end of the Pacific war.
- **John Lewis Gaddis, *The United States and the Origins of the Cold War, 1941–1947* (1972).** The founding post-revisionist synthesis.$mn_yalta_master$,
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
  select $mn_yalta_quiz$[
    {"type": "mcq", "prompt": "Under the 'Yalta formula' for the UN Security Council, what could a permanent member veto?", "options": ["Any action by the Council, but not procedural decisions", "Any decision, including whether a question could be discussed", "Only decisions about its own territory", "Nothing; the veto was introduced only at San Francisco"], "answerIndex": 0, "explanation": "The formula stopped a single power blocking debate; at Dumbarton Oaks the Soviets had wanted a veto even on discussion.", "id": "q1"},
    {"type": "mcq", "prompt": "When did the secret Agreement Regarding Japan say the Soviet Union would enter the war against Japan?", "options": ["Immediately after the conference", "Within one month of Japan's surrender", "In two or three months after Germany's surrender", "Only after an American invasion of Japan"], "answerIndex": 2, "explanation": "The Soviet Union declared war on 8 August 1945, three months after Germany's surrender.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the 1944 'percentages agreement' is accurate?", "options": ["It was signed by Churchill, Stalin and Roosevelt at Yalta", "It gave Britain 90 per cent influence in Romania", "Roosevelt drafted it and Churchill approved it", "It was a secret, informal and unsigned Churchill–Stalin exchange in Moscow, with no formal part at Yalta"], "answerIndex": 3, "explanation": "Churchill's memoirs were long the main source; Soviet historians denied it, but later scholarship also used the British record of the talks.", "id": "q3"},
    {"type": "mcq", "prompt": "Which Soviet citizens did the Yalta repatriation agreements cover?", "options": ["All people born anywhere in the Russian Empire", "Soviet citizens within the borders of 1 September 1939", "Only Soviet prisoners of war who asked to go home", "Citizens of the Baltic states and western Ukraine only"], "answerIndex": 1, "explanation": "Return was mandatory for those within the 1939 borders; Balts, people from western Ukraine and western Belarus, and old émigrés were exempt, though some émigrés were handed over in breach of the terms.", "id": "q4"},
    {"type": "open", "prompt": "How did the peoples who were not at the table experience the Yalta agreements? Discuss at least three of: Poles, Chinese, Balts, Koreans, and repatriated Soviet citizens.", "rubric": "A strong answer covers the exile government's rejection of the Polish decisions as a new partition by Poland's allies, the Curzon Line and the displacement of Poles from the east, and the Trial of the Sixteen; China's exclusion from the Far East bargain, the concurrence Roosevelt undertook to obtain, and the 1945 Sino-Soviet treaty; the Baltic states' silence at Yalta, US non-recognition and the 1949 deportations; Roosevelt's trusteeship idea for Korea and Korean demands for independence; and the repatriation agreements, presenting both the charge of betrayal (Bethell, Epstein) and the archive-based view that most forced returnees were collaborators, while noting that the arrest figures are Soviet archival data.", "id": "q5"},
    {"type": "open", "prompt": "Was Yalta realistic statecraft or a 'betrayal'? Assess the debate.", "rubric": "A strong answer sets out the betrayal case (Polish exiles, the 1952 Republican platform, Bush in 2005, the Hiss controversy with its contested identification) and the realist case (the Red Army's position, Byrnes's remark, Churchill's planners, Plokhy), uses Leahy's warning about elastic wording and the gap between the Declaration on Liberated Europe and its enforcement, places the percentages agreement in its disputed status, mentions Gaddis's shift and Harbutt's 'hinge' interpretation, and reaches a reasoned judgement.", "id": "q6"}
  ]$mn_yalta_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-yalta-conference', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
