-- Late Antiquity and the Medieval World (c. 200 – 1450) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval',
    'research',
    'advanced',
    'read',
    $medievaloverview_master$> **A thousand years in which philosophy worked inside religious civilisations.** From Plotinus to the Paris arts masters, Śaṅkara's heirs and the Korean Neo-Confucians, the thinkers of this section argued within traditions that had sacred or canonical texts. This overview follows their books between languages; compares how the traditions handled reason and scripture, the eternity of the world, the self, universals and causation; asks how much of the picture of "Dark Ages" survives the chapters' evidence; and ends with a guide to the twelve chapters.

## Labels the Participants Did Not Use

Much of this section's vocabulary is later than its subjects. "Neoplatonist" was invented by European scholars in the early nineteenth century; Plotinus and his successors called themselves simply "Platonists". The scheme of "six orthodox schools" of Hindu philosophy was created, according to Andrew Nicholson, between the twelfth and sixteenth centuries by Vedāntins. "Neo-Confucianism" is a modern Western-language label; its first circle called their movement *daoxue*, "Learning of the Way". Even "medieval" fits awkwardly: the Stanford Encyclopedia's entry on Augustine stresses that he lived in late antiquity rather than a "medieval" world.

What the traditions shared was a setting. Nearly every thinker here worked with scripture or a canon, and philosophy often took the form of commentary. Vedānta, in Sangeetha Menon's words, is "a label for any hermeneutics that attempts to provide a consistent interpretation of the philosophy of the Upaniṣads". Latin masters lectured on Peter Lombard's *Sentences*, and Zhu Xi's reading of the classics was the basis of China's civil service examinations from 1313 until 1905. Commentary did not mean timidity. Śaṅkara, says Neil Dalal, "accepts nonduality based on the Upaniṣad's authority alone", yet "was an original philosopher who constructed novel arguments to make sense of the Upaniṣads".

## Books on the Move

Few of the section's great arguments were read in the language in which they were first made.

**Greek into Syriac, Arabic, Hebrew and Latin.** Many Greek texts went first into Syriac and then into Arabic, in a movement centred on Baghdad from the mid-eighth to the late tenth century, involving Muslim, Christian, Sabian and Jewish scholars; al-Fārābī's teacher Abū Bishr Mattā knew no Greek and worked from Syriac. Translation could change what a text was: in al-Kindī's circle parts of Plotinus' *Enneads* became the *Theology of Aristotle*, "an interpretation or reworking of Plotinus, and not just a translation"; an Arabic Proclus lay behind the *Book of Causes*, which passed in the West as Aristotle's until Aquinas recognised its source. In Toledo in the later twelfth century Gerard of Cremona and Dominicus Gundissalinus, the latter working with the Jewish scholar Avendauth, put al-Kindī, al-Fārābī, al-Ghazālī and Avicenna into Latin. Averroes' commentaries reached the Latin universities only around 1230, while James of Venice and later William of Moerbeke translated Aristotle straight from Greek: the thirteenth century's Aristotle came by several roads.

Some works survive only at the far end of a chain. Ibn Gabirol's Arabic *Fountain of Life* survives in Latin, and its author passed as "Avicebron", a Muslim or a Christian, until Salomon Munk identified him in 1846. Averroes' commentary on Plato's *Republic* survives only in Hebrew. Maimonides' *Guide of the Perplexed*, written in Judaeo-Arabic (Arabic in Hebrew letters), was translated into Hebrew twice and into Latin; Aquinas, who knew no Greek, was later translated into Greek and Hebrew.

**Sanskrit into Chinese and Tibetan.** The firm evidence for dating the earliest Mahāyāna scriptures is a Chinese translation by Lokakṣema around 179 CE. The first documented translator in China, An Shigao, was a Parthian; Kumārajīva, from Kucha in Central Asia, led a team in Chang'an from around 401 that prized meaning over literal rendering; Xuanzang returned from India in 645 with 657 texts. Transmission was selective: China never translated Dharmakīrti, while Tibet took Indian Madhyamaka from Śāntarakṣita, Kamalaśīla and Atiśa. And al-Bīrūnī put Patañjali's *Yoga-sūtra* into Arabic.

The section's motto could be al-Kindī's defence of learning from foreigners:

```quote
"We must not be ashamed to admire the truth or to acquire it, from wherever it comes."
al-Kindī · On First Philosophy (trans. Peter Adamson) · ninth century CE
```

## Reason and Revelation

Every tradition had to say what argument could do beside a sacred text, and the answers form a spectrum rather than two camps. Tertullian's "What indeed has Athens to do with Jerusalem?" is often read as a rejection of reason, but its target is speculation set against scripture. For Augustine, faith comes first in time and understanding is higher in value. Aquinas divided truths about God into "preambles of the faith", such as that God exists, which reason can reach, and "articles of faith", such as the Trinity, known only by revelation.

In Islam the famous quarrel was among people who all valued reason. Al-Fārābī held that religion teaches through symbols what philosophy proves by demonstration. Al-Ghazālī, a defender of logic, gave theology a rule almost all later Muslim theologians accepted: where a demonstration contradicts the literal sense of revelation, read the text allegorically; otherwise not. Averroes accepted the rule and disagreed only about what had been demonstrated; his *Decisive Treatise* argued that the Law makes philosophy recommended or even obligatory, since "truth does not oppose truth". Maimonides was as bold: had science demonstrated that the world is eternal, scripture would have to be reinterpreted. Judah Halevi went the other way, turning the sceptic's tools on the philosophers and resting faith on the event at Sinai. The Latin charge that "Averroists" held a "double truth" was, scholars now agree, a caricature.

India posed the question differently. For Mīmāṃsā the Veda has no author, so no human ignorance or lie can undermine it; almost all Naiyāyikas held that it was composed by a speaker, for Udayana God. Madhva argued that scripture reaches us only through perception and inference, so it cannot teach non-difference without contradicting the experience through which we receive it. The Buddhist epistemologists did not accept scripture as a means of knowledge at all.

## Eternity, Creation and What Reason Can Prove

The clearest case of one question crossing traditions is whether the world had a beginning. Aristotle, the Stoics and the orthodox Neoplatonists held that it had always existed; scripture spoke of creation. Set side by side:

1. **Al-Kindī and Saadia (ninth and tenth centuries).** Following John Philoponus: there can be no actual infinite, and an endless past would be an infinity already traversed; so the world began. For Saadia this was the foundation: "there is no means of proving the existence of a Creator other than that of creation."
2. **Avicenna (d. 1037).** The world is eternal and yet created: God brings it into existence continuously, and it comes "after" non-being in order of essence, not of time. His proof of a Necessary Existent works even if the world has always existed.
3. **Al-Ghazālī (c. 1095).** An eternal will can choose a moment, and an infinite past is impossible. Teaching publicly that the world has no beginning in time is one of three theses he judged unbelief.
4. **Averroes (1180 or 1181).** Aristotle had demonstrated the world's eternity, so by al-Ghazālī's own rule it should be accepted.
5. **Maimonides (1190).** Neither creation nor eternity can be demonstrated; one can only tip the scales. The heavens' order looks chosen, and a God without free will could issue no commandments, so he prefers creation.
6. **Aquinas (thirteenth century).** No demonstration is possible either way; the beginning is known by faith. He even preferred to prove God's existence "on the supposition that the world is eternal", as the harder case.
7. **Conclusion.** The question changed shape: by Maimonides and Aquinas it turned less on which answer is true than on what reason can demonstrate, and the leading proofs of God no longer depended on a beginning.

**The objection** is that steps 5 and 6 are an evasion that lets faith win by default. **The reply** is that both verdicts rest on argument. Maimonides showed where Aristotle's case fails (changing one's will is not the same as willing a change), and none of Aquinas's Five Ways assumes a beginning. Nor was the verdict final: Gersonides held that creation can be demonstrated, as a free agent's shaping of eternal formless matter.

The same pressure bore on God's knowledge. For Boethius, God's eternity lets him see our future acts as we see present ones. Avicenna held that an unchanging God knows particulars "in a universal way", through their causes; al-Ghazālī condemned this as unbelief. Maimonides held that God's knowledge has "nothing in common" with ours; Gersonides, refusing that move, accepted a limit: God does not know which of two open outcomes a free choice will take.

```checkpoint
q: How could Avicenna hold that the world is both eternal and created?
a*: God brings it into existence continuously, and it comes "after" non-being in order of essence, not of time.
a: He thought the world began at a first moment, as Saadia did.
x: Saadia argued for a beginning in time; Avicenna held the world eternal.
a: He accepted al-Kindī's argument that an actual infinite is impossible.
x: That argument concludes that the world had a beginning, which Avicenna denied.
a: He held that creation can be known only by revelation.
x: His account is philosophical; it is Aquinas who says the beginning is known by faith.
hint: Ask what "after" means if it is not a matter of time.
why: For Avicenna creation is dependence, not a first moment: the world exists through God at every instant, so it can be eternal and created, and his proof of God works even for an eternal world.
---
q: Which verdict on the eternity of the world did Maimonides and Aquinas share?
a: Aristotle had demonstrated that the world is eternal.
x: That was Averroes' position, against al-Ghazālī.
a: Creation can be demonstrated, from eternal formless matter.
x: That was Gersonides, departing from Maimonides.
a*: Neither creation nor eternity can be demonstrated.
a: Teaching the world's eternity publicly is unbelief.
x: That was al-Ghazālī's ruling in the Incoherence.
hint: Think of "tipping the scales".
why: Maimonides held that one can only tip the scales towards creation; Aquinas concluded that no demonstration is possible either way and that the beginning is known by faith.
```

## The Self and the Knower

In India the debate over the self ran between Brahmanical and Buddhist schools. Nyāya argued from memory: recognising "this is that Devadatta I saw yesterday" needs one subject present both times. Buddhists replied that memory needs only causal continuity, Vasubandhu's "seeds" in the mental stream. Śaṅkara argued that consciousness persists through waking, dreaming and deep sleep and is the witness for which body, mind and even the thought "I" are objects; so the self is pure consciousness, identical with brahman. Nyāya replied that in dreamless sleep consciousness is absent, Rāmānuja that what persists is a knowing "I" that recalls "I slept well". Śaṅkara's principle that a cognition cannot illuminate itself, any more than a knife can cut itself, is the one Mark Siderits uses to reconstruct the Buddha's argument against a self: the same tool turned to the opposite conclusion.

In the Mediterranean world Augustine answered the sceptics with "if I am mistaken, I exist", and Avicenna's "flying man", floating with no sensation of any body, would still affirm that he exists. Both are often set beside Descartes, but the chapters advise caution: Descartes called his use and Augustine's "two very different things", and how deep Avicenna's resemblance to the cogito goes is disputed. Averroes held that the receptive intellect is one for all humans; Aquinas replied that then, "if I think about stone and you do likewise", we would share one intellectual act. In China the question was what in the self is good: for Zhu Xi human nature is pattern (*li*), obscured by turbid vital stuff (*qi*); for Lu Xiangshan "the ten thousand things are already complete in us".

## Universals and Causes

Porphyry's questions about genera and species reached the Latin Middle Ages through Boethius. Abelard argued that if one real "animal" were wholly present in Socrates and in Brunellus the donkey, one thing would be both rational and irrational; Scotus gave common natures a real but "less than numerical" unity, drawing on Avicenna's "horseness is just horseness"; Ockham held real universals incoherent. Vaiśeṣika counted the universal ("cowness") among the categories of what exists; Dharmakīrti held that only causally effective particulars are real, and since *jāti* means both "universal" and "caste", his attack also undercut the metaphysics of caste. Zhu Xi's pattern has been compared to Plato's Forms by Feng Youlan and read by others as immanent in *qi*.

On causation, al-Ghazālī argued that we see the cotton burn when it touches fire, not the fire burning it, and can conceive the one without the other; Averroes answered that fire, unimpeded, really burns. Whether al-Ghazālī was an occasionalist is debated, and his likeness to Hume holds on one point but not in motive. Nāgārjuna argued that nothing arises from itself, from another, from both or from neither, to show not that causation is impossible but that cause and effect lack intrinsic nature; Sāṃkhya held that effects pre-exist in their causes, Nyāya-Vaiśeṣika that every effect is new; Fazang argued that a rafter "is" the building. *Causation* and *What Exists? Ontology and Universals* go further.

## Decline, or Transformation?

Petrarch is credited with creating the idea of the "Dark Ages", which most modern scholars find misleading. The chapters correct it case by case. Philosophy did not end with Justinian's edict of 529: Edward Watts finds the evidence thin, and Greek philosophy was taught in Alexandria and Constantinople to the end of the sixth century. Few specialists accept Steven Weinberg's claim that after al-Ghazālī "there was no more science worth mentioning in Islamic countries"; Dimitri Gutas places the golden age of Arabic philosophy up to about 1350. John Marenbon holds that Latin university philosophy "continued vigorously for at least three centuries", though Gyula Klima sees its two rival "ways" ending in the demise of both.

Correcting the story does not mean denying loss. The Huichang persecution of 845 returned more than a quarter of a million monks and nuns to lay life, and many text-based Buddhist schools never fully revived. Hypatia was murdered in 415; Averroes' books were ordered burned in 1195; Suhrawardī was executed; Marguerite Porete was burned in 1310. Nor should the myth be replaced by its mirror: Pierre Duhem's thesis that the condemnation of 1277 gave birth to modern science is now rejected.

## Legends, Rivals and Translators

Here the texts usually survive, but the lives and dates around them often do not. **Hagiography** supplies most biographies: at least fourteen, often contradictory, "Conquests of Śaṅkara", written centuries after him; Nāgārjuna's visit to the serpent-beings under the ocean; a life of Huineng most scholars think "little more than pious fiction". **Hostile witnesses** remain: Porphyry's *Against the Christians* is known only from its refuters, William of Champeaux almost only from Abelard. **Dates** can move by centuries, as Śaṅkara's do; of the *Nyāya-sūtra* Karl Potter wrote, "we have not the vaguest idea who wrote the Nyayasutras or when he lived." **Attribution** fails: the most famous line of Huineng's verse is absent from the earliest *Platform Sutra*, and "Entities must not be multiplied beyond necessity" is nowhere in Ockham. Each **translation chain** adds links where meaning can shift.

Women appear unevenly, often through these filters. Hypatia and Sosipatra worked in the Platonist circles; Baochang's *Lives of the Nuns* records sixty-five Chinese nuns; Heloise, in Marenbon's judgement, "was a philosopher"; Porete and Christine de Pizan wrote outside the universities that excluded women. Ubhaya Bhāratī, who judges Śaṅkara's debate, may never have existed, and Averroes argued that women share men's nature and could be rulers.

```checkpoint
q: Which of these works survives only in a translation, not in its original language?
a: Maimonides' Guide of the Perplexed.
x: The Judaeo-Arabic original survives; a draft page in his own hand was preserved in the Cairo Geniza.
a*: Averroes' commentary on Plato's Republic.
a: Avicenna's The Cure.
x: The Arabic Cure became the basis of the madrasa philosophy curriculum.
a: Augustine's Confessions.
x: Augustine wrote in Latin, and the Latin survives.
hint: Look for a work whose original language is lost.
why: Averroes' commentary on the Republic survives only in Hebrew, so his argument that women can be guardians and rulers reached later readers through a translation.
---
q: How do the chapters compare al-Ghazālī's argument about fire and cotton with Hume's analysis of causation?
a: Hume read al-Ghazālī and borrowed the argument.
x: There is no documented evidence that Hume knew al-Ghazālī's work.
a: Both used the argument to cast doubt on reports of miracles.
x: Hume did; al-Ghazālī's aim was to show that the miracles in the Qurʾān are possible.
a: Al-Ghazālī held that nature has no regularity at all.
x: He held that God has created a regular order and follows it as a custom.
a*: Both say observation shows only that events go together, but al-Ghazālī grounds regularity in God's custom and argues to defend miracles.
hint: Ask what each was trying to defend or attack.
why: The likeness is real on one point, that we never observe a necessary connection; but al-Ghazālī's argument is modal and theological, while Hume had no further ground for regularity and used his analysis against miracles.
```

## What Is Local

Some concerns belong mainly to one tradition. Indian philosophy built its debates on a theory of the sources of knowledge (*pramāṇa*) and tested metaphysics on small cases, such as a shell mistaken for silver. Chinese thinkers asked how one becomes a sage, by investigating things or by insight into one's own heart-mind. Islamic philosophy lived beside law: Averroes was a judge, and his *Decisive Treatise* is a legal opinion. The Latin West turned disputation into an institution, the university *quaestio*.

## The Chapters

- *Plotinus and Neoplatonism*: the One, procession and return, evil as privation, Hypatia, Proclus, 529 and the Arabic Plotinus.
- *Augustine and Early Christian Philosophy*: Tertullian, the *Confessions*, "if I am mistaken, I exist", time, grace, the *City of God* and Boethius.
- *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*: sources of knowledge, atoms, the argument for God, spirit and matter, the authorless Veda.
- *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*: emptiness, the two truths, the dream argument, Dignāga and Dharmakīrti, Tibet.
- *Vedānta: Śaṅkara, Rāmānuja and Madhva*: the witness self, theories of error, qualified non-dualism and Madhva's dualism.
- *Chinese Buddhism and the Rise of Neo-Confucianism*: Tiantai, Huayan, Chan's founding stories, Zhu Xi and Lu Xiangshan, Korea and Japan.
- *Falsafa: al-Kindī, al-Fārābī and Avicenna*: the translation movement, logic and the virtuous city, essence and existence, the flying man.
- *Al-Ghazālī, Averroes and the Quarrel over Reason*: *kalām*, fire and cotton, the *Decisive Treatise*, the single intellect, the decline story.
- *Jewish Philosophy: from Saadia to Maimonides*: Saadia, Ibn Gabirol, Halevi, Maimonides on God and creation, Gersonides and Crescas.
- *Early Scholasticism: Anselm, Abelard and the Universities*: the *Proslogion*, universals, Heloise, the universities, Aristotle in Latin.
- *Thomas Aquinas*: faith and reason, the Five Ways, essence and existence, the soul, natural law, 1277.
- *Scotus, Ockham and the Late Medieval Debates*: univocity, thisness, nominalism, the razor, Buridan and Autrecourt.

The story continues in *Renaissance and Early Modern Philosophy (c. 1450 – 1800)*.

## Further exploration

- **Dimitri Gutas, *Greek Thought, Arabic Culture* (1998).** The standard account of the Greek-to-Arabic translation movement.
- **Peter Adamson, *Philosophy in the Islamic World* (2016).** A readable full history from al-Kindī to the modern period.
- **Frank Griffel, *The Formation of Post-Classical Philosophy in Islam* (2021).** The rise of the *ḥikma* genre and the case against the decline story.
- **David B. Burrell, *Knowing the Unknowable God: Ibn-Sina, Maimonides, Aquinas* (1986).** Aquinas in conversation with Muslim and Jewish thought.
- **Jan Westerhoff, *The Golden Age of Indian Buddhist Philosophy* (2018).** Indian Buddhist philosophy from the Abhidharma to Dharmakīrti.
- **Stephen C. Angle and Justin Tiwald, *Neo-Confucianism: A Philosophical Introduction* (2017).** A thematic, argument-centred introduction to the whole movement.
- **Paul Vincent Spade (ed. and trans.), *Five Texts on the Mediaeval Problem of Universals* (1994).** Porphyry, Boethius, Abelard, Scotus and Ockham on universals in translation.$medievaloverview_master$,
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
  select $medievaloverview_quiz$[
    {"type": "mcq", "prompt": "Why did the Latin West's thirteenth-century Aristotle not come from Averroes alone?", "options": ["Averroes' commentaries were never translated into Latin", "Averroes' Latin commentaries arrived only around 1230, and Aristotle was also translated directly from Greek and read with Avicenna", "Aquinas read Aristotle in the original Greek", "The Paris bans of 1210 and 1215 stopped all study of Aristotle until 1500"], "answerIndex": 1, "explanation": "Michael Scot and William of Luna's Latin Averroes reached the universities around 1230, while James of Venice and William of Moerbeke translated Aristotle from Greek and Avicenna came through Toledo. Aquinas knew no Greek, and the bans leaked; the 1255 Paris statutes made all known works of Aristotle compulsory.", "id": "q1"},
    {"type": "mcq", "prompt": "Which thinker held that neither the creation nor the eternity of the world can be demonstrated, but preferred creation because a God without free will could issue no commandments?", "options": ["Al-Kindī", "Averroes", "Gersonides", "Maimonides"], "answerIndex": 3, "explanation": "Maimonides judged that one can only tip the scales, and preferred 'the view of Moses'. Al-Kindī argued that the world must have a beginning, Averroes that Aristotle had demonstrated its eternity, and Gersonides that creation from eternal formless matter can be demonstrated.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Nāgārjuna's fourfold argument about causation aim to show, on Westerhoff's reading?", "options": ["That cause and effect lack intrinsic nature, not that causation is impossible", "That the world was created by God", "That effects already exist in their causes", "That only momentary particulars with causal power are real"], "answerIndex": 0, "explanation": "Westerhoff stresses that Nāgārjuna 'does not conclude that causation is impossible': what fails is the premise that cause and effect have svabhāva. Pre-existent effects are the Sāṃkhya view, and causally effective particulars are Dharmakīrti's criterion of the real.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the 'Dark Ages' picture fits the chapters' evidence?", "options": ["Philosophy ceased everywhere when Justinian's edict reached Athens in 529", "After al-Ghazālī there was no more philosophy worth mentioning in the Islamic world", "Specialists now reject the decline story case by case, while the chapters still record real losses such as the Huichang persecution of 845", "The condemnation of 1277 is now agreed to have given birth to modern science"], "answerIndex": 2, "explanation": "Greek philosophy was taught in Alexandria and Constantinople to the end of the sixth century; few specialists accept Weinberg's claim, and Gutas places the golden age of Arabic philosophy up to about 1350; Duhem's thesis about 1277 is now rejected. Yet persecutions, burnings and executions did happen.", "id": "q4"},
    {"type": "open", "prompt": "Compare how at least three thinkers from different traditions in this section handled the question of whether the world had a beginning. What did the dispute come to be about?", "rubric": "A strong answer sets out at least three positions accurately: al-Kindī and Saadia, after Philoponus, arguing that an actual infinite and an infinite past are impossible; Avicenna's world both eternal and created, dependent on God at every moment; al-Ghazālī's ruling that teaching the world's eternity publicly is unbelief; Averroes' claim that Aristotle demonstrated it; Maimonides' and Aquinas's verdict that neither side can be demonstrated; Gersonides' demonstration of creation from eternal formless matter. It sees that the dispute shifted from which answer is true to what reason can demonstrate, notes that Avicenna's proof and Aquinas's Five Ways do not depend on a beginning, and weighs the objection that the 'undecidable' verdict is an evasion against the reply that it rests on specific arguments.", "id": "q5"},
    {"type": "open", "prompt": "Śaṅkara, Nyāya, the Buddhists and Avicenna all argued about the self. Set out two of their arguments and explain where they disagree, using the chapters' objections.", "rubric": "A strong answer reconstructs at least two arguments: Nyāya's argument from memory and recognition (one subject must be present on both occasions) and the Buddhist reply that causal continuity, Vasubandhu's 'seeds', suffices; Śaṅkara's argument that consciousness persists through waking, dreaming and deep sleep and is the witness of all objects, with the Nyāya objection that consciousness is absent in dreamless sleep and Rāmānuja's 'I slept well'; Avicenna's flying man, with Marmura's objection that it moves from what we can imagine to what is so. Credit noting that Śaṅkara's irreflexivity principle is the tool Siderits uses for the Buddha's opposite conclusion, and caution about likening Augustine or Avicenna to Descartes.", "id": "q6"}
  ]$medievaloverview_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
