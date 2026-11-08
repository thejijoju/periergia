-- Ottoman Social and Cultural History — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/ottoman-social-and-cultural-history @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- Istanbul and Evliya Çelebi, the coffeehouse, the harem and the
-- sultanate of women, guilds and protest, Sufism, the communities and
-- provinces, slavery, the delay of print, and Tanzimat culture.
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
    'history/early-modern-period/ottoman-social-and-cultural-history',
    'research',
    'advanced',
    'read',
    $ottsocial_master$> **Ottoman social and cultural history** looks at the empire not from the palace and the battlefield but from its streets, coffeehouses, workshops, courts, and homes. Using the vast archives of Ottoman courts and administration, historians have reconstructed the lives of artisans and merchants, women and slaves, Muslims, Christians, and Jews, and in doing so they have overturned many old stereotypes, including the idea of a stagnant, declining society. This chapter covers Istanbul and its neighbourhoods, the coffeehouse, the imperial harem, guilds and urban protest, Sufi orders and popular religion, life in the religious communities and the provinces, slavery, the long debate over printing, and the cultural transformations of the nineteenth century.

## Istanbul: A City of Neighbourhoods

By the sixteenth century, **Istanbul** was one of the largest cities in the world, with perhaps half a million or more inhabitants. It was a city of neighbourhoods, *mahalles*, often clustered around a mosque, church, or synagogue, where people of the same community, but not always the same religion, lived together. Markets such as the covered Grand Bazaar sold goods from across the empire and beyond; the waterfront along the Golden Horn and the Bosporus bustled with ships, porters, and fishermen. Fires and plague were constant threats. Public charitable foundations, *vakıfs*, endowed by sultans, officials, and wealthy women, built and maintained mosques, schools, soup kitchens, fountains, baths, and hospitals.

The traveller **Evliya Çelebi** (1611–after 1683) spent decades travelling the empire and beyond and wrote a ten-volume *Book of Travels* (*Seyahatname*), describing Istanbul's guilds, cities, customs, and people in vivid and sometimes fantastical detail. It is a treasure for social historians.

## The Coffeehouse Revolution

**Coffee**, from the highlands of Ethiopia and Yemen, spread through Sufi circles and then into everyday life, as the chapter on drugs in history describes. The first **coffeehouses** opened in Istanbul in the mid-sixteenth century, and they quickly became centres of social life, places where men of different classes met to talk, listen to storytellers and musicians, play games, and discuss politics.

Authorities were suspicious. Religious scholars debated whether coffee was permitted, and rulers feared the coffeehouse as a place of gossip, criticism, and sedition. Sultan **Murad IV** in the 1630s banned coffee and tobacco and is said to have patrolled the streets in disguise to enforce the ban. Like most such bans, it failed. The coffeehouse spread from the Ottoman world to Europe in the seventeenth century, where, in London, Paris, and Vienna, it became a centre of commerce, news, and debate, part of what the next chapters call the public sphere of the Enlightenment.

## The Imperial Harem and the "Sultanate of Women"

The **harem**, the private household of the sultan in the Topkapı palace, was long imagined by European writers as a place of sensual idleness and intrigue, an image visible in countless orientalist paintings. In *The Imperial Harem* (1993), the historian **Leslie Peirce** showed it to be a political institution. The harem housed the sultan's mother, concubines, children, and female servants, many of them enslaved women, and it was where the dynasty reproduced and where much politics was conducted.

From the mid-sixteenth to the mid-seventeenth centuries, women of the harem wielded great influence, a period sometimes called the **"sultanate of women"**. **Hürrem Sultan**, known in Europe as Roxelana, a woman of Ruthenian origin who had been enslaved, became Suleiman's wife, broke with dynastic custom, and played a major political role. **Kösem Sultan** was regent for her sons and grandson in the seventeenth century until she was murdered in 1651. These royal mothers and wives built mosques and charitable foundations, negotiated with officials, and secured the succession. Older historians blamed their influence for Ottoman "decline"; Peirce showed that it reflected a deliberate shift in how the dynasty exercised power.

```checkpoint
q: How did Leslie Peirce change the understanding of the Ottoman harem?
a*: By showing that it was a political institution where the dynasty reproduced and powerful women, such as royal mothers, exercised real political influence.
a: By showing that the harem never existed.
x: The harem existed; Peirce changed how it is understood.
a: By proving that harem women caused the empire's decline.
x: Peirce argued against the idea that women's influence caused decline.
a: By showing that only men lived in the harem.
x: The harem was the household of the sultan's mother, concubines, children, and female servants.
hint: Contrast the orientalist image with the historical evidence.
why: Peirce replaced a European fantasy with an analysis of power, showing how women of the dynasty shaped politics.
---
q: Why did Ottoman authorities try to ban coffeehouses?
a: Because coffee was unknown in the empire.
x: Coffee was widely consumed; that is why the authorities worried about coffeehouses.
a: Because coffeehouses were run by the Janissaries' enemies only.
x: The concern was about gatherings and talk, not specific owners.
a*: Because they feared coffeehouses as places of gossip, political criticism, and possible sedition, and some scholars debated whether coffee was permitted.
a: Because the coffeehouse was a European invention.
x: The coffeehouse spread from the Ottoman world to Europe, not the reverse.
hint: What did people do in coffeehouses?
why: Coffeehouses created new public spaces for discussion, which rulers found threatening; bans failed as coffee spread.
```

## Guilds, Janissaries, and Protest

Artisans and merchants were organised in **guilds** (*esnaf*), which regulated prices, quality, and training and represented their members before the authorities. In the parades staged for great occasions, described by Evliya Çelebi, hundreds of guilds marched through Istanbul with their tools and floats.

By the seventeenth and eighteenth centuries, many **Janissaries**, once an elite slave corps, had become part of urban society, marrying, working as artisans and shopkeepers, and passing their positions to their sons. They were deeply involved in urban politics and frequently joined or led revolts, often in alliance with artisans and religious scholars. In 1730 a revolt led by a former Janissary, **Patrona Halil**, overthrew Sultan Ahmed III and ended the period of courtly luxury later called the Tulip Era. The urban crowd was a real political force in Ottoman cities.

## Sufism and Popular Religion

Ottoman religious life was far richer than the official world of the ulema. **Sufi orders**, brotherhoods devoted to mystical paths to God, had lodges across the empire. The **Mevlevi** order, founded on the teachings of the poet Rumi, was known for its ritual dance, the "whirling" dervishes; the **Bektashi** order was closely linked to the Janissaries. People visited the tombs of saints, both Muslim and Christian, to seek blessings and cures, sometimes sharing shrines across religious lines. Religious scholars debated how much of this popular religion was acceptable, and reformist movements, such as the seventeenth-century Kadızadeli preachers, attacked practices they considered innovations.

## Life in the Communities and Provinces

The empire was home to Muslims, Orthodox Christians, Armenians, Catholics, and Jews, speaking Turkish, Greek, Armenian, Arabic, Kurdish, Slavic languages, Ladino, and others. Ottoman court records, *sicils*, kept by Islamic judges, show that non-Muslims and women regularly used the courts, sometimes even when their own communities offered alternatives, to register property, settle disputes, and claim inheritances. Women appear as property owners, creditors, and litigants.

The **Jewish** communities of the empire, enriched by refugees from Spain and Portugal, flourished in Istanbul, Salonica, and elsewhere, speaking Judeo-Spanish (Ladino). In 1665–1666 the Jewish world was shaken by **Sabbatai Zevi**, from İzmir, who proclaimed himself the Messiah and won followers across Europe and the Middle East; arrested by the Ottomans, he converted to Islam, devastating his movement. In the **Arab provinces**, cities such as Cairo, Aleppo, and Damascus were governed by Ottoman officials alongside powerful local notable families, and they kept their own vibrant economic and intellectual lives; historians such as André Raymond and Abraham Marcus have studied them using local court records.

## Slavery as a Lived Institution

Slavery was woven into Ottoman society. Enslaved people, captured in war or bought from the Black Sea and Caucasus, Africa, and elsewhere, worked as domestic servants, concubines, galley rowers, and labourers, and the devshirme and harem made slavery part of the highest levels of power. Islamic law encouraged manumission, and many enslaved people were freed after years of service. In the nineteenth century, under British pressure and internal reform, the Ottomans restricted the slave trade, but slavery persisted, especially of women from the Caucasus and Africa, into the early twentieth century.

## The Long Delay of Ottoman Print

Printing came early to the Ottoman empire, but not for Ottoman Turkish. Jewish refugees set up a printing press in Istanbul in the 1490s, and Armenian and Greek presses followed. But books in Ottoman Turkish and Arabic, the languages of the Muslim majority, were not printed until **İbrahim Müteferrika**, a Hungarian-born convert to Islam, opened a press in Istanbul in **1727**, with permission from the sultan and a religious ruling, printing works on history, geography, and language, though not religious texts.

Why the delay? Older explanations blamed religious hostility. Historians now emphasise other factors: the prestige of calligraphy and a large, skilled manuscript trade; the beauty and complexity of Arabic script, which was hard to set in type; and a lack of demand when manuscripts were plentiful and relatively cheap. Printing in Ottoman Turkish spread widely only in the nineteenth century.

## Nineteenth-Century Transformations

The Tanzimat era transformed Ottoman culture. The first Ottoman official newspaper, *Takvim-i Vekayi*, appeared in 1831, and private newspapers followed, creating a reading public and a new political journalism. **Photography** arrived quickly; studios in Istanbul, such as that of the Armenian Abdullah brothers, photographed sultans and city life. In 1829 Mahmud II replaced the turban with the **fez** as official headgear, a sign of a new, modern Ottoman identity, which in turn was banned by Atatürk's republic in 1925 in favour of the European hat. Schools, theatres, novels, and new ideas of citizenship spread.

Social history, by revealing the energy of Ottoman cities, courts, and communities, has done much to revise the old narrative of decline. The Ottoman world was not frozen in tradition; it was diverse, contested, and constantly changing.

## Further exploration

- **Leslie P. Peirce, *The Imperial Harem: Women and Sovereignty in the Ottoman Empire* (1993).** The harem as political institution.
- **Suraiya Faroqhi, *Subjects of the Sultan: Culture and Daily Life in the Ottoman Empire* (1995; English trans. 2000).** Everyday life across the empire.
- **Robert Dankoff and Sooyong Kim (trans.), *An Ottoman Traveller: Selections from the Book of Travels of Evliya Çelebi* (2010).** Selections from Evliya's travels.
- **Marc David Baer, *The Ottomans: Khans, Caesars, and Caliphs* (2021).** A recent history emphasising diversity and identity.
- **Molly Greene, *A Shared World: Christians and Muslims in the Early Modern Mediterranean* (2000).** Coexistence in Ottoman Crete.$ottsocial_master$,
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
  select $ottsocial_quiz$[
    {"type": "mcq", "prompt": "Who wrote the ten-volume Book of Travels describing the Ottoman world?", "options": ["İbrahim Müteferrika", "Mimar Sinan", "Patrona Halil", "Evliya Çelebi"], "answerIndex": 3, "explanation": "Evliya Çelebi's Seyahatname is a treasure for social historians.", "id": "q1"},
    {"type": "mcq", "prompt": "When was the first book in Ottoman Turkish printed by İbrahim Müteferrika's press?", "options": ["1453", "1493", "1729", "1831"], "answerIndex": 2, "explanation": "Müteferrika set up his press in 1727; a Jewish press had operated in Istanbul since the 1490s.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Leslie Peirce show about the imperial harem?", "options": ["That it was a political institution in which royal women exercised real power", "That it was a place of idleness only", "That it never existed", "That it was run by the Janissaries"], "answerIndex": 0, "explanation": "Peirce's work replaced the orientalist fantasy with an analysis of dynastic politics.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Mahmud II's 1829 dress reform introduce?", "options": ["The turban", "The fez", "The European hat", "The veil"], "answerIndex": 1, "explanation": "The fez became a symbol of modern Ottoman identity until the Turkish republic banned it in 1925.", "id": "q4"},
    {"type": "open", "prompt": "How has social history changed our picture of the Ottoman empire?", "rubric": "A strong answer explains the sources (court records, guild records, travel accounts such as Evliya Çelebi) and findings: the political role of the harem (Peirce), coffeehouses as public spaces, guilds and Janissary-artisans in urban politics (Patrona Halil), Sufi orders and shared shrines, women and non-Muslims using courts, Jewish, Armenian, Greek, and Arab provincial life, and slavery, concluding that social history undermines the stagnation and decline narrative.", "id": "q5"},
    {"type": "open", "prompt": "Why did printing in Ottoman Turkish and Arabic come so late, and how do historians now explain it?", "rubric": "A strong answer notes that Jewish, Armenian, and Greek presses operated from the 1490s onwards while Müteferrika's press came only in 1727, and weighs explanations: older claims of religious hostility versus newer emphasis on the prestige of calligraphy and the manuscript trade, the technical difficulty of Arabic type, and limited demand when manuscripts were available. It notes that print spread widely only in the nineteenth century.", "id": "q6"}
  ]$ottsocial_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/ottoman-social-and-cultural-history', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
