-- Possibility and Necessity — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/possibility-and-necessity @ research/advanced/read.
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
    'philosophy/metaphysics/possibility-and-necessity',
    'research',
    'advanced',
    'read',
    $modality_master$> **Things could have been otherwise, and some things could not. But what does "could" mean, what makes such claims true, and how could we ever know them?** This chapter sorts out the different kinds of possibility and necessity, works step by step through Diodorus Cronus's ancient Master Argument, follows the idea of possibilities as alternatives at the same moment through Latin and Islamic theology, and asks how far Indian and Chinese thinkers spoke of necessity at all. It then turns to the modern debates: Quine's attack on necessity and the reply it drew, David Lewis's many worlds and their rivals, Kripke and Fine on essence, and whether conceiving something shows that it is possible.

## Many Kinds of "Cannot"

Philosophers call claims about what could, must or could not be **modal** claims. Boris Kment's entry in the Stanford Encyclopedia of Philosophy (SEP) opens with ten "cannot" sentences, each true in a different sense: "No one can be both a bachelor and married" (because of what the words mean); "You could not have been born of different parents" (because of your nature); "Nothing can travel faster than light" (a law of nature); "You cannot castle if your king is in check" (the rules of chess); "Fred cannot be the killer" (the evidence shows he is innocent). In Kment's dialogue, Caesar says: "The doors were unlocked. I could have left the palace." Cleopatra: "True. But then again, you couldn't have left the palace. That would have been wrong, given that you promised to meet me here." Both are right: one may accept a modal claim in one sense and reject it in another.

Three senses matter most. Something is **logically possible** if it is consistent with the laws of logic, and logically necessary if it follows from them; **physically possible** if consistent with the laws of nature. It is **metaphysically possible** if it is true in at least one **possible world**, a complete way things could have been, and **metaphysically necessary** if it is true in all of them. What is true in some worlds but not all is **contingent**. On the usual "nesting" picture, whatever is physically possible is metaphysically possible, and whatever is metaphysically possible is logically possible. Some deny that it is distinct from epistemic modality (Chalmers) or from physical necessity (Shoemaker).

Other modalities behave differently. **Epistemic** modality concerns evidence: "Fred must have stolen the book" says that what we know rules out the alternatives. **Deontic** modality concerns obligation. Here the principle that what is necessary is true fails: in Kment's words, it is "both morally and legally necessary ... that no murders are committed, even though murders are in fact being committed."

This chapter is about metaphysical modality; *Reason, Experience and Innate Ideas* shows how necessity differs from the a priori and the analytic.

## Ancient Pictures of the Possible

Simo Knuuttila, the historian of medieval modality, distinguishes four ancient ways of thinking about possibility: by frequency, as potency, as an earlier opportunity that may close, and as freedom from contradiction. None treated possibilities as alternatives existing *at the same moment* as what actually happens. On the **statistical model**, "what is necessary is always actual, what is impossible is never actual and what is possible is at least sometimes actual". How far Aristotle held it is disputed. Lovejoy (*The Great Chain of Being*, 1936) named the related **principle of plenitude**: the ancient habit, in Plato, Aristotle, the Stoics and Plotinus, of assuming that all kinds of possibility are eventually realised.

Aristotle (see *Aristotle*) also offered a test by non-contradiction: "What is possible is that for which, if the actuality of what is said to have the possibility obtains, then nothing impossible will result" (*Metaphysics* IX.3). He reports the Megarians as saying that "someone who is not building cannot build, but someone who is building can when building"; possibility exists only in actuality. Aristotle objected that this rules out change, since someone sitting could never stand. His puzzle of tomorrow's sea battle, and whether a truth about the future makes it necessary, is treated in *Free Will and Determinism*.

## Diodorus's Master Argument

Diodorus Cronus came from Iasos in Caria. His dates are uncertain: Matthew Duncombe's SEP entry has him dying around 284 BCE, another SEP entry gives "ca. 340–280", a third says he flourished around 300. His five daughters, Menexene, Argeia, Theognis, Artemisia and Pantacleia, "are all said to have been logicians". He defined the possible as "that which either is or will be <true>" and the necessary as "that which is true and will not be false" (as Boethius reports). So if "Dio goes to Corinth" never will be true, it is impossible, which many thought endangered freedom.

His defence of this view was called *ho kurieuôn logos*, the "master" or "ruling" argument. (It has nothing to do with Berkeley's "Master Argument", a later nickname discussed in *Berkeley and Hume*.) The original is lost; Epictetus preserves its starting points:

```quote
Every past truth is necessary; the impossible does not follow from the possible; there is a possible truth which neither is true nor will be.
Epictetus, reporting Diodorus Cronus · Discourses 2.19.1, as quoted in Matthew Duncombe's SEP entry · c. 108 CE
```

These three, Epictetus says, conflict; Diodorus used the plausibility of the first two to reject the third. Set out:

1. Every past truth is necessary: what has happened can no longer not have happened.
2. The impossible does not follow from the possible.
3. Suppose there is a possible truth that neither is true nor ever will be.
4. The three cannot all be held.
5. So, keeping 1 and 2, all possible truths either are true or will be true.

Duncombe offers a "tentative, non-technical" illustration. I did not train in gymnastics as a child, so I am not and never will be an Olympic gymnast. Suppose it is possible that I will be one. That implies that I trained from childhood. But I did not, and since that is now past, it is impossible that I did (premise 1). So an impossibility follows from a possibility, against premise 2. So it is not possible that I will be an Olympic gymnast.

**Objection.** Ancient philosophers attacked the premises. Panthoides, Cleanthes and Antipater of Tarsus rejected the first: not every past truth is necessary. Chrysippus, though a determinist about fate, kept the first and denied the second, allowing that something impossible can follow from something possible. The Stoics generally rejected the argument (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*).

**Reply.** Each escape has a cost. No ancient logician thought the argument invalid, and denying either premise means giving up something that looks obvious. Whether Diodorus meant it as an argument for fatalism, a defence of his definition, or a puzzle to be solved is debated. Modern reconstructions, pioneered by Arthur Prior in 1955, disagree about how it ran; Diodorus's ideas about time and possibility helped inspire Prior's tense logic.

## Alternatives at the Same Moment

According to Knuuttila, a new idea entered Latin thought in the early twelfth century, in discussions by Abelard and Gilbert of Poitiers influenced by Augustine's picture of God choosing between alternative histories: possibilities as **simultaneous alternatives**. Duns Scotus made it explicit: "I do not call something contingent because it is not always or necessarily the case, but because its opposite could be actual at the very moment when it occurs." Knuuttila presents Scotus as the innovator of a modal theory of alternatives; Pasnau (2020) criticises that thesis. *Scotus, Ockham and the Late Medieval Debates* gives his "synchronic contingency" of the will.

The Islamic world had its own version of the contrast. For Avicenna everything except the First Principle is possible in itself (*mumkin*) and necessary only through its cause (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*). His modal theory, Frank Griffel says, "follows the statistical model of Aristotle": fire necessarily burns cotton because it always has and always will. The Ashʿarite theologians, by contrast, developed "an understanding that is closer to our modern view of the modalities as referring to synchronic alternative states of affairs". Al-Ghazālī's teacher al-Juwaynī wrote that anyone who sees a building knows it is "a possibility that comes into being", its actual state chosen "from among its possible states", and that it would have been "not impossible in the intellect had it not been built".

Al-Ghazālī built on this. A world where fire does not burn cotton, Griffel writes, "can be conceived in our minds, which means it is a possible world. God, however, did not choose to create such an alternative possible world." Kukkonen (2000), as Griffel quotes him, argued that al-Ghazālī shifts the locus of a thing's actual existence "from the plane of the actualized reality to the plane of mental conceivability" (*Al-Ghazālī, Averroes and the Quarrel over Reason* sets out his argument about causes). For al-Ghazālī modalities are judgements of the mind, not features of reality. He also held that this world is the best possible: "there is in possibility nothing more wondrous than what is", a claim that provoked a long debate and, though the comparison is ours, strikingly close to Leibniz's.

For Leibniz, a world is a collection of **compossible** things, things whose complete concepts involve no contradiction with one another, and merely possible individuals exist in God's mind. The SEP judges that he had "all the tools" for possible-worlds semantics without developing it. Whether he held every property of an individual to be essential to it is one disputed reading (see *Leibniz*). Spinoza went the other way: "in nature there is nothing contingent", and things could have been produced "in no other order"; whether he was a thoroughgoing necessitarian is debated in *Spinoza*.

## Necessity without Possible Worlds? India and China

Tom Tillemans warns against finding possible worlds everywhere. The Buddhist logician Dharmakīrti (dates disputed; Frauwallner put him around 600–660 CE) held that a connection between essential natures guarantees that an effect will not occur without its cause: real smoke must come from fire, or it is only "pseudo-smoke". But, Tillemans writes, "there certainly is no development of a modal logic of necessity and possibility and talk of possible worlds in Dharmakīrti, nor in Indian philosophy generally for that matter." His key terms mean "certainty" (*niścaya*) and "non-deviation" (*avyabhicāra*), and "a more likely interpretation" is epistemic: justified confidence about the actual world, not necessity across worlds. Partly, Tillemans notes, this is because Indian philosophers had "no truck with propositions" as abstract objects. Others, such as John Dunne and Iwata (both 2004), do use the word "necessity", so the reading is a live debate (see *Causation* and *Logic across Traditions*).

The Navya-Nyāya logician Gaṅgeśa gave a role to ***tarka***, which Stephen Phillips renders "hypothetical reasoning": not itself a source of knowledge, but able "to shift the balance of what it is rational to accept", chiefly by revealing a defeater for the denial of a general rule. To someone who doubts that smoke always comes with fire, the reply is: then why do you "resort to fire for smoke, to food to allay hunger"?

The Mohist *Canons* of classical China used a notion of the "permissible" (*kě*) and the "perverse" (*bèi*), "intertwined with a rough notion of logical consistency", applied to assertions (what can acceptably be said), not to propositions as abstract objects. Their word *bì*, "necessary, must", Chris Fraser notes, "does not appear to distinguish between logical necessity, causal necessity or constant conjunction, epistemic certainty, and various forms of obligation."

```checkpoint
q: In Diodorus's Master Argument, which premise did he give up?
a*: That there is a possible truth which neither is nor will be true.
a: That every past truth is necessary.
x: Diodorus kept this premise; Panthoides, Cleanthes and Antipater rejected it.
a: That the impossible does not follow from the possible.
x: Diodorus kept this one too; it was Chrysippus who denied it.
a: That the three premises conflict.
x: Their conflict was common ground; the question was which to give up.
hint: He used the plausibility of two of them against the third.
why: Keeping the first two, Diodorus concluded that every possible truth either is or will be true. In Duncombe's illustration, someone who never trained as a child can now never be an Olympic gymnast.
---
q: According to Tillemans, how should Dharmakīrti's claim that smoke "must" come from fire be read?
a: As a claim about necessity in all possible worlds.
x: Tillemans says there is no talk of possible worlds in Dharmakīrti or Indian philosophy generally.
a: As a deontic claim about what one ought to infer.
x: The debate is between metaphysical and epistemic readings, not a deontic one.
a*: As justified certainty about the actual world, though Dunne and Iwata translate his terms as "necessity".
a: As a law of logic like non-contradiction.
x: The guarantee rests on causal connection between natures, not on logic alone.
hint: His key terms mean "certainty" and "non-deviation".
why: Tillemans reads Dharmakīrti epistemically, partly because Indian philosophers had no truck with propositions as abstract objects; Dunne and Iwata use the vocabulary of necessity, so the reading is disputed.
```

## Quine's Challenge and Barcan Marcus

The modern logic of possibility (*Formal Logic: Propositions, Predicates and Proofs*) began with formal systems, such as Lewis and Langford's of 1932, but with no account of meaning comparable to Tarski's for ordinary logic, which fed Quine's suspicion of it. Possible worlds "failed to gain any real traction among philosophers until the 1960s" (SEP). The lineage runs from Carnap (1947) to Hintikka, Bayart and Saul Kripke, whose first paper on it he wrote at seventeen; Kanger's 1957 work belongs to the story too.

Ruth Barcan (later Barcan Marcus, 1921–2012) published the first construction of quantified modal logic in 1946 (Carnap developed one independently the same year) and proved the necessity of identity in 1947. In 1961 she called proper names "tags": "This tag, a proper name, has no meaning. It simply tags." *Analytic Philosophy since 1950* reports Quentin Smith's controversial claim that she anticipated Kripke's theory of names. Roberta Ballarin's SEP entry, which does not mention Smith, gives a measured answer to whether she anticipated direct reference for ordinary names: "neither an unqualified yes nor a simple no".

Quine's argument (1943) ran: the number of planets is nine; nine is necessarily greater than seven; yet it does not follow that the number of planets is necessarily greater than seven. So substituting one expression for another that refers to the same thing fails inside "necessarily". Quine also held that quantifying into such contexts, saying of some *thing* that it is necessarily so, was meaningless. Smullyan (1947–48) replied, with Barcan Marcus's endorsement, that "the number of planets" is a description, not a name, and has two readings. "There is one thing that numbers the planets, and *it* is necessarily greater than seven" is true: necessity is ascribed to a thing, **de re**. "Necessarily, there is one thing that numbers the planets and it is greater than seven" is false: necessity is ascribed to a statement, **de dicto**. Quine also argued that whether a thing has a property essentially depends on how it is described. The essentialist answer is that the number two itself, however described (say, as "the number of Martian moons"), could not have failed to be greater than one.

## What Are Possible Worlds? Lewis and His Rivals

If possibility is truth in some possible world, what are worlds? David Lewis (1941–2001) gave the boldest answer. In *On the Plurality of Worlds* (1986) he argued, as Brian Weatherson and Ted Parent reconstruct it:

1. Talk of possibilities makes our best theories of modality, counterfactuals, the content of belief and properties much better.
2. We should believe in the entities our best theories need, as scientists believe in unobservable particles.
3. So there are possible worlds.
4. Abstract substitutes for worlds fail.
5. So the worlds are concrete.

On this **modal realism** a world is a maximal spatiotemporally connected whole; other worlds are as concrete as ours but have no spatial, temporal or causal link with it. "Actual" works like "here": each world is actual to its inhabitants. The payoff is a genuine reduction: modal words become talk about worlds, defined without modal terms. Lewis argued that no rival explains so much so economically.

**Objection: the incredulous stare.** Most people, told that somewhere there really are dragons and unicorns, simply stare. Lewis conceded that his theory "does disagree, to an extreme extent, with firm common sense opinion about what there is".

**Reply.** Lewis judged that the worlds "ought to be accepted as true. The theoretical benefits are worth it." The cost in belief buys a great deal of theory.

A sharper objection concerns individuals. For Lewis each thing exists in only one world; "Humphrey could have won" means that some **counterpart** of Humphrey, the losing candidate in 1968, someone in another world who closely resembles him, won. Kripke objected that then we are "not talking about something that might have happened to Humphrey, but to someone else", and Humphrey does not care about someone else. Lewis replied that it is Humphrey himself who might have won; the question is only how he has that modal property, and he has it by having a winning counterpart. (Compare the "temporal counterparts" of stage theory in *Identity, Change and Persons*.)

Most rivals are **actualists**, holding that everything there is is actual, and treat worlds as abstract: Robert Adams's maximal consistent sets of propositions (1974), Alvin Plantinga's maximal possible states of affairs (1974), Robert Stalnaker's "ways things could have been" (1976). Such worlds are defined with "possible" or "consistent", so they cannot reduce modality; their defenders reply that they aim instead to understand worlds through modality. Gideon Rosen's **modal fictionalism** (1990) offers a middle way: "possibly p" is true if, according to the fiction of many worlds, p is true, much as Holmes lives at 221B Baker Street according to the stories. It escapes the stare but must say what holds where the story is silent.

## Essence: Kripke and Fine

Kripke's *Naming and Necessity* (lectures 1970, printed 1972, book 1980) revived **essentialism**, the doctrine, in Quine's definition, that some attributes of a thing may be "essential to the thing, and others accidental". Names are **rigid**: they pick out the same object in every possible world where it exists, whereas "the brightest non-lunar object in the evening sky" might have picked out Mars. From this follows the necessary a posteriori ("Hesperus is Phosphorus"), covered in *Reason, Experience and Innate Ideas* and *Analytic Philosophy since 1950*.

Kripke also endorsed **origin essentialism**: an object could not have had a radically different origin. Salmon argued for it with a table:

1. If table *a* was made from matter *m*, and a table could be made from wholly different matter *m\**, then it is possible that *a* is made from *m* while some table *b* is made from *m\**.
2. No table has two wholly different material origins.
3. Any possible table originally made from *m\** is *b*.
4. So *a* could not have been made from *m\**.

**Objection.** Salmon himself admits that premise 3 is false as stated (the same matter could make a different kind of table, and Ship-of-Theseus cases intervene) and weakens it; critics then pressed a "recycling" problem (McKay 1986) and a "tolerance" problem. And surely we can imagine this wooden table made of ice. **Reply.** Kripke answered the second worry: to imagine that "is not to imagine this table as made of…ice, but to…imagine another table, resembling this one in all external details made of…ice." Salmon seeks a weaker premise 3.

Kit Fine (1994) attacked what he called the usual view, that essence is a matter of necessity:

1. On the modal account, a property is part of something's essence if it necessarily has that property whenever it exists.
2. Necessarily, if Socrates exists he belongs to {Socrates}, the set whose only member is Socrates.
3. So on the modal account, belonging to {Socrates} is essential to Socrates.
4. But that is no part of what Socrates is, any more than being distinct from the Eiffel Tower.
5. Yet having Socrates as a member *is* part of what {Socrates} is. The connection is necessary both ways, but essential only one way.
6. So essence is not a modal notion.

Fine then reversed the order: metaphysical necessities are true in virtue of the natures of things.

**Objection.** Improve the modal account rather than abandon it: count only properties a thing has intrinsically (Denby 2014), and since Socrates is not intrinsically a member of {Socrates}, the case disappears. **Reply.** Many follow Fine in taking essence, in the sense of *what a thing is*, as basic; the SEP calls this sense "dominant among analytic metaphysicians today". Others, such as Mackie (2020), resist Fine's reversal. There is a historical twist: Fine said the modal account had become "the usual" view without naming anyone who held it, and the SEP's authors stay neutral on whether Fine meant to attribute it to Kripke and Plantinga, both of whom later said they never held it.

```checkpoint
q: How did Smullyan and Barcan Marcus answer Quine's argument from the number of planets?
a: By denying that nine is necessarily greater than seven.
x: They accepted that; the issue was the phrase "the number of planets".
a*: By treating "the number of planets" as a description with a true de re reading and a false de dicto reading.
a: By agreeing that necessity makes no sense when applied to things.
x: That was Quine's conclusion, which they rejected.
a: By claiming that possible worlds are concrete.
x: That was Lewis's later view and played no part in their reply.
hint: Is "the number of planets" a name?
why: Read de re, the thing that numbers the planets is necessarily greater than seven; read de dicto, it is not necessary that whatever numbers the planets exceeds seven. Substitution fails only on the second reading.
---
q: What does Fine's Socrates and {Socrates} example show?
a: That Socrates could not have existed without being a philosopher.
x: The example concerns set membership, not Socrates's occupation.
a: That sets do not exist.
x: The argument assumes the singleton exists.
a: That necessary truths are known a posteriori.
x: That is Kripke's thesis about identities such as Hesperus and Phosphorus.
a*: That a property can be necessary to something without being part of what it is.
hint: The necessity runs both ways; does the essence?
why: Socrates necessarily belongs to {Socrates}, but that is not part of what he is; it is part of what the set is. So necessity cannot capture essence, and Fine proposed explaining necessity by essence instead.
```

## Can We Know What Is Possible?

How do we know any of this? An old answer is that we can conceive it.

```quote
'Tis an establish'd maxim in metaphysics, that whatever the mind clearly conceives includes the idea of possible existence, or in other words, that nothing we imagine is absolutely impossible.
David Hume · A Treatise of Human Nature 1.2.2.8 · 1739
```

Hume used the maxim, for example, to argue that "whatever has a beginning has also a cause of existence" is "neither intuitively nor demonstrably certain". Descartes's argument that mind and body are distinct relied on a related principle (see *Descartes*). Stephen Yablo (1993) proposed a modest version: "to imagine an X is thereby to enjoy the appearance that an X could exist", evidence that can be overturned, as perception can.

The principle drives the **zombie argument**, used by Chalmers against physicalism, the view that everything is physical. A zombie would be physically identical to you but have no conscious experience:

1. Zombies are conceivable.
2. Whatever is conceivable is possible.
3. So zombies are possible, and consciousness is something over and above the physical.

The SEP calls this "clearly ... valid"; the fight is over the premises.

**Objection.** Conceivability concerns what we know; possibility concerns how things are. Before the discovery one could conceive Hesperus existing without Phosphorus, yet that is impossible. If the link between brain and experience is like the link between water and H2O, discovered empirically yet necessary, zombies may be conceivable and still impossible.

**Reply.** Chalmers distinguishes ways of conceiving. Considered as a hypothesis about how the actual world is, "water is not H2O" is coherent; considered as a description of a counterfactual world, given that water is H2O, it is impossible. Ideal conceivability of the first kind, he argues, does entail possibility of the first kind. His reply is a dilemma: either zombies' conceivability shows them possible in the full sense, and materialism is false, or a view known as Russellian monism is true. Critics answer that "anti-zombies", physical duplicates made conscious by the physical facts, seem equally conceivable. The debate continues in *The Mind–Body Problem* and *Consciousness*.

Timothy Williamson (2007) takes another route: "the ordinary cognitive capacity to handle counterfactual conditionals carries with it the cognitive capacity to handle metaphysical modality." We already judge that if the bush had not been there the rock would have ended in the lake; modal knowledge is a special case. Barbara Vetter goes further, holding, in the SEP's paraphrase, that we can literally see potentialities, so that modal knowledge is distinctively empirical. From Diodorus's gymnast to Chalmers's zombie, the question remains whether the possible is a feature of the world, of our minds, or of the stories we tell.

## Further exploration

- **Saul A. Kripke, *Naming and Necessity* (1980).** The lectures that introduced rigid designation, the necessary a posteriori and origin essentialism.
- **David Lewis, *On the Plurality of Worlds* (1986).** The full defence of modal realism and counterpart theory, with replies to the incredulous stare.
- **John Divers, *Possible Worlds* (2002).** A survey of realism, abstract worlds and fictionalism.
- **Penelope Mackie, *How Things Might Have Been: Individuals, Kinds, and Essential Properties* (2006).** A critical study of essentialism that defends a minimal version.
- **Tamar Szabó Gendler and John Hawthorne (eds), *Conceivability and Possibility* (2002).** Essays on modal knowledge, including Chalmers's "Does Conceivability Entail Possibility?".
- **Simo Knuuttila, *Modalities in Medieval Philosophy* (1993).** The statistical model and the turn to simultaneous alternatives.
- **Eric L. Ormsby, *Theodicy in Islamic Thought: The Dispute over al-Ghazālī's 'Best of All Possible Worlds'* (1984).** The long debate over al-Ghazālī's claim that nothing more wondrous is possible.$modality_master$,
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
  select $modality_quiz$[
    {"type": "mcq", "prompt": "In Kment's dialogue, Caesar says he could have left the unlocked palace and Cleopatra says he couldn't have, since he had promised to meet her. What does the exchange show?", "options": ["That one of them must be contradicting the other", "That a modal claim can be accepted in one sense and rejected in another, here physical and moral", "That moral necessity implies that the act is actually done", "That only logical possibility is real possibility"], "answerIndex": 1, "explanation": "Both are right: leaving was possible given the unlocked doors but ruled out morally by the promise. Deontic (moral) necessity does not imply truth: it is morally necessary that no murders are committed, though murders are committed.", "id": "q1"},
    {"type": "mcq", "prompt": "Which of these is the position Griffel attributes to the Ashʿarite theologians, in contrast to Avicenna?", "options": ["Modalities refer to synchronic alternative states of affairs, with God choosing which to bring about", "What is necessary is what is always actual", "Nothing is contingent, since all things follow from the divine nature", "Possibility is a property only of propositions in a language"], "answerIndex": 0, "explanation": "Avicenna followed Aristotle's statistical model (fire burns cotton because it always has and always will). The Ashʿarites, as al-Juwaynī's example of the building shows, understood the actual state as chosen from alternatives that were possible at the same time. 'Nothing is contingent' is Spinoza's view.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Kripke object to David Lewis's counterpart theory with the example of Humphrey?", "options": ["That Humphrey could not have won, because the past is necessary", "That possible worlds are abstract states of affairs", "That names are not rigid designators", "That the theory makes 'Humphrey might have won' about someone else, whom Humphrey would not care about"], "answerIndex": 3, "explanation": "On Lewis's view Humphrey exists only in our world; his possibilities are carried by counterparts. Kripke objected that we would then be talking about something that might have happened to someone else. Lewis replied that it is Humphrey himself who might have won, by having a winning counterpart.", "id": "q3"},
    {"type": "mcq", "prompt": "In the zombie argument, what is the a posteriori physicalist's objection?", "options": ["That zombies are not even conceivable", "That the argument is invalid", "That conceivability is epistemic and possibility metaphysical, so zombies may be conceivable yet impossible, as Hesperus without Phosphorus once seemed conceivable", "That consciousness is a law of logic"], "answerIndex": 2, "explanation": "The SEP calls the argument clearly valid, so the objection targets the second premise. If the link between physical states and experience is necessary but known only a posteriori, like Hesperus and Phosphorus or water and H2O, conceiving its absence does not show its absence possible. Chalmers replies with distinctions between kinds of conceivability and a dilemma.", "id": "q4"},
    {"type": "open", "prompt": "Set out Diodorus's Master Argument as numbered premises and conclusion, illustrate it with Duncombe's example of the Olympic gymnast, and explain how Chrysippus and the Stoic critics answered it.", "rubric": "A strong answer gives the three statements Epictetus reports (every past truth is necessary; the impossible does not follow from the possible; there is a possible truth that neither is nor will be true), notes that they conflict, and that Diodorus kept the first two to conclude that every possible truth is or will be true. It explains the gymnast example: supposing it possible that I will be a gymnast implies I trained as a child, which is now impossible, so an impossibility would follow from a possibility. It reports that Panthoides, Cleanthes and Antipater rejected the first premise and Chrysippus the second, that no ancient logician thought the argument invalid, and that its purpose (fatalism, a definition of possibility, or a sophism) and original form are debated. Credit for noting the name clash with Berkeley's 'Master Argument', the uncertain dates, his daughters as logicians, or Prior's tense logic.", "id": "q5"},
    {"type": "open", "prompt": "Present Kit Fine's argument from Socrates and {Socrates} that essence is not a modal notion. Give one reply on behalf of a modal account and explain the historical question about who held the view Fine attacked.", "rubric": "A strong answer states the modal account (a property is essential if the object necessarily has it whenever it exists), notes that Socrates necessarily belongs to {Socrates}, so the account counts this as essential, though intuitively it is no part of what Socrates is, whereas having Socrates as a member is part of what the set is: an asymmetry necessity cannot capture. It notes Fine's reversal: necessities are true in virtue of essences. It gives a reply such as Denby's intrinsic modal account (Socrates is not intrinsically a member of the set) or other refined accounts, and notes that many now take essence as basic. It explains that Fine did not name anyone holding the 'usual' view and that the SEP's authors stay neutral on whether Fine meant to attribute it to Kripke and Plantinga, both of whom later said they never held it.", "id": "q6"}
  ]$modality_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/possibility-and-necessity', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
