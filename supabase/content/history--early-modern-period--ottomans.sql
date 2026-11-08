-- The Ottomans — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/the-ottomans @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Anatolia before the Ottomans, the frontier and the gazi debate, the
-- institutions of empire, Mehmed II, Selim and Suleiman, Lepanto and
-- Vienna, decline or transformation, the Tanzimat, and the end of the
-- empire including the Armenian genocide.
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
    'history/early-modern-period/the-ottomans',
    'research',
    'advanced',
    'read',
    $ottomans_master$> **The Ottoman empire** lasted for more than six centuries, from a small frontier principality in northwestern Anatolia around 1300 to the founding of the Republic of Turkey in 1923. At its height in the sixteenth century it ruled southeastern Europe, Anatolia, the Arab lands from Iraq to Algeria, and the holy cities of Mecca and Medina, and it was the leading power of the Mediterranean world. Western writers long described its later history as a story of decline, the "sick man of Europe". Historians now tell a more complex story of an empire that adapted, reformed, and survived for centuries in a world of rival empires. This chapter follows the Ottomans from their origins to their end.

## Anatolia Before the Ottomans

In the eleventh century, Turkish groups entered Anatolia after the Seljuk victory over the Byzantines at Manzikert in 1071, as the chapter on Byzantium described. The **Seljuks of Rum**, ruling from Konya, built a sultanate in central Anatolia, but in 1243 they were defeated by the Mongols at Köse Dağ and became vassals of the Ilkhanate. As Mongol power faded, Anatolia fragmented into a patchwork of small Turkish principalities known as **beyliks**. One of them, on the Byzantine frontier in Bithynia in the northwest, was led by **Osman**, from whom the Ottomans (in Turkish, *Osmanlı*) take their name; his rise is traditionally dated to around 1299.

## A Frontier Society

How did Osman's small principality grow into an empire? In the 1930s the historian Paul Wittek proposed the **gazi thesis**: the early Ottomans were driven by the ideal of holy war, *gaza*, against Christian Byzantium. Later historians revised this picture: Cemal Kafadar (1995) kept a role for the gazi ideal but reinterpreted it, while Heath Lowry (2003) rejected the thesis outright. Both showed that the early Ottoman frontier was a fluid world in which Muslims and Christians, Turks and Greeks fought, allied, intermarried, and served together, and in which "gaza" could mean raiding for booty as much as religious war. Byzantine Christian lords and soldiers joined the Ottomans, and early sultans married Christian princesses.

The Ottomans expanded as much by accommodation as by conquest. They often left local lords in place as **vassals**, and offered generous terms to towns and villages that submitted, a policy known as **istimalet**, "winning over". Christian soldiers could hold land grants in return for military service. The Ottomans took **Bursa** in 1326 and made it their capital, crossed into Europe at **Gallipoli** in 1354, and took Adrianople (**Edirne**) around 1369. At **Kosovo** in 1389 they defeated a Serbian-led coalition, and at **Nicopolis** in 1396 they destroyed a crusading army. In 1402, however, the Central Asian conqueror **Timur** defeated and captured Sultan Bayezid I at Ankara, plunging the Ottoman state into a decade of civil war between his sons. That the state survived this shows how firmly its institutions were already rooted.

## Building an Empire

The Ottoman state rested on several institutions:

- **The timar system.** Much agricultural land was owned by the state and assigned as *timars*, grants of the right to collect revenue from peasants, to cavalrymen (*sipahis*) in return for military service. The peasants, Muslim and Christian, held the land they farmed and paid taxes.
- **The devshirme and the Janissaries.** From the late fourteenth century, the Ottomans levied boys from Christian families in the Balkans, converted them to Islam, and trained them as the sultan's slaves, either as soldiers in the elite infantry corps, the **Janissaries**, or as palace officials, some of whom rose to be grand viziers, as the chapter on slavery in the global Middle Ages described.
- **The ulema.** Muslim scholars trained in religious colleges, **medreses**, staffed the courts and schools; the chief religious authority, the *şeyhülislam*, issued legal opinions.
- **Law.** Alongside Islamic law, the sultans issued their own administrative laws, *kanun*, codified in law books.

Ottoman culture grew with the state. In early capitals such as Bursa, builders created mosques and complexes, such as the Green Mosque (completed in the 1420s), that combined Seljuk, Byzantine, and new Ottoman forms, leading eventually to the great domed mosques of Sinan. Conquered cities were remade with mosques, markets, baths, and charitable foundations. A courtly literature in Ottoman Turkish, a language rich in Persian and Arabic vocabulary, flourished alongside folk poetry and chronicles of the dynasty's history.

## Mehmed II and Constantinople

**Mehmed II** (reigned 1444–1446 and 1451–1481) conquered **Constantinople** in 1453, as the chapter on Byzantium described, using huge cannon cast by a Hungarian engineer to batter the Theodosian Walls. He made the city, which the Ottomans usually called Kostantiniyye and which became known as Istanbul, his capital, and repopulated it by moving Muslims, Christians, and Jews there, sometimes by force. Hagia Sophia became a mosque. Mehmed built the **Topkapı** palace, centralised power, issued law codes, and presented himself as heir to both Islamic and Roman empires, taking the title "Caesar of Rome". He also had his brothers executed on his accession, a practice of fratricide that later sultans followed to prevent civil wars.

## The Classical Age: Selim and Suleiman

**Selim I** (reigned 1512–1520) defeated the Safavids of Iran at **Chaldiran** in 1514, as the chapter on Safavid Iran describes, and in 1516–1517 conquered the **Mamluk** sultanate, taking Syria, Egypt, and the protectorship of the holy cities of **Mecca and Medina**. The Ottoman sultan became the leading ruler of the Sunni Muslim world.

His son **Suleiman I** (reigned 1520–1566), known in the West as "the Magnificent" and in Turkish as *Kanuni*, "the Lawgiver", ruled the empire at its height. He took Belgrade in 1521 and Rhodes in 1522, destroyed the Hungarian kingdom at **Mohács** in 1526, besieged **Vienna** in 1529, and took Baghdad in 1534. His admiral **Hayreddin Barbarossa** made the Ottoman navy dominant in the Mediterranean. Suleiman allied with Catholic France against the Habsburgs, a sign of how far Ottoman power was woven into European diplomacy, as the chapter on the Reformations described. His reign saw the greatest works of the architect **Mimar Sinan**, such as the Süleymaniye mosque in Istanbul.

The Ottomans ruled a population of many religions. Christians and Jews, as protected peoples, paid special taxes and were subject to restrictions, but they were largely free to practise their religion and run their communal affairs, including marriage, inheritance, and education, through their own religious leaders, such as the Greek Orthodox and Armenian patriarchs and Jewish rabbis. Historians call this the **millet system**, though recent research has shown that the term and its formal organisation date mostly from the nineteenth century; earlier arrangements were more informal and varied. The empire welcomed Jews expelled from Spain in 1492, and Istanbul and Salonica became major Jewish centres.

```checkpoint
q: How did historians such as Kafadar and Lowry revise Wittek's gazi thesis?
a*: They showed that the early Ottoman frontier was a fluid world of Muslim–Christian cooperation, alliance, and intermarriage, in which "gaza" could mean raiding for booty as much as holy war.
a: They argued that the Ottomans never fought Christians.
x: The Ottomans fought Christian states constantly; the revision concerns the nature of the frontier.
a: They argued that the Ottomans were originally Byzantine Christians.
x: The Ottomans were a Turkish Muslim dynasty, though they absorbed many Christian lords and soldiers.
a: They argued that Osman never existed.
x: The revisionists did not deny Osman's existence; they reinterpreted the character of his state.
hint: Think about istimalet and Christian vassals.
why: The revisionist view explains Ottoman expansion through accommodation and coalition-building as well as holy war.
---
q: What was the devshirme?
a: A tax paid in silver by Muslim peasants.
x: The devshirme was a levy of boys, not a silver tax.
a: A Sufi religious order.
x: The devshirme was a recruitment system, though Janissaries had links to the Bektashi Sufi order.
a*: A levy of boys from Christian families in the Balkans, who were converted and trained as Janissary soldiers or palace officials, some rising to grand vizier.
a: A treaty with Venice.
x: The devshirme was an internal Ottoman institution.
hint: Think of the Janissaries.
why: The devshirme created a loyal elite dependent on the sultan, combining slavery with access to great power.
```

## Lepanto, Vienna, and Retreat

In 1571 a Christian alliance, the Holy League, destroyed the Ottoman fleet at **Lepanto** off Greece. European writers celebrated the victory, but the Ottomans rebuilt their fleet within a year and took Cyprus from Venice; the Mediterranean balance changed less than legend suggests. The empire continued to expand in places into the seventeenth century, taking Crete from Venice in 1669.

In 1683 the grand vizier Kara Mustafa Pasha besieged **Vienna** a second time. A relief army led by King Jan Sobieski of Poland defeated the Ottomans, and in the long war that followed the Habsburgs conquered Hungary. The Treaty of **Karlowitz** in 1699 marked the first major Ottoman loss of territory. Over the eighteenth and nineteenth centuries, the empire lost land to Austria and especially to Russia, which in the Treaty of **Küçük Kaynarca** (1774) won Crimea's independence (annexing it in 1783) and a claim to protect Orthodox Christians in the empire.

## Decline or Transformation?

Older historians, both Western and Turkish, described the Ottoman empire after Suleiman as declining: weak sultans confined to the palace, corruption, a stagnant economy, and a military falling behind Europe. Many historians now reject this **decline thesis** as too simple. They point out that the empire survived for more than three centuries after Suleiman, that it adapted by shifting power from the sultan to grand viziers, households, and provincial notables, that it developed new forms of taxation such as life-term tax farming, and that its economy and culture remained vigorous. Baki Tezcan has even described a "Second Ottoman Empire" emerging in the seventeenth century, in which power was shared more widely. The empire did fall behind its European rivals militarily and economically in the eighteenth and nineteenth centuries, but its story is one of transformation as well as loss.

## Reform: The Tanzimat

Faced with military defeats, nationalist revolts such as the Serbian uprisings from 1804 and the Greek War of Independence (1821–1830), and the loss of Egypt to its own governor, Muhammad Ali, Ottoman rulers launched reforms. **Selim III** (reigned 1789–1807) created a new European-style army and was overthrown by the Janissaries. **Mahmud II** (reigned 1808–1839) destroyed the Janissaries in 1826 in what the government called the "Auspicious Incident", and centralised the state.

From 1839 the **Tanzimat**, "reorganisation", reforms aimed to modernise the empire and win the loyalty of all its subjects. The Edict of Gülhane (1839) promised security of life and property and fair taxation to all subjects regardless of religion, and the Reform Edict of 1856 declared Muslims and non-Muslims equal before the law. The reforms created new schools, courts, and ministries, and in 1876 the empire adopted a **constitution** and parliament. Sultan **Abdülhamid II** (reigned 1876–1909) suspended the constitution in 1878 and ruled as an autocrat, emphasising Islam and his role as caliph to hold the empire together, while continuing to build railways, schools, and telegraphs.

In 1853 the Russian tsar Nicholas I reportedly described the Ottoman empire as a "sick man", and the phrase **"sick man of Europe"** stuck. It reflected Russian and European ambitions to divide the empire, which the Crimean War (1853–1856), fought by Britain and France on the Ottoman side, briefly checked.

## The End of the Empire

In 1908 a group of officers and reformers known as the **Young Turks**, organised in the Committee of Union and Progress, forced Abdülhamid to restore the constitution, and in 1909 they deposed him. The empire then lost almost all its remaining European territory in the **Balkan Wars** of 1912–1913, and its Libyan provinces to Italy. In 1914 the Young Turk government entered the **First World War** on the side of Germany. The Ottomans defeated the British and their allies at Gallipoli in 1915, but lost the Arab lands as British forces, supported by the Arab Revolt from 1916, advanced through Palestine and Iraq.

During the war, the Young Turk government carried out the **Armenian genocide**: in 1915–1916, Armenian men were massacred and women, children, and the elderly deported on death marches into the Syrian desert. Historians estimate that around one million Armenians, and by many estimates more, were killed, alongside mass killings of Assyrian and Greek Christians. The Turkish state has long denied that these events constituted genocide, a position rejected by most historians and many governments.

After the war, the Allies occupied Istanbul and imposed the Treaty of Sèvres (1920), which would have partitioned Anatolia. An army officer, **Mustafa Kemal**, later called **Atatürk**, led a nationalist war of independence that defeated Greek, Armenian, and French forces, leading to the Treaty of Lausanne in 1923. On 29 October 1923 Kemal proclaimed the **Republic of Turkey**; in 1922 the sultanate had already been abolished, and in 1924 the caliphate was abolished too. The Ottoman empire's legacy lives on in the states of the Balkans and the Middle East that emerged from it, and in the continuing debates over its history.

{{image: Süleymaniye Mosque | The Süleymaniye mosque in Istanbul, built by Mimar Sinan for Suleiman the Magnificent and completed in 1557.}}

```checkpoint
q: Why have many historians rejected the "decline thesis" for the Ottoman empire after Suleiman?
a: Because the empire continued to expand without losing any territory until 1914.
x: The empire lost substantial territory from 1699 onwards; the critique concerns how to interpret the period.
a*: Because the empire survived for over three centuries, adapted its institutions by sharing power more widely and developing new forms of taxation, and remained economically and culturally vigorous, so "transformation" describes it better.
a: Because Suleiman's successors conquered Vienna.
x: Both Ottoman sieges of Vienna, in 1529 and 1683, failed.
a: Because the Ottomans had no military defeats after 1571.
x: The empire suffered major defeats, such as at Vienna in 1683.
hint: Think about Tezcan's "Second Ottoman Empire".
why: The empire changed rather than simply declined, though it fell behind its European rivals in the eighteenth and nineteenth centuries.
---
q: What did the Tanzimat Reform Edict of 1856 declare?
a: That Islam was the only legal religion.
x: The edict promoted equality across religions, not the exclusion of non-Muslims.
a: That the sultanate was abolished.
x: The sultanate was abolished in 1922.
a: That the empire would join the European Union.
x: The European Union did not exist in the nineteenth century.
a*: That Muslims and non-Muslims were equal before the law.
hint: Think about reforms to win the loyalty of all subjects.
why: The Tanzimat sought to modernise the state and create an Ottoman citizenship transcending religion, an ambitious and contested project.
```

## Further exploration

- **Caroline Finkel, *Osman's Dream: The Story of the Ottoman Empire, 1300–1923* (2005).** A comprehensive narrative history.
- **Cemal Kafadar, *Between Two Worlds: The Construction of the Ottoman State* (1995).** The origins of the Ottoman state.
- **Baki Tezcan, *The Second Ottoman Empire* (2010).** A reinterpretation of the seventeenth-century transformation.
- **Eugene Rogan, *The Fall of the Ottomans: The Great War in the Middle East* (2015).** The empire in the First World War.
- **Ronald Grigor Suny, *"They Can Live in the Desert but Nowhere Else": A History of the Armenian Genocide* (2015).** A history of the genocide.$ottomans_master$,
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
  select $ottomans_quiz$[
    {"type": "mcq", "prompt": "What was istimalet?", "options": ["A policy of 'winning over' populations with generous terms of submission", "The Ottoman navy", "A tax on coffee", "The sultan's palace"], "answerIndex": 0, "explanation": "Accommodation, vassalage, and generous terms helped the early Ottomans expand as much as conquest did.", "id": "q1"},
    {"type": "mcq", "prompt": "Which conquest made the Ottoman sultan protector of Mecca and Medina?", "options": ["Constantinople in 1453", "Mohács in 1526", "Crete in 1669", "The conquest of the Mamluk sultanate in 1516–1517"], "answerIndex": 3, "explanation": "Selim I's conquest of Syria and Egypt brought the holy cities under Ottoman protection.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Tanzimat Reform Edict of 1856 declare?", "options": ["That the sultanate was abolished", "That Muslims and non-Muslims were equal before the law", "That Islam was the only legal religion", "That Egypt was independent"], "answerIndex": 1, "explanation": "The Tanzimat sought to create an Ottoman citizenship transcending religion.", "id": "q3"},
    {"type": "mcq", "prompt": "When was the Republic of Turkey proclaimed?", "options": ["1908", "1918", "29 October 1923", "1924"], "answerIndex": 2, "explanation": "Mustafa Kemal proclaimed the republic after the war of independence; the caliphate was abolished in 1924.", "id": "q4"},
    {"type": "open", "prompt": "Was the Ottoman empire after Suleiman in 'decline'? Evaluate the debate.", "rubric": "A strong answer explains the decline thesis (weak sultans, corruption, military lag, territorial losses from 1683 and Karlowitz 1699), and the transformation view (survival for three centuries, shift of power to viziers, households, and notables, tax farming, Tezcan's Second Ottoman Empire, cultural vigour, nineteenth-century reforms). It acknowledges real losses relative to European rivals and reaches a reasoned conclusion.", "id": "q5"},
    {"type": "open", "prompt": "How did the early Ottomans grow from a frontier principality into an empire?", "rubric": "A strong answer discusses the post-Mongol fragmentation of Anatolia, the gazi thesis and its revision by Kafadar and Lowry, a fluid Muslim–Christian frontier, istimalet and vassalage, Christian soldiers and princesses, key conquests (Bursa, Gallipoli, Edirne, Kosovo, Nicopolis), survival after Timur's victory at Ankara, and institutions (timar, devshirme and Janissaries, ulema, kanun).", "id": "q6"}
  ]$ottomans_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/the-ottomans', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
