-- Causation — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/causation @ research/advanced/read.
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
    'philosophy/metaphysics/causation',
    'research',
    'advanced',
    'read',
    $causation_master$> **What is it for one thing to make another happen?** This chapter treats causation as a live problem rather than a museum piece. It recaps how Aristotle, Avicenna, al-Ghazālī, Malebranche, Hume and Kant set up the question of necessary connection, then works through three arguments in detail: the Indian quarrel over whether an effect already exists in its cause, J. L. Mackie's account of causes as "INUS conditions", and David Lewis's counterfactual theory with the pre-emption cases that trouble it. It ends with probabilities, interventions and experiments, physical processes, Russell's attack on "the law of causality", and the suggestion that "cause" names more than one thing.

## Three Questions in One

We say that the drought caused the famine and the short circuit caused the fire. Alex Broadbent's survey in the Internet Encyclopedia of Philosophy (IEP) distinguishes three projects in studying such claims: the **ontological** (what causation is, in the world), the **semantic** (what "cause" means) and the **epistemological** (how we find causes out). They are usually pursued together.

**Type** causation is general ("Drowsy driving causes crashes"); **token** causation is particular ("The drought caused the famine"), and philosophers disagree about which is more basic. Most theories try to reduce causation to something else: regularities, counterfactuals (claims about what would have happened), probabilities or physical processes. One influential family, built on interventions, does not. Broadbent calls this lack of consensus "great news if you are a philosopher": "a field of engagement that has not settled into trench warfare".

The oldest systematic account is Aristotle's. As the chapter on *Aristotle* explains, he held that "we think we do not have knowledge of a thing until we have grasped its why, that is to say, its cause", and that there are four irreducible kinds of answer. For a bronze statue, the bronze is the **material** cause; the shape is the **formal** cause; the **final** cause is the end for whose sake the model, mould and pouring are done. Asked for the **efficient** cause, where the change came from, we would say "the sculptor"; but Andrea Falcon's entry in the Stanford Encyclopedia of Philosophy (SEP) notes that for Aristotle the most precise efficient cause of the statue is the art of bronze-casting, not the individual artisan. Because *aitia* answers a why-question, Falcon suggests "it can be useful to think of a cause as a certain type of explanation". Modern theories of causation are, broadly, theories of the efficient cause alone.

## Necessary Connection: from Avicenna to Kant

Avicenna (c. 980–1037) widened the efficient cause into "the principle and giver of existence, as in the case of God with respect to the world" (*Metaphysics of the Healing*). He held that an efficient cause necessitates its effect and exists together with it, causal priority being ontological, not temporal. Why must it necessitate? Because if, given the cause, the effect still "hangs in the balance" between existing and not, the cause has "no greater claim to be the cause than not to be the cause". So fire necessitates burning in cotton "when it is in contact with (dry) cotton and any obstacles have been removed" (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*).

That view was al-Ghazālī's main target in the seventeenth discussion of *The Incoherence of the Philosophers*, which *Al-Ghazālī, Averroes and the Quarrel over Reason* sets out step by step. In brief: "The connection between what is habitually believed to be a cause and what is habitually believed to be an effect is not necessary, according to us" (Marmura's translation). A connection is necessary only if its severing is inconceivable; fire touching cotton without burning it is conceivable; and we observe only that cotton burns *when in contact with* fire, not that fire burns it. Averroes replied that one relation can hinder another, as talc protects against flame: "But one need not therefore deny fire its burning power so long as fire keeps its name and definition." That chapter gives the objection to this reply and the debate over whether al-Ghazālī was an occasionalist. Kara Richardson's SEP entry adds that the deepest disagreement concerns what necessity is.

**Occasionalism**, the view that God is the only true cause and creatures merely the occasions of His acting, returned in Europe with Nicolas Malebranche (1638–1715), whose *Search after Truth* appeared in 1674–75 (see *Descartes* and *Leibniz*). His argument was short: "A true cause as I understand it is one such that the mind perceives a necessary connection between it and its effect." The mind perceives such a connection only between the will of an infinitely perfect being and what it wills. So only God is a true cause.

{{image: David Hume | David Hume, whose two definitions of a cause, one by regularity and one by counterfactual, became the seeds of two modern theories.}}

Hume's account, the SEP notes, has "antecedents in Malebranche", though Hume was critical of crucial Malebranchean points. *Berkeley and Hume* tells the story: no single case shows necessity, repetition adds nothing to the objects, and the expectation it breeds in us is projected onto things by the mind's "great propensity … to spread itself on external objects". Hume then defined a cause twice. The first definition, in the *Enquiry concerning Human Understanding* (1748), carries a sentence that chapter leaves out:

```quote
We may define a cause to be an object followed by another, and where all the objects, similar to the first, are followed by objects similar to the second. Or, in other words, where, if the first object had not been, the second never had existed.
Hume · An Enquiry concerning Human Understanding, §7 (EHU 7.29) · 1748, punctuation as in the Stanford Encyclopedia of Philosophy
```

The first sentence is a **regularity** definition; the second, offered as the same thing "in other words", is a **counterfactual** one. Peter Menzies and Helen Beebee find it "difficult to understand how Hume could have confused" them; Hume never explored the second. Each became the seed of a modern theory. Mary Shepherd's *Essay upon the Relation of Cause and Effect* (1824) answered Hume that whatever begins to exist must have a cause. Kant, crediting Hume with interrupting his "dogmatic slumber", argued in the Second Analogy that "All alterations take place in accordance with the law of the connection of cause and effect" (B232) holds a priori; on the majority reading this secures only that every event has *some* cause, leaving particular causal laws to induction (see *Kant*).

## Does the Effect Exist before Its Cause?

Classical Indian philosophers asked a different question. Causation for them was typically "the origin of a thing", not a relation between events; the standard example is a potter making a pot from clay. Is the pot something new? *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* gives the five reasons in Īśvarakṛṣṇa's *Sāṅkhya-Kārikā* (about 350 CE) for the Sāṃkhya answer, **satkāryavāda**, the "existent effect" theory: the effect already exists, latent, in its material cause. Amita Chatterjee's SEP reconstruction gives the case in its sharpest form.

1. A cause produces an effect only by being related to it.
2. A relation needs two relata, two things that are related.
3. A non-existent effect cannot be one of the relata.
4. So if the effect did not already exist, the cause could not be related to it and could not produce it.
5. Besides, if unrelated causes could produce effects, anything could come from anything: "why does a pot not arise from threads?" Yet oil comes from oilseeds, not from sand.
6. So the effect exists in its material cause before production, and "causal efficiency is nothing other than the existence of the effect in the material cause in a latent form."

**Objection.** The Nyāya-Vaiśeṣika opponent says that a specific *potency* in the cause, not a pre-existing effect, explains why oil comes from oilseeds. Ferenc Ruzsa states the deeper difficulty in the IEP: "Understood literally, this is not tenable—if the cause existed, why was it not perceived prior to the point called its production?"

**Reply.** Where does that potency exist, Sāṃkhya asks, and how can it be related to an effect that does not exist? The same problem returns. As for perception, causal operation "enables a potent cause to manifest the latent effect": production is manifestation, not creation. Ruzsa himself reads the doctrine more modestly, as "a moderate form of determinism": "there is nothing absolutely new in the product".

Nyāya-Vaiśeṣika's **asatkāryavāda**, the "non-existent effect" theory, is the opposite. A cause is "an invariable, unconditional antecedent of an effect", and "Every effect is preceded by its prior absence, so each effect is a new production." A cloth is a new whole with three kinds of cause: its threads, their conjunction, and the weaver and loom. "Causally irrelevant" factors are excluded: a sculptor's hair colour invariably precedes her sculptures but does not cause them. (To compare, as this chapter does on its own account: Sāṃkhya stretches Aristotle's material cause until the effect is already in it; Nyāya's "invariable antecedent" is a regularity definition, and the sculptor's hair is the problem of irrelevant regularities that returns below.)

Buddhists began from dependent arising (*pratītyasamutpāda*), in the IEP's rendering: "when this exists, that comes to be; with the arising of this, that arises" (see *The Buddha and Early Buddhist Philosophy*). Nāgārjuna (about 150–250 CE) asked how anything could arise if things had *svabhāva*, intrinsic natures. His *Mūlamadhyamakakārikā* opens, in Dan Arnold's rendering: "There do not exist, anywhere at all, any existents whatsoever, arisen either from themselves or from something else, either from both or altogether without cause." *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* sets out the argument; its first two horns resemble Sāṃkhya and Nyāya. Jan Westerhoff stresses that the conclusion is not that causation is impossible, but that cause and effect lack intrinsic natures and exist in mutual dependence.

```checkpoint
q: What is the core of the Sāṃkhya argument, in Chatterjee's reconstruction, that the effect pre-exists in its material cause?
a*: That a cause produces only by being related to its effect, and a relation needs two existing relata.
a: That we can see the pot inside the clay before the potter begins.
x: The opponent's objection is precisely that the effect is not perceived before production; Sāṃkhya says it is latent.
a: That every effect is preceded by its prior absence.
x: That is the Nyāya-Vaiśeṣika definition of an effect, the opposite theory.
a: That God creates each effect anew at every moment.
x: That is occasionalism, Malebranche's view; Sāṃkhya locates the effect in its material cause.
hint: What does producing something require the cause to stand in?
why: Producing requires a relation; a relation needs two relata; so a non-existent effect could not be produced. Sāṃkhya adds that otherwise anything could come from anything.
---
q: According to Westerhoff, what does Nāgārjuna's argument in MMK 1.1 conclude?
a: That nothing is ever caused, so the world is an illusion.
x: Westerhoff stresses that Nāgārjuna does not conclude that causation is impossible.
a: That effects arise from both themselves and other things.
x: This is one of the four options the verse denies.
a*: That cause and effect lack intrinsic natures and exist only in mutual dependence.
a: That the Sāṃkhya theory of the existent effect is correct.
x: Arising "from themselves", the option closest to Sāṃkhya, is one of those rejected.
hint: Which shared premise do all four options rely on?
why: All four horns assume that cause and effect have svabhāva. Since each fails, the assumption is false: cause and effect are empty, existing in dependence on each other.
```

## Regularities: Mill and Mackie

Return to Hume's first sentence. The **Humean Regularity Theory**, as Holger Andreas and Mario Günther's SEP entry states it, says that c causes e if and only if c is contiguous with e, c comes first, and all events of type C are followed by events of type E; "There is nothing more to causation". It struggles with one-off causes, such as the meteor that killed the dinosaurs, and with regularities without causation: a cock's crow regularly precedes sunrise.

John Stuart Mill (1843) replied that the real cause is the whole set of factors, present and absent, that together suffice for the effect, and that the regularity must be a law, not an accident like the cock and the dawn. But the same kind of effect can arise from many different sufficient sets. J. L. Mackie (1917–1981), in "Causes and Conditions" (1965) and *The Cement of the Universe* (1974), built on that point. His example is a burnt house.

1. A house can burn down through several different clusters of conditions: a short circuit, oxygen and no sprinkler; or an arsonist, petrol and oxygen; or a burning tree falling on the house.
2. Each cluster is sufficient for the fire, but none is necessary, because another cluster could have done the job.
3. Within the cluster that actually occurred, the short circuit is not sufficient by itself, but it is non-redundant: remove it and the rest of that cluster would not have produced the fire.
4. When we say "the short circuit caused the fire", the factor we pick out has exactly this profile, against what Mackie called a **causal field**, "a background against which the causing goes on".
5. So a cause is at least an **INUS condition**: an **I**nsufficient but **N**on-redundant part of an **U**nnecessary but **S**ufficient condition.

(The IEP reads the N as "necessary part"; the SEP prefers "non-redundant".) The account explains why we single out one factor among many.

**Objection.** Mackie, adapting an example of Russell's, admitted a damaging case. Factory hooters in Manchester sound at five o'clock, and workers in London regularly go home just after. On his analysis the Manchester hooters come out as an INUS condition of the Londoners stopping work, though the two merely share a common cause. Jeffrey's barometer (1969) has the same shape: a fall in pressure causes both the barometer's drop and the storm.

**Reply.** Mackie conceded that the theory is incomplete and added **causal priority**: roughly, c is prior to e if an agent could prevent e by preventing c, and silencing the Manchester hooters would not keep Londoners at work. (His final version: c was fixed when e was still unfixed.) The IEP adds that the barometer's fall is no INUS condition anyway, since "Storms happen even when no barometer is there". Still, since David Lewis's work of 1973, the SEP observes, "counterfactual theories of causation have risen and regularity theories have more and more fallen into disuse".

## Counterfactuals: Lewis and Pre-emption

David Lewis (1941–2001) developed Hume's second sentence. In "Causation" (*Journal of Philosophy*, 1973) he wrote: "We think of a cause as something that makes a difference, and the difference it makes must be a difference from what would have happened without it." He made "would have happened" precise with **possible worlds**, complete ways things might have been (see *Possibility and Necessity*). The theory runs:

1. For two distinct actual events c and e, e **causally depends** on c if and only if, had c not occurred, e would not have occurred.
2. These counterfactuals must not "backtrack" (reasoning that had the barometer not fallen, the pressure would have differed, so no storm), so joint effects of a common cause do not depend on each other.
3. Causal dependence is sufficient for causation, but not necessary.
4. So causation is the **ancestral** of dependence: c causes e if and only if there is a chain of events from c to e, each depending on the one before.

Step 4 is there for **pre-emption**, where a back-up cause would have produced the effect if the actual cause had not. In *early* pre-emption, assassin B is ready to fire but stops on seeing A fire. The death does not depend on A's aiming, since B would have fired; but it depends on A's bullet in mid-flight, which depends on A's firing, so a chain links them.

**Objection: late pre-emption.** This chapter uses Ned Hall's version from "Two Concepts of Causation" (2004), in which both throw. (Gallow's SEP entry tells a different Suzy-and-Billy story, with Suzy staying home as back-up, to illustrate early pre-emption.) Suzy and Billy throw rocks at a bottle. Suzy's rock arrives first and shatters it; Billy's rock flies through the space where the bottle stood a moment before.

1. Suzy's throw caused the shattering.
2. On Lewis's theory, then, there is a chain of stepwise dependence from her throw to the shattering.
3. But had she not thrown, Billy's rock would have shattered the bottle, so the shattering does not depend on her throw.
4. Nor does it depend on her rock at any point in its flight: remove that stage, and Billy's rock still does the job. Billy's rock is cut off only by the shattering itself, too late to build a chain.
5. So the theory wrongly says Suzy's throw was not a cause.

Pre-emption, as the SEP puts it citing Paul and Hall, has proved "the biggest bugbear for Lewis's theory".

**Reply.** One might make events "fragile", so that a slightly later shattering would be a different event; Lewis rejected that, since eating dinner before taking poison would then cause the death by changing its timing. He settled instead on **influence** (2000): roughly, c causes e if alterations of c would alter e. Alter Suzy's throw and the shattering alters; alter Billy's and nothing changes. The cost is that Billy's throw has *some* influence too, and influence can generate spurious causes, as in Bennett's case of December rain that delays a forest fire.

Other cases press harder. When a firing squad's bullets strike together (**symmetric overdetermination**), perhaps "it was the whole firing squad that was the cause"; Lewis set such cases aside. Cases of **double prevention**, preventing a preventer, such as Hall's boulder and hiker, lead some to doubt that causation passes along every chain. Hall concluded that we have two concepts: **dependence**, which counterfactuals capture, and **production**.

```checkpoint
q: Why is Hall's bottle case a problem for Lewis's original theory?
a: Because Suzy and Billy throw at exactly the same moment and both rocks hit the bottle.
x: That would be symmetric overdetermination; in Hall's case Suzy's rock arrives first and Billy's misses.
a*: The shattering depends neither on Suzy's throw nor on any stage of her rock's flight, so no chain of dependence links them, yet her throw was the cause.
a: Because Billy decides not to throw when he sees Suzy throw.
x: That is an early pre-emption story, like the one in Gallow's SEP entry; Lewis's chains handle it.
a: Because Lewis's theory says Billy's throw caused the shattering.
x: The theory does not count Billy's throw a cause either; the trouble is that it fails to count Suzy's.
hint: Ask what would have happened at each stage if Suzy's rock had been removed.
why: Billy's rock is a back-up that is cut off only by the shattering itself, so removing any stage of Suzy's process still leaves the bottle broken. Lewis later turned to influence to handle such late pre-emption.
---
q: What did Mackie add to his INUS account to deal with the Manchester hooters?
a: The requirement that every cause be a necessary condition of its effect.
x: The INUS account deliberately allows causes that are unnecessary, since other clusters could produce the effect.
a: A counterfactual test borrowed from Lewis.
x: Mackie's priority condition was his own, and his 1974 book predates Lewis's later work on influence.
a: The rule that a cause must be spatially contiguous with its effect.
x: Contiguity belongs to the simple Humean regularity theory; it is not what Mackie added.
a*: Causal priority: roughly, c is prior if an agent could prevent e by preventing c, or c was fixed when e was unfixed.
hint: Would silencing the Manchester hooters keep the Londoners at work?
why: The hooters and the London workers share a common cause. Mackie admitted the theory was incomplete without an asymmetry, and added causal priority.
```

## Probabilities, Interventions and Experiments

Smoking causes lung cancer though most smokers never get it. **Probabilistic** theories therefore say that a cause raises the probability of its effect. But a falling barometer raises the probability of a storm. Reichenbach's *The Direction of Time* (1956) answered with **screening off**: once you know the pressure, the barometer tells you nothing more about the storm. His **Common Cause Principle** says that when two things are correlated and neither causes the other, a common cause screens them off.

**Simpson's paradox** shows how treacherous raw correlations are. In a kidney-stone study in the *BMJ* (1986), Treatment A did better than B for small stones (93 per cent against 87) and for large ones (73 against 69), yet worse overall (78 against 83), because most of the large-stone cases got A. As Cartwright (1979) and Skyrms (1980) pointed out, probability-raising reveals causes only when the right background factors are held fixed.

**Interventionist** theories build on that point. The idea, as James Woodward's SEP entry puts it, is that "if C is genuinely a cause of E, then if I can manipulate C in the right way, this should be a way of manipulating or changing E." Judea Pearl, whose *Causality* (2000) the SEP counts among the most influential works on causal models, distinguishes *observing* a variable's value from *setting* it, written do(X = x). Let Z be the pressure, X the barometer reading, Y the storm. Observing a low reading raises the chance of a storm. Force the needle down with your thumb, and you cut the arrow from Z to X: the chance of a storm is unchanged. Had it changed, X would be a cause of Y.

Not any meddling counts. An intervention on X must be the only thing setting X, must not affect Y by another route (a drug can aid recovery by the **placebo** effect alone), must not share a cause with Y, and must leave Y's other causes alone. This is why randomised controlled trials are prized, from the Medical Research Council's 1948 streptomycin trial for tuberculosis onwards: assigning treatment by a randomising device balances "both known and unknown prognostic factors". Where trials are impossible, epidemiologists weigh an association using Austin Bradford Hill's nine "viewpoints" (1965), such as strength, consistency and temporality. Leaping "hastily" from succession to cause is the *post hoc* fallacy of *Informal Fallacies and Everyday Reasoning*; *Induction, Probability and Inference to the Best Explanation* treats inference from evidence.

The standard objection is circularity: "intervention" is itself causal. Woodward grants that nothing is reduced but denies that the circle is vicious, since saying what counts as an intervention on X needs no information about whether X causes Y; that is how experiments teach us something new. The IEP's caution is that interventionism "does not tell us precisely what causation is".

## Processes, Physics and Pluralism

Another family looks for causation in physics. Wesley Salmon (1925–2001), in *Scientific Explanation and the Causal Structure of the World* (1984), located it in **causal processes** that can transmit a "mark", a local modification; a spot of light sweeping across a wall cannot, so it is a **pseudo-process** and may outrun light without breaking relativity. Phil Dowe's **conserved quantity theory** (1992; *Physical Causation*, 2000) says: "A causal interaction is an intersection of world lines which involves exchange of a conserved quantity"; a causal process is the path through space-time of an object possessing one. Billy's rock exchanges nothing with the bottle. The trouble is prevention: when James Bond shoots down a missile heading for Blofeld's compound, no process links Bond to Blofeld's survival. Dowe, Beebee and Hall reply that prevention is not causation in the full sense; counterfactual theorists disagree.

Bertrand Russell doubted that science needs the notion at all. In "On the Notion of Cause", delivered on 4 November 1912, he argued that "same cause, same effect" is trivial or false, since a fully specified cause never recurs, and that science uses functional laws instead (see *Frege, Russell and the Birth of Analytic Philosophy*).

```quote
The law of causality, I believe, like much that passes muster among philosophers, is a relic of a bygone age, surviving, like the monarchy, only because it is erroneously supposed to do no harm.
Bertrand Russell · "On the Notion of Cause", Proceedings of the Aristotelian Society 13 · 1912–13
```

His target was "the law of causality", universal determinism, not every causal claim, and in 1948 he offered his own theory of "causal lines". Neo-Russellians such as Huw Price, Hartry Field and John Norton still doubt that causes belong in fundamental physics; "causal imperialists" hold that scientific explanation is causal through and through.

Perhaps the lesson of the counterexamples is that "cause" is not one thing. Besides Hall's two concepts, Godfrey-Smith argues that the word masks an underlying diversity, and Anscombe and Cartwright held that our basic causal concepts are "thick" ones, such as kicking and pushing. Aristotle, with his four irreducible kinds of cause, would not have been surprised. Causation returns in *The Mind–Body Problem*, on whether minds can cause anything, and in *Free Will and Determinism*.

## Further exploration

- **L. A. Paul and Ned Hall, *Causation: A User's Guide* (2013).** A systematic survey built around pre-emption and the other test cases that every theory must face.
- **J. L. Mackie, *The Cement of the Universe: A Study of Causation* (1974).** The INUS account, the causal field and causal priority, in Mackie's own words.
- **James Woodward, *Making Things Happen: A Theory of Causal Explanation* (2003).** The leading statement of the interventionist theory.
- **Judea Pearl and Dana Mackenzie, *The Book of Why: The New Science of Cause and Effect* (2018).** An accessible account of causal diagrams and the do-operator.
- **R. J. Hankinson, *Cause and Explanation in Ancient Greek Thought* (1998).** Aristotle's causes and their Greek background.
- **Frank Griffel, *Al-Ghazālī's Philosophical Theology* (2009).** Includes a close reading of the seventeenth discussion on causation.
- **Jan Westerhoff, *Nāgārjuna's Madhyamaka: A Philosophical Introduction* (2009).** A clear guide to Nāgārjuna's arguments, including the critique of causation.$causation_master$,
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
  select $causation_quiz$[
    {"type": "mcq", "prompt": "According to Andrea Falcon's SEP entry, what is, for Aristotle, the most precise efficient cause of a bronze statue?", "options": ["The art of bronze-casting", "The bronze itself", "The shape of the statue", "The purpose of honouring someone"], "answerIndex": 0, "explanation": "Falcon notes that Aristotle names the art of bronze-casting, not the individual artisan, as the most precise efficient cause. The bronze is the material cause, the shape the formal cause, and the end for whose sake the work is done the final cause.", "id": "q1"},
    {"type": "mcq", "prompt": "What does the second sentence of Hume's first definition of a cause ('Or, in other words, where, if the first object had not been, the second never had existed') add?", "options": ["A restatement of constant conjunction in the same terms", "A definition of cause by the mind's expectation", "A counterfactual definition, quite different from the regularity definition before it", "A proof that every event has a cause"], "answerIndex": 2, "explanation": "Menzies and Beebee note that this is the first explicit counterfactual definition of causation and find it hard to see how Hume could confuse it with his regularity definition. The expectation definition is Hume's second definition; the claim that every event has a cause is Kant's Second Analogy.", "id": "q2"},
    {"type": "mcq", "prompt": "In Mackie's burnt-house example, why is the short circuit an INUS condition?", "options": ["Because it is both necessary and sufficient for the fire", "Because it is an insufficient but non-redundant part of a condition that is unnecessary but sufficient for the fire", "Because it is part of the causal field against which the fire occurs", "Because it regularly follows fires"], "answerIndex": 1, "explanation": "The short circuit cannot cause the fire alone but is non-redundant within its cluster (with oxygen and no sprinkler); that cluster is sufficient but not necessary, since an arsonist or a falling burning tree could also have done it. The causal field is the background, such as oxygen being present.", "id": "q3"},
    {"type": "mcq", "prompt": "In the barometer example, what shows that the barometer reading is not a cause of the storm, on the interventionist view?", "options": ["The reading and the storm are never correlated", "The barometer is made of glass and mercury", "The reading comes after the storm", "Setting the reading by intervention, which cuts its link to air pressure, leaves the chance of a storm unchanged"], "answerIndex": 3, "explanation": "Observing a low reading does raise the probability of a storm, because both depend on pressure. An intervention, do(X = low), breaks the arrow from pressure to barometer, and the correlation vanishes. Had it persisted, the barometer would count as a cause.", "id": "q4"},
    {"type": "open", "prompt": "Set out the Sāṃkhya argument for satkāryavāda (the 'existent effect' theory), give the Nyāya-Vaiśeṣika alternative, and explain the main objection and the Sāṃkhya reply.", "rubric": "A strong answer explains that in Indian thought causation is typically the origin of a thing (pot from clay). It gives Chatterjee's steps: a cause produces only by being related to its effect; a relation needs two relata; a non-existent effect cannot be related; otherwise anything could come from anything (why not a pot from threads; oil from oilseeds, not sand); so the effect pre-exists latently in its material cause. It states Nyāya's asatkāryavāda: a cause is an invariable, unconditional antecedent; every effect is preceded by its prior absence and is a new production (cloth with threads, conjunction and weaver as causes). It gives the objections (potency, not pre-existence; Ruzsa: if it existed, why was it not perceived?) and the replies (where would the potency exist?; causal operation manifests the latent effect), and may mention Ruzsa's 'moderate determinism' reading or Nāgārjuna's rejection of both arising from self and from other.", "id": "q5"},
    {"type": "open", "prompt": "Explain Lewis's counterfactual theory of causation and how late pre-emption, in Hall's bottle-throwing version, threatens it. How did Lewis respond, and what problems does the response face?", "rubric": "A strong answer gives Lewis's idea that a cause makes a difference; defines causal dependence (had c not occurred, e would not have), notes the ban on backtracking counterfactuals, and explains causation as the ancestral (a chain of dependence), which handles early pre-emption (the assassin who desists). It describes Hall's case (Suzy's rock arrives first and shatters the bottle; Billy's flies through where the bottle was) and shows that the shattering depends neither on Suzy's throw nor on any stage of her rock's flight, so no chain exists. It gives responses: fragile events (rejected by Lewis because of the dinner-and-poison case), and influence (alterations of Suzy's throw alter the shattering, Billy's do not), and the costs (Billy's throw has some influence; spurious causes such as rain delaying a fire). Credit mention of symmetric overdetermination, transitivity worries, or Hall's two concepts of dependence and production.", "id": "q6"}
  ]$causation_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/causation', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
