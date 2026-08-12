-- Mathematics · Pre-Calculus Foundations — Arithmetic & Foundations —
-- "Number Systems".
-- Curated master for
-- mathematics/pre-calculus-foundations/arithmetic-and-foundations/number-systems
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The first lecture of the mathematics tree. Organised around a single
-- driving question - what operations can you perform without leaving
-- the system you started in? - which is asked of N, then Z, then Q,
-- then R, and answered each time by the failure that forces the next
-- enlargement. Everything is proved that can be proved at this level:
-- the Euclidean algorithm run out in full, the terminate-or-repeat
-- theorem by the pigeonhole argument on remainders, the irrationality
-- of sqrt 2 by parity with the explicit note of where the same proof
-- fails for sqrt 4, 0.999... = 1 by three independent arguments, and
-- Cantor's diagonal argument sketched. The Fundamental Theorem of
-- Arithmetic, the completeness axiom, the transcendence of pi and e,
-- and the Fundamental Theorem of Algebra are stated without proof and
-- flagged as such.
--
-- Ends on interval and absolute-value notation, since |x - a| < d as a
-- statement about distance is the notation every later lecture uses.
-- ~10,000 words, 10 checkpoint questions, 9 worked problems, 2 figures.
--
-- Numbers verified before drafting (python3, exact where integral):
--   360 = 2^3 x 3^2 x 5, with 4 x 3 x 2 = 24 divisors;
--   gcd(1071, 462) = 21 by Euclid: 1071 = 2(462) + 147, 462 = 3(147)
--     + 21, 147 = 7(21) + 0;
--   gcd(12,18) = 6 and lcm(12,18) = 36, with 6 x 36 = 12 x 18;
--   decimal periods: 1/3 -> 0.333... period 1; 1/6 -> 0.1666... period
--     1 with one non-repeating digit; 1/7 -> 0.142857... period 6;
--     1/8 -> 0.125 terminating; 1/11 -> 0.0909... period 2;
--     1/13 period 6; 1/17 period 16; 1/97 period 96; 1/101 period 4;
--   0.363636... = 36/99 = 4/11; 0.1252525... = 124/990 = 62/495
--     = 0.125252525...;
--   sqrt 2 = 1.41421356237, and the double nearest it squares to
--     2.0000000000000004, not 2;
--   golden ratio (1+sqrt5)/2 = 1.6180339887, satisfying x^2 - x - 1 = 0
--     to double precision exactly;
--   pi = 3.141592653589793, e = 2.718281828459045;
--   22/7 = 3.142857143, error +1.264e-3; 355/113 = 3.1415929204,
--     error +2.668e-7;
--   Euclid's construction: 2x3x5x7x11 + 1 = 2311, prime; but
--     2x3x5x7x11x13 + 1 = 30031 = 59 x 509, composite - the standard
--     misreading of the proof, checked explicitly;
--   504 = 2^3 x 3^2 x 7 with 24 divisors, gcd(504,360) = 72,
--     lcm(504,360) = 2520, product 181440 both ways (practice problem 2);
--   1071/462 = 51/22 in lowest terms (practice problem 3);
--   2.4444... = 22/9 (practice problem 5c);
--   1/(3+2i) = 3/13 - (2/13)i = 0.230769 - 0.153846 i.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'mathematics/pre-calculus-foundations/arithmetic-and-foundations/number-systems',
    'research','advanced','read',
    $preNum_master$> Mathematics did not begin with one kind of number and stay there. Each system in use today — the counting numbers, the integers, the rationals, the reals, the complex numbers — was forced into existence by an operation that the previous system could not perform. Learning what each one is means learning which question it was built to answer, and which question defeated it.

This is the first lecture in the mathematics sequence, and it has one organising question: **what can you do without leaving the system you are in?** Add two counting numbers and you get a counting number. Subtract them and you may not. That single failure creates the integers. Divide two integers and you may leave $\mathbb{Z}$; that failure creates the rationals. Measure the diagonal of a square and you leave $\mathbb{Q}$; that failure creates the reals. The chain is not historical decoration. It is the logical structure of the subject, and every later lecture — every equation solved, every limit taken — happens inside one of these systems and depends on knowing which operations are safe there.

Nothing is assumed beyond arithmetic. Every proof given is complete; the four results too hard to prove at this level are stated as such and flagged.

## 1. Counting, and the first system

### 1.1 The natural numbers

The **natural numbers** are what counting produces:

$$\mathbb{N} = \{1, 2, 3, 4, 5, \ldots\}.$$

(Some authors include $0$. Nothing here depends on the choice; where it matters we will say so.) They are the oldest mathematical objects, and they support two operations without difficulty. Add two natural numbers and the answer is a natural number. Multiply two and the answer is a natural number. There is no exception, no special case, no pair for which the operation fails.

### 1.2 Closure — the question that drives everything

That property has a name.

> **Definition.** A set $S$ is **closed** under an operation if performing that operation on any members of $S$ produces a result that is again in $S$.

So $\mathbb{N}$ is closed under addition and closed under multiplication. Closure is not a technicality to be memorised. It is the exact statement of "this operation is always safe here", and the whole architecture of number systems is the record of which operations were not safe and what was built to make them so.

Three further properties of addition and multiplication on $\mathbb{N}$ are worth naming, because they will be assumed silently forever afterwards. For all $a, b, c$:

- **commutativity:** $a + b = b + a$ and $ab = ba$;
- **associativity:** $(a+b)+c = a+(b+c)$ and $(ab)c = a(bc)$;
- **distributivity:** $a(b+c) = ab + ac$.

Distributivity is the one that does real work later — it is the rule behind expanding brackets, factoring, and the whole of elementary algebra.

### 1.3 Subtraction breaks it

Now ask about subtraction. $5 - 3 = 2$, a natural number. But $3 - 5$ is not a natural number at all. Within $\mathbb{N}$, the equation

$$x + 5 = 3$$

has no solution. Nor does $x + 1 = 1$, if $0$ is excluded.

There are two possible responses. One is to declare such equations meaningless — which is broadly what mathematics did for centuries, and negative answers were dismissed as absurd well into the seventeenth century. The other is to enlarge the system so that the equations acquire solutions. The second response is the productive one, and it is the move that gets repeated at every stage below.

## 2. The integers

### 2.1 What $\mathbb{Z}$ fixes

The **integers** are the naturals, their negatives, and zero:

$$\mathbb{Z} = \{\ldots, -3, -2, -1, 0, 1, 2, 3, \ldots\}.$$

The letter is from the German *Zahlen*. In $\mathbb{Z}$ the equation $x + a = b$ has a solution for every choice of $a$ and $b$, namely $x = b - a$. So:

> $\mathbb{Z}$ is closed under addition, subtraction and multiplication.

Two structural elements make this work, and both are worth naming because they generalise. $0$ is the **additive identity**: $a + 0 = a$ for every $a$. And every $a$ has an **additive inverse** $-a$ with $a + (-a) = 0$. Subtraction is not really a new operation at all — $a - b$ is defined as $a + (-b)$ — which is why closure under subtraction comes free once inverses exist.

### 2.2 Divisibility and primes

Inside $\mathbb{Z}$ a rich structure appears that has no analogue in the larger systems to come.

> **Definition.** For integers $a$ and $b$ with $a \ne 0$, we say $a$ **divides** $b$, written $a \mid b$, if there is an integer $k$ with $b = ak$.

So $3 \mid 12$ (take $k=4$) but $3 \nmid 13$. Divisibility is a genuinely restrictive relation in $\mathbb{Z}$; note in advance that once we reach $\mathbb{Q}$ it collapses entirely, since every non-zero rational divides every other.

> **Definition.** An integer $p > 1$ is **prime** if its only positive divisors are $1$ and $p$. An integer $n > 1$ that is not prime is **composite**.

The first primes are $2, 3, 5, 7, 11, 13, 17, 19, 23, 29$. Two conventions cause trouble and are worth settling now. $1$ is *not* prime — the reason is in section 2.3. And $2$ *is* prime, the only even prime, which is exactly why it plays the starring role in the irrationality proof of section 4.

### 2.3 The Fundamental Theorem of Arithmetic

> **Theorem (stated without proof).** Every integer $n > 1$ can be written as a product of primes, and that factorisation is unique apart from the order of the factors.

For example,

$$360 = 2\cdot2\cdot2\cdot3\cdot3\cdot5 = 2^3\cdot3^2\cdot5,$$

and no other multiset of primes multiplies to $360$. The theorem is the reason $1$ is excluded from the primes: if $1$ counted as prime, then $360 = 1\cdot2^3\cdot3^2\cdot5 = 1^2\cdot2^3\cdot3^2\cdot5$ and uniqueness would fail immediately. The definition is chosen to make the theorem true.

Prime factorisation answers questions that look unrelated. The number of positive divisors of $360$, for instance, is obtained by choosing an exponent for each prime independently: the exponent of $2$ can be $0,1,2$ or $3$; of $3$ can be $0,1$ or $2$; of $5$ can be $0$ or $1$. That gives

$$4\times3\times2 = 24$$

divisors, and they can be listed without hunting: $1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 18, 20, 24, 30, 36, 40, 45, 60, 72, 90, 120, 180, 360$ — twenty-four of them, as promised.

Factorisation also gives the **greatest common divisor** and **least common multiple**: take each prime to the smaller exponent for the gcd, the larger for the lcm. With $12 = 2^2\cdot3$ and $18 = 2\cdot3^2$,

$$\gcd(12,18) = 2^1 3^1 = 6, \qquad \operatorname{lcm}(12,18) = 2^2 3^2 = 36,$$

and note $6 \times 36 = 216 = 12\times18$, which is a general identity: $\gcd(a,b)\cdot\operatorname{lcm}(a,b) = ab$.

One further question about primes can be settled completely, and its answer is the oldest surviving non-trivial proof in mathematics.

> **Theorem (Euclid).** There are infinitely many primes.

*Proof.* Suppose there were only finitely many, say $p_1, p_2, \ldots, p_n$, a complete list. Form

$$N = p_1p_2\cdots p_n + 1.$$

$N$ is greater than $1$, so by the Fundamental Theorem it has some prime factor $p$. Since the list is complete, $p$ must be one of the $p_i$, and therefore $p$ divides the product $p_1p_2\cdots p_n$. But $p$ also divides $N$. So $p$ divides the difference

$$N - p_1p_2\cdots p_n = 1,$$

which is impossible for a prime, since primes exceed $1$. The list cannot have been complete. $\blacksquare$

A common misreading is worth heading off: the proof does not claim $N$ is prime. With the first five primes, $2\cdot3\cdot5\cdot7\cdot11 + 1 = 2311$, which happens to be prime; but $2\cdot3\cdot5\cdot7\cdot11\cdot13 + 1 = 30031 = 59\times509$, which is not. The argument only needs $N$ to have *some* prime factor, and that factor to be missing from the supposed complete list.

### 2.4 Division with remainder

Division fails in $\mathbb{Z}$, but a weakened version of it succeeds always, and that weakened version turns out to be one of the most useful facts in elementary mathematics.

> **The division algorithm.** Given integers $a$ and $b$ with $b > 0$, there exist **unique** integers $q$ and $r$ with
> $$a = qb + r, \qquad 0 \le r < b.$$
> $q$ is the **quotient** and $r$ the **remainder**.

For $a = 47$, $b = 7$: $47 = 6\cdot7 + 5$, so $q = 6$ and $r = 5$. The uniqueness clause is doing work — it is what allows one to speak of *the* remainder. Note the requirement $0 \le r < b$ handles negatives in a way that sometimes surprises: for $a = -47$, $b = 7$, the answer is $-47 = (-7)\cdot7 + 2$, with $q = -7$ and $r = 2$, not $q = -6$ and $r = -5$, because the remainder is required to be non-negative.

Two consequences are used immediately. **Parity** is the case $b = 2$: every integer leaves remainder $0$ or $1$, so every integer is even or odd and not both. That is exactly the dichotomy the irrationality proof of section 4.2 exploits. And the **Euclidean algorithm** of the next section is nothing but the division algorithm applied over and over.

A third consequence arrives in section 3.3. Long division of $a$ by $b$ generates a sequence of remainders, each in $\{0, 1, \ldots, b-1\}$, and the whole terminate-or-repeat theorem about decimals is a statement about that sequence being confined to a finite set.

### 2.5 The Euclidean algorithm

Factorising is hopeless for large numbers — the difficulty of factorising is what modern cryptography rests on — but the gcd can be found without it. Repeatedly replace the larger number by its remainder on division by the smaller. Take $\gcd(1071, 462)$:

$$1071 = 2\cdot462 + 147$$
$$462 = 3\cdot147 + 21$$
$$147 = 7\cdot21 + 0$$

The last non-zero remainder is $21$, and $\gcd(1071,462) = 21$. Check it: $1071 = 21\cdot51$ and $462 = 21\cdot22$, and $\gcd(51,22)=1$.

Why it works: any common divisor of $a$ and $b$ also divides $a - qb$, and any common divisor of $b$ and $a - qb$ also divides $a$. So each line preserves the set of common divisors exactly, while the numbers strictly shrink. Since a strictly decreasing sequence of non-negative integers must terminate, the process ends, and it ends at the gcd. The algorithm is over two thousand years old and is still the one used in practice.

This is also the tool for reducing fractions to lowest terms, which is section 3's business.

### 2.6 Division still breaks it

$\mathbb{Z}$ is closed under three operations but not the fourth. $6 \div 3 = 2$ is fine; $3 \div 6$ is not an integer. The equation

$$6x = 3$$

has no solution in $\mathbb{Z}$. The same move as before is required: enlarge.

```checkpoint
q: Which statement about closure is correct?
a*: $\mathbb{N}$ is closed under addition and multiplication but not subtraction.
a: $\mathbb{N}$ is closed under all four arithmetic operations.
x: Both subtraction and division escape $\mathbb{N}$: $3-5 = -2$ is not a natural number, and $3\div5$ is not one either. Closure means *every* pair works, so a single counterexample settles it.
a: $\mathbb{Z}$ is closed under division.
x: $\mathbb{Z}$ is closed under addition, subtraction and multiplication, but $3 \div 6 = 0.5$ is not an integer. This exact failure is what forces the construction of $\mathbb{Q}$.
a: $\mathbb{N}$ is closed under subtraction because $5-3 = 2$.
x: One successful example does not establish closure — closure is a universal claim about all pairs. The pair $(3,5)$ refutes it, since $3-5$ is not in $\mathbb{N}$.
hint: Closure requires the operation to succeed for *every* pair drawn from the set, with no exceptions.
why: $\mathbb{N}$ is closed under $+$ and $\times$ because sums and products of counting numbers are counting numbers. It fails for subtraction ($3-5$) and for division ($3\div5$). Each failure is what motivates the next enlargement: subtraction gives $\mathbb{Z}$, division gives $\mathbb{Q}$.

---

q: Why is $1$ excluded from the primes?
a*: Because including it would destroy the uniqueness of prime factorisation.
a: Because $1$ is too small to be interesting.
x: Definitions in mathematics are not chosen by interest but to make theorems true. $2$ is small and is prime; size is not the criterion.
a: Because $1$ has no divisors.
x: $1$ does have a divisor, namely $1$ itself. It fails the definition of prime for a different reason — a prime is required to have *exactly two* distinct positive divisors, and $1$ has only one.
a: Because $1$ is neither even nor odd.
x: $1$ is odd — it leaves remainder $1$ on division by $2$. Parity has nothing to do with the exclusion.
hint: State the Fundamental Theorem of Arithmetic and then test it with $1$ admitted as a prime.
why: The Fundamental Theorem says every integer above $1$ factors into primes uniquely up to order. If $1$ were prime, $360 = 2^3 3^2 5 = 1\cdot 2^3 3^2 5 = 1^{17}\cdot 2^3 3^2 5$, giving infinitely many distinct factorisations. Excluding $1$ is what makes the uniqueness clause true.

---

q: Apply the Euclidean algorithm to find $\gcd(1071, 462)$.
a*: $21$
a: $3$
x: $3$ is a common divisor — both numbers are divisible by $3$ — but not the greatest one. The algorithm terminates at the last non-zero remainder, which here is $21$, and $21 = 3\times 7$ is a larger common divisor.
a: $7$
x: $7$ divides both, but again is not greatest. Note $21 = 3\times7$ divides both as well, and $1071/21 = 51$, $462/21 = 22$ with $\gcd(51,22)=1$, confirming $21$ is maximal.
a: $147$
x: $147$ is the first remainder in the algorithm, not the answer. The algorithm continues until a remainder of $0$ appears, and the gcd is the *last non-zero* remainder. Also $147 \nmid 462$, since $462 = 3\cdot147 + 21$.
hint: Divide, keep the remainder, repeat; stop when the remainder is zero.
why: $1071 = 2(462) + 147$; $462 = 3(147) + 21$; $147 = 7(21) + 0$. The last non-zero remainder is $21$. Each step preserves the set of common divisors while shrinking the numbers, so the process must terminate and must terminate at the gcd.
```

## 3. The rationals

### 3.1 Definition and equality

> **Definition.** A **rational number** is one expressible as $\dfrac{a}{b}$ with $a, b \in \mathbb{Z}$ and $b \ne 0$. The set is written $\mathbb{Q}$ (for *quotient*).

The exclusion $b \ne 0$ is absolute and is not a convention that could have gone otherwise. If $a \ne 0$, then $a/0 = c$ would require $a = 0\cdot c = 0$, a contradiction. If $a = 0$, then $0/0 = c$ would be satisfied by *every* $c$, so the symbol names nothing in particular. Division by zero is not forbidden by decree; there is simply no number that could be the answer, and in the second case no unique one. (The indeterminate form $0/0$ of the calculus is a different matter entirely: there the numerator and denominator are *approaching* zero, and the limit may well exist. Nothing is ever divided by zero.)

Different fractions name the same rational number:

$$\frac{a}{b} = \frac{c}{d} \iff ad = bc.$$

So $\tfrac{2}{3} = \tfrac{4}{6} = \tfrac{-6}{-9}$. Each rational has exactly one representation in **lowest terms** — with $\gcd(a,b) = 1$ and $b > 0$ — obtained by dividing out the gcd, which is what section 2.5 computes. Every integer is rational, via $n = n/1$, so $\mathbb{N}\subset\mathbb{Z}\subset\mathbb{Q}$.

### 3.2 Arithmetic, and what $\mathbb{Q}$ finally achieves

The four operations are defined by the familiar rules

$$\frac ab + \frac cd = \frac{ad+bc}{bd},\qquad \frac ab \cdot \frac cd = \frac{ac}{bd},\qquad \frac ab \div \frac cd = \frac{ad}{bc}\ (c \ne 0),$$

and each output is again a ratio of integers with non-zero denominator. Therefore:

> $\mathbb{Q}$ is closed under addition, subtraction, multiplication, and division by anything other than zero.

This is a genuine milestone. A system with two operations, both associative and commutative, with identities ($0$ and $1$), with inverses for both (negatives, and reciprocals for non-zero elements), and with distributivity linking them, is called a **field**. $\mathbb{Q}$ is the smallest field containing the integers. It is the natural home of elementary algebra: every linear equation $ax = b$ with $a \ne 0$ has exactly one rational solution, $x = b/a$.

Having achieved this, one might expect the story to end. It does not, and the reason is not arithmetic but geometry.

### 3.3 Decimals: why they terminate or repeat

Every rational has a decimal expansion obtained by long division, and the expansions have a striking property.

$$\frac18 = 0.125, \qquad \frac13 = 0.3333\ldots, \qquad \frac17 = 0.142857142857\ldots, \qquad \frac16 = 0.1666\ldots$$

The first terminates. The second repeats with period $1$ from the outset. The third repeats with period $6$. The fourth has one non-repeating digit and then repeats with period $1$. No rational does anything else, and here is why.

> **Theorem.** The decimal expansion of any rational number either terminates or is eventually periodic.

*Proof.* Perform long division of $a$ by $b$. At each step the remainder $r$ satisfies $0 \le r < b$, so there are at most $b$ possible remainders. If a remainder of $0$ ever occurs, the division stops and the decimal terminates. If not, then among the first $b$ steps some remainder must occur twice, since there are only $b-1$ non-zero values available and more than $b-1$ steps. Once a remainder repeats, every subsequent digit repeats too, because the next digit and next remainder are determined entirely by the current remainder. Hence the expansion cycles, with period at most $b-1$. $\blacksquare$

This is a **pigeonhole** argument — more objects than boxes forces a repeat — and the bound it gives is sharp. For $b = 7$ the period is $6 = 7-1$, and the six remainders $1,3,2,6,4,5$ appear before cycling. Observed periods for a few denominators:

| fraction | expansion | period |
|---|---|---|
| $1/8$ | $0.125$ | terminates |
| $1/3$ | $0.\overline{3}$ | $1$ |
| $1/6$ | $0.1\overline{6}$ | $1$ (after one digit) |
| $1/11$ | $0.\overline{09}$ | $2$ |
| $1/7$ | $0.\overline{142857}$ | $6$ |
| $1/13$ | $0.\overline{076923}$ | $6$ |
| $1/17$ | $0.\overline{0588235294117647}$ | $16$ |
| $1/101$ | $0.\overline{0099}$ | $4$ |
| $1/97$ | $0.\overline{0103092783\ldots}$ | $96$ |

Which case occurs is decided by the prime factorisation of the denominator in lowest terms. The expansion terminates exactly when that denominator has no prime factors other than $2$ and $5$ — the primes dividing our base $10$. Otherwise it repeats. $1/8 = 1/2^3$ terminates; $1/6 = 1/(2\cdot3)$ has the factor $3$, so it repeats, but the factor $2$ delays the onset by one digit.

### 3.4 Turning a repeating decimal back into a fraction

The converse holds too — any terminating or eventually repeating decimal is rational — and the proof is a method.

**Example 1.** Let $x = 0.363636\ldots$. The period is $2$, so multiply by $10^2$:

$$100x = 36.363636\ldots$$

Subtract the original, and the infinite tails cancel exactly:

$$99x = 36 \implies x = \frac{36}{99} = \frac{4}{11}.$$

**Example 2.** Let $x = 0.1252525\ldots$, with one digit before the repeating block and period $2$. Shift past the non-repeating digit first: $10x = 1.252525\ldots$, and $1000x = 125.252525\ldots$. Subtract:

$$990x = 124 \implies x = \frac{124}{990} = \frac{62}{495},$$

after dividing top and bottom by $\gcd(124,990) = 2$. Check: $62/495 = 0.125252525\ldots$, as required.

Combining this with section 3.3 gives a clean characterisation, worth memorising:

> A real number is rational **if and only if** its decimal expansion terminates or is eventually periodic.

### 3.5 Density

Between any two distinct rationals there is another — for instance their average, $\tfrac{p+q}{2}$, which is rational because $\mathbb{Q}$ is closed under addition and division. Repeating the observation, between any two rationals there are infinitely many.

A set with this property is called **dense**. It has a seductive consequence: the rationals seem to fill the number line completely, since there is no gap between neighbours — indeed there are no neighbours, because no rational has a next one. Section 4 shows this intuition is false, and its falsity is the single most important fact in this lecture.

```checkpoint
q: Which of these numbers is *not* rational?
a*: $\sqrt{2}$
a: $0.75$
x: A terminating decimal is always rational: $0.75 = 75/100 = 3/4$. Termination happens exactly when the reduced denominator has no prime factors besides $2$ and $5$, and $4 = 2^2$ qualifies.
a: $0.\overline{3}$
x: A repeating decimal is always rational. Setting $x = 0.333\ldots$ gives $10x = 3.333\ldots$, so $9x = 3$ and $x = 1/3$. Infinitely many digits does not mean irrational.
a: $-7$
x: Every integer is rational, since $-7 = -7/1$ meets the definition $a/b$ with $b \ne 0$. The containment $\mathbb{Z}\subset\mathbb{Q}$ is strict but real.
hint: A number is rational exactly when its decimal terminates or eventually repeats.
why: $\sqrt2 = 1.41421356237\ldots$ neither terminates nor repeats, and section 4 proves it cannot be written as a ratio of integers at all. The other three are rational: $3/4$, $1/3$ and $-7/1$ respectively. Note that having infinitely many decimal digits is not what makes a number irrational — $1/3$ has infinitely many.

---

q: Express $0.4\overline{5}$ — that is, $0.4555\ldots$ — as a fraction in lowest terms.
a*: $41/90$
a: $45/99$
x: This is the answer for $0.\overline{45}$, where the *whole* block $45$ repeats. Here only the $5$ repeats and the $4$ does not, so the shift must first move past the non-repeating digit.
a: $9/20$
x: $9/20 = 0.45$ exactly, a terminating decimal. The given number is slightly larger, $0.4555\ldots$, because the $5$s continue forever.
a: $41/99$
x: The correct numerator with the wrong denominator. The denominator is built from the shifts used: $100x - 10x = 90x$, so the denominator is $90$, not $99$. Use $99$ only when there is no non-repeating digit and the period is $2$.
hint: Multiply by $10$ to clear the non-repeating digit, then by $10$ again to shift one full period, and subtract.
why: With $x = 0.4555\ldots$: $10x = 4.555\ldots$ and $100x = 45.555\ldots$. Subtracting, $90x = 41$, so $x = 41/90$. Since $\gcd(41,90) = 1$ — $41$ is prime and does not divide $90$ — this is already in lowest terms.

---

q: The decimal expansion of $1/7$ has period $6$. What is the largest possible period for $1/b$ with $b$ a prime other than $2$ or $5$?
a*: $b-1$, because there are only $b-1$ possible non-zero remainders in the long division.
a: $b$, since there are $b$ possible remainders.
x: There are $b$ remainders in principle, $0$ through $b-1$, but a remainder of $0$ terminates the division rather than continuing a cycle. Only the $b-1$ non-zero remainders can appear inside a repeating block.
a: There is no bound; the period can be arbitrarily long for any $b$.
x: The period is bounded by the number of available remainders, which is finite and determined by $b$. The pigeonhole principle then forces a repeat within $b-1$ steps.
a: $10$, one for each decimal digit.
x: The repeating block is not limited by the ten digits available — digits may repeat within a block. $1/17$ has period $16$, and $1/97$ has period $96$, both longer than $10$.
hint: What quantity is carried from one step of the long division to the next, and how many values can it take?
why: Each step of the long division is determined by the current remainder, which lies in $\{1,\ldots,b-1\}$ if the division has not terminated. With at most $b-1$ values available, some remainder must recur within $b-1$ steps, and from that point everything repeats. The bound is attained: $1/7$ has period $6$, $1/17$ has period $16$, $1/97$ has period $96$.
```

## 4. The hole in the rationals

### 4.1 The diagonal of a square

Draw a square of side $1$. Its diagonal $d$ satisfies, by Pythagoras,

$$d^2 = 1^2 + 1^2 = 2.$$

The diagonal exists — it is right there on the paper, and it has a length. Yet no rational number squares to $2$. The length of an ordinary line segment in an ordinary figure is not a rational number.

This was, by tradition, the discovery that broke the Pythagorean programme of reducing all quantity to whole-number ratio, and it deserves the drama. The rationals are dense, they leave no visible gaps, and yet they miss the diagonal of a unit square.

{{image: Square root of 2 | The diagonal of a unit square has length $\sqrt2$, a quantity no ratio of whole numbers can express. The proof is by contradiction: assuming a fraction in lowest terms squares to $2$ forces both its numerator and its denominator to be even, contradicting lowest terms. The construction shows the number exists geometrically while the argument shows it cannot exist arithmetically within the rationals, and it is that gap between what can be drawn and what can be written as a fraction that forces the enlargement to the real numbers.}}

### 4.2 The proof

> **Theorem.** $\sqrt2$ is irrational: there are no integers $a, b$ with $b \ne 0$ and $(a/b)^2 = 2$.

*Proof.* Suppose there were. Write the fraction in lowest terms, so $\sqrt2 = a/b$ with $\gcd(a,b) = 1$. This is legitimate — every rational has such a representation — and it is the hypothesis that will be contradicted.

Square both sides and clear the denominator:

$$2 = \frac{a^2}{b^2} \implies a^2 = 2b^2.$$

So $a^2$ is even. Now, if $a$ were odd, say $a = 2k+1$, then $a^2 = 4k^2+4k+1 = 2(2k^2+2k)+1$ would be odd. So $a$ must be even: write $a = 2m$. Substituting,

$$(2m)^2 = 2b^2 \implies 4m^2 = 2b^2 \implies b^2 = 2m^2.$$

By the identical argument, $b$ is even too. But then $2$ divides both $a$ and $b$, contradicting $\gcd(a,b) = 1$. The assumption was false, so no such fraction exists. $\blacksquare$

The shape of the argument is worth extracting, because it recurs everywhere in mathematics. It is a **proof by contradiction**: assume what you want to disprove, derive an impossibility, conclude the assumption was untenable. The device that produces the impossibility here is the lowest-terms hypothesis, which converts "$a$ and $b$ are both even" from a harmless observation into a contradiction.

### 4.3 Where the proof would break for $\sqrt4$

A good test of understanding any proof is to ask why it does not prove too much. $\sqrt4 = 2$ *is* rational, so the argument must fail somewhere if run with $4$ in place of $2$. Where?

Assume $\sqrt4 = a/b$ in lowest terms. Then $a^2 = 4b^2$, so $a^2$ is even, so $a$ is even, so $a = 2m$ and $4m^2 = 4b^2$, giving $m^2 = b^2$. And there the argument stops: this says $m = \pm b$, which is no contradiction whatever. Indeed $a/b = 2/1$ satisfies it, with $m = 1 = b$.

The step that survives for $2$ and dies for $4$ is the second one — deducing that $b$ is even. For $\sqrt2$ we obtained $b^2 = 2m^2$, forcing $b$ even; for $\sqrt4$ we obtained $b^2 = m^2$, forcing nothing. The general fact behind this is that $\sqrt{n}$ is irrational for every natural $n$ that is not a perfect square, and the proof uses the Fundamental Theorem of Arithmetic: in $a^2 = n b^2$ every prime appears to an even power on the left and, if $n$ is not a perfect square, to an odd power for at least one prime on the right.

### 4.4 A second proof, of a different shape

The parity argument is specific to square roots. A different and shorter argument disposes of a number that is not a root at all.

> **Theorem.** $\log_2 3$ is irrational.

*Proof.* The number is positive, since $3 > 2 > 1$. Suppose $\log_2 3 = p/q$ with $p$ and $q$ positive integers. By the definition of the logarithm this means $2^{p/q} = 3$, and raising both sides to the $q$-th power,

$$2^{p} = 3^{q}.$$

The left-hand side is even, since $p \ge 1$. The right-hand side is odd, being a product of odd numbers. An integer cannot be both. $\blacksquare$

Notice how little this needs: no lowest-terms hypothesis, no descent, only the observation that $2$ and $3$ are different primes — which is the Fundamental Theorem of Arithmetic doing its work again. Almost every logarithm of an integer to an integer base is irrational, and the exceptions are exactly the cases where one number is a whole power of the other.

### 4.5 What the hole means

So the rational number line, dense as it is, has punctures. Consider the set

$$S = \{x \in \mathbb{Q} : x > 0 \text{ and } x^2 < 2\}.$$

$S$ is bounded above — by $2$, say, or by $1.5$, or by $1.42$. But it has no *least* upper bound within $\mathbb{Q}$: for any rational upper bound one can always find a smaller rational that is still an upper bound, closing in on $\sqrt2$ without ever reaching a rational that is the smallest. The bound the set is reaching for is not in the system.

This is precisely the defect that makes calculus impossible over $\mathbb{Q}$. A sequence of rationals can approach a target and converge to nothing; a function can change sign without ever taking the value zero. Over $\mathbb{Q}$ the function $f(x) = x^2 - 2$ is negative at $x = 1$ and positive at $x = 2$ and is never zero — so the Intermediate Value Theorem is false over the rationals. The theorems of the calculus are not about functions in general. They are about functions on a number system without holes.

## 5. The real numbers

### 5.1 Completeness

The **real numbers** $\mathbb{R}$ are the system obtained by filling in every such hole. Making that precise is real work — the two standard constructions, Dedekind cuts and equivalence classes of Cauchy sequences, belong to a later analysis course — but the property that results can be stated exactly.

> **The completeness axiom (stated without proof).** Every non-empty set of real numbers that is bounded above has a *least* upper bound in $\mathbb{R}$.

That single sentence is what separates $\mathbb{R}$ from $\mathbb{Q}$, and every existence theorem in the calculus descends from it: the Intermediate Value Theorem, the Extreme Value Theorem, the convergence of bounded monotone sequences, the existence of the definite integral. The set of positive rationals with square less than $2$, which section 4.5 showed had no least upper bound in $\mathbb{Q}$, now has one, and we name it $\sqrt2$.

The vocabulary is worth fixing precisely, since it recurs throughout the calculus sequence. A number $M$ is an **upper bound** for a set $S$ if $x \le M$ for every $x \in S$; a set with an upper bound is **bounded above**, and lower bounds are defined symmetrically. Upper bounds are never unique — if $M$ works then so does $M+1$ — so the useful object is the *smallest* one, called the **supremum** or **least upper bound**, written $\sup S$. The largest lower bound is the **infimum**, $\inf S$.

The supremum may or may not belong to the set. For $S = [0,1]$ we have $\sup S = 1 \in S$, and $1$ is then also the **maximum**. For $S = [0,1)$ we still have $\sup S = 1$, but now $1 \notin S$ and $S$ has no maximum at all: no element of $S$ is largest, since for any $x < 1$ the number $(x+1)/2$ is larger and still in $S$. The distinction between "has a supremum" and "has a maximum" is exactly the distinction between the open and closed intervals of section 9.2, and it is why the Extreme Value Theorem insists on a closed interval.

$\mathbb{R}$ is a field, like $\mathbb{Q}$ — the four operations behave identically — and it is ordered, like $\mathbb{Q}$. Completeness is the only difference, and it is everything.

Numbers in $\mathbb{R}$ but not in $\mathbb{Q}$ are called **irrational**. $\sqrt2 = 1.41421356237\ldots$, $\pi = 3.141592653589793\ldots$, $e = 2.718281828459045\ldots$, and the golden ratio $\varphi = \tfrac{1+\sqrt5}{2} = 1.6180339887\ldots$ are the standard examples.

### 5.2 Decimal expansions of reals

Section 3.3 characterised the rationals by their decimals. The characterisation cuts both ways:

- terminating or eventually repeating $\iff$ rational;
- non-terminating and non-repeating $\iff$ irrational.

So an irrational number's decimal expansion goes on forever without ever settling into a cycle. This is a useful mental image but a poor practical test — no finite stretch of digits can establish that no cycle ever begins. $1/97$ shows why: its expansion looks patternless for ninety-five digits and only then repeats. Irrationality is proved by argument, as in section 4.2, never by inspecting digits.

A related caution: $1.41421356237$ is *not* $\sqrt2$; it is a rational approximation, and its square is $1.9999999999\ldots$, not $2$. Even the nearest double-precision value to $\sqrt2$ squares to $2.0000000000000004$. Every number a computer holds is rational, which is worth remembering whenever numerical evidence is offered for an exact claim.

### 5.3 $0.\overline{9} = 1$

The equality

$$0.999999\ldots = 1$$

is true, it is not an approximation, and it is not a convention. Three independent arguments:

**Algebraic.** Let $x = 0.999\ldots$. Then $10x = 9.999\ldots$, and subtracting gives $9x = 9$, so $x = 1$. This is exactly the method of section 3.4 applied to a period-$1$ block.

**Arithmetic.** $\tfrac13 = 0.333\ldots$ is uncontroversial. Multiply both sides by $3$: the left gives $1$, the right gives $0.999\ldots$.

**By exclusion.** If $0.999\ldots \ne 1$, then since $0.999\ldots < 1$ the difference $d = 1 - 0.999\ldots$ is a positive real number. But $0.999\ldots$ exceeds $1 - 10^{-n}$ for every $n$, so $d < 10^{-n}$ for every $n$, and no positive real number is smaller than every power of $10^{-1}$. Hence $d = 0$.

The resistance this equality provokes comes from imagining $0.999\ldots$ as a process that never finishes rather than as a number. The notation denotes the value the finite truncations approach — which is the limit concept, met properly in the calculus sequence. Under that reading the equality is not merely true but unremarkable. A consequence worth noting: decimal expansions are not quite unique, since every terminating decimal has a second representation ending in repeated $9$s ($0.5 = 0.4999\ldots$). These are the only cases.

### 5.4 Both kinds are everywhere

Between any two distinct reals there is a rational, and also an irrational. Both sets are dense in $\mathbb{R}$, so neither can be pictured as occupying separate stretches of the line; they are thoroughly interleaved at every scale.

Yet the two are not comparable in size, as section 6.3 shows. Density and size are different questions, and the answer to the second one is a surprise.

### 5.5 The irrationals are not a system

It is natural to ask the closure question of the irrationals as well, and the answer is instructive: the irrational numbers are closed under *nothing*.

- **Addition fails.** $\sqrt2$ and $-\sqrt2$ are both irrational, and their sum is $0$.
- **Multiplication fails.** $\sqrt2\cdot\sqrt2 = 2$.
- **Even a single number can escape.** $(\sqrt2)^2 = 2$, so the irrationals are not closed under squaring.

So the irrationals are not a number system in the sense of this lecture — they are merely what is left over when the rationals are removed from $\mathbb{R}$, and the leftovers have no arithmetic of their own. This is why $\mathbb{R}$, and never "the irrationals", is the object of study.

The observation has a practical use. Because $\mathbb{Q}$ *is* closed, one can argue like this: if $r$ is rational and $x$ is irrational, then $r + x$ must be irrational. For if $r + x$ were rational, then $(r+x) - r = x$ would be a difference of two rationals and hence rational, contradicting the assumption. The same reasoning shows $rx$ is irrational for any non-zero rational $r$. So $\sqrt2 + 3$, $\tfrac{\sqrt2}{5}$ and $2\pi$ are all irrational without any new proof being needed.

What the reasoning does *not* settle is the sum or product of two irrationals, where either outcome is possible: $\sqrt2 + (3 - \sqrt2) = 3$ is rational, while $\sqrt2 + \sqrt3$ is irrational (harder to prove, and true). Cases like $\pi + e$ remain open — it is not known whether that sum is rational, though at least one of $\pi+e$ and $\pi e$ must be irrational, since if both were rational then $\pi$ and $e$ would be roots of a quadratic with rational coefficients and hence algebraic.

## 6. Algebraic and transcendental

### 6.1 Algebraic numbers

There is a second way to classify reals, cutting across rational and irrational.

> **Definition.** A real number is **algebraic** if it is a root of some polynomial with integer coefficients. Otherwise it is **transcendental**.

Every rational is algebraic: $p/q$ is a root of $qx - p = 0$. So is $\sqrt2$, a root of $x^2 - 2 = 0$; and $\sqrt[3]{7}$, a root of $x^3 - 7 = 0$; and the golden ratio $\varphi = \tfrac{1+\sqrt5}{2}$, a root of

$$x^2 - x - 1 = 0,$$

which is checked by substitution and holds exactly. Anything you can write with integers, the four operations and roots is algebraic.

### 6.2 $\pi$ and $e$

> **Stated without proof.** $e$ is transcendental (Hermite, 1873) and $\pi$ is transcendental (Lindemann, 1882).

Both proofs are hard and far outside this course. The consequences are not. The transcendence of $\pi$ settles, negatively and permanently, the ancient problem of squaring the circle: a straightedge-and-compass construction can only produce certain algebraic numbers, so no such construction can produce $\sqrt\pi$, and no square can be constructed with the area of a given circle. A problem open for two thousand years was closed by a theorem about what kind of number $\pi$ is.

### 6.3 Counting the two kinds

Here is the surprise. The algebraic numbers — including every rational, every square root, every cube root, every root of every polynomial with integer coefficients — form only a *vanishingly small* part of $\mathbb{R}$.

The argument compares infinite sets by matching. Two sets have the same size if their members can be paired off exactly. A set that can be paired off with $\mathbb{N}$ is **countable**; it can be written as a list, first, second, third, and so on.

$\mathbb{Q}$ is countable. This is startling given how dense it is, but the pairing exists: arrange all fractions $a/b$ in a grid with $a$ across and $b$ down, and traverse it along diagonals, skipping repeats. Every rational appears at a definite finite position, so the list is complete. The same technique, applied to polynomials rather than fractions, shows the algebraic numbers are countable too.

$\mathbb{R}$ is not countable. Suppose someone offers a complete list of all reals between $0$ and $1$, written as decimals. Build a new number $d$ by taking its first digit to differ from the first digit of the first number on the list, its second digit to differ from the second digit of the second number, and so on down the diagonal (avoiding $0$ and $9$ to dodge the double-representation issue of section 5.3). Then $d$ is a real number between $0$ and $1$, and it differs from the $n$-th listed number in the $n$-th place, for every $n$. So it is not on the list. No list can be complete.

Since the algebraic numbers can be listed and the reals cannot, "almost all" real numbers are transcendental. And yet only a handful — $\pi$, $e$, and a few purpose-built constructions — have ever been proved to be so. The typical real number is transcendental, and essentially none of them can be named.

{{image: Cantor's diagonal argument | The diagonal construction showing that the real numbers cannot be arranged in a list. Given any proposed enumeration of the reals between $0$ and $1$, a new number is built whose $n$-th decimal digit differs from the $n$-th digit of the $n$-th listed number, so it differs from every entry and cannot appear on the list. The rationals and, by the same technique applied to polynomial coefficients, the algebraic numbers do admit such a list, so the reals are a strictly larger infinity and almost every real number is transcendental.}}

### 6.4 Approximating $\pi$ by rationals

Density guarantees that any irrational can be approximated by rationals as closely as desired. Two familiar approximations to $\pi = 3.141592653589793\ldots$ show how good this can be with small denominators:

| approximation | value | error |
|---|---|---|
| $22/7$ | $3.142857143$ | $+1.264\times10^{-3}$ |
| $355/113$ | $3.1415929204$ | $+2.668\times10^{-7}$ |

The second is remarkable: a denominator of $113$ pins down $\pi$ to within three parts in ten million, agreeing to six decimal places. Approximation of irrationals by rationals with small denominators is a subject in its own right — the theory of continued fractions — and $355/113$ is one of its showpieces.

## 7. One more system

Even $\mathbb{R}$ is not closed under everything one might want. The equation

$$x^2 = -1$$

has no real solution, because the square of any real is non-negative. The same move is made once more: define $i$ with $i^2 = -1$, and let the **complex numbers** be

$$\mathbb{C} = \{a + bi : a, b \in \mathbb{R}\}.$$

Arithmetic in $\mathbb{C}$ needs no new rules — treat $i$ as a symbol obeying the ordinary laws and replace $i^2$ by $-1$ whenever it appears:

$$(a+bi) + (c+di) = (a+c) + (b+d)i,$$
$$(a+bi)(c+di) = ac + adi + bci + bd\,i^2 = (ac - bd) + (ad+bc)i.$$

Division uses the same conjugate trick that removed square roots in section 3.4's cousin: multiply above and below by $c - di$, whose product with $c+di$ is the real number $c^2+d^2$. So

$$\frac{1}{3+2i} = \frac{3-2i}{(3+2i)(3-2i)} = \frac{3-2i}{9+4} = \frac{3}{13} - \frac{2}{13}i.$$

Every non-zero complex number therefore has a reciprocal, so $\mathbb{C}$ is a field, exactly as $\mathbb{Q}$ and $\mathbb{R}$ are.

This enlargement is final in a strong sense.

> **Fundamental Theorem of Algebra (stated without proof).** Every non-constant polynomial with complex coefficients has a complex root.

So no polynomial equation ever again forces an enlargement — $\mathbb{C}$ is **algebraically closed**. The price is order: $\mathbb{R}$ can be laid out on a line with every pair comparable, and $\mathbb{C}$ cannot be ordered in any way compatible with its arithmetic. Since the calculus is built on inequalities — $x$ close to $a$, $f$ increasing, $f(x)$ between two values — the whole of the calculus sequence stays inside $\mathbb{R}$. Complex numbers return later, in differential equations and in complex analysis, where the loss of order is repaid many times over.

```checkpoint
q: In the proof that $\sqrt2$ is irrational, what role does the assumption "$a/b$ is in lowest terms" play?
a*: It is the hypothesis that the conclusion contradicts, since the argument shows $a$ and $b$ are both even.
a: It makes the algebra simpler but is not logically necessary.
x: It is essential. Without it, deducing that $a$ and $b$ are both even is a harmless true statement — $\sqrt2 = 4/2\cdot\ldots$ would be no contradiction at all. The contradiction exists only because a common factor of $2$ was excluded by hypothesis.
a: It guarantees that $b \ne 0$.
x: $b \ne 0$ comes from the definition of a rational number, not from the lowest-terms condition. Lowest terms adds the separate requirement $\gcd(a,b) = 1$.
a: It ensures $a$ and $b$ are positive.
x: The reduction to lowest terms may fix the sign of $b$ by convention, but the proof never uses positivity. It uses only that $a$ and $b$ share no factor of $2$.
hint: What impossible statement does the argument end on, and what earlier assumption makes it impossible?
why: From $a^2 = 2b^2$ the argument deduces that $a$ is even, then that $b$ is even. Both being even means $2$ is a common factor — impossible if $\gcd(a,b)=1$. The lowest-terms hypothesis is what converts a benign deduction into a contradiction, and it is available because every rational has such a representation.

---

q: Which statement about $0.\overline{9}$ is correct?
a*: $0.\overline{9} = 1$ exactly.
a: $0.\overline{9}$ is the largest real number strictly less than $1$.
x: No such number exists. Between any candidate $x < 1$ and $1$ there is always another real, for instance $(x+1)/2$, so there is no "largest number below $1$" for $0.\overline9$ to be.
a: $0.\overline{9}$ differs from $1$ by an infinitesimal amount.
x: The real number system contains no non-zero infinitesimals: if $d > 0$ then $d > 10^{-n}$ for some $n$. Since $1 - 0.\overline9$ is smaller than every $10^{-n}$, it must be $0$.
a: $0.\overline{9}$ is irrational, since its expansion never terminates.
x: A repeating expansion is the signature of a *rational* number, not an irrational one. Applying the standard method gives $9x = 9$, so $x = 1$, which is not merely rational but an integer.
hint: Apply the repeating-decimal-to-fraction method with a period of one digit.
why: With $x = 0.\overline9$: $10x = 9.\overline9$, so $10x - x = 9$ and $x = 1$. Independently, $\tfrac13 = 0.\overline3$ multiplied by $3$ gives $1 = 0.\overline9$. The equality is exact. Its only cost is that decimal representation is not unique — every terminating decimal also has a form ending in repeated $9$s.

---

q: Which claim about algebraic and transcendental numbers is correct?
a*: Every rational is algebraic, but almost every real is transcendental.
a: Every irrational number is transcendental.
x: $\sqrt2$ is irrational and algebraic, being a root of $x^2-2 = 0$. The rational/irrational split and the algebraic/transcendental split are different classifications; the algebraic numbers include all rationals and many irrationals.
a: Transcendental numbers are rare, since only $\pi$ and $e$ are known.
x: Few have been *proved* transcendental, but Cantor's argument shows the algebraic numbers are countable while the reals are not — so the transcendentals are the overwhelming majority. Scarcity of named examples is a limitation of our proofs, not of the numbers.
a: Every real number is a root of some polynomial with integer coefficients.
x: That is exactly the definition of algebraic, and it is false for $\pi$ and $e$ — proved by Lindemann and Hermite respectively — and for almost every real by the counting argument.
hint: Distinguish "cannot be written as a fraction" from "is not a root of any integer polynomial".
why: A rational $p/q$ is a root of $qx - p$, so all rationals are algebraic; so are $\sqrt2$, $\sqrt[3]{7}$ and the golden ratio. The algebraic numbers are countable, being generated from a countable set of polynomials each with finitely many roots, while $\mathbb{R}$ is uncountable by the diagonal argument. Hence almost every real is transcendental, even though very few individual examples have been proved so.

---

q: $r$ is rational and $x$ is irrational. Which conclusion is guaranteed?
a*: $r + x$ is irrational.
a: $x + y$ is irrational whenever $x$ and $y$ are both irrational.
x: The irrationals are closed under nothing. $\sqrt2$ and $-\sqrt2$ are both irrational and sum to $0$; $\sqrt2 \cdot \sqrt2 = 2$. Two irrationals can combine to give a rational, which is why "the irrationals" are not a number system.
a: $rx$ is irrational for every rational $r$.
x: Almost — but $r = 0$ breaks it, since $0\cdot x = 0$ is rational. The statement is true for every *non-zero* rational $r$, and the excluded case is exactly the one where the argument by contradiction cannot divide by $r$.
a: Nothing is guaranteed, since irrationals have no closure properties.
x: The irrationals indeed have no closure properties, but the *rationals* do, and that is enough. Closure of $\mathbb{Q}$ under subtraction is what forces $r+x$ to be irrational.
hint: Suppose $r + x$ were rational, and use the fact that $\mathbb{Q}$ is closed under subtraction.
why: If $r+x$ were rational, then $(r+x) - r$ would be a difference of two rationals, hence rational by closure — but that difference is $x$, which is irrational. The contradiction shows $r+x$ is irrational. The same argument gives $rx$ irrational provided $r \ne 0$. No corresponding conclusion holds for two irrationals, since $\sqrt2 + (3-\sqrt2) = 3$.
```

## 8. The closure table

The whole lecture compresses into one table. Each row is a system; each entry says whether that operation can be performed without leaving it.

| system | $+$ | $-$ | $\times$ | $\div$ (non-zero) | roots of positives | roots of all polynomials |
|---|---|---|---|---|---|---|
| $\mathbb{N}$ | yes | no | yes | no | no | no |
| $\mathbb{Z}$ | yes | yes | yes | no | no | no |
| $\mathbb{Q}$ | yes | yes | yes | yes | no | no |
| $\mathbb{R}$ | yes | yes | yes | yes | yes | no |
| $\mathbb{C}$ | yes | yes | yes | yes | yes | yes |

Read down any column and you can see which failure forced which enlargement. Read across the bottom row and you see why the chain stops: $\mathbb{C}$ is closed under everything algebra can ask.

Two things the table does not show, and which matter more than it does. First, $\mathbb{R}$'s decisive advantage over $\mathbb{Q}$ is *completeness*, not the availability of square roots — the roots are a symptom. Second, $\mathbb{C}$'s advantage over $\mathbb{R}$ costs the order relation, which is why the calculus stays real.

## 9. Notation for everything that follows

Two pieces of notation are used constantly from here on, and both are about *sets of real numbers*.

### 9.1 Intervals

For $a < b$:

| notation | meaning | endpoints |
|---|---|---|
| $(a,b)$ | $a < x < b$ | both excluded — **open** |
| $[a,b]$ | $a \le x \le b$ | both included — **closed** |
| $[a,b)$ | $a \le x < b$ | half-open |
| $(a,\infty)$ | $x > a$ | $\infty$ is never included |
| $[a,\infty)$ | $x \ge a$ | |
| $(-\infty,\infty)$ | all of $\mathbb{R}$ | |

The symbol $\infty$ is not a real number and never appears with a square bracket. The distinction between open and closed is not pedantry: the Extreme Value Theorem holds on $[a,b]$ and fails on $(a,b)$, because a function on an open interval can approach a maximum it never attains.

### 9.2 Absolute value as distance

$$|x| = \begin{cases} x, & x \ge 0\\ -x, & x < 0\end{cases}$$

so $|x| \ge 0$ always, and $|x|$ is the distance from $x$ to $0$ on the number line. More usefully:

> $|x - a|$ is the **distance between $x$ and $a$**.

Every inequality involving absolute value should be read that way rather than by manipulating cases. The statement $|x - 3| < 2$ says "$x$ is within $2$ of $3$", which is the interval $1 < x < 5$, or $(1,5)$. In general

$$|x - a| < \delta \iff a - \delta < x < a + \delta \iff x \in (a-\delta,\ a+\delta),$$

an interval of width $2\delta$ centred on $a$. Adding the condition $0 < |x-a|$ removes the centre point itself, leaving a **punctured** interval.

That last construction is precisely the one used to define the limit — "$f(x)$ is within $\varepsilon$ of $L$ whenever $x$ is within $\delta$ of $a$ but not equal to $a$" — so time spent reading absolute values as distances is repaid immediately in the calculus sequence.

One inequality is needed more than any other, and it too is a statement about distance:

$$|a + b| \le |a| + |b| \qquad \text{(the triangle inequality)}.$$

Equality holds when $a$ and $b$ have the same sign; otherwise cancellation makes the left side strictly smaller. For example $|3 + (-5)| = 2 < 8 = |3| + |-5|$. Nearly every estimate in analysis passes through it.

### 9.3 Manipulating inequalities

$\mathbb{R}$ is an **ordered** field: for any two reals exactly one of $a < b$, $a = b$, $a > b$ holds (trichotomy), and $a < b$ with $b < c$ gives $a < c$ (transitivity). Four rules govern the manipulation of inequalities, and one of them is the source of most errors made with them.

1. **Adding** the same quantity to both sides preserves the inequality: $a < b \implies a + c < b + c$, for any $c$ whatever, positive or negative.
2. **Multiplying by a positive** preserves it: if $c > 0$ then $a < b \implies ac < bc$.
3. **Multiplying by a negative reverses it:** if $c < 0$ then $a < b \implies ac > bc$. So $2 < 3$ but $-2 > -3$.
4. **Taking reciprocals of two positives reverses it:** if $0 < a < b$ then $1/a > 1/b$. So $2 < 3$ but $\tfrac12 > \tfrac13$.

Rule 3 is why one may never multiply an inequality through by a variable expression whose sign is unknown. To solve

$$\frac{1}{x-1} < 2,$$

it is wrong to multiply by $x-1$ and conclude $1 < 2(x-1)$, because $x-1$ may be negative. The correct treatment splits into cases. If $x > 1$ then $x - 1 > 0$, multiplying is safe, and $1 < 2x-2$ gives $x > 3/2$. If $x < 1$ then $x-1 < 0$, the inequality reverses to $1 > 2(x-1)$, giving $x < 3/2$, which every $x < 1$ already satisfies. So the solution set is $(-\infty, 1) \cup (3/2, \infty)$ — a union of two intervals, and a set that the careless method misses half of. Testing a sample point from each piece ($x = 0$ gives $-1 < 2$, true; $x = 1.2$ gives $5 < 2$, false; $x = 2$ gives $1 < 2$, true) confirms it.

The rules above, applied to $|x|$, also give the two standard equivalences used constantly in the calculus sequence:

$$|u| < c \iff -c < u < c, \qquad\qquad |u| > c \iff u > c \ \text{ or } \ u < -c \qquad (c > 0).$$

The first is a single interval, the second a union of two — matching the geometric readings "within $c$ of zero" and "further than $c$ from zero".

### 9.4 Set notation

Finally, the symbols used to talk about collections of numbers, all of which have already appeared informally above.

| symbol | reading | example |
|---|---|---|
| $x \in S$ | $x$ is an element of $S$ | $3 \in \mathbb{Z}$ |
| $x \notin S$ | $x$ is not an element of $S$ | $\sqrt2 \notin \mathbb{Q}$ |
| $A \subseteq B$ | every element of $A$ is in $B$ | $\mathbb{Z}\subseteq\mathbb{Q}$ |
| $A \cup B$ | union: in $A$ or in $B$ (or both) | $(-\infty,1)\cup(2,\infty)$ |
| $A \cap B$ | intersection: in both | $[0,5]\cap[3,9] = [3,5]$ |
| $\varnothing$ | the empty set | $\mathbb{Q}\cap\{\text{irrationals}\} = \varnothing$ |

The **set-builder** notation $\{x \in S : P(x)\}$ reads "the set of $x$ in $S$ such that $P(x)$ holds", and is how any set too complicated to list is described. Some colons are written as vertical bars, $\{x \mid P(x)\}$; the meaning is identical. Examples:

$$\{x\in\mathbb{R} : x^2 < 2\}, \qquad \{n \in \mathbb{N} : n \text{ is prime}\}, \qquad \{x\in\mathbb{R} : |x-3|<2\} = (1,5).$$

The systems of this lecture form a chain of subsets, each strictly larger than the last:

$$\mathbb{N} \subset \mathbb{Z}\subset\mathbb{Q}\subset\mathbb{R}\subset\mathbb{C}.$$

Each inclusion is strict, and each witness has appeared above: $-1 \in \mathbb{Z}\setminus\mathbb{N}$, $\tfrac12\in\mathbb{Q}\setminus\mathbb{Z}$, $\sqrt2\in\mathbb{R}\setminus\mathbb{Q}$, $i\in\mathbb{C}\setminus\mathbb{R}$. The backslash denotes **set difference** — everything in the first set that is not in the second — so the irrational numbers are exactly $\mathbb{R}\setminus\mathbb{Q}$, which is how they were defined in section 5.1 and why section 5.5 found them so poorly behaved: a difference of two sets inherits no structure from either.

## 10. Practice

*Answers depend on the following verified values: $360 = 2^3\cdot3^2\cdot5$ with $24$ divisors; $\gcd(1071,462) = 21$ via $1071 = 2(462)+147$, $462 = 3(147)+21$, $147 = 7(21)+0$; $\gcd(12,18) = 6$ and $\operatorname{lcm}(12,18) = 36$ with $6\times36 = 12\times18$; decimal periods $1/7 \to 6$, $1/11 \to 2$, $1/13 \to 6$, $1/17 \to 16$, $1/101 \to 4$, $1/8$ terminating; $0.\overline{36} = 4/11$; $0.1\overline{25} = 62/495$; $\sqrt2 = 1.41421356237\ldots$; $\varphi = 1.6180339887\ldots$ satisfying $x^2-x-1=0$; $\pi = 3.141592653589793$ with $22/7$ in error by $+1.264\times10^{-3}$ and $355/113$ by $+2.668\times10^{-7}$.*

**1.** *(Closure.)* For each of $\mathbb{N}$, $\mathbb{Z}$, $\mathbb{Q}$, state whether it is closed under **(a)** subtraction, **(b)** division by non-zero elements, **(c)** taking square roots of its positive members. Give an explicit counterexample for every "no".

**2.** *(Factorisation.)* **(a)** Write $504$ as a product of primes. **(b)** Use the factorisation to count its positive divisors. **(c)** Compute $\gcd(504, 360)$ and $\operatorname{lcm}(504,360)$ from the factorisations, and verify $\gcd\cdot\operatorname{lcm} = $ the product.

**3.** *(Euclid.)* **(a)** Run the Euclidean algorithm on $\gcd(1071,462)$, showing every line. **(b)** Use the result to reduce $1071/462$ to lowest terms. **(c)** Explain in one sentence why each step of the algorithm leaves the set of common divisors unchanged.

**4.** *(Decimals out.)* Give the decimal expansion and state the period for **(a)** $1/8$, **(b)** $1/11$, **(c)** $1/6$. For each, say whether it terminates or repeats and justify the answer from the prime factorisation of the denominator.

**5.** *(Decimals in.)* Convert to fractions in lowest terms: **(a)** $0.\overline{36}$; **(b)** $0.1\overline{25}$; **(c)** $2.\overline{4}$. Show the multiply-and-subtract step in each case.

**6.** *(Irrationality.)* **(a)** Prove that $\sqrt3$ is irrational, adapting the argument of section 4.2. **(b)** State precisely where the same argument fails for $\sqrt9$. **(c)** State the general criterion for $\sqrt n$ to be irrational.

**7.** *(Classification.)* Classify each as natural, integer, rational, irrational, algebraic, transcendental — listing every label that applies: **(a)** $-4$; **(b)** $\sqrt{16}$; **(c)** $\sqrt{15}$; **(d)** $\pi/2$; **(e)** $0.\overline{27}$; **(f)** $\tfrac{1+\sqrt5}{2}$.

**8.** *(Completeness.)* **(a)** Give an example of a set of rationals that is bounded above but has no least upper bound in $\mathbb{Q}$. **(b)** State the completeness axiom. **(c)** Explain why the Intermediate Value Theorem is false over $\mathbb{Q}$, using $f(x) = x^2-2$ on $[1,2]$.

**9.** *(Notation.)* **(a)** Write $|x - 4| < 3$ as an interval. **(b)** Write $0 < |x + 2| \le 1$ as a union of intervals. **(c)** Verify the triangle inequality for $a = 7$, $b = -10$, and state when equality holds in general.

## Further reading

{{book: Ivan Niven | Numbers: Rational and Irrational | 1961}} is the short classic on exactly this material, and takes the irrationality proofs considerably further than a first course — including the irrationality of $e$, which is within reach of a determined reader.

{{book: G. H. Hardy | An Introduction to the Theory of Numbers | 2008}} is the standard reference for the integer arithmetic of sections 2 and 6, with full proofs of the Fundamental Theorem of Arithmetic and of the transcendence of $e$ and $\pi$.

{{book: Walter Rudin | Principles of Mathematical Analysis | 1976}} opens with the construction of $\mathbb{R}$ from $\mathbb{Q}$ by Dedekind cuts and the derivation of the completeness property, which section 5.1 states without proof.
$preNum_master$,
    true, true
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
