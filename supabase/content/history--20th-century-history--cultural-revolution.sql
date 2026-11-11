-- The Cultural Revolution — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-cultural-revolution @ research/advanced/read.
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
    'history/20th-century-history/the-cultural-revolution',
    'research',
    'advanced',
    'read',
    $mn_cultrev_master$> **A decade of upheaval, and a long silence.** Between 1966 and 1976 Mao Zedong turned China's young people against the party he led. Red Guards put up big-character posters, dragged teachers and officials through struggle sessions and set out to smash the "Four Olds"; the head of state, Liu Shaoqi, died in custody. Factional fighting grew into armed civil war, and the army's restoration of order killed more people than the chaos it ended. Some 17 million urban youths were sent to the countryside, Mao's designated successor Lin Biao died in a plane crash in 1971, and the decade ended with Mao's death and the arrest of the "Gang of Four" in 1976. This chapter follows that story, the debates over who killed and how many died, the party's verdict of 1981, and how memory of the decade is managed and suppressed in China today.

## Why Mao Struck

The Cultural Revolution grew out of the disaster that preceded it. Mao's Great Leap Forward had ended in famine, and at the Seven Thousand Cadres Conference in January 1962 he made a rare self-criticism, saying that "the person primarily responsible should be me". He insisted at the same time that class struggle continued throughout the socialist stage. Afterwards Mao took a back seat in economic matters while the head of state, **Liu Shaoqi**, led the recovery.

Abroad, China had broken with the Soviet Union, as the chapter on the global Cold War describes. Mao regarded Khrushchev as a "revisionist" after his denunciation of Stalin in 1956, and from 1963 the Chinese party published nine polemics against Moscow.

The opening shot was literary. On 10 November 1965 a Shanghai newspaper published an attack by **Yao Wenyuan**, secretly commissioned by Mao through his wife, **Jiang Qing**, on Wu Han's play *Hai Rui Dismissed from Office*, read as an allegory of the dismissal of Peng Dehuai. When Peng Zhen's "Five Man Group" tried to keep the debate "academic", Mao denounced it.

Historians still argue about what Mao wanted: whether the movement was chiefly ideological, a struggle for power after the Leap had weakened him, or both, with the split with Moscow serving as its justification.

## The Launch, May to August 1966

The movement is usually dated from the **16 May Notification** of 1966, issued at an expanded Politburo meeting. Prepared under Mao's supervision, it dissolved Peng Zhen's group, condemned Peng, and created a new Cultural Revolution Group to direct the campaign. It was kept secret for a year.

```quote
Those representatives of the bourgeoisie who have sneaked into the Party, the government, the army, and various spheres of culture are a bunch of counter-revolutionary revisionists.
Communist Party of China · The 16 May Notification · 1966
```

On 25 May Nie Yuanzi, a party official at Peking University, put her name first on a **big-character poster**, a handwritten wall sheet, attacking the university's president. Mao had it broadcast across the country and called it China's first Marxist big-character poster. At the same time students at the middle school attached to Tsinghua University began signing their posters as **Red Guards**; Mao wrote them a letter of support on 1 August. Classes were suspended across the country. Liu Shaoqi and Deng Xiaoping sent "work teams" into the schools, but Mao ordered them withdrawn on 24 July.

At a party plenum in August, Mao wrote his own poster, "Bombard the Headquarters", universally understood as an attack on Liu and Deng. Lin Biao became the party's number two, and Liu fell from second to eighth place. The plenum's "Sixteen Points" of 8 August called for a revolution "that touches people to their very souls" and aimed to overthrow "those persons in authority who are taking the capitalist road". A slogan summed up the mood: "to rebel is justified".

On 18 August more than a million Red Guards packed Tiananmen Square and the streets around it. Mao wore army uniform, and a student, Song Binbin, pinned a Red Guard armband on his sleeve. It was the first of eight rallies between August and November that drew about 12 million people in all. Red Guards were given free travel, food and lodging to "exchange revolutionary experience" across the country, carrying *Quotations from Chairman Mao*, the Little Red Book.

{{image: Cultural Revolution | A propaganda poster of the Cultural Revolution, showing Mao Zedong above soldiers of the People's Liberation Army.}}

## Red August: Teachers, Writers and the "Four Olds"

The violence began in the schools. On 5 August 1966 **Bian Zhongyun**, deputy principal of the Girls' Middle School attached to Beijing Normal University, was subjected to a struggle session by her own students, beaten with nail-studded clubs, and left in a rubbish cart; she died that day, the first educator killed by Red Guards in Beijing. Song Binbin led the school's Red Guards but denied taking part; in January 2014 she apologised publicly at the school; Bian's widower, Wang Jingyao, rejected the apology as hypocritical.

On 22 August Mao approved a security ministry document forbidding police to intervene against student movements. In what became known as **Red August**, Red Guards beat, robbed and killed across Beijing. Official figures published in 1980 counted 1,772 people killed in August and September 1966; figures published in 1985 gave 10,275 dead. In the Daxing massacre, in late August, 325 people aged from 80 years to 38 days were killed. The targets were above all the **Five Black Categories**: landlords, rich peasants, counter-revolutionaries, "bad elements" and rightists.

The **struggle session** was the movement's signature ritual: a public denunciation, often by the victim's colleagues, students, spouse or children, that could end in beating or death. Researchers estimate that 100,000 to 200,000 people took their own lives in the early years of the movement. The novelist **Lao She**, author of *Rickshaw Boy* and *Teahouse*, was paraded and beaten by Red Guards and found drowned in Taiping Lake on 24 August 1966; the official record says suicide, though Leo Ou-fan Lee has raised the possibility of murder. Intellectuals were labelled the "Stinking Old Ninth"; the later prosecution of the Gang of Four counted 142,000 cadres and teachers persecuted in education alone. Schools closed; most universities did not reopen until 1972, admitting "worker-peasant-soldier students" by recommendation, and the national entrance examination was not restored until 1977.

Lin Biao had endorsed the destruction of the **Four Olds**, old ideas, old culture, old customs and old habits, at the August rally. Streets and people were renamed, and Chinese New Year celebrations were banned. Of 6,843 cultural sites protected in Beijing, 4,922 were damaged or destroyed. In November 1966 Red Guards from Beijing Normal University attacked the Temple and Cemetery of Confucius at Qufu, and during the Cultural Revolution the corpse of the 76th-generation descendant of Confucius was dug up and hung from a tree. Temples, churches, mosques and monasteries were closed, looted or turned to other uses, and public Christian worship was banned.

```checkpoint
q: What did Red Guards mean by smashing the "Four Olds"?
a*: Attacking old ideas, old culture, old customs and old habits, which led to renaming, bans on festivals and the destruction of temples, books and heritage sites.
a: Removing four elderly leaders from the Politburo.
x: The Four Olds were categories of culture, not people; the leaders who fell, such as Liu Shaoqi, were attacked as "capitalist roaders".
a: Closing the four oldest universities in Beijing.
x: Schools and universities across the whole country were closed, not just four.
a: Abolishing the four Soviet-style five-year plans.
x: The campaign was aimed at traditional Chinese culture, not at economic planning.
hint: Think of what happened at Qufu and to Beijing's protected sites.
why: The campaign against the Four Olds turned a political purge into an assault on China's cultural heritage and on the people who embodied it.
---
q: Why was Bian Zhongyun's death in August 1966 significant?
a: She was the first senior party leader to die in the Cultural Revolution.
x: She was a school deputy principal, not a party leader; Liu Shaoqi died in 1969.
a: She was killed by the army during the restoration of order.
x: She was killed by Red Guards, her own students, two years before the army restored order.
a*: She was the first educator in Beijing killed by Red Guards, beaten to death by her own students.
a: Her death led the party to ban struggle sessions at once.
x: The violence grew: later that month Mao approved a document forbidding police to intervene against students.
hint: Who killed her, and what was her job?
why: Her killing marked the turn from denunciation to lethal violence against teachers, which spread through Red August.
```

## The Fall of Liu Shaoqi and Deng Xiaoping

In October 1966 Liu and Deng were identified with a "bourgeois reactionary line" and made self-criticisms; in December Jiang Qing called Liu "the Khrushchev of the Party", and from January posters denounced him as "China's Khrushchev". On 3 January 1967 Liu and his wife, Wang Guangmei, faced their first struggle session in the leadership compound of Zhongnanhai, where Liu held up the state constitution and protested his rights as head of state. In October 1968 a party plenum expelled him "forever" as a "traitor, spy and scab"; by then 71 per cent of the Central Committee had been similarly labelled. Gravely ill, Liu was flown to Kaifeng in October 1969 and died there on 12 November, cremated in secret under a false name. He had told his family that, fortunately, history is written by the people. Wang Guangmei spent twelve years in prison.

Deng, denounced as the "number two capitalist roader", was sent in 1969 to work as a fitter at a tractor factory in Jiangxi. His son Deng Pufang, held by Red Guards at Peking University, fell or was thrown from an upper-floor window in 1968 and was left paraplegic. Peng Dehuai was seized by Red Guards, repeatedly struggled and beaten, and died in custody in 1974; He Long died in custody in 1969, after medicine for his diabetes had been withheld. Others resisted from below: Zhang Zhixin, a party member who criticised the cult of Mao and the case against Liu, was imprisoned and executed in 1975.

## Power Seizures and Civil War, 1967 to 1968

In January 1967 rebels in Shanghai, among them the young worker **Wang Hongwen**, backed by Zhang Chunqiao and Yao Wenyuan, overthrew the city government. Within three weeks 24 more provincial-level governments had fallen, to be replaced by "revolutionary committees". But the rebels split into rival factions, each claiming to be the true followers of Mao, and the army, ordered in January 1967 to "support the left", was drawn into their quarrels.

The crisis came at **Wuhan** in July 1967. A conservative mass organisation, the "Million Heroes", backed by the regional military commander Chen Zaidao, seized two envoys of the Cultural Revolution Group and beat one of them, Wang Li, while Mao himself was secretly in the city; Mao was flown out to Shanghai. It was the first time military leaders had defied orders from the centre, and across the province some 184,000 people were seized, beaten, maimed or killed. Jiang Qing's slogan "attack with words, defend with weapons" was taken as a licence for armed struggle. Millions of firearms passed into civilian hands, and tanks and warships were used in fighting in Chongqing, Xiamen and Changchun. Violent factional struggles are estimated to have killed 300,000 to 500,000 people.

In July 1968 Mao ended the Red Guard era. A workers' propaganda team marched into Tsinghua University to stop the campus fighting, and the next day Mao met five Beijing Red Guard leaders and told them: "The Black Hand is nobody else but me!" The order that followed was deadlier than the disorder. In the campaign to "cleanse the class ranks" of 1968–69, at least 500,000 people died. Andrew Walder concludes that casualties peaked not in the insurgency of 1967 but in the restoration of order in 1968: "The cure for factional warfare was far worse than the disease."

## Massacres and Minorities

The worst killing took place in the countryside. In **Guangxi**, in 1967–68, lynchings and massacres accompanied a factional war that ended in the summer of 1968, when regular troops attacked Nanning and Guilin. An official investigation of 1984 counted 89,810 documented abnormal deaths and nearly 20,000 missing, "over 100,000" in all; other estimates run from about 70,000 to 150,000, and some private claims reach 500,000. The official archives record at least 302 victims of cannibalism, and independent researchers have named 421. In and around Dao County in Hunan, 7,696 people were killed and 1,397 driven to suicide in about two months in 1967.

Historians disagree about who was responsible. Walder sees the Guangxi killings as a "regional civil war" organised through the militia and the military command, and argues that most deaths in the whole movement came from state repression restoring order. Yang Su proposes instead a "community model", in which local communities did the killing under indirect pressure from the state.

Ethnic minorities suffered particularly. In **Inner Mongolia** a purge of a supposed "Inner Mongolian People's Revolutionary Party" in 1967–69 led, by official figures of 1980, to 346,000 arrests, three-quarters of them Mongols, and 16,222 deaths; other estimates of the dead range from about 20,000 to nearly 100,000. In **Tibet**, where destruction had begun after 1959, Red Guards arrived in late 1966, rival factions fought, and according to the Tibetan government-in-exile, only about eight of more than 6,000 monasteries remained by 1976. Wang Lixiong stresses Tibetan participation; Tsering Shakya replies that this view rests on colonial assumptions and ignores Tibetan resistance. In Yunnan in 1975 the army killed more than 1,600 Hui Muslims in the Shadian incident.

## The Sent-Down Youth

On 22 December 1968 the *People's Daily* published Mao's instruction that urban young people should go to the villages to be re-educated by poor peasants. Some 17 million urban youths were sent down over the life of the movement, most of them after 1968; the policy ended in 1978. The policy served ideological re-education, dispersed the Red Guards from the cities and eased urban unemployment; the sent-down have been called China's "lost generation". Sexual violence against sent-down women has been documented by Pan Suiming, Emily Honig and others. The policy ended in 1978, and mass protests, notably in Xishuangbanna, led the government to let the young people return in early 1979. Among those sent down was **Xi Jinping**, whose father had been purged; from 1969 he lived for about seven years in a cave dwelling in Liangjiahe, in Shaanxi.

## Lin Biao's Fall

At the Ninth Party Congress in April 1969, Lin Biao was written into the party constitution as Mao's "closest comrade-in-arms and successor". Relations soured after border clashes with the Soviet Union in 1969 and a quarrel in 1970 over restoring the post of state chairman. A coup outline known as "Project 571", a homophone for "armed uprising", was attributed to Lin's son, Lin Liguo, an air force officer; whether Lin himself was involved is disputed.

On **13 September 1971** an aircraft carrying Lin, his wife Ye Qun and their son crashed near Öndörkhaan in Mongolia, killing all nine on board. The official version holds that Lin was fleeing to the Soviet Union after a failed plot and that the plane ran out of fuel. A Soviet investigation confirmed Lin's death but found that the aircraft had enough fuel, and a Western investigation in 1994 found the plane flying away from the Soviet Union when it crashed. The news was withheld from the public for months, and the fall of Mao's own chosen successor bred disillusionment and damaged Mao's authority.

## The Gang of Four and the End

The radicals Jiang Qing, Zhang Chunqiao, Yao Wenyuan and Wang Hongwen, later called the **Gang of Four**, now contended with the premier, Zhou Enlai. Nixon visited China in 1972; a campaign to "Criticise Lin, Criticise Confucius" from 1973 was partly aimed at Zhou. Deng returned as vice-premier in 1973 and ran the government from 1975, until he was attacked again late that year.

Zhou died on 8 January 1976. At the Qingming festival in early April, mourners laid wreaths and poems at the Monument to the People's Heroes in Tiananmen Square, perhaps up to two million on 4 April alone. When the tributes were removed overnight, protest turned to riot on 5 April, and the square was cleared that night by militia and security forces. Deng was blamed and stripped of all his posts. Mao died on 9 September 1976. On 6 October Hua Guofeng, with Ye Jianying and Wang Dongxing, had the Gang of Four arrested in a bloodless coup; the arrests are usually taken as the end of the Cultural Revolution.

## Verdicts: The Trial and the 1981 Resolution

Deng was back by July 1977, and the Third Plenum of December 1978 began the era of reform and opening; more than 3 million "unjust, false and erroneous" cases were redressed, and Liu Shaoqi was rehabilitated in 1980. In a televised trial from November 1980 to January 1981, the Gang of Four were charged with persecuting about 730,000 to 750,000 people, some 34,000 of whom died (the two figures appear in different accounts of the indictment). Jiang Qing, defiant, conducted her own defence, insisting that she had obeyed Mao. She and Zhang Chunqiao were sentenced to death with a two-year reprieve, later commuted to life; Jiang killed herself in 1991.

On 27 June 1981 the Central Committee unanimously adopted a resolution on party history, drafted under Hu Qiaomu and steered by Deng. It called the Cultural Revolution "responsible for the most severe setback and the heaviest losses suffered by the Party, the country, and the people since the founding of the People's Republic".

```quote
Chief responsibility for the grave 'Left' error of the 'Cultural Revolution,' an error comprehensive in magnitude and protracted in duration, does indeed lie with Comrade Mao Zedong.
Central Committee of the Communist Party of China · Resolution on Certain Questions in the History of Our Party · 1981
```

Yet the resolution also loaded blame onto the "counter-revolutionary cliques" of Lin Biao and Jiang Qing and judged that Mao's merits were primary and his errors secondary. The often-quoted formula "70 per cent right, 30 per cent wrong" is commonly attributed to Deng but does not appear in the text. A third historical resolution in 2021 again called the decade a catastrophe for which Mao was responsible, though some observers noted how lightly it treated the period.

```checkpoint
q: What did the party's 1981 resolution say about Mao and the Cultural Revolution?
a: That the Cultural Revolution had been a success, betrayed only by Lin Biao.
x: The resolution called it the most severe setback since 1949.
a*: That chief responsibility lay with Mao, while also blaming the Lin Biao and Jiang Qing cliques and judging Mao's merits primary and his errors secondary.
a: That Mao was "70 per cent right, 30 per cent wrong", in exactly those words.
x: That formula is commonly attributed to Deng Xiaoping but does not appear in the resolution's text.
a: That Mao bore no responsibility, since the Gang of Four had deceived him.
x: The resolution stated that chief responsibility lay with Mao himself.
hint: The resolution both condemned and protected.
why: The resolution condemned the decade while preserving Mao as a founding symbol of the party's legitimacy.
---
q: According to Andrew Walder, when did the killing peak, and why?
a: In 1966, during Red August, because Red Guards were free from police control.
x: Red August was lethal, but Walder finds the casualties peaked later.
a: In 1971, after the Lin Biao affair.
x: Walder places the peak during the restoration of order in 1968, before Lin's fall.
a: In 1976, during the Tiananmen protests.
x: The April 1976 incident was suppressed, but it was not the period of mass killing.
a*: In 1968, when the army and state restored order; most deaths came from repression rather than from rebel insurgents.
hint: Remember his phrase about the cure and the disease.
why: Walder's research shifts responsibility from unruly youths to the organised power of the state and army.
```

## Counting the Dead

There is no agreed death toll. Andrew Walder and Yang Su, working from 1,520 county annals in 2003, estimated 750,000 to 1.5 million deaths in rural China and a similar number permanently injured, with about 36 million people politically persecuted. Walder later read 2,213 county annals and estimated 1.1 to 1.6 million deaths for 1966–71, about a quarter caused by insurgents and most by state repression. A 1996 party-history book, citing internal investigations of 1978 and 1984 that no other official source mentions, gives 1.728 million "unnatural deaths". An AFP estimate of 1979 gave 400,000, and Maurice Meisner judged it unlikely that the true figure was lower; Ding Shu put the figure at 2 million; R. J. Rummel's 7.73 million includes deaths in labour camps and lies far above most scholarly estimates. Most scholarly estimates lie between hundreds of thousands and about 2 million.

## Memory Managed

**Scar literature**, named after Lu Xinhua's story "Scar" of 1978, described its wounds. The writer Ba Jin called for a Cultural Revolution museum. A former vice-mayor of Shantou, Peng Qi'an, himself struggled at least thirty times, opened a private museum in 2005, the only one on the mainland, with the 1981 verdict inscribed at its entrance; state media ignored it, and in 2016, ahead of the fiftieth anniversary, it was closed and covered up. On that anniversary the official press stayed almost silent until a *People's Daily* commentary reaffirmed the 1981 verdict that the decade was wrong in theory and in practice, and said it could never be repeated.

Under Xi Jinping, who has said that the eras before and after reform cannot be used to negate each other, criticism of the party's past is attacked as "historical nihilism", and independent discussion of the Cultural Revolution is censored in universities and online. A new school history textbook of 2018 retitled its chapter on the decade "Arduous Exploration and Development Achievements"; the publisher denied removing the content. Remembrance continues at the edges. **Wang Youqin**, an alumna of Bian Zhongyun's school, interviewed about 1,000 people to record victims one by one; her online memorial was blocked in China in 2002. Memory is also divided. In one online survey by Tencent of 2012, 78 per cent expressed nostalgia for the era, and the scholar Gao Mobo argues that rural workers gained from barefoot doctors and village schools. Most historians, however, see the decade as a disaster, and the struggle over how the decade may be remembered has become part of its history.

## Further exploration

- **Roderick MacFarquhar and Michael Schoenhals, *Mao's Last Revolution* (2006).** The standard history of the decade's elite politics.
- **Frank Dikötter, *The Cultural Revolution: A People's History, 1962–1976* (2016).** An archival social history, the third volume of his People's Trilogy.
- **Yang Jisheng, *The World Turned Upside Down: A History of the Chinese Cultural Revolution* (2021).** A mainland Chinese journalist's history, translated by Stacy Mosher and Guo Jian.
- **Andrew G. Walder, *Agents of Disorder: Inside China's Cultural Revolution* (2019).** How the state collapsed from within, and how its restoration killed.
- **Yang Su, *Collective Killings in Rural China during the Cultural Revolution* (2011).** The rural massacres of Guangxi and Guangdong.
- **Wang Youqin, *Victims of the Cultural Revolution: Testimonies of China's Tragedy* (2023).** A victim-by-victim memorial built from hundreds of interviews.
- **Tania Branigan, *Red Memory: Living, Remembering and Forgetting China's Cultural Revolution* (2023).** How the decade is remembered and forgotten in China today.$mn_cultrev_master$,
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
  select $mn_cultrev_quiz$[
    {"type": "mcq", "prompt": "Which document, issued at an expanded Politburo meeting and prepared under Mao's supervision, is usually treated as the start of the Cultural Revolution?", "options": ["The 16 May Notification of 1966", "The Sixteen Points of August 1966", "The February Outline of 1966", "The 1981 Resolution on party history"], "answerIndex": 0, "explanation": "The 16 May Notification dissolved Peng Zhen's group, created the Cultural Revolution Group and warned of 'counter-revolutionary revisionists' inside the party. The Sixteen Points came in August; the February Outline was Peng Zhen's attempt to keep the debate academic.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened to Liu Shaoqi, China's head of state when the Cultural Revolution began?", "options": ["He fled abroad and died in exile", "He was sent down to a village in Shaanxi", "He was struggled, expelled from the party 'forever' in 1968, and died in custody in Kaifeng in 1969", "He was tried with the Gang of Four in 1980"], "answerIndex": 2, "explanation": "Attacked as 'China's Khrushchev', Liu faced struggle sessions from January 1967, was expelled in October 1968, and died gravely ill in Kaifeng on 12 November 1969, cremated under a false name. He was rehabilitated in 1980.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the official version of Lin Biao's death in September 1971, and how has it been questioned?", "options": ["He was executed after a trial; critics say the trial was secret", "He died of illness in Beijing; critics say he was poisoned", "He was killed by Red Guards; critics say the army was responsible", "He was fleeing to the Soviet Union after a failed plot when his plane ran out of fuel; a Soviet investigation found enough fuel, and a 1994 investigation found the plane flying away from the USSR"], "answerIndex": 3, "explanation": "The plane crashed near Öndörkhaan in Mongolia, killing all nine on board. The official account of a coup and flight is disputed, including whether Lin himself was involved in 'Project 571'.", "id": "q3"},
    {"type": "mcq", "prompt": "Which range do most scholarly estimates of the Cultural Revolution's death toll fall within?", "options": ["Fewer than 10,000", "Between hundreds of thousands and about 2 million", "Around 7.7 million, as R. J. Rummel argued", "About 20 million"], "answerIndex": 1, "explanation": "Walder and Su estimated 750,000 to 1.5 million rural deaths; Walder later estimated 1.1 to 1.6 million for 1966–71. Higher figures such as Rummel's 7.73 million lie far above most scholarly estimates.", "id": "q4"},
    {"type": "open", "prompt": "Historians disagree about who carried out most of the killing in the Cultural Revolution. Explain the main positions and the evidence behind them.", "rubric": "A strong answer distinguishes the Red Guard violence of 1966 (Red August, struggle sessions, the killing of Bian Zhongyun) from the later and deadlier violence of 1967–71; presents Andrew Walder's argument, from thousands of county annals, that casualties peaked in the 1968 restoration of order and that most deaths came from state repression, with insurgents responsible for about a quarter ('the cure ... was far worse than the disease'); notes his view of Guangxi as a 'regional civil war' organised through the militia and military command; contrasts Yang Su's 'community model' of local communities killing under indirect state pressure; and may mention campaigns such as Cleansing the Class Ranks (at least 500,000 deaths) and the massacres in Guangxi, Dao County or Inner Mongolia.", "id": "q5"},
    {"type": "open", "prompt": "How has the Chinese Communist Party handled the memory of the Cultural Revolution since 1976?", "rubric": "A strong answer explains the 1981 Resolution: it placed chief responsibility on Mao and called the decade the most severe setback since 1949, but also blamed the Lin Biao and Jiang Qing cliques and judged Mao's merits primary and errors secondary; mentions the televised trial of the Gang of Four and the redress of over 3 million cases; describes later management of memory, such as the closure of the Shantou museum in 2016, near-silence at the fiftieth anniversary, the 2018 textbook retitling, and the campaign against 'historical nihilism' under Xi Jinping; and notes efforts to remember from below, such as scar literature, Ba Jin's call for a museum, Wang Youqin's victim records (blocked online in China) and Song Binbin's 2014 apology, as well as signs of nostalgia and arguments such as Gao Mobo's.", "id": "q6"}
  ]$mn_cultrev_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-cultural-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
