-- Truth — canonical master article, co-written and human-reviewed.
-- philosophy/epistemology/truth @ research/advanced/read.
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
    'philosophy/epistemology/truth',
    'research',
    'advanced',
    'read',
    $truth_master$> **What is it for a belief or a sentence to be true, and is there anything deep to say about it at all?** Starting from Plato's puzzle about falsehood and Aristotle's dictum, this chapter tests the main theories: correspondence with facts, coherence within a system, the pragmatists' link with inquiry, the deflationists' claim that truth is a thin logical device, and the pluralists' view that truth comes in several kinds. It asks what "true for me" could mean, compares Nyāya, Buddhist, Jain, Mohist and Islamic thinking about truth, and ends with "post-truth" and Harry Frankfurt's bullshitter.

## What Is the Problem?

"The problem of truth is in a way easy to state," writes Michael Glanzberg in the Stanford Encyclopedia of Philosophy: "what truths are, and what (if anything) makes them true." That bracketed "if anything" matters. Whether there is a deep problem here at all is itself one of the questions.

What sort of thing is true or false? Philosophers call it a **truth-bearer**: a belief, a sentence, an utterance, or a **proposition**, the content a sentence expresses. Glanzberg observes that these form "a tight circle", so modern debates worry about them far less than earlier ones did.

Almost everyone accepts one thing about truth: "Snow is white" is true if and only if snow is white, and likewise for every sentence. These instances are called the **Tarski biconditionals** (a biconditional is an "if and only if" statement), after the Polish logician Alfred Tarski, who required that an adequate theory of truth imply them all; *Paradoxes: the Liar, the Heap and Zeno* explains his "Convention T". But this, Glanzberg stresses, is "an adequacy condition for theories, not a theory itself". It says which sentences are true, not what their truth consists in.

Crispin Wright (1992, 2001) listed "platitudes" any account must respect, among them "To assert is to present as true", "Some truths may never be known" and "For a sentence to be true is for it to correspond with reality". The theories below are rival ways of honouring, or explaining away, that last one. In the 2009 PhilPapers Survey of faculty at 99 leading departments, 50.8 per cent favoured correspondence, 24.8 per cent deflationism and 6.9 per cent an epistemic theory. Correspondence, says Marian David, "may enjoy a weak majority", and "the opposition is divided".

## How Can Anyone Say What Is Not?

Greek philosophy met truth through a puzzle about falsehood. The Sophists, whom *Socrates and the Sophists* introduces, argued roughly as follows:

1. To judge falsely is to judge what is not.
2. One cannot judge what is not, for it is not there to be judged.
3. To judge what is not is to judge nothing, that is, not to judge at all.
4. So false judgement is impossible.

Plato answered in the *Sophist*. A sentence such as "Theaetetus sits" combines a name and a verb. It is true when Theaetetus is in the state ascribed, false when he is in some other state. Even in the false case the ascribed state still *is*; it merely differs from his actual one. So "only things that are show up in this account", and premise 2 loses its grip, though sentences with empty names, such as "Pegasus flies", remain a puzzle.

Aristotle then gave the formula most theories still start from:

```quote
To say of what is that it is not, or of what is not that it is, is false, while to say of what is that it is, and of what is not that it is not, is true.
Aristotle · Metaphysics Γ 7, 1011b25 · translation as given in the Stanford Encyclopedia of Philosophy
```

Tarski often said his definition captured the "classical Aristotelian conception of truth", a label common in the Lvov–Warsaw school. Yet David notes that the dictum "does not highlight the basic correspondence intuition": it mentions no relation and no facts. It is "a muted, relatively minimal version" of correspondence, and has also been claimed as an ancestor of the deflationary theories below.

Later writers made the relation explicit. Aquinas, discussed in *Thomas Aquinas*, gave the formula *veritas est adaequatio rei et intellectus*, "truth is the equation of thing and intellect" (crediting it to Isaac Israeli, in whose works there is no such definition). The Stanford Encyclopedia also lists Avicenna, whom *Falsafa: al-Kindī, al-Fārābī and Avicenna* presents, among the early correspondence formulations. The Arabic *ḥaqq* means "truth" but also "right" and "reality", and *al-Ḥaqq*, "the Truth", is a Qur'anic name of God Avicenna, whose *Metaphysics* gives an early correspondence formulation, also tied truth to being, ending in God as the First Truth. Like Aquinas, who also called things true (a "true friend"), he treated truth as a feature of being as well as of statements, a sense modern analytic philosophy has largely dropped.

## Correspondence: Truth and the Facts

{{image: Alfred Tarski | Alfred Tarski (1901–1983), who said his definition of truth captured the "classical Aristotelian conception".}}

The modern slogan is: a belief is true if and only if it corresponds to a fact. Russell's *The Problems of Philosophy* (1912) put it plainly: "Thus a belief is true when there is a corresponding fact, and is false when there is no corresponding fact." Before about 1910 Russell and Moore had held an *identity* theory, on which a true proposition simply *is* a fact; they turned to correspondence when they came to doubt that propositions exist.

A worked example from Glanzberg: the belief that the opera singer Samuel Ramey sings is true because the world contains a fact built from a particular (Ramey) and a property (singing), and no fact of Ramey dancing. Belief and fact share a structure, with the same constituents in the same places. The theory is "at its core an ontological thesis", a claim about what the world contains. Wittgenstein's *Tractatus* and Russell's logical atomism refined it: only the simplest (atomic) sentences correspond to facts, and complex ones like "p or q" are true or false according to their parts, so no fact need correspond to "or"; *Wittgenstein* sets out the "picture theory" step by step.

What, though, are facts? What fact makes it true that there is no hippopotamus in this room? Russell, in the Stanford Encyclopedia's words, found himself "driven to admit negative facts", noting wryly the "almost unquenchable desire" to avoid admitting that they "are as ultimate as those that are positive". Armstrong, the leading theorist of **truthmakers** (the things that make truths true), posited instead a "totality fact": that these are all the first-order facts there are. J. L. Austin's paper "Truth" (1950) offered a sparer version: the conventions of language link a statement to an actual situation and to a type of situation, and it is true if the first is of the second type. "It takes two to make a truth"; the correspondence is conventional, not mirroring.

Perhaps the most effective objection to correspondence, popular, David says, "ever since Berkeley's attack on the representational theory of the mind", runs like this:

1. If truth is correspondence, then to know a belief is true we must know it corresponds to reality.
2. To know that, we would have to compare the belief with reality as it is in itself, independently of our minds.
3. We cannot step outside our minds; all our access to the world passes through cognition.
4. So, on the correspondence theory, knowledge is impossible.
5. Scepticism is unacceptable, so truth must be something we can check: an epistemic notion such as coherence.

**The reply.** David finds two hidden assumptions. Premise 1 assumes that to know something you must know that it is true, confusing knowing with knowing that you know; the standard accounts discussed in *What Is Knowledge? From Plato to the Gettier Problem* demand no such thing. And the argument assumes that if truth *is* some property F, one can know a belief is true only by checking for F. By that standard nobody who did not know that water is H₂O could know that the Nile contains water. In fact you can taste it or ask a reliable informant. Likewise, the correspondence theory does not require anyone actually to compare a belief with a fact.

A sharper objection is the **slingshot**, named by Jon Barwise and John Perry (1981) after the small weapon that brings down a giant. Davidson argued in 1969 that, given two plausible substitution principles, every true sentence corresponds to one and the same Big Fact, so that if true statements correspond to anything at all, they all correspond to the same thing. Defenders reject a principle, for instance by denying that definite descriptions are genuine singular terms.

Davidson and Field also read Tarski's definition, which works through relations between words and things, as the core of a correspondence theory *without* facts, though Field (1972) thought it needed a real theory of reference. Putnam disagreed sharply: "As a philosophical account of truth, Tarski's theory fails as badly as it is possible for an account to fail."

## Coherence: Truth as a System

The **coherence theory** says a belief is true if and only if it belongs to a coherent system of beliefs, coherence being more than mere consistency. It is offered as an account of what truth *is*, not just a test for it, and it makes truth a relation between beliefs rather than between belief and world. The classic statement is the idealist H. H. Joachim's: "Truth in its essential nature is that systematic coherence which is the character of a significant whole." Only the complete truth is fully true; single judgements are true only to a degree. F. H. Bradley is usually grouped with him, though some scholars, notably Stewart Candlish, read him as an identity theorist, and the American Brand Blanshard (1892–1987) defended a close relative in *The Nature of Thought* (1939).

Some logical positivists, introduced in *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*, agreed. Otto Neurath and Hempel argued that we cannot "get outside" our beliefs to compare them with facts. Neurath's image: "We are like sailors who have to rebuild their ship on the open sea, without ever being able to dismantle it in dry-dock and reconstruct it from its best components."

Blanshard argued that coherence is our test of truth, and would be no test if truth were correspondence, so truth is coherence. Rescher replied that this assumes the test is infallible; a good but fallible test is all we should expect.

The classic objection goes back to Russell in 1907. Russell's own example was the bishop William Stubbs: a perfectly coherent story could be told in which Stubbs was hanged for murder. The Stanford Encyclopedia's modern version uses Jane Austen:

1. A coherence theory says p is true if and only if p coheres with a set of propositions.
2. "Jane Austen was hanged for murder" coheres with some set of propositions; "Jane Austen died in her bed" coheres with another.
3. The theory offers no ground for calling the first false and the second true.
4. Appeals to the most comprehensive or simplest system do not help, since two systems can be equally large or equally simple.
5. So coherence cannot be what truth is.

**The reply.** Coherentists, including James O. Young, answer that no coherentist ever meant coherence with *any* set, but with the set of propositions actually believed, and nobody believes the set containing Austen's hanging. **The counter.** Walker presses on: that a set is "actually believed" must itself be true, and if that truth is again coherence, a regress begins. Stopping it seems to need an objective fact about what people believe, which looks like correspondence by the back door. Young thinks the regress harmless, and argues that correspondence faces a parallel one.

```checkpoint
q: What does David's reply to the "no comparison" objection claim?
a*: That knowing a belief is true does not require checking it against reality directly, just as knowing the Nile contains water does not require knowing water is H₂O.
a: That we can, after all, step outside our minds and compare beliefs with reality.
x: David's point is that the correspondence theory does not require any such stepping outside.
a: That the correspondence theory is only a test of truth, not an account of its nature.
x: The correspondence theory is offered as an account of what truth is; the reply defends it in that form.
a: That scepticism is in fact correct.
x: The reply aims to avoid the sceptical conclusion, not to accept it.
hint: Think about how you actually find out that a river contains water.
why: The objection assumes that to know x is true you must verify the property truth consists in. We can know through tasting or testimony without any direct comparison, so the hidden assumptions behind steps 1 and 2 fail.
---
q: How does James O. Young answer the Jane Austen ("specification") objection to coherence?
a: By admitting that "Jane Austen was hanged for murder" is true relative to some systems.
x: Young's reply is designed to make that sentence simply false, not true relative to a system.
a: By choosing the largest or simplest coherent system.
x: The objection already shows that two systems may be equally large or simple; Young does not rely on size or simplicity.
a*: By saying truth is coherence with the set of propositions actually believed, which does not contain the hanging.
a: By adding a correspondence test for every belief.
x: That would abandon the coherence theory; Walker argues that the reply may covertly need correspondence, but Young denies it.
hint: Coherence with which set?
why: Coherentists, Young says, never meant coherence with an arbitrary set. Walker's counter is that "actually believed" then needs an objective fact, threatening a regress.
```

## Truth and Inquiry

The pragmatists tied truth to the practice of inquiry, and *American Pragmatism: Peirce, James and Dewey* tells their story: Peirce's truth as "the opinion which is fated to be ultimately agreed to by all who investigate", James's notorious line that "the true" is "only the expedient in the way of our thinking", Russell's reply that "true" does not mean "furthering our purposes", and Dewey's "warranted assertibility". They founded a family of **epistemic theories**, which explain truth through justification or verification, though Peirce did not reject correspondence outright; he called it merely a "nominal" definition.

Putnam's "internal realism" (1981) glossed truth as justification under ideal conditions. Dummett, an anti-realist, made truth depend on what could in principle be verified, and so denied **bivalence**, the principle that every statement is either true or false. Is there uranium in a region of the universe too distant ever to inspect? For Dummett, the claim need not be either. As Putnam observed, realists "typically say that they believe in a 'correspondence theory of truth'", so the quarrel about truth is also one about realism. Richard Rorty went furthest: truth has no nature, there is "nothing to be said" about it beyond describing a society's familiar procedures of justification, and calling a belief true pays it a compliment.

## Deflationism: Nothing to Explain?

What if Aristotle's dictum is the whole story? Frege noticed something odd:

```quote
It is … worthy of notice that the sentence 'I smell the scent of violets' has just the same content as the sentence 'It is true that I smell the scent of violets'. So it seems, then, that nothing is added to the thought by my ascribing to it the property of truth.
Frege · "Thoughts", as quoted in the Stanford Encyclopedia of Philosophy · 1918
```

Frank Ramsey drew the moral in 1927: "'It is true that Caesar was murdered' means no more than that Caesar was murdered." This is the **redundancy theory**. Quine called the truth predicate "a device of disquotation", since "by calling the sentence true, we call snow white." Paul Horwich, who coined the label **deflationism** in 1982, developed a distinct version, **minimalism** (1990): the theory of truth is nothing but the instances of "It is true that p if and only if p". The New Zealand logician Dorothy Grover, with Joseph Camp and Nuel Belnap, proposed the **prosentential** theory (1975): "that is true" works like a pronoun standing for a whole sentence, as "he" stands for a name.

If truth is so thin, why have the word? The deflationists' positive case is this:

1. Jones thinks Smith infallible. We can say: if Smith says birds are dinosaurs, then birds are dinosaurs; and the same for each claim.
2. To state Jones's belief in general we would need "for every p, if Smith says that p, then p", but English cannot generalise over whole sentences in that way.
3. The truth predicate lets us talk about the sentences instead: "Everything Smith says is true."
4. So "true" exists to express otherwise inexpressible, perhaps infinite, generalisations ("Everything the Pope says is true"), not to name a deep property.

**The objection.** Dummett and Wright argued that this leaves out the *point* of truth: it is the aim of assertion. Wright (1992) put it this way. Truth and warranted assertibility are both norms for assertion. Lacking warrant to assert p is not having warrant to assert not-p; but by the equivalence schema, "p is not true" does yield "not-p". So "not true" and "not warranted" behave differently, and truth is a separate norm. Deflationism, Wright concluded, is "inherently unstable": its own schema makes truth substantial.

**The reply.** Field and Horwich answer that the norm itself is just another generalisation. "Truth is a norm of assertion" means: for anything anyone asserts, if it is not true, the assertion is open to criticism. That is the predicate doing its generalising job, exactly as in step 3. Rumfitt added that once we recognise denial alongside assertion, "is not true" works as a device of rejection. Other difficulties remain: the Liar paradox forces deflationists to restrict the schema or revise logic, and Gupta and others argue that the bare instances cannot prove general truths about truth.

## One Truth or Many?

Crispin Wright's *Truth and Objectivity* (1992) and Michael P. Lynch's *Truth as One and Many* (2009) offer a middle way, **truth pluralism**. The motivation is the **scope problem**. Correspondence fits "ladders, ladles, and other ordinary objects" but strains over comedy, fashion, ethics or numbers; coherence suits legal or mathematical truths but not empirical ones. So perhaps truth consists in different properties in different domains: something like correspondence for talk about physical things, something like **superassertibility** (assertibility that would survive any amount of scrutiny) for morals, much as water includes several molecular kinds.

A leading objection concerns **mixed inferences**. "Satiated dogs are lazy. Our dog is satiated. So our dog is lazy." The argument is valid, which means it preserves truth. But if the premises are true in different ways, which truth does it preserve? Beall replied that validity preserves "designated" values, of which each kind of truth is one. Tappolet countered that being designated is then a single, universal truth property, a worry related to what Nikolaj Pedersen calls the "instability challenge".

There is also an **identity theory**, defended by McDowell and Hornsby: a true proposition does not correspond to a fact; it *is* one. For McDowell this is a truism: when you think truly, what you think is what is the case.

## True for Me?

"Man is the measure of all things," said Protagoras, and *Socrates and the Sophists* reconstructs Plato's "table-turning" (*peritropē*) argument against him, along with the reply that restores "true *for* me". **Alethic relativism** says "is true" is really a two-place predicate: p is true *for* a culture, framework or person. On this view "misfortune is caused by witchcraft" can be true in the Azande framework and false in the Western scientific one. Siegel poses a dilemma:

1. The relativist says "p is true for S".
2. If this just means "S believes p", relativism is a trivial claim about beliefs, not about truth.
3. If it means "p is true", full stop, it is absolutism, not relativism.
4. A notion stronger than belief but weaker than truth has proved, Siegel says, "quite difficult" to construct, "arguably beyond the conceptual resources available to the relativist".

**The reply.** Relativists try to supply the middle notion. Hales proposed a logic with "perspective" operators in which "everything that is true is relatively true" is consistent, though critics dispute it.

A subtler, **local** relativism comes from John MacFarlane's *Assessment Sensitivity* (2014). Ann says "Pretzels are tasty"; Ben says "Pretzels are not tasty". A contextualist says Ann means "tasty to me", so they do not really disagree. The new relativist says they do: one proposition is asserted and denied. But its truth depends on a "context of assessment": true assessed by Ann's standards, false by Ben's. This is what Kölbel called "faultless disagreement" (a label MacFarlane accepts only with qualification), confined to domains like taste. Bradley Dowden and Norman Swartz, by contrast, takes a deflating line: "That is true for me but not for you" sensibly means only "I believe it, but you do not."

```checkpoint
q: What is the deflationists' main positive case for having a truth predicate at all?
a: It names the deepest property a belief can have.
x: Deflationists deny that truth is a deep or substantial property.
a*: It lets us state generalisations, such as "Everything Smith says is true", that we could not otherwise express.
a: It records which sentences a community currently accepts.
x: That is closer to Rorty's talk of truth as a compliment to justified belief; the deflationists' point is logical, not sociological.
a: It marks which beliefs are useful in the long run.
x: That is closer to James's pragmatism, which deflationists do not accept.
hint: Try stating Jones's trust in Smith without the word "true".
why: English cannot quantify into sentence position; talking about sentences and calling them true lets us express infinitely many claims at once.
---
q: What is Siegel's dilemma for the relativist who says "p is true for S"?
a: That Protagoras' own doctrine is false for most people, so he must think it false.
x: That is the ancient peritropē, which *Socrates and the Sophists* reconstructs; Siegel's dilemma is different.
a: That relativism implies faultless disagreement.
x: Faultless disagreement is what the new relativists claim to explain, not Siegel's objection.
a: That every statement is true from some perspective, as the Jains held.
x: The Jains' perspectivism is a different doctrine, and Siegel's argument says nothing about it.
a*: Either "true for S" means only "S believes p", which is trivial, or it means plain truth, which is absolutism.
hint: What could "true for" mean that is neither belief nor truth?
why: The relativist needs a notion between belief and absolute truth, and Siegel argues it is hard to construct one.
```

## Truth across Traditions

**Nyāya.** The Nyāya school, presented in *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā*, gave an account of truth close to correspondence, though Matthew Dasti calls it "not exactly representational, but relational": in true cognition, the part that targets a thing and the part that targets its property "match up". Gaṅgeśa defined veridical cognition as "a cognitive state with predication content x about something in fact qualified by x". Vātsyāyana offered a pragmatic *test*, not a definition: cognitions that guide us to successful action are likely true. Potter argued that Indian thinkers more often understood truth as "workability"; Gaṅgeśa's definition points the other way. Kumārila's argument for the intrinsic validity (*svataḥ prāmāṇya*) of cognitions is set out in that chapter.

**The two truths.** *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic* quotes Nāgārjuna's teaching that the Dharma rests on "a truth of mundane conventions and a truth of the ultimate", and leaves this chapter to ask what that means for theories of truth. Sonam Thakchoe argues that it differs from every other Indian theory: the Hindu schools are foundationalists about an ultimate, substantive reality, while for Madhyamaka everything, including ultimate truth and emptiness itself, is empty. Interpreters divide. Richard Hayes suggests the two truths can also be read as two goals: the highest goal (*paramārtha*), nirvana, and the lower goal of worldly good. On Jan Westerhoff's reading, "there can be no such thing as ultimate truth, a theory describing how things really are, independent of our interests and conceptual resources employed in describing it". All that remains is conventional truth, agreement with commonly accepted practices, and even emptiness is not an ultimately true theory. Westerhoff compares this with anti-realism and warranted assertibility, Dummett's and Dewey's territory. Against the objection that science seems to progress towards how things are, he suggests that treating truths *as if* non-conventional may be a useful convenient fiction.

**The Jains.** *Jains, Ājīvikas and Materialists: India's Other Dissenters* explains the Jain doctrine of many-sidedness and its sevenfold predication, each claim prefixed by *syāt*, "from a perspective". Is this relativism? Mark Owen Webb warns: "What begins as a laudable fallibilism ends as an untenable relativism." Marie-Hélène Gorisse disagrees: the Jains were realists, for whom perspectives multiply because the known object itself has many aspects. That contrasts sharply with Protagoras: many partial statements about one many-sided world, not many worlds.

**China.** Chad Hansen argued that the Mohists, and early Chinese thinkers generally, asked not whether a claim is true but "whether a certain way of using words is appropriate", sorting *shì* ("this", right) from *fēi* ("not", wrong); *Logic across Traditions* records the debate with A. C. Graham and Christoph Harbsmeier. Chris Fraser's position needs stating precisely. As *What Is Knowledge? From Plato to the Gettier Problem* notes, he holds that the later Mohists' concern was not the justification or truth of beliefs. Yet, construed as the claim that they lacked any concept corresponding to semantic truth, he finds Hansen's thesis "unconvincing": words such as *shì*, *dāng* ("fitting") and especially *rán* ("so") overlap enough with truth, and the Mohists knew that a claim meeting their standards might still fall short of the facts (*qíng*). Their treatment of ghosts shows both sides. Judging claims by precedent, by what people see and hear, and by benefit in government, Mozi argued that even if there are no ghosts, we should behave as if there are, for the social benefit. As Fraser puts it, they "run together" the question whether ghosts exist and whether to promote the teaching that they do.

## Post-Truth and Bullshit

In 2016 Oxford Dictionaries named *post-truth* its word of the year, after a roughly twentyfold rise in its use over 2015, amid the Brexit referendum and the American presidential election; Germany chose *postfaktisch*. But, as Wikipedia's article on the term notes, post-truth is "only remotely related" to theories of truth. Its question is why people do not agree on facts, not what truth is.

The philosophical bridge is Harry Frankfurt's "On Bullshit", first published in the *Raritan Quarterly Review* in 1986 and as a book by Princeton University Press in 2005. The liar, Frankfurt argues, cares about the truth, if only to hide it. The bullshitter does not care whether what he says is true or false at all, and so is the greater threat. Frankfurt's point leans on Wright's first platitude: to assert is to present as true. Whatever truth turns out to be, the bullshitter has abandoned the practice whose aim it is.

## Further exploration

- **Michael P. Lynch, *Truth as One and Many* (2009).** The leading functionalist version of truth pluralism, with a readable statement of the scope problem.
- **Simon Blackburn, *On Truth* (2018).** A short survey of the main theories by a leading philosopher.
- **Jc Beall and Ben Middleton, *Truth: The Basics* (Routledge).** An up-to-date introduction for beginners.
- **Wolfgang Künne, *Conceptions of Truth* (2003).** A comprehensive historical and analytical study of the theories.
- **The Cowherds, *Moonshadows: Conventional Truth in Buddhist Philosophy* (2011).** A collaborative volume on what the Buddhist two truths mean.
- **Paul Boghossian, *Fear of Knowledge* (2006).** A short, sharp critique of relativism.
- **Harry G. Frankfurt, *On Bullshit* (2005).** The brief, best-selling essay on the speaker who no longer cares about truth.$truth_master$,
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
  select $truth_quiz$[
    {"type": "mcq", "prompt": "Why does Marian David call Aristotle's dictum ('to say of what is that it is ... is true') a 'muted, relatively minimal' version of the correspondence theory?", "options": ["Because it mentions no relation of correspondence and no facts, so it has also been claimed as a precursor of deflationism", "Because Aristotle rejected the idea that sentences can be false", "Because Aristotle defined truth as coherence with a system of beliefs", "Because the dictum appears only in Aquinas, not in Aristotle"], "answerIndex": 0, "explanation": "The dictum, from Metaphysics Γ 7, 1011b25, does not highlight the basic correspondence intuition; Tarski read it as the classical conception, while others have seen in it the germ of deflationism.", "id": "q1"},
    {"type": "mcq", "prompt": "What is the 'slingshot' argument, and who gave it that name?", "options": ["Russell's argument that negative facts must exist, named by Armstrong", "Wright's argument that deflationism is unstable, named by Field", "An argument that all true sentences correspond to one and the same 'Big Fact', used by Davidson and named by Barwise and Perry (1981)", "Plato's answer to the Sophists' puzzle about falsehood, named by Aristotle"], "answerIndex": 2, "explanation": "Davidson (1969) argued that, if true statements correspond to anything, they all correspond to the same thing. Jon Barwise and John Perry named it after the small weapon that brings down a giant.", "id": "q2"},
    {"type": "mcq", "prompt": "Which statement correctly reports the 'mixed inferences' objection to truth pluralism?", "options": ["Pluralists cannot explain why different domains need different truth properties", "If premises are true in different ways, it is unclear which truth property a valid argument such as 'Satiated dogs are lazy; our dog is satiated; so our dog is lazy' preserves", "Pluralism implies that all sentences are true relative to a context of assessment", "Pluralism cannot accept the Tarski biconditionals"], "answerIndex": 1, "explanation": "Tappolet and Pedersen pressed this objection. Beall replied that validity preserves designated values; Tappolet countered that 'being designated' then looks like one universal truth property.", "id": "q3"},
    {"type": "mcq", "prompt": "How does Jan Westerhoff read Nāgārjuna's two truths?", "options": ["The ultimate truth is a substantive reality underlying all conventions, as in the Hindu schools", "The two truths are identical with the Jain sevenfold predication", "Ultimate truth is the true theory of emptiness, which science will eventually confirm", "There can be no ultimate truth describing how things really are independent of our interests and concepts; only conventional truth remains"], "answerIndex": 3, "explanation": "On Westerhoff's reading even emptiness is not an ultimately true theory, which invites comparison with anti-realism; Hayes instead suggests reading the two truths as two goals, the highest being nirvana.", "id": "q4"},
    {"type": "open", "prompt": "Set out the 'specification' objection to the coherence theory of truth as a numbered argument, using the Jane Austen example (or Russell's original about Bishop Stubbs), and assess Young's reply and Walker's counter.", "rubric": "A strong answer states that the coherence theory makes p true if and only if p coheres with a set of propositions; that 'Jane Austen was hanged for murder' coheres with some set and 'Jane Austen died in her bed' with another; that the theory gives no ground to call one true and the other false; and that appeals to the largest or simplest system fail because systems can tie; so coherence cannot be what truth is. It notes Russell's original 1907 example of Bishop Stubbs. It explains Young's reply: truth is coherence with the set of propositions actually believed, which does not include the hanging. It explains Walker's counter: the claim that a set is believed must itself be true, so either a regress begins or an objective fact about belief is needed, which looks like correspondence; and Young's response that the regress is benign and correspondence faces a parallel one. Better answers relate this to Joachim, Blanshard or Neurath's boat.", "id": "q5"},
    {"type": "open", "prompt": "Explain the deflationist case that the truth predicate exists to express generalisations, and evaluate Wright's normativity objection together with the deflationist reply.", "rubric": "A strong answer reconstructs the generalisation argument: we can say of each claim that if Smith says it, it is so, but we cannot state the general belief without quantifying into sentence position; 'Everything Smith says is true' does this, so truth is a device for otherwise inexpressible generalisations (Field, Horwich; examples such as 'Everything the Pope says is true'). It locates the view in its history: Frege's violets, Ramsey's redundancy theory, Quine's disquotation, Horwich's minimalism (distinct from redundancy) and Grover's prosentential theory. It explains Wright's objection: truth and warranted assertibility are both norms of assertion, but lacking warrant for p is not warrant for not-p, whereas 'p is not true' yields 'not-p', so truth is a distinct, substantial norm and deflationism is unstable. It gives the reply of Field and Horwich that 'truth is a norm of assertion' is itself just a generalisation the predicate lets us state, and may mention Rumfitt on denial, the Liar and the generalisation problem.", "id": "q6"}
  ]$truth_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/epistemology/truth', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
