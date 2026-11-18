-- Women Philosophers of the Early Modern Era — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/early-modern-women-philosophers @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/early-modern-women-philosophers',
    'research',
    'advanced',
    'read',
    $emwomen_master$> **The standard story of early modern philosophy runs from Descartes to Kant with almost no women in it, yet women argued about mind, matter, God, education and freedom throughout the period.** This chapter introduces Elisabeth of Bohemia, Margaret Cavendish, Anne Conway, Mary Astell, Émilie du Châtelet and Mary Wollstonecraft, with shorter notes on Masham, Cockburn, Suchon, Poulain de la Barre and Sor Juana. It sets out Conway's argument against dualism and Astell's for women's education step by step, and Wollstonecraft's case for a single standard of virtue more briefly. It ends with how historians recovered these women, and their debate over whether to add them to the canon or rethink the canon itself.

## The Standard Story and What It Left Out

The usual story of modern philosophy is a short list of men: the "rationalists" Descartes, Spinoza and Leibniz against the "empiricists" Locke, Berkeley and Hume, until Kant. It leaves out a great deal, some of it on purpose.

The great philosophers often said plainly that women could not do philosophy. In 1820 Hegel wrote:

```quote
Women are capable of education, but they are not made for activities which demand a universal faculty such as the more advanced sciences, philosophy and certain forms of artistic production.
G. W. F. Hegel · Philosophy of Right, §166 (trans. T. M. Knox) · 1820
```

Women, he went on, "regulate their actions not by the demands of universality, but by arbitrary inclinations and opinions." Kant cited Émilie du Châtelet in his first publication, *Thoughts on the True Estimation of Living Forces* (1747). In 1764, in his *Observations on the Feeling of the Beautiful and Sublime*, he wrote that a woman "who has a head full of Greek, like Mme. Dacier, or who conducts disputations about mechanics, like the Marquise du Châtelet might as well also wear a beard" (see *Kant*).

The exclusion lasted into reference books. *The Encyclopedia of Philosophy* of 1967, with articles on over 900 philosophers, did not mention Mary Wollstonecraft at all; the *Routledge Encyclopedia of Philosophy* of 1998 gave her an entry. The Stanford Encyclopedia of Philosophy calls this "the problem of historical exclusion": a tradition "that believes that there are no women philosophers and, if there are any, they are unimportant".

## Elisabeth of Bohemia: More Than One Objection

Elisabeth (1618–1680) was the eldest daughter of Frederick V, the Elector Palatine who was briefly King of Bohemia. In 1643 she opened a correspondence with Descartes that ran until his death in early 1650; her letters are almost all of her philosophy that survives. Her first letter asked how a soul that is only a thinking thing could move a body, and *Descartes* sets out that objection and his replies in full. It was only one of her contributions.

She was a mathematician too. Descartes praised her lost solution to Apollonius's problem of the three circles for a "symmetry and transparency" his own lacked, and when he dedicated his *Principles of Philosophy* (1644) to her, she criticised his accounts of magnetism and of the heaviness of mercury.

Her most sustained arguments were about how to live. In letters of 1645–46 she raised three objections to Descartes' view that virtue, the firm resolution to do what we judge best, is enough for happiness. First, even our ability to reason is subject to luck, so virtue cannot be sealed off from fortune. Second, a virtuous person who acts on her best judgement and gets it wrong will feel regret; to be content she would need "an 'infinite science'" to foresee all the effects of her actions. Third, we have no objective measure of value, since temperament and self-interest bend our judgements. Her request that he define the passions led to his *Passions of the Soul* (1649).

In October 1646 she gave her own reading of Machiavelli's *Prince*: by studying the hardest kind of state to govern, he says much about winning stability but little about governing a stable state. Lisa Shapiro, her translator, finds her arguing that rulers' passions are shaped by the pressure of deciding quickly.

She also raised the "weakness of my sex" as a bodily condition that might affect reasoning; Descartes ignored the point, though one recent scholar argues that "the very idea of a weak sex is antithetical to Cartesianism". How Cartesian was she? Shapiro calls her a Cartesian in natural philosophy; Kambouchner argues she was not one about practical and civil life. From 1667 she was abbess of the Lutheran convent at Herford, where she sheltered Labadists and Quakers; Sarah Hutton has asked whether, through those networks, she knew Anne Conway.

## Margaret Cavendish: Matter That Thinks

{{image: Margaret Cavendish, Duchess of Newcastle-upon-Tyne | A portrait of Margaret Cavendish (1623–1673), who held that all of nature is self-moving, perceiving matter.}}

Margaret Lucas (1623–1673) had no formal education and talked philosophy with her brother John, later a founding member of the Royal Society. In exile in France she married William Cavendish, later Duke of Newcastle, in 1645. The sources disagree about the philosophical circle around the Cavendish brothers in the 1640s. The Stanford Encyclopedia says William hosted it, with Hobbes, Descartes, Mersenne, Gassendi and Digby attending and Margaret at many meetings. The Internet Encyclopedia of Philosophy (IEP) says the regular salon was his brother Charles's, attended by Hobbes and Digby and only occasionally by Descartes, Mersenne and Gassendi, and that Margaret denied speaking to them about any but the most superficial matters.

She wrote eight philosophical books, from *Philosophical Fancies* (1653) to *Observations upon Experimental Philosophy* (1666), and mailed them to scholars and universities. Walter Charleton thanked her for spending "great summs of Money in Printing"; apart from Joseph Glanvill, hardly anyone engaged with her arguments. So in *Philosophical Letters* (1664) she argued with the leading philosophers through letters to an imaginary correspondent. "For a Philosopher or Philosopheress," she wrote, "is not produced on a sudden."

Her central claim was that "Nature is material, or corporeal, and so are all her Creatures, and whatsoever is not material is no part of Nature." Against Descartes she rejected immaterial substance; against Hobbes she denied that matter is dead stuff pushed about. All matter is self-moving, perceptive and intelligent, a view called **vitalist materialism** (from Latin *vita*, life) or **panpsychism** (the view that mind is everywhere in nature). She argued that thinking happens in a place, in the head and body; place belongs only to bodies; so minds must be material. And she argued from order: nature shows both variety and regularity, which passive matter moved only by collisions could not produce, for "there can be no order, method or harmony … without there be reason to cause that order and harmony." So the parts of matter must perceive and steer their own motions. When a hand pushes a bowl, nothing passes between them (or the hand "would in a short time become weak and useless, by losing so much substance"); the push is only the occasion for the bowl to move itself.

*Observations* is often read as a response to Robert Hooke's *Micrographia* (1665): what a lens shows cannot be checked against unaided sight, so magnified images may distort. In May 1667 she was invited to a meeting of the Royal Society, "an extremely rare invitation", though many present treated her as a spectacle, and Samuel Pepys called her "a mad, conceited, ridiculous woman"; Emma Wilkins (2014) argues her relations with the Society were more nuanced (see *The Scientific Revolution*). Her *Blazing World* (1666 or 1668; it was printed with both editions of *Observations*) is one of the earliest works of science fiction: its empress asks for the soul of Galileo, Descartes, Hobbes or More as her scribe, and is told "they would scorn to be scribes to a woman." Her politics are discussed in *Hobbes*.

## Anne Conway: One Living Substance

Anne Finch (1631–1679), who married Edward, Viscount Conway, could not attend university as a woman, so the Cambridge Platonist Henry More taught her philosophy by letter, beginning with Descartes. Severe illness, including migraines, brought Francis Mercury van Helmont into her household for her last decade; he introduced her to the Kabbalah and to Quakerism, which she joined shortly before her death. Her one treatise was published anonymously in Latin in Amsterdam in 1690; the English original is lost, and a retranslation appeared in 1692 as *The Principles of the Most Ancient and Modern Philosophy*.

Conway's world has three kinds of being: God; Christ, or "Middle Nature"; and creatures. Her chapters attack the **dualism** of More and Descartes, the view that mind and body are two distinct substances, though she admired Descartes' physics. Her argument, reconstructed from the Stanford Encyclopedia, runs:

1. Every created thing bears some likeness to its creator, God.
2. God is life itself and infinitely good: "how can a dead thing come from him who is infinite life and love?"
3. Matter conceived as nothing but inert extension, "dead" matter, has no likeness to God.
4. So no such dead matter exists; every created thing is alive and perceptive.
5. Things can change into one another only if they are alike, and body and spirit do change into one another: bodies become more spirit-like as they improve, and spirits more bodily as they decline.
6. So body and spirit are not two substances but two modes of one created substance, differing only in degree, as denser and finer.

"The whole creation," she wrote, "is just but one substance or entity." Creatures can rise or fall over successive lives, so that a horse may become a human, though Peter can never become Paul.

**The objection** is that this collapses creatures into God. If everything is one living substance, how does Conway avoid the **pantheism** (the identification of God with nature) she herself charged against Hobbes and Spinoza, whose "material pantheism" she said "confounds God and created substance"? **The reply** is that creatures differ from God by being changeable and many, while God is neither, and that Christ or Middle Nature stands between them as "both a bridge and a buffer", so the continuum of created beings never runs into God (compare *Spinoza*).

Leibniz owned a copy of her book, received it favourably and recognised affinities with his own views (see *Leibniz*). Whether she influenced his idea of the monad is debated: Carolyn Merchant (1979) argued she did, and Stuart Brown (1990) challenges that view. Her anonymity, Hutton writes, ensured she "suffered the same neglect that has been the lot of most pre-modern female philosophers".

## Mary Astell: Reason, Education and Marriage

Mary Astell (1666–1731) was born in Newcastle upon Tyne, never married and died in Chelsea in May 1731. *A Serious Proposal to the Ladies* (1694, Part II 1697) proposed an all-women academic retreat, never founded. Her theory of knowledge was Cartesian: knowledge is "that clear Perception which is follow'd by a firm assent to Conclusions rightly drawn from Premises of which we have clear and distinct Ideas". The IEP calls her "an unorthodox Cartesian". Her case for educating women runs:

1. Whoever can think is a thinking thing, and a woman need only turn within to see that she thinks; the argument rests on inner awareness, not on lists of famous women.
2. Women's reasoning in everyday affairs, from running a household to designing a petticoat, shows the capacity is there.
3. Thinking justly is open to everyone; only wide learning depends on time and training: "The Meanest Person shou'd Think as Justly, tho' not as Capaciously, as the greatest Philosopher."
4. God does nothing in vain, so if he gave women rational minds, they are meant to use them for the best ends, the knowledge and love of God.
5. So women's observed failings are "acquired rather than natural", the products of custom, flattery and an education in vanity, and method can correct them.
6. So women ought to be educated.

**The objection** of her day held that women are more closely bound to their bodies and so less fit for reason. **The reply** turns Descartes against it: if the mind is really distinct from the body, differences in performance cannot be explained by the mind's nature. They must be explained, as Alice Sowaal puts it, "not metaphysically, but epistemologically", by social habits that misdirect women's attention. Margaret Atherton has argued that several women read Descartes' reason in this egalitarian way.

*Some Reflections upon Marriage* (1700) began from the separation of Hortense Mancini, Duchess of Mazarin, from her abusive husband. Most men, Astell wrote, marry from lust or greed and expect "blind submission"; marriage ought to rest on friendship, and the remedy is education. In the preface to the third edition she asked:

```quote
If all Men are born free, how is it that all Women are born slaves?
Mary Astell · Some Reflections upon Marriage, preface to the third edition · 1706
```

Yet Astell was a High Church Tory who taught passive obedience to rulers, even tyrants, and rejected Locke's right of resistance (see *Locke*). Some read *Reflections* as a feminist work urging women to stay single; others, with Patricia Springborg, as an ironic challenge to Whigs to accept in the state the obedience they demanded in marriage. Jacqueline Broad hears in the "born slaves" question an allusion to Locke's definition of slavery; Springborg doubts Astell seriously thought marriage slavery in Locke's sense. Sowaal adds that Astell's "Ladies" were English gentry, whose domination by men she theorised, but not their own privilege over the servants they paid, indentured or enslaved.

```checkpoint
q: Why, according to Anne Conway, can there be no "dead" matter?
a*: Because every creature resembles God, who is life itself, and inert extension would bear no likeness to him.
a: Because the senses show that every body moves.
x: Her argument is from God's nature and the likeness of creatures to their creator, not from observation.
a: Because Descartes had proved that matter thinks.
x: Descartes held that matter is extension without thought; Conway attacked his dualism.
a: Because Hobbes and Spinoza had shown that God is material.
x: She charged Hobbes and Spinoza with a "material pantheism" that confounds God and creatures; she rejected it.
hint: Ask what every created thing must share with its creator.
why: Conway asked "how can a dead thing come from him who is infinite life and love?"; matter that is only inert extension would bear no likeness to God, so all creatures are alive.
---
q: How did Mary Astell answer the claim that women are too closely bound to their bodies to reason well?
a: She listed famous learned women as counter-examples.
x: Her argument rests on each woman's inner awareness that she thinks, not on famous examples.
a: She argued that women's bodies are in fact identical to men's.
x: She made no such claim; her point concerned the mind.
a*: She used the Cartesian distinction of mind and body to argue that differences in performance come from social habits, not the nature of the mind.
a: She agreed, and limited education to household management.
x: She held that women's failings were acquired and correctable, and proposed an academy.
hint: Think about what follows if mind and body are really distinct.
why: If the mind is distinct from the body, women's weaker performance must be explained "not metaphysically, but epistemologically", by custom and an education in vanity.
```

## Masham, Cockburn and Locke's Circle

Two other English women argued in Locke's orbit. Damaris Masham (born 1658/9, died 1708), daughter of the Cambridge Platonist Ralph Cudworth, was Locke's friend, and from 1691 he lived at her house at Oates. Her *Discourse Concerning the Love of God* (1696) attacked John Norris, and indirectly Astell, for splitting love of God from love of his creatures. Her *Occasional Thoughts* (1705) answered Astell in turn, insisting that "an Irrational Religion can never Rationally be conceived to come from God", and argued that a mother cannot give her children a moral education if she is denied one herself (see *Leibniz* for her letters to him). Catharine Trotter Cockburn (1679–1749), a playwright, published *A Defence of Mr. Locke's Essay* (1702); her later ethics combined Lockean reflection with Samuel Clarke's idea of moral "fitness".

## France and New Spain: Equality Arguments

Astell's argument was not new. Marie de Gournay's *Equality of Men and Women* (1622) is discussed in *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*. Poulain de la Barre (1647–1723), in *On the Equality of the Two Sexes* (1673), reasoned from Descartes' distinction of mind and body that the intellect has no sex, so that social disparities between the sexes are, in Shapiro's phrase, "culturally constructed". Gabrielle Suchon (1632–1703), answered Poulain in her *Treatise of Morals and Politics* (1693), whose three parts treat liberty, knowledge and authority as the three "prerogatives" denied to women. Wikipedia calls her the first philosopher to produce a significant body of work dedicated solely to women.

Across the Atlantic, the Hieronymite nun Sor Juana Inés de la Cruz (born 1648 or 1651, died 1695) of New Spain was self-taught and had asked to attend university disguised as a man. When the Bishop of Puebla, writing as "Sor Filotea", published her critique of a sermon with a letter urging her to turn to religious studies, her *Reply to Sor Filotea* (1691) defended women's right to study and to teach other women, using her own drive to learn as evidence (see *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*).

## Émilie du Châtelet: Reasons for Physics

Émilie du Châtelet (1706–1749) lived with Voltaire at Cirey, where they kept a laboratory, and contributed substantially to his book on Newton's philosophy (1738). Her *Institutions de physique* (1740), ostensibly a textbook for her son, is in the Stanford Encyclopedia's words "in reality a highly original work in natural philosophy": it gives Newton's physics metaphysical foundations drawn from Leibniz and Wolff.

Her first principles were the principle of contradiction and the **principle of sufficient reason**, that nothing happens without a reason why it is so and not otherwise. Without it, she argued, "if there can be effects without sufficient reason, all might have been produced by accident, that is to say, by nothing." Against Newton's admirers, who took his "hypotheses non fingo" ("I frame no hypotheses") as a rule of method, she defended hypotheses: "those who wish to ban hypotheses from philosophy, intend harm to the interests of science." The Stanford Encyclopedia places her "at the start of the hypothetico-deductive tradition", the method of proposing a hypothesis and testing what follows from it (see *What Makes Science Science? Method and Demarcation*).

She also sided with Leibniz in the dispute over **vis viva**, the "living force" of a moving body, rebutting Dortous de Mairan, secretary of the Academy of Sciences, point by point in 1741, and publicised an experiment by 's Gravesande in which balls dropped into clay made dents that scaled with mass times velocity squared. Her translation of and commentary on Newton's *Principia*, finished just before she died in 1749, appeared in 1759; it remains the leading French translation.

Was she original? Her former tutor Samuel Koenig accused her of plagiarising him, and W. H. Barber (1967) judged her "essentially derivative". But the censor had noted Leibnizian ideas in her manuscript before Koenig arrived, and the now-dominant view, going back to Ira Wade (1947), treats her as independent.

## Mary Wollstonecraft: One Standard of Virtue

Mary Wollstonecraft (1759–1797) had been a schoolmistress, governess and reviewer. When Burke's *Reflections on the Revolution in France* attacked her friend Richard Price, she replied with *A Vindication of the Rights of Men*, published anonymously on 29 November 1790, almost certainly the first of 50 to 70 replies. *A Vindication of the Rights of Woman* (1792), prompted by Talleyrand's 1791 report proposing a domestic education for girls, followed. Her argument, briefly:

1. Virtue "has only one eternal standard", given by God, so women's virtues cannot differ in nature from men's.
2. Virtue is acquired by exercising reason and self-command.
3. An education aimed at pleasing men, cultivating beauty and sensibility, produces women's apparent weakness; nature does not.
4. Unequal power corrupts both sides, for "virtue can only flourish amongst equals", as the Stanford Encyclopedia quotes her.
5. So women need the same rational education as men and, as citizens, civil and political rights, including "elected representatives of their own".

Rousseau objected in *Emile* that woman is made to please man and should be educated for that (see *The Enlightenment and Rousseau*). Wollstonecraft replied that this assumes two kinds of virtue; if there is one, an education for pleasing makes women slaves or "capricious tyrants", not virtuous. Burke objected that abstract rights ignore custom and inherited institutions. She replied that laws are products of historical accident, and only institutions that survive rational scrutiny and respect natural rights deserve obedience. She did concede that men might collectively attain "a greater degree of virtue": equality in kind, not necessarily in degree.

Her book is a landmark of philosophical feminism, but it was not the first systematic case for women's equality: Gournay, Poulain, Suchon and Astell all argued earlier (compare *History of Philosophy*). Barbara Taylor warns that calling her a "feminist" at all is anachronistic and has led readers to neglect her religious beliefs, and Bergès reads *Rights of Woman* chiefly as a treatise on education. (See also *The Enlightenment*.)

## How the Women Were Recovered

These women were not forgotten because nobody had recorded them; retrieving them was, the Stanford Encyclopedia notes, "relatively straightforward, even if labor intensive". Mary Ellen Waithe's *A History of Women Philosophers* documented "over 30" from 1600 to 1900. Eileen O'Neill's essay "Disappearing Ink: Early Modern Women Philosophers and Their Fate in History", in Janet Kourany's collection *Philosophy in a Feminist Voice* (1998), catalogued dozens of forgotten women and asked why they had vanished. Their choices of topic and genre, often theological, played a part, but, as summaries of the essay report, she held that these could not explain how thoroughly women had been erased by the nineteenth century. The writer Dag Herbjørnsrud blames Kant, Hegel and their followers.

A concerted effort began around the mid-1990s. Margaret Atherton edited *Women Philosophers of the Early Modern Period* (1994); Jacqueline Broad wrote *Women Philosophers of the Seventeenth Century* (2002) and the first book-length study of Astell's wider philosophy (2015); Karen Detlefsen co-edited volumes with Broad and with Shapiro. Christia Mercer argued that the evil deceiver of Descartes' *Meditations* owes a debt to Teresa of Ávila. Project Vox, begun at Duke University in 2014, aims to "recover the lost voices of women who have been ignored in standard narratives of the history of modern philosophy".

But what should recovery mean? One strategy, which the Stanford Encyclopedia calls the "Best Supporting Actress" approach, shows how women contributed to the men's central problems: Elisabeth on causation, Cavendish on motion, du Châtelet on sufficient reason. It is easy, but it "reinforces the secondary status of women thinkers". Lisa Shapiro argues that "it is not enough to simply add a woman philosopher or two to the reading list". The history of philosophy, she writes, "is a story and we need to find a plot line that includes new, female characters", such as the seventeenth-century debate on women's reason, nature and education, continued by Rousseau, Catharine Macaulay and Wollstonecraft. Others would drop the rationalist-versus-empiricist frame altogether.

A deeper question is whether reason itself was gendered. Genevieve Lloyd's *The Man of Reason* argued that philosophy's ideal of reason has been "gendered male". Atherton replied that several early modern women, Astell among them, read Descartes' reason in egalitarian terms and used it to argue for women's education. Nor did recovery find a single "women's voice": Waithe found "little differences in the ways men and women did philosophy". The women in this chapter were Cartesians and anti-Cartesians, materialists and Platonists, Tories and radicals (see *Feminist Philosophy* and *The Mind–Body Problem*).

```checkpoint
q: What is the main criticism of the "Best Supporting Actress" approach to recovering women philosophers?
a: It ignores women's contributions to causation and metaphysics.
x: It focuses on exactly those contributions, fitted into the men's debates.
a*: It reinforces the secondary status of women thinkers by treating them as contributors to men's problems.
a: It assumes women and men did philosophy in completely different ways.
x: The approach assumes the opposite: that women joined the same debates.
a: It depends on texts that no longer survive.
x: Early modern women are well recorded; retrieving their texts was "relatively straightforward, even if labor intensive".
hint: Consider what the name of the approach implies about who plays the lead.
why: Fitting women into men's central problems is easy and anchoring, but, as the Stanford Encyclopedia puts it, it "reinforces the secondary status of women thinkers".
---
q: Why is it misleading to call Wollstonecraft's Vindication of the Rights of Woman (1792) the first systematic philosophical feminism?
a: Because Wollstonecraft never argued for women's education.
x: Education was central to her argument; Bergès reads the book chiefly as a treatise on education.
a: Because the book was published after her death.
x: It was published in 1792, five years before she died.
a: Because Kant had already argued for women's equality.
x: Kant mocked du Châtelet's learning, saying she "might as well also wear a beard".
a*: Because Gournay (1622), Poulain de la Barre (1673), Suchon (1693) and Astell (from 1694) had already argued systematically for women's equality or education.
hint: Look at the dates of the French and English writers earlier in the chapter.
why: The argument that women's inferiority comes from education and custom, not nature, had been made at length before 1792 by Gournay, Poulain, Suchon and Astell.
```

## Further exploration

- **Jacqueline Broad, *Women Philosophers of the Seventeenth Century* (2002).** Elisabeth, Cavendish, Conway, Astell, Masham and others on mind and matter.
- **Sarah Hutton, *Anne Conway: A Woman Philosopher* (2004).** The standard intellectual biography of Conway.
- **Ruth Perry, *The Celebrated Mary Astell: An Early English Feminist* (1986).** The most authoritative account of Astell's life, which helped launch her modern revival.
- **Judith P. Zinsser, *La Dame d'Esprit: A Biography of the Marquise Du Châtelet* (2006).** A full life of du Châtelet.
- **Sylvana Tomaselli, *Mary Wollstonecraft: Philosophy, Passion, and Politics* (2020).** Wollstonecraft as a philosopher, by the author of the Stanford Encyclopedia entry.
- **Karen Detlefsen and Lisa Shapiro (eds), *The Routledge Handbook of Women and Early Modern European Philosophy* (2023).** A broad survey, including the recovery debates.
- **Eileen O'Neill and Marcy P. Lascano (eds), *Feminist History of Philosophy: The Recovery and Evaluation of Women's Philosophical Thought* (2019).** Essays on how to recover and assess women's philosophy.$emwomen_master$,
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
  select $emwomen_quiz$[
    {"type": "mcq", "prompt": "Which of these was one of Elisabeth of Bohemia's objections to Descartes' view that virtue is enough for happiness?", "options": ["That virtue is impossible without a university education", "That even our ability to reason is subject to luck, so virtue cannot be sealed off from fortune", "That happiness consists only in bodily pleasure", "That the soul is mortal, so happiness must be found in this life"], "answerIndex": 1, "explanation": "In letters of 1645–46 Elisabeth argued that reasoning itself is exposed to luck, that a virtuous agent who errs will feel regret (so contentment would need an 'infinite science'), and that we lack an objective measure of value.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Margaret Cavendish explain what happens when a hand pushes a bowl?", "options": ["The push is only the occasion for the bowl, made of self-moving, perceiving matter, to move itself; no motion passes from hand to bowl", "God moves the bowl on the occasion of the hand's motion", "Atoms of motion flow from the hand into the bowl", "The hand's immaterial soul acts directly on the bowl"], "answerIndex": 0, "explanation": "Cavendish held that all matter is self-moving and perceptive; if motion or matter passed from hand to bowl, the hand 'would in a short time become weak and useless, by losing so much substance'.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Émilie du Châtelet argue about hypotheses in her Institutions de physique (1740)?", "options": ["That Newton was right to frame no hypotheses", "That hypotheses belong to theology, not physics", "That only mathematical hypotheses are allowed", "That 'those who wish to ban hypotheses from philosophy, intend harm to the interests of science'"], "answerIndex": 3, "explanation": "Against Newton's admirers, who read 'hypotheses non fingo' as a rule of method, du Châtelet defended hypotheses; the Stanford Encyclopedia places her at the start of the hypothetico-deductive tradition.", "id": "q3"},
    {"type": "mcq", "prompt": "What is Eileen O'Neill's essay 'Disappearing Ink' (1998) known for?", "options": ["Proving that no women wrote philosophy before 1800", "Arguing that Descartes borrowed from Teresa of Ávila", "Cataloguing dozens of forgotten early modern women philosophers and asking why they disappeared from the history of philosophy", "Founding Duke University's Project Vox"], "answerIndex": 2, "explanation": "Published in Kourany's Philosophy in a Feminist Voice, O'Neill's catalogue of women thinkers became a starting point for recovery work; the Teresa argument is Christia Mercer's.", "id": "q4"},
    {"type": "open", "prompt": "Set out Anne Conway's argument that body and spirit are not two substances but modes of one created substance. What is the strongest objection, and how might she reply?", "rubric": "A strong answer gives the steps: every creature bears some likeness to God; God is life itself ('how can a dead thing come from him who is infinite life and love?'); inert, dead extension would have no likeness to God; so all creatures are alive and perceptive; things change into one another only if alike, and body and spirit do change into one another; so they are modes of one substance differing in degree (denser and finer). It states the objection that this collapses creatures into God, the pantheism she herself charged against Hobbes and Spinoza, and gives the reply: creatures are changeable and many while God is not, and Christ or 'Middle Nature' is a bridge and buffer between them. Credit for noting her target (the dualism of More and Descartes) and the debate over her influence on Leibniz (Merchant vs Brown).", "id": "q5"},
    {"type": "open", "prompt": "Should historians simply add early modern women such as Astell, Cavendish and du Châtelet to the existing story of philosophy, or rethink the story itself? Explain the main positions in the recovery debate.", "rubric": "A strong answer explains that the women were well recorded and that O'Neill and Waithe catalogued them; describes the 'Best Supporting Actress' approach (fitting women into men's problems, e.g. Elisabeth on causation, du Châtelet on sufficient reason), which is easy and anchoring but reinforces their secondary status; gives Shapiro's view that adding 'a woman philosopher or two' is not enough and that we need new plot lines, such as the seventeenth-century debate on women's reason, nature and education, continued by Rousseau, Macaulay and Wollstonecraft; mentions proposals to drop the rationalist-versus-empiricist frame; and discusses Lloyd's claim that reason was gendered male against Atherton's reply that women used Cartesian reason in egalitarian ways. Credit for noting that recovery found no single 'women's voice' (Waithe, Warnock) and for naming recovery scholars or resources (Broad, Detlefsen, Mercer, Project Vox).", "id": "q6"}
  ]$emwomen_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/early-modern-women-philosophers', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
