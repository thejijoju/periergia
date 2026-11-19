-- Logic across Traditions — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/logic-across-traditions @ research/advanced/read.
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
    'philosophy/logic-and-reasoning/logic-across-traditions',
    'research',
    'advanced',
    'read',
    $logictrad_master$> **Several civilisations studied what makes a reason good, and they did not all mean the same thing by the question.** This chapter compares Aristotle's logic of terms and the Stoics' logic of propositions; the Indian path from analogy to Dignāga's "wheel of reasons", Navya-Nyāya and the Jains; the Mohists and Gongsun Long; Arabic, Hebrew and Latin logic; and, briefly, the nineteenth-century formal revolution. Two arguments are set out step by step: Dignāga's test for a sound reason, and Ibn Taymiyya's case that the syllogism is no better than analogy. Throughout it asks whether "logic" names one subject at all.

## Is "Logic" One Subject?

Logic, in Brendan Gillon's definition, "seeks to distinguish good reasoning from bad". Reasoning can be studied from four angles: **ontic** (when do some facts require another?), **epistemic** (when does knowing some facts let us know another?), **dialectic** (when must someone who accepts some statements accept another?) and **linguistic** (which forms of sentence mark forms of inference?). "The study of reasoning in India," he writes, "has been from the ontic, epistemic and dialectic perspective, and not from the linguistic perspective, the perspective best known to modern thinkers." The linguistic angle is the one that leads to today's formal logic (see *Formal Logic: Propositions, Predicates and Proofs*).

So "good" could mean formally valid (true premises cannot yield a false conclusion, whatever the subject), a source of knowledge, or a winning move in debate. Stephen Phillips notes that in Nyāya "inference throughout … is part of epistemology": premises must be known, and a formally valid argument is not separated from a "cogent" one. Tom Tillemans warns that calling the Buddhist theory of reasons "logic", a habit dating from Stcherbatsky's *Buddhist Logic* (1930/32), can mislead, since "the notion of formal validity … is not itself explicitly discussed by Buddhist theoreticians". Marshall Willman notes that the Mohists held the rules of inference to depend partly on what particular words mean.

```quote
"Inference and argument are but two sides of the same coin: an argument can be thought, and hence become an inference; an inference can be expressed, and hence become an argument."
Brendan Gillon · "Logic in Classical Indian Philosophy", Stanford Encyclopedia of Philosophy · 2023
```

The question has a history. In 1824 H. T. Colebrooke introduced the Nyāya schema to Europe as the "Hindu syllogism"; Jonardon Ganeri has argued (1996) that later writers played down India's rationalist traditions, feeding a myth that Indian thought is arational. His introduction to the anthology *Indian Logic: A Reader* (2001) is titled "Indian Logic and the Colonization of Reason". I. M. Bocheński's *Formale Logik* (1956) gave Indian logic its own chapter; according to a review of the English translation (1961), he treated ancient, scholastic, mathematical and Indian logic as four varieties of one logic.

## Greece: Terms and Propositions

Aristotle, in Susanne Bobzien's phrase, "is the first great logician in the history of logic", and his logic was taught for some two thousand years. *Aristotle* sets out his syllogistic; what matters here is its method. A syllogism links two terms through a third, the **middle term**, and the three "figures" are defined by where the middle term sits. Aristotle went through the possible pairs of premises, showed that fourteen yield a conclusion of necessity, and rejected the rest by counterexample. First-figure syllogisms are **perfect**, needing nothing further "to show the necessary result"; the others are "reduced" to them by converting premises ("no A is B" to "no B is A") or by reductio ad impossibile, and two first-figure forms are reduced further, in effect reducing all syllogisms to two, later named Barbara and Celarent. Jonathan Lear observes that "Aristotle shares with modern logicians a fundamental interest in metatheory", proof about a system of proof. His modal syllogistic, about necessary and possible premises, is harder: whether it is coherent (Malink offers a full reconstruction) or "conceivably internally inconsistent" (Bobzien) is disputed.

Ancient commentators grouped his logical works as the *Organon*, "instrument", a title reflecting a later quarrel: the Stoics held logic to be a *part* of philosophy, the later Peripatetics merely a tool.

The Stoics built a different logic, of **propositions** rather than terms (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*). Three rival accounts of "if" emerged. For Philo a conditional is false only when its antecedent is true and its consequent false, which introduced truth-functionality into logic; for his teacher Diodorus Cronus that combination must be impossible at every time; for Chrysippus (c. 280–207 BCE) the contradictory of the consequent must be "incompatible" with the antecedent. It was said of Chrysippus that if the gods used any logic, it would be his. The bearers of truth were **assertibles**, meanings that, like Frege's senses, subsist independently of speakers, and whose truth-value can change ("it is day" is true when it is day). The Stoics rewrote "every A is B" as "if something is A, it is B", and stated patterns with ordinals: "If the 1st, the 2nd. But not: the 2nd. Therefore not: the 1st." Their logic "faded into oblivion" in late antiquity, "to be resurrected only in the 20th century".

## India: From Analogy to the Wheel of Reasons

The *Nyāya-sūtra* (c. second century CE) and the medical *Caraka-saṃhitā* describe a five-membered argument: thesis (*pratijñā*), reason (*hetu*), illustration of the general rule (*udāharaṇa*), application (*upanaya*) and conclusion (*nigamana*). *Arguments: Validity, Soundness and Form* and *What Is Philosophy?* give the classic examples, and *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* the school's history. Gillon traces a path from analogy to deduction. Caraka's example is analogical. A deductive version appears in the *Upāya-hṛdaya*, whose author surprisingly rejects it; the *Tarka-śāstra* endorses it: "Sound is not eternal, because, arising due to an effort, it arises immediately. If a thing is eternal, (then) it does not arise due to an effort. For example, space … Sound too is not that way. Therefore, sound is not eternal." The same text states the "three forms" (*tri-rūpa*) of a good reason, and their earliest mention, in a work attributed to Asaṅga, rejects them (the criterion was thought to be of non-Buddhist origin): the three conditions are older than Dignāga. Vasubandhu cut the argument to thesis, reason and example ("That which has H has S, like d").

The Buddhist Dignāga (c. 480–540), "a pivotal figure in the history of Indian logic", distinguished **inference for oneself**, a cognition, from **inference for others**, its verbal expression (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*). His canonical argument drops the application and conclusion, keeping a thesis, a reason, a similar example ("like a pot") and a dissimilar one ("like space"). The three conditions, as formulated from Dharmakīrti on, are that the subject has the reason-property; that the reason is present only in similar cases (*sapakṣa*); and that it is wholly absent from dissimilar cases (*vipakṣa*).

## Dignāga's Wheel of Reasons, Step by Step

Gillon calls Dignāga's "wheel of reasons" (*hetu-cakra*) perhaps the most original part of his work, "an equivalent alternative to the three forms of reason". Take the thesis "sound is non-eternal", and test the reason "because it is produced".

1. A reason proves a thesis about a subject only if it belongs to that subject: sound is produced.
2. It must be found in at least one similar case, a thing that has the property to be proved: a pot is produced and non-eternal.
3. It must be found in no dissimilar case, a thing lacking that property: nothing eternal, such as space, is produced.
4. A reason may occur in all, some or none of the similar cases, and in all, some or none of the dissimilar cases. That gives a three-by-three grid of nine types, abstracted from any subject matter.
5. Only two cells satisfy steps 2 and 3: present in all or some similar cases and in no dissimilar case. Every other cell fails, either because the reason turns up in a dissimilar case or because it occurs in no similar case.
6. "Produced" occurs among non-eternal things and never among eternal ones.
7. Therefore "sound is non-eternal, because it is produced" is a good argument.

Now try "sound is eternal, because it is audible", which *Informal Fallacies and Everyday Reasoning* gives as one half of a counterbalanced pair. Nothing audible other than sound exists, so the reason occurs in no similar and no dissimilar case: the central cell, "uniquely deviating". Dignāga rejects it.

**The objection.** Is this deductive logic at all? The debate is "rather lively". Dignāga's example says what is "observed", suggesting generalisation from experience, and examples have no bearing on deductive validity. Worse, "Sound is eternal, because it is audible; whatever is audible is eternal" is valid, yet Dignāga throws it out. Hayes reads him as developing inductive reasoning, Oetke defeasible reasoning (Taber criticises Oetke); Anacker calls the wheel "a pedagogic device" mapping what Vasubandhu's criteria already presuppose.

**The reply.** Gillon answers that "observed" belongs to the main clause ("every instance of H is observed to be S", not "every observed H is S"), so the rule is not a report of observations. The examples have a job: since audibility belongs to sound alone, there is "no independent empirical evidence" for the rule. Dignāga, Gillon writes, "rules out the syllogism as a bad syllogism, rather than, as we would, accept it as a valid syllogism with an unpersuasive premiss." For Tillemans, good reasons involve "formal", "factual", "epistemic" and "rhetorical" considerations together. Problems remained: Dignāga himself acknowledged that the second and third conditions are equivalent, so, as Gillon notes, one is logically superfluous; and Jain logicians argued that the three are "neither necessary, nor sufficient", since what counts is that the evidence is "impossible otherwise" (*anyathānupapatti*) than with what it proves. A deductively valid version of the canonical syllogism came to be adopted "virtually by every classical Indian thinker" and travelled with Buddhism to China, Korea and Japan.

```checkpoint
q: Which statement about the three conditions on a good reason is accurate?
a*: They predate Dignāga; his wheel of reasons offered an equivalent way of sorting reasons by where they occur.
a: Dignāga invented them in the sixth century.
x: The three forms are stated in the earlier *Tarka-śāstra* and mentioned, and rejected, in a work attributed to Asaṅga, so they predate Dignāga.
a: They require that a reason be present in every similar case.
x: A reason present in only some similar cases can still be good, provided it occurs in no dissimilar case.
a: They are a test of formal validity in the modern sense.
x: Tillemans notes that Buddhist theorists did not explicitly discuss formal validity; Dignāga even rejects a valid argument whose premise lacks independent evidence.
hint: Gillon finds the three forms in texts earlier than Dignāga.
why: The three conditions appear in the *Tarka-śāstra* and are criticised in a work attributed to Asaṅga; Dignāga's nine-cell wheel sorts reasons by presence in similar and dissimilar cases, and only two cells pass.
---
q: Why does Dignāga reject "Sound is eternal, because it is audible"?
a: Because it is invalid in form.
x: With the rule "whatever is audible is eternal" the argument is valid; Gillon notes that we would call it valid but unpersuasive.
a: Because audible things are found among eternal things.
x: Nothing audible except sound itself exists, so the reason occurs in no dissimilar case either.
a*: Because audibility occurs in neither similar nor dissimilar cases, so there is no independent evidence for the general rule.
a: Because it has a false thesis, as perception shows.
x: That would make it a rebutted reason; the wheel classifies the argument by where the reason occurs, not by the thesis.
hint: Where, apart from sound, can audibility be found?
why: It falls in the central cell, "uniquely deviating". Gillon says Dignāga rules it out as bad rather than accepting it as valid with an unpersuasive premise.
```

## Dharmakīrti, Navya-Nyāya and the Jains

Dharmakīrti (seventh century on Gillon's dating; his dates are disputed) faced the problem that haunts every general rule: how can one know that whatever has H has S without already knowing the conclusion? Against Īśvarasena, who appealed to never having seen an H without S, he grounded the rule in causation or identity. Gillon judges that "Dharmakīrti's solution does not work"; Steinkellner dissents (*Jains, Ājīvikas and Materialists: India's Other Dissenters* shows its use against the Cārvāka sceptics).

Dharmakīrti's argument for others has two members: "All Cs are Bs, like D. A is C." In his late *Vādanyāya*, stating the conclusion is a "point of defeat", since "a conclusion cannot prove itself". The contrast with Aristotle, for whom the conclusion is what "results of necessity", is sharp; Tillemans says the two rest on "considerably different philosophies of logic".

The "New Logic" (Navya-Nyāya) is traditionally dated from Gaṅgeśa of Mithilā, usually placed in the fourteenth century (older estimates say the thirteenth), and his *Tattvacintāmaṇi* (*Jewel of Reflection on the Truth about Epistemology*, in Phillips's translation), though Phillips sees no "decisive revolution". Gaṅgeśa rejected twenty-four definitions of pervasion (*vyāpti*, the general rule) before giving his own. The school's lasting achievement was a precise technical language, used also in poetics, linguistics and law. In Sanskrit "(this) pot is not in the room" and "(any) pot is not in the room" are the same sentence. Navya-Nyāya separates them by the property that "delimits" what is absent: this-pot-hood for a specific absence, pothood for a generic one. Daniel Ingalls (1951) found it stating that the absence of both A and B is the absence of A or the absence of B, and the absence of either A or B is the absence of A together with the absence of B, "recognisably versions of De Morgan's Laws". Ganeri treats it as analytic philosophy in early modern India (the parallel noted in *Frege, Russell and the Birth of Analytic Philosophy*), and Bimal Krishna Matilal, who studied with Quine, wrote *The Navya-Nyāya Doctrine of Negation* (1968; see *Modern Chinese and Indian Philosophy*).

Jain logicians, from Siddhasena Mahāmati and Akalaṅka in the eighth century (on Marie-Hélène Gorisse's dating) to Yaśovijaya (1638–1688), argued with Nyāya, Dignāga and Dharmakīrti. They held that only thesis and reason are needed; without the thesis an argument would be "like observing an archer without knowing what his target is". Their seven modes of predication (*syādvāda*; see *Jains, Ājīvikas and Materialists: India's Other Dissenters*) qualify each assertion with "somehow": a thing somehow exists, somehow does not, and so on. Set beside the others, this is a logic of predication indexed to standpoints: where a Stoic assertible is simply true or false at a time, and a reason is present or absent in each case on Dignāga's wheel, the Jains ask in what respect a predicate holds. Gorisse calls the doctrines of many-sidedness "probably their major contribution to philosophy".

## China: Disputation, Names and Analogy

The later Mohist Canons and the "Lesser Selection" (*Xiǎo Qǔ*), compiled between the late fourth and mid-third centuries BCE, return here from *Mozi, the Daoists and the Legalists: the Hundred Schools*. In Chris Fraser's translation, disputation (*biàn*) serves to "clarify divisions between this (shì) and not-this (fēi)" and to "discern the patterns of names (míng) and stuff (shí)". It distinguishes kinds by models (*fǎ*), and the Lesser Selection names four techniques: analogy (*pì*); paralleling (*móu*), "placing expressions side by side and jointly proceeding"; pulling (*yuán*), "You are so, how is it that I alone cannot be so?"; and pushing (*tuī*).

Paralleling, Fraser says, "has no obvious counterpart in other logical traditions". In one pattern the parallel holds: "White horses are horses; riding white horses is riding horses", and likewise "Yellow dogs are dogs; feeding yellow dogs is feeding dogs." In another, a sentence about something that *is not* the thing still behaves like one about the thing: "Being about to fall into a well isn't falling into a well; stopping someone about to fall into a well is stopping someone from falling into a well." By parallel, "Holding there is fate isn't fate; rejecting holding there is fate is rejecting fate", the Mohists' case against fatalism. The robber case discussed in *Informal Fallacies and Everyday Reasoning* is one where the first pattern does not carry over: robbers are people, yet the Mohists held that killing robbers is not killing people. The Mohists drew the moral themselves: such expressions "become different as they proceed, become dangerous as they change direction, fail when taken too far, and leave their roots as they flow, and so one cannot fail to be cautious and cannot invariably use them."

They also saw that grammar hides quantifiers. In A. C. Graham's translation: "Loving people requires loving all people without exception … Riding horses does not require riding all horses without exception; it is (rather) riding some horses." "Loving people" and "riding horses" look alike, but one means "all" and the other "some". Medieval Latin logicians met the same problem, below.

Was this logic? Fraser holds that the Mohists "do not investigate formal logic or deductive inference, nor formulate an explicit notion of logical consequence", though they had "a rigorous system of quantifiers". Chad Hansen went further, arguing that early Chinese theorists asked not whether a sentence is true but "whether a certain way of using words is appropriate". Graham and Harbsmeier criticised this, and Fraser finds it "unconvincing" as a claim that the Mohists lacked a concept of truth.

Gongsun Long's "white horse is not horse" (*Mozi, the Daoists and the Legalists: the Hundred Schools* gives his first two arguments) has a third: "White horse is horse combined with white. Is horse combined with white the same as horse? So I say: White horse is not horse." A universals reading is now broadly rejected among European and American scholars; others find part–whole relations, kinds and identity, or use and mention. Hansen's influential, and contested, proposal was that classical Chinese nouns behave like mass nouns: "horse" works like "water", so "white horse" names the combined stuff of white and horse, which is not the same as horse-stuff. Critics cite linguistic work finding mass/count distinctions in classical Chinese.

Xunzi listed a version of the white horse among misuses of names; his essay "Rectifying Names" holds that "names have no inherent appropriateness". Whether he was a logician is itself debated: Cua thought disputation "reach[es] its highest point" in Xunzi, while Paul Goldin reads the essay's concern as morality. Willman notes that Mohism's demise appears to have stifled interest in logic until a revival in 1894, with Sun Yirang.

## Arabic, Hebrew and Latin Logic

Tony Street prefers "Arabic logic" to "Islamic logic", since the conquerors' religion "played no significant role in the development of the subject". Its first famous episode, the debate of 932 in Baghdad, is told in *Falsafa: al-Kindī, al-Fārābī and Avicenna*: the grammarian al-Sīrāfī confronted Abū Bishr Mattā, translator of Aristotle from Syriac, who insisted that logic needs no grammar, because "the meaning is more exalted than the expression, and the expression humbler than the meaning." The account, from al-Tawḥīdī, is doubted as verbatim, and its significance is disputed (Mahdi and Endress think it important, Frank and Street do not).

Al-Fārābī read the jurists' analogies (*qiyās*) as syllogisms. Avicenna was so influential that Arabic logic divides into before and after him. He read every categorical proposition as carrying a time or modality: "every J is B" means every J is B at least once. He dismissed much of Aristotle on modal mixes: "most of what Aristotle's writings have to say about the modal mixes are tests, and are not genuine opinions". Averroes, faulting even al-Fārābī, protested that "one of the worst things a later scholar can do is to deviate from Aristotle's teaching". Al-Ghazālī, in *The Standard of Knowledge* and other works, argued that logic is free of harmful metaphysics, and late in life, in *The Distillation of the Principles of Jurisprudence* (*al-Mustaṣfā*), warned that "he who does not comprehend [logic] is not to be trusted at all in his sciences" (see *Al-Ghazālī, Averroes and the Quarrel over Reason*). In *The Correct Balance*, on secondary accounts, he drew five "balances", in effect syllogistic, conditional and disjunctive forms, from Qur'anic verses. Thirteenth-century manuals such as al-Kātibī's *Shamsiyya* were taught in madrasas "down to the present day".

## Ibn Taymiyya's Case against the Syllogism, Step by Step

Ibn Taymiyya (1263–1328) began his *Refutation of the Logicians* under house arrest in Alexandria, aiming at Aristotle's logic as Avicenna had reformulated it.

1. The logicians say analogy gives only probability, because the cause of the shared feature cannot be known with certainty, whereas a demonstrative syllogism with certain premises gives certainty.
2. But the syllogism's middle term does the same work as the cause in an analogy. Date wine is forbidden by analogy with grape wine, because both intoxicate; equally, "every date wine is an intoxicant; every intoxicant is forbidden; therefore, date wine is forbidden".
3. Knowing that intoxication brings the ruling is no different from the equally difficult problem of finding the right middle term.
4. Certain universal premises about the world, such as "all flames burn", would need a complete induction, which we lack.
5. Therefore, in his words: "Analogy … and the categorical syllogism … are equivalent. Certainty … and probability … differ only according to the subject matter."

He added that certainty can come without syllogistic form, even from a single premise, and that insisting on the form "is mere pedantry".

**The objection.** A logician will reply that the syllogism's form, not its subject matter, guarantees that true premises give a true conclusion. As Jon Hoover puts it, drawing on Khaled El-Rouayheb, Ibn Taymiyya's "imprecision" and neglect of later developments may help explain why pre-modern logicians did not engage with his criticism.

**The reply.** He need not deny that the form is valid. His target was narrower: the claim that no certain knowledge can be acquired except through the syllogism. Validity transmits certainty only from premises already certain, and the hard work, finding the cause or middle term, is the same in both. The point echoes the Mohists' analogical reasoning and Dignāga's demand for independent evidence.

```checkpoint
q: What is the central step in Ibn Taymiyya's argument that analogy and syllogism are equivalent?
a: Syllogisms are invalid unless they contain a religious premise.
x: He does not deny syllogistic validity; he argues that it adds no certainty that analogy lacks.
a*: The middle term of a syllogism plays the same role as the cause in an analogy, and is just as hard to establish.
a: Analogies are always deductively valid.
x: His point concerns certainty of premises: both methods depend on knowing that the shared feature brings the ruling.
a: Avicenna himself said that analogy gives certainty.
x: Ibn Taymiyya's opponents, the Avicennan logicians, held that analogy gives only probability.
hint: Consider date wine, grape wine and intoxication.
why: Intoxication is both the cause in the analogy and the middle term in the syllogism; knowing that it brings the ruling is the same difficulty either way, so certainty depends on subject matter, not form.
---
q: How did Avicenna read a plain categorical statement such as "every J is B"?
a: As true at all times.
x: Avicenna's "absolute" reading carries an elided "at least once", not "always".
a: As a conditional, "if something is J, it is B", in the Stoic way.
x: The rewriting of universals as conditionals is reported of the Stoics, not as Avicenna's reading.
a: As a statement about words, not things.
x: That is closer to Hansen's reading of early Chinese theory than to Avicenna's.
a*: As carrying a temporal or modal qualification: every J is B at least once.
hint: Avicenna treated every categorical proposition as modalised.
why: For Avicenna absolute propositions carry an elided "at least once", which has consequences for conversion and contradiction.
```

Jewish philosophers wrote logic too. A *Treatise on the Art of Logic* is traditionally attributed to Maimonides (see *Jewish Philosophy: from Saadia to Maimonides*); Herbert Davidson questioned the attribution and Sarah Stroumsa defended it. Gersonides wrote a logical treatise in 1319.

Latin logic grew a theory of the "properties of terms" (see *Scotus, Ockham and the Late Medieval Debates*). **Supposition** concerns what a term stands for in context. In "every man is an animal", "man" and "animal" stand for things differently: from it one may infer "every man is this animal or that animal and so on". This overlaps with what modern logic handles through quantifiers and their scope, though scholars dispute how far the parallel goes, and recalls the Mohist puzzle of loving people and riding horses. Fourteenth-century logicians also wrote on **consequences**, "the first sustained attempt at adopting a sentential/propositional perspective since the Stoics". John Buridan showed that defining a valid consequence as one whose premise cannot be true without its conclusion fails: "No sentence is negative, therefore no donkey is running" passes, since its premise falsifies itself whenever uttered. Buridan answered by redefining consequence in terms of how premise and conclusion signify things to be. Separately, he defined a formal consequence as one "valid in all terms retaining a similar form", and the SEP suggests that the medieval concept of consequence may be argued to be "the main precursor of the modern concept of logical consequence".

## Convergence and the Formal Revolution

*Leibniz* and *Formal Logic: Propositions, Predicates and Proofs* tell this story: Leibniz's dream of a *characteristica universalis* and *calculus ratiocinator*, the books of Boole and De Morgan in 1847, and Frege's *Begriffsschrift* (1879; see *Frege, Russell and the Birth of Analytic Philosophy*). It changed how the old logics were read. Robin Smith notes that it exposed "the many serious limitations of Aristotle's logic" yet brought new respect for him; the Stoics were revived, Navya-Nyāya's De Morgan laws recognised, and Bocheński found formal awareness in Dignāga's wheel.

Three lessons recur. First, India's earliest arguments were analogical, Chinese argument remained largely so, and Ibn Taymiyya argued that deduction never escaped analogy. Second, most traditions tied good reasoning to knowledge and debate: Nyāya's known premises, the opponent's "desire to know" in Buddhist theory, the Mohists' "this and not-this". Third, the conclusion's role varies: essential for Aristotle, stated twice in Nyāya's five members (as thesis and as conclusion), superfluous for Dharmakīrti. Whether these are rival logics or rival views of what logic is for remains open.

## Further exploration

- **Bimal Krishna Matilal, *The Character of Logic in India* (1998).** A posthumous survey, edited by Jonardon Ganeri and Heeraman Tiwari, of Indian logic from debate to Navya-Nyāya by its leading modern interpreter.
- **A. C. Graham, *Later Mohist Logic, Ethics and Science* (1978).** The standard reconstruction and translation of the Mohist Canons.
- **Chad Hansen, *Language and Logic in Ancient China* (1983).** The provocative mass-noun and pragmatic reading of early Chinese theories of language.
- **Catarina Dutilh Novaes and Stephen Read (eds), *The Cambridge Companion to Medieval Logic* (2016).** Latin and Arabic medieval logic in one volume.
- **William Kneale and Martha Kneale, *The Development of Logic* (1962).** The classic one-volume history of logic from Aristotle to the twentieth century.
- **I. M. Bocheński, *A History of Formal Logic* (1961).** Translated by Ivo Thomas from *Formale Logik* (1956); an early general history to give Indian logic its own chapter.
- **Khaled El-Rouayheb, *Relational Syllogisms and the History of Arabic Logic, 900–1900* (2010).** Challenges the story of decline in later Arabic logic.$logictrad_master$,
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
  select $logictrad_quiz$[
    {"type": "mcq", "prompt": "According to Brendan Gillon, from which perspective was reasoning NOT mainly studied in classical India?", "options": ["The ontic perspective", "The linguistic perspective", "The epistemic perspective", "The dialectic perspective"], "answerIndex": 1, "explanation": "Gillon writes that the study of reasoning in India was ontic, epistemic and dialectic, 'and not from the linguistic perspective, the perspective best known to modern thinkers'.", "id": "q1"},
    {"type": "mcq", "prompt": "In Dharmakīrti's theory of argument for others, what is the status of stating the conclusion?", "options": ["It is a 'point of defeat', since a conclusion cannot prove itself", "It is the essential final member, as in Aristotle", "It is optional but recommended for clarity", "It must be stated twice, as thesis and conclusion"], "answerIndex": 0, "explanation": "Dharmakīrti's argument for others has two members; stating the conclusion counts as a point of defeat. Tillemans says this and Aristotle's syllogism rest on considerably different philosophies of logic.", "id": "q2"},
    {"type": "mcq", "prompt": "What did the Mohist 'Lesser Selection' point out with 'loving people' and 'riding horses'?", "options": ["That horses cannot be loved", "That analogy is always invalid", "That 'white horse is not horse'", "That expressions of the same grammatical form can hide 'all' in one case and 'some' in the other"], "answerIndex": 3, "explanation": "In Graham's translation, loving people requires loving all people, but riding horses requires riding only some horses: grammar hides the quantifier.", "id": "q3"},
    {"type": "mcq", "prompt": "What did John Buridan's example 'No sentence is negative, therefore no donkey is running' show?", "options": ["That syllogisms of the third figure are invalid", "That donkeys cannot be the subject of logic", "That defining validity simply as 'the premise cannot be true without the conclusion' lets in a bad consequence", "That negative sentences cannot be true"], "answerIndex": 2, "explanation": "The premise falsifies itself whenever it is produced, so the simple definition counts the consequence valid; Buridan rejected it and redefined consequence in terms of how premise and conclusion signify things to be; separately, he defined formal consequence as validity 'in all terms retaining a similar form'.", "id": "q4"},
    {"type": "open", "prompt": "Set out Dignāga's 'wheel of reasons' test as applied to 'sound is non-eternal, because it is produced', then give the strongest objection to reading it as deductive logic and Gillon's reply.", "rubric": "A good answer states the conditions (the reason belongs to the subject; it occurs in at least one similar case; it occurs in no dissimilar case), explains the nine cells (all/some/none of similar and dissimilar cases) and that only two pass, and places 'produced' in a good cell (pots, not space). Objection: the word 'observed' and the use of examples suggest induction (Hayes) or defeasible reasoning (Oetke); Dignāga rejects the valid 'Sound is eternal, because it is audible'. Reply: 'observed' attaches to the main clause; the examples supply independent evidence, and Dignāga 'rules out the syllogism as a bad syllogism, rather than... accept it as a valid syllogism with an unpersuasive premiss'. Credit noting that the three conditions predate Dignāga, and the Jain objection (anyathānupapatti).", "id": "q5"},
    {"type": "open", "prompt": "Reconstruct Ibn Taymiyya's argument that the categorical syllogism is no better than analogy. Is he right? Compare his view with the Mohist or early Indian treatment of argument.", "rubric": "A good answer gives the steps: logicians say analogy yields only probability because the cause cannot be known for certain; but the middle term plays the role of the cause (date wine, grape wine, intoxication); identifying it is equally hard; certain universal premises would need complete induction; so certainty and probability differ only by subject matter. It states the objection (form guarantees truth-preservation; Hoover, after El-Rouayheb, on his imprecision and neglect of later logic) and a reply (his target is the narrower claim that certainty comes only through the syllogism). It compares with the Mohists' analogical reasoning or the Caraka-saṃhitā's analogical example and Dignāga's demand for independent evidence.", "id": "q6"}
  ]$logictrad_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/logic-across-traditions', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
