-- The Buddha and Early Buddhist Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/ancient-beginnings/early-buddhism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/ancient-beginnings/early-buddhism',
    'research',
    'advanced',
    'read',
    $buddhism_master$> **A teacher who denied the self, and the arguments that followed.** The Buddha wrote nothing, and his dates can only be given as ranges, yet the discourses preserved in his name contain some of the most carefully argued philosophy of the ancient world. This chapter explains what we can know about him and his texts, then works through the core teachings: the four noble truths, dependent origination, impermanence and the denial of an enduring self (*anātman*). It sets out the arguments for non-self step by step, including the chariot argument first voiced in the canon by the nun Vajirā, and then the hardest objection: how can there be rebirth and moral responsibility with no self to be reborn? It closes with early Buddhist ethics, the first nuns, and the Abhidharma, the later scholastic project that analysed experience into momentary events.

## A Teacher Who Wrote Nothing

"Buddha" is a title meaning "awakened"; Gotama (Sanskrit Gautama) was the family name of the man also called Śākyamuni, "Sage of the Śākyas". Tradition says he was born at Lumbinī, now in Nepal, and died at Kuśinagara. Later biographies made his father a king and the Buddha a prince, but many scholars think the Śākya polity was not a hereditary monarchy; Maurice Walshe called the father "an elected chief of the clan rather than the king he was later made out to be".

His dates are uncertain. Theravāda tradition gives c. 624/623–544/543 BCE (a life of 80 years); a "short chronology" from Indian sources gives 448–368 BCE. Western scholars long used about 563/560–483/480 BCE, but after a 1988 symposium at Göttingen most moved his life about a century later. Many now place his death between about 410 and 370 BCE, Richard Gombrich at c. 405 BCE, though not all historians accept the redating.

No written record survives from his lifetime or the century or two after, and some familiar episodes are missing from the early discourses: later tradition says he abandoned his wife Yaśodharā straight after the birth of their son Rāhula, but the Pāli discourses do not tell this story and mention Rāhula only as a young monk.

{{image: Lumbini pillar inscription | Excavation of Aśoka's pillar at Lumbinī and the discovery of its inscription, the oldest written reference to the Buddha's birthplace. Carved around 250 BCE, it marks the spot where "the Buddha, sage of the Śākyas", was born.}}

The teachings were passed on orally "for at least three centuries" (Abraham Vélez de Cea). They survive in the Pāli *Nikāyas* (collections) of the Theravāda, the only complete canon of early Indian Buddhism, and in the *Āgamas* of other early schools, preserved mostly in Chinese. The two are "strikingly similar", which suggests a shared core older than the schools. By Sri Lankan tradition the Pāli canon was first written down in the first century BCE. The texts were written down centuries late, in languages the Buddha probably did not speak, and they disagree with one another. Gombrich has "the greatest difficulty in accepting that the main edifice is not the work of a single genius"; others, such as Ronald Davidson, doubt that much goes back to the Buddha at all.

Even calling him a philosopher is controversial: some think he pointed beyond reason, others that he gave practical advice, not metaphysics. Mark Siderits replies that both views assume we can reach the Buddha's own thought without the later tradition, which the sources make doubtful, so he reads the Buddha as that tradition understood him.

## The Setting: Renouncers and Their Rivals

The Buddha was a *śramaṇa*, a wandering ascetic (the word probably means "one who makes an effort"); many śramaṇas, the Buddha included, rejected the authority of the Vedas. As The Upanishads and the Beginnings of Indian Philosophy describes, much was shared ground: rebirth governed by karma, the judgement that endless rebirth is unsatisfactory, an ideal of liberation, and the view that reaching it requires overcoming ignorance about who one really is. The Buddha's distinctive claim, in Siderits's phrase, concerned what that ignorance is: "the conceit that there is an 'I' and a 'mine'". His rivals, among them Mahāvīra the Jain, the Ājīvika Makkhali Gosāla and the materialist Ajita Kesakambalī, are the subject of Jains, Ājīvikas and Materialists: India's Other Dissenters.

## The Four Noble Truths

By tradition the Buddha's first discourse, near Sarnath, set out a "middle way" between sensual indulgence and self-mortification, and four truths: (1) there is suffering; (2) there is an origination of suffering; (3) there is a cessation of suffering; (4) there is a path to that cessation. The logic is simple. If suffering has causes (truth 2), removing them prevents it (truth 3), and the path (truth 4) is the set of techniques that removes them. "Much then hangs," Siderits writes, "on the correct identification of the causes of suffering."

```quote
Now this, bhikkhus, is the noble truth of suffering: birth is suffering, aging is suffering, illness is suffering, death is suffering; union with what is displeasing is suffering; separation from what is pleasing is suffering; not to get what one wants is suffering; in brief, the five aggregates subject to clinging are suffering.
The Buddha · Dhammacakkappavattana Sutta, Saṃyutta Nikāya 56.11 (trans. Bhikkhu Bodhi) · c. 5th century BCE (oral; written down 1st century BCE)
```

*Dukkha*, "suffering", covers frustration and existential unease as well as pain; many prefer "unsatisfactoriness". The claim is not that every moment feels bad, but that seeing everything as impermanent undermines a precondition of real enjoyment. The cause is *taṇhā*, literally "thirst". Early Western translators rendered it "desire", suggesting a paradox (is not wanting to end desire itself a desire?). "Craving" is now usual, and, as Damien Keown put it, "it is an oversimplification of the Buddhist position to assume that it seeks an end to all desire". Beneath craving lies a deeper root: ignorance (*avijjā*), a misconception rather than a mere gap in information. Since nirvana is called "the highest happiness", Vélez de Cea calls the outlook "realist" rather than pessimistic.

Two cautions. The comparison of the truths to a doctor's diagnosis and prescription, proposed by Hendrik Kern in 1882, is modern; Carol Anderson finds "not sufficient evidence" that the Buddha drew on a medical model (Christopher Gowans compares such analogies with those in Hellenistic Philosophy: Stoics, Epicureans and Sceptics). And some scholars, such as Bronkhorst, Schmithausen and Anderson, argue that the truths became central only somewhat later; Anālayo finds "no compelling basis" for doubting they were the topic of the first sermon, though the word "noble" may be a later addition.

## Dependent Origination

The causal principle behind the second truth is *pratītyasamutpāda*, "dependent origination": "when this exists, that comes to be; with the arising of this, that arises. When this does not exist, that does not come to be; with the cessation of this, that ceases." The best-known form is a chain of twelve links, running from ignorance through consciousness, the senses, contact, feeling, craving and grasping to birth, old age and death. Each link is the most necessary condition of the next, not its sole cause. But Siderits reports that modern scholarship regards the twelve-link list as a later compilation, since the texts give differing versions. What the Buddha probably taught is simpler: ignorance leads us to appropriate a working assemblage of physical and mental elements as "I" and "mine", producing desire and aversion, which strengthen the ignorance and ensure rebirth.

Dependent origination also grounds a middle path between two views of the person: *eternalism* (persons are eternal) and *annihilationism* (they go utterly out of existence at death). Both presuppose an "I" that might continue or end. If life's continuities are explained by a causal series of elements, the question of this "I"'s fate "simply does not arise". When the monk Sāti claimed that "it is the same consciousness that wanders through the cycle of rebirth", the Buddha rebutted him: consciousness itself arises from conditions. One modern gloss should be resisted, Vélez de Cea warns: that "everything is interdependent" is a later development, not a feature of early Indian Buddhism.

## Impermanence and the Five Aggregates

Tradition summarises existence by three marks: impermanence (*anicca*), unsatisfactoriness (*dukkha*) and non-self (*anattā*, Sanskrit *anātman*). It matters what "impermanent" meant. Siderits argues that by "permanent" the Buddha meant lasting at least several lives, which is why he rules out the body as self: it lasts only one. In the early texts "impermanent" did not mean "existing for just a moment"; momentariness came later, with the Abhidharma.

The discourses analyse a person into five *skandhas*, "aggregates" or heaps: material form (*rūpa*), the body; feeling (*vedanā*), pleasant, unpleasant or neutral; perception (*saññā*), the identifying of objects; mental formations (*saṅkhāra*), dispositions and volitions shaped by past action; and consciousness (*viññāṇa*), awareness through the six senses, the mind counted as the sixth. This is not a dualism of two substances like Descartes's: "mind" is an aggregate term for bundles of brief mental events. The Buddha defines "personal identity" as just these five.

## The Arguments for Non-Self

The discourses tell the disciple to see each aggregate as "this is not mine, this I am not, this is not my self". In the traditional second discourse, the *Anattalakkhaṇa Sutta*, Siderits finds two arguments. The first is from impermanence:

1. If there were a self, it would be permanent.
2. None of the five aggregates is permanent.
3. Therefore there is no self.

Premise 1 states what a self was for: it would explain what makes me the same person across lives, so it would have to last at least that long. But the argument is valid only with a hidden premise: that a person consists of nothing but the five aggregates. Siderits argues that the Buddha accepted it, given his hostility to unobservable entities; in one discourse he compares positing an unseen seer to longing for "the most beautiful woman in the world" on the grounds that she must surely exist.

The second argument is from control:

1. If there were a self, one could never desire that it be changed.
2. Each of the five aggregates is such that one can desire that it be changed.
3. Therefore there is no self.

In Bhikkhu Bodhi's translation the text begins: "Bhikkhus, form is nonself. For if, bhikkhus, form were self, this form would not lead to affliction", and one could say of it, "Let my form be thus; let my form not be thus".

**The objection.** Premise 1 seems to demand that a self have complete control over itself, which is far too strong. We do not expect vision to see itself.

**The reply.** Siderits reads the premise through an Indian principle of *irreflexivity*: nothing can operate on itself, as a knife cannot cut itself or a fingertip touch itself. A self would be the controller, so it could never find itself wanting to change its own state; whatever we want to change in ourselves is therefore not the self. On that reading premise 1 is true, premise 2 is plainly true, and, if the person is wholly the aggregates, no controlling self exists. The Sāṃkhya school, discussed in The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā, drew the opposite conclusion: control shows there is a controller beyond the aggregates, a self never observed because it "transcends all possible experience". The dispute turns on the hidden premise.

## Vajirā and the Chariot

The most famous non-self argument is usually credited to a monk, Nāgasena, but it appears first in the canon in the voice of a woman. The tempter Māra asks the nun Vajirā who created "this being". She answers that "a being" is an assumption, "a heap of sheer constructions" in which "no being is found", and gives the comparison:

```quote
Just as, with an assemblage of parts, / The word "chariot" is used, / So, when the aggregates are present, / There's the convention "a being."
Vajirā · Saṃyutta Nikāya 5.10 (trans. Bhikkhu Bodhi) · early canon, date uncertain
```

The *Milindapañha* ("Questions of Milinda") later staged the argument as a dialogue between Nāgasena and the Indo-Greek king Menander I, who ruled around 150 BCE (see the History chapter Alexander and the Hellenistic World). The text is composite, dates from sometime between 100 BCE and 200 CE, and presents the king as converted; but Nāgasena is otherwise unknown and the dialogue shows no sign of Greek influence, so it is no evidence of a historical conversion.

Nāgasena tells the king that his name is only "a generally understood term, a designation in common use. For there is no permanent individuality (or self) involved in the matter." Then who does good and bad deeds? Nāgasena asks about the king's chariot. Is the pole the chariot? The axle, the wheels, all the parts together, something apart from them? The king denies each, and concedes that "chariot" is the name used when the parts are assembled. So it is with "Nāgasena", says the monk, and he quotes Vajirā. Set out as an argument:

1. A whole is nothing over and above its parts suitably arranged: it is not any one part, nor the parts unarranged, nor something apart from them.
2. What is nothing over and above its parts is real only by convention: its name is a convenient designation.
3. A person stands to the five aggregates as a chariot stands to its parts.
4. Therefore a person is real only by convention, and there is no self over and above the aggregates.

This does not deny that the parts exist, or that "King Milinda rode in a chariot" is true. We keep one name for the assembled parts because it is convenient, given our interests and limits; the chariot is "the stock example of a conventionally real entity". Later Buddhists formalised this as a distinction between conventional and ultimate truth.

```checkpoint
q: Why is the argument from impermanence valid only with an extra premise?
a*: Because it needs the assumption that a person consists of nothing but the five aggregates.
a: Because it assumes that the self is impermanent.
x: The argument assumes the opposite: that a self, if it existed, would be permanent.
a: Because the Buddha denied that the aggregates are impermanent.
x: Premise 2 says that none of the aggregates is permanent, and the Buddha affirmed it.
a: Because "impermanent" in the early texts means "existing for just a moment".
x: Momentariness is a later Abhidharma doctrine; in the early texts "permanent" meant lasting at least several lives.
hint: Could a self exist somewhere other than among the five aggregates?
why: If something beyond the aggregates could be the self, showing that the aggregates are impermanent would prove nothing. Siderits argues the Buddha accepted the premise because he rejected unobservable entities; Sāṃkhya rejected it.
---
q: What is distinctive about the nun Vajirā in the history of the chariot argument?
a: She was the first to argue that the self is permanent.
x: Her verse denies that a being is found beyond the aggregates; it is a non-self argument.
a: She debated King Menander in the Milindapañha.
x: Menander's partner in that dialogue is Nāgasena, who quotes Vajirā.
a*: She gives the chariot comparison in the canon itself, and Nāgasena later quotes her.
a: Her verses were compiled centuries later by the monk Dhammapāla.
x: Dhammapāla's name is linked to the Therīgāthā and its commentary; Vajirā's verse is in the Saṃyutta Nikāya.
hint: Whom does Nāgasena cite when he finishes the argument?
why: In SN 5.10 Vajirā answers Māra that "a being" is a convention, like "chariot" for an assemblage of parts. The Milindapañha's famous dialogue builds on her verse.
```

## What Exactly Is Denied?

The mainstream reading, shared by the classical Indian tradition, Buddhist and non-Buddhist, takes the Buddha to deny any self. A minority (Bhattacharya, Pérez-Remón, and in a related form Miri Albahari) notes that he never says outright that the self does not exist, only that each aggregate is not the self; on this reading he left room for a self beyond experience. Others treat non-self as practical advice, not metaphysics. Vélez de Cea takes a middle line: a permanent, independent self is denied, a changing "process-self" accepted.

The Buddha's silences bear on this. He set aside ten questions, including whether a liberated being (*tathāgata*) exists after death. In the parable of the poisoned arrow, a monk who demands answers is like a wounded man who refuses treatment until he learns who shot him and of what caste. The fire simile adds a further reason: where does an extinguished fire go, north or south? The question assumes the fire still exists. Siderits and Vélez de Cea both read the questions about the liberated being as resting on a false presupposition, a self.

## Rebirth Without a Self

Here is the objection that Indian self-theorists thought decisive. No constituent passes from one life to the next, yet the Buddha teaches that the unenlightened are reborn. "If there is no constituent whatever that moves from one life to the next, how could the being in the next life be the same person as the being in this life?" And karmic reward or punishment is just only if the one who receives it is the one who acted.

Some modern Buddhists drop rebirth, but Siderits thinks the evidence that the Buddha taught it "seems quite strong": he taught it to advanced monastics, so it was no "noble lie" for householders. The replies have to work with rebirth.

**Neither the same nor different.** The Buddha says that the earlier and the later person are "neither the same nor different", and the Pāli denies both identity and distinctness. Since any two existing things must be either identical or distinct, Siderits reads this as saying that, strictly, there are no such persons: ultimately there are only impersonal events in causal sequence (ignorance, desire, intention, action, feeling, suffering). Persons and desert are conventionally real, because we reduce suffering by treating one another as persons with moral qualities. So "rebirth without transmigration is logically possible".

**A continuing process.** In the *Milindapañha*, asked whether one who is reborn is the same or another, Nāgasena answers "neither the same nor another". A lamp burns through the night: the flame of the first watch is not the same as that of the second, yet it is one lamp. Milk becomes curds, butter and ghee, which are "produced out of it". Vélez de Cea describes the agent as "a dynamic and dependently-arisen process-self who, like a flame or the water of a river, changes all the time and yet has some degree of continuity". The Abhidharma later made this precise: each momentary event conditions the next, forming "an uninterrupted, flowing continuum (*santāna*)".

**The Personalists.** The Pudgalavādins ("those who affirm the person") thought these replies gave too much away. The person, they held, is ultimately real, "neither identical with nor distinct from" the aggregates, and indescribable, as a fire is to its fuel. They were not marginal: the Chinese pilgrim Xuanzang in the seventh century CE found their Sāmmitīya school the largest of the early schools. Most Buddhists rejected the view, partly because something real yet indescribable invites paradox.

**Parfit.** Derek Parfit's *Reasons and Persons* (1984) argued that "persons do exist. But they exist only in the way in which nations exist", and that what matters is "psychological connectedness and/or continuity". Parfit wrote that "Buddha would have agreed", and Siderits called the Abhidharma view "Buddhist Reductionism". Monima Chadha challenges the comparison: she reads the later Abhidharma philosopher Vasubandhu as an *eliminativist*, denying persons altogether, because persons "inherit the work of the selves, so they are just as dangerous as selves". Whether non-self reduces persons or eliminates them returns in Identity, Change and Persons and in Self and No-Self: Personal Identity East and West.

## Ethics: Action Is Intention

Against the Brahmanical view of karma as ritual action, and the Jain view that even involuntary acts produce karma, the Buddha defined karma by the will: "It is intention, monks, what I call action. Having intended, someone acts through body, speech, and mind." Gombrich sees here "the transition from an earlier ritualistic view of action to a view that brings action within the purview of ethics". A parrot or an infant uttering profanities near an elder does nothing blameworthy. When the Buddha fell ill and died after a meal given by Cunda, he told his followers not to blame Cunda, whose intention had been generous. Past action conditions the will, but this is not fatalism.

The roots of bad action are greed, aversion and delusion. Lay followers take five precepts: to refrain from killing, stealing, sexual misconduct, lying and intoxicants. The eightfold path (right view, intention, speech, action, livelihood, effort, mindfulness and concentration) groups these into wisdom, ethics and concentration. The word usually translated "ethics", *śīla*, means something closer to "moral discipline".

What kind of ethics is it? The Buddha told his son Rāhula not to do an act that "would lead to my own affliction, or to the affliction of others, or to the affliction of both", which Charles Goodman takes to suggest consequentialism. Keown reads Buddhist ethics as virtue ethics, with nirvana playing a role like that of *eudaimonia*, the Greek ideal of flourishing; Vélez de Cea calls it a theory that fits no Western type. The Kālāma Sutta tells its hearers not to go by tradition, scripture or a teacher's authority alone, but Bhikkhu Bodhi warns against making the Buddha "a pragmatic empiricist who dismisses all doctrine and faith" on the basis of "a single passage, quoted out of context".

## The First Nuns

The canon tells how Mahāpajāpatī Gotamī, the Buddha's aunt and foster-mother, asked three times to be ordained and was refused, then cut her hair and walked with many women to Vesālī, where the monk Ānanda interceded. Asked whether a woman who goes forth can reach the highest attainment, the Buddha answers, "Yes, Ānanda, she would". Ordination was made conditional on eight "heavy rules" (*garudhammas*) subordinating nuns to monks, and the Buddha predicts that admitting women will shorten the life of the teaching from a thousand years to five hundred. Scholars doubt these details: Bodhi notes that the rules' own background stories place their origins at different times, and Anālayo regards the prophecy, which occurs only once in the canon, as a later development.

The *Therīgāthā* ("Verses of the Elder Nuns") has been called the earliest known collection of women's literature composed in India, though its authorship is debated; Bernard Faure finds no evidence that the verses were composed by the women they are attributed to. Vajirā's verse, by contrast, stands in the main discourse collections: a woman stating the doctrine of non-self in the canon's own words.

```checkpoint
q: What did the Buddha mean by karma (action)?
a: Any bodily movement, whether intended or not.
x: That is closer to the Jain view the Buddha rejected, on which even involuntary acts produce karma.
a*: Intention: the volition behind acts of body, speech and mind.
a: The correct performance of Vedic ritual.
x: That was the Brahmanical view; Gombrich sees the Buddha's definition as a move from ritual to ethics.
a: A fixed fate that determines everything one experiences.
x: Past karma conditions the will but does not dictate it; the view is not fatalism.
hint: Think of the parrot uttering profanities, or the Buddha's words about Cunda.
why: "It is intention, monks, what I call action." This is why an infant's or a parrot's words are not blameworthy and why Cunda, whose intention was generous, was not to be blamed.
---
q: How does Siderits interpret the Buddha's statement that the earlier and the later person are "neither the same nor different"?
a: As a mistranslation of a Pāli phrase meaning "the same".
x: The Pāli itself denies both identity and distinctness, so the point is not an artefact of English.
a: As proof that a permanent self passes from life to life.
x: Siderits takes the opposite view: no constituent passes from one life to the next.
a: As the Personalist claim that the person is ultimately real but indescribable.
x: The Pudgalavādins held that view, and most Buddhists rejected it.
a*: As saying that, strictly, there are no such persons: only impersonal events in causal sequence, with persons real by convention.
hint: Any two existing things must be either identical or distinct. What follows if they are neither?
why: Ultimately there are only causally connected events; persons and desert are conventionally real because treating people as moral agents reduces suffering. So rebirth without transmigration is possible.
```

## The Abhidharma: Experience in Moments

Some two centuries or more after the Buddha, monks began to systematise the teaching. *Abhidharma* probably means "concerning the teaching", though tradition takes it as "higher teaching". It is both a body of texts, the third "basket" of the canon and its commentaries, and a method: defined technical terms replace the conversational language of the discourses, which were said to speak in conventional terms, while the Abhidharma claims to speak in ultimate ones. Only two complete collections survive, the Sarvāstivāda's and the Theravāda's.

Its central move was to shrink the time scale. Where the discourses analysed experience into aggregates, the Abhidharma treated these processes as operating from moment to moment, and called the brief events *dharmas* (plural, distinct from the Dharma, the teaching): "evanescent events, occurrences, or dynamic properties rather than enduring substances". "Dharmas are all that there is." The Theravāda counts 82 types, including 52 mental factors and one unconditioned dharma, nirvana; the Sarvāstivāda counts 75. The purpose was practical too: to map the mind for meditation and show that no essence or self can be found in any phenomenon.

Hence the doctrine of momentariness: phenomena "pass out of existence as soon as they have originated". It is not a topic of the Buddha's discourses but a development of the principle of impermanence. The Sarvāstivādins ("those who hold that all exists") also claimed that past and future dharmas exist, to explain how a past action bears fruit; the Sautrāntikas replied that only present dharmas exist, explaining continuity by "seeds", a precursor of the Yogācāra school's thought.

Was this faithful? Gombrich reads it as scholastic literalism that turned a teaching about change into a catalogue of things; Ronkin sees a change of time scale, from lives to phases of each event. The later idea that each dharma has an "intrinsic nature" (*svabhāva*), absent from the discourses, became Nāgārjuna's target, as Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic explains. What the analysis of experience into fleeting events implies for awareness is taken up in Consciousness, and the later fortunes of these ideas in China in Chinese Buddhism and the Rise of Neo-Confucianism.

## Further exploration
- **Rupert Gethin, *The Foundations of Buddhism* (1998).** The standard short introduction to Buddhist thought and practice.
- **Christopher W. Gowans, *Philosophy of the Buddha* (2003).** A philosopher's guide to the early teaching, reading the self as a process.
- **Mark Siderits, *Buddhism as Philosophy* (2nd ed., 2021).** The analytic case for reading Buddhist thought as philosophy, from the early teaching to Madhyamaka.
- **Richard F. Gombrich, *What the Buddha Thought* (2009).** The Buddha's ideas read against their Brahmanical background.
- **Steven Collins, *Selfless Persons* (1982).** A classic study of the doctrine of non-self in Theravāda thought.
- **Charles Hallisey (trans.), *Therigatha: Poems of the First Buddhist Women* (2015).** A modern translation of the nuns' verses.
- **Noa Ronkin, *Early Buddhist Metaphysics* (2005).** How the Abhidharma built its theory of dharmas.$buddhism_master$,
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
  select $buddhism_quiz$[
    {"type": "mcq", "prompt": "Which statement about the Buddha's dates is best supported by current scholarship?", "options": ["He certainly lived 624–544 BCE, as Theravāda tradition holds", "His dates are uncertain, but many scholars now place his death around 410–370 BCE, for example c. 405 BCE", "Inscriptions from his lifetime fix his death at 483 BCE", "He lived in the first century BCE, when the Pāli canon was written down"], "answerIndex": 1, "explanation": "Traditional Theravāda dates are c. 624/623–544/543 BCE and older Western scholarship used about 563/560–483/480 BCE, but after the 1988 Göttingen symposium most scholars moved his life about a century later; Gombrich puts his death c. 405 BCE. No inscriptions survive from his lifetime, and not all historians accept the redating.", "id": "q1"},
    {"type": "mcq", "prompt": "Why does Siderits say the Buddha's 'impermanent' should not be read as 'momentary'?", "options": ["Because the Buddha taught that the self is permanent", "Because the Abhidharma rejected the doctrine of momentariness", "Because by 'permanent' the Buddha meant lasting at least several lives, and momentariness is a later development", "Because the Pāli word anicca means 'unsatisfactory'"], "answerIndex": 2, "explanation": "The Buddha rules out the body as self because it lasts only one life, which shows that 'permanent' meant lasting at least several lives. The doctrine that things exist for just a moment was developed later, in the Abhidharma; anicca is impermanence, dukkha unsatisfactoriness.", "id": "q2"},
    {"type": "mcq", "prompt": "In the argument from control, how does the Indian principle of irreflexivity help answer the objection that premise 1 is too strong?", "options": ["Since nothing can operate on itself, a controlling self could never find itself wanting to change its own state, so whatever we want to change is not the self", "It shows that the self can see itself, as the eye sees itself in a mirror", "It proves that the five aggregates are permanent", "It shows that the Sāṃkhya self can be directly observed"], "answerIndex": 0, "explanation": "The objection is that premise 1 demands total self-control. Read through irreflexivity (a knife cannot cut itself, a fingertip cannot touch itself), the self would be the controller and could not act on itself, so anything we wish to change in ourselves is not the self. Sāṃkhya held its self is never observed.", "id": "q3"},
    {"type": "mcq", "prompt": "Who were the Pudgalavādins?", "options": ["Materialists who denied rebirth and karma", "Sceptics whose students became the Buddha's chief disciples", "Abhidharma philosophers who held that past and future dharmas exist", "Buddhist 'Personalists' who held that the person is ultimately real, neither identical with nor distinct from the aggregates, and indescribable"], "answerIndex": 3, "explanation": "The Pudgalavādins ('those who affirm the person') affirmed an indescribable real person, comparing it to fire and its fuel. Xuanzang found their Sāmmitīya school the largest early school, but most Buddhists rejected the view, partly because it invites paradox. The 'all exists' doctrine belongs to the Sarvāstivāda.", "id": "q4"},
    {"type": "open", "prompt": "Set out the chariot argument for non-self, as given by the nun Vajirā and developed in the Milindapañha, and explain what it does and does not deny.", "rubric": "A strong answer credits Vajirā (SN 5.10) with the comparison in the canon itself: 'a being' is a convention, like 'chariot' for an assemblage of parts; Nāgasena quotes her. It reconstructs the argument: a whole is nothing over and above its arranged parts (not any part, not the parts unarranged, not something apart); such a thing is real only by convention; a person stands to the aggregates as a chariot to its parts; so the person is conventionally real and there is no self beyond the aggregates. It notes that the parts are not denied and that 'King Milinda rode in a chariot' is conventionally true, linking this to the later conventional/ultimate distinction. Credit caution about the Milindapañha (composite, 100 BCE–200 CE, Nāgasena otherwise unknown, the king's conversion only the text's framing) and mention of the minority reading that the Buddha never denied a transcendent self.", "id": "q5"},
    {"type": "open", "prompt": "If there is no self, how can there be rebirth and moral responsibility? State the objection and assess at least two Buddhist replies, with the comparison to Parfit.", "rubric": "A strong answer states the objection: no constituent passes between lives, yet karmic desert seems to require that the recipient be the same person as the agent. It notes that dropping rebirth is hard to square with the evidence (taught even to advanced monastics). It explains 'neither the same nor different' as Siderits reads it: ultimately only impersonal causal events, with persons conventionally real. It explains the continuity replies (Nāgasena's lamp and milk; Vélez de Cea's process-self; the Abhidharma continuum, santāna). It describes the Pudgalavāda alternative and why most Buddhists rejected it. It compares Parfit's reductionism (persons exist only as nations do; what matters is psychological connectedness and/or continuity), Siderits's 'Buddhist Reductionism', and Chadha's eliminativist reading of Vasubandhu.", "id": "q6"}
  ]$buddhism_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/ancient-beginnings/early-buddhism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
