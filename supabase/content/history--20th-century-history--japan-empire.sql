-- Japan's Empire in Asia, 1895–1945 — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/japan-s-empire-in-asia-1895-1945 @ research/advanced/read.
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
    'history/20th-century-history/japan-s-empire-in-asia-1895-1945',
    'research',
    'advanced',
    'read',
    $mn_japan_master$> **An empire built in the name of Asia.** Between 1895 and 1945 Japan became Asia's only modern colonial power. It ruled Taiwan from 1895 and Korea from 1910, turned Manchuria into the client state of Manchukuo in 1932, fought a full-scale war in China from 1937, and in 1941–42 overran Southeast Asia under the banner of a "Greater East Asia Co-Prosperity Sphere". This chapter follows that empire largely through the people it ruled: Taiwanese and Indigenous Seediq, Koreans, Chinese civilians, the labourers of Java and the Burma Railway, and the women forced into the military's "comfort stations". It ends with the Tokyo Trial and the unsettled arguments over memory that the empire left behind.

## Asia's Only Modern Colonial Power

The chapter on the Meiji Restoration describes how Japan took Taiwan in 1895, annexed Korea in 1910 and faced continued armed resistance in Taiwan, up to the Tapani uprising of 1915. Japan's leaders drew on Western precedents, including the Monroe Doctrine, to justify expansion, and around 1905 the statesman Katsura Tarō told the *New York Times* that Japan would force "upon Korea and China the same benefits of modern development that have been in the past forced on us". Colonial ideology preached the unity of Asian peoples under Japanese leadership against Western imperialism; in practice it installed bureaucrats and engineers devoted to efficiency.

Was this empire like Europe's? Peter Duus called Meiji expansion "backward imperialism", shaped by a sense of inferiority to the West; the political scientist Atul Kohli argues that because Japan was itself a late developer, its colonialism was more intense and "architectonic" than Europe's.

## Taiwan: Petitions, Musha and Kōminka

Historians divide Japanese rule in Taiwan into military suppression (1895–1915), assimilation, or *dōka* (1915–37), and *kōminka* (1937–45), with a separate policy for Indigenous peoples. Even the name of the period is a political dispute: in 2013 the Kuomintang-led government ordered "Japanese occupation", while the historian Chou Wan-yao prefers "Japanese rule". From 1920 Taiwanese led by Lin Hsien-tang petitioned Tokyo for a Taiwanese parliament; the movement lasted thirteen years and, though it failed, helped prompt local assemblies in 1935.

The last major uprising came from Indigenous people, whom the Japanese classed as *seiban*, "raw barbarians". After years of police misconduct and forced labour, and after a police officer struck his son at a wedding feast, the Seediq leader Mona Rudao of Musha (Wushe) led a revolt. On 27 October 1930 Seediq fighters attacked police posts and then a school where hundreds of Japanese had gathered for an athletics meeting; 134 Japanese, including women and children, and two Han Taiwanese were killed. About 2,000 troops and Indigenous auxiliaries were sent against them, and army aircraft dropped bombs of what was allegedly poison gas; the scholar Haruyama Meitetsu argues that tear gas and at least a few rounds of a cyanide–tear gas mix, not mustard gas, were used. Mona Rudao killed himself on 28 November. Colonial records count 644 Seediq killed or dead by suicide. In April 1931, reportedly, Indigenous groups allied to the Japanese attacked the village where surrendered Seediq were held and beheaded the remaining males over fifteen.

From 1937 *kōminka*, "transforming colonial peoples into imperial subjects", targeted all Taiwanese. Chinese sections of newspapers were removed, Taiwanese opera was banned and Shinto worship encouraged. A name-change campaign from 1940 led about 7 per cent of Taiwanese to take Japanese names. Leo Ching argues that after Musha *kōminka* became the dominant expression of control in policy towards Indigenous peoples; other historians judge that few Taiwanese became "true Japanese", and that many who adopted a Japanese identity did so pragmatically. Taiwan also industrialised: by 1939 industrial output exceeded farm output.

## Korea: Military Rule and the March First Movement

From 1910 the military police ran Korea. A land survey that recognised only written title dispossessed many cultivators who held land by custom.

Wilson's Fourteen Points and the sudden death of the former emperor Gojong in January 1919, amid rumours of poisoning, set the stage for revolt. On 1 March 1919 religious leaders, Cheondoist, Christian and Buddhist, read out a Declaration of Independence at a Seoul restaurant and were arrested, while students read it in Tapgol (Pagoda) Park. Between roughly 1,500 and 1,800 protests drew 800,000 to 2 million people from a population of about 16–17 million. Japanese officials reported 553 Koreans killed between 1 March and 11 April; the Korean historian Park Eun-sik counted 7,509 killed and 46,948 arrested. At Jeamni on 15 April troops lured 20 to 30 villagers into a church, shot them and burned it. Yu Gwan-sun, a 16-year-old student, carried the movement to Cheonan, where military police killed 19 people, including her parents; she died in Seodaemun Prison in 1920 and is remembered as a martyr. Exiles founded a Provisional Government in Shanghai.

Tokyo answered with "cultural rule". Governor-General Saitō Makoto allowed Korean newspapers such as the *Dong-A Ilbo*; a Washington newspaper called the concessions "merely one of those face-saving diplomatic schemes of Japan". The historian Michael Shin argues that control in fact expanded: spending doubled between 1919 and 1921, the police grew, and the management of culture replaced simple punishment. Yet the print boom also helped make the nation, Shin argues, the dominant form of Korean identity.

After the Great Kantō earthquake of 1 September 1923, soldiers, police and vigilantes murdered an estimated 6,000 to 9,000 people, mainly Koreans, testing suspects with Japanese phrases as shibboleths; official reports that September admitted five Korean deaths.

## The Twenty-One Demands and Taishō Democracy

As the chapter on the First World War describes, in 1915 Japan presented China with the **Twenty-One Demands**. Their fifth section would have given Japan a decisive voice in Chinese finance, policing and government; China published the secret demands, Britain and the United States forced Japan to drop that section, and a nationwide boycott of Japanese goods followed.

At home these were the years of "Taishō democracy", usually dated from about 1905 to 1932. A law of 1925 brought universal male suffrage, alongside the Peace Preservation Law. Andrew Gordon calls it "imperial democracy": popular movements demanded a voice while fervently supporting emperor and empire. The Depression, the Manchurian crisis and assassinations, notably of Prime Minister Inukai Tsuyoshi in May 1932, ended party government.

```checkpoint
q: What does the historian Michael Shin argue about Korea's "cultural rule" after 1919?
a*: That colonial control actually expanded, with doubled spending, more police and the management of culture, even as Korean print culture grew.
a: That Japan withdrew from governing Korea's internal affairs.
x: Japan kept full control; Shin argues that control grew rather than shrank.
a: That the concessions were genuine reforms that ended Korean nationalism.
x: Shin argues the print boom fed nationalism, which became a popular movement after 1919.
a: That cultural rule began only in 1937.
x: Cultural rule followed the March First Movement of 1919; 1937 began the kōminka era.
hint: Look at what happened to spending and the police between 1919 and 1921.
why: Shin's argument turns the apparent liberalisation of the 1920s into a more effective form of colonial power.
---
q: Why do accounts of the Musha uprising of 1930 say the Japanese "allegedly" used poison gas?
a: Because no aircraft took part in the suppression.
x: Army aircraft did drop bombs on the Seediq; the dispute is over what they contained.
a: Because the uprising was put down by Indigenous auxiliaries alone.
x: About 2,000 troops were sent as well as Indigenous auxiliaries.
a*: Because what was dropped is disputed; the scholar Haruyama Meitetsu argues that tear gas and a cyanide–tear gas mix, not mustard gas, were used.
a: Because the Seediq used gas first.
x: Nothing in the record suggests the Seediq used gas.
hint: The doubt is about the bombs' contents, not about whether bombs fell.
why: Careful wording keeps an atrocity in view without claiming more than the evidence supports.
```

## Manchuria and Manchukuo

As the chapter on the Interwar Period describes, on 18 September 1931 officers of the Kwantung Army set off a small explosion beside the South Manchuria Railway near Mukden and used it as a pretext to seize Manchuria. Tokyo was shocked by the army acting without orders, and the Korea Army sent reinforcements without authorisation, which Tokyo then accepted.

**Manchukuo**, established on 1 March 1932, had Puyi as Chief Executive and from 1934 as Emperor, but he was a figurehead; Japanese vice-ministers made the decisions. Its motto was "Five Races Under One Union", yet roughly 96 per cent of its people were Chinese, and most of the Han majority held Manchuria to be part of China. The army treated it as a laboratory for a "national defence state". One estimate (Ju Zhifen, 2002) holds that more than ten million Chinese were mobilised for forced labour, and the Nanai people fell by 80–90 per cent through opium, forced labour and relocation. Louise Young shows how the press and organisations at home sold Manchuria as Japan's "lifeline", arguing that "Had they wished, it would have been possible in 1931 and 1932 for journalists and editors to express anti-war sentiments".

## The War in China from 1937

On 7 July 1937 an exchange of fire near the Marco Polo Bridge at Wanping, after a Japanese private went missing during night exercises, escalated into full-scale war; who fired first is still contested. Nanjing fell on 13 December, and the Nationalist government retreated inland, eventually to Chongqing.

At **Nanjing**, Japanese troops killed and raped civilians and prisoners on a mass scale from 13 December 1937. Death toll estimates range from 40,000 (the city alone) to over 340,000 (the whole Shanghai–Nanjing region). The Tokyo tribunal found over 200,000; China's official figure is 300,000; many newer estimates lie between 100,000 and 200,000. The historian Kasahara Tokushi speaks of "more than 100,000 and close to 200,000, or maybe more"; Bob Wakabayashi judges estimates over 200,000 not credible; Ikuhiko Hata gives about 40,000 at most and calls 300,000 a "symbolic figure". Estimates of rapes run from 4,000 to over 80,000, about 20,000 being most common. David Askew describes a "Great Massacre School" and an "Illusion School" in Japan, with Hata as a "centrist".

The Kwantung Army's **Unit 731**, under Ishii Shirō at Pingfang near Harbin, conducted biological and chemical warfare research on prisoners, mainly Chinese, whom it called *maruta*, "logs". At least 3,000 died inside the main facility at Pingfang in 1940–45, the widely accepted figure, and possibly far more. Plague-infected fleas were dropped on Ningbo and Changde, and estimates of deaths from germ warfare in the field run to 200,000 or more.

In northern China, after the Communists' Hundred Regiments Offensive of 1940, anti-guerrilla drives escalated into what the Chinese called the "Three Alls": "kill all, burn all, loot all". The historian Himeta Mitsuyoshi estimates that more than 2.7 million civilians died. Herbert Bix wrote that these operations "caused death and suffering on a scale incomparably greater than the totally unplanned orgy of killing in Nanking". Whether this was genocide is debated: Gavan McCormack thinks it merits consideration; Wakabayashi counters that the victims were killed for resisting.

Estimates of all Chinese war dead range from 10 to 20 million: Odd Arne Westad gives about 14 million, which Rana Mitter considers conservative, and China officially counts more than 35 million casualties, dead and wounded. Tens of millions became refugees. Mitter argues that China's war deserves a central place in the history of the Second World War, because China tied down huge Japanese forces, and that the Cold War buried this story.

## The "Greater East Asia Co-Prosperity Sphere"

In 1938 Japan's government proclaimed a "New Order in East Asia" uniting Japan, Manchukuo and China; in 1940 Foreign Minister Arita Hachirō coined the phrase "Greater East Asia Co-Prosperity Sphere", soon extended to Southeast Asia. Its slogans promised "Asia for the Asiatics", but a secret 1943 study, *Investigation of Global Policy with the Yamato Race as Nucleus*, placed Japan at the top. After an American oil and steel embargo, Japan attacked British and Dutch colonies in December 1941 for their raw materials.

{{image: Greater East Asia Conference | Tokyo, November 1943: the leaders of Japan's "Co-Prosperity Sphere" — Ba Maw, Zhang Jinghui, Wang Jingwei, Tōjō Hideki, Wan Waithayakon, José Laurel and Subhas Chandra Bose.}}

At the Greater East Asia Conference of November 1943, leaders from Manchukuo, Wang Jingwei's regime in China, Burma, the Philippines and Thailand met Tōjō, with Subhas Chandra Bose as an observer; Indonesian leaders were excluded. The conference was mainly propaganda. Burma's Ba Maw spoke there of thinking "with our blood"; after the war he judged differently.

```quote
The militarists saw everything only from a Japanese perspective… only one destiny for the East Asian countries, to become so many Manchukuos or Koreas tied forever to Japan.
Ba Maw · quoted in Lebra · 1975
```

Many Southeast Asians welcomed the Japanese at first, but brutality led many to regard Japan as "worse than their former colonial rulers".

## Occupied Southeast Asia

In the **Philippines**, Bataan fell in April 1942. On the Bataan Death March of some 66,000 Filipino and 12,000 American prisoners, between 5,000 and 18,000 Filipinos and 500–650 Americans died. Most of the elite served the occupiers; 277 guerrilla units fought them. In the battle for Manila in 1945 at least 100,000 civilians died from all causes, including massacres by Japanese troops; about 527,000 Filipinos died in the war.

In **Singapore**, which fell on 15 February 1942, the military police screened Chinese men aged 18 to 50 and massacred many in the *Sook Ching*, "purge through cleansing". Japan claimed no more than about 6,000 dead; Lee Kuan Yew gave about 70,000 including Malaya; historians' estimates run from 25,000 to 50,000 in Singapore, with about 20,000 more in Malaya. Malaya's Chinese were forced to raise M$50 million "as atonement".

In **Indonesia**, Sukarno and Hatta worked with the occupiers, who created the PETA defence force in 1943 and in 1945 a committee that drafted a constitution; Sukarno proclaimed independence on 17 August 1945. The US Library of Congress estimates that 4 to 10 million people in Java were forced to work as *rōmusha*; of 200,000–500,000 sent off Java, the historian Ricklefs estimates, only 70,000 survived. A later UN report estimated that 4 million people died in Indonesia from famine and forced labour. PETA soldiers under Supriyadi mutinied at Blitar in February 1945.

In **Burma**, Aung San's Thirty Comrades trained with the Japanese, and Burma gained nominal independence under Ba Maw in 1943; disillusioned, Aung San's army rose against Japan on 27 March 1945. Between 170,000 and 250,000 Burmese civilians died under occupation. The 415-kilometre **Burma Railway** to Thailand, finished in October 1943, was built by forced labour: estimates of the Southeast Asian civilians made to work on it run from over 180,000 to at least 250,000, of whom more than 90,000 died, along with about 12,000 Allied prisoners of war. Among them were more than 100,000 Malayan Tamils, of whom tens of thousands died, about 60,000 by one estimate.

In northern **Vietnam**, under Japanese occupation and French administration, famine in 1944–45 killed between 400,000 and 2 million people. French compulsory rice purchases, Japanese and French requisitioning, forced planting of industrial crops, American bombing and floods all contributed; the Viet Minh grew by leading seizures of granaries.

Was occupation an accelerant of independence or plain exploitation? Japan trained armies and politicians who led postwar independence movements, yet those same nationalists, Aung San and Supriyadi among them, turned on Japan.

## Mobilising Korea and Taiwan

From 1938 Korea was governed under the slogan *naisen ittai*, "Japan and Korea as one body". All Korean newspapers except the official one were closed in 1940, and Korean was dropped from schools in the early 1940s. In 1911 Japan had forbidden Koreans to take Japanese-style names; now Governor-General Minami Jirō reversed course. Ordinances of 1939 and 1940 required every household to register a family name (*shi*), and officials pressed them to choose Japanese-style ones. Registrations rose from about 3.9 per cent of households in April 1940 to 80.3 per cent by 10 August; refusers faced dismissal, expulsion from school and denial of services. Most historians see compulsion, though they disagree over who drove it, and some argue that many Koreans adopted names to escape discrimination.

From 1939 Koreans were recruited for work in Japan, often with coercion, and from 1942 conscripted. Estimates vary widely: one widely cited figure is 5.4 million Koreans conscripted, of whom about 670,000 were taken to Japan, where about 60,000 died. In Taiwan over 207,000 people worked for the Japanese military in 1937–45, and roughly 50,000 died or went missing.

## The "Comfort Women"

The army opened its first "comfort stations" in Shanghai in 1932 and spread the system after Nanjing, claiming it would prevent rape, venereal disease and leaks of secrets. Women were taken from Korea, China, Taiwan, the Philippines, Burma, Malaya, the Dutch East Indies and elsewhere; more than 2,000 were Taiwanese. Many records were burned in 1945, and numbers are fiercely disputed. Most historians give 20,000 to 200,000. Yoshimi Yoshiaki estimates about 200,000; Su Zhiliang 360,000–410,000, half of them Chinese; Hata fewer than 20,000, mostly as licensed prostitutes, with coercion only in isolated cases in Southeast Asia; other Japanese scholars criticise him for minimising the women's suffering.

Silence was broken on 14 August 1991, when Kim Hak-sun became the first Korean survivor to testify publicly about what had been done to her, and others followed.

In January 1992 Yoshimi published military documents showing the army's involvement, and the government apologised. The Kono Statement of 1993 accepted that women were "in many cases" recruited "against their own will, through coaxing, coercion, etc." Many Korean survivors rejected payments from the semi-official Asian Women's Fund, whose payments came from private donations, as unofficial. In 2007 Prime Minister Abe said there was no evidence that the military had taken women by force, and a 2015 agreement declaring the issue resolved "finally and irreversibly" was hollowed out when South Korea dissolved the Japanese-funded foundation in 2019. Sarah Soh complicates the dominant story by adding Korean patriarchy and recruiters, and is herself criticised; Chizuko Ueno criticises a positivism that privileges official documents over survivors' testimony.

```checkpoint
q: Which statement about the name-change policy (sōshi-kaimei) in Korea is accurate?
a: Koreans were required to take Japanese names from the moment of annexation in 1910.
x: A 1911 order actually forbade Koreans to take Japanese-style names.
a*: Ordinances of 1939 and 1940 reversed a 1911 ban, and about 80 per cent of households registered new surnames within six months under heavy pressure.
a: Only about 7 per cent of Korean households registered new surnames.
x: About 7 per cent is the figure for Taiwanese name changes; in Korea 80.3 per cent of households had registered by August 1940.
a: Historians agree the policy was entirely voluntary.
x: Most historians see official compulsion, though some stress voluntary adoption to avoid discrimination.
hint: The policy reversed an earlier rule.
why: Wartime assimilation overturned the earlier insistence that Koreans keep names distinct from Japanese ones.
---
q: Why are estimates of the number of "comfort women" so far apart?
a: Because the system existed only in Korea and Taiwan.
x: Women were taken from across the empire, including China, the Philippines and the Dutch East Indies.
a: Because no survivors ever testified.
x: Kim Hak-sun testified publicly in 1991, and others followed.
a: Because Japan's government has never acknowledged military involvement.
x: The Kono Statement of 1993 acknowledged military involvement and coercion.
a*: Because many records were burned in 1945, and historians such as Yoshimi, Su Zhiliang and Hata read the evidence very differently.
hint: Think about what happened to the documents.
why: Estimates run from under 20,000 (Hata) to 360,000–410,000 (Su), with most historians between 20,000 and 200,000.
```

## Defeat

On 7 December 1941 (8 December in Tokyo) Japanese carrier aircraft struck Pearl Harbor, killing about 2,400 Americans, while other forces attacked the Philippines, Guam, Wake and British territories. American bombers firebombed more than sixty Japanese cities; about 100,000 died in Tokyo on 9–10 March 1945. The overview of the twentieth century discusses the atomic bombings of Hiroshima and Nagasaki in August and the debate over them; among the dead were about 5,000–8,000 Koreans at Hiroshima and 1,500–2,000 at Nagasaki, many of them labourers brought from Korea. The Soviet Union declared war on 8 August and invaded Manchuria the next day, and Japan signed its surrender on 2 September 1945.

## The Tokyo Trial: Justice or Victors' Justice?

The International Military Tribunal for the Far East, with judges from eleven countries including India and the Philippines, tried 28 Japanese leaders from 1946. Seven were hanged in December 1948, among them Tōjō and Matsui Iwane, of whom the judgment said: "He did nothing, or nothing effective, to abate these horrors."

Much was left out. Emperor Hirohito was not prosecuted; Prince Asaka, the ranking officer at Nanjing at the height of the atrocities, received immunity as an imperial family member; Ishii and other Unit 731 men received American immunity in exchange for their data. Crimes against Koreans and Taiwanese were not prosecuted, and sexual enslavement was not addressed. The French judge Henri Bernard objected that the war "had a principal author who escaped all prosecution". The Indian judge Radhabinod Pal dissented completely, rejecting the retroactive charge of crimes against peace. Japanese nationalists later embraced his dissent, and a monument to him stands at Yasukuni, though Pal also called the evidence of atrocities "overwhelming".

## Memory, Apology and Textbooks

In 1995 Prime Minister Murayama expressed "deep remorse" and a "heartfelt apology" for Japan's "colonial rule and aggression". Koizumi repeated that language in 2005, but his visits to Yasukuni, which enshrines 14 men charged as Class A war criminals, worsened relations with Japan's neighbours.

Textbooks became a battleground. The historian Ienaga Saburō sued the state from 1965, and in 1997 the Supreme Court found that censoring his passages on Unit 731 and rape at Nanjing had been illegal. In 1982 a press report that the Education Ministry had softened "invaded" to "advanced" in a textbook caused a diplomatic crisis with China; investigations that September found the change had not actually been made in that edition, but the government adopted a "Neighbouring Country Clause" for textbook screening. By the late 1990s most textbooks mentioned Nanjing, Unit 731 and the comfort women.

Historians also argue over what colonial rule did to Korea and Taiwan. Korean nationalist history stresses plunder and resistance. Kohli traces the "Japanese lineage" of South Korea's later developmental state to the colonial apparatus; critics reply that postwar growth came partly from reversing colonial policies. Shin and Robinson's *Colonial Modernity in Korea* asks instead how modernity was produced and turned to domination. Mark Caprio insists that "Japan's colonial policies systematically excluded the majority of Koreans from these institutions of modernity."

## Further exploration

- **Ramon H. Myers and Mark R. Peattie (eds.), *The Japanese Colonial Empire, 1895–1945* (1984).** The classic survey by leading, mainly American, specialists, setting Japan's empire within global colonialism.
- **Leo T. S. Ching, *Becoming "Japanese": Colonial Taiwan and the Politics of Identity Formation* (2001).** How assimilation and *kōminka* shaped Taiwanese identities.
- **Gi-Wook Shin and Michael Robinson (eds.), *Colonial Modernity in Korea* (1999).** Essays that move beyond the story of repression and resistance.
- **Louise Young, *Japan's Total Empire: Manchuria and the Culture of Wartime Imperialism* (1998).** How media, universities, and women's and youth groups at home built support for Manchukuo.
- **Rana Mitter, *Forgotten Ally: China's World War II, 1937–1945* (2013).** Published in Britain as *China's War with Japan, 1937–1945*; puts China's war at the centre.
- **Yoshiaki Yoshimi, *Comfort Women: Sexual Slavery in the Japanese Military During World War II* (2000).** The documentary case for military responsibility, translated by Suzanne O'Brien.
- **C. Sarah Soh, *The Comfort Women: Sexual Violence and Postcolonial Memory in Korea and Japan* (2008).** A contested study of colonialism and Korean patriarchy together.$mn_japan_master$,
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
  select $mn_japan_quiz$[
    {"type": "mcq", "prompt": "What policy did Japan apply to Korean names in 1911, before the wartime name-change campaign?", "options": ["It forbade Koreans to take Japanese-style names", "It required all Koreans to adopt Japanese surnames", "It required Koreans to register Chinese-style names", "It had no policy on Korean names until 1945"], "answerIndex": 0, "explanation": "A 1911 order forbade Koreans to take Japanese-style names. Only the ordinances of 1939 and 1940 under Governor-General Minami Jirō required households to register a family name, with officials pressing for Japanese-style ones, and about 80 per cent had registered by August 1940.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best describes the range of estimates for deaths in the Nanjing massacre?", "options": ["All historians accept the Chinese official figure of 300,000", "Estimates run from about 40,000 (the city alone) to over 340,000 (the wider region), with many newer estimates between 100,000 and 200,000", "Japanese historians agree on fewer than 10,000 deaths", "The Tokyo tribunal found about 40,000 deaths"], "answerIndex": 1, "explanation": "Estimates depend on area, period and method: Hata gives about 40,000 at most, the Tokyo tribunal over 200,000, China officially 300,000, and many newer estimates (such as Kasahara's and Wakabayashi's) fall between 100,000 and 200,000.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened in the 1982 textbook controversy?", "options": ["Japan's Supreme Court banned all mention of Nanjing in textbooks", "The Ministry of Education was proven to have changed 'invaded' to 'advanced' in that year's edition", "A press report that the ministry had softened 'invaded' to 'advanced' caused a diplomatic crisis, though investigations found that change had not actually been made in that edition", "China and Japan agreed on a joint history textbook"], "answerIndex": 2, "explanation": "The press report sparked protests from China and led to the 'Neighbouring Country Clause' in textbook screening, but investigations that September found that the particular change had not been made in that edition.", "id": "q3"},
    {"type": "mcq", "prompt": "According to the figure widely accepted in the literature, how many people died inside Unit 731's facility at Pingfang?", "options": ["Fewer than 100", "About 500", "About 30", "At least 3,000, and possibly far more"], "answerIndex": 3, "explanation": "At least 3,000 is the widely accepted figure for deaths inside the main facility in 1940–45; other claims run higher. Estimates of deaths from germ warfare in the field run to 200,000 or more.", "id": "q4"},
    {"type": "open", "prompt": "Was Japanese rule in Korea a form of 'colonial modernity' or of colonial exploitation? Set out the main positions in the debate.", "rubric": "A good answer presents the debate as a debate. Korean nationalist history stresses plunder, repression and resistance (for example the land survey that dispossessed customary cultivators, the repression of the March First Movement with Japanese officials reporting 553 dead by 11 April and later counts running from about 800 to 7,509, forced name changes and labour conscription). Atul Kohli argues that South Korea's later developmental state had a 'Japanese lineage' in the colonial apparatus; critics reply that postwar growth came partly from reversing colonial policies. Shin and Robinson's Colonial Modernity in Korea asks how modernity was produced and turned to domination, and Mark Caprio stresses that colonial policies 'systematically excluded the majority of Koreans' from modern institutions. Strong answers may mention Michael Shin's view that 'cultural rule' expanded control while feeding Korean nationalism, or the parallel dispute in Taiwan over 'rule' versus 'occupation'.", "id": "q5"},
    {"type": "open", "prompt": "Was the Tokyo Trial 'victors' justice'? Use evidence from the trial and from what it left out.", "rubric": "A good answer weighs both sides. For the trial: 28 leaders were tried by judges from eleven countries, including India and the Philippines; seven were hanged, among them Matsui Iwane, who the judgment said 'did nothing, or nothing effective, to abate these horrors' at Nanjing. Against it, or showing its limits: Radhabinod Pal dissented completely, rejecting the retroactive charge of crimes against peace, and his dissent was later embraced by Japanese nationalists (a monument stands at Yasukuni), though he also called the evidence of atrocities 'overwhelming'; Henri Bernard objected that the war's 'principal author' escaped prosecution, since Hirohito was not tried; Prince Asaka and Unit 731's leaders received immunity; crimes against Koreans and Taiwanese were not prosecuted and sexual enslavement was not addressed. Strong answers note that 'victors' justice' can mean both that the victors judged unfairly and that they left crimes unjudged for their own reasons.", "id": "q6"}
  ]$mn_japan_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/japan-s-empire-in-asia-1895-1945', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
