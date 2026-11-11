-- Modern China — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/modern-china @ research/advanced/read.
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
    'history/regional-histories/asia/modern-china',
    'research',
    'advanced',
    'read',
    $mn_modchina_master$> **From empire to two Chinas.** In 1912 more than two thousand years of imperial rule ended. This chapter follows China's search for a new state through the revolution of 1911, the warlords, the New Culture and May Fourth movements, the Nationalist government of the Nanjing decade and its rehabilitation by historians, the changing lives of women, the war with Japan as the Chinese lived it, and the civil war that ended in 1949. It then traces what came after on both sides of the Taiwan Strait: the campaigns of the 1950s, Tibet and Xinjiang, the crisis of 1989, Taiwan's road from the massacre of 1947 and martial law to democracy, and Hong Kong from British colony to the National Security Law. It sets out the debates Chinese, Taiwanese and Western historians still have about this century.

## Where the Story Begins

The chapter on Chinese History gives the long background, and the chapters on The Opium Wars and on The Taiping Rebellion and the Late Qing tell the nineteenth-century crisis in detail, from the unequal treaties to the Boxers and the late reforms. Revolutionaries wanted to be rid of the Manchu dynasty altogether. Sun Yat-sen's programme, set out in 1904 and adopted as the Tongmenghui oath in 1905, put it bluntly: "to expel the Tatar barbarians, to revive Zhonghua, to establish a Republic, and to distribute land equally among the people". In August 1905 he founded the Revolutionary Alliance (Tongmenghui) in Tokyo, with help from Japanese sympathisers. Every rising he backed before 1911 failed.

## 1911: The Republic and Its Disappointments

The Xinhai Revolution, named after the cyclical name for the year 1911, began when New Army soldiers rose in Wuchang on 10 October 1911; provinces across the country followed. Sun had no direct part: he was in the United States raising money among overseas Chinese. The Qing court turned to Yuan Shikai, commander of the Beiyang Army, and made him prime minister. On 1 January 1912 the Republic of China was proclaimed in Nanjing with Sun as provisional president. Sun then stood aside for Yuan in return for Yuan securing the abdication of the six-year-old emperor Puyi, issued on 12 February 1912.

The Republic soon disappointed its founders. The Nationalist Party (Kuomintang, KMT) won the elections of 1912–13, but in March Song Jiaoren, expected to become premier, was assassinated in Shanghai, with Yuan's involvement alleged. Yuan crushed a "Second Revolution" that summer, outlawed the KMT and dissolved the assembly. In December 1915 he made himself emperor; opposition forced him to give up the throne in March 1916, and he died that June. Looking back in 1925, the writer Lu Xun summed up the disillusion: "before the revolution, I was a slave, but shortly after the revolution, I have been cheated by slaves and have become their slave."

## The Warlord Era

From Yuan's death until December 1928, control of China was divided among military cliques, such as Zhang Zuolin's Fengtian clique in Manchuria. Armies swelled from about half a million soldiers in 1916, tripling by 1922 and tripling again by 1924, and opium sales helped pay for them. Japan pressed its advantage: its Twenty-One Demands of 1915, described in the chapter on Japan's Empire in Asia, 1895–1945, provoked a national boycott and fed the anger that broke out in 1919.

## New Culture and May Fourth

Many young intellectuals now looked beyond politics to culture. In 1915 Chen Duxiu founded the magazine that became *New Youth*, which moved to Beijing in 1917 when he joined Peking University. Its writers blamed Confucian values for China's weakness and called for "Mr. Science" and "Mr. Democracy". Hu Shih argued in *New Youth* in January 1917 for literature in the written vernacular, *baihua*, rather than the classical language: one should "speak in the language of the time in which you live". In 1919 he urged "more study of questions, less study of isms", against Li Dazhao, soon a founder of the Communist Party.

The movement's greatest writer was Lu Xun, pen name of Zhou Shuren, who had studied medicine in Japan before turning to literature. His short story "Diary of a Madman", published in *New Youth* in April 1918, is often called China's first modern short story, though not the first in the vernacular: Chen Hengzhe's "One Day" (1917) came earlier. Its narrator sees the words "eat people" written between the lines of a history book, and it ends with the plea "Save the children". In the preface to *Call to Arms* Lu Xun recalled doubting whether to wake people at all: "Imagine an iron house without windows, absolutely indestructible, with many people fast asleep inside who will soon die of suffocation."

{{image: May Fourth Movement | Students in Beijing protest against the Versailles settlement on 4 May 1919}}

Then came the spark. China had joined the First World War on the Allied side in 1917 and sent some 140,000 labourers to the Western Front, but the Versailles settlement handed Germany's rights in Shandong to Japan. On 4 May 1919 several thousand students, women among them, gathered at Tiananmen with slogans such as "Give Qingdao back to us!" After arrests in June, Shanghai's merchants and workers struck; the government dismissed three officials, and China's delegates refused to sign the treaty. For the historian Rana Mitter, the "atmosphere and political mood that emerged around 1919 are at the center of a set of ideas that has shaped China's momentous twentieth century." One of those ideas was communism: in July 1921 thirteen delegates met in Shanghai's French Concession for the First Congress of the Chinese Communist Party (CCP), a party of 57 members founded by Chen Duxiu and Li Dazhao with help from the Comintern.

## Nationalists and Communists, 1923–1937

In 1923 Sun Yat-sen reached an agreement with the Soviet envoy Adolph Joffe, admitted Communists into the KMT in the First United Front, and in 1924 founded the Whampoa Military Academy near Guangzhou, with Chiang Kai-shek as commandant. Sun died in 1925; Taiwan honours him as "Father of the Nation" and the People's Republic as "Forerunner of the Revolution".

In July 1926 the Nationalists launched the Northern Expedition against the warlords. Before it was over, Chiang turned on his Communist allies. From 12 April 1927 his troops and gangsters of Shanghai's Green Gang attacked Communists, union leaders and workers' militias; the toll was never precisely established, with some sources putting the dead of the purges that followed at 5,000–10,000. Over the next several years the Nationalists' "White Terror" killed from several hundred thousand to more than a million people between 1927 and 1930, by different estimates. In December 1928 Zhang Xueliang, whose father Zhang Zuolin the Japanese had assassinated, accepted the authority of Chiang's government in Nanjing, completing China's nominal reunification.

The surviving Communists built rural bases, among them the Jiangxi Soviet; Mao Zedong's rise among them is told in the chapter on Maoism. Driven out of Jiangxi, about 86,000 troops of the main Red Army set out in October 1934 on what became the Long March; at the Zunyi Conference in January 1935 Mao's rise to leadership began, and in October 1935 about 8,000 survivors reached northern Shaanxi. In December 1936, at Xi'an, Zhang Xueliang and Yang Hucheng detained Chiang and demanded an end to civil war and an alliance against Japan. The result was a Second United Front; Chiang afterwards had Zhang arrested.

## The Nanjing Decade Reconsidered

The Nationalist years of 1927–1937 are sometimes called the "Golden Decade", and they were far more stable than the warlord years. The government recovered tariff autonomy by 1930, raising its revenue; it built some 82,000 kilometres of roads; and central spending on education more than doubled between 1933 and 1936. The New Life Movement of 1934 blended Confucian morality, Christianity and nationalism, which Frederic Wakeman called "Confucian fascism", and the Blue Shirts imitated European fascist movements, though Jay Taylor and A. James Gregor reject calling Chiang's regime fascist.

For decades Western historians judged the Nationalists harshly. Lloyd Eastman's *The Abortive Revolution* (1974) and *Seeds of Destruction* (1984), in line with what critics call the "Stilwell–White paradigm", stressed failure, corruption and repression. Since then many historians have rehabilitated the Nationalist state. William Kirby argues that the pre-1949 decades were "a formidable period of state- and institution-building" and stresses continuity across 1949; Hans van de Ven attacks the Stilwell–White paradigm and argues that neither Britain nor the United States valued China enough to fund it properly. Frank Dikötter presents the Republic as an age of unprecedented openness (*The Age of Openness*, 2008); Jonathan Fenby, reviewing it, judged that Dikötter "marshals a good case" while noting that some of his arguments rest on fragile foundations. Chiang's diaries, opened at the Hoover Institution from 2006, have spurred reassessment by mainland and Taiwanese historians alike, and, the People's Republic itself has treated Chiang more positively since the 2000s; Mitter notes that the museum at his ancestral home now presents him favourably. Mitter imagines "Chiang Kai-shek's ghost wandering round China today nodding in approval, while Mao's ghost follows behind him, moaning at the destruction of his vision."

## Women, Family and the Revolutions

The Republic banned foot binding in 1912 but at first did not enforce the ban; some provincial leaders and later Nanjing-era governments enforced it. A 1929 survey in one province found 95 per cent of girls born after 1910 unbound. A Women's Suffrage Alliance was founded in 1912. Peking University admitted women in 1920. The Nationalist civil code of around 1930 gave women equal inheritance rights, though women's suffrage came only in 1947.

The Communists made women's liberation part of their revolution. Party activists mobilised rural women during land reform, a point Deng Yingchao stressed in 1947. The People's Republic's Marriage Law of 1 May 1950 required both parties' consent, let women initiate divorce, and banned arranged marriage, concubinage and child betrothal; mass campaigns promoted it. Mao's slogan was that "women hold up half the sky".

```checkpoint
q: What sparked the protests of 4 May 1919?
a*: The decision at Versailles to hand Germany's rights in Shandong to Japan.
a: The assassination of Song Jiaoren.
x: Song was assassinated in 1913; the 1919 protests were about the peace settlement.
a: Yuan Shikai's proclamation of himself as emperor.
x: Yuan made himself emperor in 1915 and died in 1916.
a: Chiang Kai-shek's attack on the Communists in Shanghai.
x: That came in April 1927.
hint: Think of the slogan "Give Qingdao back to us!"
why: China had sent some 140,000 labourers to the Western Front, and the transfer of Shandong to Japan felt like betrayal.
---
q: How have historians such as William Kirby revised the older picture of the Nationalist government of 1927–1937?
a: By arguing that it was a fascist regime on the European model.
x: That is Wakeman's "Confucian fascism" argument, which Taylor and Gregor reject; it is not the rehabilitation.
a: By showing that it never controlled Nanjing.
x: Nanjing was its capital.
a*: By stressing state- and institution-building that 1949 did not wipe away.
a: By confirming Eastman's view that it was an abortive revolution.
x: Eastman's books represent the older, critical view that the revisionists challenge.
hint: Think of roads, tariffs and state-building.
why: The revisionists see continuity between the Republic and the People's Republic, rather than an unbridgeable divide.
```

## The War of Resistance, 1937–1945

The war with Japan is told from the empire's side in the chapter on Japan's Empire in Asia, 1895–1945, and globally in the chapter on the Second World War. In China it is the War of Resistance; since 2017 the party's official history has counted a "Fourteen Years' War" from the seizure of Manchuria on 18 September 1931. Full-scale war came in July 1937. China fought for Shanghai from August to November, and Japanese troops entered Nanjing on 13 December. Estimates of the dead in the massacre that followed range from 40,000 to over 340,000; China's official figure is 300,000, and many newer estimates fall between 100,000 and 200,000.

China won its first major victory at Taierzhuang in spring 1938, and its government retreated to Chongqing. In June 1938, with Chiang's sanction, Nationalist troops breached the Yellow River dikes at Huayuankou, "using water as a substitute for soldiers". Studies by Wang Zhibin and Bi Chunfu put the deaths from flood, famine and plague at 400,000–500,000. The Nationalists at first blamed Japanese bombing.

In the Henan famine of 1942–43, estimates of the dead run from around 700,000 (Anthony Garnaut) to 2–3 million (Eastman); Mitter blames officials who collected more grain than Chiang's reduced quota. Modern estimates of Chinese war dead run from about 10 million to 20 million, most often 14–16 million, and China officially counts 35 million casualties, dead and wounded. China ended the war as one of the "Big Four" Allies, and in 1943 Britain and the United States gave up the unequal treaties. But historians such as Mitter and van de Ven argue that the Japanese invasion gravely weakened the Nationalists.

## Civil War and 1949

Chiang and Mao negotiated in Chongqing in autumn 1945, but civil war followed. Soviet forces in Manchuria let Communist troops move in behind them. Land reform, which redistributed over 25 million hectares in Communist areas, was the Communists' most effective political reform. Civilians suffered terribly: at the siege of Changchun in 1948 the Communist army kept people from leaving in order to starve the garrison, and some 150,000 civilians died, an episode little known in China until a 1989 book, since censored. The Liaoshen, Huaihai and Pingjin campaigns decided the war by January 1949.

On 21 September 1949 Mao announced the new state in the speech known as "The Chinese people have stood up". On 1 October, from the Tiananmen Gate, he proclaimed:

```quote
Fellow countrymen, the Central People's Government of the People's Republic of China was established today!
Mao Zedong · Proclamation at the Tiananmen Gate · 1 October 1949
```

In December Chiang made Taipei his temporary capital; about a million mainlanders went to Taiwan (older estimates say two million or more). Why the Nationalists lost remains disputed. Some Chinese historians blame Chiang's own decisions, such as spending 70 per cent of the budget on the military; others, following Jay Taylor, stress the withdrawal of American aid and Soviet help to the Communists. Liang Shuming remarked that Chiang's "greatest contribution was to make the CCP successful".

## The People's Republic: Campaigns of the 1950s

The chapter on Maoism describes land reform and the chapter on Global Cold War and the Arms Race the Korean War. Estimates of deaths from land reform and the campaign against counter-revolutionaries together range from 200,000 to 5 million. A deputy public security minister reported 712,000 executions in the counter-revolutionary campaign of 1950–53; the Chinese historian Yang Kuisong argues the real number was "much larger". After the brief opening of the Hundred Flowers, the Anti-Rightist Campaign of 1957–59 persecuted at least 550,000 people officially, 1–2 million or more by some researchers' counts; Deng Xiaoping, as party general secretary, directed it. The Great Leap Forward famine, with deaths estimated at about 15 to 45 million or more, and the Cultural Revolution of 1966–76 are the subjects of the chapters on Maoism and on The Cultural Revolution.

## Tibet and Xinjiang

Central Tibet was de facto independent by about 1917. The People's Liberation Army advanced in October 1950, and in 1951 the Dalai Lama ratified the Seventeen Point Agreement: Beijing calls this the "Peaceful Liberation of Tibet", the exile government an invasion. After armed resistance in eastern Tibet, an uprising in Lhasa in March 1959 was crushed and the Dalai Lama fled to India. Estimates of the dead range from about 10,000 Tibetan battle deaths (Peace Research Institute Oslo) to the exile government's 85,000–87,000. In Xinjiang, from 2017 an estimated one million or more Uyghurs and other Turkic Muslims were held without legal process in camps officially called "vocational education and training centres". The government denies abuses; the United States declared genocide in 2021, and the UN human rights office said in 2022 that the policies may constitute crimes against humanity.

## Reform and 1989

Deng Xiaoping's reform and opening from 1978, and China's rise to the world's second-largest economy, belong to the chapter on China Today. Protests that began on 15 April 1989 spread to some 400 cities; martial law was declared on 20 May, and in the early hours of 4 June troops cleared Beijing, with most killings along Chang'an Avenue. The official count is 241 dead, including 23 soldiers and police; the Tiananmen Mothers have identified 202 victims; Amnesty International estimated up to 1,000; a British diplomatic cable, declassified in 2017, claimed at least 10,000, a figure its author later revised to 2,700–3,400; the historian Timothy Brook had judged claims of 10,000 "extravagant". Most estimates run from several hundred to the low thousands. Beijing speaks of "turmoil", others of the June Fourth Massacre.

## Taiwan's Separate Path

Taiwan, ruled by Japan from 1895, passed to the Republic of China in 1945. On 27 February 1947 Monopoly Bureau agents in Taipei struck a widow, Lin Jiang-mai, over contraband cigarettes, and an officer fired into the crowd, fatally wounding a man. The next day soldiers fired on protesters and revolt spread across the island; mobs also attacked mainlanders. Governor Chen Yi waited for troops from Fujian, who began a crackdown on 8 March. No accurate toll exists: the most often cited range is 8,000 to 28,000 dead, the upper part from a commission set up under Premier Hau Pei-tsun, whose 1992 report became official in 2007. For many Taiwanese the massacre is the founding event of their identity; Beijing frames it as a "patriotic, anti-imperialist struggle".

Martial law, declared in May 1949, lasted until 15 July 1987, then the world's longest. In the White Terror at least 140,000 people were imprisoned and 3,000–4,000 executed. A *Formosa Magazine* rally in Kaohsiung on 10 December 1979 was crushed and opposition leaders, including Annette Lu, arrested; in 1986, under martial law, activists founded the Democratic Progressive Party (DPP). Martial law was lifted under Chiang Ching-kuo. On his death in January 1988 Lee Teng-hui became the first Taiwan-born president; in 1995 he became the first president to speak publicly about 28 February, now Peace Memorial Day. Taiwan held its first direct presidential election in 1996, and in 2000 the DPP's Chen Shui-bian won, ending some fifty years of KMT rule in the first peaceful transfer of power to an opposition party in Chinese history. The Taiwanese historian Hsiao-ting Lin argues that Taiwan's separate state was never planned but grew from improvised half-measures, especially in Chiang's dealings with Washington.

## Hong Kong

Britain had taken Hong Kong in stages from 1842. In the Sino-British Joint Declaration of 1984, Margaret Thatcher and Zhao Ziyang agreed that Hong Kong would become a special administrative region under "one country, two systems", with its policies unchanged for fifty years. The handover at midnight on 1 July 1997 ended 156 years of British rule; Beijing speaks of the "resumption of sovereignty". After mass protests against an extradition bill in 2019, on 30 June 2020 Beijing imposed a National Security Law creating crimes of secession, subversion, terrorism and collusion with foreign forces.

## Interpreting Modern China

The idea of a "century of humiliation", from the First Opium War to 1949, arose after the defeat of 1895, was popularised by both Nationalists and Communists in the 1920s, became central to party messaging under Xi Jinping, and was made a required theme by the 2023 Patriotic Education Law. Zheng Wang has shown how that memory shapes Chinese politics and foreign relations.

In the West, John King Fairbank, with the Chinese scholar Teng Ssu-yu in *China's Response to the West* (1954), framed modern Chinese history as a response to the Western impact. His student Paul Cohen, in *Discovering History in China* (1984), criticised this "impact–response" model for casting China as passive and called for a "China-centered history of China".

Frank Dikötter's trilogy on the Mao years, from *Mao's Great Famine* (2010) to *The Cultural Revolution* (2016), includes *The Tragedy of Liberation* (2013), which describes "calculated terror and systematic violence" and some 5 million unnatural deaths in the People's Republic's first decade. Critics such as Felix Wemheuer and Daniel Leese fault his method and neglect of ideology, Adam Cathcart and Brian DeMare his use of sources, and Philip Short wrote that "Dikötter's errors are strangely consistent. They all serve to strengthen his case against Mao and his fellow leaders."

```checkpoint
q: Who lifted martial law in Taiwan in July 1987?
a: Lee Teng-hui.
x: Lee became president only in January 1988, after martial law had been lifted.
a*: Chiang Ching-kuo's government.
a: Chen Shui-bian.
x: Chen won the presidency in 2000.
a: Chen Yi.
x: Chen Yi was the governor who directed the response to the 28 February 1947 uprising.
hint: Lee Teng-hui became president only after it happened.
why: Martial law lasted from 1949 to 1987; democratisation followed under Lee Teng-hui.
---
q: What did Paul Cohen criticise in Discovering History in China (1984)?
a: The opening of Chiang Kai-shek's diaries.
x: The diaries were opened only from 2006, long after Cohen's book.
a: The rehabilitation of the Nationalist state.
x: That is a separate debate, associated with Kirby and van de Ven.
a: Dikötter's death tolls for the Great Leap.
x: Dikötter's trilogy began in 2010, long after Cohen's book.
a*: The "impact–response" model that cast China as passive before the West.
hint: Think of his teacher, John King Fairbank.
why: Cohen called for a "China-centered history of China".
```

## Further exploration

- **Jonathan D. Spence, *The Search for Modern China* (1990; 3rd ed. 2013).** The classic one-volume narrative from the late Ming to the present.
- **Klaus Mühlhahn, *Making China Modern: From the Great Qing to Xi Jinping* (2019).** Institutions, crisis and recovery from the Qing to Xi.
- **Rana Mitter, *A Bitter Revolution: China's Struggle with the Modern World* (2004).** May Fourth and its legacy across the century.
- **Rana Mitter, *China's War with Japan, 1937–1945: The Struggle for Survival* (2013).** The war from the Chinese side, Nationalist and Communist; published in the US as *Forgotten Ally*.
- **Gail Hershatter, *Women and China's Revolutions* (2018).** Two centuries of Chinese history with women at the centre.
- **Hsiao-ting Lin, *Accidental State: Chiang Kai-shek, the United States, and the Making of Taiwan* (2016).** A Taiwanese historian on how a separate Taiwan emerged without design.
- **Zheng Wang, *Never Forget National Humiliation: Historical Memory in Chinese Politics and Foreign Relations* (2012).** How the humiliation narrative shapes the People's Republic.$mn_modchina_master$,
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
  select $mn_modchina_quiz$[
    {"type": "mcq", "prompt": "Where was Sun Yat-sen when the Wuchang Uprising began on 10 October 1911?", "options": ["In the United States, raising support among overseas Chinese", "Leading the New Army soldiers in Wuchang", "In prison in Beijing", "In Nanjing, already serving as president"], "answerIndex": 0, "explanation": "Sun had no direct part in the uprising; he became provisional president of the Republic on 1 January 1912.", "id": "q1"},
    {"type": "mcq", "prompt": "What is \"Diary of a Madman\" (1918) by Lu Xun?", "options": ["A novel about the Long March", "A memoir of his medical studies in Japan", "A short story, often called China's first modern short story, published in New Youth", "A political manifesto of the Communist Party"], "answerIndex": 2, "explanation": "Its narrator sees \"eat people\" between the lines of a history book; it ends with the plea \"Save the children\".", "id": "q2"},
    {"type": "mcq", "prompt": "On what date did Mao give the speech known as \"The Chinese people have stood up\"?", "options": ["1 October 1949", "4 May 1919", "19 October 1935", "21 September 1949"], "answerIndex": 3, "explanation": "The speech was to the Chinese People's Political Consultative Conference; on 1 October 1949 he proclaimed the Central People's Government at the Tiananmen Gate.", "id": "q3"},
    {"type": "mcq", "prompt": "How long did martial law last in Taiwan?", "options": ["From 1945 to 1996", "From May 1949 to 15 July 1987", "From 1947 to 1988", "From 1979 to 2000"], "answerIndex": 1, "explanation": "Declared in May 1949 and lifted under Chiang Ching-kuo in July 1987, it was then the world's longest period of martial law.", "id": "q4"},
    {"type": "open", "prompt": "Why have historians rehabilitated the Nationalist state of 1927–1937, and what are the limits of that rehabilitation?", "rubric": "A strong answer contrasts the older critical view (Eastman's The Abortive Revolution and Seeds of Destruction, the 'Stilwell–White paradigm') with revisionists such as William Kirby (state- and institution-building; continuity across 1949) and Hans van de Ven; cites evidence such as tariff autonomy, road building and education spending; notes the regime's authoritarian features (the New Life Movement, the Blue Shirts, Wakeman's 'Confucian fascism' and its critics), the White Terror, Dikötter's 'age of openness' and Fenby's reply, and the role of Chiang's diaries in reassessment by mainland and Taiwanese historians.", "id": "q5"},
    {"type": "open", "prompt": "How did Taiwan's path diverge from the mainland's after 1945?", "rubric": "A strong answer covers the 28 February 1947 incident and its contested toll (most often 8,000–28,000), martial law from 1949 to 1987 and the White Terror (at least 140,000 imprisoned, 3,000–4,000 executed), the Kaohsiung incident of 1979, the founding of the DPP in 1986, the lifting of martial law under Chiang Ching-kuo, Lee Teng-hui, the first direct presidential election of 1996 and the transfer of power in 2000; it may use Hsiao-ting Lin's argument that the separate state was 'accidental' and contrast how Taiwan and Beijing remember 1947.", "id": "q6"}
  ]$mn_modchina_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/modern-china', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
