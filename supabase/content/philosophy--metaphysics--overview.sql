-- Reality (Metaphysics) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/metaphysics @ research/advanced/read.
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
    'philosophy/metaphysics',
    'research',
    'advanced',
    'read',
    $metaov_master$> **Metaphysics asks the most general questions about what there is and what it is like.** This overview shows how the section's eight chapters fit together: what exists; how things last through change; what connects one event to another; what time is; whether we act freely; what could have been otherwise; and whether there is a God, and why there is evil. It then follows four questions through them: is metaphysics about the world or about our words; should a theory posit fewer things or explain more; how could we know what is possible; and how did Indian, Chinese and Islamic thinkers frame the same problems?

## What Metaphysics Asks

Neither of the subject's names is as old as the subject, *What Exists? Ontology and Universals* points out. Aristotle called his inquiry "first philosophy", "wisdom" or "the study of being qua being", but never "metaphysics". At least a century after his death an editor, "in all probability" Andronicus of Rhodes, titled the books *Ta meta ta phusika*, "the ones after the physical ones", meaning after the *Physics*. "Ontology" is younger still: its earliest known printed use is in Jacob Lorhard's *Ogdoas Scholastica* (1606). Ontology, in the Stanford Encyclopedia of Philosophy's words, is "the study of being, of what there is", and a second layer of questions, **meta-ontology**, asks how such disputes could be settled at all.

On this overview's reading, the chapters move from what there is to how it persists, what connects it (causation) and time; then to ourselves as agents who may or may not be free; then from what is to what could have been; and last to God, and to the oldest argument against God, from evil.

## What There Is

*What Exists? Ontology and Universals* teaches the oldest question through its central case: when an apple and a ruby are both red, is there one thing, redness, that they share? The **one-over-many argument** infers, as the best explanation of genuine resemblance, a **universal**, a repeatable property each thing has; the Stanford Encyclopedia concedes that the inference is "not foolproof". Quine denied that there is anything to explain, since a predicate such as "is red" commits us to nothing, and **tropes**, particular property-instances such as this apple's own redness, offer another route. The Internet Encyclopedia of Philosophy reports an emerging consensus that two genuine contenders remain, strong realism and trope nominalism, while another Stanford Encyclopedia entry calls nominalism "still a popular view".

Nyāya–Vaiśeṣika, unlike most Western debates, kept both tropes and universals, while the Buddhist Dharmakīrti argued that a universal present in many things would itself be many. The chapter's second half turns to method: Quine's test of what a theory says exists, Carnap's doubt that the question is real (below), and van Inwagen's question of when some things make up a further thing, to which **nihilists** answer never: there are no tables, only simples arranged tablewise.

## How Things Persist

*Identity, Change and Persons* asks how a thing can change and still be the same thing. **Numerical identity**, as Harold Noonan and Ben Curtis put it, "can only hold between a thing and itself", and it is transitive, which most of the chapter's puzzles strain. Hobbes gave the Ship of Theseus its modern form by adding a second ship rebuilt from the old planks: in Ryan Wasserman's words, the ship "survives twice over". A statue and its clay differ in what could happen to them, which seems to put two objects in one place; the **constitution view**, that "constitution is not identity", is what Michael Burke called "the standard account".

{{image: Ise Shrine | The Ise Grand Shrine in Japan is rebuilt every twenty years with new wood. Is it the same shrine?}}

A thing **perdures** if it has different **temporal parts** at different times, and **endures** if it is wholly present at each time; Lewis argued for temporal parts from the puzzle of how one plate can be round and then square. Vasubandhu argued that, since destruction cannot have a cause, things perish as soon as they arise. The chapter ends with persons, from Reid's brave officer to Parfit's view that identity is not what matters, debates that continue in *Self and No-Self: Personal Identity East and West*.

## What Connects Them

*Causation* asks what it is for one thing to make another happen. Aristotle gave four irreducible kinds of answer; modern theories, the chapter notes, are broadly theories of the efficient cause alone. Avicenna held that an efficient cause necessitates its effect, and al-Ghazālī denied that the connection is necessary. Malebranche held that only God is a true cause, and the occasionalists' argument that no necessary connection can be found between worldly events was later taken up by Hume.

Hume's first definition of a cause, in the *Enquiry*, is really two: one by regularity, and one, "in other words", by what would have happened had the first object not been. Each became the seed of a modern theory. J. L. Mackie's **INUS condition** refined the regularity view; David Lewis built the counterfactual one, for which **pre-emption**, a back-up cause that would have done the job, has proved "the biggest bugbear". Indian philosophers asked a different question: whether the pot already exists, latent, in the clay (Sāṃkhya's **satkāryavāda**) or is a new production (Nyāya's **asatkāryavāda**). The chapter ends with the suggestion that "cause" names more than one thing, and notes that Aristotle would not have been surprised.

## Time

*Time* starts from Augustine, in E. B. Pusey's translation: "What then is time? If no one asks me, I know: if I wish to explain it to one that asketh, I know not". J. M. E. McTaggart argued in 1908 that time is unreal. He distinguished the **A series**, from past through present to future, from the **B series**, from earlier to later. Kris McDaniel reconstructs the argument:

1. Time is real only if real change occurs.
2. Real change occurs only if the A series exists.
3. The A series does not exist.
4. So time is not real.

**B-theorists** deny premise 2: change is just a thing's having different properties at different times. **A-theorists** such as C. D. Broad and A. N. Prior reject premise 3. A second question cuts across the first: **presentism** says only present things exist, **eternalism** that past and future things exist too, and the **growing block** that the past and present exist but not the future. Rietdijk and Putnam turned relativity, on which simultaneity depends on the observer's frame, against presentism.

```checkpoint
q: In McTaggart's argument that time is unreal, which premise do B-theorists such as Mellor and Smart deny?
a*: That real change requires the A series: for them change is just a thing's having different properties at different times.
a: That the A series does not exist.
x: B-theorists accept the case against the A series; it is A-theorists such as Broad and Prior who reject this premise.
a: That time is real only if real change occurs.
x: Neither school's reply, as the Time chapter presents it, targets this premise.
a: None: they accept McTaggart's conclusion that time is unreal.
x: B-theorists keep time, as the B series of earlier and later; only McTaggart concluded that time is unreal.
hint: McTaggart thought B-facts never change, so the B series alone could give no real change.
why: B-theorists accept that there is no A series but deny premise 2, so time survives as the B series. A-theorists reject premise 3, saying McTaggart misread tensed talk.
---
q: Hume's first definition of a cause, in the Enquiry, has two sentences. What became of them, according to the Causation chapter?
a: Hume developed both at length, and they became a single modern theory.
x: Hume never explored the second sentence, and the two seeded different theories.
a: The first became the interventionist theory and the second the process theory.
x: Interventionism builds on probabilities and manipulation, and process theories look to physics; neither grew from these sentences.
a*: The first, a regularity definition, and the second, a counterfactual one, each became the seed of a modern theory.
a: Both were rejected as soon as Kant replied to Hume.
x: Mackie's regularity account and Lewis's counterfactual theory are twentieth-century developments of the two sentences.
hint: "Or, in other words, where, if the first object had not been…"
why: The first sentence defines a cause by regularity, the second by what would have happened without it. Menzies and Beebee find it hard to see how Hume could have confused them; Mackie developed the first and Lewis the second.
```

## Freedom

*Free Will and Determinism* asks whether we could have done otherwise, and whether it matters. **Compatibilists** hold that free will is possible even if determinism is true; **incompatibilists** deny it, some as **hard determinists**, some as **libertarians**. Determinism is not fate: fatalism, in Carl Hoefer's definition, says events are "destined to occur no matter what we do", while under determinism, the chapter points out, what you do still makes a difference to what follows. Whether determinism is true is an empirical question; Randolph Clarke, Justin Capes and Philip Swenson suggest that "there is currently no good evidence that determinism is true".

The chapter traces fate and foreknowledge through Greek, Indian, Chinese and Islamic debates, then works through the Consequence Argument of Carl Ginet and Peter van Inwagen, Frankfurt's cases, Strawson's reactive attitudes, the luck objection to libertarian freedom and the sceptics. Of the readiness potential that Libet's experiments found before conscious intention, the Stanford Encyclopedia reports that neuroscientists remain "uncertain what it signifies".

## What Could Have Been

*Possibility and Necessity* begins by sorting kinds of "cannot". Something is **metaphysically possible** if it is true in at least one **possible world**, a complete way things could have been, and **necessary** if true in all. On Simo Knuuttila's account, no ancient model treated possibilities as alternatives existing at the same moment as what actually happens; that idea entered Latin thought in the early twelfth century, and Ashʿarite theologians, in Frank Griffel's account, developed an understanding "closer to our modern view".

The modern debate began with Quine's suspicion of necessity and Ruth Barcan Marcus's quantified modal logic. Lewis held that other possible worlds are as concrete as ours, conceding that the view "does disagree, to an extreme extent, with firm common sense opinion about what there is". Most rivals treat worlds as abstract. Kripke argued that names are **rigid**, picking out the same object in every world where it exists, and revived **essentialism**; Kit Fine argued that essence is not a modal notion, since Socrates, if he exists, necessarily belongs to the set {Socrates}, yet that is no part of what he is.

## God and Evil

*God: Arguments For and Against* asks three questions: is there a sound proof, is there good evidence, and is evidence even required? It gives each classic argument its strongest modern form, best objection and reply. Against Plantinga's modal ontological argument, critics object that "possibly God does not exist" seems as well supported as "possibly God exists"; cosmological arguments run from contingency (Avicenna, Leibniz) or, in the kalām form, from the universe's beginning; fine-tuning meets observation selection and the multiverse; and Nyāya's arguments meet Buddhist, Mīmāṃsā and Jain critics. The chapter argues for no verdict.

*The Problem of Evil* starts from the trilemma credited to Epicurus, though no text of Epicurus contains it:

```quote
Epicurus's old questions are yet unanswered. Is he willing to prevent evil, but not able? then is he impotent. Is he able, but not willing? then is he malevolent. Is he both able and willing? whence then is evil?
Philo, in David Hume · Dialogues concerning Natural Religion, Part X · 1779
```

The **logical problem** claims that God and evil are inconsistent; the **evidential problem**, that evil makes God improbable. Most philosophers on both sides, the chapter reports, accept that Plantinga's Free Will Defence answered Mackie's logical argument, though some dissent. The evidential problem, the chapter concludes, is alive: Rowe's fawn, sceptical theism, Draper's probabilities and Hick's soul-making are all still argued over, and Marilyn McCord Adams and the protest theologians demand an answer a victim could hear. The chapter takes no side.

## Four Questions That Run Through the Section

### The world or our words?

Rudolf Carnap's "Empiricism, Semantics, and Ontology" (1950) distinguished **internal** questions, asked within a framework (is there a prime number greater than a hundred?), from **external** ones, whether numbers exist at all, which taken literally have "no cognitive significance". Quine objected that the distinction rests on the line between analytic and synthetic truths, which he rejected, and for years Quine was thought to have won. Since a Carnap revival in the 1980s and 1990s, some (Yablo; Thomasson) reply that the distinction may not need analyticity at all, and Amie Thomasson's **easy ontology** holds that existence questions are answered easily, by evidence or by the rules for using our words, while Jonathan Schaffer keeps ontology deep by asking instead what grounds what.

On this overview's reading, other chapters meet the same question. In *Identity, Change and Persons*, **deflationists** (Carnap, Putnam, Hirsch) say that all the facts about the planks are agreed, and the dispute over the Ship of Theseus is only over the word "ship"; some, Hawley reports, doubt that the quarrel between endurance and perdurance is substantive at all. In *Possibility and Necessity*, al-Ghazālī treats modalities as judgements of the mind, not features of reality, and Gideon Rosen's **modal fictionalism** reads talk of worlds as talk within a story. The chapter ends by asking whether the possible is a feature of the world, of our minds, or of the stories we tell. Hume's account in *Causation*, on which necessity is an expectation the mind projects onto things, raises the same question about causes.

### Fewer things or more explanation?

Ockham did not write the familiar slogan against multiplying entities, *What Exists? Ontology and Universals* notes, but the sentiment survives as a working rule: other things being equal, prefer the theory with fewer kinds of thing. The section shows, on this overview's reading, how much "other things being equal" carries. Quine, a nominalist about properties, accepted sets because science needs mathematics, and Lewis accepted concrete possible worlds because "The theoretical benefits are worth it". Dharmakīrti, as Tom Tillemans sets out his argument, dismissed Nyāya's inherence as "an occult entity, posited ad hoc", yet Nyāya was not profligate: Udayana listed six "impediments" that disqualify a candidate universal. And in *Time*, Mellor and Smart's new tenseless theory says tensed facts are not needed.

### How could we know what is possible?

*Possibility and Necessity* quotes Hume's "establish'd maxim" that "nothing we imagine is absolutely impossible". This overview notes that conceivability does heavy work across the section: in *Causation*, al-Ghazālī's case that fire touching cotton without burning it is conceivable; in the zombie argument against physicalism, the premise that zombies are conceivable. The standard objection is that conceivability concerns what we know, and possibility how things are: one could once conceive Hesperus existing without Phosphorus. Others ground modal knowledge elsewhere: Timothy Williamson in our ordinary handling of counterfactuals, Barbara Vetter, in the SEP's paraphrase, in literally seeing potentialities.

This overview adds that the same question carries weight in the chapters on God and evil. The modal ontological argument rests on a premise of possibility that, its critics say, is no better supported than its rival, and Plantinga's Free Will Defence needs only that transworld depravity be possible, which Pruss and others dispute.

### How the traditions framed it

The chapters show the same problems framed in other terms. **Momentariness**: Vasubandhu made persistence a stream of momentary replacements, while al-Ashʿarī held, on Perler and Rudolph's account, that God "rearranges the atoms that make up this world anew at every instant"; *Identity, Change and Persons* compares the two, with causal streams in one case and continual creation in the other. **Wholes**: the Buddhist chariot argument treats a chariot as nothing over and above its arranged parts; Nyāya held that a whole is a new thing inhering in its parts; kalām thinkers held that bodies are partless atoms. **Causation** was for classical Indian philosophers typically "the origin of a thing", not a relation between events. **Occasionalism**, the view that God is the only true cause, was embraced by theologians after al-Ashʿarī and returned in Europe with Malebranche; whether al-Ghazālī was an occasionalist is debated in *Al-Ghazālī, Averroes and the Quarrel over Reason*.

Some frames did not translate. Chris Fraser reports "a fairly broad consensus", at least among European and American scholars, that "a white horse is not a horse" is unlikely to concern universals, "since no ancient Chinese philosopher held a realist doctrine of universals", and the Mohist word *bì*, "necessary, must", he notes, "does not appear to distinguish" logical necessity from causal necessity, epistemic certainty or obligation. Tillemans also warns against finding possible worlds in Dharmakīrti, though others translate his terms as "necessity". And for medieval Muslim thinkers, the evil chapter reports, "the existence of God was never in question": the questions were what evil is, whether ours is the best possible world, and whether God's justice or his omnipotence comes first. In India most classical schools posit no all-good creator and explain suffering by karma, and where Vedānta affirmed a Lord the problem returned.

```checkpoint
q: What did Carnap mean by calling "Do numbers exist at all?" an external question?
a: A question settled by observing the external world.
x: External questions are not settled by observation; taken literally, Carnap held, they lack cognitive significance.
a*: A question that, taken literally, has no cognitive significance, but can be read as a practical choice of whether to adopt a way of speaking.
a: A question asked within the framework of numbers, with the trivial answer yes.
x: That describes an internal question, such as whether there is a prime number greater than a hundred.
a: A question that only physics could answer.
x: Carnap's point was that the question is not a factual one at all, read literally.
hint: Carnap urged tolerance about which frameworks to adopt.
why: Internal questions are asked within a framework and are often trivial; external ones, read charitably, ask whether to adopt the framework. Quine objected that the distinction rests on the analytic–synthetic line, and easy ontology revives Carnap's approach.
---
q: What do Vasubandhu's momentariness and the view the Identity chapter attributes to al-Ashʿarī have in common?
a: Both say that a lasting self underlies change.
x: Vasubandhu denied a lasting self; it was Nyāya that argued recollection proves one.
a: Both deny that anything exists at the present moment.
x: Neither denies that things exist now; both make what exists last only a moment.
a: Both hold that a whole is a new thing inhering in its parts.
x: That is the Nyāya view of wholes, which the Buddhists rejected.
a*: Both make persistence a series of momentary existences, explained by causal streams in one case and God's continual creation in the other.
hint: What explains the apparent continuity in each case?
why: For Vasubandhu things perish as soon as they arise and apparent persistence is a stream of replacements; on Perler and Rudolph's account al-Ashʿarī held that God rearranges the atoms of the world anew at every instant.
```

## The Chapters

- *What Exists? Ontology and Universals*: universals, abstract objects, Quine, Carnap, tables.
- *Identity, Change and Persons*: ships, statues, temporal parts, momentariness, persons.
- *Causation*: necessary connection, the Indian quarrel, regularity, counterfactual and interventionist theories.
- *Time*: McTaggart, which times exist, relativity, time travel.
- *Free Will and Determinism*: fate, compatibilism, Frankfurt, libertarians, sceptics, neuroscience.
- *Possibility and Necessity*: the Master Argument, possible worlds, essence, conceivability.
- *God: Arguments For and Against*: the classic arguments, the Indian debate, the Wager, faith, hiddenness, diversity.
- *The Problem of Evil*: the logical and evidential problems, soul-making, horrendous evils, Islamic and Indian approaches.

The questions continue in *The Mind–Body Problem*, *Consciousness*, *Self and No-Self: Personal Identity East and West* and *Reason, Experience and Innate Ideas*.

## Further exploration

- **Mark Siderits, Tom Tillemans and Arindam Chakrabarti (eds.), *Apoha: Buddhist Nominalism and Human Cognition* (2011).** The Buddhist theory of exclusion debated by Indian and modern philosophers and cognitive scientists.
- **David J. Chalmers, David Manley and Ryan Wasserman (eds.), *Metametaphysics: New Essays on the Foundations of Ontology* (2009).** The debate over whether ontological questions are deep, trivial or confused.
- **Katherine Hawley, *How Things Persist* (2001).** A clear, balanced survey of endurance and perdurance, defending stage theory.
- **L. A. Paul and Ned Hall, *Causation: A User's Guide* (2013).** A systematic survey built around pre-emption and the other test cases that every theory must face.
- **Robert Kane, *A Contemporary Introduction to Free Will* (2005).** A clear survey of the whole debate by a leading libertarian.
- **David Lewis, *On the Plurality of Worlds* (1986).** The full defence of modal realism and counterpart theory, with replies to the incredulous stare.
- **Graham Oppy, *Arguing about Gods* (2006).** The most thorough recent critical survey of the main arguments.$metaov_master$,
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
  select $metaov_quiz$[
    {"type": "mcq", "prompt": "Where does the title 'Metaphysics' come from, according to What Exists? Ontology and Universals?", "options": ["Aristotle chose it for his study of being qua being", "An editor, in all probability Andronicus of Rhodes, titled the books 'the ones after the physical ones' at least a century after Aristotle's death", "Jacob Lorhard coined it in 1606", "Quine introduced it in 'On What There Is' (1948)"], "answerIndex": 1, "explanation": "Aristotle called his inquiry 'first philosophy', 'wisdom' or 'the study of being qua being', never 'metaphysics'. The title Ta meta ta phusika meant the books after the Physics. Lorhard's Ogdoas Scholastica (1606) is the earliest known printed use of the younger word 'ontology'.", "id": "q1"},
    {"type": "mcq", "prompt": "According to the Free Will and Determinism chapter, how does determinism differ from fatalism?", "options": ["Determinism says the future is fixed by natural law given the state of the world at a time, while fatalism says events are destined to occur no matter what we do", "They are two names for the same thesis", "Determinism has been refuted by quantum mechanics, while fatalism has not", "Fatalism concerns laws of nature, while determinism concerns divine foreknowledge"], "answerIndex": 0, "explanation": "On Hoefer's definitions, determinism fixes what follows by natural law, so what you do still makes a difference; fatalism guarantees outcomes by the gods, foreknowledge or some purpose, whatever we do. Hoefer calls the belief that quantum mechanics has refuted determinism 'partly mistaken and/or misleading', since some interpretations are deterministic.", "id": "q2"},
    {"type": "mcq", "prompt": "What does Kit Fine's example of Socrates and the set {Socrates} show, according to Possibility and Necessity?", "options": ["That sets do not exist", "That Socrates could not have existed without being a philosopher", "That necessary truths are always known a priori", "That a property can be necessary to something without being part of what it is, so essence is not a modal notion"], "answerIndex": 3, "explanation": "Necessarily, if Socrates exists he belongs to {Socrates}, but that is no part of what Socrates is, though having Socrates as a member is part of what the set is. Fine concluded that essence is not modal and reversed the order: metaphysical necessities are true in virtue of the natures of things.", "id": "q3"},
    {"type": "mcq", "prompt": "In The Problem of Evil, what distinguishes Plantinga's Free Will Defence from a theodicy?", "options": ["It argues that evil is a privation and so does not really exist", "It claims to give God's actual reasons for each evil", "It aims only to show that God and evil are consistent, by describing a situation that need only be possible", "It argues that evil makes God's existence improbable"], "answerIndex": 2, "explanation": "A theodicy tries to give a plausible account of why God actually permits evil; a defence describes a possible situation, here transworld depravity, in which God and evil both exist. Van Inwagen described such a story as 'true for all anyone knows'. Most philosophers on both sides accept that it answered Mackie's logical argument, though some dissent; the evidential problem remains open.", "id": "q4"},
    {"type": "open", "prompt": "Is metaphysics about the world or about our words? Explain Carnap's distinction between internal and external questions, Quine's objection and the later replies, and show how the question returns in at least one other chapter of this section.", "rubric": "A strong answer explains Carnap's 1950 distinction: internal questions are asked within a framework and are often trivial (is there a prime number greater than a hundred?); external questions, whether numbers exist at all, taken literally lack cognitive significance and read charitably are practical choices about a way of speaking. It gives Quine's objection that the distinction rests on the analytic–synthetic line, which he rejected, and notes that Quine was long thought to have won; then the revival: the claim that the distinction may not need analyticity (Yablo, Thomasson), Thomasson's easy ontology, and Schaffer's view that metaphysics is about what grounds what. It brings in another chapter: the deflationists (Carnap, Putnam, Hirsch) on the Ship of Theseus, or doubts that the endurance–perdurance debate is substantive (Identity, Change and Persons); al-Ghazālī's view of modalities as judgements of the mind, or Rosen's modal fictionalism (Possibility and Necessity); or Hume's projection of necessity (Causation). Better answers note that linking these chapters to Carnap's question is the overview's own reading.", "id": "q5"},
    {"type": "open", "prompt": "Compare how Buddhist, Nyāya and Islamic thinkers, as presented in this section's chapters, answered questions about persistence, wholes and causation.", "rubric": "A strong answer draws on several chapters. Persistence: Vasubandhu's momentariness argument (destruction cannot have a cause, so things perish as soon as they arise; apparent persistence is a stream of replacements) and the Nyāya objection from recognition; al-Ashʿarī's view, on Perler and Rudolph's account, that God rearranges the world's atoms anew at every instant, which the Identity chapter compares with the Buddhist view (causal streams versus continual creation). Wholes: the Buddhist chariot argument and the Abhidharma distinction between the substantially and the nominally existent; Nyāya's view that a whole is a new thing inhering in its parts; kalām atomism. Causation: Indian causation as the origin of a thing; Sāṃkhya's existent effect against Nyāya's new production; Nāgārjuna's conclusion, on Westerhoff's reading, that cause and effect lack intrinsic natures; Avicenna's necessitation against al-Ghazālī's denial of necessary connection, with occasionalism and the debate over whether al-Ghazālī held it. Better answers note limits of comparison, such as Fraser on Chinese thought and universals or Tillemans on possible worlds in Dharmakīrti.", "id": "q6"}
  ]$metaov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
