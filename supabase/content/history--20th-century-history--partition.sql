-- Partition and its Consequences: Ireland, India, Palestine — canonical master article, co-written and human-reviewed.
-- history/20th-century-history/partition-and-its-consequences-ireland-india-palestine @ research/advanced/read.
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
    'history/20th-century-history/partition-and-its-consequences-ireland-india-palestine',
    'research',
    'advanced',
    'read',
    $mn_partition_master$> **Three exits, three divided lands.** Between 1920 and 1948 Britain left, or began to leave, three places it ruled, and each time left a new border behind: Ireland in 1920–22, India in 1947, Palestine in 1947–48. This chapter follows the Ulster crisis, the Irish Civil War and the long road to the Troubles and the Good Friday Agreement; Mountbatten's timetable, Radcliffe's line, the killing and flight in Punjab and Bengal, and unresolved Kashmir; and the UN partition plan, the war of 1948, the Palestinian Nakba and the migration, flight and expulsion of Jews from the Arab world. It ends with the comparative questions: borders drawn in haste, stranded minorities, population transfer as a "solution", violence at the moment of imperial withdrawal, and why none of the three partitions is finished business.

## Partition as an Exit Strategy

In each case the empire faced two peoples with incompatible claims to the same land, and in each case British officials concluded that the way out was to divide it. T. G. Fraser's classic comparative study of 1984 treated partition as a British method of managing conflict that failed in all three places. A collection edited by Arie Dubnov and Laura Robson (2019) treats it not as a natural answer to ethnic conflict but as a twentieth-century imperial idea, carried between Ireland, India and Palestine by the same circles of officials and intellectuals. Whether partition was a British strategy, a last resort forced by local politics, or the communities' own demand is the thread running through every debate in this chapter.

## Ireland: The Ulster Question

The **Nationalism** chapter notes Gladstone's failed Home Rule bills. When Asquith introduced the Third Home Rule Bill in April 1912, it met fierce resistance in the north-east, where Protestant unionists were a majority and feared economic decline and religious persecution under a Catholic-dominated Dublin government: "Home Rule means Rome Rule". On and before "Ulster Day", 28 September 1912, nearly half a million men and women signed the Ulster Covenant and its companion Declaration. Unionists formed the Ulster Volunteers and in April 1914 landed almost 25,000 German rifles at Larne and other ports; nationalists formed the Irish Volunteers. Ireland seemed to be on the brink of civil war.

Home Rule became law in September 1914 but was suspended for the war, with the exclusion of some or all of Ulster still undecided. Proposals ranged from three or four counties to all nine, before settling on six. In May 1916 Lloyd George privately assured the unionist leader Edward Carson: "We must make it clear that at the end of the provisional period Ulster does not, whether she wills it or not, merge in the rest of Ireland." The nationalist leader John Redmond had been told that exclusion would be temporary and the counties could vote. A vote was never held.

The war transformed Irish politics. The Easter Rising of April 1916 was crushed in six days; 485 people died, more than half of them civilians, and sixteen leaders were executed. In the 1918 election Sinn Féin won 73 of Ireland's 105 seats, set up its own parliament, Dáil Éireann, and declared independence. The guerrilla War of Independence that followed killed about 2,300 people before the truce of July 1921. In the north-east the conflict was sectarian: in 1920 loyalists drove 8,000 "disloyal" workers out of the Belfast shipyards, and between 1920 and 1922 more than 500 people were killed in what became Northern Ireland, most of them Catholics.

## Ireland: Treaty, Border and Civil War

The Government of Ireland Act 1920, in force from 3 May 1921, is the legal moment of partition. It created two home-rule parliaments within the United Kingdom, one for six north-eastern counties and one for the south. Most northern unionists wanted six counties rather than all nine of Ulster because six gave a safer majority, though two of the six, Tyrone and Fermanagh, had Catholic majorities in the 1911 census. A nationalist MP, Thomas Harbison, protested that Ulster nationalists were being "cut off from the rest of Ireland and thrown into eternal slavery".

The Anglo-Irish Treaty of 6 December 1921 made the south the Irish Free State, a self-governing dominion. Michael Collins defended it as giving "the freedom to achieve freedom"; the Dáil approved it by 64 votes to 57. The main quarrel was over the oath of allegiance to the king rather than the border, but partition was a significant cause of dissent. Northern Ireland opted out, as the Treaty allowed, and a Boundary Commission was to redraw the border "in accordance with the wishes of the inhabitants". Michael Collins expected the commission to take Tyrone and Fermanagh, perhaps half the six-county area. But the commission's chairman ruled out plebiscites, and its report proposed only small transfers. In December 1925 the three governments suppressed it and confirmed the existing border, and the Free State was released from its share of the UK's national debt. De Valera said the Free State had "sold Ulster natives for four pound a head, to clear a debt we did not owe."

Meanwhile the south had fought a civil war over the Treaty, from June 1922 to May 1923, which the pro-Treaty National Army, supplied with British weapons, won. Collins was killed in August 1922, and the Free State officially executed 81 republican prisoners. Recent research puts the dead at roughly 1,500 to 2,000. The two sides became independent Ireland's main parties, Fine Gael and Fianna Fáil.

## Ireland: A Protestant State, the Troubles and Good Friday

Unionists governed Northern Ireland without a break for fifty years. Catholics, at first about 35 per cent of the population, faced almost wholly Protestant police forces and a Special Powers Act, allowing internment without trial, that was used almost exclusively against nationalists; local boundaries were redrawn to gerrymander nationalist-majority Derry City and other towns. (Some unionists argue that disadvantage also had economic and geographical causes.) In April 1934 Craig declared: "All I boast of is that we are a Protestant Parliament and a Protestant State." The line is often misquoted as "a Protestant parliament for a Protestant people"; that November he did speak of "a Protestant Government for a Protestant people". In the south, de Valera's constitution of 1937 claimed "the whole island of Ireland".

From 1967 a civil rights movement, modelled on the American one, campaigned against discrimination in housing, jobs, policing and the vote. On 5 October 1968 police beat marchers in Derry in front of the cameras; after the riots of August 1969 British troops were deployed. Of the 342 people arrested in the first internment sweep of August 1971, none was a loyalist. On Bloody Sunday, 30 January 1972, paratroopers shot 26 unarmed civilians in Derry; thirteen died that day and a fourteenth months later. The Saville Inquiry found in 2010 that the shootings were "unjustified" and "unjustifiable". The Troubles killed about 3,500 people (counts range from about 3,500 to 3,700), about half of them civilians.

The Good Friday Agreement of 10 April 1998, agreed by the British and Irish governments and eight Northern parties, brought power-sharing and the principle of consent: Northern Ireland would remain in the UK as long as a majority there wished. Voters approved it in referendums north (71 per cent) and south (94 per cent), and the Republic removed its territorial claim from the constitution.

```checkpoint
q: Why were six counties, rather than all nine counties of Ulster, placed in Northern Ireland?
a*: Because six counties gave unionists a safer majority than nine, which included heavily Catholic Cavan, Donegal and Monaghan.
a: Because all six had Protestant majorities in the 1911 census.
x: Tyrone and Fermanagh, two of the six, had Catholic majorities in 1911.
a: Because the Boundary Commission of 1924–25 drew the border on that line.
x: The six-county area was created by the Government of Ireland Act 1920; the later commission's report was suppressed.
a: Because a plebiscite in 1921 asked each county to choose.
x: No such vote was held; the later Boundary Commission's chairman even ruled out plebiscites.
hint: Think about the size of the unionist majority in each option.
why: The border was designed around a secure unionist majority, which left a large Catholic minority inside Northern Ireland from the start.
---
q: What did the Good Friday Agreement of 1998 establish?
a: The immediate unification of Ireland.
x: It established the principle of consent: Northern Ireland stays in the UK while a majority there wishes.
a: The suspension of the Northern Ireland parliament and direct rule from London.
x: It created a power-sharing government, the opposite of direct rule.
a*: Power-sharing, the principle of consent, North–South bodies and police reform, approved by referendums in both parts of Ireland.
a: The end of the Irish Free State's dominion status.
x: The Agreement concerned Northern Ireland and was signed in 1998, long after the Free State era.
hint: Think of "consent" and "power-sharing".
why: The Agreement did not undo partition but changed how it was governed and how it could be changed.
```

## India: The Road to Partition

In India the idea of separate statehood for Muslims took shape during the Second World War. In March 1940 the All-India Muslim League, meeting at Lahore, called for "independent states" in the Muslim-majority zones of the north-west and east. Its leader, Muhammad Ali Jinnah, set out the two-nation theory: Hindus and Muslims, he argued, "belong to two different civilizations which are based mainly on conflicting ideas and conceptions." The Cripps Mission of 1942 offered dominion status after the war, and both Congress and the League rejected it. As the **Second World War** chapter describes, Congress then launched the Quit India movement in August 1942; most of its leaders were jailed until 1945, which left the League free to organise.

The 1946 elections showed how far things had moved. Congress swept the general seats, but the League won about 87 per cent of the Muslim seats. A British Cabinet Mission proposed a loose federation, which the League accepted and which foundered after a speech by Nehru in July 1946. Jinnah warned: "We will either have a divided India or a destroyed India." On the League's Direct Action Day, 16 August 1946, Calcutta exploded: more than 4,000 people, Hindus and Muslims, died within 72 hours (some estimates reach 10,000). Killings spread to Noakhali, where Muslims attacked Hindus, to Bihar, where Hindus attacked Muslims, and in March 1947 to Rawalpindi, where Muslims attacked Hindus and Sikhs. Who wanted partition remains contested. Ayesha Jalal argues that Jinnah used the Pakistan demand as a bargaining counter for Muslim rights within India, and that Congress's refusal to share power produced partition. Joya Chatterji has shown that in Bengal it was Hindu elites and the provincial Congress who campaigned for division in 1947, preferring it to Muslim-majority rule.

## Mountbatten's Timetable and the Radcliffe Line

Attlee's Labour government had decided to leave, and early in 1947 announced it would transfer power no later than June 1948. Lord Mountbatten arrived as the last viceroy in March 1947 with instructions to avoid partition, but concluded that partition was the price of a quick handover. On 3 June 1947 he announced it, and brought independence forward to mid-August. Vallabhbhai Patel told Congress that "the choice is between one division and many divisions". Pakistan became independent on 14 August 1947 and India on 15 August, when Nehru told India that "at the stroke of the midnight hour, when the world sleeps, India will awake to life and freedom."

{{image: Radcliffe Line | The Radcliffe Line divided Punjab in the west and Bengal in the east between India and Pakistan in 1947.}}

The new borders were drawn by Sir Cyril Radcliffe, a London barrister who had never visited India and was given just five weeks. Both boundary commissions split evenly between Congress and League nominees, leaving every major decision to him. The awards were published on 17 August, two days after independence, so independence came before anyone knew where the borders lay, and keeping order on them fell to two brand-new states. Disputes began at once. The division of Gurdaspur, which had a bare Muslim majority, gave India part of the district; Pakistanis allege that Mountbatten manipulated the award to give India a route to Kashmir, which he and Radcliffe denied, though many Indian historians now accept that Mountbatten probably influenced the Ferozepur award in India's favour. Radcliffe destroyed his papers before he left. W. H. Auden later made him the subject of a poem.

```quote
Unbiased at least he was when he arrived on his mission
W. H. Auden · "Partition" · 1966
```

Was the haste fatal? Stanley Wolpert blames it for the scale of the slaughter; Lawrence James and others reply that Mountbatten had no option but to "cut and run", given looming civil war and Britain's exhausted resources.

## Violence, Flight and the Women of Partition

Estimates of those displaced range from 12 to 20 million; the 1951 censuses counted about 14.5 million displaced persons. In Punjab virtually no Muslim survived in the east, and virtually no Hindu or Sikh in the west, outside a few enclaves; in Bengal migration continued for years. Estimates of the dead range from 200,000 to 2 million, the span given by Ian Talbot and Gurharpal Singh, with "perhaps a million" a common midpoint. West Punjab's governor estimated that 500,000 Muslims died trying to reach his province alone; the British High Commissioner in Karachi put the full toll at 800,000, which, Lawrence James writes, "makes nonsense of the claim by Mountbatten and his partisans that only 200,000 were killed". Talbot and Singh describe violence "designed to cleanse an existing generation and prevent its future reproduction". No exchange of population had been planned; an organised transfer was arranged only in Punjab.

Women's bodies became battlegrounds. India claimed that 33,000 Hindu and Sikh women had been abducted, Pakistan that 50,000 Muslim women had been; Urvashi Butalia's widely repeated estimate of the women kidnapped and raped is 75,000 to 100,000, and other estimates are lower. By 1954 the two states had "recovered" about 30,000 women, and many refused to return, fearing their families would not accept them. Some women were killed by their own families, or killed themselves; at Thoha Khalsa, near Rawalpindi, many Sikh women drowned themselves in a well. These stories entered history largely through oral history: Urvashi Butalia's *The Other Side of Silence* (1998), which begins with her own family, and the 1947 Partition Archive, which has recorded more than 12,000 interviews.

## Kashmir and the Second Partition

Jammu and Kashmir, a Muslim-majority princely state with a Hindu ruler, was left undecided. In October 1947, after a rebellion in its western districts, a massacre of Muslims in Jammu and an invasion by Pakistani tribal militias, Maharaja Hari Singh acceded to India, provisionally, pending a "reference to the people". Jinnah called it "fraud and violence". The plebiscite the UN called for in 1948 has never been held; the ceasefire line became the Line of Control, and wars followed in 1965, 1971 and 1999. In 1971 Pakistan itself was divided when its eastern wing became Bangladesh, after Operation Searchlight, launched when the Awami League's election victory was ignored, and India's entry into the war.

## Palestine: From Mandate to Resolution 181

As the **First World War** chapter describes, the Balfour Declaration of 1917 promised "a national home for the Jewish people" while protecting the rights of "existing non-Jewish communities". When the Mandate began, Jews were about 11 per cent of Palestine's people; by 1946 they were about a third. The Arab revolt of 1936–39, described in the chapter on the interwar years, prompted the Peel Commission, whose report of July 1937 was the first official proposal to partition Palestine.

```quote
An irrepressible conflict has arisen between two national communities within the narrow bounds of one small country.
Peel Commission · Report · 7 July 1937
```

Peel proposed a small Jewish state and an Arab state joined to Transjordan, and, citing the Greek–Turkish exchange of 1923, a transfer of population that would be "in the last resort … compulsory": 225,000 Arabs lived in the proposed Jewish area, 1,250 Jews in the Arab one. The Arab Higher Committee rejected the plan; Weizmann and Ben-Gurion accepted it as a basis for negotiation. In 1946 the Irgun bombed the King David Hotel, the British headquarters, killing more than 90 people, and in February 1947 Britain announced that it would hand Palestine to the United Nations, later setting midnight on 14 May 1948 as the end of the Mandate.

On 29 November 1947 the UN General Assembly voted 33 to 13, with 10 abstentions, for Resolution 181. It gave the Jewish state about 56 per cent of the land and the Arab state about 43 per cent, with Jerusalem and Bethlehem as an international zone. The Jewish state would have held 498,000 Jews and 407,000 Arabs; Arabs were about two-thirds of Palestine's population and, by their own figure, owned 94 per cent of its land, while Jews legally owned about 7 per cent, much of the rest being state or unregistered land. The United States and the Soviet Union voted for; the Arab states, India and Pakistan voted against; Britain abstained. The Jewish Agency accepted the plan, though Ben-Gurion called its borders "bad from a military and political point of view". The Arab Higher Committee and the Arab states rejected it as a violation of self-determination. Historians still debate whether Zionist acceptance was tactical, as Simha Flapan and others argue, or broad if unenthusiastic, as Benny Morris holds, while noting that leaders hoped to expand the borders if war came.

## War, the Nakba and the Exodus from Arab Lands

Fighting began the next day as a civil war between Palestine's Jewish and Arab communities. On 9 April 1948 Irgun and Lehi fighters, supported by the Haganah, killed at least 107 villagers at Deir Yassin, including women and children; the Haganah and Jewish Agency condemned it, and news of it spread terror and flight. In reprisal, on 13 April, 78 Jewish doctors, nurses, patients and Haganah escorts were killed in an attack on a Haganah-escorted convoy to the Hadassah hospital. On 14 May Ben-Gurion declared the State of Israel, and the next day the armies of Egypt, Transjordan, Iraq, Syria and Lebanon invaded. Israel lost between about 5,700 and 6,400 dead, around one per cent of its population. Arab losses are uncertain: the Arab armies lost perhaps 3,700 to 7,000 soldiers, and estimates of Palestinian deaths run from 3,000 to 13,000 or more, and the Palestinian historian Aref al-Aref counted 13,000 Palestinian dead. By the armistices of 1949 Israel held about 78 per cent of Mandatory Palestine, Transjordan held the West Bank and Egypt the Gaza Strip.

For Palestinians, 1948 is the **Nakba**, "the catastrophe", a term first used in this sense by Constantin Zureiq that year. About 700,000 to 750,000 Palestinians, around half of Palestine's Arab population, were expelled or fled; estimates of those who had already left before the Arab armies arrived run from about 250,000 (Morris) to 380,000 (Pappé). Hundreds of villages and towns were depopulated or destroyed; Morris counts 369 localities, Walid Khalidi's *All That Remains* 418 and Abu Sitta 531. In July 1948 about 60,000 people were expelled from Lydda and Ramle. In December the UN resolved that refugees wishing to return "should be permitted to do so at the earliest practicable date". About 160,000 Arabs remained in Israel. For Israelis the same war is the War of Independence.

In the following decades about 900,000 Jews migrated, fled or were expelled from Muslim-majority countries, and about 650,000 of them settled in Israel. There were riots and killings, as at Oujda and Jerada in Morocco in June 1948; about 120,000 Iraqi Jews left in 1950–51 on condition of giving up their citizenship. Whether this exodus mirrors the Nakba is argued over: some speak of a "Jewish Nakba", while others, such as the Iraqi-born historian Avi Shlaim ("nobody expelled us from Iraq"), stress the pull of Zionism and reject the analogy.

## Debating 1948

Why did the Palestinians leave? The older Israeli account said Arab leaders told them to go. Benny Morris, working in newly opened Israeli archives, found this was not the main cause: the exodus was in large part a response to expulsions and violence, though he found no master plan, and he later called it "a variety of ethnic cleansing", though he has also defended the expulsions and in 2016 rejected the term for the war as a whole. Ilan Pappé argues that it was a deliberate, planned ethnic cleansing, with Plan Dalet as its blueprint, as Walid Khalidi had argued earlier. Yoav Gelber and David Tal read Plan Dalet as defensive, and Efraim Karsh argues that the catastrophe was largely of the Arab leadership's own making. Rashid Khalidi examines Palestinian leadership failures alongside British and Zionist obstruction. Most scholarship since Morris's work agrees that expulsions, violence and the fear of them were the primary causes, but the weight of planning, war and leadership remains in dispute.

```checkpoint
q: Why were the Radcliffe awards so damaging to the people of Punjab and Bengal?
a: Because they were drawn after a careful plebiscite, district by district.
x: There were no plebiscites in Punjab and Bengal; the line was drawn in about five weeks.
a*: Because they were drawn in haste and published on 17 August, two days after independence, so independence came before the borders were known.
a: Because Radcliffe had lived in India for decades and favoured one side.
x: Radcliffe had never visited India before 1947.
a: Because they followed the borders proposed by the Cabinet Mission of 1946.
x: The Cabinet Mission proposed a federation of groups, not a partition line.
hint: Compare the date of publication with the date of independence.
why: Haste meant that order on the new borders was left to two newly created states.
---
q: Which statement best describes the historians' debate over the Palestinian exodus of 1948?
a: All historians agree that Arab leaders ordered Palestinians to leave.
x: Morris's archival work found that this was not the main cause.
a: All historians agree there was a single master plan of expulsion.
x: Morris found no master plan; Pappé argues for one; Gelber and Tal read Plan Dalet as defensive.
a: Historians agree the exodus was caused only by the Arab armies' invasion.
x: Estimates of Palestinians who had left before 15 May 1948 run from about 250,000 to 380,000.
a*: Most now see expulsions, violence and fear as the primary causes, but disagree over how far it was planned.
hint: Think of Morris, Pappé and Karsh.
why: The causes of the exodus remain politically charged because they bear on the refugees' claims today.
```

## Comparing the Partitions

The three cases share striking features. All were shaped by **haste**: Ireland's border was drawn around a safe unionist majority and confirmed only when the Boundary Commission's report was buried, India's by a barrister given five weeks, Palestine's by a Britain that set a date to leave and left the UN to draw the lines. All left **minorities** on the wrong side: Catholics, more than a third of Northern Ireland, 407,000 Arabs inside the planned Jewish state, millions of Hindus, Sikhs and Muslims in Punjab and Bengal. **Population transfer** was repeatedly presented as the solution. Peel cited the Greek–Turkish exchange; in India Ambedkar and Patel favoured a full exchange; in practice transfer came through massacre and flight, not planning. And in each case **violence peaked at the moment of withdrawal**, when the old state's authority was ending and the new states' had not begun. Cyprus, independent from Britain in 1960, repeated the pattern: the Turkish Cypriot organisation TMT demanded *taksim*, partition, and since Turkey's invasion of 1974 the island has stayed divided.

Was partition British "divide and rule"? Talbot and Singh insist that India's partition was neither the inevitable end of British policy nor of Hindu–Muslim difference. Venkat Dhulipala rejects "divide and rule" as the cause and stresses the popular vision of Pakistan as a "New Medina". On Ireland, nationalists saw an arbitrary division imposed against the island's majority; unionists saw self-determination for a distinct people. Charles Townshend's history has been read both as making partition seem nearly inevitable and as concluding that it was the only workable answer.

## Why the Partitions Remain Alive

None of these borders has settled into history. Brexit reopened the Irish border question through the "Irish Sea border". Kashmir remains divided between India, Pakistan and China, and in 2019 India revoked Article 370, which had governed the state's place in the Union. In 2021 India declared 14 August "Partition Horrors Remembrance Day", which the opposition Congress criticised as politically motivated. Palestinians mark Nakba Day each 15 May, while an Israeli law of 2011 allows the government to cut funding to state-funded bodies that mark Independence Day as a day of mourning; the refugees of 1948 and their descendants, and the 1949 "Green Line", remain at the centre of the conflict. In all three places partition is not only remembered but argued over, because the questions it was meant to settle, who belongs where and on whose terms, are still open.

## Further exploration

- **T. G. Fraser, *Partition in Ireland, India and Palestine: Theory and Practice* (1984).** The classic comparative study, arguing that Britain used partition to manage conflict and failed all three times.
- **Arie M. Dubnov and Laura Robson (eds.), *Partitions: A Transnational History of Twentieth-Century Territorial Separatism* (2019).** Essays treating partition as a modern imperial idea that travelled between Ireland, India and Palestine.
- **Charles Townshend, *The Partition: Ireland Divided, 1885–1925* (2021).** An authoritative narrative of how Ireland came to be divided.
- **Yasmin Khan, *The Great Partition: The Making of India and Pakistan* (2007).** A vivid account of 1946–48 seen from below.
- **Urvashi Butalia, *The Other Side of Silence: Voices from the Partition of India* (1998).** The landmark oral history of Partition, centred on women.
- **Benny Morris, *The Birth of the Palestinian Refugee Problem Revisited* (2004).** A detailed archival account of the Palestinian exodus of 1947–49, village by village.
- **Rashid Khalidi, *The Iron Cage* (2006).** A Palestinian historian on the failures of Palestinian leadership and the obstacles it faced.$mn_partition_master$,
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
  select $mn_partition_quiz$[
    {"type": "mcq", "prompt": "What did the Government of Ireland Act 1920 create?", "options": ["An independent Irish republic for the whole island", "Two home-rule parliaments within the United Kingdom, one for six north-eastern counties and one for the south", "The Irish Free State as a self-governing dominion", "A single all-Ireland parliament with an Ulster veto"], "answerIndex": 1, "explanation": "The Act, in force from 3 May 1921, is the legal moment of partition; the Free State came later, under the Anglo-Irish Treaty of December 1921.", "id": "q1"},
    {"type": "mcq", "prompt": "When were the Radcliffe boundary awards for Punjab and Bengal published?", "options": ["On 3 June 1947, with the partition plan", "In March 1947, when Mountbatten arrived", "On 14 August 1947, the day Pakistan became independent", "On 17 August 1947, two days after Indian independence"], "answerIndex": 3, "explanation": "Radcliffe, who had never visited India, was given about five weeks; independence came before the borders were known.", "id": "q2"},
    {"type": "mcq", "prompt": "What did UN General Assembly Resolution 181 of 29 November 1947 propose?", "options": ["A Jewish state on about 56 per cent of the land, an Arab state on about 43 per cent, and an international zone for Jerusalem and Bethlehem", "A single binational state within ten years", "The annexation of the whole of Palestine to Transjordan", "A Jewish state on the coastal plain and Galilee only, with compulsory transfer"], "answerIndex": 0, "explanation": "The plan passed by 33 to 13 with 10 abstentions; the binational state was the 1939 White Paper and the small Jewish state with transfer was the Peel plan of 1937.", "id": "q3"},
    {"type": "mcq", "prompt": "Which range do historians give for the number of people killed in the partition of India?", "options": ["About 20,000 to 50,000", "Exactly one million", "200,000 to 2 million", "5 to 10 million"], "answerIndex": 2, "explanation": "Talbot and Singh give figures ranging from 200,000 to 2 million; 'perhaps a million' is a common midpoint, and 12 to 20 million were displaced.", "id": "q4"},
    {"type": "open", "prompt": "Compare the partitions of Ireland, India and Palestine. What did they have in common, and how did they differ?", "rubric": "A strong answer discusses haste (Mountbatten's timetable and the five-week Radcliffe line; Britain's fixed date to leave Palestine; the six-county border and the suppressed Boundary Commission report), stranded minorities (Catholics in Northern Ireland, about 35 per cent; 407,000 Arabs in the planned Jewish state; Hindus, Sikhs and Muslims in Punjab and Bengal), population transfer as a 'solution' (Peel's citation of the Greek–Turkish exchange; Punjab's transfer organised only after violence), and violence at the moment of withdrawal. It notes differences of scale (about 1,500–2,000 dead in the Irish Civil War against 200,000–2 million in India) and refers to the debate over whether partition was British 'divide and rule' (Fraser; Dubnov and Robson; Talbot and Singh; Jalal; Chatterji).", "id": "q5"},
    {"type": "open", "prompt": "Why did some 700,000 to 750,000 Palestinians leave their homes in 1947–49, and how have historians disagreed about it?", "rubric": "A strong answer sets out the events (the civil war from November 1947, Deir Yassin and the Hadassah convoy attack, the declaration of Israel and the Arab states' invasion in May 1948, Lydda and Ramle, the 250,000–380,000 who left before 15 May) and the main interpretations: the older account of Arab orders to leave; Morris (expulsions and violence, no master plan); Pappé and Walid Khalidi (Plan Dalet as a plan of ethnic cleansing); Gelber and Tal (Plan Dalet as defensive); Karsh (Arab leadership's responsibility); Rashid Khalidi (leadership failures and obstruction). It notes that most scholarship sees expulsions, violence and fear as the primary causes, and may mention Resolution 194 and the debate over comparing the Nakba with the Jewish exodus from Arab countries.", "id": "q6"}
  ]$mn_partition_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/20th-century-history/partition-and-its-consequences-ireland-india-palestine', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
