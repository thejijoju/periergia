-- Descartes — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/early-modern/descartes @ research/advanced/read.
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
    'philosophy/history-of-philosophy/early-modern/descartes',
    'research',
    'advanced',
    'read',
    $descartes_master$> **The philosopher who tried to rebuild knowledge from a single certainty, and the princess who asked him the question he could not answer.** This chapter follows René Descartes (1596–1650) through his method of doubt, the "I am, I exist" of the *Meditations* and the debate over whether it is an inference, his two proofs of God and the charge that he argued in a circle, and his argument that mind and body are distinct substances, with Antoine Arnauld's objection and Descartes' reply. It then turns to Elisabeth of Bohemia's question of how an unextended mind can move a body, his physics of matter in motion, and the objections and replies printed with the *Meditations*.

## A Soldier, a Dream and a Project

Descartes was born on 31 March 1596 at La Haye in Touraine, a town since renamed Descartes. He studied at the new Jesuit college of La Flèche, first the classics and then three years of Aristotelian philosophy with mathematics, and left, he wrote, "beset by so many doubts and errors" that his education had brought him only "increasing recognition of my ignorance". After a law degree he became a gentleman soldier. In 1619 winter caught him at Ulm or Neuburg in southern Germany, and on the night of 10 November he had three dreams that seemed to give him a mission: to reform all knowledge, beginning with philosophy.

From the end of 1628 he lived in the Dutch Republic, changing address often under the motto "who lives well hidden, lives well". His *Discourse on the Method* (1637), *Meditations on First Philosophy* (1641) and *Principles of Philosophy* (1644) shared one aim: to replace the scholastic philosophy he had been taught, the Aristotelian tradition traced in *Thomas Aquinas* and *Scotus, Ockham and the Late Medieval Debates*. On that view knowledge comes "from or through the senses", and nature is explained by **substantial forms**, inner principles that make a falling stone behave, in Descartes' words, "as if it had some knowledge of the centre". He wanted a philosophy grounded instead in ideas grasped by pure intellect, and a physics of mere matter in motion. In the preface to the French *Principles* he drew the plan:

```quote
"Thus the whole of philosophy is like a tree. The roots are metaphysics, the trunk is physics, and the branches emerging from the trunk are all the other sciences, which may be reduced to three principal ones, namely medicine, mechanics and morals."
Descartes · Principles of Philosophy, Preface to the French edition (trans. Cottingham, Stoothoff and Murdoch) · 1647
```

Quotations of Descartes here follow that translation by Cottingham, Stoothoff and Murdoch.

## Doubting Everything, Once

The *Meditations* open with a resolution to "demolish everything completely and start again right from the foundations". Descartes need not show that his beliefs are false: "it will be enough if I find in each of them at least some reason for doubt." The doubt runs in three stages, each wider than the last.

First, **the senses**. They sometimes deceive us, as with distant objects, and "it is not prudent to trust" what has deceived us even once. But that leaves beliefs such as "I am here, sitting by the fire, wearing a winter dressing-gown".

Second, **dreaming**. "How often, asleep at night, am I convinced of just such familiar events … when in fact I am lying undressed in bed!" There are "never any sure signs by means of which being awake can be distinguished from being asleep." Yet arithmetic and geometry survive: "whether I am awake or asleep, two and three added together are five".

Third, **the deceiver**. If an all-powerful God made him, how does he know he does not go wrong "every time I add two and three"? And if his origin were something less than God, error would be more likely, not less. So he supposes "not God, who is supremely good and the source of truth, but rather some malicious demon of the utmost power and cunning has employed all his energies in order to deceive me." Now "there is not one of my former beliefs about which a doubt may not properly be raised."

The doubt was for theory, not life: "no sane person has ever seriously doubted" that there is a world, and the exercise was to be undertaken once in a lifetime. The *Discourse*, written in French for a wide audience, "including women", had left out the most radical arguments. What was the doubt for? Popkin and Curley held that Descartes took scepticism seriously as a threat; Gary Hatfield reads the doubt as a tool to "withdraw the mind from the senses", in the genre of spiritual exercises. Christia Mercer has proposed that the meditative path follows Teresa of Ávila's *Interior Castle*, though the evidence is circumstantial and disputed. Pierre Gassendi asked why a "simple and brief statement" that old beliefs are uncertain would not do; Descartes replied, "Is it really so easy to free ourselves from all the errors which we have soaked up since our infancy?" Peirce (*American Pragmatism: Peirce, James and Dewey*) later answered: "Let us not pretend to doubt in philosophy what we do not doubt in our hearts." *Scepticism and the Answers to It* weighs the dream argument itself.

## "I Am, I Exist"

The Second Meditation finds what the doubt cannot touch. If a deceiver is deceiving him, "I too undoubtedly exist, if he is deceiving me; and let him deceive me as much as he can, he will never bring it about that I am nothing so long as I think that I am something."

```quote
"I must finally conclude that this proposition, I am, I exist, is necessarily true whenever it is put forward by me or conceived in my mind."
Descartes · Meditations on First Philosophy II (trans. Cottingham, Stoothoff and Murdoch) · 1641
```

The formula *cogito, ergo sum*, "I think, therefore I am", is not in the *Meditations*. It appeared first in French in the *Discourse* ("I am thinking, therefore I exist", in the translators' rendering), and in Latin in the *Principles* and the Second Replies. The certainty is first-person ("Descartes thinks" is not certain for me) and present-tense, and any kind of thinking will do, doubting or "seeming to see", but not a bodily act: "I walk" fails, while "it seems I am walking" works. What the "I" is remains open; for now it is only "a thing that doubts, understands, affirms, denies, is willing, is unwilling, and also imagines and has sense perceptions."

Is the cogito an inference? Descartes said that whoever says "I am thinking, therefore I am" "does not deduce existence from thought by means of a syllogism, but recognizes it as something self-evident by a simple intuition of the mind." (A **syllogism** is a formal argument from two premises: everything that thinks exists; I think; so I exist.) Hintikka argued in 1962 that the cogito is a performance: "I do not exist" is not a contradiction, but it is "existentially incoherent" to think it. Margaret Wilson replied that rejecting a syllogism is not rejecting every inference. A deeper objection, pressed by Lichtenberg and Russell and earlier in a version by Gassendi, is that Descartes was entitled only to "there are thoughts", not to an "I". The reply is that experience comes as someone's, and that is itself part of what is given.

Descartes was not the first to answer doubt this way. *Augustine and Early Christian Philosophy* describes Augustine's "if I am mistaken, I exist", which Descartes said Augustine had used for a different purpose. *Falsafa: al-Kindī, al-Fārābī and Avicenna* describes Avicenna's "flying man", whose resemblance may be deep or trivial; no evidence shows that Descartes knew it. Al-Ghazālī's account of his own doubt is often compared too (*Al-Ghazālī, Averroes and the Quarrel over Reason*), though any link is circumstantial.

The Meditation ends with a piece of wax. Put by the fire, its taste, smell, colour and shape all change; yet it is the same wax. What persists is extension, being spread out in space, grasped by "purely mental scrutiny", not by the senses. So the mind is better known than the body.

## Clear and Distinct Ideas, and God

From the cogito Descartes draws a rule: "whatever I perceive very clearly and distinctly is true." A perception is **clear** when it is present and accessible to the attentive mind, **distinct** when it is also sharply separated from everything else.

But a deceiver could still corrupt even clear perceptions, so Descartes must prove that a God exists who is no deceiver, since "all fraud and deception depend on some defect". The Third Meditation's proof is known as the **trademark argument**, because the idea of God is like "the mark of the craftsman stamped on his work". It uses a scholastic distinction: an idea's **objective reality** is what it represents; **formal reality** is the reality a thing actually has.

1. I have an idea of God, an infinite and supremely perfect substance.
2. "There must be at least as much reality in the efficient and total cause as in the effect of that cause": something cannot come from nothing.
3. So whatever an idea contains objectively must be in its cause formally (actually) or "eminently" (in a higher form).
4. I am finite. I could cause my ideas of finite things, but not the objective reality of an infinite substance.
5. So my idea of God must be caused by something actually infinite: God exists.

Objectors attacked both ends: some denied that we have any clear idea of an infinite being; others, that we could have got the idea of God without God causing it.

The Fifth Meditation adds the **ontological argument**, from the concept of God alone. I clearly and distinctly perceive God as supremely perfect; existence is a perfection; so existence belongs to God's essence, as having angles equal to two right angles belongs to a triangle's; so God exists. God without existence is like "a mountain without a valley". *Early Scholasticism: Anselm, Abelard and the Universities* tells of Anselm's earlier proof; Descartes said he did not know Anselm's version. The first objector, the Dutch priest Johannes Caterus, replied that even if the concept of a supremely perfect being implies existence, "it still does not follow that the existence in question is anything actual in the real world; all that follows is that the concept of existence is inseparably linked to the concept of a supreme being." His parody was an "existing lion". Descartes answered that only true and immutable natures, clearly and distinctly perceived, license such an inference, not concepts we invent. *Kant* and *God: Arguments For and Against* take the debate further.

## The Cartesian Circle

Antoine Arnauld, a young theologian at the Sorbonne, saw a problem in the whole structure: "how the author avoids reasoning in a circle when he says that we are sure that what we clearly and distinctly perceive is true only because God exists. But we can be sure that God exists only because we clearly and distinctly perceive this."

Descartes replied that the divine guarantee is needed for *remembered* conclusions, not for what we perceive clearly here and now. How to read this is a long debate. On the memory reading, God guarantees our memory of past clear perceptions; Bernard Williams thought the real trouble was not circularity but that "the proofs of God are invalid". Frankfurt argued that Descartes shows only that reason does not undermine itself, not that it matches a mind-independent world. Lex Newman notes that scholarship "generally resists the vicious circularity interpretation", though it is widely taught. As Thomas Lennon put it, "it would be nothing less than astonishing if the central argument of the central text of the central figure of the central period in the history of philosophy were obviously circular."

```checkpoint
q: Why does the dreaming argument leave arithmetic and geometry standing, so that Descartes needs a further stage of doubt?
a*: Because "two and three added together are five" whether I am awake or asleep, so only a deceiver who corrupts my reasoning could threaten it.
a: Because Descartes thought mathematics was learned through the senses.
x: The opposite: he held that such truths are grasped by the intellect, which is why doubts about the senses do not reach them.
a: Because dreams never contain numbers or shapes.
x: Descartes made no such claim; his point is that such truths hold in dreams as well as waking.
a: Because Descartes believed God guaranteed mathematics from the start.
x: At this stage he raises the possibility that God, or a demon, makes him go wrong even in adding two and three.
hint: Ask whether a sum done in a dream is wrong.
why: Mathematical truths hold awake or asleep, so the dream doubt cannot touch them; only a deceiver who makes me err every time I add can.
---
q: What was Arnauld's "Cartesian Circle" objection?
a: That the cogito presupposes a self it has not proved.
x: That objection, that Descartes was entitled only to "there are thoughts", is associated with Lichtenberg, Russell and Gassendi.
a: That we have no clear idea of an infinite being.
x: Some objectors raised this against the trademark argument, but it is not the circle.
a*: That Descartes trusts clear and distinct perception because God exists, but proves God exists by clear and distinct perception.
a: That existence is not a real predicate.
x: That is Kant's later reply to the ontological argument.
hint: Look for the same claim at both ends of the reasoning.
why: Arnauld asked how Descartes could be sure God exists before he could be sure that whatever he clearly and distinctly perceives is true.
```

## Mind and Body: the Real Distinction

The *Discourse* had argued that because Descartes could pretend he had no body but not that he did not exist, he was "a substance whose whole essence or nature is simply to think". Hatfield calls this fallacious: one can doubt that Bruce Wayne is Batman without their being two people. The *Meditations* argue instead from clear and distinct perception of essences, for a **real distinction**: two substances, each able to exist without the other, at least by God's power.

1. "I know that everything which I clearly and distinctly understand is capable of being created by God so as to correspond exactly with my understanding of it."
2. "Hence the fact that I can clearly and distinctly understand one thing apart from another is enough to make me certain that the two things are distinct, since they are capable of being separated, at least by God."
3. "On the one hand I have a clear and distinct idea of myself, in so far as I am simply a thinking, non-extended thing; and on the other hand I have a distinct idea of body, in so far as this is simply an extended, non-thinking thing."
4. "And accordingly, it is certain that I am really distinct from my body, and can exist without it."

Arnauld's objection was the strongest. Someone may clearly understand that a triangle in a semicircle is right-angled yet doubt that the square on its longest side equals the squares on the other two. By Descartes' reasoning, he could conclude that Pythagoras' property is no part of the triangle's essence, which is false. "But how is my perception of the nature of my mind any clearer than his perception of the nature of a triangle?"

Descartes replied that we can understand the triangle *without noticing* the Pythagorean property, but cannot clearly and distinctly understand it as *lacking* the property; mind and body, by contrast, we clearly perceive each as complete *without* the other. As Van Cleve puts it, perceiving A without perceiving B differs from perceiving A without B. Arnauld in the end accepted the real distinction. But Justin Skirry judges that Descartes "has not adequately eliminated the possibility of minds being extended things like brains", and the move from what is conceivable to what is possible remains central to *The Mind–Body Problem*.

Nor did Descartes leave the mind floating free. "I am not merely present in my body as a sailor is present in a ship," he wrote, but "very closely joined and, as it were, intermingled with it, so that I and the body form a unit." How two such different things could form one was the question Elisabeth asked.

## Elisabeth's Question

Elisabeth, Princess Palatine (1618–1680), was the eldest daughter of Frederick V, the Elector Palatine who was briefly King of Bohemia, and grew up in exile in The Hague. In 1643 she began, on her own initiative, a correspondence that lasted until Descartes' death; her letters are almost all of her philosophy that survives. (Her words here are in Lisa Shapiro's translation, as quoted in secondary sources.)

In her first letter, dated 6 May 1643, she asked him to "tell me please how the soul of a human being (it being only a thinking substance) can determine the bodily spirits and so bring about voluntary actions". Her reasoning: every determination of motion comes from impulsion, which needs contact, or from the shape of the mover's surface, which needs extension, and Descartes' soul has neither. As Shapiro notes, she asked specifically about mind acting on body, and she shared Descartes' mechanical view of causation.

On 21 May Descartes answered with **primitive notions**, basic concepts not built from others. For body "we have only the notion of extension", for the soul "only the notion of thought", and for the two together "only the notion of their union, on which depends our notion of the soul's power to move the body". He compared the union to the scholastic notion of heaviness acting on a body. On 20 June Elisabeth replied that she could not see how a soul "nonextended and immaterial" moves the body on the model of heaviness, which Descartes himself had shown unintelligible: "it would be easier for me to concede matter and extension to the mind than it would be for me to concede the capacity to move a body and be moved by one to an immaterial thing." Jaegwon Kim cites this as the first causal argument for physicalism, the view that the mind is physical.

On 28 June Descartes went further. The union "is known only obscurely by the intellect alone … but it is known very clearly by the senses"; to conceive soul and body as both distinct and united is "to conceive them as a single thing and at the same time to conceive them as two things; and this is absurd." Hatfield's verdict is that he admitted he did not have a good answer. Elisabeth replied that the senses show that soul and body interact, but not how. Shapiro calls his replies "evasive".

Elisabeth was a philosopher in her own right. She pointed to cases where the body's condition affects thought, suggesting that the mind might be extended, and questioned whether a thinking thing whose capacity to think depends on the body is a substance properly speaking. Shapiro reads her as open to revising dualism without clearly advocating an alternative; Janssen-Lauret as holding a "naturalistic dualism", with a soul both conscious and extended. She solved a geometry problem Descartes set her, criticised his physics in the *Principles*, which was dedicated to her, and in 1645 asked him to "define the passions, in order to know them better"; *The Passions of the Soul* was written at her request. *Women Philosophers of the Early Modern Era* treats her work in full.

## The Pineal Gland and the Caricature

Descartes did name a meeting point. In 1640 he called the pineal gland "the principal seat of the soul, and the place in which all our thoughts are formed", since he could find no other part of the brain that is not double. Later anatomists contradicted his account of the gland, and Spinoza mocked the theory in his *Ethics*. Yet Gert-Jan Lokhorst, in a Stanford Encyclopedia entry now available only in its archive, judged it "doubtful whether Descartes was a Cartesian interactionist himself"; in the *Principles* Descartes declined to inquire into "any power to move bodies which may be possessed by human minds".

What, then, was his view? Some read the soul as the body's substantial form in scholastic fashion, a minority position that Marleen Rozemond opposes. John Cottingham's **trialism** takes extension, thought and union as three basic categories. Others keep the picture of two interacting substances. Hatfield warns against the straw man of a disembodied, over-rational Descartes: he held that sensation and imagination need the brain, and explained much behaviour mechanically. When people fall and throw out their hands, "it is not reason that instructs them to do this", but a reflex, "just as it would be produced in a machine." Animals were such machines. His followers took him to deny that animals feel anything; Cottingham and Hatfield argue that he denied them thought, not all sensation, and the question remains disputed.

## A World of Matter in Motion

The trunk of the tree was physics. Matter's essence is extension, and space is not distinct from matter, so there is no void: if God removed all the matter from a vessel, its sides would touch. The *Principles* gives three laws of nature: a thing stays in the same state, so a moving thing keeps moving; movement is of itself in straight lines; and in collisions motion is kept or transferred. The first two were later taken into Newton's first law. The universe is full, so matter moves in **vortices**, whirlpools that carry the planets round the sun. The theory let him say that the earth, at rest in its vortex, "properly speaking, is not moved", a caution with a cause: he had suppressed his treatise *The World*, which defended Copernicus' system, on learning of Galileo's condemnation in 1633. Vortex physics stayed influential until Newton's physics of forces replaced it, as *The Scientific Revolution* describes.

His science belonged to a wider story. He was the first to publish the sine law of refraction, but Ibn Sahl in the tenth century, Thomas Harriot and Willebrord Snell had found it earlier. His *Geometry* (1637) applied algebra to geometry; Fermat found coordinate methods independently.

```checkpoint
q: What was Descartes' reply to Arnauld's triangle objection?
a: That mind and body are not really distinct after all.
x: Descartes held to the real distinction; it was Arnauld who in the end accepted it.
a*: That we can understand the triangle without noticing the property, but not as lacking it, whereas we clearly perceive mind and body each without the other.
a: That the Pythagorean property is not part of a triangle's essence.
x: Descartes agreed it is part of the essence; his point was that we cannot clearly understand the triangle as lacking it.
a: That God guarantees whatever we remember perceiving clearly.
x: That is his reply to the Cartesian Circle, not to the triangle.
hint: Distinguish perceiving A without perceiving B from perceiving A without B.
why: The argument needs a clear perception of each thing as complete without the other, which Descartes claimed for mind and body but not for the triangle and its property.
---
q: What did Elisabeth of Bohemia ask in her first letter to Descartes in 1643?
a: Whether animals have souls.
x: Her question concerned the human soul and the body it moves.
a: Whether God exists.
x: She did not challenge the proofs of God; she pressed a problem inside his account of mind and body.
a: Why Descartes had suppressed The World.
x: The World is unrelated to her letter, which concerned mind–body causation.
a*: How a soul that is only a thinking substance can move the body, since moving something seems to need contact or extension.
hint: Think about what moving something requires on a mechanical view.
why: She asked how the soul "can determine the bodily spirits", arguing that all motion comes by impulsion or by the mover's shape, which need contact and extension, neither of which the soul has.
```

## Objections, Replies and Afterlives

The *Meditations* appeared in Latin in Paris in 1641 together with objections and Descartes' replies, a book built as a debate. The second edition (1642) had seven sets: from Caterus; from theologians and philosophers gathered by Marin Mersenne; from Thomas Hobbes, discussed in *Hobbes*; from Arnauld, whose set Descartes thought "the best of all"; from Gassendi; a further miscellany gathered by Mersenne; and from the Jesuit Pierre Bourdin.

{{image: Meditations on First Philosophy | The title page of Descartes' Meditations, first published in Latin in Paris in 1641 with the objections and replies.}}

In 1649 Descartes accepted Queen Christina of Sweden's invitation to Stockholm, where he died on 11 February 1650. He is usually said to have died of pneumonia; a theory that he was poisoned with arsenic has little support. In 1663 his works were placed on the Index of Prohibited Books.

His followers taught his physics in the Netherlands, France, England and parts of Germany. Some, Malebranche the most famous, became **occasionalists**, holding that God is the only true cause; to treat that view merely as a patch for the interaction problem is, Sukjae Lee writes, "a caricature at best", for it had deeper roots, including in Islamic thought. *Spinoza* and *Leibniz* give rival answers to Elisabeth's problem. Poulain de la Barre used dualism to argue that "the mind has no sex", and Mary Astell used Cartesian philosophy to argue for women's education. The turn to the knowing mind runs on through *Locke*, *Berkeley and Hume* and *Kant*. Most philosophers today accept neither Descartes' method nor his dualism. But, as Hatfield concludes, "a problem that Descartes made prominent has lived far beyond his proposed solution."

## Further exploration

- **Lisa Shapiro (ed. and trans.), *The Correspondence between Princess Elisabeth of Bohemia and René Descartes* (2007).** The complete correspondence in English, with an introduction.
- **Sabrina Ebbersmeyer and Sarah Hutton (eds.), *Elisabeth of Bohemia (1618–1680): A Philosopher in her Historical Context* (2021).** Recent essays on Elisabeth's own philosophy.
- **Desmond M. Clarke, *Descartes: A Biography* (2006).** A modern life of Descartes.
- **Stephen Gaukroger, *Descartes: An Intellectual Biography* (1995).** Descartes' life and thought together.
- **Bernard Williams, *Descartes: The Project of Pure Enquiry* (1978).** A classic philosophical study.
- **Janet Broughton, *Descartes's Method of Doubt* (2002).** A close study of how and why Descartes doubts.
- **Gary Hatfield, *Descartes' Meditations* (2014 edition).** A guidebook to the *Meditations* by the author of the Stanford Encyclopedia entry.$descartes_master$,
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
  select $descartes_quiz$[
    {"type": "mcq", "prompt": "Where does Descartes' formula 'cogito, ergo sum' ('I think, therefore I am') actually appear?", "options": ["In the Second Meditation, as the conclusion of the argument against the deceiver", "Only in the posthumous writings of his followers", "In Augustine's City of God, from which Descartes copied it", "In the Discourse on the Method (in French), the Principles of Philosophy and the Second Replies, but not in the Meditations"], "answerIndex": 3, "explanation": "The Meditations say instead that 'this proposition, I am, I exist, is necessarily true whenever it is put forward by me or conceived in my mind'. The formula appears in French in the Discourse (1637) and in Latin in the Principles (1644) and the Second Replies.", "id": "q1"},
    {"type": "mcq", "prompt": "In the trademark argument of the Third Meditation, why can Descartes not himself be the cause of his idea of God?", "options": ["Because a cause must contain at least as much reality as its effect, and a finite mind cannot account for the objective reality of an idea of an infinite substance", "Because the idea of God is learned through the senses", "Because he has already proved that the external world exists", "Because existence is a perfection, so God must exist"], "answerIndex": 0, "explanation": "The causal adequacy principle says there must be at least as much reality in the cause as in the effect. Applied to ideas, what an idea represents must exist actually or eminently in its cause, and a finite thing cannot supply what an idea of an infinite being represents. The perfection argument belongs to the Fifth Meditation's ontological proof.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Caterus object to Descartes' ontological argument in the First Objections?", "options": ["That we have no idea of God at all", "That the argument is circular because it relies on clear and distinct perception", "That even if the concept of a supremely perfect being implies existence, it follows only that the concepts are linked, not that such a being actually exists", "That a triangle's angles need not equal two right angles"], "answerIndex": 2, "explanation": "Caterus argued that all that follows is that 'the concept of existence is inseparably linked to the concept of a supreme being', and offered the parody of an 'existing lion'. Descartes replied that only true and immutable natures, clearly and distinctly perceived, license the inference.", "id": "q3"},
    {"type": "mcq", "prompt": "How did Descartes answer Elisabeth of Bohemia's question about how the soul moves the body, in his letters of May and June 1643?", "options": ["He said the soul is extended and moves the body by contact", "He appealed to primitive notions, treating the union of soul and body as a basic notion known clearly by the senses, though only obscurely by the intellect", "He said God alone moves the body on the occasion of the soul's will", "He withdrew his claim that soul and body are distinct"], "answerIndex": 1, "explanation": "Descartes said we have three primitive notions, extension for body, thought for soul, and their union for the two together, on which the soul's power to move the body depends. In June he admitted that conceiving soul and body as both two and one seems absurd. Occasionalism was developed by some of his followers, such as Malebranche.", "id": "q4"},
    {"type": "open", "prompt": "Set out Descartes' Sixth Meditation argument for the real distinction of mind and body step by step, give Arnauld's objection, and assess Descartes' reply.", "rubric": "A strong answer gives the four steps: whatever I clearly and distinctly understand can be created by God as I understand it; so if I can clearly and distinctly understand one thing apart from another, they can be separated at least by God and are distinct; I have a clear and distinct idea of myself as a thinking, non-extended thing and of body as an extended, non-thinking thing; so I am really distinct from my body and can exist without it. It explains that a real distinction is between substances each able to exist without the other. It gives Arnauld's triangle objection: someone may clearly perceive that a triangle in a semicircle is right-angled yet doubt the Pythagorean property, which nonetheless belongs to its essence, so why is my perception of my mind any clearer? It gives Descartes' reply that we can understand the triangle without noticing the property but not as lacking it, whereas mind and body are each perceived as complete without the other (Van Cleve: perceiving A without perceiving B versus perceiving A without B). Good answers note that Arnauld came to accept the distinction, but that critics such as Skirry think Descartes has not ruled out minds being extended things like brains, and that the step from conceivability to possibility is still debated.", "id": "q5"},
    {"type": "open", "prompt": "Explain Elisabeth of Bohemia's objection to Descartes' account of how mind and body interact, Descartes' replies, and why she is regarded as a philosopher in her own right.", "rubric": "A strong answer explains her first letter (6 May 1643): how can a soul that is only a thinking substance determine the bodily spirits, given that all motion comes from impulsion (needing contact) or the shape of the mover (needing extension), which the soul lacks; it notes that she asked about mind acting on body and shared Descartes' mechanical view of causation. It gives Descartes' reply of 21 May (three primitive notions: extension, thought and their union, with the comparison to heaviness), her answer of 20 June that it would be easier to concede matter and extension to the mind than to let an immaterial thing move a body (cited by Kim as the first causal argument for physicalism), and his letter of 28 June that the union is known clearly by the senses but only obscurely by the intellect, and that conceiving soul and body as both one and two is absurd. It may note Shapiro's verdict that his replies are evasive and Hatfield's that he lacked a good answer. On her own philosophy it notes her appeal to bodily influences on thought, her doubt whether a thinking thing is properly a substance, the readings of Shapiro (open to revising dualism) and Janssen-Lauret (naturalistic dualism), and her work on geometry, physics and the passions, which led to The Passions of the Soul.", "id": "q6"}
  ]$descartes_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/early-modern/descartes', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
