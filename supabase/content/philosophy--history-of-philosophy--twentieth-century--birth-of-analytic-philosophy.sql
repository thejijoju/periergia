-- Frege, Russell and the Birth of Analytic Philosophy — canonical master article, co-written and human-reviewed.
-- philosophy/history-of-philosophy/twentieth-century/birth-of-analytic-philosophy @ research/advanced/read.
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
    'philosophy/history-of-philosophy/twentieth-century/birth-of-analytic-philosophy',
    'research',
    'advanced',
    'read',
    $analytic_master$> **Between 1879 and the 1930s a handful of mathematicians and philosophers built a new logic and used it to take old problems apart.** This chapter follows Gottlob Frege's invention of modern logic, his attempt to found arithmetic on it and his distinction between sense and reference; Bertrand Russell's paradox, which wrecked that attempt, and the theory of descriptions, type theory and *Principia Mathematica* that came after it; and G. E. Moore's revolt against idealism and his defence of common sense. It sets out four arguments step by step with their strongest objections, asks what "analytic philosophy" is and when it began, and names the people the usual story leaves out.

## A Quiet Revolution in Jena

Gottlob Frege (1848–1925), born in Wismar in Mecklenburg, took a doctorate in mathematics in 1873 and taught at the University of Jena from 1874 until he retired around 1917–18. His books were poorly received: few could read the notation of the first, the second was "virtually ignored", in the words of the Internet Encyclopedia of Philosophy (IEP), and he paid for the last volume of his major work himself. He did not live to see his influence; that his logic replaced the older forms was, the IEP says, "due to the championship of Russell".

The first book, the *Begriffsschrift* ("concept-script", 1879), was subtitled "a formula language of pure thought, modelled on that of arithmetic". In it, says the IEP, Frege "invented modern quantificational logic, and created the first fully axiomatic system for logic": one in which every theorem is derived from stated starting points by stated rules.

What was new? For two thousand years logic had analysed sentences into subject and predicate, as the chapter on *Aristotle* describes. Frege replaced this with the mathematician's idea of **function and argument**. In "John loves Mary", the expression "( ) loves Mary" is "unsaturated": it has a gap, like a function waiting for a number, and the name "John" fills it. Then come the **quantifiers**, "for every x" and "there is an x", which bind such gaps. In the older logic, the step from "John loves Mary" to "Something loves Mary" and the step to "John loves something" needed different rules; with quantifiers both are the same move.

Frege saw himself as realising Leibniz's idea of a universal formal language (see *Leibniz*). He was not alone. In America, Charles Sanders Peirce and his student O. H. Mitchell independently developed quantification in 1883–85; the Stanford Encyclopedia of Philosophy (SEP) concludes that "Peirce and Frege, independently of each other, took us from the traditional Aristotelian logic to modern logic" (see *American Pragmatism: Peirce, James and Dewey*). Susanne Bobzien has also argued (2021) that Frege borrowed heavily, without acknowledgement, from Stoic logic; the SEP calls her case cumulative, with "no smoking gun" (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*).

{{image: Gottlob Frege | Gottlob Frege around 1879, the year of the *Begriffsschrift*.}}

## Numbers as Objects: the *Grundlagen*

Frege's aim was **logicism**: the thesis that mathematical concepts can be defined in purely logical terms, and mathematical truths derived from logical laws alone. *The Foundations of Arithmetic* (*Die Grundlagen der Arithmetik*, 1884) made the case in informal prose.

Its first insight is that a statement of number is about a concept. Ask "How many?" of a body of soldiers and there is no answer until you say whether you mean one army or twenty regiments. "There are eight planets" says that eight things fall under the concept *planet*; "unicorns do not exist" says that the concept *unicorn* has no instances. Existence is a property of concepts, and Frege noted that this diagnoses the error in the ontological argument for God.

The book's **context principle** is a rule of method: never ask for the meaning of a word in isolation, only in the context of a whole proposition. What is now called **Hume's Principle** says that the number of Fs equals the number of Gs if and only if the Fs and Gs can be paired off one to one, as a full theatre's seats and audience can be without counting either. Numbers, for Frege, are objects, though 0 and 1 cannot be given to us in sensation, against Kant's view that no object is given without sensibility. He defined a truth as **analytic** if its proof depends only on general logical laws and definitions, and argued that arithmetic, so understood, is analytic (see *Kant*). Michael Dummett later dated "the precise moment" of philosophy's "linguistic turn" to §62, where Frege, asking how numbers are given to us, answers by defining the sense of sentences containing number words.

## Sense and Reference

Frege's most famous paper, "On Sense and Reference" (1892), begins with a puzzle about identity. (His word *Bedeutung* has been translated "meaning", "reference", "significance" and "denotation"; this chapter follows Dummett's "reference".) The argument runs:

1. A statement of the form "a = a", such as "Mark Twain = Mark Twain", can be known just by looking at it. A true statement of the form "a = b", such as "Mark Twain = Samuel Clemens" or "Hesperus = Phosphorus", can be a discovery, needing evidence or calculation.
2. If an identity statement said only that the object named is identical with itself, then "a = a" and a true "a = b" would say the same thing.
3. They do not say the same thing: one is trivial and knowable in advance, the other informative.
4. So a name must contribute more than its object. Besides its **reference** (the object it picks out), each name has a **sense**: the way the object is presented, or the way one conceives of it.

Hesperus is the Evening Star and Phosphorus the Morning Star; both are the planet Venus. The names share a reference and differ in sense. The idea solves a second puzzle too. From "John believes that Mark Twain wrote *Huckleberry Finn*" and "Mark Twain is Samuel Clemens", it does not follow that John believes Samuel Clemens wrote it. Frege's answer is that after "believes that", words refer not to their ordinary objects but to their ordinary senses. A sentence's reference is its truth-value, the True or the False, and its sense is a **thought**; "Pegasus" has a sense but no reference. In "The Thought" (1918) Frege placed thoughts in "a third realm", neither mental nor physical. Readers of *Vedānta: Śaṅkara, Rāmānuja and Madhva* will find a striking earlier parallel in Rāmānuja.

The strongest objection came from Kripke's *Naming and Necessity* (1972/1980), aimed at "descriptivist" theories associated with Frege and Russell, on which a name means a description, so that "Socrates" means "the teacher of Plato". First, "Socrates might not have taught Plato" is true but "the teacher of Plato might not have taught Plato" is not: names are "rigid", picking out the same thing in every possible situation, and descriptions are not. Second, it would then be knowable without evidence that Socrates taught Plato, which it is not. Third, people refer successfully with "Feynman" knowing only "a physicist"; reference passes along a chain of use. Replies include "rigidified" descriptions ("the *actual* teacher of Plato"), descriptions that merely fix reference, community-wide clusters of descriptions, and Chalmers and Jackson's "apriorist" account. Whether Frege himself was a descriptivist is still debated; see *Meaning and Reference* and *Analytic Philosophy since 1950*.

## The Letter of June 1902

Frege's *Basic Laws of Arithmetic* (*Grundgesetze der Arithmetik*; vol. I 1893) was to carry out logicism in full. Its weak point was **Basic Law V**: the extension of one concept (roughly, the class of things falling under it) is identical to that of another if and only if the two concepts apply to exactly the same things. In the late spring of 1901 Bertrand Russell, working on his *Principles of Mathematics* and studying Cantor's proof that there is no greatest cardinal number, found the flaw (his accounts date it to May or June). Reconstructed:

1. Basic Law V implies that for every concept there is a class: the class of things that fall under it.
2. "Is not a member of itself" is a concept. Most classes fall under it: the class of teaspoons is not a teaspoon.
3. So there is a class, R, of all classes that are not members of themselves.
4. If R is a member of itself, then it fails the condition for membership, so it is not.
5. If R is not a member of itself, then it meets the condition, so it is.
6. So R is a member of itself if and only if it is not: a contradiction. Basic Law V, and any system containing it, is inconsistent.

(The village barber who shaves all and only those who do not shave themselves is a popular illustration later attached to it. Zermelo found a similar contradiction independently, perhaps between 1897 and 1902.)

On 16 June 1902, when Frege's second volume was in press, Russell wrote to Frege. Frege replied on 22 June; in the English of van Heijenoort's anthology *From Frege to Gödel* (1967), he wrote that the discovery caused him "the greatest surprise and, I would almost say, consternation, since it has shaken the basis on which I intended to build arithmetic", and conceded that his Law V "is false". He added a hastily written appendix to volume II (1903), which opens:

```quote
Hardly anything more unfortunate can befall a scientific writer than to have one of the foundations of his edifice shaken after the work is finished. This was the position I was placed in by a letter of Mr Bertrand Russell, just when the printing of this volume was nearing its completion.
Gottlob Frege · Appendix to Grundgesetze der Arithmetik, vol. II, trans. Michael Beaney (The Frege Reader, 1997, p. 279) · 1903
```

His proposed repair was later shown to imply that only one object exists. Frege "never fully recovered", the SEP says, and in 1924 abandoned logicism. Russell later wrote that he knew of nothing "to compare with Frege's dedication to truth". Yet Frege had used Law V only to obtain Hume's Principle, and from that principle alone, as Crispin Wright (1983) and Richard Heck (1993) showed, his derivation of arithmetic goes through: **Frege's Theorem**. Whether Hume's Principle is itself a truth of logic is debated, and "neo-logicists" have revived Frege's project since the 1980s.

Frege's diary for a few weeks of 1924 shows, in the SEP's words, "sympathies for fascism and anti-Semitism", including, the IEP says, an apparent wish to see Jews expelled from Germany or deprived of political rights. Dummett, who read it in 1954, was deeply shocked, and in 1973 called the late Frege a "virulent anti-Semite".

## Russell: Types, *Principia* and the Limits of Logic

Russell (1872–1970), grandson of the Prime Minister Lord John Russell, studied mathematics and philosophy at Trinity College, Cambridge, where he met A. N. Whitehead. Like Moore, he began within British idealism, the tradition of Bradley and T. H. Green. He recalled: "It was towards the end of 1898 that Moore and I rebelled against both Kant and Hegel. Moore led the way, but I followed closely in his footsteps." Russell's chief target was monism, the view that reality is one whole: mathematics needs relations, such as "greater than", between genuinely separate things.

*The Principles of Mathematics* (1903), after Russell met Peano in 1900, called the fact "that all Mathematics is Symbolic Logic" "one of the greatest discoveries of our age"; its appendix on Frege made Frege better known. Another appendix gave a first answer to the paradox, the **theory of types**: individuals, classes of individuals, classes of classes and so on form a hierarchy, so "a class that is a member of itself" cannot even be said. A "ramified" version followed in 1908, needing an **axiom of reducibility** widely criticised as ad hoc; Frank Ramsey showed in 1925 how to do without the ramified theory.

The result was *Principia Mathematica* by Whitehead and Russell (three volumes, 1910–13). "There is hardly a line in all the three volumes which is not a joint product," Russell said. Cambridge University Press expected to lose £600, and the authors paid £50 each towards it. The book is often mocked for taking hundreds of pages to prove that 1 + 1 = 2, but the joke is misleading. Proposition ✱54.43, in volume I, says only that from it the result "will follow, when arithmetical addition has been defined"; the proof is completed at ✱110.643, in volume II, with the dry remark "The above proposition is occasionally useful."

*Principia*'s influence, says the SEP, "was enormous from 1910 to 1950". But in 1931 Kurt Gödel published "On formally undecidable propositions of *Principia Mathematica* and related systems": a true statement of arithmetic can be neither proved nor refuted in Peano arithmetic, and arithmetic cannot prove its own consistency. Logicism "went into decline" around 1930, largely because of Gödel and the rise of Zermelo–Fraenkel set theory. These results are treated in *Formal Logic: Propositions, Predicates and Proofs* and *Paradoxes: the Liar, the Heap and Zeno*.

## "On Denoting": the Present King of France

"On Denoting" (*Mind*, 1905), which Ramsey called "that paradigm of philosophy", tackled a different problem. Before 1905 Russell held, like the Graz philosopher Alexius Meinong, that every denoting phrase, even "the golden mountain", stands for some entity. Consider "The present King of France is bald", said when France had no king. Russell now argued that "the present King of France" is an "incomplete symbol", with no meaning in isolation, and that the sentence says three things:

1. There is at least one present King of France.
2. There is at most one present King of France.
3. Whoever is present King of France is bald.

The first claim is false, so the sentence is false, and no non-existent king is needed. By the law of excluded middle, either it or "the King of France is not bald" should be true (Russell joked that "Hegelians, who love a synthesis, will probably conclude that he wears a wig"). The answer is **scope**: "not bald" can mean "there is a unique King, and he is not bald", which is false, or "it is not the case that there is a unique King who is bald", which is true. The analysis also explains why George IV could wonder whether Scott was the author of *Waverley* without wondering whether Scott was Scott, without Frege's senses, and why "the golden mountain does not exist" is true. Against Meinong, Russell added that the round square would be both round and not round; Meinong replied that objects without being need not obey the law of non-contradiction.

The strongest objection came in P. F. Strawson's "On Referring" (1950): uttered now, the sentence is neither true nor false, because it *presupposes*, rather than asserts, that there is a king. Meaning belongs to sentences, truth to uses of them; and "the table is covered with books" does not claim there is only one table. Russell replied (1957) that an atheist who used Strawson's doctrine to avoid calling "the Ruler of the Universe is wise" false "would be regarded as a somewhat shifty character"; Neale (1990) added that "My mother is dating the present king of France" seems plainly false. Donnellan (1966) distinguished "referential" from "attributive" uses of descriptions; Kripke (1977) answered that the difference concerns speakers' meaning, not the words.

## Acquaintance and Logical Atomism

"Knowledge by Acquaintance and Knowledge by Description" (1910–11), partly a response to a talk by the logician Constance Jones, distinguished objects of which we are "directly aware" from things known only as whatever answers a description. *The Problems of Philosophy* (1912) drew the moral: "Every proposition which we can understand must be composed wholly of constituents with which we are acquainted." His "supreme maxim" (1914) was: "Whenever possible, logical constructions are to be substituted for inferred entities."

His 1918 lectures "The Philosophy of Logical Atomism" pictured a world of atomic facts and credited many ideas to Ludwig Wittgenstein, who on Frege's advice had come to Cambridge in 1911 to study with him (see *Wittgenstein*). The war years cost Russell dear: fined £100 for an anti-war pamphlet and dismissed from Trinity in 1916, he was convicted again in 1918 for suggesting that American troops might be used to intimidate strikers in Britain, and spent five months in Brixton Prison, where he wrote *Introduction to Mathematical Philosophy* (1919). He won the Nobel Prize for Literature in 1950.

## Moore: Idealism Refuted, Common Sense Defended

G. E. Moore (1873–1958) came to Trinity to read Classics and turned to philosophy under Russell and McTaggart; he was professor at Cambridge from 1925 to 1939, when Wittgenstein succeeded him, and a friend of the Bloomsbury Group.

"The Refutation of Idealism" (1903) attacked the principle that to be is to be perceived. Moore distinguished the act of consciousness from its object, the sensation of blue from the blue, so that to be aware at all is to be in touch with something beyond one's mind: "Merely to have a sensation is already to be outside that circle." The same year's *Principia Ethica* held goodness to be indefinable and "non-natural", and its **open-question argument** ran: if "good" meant "pleasant", "pleasure is good" would be as empty as "pleasure is pleasure", yet "it is pleasant, but is it good?" stays open. Critics reply that two words can pick out one property without meaning the same, as "water" and "H₂O" do (see *Metaethics: Are There Moral Facts?* and, on Moore against Mill, *Bentham, Mill and Utilitarianism*).

"A Defence of Common Sense" (1925) listed truisms, such as that the earth had existed for many years before his body was born, that Moore said he knew for certain, while separating their truth from their analysis, which might be as radical as one liked. In "Proof of an External World", a British Academy lecture of 1939, external objects are things whose existence does not depend on our experience, and the proof is given:

```quote
By holding up my two hands, and saying, as I make a certain gesture with the right hand, 'Here is one hand', and adding, as I make a certain gesture with the left, 'and here is another'.
G. E. Moore · "Proof of an External World", Proceedings of the British Academy · 1939
```

Set out, the argument is:

1. Here is one hand.
2. Here is another.
3. Hands are material objects, external to the mind.
4. So at least two external objects exist: there is an external world.

The premises differ from the conclusion, are known, and entail it; it would be absurd, Moore said, to suggest he only believed he had hands. The obvious objection is that the proof **begs the question**: the premises count as known only if scepticism is already false. Crispin Wright puts this as a failure of "transmission": the justification for "this is a hand" does not carry over to "there is an external world". Wittgenstein, in notes from his last months published as *On Certainty* (1969), held that Moore's mistake was to answer the claim that such things cannot be known simply by insisting that he knows them.

Replies come in several forms. James Pryor defends the proof against Wright. The "G. E. Moore shift", William Rowe's name for it, runs the sceptic's argument backwards: since it is more reasonable to believe I have hands than the sceptic's premise, that premise is false. Moore himself later said he had meant to refute "there are no material things", not "Nobody knows for certain that there are any material things", and Tom Baldwin reads the proof as establishing a truism while leaving its analysis open. In a late paper Moore even conceded, with reservations, that he could not know he was not dreaming. The debate continues in *Scepticism and the Answers to It* and *Perception and the External World*.

```checkpoint
q: Why, according to Frege, must a name have a sense as well as a reference?
a*: Because otherwise a true "a = b" would say no more than "a = a", yet one can be a discovery and the other is trivial.
a: Because names without a sense could not refer to anything that exists.
x: Frege allowed sense without reference ("Pegasus"), but his argument starts from informative identities, not from existence.
a: Because Basic Law V requires every name to have two meanings.
x: Basic Law V concerns extensions of concepts, not the meaning of names.
a: Because the context principle forbids names from referring to objects at all.
x: The context principle says to ask for meaning within a proposition; it does not deny that names refer.
hint: Think of "Hesperus = Hesperus" and "Hesperus = Phosphorus".
why: Both statements concern one planet, yet one is a discovery; the difference must lie in the way the object is presented, its sense.
---
q: How does Russell's theory of descriptions show that "The present King of France is bald" is false?
a: It treats the sentence as neither true nor false, because its presupposition fails.
x: That is Strawson's objection to Russell, not Russell's view.
a: It says the phrase refers to a king who has being but does not exist.
x: That is roughly Meinong's view, which Russell's theory was designed to avoid.
a*: It analyses the sentence as claiming there is exactly one present King of France who is bald, and the existence claim is false.
a: It says the sentence is true, because the king wears a wig.
x: The wig is Russell's joke about Hegelians, not his analysis.
hint: Break "the F is G" into three claims.
why: On Russell's analysis the sentence asserts that there is a king, that there is only one, and that he is bald; the first claim is false, so the whole is false.
```

## Who Founded Analytic Philosophy?

What was founded, and when, is disputed. The usual story starts with the revolt against idealism in 1898. Michael Beaney argues that analytic philosophy "as it was founded by Frege and Russell" is characterised by logical analysis using the new logic: analytic as analytic geometry is, translating problems into a new notation, rather than taking things apart. He also notes analytic-style concerns in medieval scholasticism, in Bentham, and in the Navya-Nyāya school of early modern Indian philosophy (see *Logic across Traditions*). Dummett, by contrast, defined analytical philosophy by its "fundamental axiom": "the only route to the analysis of thought goes through the analysis of language". On that view the founder is Frege and the turn comes at *Grundlagen* §62. Beaney objects that Frege and Russell were hostile to ordinary language, and that the turn was properly taken only in Wittgenstein's *Tractatus* and by Rudolf Carnap, Frege's former student, in the early 1930s (see *Logical Positivism and Its Critics: the Vienna Circle, Popper and Quine*). Dummett also proposed that the tradition be called "Anglo-Austrian" rather than "Anglo-American", tracing roots to Bolzano, Brentano, Meinong and the early Husserl.

The cast was also wider than three men at Trinity. Constance Jones (1848–1922), logician and Mistress of Girton College, wrote *A New Law of Thought and its Logical Bearings* (1911) and was the first woman recorded as reading a paper to the Cambridge Moral Sciences Club (1899). Christine Ladd-Franklin studied logic with Peirce at Johns Hopkins, met the requirements for a doctorate and was refused it as a woman until 1926. Victoria, Lady Welby, a self-taught philosopher of language, developed a theory of meaning she called "significs" and corresponded with Peirce. Dorothy Wrinch studied logic with Russell and secured the first publication of the *Tractatus*, in German, in 1921. The French logician Jean Nicod derived classical propositional logic from a single axiom (1917) before dying at thirty. Ramsey translated the *Tractatus* as an undergraduate. Susan Stebbing (1885–1943) wrote *A Modern Introduction to Logic* (1930), in effect the first textbook of analytic philosophy, led the Cambridge School of Analysis, which treated Russell's theory of descriptions as "the paradigm of analysis", co-founded the journal *Analysis*, and in 1933 became the first woman in the United Kingdom appointed to a full professorship in philosophy.

```checkpoint
q: What did Russell's paradox show about Frege's Basic Law V?
a: That it was true but could not be proved.
x: That is closer to Gödel's later result about arithmetic; the paradox showed Law V leads to a contradiction.
a*: That it implies a contradiction, since it yields a class of all classes that are not members of themselves.
a: That it was needed only for geometry, not arithmetic.
x: Law V was meant to found arithmetic; geometry is not the issue.
a: That it confused the sense of a name with its reference.
x: Sense and reference belong to Frege's theory of meaning, not to Law V.
hint: Ask whether that class is a member of itself.
why: Law V guarantees a class for every concept; the class of non-self-membered classes is a member of itself if and only if it is not.
---
q: What is the "G. E. Moore shift"?
a: Moore's later move from ethics to the philosophy of language.
x: The phrase names a pattern of argument, not a change in Moore's interests.
a: Wittgenstein's claim that Moore's certainties are not knowledge.
x: That is Wittgenstein's objection in *On Certainty*, not the shift.
a: Crispin Wright's claim that justification fails to transmit.
x: Wright's transmission failure is an objection to Moore's proof.
a*: Turning the sceptic's argument round: since I know I have hands, the sceptic's premise must be false.
hint: The same premises can be read in either direction.
why: The term, coined by William Rowe, names Moore's strategy of judging it more reasonable to believe one has hands than to accept the sceptic's premise.
```

## Further exploration

- **Michael Potter, *The Rise of Analytic Philosophy, 1879–1930: From Frege to Ramsey* (2020).** A chapter-by-chapter history of the founding generation.
- **Anthony Kenny, *Frege* (1995).** A clear introduction to Frege's logic and philosophy.
- **Ray Monk, *Bertrand Russell: The Spirit of Solitude* (1996).** A biography of Russell up to 1921.
- **Thomas Baldwin, *G. E. Moore* (1990).** A study of Moore's philosophy as a whole.
- **Michael Dummett, *Origins of Analytical Philosophy* (1993).** The "linguistic turn" and "Anglo-Austrian" theses.
- **Siobhan Chapman, *Susan Stebbing and the Language of Common Sense* (2013).** Recovers Stebbing's life and work.
- **Michael Beaney (ed.), *The Oxford Handbook of the History of Analytic Philosophy* (2013).** The standard reference on the tradition's origins.$analytic_master$,
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
  select $analytic_quiz$[
    {"type": "mcq", "prompt": "What did Frege's Begriffsschrift (1879) introduce that the older subject–predicate logic lacked?", "options": ["An analysis of sentences into function and argument, with quantifiers such as \"for every x\" and \"there is an x\"", "The first proof that arithmetic is synthetic a priori", "The theory of descriptions", "The distinction between knowledge by acquaintance and knowledge by description"], "answerIndex": 0, "explanation": "Frege replaced subject and predicate with function and argument and invented quantificational logic; Peirce and his student O. H. Mitchell developed quantification independently in 1883–85.", "id": "q1"},
    {"type": "mcq", "prompt": "Why is the popular claim that Principia Mathematica takes hundreds of pages to prove 1 + 1 = 2 misleading?", "options": ["Because the proof appears on the first page of volume I", "Because Principia never mentions 1 + 1 = 2", "Because ✱54.43 in volume I says only that the result will follow once addition is defined; the proof is completed at ✱110.643 in volume II", "Because Gödel showed that 1 + 1 = 2 cannot be proved"], "answerIndex": 2, "explanation": "✱54.43 says the result \"will follow, when arithmetical addition has been defined\"; the proof is finished at ✱110.643 in volume II, with the remark \"The above proposition is occasionally useful.\"", "id": "q2"},
    {"type": "mcq", "prompt": "What was P. F. Strawson's main objection, in \"On Referring\" (1950), to Russell's analysis of \"The present King of France is bald\"?", "options": ["That the sentence is true, because it refers to a non-existent king", "That the sentence is false, but for a different reason", "That the sentence is meaningless", "That uttered now it is neither true nor false, because it presupposes, rather than asserts, that there is a king"], "answerIndex": 3, "explanation": "Strawson held that the sentence presupposes the existence of a king; when the presupposition fails, the question of truth does not arise. Meaning belongs to sentences, truth to uses of them.", "id": "q3"},
    {"type": "mcq", "prompt": "Which objection to Moore's \"Proof of an External World\" did Crispin Wright develop?", "options": ["That hands are not material objects", "That the justification for \"this is a hand\" fails to transmit to \"there is an external world\", so the proof begs the question", "That Moore's argument is invalid", "That Moore did not really have two hands"], "answerIndex": 1, "explanation": "Wright's \"transmission failure\" is a version of the charge that the proof begs the question: the premises count as known only if scepticism is already false.", "id": "q4"},
    {"type": "open", "prompt": "Set out Frege's argument for distinguishing sense from reference, step by step, using the Hesperus/Phosphorus example. Then explain Kripke's objections to descriptivist theories of names and at least one reply.", "rubric": "A strong answer gives the steps: 'a = a' is knowable by inspection while a true 'a = b' (Hesperus = Phosphorus) can be a discovery; if identity statements said only that an object is identical with itself, the two would say the same; they do not; so names have a sense (mode of presentation) as well as a reference (Venus). It may add belief contexts and that a sentence's sense is a thought and its reference a truth-value. It states Kripke's modal argument (names are rigid; 'the teacher of Plato might not have taught Plato'), epistemic argument (it is not a priori that Socrates taught Plato) and semantic argument (Feynman; chains of use), and at least one reply: rigidified descriptions, reference-fixing descriptions, community clusters, or Chalmers and Jackson's apriorist account. Credit noting that whether Frege himself was a descriptivist is debated.", "id": "q5"},
    {"type": "open", "prompt": "What is analytic philosophy, and when did it begin? Compare the answers of Beaney and Dummett, and say who the usual story of its founding leaves out.", "rubric": "A strong answer contrasts Beaney's view that analytic philosophy as founded by Frege and Russell is characterised by logical analysis using the new logic (analytic as analytic geometry is) with Dummett's 'fundamental axiom' that the analysis of thought goes through the analysis of language, with the linguistic turn at Grundlagen §62. It gives Beaney's objection that Frege and Russell were hostile to ordinary language and that the turn was properly taken in the Tractatus and by Carnap, mentions the usual story of Russell and Moore's revolt against idealism in 1898, and Dummett's 'Anglo-Austrian' roots (Bolzano, Brentano, Meinong, early Husserl). It names some of those often left out: Peirce and Mitchell, Constance Jones, Ladd-Franklin, Welby, Wrinch, Nicod, Ramsey, Stebbing.", "id": "q6"}
  ]$analytic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/history-of-philosophy/twentieth-century/birth-of-analytic-philosophy', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
