-- Jerusalem, a History: From Antiquity to the Present — canonical master article, co-written and human-reviewed.
-- history/regional-histories/middle-east/jerusalem-a-history-from-antiquity-to-the-present @ research/advanced/read.
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
    'history/regional-histories/middle-east/jerusalem-a-history-from-antiquity-to-the-present',
    'research',
    'advanced',
    'read',
    $mn_jerusalem_master$> **One city, three faiths, four thousand years.** Jerusalem began as a small hill town beside a spring and became a holy city for Jews, Christians and Muslims. This chapter follows it from its Bronze Age origins and the city the Bible says David took, through two Temples and their destruction, Roman Aelia Capitolina, Byzantine Christian Jerusalem, the early Islamic city, the crusaders and Saladin, and the Mamluk and Ottoman centuries, to the British Mandate, the division of 1948, the contested unification of 1967 and the present. It sets out how each faith and nation has understood the city, and where historians disagree.

## A Note on Names

In Jerusalem even the names are contested, so this chapter pairs them. The great raised platform of the Old City is the **Temple Mount** in Jewish and much other usage and **al-Haram al-Sharif** ("the Noble Sanctuary") in Arabic; Muslims also call the whole compound al-Masjid al-Aqsa. The prayer hall on its south side is the **al-Aqsa (Qibli) Mosque**. The retaining wall where Jews pray is the **Western Wall** (Hebrew *Kotel*), which Muslims call the Buraq Wall. The Jerusalem Islamic Waqf calls "Temple Mount" a "newly-created Judaization term"; a 2016 UNESCO resolution using only Muslim names provoked Israeli protest.

## A Hill Town by a Spring

Archaeological evidence dates the first settlement near the **Gihon Spring** to about 3000–2800 BCE. The city's first known mention, as *Rusalimum*, is in Egyptian "execration texts" of about 2000 BCE; the root S-L-M is thought to refer to "peace" or to Shalim, a Canaanite god of dusk. In the Amarna letters of the 1330s BCE its ruler **Abdi-Heba** wrote to the pharaoh as a vassal, complaining of attacks by rival Canaanite rulers and bands of 'Apiru and asking for archers. Estimates suggest he ruled perhaps 1,500 people from a small highland stronghold.

Only the Hebrew Bible calls the pre-Israelite inhabitants **Jebusites**; Niels Peter Lemche notes that no source outside the Bible mentions "Jebus", and some scholars doubt it was Jerusalem at all. The Book of Samuel says **David** took the city, by a "water shaft" in the Hebrew text, though the Greek Septuagint reads "with their daggers" and some archaeologists doubt that a secret entry through the spring was possible.

## David, Solomon and the Archaeologists

Biblical tradition dates David's capture of the city to about 1000 BCE. How much of the story of David and Solomon archaeology can confirm is one of the field's sharpest debates, introduced in the chapter on Ancient Israel and the Levant. In the 1990s "minimalists" such as Lemche, Thomas L. Thompson and Philip R. Davies treated the Bible as a late and unreliable source for early Israel; "maximalists" such as William Dever and Kenneth Kitchen defended more of it, and most scholars stood between them. Thompson argues that Jerusalem could act as a state capital only from the mid-seventh century BCE; Omer Sergi argues that recent finds show it was already significant in Iron Age IIA, in the tenth and ninth centuries BCE.

The argument centres on two structures in the City of David. In 2005 **Eilat Mazar** announced the "Large Stone Structure", which she interpreted as possibly David's palace and linked with the nearby **Stepped Stone Structure**; her dig was sponsored by the Shalem Center. In 2007 **Israel Finkelstein** and colleagues replied that the remains were not one building and that much was Hellenistic. Amihai Mazar suggested the Jebusite "fortress of Zion", while Avraham Faust and Dever supported a tenth-century date. Finkelstein takes a middle position: he accepts a historical David and Solomon in the tenth century as founders of a dynasty, but sees their great united kingdom as an ideological picture drawn by writers of the late seventh century BCE.

## Two Temples

Jerusalem was the capital of Judah for some four hundred years. It survived the Assyrian king Sennacherib's siege of 701 BCE; his annals say he shut King Hezekiah up "like a caged bird". Nebuchadnezzar II of Babylon took King Jehoiachin and much of the elite into exile in 597 BCE, and in a second siege, ending in **587 or 586 BCE** (scholars disagree on the year), burned the Temple and the walls. Jews still mourn the destruction of both Temples on **Tisha B'Av**.

After Cyrus II of Persia conquered Babylon in 539 BCE and let the exiles return, a **Second Temple** was built, traditionally dated to about 516 BCE. In 167 BCE Antiochus IV set up an altar to Zeus in it; Judas Maccabeus restored its worship in 164 BCE, the event remembered at Hanukkah, and Jerusalem became the Hasmonean capital. **Herod the Great**, who took the city in 37 BCE, rebuilt the Temple from about 20/19 BCE and doubled its platform with four massive retaining walls, making it the largest religious enclosure of the ancient world. Modern estimates put the city's population at about 60,000 to 100,000, a size not reached again until the twentieth century. Here, according to the New Testament, Jesus was crucified and rose again.

## Rome: Destruction and Aelia Capitolina

The Jewish revolt of 66 CE ended, as the chapter on Rome and the Ancient Roman World notes, with Titus's siege of Jerusalem in 70 CE. In the month of Av the Romans destroyed the Temple and paraded its spoils, including the menorah, through Rome; the scene is carved on the Arch of Titus. The ancient figures are huge and contested: Josephus gives 1.1 million dead in the siege, a total the historian Menahem Stern rejected as exaggerated. Parts of the platform's retaining walls survived, among them the Western Wall.

On a visit in 129/130 CE Hadrian founded a Roman colony on the site, **Aelia Capitolina**. Coins struck before the next revolt have persuaded most historians that the foundation came first and helped provoke the **Bar Kokhba revolt** (132–135/136), as Cassius Dio said. Afterwards Jews were banned from the city, except by tradition on Tisha B'Av, and the province was renamed Syria Palaestina, in the view of many scholars as a punishment. "Aelia" survived in the early Arabic name for the city, *Īliyā'*.

## A Christian Holy City

Under Constantine, Jerusalem became a Christian holy city. In about 326 Bishop Macarius had a pagan temple removed and identified a rock-cut tomb as Jesus's, and the **Church of the Holy Sepulchre** was consecrated in 335. The Temple Mount was left undeveloped. In 614 the Sasanian Persians, helped by Jews in revolt against Byzantium, took the city after a siege of about three weeks and carried off the True Cross. Christian death tolls vary widely: the Armenian chronicler Sebeos gives 17,000, manuscripts of the monk Antiochus Strategos up to 66,509, and the archaeologist Ronny Reich estimated about 60,000. There is archaeological evidence of mass killing, though not of the widespread destruction of churches the chronicles describe. In 630 the emperor Heraclius brought the Cross back.

```checkpoint
q: Why do most historians think Hadrian founded Aelia Capitolina before the Bar Kokhba revolt rather than as a punishment after it?
a*: Because coins of the colony were struck before the revolt, which fits Cassius Dio's view that the foundation helped provoke it.
a: Because Josephus describes the foundation in his history of the war of 66–73.
x: Josephus wrote about the earlier revolt; the evidence here is coins and Cassius Dio.
a: Because the Madaba Map shows Aelia Capitolina already built before the revolt.
x: The Madaba Map is a sixth-century mosaic, made centuries later.
a: Because Jews were allowed to live in the city until the 630s.
x: Jews were banned from the city after the revolt; Umar allowed them back after 637/638.
hint: Think of what was minted, and when.
why: The coins persuaded most historians that the new Roman colony was a cause of the revolt, not only its consequence.
---
q: Why are the death tolls given for the Persian conquest of 614 uncertain?
a: Because no source of any kind mentions the conquest.
x: Several chroniclers, such as Sebeos and Antiochus Strategos, describe it.
a: Because the city was taken without resistance.
x: The city fell after a siege of about three weeks, and there is evidence of mass killing.
a*: Because the chronicles disagree widely, from Sebeos's 17,000 to up to 66,509 in manuscripts of Antiochus Strategos.
a: Because archaeologists have found no evidence of any deaths.
x: Archaeology has found evidence of mass killing, though not of widespread church destruction.
hint: Compare the numbers in the different chronicles.
why: Like the figures for 70 and 1099, the 614 totals come from chroniclers whose numbers conflict, so historians give them as a range with their sources.
```

## Al-Quds: The Early Islamic City

After the Byzantine defeat at Yarmuk in 636, Muslim forces besieged Jerusalem, and Patriarch Sophronius agreed to surrender only to the caliph. **Umar** came in person in 637 or 638, as the chapter on The Rise of Islam and the Caliphates relates; the siege appears to have been largely bloodless. Umar's "Assurance" guaranteed Christians' lives, property and churches in return for the *jizya* tax, and he allowed Jews to live in the city again, ending the ban that dated from Hadrian.

The Qur'an (17:1) speaks of Muhammad's Night Journey to "the farthest place of prayer", *al-masjid al-aqsa*. Jerusalem is not named in the Qur'an, but hadith and tradition identify that place with it, and the first Muslims prayed towards Jerusalem before the direction of prayer was changed to Mecca. Some scholars argue that the identification served an Umayyad political agenda; Muslim tradition traces it to early hadith and to Ibn Ishaq. The Arabic name **al-Quds** means "the Holy".

{{image: Dome of the Rock | The Dome of the Rock on the Temple Mount / Haram al-Sharif. Its dedicatory inscription is dated AH 72 (691/692 CE), making it the oldest surviving work of Islamic architecture.}}

The Umayyad caliph **Abd al-Malik** built the **Dome of the Rock** over the Foundation Stone, with an inscription dated 691/692. It is a shrine, not a mosque, and carries the earliest inscriptions proclaiming Islam and Muhammad. Why was it built? The inscriptions repeat that God "has no companion" and address Jesus as a prophet and servant of God, which S. D. Goitein read as a polemic against Christianity: a victory monument in a Christian city. An older theory, that Abd al-Malik meant to divert pilgrimage from Mecca, then held by his rival Ibn al-Zubayr, is dismissed by most modern historians as anti-Umayyad propaganda, though some think it cannot be ruled out. The al-Aqsa Mosque was built by Abd al-Malik or his son al-Walid I, or both. Rule was not always tolerant: in 1009 the Fatimid caliph al-Hakim ordered the Holy Sepulchre destroyed, and it was rebuilt by 1048.

## Crusaders and Saladin

The crusaders broke into Jerusalem on 15 July 1099, as the chapter on The Crusades describes. What followed was a massacre, though its scale is disputed. The eyewitness Raymond of Aguilers wrote that men "rode in blood up to their knees and bridle reins"; later Arab sources claimed 70,000 or even 100,000 dead. Modern historians, noting a population of perhaps 20,000–30,000, estimate that 3,000–10,000 were killed. Several accounts say the city's Jews were burned in their synagogue, though a Cairo Geniza letter written about two weeks later mentions the synagogue's burning but not any people inside. The new kingdom banned Jews from the city again, turned the Dome of the Rock into a church and made al-Aqsa a palace and then the Templars' headquarters.

After his victory at Hattin, **Saladin** took the city by negotiated surrender on 2 October 1187. Franks had to pay a ransom of 10 dinars a man; Balian of Ibelin paid 30,000 dinars to free 7,000 of the poor, but thousands who could not pay were enslaved. Eastern Christians could stay and Jews were allowed to return; compared with 1099 the takeover was relatively peaceful. Two Muslim families still hold the key and open the door of the Holy Sepulchre, by documents dating from Saladin's time. In 1193 his son al-Afdal endowed the **Maghribi (Moroccan) Quarter** beside the Western Wall as a religious trust (*waqf*).

## Mamluk and Ottoman Centuries

The Mamluks ruled Jerusalem from 1260 to 1516, and about ninety of their madrasas, hospices, fountains and markets survive around the Haram. The Ottomans took the city in 1516, as the chapter on The Ottomans describes, and Suleiman the Magnificent built the **walls**, about 4 km long and built 1537–41, which still enclose the Old City. Tax registers record about 16,068 inhabitants in 1553–54, mostly Muslims, with Jewish and Christian minorities.

Rival churches quarrelled over the holy places, and the Ottomans froze their rights in the **Status Quo**, rooted in a decree of 1757 and fixed by decrees of 1852–53, so that nothing could change without consensus. The Franco-Russian quarrel over these places was one cause of the Crimean War. In the nineteenth century European consuls arrived, starting with Britain's in 1838 or 1839, and the city grew. Estimates conflict on when Jews became a majority, sometime between 1882 and 1922. The Old City's four "quarters" (Muslim, Christian, Jewish, Armenian) were a loose pattern later formalised under British rule. Vincent Lemire and Menachem Klein stress how much daily life Arabs and Jews shared, and Rashid Khalidi shows Jerusalem notables of the Khalidi family combining religious, Ottoman, local and family loyalties: early roots of a Palestinian identity.

## The British Mandate

The Ottomans surrendered Jerusalem on 9 December 1917, and on 11 December General Edmund Allenby entered on foot and promised to protect the holy places.

```quote
every sacred building, monument, holy spot, shrine, traditional site, endowment, pious bequest, or customary place of prayer of whatsoever form of the three religions will be maintained and protected according to the existing customs and beliefs of those to whose faith they are sacred
Edmund Allenby · Proclamation on entering Jerusalem · 11 December 1917
```

The holy places soon became flashpoints. In August 1929 a dispute over access to the Western Wall, remembered by Palestinians as the al-Buraq uprising, set off violence across Palestine, including Hebron and Safed, in which 133 Jews were killed by Arabs and 116 Arabs were killed, mostly by British police; the Shaw Commission blamed Arab fears of Zionism's consequences. A 1930 international commission confirmed Muslim ownership of the Wall and Jewish rights to pray there. British figures show a growing city with a Jewish majority: the 1922 census counted 62,578 people and an official estimate gave about 157,000 in 1944, though the figures depend on the boundaries used. The chapter on Partition and its Consequences describes the UN plan of 1947. For Jerusalem, Resolution 181 proposed that it "be established as a corpus separatum under a special international regime". The Jewish leadership accepted the plan; the Arab leadership rejected it.

## 1948: A Divided City

From early 1948 Arab forces blockaded the road to Tel Aviv, and Jewish West Jerusalem lived on rations. In January the Haganah bombed the Semiramis Hotel in Katamon, killing 24–26 civilians; in April, days after Deir Yassin, Arab forces ambushed a convoy to the Hadassah hospital on Mount Scopus, killing 79 people. Arab neighbourhoods of West Jerusalem such as Katamon, Talbiya and Lifta were emptied; estimates of the Palestinians displaced range from about 28,000–30,000 from the western neighbourhoods to more than 70,000 when nearby villages are included. In the Old City the Jewish Quarter surrendered to the Arab Legion on 28 May and its roughly 1,500 residents were expelled.

The 1949 armistice left Israel holding West Jerusalem and Jordan the Old City and East Jerusalem. Israel declared Jerusalem its capital and Jordan annexed East Jerusalem in 1950; few states recognised either. For nineteen years Jews were barred from the Old City and the Western Wall, and the Israeli political scientist Gerald Steinberg counts 57 synagogues and study centres ransacked and 12 destroyed. Each people carries its own memory of 1948 here: for Palestinians, the lost western neighbourhoods, part of the Nakba; for Israelis, the besieged city and the lost Jewish Quarter.

## 1967: Unification or Occupation?

On 7 June 1967 Israeli forces took East Jerusalem and the Old City, as the chapter on The Making of the Modern Middle East relates. Within days more than 200,000 people visited the Western Wall, and Israel created Jerusalem Day to mark what many Israeli Jews celebrated as reunification or liberation. On the night of 10–11 June Israel demolished the Maghribi Quarter, about 135 homes housing some 650 people, to make the Western Wall plaza. On 27 June it extended the city's boundary over about 70 km² of West Bank land, including 28 villages. Palestinian residents were offered permanent residency; most declined citizenship.

On 17 June Moshe Dayan told the Muslim authorities, who rejected Israeli rule, that the Waqf would keep running the Temple Mount / Haram al-Sharif and that Jews could visit but not pray there, with the Western Wall as the Jewish prayer site. Israel's Chief Rabbinate ruled that Jews should not enter the Mount at all. In 1980 the Knesset declared "Jerusalem, complete and united" Israel's capital; UN Security Council Resolution 478 called the law "null and void", 14 votes to none with the United States abstaining.

Here the perspectives diverge sharply. In a Jerusalem Day speech on 17 May 2015 Benjamin Netanyahu said, in one English rendering, that Jerusalem "has forever been the capital of only the Jewish people and no other nation." For the UN, the EU and most states, East Jerusalem is occupied territory, and Palestinians claim it as their capital, as the PLO's declaration of independence did in 1988. The Palestinian philosopher Sari Nusseibeh, as quoted in 2010, said that the fight over Jerusalem "is existential, not because it is a magical city but because it was, and is, the center of our culture, national identity and memory."

```checkpoint
q: What was the arrangement for the Temple Mount / Haram al-Sharif agreed after the 1967 war?
a: Israel took over religious administration and opened the site to prayer by all faiths.
x: The Waqf kept religious administration, and Jews could visit but not pray on the Mount.
a*: The Waqf kept religious administration, Jews could visit but not pray, and the Western Wall became the Jewish prayer site.
a: Jordan was given sovereignty over the whole Old City.
x: Israel held the Old City after 1967; Jordan's later recognised role was at the Muslim holy sites, not sovereignty.
a: The site was placed under UN administration as a corpus separatum.
x: The corpus separatum was the UN's 1947 proposal, which was never put into effect.
hint: Think of the arrangement Moshe Dayan set out on 17 June 1967.
why: This unwritten "status quo" still governs the site, and disputes over whether it is eroding have repeatedly fed violence.
---
q: How did the UN Security Council respond to Israel's 1980 law declaring Jerusalem its capital?
a: It recognised Jerusalem as Israel's capital.
x: No Security Council resolution has recognised Jerusalem as Israel's capital.
a: It took no action because the United States used its veto.
x: The United States abstained; it did not use its veto.
a: It divided the city between Israel and Jordan.
x: The Council did not divide the city; Jordan held East Jerusalem only between 1948 and 1967.
a*: Resolution 478 declared the law "null and void" and called on states to withdraw their embassies.
hint: Think of the vote of 14 to none.
why: Resolution 478 reflects the view of most states that Israel's annexation of East Jerusalem is not recognised.
```

## The Hardest Question

The Oslo Accords of 1993 left Jerusalem to final-status talks, and at Camp David in July 2000 Jerusalem and the Temple Mount were among the main obstacles to agreement. Ehud Barak was the first Israeli prime minister to consider dividing the city; Ehud Olmert later supported separating Arab neighbourhoods and placing the holy basin under an international trust. Israel's 1994 treaty with Jordan recognised Jordan's special role at the Muslim holy sites.

Sovereignty remains unsettled in international law. The UN has never revoked the corpus separatum principle, and the EU envisages Jerusalem as the capital of two states. In December 2017 President Donald Trump recognised Jerusalem as Israel's capital, and the US embassy opened there in May 2018; the UN General Assembly condemned the decision by 128 votes to 9. Since then a handful of states have followed.

The holy places remain the most volatile ground. In 1990 Israeli Border Police killed between 17 and about 21 Palestinians (sources differ) during protests over a plan to lay a cornerstone for a "Third Temple". Ariel Sharon's visit to the compound on 28 September 2000 was followed by the Second, or al-Aqsa, Intifada. In May 2021 protests over threatened evictions in Sheikh Jarrah (a property dispute to Israel's government, expulsion to Palestinians) and police entry into al-Aqsa preceded an eleven-day Gaza war. Hamas named its attack of 7 October 2023 "Operation Al-Aqsa Flood"; the chapter on Modern Conflicts since 1991 covers that war. The minister Itamar Ben-Gvir said he prayed on the Mount on Tisha B'Av 2024 and, the Times of Israel reported, openly led prayers there on Tisha B'Av 2025; by Tisha B'Av 2026 police were reported to tolerate Jewish prayer on its eastern side. In 2026 Jordan's foreign ministry called such visits "a flagrant violation of the historical and legal status quo"; in 2024 and 2025 Netanyahu's office had said that Israel's policy on the Mount had not changed.

Beneath lies demography. In the expanded city of 1967 Jews were about 74 per cent of residents. Israel's Central Bureau of Statistics counted 951,100 people in 2020, 59.9 per cent Jewish and 37.2 per cent Muslim. The Jerusalem Institute for Policy Research reported about 1.063 million at the end of 2025, with Jews and others at 56.6 per cent, Arabs at 38.4 per cent and foreign residents about 5 per cent. According to Peace Now, Palestinians, a majority in East Jerusalem, received about 30 per cent of the building permits issued there between 1991 and 2018.

The histories are as contested as the streets. Israeli historiography stresses the ancient Jewish connection and its continuity; Palestinian historians such as Nur Masalha stress the city's many layers and its long Islamic and Arab centuries; each accuses the other of politicising the past. Writers such as Karen Armstrong, Lemire and Klein show instead a city each faith made holy in its own way, whose peoples once lived more closely together than nationalism later allowed. That is why Jerusalem remains the hardest question of the Israeli–Palestinian conflict: faith, memory and national identity are bound up in the same small space of stone.

## Further exploration

- **Simon Sebag Montefiore, *Jerusalem: The Biography* (2011).** A vivid narrative from King David to the present, told through dynasties and personalities; updated in 2024.
- **Karen Armstrong, *Jerusalem: One City, Three Faiths* (1996).** How Jews, Christians and Muslims each made the city holy; widely praised for its sympathy to all three faiths, though some reviewers found it uneven and specialists question its documentation.
- **Oleg Grabar, *The Shape of the Holy: Early Islamic Jerusalem* (1996).** The leading art historian of the Dome of the Rock on the city from the 630s to 1099.
- **Vincent Lemire, *Jerusalem 1900: The Holy City in the Age of Possibilities* (2017).** The late Ottoman city as a shared, open space before 1914 (French original 2013).
- **Rashid Khalidi, *Palestinian Identity: The Construction of Modern National Consciousness* (1997).** Includes a chapter on the overlapping loyalties of Ottoman Jerusalem's notables.
- **Menachem Klein, *Lives in Common: Arabs and Jews in Jerusalem, Jaffa and Hebron* (2014).** An Israeli political scientist on shared everyday life before and after 1948.
- **Nur Masalha, *Palestine: A Four Thousand Year History* (2018).** A Palestinian historian's case for a long, many-layered Palestinian past.$mn_jerusalem_master$,
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
  select $mn_jerusalem_quiz$[
    {"type": "mcq", "prompt": "When did Babylon destroy Jerusalem and its First Temple?", "options": ["701 BCE", "587 or 586 BCE, since scholars disagree on the year", "516 BCE", "164 BCE"], "answerIndex": 1, "explanation": "Only the Hebrew Bible records the final siege, and scholars disagree whether the city fell in 587 or 586 BCE. In 701 BCE Jerusalem survived Sennacherib's siege; about 516 BCE is the traditional date of the Second Temple; 164 BCE is the Maccabean restoration.", "id": "q1"},
    {"type": "mcq", "prompt": "What do most modern historians make of the theory that Abd al-Malik built the Dome of the Rock to divert pilgrimage from Mecca?", "options": ["Most dismiss it as anti-Umayyad propaganda, though some think it cannot be ruled out", "It is proved by the building's inscriptions", "It is accepted by all historians", "It was invented by the crusaders"], "answerIndex": 0, "explanation": "Mecca was then held by the rival caliph Ibn al-Zubayr, but most historians reject the theory. S. D. Goitein read the inscriptions, which insist God has no companion and call Jesus a prophet and servant of God, as a polemic against Christianity.", "id": "q2"},
    {"type": "mcq", "prompt": "What do modern historians estimate as the number killed when the crusaders took Jerusalem in July 1099?", "options": ["70,000–100,000", "About 600", "More than 1 million", "3,000–10,000"], "answerIndex": 3, "explanation": "Later Arab sources claimed 70,000 or even 100,000 dead, figures historians consider unrealistic for a city of perhaps 20,000–30,000 people; modern estimates are 3,000–10,000.", "id": "q3"},
    {"type": "mcq", "prompt": "What did UN General Assembly Resolution 181 (1947) propose for Jerusalem?", "options": ["That it become the capital of a Jewish state", "That it be annexed by Transjordan", "That it be a corpus separatum under a special international regime administered by the United Nations", "That it be divided along the 1949 armistice line"], "answerIndex": 2, "explanation": "The plan was accepted by the Jewish leadership and rejected by the Arab leadership; the 1948 war instead left the city divided between Israel and Jordan, and the UN has never revoked the corpus separatum principle.", "id": "q4"},
    {"type": "open", "prompt": "How far can archaeology settle whether Jerusalem was the capital of a powerful kingdom under David and Solomon?", "rubric": "A strong answer explains the biblical tradition (David's capture c. 1000 BCE) and the minimalist–maximalist debate (Lemche, Thompson, Davies against Dever, Kitchen, with most scholars between); describes Eilat Mazar's 2005 'Large Stone Structure' as a possible palace of David and the Stepped Stone Structure, and Finkelstein and colleagues' 2007 reply that the remains are multi-period and partly Hellenistic, with Amihai Mazar, Faust and Dever's alternative readings; notes Thompson's mid-seventh-century date for a capital against Sergi's case for significance in Iron Age IIA; explains Finkelstein's middle position (a historical dynastic founder, but the united monarchy as a late seventh-century ideological picture); and may note the Shalem Center's sponsorship of Mazar's dig.", "id": "q5"},
    {"type": "open", "prompt": "Was 1967 a 'reunification' or an 'occupation' of Jerusalem? Explain how different parties answer, and why the question matters today.", "rubric": "A strong answer sets out the events (capture of East Jerusalem and the Old City on 7 June 1967, demolition of the Maghribi Quarter, extension of the boundary over about 70 km² including 28 villages, residency rather than citizenship for Palestinians); the Israeli view (Jerusalem Day, the 1980 Basic Law on a 'complete and united' capital, Netanyahu's 2015 statement); the Palestinian, UN and EU view (East Jerusalem as occupied territory, Resolution 478 calling the law 'null and void', the PLO's 1988 claim, Nusseibeh's statement); the post-1967 status quo on the Temple Mount / Haram al-Sharif and disputes over its erosion; and current questions of sovereignty, embassies and demography, with figures attributed and dated.", "id": "q6"}
  ]$mn_jerusalem_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/regional-histories/middle-east/jerusalem-a-history-from-antiquity-to-the-present', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
