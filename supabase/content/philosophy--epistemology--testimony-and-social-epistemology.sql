-- Testimony, Trust and Social Epistemology — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/testimony-and-social-epistemology @ research/advanced/read.
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
    'philosophy/epistemology/testimony-and-social-epistemology',
    'research',
    'advanced',
    'read',
    $testimony_master$> **Almost everything you know, you know because someone told you.** This chapter asks when believing others is rational. It sets out the quarrel between Hume, who wanted trust earned by evidence, and Reid, who thought it natural, and the parallel Indian debate over *śabda* (testimony) among Nyāya, Mīmāṃsā and the Buddhists; asks whether a speaker can pass on knowledge she lacks; follows chains of witnesses in Mohist China and Islamic hadith scholarship; weighs crowds, experts and disagreeing peers; and ends with epistemic injustice and echo chambers.

## Knowing from Others

You know that the earth is round and the day you were born, though you checked neither for yourself. As the *Stanford Encyclopedia of Philosophy* (SEP) entry by Nick Leonard puts it, "So much of what we know about the world, e.g., history, science, politics, one another, etc., comes from the testimony of others." **Testimony**, in the philosopher's sense, happens, in Christopher Green's words, "whenever one person tells something to someone else". **Social epistemology** studies "how people can best pursue the truth with the help of, or sometimes in the face of, other people or relevant social practices and institutions".

Early modern thinkers distrusted this dependence. Locke wrote that "other men's opinions floating in one's brain" are not genuine knowledge, and the Royal Society (1660) took the motto *Nullius in verba*, roughly "take no one's word for it". Social epistemology came into its own only in recent decades. The turning point was C. A. J. Coady's *Testimony: A Philosophical Study* (1992), with work by Elizabeth Fricker and by Edward Craig, whose account of knowledge as a flag for good informants appears in *What Is Knowledge? From Plato to the Gettier Problem*. *Informal Fallacies and Everyday Reasoning* showed that appeal to authority is usually no fallacy, and left open when trust is rational. That is this chapter's question.

## Hume, Reid and the First Big Question

Leonard frames the first question this way: "Is testimony a basic source of justification, or can testimonial justification be reduced to a combination of other epistemic sources?" A friend who reliably reports sports scores tells you your team won: you are clearly justified in believing it. A total stranger tells you the same: it is less clear. The two answers were named by Coady in 1973.

**Reductionism** says you are justified in believing a speaker only if you have positive reasons, not themselves based on testimony, to think her reliable, and no **defeater**: a reason that undercuts the belief, such as knowing she is lying. **Non-reductionism** says you are justified by default unless you have an undefeated defeater: testimony is a basic source, like perception or memory.

The first clear statements of the two positions, Green writes, "appear in David Hume and Thomas Reid". In Section 10 of his *Enquiry concerning Human Understanding* (1748), Hume wrote that "our assurance in any argument of this kind is derived from no other principle than our observation of the veracity of human testimony, and of the usual conformity of facts to the reports of witnesses" (as the *Internet Encyclopedia of Philosophy*, IEP, quotes it). That section's case against miracles is told in *Berkeley and Hume*. Hume granted that we have, in Paul Russell's phrase, a "universal propensity to credulity", but held that trust *ought* to be proportioned to experience of when witnesses proved right.

**Global** reductionism asks for evidence that testimony *in general* is reliable. Coady objected that checking it is circular (to check Alice I rely on Bill, to check Bill on Carly…) and that no one has time to confirm the facts of history or medicine for themselves. Elizabeth Fricker's **local** reductionism ("Against Gullibility", 1994) needs only reasons to trust *this* speaker on *this* topic, which you can often get. Critics reply that small children cannot check their parents yet learn from them, and that a stranger in a foreign city who says your hotel is three blocks away gives you a justified belief though you know nothing about him. Whether reductionist replies succeed, Leonard concludes, "remains an open question".

Thomas Reid, whose wider philosophy is told in *The Enlightenment and Rousseau*, argued the other way in his *Inquiry into the Human Mind* (1764). As Leonard paraphrases him, whatever reason we have to treat perception as basic, we have an analogous reason to treat testimony as basic: we are endowed with dispositions to tell the truth, to believe what we are told, and to sense when a speaker is not to be trusted. Reid named the second the **principle of credulity**. His argument from childhood, in the IEP's quotation, runs:

```quote
[I]f credulity were the effect of reasoning and experience, it must grow up and gather strength, in the same proportion as reason and experience do. But, if it is the gift of Nature, it will be strongest in childhood, and limited and restrained by experience; and the most superficial view of human nature shews, that the last is really the case, and not the first.
Thomas Reid · An Inquiry into the Human Mind, ch. VI, §24 · 1764
```

Set out step by step:

1. If our trust in testimony came from reasoning and experience, it would grow as they grow.
2. If it is natural, it will be strongest in childhood and restrained by experience.
3. Observation shows that children are the most trusting, and that experience restrains trust.
4. So our trust in testimony is natural, not learned from evidence of reliability.
5. A natural faculty of belief, like perception, may be relied on unless we have reason to doubt it; so testimony is a basic source of justification.

**Objection: gullibility.** Fricker called denying reductionism a "recipe for gullibility". Jennifer Lackey's *Learning from Words* (2008) gives the sharpest case: you see aliens from another planet drop a notebook, apparently in English, reporting that hungry tigers ate their friends. You have no defeater, but no positive reason either; believing it seems irrational. **Reply.** The default right is defeasible: Goldberg and Henderson add that a justified hearer must be one who *would* notice defeaters if they were present. **Hybrid** views split the difference: Fricker exempted children "in the developmental phase", and Lackey requires both some reason that makes trust "not irrational" and a reliable speaker: in Leonard's phrase, "it takes two to tango". Whether any hybrid works, Leonard says, "is still very much an open debate".

Reid's Aberdeen colleague George Campbell had made a similar point against Hume in his *Dissertation on Miracles* (1762). Tyler Burge (1993) later offered an *a priori* argument: "Intelligible affirmation is the face of reason; reason is a guide to truth. We are a priori prima facie entitled to take intelligible affirmation at face value." Green raises the objection that this assumes speakers' faculties work properly in a truth-friendly world, yet the argument would run just as well where they do not. Interpreters also disagree about how thoroughgoing a reductionist Hume himself was.

## Śabda: the Indian Debate

Classical India argued the same question as a dispute about the **pramāṇas**, the means of knowledge, described in *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*. That chapter promised that the debate over **śabda** (testimony, literally "word") would return here.

Nyāya counted testimony as a source in its own right: "Testimony is the assertion of a qualified speaker" (*Nyāya-sūtra* 1.1.7, in Matthew Dasti's translation). The commentator Vātsyāyana explained that such a speaker, an *āpta*, knows the truth and wants to convey it without deception, and that even foreigners can be *āptas*. Dasti's summary makes Nyāya sound strikingly like modern non-reductionism: a hearer needs no "positive evidence of trustworthiness"; "Mere absence of doubt in the asserter's ability to speak authoritatively about the issue at hand is enough." Even rumour (*aitihya*), "a testimony chain whose originator is unknown", was treated as presumptively true.

The Vaiśeṣikas and the Buddhists were reductionists. Dignāga and Dharmakīrti accepted only perception and inference (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*), treating testimony as an inference from "S is trustworthy" and "S said p". Dharmakīrti relied on scripture only for matters beyond any other means of knowledge, such as the details of karma, and held it fallible even there, which Tom Tillemans calls "a surprisingly fallibilist and pragmatic position for a deeply religious thinker". The Cārvāka materialists, as *Jains, Ājīvikas and Materialists: India's Other Dissenters* explains, rejected testimony outright, since it presupposes that the speaker tells the truth.

The Nyāya philosopher Gaṅgeśa, writing in Mithilā in the first half of the fourteenth century, answered the reductionist. Stephen Phillips reconstructs the inference the reductionist offers:

1. Speaker S stated that p.
2. S is a trustworthy authority (*āpta*).
3. What such authorities state is true.
4. So p.

**Gaṅgeśa's objection** is to premise 1. To know *what S stated*, you must already have understood her sentence, and understanding a sentence is exactly what testimony delivers. So "Testimony has to be admitted as a separate knowledge source to understand how the reductionist's inference could get started." Jayanta Bhaṭṭa had put the point generally: "The conditions that determine inferential knowledge and those that determine verbal knowledge are not the same." **Reply.** A reductionist could answer that understanding a sentence is one thing and accepting it another, and that inference governs only acceptance. Nyāya's rejoinder, in J. N. Mohanty's account, is that this confuses certifying p by inference with knowing p from testimony: at the first, unreflective level, comprehension and acceptance are, in the Stanford Encyclopedia's words, "normally fused".

Nyāya's real opponent on the other side was Mīmāṃsā, which agreed that testimony is direct but went further. For Mīmāṃsā the Veda has no author, so it cannot err as human speakers do. The Prābhākara Mīmāṃsakas, in the Stanford Encyclopedia's paraphrase, held that testimonial knowledge "wears … its truth on its sleeve" and that the speaker's intention is irrelevant, so that "a parrot can make us know something like a tape-recorder". Nyāya stressed the speaker's intention (*tātparya*); and for Gaṅgeśa, as Phillips puts it, knowing that the sounds come from a parrot is a "block" to understanding. Nyāya also insisted that every sentence, the Veda included, has an author. *Knowing from Words* (1994), edited by Bimal Krishna Matilal and Arindam Chakrabarti, set these theories beside Western ones; it includes Elizabeth Fricker's "Against Gullibility".

```checkpoint
q: What separates a reductionist from a non-reductionist about testimony?
a*: Reductionists require positive, non-testimonial reasons to trust a speaker; non-reductionists hold that we are justified by default unless we have a defeater.
a: Reductionists think testimony never gives knowledge; non-reductionists think it always does.
x: Both sides agree testimony often gives knowledge; they disagree about what justifies it.
a: Reductionists rely on God's guarantee of honest speech; non-reductionists rely on evidence.
x: Reid, a non-reductionist, said our dispositions may come from God or nature; reductionists such as Hume rely on experience.
a: Reductionists study individual testimony; non-reductionists study only group testimony.
x: The dispute is about individual hearers' justification, not about groups.
hint: Think of Hume's "observation of the veracity of human testimony" against Reid's child.
why: Reductionism, from Hume to Elizabeth Fricker, says testimonial justification reduces to perception, memory and inference about the speaker's reliability. Non-reductionism, from Reid and Nyāya to Coady and Burge, gives testimony a presumptive right of its own, lost only to defeaters.
---
q: What was Gaṅgeśa's objection to treating testimony as a kind of inference?
a: Inference is always less certain than testimony.
x: Gaṅgeśa's point concerns the order of knowing, not degrees of certainty.
a: Scripture has no author, so its truth cannot be inferred from a speaker's reliability.
x: That is the Mīmāṃsā view of the Veda, which Nyāya rejected.
a*: The inference's first premise, that the speaker stated p, already requires understanding the sentence, which is what testimony supplies.
a: Parrots can produce true sentences, so speakers' reliability does not matter.
x: That is the Prābhākara Mīmāṃsā position; Gaṅgeśa said knowing a parrot is speaking blocks knowledge.
hint: Ask how you could know what the speaker said.
why: In Phillips' reconstruction, the reductionist infers p from "S stated p" and "S is an āpta". Gaṅgeśa replies that knowing what S stated presupposes grasping the sentence, so testimony must be admitted as a separate source for the inference even to begin.
```

## Can Testimony Create Knowledge?

The second big question, in Leonard's words: "Can testimony generate knowledge, or can it merely transmit it?" The **transmission view** says a hearer knows p from a speaker's testimony only if the speaker knows p. Its motivation is an analogy with memory, which preserves knowledge but cannot create knowledge you lacked.

Lackey's **creationist teacher** challenges it. Stella teaches fourth-grade biology. She has read the textbooks, but because of her religious commitments she does not believe, and so does not know, that *Homo sapiens* evolved from *Homo erectus*. She teaches it anyway, and her pupils come to know it. If so, knowledge has been *generated* by a speaker who lacked it. Lackey's positive view, the slogan of her book, is that we learn "from words": what matters is the statements made, not the speaker's beliefs or knowledge.

The transmission theorist can **reply** by refining the principle. Robert Audi, for example, held that testimony can generate justification but only transmit knowledge, and others argue that some versions of the principle survive the cases. The classical Indian quarrel, this chapter suggests, anticipated this one: the Prābhākaras, with their tape-recorder, sided with learning from words; Nyāya, stressing the speaker's knowledge, honesty and intention, with learning from speakers.

## Chains of Witnesses: Mozi and the Hadith Scholars

The early Mohists of China proposed three standards for judging any statement, in the "Condemning Fatalism" books of the *Mozi* (35–37), as *Mozi, the Daoists and the Legalists: the Hundred Schools* notes. Chris Fraser calls them the three *fa*, "models"; Hui-chieh Loy uses the text's word *yi*, "standards"; other summaries speak of the *sān biǎo*. They are a **root** (the precedent of the ancient sage kings), a **use** (benefit to the people when applied in government) and a **source**: claims must be checked "against what people see and hear". This test, "the testimony of the masses' sense of sight and hearing" in Loy's phrase, cut both ways. Against fatalism: no one, as Fraser summarises the argument, has ever actually seen or heard fate. For ghosts: countless stories report people seeing and hearing them, which shows how credulous collective report can be.

The later Mohist *Canons* (see *Logic across Traditions*) went further. Canon A80 names three sources of knowledge: *wén* 聞, hearsay or testimony, "receiving it as passed along"; *shuō* 說, explanation or inference; and *qīn* 親, knowing "in person", by observation. Chris Fraser comments that the Mohists put the reports of others on a par with observation and inference: "They thus explicitly recognize the social aspects of knowledge."

Islamic scholarship built a science of testimony around reports (hadith) of the Prophet; on standard accounts, each report has an **isnād**, the chain of its transmitters, and a **matn**, its text. A **mutawātir** report is one conveyed by narrators so numerous, at every link of the chain, that they cannot conceivably have agreed on an untruth; a report whose chains fall short is **āḥād**, "solitary". **Tawātur**, the certainty such corroboration brings, seems to have become a technical term among rationalists and Muʿtazilite theologians by the ninth century; proposals for the minimum number of independent channels ranged from two to seventy, before the view that there is no fixed number prevailed. Most hadith are āḥād. Modern scholars have questioned the chains themselves, from Joseph Schacht's argument (1950) that many were fabricated to the methods of Harald Motzki and Gregor Schoeler (1990s), which analyse chains and texts together.

## Many Minds: Crowds and Juries

In 1906, at a livestock fair in Plymouth, about 800 people guessed the weight of an ox once slaughtered and dressed. Francis Galton reported in *Nature* in 1907 that the median guess, "the middlemost estimate", was 1,207 lb, against a measured 1,198 lb; in a follow-up he gave the mean as 1,197 lb. In 2014 Wallis found slips in Galton's transcription: the true figures were a median of 1,208 lb and a dressed weight of 1,197 lb, so the mean guess was exactly right.

{{image: Francis Galton | Francis Galton, whose 1907 note on guessing an ox's weight became the founding example of the "wisdom of crowds".}}

The Marquis de Condorcet had argued for a related result in 1785, though, as Franz Dietrich and Kai Spiekermann note, his text "does not follow modern mathematics". Their modern statement, for groups of odd size, runs:

1. Each voter is more likely than not to be right on a yes-or-no question, with the same probability p for all.
2. Voters' chances of being right are independent of one another.
3. So the probability that the majority is right increases with the group's size and approaches certainty. (In the proof, the law of large numbers ensures that as voters are added the proportion voting correctly approaches p.)

With three voters each right 80 per cent of the time, the majority is right with probability 0.896. The intuition is a coin biased towards the truth, tossed again and again. But if p is below one half, adding voters makes things worse.

**Objection: common causes.** Voters who never confer are still not *probabilistically* independent, Dietrich and Spiekermann note, "since common causes create correlations": the same witness reports, the same methods. Such correlations usually "reinforce tendencies and errors"; ten people repeating one rumour are one witness, not ten. Here is this chapter's own suggestion, not a claim from the scholarship: the hadith scholars' demand for chains so numerous that they could not have colluded addresses the same danger, so tawātur and Condorcet rest on the same condition, independence. **Reply.** Later jury theorems weaken the premises, for example requiring only independence *given* the evidence, and still derive versions of the result. In practice, though, social influence easily drags a crowd's average from the truth. What this means for democracy is taken up in *Democracy and Its Critics*.

## Experts and Peers

How does a layperson choose between experts, when she seems ill-equipped even to tell who the experts are? John Hardwig (1985) argued that a novice's reliance on an expert is necessarily blind, yet rational: trusting experts is often more reasonable than thinking everything out for oneself. Alvin Goldman's "Experts: Which Ones Should You Trust?" (2001) asked whether the trust could be less blind, and finds five kinds of evidence: the experts' arguments; agreement from other putative experts; appraisals by "meta-experts", including credentials; evidence of interests and biases; and past track records. Applied to two scientists disputing a vaccine's safety, the second needs care: agreement counts only if the agreeing experts are not copying one another.

Harder still is disagreement with a **peer**, someone roughly as likely as you to get it right. David Christensen's restaurant case (2007): five friends agree to split the bill evenly with a 20 per cent tip. Christensen works it out in his head as \$43 each; a friend with an equally good track record gets \$45. Step by step:

1. They are peers at mental arithmetic.
2. They reached different answers from the same evidence.
3. Nothing independent of the disagreement favours either.
4. So the disagreement is evidence that one of them erred, equally likely either.
5. So each should become much less confident, giving the two answers roughly equal credence (not believing \$44).

This is the **equal weight view** (Christensen, Elga, Feldman). Its "independence" premise forbids reasoning "I got \$43, so she must be wrong". The **steadfast** reply, from Thomas Kelly (2005), is that a peer's belief based on evidence E is evidence that E is good evidence, not further evidence about the bill; counting it would **double-count** E. Equal-weight theorists answer that a forensic expert's verdict plainly is new evidence over and above the forensic evidence.

The sharpest objection is **self-defeat**: philosophers disagree about disagreement, so a conciliationist who meets enough able opponents must, by her own rule, give up her view; Plantinga called this "self-referentially inconsistent". Christensen replies that even a principle almost everyone accepts can do the same:

```quote
If I have thought casually about P for 10 minutes, and have decided it is correct, and then find out that 1000 people, most of them much smarter and more familiar with the relevant evidence and arguments than I, have thought long and hard about P, and have independently but unanimously decided that P is false, I am not justified in believing P.
David Christensen · the principle of "Minimal Humility", p. 763 · 2009
```

If that principle survives possible self-application, so may conciliationism. Still, with millions on each side of most controversies, disagreement threatens scepticism on a large scale: disagreement was the first of Agrippa's Five Modes, as *Scepticism and the Answers to It* describes.

```checkpoint
q: Why does Condorcet's jury theorem need the independence premise?
a: Because voters who meet beforehand are legally barred from voting.
x: The premise is probabilistic, not legal.
a*: Because correlated errors, such as many voters relying on the same evidence, stop added voters from adding new chances of being right.
a: Because the theorem only works when voters are wrong more than half the time.
x: The reverse: if voters are usually wrong, adding more makes the majority worse.
a: Because independent voters are always more competent than those who confer.
x: Independence concerns how voters' errors relate, not how competent each is.
hint: Ten people repeating one rumour.
why: The theorem treats votes like tosses of a coin biased towards the truth. Common causes (shared evidence, methods or context) correlate errors, usually positively, which "reinforces tendencies and errors". The hadith scholars' demand for chains that could not have colluded addresses the same danger.
---
q: In Christensen's restaurant case, what does the equal weight view say he should do?
a: Believe the shares are \$44, halfway between the answers.
x: Splitting the difference applies to confidence, not to the figure believed.
a: Keep believing \$43, since he did the sum himself.
x: The independence condition forbids using his own answer as a reason to discount his peer.
a: Defer entirely to his friend, since she disagrees.
x: She is a peer, not an authority; neither answer is favoured.
a*: Become significantly less confident in \$43, giving his and his friend's answers roughly equal credence.
hint: Neither friend has any independent reason to think the other is the one who slipped.
why: On the equal weight view, learning that a peer disagrees is a reason to think you are mistaken, as strong as your reason from your own opinion. Kelly's steadfast reply says this double-counts the evidence.
```

## Epistemic Injustice

So far the question has been when hearers should trust. Miranda Fricker's *Epistemic Injustice: Power and the Ethics of Knowing* (2007) asked when they wrongly *refuse* to. (She is a different philosopher from Elizabeth Fricker.) **Epistemic injustice** is "a wrong done to someone specifically in their capacity as a knower".

In **testimonial injustice**, prejudice leads a hearer to give a speaker less credibility than she deserves. Fricker's central case is Tom Robinson in Harper Lee's *To Kill a Mockingbird*, a Black man on trial for raping a white woman, whose testimony the all-white jury rejects because of his race. In Anthony Minghella's screenplay of *The Talented Mr Ripley*, Marge Sherwood's well-grounded suspicion of Ripley is dismissed as "female intuition". Beyond practical harms such as wrongful conviction, the speaker is wronged as a knower. Fricker's remedy is a virtue of **testimonial justice**, a "reflexive critical social awareness" that corrects for prejudice. This fits *Informal Fallacies and Everyday Reasoning*: judging a witness's credibility is often legitimate; the injustice lies in judging it by identity prejudice.

**Hermeneutical injustice** occurs when a gap in shared concepts leaves someone unable to make sense of her own experience. It is structural: no individual commits it. Fricker's example is sexual harassment before the concept existed, and the story usually told is that of Carmita Wood. In the mid-1970s Wood, an administrative assistant at Cornell, resigned after persistent unwanted advances from a physicist and was refused unemployment benefit as having left for "personal reasons". Lin Farley, who had begun calling such treatment "sexual harassment", and her colleagues took up the case; on 4 May 1975, in Ithaca, about 275 women joined the first "Speak Out" on it.

Critics extended the account. Kristie Dotson (2011) described two forms of silencing: **testimonial quieting**, when an audience fails to recognise a speaker as a knower, and **testimonial smothering**, when a speaker cuts her own testimony short because she sees her audience cannot take it in. José Medina (*The Epistemology of Resistance*, 2013) argued that marginalised communities often have interpretive resources of their own, and that credibility *excess* also does damage; Elizabeth Anderson asked for structural remedies, not just individual virtue. *Feminist Philosophy* places these debates in a wider setting.

## Trust in an Age of Misinformation

**Misinformation** is false or inaccurate content not meant to mislead; **disinformation** is meant to. C. Thi Nguyen (2020) distinguishes an **epistemic bubble**, in which other voices are merely left out, perhaps by accident, from an **echo chamber**, in which they are actively excluded and discredited. Exposure to the missing facts pops a bubble, but in an echo chamber contrary evidence can strengthen belief, because its sources are already discredited: the chamber works by manipulating trust, and someone raised inside one may reason carefully and still be misled.

Conspiracy theories test the same machinery. Brian Keeley (1999) defined a conspiracy theory as "a proposed explanation of some historical event (or events) in terms of the significant causal agency of a relatively small group of persons—the conspirators—acting in secret", and argued that falsifiability is a poor test, since evidence against one is expected to be hidden; the more institutions it implicates, the less believable it is. Philosophers divide between **generalists**, who find such theories suspect as a class, and **particularists**, such as David Coady (not C. A. J. Coady), who judge each on its merits. Quassim Cassam traces much conspiracy belief to intellectual vices such as gullibility and closed-mindedness.

Doubt can also be manufactured. Naomi Oreskes and Erik Conway's *Merchants of Doubt* (2010) showed how a few physicists with industry ties kept controversy alive over tobacco, acid rain, the ozone layer and climate long after scientists had reached consensus. In *Why Trust Science?* (2019) Oreskes argues, in brief, that science deserves trust because of its social character: claims are critically vetted by a diverse community.

The answer to when trust is rational is therefore not a single rule. Reid and Nyāya were right that we must start by trusting; Hume and the Buddhists were right that trust must answer to evidence; and the hadith scholars, Condorcet and Nguyen all point to the structure of the network through which reports reach us.

## Further exploration

- **C. A. J. Coady, *Testimony: A Philosophical Study* (1992).** The classic case against Humean reductionism, and the book that made testimony a central topic.
- **Jennifer Lackey, *Learning from Words: Testimony as a Source of Knowledge* (2008).** The creationist teacher, the alien notebook and the hybrid "it takes two" view.
- **Bimal Krishna Matilal and Arindam Chakrabarti (eds.), *Knowing from Words* (1994).** Nyāya, Mīmāṃsā and Buddhist theories of śabda beside Western ones.
- **Miranda Fricker, *Epistemic Injustice: Power and the Ethics of Knowing* (2007).** The book that defined testimonial and hermeneutical injustice.
- **José Medina, *The Epistemology of Resistance* (2013).** Extends and criticises Fricker, with attention to race and gender oppression.
- **Naomi Oreskes, *Why Trust Science?* (2019).** Argues that science's trustworthiness lies in its social processes of critical vetting.
- **Alvin Goldman, *Knowledge in a Social World* (1999).** The seminal defence of a truth-centred social epistemology.$testimony_master$,
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
  select $testimony_quiz$[
    {"type": "mcq", "prompt": "What is Jennifer Lackey's creationist teacher case meant to show?", "options": ["That children cannot learn from teachers they cannot check", "That testimony is always a kind of inference from the speaker's reliability", "That a hearer can gain knowledge from a speaker who does not herself know what she says", "That religious belief is a defeater for all testimony"], "answerIndex": 2, "explanation": "Stella does not believe, and so does not know, that Homo sapiens evolved from Homo erectus, but she teaches it and her pupils come to know it. If so, testimony can generate knowledge, and the transmission view (a hearer knows p from testimony only if the speaker knows p) is false. Lackey's slogan is that we learn 'from words', not from speakers' inner states.", "id": "q1"},
    {"type": "mcq", "prompt": "Which three sources of knowledge does the later Mohist Canon A80 name?", "options": ["Hearsay or testimony (wén), explanation or inference (shuō), and knowing in person (qīn)", "Perception, inference and scripture", "The root, the source and the use", "Ritual, music and the sage kings"], "answerIndex": 0, "explanation": "Canon A80 names wén (hearsay, 'receiving it as passed along'), shuō (explanation) and qīn ('in person', observation). Chris Fraser comments that the Mohists thus 'explicitly recognize the social aspects of knowledge'. The root, source and use are the earlier Mohists' three standards (fa) for judging statements.", "id": "q2"},
    {"type": "mcq", "prompt": "What did Wallis's 2014 re-examination of Galton's ox-weighing data find?", "options": ["That Galton had invented the competition", "That the crowd's median was far from the true weight", "That fewer than a hundred people had guessed", "That transcription slips hid the fact that the mean guess was exactly right"], "answerIndex": 3, "explanation": "Galton published a median of 1,207 lb against a measured 1,198 lb, and later a mean of 1,197 lb. Wallis found slips: the median was 1,208 lb and the dressed weight 1,197 lb, so the mean of about 800 guesses had zero error.", "id": "q3"},
    {"type": "mcq", "prompt": "Which of these is an example of what Miranda Fricker calls hermeneutical injustice?", "options": ["A jury disbelieving a Black defendant because of racial prejudice", "A woman unable to name and make sense of workplace harassment before the concept of 'sexual harassment' existed", "A witness known to have lied being treated with caution", "An expert being given more credibility than a layperson on her own subject"], "answerIndex": 1, "explanation": "Hermeneutical injustice is a gap in shared interpretive resources that unfairly disadvantages someone in understanding her own experience; it is structural rather than committed by any individual. The jury case is testimonial injustice; caution about a proven liar is a legitimate credibility judgement; and trusting genuine expertise is not an injustice.", "id": "q4"},
    {"type": "open", "prompt": "Set out Reid's argument from childhood that our trust in testimony is natural, and assess whether Lackey's alien-notebook case defeats the non-reductionist conclusion. Would a hybrid view do better?", "rubric": "A strong answer reconstructs the argument (if credulity came from reasoning and experience it would grow with them; if natural it would be strongest in childhood and restrained by experience; observation shows the latter; so it is natural and, like perception, may be relied on). It explains the gullibility objection: with the notebook one has no defeater but no positive reason, yet belief seems irrational. It notes the replies: defeasibility and Goldberg and Henderson's sensitivity to defeaters, and hybrid views (Elizabeth Fricker's exemption for children; Lackey's 'it takes two' view requiring some reason that makes trust not irrational plus a reliable speaker). It may observe that the argument shows trust is natural, which is not yet the same as showing it is justified, and that the debate is still open.", "id": "q5"},
    {"type": "open", "prompt": "Islamic hadith scholars treated a report as certain (mutawātir) when its transmitters were too many to have colluded; Condorcet's jury theorem says a large majority of independent, better-than-chance voters is almost certainly right. Using this comparison (which the chapter offers as its own suggestion), explain why independence matters to collective testimony, and apply the point to echo chambers.", "rubric": "A strong answer explains the theorem's premises (competence above one half; independence) and conclusion, and the common-causes objection: shared evidence or methods correlate errors, usually positively, so many voices repeating one source count as one witness. It links tawātur's no-collusion condition to the same requirement, noting that the comparison is the chapter's interpretive suggestion, and mentions modern doubts about isnāds (Schacht; Motzki and Schoeler). It applies the point to Nguyen's echo chambers, where outside voices are actively discredited, so agreement inside the chamber is not independent confirmation, and contrasts them with epistemic bubbles. It may mention that later jury theorems weaken the independence premise.", "id": "q6"}
  ]$testimony_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/testimony-and-social-epistemology', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
