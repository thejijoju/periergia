-- Time — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/time @ research/advanced/read.
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
    'philosophy/metaphysics/time',
    'research',
    'advanced',
    'read',
    $time_master$> **Is time real, and if it is, do the past and the future exist?** This chapter starts from Augustine's puzzle and the quarrel over whether time could pass without change, then works through McTaggart's argument that time is unreal, Prior's "Thank goodness that's over", and the rival views of which times exist: presentism, eternalism, the growing block and the moving spotlight. It sets beside them the Buddhist debate over whether past and future things exist and Islamic views of time's atoms and beginning, then turns to physics, where relativity seems to abolish a shared present and the arrow of time needs explaining, and to the paradoxes of time travel.

## Knowing and Not Knowing

Augustine put the difficulty in one sentence: "What then is time? If no one asks me, I know: if I wish to explain it to one that asketh, I know not" (*Confessions* 11.14.17, in E. B. Pusey's translation). The chapter on *Augustine and Early Christian Philosophy* sets out his argument in eight steps. In brief: the past is no longer, the future is not yet, and the present shrinks to a point without length; yet we measure long and short times. So past and future must exist as present memory and present expectation, and time is "a distention of the soul" (*distentio animi*).

Was Augustine a **subjectivist**, holding that time exists only in the mind? Bradley Dowden's entry in the Internet Encyclopedia of Philosophy (IEP) says "clearly" yes. Christian Tornau's entry in the Stanford Encyclopedia of Philosophy (SEP) points the other way: Augustine "has no intention of giving a definition of time"; elsewhere he discusses the cosmic time of the physical world; and "the purpose of the book is ethical rather than cosmological". The Augustine chapter takes the second side. The dispute separates two ideas of time that recur below: time as the shape of experience, and time as a feature of the world.

A second old question is how time relates to change. The SEP entry on time, by Nina Emery, Ned Markosian and Meghan Sullivan, offers a test. Could everything in the universe stop for a year, the birds frozen in mid-flight, and then start again? If so, time is something over and above events. **Relationists** (or reductionists), such as Aristotle and Leibniz, say no: time is nothing but the ordering of changes. **Substantivalists** (or Platonists, absolutists), such as Plato and Newton, say yes.

Aristotle's *Physics* defines time as "just this — number of motion in respect of 'before' and 'after'" (IV.11, 219b1–2, in Hardie and Gaye's translation, quoted here from an online reprint). Time is not change itself, since a change may be faster or slower "but not time"; yet "neither does time exist without change", a claim often called Aristotle's Principle. (His treatment of instants returns in Zeno's arrow, which *Paradoxes: the Liar, the Heap and Zeno* sets out.)

Newton took the other side:

```quote
Absolute, true and mathematical time, of itself, and from its own nature flows equably without regard to anything external, and by another name is called duration
Newton · Principia, Scholium to the Definitions (Motte's translation as revised, American edition of 1846) · 1687
```

His rotating bucket used the effects of acceleration to argue for absolute motion, hence absolute space and time. Leibniz replied, in the correspondence with Clarke described in *Leibniz*, that a world identical to ours but shifted one second later in absolute time would differ from ours for no reason, offending the principle of sufficient reason and the identity of indiscernibles. Absolutism had an earlier Islamic advocate: Abū Bakr al-Rāzī (c. 864–925 or 930) counted absolute time among his five eternal principles, distinguishing it, as duration, from relative time.

## McTaggart: Is Time Unreal?

The modern debate begins with an article whose opening admits its own strangeness: "It doubtless seems highly paradoxical to assert that Time is unreal, and that all statements which involve its reality are erroneous." Its author, J. M. E. McTaggart (1866–1925), was a Cambridge idealist and interpreter of Hegel. "The Unreality of Time" appeared in *Mind* in 1908; a restated version forms chapter 33 of the second volume of *The Nature of Existence* (1927).

{{image: J. M. E. McTaggart | J. M. E. McTaggart, the Cambridge idealist who argued in 1908 that time is unreal.}}

McTaggart distinguished two ways of ordering events. In his 1927 restatement, the **A series** "runs from the far past through the near past to the present, and then from the present through the near future to the far future"; the **B series** "runs from earlier to later". A-properties (being past, present, future, two days future) change constantly; B-relations (earlier than, simultaneous with, later than) are fixed. The names, the SEP entry remarks, are "not particularly creative", but they stuck.

Kris McDaniel's SEP entry reconstructs the argument like this:

1. Time is real only if real change occurs.
2. Real change occurs only if the A series exists.
3. The A series does not exist.
4. So time is not real.

For premise 2, McTaggart argued that B-facts never change. A poker that is hot and then cold has not, on a B-view, really changed, since it is always true that its earlier part is hotter than its later part. So he rejected Russell's account of change as merely having different properties at different times. The only change left is an event's moving from future to present to past.

For premise 3: past, present and future are incompatible, yet every event has all three. **The objection** is obvious: no event is past, present and future at once; it *was* future, *is* present and *will be* past. **McTaggart's reply** was that the times invoked in "was", "is" and "will be" must themselves be past, present and future, and so on without end: on the SEP's paraphrase, we never resolve the original contradiction but "merely generate an infinite regress of more and more contradictions". McDaniel warns that how best to reconstruct premise 3 "is highly contentious".

Two schools answer differently. **B-theorists**, among them Braithwaite, Smart and D. H. Mellor, accept the case against the A series but deny premise 2: change is just a thing's having different properties at different times. **A-theorists**, among them C. D. Broad and A. N. Prior, reject premise 3, saying McTaggart misread tensed talk. Hilda Oakeley attacked his system in "Time and the Self in McTaggart's System" (*Mind*, 1930). Ingthorsson argues that the argument draws on McTaggart's earlier metaphysics, which is why the two sides talk past each other. McTaggart himself thought something real underlies apparent time, a non-temporal order he called the C series, and he called his denial of time "Hegelian rather than Kantian" for that reason.

## Thank Goodness That's Over

The A-theory says some change requires tensed facts, such as the fact that the meeting *is now* over. The B-theory says all change can be described in before-and-after terms: "The leaf is red at October 7, 2019." Bertrand Russell, Dowden says, "offered the original B-theory". Its best-known challenge came from Arthur Prior (1914–1969), the New Zealand logician who founded **tense logic** in 1957, the formal study of "it was the case that" and "it will be the case that". His paper "Thank Goodness That's Over" appeared in *Philosophy* in 1959. As the IEP reconstructs it:

1. After a painful ordeal, I say, "Thank goodness that's over", and my relief is rational.
2. It cannot mean "Thank goodness the date of the conclusion of that thing is Friday, June 15, 1954", a fact as true before the ordeal as after.
3. Nor can it mean "Thank goodness the conclusion of that thing is contemporaneous with this utterance": "Why should anyone thank goodness for that?"
4. These B-facts are the only candidates the B-theory offers.
5. So what I am thankful for is an A-fact, that the pain is past; and the A-theory is correct.

**The objection** from the B-theory comes in several forms. It is not improper to thank goodness that the pain ends before this utterance; a four-dimensionalist (see below) may say it is proper to care more about later stages of oneself. The strongest form is the "new tenseless theory" of Mellor and Smart. Tensed sentences cannot be translated into tenseless ones, as Prior and Chisholm insisted, but their truth conditions can be given without tense: "It is now midnight" is true if and only if it is uttered at midnight. So tensed facts are not needed. **The A-theorist's rejoinder** is that what I am glad about is not a truth condition but the event's pastness. Quentin Smith says the new tenseless theory "is faced with insurmountable problems".

```checkpoint
q: In McTaggart's argument, why does he think the B series alone cannot give us real change?
a*: Because B-facts never change: if one event is earlier than another, it always is.
a: Because the B series contains contradictions.
x: McTaggart's charge of contradiction is aimed at the A series, not the B series.
a: Because the B series depends on the C series.
x: The C series was his name for the real, non-temporal order behind apparent time; it is not his reason here.
a: Because B-relations exist only in the mind.
x: McTaggart's point was about change, not about whether B-relations are mental.
hint: Think of his poker, hot then cold.
why: It is always true that the poker's earlier part is hotter than its later part, so on a B-view nothing about the facts changes; only movement from future to present to past would be real change.
---
q: What is the "new tenseless theory" reply to Prior's "Thank goodness that's over"?
a: That tensed sentences can be translated without loss into tenseless ones.
x: Mellor and Smart concede that such translation fails; their claim concerns truth conditions.
a: That relief about the past is irrational.
x: The reply accepts that the relief makes sense; it denies that it requires tensed facts.
a*: That tensed sentences, though untranslatable, have tenseless truth conditions, so tensed facts are not needed.
a: That the A series is real but the B series is not.
x: That would be a more radical A-theory, the opposite of the B-theorists' position.
hint: "It is now midnight" is true if and only if ...
why: "It is now midnight" is true if and only if it is uttered at midnight. If tenseless conditions fix the truth of tensed sentences, Ockham's razor says there is no need for tensed facts.
```

## Which Times Exist?

A second question cuts across the first. **Presentism** says that only present things exist: Socrates and future Martian outposts are not on the list. **Eternalism** says that past and future things exist too, as distant places do. The **growing block** says that the past and present exist but the future does not. Combining these with the A/B divide gives four main packages: the **block universe** (eternalism plus the B-theory); the **moving spotlight** (eternalism plus an objective, moving present); **presentism** (always an A-theory); and the growing block.

Presentism is often called the common-sense view. Robert Adams first used the name in print in 1986, though Emily Thomas argues that G. E. Moore gave the first substantial English-language defence in his lectures of 1910–11. Its troubles include talk about non-present things ("Socrates"), relations across times (Lincoln was taller than Napoleon), and a problem set out here:

1. There are objective truths about the past, such as that there were dinosaurs.
2. Every truth is made true by something that exists (**truthmaker theory**).
3. Only present things exist (presentism).
4. Nothing present makes it true that there were dinosaurs.
5. So one of the first three claims is false.

The presentist's main **reply** denies step 4. On Bigelow's "Lucretianism", the truth that Marie Curie existed is made true by the present world's property of *having contained Marie Curie*. Others use abstract "ersatz times" (Bourne, Crisp), or deny that truths about the past need truthmakers, a line that, David Ingram and Jonathan Tallant report, "hasn't received a huge amount of support". **The objection** to Lucretian properties is that they are primitive, past-tensed properties of the present world, which some find "wholly objectionable" because they point beyond their bearers. And nothing in the view guarantees the right result: as a banana ripens, why must the world come to have *having contained a green banana* rather than a red one?

The growing block goes back to C. D. Broad:

```quote
Nothing has happened to the present by becoming past except that fresh slices of existence have been added to the total history of the world.
C. D. Broad · Scientific Thought · 1923
```

Michael Tooley and Peter Forrest have defended it since. It faces an epistemic objection (Braddon-Mitchell, 2004): past people in the block think they stand at the edge of being and are wrong; nothing distinguishes us from them; so we cannot know it is now now. Forrest's reply is that the past exists but is "lifeless": consciousness exists only at the edge. Broad also coined the name "moving spotlight", for the view that the whole of history exists but one region is objectively lit as present.

These views link to the question of persistence. As *Identity, Change and Persons* explains, things that **perdure** have temporal parts, which suits eternalism and the B-theory, while things that **endure** are wholly present at each moment, which suits presentism.

## Do Past Things Exist? Buddhist and Islamic Debates

Indian Buddhists argued about eternalism and presentism centuries earlier. The Sarvāstivāda school took its name from the doctrine that "all exists" (*sarvam asti*): the basic elements of reality, *dharmas*, exist in past, present and future. Theravāda held that they exist only in the present. Vasubandhu's *Abhidharmakośa*, in Zishan Khawaja's account, records four Sarvāstivāda arguments: the Buddha said monks could not consider the past or delight in the future if these did not exist; cognition requires an object, and past and future things are objects of thought; consciousness always has a real object, and we think of last week's cake; and past actions have present karmic results, so past *dharmas* must exist to act.

But if *dharmas* always exist, what makes one past and another present? Four Sarvāstivāda masters answered. Dharmatrāta proposed a difference of *being*, like a gold vessel remelted; Ghoṣaka, a difference of *characteristic*; Buddhadeva, a difference of *relation*, as one woman is both daughter and mother; and Vasumitra, a difference of *position* fixed by *activity* (*kāritra*): a *dharma* not yet exercising its activity is future, exercising it present, having exercised it past, like a piece moved on a chess board. Vasubandhu judged Vasumitra's answer "the most convincing", then criticised it from the Sautrāntika side. Either the activity is separate from the *dharma*, in which case it is itself temporal and needs a further activity to fix its time, "leading to an infinite regress"; or it is not separate, in which case an ever-existing *dharma* is always active and the three times collapse. The Sautrāntikas held instead that real elements exist only for a moment, arising and ceasing: a Buddhist presentism. (On the momentariness argument itself, see *Identity, Change and Persons*.)

The parallel is this chapter's own comparison, not one the sources draw: Buddhadeva's relational view resembles a B-theory, and the Sautrāntika regress has the same shape as McTaggart's. In both debates, explaining what makes a moment present seems to require a further time.

Elsewhere in India, Nyāya-Vaiśeṣika counted time (*kāla*) among nine substances (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*), inferred, reference works report, from marks such as priority and posteriority. Abhidharma texts made the moment (*kṣaṇa*) the smallest unit of time, with texts giving figures equivalent to between 0.13 and 13 milliseconds; Hindu Purāṇas made a *kalpa*, one day of Brahmā, 4.32 billion years.

In the Islamic world, Jon McGinnis reports that al-Ashʿarī recorded three accounts of the moment among the theologians of *kalām*: an aggregate of moments, each perhaps atomic; the moment as an accident; and, most popular, the moment as a conventionally fixed event, so that "'time' is just another name for the motion of the heavens". Maimonides later credited them with a single atomic theory of time, a claim McGinnis says "seems to be gainsaid by earlier sources", though the occasionalism some of them adopted, God re-creating the world at each moment, at least implicitly endorses it. Among the philosophers of *falsafa*, al-Kindī was "virtually alone" in affirming time's finitude, while Avicenna argued that time has no beginning. Al-Ghazālī's attack on the eternity of the world is told in *Al-Ghazālī, Averroes and the Quarrel over Reason*.

## Relativity and the Vanishing Present

Einstein's special relativity (1905), recast by Minkowski in 1908 as a four-dimensional **spacetime**, changed the debate. Its effects are measurable. Muons, short-lived particles in cosmic rays, have a mean lifetime of about 2.2 millionths of a second; without time dilation, half would decay within about 450 metres, yet they reach the ground, because at 98 per cent of the speed of light their lifetime is about five times longer. In October 1971 Joseph Hafele and Richard Keating flew four caesium atomic clocks round the world on airliners. Eastward, they predicted a loss of 40 ± 23 nanoseconds and measured 59 ± 10; westward, they predicted a gain of 275 ± 21 and measured 273 ± 7. GPS now corrects for both effects routinely.

The philosophical problem is the **relativity of simultaneity**: whether two distant events happen at the same time depends on the observer's frame of reference, and no frame is privileged. The first claim is empirical; the second, the SEP stresses, is an extra principle an A-theorist may reject "without any conflict with empirical results". Rietdijk (1966) and Hilary Putnam (1967) turned it against presentism. In Matias Slavov's IEP version:

1. Events A and B are simultaneous in one frame, and A and C are simultaneous in another.
2. C is later than B, in every frame.
3. Events simultaneous with one another are equally real.
4. "Equally real" is transitive: if A is as real as B, and A is as real as C, then B is as real as C.
5. So a later event, C, is as real as B; and, generalising, every event is real: the block universe.

Penrose (1989) dramatised it: two people walk at an ordinary pace, one towards the Andromeda galaxy and one away, and their "nows" cut Andromeda's history days apart (accounts give five to five and three-quarters), so a fleet launched in between is past for one and future for the other.

**The objections** target premise 4, the transitivity of "equally real", and the conventionality of distant simultaneity, which critics say undermines premise 3. Howard Stein's "formal refutation" defined becoming relative to each point by its past light cone, but then an event's present "is constituted by itself alone", too thin for genuine becoming, Craig Callender objects. Neo-Lorentzian interpretations, which keep a privileged frame, are empirically equivalent to relativity but, critics argue, leave its Lorentz invariance an "unexplained coincidence". Prior's **reply** was that physics shows only that we sometimes cannot know whether something is happening. Kurt Gödel drew the opposite moral: "The concept of existence … cannot be relativized without destroying its meaning completely." Einstein wrote after his friend Besso's death in 1955 that "the distinction between past, present, and future is only a stubbornly persistent illusion"; Slavov warns that reading this as a thesis of eternalism is "to read a personal, poetic letter out of its context". Henri Bergson, for whom lived time was duration (*la durée*), a "qualitative multiplicity", challenged Einstein in Paris in 1922, a story Jimena Canales has told.

## Time's Arrow

Arthur Eddington named a further puzzle: "I shall use the phrase 'time's arrow' to express this one-way property of time which has no analogue in space." Heat flows from hot to cold; milk mixes into coffee and never unmixes. Yet the fundamental laws of physics are, near enough, the same backwards and forwards: "no asymmetry in, no asymmetry out", as Callender puts it. Ludwig Boltzmann's answer was statistical: far more microscopic arrangements correspond to mixed, high-entropy states, so a system almost certainly drifts towards them. The usual remedy is that the universe began in an extremely low-entropy state, which David Albert called the **Past Hypothesis**. Is it a law, a brute fact, or something needing explanation? Callender doubts that it needs explaining, Huw Price insists one is, and John Earman doubts it can be coherently stated in general relativity. Albert also uses it to explain why footprints and other records point to the past, never the future.

## The Paradoxes of Time Travel

"What is time travel?" David Lewis asked in 1976. "Inevitably, it involves a discrepancy between time and time": between external time and the traveller's personal time, roughly what her wristwatch measures. The classic objection is the **grandfather paradox**:

1. If you could travel back in time, you could kill your grandfather before your father was conceived.
2. You could not do that, since you would then never have existed.
3. So you cannot travel back in time.

**Lewis's reply** turns on "can". Tim, a crack shot who hates his grandfather, faces him with a loaded gun. Relative to Tim's skill, weapon and motive, killing is compossible with the facts, so he can; relative to the further fact that Grandfather survived, it is not, so he cannot. So there is no contradiction, only an equivocation, and Tim will fail for some commonplace reason: the gun jams, or he slips on a banana peel. **Objections** remain. Vihvelin (1996) argues that "Tim can kill Grandfather" is simply false, since he would not have succeeded had he tried. Horwich argues that consistent time travel needs too many uncaused coincidences, so it is extremely unlikely, though not impossible.

Physics keeps the question alive. Gödel (1949) found a rotating universe, allowed by general relativity though not our own, in which paths loop back in time; Igor Novikov proposed that only self-consistent histories can occur; Hawking conjectured in 1992 that "the laws of physics prevent closed timelike curves from appearing".

```checkpoint
q: Which premise of the Rietdijk–Putnam argument do critics most often target?
a: That the relativity of simultaneity has been confirmed by experiment.
x: That part is empirical; the argument's critics target its metaphysical premises.
a*: That "equally real" is transitive across frames of reference.
a: That later events are real.
x: That is the argument's conclusion, not a premise.
a: That muons decay in about 2.2 millionths of a second.
x: Muon lifetimes illustrate time dilation; they are not a premise of the argument.
hint: Which step links B to C through A?
why: Transitivity lets the argument pass from "A is as real as B" and "A is as real as C" to "B is as real as C". Critics also say that if distant simultaneity is conventional, premise 3 cannot get the argument started.
---
q: How does Lewis answer the grandfather paradox?
a: By arguing that time travel changes the past, creating a new branch of history.
x: Lewis's traveller cannot change the past; his solution keeps a single consistent history.
a: By accepting that time travel is impossible.
x: Lewis's aim was to show that time travel involves no contradiction.
a: By arguing that Tim lacks the skill to kill anyone.
x: Lewis grants Tim the skill, weapon and motive.
a*: By arguing that "can" is relative to a set of facts, so Tim both can and cannot without contradiction.
hint: What does "can" mean when the facts in view change?
why: Relative to Tim's skill and weapon, killing is compossible; relative to Grandfather's survival, it is not. The paradox rests on an equivocation, and Tim fails for some commonplace reason.
```

## Experience, Physics and the Present

Back to experience. Besides Oakeley, the SEP names Émilie du Châtelet, Anne Conway and Margaret Cavendish in the history of the subject. Mary Calkins, with Shadworth Hodgson and William James, held that the experienced present is "thick", a short stretch rather than an instant, the view, Dowden says, now favoured by experts. Emily Thomas has written on Calkins, Victoria Welby and the "spatialisation" of time. James wrote that "the specious present, the intuited duration, stands permanent, like the rainbow on the waterfall". Husserl's analysis of time-consciousness, and Heidegger's of existence as temporal, are in *Phenomenology: Husserl, Heidegger and Merleau-Ponty*; Kant's account of time as a form of intuition is in *Kant*.

At the other extreme, some physicists doubt that time is fundamental. In one approach to quantum gravity the equations yield a "frozen" universe that does not evolve. Julian Barbour (*The End of Time*, 1999) and Carlo Rovelli argue, in different ways, that time is not fundamental; Lee Smolin and Sean Carroll criticise Barbour. The SEP's judgement is that "work in this area is nascent". The SEP entry also notes that some authors argue that thinking of time as a line is specific to the Western tradition, and perhaps recent within it.

The questions also touch how we live. Lucretius argued that if the time after death is no different from the time before birth, we should care less about death, an argument taken up in *The Meaning of Life and the Fear of Death*. Augustine's own answer to the scattering of the soul across past and future was not a theory of time at all, but a direction: "straining forward".

## Further exploration

- **Craig Callender, *What Makes Time Special?* (2017).** A philosopher of physics on why time seems to flow, and what physics says about it.
- **Huw Price, *Time's Arrow and Archimedes' Point: New Directions for the Physics of Time* (1996).** The arrow of time examined from a "view from nowhen".
- **D. H. Mellor, *Real Time II* (1998).** The classic defence of the tenseless B-theory.
- **Nikk Effingham, *Time Travel: Probability and Impossibility* (2020).** A careful study of the philosophy of time travel.
- **Jimena Canales, *The Physicist and the Philosopher: Einstein, Bergson and the Debate That Changed Our Understanding of Time* (2015).** The history of the 1922 encounter and its aftermath.
- **Jonathan C. Gold, *Paving the Great Way: Vasubandhu's Unifying Buddhist Philosophy* (2014).** Includes the Sarvāstivāda and Sautrāntika debate over the three times.
- **Nina Emery (ed.), *The Routledge Companion to Philosophy of Time* (2025).** A current survey, including Indigenous perspectives and the history of "spatialised" time.$time_master$,
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
  select $time_quiz$[
    {"type": "mcq", "prompt": "In McTaggart's terms, which of these is a B-relation rather than an A-property?", "options": ["Being in the far past", "Being earlier than another event", "Being present", "Being two days future"], "answerIndex": 1, "explanation": "The A series runs from far past through present to far future, and its positions constantly change. The B series runs from earlier to later; B-relations such as 'earlier than' and 'simultaneous with' are fixed.", "id": "q1"},
    {"type": "mcq", "prompt": "Which view holds that the past and present exist but the future does not?", "options": ["Presentism", "Eternalism", "The block universe", "The growing block"], "answerIndex": 3, "explanation": "The growing block, which goes back to C. D. Broad's Scientific Thought (1923), says fresh slices of existence are added to the world's history. Presentism admits only the present; eternalism, and the block universe built on it, admits past, present and future alike.", "id": "q2"},
    {"type": "mcq", "prompt": "According to Vasumitra, one of the Sarvāstivāda masters, what makes a dharma past, present or future?", "options": ["Its activity: not yet exercised (future), being exercised (present), or already exercised (past)", "Its relation to other dharmas, as one woman is both daughter and mother", "A change in its mode of being, like a gold vessel remelted", "Whether it exists at all, since only present dharmas exist"], "answerIndex": 0, "explanation": "Vasumitra explained the three times by a dharma's position according to its activity (kāritra), like a piece on a chess board. The relational view was Buddhadeva's, the difference of being Dharmatrāta's, and the denial that past and future dharmas exist was the Sautrāntika and Theravāda position.", "id": "q3"},
    {"type": "mcq", "prompt": "What is the 'Past Hypothesis', as David Albert named it?", "options": ["That the past is fixed but the future is open", "That only past events can be causes", "That the universe began in an extremely low-entropy state", "That memories are always reliable records of the past"], "answerIndex": 2, "explanation": "Because the fundamental laws are nearly time-symmetric, the one-way increase of entropy is usually explained by a low-entropy beginning. Whether it is a law, a brute fact or something needing explanation is disputed (Callender, Price, Earman).", "id": "q4"},
    {"type": "open", "prompt": "Set out McTaggart's argument for the unreality of time as a numbered argument. Explain the obvious objection to his claim that the A series is contradictory, his reply, and how B-theorists and A-theorists each respond.", "rubric": "A strong answer gives McDaniel's reconstruction: time is real only if real change occurs; real change occurs only if the A series exists; the A series does not exist; so time is not real. It defines the A series (past, present, future) and B series (earlier, later), and explains premise 2 with the poker (B-facts never change, so McTaggart rejected Russell's account of change). It states the contradiction (every event is past, present and future), the objection (an event was future, is present, will be past) and McTaggart's regress reply. It notes that B-theorists (Braithwaite, Smart, Mellor) accept the case against the A series but deny premise 2, and that A-theorists (Broad, Prior) say McTaggart misread tensed talk. Credit mention of the C series, Hilda Oakeley's critique, Ingthorsson's point that the argument depends on McTaggart's metaphysics, or the parallel with the Sautrāntika regress against Vasumitra.", "id": "q5"},
    {"type": "open", "prompt": "Does special relativity refute presentism? Set out the Rietdijk–Putnam argument and assess at least two replies.", "rubric": "A strong answer explains the relativity of simultaneity and separates its empirical part from the extra principle that no frame is privileged. It sets out the argument: A and B simultaneous in one frame, A and C in another, C later than B; simultaneous events are equally real; 'equally real' is transitive; so a later event is as real as an earlier one, and every event is real (the block universe). It may give Penrose's Andromeda example. It assesses replies: the transitivity premise and the conventionality of distant simultaneity; Stein's past-light-cone becoming and Callender's objection that it is too thin; neo-Lorentzian interpretations and the 'unexplained coincidence' charge; Prior's view that physics shows only limits on knowledge. Credit Gödel's remark on relativising existence and the caution against reading Einstein's 1955 letter as eternalism, and evidence of time dilation such as muons or the Hafele–Keating experiment.", "id": "q6"}
  ]$time_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/time', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
