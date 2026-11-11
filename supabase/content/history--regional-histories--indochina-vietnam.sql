-- Indochina and Modern Vietnam, 1880s-1980s — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/indochina-and-modern-vietnam-1880s-1980s @ research/advanced/read.
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
    'history/regional-histories/asia/indochina-and-modern-vietnam-1880s-1980s',
    'research',
    'advanced',
    'read',
    $mn_indochina_master$> **A century of empire, revolution and war in three countries.** Between the 1880s and the 1980s Vietnam, Cambodia and Laos were bound together first as French Indochina and then by the wars that followed its collapse. This chapter follows the colony and the people who paid for it; the scholar-patriots, nationalists and communists who answered it, including Ho Chi Minh's road to the Indochinese Communist Party; the Japanese coup and the famine of 1945; the August Revolution and the French war that ended at Geneva; Cambodia and Laos in their own right; the aftermath of 1975, from re-education camps and boat people to the Khmer Rouge and the Third Indochina War; and Vietnam's turn to Đổi Mới in 1986. The American war itself is told in the chapter on The Vietnam War.

## Making French Indochina

France built its Indochinese empire piece by piece. By the Treaty of Saigon (1862) the Nguyễn court ceded three southern provinces; in 1863 King Norodom accepted a French protectorate over Cambodia; and the Patenôtre Treaty of 6 June 1884 made Annam and Tonkin protectorates. The Cần Vương ("Aid the King") insurgency that followed is described in the chapter on Imperial Expansion and Resistance. On 17 October 1887 France joined Cochinchina, Annam, Tonkin and Cambodia into the Indochinese Union. After French gunboats forced Siam to cede the lands east of the Mekong in 1893, a protectorate was built on the Kingdom of Luang Prabang, and the explorer-diplomat Auguste Pavie gave the territory its modern name, Laos. It was formally included in the Union from 1899.

Cochinchina was ruled directly as a colony; in Annam and Tonkin the Nguyễn emperors reigned, but their decrees needed French approval, and the Governor-General held supreme power over the whole federation. In 1913 about 16.4 million people were ruled by around 18,000 French civilians, soldiers and officials. Indochina was a *colonie d'exploitation*, a colony for economic exploitation rather than settlement, and a hierarchy among the colonised: France encouraged Vietnamese to move to thinly peopled Laos, where by 1943 they formed the majority in Vientiane, Thakhek and Pakse and dominated the colonial civil service.

## Monopolies, Rubber and Rice

Paul Doumer, Governor-General from 1897 to 1902, set out to make the colony pay for itself. The state took a near monopoly of opium, salt and rice alcohol and set quotas for each Vietnamese village, compelling villagers to buy fixed amounts; these three products supplied about 44 per cent of the colonial budget in 1920. Those who could not pay their taxes lost houses and land, and public works were built with corvée, or forced, labour. In Cambodia in 1916 between 30,000 and 100,000 peasants joined a three-month protest against corvée and higher taxes, and in 1925 about 700 peasants killed the French Resident Félix Bardez over taxes raised partly to pay for a hill resort.

In Cochinchina's Mekong Delta, by 1930, 80 per cent of rice land belonged to 25 per cent of landowners, and 57 per cent of the rural population were landless. The automobile age brought a rubber boom and firms such as Michelin. On Michelin's Phú Riềng plantation official records gave a death rate of 17 per cent of workers in 1927, a figure considered conservative. In February 1930 the communist-led "Red Phú Riềng" strike began there. Its leader, Trần Tử Bình, a former seminarian who had signed on as a labourer, later became a general and wrote the memoir published in English as *The Red Earth*.

The colony also served France in war. About 93,000 Indochinese soldiers and workers went to Europe in the First World War, their costs charged to the Indochina budget. Nguyễn Ái Quốc, the future Ho Chi Minh, wrote in 1925 that recruits were "taken in chains", and Joseph Buttinger and Martin Murray accepted that recruitment was forced; later historians call recruitment "ostensibly voluntary", though many did volunteer. Governor-General Albert Sarraut promised "Franco-Annamite collaboration" while building a political police, the Sûreté.

## Schools, Script and Scholar-Patriots

Language was at the heart of the civilising mission. The Latin-based Vietnamese alphabet, *chữ Quốc ngữ*, devised by Jesuit missionaries in the seventeenth century, was enforced by the administration from 1910, and the Confucian examinations were suppressed. Critics argue this cut Vietnamese off from their literature in Chinese characters and Nôm; yet reformers also embraced quốc ngữ to spread learning, as the Tonkin Free School did in Hanoi in 1907 until the French closed it within the year.

Two scholar-patriots framed the choices. Phan Bội Châu founded the Modernisation Association in 1904 and the Đông Du ("Journey to the East") movement, which sent about 200 students to Japan by 1908, until Japan expelled them under French pressure. His *History of the Loss of Vietnam* (1905) helped revive the name "Vietnam". Phan Châu Trinh rejected violence and urged France to live up to its own principles; meeting Phan Bội Châu in Tokyo in 1906, he lamented: "The level of their people is so high, and the level of our people is so low! How could we not become slaves?" In Laos the Holy Man's Rebellion of upland Lao Theung peoples, which began in 1901 and on the Bolaven Plateau lasted until 1936, challenged French rule. David Marr sees the 1920s as the moment when returnees from France urbanised and politicised Vietnamese nationalism, turning it from "traditional" to "modern".

## 1930: Mutiny, Party and Soviets

The Vietnamese Nationalist Party (VNQDĐ), modelled broadly on China's Kuomintang, was founded in Hanoi in 1927 under Nguyễn Thái Học. On the night of 10 February 1930 about 50 colonial soldiers at Yên Bái, with some 60 party civilians, turned on their French officers; the mutiny failed within a day. French aircraft bombed the village of Cổ Am, killing about 200, mostly civilians, and on 17 June Nguyễn Thái Học was among thirteen men guillotined at Yên Bái, crying "Viet Nam!". The party never recovered.

Communism inherited the field. Born Nguyễn Sinh Cung in Nghệ An in 1890, Ho had left Saigon in 1911 as a kitchen helper on a French ship. In 1919, as Nguyễn Ái Quốc, he and the Group of Vietnamese Patriots petitioned the Versailles peace conference and were ignored; whether this was a lost "Wilsonian moment" is disputed, since he was already drawn to socialism. He became a founding member of the French Communist Party in 1920 and in 1925 founded the Vietnamese Revolutionary Youth League in Canton. On 3 February 1930, at a meeting in Hong Kong that he chaired, rival communist groups merged into the Vietnamese Communist Party; in October 1930, on Comintern instructions, it was renamed the Indochinese Communist Party (ICP), to cover Cambodia and Laos as well.

That year strikes in Vinh spread to peasants demanding an end to head taxes and corvée, who formed the Nghệ-Tĩnh soviets and attacked the alcohol monopoly's depots. On 12 September 1930 French planes bombed demonstrators at Hưng Nguyên, killing 140–200. By early 1932 tens of thousands were imprisoned and 99 per cent of ICP cadres killed or arrested. Women stood in the front rank: Nguyễn Thị Minh Khai, from Vinh, worked for Ho in the Comintern's Hong Kong office before a French firing squad executed her in 1941.

The anticolonial world was wider than the ICP. In Saigon the Trotskyist Tạ Thu Thâu and his paper *La Lutte* won the 1939 Cochinchina Council elections against communists and moderates alike. In the south new religions, Cao Đài (1926) and Hòa Hảo (1939), gathered followings and later fielded armies. In Cambodia Son Ngoc Thanh and Pach Chhoeun founded *Nagaravatta*, the first Khmer-language newspaper, in 1936.

```checkpoint
q: Which statement about the founding of Vietnam's communist party is accurate?
a*: Rival groups merged into the Vietnamese Communist Party in Hong Kong on 3 February 1930, and it was renamed the Indochinese Communist Party in October 1930.
a: Ho Chi Minh founded the Indochinese Communist Party in Hanoi in 1925.
x: In 1925 Ho founded the Vietnamese Revolutionary Youth League, in Canton, not a party in Hanoi.
a: The party was founded by the VNQDĐ after the Yên Bái mutiny.
x: The VNQDĐ was a separate nationalist party modelled on the Kuomintang, and it was crushed after Yên Bái.
a: The party was called "Indochinese" from the start because Cambodians founded it.
x: The renaming came in October 1930, on Comintern instructions, so that the party would also cover Cambodia and Laos.
hint: Two names, two dates in the same year.
why: The sequence shows both the merger of rival Vietnamese groups and the Comintern's Indochina-wide design.
---
q: How did French rule in Indochina raise much of its revenue in its early decades?
a: From a tax on rubber exports paid by Michelin.
x: Rubber mattered later; the core of early revenue came from state monopolies.
a: From subsidies sent from Paris.
x: Doumer's aim was to make the colony pay for itself, and even First World War recruits were charged to the Indochina budget.
a*: From monopolies on opium, salt and rice alcohol, with village quotas, which supplied about 44 per cent of the budget in 1920.
a: From voluntary contributions by village notables.
x: Villages were not giving freely; they were compelled to buy set quotas of monopoly goods.
hint: Think of Paul Doumer's three products.
why: The monopolies made colonial rule a daily burden on villages, which is why their depots became targets in 1930.
```

## War, Coup and Famine, 1940–1945

In September 1940 Vichy France granted Japan military access to Tonkin, and by 1941 Japanese troops controlled the colony while Admiral Jean Decoux's French administration stayed in place, as the chapter on Japan's Empire in Asia, 1895–1945 describes. In May 1941, at Pác Bó, Ho founded the Việt Minh, the League for the Independence of Vietnam. On 9 March 1945 Japan overthrew the French. Under Japanese direction Bảo Đại declared Vietnamese independence, Sihanouk proclaimed the Kingdom of Kampuchea, and Luang Prabang declared independence.

From October 1944 the north starved. The French compelled peasants to sell rice at a fixed low price while market prices soared; Japanese and French requisitioned grain, peasants were forced to plant jute, rice and maize were burned as fuel once American bombing cut coal supplies, and drought and floods completed the disaster. How many died is itself political. Ho's declaration of 2 September 1945 spoke of more than 2 million; 2 million remains the Party's official figure. Research puts it lower: Furuta Motoo, after joint Vietnamese–Japanese fieldwork in the early 1990s, judged it probably over a million but doubted 2 million; David Marr gives a million or more; Gregg Huff works with about a million. Overall estimates run from 400,000 to 2 million. The Việt Minh grew into a mass movement by seizing Japanese rice granaries.

## The August Revolution

Japan surrendered on 15 August 1945. The Việt Minh took Hanoi on 19 August, and in Huế on 30 August Bảo Đại handed over the seal and sword of his dynasty to become "citizen Vĩnh Thụy". On 2 September, at Ba Đình Square, Ho read the Declaration of Independence of the Democratic Republic of Vietnam (DRV), opening with the American Declaration and invoking the French Rights of Man.

Pierre Asselin reads the American opening as a strategic bid for Allied support that concealed Ho's communist ties. Yet no foreign state recognised the DRV for five years. The revolution was also a struggle among Vietnamese: the Việt Minh executed Tạ Thu Thâu in September 1945 and in 1946 jailed or drove into exile many members of the VNQDĐ and the Đại Việt. In Laos Prince Phetsarath's Lao Issara ("Free Laos") proclaimed independence on 12 October 1945; in Cambodia the French arrested Son Ngoc Thanh the same day.

## The French War, 1946–1954

A 1946 agreement let French troops return to the north, but talks failed. On 23 November 1946 the French bombarded Haiphong. Estimates of the Vietnamese dead range from a few hundred to 20,000; most run from about 2,000 to 6,000. Paul Mus gave 6,000, the most cited figure; Ho's own letter said about 3,000; General Valluy claimed only 300. Fighting in Hanoi on 19 December began the First Indochina War.

France answered with the "Bảo Đại solution": the Élysée Accords of 1949 created a State of Vietnam within the French Union. The war turned in 1950, when China and the Soviet Union recognised the DRV and Chinese arms began to flow; by 1954 the United States paid about 80 per cent of France's costs. France's army was itself imperial, with North and West African troops, Legionnaires, and Vietnamese, Lao and Cambodian soldiers; the French left called it *la sale guerre*, "the dirty war". Cambodia and Laos won independence in late 1953. In 1950 Prince Souphanouvong, "the Red Prince", convened the Lao Freedom Front at Việt Minh headquarters, the root of the Pathet Lao. The siege of Dien Bien Phu, ended on 7 May 1954, is told in the chapters on Decolonization and The Vietnam War. Estimates of the war's dead vary widely; one compilation gives 400,000 to about 843,000, and civilian deaths are put at 125,000–400,000.

## Geneva and the Two Vietnams

At Geneva in 1954, three ceasefire agreements covered Vietnam, Laos and Cambodia. Vietnam was divided at the 17th parallel, with elections promised only in an unsigned declaration. China's Zhou Enlai pressed the Việt Minh to withdraw from Laos and Cambodia, a blow to Hanoi's hopes of leading its Lao and Khmer allies. Nearly a million northerners moved south and some 100,000–150,000 southerners went north.

In the North a land reform modelled on China's, pushed by Trường Chinh, turned into terror. A Politburo document of 1953 fixed executions "in principle" at one per thousand people. Estimates of executions range from 800 to 200,000: Edwin Moïse first put them at 3,000–15,000 and later at about 13,500; Tuong Vu finds the number probably above 13,500 including suicides; 50,000 was once widely accepted. Of the 172,008 people classified as landlords or rich peasants, 71.66 per cent by one Vietnamese count had been wrongly categorised, and Trường Chinh was forced to resign as party leader in 1956. In the South Ngô Đình Diệm, a Catholic from a mandarin family of Huế, built a regime on Personalism and Confucian ideas. His rule and fall, the National Liberation Front, American escalation and the fall of Saigon on 30 April 1975 belong to the chapter on The Vietnam War.

## Cambodia and Laos in Their Own Right

Norodom Sihanouk, who had led Cambodia's "Royal Crusade" for independence, abdicated as king in 1955 to enter politics. He coined the name *Khmers rouges* for his leftist opponents, whose leaders, including Saloth Sar (Pol Pot), had studied in Paris. Lon Nol deposed Sihanouk in March 1970, and Sihanouk allied with the Khmer Rouge. Ben Kiernan attributes 50,000–150,000 deaths to American bombing. On 17 April 1975 the Khmer Rouge took Phnom Penh and emptied the cities. Between 1.5 and 2 million people died under their rule, some 20–25 per cent of the population, as the chapters on Modern Southeast Asia and Global Cold War and the Arms Race describe. Victims included Chinese Cambodians, Cham and about 20,000 Vietnamese, and Radio Phnom Penh called on Cambodians to "exterminate the 50 million Vietnamese".

In Laos, Kaysone Phomvihane, son of a Vietnamese colonial civil servant and a Lao mother, joined the ICP in 1949 and led the Lao People's Party founded in 1955. The CIA's "Secret War" relied on about 30,000 Hmong, Mien and Khmu irregulars under General Vang Pao. On 2 December 1975 King Savang Vatthana abdicated and the Lao People's Democratic Republic was proclaimed, with Kaysone as prime minister and Souphanouvong as president. The royal family died in labour camps, thousands were sent to "re-education", and about a third of Lao Hmong left the country.

{{image: Ho Chi Minh | Ho Chi Minh, born Nguyễn Sinh Cung in Nghệ An, who chaired the founding of the Vietnamese Communist Party in 1930 and proclaimed the Democratic Republic of Vietnam in 1945.}}

## After 1975: Camps, Boats and the Third Indochina War

Vietnam was formally reunified on 2 July 1976. South Vietnamese soldiers and officials told to bring supplies for days or a month to "re-education" stayed for years, some up to 18; at least 200,000–300,000 were held, and other estimates say 500,000 to 1 million passed through the camps. From 1978 ethnic Chinese left in large numbers and the exodus by sea swelled. Almost 800,000 boat people reached other countries between 1975 and 1995; the UN refugee agency estimates 200,000–250,000 died at sea, others say up to 400,000, while the journalist Barry Wain suggested 30,000.

Khmer Rouge raids killed, by the Vietnamese government's count, some 30,000 Vietnamese civilians, including 3,157 at Ba Chúc in April 1978. Vietnam signed a treaty with the Soviet Union and, on 25 December 1978, invaded Cambodia, taking Phnom Penh on 7 January 1979 and installing the People's Republic of Kampuchea under Heng Samrin, a Khmer Rouge defector. Vietnamese and many Cambodians remember the invasion as liberation; internationally it was treated as aggression, and the United Nations kept recognising Democratic Kampuchea. The occupation lasted until September 1989. China, in Deng Xiaoping's words, set out to teach Vietnam "a lesson": on 17 February 1979 about 200,000 Chinese troops invaded, withdrawing by 16 March.

## Đổi Mới

By the mid-1980s inflation exceeded 700 per cent and Soviet aid was falling. After Lê Duẩn died in July 1986, the Sixth Party Congress that December chose the reformer Nguyễn Văn Linh, a former NLF leader, and launched Đổi Mới ("renovation"), aiming at a "socialist-oriented market economy". The 1988 Land Law recognised private land-use rights, and Resolution 10 freed farmers from compulsory cooperatives to sell on the market.

```checkpoint
q: How do estimates of deaths in the 1944–45 famine compare?
a: All historians accept the official figure of exactly 2 million.
x: Researchers such as Furuta Motoo were sceptical of 2 million.
a*: The Party's official figure is 2 million, while researchers such as Furuta Motoo, David Marr and Gregg Huff put it at around a million or more.
a: The famine killed about 50,000, mostly in the Mekong Delta.
x: The famine struck the north, and estimates start at 400,000.
a: No estimates exist because all records were destroyed.
x: There are many estimates, from reports in 1945 to joint Vietnamese–Japanese fieldwork in the 1990s.
hint: Compare Ho's declaration with later research.
why: Death tolls are part of politics; the official figure and the research figures each have their own origins.
---
q: What happened when Vietnam invaded Cambodia in December 1978?
a: The United Nations immediately recognised the new government in Phnom Penh.
x: The UN kept recognising Democratic Kampuchea, the Khmer Rouge state.
a: Vietnamese troops withdrew within a month.
x: The occupation lasted until September 1989.
a: The Soviet Union invaded Vietnam in response.
x: Vietnam had just signed a treaty with the Soviet Union; it was China that attacked Vietnam in February 1979.
a*: Vietnamese forces took Phnom Penh on 7 January 1979 and set up the People's Republic of Kampuchea, beginning a ten-year occupation.
hint: Think of Heng Samrin and the date 7 January.
why: The invasion ended Khmer Rouge rule but opened the Third Indochina War, including China's attack.
```

## How Historians Argue

The oldest question is whether the revolution was nationalism in communist dress or the reverse. Ho himself wrote in 1960 that "patriotism, not yet communism" first drew him to Lenin. David Marr traced a modern nationalism emerging in the 1920s and 1930s and rebuilt the August Revolution as a contingent struggle, against the Party's triumphal story. Tuong Vu argues that communist ideology, not patriotism alone, drove the revolution and its foreign policy, though reviewers note that he too sees the two as intertwined.

A second debate asks whether there was one Vietnam or many. Christopher Goscha stresses contingency and rival visions, including non-communist republicans, and has shown nationalists imagining their future in Indochinese terms. Violence among Vietnamese from 1945, between the Việt Minh and the VNQDĐ, Đại Việt, Trotskyists, Cao Đài and Hòa Hảo, supports reading the wars as civil as well as anticolonial. Keith Taylor has argued that much earlier English-language writing by anti-war academics was "a recycling into English of the wartime propaganda coming out of Hanoi" (2013). Lien-Hang Nguyen, using Vietnamese archives, shows Lê Duẩn and Lê Đức Thọ rather than Ho steering Hanoi from about 1960. The American argument between "orthodox" and "revisionist" historians is set out in the chapter on The Vietnam War.

On colonialism, Pierre Brocheux and Daniel Hémery describe an "ambiguous colonization", exploitative yet modernising, while Ngô Vĩnh Long wrote of peasants under the French in terms of exploitation. On Cambodia, Kiernan and the 2018 tribunal verdict call the killings genocide, while Vickery and Heder doubt they were racially motivated, as the chapter on Modern Southeast Asia explains.

## Further exploration

- **Christopher Goscha, *Vietnam: A New History* (2016).** A Vietnamese-centred history stressing contingency and rival visions of Vietnam.
- **Pierre Brocheux and Daniel Hémery, *Indochina: An Ambiguous Colonization, 1858–1954* (2009).** The standard history of French Indochina as a whole.
- **David G. Marr, *Vietnam 1945: The Quest for Power* (1995).** The August Revolution reconstructed, with the famine at its centre.
- **Ngô Vĩnh Long, *Before the Revolution: The Vietnamese Peasants Under the French* (1973).** A Vietnamese scholar on rural life under colonial rule.
- **Lien-Hang T. Nguyen, *Hanoi's War: An International History of the War for Peace in Vietnam* (2012).** Hanoi's leadership seen from Vietnamese archives.
- **Tuong Vu, *Vietnam's Communist Revolution: The Power and Limits of Ideology* (2017).** The case that ideology, not patriotism alone, drove the revolution.
- **Loung Ung, *First They Killed My Father* (2000).** A Cambodian survivor's memoir of the Khmer Rouge years.$mn_indochina_master$,
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
  select $mn_indochina_quiz$[
    {"type": "mcq", "prompt": "When was Laos formally included in the Indochinese Union?", "options": ["1887, at the Union's founding", "From 1899, after the Franco-Siamese crisis of 1893", "1907, with Battambang and Siem Reap", "1945, after the Japanese coup"], "answerIndex": 1, "explanation": "The Union of 1887 joined Cochinchina, Annam, Tonkin and Cambodia; Siam ceded the lands east of the Mekong in 1893, and Laos was formally included from 1899.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened at Yên Bái in February 1930?", "options": ["Vietnamese colonial soldiers, with VNQDĐ civilians, mutinied against their French officers and failed within a day", "The Indochinese Communist Party was founded", "Michelin workers began the Red Phú Riềng strike", "Bảo Đại abdicated"], "answerIndex": 0, "explanation": "About 50 soldiers and some 60 VNQDĐ civilians rose on 10 February 1930; Nguyễn Thái Học and twelve others were guillotined there on 17 June.", "id": "q2"},
    {"type": "mcq", "prompt": "How many people did the French bombardment of Haiphong on 23 November 1946 kill?", "options": ["Exactly 300, as General Valluy said", "Exactly 20,000", "Fewer than 100", "Most estimates run from 2,000 to 6,000, with Paul Mus's 6,000 the most cited and Ho's own letter giving about 3,000"], "answerIndex": 3, "explanation": "Figures differ by source: Valluy gave 300, Ho about 3,000, Mus 6,000, and Việt Minh propaganda 10,000–20,000.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the 1988 Land Law and Resolution 10 do under Đổi Mới?", "options": ["Nationalised all farmland", "Recognised private land-use rights and freed farmers from compulsory cooperatives to sell on the market", "Returned land to French plantation owners", "Revived the land reform of 1953–56"], "answerIndex": 1, "explanation": "Đổi Mới, launched at the Sixth Party Congress in December 1986, aimed at a 'socialist-oriented market economy'.", "id": "q4"},
    {"type": "open", "prompt": "Was Vietnam's revolution driven more by nationalism or by communism? Use the historians' arguments.", "rubric": "A strong answer cites Ho's 1960 statement that patriotism first drew him to Lenin; Marr's account of a modern nationalism from the 1920s and of 1945 as contingent; Tuong Vu's case that ideology was central (while seeing the two as intertwined); and evidence such as the ICP's Comintern links and renaming in 1930, the declaration's American opening and Asselin's reading of it, the Việt Minh's repression of rival nationalists and Trotskyists, and the land reform. It may add Goscha's rival visions of Vietnam.", "id": "q5"},
    {"type": "open", "prompt": "Why should the wars of 1945–1989 be seen as Indochinese, not only Vietnamese or American?", "rubric": "A strong answer uses Cambodia and Laos: the ICP's Indochina-wide design, Vietnamese migration into colonial Laos, the Lao Issara and Pathet Lao, Geneva's three agreements and Zhou Enlai's pressure, the Secret War with Hmong irregulars, the Khmer Rouge regime and its killing of 1.5–2 million, the Lao revolution of 1975, Vietnam's 1978–89 occupation of Cambodia (liberation or aggression), and China's 1979 attack; and notes debates over genocide (Kiernan vs Vickery and Heder) and the civil-war reading of Vietnam's wars.", "id": "q6"}
  ]$mn_indochina_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/indochina-and-modern-vietnam-1880s-1980s', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
