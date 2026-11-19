-- Metaethics: Are There Moral Facts? — canonical master article, co-written and human-reviewed.
-- philosophy/ethics/metaethics @ research/advanced/read.
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
    'philosophy/ethics/metaethics',
    'research',
    'advanced',
    'read',
    $meta_master$> **Is "cruelty is wrong" true in the way "water boils" is true, or is it a feeling, a plan, a convention or a mistake?** This chapter steps back from asking which acts are right to ask what moral claims are. It maps the main positions (realism, error theory, expressivism, constructivism and relativism) and works through Hume's gap between "is" and "ought", Moore's open question argument, Mackie's case that all moral claims are false, the Frege–Geach problem for expressivism and the evolutionary debunking challenge, with the Indian Mīmāṃsā school and the Islamic debate between the Muʿtazila and the Ashʿarites alongside.

## What Is Metaethics?

Most of ethics asks first-order questions: is this act wrong, should I keep this promise? **Metaethics**, in Geoff Sayre-McCord's Stanford Encyclopedia of Philosophy (SEP) definition, is "the attempt to understand the metaphysical, epistemological, semantic, and psychological, presuppositions and commitments of moral thought, talk, and practice": what a moral claim is, whether any are true, how we could know, and why they move us. The questions are old: in Plato's *Republic*, Thrasymachus and Glaucon treat justice as a human creation, while Socrates argues that it is an independent, eternal standard (see *Plato*).

The modern map can be drawn with two questions. First, do moral claims *purport to report facts*: are they beliefs that can be true or false? **Cognitivists** say yes; **non-cognitivists** say moral judgments express some other attitude, such as an emotion, approval, a prescription or a plan. Second, are some moral claims actually true? **Moral realists**, on Sayre-McCord's minimal definition, answer yes twice: moral claims "do purport to report facts and are true if they get the facts right. Moreover, they hold, at least some moral claims actually are true." **Error theorists** answer yes, then no. Richard Joyce adds a third way to be an anti-realist: grant that some moral claims are true but deny that their truth is **objective**, independent of anyone's attitudes. That covers relativism and some constructivism.

Realists divide too. **Naturalists** hold that moral facts are natural facts, open to broadly scientific investigation; **non-naturalists** hold that they are a kind of their own. **Constructivists** say moral truths are whatever a privileged point of view, such as that of fully rational agents, would construct; whether that is realism is disputed. **Theological voluntarism** (often called divine command theory) ties moral status to God's will, and faces the old objection, from Plato's *Euthyphro*, that God's will would then be arbitrary. Many treat realism as the default, so its rivals must explain why ordinary moral talk sounds so realist.

## Hume's Gap between "Is" and "Ought"

Modern metaethics usually starts from the paragraph that closes Book III, Part I, Section I of Hume's *A Treatise of Human Nature* (1740). *Berkeley and Hume* places it in Hume's philosophy; here it matters as the start of an argument.

```quote
I meet with no proposition that is not connected with an ought, or an ought not. This change is imperceptible; but is, however, of the last consequence.
David Hume · A Treatise of Human Nature, 3.1.1.27 · 1740
```

Moralists, Hume observes, reason about God or human affairs and then suddenly switch to "ought". He asks for a reason for "what seems altogether inconceivable, how this new relation can be a deduction from others, which are entirely different from it." Sayre-McCord states the point precisely: "If Hume is right, every valid argument for an evaluative conclusion either includes or presupposes some evaluative premise." From "someone is in pain" we infer "something bad is happening" only by assuming "pain is bad".

"Few passages in Hume's work," writes Rachel Cohon, "have generated more interpretive controversy." The logical reading, dominant in the twentieth century, takes Hume to say that no "ought" follows validly from premises that only say what "is"; R. M. Hare called this "Hume's Law". Others read it as a corollary of non-cognitivism or of anti-realism. Cognitivist readers note that Hume himself often reasons from facts to moral conclusions, and take him to deny only that moral properties are discoverable by *demonstrative* reason.

One distinction prevents a common confusion. Hume's gap concerns *inference* from "is" to "ought". The **naturalistic fallacy** is G. E. Moore's name for something else: *defining* goodness in natural terms. The two are often run together, but they are separate claims with separate arguments.

## Moore's Open Question Argument

{{image: G. E. Moore | G. E. Moore, whose open question argument in *Principia Ethica* (1903) shaped a century of debate about whether goodness is a natural property.}}

G. E. Moore (1873–1958) found the naturalistic fallacy in hedonists such as Bentham and evolutionary ethicists such as Herbert Spencer. His aim in *Principia Ethica* (1903), as he put it in §6, was that "nobody can foist upon us such an axiom as that 'Pleasure is the only good' or that 'The good is the desired' on the pretense that 'this is the very meaning of the word.'" His own statement of the argument is "famously unclear"; the version most metaethicists recognise runs:

1. Take any proposed naturalistic definition: "good" means N (for example, pleasant, or what we desire to desire).
2. If the definition were correct, the question "x is N, but is x good?" would be *closed*: anyone who understood the words would see that the answer must be yes, as with "x is a bachelor, but is x unmarried?"
3. But the question is *open*: a competent speaker can understand it and still sensibly doubt the answer. "Pleasure is good" is substantive, not the empty "pleasure is pleasure".
4. So "good" does not mean N.
5. The same holds for every natural property proposed; so goodness is simple, indefinable and non-natural.

The argument struck "most people at the time as decisive". Yet Moore's non-naturalism seemed to make "unacceptable metaphysical and epistemological demands", so many who accepted his case against naturalism turned to emotivism and other anti-realist views.

**Objection.** The argument shows at most that *thinking* something good differs from *thinking* it pleasant, not that *being* good differs from *being* pleasant. In Sayre-McCord's example, "Thinking that some liquid is H2O is different from thinking it is water", and one can sensibly ask whether water is H2O; yet water *is* H2O. "A difference between the thoughts does not establish a difference in the properties."

**Reply.** Moore's defenders answer that the more naturalist proposals fail, the more the failures reflect a general gap between the moral and the non-moral. Derek Parfit and Scanlon have revived the argument's spirit: natural facts are not normative, while moral facts concern what *matters* (the **Normativity Objection**), and if naturalism were true, moral–natural identities would be trivial, yet they are substantive (Parfit's **Triviality Objection**).

The present verdict nonetheless goes against Moore. In Matthew Lutz's SEP summary, the argument refutes only **analytic naturalism** (moral terms are *definable* in natural terms), not **synthetic naturalism**, on which moral properties are identical with natural ones as an empirical discovery, as water is H2O. "The common verdict today among metaethicists is that – unless it can be substantially modified or extended in some way – the OQA has no force against naturalism." In fairness to Moore, synthetic naturalism was developed partly in answer to him.

## Naturalist Realism: the Cornell School

The leading synthetic naturalists were Richard Boyd, David Brink and Nicholas Sturgeon, who worked or studied at Cornell, with Peter Railton alongside them in the 1980s. Boyd's model was health: goodness, like healthiness, is a complex natural property, not directly observable, realisable in many ways and known by its causes and effects. Moral terms refer to whatever property causally regulates their use, as "water" refers to H2O.

Gilbert Harman's *The Nature of Morality* (1977) posed the challenge. A physicist's belief that a proton passed through a cloud chamber is best explained partly by the proton. But if you see hoodlums setting a cat on fire and judge it wrong, your judgment seems fully explained by your upbringing and psychology. Sturgeon replied that moral facts do explain things: "we think Hitler was evil because Hitler was evil", and the oppressiveness of slavery figures in the best explanation of the growth of the anti-slavery movement in the United States between the Revolutionary War and the Civil War.

The sharpest objection is **Moral Twin Earth** (Horgan and Timmons, 1991), modelled on Putnam's Twin Earth (see *Analytic Philosophy since 1950*). Imagine people whose word "right" is causally regulated by a different property. On Cornell semantics their "right" means something else, so we and they would be talking past each other; yet intuitively we genuinely *disagree*. Naturalists have replied, and the debate continues.

```checkpoint
q: What does the open question argument claim to show?
a*: That "good" cannot be defined as any natural property, because "x is N, but is x good?" always remains an open question.
a: That no "ought" can be validly inferred from premises that only say what "is".
x: That is Hume's gap, a claim about inference; the open question argument concerns definition.
a: That moral claims express feelings rather than beliefs.
x: That is emotivism, which some later adopted; Moore himself held that goodness is a real, non-natural property.
a: That moral facts explain the growth of the anti-slavery movement.
x: That is Sturgeon's reply to Harman, made on behalf of naturalist realism.
hint: Compare "x is a bachelor, but is x unmarried?"
why: If "good" meant N, the question would be closed for any competent speaker; since it stays open, Moore concluded that goodness is simple and non-natural. Today most metaethicists think this refutes only analytic naturalism.
---
q: What is the main objection to Moore's argument?
a: That Moore never published *Principia Ethica*.
x: It was published in 1903.
a: That goodness is a cluster property like health.
x: That is Boyd's positive naturalist account, not an objection to the argument's logic.
a*: That a difference between two thoughts does not show a difference between two properties, as with water and H2O.
a: That moral terms refer to whatever regulates their use on Twin Earth.
x: Moral Twin Earth is an objection to Cornell realism, not to Moore.
hint: Can one sensibly ask whether water is H2O?
why: Thinking a liquid is water differs from thinking it is H2O, yet they are the same stuff. Goodness might likewise be a natural property discovered empirically, which is why synthetic naturalism escapes the argument.
```

## Mackie: Morality as a Mistake

"There are no objective values." So begins *Ethics: Inventing Right and Wrong* (1977) by the Australian philosopher J. L. Mackie (1917–1981), who coined the term **error theory**. Moral judgments, he held, are genuine beliefs aiming at facts, but nothing answers to them, so none is true, as all talk of unicorns is false if there are no unicorns. The error theorist does not conclude that torturing the innocent is *permissible*: that would be another moral claim, and equally false. His view has two steps, and so two points of attack: a conceptual claim that moral talk is committed to objective *prescriptions*, and an ontological claim that there are none.

The **argument from relativity** starts from the variety of moral codes and the stubbornness of moral disputes. The best explanation, Mackie argued, is that moral judgments "reflect adherence to and participation in different ways of life", not that some cultures perceive objective values better than others. Critics answer that much disagreement masks agreement on principles.

The **argument from queerness** has two strands. Objective values would be "qualities or relations of a very strange sort, utterly different from anything else in the universe", and to know them we would need "some special faculty of moral perception or intuition, utterly different from our ordinary ways of knowing everything else". What is strange is a requirement with "to-be-pursuedness" built in, giving reasons whatever one's desires. Rules of chess, made by human attitudes, were no problem; his target was "requirements which simply are there, in the nature of things". We believe in such things, he suggested, through "a natural human projectivist tendency", borrowing Hume's image of the mind projecting its feelings onto the world. Morality, as the title says, must be invented, and Mackie went on to propose one.

The leading reply is **companions in guilt**: if objective moral requirements are queer, so are other normative facts, such as the epistemic reasons and standards of good explanation the naturalist herself relies on. David Lewis captured the stalemate: "Strictly speaking, Mackie is right: genuine values would have to meet an impossible condition, so it is an error to think there are any. Loosely speaking, the name may go to a claimant that deserves it imperfectly … What to make of the situation is mainly a matter of temperament." Error theorists divide over what next: **fictionalists** keep moral talk as a useful fiction; **abolitionists** would drop it.

## Expressivism: Feelings, Attitudes and Plans

Non-cognitivists diagnose Moore's mistake differently: he assumed that "good" names *any* property. The question stays open because moral words express attitudes, not beliefs. The first influential version was A. J. Ayer's **emotivism**, in *Language, Truth and Logic* (1936), whose verificationism is discussed in *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*. Saying "You acted wrongly in stealing that money", Ayer argued, states nothing beyond "You stole that money":

```quote
It is as if I had said, "You stole that money," in a peculiar tone of horror, or written it with the addition of some special exclamation marks.
A. J. Ayer · Language, Truth and Logic, ch. 6 · 1936
```

(The nickname "boo-hurrah theory" came later; these are Ayer's own words.) This is not subjectivism, which says moral claims *describe* feelings and so are true or false. In 1984 he judged Mackie's error theory "closer to the truth" than his own view. Charles Stevenson, working independently in *Ethics and Language* (1944), distinguished disagreement in belief from **disagreement in attitude** and analysed "This is good" as roughly "I approve of this; do so as well". Non-cognitivism draws support from the tight link between moral judgment and motivation.

Later **expressivists** built systematic theories pairing moral sentences with the states of mind they express. For Allan Gibbard, a normative judgment expresses acceptance of norms (*Wise Choices, Apt Feelings*, 1990) or a planning attitude akin to intending (*Thinking How to Live*, 2003). Simon Blackburn's **quasi-realism** tries to "earn the right" to realist-sounding talk: "it is true that lying is wrong" just says again that lying is wrong. Critics ask why, then, it is not simply realism.

The deepest problem is logical. Here is Geach's 1965 example of the **Frege–Geach problem**:

1. If tormenting the cat is bad, getting your little brother to do it is bad.
2. Tormenting the cat is bad.
3. So getting your little brother to torment the cat is bad.

The argument is plainly valid, but only if "tormenting the cat is bad" means the same in both premises. In premise 2, says the expressivist, it expresses disapproval. In premise 1, inside an "if", it expresses none: someone who approved of tormenting cats could accept the conditional. So the phrase changes meaning and the argument equivocates, which it obviously does not. As Geach put the "Frege point", "a proposition may occur in discourse now asserted, now unasserted, and yet be recognizably the same proposition."

**Reply.** Blackburn answered that the conditional expresses a higher-order attitude: approval of letting one disapproval follow upon another. Someone who accepted both premises but rejected the conclusion would have clashing attitudes: "He has a fractured sensibility which cannot itself be an object of approval."

**Counter-objection.** Critics such as Hale answered that this turns logical inconsistency into mere pragmatic incoherence: that person seems not just unadmirable but *wrong*. Gibbard and hybrid theorists have offered subtler solutions, and the problem still "generates much controversy".

## Constructivism: Correct Procedures

**Constructivism** entered moral theory with John Rawls's lectures "Kantian Constructivism in Moral Theory" (1980). Rawls read Kant as treating objectivity as a *practical* problem for people who disagree yet must agree on what to do. Christine Korsgaard, Rawls's student, developed the view in *The Sources of Normativity* (1996). Against **substantive realism**, on which correct moral procedures track independent moral facts, she defended **procedural realism**: "there are answers to moral questions because there are correct procedures for arriving at them". Since valuing our humanity is the condition of valuing anything at all, she argued, we must value humanity in ourselves and others "on pain of incoherence". *Deontology: Duty and Respect* treats her Kantian ethics itself. Sharon Street, Korsgaard's student, defends a **Humean constructivism** on which normative truth is relative to each agent's evaluative starting points, so that an ideally coherent Caligula who valued suffering is conceivable.

**Objection.** Russ Shafer-Landau poses a dilemma modelled on the *Euthyphro*: if the constructing procedure is unconstrained, its results are arbitrary; if it is constrained, the constraints are not themselves constructed, and that is realism. Constructivism is "either arbitrary or collapses into realism". Others suspect that it presupposes the moral views it claims to construct.

The same contrast has been read into early Chinese philosophy. Mencius held that human nature (*xing*) is good, with moral "sprouts" in everyone; Xunzi answered, "Human xing is evil; what is good is artifice" (23.1a, in Paul Goldin's translation). On David Wong's reading, Mencius's morality belongs to the order of heaven (*tian*), while Xunzi's sage kings *created* ritual and moral precepts, so the pair "exemplifies the contrast between a robust moral realism … and a constructivist position". The readings are disputed, and Xunzi's inventions must still fit human nature. *Confucius, Mencius and Xunzi* and *Virtue Ethics, Greek and Confucian* give their arguments.

## Relativism: Custom as Lord of All

Herodotus tells how King Darius asked the Greeks at his court what price would make them eat their dead fathers; nothing would. He then asked the Callatiae (in A. D. Godley's translation, "Indians … who eat their parents") what would make them burn their dead fathers; they "cried aloud" that he should not speak of so horrid an act. Herodotus concluded that Pindar was right that "custom is lord of all" (*Histories* 3.38). Yet the Greeks more often drew scepticism than relativism from such diversity; relativism became prominent in the twentieth century, with anthropologists such as Ruth Benedict and Margaret Mead.

Chris Gowans separates three theses. **Descriptive relativism** says, as empirical fact, that deep moral disagreements across societies outweigh the agreements. **Metaethical relativism** says the truth or justification of moral judgments "is not absolute or universal, but is relative to the traditions, convictions, or practices of a group of persons." **Normative relativism** says we ought to tolerate those we disagree with, which "most philosophers believe" follows from neither of the others. David Wong's **pluralistic relativism** holds that "more than one morality may be true, but there are limits": human nature and the need for cooperation require, for example, reciprocity, but leave more than one true morality. Gowans calls it "the most sophisticated form of relativism developed to date".

The objections are familiar. Relativism seems unable to say that the Holocaust was objectively wrong, or that abolishing slavery was progress rather than mere change; people belong to many groups; and if "wrong" meant "what my community disapproves of", the reformer's "My community disapproves of this, but they shouldn't" would be self-contradictory, and it is not. Relativists reply that progress can mean drawing out values a society already holds.

```checkpoint
q: What does Mackie's argument from queerness say would be strange about objective values?
a: That they would vary from culture to culture.
x: Variation is the basis of his separate argument from relativity.
a*: That they would be utterly unlike anything else in the universe and need a special faculty to know them.
a: That they would be human inventions like the rules of chess.
x: Mackie accepted such institutional requirements; his target was requirements that "simply are there, in the nature of things".
a: That moral sentences would change meaning inside an "if".
x: That is the Frege–Geach problem, aimed at expressivism, not at realism.
hint: Mackie gave a metaphysical strand and an epistemological strand.
why: Objective prescriptions would have "to-be-pursuedness" built in and would demand a special faculty of moral intuition. The companions-in-guilt reply says other normative facts, such as epistemic reasons, would be just as queer.
---
q: Which of these is the dilemma Shafer-Landau poses for constructivism?
a: Either evolution tracked moral truth, or our moral beliefs match it by coincidence.
x: That is Street's Darwinian dilemma for realism.
a: Either moral claims express beliefs, or they express attitudes.
x: That is the cognitivism question on the map of positions, not an objection to constructivism.
a: Either the Greeks were right about funerals, or the Callatiae were.
x: Herodotus's story illustrates diversity of custom; it is not a dilemma for constructivism.
a*: Either the constructing procedure is unconstrained and its results arbitrary, or it is constrained by something not constructed, which is realism.
hint: It is modelled on Plato's *Euthyphro*.
why: The worry is that constructivism is unstable: "either arbitrary or collapses into realism". Critics add that it may presuppose the moral views it claims to construct.
```

## Non-Naturalist Realism Today

Non-naturalism has returned, though its present defenders distinguish themselves from Moore. Shafer-Landau's *Moral Realism: A Defence* (2003) defines the objectivity at stake as **stance-independence**: moral truths hold independently of all our evaluative attitudes, even idealised ones. David Enoch's *Taking Morality Seriously* (2011) argues that normative facts are **deliberatively indispensable**: we cannot decide what to do without them. Derek Parfit (1942–2017), in *On What Matters* (2011), defended a "non-metaphysical" non-naturalism; The objections are those Mackie and Harman pressed: non-natural properties would sit outside the causal order and explain nothing, and if intuition tracked them reliably, that would look like a "cosmic coincidence". Evolution sharpens the last worry.

## The Darwinian Dilemma

Darwin saw the point in *The Descent of Man* (1871): if "men were reared under precisely the same conditions as hive-bees", our unmarried females would "think it a sacred duty to kill their brothers". Sharon Street's "A Darwinian Dilemma for Realist Theories of Value" (2006) turned this into an argument:

1. "Our system of evaluative judgments is thoroughly saturated with evolutionary influence."
2. Natural selection favoured evaluative dispositions for their effect on reproductive success, not for tracking independent moral truths.
3. Realism holds that moral truths are stance-independent, not a function of what helped our ancestors reproduce.
4. If the realist denies any relation between evolutionary pressures and those truths, a match between our values and the truth would be a sheer coincidence, and our values are probably largely mistaken.
5. If she asserts a relation (tracking moral truth was itself adaptive), she offers a worse scientific explanation than the simpler one: these values linked circumstances to responses that aided survival and reproduction, true or not.
6. Reflection cannot rescue us, since its tools are equally contaminated.
7. So realism leads to scepticism; better an anti-realist view, such as Street's constructivism, on which evolved values can still be justified.

Richard Joyce (*The Evolution of Morality*, 2006) argues that a complete non-moral genealogy makes moral truths superfluous, like truths about witches.

**Objection.** A naturalist such as Copp argues that if moral truths concern what lets societies meet their needs, such as stable cooperation, evolution would tend to make our beliefs track them; many debunkers therefore aim only at non-naturalists. Wielenberg and Enoch offer a **third-factor** reply: survival and what promotes it are in fact good, so evolution, aiming at them, gave us mostly accurate moral beliefs. FitzPatrick argues that reflection is autonomous: we grasp truths in physics that played no part in our evolution. Parfit, as secondary accounts summarise him, replied that showing evolution led us to true normative beliefs *without assuming any* normative truth cannot be done, but that this does not count against those beliefs.

**Reply.** Street answered Copp that his theory is itself a product of evolved intuitions, so the fit is unsurprising; critics of the third-factor reply say it rests on an evolved intuition (that survival is good) and leaves the match a lucky accident. The debate is open.

## Revelation and Reason: Mīmāṃsā and Kalām

The Indian **Mīmāṃsā** school, whose theory of knowledge appears in *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*, began from Jaimini's *Mīmāṃsā Sūtra* (dated from the third or second century BCE to the early first millennium CE). Its second sūtra says "dharma is a goal defined by [Vedic] injunction (codanā)", in Daniel Arnold's translation. Dharma, the duty the Veda enjoins, is always "yet to be", so perception cannot reach it; only the Vedic injunctions, held to have no author, make it known. In our terms, not the school's, dharma is objective and not human-made, yet unknowable by perception or inference. Unlike divine command theory, there is no divine commander: the Mīmāṃsakas argued that neither the world nor the Veda needs a maker.

In Islamic theology (*kalām*) the question divided two schools, whose history *Al-Ghazālī, Averroes and the Quarrel over Reason* tells. The **Muʿtazila** held that human reason can know the basics of morality before revelation, and that God, being just and wise, cannot command what is contrary to reason; For ʿAbd al-Jabbār (935–1025), God never chooses wrong, since he knows its immorality and needs nothing. The **Ashʿarites**, followers of al-Ashʿarī (d. 935/6), held that good is what God commands and evil what God forbids: right and wrong are not objective realities knowable by nature. Al-Ghazālī, as Frank Griffel summarises him, held that human reason misleads us about whether actions are good or bad, because we confuse moral value with benefit. The Muʿtazila were moved by divine justice, the Ashʿarites by divine omnipotence: a version of the *Euthyphro* question, rational objectivism against theological voluntarism.

## Where the Debate Stands

In the 2020 PhilPapers survey, about six in ten philosophers surveyed accepted or leaned towards moral realism. A 2009 survey also found a majority leaning that way, but the organisers warn that the two drew on different populations and are not directly comparable, and an opinion survey is no evidence that realism is true.

Realists keep the sense that moral claims can be true and whole societies wrong, but owe an account of what moral facts are and how we know them. Error theorists and expressivists travel light metaphysically, but must explain away, or earn back, the realist sound and logic of moral talk. Constructivists and relativists ground morality in agents and communities, and must show that this does not make it arbitrary. Lewis may be right that part of the choice is temperament, but the arguments decide which positions remain open.

## Further exploration

- **J. L. Mackie, *Ethics: Inventing Right and Wrong* (1977).** The classic case for error theory, written for the general reader as well as for professionals.
- **Alexander Miller, *An Introduction to Contemporary Metaethics* (2003).** A standard textbook covering Moore, emotivism, quasi-realism and Cornell realism.
- **Russ Shafer-Landau, *Moral Realism: A Defence* (2003).** The leading contemporary statement of non-naturalist realism.
- **Christine M. Korsgaard, *The Sources of Normativity* (1996).** Kantian constructivism, from her Tanner Lectures.
- **Richard Joyce, *The Evolution of Morality* (2006).** The evolutionary origins of moral thinking and a debunking argument.
- **David B. Wong, *Natural Moralities: A Defense of Pluralistic Relativism* (2006).** The most developed modern relativism, drawing on Chinese as well as Western ethics.
- **George F. Hourani, *Reason and Tradition in Islamic Ethics* (1985).** Muʿtazilite rational objectivism and Ashʿarite voluntarism.$meta_master$,
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
  select $meta_quiz$[
    {"type": "mcq", "prompt": "On the standard map of metaethical positions, how does an error theorist answer the two questions 'Do moral claims purport to report facts?' and 'Are some of them true?'", "options": ["No, and so no", "Yes, and yes", "Yes, but no", "No, but yes"], "answerIndex": 2, "explanation": "Error theorists such as Mackie are cognitivists: moral judgments are beliefs that aim at facts. But they hold that the required facts (objective values) do not exist, so no positive moral claim is true. Realists answer yes twice; non-cognitivists answer no to the first question.", "id": "q1"},
    {"type": "mcq", "prompt": "Why do most metaethicists today think Moore's open question argument fails against naturalism as such?", "options": ["Because moral properties might be identical with natural properties as an empirical discovery, as water is H2O, even though the concepts differ", "Because Hume had already proved that no 'ought' follows from an 'is'", "Because the question 'x is pleasant, but is x good?' is in fact closed for competent speakers", "Because Moore himself became an emotivist"], "answerIndex": 0, "explanation": "A difference between thoughts does not establish a difference between properties. The argument refutes only analytic naturalism (moral terms are definable in natural terms), not synthetic naturalism of the Cornell kind. Hume's gap concerns inference, a different issue.", "id": "q2"},
    {"type": "mcq", "prompt": "What is the Frege–Geach problem for expressivism?", "options": ["That expressivists cannot explain why moral judgments motivate", "That moral terms on Twin Earth would refer to different properties", "That evolution would make our moral attitudes unreliable", "That a moral sentence expresses an attitude when asserted but not inside an 'if', so valid arguments such as Geach's cat example would seem to equivocate"], "answerIndex": 3, "explanation": "In 'If tormenting the cat is bad, getting your little brother to do it is bad', the embedded clause expresses no disapproval; yet the argument with 'Tormenting the cat is bad' is plainly valid. Blackburn answered with higher-order attitudes; critics say this turns inconsistency into mere pragmatic incoherence.", "id": "q3"},
    {"type": "mcq", "prompt": "According to Herodotus (Histories 3.38), what did Darius's experiment with the Greeks and the Callatiae show?", "options": ["That the Greeks' funeral customs were objectively correct", "That each people recoiled from the other's funeral custom, so that, as Pindar said, 'custom is lord of all'", "That the Callatiae had no moral rules at all", "That moral truths are known only through scripture"], "answerIndex": 1, "explanation": "The Greeks would not eat their dead fathers for any price; the Callatiae cried aloud at the idea of burning theirs. Herodotus concluded that Pindar was right that 'custom is lord of all' (Godley's translation). The story illustrates descriptive relativism, which does not by itself establish metaethical relativism.", "id": "q4"},
    {"type": "open", "prompt": "Set out Sharon Street's Darwinian dilemma for moral realism step by step, then assess one realist reply (for example the naturalist reply, the third-factor reply or the autonomy of reflection).", "rubric": "A strong answer states the premises: our evaluative judgments are thoroughly saturated with evolutionary influence; selection favoured dispositions for reproductive success, not for tracking stance-independent truths; realism holds moral truths are stance-independent. It sets out both horns: if there is no relation, any match between evolved values and the truth would be a coincidence, so our values are probably largely mistaken; if there is a relation (tracking truth was adaptive), that is a worse scientific explanation than the simple claim that these values linked circumstances to fitness-enhancing responses. It notes that reflection cannot help because its tools are equally contaminated, so realism leads to scepticism and an anti-realist (constructivist) view is preferable. It then assesses a reply: Copp's naturalism (moral truths concern what lets societies meet their needs, so evolution would track them; Street: the theory itself reflects evolved intuitions); the third-factor reply of Wielenberg and Enoch (survival is good, so evolution aimed at the good; critics: it relies on an evolved intuition and leaves the match lucky); or FitzPatrick's autonomy of reflection. It may mention Joyce's agnostic version and reaches a reasoned judgement.", "id": "q5"},
    {"type": "open", "prompt": "Compare the Mīmāṃsā view of how dharma is known with the debate between the Muʿtazila and the Ashʿarites. Where would each fit on the modern metaethical map, and what does the comparison show about the limits of that map?", "rubric": "A strong answer explains that for Mīmāṃsā dharma is 'a goal defined by [Vedic] injunction' (Mīmāṃsā Sūtra 1.1.2), always 'yet to be' and so inaccessible to perception and inference, known only through Vedic injunctions held to be authorless; in modern terms it is objective and not human-made, yet unlike divine command theory there is no divine commander. It explains that the Muʿtazila held that reason can know the basics of morality before revelation and that a just and wise God cannot command what is contrary to reason, while the Ashʿarites held that good is what God commands, and al-Ghazālī that reason confuses moral value with benefit; the dispute mirrors the Euthyphro question (rational objectivism versus theological voluntarism), driven respectively by divine justice and divine omnipotence. It treats both sides fairly, notes that the modern categories are ours and not these schools' own, and observes that the map's focus on natural versus non-natural facts says little about revelation as a source of moral knowledge.", "id": "q6"}
  ]$meta_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/ethics/metaethics', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
