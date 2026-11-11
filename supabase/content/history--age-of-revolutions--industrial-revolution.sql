-- The Industrial Revolution — canonical master article, co-written and human-reviewed.
-- history/age-of-revolutions/the-industrial-revolution @ research/advanced/read.
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
    'history/age-of-revolutions/the-industrial-revolution',
    'research',
    'advanced',
    'read',
    $ar_indrev_master$> **The transformation that made the modern world.** Between about 1760 and 1840, Britain moved from hand production to machines driven by water and then by coal and steam, and gathered workers into factories run by the clock. This chapter asks why it began in Britain, follows the breakthroughs in cotton, steam, iron, canals and railways, and meets the people who paid for them: child workers, the poor of Manchester, the Luddites and the crowd at Peterloo. It follows cotton to the enslaved growers of the American South, the hand-weavers of India and the mills of Egypt, and ends with the debates over living standards, the environment and the "Great Divergence" between the West and the rest.

## A World of Hand-Made Cloth

Before the Industrial Revolution, most of the world's manufacturing took place in China and India. Mughal India produced, on broad estimates, around a quarter of global industrial output in the early eighteenth century. The very word *calico* comes from Calicut (Kozhikode) in south-western India. As the chapter on Trading Companies and Empires describes, the English East India Company built its business on Indian textiles. After the 1660s it brought cheap calico and chintz to Britain, and by the 1760s cloth made up over three-quarters of its exports. Indian textiles were also bartered for enslaved Africans.

With Indian labour costs about one-fifth of Britain's, British producers could not compete. Wool and linen interests petitioned Parliament, and a mob stormed the Company's offices. Parliament responded with the **Calico Acts** of 1700 and 1721, which banned most imports of printed Indian cottons and then the sale of most cotton cloth. Raw cotton was exempt, and the Acts were repealed only in 1774. The exemption fed a Lancashire industry making fustian, with a linen warp and a cotton weft, because British spinners could not yet make cotton thread strong enough for the warp.

The name came early: the French envoy Louis-Guillaume Otto used the phrase in 1799, and in 1845 Friedrich Engels described "an industrial revolution, a revolution which … changed the whole of civil society".

## Why Britain?

**Institutions.** After 1688 Britain enjoyed political stability, secure property rights, a financial market built on the Bank of England's management of the national debt, and no internal tariffs, which France kept until 1789.

**Coal.** In 1700, five-sixths of the coal mined in the world was mined in Britain. Without it, Britain would have run out of suitable river sites for water mills by the 1830s. The Netherlands, rich and literate but without coal, did not industrialise.

**People and land.** Britain's population grew by 280 per cent between 1550 and 1820, against 50–80 per cent elsewhere in Western Europe. New materials freed scarce land: coal, coke, imported cotton, brick and slate replaced wood, charcoal, flax, peat and thatch.

**Wages and energy.** The economic historian **Robert C. Allen**, in *The British Industrial Revolution in Global Perspective* (2009), argued that Britain combined unusually high wages with unusually cheap energy. That made it worth inventing machines that saved labour and burned coal, such as the spinning jenny and the steam engine. Critics have replied that wages were not especially high in spinning or construction, and a 2022 study found that industry grew in areas with low wages and high mechanical skills.

**Useful knowledge.** **Joel Mokyr**, who shared the 2025 Nobel Memorial Prize in Economic Sciences, emphasises ideas. In his account of an "Industrial Enlightenment", scientists and practical businessmen came to share a common intellectual culture. Clubs such as the Lunar Society of Birmingham (founded around 1765) linked them, and religious Dissenters, barred or discouraged from Oxford and Cambridge, turned to manufacturing and banking.

**Colonies and slavery.** In *Capitalism and Slavery* (1944), the Trinidadian historian Eric Williams argued that the profits of slavery helped finance industrialisation. As the chapter on the Atlantic Slave Trade explains, the thesis has been fiercely contested, notably by Seymour Drescher's *Econocide* (1977). **Kenneth Pomeranz** made a different colonial argument, discussed below: the New World gave Britain land it did not have.

## Cotton and the Machines

The breakthroughs came first in cotton. In 1733 **John Kay** patented the flying shuttle, which roughly doubled a weaver's output and widened the gap between fast weaving and slow spinning. Unable to enforce his patents, Kay left for France in 1747.

Around 1764–65, at Stanhill near Blackburn, **James Hargreaves** built the **spinning jenny**, a machine that let one spinner work many spindles at once, eight at first and later as many as 120. It was used mainly by spinners at home, and it seemed a threat: Blackburn spinners broke into Hargreaves's house and smashed his machines, and he moved to Nottingham in 1768.

**Richard Arkwright**, a former barber, patented the **water frame** in 1769, on a design partly based on a machine built for Thomas Highs. Driven by horses and then by water, it spun a thread strong enough for the warp, making all-cotton cloth possible in Britain at last. **Samuel Crompton**'s **mule** of about 1779 combined features of the jenny and the water frame and spun yarn fine enough for muslin. Crompton could not afford a patent and received no royalties, though Parliament granted him £5,000 in 1812. Weaving mechanised later. **Edmund Cartwright**'s power loom of 1785 was mainly a proof of concept; for decades mill-spun yarn still went out to hand-loom weavers working at home.

{{image: Cromford Mill | Arkwright's mill at Cromford in Derbyshire, opened in 1771, now part of the Derwent Valley Mills World Heritage Site.}}

Britain imported 2.5 million pounds of raw cotton in 1750; it consumed 52 million pounds in 1800 and 588 million in 1850. Yet the revolution began from a small base: in 1800 less than 0.1 per cent of the world's cotton cloth was made on British-invented machinery.

## Steam, Iron and the Transport Revolution

Steam began in the mines. **Thomas Newcomen**'s atmospheric engine, the first practical device to turn steam into mechanical work, was built in 1712 at a coalworks at Tipton in the Black Country to pump water out of the pits. Inefficient but cheap to run on unsaleable coal at the pit-head, 1,454 had been built by 1800.

In 1765 **James Watt**, an instrument maker at the University of Glasgow, conceived the separate condenser, which kept the cylinder hot and the condenser cold. In partnership with Matthew Boulton, from 1775 at Boulton's Soho works near Birmingham, he built engines that used far less coal than Newcomen's. In 1781 the sun-and-planet gear gave Watt's engine rotary motion, so that it could drive machinery and free factories from riverside sites. Boulton is credited with the boast "I sell here, sir, what all the world desires to have—POWER." Watt's patent, extended until 1800, also held back rivals' improved engines; high-pressure engines, and so locomotives, followed its expiry.

Iron followed a similar path. In 1709 the Quaker ironmaster **Abraham Darby I** smelted iron at Coalbrookdale with coke instead of charcoal. Britain made 400 tons of coke iron in 1720 and 250,000 tons in 1806.

Heavy goods needed cheap transport. The **Bridgewater Canal**, opened in 1761 from the Duke of Bridgewater's mines at Worsley to Manchester, roughly halved the price of coal there within a year. The **Stockton and Darlington Railway** (1825) was the first public railway to use steam locomotives. The **Liverpool and Manchester Railway**, opened on 15 September 1830 and built by George Stephenson, was the first inter-city line to rely entirely on steam. It linked the cotton port with the mills.

```checkpoint
q: What did Robert C. Allen argue was the main reason the Industrial Revolution began in Britain?
a*: That high wages combined with cheap coal gave firms an incentive to invent labour-saving, coal-using machines.
a: That Britain had the lowest wages in Europe, so labour was cheap.
x: Allen argued the opposite: British wages were high, which made labour-saving machines worth inventing.
a: That the Calico Acts gave Britain a monopoly on Indian cloth.
x: The Calico Acts restricted Indian cloth; Allen's argument is about the relative prices of labour and energy.
a: That Britain had no coal and so had to invent new energy sources.
x: Britain mined most of the world's coal; cheap coal is central to Allen's argument.
hint: Think of the relative price of labour and energy.
why: Allen's thesis explains invention by incentives, though critics dispute whether British wages were in fact especially high.
---
q: Why was James Watt's rotary-motion engine of 1781 so important for factories?
a: It allowed ships to cross the Atlantic.
x: Steamships are not part of the 1781 change; Watt's engine drove machinery on land.
a: It was the first steam engine ever built.
x: Newcomen's engine of 1712 came first, pumping water from mines.
a*: It could drive machinery directly, freeing mills from riverside sites.
a: It used no coal at all.
x: It used less coal than Newcomen's engine, but it still burned coal.
hint: Think of where water-powered mills had to be built.
why: Rotary steam power let factories be built in towns, near workers and transport.
```

## The Factory and the Clock

Arkwright's mill at **Cromford** in Derbyshire, built in 1771 with his nonconformist partners Jedediah Strutt and Samuel Need, has been called the world's first water-powered cotton spinning mill. From 1772 it ran day and night in two twelve-hour shifts. Its first 200 workers were mostly women and children, the youngest aged seven; the minimum age was later raised to ten.

**E. P. Thompson** argued in his essay "Time, Work-Discipline, and Industrial Capitalism" (1967) that industrial capitalism replaced work that followed the rhythm of tasks with synchronised clock-time. His *The Making of the English Working Class* (1963), as the chapter What Is History? describes, founded "history from below".

```quote
I am seeking to rescue the poor stockinger, the Luddite cropper, the 'obsolete' hand-loom weaver, the 'Utopian' artisan … from the enormous condescension of posterity.
E. P. Thompson · The Making of the English Working Class · 1963
```

Children were central to the early factory and the mines. The first laws to limit their hours, in 1802 and 1819, were effectively unenforced: by 1825 there had been only two prosecutions under the 1819 Act. Campaigners pressed for more; Richard Oastler wrote in 1830 that Bradford's child workers were worse off than slaves on sugar plantations. The Factory Act of 1833 extended an earlier ban on employing children under nine from cotton mills to most textile mills, silk mills excepted, limited the hours of older children, required schooling, and created the first professional factory inspectors. After long agitation by millworkers themselves, the Ten Hours Act followed in 1847.

## Cottonopolis

Manchester, nicknamed "Cottonopolis", is described as the world's first industrialised city. Its population, on rough counts, grew from about 23,000 in the 1770s to about 75,000 in 1801 and about 303,000 in 1851. Alexis de Tocqueville wrote in 1835, in one translation, that "from this foul drain the greatest stream of human industry flows out to fertilize the whole world."

The most influential witness was **Friedrich Engels**, the eldest son of a German textile industrialist, who lived in Salford and Manchester in 1842–44. *The Condition of the Working Class in England* (1845) argued that industrialisation had made workers worse off, and reported death rates in Manchester and Liverpool well above the national average.

## Resistance: Luddites and Peterloo

From 1811 to 1816 the **Luddites**, named after a legendary "Ned Ludd", broke machines in Nottinghamshire, Yorkshire and Lancashire. The government made machine-breaking a capital crime in 1812, over the opposition of Lord Byron, and deployed 12,000 troops, more, Eric Hobsbawm noted, than Wellington took to Portugal in 1808. A mass trial at York in 1813 ended in executions and transportation. Hobsbawm called their tactics "collective bargaining by riot", and Malcolm Thomis argued that their attacks did not imply hostility to machinery as such: they were workers using the one lever they had.

On 16 August 1819 a crowd of about 60,000 gathered on St Peter's Field in Manchester to hear Henry Hunt demand parliamentary reform; only about 11 per cent of adult men then had the vote. Women were prominent: female reform societies had formed across the textile districts, members of the Manchester Female Reform Society, dressed in white, accompanied Hunt, and Mary Fildes carried the society's flag in Hunt's carriage. Yeomanry cavalry and then hussars charged the crowd. An estimated 18 people were killed and 400–700 injured. The *Manchester Observer* named it **Peterloo**, in bitter echo of Waterloo; the historian Robert Poole has called it the bloodiest political event of the nineteenth century on English soil.

## Cotton's Global Chain

Eli Whitney's cotton gin (1793) made short-staple upland cotton profitable, and slavery expanded into the Deep South. About a million enslaved African Americans were forcibly moved there from the Upper South, roughly two-thirds of them through the domestic slave trade, a forced migration the historian Ira Berlin called the "Second Middle Passage". US cotton output rose from 750,000 bales in 1830 to 2.85 million in 1850, and by 1860 Southern plantations grew about two-thirds of the world's cotton and supplied over three-quarters of Britain's. The historian **Sven Beckert** describes the violent foundation of this system, armed trade, slave labour and the seizure of Indigenous land, as "war capitalism".

For India the same machines meant ruin. In 1813 Parliament ended the East India Company's monopoly of trade with India (its China monopoly lasted until 1833), opening India to British machine-made goods while British tariffs still restricted Indian cloth. British machines still could not match the finest Indian cloth, but coarser, cheaper British cloth undersold it and destroyed much of the industry. H. H. Wilson, in a note to his 1845 continuation of James Mill's *History of British India*, citing evidence from 1813 that Indian cottons then undersold English ones by 50–60 per cent, drew the conclusion bluntly.

```quote
… the mills of Paisley and of Manchester would have been stopped in their outset … They were created by the sacrifice of the Indian manufactures.
H. H. Wilson · continuation of James Mill's History of British India · 1845
```

Historians disagree about the causes. **Prasannan Parthasarathi** argues that advanced regions such as Bengal and Mysore were broadly comparable to Britain in the late eighteenth century until colonial policy deindustrialised them. Jeffrey Williamson argues that the collapse of Mughal power had already raised Indian food prices and wages, costing India market share before the factories arrived.

Some rulers tried to industrialise in turn. In Egypt, **Muhammad Ali** (ruler 1805–1848) created a state monopoly that obliged producers to sell to the state, expanded long-staple cotton as a cash crop using forced labour on irrigation works, and founded state textile mills to compete with Europe. They employed tens of thousands. The Anglo-Ottoman Treaty of Balta Liman (1838), applied to Egypt after its defeat in 1840–41, forced it to dismantle its monopolies and import barriers. The textile industry is usually judged unsuccessful, but a 2015 study by Panza and Williamson found it had real positive effects.

Industry also spread. Belgium was the second country to industrialise. **Samuel Slater**, apprenticed to Strutt, defied British laws against the emigration of skilled workers and carried the machinery's design in his memory to America in 1789. At **Lowell**, Massachusetts, by 1840 about 8,000 workers, nearly three-quarters of them young women from New England farms, worked about 73 hours a week. They struck against a wage cut in 1834, published the *Lowell Offering*, and in 1845 formed the first union of working women in the United States.

```checkpoint
q: What happened to India's cotton textile industry in the early nineteenth century?
a: It mechanised faster than Britain's and captured the British market.
x: British machine-made cloth flooded India, not the reverse.
a*: After the Company's monopoly of the India trade ended in 1813, cheap British machine-made cloth undersold Indian hand-woven cloth, while British tariffs kept Indian cloth out.
a: It was untouched, because Indian cloth was always finer.
x: Fine Indian cloth kept its quality edge, but cheaper British cloth still destroyed much of the industry.
a: It was abolished by the Calico Acts of 1700 and 1721.
x: The Calico Acts restricted Indian cloth in Britain a century earlier; they did not abolish India's industry.
hint: Think of what changed in 1813.
why: Historians debate whether colonial policy (Parthasarathi) or earlier Mughal decline (Williamson) mattered more.
---
q: Who supplied most of the world's raw cotton by 1860?
a: Free family farmers in Egypt.
x: Egyptian cotton expanded under Muhammad Ali, but Egypt did not supply most of the world's cotton.
a: Lancashire's own fields.
x: Lancashire's mills spun imported raw cotton; they did not grow it.
a: Mills in Lowell, Massachusetts.
x: Lowell spun and wove cotton; it did not grow it.
a*: Enslaved people on plantations in the American South.
hint: Think of the cotton gin and the "Second Middle Passage".
why: The factories of Britain and New England rested on the forced labour of millions of enslaved African Americans.
```

## The Great Divergence

Kenneth Pomeranz's *The Great Divergence* (2000) argued, as the chapter What Is History? notes, that the most advanced regions of Europe and Asia, such as England and China's Yangzi Delta, were comparable until about 1800 and faced similar limits of land. Britain pulled ahead thanks to two windfalls. One was coal: Europe's mines were wet, a problem the Newcomen engine solved, while China's largest deposits lay in the dry northwest, far from its economic core in the south. The other was the colonies: New World wood, cotton and wool saved England the need for an estimated 23 to 25 million acres of farmland, more than its entire cultivated area of 17 million acres. As the chapter on Tang and Song China shows, the question of why China did not industrialise first is an old one.

Pomeranz's "California School" has many critics. Broadberry and others date the divergence earlier, and Broadberry finds English silver wages three times those of the Yangzi Delta by 1600. Others doubt that coal was decisive, or point to differences in how land was held. The debate is unresolved, but its result is not: before industrialisation most of the world's manufacturing was in China and India, and afterwards most was in Western Europe and North America.

## Liberation or Catastrophe?

Did the Industrial Revolution make ordinary people better off? The "standard of living debate" pitted pessimists such as Hobsbawm against optimists such as R. M. Hartwell. On Charles Feinstein's wage estimates, real wages rose only about 12 per cent between 1780 and 1840, while output per worker grew about 46 per cent. Allen calls this lag "Engels' pause". Army records suggest that average height fell. Yet the share of London children dying before age five fell from 75 per cent in 1730–49 to 32 per cent in 1810–29, and after 1840 wages rose strongly. The economist Robert Lucas saw in the period the moment when, "for the first time in history, the living standards of the masses of ordinary people have begun to undergo sustained growth". Emma Griffin, drawing on some 350 working-class autobiographies, paints a relatively optimistic picture.

Others question the word "revolution" itself. Nicholas Crafts and Knick Harley argued in the 1980s and 1990s that overall British growth was slower than once thought and concentrated in cotton and iron, and Antràs and Voth's later estimates broadly confirmed slow productivity growth, with only a modest acceleration after 1800.

The longest-lasting legacy may be the atmosphere. For 10,000 years before the mid-eighteenth century, carbon dioxide stood at about 280 parts per million; it is now more than 50 per cent higher, and the IPCC treats 1750 as the "pre-industrial" baseline. Paul Crutzen proposed the Industrial Revolution as the start of a new age, the "Anthropocene". Andreas Malm has argued that cotton masters turned from water to steam less because water ran short than because steam let them build mills in towns, near workers they could control. The revolution that gave some people unprecedented power over nature also bound the world to coal.

## Further exploration

- **Robert C. Allen, *The British Industrial Revolution in Global Perspective* (2009).** High wages and cheap coal as the trigger of invention.
- **Kenneth Pomeranz, *The Great Divergence: China, Europe, and the Making of the Modern World Economy* (2000).** England and the Yangzi Delta compared; coal and colonies.
- **Sven Beckert, *Empire of Cotton: A Global History* (2014).** Cotton, slavery and "war capitalism"; winner of the Bancroft Prize.
- **Prasannan Parthasarathi, *Why Europe Grew Rich and Asia Did Not: Global Economic Divergence, 1600–1850* (2011).** The divergence seen from India.
- **Giorgio Riello, *Cotton: The Fabric that Made the Modern World* (2013).** Asian cotton before 1750 and Europe's imitation of it.
- **Emma Griffin, *Liberty's Dawn: A People's History of the Industrial Revolution* (2013).** Working-class autobiographies and a more hopeful view.
- **Joel Mokyr, *The Enlightened Economy: An Economic History of Britain 1700–1850* (2009).** Ideas, useful knowledge and the Industrial Enlightenment.$ar_indrev_master$,
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
  select $ar_indrev_quiz$[
    {"type": "mcq", "prompt": "What did the Calico Acts of 1700 and 1721 do?", "options": ["Banned the export of British machinery to India", "Banned most imports of printed Indian cottons and then the sale of most cotton cloth, while exempting raw cotton", "Ended the East India Company's monopoly of trade with Asia", "Set a minimum age for child workers in cotton mills"], "answerIndex": 1, "explanation": "The Acts protected wool and linen interests against cheap Indian cloth; the exemption for raw cotton fed a domestic industry that later mechanised.", "id": "q1"},
    {"type": "mcq", "prompt": "What did James Watt's separate condenser achieve?", "options": ["It kept the cylinder hot and the condenser cold, so the engine used much less coal than Newcomen's", "It allowed the first steam locomotive to run in 1712", "It let coke replace charcoal in iron smelting", "It made the spinning jenny water-powered"], "answerIndex": 0, "explanation": "Watt conceived it in 1765; Boulton & Watt engines used far less coal per unit of power than Newcomen's atmospheric engines.", "id": "q2"},
    {"type": "mcq", "prompt": "What happened at St Peter's Field, Manchester, on 16 August 1819?", "options": ["The Luddite movement began", "The Liverpool and Manchester Railway opened", "The first Factory Act was passed", "Cavalry charged a crowd of about 60,000 gathered to demand parliamentary reform, killing an estimated 18 people"], "answerIndex": 3, "explanation": "The Manchester Observer named it Peterloo; women of the female reform societies were prominent in the crowd.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Kenneth Pomeranz, what allowed Britain to pull ahead of the Yangzi Delta after about 1800?", "options": ["A higher literacy rate", "The Calico Acts", "Coal and colonies, which relieved Britain's shortage of land and energy", "A larger population"], "answerIndex": 2, "explanation": "New World wood, cotton and wool are estimated to have saved England 23–25 million acres, more than its 17 million cultivated acres, while China's largest coal deposits lay far from its economic core.", "id": "q4"},
    {"type": "open", "prompt": "Why did the Industrial Revolution begin in Britain? Assess at least three explanations.", "rubric": "A strong answer weighs several explanations: institutions after 1688 (property rights, finance, no internal tariffs); coal (five-sixths of world output in 1700; the Dutch comparison); Allen's high wages and cheap energy, with the critiques of his wage evidence; Mokyr's useful knowledge and the Industrial Enlightenment (Lunar Society, Dissenters); and colonies and slavery (Williams, contested by Drescher; Pomeranz's land and coal argument). It recognises that historians disagree and reaches a reasoned judgement.", "id": "q5"},
    {"type": "open", "prompt": "Was the Industrial Revolution liberation or catastrophe, and for whom?", "rubric": "A strong answer distinguishes groups and places: British workers (child labour, the Factory Acts, Engels's Manchester, the Luddites and Peterloo; the standard-of-living debate, Feinstein's wage figures and 'Engels' pause', falling heights against falling child mortality, Griffin's more optimistic reading); the enslaved cotton growers of the American South; Indian hand-weavers and the deindustrialisation debate (Parthasarathi vs Williamson); Egypt's attempt to industrialise; and the environmental legacy (CO2 since 1750, the Anthropocene, Malm). It recognises that long-run gains and short-run costs fell on different people.", "id": "q6"}
  ]$ar_indrev_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions/the-industrial-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
