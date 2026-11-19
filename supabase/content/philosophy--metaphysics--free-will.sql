-- Free Will and Determinism — canonical master article, co-written and human-reviewed.
-- philosophy/metaphysics/free-will @ research/advanced/read.
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
    'philosophy/metaphysics/free-will',
    'research',
    'advanced',
    'read',
    $freewill_master$> **Could you have done otherwise, and does it matter?** This chapter separates determinism from fate, recaps how Greek, Indian, Chinese and Islamic thinkers argued about destiny and foreknowledge, and works through the modern debate step by step: Hume's compatibilism, van Inwagen's Consequence Argument, Frankfurt's cases, Strawson's reactive attitudes, the luck objection to libertarian freedom, and the sceptics' arguments. It ends with what neuroscience has, and has not, shown.

## What Is the Question?

Suppose Maya keeps a wallet she finds instead of handing it in, and we blame her. The Stanford Encyclopedia of Philosophy (SEP) calls "free will" "the canonical designator for a significant kind of control over one's actions". What kind? Was the act "up to her" because she could have chosen otherwise (**leeway**), or because she herself was its **source** (**sourcehood**)? Many philosophers tie free will closely to **moral responsibility**, and some define it as whatever control responsibility requires. The responsibility at stake is usually what Derk Pereboom calls **basic desert**: Maya deserves blame "just because she has performed the action", not because blaming her has good effects.

The positions form a map. **Compatibilists** hold that free will is possible even if determinism is true. **Incompatibilists** deny it; among them, **hard determinists** think determinism is true and so no one is free, while **libertarians** (in the metaphysical sense, nothing to do with politics) think determinism false and some agents free. Others argue that free will is impossible whether or not determinism holds; Pereboom's label for his version is **hard incompatibilism**, which, in Gregg Caruso's summary, maintains that "whatever the fundamental nature of reality, whether it is deterministic or indeterministic, we lack basic desert moral responsibility." Compatibilism and incompatibilism are claims about what is *possible*, not about whether we are actually free.

## Determinism Is Not Fate

Carl Hoefer's SEP definition is the standard one: "Determinism is true of the world if and only if, given a specified way things are at a time t, the way things go thereafter is fixed as a matter of natural law." Given the state of the world a hundred million years ago and the laws of nature, only one future is possible.

{{image: Pierre-Simon Laplace | Laplace, whose *Essai philosophique sur les probabilités* imagined an intelligence that could read the whole future from the present state of the world.}}

The most famous image of determinism comes from Laplace's *Essai philosophique sur les probabilités* (1814). He imagined *une intelligence* that knew every force and position at one instant: "*Rien ne serait incertain pour elle, et l'avenir, comme le passé, serait présent à ses yeux*" (nothing would be uncertain for it, and the future, like the past, would be present to its eyes). Laplace never called it a "demon"; Hoefer thinks he "probably had God in mind". Determinism is not predictability: no finite intelligence inside the world could do the calculation. The image disturbs because, as Hoefer puts it, "We can't stand the thought that we are (in some sense) marionettes."

Determinism also differs from **fatalism**, which Hoefer defines as the thesis that events "are destined to occur no matter what we do", guaranteed by the gods, by divine foreknowledge, or by some purpose in the universe rather than by laws. You can have fate without deterministic laws, and deterministic laws with nothing fated: under determinism, what you do still makes a difference to what follows.

Is determinism true? It is an empirical question, and the popular belief that quantum mechanics has refuted it is, Hoefer says, "partly mistaken and/or misleading", since some interpretations of the theory are deterministic. Randolph Clarke, Justin Capes and Philip Swenson suggest that "there is currently no good evidence that determinism is true", and even less that indeterminism occurs just where libertarians need it.

## Fate before Physics: Greek Arguments

The Greek debate began with logic. Aristotle's sea battle (*De Interpretatione* 9) runs: either "there will be a sea battle tomorrow" or its denial is already true; so the outcome was always unavoidable, in the sense that no one had the power to prevent it, and everything happens of necessity. On one reading Aristotle answered by denying that statements about future contingents are yet true or false; on another, he rejected the step from truth to necessity (see *Aristotle*).

The Stoics accepted fate as an everlasting chain of causes, in Cicero's report "not the 'fate' of superstition, but that of physics", and *Hellenistic Philosophy: Stoics, Epicureans and Sceptics* tells their story. One argument shows a pattern that recurs throughout this chapter. Here is the **Idle Argument**, as Rice gives it after Susanne Bobzien:

1. If it is fated that you will recover from this illness, you will recover whether or not you call a doctor.
2. If it is fated that you will not recover, you will not recover whether or not you call a doctor.
3. Either it is fated that you recover or that you do not.
4. So calling a doctor is futile.

**Objection.** Chrysippus (c. 280–206 BCE) replied that the conclusion does not follow, "because it may have been fated that you will recover as a result of seeing the doctor". Recovery and calling the doctor are **co-fated**; as Tim O'Keefe puts his point, even if it is true that someone will wrestle, "it doesn't follow that they'll wrestle whether or not they have an opponent". Rice thinks the reply "seems exactly right".

**Reply.** The fatalist can retreat: still, you could not have done otherwise. Chrysippus granted this; what matters is *how* choices are determined. A pushed cylinder rolls and a pushed cone spins because of their own shapes; so our assent flows from our character, and "assent will be in our power". This is an ancient compatibilism. Its emblem, a dog tied to a cart that follows willingly or is dragged, is credited to Zeno and Chrysippus by Hippolytus; Bobzien argues that it probably reflects a later Stoic view, of thinkers such as Epictetus, rather than Chrysippus's; O'Keefe thinks that, as Chrysippus used it, it meant only that resisting fate is futile and brings misery.

Epicurus, refusing to be "a slave to the 'fate' of the natural philosophers", took the opposite path: atoms occasionally **swerve** "at no fixed region of space or fixed time", as Lucretius puts it. The worry that dogs every libertarian theory appears at once: random swerves would yield, in O'Keefe's phrase, "random and blameless twitches". Alexander of Aphrodisias is seen by many as "the first unambiguously 'libertarian' theorist of the will". Greek had no phrase that obviously means "free will"; it asked what is "up to us" (*eph' hēmin*), and whether the concept was born with the Stoic Epictetus (Michael Frede's view) or with Augustine is disputed.

## God's Foreknowledge

Monotheism sharpened fatalism. David Hunt and Linda Zagzebski's **Basic Argument for Theological Fatalism** runs, compressed: yesterday God infallibly believed you would answer the phone at nine tomorrow; the past is now beyond anyone's power; necessarily, if God believed it, it is true; so it is now unavoidable that you answer; so you cannot do otherwise, and do not answer freely. There is "a consensus that this argument or something close to it is valid", so a response must reject a premise. The problem is *infallibility*: a friend's fallible foreknowledge threatens nothing.

Boethius (c. 480–524) and Aquinas denied that God believed anything "yesterday", since God is outside time. Ockham denied that God's past beliefs are fixed as other past facts are. Augustine's answer arguably denies that freedom requires being able to do otherwise. *Augustine and Early Christian Philosophy* covers Augustine and Boethius and the dispute over whether each was a libertarian or a compatibilist; *Scotus, Ockham and the Late Medieval Debates* follows Scotus, "the stoutest defender" of a libertarian will in the Middle Ages.

```checkpoint
q: What was Chrysippus's reply to the Idle Argument?
a*: That recovery may be fated together with calling the doctor, so calling is not futile.
a: That nothing is fated, so calling the doctor can change the outcome.
x: Chrysippus accepted fate; his point was about how outcomes are fated.
a: That atoms swerve unpredictably, so the future is open.
x: The swerve is Epicurean; the Stoics rejected uncaused motion.
a: That statements about the future are neither true nor false.
x: That is one reading of Aristotle's answer to the sea battle, not Chrysippus's reply.
hint: Think of the wrestler and the opponent.
why: Some outcomes are "co-fated" with the actions that bring them about. If recovery is fated as a result of seeing the doctor, it does not follow that you will recover whether or not you see one.
---
q: According to Hunt and Zagzebski, what makes divine foreknowledge seem to threaten freedom?
a: That God causes every event He foresees.
x: The argument concerns knowledge, not causation; theological determinism is a separate worry.
a: That knowing the future is logically impossible.
x: The argument assumes God has foreknowledge and asks what follows.
a*: That God's past belief is infallible and the past is beyond anyone's power.
a: That any foreknowledge, even a friend's guess, removes freedom.
x: Ordinary fallible foreknowledge threatens nothing.
hint: What is special about God's beliefs, compared with a friend's?
why: If God's belief cannot be wrong and cannot now be changed, the believed action seems unavoidable. Responses deny that God believes in time (Boethius, Aquinas), that such past facts are fixed (Ockham), or that freedom needs alternatives (arguably Augustine).
```

## Fate, Karma and Effort beyond Greece

In India the **Ājīvikas** were remembered for *niyati*, fate. Buddhist and Jain sources agree that Gosāla, the figure most associated with them, "was a rigid determinist"; one modern summary compares life on his view to a ball of string that unrolls until it is done. Whether the rivals "deliberately distorted Ajivika doctrine", as Dundas suspects, is debated in *Jains, Ājīvikas and Materialists: India's Other Dissenters*. The Jains rejected fatalism, insisting on the reality of human effort and action. The Buddha defined karma by intention, "It is volition, bhikkhus, that I call kamma" (*Aṅguttara Nikāya* 6.63, in Bodhi's translation), so that past action conditions without dictating (see *The Buddha and Early Buddhist Philosophy*). Where Buddhism falls on the map is disputed. Mark Siderits has explored a "paleo-compatibilism", reportedly presented as extrapolated from Abhidharma rather than as his settled view: incompatibilism arises from mixing the everyday vocabulary of persons with the ultimate vocabulary of their parts. Rick Repetti criticises it; Charles Goodman argues for a Buddhist hard determinism. The *Bhagavad Gītā* (2.47) is usually rendered as giving a right to action but never to its fruits; Shyam Ranganathan warns that the Gītā's teaching that Kṛṣṇa answers for outcomes "seems like an argument for hard determinism" only out of context.

In China, the Mohists' "Condemning Fatalism" applied three tests to the belief that one's lot is fixed: history (the same conditions brought order under sage kings and turmoil under tyrants, so policy matters); experience (no one has seen or heard fate); and consequences (belief in fate makes people stop trying). Chris Fraser notes that they "oddly ... overlook the obvious fatalist rejoinders" (see *Mozi, the Daoists and the Legalists: the Hundred Schools*). Confucians spoke of *ming*, "mandate, decree, destiny", including brute facts such as how long we live. Mencius held that one should accept *ming* and put one's effort into ethical life, and he warned that understanding destiny does not mean standing under a wall about to collapse (see *Confucius, Mencius and Xunzi*).

Early Islamic theology split over predestination. The **Qadariyya** held that humans have free will and are responsible, absolving God of evil; the label **Jabriyya**, for those who held all acts compelled by God, was largely an insult rather than a school. The Muʿtazila argued that if evil acts came from God's will, "punishment would have been meaningless". The Ashʿarites answered with ***kasb***, "acquisition": God creates every act, but the human who performs it "acquires" it and is responsible. The Māturīdīs found this "obscure" and called the Ashʿarites determinists (see *Al-Ghazālī, Averroes and the Quarrel over Reason*; Saadia's Muʿtazilite-style defence of freedom is in *Jewish Philosophy: from Saadia to Maimonides*).

## Classical Compatibilism: Hobbes and Hume

Early modern philosophers mostly agreed that compatibilism is true; Spinoza, Reid and Kant are the clear exceptions. The classical strategy had two steps. First, the opposite of freedom is not causation but constraint. Hobbes defined liberty as "the absence of all the impediments to action that are not contained in the nature and intrinsical quality of the agent" (see *Hobbes*). Second, deeper notions of freedom are confused: to ask whether a man is free to will, Locke said, is to ask "whether a man can will what he wills" (see *Locke*). Hume, in the *Treatise of Human Nature*, drew the line this way:

```quote
Few are capable of distinguishing betwixt the liberty of spontaneity, as it is call'd in the schools, and the liberty of indifference; betwixt that which is oppos'd to violence, and that which means a negation of necessity and causes.
Hume · A Treatise of Human Nature, 2.3.2.1 · 1739–40, as quoted in the Stanford Encyclopedia of Philosophy
```

Only spontaneity, he said, concerns us. In the later *Enquiry* he dropped this vocabulary for "hypothetical liberty", "a power of acting or not acting, according to the determinations of the will", which belongs to everyone "who is not a prisoner and in chains". Hume went further: responsibility *requires* causation, since we blame character shown in action, and an uncaused act would reveal no character. Confusing causation with compulsion was, for him, the root of the problem (see *Berkeley and Hume*, and *Causation* for his account of necessity).

Kant called this a "wretched subterfuge", the freedom of a clock moved by internal causes (see *Kant*). An addict is moved from inside yet seems unfree; and the later analysis, that Maya "could have done otherwise *if she had chosen*", is satisfied by a compulsive agent who could not have chosen otherwise. Paul Russell reads Hume less as this kind of optimist than as a naturalist for whom moral sentiment was central.

## The Consequence Argument

The strongest modern case for incompatibilism is the Consequence Argument, articulated by Carl Ginet and by Peter van Inwagen, in *An Essay on Free Will* (1983): "If determinism is true, then our acts are the consequences of the laws of nature and events in the remote past. But it is not up to us what went on before we were born, and neither is it up to us what the laws of nature are. Therefore, the consequences of these things (including our present acts) are not up to us." Write "N*p*" for "*p*, and no one has, or ever had, any choice about whether *p*". Then:

1. If determinism is true, a past state of the world before any people existed, together with the laws, entails what you do now.
2. No one has any choice about that past state.
3. No one has any choice about the laws of nature.
4. **Rule Beta**: if no one has a choice about *p*, and no one has a choice about whether *p* leads to *q*, then no one has a choice about *q*.
5. So no one has any choice about what you do now.

**Objection.** McKay and Johnson (1996) showed that Beta implies an invalid rule. Take a fair coin that was not tossed, though someone could have tossed it. No one had a choice about "it does not land heads", nor about "it does not land tails"; but someone did have a choice about "it lands neither heads nor tails", since tossing it would have made that false. Van Inwagen conceded in 2000 that Beta is invalid.

**Reply.** The argument was repaired. Van Inwagen strengthened the meaning of N, and Finch and Warfield (1998) proposed a weaker rule, Beta 2, that avoids the coin. Kadri Vihvelin's verdict: "it still looks as though the compatibilist is in trouble". Compatibilists lean instead on Lewis (1981): if determinism is true and I could have raised my hand, then *had* I raised it, the laws would have been slightly different. That is not the incredible claim that I could have *caused* a law to break; it is no stranger than our abilities depending on circumstances we do not control.

## Frankfurt and the Ability to Do Otherwise

The Consequence Argument assumes that freedom needs alternatives. The **Principle of Alternative Possibilities** (PAP) says a person is morally responsible only if she could have done otherwise; David Robb's SEP entry notes that both sides took it for granted until about fifty years ago. Harry Frankfurt (1929–2023), in "Alternate Possibilities and Moral Responsibility" (1969), challenged it. In John Martin Fischer's version, Black implants a device in Jones's brain: if Jones shows any sign of voting Democrat, it will make him decide to vote Republican. Jones decides on his own to vote Republican, and the device does nothing.

1. If PAP is true, Jones is responsible only if he could have done otherwise.
2. Jones could not have done otherwise, because of Black's device.
3. Yet Jones is responsible: he acted for his own reasons, and the device was idle.
4. So PAP is false.

```quote
Jones will bear precisely the same moral responsibility for what he does as he would have borne if Black had not been ready to take steps to ensure that he do it.
Harry Frankfurt · "Alternate Possibilities and Moral Responsibility" · 1969
```

**Objection.** The **dilemma defence** (Kane, Widerker, Ginet) asks how Black knows when to step in. He needs a prior sign. Either the sign determines Jones's choice, in which case libertarians will deny that Jones is responsible; or it does not, in which case Jones could have chosen otherwise after all. "Either way, the FSC [Frankfurt-style case] fails as a counterexample to PAP."

**Reply.** Fischer answers the first horn: a factor that does no causal work cannot make the difference to responsibility. For the second, Pereboom built a case in which a device would intervene only if a moral reason struck Joe, considering tax evasion, with a certain force; none does, and Joe decides on his own, with no robust alternative. Robb concludes that "not much consensus has emerged". Frankfurt's own later gloss: "making an action unavoidable is not the same thing as bringing it about that the action is performed".

Frankfurt (1971) added a positive theory built on **second-order volitions**, wants about which desires should move us: the unwilling addict, who repudiates her craving, is unfree; the willing addict acts freely though she could not do otherwise. Critics note that higher-order desires could be implanted too. Fischer and Mark Ravizza (1998) tie responsibility instead to acting from one's own **reasons-responsive** mechanism; a hypnotised agent would behave the same "no matter what reasons there were".

```checkpoint
q: What did McKay and Johnson's untossed coin show?
a: That determinism is false, because coin tosses are random.
x: The coin was never tossed; the example concerns the logic of "no choice".
a*: That Rule Beta is invalid, since no one had a choice about "not heads" or about "not tails", yet someone had a choice about "neither".
a: That the laws of nature are up to us.
x: That is not their claim; Lewis's reply concerns what would have been different, not causing the laws to change.
a: That Frankfurt cases succeed against PAP.
x: The coin case is aimed at the Consequence Argument, not at the Principle of Alternative Possibilities.
hint: Which inference rule moves from separate "no choice" facts to a combined one?
why: Beta implies Agglomeration, which the coin shows invalid. Van Inwagen conceded this in 2000; the argument was repaired with a stronger N and with Beta 2.
---
q: What is the dilemma defence against Frankfurt cases?
a: That Jones is not really responsible, because Black is watching him.
x: The defence turns on the prior sign Black relies on, not on the mere fact of being watched.
a: That PAP was never held by anyone before Frankfurt.
x: Robb notes that PAP was a standard presupposition taken for granted by both sides.
a: That Black's device makes Jones vote Democrat.
x: In the case Jones decides to vote Republican on his own and the device stays idle.
a*: That either the sign Black relies on determines Jones's choice, or Jones could have chosen otherwise after all.
hint: How does Black know when to step in?
why: If the sign determines the choice, libertarians will not grant responsibility; if not, an alternative remains. Pereboom's tax-evasion case and others try to escape the second horn; there is little consensus.
```

## Strawson and the Reactive Attitudes

P. F. Strawson's "Freedom and Resentment" (1962; the Internet Encyclopedia of Philosophy dates it 1963) changed the subject. Responsibility, he argued, lives in **reactive attitudes**, such as resentment, gratitude, indignation and forgiveness, which respond to "the quality of others' wills towards us". In labels later given by Gary Watson, **excuses** (he was pushed) cancel resentment for one act; **exemptions** take someone out of the practice altogether, as with children, whom we see with the "objective attitude", as people "to be managed or handled or cured or trained". Could determinism exempt everyone? No: "it cannot be a consequence of any thesis which is not itself self-contradictory that abnormality is the universal condition." Critics reply that we could give the attitudes up (Galen Strawson, Nelkin). Still, after this "landmark essay" most compatibilists abandoned Hobbes-style consequentialist justifications of blame. (*Analytic Philosophy since 1950* follows other debates, so Strawson, van Inwagen and Frankfurt are introduced here.)

## Libertarian Freedom and the Luck Objection

Libertarians deny determinism. Robert Kane (1938–2024), in *The Significance of Free Will* (1996), argued that **ultimate responsibility** requires **self-forming actions**: moments, as in a struggle against temptation, when one's effort of will is undetermined. The challenge is the **luck objection**, as Clarke, Capes and Swenson set it out:

1. If there was a chance she would decide otherwise, there is a possible world exactly like ours up to the moment of choice in which she does.
2. Nothing about her, or the world, before the decision accounts for the difference.
3. So the difference is "just a matter of luck".
4. So she is not responsible for the decision.

**Objection to the argument.** Kane replies that success can be one's own though undetermined: a man who tries to shatter a glass tabletop and succeeds is responsible even if success was uncertain. In a torn decision, he says, the agent makes **dual efforts**, so whichever way she chooses, she was trying to choose that way (in his last book, of 2024, Kane made the two efforts successive rather than simultaneous).

**Reply.** Critics, including Ekstrom and Balaguer, say torn decisions do not feel like trying both ways, and that doing so would not be rational. Van Inwagen's **rollback** sharpens the worry: if God replayed the moment many times, the outcomes would vary, and nothing the agent did would settle which.

**Agent-causal** libertarians, from Reid ("If the person was the cause of that determination of his own will, he was free in that action") to Chisholm, Timothy O'Connor and Steward, hold that the agent herself, a persisting substance, causes the decision. Kant, like Reid, held that freedom requires that one could have willed differently (see *Kant*). Critics answer that luck returns: why did Leo agent-cause telling the truth here but lying in another world?

## Sceptics: Manipulation and the Basic Argument

Pereboom's four-case argument targets compatibilists. In each case Professor Plum kills White while meeting every leading compatibilist condition.

1. In Case 1, neuroscientists manipulate Plum directly, by radio-like technology; he is not responsible.
2. In Case 2, they programmed him at the start of his life; in Case 3, rigorous upbringing determined his character; in Case 4, he is an ordinary human in a deterministic world.
3. There is no relevant difference between neighbouring cases.
4. So Plum is not responsible in Case 4, and if determinism is true no one is responsible in the basic-desert sense.

**Objection.** The "soft-line" reply finds a difference, such as the presence of an intentional manipulator; McKenna's "hard-line" reply holds Plum responsible in all four cases. **Reply.** The cases can be rewritten without a manipulator, and the hard line conflicts with strong intuitions. Against Alfred Mele's similar case of a goddess who designs a zygote, Vihvelin asks why we should not reason the other way, from the naturally born duplicate's freedom to the designed agent's.

Galen Strawson's **Basic Argument** (1994) aims at libertarians too: (1) nothing can be the cause of itself (*causa sui*); (2) to be ultimately responsible, one would have to be *causa sui*, at least in crucial mental respects, since what one does flows from how one is, and changing how one is requires principles one already has; (3) so no one is ultimately responsible. Nietzsche had called the *causa sui* "the best self-contradiction that has been conceived so far" (see *Nietzsche*), and in the Leopold and Loeb defence of 1924 Clarence Darrow said: "He did not make himself and yet he is to be compelled to pay." Replies include Mele's: freedom belongs first to actions, not whole characters. Spinoza was an earlier sceptic (see *Spinoza*).

## What Science Has and Has Not Shown

In 1983 Benjamin Libet and colleagues asked people to flex a wrist whenever they chose and to report, by a dot circling a clock, when they first felt the intention. In Gregg Caruso's summary, that awareness came about 200 milliseconds before the movement but 350–400 milliseconds after the **readiness potential**, brain activity before movement first recorded by Kornhuber and Deecke. Some concluded that conscious intention comes "too late" to cause action. Libet himself kept a conscious veto.

Many philosophers, sceptics such as Pereboom and Caruso among them, reject the argument. The readiness potential may be an urge, not a decision (Mele); the tasks involve arbitrary flicks, not deliberate choices (Nahmias; Maoz and colleagues, 2019); the timing rests on introspective reports. Schurger, Sitt and Dehaene (2012) proposed that it reflects spontaneous neural fluctuations crossing a threshold, and the SEP reports that neuroscientists remain "uncertain what it signifies". Daniel Wegner's *The Illusion of Conscious Will* (2002) called the feeling of willing an illusion. A 2008 study by Vohs and Schooler, reporting that reading anti-free-will text increased cheating, has failed to replicate.

What ordinary people think is also contested. Nahmias and colleagues (2005) found that most people judged agents in deterministic scenarios able to act freely; Nichols and Knobe (2007) found that abstract questions draw incompatibilist answers and vivid cases of wrongdoing compatibilist ones. The question about Maya and the wallet remains open (see also *The Mind–Body Problem*).

## Further exploration

- **Robert Kane, *A Contemporary Introduction to Free Will* (2005).** A clear survey of the whole debate by a leading libertarian.
- **John Martin Fischer, Robert Kane, Derk Pereboom and Manuel Vargas, *Four Views on Free Will* (2007).** Compatibilism, libertarianism, hard incompatibilism and revisionism, each defended and criticised.
- **Kevin Timpe, Meghan Griffith and Neil Levy (eds), *The Routledge Companion to Free Will* (2017).** Wide-ranging essays, including chapters on Indian and Chinese perspectives.
- **Susanne Bobzien, *Determinism and Freedom in Stoic Philosophy* (1998).** The definitive study of the Stoic debate, from the Idle Argument to the cylinder.
- **Derk Pereboom, *Living Without Free Will* (2001).** The case for hard incompatibilism and for a life without basic desert.
- **Alfred R. Mele, *Effective Intentions: The Power of Conscious Will* (2009).** A philosopher's critique of Libet- and Wegner-style arguments.
- **John Martin Fischer and Mark Ravizza, *Responsibility and Control: A Theory of Moral Responsibility* (1998).** The most influential compatibilist theory of reasons-responsiveness.$freewill_master$,
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
  select $freewill_quiz$[
    {"type": "mcq", "prompt": "How does Carl Hoefer distinguish fatalism from causal determinism?", "options": ["Fatalism says events are destined to occur no matter what we do, guaranteed by gods, foreknowledge or cosmic purpose rather than by natural laws", "Fatalism is determinism plus the claim that the future can be predicted", "Fatalism is the scientific name for determinism in physics", "Fatalism says nothing is caused, while determinism says everything is"], "answerIndex": 0, "explanation": "For Hoefer, fatalism guarantees outcomes whatever we do, through the will of the gods, divine foreknowledge or some purpose in the universe; determinism fixes the future by natural law from the present state. One can have either without the other, and determinism is not the same as predictability.", "id": "q1"},
    {"type": "mcq", "prompt": "What image of the dog tied to a cart is reported by Hippolytus, and what is disputed about it?", "options": ["Epicurus used it to illustrate the swerve; scholars dispute whether the swerve is attested", "Hippolytus credits it to Zeno and Chrysippus; Bobzien argues it probably reflects a later Stoic view", "Augustine invented it to explain grace; scholars dispute whether he was a compatibilist", "Carneades used it against the Stoics; its date is unknown"], "answerIndex": 1, "explanation": "The dog follows willingly or is dragged. Hippolytus attributes the image to Zeno and Chrysippus; Bobzien attributes it to later Stoics such as Epictetus, and O'Keefe thinks that, as Chrysippus used it, it meant only that resisting fate is futile.", "id": "q2"},
    {"type": "mcq", "prompt": "In P. F. Strawson's 'Freedom and Resentment', why would the truth of determinism not show that everyone is exempt from the reactive attitudes?", "options": ["Because determinism has been shown false by quantum mechanics", "Because the reactive attitudes are justified only by their good consequences", "Because no thesis that is not self-contradictory could make abnormality the universal condition", "Because only children are exempt from blame"], "answerIndex": 2, "explanation": "Exemptions (such as those for children) work by marking someone as abnormal and suitable for the 'objective attitude'. Strawson argued that it cannot be a consequence of any non-self-contradictory thesis that abnormality is universal. After his essay most compatibilists abandoned consequentialist justifications of blame.", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about the Libet experiments is supported by the chapter?", "options": ["They proved that conscious intention never causes action", "Libet concluded that people have no conscious control of any kind", "The Vohs and Schooler cheating study confirmed their importance", "The meaning of the readiness potential remains uncertain, and critics note the tasks involved arbitrary movements, not deliberate choices"], "answerIndex": 3, "explanation": "Libet himself kept a conscious veto. Critics (Mele, Nahmias and others) argue the readiness potential may be an urge, not a decision, and the tasks were arbitrary flicks; Schurger and colleagues proposed spontaneous fluctuations, and neuroscientists remain uncertain what it signifies. The Vohs and Schooler study has failed to replicate.", "id": "q4"},
    {"type": "open", "prompt": "Set out Peter van Inwagen's Consequence Argument, explain the objection from McKay and Johnson's untossed coin, and describe how incompatibilists and compatibilists have responded.", "rubric": "A strong answer states the informal argument (our acts are consequences of the laws and the remote past; neither is up to us; so our acts are not up to us) and the structure with 'no choice' (N): determinism makes a past state plus the laws entail what we do; no one has a choice about the past or the laws; Rule Beta transfers 'no choice' along entailment; so no one has a choice about our acts. It explains the coin case: no one had a choice about 'not heads' or 'not tails', yet someone had a choice about 'neither', so Beta (via Agglomeration) is invalid, as van Inwagen conceded in 2000. It gives the repairs (a stronger N; Finch and Warfield's Beta 2) and Lewis's compatibilist reply: had I acted otherwise the laws would have been slightly different, which is not the incredible claim that I could cause a law to be broken. Credit for noting that the argument assumes freedom requires alternatives, which Frankfurt challenged.", "id": "q5"},
    {"type": "open", "prompt": "Present the luck objection to libertarian free will step by step. How does Robert Kane respond, and how do his critics reply?", "rubric": "A strong answer explains libertarianism (free will exists and is incompatible with determinism) and Kane's self-forming actions, undetermined efforts of will in moral struggle that ground ultimate responsibility. It sets out the steps: if she might have decided otherwise, there is a world identical up to the choice where she does; nothing prior accounts for the difference; so it is a matter of luck; so she is not responsible. It gives Kane's replies: the glass tabletop (undetermined success can still be one's own) and dual efforts (she is trying to make both choices, so either outcome is something she tried to do; Kane later made the efforts successive). It gives the criticisms: torn decisions do not feel like trying both ways and doing so would not be rational (Ekstrom, Balaguer), and van Inwagen's rollback argument. Credit for noting that agent-causal theories face a version of the same objection, and the parallel with the Epicurean swerve and 'random and blameless twitches'.", "id": "q6"}
  ]$freewill_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/metaphysics/free-will', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
