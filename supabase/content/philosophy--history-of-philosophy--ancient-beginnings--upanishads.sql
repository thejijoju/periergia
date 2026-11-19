-- The Upanishads and the Beginnings of Indian Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/upanishads @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/upanishads',
    'research',
    'advanced',
    'read',
    $upanishads_master$> **Secret teachings about the self, and the long argument over what they mean.** The Upaniṣads, the last layer of the Vedic scriptures, contain some of the oldest Indian discussions of the self (*ātman*), ultimate reality (*brahman*), action and its consequences (*karma*), rebirth and liberation (*mokṣa*). This chapter explains what these texts are and why their dates can only be given in centuries. It follows the teachers who appear in them, from Uddālaka's salt water and Yājñavalkya's "not this, not this" to the questions of Gārgī and Maitreyī, and shows how ideas later treated as fixed doctrine emerged slowly and in competition. It ends with the Bhagavad Gītā, whose argument for acting without attachment is set out step by step, together with the objection that it sanctifies caste.

## From Hymns to Hidden Connections

There are four Vedic collections: the Ṛgveda, Yajurveda, Sāmaveda and Atharvaveda. Each has four layers. The Saṃhitās are largely hymns praising gods; the Brāhmaṇas mostly describe and explain rituals; then come the Āraṇyakas (roughly "forest treatises") and, last, the Upaniṣads. The Ṛgveda is usually dated to about 1500–1000 BCE, though its dating "has been and is likely to remain a matter of contention" (Stephanie Jamison and Joel Brereton). The Indo-Aryan speakers who composed it are discussed in the History chapter The Indus Valley Civilization.

These texts were composed and passed on orally, with elaborate techniques of memorisation, and written down only after 500 BCE; only the oral tradition counts as authoritative. Hindus classify the Vedas as *śruti*, "what is heard", and regard them as *apauruṣeya*, "not of a man": authorless. Later works, including the epics, are *smṛti*, "what is remembered".

Questioning had begun before the Upaniṣads. The Nāsadīya hymn (Ṛgveda 10.129) asks how the universe came to be and refuses to settle it. In A. L. Basham's translation, "the gods themselves are later than creation, / so who knows truly whence it has arisen?", and the one who surveys it "from highest heaven" perhaps knows, "or maybe even he does not know". Some read it as mystical experience, others as early scepticism.

The Upaniṣads remain "firmly rooted in ritual", in Brian Black's words, but with an "increasing emphasis on understanding the meaning of ritual", and some sections leave ritual behind for naturalistic and philosophical inquiry. The ritual texts had searched for hidden connections (*bandhus*) between the cosmos, the sacrificer's body and the ritual ground; the Upaniṣads carry that search inward.

## What the Upaniṣads Are

The word *upaniṣad* is often explained as "sitting down near" a teacher. That is a later gloss, not how the word is used in the texts or the old commentaries. In its earliest contexts it means something like *bandhu*, a hidden connection or equivalence, and it often means "secret teaching"; one passage calls it "the truth behind the truth".

There are thirteen major Upaniṣads, composed orally in Sanskrit, "many of which were likely composed by multiple authors" (Black). Hundreds of later texts also bear the name. Most Upaniṣads are anonymous. Teachings are attributed to sages such as Yājñavalkya, Uddālaka Āruṇi and Śāṇḍilya, and women such as Gārgī and Maitreyī take part in the dialogues.

The texts are not a single system, and some critics conclude that they are therefore not philosophy. Black concedes that their teachers "do not seem to make linear arguments that start with premises": they argue by analogy and metaphor. But he traces the variety to "separate and often competing scholarly traditions or schools (śākhas)", whose teachers competed for patronage in public contests. The dialogue form helped shape debate, "the defining social practice of Indian philosophy". Like the History of Philosophy overview, this chapter treats that tradition as philosophy; What Is Philosophy? takes up the general question.

## Dating Texts That Carry No Dates

Traditional schools such as Nyāya, Mīmāṃsā and Vedānta do not try to date the Upaniṣads: as *śruti*, "a timeless revealed knowledge", they have no historical chronology. Modern scholars must work from internal evidence. As Stephen Phillips points out, all opinions rest on scanty evidence: analysis of archaism, style and repetitions across texts, together with assumptions about how ideas evolved and which philosophy influenced which.

The mainstream scheme is Patrick Olivelle's. The Bṛhadāraṇyaka and Chāndogya are the earliest. Both are edited anthologies of older material, pre-Buddhist, and "may be placed in the 7th to 6th centuries BCE, give or take a century or so". The Taittirīya, Aitareya and Kauṣītakī follow. The verse Upaniṣads (the Kena, Kaṭha, Īśā, Śvetāśvatara, Muṇḍaka and others) came in the last few centuries BCE, roughly 300–100 BCE in the consensus Black reports. The older texts are mostly prose and speak of ultimate reality in impersonal terms; the later ones are mostly verse and more theistic.

Other ranges abound: Phillips gives 800–300 BCE, Gavin Flood about 600–300 BCE even for the older texts. Johannes Bronkhorst argues that the Bṛhadāraṇyaka was possibly still being composed around the second century BCE, a late dating Alexander Wynne contests. This is why overviews, including those elsewhere in this curriculum, give different spans. Olivelle's own warning is the best guide: any dating "that attempts a precision closer than a few centuries is as stable as a house of cards".

## Uddālaka and the Salt in the Water

*Ātman* is a reflexive pronoun, "oneself", probably from a root meaning "to breathe"; in the Upaniṣads it can mean the body, but more often an inner essence, life-force or consciousness. *Brahman* first meant a truthful or powerful utterance and comes to mean "the underlying reality". The teachers did not agree about either.

In the Chāndogya (chapter 6) the brahmin Uddālaka Āruṇi instructs his son Śvetaketu. By knowing one thing made of clay, he argues, you know clay; creation is not something from nothing but the transformation of an original being (*sat*). Then come analogies (nectar merging into honey, rivers into the ocean) and small experiments. Śvetaketu splits a banyan fruit, then a seed, and finds nothing inside. He dissolves salt in water: it cannot be seen, but tasting shows it is everywhere. The conclusion is that a fine, non-material essence pervades all living beings, "an organic understanding of ātman", in Black's phrase. Debiprasad Chattopadhyaya called Uddālaka the first "natural scientist" in intellectual history. His idea that effects pre-exist in their causes is often thought to have influenced the doctrine of *satkāryavāda* met in The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā.

Each lesson ends with a refrain, *tat tvam asi*, traditionally translated "Thou art that". Joel Brereton argued in 1986 that this is grammatically doubtful. As Black explains, *tat* ("that") is neuter and cannot correspond to masculine *tvam* ("you"), so "you are that" would require *sa tvam asi*. He proposed "in that way you are": Śvetaketu shares the nature of the subtle essence. Olivelle and Wendy Doniger follow him; Doniger thinks the case is made "fairly convincingly".

```quote
The finest essence here—that constitutes the self of this whole world; that is the truth; that is the self (ātman). And that's how you are, Śvetaketu.
Uddālaka Āruṇi · Chāndogya Upaniṣad 6.8.7 (trans. Patrick Olivelle) · c. 7th–6th century BCE (disputed)
```

Notably, Uddālaka never uses the word *brahman*, here or anywhere else in the Upaniṣads. The famous reading of *tat tvam asi* as declaring the self identical with brahman is Śaṅkara's, centuries later. Madhva's school even divided the words to read "you are *not* that".

## Yājñavalkya: the Self That Cannot Be Seen

In the Bṛhadāraṇyaka the leading teacher is Yājñavalkya, who thinks of ātman "more in terms of consciousness than as a life-giving essence". At the court of King Janaka of Videha a thousand cows are offered to the most learned brahmin. Yājñavalkya claims them and defeats every challenger, Uddālaka among them. Paul Deussen compared the portrait to Socrates in Plato's dialogues.

His key argument concerns what the self could be. We know the self through what it does, not through the senses. As consciousness, it is what knows, so it "cannot be an object of consciousness". What cannot be an object of knowledge cannot be given attributes, so it can be described only by negation: *neti neti*, "not this, not this". In Olivelle's translation: "About this self (atman), one can only say 'not—, not—'. He is ungraspable, for he cannot be grasped."

The Upaniṣads also record disagreement among their teachers. Yājñavalkya calls dreamless sleep the "highest bliss"; in the Chāndogya the god Prajāpati, teaching Indra over more than a hundred years, treats that account as incomplete and concludes that the self is "the one who is aware". These rival pictures return in Self and No-Self: Personal Identity East and West.

## Gārgī and Maitreyī

Two women question Yājñavalkya. At Janaka's court **Gārgī Vācaknavī** asks what each layer of the world is "woven" on, pushing the regress of supports up to the worlds of brahman. Yājñavalkya warns that her head will fall off if she asks too much, and she falls silent. Later she returns with two final questions; he answers with the doctrine of the imperishable (*akṣara*), across which even space is woven, and she declares him unbeatable. Whether his threat is coercion, or marks the limit of legitimate questioning (one cannot ask what supports the support of everything), is a matter of interpretation.

**Maitreyī** is one of Yājñavalkya's two wives. As he prepares to renounce the world and divide his property, she asks whether the whole earth full of wealth would make her immortal. He says it would not.

```quote
What should I do with that through which I may not be immortal? What you know, Sir – that, indeed, tell me!
Maitreyī · Bṛhadāraṇyaka Upaniṣad 2.4.3 (trans. Robert Ernest Hume, 1921) · c. 7th–6th century BCE (disputed)
```

He teaches that a husband is dear not for love of the husband but "for the love of the Self" (in Hume's translation), and that by seeing and reflecting on one's self "one gains the knowledge of this whole world" (Olivelle).

What do these scenes tell us? Black notes that ātman is grammatically masculine, that the teachings use "overtly androcentric metaphors", and that Yājñavalkya assumes the knowers of the self will be brahmin men; yet the texts do show women "participating in philosophical discussions and debates". Doniger sees Maitreyī not as an author but as part of a story about a brahmin with two wives of differing intellect; Karen Pechilis reads her as theologically minded, challenging Yājñavalkya and asking the right questions. Steven Lindquist (2008) sets aside the choice between dismissing these women as fictions and treating them as straightforward evidence, and asks what literary work they do in the text.

```checkpoint
q: Why does Joel Brereton argue that *tat tvam asi* should not be translated "Thou art that"?
a*: Because the neuter "that" (*tat*) cannot correspond to the masculine "you" (*tvam*), so the sense is "in that way you are".
a: Because the phrase does not appear in the Chāndogya Upaniṣad at all.
x: It does: it first appears at Chāndogya 6.8.7 and recurs as a refrain in Uddālaka's teaching.
a: Because Uddālaka explicitly says the self is not brahman.
x: Uddālaka never uses the word brahman at all; the "you are not that" reading belongs to Madhva's later school.
a: Because Śaṅkara showed that the phrase was a later insertion.
x: Śaṅkara is the source of the identity reading, not a critic of the phrase.
hint: Think about the grammar of the two Sanskrit pronouns.
why: Brereton, followed by Olivelle and Doniger, argues that "you are that" would need *sa tvam asi*; the refrain says Śvetaketu shares the nature of the fine essence. The identity reading is Śaṅkara's later interpretation.
---
q: How does Yājñavalkya argue that the self can be described only by negation ("not this, not this")?
a: Because the self is too small to perceive, like salt dissolved in water.
x: The salt experiment is Uddālaka's, and it concerns an invisible essence pervading things, not negative description.
a: Because the Vedas forbid speaking about the self.
x: Yājñavalkya speaks about the self at length; his point is about what kind of thing it is, not a prohibition.
a*: Because the self is consciousness itself, which cannot be an object of consciousness and so cannot be given attributes.
a: Because the self does not exist.
x: That is closer to the later Buddhist position; Yājñavalkya affirms the self while denying it can be an object.
hint: What would it take to describe something positively?
why: We know the self through what it does. Since it is the knower, it cannot be known as an object, and what cannot be an object cannot be given attributes, so only negations fit it.
```

## Is the Self Brahman?

The identification of ātman with brahman is often treated as the central teaching of the Upaniṣads, and it is certainly there. Śāṇḍilya says that the self within the heart is "smaller than a grain of rice or barley… but it is larger than the earth", and identifies it with brahman. The Bṛhadāraṇyaka says that in the beginning the world was only brahman, "thinking: 'I am brahman.' As a result, it became the Whole", the source of the later formula *aham brahmāsmi*.

But Black cautions that this is "not the only characterization". Uddālaka does not make it, and even in Śāṇḍilya it is "often unclear" whether full identity is meant or whether ātman is "an aspect or quality of brahman". Some passages are frankly materialist, making brahman space or tracing everything to water or wind. And the Upanishadic self is often active, a controller or creator, unlike the "changeless and inactive" self of later Sāṃkhya, Yoga and Advaita.

The single doctrine came later, when Śaṅkara (c. 700 CE), Rāmānuja (eleventh–twelfth century) and Madhva (thirteenth century) each wrote commentaries presenting the Upaniṣads as one consistent position, as Vedānta: Śaṅkara, Rāmānuja and Madhva explains. The Buddhists, meanwhile, rejected "any notion of an indivisible and unchanging self", the subject of The Buddha and Early Buddhist Philosophy.

## Karma, Rebirth and the Slow Arrival of Liberation

*Karma* literally means "action", and it began as a ritual idea: correctly performed ritual brings good results. The Upaniṣads, Black stresses, "do not offer any explicit theory of karma", but they stretch the notion towards moral consequence. Asked privately what becomes of a person after death, Yājñavalkya says one becomes good by good action and bad by bad action, presenting karma, on Black's reading, "more as a theory to promote good actions, than as a fatalistic doctrine".

The fullest early account is the teaching of the five fires. The dead pass as smoke to the other world and become soma, then rain cloud and rain, then earth and food, then semen in a man and an embryo in a woman. Those who know this go by the path of the gods to the world of brahman; those who do not go by the path of the ancestors and are reborn. The Chāndogya adds that people of pleasant conduct enter the womb of a brahmin, kṣatriya or vaiśya, those of foul conduct the womb of "a dog, a pig, or an outcaste". Karma here is "an impersonal moral force", not directed by any god, and it is tied to the *varṇas*, the four social orders of priests, warriors and rulers, Vaiśyas and Śūdras. Strikingly, the teacher is a kṣatriya king, Pravāhaṇa Jaivali, who says this knowledge had not reached brahmins before.

What the early texts lack matters as much. The word *saṃsāra*, the endless round of rebirth, first appears in the comparatively late Kaṭha and Śvetāśvatara, and *mokṣa* takes on the sense of liberation only in later texts. The early Upaniṣads generally do not assume that life is suffering; they "focus much more attention on securing wealth, status, and power in this lifetime". Their goal is immortality (*amṛta*, "not dying"), understood variously as long life, survival in heaven, union with the essence of the universe or preservation in social memory.

Where did karma and rebirth come from? Some scholars, such as Yuvraj Krishan and Wynne, argue they developed within the Vedic tradition. Flood thought it "very possible" that they entered brahmin thought from the *śramaṇas*, the renouncer movements that flourished as cities grew in the Ganges plain in the mid-first millennium BCE (see the History chapter Classical India: the Mauryas to the Guptas). Bronkhorst's "Greater Magadha" thesis traces them to a non-Vedic culture to the east, home of the Buddha and Mahāvīra; critics question its sharp east–west divide. O'Flaherty saw a composite of several strands, while judging that the evidence supports no single theory of origin. Karma and rebirth became shared ground for Hindus, Buddhists and Jains, while materialists rejected them, as Jains, Ājīvikas and Materialists: India's Other Dissenters describes.

The Kaṭha shows the newer mood. The boy Naciketas, whose father gives him "to death", waits three nights at the house of Yama and asks, as his third boon, whether a person exists after death. He refuses every bribe of wealth and pleasure. Yama then pictures the self as the rider in a chariot: the body is the chariot, the intellect the charioteer, the mind the reins, the senses the horses. Reining in the senses is called yoga.

## The Bhagavad Gītā

The Bhagavad Gītā, 700 verses in 18 chapters, forms part of the sixth book of the epic Mahābhārata. It is generally dated to the second or first century BCE, though estimates run from the fifth century BCE to the first century CE. Tradition credits it to Vyāsa, whom scholars regard as mythical or symbolic, and many see it as composite. Whether it was inserted into the epic (Shyam Ranganathan) or conceived as its climax (van Buitenen) is debated. Its chapter colophons call it an upaniṣad, though tradition classes it as remembered tradition (*smṛti*) rather than revealed scripture.

Before the war between the Pāṇḍavas and their cousins the Kauravas, the warrior Arjuna asks his charioteer Kṛṣṇa, an avatar of the god Viṣṇu, to drive between the armies. Seeing kin and teachers opposite, he refuses to fight. Ranganathan, following Jezic, suggests the authors knew the Kaṭha: Kṛṣṇa, as charioteer, takes the place of the intellect. The Gītā is widely read as a synthesis of Vedic duty, Sāṃkhya-based yoga and knowledge, and *bhakti* (devotion to God) that reconciles renunciation with action. Flood and Martin say it rejects the śramaṇa path of non-action, emphasising instead "the renunciation of the fruits of action".

{{image: Bhagavad Gita | Kṛṣṇa and Arjuna on the chariot at Kurukṣetra, the setting of the Bhagavad Gītā, as later Indian artists imagined the scene.}}

## Kṛṣṇa's Argument for Acting Without Attachment

Arjuna's case is a moral one. The war will kill kin on both sides, so victory brings no joy; fighting would make him no better than the Kauravas; and war destroys social order. The question, in Arvind Sharma's words, is: "Is it morally proper to kill?" Kṛṣṇa's reply can be set out as follows.

1. The self cannot be killed: selves are eternal, so "no one kills anyone". Grief for the dead rests on a mistake.
2. Arjuna's own duty (*svadharma*) is that of a kṣatriya, a warrior, and shrinking from it is dishonourable.
3. Action is unavoidable: even refusing to act is a choice and an action.
4. What binds a person is not action but attachment to its fruits. In the Sanskrit of verse 2.47, *karmaṇy evādhikāras te mā phaleṣu kadācana*: you have a right to the action, never to its fruits. Yoga is "skill in action".
5. It is better to do one's own duty imperfectly than another's well, since duty suits one's nature.
6. Actions can be offered to God as devotion, as Kṛṣṇa himself acts for "the welfare of the world".
7. Therefore Arjuna should fight, as duty and without desire for its results. This is *karma yoga*, the discipline of action, and it is compatible with liberation.

**The objection.** B. R. Ambedkar (1891–1956), born into the Mahar caste, which was treated as untouchable, attacked the Gītā for "defending certain dogmas of religion on philosophical grounds". In Klausen's summary of his essay "Krishna and his Gita", it offers a defence of the warrior's duty to kill and "the assertion that varna derives from birth rather than worth or aptitude". As reported, Ambedkar argued that the Gītā both calls the four-varṇa order God-made and grounds it in inborn qualities (*guṇas*), and that the grounding fails, not least because three qualities cannot generate four orders. D. D. Kosambi quoted Kṛṣṇa's words "The four-caste (class) division has been created by Me" and remarked that "practically anything can be read into the Gita by a determined person, without denying the validity of a class system". Put generally: if duty is fixed by birth and must be done whatever the outcome, detachment can sanctify a hierarchy and silence the very moral doubts with which Arjuna began.

**The replies.** Universalist readers point to verses on the equality of all selves, in which the wise see the Lord "dwelling equally in all beings". Vivekananda took *svadharma* to mean the duty of one's life situation or profession, Aurobindo one's own nature and capacities, and Dnyaneshwar (1275–1296) held that the Gītā's lessons are for everyone. Ranganathan argues that while karma yoga ties duty to one's nature in a "world of diversity", the path of knowledge yields "an insight into the radical equality of all persons". Yet Jacqueline Hirst calls the universalist readings modernist. The fairest verdict is that the principle of detached action can be separated from caste, but the objection still stands against the text as written.

```checkpoint
q: According to Black, what was the common goal of the early Upaniṣads?
a: Liberation (*mokṣa*) from an endless cycle of suffering.
x: The words *saṃsāra* and *mokṣa* (as liberation) appear only in later Upaniṣads, and the early texts generally do not assume that life is suffering.
a*: Immortality (*amṛta*, "not dying"), understood in several different ways.
a: The overthrow of the varṇa hierarchy.
x: The early texts largely assume the varṇas, and one passage ties rebirth to them.
a: Devotion (*bhakti*) to a personal god.
x: The early Upaniṣads describe ultimate reality in impersonal terms; theism grows in the later verse texts and the Gītā.
hint: Think of Maitreyī's question to Yājñavalkya.
why: The early texts present life as desirable and focus on wealth and status; their shared aim is immortality, read as long life, heaven, union with the essence of things or social memory. The language of liberation from rebirth comes later.
---
q: What is the force of the Ambedkar–Kosambi objection to Kṛṣṇa's argument?
a: That the Gītā wrongly claims the self can be killed.
x: Kṛṣṇa's first premise is the opposite: the self cannot be killed.
a: That the Gītā was written by Vyāsa and so cannot be trusted.
x: The objection is about content, not authorship; scholars in any case regard Vyāsa as mythical or symbolic.
a: That the Gītā forbids all action and so leaves Arjuna paralysed.
x: The Gītā insists that action is unavoidable and rejects the path of non-action.
a*: That if duty is fixed by birth and done regardless of outcome, detached action can sanctify caste hierarchy.
hint: Which premise of Kṛṣṇa's argument ties duty to Arjuna's social position?
why: Ambedkar read the Gītā as defending varṇa by birth, and Kosambi quoted Kṛṣṇa's claim to have created the four-caste division. Universalist readers reinterpret *svadharma*, but critics reply that those readings are modern.
```

## The Travels of a Secret Teaching

The Upaniṣads reached the wider world through Persian. Around 1657 Dārā Shikoh, eldest son of Shah Jahan, completed a Persian version of fifty Upaniṣads, the *Sirr-i-Akbar* ("The Greatest Secret"), the most influential of the Persian versions (translators at Akbar's court had begun such work earlier). He identified them with the "hidden book" of the Qur'an. Defeated by his brother Aurangzeb, he was executed in 1659 after being declared an apostate.

From that Persian text Anquetil-Duperron made a Latin translation, the *Oupnek'hat*, published at Strasbourg in 1801–02. Rammohan Roy's translations, including an English Kena (1816) and Bengali versions, served his campaign against idolatry and caste hierarchy.

Arthur Schopenhauer began reading the *Oupnek'hat* in 1814 and named the Upaniṣads, with Kant and Plato, as his most important influences. In *Parerga and Paralipomena* (1851) he praised them as the most profitable and elevating reading in the world, the solace of his life and of his death, and he read them before going to sleep. His Upaniṣads were a Latin version of a Persian version, not the Sanskrit, a story Schopenhauer and Kierkegaard takes up. Erwin Schrödinger later wrote: "Their multiplicity is only apparent, in truth there is only one mind. This is the doctrine of the Upanishads." That shows how far the Advaita reading travelled; the texts themselves speak with several voices.

## Further exploration

- **Patrick Olivelle (trans.), *Upaniṣads* (1996).** The Oxford World's Classics translation of the principal Upaniṣads, the source of several quotations here.
- **Patrick Olivelle, *The Early Upaniṣads: Annotated Text and Translation* (1998).** Sanskrit and English, with the standard chronology.
- **Brian Black, *The Character of the Self in Ancient India: Priests, Kings, and Women in the Early Upaniṣads* (2007).** How the dialogues and their characters, including Gārgī and Maitreyī, carry the philosophy.
- **Jonardon Ganeri, *The Concealed Art of the Soul* (2007).** A philosophical study of self and truth in Indian thought, starting from the Upaniṣads.
- **Johannes Bronkhorst, *Greater Magadha: Studies in the Culture of Early India* (2007).** The controversial case that karma and rebirth came from a non-Vedic eastern culture.
- **Richard H. Davis, *The Bhagavad Gita: A Biography* (2014).** The Gītā's afterlife, from the classical commentators to Gandhi and Oppenheimer.
- **Signe Cohen, *The Classical Upaniṣads: A Guide* (2024).** A recent guide to the principal texts.$upanishads_master$,
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
  select $upanishads_quiz$[
    {"type": "mcq", "prompt": "Which statement best describes how scholars date the early Upaniṣads?", "options": ["By radiocarbon dating of the oldest manuscripts", "From inscriptions naming the kings who sponsored them", "From internal evidence such as archaism, style and repetitions across texts, which allows only ranges of centuries", "From the authors' own statements of when they wrote"], "answerIndex": 2, "explanation": "The texts were oral and anonymous, and written down much later. Stephen Phillips notes that all opinions rest on archaism, style and cross-text repetition, plus assumptions about how ideas developed; Olivelle warns that any precision closer than a few centuries is 'as stable as a house of cards'.", "id": "q1"},
    {"type": "mcq", "prompt": "What does the word *upaniṣad* seem to have meant in its earliest contexts?", "options": ["A hidden connection or equivalence, often a 'secret teaching'", "Sitting down near a teacher", "A hymn of praise to the gods", "A forest retreat for renouncers"], "answerIndex": 0, "explanation": "'Sitting down near' a teacher is a popular later gloss. In the earliest texts the word means something like *bandhu*, a hidden connection or equivalence, and often a secret teaching.", "id": "q2"},
    {"type": "mcq", "prompt": "Which is true of Uddālaka Āruṇi's teaching to Śvetaketu in the Chāndogya Upaniṣad?", "options": ["He states that the self is identical with brahman", "He uses the word brahman in every lesson", "He argues that creation came from nothing", "He never uses the word brahman, and his refrain may mean 'that's how you are'"], "answerIndex": 3, "explanation": "Uddālaka never uses the word brahman anywhere in the Upaniṣads. Brereton, Olivelle and Doniger read *tat tvam asi* as 'that's how you are'; the identity reading is Śaṅkara's later interpretation. Uddālaka argues that creation is the transformation of an original being, not something from nothing.", "id": "q3"},
    {"type": "mcq", "prompt": "Where do the terms *saṃsāra* (the round of rebirth) and *mokṣa* in the sense of liberation first appear?", "options": ["In the Ṛgveda's Nāsadīya hymn", "In comparatively late Upaniṣads such as the Kaṭha and Śvetāśvatara", "In the oldest parts of the Bṛhadāraṇyaka Upaniṣad", "Only in Śaṅkara's commentaries"], "answerIndex": 1, "explanation": "The early Upaniṣads have no explicit theory of karma and aim mainly at immortality. *Saṃsāra* first appears in the Kaṭha and Śvetāśvatara, and *mokṣa* takes on the sense of liberation only in later texts, so these doctrines emerged gradually.", "id": "q4"},
    {"type": "open", "prompt": "Is the identity of ātman and brahman 'the' teaching of the Upaniṣads? Use at least two teachers from the texts in your answer.", "rubric": "A strong answer notes that the identification is present (Śāṇḍilya in the Chāndogya; 'I am brahman' in the Bṛhadāraṇyaka; Yājñavalkya) but that Black calls it 'not the only characterization'. It points out that Uddālaka never uses the word brahman, that 'tat tvam asi' is read by Brereton and Olivelle as 'that's how you are', and that even in Śāṇḍilya it is unclear whether identity or aspect is meant. Credit mention of materialist passages, of disagreements among teachers (Yājñavalkya and Prajāpati on dreamless sleep), and of how Śaṅkara, Rāmānuja and Madhva later read the texts as one system in different ways.", "id": "q5"},
    {"type": "open", "prompt": "Reconstruct Kṛṣṇa's argument that Arjuna should fight, then give the strongest objection to it and the best reply.", "rubric": "A strong answer sets out Arjuna's moral doubts and Kṛṣṇa's steps: the self cannot be killed; Arjuna's svadharma is a warrior's; action is unavoidable; what binds is attachment to fruits, not action (2.47, 'a right to the action, never to its fruits'); one's own duty is better than another's; actions may be offered to God; so he should fight without desire for results (karma yoga). It gives the Ambedkar–Kosambi objection that duty fixed by birth turns detachment into a defence of varṇa hierarchy (Gītā 4.13). It gives replies: verses on the equality of all selves, Vivekananda's and Aurobindo's reinterpretations of svadharma, Ranganathan's reading; and notes Hirst's view that universalist readings are modernist, so the objection still bears on the text as written.", "id": "q6"}
  ]$upanishads_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/upanishads', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
