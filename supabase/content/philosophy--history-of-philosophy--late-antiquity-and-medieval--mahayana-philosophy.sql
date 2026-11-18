-- Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/mahayana-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/mahayana-philosophy',
    'research',
    'advanced',
    'read',
    $mahayana_master$> **Emptiness, consciousness and the sources of knowledge.** This chapter follows the Indian Buddhist movement called the Mahāyāna from its uncertain origins through three bodies of philosophy: Nāgārjuna's claim that all things are "empty" of intrinsic nature, with his argument against causation set out step by step, the objection that his thesis refutes itself, and the two truths; Yogācāra's analysis of consciousness and Vasubandhu's dream argument against external objects; and the epistemology and logic of Dignāga and Dharmakīrti. It ends with the passage of these ideas to Tibet.

## A "Great Vehicle" and Its Uncertain Origins

*Mahāyāna* means "Great Vehicle". According to the scholar Jan Nattier, the Indian term was originally an honorific synonym for *Bodhisattvayāna*, the vehicle of the *bodhisattva*, the person who seeks full awakening (buddhahood) for the benefit of all beings. Its counterpart *Hīnayāna*, "lesser vehicle", was a polemical term, comparatively rare in the earliest sources, and is not a neutral label for other Buddhists.

The earliest Mahāyāna scriptures (*sūtras*) probably date from around the first century BCE or the first century CE, among them the *Perfection of Wisdom* (*Prajñāpāramitā*) literature. The firm evidence is a Chinese translation of the *Perfection of Wisdom in 8,000 Lines* by Lokakṣema, around 179 CE, and a partial Gāndhārī manuscript radiocarbon-dated to the first or early second century CE. As the *Macmillan Encyclopedia of Buddhism* puts it, the only evidence for dating the movement's emergence to around the start of the common era "was not Indian evidence at all, but came from China".

In India the movement is strikingly hard to see. The earliest inscription with a recognisably Mahāyāna formula, naming the Buddha Amitābha at Mathurā, belongs to the second half of the second century CE, and no Indian inscription names the Mahāyāna before the fifth century. Schopen calls it "an extremely limited minority movement"; Joseph Walser notes its "virtual invisibility in the archaeological record until the fifth century".

Where did it come from? Proposals include lay origins, the Mahāsāṃghika monastic school, forest ascetics and Schopen's "cult of the book", with shrines built around written sūtras. David Drewes rejects them all: there is no evidence for book shrines, the sūtras favour oral and aural practice, and few advocate forest-dwelling. Several scholars see scattered groups rather than one movement. Mahāyāna authors defended their sūtras as the Buddha's word by appeal to "skill in means": he had withheld this teaching from first hearers who might have drawn nihilistic conclusions from it.

## Nāgārjuna: What Can Be Known

Nāgārjuna is, by unanimous agreement, the most important Buddhist philosopher after the Buddha himself, "the second Buddha" of Tibetan and East Asian tradition. Yet, in Jan Westerhoff's words, "very little can be said precisely about Nāgārjuna's life". He was a monk who lived some time between about 150 and 250 CE, probably mainly in southern India. Two works are addressed to a king of the Sātavāhana dynasty in the Deccan; which king is disputed.

The biographies, written in Chinese and Tibetan many centuries later, are legend. One legend has the *nāgas*, serpent beings, invite him to their kingdom under the ocean, where he recovered the Perfection of Wisdom sūtras; another has him beheaded with a blade of grass at the request of a king's successor. Tibetan sources also place him at the monastery of Nālandā, but Walser notes that Nālandā was not a strong monastic centre until about 425. Since later tantric and alchemical authors bore the same name, "Nāgārjuna" by convention means the author of the *Mūlamadhyamakakārikā* (*Fundamental Verses on the Middle Way*, MMK) and the *Vigrahavyāvartanī* (*Dispeller of Disputes*, VV).

The MMK has 450 verses in 27 chapters, written to be memorised and filled out by oral commentary. Whether its author was even a Mahāyānist is, for Douglas Berger, "an age-old debate", since the philosophical works show little awareness of Mahāyāna doctrine. His school is Madhyamaka, the "Middle Way"; its followers are Mādhyamikas.

{{image: Nagarjuna | Nāgārjuna in an eighteenth-century painting, made some fifteen centuries after his lifetime. The surviving biographies are late and legendary, and little is known of his life.}}

## Emptiness

The earlier Buddhist schools, as The Buddha and Early Buddhist Philosophy explains, analysed persons and things into momentary events called *dharmas*. The Abhidharma distinguished what exists *primarily* (*dravyasat*), the irreducible dharmas, from what exists only *secondarily* (*prajñaptisat*), as a conceptual construction out of them: "shoes and ships and sealing-wax" are aggregates of dharmas. The primary existents were said to have *svabhāva*, a word translated "intrinsic nature", "inherent existence", "substance" or "essence".

Nāgārjuna's central claim is that everything is empty (*śūnya*). Emptiness is always emptiness *of* something, and what things are empty of is svabhāva. Westerhoff separates several senses of the word. Svabhāva as essence, the heat of fire, is not the main target. The main target is svabhāva as substance: an existent "independent of anything else", like the Abhidharma's dharmas. Nāgārjuna denies that there is any ontological foundation, any "end-point of a chain of ontological dependence relations". Dan Arnold puts it crisply: "The foundational idea of Madhyamaka is that the set of ultimately existent things is an empty set."

Emptiness is not non-existence. As Berger writes, *śūnyatā* means not "nihility" but "the lack of autonomous existence". It is the other face of dependent origination, the old Buddhist teaching that everything arises in dependence on other things. In Arnold's translation of MMK 24.19: "Since there is no dharma whatsoever that is not dependently originated, therefore there is no dharma whatsoever that is not empty." The verse before it is the most quoted in the work.

```quote
Whatever is dependently co-arisen / That is explained to be emptiness. / That, being a dependent designation, / Is itself the middle way.
Nāgārjuna · Mūlamadhyamakakārikā 24.18 (trans. Jay Garfield, 1995) · c. 150–250 CE
```

Mark Siderits and Shōryū Katsura's translation gives the sense that dependent origination is what we call emptiness, that this is itself a dependent concept, and that just this is the middle path. Emptiness is thus itself empty: in Westerhoff's words, not "some kind of primordial reality" but "a corrective to a mistaken view". Nor is there one master argument: since nothing has its nature independently of context, refutation goes case by case, against the Abhidharma but also against the realism of Nyāya, whose categories Nāgārjuna attacked in a separate treatise.

## The Argument against Intrinsic Causation

The MMK opens with causation. In Arnold's translation, verse 1.1 reads: "There do not exist, anywhere at all, any existents whatsoever, arisen either from themselves or from something else, either from both or altogether without cause." The form is the *tetralemma* (*catuṣkoṭi*), a fourfold statement meant to cover all possible relations (same, different, both, neither), so that denying all four counts as an exhaustive refutation. Berger traces it to the Buddha's refusal to answer metaphysical questions, such as whether the world had a beginning, which was "more a principled refusal to answer than a counter-thesis". Following Westerhoff and the commentator Buddhapālita, the argument runs:

1. Suppose that cause and effect exist with svabhāva: as distinct, independent, mind-independent objects.
2. Then the effect arises either (a) from itself, (b) from something other, (c) from both, or (d) from neither, without a cause. There is no fifth option.
3. Not (a). If the effect were identical to its cause, it would already exist and have no need to come into being a second time; in Buddhapālita's words, "there would be no point in the arising of already existent things". If it is "contained" in the cause, it is not found there: there is no explosion among petrol, oxygen and spark.
4. Not (b). Things distinct by their own nature could have no relation of dependence, and then there would be no constraint on what arises from what. As Candrakīrti put it, a sprout could as well come from the coals of a fire as from a seed. Besides, nothing is a "cause" without an effect, so the cause depends on its effect too.
5. Not (c). This merely conjoins two untenable hypotheses; and its best version, potentiality (the statue latent in the marble), concedes that the two lack independent natures.
6. Not (d). Uncaused arising contradicts the causal order of experience, makes knowledge impossible and, said Buddhapālita, "would render all practice ineffectual".
7. So the supposition in step 1 is false.

Westerhoff stresses that Nāgārjuna "does not conclude that causation is impossible". What fails is the shared premise that cause and effect have svabhāva. They exist, but in mutual dependence, and so they are empty.

**Objection.** The Abhidharma philosophers saw no conflict between being caused and having svabhāva: a dharma can arise from conditions and still have its own fixed nature. If so, the argument shows only that certain conceptions of causation fail, not that caused things are empty.

**Reply.** On Siderits's reconstruction, causation is itself conceptually constructed, and anything whose nature essentially involves a constructed property is itself constructed, as a game of chess is. So caused things are empty in the deepest sense. The question is still debated between Siderits and Westerhoff. The later commentator Bhāviveka added a qualification: the denials concern what is so "ultimately", by intrinsic nature, since denying that sprouts conventionally arise from seeds would be absurd.

## "I Have No Thesis"

The most famous objection to Madhyamaka came from opponents, among them Nyāya logicians, and Nāgārjuna answered it in the VV. No claim compels assent unless it is known to be true. If all things lack a fixed nature, so does the statement "all things are empty". But a universal denial must be essentially true of all things. So the thesis refutes itself. Arnold states the dilemma: if the claim is that "the ultimate truth is that there is no ultimate truth", either that claim is an exception, and Madhyamaka contradicts itself, or it too is empty, and then it seems to lose its grip.

Nāgārjuna's first reply turns the charge back on Nyāya. A means of knowledge must be established by another (an infinite regress, like checking a scale with a second scale), by itself (then proof is superfluous), or by mutual support (a circle, like "father" and "son", each so called because of the other). Westerhoff reads this as showing that instruments and objects of knowledge establish one another, so neither has svabhāva. The second reply is the "no-thesis" statement of VV 29, which Berger paraphrases: "If my statement (about emptiness) were a philosophical thesis, then it would indeed be flawed; but I assert no thesis, and so the flaw is not mine."

What this means is much debated. On a sceptical reading Nāgārjuna is a destructive debater (*vaitaṇḍika*) who only refutes, a form of debate Nyāya thought inferior and the method Jayarāśi borrowed, as Jains, Ājīvikas and Materialists: India's Other Dissenters describes. Other readings are "therapeutic", in a Wittgensteinian or post-structuralist vein; metaphysical readings take emptiness as a real claim, one that rules out, for instance, a necessarily existent God; and Kania (2024) reads the verse as an absurd consequence drawn within a debate, not Nāgārjuna's own position. The parallel with Pyrrhonism noted in Hellenistic Philosophy has been pressed as evidence of influence, in different directions, by Thomas McEvilley and Adrian Kuzminski, a contested claim; the wider issue returns in Scepticism and the Answers to It. In India, says Berger, the stance "satisfied no one" beyond his two major commentators: a debater with no thesis looked "more likely a charlatan than a sage".

A related charge was nihilism, which for Buddhists meant that actions have no consequences. In MMK 24.1 the objector says: "If all this is empty, then there's neither production nor destruction; it follows, for you, that the Four Noble Truths don't exist." Nāgārjuna replies that only because everything is empty can suffering arise and be ended; if suffering had svabhāva it could never be interrupted. Mādhyamikas even turned the charge round: it is the Abhidharma that is nihilist, since it replaces the world of suffering persons with a privileged level of dharmas, while Madhyamaka leaves the conventional world "irreducibly conventional".

## The Two Truths

The answer to both charges relies on a distinction. "The Dharma taught by the buddhas", says MMK 24.8 in Sonam Thakchoe's translation, "is precisely based on the two truths: a truth of mundane conventions and a truth of the ultimate." These are conventional truth (*saṃvṛti-satya*) and ultimate truth (*paramārtha-satya*). In Arnold's translation of 24.10: "Without relying on convention, the ultimate is not taught; without having understood the ultimate, nirvāṇa is not apprehended."

The Abhidharma had a two-level picture too: macro-objects conventionally real, dharmas ultimately real. Madhyamaka rejects it, because nothing is ultimately real in that sense: all things, including the ultimate truth and emptiness itself, are empty of intrinsic nature. Candrakīrti glossed *saṃvṛti* as a "screen" that conceals the ultimate. Whether the two truths are in the end the same, "co-constitutive" in Thakchoe's word, is debated. MMK 25.19 goes as far as saying that "there is, on the part of saṃsāra, no difference at all from nirvāṇa". Truth takes up what the doctrine means for theories of truth.

```checkpoint
q: What, according to Nāgārjuna, does the argument of MMK 1 show?
a*: That cause and effect cannot have intrinsic nature, so they exist only in mutual dependence and are empty.
a: That causation is impossible and nothing ever arises.
x: Westerhoff stresses that he does not conclude causation is impossible; denying conventional arising would be absurd.
a: That every effect is identical with its cause.
x: Self-causation is the first of the four options the argument rejects.
a: That things arise without any cause.
x: Uncaused arising is the fourth option, rejected because it would make knowledge and practice impossible.
hint: Which premise do all four rejected options share?
why: Each option assumes that cause and effect exist with svabhāva. Since all four fail, that shared assumption is rejected, not causation itself.
---
q: Why did Madhyamaka reject the Abhidharma's version of the two truths?
a: Because it held that there is no conventional truth at all.
x: Madhyamaka relies on conventional truth: "without relying on convention, the ultimate is not taught".
a: Because it said language can describe the ultimate.
x: That is not the ground given; the issue is what the ultimate level contains.
a*: Because it kept a level of ultimately real dharmas, whereas for Madhyamaka nothing has intrinsic nature.
a: Because it denied that macro-objects such as chariots are conventionally real.
x: The Abhidharma accepted that macro-objects are conventionally real.
hint: Recall Arnold's "empty set".
why: For Madhyamaka the set of ultimately existent things is empty: there is no privileged layer of dharmas, and even emptiness is empty.
```

## The Madhyamaka Commentators

Āryadeva (active around 225–250 CE), traditionally Nāgārjuna's direct disciple, wrote the *Four Hundred Verses*. Buddhapālita (about 470–540) wrote an MMK commentary that only draws out unwelcome consequences (*prasaṅga*) of opponents' views. Bhāviveka, probably active in the mid-sixth century, objected that "no reason and no example are given": a Mādhyamika must state and defend a thesis, that all phenomena lack inherent nature, using Dignāga's form of argument. Candrakīrti, early in the seventh century, defended Buddhapālita; his *Prasannapadā* is the only Sanskrit commentary on the MMK to survive. He had little influence in India, but re-emerged in Tibet.

Modern scholarship calls these two lines Prāsaṅgika (consequence-drawers) and Svātantrika (those who give independent arguments). Those terms were not used by Indian Mādhyamikas themselves: Tibetan scholastics coined them many centuries after the fact. Arnold judges the distinction "not without basis" in the Indian texts, but says it tells us about "characteristically Tibetan preoccupations"; whether the difference is only of method, or of ontology too, is debated.

## Yogācāra: An Anatomy of Consciousness

With Madhyamaka, Yogācāra is one of the two major philosophical traditions of Indian Mahāyāna. It is also called *vijñānavāda* ("doctrine of consciousness"), *cittamātra* ("mind only") and *vijñaptimātra* ("cognition only"); *yoga* here means meditative cultivation. Its first systematisers were the brothers or half-brothers Asaṅga and Vasubandhu, of the fourth to fifth century CE. Tradition says Asaṅga met the future Buddha Maitreya after twelve years of meditation; modern scholars such as Frauwallner suggest a historical teacher of that name.

Caution is needed about the label "mind-only". The *Yogācārabhūmi*, the vast compilation ascribed to Asaṅga from which the school's name probably comes, "lacks … the cittamātra or vijñaptimātra doctrine", which is conspicuously absent from the earliest strata. Whether the idea grew from meditative experience (Schmithausen, Griffiths) or from reflection on dreams and illusions (Sharf) is debated.

Abhidharma counted six consciousnesses: the five senses and the mind. Yogācāra added two. The seventh, the *defiled mind*, takes the eighth as its object and mistakes it for a self: it is the source of our sense of self. The eighth, the *store consciousness* (*ālayavijñāna*), holds karmic "seeds" until they ripen, the Sautrāntika idea that The Buddha and Early Buddhist Philosophy describes as a precursor. It explains how karma carries over without a self and, as Schmithausen suggests, how consciousness restarts after a meditative state in which all mental activity has ceased. It ceases at liberation, so it is not a permanent self, though critics accused Yogācāra of reviving one.

## Vasubandhu's Dream Argument

Vasubandhu came from Gandhāra and studied in Kashmir. His *Abhidharmakośa* summarised Kashmiri Abhidharma doctrine and, in its commentary, criticised it from a mainly Sautrāntika view; tradition says Asaṅga then converted him to Yogācāra. Erich Frauwallner argued in 1951 that the biographies merged two Vasubandhus, a theory that still "holds sway in some areas of the academy"; others see continuity, and Robert Kritzer and colleagues argue that he was "secretly an advocate of Yogācāra all along".

His *Twenty Verses* (*Viṃśikā*) open, in Jonathan Gold's translation: "Everything in the three realms is only appearance (vijñaptimātra)", as hairs appear to someone with an eye disease. A realist objects that mere appearances could not be (1) fixed in place, (2) fixed in time, (3) shared by everyone present, or (4) causally effective, as real objects are. Vasubandhu answers with counterexamples, each showing only possibility. Dream objects appear at definite places and times. Beings in hell share the same tormentors, which, if real and able to stand hell's fires, would not be there; karma explains them. And a dream of a lover can have a physical effect. Then comes parsimony: if karma, a mental intention, produces physical hell-guards who then cause mental suffering, why not drop the physical middle step?

The positive argument (verses 11–15) runs:

1. If there are external sense objects, they are either wholes over and above their parts, separate atoms, or aggregates of atoms.
2. A whole over and above its parts is never perceived.
3. Separate atoms are not perceived either.
4. Aggregates of partless atoms are impossible: an atom joined to others on six sides has parts, and a partless atom could not catch light on one side and cast shade on the other.
5. So no account of external objects succeeds, and objects are only appearance.

Gold reads this as an inference to the best explanation; Kellner and Taber as an argument that no means of knowledge establishes external objects.

**Objections.** The Nyāya commentator Vātsyāyana, and the Vedāntin Śaṅkara, replied that illusion is parasitic on veridical cognition: we cannot even imagine an absolutely unreal thing, like "a barren woman's son". Uddyotakara sharpened this: we know dream objects are unreal only because, awake, we no longer apprehend them, so waking apprehension must indicate existence. The dream argument presupposes the very contrast between dreaming and waking that it denies. A further objection is solipsism: if all is mind, how can we help or harm one another? Vasubandhu replied that minds act on minds directly.

**How idealist?** Yogācāra describes experience through three natures: the imagined, the dependent and the perfected. In the *Teaching on the Three Natures*, whose ascription to Vasubandhu is contested, a magician conjures an elephant from a piece of wood: "The fabricated nature is the elephant; the dependent is its appearance (ākṛti); and the nonexistence of an elephant there is the perfected." Most scholars have read Yogācāra as ontological idealism, the view that only minds exist, keeping a foundation where Madhyamaka refused one. Others read it as epistemological idealism, compared with Kant, or as phenomenology that brackets the question of what exists (Lusthaus; Garfield in 2015). Even idealist readers call it "a peculiarly Buddhist form of idealism", with no Berkeleyan soul; Gold's Vasubandhu is "an idealist, but only in the realm of conventions". The debate continues in Perception and the External World and Consciousness.

## Dignāga and Dharmakīrti

Dignāga lived about 480 to 540. Dharmakīrti's dates are disputed, with proposals from the mid-sixth century to 600–660, and Tom Tillemans thinks "caution or even agnosticism" warranted. Tibetans called their school "those who follow reasoning"; Tillemans calls it the Buddhist school "that provoked the most sophisticated and most important philosophical debates with non-Buddhist rivals".

Nyāya, as The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā describes, accepted four means of knowledge; Dignāga accepted two, perception and inference, because there are two kinds of knowable thing, the unique particular and the general. Perception is non-conceptual and the only direct access to the real; conceptual thought "superimposes" unreal universals. For Dharmakīrti a means of knowledge is a "reliable" cognition: a sound basis for successful action because it arose by a reliable route, not one that merely happens to work. Only particulars are real: "Whatever has causal powers (arthakriyāsamartha), that really exists (paramārthasat) in this context." Everything real lasts a moment, since a permanent thing could produce effects neither all at once nor in sequence. Of real universals he exclaimed: "Oh my! It's just one disaster after another." Since *jāti* means both "universal" and "caste", the attack also undercut the metaphysics of caste.

How, then, do words mean? Dignāga's answer was *apoha*, "exclusion": "A word talks about entities only as they are qualified by the negation of other things." Blue things are grouped as "non-non-blue". Kumārila and Uddyotakara objected that this is circular, since to grasp non-non-blue one must already grasp blue; Dharmakīrti replied that one must understand what a term excludes as much as what it applies to. The theory is discussed further in Meaning and Reference.

For inference, Dharmakīrti required a "triple-mark" reason: it must be a property of the subject (smoke is on the mountain), present only in similar cases (where there is fire), and wholly absent from dissimilar ones. Dignāga made central the distinction between inference for oneself and inference for others. The Nyāya logician Uddyotakara, says Stephen Phillips, "owes almost everything to his Buddhist adversaries". Tillemans warns that "logic" can mislead, since formal validity is not discussed separately; Logic across Traditions makes the comparison. Both men were, finally, Yogācāra idealists who wrote mostly on terms a realist could accept. Dharmakīrti also argued that other minds probably exist, since actions like mine occur without my volitions, and, at length, for rebirth, against the materialists; on Dan Arnold's reading, the argument holds that sentient phenomena must have sentient events among their causes.

```checkpoint
q: Why did Dignāga accept only two means of knowledge?
a: Because testimony is always unreliable.
x: Dignāga's reason is the kinds of thing there are to know, not a judgement on witnesses.
a*: Because there are only two kinds of knowable thing, particulars and generalities.
a: Because Nyāya had shown that analogy reduces to perception.
x: Nyāya defended analogy as a separate source; Dignāga's ground is his own.
a: Because conceptual thought gives direct access to the real.
x: For Dignāga it is perception, not conceptual thought, that gives direct access; thought superimposes universals.
hint: Match each means to its object.
why: Perception grasps the particular and inference the general; as there are only two kinds of knowable, there are only two means.
---
q: What was Uddyotakara's objection to Vasubandhu's dream argument?
a: That dreams have no causal effects at all.
x: Vasubandhu's wet-dream example concerns causal effects; Uddyotakara's point is about how we know dreams are unreal.
a: That hell-beings cannot share experiences.
x: That is part of Vasubandhu's reply about shared experience, not Uddyotakara's objection.
a: That atoms are partless.
x: Vasubandhu argued about atoms; Uddyotakara's objection concerns the dream comparison.
a*: That we know dreams are unreal only by contrast with waking, so the argument presupposes what it denies.
hint: How do we find out that a dream was a dream?
why: Dream objects are judged unreal because, awake, we no longer apprehend them, so waking apprehension must indicate existence.
```

## To Tibet

In about 763 the Indian Madhyamaka philosopher Śāntarakṣita (725–788), invited by King Trisong Detsen, went to Tibet, where he became first abbot of Samye monastery; the dates of its founding are uncertain. His *Ornament of the Middle Way* advised using mind-only to stop taking external objects as real and Madhyamaka to see that nothing has substance, riding "the chariot of both systems". After his death his pupil Kamalaśīla came to Tibet and carried on his teaching.

Tibetan tradition tells of a great debate at Samye, usually dated 792–794, between the Chinese Chan monk Moheyan, who taught sudden awakening, and Kamalaśīla, who taught a gradual path; Kamalaśīla won and Chan was banned. Many Chinese sources say Moheyan won, several scholars have questioned whether the debate happened at all, and Arnold thinks it "may be apocryphal", though Kamalaśīla's gradualism is reflected in his three *Bhāvanākrama* texts. Its common name, the "Council of Lhasa", is a misnomer: Samye is far from Lhasa.

A second wave came with Atiśa (982–1054), from Bengal, whose influence helps explain the Tibetan preference for Candrakīrti. Tibetan scholars ranked the Indian schools in an ascending hierarchy ending in Svātantrika and then Prāsaṅgika, which became the official position of Tibetan Buddhism, and formal debate became central to the Gelug school. Tsongkhapa (1357–1419), whose followers became the Gelug, defended Candrakīrti while integrating Dharmakīrti, holding "a robust realism about the conventional world": emptiness is the ultimate truth, "but even this is only true conventionally". The Sakya scholar Go-rams-pa (1429–1489) replied that he had confused thinking about the ultimate with the ultimate. China never translated Dharmakīrti, and its Madhyamaka and Yogācāra are the subject of Chinese Buddhism and the Rise of Neo-Confucianism; Śaṅkara, who answered the Buddhist idealists, belongs to Vedānta: Śaṅkara, Rāmānuja and Madhva.

## Further exploration

- **Jay L. Garfield, *The Fundamental Wisdom of the Middle Way* (1995).** A translation of the MMK with a philosophical commentary.
- **Mark Siderits and Shōryū Katsura, *Nāgārjuna's Middle Way* (2013).** A translation of the MMK following the early Indian commentaries.
- **Jan Westerhoff, *Nāgārjuna's Madhyamaka: A Philosophical Introduction* (2009).** A clear account of emptiness and the arguments for it.
- **Jan Westerhoff, *The Golden Age of Indian Buddhist Philosophy* (2018).** The whole period from the Abhidharma to Dharmakīrti.
- **Jonathan C. Gold, *Paving the Great Way* (2015).** Vasubandhu's philosophy read as a unified whole.
- **John D. Dunne, *Foundations of Dharmakīrti's Philosophy* (2004).** A detailed study of Dharmakīrti's epistemology.
- **Joseph Walser, *Nāgārjuna in Context* (2005).** Nāgārjuna placed in early Mahāyāna and Indian monastic life.$mahayana_master$,
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
  select $mahayana_quiz$[
    {"type": "mcq", "prompt": "What, for Nāgārjuna, are all things \"empty\" of?", "options": ["Svabhāva: intrinsic nature or independent existence", "Existence of any kind, so that nothing exists at all", "Consciousness, since only matter is real", "Causes, since things arise from nothing"], "answerIndex": 0, "explanation": "Emptiness is always emptiness of svabhāva, above all in the sense of a substance existing independently of anything else. It is not non-existence: śūnyatā means the lack of autonomous existence, and it goes together with dependent origination.", "id": "q1"},
    {"type": "mcq", "prompt": "Why is the evidence for early Indian Mahāyāna described as thin?", "options": ["Because no Mahāyāna sūtras were ever translated outside India", "Because the movement was banned by the Sātavāhana kings", "Because the firm early evidence is Chinese, and no Indian inscription names the Mahāyāna before the fifth century", "Because Nāgārjuna's works never mention emptiness"], "answerIndex": 2, "explanation": "The only evidence for dating the movement's emergence to around the start of the common era came from China (Lokakṣema's translations), and Walser speaks of its virtual invisibility in the Indian archaeological record until the fifth century.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement about the terms \"Prāsaṅgika\" and \"Svātantrika\" is correct?", "options": ["They were the names Buddhapālita and Bhāviveka gave their own schools", "They are later Tibetan labels for a difference between Indian Mādhyamikas", "They name the two branches of Yogācāra", "They were coined by Dignāga for two kinds of inference"], "answerIndex": 1, "explanation": "Indian Mādhyamikas did not use these terms; Tibetan scholastics coined them many centuries later. Arnold thinks the distinction has some basis in the Indian texts but reflects characteristically Tibetan preoccupations.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the theory of apoha (\"exclusion\")?", "options": ["The view that perception is always conceptual", "The rule that the conclusion must be stated in a debate", "The Yogācāra doctrine of the store consciousness", "The view that words pick out things by excluding what is other, not by naming real universals"], "answerIndex": 3, "explanation": "For Dignāga a word talks about entities only as qualified by the negation of other things: blue things are \"non-non-blue\". Kumārila and Uddyotakara objected that this is circular; Dharmakīrti replied that one must understand what a term excludes as much as what it applies to.", "id": "q4"},
    {"type": "open", "prompt": "Set out Nāgārjuna's argument in MMK 1 against arising from self, other, both or neither, and explain what it does and does not conclude. What is the Abhidharma objection, and how does Siderits reply?", "rubric": "A strong answer states the supposition that cause and effect have svabhāva (distinct, independent existence) and the exhaustive tetralemma of four options. It explains why each fails: self-arising would make arising pointless (Buddhapālita) and the effect is not found in the cause; arising from something wholly other leaves no constraint on what arises from what (Candrakīrti's sprout from coals) and a cause depends on its effect; 'both' conjoins two failed options; uncaused arising would make knowledge and practice impossible. It notes that the conclusion, per Westerhoff, is not that causation is impossible but that cause and effect lack svabhāva and are mutually dependent, and mentions Bhāviveka's 'ultimately' qualification. It gives the Abhidharma objection that being caused is compatible with having svabhāva, and Siderits's reply that causation is conceptually constructed and whatever essentially involves a constructed property is constructed (the chess example), noting the debate continues.", "id": "q5"},
    {"type": "open", "prompt": "Explain Vasubandhu's case in the Twenty Verses that everything is \"only appearance\", and assess it in the light of the Nyāya objections. Should Yogācāra be read as idealism?", "rubric": "A strong answer gives the thesis (Gold's translation) and the realist's four objections (restriction in place and time, shared experience, causal efficacy), with Vasubandhu's counterexamples from dreams, shared hell-guards and the wet dream, and the parsimony argument about karma. It sets out the positive argument that wholes, separate atoms and aggregates of partless atoms all fail as accounts of external objects. It presents Vātsyāyana's and Śaṅkara's point that illusion is parasitic on veridical cognition ('a barren woman's son') and Uddyotakara's objection that we know dreams are unreal only by contrast with waking, so the argument presupposes the distinction it denies, as well as the solipsism worry. On interpretation it distinguishes ontological idealism, epistemological idealism (Kant comparisons) and phenomenological readings (Lusthaus; Garfield 2015), notes the 'peculiarly Buddhist' idealism with no Berkeleyan soul and Gold's 'idealist only in the realm of conventions', and credits awareness that the Yogācārabhūmi lacks the mind-only doctrine.", "id": "q6"}
  ]$mahayana_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/mahayana-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
