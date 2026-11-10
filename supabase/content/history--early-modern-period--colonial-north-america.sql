-- Colonial North America — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/colonial-america @ research/advanced/read.
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
    'history/early-modern-period/colonial-america',
    'research',
    'advanced',
    'read',
    $em_colam_master$> **Between 1607 and 1763**, English colonists built a string of settlements along the Atlantic coast of North America that grew, by 1770, to more than two million people, about one in five of them of African descent, nearly all enslaved. That growth took place in a continent that belonged to Native nations, many of them powerful, and that was contested with France, Spain, and the Netherlands. This chapter tells the story from three directions: from the English colonies, from the Native nations they displaced and dealt with, and from the Africans forced into slavery there. It covers Virginia and New England, the very different colonial societies of North America, the wars that remade the continent, the making of racial slavery in law, the Atlantic economy and the Great Awakening, and the Seven Years' War that set the stage for revolution.

## A Continent of Native Nations

When the English arrived, eastern North America was home to hundreds of thousands of people in many nations, with their own politics, diplomacy, and trade, as the chapter on North America before 1500 described. In the Chesapeake, the paramount chief **Powhatan** ruled a confederacy of some thirty peoples. In the northeast, the five nations of the **Haudenosaunee** (Iroquois) Confederacy were the dominant power between the Hudson and the Great Lakes. Historians such as Daniel Richter and Kathleen DuVal have argued that for most of the colonial period Native nations, not Europeans, controlled most of the continent, and that colonial history makes sense only when it is seen from "Indian country" as well as from the coast.

Disease had often arrived before the colonists. An epidemic between 1616 and 1619 killed a large share of the peoples of coastal New England, by some estimates more than half and in places up to nine-tenths, emptying villages that English settlers would soon occupy.

## Virginia: Tobacco and Survival

In 1607 the Virginia Company founded **Jamestown** on the James River. The early years were terrible. In the winter of 1609–1610, the "Starving Time", with trade cut off and Powhatan's warriors attacking colonists who left the fort, of the roughly 500 colonists there in the autumn, only about 60 were alive by the spring, and archaeological and documentary evidence shows that some survivors resorted to cannibalism.

The colony survived because of **tobacco**, which found an eager market in England. In 1614 the colonist **John Rolfe** married **Pocahontas**, the daughter of Powhatan, who had been captured by the English and baptised as Rebecca; the marriage brought a brief peace. She travelled to England and died at Gravesend in 1617. In 1622 Powhatan's brother **Opechancanough**, by then the real power in the chiefdom, launched a coordinated attack that killed 347 colonists by the official count, about a quarter of the English population. The English responded with years of war.

Tobacco demanded labour. For most of the seventeenth century, the main workers were **indentured servants**, mostly poor young English men and women who agreed to work for four to seven years in return for their passage; by most estimates about three-quarters of European migrants to the Chesapeake in that century came this way. Many died before their terms ended.

In August 1619 an English privateer, the *White Lion*, arrived at Point Comfort and sold "20. and odd Negroes", in John Rolfe's words, to the colonists. They had been captured in Portuguese-led wars against the kingdom of **Ndongo** in Angola, the wars described in the chapter on Kongo, Asante, and Dahomey, and seized at sea from the slave ship *San Juan Bautista*, sailing from Luanda to Veracruz. Their legal status in Virginia was at first not fully fixed; some Africans became free and owned land. That changed over the following decades, as described below.

## New England: Puritans and the Wampanoag

In 1620 the *Mayflower* brought a group of Separatists, later called the **Pilgrims**, to **Plymouth**, on the site of the Patuxet village emptied by epidemic. The Wampanoag leader **Ousamequin**, known to the English as Massasoit, his people weakened by disease and threatened by the Narragansett, made a mutual-defence treaty with the colonists in 1621. **Tisquantum** (Squanto), a Patuxet man who had been kidnapped to Europe and returned to find his village gone, served as interpreter.

From 1630 a much larger Puritan migration founded the **Massachusetts Bay** colony. A sermon traditionally attributed to its governor, **John Winthrop**, *A Model of Christian Charity*, told the settlers that "we shall be as a city upon a hill", with the eyes of all people upon them; historians debate where it was delivered and even who wrote it. New England was settled by families, its towns organised around congregations, and it grew quickly through natural increase in a healthier climate than the Chesapeake's.

Expansion brought war. In 1637, during the **Pequot War**, Connecticut forces under John Mason, with Mohegan and Narragansett allies, set fire to a fortified Pequot village at **Mystic** and killed an estimated 400 to 700 people, most of them women, children, and old men. In 1675 the Wampanoag leader **Metacom**, called King Philip by the English, led a coalition against the spread of English settlement. **King Philip's War** (1675–1676 in southern New England, continuing in the north until 1678) struck more than half of New England's towns, destroying a dozen of them, and is often described as the deadliest war in colonial American history relative to population. For the Native peoples of southern New England it was catastrophic: thousands were killed, and many captives were sold into slavery in the Caribbean. Metacom was killed in August 1676.

```checkpoint
q: Why did the Wampanoag leader Ousamequin make a treaty with the Plymouth colonists in 1621?
a*: Because his people had been devastated by epidemic and threatened by the Narragansett, and an alliance with the newcomers could rebalance regional power.
a: Because the English had already conquered the Wampanoag.
x: The colonists were few and weak in 1621; the treaty was an alliance, not a surrender.
a: Because Tisquantum ordered him to.
x: Tisquantum served as interpreter; Ousamequin was the leader who chose the alliance.
a: Because the English promised to leave within a year.
x: The colonists intended to stay.
hint: Think of the epidemic of 1616–1619.
why: Native leaders pursued their own strategies; the colonists' survival depended on them.
---
q: How did most labourers reach the Chesapeake tobacco colonies in the seventeenth century?
a: As enslaved Africans, from the very beginning.
x: Africans arrived from 1619, but most seventeenth-century labourers were European servants.
a: As free wage labourers paid in silver.
x: Most came bound by indentures in return for their passage.
a*: As indentured servants, who worked for several years in return for their passage; most European migrants, by many estimates three-quarters, came this way.
a: As convicts transported for life.
x: Some convicts were sent, but most migrants were indentured servants.
hint: Think of contracts for passage.
why: The shift from indentured servants to enslaved Africans transformed Chesapeake society in the late seventeenth century.
```

## The Making of Racial Slavery

During the second half of the seventeenth century, Virginia and Maryland turned from servants to enslaved Africans, and wrote racial slavery into law. In 1662 Virginia declared that a child's status, slave or free, followed that of the mother, reversing the English rule that status came from the father and making slavery hereditary through enslaved women. In 1676 **Bacon's Rebellion**, a revolt of frontier settlers led by Nathaniel Bacon against the governor, demanded war on Native peoples and burned Jamestown; Bacon offered freedom to the servants, and some of the enslaved people, of the governor's supporters if they joined him. The historian Edmund Morgan argued that as enslaved Africans replaced servants, largely for economic reasons, Virginia's elite gradually came to use race to bind poor whites to them and divide them from enslaved Black people. In 1705 Virginia gathered its laws into a comprehensive slave code, a model for other southern colonies.

Slavery took different forms across the colonies, as the historian Ira Berlin has shown. In South Carolina, founded in 1670 with planters from Barbados, enslaved Africans were a majority of the population by the early eighteenth century, cultivating **rice** in the coastal lowlands. The geographer Judith Carney has argued that West African rice-growers brought crucial expertise, a claim other historians such as David Eltis have challenged. In September 1739, at the **Stono River**, some twenty enslaved men rose, killed colonists, and marched south towards Spanish Florida, which promised freedom to runaways; they were defeated within days. Historians such as John Thornton have suggested that many were Catholics from the kingdom of Kongo. Slavery also existed in New England and the middle colonies, especially in port towns such as New York.

## Many Colonies, Many Peoples

The mainland colonies differed greatly.

- **New Netherland**, founded by the Dutch West India Company from 1624, with its port of New Amsterdam on Manhattan, was a diverse trading colony of several thousand people when an English fleet took it in 1664. It became **New York**.
- **Pennsylvania**, founded in 1681 by the Quaker **William Penn**, offered religious toleration and attracted English, Welsh, German, and Scots-Irish settlers. Penn bought land from the Lenape, but in the **Walking Purchase** of 1737 his heirs used a doubtful old deed and hired fast runners on a cleared path to claim a vast tract, a transaction widely regarded as a fraud.
- **New France**, with its centre at Quebec on the St Lawrence, was a thinly settled colony whose wealth came from the **fur trade** with Native allies such as the Wendat (Huron). In 1649 the Haudenosaunee, armed with Dutch guns, defeated and dispersed the Wendat, already weakened by epidemics; the Wendat nation survives today at Wendake, near Quebec. In the Great Lakes region, the historian Richard White has described a "middle ground" where French and Algonquian peoples built shared customs of trade, alliance, and gift-giving.
- **New Spain's northern frontier** reached into what is now New Mexico. In August 1680 the Pueblo peoples, organised by the Tewa religious leader **Po'pay**, rose together in the **Pueblo Revolt**, killing about 400 Spaniards, including 21 of the 33 Franciscan friars, and driving the colonists south to El Paso. The Spanish did not return until 1692.

The Haudenosaunee pursued their own diplomacy, playing the English and French against each other. Their alliance with the English, known as the **Covenant Chain**, framed relations in the northeast for three-quarters of a century, until the Mohawk declared it broken in 1753 over stolen lands.

{{image: Pueblo Revolt | The Pueblo Revolt of 1680 drove Spanish colonists out of New Mexico for twelve years.}}

## Witchcraft, Religion, and the Atlantic Economy

In 1692 accusations of witchcraft in **Salem Village**, Massachusetts, spiralled into the largest witch-hunt in colonial America. Nineteen people were hanged, one man, Giles Corey, was pressed to death with stones for refusing to plead, and several more died in prison. One of the first accused was **Tituba**, an enslaved woman in the household of the village minister.

The colonies were bound into an Atlantic economy. They exported tobacco, rice, indigo, grain, fish, and timber, and New England ships carried food and lumber to the sugar islands of the Caribbean, whose plantations were worked by enslaved Africans. In return colonists bought ever more British manufactured goods, a "consumer revolution" of cloth, tea, and ceramics.

From the late 1730s a wave of evangelical revivals, the **Great Awakening**, swept the colonies. The English preacher **George Whitefield** toured the colonies from 1739, drawing crowds of thousands, and the Massachusetts minister **Jonathan Edwards** preached *Sinners in the Hands of an Angry God* in 1741. Revivals divided congregations, encouraged people to judge their ministers for themselves, and drew in many enslaved and free Black people, the beginnings of African American Protestant Christianity.

## The Seven Years' War

In 1754 fighting broke out between Britain and France for control of the Ohio Valley, beginning with a skirmish in which a young Virginia officer, **George Washington**, attacked a French party at Jumonville Glen. The conflict merged into a world war, the **Seven Years' War** (1756–1763), fought in Europe, India, West Africa, and the Caribbean as well as North America. By the Treaty of Paris in 1763, France gave up Canada and its lands east of the Mississippi to Britain, having secretly ceded Louisiana to Spain.

For Native nations, the French defeat removed a counterweight to British power. In 1763 the Odawa leader **Pontiac** and a coalition of Great Lakes and Ohio peoples attacked British forts in what became known as **Pontiac's War**, besieging Detroit for months. During the siege of Fort Pitt, the fort's commander and a trader gave two Delaware envoys blankets and a handkerchief from the smallpox hospital, hoping to spread the disease; whether it caused the epidemic that followed is debated. The British government's **Royal Proclamation of 1763** drew a line along the Appalachians beyond which colonists were forbidden to settle. Colonists resented the line, and Britain's efforts to tax them to pay for the war and the defence of the frontier, which led to the crisis described in the chapter on the American Revolution.

```checkpoint
q: What did Virginia's law of 1662 establish?
a: That all Africans in Virginia were free.
x: The law entrenched slavery.
a*: That a child's status, slave or free, followed that of the mother, making slavery hereditary through enslaved women.
a: That indentured servants could never be freed.
x: The 1662 law concerned the status of children of enslaved women.
a: That Native peoples could not be enslaved.
x: The 1662 law concerned the children of enslaved African women.
hint: Think of the mother.
why: The 1662 law reversed English practice and made racial slavery hereditary.
---
q: What was the Pueblo Revolt of 1680?
a: A rebellion of English servants in Virginia.
x: That was Bacon's Rebellion in 1676.
a: A war between the Haudenosaunee and the Wendat.
x: The Haudenosaunee dispersed the Wendat in 1649.
a: A revolt of enslaved Africans at the Stono River.
x: The Stono Rebellion took place in South Carolina in 1739.
a*: A coordinated rising of the Pueblo peoples, organised by Po'pay, that drove the Spanish out of New Mexico until 1692.
hint: Think of New Mexico.
why: The Pueblo Revolt was one of the most successful Native resistances to European colonisation.
```

## Further exploration

- **Alan Taylor, *American Colonies: The Settling of North America* (2001).** A continental history including Spanish, French, Dutch, and Native perspectives.
- **Daniel K. Richter, *Facing East from Indian Country: A Native History of Early America* (2001).** Early America from Native perspectives.
- **Kathleen DuVal, *Native Nations: A Millennium in North America* (2024).** Native political power over a thousand years.
- **Pekka Hämäläinen, *Indigenous Continent: The Epic Contest for North America* (2022).** Native power and European empires.
- **Edmund S. Morgan, *American Slavery, American Freedom: The Ordeal of Colonial Virginia* (1975).** Slavery and freedom in Virginia.
- **Ira Berlin, *Many Thousands Gone: The First Two Centuries of Slavery in North America* (1998).** The varieties of colonial slavery.
- **Richard White, *The Middle Ground: Indians, Empires, and Republics in the Great Lakes Region, 1650–1815* (1991).** French and Native accommodation.$em_colam_master$,
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
  select $em_colam_quiz$[
    {"type": "mcq", "prompt": "Where had the Africans sold at Point Comfort, Virginia, in 1619 been captured?", "options": ["In the kingdom of Benin", "In the kingdom of Ndongo, in Angola", "In Senegambia", "In Madagascar"], "answerIndex": 1, "explanation": "They were captured in Portuguese-led wars against Ndongo and seized at sea from the slave ship San Juan Bautista, bound for Veracruz.", "id": "q1"},
    {"type": "mcq", "prompt": "What happened at Mystic in 1637?", "options": ["English forces and their Mohegan and Narragansett allies burned a fortified Pequot village, killing an estimated 400 to 700 people", "The Pilgrims signed a treaty with the Wampanoag", "Metacom was killed", "The Haudenosaunee dispersed the Wendat"], "answerIndex": 0, "explanation": "The massacre was the decisive event of the Pequot War.", "id": "q2"},
    {"type": "mcq", "prompt": "What was the Walking Purchase of 1737?", "options": ["The purchase of Manhattan by the Dutch", "The sale of Louisiana to Spain", "A peace treaty ending King Philip's War", "A land deal in which Penn's heirs used a doubtful deed and hired fast runners to claim a vast tract of Lenape land"], "answerIndex": 3, "explanation": "It is widely regarded as a fraud.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Royal Proclamation of 1763 do?", "options": ["It abolished slavery in the colonies", "It gave Canada to France", "It forbade colonial settlement west of a line along the Appalachians", "It ended the Great Awakening"], "answerIndex": 2, "explanation": "Colonists resented the line, which contributed to the crisis leading to revolution.", "id": "q4"},
    {"type": "open", "prompt": "How did racial slavery become established in the English mainland colonies?", "rubric": "A strong answer covers the arrival of Africans from Ndongo in 1619 and their initially unfixed status, the reliance on indentured servants, the 1662 law on the mother's status, Bacon's Rebellion and Morgan's interpretation of how race came to divide poor whites from enslaved Black people, the 1705 Virginia code, South Carolina's rice economy and the Carney–Eltis debate, the Stono Rebellion, and Berlin's point that slavery varied across regions, including the north.", "id": "q5"},
    {"type": "open", "prompt": "Why do historians such as Richter, DuVal, and Hämäläinen argue for seeing colonial North America from 'Indian country'?", "rubric": "A strong answer explains that Native nations controlled most of the continent for most of the period, with examples: Powhatan and Opechancanough, Ousamequin's alliance, the Pequot and King Philip's wars, the Haudenosaunee and the Covenant Chain, the Wendat and the French fur trade, White's middle ground, the Pueblo Revolt, and Pontiac's War, and considers the effects of epidemics and settler expansion.", "id": "q6"}
  ]$em_colam_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/colonial-america', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
