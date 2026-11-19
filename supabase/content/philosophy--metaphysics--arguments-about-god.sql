-- God: Arguments For and Against — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/arguments-about-god @ research/advanced/read.
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
    'philosophy/metaphysics/arguments-about-god',
    'research',
    'advanced',
    'read',
    $god_master$> **Can reason show whether God exists, and if it cannot, may we believe anyway?** This chapter sets out the classic arguments for God in their strongest modern forms, Plantinga's modal ontological argument, the kalām argument and fine-tuning, each with its best objection and reply. It sets the Indian debate over a creator beside the Western one, weighs religious experience and Pascal's Wager, asks whether belief needs evidence at all, and ends with the arguments from divine hiddenness and religious diversity. It argues for no verdict.

## What Would Count as Success?

**Theism** is belief in a personal God, usually understood as all-powerful, all-knowing and perfectly good; **atheism** denies that such a God exists. **A priori** arguments, above all the ontological ones, start "from premises which are supposed to derive from some source other than observation of the world—e.g., from reason alone", as the Stanford Encyclopedia of Philosophy (SEP) puts it. **A posteriori** arguments, cosmological and design, start from facts about the world: that it exists, that it began, that it is ordered.

What should such an argument achieve? Few modern defenders claim proof. Richard Swinburne distinguishes arguments whose premises merely raise the probability of God's existence ("C-inductive") from those that make it more probable than not ("P-inductive"). Alvin Plantinga said that his own ontological arguments "cannot, perhaps, be said to prove or establish their conclusion. But since it is rational to accept their central premise, they do show that it is rational to accept that conclusion" (*The Nature of Necessity*, 1974). Later he argued that belief in God can be rational without arguments at all. So there are three questions: is there a sound proof, is there good evidence, and is evidence even required?

## Ontological Arguments

The ontological argument tries to show that God exists from the very idea of God. Anselm's version and Gaunilo's "Lost Island" parody are set out in *Early Scholasticism: Anselm, Abelard and the Universities*; Descartes's in *Descartes*. Leibniz added that the proof fails "unless one first shows that the idea of a supremely perfect being is coherent", and argued that perfections, being unanalysable, cannot be shown to conflict (see *Leibniz*).

Kant's objection is followed in *Kant*:

```quote
Being is evidently not a real predicate, that is, a conception of something which is added to the conception of some other thing. It is merely the positing of a thing, or of certain determinations in it.
Immanuel Kant, trans. J. M. D. Meiklejohn · Critique of Pure Reason, A598/B626 · 1781
```

A hundred real thalers contain no more than a hundred imagined ones; otherwise, Kant says, my concept "would not express the entire object". Sources count his objections differently (the SEP's two entries find three and four), and Plantinga (1966) doubted that they touch Anselm's own version. Russell observed that "it is much easier to be persuaded that ontological arguments are no good than it is to say exactly what is wrong with them".

**The modal ontological argument.** In the twentieth century Hartshorne, Malcolm and Plantinga revived the argument using the logic of possibility and necessity (see *Possibility and Necessity*). Plantinga defines a being as **maximally excellent** in a possible world if it is omnipotent, omniscient and morally perfect there, and **maximally great** if it is maximally excellent in *every* possible world. Maximal greatness therefore includes necessary existence. In the Internet Encyclopedia of Philosophy's (IEP) schematic form:

1. The concept of a maximally great being is self-consistent.
2. If so, there is at least one possible world in which a maximally great being exists.
3. So there is such a possible world.
4. If a maximally great being exists in one possible world, it exists in every possible world.
5. So a maximally great being, God, exists in every possible world, including the actual one.

Step 4 relies on a system of modal logic called **S5**. In plain words, S5 says that what is possible does not vary from world to world. If it is possible, from where we stand, that a necessarily existing being exists, then that possibility holds from every world; and a being that exists necessarily in any world exists in all of them. So "possibly necessary" collapses into "necessary".

**Objection.** The SEP calls the attack on the first premise "perhaps the most important objection". Run the argument in reverse: possibly, God does not exist; if God exists, God exists necessarily; so, by the same S5 reasoning, necessarily God does not exist. Given S5, "possibly God exists" and "possibly God does not exist" cannot both be true, yet they "seem epistemically on par". Without a reason to prefer one, the SEP concludes, the argument is "dialectically toothless". Some also doubt that S5 captures metaphysical possibility.

**Reply.** Defenders look for a **symmetry breaker**: a reason, such as Leibniz's claim that perfections cannot conflict, to think maximal greatness coherent. But many such reasons are not a priori, so the argument turns into a different one; the debate, the SEP reports, "has centred around symmetry breaking". Plantinga's fallback is his modest aim: if accepting the premise is rational, so is accepting the conclusion.

## Cosmological Arguments

Cosmological arguments begin with the existence of the world; the SEP traces the earliest Western version to Plato's *Laws*. In the Islamic world they took two forms. The philosophers (*falāsifa*) argued from contingency: Avicenna's "Proof of the Truthful" (see *Falsafa: al-Kindī, al-Fārābī and Avicenna*) shows the world depending at every moment on a being necessary through itself, even if it had no beginning; Aquinas took up this line (see *Thomas Aquinas*). The theologians (*mutakallimūn*), drawing on John Philoponus, argued instead that the world must have begun. Maimonides' proofs are in *Jewish Philosophy: from Saadia to Maimonides*.

Leibniz gave the contingency argument its modern form with the **principle of sufficient reason** (PSR): "no fact can be real or existing and no statement true without a sufficient reason for its being so and not otherwise" (*Monadology* §32, as the SEP renders it). The reason for the whole series of contingent things cannot lie inside the series, so it lies in a necessary being, God. Three famous objections followed.

The first is Hume's, spoken by Cleanthes against Demea's a priori proof in the *Dialogues concerning Natural Religion*:

```quote
Did I show you the particular causes of each individual in a collection of twenty particles of matter, I should think it very unreasonable should you afterwards ask me what was the cause of the whole twenty.
David Hume (Cleanthes) · Dialogues concerning Natural Religion, Part IX · 1779
```

Explain each part, Hume says, and the whole is "sufficiently explained"; grouping the parts into a whole is "an arbitrary act of the mind". Rowe named this the "Hume-Edwards Principle" and rejected it.

The second is Russell's, in his 1948 BBC debate with Copleston: the universe needs no explanation; it is "just there, and that's all". He also charged a fallacy of composition: that each thing has a cause does not show that the whole does. Koons replied that we generalise about classes without inspecting every member.

The third is Kant's. The cosmological argument, he said, hides "a nest of dialectical presumptions" and, to show that its necessary being is the most perfect being, quietly relies on the ontological argument. One reply is that the first stage already establishes a necessary being, and needs only one that in fact depends on nothing (factual necessity), not one whose non-existence is a contradiction.

This bears on the question "Who created God?". If God is factually necessary, defenders say, the demand to explain God "is out of place"; J. L. Mackie answered that such a God still invites the question why God exists.

## The Kalām Argument

The theologians' argument, defended by al-Ashʿarī, al-Juwaynī and al-Ghazālī and rejected by Avicenna and Averroes, who held the world eternal (see *Al-Ghazālī, Averroes and the Quarrel over Reason*), was revived by William Lane Craig in *The Kalām Cosmological Argument* (1979). Craig's formulation:

1. Everything that begins to exist has a cause of its existence.
2. The universe began to exist.
3. So the universe has a cause of its existence.
4. No scientific explanation, in terms of physical laws and initial conditions, can account for the very beginning, since these are part of the universe.
5. So the cause must be personal.

For premise 1, Craig appeals to "the metaphysical intuition that something cannot come out of nothing": "No one sincerely believes that things, say, a horse or an Eskimo village, can just pop into being without a cause." Note what the premise does not say. It covers only what *begins*; a beginningless God needs no cause, so "who caused God?" misfires here.

For premise 2, Craig argues that an actually infinite collection cannot exist, and a beginningless past would be one. Craig uses **Hilbert's Hotel**, from a 1924–25 lecture by the mathematician David Hilbert. A hotel with infinitely many rooms is full. When a new guest arrives, everyone moves from room *n* to room *n*+1, freeing room 1; when infinitely many arrive, everyone moves from room *n* to room 2*n*, freeing all the odd rooms. A full hotel takes in infinitely more. Since such things are absurd, there can be no actual infinite, and the past had a beginning. Craig adds the scientific evidence of the Big Bang.

**Objection.** These are paradoxes, not contradictions. For Cantorian mathematicians, matching one-to-one with a part of itself is a *defining* feature of an infinite set, noticed as early as Galileo; the hotel shows only that infinite collections behave unlike finite ones, and Craig begs the question by applying finite intuitions to them. Feser adds that, on **presentism**, the view that only the present exists, past events do not exist all at once as hotel rooms do. Others deny that the Big Bang was an event in time at all, or point to quantum physics, where things seem to arise without determinable cause: Davies described a universe emerging from "an excited vacuum state".

**Reply.** Craig answers that the critics beg the question in their turn, and that a vacuum is not nothing: quantum events still have causal conditions, and "most of the available interpretations" of quantum mechanics "are fully deterministic". The SEP concludes that much turns on whether quantum indeterminacy belongs to the world or only to our knowledge. Step 5 is contested separately. Martin objected that "for all he shows, there may have been trillions of personal agents"; Morriston, that a timeless intention to create would yield an eternal universe just as a non-personal cause would. Craig replied that a personal agent must also choose to exercise its power.

```checkpoint
q: In Plantinga's modal ontological argument, what does the step from "possibly God exists" to "God exists" rely on?
a*: The logic S5, in which what is possible does not vary from world to world, so a possibly necessary being is necessary.
a: Kant's claim that existence is not a real predicate.
x: Kant's claim was an objection to ontological arguments, not a step in Plantinga's.
a: Leibniz's principle of sufficient reason.
x: The PSR belongs to the cosmological argument from contingency.
a: The observation that the universe began to exist.
x: The modal argument is a priori; it uses no facts about the world.
hint: Maximal greatness includes existence in every possible world.
why: In S5, if a necessarily existing being is possible from here, that possibility holds from every world, so the being exists in all. The symmetry objection runs the same logic in reverse.
---
q: Why does the kalām argument not invite the reply "then what caused God?"
a: Because Craig accepts that God has a cause.
x: Craig holds God to be uncaused.
a: Because Hume showed that wholes need no cause beyond their parts.
x: Hume's point is an objection to cosmological arguments, not a defence.
a*: Because its first premise covers only things that begin to exist, and God is held to be beginningless.
a: Because Hilbert's Hotel proves God is infinite.
x: The hotel is used against an infinite past, not to prove anything about God.
hint: Read premise 1 carefully.
why: The question would bite only against a principle that everything has a cause, which the kalām argument does not use.
```

## Design and Fine-Tuning

Design arguments infer a designer from order, classically by analogy: a natural thing resembles a human artefact; the artefact was designed; like effects have like causes. Hume's objections, that the analogy is weak and the designer might be finite, imperfect or "a committee", are covered in *Berkeley and Hume*; even his sceptic conceded that "the cause or causes of order in the universe probably bear some remote analogy to human intelligence". Kant thought it yields at most "an architect of the world", not a creator.

{{image: William Paley | William Paley, whose *Natural Theology* (1802) opens with a watch found on a heath.}}

William Paley's *Natural Theology* (1802) begins with a stone and a watch found on a heath: the stone might have lain there forever, but the watch, its parts "framed and put together for a purpose", must have had a maker. So with nature: "there is precisely the same proof that the eye was made for vision as there is that the telescope was made for assisting it." Paley is usually read as arguing by analogy, but the SEP reads him as inferring design directly from contrivance, in watch and nature alike, perhaps to escape Hume's attack on analogies. Darwin, who studied Paley at Cambridge, wrote in 1859 that he had "hardly ever admired a book more". Natural selection could account for much or all of the biological order Paley admired, yet, as the SEP notes, "undercutting and explaining away are not necessarily the same thing".

**Fine-tuning.** What many regard as the strongest modern version, the SEP reports, starts not from biology but from physics. Had gravity been slightly stronger relative to electromagnetism, stars would be small and short-lived; were the strong force about 50 per cent stronger, hydrogen would have burned early. Theory predicts a vacuum energy between 10⁵⁰ and 10¹²³ times the actual one, yet a value only a few orders of magnitude larger would forbid galaxies. In the SEP's Bayesian form:

1. The constants, laws and initial conditions of the universe are right for life.
2. If there is no designer, this is very improbable, given how narrow the life-permitting ranges are.
3. If there is a powerful, good designer, it is not far from certain.
4. So life-permitting conditions are evidence for design: they are more probable on design than without it.
5. Unless our prior probabilities strongly favour no designer, the balance of probability favours design.

**Objection: observation selection.** Sober argues that we could not observe a universe hostile to life. As Brandon Carter put it in 1974, "our location in the universe is necessarily privileged to the extent of being compatible with our existence as observers". Given that we exist, life-friendly constants were certain on either hypothesis.

**Reply: the firing squad.** John Leslie imagines a prisoner facing a firing squad who finds himself alive after all have fired. He could only observe this if he survived, yet surely he should suspect they meant to miss.

**Objection: the multiverse.** If there are many universes with varying constants, some will permit life, and observers will find themselves only in those. The fine-tuning is then expected.

**Reply: the inverse gambler's fallacy.** Hacking (1987) argued that inferring many earlier trials from one remarkable outcome is a fallacy. Roger White charges the multiverse argument with "supposing that the existence of many other universes makes it more likely that this one—the only one that we have observed—will be life-permitting". McGrath answered that the better analogy is someone admitted to the casino *only* when the remarkable outcome occurs, and the debate continues. Swinburne folds fine-tuning into a cumulative probabilistic case, with consciousness and religious experience, concluding that theism is more probable than not (see *Induction, Probability and Inference to the Best Explanation*).

## The Indian Debate

Indian philosophers argued over a creator, Īśvara, with equal rigour. The Nyāya school's main proof, in Udayana's *Nyāyakusumāñjali* (late tenth or eleventh century), is a design inference: "Things like the earth have a maker as their cause, because they are products". *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* sets it out with its critics. Like Paley, it reasons from things known to be made, such as pots, to things not known to be; but where Paley stresses contrivance, Udayana relies on the bare fact of being produced.

Udayana also gave, in the SEP's words, "a very abbreviated version" of the cosmological argument (*Nyāyakusumāñjali* 1.4). Things in the universe come into existence on one occasion and not another, so they depend on causes. An infinite regress of causes could be admitted only with evidence for it; lacking that, we should posit a non-dependent cause, God. To the objection that a bodiless God cannot act, Nyāya replied that God could assume a body, and need not create as humans do. Unlike Avicenna, who allowed that causes might be infinite, Udayana puts the burden of proof on the believer in a regress.

The critics were formidable. The Buddhist Dharmakīrti (dates disputed; c. 600–660 on one estimate) argued that a permanent thing could produce nothing: if a changeless cause plus changing circumstances yields new effects, the circumstances do the real work, much as an epidemiologist discounts a factor present both before and during an outbreak. The SEP notes that this logic generalises to "the permanent creator God (īśvara)". Kumārila, the seventh-century Mīmāṃsaka, made similar criticisms; his school held the Veda authorless and eternal, whereas Udayana thought God "the best or only candidate" for its author. Sāṃkhya's dualism of eternal matter and many selves is atheistic. The Jains deny a creator above all: souls and matter are uncreated, and gods are subject to karma. A passage attributed to Jinasena's *Mahāpurāṇa*, in the translation printed in *Sources of Indian Tradition* (1958), asks: "If God created the world, where was he before the creation?" (see *Jains, Ājīvikas and Materialists: India's Other Dissenters*).

## Religious Experience

William James's *The Varieties of Religious Experience* (1902) gave mystical states four marks: ineffability, a "noetic quality" (they seem to give knowledge), transience and passivity. They are authoritative, he held, for those who have them, but give no grounds to those who only hear the report.

The **argument from religious experience** claims parity with perception: religious experiences are relevantly like sensory ones; sensory experiences justify beliefs about the world; so religious experiences justify religious beliefs. Swinburne's **Principle of Credulity** holds that one is justified in believing that what seems present is present, unless a defeater applies. William Alston's *Perceiving God* (1991) noted that ordinary perception cannot be justified without circularity either; we trust it as an established, consistent practice, and Christian mystical practice meets the same standard.

**Objection.** Reports conflict, from "nothingness as the ultimate reality" to "a vast impersonal consciousness" to "an infinitely perfect, personal creator". Conflicting eyewitnesses undermine one another. **Reply.** Hick and others find a common core beneath the differences; Alston and Plantinga answer that someone inside a tradition may have resources that outsiders lack, like a traveller who has reached the heart of a jungle.

## Wagers, Evidence and Faith

**Pascal's Wager.** Blaise Pascal's fragment "Infinite—nothing" (Brunschvicg 233, Lafuma 418) survives as two sheets of jottings. Alan Hájek's SEP entry finds four arguments in it, each a sort of wager; only the third is "Pascal's Wager". Hacking called it "the first well-understood contribution to decision theory". In Trotter's translation: "If you gain, you gain all; if you lose, you lose nothing. Wager, then, without hesitation that He is." Hájek reconstructs it:

1. If you wager for God and God exists, you gain an infinitely happy life; every other outcome, wagering for God when God does not exist or against God either way, is finite.
2. Rationality requires a positive, finite probability that God exists.
3. Rationality requires choosing the act with the greatest **expected value**: the value of each outcome weighted by its probability.
4. Any positive probability times an infinite reward is infinite; wagering against has finite expectation.
5. So rationality requires wagering for God.

**Objection: many gods.** The choice "God or no God" is too coarse. Diderot wrote in 1746, "An Imam could reason just as well this way"; Mackie added the Anabaptists, the Mormons, "the worshippers of Kali or of Odin". **Reply:** with infinite stakes on every side, let probability break the tie; some argue that simplicity favours an absolutely perfect God. **Objection: mixed strategies.** Duff and Hájek note that "toss a coin, and wager for God if heads" also has infinite expectation, as does any strategy with any chance of wagering for God, so the argument as stated does not single out wagering. **Reply:** refinements compare differences or ratios of expectation instead. Pascal knew one cannot simply choose to believe; he advised acting "as if they believed, taking the holy water, having masses said".

**Must belief follow evidence?** W. K. Clifford held that "It is wrong always, everywhere, and for anyone, to believe anything upon insufficient evidence"; William James's reply is set out in *American Pragmatism: Peirce, James and Dewey*. The **evidentialist objection** runs: belief in God is rational only with adequate evidence; there is none; so it is not rational. Natural theologians deny the second premise. **Reformed epistemology**, launched in *Faith and Rationality* (1983), edited by Plantinga and Nicholas Wolterstorff, denies the first: the strict standard behind it, Plantinga argued, is "self-referentially inconsistent", since by its own test no one would be justified in believing it. Belief in God, formed by what Calvin called a *sensus divinitatis* (sense of the divine), can be **properly basic**, rational without inference, as perceptual beliefs are; in Wolterstorff's words, beliefs "are innocent until proved guilty". In *Warranted Christian Belief* (2000) Plantinga argued that if Christian belief is true, it is warranted (see *What Is Knowledge? From Plato to the Gettier Problem*). He raised the obvious objection himself: why not belief in the Great Pumpkin? Michael Martin pressed that any community could reason the same way.

**Fideism**, in Plantinga's definition, is "exclusive or basic reliance upon faith alone, accompanied by a consequent disparagement of reason". It is linked with Pascal and Kierkegaard (see *Schopenhauer and Kierkegaard*). Tertullian, often cast as the arch-fideist, never said "credo quia absurdum"; as Osborn adds, "he never meant anything like it".

```checkpoint
q: What is Leslie's firing-squad story meant to show?
a: That fine-tuning is certain whether or not there is a designer.
x: That is Sober's observation-selection objection, which the story is meant to answer.
a*: That an outcome we could only observe if it happened can still call for an explanation.
a: That a multiverse makes our universe's fine-tuning more likely.
x: The firing squad answers the anthropic objection; the multiverse is a separate reply.
a: That improbable outcomes never need explaining.
x: Leslie argues the opposite: the survivor should suspect the squad meant to miss.
hint: The prisoner could not be wondering unless he had survived.
why: Sober argues that, since we could not observe a life-hostile universe, fine-tuning is no evidence. Leslie's prisoner could only observe his survival, yet it is rational for him to suspect a plan.
---
q: What does the mixed-strategies objection show about Pascal's Wager?
a: That the probability of God's existence is zero.
x: That is a different objection, made by strict atheists; mixed strategies work for any positive probability.
a: That there are many possible gods to wager on.
x: That is the many-gods objection.
a: That belief cannot be chosen at will.
x: Pascal himself met that worry by recommending practices such as taking holy water.
a*: That any strategy with some chance of wagering for God also has infinite expected value, so the argument does not single out wagering.
hint: Imagine tossing a coin to decide whether to wager.
why: Duff and Hájek note that "wager for God if the coin lands heads" also has infinite expectation, so the argument is invalid as stated; refinements compare differences or ratios of expectations.
```

## Arguments Against: Hiddenness and Diversity

The oldest argument against God, from suffering, has its own chapter, *The Problem of Evil*. A newer one starts from unbelief. J. L. Schellenberg's *Divine Hiddenness and Human Reason* (1993) argues, in the SEP's form:

1. There are people capable of a personal relationship with God who, through no fault of their own, do not believe God exists.
2. If a perfectly loving God existed, there would be no such people, since such a God would make a relationship available to anyone not resisting it, and a relationship requires belief.
3. So there is no such God.

**Objection.** Theists challenge premise 2 with reasons a loving God might have for staying hidden. Clear knowledge of God might thwart moral freedom or growth (Hick, Swinburne) or breed complacency (Kierkegaard); divine love, Rea argues, need not resemble human love. "Sceptical theists" add that our failing to see God's reason is poor evidence that there is none.

**Reply.** Critics answer by comparing explanations. Maitzen, pointing to the demographics of unbelief, and Marsh, to what he calls "natural nonbelief", argue that naturalism explains who believes and who does not better than theism does.

**Religious diversity** raises a related question. The SEP's David Basinger distinguishes **exclusivism** (one's own view is true or closest to truth), **inclusivism** (one religion is fullest, others partly true) and **pluralism** (none has primacy). John Hick's *An Interpretation of Religion* (1989) argued, borrowing Kant's distinction, that Yahweh, Allah, Shiva, Brahman and the Dharmakāya are human experiences of one Real, which "cannot be said to be one or many, person or thing", since each tradition seems equally able to transform lives from self-centredness to "Reality-centeredness". Critics replied that secular commitments transform lives too; Mavrodes asked why this is not polytheism; Plantinga objected that something must be literally true of the Real (it is, at least, not a tricycle) and defended exclusivism. Pluralism is often illustrated by the blind men and the elephant, though the oldest datable version (Udāna 6.4) is Buddhist and was told against quarrelling sectarians.

## Further exploration

- **Graham Oppy, *Arguing about Gods* (2006).** The most thorough recent critical survey of the main arguments.
- **J. L. Mackie, *The Miracle of Theism: Arguments for and against the Existence of God* (1982).** A classic atheist assessment, including Pascal and Kant.
- **Richard Swinburne, *The Existence of God* (1979; 2nd ed. 2004).** The cumulative probabilistic case for theism.
- **William Lane Craig and J. P. Moreland (eds.), *The Blackwell Companion to Natural Theology* (2009).** Current defences, including Craig on the kalām argument and Robin Collins on fine-tuning.
- **Parimal G. Patil, *Against a Hindu God: Buddhist Philosophy of Religion in India* (2009).** Ratnakīrti's critique of the Nyāya proofs.
- **J. L. Schellenberg, *Divine Hiddenness and Human Reason* (1993).** The hiddenness argument.
- **John Hick, *An Interpretation of Religion: Human Responses to the Transcendent* (1989).** The pluralist hypothesis.$god_master$,
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
  select $god_quiz$[
    {"type": "mcq", "prompt": "What is the 'symmetry problem' for Plantinga's modal ontological argument?", "options": ["The same S5 reasoning, starting from 'possibly God does not exist', proves that necessarily God does not exist, and the two possibility premises seem epistemically on a par", "Kant showed that existence is not a real predicate, so maximal greatness cannot include existence", "Gaunilo's Lost Island shows that the argument proves too much", "The argument assumes that the universe began to exist"], "answerIndex": 0, "explanation": "Given S5 and the necessity premise, 'possibly God exists' and 'possibly God does not exist' cannot both be true. Without a symmetry breaker favouring the first, the SEP calls the argument 'dialectically toothless'.", "id": "q1"},
    {"type": "mcq", "prompt": "Which objection to cosmological arguments did Hume put in Cleanthes' mouth in the Dialogues (1779)?", "options": ["That the universe is 'just there, and that's all'", "That the argument secretly relies on the ontological argument", "That once the cause of each of twenty particles is shown, it is unreasonable to ask for a cause of the whole twenty", "That quantum events have no determinable cause"], "answerIndex": 2, "explanation": "Hume's 'twenty particles' objection holds that the whole is 'sufficiently explained in explaining the parts'. The 'just there' remark is Russell's (1948), and the reliance on the ontological argument is Kant's charge.", "id": "q2"},
    {"type": "mcq", "prompt": "Udayana's argument in Nyāyakusumāñjali 1.4 is closest to which Western argument?", "options": ["Paley's watch", "A cosmological argument from dependence: things that come into existence on one occasion and not another need a cause, and without evidence for an infinite regress we should posit a non-dependent cause", "Pascal's Wager", "The modal ontological argument"], "answerIndex": 1, "explanation": "The SEP calls it 'a very abbreviated version' of the cosmological argument. Udayana's better-known argument from products ('Things like the earth have a maker') is a design inference closer to Paley.", "id": "q3"},
    {"type": "mcq", "prompt": "What does Schellenberg's hiddenness argument start from?", "options": ["The amount of suffering in the world", "The fact that religious experiences conflict", "The existence of many religions with equal power to transform lives", "The existence of people capable of relating to God who, through no fault of their own, do not believe God exists"], "answerIndex": 3, "explanation": "Schellenberg argues that a perfectly loving God would make a relationship available to anyone not resisting it, which requires belief; so nonresistant nonbelief counts against such a God. Suffering is the topic of The Problem of Evil.", "id": "q4"},
    {"type": "open", "prompt": "Set out the kalām cosmological argument in Craig's form and assess the objection that Hilbert's Hotel shows only a paradox, not a contradiction.", "rubric": "A strong answer gives the premises (whatever begins to exist has a cause; the universe began to exist; so it has a cause; no scientific explanation can account for the very beginning; so the cause is personal); explains Hilbert's Hotel (moving guests from n to n+1 and n to 2n) and how Craig uses it to argue that an actual infinite, and so a beginningless past, is impossible; states the Cantorian objection that one-to-one correspondence with a proper part is a defining feature of infinite sets, so Craig applies finite intuitions where they do not belong; notes Craig's reply that the critics beg the question, and further debates (presentism, the Big Bang, quantum events, Martin's 'trillions of personal agents'); and notes that premise 1 covers only what begins to exist, so 'who caused God?' does not apply.", "id": "q5"},
    {"type": "open", "prompt": "Is belief in God rational only if it is supported by evidence? Discuss with reference to the evidentialist objection, reformed epistemology and Pascal's Wager.", "rubric": "A strong answer states Clifford's principle and the three-step evidentialist objection; explains that natural theologians deny that there is no evidence while reformed epistemologists (Plantinga, Wolterstorff, Faith and Rationality, 1983) deny that evidence is required, with properly basic belief, the sensus divinitatis, and Plantinga's self-referential argument against classical foundationalism; gives the Great Pumpkin objection and Martin's extension; contrasts Pascal's Wager as a practical rather than evidential argument, with the many-gods and mixed-strategies objections and Pascal's advice on cultivating belief; and reaches a reasoned, evenhanded judgement.", "id": "q6"}
  ]$god_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/arguments-about-god', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
