-- Mathematics · Lower-Division Undergraduate — Calculus Sequence —
-- Single-Variable Calculus — "Limits & Continuity".
-- Curated master for
-- mathematics/lower-division-undergraduate/calculus-sequence/single-variable-calculus/limits-and-continuity
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Lecture 1 of six. Deliberately a FIRST lesson, not a course summary:
-- it opens on the two motivating problems (tangent line, instantaneous
-- velocity), reaches the limit through numerical tables and graphs,
-- and only reaches the epsilon-delta definition in section 9, after
-- the intuition it formalises is already in place. The parent node
-- carries the full Calculus I reference chapter; this node carries the
-- lecture.
--
-- Organised around one question - what does "approaches" mean? - asked
-- first of secant slopes, then of average velocities, then of tables,
-- then of algebra, and answered formally at the end.
-- ~10,000 words, 10 checkpoint questions, 9 worked problems, 2 figures.
--
-- Numbers verified before drafting (python3, double precision):
--   secant slopes of y = x^2 at a = 1 for h = 1, 0.5, 0.1, 0.01, 0.001
--     and their negatives: 3, 2.5, 2.1, 2.01, 2.001 / 1, 1.5, 1.9,
--     1.99, 1.999;
--   (x^2-1)/(x-1) at x = 0.9, 0.99, 0.999, 0.9999, 1.0001, 1.001,
--     1.01, 1.1: 1.9, 1.99, 1.999, 1.9999, 2.0001, 2.001, 2.01, 2.1;
--   free fall s = 4.9 t^2, average velocity on [2, 2+h] for h = 1, 0.5,
--     0.1, 0.01, 0.001: 24.5, 22.05, 20.09, 19.649, 19.6049; limit 19.6
--     = 9.8 x 2;
--   sin(x)/x at x = 1, 0.5, 0.1, 0.01, 0.001: 0.8414710, 0.9588511,
--     0.9983342, 0.9999833, 0.9999998;
--   (1 - cos x)/x^2 at x = 1, 0.5, 0.1, 0.01: 0.4596977, 0.4896698,
--     0.4995835, 0.4999958; and in floating point at x = 1e-6, 1e-7,
--     1e-8: 0.5000445, 0.4996004, 0.0 - the cancellation demonstration;
--   (sqrt(x+1)-1)/x at x = 1, 0.1, 0.01, 0.001: 0.4142136, 0.4880885,
--     0.4987562, 0.4998751;
--   sin(pi/x) = 0 at x = 0.1, 0.01, 0.001 but = 1 at x = 2/1001 =
--     0.001998002 - the deceptive table;
--   (x^2-1)/(x-1) evaluated at x = 1 + 1e-16 raises ZeroDivisionError
--     in double precision, since 1 + 1e-16 == 1;
--   x^2 sin(1/x) at x = 0.1, 0.01, 0.001: -5.440e-3, -5.064e-5,
--     8.269e-7, each inside the bound x^2;
--   delta = min(1, eps/5) for lim x^2 = 4 at a = 2: eps = 0.1 gives
--     worst-case |x^2-4| = 0.0804 < 0.1; eps = 0.01 gives 0.008004;
--   x^3 - x - 1 on [1,2]: f(1) = -1, f(2) = 5, root 1.324717957;
--     bisection midpoints 1.5 (+0.875), 1.25 (-0.29688), 1.375
--     (+0.22461), 1.3125 (-0.05151), bracket [1.3125, 1.375];
--   cos x = x has root 0.739085133 on [0,1];
--   sqrt(x^2+x) - x at x = 10, 100, 1e4, 1e6: 0.488088, 0.498756,
--     0.499988, 0.500000;
--   (3x^2-x)/(2x^2+5) at x = 10, 100, 1e4: 1.414634, 1.494626, 1.499950;
--   (sqrt(x+4)-2)/x at x = 0.1, 0.01, 0.001: 0.2484567, 0.2498440,
--     0.2499844;
--   tan(x)/x at x = 0.1, 0.01, 0.001: 1.0033467, 1.0000333, 1.0000003.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'mathematics/lower-division-undergraduate/calculus-sequence/single-variable-calculus/limits-and-continuity',
    'research','advanced','read',
    $svcLimits_master$> Two problems that antiquity could not solve — draw the tangent to a curve, and say how fast a falling body is moving at an instant — turn out to be the same problem. Both ask for the value of a quotient whose numerator and denominator are simultaneously zero. The limit is the idea that makes such a quotient meaningful, and it is the only genuinely new idea in the whole of the differential calculus.

This is the first lecture of six. Its single question is what the word *approaches* means, and it asks that question four times: of a list of secant slopes, of a table of numbers, of an algebraic expression, and finally of a formal definition. The formal definition — the one with $\varepsilon$ and $\delta$ — arrives in section 9, not section 1. It is the answer, and answers make no sense before the question.

Nothing here is assumed beyond algebra: factoring, rational expressions, the difference of squares, and the graphs of the standard functions. Trigonometric values are needed once, in section 5, and radians are used throughout.

## 1. Two problems that resist algebra

### 1.1 The tangent line

A **secant line** through two points of a curve is easy: two points determine a line, and its slope is the rise over the run. A **tangent line** at a single point is not easy, because one point determines no line at all. Yet everyone can see what the tangent to a circle at a point is, and everyone can see that a parabola has one too.

The Greek geometers could construct the tangent to a circle, a parabola, an ellipse and a spiral, each by a separate trick tailored to that curve. What they had no method for was the tangent to a curve given by an arbitrary equation. The obstruction is not cleverness. It is that "the line touching the curve at one point" is not a definition you can compute with.

Try the parabola $y = x^2$ at the point $P = (1, 1)$. Take a second point $Q = (1+h,\ (1+h)^2)$ on the curve, with $h \ne 0$, and compute the slope of the secant $PQ$:

$$m_{\text{sec}}(h) = \frac{(1+h)^2 - 1^2}{(1+h) - 1} = \frac{(1+h)^2 - 1}{h}.$$

Now compute, for $h$ shrinking towards zero from both sides.

| $h$ | $Q$ | secant slope $m_{\text{sec}}(h)$ |
|---|---|---|
| $1$ | $(2, 4)$ | $3$ |
| $0.5$ | $(1.5, 2.25)$ | $2.5$ |
| $0.1$ | $(1.1, 1.21)$ | $2.1$ |
| $0.01$ | $(1.01, 1.0201)$ | $2.01$ |
| $0.001$ | $(1.001, 1.002001)$ | $2.001$ |
| $-0.001$ | $(0.999, 0.998001)$ | $1.999$ |
| $-0.01$ | $(0.99, 0.9801)$ | $1.99$ |
| $-0.1$ | $(0.9, 0.81)$ | $1.9$ |
| $-0.5$ | $(0.5, 0.25)$ | $1.5$ |
| $-1$ | $(0, 0)$ | $1$ |

The numbers close in on $2$ from above and from below. They do not merely drift towards $2$; each halving of $|h|$ halves the gap. And $2$ is not a value the table ever attains, because $h = 0$ is exactly the case the formula forbids: at $h = 0$ the two points coincide, the secant is undefined, and the quotient reads $0/0$.

The algebra confirms what the table suggests, and does so exactly. Expand the numerator:

$$m_{\text{sec}}(h) = \frac{1 + 2h + h^2 - 1}{h} = \frac{2h + h^2}{h} = \frac{h(2 + h)}{h}.$$

For every $h \ne 0$ the factor $h$ cancels, leaving

$$m_{\text{sec}}(h) = 2 + h \qquad (h \ne 0).$$

That is the entire content of the table in one line. The cancellation is legitimate precisely because $h \ne 0$ — we never divide by zero — and the result is a formula that plainly approaches $2$ as $h$ shrinks. So we *define* the tangent line at $P$ to be the line through $P$ of slope $2$, namely $y - 1 = 2(x - 1)$, or $y = 2x - 1$.

Notice what has happened. We did not compute the tangent slope; there was nothing to compute, since the defining quotient is $0/0$. We computed a *family* of secant slopes, observed that the family has a limiting value, and adopted that value as the definition. The definition is justified by the fact that the limiting value exists and is unique — which is a fact about the function, not a matter of taste.

{{image: Tangent | Secant lines through a fixed point of a curve and a second point sliding towards it. Each secant is an honest line through two distinct points, computable by rise over run; the tangent is the line the secants settle onto as the second point closes in. The tangent is defined by that limiting process rather than by any property visible at the single point of contact, which is why calculus needs the limit before it can define a slope.}}

### 1.2 The falling body

The second problem looks unrelated and is not. Near the Earth's surface, a body dropped from rest falls a distance

$$s(t) = 4.9\,t^2 \ \text{ metres in } t \text{ seconds}$$

(the $4.9$ is $g/2$ with $g \approx 9.8\ \mathrm{m/s^2}$). Ask: how fast is it moving at the instant $t = 2$?

Average velocity is unproblematic — distance over elapsed time:

$$v_{\text{avg}}[2,\ 2+h] = \frac{s(2+h) - s(2)}{h} = \frac{4.9(2+h)^2 - 4.9(4)}{h}.$$

Compute it over shrinking intervals starting at $t = 2$:

| interval | $h$ | average velocity (m/s) |
|---|---|---|
| $[2, 3]$ | $1$ | $24.5$ |
| $[2, 2.5]$ | $0.5$ | $22.05$ |
| $[2, 2.1]$ | $0.1$ | $20.09$ |
| $[2, 2.01]$ | $0.01$ | $19.649$ |
| $[2, 2.001]$ | $0.001$ | $19.6049$ |

The numbers close in on $19.6$. Again $h = 0$ is forbidden: over an interval of zero length the body travels zero distance in zero time, and $0/0$ says nothing. Again the algebra is decisive:

$$\frac{4.9\big[(2+h)^2 - 4\big]}{h} = \frac{4.9\big[4 + 4h + h^2 - 4\big]}{h} = \frac{4.9h(4+h)}{h} = 4.9(4+h) = 19.6 + 4.9h$$

for every $h \ne 0$. As $h$ shrinks the expression approaches $19.6\ \mathrm{m/s}$, and we *define* the instantaneous velocity at $t = 2$ to be that number.

There is a physical reading of the definition worth holding on to. "Instantaneous velocity" is not something a stopwatch measures; every measurement takes time and therefore returns an average. What the limit provides is the number that all sufficiently short measurements agree on to any accuracy you care to demand. That is what an instantaneous rate *is*.

### 1.3 What the two problems have in common

Strip the context from both computations:

$$\frac{(1+h)^2 - 1^2}{h} \qquad\text{and}\qquad \frac{4.9(2+h)^2 - 4.9(2)^2}{h}.$$

Each is $\dfrac{f(a+h) - f(a)}{h}$ for some function $f$ and some point $a$. Each is undefined at $h = 0$, and in each case the numerator and denominator both approach $0$, so no rule of arithmetic assigns the quotient a value. Each nevertheless has a perfectly definite limiting value, obtainable by cancelling the factor $h$ that the numerator turns out to contain.

The quotient $\dfrac{f(a+h)-f(a)}{h}$ is called the **difference quotient**, and its limiting value is the **derivative**. That is the subject of Lecture 2. Everything in this lecture exists to make the phrase "limiting value" mean something exact, because on it rests not only the derivative but — through a different limit, of sums rather than quotients — the integral as well.

## 2. The limit, informally

### 2.1 The notation and one crucial exclusion

Write

$$\lim_{x \to a} f(x) = L$$

to mean: *the values of $f(x)$ can be made as close to $L$ as we please by taking $x$ sufficiently close to $a$, but not equal to $a$.*

Read that once more, slowly. Three phrases are doing work.

**"As close to $L$ as we please."** The closeness demanded is arbitrary. It is not enough that $f(x)$ gets fairly close; every tolerance, however small, must eventually be met.

**"Sufficiently close to $a$."** How close $x$ must be is allowed to depend on how close we demanded $f(x)$ be. Tighter output tolerance, tighter input window.

**"But not equal to $a$."** The limit is entirely indifferent to $f(a)$. The function need not be defined at $a$ at all; if it is defined there, its value there may be anything whatever, and the limit does not change. This is not a technicality to be tolerated. It is the whole point. Every difference quotient in section 1 was *undefined* at the very point we were approaching, and if limits cared about the value at the point, calculus would not exist.

Three functions make the indifference concrete:

$$f(x) = \frac{x^2-1}{x-1}, \qquad g(x) = x+1, \qquad h(x) = \begin{cases} x + 1, & x \ne 1\\ 7, & x = 1.\end{cases}$$

$f$ is undefined at $x=1$. $g$ equals $2$ there. $h$ equals $7$ there. The three functions agree at every $x \ne 1$, so they have exactly the same limit as $x \to 1$, namely $2$. Their graphs are the same line, differing only in whether the point above $x=1$ is missing, filled in at height $2$, or filled in at height $7$.

### 2.2 A table, read carefully

Take $f(x) = \dfrac{x^2-1}{x-1}$ and approach $x=1$ from both sides.

| $x$ | $f(x)$ | | $x$ | $f(x)$ |
|---|---|---|---|---|
| $0.9$ | $1.9$ | | $1.1$ | $2.1$ |
| $0.99$ | $1.99$ | | $1.01$ | $2.01$ |
| $0.999$ | $1.999$ | | $1.001$ | $2.001$ |
| $0.9999$ | $1.9999$ | | $1.0001$ | $2.0001$ |

Two features matter. First, both columns converge to the same number, $2$ — approaching from the left and from the right give the same answer. Second, the column entry at $x = 1$ is blank, and would remain blank however long the table ran, since $f(1) = 0/0$.

The algebra, as before, settles it: for $x \ne 1$,

$$\frac{x^2-1}{x-1} = \frac{(x-1)(x+1)}{x-1} = x+1,$$

and $x+1$ visibly approaches $2$ as $x$ approaches $1$. So $\lim_{x\to1} f(x) = 2$, with no appeal to the table at all. The table's role is to make the claim believable and to catch blunders; it is not the argument.

### 2.3 One-sided limits

Sometimes the two sides disagree, and it is useful to name each separately.

$$\lim_{x\to a^-} f(x) = L \quad\text{means } f(x)\to L \text{ as } x \text{ approaches } a \text{ through values } x < a,$$
$$\lim_{x\to a^+} f(x) = L \quad\text{means the same through values } x > a.$$

These are the **left-hand** and **right-hand** limits. The relationship to the two-sided limit is exactly what you would guess, and it is worth stating as a theorem because it is the standard tool for showing a limit does *not* exist:

> **Theorem (two-sided = both one-sided).** $\displaystyle\lim_{x\to a} f(x) = L$ if and only if $\displaystyle\lim_{x\to a^-} f(x) = L$ and $\displaystyle\lim_{x\to a^+} f(x) = L$.

**Example.** Let $f(x) = \dfrac{|x|}{x}$ for $x \ne 0$. For $x > 0$, $|x| = x$ and $f(x) = 1$. For $x < 0$, $|x| = -x$ and $f(x) = -1$. Hence

$$\lim_{x\to 0^+} f(x) = 1, \qquad \lim_{x\to 0^-} f(x) = -1,$$

and since these differ, $\lim_{x\to0} f(x)$ does not exist. Note that both one-sided limits exist and are perfectly well behaved. Non-existence of the two-sided limit is a statement about disagreement, not about wildness.

**Example (a piecewise function).** Let

$$f(x) = \begin{cases} x^2, & x < 2, \\ 3, & x = 2, \\ 6 - x, & x > 2.\end{cases}$$

From the left, $f(x) = x^2 \to 4$. From the right, $f(x) = 6-x \to 4$. Both sides agree, so $\lim_{x\to2} f(x) = 4$ — even though $f(2) = 3$. Once again the value at the point is irrelevant to the limit. (It is highly relevant to *continuity*, which is section 7's business, and this function is exactly the kind that fails it.)

### 2.4 Three ways a limit can fail to exist

There are exactly three, and the classification is worth memorising because it tells you what to look for.

**Jump.** The one-sided limits both exist but differ. Example: $|x|/x$ at $0$, above. Also the step function, and anything defined piecewise with mismatched pieces.

**Blow-up.** The values grow without bound. Example: $f(x) = 1/x^2$ near $0$. As $x \to 0$ from either side, $f(x)$ exceeds every bound: at $x = 0.001$, $f = 10^6$; at $x = 10^{-6}$, $f = 10^{12}$. There is no number $L$ that the values approach, because they approach no number at all. We write $\lim_{x\to0} 1/x^2 = +\infty$, which is a statement *about the manner of the failure*, not a claim that the limit exists. Section 6 makes this precise.

**Oscillation.** The values fail to settle. Example: $f(x) = \sin(\pi/x)$ near $0$. As $x \to 0$, the argument $\pi/x$ races off to infinity, and the sine completes infinitely many full cycles in any interval $(0, \delta)$ however small. The values take every number in $[-1, 1]$ infinitely often, arbitrarily close to $0$. No single $L$ can be approached.

```checkpoint
q: A function $f$ satisfies $f(3) = 10$, and $\lim_{x\to3} f(x) = 4$. Which is true?
a*: This is entirely possible; the limit ignores the value at the point.
a: This is impossible, because a limit must equal the function's value.
x: That is the definition of *continuity*, not of a limit, and continuity is an extra condition that many functions fail. The limit clause "as $x$ approaches $a$, but $x \ne a$" excludes the point itself by design — which is what allows the difference quotient, undefined at $h = 0$, to have a limit at all.
a: This is impossible, because the limit must be $10$ or not exist.
x: The limit is determined entirely by the values of $f$ at points *near* $3$ and not at $3$. Redefining $f(3)$ to be $10$, or $-500$, or leaving it undefined, changes none of those nearby values, so it cannot change the limit.
a: This is possible only if $f$ is discontinuous everywhere.
x: One point of mismatch makes $f$ discontinuous *at $x = 3$* and says nothing about any other point. The function equal to $x+1$ everywhere except at $x = 3$, where it equals $10$, is continuous at every point but one.
hint: Which of the three quantities — $f(3)$, the limit, and the behaviour near $3$ — does the definition of limit actually mention?
why: The limit describes approach, not arrival. $f(a)$ may be different from the limit, or undefined; both are consistent with the limit existing. Precisely this independence is what lets us define the derivative as the limit of a quotient that is undefined at the point of interest.

---

q: For $f(x) = \dfrac{|x-2|}{x-2}$, what is $\lim_{x\to2} f(x)$?
a*: It does not exist, because the left limit is $-1$ and the right limit is $+1$.
a: It equals $1$.
x: That is the right-hand limit only. For $x > 2$ we have $|x-2| = x-2$ and the quotient is $1$; but for $x < 2$ we have $|x-2| = -(x-2)$ and the quotient is $-1$. A two-sided limit requires both sides to agree.
a: It equals $0$, by symmetry.
x: There is no averaging rule for limits. When the two one-sided limits differ, the two-sided limit fails to exist; it does not take the mean, the midpoint, or any other compromise value.
a: It equals $+\infty$.
x: The function only ever takes the values $+1$ and $-1$, so it is bounded and cannot blow up. This is a jump discontinuity, not a blow-up.
hint: Split into the cases $x > 2$ and $x < 2$ and simplify $|x-2|$ in each.
why: Splitting at the point where the absolute value changes sign gives $f(x) = 1$ for $x>2$ and $f(x)=-1$ for $x<2$. Both one-sided limits exist; they disagree; therefore the two-sided limit does not exist. This is the "jump" failure mode.

---

q: Which of these limits fails to exist by *oscillation* rather than by a jump or a blow-up?
a*: $\lim_{x\to0}\sin(1/x)$
a: $\lim_{x\to0} 1/x^2$
x: This one fails by blow-up: the values increase past every bound as $x \to 0$ from either side. It is customary to write the limit as $+\infty$ to record *how* it fails, but that is not an existing limit.
a: $\lim_{x\to0} |x|/x$
x: This one fails by a jump: the left limit is $-1$, the right limit is $+1$, both perfectly well-defined and finite, but unequal.
a: $\lim_{x\to0} (x^2-x)/x$
x: This limit exists. For $x \ne 0$, $(x^2-x)/x = x-1$, which approaches $-1$. The $0/0$ form at $x=0$ is removable by cancellation, exactly as in the secant-slope computation.
hint: Oscillation means the values keep taking a whole range of values without settling, no matter how close you get.
why: As $x\to0$, the argument $1/x$ runs off to infinity and $\sin(1/x)$ completes infinitely many cycles in every interval $(0,\delta)$. The values sweep all of $[-1,1]$ infinitely often arbitrarily near $0$, so they approach no single number. The function is bounded — so this is not blow-up — and has no one-sided limits either — so it is not a jump.

---

q: The secant slopes of $y = x^2$ at the point $(1,1)$ are given by $m(h) = \dfrac{(1+h)^2-1}{h}$. Why is it legitimate to simplify this to $2+h$?
a*: Because the limit process only ever uses $h \ne 0$, and for $h \ne 0$ the cancellation of $h$ is ordinary algebra.
a: Because $h$ is so small that the $h^2$ term can be neglected.
x: No approximation is being made. The identity $m(h) = 2+h$ is exact for every non-zero $h$ — check $h=1$: $m(1) = (4-1)/1 = 3 = 2+1$. Neglecting terms would give an approximate tangent slope; the limit gives the exact one.
a: Because $0/0$ can be assigned the value $1$.
x: $0/0$ is not assigned any value, here or anywhere. The point of the algebra is to rewrite the quotient in a form where the offending $h$ in the denominator is gone *before* any limit is taken.
a: Because $m$ is continuous at $h = 0$.
x: This reverses the logic. $m$ is not even defined at $h=0$, so continuity there is not available as a premise; it is only after finding the limit that one could extend $m$ to a continuous function by defining $m(0)=2$.
hint: What does the definition of the limit say about whether $h$ is ever allowed to equal $0$?
why: Expanding gives $m(h) = (2h+h^2)/h = h(2+h)/h$. Dividing numerator and denominator by $h$ is valid exactly when $h \ne 0$, and the limit process never evaluates at $h = 0$. So $m(h) = 2+h$ holds throughout the region the limit examines, and the limit of $2+h$ is plainly $2$.
```

## 3. Why tables are evidence and not proof

Numerical tables built the intuition in sections 1 and 2, and they should be trusted about as far as any experiment is trusted: they suggest, and they catch mistakes, but they do not establish. Two examples show why, and they fail in different ways — one is a failure of the mathematics, the other a failure of the arithmetic.

### 3.1 A table that lies about the mathematics

Consider $f(x) = \sin(\pi/x)$ near $x = 0$, and build the table the obvious way, by decimal steps:

| $x$ | $\pi/x$ | $f(x) = \sin(\pi/x)$ |
|---|---|---|
| $0.1$ | $10\pi$ | $0$ |
| $0.01$ | $100\pi$ | $0$ |
| $0.001$ | $1000\pi$ | $0$ |
| $0.0001$ | $10000\pi$ | $0$ |

A confident reader concludes $\lim_{x\to0}\sin(\pi/x) = 0$. The conclusion is false. Every sampled $x$ has the form $x = 1/n$ with $n$ a whole number, so $\pi/x = n\pi$, and the sine of any whole multiple of $\pi$ is exactly $0$. The table sampled precisely the zeros and nothing else.

Sample differently. Take $x = \dfrac{2}{4k+1}$, so that $\pi/x = \left(2k + \tfrac12\right)\pi$ and $\sin(\pi/x) = 1$ exactly. With $k = 250$ this gives $x = 2/1001 = 0.001998\ldots$, comfortably closer to zero than the third row of the table above — and there $f(x) = 1$, not $0$.

So arbitrarily close to $0$ the function takes the value $0$, and also the value $1$, and by similar choices every value in $[-1,1]$. The limit does not exist. No table would have revealed this, because a table samples countably many points and the failure lives in what happens between them.

The lesson is not that tables are useless. It is that a table tells you about the points you sampled, and a limit is a claim about *all* points near $a$. Bridging that gap requires an argument.

### 3.2 A table that lies about the arithmetic

The second failure is subtler and afflicts anyone computing numerically. Consider

$$\lim_{x\to0} \frac{1-\cos x}{x^2},$$

whose true value is $\tfrac12$ (proved in section 5). Computed in ordinary double-precision floating point:

| $x$ | computed $(1-\cos x)/x^2$ |
|---|---|
| $10^{-1}$ | $0.499583$ |
| $10^{-2}$ | $0.4999958$ |
| $10^{-4}$ | $0.499999997$ |
| $10^{-6}$ | $0.500044$ |
| $10^{-7}$ | $0.499600$ |
| $10^{-8}$ | $0$ |

The values converge nicely to $0.5$, then reverse, then collapse to exactly zero. Nothing is wrong with the mathematics; something is wrong with the machine. When $x = 10^{-8}$, $\cos x \approx 1 - 5\times10^{-17}$, and a double stores roughly sixteen significant decimal digits, so $\cos x$ rounds to exactly $1$. The numerator becomes exactly $0$, and $0/x^2 = 0$. This is **catastrophic cancellation**: subtracting two nearly equal numbers destroys the significant digits of their difference.

The same effect kills the very first table in this lecture if pushed too far. Evaluating $(x^2-1)/(x-1)$ at $x = 1 + 10^{-16}$ does not give $2.0000000000000002$; it raises a division-by-zero error, because in double precision $1 + 10^{-16}$ *is* $1$.

So: taking $x$ closer and closer to $a$ numerically eventually makes the answer worse, not better. A limit is an exact statement about the real numbers, and the real numbers are not what a computer holds. Tables belong at the start of an investigation, algebra at the end.

## 4. The limit laws

Nobody proves every limit from scratch. Almost all limits are assembled from a small stock of known ones using rules that let limits pass through arithmetic. Those rules are the **limit laws**.

### 4.1 The laws

Suppose $\lim_{x\to a} f(x) = L$ and $\lim_{x\to a} g(x) = M$, both existing and finite. Then:

1. **Sum.** $\lim_{x\to a}\big[f(x)+g(x)\big] = L+M$.
2. **Difference.** $\lim_{x\to a}\big[f(x)-g(x)\big] = L-M$.
3. **Constant multiple.** $\lim_{x\to a} c\,f(x) = cL$ for any constant $c$.
4. **Product.** $\lim_{x\to a} f(x)g(x) = LM$.
5. **Quotient.** $\lim_{x\to a} \dfrac{f(x)}{g(x)} = \dfrac{L}{M}$, **provided $M \ne 0$**.
6. **Power and root.** $\lim_{x\to a} \big[f(x)\big]^n = L^n$ for positive integers $n$, and $\lim_{x\to a}\sqrt[n]{f(x)} = \sqrt[n]{L}$ when the root is defined near $a$.

Together with the two trivial limits

$$\lim_{x\to a} c = c \qquad\text{and}\qquad \lim_{x\to a} x = a,$$

these generate an enormous amount. The proofs use the $\varepsilon$–$\delta$ definition and are deferred to the reference chapter for this node's parent; the sum law, for instance, is proved by forcing each of $|f(x)-L|$ and $|g(x)-M|$ below $\varepsilon/2$ and applying the triangle inequality. What matters at this stage is knowing exactly what each law requires.

Two of the hypotheses are load-bearing and are the source of most errors.

**Every law requires the individual limits to exist.** The sum law does not say "if the limit of the sum exists then it is the sum of the limits". Take $f(x) = 1/x$ and $g(x) = -1/x$ near $0$. Neither limit exists, yet $f+g$ is identically $0$, whose limit is $0$. The law was never applicable.

**The quotient law requires $M \ne 0$.** If $M = 0$ the law says nothing at all — not that the limit is infinite, not that it fails to exist. All three outcomes are possible, and distinguishing them is the whole art of section 4.3.

### 4.2 Direct substitution

Applying laws 1–6 repeatedly to $\lim_{x\to a} x = a$ and $\lim_{x\to a}c = c$ yields, for any polynomial $p$,

$$\lim_{x\to a} p(x) = p(a),$$

and for any rational function $r = p/q$,

$$\lim_{x\to a} r(x) = r(a) \qquad \text{provided } q(a) \ne 0.$$

This is the **direct substitution property**, and it is why most limits in a calculus course are answered in one step:

$$\lim_{x\to2} \frac{x^3 - 4x + 1}{x^2+3} = \frac{8-8+1}{4+3} = \frac{1}{7}.$$

The substitution is not "plugging in and hoping". It is the conclusion of a theorem whose hypothesis — the denominator is non-zero at $a$ — must be checked. When the hypothesis fails, substitution is illegal and the real work begins.

### 4.3 The $0/0$ toolkit

Whenever substitution produces $\tfrac{0}{0}$, the expression is called an **indeterminate form**. The name means exactly what it says: the form alone determines nothing. Compare

$$\lim_{x\to0}\frac{x^2}{x} = 0, \qquad \lim_{x\to0}\frac{x}{x} = 1, \qquad \lim_{x\to0}\frac{x}{x^2} \text{ does not exist (it blows up)}.$$

All three are $0/0$ at $x = 0$; the answers are $0$, $1$, and non-existence. So the response to $0/0$ is never to guess but to rewrite the expression into a form where substitution is legal. Three techniques cover nearly everything at this stage.

**Factor and cancel.** If substituting $x = a$ gives $0/0$ in a rational function, then $(x-a)$ divides both numerator and denominator. Cancel it and substitute again:

$$\lim_{x\to3} \frac{x^2-9}{x^2-2x-3} = \lim_{x\to3}\frac{(x-3)(x+3)}{(x-3)(x+1)} = \lim_{x\to3}\frac{x+3}{x+1} = \frac{6}{4} = \frac{3}{2}.$$

Every step before the last is an identity valid for $x \ne 3$, which is the only region the limit inspects. (Numerical check: at $x = 3.001$ the original expression evaluates to $1.4998750\ldots$, converging on $1.5$.)

**Multiply by the conjugate.** Roots resist factoring, so remove them. To evaluate

$$\lim_{x\to0}\frac{\sqrt{x+4}-2}{x},$$

multiply numerator and denominator by $\sqrt{x+4}+2$, which is non-zero near $x=0$:

$$\frac{\sqrt{x+4}-2}{x}\cdot\frac{\sqrt{x+4}+2}{\sqrt{x+4}+2} = \frac{(x+4)-4}{x\big(\sqrt{x+4}+2\big)} = \frac{x}{x\big(\sqrt{x+4}+2\big)} = \frac{1}{\sqrt{x+4}+2}.$$

Now substitution is legal: the limit is $\dfrac{1}{2+2} = \dfrac14$. (Numerically, at $x = 0.001$ the original is $0.2499844$.)

**Combine fractions.** A difference of fractions can hide a cancellation:

$$\lim_{x\to0}\frac{1}{x}\left(\frac{1}{x+2}-\frac{1}{2}\right) = \lim_{x\to0}\frac1x\cdot\frac{2-(x+2)}{2(x+2)} = \lim_{x\to0}\frac{1}{x}\cdot\frac{-x}{2(x+2)} = \lim_{x\to0}\frac{-1}{2(x+2)} = -\frac14.$$

In all three cases the pattern is identical: an algebraic identity valid on a punctured neighbourhood of $a$ replaces the original expression by one to which direct substitution applies.

```checkpoint
q: Evaluate $\displaystyle\lim_{x\to-2}\frac{x^2+x-2}{x+2}$.
a*: $-3$
a: The limit does not exist, since the denominator is zero at $x=-2$.
x: A zero denominator only blocks *direct substitution*; it does not by itself destroy the limit. Here the numerator vanishes at $x=-2$ too, so $(x+2)$ is a common factor and cancels: $x^2+x-2 = (x+2)(x-1)$.
a: $0$
x: This is the value of the *numerator's* limit, not of the quotient's. Both numerator and denominator tend to $0$, and a $0/0$ form has no automatic value — it must be resolved by rewriting.
a: $3$
x: A sign slip. After cancelling, the expression is $x-1$; at $x=-2$ that is $-2-1 = -3$, not $+3$.
hint: Factor the numerator and look for a common factor with the denominator.
why: Since substitution gives $0/0$, the factor $(x+2)$ divides the numerator: $x^2+x-2=(x+2)(x-1)$. For $x\ne-2$ the quotient equals $x-1$, and $\lim_{x\to-2}(x-1) = -3$. The cancellation is valid on exactly the punctured neighbourhood the limit examines.

---

q: $\lim_{x\to1} f(x)$ does not exist and $\lim_{x\to1} g(x)$ does not exist. What can be concluded about $\lim_{x\to1}\big[f(x)+g(x)\big]$?
a*: Nothing — it may exist or may fail to exist, depending on $f$ and $g$.
a: It cannot exist, by the sum law.
x: The sum law has the form "if both limits exist, then …". It says nothing when a hypothesis fails, and in logic a conditional with a false hypothesis yields no conclusion. Concretely, $f(x)=1/(x-1)$ and $g(x)=-1/(x-1)$ both fail to have limits at $1$, yet $f+g$ is identically $0$.
a: It exists and equals $0$.
x: That is true for the specific cancelling pair above but not in general. Take $f = g = 1/(x-1)$: then $f+g = 2/(x-1)$, whose limit at $1$ also fails to exist.
a: It exists if and only if $f$ and $g$ are both bounded.
x: Boundedness is not sufficient. Take $f(x)=\sin(1/(x-1))$ and $g(x)=\sin(1/(x-1))$: both are bounded, neither has a limit at $1$, and their sum $2\sin(1/(x-1))$ has none either.
hint: The limit laws are conditionals. What does a conditional tell you when its hypothesis is false?
why: Each limit law assumes the individual limits exist; with that assumption withdrawn the law is silent. Both outcomes are realisable: $1/(x-1)$ plus $-1/(x-1)$ has limit $0$, while $1/(x-1)$ plus itself has no limit. This is why one may never apply a limit law "in reverse" to split a limit that is known to exist.

---

q: Evaluate $\displaystyle\lim_{x\to0}\frac{\sqrt{x+1}-1}{x}$.
a*: $1/2$
a: $0$
x: This is what you would get by substituting $x=0$ in the numerator alone. The denominator also vanishes, so the form is $0/0$ and has no value until the expression is rewritten.
a: $1$
x: Likely from treating $\sqrt{x+1}-1$ as $x$ for small $x$. The correct first-order behaviour is $\sqrt{1+x}\approx 1+\tfrac{x}{2}$, so the numerator behaves like $x/2$, not $x$ — hence the factor of one half.
a: The limit does not exist.
x: It does exist. Multiplying by the conjugate turns the expression into one that is perfectly well behaved at $x=0$; nothing here jumps, blows up, or oscillates.
hint: Multiply numerator and denominator by $\sqrt{x+1}+1$.
why: $\dfrac{\sqrt{x+1}-1}{x}\cdot\dfrac{\sqrt{x+1}+1}{\sqrt{x+1}+1} = \dfrac{x}{x(\sqrt{x+1}+1)} = \dfrac{1}{\sqrt{x+1}+1}$ for $x \ne 0$, and substituting $x=0$ now gives $1/2$. Numerically the original expression reads $0.4880885$ at $x=0.1$ and $0.4998751$ at $x=0.001$, converging on $0.5$.
```

## 5. The squeeze theorem

Factoring and conjugates handle algebraic expressions. They are useless against $\sin x / x$, because there is nothing to factor. For that we need a comparison method.

### 5.1 The statement

> **Squeeze theorem.** Suppose $g(x) \le f(x) \le h(x)$ for all $x$ in some open interval containing $a$, except possibly at $a$ itself. If $\displaystyle\lim_{x\to a} g(x) = \lim_{x\to a} h(x) = L$, then $\displaystyle\lim_{x\to a} f(x) = L$.

The picture is exactly the name: $f$ is trapped between two functions that are converging on the same value, so $f$ has nowhere else to go. Note what is *not* required — $f$ need not be continuous, monotone, or even recognisable. The inequalities and the two outer limits are the entire hypothesis.

### 5.2 A function no other method reaches

Evaluate $\lim_{x\to0} x^2\sin(1/x)$.

The product law is unavailable: $\lim_{x\to0}\sin(1/x)$ does not exist, as section 3.1 showed. But sine is bounded — $-1 \le \sin\theta\le 1$ for every $\theta$ — so for every $x \ne 0$,

$$-x^2 \ \le\ x^2\sin(1/x)\ \le\ x^2 .$$

(The multiplication by $x^2 \ge 0$ preserves the inequalities.) Both outer functions tend to $0$ as $x\to0$, so by the squeeze theorem

$$\lim_{x\to0} x^2\sin(1/x) = 0.$$

Numerically the trapped function reads $-5.440\times10^{-3}$ at $x=0.1$, $-5.064\times10^{-5}$ at $x=0.01$ and $8.269\times10^{-7}$ at $x=0.001$ — note the erratic signs, the mark of the oscillating factor, and note that each value sits inside the bound $x^2$.

{{image: Squeeze theorem | A function trapped between an upper and a lower bound that converge on the same value at a point. Because the outer two functions agree in the limit, the function between them has no freedom left and must share that limit, regardless of how it behaves in between — it may oscillate infinitely often, as $x^2\sin(1/x)$ does, and still be forced to converge. The theorem is the standard route to limits that no algebraic manipulation reaches, above all $\sin x / x$ at zero.}}

### 5.3 The fundamental trigonometric limit

The limit

$$\lim_{x\to0}\frac{\sin x}{x} = 1 \qquad (x \text{ in radians})$$

is the one on which the whole differential calculus of the trigonometric functions rests. The table is persuasive:

| $x$ (rad) | $\sin x / x$ |
|---|---|
| $1$ | $0.8414710$ |
| $0.5$ | $0.9588511$ |
| $0.1$ | $0.9983342$ |
| $0.01$ | $0.9999833$ |
| $0.001$ | $0.9999998$ |

and the geometry proves it. Take $0 < x < \pi/2$ and work in the unit circle. Let $O$ be the centre, $A$ the point $(1,0)$, and $P$ the point at angle $x$, so $P = (\cos x, \sin x)$. Let $T$ be the point where the tangent at $A$ meets the ray $OP$, so $T = (1, \tan x)$. Compare three regions:

- triangle $OAP$ has area $\tfrac12\cdot 1\cdot \sin x = \tfrac{\sin x}{2}$;
- circular sector $OAP$ has area $\tfrac12 r^2 x = \tfrac{x}{2}$ (this is where radians are essential);
- triangle $OAT$ has area $\tfrac12\cdot1\cdot\tan x = \tfrac{\tan x}{2}$.

The triangle $OAP$ sits inside the sector, which sits inside the triangle $OAT$, so

$$\frac{\sin x}{2}\ \le\ \frac{x}{2}\ \le\ \frac{\tan x}{2} \qquad\Longrightarrow\qquad \sin x \le x \le \frac{\sin x}{\cos x}.$$

Divide throughout by $\sin x$, which is positive for $0 < x < \pi/2$:

$$1 \le \frac{x}{\sin x}\le \frac{1}{\cos x} \qquad\Longrightarrow\qquad \cos x \ \le\ \frac{\sin x}{x}\ \le\ 1 .$$

As $x \to 0^+$, $\cos x \to 1$, so the squeeze theorem forces $\sin x / x \to 1$. For $x<0$ substitute $x = -u$: both $\sin x$ and $x$ change sign, so $\sin x / x$ is unchanged — the function is even — and the left-hand limit equals the right-hand one. Hence the two-sided limit is $1$. $\blacksquare$

Two consequences follow immediately and are worth recording.

**The half.** Using the conjugate trick together with the result just proved,

$$\frac{1-\cos x}{x^2} = \frac{1-\cos x}{x^2}\cdot\frac{1+\cos x}{1+\cos x} = \frac{1-\cos^2x}{x^2(1+\cos x)} = \frac{\sin^2 x}{x^2(1+\cos x)} = \left(\frac{\sin x}{x}\right)^2\cdot\frac{1}{1+\cos x},$$

whose limit is $1^2 \cdot \tfrac{1}{1+1} = \tfrac12$. The numerical table in section 3.2 agrees — right up to the point where floating point destroys it.

**The tangent.** $\dfrac{\tan x}{x} = \dfrac{\sin x}{x}\cdot\dfrac{1}{\cos x} \to 1\cdot 1 = 1$. Numerically, $1.0033467$ at $x=0.1$ and $1.0000003$ at $x=0.001$.

A warning about the proof: it uses that the sector's area is $x/2$, which is true only when $x$ is measured in radians. In degrees the same limit is $\pi/180 \approx 0.01745$, and every derivative formula for the trigonometric functions would acquire that constant. This is the entire reason calculus uses radians.

## 6. Infinite limits and limits at infinity

Two different uses of the infinity symbol appear, and confusing them is a standard error.

### 6.1 Infinite limits: vertical asymptotes

We write $\lim_{x\to a} f(x) = +\infty$ to mean: $f(x)$ exceeds every bound you name, for all $x$ sufficiently close to $a$ (with $x \ne a$). This is a description of divergence, not an existing limit; $+\infty$ is not a number and cannot be substituted into the limit laws.

The standard example is $f(x) = 1/x^2$ at $a = 0$, where the values pass $10^6$ by $x = 10^{-3}$ and $10^{12}$ by $x = 10^{-6}$, from both sides. So $\lim_{x\to0} 1/x^2 = +\infty$.

Sides can differ. For $f(x) = 1/x$,

$$\lim_{x\to0^+}\frac1x = +\infty, \qquad \lim_{x\to0^-}\frac1x = -\infty,$$

because a small positive divisor gives a large positive quotient and a small negative divisor a large negative one. The line $x=0$ is a **vertical asymptote** in both cases; the two-sided limit exists in neither.

The practical rule: if substitution yields (non-zero)$/0$, the limit is infinite, and the sign is settled by testing the sign of the denominator just to the left and just to the right of $a$. For

$$\lim_{x\to3^+}\frac{x+1}{x-3},$$

the numerator tends to $4 > 0$, and for $x$ slightly greater than $3$ the denominator is small and positive, so the quotient is large and positive: $+\infty$. Approaching from the left, the denominator is small and negative, giving $-\infty$.

### 6.2 Limits at infinity: horizontal asymptotes

We write $\lim_{x\to\infty} f(x) = L$ to mean: $f(x)$ can be made as close to $L$ as we please by taking $x$ sufficiently large. Here the limit is an ordinary number, and the laws apply to it normally. The graph then has a **horizontal asymptote** $y = L$.

The basic fact is that

$$\lim_{x\to\infty}\frac{1}{x^{k}} = 0 \quad\text{for every } k>0,$$

and the standard technique for rational functions is to divide numerator and denominator by the highest power of $x$ present in the denominator:

$$\lim_{x\to\infty}\frac{3x^2-x}{2x^2+5} = \lim_{x\to\infty}\frac{3-\frac1x}{2+\frac{5}{x^2}} = \frac{3-0}{2+0} = \frac32.$$

(Numerically: $1.414634$ at $x=10$, $1.494626$ at $x=100$, $1.499950$ at $x=10^4$ — convergence is real but unhurried.) The same manoeuvre gives the general rule for a rational function: compare the degree of the numerator, $n$, with that of the denominator, $m$. If $n<m$ the limit is $0$; if $n=m$ it is the ratio of leading coefficients; if $n>m$ the function grows without bound.

### 6.3 Two harder cases

**A difference that hides a quotient.** Evaluate $\lim_{x\to\infty}\big(\sqrt{x^2+x}-x\big)$. This is an $\infty-\infty$ form, which is indeterminate — the two terms both grow without bound, and the answer depends on how fast. Multiply by the conjugate:

$$\sqrt{x^2+x}-x = \frac{(x^2+x)-x^2}{\sqrt{x^2+x}+x} = \frac{x}{\sqrt{x^2+x}+x} = \frac{1}{\sqrt{1+\frac1x}+1}\ \longrightarrow\ \frac{1}{1+1}=\frac12,$$

dividing through by $x>0$ at the last step. Numerically: $0.488088$ at $x=10$, $0.498756$ at $x=100$, $0.499988$ at $x=10^4$.

**A bounded factor.** Evaluate $\lim_{x\to\infty}\dfrac{\sin x}{x}$. Do not confuse this with section 5.3; there $x\to0$ and the answer was $1$. Here the numerator oscillates between $-1$ and $1$ forever while the denominator grows, so

$$-\frac{1}{x}\ \le\ \frac{\sin x}{x}\ \le\ \frac1x \qquad (x>0),$$

and the squeeze theorem gives the limit $0$. The squeeze theorem works unchanged for limits at infinity.

### 6.4 The indeterminate forms

It is worth naming the whole family, because recognising one is the signal that substitution has failed and rewriting is required. The forms are

$$\frac{0}{0}, \qquad \frac{\infty}{\infty}, \qquad 0\cdot\infty, \qquad \infty-\infty, \qquad 1^{\infty}, \qquad 0^{0}, \qquad \infty^{0}.$$

In each case the symbols describe how the *parts* behave and determine nothing about the whole. Section 4.3 gave three limits of the form $0/0$ with answers $0$, $1$ and non-existence; section 6.3 gave an $\infty-\infty$ whose answer was $\tfrac12$, and $\sqrt{x^2+2x}-x$ would have given $1$ by the same method. Every value is attainable.

What is *not* indeterminate is equally worth knowing, since these need no work at all. If the numerator tends to a non-zero number and the denominator to $0$, the quotient blows up — that is section 6.1, not an indeterminate form. If the numerator tends to $0$ and the denominator to a non-zero number, the quotient tends to $0$. And $\infty + \infty = \infty$: two quantities both growing without bound have a sum that grows without bound, with no ambiguity, because there is no cancellation available. Ambiguity arises exactly where two competing effects pull in opposite directions, and the resolution always consists of finding which one wins and by how much.

Three of the seven forms — $1^\infty$, $0^0$, $\infty^0$ — are exponential, and the standard treatment is to take logarithms, converting them into $0\cdot\infty$ and then into $0/0$. Lecture 3 supplies l'Hôpital's rule, which handles $0/0$ and $\infty/\infty$ mechanically once derivatives are available; until then, algebra and the squeeze theorem are the only tools, and they suffice for everything in this lecture.

## 7. Continuity

Direct substitution — the rule that made most of section 4 easy — is precisely the statement that a function is continuous. It deserves its own name and definition.

### 7.1 The definition

> **Definition.** $f$ is **continuous at $a$** if $\displaystyle\lim_{x\to a} f(x) = f(a)$.

Compact as it is, this single equation asserts three separate things, and a function can fail at any one of them:

1. $f(a)$ is defined (i.e. $a$ is in the domain of $f$);
2. $\lim_{x\to a} f(x)$ exists;
3. the two are equal.

A function is **continuous on an interval** if it is continuous at every point of the interval, using one-sided limits at the endpoints. The informal picture — "the graph has no breaks; it can be drawn without lifting the pen" — is a good guide for the functions met in a first course, and is not to be trusted as a definition. (There exist functions continuous everywhere and differentiable nowhere, whose graphs cannot be drawn at all.)

### 7.2 The catalogue of discontinuities

**Removable.** The limit exists but does not equal $f(a)$, either because $f(a)$ is undefined or because it is defined to the wrong value. Example: $f(x) = \dfrac{x^2-1}{x-1}$ at $x=1$. The name is literal — defining $f(1) = 2$ removes the discontinuity, since the limit was already $2$.

**Jump.** Both one-sided limits exist and differ, so no redefinition of $f(a)$ can help. Example: $|x|/x$ at $0$. The gap between the two one-sided limits is the size of the jump, here $2$.

**Infinite.** The function blows up at $a$; there is a vertical asymptote. Example: $1/x$ at $0$, or $\tan x$ at $\pi/2$.

**Oscillatory.** The limit fails by oscillation. Example: $\sin(1/x)$ at $0$, however $f(0)$ is defined.

Only the first is repairable, which is why it is usually the only one worth naming when solving problems.

### 7.3 Building continuous functions

Rather than test continuity point by point, one assembles it. The limit laws immediately give:

> If $f$ and $g$ are continuous at $a$, then so are $f+g$, $f-g$, $cf$, $fg$, and $f/g$ — the last provided $g(a)\ne0$.

And the composition rule, which needs the limit laws plus a short argument:

> If $g$ is continuous at $a$ and $f$ is continuous at $g(a)$, then $f\circ g$ is continuous at $a$; equivalently $\displaystyle\lim_{x\to a} f\big(g(x)\big) = f\Big(\lim_{x\to a} g(x)\Big)$.

That last equation — that continuous functions may be moved through a limit sign — is used constantly and is worth recognising in that form.

From the base cases that polynomials, $\sin$, $\cos$, $\exp$, and $|x|$ are continuous everywhere, and that $\sqrt{\phantom{x}}$ is continuous on $[0,\infty)$ and $\ln$ on $(0,\infty)$, one concludes that essentially every function written down in a first course is continuous wherever it is defined. Consequently:

$$\lim_{x\to2}\sqrt{\frac{x^3+1}{x-1}} = \sqrt{\frac{9}{1}} = 3,$$

with the only check required being that the inside expression is defined and positive at $x=2$, which it is.

### 7.4 Fitting a constant

A standard exercise, and a genuinely useful skill: choose a parameter so that a piecewise function is continuous. Let

$$f(x) = \begin{cases} x^2 + c, & x \le 3,\\ 2x + 1, & x > 3,\end{cases}$$

and find $c$ making $f$ continuous at $3$.

Away from $x=3$ each piece is a polynomial and hence continuous, so only the junction matters. Compute the three quantities the definition needs:

$$\lim_{x\to3^-} f(x) = 9 + c, \qquad \lim_{x\to3^+} f(x) = 7, \qquad f(3) = 9+c.$$

Continuity requires all three equal, so $9 + c = 7$, giving $c = -2$. With that value the limit exists and matches $f(3) = 7$. For any other $c$ the function has a jump discontinuity of size $|9+c-7| = |c+2|$.

```checkpoint
q: The function $f(x) = \dfrac{x^2-4}{x-2}$ has what kind of discontinuity at $x=2$?
a*: Removable — the limit exists ($4$) but $f(2)$ is undefined.
a: A jump discontinuity.
x: A jump requires the two one-sided limits to exist and *differ*. Here both equal $4$, since $f(x) = x+2$ for every $x \ne 2$. Nothing jumps.
a: An infinite discontinuity.
x: An infinite discontinuity requires the values to grow without bound near the point. Here $f(x) = x+2$ near $x=2$, which is bounded and close to $4$; the zero denominator is cancelled by a zero numerator.
a: None — $f$ is continuous at $x=2$.
x: Continuity at $2$ requires $f(2)$ to be defined, and it is not: substituting gives $0/0$. The discontinuity is real, merely repairable by *defining* $f(2)=4$.
hint: Check each of the three conditions in the definition of continuity separately.
why: For $x\ne2$, $f(x) = \frac{(x-2)(x+2)}{x-2} = x+2$, so $\lim_{x\to2}f(x)=4$. Condition 2 holds and condition 1 fails, which is exactly the removable case: extending $f$ by $f(2)=4$ produces a function continuous everywhere.

---

q: For which value of $c$ is $f(x) = \begin{cases} cx + 1, & x \le 2\\ x^2 - 3, & x > 2\end{cases}$ continuous at $x = 2$?
a*: $c = 0$
a: $c = 1$
x: With $c=1$ the left limit is $2+1 = 3$ while the right limit is $4-3 = 1$. These disagree, so the function still jumps at $x=2$.
a: $c = -1$
x: With $c=-1$ the left limit is $-2+1 = -1$ and the right limit is $1$; a jump of size $2$ remains. Check by equating the two expressions at $x=2$ before choosing a sign.
a: No value of $c$ works.
x: A value does exist. Matching the two one-sided limits gives the linear equation $2c+1 = 1$, whose coefficient of $c$ is $2 \ne 0$, so it has exactly one solution. A piecewise definition fails to be repairable only when the parameter cancels out of the matching equation, which does not happen here.
hint: Set the two one-sided limits equal and solve for $c$; then check $f(2)$ agrees.
why: $\lim_{x\to2^-}f(x) = 2c+1$ and $\lim_{x\to2^+}f(x) = 2^2-3 = 1$. Equating gives $2c+1 = 1$, so $c=0$. Then $f(2) = 0\cdot2+1 = 1$, matching the common limit, so all three conditions of the definition hold.

---

q: $f$ is continuous on $[0,4]$ with $f(0) = -3$ and $f(4) = 5$. Which conclusion is guaranteed?
a*: $f(c) = 0$ for at least one $c$ in $(0,4)$.
a: $f(c)=0$ for exactly one $c$ in $(0,4)$.
x: The Intermediate Value Theorem guarantees at least one crossing, never uniqueness. A continuous function can wander up and down and cross zero three, five, or infinitely many times while still running from $-3$ to $5$. Uniqueness would need an extra hypothesis such as strict monotonicity.
a: $f$ is increasing on $[0,4]$.
x: The endpoint values only say the function ends higher than it started. It may dip to $-100$ at $x=1$ and climb thereafter, and remain continuous throughout.
a: $f(c) = 6$ for some $c$ in $(0,4)$.
x: The theorem only supplies values *between* $f(0)$ and $f(4)$ — that is, in $(-3,5)$. The value $6$ lies outside that interval, and nothing forces $f$ to reach it, though nothing forbids it either.
hint: State exactly what the Intermediate Value Theorem promises, and what it does not.
why: $0$ lies strictly between $f(0)=-3$ and $f(4)=5$, and $f$ is continuous on the closed interval, so the IVT supplies at least one $c\in(0,4)$ with $f(c)=0$. The theorem is an existence statement: it locates no root, counts no roots, and says nothing about behaviour between the endpoints.
```

## 8. What continuity buys: two existence theorems

Continuity is worth defining because it has consequences that fail without it. Two are indispensable, and both are *existence* theorems: each guarantees that some point exists without saying where.

### 8.1 The Intermediate Value Theorem

> **IVT.** If $f$ is continuous on the closed interval $[a,b]$ and $N$ is any number strictly between $f(a)$ and $f(b)$, then there is at least one $c$ in $(a,b)$ with $f(c) = N$.

Informally: a continuous function cannot get from one value to another without passing through everything in between. Both hypotheses are needed. The step function $f(x) = 0$ for $x<1$, $f(x)=1$ for $x\ge1$ runs from $0$ to $1$ on $[0,2]$ but never takes the value $\tfrac12$ — it is not continuous. And $f(x) = 1/x$ on $[-1,1]$ takes the values $-1$ and $1$ but is never $0$ — it is not defined, hence not continuous, at $0$.

The commonest use is to prove that an equation has a solution.

**Example.** Show $x^3 - x - 1 = 0$ has a root between $1$ and $2$.

Let $f(x) = x^3-x-1$, a polynomial and therefore continuous everywhere. Then $f(1) = 1-1-1 = -1 < 0$ and $f(2) = 8-2-1 = 5 > 0$. Since $0$ lies between $-1$ and $5$, the IVT supplies a $c \in (1,2)$ with $f(c)=0$. $\blacksquare$

Notice what the proof does not do: it does not find $c$. It proves a root exists. That is often exactly what is wanted — before hunting for a solution numerically, one would like to know there is one.

### 8.2 Bisection: turning the theorem into a method

The IVT can be applied repeatedly to trap the root. Test the midpoint of the bracket, and keep whichever half still has a sign change across it.

| step | bracket | midpoint $m$ | $f(m)$ | new bracket |
|---|---|---|---|---|
| start | $[1, 2]$ | — | — | $f(1)=-1$, $f(2)=5$ |
| 1 | $[1, 2]$ | $1.5$ | $+0.875$ | $[1, 1.5]$ |
| 2 | $[1, 1.5]$ | $1.25$ | $-0.29688$ | $[1.25, 1.5]$ |
| 3 | $[1.25, 1.5]$ | $1.375$ | $+0.22461$ | $[1.25, 1.375]$ |
| 4 | $[1.25, 1.375]$ | $1.3125$ | $-0.05151$ | $[1.3125, 1.375]$ |

Each step halves the uncertainty, so after $n$ steps the bracket has width $(b-a)/2^n$; here $2^{-n}$. Ten steps give the root to within $0.001$. The true value is $1.3247180$ to seven places, comfortably inside the fourth bracket.

The same method solves $\cos x = x$: set $g(x) = \cos x - x$, note $g(0) = 1 > 0$ and $g(1) = \cos 1 - 1 \approx -0.4597 < 0$, and bisect to find the root $0.7390851$.

Bisection is slow — one bit of accuracy per step — and Lecture 3 will develop Newton's method, which uses the derivative and roughly doubles the number of correct digits per step. But bisection needs nothing but continuity and a sign change, and it never fails.

### 8.3 The Extreme Value Theorem

> **EVT.** If $f$ is continuous on a **closed, bounded** interval $[a,b]$, then $f$ attains an absolute maximum and an absolute minimum on $[a,b]$: there exist $c,d\in[a,b]$ with $f(d) \le f(x)\le f(c)$ for all $x \in [a,b]$.

Every hypothesis is essential, and the counterexamples are short:

- **Drop closedness.** $f(x) = x$ on the open interval $(0,1)$ is continuous and bounded, but attains neither a maximum nor a minimum: for any $x\in(0,1)$ there is a larger and a smaller one still in the interval.
- **Drop boundedness.** $f(x)=x$ on $[0,\infty)$ has a minimum but no maximum.
- **Drop continuity.** $f(x) = 1/x$ for $x\in(0,1]$ with $f(0)=0$ is defined on the closed bounded interval $[0,1]$ but is unbounded, so has no maximum.

The EVT is what makes the standard optimisation procedure of Lecture 3 legitimate. That procedure — evaluate the function at every critical point and at both endpoints, and take the largest and smallest values found — presupposes that a largest and smallest value exist. The EVT is what supplies that guarantee, and it is the reason optimisation problems are always posed on closed intervals.

## 9. $\varepsilon$–$\delta$: making "close" precise

Everything so far has run on the phrase "as close as we please". It has served well, but it is not mathematics: it contains no test that could be applied to decide a doubtful case. The formal definition supplies the test. It is placed last deliberately — it is the answer to the question the preceding eight sections have been asking, and it is nearly meaningless before that question is felt.

### 9.1 The definition, and how to read it

> **Definition.** $\displaystyle\lim_{x\to a} f(x) = L$ means: for every $\varepsilon > 0$ there exists $\delta>0$ such that
> $$0 < |x-a| < \delta \implies |f(x)-L| < \varepsilon.$$

Translate each symbol. $|f(x)-L|<\varepsilon$ says "the output is within $\varepsilon$ of $L$". $|x-a|<\delta$ says "the input is within $\delta$ of $a$", and the extra $0 < |x-a|$ says "and $x$ is not $a$ itself" — the exclusion from section 2.1, now written down.

Read the quantifiers as a game between two players. An adversary picks a tolerance $\varepsilon$ on the output, as small and as hostile as they like. You must respond with a radius $\delta$ on the input, and you win the round if every $x$ within $\delta$ of $a$ (other than $a$) lands within $\varepsilon$ of $L$. The limit equals $L$ precisely when you have a winning strategy — a rule producing a valid $\delta$ for *every* $\varepsilon$ the adversary might name.

Two structural points follow directly.

**$\delta$ depends on $\varepsilon$, and generally must.** Tighter output tolerance forces a tighter input window. A single $\delta$ good for all $\varepsilon$ would force $f$ to be constant near $a$.

**Any smaller $\delta$ also works.** If a given $\delta$ succeeds then so does $\delta/2$, since the set of $x$ it admits is smaller. So one never needs the *best* $\delta$ — only *some* $\delta$. This is what makes proofs manageable: crude estimates are perfectly acceptable.

### 9.2 A linear example

**Claim.** $\displaystyle\lim_{x\to1}(4x-3) = 1$.

*Scratch work* (not part of the proof, but how one finds $\delta$). Measure the output gap:

$$|(4x-3)-1| = |4x-4| = 4|x-1|.$$

To force this below $\varepsilon$ it suffices that $|x-1| < \varepsilon/4$. That tells us what to choose.

*Proof.* Let $\varepsilon>0$ be given. Choose $\delta = \varepsilon/4$. Then whenever $0<|x-1|<\delta$,

$$|(4x-3)-1| = 4|x-1| < 4\delta = 4\cdot\frac{\varepsilon}{4} = \varepsilon. \qquad\blacksquare$$

The structure is universal: the scratch work runs the inequality *backwards* from the target to find $\delta$; the proof runs it *forwards* from the assumption to the conclusion. Only the forward direction is written up.

For a concrete instance, take $\varepsilon = 0.01$: then $\delta = 0.0025$, and any $x$ within $0.0025$ of $1$ gives an output within $0.01$ of $1$.

### 9.3 A quadratic example, where $\delta$ is not just a formula

**Claim.** $\displaystyle\lim_{x\to2} x^2 = 4$.

*Scratch work.* The output gap factors:

$$|x^2-4| = |x-2|\,|x+2|.$$

The first factor is what $\delta$ controls. The second is a nuisance: it depends on $x$. The standard remedy is to restrict attention to a small neighbourhood first, then bound the nuisance factor there. Insist from the outset that $\delta \le 1$. Then $|x-2|<1$ gives $1<x<3$, hence $3 < x+2 < 5$, so $|x+2| < 5$. Therefore

$$|x^2-4| = |x-2||x+2| < 5|x-2|,$$

and it suffices to have $|x-2| < \varepsilon/5$.

*Proof.* Let $\varepsilon>0$ be given. Choose $\delta = \min\left(1, \dfrac{\varepsilon}{5}\right)$. Suppose $0<|x-2|<\delta$. Since $\delta \le 1$ we have $|x+2|<5$; since $\delta \le \varepsilon/5$ we have $|x-2|<\varepsilon/5$. Hence

$$|x^2-4| = |x-2|\,|x+2| < \frac{\varepsilon}{5}\cdot5 = \varepsilon. \qquad\blacksquare$$

The $\min$ is doing real work, and this is the pattern for every non-linear $\varepsilon$–$\delta$ proof: one component of the $\min$ tames the nuisance factor, the other delivers the $\varepsilon$.

Check it numerically. With $\varepsilon = 0.1$ the recipe gives $\delta = 0.02$, and the worst case is at the ends of the window: $|(2.02)^2-4| = 0.0804 < 0.1$. With $\varepsilon = 0.01$, $\delta = 0.002$ and the worst case is $0.008004 < 0.01$. The chosen $\delta$ is not optimal — a larger one would still work — and, as noted, it does not need to be.

### 9.4 Proving that a limit does not exist

Negating the definition is instructive. The statement $\lim_{x\to a}f(x) = L$ *fails* when: there exists an $\varepsilon>0$ such that for every $\delta>0$ there is some $x$ with $0<|x-a|<\delta$ and $|f(x)-L|\ge\varepsilon$. In game terms, the adversary has a tolerance you can never meet, however small you make $\delta$.

**Claim.** $\displaystyle\lim_{x\to0}\frac{|x|}{x}$ does not exist.

*Proof.* Suppose the limit were some number $L$. Take $\varepsilon = 1$. Whatever $\delta > 0$ is offered, the window $0 < |x| < \delta$ contains both a positive point $x_+ = \delta/2$, where $f = 1$, and a negative point $x_- = -\delta/2$, where $f = -1$. If $|1 - L| < 1$ and $|-1-L|<1$ both held, then by the triangle inequality

$$2 = |1-(-1)| \le |1-L| + |L-(-1)| < 1 + 1 = 2,$$

which is false. So at least one of the two points violates the $\varepsilon = 1$ tolerance, for every $\delta$. No $L$ works, and the limit does not exist. $\blacksquare$

The same argument, with $\varepsilon = 1$ and points chosen where $\sin(\pi/x) = 0$ and where it equals $1$, disposes of $\lim_{x\to0}\sin(\pi/x)$.

### 9.5 What this was for

With the definition in hand, everything used informally above becomes provable. The limit laws are theorems, proved by splitting a tolerance $\varepsilon$ into pieces (typically $\varepsilon/2$ for each of two functions in the sum law) and reassembling with the triangle inequality. The squeeze theorem follows in three lines. Continuity becomes the statement that $\delta$ can be found for the *unpunctured* window $|x-a|<\delta$, since at $x=a$ the output gap is $|f(a)-f(a)| = 0 < \varepsilon$ automatically. And the difference quotient of section 1 acquires a rigorous limit, which is the derivative.

That is Lecture 2's subject. The whole of it is a single definition —

$$f'(a) = \lim_{h\to0}\frac{f(a+h)-f(a)}{h}$$

— applied to the functions of elementary algebra and trigonometry, and the limits computed in this lecture are exactly the ones that make it possible: the cancellation of $h$ in a polynomial difference quotient, and $\sin x / x \to 1$ for the trigonometric one.

## 10. Practice

*Answers depend on the following verified values: secant slopes of $y=x^2$ at $(1,1)$: $3, 2.5, 2.1, 2.01, 2.001$ for $h = 1, 0.5, 0.1, 0.01, 0.001$, limit $2$; free fall $s = 4.9t^2$ giving average velocities $24.5, 22.05, 20.09, 19.649, 19.6049$ on $[2,2+h]$ and instantaneous velocity $19.6\ \mathrm{m/s}$; $\lim_{x\to0}\sin x/x = 1$ with table $0.8414710, 0.9983342, 0.9999833$ at $x = 1, 0.1, 0.01$; $\lim_{x\to0}(1-\cos x)/x^2 = 1/2$; $\lim_{x\to0}(\sqrt{x+4}-2)/x = 1/4$; $\lim_{x\to3}(x^2-9)/(x^2-2x-3) = 3/2$; $\lim_{x\to\infty}(\sqrt{x^2+x}-x) = 1/2$; the root of $x^3-x-1$ at $1.3247180$ with bisection brackets $[1,1.5]$, $[1.25,1.5]$, $[1.25,1.375]$, $[1.3125,1.375]$; $\delta = \min(1,\varepsilon/5)$ for $\lim_{x\to2}x^2 = 4$.*

**1.** *(The two problems.)* **(a)** For $f(x) = x^2$ at the point $(3,9)$, compute the secant slopes for $h = 1, 0.1, 0.01$ and state the tangent slope they approach. **(b)** Simplify the difference quotient algebraically and confirm the answer exactly. **(c)** State in one sentence why the algebraic cancellation is legitimate even though the quotient is $0/0$ at $h=0$.

**2.** *(Velocity.)* A body falls according to $s(t) = 4.9t^2$ metres. **(a)** Compute its average velocity on $[1, 1+h]$ for $h = 1, 0.1, 0.01$. **(b)** Simplify the difference quotient and read off the instantaneous velocity at $t=1$. **(c)** Compare with the value $19.6\ \mathrm{m/s}$ obtained at $t=2$ in the text, and state what the pattern suggests about $v(t)$.

**3.** *(The $0/0$ toolkit.)* Evaluate, showing the rewriting that makes substitution legal: **(a)** $\displaystyle\lim_{x\to3}\frac{x^2-9}{x^2-2x-3}$; **(b)** $\displaystyle\lim_{x\to0}\frac{\sqrt{x+4}-2}{x}$; **(c)** $\displaystyle\lim_{x\to0}\frac1x\left(\frac{1}{x+3}-\frac13\right)$.

**4.** *(One-sided limits.)* For $f(x) = \begin{cases} x^2+1, & x<1\\ 4, & x=1\\ 3x-1, & x>1\end{cases}$: **(a)** compute both one-sided limits at $x=1$; **(b)** state whether $\lim_{x\to1}f(x)$ exists and its value; **(c)** state whether $f$ is continuous at $1$ and which of the three conditions fails, if any.

**5.** *(Squeeze.)* **(a)** Prove $\lim_{x\to0} x^2\cos(1/x) = 0$, stating the inequalities used. **(b)** Explain why the product law cannot be used instead. **(c)** Evaluate $\lim_{x\to\infty}\dfrac{\cos x}{x}$ and state which bounds you squeeze between.

**6.** *(Trigonometric limits.)* Using $\lim_{x\to0}\sin x/x = 1$: **(a)** evaluate $\lim_{x\to0}\dfrac{\sin 5x}{x}$; **(b)** evaluate $\lim_{x\to0}\dfrac{\sin 3x}{\sin 7x}$; **(c)** state why the result $\lim_{x\to0}\sin x/x = 1$ fails if $x$ is measured in degrees, and give the value it takes instead.

**7.** *(Behaviour at infinity.)* **(a)** Evaluate $\displaystyle\lim_{x\to\infty}\frac{3x^2-x}{2x^2+5}$ and identify the horizontal asymptote. **(b)** Evaluate $\displaystyle\lim_{x\to\infty}\big(\sqrt{x^2+x}-x\big)$, naming the indeterminate form and the technique. **(c)** Give the general rule for $\lim_{x\to\infty}p(x)/q(x)$ in terms of the degrees of $p$ and $q$.

**8.** *(Continuity and the IVT.)* **(a)** Find the value of $k$ making $f(x) = \begin{cases}kx^2, & x\le2\\ x+6, & x>2\end{cases}$ continuous at $x=2$. **(b)** Show that $x^3-x-1$ has a root in $[1,2]$, stating the theorem used and checking its hypotheses. **(c)** Carry out three bisection steps and give the resulting bracket.

**9.** *($\varepsilon$–$\delta$.)* **(a)** Prove $\lim_{x\to1}(4x-3) = 1$ directly from the definition, exhibiting $\delta$ as a function of $\varepsilon$. **(b)** Prove $\lim_{x\to2}x^2 = 4$, explaining why $\delta$ must involve a minimum of two quantities. **(c)** Write the negation of the definition, and use it with $\varepsilon = 1$ to prove that $\lim_{x\to0}|x|/x$ does not exist.

## Further reading

{{book: Michael Spivak | Calculus | 2008}} treats limits with full rigour from the start and is the standard reference for the proofs deferred here; its problems are unusually good and unusually hard.

{{book: Tom M. Apostol | Calculus, Volume 1 | 1967}} builds the subject in the historical order — integration before differentiation — and is worth reading alongside any conventional course for the different perspective on why the Fundamental Theorem is surprising.

{{book: Richard Courant | Differential and Integral Calculus, Volume 1 | 1937}} is the classic account that keeps the physical problems in view throughout, and is particularly good on the relationship between the limit concept and the applications that forced it into existence.
$svcLimits_master$,
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
