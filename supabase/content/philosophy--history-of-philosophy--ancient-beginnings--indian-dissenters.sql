-- Jains, Ājīvikas and Materialists: India's Other Dissenters — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/indian-dissenters @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/indian-dissenters',
    'research',
    'advanced',
    'read',
    $dissenters_master$> **Three movements that refused the authority of the Veda.** Alongside the Buddha, ancient India produced other dissenters from Vedic scripture. This chapter covers the Jains, whose metaphysics treats karma as a kind of matter and whose ethics of non-violence (*ahiṃsā*) is among the most demanding ever devised; their doctrine of many-sidedness (*anekāntavāda*) and its sevenfold predication; and their long internal debate over whether women can be liberated. It then turns to the Ājīvikas, remembered as fatalists, and to the Cārvāka or Lokāyata materialists, who denied rebirth and are said to have accepted perception alone. Both are known almost entirely through their enemies. The Cārvāka argument against inference is set out step by step, with the Nyāya, Buddhist and Jain replies.

## Outside the Veda

Classical Indian schools "either admitted or denied the infallibility of the Vedas", in Amita Chatterjee's summary. Vedānta, Mīmāṃsā, Sāṃkhya, Yoga, Nyāya and Vaiśeṣika upheld that authority. Cārvāka materialism and the various schools of Buddhism and Jainism challenged it, and with it the authority of the brahmin caste. Opponents called such schools *nāstika*, a term of criticism whose "greatest recipient", one scholar notes, was the Cārvāka; as What Is Philosophy? explains, the division into orthodox and heterodox schools is a later scholarly construct.

The dissenters came out of the *śramaṇa* movements of wandering ascetics in "Greater Magadha" (the History chapter Classical India: the Mauryas to the Guptas describes the setting). A Buddhist text gives a snapshot of the competition. In the *Sāmaññaphala Sutta* (Dīgha Nikāya 2), King Ajātasattu of Magadha tells the Buddha what six famous teachers said when he asked about the visible fruit of the ascetic life. Pūraṇa Kassapa denied that actions have any moral effect. Pakudha Kaccāyana held that there are seven eternal, non-interacting substances, so that a killer harms no one: "It is simply between the seven substances that the sword passes." Sañjaya Belaṭṭhaputta refused to commit himself to anything ("I don't think so… I don't think not. I don't think not not"), which Buddhist texts elsewhere (the Brahmajāla Sutta) mock as "eel-wriggling". The other three are the subjects of this chapter: Ajita Kesakambalī the materialist, Makkhali Gosāla the fatalist, and Nigaṇṭha Nātaputta, whom the Jains know as Mahāvīra. Every summary is a rival's report (quoted here in Thanissaro Bhikkhu's translation); the Buddha's own answer is the subject of The Buddha and Early Buddhist Philosophy.

## Mahāvīra and the Ford-Makers

For Jains, Mahāvīra ("the Great Hero", born Vardhamāna) is the twenty-fourth and last *tīrthaṅkara*, or "ford-maker", of the present cosmic period: one who makes a crossing over the river of rebirth. His dates are disputed. Jain tradition gives 599–527 BCE (the Digambara sect puts his death in 510). Scholars who date the Buddha later move Mahāvīra too: Paul Dundas suggests he died around 425 BCE or a few years after, and Jeffery Long gives c. 499–427 BCE. Historians place him in the sixth or, increasingly, the fifth century BCE, an older contemporary of the Buddha. His life story is strikingly close to the Buddha's: he left a royal family, practised severe asceticism, reached omniscience (*kevala-jñāna*) and founded a community. The difference is that he joined a tradition already in existence. His predecessor Pārśva, the twenty-third ford-maker, is the earliest whom historians accept as a real person, variously dated from the ninth to the sixth century BCE, and Mahāvīra's parents are said to have followed him. Pārśva taught a "fourfold restraint" (no violence, no lying, no stealing, no possessions); Mahāvīra's five great vows added celibacy.

Jainism later divided into two main communities: the Digambaras ("sky-clad"), whose monks go naked, and the Śvetāmbaras ("white-clad"). Each sect tells a story of the other's breakaway, but modern scholars such as Padmanabh Jaini and Dundas see instead a gradual hardening of differences over several centuries, already visible in inscriptions of the first century CE. The Digambaras reject the Śvetāmbara canon, codified in the fifth century CE, but both accept the *Tattvārthasūtra* ("Treatise on What There Is"), associated with Umāsvāti, probably the work of several authors around 150–400 CE and the first classic of Jain philosophy in Sanskrit. Today Jainism has between four and five million followers.

## Selves, Matter and Karma

"Jaina metaphysics", writes Marie-Hélène Gorisse, "is an atomist and dualist conception of the world." On one side are selves (*jīva*), whose defining mark, according to the *Tattvārthasūtra*, is experience. There are as many selves as living beings, each eternal, active, and the same size as its body, expanding and contracting like a lamp's light in a pot or in a room. Against the Buddhists there really are selves; against the Brahmanical view that every self is ultimately one with a universal self, there are many. On the other side are non-selves (*ajīva*): matter, space, a medium of motion, a medium of rest and, in some traditions, time.

The distinctive move is to make karma physical. In Jainism karma is "a subtle type of matter that fills all cosmic space". The passions act as a glue, making karmic particles stick to the self and obscure its knowledge and perception. Gorisse's image is a red-tinted mirror (the word *rāga* means both "red" and "passion"). Since karma is a substance, good karma binds as surely as bad; liberation is not earning merit but purging the self of all karmic matter. The *Tattvārthasūtra*'s seven categories tell the story: self, non-self, the inflow of karmic matter, bondage, the stopping of inflow, the wearing away of what is bound, and liberation.

```quote
The path to liberation is constituted by right view (darśana), right knowledge, and right conduct.
Umāsvāti (attrib.) · Tattvārthasūtra 1.1 (trans. as given by Marie-Hélène Gorisse) · c. 150–400 CE
```

There is no creator. Atoms have always existed and combine by natural laws, and Jain philosophers repeatedly refuted the Nyāya arguments for God, since a consciousness controlling the world would undermine moral responsibility.

The Jains also classified living beings by their senses, from plants and the "elemental" beings of earth, water, fire and air, which have touch alone (so there are souls in stones and metals), up to five-sensed beings such as humans, birds and gods. Only humans can reach liberation.

## Non-Violence

If every living thing, down to a drop of water, embodies a permanent self, then harming any of them binds karma. Hence the Jain association of renunciation with *ahiṃsā*, non-violence. Violence can be done directly, through another, or merely by permitting it, and in body, speech or mind. Gorisse puts it bluntly: "This version of non-violence is so extreme that one's restrained action is very close to one's mere absence of act, since even breathing, drinking water, or walking can prove harmful." Digambara monks carry a peacock-feather broom to move insects from their path; Śvetāmbara ascetics wear a small mouth-cloth. Lay Jains take lesser vows; monastics must spare even one-sensed beings, so they cannot cook, and lay donors feed them. The idea that our duties reach far beyond human beings returns in Animals and the Environment.

The ethics changed over time. In the early canon violent acts themselves are what bind; in later texts the passions matter, so intention counts and unintended harm can be forgiven. Dundas quotes the sixth-to-seventh-century thinker Jinabhadra: "It is the intention that ultimately matters… a man does not become a killer only because he has killed… a doctor has to cause pain but is still non-violent."

The most controversial practice is *sallekhanā*, a ritual fast to death by slowly giving up food and drink, open to ascetics and householders in old age, famine or incurable illness. Jain scholars deny that it is suicide, because it is not an act of passion and uses no weapon or poison; its point is a death "free from fears and desires", since one's last volitions shape the next life. In 2015 the Rajasthan High Court banned it as suicide; in 2016 the Supreme Court of India stayed that ruling.

## Can Women Be Liberated?

Digambaras hold that women cannot attain liberation in a woman's body; Śvetāmbaras hold that they can. The Digambara argument runs:

1. Complete non-possession, including of clothing, is essential to the path; Mahāvīra practised naked asceticism, as both sects agree.
2. Women cannot go naked; both sects agree that nudity is not permitted for nuns.
3. So a woman's renunciation is always partial, and the most a nun can achieve is rebirth as a man.

Supplementary arguments in Jain texts call women naturally weaker and full of passion, and claim that their bodies generate and destroy tiny beings, so that they constantly break the vow of non-violence. Jaini also reports an argument that because women cannot be reborn in the lowest hell, they lack the extreme capacity for action that liberation, at the other pole, requires.

The Śvetāmbara reply attacks the first premise. Clothes are not possessions that bind but tools that make the restrained life possible, and nudity is inappropriate in the present age; nothing in scripture rules out women's liberation. They add that the nineteenth ford-maker, Mallī, was a woman, which Digambaras deny. Yet the Śvetāmbara side is not simply egalitarian: Mallī's female birth is explained as the karmic result of deceit in a past life, and texts of both sects call women deceitful. Jaini's *Gender and Salvation* (1991) collects six texts from the debate, written between about 150 and 1700 CE; among the defenders of women's spiritual abilities was the ninth-century Śākaṭāyana of the Yāpanīya sect.

## Many-Sidedness and the Sevenfold Predication

The doctrine many scholars count as Jainism's major contribution to philosophy is *anekāntavāda*, "non-one-sidedness": reality is many-sided, so that no single view captures it whole. Its roots are metaphysical. Every existing thing is at once persistent and changing: "Existence is endowed with production, decay and duration" (*Tattvārthasūtra* 5.29). A clay pot already existed as clay, its substance (*dravya*), but did not exist before as this shape with this use, its modes (*paryāya*). Asked whether the world is eternal, Mahāvīra answers in the *Bhagavatī Sūtra* that it is eternal ("it was, it is and it will be") and also non-eternal, since it passes through cycles. He does not contradict himself; he refutes extreme views by making the parameters explicit. The Buddha, by contrast, was known for refusing to answer such questions.

The method was formalised as *syādvāda*, the doctrine of *syāt*, a word meaning "perhaps", "somehow" or "from a perspective". Take any object *a* and any property F. There are seven ways (*saptabhaṅgī*) to predicate F of *a*, each prefaced by *syāt*:

1. From one perspective, *a* is F.
2. From another, *a* is not F.
3. From a third, *a* is F and is not F.
4. From a fourth, *a* is inexpressible.
5. *a* is F and inexpressible.
6. *a* is not F and inexpressible.
7. *a* is F, is not F, and is inexpressible.

Samantabhadra (sixth century on one dating), among the first to teach the first four, explains that a thing "is" with respect to its own form, substance, place, time and state, and "is not" with respect to what is alien to it: not being blue is part of what the red pot is. Inexpressibility arises when existence and non-existence are considered at the same time. On the early view all seven statements are true together, so they are not seven truth-values but seven true angles on one thing. The theory of perspectives (*nayavāda*) went further, treating rival schools as each overdoing one legitimate standpoint: Advaita Vedānta exaggerates unity, the Buddhists the present moment, the Cārvākas everyday empirical difference. How this relates to other Indian and Greek logics is taken up in Logic across Traditions.

Critics pressed two objections. Śaṅkara, among others, charged plain inconsistency: forms 3 and 7 assert a proposition together with its negation. The Jain reply is that *syāt* indexes each claim to a perspective, and there is no contradiction in saying a pot exists as clay but not as this shape. The deeper charge is self-defeat. If every claim is only "perhaps" true, so is anekāntavāda itself, and the Jain must allow that perhaps reality is not many-sided. "What begins as a laudable fallibilism ends as an untenable relativism," is Webb's verdict. Two replies are available. Gorisse argues that Jain perspectives are grounded in a realist ontology: they multiply "because the known object itself has many aspects", not at the knower's whim. And scholars such as Dundas and Long note that the "perhaps" governs claims about reality, not ethics; about the five vows there is no "perhaps".

The doctrine is often illustrated by the blind men who each feel one part of an elephant. The oldest datable version, however, is Buddhist (Udāna 6.4), told against quarrelling sectarians who come to blows; Jain use is attested in later texts, such as those of Vidyānandi (ninth century) and Malliṣeṇa (thirteenth), where the moral changes: each blind man grasps something real.

```checkpoint
q: Why, in Jain thought, does even good karma keep a self bound to rebirth?
a*: Because karma is a subtle form of matter that sticks to the self, so all of it must be purged.
a: Because good karma is a reward from the gods that must be repaid.
x: Jains deny a creator, and the gods themselves are subject to karma; karma is not a divine reward.
a: Because only bad intentions count, and good deeds are morally neutral.
x: Later Jain texts do stress intention, but the reason good karma binds is that karma is material, not that good deeds are neutral.
a: Because the self is identical with the universal self and so cannot be liberated individually.
x: Jains reject the view that individual selves are ultimately one with a universal self; selves are many.
hint: Think about what kind of thing karma is for the Jains.
why: Karma is subtle matter, glued to the self by the passions. Since liberation is the self's freedom from all karmic matter, good karma is as much an obstacle as bad.
---
q: What is the Jain answer to the charge that statement 3 of the sevenfold predication ("a is F and is not F") is a contradiction?
a: That contradictions are sometimes true, since reality is irrational.
x: Jains are realists who avoid contradiction; they do not embrace irrationality.
a: That statement 3 is false, and only statements 1 and 2 are true.
x: On the early Jain view all seven statements are true together.
a*: That each part is true from a different perspective, as a pot exists as clay but not as this shape.
a: That the predication applies only to words, not to things.
x: Jain perspectives are grounded in the object itself, which has many real aspects.
hint: What does the word *syāt* add?
why: *Syāt* ("from a perspective") indexes each claim. A thing exists with respect to its own substance, form, place and time and not with respect to what is alien to it, so the two claims do not clash.
```

## Gosāla and the Ājīvikas: Fate Seen by Its Enemies

The Ājīvikas, whose name comes from *ājīva*, "livelihood" or "way of life", are known for the doctrine of *niyati*, "fate", and for denying free will. Their scriptures are lost. Everything we know comes from Buddhist and Jain texts, which most scholars regard as coloured by sectarian hostility. Their leader, Makkhali Gosāla, was a contemporary of Mahāvīra and the Buddha; A. L. Basham dates his death to 484 BCE, and some scholars think the movement is older than he is.

The Jain account makes him Mahāvīra's companion for six years until they quarrelled, and the Jains made him their stock example of a human self falling to the lowest form of life, for disrespecting Mahāvīra. Episodes that reflect so poorly on him are themselves a sign of sectarian bias.

On his doctrine Buddhists and Jains agree. Gosāla was a rigid determinist for whom *niyati* was the sole agent of change. In the Buddhist report, there is no cause for beings' defilement or purification; fools and wise alike pass through a fixed span of aeons and then reach the end of suffering, as a thrown ball of string unwinds to its end. Karma, on this view, cannot be altered by effort.

Yet the Ājīvikas lived as naked ascetics. Why practise austerities if nothing can change one's fate? Dundas doubts that a doctrine genuinely denying the efficacy of effort could have grounded a renunciant path, and suspects that "the Jains and Buddhists deliberately distorted Ajivika doctrine". Bronkhorst proposes that Gosāla taught that asceticism can stop the inflow of new karma but cannot destroy old karma, which would explain both the practice and the movement's popularity. Others reply that where two rival hostile traditions agree, their testimony can be trusted. Whether effort is pointless if everything is fixed is pursued in Free Will and Determinism.

The Ājīvikas were not marginal. They reached their height under the Maurya emperor Bindusāra, and the emperor Aśoka dedicated caves to them in the Barabar hills of Bihar: "By king Priyadarsin, (when he had been) anointed twelve years, this Banyan cave was given to the Ajivikas" (Hultzsch's translation). After the Mauryas they fade in the north, though they survived in South India until about the fourteenth century; their name was later chiselled out of several Barabar inscriptions.

{{image: Barabar Caves | The carved entrance of the Lomas Rishi cave in the Barabar hills of Bihar. In these hills the emperor Aśoka dedicated rock-cut caves to the Ājīvikas.}}

## The Materialists

The materialists went under several names: *Lokāyata* ("worldly", or perhaps "prevalent among the people"); *Cārvāka*, of uncertain etymology; and *Bārhaspatya*, after their legendary founder Bṛhaspati. (In Kauṭilya's *Arthaśāstra*, Lokāyata seems to mean a science of debate; only later does it mean materialism.) Ajita Kesakambalī, one of the Buddha's six rivals, is often treated as a forerunner; in an early English translation of the Buddhist report, he taught that a human being "is built up of four elements" and that at death "fools and wise alike… are cut off, annihilated". Nothing he wrote survives.

The school's own base text, the *Bṛhaspati-sūtra*, is lost, known only in fragments quoted by others, which Ramkrishna Bhattacharya collected in 2002. As the historians Chatterjee and Datta observed, there is no systematic materialist work, but almost every work of the other schools states the materialist view in order to refute it. On Bhattacharya's account, the Cārvāka as a system flourished between the eighth and twelfth centuries CE and then disappeared, though an earlier materialism existed before it.

The fullest portrait is in the fourteenth-century *Sarvadarśanasaṃgraha* ("Compendium of All Views"), traditionally ascribed to Mādhava, which sets out sixteen systems, usually read as an ascending order culminating in Śaṅkara's Advaita. The Cārvāka comes first, which is to say lowest. It quotes a famous verse:

```quote
While life is yours, live joyously; / None can escape Death's searching eye: / When once this frame of ours they burn, / How shall it e'er again return?
Cārvāka verse, as quoted by Mādhava (trans. Cowell and Gough) · Sarvadarśanasaṃgraha · 14th century
```

The materialists accepted only four elements: earth, water, fire and air. They rejected atoms, souls, God and space, because none can be perceived. Consciousness arises when the elements combine in the right proportions, although none has it alone, as a red colour emerges from chewing betel-nut with certain other ingredients; the self is the conscious body. Most interpreters read this as reductive; Peter Adamson and Jonardon Ganeri compare it to J. S. Mill's emergentism (see The Mind–Body Problem). The argument was that no consciousness is ever observed without a body; critics replied that "the soul cannot be known" does not entail "the soul does not exist". Things simply act by their own nature (*svabhāva*): fire is hot and water cold. Rebirth, karma, heaven, hell and the efficacy of ritual all went.

Were they the sensualists their enemies describe? The *Sarvadarśanasaṃgraha* has them say that a man should "feed on ghee even though he runs in debt". Bhattacharya argues that no authentic Cārvāka aphorism supports the view that all materialists are sensualists, and that key hedonist passages are missing from many manuscripts. Riepe wrote that they held truth, integrity, consistency and freedom of thought "in the highest esteem". The portrait of egoistic hedonism may be largely the opponents' work.

## The Argument against Inference

The Cārvāka are best known for a theory of knowledge. Indian epistemology asks which *pramāṇas*, or means of valid knowledge, there are. In the stock example, one infers fire on a distant hill from smoke, because smoke is invariably accompanied by fire. That invariable connection is called *vyāpti*, "pervasion". The Cārvāka argument, as their opponents report it, attacks this link:

1. Inference gives knowledge only if the universal connection it relies on (wherever there is smoke, there is fire) is known.
2. Perception grasps only particular, present cases; it cannot survey every past, future and distant instance.
3. Nor can perception show that there is no hidden condition (*upādhi*) on which the connection depends, as fire produces smoke only with wet fuel.
4. The connection cannot be known by another inference, since that inference would need its own universal connection, and so on without end.
5. Nor can it be known by testimony, which presupposes that the speaker tells the truth and so faces the same problem; likewise the other sources.
6. So no universal connection can be established; inference is not a source of knowledge, and perception alone is.
7. So whatever rests only on inference or scripture (God, a soul that survives death, karma, heaven) is not known.

Stephen Phillips calls this "the Cārvāka argument identifying the problem of induction", and others have compared it to Hume. The general problem is the subject of Induction, Probability and Inference to the Best Explanation.

**The pragmatic reply (Nyāya).** The standard answer was that no one can live this way. In Phillips's paraphrase of the logician Gaṅgeśa, "the skeptic himself relies on such generalizations when he opens his mouth to voice his skepticism", using words with repeatable meanings. A real doubter about smoke and fire should not go to fire for smoke or to food for hunger. And the Cārvāka must himself infer: the Jain Akalaṅka pointed out that perception alone cannot show that no omniscient being exists.

**Fallibilism, not scepticism (Buddhist and Nyāya).** Both schools turned the argument into a lesson about care: some inferences rest on pseudo-reasons, but the very idea of a fallacy presupposes that of a genuine reason.

**Grounding the connection.** Buddhists in Dharmakīrti's tradition grounded *vyāpti* in identity of nature or in causation: a śiṃśapā is necessarily a tree, because being a tree is part of what it is. Nyāya appealed to generalisation from positive and negative cases. Jain logicians, conceding that "even the biggest list of particular instances would not suffice to reach certainty", posited a special cognition, *tarka*, that grasps the universal in the particular. These debates shaped the later systems described in The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā and Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic.

**What did the Cārvākas actually hold?** The slogan "perception is the only means of knowledge" comes from Mādhava and others who opposed them. A fragment of the later Cārvāka Purandara, preserved by the Buddhist Kamalaśīla, reportedly says that inference "well known in the world" is accepted even by the Cārvākas; what they reject is inference beyond the everyday, to the imperceptible. Bhattacharya argues that they admitted inference so far as it was grounded on perception. On this reading the materialists were not sceptics about all inference but critics of inference to the unseen: smoke may show fire, but nothing perceived shows heaven. That position is much harder to refute by pointing out that the Cārvāka goes to the fire.

## Jayarāśi: a Sceptic among the Materialists?

One text connected with the tradition does survive. Jayarāśi Bhaṭṭa, who most likely flourished in the early ninth century (c. 800–840), wrote the *Tattvopaplavasiṃha*, "The Lion of the Dissolution of All Categories", which survives in a single palm-leaf manuscript found in 1926 in a library at Patan in Gujarat. Its argument is a circle: to know objects we need valid means of knowledge, to establish those we need proper definitions, but testing definitions requires prior knowledge of real objects. No school's definition of perception, for instance, reliably separates genuine perception from mirage or dream. His method, borrowed from the Madhyamaka of Nāgārjuna, is to refute every version of an opponent's thesis without asserting the opposite. Piotr Balcerowicz calls him a "qualified sceptic" and compares him with the Pyrrhonist "perpetual investigator" of Sextus (see Scepticism and the Answers to It).

Whether he belongs among the Cārvākas is disputed. He calls Bṛhaspati "Honourable", and Eli Franco and Balcerowicz place him within the tradition, Franco seeing a move from "a rather primitive materialism to a highly sophisticated form of scepticism". Debiprasad Chattopadhyaya objected that no one can be both materialist and sceptic, and Bhattacharya denied that Jayarāśi was a Cārvāka at all.

```checkpoint
q: Why do scholars such as Dundas doubt the standard picture of the Ājīvikas as pure fatalists?
a: Because Ājīvika scriptures show that they believed in free will.
x: No Ājīvika scriptures survive; everything comes from Buddhist and Jain sources.
a*: Because they lived as ascetics, and a doctrine that effort is useless seems unable to ground a path of renunciation.
a: Because Aśoka's inscriptions describe their doctrine in detail.
x: The Barabar inscriptions record gifts of caves, not doctrine.
a: Because the Buddhists and Jains disagreed completely about Gosāla's views.
x: On his determinism the two hostile traditions agree, which some scholars take as a reason to trust them.
hint: Think about how the Ājīvikas actually lived.
why: Dundas suspects deliberate distortion by rivals; Bronkhorst suggests Gosāla held that asceticism stops new karma though it cannot destroy old karma.
---
q: What is the "revisionist" reading of the Cārvāka view of inference?
a: That the Cārvākas accepted inference to God but not to rebirth.
x: Inference to God was exactly what they rejected.
a: That they rejected perception as well as inference, like Jayarāśi.
x: Jayarāśi's scepticism about all means of knowledge is a separate case, and his affiliation is disputed.
a: That they were really Buddhists in disguise.
x: Purandara's fragment is preserved by a Buddhist, Kamalaśīla, but no one claims the Cārvākas were Buddhists.
a*: That they accepted everyday inference grounded in perception and rejected only inference to the imperceptible.
hint: Recall the fragment of Purandara.
why: Purandara reportedly accepted inference "well known in the world", and Bhattacharya argues the Cārvākas admitted inference grounded on perception. The "perception only" slogan may be their opponents' simplification.
```

## Further exploration

- **Paul Dundas, *The Jains* (2nd edn, 2002).** The standard history of Jainism, careful on dates, sects and the transformations of non-violence.
- **Padmanabh S. Jaini, *The Jaina Path of Purification* (1979).** A classic account of Jain doctrine and practice.
- **Padmanabh S. Jaini, *Gender and Salvation: Jaina Debates on the Spiritual Liberation of Women* (1991).** Translations of six Jain texts on whether women can be liberated.
- **A. L. Basham, *History and Doctrines of the Ājīvikas* (1951).** Still the fundamental study of the Ājīvikas and their sources.
- **Ramkrishna Bhattacharya, *Studies on the Cārvāka/Lokāyata* (2009).** The fragments and a revisionist reconstruction of Indian materialism.
- **Pradeep P. Gokhale, *Lokāyata/Cārvāka: A Philosophical Inquiry* (2015).** A philosophical reconstruction of the materialists' arguments.
- **Ethan Mills, *Three Pillars of Skepticism in Classical India* (2018).** Nāgārjuna, Jayarāśi and Śrī Harṣa as sceptics, with comparisons to Western scepticism.$dissenters_master$,
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
  select $dissenters_quiz$[
    {"type": "mcq", "prompt": "What is the main reason the Digambaras give for holding that women cannot be liberated in a woman's body?", "options": ["Women may not go naked, so their renunciation of possessions, including clothing, is always partial", "Mahāvīra explicitly forbade women from becoming nuns", "Women are unable to read the scriptures", "The nineteenth ford-maker, Mallī, failed to attain liberation"], "answerIndex": 0, "explanation": "Both sects agree that Mahāvīra practised naked asceticism and that nuns may not go naked. Digambaras hold complete non-possession, including of clothing, to be essential, so a nun's renunciation is partial. Śvetāmbaras reply that clothes are tools, not possessions, and hold that Mallī was a woman who was liberated.", "id": "q1"},
    {"type": "mcq", "prompt": "What is the earliest securely datable version of the parable of the blind men and the elephant?", "options": ["A passage in the Jain Ācārāṅga Sūtra", "Malliṣeṇa's Syādvādamañjarī", "The Buddhist Tittha Sutta (Udāna 6.4), told against quarrelling sectarians", "Śaṅkara's commentary on the Upaniṣads"], "answerIndex": 2, "explanation": "The oldest datable version is Buddhist, and its moral is against dogmatic quarrelling. Jain use, as an illustration of many-sidedness in which each blind man grasps something real, appears in medieval texts such as Malliṣeṇa's thirteenth-century Syādvādamañjarī.", "id": "q2"},
    {"type": "mcq", "prompt": "Why is it hard to know what the Ājīvikas really taught?", "options": ["Their texts survive only in an undeciphered script", "They forbade writing anything down", "Their surviving scriptures contradict one another", "Their scriptures are lost, and all our information comes from hostile Buddhist and Jain sources"], "answerIndex": 3, "explanation": "No Ājīvika text survives. Buddhist and Jain sources agree that Gosāla was a rigid determinist, but scholars such as Dundas suspect distortion, since the Ājīvikas lived as ascetics; Bronkhorst suggests Gosāla held that asceticism could stop new karma though not destroy old karma.", "id": "q3"},
    {"type": "mcq", "prompt": "In the Cārvāka argument against inference, why can the universal connection (vyāpti) between smoke and fire not be known by another inference?", "options": ["Because inference is forbidden by the Vedas", "Because that inference would need its own universal connection, leading to an infinite regress", "Because fire can never be perceived directly", "Because testimony is always more reliable than inference"], "answerIndex": 1, "explanation": "Perception reaches only particular cases and cannot rule out hidden conditions, and proving the connection by a further inference would require another universal connection, and so on without end. Testimony faces the same problem, so, the argument concludes, perception alone is a source of knowledge.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Jain sevenfold predication (syādvāda) and explain how a Jain could answer the charge that it is either self-contradictory or self-defeating.", "rubric": "A strong answer lists the seven forms (a is F; is not F; is F and not F; is inexpressible; is F and inexpressible; is not F and inexpressible; is F, not F and inexpressible), each prefixed by syāt ('from a perspective'), and grounds them in many-sidedness: things persist as substance and change in their modes, as a pot exists as clay but not formerly as this shape. It answers Śaṅkara's contradiction charge by indexing each claim to a perspective. It states the self-defeat objection (if all is 'perhaps' true, so is anekāntavāda; Webb's 'untenable relativism') and gives replies: Gorisse's realist grounding of perspectives in the object's many aspects, and the point (made by Dundas and Long) that the 'perhaps' does not extend to the ethical vows.", "id": "q5"},
    {"type": "open", "prompt": "Did the Cārvākas really hold that perception is the only source of knowledge? Reconstruct their argument against inference, give one opponent's reply, and assess the revisionist reading.", "rubric": "A strong answer sets out the argument: inference needs a known universal connection (vyāpti); perception reaches only particulars and cannot exclude hidden conditions (upādhi); another inference would regress; testimony has the same problem; so only perception gives knowledge, and God, the surviving soul and karma are unknown. It gives at least one reply: the Nyāya pragmatic reply (Gaṅgeśa: the sceptic relies on generalisations when he speaks, and acts on them), the Buddhist and Nyāya fallibilist reply, or the positive accounts (Buddhist identity and causation, Jain tarka). It notes that the 'perception only' slogan comes from opponents such as Mādhava, and that Purandara's reported fragment and Bhattacharya suggest the Cārvākas accepted everyday inference grounded in perception and rejected only inference to the imperceptible, which blunts the pragmatic reply.", "id": "q6"}
  ]$dissenters_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/indian-dissenters', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
