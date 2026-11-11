-- Maoism — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/maoism @ research/advanced/read.
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
    'history/20th-century-history/maoism',
    'research',
    'advanced',
    'read',
    $mn_maoism_master$> **A Chinese Marxism that travelled the world.** Mao Zedong remade a doctrine built for industrial workers into one for a country of peasants: revolution from the countryside, a party disciplined by "rectification", a "mass line" that claimed to take ideas from the people and return them as policy, and a belief that revolution must continue even after victory. In power, that vision drove collectivisation, the Great Leap Forward and its famine, and the Cultural Revolution, all wrapped in the cult of the Little Red Book, the badge and the poster. Abroad, as the historian Julia Lovell has shown, Maoism inspired insurgents in India, Peru and Nepal, the Khmer Rouge in Cambodia, African state-builders and Western students and philosophers. This chapter follows that story, the arguments over its human cost, and Maoism's ambiguous afterlife in the China of Deng Xiaoping and Xi Jinping.

## What Is Maoism?

The Chinese Communist Party (CCP) does not speak of "Maoism". Its term is **Mao Zedong Thought**, and Mao himself rejected "Maoism", insisting that his ideas were not a finished system but still developing. The English word was coined in 1951 by the American scholar Benjamin I. Schwartz to describe Mao's strategy: a disciplined, hierarchical Communist Party resting on a mobilised peasant mass base. In China, Mao Zedong Thought is presented as Marxism adapted to Chinese conditions. Movements abroad, such as Peru's Shining Path, later spoke instead of **Marxism–Leninism–Maoism**, a universal doctrine applicable everywhere.

Mao was born on 26 December 1893 near Shaoshan, in Hunan province, and died on 9 September 1976.

## The Sinification of Marxism

In the 1920s the CCP's strategy rested on the urban workers, as Marxist orthodoxy taught. Mao broke with it. His *Report on an Investigation of the Peasant Movement in Hunan*, published on 28 March 1927, argued for a revolution based on the poor peasantry and endorsed peasant violence against landlords. "Several hundred million peasants", he predicted, "will rise like a mighty storm, like a hurricane."

```quote
Revolution is not a dinner party, nor an essay, nor a painting, nor a piece of embroidery; it cannot be so refined, so leisurely and gentle, so temperate, kind, courteous, restrained and magnanimous. A revolution is an insurrection, an act of violence by which one class overthrows another.
Mao Zedong · Report on an Investigation of the Peasant Movement in Hunan · 1927
```

In April 1927 Chiang Kai-shek turned on the Communists, and party membership fell from 60,000 to 10,000. At an emergency meeting on 7 August Mao drew the lesson that political power is obtained from the barrel of a gun, a line he made famous in 1938: "Political power grows out of the barrel of a gun." From this came the doctrine of **people's war**: a protracted struggle based in the countryside, building base areas, then moving to mobile warfare, and finally "surrounding the cities from the countryside".

The decisive years came at **Yan'an**, the Communists' capital from 1937 to 1947, after the Long March brought them to northern Shaanxi in 1935. There Mao wrote most of the works later canonised, among them *On Contradiction* and *On Practice*, and the party established its ideological independence from Moscow. In 1938 he called for the "Sinicization of Marxism": "the universal truth of Marxism must have a national form before it can be useful". In 1942 he put it more vividly: "The target is the Chinese revolution, the arrow is Marxism–Leninism."

Yan'an also showed the method's harder side. The **Rectification Movement** of 1942–1945 remoulded party members' thinking through study, confession and criticism; a 1943 campaign extracted forced confessions, and the writer Wang Shiwei, who had criticised privilege in Yan'an, was labelled a Trotskyist and executed in 1947. Many see Rectification as the origin of Mao's personality cult, and the Chinese historian Gao Hua reinterpreted it as a power struggle by which Mao made himself paramount. The party had arrived at Yan'an with fewer than 10,000 worn-out troops; by the end it had nearly 2.8 million members, about 90 per cent of them peasants, and governed nearly 100 million people. In 1945 Mao Zedong Thought was written into the party constitution.

Three ideas became Maoism's core. The **mass line**, "from the masses, to the masses", set out in 1943, told leaders to gather the scattered ideas of the masses, concentrate them through Marxist analysis, and return them as policy; its slogan was "Serve the People". Second, Mao held that contradiction is universal and "the struggle of opposites is absolute". Third, from 1956 he theorised **continuous revolution**: class struggle continues, and may even intensify, under socialism, so the revolution is never "over". In 1958 Mao called China's 600 million people "poor and blank", "a clean sheet of paper" on which "the newest and most beautiful words can be written", a faith in mobilised will that shaped his rule.

## Land Reform and Collectivisation

The revolution reached the villages through **land reform** (1946–1953), which confiscated landlords' land and redistributed it through public struggle sessions where tenants "spoke bitterness" against their former masters. Landlords were killed by party activists and former tenants alike; estimates of the dead range from hundreds of thousands to millions, the *Cambridge History of China* suggesting perhaps 1 to 2 million executions and Benedict Stavis a cautious 200,000 to 800,000. The historian Brian DeMare argues that it was critical to the Communists' victory in the civil war.

The land was soon pooled again. Peasants were organised into mutual aid teams, then from 1953 into cooperatives, and from 1956 into "higher cooperatives" of 100 to 300 families. By 1957 taxes and compulsory grain sales took about 30 per cent of the harvest, and the *hukou* household registration system restricted movement to the cities. In 1956–57 Mao invited criticism: "Let a hundred flowers bloom; let a hundred schools of thought contend." The **Anti-Rightist Campaign** that followed persecuted at least 550,000 people, mostly intellectuals. Whether the Hundred Flowers was a deliberate trap, as Jung Chang and Jon Halliday argue, remains contested.

## The Great Leap Forward and the Famine

In January 1958 Mao unveiled the **Great Leap Forward**, which was to turn agrarian China into an industrial power through mass mobilisation; he forecast surpassing Britain's industrial output within 15 years. The first experimental **people's commune**, in Henan, abolished private plots and set up communal kitchens; by the end of 1958 there were about 25,000 communes averaging 5,000 households. Peasants melted down cooking pots in backyard furnaces; the 1958 steel target of 10.7 million tons was declared met, but more than 3 million tons was unusable.

The system ran on false numbers. Local officials competed to announce ever-higher "sputnik" harvests, and the state took its grain on the basis of those claims. Grain output fell from about 200 million tons in 1958 to 143.5 million in 1960, by the government's own data, yet China remained a net grain exporter until 1960. When Marshal Peng Dehuai, with a few supporters, openly criticised the Leap at the **Lushan Conference** in 1959, Mao dismissed him and launched a campaign against "right deviation" that purged or penalised more than 3 million party members; after Lushan, false reporting and forced procurement grew worse. In Xinyang prefecture, in Henan, people died at the doors of granaries, and the post office confiscated 1,200 letters begging for help. Anhui, the worst-hit province, lost 18 per cent of its people.

How many died? Most estimates count "excess deaths" above a normal death rate, so they depend on the baseline chosen, on flawed statistics, and on assumptions about migration and registration. Demographers in the 1980s gave figures from 23 million (Peng Xizhe) and 27 million (Ansley Coale) to about 30 million (Judith Banister; Basil Ashton and colleagues); a Chinese Academy of Sciences team and the economists Houser, Sands and Xiao went as low as about 15 million. Historians using local and archival records reached 32.5 million (Cao Shuji, 2005), 36 million (Yang Jisheng, in *Tombstone*, who regards even that figure as conservative), and at least 45 million (Frank Dikötter, *Mao's Great Famine*, 2010), a figure that Felix Wemheuer, Cormac Ó Gráda and others criticise for its method. A few Chinese writers propose under 5 million, figures most demographers reject. Most recent scholarly estimates fall around 30 to 45 million. As the historian Gao Mobo notes, anti-communist writers tend to push the figure up and sympathisers to push it down.

Responsibility is debated too. Dikötter stresses coercion and violence, counting at least 2.5 million people beaten, tortured or summarily killed, and a leadership that knew what was happening. He quotes Mao at a secret meeting in March 1959 saying that it was "better to let half of the people die so that the other half can eat their fill"; but Thomas Bernstein calls the remark hyperbole, and Anthony Garnaut argues that in context Mao was talking about cutting the number of major industrial projects. Others stress policy failure and collective responsibility. Even the weather is disputed: Yang Jisheng found it within the normal range, while Houser and colleagues attribute about 31 per cent of the deaths to weather and 69 per cent to national policy.

The party's own reckoning began at the **Seven Thousand Cadres Conference** in early 1962, where Liu Shaoqi attributed the disaster "30 per cent to natural disasters, 70 per cent to man-made errors". Mao made a self-criticism and stepped back, leaving the economy to Liu and Deng Xiaoping. The famine was officially called the "Three Years of Natural Disasters" until 1981, when the party blamed it mainly on the Leap. The economist Amartya Sen drew a wider lesson: "no substantial famine has ever occurred in a democratic country".

```checkpoint
q: What was new about Mao's argument in the 1927 Hunan Report?
a*: He argued for a revolution based on the poor peasantry and endorsed peasant violence against landlords.
a: He argued that the revolution must be led by the urban industrial workers.
x: That was the orthodox line Mao was challenging; the party's strategy then rested on urban workers.
a: He called for an alliance with Chiang Kai-shek to build capitalism first.
x: The Report championed peasant revolution, and Chiang broke violently with the Communists that same spring.
a: He argued that revolution should be peaceful and gradual.
x: The Report insisted that "revolution is not a dinner party" but "an act of violence".
hint: Think of the "mighty storm" Mao predicted.
why: Placing the peasants at the centre of revolution was the founding move of Maoism, and the idea that later travelled to India and Peru.
---
q: Why do estimates of deaths in the Great Leap famine range from about 15 million to 45 million or more?
a: Because the Chinese government has published an exact count that historians refuse to accept.
x: There is no exact official count; all figures are reconstructions.
a: Because historians disagree about whether there was a famine at all.
x: Scholars accept that a catastrophic famine occurred; even the lowest estimates count millions of deaths.
a*: Because most are estimates of excess deaths that depend on the baseline death rate chosen, on flawed statistics, and on assumptions about migration and registration.
a: Because no records of any kind survive from the Leap years.
x: Records exist, from government grain data to local gazetteers and archives, but they are flawed.
hint: Think about what "excess deaths" means.
why: Different baselines and sources produce different totals, which is why scholars cite ranges and name who gives each figure.
```

## Continuous Revolution and the Cult

In May 1966 Mao launched the **Cultural Revolution**, which lasted until his death in 1976. Putting continuous revolution into practice, he claimed that "bourgeois elements" had infiltrated party and state, told the young that "to rebel is justified", and in August 1966 wrote his own poster, "Bombard the Headquarters", aimed at Liu Shaoqi, who died in 1969 after being denied medicine. Estimates of the dead commonly range from 1 to 2 million; Andrew Walder puts the toll for 1966–71 at 1.1 to 1.6 million, most of it in the campaigns to restore order after the mass movements had ended. Some 17 million urban young people were sent down to the countryside.

The movement ran on a cult rooted at Yan'an. ***Quotations from Chairman Mao***, the "Little Red Book", began in the army under Lin Biao; the definitive 1965 edition held 427 quotations in 33 chapters. Print figures are disputed, but more than a billion official copies were printed in 1966–69 alone, making it the world's most printed book from the mid-1960s to the mid-1970s; higher totals are claims, not settled counts. By May 1967 it was on sale in 117 countries and territories. Lin Biao called Mao's thought "a spiritual atom bomb", more powerful than the material one.

{{image: Quotations from Chairman Mao Tse-tung | The Little Red Book, the most visible icon of Maoism at home and abroad.}}

Beside the book came the **Mao badge**. The first were homemade at Yan'an from toothpaste-tube metal; after Red Guards presented badges to Mao at a rally in August 1966 production exploded, with an estimated 2 to 5 billion made in 1968–71. Wearing one was a test of loyalty, forbidden to "class enemies"; some people pinned them into their own skin. Propaganda **posters** showed nearly every figure holding the Little Red Book. The cult faded after Lin Biao's death in 1971, and in 1979 the party halted the book's publication.

## Global Maoism

Julia Lovell's *Maoism: A Global History* (2019) asks why Maoism is rarely seen as a global story, and stresses that its legacy is still alive. Its spread followed the Sino-Soviet split, described in the chapter on the Global Cold War and the Arms Race, as pro-Chinese parties broke away from pro-Moscow ones around the world. The political scientist Andrew Nathan, reviewing it, saw Mao as often a symbol for activists who did things their own way.

**India.** In 1967 peasants around Naxalbari, in West Bengal, began seizing land from landlords, led by Charu Majumdar, Kanu Sanyal and the Santhal Adivasi leader Jangal Santhal. Police fire killed nine women and a child, and the rising was crushed within months, but the name "Naxalite" spread. Majumdar had the Little Red Book read aloud to illiterate peasants and declared an "annihilation line" of killing individual "class enemies"; he died in police custody in 1972 and the movement splintered. It revived from the 1980s; the Communist Party of India (Maoist) is now banned as a terrorist organisation, and Prime Minister Manmohan Singh called it India's "single biggest internal security challenge". One count gives about 12,000 people killed since 2000, civilians, security forces and Naxalites.

**Peru.** Abimael Guzmán, a philosophy professor in Ayacucho who had visited China for training in 1965 and again during the Cultural Revolution in 1967, founded the **Shining Path** in 1969; followers called him "Presidente Gonzalo". He became convinced that post-Mao China had turned revisionist. The war began in May 1980 with the burning of ballot boxes at Chuschi, and that December dead dogs were hung from Lima lampposts with signs insulting Deng Xiaoping. Peru's Truth and Reconciliation Commission (2003) estimated 69,280 dead or disappeared in 1980–2000 and named the Shining Path the principal perpetrator, statistically responsible for about 46 per cent, with the state responsible for about 37 per cent; a 2019 study put the dead nearer 48,000 and gave the state a larger share. Three-quarters of the dead spoke Quechua or another Indigenous first language. Guzmán was captured in 1992.

**Nepal.** Drawing on the Shining Path's ideas, the Communist Party of Nepal (Maoist) under Pushpa Kamal Dahal, "Prachanda", launched a People's War in 1996. More than 17,000 people died before the peace accord of 2006, and government forces killed about twice as many as the Maoists. Then the Maoists won at the ballot box: they became the largest party in the 2008 Constituent Assembly election, the monarchy was abolished, and Prachanda served three terms as prime minister.

**Cambodia.** The darkest variant was the Khmer Rouge. Pol Pot read Mao in Paris and met him in 1975; China supplied at least 90 per cent of the regime's foreign aid, though the scholar Ciorciari finds it had little influence on Pol Pot's domestic policies. The regime borrowed a peasant base, communal eating and a "Super Great Leap Forward", but fused them with a xenophobic Khmer nationalism; a Khmer Rouge text boasted that Mao's red standard had faded while Cambodia's was "brilliant red". Ben Kiernan judges it neither a workers' nor a peasants' revolution. Between 1.5 and 2 million people died by January 1979, 20 to 25 per cent of the population.

**Africa and the West.** Julius Nyerere's *ujamaa* villages in Tanzania drew on Maoist themes of self-reliance and peasant mobilisation, and China built the TAZARA railway to free Zambian copper from routes through white-ruled Rhodesia and South Africa. In France, Maoism took root among Louis Althusser's students in 1964; after May 1968 Jean-Paul Sartre nominally edited the newspaper of the Maoist Gauche prolétarienne and Michel Foucault was active in its Prison Information Group. In 1974 Julia Kristeva, Roland Barthes and others made a tightly managed tour of China. In the United States, the Black Panthers Bobby Seale and Huey Newton resold the Little Red Book at Berkeley in 1967 to buy guns; every Panther had to study it, and their "serve the people" programmes, such as free breakfasts for children, borrowed Mao's slogan.

```checkpoint
q: According to Peru's Truth and Reconciliation Commission, who was the principal perpetrator of the deaths and disappearances of 1980–2000?
a: The Peruvian armed forces, responsible for nearly all deaths.
x: The commission attributed about 37 per cent to the state, though a 2019 study argues the state's share was larger.
a*: The Shining Path, statistically responsible for about 46 per cent of an estimated 69,280 dead or disappeared.
a: Chinese advisers sent by Beijing.
x: China played no such role; Shining Path sympathisers denounced post-Mao China as revisionist.
a: Nepal's Maoist fighters.
x: Nepal's People's War was fought in Nepal, from 1996 to 2006.
hint: Think of "Presidente Gonzalo".
why: The commission's findings, still debated, made the Shining Path the deadliest actor in a war whose victims were mostly rural Indigenous-language speakers.
---
q: What made Nepal's Maoists unusual among the movements in this chapter?
a: They never used violence.
x: They fought a People's War from 1996 to 2006 in which more than 17,000 people died.
a: They were directly commanded by Mao.
x: Their war began in 1996, twenty years after Mao's death, and drew on the Shining Path's ideas.
a: They restored the Nepalese monarchy.
x: The monarchy was abolished after the war.
a*: After a decade of war they became the largest party in the 2008 election, and their leader Prachanda became prime minister.
hint: Think of what happened after the 2006 peace accord.
why: Nepal shows a Maoist insurgency turning into a governing party, a very different ending from Peru's or Cambodia's.
```

## The Afterlife: Deng's and Xi's China

After Mao's death the party had to decide what to do with him. Its answer was the **1981 Resolution** on party history, drafted over some fifteen months and repeatedly revised to Deng Xiaoping's views. It declared that "chief responsibility" for the "grave 'Left' error" of the Cultural Revolution "does indeed lie with Comrade Mao Zedong", criticised the personality cult, and confirmed the 1980 rehabilitation of Liu Shaoqi. Yet it insisted that Mao's contributions far outweighed his mistakes: "His merits are primary and his errors secondary." The shorthand that Mao was "70 per cent right and 30 per cent wrong", usually credited to Deng and echoing a ratio the party had applied to Stalin in 1956, is not in the Resolution's text, but became its popular summary. It should not be confused with Liu Shaoqi's 1962 verdict on the famine.

Deng redefined the "true spirit" of Mao Zedong Thought as "seek truth from facts", separating the fallible man from the doctrine, which remained one of the party's Four Cardinal Principles. As the historian Matthew Galway puts it, the party did not de-Maoise but reassessed Mao's legacy. The veteran leader Chen Yun summed up the ambivalence:

```quote
Had Mao died in 1956, his achievements would have been immortal. Had he died in 1966, he would still have been a great man but flawed. But he died in 1976. Alas, what can one say?
Chen Yun · remark on Mao's legacy
```

Mao never left. A 2013 *Global Times* poll found about 85 per cent of respondents felt his achievements outweighed his mistakes, and nostalgia for Mao-era equality has grown among poorer Chinese. Bo Xilai revived "red songs" and mass mobilisation in Chongqing. Xi Jinping has summarised Mao Zedong Thought as seeking truth from facts, the mass line and independence; the party's third historical resolution, in 2021, hailed Xi's own Thought as a new breakthrough in adapting Marxism to China while largely echoing the 1981 verdict on Mao. Lovell argues that since 2012 the party has brought back parts of Maoist political culture, among them criticism and self-criticism, the mass line and the personality cult. In China as abroad, Maoism's story is not over.

## Further exploration

- **Julia Lovell, *Maoism: A Global History* (2019).** The global story, from Yan'an to Peru, India, Nepal, Africa and the West; winner of the Cundill History Prize.
- **Yang Jisheng, *Tombstone: The Great Chinese Famine, 1958–1962* (2008; English trans. 2012).** A veteran journalist's archive-based account of the famine that killed the uncle who raised him as a father.
- **Frank Dikötter, *Mao's Great Famine: The History of China's Most Devastating Catastrophe, 1958–62* (2010).** An archive-based history with a high and much-debated death toll.
- **Gao Hua, *How the Red Sun Rose: The Origins and Development of the Yan'an Rectification Movement, 1930–1945* (2000; English trans. 2018).** A Chinese historian's classic on how Mao built his power and cult.
- **Alexander C. Cook (ed.), *Mao's Little Red Book: A Global History* (2014).** Essays on the book's reception from China to Africa, India and the United States.
- **Alpa Shah, *Nightmarch: Among India's Revolutionary Guerrillas* (2018).** An anthropologist's account of walking with the Naxalites.
- **Edgar Snow, *Red Star Over China* (1937).** The book that made Mao known to the world, to be read critically.$mn_maoism_master$,
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
  select $mn_maoism_quiz$[
    {"type": "mcq", "prompt": "What did the 'mass line' ask of Communist leaders?", "options": ["To gather the scattered ideas of the masses, concentrate them through Marxist analysis, and return them to the masses as policy", "To follow the instructions of the Soviet Communist Party without question", "To recruit only urban industrial workers into the party", "To hold competitive multi-party elections in the base areas"], "answerIndex": 0, "explanation": "The mass line, 'from the masses, to the masses', set out in a 1943 Central Committee resolution, described a repeated cycle of gathering ideas from the masses and returning them as policy; its slogan was 'Serve the People'.", "id": "q1"},
    {"type": "mcq", "prompt": "At the Seven Thousand Cadres Conference of 1962, how did Liu Shaoqi apportion blame for the Great Leap disaster?", "options": ["70 per cent to natural disasters, 30 per cent to human error", "Entirely to the Soviet withdrawal of aid", "30 per cent to natural disasters, 70 per cent to man-made errors", "70 per cent of Mao's record right and 30 per cent wrong"], "answerIndex": 2, "explanation": "Liu attributed the disaster 30 per cent to nature and 70 per cent to man-made errors. This is distinct from the later shorthand that Mao was '70 per cent right and 30 per cent wrong', which does not appear in the 1981 Resolution.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the 1981 Resolution on party history is accurate?", "options": ["It declared that Mao was exactly 70 per cent right and 30 per cent wrong", "It removed Mao Zedong Thought from the party's guiding principles", "It praised the Cultural Revolution as Mao's greatest achievement", "It placed chief responsibility for the Cultural Revolution on Mao but judged that his merits were primary and his errors secondary"], "answerIndex": 3, "explanation": "The Resolution blamed Mao chiefly for the 'grave Left error' of the Cultural Revolution yet held that 'his merits are primary and his errors secondary'; Mao Zedong Thought stayed among the Four Cardinal Principles, and the 70/30 formula is a popular summary, not its text.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these is true of the Khmer Rouge's relationship with Maoism?", "options": ["China was its main foreign patron, but scholars such as Ciorciari find China had little influence on its domestic policies", "It rejected all Chinese aid and was backed only by the Soviet Union", "It was founded by Mao during the Long March", "Its leaders denounced the idea of a Great Leap Forward"], "answerIndex": 0, "explanation": "China supplied at least 90 per cent of the regime's foreign aid, and the regime borrowed Maoist themes such as a 'Super Great Leap Forward', but fused them with xenophobic nationalism; historians debate how Maoist it was.", "id": "q4"},
    {"type": "open", "prompt": "Explain why estimates of deaths in the Great Leap famine differ so widely, naming at least three scholars and their figures.", "rubric": "A strong answer explains that most figures are estimates of excess deaths depending on the baseline death rate, flawed statistics and assumptions about migration and registration. It cites figures with their authors, e.g. Coale 27 million, Banister or Ashton et al. about 30 million, Cao Shuji 32.5 million, Yang Jisheng 36 million, Dikötter at least 45 million, lower estimates around 15 million (Chinese Academy of Sciences; Houser, Sands and Xiao). It notes that most recent scholarly estimates fall around 30–45 million, that very low figures under 5 million are rejected by most demographers, and that Dikötter's method has been criticised. Better answers mention Gao Mobo's point about political bias in either direction.", "id": "q5"},
    {"type": "open", "prompt": "Julia Lovell argues that Maoism is neither only a story of China nor only a story of the past. Assess this claim using at least two movements outside China and the debate over her argument.", "rubric": "A strong answer uses examples such as India's Naxalites (Naxalbari 1967, Majumdar's 'annihilation line', the CPI (Maoist) today), Peru's Shining Path (Guzmán, the TRC's 69,280 estimate and the 2019 dissent), Nepal's Maoists (People's War 1996–2006, then electoral power), the Khmer Rouge, Tanzania's ujamaa or Western intellectuals and the Black Panthers. It weighs Lovell's case against reviewers such as Andrew Nathan, who saw Mao as often a symbol for movements that did things their own way. Better answers also consider Maoism's afterlife in Xi's China, where Lovell sees a revival of the cult, the mass line and self-criticism.", "id": "q6"}
  ]$mn_maoism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/maoism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
