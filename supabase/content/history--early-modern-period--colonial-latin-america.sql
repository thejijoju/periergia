-- Colonial Latin America — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/colonial-latin-america @ research/advanced/read.
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
    'history/early-modern-period/colonial-latin-america',
    'research',
    'advanced',
    'read',
    $em_colla_master$> **For three centuries**, from the conquests of the early sixteenth century to the independence wars of the early nineteenth, Spain and Portugal ruled most of Central and South America and the Caribbean. Out of conquest, catastrophic epidemics, forced labour, the slave trade, and mixing among Indigenous, African, European, and Asian peoples came the societies of modern Latin America. This chapter describes how colonial rule worked, from the viceroyalties to the silver mines of Potosí; how Indigenous communities survived, adapted, and resisted, including in the courts; the Church, Guadalupe, and Sor Juana; the casta system; Brazil's sugar, gold, and slavery; the Pacific link to Asia; and the reforms and great rebellions of the late eighteenth century.

## After the Conquest

As the chapter on the conquest of the Americas described, Spanish conquistadors and their Indigenous allies overthrew the Mexica (Aztec) and Inca states between 1519 and the 1530s. The demographic catastrophe that followed was among the worst in human history. Estimates of the population of Mexico in 1519 range from under 5 million to as many as 25 or 30 million, and are much debated. Smallpox struck in 1520, and two great epidemics that the Nahua called *cocoliztli*, in 1545–1548 and from 1576 to about 1580, killed millions more; the second alone may have killed half of the surviving Indigenous population. Scientists still debate whether these were European diseases or local haemorrhagic fevers worsened by drought. Mexico's population did not return to its pre-conquest level until the twentieth century.

## Governing an Empire

The Spanish crown ruled its American territories through **viceroys**, the king's personal representatives. The **Viceroyalty of New Spain** (1535), governed from Mexico City, included Central America, the Caribbean islands, and later the Philippines. The **Viceroyalty of Peru** (1542), governed from Lima, at first covered most of Spanish South America. In the eighteenth century the crown created two more: **New Granada** (first in 1717, permanently from 1739), and the **Río de la Plata** (1776), governed from Buenos Aires.

In principle, Spanish law divided colonial society into two "republics": a **república de indios**, Indigenous communities with their own councils and nobles, paying tribute and labour to the crown, and a **república de españoles** for everyone else. Spanish towns with their churches and plazas, universities, and the first printing press in the Americas, set up in Mexico City in 1539, made colonial cities centres of learning as well as of power.

## Silver and the Mita

In 1545, according to tradition, an Indigenous miner, Diego Huallpa, found silver at the **Cerro Rico**, the "rich hill" of **Potosí**, high in the Andes in what is now Bolivia. As the chapter on the Columbian exchange described, Spanish American silver flowed across the world, much of it ending up in China.

In the early 1570s the viceroy **Francisco de Toledo** transformed production. Miners adopted the **amalgamation** process, using mercury to extract silver from lower-grade ores, and mercury came from the mine of **Huancavelica** in Peru and from Almadén in Spain. Toledo also adapted the Inca system of rotating labour service, the **mita**, into a forced labour draft: from 1573, each Indigenous community in a wide region had to send one in seven of its adult men each year to work in the mines. Mercury poisoned workers at the refineries, as the Jesuit José de Acosta described around 1590, and many communities lost their men to the mines. Potosí itself became one of the largest cities in the world, reported to have perhaps 160,000 people by 1610, though such figures are uncertain. The historian Kris Lane has called it "the silver city that changed the world".

## Indigenous Survival and Resistance

Indigenous peoples were not simply victims. They kept their languages, many of their communities, and much of their land; they adapted Christianity to their own understandings; and they used Spanish institutions, including the law, to defend themselves.

Spanish law classed Indigenous people as legal minors deserving royal protection. In New Spain, a **General Indian Court**, established in the 1590s and funded by a small levy of half a *real* on Indigenous tribute payers, heard Indigenous complaints for more than two centuries, until 1820, as the historian Woodrow Borah showed. Indigenous communities filed lawsuits over land, tribute, and abuses by priests and officials, often successfully. Because they were considered new converts, Indigenous people were also excluded from the jurisdiction of the **Inquisition**, whose tribunals were set up in Lima in 1570 and Mexico City in 1571.

Andean writers produced extraordinary works. **Felipe Guaman Poma de Ayala**, an Indigenous noble, completed around 1615 *The First New Chronicle and Good Government*, a manuscript of nearly 1,200 pages with almost 400 drawings, addressed to King Philip III, describing Andean history and denouncing the abuses of colonial rule. It is now in the Royal Danish Library in Copenhagen. The mestizo writer **Inca Garcilaso de la Vega**, son of a Spanish conquistador and an Inca noblewoman, published his *Royal Commentaries of the Incas* in Lisbon in 1609, presenting Cuzco as "another Rome" and rejecting the description of Andean peoples as barbarians.

Africans resisted too. Near Veracruz, the maroon leader **Yanga** and his followers held out in the hills against Spanish expeditions, and in 1618, by most accounts, won an agreement recognising their free settlement, San Lorenzo de los Negros. The town is now named Yanga.

{{image: Felipe Guamán Poma de Ayala | A drawing from Guaman Poma's First New Chronicle and Good Government (about 1615), one of nearly 400 in the manuscript.}}

```checkpoint
q: What was the mita under Viceroy Toledo?
a*: A forced labour draft that required Indigenous communities to send one in seven adult men each year to work in the mines of Potosí and Huancavelica.
a: A tax paid in silver by Spanish settlers.
x: The mita was a labour draft imposed on Indigenous communities.
a: A Christian festival introduced by the Jesuits.
x: The mita was an adaptation of an Inca labour system for the mines.
a: A trade agreement with the Portuguese.
x: The mita was an internal labour system in Spanish Peru.
hint: Think of Potosí and one in seven.
why: The mita supplied labour for the silver that fuelled the world economy, at a terrible cost to Andean communities.
---
q: How did Indigenous communities in New Spain use the colonial legal system?
a: They were forbidden to go to court.
x: They had their own court, the General Indian Court.
a: They were tried by the Inquisition for heresy.
x: Indigenous people were excluded from the Inquisition's jurisdiction.
a*: They filed lawsuits, often successfully, over land, tribute, and abuses, including in the General Indian Court funded by a half-real levy.
a: They used only Mexica law, ignoring Spanish courts.
x: Communities actively used Spanish courts to defend their interests.
hint: Think of Woodrow Borah's work.
why: Litigation was one of the most important ways Indigenous people defended their communities under colonial rule.
```

## The Church, Guadalupe, and Sor Juana

The Catholic Church was everywhere in colonial life. Franciscan, Dominican, Augustinian, and Jesuit missionaries converted Indigenous peoples, learned their languages, and built churches on old sacred sites. Indigenous Christians made the faith their own, through confraternities, festivals, and local saints.

The most famous example is the **Virgin of Guadalupe**. According to tradition, the Virgin Mary appeared in December 1531 to an Indigenous man, Juan Diego, on the hill of Tepeyac near Mexico City, and left her image on his cloak. The first published account appeared only in 1648, in Spanish, by the priest Miguel Sánchez, followed in 1649 by a Nahuatl account published by Luis Laso de la Vega; when the Nahuatl text was first written is debated. Guadalupe became a symbol of Mexican identity, and later of independence.

The greatest writer of colonial Mexico was the nun **Sor Juana Inés de la Cruz** (born 1648 or 1651; died 1695), a poet, playwright, and scholar who had taught herself Latin and assembled a large library. In 1691, after a bishop writing under the name "Sor Filotea" rebuked her for secular studies, she replied with the *Respuesta a Sor Filotea*, a defence of women's right to learning. Soon afterwards she gave up her library and her writing, and she died in 1695 while nursing her sisters in an epidemic.

## Mixing and the Casta System

Colonial society mixed Indigenous peoples, Spaniards, Africans, and, through the Pacific, Asians. Spanish authorities tried to sort the mixed population into categories, or *castas*, such as *mestizo* (Spanish and Indigenous) and *mulato* (Spanish and African). In the eighteenth century, painters in New Spain produced **casta paintings**, sets of usually sixteen canvases showing a couple of different origins with their child, each labelled with a category. Such images suggest a rigid hierarchy, but the art historian Ilona Katzew has argued that by the eighteenth century race alone no longer reliably indicated social rank: wealth, occupation, honour, and reputation also mattered, and people's recorded categories could change.

From 1565 to 1815 the **Manila galleons** sailed, usually once or twice a year, between Manila in the Philippines and Acapulco, carrying Chinese silks and porcelain to the Americas and American silver to Asia. Thousands of Asians, free and enslaved, came to New Spain, where officials called them all *chinos*, as the historian Diego Javier Luis has shown. The most famous, **Catarina de San Juan**, born in South Asia and enslaved by Portuguese traders, became a revered holy woman in Puebla, where she died in 1688.

## Brazil: Sugar, Gold, and Slavery

Portuguese **Brazil** developed along a different path. From the mid-sixteenth century, sugar plantations in the northeast, around Pernambuco and Bahia, made Brazil the world's leading sugar producer, worked first by enslaved Indigenous people and then, increasingly, by enslaved Africans. Brazil received roughly four in ten of all the enslaved Africans brought to the Americas, by some estimates more, more than any other country. The Dutch West India Company held Pernambuco from 1630 to 1654.

In the interior, people who escaped slavery built communities called *quilombos*. The largest, **Palmares**, in the hills of the northeast, survived for most of the seventeenth century despite repeated expeditions against it. It was overrun in 1694 by a force led by the frontiersman Domingos Jorge Velho; its last leader, **Zumbi**, was captured and killed on 20 November 1695, a date now commemorated in Brazil as the Day of Black Consciousness.

In the 1690s prospectors found **gold** in the region later called Minas Gerais. A gold rush drew hundreds of thousands of Portuguese migrants and enslaved Africans into the interior, and towns such as Vila Rica (now Ouro Preto) grew rich, building magnificent churches. In the south, Jesuit missions organised Guaraní communities; when the Treaty of Madrid (1750) between Spain and Portugal ordered seven missions moved, the Guaraní resisted in the **Guaraní War** (1754–1756), and their leader Sepé Tiaraju was killed in 1756. Portugal expelled the Jesuits in 1759, and Spain from its empire in 1767.

## Reform and Rebellion

In the eighteenth century the Spanish Bourbon kings sought to make the empire more profitable and more firmly controlled. These **Bourbon reforms** raised and reorganised taxes, created royal monopolies, notably on tobacco, opened trade within the empire, and strengthened royal officials. The visitor-general **José de Gálvez**, sent to New Spain in 1765, pressed the reforms hard and favoured Spanish-born officials and merchants over American-born creoles, who resented their exclusion.

Higher taxes and tighter control provoked revolt. In November 1780 **José Gabriel Condorcanqui**, an Indigenous *kuraka* (local lord) descended from the Inca rulers, who took the name **Túpac Amaru II**, seized and executed a hated Spanish official near Cuzco and launched the largest rebellion in the history of colonial Spanish America. His wife, **Micaela Bastidas**, was, as the historian Charles Walker shows, a full partner in leading it. They were captured, and on 18 May 1781 in the main square of Cuzco, Túpac Amaru was forced to watch the execution of his wife and members of his family before being put to death himself. The rising continued: the Aymara leader **Túpac Katari** besieged La Paz for months in 1781, and fighting went on until 1783. In New Granada, the **Comuneros** revolt began in March 1781 in Socorro, when a crowd led by Manuela Beltrán tore down an edict announcing new taxes. Both movements were suppressed, but they showed how deep the tensions in the empire ran, a generation before the wars of independence described in a later chapter.

```checkpoint
q: What was distinctive about Brazil within colonial Latin America?
a: It was ruled by Spain from Lima.
x: Brazil was a Portuguese colony.
a*: It was Portuguese, built on sugar and later gold, and received about four in ten of all enslaved Africans brought to the Americas.
a: It had no slavery.
x: Brazil received more enslaved Africans than any other country in the Americas.
a: It was never occupied by any other European power.
x: The Dutch held Pernambuco from 1630 to 1654.
hint: Think of sugar, gold, and the slave trade.
why: Brazil's economy and society were shaped above all by the Atlantic slave trade.
---
q: Who was Micaela Bastidas?
a: A nun and poet in Mexico City.
x: That was Sor Juana Inés de la Cruz.
a: The leader of the Comuneros in Socorro.
x: Manuela Beltrán sparked the Comuneros revolt in Socorro.
a: A holy woman of Asian origin in Puebla.
x: That was Catarina de San Juan.
a*: The wife and full partner of Túpac Amaru II in leading the rebellion of 1780–1781, executed in Cuzco in 1781.
hint: Think of the great Andean rebellion.
why: Women played leading roles in colonial rebellions, though they are often left out of the story.
```

## Further exploration

- **Kris Lane, *Potosí: The Silver City That Changed the World* (2019).** The mining city and its global impact.
- **Matthew Restall, *Seven Myths of the Spanish Conquest* (2003).** The conquest and its legends reconsidered.
- **Charles F. Walker, *The Tupac Amaru Rebellion* (2014).** The great Andean rising.
- **Stuart B. Schwartz, *Sugar Plantations in the Formation of Brazilian Society: Bahia, 1550–1835* (1985).** Sugar and slavery in Brazil.
- **Ilona Katzew, *Casta Painting: Images of Race in Eighteenth-Century Mexico* (2004).** Art and the casta system.
- **Diego Javier Luis, *The First Asians in the Americas: A Transpacific History* (2024).** Asian migrants in colonial Mexico.$em_colla_master$,
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
  select $em_colla_quiz$[
    {"type": "mcq", "prompt": "When was silver found at Potosí?", "options": ["1492", "1573", "1545", "1610"], "answerIndex": 2, "explanation": "Silver was found at the Cerro Rico of Potosí in 1545; Viceroy Toledo's mita came later, from 1573.", "id": "q1"},
    {"type": "mcq", "prompt": "Who wrote The First New Chronicle and Good Government, with nearly 400 drawings, around 1615?", "options": ["Felipe Guaman Poma de Ayala", "Inca Garcilaso de la Vega", "Sor Juana Inés de la Cruz", "José de Acosta"], "answerIndex": 0, "explanation": "The manuscript, addressed to Philip III, is now in the Royal Danish Library in Copenhagen.", "id": "q2"},
    {"type": "mcq", "prompt": "What was Palmares?", "options": ["A Jesuit mission among the Guaraní", "A silver mine in Peru", "The Manila galleon's port", "The largest quilombo, a community of people who had escaped slavery in northeastern Brazil, overrun in 1694"], "answerIndex": 3, "explanation": "Its last leader, Zumbi, was killed on 20 November 1695.", "id": "q3"},
    {"type": "mcq", "prompt": "When was the first published account of the apparition of the Virgin of Guadalupe?", "options": ["1531, by Juan Diego", "1648, by Miguel Sánchez", "1691, by Sor Juana", "1810, during the independence war"], "answerIndex": 1, "explanation": "A Nahuatl account was published by Luis Laso de la Vega in 1649.", "id": "q4"},
    {"type": "open", "prompt": "How did Indigenous peoples survive and resist under Spanish colonial rule?", "rubric": "A strong answer discusses the demographic catastrophe, the two republics, community councils and nobles, the use of courts including the General Indian Court, exclusion from the Inquisition, adaptation of Christianity (Guadalupe), writers such as Guaman Poma and Garcilaso, the burdens of tribute and the mita, and armed rebellion culminating in Túpac Amaru II, Micaela Bastidas, and Túpac Katari.", "id": "q5"},
    {"type": "open", "prompt": "How was colonial Latin America connected to the wider world?", "rubric": "A strong answer discusses Potosí silver and its flow to Asia, mercury from Huancavelica and Almadén, the Manila galleon and Asian migrants (chinos, Catarina de San Juan), the Atlantic slave trade and Brazil's share, sugar and gold exports, the Dutch in Pernambuco, and Bourbon trade reforms.", "id": "q6"}
  ]$em_colla_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/colonial-latin-america', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
