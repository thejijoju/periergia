-- Early Scholasticism: Anselm, Abelard and the Universities — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/late-antiquity-and-medieval/early-scholasticism @ research/advanced/read.
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
    'philosophy/history-of-philosophy/late-antiquity-and-medieval/early-scholasticism',
    'research',
    'advanced',
    'read',
    $scholastic_master$> **Between about 1070 and 1255, philosophy in Latin Europe grew from a handful of monks and schoolmasters into a profession with its own institutions.** This chapter follows that growth. It sets out Anselm's famous argument that God must exist, step by step, with the monk Gaunilo's "Lost Island" objection and Anselm's reply; the problem of universals, and how Peter Abelard demolished his teacher's realism and put an account of his own in its place; Abelard's method and his ethics of intention; Heloise, his wife, whom scholars now read as a philosopher in her own right; the move from cathedral schools to the first universities; and the arrival of Aristotle, read with Avicenna and Averroes, in Latin translation.

## A Latin Philosophy Takes Shape

Latin philosophy before about 1100 lived in monasteries and, later, in the schools attached to cathedrals. Its revival was first stimulated at the end of the eighth century by Alcuin and other scholars at the court of Charlemagne, the world of the History chapter *Early Medieval Europe*. Teaching rested on the seven liberal arts, usually concentrating on the first two of grammar, logic and rhetoric. The logic came from Boethius, whose work *Augustine and Early Christian Philosophy* describes: from the late tenth century, students read his translations of and commentaries on Porphyry's *Isagoge* and Aristotle's *Categories* and *On Interpretation*, the small library later called the "old logic". Of the rest of Aristotle the Latin West had almost nothing.

The Irishman John Scottus Eriugena (c. 800 – c. 877), who knew Greek and argued in his *Periphyseon* that God is not among the things that exist, was an exception (his Neoplatonic sources are traced in *Plotinus and Neoplatonism*). The medievalist John Marenbon calls him and Anselm "the two outstanding Latin thinkers" of the years 800–1100.

By the eleventh century cathedral schools at Chartres, Laon, Reims, Paris and elsewhere were training clergy and administrators. Paris rose above the rest in the twelfth century, in Marenbon's words, "in part because the cathedral authorities, rather than just running one school, allowed many, competing ones." Competition among masters is the background to everything that follows.

## Anselm: Faith Seeking Understanding

Anselm was born in 1033 or 1034 in or around Aosta, then in Burgundy, and died on 21 April 1109. In 1060 he entered the Benedictine abbey of Bec in Normandy, whose school under Lanfranc was a centre of learning "especially in dialectic"; he became its prior in 1063 and abbot in 1078. At Bec he wrote the *Monologion* (1075–76) and the *Proslogion* (c. 1077–78). In 1093 he was enthroned as Archbishop of Canterbury, and during years of exile he finished *Cur Deus Homo* ("Why God Became Man"), which argues "on purely rational grounds" that the debt of human sin could be paid only by someone fully divine and fully human: the "satisfaction" theory of the atonement.

{{image: Anselm of Canterbury | Anselm as depicted on his seal.}}

His motto was "faith seeking understanding" (*fides quaerens intellectum*), the *Proslogion*'s original title. Thomas Williams, author of the Stanford Encyclopedia's entry on Anselm, warns against two misreadings. Anselm did not want understanding to replace faith, which for him was more a love of God than a belief; mere belief, he said, is "dead". Nor were his proofs only for believers: the *Monologion* says that someone ignorant of these truths "could at least convince himself of most of these things by reason alone, if he is even moderately intelligent" (Williams's translation).

The *Monologion* reasons from the world to God through chains of argument: things are good in different degrees, so they are good through one thing that is supremely good. In the *Proslogion*'s preface Anselm says he then sought "a single argument that needed nothing but itself alone for proof" (Williams's translation), and Marenbon reports that, by Anselm's account, it came in a flash of inspiration.

## The *Proslogion* Argument

Anselm never called his argument "ontological"; nobody did until Kant's time. It begins from the Psalm verse "The fool has said in his heart, 'There is no God'." God is "that than which a greater cannot be thought" (*quo maius cogitari non potest*), and Anselm asks what happens when even the fool hears those words.

```quote
"Thus even the fool is convinced that something than which nothing greater can be conceived is in the understanding, since when he hears this, he understands it; and whatever is understood is in the understanding. And certainly that than which a greater cannot be conceived cannot be in the understanding alone."
Anselm · Proslogion, chapter 2 (trans. William Mann) · c. 1077–78
```

The Stanford Encyclopedia's entry on ontological arguments (Graham Oppy, Joshua Rasmussen and Joseph Schmid) sets out the steps as a "first effort":

1. The fool understands the words "that than which no greater can be conceived".
2. Whatever is understood exists in the understanding.
3. So that than which no greater can be conceived exists in the understanding.
4. If it exists in the understanding, it can be conceived to exist in reality.
5. It is greater if it exists in reality than if it exists only in the understanding.
6. It is impossible to conceive of something greater than that than which no greater can be conceived.
7. So that than which no greater can be conceived exists in reality.

The idea is a reduction to absurdity: if the greatest conceivable being existed only in thought, we could conceive a greater one, the same being existing in reality. Oppy and Rasmussen admit that it is "not exactly clear" how step 7 follows.

The first critic was Gaunilo, a monk of Marmoutier near Tours, who soon wrote *On Behalf of the Fool* (*Pro insipiente*). Among other objections, he argued that the fool grasps only the words, so the being is not truly "in the understanding". His most memorable was a parody. Suppose, he wrote (in S. N. Deane's translation), someone describes an island more excellent than all lands. I understand the words, so the island is in my understanding; and since "it is more excellent not to be in the understanding alone, but to exist both in the understanding and in reality, for this reason it must exist." The conclusion is absurd, so an argument of this shape must be faulty somewhere.

Anselm replied that Gaunilo had misquoted him: "that which is greater than all" and "that than which nothing greater can be thought" "do not have the same value for proving" real existence. On the island he was defiant: if anyone could find something besides "that than which a greater cannot be thought" to which his argument's framework rightly applied, "I will find and give him this lost island, nevermore to be lost" (Greg Sadler's translation).

Whether that answers Gaunilo is still argued. Kenneth Himma replies on Anselm's behalf that a greatest possible island is incoherent, because the qualities that make islands good, such as plenty of fruit, have no built-in maximum. Klima and Ward have offered Anselmian replies; Wolterstorff argues that Anselm gave no specific rejoinder because he knew the objection was unanswerable.

Williams reads the exchange differently. Anselm, he argues, rejected Gaunilo's whole interpretation and denied relying on any general principle that existing in reality is greater than existing in the understanding (step 5 above, central to the standard reading that the *History of Philosophy* overview follows). Correctly understood, the argument runs: that than which a greater cannot be thought can be thought; if it can be thought, it exists in reality; so it exists in reality. The second premise holds because a being that could fail to exist is less great than one that exists necessarily. Nothing here says that every excellent thing must exist, so the island parody misses.

That connects to another dispute: is there a second argument in *Proslogion* 3?

```quote
"And [God] assuredly exists so truly, that it cannot be conceived not to exist. For, it is possible to conceive of a being which cannot be conceived not to exist; and this is greater than one which can be conceived not to exist."
Anselm · Proslogion, chapter 3 (trans. S. N. Deane) · c. 1077–78
```

Malcolm (1960) held that this chapter contains the real proof, a modal argument (one about necessity and possibility), and Hartshorne defended modal arguments drawn from it; Charlesworth (1965) treated it as a corollary of chapter 2; others read one proof across both chapters, and Holopainen argues that the preface's "single argument" is the formula itself.

Its origin is debated too. The Stanford Encyclopedia's entry on Augustine says it "develops the argument" of Augustine's *On Free Choice of the Will*, as the chapter on Augustine notes; Marenbon calls it "unprecedented".

## Later Fortunes

Thomas Aquinas rejected the deduction: not everyone takes "God" to mean that than which nothing greater can be thought, "seeing that some have believed God to be a body", and even granting the concept, it follows only that God exists mentally. Descartes gave a related proof in the Fifth Meditation (1641). Kant objected, in J. M. D. Meiklejohn's translation, that "Being is evidently not a real predicate": existence adds nothing to a concept. In the twentieth century Malcolm, Gödel and Plantinga revived the argument, Plantinga in a modal form. The chapters *Thomas Aquinas*, *Descartes*, *Kant* and *God: Arguments For and Against* follow these replies.

```checkpoint
q: Why did Gaunilo describe an island more excellent than all lands?
a*: To show that an argument of the same shape as Anselm's would prove absurd things, so the shape must be faulty.
a: To show that islands, unlike God, really exist.
x: He was not interested in islands for their own sake; the island was a parody.
a: To prove that God does not exist.
x: Gaunilo was a monk; his parody targeted the form of Anselm's proof, not belief in God.
a: To illustrate Kant's claim that existence is not a predicate.
x: Kant wrote centuries later; Gaunilo's objection is a parody, not a claim about predicates.
hint: Think about what a parody of an argument is meant to reveal.
why: The Lost Island copies Anselm's reasoning step by step with an island in place of God. Since the conclusion is absurd, something in the reasoning must be wrong.
---
q: According to Thomas Williams, what did Anselm deny in his reply to Gaunilo?
a: That God is that than which a greater cannot be thought.
x: Anselm insisted on that formula and accused Gaunilo of misquoting it.
a: That the fool can understand the words of the argument.
x: Anselm held that the fool does understand the words; that is the argument's first step.
a*: That his argument relied on a general principle that existing in reality is greater than existing in the understanding.
a: That God exists necessarily.
x: Necessary existence is central to the argument Williams finds in the Reply.
hint: Which premise would Gaunilo's island most need?
why: On Williams's reading, Anselm's argument is "if it can be thought, it exists in reality", resting on the greatness of necessary existence, not on a general principle that real existence is greater.
```

## The Problem of Universals

The second great debate of the period began from Porphyry's questions, which the chapter on Augustine introduces. In Paul Vincent Spade's translation, Porphyry declined to say "whether genera and species are real or are situated in bare thoughts alone", bodily or not, separate from things or in them. A **universal** is what a general word like "animal" stands for: something apparently shared by many individuals. Is it a thing, a thought or merely a word? Boethius had argued that nothing real could be common to many things wholly and at once while making up their substance, so universals, as universals, exist in the mind: they subsist in sensible things but are understood apart from them.

Roscelin of Compiègne (c. 1050 – c. 1121), known mainly through his opponents Anselm and Abelard, took the opposite extreme. Otto of Freising wrote that he "was the first in our times to institute the theory of words" (*sententia vocum*): universals are mere words, a "breath of the voice" (*flatus vocis*). He is often called the founder of nominalism, the view that only individual things exist and general terms are just names.

On the other side stood William of Champeaux (c. 1070–1122, perhaps born a decade earlier), master at Notre-Dame in Paris from 1094. Nearly everything we know of him comes from Abelard, "a man who hated him", as his modern defender Kevin Guilfoy puts it. William's **material essence realism** held that there are ten most general things, one for each of Aristotle's categories. Substance is one common thing "dispersed through all substances"; a difference such as rationality shapes it into a species, and accidents (passing features such as colour) shape a species into individuals: "a species is nothing other than a formed genus, an individual nothing other than a formed species."

## Abelard Against William

Peter Abelard was born in 1079 at Le Pallet near Nantes in Brittany, into the lesser nobility, and gave up his inheritance and knighthood. He studied with Roscelin and then William, and returned to Paris between 1108 and 1113 to debate William on universals. His argument runs:

1. Suppose the universal *animal* is one real thing, wholly present at once in Socrates and in Brunellus the donkey, making up the substance of each.
2. In Socrates this animal is shaped by rationality; in Brunellus, by irrationality.
3. Since it is one and the same thing in both, one thing is at once rational and irrational. But contraries cannot be in the same subject at once.
4. Worse, since each is wholly animal and the animal is one thing, Socrates is Brunellus, and so both rational and irrational.
5. So there is no universal thing of this kind.

Abelard met the replies. The contraries are present in the genus only potentially? No: each species is *actually* rational or irrational, and the genus is actually and wholly in each. Individuals differ by their accidents? That makes accidents prior to substance, and the accidents are themselves universal essences, so they cannot individuate anything.

William retreated to **indifference realism**: Socrates and Plato are "the same" only in not differing in being human; "it is not the same humanity in each one, but a similar [humanity], since they are two men." Abelard replied that "not differing" explains nothing, since Socrates and Plato also do not differ in being a stone.

Abelard's account has William humiliated. Guilfoy points out that William became bishop of Châlons-sur-Marne in 1113 and a papal negotiator, and argues that he "prodded Abelard to give up naïve vocalism", Roscelin's mere-words view.

## Abelard's Answer: the *Status*

Abelard concluded that universality is a feature not of things but of language: a universal is a word that can be predicated of many. But something must explain why a word applies to these things and not others, and Abelard asked (Spade's translation): "What is the common cause in accordance with which a common name is imposed?"

His answer was the *status*, for example "being a man" (*esse hominem*): not a thing, yet not nothing. He compared it to the cause in "the ship was wrecked because the pilot was absent": an absence is not an object, but it is a genuine cause. Socrates and Plato are both called "human" because each is human; in Abelard's words (as translated by Peter King and Andrew Arlig), "we mean precisely that they are human and don't differ in this regard ... although we're not appealing to any thing".

What a status is remains disputed. Klima reads it as a real non-thing, an object of the divine mind from eternity; Guilfoy reads it as no item in Abelard's ontology at all but a basic feature of individuals. The Stanford Encyclopedia calls Abelard "the first great nominalist", though it prefers the label "irrealism"; his followers were the *nominales*. *What Exists? Ontology and Universals* takes up the problem itself, and *Scotus, Ockham and the Late Medieval Debates* continues the medieval story.

## Method, Ethics and Condemnation

Around 1115 Abelard became master at Notre-Dame and, from 1115 or 1116, had an affair with Heloise, the ward of her uncle Fulbert, a canon there. They had a son, Astrolabe, and married in secret; Fulbert had Abelard castrated. Abelard became a monk at Saint-Denis, Heloise a nun at Argenteuil. A council at Soissons in 1121 (some date it 1122) made him burn his first *Theology*. He later gave his oratory of the Paraclete to Heloise and her nuns, and told the story in the *Historia calamitatum* ("The Story of My Troubles"), written in 1132 or soon after.

His *Sic et non* ("Yes and No") gathers 158 questions, each with authorities from the Church Fathers seeming to say yes and others no, left unresolved; the preface gives rules for reconciling them, such as looking for ambiguity and checking context. This method, Marenbon writes, "would form the basis for later medieval theology".

His ethics, in *Know Yourself* (*Scito teipsum*), holds that intention alone decides an act's moral worth; the deed itself is morally indifferent, and sin lies in consent. Two men intend to found shelters for the poor; one is robbed before he can act. To rank the one who acted higher would mean "the richer men were the better they could become ... this is the height of insanity!" (King and Arlig's rendering). *Deontology: Duty and Respect* takes up related questions.

Abelard's last enemy was Bernard of Clairvaux. At the Council of Sens in 1141 (traditionally dated 1140), Bernard had the bishops condemn propositions the evening before the debate Abelard had asked for; Abelard appealed to Rome, and Pope Innocent II imposed perpetual silence. Peter the Venerable of Cluny reconciled the two, and Abelard died on 21 April 1142.

## Heloise

Heloise was born around 1100 (some scholars argue for around 1090) and died in 1163 or 1164. Abelard calls her *nominatissima*, most renowned for letters. She became abbess of the Paraclete. Her letters to Abelard were once doubted, chiefly by John Benton, who partly retracted in 1980; most scholars now accept them. Whether a further set of anonymous love letters, the *Epistolae duorum amantium*, is also theirs remains contested.

Marenbon is clear: "Héloïse ... was a philosopher, though not at all a mystic." Writing in the early 1130s, she "radicalized the idea of selfless love, applying it to relations with another human rather than God". She argued against their marriage: if the name of wife seemed holier, that of *amica* (mistress), or even *scortum* (whore), was sweeter to her; she would rather be called his whore than the empress of Augustus. Translations vary in wording, but the point is that love freely given is worth more than a legal bond. She also held that the intention, not the deed, makes the sin, and some read her as anticipating *Know Yourself*; Marenbon suggests she "arguably" moved Abelard's ethics towards moderation, and Constant Mews argues that she shaped some of his ideas. Whether Abelard, who later wrote that he forced her consent "by threats and blows", was confessing or exaggerating is debated; her letters present her as having chosen him. *Sex, Love, and Marriage in the Middle Ages* sets her in the world of medieval marriage.

Her achievement is the more striking because, as Marenbon notes, "Women were excluded from the universities and, indeed, from most forms of higher education in the Latin Middle Ages." Her contemporary Hildegard of Bingen (1098–1179), an abbess who wrote on medicine and visionary theology outside the schools, is another woman increasingly studied as a philosopher.

```checkpoint
q: What was Abelard's main objection to William of Champeaux's material essence realism?
a: That universals are only breaths of the voice, as Roscelin taught.
x: Abelard rejected Roscelin's view too; his objection was that William's theory led to contradiction.
a*: That if one real animal were wholly present in Socrates and in a donkey, one thing would be both rational and irrational.
a: That Aristotle had no categories.
x: William's theory was built on Aristotle's categories; Abelard did not deny them.
a: That individuals differ only by their accidents.
x: That was a realist reply, which Abelard rejected because it makes accidents prior to substance.
hint: Think about Socrates and Brunellus.
why: A single thing wholly present in a rational and an irrational being would have contrary properties at once, which is impossible.
---
q: Which claim about Heloise does John Marenbon make?
a: That she was a mystic like Hildegard.
x: Marenbon says she was a philosopher "though not at all a mystic".
a: That she taught at the University of Paris.
x: Women were excluded from the universities.
a: That she wrote the Sic et non.
x: The Sic et non is Abelard's.
a*: That she was a philosopher who radicalised the idea of selfless love, applying it to love between humans.
hint: Think about what she argued in her letters about love and marriage.
why: Marenbon describes her as applying selfless love to relations with another human being rather than God, and as arguably moving Abelard's ethics towards moderation.
```

## From Cathedral Schools to Universities

The Paris masters needed textbooks. Peter Lombard (c. 1096–1160), later bishop of Paris, supplied the most lasting: his *Sentences* (c. 1155) sets out in four books the problem questions of theology with solutions, quoting heavily from Augustine. With the Bible it became a set text of the theology faculties.

"By about 1200," Marenbon writes, "the Paris schools had become a university, and at much the same time a university developed at Oxford." Paris received a royal charter in 1200 and papal recognition in 1215. Bologna, famous for law and run by guilds of students, is traditionally dated to 1088, though the historian Paul Grendler thinks a "university" there unlikely before the 1150s, and perhaps not before the 1180s. Oxford grew after 1167, when Henry II barred English students from Paris. *Lords, Peasants, and Towns in Medieval Europe* sets these institutions in the revival of towns.

A university had an Arts Faculty, with by far the most students, and higher faculties of Theology, Law and Medicine. Teaching rested on the *lectio*, a reading of a set text with commentary, and the *quaestio*, a question raised wherever two authorities seemed to contradict each other; in effect, Abelard's problem made into a routine. Masters held public disputations and then "determined" the answer, and the written question set out the arguments on each side, the master's answer and replies to objections.

## Aristotle and Averroes in Latin

What transformed the syllabus was new books. In the twelfth and thirteenth centuries almost all of Aristotle was put into Latin, "sometimes first via Arabic". Some came straight from Greek: James of Venice, who worked in Constantinople, translated the *Posterior Analytics*, completing the "new logic", and made the oldest known Latin *Metaphysics*; later William of Moerbeke (d. c. 1286) translated, or revised existing translations of, all of Aristotle from the Greek.

Much came through Toledo, taken by Alfonso VI of Castile in 1085. In the second half of the twelfth century, as *Falsafa: al-Kindī, al-Fārābī and Avicenna* describes, Gerard of Cremona and Dominicus Gundissalinus translated at full pace, Gundissalinus working with the Jewish scholar Avendauth on Avicenna. Whether this was a "Toledo School" is doubtful, though Dag Nikolaus Hasse sees a likely coherent programme. *Jewish Philosophy: from Saadia to Maimonides* shows Jewish thinkers drawing on the same Arabic learning.

Averroes' commentaries came later. Michael Scot and William of Luna were their most productive translators, and Latin versions reached the universities only around 1230, about thirty years after Averroes' death in 1198. So it would be too simple to credit Averroes alone with the thirteenth century's Aristotle: Latin scholars read Aristotle from Greek as well as through Arabic, and with Avicenna as much as Averroes.

The new books alarmed the authorities. In 1210 a synod at Sens ruled that "Neither the books of Aristotle on natural philosophy or their commentaries are to be read at Paris in public or secret". The statutes of the papal legate Robert of Courçon in 1215 allowed Aristotle's logic but forbade his *Metaphysics* and natural philosophy, and in 1231 Gregory IX renewed the ban until the books were "examined and purged of all suspicion of error". The bans leaked: Toulouse advertised "the books of Aristotle which were forbidden at Paris", and Oxford had no ban. The sources describe no formal repeal; instead, the Paris arts statutes of 1255 simply made all known works of Aristotle compulsory, and Averroes' commentaries became, in Hasse's phrase, "the principal secondary literature of Latin university culture".

Conflict followed. In 1277 Bishop Étienne Tempier of Paris condemned 219 theses discussed in the arts faculty, with motives and effects still disputed; *Al-Ghazālī, Averroes and the Quarrel over Reason* explains the Latin "Averroists", and *Thomas Aquinas* follows the synthesis these translations made possible.

## Further exploration

- **Thomas Williams (tr.), *Anselm: The Complete Treatises, with Selected Letters and Prayers and the Meditation on Human Redemption* (2022).** All of Anselm's treatises translated by one hand.$scholastic_master$,
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
  select $scholastic_quiz$[
    {"type": "mcq", "prompt": "When was Anselm's argument first called the 'ontological argument'?", "options": ["By Anselm himself, in the preface to the Proslogion", "By Gaunilo, in On Behalf of the Fool", "Not until Kant's time; neither Anselm nor his early critics and defenders used the label", "By Aquinas, in the Summa"], "answerIndex": 2, "explanation": "Anselm never used the term 'ontological argument', and neither did critics or defenders until Kant's time. The label is a later one.", "id": "q1"},
    {"type": "mcq", "prompt": "What did the 1215 statutes of Robert of Courçon decide about Aristotle at Paris?", "options": ["They allowed Aristotle's logic but forbade his Metaphysics and natural philosophy", "They made all of Aristotle's works compulsory reading", "They banned all of Aristotle, including his logic", "They formally repealed the ban of 1210"], "answerIndex": 0, "explanation": "The 1215 statutes permitted the logic but forbade the Metaphysics and natural philosophy. It was the arts statutes of 1255 that made Aristotle compulsory, and no formal repeal of the bans is known.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Abelard mean by the 'status' of a thing, such as 'being a man'?", "options": ["A real universal thing wholly present in every human", "A collection of all existing humans", "The social rank a person holds", "The common cause for imposing a common name: not a thing, yet not nothing, like the pilot's absence that causes a shipwreck"], "answerIndex": 3, "explanation": "Abelard denied that universals are things; the status 'being a man' explains why 'human' applies to Socrates and Plato without being an object, and he compared it to the absence of a pilot as a cause.", "id": "q3"},
    {"type": "mcq", "prompt": "When did Latin translations of Averroes' commentaries reach the universities?", "options": ["Before 1100, through Boethius", "Around 1230, about thirty years after Averroes' death in 1198", "Only after William of Moerbeke's translations in the late thirteenth century", "In the 1150s, through James of Venice"], "answerIndex": 1, "explanation": "Latin Averroes arrived about thirty years after his death, around 1230, translated mainly by Michael Scot and William of Luna. Aristotle himself came both through Arabic and directly from Greek.", "id": "q4"},
    {"type": "open", "prompt": "Set out Anselm's argument in Proslogion 2 step by step. Then explain Gaunilo's Lost Island objection, Anselm's reply, and Thomas Williams's alternative reading of the exchange.", "rubric": "A strong answer gives the steps: the fool understands 'that than which no greater can be conceived'; what is understood exists in the understanding; so it exists in the understanding; if so, it can be conceived to exist in reality; existing in reality is greater; nothing greater than it can be conceived; so it exists in reality (a reduction to absurdity). It explains the island parody: the same reasoning would prove that the most excellent island exists, which is absurd. It gives Anselm's reply: Gaunilo misquoted the formula as 'greater than all'; only 'that than which a greater cannot be thought' fits the argument, so he would give Gaunilo the island if he found another case. It notes Williams's reading that Anselm denied relying on the principle that real existence is greater, and that the argument runs 'if it can be thought, it exists', because a being that could fail to exist is less great than one that exists necessarily. Credit mention of Himma's reply (island excellence has no maximum) or the debate over Proslogion 3.", "id": "q5"},
    {"type": "open", "prompt": "Explain how Abelard refuted William of Champeaux's material essence realism and what he put in its place. Why might William's reputation deserve reassessment?", "rubric": "A strong answer explains William's view (ten most general things; genera formed into species by differences and into individuals by accidents) and Abelard's argument: if one real 'animal' is wholly in Socrates and in Brunellus the donkey, one thing is both rational and irrational, and Socrates would be Brunellus; it answers the replies (contraries only potentially present; individuation by accidents, which makes accidents prior to substance). It mentions William's indifference realism and Abelard's objection that 'not differing' explains nothing (they also do not differ in being a stone). It describes Abelard's view that universality belongs to words, and the status (e.g. 'being a man') as the common cause, neither a thing nor nothing, with the Klima/Guilfoy debate. On William it notes that our knowledge comes largely from the hostile Abelard, and that Guilfoy shows William became a bishop and papal negotiator and pushed Abelard beyond naïve vocalism.", "id": "q6"}
  ]$scholastic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/late-antiquity-and-medieval/early-scholasticism', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
