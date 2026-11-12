-- Trading Companies and Empires: the VOC and the East India Company — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/trading-companies-and-empires-the-voc-and-the-east-india-company @ research/advanced/read.
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
    'history/early-modern-period/trading-companies-and-empires-the-voc-and-the-east-india-company',
    'research',
    'advanced',
    'read',
    $em_companies_master$> **Two private companies**, founded within two years of each other, became among the most powerful organisations in the world. The Dutch **Vereenigde Oostindische Compagnie** (VOC, United East India Company) and the English **East India Company** were chartered to trade with Asia, but they also raised armies, built forts, made war and peace, and governed territories. The Dutch company conquered the spice islands of Indonesia; the English one conquered India. This chapter explains how joint-stock companies worked, follows both companies from trading posts to territorial power, and looks at their histories from the perspectives of the Asian rulers, merchants, and peoples they traded with, fought, and ruled. It also asks what it means for a corporation to have an empire.

## The Joint-Stock Company

Long-distance trade with Asia was immensely profitable and immensely risky: voyages took years, and ships were lost to storms, disease, and war. Merchants spread the risk by pooling capital. The **East India Company**, chartered by Elizabeth I on 31 December 1600, was granted a monopoly of English trade east of the Cape of Good Hope. The Dutch **VOC**, founded in 1602 by merging several rival companies, went further: its shares could be bought and sold on the new **Amsterdam exchange**, and by 1612 its capital was permanent rather than raised voyage by voyage and its investors had limited liability. The VOC is often called the first modern public company, though earlier share companies existed.

Both companies were given powers of states. The VOC's charter allowed it to build forts, maintain armies, make treaties with Asian rulers, and wage war. The historian Philip Stern has called the English company a "company-state", a body that saw itself as a sovereign power, not merely a business.

## The Asian Trading World

The companies entered an Asian trading world that was older, larger, and richer than Europe's. As earlier chapters described, Gujarati, Tamil, Arab, Persian, Armenian, Chinese, Malay, and Javanese merchants traded textiles, spices, pepper, porcelain, silk, and rice across a vast network. Europeans had little that Asians wanted except silver, which came from the Americas. The companies' early profits came largely from carrying goods within Asia, the "country trade", as well as shipping goods to Europe.

## The VOC and the Spice Islands

The VOC aimed to monopolise the most valuable spices: cloves, nutmeg, mace, and cinnamon. Its governor-general **Jan Pieterszoon Coen** seized the Javanese port of Jayakarta in 1619 and built on its ruins the VOC's Asian headquarters, **Batavia**, now Jakarta.

To control nutmeg, which grew only on the tiny **Banda Islands**, Coen led an invasion in 1621. The Bandanese, who had traded with many partners and resisted Dutch demands for a monopoly, were killed, starved, enslaved, or driven into exile; of a population usually estimated at 13,000 to 15,000, perhaps 1,000 remained. The VOC divided the nutmeg groves into plantations worked by enslaved people brought from elsewhere in Asia. Historians and the Indian writer Amitav Ghosh, in *The Nutmeg's Curse* (2021), have described the conquest as genocide. In 1623, on the island of **Ambon**, VOC officials tortured and executed ten Englishmen, nine Japanese mercenaries, and a Portuguese man for an alleged plot, an incident that poisoned Anglo-Dutch relations for decades.

The VOC built a network across Asia: in Ceylon (Sri Lanka) for cinnamon, at Dejima in Japan, at the Cape of Good Hope from 1652, where its settlement dispossessed the Khoikhoi and imported enslaved people from Madagascar, India, and Indonesia, and on Taiwan. Batavia depended on Chinese merchants, artisans, and sugar workers. In 1740, amid economic crisis and fear of a Chinese uprising, VOC soldiers, Dutch residents, and members of other Batavian groups massacred more than ten thousand of the city's Chinese inhabitants.

Asian powers could defeat the company. In 1661–62 the Ming loyalist commander **Zheng Chenggong** (Koxinga) besieged Fort Zeelandia and expelled the Dutch from Taiwan, a victory the historian Tonio Andrade has called China's first great victory over the West. In Japan, the VOC was allowed to trade only on Tokugawa terms, confined to Dejima. Weighed down by debt, corruption, and war with Britain, the VOC was dissolved in 1799.

```checkpoint
q: What made the Dutch VOC different from earlier trading ventures?
a*: Its shares were traded on the Amsterdam exchange, by 1612 its capital was permanent and investors had limited liability, while it held state-like powers to make war and treaties.
a: It was owned and run directly by the Dutch king.
x: The Dutch Republic had no king; the VOC was a private company with state powers.
a: It traded only within Europe.
x: The VOC traded with Asia, east of the Cape of Good Hope.
a: It refused to use military force.
x: The VOC built forts, kept armies, and conquered territory.
hint: Think of permanent capital and tradable shares.
why: The VOC combined a new form of capitalism with the powers of a state.
---
q: What happened in the Banda Islands in 1621?
a: The Bandanese expelled the Dutch permanently.
x: The Dutch conquered Banda; it was in Taiwan that Zheng Chenggong expelled them.
a: The English and Dutch agreed to share the nutmeg trade peacefully.
x: The two companies were bitter rivals, as the Ambon executions of 1623 showed.
a*: A VOC invasion under Coen killed, enslaved, or exiled most of the Bandanese to secure a monopoly of nutmeg.
a: The VOC bought the islands from Portugal.
x: The Dutch took Banda by force from the Bandanese.
hint: Think of nutmeg and monopoly.
why: The conquest of Banda shows the violence behind the spice trade, now widely described as genocide.
```

## The English Company in India

The English company did less well in the spice islands and turned to India, where it bought cotton textiles, indigo, and saltpetre. It depended on the permission of Indian rulers: the Mughal emperor Jahangir allowed it to trade at **Surat** in 1613, and it built bases at Madras (1639), Bombay (from 1668), and Calcutta (1690).

When the company tried to use force against the Mughals in the 1680s, in what is called Child's War after its governor Sir Josiah Child, Aurangzeb's forces defeated it, and the company had to beg the emperor's pardon and pay a fine. For most of a century the English were one group of foreign merchants among many, subordinate to Indian powers.

That changed after the death of Aurangzeb, as Mughal power fragmented into successor states. In the 1740s and 1750s the English and French companies, the latter led by **Joseph-François Dupleix** at Pondicherry, fought for influence in southern India by backing rival Indian princes, training Indian soldiers, **sepoys**, in European drill.

In Bengal, the richest province of India, the young nawab **Siraj ud-Daula** seized Calcutta in 1756. The company's commander **Robert Clive** retook it and conspired with the nawab's general **Mir Jafar** and the great banking house of the **Jagat Seths**. At **Plassey** in 1757, Mir Jafar's troops stood aside, and Clive won. Mir Jafar became nawab and paid the company and its officers enormous sums. After defeating the Mughal emperor and his allies at Buxar in 1764, the company received in 1765 the **diwani**, the right to collect the revenue of Bengal, Bihar, and Orissa, as the chapter on the Mughals described.

## Company Rule

Now a company of merchants ruled tens of millions of people. Its servants made fortunes, returning to Britain as "nabobs". When drought struck Bengal in 1769–1770, the company continued to collect revenue, and the **famine** that followed killed a vast number of people, by the company's own estimates a third of the population, some 10 million people; modern estimates run from about 1 million (Rajat Datta proposes 1.2 million) to 10 million. The historian William Dalrymple notes that the Hindustani word *lut*, "loot", entered the English language in this period.

Scandal and near-bankruptcy led Parliament to intervene. The **Regulating Act** (1773) and **Pitt's India Act** (1784) brought the company under government supervision. Its first governor-general of Bengal, **Warren Hastings**, was impeached by the House of Commons in 1787 for corruption and cruelty, with Edmund Burke as his chief prosecutor; his trial before the House of Lords began in 1788, dragged on until 1795, and ended in his acquittal.

Indian rulers resisted. The rulers of **Mysore**, **Hyder Ali** and his son **Tipu Sultan**, modernised their armies, sought French alliances, and used iron-cased rockets so effectively that the British studied and adapted them. Tipu was killed when the British stormed his capital, Seringapatam, in 1799. The **Marathas** were defeated in a series of wars, the last of which (1817–1818) broke their power with the Peshwa's surrender in 1818. By then the company was the dominant power in India.

Its trade turned to China, where the Qing confined European traders from 1757 to the port of Canton. To pay for Chinese tea without silver, the company grew opium in India for smugglers to sell in China, leading to the Opium Wars described in a later chapter. The company lost its trading monopolies in 1813 and 1833, and after the rebellion of 1857 the British crown took over its government of India; the company was dissolved in 1874.

{{image: Battle of Plassey | Robert Clive meets Mir Jafar after the battle of Plassey in 1757, in a painting by Francis Hayman from about 1760.}}

```checkpoint
q: Why did Clive win the battle of Plassey in 1757?
a: Because the British army vastly outnumbered the nawab's.
x: The nawab's army was much larger; the battle was decided by betrayal.
a*: Because he had conspired with the nawab's general Mir Jafar, whose troops stood aside, and with the Jagat Seth bankers.
a: Because the Mughal emperor sent troops to support the company.
x: The company fought the Mughal emperor and his allies at Buxar in 1764.
a: Because the French joined the British.
x: The French were the British company's rivals in India.
hint: Think of Mir Jafar.
why: Plassey was won by political alliances with Indian elites as much as by arms.
---
q: How did Tipu Sultan of Mysore resist the East India Company?
a: By signing a permanent alliance with the company.
x: Tipu fought the company in a series of wars until his death in 1799.
a: By converting to Christianity to win British support.
x: Tipu was a Muslim ruler; his resistance was military and diplomatic.
a: By moving his capital to Canton.
x: Canton was the Chinese port where the Qing confined European traders.
a*: By modernising his army, seeking French alliances, and using iron-cased rockets so effective that the British studied and adapted them.
hint: Think of rockets and the French.
why: Mysore shows that Indian states adopted new military technology and fought the company hard.
```

## A Corporate Empire

How should we understand an empire run by a company? Some historians, such as P. J. Cain and A. G. Hopkins, have stressed the role of "gentlemanly capitalism", the alliance of London finance and the landed elite, in British expansion. Others emphasise the role of Indian partners, bankers, merchants, soldiers, and rulers, without whom the company could not have conquered or governed. The company's army was overwhelmingly made up of Indian sepoys. Dalrymple has argued that its story is a warning about the power of corporations that escape political control.

For Indonesians, Sri Lankans, and South Africans, the VOC's legacy is likewise contested. In the Netherlands, Prime Minister Jan Peter Balkenende's praise of a "VOC mentality" in 2006 drew widespread criticism, and museums have revised their presentations of the period; the Amsterdam Museum dropped the term "Golden Age" in 2019.

## Further exploration

- **William Dalrymple, *The Anarchy: The Relentless Rise of the East India Company* (2019).** The company's conquest of India.
- **Philip J. Stern, *The Company-State: Corporate Sovereignty and the Early Modern Foundations of the British Empire in India* (2011).** The company as a sovereign power.
- **Femme S. Gaastra, *The Dutch East India Company: Expansion and Decline* (2003).** A history of the VOC.
- **Om Prakash, *European Commercial Enterprise in Pre-Colonial India* (1998).** The companies in India's economy.
- **Tonio Andrade, *Lost Colony: The Untold Story of China's First Great Victory over the West* (2011).** Zheng Chenggong and the Dutch in Taiwan.
- **Amitav Ghosh, *The Nutmeg's Curse: Parables for a Planet in Crisis* (2021).** The Banda conquest and its legacy.$em_companies_master$,
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
  select $em_companies_quiz$[
    {"type": "mcq", "prompt": "When was the English East India Company chartered?", "options": ["1602", "31 December 1600", "1757", "1858"], "answerIndex": 1, "explanation": "The Dutch VOC followed in 1602.", "id": "q1"},
    {"type": "mcq", "prompt": "Who expelled the Dutch VOC from Taiwan in 1662?", "options": ["The Kangxi emperor", "Tipu Sultan", "Zheng Chenggong (Koxinga)", "Jan Pieterszoon Coen"], "answerIndex": 2, "explanation": "Tonio Andrade calls it China's first great victory over the West.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened in Batavia in 1740?", "options": ["VOC soldiers, Dutch residents, and others massacred more than ten thousand Chinese inhabitants", "The VOC was dissolved", "The English captured the city", "Coen founded the city"], "answerIndex": 0, "explanation": "The massacre followed economic crisis and fear of a Chinese uprising.", "id": "q3"},
    {"type": "mcq", "prompt": "What happened when the English company fought the Mughals in Child's War in the 1680s?", "options": ["It conquered Delhi", "It won control of Bengal", "The French joined the Mughals", "Aurangzeb's forces defeated it and it had to beg pardon and pay a fine"], "answerIndex": 3, "explanation": "For most of a century the company remained subordinate to Indian powers.", "id": "q4"},
    {"type": "open", "prompt": "How did a trading company come to rule India?", "rubric": "A strong answer covers the company's early dependence on Mughal permission (Surat, Child's War), Mughal fragmentation after 1707, Anglo-French rivalry and sepoys, Plassey and the alliance with Mir Jafar and the Jagat Seths, Buxar and the diwani, the Bengal famine, parliamentary regulation and the Hastings trial, the wars with Mysore and the Marathas, and the role of Indian partners and soldiers.", "id": "q5"},
    {"type": "open", "prompt": "Compare the Dutch VOC and the English East India Company.", "rubric": "A strong answer compares their foundation and structure (permanent capital, shares, state-like powers), their strategies (VOC spice monopoly, Banda, Batavia, Ceylon, the Cape; EIC textiles and territorial rule in India), their violence, their dependence on and defeats by Asian powers (Zheng Chenggong, Tokugawa, Aurangzeb, Mysore), their ends (1799, 1874), and their contested legacies.", "id": "q6"}
  ]$em_companies_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/trading-companies-and-empires-the-voc-and-the-east-india-company', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
