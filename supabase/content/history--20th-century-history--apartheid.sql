-- Apartheid and Its End — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/apartheid-and-its-end @ research/advanced/read.
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
    'history/20th-century-history/apartheid-and-its-end',
    'research',
    'advanced',
    'read',
    $mn_apartheid_master$> **A state built on race, and the people who brought it down.** After 1948 the National Party turned older habits of segregation into apartheid, a system that classified every South African by race and decided where they could live, work, study and marry. This chapter traces it from its colonial roots to its end, but above all it follows those who resisted: the ANC and its allies, the women who marched on Pretoria, the students of Soweto, the workers of Durban, and Coloured and Indian South Africans. It covers Sharpeville and the turn to arms, Robben Island, Black Consciousness, sanctions and the regional war, the township revolt, the violent negotiations after Mandela's release, the 1994 election, the Truth and Reconciliation Commission, and the debates over what apartheid was for and what ended it.

## Roots of Segregation

"Apartheid" is Afrikaans for "separateness"; the word is first recorded in 1929. The practices were far older. In 1797 officials at Swellendam and Graaff-Reinet required every Khoikhoi person moving about the country to carry a pass. At the Vereeniging peace talks of 1902 the negotiators accepted "the just predominance of the white race" as a condition of the Boer republics joining the Empire, and the Union of South Africa, created in 1910, barred Black people from sitting in parliament. As the chapter on the British Empire describes, the Natives Land Act of 1913 barred land sales between Black and white South Africans and left Africans reserves of about 7 per cent of the land (with a promise in 1936 to raise it to about 13 per cent), and Sol Plaatje, first General Secretary of the South African Native National Congress, the body renamed the African National Congress (ANC) in the 1920s, wrote its bitter epitaph. One of the few women in the early Congress was **Charlotte Maxeke**, the first Black South African woman to graduate from a university, who founded the Bantu Women's League in 1918 out of the campaigns against passes. In 1936 African voters were removed from the Cape's common roll.

Indian South Africans fought their own battles. Gandhi helped found the **Natal Indian Congress** in 1894 and first adopted *satyagraha*, non-violent resistance, in Johannesburg in 1906, though the historians Ashwin Desai and Goolam Vahed show that he kept Indian grievances separate from Africans' and sometimes disparaged Africans. In 1946, when Smuts's government restricted Indian land purchase and occupation to designated areas (the "Ghetto Act"), the Natal Indian Congress under Monty Naicker began two years of passive resistance, and India took the issue to the first UN General Assembly.

## 1948 and the Apartheid Laws

The general election of 26 May 1948 was decided by an almost entirely white electorate; whites were roughly a fifth of the population. The United Party won about 49 per cent of the votes, eleven points more than D. F. Malan's Herenigde Nasionale Party, but rural seats were over-weighted, and Malan and his allies won 79 seats to 71.

The new government legislated at speed, banning mixed marriages in 1949. The **Population Registration Act** of 1950 classified everyone as White, Coloured or Native (Black), with Indians later a subgroup treated as a separate group; boards decided disputed cases, sometimes with the "pencil test", in which a pencil was pushed into a person's hair and its sticking or falling decided whether they were Black or Coloured. The Suppression of Communism Act defined communism so broadly that it could be used against any opponent. To remove Coloured voters from the Cape's common roll despite the Appeal Court, the government packed the court and the Senate. **Hendrik Verwoerd**, Minister of Native Affairs from 1950 and prime minister from 1958 until he was stabbed to death in parliament in 1966, called the system "separate development".

Four pillars held it up. The **pass laws**, an internal passport system for controlling movement and allocating migrant labour, meant that from 1952 no African could stay in a town longer than 72 hours without a permit; the hated pass book was called the *dompas*. The **Group Areas Act** of 1950 zoned the cities by race. In February 1955, under a separate removals law, 2,000 police began moving the families of Sophiatown, a Johannesburg cultural hub, to Soweto; the suburb was rebuilt for whites as Triomf, "Triumph". In Cape Town, District Six was declared white in 1966 and more than 60,000 people, mostly Coloured, were moved to the Cape Flats; only places of worship were left standing. Nearly 600,000 Coloured, Indian and Chinese people were moved under the Act, and an estimated 3.5 million people in all were forcibly removed between 1960 and 1983.

The **Bantu Education Act** of 1953 put African schooling under the state. Verwoerd told the Senate in 1954: "There is no place for [the Bantu] in the European community above the level of certain forms of labour", and he is widely quoted as asking: "What is the use of teaching the Bantu child mathematics when it cannot use it in practice?" In 1975–76 the state spent R644 on each white pupil, R139 on each Coloured, R189 on each Indian and R42 on each Black pupil. Finally there were the **homelands**: ten territories on 13 per cent of the land, each meant to be a "nation" for one African people. Four were declared "independent" between 1976 and 1981, stripping their people of South African citizenship; no other country recognised them. Taken to its logical conclusion, the minister Connie Mulder said in 1978, the policy meant "there will be not one black man with South African citizenship". Yet in 1986 only about 39 per cent of Black South Africans lived in the homelands.

## The Congress Movement and the 1950s

The ANC answered with mass action. Its Youth League, founded in 1944 by Sisulu, Mandela, Oliver Tambo and others, took control in 1949. On 26 June 1952 the ANC and the South African Indian Congress launched the **Defiance Campaign against Unjust Laws**: more than 8,000 volunteers broke apartheid laws openly, entering "whites only" facilities and refusing to defend themselves in court. ANC membership rose to about 100,000. Its leader from 1952, **Albert Luthuli**, a chief deposed for refusing to leave the ANC, built a multiracial Congress Alliance and received the 1960 Nobel Peace Prize; banned repeatedly, he died in 1967; a reopened inquest ruled in 2025 that he had been killed by police, not struck by a train as first claimed.

The Alliance offered a vision of another country. Fifty thousand volunteers collected "freedom demands", and on 26 June 1955 about 3,000 delegates at Kliptown adopted the **Freedom Charter**.

```quote
We, the People of South Africa, declare for all our country and the world to know: that South Africa belongs to all who live in it, black and white, and that no government can justly claim authority unless it is based on the will of all the people
Congress of the People · The Freedom Charter · 1955
```

Women were at the front, as the state began extending passes to them. On 9 August 1956 the Federation of South African Women led about 20,000 women of all races to the Union Buildings in Pretoria with thousands of petitions for the prime minister, J. G. Strijdom. They were led by **Lilian Ngoyi**, a garment worker and the first woman on the ANC's national executive, with Helen Joseph, Rahima Moosa and Sophia Williams-De Bruyn. "For to us, an insult to African women is an insult to all women," the petition said. The women stood for thirty minutes in silence and then sang *wathint' abafazi, wathint' imbokodo*, "you strike the women, you strike a rock". The day is now National Women's Day. "Freedom does not come walking towards you," Ngoyi said in 1961; "it must be won." The state's reply was the **Treason Trial**: 156 leaders of all races were charged from December 1956; charges against most were dropped, and the last 28 were acquitted in 1961.

## Sharpeville and the Turn to Arms

Not everyone accepted that the land "belongs to all who live in it". In 1959 Africanists led by **Robert Sobukwe** formed the Pan Africanist Congress (PAC), and on 21 March 1960 it called on people to leave their passes at home and demand arrest. At **Sharpeville** police fired on a crowd of at least 5,000 without warning, 1,344 rounds in about two minutes; many victims were shot in the back. The official toll was 69 dead and 180 wounded; newer research counts at least 91 dead and at least 238 wounded. A state of emergency followed, more than 18,000 people were detained, and in April 1960 the ANC and PAC were banned. Sobukwe was later held on Robben Island under a law written so that his detention could be renewed indefinitely.

With lawful protest closed off, Mandela, Sisulu, Joe Slovo and others founded **Umkhonto weSizwe** (MK) in 1961. Its first attacks, on 16 December 1961, were sabotage aimed at installations, not people: "The time comes in the life of any nation when there remain only two choices – submit or fight," its manifesto declared. The PAC formed its own armed wing, Poqo. Mandela was captured in 1962, and at the **Rivonia Trial**, where the accused faced a possible death sentence, he ended a three-hour statement from the dock with these words:

```quote
I have cherished the ideal of a democratic and free society in which all persons live together in harmony and with equal opportunities. It is an ideal which I hope to live for and to achieve. But if needs be, it is an ideal for which I am prepared to die.
Nelson Mandela · Statement at the Rivonia Trial · 1964
```

In June 1964 he and seven comrades, among them Sisulu, Govan Mbeki, Ahmed Kathrada and Denis Goldberg, were sentenced to life imprisonment.

## Robben Island

Robben Island, in Table Bay, held political prisoners from 1961 to 1991. Mandela spent eighteen years there, breaking rock in a lime quarry whose glare damaged his eyes; as a Class D prisoner he was allowed one visit and one letter every six months. He was moved to Pollsmoor prison in 1982, and in 1985 P. W. Botha offered to free him if he rejected violence. His daughter Zindzi read out his reply: "What freedom am I being offered while the organisation of the people remains banned? Only free men can negotiate. A prisoner cannot enter into contracts." From 1987 he held secret talks with the Justice Minister, Kobie Coetsee. In all he spent 27 years in prison.

```checkpoint
q: What did the Defiance Campaign of 1952 ask its volunteers to do?
a*: Break apartheid laws openly and non-violently, entering "whites only" facilities and accepting arrest.
a: Attack government installations with explosives.
x: The ANC turned to sabotage only with Umkhonto weSizwe in December 1961, after it was banned.
a: Leave their passes at home and march on police stations.
x: That was the PAC's anti-pass campaign of 21 March 1960, which led to Sharpeville.
a: Vote for the United Party in the general election.
x: Black South Africans had no such vote; the 1948 electorate was almost entirely white.
hint: Think of the ANC's alliance with the South African Indian Congress and Gandhi's legacy.
why: The campaign made the ANC a mass movement, its membership rising to about 100,000.
---
q: Why are the casualty figures for Sharpeville given as a range?
a: Because no one was killed and the figures were invented.
x: Police fired 1,344 rounds into the crowd; the dispute is over how many died, not whether anyone did.
a: Because the PAC refused to count its dead.
x: The difference lies between the official toll and later research, not a PAC refusal.
a*: Because the official toll of 69 dead and 180 wounded has been revised by newer research to at least 91 dead and 238 wounded.
a: Because the shooting went on for several days.
x: The firing lasted about two minutes.
hint: Compare the government's count with later research.
why: Official figures under apartheid could understate the state's violence, so historians treat them with caution.
```

## Black Consciousness and Soweto

In 1968 **Steve Biko** led Black students out of the white-led national student union to found the South African Students' Organisation. Black Consciousness, influenced by Frantz Fanon, defined "Black" to include Africans, Coloureds and Indians and put mental liberation first: "the most potent weapon in the hands of the oppressor is the mind of the oppressed". Its cry was "Black man, you are on your own". The government banned Biko in 1973.

In 1974 the government decreed that Afrikaans be used alongside English in Black schools, including for mathematics. Pupils went on strike, and on **16 June 1976** students in Soweto marched in protest; estimates of their number range from 3,000 to 20,000. Police opened fire. Among the first killed were Hastings Ndlovu, aged 15, and Hector Pieterson, aged 12.

{{image: Soweto uprising | Hector Pieterson, aged 12, carried by Mbuyisa Makhubo with his sister Antoinette beside them, Soweto, 16 June 1976. Sam Nzima's photograph became the icon of the uprising.}}

The death toll is still disputed. The official count for the first day was 23 and the figure usually given is 176, but the government's own Cillié Commission counted 575 dead by February 1977, and *The Times* reported more than 700 by the end of 1976. Thousands of young people left for exile and MK's camps abroad. Biko did not survive the backlash. Arrested in August 1977 and beaten under interrogation, he was driven naked and manacled more than a thousand kilometres to Pretoria, and died alone in a cell on 12 September. The police minister, Jimmy Kruger, said it "leaves me cold" (*dit laat my koud*). In October every Black Consciousness organisation was banned.

## Workers, the UDF and the Township Revolt

Labour was the other new force. From January 1973 about 60,000 Black workers at more than 100 firms in **Durban** struck illegally, and by the year's end 100,000 Black and Indian workers had taken action. Black unions were legalised in 1979, and in December 1985 they founded the **Congress of South African Trade Unions** (COSATU). In May 1987 more than 2.5 million workers stayed away, and about 200,000 mineworkers struck for three weeks.

P. W. Botha, prime minister from 1978, told whites to "adapt or die". His 1983 constitution created a **Tricameral Parliament** with houses for whites, Coloureds and Indians and none for Africans; its first elections were largely boycotted. On 20 August 1983 delegates from 575 organisations launched the **United Democratic Front** (UDF) at Mitchells Plain, near Cape Town, under the slogan "UDF Unites, Apartheid Divides"; one of its three presidents was Albertina Sisulu, and in 1987 its women formed their own congress to protest their "second-class status". In September 1984 a rent protest in the Vaal Triangle began the **township uprisings**, aimed at the Black councillors who ran the townships for the state. The ANC called for the townships to be made "ungovernable". The army moved in, states of emergency followed, and by 1988 about 30,000 people had been detained without trial. The revolt had its own brutality. Suspected collaborators were killed by "necklacing", which the ANC's executive condemned, and in 1986 Winnie Madikizela-Mandela, who had herself endured 491 days in detention, told a rally: "With our boxes of matches and our necklaces we shall liberate this country." The TRC later held her "politically and morally accountable" for abuses by her bodyguards.

## Sanctions and the Regional War

The international campaign began in London in 1959 as a boycott, launched after an appeal by Luthuli, and became the **Anti-Apartheid Movement** after Sharpeville. "We are just asking you to withdraw your support from apartheid by not buying South African goods," said Tanzania's Julius Nyerere. The UN General Assembly called for sanctions in 1962, and in 1977 the Security Council made an arms embargo mandatory. Reagan and Thatcher preferred "constructive engagement" and both governments labelled the ANC "terrorist", but divestment campaigns spread, and in 1986 the US Congress passed the **Comprehensive Anti-Apartheid Act** over Reagan's veto. When Botha's 1985 "Rubicon" speech refused real change, the rand collapsed and Pretoria declared a debt standstill. Not every opponent of apartheid agreed with sanctions: the Inkatha leader Mangosuthu Buthelezi argued that Black South Africans would bear their cost.

The neighbouring **Frontline States** sheltered the ANC, whose headquarters were in Lusaka, even though they depended on South Africa economically, and Pretoria raided them. It also fought SWAPO's guerrillas in a long war over Namibia, which became entangled with Angola's civil war. At **Cuito Cuanavale** in 1987–88, often called the largest conventional battle in Africa since the Second World War, South Africa and UNITA first repulsed an Angolan government offensive, then failed in repeated assaults on the Cuito Cuanavale defences held with Cuban reinforcements. Both sides claimed victory: Fidel Castro called it "overwhelming" and Mandela "a turning point for the liberation of our continent and my people", while the analyst Vanneman saw no decisive victory and Hampson argued that Castro exploited it for propaganda. The New York Accords of 1988 then brought Namibian independence, as the chapter on the global Cold War describes.

## Release and a Violent Negotiation

After Botha's stroke in 1989, **F. W. de Klerk** moved fast. On 2 February 1990 he unbanned the ANC, the PAC and the Communist Party, and on 11 February Mandela walked free. De Klerk later said the collapse of communism in Eastern Europe had removed his fear of the ANC, and that "internationally we were teetering on the edge of the abyss". In 1991 the Land Acts, the Group Areas Act and the Population Registration Act were repealed.

The road to the election was the bloodiest phase of the whole conflict. The TRC counted about 7,000 political deaths between 1948 and 1989 and about 14,000 between 1990 and 1994. It attributed more deaths between 1960 and 1994 to Buthelezi's Inkatha Freedom Party (4,500), whose militia had received army training, than to the security forces (2,700) or the ANC (1,300). At **Boipatong** in June 1992 about 45 people were killed by Inkatha supporters, and the ANC walked out of the talks, alleging police involvement. The evidence still conflicts: a Goldstone Commission inquiry and a 1993 trial found no police role, the TRC in 1998 found police involvement, and its Amnesty Committee in 2000 found none. The TRC found little evidence of a centrally directed "third force", but concluded that a network of security operatives, often with right-wing groups or parts of Inkatha, was involved in actions that "could be construed as fomenting violence". Then, in April 1993, a Polish immigrant shot dead **Chris Hani**, the Communist Party leader and former MK chief of staff. Mandela went on television: "A white man, full of prejudice and hate, came to our country and committed a deed so foul that our whole nation now teeters on the brink of disaster. A white woman, of Afrikaner origin, risked her life so that we may know, and bring to justice, this assassin." The election date was fixed soon after. Joe Slovo's "sunset clause" proposals led the ANC to accept a five-year government of national unity, and Mandela and de Klerk shared the 1993 Nobel Peace Prize.

## The 1994 Election

South Africans of every race voted on 26–29 April 1994; 27 April is now Freedom Day. The ANC won 62.65 per cent, the National Party 20.39 per cent and Inkatha, which joined at the last minute, 10.54 per cent. On 10 May Mandela was inaugurated at the Union Buildings, where the women had marched in 1956: "Never, never and never again shall it be that this beautiful land will again experience the oppression of one by another …" The final constitution was signed at Sharpeville in 1996.

## The Truth and Reconciliation Commission

The **Truth and Reconciliation Commission** (TRC), chaired by Archbishop Desmond Tutu, began hearings in 1996. Instead of trials, it offered amnesty for politically motivated crimes in return for full disclosure. It identified more than 19,000 victims; women gave more than half the statements, mostly about relatives. Of 7,111 amnesty applications, 849 were granted. All sides appeared, and the ANC too was found to have committed gross violations, including torture and executions in its camps. Botha refused to appear.

Supporters praised the TRC as a restorative alternative to Nuremberg-style trials; critics were many. A 1998 study by the Centre for the Study of Violence and Reconciliation and the Khulumani Support Group found that most victims felt it favoured perpetrators, and that justice was a prerequisite for reconciliation. The Biko family called it a "vehicle for political expediency". Madeleine Fullard, Mamphela Ramphele and Beth Goldblatt noted that its mandate left out systemic crimes such as forced removals and pass arrests. Mahmood Mamdani argued that by focusing on perpetrators and victims instead of the system's beneficiaries, it extended impunity to most of those responsible. Reparations came late and were smaller than recommended.

## Debates: What Was Apartheid For, and What Ended It?

**Capitalism and apartheid.** In the 1970s "revisionists" such as Harold Wolpe, Martin Legassick and Frederick Johnstone argued that apartheid served capital. Wolpe's 1972 article held that migrant workers could be paid below the cost of keeping their families because the rural reserves bore that cost; Dan O'Meara called it "probably the most influential and widely-cited theoretical text ever written on South Africa". Liberals, notably Merle Lipton in *Capitalism and Apartheid* (1985), replied that apartheid's labour controls increasingly hurt business and that the two were separable. Others stress ideology: Afrikaner nationalism, the Broederbond, and Saul Dubow's studies of the origins of segregation (1919–36) and of "scientific racism".

**What ended apartheid?** Historians weigh internal mass resistance, sanctions and capital flight, military stalemate in Angola, the end of the Cold War, a shrinking white share of the population, and the leadership of Mandela and de Klerk. The role of sanctions remains debated. From the left, many argue that the ANC conceded too much, dropping nationalisation and accepting the sunset clauses.

**What changed?** Democracy brought expanded housing, electricity and water, and a new Black middle class. But in 2022 the World Bank ranked South Africa the most unequal of 164 countries, and within five years of 1994 less than 2 per cent of land had changed hands, against a target of 30 per cent.

```checkpoint
q: What did Harold Wolpe argue in his influential 1972 article?
a: That apartheid was purely religious in origin and had no economic function.
x: Wolpe's argument was economic: he saw apartheid as serving capitalism.
a*: That migrant workers could be paid below the cost of keeping their families because the reserves bore that cost, so apartheid served capital.
a: That sanctions alone ended apartheid.
x: Wolpe wrote about apartheid's economic logic in 1972, long before sanctions bit.
a: That apartheid's labour controls hurt business and could be separated from capitalism.
x: That was the liberal reply, made most fully by Merle Lipton in 1985.
hint: Think of the "revisionist" side of the capitalism-and-apartheid debate.
why: Whether apartheid served or hindered capitalism shapes how historians explain both its rise and its fall.
---
q: Which of these is a criticism made of the Truth and Reconciliation Commission?
a: That it refused to hear victims.
x: It identified more than 19,000 victims, and women gave more than half the statements.
a: That it investigated only the ANC.
x: All sides appeared, and it found gross violations by the state, the ANC and others.
a: That it sentenced too many people to death.
x: The TRC was not a court and passed no sentences; it granted or refused amnesty.
a*: That by focusing on perpetrators and victims it ignored the system's beneficiaries and extended impunity to most of those responsible.
hint: Think of Mahmood Mamdani's argument.
why: Critics argue that reconciliation without justice and reparation left apartheid's deeper legacy untouched.
```

## Further exploration

- **Saul Dubow, *Apartheid, 1948–1994* (2014).** A concise, up-to-date synthesis of the whole period.
- **Nancy L. Clark and William H. Worger, *South Africa: The Rise and Fall of Apartheid* (2004).** A short textbook with key documents.
- **Dan O'Meara, *Forty Lost Years: The Apartheid State and the Politics of the National Party, 1948–1994* (1996).** The regime seen from inside.
- **Nelson Mandela, *Long Walk to Freedom* (1994).** The autobiography, begun as a manuscript in prison.
- **Piero Gleijeses, *Visions of Freedom: Havana, Washington, Pretoria, and the Struggle for Southern Africa, 1976–1991* (2013).** The regional war and Cuito Cuanavale from Cuban archives.
- **Jacob Dlamini, *Native Nostalgia* (2009).** A Black South African historian on township life under apartheid, against simplistic memory.
- **Antjie Krog, *Country of My Skull* (1998).** A journalist's account of the TRC hearings.$mn_apartheid_master$,
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
  select $mn_apartheid_quiz$[
    {"type": "mcq", "prompt": "What did the Population Registration Act of 1950 do?", "options": ["It classified every South African by race, as White, Coloured or Native (Black), with Indians later treated as a separate group", "It gave Black South Africans the vote on a separate roll", "It abolished the pass laws", "It created the Truth and Reconciliation Commission"], "answerIndex": 0, "explanation": "The Act classified everyone by race, with boards deciding disputed cases, sometimes by the 'pencil test'; the classification underpinned every other apartheid law.", "id": "q1"},
    {"type": "mcq", "prompt": "Who led the Women's March of 9 August 1956 to the Union Buildings in Pretoria?", "options": ["Winnie Madikizela-Mandela and Albertina Sisulu", "Charlotte Maxeke and Sol Plaatje", "Lilian Ngoyi, Helen Joseph, Rahima Moosa and Sophia Williams-De Bruyn", "Desmond Tutu and Allan Boesak"], "answerIndex": 2, "explanation": "About 20,000 women of all races, organised by the Federation of South African Women, delivered petitions for Prime Minister Strijdom; 9 August is now National Women's Day.", "id": "q2"},
    {"type": "mcq", "prompt": "What triggered the Soweto uprising of 16 June 1976?", "options": ["The arrest of Nelson Mandela", "A decree requiring Afrikaans to be used alongside English in Black schools", "The death of Steve Biko", "The creation of the Tricameral Parliament"], "answerIndex": 1, "explanation": "The 1974 Afrikaans Medium Decree required Afrikaans for subjects such as mathematics; pupils struck and then marched, and police opened fire. Biko died in 1977 and the Tricameral Parliament came in 1983–84.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the evidence show about police involvement in the Boipatong massacre of June 1992?", "options": ["Every inquiry agreed that police planned the massacre", "Every inquiry agreed that police played no role", "No inquiry was ever held", "The findings conflict: a Goldstone inquiry and a 1993 trial found no police role, the TRC (1998) found police involvement, and the TRC Amnesty Committee (2000) found none"], "answerIndex": 3, "explanation": "Boipatong, in which about 45 people were killed by Inkatha supporters, remains contested, part of the wider debate over a state-fomented 'third force'.", "id": "q4"},
    {"type": "open", "prompt": "Historians disagree about what ended apartheid. Using at least three factors from the chapter, explain which you think mattered most and why.", "rubric": "Strong answers weigh several factors with evidence: internal mass resistance (the Durban strikes, COSATU's 1987 stay-away of over 2.5 million, the UDF and the township revolt from 1984); sanctions and capital flight (the 1985 Rubicon speech, rand collapse and debt standstill, the US Comprehensive Anti-Apartheid Act of 1986, while noting that sanctions' role is debated and some, such as Buthelezi, opposed them); the regional war and Cuito Cuanavale (with the dispute between 'victory' and 'stalemate' readings); the end of the Cold War (de Klerk's own explanation); demographic change; and the leadership of Mandela and de Klerk. Credit answers that recognise the factors interacted and that the ANC's compromises are themselves debated.", "id": "q5"},
    {"type": "open", "prompt": "Was the Truth and Reconciliation Commission a success? Set out the case for it and the main criticisms, naming at least two critics.", "rubric": "For: a restorative alternative to Nuremberg-style trials; amnesty only for full disclosure of politically motivated crimes; it identified over 19,000 victims, heard all sides and found violations by the state, the ANC and others; women gave more than half the statements. Against: the 1998 CSVR/Khulumani study found most victims felt it favoured perpetrators; the Biko family called it a 'vehicle for political expediency'; Fullard, Ramphele and Goldblatt noted its mandate excluded systemic crimes such as forced removals and pass arrests; Mamdani argued it focused on perpetrators rather than beneficiaries and extended impunity; reparations were late and smaller than recommended. Good answers reach a balanced judgement.", "id": "q6"}
  ]$mn_apartheid_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/apartheid-and-its-end', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
