-- Consciousness — canonical master article, co-written and human-reviewed.
-- philosophy/philosophy-of-mind/consciousness @ research/advanced/read.
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
    'philosophy/philosophy-of-mind/consciousness',
    'research',
    'advanced',
    'read',
    $consciousness_master$> **Why is there something it feels like to be you, and could any science of the brain explain it?** This chapter sorts out what "consciousness" can mean, then works through the central problems: Locke's inverted spectrum, Nagel's bat and Chalmers's "hard problem", the deeper replies to Jackson's Mary, higher-order theories, and the case for panpsychism and the combination problem that dogs it. It follows the same questions into India, where Sāṃkhya, Nyāya, Buddhist logicians and their Madhyamaka critics argued about whether awareness knows itself, and ends with the science: neural correlates, rival theories tested against each other, damaged brains, and which animals may be conscious.

## What Needs Explaining

"Conscious" is said of whole creatures and of particular mental states. A creature may be conscious in the sense of **sentience** (it can sense and respond to its world), of **wakefulness**, or of **self-consciousness** (it is aware that it is aware). Sentience may come in degrees: "Are fish conscious…? And what of shrimp or bees?" asks Robert Van Gulick's entry in the Stanford Encyclopedia of Philosophy (SEP). A conscious desire for a cup of coffee is one you have and are directly aware of having. Tasting the Merlot you are drinking involves a **quale** (plural *qualia*): what the taste is like for you. In Michael Tye's broad sense, "it is difficult to deny that there are qualia"; the quarrel is over what they are.

Ned Block (born 1942) drew the distinction that organises much of the debate. A state is **phenomenally conscious** if there is something it is like for the subject to be in it. It is **access-conscious**, in the SEP's summary of Block's 1995 paper, if it is "poised for free use in reasoning and for direct 'rational' control of action and speech". Block's warning was that a function of the second is easily credited to the first. This chapter is mostly about how phenomenal consciousness comes to exist. The older dispute between dualism, the identity theory and functionalism belongs to *The Mind–Body Problem*, and whether a machine could be conscious to *Minds and Machines: Could AI Think?*.

## Violets, Mills and the Djin

The puzzles are older than their names. John Locke appears to have been the first to describe an **inverted spectrum** explicitly. In the *Essay* (II.xxxii.15) he supposed that "the Idea, that a Violet produced in one Man's Mind by his Eyes, were the same that a Marigold produces in another Man's, and vice versâ". Since "one Man's Mind could not pass into another Man's Body", this "could never be known", and neither ideas nor names "would be at all confounded". Locke's point was harmless: such an inversion would make no difference to how we use colour words. He did not use it against materialism. Its modern popularity is due largely to Shoemaker (1982) and Block (1990); Dennett called it "one of philosophy's most virulent memes". *Locke* treats Locke's theory of ideas.

Leibniz, in the *Monadology* (1714), imagined walking into a thinking machine enlarged to the size of a mill and finding "only parts pushing one another, and never anything by which to explain a perception"; *Leibniz* sets out that argument step by step. T. H. Huxley, who thought consciousness did no causal work (he compared it, in the SEP's paraphrase, to a steam whistle that contributes nothing to the work of a locomotive), put the mystery memorably:

```quote
How it is that anything so remarkable as a state of consciousness comes about as a result of irritating nervous tissue, is just as unaccountable as the appearance of the Djin, when Aladdin rubbed his lamp.
T. H. Huxley, as quoted in Robert Van Gulick's SEP entry · Lessons in Elementary Physiology · 1866
```

C. D. Broad's "mathematical archangel" (1925), who could not predict the smell of ammonia, is one of several twentieth-century forerunners of Frank Jackson's Mary.

## The Hard Problem

*Analytic Philosophy since 1950* tells how Thomas Nagel (born 1937) proposed in "What Is It Like to Be a Bat?" (1974) that "an organism has conscious mental states if and only if there is something that it is like to *be* that organism—something it is like *for* the organism". Nagel's reasoning, as the Internet Encyclopedia of Philosophy (IEP) and the SEP reconstruct it, runs:

1. Facts about experience are subjective: fully graspable only from a particular type of point of view, that of the bat.
2. Physical facts are "objective facts par excellence", understandable from many points of view and by beings with very different senses.
3. Scientific explanation proceeds by moving away from any particular point of view.
4. So a complete physical account would leave out what it is like to be the subject.
5. So we do not at present understand how physicalism could be true (Nagel did not claim it false).

**Objection.** Dennett and the philosopher Kathleen Akins replied that the theoretically interesting features of bat experience, such as the range and resolution of its sonar, are open to third-person study,. **Reply.** What is left over is exactly the character of the experience *for the bat*, which no fact about range limits conveys. Nagel called for a future "objective phenomenology" that could describe experiences "in a form comprehensible to beings incapable of having those experiences".

In 1983 Joseph Levine named the **explanatory gap**: given a large electrical discharge, we can deduce lightning. But from the claim that pain is the firing of C fibres nothing tells us why that firing should feel like anything at all. Levine himself has been reluctant to draw anti-physicalist conclusions. David Chalmers (born 1966) went further. In a talk at a conference in Tucson in 1994, published in 1995, he separated the **easy problems**, explaining how a system discriminates, integrates information and reports, from the **hard problem**. Stub your toe and yelp: neuroscience can in principle trace the signals and the yelp, but why is all this accompanied by the *feeling* of pain, and why this feeling rather than some other? *Analytic Philosophy since 1950* quotes Chalmers's question; the IEP sets out the argument behind it:

1. To explain something reductively is to analyse it by its function and then discover empirically what performs that function: the gene is by analysis "the unit of hereditary transmission", research shows that regions of DNA perform that role, so genes are regions of DNA.
2. Every "easy" phenomenon, such as learning, discrimination or report, can be analysed by its function.
3. Consciousness cannot: however complete a functional story, it remains conceivable that a being satisfying it is a **zombie**, physically and functionally like us but without experience, or has an inverted spectrum.
4. So consciousness cannot be reductively explained.
5. So we must either eliminate it or "add consciousness to our ontology as an unreduced feature of reality, on par with gravity and electromagnetism".

Chalmers took the second option, a "naturalistic dualism" that makes consciousness a fundamental feature of nature. Zombies have a history: according to Robert Kirk's SEP entry, G. F. Stout (1931) described a world of bodies "arguing about materialism" with no experiencing beings, which he thought "prima facie incredible to Common Sense"; Keith Campbell imagined an "imitation man" (1970); and Kirk himself turned zombies against physicalism (1974). *Possibility and Necessity* examines whether conceiving a zombie shows that one is possible.

**Objection.** Physicalists of the kind Chalmers calls "type B" accept the gap in our knowledge but deny a gap in reality. On the **phenomenal concept strategy** (Stoljar's name for it), premise 3 shows only that we have two kinds of concept for one thing. Brian Loar argued that a phenomenal concept is a recognitional concept: "To have the phenomenal concept of blueness is to be able to recognize experiences of blueness while having them." Such a concept refers "directly" to a physical property, by being triggered by it. "Given that properties are constituted by the world and not by our concepts," Loar wrote, "it is fair of the physicalist to request a justification of the assumption that conceptually distinct concepts must express metaphysically distinct properties." **Reply.** Chalmers (2007) answered with a dilemma. Take whatever features of our phenomenal concepts are supposed to explain the gap. If a zombie lacking them is conceivable, those features are not physically explicable either, and the problem returns. If it is not conceivable, zombies, as our physical duplicates, would share the features, so they cannot explain the epistemic situation that is supposed to set us apart.

A more radical answer denies the datum. **Illusionism**, Keith Frankish's term (2016), holds that phenomenal properties do not exist, though introspection represents some brain properties as if they did; it "replaces the hard problem with the illusion problem". Dennett (1942–2024) called it "the obvious default theory". John Searle objected that "where consciousness is concerned the existence of the appearance is the reality". Frankish replies that the illusion is a matter of how the brain represents and reacts to information: there must be something that represents, but no inner observer to whom things seem. According to the 2020 PhilPapers survey, about 62 per cent of philosophers agreed that the hard problem is real and about 30 per cent disagreed.

## Mary Revisited

*Analytic Philosophy since 1950* sets out Jackson's knowledge argument (1982), in which Mary, who knows every physical fact about colour vision, seems to learn something when she first sees red, together with the **ability hypothesis** of David Lewis and Laurence Nemirow (she gains know-how, not facts) and the reply that she learns an old fact under a new concept. The debate went deeper.

Lewis held that "knowing what it is like is the possession of abilities: abilities to recognize, abilities to imagine, abilities to predict one's behavior by imaginative experiments". Earl Conee (1994) answered with **Martha**, who is highly skilled at visualising intermediate shades but has never seen cherry red. Told that it lies midway between burgundy red and fire red, she has the *ability* to imagine it, yet until she uses the ability she does not know what cherry red is like. So abilities are not sufficient. And someone with no capacity to imagine colours still knows what green is like while staring at it, so they are not necessary either. Conee proposed instead that Mary gains **acquaintance**, a third kind of knowledge beside knowing-that and knowing-how: "experiencing a quality is the most direct way to apprehend a quality". She becomes acquainted with a physical quality she already knew all about, and learns no new fact. Tye later adopted this view. Gertler (1999) objected that it is the dualist, not the physicalist, who can explain why acquaintance requires having the experience.

Loar's phenomenal concepts give the commonest physicalist diagnosis: Mary's new concept is "cognitively independent" of her physical ones, so she cannot see a priori that they pick out the same property, and the argument looks sound when it is not. Tye, William Lycan, Papineau and Balog hold versions of it.

Jackson himself changed his mind. By 1995 he concluded that if qualia have no effects, we could not know about them, so something must be wrong with the argument; from 1998 he defended physicalism, and in 2003 and 2007 he diagnosed the error. The argument presupposes a false view of sensory experience and is answered by **strong representationalism**: the view that the qualities of experience are fixed by what it represents, where representation of a certain kind can be specified in physical or functional terms. Fred Dretske (1995) required the representation to be sensory and "systemic"; Tye (1995) required it to be non-conceptual and "poised" for use. Jackson's verdict was wry: "We have ended up agreeing with Laurence Nemirow and David Lewis on what happens to Mary on her release. But, for the life of me, I cannot see how we could have known they were right without going via representationalism." *Perception and the External World* explains the representational view of perception; critics press counterexamples such as blurry vision.

```checkpoint
q: What does Chalmers's 2007 dilemma claim about the phenomenal concept strategy?
a*: That the special features of phenomenal concepts are either not physically explicable or cannot explain why we, unlike zombies, face a gap.
a: That phenomenal concepts do not exist.
x: The dilemma grants such concepts for argument's sake and asks whether their key features can do the job.
a: That conceptually distinct concepts always express distinct properties.
x: That is the assumption Loar challenged; Chalmers's dilemma is a different argument.
a: That Mary learns only abilities when she leaves the room.
x: That is the Lewis–Nemirow ability hypothesis, which concerns the knowledge argument, not this dilemma.
hint: Ask whether a zombie could have the same features.
why: If a zombie lacking the features is conceivable, they are no more physically explicable than consciousness; if not, zombies share them, so they cannot explain our distinctive epistemic situation.
---
q: What is Conee's case of Martha meant to show?
a: That Mary learns nothing on leaving the room.
x: Conee holds that Mary does gain something: acquaintance with a quality.
a: That colours are not physical properties.
x: Conee is a physicalist about the quality; he denies that Mary learns a new fact.
a*: That having the ability to imagine an experience is not the same as knowing what it is like.
a: That phenomenal concepts are recognitional.
x: That is Loar's view, a different reply.
hint: Martha can imagine cherry red but has not yet done so.
why: Martha has the ability Lewis and Nemirow identify with knowing what cherry red is like, yet does not know it until she uses the ability, so abilities are not sufficient; Conee proposes acquaintance instead.
```

## Higher-Order Theories

If consciousness is not an extra ingredient, what makes a state conscious? **Higher-order theories** answer: a state is conscious when the subject represents being in it. On David Rosenthal's version, developed from 1986, a state is conscious when it causes, without inference, a thought (usually itself unconscious) of the form "I am in this state".

Three objections are standard. A higher-order thought might occur with no state for it to be about, and then it is unclear what is conscious. Thinking about a rock does not make the rock conscious, so why should thinking about a perception make the perception conscious? And do cats, dogs and infants have thoughts involving concepts of mental states? Some higher-order theorists reply by making the higher-order element inseparable from its target: Peter Carruthers by appeal to dispositions, Kriegel by making the state represent itself. First-order theorists such as Dretske and Tye deny that consciousness needs any thought about one's own states. Indian philosophers, as we shall see, had the same quarrel.

## Is Consciousness Everywhere?

If experience cannot be built from the non-experiential, perhaps it was never absent. **Panpsychism**, in the contemporary sense, is "the view that mentality is fundamental and ubiquitous in the natural world". It need not say that rocks have minds, only that their fundamental parts have some form of experience; the SEP notes that it "is often caricatured as the view that electrons have hopes and dreams". A related view, **Russellian monism**, goes back to Bertrand Russell's *The Analysis of Matter* (1927) and, independently, to Arthur Eddington. Physics describes only how matter is structured and what it does; the intrinsic nature that does it is left out, and that nature might be experiential, or merely "protophenomenal".

The SEP sets out the argument Nagel gave in "Panpsychism" (1979), which Galen Strawson pressed in "Realistic Monism" (2006):

1. Our experience is real.
2. We are composed of ordinary matter and nothing else.
3. There is no radical emergence: every property of a complex thing must be intelligibly derived from properties of its parts. "Emergence can't be brute," Strawson wrote: there must be something about the parts "in virtue of which" the new feature emerges.
4. Experience cannot be intelligibly derived from wholly non-experiential properties. Liquidity can be understood from molecules; experience cannot.
5. So the fundamental constituents of matter have experiential, or proto-experiential, properties.

An Indian precedent is close: Dharmakīrti argued against the materialists that if consciousness arose from the four elements, it "ought to arise whenever the elements occur, which is to say everywhere", for consciousness cannot come from what is not sentient.

**First objection.** The view is absurd. **Reply.** Philip Goff answers the "incredulous stare" by pointing out that relativity was counterintuitive too, and that theories should be judged by simplicity.

**Second objection: the combination problem**, which the SEP calls "the hardest problem facing panpsychism" (the name is William Seager's, 1995). It goes back to William James, *The Principles of Psychology* (1890), and his image of a sentence of twelve words handed out one word to each of twelve men (see *American Pragmatism: Peirce, James and Dewey*):

```quote
let each think of his word as intently as he will; nowhere will there be a consciousness of the whole sentence.
William James · The Principles of Psychology, vol. 1 · 1890
```

If tiny experiences do not add up to a larger subject, premise 5 does not explain *our* consciousness. Coleman (2014) argues that each subject's point of view excludes every other, so subjects cannot be summed. Goff turned the panpsychist's own weapon round: a "micro-experiential zombie", physically like us with conscious particles but no consciousness of its own, seems as conceivable as an ordinary zombie. **Reply.** Even proponents agree that "there is currently no wholly adequate solution"; but Darwin's theory waited decades for genetics, and a research programme takes time. Some prefer **cosmopsychism**, on which the universe as a whole is the basic subject; it faces the reverse problem of how one consciousness divides into many, and here Albahari (2019) has invoked Śaṅkara's theory of reflection, which explains individual minds by a single consciousness. (*Vedānta: Śaṅkara, Rāmānuja and Madhva* sets out his witness argument.)

## Indian Debates: Does Awareness Know Itself?

In Sāṃkhya, as *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* describes, nature (*prakṛti*) produces the intellect (*buddhi*), and with it cognition, emotion and will. The self (*puruṣa*), in Ferenc Ruzsa's summary, "is pure consciousness: it enjoys and witnesses Prakṛti's activities, but does not cause them". So thinking is material and consciousness is not: almost the reverse of the modern view that cognition is the easy part. One Sāṃkhya argument for the self is that consciousness and privacy are opposite in kind to anything material. Nyāya disagreed about the self's nature. Cognition, desire, pleasure and pain are qualities of a self, but they arise only when it is joined to a mind, senses and body; they are not essential to it, and in liberation the self lacks them permanently, in what Dravid calls "an insentient stone-like condition".

The sharpest debate was over self-awareness. Yogācāra Buddhism (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*) and the logicians Dignāga (about 480–540) and Dharmakīrti held the doctrine of **reflexive awareness** (*svasaṃvedana*): every cognition is aware of itself as it is aware of its object, like a lamp that lights itself while lighting other things. Dignāga's main argument appeals to memory:

1. I can later remember not only the object, say a patch of blue, but my seeing of it.
2. One can remember only what one was earlier aware of.
3. So the earlier cognition was itself experienced when it occurred.
4. It was not experienced by a second, separate cognition, for that one would need a third, and so on without end (Dharmakīrti's regress).
5. So each cognition is aware of itself in being aware of its object.

Dharmakīrti added: "If ascertaining were not itself [directly] perceived, the perception of objects would not be established."

**Objection.** The Madhyamaka philosophers Candrakīrti (about 600–650) and Śāntideva (eighth century) rejected inherent reflexivity even as a conventional truth, since it would make consciousness self-validating and give it the intrinsic nature that, for them, nothing has. Nyāya offered a different alternative to step 4: cognitions are known by *later* cognitions directed at them through the inner sense, a view Gaṅgeśa defended against Mīmāṃsā philosophers who held each cognition reflexively self-aware. The parallel with higher-order theories is close. **Reply.** Śāntarakṣita, who combined Yogācāra and Madhyamaka, answered that reflexivity posits no extra entity: "This reflexive awareness of that cognition is none other than its non-insentience." For a cognition to be aware of itself is simply for it not to be insentient. Jay Garfield defends the Madhyamaka critique; others compare reflexive awareness with Kant, Brentano, Husserl and Sartre (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*). The Buddhist analysis of the self is followed further in *Self and No-Self: Personal Identity East and West*.

```checkpoint
q: What is Dignāga's memory argument meant to establish?
a: That the self is a permanent witness of all cognitions.
x: That is closer to Śaṅkara's Advaita; Dignāga was a Buddhist who denied a permanent self.
a*: That each cognition is aware of itself as well as of its object.
a: That memory is unreliable as a means of knowledge.
x: The argument relies on memory to show something about the original cognition.
a: That cognitions are known by later cognitions directed at them.
x: That is the Nyāya view, which reflexive awareness was meant to replace.
hint: Think of the lamp.
why: Because we remember our seeing as well as what we saw, the seeing must have been experienced; since a separate cognition would start a regress, each cognition must be aware of itself.
---
q: Why did Candrakīrti and Śāntideva reject reflexive awareness?
a: Because they thought cognition was a material process.
x: Their objection was not materialist; it came from the doctrine of emptiness.
a: Because they held, like Nyāya, that the self is unconscious in liberation.
x: That is Nyāya's view of the liberated self, not a Madhyamaka argument.
a: Because Dharmakīrti's regress argument was invalid.
x: Their stated reason concerned what reflexivity would imply about consciousness, not the regress.
a*: Because inherent self-awareness would make consciousness self-validating, with an intrinsic nature that nothing has.
hint: Madhyamaka holds that all things are empty of intrinsic nature.
why: For Madhyamaka nothing has intrinsic nature, even conventionally; a consciousness that validated itself would have exactly such a nature. Śāntarakṣita replied that reflexivity is just cognition's "non-insentience".
```

## The Science of Consciousness

Since Francis Crick and Christof Koch's paper of 1990, neuroscience has searched for **neural correlates of consciousness**: in Koch's words, "the minimal set of neuronal events and mechanisms jointly sufficient for a specific conscious percept". But, as the SEP warns, "correlates are not necessarily explanatory".

Two theories lead. **Global workspace theory**, proposed by Bernard Baars in 1988 and given neural form by Stanislas Dehaene and colleagues, holds that a content is conscious when it is broadcast in a brain-wide "workspace" that makes it available to many systems at once. Chalmers's response was that it may explain this availability, but "why should global accessibility give rise to conscious experience?" **Integrated information theory** (IIT), proposed by Giulio Tononi in 2004, starts from what it takes to be self-evident features of experience and identifies consciousness with integrated information, measured by a quantity called Φ (phi). The cerebellum, with four to five times as many neurons as the cortex, is said to have almost none. Tononi accepts that even an inactive grid of logic gates may have a high Φ. In 2023 a letter signed by 124 scholars argued that until it is empirically testable IIT should be called pseudoscience; many researchers defended it, and the editors of *Nature* later wrote that "such language has no place" in work designed to bring rival groups together. The two theories were tested against each other in an "adversarial collaboration", in which their proponents agreed predictions in advance. Its peer-reviewed results, published in *Nature* on 30 April 2025, matched some predictions of each and challenged key claims of both; the contest was not settled.

Damaged brains supply puzzles of their own. After damage to the primary visual cortex, patients studied by Lawrence Weiskrantz and colleagues from the early 1970s could, when made to guess, tell apart stimuli in their blind field well above chance, while sincerely denying that they saw anything: **blindsight**. In the 1960s surgeons treated severe epilepsy by cutting the corpus callosum, some 200 million nerve fibres joining the brain's hemispheres. Such patients seem unified in daily life, but in the laboratory Roger Sperry and Michael Gazzaniga found behaviour suggesting two independent centres of consciousness.

Which animals are conscious? The Cambridge Declaration on Consciousness (2012) held that "non-human animals, including all mammals and birds, and many other creatures, including octopuses" possess the neurological substrates of consciousness. The New York Declaration of 2024, initiated by Kristin Andrews, Jeff Sebo and Jonathan Birch, found "at least a realistic possibility" of experience in all vertebrates and many invertebrates, including insects, and concluded that "it is irresponsible to ignore that possibility in decisions affecting that animal". Hakwan Lau argued that it overstates the evidence even for mammals and birds (see *Animals and the Environment*).

Colin McGinn (1989) holds that the answer is "cognitively closed" to us, as square roots are to armadillos; the IEP replies that apparent roadblocks have often proved temporary. Whether the hard problem marks a limit of the human mind, a confusion in our concepts or a clue to the nature of matter is still, after Locke's violet and Huxley's Djin, the open question.

## Further exploration

- **Philip Goff, *Galileo's Error: Foundations for a New Science of Consciousness* (2019).** An accessible case for panpsychism and Russellian monism.
- **Keith Frankish (ed.), *Illusionism as a Theory of Consciousness* (2017).** The case for illusionism, first published as a journal special issue, with critics' replies.
- **Daniel C. Dennett, *Consciousness Explained* (1991).** The multiple drafts model, and the classic attack on the idea of an inner theatre where experience comes together.
- **Anil Seth, *Being You: A New Science of Consciousness* (2021).** A neuroscientist's account of how far brain science can go.
- **Evan Thompson, *Waking, Dreaming, Being: Self and Consciousness in Neuroscience, Meditation, and Philosophy* (2015).** Brings Indian and Tibetan Buddhist and Vedānta ideas into dialogue with neuroscience.
- **Christian Coseru, *Perceiving Reality: Consciousness, Intentionality, and Cognition in Buddhist Philosophy* (2012).** Buddhist theories of mind, including reflexive awareness, read alongside phenomenology.
- **Jonathan Birch, *The Edge of Sentience: Risk and Precaution in Humans, Other Animals, and AI* (2024).** Sentience at the boundaries, by a co-author of the New York Declaration.$consciousness_master$,
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
  select $consciousness_quiz$[
    {"type": "mcq", "prompt": "What was Locke's own point about a man whose idea of a violet is another man's idea of a marigold?", "options": ["That the inversion could never be known and would make no difference to names or truth", "That colour experiences cannot be physical", "That such an inversion is impossible", "That it disproves functionalism"], "answerIndex": 0, "explanation": "In the Essay (II.xxxii.15) Locke said the inversion 'could never be known' and that neither ideas nor names would be confounded. He did not use it against materialism; its use as an argument against physicalist and functionalist theories is due mainly to Shoemaker (1982) and Block (1990).", "id": "q1"},
    {"type": "mcq", "prompt": "According to the higher-order thought theory defended by David Rosenthal, what makes a mental state conscious?", "options": ["Its being broadcast in a global neuronal workspace", "Its having a high value of integrated information", "Its being the object of a thought, arrived at without inference, that one is in that state", "Its being reflexively aware of itself, like a lamp"], "answerIndex": 2, "explanation": "On Rosenthal's view a state is conscious when it causes, non-inferentially, a usually unconscious thought of the form 'I am in this state'. The workspace and integrated information are the two leading scientific theories; the lamp is the Buddhist image for reflexive awareness. Objections include the rock (thinking about a rock does not make it conscious) and animals without mental-state concepts.", "id": "q2"},
    {"type": "mcq", "prompt": "Why does Sāṃkhya invert the modern assumption that cognition is the 'easy' part of the mind?", "options": ["Because it holds that the self thinks and nature is unconscious", "Because it denies that consciousness exists", "Because it identifies consciousness with the intellect (buddhi)", "Because cognition, emotion and will belong to the intellect, a product of material nature, while consciousness belongs only to the inactive self (puruṣa)"], "answerIndex": 3, "explanation": "In Sāṃkhya the intellect (buddhi) is produced by prakṛti, nature, so thinking is material; the puruṣa is pure consciousness that witnesses but does not act. Whether the puruṣa is strictly changeless is debated (Larson and Keith against Ruzsa).", "id": "q3"},
    {"type": "mcq", "prompt": "What did the adversarial collaboration testing global workspace theory against integrated information theory find, in its results published in Nature in April 2025?", "options": ["Results that matched some predictions of each theory and challenged key claims of both", "A decisive confirmation of integrated information theory", "A decisive confirmation of global workspace theory", "That neither theory makes testable predictions"], "answerIndex": 0, "explanation": "Both theories' proponents agreed predictions in advance. The results supported parts of each and challenged central tenets of both, so the contest was not settled. A separate public dispute followed a 2023 letter calling IIT pseudoscience, language that Nature's editors later criticised.", "id": "q4"},
    {"type": "open", "prompt": "Set out the argument from the impossibility of radical emergence to panpsychism (Nagel 1979, Strawson 2006) as numbered premises, then explain the combination problem, using James's twelve men, and assess one reply.", "rubric": "A strong answer gives the premises: experience is real; we are made only of ordinary matter; no radical emergence, since every property of a whole must be intelligibly derived from its parts ('Emergence can't be brute'); experience cannot be intelligibly derived from the wholly non-experiential (unlike liquidity from molecules); so the fundamental constituents of matter have experiential or proto-experiential properties. It may mention Russellian monism (physics gives only structure, leaving intrinsic nature) and Dharmakīrti's parallel anti-materialist argument. It explains the combination problem: James's twelve men each thinking one word produce no consciousness of the whole sentence, so micro-experiences need not add up to a subject; Coleman's point that subjects' viewpoints exclude one another; Goff's micro-experiential zombie, which turns the conceivability argument against panpsychism. It assesses a reply: the admission that there is no adequate solution yet but that research programmes take time (Darwinism and genetics), or cosmopsychism and its decombination problem, with Śaṅkara's reflection theory. Credit for answering the incredulous stare.", "id": "q5"},
    {"type": "open", "prompt": "Reconstruct Dignāga's memory argument for reflexive awareness (svasaṃvedana) and compare the Madhyamaka and Nyāya responses. How do these positions line up with modern higher-order theories of consciousness?", "rubric": "A strong answer sets out the steps: we remember both the object and our seeing of it; one remembers only what one was aware of; so the earlier cognition was experienced; not by a second cognition, on pain of regress (Dharmakīrti); so each cognition is aware of itself while aware of its object, like a self-illuminating lamp. It explains Candrakīrti's and Śāntideva's objection that inherent reflexivity would make consciousness self-validating and possessed of intrinsic nature, contrary to emptiness, and Śāntarakṣita's reply that reflexivity is simply cognition's 'non-insentience'. It gives Nyāya's alternative, that cognitions are known by later cognitions through the inner sense (defended by Gaṅgeśa against Mīmāṃsā), and compares it to higher-order theories such as Rosenthal's, and reflexive awareness to self-representational theories (Kriegel). Credit for mentioning Garfield's defence of the Madhyamaka view or comparisons with Kant, Brentano, Husserl or Sartre.", "id": "q6"}
  ]$consciousness_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/philosophy-of-mind/consciousness', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
