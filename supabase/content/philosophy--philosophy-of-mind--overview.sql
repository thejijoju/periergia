-- Mind — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/philosophy-of-mind @ research/advanced/read.
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
    'philosophy/philosophy-of-mind',
    'research',
    'advanced',
    'read',
    $mindov_master$> **The philosophy of mind asks what minds are and how they fit into a world that physics describes.** This overview shows how the section's four chapters fit together: the mind–body problem; consciousness; the self; and whether a machine could think. It then follows four questions through them: what "physical" rules out, and whether minds can cause anything; whether there is one gap between brain and mind or several, and what makes a mind one thing rather than many; how Indian, Chinese and Buddhist thinkers drew the lines differently; and whether minds need brains, and how we could know that another being, human, animal or machine, has one.

## What the Philosophy of Mind Asks

You decide to raise your hand, and it rises. *The Mind–Body Problem* begins there: the hand has a size, a weight and a position, and the decision seems to have none of these. The Stanford Encyclopedia of Philosophy (SEP) entry on dualism, by Howard Robinson and Ralph Weir, states the problem as explaining how beings like us "end up having, or seeming to have, these very different characteristics", and squaring that difference "with the fact that they seem to interact closely".

So there are two questions. The **ontological** question asks what minds and bodies are, and whether one is "nothing over and above" the other. The **causal** question asks whether each affects the other, and how. The classic answers are **physicalism** (mind, insofar as it exists, is fundamentally physical), **idealism** (matter is fundamentally mental) and **dualism** (both are real and fundamentally distinct); **panpsychism**, which finds mentality throughout nature, is a fourth option that has recently gained prominence. In the PhilPapers survey of 2020, 51 per cent of philosophers accepted or leaned towards physicalism about the mind; asked separately about consciousness, 22 per cent favoured dualism and 8 per cent panpsychism.

What makes something mental at all? The first chapter offers two marks. Brentano held in 1874 that **intentionality**, being about or directed at something, is "characteristic exclusively of mental phenomena": a stone is not about anything. The second is **phenomenal character**, "what it is like" to be a creature, in Thomas Nagel's phrase of 1974, and many philosophers think that explaining intentionality would not explain it.

On this overview's reading, the two marks divide the section's work. *The Mind–Body Problem* asks what minds are and whether they can act. *Consciousness* takes phenomenal character. *Self and No-Self: Personal Identity East and West* asks whether there is a subject who has the thoughts, or only the thoughts. And *Minds and Machines: Could AI Think?* asks whether something other than a living creature could have a mind, splitting the question into three: one about **intelligence** (could a machine behave as flexibly as a thinking person?), one about **understanding** (does it grasp what its words mean?) and one about **consciousness** (is there anything it is like to be it?).

## What Minds Are

*The Mind–Body Problem* starts from Descartes. The SEP strips his main argument down: it is conceivable that my mind exist without my body; what is conceivable is possible; so my mind is a different thing from my body. The chief objection is that conceivability is no safe guide to possibility: that water is not H₂O seems conceivable, yet it is necessary.

In May 1643 Elisabeth of Bohemia asked Descartes, in Lisa Shapiro's translation, "to tell me how the soul of a human being (it being only a thinking substance) can determine the bodily spirits, in order to bring about voluntary actions". Motion, she reasoned, is determined either by a push, which needs contact, or by the shape of the mover's surface, which needs extension, and Descartes's soul has neither. The SEP generalises her point: "Any causal relation requires a nexus, some interface by means of which cause and effect are connected". Descartes's answer, that the union of soul and body is a basic or "primitive" notion, did not persuade her.

The twentieth century tried other answers. **Behaviourism** made a mental state a disposition to behave, and Gilbert Ryle called Cartesian dualism a "category-mistake". It foundered on circularity (a desire to stay dry disposes you to carry an umbrella only if you believe it may rain) and on Putnam's "super-spartans", who feel pain but suppress their involuntary pain behaviour. The **identity theory** of Place, Feigl and Smart held that sensations are brain processes. Putnam's **multiple realisability** argument answered that mammals, birds, reptiles "and even mollusks (e.g., octopi)" seem to feel pain, so pain cannot be identical to any one physical kind. That argument made **functionalism** the leading view: what makes something a pain depends, in Janet Levin's SEP words, "not on its internal constitution, but solely on its function, or the role it plays" among inputs, other mental states and behaviour.

The chapter ends with two exits from the problem. **Eliminative materialism** holds that common-sense psychology is, in Paul Churchland's 1981 words, "a radically false theory". **Emergentism**, from Mill and C. D. Broad, holds that some wholes have properties that "cannot, even in theory, be deduced from the most complete knowledge" of their parts. Around 2000 it was widely held that substance dualism was no longer respectable but that **property dualism**, one physical thing with irreducibly mental properties, had to be taken seriously; today Ralph Weir argues that substance dualism deserves serious attention. Elisabeth's causal question, the chapter concludes, has become Kim's exclusion problem.

## What It Is Like

*Consciousness* begins by sorting the meanings of "conscious", among them the **qualia** of experience: what the Merlot you are drinking tastes like to you. Ned Block drew the distinction that organises much of the debate. A state is **phenomenally conscious** if there is something it is like for the subject to be in it, and **access-conscious**, in Block's own words, if it is "poised for free use in reasoning and for direct 'rational' control of action and speech".

Nagel's bat argument concluded not that physicalism is false but that we do not at present understand how it could be true. In 1983 Joseph Levine named the **explanatory gap**: from the claim that pain is the firing of C fibres, nothing tells us why that firing should feel like anything at all. David Chalmers separated the **easy problems**, explaining how a system discriminates, integrates information and reports, from the **hard problem**, why all this is accompanied by feeling. His argument turns on the conceivability of a **zombie**, physically and functionally like us but without experience, and ends in a "naturalistic dualism" that makes consciousness a fundamental feature of nature. Physicalists answer with the **phenomenal concept strategy**, on which we have two kinds of concept for one thing; **illusionists** such as Keith Frankish deny that phenomenal properties exist at all. In the 2020 PhilPapers survey about 62 per cent of philosophers agreed that the hard problem is real and about 30 per cent disagreed.

The chapter follows Frank Jackson's Mary, who knows every physical fact about colour vision yet seems to learn something when she first sees red, into its deeper replies; sets out **higher-order theories**, on which a state is conscious when the subject represents being in it, and the case for panpsychism; asks, with Indian philosophers, whether awareness knows itself; and turns to science. There, an adversarial test of the two leading theories, global workspace and integrated information, published in *Nature* on 30 April 2025, matched some predictions of each and challenged key claims of both, without settling the contest. Whether the hard problem marks a limit of the human mind, a confusion in our concepts or a clue to the nature of matter is, the chapter concludes, still the open question.

```checkpoint
q: What did Putnam's multiple-realisability argument show, if it is sound, and what did it do for the field?
a*: That some mental kinds, such as pain, are not identical to any one physical kind; it made functionalism the leading view.
a: That mental states do not exist, which launched eliminative materialism.
x: The argument presupposes that octopuses and humans really are in pain; eliminativism is a separate exit, argued from the falsity of folk psychology.
a: That every mental state is a disposition to behave, which revived behaviourism.
x: Behaviourism had already foundered on circularity and the super-spartans; Putnam's argument targets the identity theory.
a: That consciousness is a fundamental feature of nature, which led to naturalistic dualism.
x: Naturalistic dualism is Chalmers's conclusion from the hard problem, not Putnam's from multiple realisability.
hint: Think of the octopus.
why: If creatures with very different physical make-ups can all be in pain, pain cannot be one physical kind. Functionalism, which defines a state by its role, lets octopus pain count.
---
q: How did Ned Block define access consciousness?
a: As there being something it is like for the subject to be in a state.
x: That is phenomenal consciousness, the other half of Block's distinction.
a: As the subject's being aware that it is aware.
x: That is self-consciousness, one of the senses of "conscious" said of whole creatures.
a*: As a state's being "poised for free use in reasoning and for direct 'rational' control of action and speech".
a: As a state's being broadcast in a brain-wide workspace.
x: That is global workspace theory, a scientific theory of consciousness, not Block's definition.
hint: Access to what, and for what use?
why: Block's warning was that a function of access consciousness is easily credited to phenomenal consciousness; the hard problem concerns the phenomenal kind.
```

## Who Has the Mind

*Self and No-Self: Personal Identity East and West* begins with a warning from Eric Olson's SEP entry: "self" is "sometimes synonymous with 'person', but often means something different: a sort of unchanging, immaterial subject of consciousness". When Hume and the Buddhists deny the self, the chapter stresses, they are mostly denying the second thing, not that there are people. It separates the **persistence question** (what makes some past or future being me?) from Marya Schechtman's **characterisation question** ("Who am I?" in the everyday sense).

Hume's argument, set out step by step, finds on looking inward no constant impression from which an idea of a simple, lasting self could be copied, only particular perceptions; so far as we can conceive it, the mind is a bundle of them. Reid replied that we know our own identity "immediately, and not by reasoning", and Kant that the "I think" must be able to accompany all my representations.

The Buddhist philosophers, in Mark Siderits's reconstruction, built a **reductionism** on the doctrine of two truths: ultimately there is "a causal series of impermanent, impersonal psychophysical elements", and persons are a useful fiction, real conventionally because identifying with one's future reduces suffering. Vasubandhu held that the apparent subject of experience is itself part of what is constructed. Nyāya answered with **cross-modal recognition**: to judge that the thing I see is the thing I am touching needs one subject who has both, and neither eye nor skin has both. Advaita Vedānta reversed Hume: the self is never caught because it is the catcher. In the *Zhuangzi* Ziqi says he has "lost myself", a passage David Wong calls a "Hume-like reflection", and Confucian thinkers are often read as treating the self as relational.

The chapter ends with the modern debate: Thomas Metzinger's **self-model** and Dennett's self as "a center of narrative gravity"; the split-brain patient whose left hemisphere explained that "the shovel is for cleaning out the chicken coop"; the claim that a self is a story, and Galen Strawson's attack on it; and Derek Parfit's conclusion that what matters is psychological continuity and connectedness, not identity as such. "There is still a difference between my life and the lives of other people," Parfit wrote. "But the difference is less." Christine Korsgaard replied that agency requires us to treat ourselves as unified, since "you have only one body with which to act".

## Whether a Machine Could Have One

*Minds and Machines: Could AI Think?* opens with old stories of made people, from the *Liezi* to the Talmud, which already ask how one would tell. Descartes, in the *Discourse on the Method* (1637), gave two tests that, he held, no machine could pass: replying appropriately to everything said in its presence, and acting flexibly "in all the events of life" as reason does. He applied them to animals, which he thought fail both.

{{image: Turing test | The standard version of Turing's imitation game: an interrogator questions a human and a machine by written messages and must say which is which.}}

Ada Lovelace's Note G of 1843 said that the Analytical Engine "has no pretensions whatever to *originate* anything". Alan Turing, in 1950, replaced the question "Can machines think?" with the **imitation game**, in which an interrogator, communicating by teletype, must tell which party is the machine. To Geoffrey Jefferson's demand that a machine feel the thoughts and emotions behind its sonnet, Turing gave what is now called the "other minds reply": taken strictly, that demand leads to solipsism, since the same would hold for other people. Ned Block's Blockhead, a look-up tree with a stored reply for every input, answered that passing the test is not logically sufficient for intelligence; Weizenbaum's ELIZA showed how readily people project understanding onto simple programs.

John Searle's Chinese Room is the most discussed objection to **strong AI**, the claim that the appropriately programmed computer "really is a mind". A man who knows no Chinese follows a rule book and passes out correct answers in Chinese, identifying the symbols "entirely by their shapes"; Searle concluded that running a program is not enough for understanding: syntax, the formal shape of symbols, is by itself not sufficient for semantics, their meaning. Of the replies, the SEP's verdict is that "there is no consensus". Stevan Harnad generalised the worry into the **symbol grounding problem**; the chapter adds the Lucas–Penrose argument from Gödel's theorem and Hubert Dreyfus's critique.

The chapter ends, as of 2026, with **large language models**. In pre-registered three-party tests reported by Jones and Bergen (published in *PNAS* in May 2026), GPT-4.5, prompted to adopt a humanlike persona, was judged to be the human 73 per cent of the time; critics such as Gary Marcus say such results show how easy it is to fool humans. Whether passing shows understanding is argued through Bender and Koller's octopus, which learns the patterns on an undersea cable and impersonates a speaker until asked how to fend off a bear. Consciousness is a further question: David Chalmers, in a lecture of 2022 published in 2023, put his credence in current LLM sentience tentatively at "<10%?", and a 2023 report by Patrick Butlin, Robert Long and seventeen co-authors concluded that "no current AI systems are conscious", though it found no obvious technical barriers to building systems that satisfy its indicators. Every figure here, the chapter warns, is dated.

## Questions That Run Through the Section

### What "physical" rules out

The sharpest modern form of the mind–body problem, *The Mind–Body Problem* explains, comes from physics. The **completeness of the physical** says that "every physical effect has a sufficient physical cause". If, in addition, physical effects are not systematically overdetermined, souls cannot cause behaviour, since any behaviour a soul caused would already have a sufficient physical cause. Interactionists can deny completeness: C. D. Broad suggested in 1925 that a soul might redistribute energy without changing its quantity. But Jaegwon Kim turned the same reasoning against physicalists who hold that mental properties are realised by physical ones without being identical to them. Jennie wants a peach and eats one; her wanting is realised in a neural state that suffices for the movement of her hand; so what causal work is left for the wanting? So, Kim concluded, reduce the mental or accept that it is epiphenomenal. Critics answer that the argument proves too much, since it would exclude the causal powers of biology and geology as well.

On this overview's reading, **epiphenomenalism**, the view that mental events are caused by brain events but have no physical effects, is the price that recurs across the section whenever closure is accepted and reduction refused. T. H. Huxley compared consciousness to the steam whistle of a locomotive; *Consciousness* reports that Jackson concluded by 1995 that if qualia have no effects we could not know about them, so something must be wrong with his knowledge argument; and *Minds and Machines: Could AI Think?* ends with David Cole's warning that if machines one day use language as well as humans and are still said not to understand, "'Really' understanding becomes epiphenomenal: undetectable, causally inert, and irrelevant."

The chapters also bear on what "physical" means, though none sets out to define it; the connection is this overview's own. Functionalism, *The Mind–Body Problem* notes, is even neutral between materialism and dualism. Russellian monism, in *Consciousness*, observes that physics describes only how matter is structured and what it does, leaving out the intrinsic nature that does it, which might be experiential. And the old emergentism meets the modern dilemma: if emergent consciousness has its own powers, closure fails; if not, exclusion returns.

### One gap or several; one mind or many

The section names more than one gap. Levine's explanatory gap and Chalmers's hard problem concern feeling. On this overview's reading, Searle's premise that syntax is not sufficient for semantics, and Harnad's question of how a symbol system's meaning could be "intrinsic to the system, rather than just parasitic on the meanings in our heads", mark a second gap, about meaning, which corresponds to the first chapter's mark of intentionality. The chapters themselves keep the two apart: *Minds and Machines: Could AI Think?* insists that a yes to its question about understanding need not bring a yes to its question about consciousness, and Kim's late view was that beliefs and desires reduce functionally while the intrinsic character of felt qualities is an irreducible "mental residue".

A second thread, also drawn out by this overview, is unity: what makes many things one mind? The Nyāya cross-modal argument says comparison needs a single subject; the Buddhist reply is that causal integration within one stream is enough. Split-brain patients, studied by Roger Sperry and Michael Gazzaniga, seem unified in daily life, yet in the laboratory behave as if there were two independent centres of consciousness. For panpsychism, the problem runs the other way: tiny experiences must somehow add up to ours. William James posed it in 1890:

```quote
let each think of his word as intently as he will; nowhere will there be a consciousness of the whole sentence.
William James · The Principles of Psychology, vol. 1 · 1890
```

The same question returns, on this overview's reading, in Block's population of China duplicating one person's functional organisation, in the Systems Reply's claim that the whole room understands though the man does not, and in the Churchlands' remark that "no neuron in my brain understands English, although my whole brain does". Hume's bundle and Siderits's causal series answer it by denying that there is any further unifier; Reid, Kant, Nyāya and Advaita, in their different ways, deny that the answer is enough.

```checkpoint
q: What did Kim conclude from his exclusion argument?
a: That souls redistribute energy without changing its quantity.
x: That was Broad's suggestion of 1925, offered on behalf of interactionist dualism against completeness.
a*: That the non-reductive physicalist must either reduce the mental or accept that it is epiphenomenal.
a: That causation needs a nexus, which an unextended soul lacks.
x: That is the SEP's generalisation of Elisabeth's objection to Descartes.
a: That folk psychology is a radically false theory.
x: That is Paul Churchland's eliminativism, a different exit from the problem.
hint: If Jennie's neural state already suffices for her hand's movement, what is left for her wanting to do?
why: If every physical event has a sufficient physical cause and mental causes are distinct from physical ones, the mental cause seems excluded. Critics reply that the argument proves too much, excluding biology and geology too.
---
q: What does James's image of twelve men, each thinking one word of a sentence, illustrate?
a: The explanatory gap between C-fibre firing and pain.
x: Levine's gap concerns why a physical process should feel like anything; James's image concerns combining experiences.
a: Hume's claim that the mind is a bundle of perceptions.
x: James's point is not Hume's, though the overview links them: it is that separate experiences do not add up to one.
a: The Nyāya argument that seeing and touching need one subject.
x: The Nyāya argument concludes that there is a single self; James's image shows that many minds do not make one.
a*: The combination problem for panpsychism: separate experiences need not add up to a larger subject.
hint: Nowhere is there a consciousness of the whole sentence.
why: If tiny experiences do not combine into a larger subject, the panpsychist argument does not explain our consciousness. The SEP calls this "the hardest problem facing panpsychism".
```

### How the traditions drew the lines

Sāṃkhya is, in Ferenc Ruzsa's words, "a strong Indian example of metaphysical dualism", yet it puts the intellect (*buddhi*), the seat of cognition, emotion and will, on the material side and leaves the self (*puruṣa*) only pure, witnessing consciousness. *Consciousness* calls this almost the reverse of the modern view that cognition is the easy part. Nyāya made the self a substance whose qualities include desire, cognition and pleasure. The Cārvāka materialists held that consciousness arises from the four elements in the right proportion, though none has it alone. In China, *xin*, often rendered "heart-mind", covers thinking and feeling; Wong reports the dominant view that Chinese thought "is not dualistic in any fashion", against Slingerland and Goldin's case for a folk dualism, yet the Tang Buddhist Guifeng Zongmi asked how awareness could "suddenly arise" from *qi* "that lacks awareness".

Some Indian debates run parallel to modern ones, and the chapters draw the parallels themselves. Dignāga and Dharmakīrti held that every cognition is aware of itself, like a lamp that lights itself; Nyāya held that cognitions are known by later cognitions, a view the SEP's entry on Śaṅkara calls "more akin to contemporary higher order theories". Dharmakīrti argued against the materialists that if consciousness arose from the elements, it ought, in Christian Coseru's summary, to arise whenever the elements occur, which is to say everywhere, which *Consciousness* calls a close Indian precedent for the panpsychist argument, and Miri Albahari has drawn on Advaita Vedānta to propose a successor to cosmopsychism. The Buddhist reductionist, Coseru stresses, following Siderits, "is not an eliminativist": persons are conventional, not nonexistent. On this overview's reading, the traditions differed less in their answers than in what they took to need explaining: for Sāṃkhya and Advaita the hardest thing to place was the witnessing consciousness, not the thinking, which Sāṃkhya assigned to matter.

### Do minds need brains, and how could we tell?

Functionalism lets silicon in principle realise a mind. Searle, who did not deny that machines can think, since brains are machines, held instead that conscious states are caused by neurobiological processes (**biological naturalism**). *Minds and Machines: Could AI Think?* sets out the older Nyāya argument as numbered steps:

1. Desire, cognition, pleasure, pain and volition are qualities.
2. All qualities inhere in substances.
3. So there is a substance to which they belong.
4. None of the material elements, such as earth and water, bears desire and the rest.
5. So there is a special non-material substance: a self (*ātman*).

The Cārvākas rejected premise 4. The chapter's verdict is that premise 4 is the hinge: whoever accepts it for flesh can hardly deny it for silicon, and whoever rejects it holds what any friend of machine minds needs, that organised matter can bear cognition.

Knowing another mind is, on this overview's reading, the section's most persistent difficulty. Locke supposed that one man's idea of a violet might be another's idea of a marigold, which "could never be known"; Nagel argued that a complete physical account would leave out what it is like to be a bat; Turing's other minds reply turned the difficulty into a standard, asking only for as much reason to credit machines with thought as we have for other people; Descartes judged that animals fail his tests. For animals, the New York Declaration of 2024 found "at least a realistic possibility" of experience in all vertebrates and many invertebrates, though Hakwan Lau argued that it overstates the evidence even for mammals and birds. For machines, the chapter keeps its verdicts dated and hedged: Blake Lemoine's claim in 2022 that the LaMDA system was sentient was, *Minds and Machines: Could AI Think?* suggests, arguably the ELIZA effect writ large, while Chalmers thought it "quite possible" that the obstacles to consciousness in current models would be overcome "in the next decade or so".

## The Chapters

- *The Mind–Body Problem*: Descartes and Elisabeth, Sāṃkhya, Nyāya, Aristotle and the heart-mind, epiphenomenalism, behaviourism, the identity theory, functionalism, Kim's exclusion problem, elimination and emergence.
- *Consciousness*: Block's distinction, Nagel's bat, the hard problem, Mary, higher-order theories, panpsychism, reflexive awareness in India, and the science.
- *Self and No-Self: Personal Identity East and West*: Hume and Reid, Buddhist reductionism, the Nyāya argument, Advaita's witness, the *Zhuangzi* and Confucian selves, self-models, split brains, narrative and Parfit.
- *Minds and Machines: Could AI Think?*: made people, Descartes's tests, Lovelace and Turing, Blockhead, the Chinese Room, symbol grounding, Gödel and Dreyfus, the Nyāya argument, and large language models as of 2026.

The questions continue in *Identity, Change and Persons*, *Possibility and Necessity*, *Causation*, *Free Will and Determinism*, *Perception and the External World*, *Animals and the Environment* and *Ethics of Technology and AI*.

## Further exploration

- **Paul M. Churchland, *Matter and Consciousness* (1984).** A short, clear survey of dualism, behaviourism, the identity theory, functionalism and eliminativism by the leading eliminativist.
- **Jaegwon Kim, *Mind in a Physical World* (1998).** The exclusion argument and the problem of mental causation at book length.
- **Philip Goff, *Galileo's Error: Foundations for a New Science of Consciousness* (2019).** An accessible case for panpsychism and Russellian monism.
- **Mark Siderits, Evan Thompson and Dan Zahavi (eds.), *Self, No Self? Perspectives from Analytical, Phenomenological, and Indian Traditions* (2010).** The standard cross-cultural collection on the self.
- **Jonardon Ganeri, *The Self: Naturalism, Consciousness, and the First-Person Stance* (2012).** Classical Indian theories of self and consciousness in dialogue with contemporary philosophy of mind.
- **Stuart M. Shieber (ed.), *The Turing Test: Verbal Behavior as the Hallmark of Intelligence* (2004).** Turing's paper together with the main responses to it.
- **Jonathan Birch, *The Edge of Sentience: Risk and Precaution in Humans, Other Animals, and AI* (2024).** Sentience at the boundaries, by a co-author of the New York Declaration.$mindov_master$,
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
  select $mindov_quiz$[
    {"type": "mcq", "prompt": "Where does Sāṃkhya, as the overview describes it, place the intellect (buddhi), the seat of cognition, emotion and will?", "options": ["In the self (puruṣa), as Descartes placed thought in the immaterial mind", "Nowhere, since Sāṃkhya denies that cognition exists", "On the material side, leaving the self only pure, witnessing consciousness", "In the heart-mind (xin), which covers thinking and feeling"], "answerIndex": 2, "explanation": "Sāṃkhya is a dualism, but the intellect belongs to material nature (prakṛti), and the self (puruṣa) is only pure, witnessing consciousness. Consciousness calls this almost the reverse of the modern view that cognition is the easy part. Xin is the Chinese term, not a Sāṃkhya one.", "id": "q1"},
    {"type": "mcq", "prompt": "How did Turing answer Geoffrey Jefferson's demand that a machine feel the thoughts and emotions behind what it writes?", "options": ["He conceded that machines could never think", "With the 'other minds reply': taken strictly, the demand leads to solipsism, since the same would hold for other people", "By arguing that the Analytical Engine could originate new truths", "By building a look-up tree with a stored reply for every input"], "answerIndex": 1, "explanation": "If only being the machine could show that it thinks, the same would be true of other people; Turing asked only for as much reason to credit machines with thought as we have for other humans. The look-up tree is Block's Blockhead, an objection to the test.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about Kim's exclusion argument is correct, according to the overview?", "options": ["It defends interactionist dualism against the completeness of the physical", "It shows that causation needs a nexus, which an unextended soul lacks", "It concludes that folk psychology is a radically false theory", "It concludes that non-reductive physicalists must reduce the mental or accept that it is epiphenomenal, and critics say it proves too much"], "answerIndex": 3, "explanation": "Jennie's wanting is realised in a neural state that already suffices for her hand's movement, so the wanting seems to have no causal work left. Critics reply that the argument would also exclude the powers of biology and geology. The nexus demand is the SEP's generalisation of Elisabeth's objection; the 'radically false theory' is Churchland's eliminativism.", "id": "q3"},
    {"type": "mcq", "prompt": "What distinction did David Chalmers draw between the 'easy problems' and the 'hard problem' of consciousness?", "options": ["The easy problems concern how a system discriminates, integrates information and reports; the hard problem asks why all this is accompanied by feeling", "The easy problems concern animals; the hard problem concerns humans", "The easy problems were solved by the adversarial collaboration of 2025; the hard problem remains", "The easy problems concern meaning; the hard problem concerns intelligence"], "answerIndex": 0, "explanation": "Chalmers argued that every 'easy' phenomenon can be analysed by its function, but consciousness cannot, since a zombie physically and functionally like us but without experience seems conceivable. He concluded in favour of a 'naturalistic dualism'. The 2025 adversarial test did not settle the contest between the two leading scientific theories.", "id": "q4"},
    {"type": "open", "prompt": "Explain why epiphenomenalism keeps returning across the section. Use the completeness of the physical, Kim's exclusion argument and at least one example from Consciousness or Minds and Machines: Could AI Think?", "rubric": "A strong answer states completeness ('every physical effect has a sufficient physical cause') and the no-systematic-overdetermination premise, showing that souls then cannot cause behaviour, and notes Broad's reply (redistributing energy). It gives Kim's exclusion argument with Jennie and the peach, its conclusion (reduce the mental or accept that it is epiphenomenal), the 'proves too much' objection, and Kim's late view (beliefs and desires reduce functionally; felt qualities leave an irreducible 'mental residue'). It gives at least one further case: Huxley's steam whistle; Jackson's 1995 conclusion that if qualia have no effects we could not know about them; or Cole's warning that 'really' understanding might become 'epiphenomenal: undetectable, causally inert, and irrelevant'. It may add the emergentist dilemma (own powers break closure; no powers bring back exclusion). Better answers note that linking these cases as a recurring price is the overview's own reading.", "id": "q5"},
    {"type": "open", "prompt": "How could we know whether another being, an animal or a machine, has a mind? Draw on at least three of: Locke's inverted spectrum, Nagel's bat, Descartes's two tests, Turing's imitation game and other minds reply, the New York Declaration on animal consciousness, and the dated evidence about large language models.", "rubric": "A strong answer explains why the question is hard: Locke said an inversion 'could never be known'; Nagel argued that a complete physical account leaves out what it is like to be the subject. It sets out at least one behavioural test (Descartes's language and action tests, applied to animals; Turing's imitation game and the other minds reply) and an objection (Blockhead shows passing is not logically sufficient; the ELIZA effect; the Chinese Room). It uses dated evidence carefully: the New York Declaration (2024), with Lau's objection; Jones and Bergen's tests (GPT-4.5 judged human 73 per cent of the time; Marcus's objection); Chalmers's tentative '<10%?' credence for current LLM sentience; Butlin, Long and co-authors (2023) finding no current AI system conscious. Better answers distinguish intelligence, understanding and consciousness, mention the Nyāya premise 4 hinge (matter bearing cognition), and keep claims about current AI hedged and dated.", "id": "q6"}
  ]$mindov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/philosophy-of-mind', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
