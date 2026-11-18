-- Leibniz — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/leibniz @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/leibniz',
    'research',
    'advanced',
    'read',
    $leibniz_master$> **Gottfried Wilhelm Leibniz (1646–1716) held that the world is made of countless mind-like simple substances, each mirroring the universe from its own point of view, and that God chose this world as the best of all possible ones.** This chapter follows him from Leipzig and Paris to forty years in the service of Hanover; sets out his principles of contradiction and sufficient reason, the complete-concept theory and Arnauld's objection, the monads and the "mill" argument, and pre-established harmony; lays out his argument that this is the best possible world, against the problem of evil pressed by Bayle and Voltaire; and turns to his logic and calculus, his quarrel with Newton's follower Clarke over space and time, his engagement with China, and the women among his closest correspondents.

## A Courtier with a Thousand Correspondents

Leibniz was born in Leipzig on 1 July 1646, two years before the end of the Thirty Years War, into a Lutheran family; his father, a jurist and professor of moral philosophy, died when he was six, leaving him the run of a library. At the University of Leipzig from 1661 he received a chiefly Scholastic education, and he spent his life trying to reconcile the new mechanical philosophy with Aristotle, Plato and the Scholastics. In 1666 he published the *Dissertation on the Art of Combinations* and took a doctorate in law at Altdorf, Leipzig having refused him, probably for his youth.

He declined an academic post and from 1668 served the Elector of Mainz, working on legal reform and church reunion; in these years he wrote to Hobbes, who did not answer (see *Hobbes*). In 1672 he was sent to Paris on a diplomatic mission and stayed four years. There he met Arnauld, Malebranche and Christiaan Huygens, who tutored him in mathematics, and designed a calculating machine for the four arithmetical operations, demonstrated to the Royal Society in London on 1 February 1673.

On his way to a new post in Hanover he met Spinoza at The Hague on 18–21 November 1676, about three months before Spinoza's death. By Leibniz's notes they discussed the unpublished *Ethics*, Cartesian physics and Leibniz's improved ontological argument, which first sets out to show that a most perfect being is possible (see *God: Arguments For and Against*; his objection to Spinoza's monism is in *Spinoza*). For the next forty years he served the dukes of Brunswick in Hanover as librarian, counsellor, mining engineer and historian of the ducal house. He corresponded with over 1,100 people, and on his advice the Elector of Brandenburg founded a Society of Sciences in Berlin on 11 July 1700, with Leibniz as its first president.

Women were at the centre of this life. Electress Sophie of Hanover (1630–1714) was the youngest sister of Elisabeth of Bohemia, whose objections appear in *Descartes*; her friendship with Leibniz lasted from 1676 until her death. Her daughter Sophie Charlotte (1668–1705), from 1701 the first Queen in Prussia, inspired the Berlin academy, and conversations at her court about Pierre Bayle's *Historical and Critical Dictionary* were the direct impetus for the *Theodicy*. The Internet Encyclopedia of Philosophy (IEP) says the two Sophies "encouraged, and in many ways made possible, Leibniz's philosophical pursuits while employed at the court". Caroline, Princess of Wales, later carried his letters to Samuel Clarke (see *Women Philosophers of the Early Modern Era*).

When the Elector Georg Ludwig became George I of Great Britain in 1714, Leibniz was told to stay in Hanover, partly because of the acrimony against him in England. He died there on 14 November 1716. By Wikipedia's account no courtier but his secretary attended the funeral, neither the Royal Society nor the Berlin Academy honoured his death, and his grave went unmarked for more than fifty years, though Fontenelle gave a eulogy at the Paris Académie.

{{image: Gottfried Wilhelm Leibniz | Leibniz in a portrait of about 1695, the years of the New System and the Specimen Dynamicum.}}

## A Philosophy in Fragments

Leibniz left no single great treatise; his philosophy is pieced together from essays, letters and unpublished papers, each written with an eye to its audience. The main texts are the *Discourse on Metaphysics* (1686, unpublished in his life); the *New System of Nature* (1695); the *New Essays on Human Understanding*, a reply to Locke finished in 1704 but withheld after Locke's death and printed only in 1765; the *Theodicy* (1710); and two summaries of 1714, the *Monadology* (a title not his) and the *Principles of Nature and Grace*. The *Theodicy* appeared anonymously; he claimed it only in the second edition of 1712. It is the only full-length philosophical book he published in his lifetime (his youthful *Art of Combinations* was a dissertation), and he classed it as **exoteric**, written for a wide public rather than for specialists. How much weight such popular works deserve, and how far the *Discourse* and the *Monadology* agree, are both disputed.

Translations quoted: Ariew and Garber (1989) for the *Discourse*, the *Monadology* and other essays; Loemker (1969) for letters; Remnant and Bennett (1981) for the *New Essays*; Huggard (1952) for the *Theodicy*; Wiener (1951) where noted; and Clarke's own 1717 English, edited by H. G. Alexander, for the Clarke papers.

## Two Great Principles

"Our reasonings are based on two great principles," says the *Monadology*, "that of contradiction ... [and] that of sufficient reason." The **principle of contradiction** says that "a proposition cannot be true and false at the same time". The **principle of sufficient reason** (PSR) says that there is no true fact or assertion "without there being a sufficient reason why it is thus and not otherwise, although most of these reasons cannot be known to us" (in the IEP's rendering).

Why believe it? Leibniz derived it from his account of truth. "In every true affirmative proposition," he wrote to Arnauld, "the notion of the predicate is in some way included in that of the subject. *Praedicatum inest subjecto*; otherwise I do not know what truth is." If every truth holds because its predicate is contained in its subject, there is always, in principle, a reason why it holds.

From these comes the **identity of indiscernibles**: "it is not true that two substances can resemble each other completely and differ only in number". A difference merely of place or time does not count. The argument runs through the PSR: if two indiscernible things existed, God could have made a world just like ours with the two swapped, and would have had no reason to prefer one world to the other; but God always has a reason. Combined with its converse, that identical things share all their properties, this became known as "Leibniz's Law" (see *Identity, Change and Persons*).

## Complete Concepts and the Threat to Freedom

The predicate-in-subject theory has a startling consequence. An individual substance, says the *Discourse* (§8), has "a notion so complete that it is sufficient to contain and to allow us to deduce from it all the predicates of the subject". So "from all time in Alexander's soul there are vestiges of everything that has happened to him and marks of everything that will happen to him and even traces of everything that happens in the universe, even though God alone could recognize them all." Each substance is "like a complete world and like a mirror of God or of the whole universe".

Antoine Arnauld, sent a summary in 1686, saw the danger: if my future acts are in my concept, they seem necessary. And surely I could have lived otherwise and still been me: "Since it is impossible that I should not always have remained myself, whether I had married or lived in celibacy, the individual concept of myself contained neither of these two states."

Leibniz replied in three ways. First, a **necessary** truth, like 2 + 2 = 4, is one whose denial is a contradiction, reducible to an identity in finitely many steps; a **contingent** truth needs an analysis that goes on "to infinity through reasons for reasons", which only God, "who alone traverses the infinite series in one stroke of mind", grasps completely, as an incommensurable ratio, like that of a square's side to its diagonal, never resolves. Second, a contingent truth is certain but not necessary. Caesar's crossing of the Rubicon is "contingent, even though it is certain": "it is not its impossibility but its imperfection which causes [the alternative] to be rejected". God "inclines our souls without necessitating them". Third, freedom is spontaneity, action flowing from one's own nature, plus choice of the apparent best: a distinctive compatibilism, the view that freedom and determination can coexist. As for Arnauld's "myself", Leibniz told him not to speak of a "vague Adam": had things gone differently, "he would not have been our Adam, but another Adam".

Whether this rescues freedom is debated. Some read him as holding that every property of an individual is essential to it; others think other possible worlds contain only counterparts of Adam. Possible worlds were what, he said, saved him from Spinoza's view that everything is necessary: "the consideration of possibles, which are not, were not, and will not be, brought me back from this precipice." Did he invent the possible-worlds semantics of modern modal logic? The Stanford Encyclopedia of Philosophy (SEP) judges that he had "all the tools" but did not formulate it explicitly, though his account is translatable into it (see *Possibility and Necessity* and *Free Will and Determinism*).

## Monads

What, then, is really there? "What is not truly *one* being is not truly one *being* either." Bodies, endlessly divisible, are aggregates: "well-founded phenomena". The only true substances are **monads**: simple, mind-like substances with two powers. **Perception** is "the representation in the simple of the compound, or of that which is outside"; **appetition** is the inner tendency to pass from one perception to the next.

Monads form a hierarchy. Bare monads merely perceive; souls, as in animals, add distinct perception and memory; minds add reason and **apperception**, "consciousness, or the reflective knowledge of this internal state", which is "not given to all souls, nor at all times to a given soul". Against Descartes, animals are not mere machines, and "all of nature is full of life". Against Descartes's transparent mind, "at every moment there is in us an infinity of perceptions, unaccompanied by awareness or reflection", as the roar of the sea is made up of the noise of each wave. In the *New Essays* he sided with Plato against Locke, likening the mind not to a blank tablet but to veined marble (see *Locke* and *Reason, Experience and Innate Ideas*). Above all, nothing outside can affect a monad: "The monads have no windows through which something can enter or leave."

## The Mill

Why must perception belong to simple substances rather than to matter? The *Monadology* answers with its most famous image:

```quote
In imagining that there is a machine whose construction would enable it to think, to sense, and to have perception, one could conceive it enlarged while retaining the same proportions, so that one could enter into it, just like into a windmill. Supposing this, one should, when visiting within it, find only parts pushing one another, and never anything by which to explain a perception.
Gottfried Wilhelm Leibniz · Monadology §17 (trans. Ariew and Garber) · 1714
```

The SEP and the IEP reconstruct the argument roughly like this:

1. Materialism says matter can explain, or give rise to, perception.
2. A perception represents a variety of content in a true unity: a single "I".
3. What is not a true unity cannot perceive.
4. Whatever is divisible is not a true unity.
5. Matter is infinitely divisible.
6. Therefore matter cannot perceive; perception belongs to simple substances.

**The objection.** The argument stands or falls with premises 2 to 4, which come from Leibniz's own views of perception and of matter. A materialist (see *Hobbes*) will simply deny that perceiving needs an indivisible subject; and the IEP reports "considerable disagreement among recent scholars" about how the argument is even to be read.

**The reply.** Leibniz grounds premise 2 in experience, not theory: there is in us "a true unity which corresponds to what is called the *I*", and we are conscious of "this I". The mill's real point survives the dispute over his metaphysics: however closely we inspect the working parts, the description of pushes and pulls seems to leave out the perceiving. The IEP links it to today's "hard problem" of consciousness and to the question whether a machine could think (see *The Mind–Body Problem*, *Consciousness* and *Minds and Machines: Could AI Think?*).

## Pre-established Harmony

If monads have no windows, how do mind and body keep in step, the puzzle Descartes left? Leibniz's answer is that no created substance truly acts on another. In a 1696 letter to Basnage de Beauval he offered an image, which the SEP gives as two pendulums hanging from a beam and the IEP as two pendulum clocks. Two clocks could agree in three ways. One could move the other by a causal link (**interaction**, the Scholastics' "influx"). A craftsman could constantly adjust them (**occasionalism**, Malebranche's view that God is the only true cause). Or they could be built so perfectly that each keeps time by its own nature (**pre-established harmony**).

Occasionalism, he objected, makes God perform a "perpetual miracle", and giving all activity to God slides into Spinozism. Instead God created each substance so that "everything must arise for it from its own depths, through perfect spontaneity relative to itself, and yet with a perfect conformity relative to external things". "Souls act according to the laws of final causes", that is, purposes; "bodies act according to the laws of efficient causes ... And these two kingdoms ... are in harmony with each other."

Not everyone was persuaded. Damaris Masham, Locke's friend and Ralph Cudworth's daughter, corresponded with Leibniz at his instigation in letters of about 1703/4 to 1705 (the editions date them differently), he in French and she in English. She took issue with pre-established harmony, his account of substance and free will.

```checkpoint
q: In the mill argument, why does Leibniz think a machine enlarged to the size of a mill could not perceive?
a*: Inside it we would find only parts pushing one another, and a divisible thing lacks the true unity that perception needs.
a: Because the machine would be too large to perceive anything distinctly.
x: Size is irrelevant; the enlargement only lets us walk in and inspect the parts.
a: Because only God can build machines, and God does not build thinking ones.
x: The argument concerns what matter is like, not who builds the machine.
a: Because machines cannot have memory, and perception requires memory.
x: For Leibniz even bare monads perceive without memory; the issue is unity, not memory.
hint: Think about what a perception must be, and what matter always is.
why: A perception represents many things in one "I"; matter is infinitely divisible and so not a true unity; so perception must belong to simple substances, the monads.
---
q: In Leibniz's image of two clocks that keep perfect time together, which explanation is his own?
a: One clock moves the other through a causal link.
x: That is interaction, or "influx", which Leibniz rejects: no created substance acts on another.
a: A craftsman constantly adjusts both clocks.
x: That is occasionalism, which Leibniz rejects because it makes God perform a perpetual miracle.
a*: The clocks were made so perfectly at the start that each keeps time by its own nature.
a: The two clocks are really one clock seen in two ways.
x: That resembles Spinoza's answer (one thing under two attributes), not Leibniz's.
hint: The name of his view tells you when the agreement was arranged.
why: Pre-established harmony: God created each substance so that everything arises from its own depths, yet in perfect conformity with everything else.
```

## The Best of All Possible Worlds

Leibniz coined the word **theodicy**, from the Greek *theos* (God) and *dikē* (justice): "the doctrine of the right and justice of God". The problem is old, as *The Problem of Evil* explains: if God is all-powerful and good, why is there evil? Leibniz's answer begins with an argument that the SEP reconstructs like this:

1. God is an omnipotent, omniscient, benevolent and free creator.
2. There are other possible worlds God could have created.
3. Suppose this world is not the best possible.
4. Then either God lacked the power, the knowledge or the will to create the best, or did not create, or there were no alternatives.
5. Each of these contradicts premise 1 or premise 2.
6. Therefore this is the best of all possible worlds.

In the *Theodicy* God's wisdom finds the best and his goodness "morally necessitates" choosing it, since "a lesser good is a kind of evil", and "if there were not the best (*optimum*) among all possible worlds, God would not have produced any". "Best" does not mean pleasantest: the best world is "the simplest in hypotheses and the richest in phenomena", though "the happiness of minds is the principal aim of God".

He distinguished **metaphysical** evil, the limitation any creature must have; **physical** evil, suffering; and **moral** evil, sin. To the complaint that the world could obviously be better, he replied that everything is connected, so removing one evil would mean "an altogether different sequence"; that evils contribute to the whole: "A little acid, sharpness or bitterness is often more pleasing than sugar; shadows enhance colors; and even a dissonance in the right place gives relief to harmony"; that we see only a small part; and that good is unbounded while evil is limited: "God is infinite, and the Devil is finite."

**The objection.** Bayle, in Leibniz's eyes, set faith against reason on evil; Parts II and III of the *Theodicy* are a running dialogue with him. Then came the Lisbon earthquake of 1 November 1755, which killed an estimated 30,000–40,000 people in the city. Voltaire attacked "optimism" in a poem on the disaster and in *Candide* (1759), where Dr Pangloss repeats that all is for the best in the best of all possible worlds (Voltaire's words, not Leibniz's). A world with such suffering, the objection runs, is visibly not the best. As Adorno put it, "The earthquake of Lisbon sufficed to cure Voltaire of the theodicy of Leibniz." (His target had passed through Leibniz's follower Christian Wolff and through Pope; see *The Enlightenment and Rousseau*.)

**The reply.** Leibniz never claimed that each thing is good taken by itself, only that the whole series is the best possible; an earthquake can be a real evil within the best world, as a dissonance is within the best music. A subtler objection, pressed by Robert Merrihew Adams in 1972, is that there may be no best world, only ever better ones; Leibniz's answer is that then God would not have created at all, yet the world exists. And if God must choose the best, is this world necessary after all? Leibniz answered that God's choice is morally, not metaphysically, necessary; whether that distinction holds is still argued.

## Space, Time and the Quarrel with Clarke

In late 1715 Caroline passed to Samuel Clarke, Newton's ally, a letter in which Leibniz decried the decline of natural religion in England. Newton's followers, he wrote, hold that "God Almighty wants to wind up his Watch from Time to Time: Otherwise it would cease to move", as if God were a clockmaker forced to mend his work. Five letters from Leibniz and five replies followed, ending with Leibniz's death, Clarke having the last word; Clarke published them in 1717.

Clarke defended absolute space and time, existing prior to bodies and identified with God's immensity and eternity. Leibniz attacked them with his principles. By the PSR, God could have had no reason to place the world in absolute space one way rather than shifted or rotated, or to create it at one moment rather than another, and "a mere will without any motive, is a fiction". By the identity of indiscernibles, such shifted worlds would not really differ: "To suppose two things indiscernible, is to suppose the same thing under two names." His alternative is **relationalism**: space and time are only orders of relations among things.

```quote
I hold space to be something merely relative, as time is, that I hold it to be an order of coexistences, as time is an order of successions.
Gottfried Wilhelm Leibniz · Third Paper to Clarke §4 (Clarke's translation, ed. H. G. Alexander) · 1716
```

Clarke replied that God can choose without a reason; they also disputed free will and whether God must create the best. Kant would later make space and time forms of our intuition (see *Kant* and *Time*).

## Logic, Calculus and the Priority Dispute

Already in 1666 Leibniz planned a "universal characteristic", an alphabet of human thoughts, with a logical calculus to go with it. In papers of April 1679 he assigned numbers to concepts (animal = 2, rational = 3, so man = 6) to test arguments by arithmetic, and his algebra of concepts has been shown by Wolfgang Lenzen to be deductively equivalent to the Boolean algebra of sets. The dream was that, "when there are disputes among persons, we can simply say: Let us calculate, without further ado, and see who is right" (Wiener's translation). He published almost none of this; the fragments lay in Hanover until Couturat edited them in 1901–3, after Frege had presented his *Begriffsschrift* (1879) as a language in Leibniz's sense (see *Formal Logic: Propositions, Predicates and Proofs* and *Frege, Russell and the Birth of Analytic Philosophy*).

His notebooks record a breakthrough in the calculus on 11 November 1675; he introduced the signs ∫ (from *summa*) and *d* (from *differentia*), and published first, in "Nova Methodus pro Maximis et Minimis" (1684). Newton had worked on his "fluxions" from 1666 but printed them later. In 1699 Nicolas Fatio de Duillier publicly accused Leibniz of plagiarism, and in 1708 John Keill repeated the charge. When Leibniz demanded a retraction, the Royal Society, with Newton as president, set up a committee that never asked for his side; Newton himself wrote its 1712 report, printed as the *Commercium Epistolicum*. Most historians now hold, in the SEP's words, that they "developed their ideas independently: Newton developing the ideas first with Leibniz the first to publish", though Leibniz's own backdating and altering of manuscripts muddied the record (see the History chapter *The Scientific Revolution*).

## China

Leibniz was perhaps the first major European intellectual to take a close interest in Chinese civilisation. He read *Confucius Sinarum Philosophus* (1687) in its first year, and praised Confucius for discovering universal natural laws through reason (see *Confucius, Mencius and Xunzi*). In the preface to his *Novissima Sinica* ("Latest News from China", 1697), a collection of missionary documents, he judged, in paraphrase, that Europe excelled in theoretical science but China in practical philosophy and government, and suggested that, given Europe's moral decline, Chinese missionaries might be sent to teach Europeans natural theology.

He had worked out binary arithmetic in 1679, and later sent it to the Jesuit Joachim Bouvet, who had taught the Kangxi Emperor mathematics. In a letter of 14 November 1701 Bouvet replied with a diagram of the 64 hexagrams of the *Yijing* (*Book of Changes*), recognising that they correspond to the binary numbers from 000000 to 111111. Leibniz's "Explication of Binary Arithmetic" (1703) claimed that the two of them had deciphered the ancient figures of Fuxi, whose meaning the Chinese had "lost". So the *Yijing* did not inspire binary; and the ordering Bouvet sent came from the Song scholar Shao Yong (1011–1077), who did not intend it mathematically.

The *Discourse on the Natural Theology of the Chinese* (1716), a letter to Nicolas-François Rémond unfinished at his death, answered the Jesuit Niccolò Longobardi and the Franciscan Antonio de Santa María Caballero, who opposed the Jesuit policy of accommodating Chinese rites. Against Longobardi, Leibniz argued that *li* (理, "principle" or "pattern"), a key term of Zhu Xi's Neo-Confucianism, amounts to the supreme substance Christians worship as God, so that ancient Chinese thought contained a natural theology. Accurate reading or projection? Zhu Xi's *li* is not a personal creator (see *Chinese Buddhism and the Rise of Neo-Confucianism*), and Malebranche read it as material and atheistic.

```checkpoint
q: What did Leibniz argue about the Chinese concept li in his Discourse on the Natural Theology of the Chinese?
a: That li was a material force, showing that Chinese thought was atheistic.
x: That was closer to Malebranche's reading; Leibniz argued the opposite.
a*: That li amounts to the supreme substance Christians worship as God, so ancient Chinese thought contained a natural theology.
a: That li was a binary code hidden in the Yijing.
x: The binary connection concerned the hexagrams, not li, and binary came first in any case.
a: That li was merely a rule of conduct, so Chinese thought had no theology.
x: Leibniz argued the opposite: that li showed ancient Chinese thought contained a natural theology.
hint: He was defending the Jesuits' policy of accommodation against Longobardi.
why: Leibniz read Zhu Xi's li as equivalent to God, supporting accommodation; whether this was accurate is still debated, since Zhu Xi's li is not a personal creator.
---
q: In the Clarke correspondence, how did Leibniz use the principle of sufficient reason against absolute space?
a: He argued that space must be infinite because God is infinite.
x: That was nearer Clarke's view, identifying space with God's immensity.
a: He argued that bodies could not move in empty space.
x: The argument was not about motion through a void but about God's reasons for placing the world.
a: He argued that space is God's sensorium.
x: Leibniz objected to this Newtonian description; it was not his view.
a*: God could have no reason to place the world in one position in absolute space rather than another, and a will without a motive is a fiction.
hint: Imagine the whole universe shifted three metres to the left.
why: If space were absolute, God would face a choice without any reason to decide it, which the PSR forbids; with the identity of indiscernibles, this supports relationalism.
```

## Legacy

In the eighteenth century his thought reached German universities chiefly through Wolff, whose "Leibnizian-Wolffian philosophy", a label seized on by Pietist opponents, dominated them, though Wolff gave little place to monads and said his philosophy "begins only where Leibniz's ends". Kant, who called Wolff "the greatest of all dogmatic philosophers", adopted Leibniz's definition of necessary truths as "analytic", reducible to identities, but denied that arithmetic is analytic; the SEP reports that most jurors have since sided with Leibniz's classification (see *Kant*).

Verdicts have been mixed. Voltaire scoffed: "Can you really believe that a drop of urine is an infinity of monads ...?" Russell called the *Monadology* "a kind of fantastic fairy tale, coherent perhaps, but wholly arbitrary". Yet Frege said Leibniz threw out "such a profusion of seeds of ideas" that he was "virtually in a class of his own". The principle of sufficient reason, the identity of indiscernibles, possible worlds, the mill and relational space all remain live questions, and the argument between his rationalism and the empiricists runs on through *Berkeley and Hume*.

## Further exploration

- **Maria Rosa Antognazza, *Leibniz: An Intellectual Biography* (2009).** The standard biography.
- **Nicholas Jolley, *Leibniz* (2005).** A good general introduction to the whole system.
- **Robert Merrihew Adams, *Leibniz: Determinist, Theist, Idealist* (1994).** One of the most influential and rigorous studies of his metaphysics.
- **Daniel Garber, *Leibniz: Body, Substance, Monad* (2009).** How his metaphysics developed over his career.
- **Franklin Perkins, *Leibniz and China: A Commerce of Light* (2004).** The standard study of his engagement with China.
- **Daniel J. Cook and Henry Rosemont Jr. (eds. and trans.), *Leibniz: Writings on China* (1994).** The *Novissima Sinica* preface, the *Discourse on the Natural Theology of the Chinese* and related texts.
- **Lloyd Strickland (ed.), *Leibniz and the Two Sophies: The Philosophical Correspondence* (2011).** His letters with Electress Sophie and Sophie Charlotte.$leibniz_master$,
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
  select $leibniz_quiz$[
    {"type": "mcq", "prompt": "Where and when did Leibniz meet Spinoza, according to this chapter?", "options": ["At The Hague, on 18–21 November 1676, about three months before Spinoza's death", "In Paris in 1672, during Leibniz's diplomatic mission", "In London in 1673, at the Royal Society", "In Hanover in 1680, after Spinoza had moved there"], "answerIndex": 0, "explanation": "On his way to Hanover Leibniz met Spinoza at The Hague on 18–21 November 1676. By Leibniz's notes they discussed the unpublished Ethics, Cartesian physics and Leibniz's improved ontological argument.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Leibniz answer Arnauld's worry that complete individual concepts make all our actions necessary?", "options": ["He admitted that all our actions are necessary and that freedom is an illusion", "He distinguished necessary truths, reducible to identities in finitely many steps, from contingent truths, which need an infinite analysis and are certain but not necessary", "He gave up the claim that the predicate is contained in the subject", "He argued that God does not know our future actions"], "answerIndex": 1, "explanation": "Contingent truths require an analysis 'to infinity through reasons for reasons' that only God grasps; Caesar's crossing of the Rubicon is 'contingent, even though it is certain', because the alternative is possible in itself. Freedom is spontaneity plus choice of the apparent best.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the correct relation between Leibniz's binary arithmetic and the Yijing (Book of Changes)?", "options": ["The Yijing's hexagrams inspired Leibniz to invent binary", "Leibniz learned binary from Bouvet, who had found it in Chinese texts", "Leibniz worked out binary in 1679; in 1701 Bouvet sent him a hexagram diagram matching it, an ordering derived from Shao Yong", "Leibniz never connected binary with China"], "answerIndex": 2, "explanation": "Binary came first (1679). Bouvet's letter of 14 November 1701 showed the 64 hexagrams corresponding to binary 000000–111111, and Leibniz published the parallel in 1703. The ordering came from the Song scholar Shao Yong, who did not intend it mathematically.", "id": "q3"},
    {"type": "mcq", "prompt": "In the Leibniz–Clarke correspondence, what did Leibniz hold about space?", "options": ["That space is God's sensorium, the organ by which God perceives", "That space is absolute, existing prior to bodies and identical with God's immensity", "That space is infinitely divisible matter", "That space is merely relative: an order of coexistences, as time is an order of successions"], "answerIndex": 3, "explanation": "Leibniz defended relationalism ('an order of coexistences'), using the principle of sufficient reason and the identity of indiscernibles against Clarke's absolute space; the 'sensorium' description and absolute space were the Newtonian side.", "id": "q4"},
    {"type": "open", "prompt": "Set out Leibniz's argument that this is the best of all possible worlds. Then state the objection from evil as Bayle and Voltaire pressed it, and give Leibniz's best replies.", "rubric": "A strong answer gives the steps: God is omnipotent, omniscient, benevolent and a free creator; there are other possible worlds; if this were not the best, God would have lacked power, knowledge or will, or not created, or had no alternatives; each contradicts the premises; so this is the best. It notes that 'best' means simplest in hypotheses and richest in phenomena, and that a world is the whole series. It distinguishes metaphysical, physical and moral evil. It states the objection (Bayle's challenge to reconciling faith and reason; the Lisbon earthquake of 1755 and Voltaire's Candide, where Pangloss's 'all is for the best' is Voltaire's phrase, not Leibniz's) and the replies: everything is connected; evils contribute to the whole (acid, shadows, dissonance); we see only a small part; good is unbounded, evil limited; Leibniz never claimed each thing is good in itself. Credit mention of Adams's objection that there may be no best world, or of moral versus metaphysical necessity.", "id": "q5"},
    {"type": "open", "prompt": "Explain Leibniz's mill argument (Monadology §17) and how it supports his theory of monads. What is the main objection to it, and what can be said in reply?", "rubric": "A strong answer describes the thought experiment (a thinking machine enlarged so we can walk inside, finding only parts pushing one another) and reconstructs the argument: materialism says matter can give rise to perception; perception represents a variety in a true unity, an 'I'; what is not a true unity cannot perceive; whatever is divisible is not a true unity; matter is infinitely divisible; so perception belongs to simple substances, monads, which have perception and appetition and 'no windows'. The objection: the premises about unity and divisibility rest on Leibniz's own views of perception and matter, which a materialist denies, and scholars disagree about how to read it. The reply: Leibniz grounds the unity of perception in our consciousness of the 'I', and the point that mechanical description leaves out perceiving survives as today's hard problem of consciousness and the question whether machines could think.", "id": "q6"}
  ]$leibniz_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/leibniz', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
