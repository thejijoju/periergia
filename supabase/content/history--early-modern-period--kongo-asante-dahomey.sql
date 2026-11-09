-- Kongo, Asante, and Dahomey — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/kongo-asante-and-dahomey-west-africa-in-the-atlantic-age @ research/advanced/read.
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
    'history/early-modern-period/kongo-asante-and-dahomey-west-africa-in-the-atlantic-age',
    'research',
    'advanced',
    'read',
    $em_africa_master$> **West and Central Africa in the Atlantic age** were home to powerful states with their own politics, religions, armies, and diplomacy. The kingdom of **Kongo** became Christian on its own terms and sent ambassadors to Rome; Queen **Njinga** fought the Portuguese for decades; **Benin**, **Oyo**, **Asante**, and **Dahomey** grew rich and strong; and Islamic reformers in the savanna built new states and challenged the slave trade. All of them faced the same pressure: European demand for enslaved people, which some states controlled and profited from and which tore others apart. This chapter tells their histories from African perspectives, as far as the sources allow, and asks how the Atlantic slave trade shaped the states that took part in it.

## Kongo: A Christian African Kingdom

The kingdom of **Kongo**, south of the Congo River's mouth in what is now northern Angola and western Congo, was ruled by a king, the *manikongo*, from his capital at **Mbanza Kongo**. When Portuguese ships arrived in 1483, Kongo was a large, centralised state with provincial governors, a currency of *nzimbu* shells, and a sophisticated cloth industry.

In 1491 the king **Nzinga a Nkuwu** was baptised as João I. His son **Afonso I** (reigned about 1509–1542) made Christianity the religion of the kingdom, sent young nobles to study in Portugal, and corresponded with the kings of Portugal and the pope. His son Henrique was ordained and, with papal approval, became a bishop, one of the first Black African Catholic bishops. Kongo Christianity was not simply imported: Kongolese thinkers translated Christian ideas into their own religious vocabulary, saints were understood alongside ancestral spirits, and the church was run largely by Kongolese lay teachers. The historian John Thornton has argued that this was a genuinely African Christianity.

Afonso also saw the dangers of the Portuguese connection. In letters to the king of Portugal in 1526, he complained that Portuguese traders were kidnapping and enslaving his free subjects, even his own nobles and relatives, and tried to bring the trade under royal control. He did not oppose slavery as such, which existed in Kongo, but he wanted to control who was enslaved and sold.

Kongo maintained its own diplomacy in Europe. In 1608 its ambassador, **Antonio Manuel ne Vunda**, reached Rome after a journey of several years and died there days later, after a visit from Pope Paul V. A marble bust of him, modelled on his death mask, stands in the church of Santa Maria Maggiore.

From 1576 the Portuguese built a colony at **Luanda**, to the south, which became the largest slave port in Africa. In 1665, at the battle of **Mbwila**, Portuguese colonial forces defeated a Kongolese army and killed King António I. Kongo collapsed into civil wars between rival claimants, which produced many captives for the Atlantic trade.

In this crisis a young noblewoman, **Kimpa Vita**, baptised Dona Beatriz, claimed in 1704 to be possessed by Saint Anthony. She preached that Jesus and Mary were Kongolese, called for the reunification of the kingdom and the reoccupation of its ruined capital, and attracted thousands of followers. Seen as a threat by King Pedro IV and the Italian Capuchin missionaries, she was burned as a heretic in 1706. Pedro IV reunited the kingdom in 1709, though it never regained its former power. Many enslaved Kongolese taken to the Americas were Catholics; historians have traced their influence in the Stono rebellion in South Carolina in 1739 and in the Haitian Revolution.

## Queen Njinga

**Njinga** (about 1583–1663) was the sister of the ruler of **Ndongo**, a kingdom inland from Luanda under attack by the Portuguese and their allies. In 1622 she went to Luanda as her brother's envoy and negotiated a treaty; she was baptised there as Ana de Sousa. After her brother's death in 1624 she claimed power, and when the Portuguese backed a rival she fled east, conquered the kingdom of **Matamba**, and made it her base.

For three decades Njinga fought the Portuguese with remarkable skill, allying with the **Imbangala**, fearsome mercenary warbands, and adopting some of their rituals. When the Dutch seized Luanda in 1641, she allied with them, until the Portuguese retook the city in 1648. In 1656 she finally made peace with Portugal. She ruled as a king, sometimes dressing as a man and keeping male consorts dressed as women. As the historian Linda Heywood shows, she was a brilliant politician who used Christianity, Mbundu tradition, and Imbangala ritual to hold power. She remains a national heroine in Angola.

```checkpoint
q: What did King Afonso I of Kongo complain about in his letters to Portugal in 1526?
a*: That Portuguese traders were enslaving his free subjects, including nobles, and that the trade had to be brought under royal control.
a: That Portugal refused to buy any slaves from Kongo.
x: His complaint was the opposite: uncontrolled Portuguese slaving.
a: That the pope had refused to recognise Kongo as Christian.
x: Kongo had close relations with the papacy; Afonso's son became a bishop.
a: That the Dutch had seized Luanda.
x: The Dutch took Luanda in 1641, a century after Afonso's death.
hint: Think of who was being enslaved.
why: Afonso's letters show an African Christian king trying to control the slave trade's effects on his kingdom.
---
q: Who was Kimpa Vita?
a: A Portuguese governor of Luanda.
x: Kimpa Vita was a Kongolese noblewoman.
a: Queen of Matamba and ally of the Dutch.
x: That was Njinga, who died in 1663.
a*: A Kongolese prophet who claimed to be possessed by Saint Anthony, called for the kingdom's reunification, and was burned as a heretic in 1706.
a: An ambassador to Rome.
x: The ambassador who died in Rome in 1608 was Antonio Manuel ne Vunda.
hint: Think of Saint Anthony.
why: Kimpa Vita's movement shows how Kongolese Christianity responded to civil war and the slave trade.
```

## Benin

The kingdom of **Benin**, in what is now southern Nigeria (not the modern country of Benin), was ruled by a sacred king, the *oba*, from a large walled city. Its guilds of brass casters produced the famous plaques and heads now called the **Benin Bronzes**, many depicting the oba, his court, and the Portuguese traders who arrived from the 1480s. Benin traded pepper, cloth, and ivory, and for long periods restricted the sale of male captives, showing that African rulers could set limits on the trade. In 1897 a British "punitive expedition" sacked Benin City and looted thousands of its artworks, which were sold to museums across Europe and America. Their return has become a leading case in debates over restitution; Germany began returning objects to Nigeria in 2022.

{{image: Benin Bronzes | A brass plaque from the royal palace of Benin, part of the works looted by British forces in 1897.}}

## Oyo

North of the forest, the Yoruba empire of **Oyo** rose to power in the seventeenth and eighteenth centuries on the strength of its cavalry, with horses bought from the savanna to the north. The king, the *alaafin*, shared power with a council of nobles, the *Oyo Mesi*, whose leader could in certain circumstances require him to take his own life, an unusual constitutional check. Oyo dominated its neighbours, made **Dahomey** pay tribute from 1730, and sold captives through coastal ports. In the early nineteenth century it collapsed amid civil war and the expansion of the Sokoto Caliphate; the wars that followed sent many Yoruba into the Atlantic trade, especially to Cuba and Brazil, where Yoruba religion took root as Candomblé and Santería.

## Asante

In the forests of the Gold Coast, now Ghana, the Akan states had long mined and traded **gold**. Around 1700, **Osei Tutu**, ruler of Kumasi, united a confederacy of Akan states and defeated their overlord, Denkyira. According to tradition, his priest **Okomfo Anokye** brought down from the sky the **Golden Stool**, which embodied the soul of the Asante nation; it is still not sat upon, and remains the nation's most sacred object.

Asante expanded through the eighteenth century to rule most of modern Ghana, a population of several million. The *asantehene*, its king, governed through a council and an increasingly professional bureaucracy based at **Kumasi**, linked to the provinces by great roads radiating from the capital. Asante traded gold and kola nuts north to the Muslim savanna and sold war captives south to European forts on the coast, importing guns, cloth, and metal. Literate Muslim scholars served at the court. The historian Ivor Wilks has described it as a sophisticated state with its own ideas of policy and administration. Asante would fight the British repeatedly in the nineteenth century, culminating in the War of the Golden Stool led by the queen mother **Yaa Asantewaa** in 1900.

## Dahomey

The kingdom of **Dahomey**, of the Fon people, with its capital at **Abomey** in what is now the Republic of Benin, was the most militarised of these states. In the 1720s King **Agaja** conquered the coastal kingdoms of Allada and Hueda, taking the port of **Ouidah**, one of the busiest slave ports in Africa. Defeated by Oyo's cavalry, Dahomey paid tribute to Oyo from 1730 until the early nineteenth century.

Dahomey's kings tightly controlled the slave trade, which became a royal monopoly and a main source of state income. Their army included a corps of **women soldiers**, whom Europeans called "Amazons"; drawn from the palace women, they numbered several thousand by the nineteenth century and fought with muskets and blades. The annual royal ceremonies, the "customs", included the public execution of captives as offerings to royal ancestors, which European visitors described and abolitionists and slave-trade defenders alike used for their own arguments. The economic anthropologist Karl Polanyi saw Dahomey as a state that insulated its economy from the trade; historians such as Robin Law have shown how deeply Dahomey and Ouidah were entangled with Atlantic commerce, including Brazilian traders such as Francisco Félix de Souza, who settled at Ouidah.

```checkpoint
q: What was the Golden Stool?
a: The throne of the oba of Benin.
x: The oba ruled Benin; the Golden Stool belongs to Asante.
a*: The sacred object of the Asante nation, said to have descended from the sky to Osei Tutu through the priest Okomfo Anokye, embodying the nation's soul.
a: A gold mine owned by the Portuguese.
x: The Golden Stool is a sacred symbol, not a mine.
a: The seat of Dahomey's women soldiers.
x: Dahomey's women soldiers were a military corps; the Golden Stool is Asante's.
hint: Think of Asante's founding.
why: The Golden Stool symbolised the unity of the Asante confederacy and remains sacred today.
---
q: How did Dahomey take part in the Atlantic slave trade?
a: It refused to take part at all.
x: Dahomey was one of the trade's most important suppliers.
a: It was a Portuguese colony run from Luanda.
x: Dahomey was an independent African kingdom.
a: It sold only gold and kola nuts.
x: Gold and kola were Asante's main exports; Dahomey's was captives.
a*: Its kings conquered the port of Ouidah and made the sale of war captives a royal monopoly and a main source of income.
hint: Think of Ouidah.
why: Dahomey shows how a state could build its power on controlling the slave trade.
```

## Jihad, Reform, and the Savanna

In the savanna, Muslim scholars led reform movements that created new states. In **Futa Toro**, on the Senegal River, a revolution brought a Muslim clerical regime to power in the 1770s. Its leader, the *almami* **Abdul Qadir Kan**, forbade the sale of Muslims to European slave traders and sought to stop slave ships passing through his territory, reaching an agreement with the French in 1785. His objection was to the enslavement of Muslims, not to slavery itself, but it was a principled restriction on the Atlantic trade imposed by an African state, before the first abolition society was founded in Britain in 1787.

In 1804 the Fulani scholar **Usman dan Fodio** launched a jihad against the Hausa kings of what is now northern Nigeria, accusing them of corruption and unjust taxes. The result was the **Sokoto Caliphate**, by the mid-nineteenth century one of the largest states in Africa. His daughter **Nana Asma'u** (1793–1864), a poet and scholar in Arabic, Fulfulde, and Hausa, organised a network of women teachers who travelled to educate women in their homes. The Sokoto Caliphate also relied heavily on enslaved labour on plantations, one of the largest slave societies of the nineteenth century, as the historian Paul Lovejoy has shown.

## The Slave Trade and African States

How did the Atlantic trade shape these states? Historians disagree.

- Some, following **Walter Rodney**'s *How Europe Underdeveloped Africa* (1972), argue that the trade drained Africa of millions of young people, encouraged war and raiding, and fed a "gun-slave cycle" in which states needed guns to capture people and captives to buy guns.
- Others, such as **John Thornton**, stress that African rulers controlled the trade on their own coasts, set its terms, and were not simply victims; Europeans could not enter the interior and had to negotiate.
- Both can be true. Some states, like Dahomey and Asante, grew strong by controlling the trade; others, like Kongo, were torn apart by it; and the victims, millions of ordinary Africans captured in war and raids, had no say. Economists such as Nathan Nunn and Leonard Wantchekon have found that the regions most affected by the slave trades are poorer and have lower levels of trust today.

The historian Toby Green has argued that the trade also drained West Africa's economies through unequal exchange: Africans sold people, who produced wealth in the Americas for centuries, in return for consumer goods and currencies such as cowrie shells, whose value Europeans could inflate.

## Further exploration

- **John Thornton, *Africa and Africans in the Making of the Atlantic World, 1400–1800* (1992; 2nd ed. 1998).** African agency in the Atlantic world.
- **John Thornton, *The Kongolese Saint Anthony: Dona Beatriz Kimpa Vita and the Antonian Movement, 1684–1706* (1998).** Kimpa Vita and the Kongo civil wars.
- **Linda M. Heywood, *Njinga of Angola: Africa's Warrior Queen* (2017).** A biography of Njinga.
- **Ivor Wilks, *Asante in the Nineteenth Century: The Structure and Evolution of a Political Order* (1975).** The Asante state.
- **Robin Law, *Ouidah: The Social History of a West African Slaving "Port", 1727–1892* (2004).** Dahomey's port.
- **Toby Green, *A Fistful of Shells: West Africa from the Rise of the Slave Trade to the Age of Revolution* (2019).** A recent history from West African sources.$em_africa_master$,
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
  select $em_africa_quiz$[
    {"type": "mcq", "prompt": "Which Kongolese king complained in 1526 that Portuguese traders were enslaving his free subjects?", "options": ["Afonso I", "Pedro IV", "António I", "Osei Tutu"], "answerIndex": 0, "explanation": "Afonso tried to bring the trade under royal control.", "id": "q1"},
    {"type": "mcq", "prompt": "Where did Queen Njinga make her base after fleeing the Portuguese-backed rival in Ndongo?", "options": ["Kumasi", "Abomey", "Matamba", "Luanda"], "answerIndex": 2, "explanation": "From Matamba she fought the Portuguese for three decades, allying with the Dutch in the 1640s.", "id": "q2"},
    {"type": "mcq", "prompt": "What were the Benin Bronzes?", "options": ["Coins of the Asante kingdom", "Brass plaques and heads made by guilds of the kingdom of Benin, looted by British forces in 1897", "Portuguese cannons", "Statues of Dahomey's women soldiers"], "answerIndex": 1, "explanation": "Their return has become a leading case in debates over restitution.", "id": "q3"},
    {"type": "mcq", "prompt": "Which leader founded the Sokoto Caliphate after launching a jihad in 1804?", "options": ["Abdul Qadir Kan", "Agaja", "Okomfo Anokye", "Usman dan Fodio"], "answerIndex": 3, "explanation": "His daughter Nana Asma'u built a network of women teachers.", "id": "q4"},
    {"type": "open", "prompt": "How did the Atlantic slave trade shape the states of West and Central Africa?", "rubric": "A strong answer compares states that controlled and profited from the trade (Dahomey, Asante, Oyo) with those it destabilised (Kongo after Mbwila), rulers who limited it (Afonso, Benin, Abdul Qadir Kan), and weighs Rodney's gun-slave cycle, Thornton's emphasis on African agency, Green's unequal exchange, and Nunn's evidence of long-term effects, while remembering the millions of victims.", "id": "q5"},
    {"type": "open", "prompt": "Choose two of Kongo, Njinga's Ndongo-Matamba, Asante, and Dahomey, and compare how their rulers built and kept power.", "rubric": "A strong answer uses specific evidence: Kongo's Christianity, diplomacy, and civil wars; Njinga's diplomacy, warfare, Imbangala alliance, and use of religion and gender; Asante's Golden Stool, confederacy, bureaucracy, roads, and gold trade; Dahomey's army, women soldiers, royal monopoly, and Ouidah, and relations with Oyo.", "id": "q6"}
  ]$em_africa_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/kongo-asante-and-dahomey-west-africa-in-the-atlantic-age', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
