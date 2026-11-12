-- Classical India: the Mauryas to the Guptas — canonical master article, co-written and human-reviewed.
-- history/classical-antiquity/classical-india-the-mauryas-to-the-guptas @ research/advanced/read.
-- Applied by the db-migrate workflow after seed.sql; idempotent upsert, so it
-- also restores the article after any database incident.
--
-- The Vedic age and varna, the second urbanisation, the Buddha and
-- Mahavira, the Mauryas and the Arthashastra, Ashoka and his edicts, the
-- Kushans, the Tamil south and trade with Rome, and the Gupta 'classical
-- age' and its critics.
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
    'history/classical-antiquity/classical-india-the-mauryas-to-the-guptas',
    'research',
    'advanced',
    'read',
    $india_master$> **Classical India**, roughly from 600 BCE to 550 CE, saw the rise of South Asia's first great empires, the Mauryas and the Guptas, and the formation of religious and intellectual traditions that spread across Asia: Buddhism, Jainism, and the classical forms of Hinduism, along with Sanskrit literature, mathematics that gave the world the decimal place-value system, and political thought as hard-headed as anything in Greece or China. This chapter covers the Vedic background, the second wave of cities along the Ganges, the Buddha and Mahavira, the Mauryan empire and Ashoka, the age of trade with Rome, and the Gupta "classical age", including the debate over whether that label holds.

## The Vedic Age and the Varna System

After the decline of the Indus cities, the next major body of evidence for South Asian history is textual. The **Vedas**, a vast collection of hymns, rituals, and philosophical texts in an early form of Sanskrit, were composed and transmitted orally for centuries before being written down. The oldest, the *Rigveda*, was probably composed between about 1500 and 1000 BCE, composed by Indo-Aryan-speaking pastoralists in the northwest of the subcontinent, whose arrival, as the Indus chapter described, genetic evidence now places mostly between about 2000 and 1500 BCE, after the decline of the Indus cities had begun. Over the following centuries, Vedic culture spread east into the Ganges plain.

Vedic society was organised around sacrifice performed by priests, and around a social ideal of four **varnas**: Brahmins (priests), Kshatriyas (warriors and rulers), Vaishyas (farmers, herders, and merchants), and Shudras (servants and labourers). A late hymn of the Rigveda, the *Purusha Sukta*, describes them as emerging from the body of a cosmic being, from its mouth, arms, thighs, and feet. The varna scheme was an ideal hierarchy, presented by Brahmin authors, rather than a description of how society actually worked. In practice, Indian society came to be organised into thousands of hereditary occupational and kinship groups called **jatis**, which historians often mean when they speak of "caste". The relationship between varna, jati, and the later practice of untouchability developed over many centuries and is debated.

The later Vedic texts called the **Upanishads**, composed roughly between 800 and 200 BCE, turned from ritual to philosophy. They explored the relationship between *atman*, the individual self, and *brahman*, the ultimate reality, and developed ideas that became central to Indian religions: **karma**, the moral law of cause and effect across lives; **samsara**, the cycle of rebirth; and **moksha**, liberation from that cycle.

## Cities, Renouncers, and New Religions

From around 600 BCE, cities and states grew rapidly in the Ganges plain, in what historians call the **second urbanisation** of South Asia, after the Indus. Texts list sixteen great states, the *Mahajanapadas*, some ruled by kings and some by councils of clans. Punch-marked silver coins circulated, trade expanded, and the kingdom of **Magadha**, in modern Bihar, gradually conquered its rivals.

The new urban world produced a wave of **renouncers**, men and some women who left household life to seek liberation through meditation, austerity, and teaching. Two of their movements became world religions.

**Mahavira**, regarded by Jains as the twenty-fourth and last of a line of great teachers, taught that liberation came through extreme asceticism and *ahimsa*, non-violence towards all living beings, including insects. Jainism remains a living religion in India, with a strong influence on its traditions of non-violence.

**Siddhartha Gautama**, the **Buddha**, "the awakened one", lived in the same region; the dates long used by historians are 563–483 BCE, but many scholars now place his death around 400 BCE. Born into a ruling family, he renounced his position, practised austerities, and then, according to tradition, achieved enlightenment through meditation. He taught the **Four Noble Truths**: that life involves suffering, that suffering arises from craving, that it can cease, and that the way to its cessation is the **Eightfold Path** of right understanding, intention, speech, action, livelihood, effort, mindfulness, and concentration. He rejected the authority of the Vedas and the Brahmin claim to ritual superiority, and founded a community of monks and nuns, the *sangha*. His teachings were transmitted orally and written down centuries later.

```checkpoint
q: What is the relationship between varna and jati?
a*: Varna was a four-part ideal hierarchy described in Brahmin texts, while jatis were the many hereditary occupational and kinship groups that actually organised society.
a: They are the same thing, two words for the four castes.
x: Varna refers to the four-part ideal; jati refers to the thousands of hereditary groups through which society was actually organised.
a: Jati was the ideal, and varna was the reality.
x: It is the other way round: varna is the textual ideal, jati the social reality.
a: Varna applied only to Buddhists and jati only to Hindus.
x: Both concepts relate to Brahmanical social ideas and Indian society generally, not to separate religions.
hint: One is a scheme of four; the other has thousands of groups.
why: Distinguishing the textual ideal from social practice is essential to understanding the history of caste.
---
q: What did the Buddha reject in the religious order of his time?
a: The idea of meditation.
x: Meditation was central to the Buddha's own path to enlightenment.
a: The practice of renunciation.
x: The Buddha himself was a renouncer and founded a community of monks and nuns.
a*: The authority of the Vedas and the Brahmins' claim to ritual superiority.
a: All ethical rules.
x: The Eightfold Path is an ethical and spiritual discipline.
hint: Who controlled Vedic sacrifice?
why: By rejecting Vedic authority and Brahmin privilege, the Buddha offered a path to liberation open to people regardless of birth.
```

## The Mauryan Empire

In 326 BCE Alexander's army reached the Punjab and turned back. A few years later, around 321 BCE, **Chandragupta Maurya** overthrew the ruling Nanda dynasty of Magadha and founded the **Mauryan empire**, the first state to rule most of the subcontinent. After a war with Alexander's successor Seleucus, he gained the territories of the northwest in exchange for 500 war elephants, around 303 BCE, as the chapter on the Hellenistic world described. According to Digambara Jain tradition, Chandragupta later renounced the throne and became a Jain monk, starving himself to death in the south.

Two sources shape the picture of Mauryan government. **Megasthenes**, the Seleucid ambassador to Chandragupta's court at **Pataliputra** (modern Patna), wrote an account, the *Indica*, which survives only in quotations by later Greek writers. He described a huge city surrounded by a wooden palisade and a society divided into seven groups. The **Arthashastra**, a Sanskrit treatise on statecraft traditionally attributed to Chandragupta's minister **Kautilya**, discusses taxation, administration, law, espionage, diplomacy, and war with ruthless realism, advising rulers to use spies, alliances, and deception. Its comparison with Machiavelli is common. Scholars now think the text, as it survives, was compiled over several centuries, largely after the Mauryas (roughly the second century BCE to the third century CE), so it cannot be read simply as a description of Mauryan government.

## Ashoka

Chandragupta's grandson **Ashoka** (reigned about 268–232 BCE) is one of the most remarkable rulers in world history, and almost everything known about him comes from his own words. Around 261 BCE he conquered **Kalinga**, on the east coast, in a brutal war. In one of his inscriptions, Rock Edict XIII, he records that 150,000 people were deported, 100,000 killed, and many times that number died, and declares his deep remorse. He turned to promoting what he called *dhamma* (Sanskrit *dharma*), a moral code of non-violence, compassion, tolerance, respect for elders and teachers, and generosity, and became a lay follower of Buddhism.

Ashoka had his edicts carved on rocks and polished stone pillars across his empire, in Prakrit languages, written mostly in the Brahmi script and in the northwest in Kharosthi, and near Kandahar in Afghanistan in Greek and Aramaic. They announce measures such as restrictions on the killing of animals, the planting of shade trees and digging of wells along roads, medical care for humans and animals, and the appointment of officials to promote dhamma. They urge respect for all religious sects, not only Buddhists, and urge people to restrain their speech, not praising their own sect or disparaging others without good reason. Ashoka also supported Buddhist missions; tradition credits his son Mahinda with bringing Buddhism to Sri Lanka.

Ashoka was forgotten in India for centuries. His inscriptions were deciphered only in 1837, by the British scholar James Prinsep, who worked out the Brahmi script, after which historians realised that the "Devanampiya Piyadasi" ("Beloved of the Gods, of gracious appearance") named in the inscriptions was Ashoka, known from Buddhist chronicles. When India became independent, it adopted the lion capital from his pillar at **Sarnath** as its national emblem and his wheel of dhamma for the centre of its flag.

How should Ashoka be read? Some historians see a sincere moral conversion. Others note that dhamma was also a useful ideology for unifying a huge, diverse empire, and that Ashoka did not give up his army or return Kalinga. Both can be true. His edicts remain the earliest substantial body of deciphered writing from South Asia and an extraordinary document of a ruler trying to govern by moral persuasion. The Mauryan empire declined after his death, and around 185 BCE the last Mauryan king was assassinated by his general, Pushyamitra Shunga.

{{image: Lion Capital of Ashoka | The Lion Capital from Ashoka's pillar at Sarnath, third century BCE, adopted as the national emblem of India.}}

```checkpoint
q: Why are Ashoka's edicts such an important source?
a: Because they were written by later Buddhist monks who knew him personally.
x: The edicts were issued by Ashoka himself, which makes them unusual and also means they reflect his own perspective.
a*: Because they are the ruler's own words, carved across his empire, and the earliest substantial body of deciphered writing from South Asia.
a: Because they record the history of the Indus civilization.
x: The edicts concern Ashoka's reign and ideals, more than a thousand years after the Indus cities.
a: Because they were written in Sanskrit, the only language of the empire.
x: The edicts were mostly in Prakrit languages, with Greek and Aramaic versions in the northwest.
hint: Who wrote them, and where were they placed?
why: The edicts give direct access to how Ashoka presented his rule, though, like all royal inscriptions, they must be read critically.
---
q: What is the best way to interpret Ashoka's policy of dhamma?
a: As a purely cynical deception with no moral content.
x: The edicts contain substantial moral content and practical welfare measures; a purely cynical reading ignores this.
a: As proof that Ashoka abolished his army.
x: Ashoka kept his army and did not return Kalinga, which complicates the picture of total pacifism.
a: As a Buddhist law that banned all other religions.
x: The edicts urge respect for all sects, not suppression of non-Buddhists.
a*: As both a sincere moral programme and a useful ideology for unifying a vast, diverse empire.
hint: Can a policy be sincere and politically useful at once?
why: Ashoka's dhamma combined genuine ethical commitments with practical aims of governing a diverse empire.
```

## Between Empires: Kushans, the South, and Rome

After the Mauryas, northern India was divided among many rulers, including Indo-Greek kings, Central Asian peoples such as the Shakas, and the **Kushans**, who built an empire stretching from Central Asia into the Ganges plain in the first to third centuries CE. Under the Kushan king **Kanishka**, around the second century CE, Buddhism flourished, and artists in **Gandhara** and **Mathura** made some of the first images of the Buddha in human form, Gandhara's showing Greek and Roman artistic influence. The Kushans sat at the junction of the Silk Roads, and Buddhism spread from their territories into Central Asia and China.

In the south, Tamil kingdoms, the Cheras, Cholas, and Pandyas, flourished, celebrated in **Sangam** poetry, the earliest literature in Tamil, composed roughly between the third century BCE and the third century CE, with poems about love and war. In the Deccan, the Satavahana dynasty ruled for several centuries.

South India was linked to the Roman world by sea. Using the **monsoon winds**, which blow from the southwest in summer and from the northeast in winter, merchant ships sailed between Egyptian ports on the Red Sea and the Malabar coast of India. Roman gold and silver coins have been found in large hoards in South India, and at **Arikamedu**, near Pondicherry, archaeologists found Roman pottery. A papyrus from the second century CE records a loan for a cargo shipped from the Indian port of Muziris, worth some seven to nine million sesterces. The Roman writer Pliny the Elder complained that India absorbed at least 50 million sesterces a year in exchange for luxuries such as pepper, pearls, and fine textiles. The Indian Ocean trade is the subject of later chapters.

## The Guptas: A Classical Age?

The **Gupta** dynasty, founded by Chandragupta I around 320 CE, unified much of northern India in the fourth and fifth centuries. **Samudragupta** recorded his conquests in a long inscription on an older Ashokan pillar at Allahabad; **Chandragupta II** (reigned about 375–415) extended the empire to the west. The Chinese Buddhist pilgrim **Faxian**, whose journey to India and back, to collect Buddhist texts, lasted from 399 to 412, described a prosperous, peaceful country with few harsh punishments.

The Gupta period produced remarkable achievements:

- **Literature.** The poet and dramatist **Kalidasa** wrote the play *Shakuntala* and the poem *Meghaduta* ("The Cloud Messenger"), regarded as masterpieces of classical Sanskrit. The great epics, the *Mahabharata* (including the *Bhagavad Gita*) and the *Ramayana*, reached something close to their final forms in these centuries, as did the *Puranas*, collections of myths and religious teaching.
- **Mathematics and astronomy.** **Aryabhata**, in his *Aryabhatiya* (499 CE), proposed that the Earth rotates on its axis and gave a value of pi of 3.1416. Indian mathematicians, building on a **decimal place-value system** that had emerged by about the fourth century, used a symbol for **zero** as a number. The earliest undisputed dated inscriptions using zero come from later centuries, and the mathematician Brahmagupta set out rules for calculating with zero in 628. This system, transmitted through the Islamic world, became the numerals used worldwide today.
- **Learning and art.** The great Buddhist monastic university at **Nalanda**, in Bihar, was founded in the fifth century and later attracted students from across Asia. The most famous cave paintings at **Ajanta**, created mostly in the late fifth century under the Vakataka dynasty (earlier ones date from the last centuries BCE), are among the finest surviving ancient paintings anywhere. Early stone Hindu temples appeared, such as the Dashavatara temple at Deogarh, around 500 CE.

Nineteenth- and twentieth-century historians, many of them Indian nationalists seeking a glorious past to set against colonial claims of Indian backwardness, called the Gupta period India's **"golden age"** or "classical age". Later historians, such as Romila Thapar and D. N. Jha, criticised the label. They noted that the period also saw the hardening of caste hierarchies and the subordination of women in texts such as the law code of **Manu** (the *Manusmriti*, compiled between about the second century BCE and the third century CE), growing references to untouchable groups, and the granting of land and villages to Brahmins, which some historians interpret as the beginning of a kind of feudalism. A "golden age" for Sanskrit poets and Brahmin landholders was not necessarily one for everyone.

The Gupta empire weakened in the late fifth and sixth centuries under pressure from Central Asian invaders known in India as the **Hunas** (Kidarites and Alchon Huns), whose relationship to the Huns who attacked Rome is disputed, and from regional rulers. By around 550 it had fragmented. The story of medieval India continues in the chapter on the Delhi Sultanate.

```checkpoint
q: What was the significance of the Indian decimal place-value system with zero?
a: It was used only for religious calculations and never spread.
x: The system spread through the Islamic world and became the basis of the numerals used worldwide.
a: It replaced the Roman numerals used in India.
x: The system developed from earlier Indian (Brahmi) numerals, not from Roman numerals.
a*: It allowed any number to be written with ten digits, with zero as a number, and, transmitted through the Islamic world, it became the numerals used worldwide.
a: It was invented by Aryabhata alone in a single year.
x: The system developed over centuries; Brahmagupta later set out rules for zero in 628.
hint: Think about where "Arabic numerals" came from.
why: Place value with zero made arithmetic far easier and is one of the most important intellectual contributions of classical India.
---
q: Why do historians such as Romila Thapar criticise calling the Gupta period a "golden age"?
a*: Because the period also saw caste hierarchies harden, women subordinated in law texts, and land granted to Brahmins, so it was golden mainly for elites.
a: Because nothing of cultural value was produced in the period.
x: The critics accept the period's cultural achievements; they question whether the label fits everyone's experience.
a: Because the Gupta empire never existed.
x: The Gupta empire is well attested in inscriptions, coins, and texts.
a: Because the label was invented by the Gupta kings themselves.
x: The label was mainly applied by modern historians, many of them nationalists.
hint: Golden for whom?
why: The critique asks whose experience a historical label describes, and reveals how nationalist politics shaped interpretations of the past.
```

## Further exploration

- **Romila Thapar, *Early India: From the Origins to AD 1300* (2002).** The standard history of early India by its leading historian.
- **Upinder Singh, *A History of Ancient and Early Medieval India: From the Stone Age to the 12th Century* (2008).** A comprehensive textbook with extensive use of sources.
- **Charles Allen, *Ashoka: The Search for India's Lost Emperor* (2012).** How Ashoka was rediscovered.
- **Patrick Olivelle (trans.), *King, Governance, and Law in Ancient India: Kautilya's Arthashastra* (2013).** A modern translation of the Arthashastra.
- **Walpola Rahula, *What the Buddha Taught* (1959).** A classic introduction to the Buddha's teaching.$india_master$,
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
  select $india_quiz$[
    {"type": "mcq", "prompt": "What are the Upanishads best known for?", "options": ["Laws of the Mauryan empire", "Records of trade with Rome", "Ashoka's edicts", "Philosophical teachings on atman, brahman, karma, samsara, and moksha"], "answerIndex": 3, "explanation": "The later Vedic Upanishads turned from ritual to philosophy, developing ideas central to later Indian religions.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Ashoka record in Rock Edict XIII?", "options": ["The deaths and deportations of the Kalinga war and his remorse", "His conversion to Jainism", "The founding of Nalanda", "A treaty with Seleucus"], "answerIndex": 0, "explanation": "Ashoka recorded 150,000 deported and 100,000 killed in Kalinga, and his turn to promoting dhamma.", "id": "q2"},
    {"type": "mcq", "prompt": "Who deciphered the Brahmi script, allowing Ashoka's edicts to be read?", "options": ["Jean-François Champollion", "Michael Ventris", "James Prinsep", "Yuri Knorozov"], "answerIndex": 2, "explanation": "Prinsep's decipherment in 1837 led to the rediscovery of Ashoka, who had been largely forgotten in India.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Aryabhata propose in 499 CE?", "options": ["That the Earth is flat", "That the Earth rotates on its axis, with a value of pi of 3.1416", "That zero should be abolished", "That the sun goes around the Earth every day"], "answerIndex": 1, "explanation": "Aryabhata's Aryabhatiya is a landmark of Indian mathematics and astronomy.", "id": "q4"},
    {"type": "open", "prompt": "Compare the Buddha's teaching with the Vedic religious order of his time. Why did renunciation movements arise in the sixth and fifth centuries BCE?", "rubric": "A strong answer explains the Vedic order (sacrifice, Brahmin priests, varna ideal, the Upanishads' ideas of karma, samsara, and moksha), the Buddha's Four Noble Truths and Eightfold Path, his rejection of Vedic authority and Brahmin privilege, and the sangha, with Mahavira and Jain ahimsa as a parallel. It links the rise of renouncers to the second urbanisation of the Ganges plain: new cities, states, coinage, and trade.", "id": "q5"},
    {"type": "open", "prompt": "Evaluate the description of the Gupta period as India's 'golden age'.", "rubric": "A strong answer sets out the period's achievements (Kalidasa, the epics and Puranas, Aryabhata, the decimal place-value system with zero, Nalanda, Ajanta, early temples, Faxian's account) and the critique (Thapar, Jha): hardening caste, women's subordination in Manu, untouchability, land grants to Brahmins and possible feudalisation. It explains the nationalist origins of the label and reaches a judgement about whose golden age it was.", "id": "q6"}
  ]$india_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'history/classical-antiquity/classical-india-the-mauryas-to-the-guptas', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
