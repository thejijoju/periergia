-- History of Peace and Peacemaking — canonical master article, co-written and human-reviewed.
-- history/thematic-history/history-of-peace-and-peacemaking @ research/advanced/read.
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
    'history/thematic-history/history-of-peace-and-peacemaking',
    'research',
    'advanced',
    'read',
    $mn_peace_master$> **How wars end, and how peace is made and kept.** Much of what rulers and empires called peace looked very different to the people living under it. This chapter follows peacemaking across more than three thousand years: from a Bronze Age treaty between Egypt and the Hittites, Ashoka's remorse and the Haudenosaunee Great Law of Peace, through Westphalia, Vienna, Paris and San Francisco, to UN peacekeeping, truth commissions and the agreements of Camp David, Dayton, Good Friday and Colombia. It also follows those who campaigned for peace from outside power, from Quakers, women's leagues and scientists against the bomb to Gandhi, Ghaffar Khan, King and Liberia's women, and asks the questions historians still debate: was imperial peace really peace, did Westphalia invent sovereignty, is peace only the absence of war, and is the world becoming less violent?

## Treaties and Imperial Peaces

The oldest surviving peace treaty was concluded around 1259 BCE between Ramesses II of Egypt and Ḫattušili III of the Hittites. It is sometimes called the "Treaty of Kadesh", but it does not mention that battle, fought around 1274 BCE, after which the war dragged on inconclusively for about fifteen years, as the chapter on Ancient Egypt describes. It is the only ancient Near Eastern treaty that survives in versions from both sides: Egyptian hieroglyphs at Karnak and the Ramesseum, and an Akkadian text on clay tablets from Hattusa. The two kings promised non-aggression, mutual defence and the return of political refugees, with the gods of both lands as witnesses. The historian Bryce stresses that the treaty was less about peace for its own sake than about alliance, against a rising Assyria and to shore up Ḫattušili's legitimacy.

{{image: Egyptian–Hittite peace treaty | The Hittite version of the treaty between Ramesses II and Ḫattušili III (c. 1259 BCE), written in Akkadian on clay.}}

A very different text comes from India. In his Rock Edict XIII the Mauryan emperor Ashoka recorded that after conquering Kalinga, around 261 BCE, 150,000 people were deported, 100,000 killed and many more died, and that he felt "deep remorse". The figures are his own, and historians debate how sincere his conversion was, as the chapter on Classical India: the Mauryas to the Guptas explains. In China during the Warring States era, the philosopher Mozi preached "impartial caring" against the Confucian ethic of graded attachment, and his followers became known for opposing offensive war.

Empires have often called their rule peace. The Pax Romana is conventionally dated from Augustus in 27 BCE to the death of Marcus Aurelius in 180 CE. Walter Goffart observed that the *Cambridge Ancient History* volume for AD 70–192 "is called 'The Imperial Peace', but peace is not what one finds in its pages"; Arthur Eckstein replies that the Republic's wars had been far more frequent. The sharpest criticism came from a Roman: Tacitus gave a Caledonian chief, Calgacus, a speech against Rome's conquests.

```quote
Auferre trucidare rapere falsis nominibus imperium, atque ubi solitudinem faciunt, pacem appellant. ("…and where they make a desert, they call it peace.")
Tacitus · Agricola, speech of Calgacus · c. 98 CE
```

Historians later coined "Pax Mongolica" for the eased trade and travel across Eurasia under Mongol rule in the thirteenth and fourteenth centuries, after nearly a century of conquest. In medieval Europe the Church's Peace of God, first proclaimed in 989, protected clergy, church property and peasants, and the Truce of God, from 1027, banned fighting on certain days and seasons. Pope Urban II proclaimed the Truce in 1095, the year the First Crusade was launched: peace among Christians and war against others went together.

## The Great Law and the East Asian Order

The Haudenosaunee Confederacy of the Mohawk, Onondaga, Oneida, Cayuga and Seneca was founded on the Great Law of Peace, an oral constitution credited to the Peacemaker (Dekanawidah) and his spokesman Hiawatha, recorded with wampum belts and symbolised by the Tree of Peace. Its founding date is disputed, with proposals from the twelfth to the seventeenth century (see the chapter on North America before Columbus). Johansen and Grinde argued that the Haudenosaunee example inspired the framers of the United States Constitution, and in 1988 Congress recognised that influence, but the thesis remains contested.

China's relations with its neighbours are often described as a "tribute system", but the term is itself a modern Western construct, devised by John King Fairbank and Teng Ssu-yu in the early 1940s. Critics say it turned a flexible practice into an overly formal ritual system. David Kang and colleagues have argued that this hierarchy could keep the peace: Vietnamese rulers, working within it, paid little military attention to China between 1365 and 1841. Chinese state discourse today draws on "harmony" readings of that past.

## Westphalia, Vienna and the Balance of Power

The Peace of Westphalia, two treaties signed at Osnabrück and Münster in October 1648, ended the Thirty Years' War, which had killed between 4.5 and 8 million people (see the chapter on The Protestant and Catholic Reformations). Political scientists long treated 1648 as the birth of the modern system of sovereign states. Andreas Osiander called this a myth: the treaties, he wrote in 2001, "confirm neither [France's or Sweden's] 'sovereignty' nor anybody else's; least of all do they contain anything about sovereignty as a principle." Indeed they gave France and Sweden rights to intervene in the Empire. Daniel Philpott defends a stronger reading, while post-colonial scholars note how little the model fits states outside Europe.

The Congress of Vienna, told in the chapter on Napoleon and the Remaking of Europe, signed its Final Act in June 1815, nine days before Waterloo. It aimed to resize the great powers so that they balanced one another; it also condemned the slave trade, and the Ottoman Empire, though invited, sent no delegation. Kissinger read Vienna as a balance of power; Paul Schroeder argued instead that the old balance-of-power politics had been predatory and destabilising, and that Vienna's achievement was a set of shared rules. In the resulting Concert of Europe the five great powers acted together to preserve the status quo. Russia, Austria and Prussia used it against liberal and national movements, and its later phase coincided with the powers' peaceful partition of Africa and Asia: peace in Europe and conquest elsewhere went together.

## Peace Becomes a Movement

Some refused war on principle. In 1660 Quakers declared to Charles II: "All bloody principles and practices we do utterly deny, with all outward wars, and strife, and fightings with outward weapons, for any end, or under any pretence whatsoever". Immanuel Kant's *Perpetual Peace* (1795) set out conditions for ending war between states, later linked to theories that democracy, trade and institutions promote peace. Peace societies appeared in New York and London in 1815–16, and the first International Peace Congress met in London in 1843.

The Austrian novelist Bertha von Suttner, briefly Alfred Nobel's secretary, wrote *Lay Down Your Arms!* (1889). Nobel's will created a prize for work for "fraternity between nations", and in 1905 Suttner became the first woman to win it. The prize has often been contested: two committee members resigned over the 1973 award to Kissinger and Lê Đức Thọ. Gandhi was nominated several times, last in 1948, but never won; after his assassination that January the committee awarded no prize for 1948, reportedly because there was no suitable living candidate.

Governments, too, built machinery for peace. The Hague conference of 1899, proposed by Tsar Nicholas II, created the Permanent Court of Arbitration, and the 1907 conference extended its work. In 1907 more than forty states attended, many of them Latin American, and Brazil's Rui Barbosa opposed a court weighted towards the great powers in the name of the equality of states. The laws of war agreed at The Hague, and Henry Dunant's share of the first Nobel Peace Prize, are covered in the chapter on Military History.

## Paris, the League and the Outlawry of War

In the middle of the First World War, on 28 April 1915, more than 1,100 women from twelve countries met at The Hague in an International Congress of Women, though British attendance was cut when the government suspended the ferry. Its committee became, at Zurich in 1919, the Women's International League for Peace and Freedom (WILPF). Its first president, Jane Addams of Hull House in Chicago, became in 1931 the first American woman to win the Nobel Peace Prize.

On 8 January 1918 Woodrow Wilson set out his Fourteen Points, opening with "open covenants of peace, openly arrived at" and ending with an association of nations to guarantee the independence of "great and small states alike". Lenin's Decree on Peace of November 1917 had already demanded peace without annexations and an end to secret diplomacy. At the Paris Peace Conference, which opened in January 1919, the League of Nations Covenant became Part I of the Treaty of Versailles, but Japan's Racial Equality Proposal was blocked: Australia's Billy Hughes was its fiercest opponent, and Wilson, in the chair, ruled that it needed unanimity. Keynes condemned a "Carthaginian peace"; Margaret MacMillan's *Peacemakers* (2001) defends the peacemakers; Manela has written of a "Wilsonian moment" for colonised peoples. The chapters on The First World War (WW1) and The Interwar Period tell this story in detail.

In 1928 the Kellogg–Briand Pact bound its parties to "condemn recourse to war for the solution of international controversies and renounce it as an instrument of national policy". It did not stop the invasions of Manchuria in 1931 or Abyssinia in 1935, and it was often mocked as naive. Oona Hathaway and Scott Shapiro argue in *The Internationalists* (2017) that it nonetheless remade international law: it underpinned the charge of "crime against peace" at Nuremberg and Tokyo and helped make conquest illegal.

```checkpoint
q: What did the Egyptian–Hittite treaty of about 1259 BCE actually do?
a*: It bound Egypt and the Hittites to non-aggression, mutual defence and the return of political refugees, about fifteen years after the Battle of Kadesh.
a: It ended the Battle of Kadesh on the day the fighting stopped.
x: The treaty does not mention Kadesh, and the war went on for about fifteen years after the battle.
a: It created the first international court of arbitration.
x: The Permanent Court of Arbitration came from the Hague conference of 1899.
a: It survives only in the Egyptian version carved at Karnak.
x: It is the only ancient Near Eastern treaty surviving in versions from both parties, including an Akkadian text from Hattusa.
hint: Think of alliance as much as peace.
why: Historians such as Bryce read the treaty as an alliance, against Assyria and for Ḫattušili's legitimacy, rather than peace for its own sake.
---
q: What does Andreas Osiander argue about the Peace of Westphalia (1648)?
a: That it created the modern principle of state sovereignty.
x: That is the traditional view Osiander rejects.
a: That it ended the Napoleonic Wars.
x: Westphalia ended the Thirty Years' War; the Congress of Vienna met in 1814–15.
a*: That the treaties confirmed no one's sovereignty and said nothing about sovereignty as a principle.
a: That it established the League of Nations.
x: The League was founded in 1920.
hint: Think of the "Westphalian myth".
why: Osiander shows that the link between 1648 and modern sovereignty was largely constructed later.
```

## The United Nations and the Law of Peace

From 25 April to 26 June 1945, delegates from fifty Allied nations met in San Francisco to write the Charter of the United Nations. Its design of a Security Council and General Assembly echoed the League's structure, and its preamble set out its purpose.

```quote
We the peoples of the United Nations determined to save succeeding generations from the scourge of war, which twice in our lifetime has brought untold sorrow to mankind…
Charter of the United Nations · Preamble · 1945
```

Article 2(4) banned "the threat or use of force against the territorial integrity or political independence of any state", while Article 51 preserved self-defence. Lawyers built peace in other ways. The Universal Declaration of Human Rights, adopted on 10 December 1948 with no votes against, was drafted under the Commission on Human Rights, chaired by Eleanor Roosevelt, with key roles for René Cassin of France, P. C. Chang of China, Charles Malik of Lebanon, the UN Secretariat's John Humphrey of Canada and Hansa Mehta of India; Cassin won the Nobel Peace Prize in 1968. The day before, the UN had unanimously adopted the Genocide Convention, against the crime that the Polish Jewish lawyer Raphael Lemkin had named in 1944 (see the chapter on The Holocaust). One of the first petitions under it, in 1951, accused the United States over its treatment of Black Americans.

## Peacekeeping

The UN's first peacekeeping mission, in 1948, watched over the Arab–Israeli ceasefire. Its first armed force, UNEF, was created after the Suez Crisis in 1956 on the idea of Lester Pearson and the Secretary-General Dag Hammarskjöld. UN peacekeepers won the Nobel Peace Prize in 1988, and by 2026 the largest contributors of troops were Nepal, Rwanda, Bangladesh, India and Pakistan.

The record includes terrible failures. The failures in Rwanda in 1994 and at Srebrenica, described in the chapter on Modern Conflicts since 1991, led to a major review, the Brahimi Report of 2000. Cholera introduced from a base of Nepalese peacekeepers in Haiti in 2010 killed about 10,000 people over a decade, and allegations of sexual exploitation and abuse run at roughly 50 to 100 a year, with substantial under-reporting. Yet Virginia Page Fortna's *Does Peacekeeping Work?* (2008) finds that peacekeeping substantially extends peace after civil wars, and other studies link it to fewer civilian deaths.

## Scientists and the Bomb

The atomic bomb turned scientists into campaigners. The Russell–Einstein Manifesto, issued in London on 9 July 1955, called for a conference of scientists and urged readers to "remember your humanity, and forget the rest"; Einstein had signed it shortly before his death. It led to the Pugwash Conferences, first hosted by Cyrus Eaton in Nova Scotia in 1957; Joseph Rotblat and Pugwash shared the Nobel Peace Prize in 1995. In 1958 the chemist Linus Pauling and his wife Ava Helen presented Hammarskjöld with a petition signed by 11,021 scientists from fifty countries. He was awarded the 1962 Nobel Peace Prize on 10 October 1963, the day the Partial Test Ban Treaty came into force; *Life* magazine called it "A Weird Insult from Norway".

Mass movements followed. Britain's Campaign for Nuclear Disarmament (CND), with Bertrand Russell as president, organised the Aldermaston Marches from 1958, and Gerald Holtom's symbol, built from the semaphore letters N and D, became the international peace symbol; the Greenham Common Women's Peace Camp shaped its second wave. In the United States the Nuclear Freeze campaign brought about a million people to a rally in New York on 12 June 1982, and in 1983 the House of Representatives passed a Freeze resolution, non-binding and amended. Reagan opposed the Freeze, but Wittner and Evangelista argue that the antinuclear movement shaped Gorbachev's "new thinking" (see the chapter on Global Cold War and the Arms Race).

## Diplomacy Across the Divide

In West Germany, Egon Bahr's formula of "change through rapprochement" became Willy Brandt's Ostpolitik: treaties with Moscow and Warsaw in 1970, the second accepting the Oder–Neisse line, and a Basic Treaty with East Germany in 1972. In December 1970 Brandt knelt at the memorial to the Warsaw Ghetto Uprising; he won the Nobel Peace Prize in 1971.

Later settlements depended on mediators. Egypt's Sadat and Israel's Begin spent thirteen days at Camp David, 5–17 September 1978, leading to the Egypt–Israel treaty of 1979, though the framework for the Palestinians was written without Palestinians (see the chapter on The Making of the Modern Middle East). Richard Holbrooke brokered the Dayton Agreement on Bosnia in 1995. The Good Friday Agreement of 10 April 1998, negotiated in talks chaired by George Mitchell with the Northern Ireland Women's Coalition at the table, was approved by referendums in both parts of Ireland, as the chapter on Partition and its Consequences: Ireland, India, Palestine describes. Colombia's talks with the FARC included a gender sub-commission; voters narrowly rejected the agreement in October 2016, and Congress ratified a revised deal the following month.

## Nonviolence and Liberation

Gandhi's *satyagraha*, "holding firmly to truth", was a method of struggle, used in South Africa and in India, most famously in the Salt March of 1930. The devout Muslim Pashtun Khan Abdul Ghaffar Khan founded the nonviolent Khudai Khidmatgar, "Servants of God", on its principles in 1929. Martin Luther King Jr., who visited India in 1959, drew on it and won the Nobel Peace Prize in 1964. The 14th Dalai Lama, in exile in India since 1959, has advocated a "Middle Way Approach" and won the prize in 1989.

Not all peacemakers renounced force. Nelson Mandela was initially committed to nonviolence but co-founded the armed Umkhonto we Sizwe in 1961, served 27 years in prison, and shared the 1993 Nobel Peace Prize with F. W. de Klerk (see the chapter on Apartheid and Its End). Was nonviolence the more effective path? Erica Chenoweth and Maria Stephan studied 323 campaigns between 1900 and 2006 and found that major nonviolent campaigns succeeded 53 per cent of the time, against 26 per cent for violent ones. In Liberia, Leymah Gbowee led Women of Liberia Mass Action for Peace, which helped end the Second Liberian Civil War in 2003; she shared the 2011 Nobel Peace Prize with Ellen Johnson Sirleaf and Tawakkul Karman.

## Truth and Reconciliation

After dictatorships and civil wars, many societies have turned to truth commissions. Uganda's commission of 1974 was perhaps the first. Argentina's CONADEP, created in December 1983, produced the report *Nunca Más* and opened the way to the Trial of the Juntas. Chile's commission of 1990 was the first to put "truth and reconciliation" in its name; others followed from Guatemala and El Salvador to Morocco, Sierra Leone and Mauritius, and Canada examined its residential schools.

South Africa's Truth and Reconciliation Commission held hearings from 1996 under Archbishop Desmond Tutu, who framed its work in terms of *ubuntu*. It offered amnesty for full disclosure; of more than 7,100 applications, 849 were granted. Survivors voiced criticisms, and complaints about reparations feed a continuing debate between amnesty for truth, as in South Africa, and prosecution, as in Argentina.

## Women at the Peace Table

On 31 October 2000 the UN Security Council unanimously adopted Resolution 1325 on women, peace and security, initiated by Namibia's minister of women's affairs, Netumbo Nandi-Ndaitwah, while Namibia chaired the Council. Practice has lagged. According to the Council on Foreign Relations, between 1992 and 2019 women were on average 13 per cent of negotiators, 6 per cent of mediators and 6 per cent of signatories in major peace processes. UN figures for 2023 put women at 9.6 per cent of negotiators.

## Negative and Positive Peace

Is peace only the absence of war? The Norwegian sociologist Johan Galtung, who founded the Peace Research Institute Oslo in 1959 and the *Journal of Peace Research* in 1964, became the principal founder of peace studies by answering no. He distinguished *negative peace*, the absence of direct violence, from *positive peace*, the absence of what he called "structural violence" and the presence of justice; later he added "cultural violence", the ideas that make violence seem legitimate. The distinction was older than Galtung. Jane Addams had contrasted "newer ideals of peace" with mere "negative peace" in lectures from 1899, and in his "Letter from Birmingham Jail" (1963) King wrote of a "negative peace which is the absence of tension" and a "positive peace which is the presence of justice". Critics reply that calling every injustice "violence" stretches the word too far. The debate decides what peacemakers aim at: a ceasefire, or a just society.

## Is the World Becoming More Peaceful?

In 1986 Gaddis called the decades after 1945 a "Long Peace", and Pinker's *The Better Angels of Our Nature* (2011) set it within a long decline of violence. Critics answered with statistics. Taleb and Cirillo found no decline in the deadliness of war; Clauset suggested that the post-1945 peace could plausibly be chance; and Bear Braumoeller's *Only the Dead* (2019) found no decline in how often wars begin since 1815, only a decline in the use of force between states since the Cold War. And the "Long Peace" was largely a Northern experience, as the chapters on Military History and Global Cold War and the Arms Race describe.

Recent data have sharpened the argument. According to summaries of the Uppsala Conflict Data Program's June 2026 release, there were 65 state-based armed conflicts in 2025, the most since its records began in 1946; conflicts between states had risen from two in 2023 to eight; and thirteen conflicts reached the level of war, with at least 1,000 battle deaths, the most since 1992. Séverine Autesserre's *The Frontlines of Peace* (2021) argues that lasting peace is often built locally, from below, rather than by summits alone. The long history of peacemaking suggests both are needed: treaties that end wars, and the slower work of justice that keeps them from returning.

```checkpoint
q: Who first contrasted "negative peace" with "positive peace"?
a: Johan Galtung invented both terms in 1969.
x: Galtung developed and popularised the pair, but Addams and King had used the idea before him.
a*: The idea predates Galtung: Jane Addams contrasted "negative peace" with newer ideals in lectures from 1899 (published in 1907), and King used both terms in 1963.
a: Immanuel Kant in Perpetual Peace (1795).
x: Kant set out conditions for peace between states, not this distinction.
a: The UN Charter of 1945.
x: The Charter bans the use of force but does not define peace this way.
hint: Think of Hull House and Birmingham Jail.
why: Galtung built the distinction into peace studies, but activists had already argued that peace requires justice.
---
q: What did Chenoweth and Stephan find in Why Civil Resistance Works (2011)?
a: That violent campaigns succeed more often than nonviolent ones.
x: They found the reverse: 53 per cent against 26 per cent.
a: That nonviolence works only in democracies.
x: Their data covered 323 campaigns of many kinds between 1900 and 2006.
a: That no campaign has ever succeeded without foreign support.
x: Their study makes no such claim.
a*: That major nonviolent campaigns succeeded 53 per cent of the time, against 26 per cent for violent ones.
hint: Compare two percentages.
why: Their data challenged the assumption that armed struggle is the more effective road to change.
```

## Further exploration

- **David Cortright, *Peace: A History of Movements and Ideas* (2008).** The standard single-volume history of peace movements and pacifist thought.
- **Margaret MacMillan, *Peacemakers: The Paris Conference of 1919 and Its Attempt to End War* (2001).** The classic narrative of 1919.
- **Mark Mazower, *Governing the World: The History of an Idea* (2012).** Internationalism from the Concert of Europe to the UN.
- **Oona A. Hathaway and Scott J. Shapiro, *The Internationalists: How a Radical Plan to Outlaw War Remade the World* (2017).** How the Kellogg–Briand Pact transformed international law.
- **Erica Chenoweth and Maria J. Stephan, *Why Civil Resistance Works: The Strategic Logic of Nonviolent Conflict* (2011).** Data on nonviolent and violent campaigns since 1900.
- **Bear F. Braumoeller, *Only the Dead: The Persistence of War in the Modern Age* (2019).** A statistical critique of the decline-of-war thesis.
- **Leymah Gbowee with Carol Mithers, *Mighty Be Our Powers: How Sisterhood, Prayer, and Sex Changed a Nation at War* (2011).** A Liberian peace activist's memoir.$mn_peace_master$,
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
  select $mn_peace_quiz$[
    {"type": "mcq", "prompt": "Which statement about the Egyptian–Hittite treaty of about 1259 BCE is correct?", "options": ["It was signed on the battlefield at Kadesh", "It does not mention the Battle of Kadesh and survives in versions from both Egypt and the Hittites", "It survives only in a Latin translation", "It created a permanent court of arbitration"], "answerIndex": 1, "explanation": "The treaty came about fifteen years after Kadesh (c. 1274 BCE), which it does not mention; it survives in Egyptian hieroglyphs and in Akkadian on tablets from Hattusa.", "id": "q1"},
    {"type": "mcq", "prompt": "Who devised the modern term 'tribute system' for China's relations with its neighbours?", "options": ["John King Fairbank and Teng Ssu-yu, in the early 1940s", "Mozi, in the Warring States era", "The Ming emperors", "The Congress of Vienna"], "answerIndex": 0, "explanation": "The term is a modern Western construct; critics say it turned a flexible practice into an overly formal ritual system.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened to the Nobel Peace Prize for 1948?", "options": ["It was awarded to Gandhi after his death", "It went to the Quakers", "It was shared by Gandhi and Ghaffar Khan", "No prize was awarded for that year"], "answerIndex": 3, "explanation": "Gandhi was nominated several times but never won; after his assassination in January 1948 the committee awarded no prize for 1948, reportedly because there was no suitable living candidate.", "id": "q3"},
    {"type": "mcq", "prompt": "What harm did UN peacekeepers cause in Haiti from 2010?", "options": ["They abandoned the capital to rebels", "They imposed a blockade on food imports", "Cholera introduced from a peacekeepers' base killed about 10,000 people over a decade", "They carried out a coup"], "answerIndex": 2, "explanation": "Cholera spread from a base of Nepalese peacekeepers; abuse allegations have also run at roughly 50 to 100 a year, with substantial under-reporting.", "id": "q4"},
    {"type": "open", "prompt": "Is peace only the absence of war? Discuss with reference to the idea of negative and positive peace.", "rubric": "A strong answer explains Galtung's distinction between negative peace (absence of direct violence) and positive peace (absence of structural violence, presence of justice), notes that Addams (from 1899) and King (1963) used the terms before him, mentions 'cultural violence' and the criticism that 'structural violence' stretches the word too far, and applies the idea to examples such as imperial 'peaces' (Calgacus, Goffart), truth commissions, Resolution 1325 or the civil rights movement.", "id": "q5"},
    {"type": "open", "prompt": "Has the world become more peaceful since 1945? Assess the debate.", "rubric": "A strong answer sets out Gaddis's 'Long Peace' (1986) and Pinker's decline-of-violence thesis (2011); presents critics such as Taleb and Cirillo (no decline in war's lethality), Clauset (the post-1945 peace could plausibly be chance) and Braumoeller (no decline in war initiation since 1815); notes that the 'Long Peace' was largely a Northern experience; and uses recent data with care, such as UCDP's report of 65 state-based conflicts in 2025, the most since 1946, attributed and dated.", "id": "q6"}
  ]$mn_peace_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/thematic-history/history-of-peace-and-peacemaking', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
