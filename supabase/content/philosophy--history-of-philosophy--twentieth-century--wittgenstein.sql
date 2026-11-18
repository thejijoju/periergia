-- Wittgenstein — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/wittgenstein @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/wittgenstein',
    'research',
    'advanced',
    'read',
    $wittgenstein_master$> **Ludwig Wittgenstein wrote two of the most influential books of twentieth-century philosophy, and the second was in large part an attack on the first.** This chapter follows his life from a Viennese industrial fortune to a Cambridge chair; sets out the *Tractatus Logico-Philosophicus*, its picture theory of meaning and its claim that what matters most cannot be said; and then turns to the posthumous *Philosophical Investigations*: meaning and use, language-games, family resemblance, philosophy as therapy, rule-following and the private language argument. It sets out the main arguments step by step and treats the question of whether there were "two Wittgensteins" as a live debate.

## A Fortune, a Propeller and Bertrand Russell

Ludwig Wittgenstein was born in Vienna on 26 April 1889, the youngest child of Karl Wittgenstein, a steel magnate who was by the late 1880s one of the richest men in Europe. His father's parents had been born Jewish and converted to Protestantism; Ludwig was baptised Catholic. Three of his four brothers took their own lives (one death is presumed suicide).

He trained as an engineer in Berlin and then, from 1908, at Manchester, where he patented a propeller design in 1911. The philosophy of pure mathematics led him to Frege, who advised him to study with Bertrand Russell. In October 1911 he arrived unannounced at Russell's rooms in Cambridge. Russell first thought him "obstinate and perverse, but I think not stupid"; within months he wrote, "I love him and feel he will solve the problems I am too old to solve." (Their new logic is the subject of *Frege, Russell and the Birth of Analytic Philosophy*.)

{{image: Ludwig Wittgenstein | Ludwig Wittgenstein in 1929, the year he returned to Cambridge and to philosophy.}}

In 1913 he withdrew to Skjolden, Norway, where he later built a hut, to work on logic. In 1914 he volunteered for the Austro-Hungarian army, served on the Russian and Italian fronts and was decorated for bravery; carrying Tolstoy's *The Gospel in Brief*, he was known as "the man with the gospels". The notes and drafts of his first book were written in notebooks during the war, and the text was completed in August 1918 while he was on leave in Vienna. After nine months as an Italian prisoner of war he came home and gave his fortune away to his siblings.

## The Tractatus: Seven Sentences

The book appeared in German in 1921, in a journal edition Wittgenstein called a pirate edition, and in English in 1922, with an introduction by Russell (which Wittgenstein thought riddled with misunderstandings). The so-called Ogden translation was mainly the work of Frank Ramsey, then a nineteen-year-old undergraduate; C. K. Ogden got the credit, and Wittgenstein approved it. Philosophers often prefer the 1961 translation by D. F. Pears and B. F. McGuinness, which quotations here follow unless marked.

The *Tractatus* is short and strangely built: seven main propositions numbered 1 to 7, with every other remark numbered by decimals to show what it comments on (1.1 on 1, 1.11 on 1.1). It opens, "The world is all that is the case" (Ogden: "everything that is the case"). Wittgenstein told Russell that the main point was the theory of what can be *said* by propositions and what cannot be said "but only shown; which, I believe, is the cardinal problem of philosophy".

## The Picture Theory, Step by Step

The book's account of meaning is usually called the **picture theory**: a sentence means something by being a kind of model of a possible situation. Its reasoning can be reconstructed like this.

1. The world is the totality of facts, not of things (1.1). A fact is an existing **state of affairs**, a combination of objects.
2. Objects are simple (2.02) and "form the substance of the world" (2.021): the fixed element every possible world shares, while their combinations change. Without such substance, whether a sentence had sense would depend on whether another sentence was true, and no picture of the world could be drawn up (2.0211–2.0212).
3. We make pictures of facts: elements of the picture stand for objects, and their arrangement represents the arrangement of the objects. Picture and pictured share a "pictorial form": "it reaches right out to" reality (2.1511).
4. A thought is a logical picture of facts (3); a proposition is "a picture of reality" (4.01).
5. Analysis of our sentences must end in **elementary propositions**, "names in immediate combination" (4.221), each of which can be true and can be false.
6. Every other proposition is a **truth-function** of elementary ones (5): its truth is fixed by theirs, as truth-tables (of which Wittgenstein gave an early presentation) show.
7. Therefore only sentences that picture possible facts say anything: "The totality of true propositions is the whole of natural science" (4.11).

Two things follow. The truths of logic, tautologies, are *senseless* (*sinnlos*) rather than nonsense: allowing every possible state of affairs, they picture nothing. And logical form itself cannot be pictured; propositions "show the logical form of reality. They display it" (4.121), and "What can be shown, cannot be said" (4.1212). What the simple objects are is disputed; an everyday name like "London" would not count.

The objection that brought the system down came from inside it. The theory needs elementary propositions to be logically independent, yet 6.3751 says it is "logically impossible" for two colours (say, red and blue) to be at one place in the visual field at once: a statement of a point's colour looks elementary but excludes others. Ramsey pressed this **colour-exclusion problem** in his 1923 review in the journal *Mind*. Wittgenstein's response was not a defence but a concession. His recognition in "Some Remarks on Logical Form" (1929) that he could not sustain the independence claim is credited with provoking the downfall of the *Tractatus*: once elementary propositions can exclude one another, the rigid logical system gives way.

## Saying, Showing and the Ladder

The Preface explains that the book draws a limit not to thinking but "to the expression of thoughts", and "what lies on the other side of the limit will be simply nonsense". Most philosophical propositions are therefore "not false but nonsensical" (4.003). Philosophy is not a doctrine but an activity, aiming at "the logical clarification of thoughts" (4.112). "The limits of my language mean the limits of my world" (5.6), and "The world is my world" (5.62), which one commentator links to Schopenhauer's "The world is my idea" (see *Schopenhauer and Kierkegaard*).

Ethics, aesthetics, God and the "metaphysical subject" fall outside what can be said. "There are, indeed, things that cannot be put into words. They make themselves manifest. They are what is mystical" (6.522). Wittgenstein told the publisher Ludwig von Ficker that the book had two parts, the one presented "plus all that I have not written", and that "it is precisely this second part that is the important point."

The trouble is that the book's own sentences, about objects and logical form, picture no possible facts either. By its own standard they are nonsense, and Wittgenstein said so:

```quote
My propositions serve as elucidations in the following way: anyone who understands me eventually recognizes them as nonsensical, when he has used them—as steps—to climb beyond them. (He must, so to speak, throw away the ladder after he has climbed up it.)
Ludwig Wittgenstein · Tractatus Logico-Philosophicus 6.54, trans. Pears and McGuinness · 1921
```

The ladder may echo Schopenhauer or, as Alastair Hannay suggests, Kierkegaard; Sextus Empiricus had used the image earlier. Then comes proposition 7: "Whereof one cannot speak, thereof one must be silent" (Ogden), or "What we cannot speak about we must pass over in silence" (Pears–McGuinness).

How to read this is one of the liveliest debates about the book. On the **traditional** reading, defended above all by P. M. S. Hacker, the book points at truths that cannot be said but can be shown; Hans-Johann Glock adds that Wittgenstein's letters and conversations commit it to ineffable insight. On the **resolute** reading, associated with Cora Diamond's "Throwing Away the Ladder" (1988) and James Conant, and gathered in Alice Crary and Rupert Read's anthology *The New Wittgenstein* (2000), nonsense is just nonsense: the book does not hint at unsayable truths but is meant to cure us of wanting them, and even the saying/showing distinction is thrown away with the ladder. Hacker's reply, "Was He Trying to Whistle It?", alludes to Ramsey's quip of 1929: "But what we can't say we can't say, and we can't whistle it either." Neither camp is uniform; there is no single "New Wittgenstein" interpretation.

```checkpoint
q: Why does the Tractatus call the propositions of logic "senseless" rather than nonsense?
a*: Because tautologies picture no possible fact, allowing every state of affairs, yet they are well-formed and show the logic of language.
a: Because Wittgenstein thought logic was false.
x: Tautologies are true in every case; the point is that they say nothing, not that they are false.
a: Because logic, like ethics, belongs to the mystical.
x: The mystical is what cannot be put into words; tautologies are perfectly well-formed propositions that say nothing.
a: Because only sentences of natural science are senseless.
x: The reverse: the true propositions of natural science are the ones that do say something.
hint: Ask what a tautology rules out.
why: A tautology allows every possible state of affairs, so it pictures none; it is senseless (sinnlos), but unlike nonsense it is a proper part of the symbolism.
---
q: What is the colour-exclusion problem for the Tractatus?
a: That Wittgenstein could not see colours clearly.
x: The problem is logical, not perceptual.
a: That colour words have no meaning in the Tractatus.
x: The book itself says two colours cannot be at one place in the visual field; the difficulty is explaining why on its own principles.
a*: That statements about a point's colour look elementary yet exclude one another, which breaks the rule that elementary propositions are independent.
a: That Russell objected to the book's treatment of colour in his introduction.
x: It was Ramsey, in his 1923 review in Mind, who pressed the objection.
hint: Elementary propositions are supposed to be true or false independently of one another.
why: If "this point is red" excludes "this point is blue", they are not independent; Wittgenstein admitted in 1929 that he could not sustain the claim, which helped bring the system down.
```

## Schoolroom, House and Return

Having, to his mind, solved all philosophical problems, as the Stanford Encyclopedia of Philosophy (SEP) puts it, Wittgenstein taught from 1920 to 1926 in village schools in Lower Austria, strictly and with corporal punishment. In April 1926 he struck an eleven-year-old pupil, Josef Haidbauer, on the head and the boy collapsed; Wittgenstein resigned, and in 1936 returned to apologise in person to children he had hit. From 1926 to 1928 he worked with the architect Paul Engelmann on an austere house in Vienna for his sister Margaret, and largely took the design over.

Meanwhile the Vienna Circle, a group of scientifically minded philosophers, read the *Tractatus* aloud line by line, and from 1927 Moritz Schlick and others met Wittgenstein, who sometimes read them Tagore's poetry with his chair turned to the wall. He was never a member of the Circle. Its logical empiricism owed something to his account of logic as tautology, but how much is disputed: A. C. Grayling argues that its views were formed before it met him, and the SEP's entry on the Circle warns against overestimating its commitment to the *Tractatus*. Carnap praised the book but urged readers to ignore its closing sentences; Wittgenstein could not imagine that Carnap "should have so completely misunderstood the last sentences of the book and hence the fundamental conception of the entire book". (See *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*.)

In January 1929 Wittgenstein returned to Cambridge, reportedly above all to discuss philosophy with Ramsey ("Well, God has arrived," wrote Keynes), took a PhD with the *Tractatus* as his thesis and began to lecture. Ramsey died in January 1930, aged twenty-six. The Preface to the *Investigations* credits his criticism, in "innumerable conversations", with helping Wittgenstein see the "grave mistakes" of his first book. How far Ramsey shaped the later philosophy is disputed, from "literally none" of its key ideas to a great deal; the SEP speaks of "a confluence of ideas". Cheryl Misak and others argue that through conversations with Ramsey, and his own reading of William James's *Varieties of Religious Experience*, Wittgenstein's later thought acquired, in the SEP's phrase, "a pragmatist flavour" (see *American Pragmatism: Peirce, James and Dewey*).

The **middle period** that followed produced the *Blue and Brown Books* and much work on mathematics; by 1931 he called his early work "dogmatic". Most scholars place it somewhere between 1929 and the mid-1930s, though some stretch it to 1944.

## Meaning, Use and Language-Games

The *Philosophical Investigations*, whose Part I Wittgenstein withdrew from his publisher in 1946, was published in 1953, after his death, edited by Elizabeth Anscombe and Rush Rhees and translated by Anscombe. Its numbered remarks argue with an imagined interlocutor. Quotations below follow Anscombe's translation or the 2009 revision by Hacker and Joachim Schulte; where the wording differs in a way that matters, both are noted.

It begins with Augustine's account in the *Confessions* of learning to speak (see *Augustine and Early Christian Philosophy*). In the picture Wittgenstein draws from Augustine, "the words in language name objects", sentences combine names, and a word's meaning is "the object for which the word stands" (§1). In §2 a builder and his assistant share a language of four words, "block", "pillar", "slab", "beam": "A calls them out;—B brings the stone which he has learnt to bring at such-and-such a call." Augustine's picture fits this little game, but even here the words get their meaning from the activity they belong to. (*The Classical Indian Schools: Nyāya, Vaiśeṣika, Sāṃkhya, Yoga and Mīmāṃsā* compares Kumārila with this criticism of Augustine.) Words are as diverse in function as the tools in a toolbox (§11). Wittgenstein calls such wholes **language-games**, a term meant "to emphasize the fact that the speaking of language is part of an activity, or of a form of life" (§23): reporting an event, making up a story, making a joke, translating, thanking, praying.

The most quoted remark is §43:

```quote
For a large class of cases—though not for all—in which we employ the word "meaning" it can be defined thus: the meaning of a word is its use in the language.
Ludwig Wittgenstein · Philosophical Investigations §43, trans. G. E. M. Anscombe · 1953
```

The 2009 revision reads "this word can be explained in this way". Either way the qualifier matters: as the Internet Encyclopedia of Philosophy (IEP) stresses, Wittgenstein is not offering a general theory that "meaning is use"; he is warning against the ideas that a word's meaning is the object it names or a feeling in the mind.

Nor, he argued, need a word be defined by something all its instances share. "Consider for example the proceedings that we call 'games'... look and see whether there is anything common to all" (§66). "Don't think, but look!" What we find is "a complicated network of similarities overlapping and criss-crossing". "I can think of no better expression to characterize these similarities than 'family resemblances'" (§67), the way build, features, eye colour and gait overlap among the members of a family. The *Tractatus* had sought the general form of the proposition; the *Investigations* finds language itself to be such a family.

## Philosophy as Therapy

If language is in order as it is, where do philosophical problems come from? Not, as is sometimes said, from ordinary language itself, but from being misled by its forms. "Our investigation is a grammatical one", clearing away "misunderstandings concerning the use of words, caused, among other things, by certain analogies between the forms of expression in different regions of language" (§90). In the standard English translation of §109, "Philosophy is a battle against the bewitchment of our intelligence by means of language"; there, "description alone" must replace explanation. "A philosophical problem has the form: 'I don't know my way about'" (§123). The aim is "to show the fly the way out of the fly-bottle" (§309). There is no single method, "though there are indeed methods, different therapies, as it were" (§133). Hence his interest in **grammar**, the rules for using our words: "Essence is expressed by grammar" (§371).

A philosophical puzzle is treated less as a question awaiting an answer than as a confusion to be dissolved, until "the philosophical problems should completely disappear" (§133). A critic, Farrell, derided this in 1946 as "therapeutic positivism". Some modern readers of Nāgārjuna read him in a similarly therapeutic way (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*).

He also explored **seeing-as**, making famous the duck-rabbit, a drawing that can be seen as either animal. Of a face suddenly seen to resemble another he wrote: "I see that it has not changed; and yet I see it differently. I call this experience 'noticing an aspect'."

## Following a Rule

Remarks roughly §§185–242 ask what it is to follow a rule. A pupil taught to add 2 writes, after 1000, "1004, 1008, 1012", and when corrected protests, "But I did go on in the same way" (§185). The argument runs:

1. We picture grasping a rule as having something, an abstract object or a mental item, that already contains all its future applications.
2. But any finite set of examples or instructions fits many different continuations, and any statement of the rule ("add 2") can itself be interpreted in more than one way.
3. If an interpretation fixes the rule, it too needs interpreting: "any interpretation still hangs in the air along with what it interprets" (§198).
4. Hence the paradox of §201 (Anscombe): "no course of action could be determined by a rule, because every course of action can be made out to accord with the rule." (The 2009 revision: "brought into accord".)
5. But the same remark says the paradox rests on a misunderstanding: "there is a way of grasping a rule which is *not* an *interpretation*, but which is exhibited in what we call 'obeying the rule' and 'going against it' in actual cases."

The conclusion is that following a rule is a practice: "to understand a language means to be master of a technique", and obeying a rule is a custom (§199). It rests on agreement "not in opinions, but rather in form of life" (§241).

In 1982 Saul Kripke gave this a famous twist in *Wittgenstein on Rules and Private Language*, presented as "Wittgenstein's argument as it struck Kripke". Suppose I have never added numbers as large as 57. A sceptic suggests that by "plus" I always meant "quus", which gives the same answers below 57 and 5 otherwise. What fact about me shows that I meant addition, and justifies "125" as the answer to "68 + 57"? Not my past behaviour, which fits both; not an instruction, which can be reinterpreted; not my dispositions, which are finite and describe what I *would* answer, whereas meaning concerns what I *ought* to answer. Kripke's sceptic concludes, "There is no fact about me that distinguishes my meaning a definite function by 'plus' ... and my meaning nothing at all." His "sceptical solution" replaces facts with conditions under which we may assert that someone means addition: roughly, when his answers agree with the community's. Private language falls as a corollary.

Critics nicknamed this figure "Kripkenstein". Baker and Hacker (1984) replied that Wittgenstein found scepticism nonsensical, that the paradox is "not a sceptical problem but an absurdity", and that a practice needs regularity over time, not many people. John McDowell said Kripke ignores the second half of §201: drop the assumption that understanding is interpretation and no paradox arises. McGinn and Blackburn defended individualist readings; Martin Kusch has defended Kripke. The IEP, doubting Kripke's exegesis, still calls him and his critics one of the best ways into Wittgenstein.

## Could There Be a Private Language?

Wittgenstein never used the phrase "private language argument". At §243 he imagines a language whose words "are to refer to what only the speaker can know—to his immediate private sensations. So another person cannot understand the language" (2009 wording). This is not a code, which others could crack, but a language intelligible in principle only to its maker. The target is a picture running from Descartes's inward identification of experiences (see *Descartes*) to Russell's "logically perfect language".

1. Sensation words as we actually use them are not private: we learn them as replacements for natural expressions of pain.
2. So imagine a pure case. I keep a diary and write "S" whenever a certain sensation occurs; no definition of "S" can be given, so I concentrate my attention on the sensation (§258).
3. Concentrating is meant to make me remember the connection *right* in future. But "I have no criterion of correctness. One would like to say: whatever is going to seem right to me is right. And that only means that here we can't talk about 'right'."
4. Appealing to memory does not help, if there was never a determinate connection to remember; it is like buying several copies of the same morning paper to check that it is true (§265).
5. If "S" is tied to a public check, such as a manometer showing a rise in blood pressure (§270), it works, but then its meaning is public and the private object does no work.
6. So a language in principle intelligible only to its user is impossible: its user could not give its signs meaning.

The **beetle in the box** (§293) makes the point vivid: "Suppose everyone had a box with something in it: we call it a 'beetle'. No one can look into anyone else's box, and everyone says he knows what a beetle is only by looking at *his* beetle" (2009: "just by looking"). The conclusion: "if we construe the grammar of the expression of sensation on the model of 'object and designation' the object drops out of consideration as irrelevant." This does not make him a behaviourist: he does not deny that sensations exist.

The strongest objection is that the argument rests on the fallibility of memory, which would destroy public language too. The best reply comes in two stages. Anthony Kenny argued that the issue is remembering a *meaning*, not re-identifying sensations; Stewart Candlish and George Wrisley go further: the question is whether a private definition was ever made at all, so public language is not threatened. A second objection asks about Robinson Crusoe: if language needs a community, a lifelong solitary speaker would be impossible, yet he seems conceivable. Norman Malcolm accepted the community view; Baker and Hacker rejected it, holding that language must only be *potentially* shareable. When Ayer and Rhees debated the point in 1954, Ayer, says the IEP, "is generally considered to have won".

```checkpoint
q: What, according to Kripke's sceptic, is wrong with appealing to my dispositions to show that I meant addition?
a: Dispositions are private, so no one else could check them.
x: Kripke's sceptic grants access to every fact about my mind; privacy is not the complaint.
a*: Dispositions are finite and only describe what I would do, while meaning concerns what I ought to answer.
a: Dispositions did not exist before I learned arithmetic.
x: The sceptic's point concerns the gap between describing and justifying, not when dispositions arose.
a: Dispositions always produce the right answer, so they cannot tell plus from quus.
x: The opposite: dispositions can include systematic mistakes.
hint: Kripke calls the relation of meaning to action "normative, not descriptive".
why: Meaning tells me what I should say; a disposition only predicts what I would say, and it covers finitely many cases.
---
q: What is the point of the manometer example in the private language discussion?
a: It proves that sensations are really changes in blood pressure.
x: Wittgenstein does not identify sensations with anything; he denies being a behaviourist.
a: It shows that memory of sensations is perfectly reliable.
x: The example concerns public checks, not the reliability of memory.
a: It shows that a private diary is useful for doctors.
x: The diary is a thought experiment about naming, not a medical record.
a*: Linking "S" to a public check makes the sign usable, but then its meaning is public and the private object does no work.
hint: Ask what gives the sign "S" a use once it is linked to the gauge.
why: The public check supplies a criterion of correctness; the private sensation then plays no role in fixing the meaning.
```

## On Certainty and the Last Years

Wittgenstein succeeded Moore as professor at Cambridge in 1939, worked as a hospital porter and laboratory assistant during the Second World War, and resigned the chair in 1947 to write.

In the last eighteen months of his life he wrote the remarks published as *On Certainty* (1969). Their target was Moore's "A Defence of Common Sense" (1925) and "Proof of an External World" (1939), with its "Here is one hand ... and here is another" (see *Frege, Russell and the Birth of Analytic Philosophy*). "Moore's mistake lies in this—countering the assertion that one cannot know that, by saying 'I do know it'" (§521). Against the sceptic, doubt itself needs a background: "The game of doubting itself presupposes certainty" (§115). Some propositions "are exempt from doubt, are as it were like hinges on which those turn" (§341), and they are like a river-bed, which can itself shift. Whether such **hinges** are known, merely psychologically certain or rules of grammar is debated in today's "hinge epistemology" (see *Scepticism and the Answers to It*).

Diagnosed with prostate cancer, he died in Cambridge at the home of his doctor, Edward Bevan, on 29 April 1951. Malcolm and Wittgenstein's biographer Ray Monk report that the night before, he told Mrs Joan Bevan, "Tell them I've had a wonderful life"; the SEP more cautiously says "Legend has it" these were his last words.

## One Philosopher or Two?

For about two decades after 1953 there seemed to be wide agreement on two philosophies and a sharp break, and the Preface supports it, asking that the new thoughts be seen "against the background of my old way of thinking". The differences are real: the *Tractatus* sought the general form of all propositions, the later work attacks the "craving for generality" (the phrase is from the *Blue Book*). But continuity readings stress what stayed: philosophy as an activity of clarifying language, whose problems are to be dissolved. The IEP judges that "the differences between his early and late work can be exaggerated", the main change being perhaps "one of method and style". Resolute readers find the therapeutic aim already in the *Tractatus*, and talk of a "middle" and, following Danièle Moyal-Sharrock, a post-*Investigations* "third" Wittgenstein complicates the picture further.

## Influence and Critics

His later influence ran through "ordinary language philosophy", associated with Oxford between about 1945 and 1970, though it began with his Cambridge pupils; he himself accepted no label. Anscombe, his student and translator, wrote *Intention* (1957) and later held his old chair. Peter Winch's *The Idea of a Social Science* (1958) used the later work against positivism in the social sciences, and Stanley Cavell, in *Must We Mean What We Say?* (1969) and *The Claim of Reason* (1979), showed that "description", "ordinary" and "usage" are "not as innocuous as they had seemed". Thomas Kuhn took up the duck-rabbit (via Wittgenstein and N. R. Hanson) and the idea of family resemblance (see *Revolutions and Realism: Kuhn and After*). A 1999 poll of American college teachers ranked the *Investigations* the most important philosophy book of the century (see *Language, Thought and Speech Acts* and *Analytic Philosophy since 1950*).

Not everyone was persuaded. Russell found nothing interesting in the *Investigations*: the later Wittgenstein "seems to have grown tired of serious thinking and to have invented a doctrine which would make such an activity unnecessary", reducing philosophy at worst to "an idle tea-table amusement". In 1959 Ernest Gellner's *Words and Things* attacked "linguistic philosophy" wholesale, with Russell's approving foreword. His remarks on mathematics fared no better with logicians such as Michael Dummett and Georg Kreisel.

## Further exploration

- **Ray Monk, *Ludwig Wittgenstein: The Duty of Genius* (1990).** The standard biography.
- **G. E. M. Anscombe, *An Introduction to Wittgenstein's Tractatus* (1959).** A guide to the early work by his student and translator.
- **Saul A. Kripke, *Wittgenstein on Rules and Private Language* (1982).** The sceptical reading of rule-following that set the modern debate.
- **Alice Crary and Rupert Read (eds.), *The New Wittgenstein* (2000).** The resolute reading, with essays by Diamond and Conant and Hacker's reply.
- **Danièle Moyal-Sharrock (ed.), *The Third Wittgenstein: The Post-Investigations Works* (2004).** Essays on *On Certainty* and the last writings.
- **Cheryl Misak, *Cambridge Pragmatism: From Peirce and James to Ramsey and Wittgenstein* (2016; some sources give 2018).** Ramsey, pragmatism and the later Wittgenstein.
- **Stanley Cavell, *The Claim of Reason: Wittgenstein, Skepticism, Morality, and Tragedy* (1979).** An ambitious reading of the later work.$wittgenstein_master$,
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
  select $wittgenstein_quiz$[
    {"type": "mcq", "prompt": "Who did most of the work on the 1922 English translation of the Tractatus usually credited to C. K. Ogden?", "options": ["Frank Ramsey, then an undergraduate aged nineteen", "Bertrand Russell, who also wrote the introduction", "G. E. M. Anscombe", "D. F. Pears and B. F. McGuinness"], "answerIndex": 0, "explanation": "The \"Ogden translation\" was mainly Ramsey's work; Ogden got the credit and Wittgenstein approved it. Pears and McGuinness made a new translation in 1961; Anscombe translated the Investigations.", "id": "q1"},
    {"type": "mcq", "prompt": "What does Philosophical Investigations §43 actually say about meaning and use?", "options": ["That every word means the object it names", "That meaning is a feeling that accompanies a word in the mind", "That for a large class of cases, though not for all, the meaning of a word is its use in the language", "That meaning is fixed by the method of verifying a sentence"], "answerIndex": 2, "explanation": "The qualifier matters: as the IEP stresses, Wittgenstein is not offering a general theory that \"meaning is use\". The first two options are the views he warns against; verification was a theme of the Vienna Circle conversations, not §43.", "id": "q2"},
    {"type": "mcq", "prompt": "In Kripke's reading of the rule-following remarks, what is \"quus\"?", "options": ["A private sensation recorded in a diary as \"S\"", "A function that agrees with addition for numbers below 57 but gives 5 otherwise, which the sceptic says I might always have meant by \"plus\"", "Wittgenstein's own name for the community's agreement in judgements", "The rule \"add 2\" as misapplied by the pupil in §185"], "answerIndex": 1, "explanation": "Kripke's sceptic asks what fact about me shows that I meant plus rather than quus. Past behaviour, instructions and dispositions all fail, leading to the sceptical conclusion and the community-based \"sceptical solution\".", "id": "q3"},
    {"type": "mcq", "prompt": "Which statement about Wittgenstein and the Vienna Circle is best supported?", "options": ["He was a founding member and attended its meetings regularly", "He coined the phrase \"private language argument\" in discussions with the Circle", "The Circle's debt to the Tractatus is undisputed", "He was never a member; the Circle read the Tractatus closely, but how far it inspired the Circle is disputed"], "answerIndex": 3, "explanation": "He met Schlick and a few others but was never a member. Grayling argues the Circle's views were formed before it met him, and the SEP warns against overestimating its commitment to the Tractatus. He never used the phrase \"private language argument\".", "id": "q4"},
    {"type": "open", "prompt": "Set out the private language argument of Philosophical Investigations §§243–271 step by step, then present the memory-scepticism objection and the best reply.", "rubric": "A strong answer defines a private language (one in principle intelligible only to its speaker, not a code); presents the diary case of §258 (no definition of \"S\" can be given, so the speaker concentrates on the sensation), the point that \"whatever is going to seem right to me is right\" means we cannot talk about \"right\", the morning-paper image of §265, and the manometer case in which a public check makes the sign work but leaves the private object idle; and draws the conclusion. It may use the beetle in the box (§293). It states the objection that the argument rests on the fallibility of memory and would therefore destroy public language too, and the reply of Kenny (the issue is remembering a meaning) and Candlish and Wrisley (the issue is whether a private definition was ever made). Credit for noting that Wittgenstein never used the phrase, that he was not a behaviourist, or the Crusoe objection (Ayer vs Rhees).", "id": "q5"},
    {"type": "open", "prompt": "Was there one Wittgenstein or two? Assess the case for a sharp break between the Tractatus and the Investigations and the case for continuity, using the debate over how to read the Tractatus.", "rubric": "A strong answer explains the picture theory and the Investigations' criticism of the Augustinian picture of language, family resemblance and the attack on the \"craving for generality\"; cites the Preface's \"grave mistakes\" and its wish that the new thoughts be seen against the background of the old; and the colour-exclusion problem and Ramsey's criticism as causes of change. For continuity it cites philosophy as an activity of clarification rather than a doctrine, the IEP's view that the differences \"can be exaggerated\" and lie in method and style, and the resolute reading (Diamond, Conant) that finds a therapeutic aim in the Tractatus, contrasted with Hacker's traditional ineffability reading. Credit for mentioning the middle period and the \"third Wittgenstein\" of On Certainty.", "id": "q6"}
  ]$wittgenstein_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/wittgenstein', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
