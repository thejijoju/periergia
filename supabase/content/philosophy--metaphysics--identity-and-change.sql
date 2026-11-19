-- Identity, Change and Persons — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/identity-and-change @ research/advanced/read.
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
    'philosophy/metaphysics/identity-and-change',
    'research',
    'advanced',
    'read',
    $identity_master$> **How can a thing change and still be the same thing?** This chapter works through the classic puzzles of persistence: Heraclitus' river, the ancient "growing argument" and Chrysippus' Dion and Theon, the Ship of Theseus, and the statue and its clay. It sets out the modern quarrel between things that "endure" and things that "perdure", then turns to Buddhist arguments that nothing lasts longer than a moment, the Nyāya reply that wholes are real, and the Ash'arite view that God re-creates the world at every instant. It ends with persons, the hardest case.

## Two Ways of Being the Same

Begin with a pan, cold in the morning and hot at lunchtime. Is it the same pan? Philosophers separate two senses of "same". **Qualitative identity** is sameness of properties, and comes in degrees: two poodles are more alike than a poodle and a Great Dane. **Numerical identity** is the relation by which we count things as one; it "can only hold between a thing and itself", as Harold Noonan puts it in the Stanford Encyclopedia of Philosophy. Change, in Andre Gallois's formulation, is the case where a thing is numerically identical with something that is not qualitatively identical with it: the same pan, at one time cold and at another hot.

Numerical identity itself looks easy. David Lewis wrote, in *On the Plurality of Worlds* (1986): "Identity is utterly simple and unproblematic. Everything is identical to itself; nothing is ever identical to anything except itself." It is also **transitive**: if a is b and b is c, then a is c. Most of this chapter's puzzles strain transitivity. A second principle, **Leibniz's Law** (the indiscernibility of identicals), says that if x is identical with y, everything true of x is true of y. Its converse, the identity of indiscernibles, belongs to the chapter on *Leibniz*.

Leibniz's Law seems to make change impossible: if a thing changes, something is true of it later that was not true of it earlier, so it is not the same thing. Noonan calls this a misuse of the law. What is true of the pan later is that it is *hot at noon*, and that was true of the same pan all along. The reply is neat, but it leaves a question that returns below: is "hot at noon" a property of the pan, or a relation between the pan and a time? Noonan names Heraclitus and Hume as holders of the sceptical view; Hume treated identity over time as a "fiction" (see *Berkeley and Hume*).

## The River

The oldest image of the problem is a river. *The Presocratics: from Myth to Argument* explains why scholars think only one of the three "river fragments" is Heraclitus' own. In Daniel Graham's translation: "On those stepping into rivers staying the same other and other waters flow." Plato's *Cratylus* reported something stronger: that "all things pass and nothing stays", so "you could not step twice into the same river". Cratylus himself, an Athenian Heraclitean, went further: according to Aristotle (*Metaphysics* 1010a), he held that one cannot step into the same river even once.

Graham reads the genuine fragment the other way round. A river "remains what it is by changing what it contains": if the waters stopped it would be a lake or a dry bed. Some things stay the same only by changing, as a body lives by metabolism. Whichever reading is right, the river teaches a first lesson: "is it the same river?" and "is it the same water?" are different questions with different answers. What counts as "the same" depends on the kind of thing we ask about, which philosophers call **sortal** dependence, after the sorts or kinds under which we count.

## The Growing Argument: Dion and Theon

Greek comedy made this a joke about money. In the Stanford Encyclopedia's account, the Sicilian playwright Epicharmus (c. 550 – c. 460 BCE) staged a debtor who argues that, as adding a pebble changes a number, so a man whose matter keeps changing is not the man who took out the loan. The creditor hits him, then says he is no longer the man who struck him. If a thing simply *is* its matter, the debtor's reasoning is sound.

This became the **Growing Argument**, used by the Academic sceptics against the Stoics (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*): since matter is constantly gained and lost, what we call growth is really destruction and generation. The Stoic Chrysippus (c. 280 – 207 BCE), on David Sedley's reading, replied that one thing falls under two descriptions: as a lump of matter it does not persist; as a "peculiarly qualified" individual it does.

Chrysippus also posed a puzzle, reported by Philo of Alexandria. In the translation given in the Internet Encyclopedia of Philosophy: "For the sake of argument, let one individual be thought of as whole-limbed; the other as minus one foot. Let the whole-limbed one be called Dion, the defective one Theon." Theon is the part of Dion that excludes one foot. Now Dion's foot is amputated. Dion and Theon now consist of the same matter in the same place, and two people cannot share one place. Which has ceased to exist?

The sources disagree. The Stanford Encyclopedia sets out the reasoning that seems to follow: Theon has lost nothing, so he survives, and Dion does not. The Internet Encyclopedia, following Sedley, reports Chrysippus' own answer as the reverse. Whose foot was cut off? Dion's: Theon could not lose a foot he never had. So Dion survives and Theon perishes, and Sedley argues that Chrysippus thereby turned the Growing Argument back on the Academics.

## The Ship of Theseus

The most famous of these puzzles began as a museum piece. In Plutarch's *Life of Theseus* the Athenians kept Theseus' ship by replacing old planks with new, so that, in the Dryden translation revised by Clough, it "became a standing example among the philosophers, for the logical question of things that grow; one side holding that the ship remained the same, and the other contending that it was not the same." Plutarch's Greek, as far as this chapter's sources could check, appears to name the growing argument itself: the ship was an ancient case in the debate about growth, not a free-standing riddle.

As the chapter *What Is Philosophy?* promised, the puzzle returns here. Thomas Hobbes, in *De Corpore* (1655; English translation 1656), gave it its modern form by adding a second ship:

```quote
If some Man had kept the Old Planks as they were taken out, and by putting them afterward together in the same order, had again made a Ship of them, this would, without doubt, had also been the same Numerical Ship with that which was at the beginning; and so there would have been two Ships Numerically the same, which is absurd.
Thomas Hobbes · Elements of Philosophy, concerning Body (English translation of De Corpore), II.11.7 · 1656
```

Call the repaired ship in the harbour *Replacement* and the custodian's rebuilt ship *Reassembly*. The argument can be set out step by step:

1. Replacement is the original ship, because ships survive the gradual replacement of their parts.
2. Reassembly is the original ship, because ships survive being taken apart and put back together.
3. Identity is symmetric and transitive, so Replacement is Reassembly.
4. But Replacement and Reassembly are two ships, lying side by side.
5. So at least one premise is false.

In Ryan Wasserman's words: "Both arguments seem compelling, but together they imply that the ship survives twice over." Gallois calls it the best-known case of **asymmetrical fission**: each later ship has a claim on the original by a different relation, continuity of form or sameness of matter.

**The objection** to any quick answer is that each premise rests on a principle we use daily. Deny premise 1 and nothing survives repair; deny premise 2 and a watch taken apart for cleaning is a new watch.

**The replies** each pay a price. Hobbes said we must ask "by what name anything is called": a ship considered as matter is the same only while the matter is, so partial replacement makes it "partly the same, and partly not the same". On the **constitution view**, a ship is never identical with its planks; Replacement is the ship and Reassembly a new ship from old planks. **Relative identity**, associated with Peter Geach, says Replacement is the same *ship* as the original and Reassembly the same *collection of planks*; no single relation links all three, so transitivity is never broken. Chisholm, after Bishop Butler, held that in the "strict and philosophical" sense neither ship is the original, and Replacement is only in a "loose and popular" sense. **Deflationists** (Carnap, Putnam, Hirsch) say that all the facts about the planks are agreed, and the dispute is only over the word "ship".

{{image: Ise Grand Shrine | The Ise Grand Shrine in Japan is rebuilt every twenty years with new wood. Is it the same shrine?}}

The puzzle is not only European. The Chinese translation of a Mahāyāna treatise, the *Da zhidu lun*, tells of a traveller in the night whose body is torn off part by part by one demon while a second replaces each part with a corpse's, until he no longer knows who he is; Jing Huang and Jonardon Ganeri have studied it as a puzzle about personal identity.

```checkpoint
q: Why does Hobbes's version of the Ship of Theseus produce a contradiction?
a*: Because both ships seem to be the original, and identity is transitive, yet they are two ships.
a: Because Plutarch reported that the Athenians could not agree on whether the ship was the same.
x: Plutarch reports a disagreement, not a contradiction; Hobbes's second ship is what makes both answers seem true at once.
a: Because Leibniz's Law forbids any object from changing its parts.
x: Leibniz's Law says identicals share all properties; properly applied (with times included) it does not forbid change.
a: Because the planks of the reassembled ship are rotten.
x: The condition of the planks plays no part in the argument; the problem is that two ships each have a claim to be the original.
hint: Count the ships at the end, then apply what you know about identity.
why: If Replacement and Reassembly are both identical with the original, transitivity makes them identical with each other, but there are two of them. In Wasserman's words, the ship "survives twice over".
---
q: According to the Internet Encyclopedia of Philosophy, following David Sedley, what did Chrysippus conclude about Dion and Theon?
a: That Dion perishes and Theon survives.
x: This is where the Stanford Encyclopedia's statement of the puzzle's reasoning leads, not the answer IEP attributes to Chrysippus.
a: That both survive and share one body.
x: The puzzle assumes two individuals cannot occupy one place; Chrysippus did not accept two people in one body.
a*: That Dion survives and Theon perishes.
a: That neither existed in the first place.
x: That is closer to modern eliminativism; Chrysippus' answer kept one of the two.
hint: Ask whose foot was cut off.
why: Only Dion had the foot, so only Dion can lose it; Theon, unchanged, perishes. Sedley reads this as Chrysippus turning the Growing Argument against the Academic sceptics.
```

## The Statue and the Clay

The ship is a puzzle about one thing over time; the statue is about two things at one time. Aristotle already noticed that statues seem to differ from their matter (see *Aristotle*). Wasserman's modern version: on Monday a sculptor buys a lump of clay, Lump; on Tuesday she shapes it into a statue, David.

1. David did not exist on Monday.
2. Lump did exist on Monday.
3. If so, then by Leibniz's Law David is not identical to Lump.
4. So David is not identical to Lump.

Lump could also survive squashing; David could not. Yet the conclusion puts two objects in one place, which David Wiggins (1968) called "something which we ordinarily take to be impossible".

The most popular response accepts the conclusion. On the **constitution view**, "constitution is not identity": the statue is constituted by the clay and is "nothing over and above" it, but is not the same thing. Defenders include Wiggins, E. J. Lowe, Lynne Rudder Baker, Judith Jarvis Thomson and Kit Fine; Michael Burke called it "the standard account".

**The objection** is the **grounding problem**. Statue and clay are perfect duplicates, "right down to their subatomic structure". What makes one able to survive squashing and not the other? **The reply** points to a difference in kind (Wiggins), in relations (Baker: a statue is related to an "artworld"), or in history and intention (Burke). Critics answer that kinds only push the question back. Allan Gibbard (1975) sharpened it with **Lumpl and Goliath**: an artist makes a statue in two pieces and joins them, so statue and lump begin together, and later destroys both at once. They share all their history and relations, yet still seem to differ in what could happen to them.

Other replies deny a premise. **Eliminativists** deny that statues exist at all: Peter Unger held that only partless simples exist, van Inwagen (1990) that the only composite objects are living things; there are only "simples arranged statuewise". Burke denies premise 2: there is one object, whose persistence follows its "dominant kind", so sculpting destroys the original lump. Geach's relative identity denies premise 3.

A cat sharpens the puzzle. Let Tib be all of Tibbles except her tail. Cut off the tail: Tib and Tibbles now coincide, with different histories. One cat on the mat, or two? Noonan credits Wiggins (1968) with this version's first modern appearance and links it to Dion and Theon; Wasserman credits Geach. Unger's **problem of the many** (1980) generalises it: a cloud has no sharp edge, so countless collections of droplets have equal claim to be "the cloud". Vagueness itself is covered in *Paradoxes: the Liar, the Heap and Zeno*, but one argument belongs here. Gareth Evans (1978) reasoned that if it were indeterminate whether a is b, a would have a property b lacks (being *determinately* identical to a), so by Leibniz's Law they would be distinct: vagueness lies in our words, not in identity. Critics reply that this shows only that a and b are not determinately identical, not that they are determinately distinct.

## Enduring or Perduring?

Underneath these puzzles lies a question about what persisting is. In *On the Plurality of Worlds* (1986) Lewis introduced two terms, attributing them to Mark Johnston. A thing **perdures** if it persists by having different **temporal parts** at different times, as a road has different stretches in different places. A thing **endures** if it is wholly present at each time it exists. Perdurantists include Quine, Lewis and Theodore Sider; endurantists include Thomson, Geach, Chisholm and Lowe.

Lewis's main argument is the **problem of temporary intrinsics**. An intrinsic property is one a thing has in itself, not by its relation to anything else. Set out step by step:

1. Persisting things change their intrinsic properties: a plate is round at one time and square at another.
2. Nothing can be both round and square.
3. Saying the plate is "round *at* t1" turns shape into a relation between the plate and a time; but shape is intrinsic, not a relation.
4. Denying that other times exist (presentism) would avoid the problem, but at a price Lewis thought too high.
5. So the round thing and the square thing are different temporal parts of the plate. There is no more problem in an object having a round part and a square part than in someone being hot at the head and cold at the feet.

**The objection**: on this view nothing really changes. The whole plate is neither round nor square, and each temporal part never changes; as Sally Haslanger adds, only a cat-part, not the cat, is fat. **The reply** distinguishes timeless talk (the plate has a round part and a square part) from ordinary tensed talk (it *was* round and *is* square), which is all change requires. Endurantists answer step 3 their own way: make having a property a three-way relation of object, property and time, or treat time adverbially, so the plate is "round-at-t1-ly" (Johnston, Haslanger).

Perdurance helps with the earlier puzzles: the statue is a temporal part of the lump, and the two ships share early parts as two roads share a stretch. It fails for Lumpl and Goliath, who share every part. Endurantists add a modal objection: "I might have died when I was five", but a fifty-year sum of parts could not have lasted five years. A third view, **stage theory** (Sider; Katherine Hawley), says ordinary names pick out momentary stages, and past and future talk is made true by "temporal counterparts"; the price is that counting cats over time is not counting by identity. Some, Hawley reports, doubt the debate is substantive at all.

## Nothing Lasts a Moment: India and the Islamic World

The chariot argument, set out step by step in *The Buddha and Early Buddhist Philosophy*, says that a chariot is nothing over and above its arranged parts, and so is real only by convention; a person stands to the five aggregates as a chariot to its parts. In this chapter's terms it is an argument about composition. Abhidharma philosophers did not deny that parts are real; they denied that wholes such as chairs, pots and tables are, distinguishing the **substantially existent** (*dravyasat*) from the merely **nominally existent** (*prajñaptisat*). The same reasoning applies to "the same chariot" over time.

Vasubandhu (fourth to fifth century CE; see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*) pushed this to its limit in his commentary on the *Treasury of the Abhidharma* (*Abhidharmakośa*). His **momentariness argument**, as the Stanford Encyclopedia's Jonathan Gold sets it out, runs:

1. Change is impossible, since "it is not acceptable that it differs from itself".
2. All conditioned things are impermanent.
3. Destruction cannot have a cause, since a cause must produce something real and destruction is a non-existence.
4. So things perish by their own nature; and if it is their nature, they perish immediately upon coming into being.
5. So everything lasts only a moment. Apparent persistence is a stream of replacements, which modern interpreters often compare to the frames of a film.

Step 3, von Rospatt argues, was Vasubandhu's new twist. **The objection** comes from Nyāya (see *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*). The *Nyāya Sūtra* (2.1.35–36) argued that composite things have capacities beyond the collection of their parts, and that if a whole were only a heap of imperceptible atoms we could never perceive it; yet we do. **The reply** open to the Buddhist is that perceiving a whole is perceiving many parts under one convenient concept, as "milk" is built from separate impressions of sight, smell and taste, while causal streams explain apparent continuity.

A similar picture arose in Islamic theology. On Perler and Rudolph's account, al-Ash'arī held that God "rearranges the atoms that make up this world anew at every instant", and accidents last only a moment; later theologians embraced this as occasionalism (see *Al-Ghazālī, Averroes and the Quarrel over Reason*). Buddhist and Ash'arite both make persistence a series of momentary existences, explained by causal streams in one case and God's continual creation in the other; Descartes' cause that "as it were creates me afresh at this moment" is a European echo. The *Zhuangzi* takes a different attitude: Steve Coutinho reads it as picturing the world as a potter's wheel on which things are formed and ground down into new forms, with the sage identifying with "the greater flow", not "this particular body" (see *Mozi, the Daoists and the Legalists: the Hundred Schools*). Persistence is less a puzzle than a transformation to accept.

## Persons: the Hardest Case

All these puzzles become urgent when the thing is oneself. *Locke* sets out Locke's theory (1694) that a person is "a thinking intelligent Being, that has reason and reflection, and can consider it self as itself, the same thinking thing in different times and places", with Butler's objection and Thomas Reid's brave officer. One logical point matters here. The old general remembers the young officer, who remembers being flogged as a boy, but the general does not remember the boy. Memory is not transitive; identity is. So, Reid concluded, "the general is, and at the same time is not, the same person with him who was flogged at school." Later theorists replaced memory with **psychological continuity**: overlapping chains of causally connected mental states.

Buddhists faced the parallel question with the Personalists (Pudgalavādins), who held that the person is real but neither the same as nor different from the aggregates. Vasubandhu's "Refutation of the Person", the final chapter of his commentary, answers with a dilemma. Whatever is real is causally effective. If the person is uncaused, it is the eternal self of the non-Buddhists; if caused by the aggregates, it changes as they do and adds no continuity. So it is a conceptual construction. Memory needs no self: "the reason I remember my past is because my aggregates now are the causal result of the past aggregates." Nyāya replied, with Vātsyāyana and Uddyotakara, that one self cannot recollect another's experience, so recollection proves a lasting self. Whether Vasubandhu *reduces* persons or *eliminates* them, the question the early Buddhism chapter leaves open between Mark Siderits and Monima Chadha, turns on how much reality a "conceptual construction" keeps.

Modern philosophy added fission. Suppose your two brain hemispheres are transplanted into two bodies, Lefty and Righty.

1. Each is psychologically continuous with you.
2. Psychological continuity is sufficient for identity.
3. So you are Lefty and you are Righty.
4. Lefty is not Righty.
5. By transitivity, contradiction.

Defenders of continuity have two ways out. Lewis (1976) argued for **multiple occupancy**: there were two people all along, sharing earlier temporal parts. Shoemaker and Derek Parfit added a **non-branching** clause: continuity makes identity only if it does not divide, so fission is death. **The objection**: you would then survive if one hemisphere were destroyed but die if both survived, "the opposite of what we should expect".

**The reply** Parfit gave, in *Reasons and Persons* (1984), was that identity is not what matters. A teletransporter records your state, destroys your body and builds a replica on Mars: travel, or death and a copy? Parfit held that there is "no further fact"; what matters is psychological connectedness and continuity, **Relation R**, so fission is as good as ordinary survival. He found the view freeing:

```quote
My life seemed like a glass tunnel, through which I was moving faster every year, and at the end of which there was darkness. When I changed my view, the walls of my glass tunnel disappeared. I now live in the open air.
Derek Parfit · Reasons and Persons · 1984
```

Others reject psychological views. **Animalists** such as Eric Olson hold that each of us is a human organism, and offer the **too-many-thinkers argument**: the organism in your chair thinks; continuity theorists say you are not that organism; so two thinkers sit there, and you cannot know which you are. Bernard Williams ("The Self and the Future", 1970) told one case two ways: as a swap of psychologies between bodies, it suggests the person goes with the psychology; as "you will be tortured tomorrow, after your memories are replaced", it suggests you should still fear the pain. Williams found the second intuition stronger. These debates, with Hume's bundle, the Buddhist and Nyāya positions on the self, and narrative selves, continue in *Self and No-Self: Personal Identity East and West*.

```checkpoint
q: What is Lewis's "problem of temporary intrinsics"?
a: That we cannot know which properties of an object are intrinsic.
x: The problem is not about knowledge but about how one thing can have incompatible intrinsic properties.
a*: That one persisting thing seems to have incompatible intrinsic properties, such as being round and being square.
a: That intrinsic properties never change.
x: The problem starts from the opposite assumption: things do change their intrinsic properties, such as shape.
a: That two objects can share all their intrinsic properties.
x: That concerns whether indiscernible things must be identical, a different question from change.
hint: Think of the plate that is round and then square.
why: Lewis argued that relativising shape to times makes it a relation, not intrinsic, and that presentism costs too much; so the round and square things are different temporal parts.
---
q: What is the point of Vasubandhu's claim that destruction cannot have a cause?
a: It shows that things last forever.
x: It is used to prove the opposite: everything perishes as soon as it arises.
a: It proves that God destroys and re-creates the world at every instant.
x: That is the Ash'arite view; Vasubandhu's argument involves no creator.
a: It shows that the person is ineffable.
x: The Personalists called the person ineffable; Vasubandhu rejected the claim.
a*: If perishing is not caused, things must perish by their own nature, immediately upon arising.
hint: If nothing outside a thing destroys it, when does it perish?
why: A cause must produce something real, and destruction is a non-existence, so it is uncaused; things therefore perish by nature at once, and apparent persistence is a stream of momentary replacements.
```

## Further exploration

- **Katherine Hawley, *How Things Persist* (2001).** A clear, balanced survey of endurance and perdurance, defending stage theory.
- **Theodore Sider, *Four-Dimensionalism: An Ontology of Persistence and Time* (2001).** The main modern case for temporal parts.
- **Lynne Rudder Baker, *Persons and Bodies: A Constitution View* (2000).** The constitution view applied to persons.
- **Eric T. Olson, *The Human Animal: Personal Identity Without Psychology* (1997).** The classic statement of animalism.
- **Derek Parfit, *Reasons and Persons* (1984).** Part III is the modern classic on teletransportation, fission and what matters.
- **Mark Siderits, *Personal Identity and Buddhist Philosophy: Empty Persons* (2003).** Buddhist reductionism read alongside Parfit.
- **Ugo Zilioli, *Eliminativism in Ancient Philosophy: Greek and Buddhist Philosophers on Material Objects* (2024).** Greek and Buddhist arguments against ordinary objects side by side.$identity_master$,
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
  select $identity_quiz$[
    {"type": "mcq", "prompt": "According to Plutarch, under what heading did the philosophers discuss the Ship of Theseus?", "options": ["The question of things that grow", "The question of whether the gods exist", "The question of the best form of government", "The question of whether motion is possible"], "answerIndex": 0, "explanation": "In the Dryden translation revised by Clough, the ship 'became a standing example among the philosophers, for the logical question of things that grow'. Plutarch's Greek appears to name the ancient Growing Argument itself, so the ship was a case in the debate about growth.", "id": "q1"},
    {"type": "mcq", "prompt": "What does the constitution view say about a statue and the clay it is made of?", "options": ["They are numerically identical, one object under two names", "The statue does not exist; there are only particles arranged statuewise", "The statue is constituted by the clay and is nothing over and above it, yet is not identical with it", "The clay is destroyed when the statue is made, and a new lump comes into being"], "answerIndex": 2, "explanation": "'Constitution is not identity': on Wiggins's, Baker's and Thomson's view two objects share one place. Eliminativists (Unger, van Inwagen) deny the statue exists, and Burke's dominant-kinds view says sculpting destroys the original lump.", "id": "q2"},
    {"type": "mcq", "prompt": "Who introduced the terms 'endurance' and 'perdurance' in print, and to whom did he attribute them?", "options": ["Peter Geach, attributing them to Hobbes", "Theodore Sider, attributing them to Quine", "Derek Parfit, attributing them to Bernard Williams", "David Lewis, attributing them to Mark Johnston"], "answerIndex": 3, "explanation": "Lewis introduced the terms in On the Plurality of Worlds (1986), crediting Mark Johnston. A thing perdures if it persists by having different temporal parts at different times, and endures if it is wholly present at each time it exists.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the Nyāya Sūtra (2.1.35–36) argue against the Buddhist view of wholes?", "options": ["That wholes are illusions created by God at every instant", "That wholes are real: they have capacities beyond the collection of their parts, and we could not perceive them if they were heaps of imperceptible atoms", "That the chariot is identical with its axle", "That nothing lasts longer than a moment"], "answerIndex": 1, "explanation": "Nyāya held that composite substances are real wholes. If a whole were a mere heap of imperceptible atoms we could not perceive it at all, yet we do. The momentariness thesis is the Buddhist view Nyāya opposed; continual re-creation by God is the Ash'arite view.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Ship of Theseus puzzle in Hobbes's form as a numbered argument, and assess two of the main responses.", "rubric": "A strong answer sets out the premises: the repaired ship (Replacement) is the original because ships survive gradual replacement of parts; the custodian's rebuilt ship (Reassembly) is the original because ships survive disassembly and reassembly; identity is transitive and symmetric, so the two are one; but they are two ships; so a premise is false ('the ship survives twice over'). It notes Plutarch's origin of the puzzle and its link to the ancient Growing Argument. It assesses at least two responses with their costs: Hobbes's appeal to the name (matter vs form, 'partly the same'); the constitution view; Geach's relative identity (same ship vs same planks); Chisholm's strict versus loose identity; perdurance (shared early temporal parts); deflationism (Carnap, Hirsch: a verbal dispute).", "id": "q5"},
    {"type": "open", "prompt": "Compare Vasubandhu's momentariness argument with the Ash'arite doctrine of continual re-creation and with Nyāya's defence of real wholes and a recollecting self. What is each trying to explain?", "rubric": "A strong answer reconstructs Vasubandhu's argument: change would mean a thing differs from itself; conditioned things are impermanent; destruction cannot be caused because it is a non-existence; so things perish by nature immediately upon arising; so everything is momentary and persistence is a stream of replacements. It explains that Ash'arites also made persistence a series of momentary existences but explained it by God re-creating atoms and accidents at each instant (later occasionalism), while the Buddhists appealed to causal streams. It gives Nyāya's reply: wholes have capacities beyond their parts and are perceived (NS 2.1.35–36), and recollection or recognition ('that is the very man I saw') requires one lasting subject, since one self cannot recollect another's experience. Credit mention of Vasubandhu's 'Refutation of the Person' and the milk analogy.", "id": "q6"}
  ]$identity_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/identity-and-change', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
