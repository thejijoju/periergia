-- The Mind–Body Problem — canonical master article, co-written and human-reviewed.
-- philosophy/philosophy-of-mind/mind-body-problem @ research/advanced/read.
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
    'philosophy/philosophy-of-mind/mind-body-problem',
    'research',
    'advanced',
    'read',
    $mindbody_master$> **How can a thinking, feeling mind belong to a body made of the same stuff as stones?** This chapter teaches the mind–body problem as a live question. It sets out what makes something mental, Descartes's arguments for dualism, and how Sāṃkhya, Nyāya, the Buddhists, Aristotle and Chinese thinkers drew the line between mind and matter differently. It then follows Elisabeth of Bohemia's question about interaction into the modern answers (epiphenomenalism, behaviourism, the identity theory, functionalism, eliminativism and emergentism) and the problem beneath them all: if the physical world is causally complete, can minds cause anything?

## What the Problem Is

You decide to raise your hand, and it rises. Your hand has a size, a weight and a position; your decision seems to have none of these. The entry on dualism in the Stanford Encyclopedia of Philosophy (SEP), by Howard Robinson and Ralph Weir, states the problem as explaining how beings like us "end up having, or seeming to have, these very different characteristics", and squaring that difference "with the fact that they seem to interact closely".

So there are two questions. The **ontological** question asks what minds and bodies are, and whether one is "nothing over and above" the other. The **causal** question asks whether each affects the other, and how. The classic answers form a triad: **materialism** or **physicalism** (mind, insofar as it exists, is fundamentally physical), **idealism** (matter is fundamentally mental) and **dualism** (both are real and fundamentally distinct). **Panpsychism**, which finds mentality throughout nature, is a fourth option that has recently gained prominence. In the PhilPapers survey of 2020, 51 per cent of philosophers accepted or leaned towards physicalism about the mind; asked separately about consciousness, 22 per cent favoured dualism and 8 per cent panpsychism.

What makes something mental at all? Brentano gave one answer in 1874:

```quote
Every mental phenomenon includes something as object within itself, although they do not do so in the same way. In presentation, something is presented, in judgment something is affirmed or denied, in love loved, in hate hated, in desire desired and so on.
Brentano · Psychology from an Empirical Standpoint, vol. 1 (English as quoted in the SEP) · 1874
```

This **intentionality**, being about or directed at something, is, he wrote, "characteristic exclusively of mental phenomena". A stone is not about anything. (Brentano offered this as one of six criteria for psychology's subject matter, and his meaning is debated.) A second mark is **phenomenal character**, "what it is like" to be a creature, in Nagel's phrase of 1974; many philosophers think explaining intentionality would not explain this. Rorty doubted any single mark exists. *Consciousness* treats phenomenal character; this chapter asks what minds are and whether they can act.

## Descartes's Arguments for Dualism

The chapter on *Descartes* sets out his main argument from the Sixth Meditation, with Arnauld's objection and the reply. The SEP strips it down: it is *conceivable* that my mind exist without my body; what is conceivable is possible; so my mind is a different thing from my body. The chief objection is that conceivability is no safe guide to possibility: that water is not H₂O seems conceivable, yet it is necessary. *Possibility and Necessity* follows that dispute and its modern heir, the zombie argument.

The same Meditation holds a second argument. "The body is by its very nature always divisible," Descartes wrote, "while the mind is utterly indivisible": considering himself as a thinking thing, "I am unable to distinguish any parts within myself" (translation by Cottingham, Stoothoff and Murdoch). In Justin Skirry's reconstruction in the Internet Encyclopedia of Philosophy (IEP):

1. I understand the mind to be indivisible by its very nature.
2. I understand body to be divisible by its very nature.
3. So the mind is completely different from the body.

Cut a pencil in half and you have two pieces of pencil; halve an "I" and you would have two selves, which is absurd.

**Objection.** Skirry notes that this version does not rest on clear and distinct perception, so "it is possible that Descartes is mistaken about the indivisibility of the mind": it might need a brain and so be extended and divisible. That I cannot *find* parts in my mind does not show that it has none.

**Reply.** Descartes's defender can fall back on the main argument, where God guarantees that what is clearly and distinctly understood can exist as understood. But that reopens the gap between conceiving and possibility, and Skirry's verdict stands: Descartes "has not adequately eliminated the possibility of minds being extended things like brains". Avicenna's "flying man", aware of himself but of no body, shares the structure and the objection (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*). Because Descartes joined dualism to a mechanical physics, interaction became, in the SEP's words, "the leading objection to dualism".

## Where Other Traditions Drew the Line

The SEP counts Sāṃkhya and Vaiśeṣika as detailed dualist theories, developed by Yoga and Nyāya; *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* tells their history. Īśvarakṛṣṇa's *Sāṃkhya-kārikā* (about 350 CE) is, in Ferenc Ruzsa's IEP words, "a strong Indian example of metaphysical dualism, but unlike many Western counterparts it is atheistic". There is one *prakṛti* (Nature, unconscious but purposeful) and many *puruṣas* (persons, pure and inactive consciousness). But on the material side Sāṃkhya puts the intellect (*buddhi*), "the locus of cognition, emotion, moral judgment and volition", the ego, and the mind (*manas*), which coordinates the senses and turns the intellect's commands into action. To compare, as this chapter does on its own account: Descartes put understanding, willing, imagining and sensing on the immaterial side; Sāṃkhya puts all of them in matter and leaves spirit only bare, witnessing awareness. Both are dualisms, but the line falls in a different place.

Sāṃkhya had its own interaction problem: "How can the inactive soul influence matter?" It answered with similes: Nature works for the person as unconscious milk flows to nourish the calf, and later authors said that consciousness illuminates the intellect, which reflects it like a mirror.

Nyāya drew the line elsewhere. Its self (*ātman*) is a substance whose qualities are desire, aversion, volition, pleasure, pain and cognition (*Nyāya-sūtra* 1.1.10); qualities need a substance, no material element bears these, so the self is non-material. Its *manas*, by contrast, is "an insentient psychological apparatus", atomic in size and distinct from both the self and the material elements. Buddhists did not tie mental events to "a substantive, independent, and enduring self"; whether the Abhidharma's fleeting mental and physical events (*dharmas*) make a dualism (the SEP on dualism) or a reduction of persons to psycho-physical processes (Christian Coseru) is debated (see *Self and No-Self: Personal Identity East and West*).

Aristotle offered a third way: "It is not necessary to ask whether soul and body are one, just as it is not necessary to ask whether the wax and its shape are one" (*De Anima* II.1, Christopher Shields's translation). This **hylomorphism**, the analysis of things into form and matter, "embraces neither reductive materialism nor Platonic dualism", showing those are "not exhaustive options" (see *Aristotle*). The Chinese *xin*, originally a picture of the heart, covers thinking and feeling and is often rendered "heart-mind". David Wong's SEP entry reports the dominant view that Chinese thought "is not dualistic in any fashion", against Slingerland and Goldin's case for a folk dualism. Yet the Tang Buddhist Guifeng Zongmi (780–841) asked a familiar question: if humans are endowed with *qi* "that lacks awareness, how can awareness suddenly arise?"

## How Could a Mind Move a Body?

{{image: Elisabeth of the Palatinate | Elisabeth of the Palatinate (1618–1680), whose letters to Descartes in 1643 asked how an unextended soul could move a body.}}

In May 1643 Elisabeth of Bohemia asked Descartes, in Lisa Shapiro's translation, "to tell me how the soul of a human being (it being only a thinking substance) can determine the bodily spirits, in order to bring about voluntary actions". *Descartes* and *Women Philosophers of the Early Modern Era* tell the story of their letters. In Anscombe and Geach's translation her reasoning runs:

1. A voluntary action requires the soul to *determine* the motion of the "animal spirits" in the body.
2. Motion is determined either by a push, which needs contact, or by the shape of the mover's surface, which needs extension.
3. But "you utterly exclude extension from your notion of soul, and contact seems to me incompatible with a thing's being immaterial".
4. So an immaterial soul cannot move the body: Descartes owes a new account of causation or of the soul.

**Objection.** This assumes a "billiard ball" picture of causation. If causation is only regular succession, as Hume held, the SEP observes, there is "no problem in principle". Descartes, replying to Gassendi's objections, rejected as unproved the assumption that two substances of different natures cannot act on each other.

**Reply.** The SEP entry by David Robb, John Heil and Sophie Gibb generalises her point: "Any causal relation requires a nexus, some interface by means of which cause and effect are connected", and a soul with no location has none. Humeans dispute that (see *Causation*). Descartes's own answer, that the union of soul and body is a basic or "primitive" notion, did not persuade her, and Gary Hatfield reads him as admitting he had no good answer. Elisabeth suggested it would be easier to grant the mind extension. (*Women Philosophers of the Early Modern Era* also gives Anne Conway's argument against dualism and Cavendish's thinking matter.)

Successors replaced interaction: for the **occasionalist** Nicolas Malebranche (1638–1715), God is the only true cause; Leibniz had God set mind and body in step from the start; Spinoza made them one thing under two attributes (see *Leibniz* and *Spinoza*).

The sharpest modern form of the problem comes from physics. The **completeness of the physical** says that "every physical effect has a sufficient physical cause"; Papineau argues that evidence for it explains materialism's rise in the 1950s and 1960s. Then:

1. Every physical effect has a sufficient physical cause.
2. Physical effects are not systematically overdetermined (they do not routinely have two independent sufficient causes).
3. Suppose souls routinely cause behaviour.
4. By (1), that behaviour also has a sufficient physical cause, so it is systematically overdetermined, contradicting (2).
5. So souls do not cause behaviour.

**Objection.** The interactionist can deny premise (1). C. D. Broad suggested in 1925 that a soul might redistribute energy without changing its quantity; others note that conservation laws hold only for causally isolated systems, which the interactionist denies the body is.

**Reply.** Premise (1) is an empirical claim, but conservation laws and the "no-gap" argument are offered in its support, and Kim called systematic overdetermination "absurd". The dualist who accepts the argument must say mind and body do not interact after all.

## Epiphenomenalism: the Steam Whistle

One dualist option says exactly that. **Epiphenomenalism** holds that "mental events are caused by physical events in the brain, but have no effects upon any physical events". Its best-known statement is T. H. Huxley's essay "On the Hypothesis that Animals are Automata, and its History" (1874), though his word was "automatism"; "epiphenomenalism" seems, the IEP says, to have entered in William James's *Principles of Psychology* (1890). Citing frogs that still swim with parts of their brains removed, Huxley held consciousness as powerless over the body "as the steam-whistle which accompanies the work of a locomotive engine is without influence upon its machinery":

```quote
The soul stands related to the body as the bell of a clock to the works, and consciousness answers to the sound which the bell gives out when it is struck.
T. H. Huxley · On the Hypothesis that Animals are Automata, and its History · 1874
```

What held for animals, he said, "holds equally good of men". The SEP notes an ancient precursor in Yoga–Sāṃkhya's inactive *puruṣa*. Objections recur. The view is deeply counterintuitive: the pain seems to make you cry. James asked why a powerless consciousness would have evolved; Jackson replied that the brain state evolves and the feeling is a by-product, like the heaviness of a polar bear's warm coat. But the coat's weight follows from the laws that make it warm, whereas brain–feeling laws would be unexplained extras, Herbert Feigl's "nomological danglers".

```checkpoint
q: How does Elisabeth's objection to Descartes work?
a*: Moving the body seems to require contact or extension, and Descartes's soul has neither.
a: She argues that the mind must be divisible, since thoughts come and go.
x: Divisibility is Descartes's own second argument for dualism; Elisabeth's objection concerns causation.
a: She argues that God alone moves bodies, so the soul does nothing.
x: That is Malebranche's occasionalism, a later response to the problem, not her objection.
a: She argues that consciousness is a by-product of the brain, like a steam whistle.
x: That is Huxley's view of 1874, later called epiphenomenalism.
hint: Think about the two ways, on the mechanical picture, that one thing can set another in motion.
why: Motion was thought to be determined by pushing (which needs contact) or by the mover's shape (which needs extension). Descartes's soul is unextended, so it seems unable to do either; the SEP generalises this as the demand for a causal nexus.
---
q: Why does the completeness of the physical threaten interactionist dualism?
a: Because it proves that souls do not exist.
x: The argument concludes only that souls do not cause behaviour; it is compatible with epiphenomenal or parallel souls.
a: Because it shows that the pineal gland is not a single organ.
x: Anatomy plays no role in the closure argument, which turns on causes and overdetermination.
a*: If every physical effect already has a sufficient physical cause, a soul's causing behaviour would make it systematically overdetermined.
a: Because it shows that mental states are behavioural dispositions.
x: That is a thesis of logical behaviourism, not a step in the closure argument.
hint: What would the soul's contribution be, if a physical cause already suffices?
why: Given completeness, any behaviour a soul caused would also have a sufficient physical cause. Since systematic overdetermination seems absurd, the soul is left without causal work, pushing dualists towards epiphenomenalism or parallelism.
```

## Behaviourism and the Ghost in the Machine

Many twentieth-century thinkers tried to dissolve the problem instead. George Graham's SEP entry distinguishes three **behaviourisms**. *Methodological* behaviourism says psychology should study behaviour, not inner states: John B. Watson's "Psychology as the Behaviorist Views It" (1913) made it "a purely objective experimental branch of natural science". *Psychological* behaviourism explains it by stimuli and reinforcement (B. F. Skinner). *Logical* behaviourism is a thesis about meaning: a mental state just is a disposition to behave. Carl Hempel held that meaningful psychological statements "are translatable into statements that do not involve psychological concepts".

Gilbert Ryle (1900–1976) called Cartesian dualism the "official doctrine" and, in *The Concept of Mind* (1949), "one big mistake and a mistake of a special kind. It is, namely, a category-mistake." In his example, paraphrased, a visitor shown Oxford's colleges and libraries asks, "But where is the University?", as if it were one more building rather than the way all he has seen is organised. Looking for the mind as a further thing behind intelligent behaviour is, Ryle argued, the same mistake. Graham counts Ryle a logical behaviourist; Julia Tanney argues that he held none of its tenets and attacked the "hidden-ness" of inner processes, ghostly or neural (see *Analytic Philosophy since 1950*; *Wittgenstein* explains why he, too, denied being a behaviourist).

Two objections proved decisive. The first is circularity. A desire to stay dry disposes you to carry an umbrella only if you believe it may rain, and that belief does so only if you want to stay dry; behavioural translations "almost always use mental terms themselves". The second is Putnam's "super-spartans", in "Brains and Behavior" (1963): people who feel pain but suppress their involuntary pain behaviour, and his still more extreme "X-worlders", who show no pain behaviour at all. They have pain without pain behaviour, while perfect actors have the behaviour without the pain.

## The Identity Theory

If minds are not behaviour, perhaps they are brains. U. T. Place's "Is Consciousness a Brain Process?" (1956), Feigl's "The 'Mental' and the 'Physical'" (1958) and J. J. C. Smart's "Sensations and Brain Processes" (1959) launched the **identity theory**: sensations are brain processes. Smart, then a follower of Ryle, converted after failing to refute Place. Their model was scientific discovery, as "lightning is an electric discharge". "Sensation" and "brain process" differ in meaning, as "morning star" and "evening star" do, yet may name one thing; and the identity is contingent, found by investigation. The stock example, "pain is C-fibre firing", is a philosophers' placeholder, not a finding of neuroscience.

Smart's main argument was simplicity: if sensations were merely correlated with brain processes, the correlations would be "nomological danglers"; identity explains them away. Max Black objected that terms differing in meaning must express different properties, smuggling mental properties back in. Smart replied that sensation reports are "topic-neutral": a report that something is going on which is like what goes on when an orange is in front of me with my eyes open leaves open whether that something is physical.

Distinguish **type** from **token**. The telegram "love and love and love" contains two word types and five tokens. Token identity says each particular pain is some particular physical event; type identity says pain, as a kind, is one kind of brain process.

## Multiple Realisability and Functionalism

Putnam's "Psychological Predicates" (1967) noted that mammals, birds, reptiles "and even mollusks (e.g., octopi)" seem to feel pain. In John Bickle's SEP form:

1. At least some mental kinds are multiply realisable by distinct physical kinds.
2. If a mental kind is multiply realisable by distinct physical kinds, it cannot be identical to any one of them.
3. So at least some mental kinds are not identical to any specific physical kind.

The argument is valid; premise (1) carries the weight. Type identity would need octopus and human, and any possible silicon android, to share one physical-chemical kind whenever in pain.

**Objection.** Lewis (1969) used a lottery: "the winning lottery number is 03" and "the winning lottery number is 61" conflict with "there is only one winning number" only until we add "per week". So pain may be C-fibre firing *in humans* and something else *in molluscs*. Bechtel and Mundale (1999) added that the argument describes minds coarsely and brains finely; at a common grain, brain mapping finds shared realisations across species.

**Reply.** Aizawa contests that reading of the neuroscience, and Gillett offers a more refined, "dimensioned" account of realisation. The debate is open, but the argument made **functionalism** the leading view.

Functionalism holds, in Janet Levin's SEP words, that what makes something a pain or a desire "depends not on its internal constitution, but solely on its function, or the role it plays" among inputs, other mental states and behaviour. Pain is whatever state injury causes and which causes the belief that something is wrong, the wish to be rid of it, and wincing. By defining the whole network of states at once, functionalism escapes behaviourism's circle; by letting octopus pain count, it is less "chauvinistic" than the identity theory. It is even neutral between materialism and dualism. Early versions modelled the mind on a Turing machine, the subject of *Minds and Machines: Could AI Think?*

Block's "Troubles with Functionalism" (1978) replied with a thought experiment. Recruit the population of China to duplicate one person's functional organisation for a time, linked to an artificial body by radio and satellite. Functionalism implies the system shares that person's mental states; Block found it hard to believe it would feel anything. Dennett, Lycan and Schwitzgebel answered that the intuition reflects prejudice against slow, scattered or unfamiliar systems. (The related inverted spectrum belongs to *Consciousness*.)

Davidson's **anomalous monism** ("Mental Events", 1970) reached token identity without psychophysical laws, and brought in **supervenience**: "mental characteristics are in some sense dependent, or supervenient, on physical characteristics", so nothing changes mentally without changing physically. The worry was immediate: if events cause in virtue of their physical properties, are mental properties idle, like the meaning of a soprano's words when her high note shatters a glass (Fred Dretske's example)?

## The Exclusion Problem

Kim (1934–2019) turned that worry into the field's central argument, aimed at **non-reductive physicalism**: the view, born of functionalism, that mental properties are realised by physical ones without being identical to them. In Dwayne Moore's IEP formulation four principles cannot all be true; the non-reductive physicalist accepts the first three, and Kim adds the fourth:

1. Some events have mental causes.
2. Every physical event that has a cause has a sufficient physical cause.
3. Mental causes of behaviour are distinct from physical causes of behaviour.
4. "No single event can have more than one sufficient cause occurring at any given time—unless it is a genuine case of causal overdetermination" (Kim 2005).

Jennie wants a peach and eats one. Her wanting is realised in a neural state that suffices for her hand's movement; so "what causal work is left" for the wanting? It seems, in the SEP's words, "causally idle, 'excluded'". Barns are rarely set alight by lightning and a dropped match at once, yet mental causation would be such a coincidence constantly. So, Kim concluded, reduce the mental or accept that it is epiphenomenal.

**Objection.** The argument proves too much. Biological and geological properties are also realised in lower-level physics, so it would exclude every special science; and if there is no bottom level, causation "drains away" altogether (Block, Fodor, Baker).

**Reply.** Kim answered that mental and physical are higher- and lower-order properties of one thing, not whole and parts, so the argument does not spread in that way. Others argue that mental properties inherit their realisers' powers (Yablo; Bennett) or are causally relevant without separate efficacy (Jackson and Pettit). Kim's own late view was "physicalism, or something near enough": beliefs and desires reduce functionally, while the intrinsic character of felt qualities is an irreducible "mental residue", though their similarities and differences can be reduced and keep a causal role. Whether minds cause anything, as *Causation* anticipated, depends on what causing is.

```checkpoint
q: What does Putnam's multiple-realisability argument show, if it is sound?
a: That mental states do not exist.
x: That is eliminative materialism; Putnam's conclusion presupposes that there are pains.
a*: That at least some mental kinds, such as pain, are not identical to any one physical kind.
a: That every mental event is a physical event.
x: That is token identity, which functionalists typically accept; the argument targets type identity.
a: That mental states are dispositions to behave.
x: That is logical behaviourism, which the super-spartans attack.
hint: Consider octopuses, humans and possible androids, all apparently in pain.
why: If pain occurs in creatures with very different physical make-ups, it cannot be identical to any one of their brain states. Lewis replied that identities can be restricted to a species or structure.
---
q: Which reply to Kim's exclusion argument says that it proves too much?
a: The reply that mental properties inherit their realisers' powers.
x: That accepts the argument's frame and seeks work for the mental within it; it is not the over-generalisation charge.
a: The reply that causation needs a nexus.
x: The demand for a nexus is the SEP's generalisation of Elisabeth's objection to Descartes.
a: The reply that conservation laws apply only to isolated systems.
x: That answers the closure argument against interactionist dualism.
a*: The reply that it would also exclude the causal powers of biology, geology and every special science.
hint: If the argument excludes mental causes, what else is realised in lower-level physics?
why: Block, Fodor and Baker argue that biological and geological properties are realised in physics too, so causation would drain from every level above the bottom. Kim replied that mental and physical are higher- and lower-order properties of one thing, not whole and part.
```

## Two Exits: Elimination and Emergence

**Eliminative materialism** cuts the knot. Common-sense or "folk" psychology, which explains behaviour by beliefs and desires, is a theory, in Paul Churchland's 1981 words "a radically false theory", whose posits may not exist, like phlogiston and vital force. Folk physics proved wrong, so, as William Ramsey's SEP entry puts the argument, it would be strange if folk psychology alone had got things right. The classic objection, from Baker and Boghossian:

1. To assert something sincerely, one must believe it.
2. Eliminativists assert that there are no beliefs.
3. So they believe it.
4. So there are beliefs, and eliminativism is false.

**Reply.** Patricia Churchland, Devitt and others answer that "there are no beliefs" is not a contradiction, and premise (1) is itself folk psychology, so the objection begs the question. Other critics deny that folk psychology is a theory at all.

**Emergentism** takes the opposite path. J. S. Mill's *System of Logic* (1843) allowed organised wholes new "heteropathic" laws, and C. D. Broad's *The Mind and Its Place in Nature* (1925) held that some wholes' properties "cannot, even in theory, be deduced from the most complete knowledge" of their parts, though "completely determined" by them; his examples came from chemistry, though he saw no a priori impossibility in a mechanistic chemistry. Strong emergentists of this kind deny causal closure. Quantum chemistry and molecular biology eroded their examples, though the idea has revived since the 1970s.

India had a comparable view far earlier. As *Jains, Ājīvikas and Materialists: India's Other Dissenters* explains, the Cārvāka materialists held that consciousness arises from the four elements in the right proportion though none has it alone, "like emergence of red colour from the chewing of beetle-nut" (betel nut) and other ingredients; the self "is nothing but a conscious body". Mādhava's fourteenth-century *Sarvadarśanasaṃgraha*, as secondary sources summarise it, adds another traditional comparison: the intoxicating power that arises when certain ingredients are mixed. Most interpreters read this as reductive, but Jonardon Ganeri reads it as non-reductive supervenience, and Peter Adamson and Ganeri, comparing the Cārvākas with Mill's emergentism, liken Mill's view to the Cārvāka one. Amita Chatterjee adds that among Indian schools "only Cārvāka hints at the causal closure of the physical world". Old emergentism thus meets the modern dilemma: if emergent consciousness has its own powers, closure fails; if not, exclusion returns.

## Where the Problem Stands

Around 2000 it was widely held that substance dualism was no longer respectable but **property dualism**, one physical thing with irreducibly mental properties, had to be taken seriously. Its chief supports, Jackson's knowledge argument and Chalmers's zombies, belong to *Consciousness* and *Possibility and Necessity*. Jackson later became a materialist, Chalmers has expressed a preference for substance dualism over property dualism, Ralph Weir argues that substance dualism deserves serious attention, and Martine Nida-Rümelin defends a "subject-body dualism". The causal question Elisabeth pressed in 1643 has become Kim's exclusion problem. Whether such minds act freely, and what a self is, continue in *Free Will and Determinism* and *Self and No-Self: Personal Identity East and West*.

## Further exploration

- **Gilbert Ryle, *The Concept of Mind* (1949).** The "ghost in the machine" and the category-mistake attack on Cartesian dualism; reissued in 2000 with an introduction by Daniel Dennett.
- **Paul M. Churchland, *Matter and Consciousness* (1984).** A short, clear survey of dualism, behaviourism, the identity theory, functionalism and eliminativism by the leading eliminativist.
- **Jaegwon Kim, *Mind in a Physical World* (1998).** The exclusion argument and the problem of mental causation at book length.
- **Lisa Shapiro (ed. and trans.), *The Correspondence between Princess Elisabeth of Bohemia and René Descartes* (2007).** The interaction exchange in full.
- **Jonardon Ganeri, *The Self: Naturalism, Consciousness, and the First-Person Stance* (2012).** Classical Indian theories of self and consciousness in dialogue with contemporary philosophy of mind.
- **Peter Adamson and Jonardon Ganeri, *Classical Indian Philosophy* (2020).** An accessible history, including the comparison of the Cārvākas with Mill.
- **Ralph Weir, *The Mind-Body Problem and Metaphysics* (2023).** A recent case for taking dualism, including substance dualism, seriously.$mindbody_master$,
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
  select $mindbody_quiz$[
    {"type": "mcq", "prompt": "Where does Sāṃkhya place the intellect (buddhi), ego and mind (manas), and how does this differ from Descartes?", "options": ["On the material side, as evolutes of prakṛti, leaving puruṣa only pure, inactive awareness; Descartes put understanding, willing and sensing in the immaterial mind", "On the side of puruṣa, exactly as Descartes put thought in the immaterial mind", "Nowhere, because Sāṃkhya denies that there are minds at all", "In God, who thinks on behalf of each person, as occasionalists held"], "answerIndex": 0, "explanation": "Sāṃkhya is a dualism, but intellect, ego and mind evolve from Nature (prakṛti); only witnessing consciousness belongs to the person (puruṣa). Descartes put thought, will and sensation on the immaterial side, so the line between the two substances falls in a different place.", "id": "q1"},
    {"type": "mcq", "prompt": "What was T. H. Huxley's own name for the view, set out in his 1874 essay, that consciousness has no effect on the body?", "options": ["Occasionalism", "Epiphenomenalism", "Automatism", "Emergentism"], "answerIndex": 2, "explanation": "Huxley's term was 'automatism'; the word 'epiphenomenalism' does not occur in his essay and seems, according to the IEP, to have entered with William James's Principles of Psychology (1890). His images were a locomotive's steam whistle and a clock's bell.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the point of Putnam's 'super-spartans' in 'Brains and Behavior'?", "options": ["They show that pain is identical to C-fibre firing", "They feel pain yet show no pain behaviour, so pain cannot simply be a pattern of behaviour", "They show that the population of China could duplicate a mind", "They show that folk psychology is a false theory"], "answerIndex": 1, "explanation": "The super-spartans suppress their involuntary pain behaviour (Putnam's later 'X-worlders' show none at all), so they have pain without pain behaviour; perfect actors have the behaviour without the pain. Logical behaviourism cannot accommodate either case.", "id": "q3"},
    {"type": "mcq", "prompt": "Which reply to the multiple-realisability argument did David Lewis make with his lottery example?", "options": ["That pain does not exist", "That octopuses do not really feel pain", "That functionalism is neutral between materialism and dualism", "That identities can be restricted to a domain, so pain can be one physical state in humans and another in molluscs"], "answerIndex": 3, "explanation": "'The winning lottery number is 03' and 'the winning lottery number is 61' conflict with 'there is only one winning number' only until we add 'per week'. Likewise 'pain is C-fibre firing in humans' is consistent with pain being something else in molluscs.", "id": "q4"},
    {"type": "open", "prompt": "Set out Kim's exclusion argument against non-reductive physicalism, using the example of Jennie and the peach, and assess the objection that it 'proves too much'.", "rubric": "A strong answer states the four principles: some events have mental causes; every physical event that has a cause has a sufficient physical cause; mental causes are distinct from physical ones; and no event has more than one sufficient cause at a time unless it is genuinely overdetermined. It explains that non-reductive physicalists accept the first three, so with the fourth the mental property is left causally idle: Jennie's wanting is realised in a neural state that already suffices for her eating the peach, and treating every case as overdetermination would be a constant coincidence (lightning and match). It explains the generalisation or 'causal drainage' objection (Block, Fodor, Baker): biological and geological properties are realised in physics too, so the argument would exclude them, and with no bottom level all causation drains away. It gives Kim's reply that mental and physical are higher- and lower-order properties of one thing, not whole and part, and may mention inheritance replies (Yablo, Bennett), Jackson and Pettit's causal relevance, and Kim's own view that intentional states reduce functionally while qualia's intrinsic character is an irreducible residue.", "id": "q5"},
    {"type": "open", "prompt": "Explain Elisabeth of Bohemia's 1643 objection to Descartes as a step-by-step argument, then explain how the completeness of the physical turns her worry into a modern argument against interactionist dualism. Which premise would you reject, and why?", "rubric": "A strong answer sets out her steps: voluntary action needs the soul to determine the motion of the bodily spirits; motion is determined by impulsion (needing contact) or by the mover's shape (needing extension); Descartes's soul is unextended and contact seems incompatible with immateriality; so the soul cannot move the body. It notes the Humean objection that causation need not involve contact (the SEP: 'no problem in principle'), Descartes's reply to Gassendi, and the SEP's generalisation that causation needs a nexus. It then gives the closure argument: every physical effect has a sufficient physical cause; there is no systematic overdetermination; so souls cannot cause behaviour, pushing dualists towards epiphenomenalism or parallelism. It discusses a reply, such as denying completeness (Broad's redistribution of energy; conservation laws hold only for isolated systems) or accepting overdetermination, and defends a judgement.", "id": "q6"}
  ]$mindbody_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/philosophy-of-mind/mind-body-problem', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
