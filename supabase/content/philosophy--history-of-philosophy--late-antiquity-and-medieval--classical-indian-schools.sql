-- The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/classical-indian-schools @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/classical-indian-schools',
    'research',
    'advanced',
    'read',
    $darshanas_master$> **Five schools that argued with the Buddhists and with each other.** In the first millennium CE and after, Indian thinkers who accepted the authority of the Veda built systems of great precision. This chapter explains why the familiar list of "six orthodox schools" is a later grouping, then takes the schools in turn: Nyāya's sources of knowledge (*pramāṇas*), its argument for God (set out step by step with the Buddhist and Mīmāṃsā objections) and its case for an enduring self; Vaiśeṣika's categories and atoms; Sāṃkhya's dualism of spirit and matter, and its argument that effects pre-exist in their causes; Patañjali's Yoga; and Mīmāṃsā's authorless Veda, eternal language and "intrinsic validity" of knowledge.

## Six Schools, or Many?

The Sanskrit word *darśana* means "vision", and came to be used for a systematic philosophical view. Modern introductions usually say that Hindu philosophy has six, the *āstika* or "Veda-recognising" schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga, Pūrva Mīmāṃsā and Vedānta. Shyam Ranganathan calls this a convention that "has developed over the centuries"; how many darśanas there are "depends largely on the organizational question of how one is to enumerate" them.

The convention is younger than it looks. According to Andrew Nicholson, the distinction between *āstika* and *nāstika* (roughly "orthodox" and "heterodox") "was not clearly defined until the late medieval period", and the scheme of "six systems" was created between the twelfth and sixteenth centuries by Vedāntins, then "adopted by the early Western Indologists". Earlier lists counted differently. The Jain Haribhadra's *Compendium of Six Views* (dated by some to the fifth or sixth century, by others to the eighth) included the Buddhists and the Jains; the fourteenth-century *Sarvadarśanasaṃgraha*, as Jains, Ājīvikas and Materialists: India's Other Dissenters describes, set out sixteen. Wilhelm Halbfass and Richard King criticise the orthodox/heterodox frame as Brahmanical and polemical.

Two further cautions apply. The schools did not succeed one another: they "existed side by side", in Ranganathan's words, growing up in constant argument with Buddhists, Jains and each other. And the dates are soft. Karl Potter put the case for the founding text of Nyāya bluntly: "we have not the vaguest idea who wrote the Nyayasutras or when he lived." Each school has a root text of short aphorisms (*sūtras*) or verses, and a long line of commentators who did much of the real philosophical work. Vedānta, the sixth school of the scheme, has its own chapter, Vedānta: Śaṅkara, Rāmānuja and Madhva.

## Nyāya: The Sources of Knowledge

*Nyāya* means "rule or method of reasoning". Its root text, the *Nyāya-sūtra*, is attributed to Gautama (also called Akṣapāda) and usually dated to around the second century CE, though estimates range back to the sixth century BCE and some scholars see layers of different ages. The oldest surviving commentary is Vātsyāyana's (fourth or fifth century), defended against the Buddhist logician Dignāga by Uddyotakara (sixth or early seventh century). The tradition culminated in the "New Nyāya" (Navya-Nyāya) of Gaṅgeśa, usually placed in the fourteenth century (older estimates say the thirteenth).

The school's central idea is the *pramāṇa*, a means or process that generates a true cognition. Pramāṇa-words are "factive", like the English "know": no knowledge source ever generates a false belief, only pseudo-sources do. Matthew Dasti calls Nyāya's epistemology "a sophisticated precursor to contemporary reliabilism", the modern view that a belief is knowledge when a reliable process produces it. What Is Philosophy? names the three sources most schools shared: perception, inference and testimony. Nyāya counted four, holding that these "are the only irreducible sources of knowledge":

1. **Perception** (*pratyakṣa*). "A perceptual cognition arises by means of the connection between sense faculty and object, is not dependent on words, is non-deviating, and is determinate" (*Nyāya-sūtra* 1.1.4, in Dasti's translation). It is the "eldest" source, because the others depend on it. Unlike Dignāga, Nyāya held that ordinary perception is already conceptual.
2. **Inference** (*anumāna*, "after-cognising"). From smoke on the hill we infer fire, provided the smoke is really on the hill and smoke is invariably accompanied by fire (*vyāpti*). The five-part form of argument is described in What Is Philosophy?. Nyāya did not sharply separate an invalid argument from one with a false premise: both are "pseudo-provers" (*hetvābhāsa*).
3. **Analogy** (*upamāna*). Told that a *gavaya*, a kind of wild ox or buffalo, is like a cow, you later meet one and learn what the word refers to. For Nyāya this is mainly how we acquire vocabulary.
4. **Testimony** (*śabda*). "Testimony is the assertion of a qualified speaker" (*Nyāya-sūtra* 1.1.7, as Dasti translates it). Vātsyāyana explains that such an expert (*āpta*) knows the truth and wants to convey it without deception, and adds that even foreigners, "barbarians", can be experts.

Other schools drew the line elsewhere. The Cārvāka materialists are said to have accepted perception alone; the Buddhists Dignāga and Dharmakīrti, and the Vaiśeṣikas, perception and inference, treating testimony as a kind of inference. Sāṃkhya and Yoga accepted three. The Prābhākara branch of Mīmāṃsā counted five, adding presumption, and the Bhāṭṭa branch six, adding non-cognition (knowing there is no mug on the desk from not perceiving one). Nyāya's view that testimony gives knowledge directly, not by inference, put it beside Mīmāṃsā, a debate that returns in Testimony, Trust and Social Epistemology.

How do we know that a cognition is true? For Nyāya, validity is established "extrinsically" (*parataḥ*): knowing does not automatically mean knowing that you know. But true cognition is the default, innocent until reasonably challenged, and only doubt sets off a check. When Nāgārjuna objected that certifying every source would need another source, without end, Vātsyāyana replied that if this were so "everyday action and discourse would not go on". Logic across Traditions compares Nyāya's logic with Aristotle's, the Stoics' and the Mohists'.

## Vaiśeṣika: Categories and Atoms

The *Vaiśeṣika-sūtra*, attributed to Kaṇāda (the name means "atom-eater"), is dated so variously that the safest statement is the last centuries BCE or the first century CE. Its lasting achievement is an inventory of what there is. A *padārtha*, literally "thing denoted by a word", is anything that exists, can be known and can be named. The sūtra (1.1.4) lists six categories: substance, quality, action or motion, universal, individuator (*viśeṣa*) and inherence (*samavāya*). A seventh, absence, was added later. There are nine substances: earth, water, fire, air, ether, time, space, self and mind. Qualities are particular to each thing; universals such as "cowness" are shared by many.

Two categories are distinctive. Inherence is the relation that ties a quality to its substance, a universal to its instances and a whole to its parts. Critics, Śaṅkara and Kumārila among them, objected that such a relation would need a further relation to tie it to its terms, and so on without end; Nyāya replied that inherence is "self-linking". The individuator, from which the school takes its name, is what finally distinguishes one atom, or one self, from another exactly like it.

The atoms (*paramāṇu*) are eternal, partless and spherical, and come in four kinds, of earth, water, fire and air. The argument for them, in Amita Chatterjee's reconstruction, starts from the mote in a sunbeam, the smallest visible thing. It has parts, and its parts are invisible. Division must stop somewhere, or a mountain and a mustard seed would be equal in size, both having countless parts. Nor can it end in nothing, since a division that destroys what it divides is "as absurd a notion as digging a hole in empty space". So there are partless atoms. Two atoms make a dyad, three dyads a triad, the smallest perceptible thing.

A whole, on this view, is a genuinely new thing that inheres in its parts: the effect does not exist before it is produced (*asatkāryavāda*). Cloth has three kinds of cause: the threads, their conjunction, and the weaver. For the world, the efficient cause is God together with an unseen force (*adṛṣṭa*). Kaṇāda's sūtra does not directly mention God, but Praśastapāda (usually placed in the sixth century, by some earlier) treats God as the cause of the universe, and the combined Nyāya-Vaiśeṣika tradition made the argument its speciality.

## Arguing for God: Udayana and His Critics

Dasti calls the Naiyāyikas "India's most sophisticated natural theologians". Their main tool was a design inference. Uddyotakara stated its core: matter, atoms and karma "function when guided by a conscious agent because they are insentient ... like an axe". The classic treatment is the *Nyāyakusumāñjali* ("A Handful of Flowers of Logic") of Udayana, usually dated to the late tenth or early eleventh century. Its first four chapters refute anti-theist positions; the fifth gives positive proofs, of which the most discussed is from effects: "Things like the earth have a maker as their cause, because they are products (*kāryatvāt*)" (in Dasti's translation).

Later Nyāya sharpened the argument from effects. In the form Gaṅgeśa gave it, following Vācaspati Miśra (whose date is disputed, the ninth or tenth century), it runs:

1. Earth and the like are effects: they are produced.
2. Whatever is an effect has a conscious agent as its instrumental cause, like a pot, and unlike an atom, which is uncaused and has no maker.
3. So earth and the like have a conscious agent as their instrumental cause: God (*Īśvara*).

The argument divides things into three groups: the uncreated (atoms), the created with an evident maker (pots), and the created whose maker is not evident (the earth, growing grass). The third group is what the argument is about.

**The Buddhist objections.** The first is a counterexample: grass grows with no agent in sight. Nyāya replies that grass belongs to the disputed group, so citing it assumes what is in question. The second, refined over centuries of Buddhist argument, is subtler. Every agent we have ever seen has a body. So the observed connection is really between effects and *embodied* makers, and it cannot reach a bodiless God. Gaṅgeśa, after Vācaspati, denies that agency requires a body: if the creator needed one, and bodies are made of atoms, an earlier creator would be needed to make it, and so on without end; a bodiless creator whose knowledge was never produced is simpler. The third objection, pressed by Buddhists, Mīmāṃsakas and later Jains, is that the argument overreaches: from pots and potters one cannot reach a unique maker of the world. Vācaspati replied that even ordinary induction involves inference to the best explanation, which can introduce new kinds of entity.

**The Mīmāṃsā objections.** Kumārila Bhaṭṭa, the great Mīmāṃsaka of the seventh century, criticised theism in ways that, Daniel Arnold reports, are "very much like some characteristically Buddhist critiques". On Purushottama Bilimoria's reading, Kumārila asks who made God's body if it was created, which begins a regress, and, if it was uncreated, why we should not say the same of our own. Nyāya could reply that a creator needs no body at all, or that God could assume one without creating as humans do. Behind this lay a quarrel about scripture. Almost all Naiyāyikas held that the Veda, like every sentence, was composed by a speaker, and for Udayana God was the best or only candidate. Mīmāṃsā held that the Veda has no author. God: Arguments For and Against sets the Indian debate beside the Western one.

```checkpoint
q: How does Nyāya's list of the sources of knowledge differ from the three-item list of perception, inference and testimony?
a*: Nyāya adds analogy, making four sources in all.
a: Nyāya rejects testimony and accepts only perception and inference.
x: That is the Buddhist (and Vaiśeṣika) position; Nyāya holds that testimony gives knowledge directly.
a: Nyāya adds presumption and non-cognition, making five.
x: Presumption and non-cognition are the extra sources of the two Mīmāṃsā branches, not Nyāya's.
a: Nyāya accepts perception alone, like the Cārvākas.
x: The Cārvākas are said to have accepted perception alone; Nyāya treats perception as the "eldest" of four sources.
hint: Think of the wild ox that is like a cow.
why: Nyāya counts perception, inference, analogy and testimony as the four irreducible sources. Analogy is mainly how we learn what words such as *gavaya* refer to.
---
q: What is the point of the Buddhist objection that every maker we know of has a body?
a: It shows that the earth is not an effect at all.
x: The objection grants that effects need explaining; it attacks the link between effects and a bodiless maker.
a: It shows that God must have a body made of atoms.
x: The Buddhist does not want an embodied God; the objection is meant to block the inference to any maker of the world.
a*: The observed link is really between effects and embodied makers, so it cannot support a bodiless God.
a: It shows that testimony about God is unreliable.
x: The objection concerns inference, not testimony.
hint: What do all the makers we have ever seen have in common?
why: Having a body accompanies every known case of making but not every effect, so the concomitance Nyāya needs fails. Gaṅgeśa replies that requiring a body leads to a regress of creators, and a bodiless creator is simpler.
```

## The Self that Remembers

One of Nyāya's longest arguments with the Buddhists was over the self. The Buddhist position, as Dasti summarises it, is that there is no enduring self: things last only a moment, wholes are heaps (the chariot of the *Milindapañha*), and moral continuity is carried by causal links within a single stream, as The Buddha and Early Buddhist Philosophy explains. The *Nyāya-sūtra* (1.1.10, as Monima Chadha gives it) answers with a list: "Desire, aversion, volition (prayatna), pleasure, pain, and cognition are characteristics of the self."

The argument behind the list has two strands. Desire and cognition are qualities, and every quality belongs to a substance; they cannot belong to earth or any other material substance, or they would be perceived as colour is; so they belong to a non-material substance, the self. The second strand is about time. Recognising "this is that Devadatta I saw yesterday" needs one subject present on both occasions, since, in the Internet Encyclopedia's paraphrase, one self is unable to recollect the content of another's experience. Uddyotakara, following Vātsyāyana, argued that if I were a different self from yesterday's "me", I could not remember what that "me" experienced; and we desire again what we remember enjoying. Udayana's *Determining the Truth of the Self* is the high point of this line of argument.

The Buddhists replied that memory needs causal continuity, not a self: Vasubandhu used the image of "seeds" for the capacities that earlier experience leaves behind in the mental stream, which later ripen, as a sprout grows from a seed. Kumārila sided with Nyāya, with a twist: the self is not inferred but directly encountered in the first-person content of memory. And Chadha presses a further worry: the Nyāya self, wholly distinct from its changing qualities and acting only through mind and body, seems causally idle by itself, "exactly the Buddhist argument against the existence of the Nyāya self". The debate continues in Self and No-Self: Personal Identity East and West.

## Sāṃkhya: Spirit and Matter

"Two millennia ago," writes Ferenc Ruzsa, Sāṃkhya "was the representative Hindu philosophy", "a strong Indian example of metaphysical dualism, but unlike many Western counterparts it is atheistic". It is essentially a one-book school: the *Sāṃkhya-kārikā* of Īśvarakṛṣṇa, seventy-two verses dated by Ruzsa to about 350 CE (Gerald Larson places it in the Gupta period, 320–540), displaced all earlier Sāṃkhya writings. Of its author "we know nothing".

Sāṃkhya recognises two kinds of thing, both eternal: one Nature (*prakṛti*), unconscious but purposeful, and many selves (*puruṣas*), conscious and, on the standard account, unchanging and inactive. Out of Nature evolve twenty-three principles, including intellect, ego, mind, the senses and the elements. Nature is made of three *guṇas*: *sattva* (light, intelligence, pleasure), *rajas* (energy, passion, pain) and *tamas* (inertia, darkness, dullness), which cooperate "like the parts of a lamp". Some modern interpreters read the guṇas physically; others, such as K. C. Bhattacharya and J. N. Mohanty, psychologically, the reading Chatterjee thinks fits the text better.

Why believe in the self? Verse 17 gives reasons, which Ruzsa paraphrases: complex things serve another, as a bed is for someone to lie on; there must be an enjoyer; and liberation needs something to be liberated. Matter and spirit need each other:

```quote
For the sake of puruṣa's perception of prakṛti and for the sake of his release, a union of the two takes place, which resembles the union of the lame and the blind.
Īśvarakṛṣṇa · Sāṃkhya-kārikā 21 (trans. adapted from Majumdar 1930, as given by Monima Chadha) · c. 4th century CE
```

The goal is *kaivalya*, "isolation": the discriminating knowledge that "this is not me; it is not mine; I am not this". Since the self never really acts, the Kārikā concludes (verse 62, in H. T. Colebrooke's translation): "No soul (Purusha) therefore is bound, no one released ... Only nature (Prakriti) in its various forms transmigrates, is bound and is released."

This dualism is lopsided. Nature produces mind and intellect itself, so, Ruzsa observes, drop the self and you still have "a full materialist account of the world, with the passive, unchanging principle of consciousness added almost as an afterthought". Two features are debated. Many modern scholars, including Larson, take the self to be strictly changeless; A. B. Keith thought this made Sāṃkhya "a hopeless bundle of contradictions". Ruzsa argues that the Kārikā's word for "inactive" means only "without spatial or mechanical action", and that the strict reading reflects later Advaita influence. And the atheism belongs to the classical Kārikā: Edwin Bryant notes that early Sāṃkhya was "widely theistic". The Mind–Body Problem compares Sāṃkhya's dualism with Western ones.

**The argument that effects pre-exist.** Sāṃkhya's most famous argument is for *satkāryavāda*, the "existent effect" theory: the pot already exists, latent, in the clay. Verse 9 gives five reasons, which can be paraphrased, following Halbfass, Ruzsa and Amita Chatterjee:

1. What does not exist cannot be produced: no one can make a sky-flower.
2. An effect needs a specific material cause: clay for pots, milk for curds.
3. Not everything arises from everything: pots do not come from threads.
4. A cause produces only what it is capable of producing: a potter cannot make jewellery (Ruzsa's example), and oil comes from sesame, not from sand (Chatterjee's).
5. The effect has the nature of its cause.
6. So the effect exists in its cause before it is produced.

Reason 5 matters most: it lets Sāṃkhya infer the character of invisible Nature from the visible world, and hold, against Vedānta, that the world's evolution is real.

**The objection** came from Nyāya-Vaiśeṣika, for which every effect is a new product. Taken literally, Ruzsa notes, satkāryavāda seems untenable: if the effect already existed, why was it not perceived before it was produced? Nyāya critics added: why produce what already exists? **The Sāṃkhya reply**, as Chatterjee reports it, is that causal activity does not create the effect but *manifests* what was latent; Ruzsa reads the doctrine more modestly, as a moderate determinism on which nothing in a product is absolutely new. Śaṅkara went further in another direction: he accepted that the effect pre-exists in its cause but denied that the transformation is real, treating change as only apparent.

{{image: Yoga Sutras of Patanjali | Pages from a Sanskrit manuscript of the Yoga-sūtra in Devanagari script. The sūtras are highlighted and embedded in the prose commentary (bhāṣya).}}

## Patañjali's Yoga

Yoga shares Sāṃkhya's metaphysics but not its method: where Sāṃkhya is the path of reasoning, Yoga is the path of meditation. Patañjali, Bryant stresses, "is not the founder or inventor of Yoga" but systematised existing practice. Most scholars, Bryant says, date the *Yoga-sūtra*'s 195 aphorisms to the first or second century CE; Philipp Maas argues that the sūtras and their commentary are one work of about 400 CE, a dating that has won wide acceptance, though Bryant calls late dates "problematic". Tradition identifies the author with the grammarian Patañjali, a claim scholars such as Louis Renou rejected.

The second sūtra gives the definition: *yogaś citta-vṛtti-nirodhaḥ*, "Yoga is the restriction of the fluctuations of mind-stuff" (in James Haughton Woods's translation of 1914). The mind's five afflictions (*kleśas*) are ignorance, ego-sense, attachment, aversion and clinging to life, and ignorance is the root. The remedy is the eight limbs (2.29): restraints, observances, posture, breath control, withdrawal of the senses, concentration, meditation and absorption (*samādhi*). The first restraint, non-violence, is the root of the others. Posture takes up three sūtras, "less than 1% of the text"; Bryant calls posture-centred yoga "essentially a modern Western phenomenon".

Unlike classical Sāṃkhya, Yoga has a place for God: Īśvara is "a special self" untouched by afflictions and karma, the teacher of the ancients. Devotion to him is optional in one sūtra but required among the observances, so Bryant argues that Patañjali requires theistic practice at the preparatory stage. The goal is again *kaivalya*, the seer's isolation from the contents of the mind. Critics read this as social withdrawal; Ranganathan replies that it is the culmination of a moral path. Al-Bīrūnī (973–1050) translated the text into Arabic.

## Mīmāṃsā: Language, Ritual and the Veda

Pūrva ("prior") Mīmāṃsā is inquiry into the earlier, ritual portion of the Veda; Vedānta is the "latter" inquiry. Jaimini's *Mīmāṃsā-sūtra* is usually placed in the last centuries BCE. It defines dharma as "a goal defined by [Vedic] injunction (codanā)" (1.1.2, in Arnold's translation), such as "one desirous of heaven should perform the agnihotra sacrifice". Perception reaches only what is present; dharma is always yet to be done, so only language can make it known. The root text never discusses liberation, a theme that later Mīmāṃsakas, notably Kumārila, took up. Its great commentators were Śabara (around the fourth or fifth century), Kumārila (seventh century) and Prabhākara (around 700), whom tradition calls Kumārila's student.

The Veda's authority rests on a theory of language: "the relations between words and their referents are primordial (autpattika)" (1.1.5, in Arnold's translation). For Śabara, "cow" names the whole class, not one animal. The link cannot have been made, Kumārila argued, because proposing "let this be called 'cow'" already uses language; Arnold compares Wittgenstein's criticism of Augustine. Since no one made the Veda, no human ignorance or lie can undermine it. Arnold stresses that this claim is logically independent of Kumārila's epistemology, his signal contribution.

```quote
It should be understood that all pramāṇas' have the property of being pramāṇas intrinsically; for a capacity not already existing by itself (svataḥ) cannot be produced by anything else.
Kumārila Bhaṭṭa · Ślokavārttika, codanā 47 (trans. Daniel Arnold) · 7th century CE
```

This is the doctrine of *svataḥ prāmāṇya*, "intrinsic validity". In Arnold's reconstruction:

1. Suppose a cognition counts as knowledge only once some further cognition certifies it.
2. That certifying cognition would need certifying in its turn, and so on: an infinite regress.
3. And if the first cognition lacked the capacity to justify, no later cognition could supply it, unless the later one had it intrinsically, in which case why not grant it to the first?
4. So cognitions justify intrinsically, and are overturned only by a defeating cognition or a recognised fault in their causes.

Otherwise, the commentators said, "the whole world would be blind". In Arnold's words, "it's not demonstration but falsification that's ultimately decisive". Dharmakīrti objected that a cognition is confirmed only by practical success, as when the jar actually carries water. The reply: the awareness of success is just another cognition, so why credit it and not the first? A second objection asks whether endless possible revision means we never know anything. The reply is common sense: doubt needs a specific reason, or we would annihilate "all worldly discourse". Udayana answered for Nyāya that validity is "not intrinsic, but extrinsic". Arnold compares Kumārila with Thomas Reid, and with Popper on falsification.

The authorless Veda had a social side. Sheldon Pollock called Mīmāṃsā "the dominant orthodox discourse of traditional India", and Arnold judges that its appeal to an authorless Veda "can be understood as rather insidious". Kumārila's influence reached Indian law and poetics, and the dispute over whether a sentence's meaning builds up from word-meanings (Kumārila) or sentences are basic (Prabhākara) anticipates questions in Meaning and Reference.

```checkpoint
q: What does Sāṃkhya mean by saying that the effect pre-exists in its cause?
a: That God has planned every effect in advance.
x: Classical Sāṃkhya is atheist, and the thesis concerns the material cause, not a plan.
a*: That the effect exists latently in its material cause, and production only makes it manifest.
a: That nothing ever changes, so causation is an illusion.
x: Sāṃkhya holds, against Vedānta, that the world's evolution is real; it is the illusion view it opposes.
a: That every effect is a new thing preceded by its own absence.
x: That is the opposing Nyāya-Vaiśeṣika theory, asatkāryavāda.
hint: Think of the pot and the clay, and of oil from sesame.
why: Satkāryavāda says the pot is already in the clay. Production manifests what was latent, which answers the objection that a pre-existing effect should have been perceived earlier.
---
q: Why does Kumārila hold that cognitions are valid intrinsically?
a: Because the Veda says so.
x: Arnold argues the epistemology is logically independent of the claims about the Veda.
a: Because cognitions are never mistaken.
x: Kumārila allows that cognitions can be overturned by a defeating cognition or a fault in their causes.
a: Because practical success confirms every cognition.
x: That is Dharmakīrti's view, which Kumārila's side rejects: the awareness of success is just another cognition.
a*: Because requiring outside certification leads to a regress, and a later cognition could not supply a capacity the first lacked.
hint: What happens if every certifier needs its own certifier?
why: If validity had to be conferred from outside, certification would never end, and no later cognition could give what the first lacked unless it had it intrinsically. So cognitions stand until falsified.
```

## What the Schools Left

The schools were not sealed traditions. Vācaspati Miśra wrote on Nyāya, Sāṃkhya, Yoga, Mīmāṃsā and Vedānta; Nyāya and Vaiśeṣika merged; Yoga absorbed Sāṃkhya's metaphysics. Their quarrels with the Buddhists drove both sides forward: Dharmakīrti, whose logic belongs to Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic, elaborated Dignāga's ideas partly in reply to Kumārila, and Kumārila in turn influenced Śaṅkara.

## Further exploration

- **Jonardon Ganeri, *Philosophy in Classical India: The Proper Work of Reason* (2001).** A philosophical study of reason in Nyāya, Buddhist and Jain thought.
- **Stephen H. Phillips, *Epistemology in Classical India: The Knowledge Sources of the Nyāya School* (2012).** The four Nyāya pramāṇas, followed through to Gaṅgeśa.
- **Parimal G. Patil, *Against a Hindu God: Buddhist Philosophy of Religion in India* (2009).** Ratnakīrti and the Buddhist case against the Nyāya proofs of God.
- **Gerald James Larson, *Classical Sāṃkhya: An Interpretation of Its History and Meaning* (1969; rev. edn 1979).** What Ruzsa calls the standard book on the *Sāṃkhya-kārikā*.
- **Edwin F. Bryant, *The Yoga Sūtras of Patañjali: A New Edition, Translation and Commentary* (2009).** A translation with the traditional commentaries.
- **Dan Arnold, *Buddhists, Brahmins, and Belief: Epistemology in South Asian Philosophy of Religion* (2005).** Kumārila's intrinsic validity set against Dharmakīrti.
- **Andrew J. Nicholson, *Unifying Hinduism: Philosophy and Identity in Indian Intellectual History* (2010).** How the scheme of "six orthodox schools" was formed.$darshanas_master$,
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
  select $darshanas_quiz$[
    {"type": "mcq", "prompt": "Where does the familiar scheme of 'six orthodox schools' (ṣaḍdarśana) come from, according to Andrew Nicholson?", "options": ["It was created by Vedāntins between the twelfth and sixteenth centuries and later adopted by Western Indologists", "It is laid down in the Upaniṣads", "It was invented by British colonial officials in the nineteenth century", "It goes back to the Nyāya-sūtra's list of sixteen topics"], "answerIndex": 0, "explanation": "Nicholson argues that the āstika/nāstika distinction was not clearly defined until the late medieval period and that Vedāntins created the six-system scheme, which early Western Indologists then adopted. Earlier lists, such as Haribhadra's, which included Buddhists and Jains, and the Sarvadarśanasaṃgraha's sixteen systems, counted differently.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these is NOT one of Nyāya's four sources of knowledge (pramāṇas)?", "options": ["Analogy (upamāna)", "Presumption (arthāpatti)", "Testimony (śabda)", "Perception (pratyakṣa)"], "answerIndex": 1, "explanation": "Nyāya counts perception, inference, analogy and testimony. Presumption (as when we conclude that fat Devadatta, who does not eat by day, must eat at night) is an extra source accepted by both branches of Mīmāṃsā; the Bhāṭṭas add non-cognition as a sixth.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Gaṅgeśa, following Vācaspati, answer the Buddhist objection that every maker we know of has a body?", "options": ["He agreed that God has a body made of atoms", "He argued that grass has a hidden human maker", "He denied that agency requires a body, since an embodied creator would need an earlier creator to make its body, without end", "He appealed to the Veda as proof that God exists"], "answerIndex": 2, "explanation": "Bodies are made of atoms, so a creator who needed a body would need a prior creator to assemble it, and so on without end. A bodiless creator with knowledge that was never produced is the simpler hypothesis.", "id": "q3"},
    {"type": "mcq", "prompt": "Why does Mīmāṃsā hold that the Veda cannot be falsified, unlike human statements?", "options": ["Because God, its author, is omniscient", "Because the Veda contains only statements about present, perceptible things", "Because the Buddhists accepted its authority", "Because it has no author, so no speaker's ignorance or lies can undermine it"], "answerIndex": 3, "explanation": "Human statements can be overridden by the limits or deceit of their speakers. Mīmāṃsā holds the Veda authorless, resting on the eternal relation between words and their meanings, so no such defeater applies. Nyāya, by contrast, held that God composed the Veda.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Nyāya argument from effects for the existence of God, as Udayana stated it and Gaṅgeśa refined it, and assess it in the light of the Buddhist and Mīmāṃsā objections.", "rubric": "A strong answer gives Udayana's formulation ('Things like the earth have a maker as their cause, because they are products') and the three-step version: earth and the like are effects; whatever is an effect has a conscious agent as instrumental cause, like a pot and unlike an atom; so they have such a maker, Īśvara. It explains the three groups (uncreated, evident maker, non-evident maker) and the reply to the grass counterexample (grass is in the disputed class). It states the Buddhist 'having a body' objection and Gaṅgeśa's regress reply; the overreach objection and Vācaspati's appeal to inference to the best explanation; and Kumārila's critique (on Bilimoria's reading, the regress about God's body), noting that Mīmāṃsā holds the Veda authorless while Nyāya makes God its author. It reaches a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Compare Sāṃkhya's and Nyāya-Vaiśeṣika's theories of causation. Reconstruct the Sāṃkhya argument for satkāryavāda and explain what is at stake in the dispute.", "rubric": "A strong answer defines satkāryavāda (the effect pre-exists latently in its material cause) and asatkāryavāda (the effect is a new product, preceded by its absence, inhering in its parts). It sets out the five reasons of Sāṃkhya-kārikā 9 (the non-existent cannot be produced; effects need a specific material cause; not everything comes from everything; a cause produces only what it can; the effect has the nature of the cause), as paraphrased after Halbfass, Ruzsa and Chatterjee. It gives the objection (why was the effect not perceived earlier, and why produce what exists?) and the reply (causation manifests the latent), and notes Śaṅkara's view that the effect pre-exists but the change is only apparent. It explains the stakes: reason 5 lets Sāṃkhya infer the nature of unmanifest prakṛti and hold that evolution is real, while Nyāya-Vaiśeṣika's view supports its atomism and its causal argument for God.", "id": "q6"}
  ]$darshanas_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/classical-indian-schools', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
