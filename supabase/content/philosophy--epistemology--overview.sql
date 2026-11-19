-- Knowledge (Epistemology) — chapter OVERVIEW master, co-written and human-reviewed.
-- philosophy/epistemology @ research/advanced/read.
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
    'philosophy/epistemology',
    'research',
    'advanced',
    'read',
    $epistov_master$> **Epistemology, the philosophy of knowledge, asks what knowing is, whether we know anything at all, and where our knowledge comes from.** This overview shows how the section's six chapters fit together: what knowledge is; whether the sceptic is right that we have none; its sources in perception, reason and other people; and truth. It then follows four questions through them: must a knower be able to check her own grounds; does knowledge rest on foundations or on a web; is the knower an individual or a community; and how did Greek, Indian, Chinese and Islamic thinkers frame all this?

## What Epistemology Asks

We know our friends (knowledge by **acquaintance**), we know *that* the shop is closed (**propositional knowledge**), and we know *how* to play the piano (**knowledge-how**). When epistemologists ask "what is knowledge?", *What Is Knowledge? From Plato to the Gettier Problem* explains, they usually mean the second kind, written "S knows that P", where P is a **proposition**, what a declarative sentence says. Not every tradition started there. The later Mohists of China treated knowing as an ability, and their concern, as Chris Fraser puts it, was not the justification or truth of beliefs; classical Indian theory centred on the **pedigree** of knowledge, the processes that produce it, called *pramāṇas*.

The section takes four questions in order: what knowledge is, as opposed to being right by luck; whether we have any; where it comes from; and what truth is.

## What Knowledge Is

The first chapter begins with Plato. The *Theaetetus* tries three definitions of knowledge (perception, true judgement, and true judgement "with an account") and rejects them all, ending in *aporia*, perplexity. The *Meno* asks why knowledge is worth more than true belief, since a true belief about the road to Larissa will get you there as surely; Socrates answers that true beliefs are like the statues of Daedalus, which run away unless "tied down" by an account of the reason why.

The modern **tripartite analysis** says knowledge is justified true belief (JTB). It is often called "the traditional analysis", but explicit statements of it before 1963 are hard to find (Alvin Plantinga granted that C. I. Lewis and Ayer gave accounts like it), and Plantinga remarked that "It is almost as if a distinguished critic created a tradition in the very act of destroying it." Julien Dutant argues that the real tradition was **infallibilist**, requiring grounds, discernible to the knower, that guarantee the truth.

The critic was Edmund Gettier, in a paper of about three pages. Smith has strong evidence that Jones will get a job and has ten coins in his pocket, and infers that the man who will get the job has ten coins in his pocket. Unknown to Smith, he himself will get the job, and he too has ten coins. If the case succeeds, truth, belief and justification are not together sufficient for knowledge, though each may still be necessary. Such cases are older: the eighth-century Buddhist Dharmottara imagined someone who sees a mirage yet finds water under a rock at that very spot, and the twelfth-century Śrīharṣa used cases that, Nilanjan Das observes, clearly have the structure of Gettier cases, to suggest that knowledge may have no satisfactory definition at all.

Repairs followed, among them **reliabilism** (a belief is justified when a reliable process produced it), Nozick's **sensitivity**, Sosa's **safety** and virtue epistemology. Linda Zagzebski argued in 1994 that any condition that does not guarantee truth leaves room for a Gettier case, and Timothy Williamson concluded that the analysis project was a mistake: knowledge is "the most general factive mental state". After sixty years, the chapter concludes, no analysis has won general agreement.

## Whether We Have Any

*Scepticism and the Answers to It* asks whether we have any knowledge at all. Juan Comesaña and Peter Klein define scepticism about a field as the claim that "the only justified attitude with respect to propositions in F is suspension of judgment". The modern debate, Duncan Pritchard notes, treats scepticism as a **paradox**: claims that each seem plausible together lead to a devastating conclusion.

The **regress**, or Agrippa's trilemma, presses for reasons until the chain of justification runs on for ever, loops back on itself, or ends in beliefs that are not justified. Nāgārjuna gave the same argument about the means of knowledge, and Ethan Mills sees in him, Jayarāśi and Śrīharṣa an Indian "skepticism about philosophy" resembling Pyrrhonism, though not all Indologists accept that each was a sceptic. The **dream** appears in the *Zhuangzi*'s "great awakening", in al-Ghazālī, who aimed it at the first truths of reason, and in Descartes, followed by his evil demon.

{{image: Brain in a vat | The modern demon: a brain kept alive in a vat and fed the experiences of a normal life.}}

Its modern successor is a brain in a vat with exactly the experiences you now have, combined with the **closure principle**, in Pritchard's form "If an agent knows P, and knows that P entails Q, then that agent knows Q". Let H be "I have hands":

1. I do not know that I am not a handless brain in a vat.
2. If I know H, then, since H entails that I am not a handless brain in a vat, I know that I am not one (by closure).
3. So I do not know H.

The answers divide by what they give up. Neo-Mooreans deny premise 1, some appealing to safety; Wittgenstein's *On Certainty* treats some propositions as **hinges** on which doubts turn. Fred Dretske and Robert Nozick deny closure, at the price of what Keith DeRose called the "abominable conjunction": "I know that I have hands but I don't know that I'm not a handless brain in a vat." Contextualists such as DeRose and David Lewis hold that the standards for truly saying "S knows that p" rise when sceptical possibilities are mentioned. Others attack the sceptic's picture of evidence, experience or reference. The Pyrrhonists, finally, treated scepticism as a cure: suspending judgement brings **tranquillity** (*ataraxia*). No answer has won, the chapter concludes, but each teaches something about knowledge.

## Where Knowledge Comes From

**Perception.** *Perception and the External World* starts from the ordinary view that we directly perceive trees and deer. Illusions and hallucinations threaten it: if a white wall looks yellow, perhaps we are aware of something yellow, a go-between such as the "sense-data" G. E. Moore introduced and Russell made famous; and if illusion and perception need the same account, perhaps we never meet the world directly. The chapter sets out this argument from illusion step by step, with its crux, which Howard Robinson calls the **Phenomenal Principle**, and the answers: sense-datum theory, idealism and phenomenalism, adverbialism, **intentionalism** (experience represents the world and can misrepresent it) and **disjunctivism** (a perception and a matching hallucination are different kinds of state). Tim Crane and Craig French conclude that the question now "is not so much whether to be a direct realist, but how to be one." The chapter follows the same questions through Ibn al-Haytham's optics, the Nyāya and Buddhist debates, and Molyneux's question about a man born blind and made to see.

**Reason and experience.** *Reason, Experience and Innate Ideas* separates three distinctions: **a priori** and **a posteriori** (how we know a truth), **analytic** and **synthetic** (what makes it true), and **necessary** and **contingent** (whether it could have been otherwise). It reports Peter Markie and M. Folescu's verdict that the textbook contest of rationalists against empiricists, unless restricted to the debate over innate knowledge, is "best left unused", and follows the question through Leibniz, Locke, Kant, Quine, Laurence BonJour's fallible rational insight and Chomsky's poverty-of-the-stimulus argument. Few philosophers now put it as "reason *or* experience", the chapter concludes.

**Other people.** *Testimony, Trust and Social Epistemology* starts from the fact that almost everything you know, you know because someone told you. Its first question, in Nick Leonard's words, is whether testimony is "a basic source of justification" or reducible to other sources: Hume held that trust ought to be proportioned to experience of when witnesses proved right, while Reid argued from children's trust that credulity is natural. The chapter goes on to crowds, experts, disagreeing peers, epistemic injustice and echo chambers.

```checkpoint
q: In the closure argument for scepticism, which premise do Dretske and Nozick reject?
a*: The second, which relies on the closure principle: they hold that one can know one has hands without knowing that one is not a brain in a vat.
a: The first: they hold that we do know we are not brains in vats.
x: Denying the first premise is the neo-Moorean answer, often backed by the safety condition.
a: Neither: they accept the conclusion that we do not know we have hands.
x: Accepting the conclusion is the sceptic's answer; Dretske and Nozick hold that we do know we have hands.
a: Both, relativised to the standards of the conversation.
x: Relativising both premises to the conversation is the contextualists' strategy (DeRose, Lewis).
hint: Think of Dretske's zebras and Nozick's sensitivity condition.
why: On Nozick's sensitivity condition my belief that I have hands is sensitive, but my belief that I am not a brain in a vat is not, so closure fails. DeRose called the result the "abominable conjunction".
---
q: Which statement about the classical Indian lists of sources of knowledge (pramāṇas) is correct?
a: The Cārvāka accepted perception and testimony.
x: The Cārvāka accepted perception alone and rejected testimony, since it presupposes that the speaker tells the truth.
a: Dignāga and Dharmakīrti counted testimony as a source in its own right.
x: They allowed only perception and inference, and treated testimony as an inference from the speaker's trustworthiness.
a*: Nyāya recognised four: perception, inference, comparison and testimony.
a: Mīmāṃsā denied that the Veda is a source of knowledge.
x: Mīmāṃsā held that the authorless Veda is a source of knowledge that is neither reasoning nor ordinary experience.
hint: One school's list included testimony and comparison.
why: Nyāya's four sources include testimony (śabda). The other schools drew the list differently, and Mīmāṃsā's Veda is, the reason-and-experience chapter says, a reminder that "reason or experience" is not an exhaustive choice.
```

## Truth

*Truth* asks, in Michael Glanzberg's words, "what truths are, and what (if anything) makes them true." Almost everyone accepts the **Tarski biconditionals** ("Snow is white" is true if and only if snow is white), but these are "an adequacy condition for theories, not a theory itself". Most theories start from Aristotle:

```quote
To say of what is that it is not, or of what is not that it is, is false, while to say of what is that it is, and of what is not that it is not, is true.
Aristotle · Metaphysics Γ 7, 1011b25 · translation as given in the Stanford Encyclopedia of Philosophy
```

The chapter tests the main theories: **correspondence** with facts; **coherence** within a system of beliefs; the pragmatists' and other **epistemic** theories, which tie truth to inquiry or justification; **deflationism**, on which "true" is a thin device for stating generalisations such as "Everything Smith says is true"; and **pluralism**, on which truth differs by domain. Correspondence, says Marian David, "may enjoy a weak majority", and "the opposition is divided". The chapter also asks what "true for me" could mean and compares Nyāya, Buddhist, Jain, Mohist and Islamic thinking.

Calling truth the aim of knowledge is this overview's own way of placing *Truth* last; the chapters give it some footing. The accounts of propositional knowledge in the first chapter, from the tripartite analysis to Williamson's, take knowledge to entail truth, and in Indian theory, in Stephen Phillips and Anand Vaidya's words, "no genuine knowledge source ever produces a false belief". Dummett and Wright argued, against the deflationists (who reply that this norm is just another generalisation), that truth is the aim of assertion, and *Truth* adds that Frankfurt's bullshitter has abandoned the practice whose aim truth is.

## Four Questions That Run Through the Section

### Inside or outside?

*What Is Knowledge? From Plato to the Gettier Problem* draws the line: for **internalists**, justification depends wholly on states within the subject's mind, while reliabilism is **externalist**, since what justifies a belief need not be accessible to the believer.

In *Scepticism and the Answers to It*, Pritchard observes that nearly all the main answers to the sceptic are externalist, making knowledge depend on facts, such as reliability or safety, that the knower need not be able to check by reflection. Against them stands the "new evil demon problem": the demon's victims have experiences just like ours and seem as justified as we are, though their processes are unreliable. The "new sceptics", Stroud among them, reply that an externalist answer is not the one we wanted, which was to determine "from the inside" whether we know.

The Indian material complicates the map. Phillips calls Gaṅgeśa's Nyāya "a super-reliabilism, an infallibilism for externalists": like reliabilism, the first chapter explains, it grounds knowledge in its causal origin, but it sets the bar at infallibility. Nyāya also denied that knowing entails knowing that you know, and, this overview notes, *Truth* makes a similar distinction when David defends correspondence against the charge that we would have to step outside our minds to check a belief. *Perception and the External World* uses "externalism" in a different sense: disjunctivists accept that experience is not fixed by what is inside the head.

### Foundations or a web?

The regress forces a choice, and *Scepticism and the Answers to It* sorts the answers by the premise each rejects. **Foundationalism** holds that some beliefs are justified by experience rather than by other beliefs; **coherentism** (BonJour, Lehrer), that beliefs are justified by fitting together; **infinitism**, that an endless chain can justify; and what Comesaña and Klein call **"positism"**, that chains end in posits neither justified nor unjustified. Coherentism faces the objection that a coherent system could be swapped wholesale between two people, keeping its coherence but not its justification; positism, that it turns "a doxastic necessity into an epistemic virtue".

On this overview's reading, the other chapters return to the choice. In *Perception and the External World*, Sellars attacked the "myth" of a given noticed before we have concepts, while Pryor's "dogmatism" holds that a perceptual seeming justifies unless defeated. In *Reason, Experience and Innate Ideas*, Quine's holism has our statements about the external world face "the tribunal of sense experience not individually, but only as a corporate body". This overview adds a caution: the coherence theory in *Truth* is a different claim from coherentism about justification. It makes truth itself a relation between beliefs, and meets its own objection: "Jane Austen was hanged for murder" coheres with some set of propositions.

A further pattern is the overview's own observation: regress arguments recur across the section, from the *Theaetetus*' last argument to Kumārila's case that demanding certification for every cognition would start a regress.

### The lone knower or the community?

Early modern thinkers distrusted knowledge from others. Locke wrote that "other men's opinions floating in one's brain" are not genuine knowledge, and the Royal Society took the motto *Nullius in verba*, roughly "take no one's word for it". Social epistemology, *Testimony, Trust and Social Epistemology* reports, came into its own only in recent decades, with C. A. J. Coady's *Testimony* (1992) as the turning point. Edward Craig, the first chapter reports, asked what the concept of knowledge is *for*, and answered that it flags reliable informants.

Other traditions gave testimony a place of its own. The later Mohist Canon A80 names hearsay or testimony beside inference and observation; "They thus explicitly recognize the social aspects of knowledge," Fraser comments. Nyāya counted testimony (*śabda*) a source in its own right, in a way Dasti's summary makes sound strikingly like modern non-reductionism. The testimony chapter offers its own suggestion, not a claim from the scholarship, that the hadith scholars' demand for transmitters too numerous to have colluded addresses the same danger as the independence premise of Condorcet's jury theorem. It also adds Miranda Fricker's **epistemic injustice**, "a wrong done to someone specifically in their capacity as a knower". Its verdict is that Reid and Nyāya were right that we must start by trusting, and Hume and the Buddhists right that trust must answer to evidence.

### How the traditions framed it

The chapters also show that the questions did not always translate. Indian *pramāṇa* theory asked which sources of knowledge there are, and the first chapter warns of a translation trap: Sanskrit allows a false *jñāna*, so the word that matches the English "knowledge" is *pramā*. Karl Potter argued that these thinkers did not mean what Gettier's critics mean, since a *pramā* is an occurrent episode of cognition, not a standing belief; J. L. Shaw, by contrast, offered a Nyāya-inspired reply to Gettier.

Chad Hansen holds that the *Zhuangzi*'s scepticism concerns the norms for using words, unlike Western scepticism about beliefs, and argued that early Chinese thinkers asked not whether a claim is true but "whether a certain way of using words is appropriate"; Fraser finds the thesis "unconvincing" if it means they lacked any concept corresponding to semantic truth. In China the question of innateness was asked of moral knowledge: Mencius' innate but incipient "sprouts" of benevolence, righteousness, wisdom and propriety echo the quarrel over innate ideas, but they are tendencies to feel and act, not Cartesian innate ideas. In the Islamic world, al-Farrāʾ, according to Louay Safi, ranked states of mind from *ʿilm*, certainty, down to *jahl*, ignorance; Ibn al-Haytham argued that many perceptions are inferences so sudden that they seem immediate; and the hadith scholars built a science of testimony.

Yet some judgements cross borders. The 2017 study "Gettier Across Cultures" found Gettier intuitions in the United States, India, Japan and Brazil, and Das adds that Śrīharṣa's and Dharmottara's cases show the judgement made independently, in Sanskrit, centuries earlier. How far intuitions about other cases vary is still disputed.

```checkpoint
q: What is the "new evil demon problem" an objection to?
a: Coherentism about justification.
x: The standing objection to coherentism is that a coherent system could be swapped between two people without its justification.
a*: Externalist theories such as reliabilism: the demon's victims seem as justified as we are, though their belief-forming processes are unreliable.
a: Contextualism.
x: Contextualism is charged with changing the subject from knowledge to sentences about knowledge.
a: Descartes' own argument from the evil demon.
x: The objection borrows the demon scenario to test externalist accounts of justification; it is not aimed at Descartes.
hint: Which theory makes justification depend on facts the believer cannot check from the inside?
why: If justification is a matter of reliability, the demon's victims are unjustified, yet they have experiences just like ours and seem as justified as we are. The "new sceptics" add that an externalist answer does not tell us "from the inside" whether we know.
---
q: Why does the testimony chapter compare the hadith scholars' tawātur with Condorcet's jury theorem?
a: Because Condorcet drew his theorem from hadith scholarship.
x: No historical link is claimed; the comparison is the chapter's own suggestion.
a: Because both show that a majority is always right.
x: The jury theorem needs voters more likely than not to be right; if they are usually wrong, adding voters makes things worse.
a: Because both required exactly seventy witnesses.
x: Proposals for the minimum number of channels ranged from two to seventy, before the view that there is no fixed number prevailed.
a*: Because both rest on the same condition, independence: many voices repeating one source count as one witness.
hint: Ten people repeating one rumour.
why: Common causes correlate errors, and a report conveyed by narrators too numerous to have colluded is guarded against that danger. The chapter marks the comparison as its own suggestion, not a claim from the scholarship.
```

## The Chapters

- *What Is Knowledge? From Plato to the Gettier Problem*: Plato, justified true belief, Gettier and his ancestors, the repairs, knowledge first, and Indian, Chinese and Islamic ideas of knowledge.
- *Scepticism and the Answers to It*: the regress, dreams, brains in vats and closure, and the answers from Moore to the Pyrrhonists.
- *Perception and the External World*: illusion and hallucination, sense data, intentionalism and disjunctivism, the Indian debates and Molyneux's question.
- *Reason, Experience and Innate Ideas*: the a priori, innate ideas from Plato to Chomsky, mathematics, and Quine and his critics.
- *Testimony, Trust and Social Epistemology*: Hume, Reid and śabda, crowds, experts and peers, epistemic injustice and misinformation.
- *Truth*: correspondence, coherence, pragmatist, deflationary and pluralist theories, relativism, and truth across traditions.

The questions continue in *Induction, Probability and Inference to the Best Explanation*, *Paradoxes: the Liar, the Heap and Zeno*, *Consciousness*, *Meaning and Reference* and *Feminist Philosophy*.

## Further exploration

- **Jennifer Nagel, *Knowledge: A Very Short Introduction* (2014).** A clear, brief survey of epistemology that covers Dharmottara as well as Gettier.
- **Barry Stroud, *The Significance of Philosophical Scepticism* (1984).** The classic case that scepticism is far harder to escape than it looks.
- **Bimal Krishna Matilal, *Perception: An Essay on Classical Indian Theories of Knowledge* (1986).** A classic account of pramāṇa theory: Nyāya realism against Buddhist views, in dialogue with analytic philosophy.
- **Laurence BonJour, *In Defense of Pure Reason* (1998).** The main modern defence of a fallible rational insight as the source of a priori justification.
- **C. A. J. Coady, *Testimony: A Philosophical Study* (1992).** The classic case against Humean reductionism, and the book that made testimony a central topic.
- **Miranda Fricker, *Epistemic Injustice: Power and the Ethics of Knowing* (2007).** The book that defined testimonial and hermeneutical injustice.
- **Michael P. Lynch, *Truth as One and Many* (2009).** The leading functionalist version of truth pluralism, with a readable statement of the scope problem.$epistov_master$,
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
  select $epistov_quiz$[
    {"type": "mcq", "prompt": "In Reason, Experience and Innate Ideas, which question does the a priori / a posteriori distinction answer?", "options": ["What makes a truth true", "Whether a truth could have been otherwise", "How we know a truth", "Whether a truth is innate"], "answerIndex": 2, "explanation": "A priori knowledge is justified independently of experience (beyond what is needed to grasp the concepts); a posteriori knowledge needs observation. What makes a sentence true is the analytic/synthetic distinction, and whether a truth could have been otherwise is the necessary/contingent distinction. The chapter shows the three come apart: 'a cube has six sides' is analytic, but someone who believes it on a reliable person's say-so knows it a posteriori.", "id": "q1"},
    {"type": "mcq", "prompt": "Why does Stephen Phillips call Gaṅgeśa's Nyāya 'a super-reliabilism, an infallibilism for externalists'?", "options": ["Because a genuine knowledge source is not merely a reliable practice but one that never yields a falsehood", "Because Nyāya held that every cognition certifies its own validity", "Because Nyāya required the knower to know that she knows", "Because Nyāya denied that testimony is a source of knowledge"], "answerIndex": 0, "explanation": "A pramāṇa is not merely a reliable practice but one that never produces a false belief, so a lucky guess lacks the right pedigree. Intrinsic validity (svataḥ prāmāṇya) was Kumārila's Mīmāṃsā view; Nyāya held validity to be extrinsic, denied that knowing entails knowing that you know, and counted testimony as a source in its own right.", "id": "q2"},
    {"type": "mcq", "prompt": "Which answer to the closure argument for scepticism treats the standards for truly saying 'S knows that p' as rising when sceptical possibilities are mentioned?", "options": ["The neo-Moorean appeal to safety", "Dretske and Nozick's denial of closure", "Putnam's argument from reference", "Contextualism, as defended by DeRose and Lewis"], "answerIndex": 3, "explanation": "Contextualism is a thesis about the word 'know': mentioning brains in vats raises the standard, so in that conversation we know neither that we are not envatted nor that we have hands, while in ordinary talk we know both, and closure holds within each context. Neo-Mooreans deny the first premise; Dretske and Nozick deny closure; Putnam argues that the sceptical hypothesis cannot even be truly stated.", "id": "q3"},
    {"type": "mcq", "prompt": "What do disjunctivists about perception deny?", "options": ["That illusions and hallucinations are possible", "That a veridical perception and a subjectively indistinguishable hallucination are the same kind of mental state", "That perception can give us knowledge", "That we can ever perceive ordinary objects directly"], "answerIndex": 1, "explanation": "Disjunctivists reject the Common Kind Claim, the 'spreading step' of the argument from hallucination, and usually pair this with naive realism, so they affirm direct perception. They accept the cost that experience is not fixed by what is inside the head. The Stanford Encyclopedia says Nyāya 'takes a disjunctivist position', treating illusion as a different kind of thing from genuine perception.", "id": "q4"},
    {"type": "open", "prompt": "Explain the difference between internalism and externalism about justification, and trace the debate through at least two chapters of this section.", "rubric": "A strong answer defines the positions: for internalists justification depends wholly on states within the subject's mind (or, in the scepticism chapter's formulation, on some condition knowable by reflection alone); for externalists such as reliabilists (Goldman) what justifies need not be accessible to the believer. It draws on several chapters: BonJour's Norman the clairvoyant as an objection to reliabilism (What Is Knowledge?); Pritchard's observation that nearly all answers to the sceptic are externalist, the new evil demon problem, and the 'new sceptics' (Stroud, Nagel, Fumerton) who want to determine 'from the inside' whether we know (Scepticism); Phillips's description of Gaṅgeśa's Nyāya as 'a super-reliabilism, an infallibilism for externalists' and Nyāya's denial that knowing entails knowing that you know (What Is Knowledge?). Better answers note that disjunctivists' 'externalism' about experience in the perception chapter is a related but different thesis, and that linking Nyāya's point to David's defence of correspondence in Truth is the overview's own suggestion.", "id": "q5"},
    {"type": "open", "prompt": "Does knowledge rest on foundations or on a web of beliefs? Set out the regress (Agrippa's trilemma), the answers to it, and how at least one other chapter bears on the choice.", "rubric": "A strong answer sets out the regress: a justified belief is justified basically or inferentially; chains of inference are infinite, circular or end in unjustified beliefs; none of these seems to justify. It matches the answers to the premises they reject: foundationalism (basic beliefs justified by experience), coherentism (BonJour, Lehrer: justification by fitting together), infinitism (Klein), and 'positism' (Wittgenstein's On Certainty, Ortega y Gasset), with objections such as the swapped coherent system and the charge of turning 'a doxastic necessity into an epistemic virtue'; it may mention Haack's foundherentism and Nāgārjuna's parallel argument. It brings in another chapter: Sellars's attack on the 'myth of the given' or Pryor's dogmatism (Perception); Quine's holism (Reason and Experience); or the coherence theory of truth and the Jane Austen objection (Truth). Better answers distinguish coherentism about justification from the coherence theory of truth (a distinction the overview draws as its own) and note that no answer has won general agreement.", "id": "q6"}
  ]$epistov_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
