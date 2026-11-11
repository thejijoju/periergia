-- Declarations of Independence: the American Revolution — canonical master article, co-written and human-reviewed.
-- history/age-of-revolutions/declarations-of-independence-the-american-revolution @ research/advanced/read.
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
    'history/age-of-revolutions/declarations-of-independence-the-american-revolution',
    'research',
    'advanced',
    'read',
    $ar_amrev_master$> **A revolution for some, a catastrophe for others.** Between 1763 and 1789 thirteen British colonies argued their way out of an empire, fought a war that became a global conflict, and built a republic under a written constitution. This chapter follows the imperial crisis from the Stamp Act to the Coercive Acts, the Declaration of Independence and the ideas behind it, the war from Saratoga to Yorktown and the Treaty of Paris, and the road to the Constitution. Throughout, it asks what the Revolution meant for those it left out or only partly included: enslaved and free Black Americans, Native nations, women, Loyalists, and the soldiers of France, Spain, the Dutch Republic, Saint-Domingue and India whose wars became part of it.

## An Empire in Debt

The crisis began with a British victory. In the French and Indian War (1754–1763) Britain defeated France and took New France east of the Mississippi, but was left with a national debt of £133 million; debt payments took £5 million of an £8 million annual budget. Ministers concluded that the colonists should contribute more, and George Grenville claimed they paid far less than people in England, a political claim rather than a measured statistic.

Victory also raised the question of the West. Native anger at General Jeffery Amherst's policies led to Pontiac's War (1763–1766), and George III's Royal Proclamation of 7 October 1763 barred new settlement west of the Appalachians, reserving that land for Native peoples. Settlers and land speculators resented it, and it did not stop westward migration. From the start, the imperial crisis was also a contest over Native land. Grenville's Sugar Act of 1764 halved the duty on foreign molasses but tightened enforcement and sent smugglers to vice-admiralty courts without juries. The trade it touched was bound up with slavery: French West Indian molasses became New England rum, and the rum was traded for enslaved Africans.

## Rights, Representation and Resistance

Underneath the quarrels over taxes lay a constitutional question. Since 1688 British orthodoxy held that Parliament was supreme throughout the empire. Colonists replied that the British constitution protected fundamental rights and that they were not represented in Parliament. Parliament answered that they had "virtual representation", like the many Britons who could not vote; James Otis retorted that no member answered to any colonial constituency. The objection, summed up as "No taxation without representation", was to the principle, not the amount: the taxes were low.

The **Stamp Act** of 1765 taxed legal documents, newspapers, pamphlets and even playing cards. Sons of Liberty formed in every colony, Boston crowds looted Thomas Hutchinson's house, and nine colonies sent delegates to a Stamp Act Congress. Pressed by British merchants hurt by boycotts, Parliament repealed the act in March 1766, but the Declaratory Act asserted its power to legislate for the colonies "in all cases whatsoever". The **Townshend duties** of 1767 on glass, lead, paints, paper and tea met fresh boycotts, and those boycotts depended on women. Through spinning bees and the homespun movement the "Daughters of Liberty" replaced British cloth; in 1769 Boston women produced 40,000 skeins of yarn.

Troops arrived in Boston in 1768. On 5 March 1770 soldiers fired into a crowd throwing clubs, stones and snowballs, and five people died. Crispus Attucks, a sailor of African and, most historians agree, Wampanoag descent, is traditionally counted as the first killed. John Adams defended the soldiers; six were acquitted and two convicted of manslaughter. Parliament then repealed most of the Townshend duties but kept the tax on tea. When the Tea Act of 1773 let the struggling East India Company sell tea directly to the colonies, men disguised as Native Americans dumped 340 or 342 chests of it into Boston harbour on 16 December 1773. Parliament replied in 1774 with the Coercive Acts, closing the port of Boston and curbing Massachusetts self-government.

## From Protest to War

The **First Continental Congress** met in Philadelphia in September 1774, with 56 delegates from twelve colonies. By one vote it shelved Joseph Galloway's plan for a colonial parliament inside the empire, and it adopted a boycott of British goods enforced by local committees. On 25 October 1774, 51 women of Edenton, North Carolina, led by Penelope Barker, signed a statement backing the boycott, one of the earliest known political protests organised by women in the colonies.

Fighting began at Lexington and Concord on 19 April 1775. At Bunker Hill on 17 June, fought mostly on Breed's Hill, the British took the American redoubt at the third assault, losing 226 killed and 828 wounded. The **Second Continental Congress** created the Continental Army and named George Washington its commander, while still sending the king an Olive Branch Petition. George III declared the colonies in rebellion. In November **Dunmore's Proclamation**, issued in Virginia, promised freedom to "indented servants, Negroes, or others" belonging to rebels who would bear arms for the king. Between 800 and 2,000 people escaped to form the "Ethiopian Regiment", soon ravaged by smallpox and typhoid. The proclamation pushed white southerners towards independence; Simon Schama argues that for southern Patriots, "Theirs was a revolution, first and foremost, mobilized to protect slavery."

## Common Sense and the Declaration

In January 1776 Thomas Paine's anonymous pamphlet *Common Sense* attacked monarchy itself and promised that "We have it in our power to begin the world over again." It also warned that Britain "hath stirred up the Indians and the Negroes to destroy us". Its sales are disputed, but it was often read aloud in taverns. The historian Pauline Maier found more than 90 local and state "declarations of independence" from April to July 1776. On 2 July Congress adopted Richard Henry Lee's resolution that the colonies were "free and independent States", with New York abstaining. Thomas Jefferson, for a Committee of Five that included John Adams and Benjamin Franklin, had drafted a declaration; Congress cut it by about a quarter, "mangled" it in Jefferson's view, and approved it on 4 July 1776. Most delegates signed the parchment on 2 August.

{{image: United States Declaration of Independence | The Declaration of Independence. Congress approved the text on 4 July 1776; most delegates signed the engrossed parchment on 2 August.}}

```quote
We hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.
Declaration of Independence · Preamble · 4 July 1776
```

Whenever a government became destructive of these ends, the preamble continued, "it is the Right of the People to alter or to abolish it". Most of the text, though, listed 27 grievances against George III, including that he had "excited domestic insurrections amongst us", a reference to Dunmore, and tried to bring on the frontiers "the merciless Indian Savages". Universal rights and a view of Black and Native Americans as tools of tyranny sat in the same document.

## Ideas and Their Historians

Jefferson drew most directly on George Mason's draft Virginia Declaration of Rights and his own draft for Virginia's constitution. John Locke, with his natural rights and right of revolution, is usually cited as the main influence; Carl Becker made that case in 1922. Garry Wills argued instead for the Scottish Enlightenment, a reading Ronald Hamowy and others strongly criticised. David Armitage stresses Vattel's *Law of Nations* and argues that the Declaration's primary purpose was "to express the international legal sovereignty of the United States": foreign powers would not aid a merely internal rebellion.

The larger argument is about what drove the Revolution. Progressive historians such as Charles Beard saw its rhetoric as cover for economic interests. From the 1960s Bernard Bailyn, Gordon Wood and J. G. A. Pocock built a "republican synthesis" stressing civic virtue and fear of corruption, standing armies and conspiracy; Bailyn argued that the colonists' fear of a "ministerial conspiracy against liberty" was sincere. Isaac Kramnick and Joyce Appleby put Locke and individualism back at the centre, and the question is still debated. So is the Revolution's radicalism: Wood argued that it was socially radical, Gary Nash wrote its history from below, and Edmund Morgan replied that popular movements were "disparate, local, and mostly unsuccessful".

```checkpoint
q: Why did colonists object to the Stamp Act and the Townshend duties?
a*: Because a Parliament in which the colonists were not represented had imposed them.
a: Because the taxes were far higher than those paid in England.
x: The taxes were low; the colonists objected to the principle, not the amount.
a: Because the East India Company collected them.
x: The East India Company figured in the Tea Act of 1773, not in collecting these taxes.
a: Because they fell only on enslaved people.
x: The Stamp Act taxed documents, newspapers and playing cards; the Townshend duties taxed imports.
hint: Think of the slogan, and of "virtual representation".
why: The dispute was constitutional: whether Parliament could tax people who sent no members to it.
---
q: What is David Armitage's main argument about the Declaration of Independence?
a: That it was modelled on the Declaration of Arbroath of 1320.
x: Most scholars no longer accept Arbroath as a model.
a: That it was written mainly for George III.
x: Armitage stresses foreign governments as its audience.
a*: That its primary purpose was to express the international legal sovereignty of the United States.
a: That its central purpose was to abolish slavery.
x: Congress deleted Jefferson's passage on the slave trade, and the Declaration abolished nothing.
hint: Think of Vattel's Law of Nations and the need for foreign aid.
why: Independence had to be announced to the world before foreign powers would help.
```

## The Contradiction of Slavery

Jefferson, a major slaveholder (about 600 enslaved people lived at Monticello over the decades), had included a passage blaming George III for the slave trade, a "cruel war against human nature itself". Congress struck it out, to appease South Carolina and Georgia, Jefferson said, and because northerners, too, had been "pretty considerable carriers" of enslaved people to others. Critics saw the contradiction at once. Samuel Johnson asked "how is it that we hear the loudest yelps for liberty among the drivers of negroes?", and Thomas Hutchinson asked how slaveholders could proclaim that all men are created equal.

Black Americans made the argument from inside the Revolution. Phillis Wheatley, born in West Africa and enslaved in Boston, had published in 1773 the first book of poetry by an African American. The minister Lemuel Haynes wrote that "Liberty is Equally as pre[c]ious to a Black man, as it is to a white one." Many enslaved people sought freedom behind British lines, and Clinton's Philipsburg Proclamation of 1779 offered it to anyone enslaved by rebels who reached them, whether or not they fought. South Carolina lost an estimated 25,000 enslaved people, about a third, to flight, migration or death, and Karen Cook Bell finds that roughly a third of escapees were women.

Others fought for the Patriots, though Black men were officially barred from the Continental Army from 1775 to 1778. Estimates of Black Patriots range from 5,000 to about 9,000, depending on what is counted. Eighty-eight enslaved men joined the 1st Rhode Island Regiment in 1778 on a promise of freedom; yet in 1781 Virginia offered volunteers a "healthy sound negro" as a bounty. After the war, northern states had all abolished slavery, mostly gradually, by 1804, and the free share of the Upper South's Black population rose from under 1 per cent to 8.3 per cent between 1790 and 1810.

## A World War

The Continental Army never had more than 48,000 men in all. Many were working-class men and recent immigrants, among them Scots-Irish from Ulster, while Britain hired German auxiliaries, notably from Hesse-Kassel. Washington lost New York in 1776 but won at Trenton and Princeton. On 17 October 1777 John Burgoyne surrendered at **Saratoga**, with 6,222 British and German soldiers captured. That winter at **Valley Forge**, where soldiers arrived along with women and children, roughly 1,700 to 2,000 soldiers died of disease.

France had sent secret aid since 1776. On 6 February 1778 it signed a commercial treaty that made it the first nation formally to recognise the United States, and an alliance barring a separate peace; the chapter on the French and Haitian revolutions picks up what that commitment came to mean for France. Spain entered the war in 1779 as France's ally, though never as an American ally; it besieged Gibraltar, and Bernardo de Gálvez, governor of Louisiana, conquered West Florida. The Dutch island of St. Eustatius had been a major channel for rebel arms, and Britain declared war on the Dutch Republic in 1780.

The war reached far beyond North America. In Saint-Domingue, France's Caribbean colony and later the scene of the Haitian Revolution, free men of colour and enslaved men promised freedom formed the Chasseurs-Volontaires de Saint-Domingue, and about 545 of them fought in the failed Franco-American siege of Savannah in 1779. In India, the Second Anglo-Mysore War (1780–1784) is counted as part of the same conflict. The decisive blow came at **Yorktown** in 1781. After de Grasse's French fleet beat a British fleet off the Chesapeake, Washington, Lafayette and Rochambeau, with about 19,800 men, more than half of them French, besieged Cornwallis, and some 7,400 to 7,700 surrendered on 19 October. One who helped was James Armistead, an enslaved man who spied for Lafayette. Because Virginia freed only enslaved men who had served as armed soldiers, he had to petition separately and was freed only in 1787.

By the **Treaty of Paris** of 3 September 1783, negotiated by Franklin, John Jay, Adams and Henry Laurens directly with Britain, Britain recognised independence and ceded the land east of the Mississippi. Spain received the Floridas and Menorca in separate treaties, and France gained Tobago and Senegal.

## The War in Indian Country

About 200,000 Native people lived east of the Mississippi, and most of those who took sides backed Britain, hoping to halt settler expansion. For the Haudenosaunee (Iroquois) the war became a civil war. In 1777 the Mohawk, Onondaga, Cayuga and Seneca sided with Britain while most Oneida and Tuscarora sided with the Americans, and at Oriskany Oneida fought other Haudenosaunee; oral histories call the site "A Place of Great Sadness". The Mohawk leader Joseph Brant (Thayendanegea) and the Seneca Cornplanter led raids on frontier settlements.

In 1779 the **Sullivan Expedition**, more than a third of the Continental Army, razed 40 Haudenosaunee villages and their crops. Just over 5,000 refugees fled to Fort Niagara, where several hundred died that winter. Some scholars call the campaign genocide; others dispute the term. The Haudenosaunee named Washington "Town Destroyer", and in 1790 Cornplanter told him that "when that name is heard, our women look behind them and turn pale". Neutrality was no protection: in 1782 Pennsylvania militia killed 96 pacifist Moravian Christian Indians, mostly Lenape and Mohican, at Gnadenhutten. In the south the Chickamauga Cherokee under Dragging Canoe fought on for about a decade after the peace.

The Treaty of Paris did not mention Britain's Native allies and handed their lands to the United States. "England had sold the Indians to Congress," Brant wrote in 1783. His followers received about two million acres along the Grand River in present-day Ontario, now the Six Nations Reserve. The historian Colin Calloway calls the Revolution "one of the darkest periods in American Indian history".

## Women, Loyalists and Exiles

Women worked as camp followers, cooks, nurses, spies and couriers; Deborah Sampson served over a year in the army disguised as "Robert Shurtleff", while "Molly Pitcher" is probably a composite legend. In 1776 Abigail Adams urged her husband John to think of women in the new laws (her spelling modernised here):

```quote
Remember the Ladies, and be more generous and favourable to them than your ancestors.
Abigail Adams · Letter to John Adams · 31 March 1776
```

"Remember all Men would be tyrants if they could," she added, and in the same letter doubted that Virginians who enslaved "their fellow Creatures" had such a "passion for Liberty". John laughed at her "extraordinary Code of Laws", and in May he warned against widening the franchise at all: "Women will demand a vote... every man, who has not a farthing, will demand an equal voice." Some states did experiment: Pennsylvania's constitution of 1776 gave the vote to almost all men, and New Jersey enfranchised some property-owning women, mostly widows, for about 25 years.

Not everyone wanted independence. Robert Calhoon estimates that 40 to 45 per cent of white colonists were Patriots and 15 to 20 per cent Loyalists. Loyalists tended to be older, Anglican, merchants with imperial ties, royal officials or recent immigrants; Benjamin Franklin's son William, royal governor of New Jersey, never spoke to his father again. Maya Jasanoff counts about 60,000 Loyalists who left, among them about 8,000 free Black people, taking some 15,000 enslaved people with them; other estimates differ, and most Loyalists stayed. About 34,000 refugees reached Nova Scotia, leading to the creation of New Brunswick in 1784.

For Black Loyalists exile was a new struggle. Sir Guy Carleton refused to return them to their American enslavers, and the *Book of Negroes* records about 3,000 evacuated from New York, mostly to Nova Scotia. There they received worse land or none, and in July 1784 white settlers attacked them in the Shelburne riots, the first recorded race riots in Canada. Thomas Peters, who had escaped slavery in North Carolina and served as a sergeant in the Black Pioneers, carried their petition to London in 1791. His mission helped bring about a resettlement: in 1792 about 1,100 to 1,200 Black Loyalists sailed from Halifax to Sierra Leone and founded **Freetown**. Their descendants became part of Sierra Leone's Krio people.

```checkpoint
q: Why did many Haudenosaunee see the Treaty of Paris of 1783 as a betrayal?
a: Because it created an independent Haudenosaunee state that they did not want.
x: The treaty created no Native state; it did not mention Britain's Native allies at all.
a*: Because it ignored Britain's Native allies and handed their lands to the United States.
a: Because it forced them to move to Sierra Leone.
x: The resettlement in Sierra Leone involved Black Loyalists from Nova Scotia.
a: Because it returned New France to French rule.
x: Britain had taken New France in 1763, and the treaty did not return it.
hint: Recall Joseph Brant's words in 1783.
why: Brant wrote that "England had sold the Indians to Congress"; his followers later received land along the Grand River.
---
q: What happened to many Black Loyalists after the war?
a: They were returned to their former enslavers under the peace treaty.
x: Sir Guy Carleton refused to hand back Black Loyalists who had reached British lines.
a: They were given the best farmland in Nova Scotia.
x: They received worse land or none, and were attacked in the Shelburne riots.
a: They formed the 1st Rhode Island Regiment.
x: That regiment fought for the Patriots from 1778.
a*: Many were evacuated to Nova Scotia, and in 1792 about 1,100 to 1,200 sailed on to Sierra Leone and founded Freetown.
hint: Think of the Book of Negroes and Thomas Peters.
why: Their journey from slavery to Nova Scotia to West Africa shows how far the Revolution's consequences reached.
```

## From Confederation to Constitution

The **Articles of Confederation**, in force from 1781, gave Congress a single chamber voting by state and no power to tax; it could only request money, and between 1781 and 1784 less than $1.5 million arrived. In 1786–1787 about 4,000 people in western and central Massachusetts rose against debt and tax collection in **Shays's Rebellion**; how far Daniel Shays led it, and how much it shaped what followed, are both debated. The **Constitutional Convention** met in Philadelphia from May to September 1787, with Washington presiding and James Madison's Virginia Plan as its basis, and 39 of its 55 delegates signed.

Slavery was written into the bargain. The three-fifths clause counted free persons plus "three fifths of all other Persons", excluding "Indians not taxed", in apportioning House seats; Congress could not ban the slave trade until 1808; and the fugitive slave clause was strengthened. The new government began on 4 March 1789.

## The Declaration's Global Afterlife

The Declaration became a standard to hold the republic to. The Seneca Falls Declaration of Sentiments of 1848 held that "all men and women are created equal", Frederick Douglass asked in 1852 "What to the Slave Is the Fourth of July?", and Lincoln invoked it at Gettysburg. Lafayette drafted France's Declaration of the Rights of Man in 1789 in consultation with Jefferson.

Armitage argues that abroad it mattered mainly as a declaration of statehood, founding a genre: he collects more than a hundred declarations of independence since 1776 and sees their spread as the passage from a world of empires to one of sovereign states. Haiti's declaration of 1804 drew on it, as did Venezuela's in 1811 and many in Spanish America, where translators such as Manuel García de Sena circulated it despite bans, as the chapter on Latin American independence explores. In 1945 Ho Chi Minh cited it in declaring Vietnam's independence. Rhodesia's declaration of 1965 copied the model while dropping "all men are created equal". The omission makes the point: the promise of equality, written by a slaveholder, has been claimed most urgently by those it left out.

## Further exploration

- **Bernard Bailyn, *The Ideological Origins of the American Revolution* (1967).** The Pulitzer-winning study of the pamphlets and the fear of a conspiracy against liberty.
- **Gordon S. Wood, *The Creation of the American Republic, 1776–1787* (1969).** The classic account of republican ideology from independence to the Constitution.
- **Alan Taylor, *American Revolutions: A Continental History, 1750–1804* (2016).** A continental history including Native, enslaved and imperial perspectives.
- **Maya Jasanoff, *Liberty's Exiles: American Loyalists in the Revolutionary World* (2011).** The global diaspora of the Loyalists and the people they enslaved.
- **Colin G. Calloway, *The American Revolution in Indian Country* (1995).** The war as Native communities experienced it.
- **Mary Beth Norton, *Liberty's Daughters: The Revolutionary Experience of American Women, 1750–1800* (1980).** A founding work of the women's history of the Revolution.
- **David Armitage, *The Declaration of Independence: A Global History* (2007).** The Declaration as the first of a worldwide genre.$ar_amrev_master$,
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
  select $ar_amrev_quiz$[
    {"type": "mcq", "prompt": "What did the Declaratory Act of 1766, passed when the Stamp Act was repealed, assert?", "options": ["That the colonies were free and independent states", "That Parliament could legislate for the colonies \"in all cases whatsoever\"", "That colonists would elect members of Parliament", "That the Royal Proclamation line was abolished"], "answerIndex": 1, "explanation": "Parliament gave way on the Stamp Act but insisted on its sovereignty over the colonies.", "id": "q1"},
    {"type": "mcq", "prompt": "Who were the Chasseurs-Volontaires de Saint-Domingue?", "options": ["A regiment of free men of colour and enslaved men promised freedom, about 545 of whom fought at the siege of Savannah in 1779", "Hessian soldiers hired by Britain", "Loyalist refugees who settled in Nova Scotia", "Spanish troops who captured West Florida"], "answerIndex": 0, "explanation": "Raised in Saint-Domingue in 1779, they took part in the failed Franco-American siege of Savannah, one sign of the war's global reach.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Sullivan Expedition of 1779 do?", "options": ["It captured Burgoyne's army at Saratoga", "It escorted Black Loyalists to Sierra Leone", "It defended Boston against the Coercive Acts", "It razed 40 Haudenosaunee villages and their crops, driving over 5,000 refugees to Fort Niagara"], "answerIndex": 3, "explanation": "The Haudenosaunee named Washington \"Town Destroyer\"; some scholars call the campaign genocide, while others dispute the term.", "id": "q3"},
    {"type": "mcq", "prompt": "Under the Constitution of 1787, how were House seats apportioned?", "options": ["Equally among the states", "By the number of property-owning men only", "By counting free persons plus three-fifths of \"all other Persons\", excluding \"Indians not taxed\"", "By the size of each state's territory"], "answerIndex": 2, "explanation": "The three-fifths clause wrote slavery into the Constitution's system of representation, alongside the 1808 slave-trade compromise and the fugitive slave clause.", "id": "q4"},
    {"type": "open", "prompt": "How did the American Revolution affect enslaved and free African Americans? Consider both sides of the war and its aftermath.", "rubric": "A strong answer discusses the contradiction of slavery in the Declaration (the deleted slave-trade passage, Johnson, Hutchinson, Haynes, Wheatley); Dunmore's and the Philipsburg Proclamations and mass flight to the British, including women; Black Patriots, the official ban of 1775–1778, the 1st Rhode Island Regiment and James Armistead; northern abolition and the rise in free Black people in the Upper South; and the Black Loyalists' evacuation, Nova Scotia, the Shelburne riots, Thomas Peters and the founding of Freetown in 1792. It may weigh Schama's claim that southern Patriots fought to protect slavery and note the slavery compromises of 1787.", "id": "q5"},
    {"type": "open", "prompt": "Was the American Revolution driven mainly by ideas or by interests? Assess the historians' debate.", "rubric": "A strong answer contrasts the Progressive reading (Beard: rhetoric as cover for economic interests) with Hartz's Lockean liberalism, the republican synthesis of Bailyn, Wood and Pocock (civic virtue, fear of corruption, a sincere fear of ministerial conspiracy), and the liberal rebuttal of Kramnick and Appleby; it may add debates over the Declaration's sources (Becker, Wills, Armitage), over radicalism (Wood, Nash, Morgan) and over slavery as a motive (Schama). It should use evidence from the imperial crisis, such as the representation dispute and the low level of the taxes.", "id": "q6"}
  ]$ar_amrev_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/age-of-revolutions/declarations-of-independence-the-american-revolution', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
