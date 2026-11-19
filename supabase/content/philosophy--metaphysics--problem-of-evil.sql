-- The Problem of Evil — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/problem-of-evil @ research/advanced/read.
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
    'philosophy/metaphysics/problem-of-evil',
    'research',
    'advanced',
    'read',
    $evil_master$> **If God is all-powerful, all-knowing and wholly good, why is there evil?** This chapter separates moral from natural evil and the "logical" form of the argument from the "evidential" one. It works step by step through J. L. Mackie's charge of contradiction and Alvin Plantinga's Free Will Defence, William Rowe's fawn and the sceptical theists' reply, Paul Draper's Humean argument and John Hick's "vale of soul-making". It then turns to horrendous evils and protest after Auschwitz, and to Islamic debates over divine justice and Indian debates over karma. It takes no side: theist and atheist arguments are both given at full strength.

## The Problem Stated

In Todd Calder's words in the Stanford Encyclopedia of Philosophy (SEP), the problem of evil is "the problem of accounting for evil in a world created by an all-powerful, all-knowing, all-good God. It seems that if the creator has these attributes, there would be no evil in the world. But there is evil in the world."

"Evil" is meant in a **broad** sense: "any bad state of affairs, wrongful action, or character flaw", from a toothache to a harmless lie, not only the most despicable acts. Philosophers sort it into two kinds. **Moral evil**, in James Beebe's definition in the Internet Encyclopedia of Philosophy (IEP), is "evil or suffering that results from the immoral choices of free creatures": murder, lying. **Natural evil** "results from the operations of nature or nature gone awry": hurricanes, disease. The best-known answers to the first say little about the second.

There are three standard ways of pressing the problem. The **logical problem** claims that God and evil are flatly inconsistent. The **evidential problem** grants that they may be consistent but claims that the evil we see makes God's existence improbable. The **experiential** problem is not an argument but the difficulty of believing in a loving God when confronted by suffering.

The most famous formulation is a trilemma credited to Epicurus. As *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* explains, no text of Epicurus contains it; it is reported only by the Christian writer Lactantius, and an older, unattributed version appears in Sextus Empiricus. Through Pierre Bayle's *Dictionary* it reached David Hume, whose *Dialogues concerning Natural Religion* (see *Berkeley and Hume*) gave it to the sceptic Philo:

```quote
Epicurus's old questions are yet unanswered. Is he willing to prevent evil, but not able? then is he impotent. Is he able, but not willing? then is he malevolent. Is he both able and willing? whence then is evil?
Philo, in David Hume · Dialogues concerning Natural Religion, Part X · 1779
```

## Older Answers, in Brief

The Book of Job, dated on linguistic grounds to the Persian period (540–330 BCE), sets a poetic debate between Job and three friends inside a prose story in which God allows "the adversary" to test Job; at the end God speaks from the whirlwind. Augustine, following Plotinus, held that evil is a **privation**, an absence of good rather than a thing, and traced moral evil to free will (see *Augustine and Early Christian Philosophy* and *Plotinus and Neoplatonism*). Maimonides, in the *Guide of the Perplexed*, also treated evil as privation and divided it into three kinds: evils from nature, the rarest; evils people inflict on one another; and evils people bring on themselves through excess, the most common (*Jewish Philosophy: from Saadia to Maimonides* covers his other doctrines).

Leibniz coined the word **theodicy** (Greek *theos*, god, and *dikē*, justice) for the attempt to justify God in the face of evil; his best-world argument is reconstructed in *Leibniz*. The Lisbon earthquake of 1 November 1755 killed an estimated 30,000–40,000 people in the city and perhaps 40,000–50,000 across Portugal, Spain and Morocco. Voltaire answered with his *Poem on the Lisbon Disaster* (1756) and *Candide* (1759), as *The Enlightenment and Rousseau* recounts. Rousseau replied to the poem in a letter dated 18 August 1756, arguing that particular evils serve the general good. Kant concluded in "On the Miscarriage of All Philosophical Trials in Theodicy" (1791) that every philosophical attempt at theodicy fails: the question is a matter of faith, not knowledge.

{{image: 1755 Lisbon earthquake | A map of the region struck by the Lisbon earthquake of 1755, which Voltaire, Rousseau and Kant all wrote about.}}

## The Logical Problem: Mackie's Charge

The modern debate began with J. L. Mackie's "Evil and Omnipotence" (1955), which claimed "not that religious beliefs lack rational support, but that they are positively irrational". Beebe sets out the argument as atheologians such as Mackie press it:

1. God is omnipotent (all-powerful).
2. God is omniscient (all-knowing).
3. God is perfectly good.
4. Evil exists.
5. If God is omnipotent, God could prevent all evil.
6. If God is omniscient, God would know of all evil and how to prevent it.
7. If God is perfectly good, God would want to prevent all evil.
8. Therefore, if evil exists, God is not omnipotent, or not omniscient, or not perfectly good; so (1)–(4) cannot all be true.

The argument is **valid**: if the premises are true, the conclusion must be.

**Objection.** Premise (7) is false. A good being may permit an evil if it has a **morally sufficient reason**, such as a greater good that requires it. Beebe's example is Mrs Jones, who lets her infant suffer a polio injection. She is not less good for it. So long as God might have such reasons, there is no contradiction.

**Reply.** Mackie anticipated the favourite candidate, free will: "why could he not have made men such that they always freely choose the good? … there was open to him the obviously better possibility of making beings who would act freely but always go right." Antony Flew argued the same in 1955. If free creatures could always choose rightly, freedom does not require evil.

## Plantinga's Free Will Defence

The answer most philosophers now accept came from Alvin Plantinga, in *God, Freedom, and Evil* (1974) among other works. It begins with a distinction. A **theodicy** tries to give a plausible account of why God actually permits evil. A **defence** aims only to show that God and evil are consistent, by describing a possible situation in which both exist; the story need not be true or even likely. Peter van Inwagen later described a defence as a story offered "not as true but as 'true for all anyone knows'".

**Omnipotence**, for Plantinga, is the power to do anything logically possible. God cannot make a round square; nor can he create creatures free in the full sense and also cause them always to choose rightly. Plantinga calls the assumption that God could create any possible world "Leibniz's lapse", since which world results depends partly on what free creatures would do. He imagines a mayor, Curley Smith, who took a \$35,000 bribe to drop his opposition; suppose that in some other situation he would freely have taken a bribe too. Such facts about free choices are not up to God. Now suppose every person God might create would, in some situation, freely go wrong. Plantinga calls this **transworld depravity**. The argument:

1. A world with significantly free creatures who do more good than evil is more valuable, all else equal, than a world with no free creatures.
2. God cannot cause a creature to do only what is right *freely*.
3. Whether God can create a world in which free creatures always choose rightly depends on what those creatures would freely do.
4. It is possible that every creature God could create suffers from transworld depravity.
5. If so, God could not have created a world containing moral good but no moral evil.
6. Therefore God's existence is consistent with the existence of moral evil.

In Plantinga's words, "the creation of a world containing moral good is a cooperative venture; it requires the uncoerced concurrence of significantly free creatures." Natural evil, he suggested, might result from the free actions of non-human persons; implausible, perhaps, but a defence needs only possibility.

**Objection.** Mackie and Flew were **compatibilists**: they held that freedom is compatible with being causally determined, so God could have determined us to choose the good freely. Mackie added, in *The Miracle of Theism* (1982), that God could have chosen to create beings "such that they would always freely choose the good".

**Reply.** Plantinga rejected compatibilism: "One might as well claim that being in jail doesn't really limit one's freedom, on the grounds that if one were not in jail, he'd be free to come and go as he pleased." And transworld depravity is precisely the possibility that no such beings were available. Mackie himself conceded that "the problem of evil does not, after all, show that the central doctrines of theism are logically inconsistent with one another. But whether this offers a real solution of the problem is another question." Some dissent: Pruss and others dispute that universal transworld depravity is possible, and Graham Oppy (2006) doubts that the logical argument is dead. But the debate moved to evidence.

```checkpoint
q: What did Plantinga's Free Will Defence set out to show?
a*: That God and evil can consistently exist together, using a story that need only be possible.
a: The actual reasons God has for permitting each evil in the world.
x: That would be a theodicy; a defence aims only at consistency, and its story need not be true.
a: That evil is a privation and so does not really exist.
x: That is the Augustinian view; Plantinga's defence turns on free will and transworld depravity.
a: That God's existence is more probable than not, given the evil we see.
x: Probability belongs to the evidential problem; the Free Will Defence answered the logical one.
hint: Plantinga distinguished a defence from a theodicy.
why: A defence answers the charge of contradiction by describing a possible situation in which an omnipotent, omniscient, wholly good God and evil both exist. Van Inwagen described such a story as "true for all anyone knows".
---
q: What did Mackie concede in *The Miracle of Theism* (1982)?
a: That compatibilism is false.
x: Mackie remained a compatibilist; that was one of his objections to Plantinga.
a: That evil makes theism improbable but not impossible.
x: He did not put it in terms of probability; he conceded consistency and left open whether this was a real solution.
a*: That the problem of evil does not show the central doctrines of theism to be logically inconsistent.
a: That free creatures could not always choose the good.
x: He still argued that God could have created beings who would always freely choose the good.
hint: His concession concerned consistency, not the wider problem.
why: Mackie granted that the logical argument fails, but added that "whether this offers a real solution of the problem is another question". Rowe and R. M. Adams also judged Plantinga successful on this point.
```

## The Evidential Problem: Rowe's Fawn

William Rowe's "The Problem of Evil and Some Varieties of Atheism" (1979) began from a concrete case: "In some distant forest lightning strikes a dead tree, resulting in a forest fire. In the fire a fawn is trapped, horribly burned, and lies in terrible agony for several days before death relieves its suffering." A second case, introduced by Bruce Russell in 1989, was real: a five-year-old girl in Flint, Michigan, beaten, raped and strangled on New Year's Day 1986. William Alston (1991) later labelled the two "Bambi" and "Sue". Rowe's argument:

1. There exist instances of intense suffering which an omnipotent, omniscient being could have prevented without thereby losing some greater good or permitting some evil equally bad or worse.
2. An omniscient, wholly good being would prevent any intense suffering it could, unless it could not do so without losing some greater good or permitting some evil equally bad or worse.
3. Therefore, there does not exist an omnipotent, omniscient, wholly good being.

Premise (2) is widely granted; the weight falls on (1), that **gratuitous** suffering exists, suffering that serves no greater good. Rowe argued for it inductively: no good we know of would justify God in permitting the fawn's agony or the girl's murder, so probably none does. Rejecting that step, he held, "is simply to encourage radical skepticism concerning inductive reasoning in general".

**Objection.** Rowe named "the theist's best response" the **G. E. Moore shift**: a theist more confident that God exists than that premise (1) is true can run the argument backwards. God exists; premise (2) is true; so premise (1) is false, and the fawn's suffering serves a good we cannot see.

**Reply.** The shift is only as strong as the theist's independent reasons for believing in God, the subject of *God: Arguments For and Against*. For someone without them, the fawn remains evidence.

## Sceptical Theism

A more influential reply attacks Rowe's inductive step. In "The Humean Obstacle to Evidential Arguments from Suffering" (1984), Stephen Wykstra proposed CORNEA, the "Condition Of ReasoNable Epistemic Access". Roughly: you may infer "there is no x" from "so far as I can tell, there is no x" only if, were there an x, you would probably see it. To take an illustration, seeing no elephant in a room is good evidence that none is there; failing to see a flea from the doorway is not. Wykstra later called the bad kind "noseeum inferences" ("we no see 'um, so they ain't there").

Would we expect to see God's reasons? Wykstra compared the gap between God's mind and ours to that between a parent and a one-month-old infant, who cannot be expected to discern the purpose of the pains its parents allow. Plantinga had asked: "Why suppose that if God does have a reason for permitting evil, the theist would be the first to know?" Alston, comparing us to a beginner watching Kasparov play chess, concluded that "the inductive argument from evil is in no better shape than its late lamented deductive cousin". This is **sceptical theism**: theism combined with scepticism about our ability to judge God's reasons.

**Objection.** Rowe pressed the disanalogies: a loving parent who lets a child suffer comforts it and, where possible, explains. "God, if he exists, isn't playing chess with our lives." A second objection concerns morality. If any apparently pointless evil might serve a hidden good, perhaps I should not intervene when I see a child harmed. Critics (Almeida and Oppy, 2003; Piper, 2007) press this objection; the SEP, after Piper, warns of "a kind of moral paralysis or aporia".

**Reply.** Sceptical theists answer that our obligations depend on what we know, not on the overall value of outcomes we cannot see; and a theist who believes God commands us to prevent suffering has reason enough to act. Whether the costs can be contained remains disputed.

## Draper and Hume's Fourth Hypothesis

In Part XI of the *Dialogues* Philo considers four hypotheses about the first causes of the universe: perfectly good, perfectly malicious, both, or neither. "Mixed phenomena can never prove the two former unmixed principles… The fourth, therefore, seems by far the most probable."

Paul Draper's "Pain and Pleasure: An Evidential Problem for Theists" (1989) develops this. His rival to theism is the **Hypothesis of Indifference**: that "neither the nature nor the condition of sentient beings on earth is the result of benevolent or malevolent actions performed by nonhuman persons". Let O be the observed facts: pain and pleasure that are biologically useful in moral agents, the same in animals, and pain and pleasure not known to be useful at all. In Tooley's reconstruction:

1. The Hypothesis of Indifference is at least as probable in itself as theism.
2. O is more probable on the Hypothesis of Indifference than on theism.
3. So, by Bayes' theorem, the Hypothesis of Indifference is more probable than theism, given O.
4. The Hypothesis of Indifference entails that theism is false.
5. So, given O, theism is more likely false than true.

Unlike Rowe, Draper need not show that any particular evil is pointless.

**Objection.** Tooley lists several. The Hypothesis of Indifference might not exclude theism: a God might create a chancy evolutionary world and never intervene. Premise (1) is doubtful, since the hypothesis is a sweeping universal negative. And the argument, Tooley adds, barely moves beyond its assumptions about prior probabilities.

**Reply.** Tooley notes that the first two objections can be avoided by switching to an "Indifferent Deity Hypothesis", which Draper also mentions; and evil remains one piece of evidence among others.

## Soul-Making

Where Plantinga claimed only possibility, John Hick's *Evil and the God of Love* (1966) offered a theodicy. Hick distinguished an "Augustinian" type, built on privation and free will, from an "Irenaean" type, after Irenaeus of Lyon (c. 130 – c. 202), who held that humans were made in God's "image" and must grow into his "likeness".

Hick took a phrase from a letter John Keats wrote in April 1819: "Call the world if you Please 'The vale of Soul-making'". The argument:

1. A good God aims at persons who freely grow into moral and spiritual maturity.
2. Goodness won by mastering temptation is "good in a richer and more valuable sense" than goodness created ready-made.
3. Such growth needs a world of real danger, pain and possible failure, and an "epistemic distance" from God.
4. Our world is such an environment.
5. So its evils are justified by the soul-making they make possible, a process completed beyond death.

**Objection.** Much suffering destroys rather than builds character, suffering Hick himself called **dysteleological**: unjust, undeserved, unnecessary or excessive. Young children die before they can grow; some suffer too much to grow while others live in ease; and soul-making often benefits perpetrators or witnesses rather than victims. Above all there are animals, whom soul-making cannot help, suffering through predation over millions of years.

```quote
I cannot persuade myself that a beneficent and omnipotent God would have designedly created the Ichneumonidae with the express intention of their feeding within the living bodies of Caterpillars, or that a cat should play with mice.
Charles Darwin · Letter to Asa Gray · 22 May 1860
```

**Reply.** Hick answered that the mystery of apparently pointless suffering is itself conducive to soul-making, and that the process continues after death. Tooley judges his treatment of animals weak; Michael Almeida calls animal suffering "perhaps the most serious and difficult" version of the problem (see also *Animals and the Environment*).

## Horrendous Evils and Protest

Marilyn McCord Adams, in *Horrendous Evils and the Goodness of God* (1999), argued that the debate had looked in the wrong place. Some evils are **horrendous**: their doing or suffering "constitutes prima facie reason to doubt whether the participant's life could… be a great good to him/her on the whole". Her examples include "child abuse of the sort described by Ivan Karamazov" and "the explosion of nuclear bombs over populated areas". Showing that the world as a whole is good does not answer such a victim. Adams's own Christian answer was that intimacy with God is a good *incommensurable* with any temporal evil, so that for each person "there will be no balance to be struck".

In the chapter "Rebellion" of Dostoevsky's *The Brothers Karamazov* (1880), Ivan cannot accept a world built on the suffering of children: he does not reject God, he says, but most respectfully returns Him the ticket. Dostoevsky meant the next book, on the monk Zosima, as his answer; Camus gave Ivan's revolt a central place in *The Rebel* (1951) (see *Existentialism: Sartre, Beauvoir and Camus*).

After the Holocaust some thinkers rejected theodicy itself; Zachary Braiterman named this **anti-theodicy** (1998). Elie Wiesel, who survived Auschwitz, wrote *The Trial of God* (1979), a play in which God is the defendant. John K. Roth proposed a "theodicy of protest", and David Blumenthal a "worship of God through protest". Hans Jonas, whose mother was murdered in Auschwitz, gave a lecture in 1984, "The Concept of God after Auschwitz", in which he gave up divine omnipotence to keep God's goodness. Whether refusing theodicy is a religious response or a concession is itself debated.

## Justice and the Best World in Islamic Thought

For medieval Muslim thinkers, Jon McGinnis and Rahim Acar write in the SEP, "the existence of God was never in question." The questions were what evil is, whether ours is the best possible world, and whether God's justice or his omnipotence comes first.

The Muʿtazilite theologians put justice first (see *Al-Ghazālī, Averroes and the Quarrel over Reason* and *Free Will and Determinism*). One standard of goodness binds God and humans, so the suffering God causes must be justified, by compensation, admonition, punishment, benefit or grace; God must do what is best. Others put sovereignty first, as al-Ashʿarī seems to have done early in his career: suffering needs no further justification, "since the universe is God's property and God can treat creatures the way he pleases". Avicenna held that evil is non-being or imperfection, and often necessary: the fire that destroys a poor man's family and possessions is good in being hot, and to remove it would remove a whole class of goods.

Al-Ghazālī gave the famous formula: "there is in possibility nothing more wondrous than what is". If God could have made a better world and did not, he would be miserly; if he could not, powerless. Both are unworthy of God, so this world is the best, and its apparent flaws reflect the limits of our knowledge. The SEP's entries disagree about his originality: Frank Griffel says he "followed Avicenna"; McGinnis and Acar say neither Avicenna nor the Muʿtazila explicitly claimed it and al-Ghazālī "explicitly argued" it (see *Possibility and Necessity*). It provoked a long-lasting debate among later theologians, studied by Eric Ormsby; Fakhr al-Dīn al-Rāzī objected that Avicenna's analysis sidestepped the real problem, a world with more pain than pleasure.

## Karma and the Problem in India

Most classical Indian schools, including Sāṃkhya, early Nyāya, Mīmāṃsā, Buddhism and Jainism, posit no omnipotent, all-good creator, and explain suffering by **karma**, the consequence of a being's own past actions carried across lives. Where Vedānta affirmed a Lord who brings forth the world, the problem arose in a familiar form. The *Brahmasūtras* (probably 200 BCE–200 CE), with Śaṅkara's commentary, argue:

1. The world is unequal and full of suffering.
2. If the Lord created it unequal by his own choice, he would be guilty of "partiality and cruelty".
3. But the Lord creates in dependence on the merit and demerit, the karma, of beings.
4. So inequality reflects beings' own past actions, not partiality.

**Objection.** At the first creation there were no distinctions among beings, so no karma to explain their inequality.

**Reply.** Transmigration has **no beginning**. Like seed and sprout, a body requires karma and karma requires a body, so there was never a creation without prior karma (*Brahmasūtra* 2.1.35–36 in one numbering).

Critics found this self-defeating. The eighth-to-ninth-century Jain writer Jinasena, in one English translation, posed a dilemma: "If he created because of the karma of embodied beings… He is not the Almighty Lord, but subordinate to something else"; and if out of love, "why did he not make creation wholly blissful free from misfortune?" (see *Jains, Ājīvikas and Materialists: India's Other Dissenters*). The Buddhist *Devadaha Sutta* argues that if pleasure and pain came from a supreme God's creative act, the suffering Jain ascetics "surely must have been created by an evil Supreme God". Richard Hayes cautions that early Buddhist texts offer no systematic disproof of God; the fuller case against a creator is in *God: Arguments For and Against*. Madhva's doctrine of predestined souls reopened the question within Vedānta (see *Vedānta: Śaṅkara, Rāmānuja and Madhva*).

Is karma a solution? Max Weber called it "the most consistent theodicy ever produced by history", and Arthur Herman (1976) argued that the "doctrine of rebirth solves the problem of evil". Gananath Obeyesekere (1968) accused Weber of confusion in his use of "theodicy"; Whitley Kaufman (2005) argues that karma and rebirth fail as a systematic theodicy; and Elisa Freschi (2021) has examined the question from within Viśiṣṭādvaita Vedānta.

```checkpoint
q: What is the point of Wykstra's CORNEA principle?
a: That God's reasons for permitting evil are always visible to the faithful.
x: The principle points the other way: we may not be in a position to see them.
a*: That "I see no reason for this evil" supports "there is no reason" only if we would probably see such a reason if it existed.
a: That every evil serves a greater good we can identify.
x: CORNEA makes no claim about which goods exist; it limits what we may infer from not seeing them.
a: That pain and pleasure are better explained by indifference than by God.
x: That is Draper's Humean argument, not Wykstra's reply to Rowe.
hint: Think of failing to see a flea from the doorway.
why: CORNEA targets Rowe's step from "no good we know of justifies this" to "no good justifies this". Wykstra's parent and infant analogy suggests that God's reasons might be beyond us, as a parent's are beyond a one-month-old.
---
q: How do the *Brahmasūtras* answer the objection that at the first creation there was no karma to explain inequality?
a: By denying that beings are unequal.
x: The argument starts by accepting that the world is unequal and full of suffering.
a: By saying the Lord is not bound by justice.
x: That resembles the early Ashʿarite view; the Vedānta argument aims to show the Lord is not partial or cruel.
a: By attributing suffering to an evil creator.
x: That is the Devadaha Sutta's ironic conclusion, not the Vedānta reply.
a*: By holding that transmigration has no beginning, like seed and sprout.
hint: A body requires karma and karma requires a body.
why: If transmigration is beginningless, there was never a creation without prior karma. The Jain Jinasena replied that a Lord who depends on karma is not almighty.
```

## Where the Debate Stands

Most philosophers on both sides accept that Plantinga answered Mackie, though some dissent. The evidential problem is alive: Rowe's induction, sceptical theism, Draper's probabilities and soul-making are all still argued over. Adams and the protest theologians demand an answer a victim could hear. And the Islamic and Indian debates show the problem changing shape with what is believed about God's justice and power, and about whether the world had a beginning.

## Further exploration

- **John Hick, *Evil and the God of Love* (1966).** The classic statement of the soul-making theodicy and of the Augustinian and Irenaean types.
- **Marilyn McCord Adams, *Horrendous Evils and the Goodness of God* (1999).** Why the worst evils need more than global theodicies.
- **Peter van Inwagen, *The Problem of Evil* (2006).** Gifford lectures defending a free-will defence "true for all anyone knows".
- **Daniel Howard-Snyder (ed.), *The Evidential Argument from Evil* (1996).** Rowe, Wykstra, Alston, Draper and others in debate.
- **Arthur L. Herman, *The Problem of Evil and Indian Thought* (1976).** Karma and rebirth as theodicy, compared with Western solutions.
- **Susan Neiman, *Evil in Modern Thought: An Alternative History of Philosophy* (2002).** Modern philosophy told through Lisbon and Auschwitz.
- **Justin P. McBrayer and Daniel Howard-Snyder (eds), *The Blackwell Companion to the Problem of Evil* (2013).** A wide survey of the current debates.$evil_master$,
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
  select $evil_quiz$[
    {"type": "mcq", "prompt": "What is the difference between moral evil and natural evil?", "options": ["Moral evil results from the immoral choices of free creatures; natural evil from the operations of nature", "Moral evil is serious; natural evil is trivial, like a toothache", "Moral evil harms humans; natural evil harms only animals", "Moral evil is a privation; natural evil is a positive thing"], "answerIndex": 0, "explanation": "In Beebe's IEP definitions, moral evil results from the immoral choices of free creatures (murder, lying) and natural evil from the operations of nature or nature gone awry (hurricanes, disease). The distinction matters because free-will answers address the first far better than the second.", "id": "q1"},
    {"type": "mcq", "prompt": "Who introduced the case of the five-year-old girl murdered in Flint, Michigan, into the debate over the evidential problem, and who nicknamed the two standard cases 'Bambi' and 'Sue'?", "options": ["William Rowe introduced it and named both cases", "Alvin Plantinga introduced it; Paul Draper named them", "Bruce Russell introduced it (1989); William Alston coined the names (1991)", "Marilyn McCord Adams introduced it; John Hick named them"], "answerIndex": 2, "explanation": "Rowe's own 1979 case was the fawn in the forest fire. The girl's case was introduced by Bruce Russell in 1989, and the nicknames 'Bambi' and 'Sue' are Alston's, from 1991, not Rowe's.", "id": "q2"},
    {"type": "mcq", "prompt": "What is Draper's 'Hypothesis of Indifference'?", "options": ["That God is indifferent to whether humans believe in him", "That pain and pleasure are distributed at random", "That moral agents should be indifferent to suffering they cannot prevent", "That neither the nature nor the condition of sentient beings on earth results from benevolent or malevolent actions by nonhuman persons"], "answerIndex": 3, "explanation": "Developing Philo's fourth hypothesis in Hume's Dialogues, Draper (1989) argued that the observed facts about pain and pleasure are more probable on this hypothesis than on theism, so that, given those facts, theism is more likely false than true. Tooley lists objections, including doubts about the prior probabilities.", "id": "q3"},
    {"type": "mcq", "prompt": "On what do the two SEP entries disagree concerning al-Ghazālī's claim that 'there is in possibility nothing more wondrous than what is'?", "options": ["Whether he actually wrote it", "Whether he followed Avicenna in holding this the best of all possible worlds or was the first to argue it explicitly", "Whether he was an Ashʿarite or a Muʿtazilite", "Whether he thought God could have created a better world"], "answerIndex": 1, "explanation": "Frank Griffel's entry says al-Ghazālī 'followed Avicenna'; McGinnis and Acar say neither Avicenna nor the Muʿtazila explicitly claimed it and al-Ghazālī 'explicitly argued' it. Both agree he held it; McGinnis and Acar give his reason: a God who could make a better world but did not would be miserly, and one who could not would be powerless.", "id": "q4"},
    {"type": "open", "prompt": "Set out William Rowe's evidential argument from evil as numbered premises and a conclusion, using his fawn example, and then give the sceptical theist's objection and one reply to it.", "rubric": "A strong answer states Rowe's three steps: (1) there are instances of intense suffering an omnipotent, omniscient being could have prevented without losing a greater good or permitting an equal or worse evil; (2) an omniscient, wholly good being would prevent any such suffering; (3) so no such being exists. It notes that (2) is widely granted and that (1) is supported inductively from the fawn (and Russell's Flint case): no good we know of justifies it, so probably none does. It explains Wykstra's CORNEA (we may infer 'there is none' from 'I see none' only if we would likely see it) and the parent and infant analogy, perhaps with Alston's conclusion. It gives a reply such as Rowe's disanalogy (a loving parent comforts and explains; 'God, if he exists, isn't playing chess with our lives') or the moral paralysis objection, with the sceptical theist's answer. Credit for mentioning the G. E. Moore shift.", "id": "q5"},
    {"type": "open", "prompt": "Explain John Hick's soul-making theodicy and assess it in the light of animal suffering and Marilyn McCord Adams's 'horrendous evils'.", "rubric": "A strong answer explains Hick's Irenaean type (humans made in God's image and growing into his likeness), the 'vale of soul-making' phrase from Keats, the claim that goodness won by overcoming real challenges is more valuable than ready-made goodness, the need for real danger and epistemic distance, and completion beyond death. It distinguishes a theodicy from Plantinga's defence. It raises objections: dysteleological suffering that destroys character, children who die young, unequal distribution, and animal suffering (Darwin's ichneumon wasps; Almeida's judgement that this is perhaps the most serious and difficult version). It presents Adams's definition of horrendous evils and her claim that global goods do not answer the victim, and her own answer of incommensurable intimacy with God. Credit for Hick's reply that mystery itself aids soul-making, and for a balanced conclusion.", "id": "q6"}
  ]$evil_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/problem-of-evil', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
