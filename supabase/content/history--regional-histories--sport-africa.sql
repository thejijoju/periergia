-- History of Sport in Africa — canonical master article, co-written and human-reviewed.
-- history/regional-histories/africa/history-of-sport-in-africa @ research/advanced/read.
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
    'history/regional-histories/africa/history-of-sport-in-africa',
    'research',
    'advanced',
    'read',
    $mn_sportafrica_master$> **Play, power and the postcolony.** Africans wrestled, fought with sticks, paraded on horseback and played count-and-capture board games long before Europeans brought football and athletics. This chapter follows those older cultures; colonial sport as both discipline and something Africans made their own; the founding of African football's own confederation and cup in 1957; the campaign, begun by Black South Africans, that isolated apartheid sport, and the argument over 1995; the runners, from Abebe Bikila to East Africa's distance dynasty; African women athletes and the case of Caster Semenya; the 2010 World Cup; and the "muscle drain" of players to Europe.

## Before the Ball

Senegalese wrestling, *laamb* in Wolof and *njom* in Serer, is a folk tradition of the Serer people and now a national sport in Senegal and parts of The Gambia. Among the Serer it prepared warrior classes for war and served as an initiation rite; *njom* comes from *jom*, "heart" or "honour". Tradition remembers one of the earliest wrestlers by name, Boukar Djilak Faye of the fourteenth-century Kingdom of Sine. Bouts were accompanied by the chants of young Serer women and the praises of griots, and Wolof wrestlers today perform the *bàkk*, a self-praise boast rooted in griot praise-singing. Its stars are now national celebrities, and Dakar's national arena holds 20,000 people.

In Sudan's Nuba Mountains, Nuba wrestlers aim simply to throw the opponent to the ground, and bouts are often accompanied by stick-fighting tournaments that mimic spear-and-shield combat. Stick-fighting runs across the continent. Nguni herdboys in South Africa learned *dlala 'nduku*, "playing sticks", with one stick to attack and one to defend; Nelson Mandela is listed among its practitioners. Among the Surma (Suri) of Ethiopia, *donga* stick-fighting is a way for young men to show themselves to prospective brides, and Egypt's *tahtib* is thought to descend from ancient stick-fighting depicted at Abusir. Hausa *dambe* boxers bind their striking fist, "the spear", in cloth and cord, and once travelled to farm villages at harvest festivals, where betting on feats of strength was common.

Board games have a long African history too. Pottery and rock-cut boards for mancala, the family of "count-and-capture" games, have been found at Aksumite sites in Eritrea and Ethiopia and dated to the sixth and seventh centuries AD; the chapter on Kush and Aksum describes the kingdom that made them. Oware, "widely believed" to be Asante in origin, is played with 48 seeds on two rows of six "houses", on boards carved from wood or scooped out of the ground, and goes by many names, among them *ayò* among the Yoruba and *awalé* in Côte d'Ivoire. *Bao* is played across East Africa, and enslaved Africans carried such games across the Atlantic. When Stewart Culin titled his 1896 study *Mancala, the National Game of Africa*, he folded this variety into a single "national game" for a continent of many nations, an outsider's framing.

In the Sahel, power rode on horseback. At the Durbar festivals of the Hausa emirates of northern Nigeria, held at the end of Ramadan and at Eid al-Adha, the emir's horsemen parade and nobles reaffirm their loyalty. Robin Law's *The Horse in West African History* (1980) shows how cavalry and the horse as a mark of status shaped the states described in the chapter on the History of Sub-Saharan Africa to 1860, and how horse culture declined in the twentieth century as political systems built on warfare and slavery ended.

## Empire's Games

Europeans brought football to Africa from the 1860s, and settlers and soldiers founded the first clubs in South Africa, Algeria and Egypt. Egypt was the first African team at the Olympic football tournament, in 1920, and at a World Cup, in 1934.

Colonial rulers used sport as discipline. John Bale and Joe Sang, in their Kenyan–British study *Kenyan Running* (1996), argue that colonial administrators and schoolteachers imposed modern running "as a means of social control". The Zambian historian Hikabwa Chipande has shown football in Zambia, including on the Copperbelt mines, being used for social control and propaganda. Under the Italian occupation of Ethiopia football was racially segregated. Empires also feared what sport might unite: when pan-African games were proposed in the 1920s, colonial powers suspected they might encourage Africans to assert independence, and the planned games failed. The first All-Africa Games took place only in 1965, in Brazzaville.

Yet Africans did not simply receive the colonisers' games; they remade them. Phyllis Martin's *Leisure and Society in Colonial Brazzaville* (1995), with its chapter "Football is king", shows football and music building social networks, humanising daily life and forging new identities; by the 1930s, Hikabwa Chipande notes, drawing on Martin, the authorities had to take the football of Brazzaville's African townships seriously because it was so popular. In Zanzibar, Laura Fair argues in *Pastimes and Politics* (2001) that football, *taarab* music and dress were not merely reflections of social change but tools with which former slaves and colonised people remade themselves and their society. Historians thus divide between readings that stress imposition and control (Bale and Sang) and readings that stress appropriation, new masculinities and political identities (Martin, Fair, and Peter Alegi's *African Soccerscapes*). Chipande's work suggests the two need not exclude each other: his study of the Copperbelt treats football as both a tool of mine and colonial authorities and a force for social change.

Talent also flowed out before independence: Eusébio, born in Lourenço Marques (now Maputo) in Portuguese Mozambique, won the Ballon d'Or in 1965 playing for Benfica and was top scorer at the 1966 World Cup for Portugal.

## Football and Freedom

Sport became a weapon of liberation. On 13 April 1958 ten Algerian professionals based in France, among them Rachid Mekhloufi of Saint-Étienne, who had been in France's provisional World Cup squad, secretly left for Tunis, home of the Algerian provisional government. FIFA, at France's request, refused to recognise this **FLN team**, but it toured anyway, playing about 80 matches across Europe, the Middle East, Asia and Africa. It aimed to deny France key players, publicise the independence struggle and show the FLN's support among Algerians, and it disbanded in 1962, the year of independence.

African football also built its own institutions. On 8 February 1957, in Khartoum, Egypt, Sudan, Ethiopia and South Africa founded the **Confederation of African Football** (CAF); its statutes drew on drafts by Ethiopia's Yidnekatchew Tessema and Sudan's Abdel Rahim Shaddad. Two days later Khartoum hosted the first **African Cup of Nations**, three years before the first European Nations Cup. South Africa was disqualified for refusing to field a multiracial team, so only three teams played, and Egypt beat Ethiopia 4–0 in the final. CAF's own history, written largely from Tessema's point of view, calls it the first international organisation to dare say no to apartheid; that is a proud claim rather than an established fact, but the exclusion was real. Tessema led CAF from 1972 to 1987.

As the chapter on Decolonization describes, Ghana became independent in 1957 and seventeen colonies followed in 1960 alone. Football helped make the new nations. In September 1957 Ohene Djan, a politician of Kwame Nkrumah's Convention People's Party, became general secretary of a new national football association and is credited with founding the **Black Stars**, named after the star on Ghana's flag. Ghana won the Cup of Nations in 1963 and 1965. The historian Paul Darby analyses this as Nkrumah's "overt politicisation of football" for nation-building and Pan-Africanism. When Nkrumah fell in the coup of February 1966, described in the chapter on Modern African History since 1860, Djan lost his FIFA and CAF seats.

Africa then used its collective weight. For the 1966 World Cup FIFA offered Africa, Asia and Oceania a single combined place. Led by Djan and Tessema, all 15 African entrants withdrew. It worked: in 1968 FIFA unanimously gave Africa its own place for 1970, which Morocco won. From 2026 Africa has nine places.

```checkpoint
q: What happened at the first Africa Cup of Nations in Khartoum in February 1957?
a*: Only three teams took part, because South Africa refused to field a multiracial team, and Egypt beat Ethiopia 4–0 in the final.
a: South Africa won the tournament after beating Egypt.
x: South Africa did not play at all; it was disqualified for refusing to field a multiracial team.
a: Ghana's Black Stars won it under Ohene Djan.
x: Ghana became independent only in March 1957 and won its first Cup of Nations in 1963.
a: Every independent African state took part.
x: South Africa, a founder of CAF, was excluded; only Egypt, Sudan and Ethiopia played.
hint: Think of who founded CAF and who was excluded.
why: From its first tournament, African football refused to accept apartheid's terms.
---
q: What did the African withdrawal from the 1966 World Cup achieve?
a: It led FIFA to move the 1966 tournament to Africa.
x: The 1966 World Cup went ahead without African teams; the first African host came only in 2010.
a: It got South Africa readmitted to FIFA.
x: South Africa remained suspended and was readmitted to FIFA only in 1992.
a*: In 1968 FIFA unanimously gave Africa its own place at the 1970 World Cup, which Morocco took.
a: It ended FIFA's recognition of CAF.
x: The protest strengthened CAF's position rather than ending its recognition.
hint: Think of what the protest was about.
why: Led by Ohene Djan and Yidnekatchew Tessema, Africa's new nations acted together and changed the rules of the world game.
```

## "No Normal Sport in an Abnormal Society"

South Africa had sent teams to every Summer Olympics from 1904 to 1960. At the first of them, Len Taunyane and Jan Mashiani ran the marathon: the first Black Africans to compete at the Olympics, and the only Black athletes to represent South Africa until the end of apartheid. The chapter on Apartheid and Its End describes the system itself; here the subject is sport as one front against it.

The campaign to isolate apartheid sport was started by Black South Africans. In 1958 the poet **Dennis Brutus** formed the South African Sports Association, and in 1962 he co-founded the South African Non-Racial Olympic Committee (SANROC). Arrested in 1963 and shot in the back after trying to escape, he served sixteen months on Robben Island, and was in prison when the IOC withdrew South Africa's invitation to the 1964 Tokyo Games because its team would not be integrated. In 1968 a threatened boycott by African nations and others, and SANROC's evidence that selection was still segregated, stopped the IOC from readmitting South Africa, and in 1970 it was expelled. At home the non-racial **South African Council on Sport** (SACOS), founded in 1973, carried the struggle on; its leader Hassan Howa is associated with the slogan "No normal sport in an abnormal society", though sources differ on whether he coined or popularised it. On Robben Island, political prisoners ran their own Makana Football Association.

Other bodies followed. FIFA suspended South Africa in the early 1960s, briefly reinstated it, and expelled it in 1976. In cricket, the 1968 "D'Oliveira affair", Prime Minister Vorster's refusal to accept the "Cape Coloured" South African Basil D'Oliveira in the England team, led to the cancellation of South Africa's 1970 tour.

Then Africa boycotted the Olympics. When the IOC refused to ban New Zealand, whose All Blacks had toured South Africa in 1976, about 29 countries, most of them African, withdrew from the Montreal Games, in a boycott organised by the Supreme Council for Sport in Africa under the Congolese official Jean-Claude Ganga. The contrast with the American-led boycott of Moscow in 1980, noted in the chapter on the Global Cold War and the Arms Race, is instructive: 1976 was African-led and about apartheid, not superpower rivalry. In 1977 Commonwealth leaders agreed at Gleneagles to discourage sporting contact with South Africa; when Margaret Thatcher's government refused to enforce it, Nigeria led a boycott of the 1986 Commonwealth Games. Rugby contacts continued even after Gleneagles; the Springboks' 1981 tour of New Zealand set off mass protests there. South Africa returned to the Olympics at Barcelona in 1992, under a new non-racial Olympic committee, and was readmitted to FIFA the same year.

Did it work? Douglas Booth's *The Race Game* (1998) credits the long isolation with forcing the National Party to accept integrated sport by the mid-1980s, but doubts that sport can unite South Africans in anything beyond "the most fleeting and superficial manner".

## Ellis Park, 1995

On 24 June 1995, at Ellis Park in Johannesburg, South Africa beat New Zealand 15–12 after extra time to win the Rugby World Cup. President Nelson Mandela, wearing a Springbok jersey with the number 6 of the captain, François Pienaar, presented the trophy, and Pienaar said the team had won for all 43 million South Africans. F. W. de Klerk later said that "Mandela won the hearts of millions of white rugby fans".

The popular story, told in John Carlin's *Playing the Enemy* (2008) and the film *Invictus* (2009), makes the day a founding moment of reconciliation. South African historians have been more cautious: Albert Grundlingh, André Odendaal and Burridge Spies's *Beyond the Tryline* (1995) was welcomed by one reviewer as a corrective to "over-the-top ahistorical media mythologising". Critics writing in 2019 argued that white sportspeople "were not asked to make a single sacrifice", and Winnie Madikizela-Mandela accused Mandela of focusing more on appeasing whites than on helping Black South Africans. Chester Williams, classified "Coloured" under apartheid and the only Black player in the 1995 squad, alleged in his 2002 biography that some teammates had been racist, though he later modified or withdrew some of those claims. The Springboks had their first Black Test captain only in 2018, when Siya Kolisi took the role; he led them to World Cup wins in 2019 and 2023.

## The Runners

On 10 September 1960, in the year of Africa's great wave of independence, **Abebe Bikila**, a soldier of Ethiopia's Imperial Guard, won the Olympic marathon in Rome running barefoot, because the shoes he had bought there did not fit. He set a world best of 2:15:16.2. The course twice passed the Obelisk of Axum, which Italy had looted, and Bikila's own family had been displaced during the Italo-Ethiopian War of 1935–37; he became Ethiopia's first Olympic gold medallist in the capital of its former occupier. In Tokyo in 1964, about five weeks after an appendectomy and now in shoes, he won again, the first athlete to defend the Olympic marathon title. His countryman Mamo Wolde won in 1968, giving Ethiopia three Olympic marathons in a row.

{{image: Abebe Bikila | Abebe Bikila, Ethiopia's first Olympic gold medallist and the first athlete to defend the Olympic marathon title.}}

Kenya's **Kipchoge Keino** won the 1500 metres at Mexico City in 1968 by 20 metres, the largest winning margin in the event's history, and the steeplechase at Munich in 1972. Since the mid-1960s Kenyan men have taken the largest share of major honours from 800 metres to the marathon, most of them won by Kalenjin runners.

Why East Africa? Proposed explanations include altitude, running to school, diet and body build, prize money that is large compared with typical earnings, and genetics. Bale and Sang dismissed the running-to-school story. A Glasgow research group (Scott, Pitsiladis and others) found environmental factors important, found no evidence that East African runners form a genetic isolate, and judged it "unjustified" to invoke genetics when no relevant genes have been identified. Many of these explanations also fit the many Kenyans who are not elite runners, a reminder to look to history and opportunity rather than racial theories about African bodies.

## Women, Bodies and Eligibility

At Los Angeles in 1984 Morocco's Nawal El Moutawakel won the first Olympic women's 400 metres hurdles, the first Moroccan, Arab, African and Muslim woman to win Olympic gold; she later became Morocco's sports minister. Algeria's Hassiba Boulmerka, the first African woman to win a world athletics title (1991), won her country's first Olympic gold at Barcelona in 1992, despite death threats from Islamist extremists. At the same Games Ethiopia's Derartu Tulu, winning the 10,000 metres after a duel with South Africa's Elana Meyer, became the first Black African woman to win Olympic gold. Nigeria played at the first Women's World Cup in 1991 and won each of the first seven African Women's Championships.

The most painful story is that of **Caster Semenya**, born in Limpopo in 1991, twice Olympic and three times world champion at 800 metres. After her 2009 world title she was made to undergo sex testing, and news of the test leaked hours before the final; the IAAF's president, Lamine Diack, admitted that "there was a leak of confidentiality at some point and this led to some insensitive reactions". South African leaders and commentators called her treatment racist and an affront to her privacy; the IAAF denied racism. Semenya, who according to later reports has a difference of sex development, rejects the label "intersex" and calls herself "a different kind of woman". Rules introduced in 2019 required athletes like her to lower their testosterone to run from 400 metres to the mile. The Court of Arbitration for Sport upheld them by two votes to one, finding them discriminatory but "a necessary, reasonable and proportionate means" of preserving "the integrity of female athletics", and Switzerland's Federal Supreme Court dismissed her appeal in 2020. In 2023 the European Court of Human Rights ruled for her by four votes to three. On 10 July 2025 its Grand Chamber ruled, by 15 to 2, that Switzerland had violated her right to a fair hearing because its court had not given her case the rigorous scrutiny required. It did not rule that the regulations themselves were discriminatory. World Athletics, and scholars such as Doriane Lambelet Coleman, defend such rules as protecting a space for female athletes; critics, including many South African leaders, call them racist and a violation of privacy and human rights.

```checkpoint
q: Why did Abebe Bikila's victory in the 1960 Rome marathon carry special symbolic weight?
a: Because the 1960 Games were the first Olympics held in Africa.
x: The 1960 Games were held in Rome, the capital of Ethiopia's former occupier.
a*: Because an Ethiopian won in the capital of Ethiopia's former occupier, on a course that passed the Obelisk of Axum that Italy had looted.
a: Because he ran for Italy, Ethiopia's former occupier.
x: He ran for Ethiopia, as a soldier of its Imperial Guard.
a: Because he won wearing shoes donated by the Italian government.
x: He ran barefoot because the shoes he had bought in Rome did not fit.
hint: Think of the Italo-Ethiopian War of 1935–37.
why: Bikila's barefoot win made him Ethiopia's first Olympic gold medallist and a symbol of African self-assertion in the year of independence.
---
q: What did the Grand Chamber of the European Court of Human Rights decide in Caster Semenya's case in July 2025?
a: That the eligibility rules were themselves discriminatory and must be abolished.
x: The Grand Chamber expressly did not rule on whether the regulations were discriminatory.
a: That Semenya should be stripped of her Olympic titles.
x: The case concerned her challenge to the eligibility rules, not her titles.
a: That the Swiss courts had handled her case correctly.
x: The ruling went against Switzerland.
a*: That Switzerland had violated her right to a fair hearing, because its court had not given her case the required rigorous scrutiny.
hint: Think of the right to a fair hearing.
why: The ruling was a procedural victory for Semenya, not a judgement on the rules themselves.
```

## Players for Export

Researchers such as Poli call the flow of African footballers to richer leagues a "muscle drain" (the geographer John Bale had earlier written of a "brawn drain" of athletes to American universities), and world-system readings treat it as the periphery's talent serving the core. Paul Darby, Gerard Akindes and Matthew Kirwin (2007) described the academies feeding European clubs as part of a neocolonial trade; even FIFA's president Sepp Blatter was reported to have called European clubs in it "neo-colonialists". The counter-view, standard in European football, holds that elite leagues develop African players and African football. Of the 736 players at the 2010 World Cup, more than half played in five European leagues.

Those players transformed Africa's standing in the world game. Cameroon reached the World Cup quarter-finals in 1990, the first African team to do so, with four goals from the 38-year-old Roger Milla; Senegal followed in 2002. In 2022 Morocco, coached by Walid Regragui, became the first African and Arab team to reach a World Cup semi-final.

## Africa's World Cup, 2010

On 15 May 2004 FIFA chose South Africa, by 14 votes to Morocco's 10, as the first African host of the World Cup. Ghana reached the quarter-finals, losing to Uruguay on penalties after Luis Suárez handled on the line in extra time. In 2015 reports said bid officials had paid US\$10 million in bribes to Jack Warner and others, and Chuck Blazer admitted that members of FIFA's executive committee had taken bribes.

```quote
I and others on the FIFA executive committee agreed to accept bribes in conjunction with the selection of South Africa as the host nation for the 2010 World Cup.
Chuck Blazer · guilty-plea hearing, November 2013 (made public 2015)
```

Costs vary with the source and with what is counted: stadiums were first expected to cost R8.4 billion, the government's 2012 report put total spending at more than R27 billion, and one critical estimate puts the government's total at R39.3 billion against an initial R2.3 billion. Some 309,000 foreign fans came, against 450,000 expected; Blatter called the event "a huge financial success for everybody, for Africa, for South Africa and for FIFA". Critics point to "white elephant" stadiums in Cape Town and Durban, and to evictions and the Blikkiesdorp relocation camp; the Durban shack-dwellers' movement Abahlali baseMjondolo challenged the KwaZulu-Natal Slums Act in court in 2009. Others argue that some evictions were wrongly blamed on the tournament. The argument echoes this whole history: whether sport serves Africans or uses them.

## Further exploration

- **Peter Alegi, *African Soccerscapes: How a Continent Changed the World's Game* (2010).** A short continental history of football from colonial introduction to global labour markets.
- **Phyllis M. Martin, *Leisure and Society in Colonial Brazzaville* (1995).** How football and music built urban identities in French Equatorial Africa.
- **Laura Fair, *Pastimes and Politics: Culture, Community, and Identity in Post-Abolition Urban Zanzibar, 1890–1945* (2001).** Football, taarab and dress as tools of self-making for freed slaves.
- **Paul Darby, *Africa, Football and FIFA: Politics, Colonialism and Resistance* (2002).** How Africa won power within FIFA, with a foreword by South Africa's Danny Jordaan.
- **John Bale and Joe Sang, *Kenyan Running: Movement Culture, Geography and Global Change* (1996).** A prize-winning Kenyan–British history and geography of East African running.
- **Douglas Booth, *The Race Game: Sport and Politics in South Africa* (1998).** An assessment of the long sporting boycott and its limits.
- **Chuck Korr and Marvin Close, *More Than Just a Game: Football v Apartheid* (2008).** The Robben Island Makana Football Association, told from the prisoners' own records.$mn_sportafrica_master$,
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
  select $mn_sportafrica_quiz$[
    {"type": "mcq", "prompt": "Which four national associations founded the Confederation of African Football in Khartoum on 8 February 1957?", "options": ["Ghana, Nigeria, Egypt and Morocco", "Egypt, Sudan, Ethiopia and South Africa", "Algeria, Tunisia, Morocco and Egypt", "Ethiopia, Kenya, Uganda and Tanzania"], "answerIndex": 1, "explanation": "These were Africa's FIFA members at the time; South Africa was then disqualified from the first Cup of Nations for refusing to field a multiracial team.", "id": "q1"},
    {"type": "mcq", "prompt": "Who formed the South African Sports Association in 1958 and co-founded SANROC in 1962?", "options": ["Hassan Howa", "Jean-Claude Ganga", "Ohene Djan", "Dennis Brutus"], "answerIndex": 3, "explanation": "The poet Dennis Brutus started the campaign against apartheid sport from inside South Africa; he was later shot, imprisoned on Robben Island and exiled.", "id": "q2"},
    {"type": "mcq", "prompt": "Why did about 29 countries, most of them African, boycott the 1976 Montreal Olympics?", "options": ["Because the IOC refused to ban New Zealand, whose All Blacks had toured South Africa that year", "Because of the Soviet invasion of Afghanistan", "Because FIFA refused Africa a place at the World Cup", "Because South Africa had been readmitted to the Olympics"], "answerIndex": 0, "explanation": "The boycott, organised by the Supreme Council for Sport in Africa under the Congolese official Jean-Claude Ganga, was African-led and about apartheid; the Afghanistan boycott was the US-led one of 1980.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Glasgow research group (Scott, Pitsiladis and others) conclude about East African distance-running success?", "options": ["That it was caused by a single identified gene", "That East African runners form a genetic isolate", "That environmental factors were important and it was 'unjustified' to invoke genetics when no relevant genes had been identified", "That altitude played no part"], "answerIndex": 2, "explanation": "They found no evidence of a genetic isolate and judged genetic explanations unjustified in the absence of identified genes.", "id": "q4"},
    {"type": "open", "prompt": "Was colonial sport in Africa an instrument of imperial control or a field of African self-assertion? Use historians' arguments and examples.", "rubric": "A strong answer sets out the control reading (Bale and Sang on running imposed 'as a means of social control'; Chipande on football used for social control and propaganda in Zambia; segregated football under the Italian occupation of Ethiopia; colonial fears about pan-African games) against the appropriation reading (Martin on Brazzaville's township football and new identities; Fair on Zanzibar, where football was a tool of self-making for former slaves; Alegi), notes that the two can coexist, and may extend the argument to the FLN team, CAF and Nkrumah's Black Stars.", "id": "q5"},
    {"type": "open", "prompt": "How have historians and critics interpreted the 1995 Rugby World Cup, and how does it relate to the earlier sporting boycott of South Africa?", "rubric": "A strong answer describes the final at Ellis Park and Mandela in Pienaar's number 6 jersey; contrasts the reconciliation narrative (Carlin, Invictus, de Klerk's comment) with critiques (Beyond the Tryline against 'media mythologising', the 2019 argument that whites made no sacrifice, Winnie Madikizela-Mandela, Chester Williams's allegations and their later modification, the first Black Test captain only in 2018); and links it to a boycott begun by Black South Africans (Brutus, SANROC, SACOS and Howa), with Booth's judgement on what isolation achieved.", "id": "q6"}
  ]$mn_sportafrica_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/africa/history-of-sport-in-africa', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
