-- Vedānta: Śaṅkara, Rāmānuja and Madhva — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/vedanta @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/vedanta',
    'research',
    'advanced',
    'read',
    $vedanta_master$> **Vedānta, "the end of the Veda", was the effort to read the Upaniṣads as one consistent philosophy.** This chapter follows its three great systems. Śaṅkara's non-dualism (Advaita) holds that the self is pure consciousness identical with brahman and that the world of many things is a less-than-real appearance. Rāmānuja's qualified non-dualism makes souls and matter the real body of a personal God. Madhva's dualism insists that God, souls and things are different from one another for ever. Along the way it sets out their arguments about consciousness, error and the self, and separates what is known about these thinkers from the legends that grew up around them.

## What Vedānta Was

The Upaniṣads, as The Upanishads and the Beginnings of Indian Philosophy shows, do not speak with one voice. Vedānta was the attempt to make them do so. Sangeetha Menon calls it "nominally a school of Indian philosophy, although in reality it is a label for any hermeneutics that attempts to provide a consistent interpretation of the philosophy of the Upaniṣads". *Hermeneutics* means the practice of interpretation: every Vedāntin was first of all a commentator.

The tradition settled on a "triple canon" (*prasthāna-trayī*): the principal Upaniṣads, the *Bhagavad Gītā* and the *Brahma-sūtra*. A founding teacher (*ācārya*) was expected to comment on all three. Śaṅkara and Madhva each did; Rāmānuja commented on the *Brahma-sūtra* and the *Gītā* and set out his reading of the Upaniṣads in a separate treatise, the *Vedārthasaṅgraha*. The *Brahma-sūtra*, attributed to Bādarāyaṇa, is 555 terse aphorisms meant as memory aids. It was probably compiled over several centuries around the turn of the common era, and its final form may date as late as the fifth century CE. It argues against Sāṃkhya, Nyāya, Vaiśeṣika, Yoga, Mīmāṃsā, the Buddhists and the Jains, the schools of The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā. So compressed a text could support rival readings; several scholars, among them Surendranath Dasgupta and Hajime Nakamura, have even suggested it was written from a *bhedābheda* ("difference-and-non-difference") standpoint, neither Śaṅkara's nor Madhva's.

The perennial questions were what brahman is and how the many individuals relate to it. And Vedānta was not always central: according to Andrew Nicholson, it remained a peripheral school until about the eleventh century; Nakamura notes that it became a major force when Hindu religious communities used it to ground their doctrines, Rāmānuja's being the prime example.

## Before Śaṅkara: Gauḍapāda and Maṇḍana Miśra

Neil Dalal, in the Stanford Encyclopedia, is exact: "Śaṅkara was a systematizer of Advaita Vedānta, not a founder." Tradition makes his teacher Govinda, and Govinda's teacher Gauḍapāda, usually placed in the sixth or seventh century, though Karl Potter notes that "teacher's teacher" need not be literal. Gauḍapāda's *Kārikā* on the Māṇḍūkya Upaniṣad is considered the first complete Advaita work. Its doctrine of non-origination (*ajātivāda*) holds that what does not exist at the beginning or the end cannot be real in the present, and that nothing can come into being from being, non-being, both or neither; so bondage and liberation are only imagined. Its fourth chapter uses Buddhist terminology.

Nor did Śaṅkara dominate his own age. Maṇḍana Miśra, an older contemporary and a follower of the Mīmāṃsā philosopher Kumārila, wrote the *Brahmasiddhi*, whose theory of error became the normative Advaita one, and until the tenth century he seems to have been regarded as the leading Advaitin. Richard King judges that the common claim that Śaṅkara "was the most influential and important figure in the history of Hindu intellectual thought" does "not seem to be justified by the historical evidence".

## Śaṅkara: The Man and the Legend

Even Śaṅkara's century is debated. Early scholars placed him in 788–820 CE, on the basis of a late traditional text; Nakamura argued for about 700–750, and Potter for the late seventh to early eighth century. Recent scholarship favours the earlier range, since his works engage Buddhist and Mīmāṃsā authors of the fifth to seventh centuries. The monasteries that claim him date him to the fifth century BCE.

There are no dependable records of his life beyond his writings. The *Śaṅkaravijaya*s, "Conquests of Śaṅkara", at least fourteen of them and often contradictory, were composed several centuries after his death. They tell of his birth in Kālaḍi in Kerala, a crocodile that seized the eight-year-old until his mother let him renounce the world, victories in debate across the subcontinent, the founding of four monasteries (*maṭha*s), and death at thirty-two. Paul Hacker and others suggest the four-monastery system may have been begun by the fourteenth-century abbot Vidyāraṇya.

The best-known episode involves a woman philosopher who may never have existed. In the later legend, Maṇḍana's wife Ubhaya Bhāratī judges the debate between her husband and Śaṅkara, garlanding both men: the loser's garland will wither first. Maṇḍana loses and becomes a renouncer, and she then debates Śaṅkara herself, questioning the celibate monk on the science of love until he must go away to learn it. No evidence outside the hagiographies survives; the story says more about the tradition's image of a learned woman than about the eighth century.

What is secure is a body of commentary, on the *Brahma-sūtra*, the *Gītā* and ten principal Upaniṣads, the earliest complete ones to survive, plus an independent work, the *Upadeśasāhasrī* ("A Thousand Teachings"). Hundreds of other texts bear his name, most probably by later monastic heads who held the title "Śaṅkarācārya". The *Vivekacūḍāmaṇi*, long credited to him, is mostly rejected as his by modern scholars.

## Superimposition and the Two Standpoints

Śaṅkara's *Brahma-sūtra* commentary opens with a short preface on superimposition (*adhyāsa*), the confusion through which, on his account, ignorance binds us to suffering.

```quote
Since it is an established fact that the object and subject which are presented as yusmad—'you' /the other, and asmad—'me' are by very nature contradictory, and their qualities also contradictory, as light and darkness they cannot be identical.
Śaṅkara · Brahma-sūtra-bhāṣya, introduction (as quoted by Sangeetha Menon, translator not named) · c. 8th century CE
```

Subject and object cannot be identical. Yet in everyday life we fuse them, superimposing consciousness on the mind-body ("I am this body") and the mind-body on consciousness. Śaṅkara's examples are homely: a scratch on a mirror seems to mar one's face; a clear crystal looks red from a flower behind it; a rope is taken for a snake. Illusion, minimally, is "the appearance of one thing with the properties of another". The cause of the confusion is ignorance (*avidyā*), and only direct knowledge of oneself as brahman removes it.

Behind this lies a criterion of reality: the real is what does not change its nature. Clay persists through lump, pot and plate, and the pot depends on the clay, not the clay on the pot; so the ground is more real than its effect, which is only "name and form" laid over it. Brahman never really turns into the world, "just as a rope mistaken to be a snake does not actually transform into a snake".

Śaṅkara therefore distinguishes two standpoints: conventional, shared empirical reality (*vyāvahārika*) and ultimate reality (*pāramārthika*). "A conscientious reader," Dalal warns, "must understand this distinction and be mindful that Śaṅkara toggles his perspective between the two." At the empirical level he is a realist: he rejects the Buddhist Yogācāra view that only mind exists, and calls the Madhyamaka view that nothing has essential existence nihilistic, positions described in Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic.

Rivals called him a *māyāvādin*, "one who says the world is illusion". Dalal finds the label "not exactly incorrect" but misleading: Śaṅkara rarely uses the word *māyā*, and stresses acting for the good of the world. The world is "an objective but less-than-real appearance", like a magic trick, neither a non-existent hare's horn nor a contradictory square circle. Later Advaitins made *māyā* a cosmic creative power equated with beginningless ignorance; whether that doctrine is already Śaṅkara's is contested by academic and traditional scholars alike. The technical claim that ignorance is "indeterminable" (*anirvacanīya*), neither existent nor non-existent, was worked out by Maṇḍana, though Śaṅkara uses the idea. And the slogan *brahma satyaṃ jagan mithyā*, "brahman is real, the world is false", is not his: it is verse 20 of a short work attributed to him, absent from his undisputed writings.

{{image: Adi Shankara | Raja Ravi Varma's painting of Śaṅkara with his disciples. It is an imagined scene: beyond his writings, almost nothing about Śaṅkara's life can be known with confidence.}}

## The Self as Witness: Śaṅkara's Argument

A caveat comes first. Śaṅkara, says Dalal, "accepts nonduality based on the Upaniṣad's authority alone. Nonetheless, he was an original philosopher who constructed novel arguments to make sense of the Upaniṣads." Here is the most important, as Dalal reconstructs it.

1. The real is what does not change its nature; what persists through change is more real, and what depends on another is less real than what it depends on.
2. Waking, dreaming and deep sleep exhaust human experience and exclude one another, but consciousness persists through all three.
3. So consciousness is not any of these states or their contents; it is the changeless element in experience.
4. Consciousness is self-luminous (*svaprakāśa*), known without a second cognition; if every cognition needed another to reveal it, the regress would be endless and "no perception could ever be known".
5. Consciousness can be neither made into an object nor denied, since "any dismissal of consciousness presupposes its very existence".
6. Everything objective (body, senses, mind, even the thought "I") is an object for this witness (*sākṣin*), and so is not the self; our felt identity with the mind-body is superimposition.
7. Existence, sought in objects, is never found in any particular form yet never disappears; it is formless and changeless, the marks of pure consciousness.
8. Therefore the self is pure consciousness, identical with brahman, the single self of all beings; plurality is appearance.

**The objection.** Nyāya attacks premise 2. Consciousness is always consciousness *of* something, and a property of a self. In dreamless sleep nothing is experienced, so consciousness is absent; and with no objectless consciousness, the difference between knower and known is real. Rāmānuja pressed the first point by a different route: he agreed that something persists through sleep, but held that it is the knowing "I", which on waking recalls "I slept well", not an objectless, subjectless consciousness.

**The reply.** Since consciousness is not intrinsically directed at objects, the absence of objects in deep sleep does not show that consciousness is absent; and no one can perceive their own unconsciousness. Deep sleep is "simply an absence of objects", Dalal writes, "akin to having one's eyes wide open and seeing but in a pitch-black room".

A second challenge came from the Buddhist epistemologists Vasubandhu and Dharmakīrti: why posit a witness, if each cognition reveals both itself and its object? Śaṅkara replies that a cognition illuminating itself would be like a knife cutting itself; and we are aware of cognitions arising and perishing, which requires an illuminator distinct from them. The witness escapes the same objection because it never makes itself an object. This principle of irreflexivity is the one Mark Siderits uses to reconstruct the Buddha's argument against a controlling self in The Buddha and Early Buddhist Philosophy: the same tool, turned to the opposite conclusion. Whether such pure consciousness exists is taken up in Consciousness and in Self and No-Self: Personal Identity East and West.

Liberation, then, comes from knowledge, not action, which presupposes an agent and yields only finite results. Śaṅkara's image is the "tenth man": ten children cross a river, and each, counting, finds only nine, until a passer-by tells the counter, "you are the tenth!" Nothing new is gained; what was always so is recognised.

```checkpoint
q: Why does Śaṅkara hold that the pot is "less real" than the clay?
a*: Because the clay persists through lump, pot and plate, and the pot depends on the clay but not the clay on the pot.
a: Because pots are made by human beings and clay is not.
x: Human manufacture plays no part in his criterion; the point concerns persistence and dependence, which would apply equally to natural things.
a: Because pots are illusions with no existence at all, like a hare's horn.
x: Śaṅkara explicitly distinguishes the world from the non-existent hare's horn; the pot is a real appearance at the empirical level, only less real than its ground.
a: Because the Brahma-sūtra lists pots among unreal things.
x: The argument is a philosophical criterion of reality, not a scriptural list; he defines the real as what does not change its nature.
hint: Think about what remains when the pot is broken.
why: The real is what does not change its nature. The clay persists through its forms and the pot depends on it asymmetrically, so the ground is more real than its effect, which is "name and form" laid over it.
---
q: How does the Advaitin reply to the objection that consciousness is absent in dreamless sleep?
a: By saying that we dream continually, even when we do not remember it.
x: The reply does not claim hidden dreams; it says deep sleep has no objects at all, yet consciousness remains.
a: By conceding the point and dropping the claim that consciousness persists.
x: The persistence of consciousness through all three states is a key premise; the Advaitin defends it rather than giving it up.
a*: By arguing that consciousness is not intrinsically directed at objects, so deep sleep is an absence of objects, like seeing in a pitch-black room.
a: By appealing to the Buddhist theory of self-revealing cognitions.
x: Śaṅkara argues against the Buddhist epistemologists; their self-revealing cognitions are what his knife analogy targets.
hint: The objection assumes that consciousness must always be consciousness of something.
why: If consciousness need not have objects, the lack of experienced objects in deep sleep does not show it was absent; and no one can perceive their own unconsciousness.
```

## Later Advaita: Bhāmatī, Vivaraṇa and Śrīharṣa

After Śaṅkara, Advaita split over where ignorance resides. Vācaspati Miśra (ninth or tenth century) wrote the *Bhāmatī*, harmonising Śaṅkara with Maṇḍana and placing ignorance in the individual soul (*jīva*); the rival Vivaraṇa school, named after Prakāśātman's commentary (dated variously from the tenth to the thirteenth century), placed it in brahman.

In the twelfth century, the poet Śrīharṣa's *Khaṇḍanakhaṇḍakhādya* ("Sweets of Refutation") attacked Nyāya's definitions of its categories and of knowledge, keeping only self-revealing consciousness and holding that non-duality is known from the Upaniṣads, not reason. Whether he was an Advaitin or nearer a sceptic is still debated.

## What Is the Silver? Theories of Error

Indian philosophers tested their metaphysics on a small case: someone sees a shell and says "this is silver". What is the error *about*? A traditional verse lists five theories (*khyātivāda*). In one, found in Yogācāra, an inner cognition merely appears external. For the Prābhākara Mīmāṃsakas there is no error proper, only a failure to distinguish a perception ("this") from a memory ("silver"). For Nyāya, the silver is real elsewhere, and memory of it is misplaced onto the shell.

Advaita's account holds that the illusory silver is neither existent (the shell is no silver) nor non-existent (it is really seen), but indeterminable, a product of ignorance about a real substratum. The test of truth is sublation (*bādha*): a cognition is valid if its object is never cancelled, as "it is a rope" cancels "it is a snake". Perceptual illusion thus becomes a bridge to liberation. The world is experienced and shared, so it is not unreal; on the Upaniṣads' testimony it is cancelled by knowledge of brahman, so it is not ultimately real. Like the snake, it is an appearance on a real ground. The realists, as we shall see, analysed error so as never to need this third status; the wider debate runs on in Perception and the External World.

## Rāmānuja: Qualified Non-Dualism

Tradition dates Rāmānuja 1017–1137, a life of 120 years; John Carman's modern reconstruction gives about 1077–1157. Either way he belongs to the eleventh and twelfth centuries. The traditional life has him born at Śrīperumbūdur in the Tamil country, taught first by the Vedāntin Yādavaprakāśa at Kāñcīpuram, and succeeding Yāmuna as leader of the Śrī Vaiṣṇava community that had formed around the Tamil hymns of the poet-saints called Āḻvārs. His main works are the *Vedārthasaṅgraha*, the *Śrī Bhāṣya* on the *Brahma-sūtra*, and a *Gītā* commentary.

"Viśiṣṭādvaita", the later tradition's label, is usually rendered "qualified non-dualism". Its key idea is the relation of soul to body. Brahman, identified with the god Viṣṇu-Nārāyaṇa together with the goddess Śrī, is the Self of all, because "we, along with all individuals, constitute modes or qualities of the body of Brahman". Brahman stands to everything as a soul to its body, and everything depends on it. There is one reality, as the Advaitins say, but it is internally differentiated, and the differences are real. Souls and matter are eternal features of God's body, so there is no creation from nothing.

This gave Rāmānuja his reading of *tat tvam asi*. In co-ordinate predication (*sāmānādhikaraṇya*), several terms refer to one entity on different grounds; "that" and "you" refer to one reality while expressing different qualities, so we are modes within God. Ranganathan thinks this "strikingly anticipates" Frege's distinction between the sense and the reference of a word.

Theoretical knowledge, for Rāmānuja, is not enough. Devotion (*bhakti*) is itself a kind of knowing, a direct perception of brahman, and in Ranganathan's view this is his unique contribution to Indian epistemology. Scholars debate how far his own teaching includes surrender to God (*prapatti*), and within two centuries his followers split over whether grace depends on human effort. Karl Potter suggested that "it may be that Viśiṣṭādvaita is today the most powerful philosophy in India in terms of numbers of adherents".

## Rāmānuja against Advaita

Rāmānuja's attack opens the *Śrī Bhāṣya*. Consciousness, he argues, is always of an object distinguished by some characteristic; so there is no pure, objectless consciousness, and if consciousness exists, difference exists. Consciousness is a property of a self, not the self's whole being. And the Advaitins favour a few late monistic passages while ignoring the many that presuppose plurality. His opponents, he says, are "no better than a man who would claim that his own mother never had any children".

His most pointed argument concerns ignorance itself, as Ranganathan reconstructs it:

1. All Vedāntins agree that brahman is of the nature of knowledge.
2. Whatever is ignorant is a knower capable of error.
3. So brahman cannot be ignorant, for that would contradict premise 1.
4. So the subject of ignorance must be an individual other than brahman.
5. But Advaita uses ignorance to explain why there seem to be individuals at all.
6. Therefore the explanation is circular: individuals are real, and their individuality is "ontologically and logically prior to their ignorance".

**The Advaitin reply.** The Bhāmatī school accepts that ignorance resides in the individual soul; the Vivaraṇa school places it in brahman. On one standard account, Śaṅkara himself called ignorance beginningless and held that searching for its origin is itself founded on ignorance; on Daniel Ingalls's reading, he denied any real connection between ignorance and the self without affirming that ignorance is real, and so avoided the dilemma. His followers instead gave ignorance a third status. Maṇḍana had argued that it cannot be real, or it would not be ignorance, nor utterly unreal, or it could not enter practical life, as a sky-flower cannot.

The tradition sums up Rāmānuja's case as seven "untenables" (*anupapatti*), whose gist is a set of questions: where ignorance resides; how self-luminous brahman could be concealed; whether ignorance is real or unreal, and how it could be neither; what could establish it; and what could remove something beginningless. Advaitins answered each, and Madhusūdana Sarasvatī's *Advaitasiddhi* (sixteenth or seventeenth century), written chiefly against the Dvaita critic Vyāsatīrtha, became the classic defence of Advaita against Vedāntic realists. On error, Rāmānuja denied that we ever apprehend an unreal object: dreams are real events, though "the objects that the experience claims to be about are absent".

## Madhva: Difference All the Way Down

Madhva is usually dated 1238–1317, though some place him about 1199–1278; either way he is a thirteenth-century thinker. Born near Udupi in coastal Karnataka, he joined an Advaita monastery, disagreed with his teacher and left. He founded the Kṛṣṇa monastery at Udupi and claimed to be an incarnation of the wind-god Vāyu. He called his system *tattvavāda*, "the realist viewpoint"; it is known as Dvaita, "dualism".

Reality has two orders. Only God, Viṣṇu, is independent (*svatantra*); souls and insentient matter are dependent (*paratantra*), and that dependence makes them different in kind from God. Madhva taught five real differences: between God and souls, God and matter, soul and matter, one soul and another, and one material thing and another. No two souls are alike; even in liberation their bliss differs.

His central argument starts from experience. Our separateness from God and the plurality of things are undeniable facts. Advaita denies the ultimate validity of perception, but that undermines all knowledge, including knowledge of scripture, which reaches us only through perception and inference. So perception and inference must be valid, and scripture cannot teach non-difference without contradicting the experience through which we receive it. Madhva and Rāmānuja also objected that "neither real nor unreal" is incoherent: a thing must be one or the other. Advaitins replied that the two levels are asymmetrical: as Dalal puts Śaṅkara's position, the world is "not identical to brahman... but is not different either—it does not constitute a second reality". On one reading, Madhva carried over a letter from the preceding word to make the Upaniṣadic refrain *atat tvam asi*, "you are not that".

Madhva's most startling doctrine concerns the fate of souls. He divided them into those fit for liberation, those who transmigrate for ever, and those destined for eternal hell. Souls are predestined to their ends by their innate natures; karma is only the mechanism that carries each there. Since Advaita and Viśiṣṭādvaita assume that all souls can be liberated, this set Madhva at odds with traditional Hindu views. B. N. K. Sharma argued that the classification makes it unnecessary to answer the problem of evil; Buchta objects that an all-powerful God could change the system and chooses not to, reopening the question of The Problem of Evil. Colonial-era writers such as G. A. Grierson claimed Madhva borrowed from Christianity; modern scholarship rejects this, finding no evidence of contact and tracing his new approach to political and social changes in his region.

```checkpoint
q: What is the point of Rāmānuja's argument that ignorance presupposes individuals?
a: That brahman is ignorant of the world it creates.
x: Rāmānuja insists that brahman, being of the nature of knowledge, cannot be ignorant at all; that is a premise of his argument.
a*: That Advaita's explanation of individuals by ignorance is circular, because only an individual can be ignorant in the first place.
a: That individuals exist only in dreams.
x: Rāmānuja is a realist who holds that even dreams are real events; his conclusion is that individuals are ontologically real.
a: That ignorance is neither real nor unreal.
x: That is the Advaitin position (indeterminability), which Rāmānuja attacks as incoherent.
hint: Ask who could be the subject of the ignorance that is supposed to produce individuals.
why: Brahman cannot be ignorant, so ignorance needs an individual knower; but Advaita uses ignorance to explain why individuals appear. Individuality is therefore prior to ignorance, and individuals are real.
---
q: Which of these is a doctrine of Madhva?
a: The individual soul is identical with brahman, as "you are that" teaches.
x: This is Śaṅkara's reading. Madhva's school read the phrase as "you are not that" and stressed difference.
a: Souls and matter are the body of God, real but inseparable from him.
x: This body–soul model is Rāmānuja's qualified non-dualism, not Madhva's dualism.
a: All souls will eventually be liberated.
x: Madhva held that some souls transmigrate for ever and some are destined for eternal hell, setting him apart from both Advaita and Viśiṣṭādvaita.
a*: There are five real differences, including between one soul and another and between God and matter.
hint: His own name for his system was "the realist viewpoint".
why: Madhva taught five differences (God–souls, God–matter, soul–matter, soul–soul, matter–matter), with God alone independent and all else dependent.
```

## A Buddhist in Disguise?

The sharpest insult rival Vedāntins aimed at Advaita was that it was Buddhism in disguise. According to modern scholars, Rāmānuja called Śaṅkara a "crypto-Buddhist" (*pracchanna bauddha*), Madhva accused the Advaitins of teaching Buddhism under cover of Vedānta, and the earlier Bhedābheda Vedāntin Bhāskara dismissed Advaita as a doctrine of illusion "chanted by the Mahāyāna Buddhists".

Some modern scholars see something in the charge. S. N. Dasgupta wrote that Śaṅkara "and his followers borrowed much of their dialectic form of criticism from the Buddhists. His Brahman was very much like the sunya of Nagarjuna", the emptiness of Mahāyāna philosophy; others point to Gauḍapāda's Buddhist vocabulary. The Advaita tradition replies that the central doctrines are opposed: Advaita posits a permanent self, Buddhism teaches no-self; Advaita accepts scripture as a means of knowledge, the Buddhist epistemologists do not. And Śaṅkara argued against idealism, emptiness and self-revealing cognition. The debate turns on how to weigh shared methods against opposed conclusions.

## Legacy

In the nineteenth and twentieth centuries, "Neo-Vedānta" thinkers and Western Orientalists promoted Advaita as the thread uniting Hinduism, though most Hindus do not follow it; on Anantanand Rambachan's reading, Swami Vivekananda shifted its foundation from scripture towards experience, a story told in Philosophy in an Age of Empire and Modern Chinese and Indian Philosophy. Rāmānuja's God of innumerable good qualities and Madhva's dependent world belong to the debates of God: Arguments For and Against, and the comparison of Advaita with Plotinus is taken up in Plotinus and Neoplatonism.

The three Vedāntins shared a canon, a method and a goal; they disagreed about almost everything else. Their quarrel turns on one question: whether the knowing self can be pure consciousness with nothing to know, or whether to be conscious is always to be someone, aware of something other than oneself.

## Further exploration

- **Sengaku Mayeda, *A Thousand Teachings: The Upadeśasāhasrī of Śaṅkara* (SUNY, 1992).** A translation, with a study, of the one independent work securely by Śaṅkara.
- **Michael Comans, *The Method of Early Advaita Vedānta: A Study of Gauḍapāda, Śaṅkara, Sureśvara and Padmapāda* (2000).** The method of early Advaita: the role of scripture, Īśvara and the teacher, from Gauḍapāda to Padmapāda.
- **Chakravarthi Ram-Prasad, *Advaita Epistemology and Metaphysics: An Outline of Indian Non-Realism* (2002).** A philosophical reconstruction of Advaita, including its dream argument.
- **Anantanand Rambachan, *The Advaita Worldview: God, World, and Humanity* (2006).** Advaita read as a world-affirming philosophy.
- **John B. Carman, *The Theology of Rāmānuja: An Essay in Interreligious Understanding* (1974).** The standard study, and the source of the modern dating.
- **Julius Lipner, *The Face of Truth: A Study of Meaning and Metaphysics in the Vedantic Theology of Rāmānuja* (1986).** Rāmānuja's theory of meaning and his body–soul model.
- **Deepak Sarma, *An Introduction to Madhva Vedānta* (2003).** Madhva's epistemology, ontology and theory of salvation, with translated debates.$vedanta_master$,
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
  select $vedanta_quiz$[
    {"type": "mcq", "prompt": "Which statement about Śaṅkara's place in the history of Advaita is best supported?", "options": ["He founded Advaita, and no Advaitin wrote before him", "He was a systematiser of Advaita; Gauḍapāda wrote before him, and Maṇḍana Miśra seems to have been the leading Advaitin until the tenth century", "He was the dominant figure in Hindu thought from his own lifetime onwards", "He wrote the Vivekacūḍāmaṇi, his most important original work"], "answerIndex": 1, "explanation": "Dalal calls Śaṅkara 'a systematizer of Advaita Vedānta, not a founder'. Gauḍapāda's Kārikā is considered the first complete Advaita work, and until the tenth century Maṇḍana Miśra seems to have been the most authoritative Advaitin. The Vivekacūḍāmaṇi is mostly rejected as his; his most important original work is the Upadeśasāhasrī.", "id": "q1"},
    {"type": "mcq", "prompt": "What is the status of the line 'brahma satyaṃ jagan mithyā' ('brahman is real, the world is false')?", "options": ["It is the opening sentence of Śaṅkara's Brahma-sūtra commentary", "It is a sūtra of Bādarāyaṇa", "It is Rāmānuja's summary of the view he attacked", "It is a verse from a short later work attributed to Śaṅkara, not found in his undisputed writings"], "answerIndex": 3, "explanation": "The line is verse 20 of a short work attributed to Śaṅkara and is absent from his undisputed works. Menon calls it 'the anonymous verse'. It sums up later Advaita and should not be quoted as Śaṅkara's own words. His commentary opens instead with the contrast between subject and object.", "id": "q2"},
    {"type": "mcq", "prompt": "How does Rāmānuja read 'tat tvam asi'?", "options": ["Through co-ordinate predication: 'that' and 'you' refer to one reality while expressing different qualities, so we are modes within God", "As 'you are not that', by carrying over a letter from the preceding word", "As a declaration that the self is identical with attributeless brahman", "As a ritual formula with no philosophical content"], "answerIndex": 0, "explanation": "Rāmānuja appeals to co-ordinate predication, in which several terms refer to one entity on different grounds. 'You' shows that we are modes of the one reality, which is God's body. The 'you are not that' reading belongs to Madhva's school, and the identity reading to Śaṅkara.", "id": "q3"},
    {"type": "mcq", "prompt": "What is Madhva's argument from perception against Advaita?", "options": ["Perception shows that the world is a dream from which we must wake", "Perception is unreliable, so only scripture can be trusted", "Denying the validity of perception undermines all knowledge, including knowledge of scripture, which reaches us through perception and inference; so scripture cannot teach non-difference", "Perception proves that all souls will be liberated"], "answerIndex": 2, "explanation": "For Madhva, our experience of separateness from God and of plurality is an undeniable fact. Scripture is known only through perception and inference, so Advaita's denial of perception's ultimate validity saws off the branch it sits on, and scripture cannot contradict experience by teaching non-difference.", "id": "q4"},
    {"type": "open", "prompt": "Set out Śaṅkara's argument that the self is pure, nondual consciousness, and assess the Nyāya objection, which Rāmānuja developed in his own way, that consciousness is always consciousness of an object.", "rubric": "A strong answer notes first that Śaṅkara accepts non-duality on scriptural authority and offers supporting arguments. It gives the main steps: the criterion of the real as what does not change (clay and pot); consciousness persisting through waking, dream and deep sleep; self-luminosity and the regress argument; the undeniability of consciousness; everything objective as an object for the witness; existence and consciousness sharing the same marks. It states the objection (consciousness is intentional and a property of a self; on the Nyāya view it is absent in deep sleep; so difference is real; Rāmānuja instead holds that the knowing 'I' persists in sleep) and the reply (consciousness is not intrinsically intentional; deep sleep is an absence of objects, like seeing in a pitch-black room; one cannot perceive one's own unconsciousness). Credit mention of the Buddhist self-revealing-cognition alternative and the 'knife cannot cut itself' reply, linked to Siderits's use of irreflexivity in early Buddhism.", "id": "q5"},
    {"type": "open", "prompt": "Is Advaita 'Buddhism in disguise'? Weigh the charge made by Rāmānuja and Madhva against the Advaitin reply.", "rubric": "A strong answer reports that, according to modern scholars, Rāmānuja called Śaṅkara a crypto-Buddhist and Madhva said the Advaitins taught Buddhism under cover of Vedānta, and that Bhāskara made a similar charge. It weighs evidence for influence (Dasgupta on dialectic borrowed from the Buddhists and brahman likened to Nāgārjuna's emptiness; Gauḍapāda's Buddhist terminology; shared monastic practice) against the reply: Advaita posits a permanent self where Buddhism teaches no-self and dependent origination; Advaita accepts scripture as a means of knowledge; and Śaṅkara argued against Yogācāra idealism, Madhyamaka 'nihilism' and self-revealing cognition. Credit answers that distinguish shared methods from shared conclusions and treat the label as polemical.", "id": "q6"}
  ]$vedanta_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/vedanta', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
