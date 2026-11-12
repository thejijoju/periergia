-- Safavid Iran — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/safavid-iran @ research/advanced/read.
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
    'history/early-modern-period/safavid-iran',
    'research',
    'advanced',
    'read',
    $em_safavid_master$> **The Safavid dynasty** (1501–1722, with puppet shahs until 1736) made Iran a Shi'a Muslim country, a transformation that still defines Iran's identity and shapes the politics of the Middle East today. From a Sufi order in northwestern Iran, the Safavids built an empire that rivalled the Ottomans to the west and the Mughals to the east, and under Shah Abbas the Great created in Isfahan one of the most beautiful cities in the world. This chapter covers the Safavid order and Shah Ismail, the conversion of Iran to Twelver Shi'ism, the wars with the Ottomans, Shah Abbas's reforms, Isfahan, the Armenian silk merchants of New Julfa, Safavid art, and the dynasty's fall to an Afghan army in 1722.

## From Sufi Order to Dynasty

The Safavids took their name from **Safi al-Din** (died 1334), a Sufi master in the town of Ardabil in northwestern Iran, whose order attracted followers among the Turkmen tribes of eastern Anatolia and Azerbaijan. Over the fifteenth century the order became increasingly militant and adopted a fervent form of Shi'ism. Its devoted tribal warriors wore a distinctive red cap and became known as the **Qizilbash**, Turkish for "red heads".

In 1501 the young leader of the order, **Ismail**, about fourteen years old, led the Qizilbash to victory and was crowned shah in **Tabriz**. Within a decade he had conquered most of Iran and Iraq. Ismail presented himself to his followers as a semi-divine figure, and he wrote religious poetry in Turkish under the pen name Khata'i. Many Qizilbash revered him as nearly invincible.

## Making Iran Shi'a

Ismail proclaimed **Twelver Shi'ism**, which recognises a line of twelve imams descended from Ali, the last of whom is believed to be in hiding and will return, as the official religion of his realm. At the time, most of Iran's population was Sunni. The conversion was carried out over the following century and more through state power: Sunni scholars were persecuted or fled, the first three caliphs, revered by Sunnis, were ritually cursed in public, and the Safavids invited Shi'a scholars from Jabal Amil in what is now Lebanon and from Iraq and Bahrain to build a Shi'a religious establishment.

The consequences were lasting. Iran became, and remains, the centre of the Shi'a world; today the great majority of Iranians are Shi'a. The religious divide also became a political frontier between Safavid Iran and the Sunni Ottoman empire, and the Shi'a clergy developed into a powerful institution that, centuries later, would lead the Iranian Revolution of 1979.

```checkpoint
q: Why was the Safavid conversion of Iran to Twelver Shi'ism so significant?
a*: Because it transformed a largely Sunni population into the centre of the Shi'a world, created a lasting divide with the Sunni Ottomans, and built a powerful Shi'a clergy.
a: Because Iran had always been Shi'a, and the Safavids simply confirmed it.
x: Most of Iran's population was Sunni in 1501; the Safavids changed this.
a: Because it converted Iran to Christianity.
x: The Safavids promoted Twelver Shi'a Islam, not Christianity.
a: Because it ended all religious diversity in the Middle East.
x: Religious diversity continued; the conversion created a major Sunni–Shi'a political frontier.
hint: Think about Iran today and the Ottoman–Safavid rivalry.
why: The Safavid conversion shaped Iran's identity and the religious map of the Middle East for five centuries.
---
q: Who were the Qizilbash?
a: Persian court poets.
x: The Qizilbash were Turkmen tribal warriors, not court poets.
a: Ottoman Janissaries.
x: The Janissaries were the Ottoman infantry; the Qizilbash were the Safavids' followers and enemies of the Ottomans.
a*: Turkmen tribal warriors devoted to the Safavid order, named "red heads" for their red caps.
a: Armenian silk merchants.
x: The Armenian merchants were based in New Julfa; the Qizilbash were warriors.
hint: Their name comes from their headgear.
why: The Qizilbash were the military backbone of the early Safavid state, though later shahs sought to reduce their power.
```

## Rivalry with the Ottomans

The Safavids' religious propaganda among the Turkmen of eastern Anatolia alarmed the Ottomans. In 1514 the Ottoman sultan **Selim I** invaded and defeated Ismail at **Chaldiran**, where Ottoman artillery and Janissary musketeers destroyed the Qizilbash cavalry. The Ottomans briefly occupied Tabriz. Ismail never led his armies in battle again, and the myth of his invincibility was broken. The two empires fought repeatedly for a century and a half over eastern Anatolia, the Caucasus, and Iraq. The Treaty of Amasya in 1555 and later the Treaty of Zuhab in 1639 established a frontier between them that roughly corresponds to the modern borders of Iran with Turkey and Iraq.

Ismail's son **Tahmasp** (reigned 1524–1576) moved the capital away from the Ottoman frontier, to Qazvin (about 1555), and welcomed the exiled Mughal emperor Humayun, whose recovery of his throne (Kandahar and Kabul from 1545, Delhi in 1555) began with Safavid troops, as the next chapter describes.

## Shah Abbas the Great

The greatest Safavid ruler, **Shah Abbas I** (reigned 1587/88–1629), came to the throne in a period of crisis, with Ottoman and Uzbek armies occupying Safavid territory and the Qizilbash chiefs dominating the state. Abbas reduced the power of the Qizilbash by building a new army of *ghulams*, slave soldiers recruited from Georgian, Armenian, and Circassian captives and converts, loyal to the shah alone, and units of musketeers and artillery. He took more land into direct royal control to pay for them.

With his new army, Abbas drove out the Uzbeks and recovered Tabriz and Baghdad from the Ottomans. In 1622, with the help of ships of the English East India Company, he expelled the Portuguese from the island port of **Hormuz** in the Persian Gulf, which they had held since 1515, as the chapter on European expansion described. He welcomed European envoys, merchants, and adventurers, such as the English brothers Anthony and Robert Sherley, and used European rivalries to his advantage against the Ottomans.

## Isfahan, "Half the World"

In 1598 Abbas made **Isfahan** his capital and rebuilt it on a magnificent scale. At its centre he laid out a vast public square, the **Naqsh-e Jahan** ("Image of the World"), lined with arcades of shops and framed by the royal Shah Mosque, the smaller Sheikh Lotfollah Mosque, the palace of Ali Qapu, and the entrance to the great bazaar. A long avenue of gardens and pavilions, the Chahar Bagh, and bridges over the Zayandeh River completed the city. Its beauty inspired the saying *Esfahan nesf-e jahan ast*, "Isfahan is half the world".

## New Julfa and the Silk Trade

Silk was Iran's most valuable export. In 1604–1605, during a war with the Ottomans, Abbas forcibly deported the Armenian population of the town of Julfa in the Caucasus and resettled them in a new suburb of Isfahan, **New Julfa**. He granted the Armenian merchants privileges, including a leading role in the royal silk trade. From New Julfa, Armenian merchant families built a commercial network that stretched from London and Amsterdam through the Mediterranean to India, Tibet, Manila, and even Acapulco, as the historian Sebouh Aslanian has shown, one of the great trading networks of the early modern world. Their story shows how much of global commerce in this period was run by non-European merchants.

## Art and Culture

Safavid court workshops produced some of the finest art of the Islamic world. The illustrated *Shahnameh* made for Shah Tahmasp, with over two hundred and fifty paintings, is a masterpiece of Persian miniature painting. In Abbas's reign, the painter **Reza Abbasi** developed a new style of single-figure drawings and paintings of courtiers and ordinary people. Safavid **carpets**, such as the great Ardabil carpet of 1539–1540, now in the Victoria and Albert Museum in London (its twin is in Los Angeles), became prized across Europe. Persian poetry and philosophy flourished; the "School of Isfahan" of philosophers such as Mir Damad and Mulla Sadra developed influential ideas combining Islamic philosophy and mysticism. Persian also remained the language of high culture and administration across the Mughal empire and much of Central Asia, creating a vast "Persianate" world from the Ottomans to India.

{{image: Naqsh-e Jahan Square | The Naqsh-e Jahan square in Isfahan, laid out by Shah Abbas I, with the Shah Mosque at its southern end.}}

## Decline and the Afghan Conquest

After Abbas, the Safavid state enjoyed a long period of relative peace with the Ottomans after 1639, but its later rulers were less effective, and historians debate how far the state was declining and how far it was adapting. The economy suffered from a drain of silver out of the country, much of it to India, and from a weakening silk trade, and the court grew distant from the provinces. Historians such as Rudi Matthee have described a "Persia in crisis" in the late seventeenth century.

Under **Shah Sultan Husayn** (reigned 1694–1722), a pious ruler long portrayed as more interested in religion than government, Afghan tribes in the eastern provinces rebelled. In 1722 an Afghan army under **Mahmud Hotaki** defeated the Safavid forces and besieged Isfahan; after months of famine, the shah surrendered. The dynasty never regained real power; Nader Shah ruled through Safavid puppet shahs until he took the throne himself in 1736. **Nader Shah**, a military leader, restored Iranian power in the 1730s, invading India and sacking Delhi in 1739, as the next chapter describes.

```checkpoint
q: Why did Shah Abbas build an army of ghulams?
a: Because he wanted to abolish the army altogether.
x: Abbas expanded and reformed the army rather than abolishing it.
a*: To reduce his dependence on the Qizilbash chiefs by creating slave soldiers, recruited from Georgian, Armenian, and Circassian captives and converts, loyal only to the shah.
a: Because the Ottomans required him to.
x: The ghulams were built to fight the Ottomans, not at their request.
a: Because the ghulams were cheaper than any other troops.
x: The ghulams were expensive; Abbas took land into royal control to pay for them.
hint: Compare with Ottoman military slavery.
why: Military slavery gave the shah a loyal force independent of tribal elites, a strategy shared with the Ottomans and others.
---
q: What was New Julfa?
a: A Safavid fortress on the Ottoman border.
x: New Julfa was a merchant suburb of Isfahan.
a: A Portuguese colony in the Persian Gulf.
x: The Portuguese held Hormuz until 1622; New Julfa was Armenian and Safavid.
a: A Sufi lodge in Ardabil.
x: The Safavid order's centre was at Ardabil; New Julfa was in Isfahan.
a*: A suburb of Isfahan where Abbas resettled deported Armenians, whose merchants built a global silk-trading network from Amsterdam to Manila.
hint: Think about silk and Armenian merchants.
why: New Julfa's merchants show that much early modern global trade was run by non-European diasporas.
```

## Further exploration

- **Andrew J. Newman, *Safavid Iran: Rebirth of a Persian Empire* (2006).** A history of the Safavid state and society.
- **Rudi Matthee, *Persia in Crisis: Safavid Decline and the Fall of Isfahan* (2012).** The late Safavid period.
- **Sebouh David Aslanian, *From the Indian Ocean to the Mediterranean: The Global Trade Networks of Armenian Merchants from New Julfa* (2011).** The Armenian merchant network.
- **Sheila R. Canby (ed.), *Shah Abbas: The Remaking of Iran* (2009).** The art and achievements of Shah Abbas.
- **Michael Axworthy, *Empire of the Mind: A History of Iran* (2007).** A concise history of Iran.$em_safavid_master$,
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
  select $em_safavid_quiz$[
    {"type": "mcq", "prompt": "Where did the Safavid dynasty originate?", "options": ["A Sufi order based at Ardabil in northwestern Iran", "A Mongol garrison in Baghdad", "An Arab tribe of the Hejaz", "A Portuguese trading post at Hormuz"], "answerIndex": 0, "explanation": "The order of Safi al-Din became militant and Shi'a, and its Qizilbash followers made Ismail shah in 1501.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened at the battle of Chaldiran in 1514?", "options": ["Ismail conquered Istanbul", "The Safavids expelled the Portuguese", "Ottoman artillery and Janissaries defeated Ismail's Qizilbash cavalry", "The Mughals annexed Iran"], "answerIndex": 2, "explanation": "Chaldiran broke the myth of Ismail's invincibility and began a long Ottoman–Safavid rivalry.", "id": "q2"},
    {"type": "mcq", "prompt": "Which city did Shah Abbas I make his capital in 1598?", "options": ["Tabriz", "Qazvin", "Ardabil", "Isfahan"], "answerIndex": 3, "explanation": "Abbas rebuilt Isfahan around the Naqsh-e Jahan square: 'Isfahan is half the world'.", "id": "q3"},
    {"type": "mcq", "prompt": "Who ended the Safavid dynasty's effective rule in 1722?", "options": ["The Ottoman sultan Selim I", "An Afghan army under Mahmud Hotaki", "The English East India Company", "Shah Abbas's ghulams"], "answerIndex": 1, "explanation": "After besieging Isfahan, Mahmud Hotaki forced Shah Sultan Husayn to surrender.", "id": "q4"},
    {"type": "open", "prompt": "How and why did the Safavids make Iran a Shi'a country, and with what lasting consequences?", "rubric": "A strong answer explains Ismail's proclamation of Twelver Shi'ism over a largely Sunni population, enforcement through persecution of Sunni scholars, ritual cursing and imported scholars from Jabal Amil, Iraq and Bahrain; motives including legitimacy and distinction from the Ottomans; and consequences: Iran as the centre of the Shi'a world, a Sunni–Shi'a political frontier with the Ottomans, and a powerful clergy that later led the 1979 revolution.", "id": "q5"},
    {"type": "open", "prompt": "How did Shah Abbas I transform the Safavid state?", "rubric": "A strong answer discusses the crisis he inherited, the ghulam army of Georgian, Armenian and Circassian slave soldiers and musketeers to curb the Qizilbash, crown lands to pay them, victories over the Uzbeks and Ottomans, Hormuz in 1622 with English help, diplomacy with Europeans, Isfahan as a new capital, and the Armenian silk merchants of New Julfa, with some assessment of costs and limits.", "id": "q6"}
  ]$em_safavid_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/safavid-iran', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
