-- Falsafa: al-Kindī, al-Fārābī and Avicenna — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/falsafa @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/falsafa',
    'research',
    'advanced',
    'read',
    $falsafa_master$> **Philosophy in Arabic, from Baghdad to Isfahan.** This chapter follows the tradition the Arabic-speaking world called *falsafa*, from the translations of Greek works in ʿAbbasid Baghdad to its first three great figures. It sets out al-Kindī's argument that the world cannot be eternal, al-Fārābī's defence of logic and his philosophy of the "virtuous city", and the metaphysics and psychology of Avicenna: the distinction between essence and existence, the proof of a Necessary Existent, God's knowledge of particulars "in a universal way", and the "flying man". Three arguments are set out step by step, each with an objection and a reply.

## What "Falsafa" Means

*Falsafa* is the Arabic loan word for the Greek *philosophia*. Most scholars agree that what gave rise to the tradition was the movement that translated Greek learning into Arabic, though some regard the Qur'an and Islamic tradition as its main source, deriving it from the Qur'anic idea of *ḥikma*, "wisdom", with the Greek texts as instruments; *What Is Philosophy?* notes the same debate. By the twelfth century *falsafa* had come to mean something narrower, the distinctive teachings of Avicenna, and *ḥikma* had become the general term.

The philosophers were not Islam's only rational thinkers. Alongside them was *kalām*, rational theology. Its leading ninth-century school, the **Muʿtazilites**, allowed God no attributes distinct from His essence and taught that the Qur'an was created; the caliph al-Maʾmūn began an inquisition, the **Miḥna**, in 833 to impose that doctrine, and al-Mutawakkil reversed it between 847 and about 851. A rival school founded by al-Ashʿarī (d. 935/6) held that virtually all causal power belongs to God alone.

## The Translation Movement

Before Islam, Syriac-speaking Christians had already moved, as the historian Brock puts it, "from antagonism to assimilation" of Greek philosophy, translating Aristotle's logic and Porphyry's *Isagoge* into Syriac. Their heirs took part in the ʿAbbasid translations, and many texts went from Greek to Syriac and then to Arabic. The movement ran from the mid-eighth to the late tenth century, centred on Baghdad, founded in 762, and involved Muslim, Christian, Sabian and Jewish scholars. In the ninth century there were two main groups of translators: the circle around al-Kindī, and that of **Ḥunayn ibn Isḥāq** (d. 873), a Nestorian Christian physician. In the tenth, the Nestorian Abū Bishr Mattā ibn Yūnus (d. 940), who knew no Greek and worked from Syriac, taught in Baghdad; his pupils included al-Fārābī.

Popular histories picture a "House of Wisdom" (*Bayt al-Ḥikma*) as a university-like academy where all this happened. The Stanford Encyclopedia instead calls it a court library that "cannot be viewed as an institutional center for the translations", though the first translators were close to the court. Dimitri Gutas argues that the movement was unrelated to the library's activities, and explains it by the ʿAbbasid elite's adoption of Sasanian imperial ideology, itself shaped by Greek thought. *The Rise of Islam and the Caliphates* tells the wider story.

## Al-Kindī, "Philosopher of the Arabs"

Abū Yūsuf Yaʿqūb ibn Isḥāq al-Kindī (c. 800 – c. 870) is usually counted the first self-identified philosopher of the Arabic tradition. He came from Basra or Kufa (the sources disagree), was educated in Baghdad, and, belonging to the Arab tribe of Kinda, was later called "the philosopher of the Arabs". He is said to have served al-Maʾmūn, and he dedicated *On First Philosophy* to the next caliph, al-Muʿtaṣim, whose son he tutored. The *Theology of Aristotle*, really a reworking of Plotinus, was produced in his circle, as *Plotinus and Neoplatonism* describes. His writings, Peter Adamson suggests, "might be thought of as a sustained public relations campaign" for Greek thought before a Muslim audience. First philosophy, he wrote, is "the knowledge of the first truth who is the cause of all truth".

That first truth is the **true One**. Everything we can say of things, he argued, involves both unity and multiplicity: a species, for example, is one species with many members. This mixture cannot be due to chance, nor caused by anything that is itself one and many, so there must be an outside cause that is one "in truth", of which nothing can be said:

```quote
"Thus the true One possesses no matter, form, quantity, quality, or relation. … It is therefore only pure unity, I mean nothing other than unity. And every unity other than it is multiple."
al-Kindī · On First Philosophy (trans. Peter Adamson) · ninth century CE
```

God's proper act is "the bringing-to-be of beings from non-being": creation from nothing, needing no material and no time. Scholars have compared this austere theology to the Muʿtazilites'. On prophecy, Adamson's summary is that the prophet receives by God's gift, more clearly, what the philosopher reaches by long study: the content is the same.

## Against an Eternal World

Aristotle, the Stoics and the orthodox Neoplatonists held that the world had always existed. The sixth-century philosopher John Philoponus was the exception, and al-Kindī followed his strategy of using Aristotle against himself. In Adamson's reconstruction:

1. There can be no actual infinite: no infinite quantity actually exists (a principle Aristotle accepted).
2. The body of the cosmos is finite in magnitude.
3. Nothing predicated of a finite body can be infinite.
4. Time is predicated of the body of the cosmos: it is the time *of* that body.
5. Therefore time is finite, and the world had a beginning.

**The objection** is one an Aristotelian would make at once. Aristotle distinguished an *actual* infinite, a completed infinite quantity, from a *potential* one, a process that can always go on. A body can be divided as finely as we like, but its infinitely many parts never exist all at once. Likewise an eternal past implies only a potential infinite: for any number N, the world has already existed for N years, yet no infinity is ever actually present.

**The reply**, shared with Philoponus, is that to reach the present moment an actually infinite number of moments must already have gone by, and Aristotle himself held that "the infinite cannot be traversed". Adamson finds it unclear whether this works. It seems to assume a point infinitely far in the past from which we count forward, which Aristotle would refuse: every past moment is only finitely far away.

Arguments from the world's coming-to-be became typical of *kalām*, and the "kalām cosmological argument" was revived in modern philosophy of religion by William Lane Craig, as *God: Arguments For and Against* explains. Not everyone agreed. The physician Abū Bakr al-Rāzī (865–925) posited five eternal principles, God, Soul, matter, time and place, and, by a hostile report, called it unjust to single out some people for prophecy; whether he was a freethinker is debated.

## Al-Fārābī: Logic and the Grammarians

Al-Fārābī (c. 870 – 950/1) was known as "the second master", second after Aristotle. "We know little that is really reliable about al-Fārābī's life," the Stanford Encyclopedia warns. He was of Central Asian origin, probably born at a place called Farab; whether he was Persian or Turkic is disputed, with recent research leaning towards Persian. He worked in Baghdad, moved to Damascus in 943 and died there.

Logic was at the centre of his philosophy, and it needed defending. In 932, before the vizier in Baghdad, the grammarian al-Sīrāfī debated Abū Bishr Mattā. Logic, al-Sīrāfī argued, is Greek, tied to the Greek language, and of no use to Arabic speakers. Mattā answered: "The logician has no need of grammar, whereas the grammarian does need logic. For logic enquires into the meaning, whereas grammar enquires into the expression." The surviving account favours al-Sīrāfī, and scholars disagree about how much the episode mattered.

Al-Fārābī gave the better answer. In *The Enumeration of the Sciences* logic stands to the intellect and its concepts as grammar stands to language and its words; its subject is concepts in so far as words signify them, and words in so far as they signify concepts:

```quote
"[Logic] shares something with grammar in that it provides rules for expressions, yet it differs in that grammar only provides rules specific to the expressions of a given community, whereas the science of logic provides common rules that are general for the expressions of every community."
al-Fārābī · The Enumeration of the Sciences (trans. Tony Street, after Deborah Black) · tenth century CE
```

Logic is thus a kind of universal grammar, not Greek grammar in disguise. He also claimed it was indispensable to law and theology, a claim al-Ghazālī later took up. *Logic across Traditions* sets this beside Greek, Indian and Chinese logic.

## The Virtuous City

Al-Fārābī's political philosophy judges a city by how well it leads its citizens to happiness and imitates the order of the cosmos. Aristotle's *Politics* was apparently never translated into Arabic, so he built on Plato, as *Plato* explains, but for a vast, multilingual, multireligious empire, and so he made of the philosopher-king a philosopher-prophet-ruler. In *The Opinions of the People of the Virtuous City* the city is ordered like a body and like the cosmos, and the ruler is "the most perfect part of the city" (Walzer's translation). Against it stand ignorant, wicked (or "immoral") and errant cities; in *The Political Regime* the people of the immoral city know better but pursue status, honour, domination or pleasure.

Religion, in the *Book of Religion*, is "opinions and actions, determined and restricted with stipulations and prescribed for a community by their first ruler" (Butterworth's translation). It teaches through symbols what philosophy proves by demonstration. Philosophy is superior as knowledge, but religion is indispensable in practice, because most people need symbols. The ideal ruler is therefore philosopher, prophet, lawgiver and imam at once, able to translate demonstrated truth into persuasive images. Prophecy itself is natural: normally the "active intellect", an intellect beyond the human mind, gives concepts to our intellect, but in rare people it gives them to the imagination as images, and the highest perfection of imagination is prophecy.

How to read this is still debated. Followers of Leo Strauss, among them Muhsin Mahdi, read al-Fārābī esoterically, as writing one thing for the many and another for the few; others disagree. Even his authorship is sometimes in question: Marwan Rashed put "into serious doubt" in 2009 the authenticity of *The Harmonization of the Two Opinions of the Two Sages*, which argues that Plato and Aristotle do not really disagree, though other scholars defend it.

```checkpoint
q: What was the main Aristotelian objection to al-Kindī's argument against an eternal world?
a*: That an eternal past involves only a potential infinite, never an actual one, so the ban on actual infinites does not apply.
a: That the cosmos is infinite in size, so time can be infinite too.
x: The argument's second premise, that the cosmos is finite in magnitude, is not what the objection disputes.
a: That time is not connected to the body of the cosmos at all.
x: The objection accepts that time belongs to the cosmos; it targets the kind of infinity involved.
a: That the Qur'an teaches the world is eternal.
x: The objection is philosophical, drawn from Aristotle's distinction; it does not appeal to scripture.
hint: Think of a body that can always be divided further.
why: For any N, the world has existed for N years, just as a body can always be divided again; no infinity is ever actually present. Al-Kindī replied that an infinite past could not be traversed to reach the present.
---
q: How did al-Fārābī answer the claim that logic is merely Greek grammar?
a: He agreed, and urged Arabic speakers to learn Greek.
x: He defended logic as serving every language, not as a reason to learn Greek.
a: He argued that grammar and logic are the same science.
x: He distinguished them: grammar gives rules for one community's expressions, logic common rules for all.
a*: He argued that logic gives rules common to the expressions of every community, a kind of universal grammar of thought.
a: He conceded that logic was useless for law and theology.
x: He claimed the opposite: that logic is indispensable for jurisprudence and theology.
hint: Compare the rules of one language with rules for all of them.
why: In The Enumeration of the Sciences logic stands to concepts as grammar stands to words, but its rules are general for every community's expressions.
```

## Avicenna's Life

Ibn Sīnā, known in Latin as Avicenna, was born at Afshana near Bukhara, c. 970 (traditionally 980; Gutas argues the traditional date rests on a miscalculation), and died in 1037 in Hamadhān. His father was an official of the Samanids, the Persian dynasty that lost Bukhara in 999, as *Central Asia and the Steppe* describes. He spoke Persian natively but wrote mostly in Arabic.

{{image: Avicenna | A modern portrait of Avicenna (1952), held by the US National Library of Medicine.}}

In an autobiography dictated to his student al-Jūzjānī he says he mastered the philosophical sciences by himself by about eighteen; that treating the Samanid ruler won him entry to the palace library, where he "read those books, mastered their teachings, and realized how far each man had advanced in his science" (Gutas's translation); and that he grasped the purpose of Aristotle's *Metaphysics* only after reading al-Fārābī's short treatise on it. Gutas reads it partly as a literary device. When the Samanids fell, "necessity led me to forsake Bukhara", and he served as physician and counsellor at court after court, ending in Isfahan. In Rayy, according to accounts drawing on Gutas and Adamson, he served the Buyid amir Majd al-Dawla and his mother Sayyida Shīrīn, the realm's de facto ruler. No named woman philosopher of classical *falsafa* appears in the sources this chapter draws on, but she is a reminder that women held power and patronage in this world.

His great innovation was the philosophical *summa*, one work covering all of philosophy: *The Cure* (*al-Shifāʾ*, also translated *The Healing*) and, last, the deliberately allusive *Pointers and Reminders*. His *Canon of Medicine* was the basis of medical teaching in European universities until the seventeenth century. Gutas judges that in influence on the world west of India he is "second only to Aristotle".

## Essence and Existence

Avicenna's most famous distinction starts from a simple observation. We can know *what* a human, a horse or a triangle is without knowing *whether* any exists. If x can be conceived without y, y is not part of what x is. So existence is not part of a thing's **essence**, the "what-it-is" (Arabic *māhiyya*, "quiddity") captured in its definition. Again: if "to exist" just meant "to be something", "horses exist" would mean only "horses are horses".

Essence in itself is neutral. In the Latin version of his *Metaphysics*, "horseness in itself is only horseness" (*equinitas ergo in se est equinitas tantum*): neither universal nor particular. It becomes universal in the mind and particular in things. Every essence other than God's is therefore **possible in itself**: nothing in what it is requires it to exist. If it exists, it is **necessary through another**, made actual by its causes. Only in God are essence and existence the same, so God has no "what" beyond existing; as the *History of Philosophy* overview puts it, "what a thing is never explains *that* it is, except in one case".

How strong the distinction is remains disputed. Is it a real distinction between two components of things, or only one in our concepts? The Stanford Encyclopedia notes that Avicenna "does not present a clear-cut argument in favor of a real distinction", and most thinkers after him accepted only a conceptual one. Aquinas adopted it, as *Thomas Aquinas* explains.

## The Proof of the Truthful

Avicenna's argument for God is called *burhān al-ṣiddīqīn*, "the demonstration of the truthful", because it starts not from God's creations but from reflecting on existence itself. In Jon McGinnis's reconstruction:

1. Everything that exists is, considered in itself, either necessary through itself (it cannot fail to exist) or possible through itself (it exists through another).
2. A necessary existent must be simple. A composite exists through its parts, which are other than it, so it would exist through another.
3. Something exists. If it is necessary through itself, we have found a necessary existent.
4. If it is merely possible, consider the whole collection of all the possible things that now exist.
5. That collection exists. It is not necessary through itself, because it has parts. So it is possible, and exists through some cause.
6. That cause is inside the collection or outside it. If inside, one possible thing would cause the whole collection, itself included; it would exist through itself, and so be necessary, contradicting its being possible.
7. So the cause lies outside the collection of possibles, and the only thing outside it is a being necessary through itself.

Further arguments show that this being is unique, simple, immaterial, intellect and good: God.

What is distinctive is what the proof does *not* need. Unlike most cosmological arguments, it does not depend on ruling out an infinite regress of causes. The collection of possibles could be infinite; it still needs a cause outside itself. So the world depends on God at every moment, even if it has always existed. (Some other versions in Avicenna's works do use a no-regress step.) Scholars debate whether the proof is ontological, reasoning from concepts, or cosmological, reasoning from the fact that something exists.

**The objection** Avicenna himself anticipated is that a whole need not share its parts' features: a set of numbers is not a number, so a collection of possible things need not be merely possible. His reply: if the whole is not possible, it is necessary, and then we already have the necessary existent we were looking for. A second objection is that the proof shows at most *a* necessary existent, perhaps the universe itself. Avicenna answers with further arguments that a necessary existent must be simple and unique, which a universe of many parts is not, though Adamson notes that a critic may accept the necessary existent while resisting each step that identifies it with God.

Later critics pressed elsewhere. Al-Ghazālī objected that a being whose causing is necessary leaves no room for free choice; Averroes, that God should be shown from physics, as Aristotle did; Mullā Ṣadrā, that the proof begins with concepts and so infers illicitly from concepts to existence. Even so, Adamson calls it one of the most influential arguments of the Middle Ages. Aquinas, Scotus and Maimonides took it up, and "the Necessary Existent" (*wājib al-wujūd*) became a standard name for God. *Possibility and Necessity* follows the ideas further.

## God, Emanation and the Eclipse

For Avicenna the world is both eternal and created: God brings it into existence continuously, and it comes "after" non-being in order of essence, not of time. From the One only one thing comes directly, a first intellect, and from it a chain of heavenly intelligences, souls and bodies.

What can such a God know? Avicenna held that God knows particulars "in a universal way". Consider an eclipse. An astronomer may know that an eclipse will occur, then that it is occurring, then that it has occurred: three different states. Al-Ghazālī stated the problem crisply: "If the object known changes, knowledge changes; and if knowledge changes, the knower inescapably changes. But change in God is impossible" (Marmura's translation). So God knows the eclipse timelessly, through its causes. Avicenna held that this satisfies the Qur'anic verse that not even the weight of a speck of dust escapes God.

Scholars disagree about what it allows: Marmura concluded that God does not know all particulars individually, while others argue that for Avicenna God knows all things, in a universal mode. Al-Ghazālī had no doubt. The view, he wrote, entails that "if Zayd, for example, obeys or disobeys God, God would not know what of his states has newly come about". In *The Incoherence of the Philosophers* he condemned it as unbelief, with the eternity of the world and the denial of bodily resurrection. *Al-Ghazālī, Averroes and the Quarrel over Reason* takes up the quarrel.

## The Soul and the Flying Man

Aristotle treated the soul as the form of the body. Avicenna, closer here to Plato, held that the human soul is an independent, self-aware, immortal substance, only accidentally tied to its body, which keeps its individuality after death. To show it, he offered his most famous thought experiment, which opens the psychology of *The Cure*. Imagine a human being created all at once, fully formed, with his sight veiled, floating in the air or a void so that he feels no air on his skin, his limbs held apart so that they do not touch. Then:

1. This person has no sensory awareness of any body, including his own.
2. Yet he would not fail to affirm that he himself exists.
3. He would not affirm the existence of any limb, organ, heart or brain, nor that his self has length, breadth or depth; if he imagined a hand, he would not take it as part of himself.
4. What is affirmed is different from what is not affirmed.
5. So the self, the soul, is something other than the body.

The aim, in Alfred Ivry's words, is to show that a person can grasp the soul's existence intellectually, without the help of the senses or imagination.

**The objection** is that the argument assumes what it needs. Marmura argued that it simply presupposes the flying man would be self-aware, and moves from what we can imagine to what is actually so: "an unwarranted swerve from the hypothetical to the categorical". A related worry: that the flying man is unaware of his brain does not show that he is not his brain, just as failing to recognise a masked man does not show he is a stranger.

**The reply** is that self-awareness is not a conclusion but a premise, one each reader can confirm from experience, as Jari Kaukua argues. Adamson and Fedor Benevich argue that the argument is not circular and works given two "admittedly controversial assumptions"; Kaukua has replied in turn. The debate is live.

The resemblance to Descartes's "I think, therefore I am" led the Internet Encyclopedia of Philosophy to say that the flying man "prefigures by 600 years the Cartesian cogito", but whether the similarities are deep or trivial is disputed. Descartes reaches the self by methodically doubting the body; Avicenna imagines someone who simply lacks awareness of it. The argument reached Latin readers through a translation made in Toledo, but no source shows that Descartes knew it. *Augustine and Early Christian Philosophy* describes another forerunner, and *Descartes* and *The Mind–Body Problem* continue the story.

Avicenna also gave the brain five **internal senses**, among them imagination, memory and "estimation", his own innovation: the faculty by which a sheep perceives the wolf's hostility, which no outer sense registers. The intellect receives concepts from the active intellect, and prophets have to the highest degree **intuition** (*ḥads*), the power to hit at once on the middle term of a syllogism.

```checkpoint
q: What does Avicenna's Proof of the Truthful NOT depend on, unlike most cosmological arguments?
a: The claim that something exists.
x: Step 3 starts from the fact that something exists.
a*: Ruling out an infinite regress of causes.
a: The division of existents into necessary and possible.
x: That exhaustive division is the proof's first step.
a: The claim that a necessary existent must be simple.
x: Simplicity is used to show that the collection of possibles cannot itself be necessary.
hint: Could the collection of possible things be infinite?
why: Even an infinite collection of possible things needs a cause outside itself, so the proof works even if the world is eternal; some other versions do use a no-regress step.
---
q: What is Marmura's objection to the flying man?
a: That no one could survive floating in a void.
x: The thought experiment only asks us to imagine the situation; physical survival is beside the point.
a: That Avicenna copied the argument from Descartes.
x: Descartes came some six centuries later, and no evidence shows that he knew the argument.
a: That it proves the soul is the form of the body.
x: Avicenna's conclusion is the opposite: the soul is other than the body.
a*: That it presupposes the man's self-awareness and swerves from the hypothetical to the categorical.
hint: Ask what the argument assumes in its second step.
why: Marmura called the move "an unwarranted swerve from the hypothetical to the categorical"; defenders reply that self-awareness is a premise readers can confirm for themselves.
```

## Afterlives

In the second half of the twelfth century, translators in Toledo such as Gerard of Cremona and Dominicus Gundissalinus, the latter working with the Jewish scholar Avendauth, put al-Kindī, al-Fārābī, al-Ghazālī and Avicenna into Latin. His system of internal senses became standard in Latin psychology from about 1220; theses inspired by Avicenna were among those condemned at Paris in 1277. Jewish thinkers took the same path, as *Jewish Philosophy: from Saadia to Maimonides* shows.

In the Islamic East *The Cure* and *Pointers and Reminders* became the basis of the madrasa philosophy curriculum, with commentaries into the twentieth century. Fakhr al-Dīn al-Rāzī (1149–1210), an Ashʿarite theologian, wrote what seems to be the first line-by-line commentary on an Arabic philosophical work, on the *Pointers*, criticising freely without treating the philosophers as apostates. Suhrawardī (c. 1154–1191) founded the "Illuminationist" tradition, rejected the real distinction between essence and existence, and reworked the flying man into a doctrine of "knowledge by presence". Mullā Ṣadrā later rebuilt Avicenna's metaphysics around the primacy of existence, as *Beyond Europe: Mullā Ṣadrā, Wang Yangming, Tokugawa Confucianism and the Hatata* describes. Al-Kindī's call to take truth from wherever it comes had been answered more fully than he could have imagined.

## Further exploration

- **Peter Adamson, *Philosophy in the Islamic World* (2016).** The most readable full history, by the author of the Stanford Encyclopedia's entry on al-Kindī.
- **Dimitri Gutas, *Greek Thought, Arabic Culture* (1998).** The standard account of the translation movement, including the argument about the House of Wisdom.
- **Peter Adamson, *Al-Kindī* (2007).** A clear study of the first philosopher of the Arabic tradition.
- **Muhsin Mahdi, *Alfarabi and the Foundation of Islamic Political Philosophy* (2001).** An influential reading of al-Fārābī's political thought.
- **Jon McGinnis, *Avicenna* (2010).** An accessible introduction to Avicenna's whole philosophy.
- **Jari Kaukua, *Self-Awareness in Islamic Philosophy: Avicenna and Beyond* (2015).** The flying man and its long afterlife.
- **Jon McGinnis and David C. Reisman, *Classical Arabic Philosophy: An Anthology of Sources* (2007).** Translations of al-Kindī, al-Fārābī and Avicenna.$falsafa_master$,
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
  select $falsafa_quiz$[
    {"type": "mcq", "prompt": "What do specialists such as Gutas and the Stanford Encyclopedia say about the 'House of Wisdom' in Baghdad?", "options": ["It was a court library, not the institutional centre of the Greek translations", "It was a university where al-Kindī taught al-Fārābī", "It was founded by Avicenna in Isfahan", "It was where the Miḥna was administered"], "answerIndex": 0, "explanation": "The Stanford Encyclopedia calls it a court library that cannot be viewed as an institutional centre for the translations; Gutas argues the translation movement was unrelated to its activities. The university-like academy is a later popular picture.", "id": "q1"},
    {"type": "mcq", "prompt": "Which premise does al-Kindī's argument against an eternal world take from Aristotle?", "options": ["Time is unrelated to the body of the cosmos", "The world was created at a moment in time", "There can be no actual infinite", "The heavens are made of ordinary earthly matter"], "answerIndex": 2, "explanation": "Following Philoponus, al-Kindī used Aristotle against himself: there is no actual infinite, the cosmos is finite, so the time predicated of it must be finite too. Aristotle himself held the world eternal.", "id": "q2"},
    {"type": "mcq", "prompt": "How did al-Fārābī adapt Plato's philosopher-king?", "options": ["He rejected rule by philosophers in favour of Aristotle's Politics", "He replaced the ruler with a council of grammarians", "He argued that religion should be abolished", "He made the philosopher-king a philosopher-prophet-ruler, able to translate demonstrated truth into persuasive symbols for an empire of many peoples and religions"], "answerIndex": 3, "explanation": "Aristotle's Politics was apparently never translated into Arabic. Al-Fārābī built on Plato for a multilingual, multireligious empire; religion teaches through symbols what philosophy proves, and the ideal ruler is philosopher, prophet, lawgiver and imam at once.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Avicenna, how does God know an eclipse?", "options": ["Through the senses, as an astronomer watches it", "In a universal way, timelessly through its causes, since knowing it as future, present and past would change God", "Not at all, since God knows nothing outside Himself", "Only after it has occurred"], "answerIndex": 1, "explanation": "Knowledge that changes with its object would change the knower, and change in God is impossible; so God knows particulars 'in a universal way'. Al-Ghazālī condemned the view as unbelief, and scholars still debate exactly what it allows God to know.", "id": "q4"},
    {"type": "open", "prompt": "Set out Avicenna's Proof of the Truthful step by step, explain what makes it unusual among arguments for God, and give one objection with Avicenna's reply.", "rubric": "A strong answer gives the division of existents into necessary through themselves and possible through themselves; the claim that a necessary existent must be simple, since a composite exists through its parts; the step from something existing to the whole collection of possible existents, which has parts and so is possible and needs a cause; and the argument that the cause cannot be inside the collection (a possible thing causing the whole, itself included, would be necessary) and so must be a necessary existent outside it, later shown to be unique, simple and God. It notes that the proof does not depend on ruling out an infinite regress, so the world depends on God even if eternal (some other versions use a no-regress step), and that scholars debate whether it is ontological or cosmological. It gives an objection and reply, for example: the whole need not share its parts' possibility, to which Avicenna replies that then the whole is necessary, which is what was sought; or that the proof yields only some necessary existent, perhaps the universe, answered by the further arguments for simplicity and uniqueness, with Adamson's point that a critic can resist those steps. Mention of al-Ghazālī, Averroes or Mullā Ṣadrā is a bonus.", "id": "q5"},
    {"type": "open", "prompt": "Reconstruct Avicenna's 'flying man' argument, state the main objection and the best reply, and assess how close it is to Descartes's cogito.", "rubric": "A strong answer describes the set-up (a human created fully formed, sight veiled, floating so that nothing is felt, limbs apart) and the steps: no awareness of any body, yet he affirms his own existence, without affirming any limb, organ or extension; what is affirmed differs from what is not; so the soul is other than the body, an independent substance, against Aristotle's view of the soul as the body's form. It gives Marmura's objection that it presupposes self-awareness and swerves 'from the hypothetical to the categorical', and the related masked-man worry that not being aware of one's brain does not show one is not one's brain. It gives the reply that self-awareness is a premise each reader confirms from experience (Kaukua), and that Adamson and Benevich defend the argument as non-circular given controversial assumptions. On Descartes it notes the resemblance and the IEP's 'prefigures by 600 years', but that whether the similarity is deep or trivial is disputed, that Descartes reaches the self by doubting the body while Avicenna imagines someone simply lacking bodily awareness, and that no evidence shows Descartes knew the argument.", "id": "q6"}
  ]$falsafa_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/falsafa', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
