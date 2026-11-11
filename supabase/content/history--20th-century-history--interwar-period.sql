-- The Interwar Period — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/the-interwar-period @ research/advanced/read.
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
    'history/20th-century-history/the-interwar-period',
    'research',
    'advanced',
    'read',
    $mn_interwar_master$> **Twenty years between two wars.** The peace of 1919 promised a world governed by law, with a League of Nations to keep the peace and "advanced nations" to guide colonies towards self-rule. Within two decades that order had collapsed. This chapter follows the League and its mandates; the Depression that began with the 1929 Crash, felt as sharply in Chile, the Congo and Burma as on Wall Street; Mussolini's fascism; anticolonial movements from India to the Black Atlantic; women's struggle for the vote; Ethiopia and Spain; and the argument over appeasement and the slide into a second world war.

## A League for a New World

The peace treaties of 1919 are the subject of the chapter on the First World War; this chapter begins where they left off. The **League of Nations** was founded on 10 January 1920, with its Secretariat in Geneva. The United States never joined: Senate Republicans under Henry Cabot Lodge insisted that only Congress could take the country to war.

The League was not just a European club. China, Japan, Siam and Liberia were early members, as was India, though India was ruled by Britain. Ethiopia joined in 1923 after its regent, Ras Tafari (later the Emperor Haile Selassie), promised to eradicate slavery; Iraq joined in 1932, and Egypt in 1937, the last state ever to join.

It settled several disputes in the 1920s, and its humanitarian work lasted: Fridtjof Nansen's refugee commission helped some 425,000 prisoners of war home and created the "Nansen passport" for stateless people, and in 1930 a League-backed commission exposed slavery and forced labour in Liberia, after which the president resigned. Historians such as Patricia Clavin and Susan Pedersen now stress this legacy, even though the League failed in its central purpose.

## Mandates: Trusteeship or Empire?

Article 22 of the League Covenant placed former Ottoman and German territories under a **mandate system**, describing their peoples as "not yet able to stand by themselves under the strenuous conditions of the modern world" and their care as a "sacred trust of civilisation". They ranged from Syria, Palestine and Iraq to Tanganyika, South West Africa and Western Samoa. Fourteen mandates were shared among Britain, France, Belgium, South Africa, Australia, New Zealand and Japan. No deadline for independence was set, and only Iraq became independent before the Second World War.

Was this a new order or the old empire renamed? Pedersen argues that rule in the mandates differed little from colonial rule elsewhere; what changed was how the powers had to speak about it. The Permanent Mandates Commission had no executive power, but it received petitions from Syrians, Western Samoans and others, which rarely won redress but gave colonised peoples an international stage. Adom Getachew argues that interwar internationalism built racial hierarchy into the world order, and that anticolonial thinkers answered with projects of their own.

The "guided" peoples often resisted by force. In 1920 Sunnis and Shias in Iraq rose together against British rule. The Great Syrian Revolt of 1925–1927, led by the Druze leader Sultan al-Atrash, fought French rule, and in Morocco the Rif War of 1921–1926 pitted Berber tribes against Spain and, from 1924, France. In Palestine the Great Revolt of 1936–1939, which began with a six-month general strike, demanded independence and an end to British support for Zionist immigration and land purchase. The historian Walid Khalidi counted 5,032 Arab dead, 3,832 of them killed by the British. The revolt is credited with forcing the White Paper of 1939, which promised a binational state within ten years.

## From Recovery to Crash

The mid-1920s brought a fragile recovery. The Dawes Plan of 1924 rescheduled German reparations and lent Germany money to stabilise its currency, buying a brief recovery at the price of heavy dependence on foreign capital. In the United States it was the "Jazz Age", a phrase F. Scott Fitzgerald popularised, and the time of the Harlem Renaissance, an African American cultural flowering.

Then came the Crash. On Black Thursday, 24 October 1929, the New York market lost 11 per cent at the opening bell, and on 28 and 29 October the Dow Jones index fell by nearly 13 and nearly 12 per cent. Between 1929 and 1932 world output fell by an estimated 15 per cent and international trade by more than half. By 1933 a quarter of American workers were unemployed. The Smoot–Hawley Tariff of 1930 raised duties on over 20,000 imported goods, despite a petition from more than a thousand economists, and provoked retaliation; in 1931 the collapse of Vienna's Creditanstalt bank spread the crisis across Europe.

Economists still argue about causes. Monetarists, following Milton Friedman and Anna Schwartz, blame the Federal Reserve for letting the money supply collapse; in 2002 Ben Bernanke told them: "Regarding the Great Depression, you're right. We did it." Keynesians stress a collapse of demand. Barry Eichengreen and others show that the gold standard spread the slump, and that the earlier a country left gold, the sooner it recovered. Charles Kindleberger blamed the lack of any power able and willing to stabilise the system: in his own words, "In 1929, the British couldn't and the United States wouldn't."

## The Depression Beyond the West

The slump struck hardest where economies sold raw materials, and crop prices fell by up to 60 per cent. League reports named Chile among the worst hit: copper and nitrates supplied 80 per cent of government revenue, and exports fell from 279 million dollars in 1929 to 35 million in 1932. Brazil's coffee exports halved, and in 1931 its government dumped coffee into the sea and burned crops to hold up prices; a coup in October 1930 had already brought Getúlio Vargas to power. Governments across Latin America turned to building local industry.

In the Belgian Congo, employment in Katanga fell by 70 per cent. In south-eastern Nigeria in November 1929, fears that the tax imposed on men would be extended to women, together with the slump in women's trade, set off the **Women's War**. It began at Oloko with a dispute over a census, in which a woman named Nwanyeruwa asked: "Was your widowed mother counted?" Some 10,000 women protested against the colonial "warrant chiefs" and attacked sixteen Native Courts; 55 were killed. It has been called the first major revolt by women in West Africa. In 1937–38 Gold Coast cocoa farmers withheld their crop for months and boycotted European firms after a buying pool led by Cadbury and the United Africa Company set low prices.

In Burma, collapsing rice prices fed the Saya San rebellion from December 1930; by the end of 1932 Saya San and 125 others had been hanged. In Siam the Depression contributed to the revolution of 1932 that ended absolute monarchy. Japan's economy shrank only 8 per cent and recovered by 1933 after the finance minister Takahashi Korekiyo left gold and devalued the yen, but its countryside suffered badly as silk and rice prices collapsed, and distress sales of daughters were reported. In the United States Franklin Roosevelt took office in 1933 declaring that "the only thing we have to fear is fear itself", and launched the New Deal, mentioned in the overview of the twentieth century.

```checkpoint
q: Why did the Depression hit Chile so severely?
a*: Its government relied on copper and nitrate exports, whose value collapsed.
a: Because it stayed on the silver standard.
x: The silver standard shielded China at first; Chile's problem was dependence on exports.
a: Because it was invaded during the slump.
x: Chile's catastrophe was economic, not military.
a: Because the Smoot–Hawley Tariff targeted only Chile.
x: Smoot–Hawley raised duties on over 20,000 goods from many countries.
hint: Where did Chile's government revenue come from?
why: Economies that sold raw materials suffered most when prices and trade collapsed.
---
q: What sparked the Women's War in Nigeria in 1929?
a: An attempt to conscript women into the army.
x: The protest concerned tax, trade and the warrant chiefs, not conscription.
a: A boycott of European cocoa firms.
x: That was the Gold Coast cocoa hold-up of 1937–38.
a*: Fears that direct taxation would be extended to women, amid a slump in their trade.
a: The arrest of a nationalist leader in Lagos.
x: It began at Oloko with a census dispute, not an arrest.
hint: Remember Nwanyeruwa's question.
why: Colonial taxation and the slump combined to provoke a revolt led by women.
```

## Dictatorship: Fascist Italy and Its Neighbours

The crisis was also one of liberal democracy. From 1919 Mussolini's Blackshirt squads attacked socialists and broke strikes. In Naples on 24 October 1922 he declared: "Our program is simple: we want to rule Italy." The March on Rome numbered fewer than 30,000, but King Victor Emmanuel III refused to declare a state of siege, and on 30 October Mussolini was legally appointed prime minister. In 1924 the Socialist leader Giacomo Matteotti, who had denounced a violent, rigged election, was murdered by a fascist squad; historians debate whether Mussolini ordered it, but his speech of January 1925 taking responsibility for squadrist violence is generally seen as the start of open dictatorship. Scholars contrast Italy's relatively mild domestic terror with its colonial violence: in Libya more than half of Cyrenaica's population was confined in camps, and Angelo Del Boca estimated 40,000–70,000 Libyan dead.

Dictatorship took other forms elsewhere. In the Soviet Union collectivisation brought famine: recent scholarship estimates 3.5–5 million deaths in Ukraine in 1932–33, and in Kazakhstan 1.3–2.3 million died, most of them Kazakhs: roughly two-fifths of all Kazakhs. In Germany, where unemployment reached close to a third of the workforce, Hitler became chancellor in January 1933. In Japan young officers murdered the prime minister in 1932 and Takahashi in 1936, and the military's grip on government tightened. In China, Chiang Kai-shek's Nationalists reunified much of the country by 1928 after massacring their communist allies in Shanghai; on the Long March of 1934–35, some 86,000 communists set out and perhaps 8,000 arrived.

## Anticolonial Movements

After the massacre at Jallianwala Bagh in 1919, described in the chapter on the British Empire, Gandhi led the non-cooperation movement of 1920–22, calling it off after a crowd at Chauri Chaura killed 22 policemen. In January 1930 the Indian National Congress declared for *Purna Swaraj*, complete self-rule, and Gandhi chose the salt tax, which fell hardest on the poorest, as his target. From 12 March to 6 April 1930 Gandhi and 78 followers walked 385 kilometres to Dandi, where he made salt illegally. Over the following year more than 60,000 people were jailed.

{{image: Salt March | Gandhi on the Salt March of 1930, which turned a tax on a daily necessity into a challenge to British rule in India.}}

Women became mass participants for the first time. Sarojini Naidu led volunteers at the Dharasana Salt Works, where police beat them; the United Press correspondent Webb Miller's report appeared in 1,350 newspapers.

```quote
Not one of the marchers even raised an arm to fend off the blows. They went down like ten-pins.
Webb Miller · reporting from Dharasana, May 1930 (as published in *I Found No Peace*, 1936)
```

The march won no immediate dominion status and little Muslim support, but Nehru held that its real importance lay in transforming the "village masses".

In Egypt, three years after the revolution of 1919 described in the chapter on the British Empire, Britain unilaterally declared Egypt independent while reserving control of foreign relations, communications, the military and Sudan; only the treaty of 1936 reduced British control, and 10,000 British troops stayed to guard the Suez Canal. The feminist Huda Sha'arawi founded the Egyptian Feminist Union in 1923. In the Dutch East Indies, Sukarno founded what became the Indonesian National Party in 1927, and on 28 October 1928 a youth congress in Batavia pledged one motherland, one nation and one language; the Dutch arrested Sukarno at the end of 1929. In French Indochina the Yên Bái mutiny of February 1930 failed within a day, and its leader Nguyễn Thái Học was guillotined; peasant uprisings in Nghệ An and Hà Tĩnh in 1930–31 were crushed, and on one day French planes killed 140–200 demonstrators.

The first Pan-African Congress, organised in Paris in 1919 by W. E. B. Du Bois, Ida Gibbs Hunt and the Senegalese deputy Blaise Diagne, asked for gradual self-government for Africans; further congresses met in 1921, 1923 and 1927. In 1930s Paris, francophone Black intellectuals, among them Aimé Césaire of Martinique, Léopold Sédar Senghor of Senegal and Léon Damas, developed *Négritude*; Césaire first used the word in its present sense in 1935. Recent scholarship restores the Martiniquan sisters Paulette and Jane Nardal, whose salon introduced them to the Harlem Renaissance.

## Women and the Vote

Women's suffrage spread unevenly and often with limits. In 1918 Azerbaijan became the first predominantly Muslim country to grant women equal voting rights, and Britain enfranchised women over 30 who met a property qualification, equalising the vote only in 1928. American women won the vote in 1920, though race-based disfranchisement continued. Indian provinces granted a limited vote one by one from 1921. Turkey granted the national vote in 1934; Ceylon and Spain adopted universal suffrage in 1931, Brazil and Siam in 1932. South Africa enfranchised only white women, in 1930; Fascist Italy allowed women only local votes, and France waited until 1944.

## Collective Security Fails

The League's great tests came from its own Council members. In September 1931 Japan's Kwantung Army, blaming Chinese dissidents for an explosion a Japanese officer had set off beside the South Manchuria Railway, invaded Manchuria without orders from Tokyo and set up the state of Manchukuo. When the League adopted the Lytton Commission's report refusing to recognise it, by 42 votes to one in February 1933, Japan left the League.

Ethiopia's fate was worse. On 3 October 1935 Italy invaded without a declaration of war, eventually sending hundreds of thousands of soldiers. Its aircraft dropped some 300–500 tons of mustard gas, in violation of the 1925 Geneva Protocol, and attacked Red Cross hospitals. Fifty states approved League sanctions, but these did not cover oil or close the Suez Canal; Britain and France avoided harsher measures partly for fear of driving Mussolini towards Hitler. Their Hoare–Laval plan to partition Ethiopia leaked, and the outcry forced Hoare out at once; Laval's government fell weeks later. Italian troops entered Addis Ababa on 5 May 1936. One estimate puts Ethiopian deaths in the war and the occupation that followed at 250,000–270,000; Ethiopia's own postwar claim was far higher. On 30 June Haile Selassie became the first head of state to address the League Assembly, speaking in Amharic after Italian journalists who jeered his introduction had been expelled, on behalf of a "small people of 12 million inhabitants, without arms, without resources".

```quote
God and history will remember your judgment.
Haile Selassie · Address to the League of Nations Assembly · 30 June 1936
```

Sanctions were lifted four days later, and by 1937 only six states refused to recognise the conquest: China, New Zealand, the Soviet Union, Republican Spain, Mexico and the United States. Ethiopia's cause stirred the Black world, from the African American pilot John Robinson, who flew for Ethiopia, to the Rastafari movement; Ethiopian resisters fought on until 1941.

## Spain, 1936–1939

On 17 July 1936 army officers rose against Spain's Popular Front government. They won areas holding 11 million of Spain's 25 million people, and civil war followed until Franco declared victory on 1 April 1939. The rebels' Army of Africa, including Moroccan *Regulares*, was airlifted to Spain in German and Italian planes; Italy sent 70,000–75,000 troops and Germany the Condor Legion. The Soviet Union armed the Republic, and Mexico sent rifles and later sheltered tens of thousands of refugees. Some 32,000 volunteers fought in the International Brigades, including Latin Americans and, in one battalion, Moroccans, Algerians, Syrians, Egyptians, Chinese, Japanese, Indians and Filipinos. When German and Italian aircraft bombed Guernica in April 1937, the Basque government reported 1,654 dead; local historians later identified 153. Death tolls remain disputed: demographers estimate 346,000 excess deaths in 1936–39, and estimates of Nationalist executions run from Paul Preston's minimum of 130,000 to Antony Beevor's 200,000. Spanish women, enfranchised in 1931, lost the democratic vote under Franco from 1939.

## Appeasement and the Road to War

Germany remilitarised the Rhineland in 1936 and annexed Austria in 1938. In September 1938 Neville Chamberlain spoke of "a quarrel in a far-away country between people of whom we know nothing", and at Munich Germany, Britain, France and Italy agreed to partition Czechoslovakia, which was not invited. Chamberlain promised "peace for our time"; the week before, Churchill had called partition "the complete surrender of the Western Democracies to the Nazi threat of force". In March 1939 Germany occupied the remaining Czech lands. In August the Soviet Union signed the Molotov–Ribbentrop Pact with Germany, secretly dividing Poland. Germany invaded Poland on 1 September 1939.

Historians have argued over appeasement ever since. In 1940 *Guilty Men*, by Michael Foot, Frank Owen and Peter Howard writing as "Cato", condemned its makers, and that verdict became orthodox, though John F. Kennedy's *Why England Slept* blamed unpreparedness. A. J. P. Taylor's *The Origins of the Second World War* (1961) was widely attacked for treating Hitler as an opportunist and the appeasers as "men confronted with real problems, doing their best in the circumstances of their time". R. A. C. Parker answered in 1993 that Chamberlain rejected a realistic alternative, a firm alliance against Hitler; critics reply that Stalin would never have fought for Czechoslovakia. Frank McDonough sees appeasement as a viable strategy badly carried out.

```checkpoint
q: Why did League sanctions fail to stop Italy's conquest of Ethiopia?
a: Because no state would approve any sanctions.
x: Fifty states approved sanctions in November 1935.
a*: Because they excluded oil and left the Suez Canal open, while Britain and France avoided harsher measures.
a: Because Ethiopia was not a League member.
x: Ethiopia had joined the League in 1923.
a: Because the United States vetoed them in the Council.
x: The United States never joined the League.
hint: Think about what the sanctions left out.
why: Collective security depended on great powers willing to impose real costs.
---
q: What did R. A. C. Parker argue in Chamberlain and Appeasement (1993)?
a: That the appeasers were reasonable men doing their best.
x: That was A. J. P. Taylor's view in 1961.
a: That Britain and France were simply unprepared.
x: That was John F. Kennedy's argument in Why England Slept.
a: That appeasement was viable but poorly carried out.
x: That is Frank McDonough's position.
a*: That Chamberlain rejected a realistic alternative: a firm alliance against Hitler.
hint: Parker focused on the road not taken.
why: The debate turns on whether Chamberlain had real choices.
```

## Further exploration

- **Susan Pedersen, *The Guardians: The League of Nations and the Crisis of Empire* (2015).** The League's mandates commission, its petitioners, and the racial logic of "trusteeship".
- **Adom Getachew, *Worldmaking after Empire: The Rise and Fall of Self-Determination* (2019).** How Black Atlantic and anticolonial thinkers challenged an unequal international order.
- **Adam Tooze, *The Deluge: The Great War, America and the Remaking of the Global Order, 1916–1931* (2014).** The interwar world shaped by American power, from Europe to China, Japan and India.
- **Zara Steiner, *The Lights that Failed: European International History 1919–1933* (2005).** The 1920s as a real attempt at reconstruction, not just a prelude to war.
- **Charles P. Kindleberger, *The World in Depression, 1929–1939* (1973).** The Depression as an international failure of leadership.
- **Paul Preston, *The Spanish Civil War: Reaction, Revolution and Revenge* (2006).** The standard one-volume account.$mn_interwar_master$,
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
  select $mn_interwar_quiz$[
    {"type": "mcq", "prompt": "Which League of Nations mandate was the only one to become independent before the Second World War?", "options": ["Syria", "Palestine", "Iraq", "Tanganyika"], "answerIndex": 2, "explanation": "Iraq became independent and joined the League in 1932. No deadlines for independence were set for the other mandates; Syria and Palestine remained under French and British rule, and Tanganyika under Britain.", "id": "q1"},
    {"type": "mcq", "prompt": "According to Barry Eichengreen and others, what best predicted how soon a country recovered from the Great Depression?", "options": ["How early it left the gold standard", "How high it raised its tariffs", "Whether it was a member of the League of Nations", "Whether it had a fascist government"], "answerIndex": 0, "explanation": "The gold standard transmitted the slump, and the earlier a country left gold, the earlier it recovered. Higher tariffs, such as Smoot–Hawley, are generally thought to have worsened the Depression.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened when Haile Selassie addressed the League of Nations Assembly on 30 June 1936?", "options": ["The League voted to expel Italy", "He became the first head of state to address the Assembly, speaking in Amharic after jeering Italian journalists had been expelled", "He announced Ethiopia's withdrawal from the League", "The League extended sanctions to cover oil"], "answerIndex": 1, "explanation": "He was the first head of state to address the Assembly and spoke in Amharic after Italian journalists who jeered his introduction were expelled. Sanctions, which never covered oil, were lifted on 4 July 1936; Italy itself later left the League.", "id": "q3"},
    {"type": "mcq", "prompt": "Which historian's 1961 book treated Hitler as an opportunist and the appeasers as 'men confronted with real problems, doing their best in the circumstances of their time'?", "options": ["R. A. C. Parker", "Frank McDonough", "Michael Foot", "A. J. P. Taylor"], "answerIndex": 3, "explanation": "A. J. P. Taylor's The Origins of the Second World War (1961) was widely attacked on publication. Michael Foot co-wrote Guilty Men (1940), which condemned the appeasers; Parker (1993) argued Chamberlain rejected a realistic alternative; McDonough sees appeasement as viable but poorly carried out.", "id": "q4"},
    {"type": "open", "prompt": "How did the Great Depression affect the colonised and export-dependent world outside Europe and North America? Give at least three examples from different regions.", "rubric": "A good answer explains that areas dependent on raw materials suffered most, as crop prices fell by up to 60 per cent and world trade by more than half. Examples may include: Chile (copper and nitrates supplied 80 per cent of government revenue; exports fell from $279m to $35m, 1929–32); Brazil (coffee exports halved, coffee dumped into the sea, Vargas's coup of 1930); the Belgian Congo (Katanga employment down 70 per cent); Nigeria's Women's War of 1929 against feared taxation of women amid a trade slump; the Gold Coast cocoa hold-up of 1937–38; Burma's Saya San rebellion driven by collapsing rice prices; Siam's 1932 revolution; rural Japan's silk and rice slump. Stronger answers note political consequences: rebellions, revolutions and a turn to local industry.", "id": "q5"},
    {"type": "open", "prompt": "Was the League of Nations' mandate system a new form of international trusteeship or colonial rule under another name? Use the chapter's evidence and historians.", "rubric": "A good answer describes Article 22's language ('sacred trust of civilisation', peoples 'not yet able to stand by themselves'), the fourteen mandates shared among seven powers, and notes that no independence deadlines were set and only Iraq became independent before the Second World War. It should present Pedersen's view that rule in the mandates differed little from colonial rule elsewhere but that the Permanent Mandates Commission changed how powers spoke and gave petitioners (Syrians, Western Samoans and others) a stage, and Getachew's view that interwar internationalism built in racial hierarchy. Stronger answers use resistance (Iraq 1920, the Great Syrian Revolt 1925–27, the Palestinian revolt 1936–39) as evidence of how the governed saw it.", "id": "q6"}
  ]$mn_interwar_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/the-interwar-period', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
