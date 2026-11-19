-- Self and No-Self: Personal Identity East and West — canonical master article, co-written and human-reviewed.
-- philosophy/philosophy-of-mind/self-and-no-self @ research/advanced/read.
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
    'philosophy/philosophy-of-mind/self-and-no-self',
    'research',
    'advanced',
    'read',
    $self_master$> **Is there a "you" behind your thoughts, or only the thoughts?** This chapter sorts out what "self" can mean, then works through the arguments: Hume's bundle theory set out step by step with Reid's reply, the Buddhist case for treating persons as useful fictions, the Nyāya argument that seeing and touching one thing needs a single subject, Advaita Vedānta's self that can never be caught because it does the catching, and the Daoist and Confucian alternatives. It ends with the modern debate: brains that build self-models and invent explanations, the claim that a self is a story and Galen Strawson's attack on it, and Derek Parfit's conclusion that if identity matters less than we think, so does the line between my life and yours.

## Three Questions, Two Kinds of Self

Eric Olson's entry in the Stanford Encyclopedia of Philosophy (SEP) begins with the questions that arise "about ourselves by virtue of our being people": "What am I? When did I begin? What will happen to me when I die?" He avoids the word "self" itself, because it is "sometimes synonymous with 'person', but often means something different: a sort of unchanging, immaterial subject of consciousness". That warning matters for this whole chapter. When Hume and the Buddhists deny the self, they are mostly denying the second thing, not that there are people.

Two questions need keeping apart. The **persistence question** asks what makes some past or future being *me*. The **characterisation question**, Marya Schechtman's name for it, asks "Who am I?" in the everyday sense: which traits and commitments define me as a person. My answer to that can change, and can even be deluded, as when someone becomes convinced he is Napoleon. Answers to "What are we?" range from animals and brains to immaterial souls, "bundles of perceptions", as Hume said, or nothing at all (Peter Unger titled a 1979 paper "I do not Exist"); Olson finds "no consensus or even a dominant view".

Shaun Gallagher (born 1948) separates a **minimal self**, the sense of being the immediate subject of an experience, with a sense of ownership (this is happening to me) and of agency (I am doing this), from a **narrative self** that stretches across time. Phenomenologists, philosophers who start from the structure of experience as lived, call the first layer **prereflective self-consciousness**: present "whenever I am living through or undergoing an experience", with no need to introspect, use the word "I" or tell a story. Dan Zahavi (born 1967) defines a minimal selfhood as "the very first-personal mode of experiencing". Both layers will be needed below.

*Identity, Change and Persons* has already covered Locke's memory theory, fission, the teletransporter and the Buddhist and Nyāya positions in outline; *Locke* sets out Locke's own account. This chapter takes up the self as subject and as story.

## Hume's Bundle, Step by Step

*Berkeley and Hume* quotes the famous passages from Hume's *Treatise of Human Nature* (1739): when he enters most intimately into what he calls himself, he can never "catch" himself without a perception, and the mind is "nothing but a bundle or collection of different perceptions". It does not set out the argument. Following the SEP and the Internet Encyclopedia of Philosophy (IEP), it runs:

1. Every genuine idea is copied from an impression, a vivid experience (Hume's **Copy Principle**).
2. If we had an idea of a self that is simple and the same through a whole life, it would have to come from some impression that stays constant and unchanging through that life (a paraphrase of Hume's own premise).
3. Looking inward, we find no such impression: only one particular perception or another, of heat or cold, love or hatred, pain or pleasure.
4. So we have no such idea. So far as we can conceive it, the mind is a bundle (at one time) or a succession (over time) of perceptions.
5. Our belief that we stay one and the same is produced by the imagination gliding along the resemblances and causal links between perceptions, with memory extending the chain.

Hume compared the mind to a kind of theatre in which perceptions make their appearance, pass and mingle, but warned at once against the comparison: there is no stage, only the perceptions themselves. Over time, he thought, a person is less like a thing than like a state:

```quote
I cannot compare the soul more properly to any thing than to a republic or commonwealth, in which the several members are united by the reciprocal ties of government and subordination, and give rise to other persons, who propagate the same republic in the incessant changes of its parts.
David Hume · A Treatise of Human Nature, 1.4.6 · 1739
```

A republic may change its members, laws and constitution and remain the same republic; so a person may change character and ideas "without losing his identity".

**Objection.** Who perceives the bundle? Critics argue that for the states of a mind to *seem* unified, something must perceive their unity, and that something would be as mysterious as the self Hume dismissed. Thomas Reid answered Hume directly. We know our own identity and continued existence "immediately, and not by reasoning", he held, as one of the first principles of thought:

```quote
I am not thought, I am not action, I am not feeling; I am something that thinks, and acts, and suffers.
Thomas Reid · Essays on the Intellectual Powers of Man · 1785
```

Reid echoed Descartes's definition of the self by what it does, while refusing to speculate about what kind of substance it is. Kant, as *Kant* explains, agreed with Hume that the self is never given to inner observation as an object, but argued that the "I think" must be able to accompany all my representations: a unifying function is needed to account for the unity of experience over time, and a bundle of associated perceptions does not supply it.

**Reply.** Hume's defenders say the objection assumes what it should prove: the "unity" may simply be the causal and associative links among perceptions, with no inner spectator needed. Phenomenologists take a middle line: "On this point Hume was right" that there is no substantial self or mental theatre, yet every experience carries a sense of "for-me-ness" that Hume left out. Critics such as Dainton and Bermúdez answer that this for-me-ness is itself a by-product of reflecting on experience. Hume himself was not satisfied. In the Appendix of 1740 he confessed to a "labyrinth" (quoted in *Berkeley and Hume*): he could not explain what unites our successive perceptions. What exactly troubled him is unsettled; Daniel Siakel (2018) counts over thirty incompatible interpretations, and Galen Strawson argues that Hume was never a "Humean" at all, taking the bundle view to be the only one experience licenses but not an adequate account of the self.

## Buddhism: Persons as Useful Fictions

The parallel with Buddhism has been explored at length by James Giles, Tillemans and Matthew Kapstein. *The Buddha and Early Buddhist Philosophy* sets out the canonical arguments for non-self, the chariot and the Personalist school; *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* covers the storehouse consciousness. What the Buddhist philosophers built on those arguments was a theory, which Mark Siderits reconstructs as **reductionism**: persons are real, but only in the way wholes made of parts are real.

Its core is the doctrine of **two truths**. Something is conventionally real if common sense accepts it, though analysis shows it to be a whole compounded of simpler things, and so "not strictly speaking real at all". Ultimately, Siderits writes, there is "a causal series of impermanent, impersonal psychophysical elements". Why then speak of persons? His reconstruction makes an argument of it:

1. Ultimately there are only momentary physical and mental events, causally linked in series.
2. When the present part of a series identifies with its future parts, it is less likely, in Siderits's example, to take up "behavior (such as smoking) that results in present pleasure but far greater future pain".
3. So the convention of treating a series as one person produces more happiness and less suffering overall.
4. So "it is conventionally true that there are persons".
5. But taken too seriously, "as more than just a useful fiction", the same convention produces existential suffering.

On this view "I" is like "pair": a word for a collection, with nothing it "genuinely denotes". Vasubandhu, whose argument against the person is set out in *Identity, Change and Persons*, faced the obvious questions squarely. What is the same about me as a child and an adult? What perceives, what remembers, what is reborn? His test for reality was causal power: what is real can make a difference, and anything else is "merely a conceptual construct, a mere convention". Memory works through **seeds**, a metaphor for a capacity laid down by experience, as a grain of rice holds the capacity to produce the next grain; my consciousness today "arises with the shape of my past aggregates imprinted upon it". And the apparent subject of experience is itself part of what is constructed: each moment of awareness, in Jonathan Gold's summary, is "a full, constructed appearance of subject/object duality without there actually being any separate subject". There is experience, but no experiencer standing behind it.

Candrakīrti, the Madhyamaka philosopher of the early seventh century, pressed the analysis further in a sevenfold version of the chariot argument. In one English translation of his *Madhyamakāvatāra* (6.151), the self "is like a cart, which is not other than its parts, not non-other, and does not possess them. It is not within its parts, and its parts are not within it. It is not the mere collection, and it is not the shape." The sevenfold analysis, built on a fivefold one in Nāgārjuna, has also been read as a guide to meditation rather than a theory.

Christian Coseru stresses that, as Siderits argued, the Buddhist reductionist "is not an eliminativist": persons are conventional, not nonexistent, though others read the texts differently. Jonardon Ganeri adds a caution: the Buddha's discourses may be exhortations, like Stoic ones, rather than free-standing metaphysics.

## Seeing and Touching: the Nyāya Argument

The Nyāya school defended a lasting self against these Buddhists. *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* gives its argument from qualities (desire and cognition must belong to some non-material substance) and its argument from memory, defended by Uddyotakara (c. sixth century CE). As the IEP's Matthew Dasti puts it, Buddhists dissolve the self in two directions: over time into a series of momentary events, and at a single time into "heaps of micro-properties". The memory argument answers the first. The *Nyāya-sūtra* (3.1.1–3), as the IEP summarises it, answers the second with **cross-modal recognition**:

1. I can judge, "the thing I see is the thing I am touching".
2. That judgement compares what sight delivers with what touch delivers.
3. A comparison needs one subject who has both; nobody can compare what one person sees with what another touches.
4. Neither the eye nor the skin has both; each sense has only its own objects.
5. So there is one subject distinct from the senses that combines their data: the self.

Steps 2 to 4 unpack the IEP's one-sentence summary; the sūtra's own wording is not given here.

**Objection.** The Buddhist reply is that premise 3 confuses one subject with one causal stream. Sight and touch events arise in the same series and feed the same later moments of awareness, and that causal integration is all a comparison requires. The "single experiencer" who seems to compare them is, on Vasubandhu's account, part of the constructed appearance.

**Reply.** The Naiyāyika can ask what makes events in one series belong together rather than to two series that happen to be causally linked, and that question brings back the work a subject was meant to do. Udayana (c. 975–1050) brought these arguments to their peak in *Determining the Truth of the Self*. Note that the Nyāya self is not conscious by nature. Consciousness is a quality it acquires, and a cognition is made known by a further cognition, a view the SEP compares to modern higher-order theories (discussed in *Consciousness*).

```checkpoint
q: What does the Nyāya cross-modal argument (NS 3.1.1–3) try to show?
a*: That recognising one object as both seen and touched needs a single subject who has both sensations.
a: That memory of past experiences needs a self that lasts over time.
x: That is the separate diachronic argument from recollection; the cross-modal argument concerns unity at a single time.
a: That desire and cognition are qualities that must inhere in a substance.
x: That is the argument from qualities, attached to NS 1.1.10, not the cross-modal one.
a: That the self is pure consciousness that witnesses without acting.
x: That is closer to Sāṃkhya and Advaita; the Nyāya self is not conscious by nature.
hint: Think of the eye and the skin.
why: Neither sense has the other's data, yet I judge that what I see is what I touch; Nyāya concludes that one subject distinct from the senses must combine them.
---
q: In Siderits's reconstruction, why is it conventionally true that there are persons?
a: Because a permanent self underlies the psychophysical elements.
x: The reductionist denies any such self; ultimately there are only impersonal elements.
a: Because the Buddha used the word "I" correctly in grammar.
x: Candrakīrti notes that grammatical correctness does not show a word has a referent.
a*: Because identifying with the future parts of one's series reduces overall suffering, as with not smoking.
a: Because perception directly reveals the person as an ultimate entity.
x: That resembles the Personalists' claim; reductionists treat the person as a construct.
hint: Ask what the convention is useful for.
why: The person is a useful fiction: treating a series as one person yields more happiness and less pain, though taking the fiction too seriously causes suffering.
```

## The Self That Cannot Be Caught

Advaita Vedānta reverses Hume. *Vedānta: Śaṅkara, Rāmānuja and Madhva* explains Śaṅkara's doctrine of superimposition and his argument that the witnessing self is self-luminous; *The Upanishads and the Beginnings of Indian Philosophy* gives its source in the self that "cannot be an object of consciousness". Two further pieces bear on the present debate.

The first is Śaṅkara's answer to the inward search. If one infers from not finding consciousness that it does not exist, he counters that nobody can deny their own consciousness (*Brahmasūtra Commentary* 2.3.7): any dismissal of consciousness presupposes it. The witness, in Neil Dalal's words, is "elusive because it is unobjectifiable": try to isolate it on one side and its objects on the other, and both become objects. Against Hume: the self is never caught because it is the catcher.

The second is an account of how one consciousness appears as many people. Ultimately, for Advaita, there is one Brahman, pure being, consciousness and bliss, and individual selves are provisionally accepted appearances. Śaṅkara explained individuation with a **reflection theory**: the mind is akin to the reflective surface of a mirror. As light is everywhere but becomes visible only on a reflecting surface, consciousness is expressed in experience only through the intellect, and "reflection is the seed of individuation and the I-notion". The faculty that results is the *ahaṃkāra*, literally the "I-maker", which gives each of us the sense of being a knower, doer and enjoyer. A second image is space in a pot: undivided space seems separated into many spaces by the walls of the pots. Where the Buddhist defiled mind invents a self that is not there, the Advaitin's I-maker misplaces a self that is.

Other Indian thinkers argued over embodiment. The eleventh-century Jain writer Prabhācandra gave an argument very like Avicenna's **flying man** (set out in *Falsafa: al-Kindī, al-Fārābī and Avicenna*) for the possibility of self-awareness without awareness of the body, whereas several Advaitins argued, according to Ram-Prasad, that there is no self-awareness without embodiment.

## Lost Selves and Relational Selves in China

In the second chapter of the *Zhuangzi* (introduced in *Mozi, the Daoists and the Legalists: the Hundred Schools*), Ziqi, apparently deep in a meditative state, says he has "lost myself" (吾喪我, *wu sang wo*). The line has supported both "true self" and "no self" readings. The text goes on to describe joy and anger, plans and regrets arising day and night from nobody knows where; in Brook Ziporyn's translation, as David Wong quotes it, "Without them there would be no 'I', and without an 'I' nothing chosen." It asks whether any of the body's "hundreds of bones, nine openings and six organs" is more "I" than the rest, and muses that there must be a "true lord" even if we cannot find it. Wong calls this a "Hume-like reflection". Chad Hansen reads the *wǒ* ("I:me") as an indexical "choosing point" (an indexical is a word, like "here" or "I", whose reference depends on who uses it), and notes that the whole body, not some controlling homunculus, chooses. Wong sees an "egalitarian conception" that puts the heart-mind "in conversation with the rest of the body rather than in command".

Confucian thinkers are often read as treating the self as relational. Wong describes Confucian ethics as placing relationships at the centre of a good life: one "achieves fullest personhood" through relationships of mutual care, and "it can be part of one's very identity to be a particular person's son or daughter". Roger Ames recasts it as **role ethics**. But Wong cautions that the contrast with Western individual autonomy "must be carefully described", since Confucians partly accept living by one's own understanding of what is right, and Hall and Ames themselves reject the reading of Confucianism as putting the group above the individual. *Confucius, Mencius and Xunzi* gives the background; *African Philosophy: the Ethnophilosophy Debate and Beyond* follows a parallel debate over whether personhood is achieved in community.

## Self-Models, Stories and Split Brains

Some recent philosophers deny the self on scientific grounds. Thomas Metzinger (born 1958), in *Being No One* (2003), argues that the phenomenal self is a construct of the brain: we have a **self-model**, whose features include mineness and a sense of perspective, but no one has ever been or had a self. Daniel Dennett (1942–2024) called the self "a center of narrative gravity" (1992). The analogy runs: a centre of gravity is real and useful for prediction, yet it is no physical part of the object, "just an abstractum"; the self is likewise the abstract point around which a person's self-told stories are organised.

{{image: Corpus callosum | The corpus callosum, the band of nerve fibres joining the brain's two hemispheres, which surgeons cut in split-brain operations.}}

The brain itself seems to tell such stories. From the 1960s, as a last resort for severe epilepsy, surgeons cut the corpus callosum, roughly 200 million fibres joining the hemispheres; Roger Sperry and Michael Gazzaniga (born 1939) reported on such patients in "The Split Brain in Man" (1967); Sperry later won the 1981 Nobel Prize in Physiology or Medicine. In daily life their conscious lives seem unified. In the laboratory they come apart: flash "TAXABLE" with "TAX" to the left visual field and "ABLE" to the right, and the patient says "ABLE" but writes "TAX" with the left hand. Whether they then have two streams of consciousness is debated. Gazzaniga and Joseph LeDoux described a "left-brain interpreter" that invents reasons for actions it did not initiate. Shown a chicken foot in one half of the visual field and a snowy scene in the other, one patient picked a chicken and a shovel, then explained that "the shovel is for cleaning out the chicken coop". The interpreter has been called "the glue that attempts to hold the story together".

## Is a Self a Story?

Narrative theorists make storytelling constitutive of the self. Alasdair MacIntyre (1929–2025) argued in *After Virtue* (1981) that the unity of a self "resides in the unity of a narrative which links birth to life to death". Schechtman's *The Constitution of Selves* (1996) made it precise, as an answer to the characterisation question. The argument:

1. To be a person, an agent answerable for a life, one's experiences and actions must be one's own in a rich sense.
2. A mere succession of experiences in one body does not make them one's own in that sense; a passive subject of experience is not yet a moral agent.
3. What makes them one's own is their place in a self-told life story: they "must be gathered together into the life of one narrative ego by virtue of a story the subject tells".
4. So persons are constituted by self-narration, and a good life is a narratively unified one.

**Objection.** Galen Strawson (born 1952), in "Against Narrativity" (*Ratio* 17, 2004), denied both the psychological thesis that people typically experience their lives as a story and the ethical thesis that they should. He distinguished **Diachronic** people, who figure themselves as something that was there in the past and will be there in the future, from **Episodic** people who do not, and counted himself relatively Episodic. Such people, he argued, can live fully moral lives, so narrativity is neither universal nor required, and insisting on it may harm those who lack it.

**Reply.** Schechtman's narratives need not be told aloud; they can be implicit in how experience is organised. And even an Episodic person keeps promises and follows long-term plans, which looks like a minimal narrative. Critics fault both sides: Mackenzie and Poltera (2010) find Schechtman's conditions too restrictive, and Battersby (2006) finds Strawson's dichotomy too sharp.

## What Matters: Parfit's Ethics

Derek Parfit (1942–2017) drew ethical conclusions from his reductionist view, whose kinship with Buddhism *The Buddha and Early Buddhist Philosophy* discusses. In his fission case, as Annette Dufner tells it, my two brain hemispheres go to two triplet sisters; both are continuous with me, both cannot be me, and choosing one is arbitrary. Yet I would care about their futures as if they were mine. So what matters for my concern is psychological continuity and connectedness, not identity as such.

Three consequences follow. First, connections come in degrees, so **responsibility** may weaken as they weaken. Parfit's **Russian nobleman** is a young socialist who will inherit estates. He signs a document giving the land to the peasants, revocable only with his wife's consent, and makes her promise not to consent if he later changes his mind. Years later he does. Is she still bound to the young man? If continuity is what counts, yes; if close connectedness, perhaps not. Second, John Rawls objected in *A Theory of Justice* (1971) that utilitarianism "does not take seriously the distinction between persons". Parfit replied that on his view the separateness of persons is "less pronounced than we usually think", which weakens the objection (*Consequentialism: What Makes Right Acts Right?* and *Justice and Equality* treat the theories). Third, his own attitudes changed. After the "glass tunnel" passage quoted in *Identity, Change and Persons*, he continued: "There is still a difference between my life and the lives of other people. But the difference is less. Other people are closer. I am less concerned about the rest of my own life, and more concerned about the lives of others."

**Objection.** Christine Korsgaard (born 1952) gave "A Kantian Response to Parfit" (1989). Whatever the metaphysics, agency requires us to treat ourselves as unified: our deliberations and life plans extend through time, and at any moment we must settle conflicts among our desires because "we only have one body to act with". The unity of a person is a practical necessity, not a metaphysical discovery.

**Reply.** A Parfitian can grant that agents must plan as if unified while holding that the connections between their stages still come in degrees, and that this is what moral judgements about promises and responsibility should track. Sosa and Merricks still argue that identity itself matters. The Buddhist would add that the useful fiction should be kept, and only not mistaken for more.

```checkpoint
q: What did Galen Strawson argue in "Against Narrativity"?
a: That the self is a centre of narrative gravity.
x: That is Dennett's phrase, for a different, deflationary view.
a*: That not everyone experiences life as a story, and that a good life does not require it.
a: That only a narratively unified life can be morally responsible.
x: That is close to the narrativist position Strawson attacked.
a: That memory of past lives is only memory of past aggregates.
x: That is Vasubandhu's point about rebirth, not Strawson's.
hint: Recall his distinction between Diachronic and Episodic people.
why: Strawson denied both the psychological and the ethical Narrativity theses, counting himself relatively Episodic and holding that such lives can be fully moral.
---
q: What is Parfit's Russian nobleman case meant to raise?
a: Whether a teletransporter preserves identity.
x: The nobleman is a case about promises and changing commitments, not teletransportation.
a: Whether utilitarianism ignores the distinction between persons.
x: That is Rawls's objection, which Parfit answered separately.
a: Whether a brain split between two bodies leaves one person or two.
x: That is the fission case, which motivates "what matters" but is not this case.
a*: Whether commitments bind across a life once psychological connections have weakened.
hint: The wife promised the young socialist, not the older man.
why: If responsibility follows degrees of connectedness, the young man's wishes may no longer bind the changed older man's wife; if continuity is enough, they do.
```

## Further exploration

- **Mark Siderits, Evan Thompson and Dan Zahavi (eds.), *Self, No Self? Perspectives from Analytical, Phenomenological, and Indian Traditions* (2010).** The standard cross-cultural collection, with Advaita, Buddhist, phenomenological and analytic essays side by side.
- **Jonardon Ganeri, *The Self: Naturalism, Consciousness, and the First-Person Stance* (2012).** A naturalist theory of the self built from Nyāya, Cārvāka and Buddhist sources.
- **Miri Albahari, *Analytical Buddhism: The Two-Tiered Illusion of Self* (2006).** Argues that Buddhism denies the constructed self but leaves room for witness-consciousness.
- **Dan Zahavi, *Subjectivity and Selfhood: Investigating the First-Person Perspective* (2005).** The phenomenological case for a minimal, experiential self.
- **Marya Schechtman, *The Constitution of Selves* (1996).** The narrative self-constitution view and the characterisation question.
- **Thomas Metzinger, *Being No One: The Self-Model Theory of Subjectivity* (2003).** The neuroscientifically informed case that no one has a self, only a self-model.
- **Roger T. Ames, *Confucian Role Ethics: A Vocabulary* (2011).** Confucian ethics read as an ethics of roles and relationships.$self_master$,
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
  select $self_quiz$[
    {"type": "mcq", "prompt": "To what did Hume compare the soul when explaining how a person can stay the same while everything about them changes?", "options": ["A republic or commonwealth that keeps its identity while its members, laws and constitution change", "A cart that is neither identical to nor different from its parts", "Space enclosed in a pot, which seems separate from space as a whole", "A centre of gravity, real but no physical part of the object"], "answerIndex": 0, "explanation": "In the Treatise (1739) Hume compared the soul to a republic or commonwealth whose members are united by ties of government and subordination; the cart is Candrakīrti's, the pot-space Advaita's and the centre of gravity Dennett's.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Thomas Reid say in reply to Hume's bundle theory?", "options": ["That the self is a useful fiction justified by its consequences", "That we know our own identity immediately, and that 'I am not thought, I am not action, I am not feeling; I am something that thinks, and acts, and suffers'", "That the self is a centre of narrative gravity", "That the self is known only through a further, higher-order cognition"], "answerIndex": 1, "explanation": "In the Essays on the Intellectual Powers of Man (1785) Reid treated our continued existence as a first principle known 'immediately, and not by reasoning', and distinguished the self from its thoughts and feelings, while refusing to speculate about its substance.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Śaṅkara explain how one consciousness appears as many individual selves?", "options": ["Through seeds laid down by experience in a causal stream", "Through the defiled mind mistaking the storehouse consciousness for a self", "Through reflection: consciousness shows up in experience only in the mirror-like intellect, which gives rise to the 'I-maker'", "Through God reassigning accidents to atoms at each moment"], "answerIndex": 2, "explanation": "Śaṅkara's reflection theory compares the mind to a mirror: as light becomes visible on a reflecting surface, consciousness is expressed in experience through the intellect, and 'reflection is the seed of individuation and the I-notion'.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Gazzaniga's split-brain patient say after picking a chicken and a shovel?", "options": ["That he could not explain his choice", "That his left hand had acted on its own", "That he had been shown a snowy scene", "That the shovel was for cleaning out the chicken coop"], "answerIndex": 3, "explanation": "The left-brain interpreter, which had not seen the snowy scene, invented a plausible reason for an action prompted by the other hemisphere: 'the shovel is for cleaning out the chicken coop'.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Nyāya argument from cross-modal recognition (seeing and touching the same thing) for a single self, and explain how a Buddhist reductionist such as Vasubandhu would reply.", "rubric": "A strong answer gives the steps: I judge that what I see is what I touch; this compares the deliverances of two senses; comparison needs one subject who has both; no single sense organ has both; so there is a self distinct from the senses (NS 3.1.1–3 as summarised by the IEP). It then gives the reply: causal connection within one stream of momentary events is enough to integrate the data, and the apparent single experiencer is a constructed appearance of subject/object duality. Credit for noting the Nyāya rejoinder that a series still needs something to make its members belong together, and that this argument concerns unity at one time, unlike the memory argument.", "id": "q5"},
    {"type": "open", "prompt": "Is a self a story? Explain the narrative view of Schechtman and MacIntyre, Galen Strawson's objection, and one reply, and say which you find more convincing.", "rubric": "A strong answer explains that for Schechtman (1996) experiences become one's own by being gathered into a self-told life story, and that for MacIntyre a life's unity is the unity of a narrative; that Strawson ('Against Narrativity', 2004) rejects both the psychological and ethical Narrativity theses, distinguishing Diachronic from Episodic people and arguing Episodics can live fully moral lives; and gives a reply such as implicit narratives, the need for long-term plans and promises, or Korsgaard's argument that agency requires treating oneself as unified over time. Credit for a reasoned verdict.", "id": "q6"}
  ]$self_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/philosophy-of-mind/self-and-no-self', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
