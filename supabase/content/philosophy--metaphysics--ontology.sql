-- What Exists? Ontology and Universals — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/ontology @ research/advanced/read.
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
    'philosophy/metaphysics/ontology',
    'research',
    'advanced',
    'read',
    $ontology_master$> **What is there, and how should we decide?** This chapter teaches the oldest question in metaphysics through its central case, the problem of universals: when an apple and a ruby are both red, is there one thing, redness, that they share? It sets out the one-over-many argument, Boethius's dilemma and the modern menu of realism, resemblance and tropes, then follows the quarrel to India, where Nyāya realists and Buddhist nominalists argued it with great precision. The second half turns to method: Quine's test of what a theory says exists, Carnap's doubt that the question is real, and the modern dispute over whether tables exist at all.

## What Is There?

Ontology, in the Stanford Encyclopedia of Philosophy's words, is "as etymology suggests, the study of being, of what there is". Besides concrete things ("people and puddles and protons"), are there abstract things, such as numbers? Besides particular things, are there properties shared by many of them? A second layer of questions, **meta-ontology**, asks how such disputes could be settled at all.

Neither of the subject's names is as old as the subject. Aristotle called his inquiry "first philosophy", "wisdom" or "the study of being qua being" (*qua* meaning roughly "in so far as"), but never "metaphysics". At least a century after his death an editor, "in all probability" Andronicus of Rhodes, titled the books *Ta meta ta phusika*, "the ones after the physical ones", meaning after the *Physics*. "Ontology" is younger still: its earliest known printed use is in Jacob Lorhard's *Ogdoas Scholastica* (1606), and Rudolph Goclenius's *Lexicon Philosophicum* (1613) defined it as "ontologia, philosophia de ente", the philosophy of being. The Greeks asked the question; the seventeenth century named it.

## One Over Many

Take a ripe apple and a ruby. They are two things in two places, yet both are red. The Internet Encyclopedia of Philosophy (IEP) states the realist's diagnosis: their common redness "results from sharing a universal", which "must be in two places at once". A **universal** is repeatable, able to be present in many things; a **particular**, such as this apple, is in one place at a time. The Stanford Encyclopedia traces the case for universals "at least to Socrates and Plato" and calls it the **one-over-many argument**:

1. Many distinct things are genuinely alike in colour, shape or weight, and we apply one general word, such as "red", to all of them, not arbitrarily.
2. This agreement needs an explanation in how the things are: in the IEP's words, "it is the world, and not our conventions, that make predications true or false."
3. The best explanation is that there is one thing, a property or universal, that each of them has.
4. So universals exist.

This is an inference to the best explanation, and, the Stanford Encyclopedia concedes, "not foolproof". Realists add that we reason as if properties were things: "this apple is red; this tomato is red; hence there is something that this apple is and this tomato also is".

**The objection.** W. V. O. Quine (1948) denied premise 2. Names and the variables of logic commit us to entities; a predicate such as "is red" commits us to nothing. That the apple is red needs no further thing to explain it. D. M. Armstrong (1978) mocked this as **ostrich nominalism**, "originally a pejorative jab"; Devitt (1980) answered by calling the realist's extra entity a mirage. A second objection appeals to parsimony: if resemblance can be explained without universals, we should do without them.

**The reply.** Every attempt to explain resemblance without universals, realists answer, either leaves it unexplained or quietly reintroduces a universal. The modern menu below tests that claim.

Realists themselves divide. **Transcendent** realists, following Plato, hold that universals exist even if nothing has them; **immanent** realists, following Aristotle "in opposition to his master", hold that they exist only in their instances. *Plato* sets out the Third Man regress, a name that comes from Aristotle, not Plato; the IEP notes that it threatens only the transcendent view, which is one reason to locate universals in things. Against all realists stand **conceptualists**, who place generality in concepts in minds, and **nominalists**, who accept only particulars and words.

## Boethius's Dilemma

Porphyry's *Isagoge*, an introduction to Aristotle's *Categories* written in Sicily around 268–270, declined to say whether genera and species "are real or are situated in bare thoughts alone" (see *Early Scholasticism: Anselm, Abelard and the Universities*). Boethius (c. 475/480–c. 524/526), commenting on it, turned the question into a dilemma. A universal must be common to many things wholly and at once, and must make up what each of them is. Gyula Klima reconstructs the argument:

1. A universal exists either in reality or only in the mind.
2. If in reality, it is either one being or many.
3. It cannot be one: one existence cannot be the many distinct existences of its particulars at once.
4. It cannot be many, such as each animal's own animality: those would need a further genus in common, and that a further one, to infinity.
5. So it exists only in the mind.
6. But a thought of a universal grasps things otherwise than they are, and "what is understood otherwise than the thing is is false". So all universal thought, geometry included, would be false.

**Boethius's reply** finds an ambiguity in step 6. To represent a thing *as being* otherwise than it is, is false; to represent it *in a different manner* from the way it exists is not, as a written sentence faithfully represents a spoken one. Universals exist in sensible things but are understood apart from them.

The medieval debate that followed belongs to the history chapters; a few corrections are worth carrying away. The phrase *flatus vocis*, "breath of the voice", is not Roscelin's own description of universals but Anselm's hostile one. Abelard, "the first great nominalist philosopher" in the Stanford Encyclopedia's words, held that a universal is a meaningful word (*sermo*). Avicenna's "horsehood itself is nothing but horsehood only", "neither many nor one" (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*), led Klima to compare one nature in many horses to one book in many copies, with no "universal book" besides the copies. And William of Ockham, as *Scotus, Ockham and the Late Medieval Debates* shows, did not use his razor against universals: he thought the realist theories of his day "outright incoherent", a stronger charge than "unnecessary". Nor did he write the familiar slogan: the formulation "entities are not to be multiplied without necessity" goes back to John Punch (1639). The sentiment survives as a working rule of ontology: other things being equal, prefer the theory with fewer kinds of thing.

```checkpoint
q: What does the one-over-many argument claim to explain?
a*: Why many distinct things genuinely agree in a respect, such as all being red.
a: Why some words, such as "Pegasus", seem to name nothing.
x: That is the puzzle of non-being, which Quine called Plato's beard, not the one-over-many argument.
a: Why a whole is more than the sum of its parts.
x: That is a question about composition; the one-over-many argument is about properties shared by many things.
a: Why one thing can change and remain the same thing.
x: That is the problem of persistence, treated in Identity, Change and Persons.
hint: The "many" are particular things; ask what the "one" is supposed to be.
why: The argument starts from genuine resemblance between distinct things and infers, as the best explanation, one universal that each of them has. Quine's objection, which Armstrong mocked as "ostrich" nominalism, denies that there is anything here to explain.
---
q: In Boethius's dilemma, how does Boethius answer the charge that a thought of a universal must be false?
a: He accepts that universal thoughts are false but useful.
x: Boethius's aim is to save universal knowledge, such as geometry, not to concede that it is false.
a: He argues that universals exist only as words.
x: That is closer to Roscelin's view; Boethius holds that universals exist in things.
a*: He distinguishes thinking a thing to be otherwise than it is (false) from thinking of it in a different manner from how it exists (not false).
a: He argues that universals are separate Forms outside space and time.
x: Boethius's answer locates universals in sensible things, not in a separate realm.
hint: Think of a written sentence representing a spoken one.
why: Boethius finds an ambiguity in "understood otherwise than the thing is". Universals exist in sensible things but are understood apart from them, which is a different manner of representing, not a false one.
```

## The Modern Menu: Resemblance and Tropes

Modern nominalists offer several ways to explain the apple's redness without a universal. **Predicate nominalism** says the apple is red because "is red" is truly said of it, and stops there; the IEP notes that this refusal earned it the "ostrich" label. **Class nominalism** says redness just is the class of red things. **Resemblance nominalism**, defended most fully by Gonzalo Rodriguez-Pereyra (2002), says red things are red because they resemble one another, and resemblance is a basic fact.

The IEP sets out three classic objections to simple versions of these views (the third goes back to Russell, 1912). First, **coextension**: if everything with a heart also has a kidney, the two classes coincide, and the theory must say that having a heart *is* having a kidney. Second, **imperfect community**: the ripe red apple also resembles an unripe green apple of the same variety, so a resemblance class lets in green things unless we specify resemblance "in the right way", that is, in colour, which assumes what was to be explained. Third, the **resemblance regress**: resemblance, holding between countless pairs, looks like a universal itself. Rodriguez-Pereyra defends the view against such objections; the argument continues.

**Trope theory** takes another route. A **trope** is a particular property-instance: not redness in general, but this apple's own redness, as unrepeatable as the apple. In Anna-Sofia Maurin's account, two objects "share" a shade of green when each has its own greenness trope and the tropes exactly resemble each other. "The father of the contemporary debate on tropes", she writes, was D. C. Williams (1953), for whom ordinary things are bundles of tropes and universals are classes of resembling tropes. Tropes suit causation: it is the stove's particular temperature that burns your hand. Aristotle may have anticipated them; scholars still dispute whether the "this pale" of his *Categories* is a trope or a shareable shade.

**The objection**: tropes must resemble too, and that resemblance is left unexplained; in the IEP's words, "the very relation we sought to understand reappears as our answer." Trope theorists hope to escape these objections, since each trope has only one nature: a heart trope and a kidney trope would be different tropes even if they always came together, and a redness trope resembles other rednesses, not green things. Whether that succeeds is debated. **Conceptualism**, by contrast, "teeters": what makes the concept "red" apply to some things and not others is either a brute fact or a shared feature. The IEP reports an emerging consensus that two genuine contenders remain, strong realism and trope nominalism, while another Stanford Encyclopedia entry calls nominalism "still a popular view".

The leading modern realist was Armstrong (1926–2014), whose story *Analytic Philosophy since 1950* leaves here. In *Universals and Scientific Realism* (1978) he defended universals that exist only when instantiated, and only if physics needs them; laws of nature are relations between universals. David Lewis sharpened a related distinction: **sparse** properties, in the Stanford Encyclopedia's phrase, "cut nature at its joints" and are discovered by science (negative charge, spin), while **abundant** properties answer to any predicate at all, even a gerrymandered one such as "negatively charged or disliked by Socrates". Not every predicate names a real property. Indian philosophers had reached that conclusion centuries earlier.

## Universals in India: Nyāya and the Buddhists

Nyāya–Vaiśeṣika (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*) built its ontology on categories, *padārtha*, "thing denoted by a word": substance, quality, action, universal (*sāmānya* or *jāti*), individuator (*viśeṣa*) and inherence (*samavāya*), with absence added later. The arrangement surprises a modern reader. Qualities are tropes: in Matthew Dasti's account, "unlike universals they are not repeatable", so the red of a fire hydrant is its own. Yet the universal redness also exists, inhering in that particular red. Western debates usually treat tropes and universals as rivals; Nyāya kept both. Universals, it argued, explain recurring experience, language and causal regularity.

Nyāya was not profligate. Udayana (c. 975–1050) listed six "impediments" that reduce a candidate universal to an *upādhi*, a merely imposed property. A universal must have more than one instance; two candidates with exactly the same instances are one; two that cross-cut, sharing some instances while neither falls under the other, are not genuine (the most controversial rule, pointing towards natural kinds); none may generate an infinite regress, so there is no "universal-hood"; and there are none for individuators or for inherence. The tests anticipate the sparse–abundant distinction. Inherence invited the regress the West knows as Bradley's (what relates inherence to the things it relates?), which Śaṅkara pressed; Nyāya replied that inherence is "self-linking".

The fiercest critics were Buddhist. Dharmakīrti (sixth or seventh century) mocked a universal that "does not go" to new instances yet appears in each: "Oh my! It's just one disaster after another." His core argument, as Tom Tillemans sets it out, is a dilemma of one and many:

1. If a universal is really present in several particulars, it shares their natures.
2. Those natures are many and different.
3. So the universal would itself be many, not one.
4. If instead it stays one, as a "radically separate entity", it is not really the nature of the things, and we could not say they have the same property.
5. The link Nyāya offers, inherence, is "an occult entity, posited ad hoc and without any discernible effects".
6. What is real has causal powers; universals have none. So universals are not real.

A later Buddhist put it with a hand:

```quote
One can clearly see five fingers in one's own hand. One who commits himself to a sixth general entity fingerhood, side by side with the five fingers, might as well postulate horns on top of his head.
Paṇḍit Aśoka · Sāmānyadūṣaṇa (trans. Chakrabarti and Siderits) · translation 2011
```

**The Nyāya reply**: universals are perceived, through their inherence in what we see; language and causal law need them; inherence links itself without regress; and Udayana's rules show that universals are not posited for every predicate. Tillemans adds that realists "will predictably maintain that they are untouched because universals are not the kind of things that need to be in one place at one time", the answer Western realists give to the charge of strangeness.

In place of universals the Buddhists put **apoha** ("exclusion"), begun by Dignāga (c. 480–c. 540): a word picks out blue things as "non-non-blue". *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* sets out the circularity objection of Kumārila and Uddyotakara and Dharmakīrti's reply. Dharmakīrti also grounded apoha in causes: different blue things cause the same judgement in us, with no shared entity. Tillemans sees here a forerunner of modern causal theories of reference associated with Kripke and Putnam: a striking resemblance, not a claim of influence.

## China: Names Without Universals

Gongsun Long's "a white horse is not a horse" was once read as a thesis about universals. In Chris Fraser's account there is now "a fairly broad consensus", at least among European and American scholars, that it "is unlikely to concern universals, since no ancient Chinese philosopher held a realist doctrine of universals" (see *Mozi, the Daoists and the Legalists: the Hundred Schools* and *Logic across Traditions*). The later Mohists did theorise about "kind" names, such as "horse", which extend to all relevantly similar things. Fraser judges the realism-versus-nominalism taxonomy "unhelpful" here: the live question was whether the world fixes which things are alike, as the Mohists leaned, or convention does, as Xunzi held.

## Numbers and Other Abstract Objects

The quarrel extends to **abstract objects**, usually said to lack location and causal powers; numbers and pure sets are the paradigms, if they exist. The distinction is not ancient: Plato's Forms were "causes par excellence", whereas abstract objects are supposed to be causally inert. The case for them begins from truths such as "seven is a prime number" and from the Quine–Putnam argument that science cannot do without mathematics. The main case against is Benacerraf's challenge, set out in *Reason, Experience and Innate Ideas*: if numbers are causally cut off from us, how could we know about them? Hartry Field's *Science without Numbers* (1980) tried to show that physics could dispense with them.

## To Be Is to Be the Value of a Variable

How should such disputes be settled? Quine's "On What There Is" (1948) put the ontological question in three monosyllables, "What is there?", and offered a test, quoted in *Analytic Philosophy since 1950*: a theory is committed to "those and only those entities to which the bound variables of the theory must be capable of referring in order that the affirmations made in the theory be true". In slogan form, to be is to be the value of a variable. Rewrite a theory in logical notation, where "there is something such that…" makes every existence claim explicit, and see what it needs. A theory escapes commitment to a doubtful entity by finding an acceptable **paraphrase** without it. Phillip Bricker's Stanford Encyclopedia entry calls the criterion "the orthodox view".

Quine tested it on an old puzzle:

1. "Pegasus does not exist" is true, so it is meaningful.
2. If it is meaningful, the name "Pegasus" is meaningful.
3. A meaningful name names something.
4. If "Pegasus" names something, then "Pegasus does not exist" is false.
5. So if it is true, it is false.

```quote
This is the old Platonic riddle of nonbeing. Nonbeing must in some sense be, otherwise what is it that there is not? This tangled doctrine might be nicknamed Plato's beard; historically it has proved tough, frequently dulling the edge of Occam's razor.
W. V. O. Quine · On What There Is · 1948
```

Quine's character McX says Pegasus is an idea in the mind, an answer Quine rejected. Wyman, "the fictional Meinongian", says Pegasus has being as an unactualised possible. Quine asked whether "the possible fat man in that doorway" and "the possible bald man in that doorway" are one possible man or two; possibles cannot be counted, so they lack clear identity. Quine's own answer used Russell's theory of descriptions: treat "Pegasus" as shorthand for a description, such as "the winged horse captured by Bellerophon", and paraphrase the sentence as "it is not the case that exactly one thing is a winged horse captured by Bellerophon". The name disappears, so step 3 never applies.

**The objections**: Meinongians such as Parsons (1980) and Zalta (1983) deny that "there is" must mean "exists"; Priest (2005) instead reads the quantifier as a neutral "for some" that carries no existential commitment. The test is hostage to translation, since different paraphrases yield different commitments. And Sider (2011) argues that a theory's basic predicates matter as much as what its variables range over. **The reply** on Quine's behalf is that the criterion only says what a theory claims exists; which theory to believe is a separate question, answered by accepting the best overall theory and whatever it needs.

Applied by Quine himself, that method did not yield a bare nominalism. Properties could go, for want of clear conditions of identity ("no entity without identity"). But mathematics needs **sets**, and science needs mathematics, so Quine accepted sets: a nominalist about properties, a realist about at least one kind of abstract object.

## Is the Question Even Real? Carnap and His Heirs

Rudolf Carnap's "Empiricism, Semantics, and Ontology" (1950) challenged the enterprise (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*). **Internal** questions are asked within a framework, a language with rules for talking about some kind of thing, and are often trivial: within the framework of numbers, "is there a prime number greater than a hundred?" has the answer yes. **External** questions, whether numbers exist *at all*, have taken literally "no cognitive significance"; read charitably, they ask whether to adopt a way of speaking. Carnap urged tolerance: "To decree dogmatic prohibitions of certain linguistic forms instead of testing them by their success or failure in practical use, is worse than futile; it is positively harmful because it may obstruct scientific progress."

**Quine's objection** was that the distinction rests on the line between truths true by meaning (analytic) and truths true by fact, which he rejected. For years Quine was thought to have won. **The reply**, since a Carnap revival in the 1980s and 1990s, is that the distinction may not need analyticity at all (Yablo; Amie Thomasson). Thomasson's **easy ontology** (*Ontology Made Easy*, 2015) holds that existence questions are answered easily, by evidence or by the rules for using our words. To illustrate: from "the number of chairs is five" one may infer that there is a number, so whether numbers exist was never a deep question. Jonathan Schaffer, by contrast, keeps ontology deep by changing its question: he writes that "metaphysics as I understand it is about what grounds what": composite objects, abstract objects and even fictional characters exist, and the real issue is which things are fundamental.

```checkpoint
q: According to Quine's criterion, what is a theory committed to?
a: Everything its predicates, such as "is red", are true of, including properties like redness.
x: Quine held that predicates carry no ontological commitment; that is why the criterion suited nominalism about properties.
a*: The entities its bound variables must be able to refer to for its statements to be true.
a: Whatever its users can imagine.
x: Imagination plays no part; the test looks at the logical form of what the theory asserts.
a: Only the entities that can be perceived by the senses.
x: Quine accepted sets, which cannot be perceived, because mathematics needs them.
hint: Rewrite the theory in logic and look at the "there is something such that…" clauses.
why: "To be is to be the value of a variable": a theory is committed to what must lie in the range of its quantified variables for it to come out true.
---
q: How did Quine dissolve the puzzle of "Pegasus does not exist"?
a: By granting that Pegasus is an idea in the mind.
x: That is McX's answer, which Quine rejected.
a: By granting that Pegasus is an unactualised possible.
x: That is Wyman's answer, which Quine rejected because possibles have no clear identity.
a: By declaring the sentence meaningless.
x: Quine accepted that the sentence is true and so meaningful; he showed how it could be true without naming anything.
a*: By paraphrasing the name as a description, so that the sentence denies that anything fits it.
hint: Russell's theory of descriptions makes the name disappear.
why: Paraphrased as "it is not the case that exactly one thing is a winged horse captured by Bellerophon", the sentence contains no name for Pegasus, so it need not refer to anything to be true.
```

## Are There Tables?

The newest form of the question concerns ordinary objects. Peter van Inwagen, in *Material Beings* (1990), posed the **special composition question**: under what conditions do some things make up a further thing? **Nihilists** answer never: there are really no tables, only simples arranged tablewise. **Universalists**, such as Lewis and Sider, answer always, so there is an object made of a trout and a turkey. Van Inwagen's **organicism** says composition happens only when the parts' activity "constitutes a life": there are particles and organisms, but only simples "arranged tablewise". (*Identity, Change and Persons* shows how such views dissolve the statue and the clay.)

Why take the extremes seriously? Lewis's argument from vagueness runs:

1. If composition is restricted, it must follow some intuitive rule, such as contact, bonding or life.
2. Any such rule is vague: small steps lead from clear cases of composition to clear cases of none.
3. But whether something exists cannot be vague; existence does not come in degrees.
4. So any sharp cut-off would be arbitrary.
5. So composition is either unrestricted (universalism) or never happens (nihilism).

**The objection** is that universalism is wildly counter-intuitive, and critics, Merricks among them, contest the argument's steps. **The reply** is that our discomfort with trout-turkeys reflects "psychological biases" with no bearing on the structure of the world. Merricks (2001) argued by another route that there are no inanimate composites such as baseballs, though he accepts persons: when a baseball shatters a window, its atoms arranged baseballwise suffice to cause it, so a baseball would be a redundant second cause. Thomasson replies that this is not genuine overdetermination: atoms arranged baseballwise guarantee a baseball, so the baseball is no second, competing cause.

Nihilism is not a modern eccentricity. Achille Varzi traces it to "Greek atomism and early Buddhist nominalism": the chariot argument in *The Buddha and Early Buddhist Philosophy* treats a chariot as a name for arranged parts, and Vasubandhu's argument against atoms with sides is in *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*. Nyāya held the opposite: a whole is a new thing inhering in its parts, which is why, in Dasti's example, "your touching just one part of my car is enough to justify the claim 'you touched my car'". Islamic theology produced its own austere picture: kalām thinkers, from the Muʿtazila onwards, held that bodies are partless atoms differentiated by accidents, and most later theologians reserved all agency to God (see *Al-Ghazālī, Averroes and the Quarrel over Reason*). Their motive was theology, not parsimony. The question "what is there?" has been asked for very different reasons, and answered, again and again, with "less than you think".

## Further exploration

- **D. M. Armstrong, *Universals: An Opinionated Introduction* (1989).** The classic short survey by the leading modern realist.
- **Paul Vincent Spade (trans.), *Five Texts on the Mediaeval Problem of Universals* (1994).** The key medieval texts on universals in translation.
- **Mark Siderits, Tom Tillemans and Arindam Chakrabarti (eds.), *Apoha: Buddhist Nominalism and Human Cognition* (2011).** The Buddhist theory of exclusion debated by Indian and modern philosophers and cognitive scientists.
- **Michael J. Loux and Thomas M. Crisp, *Metaphysics: A Contemporary Introduction* (4th edn, 2017).** A textbook that opens with the problem of universals.
- **David J. Chalmers, David Manley and Ryan Wasserman (eds.), *Metametaphysics: New Essays on the Foundations of Ontology* (2009).** The debate over whether ontological questions are deep, trivial or confused.
- **Amie L. Thomasson, *Ontology Made Easy* (2015).** The Carnapian case that existence questions are easier than they look.
- **Peter van Inwagen, *Material Beings* (1990).** The special composition question and the case that there are no tables.$ontology_master$,
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
  select $ontology_quiz$[
    {"type": "mcq", "prompt": "Where does the word \"ontology\" first appear in print, as far as is known?", "options": ["In Jacob Lorhard's Ogdoas Scholastica (1606)", "In Aristotle's Metaphysics", "In Andronicus of Rhodes's edition of Aristotle", "In Quine's \"On What There Is\" (1948)"], "answerIndex": 0, "explanation": "The word is early modern: its earliest known printed use is in Lorhard's Ogdoas Scholastica (1606), followed by Goclenius's Lexicon Philosophicum (1613). Aristotle used neither \"ontology\" nor \"metaphysics\"; the latter is an editor's title.", "id": "q1"},
    {"type": "mcq", "prompt": "What is unusual about the Nyāya–Vaiśeṣika account of a red fire hydrant, compared with most modern Western debates?", "options": ["It denies that the hydrant has any colour at all.", "It treats redness as a mere word imposed by convention.", "It holds both that the hydrant's red is an unrepeatable trope and that the universal redness inheres in that trope.", "It holds that the hydrant is identical with its atoms."], "answerIndex": 2, "explanation": "Nyāya–Vaiśeṣika treats qualities as unrepeatable tropes and also accepts universals inhering in them, combining two views that modern Western debates usually treat as rivals.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Carnap mean by an \"external\" question such as \"Do numbers exist at all?\"", "options": ["A question settled by observing the external world.", "A question asked within set theory, with the trivial answer yes.", "A question that only theologians can answer.", "A question that, taken literally, lacks cognitive significance, but can be read as a practical choice of whether to adopt a way of speaking."], "answerIndex": 3, "explanation": "Internal questions are asked within a framework and are often trivial; external questions about whether things exist 'period' have, taken literally, no cognitive significance, and read charitably are practical questions about which framework to adopt.", "id": "q3"},
    {"type": "mcq", "prompt": "Which answer to van Inwagen's special composition question holds that composition never occurs, so that strictly there are no tables?", "options": ["Universalism", "Nihilism", "Organicism", "Immanent realism"], "answerIndex": 1, "explanation": "Nihilism says there are only partless simples arranged in various ways. Universalism says any things compose something; van Inwagen's organicism says composition occurs only when the parts' activity constitutes a life.", "id": "q4"},
    {"type": "open", "prompt": "Set out Dharmakīrti's one-many argument against universals, and explain how a Nyāya realist would reply.", "rubric": "A strong answer states that a universal really present in many particulars would share their many different natures and so be many, while a universal that stays one as a separate entity would not be the things' nature; notes that inherence is dismissed as an ad hoc 'occult entity' and that, for Dharmakīrti, the real is what has causal powers, which universals lack. For the reply it mentions that Nyāya holds universals are perceived through inherence, are needed for language and causal regularity, that inherence is self-linking (no regress), that Udayana's tests show universals are not posited for every predicate, and/or that universals are not the kind of thing that must be in one place at one time.", "id": "q5"},
    {"type": "open", "prompt": "Explain the problem of the Pegasus sentence (\"Pegasus does not exist\") and how Quine used it to illustrate his criterion of ontological commitment. Give one objection to his approach.", "rubric": "A strong answer sets out the puzzle (if the true sentence is meaningful, its name must name something, so the sentence would be false); rejects the answers that Pegasus is an idea (McX) or an unactualised possible (Wyman); explains Quine's paraphrase using Russell's theory of descriptions, so that the name disappears and only bound variables carry commitment ('to be is to be the value of a variable'). Objections may include the Meinongian denial that 'there is' means 'exists' (Parsons, Zalta) or Priest's neutral reading of the quantifier, the dependence of commitments on disputed paraphrases, or Sider's point about ideology.", "id": "q6"}
  ]$ontology_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/ontology', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
