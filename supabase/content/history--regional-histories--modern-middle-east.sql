-- The Making of the Modern Middle East — canonical master article, co-written and human-reviewed.
-- history/regional-histories/middle-east/the-making-of-the-modern-middle-east @ research/advanced/read.
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
    'history/regional-histories/middle-east/the-making-of-the-modern-middle-east',
    'research',
    'advanced',
    'read',
    $mn_mideast_master$> **A region remade from within and without.** The modern Middle East was made over about a century by Ottoman reformers and Egyptian pashas, Iranian constitutionalists and Arab writers, European diplomats and oil companies, kings, colonels and clerics, and the ordinary men and women who protested, voted, fled or fought. This chapter follows late Ottoman reform; Egypt and Iran in the nineteenth century; the Arab "awakening"; the First World War's conflicting promises and the mandates; Atatürk and Reza Shah; Saudi Arabia, oil and the Gulf; Nasser and the Ba'th; the wars of 1967 and 1973; Iran's revolution and political Islam; Lebanon, the Palestinians and Oslo; the Kurds; and women's changing place. It ends with the debates historians still have about who made the region.

## Reform from Within: The Late Ottoman Empire

For most of the region, modernity began as an Ottoman project. In 1839 Sultan Abdülmecid I, at the urging of the reformer Mustafa Reşid Pasha, proclaimed the **Edict of Gülhane**, launching the *Tanzimat* ("reorganisation"). It promised security of life, property and honour, fair taxation and conscription, public trials, and rights for all subjects whatever their religion. These were promises rather than laws, never fully implemented, but reforms followed, among them mixed commercial courts, the empire's first secular legal system. Historians disagree about the edict's roots: Butrus Abu-Manneh found them in Islamic tradition, Stanford Shaw in the French Declaration of the Rights of Man. The chapter on Nationalism and the Making of Nation-States describes the Young Ottomans and the constitution of 1876.

**Abdülhamid II** set that constitution aside, proroguing parliament in February 1878 after defeat by Russia. For three decades he ruled as an autocrat, stressing his title of caliph and building a secret police, while also expanding schools and railways. Massacres of Armenians in 1894–96 earned him the name "Red Sultan"; recent assessments also see him as the culminator of the Tanzimat. In 1908 officers of the **Committee of Union and Progress**, the "Young Turks", forced him to restore the constitution, and in 1909 they deposed him. From 1913 the triumvirate of Talât, Enver and Cemal ruled as a dictatorship and, during the First World War, carried out the genocide of the Armenians, and of Pontic Greeks and Assyrians, as the chapters on the Ottomans and on the First World War describe.

Reform also reshaped relations between communities. Ussama Makdisi's *The Culture of Sectarianism* (2000) argues that the sectarian violence of nineteenth-century Mount Lebanon was not ancient hatred resurfacing but a modern product of contested Ottoman reform and European intervention.

## Egypt and Iran: Pashas, Shahs and Concessions

**Muhammad Ali**, an Ottoman commander of Albanian origin who became governor of Egypt in 1805, is widely considered the founder of modern Egypt. He made long-staple cotton a cash crop and conscripted peasants, many of whom fled their villages. He conquered Sudan and twice invaded Syria, threatening Istanbul, until European intervention forced him back; in return his family won hereditary rule, which lasted until 1952. **Khedive Isma'il** (r. 1863–79) spent heavily on irrigation, lost wars against Ethiopia, and in 1875 sold Egypt's Suez Canal shares to Britain. Britain and France forced his removal in 1879. Colonel **Ahmed 'Urabi**'s revolt sought to end Anglo-French control; in 1882 Britain bombarded Alexandria, defeated him at Tell el-Kebir and occupied Egypt, as the chapter on the British Empire describes.

Qajar Iran (1789–1925) lost its Caucasian territories to Russia, and Britain and Russia competed for influence. When Naser al-Din Shah granted a British subject control of the country's tobacco in 1890, merchants and clergy joined in the **Tobacco Protest**, which climaxed in a widely obeyed clerical fatwa against tobacco in 1891. The **Constitutional Revolution** of 1905–11 went further: a constitution signed in 1906 created an elected parliament, the Majles, the first such revolution in the Islamic world. Mohammad Ali Shah bombarded the Majles in 1908 and was deposed in 1909, but the revolution ended in 1911 when deputies were expelled with the support of 12,000 Russian troops. Meanwhile the Anglo-Russian Convention of 1907 divided Iran into zones of influence, and in 1908 oil was struck; in 1914 the British government bought 51 per cent of the Anglo-Persian Oil Company.

## The Nahda: An Arab Awakening

In the later nineteenth century a cultural movement, the **Nahda** ("awakening"), flourished in the Arab lands of the empire, especially Syria, Lebanon, Egypt and Tunisia. Older scholarship traced it to the shock of Napoleon's invasion of Egypt in 1798; more recent work sees it as much homegrown as Western-inspired, tied to the Tanzimat and the press boom after 1908. Its religious wing was **Islamic modernism**, whose founders included the pan-Islamic activist Jamal al-Din al-Afghani and whose central figure in Egypt was the scholar **Muhammad Abduh**, who became Grand Mufti of Egypt in 1899. Albert Hourani's *Arabic Thought in the Liberal Age, 1798–1939* remains the classic study. Political Arabism grew from the same soil: the Arab Congress that met in Paris in 1913 sought autonomy within the empire, not independence, and Sati' al-Husri later defined the Arab nation by shared language and history.

## Three Promises and a Partition

During the First World War, told in its own chapter, Britain made three commitments that could not all be kept. In letters of 1915–16, Sir Henry McMahon, High Commissioner in Egypt, promised Sharif **Hussein** of Mecca to recognise Arab independence in return for a revolt against the Ottomans. His letter of 24 October 1915 excluded "portions of Syria" lying west of "the districts of Damascus, Homs, Hama and Aleppo". Whether that excluded Palestine has been argued ever since: Britain later said it did; Arabs read it as excluding only the Lebanese coast. In the secret **Sykes–Picot Agreement** of 1916, Britain and France divided the same lands into zones, with Palestine under international administration; the Bolsheviks published it in 1917. And in the **Balfour Declaration** of 2 November 1917 Britain viewed "with favour the establishment in Palestine of a national home for the Jewish people", provided nothing prejudiced the civil and religious rights of "existing non-Jewish communities". Palestine's Arab majority had no say in its drafting, and the deliberately vague "national home" had no precedent in international law.

{{image: Sykes–Picot Agreement | The map of the secret Anglo-French agreement of 1916, dividing the Ottoman Arab lands into zones of control and influence. Later agreements set the actual borders.}}

"Sykes–Picot" has become shorthand for borders imposed from outside; in 2014 the Islamic State's Abu Bakr al-Baghdadi promised at Mosul to hit "the last nail in the coffin of the Sykes–Picot conspiracy". Many historians call this a myth. The agreement was never implemented as drawn: France ceded Mosul and Palestine to Britain, and San Remo (1920), Lausanne (1923) and later agreements set the frontiers. Henry Laurens notes that the borders were largely renegotiated between 1916 and 1922; Aslı Bâli that some followed Ottoman administrative lines or local demands; and Sara Pursley calls the "artificial" Iraq a legend, since Iraq had long existed as a distinct Ottoman region of Mosul, Baghdad and Basra. The counterpoint is that the wartime logic of partition, and Sykes–Picot as a symbol of betrayal, were real.

## Mandates and New States

At **San Remo** in April 1920 the victors allotted mandates for Syria, Mesopotamia and Palestine. Hussein's son **Faisal**, proclaimed king by a Syrian congress, was expelled by France after the Battle of **Maysalun** in July 1920, where his war minister Yusuf al-Azma died; Maysalun is remembered across the Arab world as a symbol of resistance. At the Cairo Conference of 1921 Britain made Faisal king of a new Iraq and his brother **Abdullah** ruler of Transjordan. Iraqis had risen against the proposed mandate in 1920; Iraq became the only mandate independent before the Second World War, in 1932. France split its mandate into Syria, Greater Lebanon, an Alawite State and a Jabal Druze State; Lebanon became independent in 1943 under a National Pact sharing power among religious communities, and French troops left in 1946. Transjordan became an independent kingdom in 1946, was renamed Jordan in 1949 and annexed the West Bank in 1950. In Palestine the Balfour Declaration was written into the mandate itself. The chapters on the Interwar Period and on Partition follow the revolts against the mandates and Palestine's road to 1948. Hussein refused to ratify the Versailles treaty or to sign a British treaty accepting the mandates, saying he could not "affix his name to a document assigning Palestine to the Zionists and Syria to foreigners"; Britain turned instead to his rival, Ibn Saud.

## Atatürk and Reza Shah

In Anatolia, Mustafa Kemal's nationalists defeated Armenia, France and Greece in a war of independence (1919–23), and the Treaty of Lausanne replaced the never-ratified Treaty of Sèvres. The nationalist movement also carried out massacres and deportations of Christians. A Greek–Turkish exchange agreed at Lausanne formalised the displacement of some 1.2 million Greek Orthodox Christians, most of whom had already fled or been expelled, and moved 355,000–400,000 Muslims, by religion rather than language; some scholars call it legalised mutual ethnic cleansing, and Norman Naimark sees it as completing a campaign of ethnic cleansing, while others defend it as preventing further killing.

As **Atatürk**, Kemal remade the state from above: the sultanate abolished in 1922, the republic proclaimed in 1923, the caliphate abolished in 1924, a civil code based on the Swiss one in 1926, the Latin alphabet in 1928, and votes for women, locally in 1930 and nationally in 1934. His motto was "Peace at home, peace in the world". Was this liberation or imposition? About 50 people were sentenced to death after protests against the Hat Law of 1925, and a single party ruled until 1946.

In Iran a Cossack officer, **Reza Khan**, seized Tehran in 1921 and became shah in 1925, founding the Pahlavi dynasty. He centralised the state, forcibly settled nomadic tribes and clashed with the clergy, until the Anglo-Soviet invasion of 1941 forced him to abdicate. Mosaddegh's oil nationalisation and the 1953 coup are told in the chapter on the Global Cold War and the Arms Race.

```checkpoint
q: Why do many historians call the popular "Sykes–Picot" explanation of the region's borders a myth?
a*: Because the 1916 plan was never implemented as drawn, and later agreements such as San Remo and Lausanne set the borders.
a: Because Britain and France never agreed to it.
x: It was negotiated and ratified in 1916; the issue is that it was not implemented as drawn.
a: Because the Ottoman Empire kept its Arab provinces after 1918.
x: Ottoman rule over the Arab lands ended with the war.
a: Because the Arab Congress of 1913 had already drawn the borders.
x: The 1913 Congress asked for autonomy within the empire, not new borders.
hint: Think of what happened to Mosul and Palestine after the war.
why: Laurens, Bâli and Pursley show the borders were renegotiated after 1916, though Sykes–Picot remains a real symbol of betrayal.
---
q: What did Iran's Constitutional Revolution of 1905–11 achieve?
a: It abolished the Qajar monarchy.
x: The Qajars lasted until 1925; the revolution deposed one shah, not the dynasty.
a: It nationalised the oil industry.
x: Oil nationalisation came under Mosaddegh in 1951.
a*: A constitution signed in 1906 created an elected parliament, the Majles, before Russian troops helped end the revolution in 1911.
a: It made Iran a British protectorate.
x: Britain and Russia divided Iran into zones of influence in 1907, but it was not made a protectorate.
hint: Think of the Majles.
why: It was the first constitutional revolution in the Islamic world, earlier than the Young Turk revolution of 1908.
```

## Oil and the Making of the Gulf

**Abdulaziz ibn Saud** retook Riyadh in 1902, conquered the Hejaz in 1925 and proclaimed the **Kingdom of Saudi Arabia** in 1932, crushing a revolt by his own Wahhabi militia, the Ikhwan, along the way. His dynasty's alliance with the reformer Muhammad ibn Abd al-Wahhab dated from 1744. Claims that unification cost 400,000–800,000 casualties are often repeated, but recent research suggests far fewer.

An American company struck commercial oil at Dammam No. 7 in 1938, the year oil was also found in Kuwait. The king's threat of nationalisation forced the company, renamed Aramco, to a 50/50 profit split in 1950; the state took 25 per cent in 1973 and 60 per cent in 1974, and created Saudi Aramco in 1988. In 1960 Iran, Iraq, Kuwait, Saudi Arabia and Venezuela founded **OPEC** at Baghdad, shifting power from the Western "Seven Sisters" oil companies to producing states; the chapter on the Neoliberal Age describes the oil shocks of the 1970s. When Britain's treaties with the Trucial States ended in 1971, six emirates formed the United Arab Emirates. In Kuwait and the UAE, citizens are today a minority of residents.

Why have oil monarchies proved so durable? The Iranian economist Hossein Mahdavy (1970), and Hazem Beblawi and Giacomo Luciani in *The Rentier State* (1987), argued that states living on oil rents need not tax their citizens, who in turn demand less representation. Critics such as Michael Herb reply that once oil's effects are accounted for, oil states follow the same patterns as others; Luciani himself later criticised the theory's dominance.

## 1948, Nasser and the Ba'th

The chapter on Partition tells the story of 1948: Israel's founding, the war with its Arab neighbours, and the flight or expulsion of 700,000–750,000 Palestinians, the *Nakba* ("catastrophe"); in the following years about 900,000 Jews left Muslim-majority countries.

On 23 July 1952 Egypt's **Free Officers**, led by Mohamed Naguib and **Gamal Abdel Nasser**, overthrew King Farouk, abolished the monarchy, redistributed land and built a one-party "Arab socialist" state. When the United States and Britain withdrew funding for the Aswan Dam, Nasser nationalised the Suez Canal Company in July 1956; the chapter on Decolonization describes the war that followed. "Nasser conquered the Arab world by radio," writes Eugene Rogan of the *Voice of the Arabs*. Egypt and Syria merged as the United Arab Republic from 1958 until Syria seceded in 1961.

A rival creed was the **Ba'th** Party, founded in Damascus in 1947 by Michel Aflaq, a Christian, and Salah al-Din al-Bitar under the motto "Unity, Freedom, Socialism". In Iraq, officers under Abd al-Karim Qasim overthrew the Hashemite monarchy in 1958. Ba'thists took power in Syria and, briefly, Iraq in 1963, and the party split into Syrian and Iraqi wings in 1966. In Iraq it returned in 1968; the Ba'thist government, with Saddam Hussein as vice-president, nationalised the Iraq Petroleum Company in 1972, and Saddam became president in 1979, while Hafez al-Assad ruled Syria.

## The Wars of 1967 and 1973

In May 1967, after false Soviet reports of an Israeli plan to attack Syria, Nasser moved 100,000 troops into Sinai, had UN peacekeepers withdrawn and closed the Straits of Tiran to Israeli shipping, which Israel had said would be an act of war. On 5 June Israel struck first, destroying nearly all Egypt's air force, and in six days took Sinai and Gaza, the West Bank and East Jerusalem, and the Golan Heights. More than 15,000 Arabs and fewer than 1,000 Israelis died; 280,000–325,000 Palestinians and about 100,000 Syrians fled or were expelled. Arabs call it *al-Naksa*, "the Setback". Historians still debate whether Nasser intended war or whether brinkmanship escaped his control. The Khartoum summit answered with "no peace with Israel, no recognition of Israel, no negotiations with it", though Avraham Sela argues it marked a shift from contesting Israel's legitimacy to contesting territory. UN Resolution 242 called for every state in the area to live in peace within secure and recognised boundaries.

On 6 October 1973 Egypt and Syria attacked, and Egyptian forces crossed the Suez Canal before Israel counter-attacked. Estimates of the dead run from 2,521 to 2,800 for Israel and from 5,000 to 15,000 for Egypt. The Arab world felt psychologically vindicated. Nasser's successor, **Anwar Sadat**, visited Jerusalem in 1977 and signed the Camp David Accords with Menachem Begin in 1978; the 1979 peace treaty returned Sinai. But the Accords' Palestinian framework was drafted without Palestinians, Egypt was suspended from the Arab League, and Sadat was assassinated by militants in 1981.

## 1979 and Political Islam

Mohammad Reza Shah's **White Revolution** of 1963 brought land reform and votes for women, and clerical opposition led by **Ruhollah Khomeini**, who was exiled in 1964 and in Iraq lectured on the Guardianship of the Jurist. Protests began in October 1977; the shah left on 16 January 1979, Khomeini returned on 1 February, and a referendum approved an Islamic republic. Deaths in the revolution were between 532 and 2,781 by consensus estimates, far below Khomeini's claim of 60,000; repression followed, with 8,000–9,500 executions in 1980–85 by Tucker's estimate and far higher figures noted by UN sources. The revolution was unusual, coming without defeat in war, financial crisis or a disaffected army; historians weigh the shah's repression, his dependence on Washington and London, and the dislocations of his reforms. In 1980 Iraq invaded Iran; the war lasted until 1988, killed around 500,000 people by the most cited figure, and changed no borders.

Sunni political Islam was older. In 1928 the schoolteacher **Hassan al-Banna** founded the **Muslim Brotherhood** in Egypt, combining social services with politics; from the 1980s it campaigned under the slogan "Islam is the solution". Nasser crushed it, and in 1966 his regime hanged **Sayyid Qutb**, whose *Milestones* made him an originator of militant Islamism. Repressed under Nasser, it revived after the 1967 defeat discredited secular Arab nationalism. The year 1979, with Iran's revolution, the armed seizure of Mecca's Grand Mosque and the Soviet invasion of Afghanistan, is often treated as a turning point. Shia clerics founded **Hezbollah** in Lebanon in 1982 with Iranian help, and Sheikh Ahmed Yassin founded **Hamas** in 1987.

## Lebanon, the Palestinians and Oslo

After King Hussein's army expelled the Palestinian guerrillas from Jordan in "Black September" (1970–71), they moved to Lebanon. Lebanon's civil war (1975–90) set Christian militias against the PLO and its Lebanese Muslim, leftist and pan-Arab allies, and drew in Syria, Israel and Iran; estimates of the dead range from about 120,000 to 150,000. After Israel invaded in 1982 to expel the PLO, a Christian militia killed between 1,300 named victims and an estimated 3,500 civilians (by the historian Bayan Nuwayhed al-Hout's count; Israeli intelligence estimated 700–800), mostly Palestinians and Lebanese Shias, at **Sabra and Shatila** while Israeli forces surrounded the camps; Israel's own Kahan Commission found Israel indirectly responsible.

The **First Intifada** began in Gaza in December 1987 with strikes, boycotts and stone-throwing. Over six years the Israeli army killed at least 1,087 Palestinians; between 179 (B'Tselem's count) and 200 (official Israeli figures) Israelis were killed, and an estimated 822 Palestinians were killed as alleged collaborators. The **Oslo Accords** of 1993 brought mutual recognition between Israel and the PLO and led to the creation of the Palestinian Authority in 1994, but no Palestinian state; Edward Said called them "a Palestinian Versailles", and an Israeli extremist assassinated Rabin in 1995. The **Second Intifada** (2000–05), with more than a hundred suicide bombings, killed about 3,000 Palestinians and 1,000 Israelis. The chapter on Modern Conflicts since 1991 follows Gaza since October 2023.

## The Kurds

The Kurds, an estimated 30–45 million people, are often called the largest ethnic group without a state. Sèvres had provided for possible Kurdish autonomy; Lausanne did not. In Turkey the Sheikh Said rebellion of 1925, whose religious or national character is debated, is called by Robert Olson the first large-scale Kurdish nationalist rebellion; the PKK's insurgency from 1984 cost more than 40,000 lives, most of them Kurdish civilians. In Iraq, Saddam Hussein's **Anfal** campaign of 1988 killed 50,000–100,000 people according to Human Rights Watch, which called it genocide; Kurdish leaders cite 182,000. An Iraqi tribunal also called it genocide, but a court in The Hague found in 2007 that the documents were insufficient to establish it. At Halabja a chemical attack killed 3,200–5,000 people. After 1991 Iraq's Kurds gained self-rule under the Kurdistan Regional Government.

## Women and Social Change

Arguments about women ran through every modernising project. The Egyptian jurist **Qasim Amin** attacked veiling and seclusion in *The Liberation of Women* (1899), though Leila Ahmed questions his feminism. **Huda Sha'arawi** founded the Egyptian Feminist Union in 1923 and publicly removed her face veil. States imposed dress from above, in both directions: Reza Shah banned the veil in 1936, and veiling became compulsory in Iran after 1979. Women also pushed from below. Saudi women who drove in Riyadh in 1990 were arrested, and the driving ban ended only in 2018, weeks after activists such as Loujain al-Hathloul were detained. In Iran the death of Mahsa Amini in morality-police custody in 2022 set off protests in which at least 551 people were killed, according to the group Iran Human Rights.

```checkpoint
q: What did Human Rights Watch conclude about the Anfal campaign of 1988?
a: That it was a counter-insurgency with no civilian deaths.
x: Human Rights Watch estimated tens of thousands of deaths and called it genocide.
a*: That it killed 50,000–100,000 people and amounted to genocide.
a: That it was carried out by Iran.
x: Anfal was carried out by Saddam Hussein's regime against Iraqi Kurds.
a: That exactly 182,000 people died.
x: 182,000 is the figure Kurdish leaders cite; HRW estimated 50,000–100,000.
hint: Think of the range and the word HRW used.
why: Anfal shows how death tolls and legal labels are contested: an Iraqi tribunal agreed it was genocide, a Hague court in 2007 did not find enough evidence.
---
q: What does rentier-state theory argue?
a: That oil wealth makes democracy inevitable.
x: It argues the opposite: oil rents weaken pressure for representation.
a: That Gulf states tax their citizens more heavily than other states.
x: Rentier states need not tax citizens, because oil rents fund the state.
a: That OPEC was founded to end monarchy in the Gulf.
x: OPEC was founded to shift power from oil companies to producing states.
a*: That states living on oil rents need not tax citizens, who in turn demand less representation.
hint: Think of "no taxation, no representation".
why: Mahdavy, Beblawi and Luciani developed it; Michael Herb and later Luciani himself criticised it.
```

## Patterns and Debates

The years since 1990, from the Gulf War over Kuwait to the Arab uprisings of 2011 under the slogan "the people want to bring down the regime", are told in the chapter on Modern Conflicts since 1991. Regimes without large oil wealth and hereditary succession proved likeliest to fall.

Who made the modern Middle East? James Gelvin frames its history through two global forces, a world economy and a world system of nation-states; Eugene Rogan's *The Arabs* tells it largely from the Arab side, through Ottoman, European and American eras. Both help explain the recurring patterns: outside intervention, from wartime partition to the Cold War; authoritarian states built on armies, single parties and often oil; and resistance, secular and religious, from the Tobacco Protest to the intifadas.

How outsiders have written about the region is itself a debate. In *Orientalism* (1978) the Jerusalem-born critic Edward Said argued that Western scholarship on "the Orient" was bound up with imperial power.

```quote
a Western style for dominating, restructuring, and having authority over the Orient
Edward Said · Orientalism · 1978
```

Bernard Lewis attacked the thesis as anti-Western in 1982; Said replied that Orientalism, unlike classical scholarship, had served empire. Sadiq Jalal al-Azm, Aijaz Ahmad and Robert Irwin were among Said's other critics. Makdisi's *Age of Coexistence* (2019) argues against the image of an innately sectarian region, finding an "ecumenical frame" of coexistence in modern Arab politics, though reviewers note its focus on elites and intellectuals. Each debate turns on the same question: how far the region's peoples made their own modern history, and how far it was made for them.

## Further exploration

- **Albert Hourani, *Arabic Thought in the Liberal Age, 1798–1939* (1962).** The classic study of the Nahda and Islamic modernism, from Tahtawi to al-Afghani and Abduh.
- **Eugene Rogan, *The Arabs: A History* (2009).** Five centuries of Arab history, told largely from the Arab side.
- **James L. Gelvin, *The Modern Middle East: A History* (2004).** The region's modern history through the world economy and the nation-state system.
- **Ervand Abrahamian, *A History of Modern Iran* (2008).** State-building in Iran from the Qajars to the Islamic Republic.
- **Leila Ahmed, *Women and Gender in Islam: Historical Roots of a Modern Debate* (1992).** Gender debates from early Islam to the modern veiling controversies.
- **Ussama Makdisi, *Age of Coexistence: The Ecumenical Frame and the Making of the Modern Arab World* (2019).** A challenge to the idea of an innately sectarian Middle East.
- **Edward Said, *Orientalism* (1978).** The influential and contested critique of Western scholarship on the region.$mn_mideast_master$,
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
  select $mn_mideast_quiz$[
    {"type": "mcq", "prompt": "What did the Edict of Gülhane (1839), which launched the Tanzimat, promise?", "options": ["Security of life, property and honour, fair taxation and conscription, and rights for all subjects regardless of religion", "An elected parliament and the end of the sultanate", "Independence for the Arab provinces", "The abolition of the caliphate"], "answerIndex": 0, "explanation": "The edict made promises rather than legal changes and was never fully implemented; historians such as Abu-Manneh and Shaw debate whether its roots were Islamic or Western.", "id": "q1"},
    {"type": "mcq", "prompt": "In McMahon's letter of 24 October 1915, which lands were excluded from the promised Arab independence?", "options": ["All of Mesopotamia", "The Hejaz", "\"Portions of Syria\" lying west of \"the districts of Damascus, Homs, Hama and Aleppo\"", "Egypt and Sudan"], "answerIndex": 2, "explanation": "Whether this excluded Palestine has been disputed ever since: Britain later said it did, while Arabs read it as excluding only the Lebanese coast.", "id": "q2"},
    {"type": "mcq", "prompt": "Which states founded OPEC at Baghdad in 1960?", "options": ["Saudi Arabia, Egypt, Syria, Jordan and Iraq", "The United Arab Emirates, Qatar, Bahrain, Oman and Kuwait", "Britain, the United States, France, the Netherlands and Iran", "Iran, Iraq, Kuwait, Saudi Arabia and Venezuela"], "answerIndex": 3, "explanation": "OPEC shifted power from the 'Seven Sisters' oil companies to the producing states.", "id": "q3"},
    {"type": "mcq", "prompt": "What do consensus estimates give as the number of deaths in Iran's revolution between January 1978 and February 1979?", "options": ["60,000", "Between 532 and 2,781", "Around 500,000", "Exactly 52"], "answerIndex": 1, "explanation": "Khomeini's figure of 60,000 is rejected as grossly overstated; around 500,000 is the commonly cited toll of the later Iran–Iraq War.", "id": "q4"},
    {"type": "open", "prompt": "How far is it fair to say that the borders of the modern Middle East were drawn by the Sykes–Picot Agreement?", "rubric": "A strong answer explains the wartime promises (McMahon–Hussein, Sykes–Picot, Balfour) and why they conflicted; notes that Sykes–Picot was never implemented as drawn (France ceded Mosul and Palestine; San Remo 1920, Lausanne 1923 and later agreements set the borders); cites historians such as Laurens, Bâli and Pursley (Iraq as a distinct Ottoman region of Mosul, Baghdad and Basra); and weighs the counterpoint that the logic of partition and Sykes–Picot as a symbol of betrayal were real, as al-Baghdadi's 2014 rhetoric shows.", "id": "q5"},
    {"type": "open", "prompt": "Compare the ways states in the modern Middle East shaped women's lives with the ways women themselves pushed for change.", "rubric": "A strong answer contrasts state action from above in both directions (Reza Shah's ban on the veil in 1936, Atatürk's secular civil code and votes for women in 1930 and 1934, the White Revolution's enfranchisement in 1963, compulsory veiling in Iran after 1979) with movements from below (Qasim Amin and Leila Ahmed's critique, Huda Sha'arawi and the Egyptian Feminist Union, Saudi women drivers from 1990 to the lifting of the ban in 2018 and the detention of activists such as Loujain al-Hathloul, the 2022 protests after Mahsa Amini's death).", "id": "q6"}
  ]$mn_mideast_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/middle-east/the-making-of-the-modern-middle-east', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
