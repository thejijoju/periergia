-- What Is Knowledge? From Plato to the Gettier Problem — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/what-is-knowledge @ research/advanced/read.
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
    'philosophy/epistemology/what-is-knowledge',
    'research',
    'advanced',
    'read',
    $knowledge_master$> **What is the difference between knowing something and merely being right about it?** This chapter follows Plato's failed definitions of knowledge and his question about why knowledge beats true belief, asks whether "justified true belief" was ever the traditional analysis, and sets out Edmund Gettier's ten-coins case, its Indian and European ancestors, the main repairs, and the arguments that no repair can work. It compares Indian, Chinese and Islamic ideas of knowledge, the experiments on whether Gettier intuitions are universal, and the "swamping" problem about the value of knowing.

## Three Kinds of Knowing

We know our friends and our pets: knowledge by **acquaintance**, a term most closely associated with Bertrand Russell's *The Problems of Philosophy* (1912). We know *that* the shop is closed: **propositional knowledge** (a proposition is what a declarative sentence says, something true or false). And we know *how* to play the piano or make a pie: **knowledge-how**. When epistemologists, philosophers of knowledge, ask "what is knowledge?", they usually mean the second kind, written "S knows that P", where S is a person and P a proposition.

Is knowing how just a kind of knowing that? Ryle, in *The Concept of Mind* (1949), called that view the "intellectualist legend" and attacked it with a **regress**, an argument showing that a view leads to an endless series:

```quote
If, for any operation to be intelligently executed, a prior theoretical operation had first to be performed and performed intelligently, it would be a logical impossibility for anyone ever to break into the circle.
Gilbert Ryle · The Concept of Mind, p. 19 · 1949
```

If acting skilfully meant first contemplating a proposition, the contemplating would itself need know-how, and so on, and no one could ever act. Ryle's view long held sway, until Jason Stanley and Timothy Williamson revived intellectualism in 2001, replying, after Carl Ginet, that we often use knowledge without intentionally contemplating anything, as when a driver brakes at a red light.

The later Mohists of China, introduced in *Mozi, the Daoists and the Legalists: the Hundred Schools*, made knowing practical from the start. They treated knowing (*zhī* 知) as an ability (*néng* 能): passing by a thing and being able to describe it, or knowing how to sort things into "this" (*shì* 是) and "not-this" (*fēi* 非). Their concern, as Chris Fraser puts it, was not the justification or truth of beliefs.

## Plato's Question: the Theaetetus

Plato's *Theaetetus*, probably written about 369 BCE, is his only set-piece discussion of the question "What is knowledge?". Socrates questions the young mathematician Theaetetus in a conversation set in 399 BCE, shortly before Socrates' trial. The dialogue is **aporetic**: it ends in *aporia*, perplexity, having rejected every answer.

The first definition is "Knowledge is nothing other than perception". Socrates links it to Protagoras (see *Socrates and the Sophists*) and refutes it by noting that the mind grasps existence, sameness and difference through no single sense. The second is that knowledge is true judgement. Socrates answers with a jury: a skilled lawyer can persuade jurymen into a true judgement about events they know only at second hand, yet they lack knowledge.

The third definition is true judgement "with an account" (*logos*). Socrates tries three senses of "account". Mere speech is too weak: anyone can voice a belief. Listing a thing's elements is not enough: someone who can spell "Theaetetus" letter by letter has a true belief and the list, but still lacks knowledge. The third sense, giving the distinguishing mark of a thing, meets the dialogue's final argument:

1. Suppose knowledge of a thing is true belief about it plus an account of its distinguishing mark.
2. That account is either a true belief about the mark or knowledge of the mark.
3. If it is a true belief, nothing has been added: a true belief that picks out Theaetetus from everyone else must already include what distinguishes him.
4. If it is knowledge of the mark, "knowledge" appears in its own definition, and defining that knowledge in the same way requires knowledge of the mark's mark, and so on without end.
5. Therefore this definition fails.

Here the dialogue ends, and Socrates leaves to meet his accusers.

**The objection.** Plato never gave up the third definition. Readers called Unitarians, from Aristotle and Proclus to Cornford and Cherniss, note that elsewhere, in the *Meno* among other dialogues, Plato defends a different version: true belief with an account *of the reason why*. None of the versions refuted here is that one. Sophie-Grace Chappell and Francesco Verde, the Stanford Encyclopedia's authors, favour this reading.

**The reply.** Revisionist readers (Ryle, Robinson, Owen, McDowell and Bostock) think Plato did abandon the idea. And the dilemma has a general shape: whatever is added to true belief, one can ask whether it is a further belief, which adds too little, or further knowledge, which makes the definition circular. Whether "the reason why" escapes that question is a good test of any reading.

## Why Want Knowledge? The Meno

The *Meno*, probably written about 385 BCE, asks a different question. A man with a true belief that a road leads to Larissa will get there as surely as a man who knows the way. So why is knowledge worth more? Socrates answers that true beliefs are like the moving statues of Daedalus, which run away unless "tied down". A true belief becomes knowledge when tied down by an account of the reason why (*aitias logismos*, at 98a), and it then stays put: the knower is less likely to give up when the road at first seems to go the wrong way. The Stanford Encyclopedia reads this "true belief with an account of the reason why" as Plato's own view (see *Plato*). Gettier himself suggested in a footnote that Plato was considering such a definition in the *Theaetetus* and perhaps accepting one in the *Meno*.

## Was There Ever a "Traditional Analysis"?

The modern **tripartite analysis** says that S knows that P if and only if P is true, S believes P, and S is justified in believing P: knowledge is justified true belief, or JTB. *What Is Philosophy?* has already quoted the Stanford Encyclopedia's warning that calling this "the traditional analysis" is a convenient fiction. Alvin Plantinga made the same point:

```quote
It is almost as if a distinguished critic created a tradition in the very act of destroying it.
Alvin Plantinga · Warrant: The Current Debate · 1993
```

According to "the inherited lore of the epistemological tribe", Plantinga wrote, JTB was orthodoxy until 1963, yet explicit statements of it before Gettier are hard to find, though he granted that C. I. Lewis and A. J. Ayer gave accounts like it. Gettier's footnotes named Roderick Chisholm (1957) and Ayer (1956), whose version required being sure and having "the right to be sure". Julien Dutant, in "The Legend of the Justified True Belief Analysis" (2015), argues that the real tradition was **infallibilist**: knowledge required grounds, discernible to the knower, that guarantee the truth. Gettier's cases work only because his justification does not guarantee truth, so on Dutant's account they refute a modern view, not the historical one.

## Gettier's Ten Coins

Edmund Gettier (1927–2021) was teaching at Wayne State University, where Plantinga was a colleague, when he published "Is Justified True Belief Knowledge?" in the journal *Analysis* in 1963. It runs to about three pages and proposes no replacement. According to Duncan Pritchard, Gettier wrote it in a bid to get tenure.

Gettier relied on two assumptions: one can be justified in believing something false, and if you are justified in believing P and validly deduce Q from it, you are justified in believing Q. *What Is Philosophy?* sets out his second case, about a Ford and Barcelona. His first runs as follows. Smith and Jones have applied for the same job. Smith has strong evidence that Jones will get the job and that Jones has ten coins in his pocket: the company president told him Jones would be chosen, and he counted Jones's coins ten minutes ago. He infers that the man who will get the job has ten coins in his pocket. Unknown to Smith, he himself will get the job, and he too has ten coins in his pocket. His belief is true, but, in Gettier's words, true "in virtue of the number of coins in Smith's pocket, while Smith does not know how many coins are in his pocket".

1. If the JTB analysis is correct, every justified true belief is knowledge.
2. Smith's belief that the man who will get the job has ten coins in his pocket is true.
3. Smith believes it.
4. Smith is justified in believing it: he has strong evidence for a claim that entails it, and he sees the entailment.
5. Smith does not know it.
6. Therefore the JTB analysis is false: truth, belief and justification are not together sufficient for knowledge.

The conclusion is modest: each condition may still be *necessary*, as most epistemologists think. But one possible case is enough to sink the analysis.

**The objection.** Michael Clark replied in 1963 that Smith reasoned from a falsehood, that Jones will get the job, so a fourth condition is needed: knowledge must not be inferred from anything false. (*What Is Philosophy?* answers this with the fake barns.)

**The reply.** Richard Feldman (1974) rebuilt the ten-coins case so that Smith reasons only from truths. Smith now believes not that Jones will get the job but that the company president *told him* Jones would get it, which is true. His justification is as good as before, no falsehood appears in his reasoning, and he still seems not to know.

Stephen Hetherington finds two features in every Gettier case: the justification leaves it possible that the belief is false, and the belief is true only through luck. Zagzebski calls this "double luck": bad luck that would normally make a justified belief false is cancelled by good luck that makes it true anyway.

## Older Than Gettier

The most striking ancestors are Indian. Dharmottara, an eighth-century Buddhist commentator on Dharmakīrti (whose theory of knowledge appears in *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*), imagined someone seeking water on a hot day who sees what is in fact a mirage, yet finds water under a rock at that very spot. In Georges Dreyfus's rendering: "Can we say that we had genuine knowledge of water? The answer seems to be negative, for we were just lucky." According to Jennifer Nagel, Dharmottara also describes an observer who mistakes a cloud of insects for smoke above a fire just lit to roast meat, and concludes, truly, that there is a fire.

In the twelfth century Śrīharṣa, a poet-philosopher often (though not uncontroversially) read as an Advaita Vedāntin, attacked Udayana's definition: "Knowledge is non-mnemonic awareness of the truth", that is, true awareness that is not memory. It also covers awareness that is true by accident, he objected. You see mist, take it for smoke, and infer fire on the hill; there is fire. Or, believing falsely that only cows have horns, you infer that a horned animal is a cow; it is. Nilanjan Das observes that these cases clearly have the structure of Gettier cases. Śrīharṣa used them to suggest that knowledge may have no satisfactory definition at all.

Europe had cases too. The fourteenth-century Italian Peter of Mantua imagined seeing Plato running nearby, mistaking him for Socrates and so believing that Socrates is running, which he is, in Rome. Russell, in *Human Knowledge: Its Scope and Limits* (1948), described someone who looks at a clock that has stopped, believing it to be going, at a moment when it happens to be right: they acquire a true belief about the time, but cannot be said to know it. His interest was the nature of belief, not the analysis of knowledge.

```checkpoint
q: What does Gettier's ten-coins case show, if it succeeds?
a*: That truth, belief and justification are not together sufficient for knowledge.
a: That justification is not necessary for knowledge.
x: The case leaves the necessity of each condition untouched; Smith is justified and still fails to know. It attacks sufficiency.
a: That Smith's belief is false, so he cannot know it.
x: Smith's belief is true: he gets the job and has ten coins. The puzzle is that a true, justified belief still falls short.
a: That knowledge is impossible.
x: Gettier draws no sceptical conclusion; he shows only that one analysis of knowledge fails.
hint: Look at the difference between "necessary" and "sufficient".
why: Smith meets all three conditions yet does not know, so they cannot be jointly sufficient. Most epistemologists still think each is necessary.
---
q: How did Richard Feldman answer the "no false lemmas" repair?
a: He argued that Smith's belief was not really justified.
x: Feldman's version keeps Smith's justification as strong as before; that is the point of it.
a: He showed that the original ten-coins case contained no falsehood.
x: The original case does rely on a falsehood, that Jones will get the job; Feldman changed the case to remove it.
a*: He rebuilt the case so that Smith reasons only from the truth that the president told him Jones would get the job, and Smith still seems not to know.
a: He used Dharmottara's mirage case.
x: The mirage case involves a perceptual error; Feldman modified Gettier's own case.
hint: What happens if Smith's evidence contains no false step?
why: If a justified true belief inferred only from truths can still be lucky, forbidding inference from falsehoods does not stop Gettier cases.
```

## Repairs and Their Rivals

The decades after 1963 produced a long series of fourth conditions, chronicled in Robert Shope's *The Analysis of Knowing* (1983).

**Defeasibility.** Lehrer and Paxson (1969) proposed that knowledge is *undefeated* justified true belief: no further truth, added to your evidence, would undermine your justification. In the ten-coins case the truth "Jones will not get the job" would. But how much undermining counts?

**Causal and reliabilist theories.** Alvin Goldman (1967) required that the fact that P be suitably causally connected with the belief; the facts that made Smith's belief true played no part in causing it. But we seem to know facts that cause nothing, such as that two plus two is four. Goldman's later "What Is Justified Belief?" (1979) made justification depend on the belief's coming from a **reliable process**, one that yields a high proportion of truths; Michael Williams called this "the Reliabilist Revolution". Reliabilism is **externalist**: what justifies a belief need not be accessible to the believer, whereas for **internalists** justification depends wholly on states within the subject's mind. Critics answered with BonJour's (1980) Norman, a reliable clairvoyant who has no reasons and seems unjustified, and with the "generality problem": seeing a maple tree on a sunny afternoon belongs to many types of process (vision, perception, seeing trees in sunlight), each with its own reliability, so which counts?

**Sensitivity and safety.** Nozick's *Philosophical Explanations* (1981) required that a belief be **sensitive**: if P were false, you would not believe it. But DeRose (1995) drew from it an "abominable conjunction": George knows that he has hands but does not know that he is not a handless victim of a deceiving demon. Most epistemologists now reject sensitivity. **Safety**, a different condition, is Ernest Sosa's (1999), not Nozick's: in all nearby possible situations where you believe P, P is true; you could not easily have been wrong. Williamson and Pritchard also defend safety, though Williamson holds that one may have to decide whether safety obtains "by first deciding whether knowledge obtains, rather than vice versa".

**Virtue epistemology.** From the early 1980s Sosa developed the idea that to know is to believe the truth *because of* intellectual virtue. His model is an archer. A shot is *accurate* if it hits, *adroit* if it shows skill, and *apt* if it is accurate because adroit; a skilful shot blown off course by one gust and back on target by another is accurate and adroit but not apt. Knowledge is apt belief. Virtue *reliabilists* such as Sosa and John Greco stress faculties like perception and memory; virtue *responsibilists* such as Lorraine Code and Zagzebski stress traits like open-mindedness, a line that parallels *Virtue Ethics, Greek and Confucian*. Pritchard, following Lackey, objected that Henry's true belief in the barn county does manifest his perceptual skill. Sosa bites the bullet: Henry has "animal" knowledge but lacks "reflective" knowledge.

## Are Gettier Problems Inescapable?

In "The Inescapability of Gettier Problems" (1994) Zagzebski argued that the repair programme was doomed:

1. Take any analysis of knowledge as true belief plus some condition X that does not guarantee truth.
2. Then there is a possible case in which a belief meets X but is false.
3. Add a stroke of good luck that makes the belief true, changing nothing that bears on X.
4. The belief now meets every condition of the analysis, but it is true only by luck, and so is not knowledge.
5. Therefore every such analysis has counterexamples.

Her illustration targets Plantinga's view that knowledge requires properly functioning faculties. Mary's eyesight works properly in a suitable environment. She sees her husband's look-alike brother in the living room and believes, falsely, "My husband is in the living room". Now add that her husband is there too, out of sight. Her belief is true and meets the condition, but it is not knowledge.

**The objection.** The argument applies only to conditions that do not guarantee truth, so choose one that does. One option makes justification itself entail truth, as Dutant and a few others propose, though this is not the mainstream view. Another, which Zagzebski herself outlined, is an **anti-luck** condition: the belief must not be true by accident. A false belief cannot meet it, so step 2 fails.

**The reply.** An anti-luck condition is only as good as its account of luck, and some luck is compatible with knowledge: if you win an encyclopedia in a raffle and learn from it, you were lucky to come to know, but you do know. The condition must pick out the bad kind of luck, and no account of it has won general agreement; Pritchard now prefers to speak of epistemic "risk". Virtue theories, which also add a truth-guaranteeing condition ("true *because* competent"), face the fake barns.

## Knowledge First

Williamson's *Knowledge and Its Limits* (2000) drew a radical lesson: the analysis project was a mistake. Knowledge is not belief plus extra ingredients but one of the most basic mental states, "the most general factive mental state" (a factive state is one you can be in only if its content is true). Williamson allows that knowledge entails truth, belief and justification, but reverses the order of explanation: one's total evidence is simply one's total knowledge. There is, the Stanford Encyclopedia notes, "no very straightforward argument" for the view; its case rests on how much it explains. Śrīharṣa had already denied that treating knowledge as primitive escapes his cases.

```checkpoint
q: Whose condition is "safety", and how does it differ from Nozick's sensitivity?
a: Nozick's own: safety is simply another name for sensitivity.
x: Nozick's condition is sensitivity; the safety condition is credited to Sosa, and the two come apart.
a*: Sosa's (1999): a safe belief could not easily have been false, whereas a sensitive belief is one you would not hold if it were false.
a: Gettier's: he proposed safety as the missing fourth condition.
x: Gettier proposed no replacement analysis at all.
a: Plato's: the statues of Daedalus are the safety condition.
x: Plato's image is about the stability of knowledge, not a modern modal condition.
hint: One condition asks what you would believe if the claim were false; the other asks whether you could easily have been wrong.
why: Sensitivity looks at the nearest world where the claim is false; safety looks at nearby worlds where you believe it. Williamson and Pritchard also defend safety.
---
q: What is Zagzebski's 1994 recipe meant to show?
a: That justification is never necessary for knowledge.
x: The recipe is aimed at any analysis whose extra condition falls short of guaranteeing truth, not at justification as such.
a: That Gettier cases are impossible once safety is added.
x: The recipe is a general argument that such cases are hard to escape; it does not endorse safety.
a: That knowledge is a mental state.
x: That is Williamson's knowledge-first view, a separate response.
a*: That if the condition added to true belief does not guarantee truth, a Gettier case can always be built.
hint: Start from a justified false belief, then add a stroke of good luck.
why: Take a case where the condition is met but the belief is false, then let a second accident make it true: "double luck". Only a condition that entails truth, or an explicit anti-luck condition, escapes.
```

## Knowledge in Indian Epistemology

Indian theory of knowledge (*pramāṇa-śāstra*) centres on the **pedigree** of knowledge: the processes that produce it, called *pramāṇas*, chiefly perception, inference and testimony. One translation trap: *jñāna* is often rendered "knowledge", but Sanskrit allows a false *jñāna*, so "cognition" is better. The word that matches the English is *pramā*, and *pramāṇa*-words are factive: in the words of the Stanford Encyclopedia entry by Stephen Phillips and Anand Vaidya, "no genuine knowledge source ever produces a false belief. Only pseudo-sources do." So "knowledge cannot arise by accident. A lucky guess… would not have the right pedigree."

Is Nyāya, then, a reliabilism? *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* quotes Dasti's description of it as "a sophisticated precursor to contemporary reliabilism". Phillips is more precise about its strength: Gaṅgeśa's Nyāya is "a super-reliabilism, an infallibilism for externalists", since a knowledge source "is then not merely a reliable doxastic practice" but one that never yields falsehood. The descriptions fit together: Nyāya, like reliabilism, grounds knowledge in its causal origin, but it sets the bar at infallibility. Gaṅgeśa, the fourteenth-century thinker traditionally regarded as the founder of the New Nyāya, also has his own Gettier-style case: a parrot utters a sentence that a hearer would take as true if he did not know it came from a parrot; knowing that it does, he gains no knowledge from it. Vaidya (2022) reads him as a kind of knowledge-first theorist.

How do we know that a cognition is knowledge? Kumārila's Mīmāṃsā held that validity is intrinsic (*svataḥ prāmāṇya*), since demanding certification for every cognition would start a regress; *The Classical Indian Schools* reconstructs his argument. Nyāya held that validity is extrinsic (*parataḥ*), confirmed by success in action or later reflection, and denied that knowing entails knowing that you know. For Dharmakīrti a source of knowledge is a "reliable (*avisaṃvādin*) cognition", one that, as Dharmottara explained, leads you to obtain what you seek.

Did these thinkers mean what Gettier's critics mean? Karl Potter (1984) argued not: a *pramā* is an occurrent episode of cognition, not a standing belief. J. L. Shaw, by contrast, offered a Nyāya-inspired reply to Gettier: Smith's justification attaches to one part of his belief (Jones's Ford) and its truth to another (Brown's whereabouts), so his is not a justified true belief at all.

## China and the Islamic World

The Daoist *Zhuangzi* asks, in Chad Hansen's translation, "How would I know that what I call 'knowing' is not 'not-knowing'?" In its best-known exchange, on a bridge over the Hao River, Hui Shi challenges Zhuangzi: "You are not a fish; from whence do you know the leisure of fish?" Zhuangzi ends, "I knew it here above the Hao", playing, as A. C. Graham noted, on a question word that means "from where" rather than "how". Hansen holds that this scepticism concerns the norms for using words, unlike Western scepticism about beliefs; *Scepticism and the Answers to It* takes up both.

In Arabic, knowledge is *ʿilm*, whose root and derivatives occur around 750 times in the Qur'an. According to Louay Safi, al-Farrāʾ ranked states of mind from *ʿilm* (certainty) through *ẓann* (probable opinion) and *shakk* (doubt) to *jahl* (ignorance).

## Do Gettier Intuitions Travel?

Gettier's argument rests on a judgement about a case: that Smith does not know. Is that judgement universal? In 2001 Weinberg, Nichols and Stich, in a paper often treated as the start of experimental philosophy, reported that respondents of East Asian descent were more willing than European Americans to say a Gettier subject knows. Perhaps the intuition was a local habit.

Later studies consistently failed to replicate the result, among them Kim and Yuan's "No cross-cultural differences in the Gettier car case intuition" (2015). Then Machery, Stich and colleagues tested 521 people in the United States, India, Japan and Brazil, with control cases, and found Gettier intuitions in all four countries ("Gettier Across Cultures", 2017), suggesting a possible "core folk epistemology". Stich co-wrote both the 2001 and the 2017 papers. Das adds historical evidence: Śrīharṣa's and Dharmottara's cases show the judgement made independently, in Sanskrit, centuries earlier. How far intuitions about other cases vary is still disputed; *Analytic Philosophy since 1950* follows the wider movement.

## The Value of Knowledge: the Swamping Argument

Plato's road to Larissa poses what is now called the **primary value problem**: why is knowledge worth more than mere true belief? Zagzebski pressed a version against reliabilism that Jonathan Kvanvig (2003) and others call the "swamping problem":

1. The value of a reliable belief-forming process is wholly instrumental: it lies in its tendency to produce true beliefs.
2. A good cup of coffee from a reliable machine is no better than an equally good cup from an unreliable one.
3. Likewise, once a belief is true, its having come from a reliable process adds no value; the value of the truth "swamps" it.
4. Therefore reliabilism cannot explain why knowledge is more valuable than true belief.

**The objection.** Goldman and Olsson (2009) answer that a reliably formed true belief has value a lucky one lacks: it makes it more likely that your future beliefs of the same kind will be true. This echoes Plato's own answer that knowledge is stable.

**The reply.** That extra value is still instrumental and still measured in truths, and the swamping problem may afflict any purely instrumental, truth-based account, not just reliabilism. So virtue epistemologists look elsewhere: for Riggs knowledge is "an achievement for which the knower deserves credit", and for Greco knowers deserve credit because they reach the truth through their own virtue.

## Where Things Stand

After sixty years no analysis of knowledge has won general agreement. Some philosophers have changed the question: Edward Craig's *Knowledge and the State of Nature* (1990) asked what the concept is *for*, and answered that it flags reliable informants. The sources of knowledge are explored further in *Perception and the External World*, *Reason, Experience and Innate Ideas* and *Testimony, Trust and Social Epistemology*, and the nature of truth in *Truth*.

## Further exploration

- **Jennifer Nagel, *Knowledge: A Very Short Introduction* (2014).** A clear, brief survey of epistemology that covers Dharmottara as well as Gettier.
- **Timothy Williamson, *Knowledge and Its Limits* (2000).** The manifesto of "knowledge first", arguing that knowledge cannot be analysed into simpler parts.
- **Linda Zagzebski, *Virtues of the Mind* (1996).** Virtue epistemology modelled on virtue ethics, with her diagnosis of Gettier cases.
- **Ernest Sosa, *A Virtue Epistemology: Apt Belief and Reflective Knowledge, Volume I* (2007).** The archer and the theory of apt belief, with Sosa's answer to the fake barns.
- **Duncan Pritchard, *Epistemic Luck* (2005).** The case for safety and an "anti-luck" account of knowledge.
- **Bimal Krishna Matilal, *Perception: An Essay on Classical Indian Theories of Knowledge* (1986).** A classic account of pramāṇa theory, with a chapter on Indian Gettier-style cases.
- **Jonardon Ganeri, *The Concealed Art of the Soul* (2007).** Indian ethics and epistemology, including a chapter on the Indian cases that anticipate Gettier.$knowledge_master$,
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
  select $knowledge_quiz$[
    {"type": "mcq", "prompt": "In the Theaetetus, why does the third definition of knowledge (true judgement with an account) fail when 'account' means giving a thing's distinguishing mark?", "options": ["If the account is only a true belief about the mark it adds nothing, and if it is knowledge of the mark the definition becomes circular and regressive", "Because perception cannot grasp existence, sameness and difference", "Because a lawyer can persuade a jury into a true judgement", "Because syllables are always unknowable"], "answerIndex": 0, "explanation": "A true belief that picks out Theaetetus must already include his distinguishing mark, so adding a belief about it adds nothing; requiring knowledge of the mark puts 'knowledge' into its own definition. The perception and jury arguments target the first and second definitions.", "id": "q1"},
    {"type": "mcq", "prompt": "Which statement best reflects current scholarship on the 'traditional' justified true belief analysis?", "options": ["It was the explicit consensus from Plato to 1963", "It was invented by Gettier himself in 1963", "Explicit statements of it before Gettier are hard to find, and Dutant argues that the older tradition was infallibilist", "It was first stated by Dharmottara around 770 CE"], "answerIndex": 2, "explanation": "Plantinga remarked that a distinguished critic seemed to create a tradition in the act of destroying it, though he granted that C. I. Lewis and Ayer gave similar accounts; Dutant argues that the tradition required grounds that guarantee truth.", "id": "q2"},
    {"type": "mcq", "prompt": "Whose condition is 'safety', the requirement that in all nearby possible situations where you believe P, P is true?", "options": ["Robert Nozick's, in Philosophical Explanations (1981)", "Plato's, in the Meno", "Gettier's, in his 1963 paper", "Ernest Sosa's (1999), later also defended by Williamson and Pritchard"], "answerIndex": 3, "explanation": "Nozick's condition is sensitivity: if P were false, you would not believe it. Safety is Sosa's, and Williamson and Pritchard also defend it.", "id": "q3"},
    {"type": "mcq", "prompt": "What did the study 'Gettier Across Cultures' (Machery and colleagues, 2017) find?", "options": ["East Asian participants were far more likely than Americans to say a Gettier subject knows", "Gettier intuitions appeared among participants in the United States, India, Japan and Brazil", "Most people in every country say that a Gettier subject knows", "Intuitions about Gettier cases depend mainly on socio-economic status"], "answerIndex": 1, "explanation": "The 2001 study by Weinberg, Nichols and Stich reported cultural differences, but later studies failed to replicate them, and the 2017 study of 521 people in four countries suggested a possible 'core folk epistemology'.", "id": "q4"},
    {"type": "open", "prompt": "Set out Zagzebski's argument that Gettier problems are inescapable as a numbered argument, illustrate it with a case, and give the strongest objection and the best reply.", "rubric": "A strong answer states that any analysis of knowledge as true belief plus a condition X that does not guarantee truth allows a case where a belief meets X but is false; adding a stroke of good luck makes it true without changing X, so the belief meets the analysis but is not knowledge; hence every such analysis has counterexamples ('double luck'). It gives an illustration such as Mary, whose properly functioning eyesight leads her to mistake her husband's look-alike brother for her husband while her husband is, by luck, also in the room. The objection: choose a condition that guarantees truth, such as factive justification (Dutant and others) or an anti-luck condition, which Zagzebski herself outlined. The reply: some luck is compatible with knowledge (the raffle-won encyclopedia), so the condition must specify the bad kind of luck, and no account has won agreement; virtue theories face the fake barns. Better answers mention Williamson's knowledge-first alternative or Śrīharṣa's doubts about defining knowledge.", "id": "q5"},
    {"type": "open", "prompt": "Explain the swamping argument against reliabilism and assess one response to it. How does it relate to the question Plato raised in the Meno about the road to Larissa?", "rubric": "A strong answer explains the Meno problem: a true belief about the road to Larissa gets you there as well as knowledge does, so why is knowledge more valuable? Plato's answer is that knowledge is 'tied down' by an account of the reason why, like Daedalus' statues, and so is more stable. It sets out the swamping argument (Zagzebski; so called by Kvanvig): the value of a reliable process is purely instrumental; the coffee analogy; once a belief is true, reliability adds no value; so reliabilism cannot explain the extra value of knowledge. It assesses a response: Goldman and Olsson's view that a reliably formed true belief makes future true beliefs more likely, echoing Plato's stability answer, with the reply that this value is still instrumental and truth-based; or the virtue-theoretic view that knowledge is a creditable achievement (Riggs, Greco).", "id": "q6"}
  ]$knowledge_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/what-is-knowledge', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
