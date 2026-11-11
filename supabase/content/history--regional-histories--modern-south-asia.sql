-- Modern South Asia — canonical master article, co-written and human-reviewed.
-- history/regional-histories/asia/modern-south-asia @ research/advanced/read.
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
    'history/regional-histories/asia/modern-south-asia',
    'research',
    'advanced',
    'read',
    $mn_southasia_master$> **A subcontinent remade, and remaking itself.** In the eighteenth century the Mughal Empire gave way to regional states, and a trading company made itself a ruling power. South Asians then lived through Company conquest, Crown rule and famine, and built the movements that ended empire, from Gandhi's satyagraha and Jinnah's Muslim League to Ambedkar's fight against caste. Independence in 1947 brought Partition and two states; the bloody birth of Bangladesh in 1971 made three. This chapter follows India, Pakistan, Bangladesh, Sri Lanka and Nepal to the present, through civil wars, Kashmir, economic reform and Hindu nationalism, and the arguments historians still have about them.

## From successor states to Company Raj

After Aurangzeb's death in 1707 the Mughal Empire broke into regional successor states, as the chapter on the Mughal Empire describes; the chapter on Trading Companies and Empires explains how the East India Company entered their politics. Robert Clive's victory at Plassey on 23 June 1757 began Company rule in practice, and after Buxar (1764) the Mughal emperor Shah Alam II made the Company *diwan*, collector of the revenue, of Bengal, Bihar and Orissa. The Bengal famine of 1769–70 followed. Company estimates that a third of the population, some 10 million people, died have often been repeated, but the historian Rajat Datta proposes about 1.2 million and Tim Dyson calls 10 million "barely credible"; estimates run from 1 to 10 million.

Conquest went on. Tipu Sultan of Mysore died fighting the Company in 1799; the Maratha wars ended in 1819, and Punjab was annexed in 1849. Rulers who signed "subsidiary alliances", beginning with Hyderabad in 1798, kept their states under Company supremacy; these princely states covered about two-thirds of the subcontinent in the early nineteenth century. In Bengal, Cornwallis's **Permanent Settlement** of 1793 fixed the land revenue forever with the zamindars. Ram Mohan Roy co-founded the reforming Brahmo Sabha in 1828 and campaigned against *sati* (widow-burning), banned in Bengal in 1829.

Even the name of the rising of 1857 is argued over: "Sepoy Mutiny" or "First War of Independence". In Awadh it became a patriotic revolt, led partly by landholders dispossessed by British revenue policy, and its leaders included Begum Hazrat Mahal, Kunwar Singh and Tatya Tope. The chapter on the British Empire tells its story; perhaps 800,000 Indians died. In 1858 the Crown took over India's government, and in 1874 the Company was dissolved.

## The Raj: state, economy and famine

The British Raj covered almost all of today's India, Pakistan and Bangladesh, and Burma until 1937. Within it, beside directly ruled British India, more than 560 princely states, covering some 40 per cent of the land, kept internal autonomy under British "paramountcy". The Minto–Morley reforms of 1909 created separate electorates for Muslims, and provincial elections in 1937 showed overwhelming Hindu support for Congress.

The economic record is fiercely debated. Angus Maddison's estimates have India's share of world output falling from 24.4 per cent in 1700 to 4.2 per cent in 1950, while income per head barely rose; its share of world industrial output fell from about a quarter in 1750 to about 2 per cent in 1900, and handloom yarn output fell from 419 to 240 million pounds between 1850 and 1900. Nationalists from Dadabhai Naoroji onwards argued that Britain "drained" India's wealth; William Digby estimated £900 million transferred between 1870 and 1900, and the chapter on the British Empire sets out the modern estimates. On the other side, Zareer Masani notes that income per head fell most sharply between 1600 and 1750, before British rule, Niall Ferguson stresses British investment, and irrigated land grew roughly eightfold under British rule.

Famine sharpened the argument. The chapter on the British Empire recounts the famine of 1876–78, part of a global El Niño drought that killed 19 to 50 million people worldwide, and the Bengal famine of 1943, for which estimates run from 0.8 million to 3.8 million (the official inquiry said about 1.5 million), with a scholarly consensus of about 2.1 million. Amartya Sen links these famines to unequal access to food and to rule that answered to no electorate; Tirthankar Roy stresses ecology; Cormac Ó Gráda blames "the failure of the authorities of the day to act appropriately" more than empire as such.

## Reformers, caste and women

Some of the sharpest challenges came from below. In 1848 Jyotirao and Savitribai Phule opened a girls' school in Pune; Savitribai, who worked with Fatima Sheikh, is widely regarded as India's first woman teacher, and in 1873 Jyotirao founded the Satyashodhak Samaj for the rights of women, Shudras and Dalits. Pandita Ramabai, a Sanskrit scholar orphaned in the famine of 1876–78, founded the Mukti Mission at Kedgaon. In the Tamil country Periyar (E. V. Ramasamy) led the Self-Respect Movement against caste from 1925.

{{image: B. R. Ambedkar | B. R. Ambedkar (1891–1956), the Dalit leader who chaired the committee that drafted India's constitution.}}

The towering figure was **B. R. Ambedkar**, born a Mahar (Dalit) in 1891, with doctorates from Columbia and London. In 1927 he led the Mahad satyagraha for Dalits' right to draw water from a public tank, and his *Annihilation of Caste* (1936) was a speech its Lahore hosts found too controversial to let him deliver. When Britain's Communal Award of 1932 gave the "Depressed Classes" separate electorates, Gandhi fasted against it. The **Poona Pact** of 24 September 1932 replaced them with 148 seats reserved for Dalits within joint electorates, nearly double the Award's 71. Ambedkar signed reluctantly; historians still debate whether it was a compromise or a defeat. "Educate, agitate, organise!" was his message to his followers.

Women organised too: the All India Women's Conference was founded in 1927, and the poet Sarojini Naidu was Congress president in 1925–26. Rabindranath Tagore, the first non-European Nobel laureate in literature (1913), wrote the national anthems of both India and Bangladesh.

## Nationalism and its historians

Congress first met in 1885, as the chapter on Nationalism and the Making of Nation-States describes. When Lord Curzon partitioned Bengal in 1905, Bengalis answered with the *swadeshi* boycott of British goods, and the partition was reversed in 1911. The All-India Muslim League was founded at Dacca in 1906; Muhammad Ali Jinnah joined it in 1913, was its president from 1916 to 1930 and led it again from 1934. Bal Gangadhar Tilak made famous the slogan "Swaraj is my birthright, and I shall have it."

**Mohandas Gandhi** returned from 21 years in South Africa to lead his first Indian campaign, for indigo cultivators at Champaran in 1917, and led Congress from 1921. The chapter on the Interwar Period follows non-cooperation and the Salt March of 1930. Others chose arms: the revolutionary socialist Bhagat Singh was hanged at Lahore in 1931. On 8 August 1942 Gandhi launched Quit India: "We shall either free India or die in the attempt." British figures recorded 1,028 killed and more than 100,000 arrested; Congress put the dead at 4,000 to 10,000.

How should the movement be explained? From the late 1960s the "**Cambridge School**" (Anil Seal, Gordon Johnson, David Washbrook) treated nationalism as competition among local elites for patronage and office. Critics such as Howard Spodek faulted its reliance on British documents and its heavy emphasis on Indian self-interest; Tapan Raychaudhuri's 1979 review "Indian Nationalism as Animal Politics" named the critique. The **nationalist and Marxist** historians led by Bipan Chandra described a mass, multi-class anti-colonial movement. From 1982 **Subaltern Studies**, led by Ranajit Guha, attacked both colonial and nationalist history as "elitist" and set out to recover the politics of peasants. Sumit Sarkar later complained that it had drifted into the study of discourse, and Vivek Chibber that it neglected class.

Gandhi is argued over too. Ashwin Desai and Goolam Vahed argue that in South Africa he was "on occasion, a willing part of their subjugation and racist stereotyping", speaking of Black South Africans, and that his saintly image was constructed later; Ambedkar charged that Gandhi wrote against caste in English but defended it in Gujarati.

```checkpoint
q: What did the Poona Pact of 1932 do?
a*: It replaced separate electorates for the "Depressed Classes" with seats reserved for them in joint electorates.
a: It created separate electorates for Muslims.
x: Separate Muslim electorates came with the Minto–Morley reforms of 1909.
a: It ended the non-cooperation movement after Chauri Chaura.
x: Non-cooperation was called off in 1922, ten years earlier.
a: It gave the princely states a place in an Indian federation.
x: That was the federal scheme of the 1935 Act, which never took effect.
hint: Gandhi fasted in Yerwada jail against the Communal Award.
why: Gandhi's fast forced Ambedkar to trade separate electorates for 148 reserved seats, nearly double the Award's 71.
---
q: What did the Subaltern Studies historians argue?
a: That nationalism was mainly a contest among Indian elites for office and patronage.
x: That was the Cambridge School's view.
a: That British rule left India economically better off.
x: That is a position in the colonial economy debate, not Subaltern Studies' argument.
a*: That both colonial and nationalist histories were elitist, and that the politics of peasants and the poor had to be recovered.
a: That Congress led a united mass movement of all classes.
x: That was the nationalist-Marxist reading associated with Bipan Chandra.
hint: Ranajit Guha wanted history written from below.
why: Subaltern Studies rejected both the Cambridge School's elites and the nationalists' Congress-centred story.
```

## Partition and two new states

The chapter on Partition and its Consequences tells the story of 1940–47: Mountbatten's timetable, the Radcliffe line, the killing and flight in Punjab and Bengal. Between 12 and 20 million people were displaced, and estimates of the dead run from 200,000 to 2 million. What was Pakistan meant to be? Ayesha Jalal's *The Sole Spokesman* argues that Jinnah used the demand as a bargaining counter for Muslim parity within a united India; Dhulipala stresses a popular vision of Pakistan as a "New Medina". Those who think Jinnah wanted a non-theocratic state cite his speech to Pakistan's Constituent Assembly:

```quote
You are free; you are free to go to your temples, you are free to go to your mosques or to any other place of worship in this State of Pakistan … You may belong to any religion or caste or creed—that has nothing to do with the business of the State.
Muhammad Ali Jinnah · Speech to the Constituent Assembly of Pakistan · 11 August 1947
```

On 30 January 1948 Gandhi was shot by Nathuram Godse, a Hindu nationalist, and the Hindu nationalist Rashtriya Swayamsevak Sangh (RSS) was banned days later.

## Nehru's India

Jawaharlal Nehru was prime minister from 1947 until his death in 1964. Under Vallabhbhai Patel the princely states were brought into India, mostly by agreement; Hyderabad was taken by force in September 1948, and the communal violence that followed killed 27,000 to 40,000 people by official estimates and 200,000 or more by some scholars'.

The constitution, adopted on 26 November 1949 and in force from 26 January 1950, is the longest written national constitution. Its drafting committee was chaired by Ambedkar, who warned:

```quote
On the 26th of January 1950, we are going to enter into a life of contradictions. In politics we will have equality and in social and economic life we will have inequality.
B. R. Ambedkar · Speech to the Constituent Assembly · 25 November 1949
```

Ambedkar left Nehru's cabinet in 1951 after his Hindu Code Bill was blocked, and in 1956 he converted to Buddhism at Nagpur with about half a million followers, weeks before his death. Nehru's five-year plans built public-sector steel plants and institutes of technology; abroad he championed non-alignment, as the chapter on Global Cold War and the Arms Race explains. The war with China in 1962 went badly: India lost 1,383 killed by its own figures, and Nehru sought American aid.

## Pakistan's turbulent path

Pakistan's first crisis was over language. In 1948 Jinnah declared Urdu, the mother tongue of only about 3 per cent of Pakistanis, the national language; in the Bengali-speaking east, police fired on protesting students on 21 February 1952, now International Mother Language Day. General Ayub Khan seized power in 1958, signed the World Bank-brokered Indus Waters Treaty with India in 1960, and fought an inconclusive war with India over Kashmir in 1965.

After 1971 Zulfikar Ali Bhutto, founder of the Pakistan Peoples Party, led the country and launched its nuclear programme. General Zia-ul-Haq overthrew him in 1977 and had him hanged in 1979. Zia pursued Islamisation and, with American and Saudi backing, coordinated the Afghan mujahideen until his death in an air crash in 1988. Benazir Bhutto became the first woman elected to lead a democratic government in a Muslim-majority country (1988–90 and 1993–96); she was assassinated in 2007. General Pervez Musharraf seized power in 1999; Imran Khan, removed by a no-confidence vote in 2022, has been imprisoned since 2023 on charges he calls politically motivated.

## 1971: the birth of Bangladesh

East Pakistan held more people than the West. In December 1970, after a slow official response to the Bhola cyclone, Sheikh Mujibur Rahman's Awami League won 167 of East Pakistan's 169 seats, a majority of the whole National Assembly. On 25 March 1971 the Pakistani army launched Operation Searchlight in the east, and independence was proclaimed the next day.

The death toll is fiercely contested. Bangladesh's official figure of up to 3 million is part of national memory; Pakistan's Hamoodur Rahman Commission gave 26,000. Sarmila Bose's much-criticised *Dead Reckoning* suggested 50,000–100,000. Demographic studies sit between: a 2008 *BMJ* study estimated about 269,000 violent war deaths (range 125,000 to 505,000), and Christian Gerlach (2018) just over half a million, mostly rural people dying of hunger and exhaustion. Between 200,000 and 400,000 women were raped; Hindus were particularly targeted; in the last days the army and collaborators killed Bengali intellectuals. Eight to ten million refugees fled to India.

Anthony Mascarenhas reported in the *Sunday Times* on 13 June 1971 that he had seen Hindus "hunted from village to village and door to door". The American consul general in Dhaka, Archer Blood, reported "selective genocide" in late March and sent a dissent telegram on 6 April, but Nixon and Kissinger backed Pakistan's ruler, Yahya Khan, partly because of their opening to China. India entered the war after Pakistani air strikes on 3 December, and Pakistani forces surrendered at Dhaka on 16 December; about 93,000 became prisoners. Srinath Raghavan argues that the breakup was not inevitable but was shaped by great-power calculation.

In the famine of 1974 the government counted 27,000 dead; one scholar estimates 1.5 million including later deaths. On 15 August 1975 Mujib was killed with most of his family in a coup. In 2024 student protests against job quotas became an uprising in which as many as 1,400 people died, by the UN's estimate; Sheikh Hasina fled to India on 5 August after fifteen years in power, and the BNP won the election of 2026.

## Indira Gandhi and the Emergency

Indira Gandhi governed India from 1966 to 1977 and from 1980 to 1984. She nationalised the largest banks in 1969, campaigned on *Garibi Hatao* ("remove poverty"), and presided over the Green Revolution in wheat, led by M. S. Swaminathan; in 1974 India tested a "peaceful nuclear explosion".

In 1974 Jayaprakash Narayan called for "total revolution", and in June 1975 the Allahabad High Court voided Indira Gandhi's 1971 election. On the night of 25 June the president proclaimed an **Emergency**. Until March 1977 the press was censored and over 110,000 people arrested. Sanjay Gandhi's sterilisation drive carried out 8.3 million sterilisations in 1976–77, most of them forced. In the 1977 elections Congress lost to the Janata Party.

In June 1984 Operation Blue Star sent the army into the Golden Temple at Amritsar to remove Jarnail Singh Bhindranwale and armed militants; the official toll of 493 militants and civilians is far below independent estimates. On 31 October Indira Gandhi was shot by her Sikh bodyguards. In the anti-Sikh pogroms that followed, the government counted 3,350 dead and other estimates run from 8,000 to 17,000.

## Sri Lanka and Nepal

Ceylon, independent in 1948 and renamed Sri Lanka in 1972, is about three-quarters Sinhalese. Its Citizenship Act of 1948 made citizenship virtually impossible for about 700,000 Tamil plantation workers of Indian origin. The **Sinhala Only Act** of 1956 made Sinhala the sole official language. In 1960 Sirimavo Bandaranaike became the world's first woman democratically elected prime minister. The Liberation Tigers of Tamil Eelam (LTTE) were founded in 1976. After an LTTE ambush on 23 July 1983, anti-Tamil pogroms in Colombo, "Black July", killed somewhere between 400 and 3,000 people.

The civil war lasted from 1983 to May 2009. An Indian peacekeeping force (1987–90) lost 1,165 soldiers, and the Tigers later assassinated Rajiv Gandhi. The United Nations estimated 80,000 to 100,000 deaths over the war. A UN panel reported in 2011 that "there could have been as many as 40,000 civilian deaths" in its final phase alone, and the government has refused an independent international investigation. In 2022 economic collapse brought mass protests, the *Aragalaya*, that drove President Gotabaya Rajapaksa from office.

Nepal was ruled from 1846 to 1951 by the pro-British Rana family. A Maoist insurgency from 1996 to 2006 killed more than 17,000 people. After Crown Prince Dipendra killed King Birendra in 2001, in 2008 Nepal abolished the monarchy and ended the world's last Hindu kingdom. In September 2025 "Gen Z" protests forced Prime Minister K. P. Sharma Oli to resign.

```checkpoint
q: Which estimate of deaths in Bangladesh's 1971 war is Bangladesh's official figure?
a: 26,000.
x: That was the figure of Pakistan's Hamoodur Rahman Commission, the lowest estimate.
a*: Up to 3 million.
a: 50,000 to 100,000.
x: That was Sarmila Bose's much-criticised estimate.
a: 125,000 to 505,000.
x: That was the range of violent war deaths in a 2008 BMJ study.
hint: It is the highest of the figures and part of national memory.
why: Estimates range from Pakistan's 26,000 to Bangladesh's 3 million, with demographic studies in between.
---
q: What did Sri Lanka's Sinhala Only Act of 1956 do?
a: It denied citizenship to Tamil plantation workers of Indian origin.
x: That was done by the Ceylon Citizenship Act of 1948.
a: It made Sri Lanka a republic.
x: Ceylon became the Republic of Sri Lanka in 1972.
a: It ended the civil war.
x: The war ended in May 2009.
a*: It made Sinhala the sole official language.
hint: The name tells you.
why: Making Sinhala the only official language was one of the grievances behind Tamil militancy.
```

## Reform, caste and Hindu nationalism

Indian politics after 1980 turned increasingly on caste and religion. In 1990 V. P. Singh's government decided to implement the Mandal Commission's proposal to reserve 27 per cent of central government jobs for "Other Backward Classes"; students protested, and the Supreme Court upheld the policy in 1992. The economy changed course too, as the chapters on the Neoliberal Age and the Post-Cold War Era describe. How new were the reforms of 1991? The economists Rodrik and Subramanian attribute faster growth in the 1980s to a "pro-business" shift in government attitudes rather than to liberalisation.

Hindu nationalism, or **Hindutva**, was formulated by V. D. Savarkar in *Essentials of Hindutva* (1923); the RSS was founded in 1925 and the Bharatiya Janata Party (BJP) in 1980. The BJP held 2 seats in parliament in 1984 and 120 in 1991, rising with the campaign over Ayodhya. On 6 December 1992 activists demolished the Babri Masjid there, and about 2,000 people died in the riots that followed. In 2019 the Supreme Court gave the site to a trust for a Hindu temple, which Narendra Modi consecrated in 2024. In Gujarat in 2002, after a train fire at Godhra killed 58 Hindu pilgrims, the official toll was 1,044 dead, most of them Muslims; other estimates exceed 2,000, and many scholars call it a pogrom. A court-appointed investigation cleared Modi, then chief minister, in 2012. He led the BJP to a single-party majority in 2014; the Citizenship (Amendment) Act of 2019, which offered fast-track citizenship to migrants of six non-Muslim faiths from Afghanistan, Bangladesh and Pakistan, drew large protests; in 2024 the BJP lost its majority but kept power in coalition. Christophe Jaffrelot calls the result an "ethnic democracy", a thesis praised for its documentation and criticised for its method.

Women pressed their own causes, from the Chipko forest protests, with an all-woman action at Reni in 1974, to the reservation of half of village-council seats for women in many states.

## Kashmir and the bomb

Kashmir has been divided since its contested accession in 1947, as the chapter on Partition and its Consequences explains. After a disputed state election in 1987, an armed insurgency began in the Kashmir Valley in 1989, with Pakistani support. The Valley's Hindus, the Kashmiri Pandits, fled from 1990: of a community scholars put at 120,000–140,000 (some Pandit groups say far more), only about 3,000 remained by 2016. Authorities counted about 43,000 killed by 2008, while a separatist group claims 80,000. India tested nuclear weapons on 11 and 13 May 1998 and Pakistan on 28 May, and both faced sanctions. A year later Pakistani troops disguised as militants crossed the Line of Control at Kargil, and India lost 527 men driving them back. In 2019 India revoked Kashmir's autonomy under a communications blackout, a move the Supreme Court upheld in 2023. After militants killed 26 civilians at Pahalgam on 22 April 2025, India suspended the Indus Waters Treaty and launched strikes from 7 May; a ceasefire followed on 10 May.

## South Asia in the world

The chapter on the British Empire describes the more than 1.6 million Indians sent abroad under indenture, whose descendants live from Mauritius and Fiji to Trinidad and South Africa. In 1972 Idi Amin expelled most of Uganda's South Asians. India's Ministry of External Affairs counted 35.4 million Indian citizens and people of Indian origin abroad in 2024, the world's largest diaspora, about 9 million of them in the Gulf states. Bangladesh's garment industry, discussed in the chapter on Globalization, ties the region's workers to shoppers everywhere.

## Further exploration

- **Sugata Bose and Ayesha Jalal, *Modern South Asia: History, Culture, Political Economy* (1998).** The standard textbook on the whole region, by two leading historians of South Asia.
- **Ramachandra Guha, *India After Gandhi: The History of the World's Largest Democracy* (2007).** A wide-ranging narrative history of independent India.
- **Ayesha Jalal, *The Sole Spokesman: Jinnah, the Muslim League and the Demand for Pakistan* (1985).** The influential revisionist account of Jinnah's strategy from 1937 to 1947.
- **Srinath Raghavan, *1971: A Global History of the Creation of Bangladesh* (2013).** Places Bangladesh's birth in the context of the global Cold War.
- **Gary J. Bass, *The Blood Telegram: Nixon, Kissinger, and a Forgotten Genocide* (2013).** American policy in 1971 and the diplomats who dissented.
- **Nira Wickramasinghe, *Sri Lanka in the Modern Age: A History of Contested Identities* (2006).** A Sri Lankan historian's account of the island's modern history.
- **B. R. Ambedkar, *Annihilation of Caste* (1936).** The classic Dalit critique of caste, and a primary source.$mn_southasia_master$,
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
  select $mn_southasia_quiz$[
    {"type": "mcq", "prompt": "Which school of historians treated Indian nationalism mainly as competition among local elites for patronage and office?", "options": ["The Cambridge School", "Subaltern Studies", "The nationalist-Marxist historians around Bipan Chandra", "The drain theorists around Dadabhai Naoroji"], "answerIndex": 0, "explanation": "The Cambridge School (Anil Seal, Gordon Johnson, David Washbrook) stressed elite competition; Tapan Raychaudhuri's review 'Indian Nationalism as Animal Politics' named the critique of it.", "id": "q1"},
    {"type": "mcq", "prompt": "What does Ayesha Jalal argue in The Sole Spokesman (1985)?", "options": ["That Pakistan was a popular vision of a 'New Medina'", "That Partition was planned by the British from 1909", "That Jinnah used the Pakistan demand as a bargaining counter to win Muslim parity within a united India", "That Jinnah wanted an Islamic theocracy from the start"], "answerIndex": 2, "explanation": "Jalal's revisionist account reads the Pakistan demand as a bargaining position; Dhulipala, by contrast, stresses a popular 'New Medina' vision.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened during India's Emergency (1975–77)?", "options": ["India tested its first nuclear device", "The press was censored, over 110,000 people were arrested and millions were sterilised, most of them by force", "The Babri Masjid was demolished", "The Mandal Commission's job reservations were implemented"], "answerIndex": 1, "explanation": "After the Allahabad High Court voided Indira Gandhi's 1971 election, the Emergency suspended normal politics; Sanjay Gandhi's drive carried out 8.3 million sterilisations in 1976–77. Congress lost the 1977 election.", "id": "q3"},
    {"type": "mcq", "prompt": "What did a UN panel report in 2011 about the final phase of Sri Lanka's civil war?", "options": ["That the LTTE had been defeated in 1987 by Indian peacekeepers", "That fewer than 1,000 civilians had died", "That the war had ended through a negotiated peace accord", "That there could have been as many as 40,000 civilian deaths"], "answerIndex": 3, "explanation": "The UN Secretary-General's Panel of Experts cited credible sources for as many as 40,000 civilian deaths in the final phase; the UN estimated 80,000–100,000 deaths over the whole war, and the government has refused an independent international investigation.", "id": "q4"},
    {"type": "open", "prompt": "Why do estimates of the death toll in Bangladesh's 1971 war differ so widely? Refer to at least three estimates and who made them.", "rubric": "Strong answers cite several attributed figures: Bangladesh's official figure of up to 3 million; Pakistan's Hamoodur Rahman Commission, 26,000; Sarmila Bose's much-criticised 50,000–100,000; the 2008 BMJ study's 125,000–505,000 violent war deaths (central estimate about 269,000); Christian Gerlach's just over half a million, mostly rural deaths from hunger and exhaustion. They explain that national memory and politics shape the highest and lowest figures, that demographic studies fall between them, and that definitions (violent deaths versus deaths from hunger and flight) matter. Credit mention of 200,000–400,000 women raped, the targeting of Hindus, or 8–10 million refugees.", "id": "q5"},
    {"type": "open", "prompt": "How have historians and economists disagreed about the economic impact of British rule in India?", "rubric": "Strong answers set out both sides with names. Critics: Naoroji's drain theory and Digby's estimate of £900 million transferred 1870–1900; Maddison's estimate of India's share of world output falling from 24.4% (1700) to 4.2% (1950); the fall in industrial output share and handloom yarn production; famine explanations by Sen (unequal access to food, undemocratic rule). Counter-arguments: Masani's point that income per head fell most between 1600 and 1750; Ferguson on British investment, and the eightfold growth of irrigated land; Tirthankar Roy's ecological reading of famine; Ó Gráda's emphasis on the authorities' failure to act. Credit answers that weigh the evidence rather than simply listing views.", "id": "q6"}
  ]$mn_southasia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/asia/modern-south-asia', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
