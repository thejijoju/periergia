-- Reason, Experience and Innate Ideas — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/reason-and-experience @ research/advanced/read.
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
    'philosophy/epistemology/reason-and-experience',
    'research',
    'advanced',
    'read',
    $reason_master$> **Where does knowledge come from: from the senses, from reason, or from what we are born with?** This chapter sets out the three distinctions philosophers use to pose the question (a priori and a posteriori, analytic and synthetic, necessary and contingent) and shows with examples how they come apart. It reconstructs Plato's slave-boy argument for innate knowledge, asks what really divided the so-called rationalists and empiricists, and follows the question into mathematics, Quine's attack on the a priori and its modern defence, Chomsky's argument from the poverty of the stimulus, and the infant studies of today. Along the way it compares the answers given in classical India, in Mencius and Wang Yangming, and in Avicenna.

## Three Questions in One

You know that all bachelors are unmarried, and you know that grass is green, but you know them in different ways. To learn the second, someone had to look at grass; to learn the first, you needed only to understand the words. Knowledge of the first kind is **a priori**: justified independently of experience, by "pure thought or reason". Knowledge of the second kind is **a posteriori**: it needs observation by the senses, or by introspection. "Independently" needs care, since you had to learn the word "bachelor" from experience. So the usual definition, in the Stanford Encyclopedia of Philosophy's words, is independence of all experience "beyond what is needed to grasp the relevant concepts"; Kant's stricter formula, it suggests, may be "too stringent".

Paired examples make the contrast vivid: "Green is a color" against "Grass is green"; "2 + 2 = 4" against "2 quarts of any liquid added to 2 more quarts make 4 quarts". The last pair holds a trap: the second claim is false, since water and carbon tetrachloride mixed do not make four quarts.

Two other distinctions are easily confused with this one. The **analytic/synthetic** distinction concerns what makes a sentence true. Kant called a judgement analytic when its predicate is "(covertly) contained" in its subject ("All bodies are extended") and synthetic when the predicate "lies entirely outside" it ("All bodies are heavy"); the idea had precursors in Leibniz, and in Locke and Hume's talk of "relations of ideas". The **necessary/contingent** distinction is metaphysical: a necessary truth is true in every possible world, a contingent one in some but not others. Three questions, then: how we know a truth, what makes it true, and whether it could have been otherwise.

Empiricists especially often treated the three as one, using analyticity to explain both necessity and knowledge without looking. They come apart. "If something is red all over, it is not green all over" seems knowable by reflection, yet not being green is no part of the definition of red: a **synthetic a priori** truth, if it is one. Conversely, "a cube has six sides" is analytic, but someone who believes it on a reliable person's say-so knows it a posteriori.

## The Slave Boy: the First Argument for Innate Knowledge

The question starts with Plato's *Meno*, probably written about 385 BCE. Meno poses what Socrates calls a "debater's" (eristic) argument: we cannot inquire into what we know, since we know it already, nor into what we do not know, since we would not recognise it if we found it. Socrates answers, citing priests and priestesses and poets such as Pindar, that the soul is immortal and learned everything in former lives, so that "there is no teaching but recollection". Then he tests the claim on a slave boy who has never studied geometry.

Socrates draws a square with sides of two feet (area four) and asks for the side of a square of double the area. The boy guesses four feet, which gives sixteen, then three, which gives nine, and is at a loss; this "numbed" state, Socrates says, has done him good. Socrates then builds a four-by-four square from four small ones and draws their diagonals, and the boy sees that the square on the diagonal has an area of eight. He has not been taught, Socrates claims; he has recollected. The *Plato* chapter gives the episode in brief; the argument behind it can be reconstructed like this:

1. The boy was never taught geometry.
2. Asked only questions, he produced a true geometrical answer, and a necessary one.
3. What is produced without being taught must already be in the learner.
4. So the knowledge, or at least the true belief, was already in him.
5. He did not acquire it in this life.
6. So he acquired it before this life: learning is recollection.

**Objection.** Premise 2 is doubtful. Socrates "clearly asks 'leading questions,' and eventually even shows the slave the answer in the form of a question", as the Internet Encyclopedia of Philosophy notes. The lesson shows that there are states between full knowledge and pure ignorance, which defeats Meno's paradox, but it "clearly does not demonstrate the reminding of something that was learned in a previous life", and it never says how the soul learned geometry the first time. The Stanford article on innateness concludes that the demonstration "has remained famous as a pedagogical tour de force, but not as a compelling defense for the doctrine of recollection".

**Reply.** Plato himself retreats to something more defensible. After the lesson Socrates says the boy's mind is "always in a state of having learned" and the truth about reality "always in our minds". That turns recollection into the beginnings of a theory of innate ideas, which the Internet Encyclopedia calls "even roughly compatible with modern science". Read this way, the *Meno* gave the debate two lasting things: the form of the **poverty of the stimulus** argument (the learner ends up knowing more than the input could supply) and the focus on mathematics. The Stanford article calls Plato the "ur-Nativist", and Noam Chomsky later named the general puzzle of how we know so much from so little experience, with language learning its central case, "Plato's problem".

## Rationalists and Empiricists: a Label with a History

Textbooks long told early modern philosophy as a contest: Continental Rationalists (Descartes, Spinoza, Leibniz) against British Empiricists (Locke, Berkeley, Hume). The scheme names a real question, but its credentials are poor.

What was actually in dispute? Peter Markie and M. Folescu distinguish three theses, each relative to a subject. **Intuition/Deduction**: some truths are known by intuition alone, others by deduction from them. **Innate Knowledge**: we know some truths "as part of our nature". **Innate Concept**: some of our concepts are part of our rational nature. The **Empiricism** thesis: "We have no source of knowledge in S or for the concepts we use in S other than experience." The surprise is that most empiricists also accepted intuition and deduction, restricted to relations among our own ideas; Locke used them for God's existence, mathematics and morality. So the real dividing line is innate knowledge and innate concepts. And since the theses are relative to a subject, one can be a rationalist about mathematics and an empiricist about physics.

Nor do the groupings fit the people. Descartes had "empiricist leanings" in natural philosophy; Berkeley was more critical of Locke than of Descartes; Leibniz found much in Berkeley "close to my own view". There is "no clear way", Markie and Folescu write, of grouping Hobbes with either camp, "let alone Elizabeth of Bohemia, Anne Conway, George Berkeley, Émilie du Châtelet, or Mary Shepherd". Unless restricted to the debate over innate knowledge, they conclude, "this distinction is best left unused". The Internet Encyclopedia calls the labels "analysts', and not actors', categories": none of these thinkers used them of themselves.

Who invented them is itself disputed. The Stanford article says the distinction was "initially applied by Kant". The Internet Encyclopedia cites evidence that the contrast as we know it was invented in the 1850s by the German historian Kuno Fischer. Vanzo (2016) tells a longer story: Kant helped introduce it, Reinhold and then Tennemann built histories on it, and it became standard in English-speaking philosophy only around 1895–1915, through no single author. Louis Loeb and David Fate Norton both attacked the scheme head on in 1981.

Older thinkers fit no better. Aristotle rejected Plato's nativism, holding that forms reach the mind in perception, and the "Peripatetic axiom" later drawn from his work (nothing is in the intellect which was not first in the senses) was shared by Aquinas, Hobbes, Locke and Amo; yet to put him at the head of an empiricist line would, the Stanford article warns, "obscure too many differences".

## Innate Ideas: Descartes, Leibniz and Locke's Challenge

Descartes sorted his ideas in the Third Meditation: "Among my ideas, some appear to be innate, some to be adventitious, and others to have been invented by me." His understanding of what a thing, truth and thought are "seems to derive simply from my own nature". Scholars count the ideas of God, mind and body as innate; writing to Elisabeth of Bohemia in 1643 he added the union of mind and body. The idea of God, he argued, is not adventitious, since no one has sense experience of God, and not invented, since it represents an actual infinity while the mind can fabricate only a potential one; so it is innate. That did not mean a baby contemplates God. An innate idea is not "always there before us", he told Hobbes: "we have within ourselves the faculty of summoning up the idea". Later, against Regius (1648), he compared innate ideas to the way gout runs in a family.

Leibniz's argument is the one rationalists still find strongest. Following Markie and Folescu:

1. We know some mathematical truths.
2. What we know in mathematics, we know to be necessarily true.
3. Experience cannot warrant beliefs about what is necessarily the case.
4. So experience cannot be the source of this knowledge; the best explanation is intuition and deduction, or innateness.

```quote
"the senses never give anything but instances, that is to say particular or individual truths"
Leibniz · New Essays on Human Understanding, Preface (trans. Morris and Parkinson) · finished 1704
```

However many triangles you measure, you learn only that these triangles have the property, never that every triangle must. Markie and Folescu judge the argument weak for contested metaphysics, but for mathematics and some moral truths it "clearly has legs". His image of the mind as veined marble is described in *Leibniz* and *Locke*.

Locke's attack, set out in *Locke*, turns on a dilemma. If "innate" means consciously known from birth, children plainly lack such knowledge: "No proposition can be said to be in the mind, which it never yet knew, which it never yet was conscious of." If it means a mere capacity to come to know, all knowledge is innate and the claim becomes "an improper way of speaking". Carruthers (1992) takes the second horn: innate knowledge is "innately determined to make its appearance at some stage in childhood" by evolution. But innate and learned beliefs are both triggered by experience, so the nativist still owes a principled difference between them; for Markie and Folescu, Locke's criticism "still stands, in the face of the best rationalist defense".

The empiricist owes something too: an account of how concepts are built from experience. Locke held that simple ideas arrive passively and complex ones are assembled from them. But Hume himself gave a counterexample, the **missing shade of blue**: someone who has seen every shade but one can imagine the missing shade. And Carruthers notes that shades of red share no common feature from which "red" could be abstracted, so abstraction seems to presuppose the concept it was meant to produce.

## Where Does Mathematics Come From?

Mathematics is the test case. The classic empiricist response is Hume's fork (see *Berkeley and Hume*): every object of inquiry concerns either "Relations of Ideas" or "Matters of Fact".

```quote
"Though there never were a circle or triangle in nature, the truths demonstrated by Euclid would forever retain their certainty and evidence."
David Hume · An Enquiry Concerning Human Understanding 4.1 · 1748
```

Mathematics is known by intuition and deduction, then, but only as knowledge of how our ideas relate, not of the world. Kant disagreed. "7 + 5 = 12", he argued at *Critique of Pure Reason* B15–16, is not analytic: analyse the concept of the sum of 7 and 5 as long as you please and you will never find twelve in it. It is synthetic yet a priori, and *Kant* explains his answer to how that is possible: space and time are forms we contribute to experience.

Later answers pulled in opposite directions. In *A System of Logic* (1843) John Stuart Mill held that every step of arithmetical calculation involves a real induction, an inference of facts from facts: we learn that 2 + 1 = 3 by generalising from pebbles and horses. He accepted that there may be no necessary truths at all. Frege mocked this as "gingerbread and pebble" arithmetic. His **logicism** made arithmetic analytic: trace any proof back far enough and you reach only logical laws and definitions. So for Frege, 7 + 5 = 12 is analytic after all (see *Frege, Russell and the Birth of Analytic Philosophy*). The logical positivists drew the moral: "There can be no a priori knowledge of reality," wrote A. J. Ayer, because truths of pure reason hold only "in virtue of their lack of factual content" (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*). The objection, pressed by Laurence BonJour among others, is that no definition makes taller-than transitive or rules out red and green all over, and that seeing that 7 + 5 = 12 does not, as the Internet Encyclopedia of Philosophy summarises him, amount to grasping the definitions of the terms. Something like rational insight seems needed anyway.

Platonists such as Gödel hold that numbers exist outside space and time and are grasped by a fallible "mathematical intuition". Paul Benacerraf's "Mathematical Truth" (1973) posed the classic dilemma: an account that treats "2 + 3 = 5" as being about objects, like the rest of language, leaves it "unintelligible how we can have any mathematical knowledge whatsoever"; one that treats truth as provability from axioms makes knowledge easy but cannot show why provability is truth. Hartry Field (1989) restated the worry without the causal theory of knowledge it first assumed: explain how mathematicians' beliefs could be reliable. The same challenge faces rational intuition generally: "That the number three is prime does not appear to cause anything," Markie and Folescu note, "let alone our intuition that it is prime."

```checkpoint
q: According to Markie and Folescu, what most clearly separates rationalists from empiricists?
a*: Whether we have innate knowledge or innate concepts
a: Rationalists accept intuition and deduction, empiricists reject them
x: Most empiricists also accepted intuition and deduction, restricted to relations among ideas; Locke used them for mathematics and morality.
a: Whether they lived on the Continent or in Britain
x: The geographical labels are a later historians' scheme that fits the individual thinkers poorly.
a: Whether they believed in God
x: Thinkers on both sides argued for God's existence; this was not the dividing line.
hint: Look at which of the three theses an empiricist could share.
why: To be a rationalist in their sense is to accept at least one of the innate theses; the Empiricism thesis denies any source of knowledge or concepts other than experience.
---
q: What is the strongest objection to Socrates' claim that the slave boy "recollected" geometry?
a: The boy got the answer wrong
x: He guessed wrongly at first but in the end saw that the square on the diagonal has double the area.
a: Geometry cannot be known at all
x: No one in the dialogue doubts that geometry can be known; the question is how.
a*: Socrates asked leading questions and in effect showed the boy the answer
a: Plato never wrote the passage
x: The geometry lesson is a central and well-attested part of the Meno.
hint: Think about premise 2 of the reconstruction.
why: If the answer was fed to the boy, his success does not show the knowledge was already in him, still less that he learned it in a former life.
```

## Is Anything Known A Priori?

The positivist settlement rested on the analytic/synthetic distinction, and in 1951 W. V. O. Quine's "Two Dogmas of Empiricism" denied that it had ever been drawn. *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine* sets out his argument: every attempt to explain analyticity, by synonymy, definition or semantic rules, presupposes analyticity or a notion in the same circle. In its place Quine put **holism**: "Our statements about the external world face the tribunal of sense experience not individually, but only as a corporate body", and "no statement is immune to revision", logic included. The apparent a priori he explained away. Arithmetic sits at the centre of our beliefs; giving it up would mean giving up nearly everything, so it looks necessary, and no single experience confirms 2 + 2 = 4, so it looks a priori. But it rests, like everything else, on experience as a whole.

Grice and Strawson (1956) replied that people agree in classifying indefinitely many new cases, such as "A fortnight is a period of fourteen days", so the distinction is unlikely to have no basis. Georges Rey adds that Quine "offers no argument" for extending holism to mathematics, and that there have been "virtually no revisions of mathematics on empirical grounds". Even Einstein's use of non-Euclidean geometry is, in Rey's view, misread: the geometries were conceptual developments, and only their application to physical space was empirical. Quine later conceded a modest analyticity ("Bachelors are unmarried", but not mathematics), recognising the notion "in its obvious and useful but epistemologically insignificant applications".

Saul Kripke pulled the distinctions apart from another side (see *Analytic Philosophy since 1950*). "Hesperus is Phosphorus" was discovered by observing the sky, yet since both names rigidly pick out Venus in every possible world, it is necessary: the **necessary a posteriori**, widely accepted for such identities and extended by many, not all, to "water is H2O". His **contingent a priori** has fared worse. Whoever fixes "one metre" as the length of a stick in Paris at a given time knows without investigation that it is a metre long then, though it might have been longer. Donnellan, Plantinga, Salmon and others deny that such cases are genuinely contingent or genuinely a priori.

The leading modern defence of the a priori is BonJour's *In Defense of Pure Reason* (1998). A **rational insight** is "an immediate, non-inferential grasp, apprehension, or 'seeing' that some proposition is necessarily true". What justifies is the *apparent* insight, which can be wrong and corrected by further reflection: hence "moderate" rationalism. His case against radical empiricism can be reconstructed like this:

1. We are justified in some beliefs that go beyond anything we have observed: predictions, generalisations, mathematics.
2. Such justification requires an inference whose acceptability is not itself observed.
3. If no inference can be justified a priori, none of these beliefs is justified.
4. So unless we accept scepticism, some justification is a priori.

**Objection.** What can an intuition be checked against, except other intuitions? Cummins (1998) argued that intuitions, unlike instruments, cannot be calibrated; checking them against each other is, in the Stanford Encyclopedia's image, like checking a crystal ball against itself, and naturalists such as Devitt deny any a priori knowledge. **Reply.** Perception and memory, too, can be checked only against more perception and memory, yet they justify (Goldman, 2007); critics answer that the different senses at least check each other. Most defenders now agree that a priori justification is fallible: the sorites paradoxes (see *Paradoxes: the Liar, the Heap and Zeno*) show we can be justified a priori in each of a set of premises that cannot all be true.

## Nativism Returns: Chomsky and the Poverty of the Stimulus

Locke's case largely prevailed, the *Locke* chapter notes, until Chomsky revived nativism. His 1959 review of B. F. Skinner's *Verbal Behavior* is regarded as a founding document of cognitive psychology, and he called his view a "rationalist conception of the nature of language". His central argument, in Gabe Dupre's schema:

1. Children acquire some piece of linguistic knowledge, T.
2. Children are exposed to a limited body of linguistic data.
3. Children have general-purpose learning mechanisms.
4. T cannot be acquired from those data by those mechanisms.
5. So some factors relevant to acquiring T are innate.

The classic example is the English question. "The man is tall" becomes "Is the man tall?" A child might learn "move the first *is* to the front". Applied to "The man who is tall is in the room", that rule gives "Is the man who tall is in the room?", which no one says. The right rule moves the *main* auxiliary, and can be stated only over the sentence's structure, not its word order. Children never seem to try the wrong rule, yet, the argument goes, they rarely if ever hear the sentences that would tell them which is right; so the bias towards structure is innate. (A further step is needed to show that it is specific to language.)

**Objection.** Pullum and Scholz (2002) replied that the poverty of the stimulus must be shown empirically, and found decisive sentences, such as "Where's the other dolly that was in here?", in speech addressed to children. **Reply.** Legate and Yang (2002) counted such sentences at about 0.05 per cent of the data: a child might never meet them, and a learner who could learn from so few would also learn from noise. Lasnik and Lidz (2016) added that hearing that the main auxiliary *can* move does not show that the other *cannot*. Large language models, which learn grammar without language-specific biases, are read by some as disproving strong nativism; but the largest recent models train on tens of trillions of tokens of text, while children hear perhaps two to seven million words a year.

Is Chomsky a rationalist in the old sense? Markie and Folescu doubt it: his learners know no propositions about universal grammar, so he offers "a theory of innate learning capacities or structures rather than a theory of innate knowledge". Cottingham (1984) found it "by no means clear" that this follows the traditional rationalist account; such capacity-nativism, Markie and Folescu add, is "akin to an empiricist take", since Locke too thought we are born with faculties. Jerry Fodor went further, arguing that virtually all word-sized concepts must be innate; "few if any" followed him, and in 2008 he decided that concepts are neither learned nor innate but acquired by "merely biological" processes.

The newest evidence comes from infants. In one classic experiment (Baillargeon, Spelke and Wasserman, 1985), five-month-olds looked longer when a rotating screen seemed to pass through the space occupied by a block hidden behind it, which is read as an expectation that objects persist: a poverty-of-the-stimulus argument for an innate concept of object. Elizabeth Spelke's *What Babies Know* (2022) proposes six "core knowledge" systems, among them object, number and agent, and Susan Carey argues that innate core cognition and learning combine. These are interpretations of looking times, not settled findings, and Locke's old objection returns: one acquisition mechanism is simpler than two.

```checkpoint
q: What does Chomsky's question-formation example ("Is the man who is tall in the room?") aim to show?
a: That children learn grammar by imitating whole sentences they have heard
x: The point is that children use a rule they could not easily have picked up from what they hear.
a*: That children are biased towards rules stated over sentence structure, a bias they could not get from the data they hear
a: That English has no rules for forming questions
x: The example compares two candidate rules and shows that one of them is right.
a: That large language models cannot learn English
x: The example is from the 1970s; language models are a later twist in the debate.
hint: Which rule moves the main auxiliary rather than the first one?
why: Only the structure-dependent rule gets the sentence right; if children rarely hear the decisive sentences, the poverty-of-the-stimulus argument says the bias must be innate.
---
q: Why do some philosophers doubt that Chomsky is a rationalist in the traditional sense?
a: Because he denies that anything about language is innate
x: Chomsky is the leading modern nativist about language.
a: Because he rejects Plato and Descartes as influences
x: He explicitly claims them as ancestors and calls his view rationalist.
a: Because Quine refuted the poverty of the stimulus
x: Quine's "Two Dogmas" concerned the analytic/synthetic distinction, not language acquisition.
a*: Because his theory posits innate capacities rather than innate knowledge of propositions
hint: Locke also thought we are born with faculties.
why: Markie and Folescu, citing Cottingham, argue that Chomsky's learners do not know propositions about universal grammar, which makes his view closer to Locke's inborn faculties than to Descartes' innate ideas.
```

## Other Traditions, Other Questions

Classical Indian philosophers organised the subject differently, asking not "reason or experience?" but which **pramāṇas**, or sources of knowledge, there are (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*). The Cārvāka accepted perception alone. Nyāya recognised four sources, perception, inference, comparison and testimony, and denied innate ideas outright: concepts are "the records of previous experiences", and the mind's power to classify is "not innate". Yogācāra Buddhists, by contrast, posited a collective "storehouse consciousness" (*ālaya-vijñāna*; see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*). The Buddhist logicians Dignāga and Dharmakīrti allowed only perception, of real particulars, and inference, which works with universals that thought constructs. Mīmāṃsā gave a further answer: the authorless Veda is a source of knowledge that is neither reasoning nor ordinary experience, a reminder that "reason or experience" is not an exhaustive choice.

In China the question was asked of moral knowledge. Mencius held that all humans have innate but incipient "sprouts" of benevolence, righteousness, wisdom and propriety: "Among babes in arms there are none that do not know to love their parents" (*Mengzi* 7A15, in Tiwald and Van Norden's edition). Wang Yangming made this "pure knowing" (*liangzhi*), also translated "innate knowledge", the centre of his philosophy. Xunzi replied that "Human *xing* is evil; what is good is artifice": goodness is acquired through ritual and teachers. Scholars dispute whether the two really disagree or define *xing*, "what is so by birth", differently. The shape echoes Locke against Leibniz, but the sprouts are tendencies to feel and act, not Cartesian innate ideas (see *Confucius, Mencius and Xunzi* and *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata*).

Avicenna fits no label. He described the intellect at birth as "rather like a tabula rasa", furnished by abstraction from the senses; yet his "flying man", created in mid-air with no sensation, would still affirm his own existence, one item of self-knowledge independent of the senses (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*).

## Where Things Stand

Few philosophers now put the question as "reason *or* experience". Many defend a fallible a priori; most accept that we are born with some structure, but argue over whether it is knowledge, concepts, or only capacities to learn. The live questions are particular: the grammar of questions, an infant's expectation that a hidden block is still there, the reliability of our beliefs about numbers. The other sources of knowledge are explored in *Perception and the External World* and *Testimony, Trust and Social Epistemology*.

## Further exploration

- **Laurence BonJour, *In Defense of Pure Reason* (1998).** The main modern defence of a fallible rational insight as the source of a priori justification.
- **Louis E. Loeb, *From Descartes to Hume* (1981).** The classic attack on the story of rationalists against empiricists.
- **Fiona Cowie, *What's Within? Nativism Reconsidered* (1999).** A philosopher's critical examination of Chomsky's and Fodor's nativism.
- **Susan Carey, *The Origin of Concepts* (2009).** How innate core cognition and learning combine to produce new concepts.
- **Elizabeth S. Spelke, *What Babies Know, Volume 1: Core Knowledge and Composition* (2022).** The core-knowledge programme from its leading researcher.
- **Stephen H. Phillips, *Epistemology in Classical India* (2012).** The Nyāya school's four sources of knowledge, from the *Nyāya-sūtra* to Gaṅgeśa.$reason_master$,
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
  select $reason_quiz$[
    {"type": "mcq", "prompt": "Which of these is the standard example of a truth that is analytic but known a posteriori?", "options": ["Believing \"a cube has six sides\" on a reliable person's testimony", "\"If something is red all over, it is not green all over\"", "\"Hesperus is Phosphorus\"", "\"7 + 5 = 12\" as Kant understood it"], "answerIndex": 0, "explanation": "The sentence about cubes is analytic, but someone who believes it on a reliable person's say-so knows it through experience. The red/green case is a candidate synthetic a priori truth, Hesperus/Phosphorus is Kripke's necessary a posteriori, and Kant held 7 + 5 = 12 to be synthetic a priori.", "id": "q1"},
    {"type": "mcq", "prompt": "Where do sources say the label \"rationalists versus empiricists\" came from?", "options": ["Descartes and Locke used the terms of themselves", "It was coined by Thomas Reid", "It is a later historians' scheme; sources disagree whether to credit Kant and his followers or Kuno Fischer in the 1850s, and Vanzo says it became standard in English only around 1895–1915", "It was introduced by the logical positivists"], "answerIndex": 2, "explanation": "None of the thinkers used the terms of themselves. The Stanford Encyclopedia says Kant first applied the distinction; the Internet Encyclopedia cites evidence that Kuno Fischer invented the contrast in the 1850s; Vanzo traces it through Kant, Reinhold and Tennemann to standard English use around 1895–1915.", "id": "q2"},
    {"type": "mcq", "prompt": "What was Frege's view of arithmetic, against both Kant and Mill?", "options": ["It is an inductive generalisation from pebbles and horses", "It is analytic: its proofs rest only on general logical laws and definitions", "It is synthetic a priori, grounded in the form of time", "It is a free invention with no truth value"], "answerIndex": 1, "explanation": "Frege's logicism made arithmetic analytic, so 7 + 5 = 12 is analytic for him though synthetic a priori for Kant. He mocked Mill's empiricism as \"gingerbread and pebble\" arithmetic, and kept geometry synthetic a priori.", "id": "q3"},
    {"type": "mcq", "prompt": "What did classical Nyāya say about innate ideas?", "options": ["Every concept is innate in the self", "Innate ideas are stored in a collective storehouse consciousness", "Only the idea of God is innate", "There are none: concepts are records of previous experiences"], "answerIndex": 3, "explanation": "The Nyāya realists denied innate ideas: the mind's classifying power is the product of experience. The storehouse consciousness (ālaya-vijñāna) belongs to the rival Yogācāra Buddhists.", "id": "q4"},
    {"type": "open", "prompt": "Set out Leibniz's argument from necessary truths step by step. Which premise would an empiricist like Mill reject, and what would a moderate empiricist like Ayer say instead?", "rubric": "A good answer gives the premises: we know some mathematical truths; we know them to be necessary; experience gives only instances and cannot warrant necessity; so experience is not the source (intuition, deduction or innateness is). It notes that Mill rejects the second premise, treating arithmetic as inductive generalisation and accepting that there may be no necessary truths, while Ayer accepts a priori knowledge but says it is analytic and empty of factual content. Strong answers mention the objection (from BonJour and others) that analytic accounts do not cover all a priori claims and that seeing 7 + 5 = 12 is not just grasping definitions.", "id": "q5"},
    {"type": "open", "prompt": "Present the poverty-of-the-stimulus argument using the example of English question formation. What is the strongest empirical objection, and how have nativists replied?", "rubric": "A good answer sets out the schema (children acquire T; they get limited data; they have general learning mechanisms; T cannot be learned from those data by those mechanisms; so something is innate) and the example: only the rule that moves the main auxiliary, stated over structure, gives \"Is the man who is tall in the room?\". It gives Pullum and Scholz's objection that the poverty must be shown empirically, with decisive sentences found in child-directed speech, and the replies of Legate and Yang (such sentences are about 0.05 per cent of the data) and Lasnik and Lidz (positive evidence shows what can move, not what cannot). Strong answers note that a further step is needed to show the innate factor is language-specific, mention the question whether Chomsky's nativism concerns capacities rather than knowledge, or discuss language models with the data-quantity caveat.", "id": "q6"}
  ]$reason_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/reason-and-experience', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
