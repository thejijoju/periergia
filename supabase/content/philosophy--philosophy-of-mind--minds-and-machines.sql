-- Minds and Machines: Could AI Think? — canonical master article, co-written and human-reviewed.
-- philosophy/philosophy-of-mind/minds-and-machines @ research/advanced/read.
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
    'philosophy/philosophy-of-mind/minds-and-machines',
    'research',
    'advanced',
    'read',
    $machines_master$> **Could a machine think, understand what it says, or feel anything at all?** This chapter separates those questions and works through the main arguments, from Descartes's two tests, Lovelace's objection and Turing's imitation game to Blockhead, Searle's Chinese Room, symbol grounding, the argument from Gödel's theorem and Dreyfus's critique. It visits older stories of made people in China, the Islamic world, India and Jewish tradition, and the Indian debate over whether matter can bear cognition, and ends with what large language models do and do not settle, as of late 2026.

## Three Questions in One

"Could AI think?" bundles at least three questions. One is about **intelligence**: could a machine behave as flexibly and appropriately as a thinking person? One is about **understanding**: when a machine produces a correct sentence, does it grasp what the words mean, or shuffle marks whose meaning exists only for us? One is about **consciousness**: is there anything it is like to be the machine? A yes to the first need not bring a yes to the others.

A **computation** here means manipulating symbols by rules that refer only to their form. John Searle distinguished **strong AI**, the claim that "the appropriately programmed computer really is a mind in the sense that computers given the right programs can be literally said to understand and have other cognitive states", from **weak AI**, the modest claim that computers are useful tools for studying the mind. This chapter is mostly about strong AI. Why experience is so hard to fit into a physical account is the subject of *Consciousness*; whether thinking machines would deserve moral consideration, or pose dangers, belongs to *Ethics of Technology and AI*.

## Made People: an Old Question

Stories of artificial persons are old, and they already ask how one would tell. The *Liezi*, a Daoist book attributed to Lie Yukou but probably compiled around 300 CE from older materials (opinion remains divided; see *Mozi, the Daoists and the Legalists: the Hundred Schools*), tells how the artificer Yan Shi showed King Mu of Zhou a life-size figure that walked, sang in tune and danced. When it winked and "made advances to the ladies in attendance", the king would have executed Yan Shi, who took it apart to show it was "only a construction of leather, wood, glue and lacquer" (Joseph Needham's translation). Removing the heart stopped it speaking, the liver its seeing, the kidneys its walking: in effect, a test of function.

Engineers described machines too. Al-Jazarī's *Book of Knowledge of Ingenious Mechanical Devices* (1206), written at the Artuqid court in Upper Mesopotamia, includes a jointed copper figure that pours water for the king's ritual washing and offers towel, comb and mirror. The eleventh-century Sanskrit *Samarāṅgaṇa Sūtradhāra* ascribed to Bhoja describes dolls that danced and refilled oil lamps, though descriptions are not evidence that such machines were built.

In the Talmud (Sanhedrin 65b) the sage Rava creates a man, a golem, and sends him to Rav Zeira, who speaks to him; when "he does not answer", Zeira says, "You were created by the sages; return to your dust." The golem's early disability was that it could not speak. (The famous golem of Rabbi Judah Loew of Prague is generally held by historians to be a German literary invention of the early nineteenth century.) Speech as the mark of a real person is exactly where Descartes would put his first test.

## Descartes's Two Tests

*Descartes* describes his view that animals are machines. In Part V of the *Discourse on the Method* (1637) he asked what would happen if machines were built to look and act like us, and answered that "we should always have two very certain tests by which to recognise that, for all that, they were not real men" (Haldane and Ross's translation). Step by step:

1. A machine could be made to look like us and imitate our actions, even to utter words when touched in a particular place.
2. **The language test**: no machine could arrange its speech "in various ways, in order to reply appropriately to everything that may be said in its presence".
3. **The action test**: a machine acts "only for the disposition of their organs", which "have need of some special adaptation for every particular action", whereas "reason is a universal instrument which can serve for all contingencies"; so no machine could act "in all the events of life" as reason makes us act.
4. So whatever fails these tests acts by mechanism, not "from knowledge".

```quote
But it never happens that it arranges its speech in various ways, in order to reply appropriately to everything that may be said in its presence, as even the lowest type of man can do.
René Descartes · Discourse on the Method, Part V (trans. Haldane and Ross) · 1637
```

Descartes applied the tests to animals, which he thought fail both; parrots, he argued, imitate speech without having language.

**Objection.** The tests are bets about what mechanisms can do: "morally impossible" means practically, not logically, impossible. Today's language models reply appropriately on a vast range of topics, so the first test is at least contested. **Reply** (a reconstruction on Descartes's behalf): the second test, flexible action "in all the events of life", remains a hard standard, and passing the first would still leave open whether fluent speech comes "from knowledge".

## Reckoning, Mills and Note G

Hobbes wrote in *Leviathan* (1651) that "REASON, in this sense, is nothing but Reckoning (that is, Adding and Subtracting) of the Consequences of generall names agreed upon, for the marking and signifying of our thoughts", and in 1666 Leibniz agreed that "everything done by our mind is a computation". The Stanford Encyclopedia of Philosophy (SEP) judges it "at least rather over-dramatic" to call Hobbes a prophet of artificial intelligence (see *Hobbes*). Leibniz, who designed a calculating machine, also gave the most famous argument against thinking machines: enlarge one to the size of a mill, walk inside, and you find "only parts pushing one another, and never anything by which to explain a perception". *Leibniz* sets it out step by step; David Cole's SEP entry lists it first among the antecedents of the Chinese Room. The physician Julien Offray de La Mettrie went the other way: his *L'Homme machine* (1747, with title pages often dated 1748) extended Descartes's animal-machine to human beings.

Ada Lovelace (1815–1852) translated Menabrea's French account of a lecture Charles Babbage gave in Turin in 1840, adding notes about three times longer than the translation, published in 1843. Note G says: "The Analytical Engine has no pretensions whatever to *originate* anything. It can do whatever *we know how to order it* to perform. It can follow analysis; but it has no power of anticipating any analytical relations or truths." Turing, who knew the passage second-hand from a citation by Hartree, quoted it without the word "whatever" and named it "Lady Lovelace's Objection". The Internet Encyclopedia of Philosophy (IEP) calls it "arguably the first and … certainly among the most frequently repeated objections to AI".

{{image: Ada Lovelace | Ada Lovelace (1815–1852). Her Note G of 1843 contains what Turing would call "Lady Lovelace's Objection".}}

## Turing's Imitation Game

Alan Turing (1912–1954), whose analysis of computation appears in *Formal Logic: Propositions, Predicates and Proofs*, opened "Computing Machinery and Intelligence" (1950) with "I propose to consider the question, 'Can machines think?'" Finding it "too meaningless to deserve discussion" as it stood, he replaced it with a game:

1. A man (A), a woman (B) and an interrogator (C) in another room communicate by teletype, so voices give nothing away. C must say which is the man; A tries to mislead C, B to help.
2. Let a machine take A's part. "Will the interrogator decide wrongly as often when the game is played like this as he does when the game is played between a man and a woman? These questions replace our original, 'Can machines think?'"
3. In the now standard version, an interrogator questions a human and a machine and must say which is which.
4. If a machine does as well as a human, we have as good reason to credit it with thinking as we have for other people.

(Whether the machine must imitate a woman or simply a human is still argued; the SEP finds the second reading convincing.) Turing also made a forecast:

```quote
I believe that in about fifty years' time it will be possible to programme computers, with a storage capacity of about 10⁹, to make them play the imitation game so well that an average interrogator will not have more than 70 per cent chance of making the right identification after five minutes of questioning.
Alan Turing · Computing Machinery and Intelligence · 1950
```

Most commentators hold this was wrong for 2000, though Copeland notes that "about fifty years" is not exactly fifty.

Turing answered nine objections. To the **theological objection** he replied that building such machines would no more usurp God's power of creating souls than having children does. The **argument from consciousness** came from Geoffrey Jefferson's Lister Oration of 1949: "Not until a machine can write a sonnet or compose a concerto because of thoughts and emotions felt, and not by the chance fall of symbols, could we agree that machine equals brain". Turing's answer, now called the "other minds reply", was that taken strictly this leads to solipsism: you could be sure a machine thinks only by being it, and the same holds for other people. To **Lady Lovelace's objection** he answered that machines often take him by surprise. The **mathematical objection** returns below. (He also thought the evidence for telepathy "overwhelming"; great minds misjudge evidence.)

## Is Passing Enough? Blockhead and ELIZA

Ned Block (1981) imagined a creature that looks human but is controlled by a "game-of-life look-up tree", holding a programmed response for every input it could receive at each stage of its life. Call it Blockhead.

1. If passing the test were logically sufficient for intelligence, anything that passes would be intelligent.
2. Blockhead is logically possible, and it passes.
3. Blockhead is not intelligent; it has "all of the intelligence of a toaster".
4. So passing the test is not logically sufficient for intelligence.

**Objection.** Step 2 is doubtful: whether conceivability shows possibility is debated (see *Possibility and Necessity*), and the tree would be so astronomically large that many deny Blockhead is *physically* possible. **Reply.** Physical impossibility leaves the conclusion untouched, since it concerns logical sufficiency. What survives is the weaker claim defenders now make: passing is not what intelligence *is*, but it may be a good criterion, or strong probabilistic evidence, for it.

The opposite danger is that the test is too easy. Joseph Weizenbaum's ELIZA (1964–67) matched keywords to canned transformations; its DOCTOR script imitated a non-directive therapist. Told "He says I'm depressed much of the time", it replied, "I am sorry to hear you are depressed." Weizenbaum "had not realized … that extremely short exposures to a relatively simple computer program could induce powerful delusional thinking in quite normal people". This **ELIZA effect**, projecting understanding or empathy onto simple programs, is why a serious test needs interrogators who *know* one party is a machine, over many trials.

```checkpoint
q: What does Block's Blockhead argument claim to show?
a*: That passing the Turing test is not logically sufficient for intelligence.
a: That no machine could ever pass the Turing test.
x: Blockhead is imagined passing the test; the argument grants that.
a: That behaviour is no evidence of intelligence at all.
x: Many accept that the test can still be good, fallible evidence; the argument targets logical sufficiency.
a: That a look-up table would be intelligent if it were large enough.
x: Block's verdict is the opposite: it has "all of the intelligence of a toaster".
hint: Ask what the thought experiment pairs together: perfect test performance and what else?
why: A look-up tree with a stored reply for every input could pass while plainly not thinking, so passing cannot be what intelligence logically consists in. Critics reply that such a tree is physically impossible, so the test may still be a good criterion.
---
q: How did Turing answer Jefferson's argument from consciousness?
a: He agreed that machines could never feel and withdrew his claim.
x: Turing defended his claim; he did not concede it.
a: He argued that consciousness is an illusion in humans too.
x: He granted that there is a mystery about consciousness; his point concerned the evidence we use for any mind.
a*: That taken strictly it leads to solipsism, since we know other people think only from how they behave.
a: He argued that a machine that writes sonnets must feel emotions.
x: He did not claim sonnet-writing proves feeling.
hint: How do you know that anyone besides yourself has thoughts?
why: If only being the machine could settle whether it thinks, the same would hold for other people. Turing would be content with as much reason to credit machines with thought as we have for other humans: the "other minds reply".
```

## Searle's Chinese Room

The most discussed objection to strong AI is the Chinese Room of John Searle (1932–2025), from "Minds, Brains and Programs" (1980); *Analytic Philosophy since 1950* sketches it in two sentences. Searle died on 17 September 2025. In his 1999 summary, a native English speaker who knows no Chinese is locked in a room with boxes of Chinese symbols and a rule book. Questions in Chinese are passed in; by following the rules he passes out correct answers. "The program enables the person in the room to pass the Turing Test for understanding Chinese but he does not understand a word of Chinese." He identifies the symbols "entirely by their shapes".

Searle did not deny that machines can think (brains are machines); his target was the claim that running the right program is *enough*. The SEP reconstructs the argument:

1. If strong AI is true, there is a program for Chinese such that any system running it thereby understands Chinese.
2. I could run that program without understanding Chinese.
3. So strong AI is false.

The replies attack premise 2. The **Systems Reply**, the most common, says the man is only a part; the whole system of man, rules and paper understands. Searle answered that the man could memorise the rules and do everything in his head and still not know what the Chinese word for hamburger means. Cole and Block reply that memorising does not make him the system: a "virtual mind" could understand while he does not. The **Robot Reply** gives the computer cameras and arms to connect symbols to things, as a child learns what a hamburger is. Searle: camera signals arrive in the room as more symbols, and the reply concedes that thought is not mere symbol manipulation. The **Brain Simulator Reply** of Paul and Patricia Churchland simulates every neuron of a Chinese speaker; Searle substituted a man working a vast system of water pipes arranged like neurons, and said simulation is not duplication.

The Churchlands' **Luminous Room** (1990) targets the intuition itself. Wave a magnet in a dark room and you see no light, yet light *is* electromagnetic waves; intuitions about unfamiliar systems mislead, and "no neuron in my brain understands English, although my whole brain does". Dennett called it "clearly a fallacious and misleading argument"; the SEP's verdict is that "there is no consensus".

## Syntax, Semantics and Grounding

Searle restated the point as a derivation from axioms (1984; in this form, 1990). **Syntax** is the formal shape and arrangement of symbols; **semantics** is their meaning.

1. Programs are formal (syntactic).
2. Minds have mental contents (semantics).
3. Syntax by itself is neither constitutive of nor sufficient for semantics.
4. So programs are neither constitutive of nor sufficient for minds.

The Chinese Room is meant to support premise 3. **Objection** (Cole, Dennett, Margaret Boden, Chalmers): a running computer is not syntax alone but a physical causal system in the world. Chalmers's parody: recipes are syntactic, syntax is not sufficient for crumbliness, cakes are crumbly, so following a recipe is not sufficient for making a cake. **Reply.** Searle answered that syntax is "observer-relative": "you can assign a computational interpretation to anything", even the molecules in the paint on a wall, so computation is not an intrinsic physical feature and cannot be what makes a mind. His own view, **biological naturalism**, holds that conscious states are caused by neurobiological processes and are higher-level features of the brain.

Stevan Harnad (1990) generalised the worry into the **symbol grounding problem**: how can a symbol system's meaning be "intrinsic to the system, rather than just parasitic on the meanings in our heads"? Imagine learning a language from a dictionary written only in that language: each definition sends you to other words you do not know. How do you "ever get off the symbol/symbol merry-go-round"? Harnad leaned towards the Robot Reply, grounding symbols in sensorimotor capacities tested by a "Total Turing Test".

## Mechanism and Its Limits: Gödel and Dreyfus

**Functionalism**, explained in *The Mind–Body Problem*, defines mental states by their roles rather than their material, so silicon could in principle realise them. Putnam's "Psychological Predicates" (1967) modelled minds on Turing-machine-like automata, and the classical computational theory of mind holds that "the mind literally is a computing system". Today's large language models instead descend from **connectionism**, networks of simple units that learn by adjusting their connections. Two arguments say mechanism must fail.

J. R. Lucas argued in "Minds, Machines and Gödel" (1961) that Gödel's incompleteness theorem "proves that Mechanism is false, that is, that minds cannot be explained as machines"; Roger Penrose revived the argument in *The Emperor's New Mind* (1989). In outline:

1. Any consistent machine capable of simple arithmetic has a Gödel sentence, which it cannot prove in its own system but which is true if the system is consistent.
2. A human mathematician can see that this sentence is true.
3. So the human mind is not any such machine.

**Objection** (Putnam, Boolos, Shapiro): the result is conditional. The sentence is true *if the system is consistent*, so the argument needs humans always to be able to tell whether a formal system is consistent, which Davis called "highly implausible". The SEP reports "wide consensus that they fail"; *Formal Logic: Propositions, Predicates and Proofs* explains why the theorem concerns what is unprovable *in a given system*. **Reply.** Lucas and Penrose replied at length, Penrose insisting that "mathematical understanding … cannot be reduced to blind calculation!" Gödel himself concluded only a disjunction: either the human mind surpasses any finite machine, or there are absolutely unsolvable problems of a certain kind.

Hubert Dreyfus (1929–2017), drawing on Heidegger and Merleau-Ponty (see *Phenomenology: Husserl, Heidegger and Merleau-Ponty*), argued in *What Computers Can't Do* (1972) that AI assumed that all knowledge can be formalised and that the world consists of independent facts representable by independent symbols, each assumption being "in fact, one hypothesis among others". Expertise rests on skilled know-how and an unspoken background: experts "size up the situation" rather than consult rules. His critique met "ridicule and outright hostility" in the 1960s; by 1993 Crevier judged that time had proven some of it accurate. Computationalists reply that computational models can include senses and action.

```checkpoint
q: What is the standard objection to the Lucas–Penrose argument?
a: That Gödel's theorem applies only to geometry.
x: The theorems concern formal systems capable of simple arithmetic.
a*: That the Gödel sentence is true only if the system is consistent, and humans cannot always tell whether a system is consistent.
a: That humans can prove every true arithmetical statement.
x: No one claims this; the objection concerns what humans can know about consistency.
a: That computers can prove their own Gödel sentences.
x: That would contradict the theorem; the objection grants the theorem and questions the human side.
hint: Gödel's theorem has an "if" in it.
why: To "see" that a machine's Gödel sentence is true, one must know its system is consistent. Putnam, Boolos and Shapiro argued that humans have no general power to know this, and the SEP reports wide consensus that the argument fails.
---
q: In Searle's derivation, which premise is the Chinese Room meant to support?
a: Programs are formal (syntactic).
x: That premise is true by the definition of a program; it needs no thought experiment.
a: Minds have mental contents.
x: Few deny this; it is not what the room is for.
a: Brains cause minds.
x: That is a separate axiom, added for a further conclusion about causal powers.
a*: Syntax by itself is neither constitutive of nor sufficient for semantics.
hint: The man handles symbols "entirely by their shapes".
why: The man has all the syntax a program could supply yet understands nothing, which is meant to show that syntax does not add up to meaning. Critics such as Chalmers answer that a running program is a causal system, not syntax alone.
```

## Can Matter Bear Cognition?

Whether silicon could think has an older cousin: whether any matter could. The Nyāya argument, from the *Nyāya-sūtra* (1.1.10) and its commentaries as the IEP sets it out:

1. Desire, cognition, pleasure, pain and volition are qualities.
2. All qualities inhere in substances.
3. So there is a substance to which they belong.
4. None of the material elements, such as earth and water, bears desire and the rest.
5. So there is a special non-material substance: a self (*ātman*).

**Objection.** The Cārvāka or Lokāyata materialists replied that "our observation does not bring forth any instance of a disincarnate consciousness"; the body is "an inalienable factor", and food and drink affect the intellect. **Reply.** Nyāya's further arguments aim to show that the body, a product of material elements, cannot be the fundamental locus of conscious states. (Buddhists rejected both sides' terms; see *Self and No-Self: Personal Identity East and West*, and for the schools *The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* and *Jains, Ājīvikas and Materialists: India's Other Dissenters*.) The hinge is premise 4. Whoever accepts it for flesh can hardly deny it for silicon; whoever rejects it, as the Cārvākas did, holds what any friend of machine minds needs: that organised matter can bear cognition.

## Large Language Models: What They Settle (as of 2026)

**Large language models** (LLMs), built since 2017 on the "transformer" architecture, are neural networks trained on vast amounts of text, typically to predict the next word, then fine-tuned, for example with human feedback, to follow instructions.

Turing's game has now been run on them. Jones and Bergen (first posted in March 2025; published in *PNAS* on 26 May 2026) reported pre-registered three-party tests with five-minute conversations. GPT-4.5, prompted to adopt a humanlike persona, was judged to be the human 73 per cent of the time, more often than the real humans; LLaMa-3.1-405B 56 per cent; ELIZA 23 and GPT-4o 21 per cent. On Turing's own terms, his first forecast arguably came true about a quarter of a century late. Critics such as Gary Marcus say such results show "how easy it is to fool humans".

Does passing show understanding? Emily M. Bender, Timnit Gebru, Angelina McMillan-Major and Margaret Mitchell (credited under a pseudonym), in "On the Dangers of Stochastic Parrots" (2021), described language models as "stitching together sequences of linguistic forms … observed in its vast training data, according to probabilistic information about how they combine, but without any reference to meaning". Bender and Koller's **octopus test** (2020) makes it vivid: two English speakers on separate islands talk by undersea cable; a "hyperintelligent deep-sea octopus" taps the cable, learns the patterns and impersonates one of them, until the other, attacked by a bear, asks how to fend it off with sticks. The octopus knows nothing of bears or sticks. As a reconstruction:

1. LLMs are trained only on text, that is, on linguistic form.
2. Meaning relates form to something outside language: speakers' intentions and the world.
3. Nothing in form alone fixes that relation.
4. So a system trained only on form cannot learn meaning.

**Objection.** Fine-tuning with human feedback goes beyond pure form; models increasingly take images and act through tools, reviving the Robot Reply; and interpretability research reports internal "world models". A small transformer trained on moves in the board game Othello developed an internal representation of the board which, when edited, changed its predictions correctly. **Reply.** Internal structure and benchmark success show sophisticated processing of form, not that the symbols are grounded or understood: Searle's and Harnad's point again.

Consciousness is a further question. In 2022 a Google engineer, Blake Lemoine, claimed the LaMDA system was sentient; Google called this "wholly unfounded" and dismissed him. It was arguably the ELIZA effect writ large. More carefully, David Chalmers (lecture 2022; published 2023) found "significant obstacles to consciousness in current models: for example, their lack of recurrent processing, a global workspace, and unified agency", put his credence in current LLM sentience tentatively at "<10%?", and thought it "quite possible" the obstacles would be overcome "in the next decade or so". A 2023 report by Patrick Butlin, Robert Long and seventeen co-authors derived "indicator properties" from scientific theories of consciousness and concluded that "no current AI systems are conscious, but … there are no obvious technical barriers to building AI systems which satisfy these indicators". It assumes, roughly, that the right computations would suffice, and its theories remain disputed.

Every figure here is dated. The old arguments have been sharpened, not retired. Cole's SEP entry (2024) observes that if machines one day use language as well as humans in every context and are still said not to understand, "'Really' understanding becomes epiphenomenal: undetectable, causally inert, and irrelevant." Either that is a reductio of Searle's position, or it shows that understanding was never a matter of behaviour. Descartes's tests, Lovelace's note and Turing's game still set the terms of that argument.

## Further exploration

- **Stuart M. Shieber (ed.), *The Turing Test: Verbal Behavior as the Hallmark of Intelligence* (2004).** Turing's paper together with the main responses to it.
- **John Preston and Mark Bishop (eds), *Views into the Chinese Room: New Essays on Searle and Artificial Intelligence* (2002).** Essays for and against Searle's argument.
- **John Haugeland, *Artificial Intelligence: The Very Idea* (1985).** A classic philosophical introduction to classical, rule-based AI.
- **Margaret A. Boden, *Mind as Machine: A History of Cognitive Science* (2006).** A two-volume history of computational ideas about the mind, by a leading philosopher of AI.
- **Cameron J. Buckner, *From Deep Learning to Rational Machines* (2024).** What the history of philosophy, especially empiricism, can teach about deep learning.
- **Stephen Cave and Kanta Dihal (eds), *Imagining AI: How the World Sees Intelligent Machines* (2023).** How cultures from Japan and China to Singapore and beyond have imagined intelligent machines.
- **Shannon Vallor, *The AI Mirror: How to Reclaim Our Humanity in an Age of Machine Thinking* (2024).** A virtue-ethics critique of current AI.$machines_master$,
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
  select $machines_quiz$[
    {"type": "mcq", "prompt": "What were Descartes's two tests, in the Discourse on the Method (1637), for telling a machine that looked like us from a real person?", "options": ["Whether it could feel pain and whether it could remember", "Whether it could arrange speech to reply appropriately to anything said, and whether it could act flexibly in all the events of life as reason does", "Whether it was made of flesh and whether it had a soul", "Whether it could do arithmetic and whether it could play chess"], "answerIndex": 1, "explanation": "Descartes held that a machine could utter words in response to being touched, but never arrange its speech 'to reply appropriately to everything that may be said in its presence'; and since its organs need 'special adaptation for every particular action', it could not match reason, 'a universal instrument which can serve for all contingencies'. He applied the same tests to animals.", "id": "q1"},
    {"type": "mcq", "prompt": "What did Ada Lovelace's Note G (1843) say about the Analytical Engine?", "options": ["That it would one day think for itself", "That it could only ever handle numbers", "That it 'has no pretensions whatever to originate anything' but can do whatever we know how to order it to perform", "That it could anticipate analytical truths before humans did"], "answerIndex": 2, "explanation": "Note G denies the Engine any power to originate or to anticipate 'analytical relations or truths'. Turing, who knew it via Hartree and quoted it without 'whatever', called this 'Lady Lovelace's Objection' and replied that machines often take him by surprise.", "id": "q2"},
    {"type": "mcq", "prompt": "How did Searle answer the Systems Reply to the Chinese Room?", "options": ["He conceded that the room as a whole understands Chinese", "He argued that robots with cameras would understand", "He replaced the room with a system of water pipes", "He imagined the man memorising the rules and doing everything in his head, and still not understanding Chinese"], "answerIndex": 3, "explanation": "If the man internalises the whole system, he is the system, yet he still could not attach meaning to the symbols, such as the Chinese word for hamburger. Cole and Block replied that memorising would not make him the system: a 'virtual mind' could understand while he does not. The water pipes were Searle's answer to the Brain Simulator Reply.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Jones and Bergen report from their three-party Turing tests (posted in 2025, published in PNAS in May 2026)?", "options": ["GPT-4.5, prompted to adopt a humanlike persona, was judged to be the human 73 per cent of the time", "No language model was ever mistaken for a human", "ELIZA outperformed every modern model", "Interrogators identified the machine correctly every time after five minutes"], "answerIndex": 0, "explanation": "In pre-registered five-minute tests, GPT-4.5 with a humanlike persona was picked as the human 73 per cent of the time, more often than the real humans; LLaMa-3.1-405B scored 56 per cent, ELIZA 23 and GPT-4o 21. Critics such as Gary Marcus say such results show how easy it is to fool humans; Searle's followers would add that passing is not understanding.", "id": "q4"},
    {"type": "open", "prompt": "Set out Searle's Chinese Room argument as numbered premises and a conclusion, then explain one reply to it (Systems, Robot, Brain Simulator or Luminous Room) and Searle's response. Does the argument succeed?", "rubric": "A strong answer describes the room (a man who knows no Chinese follows a rule book to pass out correct Chinese answers, identifying symbols 'entirely by their shapes') and gives the reconstruction: if strong AI is true, any system running the right program understands Chinese; I could run it without understanding; so strong AI is false. It distinguishes strong from weak AI and notes Searle did not deny that machines (such as brains) can think. It explains a reply and response accurately: Systems (whole system understands; memorisation; Cole/Block's virtual mind), Robot (sensors give more symbols; concession that cognition is not mere symbol manipulation), Brain Simulator (water pipes; simulation is not duplication) or Luminous Room (intuitions about unfamiliar systems mislead). Credit for the syntax/semantics derivation, Chalmers's recipe parody and Searle's 'observer-relative' reply, and for noting there is no consensus.", "id": "q5"},
    {"type": "open", "prompt": "Do today's large language models settle whether machines can understand? Discuss using the form-and-meaning argument (stochastic parrots and the octopus test), the symbol grounding problem and at least one objection.", "rubric": "A strong answer sets out the reconstruction: LLMs are trained only on linguistic form; meaning relates form to intentions and the world; form alone does not fix that relation; so a system trained only on form cannot learn meaning. It explains Bender and Koller's octopus, which impersonates a speaker until asked about a bear and sticks, and the 'stochastic parrots' description, and links both to Harnad's symbol/symbol merry-go-round and Searle's syntax/semantics premise. It weighs objections: fine-tuning with human feedback, multimodal and tool-using systems as a revived Robot Reply, and interpretability evidence of internal world models such as Othello-GPT; and the reply that structure and benchmark success show sophisticated form-processing, not grounding. Credit for dating claims, noting the 2025–26 Turing-test results, distinguishing understanding from consciousness (Chalmers's tentative '<10%?' credence for current LLMs; Butlin et al. 2023), and discussing Cole's worry that 'really' understanding might become epiphenomenal.", "id": "q6"}
  ]$machines_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/philosophy-of-mind/minds-and-machines', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
