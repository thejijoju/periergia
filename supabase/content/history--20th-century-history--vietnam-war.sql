-- The Vietnam War: the American War in Vietnam — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-vietnam-war-the-american-war-in-vietnam @ research/advanced/read.
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
    'history/20th-century-history/the-vietnam-war-the-american-war-in-vietnam',
    'research',
    'advanced',
    'read',
    $mn_vietnam_master$> **Three decades of war, many wars in one.** Between 1945 and 1975 Vietnam fought France, then the United States and its allies, and also itself. The struggle was at once a war of national liberation, a civil war between rival visions of an independent Vietnam, and a Cold War proxy war that drew in China, the Soviet Union, South Korea, Australia and others and spilled into Laos and Cambodia. This chapter runs from French Indochina and Dien Bien Phu, through partition, Diệm's South and the National Liberation Front, to American escalation, Tet and My Lai, the antiwar movement, Nixon's wider war, the Paris Accords and the fall of Saigon, and ends with the disputed costs and the long aftermath on both sides of the Pacific.

## What to Call It

In English it is the Vietnam War, or the Second Indochina War. North Vietnam, and official Vietnamese histories today, call it the "War of resistance against America to save the nation" (*Kháng chiến chống Mỹ, cứu nước*); hence this chapter's "American War". South Vietnam used names such as the "Resistance war against the communists". Even the start is contested: in 1998 the US government officially dated the war from 1 November 1955, when its military advisory group was established, while others begin it in 1954, 1950 or 1945. It ended on 30 April 1975. For Hanoi it was a war against a foreign invader; for Saigon's defenders a war against communist conquest; for Washington a front in the Cold War. All were true at once, and civil war among Vietnamese was a defining feature from the outset.

## Colony and Revolution, 1858–1946

France absorbed Vietnam into French Indochina in stages between 1858 and 1887. In 1930 Nguyen Sinh Cung, later known as **Ho Chi Minh**, founded the Indochinese Communist Party. Japan ended French rule in March 1945, as the chapter on France Under Nazi Occupation notes, and a famine in 1944–45, described in the chapter on Japan's Empire in Asia, killed between 400,000 and 2 million people. The communist-led Viet Minh had even received some training and weapons from the American OSS to fight Japan. In August 1945 the emperor Bảo Đại abdicated, and on 2 September Ho proclaimed the Democratic Republic of Vietnam (DRV) in Hanoi, in words that deliberately echoed the American Declaration of Independence. The historian Pierre Asselin reads the borrowing as a strategic bid for Allied support.

```quote
All men are created equal. They are endowed by their Creator with certain inalienable rights, among them are Life, Liberty, and the pursuit of Happiness.
Ho Chi Minh · Declaration of Independence of the Democratic Republic of Vietnam (English text from Ho's *Selected Works*, quoting the American Declaration) · 2 September 1945
```

Independence did not hold. On 23 September 1945 French forces, with British support, overthrew the DRV's administration in Saigon. The Viet Minh, meanwhile, were killing rival nationalists and Trotskyists, a Vietnamese civil conflict inside the anticolonial war. On 23 November 1946 the French fleet bombarded Haiphong, killing between 2,000 and 6,000 Vietnamese, most of them civilians, and full-scale war began that December.

## Dien Bien Phu and Geneva

The war became international in 1950. The new People's Republic of China recognised the DRV and sent military advisers who helped turn the Viet Minh into a regular army; the United States backed France, and by 1954 was paying about 80 per cent of the war's cost. The decisive battle came at **Dien Bien Phu**, near the Laotian border, besieged from 13 March to 7 May 1954. Viet Minh artillery on the surrounding heights was supplied by tens of thousands of porters. The French lost between 1,142 and 2,293 killed and 11,721 captured; Western estimates of Viet Minh dead are about 8,000. Across the whole war, between 400,000 and about 843,000 soldiers and 125,000–400,000 civilians died, by differing estimates.

The Geneva Conference turned to Indochina the day after the garrison fell. China's Zhou Enlai, fearing American intervention, pressed the Viet Minh to settle. The ceasefire, signed only by the French and Viet Minh commands, drew a provisional line at about the 17th parallel; elections "in July 1956" were promised only in an unsigned Final Declaration, and neither the United States nor the State of Vietnam signed. Up to a million northerners moved south, including at least 500,000 Catholics; American propaganda exaggerated threats to them, but most went from conviction. In the North a land reform of 1953–56 brought executions that estimates put anywhere from under 2,000 to about 50,000, with the historian Edwin Moïse estimating about 13,500, and Hanoi itself admitted "excesses". The elections were never held.

## Two Vietnams, 1954–1963

**Ngô Đình Diệm**, a Catholic nationalist who was both anti-French and anti-communist, became prime minister of the South in June 1954. He crushed the private armies of the Bình Xuyên and the Cao Đài and Hòa Hảo sects, won a 1955 referendum with a claimed 98.2 per cent (the votes exceeded registered voters by more than 380,000), and proclaimed the Republic of Vietnam. His rule was authoritarian and nepotistic: his brother Ngô Đình Nhu ran the secret police, and by 1959 some 40,000 political prisoners were held. Yet Diệm had a programme of his own, Personalism, a "third way" between liberalism and communism.

The insurgency was rooted in the South and steered from Hanoi. From 1957 southern cadres waged an assassination campaign against officials, teachers and health workers. Hanoi approved "people's war" in 1959 and began building the **Ho Chi Minh Trail**. On 20 December 1960 the **National Liberation Front** (NLF) was founded, under Hanoi's direction but including non-communists; its enemies called its fighters "Việt Cộng", short for "Vietnamese communist". Women were prominent from the start: Nguyễn Thị Định, a peasant-born veteran, co-founded the NLF, became its deputy commander, and led the 1960 Bến Tre uprising and the all-female "Long-Haired Army". Saigon answered with the **Strategic Hamlet Program**, forcing peasants into fortified villages; the officer overseeing it was secretly a communist agent. Under Kennedy, American advisers rose to 16,000.

Diệm's crisis came from Buddhists. In May 1963 government forces in Huế shot Buddhists protesting a ban on their flags, and on 11 June the monk **Thích Quảng Đức** burned himself to death in Saigon. Kennedy said that "no news picture in history has generated so much emotion around the world" as Malcolm Browne's photograph; Madame Nhu said she would "clap hands at seeing another monk barbecue show". Washington signalled it would not oppose a coup, and on 2 November 1963 Diệm and Nhu were overthrown and killed. A string of coups followed until Nguyễn Văn Thiệu emerged, president from 1967 to 1975.

## Hanoi Chooses War

The North's decisions were made less by Ho than by **Lê Duẩn**, the party's First Secretary from 1960. With Lê Đức Thọ he sidelined moderates, and in December 1963 pushed through a strategy of "General Offensive and General Uprising"; Ho and others were coerced into accepting it, and from 1967 hundreds of party members and officials branded "revisionists", many of them sympathetic to the Soviet line, were arrested. The Viet Cong grew from about 5,000 fighters in early 1959 to about 100,000 by the end of 1964. China says it sent some 320,000 troops, mostly engineers and anti-aircraft crews, over the war; the Soviet Union shipped about $450 million of arms a year.

## Tonkin and Americanization, 1964–1968

In August 1964 the destroyer USS *Maddox*, operating off North Vietnam after South Vietnamese commando raids, exchanged fire with North Vietnamese torpedo boats. A second attack, reported on 4 August, never happened: a National Security Agency study declassified in 2005 found it rested on bad intelligence. Defense Secretary Robert McNamara concealed the raids from Congress, which on 7 August passed the **Gulf of Tonkin Resolution** by 416–0 and 88–2. Johnson said it was "like grandma's nightshirt — it covered everything".

**Operation Rolling Thunder** bombed the North from March 1965 to October 1968, dropping more by the end of 1967 than in the entire Korean War and killing, over the whole campaign, about 20,000 soldiers and 30,000–65,000 civilians. In 1965 alone 97,000 northern civilians worked full time repairing the damage. US Marines landed near Da Nang on 8 March 1965; American troops peaked at 543,400 in April 1969. General William Westmoreland's attrition strategy was measured by "body count", and **search and destroy** operations and free-fire zones helped create about 2 million internal refugees in the South by 1967. Yet the communist side started about 90 per cent of large firefights.

More than 1.7 million American men were drafted between 1965 and 1973. College deferments let middle-class men avoid service, and in 1965 African Americans were 11 per cent of the population but 14.1 per cent of combat deaths. Allies came for their own reasons. South Korea sent some 320,000 men over the war, of whom 5,099 died; President Park Chung Hee sought American aid and the alliance. Korean marines were accused of massacres, and estimates of the children born to Korean fathers and Vietnamese mothers range from 1,500 to 30,000, an unknown number of them conceived by rape. Australia sent about 60,000, partly conscripted by a birthday ballot, and about 520 died; Thailand, New Zealand and the Philippines also sent troops, while Britain and Canada declined.

```checkpoint
q: What does the evidence now show about the "second attack" in the Gulf of Tonkin on 4 August 1964?
a*: It never happened; a declassified NSA study found the reports rested on bad intelligence and misrepresented intercepts.
a: It was a large North Vietnamese naval assault that sank an American destroyer.
x: No American ship was sunk, and the 4 August attack was not real.
a: It was carried out by Chinese torpedo boats rather than North Vietnamese ones.
x: The issue is not who attacked; the evidence shows there was no second attack at all.
a: It was a South Vietnamese commando raid misreported as a North Vietnamese attack.
x: South Vietnamese raids preceded the first clash, but the 4 August "attack" itself simply did not occur.
hint: Think of what the NSA study declassified in 2005 concluded.
why: Congress passed a sweeping resolution on the strength of an incident that did not happen, and the raids that provoked the first clash were concealed from it.
---
q: Who drove North Vietnam's strategy from the early 1960s, according to recent research in Vietnamese archives?
a: Ho Chi Minh, acting alone.
x: Ho and other moderates were coerced into accepting Lê Duẩn's offensive strategy in 1963.
a: Ngô Đình Diệm.
x: Diệm was the anti-communist leader of South Vietnam.
a*: Lê Duẩn, with Lê Đức Thọ.
a: Advisers from the Soviet Union.
x: The Soviets supplied arms, but Hanoi's leaders made their own decisions; moderates branded "revisionists" were even arrested from 1967.
hint: Who led the party as First Secretary from 1960?
why: Seeing Hanoi as a set of rival leaders making choices, not a single will embodied in Ho, is central to the Vietnamese-centred turn in the history of the war.
```

## 1968: Tet, Huế and My Lai

On 30–31 January 1968, at the lunar new year, some 77,000 North Vietnamese and Viet Cong troops (85,000–100,000 over all phases) struck more than 100 towns and cities, including Saigon, where a sapper team entered the American Embassy compound. Hanoi hoped for a general uprising and mass defections from the southern army. Neither happened, and communist losses across the 1968 offensives were, by Hanoi's own count, about 45,000 killed. The city of **Huế** was held for 26 days; the battle left about 80 per cent of it in ruins, much of it from American firepower, and communist forces executed civilians and officials. How many is itself contested: estimates run from 2,800 (the bodies recovered from mass graves) to 6,000, while the historian Gareth Porter argued there were only "several hundred" executions.

Militarily a defeat for Hanoi's strategy, Tet was politically an earthquake in Washington. On 27 February Walter Cronkite told CBS viewers that being "mired in stalemate" seemed the only realistic conclusion, and that the way out was to negotiate, "not as victors, but as an honorable people". On 31 March Johnson announced a partial bombing halt and that he would not seek re-election; talks opened in Paris in May, and Hanoi adopted the line of "talking while fighting, fighting while talking".

On 16 March 1968, at Sơn Mỹ in Quảng Ngãi province, American soldiers under Lieutenant William Calley killed between 347 (the US Army's count) and 504 civilians, almost all women, children and old men: the **My Lai massacre**. A helicopter crew led by Hugh Thompson Jr. intervened to stop the killing. The army covered it up until a veteran, Ronald Ridenhour, and the journalist Seymour Hersh exposed it in November 1969; only Calley was convicted, and he served three and a half years under house arrest. My Lai was not unique; a Pentagon working group substantiated 320 incidents. Communist forces also killed systematically: a Pentagon estimate counts 36,000 murders and 58,000 kidnappings by them between 1967 and 1972.

## The War at Home

The phrase "credibility gap" was first applied to Johnson's Vietnam policy in 1965, and grew with every optimistic forecast. Protest grew too: draft-card burnings from 1965; the Quaker Norman Morrison burning himself to death outside the Pentagon, perhaps inspired by Vietnamese Buddhist self-immolations; Muhammad Ali's refusal of the draft; and Martin Luther King Jr.'s warning in 1967 that "if America's soul becomes totally poisoned, part of the autopsy must read 'Vietnam'". On 4 May 1970 the Ohio National Guard killed four students at **Kent State University** during a protest against the invasion of Cambodia; days later police killed two students at Jackson State, a historically Black college, to far less attention. Opinion turned slowly, with a majority calling the war a mistake from August 1968, yet the movement itself stayed unpopular, and historians divide over its influence. The claim that the media "lost the war" is also contested: polls show many Americans still called themselves hawks in early 1968, and casualties and stalemate seem to have mattered more.

## Nixon's Wider War

Richard Nixon both withdrew from the war and widened it. **Vietnamization**, from 1969, brought American troops home while expanding the South Vietnamese army. At the same time B-52s secretly bombed North Vietnamese sanctuaries in **Cambodia**, hidden from all but five members of Congress; after Lon Nol deposed Prince Sihanouk in 1970, American and South Vietnamese troops invaded. American bombing killed an estimated 50,000–150,000 Cambodians. Ben Kiernan and William Shawcross link it to the rise of the Khmer Rouge; others dispute how much weight it bears.

In **Laos**, North Vietnam occupied the east for the Trail, and the CIA ran a "Secret War" with some 30,000 Hmong, Mien and Khmu irregulars under General Vang Pao. The United States dropped about 2 million tons of bombs on Laos, making it the most heavily bombed country per capita in history. On the Trail, much of the repair work fell to the Youth Shock Brigades, many of them young women; at Đồng Lộc ten of them were killed by an American bomb in July 1968, and the site is now a shrine.

In June 1971 the *New York Times* began publishing the **Pentagon Papers**, a secret Defense Department history leaked by Daniel Ellsberg; one memo listed American aims as "70% – To avoid a humiliating U.S. defeat". After Hanoi's Easter Offensive of 1972, and Thiệu's rejection of a draft peace deal that October, Nixon ordered **Linebacker II**, the "Christmas bombing" that Vietnamese call "Điện Biên Phủ in the air".

## Paris and the Fall of Saigon

The **Paris Peace Accords** of 27 January 1973 were negotiated by Henry Kissinger and Lê Đức Thọ and signed by the foreign ministers of the United States, North Vietnam, the NLF's Provisional Revolutionary Government (Nguyễn Thị Bình) and a reluctant Thiệu government. American forces left and prisoners were exchanged, but about 200,000 communist troops stayed in the South. Kissinger and Thọ were awarded the Nobel Peace Prize; Thọ refused it. Fighting went on, and Congress cut aid to Saigon. In March 1975 an attack on Ban Mê Thuột collapsed the Central Highlands; fleeing columns became a "convoy of tears". Thiệu resigned on 21 April, accusing the United States of betrayal. On 29–30 April helicopters lifted more than 7,000 people out of Saigon, and some 130,000–140,000 Vietnamese linked to the Americans or the Republic escaped. On 30 April tanks broke through the gates of the Independence Palace and President Dương Văn Minh surrendered. In 1976 Saigon was renamed Ho Chi Minh City.

## Counting the Dead

The American toll is precise: about 58,220 dead (later counts give 58,281), with an average age of 23. Vietnamese deaths are not, and the figures are part of the war's politics: American "body counts" were inflated and blurred civilians and combatants, and Hanoi long withheld its own. In 1995 the Vietnamese government gave about 1.1 million communist military dead and 2 million civilians, about 3.4 million with southern and allied soldiers. A demographic study by Hirschman, Preston and Vu, also in 1995, estimated 791,000 to 1,141,000 Vietnamese war deaths for 1965–75, most likely 882,000. Overall estimates run from about 970,000 to 3 million Vietnamese dead, including some 254,000 to 313,000 South Vietnamese soldiers, often forgotten in accounts that see only Americans and communists.

The weapons kept killing. More than 7 million tons of bombs fell on Indochina, over three times what the United States dropped in the Second World War. Unexploded ordnance has since killed some 42,000 Vietnamese, according to Vietnam's government, and killed or injured more than 20,000 Laotians. The United States sprayed about 20 million gallons of herbicides, including dioxin-contaminated **Agent Orange**; Vietnam's government says up to 3 million people became ill, figures the United States disputes.

## Aftermath: Camps, Boats and Memory

There was no mass bloodbath, but there was punishment. South Vietnamese soldiers and officials told to report for "re-education" for days or a month stayed years, some more than a decade, doing hard labour amid hunger and disease; at least 200,000–300,000 were held, and some estimates run as high as 500,000. From 1978, as relations with China worsened, ethnic Chinese were targeted and the exodus of the **boat people**, under way since 1975, swelled. Almost 800,000 reached safety between 1975 and 1995. How many died at sea is unknown: the UN refugee agency estimates 200,000–250,000, others up to 400,000, while the journalist Barry Wain suggested in 1981 only 30,000. In Laos the Pathet Lao took power in 1975 and persecuted the Hmong as traitors. In Cambodia the Khmer Rouge took power in April 1975; some 1.5 to 2 million people died under their rule, as the chapter on the Global Cold War and the Arms Race notes, though some estimates are wider. Vietnam ousted them in 1979, and China then attacked Vietnam.

After Lê Duẩn's death in 1986 and with inflation above 700 per cent, Vietnam adopted the *Đổi Mới* market reforms; the United States lifted its embargo in 1994 and normalised relations in 1995. Vietnamese memory has its own silences: Bảo Ninh's novel *The Sorrow of War* (1990), a northern veteran's story of loss, was praised and then restricted, and women veterans were often written out of official histories. In the United States, Ronald Reagan, using the phrase "Vietnam syndrome", in 1980 called the war "a noble cause"; two years earlier about 72 per cent of Americans had called it "fundamentally wrong and immoral". The **Vietnam Veterans Memorial**, dedicated in 1982 and designed by Maya Lin, a Yale undergraduate and the daughter of Chinese immigrants, lists the dead on black granite walls in the order they fell. Critics called it "a black gash of shame and sorrow"; it now draws about 3 million visitors a year.

{{image: Vietnam Veterans Memorial | The Vietnam Veterans Memorial in Washington, designed by Maya Lin and dedicated in 1982, lists the American dead in the order they fell.}}

```checkpoint
q: Why do estimates of Vietnamese deaths in the war range from under a million to more than three million?
a: Because no Vietnamese died before American troops arrived in 1965.
x: Fighting and killing began long before 1965; the estimates differ partly because they cover different periods.
a*: Because they use different methods and periods, American body counts were inflated and blurred civilians and soldiers, and Hanoi long withheld its figures.
a: Because all estimates come from the US Department of Defense.
x: The estimates come from different sources, including the Vietnamese government and demographers.
a: Because the war killed no civilians, only soldiers.
x: Civilian deaths were enormous; disagreement over them is one reason the totals differ.
hint: Compare the Vietnamese government's 1995 figure with the demographic study by Hirschman and colleagues.
why: Death tolls are evidence and also politics; a responsible account gives the range and who produced each figure.
---
q: Which statement about the end of the war in Laos and Cambodia is correct?
a: The Hmong were rewarded by the new Lao government for their wartime service.
x: The Pathet Lao persecuted the Hmong as traitors for fighting with the CIA.
a: Cambodia escaped the war because it was neutral and was never bombed.
x: The United States secretly bombed Cambodia from 1969 and invaded it in 1970.
a: Vietnam and the Khmer Rouge remained close allies after 1975.
x: Vietnam invaded Cambodia in December 1978 and ousted the Khmer Rouge.
a*: The Khmer Rouge took power in April 1975, and some 1.5 to 2 million Cambodians died under their rule.
hint: Think of what happened in Cambodia between 1975 and 1979.
why: The "Vietnam War" was an Indochina war, and its end brought new catastrophes beyond Vietnam's borders.
```

## How Historians Argue

American historians long divided between an "orthodox" view, that the war was unwise and probably unwinnable, and a "revisionist" school, whose most prominent recent statement is Mark Moyar's *Triumph Forsaken* (2006), which argues that South Vietnam was viable and the war was lost through American errors, above all backing Diệm's overthrow. Critics reply that revisionism cannot explain key events. Note the trap: in Cold War historiography "revisionist" means critics who saw the United States as an expansionist power; here it means the opposite, defenders of the war's purpose. Fredrik Logevall argues that escalation was a choice.

The biggest shift has been to put Vietnamese at the centre. Lien-Hang Nguyen's research in Hanoi's archives shows Lê Duẩn and Lê Đức Thọ, not Ho or General Giáp, controlling strategy; Christopher Goscha and Pierre Asselin stress the civil war among Vietnamese and communist violence against rival nationalists; Edward Miller treats Diệm as a nationalist with his own programme rather than a puppet, though Keith Taylor thinks Miller underplays the communist challenge; Tuong Vu and Nu-Anh Tran recover South Vietnamese republicanism. Viet Thanh Nguyen argues that each nation, the United States, Vietnam, Laos, Cambodia and South Korea, remembers its own dead and forgets the others'.

```quote
All wars are fought twice, the first time on the battlefield, the second time in memory.
Viet Thanh Nguyen · Nothing Ever Dies: Vietnam and the Memory of War · 2016
```

## Further exploration

- **Fredrik Logevall, *Embers of War: The Fall of an Empire and the Making of America's Vietnam* (2012).** The French war and how the United States inherited it; winner of the Pulitzer Prize for History.
- **Christopher Goscha, *Vietnam: A New History* (2016).** A Vietnamese-centred history that takes seriously the many competing visions of Vietnam; published in Britain as *The Penguin History of Modern Vietnam*.
- **Edward Miller, *Misalliance: Ngo Dinh Diem, the United States, and the Fate of South Vietnam* (2013).** The American–South Vietnamese alliance as a clash of visions of nation-building.
- **Fredrik Logevall, *Choosing War: The Lost Chance for Peace and the Escalation of War in Vietnam* (1999).** Argues that American escalation was a choice, not an inevitability.
- **Mark Moyar, *Triumph Forsaken: The Vietnam War, 1954–1965* (2006).** The leading "revisionist" account, arguing the war was winnable.
- **Viet Thanh Nguyen, *Nothing Ever Dies: Vietnam and the Memory of War* (2016).** How the war is remembered, and forgotten, in the United States, Vietnam, Laos, Cambodia and South Korea.
- **Bảo Ninh, *The Sorrow of War* (1990).** A North Vietnamese veteran's novel of the war and its dead.$mn_vietnam_master$,
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
  select $mn_vietnam_quiz$[
    {"type": "mcq", "prompt": "What did the 1954 Geneva settlement on Vietnam provide?", "options": ["A provisional military demarcation line at about the 17th parallel, with nationwide elections promised for July 1956 only in an unsigned Final Declaration", "A permanent division of Vietnam into two states, signed by the United States and the State of Vietnam", "Immediate unification of Vietnam under Ho Chi Minh", "A French protectorate over the whole of Vietnam until 1960"], "answerIndex": 0, "explanation": "The ceasefire, signed only by the French and Viet Minh military commands, drew a provisional line at about the 17th parallel; elections were promised only in the unsigned Final Declaration, which neither the US nor the State of Vietnam signed, and they were never held.", "id": "q1"},
    {"type": "mcq", "prompt": "Who co-founded the National Liberation Front, became its deputy commander and led the 1960 Bến Tre uprising?", "options": ["Madame Nhu", "Nguyễn Thị Bình", "Nguyễn Thị Định", "Đặng Thùy Trâm"], "answerIndex": 2, "explanation": "Nguyễn Thị Định, a peasant-born veteran from Bến Tre, co-founded the NLF, was its deputy commander and led the all-female 'Long-Haired Army'. Nguyễn Thị Bình signed the Paris Accords; Madame Nhu was Diệm's sister-in-law; Đặng Thùy Trâm was a doctor whose diary was published in 2005.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is the Tet Offensive of 1968 often described as both a military defeat and a political earthquake?", "options": ["It captured Saigon permanently but was condemned by China", "The hoped-for general uprising and army defections did not happen and communist losses were about 45,000 killed, yet it shook American confidence and led Johnson to halt part of the bombing and not seek re-election", "It was an American offensive that failed and forced US withdrawal in 1968", "It ended in a ceasefire signed in Paris in March 1968"], "answerIndex": 1, "explanation": "Hanoi's aims of a general uprising and mass defections failed, at heavy cost, but Tet followed official optimism; Cronkite spoke of stalemate, and on 31 March 1968 Johnson announced a partial bombing halt and that he would not run again.", "id": "q3"},
    {"type": "mcq", "prompt": "In the historiography of the Vietnam War, what does the 'revisionist' school argue?", "options": ["That the United States was an expansionist empire whose leaders exaggerated the communist threat", "That the war was unwise and unwinnable from the start", "That the Gulf of Tonkin incidents never happened at all", "That South Vietnam was viable and the war was lost through American errors, notably backing Diệm's overthrow in 1963"], "answerIndex": 3, "explanation": "Vietnam War revisionists such as Mark Moyar (Triumph Forsaken, 2006) defend the war's purpose and argue it was winnable; this is the opposite of 'revisionism' in Cold War historiography, where the term denotes critics of American expansionism. The 'unwise and unwinnable' view is the orthodox one.", "id": "q4"},
    {"type": "open", "prompt": "Why are the numbers of Vietnamese war dead so disputed? Use at least two estimates and say who produced them.", "rubric": "A good answer explains that American body counts were inflated and blurred civilians and combatants, and that Hanoi long withheld its figures; that estimates cover different periods and use different methods. It cites figures with their sources: the Vietnamese government (1995) gave about 1.1 million communist military dead and 2 million civilians (about 3.4 million with southern and allied soldiers); the demographic study by Hirschman, Preston and Vu (1995) estimated 791,000–1,141,000 deaths for 1965–75, most likely 882,000; overall estimates run from about 970,000 to 3 million. Strong answers note that South Vietnamese soldiers (some 254,000–313,000 dead) are often forgotten, and may compare other disputed figures such as Huế (2,800–6,000 versus Gareth Porter's 'several hundred') or boat-people deaths at sea (UNHCR 200,000–250,000, others up to 400,000, Barry Wain 30,000).", "id": "q5"},
    {"type": "open", "prompt": "Was the Vietnam War an American war, a Vietnamese civil war, or a regional Indochinese war? Argue your case using evidence from the chapter.", "rubric": "A good answer recognises that the war was several wars at once (national liberation, civil war, Cold War proxy war) and weighs evidence. American dimension: Gulf of Tonkin Resolution, Rolling Thunder, over 540,000 troops at peak, the draft, about 58,000 American dead. Civil war: Viet Minh killing of rival nationalists from 1945; up to a million northerners moving south in 1954; Diệm's Republic and its Personalism; the NLF and Hanoi's direction of it; some 254,000–313,000 South Vietnamese soldiers killed; re-education camps and boat people after 1975. Regional and international: the Ho Chi Minh Trail through Laos and Cambodia, the CIA's Secret War with Hmong irregulars, the bombing of Cambodia and Laos, the Khmer Rouge (1.5–2 million dead), Chinese and Soviet aid, South Korean and Australian troops. Strong answers mention historians such as Lien-Hang Nguyen, Goscha, Miller or Viet Thanh Nguyen and reach a reasoned judgement.", "id": "q6"}
  ]$mn_vietnam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-vietnam-war-the-american-war-in-vietnam', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
