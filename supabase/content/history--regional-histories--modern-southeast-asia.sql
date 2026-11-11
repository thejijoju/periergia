-- Modern Southeast Asia — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/modern-southeast-asia @ research/advanced/read.
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
    'history/regional-histories/asia/modern-southeast-asia',
    'research',
    'advanced',
    'read',
    $mn_seasia_master$> **From colonial patchwork to an eleven-member ASEAN.** In the nineteenth century the Dutch, British, Spanish, Americans, French and Portuguese divided almost all of Southeast Asia among them; only Siam was never colonised. This chapter follows the region from the Java War to the present: the colonial regimes and the migrant labour that built their plantations; Siam's survival by reform; the nationalists and rebels who imagined new nations; the Japanese occupation as a violent rupture; independence won by many roads; the Cold War massacres in Indonesia and Cambodia and the dictatorship of Marcos; ASEAN, the "tiger cub" economies and the crash of 1997; and the coups, democratic movements and atrocities of recent decades, from Myanmar to Timor-Leste. Throughout, it asks how the region's history can be told from within, not merely as an appendix to Europe's.

## A Region Seen from Within

In 1961 the historian John R. W. Smail published "On the Possibility of an Autonomous History of Modern Southeast Asia". Building on J. C. van Leur, he criticised the Eurocentric "angle of vision" that saw the region through the deeds of foreigners, and argued that colonial rule should be one part of Southeast Asia's history rather than its definition.

Anthony Reid gave the argument depth. His *Southeast Asia in the Age of Commerce, 1450–1680* (1988 and 1993), following Braudel, treated maritime Southeast Asia as a coherent region whose trade boom, fed by silver and spice demand, gave way to a seventeenth-century crisis caused partly by Dutch monopolies. Victor Lieberman countered that the pattern fits the islands, not the mainland. Either way, colonial rule followed a vigorous indigenous commercial age. The earlier kingdoms belong to the chapter on Angkor, Srivijaya, and Medieval Southeast Asia, and the Dutch company to the chapter on Trading Companies and Empires.

## The Colonial Patchwork

**The Dutch East Indies.** On Java, Prince **Diponegoro** led a war against the Dutch from 1825 to 1830 that killed, by Carey's estimate, at least 200,000 Javanese civilians through violence, disease and starvation. To recover the war's cost, Governor-General Johannes van den Bosch introduced the **Cultivation System** in 1830, which Indonesian historians call *tanam paksa*, "enforced planting". Villages were meant to give a fifth of their land to export crops such as sugar and coffee, or 66 days' labour a year; in practice more was often taken. At its peak the system supplied about half of Dutch state revenue. As export crops displaced rice, famines and epidemics struck Cirebon and Central Java in the 1840s, and recent research finds mortality rose by as much as 30 per cent. Laws of 1870 ended the system, though forced labour persisted in other forms, and from 1901 the Dutch proclaimed an "Ethical Policy" of repaying a "debt of honour" to the Indies. The war in Aceh from 1873 is told in the chapter on Imperial Expansion and Resistance.

**British Burma and Malaya.** Three Anglo-Burmese wars, in 1824–26, 1852 and 1885, brought all of Burma under British rule; the last ended with King Thibaw a prisoner and was followed by a decade of resistance. Stamford Raffles secured a trading port on Singapore island in 1819, and Singapore, Penang and Malacca became the **Straits Settlements**, a Crown colony from 1867. In the Malay states Britain ruled through the sultans: the Pangkor Treaty of 1874 required the Sultan of Perak to accept a British Resident "whose advice must be asked and acted upon on all questions other than those touching Malay religion and custom". A Federated Malay States followed in 1895.

**The Philippines.** Under Spain, the novelist **José Rizal**, whose *Noli Me Tángere* (1887) and *El filibusterismo* (1891) are read together as a national epic, was executed in Manila in December 1896. The secret society **Katipunan** began a revolution that August, and independence was proclaimed on 12 June 1898. But by the Treaty of Paris of December 1898 the United States annexed the islands, and war began in February 1899. The Americans declared it over in July 1902, though fighting in the south went on until 1913. Its toll is disputed. The US State Department says it killed over 4,200 American and over 20,000 Filipino combatants and that "as many as 200,000 Filipino civilians died from violence, famine, and disease"; modern historians generally put civilian deaths at 200,000–250,000, and some estimates reach a million. Luzviminda Francisco cited a reported claim by General James M. Bell of over 600,000 dead in Luzon alone; John M. Gates calls that unfounded and, from census data, puts the maximum possible war-related deaths of 1898–1903 at 321,000. On Samar, General Jacob H. Smith reportedly ordered the killing of everyone over ten; a *New York Journal* cartoon of 5 May 1902 took "KILL EVERY ONE OVER TEN" as its caption. A 1934 act promised independence after ten years.

**French Indochina.** France joined Cochinchina, Annam, Tonkin and Cambodia in the Indochinese Union in 1887 and added Laos after the crisis of 1893, when French gunboats forced their way up the Chao Phraya to blockade Bangkok and Siam ceded the lands east of the Mekong. Vietnam's long wars against France and then the United States are told in the chapter on the Vietnam War.

## Siam: Survival by Reform

Thailand is described as the only Southeast Asian state never colonised by a Western power, but its independence came at a price. The Bowring Treaty of 1855 fixed import duties at 3 per cent, admitted British opium and gave British subjects extraterritorial rights. King **Chulalongkorn** (Rama V, reigned 1868–1910) combined modernisation with territorial concessions to Britain and France. He abolished slavery gradually, citing the bloodshed of the American Civil War as a reason to avoid an abrupt break; an act of 1905 ended it in all forms. In 1909 Siam gave up its claims to Kedah, Kelantan, Perlis and Terengganu in return for Britain giving up most of its extraterritorial jurisdiction and a railway loan.

On 24 June 1932 the People's Party, Khana Ratsadon, including Pridi Banomyong and Plaek Phibunsongkhram, ended absolute monarchy, and in 1939 the country was renamed Thailand. The Thai historian **Thongchai Winichakul** has critiqued the national historiography: in *Siam Mapped* (1994) he argued that modern mapping itself created the nation's "geo-body", the bounded territory later histories took for granted.

## Migrants and Plural Societies

Sunil Amrith estimates that "somewhere around 28 million people crossed the Bay of Bengal in both directions between 1840 and 1940", mainly between India and Burma and Malaya, though the statistics are unreliable. Many Tamils came through the **kangani** system, recruited by foremen through village networks. Indians cleared land for rubber and built roads, railways and ports; they numbered about 120,000 in British Malaya in 1901 and 640,000 in Malaya and Singapore by 1931. Chinese miners, as the chapter on the Second Industrial Revolution describes, made Malaya the world's largest tin producer. The resulting "plural society" shaped later ethnic politics.

## Nationalists and Rebels

Indonesia dates its "National Awakening" to **Budi Utomo**, founded by medical students in Batavia on 20 May 1908. **Sarekat Islam** began in 1911 among Muslim batik traders and claimed around a million members by 1916; its communist members split off in 1921 to join the Communist Party of Indonesia (PKI). The chapter on the Interwar Period follows Sukarno's party and the Youth Pledge of 1928.

In Burma the physician and former monk **Saya San** proclaimed himself king and led the Galon rebellion of 1930–32; he was executed in November 1931. James C. Scott used the rising in *The Moral Economy of the Peasant* (1976) to argue that peasants put subsistence security first and rebel when colonial states and markets break the moral obligations of the powerful. **Aung San**, expelled from Rangoon University with U Nu in 1936, joined the Thakin Society, trained with the "Thirty Comrades" under Japanese officers on Hainan, and in December 1941 founded the Burma Independence Army in Bangkok. In the Philippines, the historian **Reynaldo Ileto** later showed in *Pasyon and Revolution* (1979) that ordinary Filipinos understood the revolution of 1896 through the language of Christ's Passion.

```checkpoint
q: What was the Dutch Cultivation System (1830–1870)?
a*: A forced system in which Javanese villages gave land or labour to government export crops, supplying about half of Dutch state revenue at its peak.
a: A Dutch programme to buy rice from Javanese farmers at fair prices.
x: It displaced rice with export crops and was linked to famine in the 1840s.
a: A British system of indirect rule through Malay sultans.
x: That describes the Residents imposed on the Malay states from the Pangkor Treaty of 1874.
a: The Dutch "Ethical Policy" of welfare reform.
x: The Ethical Policy came later, from 1901.
hint: Indonesian historians call it tanam paksa, "enforced planting".
why: The system financed the Netherlands at the cost of Javanese food security.
---
q: How did Siam remain independent while its neighbours were colonised?
a: By defeating France in the crisis of 1893.
x: In 1893 French gunboats blockaded Bangkok and Siam ceded land east of the Mekong.
a: By refusing all treaties with Western powers.
x: Siam signed the Bowring Treaty with Britain in 1855, granting low duties and extraterritoriality.
a*: By combining reforms under Chulalongkorn with concessions of trade privileges and territory to Britain and France.
a: Because the United States guaranteed its borders.
x: Siam's treaties and concessions were with Britain and France, not the United States.
hint: Think of the Bowring Treaty, 1893 and 1909.
why: Siam's independence was real but costly, and Thongchai Winichakul has shown how its national story was itself constructed.
```

## The Japanese Occupation, 1941–45

The chapter on Japan's Empire in Asia, 1895–1945, tells of the Burma Railway and the "comfort women". In Burma, declared nominally independent under Ba Maw in 1943, between 170,000 and 250,000 civilians died under occupation. In Indonesia the Japanese mobilised *rōmusha*, forced labourers: M. C. Ricklefs estimates that 200,000–500,000 Javanese were sent off the island, of whom only about 70,000 survived, while Shigeru Satō estimates about 270,000 sent, with about 15 per cent dying or stranded. A later United Nations report put deaths from famine and forced labour in Indonesia at 4 million, a high single-source figure. Estimates of the dead in northern Vietnam's famine of 1944–45 range from 400,000 to 2 million. Around 500,000 Filipinos died during the occupation, and the battle for Manila in 1945 killed at least 100,000 civilians, through Japanese massacres and American firepower.

Was the occupation liberation or exploitation? Japan trained the armies that led independence movements, Indonesia's PETA and the Burma Independence Army, yet both turned on it: a PETA unit under Supriyadi mutinied at Blitar in February 1945, and Aung San's army rose against Japan on 27 March 1945.

## Independence by Many Roads

As the chapter on Decolonization describes, Indonesia proclaimed independence on 17 August 1945 and fought the Dutch until sovereignty passed on 27 December 1949, at a cost of about 100,000 Indonesian dead; King Willem-Alexander apologised for "excessive violence" in 2020. The Philippines became independent on 4 July 1946. Burma followed on 4 January 1948, but Aung San, who had agreed terms with Attlee and signed the Panglong agreement with ethnic minority leaders, had been assassinated with most of his cabinet in July 1947.

In Malaya the **Emergency** against communist guerrillas lasted from 1948 to 1960. Under the Briggs Plan some half a million rural people (up to a million counting regrouped workers), mostly Chinese, were moved into "New Villages", which some historians call concentration camps, and at Batang Kali in December 1948 Scots Guards executed 24 unarmed villagers. Malaya became independent on 31 August 1957, and on 16 September 1963 joined Singapore, Sabah and Sarawak in **Malaysia**; Brunei stayed out, becoming fully sovereign only in 1984. Indonesia answered with an armed *Konfrontasi* until 1966. After race riots and political disputes, Tunku Abdul Rahman separated Singapore, which became sovereign on 9 August 1965. Its prime minister, **Lee Kuan Yew**, told the press:

```quote
For me, it is a moment of anguish because all my life.... you see, the whole of my adult life.... I have believed in merger and the unity of these two territories ….
Lee Kuan Yew · Televised press conference · 9 August 1965
```

## Cold War Battlegrounds

Sukarno, host of the Bandung Conference described in the chapter on the Global Cold War and the Arms Race, ruled from 1959 under "Guided Democracy". After the 30 September Movement killed six generals in 1965, **Suharto** took command of the army and blamed the PKI. In the killings that followed, the most widely published estimates of the dead are 500,000 to 1 million; some reach 2 to 3 million, and the historian Geoffrey Robinson calls 500,000 conservative. As many as 1.5 million were imprisoned, the novelist Pramoedya Ananta Toer among them. Victims included communists, members of the women's organisation Gerwani, trade unionists and ethnic Chinese; army units and paramilitaries, in places the Ansor youth wing of Nahdlatul Ulama, did the killing. A secret CIA report of 1968 judged that the massacres "rank as one of the worst mass murders of the 20th century". They are usually described as politicide and sometimes as genocide; there is no consensus. Robinson argues that they were an army-led campaign with American, British and allied help, including lists of PKI cadres supplied by US officials; the CIA denied active involvement, and a people's tribunal held in The Hague in 2015 found in 2016 crimes against humanity and Western complicity, and that the killings could be categorised as genocide. Presidents Abdurrahman Wahid (2000) and Joko Widodo (January 2023) have since apologised for or acknowledged the violations.

Suharto's **New Order** (he was president from 1967 to 1998) brought sustained growth (about 5 per cent a year per head) and, by official figures that some studies dispute, cut poverty from about 45 per cent in 1970 to about 11 per cent in 1996, while forcing Chinese Indonesians to assimilate and, Transparency International alleged, embezzling US\$15–35 billion. After Portugal's Carnation Revolution, Fretilin declared **Timor-Leste** independent on 28 November 1975; Indonesia invaded nine days later. The Timorese truth commission (CAVR) estimated that 90,800–202,600 people died from famine and violence during the occupation, out of a 1999 population of about 823,000.

As the chapter on the Vietnam War sets out, the American war spread west. In Laos, where the CIA backed Hmong irregulars under Vang Pao, the United States dropped over 2 million tons of ordnance between 1964 and 1973, making it the most heavily bombed country per capita. In Cambodia the **Khmer Rouge** ruled from 17 April 1975 until 7 January 1979, when the Vietnamese invasion overthrew them. Widely cited estimates of the dead run from about 1.5 to 2 million, a fifth to a quarter of the population; Ben Kiernan calculates between 1.671 and 1.871 million, and the demographer Patrick Heuveline finds that over two million died in the 1970s because of political events, the vast majority under the Khmer Rouge. Victims included 200,000–300,000 Chinese Cambodians, between 90,000 and 500,000 Cham (estimates vary sharply) and about 20,000 Vietnamese. Michael Vickery and Stephen Heder argued that the killings were not a racially motivated genocide, but in 2018 the Khmer Rouge Tribunal convicted Nuon Chea and Khieu Samphan, finding genocide against ethnic Vietnamese and, in Nuon Chea's case, against the Cham.

In the Philippines **Ferdinand Marcos** declared martial law in September 1972; it was formally lifted in 1981 without restoring habeas corpus. Alfred McCoy's widely quoted figures for his rule are 3,257 killed between 1975 and 1985, 35,000 tortured and 70,000 incarcerated; Amnesty International, for 1972–1981, gives some 70,000 imprisoned, 34,000 tortured and over 3,200 killed. The opposition leader Benigno "Ninoy" Aquino Jr. was assassinated at Manila International Airport on returning from exile in 1983, and in February 1986, after a disputed election, the **People Power** revolution forced Marcos into exile and made Corazon Aquino president.

{{image: People Power Revolution | Hundreds of thousands of people fill the EDSA highway during the People Power Revolution of February 1986.}}

In Thailand a popular uprising drove out the dictator Thanom Kittikachorn in 1973, but in October 1976 police and right-wing paramilitaries attacked students at Thammasat University, killing 46 by official count and over 100 by unofficial reports. In Burma, Ne Win's coup of 1962 began military rule that lasted, in various guises, until 2011.

## ASEAN, the Tigers and the Crash of 1997

On 8 August 1967 representatives of Indonesia, Malaysia, Singapore, the Philippines and Thailand signed the Bangkok Declaration founding the **Association of Southeast Asian Nations**, which works by consensus and non-interference. Brunei joined in 1984, Vietnam in 1995, Laos and Myanmar in 1997 and Cambodia in 1999.

The World Bank's *East Asian Miracle* report (1993) credited export-oriented, market-friendly policies for the boom of the "tiger cub" economies. After riots in Kuala Lumpur on 13 May 1969, which killed 196 by official count and from nearly 600 to over 1,000 by other accounts, mostly Chinese, Malaysia's **New Economic Policy** (1971–1990) aimed to raise Bumiputera ownership of corporate equity from 2.4 to 30 per cent.

Lee Kuan Yew and Malaysia's Mahathir Mohamad championed "Asian values", which Lee described as the "primacy of group interests over individual interests", arguing that communitarian traditions suited Asia better than Western liberal democracy. Kim Dae-jung replied in 1994 that democratic values are universal, and Amartya Sen argued in 1997 that Asian traditions, Confucius included, held long strands of tolerance and dissent. Mark R. Thompson has argued that the idea lost its appeal after 1997.

That year the boom broke. On 2 July 1997 Thailand was forced to float the baht after speculative attacks, and the crisis spread. Mahathir blamed speculators such as George Soros and imposed capital controls; Indonesia lost about 13 per cent of its GDP in 1998. Amid protests, the shooting of students at Trisakti and riots that targeted ethnic Chinese communities, Suharto resigned on 21 May 1998, opening the era of *Reformasi*. In 1999 Timor-Leste voted by 78.5 per cent for independence; after militia violence and an Australian-led intervention, independence was recognised in 2002.

```checkpoint
q: What are the most widely published estimates of the number killed in Indonesia in 1965–66?
a: About 50,000, mostly soldiers.
x: The victims were overwhelmingly unarmed civilians, and the lowest common estimates are ten times higher.
a*: 500,000 to 1 million, with some estimates reaching 2 to 3 million.
a: Between 1.671 and 1.871 million.
x: That is Ben Kiernan's estimate for Cambodia under the Khmer Rouge.
a: 3,257.
x: That is Alfred McCoy's count of killings under Marcos in the Philippines, 1975–85.
hint: Geoffrey Robinson calls the lower figure conservative.
why: The killings destroyed the PKI and brought Suharto to power; whether they were genocide or politicide is still debated.
---
q: What did Lee Kuan Yew and Mahathir Mohamad mean by "Asian values"?
a: A demand that Asian states adopt Western liberal democracy at once.
x: They argued the reverse, that communitarian values suited Asia better.
a: A programme of pan-Asian union under Japanese leadership.
x: That recalls wartime Japanese propaganda, not the 1990s debate.
a: The argument that Asian traditions include tolerance and dissent.
x: Amartya Sen made that argument against the "Asian values" thesis.
a*: The claim that communitarian values, putting the group before the individual, suited Asia better than Western liberal democracy.
hint: Kim Dae-jung replied that democratic values are universal.
why: The debate shows Asian voices on both sides of the argument over democracy and human rights.
```

## Democracy and Its Reversals

In Thailand the army ousted Prime Minister Thaksin Shinawatra in 2006, and General Prayut Chan-o-cha's coup of 22 May 2014 was the twelfth since 1932. In Burma, students began the **8888 Uprising** on 8 August 1988; a coup crushed it that September, with 350 deaths officially and 3,000–10,000 by other estimates, and in 1989 the junta renamed the country Myanmar. **Aung San Suu Kyi** led the National League for Democracy (NLD) to a victory in 1990 that the junta nullified; she spent almost 15 of the next 21 years under house arrest and won the Nobel Peace Prize in 1991. After the NLD's landslide of 2015 she governed as State Counsellor, but in 2019 she defended the military at the International Court of Justice.

The case concerned the **Rohingya**, denied citizenship since a nationality law of 1982. After attacks by the Arakan Rohingya Salvation Army on police posts in August 2017, Médecins Sans Frontières estimated that at least 6,700 Rohingya were killed in the first month, and over 700,000 fled to Bangladesh. The UN called it "a textbook example of ethnic cleansing". The Gambia brought a genocide case, and in January 2020 the court ordered Myanmar to prevent genocidal acts.

On 1 February 2021 the military seized power again under Senior General Min Aung Hlaing, and mass protests turned into a multi-sided civil war, still under way in 2026. Junta-run elections between 28 December 2025 and 25 January 2026 gave its party an overwhelming majority and were widely described as a sham; in 2026 Suu Kyi's sentence was commuted to house arrest. Marcos's son Bongbong has been president of the Philippines since 2022, and on 10 November 2025 Indonesia's President Prabowo Subianto, Suharto's former son-in-law, named Suharto a National Hero, reviving debate over his rule. On 26 October 2025 Timor-Leste became ASEAN's eleventh member.

## Nations, Peasants and the Writing of History

**Benedict Anderson**, a specialist on Indonesia expelled from the country after disputing the official account of 1965, defined the nation as "an imagined political community", made possible by print capitalism. Partha Chatterjee objected that Anderson left colonised peoples only forms of nationalism borrowed from Europe, and Thongchai and Ileto show Southeast Asian scholars rewriting national histories in their own idioms.

Scott, for his part, turned to the hills. In *The Art of Not Being Governed* (2009) he argued that the upland peoples of "Zomia", from Vietnam's Central Highlands to northeast India, such as the Akha, Hmong, Karen and Wa, deliberately practised "state avoidance"; he called these "bold claims" himself. With Smail and Reid, these arguments pose one question: whether the region's history is best written from its capitals and colonisers or from its villages, hills and seas.

## Further exploration

- **Thant Myint-U, *The River of Lost Footsteps: Histories of Burma* (2006).** Burma's history woven together with the author's family story; his grandfather was U Thant.
- **Thongchai Winichakul, *Siam Mapped: A History of the Geo-Body of a Nation* (1994).** How mapping created the modern Thai nation-state.
- **Reynaldo C. Ileto, *Pasyon and Revolution: Popular Movements in the Philippines, 1840–1910* (1979).** The revolution of 1896 seen through the religious idioms of ordinary Filipinos.
- **Pasuk Phongpaichit and Chris Baker, *A History of Thailand* (2005).** A standard modern history by a Thai economist and a British historian.
- **Geoffrey B. Robinson, *The Killing Season: A History of the Indonesian Massacres, 1965–66* (2018).** Argues that the army organised the killings with Western help.
- **Sunil S. Amrith, *Crossing the Bay of Bengal: The Furies of Nature and the Fortunes of Migrants* (2013).** The migrations that linked India, Burma and Malaya.
- **Benedict Anderson, *Imagined Communities: Reflections on the Origin and Spread of Nationalism* (1983).** The classic theory of nationalism, written by a Southeast Asianist.$mn_seasia_master$,
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
  select $mn_seasia_quiz$[
    {"type": "mcq", "prompt": "What did the Pangkor Treaty of 20 January 1874 require of the Sultan of Perak?", "options": ["To accept a British Resident whose advice had to be asked and acted upon on all questions except Malay religion and custom", "To cede Perak outright to the Dutch East Indies", "To abolish slavery immediately in all forms", "To join the Indochinese Union under French protection"], "answerIndex": 0, "explanation": "The treaty, signed aboard the steamer Pluto, installed a British Resident 'whose advice must be asked and acted upon on all questions other than those touching Malay religion and custom', the model for indirect British rule through the Malay sultans.", "id": "q1"},
    {"type": "mcq", "prompt": "According to the Timorese truth commission (CAVR), how many people died from famine and violence during Indonesia's occupation of Timor-Leste?", "options": ["About 3,200", "Between 1.5 and 2 million", "Between 90,800 and 202,600", "Over 700,000"], "answerIndex": 2, "explanation": "The CAVR estimated 90,800–202,600 deaths, including 17,600–19,600 violent deaths or disappearances, out of a 1999 population of about 823,000.", "id": "q2"},
    {"type": "mcq", "prompt": "Which event began the Asian financial crisis of 1997?", "options": ["The founding of ASEAN in Bangkok", "Suharto's resignation on 21 May 1998", "Malaysia's capital controls", "Thailand's forced floating of the baht on 2 July 1997 after speculative attacks"], "answerIndex": 3, "explanation": "The crisis, called the 'Tom Yum Kung crisis' in Thai, began when Thailand floated the baht on 2 July 1997; it spread across the region, and Indonesia lost about 13% of GDP in 1998.", "id": "q3"},
    {"type": "mcq", "prompt": "What did James C. Scott argue in The Moral Economy of the Peasant (1976)?", "options": ["That peasants were passive and never rebelled", "That peasants put subsistence security first and rebelled when colonial states and markets broke the moral obligations of elites", "That nations are imagined communities created by print capitalism", "That Southeast Asia's history should be written from European archives"], "answerIndex": 1, "explanation": "Scott used examples including Burma's Saya San rebellion and Vietnam's Nghệ-Tĩnh soviets of the 1930s; the 'imagined communities' idea is Benedict Anderson's.", "id": "q4"},
    {"type": "open", "prompt": "Was the Japanese occupation of Southeast Asia (1941–45) a liberation or an exploitation? Use evidence from at least two countries.", "rubric": "A strong answer weighs both sides. Liberation: Japan ended European rule and trained armies that led independence movements (PETA in Indonesia, the Burma Independence Army), and Burma was declared nominally independent under Ba Maw in 1943. Exploitation: rōmusha forced labour (Ricklefs: 200,000–500,000 Javanese sent off Java, only about 70,000 survived; Satō: about 270,000, about 15% dead or stranded); a UN report's 4 million dead in Indonesia (a high, single-source figure); 170,000–250,000 civilian dead in Burma; the Vietnamese famine of 1944–45 (400,000 to 2 million); about 500,000 Filipino dead and at least 100,000 civilians killed in the battle for Manila. It should note that PETA under Supriyadi (February 1945) and Aung San's army (27 March 1945) turned on Japan.", "id": "q5"},
    {"type": "open", "prompt": "Should the killings in Indonesia in 1965–66 and under the Khmer Rouge in Cambodia (1975–79) be called genocide? Discuss the evidence and the historians' arguments for each case.", "rubric": "For Indonesia: the most widely published estimates are 500,000 to 1 million dead (some 2 to 3 million); victims were targeted mainly for political affiliation (PKI members, Gerwani women, trade unionists) but also included ethnic Chinese; it is usually termed politicide and sometimes genocide, with no consensus; Robinson argues it was an army-led campaign with US, British and allied help; a people's tribunal in The Hague found in 2016 crimes against humanity and that the killings could be categorised as genocide. For Cambodia: estimates of about 1.5 to 2 million (Kiernan 1.671–1.871 million; Heuveline over two million in the 1970s); victims included Chinese, Cham and Vietnamese; Vickery and Heder argued the killings were not racially motivated genocide, but the ECCC in 2018 found genocide against ethnic Vietnamese and, for Nuon Chea, the Cham. Good answers distinguish legal and historical definitions and attribute figures.", "id": "q6"}
  ]$mn_seasia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/modern-southeast-asia', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
