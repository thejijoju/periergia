-- Locke — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/locke @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/locke',
    'research',
    'advanced',
    'read',
    $locke_master$> **John Locke (1632–1704) argued that every idea in the mind comes from experience, and that government exists, with the consent of the governed, to protect their lives, liberties and property.** This chapter sets out his attack on innate ideas and Leibniz's reply, his theory of ideas and qualities, and his account of personal identity with Butler's and Reid's objections; then the *Two Treatises of Government*: the state of nature, property, consent and resistance. It ends with toleration, Locke's part in colonial and slaving enterprises as scholars debate it, and the women who answered him.

## Physician, Secretary, Exile

Locke was born on 29 August 1632 at Wrington in Somerset, to Puritan parents. He went to Westminster School and then, in 1652, to Christ Church, Oxford, where, like Hobbes before him, he found the Aristotelian philosophy he was taught of little use. He turned to medicine and experimental science; Robert Boyle became his mentor, and, as the Stanford Encyclopedia of Philosophy puts it, "Locke read Boyle before he read Descartes."

In 1667 he moved into the London house of Lord Ashley, later the 1st Earl of Shaftesbury, as physician, secretary and political ally. Through Ashley he became secretary to the Lords Proprietors of the Carolina colony and, in 1673–74, to the Council for Trade and Foreign Plantations. Meanwhile, five or six friends meeting in his rooms found themselves "quickly at a stand" on a hard question, and Locke proposed that they first examine "our own abilities, and see what objects our understandings were, or were not, fitted to deal with". The earliest drafts of *An Essay Concerning Human Understanding* date from 1671; the book took nearly twenty years.

Shaftesbury led the failed attempt, in the Exclusion Crisis of 1679–81, to bar the Catholic James, Duke of York, from the throne; he fled to Holland in 1682 and died there in January 1683. When the Rye House Plot against Charles II and James was revealed in June 1683, Locke left for the West Country that week and was in Holland by September. He returned in February 1689, and that December the *Essay* appeared with a dedication signed by Locke and the *Two Treatises of Government* anonymously, both with 1690 on the title page. From 1691 he lived at Oates in Essex, the home of the philosopher Damaris Masham and her husband, and in 1696–1700 he was the leading member of the revived Board of Trade. He died at Oates on 28 October 1704.

Quotations follow the editions the encyclopedias cite: Nidditch's *Essay* (1975), in original spelling, and, for the *Two Treatises*, Laslett's edition, sometimes in modernised spelling.

## The Under-Labourer's Project

The *Essay* sets out "to enquire into the Original, Certainty and Extent of humane Knowledge". Its four books attack innate principles, trace all ideas to experience, examine language, and survey knowledge, probability and faith. An **idea** is "whatsoever is the Object of the Understanding when a Man thinks". Locke took this "way of ideas" from Descartes while rejecting his rationalism (see *Descartes*). With Boyle, Sydenham, "the great Huygenius" and "the incomparable Mr. Newton" at work, he wrote, his own role was modest:

```quote
it is ambition enough to be employed as an under-labourer in clearing the ground a little, and removing some of the rubbish that lies in the way to knowledge
John Locke · An Essay Concerning Human Understanding, Epistle to the Reader (Nidditch edn) · 1690
```

{{image: An Essay Concerning Human Understanding | The title page of the first edition of An Essay Concerning Human Understanding, dated 1690, though the book appeared in December 1689.}}

## Against Innate Ideas

Locke's first target is the doctrine of innate principles, "Characters as it were stamped upon the Mind of Man, which the Soul receives in its very first Being". Yolton showed in 1956 that the view was widespread in seventeenth-century England, so Locke was not attacking a straw man. Locke thought it "eased the lazy from the pains of search".

The main argument for innateness, as the Internet Encyclopedia of Philosophy (IEP) reconstructs it, is from universal consent: everyone believes a certain principle; whatever everyone believes is innate; so the principle is innate. Locke's reply runs in steps:

1. No principle commands universal assent. Even "What is, is" and "It is impossible for the same thing to be and not to be" are unknown to children and to those the *Essay* calls "idiots".
2. To be in the mind is to be perceived: "It seems to me a near Contradiction to say that there are truths imprinted on the Soul, which it perceives or understands not."
3. If "innate" means only that the mind is *capable* of knowing a truth, then every truth the mind will ever know is innate, and the doctrine no longer separates innate truths from discovered ones.
4. If it means truths we assent to once we can reason, all of geometry is innate too; and obvious truths win assent because they are obvious, not because they are inborn.
5. Even genuine universal consent would prove nothing if experience and reason can explain it, and Book II offers that explanation.
6. Moral principles are weaker candidates still: one can sensibly ask a reason for the Golden Rule, and peoples differ widely in their moral rules.
7. So there are no innate principles, speculative or practical.

Locke did not deny inborn **capacities** and predispositions; he denied inborn principles and ideas.

**Leibniz's objection** came in the *New Essays on Human Understanding*, a dialogue in which "Philalethes" speaks for Locke, finished in 1704 but published only in 1765. The mind, Leibniz argued, is less a blank tablet than a block of marble whose veins already mark out the shape of Hercules. The senses give only contingent particulars, yet we know necessary truths, so reason must supply principles of its own. Against step 2 he pointed to unconscious "petites perceptions"; against step 3, he made innate ideas dispositions, "a disposition, an aptitude, a preformation", that experience brings out. (See *Leibniz*.)

**The reply** on Locke's behalf returns to step 3: unless the nativist can say which dispositions count as innate ideas, there is still no criterion separating innate truths from discovered ones. And the burden lies with the nativist: if knowledge can be accounted for without innate ideas, as the Stanford Encyclopedia's article on innateness puts it, "the Empiricist wins". Locke's arguments largely prevailed in the eighteenth century, until Chomsky revived nativism in the 1960s; the debate continues in *Reason, Experience and Innate Ideas*.

## White Paper: Sensation and Reflection

At *Essay* II.1.2 Locke likens the mind to "white paper". The Latin *tabula rasa*, "blank tablet", is a label later commentators give his view; the *Essay* does not use it. Its materials come from experience, from observing external objects or "the internal Operations of our Minds": "These two are the Fountains of Knowledge, from whence all the Ideas we have, or can naturally have, do spring." **Sensation** gives ideas such as red, cold and sweet; **reflection**, which "might properly enough be call'd internal Sense", gives ideas of perceiving, thinking, doubting, willing and the mind's other operations. **Simple ideas** arrive "simple and unmixed" and cannot be invented; the mind combines them into **complex ideas**, compares them and abstracts general ideas from them. G. A. Russell (1994) has suggested that Pococke's Latin translation of Ibn Ṭufayl's *Ḥayy ibn Yaqẓān* (1671) influenced Locke's formulation, one scholar's hypothesis (see *Al-Ghazālī, Averroes and the Quarrel over Reason*).

## Qualities, Substance and Essence

From Boyle's *The Origin of Forms and Qualities* (1666) Locke took the terms **primary and secondary qualities**, a distinction going back to the Greek atomists. A quality is a power in a thing to produce an idea in us. Primary qualities (solidity, extension, figure, motion, number) stay with a body however finely it is divided, and our ideas of them resemble them. Secondary qualities are "nothing in the Objects themselves, but Powers to produce various Sensations in us by their primary Qualities"; our ideas of colour or taste resemble nothing in the object. Among Locke's examples is a bowl of water that feels cold to a hand just taken from hot water and warm to one taken from cold.

Berkeley objected that such arguments work equally against shape and size, so that either both kinds of quality exist in the mind or neither does (see *Berkeley and Hume*). Scholars now warn that Berkeley's report is often mistaken for Locke's view; most read Locke's secondary qualities as powers grounded in the primary qualities of insensible particles. Whether ideas form a "veil of perception" between us and things, in Bennett's phrase, is taken up in *Perception and the External World*.

Behind the qualities stands **substance**, "a supposed, I know not what, to support those ideas we call accidents"; whether he meant a bare substratum or, as Michael Ayers argues, the unknown inner constitution of things, is disputed. A thing's **real essence** is that unknown atomic structure; its **nominal essence** is the general idea we attach to a name such as "gold". For ideas we make ourselves, such as a triangle or murder, real and nominal essence coincide, which is why Locke thought morality capable of demonstration, like mathematics, though, pressed by William Molyneux, he never produced one.

## What Makes You the Same Person

Book II, chapter 27, "Of Identity and Diversity", was added only in the second edition of 1694, at Molyneux's encouragement. Its argument can be set out like this:

1. What makes something "the same" depends on what kind of thing it is: the same mass of matter, the same animal ("same life"), the same man and the same person are different questions.
2. A **person** is "a thinking intelligent Being, that has reason and reflection, and can consider it self as itself, the same thinking thing in different times and places"; and "Person" is "a Forensick Term", belonging to law and morals, "appropriating Actions and their Merit".
3. What makes such a being a self is consciousness, which accompanies all thinking.
4. Thought experiments show that the person follows consciousness, not body or soul. If a prince's consciousness entered a cobbler's body, the person would be the prince. A "day-man" and "night-man" sharing a body but not consciousness would be "as distinct persons as Socrates and Plato".
5. So "as far as this consciousness can be extended backwards to any past Action or Thought, so far reaches the Identity of that Person"; and reward and punishment rightly attach to the person so defined.

**Butler's objection**, in *The Analogy of Religion* (1736), is circularity: "consciousness of personal identity presupposes, and therefore cannot constitute, personal identity". Genuinely to remember an experience is already to remember it as one's own.

**Reid's objection**, in *Essays on the Intellectual Powers of Man* (1785), is the brave officer. A boy is flogged for robbing an orchard; as a young officer he takes an enemy standard and remembers the flogging; as a general he remembers the standard but not the flogging. On Locke's view the general is the officer and the officer the boy, so the general is the boy; yet his consciousness does not reach the flogging, so he is not. "Therefore, the general is, and at the same time is not, the same person with him who was flogged at school." Identity is transitive; remembering is not.

**The replies** take two forms. Interpreters such as Atherton, Winkler and Weinberg argue that Lockean consciousness is not simply memory, so Reid may miss Locke's actual view. Others repair the theory: identity can rest on overlapping chains of memory (the general remembers the officer, who remembers the boy); "quasi-memory" (Penelhum, Shoemaker) drops the built-in requirement that the remembered experience was one's own, answering Butler; and **psychological continuity**, chains of causally connected mental states, broadens the criterion. The Stanford Encyclopedia calls Locke's account "revolutionary". Catharine Trotter Cockburn defended him in *A Defence of Mr. Locke's Essay of Human Understanding* (1702) (see *Women Philosophers of the Early Modern Era*). The modern debate, Buddhist views included, is in *Identity, Change and Persons* and *Self and No-Self: Personal Identity East and West*.

```checkpoint
q: Why does Locke say that "innate" cannot simply mean "capable of being known"?
a*: Because then every truth the mind will ever come to know would count as innate, and the doctrine would no longer separate innate truths from discovered ones.
a: Because Locke denied that the mind has any inborn capacities at all.
x: Locke allowed that we are born with many capacities and predispositions; what he denied was innate principles and ideas.
a: Because Leibniz had already shown that capacities are not dispositions.
x: Leibniz replied after Locke, and argued the opposite: that innate ideas are dispositions brought out by experience.
a: Because universal consent proves that ideas come from experience.
x: Locke denied that any principle commands universal consent, and said that even if one did, consent would not settle where it came from.
hint: Think about how much this definition would let in.
why: On the "capacity" reading, every truth the mind could ever learn is in it in the same way, so "innate" picks out nothing special. Leibniz answered by treating innate ideas as specific dispositions.
---
q: What is the point of Reid's story of the brave officer?
a: That memory is perfectly reliable, so Locke's criterion is correct.
x: Reid's story is an objection to Locke, not a defence.
a: That a person's identity depends on keeping the same body.
x: Reid's point here is the incoherence of a memory criterion, not a defence of a bodily one.
a*: That identity is transitive but memory is not, so a memory criterion makes the general both the same as and different from the flogged boy.
a: That consciousness presupposes personal identity, so it cannot constitute it.
x: That is Butler's circularity objection, which is different from Reid's.
hint: The general remembers the officer, and the officer remembers the boy.
why: If identity follows memory, the general is the officer and the officer the boy, so the general is the boy; yet he cannot remember the flogging. Replies appeal to overlapping chains of memory, or argue that Locke's "consciousness" is not memory.
```

## The State of Nature

Locke's politics opens against Sir Robert Filmer, whose *Patriarcha* (1680) held that kings inherit Adam's absolute paternal power. The First Treatise refutes Filmer passage by passage, beginning "Slavery is so vile and miserable an Estate of Man". The *Two Treatises* were written mostly during the Exclusion Crisis (1679–81) and revised later, not composed to justify the Revolution of 1688 (see *Intellectual History*).

The Second Treatise starts from a **state of nature**: "Men living together according to reason, without a common superior on earth, with authority to judge between them". It is not lawless. Because human beings are God's "property whose workmanship they are", "The state of nature has a law of nature to govern it, which obliges everyone: and reason, which is that law, teaches all mankind who will but consult it, that being all equal and independent, no one ought to harm another in his life, health, liberty, or possessions." Everyone may punish breaches of that law; the trouble is that people judge in their own cases.

Locke never names Hobbes. But he separates the state of nature from the **state of war**, a settled design on another's life, which the Stanford Encyclopedia reads as "distancing himself from Hobbes who had made the state of nature and the state of war equivalent terms" (see *Hobbes*). Of submitting to an absolute monarch for protection, he wrote in chapter VII that it is "to think that Men are so foolish that they take care to avoid what mischiefs may be done them by Pole-Cats, or Foxes, but are content, nay think it Safety, to be devoured by Lions." Straussian readers, after Strauss (1953), place Locke close to Hobbes; Dunn, James Tully and Ashcraft take his God-given natural law as primary.

## Property: an Argument and Its Critics

God gave the world to mankind in common. How can anyone own part of it without everyone's consent? If consent were needed, Locke says, "man had starved, notwithstanding the plenty God had given him". His answer, in chapter V:

1. The earth and its lower creatures are common to all.
2. Each person owns himself and his labour:

```quote
every Man has a Property in his own Person. This no Body has any Right to but himself. The Labour of his Body, and the Work of his Hands, we may say, are properly his.
John Locke · Second Treatise of Government §27 (Laslett edn) · 1690
```

3. Whatever a person removes from its natural state he has "mixed his Labour with, and joyned to it something that is his own, and thereby makes it his Property", at least "where there is enough, and as good, left in common for others".
4. The **spoilage proviso**: one may take only as much as one can use before it spoils.
5. Land is acquired the same way, by improving it, and wrongs no one while enough is left: no one is injured by another's "good draught" who has "a whole river of the same water left to quench his thirst".
6. Money, a durable "little piece of yellow metal" valued by tacit agreement, lets wealth be stored without spoiling. Unequal possession thus arises without any compact, and government is instituted to protect **property**, in Locke's wide sense "lives, liberties and estates".

**Objections.** Nozick asked, in *Anarchy, State, and Utopia* (1974): if I pour my can of tomato juice into the sea, do I own the sea, or have I foolishly lost my juice? Jeremy Waldron (1983) argued that labour, a series of actions, cannot literally be mixed with objects. Macpherson, in *The Political Theory of Possessive Individualism* (1962), argued that money removes the spoilage limit and productivity the "enough and as good" condition, so that Locke licenses unlimited capitalist accumulation; "the Turfs my Servant has cut" shows labour being sold.

**Replies.** Tully (1980) replaces mixing with a "workmanship model": makers have rights in what they make, as God has in his creatures. Against Macpherson, defenders note that property includes life and liberty, and that Locke recognised a duty of charity to the needy; Waldron (1988) reads "enough and as good" as a sufficient condition, not a restriction. The modern debate is in *Justice and Equality* and *Liberty and Rights*.

## Consent, Resistance and Toleration

Full membership of a political society needs **express consent**; Locke also counts **tacit consent**, given by enjoying property or even, in the Stanford Encyclopedia's paraphrase, "walking along the highways" of a country. Since few have expressly consented and tacit consent is thin, Simmons concludes that Locke's logic leads to philosophical anarchism. Pitkin answers that what matters is whether a government is one people *would* consent to, given natural law. Ruth Grant argues that Locke avoids anarchy this way: unanimous consent forms the community, and its majority decides who rules, so a government can fall while society survives (see *Authority and the State: the Social Contract and Its Critics*).

The legislative is supreme but limited: it "can never have a right to destroy, enslave, or designedly impoverish the subjects". Rulers who try to take the people's property or reduce them to slavery under arbitrary power "put themselves into a state of War with the People", and the people may remove or alter the government. With no judge on earth, the last resort is an "appeal to heaven"; in the Stanford Encyclopedia's reading, Locke thus justifies rebellion and, in some cases, regicide.

The *Letter Concerning Toleration*, written in Latin in Holland in 1685–86 after Louis XIV revoked the Edict of Nantes, argued that the care of souls was never given to the magistrate; that his only tool is force, which cannot produce "inward persuasion"; and that most magistrates' religions are false anyway. Jonas Proast objected that force can work "indirectly, and at a distance", by making people attend to arguments they would otherwise ignore; Locke answered in further letters. Locke defended toleration for Jews and pagans, not atheists: "Promises, covenants, and oaths, which are the bonds of human society, can have no hold upon an atheist." A church whose members "pass into the allegiance and service of another prince" was traditionally read as the Catholic Church; Mark Goldie and others argue Locke did not exclude Catholics in principle, and a 1667–68 manuscript, "Reasons for tolerating Papists equally with others", found in 2015 and published in 2019, though the Stanford Encyclopedia still says he excluded both. (See *Spinoza* and *History of Civil Liberties*.)

## Carolina, the Royal African Company and America

The *Fundamental Constitutions of Carolina* (dated 1 March 1669) were drafted in Ashley's household while Locke was secretary to the colony's proprietors. They tolerated "Jews, heathens, and other dissenters", but also declared: "every freeman of Carolina shall have absolute power and authority over his negro slaves, of what opinion or religion soever." Locke's authorship is contested. Armitage shows that he worked on revisions until 1682, while writing the *Two Treatises*, and treats him as co-author; Woolhouse holds that Ashley "must bear responsibility"; Holly Brewer (2017) sees a paid secretary drafting, much as a lawyer drafts a will for a client; the Stanford Encyclopedia judges Ashley or the Barbadian planter interest much more likely authors of the slavery clause. He is also named among the subscribers in the 1672 charter of the slave-trading Royal African Company; Brewer argues he was paid in its stock for secretarial work and sold it after a few years, and that on the Board of Trade in the 1690s he worked against pro-slavery policies, a contested claim (see *The Atlantic Slave Trade* and *Colonial North America*).

In the Second Treatise no one can enslave himself, since no one can hand over a power over his own life he does not have; the only legitimate slavery is of a captive taken in a just war, and a just conqueror gains no rights over wives and children. Farr (1986) argued that Atlantic slavery fails these conditions, so Locke's theory condemns it and his silence is a contradiction; later he argued the theory was aimed at English absolutism, not New World slavery. Armitage ties the *Treatises* to Locke's colonial work, and Bernasconi and Mann argue that Locke used his philosophy to rationalise his conduct. William Uzgalis replies that Locke placed Atlantic slavery on the illegitimate side of his own distinction, and could have adopted the broader justifications of Grotius or Pufendorf but did not.

Land raises a related question. Locke wrote of the "inland, vacant places of America" and of tracts of ground that "lie waste" because their inhabitants had not joined in the use of money. Tully and Barbara Arneil argue that his theory let Native hunters own the animals they caught but not the land, which could be treated as vacant; Goldie cautions that English politics remained Locke's main concern. These debates continue in *Race, Colonialism and Philosophy*.

```checkpoint
q: What does Nozick's tomato juice example challenge in Locke's argument for property?
a: The claim that God gave the world to mankind in common.
x: Nozick's example does not dispute the common starting point; it targets how private property is supposed to arise from it.
a*: The idea that mixing one's labour with something unowned makes it one's own, rather than simply losing the labour.
a: The spoilage proviso.
x: The spoilage limit concerns how much one may take; the tomato juice example is about whether mixing creates ownership at all.
a: The role of money in creating inequality.
x: That is Macpherson's line of criticism, not Nozick's.
hint: Pouring something you own into something you don't.
why: Nozick asks why mixing what I own with what I do not own should gain me property rather than lose me what I had. Tully's "workmanship" reading answers by dropping the mixing metaphor.
---
q: Which groups did Locke's Letter Concerning Toleration refuse to tolerate, on the traditional reading?
a: Jews and pagans.
x: Locke defended toleration for Jews and pagans in the Letter.
a: Quakers and other Protestant dissenters.
x: The Letter's exclusions concern atheists and a church owing allegiance to a foreign prince, not Protestant dissenters.
a: All who refused to join the national church.
x: Locke argued that the magistrate's force cannot produce inward persuasion, and he treated churches as voluntary societies.
a*: Atheists, and a church whose members owe allegiance to a foreign prince, traditionally read as Catholics.
hint: Locke said that promises and oaths can have no hold on one group.
why: Locke excluded atheists because "promises, covenants, and oaths" cannot bind them, and a church owing allegiance to another prince. Goldie and others argue the second exclusion did not target Catholics in principle.
```

## Women and the Family

Against Filmer, Locke insisted that power over children is **parental**, shared by mother and father, and temporary, lasting until children's reason matures. Marriage is a contract, and the IEP notes that he allowed a wife the right to leave her husband; yet he gave the husband the final say where their wills differ. Carole Pateman argues that "women are not party to the original contract that founds civil society", and Mary Lyndon Shanley that Locke "quickly slipped back" into speaking of "paternal" power.

Mary Astell (1666–1731), a High Church Tory who rejected Locke's politics and criticised his philosophy, asked in the 1706 preface to *Some Reflections upon Marriage* how, if all men are born free, all women come to be born slaves; Jacqueline Broad reads this as an allusion to Locke's own definition of slavery. Damaris Masham's *Occasional Thoughts* (1705) argued for women's education (see *Women Philosophers of the Early Modern Era* and *Feminist Philosophy*).

## Locke's Legacy

Aarsleff calls Locke "the most influential philosopher of modern times"; Berkeley, Hume, Reid and Kant all answered him (see *The Enlightenment and Rousseau* and *The Enlightenment*). In America the Second Treatise was cited in the Stamp Act debates, and how far it shaped the Declaration of Independence is disputed (see *Declarations of Independence: the American Revolution*). The tensions traced here, between equal natural rights and the exclusion of atheists, women, the enslaved and the dispossessed, are why Locke is still argued with rather than merely studied.

## Further exploration

- **Roger Woolhouse, *Locke: A Biography* (2007).** The standard modern life, careful on the Rye House and Carolina evidence.
- **Nicholas Jolley, *Locke: His Philosophical Thought* (1999).** An accessible introduction to the *Essay*.
- **Shelley Weinberg, *Consciousness in Locke* (2016).** A full-length study of Locke on consciousness, central to the personal identity debate.
- **Ruth Boeker, *Locke on Persons and Personal Identity* (2021).** A recent study of the chapter on identity.
- **James Tully, *A Discourse on Property* (1980).** The "workmanship" reading of Locke's property theory, against Macpherson.
- **Jeremy Waldron, *God, Locke, and Equality: Christian Foundations in Locke's Political Thought* (2002).** How Locke's equality rests on theology.
- **Barbara Arneil, *John Locke and America* (1996).** Locke's property theory and the dispossession of Native Americans.$locke_master$,
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
  select $locke_quiz$[
    {"type": "mcq", "prompt": "What image for the mind does Locke actually use in An Essay Concerning Human Understanding (II.1.2)?", "options": ["A tabula rasa, or blank tablet", "White paper", "A block of marble veined with the shape of Hercules", "A mirror of nature"], "answerIndex": 1, "explanation": "At Essay II.1.2 Locke likens the mind to 'white paper'. 'Tabula rasa' is the label later commentators give his view; the Essay does not use the phrase. The veined marble is Leibniz's counter-image in the New Essays.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement about the publication and composition of Locke's Two Treatises of Government is accurate?", "options": ["It was published anonymously in December 1689, dated 1690, and written mostly during the Exclusion Crisis of 1679–81, then revised", "It was written in 1688 to justify William of Orange's invasion", "It was first published in 1693 under Locke's own name", "It was written in Holland as a reply to Hobbes's Leviathan, which it names throughout"], "answerIndex": 0, "explanation": "The Two Treatises appeared anonymously in December 1689 with 1690 on the title page. Laslett showed that it was written mostly during the Exclusion Crisis and revised later, not composed to justify 1688. Locke never names Hobbes; his named target is Filmer.", "id": "q2"},
    {"type": "mcq", "prompt": "What is Butler's objection to Locke's account of personal identity?", "options": ["That a general who forgets his childhood both is and is not the boy who was flogged", "That persons are immaterial souls, so consciousness is irrelevant", "That consciousness of personal identity presupposes personal identity, so it cannot constitute it", "That Locke wrongly separated the identity of a man from the identity of a person"], "answerIndex": 2, "explanation": "Butler, in The Analogy of Religion (1736), argued that the account is circular: genuinely remembering an experience already presupposes that it was one's own. The flogged boy and the general is Reid's separate objection, from 1785.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the current state of the evidence on Locke's role in the Fundamental Constitutions of Carolina?", "options": ["Locke is known to have written the whole document alone, including the slavery clause", "Locke had no connection with the document", "The document was drafted after Locke's death", "It was drafted in Ashley's household while Locke was secretary to the proprietors; Armitage treats him as co-author, while the Stanford Encyclopedia judges Ashley or the Barbadian planter interest more likely authors of the slavery clause"], "answerIndex": 3, "explanation": "Locke's authorship is contested. Armitage shows that he worked on revisions until 1682 and treats him as co-author; Woolhouse holds that Ashley 'must bear responsibility'; Brewer sees a paid secretary. The clause gave 'every freeman of Carolina' absolute power over enslaved Africans.", "id": "q4"},
    {"type": "open", "prompt": "Set out Locke's argument for private property in the Second Treatise step by step, including its provisos. Then give one objection and the best reply to it.", "rubric": "A strong answer states the problem (God gave the world in common; requiring everyone's consent would mean starvation) and the steps: self-ownership and ownership of one's labour; mixing labour with what is unowned makes it one's property, where 'enough, and as good' is left for others; the spoilage proviso; land acquired by improvement; money, valued by tacit agreement, allows accumulation without spoilage and so unequal possession; government instituted to protect property in the wide sense of 'lives, liberties and estates'. It gives an objection with a reply: Nozick's tomato juice or Waldron's point that actions cannot be mixed with objects (answered by Tully's workmanship model, which drops the mixing metaphor), or Macpherson's charge that money and productivity cancel the provisos and license unlimited accumulation (answered by noting that property includes life and liberty, that Locke recognised a duty of charity, or Waldron's reading of 'enough and as good' as a sufficient condition rather than a restriction). Credit mention of the debate over Native American land (Tully, Arneil, Goldie's caution).", "id": "q5"},
    {"type": "open", "prompt": "How should we assess the relation between Locke's political philosophy and his involvement in colonial and slaving enterprises? Use the evidence and the scholarly positions presented in the chapter.", "rubric": "A strong answer separates facts from interpretation. Facts: Locke was secretary to the Carolina proprietors; the Fundamental Constitutions (1669) gave every freeman absolute power over his enslaved Africans while tolerating religious dissenters; he worked on revisions until 1682; he is named among subscribers in the 1672 Royal African Company charter. It notes the authorship debate (Armitage co-author; Woolhouse and the Stanford Encyclopedia pointing to Ashley or the Barbadian planter interest; Brewer's paid-secretary view). It explains the Second Treatise's account of slavery (no self-enslavement; only captives in a just war; no rights over wives and children) and the positions: Farr (Atlantic slavery fails Locke's own conditions, so his silence is a contradiction; the theory aimed at English absolutism), Armitage and Bernasconi and Mann (theory tied to or rationalising colonial practice), Uzgalis and Brewer (Atlantic slavery illegitimate on Locke's terms; Brewer's claim that he later opposed pro-slavery policies, itself contested). It may add the land debate (Tully, Arneil; Goldie). It reaches a reasoned judgement without going beyond the evidence.", "id": "q6"}
  ]$locke_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/locke', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
