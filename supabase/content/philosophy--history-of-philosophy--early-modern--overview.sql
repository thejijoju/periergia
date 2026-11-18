-- Renaissance and Early Modern Philosophy (c. 1450 – 1800) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern @ research/advanced/read.
-- This node is a chapter (it has child topics); the app renders this overview
-- article above the chapter's topic list (see the section-overview branch in
-- src/app/learn/[subject]/[...node]/page.tsx).
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
    'philosophy/history-of-philosophy/early-modern',
    'research',
    'advanced',
    'read',
    $earlymodernoverview_master$> **Three and a half centuries in which philosophers rebuilt the foundations of knowledge, argued over what minds and bodies are, and asked what makes a state legitimate, while deciding, often badly, who counted.** From Ficino's Florence to Kant's Königsberg, and from Ming China to Safavid Iran, Tokugawa Japan and Ethiopia, this overview asks how far the familiar map of "rationalists" against "empiricists" fits the section's chapters; compares how the chapters' thinkers handled doubt, mind and body, God, the self, causation and the state; asks who was left out and who argued anyway; looks at the source problems the chapters share; and ends with a guide to the eleven chapters.

## A Map Drawn Afterwards

The usual story, as *Women Philosophers of the Early Modern Era* summarises it, is a short list of men: the "rationalists" Descartes, Spinoza and Leibniz against the "empiricists" Locke, Berkeley and Hume, "until Kant". It is a story told from its end. Kant held that knowledge has two sources, a receptive sensibility and an active understanding, and that "thoughts without content are empty, intuitions without concepts are blind"; read backwards, the century before him looks like two half-truths awaiting that synthesis. The chapters use its labels sparingly, because the evidence keeps spilling over its lines.

Hobbes derived all ideas from sensation, so that the Stanford Encyclopedia suggests one "might well speak of Hobbes, not Locke, as the first of the British empiricists"; yet he reduced reasoning to "reckoning", an idea Leibniz took up. Locke took his "way of ideas" from Descartes while rejecting Descartes' rationalism. Émilie du Châtelet gave Newton's physics metaphysical foundations drawn from Leibniz and Wolff. Even Kant's account of what woke him changed: in 1783 it was "the remembrance of David Hume", in a letter of 1798 "the antinomy of pure reason". Margaret Cavendish and Anne Conway fit neither column, and some historians now call for "rethinking the questions through which that history is structured".

Other labels are later too. "Humanism" came to name the new study of ancient languages only in the nineteenth century, and Aristotle never went away. "Early modern" is itself a European label, which the historian John Tucker applies to Japanese Confucianism deliberately. And the philosophers did not sit in separate camps: Hobbes wrote objections to Descartes' *Meditations*, Leibniz visited Spinoza in 1676, and Hume brought Rousseau to England in 1766.

## Doubt and the Search for Certainty

In 1562 Henri Estienne printed a Latin translation of Sextus Empiricus' *Outlines of Pyrrhonism*. Richard Popkin argued that this revival, meeting the Reformation's quarrel over the "rule of faith", produced a "crisis of doubt" that shaped early modern philosophy, a thesis that is influential and contested. Montaigne's "Apology for Raymond Sebond" argued that any criterion of truth runs in a circle, an instrument needing a demonstration and the demonstration an instrument; whether he was a sincere fideist or arguing from his opponents' premises is debated.

Descartes resolved to doubt everything once: the senses, then waking life, then, supposing a malicious demon, even arithmetic, until "I am, I exist" was left standing. Whether he feared scepticism or used doubt as a tool to "withdraw the mind from the senses", as Gary Hatfield reads it, is debated. Arnauld asked how Descartes could escape a circle in proving God by the clear perceptions that only God guarantees. A century later Hume argued that neither demonstrative nor probable argument supports the principle that the future will resemble the past, and that custom, not reason, carries us forward; he recommended a "mitigated" scepticism, since the extreme kind is unliveable. Thomas Reid answered that first principles of common sense need no proof. Kant answered that some judgments are synthetic yet a priori, informative and necessary at once, because the mind supplies the forms that any experience must take.

## Mind, Body and Matter

Elisabeth of Bohemia's first letter to Descartes, dated 6 May 1643, asked how a soul that is "only a thinking substance" could move a body, when moving something seems to need contact or extension and the Cartesian soul has neither. Descartes replied that their union is a "primitive notion", known clearly by the senses but obscurely by the intellect, and admitted that conceiving them as both one and two "is absurd". Read together, the chapters show how the period answered her:

1. **Descartes.** Mind and body are really distinct, since each can be clearly and distinctly understood as complete without the other; yet the mind is not merely present in the body "as a sailor is present in a ship", but forms "a unit" with it. Even here the record is mixed: Gert-Jan Lokhorst judged it "doubtful whether Descartes was a Cartesian interactionist himself".
2. **Hobbes.** There is no immaterial substance to explain: "incorporeal substance" is a contradiction, and thought is matter in motion.
3. **Spinoza.** Mind and body do not interact and need not. "The order and connection of ideas is the same as the order and connection of things", because a body and the idea of it are one thing expressed under two attributes, thought and extension.
4. **Leibniz.** No created substance truly acts on another. God built each so that soul and body agree like two perfectly made clocks, a pre-established harmony; Malebranche's occasionalism, with God the only true cause, would make God perform a "perpetual miracle".
5. **Cavendish and Conway.** Matter is not dead. For Cavendish all matter is self-moving and perceptive, so minds are material; for Conway, body and spirit are two modes of one created substance, differing only in degree. Anton Wilhelm Amo's Wittenberg dissertation of 1734 likewise placed sensation in the living body, not the immaterial mind.
6. **Conclusion.** Set side by side, the chapters suggest that Elisabeth's question was seldom answered by explaining how interaction works; most of these answers deny one of its premises, either that mind and body are two substances or that substances act on one another at all.

**The objection** is that this only moves the problem. Leibniz's mill argument holds that however closely we inspect a thinking machine we find "only parts pushing one another, and never anything by which to explain a perception", which seems to tell against Hobbes's materialism and Cavendish's alike. **The reply** differs by case. Cavendish's matter is not Hobbes's dead stuff pushed about, for perception belongs to it from the start; and a materialist, as the *Leibniz* chapter notes, can simply deny the premise that perceiving needs an indivisible subject. *The Mind–Body Problem* takes the argument on.

```checkpoint
q: What did Elisabeth of Bohemia ask Descartes in her first letter of 1643?
a*: How a soul that is only a thinking substance can move a body, when moving something seems to need contact or extension.
a: Whether animals have souls.
x: Her question concerned the human soul and the body it moves, not animals.
a: Whether the proofs of God in the Meditations were circular.
x: The circle objection was Arnauld's, printed with the Meditations.
a: Why Descartes had suppressed The World.
x: He suppressed The World after Galileo's condemnation; her letter concerned mind–body causation.
hint: Think about what moving something requires on a mechanical view.
why: She argued that all motion comes by impulsion or by the mover's shape, which need contact and extension, and Descartes' soul has neither.
---
q: How does Spinoza's answer to the mind–body problem differ from Leibniz's?
a: Spinoza holds that God moves the body on the occasion of each act of will; Leibniz holds that the mind is material.
x: The first is Malebranche's occasionalism, which Leibniz rejected; and Leibniz held that perception belongs to simple, mind-like substances.
a: Both hold that the soul acts on the body at a single point in the brain.
x: Neither accepts interaction: Spinoza says mind and body need not interact, and Leibniz denies that created substances act on one another.
a*: For Spinoza mind and body are one thing expressed under two attributes; for Leibniz they are distinct substances that God made to agree without acting on each other.
a: Spinoza denies that bodies exist; Leibniz denies that minds exist.
x: Spinoza takes extension to be an attribute of God, and Leibniz makes mind-like monads the only true substances.
hint: Ask how many things each philosopher counts.
why: Spinoza's II P7 makes a body and its idea "one and the same thing, but expressed in two ways"; Leibniz's pre-established harmony keeps soul and body distinct, like two clocks built to keep time together.
```

## God, Nature and Necessity

Few of these philosophers left the received God alone. Spinoza wrote "God, or Nature", and the friends who prepared the Dutch *Ethics* left out "or Nature", probably for fear of the reaction; "Spinozist" was a slur for a century. Hobbes's God was a "corporeal spirit". Leibniz argued that a good, wise and powerful God must have created the best of all possible worlds; after the Lisbon earthquake of 1755 Voltaire's *Candide* mocked the claim, though Pangloss's lines are Voltaire's words, not Leibniz's. Hume's sceptic Philo argued that the design argument yields at most a finite, perhaps imperfect, designer. Kant held that the ontological, cosmological and design proofs all fail, but that practical reason "postulates" God and immortality: "I had to deny knowledge in order to make room for faith". Outside Europe the same centuries argued about God on their own terms: Mullā Ṣadrā's proof climbs a scale of existence to pure existence, and the *Hatata* argues from the impossibility of an endless chain of parents to an uncreated creator.

## Selves and Causes

Locke made personal identity a matter of consciousness: "as far as this consciousness can be extended backwards to any past Action or Thought, so far reaches the Identity of that Person". Butler objected that this is circular, and Reid that it breaks the rule that identity is transitive. Hume found within only perceptions, a "bundle", then confessed in 1740 that he was lost in "a labyrinth". Kant answered that "The I think must be able to accompany all my representations", a unity of consciousness that experience presupposes. Mullā Ṣadrā, arguing that things change in their very substance, concluded that "the young Zayd is thus literally not the same existent as the old Zayd"; but his framework was Avicenna's essence and existence, not the way of ideas, so the resemblance is one of question, not of route.

Causation ran in parallel. Hume traced the idea of necessary connection to habit; Lady Mary Shepherd replied in 1824 that causal belief rests on perception and reason. For Cavendish, when a hand pushes a bowl nothing passes between them; the push is only the occasion for the bowl to move itself. Kant argued that the principle that every event has a cause holds necessarily for every possible experience.

## The State and Its Legitimacy

After Machiavelli's "effectual truth", the chapters ask what, beyond force, makes power legitimate. Hobbes imagined people "without a common power to keep them all in awe" and found a war "of every man, against every man"; each therefore authorises an absolute sovereign, keeping at least the right to defend his own life. Spinoza borrowed Hobbes's equation of right with power but called democracy "the most natural" form and held that no one can surrender the right to his own thoughts. Locke, who never names Hobbes, gave the state of nature a law of nature, derived property from labour, rested government on consent and allowed the people to remove rulers who try to enslave them. Rousseau replied that Hobbes had taken civilised people and removed the laws; inequality, he argued, is made by history, and only a general will that each citizen obeys as his own can make the chains legitimate. Kant carried the question between states in *Toward Perpetual Peace*. Mary Astell, a Tory, rejected Locke's right of resistance, and Adam Ferguson objected that people have always lived in society. *Authority and the State: the Social Contract and Its Critics* follows the argument forward.

## Who Counted

"It is striking", the Stanford Encyclopedia observes, "how unenlightened many of the Enlightenment's celebrated thinkers are concerning issues of race and of gender." Hobbes, in the Stanford Encyclopedia's words, "was one of the earliest western philosophers to count women as persons when devising a social contract", yet described civil families as fathers, servants and children. Locke made power over children parental, shared by mother and father, but gave the husband the final say. Spinoza's model democracy excluded women; Rousseau's citizens are all men; Kant made women "passive citizens" on supposedly "natural" grounds and wrote that a woman who disputes about mechanics might as well wear a beard.

Women answered, and their arguments have a lineage of their own: Marie de Gournay's *Equality of Men and Women* (1622), Poulain de la Barre's Cartesian claim that the intellect has no sex, Gabrielle Suchon's treatise on liberty, knowledge and authority, Sor Juana's *Reply to Sor Filotea*, and Astell, who turned Locke's language against him:

```quote
If all Men are born free, how is it that all Women are born slaves?
Mary Astell · Some Reflections upon Marriage, preface to the third edition · 1706
```

So Wollstonecraft's *Vindication of the Rights of Woman* (1792) is a landmark, but, as *Women Philosophers of the Early Modern Era* notes, not the first systematic case for women's equality.

On race, slavery and colonialism the record is entangled with the philosophy itself. Locke was secretary to the Carolina proprietors, whose *Fundamental Constitutions* gave every freeman "absolute power and authority over his negro slaves", though his authorship of that clause is contested. Berkeley bought at least three enslaved people in Rhode Island. Hume's footnote of 1753–54 suspected non-white peoples of natural inferiority, and Kant drew on it; whether Kant had "second thoughts" by 1795 (Kleingeld) or held "a consistent inegalitarian position" (Lu-Adler) is debated. Against them stood Diderot, Condorcet and Olympe de Gouges. Amo, from the Gold Coast, defended a disputation "On the Rights of Moors in Europe" in 1729, and the *Hatata* argues that a law allowing people to be bought like animals cannot come from a creator who made human beings equal. *Race, Colonialism and Philosophy* and *Feminist Philosophy* continue these debates.

## Other Conversations in the Same Centuries

Wang Yangming (1472–1529) lived at the same time as Machiavelli; Mullā Ṣadrā was a younger contemporary of Montaigne; the Tokugawa shoguns ruled Japan from 1603 to 1868; the *Hatata* dates itself to 1667/8. *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* stresses that none of these thinkers was reacting to Europe. Each pushed hard, with reasons, against the received reading of a long tradition. Wang turned Zhu Xi's "investigation of things" inward, arguing that "those who 'know' but do not act simply do not yet know". Ṣadrā reversed his teacher Mīr Dāmād's priority of essence and argued that existence is what is real. Tokugawa Confucians quarrelled over the classics, nativists tried to strip Chinese learning away, and only in 1790 did an edict enforce Zhu Xi teaching as orthodoxy.

The chapters resist easy pairings. Ṣadrā's definition of philosophy, as demonstration rather than "adherence to prior authority", is worth setting beside Descartes, the *Beyond Europe* chapter suggests, but his starting point was Avicenna's distinction of essence and existence, not doubt. Where the traditions did meet, the meeting was often a misreading. Leibniz argued that Zhu Xi's *li* amounts to the God of Christians, while Malebranche read it as a Spinoza-like atheism; Bouvet's diagram of the *Yijing* hexagrams matched binary numbers Leibniz had already worked out in 1679, so it did not inspire them. Bayle and Kant likened Spinoza to Buddhists and to Laozi, comparisons the *Spinoza* chapter calls parallels, not influences. Hume at La Flèche lived near a Jesuit who had been to Siam, so he *could* have heard of Buddhist ideas, but no document shows that he did.

```checkpoint
q: Why do the chapters treat the "rationalists versus empiricists" map with caution?
a: Because none of the six philosophers wrote about knowledge.
x: Knowledge was a central topic for all six; the problem is how they are sorted.
a*: Because many thinkers cross its lines or fall outside it: Hobbes derived all ideas from sensation yet treated reasoning as calculation, Locke took the "way of ideas" from Descartes, and Cavendish and Conway fit neither column.
a: Because Kant rejected both reason and experience as sources of knowledge.
x: Kant held that knowledge needs both sensibility and understanding.
a: Because the labels were invented in the twentieth century by historians of women's philosophy.
x: The chapters do not date the labels; historians of women's philosophy criticise the standard story, they did not invent it.
hint: Look for thinkers who belong in both columns, or in neither.
why: The scheme is a story told from Kant's end of the period, and the chapters show traffic between the camps and whole figures it leaves out.
---
q: What do the chapters conclude about who wrote the Hatata?
a: That Giusto d'Urbino's authorship was proved in 1920.
x: Wion describes Conti Rossini's case as a body of evidence rather than a decisive proof.
a: That all scholars now accept Zera Yacob's authorship.
x: Wion revived the case for Giusto in 2013, and Fasil Merawi himself doubts the texts' authenticity.
a: That the text was written in the twentieth century.
x: The only known manuscripts were sent to d'Abbadie in the early 1850s.
a*: That the question is unsettled, and the arguments deserve weighing on their merits whoever wrote them.
hint: Count the scholars on each side, and the dates of their work.
why: Sumner, Getatchew Haile and the 2023 translators argue for Ethiopian authorship; Conti Rossini, Mittwoch and Wion for Giusto; the 2024 volume surveys the debate.
```

## Sources, Labels and Translations

The chapters share a set of cautions. **Attribution** is often disputed: the *Hatata*'s authorship is unsettled; Locke's part in the Carolina slavery clause is contested. **Famous lines** are often not quite what was said. The formula *cogito, ergo sum* is not in the *Meditations*; Berkeley wrote "their esse is percipi", not *esse est percipi*; the *Essay* never uses *tabula rasa*; Kant never spoke of his "Copernican revolution"; and the line most often quoted as Voltaire's was written by Evelyn Beatrice Hall in 1906. **Titles and labels** came later: Pico never titled his *Oration*, and the "School of Isfahan" is a modern umbrella. **Translation** shapes meaning: *sapere aude* is "dare to know" or, in Gregor's gloss, "dare to be wise"; Wang's *liangzhi* is "pure knowing", "innate knowledge" or "conscience"; Conway's English original is lost. And **heroic stories** shrink: the charges against Bruno, the "martyr for science", were mostly theological.

## The Chapters

- *Renaissance Philosophy: Humanists, Platonists, Machiavelli and Montaigne*: Valla, Ficino, Pico, Pomponazzi, Machiavelli, Montaigne, Gournay and Bruno.
- *Descartes*: doubt, the cogito, God and the circle, the real distinction, Elisabeth's question, and the objections.
- *Hobbes*: materialism, reckoning, the state of nature, the sovereign, religion and women.
- *Spinoza*: the herem, one substance, necessity, two attributes, freedom, and the *Theological-Political Treatise*.
- *Leibniz*: sufficient reason, monads and the mill, harmony, the best world, Clarke, calculus and China.
- *Locke*: innate ideas, qualities, personal identity, property, consent, toleration and Carolina.
- *Berkeley and Hume*: idealism; induction, causation, the self, the passions, *is* and *ought*, religion; Shepherd; race.
- *The Enlightenment and Rousseau*: the *Encyclopédie*, Voltaire, Montesquieu, the Scots, Rousseau, the excluded and the first critics.
- *Women Philosophers of the Early Modern Era*: Elisabeth, Cavendish, Conway, Astell, du Châtelet, Wollstonecraft, and how to recover them.
- *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*: knowing and acting, the primacy of existence, Tokugawa orthodoxy and the *Hatata* debate.
- *Kant*: the synthetic a priori, the categories, the antinomies, the categorical imperative, beauty, peace, race and women.

The story continues in *The Nineteenth Century*.

## Further exploration

- **Brian P. Copenhaver and Charles B. Schmitt, *Renaissance Philosophy* (1992).** The standard one-volume survey.
- **Richard H. Popkin, *The History of Scepticism from Savonarola to Bayle* (2003).** The classic, and contested, account of the sceptical revival.
- **Jacqueline Broad, *Women Philosophers of the Seventeenth Century* (2002).** Elisabeth, Cavendish, Conway, Astell, Masham and others on mind and matter.
- **Karen Detlefsen and Lisa Shapiro (eds), *The Routledge Handbook of Women and Early Modern European Philosophy* (2023).** A broad survey, including the recovery debates.
- **Ritchie Robertson, *The Enlightenment: The Pursuit of Happiness, 1680–1790* (2020).** A large recent survey reading the Enlightenment as the pursuit of happiness in this world.
- **Emmanuel Chukwudi Eze (ed.), *Race and the Enlightenment: A Reader* (1997).** Primary texts on race by Enlightenment philosophers.
- **Ralph Lee, Mehari Worku and Wendy Laura Belcher (eds. and trans.), *The Hatata Inquiries* (2023).** A translation of both texts, arguing for their Ethiopian authorship.$earlymodernoverview_master$,
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
  select $earlymodernoverview_quiz$[
    {"type": "mcq", "prompt": "Which statement about the 'rationalists versus empiricists' scheme fits the chapters of this section?", "options": ["The six philosophers divided themselves into these two schools in their own writings", "It is a later story told from Kant's end of the period, and many thinkers cross its lines or fall outside it", "Hobbes was the founder of the rationalist school", "Kant held that knowledge comes from experience alone"], "answerIndex": 1, "explanation": "The usual story sets Descartes, Spinoza and Leibniz against Locke, Berkeley and Hume 'until Kant'. But Hobbes derived all ideas from sensation yet treated reasoning as reckoning, Locke took the 'way of ideas' from Descartes, du Châtelet joined Newton to Leibniz, and Cavendish and Conway fit neither column. Kant held that knowledge needs both sensibility and understanding.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Leibniz's pre-established harmony say about mind and body?", "options": ["Mind and body are one thing expressed under two attributes", "The mind is a kind of matter in motion", "God moves the body on each occasion that the soul wills", "No created substance truly acts on another; God made soul and body to agree, like two perfectly made clocks"], "answerIndex": 3, "explanation": "Leibniz held that each substance acts from its own depths in perfect conformity with others. The two-attributes view is Spinoza's, matter in motion is Hobbes's, and the occasionalism of Malebranche, which Leibniz rejected as a 'perpetual miracle', makes God the only true cause.", "id": "q2"},
    {"type": "mcq", "prompt": "Which of these famous lines is accurately attributed?", "options": ["'Their esse is percipi', written by Berkeley in the Principles of Human Knowledge", "'Cogito, ergo sum', in Descartes' Meditations", "'I disapprove of what you say, but I will defend to the death your right to say it', written by Voltaire", "'Copernican revolution', Kant's own name for his method"], "answerIndex": 0, "explanation": "Berkeley wrote the anglicised 'Their esse is percipi' (Principles §3). The cogito formula is not in the Meditations but in the Discourse, the Principles and the Second Replies; the Voltaire line was written by Evelyn Beatrice Hall in 1906; and Kant never used the phrase 'Copernican revolution'.", "id": "q3"},
    {"type": "mcq", "prompt": "Which thinker in this section argued that existence, not essence, is what is real, and that things change in their very substance?", "options": ["Wang Yangming", "Mullā Ṣadrā", "Hayashi Razan", "Zera Yacob"], "answerIndex": 1, "explanation": "Mullā Ṣadrā, against his teacher Mīr Dāmād, argued for the primacy of existence and for substantial motion. Wang Yangming taught the unity of knowing and acting; Hayashi Razan served the early Tokugawa shoguns; the Hatata attributed to Zera Yacob tests religious law by reason.", "id": "q4"},
    {"type": "open", "prompt": "Elisabeth of Bohemia asked Descartes how an unextended soul could move a body. Compare how at least three thinkers or pairs of thinkers in this section answered, or avoided, her question, and assess whether these answers solve the problem or only move it.", "rubric": "A strong answer states Elisabeth's question (motion needs contact or extension, which Descartes' soul lacks) and Descartes' reply (the union as a primitive notion known clearly by the senses, with his admission that conceiving soul and body as one and two is absurd). It compares at least three of: Hobbes (no incorporeal substance; thought is matter in motion); Spinoza (no interaction needed, since a body and its idea are one thing under two attributes, II P7); Leibniz (no created substance acts on another; pre-established harmony, against occasionalism's 'perpetual miracle'); Cavendish (all matter self-moving and perceptive, so minds are material); Conway (body and spirit modes of one substance differing in degree); Amo (sensation in the living body). It notes that most answers deny a premise rather than explaining interaction, and weighs the objection from Leibniz's mill (inspecting matter never reveals perception) against the replies that Cavendish's matter perceives from the start and that a materialist can deny that perceiving needs an indivisible subject. Credit noting Lokhorst's doubt that Descartes was a straightforward interactionist.", "id": "q5"},
    {"type": "open", "prompt": "Using at least two thinkers from Europe and one from beyond it, explain how this section's chapters handle the questions of who counted (women, race, slavery and colonialism) and of the reliability of their own sources.", "rubric": "A strong answer gives accurate cases: Hobbes counting women as persons in the contract yet describing civil families as fathers, servants and children; Locke's shared parental power but the husband's final say, and his role in the Carolina Fundamental Constitutions (authorship of the slavery clause contested); Spinoza's democracy excluding women; Rousseau's citizens all men; Kant's 'passive citizens', his race theory and the Kleingeld–Lu-Adler debate; Berkeley's purchase of enslaved people; Hume's footnote; women's replies from Gournay (1622) and Astell ('If all Men are born free…') to Wollstonecraft, not the first systematic case. From beyond Europe it may cite the Hatata's argument against a law allowing people to be bought like animals, or Amo's disputation on the rights of Moors. On sources it notes the open Hatata authorship debate (Conti Rossini, Wion; Sumner, Getatchew Haile, the 2023 translators), misattributed or reworded famous lines, later labels such as the 'School of Isfahan', and translation choices.", "id": "q6"}
  ]$earlymodernoverview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
