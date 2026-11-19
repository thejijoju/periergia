-- Perception and the External World — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/perception @ research/advanced/read.
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
    'philosophy/epistemology/perception',
    'research',
    'advanced',
    'read',
    $perception_master$> **When you look at a tree, is it the tree itself that you see?** This chapter sets out the problem of perception: how illusions and hallucinations seem to show that we never meet the world directly, only some go-between, such as an image, an idea or a "sense datum". It works step by step through the argument from illusion and the argument from hallucination, and the main answers to them: sense-datum theory, idealism and phenomenalism, adverbialism, intentionalism and disjunctivism. It traces the same questions through Ibn al-Haytham's optics, the Nyāya and Buddhist debates in India and Molyneux's question about a blind man given sight, and ends with what psychology adds and what all this means for perceptual knowledge.

## The Ordinary View and Its Troubles

Strawson once described an ordinary experience like this: "I see the red light of the setting sun filtering through the black and thickly clustered branches of the elms; I see the dappled deer grazing in groups on the vivid green grass…" It mentions no images or pictures in the mind, only the sun, the elms and the deer. Experience, Strawson wrote, "presents itself as, in Kantian phrase, an immediate consciousness of the existence of things outside us"; John McDowell called it "openness to the world".

Tim Crane and Craig French, in the Stanford Encyclopedia of Philosophy, break this ordinary conception into parts. Experiences are of **ordinary objects**, trees and deer that exist whether or not anyone perceives them, and they **present** those objects directly to the mind. Together these give **direct realism**: we can directly perceive ordinary objects. Most of us also assume a **common kind**: a genuine perception of a snowy churchyard and a perfect hallucination of one are, at bottom, the same kind of mental state.

Three terms recur. A perception is **veridical** when an object is perceived and appears as it is. In an **illusion** an object is perceived but appears other than it is, like a white wall that looks yellow in odd lighting. A **hallucination**, in the philosophers' sense, seems to its subject exactly like a veridical perception although no object is perceived at all. With these terms Crane and French state the Problem of Perception: if illusions and hallucinations are possible, then perceptual experience, as we ordinarily understand it, is impossible.

## From Rays to Inferences

The ancients first argued about seeing as a question of physics. On the **extramission** theory, rays go out from the eye; Euclid's *Optics* (around 300 BCE) and Ptolemy's (second century CE) treated sight this way, and Plato is counted with them. On **intromission** theories something comes from the object to the eye: the Epicureans held that objects shed thin films that enter the sense organs, and in Aristotle's account nothing goes out from the eye.

Ibn al-Haytham (c. 965–c. 1040), known in Latin as Alhazen, wrote a seven-book *Book of Optics*, traditionally dated 1011–1021. He argued against extramission (looking at the sun damages the eye, and it is implausible that the eye fills the whole sky with rays the instant the eyelids open on the night) and held, following al-Kindī, that light and colour issue from every point of a lit body along every straight line. (The story that he wrote under house arrest while feigning madness is legend.) Philosophically, what matters is his distinction between "pure sensation" of light, colour and direction and everything that depends on recognition, judgement and reason. Many perceptions, he argued, are inferences made so suddenly and "imperceptibly" that they seem immediate. He was no sceptic, but his work, translated into Latin in the late twelfth or early thirteenth century, fed later medieval doubts about the senses and framed the theories of vision of Roger Bacon and, later, Descartes and Berkeley. Hermann von Helmholtz, in his *Handbook of Physiological Optics* (completed 1867), called such processes **unconscious inference**. Once seeing is a process with stages, a question opens: is what we are aware of at the end the world itself, or something the process has produced?

## The Argument from Illusion

The oldest modern argument for a go-between is not strictly from illusion. Gary Hatfield calls it the argument from **perceptual variation**, and finds its first standard statement in Hume's *Enquiry* (1748): "The table, which we see, seems to diminish, as we move farther from it: But the real table, which exists independent of us, suffers no alteration: It was, therefore, nothing but its image, which was present to the mind." Reid answered in 1785 that if "seems" describes the table's appearance there is no contradiction: appearances can vary while the thing does not.

Bertrand Russell revived the argument in *The Problems of Philosophy* (1912), his popular "shilling shocker": a table looks brown, but white where light from a window falls on it, and its top looks different in shape from every angle. He gave the name "sense-data" to "the things that are immediately known in sensation: such things as colours, sounds, smells, hardnesses, roughnesses, and so on". He did not coin the term: G. E. Moore introduced it in a paper read in December 1909, and scattered uses go back to Sidgwick and William James. Russell, Moore and C. D. Broad did not treat the elliptical look of a round penny as an *illusion*; their basic case was variation. It was H. H. Price, in *Perception* (1932), who made illusion central. Here is the argument as Crane and French set it out:

1. In an illusion, it seems to the subject that something has a quality, say yellowness, which the object perceived (a white wall) does not have.
2. Whenever it seems to a subject that something has a quality, there is something the subject is directly aware of that has that quality.
3. So in an illusion, what the subject is directly aware of is not the ordinary object.
4. Illusions and veridical perceptions must be given the same account.
5. So in veridical perception, too, the subject is not directly aware of the ordinary object.
6. So we are never directly presented with ordinary objects.

Premise 2 is the crux. Howard Robinson calls it the **Phenomenal Principle**:

```quote
"If there sensibly appears to a subject to be something which possesses a particular sensible quality then there is something of which the subject is aware which does possess that sensible quality."
Howard Robinson · Perception, p. 32 · 1994
```

Its defenders found it obvious or explanatory. Price: "When I say 'this table appears brown to me' it is quite plain that I am acquainted with an actual instance of brownness." Broad: "If, in fact, nothing elliptical is before my mind, it is very hard to understand why the penny should seem elliptical rather than of any other shape." Premise 4 rests on continuity: walk towards a distant ball and its flat look shades into the bulging one with no break; A. J. Ayer said the differences are of "degree and not of kind".

**Objection.** Critics, Anscombe among them, called the Phenomenal Principle a fallacy; Roderick Chisholm named it the "sense-datum fallacy". That the wall looks yellow does not show that *something* is yellow. French and Walters (2018) added a logical worry: premises 1 and 2 show only that the subject is aware of some yellow thing besides the wall, not that she is unaware of the wall; closing the gap needs an extra "exclusion" assumption whose defence is open. And J. L. Austin, in Oxford lectures from 1947 published as *Sense and Sensibilia* (1962), attacked the continuity premise, insisting that "our ordinary words are much subtler in their uses, and mark many more distinctions, than philosophers have realized".

**Reply.** Defenders such as A. D. Smith answer that the principle rests not on the grammar of "looks" but on experience itself, and Broad's challenge stands: why does the penny look elliptical if nothing elliptical is before the mind? The dispute is unsettled.

## Sense Data and the Veil of Perception

Hatfield sums up the classical **sense datum** in eight points: we are directly aware of it, by acquaintance; it has exactly, and determinately, the properties it appears to have; awareness of it affirms nothing beyond it; it is known with certainty; it is private; and it is distinct from the act of sensing it. Price's "bulgy patch of red", seen when looking at a tomato, cannot be doubted even if the tomato can. The early theorists mostly held sense data to be neither mental nor physical; only in the later twentieth century were they standardly treated as items in the mind.

What, then, of tables? Russell in 1912 was a **representative** or **indirect realist**: sense data are caused by, and represent, a real table we perceive only through them (by 1914 he treated material objects as logical constructions from sense data; see *Frege, Russell and the Birth of Analytic Philosophy*). The view's ancestry runs from Democritus' "by convention colour; in reality atoms and void" (see *The Presocratics: from Myth to Argument*) through Locke, who wrote that the mind "perceives nothing but its own ideas", though the chapter *Locke* notes that scholars dispute how far he was an indirect realist. The obvious worry is the one Bennett called the **veil of perception**: if all we ever meet are ideas or sense data, they hang between us and the world, and we can never check that they match it. Defenders replied that sense data are the medium of perception, no more a veil than words are. Sellars, in "Empiricism and the Philosophy of Mind" (1956), attacked the whole "myth" of a given noticed before we have concepts.

If the veil cannot be lifted, one may deny that anything lies behind it. *Berkeley and Hume* tells how Berkeley concluded that the being of tables is to be perceived. **Phenomenalism** gave this a later form: statements about physical objects are statements about actual and possible experiences. John Stuart Mill, in his *Examination of Sir William Hamilton's Philosophy* (1865), called material objects "permanent possibilities of sensation". On this view, to say a paper clip is in my drawer is to say I would see it if I opened the drawer. Ayer's *Foundations of Empirical Knowledge* (1940) built such a phenomenalist language (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*). Chisholm (1948) replied that no translation succeeds, because what appears depends on conditions such as gloves, colour blindness or the lights going out, which can only be described in physical terms.

Sense-datum theory was widely rejected in the second half of the twentieth century, though it kept champions, among them Frank Jackson in 1977 (he later gave it up), Robinson in 1994 and Foster in 2000.

```checkpoint
q: Who introduced the term "sense-data", and when?
a*: G. E. Moore, in a paper read in December 1909, with scattered earlier uses by Sidgwick and James
a: Bertrand Russell, in *The Problems of Philosophy* (1912)
x: Russell used and popularised the term in 1912, but Moore had already introduced it.
a: A. J. Ayer, in *The Foundations of Empirical Knowledge* (1940)
x: Ayer came much later and built a phenomenalist language out of sense-datum talk.
a: H. H. Price, in *Perception* (1932)
x: Price elaborated the theory and made illusion central, decades after the term appeared.
hint: The paper was "The Subject-Matter of Psychology".
why: Moore introduced the word in December 1909, after using the idea without the word in 1905–06; Russell's 1912 book made it famous.
---
q: Which premise of the argument from illusion did Anscombe and Chisholm attack as a fallacy?
a: That illusions are possible
x: Nearly everyone grants that walls can look yellow; the dispute is about what follows.
a: That veridical and illusory experiences must be given the same account
x: That is the continuity or "spreading" premise, which Austin attacked.
a*: That whenever something seems to have a quality, the subject is aware of something that has it
a: That we are never directly presented with ordinary objects
x: That is the argument's conclusion, not one of its premises.
hint: Robinson calls it the Phenomenal Principle.
why: The critics say "it looks yellow" does not imply that something yellow exists; Chisholm called the inference the "sense-datum fallacy".
```

## Hallucination and the Four Answers

The argument from hallucination has the same shape but a different weak point. Its first step, that in a perfect hallucination no ordinary object is presented, "simply falls out of what hallucinations are supposed to be". Its second is the Common Kind Claim: hallucination and veridical perception are the same kind of state. So, again, we never directly perceive ordinary objects. Paul Snowdon called the first step the **base case** and the second the **spreading step**; the illusion argument's burden lies in its base case, the hallucination argument's in its spreading step.

**Sense-datum theory** accepts both arguments. **Adverbialism**, defended by C. J. Ducasse (1942) and Chisholm (1957), rejects the Phenomenal Principle. A free kick is not an object one owns but a way of kicking; likewise, to see a white sphere is not to be aware of a white, spherical thing but to sense "whitely and spherely". Nothing yellow need exist for me to sense yellowly. Frank Jackson's **many-property problem** (1975) is the classic objection: "sensing brownly and squarely and greenly and triangularly" fits both a brown square beside a green triangle and a brown triangle beside a green square.

**Intentionalism**, or representationalism, says that experience *represents* the world as being a certain way, and can misrepresent. The illusory wall is a white wall represented as yellow; the hallucination represents a churchyard that is not there; what they share with perception is content. An early version (Armstrong, 1968) treated perception as acquiring beliefs, but the **Müller-Lyer illusion** tells against it: two equal lines go on *looking* unequal after you have measured them and *believe* they are equal. Gilbert Harman's main support for the view is the **transparency** of experience:

```quote
"Look at a tree and try to turn your attention to intrinsic features of your visual experience. I predict you will find that the only features there to turn your attention to will be features of the presented tree, including relational features of the tree 'from here'."
Gilbert Harman · "The Intrinsic Quality of Experience", p. 39 · 1990
```

If introspection finds only the tree, there is no "mental paint" for sense data or adverbs to describe. Block defends mental paint, and critics point to blurry vision when you take off your glasses, which seems a change in *how* you see, not in what. Many intentionalists, following Evans (1982), hold that this content is **non-conceptual**, since we see more shades than we have concepts for; McDowell disagrees. Intentionalists reject the illusion argument but accept the hallucination argument, and recover direct realism by adding that a veridical experience is caused, in the right way, by the object it represents.

**Disjunctivism** rejects the spreading step. First proposed by J. M. Hinton (1967, 1973) and developed by Snowdon, McDowell and M. G. F. Martin, it denies "the doctrine of the 'experience' as the common element" in a perception and a matching hallucination. The most basic description of my state is a disjunction: *either* I see a churchyard, *or* I merely hallucinate one. The two are subjectively indistinguishable, but they are different kinds of state. It is usually paired with **naive realism**: snow looks white to you because you are directly presented with white snow. In McDowell's words, of the facts that things seem a certain way, "some are cases of things being thus and so within the reach of one's subjective access to the external world, whereas others are mere appearances."

**Objection.** Imagine two physically identical brains, one seeing a tin, the other stimulated identically with no tin there. Surely, since everything inside the head is the same, so is the experience. Robinson develops a related "causal argument".

**Reply.** Disjunctivists accept the cost: experience is not fixed by what is inside the head, a view called **externalism**. Martin argues that in perception the object is a constituent of the experience, so its absence is enough for that kind of event not to occur.

Crane and French call the gap between intentionalists and naive-realist disjunctivists "arguably 'the greatest chasm'" in the field, and conclude that the question now "is not so much whether to be a direct realist, but how to be one." The phenomenological tradition's alternative is described in *Phenomenology: Husserl, Heidegger and Merleau-Ponty*.

## The Indian Debates

Disjunctivism has an ancient relative. The *Nyāya-sūtra*, attributed to Gautama and dated around 200 CE, defines perception (1.1.4, in Matthew Dasti's translation) as a cognition that "arises by means of the connection between sense faculty and object, is not dependent on words, is non-deviating, and is determinate". Real contact between sense and object expresses Nyāya's direct realism; and since perception must be non-deviating, an illusion is not a bad perception but a pseudo-perception. When you see a shell and think "silver", real silver seen elsewhere is remembered and misplaced onto the shell. Illusion is parasitic on veridical experience: not all coins can be counterfeit. The Stanford Encyclopedia's verdict: "Nyāya takes a disjunctivist position: an illusion is a different kind of critter than a genuine perception." *Vedānta: Śaṅkara, Rāmānuja and Madhva* sets this beside Advaita's snake-in-the-rope, neither real nor unreal.

The Buddhist logicians Dignāga (c. 480–c. 540) and Dharmakīrti (c. 600–660) drew the line elsewhere. Perception, they held, is always free of concepts and words and grasps real particulars, while concepts deal in fictional universals; conceptual thought is "distorted" because it superimposes them. One awkward consequence, Tom Tillemans notes, is that the same object could never be both perceived and thought about. Since Vācaspati Miśra (c. 900), Naiyāyikas have instead distinguished a concept-free first stage (*nirvikalpaka*) from a conceptual perception (*savikalpaka*) whose content can be true or false; the Mīmāṃsaka Kumārila pointed to the infant. Gaṅgeśa (c. 1325) argued that if grasping a quality always required a prior grasp of another, there would be an endless regress, so concept-free perception must come first. The grammarian Bhartṛhari held that all cognition is shot through with words. The debate anticipates the modern one about non-conceptual content.

Behind this lay idealism. *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* sets out Vasubandhu's dream argument that everything is "only appearance", and the Nyāya reply that it presupposes the waking contrast it denies. Yogācāra writers also used hungry ghosts, who see a river of pus where humans see water, to ask whose world is real. In their final positions Dignāga and Dharmakīrti were Yogācāras, and Dharmakīrti argued that the Sautrāntika school's own theory of knowledge made external objects explanatorily idle; whether that is metaphysical or merely epistemic idealism is disputed. In 1986 B. K. Matilal defended a realism close to Nyāya against Buddhist idealism, engaging modern sense-datum theorists (see *Modern Chinese and Indian Philosophy*).

## Molyneux's Question

On 7 July 1688 William Molyneux, an Irish scientist and politician whose wife had lost her sight in the first year of their marriage, wrote to John Locke. A man born blind has learned to tell a globe from a cube by touch. If he were made to see: "Whether he Could, by his Sight, and before he touch them, know which is the Globe and which the Cube?" Locke did not reply, but a simplified version in 1693 drew the response "Your ingenious problem will deserve to be published to the world", and it appeared in the second edition of the *Essay* (1694).

Molyneux answered "Not", and Locke agreed. Their reasoning runs:

1. The man knows how a globe and a cube affect his *touch*.
2. Ideas from sight and from touch are different ideas, and any link between them is learned from experience.
3. He has had no experience connecting how things feel with how they look.
4. So on first sight he could not tell with certainty which was the globe and which the cube.

Berkeley gave a more radical "no" in 1709: ideas of sight and of touch are not even similar.

**Objection.** Leibniz (1704), like Synge and Hutcheson, answered "yes". Shape is common to both senses, so a rational man could work out which is which, provided, Leibniz insisted, that his sight had time to settle.

**Reply.** Premise 2 is the real issue, and it is hard to test: the newly sighted see poorly at first, while giving them time lets learning contaminate the result.

In 1728 the surgeon William Cheselden described a thirteen-year-old boy whose cataracts he had removed: "When he first saw, he was so far from making any judgment of distances, that he thought all objects whatever touched his eyes (as he expressed it) as what he felt did his skin." Berkeley took this as confirmation; Voltaire, Diderot, Condillac and Reid thought it ambiguous, and the boy had in fact been able to tell night from day. In 2011 Richard Held, Pawan Sinha and colleagues, among them Beatrice de Gelder and Suma Ganesh, tested five congenitally blind children aged 8 to 17 treated through Project Prakash in India. Within 48 hours of surgery they matched shapes touch to touch and sight to sight, but touch to sight barely better than guessing. Three of the five, retested days or months later, had improved markedly: "initially no but subsequently yes". The Stanford Encyclopedia judges that "there is no problem in the history of the philosophy of perception that has provoked more reflection, refinement, and experimentation." The wider quarrel over innate and learned ideas belongs to *Reason, Experience and Innate Ideas*.

```checkpoint
q: What did Held and colleagues find in 2011 with five newly sighted children?
a: They immediately matched seen shapes to felt shapes, confirming Leibniz.
x: Their touch-to-sight matching right after surgery was barely better than guessing.
a*: They failed to match felt shapes to seen ones at first, but three of the five improved markedly when retested later.
a: They could not match shapes even by sight alone.
x: Vision-to-vision and touch-to-touch matching were fine; only the cross-over failed.
a: All five succeeded perfectly on retest within a day.
x: Only three were retested, after days or months, and they improved rather than succeeding at once.
hint: The usual summary is "initially no but subsequently yes".
why: The result supports Molyneux and Locke for first sight, while suggesting the link between the senses can be learned quickly.
---
q: Why does the Stanford Encyclopedia say Nyāya "takes a disjunctivist position"?
a: Because Nyāya holds that perception is always free of concepts
x: That is Dignāga and Dharmakīrti's view, which Nyāya rejected.
a: Because it holds that the world is only appearance
x: That is Vasubandhu's Yogācāra thesis, which Nyāya opposed.
a: Because it says illusory silver is neither real nor unreal
x: That is Advaita Vedānta's account of error.
a*: Because it treats an illusion as a different kind of thing from a genuine perception, not a defective perception of the same kind
hint: Recall what disjunctivists deny about perception and hallucination.
why: Like modern disjunctivists, Nyāya denies a common kind: perception requires real sense–object contact, and illusion is a pseudo-perception parasitic on veridical cases.
```

## What Psychology Adds

{{image: Müller-Lyer illusion | The Müller-Lyer illusion, devised in 1889: the shafts are equal, but outward-pointing fins make one look longer, even to those who know the truth.}}

The Gestalt psychologists (Max Wertheimer, Kurt Koffka, Wolfgang Köhler) held that the world is given in three dimensions, not built from flat patches, and J. J. Gibson agreed that seeing a flat, sense-datum-like image takes a special act of attention: a tilted plate "looks circular, not elliptical". His ecological approach (1979) says we perceive **affordances**, "what it offers the animal, what it provides or furnishes, either for good or ill". **Predictive processing** treats the brain as a prediction machine; in Andy Clark's words, "to perceive the world just is to use what you know to explain away the sensory signal".

This raises the question of **cognitive penetration**: can beliefs and desires change what we see, not just what we judge? Fodor (1983) pointed to the Müller-Lyer lines: knowing they are equal does not dispel the illusion, so perception is sealed off from belief. In 1966 Segall, Campbell and Herskovits tested more than 1,300 people in 17 groups and found Europeans and Americans most susceptible and San foragers of the Kalahari least, proposing that a "carpentered world" of right angles trains the eye. The findings are contested (others proposed eye pigmentation), and McCauley and Henrich read them as shaping during development, not penetration. Sceptics such as Firestone and Scholl say most claimed effects are on judgement, memory or attention, not on seeing.

Two recent cases dramatise old points. In 2015 a photograph of a royal blue and black dress divided the internet. The favoured explanation, without consensus, is that viewers assumed different lighting. It sharpens the old question of colour, which Galileo, Newton and Maxwell placed in the perceiver; Hume wrote that colours "according to modern philosophy are not qualities in objects, but perceptions in the mind". And in Daniel Simons and Christopher Chabris's 1999 experiment, in most groups about half of those counting basketball passes failed to notice a person in a gorilla suit: **inattentional blindness**. Seeing is not the same as noticing.

## Perception and Knowledge

The problem of perception is finally a problem of knowledge. Jack Lyons reconstructs the sceptic's case: nothing is directly present to the mind but appearances; without good reason to think appearances accurate, beliefs based on them are unjustified; we have no such reason; so perceptual beliefs are unjustified. Direct realists deny the first premise. Others deny the second: Pryor's "dogmatism" (2000), Huemer's "phenomenal conservatism" and Pollock hold that if it perceptually seems to you that something is so, you are justified in believing it unless something defeats that justification, with no prior proof that your senses are reliable. Whether that answers the sceptic or refuses to is the business of *Scepticism and the Answers to It*; what experience is like from the inside belongs to *Consciousness*. The simple claim "I see a tree" turns out to be a philosophical position, one that thinkers from the Nyāya to McDowell have had to defend.

## Further exploration

- **A. D. Smith, *The Problem of Perception* (2002).** A rigorous book-length treatment of the arguments from illusion and hallucination.
- **William Fish, *Philosophy of Perception: A Contemporary Introduction* (2010).** An accessible textbook covering sense data, adverbialism, intentionalism and disjunctivism.
- **J. L. Austin, *Sense and Sensibilia* (1962).** The classic short attack on sense-datum theory, from Austin's Oxford lectures.
- **Howard Robinson, *Perception* (1994).** A late defence of sense data, and the source of the Phenomenal Principle.
- **Bimal Krishna Matilal, *Perception: An Essay on Classical Indian Theories of Knowledge* (1986).** Nyāya realism against Buddhist views, in dialogue with analytic philosophy.
- **Brian Glenney, *A Pluralist's Guide to Solving Molyneux's Problem* (2024).** The history and analysis of Molyneux's question up to recent experiments.
- **Andy Clark, *Surfing Uncertainty: Prediction, Action, and the Embodied Mind* (2016).** The predictive-processing picture from its leading philosophical advocate.$perception_master$,
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
  select $perception_quiz$[
    {"type": "mcq", "prompt": "According to Hatfield, what was the basic argument for sense data used by Russell, Moore and Broad?", "options": ["The argument from perceptual variation: what we see changes as we move or the light changes, while the real object does not", "The argument from hallucination: a perfect hallucination is the same kind of state as a perception", "The time-lag argument from the light of distant stars", "Molyneux's question about a blind man given sight"], "answerIndex": 0, "explanation": "They did not treat the elliptical-looking penny as an illusion; their case was perceptual variation, an argument Hatfield traces to Hume's table that 'seems to diminish'. Price later made the argument from illusion central.", "id": "q1"},
    {"type": "mcq", "prompt": "What is Frank Jackson's 'many-property problem' an objection to?", "options": ["Disjunctivism", "Adverbialism, the view that to see a white sphere is to sense 'whitely and spherely'", "Phenomenalism", "Nyāya's theory of illusion as misplacement"], "answerIndex": 1, "explanation": "'Sensing brownly and squarely and greenly and triangularly' fits both a brown square beside a green triangle and a brown triangle beside a green square, so the adverbial description cannot tell the two experiences apart.", "id": "q2"},
    {"type": "mcq", "prompt": "Which claim do disjunctivists such as Hinton, Snowdon, McDowell and Martin reject?", "options": ["That hallucinations are subjectively indistinguishable from perceptions", "That we can directly perceive ordinary objects", "That a veridical perception and a matching hallucination are fundamentally the same kind of mental state", "That illusions are possible"], "answerIndex": 2, "explanation": "Disjunctivists reject the Common Kind Claim, the 'spreading step' of the argument from hallucination. They accept that the two experiences are subjectively indistinguishable but deny that they share a fundamental kind; most pair this with naive realism.", "id": "q3"},
    {"type": "mcq", "prompt": "Why did Fodor (1983) appeal to the Müller-Lyer illusion?", "options": ["To show that perception is a kind of belief", "To prove that the illusion is learned in a 'carpentered world'", "To show that colours are not in objects", "To argue that perception is sealed off from belief, since knowing the lines are equal does not stop them looking unequal"], "answerIndex": 3, "explanation": "The illusion persists after measurement, which Fodor took to show that perception is informationally encapsulated. The same fact counts against the belief theory of perception. The carpentered-world hypothesis came from Segall, Campbell and Herskovits, and its findings are contested.", "id": "q4"},
    {"type": "open", "prompt": "Set out the argument from illusion step by step. Which premise is most controversial, and what are the strongest objection to it and the best reply?", "rubric": "A strong answer gives the steps: in an illusion something seems to have a quality the object lacks; whenever something seems to have a quality, the subject is aware of something that has it (the Phenomenal Principle, Robinson); so in illusion the subject is not directly aware of the object; illusion and veridical perception need the same account (continuity: Ayer's 'degree and not of kind'); so we are never directly aware of ordinary objects. It identifies the Phenomenal Principle as the crux, cites its support (Price's 'actual instance of brownness', Broad's elliptical penny), and gives the objection that it is a fallacy (Anscombe; Chisholm's 'sense-datum fallacy'), possibly with French and Walters' point that the argument needs an exclusion assumption, and Austin's attack on continuity. The reply: Smith's claim that the principle rests on experience, not the grammar of 'looks', and Broad's explanatory challenge. Credit noting that Russell, Moore and Broad argued mainly from perceptual variation and that Price made illusion central.", "id": "q5"},
    {"type": "open", "prompt": "Compare the Nyāya and Buddhist (Dignāga and Dharmakīrti) accounts of perception and illusion, and relate them to one modern position in the philosophy of perception.", "rubric": "A strong answer explains Nyāya-sūtra 1.1.4 (sense–object contact, not dependent on words, non-deviating, determinate), Nyāya's direct realism, illusion as misplacement of a remembered qualifier (shell seen as silver) and as parasitic on veridical perception (not all coins can be counterfeit), and the Stanford Encyclopedia's description of this as disjunctivist. It contrasts Dignāga and Dharmakīrti's view that perception is always non-conceptual and grasps real particulars while concepts superimpose fictional universals, with the consequence that one object cannot be both perceived and thought about, and the Nyāya two-stage view (nirvikalpaka and savikalpaka; Gaṅgeśa's regress argument). Links might be disjunctivism (Hinton, Martin) or the modern debate over non-conceptual content (Evans versus McDowell). Credit mention of the Yogācāra idealist background and Matilal's defence of Nyāya realism.", "id": "q6"}
  ]$perception_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/perception', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
