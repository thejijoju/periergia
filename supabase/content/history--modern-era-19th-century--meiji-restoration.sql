-- The Meiji Restoration — canonical master article, co-written and human-reviewed.
-- history/modern-era-19th-century/the-meiji-restoration @ research/advanced/read.
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
    'history/modern-era-19th-century/the-meiji-restoration',
    'research',
    'advanced',
    'read',
    $mn_meiji_master$> **A revolution made in the emperor's name.** Between 1868 and 1912 leaders from the domains of Satsuma and Chōshū overthrew the Tokugawa shogunate, dissolved the samurai class they came from, and built a centralised state with a conscript army, a money land tax, railways, silk mills, great business houses and, in 1889, East Asia's first parliamentary government. They called it a restoration of imperial rule under the Meiji Emperor, and their slogan was "rich nation, strong army". This chapter follows the Boshin War, the end of the domains and the samurai, the Iwakura Mission, Saigō Takamori's rebellion, taxed and indebted farmers, women in the silk mills and the People's Rights Movement, the zaibatsu, and the wars with China and Russia. It also looks from Korea and Taiwan, which Japan's empire absorbed, and ends with the historians' debates.

## From the Black Ships to the Coup of 1868

The chapter on the Tokugawa Shogunate describes how Commodore Perry forced Japan open in 1853–1854, how the treaties of 1858 imposed trading rights and extraterritoriality (they also fixed Japan's tariffs, which it could not change on its own), and how the shogunate's opponents rallied under the cry "revere the emperor, expel the barbarians".

Expulsion failed in practice. In 1863 Chōshū fired on foreign ships, and Britain bombarded Kagoshima in Satsuma after a British merchant was killed for crossing a Satsuma procession. Both domains turned from expelling the West to matching it, under the slogan *fukoku kyōhei*, "rich nation, strong army", a phrase used earlier by the Mito scholar Fujita Yūkoku. Chōshū raised militias, such as the Kiheitai, that mixed samurai with townsmen and peasants, and in 1866 Satsuma and Chōshū formed an alliance, brokered by Sakamoto Ryōma of Tosa.

In early 1867 Mutsuhito, aged 14, became emperor. That November the last shogun, Tokugawa Yoshinobu, returned administrative power to the court, and in the early hours of 3 January 1868 Satsuma and allied troops seized the Imperial Palace while a decree restored imperial rule. The new era was named Meiji, "enlightened rule"; contemporaries called the event the *Goisshin*, the "Honourable Restoration".

## The Boshin War

The change has been romanticised as bloodless, but it was not. At Toba–Fushimi near Kyoto in January 1868, about 15,000 shogunate troops were beaten by Satsuma–Chōshū forces they outnumbered about three to one, but which carried Armstrong guns, modern rifles and a Gatling gun. Edo surrendered without a battle after negotiations between Saigō Takamori and the shogunate's Katsu Kaishū; renamed Tokyo, it became the emperor's capital. In the north, Aizu was besieged and surrendered in November 1868. Nineteen of twenty boys of its White Tiger Unit, wrongly believing the castle had fallen, killed themselves, and Aizu's samurai were later resettled in the far north. The last holdouts proclaimed a Republic of Ezo in Hokkaido before surrendering in June 1869. Estimates of those killed in the war run from about 3,500 to about 8,200.

## Abolishing the Domains and the Samurai

Samurai families made up about 5 to 6 per cent of roughly 30 million people. In 1869 the leading domains surrendered their registers to the emperor and nearly all others followed; in August 1871 the daimyō, summoned to Tokyo, were told without consultation that the domains were abolished and replaced by prefectures. The Nationalism chapter sets these steps in the story of nation-making.

For the samurai the cost was their status. An edict of 1871 permitted them to cut the topknot and lay aside their swords; wearing swords in public was banned in 1876. Their hereditary stipends became government bonds, by choice in 1874 and compulsorily in 1876. Another edict of 1871 abolished the outcast status of the burakumin. The Conscription Ordinance of January 1873 demanded about three years' active service from men of 20, though the wealthy could buy exemption.

Ordinary people did not welcome it. The ordinance translated the French *impôt du sang* as "blood tax", and rumours spread that officials would literally take blood. In 1873 riots broke out in at least ten prefectures; crowds attacked government offices, new schools, police stations and newly emancipated burakumin. More than 60,000 people were arrested, and fifteen ringleaders executed. Most former samurai did not rebel; many became officials, teachers and police.

## The Iwakura Mission and the Korea Quarrel

In December 1871 about a hundred officials, scholars and students sailed from Yokohama under Iwakura Tomomi, with Ōkubo Toshimichi, Kido Takayoshi and Itō Hirobumi among his deputies. They sought recognition for the new government, a start on revising the unequal treaties, and knowledge of Western institutions. The treaty talks failed, but in nearly two years they crossed the United States, met Queen Victoria, toured British factories and crossed Europe. Five girls stayed in America to study, among them Tsuda Umeko, who later founded the school that became Tsuda University. A student member, Makino Nobuaki, later ranked the mission with the abolition of the domains as "the most important events that built the foundation of our state after the Restoration".

While they were away, Saigō pressed for confronting Korea, which had refused to receive a Japanese envoy because his letter used a character for the Japanese emperor that Koreans reserved for China's. Saigō offered to go as envoy himself. In October 1873 the returning Ōkubo and Iwakura blocked him, and Saigō, Itagaki Taisuke and others resigned.

## Saigō and the War of the Southwest

Disaffected samurai rose at Saga in 1874 and elsewhere in 1876. In Kagoshima, Saigō's private academies combined the classics with weapons training, and in 1877 Satsuma rebelled. The government sent more than 50,000 soldiers and 18,000 police against a rebel army that grew to about 20,000. Saigō's last stand came at Shiroyama on 24 September 1877. Legend says he committed ritual suicide; the autopsy found no such wound, and he was probably beheaded by a comrade after being shot. Ōkubo was assassinated by disaffected samurai the next year; Saigō was posthumously pardoned in 1889. The war nearly bankrupted the government.

## Farmers and the Price of Progress

The countryside paid for the new state. The Land Tax Reform announced in 1873 replaced rice dues with a uniform money tax of 3 per cent of assessed land value, paid by the landowner. It created private land titles, and it shielded the state, not the farmer, from bad harvests. After riots, the rate was cut in 1877 to 2.5 per cent. One estimate holds that the tax took around 30 per cent of harvests, far above European rates, and much heavier than the land tax of Qing China.

In the 1880s the "Matsukata deflation", named after the finance minister who founded the Bank of Japan in 1882, crashed the prices of rice and silk. Many small landholders lost their land to creditors. Tenants paid more than half their crop as rent, and families sent daughters to the textile mills or sold them into prostitution. In 1884 there were roughly sixty riots. The largest began on 31 October at Chichibu, in Saitama, where a self-styled "Revolutionary Army" of 5,000 to more than 10,000 seized the district office, proclaimed "Year One of Freedom and Self-Government", and destroyed records of debt. Police and the army crushed it in about ten days; thousands were convicted and five men hanged. Marius Jansen called it "a Tokugawa-style uprising that was dealt with in non-Tokugawa ways".

## Daughters in the Mills

Raw silk was Japan's main export. The mill at Tomioka, built under the French engineer Paul Brunat, opened in 1872 with 300 reels, twice as many as the largest mills in France or Italy. Rumours that the foreigners drank workers' blood, in fact red wine, deterred recruits. Most of the first workers were samurai daughters, and one of them, Wada Ei, left a *Tomioka Diary*. At first they worked eight-hour days with Sundays off; after the mill was sold to Mitsui in 1893, summer hours rose to twelve. By 1905 Japan's silk exports had overtaken China's. E. Patricia Tsurumi's history of the women who worked the silk and cotton mills draws on the songs they sang.

## People's Rights

In January 1874 Itagaki Taisuke and his allies submitted the Tosa Memorial, complaining that power lay "with the officials alone" and calling for an elected assembly.

```quote
Saigō fights the government with arms, but we will fight it with people's rights.
Itagaki Taisuke · remark on the People's Rights campaign, as quoted by Marius Jansen
```

The Freedom and People's Rights Movement grew through political societies. In a village storehouse at Itsukaichi, historians later found a draft constitution of 1881 written by the schoolteacher Chiba Takusaburō with a study society of local commoners. The government answered with press laws, then in 1881 with a promise of a national assembly by 1890. Itagaki founded the Liberal Party, inspired by Rousseau, whose *Social Contract* Nakae Chōmin had translated. Stabbed at Gifu in 1882, Itagaki reportedly cried, "Itagaki may die, but liberty will not!"

Women joined. Kishida Toshiko, a merchant's daughter and former tutor to the empress, lectured for the Liberal Party, and her 1883 speech "Daughters in Boxes" brought arrest and a fine. Fukuda Hideko, inspired by her, joined a radical plot in 1885, and in 1907 founded the first Japanese socialist women's newspaper. Laws barred women from joining political parties and attending political meetings until the 1920s.

## A Constitution from Above

Itō Hirobumi studied in Berlin and Vienna in 1882–1883; the American model was rejected as too liberal. A constitution drafted in secret was promulgated on 11 February 1889. Its first article declared that Japan "shall be reigned over and governed by a line of Emperors unbroken for ages eternal", the third that "the Emperor is sacred and inviolable". The emperor commanded the army and navy, a clause later read as freeing the military from cabinet control. Only men paying at least 15 yen in tax, about 1.1 per cent of the population, could vote for the lower house. Yet it was East Asia's first parliamentary government, and Ethiopian reformers, known as "Japanizers", later used it as a model for Ethiopia's 1931 constitution.

```checkpoint
q: Why did the Land Tax Reform of 1873 matter so much to Japanese farmers?
a*: It replaced rice dues with a fixed money tax on assessed land value, so the state's income was secure while farmers bore the risk of bad harvests and falling prices.
a: It abolished taxes on land altogether.
x: It created a uniform tax of 3 per cent of assessed value, later cut to 2.5 per cent.
a: It gave all the land to tenants.
x: It created private titles for landowners, many of whom later lost their land to creditors.
a: It was paid only by former samurai.
x: Landowners paid it; the samurai lost their stipends.
hint: Think about who bore the risk when prices fell.
why: The reform made the countryside the fiscal base of Meiji modernisation, which is why the Matsukata deflation hit farmers so hard.
---
q: What was the Chichibu Incident of 1884?
a: A samurai revolt led by Saigō Takamori.
x: Saigō's rebellion was in Satsuma in 1877.
a: A strike at the Tomioka Silk Mill.
x: Chichibu was a rural uprising in Saitama, not a factory dispute.
a*: An uprising of indebted farmers who seized the district office, destroyed debt records and proclaimed "Year One of Freedom and Self-Government".
a: A riot against the Treaty of Portsmouth.
x: That was the Hibiya riot of 1905 in Tokyo.
hint: Think about the Matsukata deflation and rural debt.
why: Chichibu, the largest popular uprising of the Meiji period, showed who bore the costs of modernisation, and how far radical ideas had spread.
```

## Railways, Factories and the Zaibatsu

The first railway, Tokyo to Yokohama, opened in 1872. Coal output rose from 0.6 million tonnes in 1875 to 21.3 million in 1913. In the 1880s the state sold many factories, mines and shipyards it had built to well-connected entrepreneurs, and from such ties grew the zaibatsu, family holding companies with their own banks. Mitsui had Edo-period roots; Mitsubishi was new, founded by Iwasaki Yatarō of Tosa, who received ships from the government's 1874 Taiwan expedition. Shibusawa Eiichi, founder of the First National Bank, is called the "father of Japanese capitalism". The Yahata Steel Works lit its first blast furnace in 1901. Growth had victims: the Ashio copper mine caused Japan's first major pollution disaster, against which the Diet member Tanaka Shōzō led protest.

## Equal Among the Powers, Master of Others

Demands to revise the treaties were sharpened in 1886 when the British ship *Normanton* sank, its crew escaped, all its Japanese passengers died, and a consular court acquitted the captain; after an outcry a retrial gave him only three months in prison. In 1894 Britain agreed to end extraterritoriality from 1899; full tariff autonomy followed in 1911.

Japan meanwhile imposed unequal terms on others. In 1876, after a clash at Ganghwa Island the previous year in which 35 Korean soldiers were killed, it forced on Korea a treaty consciously modelled on Perry's, declaring Korea "an independent state", undercutting China's claim to suzerainty, and giving Japanese extraterritoriality. In 1871 Paiwan people in Taiwan had killed 54 Ryukyuan sailors; Japan used the killings to justify an expedition to southern Taiwan in 1874 and, in 1879, to annex the Ryukyu Kingdom. The Nationalism chapter describes that annexation and the act of 1899 aimed at assimilating the Ainu of Hokkaido. For Ryukyuans and Ainu, nation-building was a form of internal colonisation.

The war with China of 1894–1895, whose campaigns the chapter on the Taiping Rebellion and the Late Qing describes, shifted dominance in East Asia from China to Japan and brought Japan Taiwan. When a Japanese fanatic shot the Chinese negotiator Li Hongzhang, Japan reduced its indemnity claim, and Mutsu Munemitsu remarked: "Li's misfortune is the good fortune of the Great Ch'ing Empire."

In 1904 Japan attacked the Russian fleet at Port Arthur before declaring war. It took the port, won at Mukden, and at Tsushima in May 1905 destroyed or captured all eleven Russian battleships, seven of them sunk, for the loss of three torpedo boats. The Treaty of Portsmouth left Korea to Japan and gave it Russia's lease in Liaodong, the South Manchuria Railway and southern Sakhalin, but no indemnity, and angry crowds rioted in Tokyo. Abroad the victory electrified many. Sun Yat-sen later recalled, in 1924: "We regarded that Russian defeat by Japan as the defeat of the West by the East." Indians, Vietnamese, Persians, Ottomans and African Americans such as W. E. B. Du Bois took heart, while Western writers warned of a "Yellow Peril". It is often called the first defeat of a European power by an Asian state, but that needs care: Ethiopia had already defeated Italy at Adwa in 1896. What was new in 1905 was an Asian victory over a European great power in a modern war between great powers.

## Korea: From Protectorate to Annexation

Koreans had their own reformers, whose programme, *tongdo sŏgi*, "Eastern ways and Western machines", sought self-strengthening on Korean terms; Japanese leaders insisted that Korea needed Meiji-style reform, which also served Japanese interests. On 8 October 1895 more than fifty Japanese agents, organised by Japan's minister Miura Gorō, killed Queen Min in her palace. King Gojong fled to the Russian legation, and in 1897 proclaimed the Korean Empire.

In November 1905, with Japanese troops around the palace, Itō Hirobumi obtained a treaty making Korea a protectorate. Five ministers approved it, remembered as the "Five Eulsa Traitors"; Gojong refused his consent. The official Min Yeong-hwan killed himself in protest, and the journalist Chang Chi-yŏn wrote:

```quote
...the integrity of a nation which has stood for 4,000 years... and the rights and freedom of twenty million people.
Chang Chi-yŏn · "I Wail Bitterly Today", Hwangsŏng sinmun, trans. F. A. McKenzie (1920) · 20 November 1905
```

After Gojong sent secret emissaries to the Hague in 1907, he was forced to abdicate and the Korean army was disbanded. Resistance passed to the "righteous armies": by Japanese official figures there were 2,851 clashes between 1907 and 1910, and about 17,000 Koreans were killed. On 26 October 1909 An Jung-geun shot Itō dead at Harbin, listing fifteen crimes; executed in 1910, he left an unfinished *Treatise on Peace in the East*. In August 1910 a treaty ceded "all rights of sovereignty over the whole of Korea" to the Japanese emperor. Koreans remember it as the national humiliation.

## Taiwan: The "Model Colony"

Taiwan, Japan's first colony, was taken by force. Japanese troops landed near Keelung on 29 May 1895 and took Taipei on 7 June, but Liu Yongfu's Black Flags resisted in the south, and contemporary reports said the conquest "was not accomplished without much cruelty". In the Yunlin massacre of June 1896 estimates of the dead range from 6,000 to 30,000, and between 1898 and 1902 about 12,000 "bandit-rebels". In 1897 the Diet even debated selling it to France. From 1898 Kodama Gentarō and Gotō Shinpei built a "model colony" of infrastructure and reform, on the formula "industry for Japan, agriculture for Taiwan". Resistance went on: the Tapani uprising of 1915 ended in thousands of casualties and mass arrests.

The Emperor Meiji died on 29 July 1912. His personal role remains debated; his biographer Donald Keene notes that even accounts of his boyhood contradict each other.

{{image: Emperor Meiji | The Emperor Meiji, who reigned from 1867 to 1912 and was presented to his subjects in Western-style portraits.}}

```checkpoint
q: Why is it misleading to call Japan's 1905 victory simply "the first defeat of a European power by a non-European state"?
a: Because Russia was not a European power.
x: Russia was a European great power, which is why the victory caused such a stir.
a*: Because Ethiopia had defeated Italy at Adwa in 1896; 1905 was new as an Asian victory over a European great power in a modern great-power war.
a: Because Japan lost the war.
x: Japan won at Mukden and Tsushima, and the Treaty of Portsmouth gave it Korea and other gains.
a: Because China had defeated Britain in the Opium Wars.
x: China lost the Opium Wars.
hint: Think about Africa in the 1890s.
why: Adwa came first, but 1905 still inspired thinkers from Sun Yat-sen to Du Bois.
---
q: Which statement best describes the Japan–Korea treaty of 1905?
a: Gojong signed it willingly in return for protection against Russia.
x: Gojong refused his consent, a fact central to the argument that the treaty was void.
a: It annexed Korea to Japan.
x: Annexation came by a separate treaty in 1910; the 1905 treaty made Korea a protectorate.
a: It was welcomed by the Korean press.
x: Chang Chi-yŏn's editorial "I Wail Bitterly Today" mourned it.
a*: It was obtained with Japanese troops around the palace and approved by five ministers, while Emperor Gojong refused his consent.
hint: Think about the "Five Eulsa Traitors".
why: These circumstances explain why most Korean scholars consider the 1905 and 1910 treaties void from the start.
```

## Historians' Debates

**Restoration or revolution?** W. G. Beasley argued that until victory the Satsuma–Chōshū leaders sought to displace those in power rather than change institutions, and that the result was a "centralised absolutism"; Jansen stressed how the shogunate's authority eroded as domain bureaucrats used military force.

**Feudal survival or bourgeois revolution?** In Japan's Marxist "debate on Japanese capitalism" of 1927–1937, the Kōza-ha ("Symposium" faction) held that the Meiji state was absolutist, resting on semi-feudal agriculture of high rents and poor tenants; the Rōnō-ha (Labour-Farmer faction) called the Restoration a bourgeois revolution. Repression ended the debate in the 1930s, but it shaped postwar scholarship. E. Herbert Norman's *Japan's Emergence as a Modern State* (1940) argued, close to the Kōza-ha, that surviving feudal relations explained repression at home and expansion abroad.

**A model of modernisation?** At Hakone in 1960, American and Japanese scholars including John Whitney Hall and Marius Jansen framed Meiji Japan as a successful non-Western modernisation, implicitly against Marxist accounts. Irokawa Daikichi and other historians of the people recovered commoner political thought, from the Itsukaichi draft to Chichibu. Carol Gluck treats late-Meiji ideology as built by many hands rather than simply imposed by the state; Andrew Gordon reads the Hibiya riots and later labour movements as an "imperial democracy", democratic demands framed in loyalty to emperor and empire. Mark Ravina rejects a clean break between Tokugawa tradition and Meiji modernity, placing 1868 among the nineteenth-century nation-states that sought recognition while celebrating their uniqueness.

**The view from Korea and Taiwan.** Revisionists read the 1873 quarrel as a dispute over when, not whether, to act against Korea, pointing to Japan's gunboat diplomacy at Ganghwa soon after. Most Korean scholars hold the treaties of 1905 and 1910 void from the start, coerced and lacking the emperor's consent; Japanese studies have argued that Gojong consented, and the 1965 treaty between Japan and South Korea fudged the issue by calling them "already null and void". Korean nationalist history frames colonial rule as repression and resistance, while Gi-Wook Shin and Michael Robinson ask how modernity itself was produced and used for colonial domination; in Taiwan the "model colony" stands against Yunlin and Tapani. Sun Yat-sen remembered 1905 as the East defeating the West; Chang Chi-yŏn saw a nation of 4,000 years losing its freedom. Both belong to the history of Meiji Japan.

## Further exploration

- **Marius B. Jansen, *The Making of Modern Japan* (2000).** The standard large survey from Tokugawa times to the postwar era, rich on Meiji politics.
- **Andrew Gordon, *A Modern History of Japan: From Tokugawa Times to the Present* (2003).** The standard textbook, especially strong on social and labour history.
- **Carol Gluck, *Japan's Modern Myths: Ideology in the Late Meiji Period* (1985).** How the emperor-centred civic ideology was made, contested and spread.
- **Mark Ravina, *To Stand with the Nations of the World: Japan's Meiji Restoration in World History* (2017).** The Restoration as a global story of nation-building rather than East versus West.
- **Mark Ravina, *The Last Samurai: The Life and Battles of Saigō Takamori* (2004).** A readable biography that separates Saigō from his legend.
- **E. Patricia Tsurumi, *Factory Girls: Women in the Thread Mills of Meiji Japan* (1990).** The women who powered Meiji exports, told partly through their own songs.
- **Gi-Wook Shin and Michael Robinson (eds.), *Colonial Modernity in Korea* (1999).** Scholars look beyond a simple story of repression and resistance under Japanese rule.$mn_meiji_master$,
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
  select $mn_meiji_quiz$[
    {"type": "mcq", "prompt": "What did the slogan fukoku kyōhei mean?", "options": ["Rich nation, strong army", "Revere the emperor, expel the barbarians", "Eastern ways and Western machines", "Good wife, wise mother"], "answerIndex": 0, "explanation": "After failing to repel the West in 1863, Satsuma and Chōshū turned from expulsion to 'rich nation, strong army', a phrase used earlier by the Mito scholar Fujita Yūkoku.", "id": "q1"},
    {"type": "mcq", "prompt": "Why did the Conscription Ordinance of 1873 provoke the 'blood tax' riots?", "options": ["Because it conscripted women", "Because it exempted all peasants", "Because the French phrase impôt du sang was translated as 'blood tax' and rumours spread that officials would literally take blood", "Because it restored samurai privileges"], "answerIndex": 2, "explanation": "Riots spread to at least ten prefectures; more than 60,000 people were arrested and fifteen ringleaders executed.", "id": "q2"},
    {"type": "mcq", "prompt": "Who shot Itō Hirobumi at Harbin in October 1909?", "options": ["Min Yeong-hwan", "Chang Chi-yŏn", "Gojong", "An Jung-geun"], "answerIndex": 3, "explanation": "An Jung-geun listed fifteen crimes of Itō's, was executed in 1910, and left an unfinished Treatise on Peace in the East.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the most accurate description of Japan's victory over Russia in 1905?", "options": ["The first defeat of any European power by a non-European state", "An Asian state's victory over a European great power in a modern great-power war, after Ethiopia had already defeated Italy at Adwa in 1896", "A victory that brought Japan a large Russian indemnity", "A defeat that Japan's public celebrated without protest"], "answerIndex": 1, "explanation": "Adwa (1896) came first. The Treaty of Portsmouth gave Japan no indemnity, and crowds rioted in Tokyo at its terms.", "id": "q4"},
    {"type": "open", "prompt": "Who paid the costs of Meiji modernisation? Discuss with reference to samurai, farmers and women workers.", "rubric": "A strong answer covers samurai loss of status (topknot edict, stipends converted to bonds in 1874 and 1876, the Satsuma Rebellion of 1877); farmers under the 1873 Land Tax Reform (3 per cent money tax, later 2.5 per cent; one estimate of about 30 per cent of harvests), the Matsukata deflation, the loss of land to creditors, the sale of daughters, and the Chichibu Incident of 1884; and women in the silk mills (Tomioka, Wada Ei, hours rising to twelve in summer after 1893). It may note the debate between those who stress peasant burdens or semi-feudal tenancy (Kōza-ha) and those who point to rural dynamism.", "id": "q5"},
    {"type": "open", "prompt": "How did Koreans and Taiwanese experience Japan's rise to empire between 1876 and 1910, and how have historians judged colonial rule?", "rubric": "A strong answer discusses the 1876 Ganghwa treaty modelled on Perry's, the killing of Queen Min (1895), the 1905 protectorate treaty without Gojong's consent, Chang Chi-yŏn's editorial and Min Yeong-hwan's suicide, the righteous armies (about 17,000 killed by Japanese official figures), An Jung-geun, and annexation in 1910; and in Taiwan the conquest of 1895, the Yunlin massacre, the 'model colony' of Kodama and Gotō, and Tapani (1915). It weighs the debates over the legality of the 1905 and 1910 treaties and over colonial modernity versus repression and resistance.", "id": "q6"}
  ]$mn_meiji_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/modern-era-19th-century/the-meiji-restoration', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
