-- Hobbes — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/hobbes @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/hobbes',
    'research',
    'advanced',
    'read',
    $hobbes_master$> **Thomas Hobbes (1588–1679) held that everything, the human mind included, is matter in motion, and that people without a common power would live in a "war of every man against every man".** This chapter follows his life through the English civil wars and the Paris exile; his materialism, his theory of language and reasoning as "reckoning"; and his quarrel with Descartes. It then sets out the argument of *Leviathan* (1651) step by step: the state of nature and the objections to it, the laws of nature and the "Fool", the covenant that "authorises" an absolute sovereign, and the rights subjects keep. It ends with his religion, his account of mothers and women, and his influence.

## Born with Fear

Hobbes was born on 5 April 1588 at Westport, now part of Malmesbury in Wiltshire, in the year, as the Internet Encyclopedia of Philosophy (IEP) puts it, "the Spanish Armada made its ill-fated attempt to invade England". In a Latin verse autobiography of around 1672–73 he wrote that his mother, frightened by news of the fleet, gave birth to twins, himself and fear; an English translation of 1680 renders it "Did bring forth Twins at once, both Me, and Fear." The familiar "fear and I were born twins" is a later paraphrase.

His father, a clergyman of poor reputation, left Malmesbury in 1604 after a churchyard fight. Hobbes studied at Magdalen Hall, Oxford; he graduated BA in 1608 and became tutor to William Cavendish, later 2nd Earl of Devonshire, beginning a connection with the family that lasted most of his life. In 1629 he published the first English translation of Thucydides made directly from the Greek. On a continental tour in the mid-1630s he met Marin Mersenne in Paris. His early biographer John Aubrey adds that in Florence, usually dated 1636, he "contracted a friendship with the famous Galileo Galilei"; curiously, Hobbes's own autobiographical writings never mention it, though they do mention Mersenne.

In 1640 he circulated *The Elements of Law, Natural and Politic* in manuscript. When the Long Parliament met that November he left for Paris, apparently fearing that his defence of absolute sovereignty had endangered him, and stayed through the civil wars of 1642–51 (see *God Save the Queen: the British Monarchy*). There he joined Mersenne's circle, befriended Pierre Gassendi, published *De Cive* ("On the Citizen", 1642) and taught mathematics to the future Charles II. *Leviathan* appeared in London in 1651; its "secularist spirit" angered Anglicans and French Catholics, and at the end of 1651 he returned to England and submitted to the Council of State.

*De Corpore* ("On Body", 1655) and *De Homine* ("On Man", 1658; the IEP says 1657) followed. So did quarrels: with the mathematician John Wallis over a faulty squaring of the circle, an error Hobbes kept defending; with Bishop John Bramhall over free will; with Boyle over experimental physics (see *The Scientific Revolution*). In 1666 a Commons committee on books tending to atheism named *Leviathan*, and Hobbes burned some papers. Charles II refused permission to publish *Behemoth*, his history of the civil wars, written around 1668; the authorised edition came out in 1682. He died on 4 December 1679, aged 91, at Hardwick Hall, a Cavendish house.

A note on texts: quotations from *Leviathan* are given with spelling modernised, the convention of Edwin Curley's 1994 edition, used by the Stanford Encyclopedia's main Hobbes entry. The 1651 original reads, for example, "solitary, poore, nasty, brutish, and short".

## Everything Is Body

By the time of *Leviathan* and *De Corpore*, Hobbes was a **materialist**: he held that everything that exists, minds included, is body. "This was not a popular or widely-held position at the time," notes the Stanford Encyclopedia of Philosophy. He joined it to **mechanism**, the view that natural change is bodies moving and pressing on one another, like the parts of a machine. *Leviathan* opens by asking why we may not say that all automata, "engines that move themselves by springs and wheels as doth a watch", have an artificial life. The body is such a machine; the state, he will argue, is an artificial one.

Sensation is a chain of motions. An object presses on the sense organ, the motion passes to the brain and heart, and there causes a counter-pressure which, "because outward, seemeth to be some matter without. And this seeming, or fancy, is that which men call sense." Imagination is "decaying sense"; imagination and memory are one thing under two names; understanding is imagination raised by words or signs, which even a dog has when it learns its master's call. Because all ideas derive from sensation, the Stanford Encyclopedia suggests one "might well speak of Hobbes, not Locke, as the first of the British empiricists" (**empiricists** hold that knowledge comes from experience).

"Incorporeal substance" is a contradiction, like "incorporeal body"; even spirits "have dimensions, and are therefore really bodies". The Stanford Encyclopedia judges that Hobbes "clearly was a materialist about the natural world, but the explicit arguments he offers for the view seem rather weak". On freedom he was a **compatibilist**, holding freedom compatible with every event's being caused: a free agent finds "no stop, in doing what he has the will, desire, or inclination to do". He is, with Hume, the classic case in *Free Will and Determinism*.

## Names and Reckoning

Hobbes was a **nominalist**: there is "nothing in the world universal but names". "Tree" names each tree; there is no universal tree and no universal idea. We apply common names because of similarities, but where we draw the boundaries of kinds involves an arbitrary decision. Leibniz called him "a super-nominalist", making truth depend on definitions and so on human will. (The medieval background is in *Scotus, Ockham and the Late Medieval Debates* and *What Exists? Ontology and Universals*.)

Words can serve thought or replace it: "Words are wise men's counters, they do but reckon by them: but they are the money of fools, that value them by the authority of an Aristotle", or of any other learned doctor. In *Leviathan* reason is "nothing but reckoning (that is, adding and subtracting)" of the consequences of general names, and *De Corpore* puts it more fully:

```quote
By reasoning I understand computation. And to compute is to collect the sum of many things added together at the same time, or to know the remainder when one thing has been taken from another. To reason therefore is the same as to add or to subtract.
Thomas Hobbes · De Corpore 1.2 (trans. A. P. Martinich) · 1655
```

A syllogism is "an addition of three names, just as a proposition is of two". Leibniz took up the idea, and some have seen in it a forerunner of artificial intelligence, a claim the Stanford Encyclopedia calls "at least rather over-dramatic" (see *Minds and Machines: Could AI Think?*). *De Corpore* is also where Hobbes added his twist to the Ship of Theseus, discussed in *What Is Philosophy?*.

## Against Descartes: the Third Objections

In 1640 Hobbes sent Mersenne comments on Descartes's *Discourse* and *Optics*, and in 1641 his objections to the *Meditations* were printed with it as the **Third Objections**, with Descartes's replies (Gassendi wrote the Fifth). The *Descartes* chapter treats the *Meditations*; here the interest is a materialist confronting a **dualist**, who held mind and body to be distinct substances.

Hobbes argued, first, that from "I am thinking" it does not follow that the thinker is immaterial: a thinking thing may be something corporeal, since we seem to conceive the subject of any act only as a body, as Descartes's own wax example suggests. Descartes replied that Hobbes confused the thinking thing with its acts. Second, Hobbes held that ideas are images, so we have no idea of God; Descartes answered that by "idea" he meant "whatever is immediately perceived by the mind". Third, Hobbes attacked the Sixth Meditation's test for being awake, the continuity of waking experience: it would let someone know he is awake "without knowledge of the true God", against Descartes's own thesis, and one could dream the continuity too. Descartes replied that an atheist can infer he is awake but cannot know the test is reliable without knowing God.

Relations were "a curious mixture of respect and dismissal"; Descartes suspected Hobbes of "aiming to make his reputation at my expense".

## The Passions and the Egoism Debate

Hobbes's politics starts from psychology. People, he assumed, generally shun death, have limited benevolence, are sensitive to slights, and call "good" and "bad" what they desire and shun. Reason serves desire, as "scouts, and spies, to range abroad, and find the way to the things desired". Hence "a perpetual and restless desire of power after power, that ceaseth only in death": not greed for its own sake, but a need for ever more means to secure what one wants.

Was he a **psychological egoist**, holding that people only ever act for their own good? The traditional reading said so, citing "No man giveth but with intention of good to himself". In 1967 Bernard Gert argued he was not, though Hobbes thought most actions self-interested. The egoist reading, the Stanford Encyclopedia reports, "is currently widely rejected". As will be seen, his central argument may not need it.

## The State of Nature

The **state of nature** is the condition of people living "without a common power to keep them all in awe". Following the Stanford Encyclopedia and the IEP, Hobbes's argument can be set out like this:

1. **Equality.** People are roughly equal in body and mind, so anyone can kill anyone, by stealth or with allies. (The IEP's paraphrase: "even the strongest must sleep".) So no one has natural authority over others.
2. **The right of nature.** Each person may preserve himself and judge what that requires. Since almost anything might be judged necessary, this becomes in practice "a right to all things", even to one another's bodies.
3. **Scarcity and uncertainty.** People compete for scarce goods and cannot know one another's intentions.
4. **Three causes of quarrel.** "First, competition; secondly, diffidence; thirdly, glory": people invade for gain, for safety and for reputation. **Diffidence** means distrust: if others may attack, striking first is rational, and a vainglorious few force even the modest into pre-emptive defence.
5. **Conclusion.** "Hereby it is manifest, that during the time men live without a common power to keep them all in awe, they are in that condition which is called war; and such a war, as is of every man, against every man."

The consequences fill his most famous sentence:

```quote
In such condition, there is no place for industry; because the fruit thereof is uncertain: and consequently no culture of the earth; no navigation, nor use of the commodities that may be imported by sea; no commodious building; no instruments of moving, and removing such things as require much force; no knowledge of the face of the earth; no account of time; no arts; no letters; no society; and which is worst of all, continual fear, and danger of violent death; and the life of man, solitary, poor, nasty, brutish, and short.
Thomas Hobbes · Leviathan, chapter 13 (spelling modernised) · 1651
```

There, "nothing can be unjust. The notions of right and wrong, justice and injustice have there no place." The Latin tag *bellum omnium contra omnes*, "the war of all against all", comes from *De Cive*, not *Leviathan*.

**Objection: there never was such a state.** Hobbes replied that sovereigns are in exactly this condition towards one another (hence his place as the classic "realist" about international relations); that "the savage people in many places of America" still are; and, most tellingly, that anyone whose state has collapsed into civil war can recognise it. The state of nature is an abstraction, but something like it is a "perpetually present possibility".

**Objection: people live in families, not alone.** Feminist and other critics note that the first human units were families, bound by nurture, affection, clan and religion; *De Cive* asks us to consider men "as if they had just emerged from the earth like mushrooms". The reply: competition, distrust and glory could be just as disastrous between small groups.

**Objection: this is civilised man with the laws removed.** Rousseau, in the *Discourse on Inequality*, argued, in the IEP's summary, that accounts such as Hobbes's took socialised people and subtracted government. Foresight, property and seeing others as threats develop historically; natural man would be isolated, timid, peaceful and mute, moved by pity as well as self-preservation (see *The Enlightenment and Rousseau*).

**Objection: human nature is not so bad.** The IEP's Garrath Williams replies that a less selfish picture of human nature would not remove the problem, because its root is private judgement. Even well-meaning people disagree about what safety requires, and with no common judge disagreement becomes dangerous.

Whether the war comes from short-sighted irrationality, rational people trapped in something like a prisoner's dilemma (explained below), or pride and spite remains "a matter of continuing debate".

```checkpoint
q: Why, on Hobbes's argument, would even people who want only to be left alone end up fighting in the state of nature?
a*: Because without a common power no one can trust others' intentions, so striking first for safety becomes rational, and a few glory-seekers force the rest into pre-emptive defence.
a: Because Hobbes assumes that everyone enjoys violence for its own sake.
x: Hobbes's three causes are competition, distrust and glory; he does not assume a love of violence, and the argument works even if most people are modest.
a: Because God commanded the strong to rule the weak.
x: Hobbes's first premise is that people are roughly equal, so there is no natural authority of the strong; the argument does not appeal to divine command.
a: Because property already exists and people fight over its boundaries.
x: In Hobbes's state of nature there is no settled property or justice at all; "nothing can be unjust" there.
hint: Think about the second of the three causes of quarrel.
why: Diffidence, or distrust, makes anticipation rational: if others may attack, attacking first is the safest course. The vainglorious minority makes everyone's distrust reasonable.
---
q: Where does the Latin phrase "bellum omnium contra omnes" come from?
a: From chapter 13 of Leviathan.
x: Leviathan, written in English, speaks of a war "of every man, against every man"; the Latin phrase is not in it.
a: From Rousseau's Discourse on Inequality.
x: Rousseau criticised Hobbes's state of nature but did not coin this phrase.
a*: From Hobbes's De Cive.
a: From Thucydides, whom Hobbes translated.
x: Hobbes translated Thucydides, but the phrase is Hobbes's own, from a different work.
hint: Hobbes wrote one of his political books in Latin.
why: The phrase appears in the Preface added to De Cive in 1647, and in its first chapter; Leviathan's English wording is "war of every man against every man".
```

## Laws of Nature and the Fool

Reason points the way out through **laws of nature**: "precepts", "conclusions" or "theorems" of reason, "eternal and immutable". Hobbes lists nineteen. The first: "Every man ought to endeavor peace, as far as he has hope of obtaining it, and when he cannot obtain it, that he may seek and use all helps and advantages of war." The second: that a man be willing, "when others are so too", to "lay down this right to all things", content with as much liberty against others as he would allow them against himself. The third, keeping covenants, founds justice. They bind in conscience always, but in action only when it is safe. One right cannot be given up: "the right of resisting them that assault him by force to take away his life", so a promise not to defend oneself is void.

Against the third law Hobbes sets an opponent. "The fool hath said in his heart, there is no such thing as justice", he writes, echoing the Psalm's fool who denies God. The Fool ("Foole" in Hobbes's spelling) argues that once the other party has performed, it is sometimes "most reasonable" to break faith and keep the gain. Hobbes answers that no one will admit a known covenant-breaker into the agreements and alliances on which survival depends. Sugden (1986) and Skyrms (1998) read the reply as an early version of a result about **repeated games**: cooperation irrational in a single encounter can be rational among people who expect to meet again indefinitely.

That belongs to a wider debate. From the 1960s, Barry, David Gauthier, Jean Hampton, Gregory Kavka and others gave game-theoretic models of the state of nature, often as a **prisoner's dilemma**, in which each does better by defecting whatever the other does, so all end worse off than if all had cooperated. Moehler (2009) argues it is better seen as an **assurance game**, in which people would cooperate if only they could be sure others would. Hampton posed a dilemma: if war comes from passion, contractors will break the contract; if from prisoner's-dilemma rationality, rational people will not keep it either.

What kind of obligation is this? The mainstream reading is **prudential**: Hobbes says the laws are only "improperly" called laws, telling a rational person how to survive. Against this, A. E. Taylor (1938) and Howard Warrender (1957), and later A. P. Martinich (1992), argued that obligation rests on the laws of nature as **God's commands**. Critics answer that the laws would then not bind atheists and that the textual evidence is thin; yet Mark Murphy counts Hobbes a "paradigmatic natural law theorist" who held the laws of nature to be divine law. So the claim in *The Rise of Absolutism* that Hobbes's argument rested on consent and self-interest, not on God, is the majority view, not the only one.

## Authorization and the Mortal God

The escape is a **covenant**, a mutual promise to obey a common authority, the **sovereign**, which may be one man or an assembly. It may be made **by institution**, people covenanting with one another, or **by acquisition**, covenanting with a conqueror for protection; both are legitimate, and in both the motive is fear.

*Leviathan* adds **authorization**. In the *Elements* and *De Cive*, subjects simply lay down their rights. In *Leviathan* each covenants to "own and authorise" all the sovereign's public acts, as if saying, "I authorise and give up my right of governing myself to this man, or to this assembly of men". The sovereign then acts in the subjects' name. "This is the generation of that great Leviathan, or rather (to speak more reverently) of that mortal God, to which we owe under the immortal God" peace and defence.

{{image: Leviathan (Hobbes book) | The frontispiece of Leviathan (1651), engraved by Abraham Bosse with input from Hobbes: a crowned giant made of small human figures holds a sword and a crozier.}}

The consequences are hard. Since subjects author whatever the sovereign does, "he that complaineth of injury from his sovereign complaineth that whereof he himself is the author". And sovereignty must be **absolute**, neither divided nor limited. Any body able to limit the sovereign would become sovereign itself, or begin a regress of authorities. "For what is it to divide the power of a commonwealth, but to dissolve it; for powers divided mutually destroy each other." Monarchy, aristocracy and democracy differ not in power but in their aptitude to keep the peace; Hobbes preferred monarchy on mild practical grounds.

He rejected both Filmer's divine right of kings and sovereignty shared between king and Parliament. Obligation ends when protection ceases, and he admitted "there is scarce a commonwealth in the world whose beginnings can in conscience be justified". The Latin *Leviathan* of 1668 coined *auctoritas non veritas facit legem*, "authority, not truth, makes law".

Yet limits remain. In chapter 21, on "the true liberties of subjects", each keeps a right of self-defence even against the sovereign, and what the Stanford Encyclopedia calls "seemingly broad resistance rights" where family or even honour is at stake. Otherwise liberty "depends on the silence of the laws". Bramhall called *Leviathan* a "Rebell's Catechism", and some commentators call these rights the theory's "Achilles' heel": if each subject judges whether protection has failed, have we left the state of nature at all?

## God, Scripture and the Kingdom of Darkness

Religion fills roughly half of *Leviathan*. Part III, "Of a Christian Commonwealth", argues that no one can infallibly know another's claimed revelation: "To say he hath spoken to him in a dream is no more than to say that he dreamed God spake to him." So religious power is subordinate to civil power and the sovereign heads the church, a position often called Erastian, though some scholars think he goes further; the frontispiece's sword and crozier show both powers in one hand. He also treated the first five books of the Bible as a later compilation. Part IV, "Of the Kingdom of Darkness", concerns not hell but ignorance spread by a "confederacy of deceivers", chiefly the Roman Church.

In the *Elements of Law* he argued that we know only that God exists, as "first cause of all causes", since "we can have no conception or image of the Deity"; words like "spirit" express reverence, not description. Later he called God a "corporeal spirit", an extended body mixed through the world. Critics, Cudworth (1678) among them, thought he denied God. Hobbes called "atheism, impiety, and the like" "words of the greatest defamation possible".

Scholars still divide. Curley (1992) and Jesseph (2002) read him as concealing irreligion; Curley notes that miracles are judged by doctrine while prophets are judged by miracles, a circle. Others reply that Hobbes said many dangerous things openly and that his corporeal God looks sincerely defended: "on the surface an odd theism rather than atheism", in the Stanford Encyclopedia's phrase (see *God: Arguments For and Against*).

## Women and Mothers

Hobbes, in the Stanford Encyclopedia's words, "was one of the earliest western philosophers to count women as persons when devising a social contract". Women are naturally equal to men, equally vulnerable and equally able to dominate, so their consent is needed. Against Filmer's patriarchalism he held that women can be sovereigns. In the state of nature, dominion over children belongs to the mother: "where there are no matrimonial laws, it cannot be known who is the father", and "if there be no contract, the dominion is in the mother". He cited the Amazons, who contracted with neighbouring men so that daughters stayed with their mothers.

Yet in civil society he describes families as fathers, servants and children, on the ground that fathers, not mothers, founded societies. Feminist readers disagree over which strand matters: Pateman (1989) stresses women's ultimate exclusion; others, including Slomp (1994), find egalitarian resources. Margaret Cavendish, who attended "Cavendish Circle" meetings in the 1640s with Hobbes, Descartes, Mersenne and Gassendi, built her own materialism, in which thought is a basic feature of bodies rather than motion in the brain, refused to make God a body, and sided largely with Hobbes in politics (see *Women Philosophers of the Early Modern Era*). On race, Hobbes invoked the "savages" of America but denied innate differences: without leisure, "what do we differ from the wildest of the Indians?"

```checkpoint
q: What new element does Leviathan add to Hobbes's earlier account of the covenant in The Elements of Law and De Cive?
a: The idea that the sovereign is chosen by God.
x: Hobbes rejected divine-right theories such as Filmer's; the sovereign's authority comes from the covenant.
a*: Authorization: each subject owns and authorises all the sovereign's public acts, so the sovereign acts in their name.
a: The idea that the sovereign must share power with Parliament.
x: Hobbes held that sovereignty must be undivided; dividing it, he said, dissolves it.
a: The idea that subjects keep no rights at all.
x: Leviathan keeps a right of self-defence even against the sovereign, which Bramhall attacked as a "Rebell's Catechism".
hint: In the earlier works subjects simply lay down their rights.
why: In Leviathan subjects become authors of the sovereign's acts, which is why a subject who complains of injury from the sovereign complains of what he himself has authored.
---
q: According to Hobbes, who has dominion over children in the state of nature, and why?
a: The father, because men are naturally stronger.
x: Hobbes held that women and men are naturally equal, equally vulnerable and equally capable of dominating.
a: The sovereign, because children are part of the commonwealth.
x: In the state of nature there is no sovereign; that is what defines it.
a: No one, because children have a right to all things.
x: Hobbes explicitly assigns natural dominion over children; it does not lapse.
a*: The mother, because without matrimonial laws the father cannot be known.
hint: Hobbes cited the Amazons as evidence.
why: Hobbes wrote that where there are no matrimonial laws it cannot be known who is the father, and that if there is no contract the dominion is in the mother. In civil society, however, he described families as headed by fathers, which is why feminist readers disagree about him.
```

## Hobbes's Afterlife

His method, justifying authority by what free, equal, rational people would agree to, gave social contract theory what the IEP calls "its first full exposition and defense", while, in the Stanford Encyclopedia's words, his substantive conclusions "have served mostly as a foil" (see *Authority and the State: the Social Contract and Its Critics*).

Locke never names him, but in the *Second Treatise* he held the state of nature preferable to an absolute sovereign's arbitrary power (see *Locke*). Spinoza told Jarig Jelles that the difference between them was that "I always preserve natural Right unimpaired", so that the sovereign has no more right over subjects than it has power over them (see *Spinoza*). Rousseau rejected Hobbes's representative sovereign, calling the handing over of one's right of ruling oneself a form of slavery, yet agreed that individuals keep no natural rights against the community. Leibniz may well have paid more attention to him than any other major philosopher between Descartes and Kant (see *Leibniz*). Further afield, scholars have compared Hobbes's sovereign with the Legalist Han Feizi's (see *Mozi, the Daoists and the Legalists: the Hundred Schools*), and Xunzi's account of why the ancient kings made rituals is, as *Confucius, Mencius and Xunzi* notes, superficially like Hobbes's state of nature.

## Further exploration

- **A. P. Martinich, *Hobbes: A Biography* (1999).** Described by the Stanford Encyclopedia as the best modern biography.
- **Richard Tuck, *Hobbes* (1989).** A short introduction by the editor of the Cambridge *Leviathan*.
- **Jean Hampton, *Hobbes and the Social Contract Tradition* (1986).** A game-theoretic reconstruction of the argument and a critique of its contract.
- **S. A. Lloyd, *Morality in the Philosophy of Thomas Hobbes: Cases in the Law of Nature* (2009).** A leading study of the laws of nature.
- **Susanne Sreedhar, *Hobbes on Resistance: Defying the Leviathan* (2010).** On the rights subjects keep against the sovereign.
- **Nancy J. Hirschmann and Joanne H. Wright (eds.), *Feminist Interpretations of Thomas Hobbes* (2012).** Essays on women, the family and the contract.
- **Quentin Skinner, *Hobbes and Republican Liberty* (2008).** Hobbes's theory of liberty in its civil-war context.$hobbes_master$,
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
  select $hobbes_quiz$[
    {"type": "mcq", "prompt": "Which statement about Hobbes's 'twins' story is accurate?", "options": ["'Fear and I were born twins' is a sentence from Leviathan", "The story comes from Hobbes's Latin verse autobiography, written around 1672–73; 'fear and I were born twins' is a later paraphrase", "The story was invented by John Aubrey after Hobbes's death", "Hobbes told the story in his objections to Descartes"], "answerIndex": 1, "explanation": "Hobbes wrote in his Latin verse autobiography, composed around 1672–73, that his mother, frightened by news of the Armada, gave birth to twins, himself and fear. An English translation of 1680 renders it 'Did bring forth Twins at once, both Me, and Fear.' The familiar wording is a later paraphrase.", "id": "q1"},
    {"type": "mcq", "prompt": "In the Third Objections, what did Hobbes argue against Descartes?", "options": ["That the mind is an immaterial substance distinct from the body", "That we have a clear and distinct idea of God", "That a thinking thing might be something corporeal, and that ideas are images, so we have no idea of God", "That the senses can never deceive us"], "answerIndex": 2, "explanation": "Hobbes argued that from 'I am thinking' it does not follow that the thinker is immaterial, since a thinking thing may be a body, and that ideas are images, so we have no idea of God. Descartes replied that Hobbes confused the thinking thing with its acts, and that by 'idea' he meant whatever is immediately perceived by the mind.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Hobbes answer the Fool, who says it is sometimes reasonable to break a covenant after the other party has performed?", "options": ["No one will admit a known covenant-breaker into the agreements and alliances on which survival depends, so breaking faith tends to one's own destruction", "God will punish covenant-breakers in the next life, so the Fool is mistaken", "There is no state of nature, so the question never arises", "The sovereign has no power to punish broken promises"], "answerIndex": 0, "explanation": "Hobbes's reply is that a known covenant-breaker will be excluded from future covenants and defensive alliances. Game theorists such as Sugden and Skyrms read this as an early version of an argument about indefinitely repeated games.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the Taylor–Warrender thesis about Hobbes's laws of nature?", "options": ["That they are merely descriptions of how people actually behave", "That Hobbes borrowed them from Thucydides", "That they bind only the sovereign, not subjects", "That obligation in Hobbes rests on the laws of nature as God's commands, rather than on prudence alone"], "answerIndex": 3, "explanation": "A. E. Taylor (1938) and Howard Warrender (1957), later joined in a related form by Martinich, read the laws as divine commands. The mainstream reading treats them as prudential theorems of reason; critics of Taylor and Warrender note that the laws would then not bind atheists and that the textual evidence is thin.", "id": "q4"},
    {"type": "open", "prompt": "Set out Hobbes's argument that the state of nature would be a 'war of every man against every man'. Then give one objection and the best reply to it.", "rubric": "A strong answer defines the state of nature (life without a common power to keep all in awe) and gives the steps: rough equality, so anyone can kill anyone and no one has natural authority; the right of nature, which becomes a right to all things; scarcity and uncertainty about others' intentions; the three causes of quarrel (competition, diffidence or distrust, glory), with distrust making pre-emptive attack rational; hence war, with life 'solitary, poor, nasty, brutish, and short' and no justice or injustice. It gives an objection with a reply: that there never was such a state (sovereigns are in it towards each other; civil war reveals it; it is an ever-present possibility); that people live in families (competition, distrust and glory can wreck small groups too); Rousseau's charge that Hobbes describes socialised man with laws removed; or that human nature is not so selfish (Williams: the root problem is private judgement and disagreement, not selfishness). Credit noting that 'bellum omnium contra omnes' comes from De Cive, or the debate over whether the war stems from irrationality, prisoner's-dilemma rationality or the passions.", "id": "q5"},
    {"type": "open", "prompt": "What does it mean for subjects to 'authorise' the sovereign in Leviathan, and what rights does Hobbes say they keep? Do those rights undermine his absolutism?", "rubric": "A strong answer explains that in Leviathan, unlike the Elements of Law and De Cive, each subject covenants to own and authorise all the sovereign's public acts, so the sovereign acts in their name and a subject who complains of injury complains of what he himself authored. It explains why sovereignty must be absolute and undivided (dividing power dissolves it; any limiting body becomes sovereign or starts a regress), and mentions sovereignty by institution and by acquisition. It identifies the retained rights: the inalienable right to resist those who assault one's life, self-defence even against the sovereign, seemingly broad resistance rights where family or honour are at stake, and liberty where the laws are silent; and that obligation ends when protection ceases. It weighs whether these undo absolutism, citing Bramhall's 'Rebell's Catechism' and the 'Achilles' heel' worry that subjects judging for themselves returns us towards the state of nature.", "id": "q6"}
  ]$hobbes_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/hobbes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
