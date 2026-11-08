-- The Rise of Absolutism — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/the-rise-of-absolutism @ research/advanced/read.
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
    'history/early-modern-period/the-rise-of-absolutism',
    'research',
    'advanced',
    'read',
    $em_absolutism_master$> **In the seventeenth century** many European monarchs claimed a power that answered to God alone, free of parliaments, estates, and traditional checks. Historians call this ideal **absolutism**, and its model was Louis XIV of France. This chapter examines the theory of sovereignty, the making of the French absolute monarchy, the "military revolution" and the fiscal-military state, Prussia and the Habsburgs, and the English and Dutch alternatives. It also asks whether absolutism was ever as absolute as it claimed, and sets Europe's monarchies beside their contemporaries in Asia and Africa, from the Qing emperor Kangxi to Morocco's Moulay Ismail, who faced the same problems of taming nobles, paying armies, and ruling diverse realms.

## The Theory of Sovereignty

The religious wars of the sixteenth century, described in the chapter on the Reformations, convinced many thinkers that only a strong, undivided authority could keep the peace. The French jurist **Jean Bodin**, in his *Six Books of the Commonwealth* (1576), defined sovereignty as the absolute and perpetual power of a commonwealth to make law, a power that could not be shared. Bodin did not think the king could do anything he liked: he was bound by divine and natural law and should respect his subjects' property. But no human institution could lawfully resist him.

The bishop **Jacques-Bénigne Bossuet**, tutor to Louis XIV's son, gave the theory a religious form: kings were God's lieutenants on earth, and to rebel against them was to rebel against God. This was the **divine right of kings**.

The English philosopher **Thomas Hobbes**, writing after his country's civil war, reached a similar conclusion by a very different route. In *Leviathan* (1651) he argued that without a sovereign power, human beings would live in a "state of nature", a war of all against all.

```quote
And the life of man, solitary, poore, nasty, brutish, and short.
Thomas Hobbes · Leviathan, chapter 13 · 1651
```

To escape it, people agreed to hand power to a sovereign, whose authority must be undivided. Hobbes's argument rested on consent and self-interest, not on God, which made it unwelcome to many royalists as well as to their enemies.

## France: From Richelieu to Louis XIV

France in 1600 was a patchwork of provinces with their own laws, estates, and privileges, a powerful nobility, and a Protestant minority, the Huguenots, with fortified towns guaranteed by the Edict of Nantes (1598). As chief minister to Louis XIII from 1624 to 1642, **Cardinal Richelieu** set out to strengthen royal power. He took the Huguenot stronghold of **La Rochelle** in 1628 and removed the Huguenots' military privileges, though not their freedom of worship; sent royal commissioners, the *intendants*, into the provinces; and fought the Habsburgs in the Thirty Years' War, financed by rising taxes that provoked many peasant revolts.

When Louis XIV came to the throne as a child in 1643, the cardinal **Mazarin** governed in his name. From 1648 to 1653 the **Fronde**, a series of rebellions by the Paris law courts and then by great nobles, drove the young king from Paris. Louis never forgot it.

On Mazarin's death in 1661, **Louis XIV** (reigned 1643–1715) announced that he would rule without a chief minister. He chose the sun as his emblem. His achievements were real:

- **Versailles.** From 1682 the court lived at the vast new palace of Versailles outside Paris. Great nobles were drawn into an elaborate ceremonial of royal rising and retiring, gambling, and festivals, competing for the king's favour and pensions. The sociologist Norbert Elias described this "court society" as a means of taming the warrior nobility.
- **The army.** The French army grew to several hundred thousand men in wartime, the largest in Europe, paid and supplied by the state.
- **Colbert's mercantilism.** The finance minister **Jean-Baptiste Colbert** promoted manufactures, roads and canals, a navy, and overseas trading companies, believing that a nation's wealth lay in exporting more than it imported.
- **Religious uniformity.** In 1685, by the Edict of Fontainebleau, Louis revoked the Edict of Nantes and banned Protestant worship. Perhaps two hundred thousand Huguenots fled to the Dutch Republic, England, Prussia, and beyond, taking their skills with them.

In the same year, 1685, Louis issued the **Code Noir**, the law governing slavery in France's Caribbean colonies. It regulated the punishment, sale, and religion of enslaved Africans, treated them as property, and permitted brutal punishments, while also requiring their baptism as Catholics. The absolutist state that sought order at home also wrote the rules of the plantation colonies, whose history the chapter on the Atlantic slave trade traces.

Louis's wars, for the Rhine frontier and then for the Spanish succession, nearly bankrupted France. The phrase often attributed to him, *"L'État, c'est moi"* ("I am the state"), is almost certainly apocryphal.

{{image: Palace of Versailles | The Palace of Versailles, Louis XIV's court from 1682 and the model for royal palaces across Europe.}}

```checkpoint
q: Why did Louis XIV bring the great nobles to live at Versailles?
a*: To draw them into a court ceremonial where they competed for royal favour and pensions, taming their independent power.
a: Because Paris had been destroyed in the Fronde.
x: Paris was not destroyed; but the Fronde had shown the danger of independent nobles.
a: To give them seats in a powerful parliament.
x: Louis ruled without the Estates-General, which did not meet between 1614 and 1789.
a: To train them as Protestant ministers.
x: Louis revoked toleration for Protestants in 1685.
hint: Think of Norbert Elias's "court society".
why: Versailles turned a warrior nobility into courtiers dependent on the king.
---
q: What did Louis XIV do in 1685?
a: He abolished slavery in the French colonies.
x: The Code Noir of 1685 regulated, and entrenched, slavery.
a: He made peace with the Dutch Republic and England permanently.
x: Louis fought the Dutch and English repeatedly.
a*: He revoked the Edict of Nantes, banning Protestant worship, and issued the Code Noir governing slavery in the Caribbean colonies.
a: He granted freedom of worship to all religions.
x: He did the opposite, banning Protestant worship.
hint: Two edicts, one at home and one overseas.
why: Both edicts show the absolutist pursuit of order and uniformity, at heavy human cost.
```

## War and the Fiscal-Military State

Why did monarchs need so much power? Above all, to make war. In 1955 the historian Michael Roberts argued that a **"military revolution"** had taken place between 1560 and 1660, as new tactics and drill made armies larger and more expensive; Geoffrey Parker extended the argument to the new artillery fortresses, the *trace italienne*, which required ever larger armies to besiege them. Armies of a few tens of thousands grew to hundreds of thousands. The sociologist Charles Tilly summed up the result: war made the state, and the state made war. To pay for armies, rulers needed taxes, loans, and bureaucracies, creating what historians call the **fiscal-military state**.

## Prussia and the Habsburgs

The Hohenzollern rulers of **Brandenburg-Prussia**, a scattered set of poor territories, built one of Europe's most formidable armies. **Frederick William, the Great Elector** (reigned 1640–1688), made a bargain with the landed nobility, the Junkers: they accepted royal taxation and served as army officers, and in return gained full control over their serfs. He also welcomed Huguenot refugees after 1685. His son became the first king in Prussia in 1701, and his grandson, Frederick William I, the "soldier king", made the army so central that Prussia was later described as an army with a state rather than a state with an army.

The Austrian **Habsburgs** ruled a very different realm, a collection of kingdoms and duchies, Austria, Bohemia, and Hungary among them, each with its own laws and estates. They imposed Catholicism in Bohemia after 1620, but in Hungary had to negotiate with powerful nobles. After the Ottoman siege of **Vienna** failed in 1683, as the chapter on the Ottomans described, Habsburg armies reconquered Hungary, and the monarchy became a great power. It remained a multinational dynastic empire, comparable in some ways to the Ottomans it fought.

## The English and Dutch Alternatives

Not every European state went the absolutist way. In **England**, the Stuart kings' attempts to rule and tax without Parliament led to civil war from 1642. Parliament's New Model Army won, and in 1649 **Charles I** was tried and beheaded. After a republic under **Oliver Cromwell**, which also conquered Ireland with great brutality, the monarchy was restored in 1660. When James II, a Catholic, seemed to threaten Protestantism and Parliament, his son-in-law **William of Orange**, ruler of the Dutch Republic, invaded in 1688. In this **"Glorious Revolution"** James fled, and the **Bill of Rights** of 1689 established that the king could not raise taxes or keep an army in peacetime without Parliament's consent.

The result was a powerful state of a different kind. Parliament's control of taxation made lenders trust the government, and the Bank of England (1694) and a national debt allowed Britain to borrow cheaply and fight long wars, what the historian John Brewer called the "sinews of power". The **Dutch Republic**, a federation of provinces governed by merchant oligarchies, had already shown that a state without a strong monarch could dominate world trade and finance.

## Was Absolutism Absolute?

Historians have increasingly questioned the term. Studying the province of Languedoc, William Beik showed that Louis XIV's power rested on cooperation with local elites, who gained privileges, offices, and a share of taxes in return. Nicholas Henshall went further, calling absolutism a "myth": French and English monarchies had more in common than their ideologies suggested. No early modern king had the means to control his subjects' lives as a modern state can, and local law, custom, and privilege limited royal power everywhere.

## Absolutism in a Global Frame

Europe's monarchs were not alone. Across Eurasia and Africa, rulers of this period built larger armies, more centralised administrations, and more elaborate court rituals, often to tame nobles and fund war.

- **Qing China.** The **Kangxi emperor** (reigned 1661–1722), Louis XIV's contemporary, ruled the world's largest population, crushed the revolt of the Three Feudatories in 1673–1681, and conquered Taiwan in 1683. In 1685 Louis sent a group of Jesuit mathematicians to China, and one of them, Joachim Bouvet, later wrote a portrait of Kangxi for the French king. Some European writers admired Chinese government as a model of rational rule by educated officials.
- **Tokugawa Japan.** As the chapter on the Tokugawa described, the shogun's alternate-attendance system kept the daimyō's families as hostages in Edo and drained their wealth, an arrangement historians have compared with Versailles.
- **The Ottomans and Mughals** ruled through military slavery, rotating revenue assignments, and imperial ceremony, as the chapters on them described.
- **Morocco.** **Moulay Ismail** (reigned 1672–1727), another contemporary of Louis XIV, built a vast palace city at Meknes and a standing army of enslaved and conscripted Black soldiers, the *Abid al-Bukhari*, loyal to the sultan alone. He exchanged embassies with Louis XIV; his envoy Abdallah ben Aisha was received at Versailles in 1699.
- **Southeast Asia.** The historian Victor Lieberman, in *Strange Parallels*, has shown that Burma, Siam, and Vietnam went through cycles of political consolidation that paralleled those of France and Russia across the same centuries.

Seen in this frame, absolutism looks less like a peculiarly European path and more like one version of a widespread early modern project: building states strong enough to survive in an age of gunpowder war.

```checkpoint
q: What was the significance of the Glorious Revolution of 1688–1689?
a: It made the English king an absolute monarch.
x: It did the opposite, limiting the crown.
a*: It established, through the Bill of Rights, that the crown could not tax or keep a peacetime army without Parliament's consent, creating a strong but limited state.
a: It ended the monarchy in England.
x: The monarchy continued under William and Mary.
a: It made England part of the Dutch Republic.
x: William of Orange became king, but the two states remained separate.
hint: Think of Parliament's control of money.
why: Parliamentary consent made Britain's borrowing credible and its state strong, an alternative to absolutism.
---
q: Why do historians such as Beik and Henshall question the idea of "absolutism"?
a: Because Louis XIV never existed.
x: Louis XIV's reign is extremely well documented.
a: Because kings had no power at all.
x: The argument is that power was negotiated, not absent.
a: Because absolutism was invented in the twentieth century in China.
x: The term was coined by historians to describe early modern European monarchies.
a*: Because royal power depended on cooperation with local elites, who were rewarded with privileges and offices, and was limited everywhere by law, custom, and privilege.
hint: Think of Languedoc and its elites.
why: The "absolute" monarch was in practice a negotiator with powerful interests.
```

## Further exploration

- **Peter Burke, *The Fabrication of Louis XIV* (1992).** How the king's image was made.
- **William Beik, *Absolutism and Society in Seventeenth-Century France* (1985).** Royal power and provincial elites in Languedoc.
- **Nicholas Henshall, *The Myth of Absolutism* (1992).** A challenge to the concept.
- **Geoffrey Parker, *The Military Revolution: Military Innovation and the Rise of the West, 1500–1800* (1988).** War and the early modern state.
- **John Brewer, *The Sinews of Power: War, Money and the English State, 1688–1783* (1989).** The British fiscal-military state.
- **Victor Lieberman, *Strange Parallels: Southeast Asia in Global Context, c. 800–1830* (2 vols., 2003–2009).** Southeast Asian and European state-building compared.$em_absolutism_master$,
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
  select $em_absolutism_quiz$[
    {"type": "mcq", "prompt": "How did Jean Bodin define sovereignty?", "options": ["As the absolute and perpetual power to make law, which could not be shared", "As power shared equally between king and parliament", "As the right of the people to elect their rulers", "As the authority of the pope over kings"], "answerIndex": 0, "explanation": "Bodin's Six Books of the Commonwealth (1576) responded to the French wars of religion.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the Code Noir of 1685 regulate?", "options": ["The ceremonial of Versailles", "The rights of Huguenots", "Trade with Qing China", "Slavery in France's Caribbean colonies"], "answerIndex": 3, "explanation": "Issued in the same year as the revocation of the Edict of Nantes, it treated enslaved Africans as property.", "id": "q2"},
    {"type": "mcq", "prompt": "What did John Brewer mean by Britain's 'sinews of power'?", "options": ["Britain's absolute monarchy", "Parliamentary taxation and borrowing that let Britain fund long wars", "Its army of serfs", "The court at Versailles"], "answerIndex": 1, "explanation": "Parliament's consent made lenders trust the state, creating a powerful fiscal-military state.", "id": "q3"},
    {"type": "mcq", "prompt": "Which ruler, a contemporary of Louis XIV, built a palace city at Meknes and an army of Black soldiers loyal to him alone?", "options": ["The Kangxi emperor", "The Great Elector", "Moulay Ismail of Morocco", "Shah Abbas"], "answerIndex": 2, "explanation": "Moulay Ismail exchanged embassies with Louis XIV; his envoy was received at Versailles in 1699.", "id": "q4"},
    {"type": "open", "prompt": "How did Louis XIV strengthen royal power in France, and how 'absolute' was it in practice?", "rubric": "A strong answer discusses Richelieu and the intendants, the Fronde, personal rule from 1661, Versailles and court society, the army, Colbert's mercantilism, the revocation of the Edict of Nantes and the Code Noir, and the cost of war; and it weighs the revisionist arguments of Beik and Henshall that royal power depended on cooperation with elites and was limited by law and privilege.", "id": "q5"},
    {"type": "open", "prompt": "Was absolutism a peculiarly European phenomenon? Compare European monarchies with contemporary states elsewhere.", "rubric": "A strong answer compares France, Prussia, and the Habsburgs with Qing China under Kangxi, Tokugawa alternate attendance, Ottoman and Mughal methods, Moulay Ismail's Morocco, and Lieberman's Southeast Asian parallels, considering war, taxation, nobles, ceremony, and military slavery, and noting the English and Dutch alternatives.", "id": "q6"}
  ]$em_absolutism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/the-rise-of-absolutism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
