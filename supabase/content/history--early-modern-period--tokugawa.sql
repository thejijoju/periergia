-- Tokugawa Shogunate — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/tokugawa-shogunate @ research/advanced/read.
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
    'history/early-modern-period/tokugawa-shogunate',
    'research',
    'advanced',
    'read',
    $em_tokugawa_master$> **The Tokugawa shogunate** ruled Japan from 1603 to 1868, two and a half centuries of internal peace after more than a century of civil war. The shoguns controlled the warrior lords, restricted Christianity and foreign contact, and presided over a society of fixed status groups. Yet within this framework, Japan's cities grew to be among the largest in the world, a commercial economy and a vibrant urban culture flourished, and literacy spread widely. This chapter covers the unification of Japan, the Tokugawa system, the policies later called *sakoku*, Edo and the merchant economy, the culture of the "floating world", rural stress and rebellion, and the arrival of Commodore Perry's ships in 1853.

## Unification

By the mid-sixteenth century, as the chapter on medieval Japan described, Japan was divided among warring regional lords, the **daimyō**, in the Sengoku ("Warring States") period. Three men unified it.

- **Oda Nobunaga** (1534–1582) used large units of musketeers, firearms having arrived with Portuguese traders in 1543, to defeat rival daimyō and destroy the military power of Buddhist monasteries. He was forced to kill himself when a vassal betrayed him in 1582.
- **Toyotomi Hideyoshi** (1537–1598), a man of humble birth, completed the unification. His "sword hunt" of 1588 aimed to disarm the peasants, and he froze social status, separating warriors from farmers. He then invaded **Korea** in 1592, intending to go on to conquer Ming China, and again in 1597, a disastrous war in which Korean forces, led at sea by **Admiral Yi Sun-sin** and his covered, spike-roofed "turtle ships", and Ming Chinese armies resisted. The invasions devastated Korea and ended with Hideyoshi's death in 1598.
- **Tokugawa Ieyasu** (1543–1616) defeated his rivals at the battle of **Sekigahara** in 1600, was appointed shogun in 1603, and destroyed the last Toyotomi stronghold at Osaka in 1615.

## The Tokugawa System

The Tokugawa ruled from **Edo**, modern Tokyo. The system combined the shogun's central government, the *bakufu*, with some 260 to 300 domains (the number changed over time) ruled by daimyō, an arrangement historians call the **bakuhan** system. The shoguns controlled the daimyō in several ways:

- **Alternate attendance** (*sankin-kōtai*), formalised in 1635 and extended to all daimyō in 1642, required daimyō to spend every other year in Edo and to leave their wives and heirs there permanently, as hostages. The cost of maintaining residences in Edo and travelling in grand processions drained the daimyō's resources and stimulated roads, inns, and commerce.
- The shogunate controlled the major cities, mines, and foreign trade, and regulated marriages and castles of the daimyō.
- The emperor remained in Kyoto with ritual authority but no political power.

Tokugawa ideology, drawing on Neo-Confucianism, described society as made up of four **status groups**: samurai at the top, then peasants, artisans, and merchants. Historians now stress that the three commoner groups were categories rather than a strict ranking, and that the order was an ideal more than a legal reality. Below them were outcast groups. Samurai became a hereditary class of salaried officials and administrators rather than active warriors. Historians note that reality was more fluid than the ideal: wealthy merchants could be more powerful than poor samurai, and some samurai became scholars, teachers, and doctors.

The result was the **Pax Tokugawa**, two and a half centuries without major war, an extraordinary period of peace in world history.

## A "Closed Country"?

In the seventeenth century the shogunate restricted foreign contact. It banned **Christianity** in 1614, persecuted Christians, and crushed the **Shimabara** rebellion of 1637–1638, a rising of largely Christian peasants against heavy taxes and persecution, as the chapter on the Reformations described. Japanese were forbidden to travel abroad, and the Portuguese were expelled in 1639. Only the **Dutch**, who did not seek to spread Christianity, were allowed to trade, confined from 1641 to the small artificial island of **Dejima** in Nagasaki harbour.

This policy became known as ***sakoku***, "closed country", but the term was coined only in 1801, by a Japanese translator of a European book. Historians such as Ronald Toby and Arano Yasunori have shown that Japan was far from closed. Arano described its relations as passing through **"four gates"**: at Nagasaki, with the Dutch and with **Chinese** merchants, who outnumbered the Dutch; through the domain of Tsushima, with **Korea**, which sent formal embassies to Edo; through the domain of Satsuma, with the **Ryukyu** kingdom; and through Matsumae, in the north, with the **Ainu** of Hokkaido. The policy was one of controlled contact, similar to Ming China's, rather than isolation.

Through the Dutch, Japanese scholars studied European science and medicine, known as ***rangaku***, "Dutch learning". In 1774 Sugita Genpaku and colleagues published a translation of a Dutch version of a German anatomy book, having confirmed its accuracy by observing a dissection, a landmark in Japanese science.

```checkpoint
q: How did alternate attendance help the Tokugawa control the daimyō?
a*: By requiring daimyō to spend every other year in Edo and leave their families there as hostages, which drained their resources and kept them under watch.
a: By forcing daimyō to live permanently in Kyoto with the emperor.
x: Daimyō attended the shogun in Edo, not the emperor in Kyoto.
a: By allowing daimyō to raise unlimited armies.
x: The shogunate restricted daimyō military power and castles.
a: By making daimyō travel abroad to trade.
x: Japanese were forbidden to travel abroad under Tokugawa policy.
hint: Think about hostages and expensive processions.
why: Alternate attendance kept the daimyō loyal and financially constrained, while stimulating roads and commerce.
---
q: Why do historians such as Ronald Toby and Arano Yasunori question the idea of a "closed country"?
a: Because Japan traded freely with all European countries.
x: European contact was restricted to the Dutch at Dejima.
a: Because the Tokugawa encouraged Christianity.
x: The Tokugawa banned Christianity in 1614.
a*: Because Japan maintained controlled relations through four gates, with the Dutch and Chinese at Nagasaki, Korea, the Ryukyu kingdom, and the Ainu, and the term sakoku was coined only in 1801.
a: Because Japan conquered China.
x: Hideyoshi's invasion of Korea aimed at China but failed.
hint: Count the gates.
why: Japan regulated rather than ended foreign contact, much like Ming China.
```

## Edo and the Merchant Economy

Peace brought growth. **Edo** grew into one of the largest cities in the world, with perhaps a million people by the early eighteenth century, swelled by the households of daimyō and samurai and the merchants and artisans who served them. **Osaka** became the commercial centre, where domain rice was sold and where merchants traded rice on a sophisticated exchange, whose futures trading the shogunate formally authorised in 1730, which some historians see as one of the earliest futures markets. Merchant houses such as the Mitsui, founded in the seventeenth century, grew wealthy as bankers and drapers, and some became the great business conglomerates of modern Japan.

Literacy spread widely. Temple schools, *terakoya*, taught reading, writing, and arithmetic to children of commoners, and by the nineteenth century a large share of the population could read (estimates vary widely; one often-cited figure is about 40 per cent of men and 10 per cent of women by the 1860s, with higher rates in the cities), an unusually high level for a pre-industrial society.

## The Floating World

Urban merchant culture produced a vibrant popular culture centred on the pleasure quarters and theatres, known as the ***ukiyo***, the "floating world", a term that had once meant the sorrowful, transient world in Buddhist thought but came to mean living for pleasure in the moment.

- **Kabuki** theatre, with its elaborate costumes and stylised acting, and the puppet theatre, **bunraku**, for which the playwright **Chikamatsu Monzaemon** wrote tragedies of merchants and lovers.
- The fiction of **Ihara Saikaku**, about the loves and money of townspeople.
- **Ukiyo-e** woodblock prints, mass-produced images of actors, courtesans, and landscapes, such as **Katsushika Hokusai**'s *Under the Wave off Kanagawa*, the "Great Wave", of around 1831, and Hiroshige's views of the road between Edo and Kyoto. When these prints reached Europe in the nineteenth century, they influenced painters such as Monet and Van Gogh.
- The poetry of **Matsuo Bashō** (1644–1694), master of the haikai verse later called haiku, who travelled through Japan writing poems and travel diaries such as *The Narrow Road to the Deep North*.

{{image: The Great Wave off Kanagawa | Katsushika Hokusai's Under the Wave off Kanagawa (about 1831), a woodblock print from the series Thirty-six Views of Mount Fuji.}}

## Rural Stress and Rebellion

The Tokugawa peace was not untroubled. Peasants paid heavy taxes in rice and suffered from periodic famines, such as the Tenmei famine of the 1780s and the Tenpō famine of the 1830s. Peasant uprisings, *ikki*, became more frequent, and in cities there were rice riots. In 1837 **Ōshio Heihachirō**, a former official and Confucian scholar in Osaka, led an uprising to help the starving poor; it was crushed, but it shocked the authorities. In the north, the **Ainu** of Hokkaido, increasingly exploited by Japanese merchants, rose in **Shakushain's revolt** in 1669 and were defeated by 1672.

## The Black Ships

In July 1853 four American warships under **Commodore Matthew Perry**, two of them steam-powered, the "black ships", entered Edo Bay and demanded that Japan open its ports. Perry returned in 1854 with a larger fleet, and the shogunate signed the **Treaty of Kanagawa**, opening two ports. In 1858 the shogunate agreed to treaties with the United States and European powers that gave foreigners trading rights and extraterritoriality, exempting them from Japanese law, the "unequal treaties".

The shogunate's inability to resist the foreigners discredited it. Opponents in the domains of Satsuma and Chōshū rallied around the emperor, at first under the slogan "revere the emperor, expel the barbarians"; after Western bombardments in 1863–64 they turned to Western arms, and in 1867–1868 they overthrew the last shogun, restoring imperial rule in the **Meiji Restoration**, the subject of a later chapter.

```checkpoint
q: What was the "floating world" (ukiyo)?
a: The Buddhist monasteries that Nobunaga destroyed.
x: Ukiyo once had a Buddhist sense of a transient world, but in Edo it meant urban pleasure culture.
a*: The urban pleasure culture of theatres and pleasure quarters, expressed in kabuki, bunraku, Saikaku's fiction, and ukiyo-e prints.
a: The artificial island of Dejima.
x: Dejima was the Dutch trading post at Nagasaki.
a: The rice exchange at Osaka.
x: The rice exchange was commercial; the floating world was a culture of entertainment and art.
hint: Think of woodblock prints of actors and courtesans.
why: Merchant wealth in the cities created a vibrant popular culture that later influenced European art.
---
q: Why did Perry's arrival in 1853 lead to the fall of the shogunate?
a: Because Perry conquered Edo and deposed the shogun.
x: Perry used the threat of force; the shogun was overthrown by Japanese opponents.
a: Because the emperor invited the Americans to Japan.
x: The anti-shogunate movement rallied around the emperor under the slogan "expel the barbarians".
a: Because the Dutch left Japan.
x: The Dutch were not the cause; the shogunate's weakness before the Western powers was.
a*: Because the shogunate's inability to resist the foreigners, and its acceptance of unequal treaties, discredited it, and Satsuma and Chōshū rallied around the emperor to overthrow it.
hint: Think about "revere the emperor, expel the barbarians".
why: Foreign pressure exposed the shogunate's weakness and gave its domestic rivals a cause.
```

## Further exploration

- **Conrad Totman, *Early Modern Japan* (1993).** A comprehensive history of the Tokugawa period.
- **Ronald P. Toby, *State and Diplomacy in Early Modern Japan* (1984).** Tokugawa diplomacy with Korea, China, and the Ryukyus, and the myth of sakoku.
- **Marius B. Jansen, *The Making of Modern Japan* (2000).** From the Tokugawa to the present.
- **Constantine Vaporis, *Tour of Duty: Samurai, Military Service in Edo, and the Culture of Early Modern Japan* (2008).** Alternate attendance and its effects.
- **Matsuo Bashō, *The Narrow Road to the Deep North and Other Travel Sketches*, trans. Nobuyuki Yuasa (1966).** Bashō's travel diaries.$em_tokugawa_master$,
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
  select $em_tokugawa_quiz$[
    {"type": "mcq", "prompt": "What was the purpose of Hideyoshi's 'sword hunt' of 1588?", "options": ["To recruit samurai for the conquest of the Philippines", "To ban Christianity", "To disarm the peasants and separate warriors from farmers", "To open Japan to European trade"], "answerIndex": 2, "explanation": "The sword hunt helped freeze social status after a century of civil war.", "id": "q1"},
    {"type": "mcq", "prompt": "Where were Dutch traders confined from 1641?", "options": ["Dejima, an artificial island in Nagasaki harbour", "Edo castle", "The island of Hokkaido", "Osaka's rice exchange"], "answerIndex": 0, "explanation": "The Dutch, who did not seek to spread Christianity, were the only Europeans allowed to trade.", "id": "q2"},
    {"type": "mcq", "prompt": "What was rangaku?", "options": ["A form of kabuki theatre", "The Tokugawa land tax", "A Buddhist sect banned in 1614", "'Dutch learning', the study of European science and medicine through the Dutch"], "answerIndex": 3, "explanation": "Sugita Genpaku's 1774 translation of a Dutch version of a German anatomy text was a landmark of rangaku.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Commodore Perry demand when his ships entered Edo Bay in 1853?", "options": ["That Japan convert to Christianity", "That Japan open its ports", "That the emperor move to Washington", "That Japan cede Hokkaido to the United States"], "answerIndex": 1, "explanation": "The Treaty of Kanagawa of 1854 opened two ports; the unequal treaties of 1858 followed.", "id": "q4"},
    {"type": "open", "prompt": "Was Tokugawa Japan a 'closed country'?", "rubric": "A strong answer explains the 1614 ban on Christianity, Shimabara, the expulsion of the Portuguese and the Dejima restriction; notes that sakoku was coined only in 1801; and discusses the 'four gates' (Arano) and Toby's work on diplomacy (Dutch and Chinese at Nagasaki, Korea via Tsushima, Ryukyu via Satsuma, the Ainu via Matsumae) and rangaku, concluding that the policy was controlled contact rather than isolation.", "id": "q5"},
    {"type": "open", "prompt": "How did peace under the Tokugawa reshape Japanese society and culture?", "rubric": "A strong answer discusses alternate attendance and its economic effects, the status order and its fluid reality, the growth of Edo and Osaka, the rice exchange and merchant houses like Mitsui, terakoya literacy, the floating world (kabuki, bunraku, Saikaku, ukiyo-e, Bashō), and the strains of famine, ikki and Ōshio's rising.", "id": "q6"}
  ]$em_tokugawa_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/tokugawa-shogunate', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
