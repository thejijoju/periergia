-- Russia from Muscovy to Catherine the Great — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/russia-from-muscovy-to-catherine-the-great @ research/advanced/read.
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
    'history/early-modern-period/russia-from-muscovy-to-catherine-the-great',
    'research',
    'advanced',
    'read',
    $em_russia_master$> **Between 1450 and 1800** a minor principality that had paid tribute to Mongol khans became the largest state on earth, stretching from the Baltic to the Pacific and into Alaska. Russia's expansion was the work of grand princes and tsars, Cossacks and fur traders, and millions of peasants bound into serfdom. It was also experienced from the other side, by Tatars, Bashkirs, Siberian peoples, Ukrainians, and Poles. This chapter follows Moscow's rise from Ivan III to Catherine the Great: the end of Tatar overlordship, Ivan the Terrible, the conquest of Kazan and Siberia, the Time of Troubles, serfdom, Peter the Great's revolution from above, and Catherine's empire. It ends with the old question of whether Russia belongs to "Europe".

## Moscow and the Tatar Yoke

As the chapter on the Mongol empire described, the princes of Rus' paid tribute to the khans of the **Golden Horde** from the 1240s. Moscow rose by serving the khans as tax collectors, then outgrew them. **Ivan III** (reigned 1462–1505) annexed the great merchant republic of **Novgorod** in 1478. In 1480, at the **Ugra River**, his army faced that of the Great Horde's khan, Ahmed, and after failing to force a crossing the khan withdrew without a pitched battle. Russian tradition dates the end of the "Tatar yoke" to this stand-off.

Ivan married **Sophia Palaiologina**, niece of the last Byzantine emperor, adopted the double-headed eagle, and began to use the title **tsar**, from "Caesar". Some churchmen later spoke of Moscow as a "Third Rome", heir to Rome and Constantinople as the centre of true Orthodox Christianity. Historians such as Donald Ostrowski argue, though, that Muscovy also took much from the Mongols, such as its postal relays and parts of its administration, and many Tatar nobles entered Russian service.

## Ivan IV and the Conquest of Kazan

**Ivan IV** (reigned 1533–1584), known in English as "the Terrible" (the Russian *Grozny* means something closer to "awe-inspiring"), was crowned tsar in 1547. In 1552 his armies stormed **Kazan**, capital of a Muslim Tatar khanate on the Volga, and in 1556 took **Astrakhan** at the river's mouth. For the first time Moscow ruled a large Muslim population, and the Volga route to the Caspian lay open. St Basil's Cathedral in Red Square was built to celebrate the victory over Kazan. For the Tatars, 1552 was a catastrophe: the city was sacked, mosques were destroyed, and surviving Tatars were expelled from the walled city and resettled outside it.

Ivan's later reign was marked by terror. From 1565 to 1572 he divided the realm and gave part of it, the **oprichnina**, to a private force, the *oprichniki*, who wore black and rode with dogs' heads and brooms, symbols of sniffing out and sweeping away treason. They killed nobles, churchmen, and peasants, and in 1570 massacred thousands in Novgorod. A long war for Livonia on the Baltic ended in defeat, and in 1581, by most accounts, Ivan struck and killed his own son and heir in a rage.

## Across Siberia to the Pacific

In 1581–1582 a band of **Cossacks**, free frontier warriors, led by **Yermak** and financed by the Stroganov merchant family, attacked the Khanate of **Sibir** beyond the Urals. Over the following decades Russian traders, Cossacks, and soldiers moved east along the rivers, building wooden forts, and reached the Pacific, on the Sea of Okhotsk, in 1639. The prize was fur, above all sable, the "soft gold" that at its mid-seventeenth-century peak supplied more than a tenth of the state's revenue.

The peoples of Siberia, such as the Khanty, Evenki, Yakut (Sakha), and Chukchi, were made to pay a tribute in furs, the *yasak*, often enforced by taking hostages. Epidemics, especially smallpox, and violence reduced many communities, and some, like the Chukchi, resisted well into the eighteenth century. The historian Yuri Slezkine has traced how Russians alternately saw these "small peoples of the North" as savages to be civilised and as people uncorrupted by civilisation.

On the Amur, Russian expansion met the **Qing** empire. After clashes, the two empires signed the **Treaty of Nerchinsk** in 1689, the first treaty between China and a European state, negotiated in Latin, with Jesuits interpreting for the Qing. It kept Russia out of the Amur valley for nearly 170 years, until 1858, and opened a regulated caravan trade.

{{image: Yermak Timofeyevich | Yermak Timofeyevich, leader of the Cossack campaign of 1582 into Siberia, as imagined by later artists.}}

## The Time of Troubles and the Romanovs

The old dynasty died out in 1598. The **Time of Troubles** that followed brought famine (1601–1603), pretenders claiming to be Ivan's dead son Dmitry, civil war, and foreign invasion: Polish-Lithuanian forces occupied Moscow from 1610 to 1612. A popular militia raised by the merchant **Kuzma Minin** and the prince **Dmitry Pozharsky** drove them out, and in 1613 an assembly elected the young **Michael Romanov** tsar. His dynasty ruled until 1917.

## Serfdom

The Romanovs' rule rested on a bargain with the landowning nobility, who served the tsar in war and administration and in return gained control of the peasants. Restrictions on peasant movement had grown since the late fifteenth century; the law code of **1649**, the *Ulozhenie*, bound peasants permanently to their lords' estates. By the eighteenth century about half of Russia's peasants were **serfs**, who could be bought, sold, and punished by their masters. Serfdom spread in eastern Europe at the same time as it vanished in the west, and as slavery grew in the Americas; historians such as Peter Kolchin have compared Russian serfdom with American slavery.

Peasants resisted by flight to the frontier and by revolt. In 1670–1671 the Cossack **Stenka Razin** led a great rising along the Volga. The church was also split, when Patriarch Nikon's reforms of ritual in the 1650s were rejected by the **Old Believers**, many of whom were persecuted or died in self-immolations rather than accept them.

In 1648 the Cossacks of Ukraine, under **Bohdan Khmelnytsky**, rose against Polish rule, a revolt accompanied by massacres of Jews and Poles. In 1654, at Pereiaslav, Khmelnytsky accepted the protection of the tsar. Russian and Ukrainian historians have read this agreement very differently, as a reunion of brother peoples or as a treaty between equals that Moscow later betrayed, and the argument remains politically charged.

```checkpoint
q: What was the yasak?
a*: A tribute in furs imposed on the peoples of Siberia, often enforced by taking hostages.
a: The Russian law code of 1649.
x: The 1649 law code was the Ulozhenie, which bound peasants to the land.
a: Peter the Great's tax on beards.
x: Peter did tax beards, but the yasak was the Siberian fur tribute.
a: The Cossack council of Ukraine.
x: The yasak was a tribute, not an institution of the Cossacks.
hint: Think of sable, the "soft gold".
why: The fur tribute financed the Russian state and shaped its relations with Siberia's Indigenous peoples.
---
q: What did the Ulozhenie of 1649 do?
a: It abolished serfdom in Russia.
x: Serfdom was abolished only in 1861; the Ulozhenie entrenched it.
a: It made Peter the Great emperor.
x: Peter took the title of emperor in 1721.
a*: It bound peasants permanently to their lords' estates, completing the legal foundation of serfdom.
a: It ended the Time of Troubles by electing Michael Romanov.
x: Michael Romanov was elected in 1613, before the Ulozhenie.
hint: Think of what the nobility gained in return for service.
why: Serfdom was the core of the bargain between the tsars and the nobility for two centuries.
```

## Peter the Great

**Peter I** (reigned 1682–1725, alone from 1696), over two metres tall and endlessly energetic, set out to make Russia a great power on the European model. In 1697–1698 he travelled incognito with a **Grand Embassy** through the Dutch Republic and England, working in shipyards and visiting workshops and museums. On his return he cut off his nobles' beards and ordered them into western dress.

His great project was war with **Sweden**, then the dominant power of the Baltic. The **Great Northern War** (1700–1721) began with a humiliating defeat at Narva, but Peter rebuilt his army on a new model, with conscription, and created a navy. In 1709 he crushed Charles XII at **Poltava** in Ukraine, where the Cossack leader Ivan Mazepa had sided with the Swedes. The Treaty of Nystad in 1721 gave Russia Livonia, Estonia, and Ingria on the eastern Baltic, and Peter took the title of emperor.

In 1703 Peter founded **St Petersburg** on marshland at the mouth of the Neva and made it his capital, what later writers called his "window on Europe". It was built by forced labour from across the empire, and many workers died. Peter subordinated the church to a state council, the Holy Synod, in place of the patriarch; created a **Table of Ranks** (1722) in which status depended on service; founded an Academy of Sciences; and imposed heavy new taxes, including a poll tax on every male of the tax-paying population. When his son **Alexei** fled abroad in opposition, Peter had him brought back, tried, and tortured; he died in prison in 1718.

Peter's court included a man whose life shows how wide Russia's connections were. **Abram Gannibal**, born in Africa, perhaps at Logone south of Lake Chad (Ethiopia and Eritrea have also been proposed), was taken as a child to Constantinople and then to Russia, where Peter became his godfather. He was educated in France as a military engineer and became a general. His great-grandson was the poet **Alexander Pushkin**.

## Catherine the Great

**Catherine II** (reigned 1762–1796) was a German princess who married the heir to the throne and seized power in a coup against her husband, Peter III, who died, almost certainly murdered, soon after. She corresponded with Voltaire and Diderot, bought Diderot's library, and in 1767 summoned a Legislative Commission with delegates from many social groups and peoples of the empire, for which she wrote an *Instruction* drawing heavily on Montesquieu. The commission produced no new code, and her enlightened ideals did little for the serfs; she bound the peasants of Left-Bank Ukraine to the land (1783) and gave estates and serfs to her favourites, and her Charter of the Nobility (1785) confirmed noble privileges.

The greatest challenge to her rule came from the frontier. In 1773–1775 the Don Cossack **Yemelyan Pugachev**, claiming to be the dead Peter III, led a vast rebellion of Cossacks, serfs, factory workers in the Urals, and non-Russian peoples, including **Bashkirs** under the poet-warrior **Salavat Yulaev**, now a national hero in Bashkortostan. The rebellion was crushed and Pugachev executed in Moscow.

Catherine's wars with the **Ottomans** won the north coast of the Black Sea, and in 1783 she annexed the **Crimean khanate**, the most powerful, and one of the last, of the Golden Horde's successor states; many Crimean Tatars emigrated to Ottoman lands. With Prussia (and, in 1772 and 1795, Austria) she partitioned **Poland-Lithuania** in 1772, 1793, and 1795, erasing it from the map. At the same time she treated Islam as a recognised religion of the empire, creating in 1788 a Muslim Spiritual Assembly, opened at Ufa in 1789, to oversee mosques and clergy, a policy of co-opting Muslim elites that the historian Robert Crews has studied. Russian traders reached across the Bering Strait, founding a settlement on Kodiak Island in Alaska in 1784.

## Russia and "Europe"

Was Russia part of Europe? Peter and Catherine insisted it was, and eighteenth-century Russia became a European great power. Yet many Western travellers described it as "Asiatic" and despotic, and in the nineteenth century Russian thinkers themselves divided between "Westernisers" and "Slavophiles". Historians today tend to see Russia as a Eurasian empire, shaped by Byzantium, the Mongols, and the steppe as much as by the West, and ruling, by 1800, a population of many religions and languages. As the historian Andreas Kappeler has emphasised, Russia was a multi-ethnic empire long before it was a nation-state.

```checkpoint
q: Why did Peter the Great found St Petersburg?
a: To be closer to the Mongol khans.
x: The Golden Horde had long since broken up; Peter looked west.
a*: As a new capital and "window on Europe" on the Baltic coast he was winning from Sweden, built by forced labour.
a: Because Moscow was destroyed by the Swedes.
x: The Swedes never took Moscow; Peter chose a new site on the Baltic.
a: To escape from the Ottomans.
x: Peter's main enemy in founding the city was Sweden, not the Ottomans.
hint: Think of the Great Northern War and the sea.
why: St Petersburg symbolised Peter's turn toward Europe and Russia's arrival as a Baltic power.
---
q: Who joined Pugachev's rebellion of 1773–1775?
a: Only Moscow nobles opposed to Catherine.
x: The nobles were the main targets of the rebellion.
a: Swedish and Polish soldiers.
x: It was an internal rising of the frontier, not a foreign invasion.
a: The Old Believers alone.
x: Some Old Believers joined, but the rebellion was much broader.
a*: Cossacks, serfs, Ural factory workers, and non-Russian peoples such as the Bashkirs under Salavat Yulaev.
hint: Think of the frontier and the oppressed.
why: Pugachev's rebellion showed the depth of discontent among serfs and frontier peoples under Catherine.
```

## Further exploration

- **Geoffrey Hosking, *Russia: People and Empire, 1552–1917* (1997).** How empire shaped Russian identity.
- **Andreas Kappeler, *The Russian Empire: A Multi-Ethnic History* (1992; English trans. 2001).** Russia's many peoples.
- **Michael Khodarkovsky, *Russia's Steppe Frontier: The Making of a Colonial Empire, 1500–1800* (2002).** Russia and the peoples of the steppe.
- **Yuri Slezkine, *Arctic Mirrors: Russia and the Small Peoples of the North* (1994).** Siberia's Indigenous peoples and Russian views of them.
- **Lindsey Hughes, *Russia in the Age of Peter the Great* (1998).** The standard study of Peter's reign.
- **Isabel de Madariaga, *Russia in the Age of Catherine the Great* (1981).** Catherine's reign in depth.$em_russia_master$,
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
  select $em_russia_quiz$[
    {"type": "mcq", "prompt": "What happened at the Ugra River in 1480?", "options": ["Peter the Great defeated Sweden", "The Great Horde's khan withdrew from a stand-off with Ivan III, traditionally ending the 'Tatar yoke'", "Yermak conquered Sibir", "Michael Romanov was elected tsar"], "answerIndex": 1, "explanation": "Russian tradition dates Moscow's independence from the Horde to the stand-off on the Ugra.", "id": "q1"},
    {"type": "mcq", "prompt": "Which Muslim khanate did Ivan IV conquer in 1552?", "options": ["Kazan", "Crimea", "Bukhara", "Sibir"], "answerIndex": 0, "explanation": "The fall of Kazan opened the Volga and brought a large Muslim population under Moscow; Crimea was annexed only in 1783.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Treaty of Nerchinsk (1689)?", "options": ["Peace between Russia and Sweden", "Ukraine's union with Moscow", "The partition of Poland", "A treaty between Russia and Qing China that fixed the frontier north of the Amur and kept Russia out of the Amur valley"], "answerIndex": 3, "explanation": "Negotiated in Latin, with Jesuits interpreting for the Qing, it was China's first treaty with a European state.", "id": "q3"},
    {"type": "mcq", "prompt": "Who was Abram Gannibal?", "options": ["A Cossack rebel", "Catherine the Great's husband", "An African-born godson of Peter the Great who became a general and was Pushkin's great-grandfather", "A Swedish king"], "answerIndex": 2, "explanation": "His life shows the reach of Peter's court and Russia's global connections.", "id": "q4"},
    {"type": "open", "prompt": "How did Muscovy become the largest state on earth, and how was its expansion experienced by the peoples it conquered?", "rubric": "A strong answer traces the rise of Moscow under the Golden Horde, Ivan III and the Ugra, the conquest of Kazan and Astrakhan, the Cossack advance across Siberia for fur and the yasak, Nerchinsk, Ukraine after 1654, Peter's Baltic conquests, and Catherine's gains from the Ottomans, Crimea, and Poland; and it includes the perspectives of Tatars, Siberian peoples, Bashkirs, Ukrainians, and Poles, including violence, epidemics, resistance, and co-optation.", "id": "q5"},
    {"type": "open", "prompt": "Was Peter the Great's 'westernisation' a revolution from above? Assess its achievements and costs.", "rubric": "A strong answer discusses the Grand Embassy, beards and dress, the Great Northern War and Poltava, conscription and the navy, St Petersburg built by forced labour, the Holy Synod, the Table of Ranks, the Academy, the poll tax and serfdom, the fate of Alexei, and continuities with Muscovite rule, reaching a balanced judgment.", "id": "q6"}
  ]$em_russia_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/russia-from-muscovy-to-catherine-the-great', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
