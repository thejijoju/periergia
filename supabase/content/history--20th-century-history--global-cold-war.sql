-- Global Cold War and the Arms Race — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/global-cold-war-and-the-arms-race @ research/advanced/read.
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
    'history/20th-century-history/global-cold-war-and-the-arms-race',
    'research',
    'advanced',
    'read',
    $mn_coldwar_master$> **An armed peace in the North, hot wars in the South.** For more than four decades after 1945 the rivalry between the United States and the Soviet Union organised the world: it divided Europe, drove an arms race that built tens of thousands of nuclear weapons, and brought the two powers to the brink over Cuba. Yet they never fought each other directly, and the historian Odd Arne Westad has argued that the conflict's most important battlegrounds lay in Asia, Africa and Latin America, where coups, proxy wars and massacres killed millions. This chapter follows containment, the bomb and the peoples who lived beside its test sites, the crises and the diplomacy that defused them, the Third World as battleground and actor, détente and its collapse, and the historians' argument over who was to blame and whether the "cold" war was ever a peace.

## A New Kind of War

Historians do not fully agree on when the Cold War began or ended, but it is often dated from the Truman Doctrine of 12 March 1947 to the dissolution of the Soviet Union on 26 December 1991. The phrase was first applied to the US–Soviet confrontation in a speech by Bernard Baruch on 16 April 1947, written by the journalist Herbert Bayard Swope: "we are today in the midst of a cold war."

As the chapter on the Second World War describes, that war left the United States and the Soviet Union as rival superpowers, and the chapter on the Yalta Conference examines the bargains of February 1945 and the argument over them. This chapter starts in 1946.

## Dividing Europe

On 5 March 1946, at Fulton, Missouri, Churchill declared that "from Stettin in the Baltic to Trieste in the Adriatic, an Iron Curtain has descended across the Continent." Soviet troops meanwhile stayed in northern Iran past the agreed deadline, and Moscow pressed Turkey over the Straits.

American policy took its shape from a diplomat in Moscow, **George F. Kennan**. His "Long Telegram" of 22 February 1946 traced Soviet conduct to "a traditional and instinctive Russian sense of insecurity". In July 1947, signing himself "X" because he was a serving official, he set out the policy that took its name from his article.

```quote
…the main element of any United States policy toward the Soviet Union must be that of a long-term, patient but firm and vigilant containment of Russian expansive tendencies.
George F. Kennan ("X") · "The Sources of Soviet Conduct", Foreign Affairs · July 1947
```

Kennan hoped containment would bring "either the break-up or the gradual mellowing of Soviet power". He recalled that his "entire diplomatic experience took place in rather high northern latitudes", and the historian Thomas Borstelmann has described his disdain for the peoples of Africa, Asia, the Middle East and Latin America, the regions where containment would be most violently applied.

When Britain said in February 1947 that it could no longer fund the Greek government's war against the Communist-led Democratic Army, Truman told Congress on 12 March that the United States must "support free peoples who are resisting attempted subjugation by armed minorities or by outside pressures", and Congress voted $400 million for Greece and Turkey. Critics noted that the Greek monarchy was itself repressive, and Stalin gave the Greek Communists no help. On 5 June 1947, at Harvard, Marshall proposed the aid programme that bears his name, presenting it as aimed not at any country but at hunger, poverty and chaos. It was offered to all Europe; the Soviet Union refused and kept its satellites out. About $13 billion went to 17 countries, and Moscow's answer became Comecon in 1949.

Communists seized power in Czechoslovakia in February 1948. When the Western powers introduced a new currency and planned a West German state, Stalin blockaded West Berlin from June 1948 to May 1949; American and British aircraft flew in more than 2.3 million tons of supplies, nearly two-thirds of it coal, and about a hundred people died, mostly in crashes. Twelve states signed the **North Atlantic Treaty** on 4 April 1949, whose Article 5 declared an attack on one an attack on all. Two German states were founded that year. When West Germany joined NATO in 1955, the Soviet Union and seven Eastern Bloc states formed the **Warsaw Pact**.

The year 1949 also brought Communist victory in China. In April 1950 the secret paper NSC-68 called for a hydrogen bomb and a vast military build-up, and US defence spending rose from about 5 to 14 per cent of GDP between 1950 and 1953.

## Korea: The Cold War Turns Hot

Korea, whose colonial history the chapter on Japan's Empire in Asia tells, had been divided at the 38th parallel in 1945, and rival states under Kim Il Sung and Syngman Rhee were founded in 1948. On 25 June 1950 the North invaded. The UN Security Council, with the Soviet delegate absent, backed the South, and a UN command of 21 countries, mostly American, fought back after the Inchon landing until, in October, Chinese "People's Volunteers" crossed the Yalu. An armistice on 27 July 1953 left a demilitarised zone and no peace treaty.

About a million soldiers and an estimated 1.5 to 3 million civilians died; common estimates put the total at about 3 million, and Bruce Cumings counts at least 2 million civilian casualties. American bombing destroyed almost every substantial building in the North. In the Bodo League killings of 1950, South Korean forces carried out mass killings: a truth commission verified 4,934 victims, and historians estimate at least 60,000 and perhaps 200,000.

## The Bomb and Its Victims

On 29 August 1949 the Soviet Union tested its first atomic bomb at Semipalatinsk in Kazakhstan, modelled, thanks to atomic spies, on the American Fat Man. Truman ordered a crash programme for the hydrogen bomb, and on 1 November 1952 the Ivy Mike test yielded 10.4 megatons in Enewetak Atoll. The Soviet Union tested a two-stage thermonuclear weapon in 1955 and in 1961 the 50-megaton **Tsar Bomba**, the most powerful weapon ever tested. The American stockpile rose from 299 warheads in 1950 to about 31,000 in the mid-to-late 1960s; the Soviet one, 5 warheads in 1950, reached 39,197 by 1985 and peaked the following year. By 1960 both sides had intercontinental missiles, and the Soviet R-7 that launched **Sputnik 1** on 4 October 1957 was one. In the early 1960s, under Defence Secretary Robert McNamara, the doctrine of mutual assured destruction was declared; Donald Brennan coined its acronym in 1962, cynically, for its spelling: MAD.

More than 2,000 nuclear tests followed 1945, and many fell on people with no say in them. In 1946 the United States moved the 167 inhabitants of **Bikini Atoll** in the Marshall Islands "temporarily"; their leader, King Juda, said: "Everything is in God's hands." They were moved to Rongerik, which could not sustain them, then to Kili, and those who later went back were removed again in 1978. On 1 March 1954 the **Castle Bravo** test at Bikini yielded 15 megatons, about two and a half to three times the predicted yield. Fallout fell on Rongelap and Utirik, whose people were evacuated only after two or three days, suffering radiation sickness; by 1963 thyroid tumours had appeared in 20 of 29 Rongelap children exposed. The 23 crew of the Japanese fishing boat *Lucky Dragon No. 5* fell ill, and its radioman, Kuboyama Aikichi, died six months later. The international reaction against atmospheric testing was strong.

The Soviet site at **Semipalatinsk** was an 18,000 km² stretch of Kazakh steppe that Beria called "uninhabited", built with Gulag labour. Over 450 explosions took place there from 1949 to 1989, more than a fifth of all tests in history. Kazakh experts estimate that 1.5 million people were exposed to fallout, and the effects were concealed until after the site closed. In 1989 Olzhas Suleimenov founded the Nevada-Semipalatinsk movement, one of the first major anti-nuclear movements in the Soviet Union, and the test site was closed on 29 August 1991. Britain tested in Australia and on Kiritimati (Christmas Island), France in the Algerian Sahara and French Polynesia, and China at Lop Nur in Xinjiang.

```checkpoint
q: What did George Kennan mean by "containment"?
a*: A long-term, patient but firm effort to hold back Soviet expansion, which he hoped would eventually lead to the break-up or mellowing of Soviet power.
a: An immediate military attack to overthrow the Soviet government.
x: Kennan called for long-term, patient containment, not war; he hoped Soviet power would break up or mellow over time.
a: A plan to share the atomic bomb with the Soviet Union.
x: Containment concerned Soviet expansion, not nuclear sharing; the Soviet Union built its own bomb in 1949.
a: A policy of withdrawing American forces from Europe and Asia.
x: Containment meant engagement abroad, from aid to Greece and Turkey to the Marshall Plan and NATO.
hint: Think of the "X" article of July 1947.
why: Kennan's idea, first sketched in the Long Telegram of 1946, shaped American policy for decades.
---
q: Why do historians of the arms race single out Semipalatinsk and Bikini?
a: Because they were the targets of the atomic bombs used in war.
x: The bombs used in war fell on Hiroshima and Nagasaki; Bikini and Semipalatinsk were test sites.
a: Because the Partial Test Ban Treaty was signed there.
x: The Partial Test Ban Treaty was signed in Moscow in 1963.
a*: Because tests there exposed local peoples, Marshall Islanders and Kazakhs, to displacement and fallout whose effects were long ignored or concealed.
a: Because no tests were ever carried out there.
x: Over 450 explosions took place at Semipalatinsk, and the United States tested at Bikini from 1946 to 1958.
hint: Think of King Juda, Rongelap, and the 1.5 million people Kazakh experts believe were exposed.
why: The arms race had victims in peacetime, mostly among peoples with little say in the decisions.
```

## Crises at the Centre

In 1956 two crises came together. In Hungary a revolution began on 23 October and Nagy declared withdrawal from the Warsaw Pact before Soviet forces crushed it; about 2,500 Hungarians died (estimates run from 2,000 to 3,000), with some 700 Soviet soldiers, and 200,000 Hungarians fled. At the same moment Israel, then Britain and France, invaded Egypt in the Suez crisis, and pressure from the United States, the Soviet Union and the UN forced them out. In Berlin, after some 3.5 million East Germans had left for the West, East Germany began building the **Berlin Wall** on 13 August 1961; at least 140 people would die there.

The gravest crisis came in October 1962, when American U-2 aircraft photographed Soviet missile sites in Cuba, where Castro's revolution had taken power in 1959. The background included American missiles in Italy and Turkey and the failed Bay of Pigs invasion. The United States imposed a naval "quarantine" on 22 October. On 27 October, on the Soviet submarine B-59, the captain, Savitsky, wanted to fire a nuclear torpedo; launch needed the consent of three officers, and **Vasily Arkhipov** is credited with refusing his. Accounts differ on how the argument ended, and the episode became public only in 2002. Khrushchev withdrew the missiles for a public American pledge not to invade Cuba and a secret promise to remove the missiles from Turkey. Only in 1992 was it confirmed that Soviet forces in Cuba already had tactical nuclear warheads.

Safeguards followed. A memorandum of 20 June 1963 created the Moscow–Washington **hotline**, a teletype link rather than the red telephone of legend. In August 1963 the Soviet Union, Britain and the United States signed the **Partial Test Ban Treaty**, banning tests in the atmosphere, in space and under water. The **Non-Proliferation Treaty**, opened for signature in 1968, recognised five nuclear-weapon states at a time when some predicted 25 to 30 within twenty years. That August the Soviet Union and three allies, Poland, Bulgaria and Hungary, invaded Czechoslovakia to end Dubček's Prague Spring.

## The Third World as Battleground

The Cold War overlapped with the end of empires, and the United States used the CIA to undermine neutral or hostile Third World governments and to support friendly ones. In **Iran**, the parliament nationalised the Anglo-Iranian Oil Company in 1951, and Mosaddegh's government carried it out. Britain organised a boycott and lobbied Eisenhower, and on 19 August 1953 CIA-backed crowds, including paid mobsters, and army units took Tehran; 200 to 300 people were killed, and the Shah ruled for 26 more years. In 2013 the CIA released its own history acknowledging that the coup was carried out "under CIA direction"; historians still debate the part played by Iranians such as Ayatollah Kashani, who broke with Mosaddegh. In **Guatemala**, Árbenz's land reform hit the United Fruit Company, and in June 1954 a CIA-trained force of 480 men under Carlos Castillo Armas invaded; the army would not fight, and Árbenz resigned.

In the **Congo**, independent from 30 June 1960, Patrice Lumumba used his independence-day speech to answer colonial rule.

```quote
We are proud of this struggle, of tears, of fire, and of blood, to the depths of our being, for it was a noble and just struggle, and indispensable to put an end to the humiliating slavery which was imposed upon us by force.
Patrice Lumumba · Independence-day speech · 30 June 1960
```

When Katanga seceded with Belgian support and UN peacekeepers would not fight it, Lumumba turned to the Soviet Union. Eisenhower authorised a CIA plan to poison him, never carried out; after Mobutu's coup, Lumumba was sent to Katanga, tortured and shot by Katangan authorities with Belgian mercenaries on 17 January 1961. Belgium apologised in 2002 for its "moral responsibility". The crisis killed around 100,000 people and ended with Mobutu in power.

In **Indonesia**, after a failed coup by the 30 September Movement in 1965, the army under Suharto blamed the Communist Party, then the world's third largest. From October 1965 to March 1966 its members, unionists, women of the Gerwani movement and thousands of ethnic Chinese were killed. The most widely published estimates run from 500,000 to 1 million; some are higher, and the historian Robert Cribb suggests 500,000 is most accurate. The US embassy supplied lists of suspected communists, and a 1968 CIA report ranked the killings among "the worst mass murders of the 20th century". In Indochina, by one estimate, about 2 million died in the Vietnam War, and some 1.5 to 2 million died under the Khmer Rouge in Cambodia.

## Bandung and Non-Alignment

The new states were actors as well as arenas. From 18 to 24 April 1955, delegates of 29 countries, representing 54 per cent of humanity, met at **Bandung** in Indonesia. Sukarno hailed "the first intercontinental conference of coloured peoples in the history of mankind"; the conference opposed colonialism and adopted ten principles drawing on the UN Charter and the Five Principles of Peaceful Coexistence. China's Zhou Enlai, who had survived an assassination attempt on the way, was conciliatory, and Nehru argued against military pacts. The writer Richard Wright attended with funding from the Congress for Cultural Freedom, which, it emerged in 1966–67, was financed by the CIA.

{{image: Bandung Conference | Delegates at the Asian–African Conference in Bandung, April 1955, where 29 countries representing more than half of humanity met.}}

The **Non-Aligned Movement** followed at Belgrade in 1961, initiated by Tito with Nasser, Nehru, Nkrumah and Sukarno. Its 1979 Havana Declaration set it "against imperialism, colonialism, neo-colonialism, racism" and "great power and bloc politics", yet it split soon after over the Soviet invasion of Afghanistan.

## The Communist World Divides

When Khrushchev denounced Stalin in 1956, Mao defended him and scorned "peaceful coexistence", and Khrushchev was disturbed by Mao's attitude to nuclear war. In 1960 the Soviet Union withdrew 1,390 technicians from China. China tested its own bomb in 1964, and in March 1969 the two fought on their border at Zhenbao Island; Moscow reportedly considered a large nuclear strike. Nixon's visit to Beijing in February 1972, the first by a sitting American president, gave Washington leverage against Moscow.

## Détente and Its Wars

From 1969 the superpowers pursued **détente**: SALT I, freezing strategic missile launchers, and the Anti-Ballistic Missile Treaty in 1972, and the Helsinki Final Act of 1975 with its commitments on human rights. But proxy conflict went on, and détente unravelled over Africa and human rights.

In **Angola**, Cuba and the Soviet Union backed the MPLA and the United States and South Africa backed UNITA, in a civil war from 1975 to 2002 that killed 500,000 to 800,000 people. Using Cuban archives, Piero Gleijeses showed that Castro decided on 4 November 1975 to send troops in response to a South African invasion, not on Soviet orders. In 1988 the New York Accords exchanged foreign withdrawal for Namibian independence. In **Mozambique**, the Marxist FRELIMO government fought RENAMO, backed by Rhodesia and then South Africa, from 1977 to 1992; over a million people were killed or starved. When Somalia invaded Ethiopia's Ogaden in 1977, the Soviet Union switched sides to back Ethiopia's Derg regime, which had overthrown Haile Selassie in 1974 and whose Red Terror killed between 10,000 and several hundred thousand people by differing estimates, sending a $1 billion airlift, more than 12,000 Cubans and 1,500 Soviet advisers.

In December 1979 Soviet troops invaded **Afghanistan**. The mujahideen were backed by Pakistan, the United States, Britain, China, Saudi Arabia and others. Between 1 and 3 million Afghans died and millions fled to Pakistan and Iran; official Soviet dead numbered 14,453. The invasion ended détente: Carter shelved the SALT II treaty and boycotted the 1980 Moscow Olympics.

## The Second Cold War and the End

Reagan had summed up his policy in 1977: "We win and they lose." Soviet SS-20 missiles met NATO's Pershing IIs, first deployed in Europe in 1983, the year Reagan announced the Strategic Defense Initiative, calling MAD a "suicide pact". On 26 September 1983 a Soviet early-warning system reported American missile launches, and Stanislav Petrov judged it a false alarm. In November the NATO exercise **Able Archer 83** alarmed some Soviet leaders, who feared a disguised first strike. Some scholars consider it one of the closest moments to nuclear war; others dispute this.

Gorbachev, in power from 1985, met Reagan at Geneva in 1985 and Reykjavík in 1986, where deep cuts foundered on SDI, and they signed the **INF Treaty** on 8 December 1987, eliminating intermediate-range missiles. Soviet troops left Afghanistan in February 1989, the Berlin Wall opened on 9 November 1989, the Warsaw Pact dissolved in 1991, START I was signed that year, and the Soviet Union dissolved on 26 December 1991. The arms-control order outlived it only in part: the Non-Proliferation Treaty was extended indefinitely in 1995, but North Korea left it in 2003, and the United States left the ABM Treaty in 2002.

```checkpoint
q: What does Piero Gleijeses's research show about Cuba's intervention in Angola in 1975?
a: That Cuban troops went only on direct Soviet orders.
x: Gleijeses's Cuban archival evidence points the other way: Havana decided for itself.
a*: That Castro decided to send troops on 4 November 1975 in response to a South African invasion, not on Soviet orders.
a: That Cuba never sent troops to Angola.
x: Cuban troops fought in Angola; by 1987 some 20,000 were stationed in the south alone.
a: That Cuba fought alongside UNITA and South Africa.
x: Cuba backed the MPLA; the United States and South Africa backed UNITA.
hint: Think about Third World agency in the global Cold War.
why: Gleijeses's work shows how archives from the South complicate the picture of superpowers pulling all the strings.
---
q: What was the Moscow–Washington hotline set up in 1963?
a: A red telephone on the president's desk.
x: The red telephone is popular legend; the hotline was a teletype link.
a: A radio station broadcasting to Eastern Europe.
x: The hotline linked the two governments directly; it was not a broadcaster.
a: A treaty banning nuclear tests in the atmosphere.
x: That was the Partial Test Ban Treaty, signed in August 1963.
a*: A teletype link between the two governments, created by a memorandum of June 1963 after the Cuban Missile Crisis.
hint: The legend and the reality differ.
why: The hotline was one of several safeguards that followed the near-miss of October 1962.
```

## Interpreting the Cold War

The overview of the twentieth century sketches the main schools; here they are set out as debates. The first "orthodox" American historians, such as Herbert Feis, blamed Soviet expansion into Eastern Europe. **William Appleman Williams**'s *The Tragedy of American Diplomacy* (1959) launched a "revisionist" school that saw the United States as an empire-building power seeking open markets, whose leaders exaggerated the Soviet threat. Post-revisionists shared out the blame: John Lewis Gaddis wrote in 1972 that "neither side can bear sole responsibility for the onset of the Cold War", and Melvyn Leffler argued that American fears of economic dislocation, revolutionary nationalism and power vacuums, more than Kremlin actions, drove US policy. After the Soviet archives opened, Gaddis's *We Now Know* (1997) put more weight on Stalin and ideology; Leffler judged that he had returned to "a more traditional interpretation".

Westad shifted the ground. Both superpowers, he argues, intervened for ideological reasons, Third World leaders often sought their intervention, and "the most important aspects of the Cold War were neither military nor strategic, nor Europe-centered, but connected to political and social developments in the Third World". Critics find that claim more complicated than it looks.

The sharpest debate concerns the "long peace". In 1986 Gaddis argued that bipolarity and nuclear deterrence, among other factors, gave the great powers their longest stability of the century. Critics reply that this peace was a Northern experience: the political scientist Samuel Kim puts East Asia's war dead from 1945 to 1994 at 10.4 million, and the anthropologist Heonik Kwon argues that the postcolonial world lived the Cold War as civil war and massacre. Whether deterrence kept the peace, or luck carried the world through Cuba, Petrov's alarm and perhaps Able Archer, remains open.

## Further exploration

- **Odd Arne Westad, *The Global Cold War: Third World Interventions and the Making of Our Times* (2005).** The Cold War as a contest fought, and most destructively felt, in Asia, Africa and Latin America.
- **Odd Arne Westad, *The Cold War: A World History* (2017).** A one-volume global survey from its roots to its aftermath.
- **John Lewis Gaddis, *The Cold War: A New History* (2005).** A short, readable synthesis by the leading post-revisionist.
- **Melvyn P. Leffler, *For the Soul of Mankind: The United States, the Soviet Union, and the Cold War* (2007).** Four moments when leaders might have eased the conflict, and the one when it ended.
- **Vijay Prashad, *The Darker Nations: A People's History of the Third World* (2007).** The Third World as a political project, from the 1920s and Bandung to its unravelling.
- **Heonik Kwon, *The Other Cold War* (2010).** How the "long peace" of the North was lived as civil war and massacre in the postcolonial world.
- **Piero Gleijeses, *Conflicting Missions: Havana, Washington, and Africa, 1959–1976* (2002).** Cuban archives show that Cuba's African interventions were Havana's own decisions.$mn_coldwar_master$,
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
  select $mn_coldwar_quiz$[
    {"type": "mcq", "prompt": "What happened on the Soviet submarine B-59 on 27 October 1962, during the Cuban Missile Crisis?", "options": ["Vasily Arkhipov is credited with refusing consent when the captain, Savitsky, wanted to fire a nuclear torpedo, though accounts differ on how the argument ended", "The submarine fired a nuclear torpedo that missed the American fleet", "Its crew defected to the United States", "It delivered the first nuclear warheads to Cuba"], "answerIndex": 0, "explanation": "Launch required the consent of three officers, and Arkhipov is credited with refusing his. Accounts differ in detail on whether he persuaded Savitsky or Savitsky decided himself, and the episode became public only in 2002.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these best describes the 1953 coup in Iran?", "options": ["A Soviet-backed rising that installed a communist government", "A purely Iranian revolt in which no foreign power was involved", "The overthrow of Mosaddegh, after he nationalised the Anglo-Iranian Oil Company, by CIA-backed crowds and army units, a role the CIA acknowledged in its own history released in 2013", "The revolution that overthrew the Shah"], "answerIndex": 2, "explanation": "On 19 August 1953 CIA-backed crowds, including paid mobsters, and army units took Tehran; 200 to 300 were killed and the Shah ruled for 26 more years. A released CIA history says the coup was carried out 'under CIA direction', though historians still debate the part of Iranian actors such as Ayatollah Kashani.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Bandung Conference of April 1955?", "options": ["A NATO summit on nuclear strategy", "A meeting of Warsaw Pact leaders", "The founding conference of the United Nations", "An Asian–African conference of 29 countries, representing 54 per cent of humanity, that opposed colonialism"], "answerIndex": 3, "explanation": "Convened by Indonesia, Burma, India, Ceylon and Pakistan, it met in Bandung from 18 to 24 April 1955; Sukarno called it 'the first intercontinental conference of coloured peoples in the history of mankind'. The Non-Aligned Movement followed at Belgrade in 1961.", "id": "q3"},
    {"type": "mcq", "prompt": "Why is the Semipalatinsk test site in Kazakhstan remembered as a human disaster?", "options": ["It was where the Soviet Union dropped a bomb in war", "Over 450 nuclear explosions took place there from 1949 to 1989, and Kazakh experts estimate that 1.5 million people were exposed to fallout, with the effects concealed until after the site closed", "It was where China tested its first bomb", "It was never used, because of local protests in 1949"], "answerIndex": 1, "explanation": "Beria called the steppe 'uninhabited' and it was built with Gulag labour; it saw more than a fifth of all nuclear tests in history. The Nevada-Semipalatinsk movement, founded by Olzhas Suleimenov in 1989, helped bring about its closure on 29 August 1991.", "id": "q4"},
    {"type": "open", "prompt": "Was the Cold War a 'long peace'? Set out the main positions in the debate.", "rubric": "A good answer presents the debate as a debate. For: John Lewis Gaddis (1986) argued that bipolarity and nuclear deterrence, among other factors, produced the longest great-power stability of the century; the superpowers never fought each other directly, and crises such as Cuba in 1962 were defused, followed by safeguards like the 1963 hotline and the Partial Test Ban Treaty. Against: millions died in proxy wars and interventions; Samuel Kim puts East Asia's war dead from 1945 to 1994 at 10.4 million, including about 3 million in Korea; Heonik Kwon argues that the postcolonial world lived the Cold War as civil war and massacre; examples include Indonesia (500,000 to 1 million dead, most widely published estimates), Angola (500,000–800,000), Mozambique and Afghanistan (1–3 million Afghans). Strong answers note the near-misses (Arkhipov in 1962, Petrov in 1983, and Able Archer 83, whose danger is disputed) and ask whether peace came from deterrence or luck.", "id": "q5"},
    {"type": "open", "prompt": "Who was to blame for the Cold War? Explain how historians' answers have changed.", "rubric": "A good answer traces the schools as arguments, not settled verdicts. Orthodox historians such as Herbert Feis blamed Soviet expansion into Eastern Europe. Revisionists, led by William Appleman Williams (The Tragedy of American Diplomacy, 1959), saw the United States as an empire-building power seeking open markets whose leaders exaggerated the Soviet threat; Gar Alperovitz argued the atomic bombs were used to intimidate the USSR. Post-revisionists such as Gaddis (1972: 'neither side can bear sole responsibility') and Melvyn Leffler (US fears of economic dislocation, revolutionary nationalism and power vacuums) spread the responsibility; after the Soviet archives opened Gaddis's We Now Know (1997) put more weight on Stalin and ideology. Odd Arne Westad's global approach argues that ideology drove both superpowers' interventions, that Third World leaders sought them and share blame, and that the most important aspects of the conflict lay in the Third World; critics find this more complicated. Strong answers use evidence such as Kennan's Long Telegram and 'X' article, the Truman Doctrine and Marshall Plan, or Gleijeses's finding that Cuba acted in Angola on its own decision.", "id": "q6"}
  ]$mn_coldwar_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/global-cold-war-and-the-arms-race', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
