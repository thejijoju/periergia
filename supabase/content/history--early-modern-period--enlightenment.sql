-- The Enlightenment — canonical master article, co-written and human-reviewed.
-- history/early-modern-period/the-enlightenment @ research/advanced/read.
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
    'history/early-modern-period/the-enlightenment',
    'research',
    'advanced',
    'read',
    $em_enlight_master$> **The Enlightenment** was an eighteenth-century movement of thinkers who believed that reason, evidence, and open debate could improve human life. They attacked religious intolerance, torture, and arbitrary power, and argued for toleration, free inquiry, and government based on rights and consent. Their ideas inspired revolutions in America, France, Haiti, and Latin America, and remain the foundation of modern liberal democracy. Yet many Enlightenment thinkers also defended slavery, ranked human "races", and excluded women. This chapter covers the movement's ideas and institutions, its leading figures, its global sources and parallels, from Chinese philosophy to African and Latin American thinkers, its blind spots, and the debate over its legacy.

## What Was Enlightenment?

In December 1783 a Berlin journal, the *Berlinische Monatsschrift*, printed the question "What is enlightenment?". In 1784 the philosopher **Immanuel Kant** answered with a famous essay.

```quote
Enlightenment is man's emergence from his self-imposed immaturity.
Immanuel Kant · An Answer to the Question: What Is Enlightenment? (trans. Ted Humphrey) · 1784
```

Immaturity, Kant explained, was the inability to use one's own understanding without guidance from another. His motto was the Latin *sapere aude*, "dare to know". Thinking for oneself, and debating freely in public, was the heart of enlightenment.

## Foundations

The Enlightenment built on the Scientific Revolution, described in the previous chapter. **Isaac Newton**'s success in explaining the universe by a few laws suggested that reason might also discover the laws of society, politics, and morality. The English philosopher **John Locke** argued in *An Essay Concerning Human Understanding* (1689, dated 1690) that all knowledge comes from experience, so that people are shaped by education and environment, and in his *Two Treatises of Government* (1689, dated 1690) that governments exist to protect the natural rights of life, liberty, and property, and may be resisted if they violate them. In the Dutch Republic, **Baruch Spinoza** went further, identifying God with nature and arguing for freedom of thought; the historian Jonathan Israel sees this "radical Enlightenment" as the source of modern democratic values.

## The Philosophes

In France, the leading writers called themselves *philosophes*.

- **Voltaire** (1694–1778) waged a lifelong campaign against religious fanaticism. When the Protestant merchant **Jean Calas** was tortured and executed in Toulouse in 1762 on a false charge of murdering his son to prevent his conversion to Catholicism, Voltaire campaigned until the verdict was overturned, and wrote a *Treatise on Tolerance* (1763). His satire *Candide* (1759), written after the Lisbon earthquake of 1755, mocked the idea that all is for the best.
- **Montesquieu** (1689–1755) argued in *The Spirit of the Laws* (1748) that liberty was best protected by a **separation of powers** between legislative, executive, and judicial branches, an idea taken up by the framers of the United States constitution.
- **Jean-Jacques Rousseau** (1712–1778) argued in *The Social Contract* (1762) that legitimate government rests on the "general will" of the people, and criticised the inequality and artificiality of modern society.
- **Denis Diderot** edited, with **Jean d'Alembert** as co-editor until 1759, the ***Encyclopédie*** (1751–1772), a vast work in many volumes that aimed to gather all human knowledge, including the practical arts and trades, and that challenged religious and political authority, often in disguise. It was repeatedly banned.

Elsewhere, the Milanese **Cesare Beccaria** argued in *On Crimes and Punishments* (1764) against torture and the death penalty. In Scotland, **David Hume** questioned the foundations of religious belief and of causation itself, and **Adam Smith** argued in *The Wealth of Nations* (1776) that the division of labour and free exchange, not hoarding gold, created wealth.

## The Republic of Letters

Enlightenment ideas spread through a new public sphere: printed books, newspapers, and journals; coffeehouses, where men read and argued; learned academies and Masonic lodges; and the **salons** of Paris, hosted by women such as Madame Geoffrin, where writers, aristocrats, and visitors met to talk. The scholar **Émilie du Châtelet** translated Newton's *Principia* into French, with her own commentary; her translation, published after her death, is still the standard French version. In 1792 the English writer **Mary Wollstonecraft** published *A Vindication of the Rights of Woman*, arguing that women's apparent inferiority was the product of their lack of education, and in France **Olympe de Gouges** wrote a *Declaration of the Rights of Woman* (1791); she was guillotined in 1793.

## Enlightened Absolutism

Some monarchs embraced Enlightenment ideas, at least in part. **Frederick II** of Prussia (reigned 1740–1786), a friend of Voltaire, called himself the "first servant of the state", extended religious toleration (though Jews remained restricted), and abolished most uses of judicial torture. **Catherine II** of Russia corresponded with the philosophes, as the chapter on Russia described. **Joseph II** of Austria (sole ruler 1780–1790) granted toleration to Protestants (1781) and Jews (1782) and in 1781 issued a Serfdom Patent abolishing personal serfdom, first in the Bohemian lands and later in other Habsburg territories, though nobles resisted it in places. But all of them remained autocrats, and reform from above had its limits.

```checkpoint
q: What did Kant mean by "Enlightenment is man's emergence from his self-imposed immaturity"?
a*: That people should have the courage to use their own understanding without the guidance of others, "dare to know".
a: That people should obey their rulers without question.
x: Kant urged people to think for themselves rather than rely on authority.
a: That science should replace all morality.
x: Kant was a moral philosopher who thought reason grounded morality.
a: That only kings could be enlightened.
x: Kant meant that every person should think for themselves.
hint: Think of sapere aude.
why: Kant's essay defined the Enlightenment as a project of independent, public reasoning.
---
q: What did Montesquieu argue in The Spirit of the Laws?
a: That kings rule by divine right.
x: That was Bossuet's view; Montesquieu argued for limits on power.
a: That property is theft.
x: That phrase belongs to the nineteenth-century anarchist Proudhon.
a*: That liberty is best protected by separating legislative, executive, and judicial powers.
a: That all knowledge comes from experience.
x: That was Locke's argument in the Essay Concerning Human Understanding.
hint: Think of the United States constitution.
why: The separation of powers became a foundation of modern constitutional government.
```

## A Global Enlightenment

The Enlightenment was not only European, and its European thinkers drew heavily on knowledge of the wider world.

- **China.** Jesuit translations of Confucian classics, such as *Confucius Sinarum Philosophus* (1687), made China a model for many European thinkers. Voltaire admired China as a state governed by educated officials without an established church. In 1721 the German philosopher **Christian Wolff** gave a lecture praising Chinese practical philosophy as proof that morality did not need Christian revelation; Pietist opponents secured his expulsion from Halle in 1723. The French economist **François Quesnay**, leader of the physiocrats, was called the "Confucius of Europe". Meanwhile Chinese scholars of the *kaozheng*, "evidential research", movement, such as **Dai Zhen** (1724–1777), applied rigorous critical methods to classical texts, a parallel that the historian Benjamin Elman has stressed.
- **Africa.** **Anton Wilhelm Amo** (about 1703–about 1759), born at Axim on the Gold Coast and taken as a child to Germany, studied at Halle and Wittenberg, where he defended a philosophical dissertation in 1734 that accepted Descartes's division of mind and body but argued, against him, that it is the body, not the mind, that senses, and taught at German universities before returning to the Gold Coast in 1747. In Ethiopia, the *Hatata* attributed to **Zera Yacob** (1667/68) argues that God gave humans reason to judge religious claims, and that all people are equal. In 1920 the Italian scholar Carlo Conti Rossini claimed it was forged by the missionary Giusto da Urbino; most specialists, including the editors of the 2023 critical edition, now accept Zera Yacob's authorship, though a few still doubt it.
- **The Ottoman world.** In 1727 **İbrahim Müteferrika**, a Hungarian-born convert to Islam, received permission to open the first Muslim-run press printing in Ottoman Turkish and Arabic (Arab Christians had briefly printed in Arabic at Aleppo in 1706–1711); its first book appeared in 1729, and it published works on history, geography, and science.
- **The Americas.** When European writers such as Buffon and Cornelius de Pauw claimed that American nature and peoples were degenerate, American-born scholars replied. The exiled Mexican Jesuit **Francisco Javier Clavijero** wrote an *Ancient History of Mexico* (1780–1781) defending the achievements of the Aztecs, a debate the historian Antonello Gerbi called "the dispute of the New World".

The historian Sebastian Conrad has argued that we should see the Enlightenment as a global process, produced through worldwide exchanges and debated across the world, not simply exported from Europe.

## Blind Spots

The Enlightenment's universal language of rights coexisted with slavery, racism, and the exclusion of women.

- **Slavery.** John Locke briefly held shares in the Royal African Company, which traded enslaved Africans, and helped draft the constitution of the Carolina colony, which gave masters absolute power over enslaved people. Thomas Jefferson, who wrote that all men are created equal, enslaved over six hundred people during his life.
- **Race.** David Hume added a footnote to an essay in 1753 suggesting that non-white peoples were naturally inferior, and Kant developed theories of human races in a hierarchy. Enlightenment naturalists such as Linnaeus classified humans into varieties with supposed temperaments, laying foundations for later "scientific" racism.
- **Women.** Rousseau argued that women should be educated only to please and serve men, a view Wollstonecraft attacked directly.

Yet the Enlightenment also produced its own critics of slavery and empire. Diderot wrote many of the passionate attacks on colonialism in the expanded editions (1774, 1780) of the Abbé Raynal's *History of the Two Indies* (first published 1770), which predicted a great slave uprising. Above all, Black writers used Enlightenment arguments against slavery: the poet **Phillis Wheatley**, enslaved in Boston, whose *Poems* (1773) disproved claims about African intellect; **Ignatius Sancho**, whose *Letters* were published in 1782; **Ottobah Cugoano**, who in *Thoughts and Sentiments on the Evil of Slavery* (1787) demanded abolition and emancipation; and **Olaudah Equiano**, whose autobiography is described in the chapter on the Atlantic slave trade. In Saint-Domingue, enslaved people would take the language of rights further than any philosophe, as the chapter on the French and Haitian Revolutions describes.

```checkpoint
q: How did Anton Wilhelm Amo contribute to the Enlightenment?
a: He edited the Encyclopédie with Diderot.
x: The Encyclopédie was edited by Diderot and d'Alembert.
a*: Born on the Gold Coast and taken to Germany, he studied and taught philosophy at German universities and defended a dissertation criticising Descartes in 1734.
a: He founded the first Muslim-run Ottoman printing press.
x: That was İbrahim Müteferrika.
a: He led the Haitian Revolution.
x: The Haitian Revolution began in 1791, decades after Amo returned to Africa.
hint: Think of Halle and Wittenberg.
why: Amo shows that Africans took part in the Enlightenment as philosophers, not only as its subjects.
---
q: How did Black writers such as Wheatley, Cugoano, and Equiano use the Enlightenment?
a: They defended slavery as natural.
x: They attacked slavery.
a: They rejected all Enlightenment ideas as European.
x: They used Enlightenment arguments about reason and rights against slavery.
a: They wrote only religious hymns.
x: Their writings included poetry, letters, political argument, and autobiography.
a*: They used its language of reason, rights, and common humanity to refute racist claims and demand the abolition of slavery.
hint: Think of Cugoano's Thoughts and Sentiments.
why: Black writers turned the Enlightenment's universal claims against the slavery many of its thinkers tolerated.
```

## Legacy and Critics

The Enlightenment's ideas, rights, toleration, free inquiry, and government by consent, shaped the American Declaration of Independence (1776), the French Declaration of the Rights of Man and of the Citizen (1789), and the revolutions that followed, described in the next block. They also drew critics from the start. The Irish statesman **Edmund Burke**, in *Reflections on the Revolution in France* (1790), argued that abstract reason could not replace inherited tradition. The German philosopher **Johann Gottfried Herder** defended the value of each people's distinct culture and condemned European conquest.

In the twentieth century, the philosophers Max Horkheimer and Theodor Adorno, writing in exile from Nazi Germany, argued in *Dialectic of Enlightenment* (circulated 1944, published 1947) that reason itself had become an instrument of domination. Postcolonial scholars have stressed the Enlightenment's links to empire and racism. Defenders, such as Anthony Pagden, reply that its core idea of a common humanity remains indispensable, and that its failures are judged by its own standards. The debate is about the Enlightenment's legacy in our own world as much as about the eighteenth century.

## Further exploration

- **Ritchie Robertson, *The Enlightenment: The Pursuit of Happiness, 1680–1790* (2020).** A comprehensive recent history.
- **Anthony Pagden, *The Enlightenment: And Why It Still Matters* (2013).** A defence of the Enlightenment's legacy.
- **Dorinda Outram, *The Enlightenment* (1995; 4th ed. 2019).** A short introduction to the debates.
- **Jonathan Israel, *Radical Enlightenment: Philosophy and the Making of Modernity, 1650–1750* (2001).** Spinoza and the radical tradition.
- **Sebastian Conrad, "Enlightenment in Global History: A Historiographical Critique", *American Historical Review* (2012).** The Enlightenment as a global process.
- **Antonello Gerbi, *The Dispute of the New World: The History of a Polemic, 1750–1900* (1955; English trans. 1973).** The debate over American "degeneracy".$em_enlight_master$,
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
  select $em_enlight_quiz$[
    {"type": "mcq", "prompt": "What was the Encyclopédie?", "options": ["A Prussian law code", "Kant's essay on enlightenment", "A multi-volume work edited by Diderot and d'Alembert gathering knowledge, including the trades, and challenging authority", "A Chinese classic translated by the Jesuits"], "answerIndex": 2, "explanation": "Published 1751–1772, it was repeatedly banned.", "id": "q1"},
    {"type": "mcq", "prompt": "Which campaign did Voltaire lead after 1762?", "options": ["To clear the name of Jean Calas, a Protestant executed on a false charge", "To revoke the Edict of Nantes", "To abolish the Royal Society", "To make Rousseau king of Geneva"], "answerIndex": 0, "explanation": "The Calas affair led to Voltaire's Treatise on Tolerance (1763).", "id": "q2"},
    {"type": "mcq", "prompt": "Why was Christian Wolff expelled from Halle in 1723?", "options": ["He supported the French Revolution", "He refused to teach in Latin", "He denied Newton's laws", "His praise of Chinese practical philosophy suggested morality did not need Christian revelation, angering Pietists"], "answerIndex": 3, "explanation": "Wolff's 1721 lecture shows how China entered European debates about reason and morality.", "id": "q3"},
    {"type": "mcq", "prompt": "Who wrote A Vindication of the Rights of Woman (1792)?", "options": ["Émilie du Châtelet", "Mary Wollstonecraft", "Olympe de Gouges", "Phillis Wheatley"], "answerIndex": 1, "explanation": "Wollstonecraft argued that women's apparent inferiority came from lack of education.", "id": "q4"},
    {"type": "open", "prompt": "How global was the Enlightenment?", "rubric": "A strong answer discusses European use of knowledge about China (Confucius Sinarum Philosophus, Voltaire, Wolff, Quesnay) and parallels such as kaozheng; African thinkers (Amo, the Hatata of Zera Yacob and its authorship debate); Müteferrika's press; Clavijero and the dispute of the New World; Black abolitionist writers; and Conrad's argument for a global process, weighing this against the European centre of its institutions.", "id": "q5"},
    {"type": "open", "prompt": "How should we judge the Enlightenment's blind spots on slavery, race, and gender?", "rubric": "A strong answer gives examples (Locke and the Royal African Company and Carolina, Jefferson, Hume's footnote, Kant's racial theories, Linnaeus, Rousseau on women), and counter-examples within the Enlightenment (Diderot and Raynal, Wollstonecraft, de Gouges, Wheatley, Sancho, Cugoano, Equiano, the Haitian Revolution), and engages with the critiques of Horkheimer and Adorno and postcolonial scholars and the defence by Pagden.", "id": "q6"}
  ]$em_enlight_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/early-modern-period/the-enlightenment', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
