-- Power and Protest in the Long 1960s: the May 1968 Movement — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/power-and-protest-in-the-long-1960s-the-may-1968-movement @ research/advanced/read.
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
    'history/20th-century-history/power-and-protest-in-the-long-1960s-the-may-1968-movement',
    'research',
    'advanced',
    'read',
    $mn_may68_master$> **The year the postwar order shook.** In May and June 1968 a student revolt in Paris set off the largest general strike in French history, sent President de Gaulle on a secret flight out of the country, and ended in a Gaullist landslide at the polls. That year tanks crushed the Prague Spring, soldiers killed students in Mexico City ten days before the Olympics, Martin Luther King Jr. was assassinated, and students and workers rose from West Berlin and Turin to Dakar, Rawalpindi, Tokyo and Derry. This chapter follows the French crisis from Nanterre to the June elections, then the global 1968 around it, including the women and workers often left out of its memory, and its afterlife in the New Left, feminism and environmentalism, ending with the unsettled argument over what 1968 changed.

## A Year of Shocks

The year opened with war. On 30–31 January communist forces launched the **Tet Offensive** across South Vietnam, a military failure for Hanoi but a political earthquake in Washington, as the chapter on the Vietnam War describes. Opposition to that war linked protesters across continents, but each national 1968 had its own causes: overcrowded universities, frozen political systems, censorship, racial discrimination, dictatorship, low wages. What made the year feel like one event was simultaneity, carried by radio and television; in Chicago protesters chanted that "the whole world is watching".

The global 1968 also had a shape that the familiar Western story hides. In the Soviet bloc, protesters demanded freedoms that Western students took for granted. In Mexico, Brazil, Senegal and Pakistan, students faced governments that answered with soldiers. And in China the year ran the other way: as the chapter on the Cultural Revolution shows, in July 1968 Mao shut down the state-sponsored youth movement of the Red Guards and from December sent urban young people to the countryside en masse.

## France before the Storm

France in 1968 was in the middle of the *Trente Glorieuses*, the thirty years of rapid growth and urbanisation after 1945. Prosperity had not reached everyone. Universities were overcrowded and rigidly run, and many workers faced stagnant wages and poor conditions. Charles de Gaulle, back in power since 1958 (see the chapter on Decolonization), presided over a Fifth Republic that many found outdated. The state held a monopoly of radio and television through the ORTF, and in spring 1968 the government contained no women.

The spark came from Nanterre, a campus of the University of Paris. On 22 March about 150 students, with far-left groups and a few poets and musicians, occupied an administration building, giving their name to the "Movement of 22 March". Its best-known figure was **Daniel Cohn-Bendit**, born stateless in 1945 to German Jewish parents who had fled Nazi Germany, and known for his politics and red hair as "Dany le Rouge".

## From Nanterre to the Barricades

On 2 May the administration closed Nanterre. The next day students met at the Sorbonne, in the Latin Quarter, to protest, and police entered the building. On 6 May more than 20,000 people, led by the student union UNEF and the university teachers' union, marched towards the sealed-off Sorbonne; police charged with batons, the first paving stones were prised up and the first barricades built. On the night of 10–11 May, the "night of the barricades", a crowd blocked by the CRS riot police from crossing the river barricaded the Latin Quarter. The police attacked at 2:15 in the morning. Hundreds were arrested and injured, the night was broadcast live on radio, and public sympathy swung to the students.

The unions now moved. The CGT and Force Ouvrière called a one-day general strike for 13 May, and hundreds of thousands marched in Paris, by some counts over a million. Prime Minister Georges Pompidou released the prisoners and reopened the Sorbonne, which students occupied as an autonomous "people's university"; the Odéon theatre was taken too, and some 400 popular action committees formed. The walls filled with slogans: "Sous les pavés, la plage!" (Under the paving stones, the beach), "Il est interdit d'interdire" (It is forbidden to forbid), "Soyez réalistes, demandez l'impossible" (Be realistic, demand the impossible).

{{image: May 68 | France in May 1968, when a student revolt became the largest general strike in the country's history.}}

## Some Ten Million on Strike

What turned a student revolt into a national crisis was the workers. On 14 May workers at the Sud-Aviation plant near Nantes began a sit-down strike and occupied the factory. Renault's plants at Cléon and Billancourt followed, and the strikes spread to every sector: state employees, manufacturing, services, even management. Estimates vary, but the usual figure is some 9–10 million strikers at the peak.

The workers' demands differed from the students'. Accounts suggest that immigrant workers, from North Africa, Portugal and sub-Saharan Africa, were among the most militant strikers in some plants, such as Citroën's, where conditions in the company's dormitories for foreign workers were also an issue. Their story, and that of women workers, remains thinly documented in English-language histories, which have long preferred the students of the Latin Quarter.

The crisis was not bloodless. On the night of 24 May a police inspector, René Lacroix, was crushed by a lorry sent into police lines in Lyon, and in Paris a young demonstrator was stabbed in a fight among demonstrators. On 10 June Gilles Tautin, a 17-year-old school student supporting the strikers at Renault-Flins, drowned in the Seine; accounts say he was fleeing police, and the circumstances are disputed. On 11 June two workers were killed when police cleared Peugeot's Sochaux plant, one of them shot. The Paris police chief, Maurice Grimaud, is credited with avoiding worse bloodshed through restraint.

On 25–26 May the government, unions and employers met at the Ministry of Social Affairs in the rue de Grenelle; among the negotiators were a young junior minister, Jacques Chirac, and the CGT leader Georges Séguy. The **Grenelle agreements**, concluded on 27 May but never signed, offered a 35 per cent rise in the minimum wage, 10 per cent on wages, and recognition of union branches inside firms. The rank and file rejected them, and the strikes went on.

## De Gaulle Vanishes and Returns

For a moment the state seemed to dissolve. On 28 May the Socialist leader François Mitterrand declared that "there is no more state" and offered to form a government; the next day Mendès France did the same. On the morning of 29 May de Gaulle postponed the cabinet, quietly removed his papers, and disappeared. For more than six hours no one knew where he was. Before leaving he spoke to his prime minister in words that sounded like a farewell.

```quote
I am the past; you are the future; I embrace you.
Charles de Gaulle · to Georges Pompidou · 29 May 1968
```

He had flown to Baden-Baden, in West Germany, to General Jacques Massu, commander of the French forces there, who persuaded him to return; by one account de Gaulle agreed, in return for the army's support, to an amnesty for the officers who had rebelled over Algeria in 1961.

On 30 May some 400,000 to 500,000 people marched with the CGT, chanting "Adieu, de Gaulle!" That afternoon de Gaulle spoke on the radio: he would not resign, and he dissolved the National Assembly and called elections. Pompidou had pressed him to dissolve by threatening to resign. Then about 800,000 Gaullists filled the Champs-Élysées. His line, relayed to the press on 19 May, had been "La réforme oui, la chienlit non" (reform yes, chaos no). The strikes ebbed through June; police retook the Sorbonne on 16 June, and several far-left groups were banned.

The elections of 23 and 30 June gave the Gaullists and their allies about 350 of 487 seats, and the Gaullist party alone won an absolute majority, the first for a single party in a French republic; the left had its worst postwar result, with 34 Communist seats and 57 for the Socialist-led federation. Victory did not save de Gaulle. A survey after the crisis found majorities thinking him too old and too authoritarian, and on 28 April 1969, after losing a referendum on the Senate and the regions, he resigned.

```checkpoint
q: What turned the student revolt of May 1968 into a national crisis in France?
a*: A wave of strikes and factory occupations, beginning at Sud-Aviation near Nantes on 14 May, that reached some 9–10 million workers at the peak.
a: The arrest of Daniel Cohn-Bendit at Nanterre.
x: Cohn-Bendit was a leading figure of the student movement, but his fate did not bring the country to a halt.
a: The resignation of de Gaulle in late May.
x: De Gaulle refused to resign on 30 May; he resigned only in April 1969, after losing a referendum.
a: A call for revolution by the Communist Party.
x: Scholars stress that the Communist Party was moderate and essentially anti-revolutionary in 1968.
hint: Think about who joined the students after mid-May.
why: The general strike, the largest in French history, is what made the government's survival uncertain.
---
q: How did the crisis end politically?
a: With a new constitution drafted by the student assemblies.
x: The Fifth Republic's constitution survived; the student assemblies wrote no new one.
a: With a coalition government of Communists and Socialists.
x: The left had its worst postwar result in the June elections.
a*: With de Gaulle dissolving the Assembly and the Gaullists and their allies winning about 350 of 487 seats in the June elections.
a: With the Grenelle agreements, which the strikers accepted at once.
x: The rank and file rejected the Grenelle terms, and the strikes continued.
hint: What did de Gaulle announce on the radio on 30 May?
why: Politically May 68 ended in a conservative landslide, one reason its legacy is so disputed.
```

## The Eastern 1968: Prague, Warsaw, Belgrade

In Czechoslovakia, 1968 began from above. On 5 January **Alexander Dubček** replaced Novotný as the Communist Party's first secretary, and in April an Action Programme promised freedom of the press, speech and travel: "socialism with a human face". On the night of 20–21 August Warsaw Pact forces invaded, about 250,000 troops at first, rising to about half a million, from the Soviet Union and three allies, Poland, Hungary and Bulgaria; East Germany's units were stood down hours before, and Romania and Albania refused to take part. Some 137 Czechoslovaks were killed. Dubček was taken to Moscow and signed a protocol accepting the occupation; only František Kriegel refused. In April 1969 Husák replaced him and "normalization" began; of the reforms, only the federation of the Czech and Slovak republics survived. The chapter on the Soviet Union follows the Brezhnev Doctrine that justified the invasion.

The invasion provoked lonely acts of protest. On 25 August eight people sat down on Red Square in Moscow with banners, one reading "For your freedom and ours"; among them were Natalya Gorbanevskaya, Larisa Bogoraz and Pavel Litvinov. They were quickly arrested. On 8 September, before some 100,000 people at a harvest festival in a Warsaw stadium, Ryszard Siwiec, an accountant and former Home Army member, set himself on fire; the press was silent. On 16 January 1969 Jan Palach, a student at Charles University, burned himself in Wenceslas Square in Prague, demanding an end to censorship; his funeral became a mass protest.

Poland had already had its own 1968. The banning of Mickiewicz's play *Dziady* led to protests; on 8 March a student rally at Warsaw University was attacked by regime "worker activists" and riot police, and protests spread across the country. The regime then ran an "anti-Zionist", in truth antisemitic, campaign, and at least 13,000 Poles of Jewish origin emigrated between 1968 and 1972, losing their citizenship. In June, Belgrade students occupied their university for seven days, complaining of unemployment and of reforms that pushed workers abroad; Tito said on television that the "students are right", conceded some demands, and later saw leaders imprisoned or dismissed. Ivan Krastev has drawn the contrast: the West's 1968 was about individual sovereignty, the East's about national sovereignty.

## Mexico and Brazil

Mexico's movement began in late July with police violence against students. On 1 August the rector of UNAM, Javier Barros Sierra, lowered the flag to half-mast and led a march of perhaps 50,000. In September the army occupied the campuses. On 2 October, ten days before the Olympics opened, some 10,000 people gathered in the Plaza de las Tres Culturas at **Tlatelolco**.

```quote
¡No queremos olimpiadas, queremos revolución!
Chant of the demonstrators · Plaza de las Tres Culturas, Tlatelolco · 2 October 1968
```

("We don't want Olympics, we want revolution!") Flares fell, and soldiers and the plain-clothes Olympia Battalion opened fire; documents released since 2000 indicate that Presidential Guard snipers fired first, to provoke the army. The toll is still disputed. Newspapers and officials at first reported some 20 to 30 dead; Kate Doyle of the National Security Archive documented 44 deaths; most estimates run to several hundred, commonly 300 to 400. Some 1,345 people were arrested, and the Games went ahead. Luis Echeverría, interior minister in 1968 and later president, was charged with genocide in 2006, but the charges were dismissed in 2009; in 2024 President Claudia Sheinbaum issued an official apology. At the Games, Tommie Smith and John Carlos raised black-gloved fists on the podium during the American anthem, and were expelled.

In Brazil, ruled by generals since 1964, military police killed an 18-year-old student, Edson Luís de Lima Souto, in Rio de Janeiro in March. On 26 June the March of the One Hundred Thousand brought students, artists and intellectuals into Rio's streets, and Caetano Veloso turned a Paris slogan into the song "É Proibido Proibir". The regime answered on 13 December with Institutional Act No. 5, closing Congress and suspending habeas corpus for political crimes: "the coup within the coup" described in the chapter on Latin America in the Cold War.

## The United States

On 4 April **Martin Luther King Jr.** was shot dead in Memphis. Riots followed in more than 100 cities; in a week 43 people died and more than 20,000 were arrested. In June Robert F. Kennedy was assassinated too. At Columbia University, Students for a Democratic Society and the Student Afro-American Society occupied buildings from 23 April against the university's military-research ties and a gymnasium planned for Morningside Park, which critics called segregated; police arrested more than 700, but both plans were dropped. At the Democratic National Convention in Chicago in August, police clashed with 7,000 to 10,000 protesters, in what an official report later called a "police riot". On 7 September about 200 women picketed the Miss America pageant in Atlantic City, filling a "Freedom Trash Can" with bras, girdles and make-up. Nothing was burned: "bra-burning" was a reporter's analogy with burning draft cards.

## West Germany and Italy

West Germany's movement had a martyr before 1968: on 2 June 1967 a policeman, Karl-Heinz Kurras, shot the student Benno Ohnesorg dead at a protest in West Berlin against the Shah of Iran. Kurras was acquitted, and in 2009 was revealed as a Stasi informer, though there is no evidence he acted on orders. On 11 April 1968 a far-right gunman shot the student leader **Rudi Dutschke**, who survived with brain damage; protesters attacked the offices of the Springer press, which dominated West Berlin's media. The Bundestag passed Emergency Acts in May, and from the movement's fringe came the Red Army Faction of Baader and Ensslin.

In Italy, about 4,000 students fought police at Valle Giulia in Rome on 1 March, and by May every university but one was occupied. Italy's 1968 lasted longest: in the "creeping May" students allied with workers at FIAT in Turin and Pirelli in Milan, culminating in the "Hot Autumn" of 1969, a wave of wildcat strikes, in which many of the workers were migrants from the South, that won the 40-hour week. On 12 December 1969 a neo-fascist bomb in Piazza Fontana, Milan, killed 17 people and opened the "Years of Lead".

## Dakar, Rawalpindi, Tokyo, Derry

In **Senegal**, students at the University of Dakar struck in May against cuts to their grants. Police and soldiers stormed the campus around 29 May; one student was killed by most accounts, and hundreds were arrested. The unions declared a general strike on 30 May, and the historian Omar Gueye judges that the government was tottering; President Senghor blamed outside influences. Students at the University of Cape Town held a nine-day sit-in in August after the university, under apartheid-government pressure, rescinded Archie Mafeje's appointment, and Jamaica saw riots in October after the historian Walter Rodney was banned from returning to the University of the West Indies.

In **Pakistan**, a student campaign that began in October 1968 became, after police killed a student in Rawalpindi in November, a movement of students, workers, lawyers and peasants that, by one estimate, drew 10 to 15 million people; Mahbub ul Haq had shown that 22 families controlled two-thirds of industry. In East Pakistan, Sheikh Mujibur Rahman was freed in February 1969 when the conspiracy case against him was withdrawn. By one count 239 people were killed, and on 25 March 1969 Ayub Khan resigned, handing power to the army chief, Yahya Khan.

In **Japan**, medical students at the University of Tokyo struck in early 1968 over unpaid internships, and campus joint struggle committees, the Zenkyōtō, occupied buildings until thousands of police retook Tokyo's Yasuda Hall in January 1969; the university's 1969 entrance examinations were cancelled. From the movement grew Tanaka Mitsu's *ūman ribu*, Japanese women's liberation.

In **Northern Ireland**, police batoned civil rights marchers in Derry on 5 October before the cameras, as the chapter on Partition describes. On 18 November about 1,000 workers, mostly young women from the city's shirt factories, walked out and marched through Derry, and the Belfast student group People's Democracy, in which Bernadette Devlin and Michael Farrell were prominent, held open mass meetings that observers compared to the Sorbonne's.

```checkpoint
q: Which statement about the Warsaw Pact invasion of Czechoslovakia in August 1968 is accurate?
a: East German troops led the invasion force.
x: East Germany's units were stood down hours before; the invaders were the Soviet Union, Poland, Hungary and Bulgaria.
a*: It rose to about half a million troops, and of Dubček's reforms only federation survived.
a: Romania sent the largest contingent after the Soviet Union.
x: Romania refused to take part, as did Albania.
a: Dubček refused to sign the Moscow Protocol and was executed.
x: Dubček signed; only František Kriegel refused. Dubček was later expelled from the party and made a forestry official.
hint: Think of what remained after "normalization".
why: The invasion ended "socialism with a human face", and protesters such as Jan Palach kept its memory alive.
---
q: What is still disputed about the Tlatelolco massacre of 2 October 1968?
a: Whether it took place in Mexico City.
x: It took place in the Plaza de las Tres Culturas in Mexico City; that is not in dispute.
a: Whether the Olympic Games went ahead afterwards.
x: The Games opened as planned later that month.
a: Whether the Olympia Battalion was a student militia.
x: The Olympia Battalion was a government force, and documents released since 2000 point to state snipers firing first.
a*: How many were killed: some 20 to 30 in the first reports, 44 documented by Kate Doyle, several hundred in most estimates.
hint: Think about numbers.
why: For decades the government kept the records closed; the dispute over the toll is part of the massacre's history.
```

## Afterlives: The New Left, Feminism and the Environment

Behind many of 1968's movements stood the **New Left**, which had grown since 1956 among Communist dissenters and put social justice and personal freedom beside purely economic goals; Herbert Marcuse was called its father. After 1968 parts of it hardened: in France, as the chapter on Maoism describes, Sartre lent his name to the Maoist Gauche prolétarienne, and in West Germany a fringe turned to terrorism.

Women had been everywhere in 1968 and in charge almost nowhere, and many drew their own conclusions. **Second-wave feminism** is conventionally dated from Friedan's *The Feminine Mystique* (1963), building on Beauvoir's *The Second Sex* (1949), though historians criticise narratives that centre white middle-class women. In France the Mouvement de libération des femmes is said to have been born on 26 August 1970, when nine women, among them Christine Delphy and Monique Wittig, tried to lay a wreath at the Arc de Triomphe to the Unknown Soldier's wife: "There is more unknown than the unknown soldier: his wife." Elaine Carey argues that women's mobilisation in Mexico in 1968 set the stage for 1970s Mexican feminism, and in Japan *ūman ribu* grew out of the campus struggles.

Environmentalism drew on the moment too. The Club of Rome was founded in 1968, and some 20 million Americans took part in the first Earth Day on 22 April 1970. Two of 1968's best-known student leaders ended among the Greens: Cohn-Bendit as a member of the European Parliament, and Dutschke, elected a delegate to the West German Greens' founding congress before his death in 1979.

## What Did 1968 Change?

The argument began at once. One reading stresses political failure: in France the revolt ended in a Gaullist landslide, in Prague in occupation, in Mexico and Brazil in massacre and harsher dictatorship. Another stresses cultural victory: wage gains, union rights and education spending, and new movements for women's liberation, the environment and gay and lesbian rights, along with changed relations of authority.

Historians also argue over whose May 68 it was. **Kristin Ross** argues that the dominant memory, shaped by sociologists, repentant former leaders and the media, shrank it into a cultural, generational youth revolt, erasing the millions of strikers, the police violence and deaths, and the anti-imperialist influence of Algeria and Vietnam. **Michael Seidman** finds instead that most strikers pursued bread-and-butter demands, more pay and less work, not revolution. Widening the lens, **Jeremi Suri** argues that great powers facing disorder at home converged on détente; the *Routledge Handbook of the Global Sixties* places the decade "between protest and nation-building", centring the Global South; and **Richard Vinen** extends the "long '68" and gives its enemies their due.

1968 remains contested ground for politicians and states. In 2007 Nicolas Sarkozy, campaigning for the French presidency, called for the legacy of May 68 to be liquidated once and for all; critics such as Daniel Bensaïd replied that he was blaming 1968 for the effects of liberal economic reform. Elsewhere the struggle over memory was harsher. Mexico's Tlatelolco records opened only after 2000; Czechoslovakia's secret police dug up Palach's grave in 1973, and Siwiec's protest was suppressed in Poland and largely forgotten until 1989. Yet in January 1989 a "Palach Week" of demonstrations helped prepare the Velvet Revolution, and in 1987, asked what separated the Prague Spring from Gorbachev's reforms, a Soviet spokesman answered: "Nineteen years."

## Further exploration

- **Kristin Ross, *May '68 and Its Afterlives* (2002).** How memory turned a political event of strikers and anti-colonial solidarity into a cultural youth revolt.
- **Richard Vinen, *The Long '68: Radical Protest and Its Enemies* (2018).** A cool comparative synthesis of the United States, Britain, France and West Germany.
- **Jeremi Suri, *Power and Protest: Global Revolution and the Rise of Détente* (2003).** Argues that great powers facing protest at home turned to détente.
- **Chen Jian, Martin Klimke, Masha Kirasirova, Mary Nolan, Marilyn Young and Joanna Waley-Cohen (eds), *The Routledge Handbook of the Global Sixties* (2018).** More than forty contributors decentre the West.
- **Elaine Carey, *Plaza of Sacrifices: Gender, Power, and Terror in 1968 Mexico* (2005).** The first English monograph on Tlatelolco, read through gender.
- **Ronald Fraser and others, *1968: A Student Generation in Revolt* (1988).** An international oral history of the year's activists.
- **Michael Seidman, *The Imaginary Revolution: Parisian Students and Workers in 1968* (2004).** A sceptical reading: strikers wanted more pay and less work, not revolution.$mn_may68_master$,
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
  select $mn_may68_quiz$[
    {"type": "mcq", "prompt": "Where did General de Gaulle go when he disappeared on 29 May 1968?", "options": ["To Baden-Baden, to see General Jacques Massu, commander of the French forces in West Germany", "To his country home, to draft his resignation", "To Moscow, to negotiate with the Soviet leadership", "To London, where he had led the Free French in the war"], "answerIndex": 0, "explanation": "De Gaulle secretly flew to Baden-Baden to General Massu, who persuaded him to return; the next day he dissolved the National Assembly and called elections.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Grenelle agreements of late May 1968 offer French workers?", "options": ["Workers' control of nationalised industries", "A 35 per cent rise in the minimum wage, a 10 per cent rise in wages and recognition of union branches in firms", "An immediate 35-hour week", "Seats for union leaders in de Gaulle's cabinet"], "answerIndex": 1, "explanation": "The Grenelle terms raised the minimum wage by 35 per cent and wages by 10 per cent and recognised union branches inside firms, but the rank and file rejected them and the strikes continued.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these was part of the 'global 1968' outside Europe and North America?", "options": ["The Battle of Valle Giulia", "The killing of Benno Ohnesorg", "The March of the One Hundred Thousand in Rio de Janeiro against Brazil's military regime", "The Columbia University occupation"], "answerIndex": 2, "explanation": "The March of the One Hundred Thousand took place in Rio on 26 June 1968; Valle Giulia was in Rome, Ohnesorg was killed in West Berlin, and Columbia is in New York.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Kristin Ross argue in May '68 and Its Afterlives?", "options": ["That May 68 was mainly a fight over university admissions", "That the strikers wanted revolution while the students wanted reform", "That de Gaulle secretly planned the crisis to win an election", "That the dominant memory reduced May 68 to a cultural youth revolt, erasing the strikers, the police violence and the anti-imperialist influences of Algeria and Vietnam"], "answerIndex": 3, "explanation": "Ross argues that sociologists, repentant ex-leaders and the media turned a political event of workers and anti-colonial solidarity into a generational, cultural revolt.", "id": "q4"},
    {"type": "open", "prompt": "Was May 1968 in France a failure or a victory? Use evidence from both the political outcome and its longer-term effects, and refer to at least one historian.", "rubric": "A strong answer notes the political outcome (de Gaulle's dissolution, the landslide for the Gaullists and their allies, about 350 of 487 seats, in June 1968, the left's worst postwar result) and weighs it against gains (Grenelle wage rises, union rights, education spending) and cultural effects (feminism, environmentalism, gay and lesbian activism, changed authority relations). It should engage with at least one named interpretation, such as Kristin Ross on the erasure of the strikers, Michael Seidman's bread-and-butter reading, or the Sarkozy-era call to liquidate its legacy, and recognise that de Gaulle resigned in 1969.", "id": "q5"},
    {"type": "open", "prompt": "Why do many historians insist that 1968 was a global rather than a Parisian event? Discuss at least three countries outside France.", "rubric": "A good answer uses at least three cases accurately, for example: the Prague Spring and the August invasion (about half a million troops from the USSR, Poland, Hungary and Bulgaria); Poland's March protests and antisemitic campaign; Tlatelolco on 2 October (toll disputed, from some 20–30 in first reports to 44 documented to several hundred in most estimates); Brazil's March of the One Hundred Thousand and AI-5; Senegal's student strike and general strike; Pakistan's movement that ended with Ayub Khan's resignation; Japan's Zenkyōtō; the United States (King's assassination, Columbia, Chicago); Derry. It should note differences, e.g. Krastev's contrast between Western individual and Eastern national sovereignty, or Suri's link between protest and détente, and the role of television and the Vietnam War in linking movements.", "id": "q6"}
  ]$mn_may68_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/power-and-protest-in-the-long-1960s-the-may-1968-movement', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
