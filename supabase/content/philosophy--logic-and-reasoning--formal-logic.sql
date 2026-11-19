-- Formal Logic: Propositions, Predicates and Proofs — canonical master article, co-written and human-reviewed.
-- philosophy/logic-and-reasoning/formal-logic @ research/advanced/read.
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
    'philosophy/logic-and-reasoning/formal-logic',
    'research',
    'advanced',
    'read',
    $formallogic_master$> **Formal logic rewrites arguments in an artificial language so that their form can be checked by rule.** This chapter is a first course in it: the connectives and their truth tables, the truth-table test for validity, translation from English, quantifiers and predicates, identity and descriptions, and a short proof in natural deduction. It explains soundness, completeness, Gödel's incompleteness theorems and the undecidability result of Church and Turing; tells the story from Boole and De Morgan to Shannon's switching circuits; sets out three debates, over "if", excluded middle and whether rules define words; and ends with what classical logic leaves out.

## Why an Artificial Language?

*Arguments: Validity, Soundness and Form* gave the standard definition: "A deductive argument is said to be valid if and only if it takes a form that makes it impossible for the premises to be true and the conclusion nevertheless to be false." It also showed that grammar can hide form (a lame duck is not a duck). Formal logic builds languages in which grammatical and logical form coincide, so that validity can be tested by rule.

The simplest is **propositional logic**, which, in Kevin Klement's words, "studies ways of joining and/or modifying entire propositions, statements or sentences to form more complicated propositions". A simple statement ("It is raining") is treated as an indivisible unit, an **atomic sentence**, written P, Q and so on. Complex sentences are built with **connectives** such as "not", "and" and "if".

The key idea is **truth-functionality**: the truth value of the compound "always depend[s] entirely on the truth or falsity" of its parts. "And" passes: "P and Q" is true exactly when both parts are. "Necessarily" fails: "Someone is reading an article in a philosophy encyclopedia" may be true while "Necessarily, someone is reading an article in a philosophy encyclopedia" is false. Classical propositional logic uses only truth-functional connectives and two truth values; it is **bivalent**.

## Connectives and Truth Tables

The five standard connectives are negation ¬ ("not"), conjunction ∧ ("and"), disjunction ∨ ("or"), the conditional → ("if... then") and the biconditional ↔ ("if and only if"). In P → Q, P is the **antecedent** and Q the **consequent**. Negation reverses a value. The others are defined by a **truth table**, listing every combination of values for the parts (T for true, F for false):

| P | Q | P ∧ Q | P ∨ Q | P → Q | P ↔ Q |
|---|---|---|---|---|---|
| T | T | T | T | T | T |
| T | F | F | T | F | F |
| F | T | F | T | T | F |
| F | F | F | F | T | T |

A conjunction is true only when both parts are; a disjunction is false only when both are, so it is **inclusive**. The conditional is false only when the antecedent is true and the consequent false: the **material conditional**, the truth function the ancient logician Philo proposed (see *Hellenistic Philosophy: Stoics, Epicureans and Sceptics*). A biconditional is true when both sides agree.

Klement warns that the match with English is "really only rough", since English words "are not always used truth-functionally".

Brackets fix the **main connective**: P ↔ (Q ∧ R) is a biconditional, (P ↔ Q) ∧ R a conjunction, and they can differ in value. Notation varies: "&" or "·" for "and", "⊃" for the conditional, "≡" for the biconditional, "∼" for "not". Nor are five connectives needed. "Not" with "or" can express every truth function (A ∧ B is equivalent to ¬(¬A ∨ ¬B)), and in 1913 Henry Sheffer showed that one connective, "not both", suffices, rediscovering an unpublished observation of Charles Sanders Peirce.

## Tautologies and the Truth-Table Test

A **tautology**, in Klement's definition, is a formula "true for all possible truth-value assignments to the statement letters making it up"; P ∨ ¬P is the simplest. A formula false on every row, like P ∧ ¬P, is a **contradiction**; one that is neither is **contingent**. Two formulas are **equivalent** if they agree on every row.

This gives a test for validity. An argument is valid if no assignment makes all the premises true and the conclusion false, a propositional version of the definition by Stewart Shapiro and Teresa Kouri Kissel that *Arguments* quotes. So list the rows, find those where every premise is true, and check the conclusion there. Klement's example: premises P → Q and ¬Q → P; conclusion Q.

| P | Q | P → Q | ¬Q → P | Q |
|---|---|---|---|---|
| T | T | T | T | T |
| T | F | F | T | F |
| F | T | T | T | T |
| F | F | T | F | F |

Both premises are true only in rows one and three, and Q is true in both. As Klement puts it, "It is possible for the conclusion to be false, but only if one of the premises is false as well." Valid. The method also exposes invalid forms: for **affirming the consequent** (P → Q; Q; so P), the row P false, Q true makes both premises true and the conclusion false, a counterexample found by calculation.

An argument from A to B is valid exactly when A → B is a tautology: the arrow itself, as Curtis Franks stresses, expresses no implication; the claim that A → B is a tautology does.

Truth tables make propositional logic **decidable**: a mechanical procedure always settles, in finitely many steps, whether an argument is valid. But n letters need 2ⁿ rows; Klement's six-letter example needs 64 rows and 1,408 calculations.

## Translating English

Most errors happen in translation. **"Only if"** marks a necessary condition: "P only if Q" is P → Q, not Q → P. "You may vote only if you are registered" does not promise that registration lets you vote. **"Unless"**: textbooks render "P unless Q" as ¬Q → P, which the truth tables show equivalent to P ∨ Q. **"Or"**: ∨ is inclusive. A parent who says "Either we can buy the toy robot, or we can buy the toy truck; you must choose!" means "not both", written ¬(P ↔ Q). Whether English "or" is ambiguous, as Tarski suggested, or inclusive with an implied "not both", is disputed; the Stoics' "or" was exclusive. **"But"**: "Donovan is poor *but* happy" is true in exactly the circumstances in which "Donovan is poor and happy" is; "but" adds contrast, not truth conditions, so it becomes ∧. **"And" in time**: "He drank a bottle of vodka and fell into a stupor" suggests "and as a result", but P ∧ Q says the same as Q ∧ P.

## Is "If" the Material Conditional?

The material conditional, Dorothy Edgington writes, "does not strike students as obviously correct. It is logic's first surprise." *Arguments* described the oddities that follow from it. The prior question is whether the English indicative "if" really is this truth function. Edgington sets out the case for it:

1. "If A, B" is false when A is true and B false; otherwise modus ponens would be invalid.
2. Each of the other three combinations sometimes makes "If A, B" true: said of an unseen figure, "If it's a square, it has four sides" is true whether it is a square, a rectangle or a triangle.
3. Suppose "if" is truth-functional, so that the value of "If A, B" is fixed by the values of A and B.
4. Then "If A, B" is true in all three remaining combinations: it is the material conditional, of the sixteen truth functions of two sentences "the only serious candidate".

**The objection** targets step 3. On the material reading a false antecedent alone makes "If A, B" true. Does "She didn't touch the wire" entail "If she touched the wire, she got a shock"? Klement's pair: "If Bob Dole is president of the United States in 2004, then the president is a member of the Republican party" seems true, the same with Al Gore false, though both have a false antecedent and a true consequent. Even Frege, who built the material conditional into his logic in 1879, cautioned that "the causal connection implicit in the word 'if' ... is not expressed by our symbols" (Bynum's translation). Frank Ramsey suggested reading "If A, B" through the probability of B given A; in 1976 David Lewis proved that conditionals so understood are not even propositions. Edgington finds the oddities "harder to tolerate" outside mathematics.

**The reply** comes from Paul Grice's 1967 Harvard lectures, "Logic and Conversation". A statement can be true but misleading to assert. If I know my friend is in the pub, "He is either in the pub or in the library" is true but a poor thing to say. Likewise "If she touched the wire, she got a shock" is true when she did not, merely pointless to say. Defenders add that when we know A is false we have no use for "if A" thoughts, so intuition there is silent. Edgington judges Grice right about "or" but thinks compound conditionals tell against the material reading. The debate is open; *Analytic Philosophy since 1950* places Grice in his era.

```checkpoint
q: On a truth table, what shows the argument "P → Q; ¬Q → P; therefore Q" to be valid?
a*: Every row that makes both premises true also makes Q true.
a: The conclusion Q is true on every row.
x: Q is false on two rows; validity requires only that it be true on every row where all the premises are true.
a: The premises are true together on at least one row.
x: That shows only that the premises are consistent, not that they guarantee the conclusion.
a: P → Q is a tautology.
x: P → Q is false on one row; the test concerns premises and conclusion together.
hint: Look for a row with true premises and a false conclusion.
why: Valid means no assignment makes the premises true and the conclusion false. Both premises are true only where Q is true.
---
q: How should "You may vote only if you are registered" be translated, with V for "you may vote" and R for "you are registered"?
a: R → V
x: That says registration is enough for voting; "only if" introduces a necessary condition, not a sufficient one.
a: V ∧ R
x: The sentence does not assert that you may vote or that you are registered.
a*: V → R
a: V ∨ R
x: That would be true if you could vote while unregistered, which the sentence rules out.
hint: Which condition is necessary rather than sufficient?
why: "P only if Q" makes Q a necessary condition for P, so it is P → Q.
```

## Predicates and Quantifiers

Propositional logic cannot see inside sentences. "All humans are mortal; Socrates is human; so Socrates is mortal" has three different atoms, so its propositional form is just P; Q; so R, which is invalid. Its validity lies in "all" and "some", which Aristotle studied. **Predicate logic**, or first-order logic, adds them.

It has **names** (s for Socrates), **variables** (x, y), and **predicates**: Hx for "x is human", Lxy for the relation "x loves y". The **universal quantifier** ∀x reads "for all x", the **existential quantifier** ∃x "there is an x such that". A variable governed by a quantifier is **bound**, otherwise **free**; what a quantifier governs is its **scope**. The Socrates argument becomes ∀x(Hx → Mx), Hs, therefore Ms. Most modern texts translate Aristotle's four forms thus:

- Every S is P: ∀x(Sx → Px)
- No S is P: ∀x(Sx → ¬Px)
- Some S is P: ∃x(Sx ∧ Px)
- Some S is not P: ∃x(Sx ∧ ¬Px)

"All" goes with →, "some" with ∧. Swapping them is the commonest beginner's error: ∀x(Sx ∧ Px) says everything is both S and P, and ∃x(Sx → Px) is true as soon as anything is not S. In logic "some" means "at least one", compatible with "all"; that "John ate some of the cookies" suggests "not all" is a matter of conversation. And if there are no Ss, ∀x(Sx → Px) is "vacuously" true. Terence Parsons and Graziana Ciola note that this breaks much of the traditional square of opposition from *Aristotle*: "Every modern logic text must address the apparent implausibility of letting 'Every S is P' be true when there are no Ss." The usual defence is that the notation does not claim every nuance; add ∃xSx when existence is meant.

**Order matters.** ∀x∃yLxy says everyone loves someone (perhaps a different someone each); ∃y∀xLxy says someone is loved by everyone. The second entails the first, not conversely, and inferring the second from the first is the **quantifier-shift fallacy**: every person has a woman who is their mother, but no one woman is the mother of every person. *Thomas Aquinas* describes critics bringing this charge against his Third Way, and the reply.

## Identity and Descriptions

Identity, "=", is usually treated as logical, with two rules: everything is identical to itself, and if a = b, whatever is true of a is true of b. The second fails in **opaque contexts**: if Harry is Donald, "Dick knows that Harry is wicked" does not yield "Dick knows that Donald is wicked" (see *Meaning and Reference*). Identity lets logic say "exactly one". In Russell's 1905 analysis, "The F is G" becomes ∃x(Fx ∧ ∀y(Fy → x = y) ∧ Gx): something is F, nothing else is, and it is G. *Frege, Russell and the Birth of Analytic Philosophy* sets out the theory, its use of scope and Strawson's objection.

## Proofs: Natural Deduction

Truth tables cannot survey infinite domains, so logic also uses **proofs**, chains of steps each licensed by a rule. The most taught style, **natural deduction**, was devised independently by Gerhard Gentzen and Stanisław Jaśkowski. Jaśkowski, Jan Łukasiewicz's student, answered a problem Łukasiewicz set his Warsaw seminar in 1926, how to formalise the proof methods mathematicians actually use; he presented a version at the First Polish Mathematical Congress in 1927 and published in 1934. Gentzen's "Investigations into Logical Deduction", his Göttingen dissertation of 1933, appeared in 1934–35 and named the method:

```quote
"First I wished to construct a formalism that comes as close as possible to actual reasoning. Thus arose a 'calculus of natural deduction'."
Gerhard Gentzen · Investigations into Logical Deduction I (English as given by Wikipedia) · 1934–35
```

Its distinctive feature is the **subproof**, a temporary assumption made "for the sake of argument" and later discharged. Gentzen gave each connective an **introduction** rule and an **elimination** rule. Conditional elimination is modus ponens. Conditional introduction: if Q can be derived from the assumption P, conclude P → Q and drop the assumption. Negation introduction: if an assumption P leads to both Q and ¬Q, conclude ¬P. Classical logic also needs double-negation elimination (from ¬¬P infer P) or excluded middle. A proof that modus tollens follows from these rules:

1. P → Q (premise)
2. ¬Q (premise)
3. P (assumption, for the sake of argument)
4. Q (from 1 and 3, conditional elimination)
5. ¬Q (repeating 2)
6. ¬P (from 3–5, negation introduction; the assumption is discharged)

The quantifier rules mirror the mathematician's "let n be any number": a conclusion about an "arbitrary" individual, named in no premise, holds for all. Gentzen drew proofs as trees; elementary textbooks prefer the vertical-line layout Fitch popularised in 1952.

**Truth trees**, or semantic tableaux, work by refutation: start from the premises plus the denial of the conclusion and break formulas into parts along branches. A branch "closes" when it contains a formula and its negation; if all close, the argument is valid. Evert Beth, Jaakko Hintikka and Stig Kanger invented them independently; Raymond Smullyan simplified them in 1968.

## Do the Rules Define the Words?

Gentzen treated introduction rules as "a kind of definition" of each connective. Generalised, and linked to Wittgenstein's idea of meaning as use, this gives an argument:

1. A logical word is brought into proofs by its introduction rule and used by its elimination rule.
2. Nothing more is needed to fix its role in inference.
3. So its rules fix its meaning.

**The objection** is Prior's "tonk" (1960). Give tonk an introduction rule like that for "or" (from P infer P tonk Q) and an elimination rule like that for "and" (from P tonk Q infer Q). Then from any P one reaches any Q. Not every pair of rules defines a meaning.

**The reply**, from Belnap in 1962, is that rules must be "noncreative": a new word must not let you prove anything new in the old vocabulary, as tonk does. The general name for the required fit between the rules is **harmony**. Andrzej Indrzejczak reports that Belnap's condition is not thought sufficient, and the search continues.

## Soundness, Completeness and Their Limits

A proof system is **sound** if everything it derives is valid, and **complete** if every valid argument is derivable. (This "sound" describes a system; a sound *argument*, as *Arguments* notes, is a valid one with true premises.) Emil Post's 1921 doctoral work proved the propositional calculus of *Principia Mathematica* complete. Hilbert and Ackermann's 1928 textbook asked whether first-order logic is; Kurt Gödel proved it in his 1929 dissertation, published 1930. Two "vastly different conceptions of logicality", provability and validity, coincide.

Gödel's 1931 incompleteness theorems concern something else: formal theories rich enough for elementary arithmetic. Any consistent such system F has statements that "can neither be proved nor disproved in F", and F cannot prove its own consistency. Panu Raatikainen warns: "A common misunderstanding is to interpret Gödel's first theorem as showing that there are truths that cannot be proved." The theorem concerns derivability in a given formal system, not provability in any absolute sense. Gödel was trying to advance Hilbert's programme, not undermine it.

Completeness does not bring decidability. Hilbert and Ackermann called the search for a mechanical test of first-order validity, the *Entscheidungsproblem*, "the main problem of mathematical logic". In 1936 Alonzo Church and Turing independently showed it unsolvable, Turing by analysing computing machines. If an argument is valid, a systematic search will find a proof; but no procedure can always answer "invalid". Leibniz's dream of settling disputes by calculation (see *Leibniz*) has a precise limit. First-order logic also cannot pin down the natural numbers or express "finite".

```checkpoint
q: Which statement about Gödel's results is accurate?
a: The completeness theorem shows that every true statement of arithmetic can be proved.
x: Completeness concerns first-order logic: every valid argument is derivable. It says nothing about arithmetic truths.
a*: The first incompleteness theorem shows that any consistent formal system containing enough arithmetic has statements it can neither prove nor disprove.
a: The incompleteness theorem shows that there are truths that cannot be proved by any means.
x: Raatikainen calls this a common misunderstanding; the theorem concerns derivability in a given formal system.
a: Gödel showed that first-order logic is undecidable.
x: Church and Turing showed that, in 1936.
hint: Distinguish a logic from a formal theory of arithmetic.
why: Completeness (1929–30) is about logic; incompleteness (1931) is about formal theories of arithmetic, relative to each system.
---
q: Why does "tonk" threaten the idea that inference rules define logical words?
a: Because its rules are too weak to derive anything.
x: The problem is the opposite: its rules let anything be derived.
a: Because Gentzen rejected introduction rules.
x: Gentzen treated introduction rules as a kind of definition; tonk exploits that idea.
a: Because it is not truth-functional.
x: The argument is about proof rules, not truth tables.
a*: Because a word with an or-like introduction rule and an and-like elimination rule lets any statement be derived from any other.
hint: Chain the two rules together.
why: From P, tonk-introduction gives P tonk Q and tonk-elimination gives Q. Belnap replied that rules must be noncreative, in harmony.
```

## A Short History

"The modern study of logic is commonly dated to 1847, with the appearance of Boole's *Mathematical Analysis of Logic*," writes William Ewald. George Boole, a shoemaker's son from Lincoln, became the first professor of mathematics at Queen's College, Cork, in 1849. He applied symbolic algebra to logic, letters standing for classes; read 1 as "true" and 0 as "false" and it becomes a propositional logic. Today's "Boolean algebra" is not quite his: Boole's addition applied only to classes with no common members, and the inclusive version taught now is essentially Jevons's of 1864, which Boole rejected.

{{image: George Boole | George Boole, from *The Illustrated London News*, 21 January 1865. His *Mathematical Analysis of Logic* (1847) is commonly taken to mark the start of modern logic.}}

Boole's stimulus was a public dispute in 1847 between Augustus De Morgan and the Scottish philosopher Sir William Hamilton. De Morgan, born in Madurai in India, published *Formal Logic* the same year (some say on the same day as Boole's book), stating the laws that bear his name: "not (A or B)" equals "not A and not B". He also began the logic of relations.

Modern logic needed relations and notation for "all" and "some". Gottlob Frege, "working entirely independently", supplied both in his *Begriffsschrift* of 1879. Peirce reached quantifiers in 1883–85 with his student O. H. Mitchell (see *American Pragmatism: Peirce, James and Dewey*), and his 1885 paper made the first explicit use of two truth values:

```quote
"[T]o find whether a formula is necessarily true substitute f and v for the letters and see whether it can be supposed false by any such assignment of values."
C. S. Peirce · "On the Algebra of Logic" · 1885
```

Another Peirce student, Christine Ladd, published "On the Algebra of Logic" in his *Studies in Logic* (1883); she completed every requirement for a doctorate but, as a woman, was refused it until 1926. Truth tables are implicit in Peirce and others, explicit in Eugen Müller by 1909, and were popularised in 1921 by Post and by Wittgenstein's *Tractatus* (see *Wittgenstein*). Peano (1889) introduced ∃ and a reversed C for "if", which Russell turned into ⊃ in *Principia Mathematica* (1910–13); Gentzen first printed ∀. Łukasiewicz "came upon the idea of a parenthesis-free notation in 1924", by his own account: "Polish notation", operators before operands, later used in computing.

Logic then met engineering. Claude Shannon's MIT master's thesis, written in 1937 and published in 1938, showed that Boolean algebra could describe the relay circuits of telephone exchanges, "and" corresponding to switches in series and "or" to switches in parallel. Shannon was not alone: Akira Nakashima in Japan independently introduced switching-circuit theory in papers of 1934–36, and Victor Shestakov in Moscow found the Boolean interpretation in 1935, though he first published, in Russian, in 1941.

## What Classical Logic Leaves Out

Classical logic is bivalent, truth-functional and explosive: from a contradiction anything follows. Each feature has been challenged.

**Modal logic** adds the non-truth-functional "necessarily" (□) and "possibly" (◇). C. I. Lewis began its systematic study in 1912 and 1913 with "strict implication", which requires that A and not-B *cannot* hold together. Ruth Barcan (later Barcan Marcus) published the first axiomatic systems of quantified modal logic in 1946 and 1947. The dominant semantics treats necessity as truth in every accessible "possible world"; it is often credited to Saul Kripke's papers of 1959 and 1963, but Kanger published similar ideas in 1957, and the origins are still discussed. See *Possibility and Necessity*.

**Many-valued logic** drops bivalence. Łukasiewicz, troubled by future contingents such as Aristotle's sea battle, worked out a three-valued logic from about 1917 and published it in 1920; Post followed in 1921. Such logics are now applied to vagueness, a theme of *Paradoxes: the Liar, the Heap and Zeno*.

**Intuitionistic logic** grew from L. E. J. Brouwer's mathematics from 1907 and was formalised by Arend Heyting in 1930. Brouwer's case against excluded middle:

1. To assert "A or B" is to have a proof of A or a proof of B, or a method for getting one.
2. Let A be the twin primes conjecture: that beyond every number there is a pair of primes differing by two. We have neither proof nor refutation, nor a method for finding one.
3. So we cannot now assert "A or not A".
4. So excluded middle is not a universal law; it "was abstracted from finite situations, then extended without justification to statements about infinite collections".

**The objection** is that this confuses truth with knowledge: on the classical, realist view every meaningful statement is true or false whether or not anyone can prove it, and the example leans on a problem that might yet be solved. **The reply** is that the point is general, about what we may assert concerning infinite collections, not about one open problem; and that meaning may itself rest on proof rather than proof-independent truth, the anti-realism Dummett developed. Intuitionists therefore reject double-negation elimination.

**Paraconsistent logic** rejects explosion. *Arguments* introduced relevance logic; the wider family was named by Francisco Miró Quesada at the Third Latin American Conference on Mathematical Logic in 1976. Jaśkowski built the first formal system in 1948; independently, Florencio Asenjo (in a 1954 dissertation) and Newton da Costa (from 1963) developed such logics in South America (see *Latin American Philosophy and the Philosophy of Liberation*). Priest, Tanaka and Weber add that the Buddhist logicians Dignāga and Dharmakīrti (see *Mahāyāna Philosophy: Nāgārjuna, Yogācāra and Buddhist Logic*) "do not embrace" explosion, while cautioning that categorical claims about such principles are difficult in that context; *Logic across Traditions* compares the traditions.

Finally, meaning outruns truth conditions. Grice's **implicatures** explain why "but" signals contrast, "some" suggests "not all" and "or" suggests "not both", without altering the truth-functional core. Logic captures what a sentence commits its speaker to, not everything it conveys.

## Further exploration

- **Peter Smith, *An Introduction to Formal Logic* (2003).** A clear first textbook; the first edition uses truth trees, the second (2020) natural deduction.
- **Susan Haack, *Philosophy of Logics* (1978).** What formal logic captures, and the case for and against its rivals.
- **Graham Priest, *An Introduction to Non-Classical Logic* (2001).** A tableau-based survey of modal, intuitionistic, many-valued, relevant and paraconsistent logics; the second edition (2008) is subtitled *From If to Is*.
- **Ernest Nagel and James R. Newman, *Gödel's Proof* (1958).** The classic short exposition of the incompleteness theorems.
- **Rebecca Goldstein, *Incompleteness: The Proof and Paradox of Kurt Gödel* (2005).** Biography and philosophical exposition; Solomon Feferman's review questioned its reading of the young Gödel.
- **Apostolos Doxiadis and Christos H. Papadimitriou, *Logicomix: An Epic Search for Truth* (2009).** A graphic novel about Russell and the foundations of logic; the authors admit inventing some meetings.
- **Bimal Krishna Matilal, *The Character of Logic in India* (1998).** Indian logic from the rules of debate through Dignāga, Dharmakīrti, the Jainas and Navya-Nyāya.$formallogic_master$,
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
  select $formallogic_quiz$[
    {"type": "mcq", "prompt": "Which English sentence is correctly translated as P → Q?", "options": ["P only if Q", "P if Q", "P unless Q", "P but Q"], "answerIndex": 0, "explanation": "\"P only if Q\" makes Q a necessary condition for P, so it is P → Q. \"P if Q\" is Q → P; \"P unless Q\" is usually rendered ¬Q → P (equivalently P ∨ Q); \"but\" translates as ∧.", "id": "q1"},
    {"type": "mcq", "prompt": "What is wrong with translating \"Every S is P\" as ∀x(Sx ∧ Px)?", "options": ["Nothing; it is the standard translation", "It uses the wrong quantifier", "It says that everything is both S and P", "It cannot be true if there are no Ss"], "answerIndex": 2, "explanation": "Most modern texts translate \"Every S is P\" as ∀x(Sx → Px). With ∧ the formula says that everything whatever is both S and P. \"All\" goes with →, \"some\" with ∧.", "id": "q2"},
    {"type": "mcq", "prompt": "Which pair independently devised natural deduction, published in 1934–35?", "options": ["Boole and De Morgan", "Church and Turing", "Beth and Smullyan", "Gentzen and Jaśkowski"], "answerIndex": 3, "explanation": "Gentzen (Göttingen dissertation of 1933, published 1934–35) and Jaśkowski (presented 1927, published 1934) independently devised natural deduction. Church and Turing proved the Entscheidungsproblem unsolvable; Beth and Smullyan are associated with tableaux.", "id": "q3"},
    {"type": "mcq", "prompt": "What did Church and Turing independently show in 1936?", "options": ["That first-order logic is complete", "That there is no mechanical procedure for deciding whether any given first-order formula is valid", "That propositional logic is undecidable", "That every truth of arithmetic is provable"], "answerIndex": 1, "explanation": "They showed the Entscheidungsproblem unsolvable for first-order logic. Completeness was Gödel's (1929–30); propositional logic is decidable by truth tables; and Gödel's 1931 theorems show that formal systems for arithmetic are incomplete.", "id": "q4"},
    {"type": "open", "prompt": "Set out the argument that the English indicative \"if\" is the material conditional, then give the strongest objection and Grice's reply.", "rubric": "A good answer gives the steps: the true-antecedent, false-consequent case must be false (or modus ponens fails); each other combination is sometimes true (the unseen square); if \"if\" is truth-functional it must therefore be true in all three, the only serious candidate among sixteen truth functions. Objection: a false antecedent alone would make the conditional true (the wire example, or Klement's Dole/Gore pair); Frege's caution about the causal sense; Ramsey's conditional-probability view and Lewis's 1976 result; Edgington finds the oddities harder to tolerate outside mathematics. Reply: Grice (1967) distinguishes truth from appropriate assertion; such conditionals are true but pointless or misleading, like the pub-or-library disjunction. Credit noting that the debate remains open.", "id": "q5"},
    {"type": "open", "prompt": "Explain the difference between Gödel's completeness theorem and his first incompleteness theorem, and why it is wrong to say that Gödel showed \"there are truths that cannot be proved\".", "rubric": "A good answer says that completeness (1929 dissertation, published 1930) concerns first-order logic: every valid argument is derivable, so provability and validity coincide. Incompleteness (1931) concerns consistent formal systems containing enough elementary arithmetic: each has statements it can neither prove nor disprove, and cannot prove its own consistency. The popular formula is wrong, as Raatikainen warns, because the theorem concerns derivability in a given formal system, not provability in any absolute sense. Credit mentioning that completeness does not give decidability (Church and Turing, 1936).", "id": "q6"}
  ]$formallogic_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'philosophy/logic-and-reasoning/formal-logic', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
