-- Meaning and Reference — canonical master article, co-written and human-reviewed.
-- philosophy/science-and-language/meaning-and-reference @ research/advanced/read.
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
    'philosophy/science-and-language/meaning-and-reference',
    'research',
    'advanced',
    'read',
    $meaning_master$> **How does a word hook onto a thing?** This chapter follows that question through Frege's distinction between sense and reference, Russell's theory of descriptions and its critics, Kripke's modal argument against the view that names abbreviate descriptions (set out step by step, with the replies), and Putnam's and Burge's case that meaning is partly outside the head. It then gives full weight to the Sanskrit debates over what a word like "cow" means, from the grammarians to Mīmāṃsā, Nyāya and Dharmakīrti's Buddhist causal theory, and ends briefly with names in early China.

## Two Pictures of a Name

The simplest view is that a name is a label: "Socrates" stands for Socrates, and that is all there is to its meaning. This is **Millianism**, after J. S. Mill's *A System of Logic* (1843); in the Stanford Encyclopedia of Philosophy's (SEP) summary, "a name's meaning is simply its referent", the **referent** being the thing picked out. Ruth Barcan Marcus (1921–2012) gave the idea its sharpest form in 1961, proposing that proper names are mere "tags", whose meaning "is exhausted by this referential function". One consequence, which she had proved formally in 1947, is that a true identity between two names is necessary: if both are tags for one thing, that thing cannot fail to be itself.

The rival picture holds that a name also carries a way of thinking about its bearer, something like a description. *Frege, Russell and the Birth of Analytic Philosophy* tells how that picture arose; *Analytic Philosophy since 1950* tells how Kripke attacked it. This chapter goes underneath both stories to the arguments, and then shows that the same quarrels, between labels and descriptions, convention and nature, ran for centuries in India.

## Frege: Sense and Reference

Gottlob Frege (1848–1925) published "Über Sinn und Bedeutung" ("On Sense and Reference") in 1892. The distinction had been "first outlined, albeit briefly" in 1891, in arithmetic: contemporaries were wary of reading the "=" in "4 × 2 = 11 – 3" as identity, and Frege held that both sides stand for one number, eight, presented in different ways.

The SEP's Edward Zalta frames the 1892 paper as answering two puzzles. The first concerns identity: "the morning star is identical to the evening star" (later philosophers say *Hesperus* and *Phosphorus*) can be a discovery, while "the morning star is the morning star" is trivial, though both are about one planet. The second concerns belief. From "S(n)" and "n = m" we should be able to infer "S(m)". Yet "John believes that Mark Twain wrote *Huckleberry Finn*; Mark Twain = Samuel Clemens; therefore John believes that Samuel Clemens wrote *Huckleberry Finn*" is invalid. Frege "is generally credited with identifying" this puzzle, the SEP notes, "even though he didn't quite describe" it in today's terms.

His answer was that an expression has a **reference** (*Bedeutung*), the thing it stands for, and a **sense** (*Sinn*), which in Zalta's gloss "accounts for its cognitive significance—it is the way by which one conceives of the denotation of the term"; the Internet Encyclopedia of Philosophy (IEP) calls it the "mode of presentation". Senses are objective: different people, and expressions in different languages, can share one. Frege also set aside "colouring" or "scent" (*Färbung*, *Duft*), usually called "tone" in English.

For belief reports Frege made a bold move. After "John believes that…", words stand not for their usual referents but for their ordinary senses; the IEP calls these **oblique contexts**, and the embedded sentence then refers to a thought rather than a truth-value. "Mark Twain" and "Samuel Clemens" share a referent, but inside the report they refer to their different senses, so the substitution principle survives: it never licensed swapping terms that do not co-refer. Predicates such as "( ) has a heart" are "unsaturated" (*ungesättigt*), referring to functions from objects to truth-values; the IEP notes that "( ) has a heart" and "( ) has a kidney" arguably share a reference but differ in sense. Names like "Odysseus" have sense without reference, and sentences containing them "express thoughts, but are neither true nor false".

Three debates surround this. The first is translation: *Bedeutung* has been rendered "meaning" (chosen for the Blackwell editions around 1970 for "exegetical neutrality"), "reference" (Dummett), "significance" (Tugendhat, since "referent" fits predicates badly) and "denotation" (Zalta, because "reference" also names something a person does). The second concerns sources. Susanne Bobzien argued in 2021 that Frege borrowed heavily and without acknowledgement from Stoic logic as reported in Prantl's history of logic, matching Stoic *lekta* with *Sinn* and the Stoic "incomplete" with the unsaturated; her evidence is cumulative, with "no smoking gun", and Gahér (2021) and Rami, Gabriel and Hüser (2024) have replied. The third, which the Birth chapter left open, is whether Frege was a **descriptivist**, holding that a name means what some description means. He implies that someone might attach to "Aristotle" the sense "the pupil of Plato and teacher of Alexander the Great", and after Russell many read senses as descriptive information, making Frege, in the IEP's word, a "forerunner" of descriptivism. Yet the IEP stresses that senses "are not linguistic items" and need not be expressible by any description; scholars also dispute whether Frege let a name's sense vary between speakers. If he was not a descriptivist, Kripke's arguments may not touch him.

## Russell's Descriptions and Their Critics

Russell's "On Denoting" (*Mind*, 1905), which Ramsey called "that paradigm of philosophy", took another road. Denoting phrases, he argued, "never have any meaning in themselves": "C(the father of Charles II)" says that one and only one thing begot Charles II, and that it is C. "A logical theory", he held, "may be tested by its capacity for dealing with puzzles", and one tool for solving them was **scope**, which he called primary and secondary occurrence.

```quote
Thus all propositions in which 'the King of France' has a primary occurrence are false: the denials of such propositions are true, but in them 'the King of France' has a secondary occurrence.
Russell · "On Denoting", Mind · 1905
```

Scope also gives Russell an answer to Frege's belief puzzle. In Peter Ludlow's SEP example, "George wondered whether the Morning Star is the Evening Star" has a reading on which a description takes wide scope (the star seen in the morning is such that George wondered whether *it* is the one seen in the evening), and one on which both take narrow scope, where George "has gone mad and is in fact wondering about the law of identity".

Keith Donnellan (1931–2015) challenged the theory in 1966. Detective Brown, finding Smith's mutilated body, says "The murderer of Smith is insane" of whoever did it: an **attributive** use. Someone pointing at Jones behaving strangely in the dock says the same words of Jones, "whether or not Jones is the actual murderer": a **referential** use. Russell, Donnellan said, fits only the first. Kripke replied in 1977, in four steps:

1. Grice distinguished what is said from what is meant, as with a recommendation letter praising only a candidate's punctuality and handwriting (see *Language, Thought and Speech Acts*).
2. So **semantic reference**, what the words refer to, can differ from **speaker's reference**, what the speaker has in mind.
3. The same happens with names: seeing Johnson raking leaves and taking him for Jones, I say "Jones is really working up a sweat today". I say something about Jones but communicate something about Johnson, yet no one thinks "Jones" ambiguous.
4. So positing an ambiguity in "the" would be "a kind of philosophical cheat".

Problems remain, among them incompleteness ("the table is covered with books", though there are many tables), which Kripke allowed "might be enough of a problem to force us to accept referential interpretations".

## Kripke's Modal Argument

Saul Kripke (1940–2022) gave the lectures that became *Naming and Necessity* at Princeton in January 1970. He attributed versions of descriptivism to Frege, Russell, Wittgenstein and Searle, whose "Proper Names" (1958) proposed the **cluster theory**: a name is backed by a cluster of descriptions, enough of which must fit the bearer. Kripke wrote it on the blackboard as six theses, among them that the referent is whatever satisfies most of the cluster, and that the speaker knows a priori (without experience) that if X exists, X has most of these properties.

His key notion is **rigidity**. In the SEP's words, a rigid designator "designates just the object it actually designates in all possible worlds in which that object exists, and it designates nothing else in any possible world", a **possible world** being a complete way things might have been. A name is rigid; "the teacher of Plato" is not, since in other worlds someone else taught Plato. Hence the **modal argument**, as the SEP reconstructs it:

1. Suppose descriptivism: "Socrates" means "the teacher of Plato and Xenophon".
2. Expressions alike in meaning can be swapped without changing truth, even in claims about what might have been.
3. "The teacher of Plato and Xenophon might not have been human" sounds true (Plato and Xenophon might have been raised by wolves); "Socrates might not have been human" is false.
4. So name and description differ across possible worlds: the name is rigid, the description not.
5. So the name does not mean the description.

The SEP's parallel example: "Petrarch might not have been famous" is true, but "the famous humanist most closely associated with the Italian Renaissance might not have been famous" has a false reading.

**Objection: wide scope.** Dummett (1973, revised 1981), later Sosa (2001) and Hunter (2005), used Russell's own tool. On the reading where the description takes wide scope, there is someone who is the famous humanist and who might never have been famous, which is true. Names simply "gravitate towards the widest possible scope", so name and description match after all.

**Kripke's counter.** In the 1980 Preface he gave two answers. Some sentences have no modal word to take scope over: at a world where Petrarch dies as an infant, "Petrarch is never famous" seems true, but "the famous humanist… is never famous" is false at every world. And we can deliberately put the name inside the operator: "It might have been the case that: Petrarch never became famous." These arguments, the SEP judges, "seem to have persuaded most of his audience"; Dummett modified his view.

**Second objection: rigidified descriptions.** "The *actual* teacher of Plato" picks out the same man in every world, so rigidity alone does not refute descriptivism; Timothy Williamson used this to separate Marcus's direct reference from Kripke's rigidity. **Reply:** the rigidified description still faces Kripke's other arguments. A speaker can refer to Petrarch while thinking Valla the leading humanist; many refer to Feynman knowing only that he was "a physicist"; and on the epistemic side, experts can posit a historical figure behind a legend who has none of the legend's attributes, so the description is not known a priori.

The debate continues. Dummett (1991) and Stanley distinguish what a sentence asserts from how it embeds; Gareth Evans (1946–1980) held that "Julius", a name for whoever invented the zip, and its descriptive twin "have the same content, despite their modal differences"; Rothschild (2007) lets descriptions denote roles. **Two-dimensional semantics** (Lewis, Jackson, Chalmers) gives each word one profile for how it picks out a referent if a world is taken as actual and another for counterfactual worlds; defenders treat the first as an a priori aspect of meaning, while externalists accept only the second as content.

{{image: Ruth Barcan Marcus | Ruth Barcan Marcus (1921–2012), who argued in 1961 that proper names are mere "tags" and had formally proved the necessity of identity in 1947.}}

A priority dispute shadows the story. Quentin Smith (1995) claimed that ideas in *Naming and Necessity* were first presented by Marcus, in a 1969 lecture Kripke attended; Stephen Neale and Scott Soames argued that he is mistaken, and most agree with them.

Kripke's alternative, outlined at roughly the same time by Geach (1969) and Donnellan (1970), was that reference is fixed at a dubbing and then borrowed along a chain of speakers, who need not be able to identify any of the lenders. He added that naming a hedgehog "Napoleon" starts a new use, so "not every sort of causal connection to previous use suffices". Evans objected that on simple versions even a name "briefly overheard in a train or café" would refer to its original bearer.

```checkpoint
q: How does Frege explain why "John believes that Mark Twain wrote Huckleberry Finn" does not license "John believes that Samuel Clemens wrote Huckleberry Finn"?
a*: Inside a belief report the names refer to their ordinary senses, which differ, so they no longer co-refer there.
a: The two names have different referents, so they were never interchangeable.
x: Mark Twain is Samuel Clemens; the names share a referent in ordinary contexts, which is what makes the puzzle.
a: The substitution principle is simply false and should be abandoned.
x: Frege's aim was to keep the principle intact; it fails only because the names change their reference in oblique contexts.
a: Belief reports have no truth-value, so no inference about them is valid.
x: For Frege the embedded sentence refers to a thought, and the whole report is true or false.
hint: What do words stand for after "believes that", in Frege's theory?
why: In oblique contexts words take their ordinary senses as referents. "Mark Twain" and "Samuel Clemens" present the same man differently, so inside the report they refer to different senses and cannot be swapped.
---
q: What is Kripke's answer to the reply that descriptions in modal sentences can take wide scope?
a: He concedes the point and abandons the modal argument.
x: The SEP reports that his counter persuaded most of his audience; it was Dummett who modified his view.
a: He argues that descriptions can never take wide scope.
x: Scope ambiguity is Russell's idea and Kripke does not deny it; he denies that it saves descriptivism.
a*: He points to sentences with no modal word, such as "Petrarch is never famous", and to cases where we deliberately put the name inside the modal operator.
a: He argues that names are ambiguous between rigid and non-rigid readings.
x: Kripke resists positing ambiguities, as in his reply to Donnellan.
hint: Think of a world where Petrarch dies as an infant.
why: "Petrarch is never famous" seems true at that world, but "the famous humanist… is never famous" is false at every world whatever its scope; and "It might have been the case that: Petrarch never became famous" places the name within the operator on purpose.
```

## Meanings Ain't in the Head

Hilary Putnam (1926–2016) extended the lesson from names to natural-kind words such as "water" and "elm", in "Meaning and Reference" (1973) and "The Meaning of 'Meaning'" (1975). Twin Earth, told in *Analytic Philosophy since 1950*, is one of three cases; the others involve aluminium and molybdenum, and a speaker who cannot tell an elm from a beech yet whose word "elm" applies to all and only elms. His conclusion is usually quoted from the 1975 paper as "Cut the pie any way you like, 'meanings' just ain't in the head!", the wording given in Wikipedia's article on Twin Earth; the SEP prints it slightly differently, and one source places it in the 1973 paper.

What fixes the extension, then? A **division of linguistic labour**, "analogous to Adam Smith's economic division of labor": experts (botanists for "elm", chemists for "table salt") fix reference, and the rest of us borrow it. Meaning becomes a "vector": extension (H₂O), stereotype (transparent, colourless), semantic markers (natural kind, liquid) and syntactic markers (mass noun).

Tyler Burge (born 1946) went further in 1979. A patient believes he has arthritis in his thigh; since arthritis afflicts only joints, the belief is false. In a community whose word "arthritis" covers his ailment, the same patient has a true belief that is not about arthritis at all. The difference comes from linguistic practice, not nature, and Burge, "unlike Putnam, explicitly endorses" the conclusion that beliefs themselves depend on what lies outside the head. This is **externalism**. Its critics include Boghossian, whose "Dry Earth" (1997) presses the problem of how we know our own thoughts; Crane and Wikforss, who say the patient simply has a different concept; and Fodor, who proposed a **narrow content** shared by twins, which Stalnaker and Block deny is content at all.

## Indian Theories of Word Meaning

Sanskrit thinkers argued over meaning long before Frege. Madhav Deshpande warns in the SEP that "the modern distinction of 'sense' versus 'reference' is somewhat blurred in the Sanskrit discussions": the key term *artha* has been translated "sense", "reference", "denotation" and more, none adequately. The central question was concrete: when a Vedic command says "cow", does the word mean this cow, or cowness?

**The grammarians.** Pāṇini, dated variously from the sixth or fifth to the fourth century BCE, already argued (*Aṣṭādhyāyī* 1.2.64, in Malcolm Keating's SEP account) that words cannot refer only to particulars: otherwise someone who tied up one cow for a sacrifice at a Vedic command would be in error tying up a different cow at a later ritual, since the command could mean only one animal. Patañjali's *Mahābhāṣya* (mid-second century BCE) reports Vyāḍi, for whom "cow" denotes individuals, against Vājapyāyana, for whom it denotes the generic form (*ākṛti*), cowness. Patañjali concluded that both belong to meaning; the question is which is understood first.

Was the word–meaning link made or given? Kātyāyana held it "established" by usage in the community of speakers; Patañjali read "established" as *eternal*, but only for Sanskrit. Patañjali is also the first known to use **sphoṭa**, for the fixed word as against uttered sounds (*dhvani*), answering Kātyāyana's puzzle: sounds perish as uttered, so no two coexist to form a word; the mind gathers their impressions into a word-image.

The boldest grammarian, Bhartṛhari (dates proposed range from about 400 to 540 CE), made language the ultimate principle (*śabdabrahman*) in his *Vākyapadīya*. The sentence, not the word, is the given unit; words, stems and affixes are abstractions, "imagined" for teaching, and the sentence and its meaning are an "undivided singularity" grasped in a flash (*pratibhā*).

```quote
Just as stems, affixes etc. are abstracted from a given word, so the abstraction of words from a sentence is justified.
Bhartṛhari · Vākyapadīya II.10, translated by Madhav Deshpande · c. 400–540 CE (dates disputed)
```

For the grammarians meaning is a "projection of intellect" (*bauddhārtha*), so "hare's horn" is meaningful though nothing answers to it, a "middle path", in Deshpande's phrase, between realism and the Buddhist view. (Its resemblance to Frege's sense without reference is this chapter's comparison.)

**Mīmāṃsā against Nyāya.** Mīmāṃsā, introduced in *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*, needed an authorless Veda. So it held that meanings are natural, not conventional; that words signify eternal universals; and that words themselves are eternal (utter "chair" ten times and you utter one word ten times). The primary meaning of "bull" is bull-ness, the individual being understood "secondarily and subsequently"; a rival view made the individual alone primary. Nyāya answered with a short argument:

1. Suppose the word–object relation were natural.
2. Then a word would carry its object's powers.
3. But saying *agni* ("fire") does not burn the mouth, nor does *asi* ("sword") cut it.
4. So the relation is a convention (*saṃketa*), established, Nyāya held, by God's will: "let this word refer to this thing".

For Nyāya, a word means "an individual object qualified by a generic property", both perceived together. Kumārila (roughly seventh century) defended Mīmāṃsā's realism: one perceives "being a cow", and by presumption (*arthāpatti*) universals must be posited as what words refer to. He rejected the sphoṭa, explaining word-understanding by memory of discrete phonemes.

**How do sentences mean?** Kumārila's school and Nyāya held *abhihitānvayavāda*: words first convey separate meanings, which are then connected; in Brough's (1953) gloss of Kumārila, "each word performs its task of expressing its meaning, and the sentence is the summation of these meanings". Many Western scholars call this compositional. Prabhākara (active sometime between the sixth and eighth centuries; perhaps Kumārila's student) held *anvitābhidhānavāda*: words convey meanings already connected in context. Its gloss is disputed. Daniel Arnold reads Prabhākara as holding that "complete sentences represent the basic unit of meaning"; Deshpande insists that for him "the sentence-meaning is not different from a simple addition of these inherently inter-connected word-meanings". Against Bhartṛhari's holism, Mīmāṃsā, Nyāya-Vaiśeṣika and later grammarians explained combination by mutual expectancy (*ākāṅkṣā*), compatibility (*yogyatā*) and contiguity (*āsatti*).

The traditions also mapped meanings beyond the primary: secondary (*lakṣaṇā*), as when "a cowherd colony on the Ganges" means on its bank; suggested (*vyañjanā*); and intended (*tātparya*). Navya-Nyāya named "the necessary and sufficient condition for a given word being used to refer to that entity", such as potness for "pot". Why did the schools differ? Deshpande answers that poets wanted to explain poetry, grammarians cognition, Nyāya a true picture of reality, Mīmāṃsā an authorless Veda, and Buddhists the ways language fails to portray reality.

## Dharmakīrti's Causal Theory

The Buddhist theory of *apoha*, "exclusion", is introduced in *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*. For Buddhists particulars are "ineffable", not objects of words. Tom Tillemans, in the SEP, contrasts Dignāga's (c. 480–c. 540) "top-down" version with a "bottom-up" one in Dharmakīrti (sixth or seventh century): "a causal chain from particular things to perceptions to thoughts and to the utterances of words—in short we have a type of causal theory of reference". Reference is fixed "at the time of [establishing] the linguistic convention" by dubbing a sample, "This is blue", "a purely causal event not dependent on any descriptive content"; later speakers rely on habit (*vāsanā*) as the convention passes "from speaker to speaker". Tillemans calls this "much like the two-fold process of reference-fixing and reference-borrowing" in modern causal theories.

The comparison can be pressed further, and here it is this chapter's own: because what is dubbed is a kind, blue, Dharmakīrti is closer to Putnam on kind terms than to Kripke on names, and he faces Kripke's hedgehog question of which causal links count. Tillemans flags his own open questions: what role remains for the double negation, and whether "having the same powers" reinstates a universal. Modern readers divide (Matilal and Herzberger read apoha top-down; Siderits distinguishes two negations; Hale finds it against compositionality), and Arnold contrasts Kumārila's "abstract objectivism" with Dharmakīrti's "individualistic subjectivism".

```checkpoint
q: What is the difference between Kumārila's and Prabhākara's accounts of sentence meaning?
a: Kumārila says sentences have no meaning; Prabhākara says they do.
x: Both are Mīmāṃsakas explaining how sentences mean; the dispute is over how words contribute.
a*: For Kumārila words first express separate meanings that are then summed; for Prabhākara words already convey meanings connected with one another.
a: Kumārila follows the sphoṭa theory; Prabhākara rejects it.
x: Kumārila explicitly rejected the sphoṭa, explaining understanding by memory of discrete phonemes.
a: Kumārila holds that word meanings are conventions; Prabhākara that they are eternal.
x: Mīmāṃsā held the word–meaning relation natural and eternal; it was Nyāya that called it a convention.
hint: Ask whether, on each view, a word ever conveys its meaning in isolation.
why: Kumārila's abhihitānvaya treats the sentence as a summation of word meanings. Prabhākara's anvitābhidhāna holds that words convey contextually inter-connected meanings; Arnold glosses this as making sentences basic, while Deshpande says the sentence meaning is still the sum of those connected word meanings.
---
q: Which feature of Dharmakīrti's apoha leads Tillemans to call it "a type of causal theory of reference"?
a: Words refer to eternal universals perceived directly.
x: That is Kumārila's realism, which the Buddhists rejected.
a: Every word abbreviates a cluster of descriptions.
x: Tillemans stresses that the dubbing is "not dependent on any descriptive content".
a: The meaning of a word is fixed by God's will.
x: That is the Nyāya account of convention.
a*: Reference is fixed by dubbing a sample ("This is blue") and then passed from speaker to speaker by habit.
hint: Look for two stages, one at the founding of a convention and one in later use.
why: Tillemans describes a causal chain from particulars to perceptions, thoughts and words, with reference fixed at the moment of convention and later preserved by habit, "much like" reference-fixing and reference-borrowing in modern causal theories.
```

## Names in Early China

*Logic across Traditions* and *Mozi, the Daoists and the Legalists: the Hundred Schools* cover the white-horse paradox; here the point is naming. The later Mohists' "primary interest", Marshall Willman notes in the SEP, "is with naming and reference". Their Canon A78 distinguishes unrestricted names ("thing"), classifying names ("horse") and private names ("Zang"), "confined to this object", which Lucas (2020) maps onto variables, predicates and individual constants. Mozi placed knowing in picking out referents: the blind can say what is white, but cannot sort white things from black, so "it's not by their naming, it's by their selecting".

Xunzi took the conventional side of the Mīmāṃsā–Nyāya quarrel: "Names have no inherent appropriateness. We designate them [by some word] in order to name them." The king fixes names, yet "you cannot make up reality"; the IEP calls this "a modified conventionalism", though Paul Goldin cautions that the chapter's "primary concern… is morality, not linguistics". Eternal words, divine convention, causal dubbing and royal decree: the traditions offered a wide range of answers to the question Kripke and Putnam reopened, of what makes a word mean what it does.

## Further exploration

- **Stephen Neale, *Descriptions* (1990).** The classic modern defence of Russell's theory of descriptions.
- **Saul A. Kripke, *Naming and Necessity* (1980; first printed 1972).** The Princeton lectures, with the 1980 Preface that answers the wide-scope reply.
- **Andrew Pessin and Sanford Goldberg (eds.), *The Twin Earth Chronicles: Twenty Years of Reflection on Hilary Putnam's "The Meaning of 'Meaning'"* (1996).** Twenty years of reflection on Putnam's paper and the externalism it launched.
- **Bimal Krishna Matilal, *The Word and the World: India's Contribution to the Study of Language* (1990).** A survey of Indian theories of language and meaning.
- **Jonardon Ganeri, *Semantic Powers: Meaning and the Means of Knowing in Classical Indian Philosophy* (1999).** How classical Indian thinkers tied the theory of meaning to the means of knowing.
- **Johannes Bronkhorst, *A Śabda Reader: Language in Classical Indian Thought* (2019).** A reader on language in classical Indian thought.
- **Mark Siderits, Tom Tillemans and Arindam Chakrabarti (eds.), *Apoha: Buddhist Nominalism and Human Cognition* (2011).** Essays on the Buddhist exclusion theory and its modern interpretations.$meaning_master$,
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
  select $meaning_quiz$[
    {"type": "mcq", "prompt": "In Kripke's 1977 reply to Donnellan, what does the case of Johnson raking leaves (mistaken for Jones) show?", "options": ["That names, like descriptions, are ambiguous between two meanings", "That speaker's reference can differ from semantic reference without any ambiguity in the words", "That Russell's theory fits only attributive uses", "That referential uses of descriptions are always false"], "answerIndex": 1, "explanation": "Saying \"Jones is really working up a sweat today\" says something about Jones but communicates something about Johnson, yet no one thinks \"Jones\" is ambiguous. Kripke concluded that referential uses of descriptions are speaker's reference, and that positing an ambiguity in \"the\" would be \"a kind of philosophical cheat\". The claim that Russell fits only attributive uses was Donnellan's.", "id": "q1"},
    {"type": "mcq", "prompt": "In Burge's arthritis case, what makes the patient's belief in the counterfactual community a different belief?", "options": ["A difference in his brain chemistry", "A difference in the chemical make-up of his environment, as with water on Twin Earth", "A difference in the linguistic practice of his community, which uses \"arthritis\" for ailments of the thigh too", "A difference in what he can introspect about his own pain"], "answerIndex": 2, "explanation": "The patient is the same; what differs is how his community uses \"arthritis\". Burge stresses linguistic practice rather than the natural environment, and, unlike Putnam, explicitly extends externalism to beliefs themselves.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the Nyāya argument against Mīmāṃsā's claim that the relation between a word and its object is natural?", "options": ["If it were natural, saying agni (\"fire\") would burn the mouth and saying asi (\"sword\") would cut it; so the relation is a convention", "If it were natural, vernacular languages would be as sacred as Sanskrit", "If it were natural, sounds would not perish as soon as they are uttered", "If it were natural, words could refer only to individuals and never to universals"], "answerIndex": 0, "explanation": "Nyāya concluded that the word–object relation is a convention (saṃketa), established by God's will. Mīmāṃsā, needing an authorless Veda, held the relation natural and eternal. The perishing of sounds is Kātyāyana's puzzle about how words exist at all.", "id": "q3"},
    {"type": "mcq", "prompt": "How did Patañjali settle the dispute between Vyāḍi and Vājapyāyana over what a word such as \"cow\" means?", "options": ["He sided with Vyāḍi: words denote only individuals", "He sided with Vājapyāyana: words denote only the generic form", "He held that words denote neither, only exclusions of other things", "He held that both individual and generic form belong to the meaning, the question being which is understood first"], "answerIndex": 3, "explanation": "Patañjali's Mahābhāṣya reports Vyāḍi (individuals) against Vājapyāyana (the generic form, ākṛti) and concludes that both belong to word-meaning. The exclusion view is the Buddhist apoha theory.", "id": "q4"},
    {"type": "open", "prompt": "Set out Kripke's modal argument against descriptivism about names, then explain the wide-scope reply, Kripke's counter, and the rigidified-description reply. Has descriptivism survived?", "rubric": "A strong answer gives the steps: suppose \"Socrates\" means \"the teacher of Plato and Xenophon\"; synonyms should be substitutable in modal contexts; \"the teacher of Plato and Xenophon might not have been human\" is true but \"Socrates might not have been human\" is false; so the name is rigid and the description not; so they differ in meaning. It defines a rigid designator. It explains the wide-scope reply (Dummett, later Sosa and Hunter): on the wide-scope reading the description sentence is true, and names gravitate to wide scope. It gives Kripke's counters from the 1980 Preface: sentences with no modal operator (\"Petrarch is never famous\" at a world where he dies as an infant) and deliberate narrow-scope placement. It explains rigidified descriptions (\"the actual F\") and the reply that the epistemic and semantic arguments still apply. Credit for mentioning later moves (Dummett and Stanley on assertoric content, Evans's \"Julius\", two-dimensional semantics) and for a reasoned verdict.", "id": "q5"},
    {"type": "open", "prompt": "Compare Dharmakīrti's account of how words refer, as Tillemans reads it, with the causal picture of Kripke and Putnam. Where does the parallel hold, and where might it break down?", "rubric": "A strong answer explains apoha and Tillemans's distinction between Dignāga's top-down and Dharmakīrti's bottom-up version: a causal chain from particulars to perceptions, thoughts and words; reference fixed at the time of convention by dubbing a sample (\"This is blue\"), not dependent on descriptive content; preserved from speaker to speaker by habit. It links this to reference-fixing and reference-borrowing in Kripke, and to Putnam's kind terms. It notes limits: Tillemans's open questions (the role of double negation; whether shared powers reinstate a universal), the Buddhist view that particulars are ineffable, and Kripke's point that not every causal connection suffices. Credit for marking which parts of the comparison are Tillemans's and for setting Dharmakīrti against Mīmāṃsā's eternal universals and Nyāya's divine convention.", "id": "q6"}
  ]$meaning_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/science-and-language/meaning-and-reference', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
