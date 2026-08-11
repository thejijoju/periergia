-- Mathematics · Lower-Division Undergraduate — Calculus Sequence — "Single-Variable Calculus".
-- Curated master for
-- mathematics/lower-division-undergraduate/calculus-sequence/single-variable-calculus
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- First mathematics chapter. Written to the technical standard, not the
-- humanities one: no historical narrative, no biography, no quotations.
-- Every result is derived. Limits by epsilon-delta with worked proofs;
-- limit laws proved by the eps/2 split; squeeze theorem and sin x / x
-- by the geometric area argument; continuity and the two existence
-- theorems; the derivative from the difference quotient, with
-- differentiability => continuity and |x| as the counterexample to the
-- converse; product and chain rules proved; sin, cos, exp differentiated
-- from the definition; inverse-function rule giving ln and arcsin;
-- implicit differentiation; Rolle => MVT and its three corollaries;
-- Cauchy MVT => l'Hopital, with three named misuses including the
-- circularity on sin x / x; Fermat's condition, the two derivative tests
-- and closed-interval optimisation; the Riemann integral built from
-- upper and lower sums, with the Dirichlet function as the
-- non-integrable case; both parts of the FTC proved; substitution and
-- parts derived by reversing the chain and product rules; partial
-- fractions; improper integrals with the p-test at both ends and the
-- comparison test; Taylor with Lagrange remainder and a worked error
-- bound. Checkpoints and practice test computation and derivation only -
-- a reader who learned no mathematics cannot score.
-- ~12,300 words, 19 checkpoint questions, 12 worked problems.
--
-- Numbers verified before drafting: the cos x <= sin x / x <= 1 squeeze
-- table; (1 - cos x)/x^2 -> 1/2; (e^h - 1)/h -> 1; (e^x - 1 - x)/x^2 ->
-- 1/2 and (tan x - x)/x^3 -> 1/3 by numerical convergence; the box
-- volume V(x) = x(12-2x)^2 with V'(x) = 12(x-2)(x-6) and V(2) = 128;
-- the partial-fraction antiderivative checked by numerical
-- differentiation at x = 2; ln(10^6) = 13.8; sqrt(1.1) against its
-- quadratic Taylor polynomial and Lagrange bound.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'mathematics/lower-division-undergraduate/calculus-sequence/single-variable-calculus',
    'research',
    'advanced',
    'read',
    $mathSVC_master$> Calculus rests on one construction — the limit — applied twice. Applied to a difference quotient it produces the derivative; applied to a sum of areas it produces the integral. The **Fundamental Theorem** then proves these two are inverse to one another, which is why a subject built from a single idea can compute both tangent lines and areas.

This chapter derives all of it. Every theorem stated is proved or given a proof sketch, every worked example shows the full algebra, and each result comes with the hypotheses it needs and a counterexample showing what fails without them.

## 1. Limits

### 1.1 The definition

Write $\lim_{x\to a} f(x) = L$ to mean: $f(x)$ can be forced arbitrarily close to $L$ by taking $x$ close enough to $a$, without $x$ equalling $a$. Made precise:

$$\lim_{x\to a} f(x) = L \iff \forall \varepsilon > 0\ \exists\, \delta > 0 \ \text{ s.t. } \ 0 < |x - a| < \delta \implies |f(x) - L| < \varepsilon.$$

Read it as a two-player game. An adversary supplies a tolerance $\varepsilon$ on the **output**; you must supply a radius $\delta$ on the **input** such that every $x$ within $\delta$ of $a$ lands within $\varepsilon$ of $L$. A limit exists precisely when you have a winning strategy — a rule producing a valid $\delta$ from any $\varepsilon$.

Two features of the definition are load-bearing.

**The strict inequality $0 < |x - a|$ excludes $x = a$.** The limit describes the *approach* to $a$ and is entirely indifferent to $f(a)$, which may differ from $L$ or fail to exist. This is not a technicality — it is what makes the derivative possible, since the difference quotient is undefined at $h = 0$.

**$\delta$ may depend on $\varepsilon$, and generally must.** A single $\delta$ working for all $\varepsilon$ would force $f$ to be constant near $a$.

### 1.2 Worked proofs

**Example 1 (linear).** Prove $\lim_{x\to 3}(4x - 5) = 7$.

Work backwards from the target. The output gap is

$$|(4x-5) - 7| = |4x - 12| = 4|x-3|.$$

To force this below $\varepsilon$ we need $|x - 3| < \varepsilon/4$. So **choose $\delta = \varepsilon/4$**. Then whenever $0 < |x-3| < \delta$,

$$|(4x-5)-7| = 4|x-3| < 4\delta = 4\cdot\frac{\varepsilon}{4} = \varepsilon. \qquad \blacksquare$$

**Example 2 (quadratic — where $\delta$ must be capped).** Prove $\lim_{x\to 2} x^2 = 4$.

$$|x^2 - 4| = |x-2|\,|x+2|.$$

The factor $|x-2|$ is what we control; $|x+2|$ is not bounded a priori. Fix that by **restricting $\delta$ in advance**: insist $\delta \le 1$, so $|x - 2| < 1$ gives $1 < x < 3$ and hence $|x+2| < 5$. Then

$$|x^2 - 4| = |x-2|\,|x+2| < 5|x-2|.$$

To force this below $\varepsilon$, take $|x-2| < \varepsilon/5$. Combining both requirements,

$$\delta = \min\!\left(1, \frac{\varepsilon}{5}\right). \qquad \blacksquare$$

The $\min$ is the standard device for any non-linear $f$: one term of the $\min$ tames the uncontrolled factor, the other delivers $\varepsilon$.

### 1.3 One-sided limits and non-existence

$\lim_{x\to a^-}$ and $\lim_{x\to a^+}$ restrict to $x < a$ and $x > a$. The two-sided limit exists **iff** both one-sided limits exist and agree.

For $f(x) = |x|/x$ (defined for $x \ne 0$): the left limit is $-1$, the right limit is $+1$, so $\lim_{x\to 0} f(x)$ does not exist. For $f(x) = 1/x$ neither one-sided limit exists as a real number — the values grow without bound.

### 1.4 Limit laws

Nobody computes limits from the definition twice. The definition is used once, to establish the laws; afterwards the laws do the work.

Suppose $\lim_{x\to a} f(x) = L$ and $\lim_{x\to a} g(x) = M$. Then

$$\lim_{x\to a}\big(f+g\big) = L+M, \qquad \lim_{x\to a}\big(fg\big) = LM, \qquad \lim_{x\to a}\frac{f}{g} = \frac{L}{M}\ \ (M \ne 0).$$

*Proof of the sum law.* Given $\varepsilon > 0$, apply the hypotheses with tolerance $\varepsilon/2$ each: there are $\delta_1, \delta_2 > 0$ with $|f(x)-L| < \varepsilon/2$ when $0<|x-a|<\delta_1$, and $|g(x)-M| < \varepsilon/2$ when $0<|x-a|<\delta_2$. Take $\delta = \min(\delta_1,\delta_2)$. Then for $0<|x-a|<\delta$ the triangle inequality gives

$$\big|(f+g)(x) - (L+M)\big| \le |f(x)-L| + |g(x)-M| < \tfrac{\varepsilon}{2}+\tfrac{\varepsilon}{2} = \varepsilon. \qquad\blacksquare$$

The $\varepsilon/2$ split and the $\min$ of two deltas are the same two devices as before, and they recur in every proof of this shape. The product law needs one extra step — a bound on $|f|$ near $a$, obtained by taking $\varepsilon = 1$ in the hypothesis for $f$ — because a large factor can amplify a small error.

The laws have a hard limitation: **they say nothing about indeterminate forms.** If $L = M = 0$ the quotient law does not apply, and no general answer exists — $x/x \to 1$, $x^2/x \to 0$, $x/x^2$ has no finite limit. Every such case must be resolved by algebra (cancel the common factor) or by a theorem built for the purpose.

### 1.5 The squeeze theorem and the fundamental trigonometric limit

**Squeeze theorem.** If $g(x) \le f(x) \le h(x)$ near $a$ (excluding $a$ itself) and $\lim_{x\to a}g = \lim_{x\to a}h = L$, then $\lim_{x\to a}f = L$.

*Proof.* Given $\varepsilon>0$, choose $\delta$ making both $|g-L|<\varepsilon$ and $|h-L|<\varepsilon$. Then $L-\varepsilon < g(x) \le f(x) \le h(x) < L+\varepsilon$, so $|f(x)-L| < \varepsilon$. $\blacksquare$

Its importance is that it computes limits of functions no algebra will simplify. The essential application:

$$\boxed{\ \lim_{x\to 0}\frac{\sin x}{x} = 1\ }$$

*Proof.* For $0 < x < \pi/2$, compare three areas inside the unit circle: the triangle with vertices $(0,0)$, $(1,0)$, $(\cos x, \sin x)$; the circular sector of angle $x$; and the triangle with vertices $(0,0)$, $(1,0)$, $(1,\tan x)$. The first sits inside the second, which sits inside the third, so

$$\tfrac12\sin x \ \le\ \tfrac12 x \ \le\ \tfrac12\tan x.$$

Divide through by $\tfrac12\sin x > 0$ and invert (which reverses the inequalities):

$$1 \ \ge\ \frac{\sin x}{x}\ \ge\ \cos x.$$

Both bounds tend to $1$ as $x \to 0^+$, so the squeeze applies. Since $\sin x / x$ is even, the same limit holds from the left. $\blacksquare$

The numbers confirm the squeeze closing:

| $x$ | $\cos x$ | $\sin x / x$ |
|---|---|---|
| $0.5$ | $0.877583$ | $0.958851$ |
| $0.1$ | $0.995004$ | $0.998334$ |
| $0.01$ | $0.999950$ | $0.999983$ |
| $0.001$ | $0.999999\!5$ | $0.999999\!8$ |

A companion limit follows by algebra rather than a second squeeze — multiply by the conjugate:

$$\frac{1-\cos x}{x^2} = \frac{(1-\cos x)(1+\cos x)}{x^2(1+\cos x)} = \frac{\sin^2 x}{x^2(1+\cos x)} = \left(\frac{\sin x}{x}\right)^2\cdot\frac{1}{1+\cos x} \ \longrightarrow\ 1^2\cdot\frac12 = \frac12.$$

At $x = 0.001$ the quotient is $0.49999996$, as predicted. Both limits are needed to differentiate $\sin$ and $\cos$, and **both must be established before any derivative of a trigonometric function exists** — a dependency worth remembering, because it forbids one shortcut later.

```checkpoint
q: To prove $\lim_{x\to 5}(3x+2) = 17$ from the definition, which choice of $\delta$ works for a given $\varepsilon > 0$?
a: $\delta = \varepsilon$
x: Then $|x-5| < \varepsilon$ gives $|(3x+2)-17| = 3|x-5| < 3\varepsilon$, which exceeds $\varepsilon$. Too generous by a factor of 3.
a*: $\delta = \varepsilon/3$
a: $\delta = 3\varepsilon$
x: This is larger still, giving an output gap up to $9\varepsilon$. The multiplier must be divided out, not multiplied in.
a: $\delta = \min(1, \varepsilon)$
x: The cap is unnecessary for a linear function — nothing needs bounding — and $\varepsilon$ alone still fails by the factor of 3.
hint: Compute $|(3x+2) - 17|$ and factor out $|x-5|$.
why: The output gap is $|(3x+2)-17| = |3x - 15| = 3|x-5|$. Forcing $3|x-5| < \varepsilon$ requires $|x-5| < \varepsilon/3$, so $\delta = \varepsilon/3$ works: if $0 < |x-5| < \varepsilon/3$ then $|(3x+2)-17| = 3|x-5| < 3(\varepsilon/3) = \varepsilon$. The general rule for a linear function $f(x) = mx + c$ with $m \neq 0$ is $\delta = \varepsilon/|m|$ — the slope multiplies input error into output error, so it must be divided out. No $\min$ is needed because the factor multiplying $|x-a|$ is the constant $|m|$; caps are required only when that factor itself varies with $x$, as with $|x+2|$ in the quadratic case.
---
q: Let $f(x) = \dfrac{x^2 - 9}{x - 3}$ for $x \ne 3$, with $f(3) = 100$. What is $\lim_{x\to 3} f(x)$?
a: $100$, since that is the value of $f$ at $3$
x: The definition excludes $x = a$ via $0 < |x-a|$, so $f(3)$ is irrelevant to the limit no matter what it is set to.
a*: $6$
a: The limit does not exist, since $f$ is undefined at the point the expression is evaluated
x: $f$ is defined at 3 (as 100), and even were it not, a limit can exist where the function is undefined — that is the normal situation for a derivative.
a: $0$, since the numerator vanishes at $x = 3$
x: Both numerator and denominator vanish, giving the indeterminate form $0/0$; the factor must be cancelled before evaluating.
hint: Factor the numerator and cancel, remembering that $x \neq 3$ throughout.
why: For $x \ne 3$, $\dfrac{x^2-9}{x-3} = \dfrac{(x-3)(x+3)}{x-3} = x+3$, where the cancellation is legitimate precisely because the limit never evaluates at $x = 3$. So $\lim_{x\to 3} f(x) = \lim_{x\to 3}(x+3) = 6$. The assigned value $f(3) = 100$ plays no role: the clause $0 < |x - a|$ in the definition deliberately excludes the point itself. This is the whole reason limits can handle $0/0$ forms, and it is what the derivative depends on — the difference quotient $[f(a+h)-f(a)]/h$ is undefined at $h = 0$, yet its limit as $h \to 0$ exists whenever $f$ is differentiable. Note also that $f$ is *not* continuous at 3 here, since $\lim_{x\to3} f = 6 \neq 100 = f(3)$.
---
q: Evaluate $\displaystyle\lim_{x\to 0}\frac{\sin 5x}{3x}$.
a: $1$, since $\sin u / u \to 1$
x: The limit $\sin u/u \to 1$ requires the *same* quantity inside the sine and in the denominator. Here they are $5x$ and $3x$, so a constant survives.
a*: $\dfrac{5}{3}$
a: $0$, since $\sin 0 = 0$
x: Numerator and denominator both vanish — this is the indeterminate form $0/0$, on which direct substitution says nothing.
a: The limit does not exist
x: It exists; the standard limit applies once the expression is rewritten so the sine's argument matches its denominator.
hint: Force the argument of the sine to appear in the denominator by multiplying and dividing by $5x$.
why: Write $\dfrac{\sin 5x}{3x} = \dfrac{5}{3}\cdot\dfrac{\sin 5x}{5x}$. As $x\to 0$ the substitution $u = 5x$ also tends to $0$, so $\dfrac{\sin 5x}{5x} = \dfrac{\sin u}{u} \to 1$ and the limit is $\dfrac53\cdot 1 = \dfrac53$. The error to avoid is quoting $\sin u/u \to 1$ when the two arguments differ: the statement is about a single quantity appearing in both places, and matching them is what the algebraic step above achieves. Note also that this cannot be settled by substitution — both parts vanish at $0$, so the quotient law does not apply and the limit is genuinely a $0/0$ form resolved by the squeeze theorem, not by cancellation.
```

## 2. Continuity

$f$ is **continuous at $a$** when three things hold: $f(a)$ exists, $\lim_{x\to a} f(x)$ exists, and they are equal:

$$\lim_{x\to a} f(x) = f(a).$$

Continuity is exactly the licence to compute limits by substitution. Polynomials, $\sin$, $\cos$, $e^x$ are continuous everywhere; rational functions are continuous off their zeros of the denominator; $\sqrt{x}$ is continuous on $[0,\infty)$.

Two existence theorems do heavy work later. Both require **continuity on a closed bounded interval**, and both fail without it.

**Intermediate Value Theorem.** If $f$ is continuous on $[a,b]$ and $y$ lies between $f(a)$ and $f(b)$, there exists $c \in (a,b)$ with $f(c) = y$.

*Use.* $f(x) = x^3 - x - 1$ has $f(1) = -1 < 0$ and $f(2) = 5 > 0$, so a root lies in $(1,2)$. This proves existence without producing the root — and bisection turns the proof into an algorithm.

*Failure without continuity.* $f(x) = 1/x$ on $[-1,1]\setminus\{0\}$ runs from $-1$ to $1$ and never takes the value $0$.

**Extreme Value Theorem.** If $f$ is continuous on $[a,b]$ then $f$ attains a maximum and a minimum on $[a,b]$.

*Failure without closedness.* $f(x) = x$ on the open interval $(0,1)$ attains neither. *Failure without boundedness.* $f(x) = x$ on $[0,\infty)$ attains no maximum. Both hypotheses are needed, and neither is decorative.

## 3. The derivative

### 3.1 Definition

Fix $a$. The **difference quotient** is the slope of the secant through $(a, f(a))$ and $(a+h, f(a+h))$:

$$\frac{f(a+h) - f(a)}{h}.$$

It reports an *average* rate over a gap of width $h$. Setting $h = 0$ is illegal. Taking the limit is not:

$$f'(a) = \lim_{h\to 0} \frac{f(a+h) - f(a)}{h},$$

when the limit exists, in which case $f$ is **differentiable at $a$**. Geometrically the secants rotate toward the tangent; $f'(a)$ is the tangent's slope.

### 3.2 The power rule, derived

For $f(x) = x^n$ with $n$ a positive integer, expand by the binomial theorem:

$$(x+h)^n = x^n + nx^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + h^n.$$

Subtract $x^n$ and divide by $h$ — legitimate since $h \neq 0$:

$$\frac{(x+h)^n - x^n}{h} = nx^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + h^{n-1}.$$

Every term after the first carries a factor of $h$, so all vanish in the limit:

$$\boxed{\ \frac{d}{dx}x^n = nx^{n-1}.\ }$$

The mechanism is worth naming, because it recurs in every derivative computation: **the algebra must cancel the $h$ in the denominator before the limit is taken.** After cancellation the expression is continuous at $h = 0$ and substitution is legal.

**Worked example.** $f(x) = 1/x$, at any $x \ne 0$:

$$\frac{f(x+h)-f(x)}{h} = \frac{\frac{1}{x+h} - \frac{1}{x}}{h} = \frac{\frac{x - (x+h)}{x(x+h)}}{h} = \frac{-h}{h\,x(x+h)} = \frac{-1}{x(x+h)}.$$

The $h$ cancels, so $f'(x) = \lim_{h\to 0}\dfrac{-1}{x(x+h)} = -\dfrac{1}{x^2}$ — the power rule with $n = -1$.

### 3.3 Differentiability implies continuity — and the converse fails

**Theorem.** If $f$ is differentiable at $a$ then $f$ is continuous at $a$.

*Proof.* For $x \neq a$ write

$$f(x) - f(a) = \frac{f(x)-f(a)}{x-a}\cdot(x-a).$$

As $x \to a$ the first factor tends to $f'(a)$ (finite, by hypothesis) and the second to $0$, so the product tends to $0$. Hence $\lim_{x\to a} f(x) = f(a)$. $\blacksquare$

**The converse is false.** Take $f(x) = |x|$ at $a = 0$. It is continuous there, but

$$\frac{|0+h| - |0|}{h} = \frac{|h|}{h} = \begin{cases} +1 & h > 0\\ -1 & h < 0,\end{cases}$$

so the one-sided limits are $+1$ and $-1$ and the derivative does not exist. Continuity is strictly weaker than differentiability: a corner is continuous but has no tangent.

A subtler example shows differentiability does **not** force the derivative to be continuous. Let

$$f(x) = \begin{cases} x^2\sin(1/x) & x \ne 0\\ 0 & x = 0.\end{cases}$$

At $0$, $\left|\dfrac{f(h)-f(0)}{h}\right| = |h\sin(1/h)| \le |h| \to 0$, so $f'(0) = 0$ exists. Away from $0$, the product and chain rules give $f'(x) = 2x\sin(1/x) - \cos(1/x)$, which oscillates between $-1$ and $1$ as $x \to 0$ and has no limit. So $f'$ exists everywhere and is discontinuous at $0$.

### 3.4 Rules, proved

**Product rule.** $(uv)' = u'v + uv'$.

*Proof.* Add and subtract the cross term $u(x+h)v(x)$:

$$\frac{u(x+h)v(x+h) - u(x)v(x)}{h} = \underbrace{u(x+h)\frac{v(x+h)-v(x)}{h}}_{\to\, u(x)v'(x)} + \underbrace{v(x)\frac{u(x+h)-u(x)}{h}}_{\to\, v(x)u'(x)},$$

using continuity of $u$ at $x$ (which differentiability supplies) for $u(x+h) \to u(x)$. $\blacksquare$

The cross-term trick is the entire content: it splits one difference into two, each of which is a difference quotient.

**Note what the rule is not.** $(uv)' \neq u'v'$. Check on $u = v = x$: the correct answer is $(x^2)' = 2x$, while $u'v' = 1$.

**Chain rule.** $(f \circ g)'(x) = f'(g(x))\,g'(x)$.

*Sketch.* Write the difference quotient as a product of two:

$$\frac{f(g(x+h)) - f(g(x))}{h} = \frac{f(g(x+h)) - f(g(x))}{g(x+h)-g(x)}\cdot\frac{g(x+h)-g(x)}{h}.$$

As $h \to 0$, $g(x+h) \to g(x)$ by continuity, so the first factor tends to $f'(g(x))$ and the second to $g'(x)$. (The genuine proof handles the case $g(x+h) = g(x)$, where this division is invalid, by defining an auxiliary function continuous at the relevant point — the conclusion is unaffected.) $\blacksquare$

**Quotient rule**, from the product rule applied to $u = (u/v)\cdot v$:

$$\left(\frac{u}{v}\right)' = \frac{u'v - uv'}{v^2}.$$

**Worked examples.**

$$\frac{d}{dx}\left(x^2\sin x\right) = 2x\sin x + x^2\cos x \quad\text{(product)},$$

$$\frac{d}{dx}\sin(x^2) = \cos(x^2)\cdot 2x \quad\text{(chain: outer derivative at the inner function, times inner derivative)},$$

$$\frac{d}{dx}\frac{x}{1+x^2} = \frac{(1)(1+x^2) - x(2x)}{(1+x^2)^2} = \frac{1-x^2}{(1+x^2)^2} \quad\text{(quotient)}.$$

### 3.5 The elementary functions, from the definition

The rules combine known derivatives; they do not supply the starting stock. That stock is computed from the difference quotient, and every one of these computations reduces to a limit already established.

**Sine.** Use the addition formula $\sin(x+h) = \sin x\cos h + \cos x \sin h$:

$$\frac{\sin(x+h)-\sin x}{h} = \sin x\cdot\frac{\cos h - 1}{h} + \cos x\cdot\frac{\sin h}{h}.$$

The second bracket tends to $1$. The first tends to $0$, because

$$\frac{1-\cos h}{h} = h\cdot\frac{1-\cos h}{h^2} \longrightarrow 0\cdot\tfrac12 = 0.$$

Hence $\dfrac{d}{dx}\sin x = \sin x\cdot 0 + \cos x\cdot 1 = \cos x$. The same computation on $\cos(x+h) = \cos x\cos h - \sin x\sin h$ gives $\dfrac{d}{dx}\cos x = -\sin x$, and the quotient rule then gives

$$\frac{d}{dx}\tan x = \frac{\cos x\cos x - \sin x(-\sin x)}{\cos^2 x} = \frac{1}{\cos^2 x} = \sec^2 x.$$

Note the dependency: **the derivative of $\sin$ rests entirely on $\lim_{h\to0}\sin h/h = 1$**, proved by the squeeze. Any later attempt to evaluate that limit *using* the derivative of $\sin$ is circular.

**Exponential.** The difference quotient factors completely:

$$\frac{e^{x+h}-e^x}{h} = e^x\cdot\frac{e^h-1}{h}.$$

So $\exp$ is differentiable at $x$ precisely when the limit $\lim_{h\to0}(e^h-1)/h$ exists, and the derivative is that limit times $e^x$. The number $e$ is *defined* by the requirement that this limit equal $1$ — that is the content of the choice of base — giving

$$\frac{d}{dx}e^x = e^x.$$

At $h = 10^{-6}$ the quotient is $1.0000005$, consistent with the limit $1$. For a general base, $a^x = e^{x\ln a}$ and the chain rule gives $(a^x)' = a^x\ln a$; the factor $\ln a$ is exactly what vanishes when $a = e$, which is why that base is the natural one.

### 3.6 Inverse functions and implicit differentiation

**Inverse function rule.** If $f$ is differentiable and invertible near $a$, with $f'(a) \ne 0$ and $b = f(a)$, then $f^{-1}$ is differentiable at $b$ with

$$\left(f^{-1}\right)'(b) = \frac{1}{f'(a)} = \frac{1}{f'\!\left(f^{-1}(b)\right)}.$$

*Derivation.* Differentiate the identity $f\!\left(f^{-1}(y)\right) = y$ with the chain rule: $f'\!\left(f^{-1}(y)\right)\cdot\left(f^{-1}\right)'(y) = 1$. Solve. (Differentiability of $f^{-1}$ itself needs a separate argument; the formula is forced once it is known.) Geometrically the graph of $f^{-1}$ is the graph of $f$ reflected in the line $y = x$, and reflection turns a slope into its reciprocal — which is also why $f'(a) = 0$ is fatal: a horizontal tangent reflects to a vertical one.

**Logarithm.** Let $y = \ln x$, so $x = e^y$. Then $dx/dy = e^y = x$, and the rule gives

$$\frac{d}{dx}\ln x = \frac{1}{x}, \qquad x > 0.$$

This fills the one gap in the power rule: $\int x^n dx = x^{n+1}/(n+1)$ fails at $n = -1$, and $\ln|x|$ is the antiderivative that takes its place.

**Arcsine.** Let $y = \arcsin x$, so $x = \sin y$ with $y \in (-\pi/2,\pi/2)$. Then $dx/dy = \cos y = \sqrt{1-\sin^2 y} = \sqrt{1-x^2}$, positive on that range, so

$$\frac{d}{dx}\arcsin x = \frac{1}{\sqrt{1-x^2}}, \qquad |x| < 1.$$

An algebraic derivative of a transcendental function — which is why $\arcsin$ appears as the answer to integrals containing $\sqrt{1-x^2}$. The same route gives $(\arctan x)' = 1/(1+x^2)$.

**Implicit differentiation.** When a curve is given by an equation rather than a formula for $y$, differentiate both sides with respect to $x$, treating $y$ as a function of $x$ and applying the chain rule to every appearance of it. For the circle $x^2+y^2 = 25$:

$$2x + 2y\frac{dy}{dx} = 0 \quad\Longrightarrow\quad \frac{dy}{dx} = -\frac{x}{y}.$$

At $(3,4)$ the slope is $-3/4$. *Check against the explicit branch:* on the upper half $y = \sqrt{25-x^2}$, so $y' = -x/\sqrt{25-x^2}$, which at $x = 3$ is $-3/4$. ✓ The implicit form is better than the explicit one here: it covers both branches at once, and it stays finite exactly where the explicit formula does not, breaking down only at $y = 0$ — the two points where the tangent really is vertical.

```checkpoint
q: A student computes $\dfrac{d}{dx}\left(x^3\cos x\right) = 3x^2\cdot(-\sin x) = -3x^2\sin x$. Where is the error, and what is the correct derivative?
a: No error; the derivative is $-3x^2\sin x$
x: This multiplies the two derivatives, which is not the product rule. Test the method on $x\cdot x$: it gives $1$, but $(x^2)' = 2x$.
a*: They used $(uv)' = u'v'$; the product rule gives $3x^2\cos x - x^3\sin x$
a: The error is the sign; it should be $+3x^2\sin x$
x: The sign on $(\cos x)' = -\sin x$ is right. The error is structural — the wrong rule was applied.
a: They should have used the chain rule, giving $\cos(3x^2)$
x: $x^3\cos x$ is a product, not a composition; the chain rule does not apply here.
hint: Differentiate $x\cdot x$ by the method used and compare with the known derivative of $x^2$.
why: The product rule is $(uv)' = u'v + uv'$, not $u'v'$. With $u = x^3$ and $v = \cos x$: $u' = 3x^2$, $v' = -\sin x$, so $(uv)' = 3x^2\cos x + x^3(-\sin x) = 3x^2\cos x - x^3\sin x$. The proof shows why a sum appears — adding and subtracting $u(x+h)v(x)$ splits the difference into two difference quotients, one for each factor, so both terms survive. The quickest check on any proposed rule is a case with a known answer: for $u = v = x$, $u'v' = 1$ whereas $(x^2)' = 2x$, so the multiplicative version is wrong at once.
---
q: $f(x) = |x - 4|$. Which is true at $x = 4$?
a: $f$ is differentiable with $f'(4) = 0$, since $4$ is a minimum
x: A minimum forces $f' = 0$ only where the derivative exists. Here it does not, which is exactly how a minimum can occur at a corner.
a*: $f$ is continuous at 4 but not differentiable there, because the one-sided difference quotients give $-1$ and $+1$
a: $f$ is neither continuous nor differentiable at 4
x: $\lim_{x\to4}|x-4| = 0 = f(4)$, so $f$ is continuous; absolute value has no jump.
a: $f$ is differentiable at 4 but $f'$ is not continuous there
x: That describes $x^2\sin(1/x)$, a different phenomenon. Here the derivative does not exist at the point at all.
hint: Compute $[f(4+h) - f(4)]/h$ separately for $h > 0$ and $h < 0$.
why: $f(4) = 0$, and $[f(4+h)-f(4)]/h = |h|/h$, which equals $+1$ for $h > 0$ and $-1$ for $h < 0$. The one-sided limits disagree, so the two-sided limit — and hence $f'(4)$ — does not exist. Continuity does hold, since $|x-4| \to 0$ as $x \to 4$. This is the standard counterexample to the converse of "differentiable $\Rightarrow$ continuous": the implication runs one way only, and a corner is precisely a point of continuity without a tangent. It also shows why the Extreme Value Theorem and Fermat's condition $f'(c) = 0$ must be stated carefully — an extremum can sit at a point where the derivative fails to exist.
---
q: Compute $\dfrac{d}{dx}\sqrt{1 + x^4}$.
a: $\dfrac{1}{2\sqrt{1+x^4}}$
x: This applies the outer derivative but omits the inner one — the chain rule's second factor is missing.
a*: $\dfrac{2x^3}{\sqrt{1+x^4}}$
a: $\dfrac{4x^3}{\sqrt{1+x^4}}$
x: Close, but the outer derivative of $\sqrt{u}$ contributes a factor $\tfrac12$, so $4x^3$ should be halved to $2x^3$.
a: $\dfrac{1}{2\sqrt{4x^3}}$
x: This substitutes the inner derivative into the outer function rather than multiplying; the chain rule evaluates the outer derivative *at* the inner function and multiplies by the inner derivative.
hint: Write it as $f(g(x))$ with $f(u) = \sqrt u$ and $g(x) = 1 + x^4$, then apply $f'(g(x))\cdot g'(x)$.
why: With $f(u) = u^{1/2}$ and $g(x) = 1+x^4$: $f'(u) = \tfrac12 u^{-1/2}$ and $g'(x) = 4x^3$. The chain rule gives $f'(g(x))g'(x) = \tfrac12(1+x^4)^{-1/2}\cdot 4x^3 = \dfrac{2x^3}{\sqrt{1+x^4}}$. Two errors are common here and both appear above: forgetting $g'$ entirely, and substituting $g'$ into $f'$ rather than multiplying. The rule's structure — *outer derivative evaluated at the inner function, times inner derivative* — is visible in the proof, where the difference quotient factors into one quotient measuring $f$'s response to a change in $g$ and another measuring $g$'s response to a change in $x$.
---
q: The curve $x^3 + y^3 = 9$ passes through $(1,2)$. What is $dy/dx$ there?
a: $-\dfrac{1}{2}$
x: This is $-x/y$, the answer for the circle $x^2+y^2 = c$. Cubes give squares on differentiation, so the ratio is of squares.
a*: $-\dfrac{1}{4}$
a: $-\dfrac{3x^2}{3y^2} = -\dfrac{3}{12}$, which is not defined at $(1,2)$
x: $-3/12$ is defined and equals $-1/4$ — the same value, just unsimplified. Nothing fails here; the derivative fails only where $y = 0$.
a: $0$, since the right-hand side is a constant and its derivative is zero
x: The derivative of the *right* side is zero, which is what sets the sum on the left to zero. It does not make $dy/dx$ zero.
hint: Differentiate both sides with respect to $x$, remembering that $y^3$ requires the chain rule.
why: Differentiating termwise: $3x^2 + 3y^2\dfrac{dy}{dx} = 0$, where $y^3$ contributes $3y^2\cdot y'$ by the chain rule because $y$ is a function of $x$. Solving, $\dfrac{dy}{dx} = -\dfrac{x^2}{y^2}$, and at $(1,2)$ this is $-\dfrac{1}{4}$. The point does lie on the curve: $1 + 8 = 9$ ✓, which is worth checking before differentiating, since the formula returns a number at points that are not on the curve at all. Implicit differentiation is preferable here because solving for $y = (9-x^3)^{1/3}$ and differentiating gives the same answer with far more algebra — and for curves like $x^3+y^3 = 6xy$, where no branch can be isolated in closed form, it is the only method available.
---
q: Which statement about $\lim_{h\to0}\dfrac{\sin h}{h} = 1$ and the derivative of $\sin$ is correct?
a: The limit is fastest proved by l'Hôpital's rule applied to $\sin h / h$
x: L'Hôpital differentiates the numerator to $\cos h$, which presupposes $(\sin)' = \cos$ — a fact derived from this very limit. The argument is circular.
a*: The limit must be proved first, by the squeeze theorem, because the derivative of $\sin$ is computed from it
a: The two are independent results; either may be proved first
x: Not independent: the difference quotient for $\sin$ reduces to this limit plus $(1-\cos h)/h \to 0$, so the derivative depends on it.
a: The limit follows from continuity of $\sin$ at $0$
x: Continuity gives $\sin h \to 0$, so the quotient is a $0/0$ form — continuity alone determines nothing about its value.
hint: Write out the difference quotient for $\sin$ at $x$ and identify which limits it needs.
why: The difference quotient is $\dfrac{\sin(x+h)-\sin x}{h} = \sin x\cdot\dfrac{\cos h - 1}{h} + \cos x\cdot\dfrac{\sin h}{h}$, so evaluating it requires the two limits $\sin h/h \to 1$ and $(1-\cos h)/h \to 0$ — and the second follows from the first via $(1-\cos h)/h = h\cdot(1-\cos h)/h^2 \to 0\cdot\tfrac12$. Only after both are in hand does $(\sin x)' = \cos x$ exist. Since l'Hôpital's rule on $\sin h/h$ needs $(\sin)' = \cos$, using it here assumes the conclusion; the honest proof is the geometric squeeze $\cos x \le \sin x/x \le 1$ from comparing a triangle, a circular sector and a larger triangle. Dependency order matters in calculus more than it appears to: many "quick" evaluations of standard limits are circular in exactly this way.
```

{{image: Mean value theorem | For a function continuous on a closed interval and differentiable on its interior, there is at least one interior point where the tangent is parallel to the chord joining the endpoints — that is, where the instantaneous rate of change equals the average rate across the interval. Rolle's theorem is the special case in which the chord is horizontal, and the general statement follows from it by subtracting the chord's linear function.}}

## 4. The Mean Value Theorem

**Rolle's Theorem.** If $f$ is continuous on $[a,b]$, differentiable on $(a,b)$, and $f(a) = f(b)$, then $f'(c) = 0$ for some $c \in (a,b)$.

*Proof.* By the Extreme Value Theorem $f$ attains a maximum and a minimum on $[a,b]$. If both occur at the endpoints then, since $f(a) = f(b)$, the maximum equals the minimum and $f$ is constant, so $f' \equiv 0$. Otherwise an extremum occurs at some interior $c$; there the difference quotient is $\le 0$ from one side and $\ge 0$ from the other, so the limit — which exists by differentiability — must be $0$. $\blacksquare$

**Mean Value Theorem.** If $f$ is continuous on $[a,b]$ and differentiable on $(a,b)$, there exists $c \in (a,b)$ with

$$f'(c) = \frac{f(b)-f(a)}{b-a}.$$

*Proof.* Subtract off the chord. Let

$$g(x) = f(x) - \left[f(a) + \frac{f(b)-f(a)}{b-a}(x-a)\right].$$

Then $g$ inherits continuity and differentiability from $f$, and $g(a) = g(b) = 0$. Rolle gives $c$ with $g'(c) = 0$, i.e. $f'(c) = \dfrac{f(b)-f(a)}{b-a}$. $\blacksquare$

The MVT is the workhorse behind most of what follows. Three corollaries:

**(i) Zero derivative means constant.** If $f' \equiv 0$ on an interval then $f$ is constant. *Proof:* for any $x_1 < x_2$, MVT gives $f(x_2)-f(x_1) = f'(c)(x_2-x_1) = 0$.

**(ii) Equal derivatives differ by a constant.** If $f' = g'$ on an interval then $f - g$ is constant, by (i) applied to $f-g$. **This is why the antiderivative carries $+C$, and why the constant is a genuine feature rather than a bookkeeping habit.**

**(iii) Sign of the derivative gives monotonicity.** If $f' > 0$ on an interval then $f$ is strictly increasing there, since $f(x_2)-f(x_1) = f'(c)(x_2-x_1) > 0$.

Note that (i) requires an **interval**. On the domain $(-\infty,0)\cup(0,\infty)$ the function equal to $1$ for $x>0$ and $0$ for $x<0$ has zero derivative and is not constant.

### 4.1 The Cauchy Mean Value Theorem

**Theorem.** If $f,g$ are continuous on $[a,b]$ and differentiable on $(a,b)$, there exists $c\in(a,b)$ with

$$\big[f(b)-f(a)\big]\,g'(c) = \big[g(b)-g(a)\big]\,f'(c).$$

*Proof.* Apply Rolle to $h(x) = [f(b)-f(a)]g(x) - [g(b)-g(a)]f(x)$. A short computation gives $h(a) = h(b) = f(b)g(a) - f(a)g(b)$, so Rolle supplies $c$ with $h'(c) = 0$, which is the claim. $\blacksquare$

Taking $g(x) = x$ recovers the ordinary MVT, so this is a strict generalisation. When $g' \ne 0$ on $(a,b)$ it can be divided into the form

$$\frac{f(b)-f(a)}{g(b)-g(a)} = \frac{f'(c)}{g'(c)},$$

which says that the ratio of *net changes* equals the ratio of *instantaneous rates* at a common point. That single interior point $c$ — the same one in both derivatives — is what the theorem buys, and it is exactly what the next result needs.

### 4.2 L'Hôpital's rule

**Theorem.** Suppose $f(a) = g(a) = 0$, both are differentiable near $a$, and $g'\ne 0$ near $a$. If $\lim_{x\to a} f'(x)/g'(x)$ exists, then

$$\lim_{x\to a}\frac{f(x)}{g(x)} = \lim_{x\to a}\frac{f'(x)}{g'(x)}.$$

*Proof.* For $x$ near $a$, apply the Cauchy MVT on the interval with endpoints $a$ and $x$. Since $f(a) = g(a) = 0$,

$$\frac{f(x)}{g(x)} = \frac{f(x)-f(a)}{g(x)-g(a)} = \frac{f'(c_x)}{g'(c_x)}$$

for some $c_x$ strictly between $a$ and $x$. As $x\to a$ the point $c_x$ is squeezed to $a$, so the right side tends to the assumed limit. $\blacksquare$

The rule also holds for $\infty/\infty$, for one-sided limits, and for $x\to\pm\infty$, by variants of the same argument.

**Worked example.** $\displaystyle\lim_{x\to0}\frac{e^x-1-x}{x^2}$. Both parts vanish at $0$, so differentiate top and bottom:

$$\frac{e^x-1}{2x} \quad\text{— still } 0/0 \text{, so again} \quad \frac{e^x}{2} \longrightarrow \frac12.$$

Numerically the quotient reads $0.517092$ at $x = 0.1$, $0.501671$ at $0.01$ and $0.500167$ at $0.001$ — converging to $\tfrac12$ as claimed.

**Three ways to misuse it.**

*Applying it to a form that is not indeterminate.* For $\lim_{x\to1}\dfrac{x^2+x}{x^2}$ substitution gives $2/1 = 2$. Differentiating anyway gives $(2x+1)/(2x) \to 3/2$ — a wrong answer produced by a valid-looking manipulation. **Check that the form is $0/0$ or $\infty/\infty$ before each application, including the second and third.**

*Circularity.* Using the rule on $\lim_{x\to0}\sin x/x$ requires knowing $(\sin)' = \cos$, which was proved from that limit.

*Assuming the converse.* If $\lim f'/g'$ fails to exist, nothing follows about $\lim f/g$. Take $f(x) = x^2\sin(1/x)$ and $g(x) = x$ at $0$: the quotient $f/g = x\sin(1/x) \to 0$ by the squeeze, while $f'/g' = 2x\sin(1/x)-\cos(1/x)$ oscillates and has no limit. The hypothesis runs one way only.

```checkpoint
q: Evaluate $\displaystyle\lim_{x\to 0}\frac{1-\cos x}{x^2}$ by l'Hôpital's rule.
a: $1$
x: One application gives $\sin x / 2x$, which is again $0/0$; stopping there and reading off "$\to 1$" ignores the factor of $2$ in the denominator.
a*: $\dfrac{1}{2}$
a: $0$
x: This is what substitution into $\sin x/(2x)$ gives if the $0/0$ form is missed — but the numerator and denominator both vanish, so substitution is not licensed.
a: The rule does not apply, because $\cos$ is not differentiable at $0$
x: $\cos$ is differentiable everywhere, with $(\cos x)' = -\sin x$. The hypotheses hold.
hint: Check after each differentiation whether the form is still indeterminate.
why: At $x=0$ both parts vanish, so the rule applies: differentiating gives $\dfrac{\sin x}{2x}$. This is *again* $0/0$, so the rule applies a second time: $\dfrac{\cos x}{2} \to \dfrac12$. (Alternatively, recognise $\dfrac{\sin x}{2x} = \dfrac12\cdot\dfrac{\sin x}{x} \to \dfrac12$.) The answer agrees with the conjugate-multiplication derivation, which obtained $\tfrac12$ without differentiating at all — and that route is the honest one here, since l'Hôpital on this limit uses $(\cos)' = -\sin$, itself proved from $\sin h/h \to 1$. The habitual error is applying the rule once more than the form permits: a third differentiation would give $-\sin x/0$, which is meaningless.
---
q: A student evaluates $\displaystyle\lim_{x\to 2}\frac{x^2+1}{x+3}$ by differentiating numerator and denominator, obtaining $\lim 2x/1 = 4$. What is wrong?
a: Nothing; l'Hôpital's rule always gives the limit of a quotient
x: The rule has a hypothesis — an indeterminate form — and produces wrong answers whenever it is applied without one, as here.
a*: The form is not indeterminate — substitution gives $5/5 = 1$ — so the rule does not apply and $4$ is wrong
a: The derivative of the denominator should be $3$, giving $2x/3 \to 4/3$
x: $(x+3)' = 1$, not $3$. But the arithmetic is beside the point: the rule should not have been used at all.
a: The rule applies but requires a second differentiation, giving $2/0$
x: A second application is even less justified than the first, and $2/0$ is not a limit.
hint: Substitute $x = 2$ into the original quotient before doing anything else.
why: At $x = 2$ the numerator is $5$ and the denominator is $5$, so the quotient is continuous there and the limit is simply $5/5 = 1$. L'Hôpital's rule requires the form $0/0$ or $\infty/\infty$; applied to a determinate quotient it computes the ratio of derivatives, which is an unrelated number — here $4$. The proof shows why: it depends on $f(a) = g(a) = 0$ to turn $f(x)/g(x)$ into $[f(x)-f(a)]/[g(x)-g(a)]$, and without that step the Cauchy MVT says nothing about the quotient. The discipline is to check the form before *every* application, since a quotient can start indeterminate and cease to be so after one differentiation.
```

## 5. Applications of the derivative

The derivative's practical content is that its sign and its zeros locate the features of a graph. Every statement here is a corollary of the MVT.

### 5.1 Critical points and the sign of $f'$

**Fermat's condition.** If $f$ has a local extremum at an interior point $c$ and $f'(c)$ exists, then $f'(c) = 0$.

*Proof.* At a local maximum the difference quotient $[f(c+h)-f(c)]/h$ is $\le 0$ for small $h>0$ and $\ge 0$ for small $h<0$. Both one-sided limits equal $f'(c)$, forcing $f'(c) \le 0$ and $f'(c)\ge0$. $\blacksquare$

A **critical point** is a point where $f' = 0$ *or* $f'$ fails to exist. Both cases must be collected: $f(x) = |x|$ has a minimum at $0$ with no derivative there. And the condition is necessary, not sufficient — $f(x) = x^3$ has $f'(0) = 0$ and no extremum.

**First derivative test.** By MVT corollary (iii), the sign of $f'$ determines monotonicity, so at a critical point $c$: if $f'$ changes $+$ to $-$, a local maximum; $-$ to $+$, a local minimum; no change, neither.

**Concavity.** $f'' > 0$ on an interval means $f'$ is increasing there — the slope steepens as $x$ grows, and the graph lies above each of its tangent lines. This is **concave up**; $f'' < 0$ is concave down. An **inflection point** is where the concavity changes, which requires $f''$ to change sign, not merely to vanish ($f(x) = x^4$ has $f''(0) = 0$ and is concave up on both sides).

**Second derivative test.** If $f'(c) = 0$ and $f''(c) > 0$ then $c$ is a local minimum; if $f''(c) < 0$, a local maximum; if $f''(c) = 0$, the test is silent and the first derivative test must be used. The Taylor expansion of the next section explains it in one line: near $c$, $f(x) \approx f(c) + \tfrac12 f''(c)(x-c)^2$, so the sign of $f''(c)$ is the direction the parabola opens.

**Worked curve analysis.** $f(x) = x^3 - 3x$.

- $f'(x) = 3x^2 - 3 = 3(x-1)(x+1)$, zero at $x = \pm1$.
- Sign of $f'$: positive on $(-\infty,-1)$, negative on $(-1,1)$, positive on $(1,\infty)$. So $f$ increases, decreases, increases.
- $x = -1$ is a local maximum with $f(-1) = -1+3 = 2$; $x = 1$ is a local minimum with $f(1) = 1-3 = -2$.
- $f''(x) = 6x$: concave down for $x<0$, concave up for $x>0$, inflection at $(0,0)$.
- Confirmation by the second derivative test: $f''(-1) = -6 < 0$ ✓ maximum, $f''(1) = 6 > 0$ ✓ minimum.

Neither extremum is global: $f(x)\to\pm\infty$ as $x\to\pm\infty$. The EVT is not contradicted — its hypothesis is a *closed bounded* interval, and $\mathbb{R}$ is neither.

### 5.2 Optimisation on a closed interval

The EVT guarantees a maximum and a minimum exist on $[a,b]$; Fermat's condition says where they can be. An extremum is either at an interior critical point or at an endpoint, and there are finitely many candidates, so **evaluate $f$ at every critical point and at both endpoints and compare**. No second-derivative test is needed, and none is sufficient — a local maximum can be beaten by an endpoint.

**Worked problem.** An open-topped box is made from a $12 \times 12$ sheet by cutting a square of side $x$ from each corner and folding up the flaps. Maximise the volume.

The base is $(12-2x)$ square and the height is $x$, so

$$V(x) = x(12-2x)^2 = 4x^3 - 48x^2 + 144x, \qquad x \in [0,6].$$

The domain endpoints are forced by geometry: $x \ge 0$, and $x \le 6$ or no base remains. Differentiate and factor:

$$V'(x) = 12x^2 - 96x + 144 = 12(x^2-8x+12) = 12(x-2)(x-6).$$

Critical points $x = 2$ and $x = 6$ (the latter also an endpoint). Evaluating the three candidates:

| $x$ | $V(x)$ |
|---|---|
| $0$ (endpoint) | $0$ |
| $2$ (critical) | $2\cdot 8^2 = 128$ |
| $6$ (endpoint) | $0$ |

The maximum volume is $\mathbf{128}$ cubic units at $x = 2$. A sanity check confirms it is the peak and not a plateau: $V(1.5) = 121.5$ and $V(2.5) = 122.5$, both below $128$. The second derivative test agrees — $V''(x) = 24x - 96$, so $V''(2) = -48 < 0$.

Two habits are worth fixing from this example. **State the domain from the geometry**, since it supplies the endpoints the comparison needs; and **compare values, not just signs**, because the theorem being used is the EVT, which is about attained values.

```checkpoint
q: $f(x) = x^4$ has $f'(0) = 0$ and $f''(0) = 0$. What can be concluded about $x = 0$?
a: It is neither a maximum nor a minimum, since the second derivative test fails
x: The test being inconclusive means it yields no conclusion — not a negative one. Another method must be used.
a*: The second derivative test is inconclusive, but the first derivative test shows a local (indeed global) minimum
a: It is an inflection point, since $f'' = 0$ there
x: $f''$ vanishing is necessary but not sufficient for an inflection; here $f'' = 12x^2 \ge 0$ on both sides, so concavity never changes.
a: $f$ is not twice differentiable at $0$, so no test applies
x: $x^4$ is a polynomial and infinitely differentiable everywhere; $f''(0) = 0$ is a value, not a failure to exist.
hint: Examine the sign of $f'(x) = 4x^3$ on each side of $0$.
why: $f'(x) = 4x^3$ is negative for $x<0$ and positive for $x>0$, so $f$ decreases then increases: by the first derivative test $x = 0$ is a local minimum, and since $x^4 \ge 0 = f(0)$ everywhere it is global. The second derivative test gives $f''(0) = 0$, which is precisely its inconclusive case — the quadratic term of the Taylor expansion vanishes and the behaviour is decided by the quartic term, which the test cannot see. As for concavity, $f'' = 12x^2 \ge 0$ everywhere, so the graph is concave up on both sides and $0$ is not an inflection point despite $f''$ vanishing there. The general lesson: an inconclusive test is not evidence, and the first derivative test — a direct corollary of the MVT — decides cases the second derivative test cannot.
---
q: Maximise $f(x) = x^3 - 3x$ on the closed interval $[0,3]$.
a: The maximum is $2$, at the local maximum $x = -1$
x: $x = -1$ is outside $[0,3]$. Critical points outside the interval are not candidates.
a*: The maximum is $18$, at the endpoint $x = 3$
a: The maximum is $-2$, at the critical point $x = 1$
x: $x=1$ is a local *minimum* ($f'' = 6 > 0$ there), and $-2$ is in fact the smallest of the three candidate values.
a: There is no maximum, since $f$ is unbounded above
x: $f$ is unbounded on $\mathbb{R}$, but on a closed bounded interval the EVT guarantees a maximum is attained.
hint: List every candidate — interior critical points inside the interval, plus both endpoints — and compare the values of $f$.
why: $f'(x) = 3x^2-3$ vanishes at $x = \pm1$, of which only $x = 1$ lies in $[0,3]$. The candidates are therefore $x = 0$, $x = 1$ and $x = 3$, with $f(0) = 0$, $f(1) = -2$ and $f(3) = 27-9 = 18$. The maximum is $18$ at the right endpoint, and the minimum is $-2$ at the interior critical point. This is the whole closed-interval method, and it rests on two theorems: the EVT says a maximum exists, and Fermat's condition says an interior one must be critical — so the finite candidate list is exhaustive. Note that the global maximum here sits where $f' \neq 0$; no derivative test would have found it, which is exactly why endpoints must be evaluated rather than merely classified.
```

## 6. The Riemann integral

### 6.1 Construction

Partition $[a,b]$ by $a = x_0 < x_1 < \cdots < x_n = b$, writing $\Delta x_i = x_i - x_{i-1}$. For bounded $f$, set

$$m_i = \inf_{[x_{i-1},x_i]} f, \qquad M_i = \sup_{[x_{i-1},x_i]} f,$$

and form the **lower** and **upper sums**

$$L(f,P) = \sum_{i=1}^n m_i\,\Delta x_i, \qquad U(f,P) = \sum_{i=1}^n M_i\,\Delta x_i.$$

Every lower sum underestimates and every upper sum overestimates whatever "the area" should mean, and refining a partition raises $L$ and lowers $U$. Define the lower and upper integrals as $\sup_P L(f,P)$ and $\inf_P U(f,P)$. When they coincide, $f$ is **Riemann integrable** and the common value is $\int_a^b f$.

Equivalently, and more usefully in computation, choose any sample point $x_i^*$ in each subinterval and form the **Riemann sum** $\sum_i f(x_i^*)\Delta x_i$; the integral is its limit as the mesh $\max_i \Delta x_i \to 0$.

**Theorem.** Every continuous function on $[a,b]$ is Riemann integrable. (Uniform continuity on a closed bounded interval makes $M_i - m_i$ uniformly small once the mesh is small, so $U - L \to 0$.)

**A non-integrable function.** The Dirichlet function

$$D(x) = \begin{cases} 1 & x \in \mathbb{Q}\\ 0 & x \notin \mathbb{Q}\end{cases}$$

has $m_i = 0$ and $M_i = 1$ on every subinterval, since rationals and irrationals are both dense. So $L(D,P) = 0$ and $U(D,P) = 1$ for every partition, the lower and upper integrals are $0$ and $1$, and $D$ is not Riemann integrable on $[0,1]$. Boundedness alone is not enough.

### 6.2 A definite integral from the definition

Compute $\int_0^1 x^2\,dx$ directly. Partition into $n$ equal pieces, $\Delta x = 1/n$, sampling right endpoints $x_i = i/n$:

$$S_n = \sum_{i=1}^{n}\left(\frac{i}{n}\right)^2\frac{1}{n} = \frac{1}{n^3}\sum_{i=1}^n i^2.$$

Using $\displaystyle\sum_{i=1}^n i^2 = \frac{n(n+1)(2n+1)}{6}$ (provable by induction):

$$S_n = \frac{n(n+1)(2n+1)}{6n^3} = \frac{(n+1)(2n+1)}{6n^2} = \frac{2n^2+3n+1}{6n^2}.$$

| $n$ | $S_n$ |
| --- | --- |
| 1 | 1.000000 |
| 2 | 0.625000 |
| 10 | 0.385000 |
| 100 | 0.338350 |
| 1000 | 0.333833 |
| $\to\infty$ | $1/3$ |

Dividing numerator and denominator by $n^2$ gives $S_n \to 2/6 = \boxed{1/3}$.

This is the honest cost of the definition. The Fundamental Theorem will produce the same number in one line.

```checkpoint
q: Why is the Dirichlet function $D$ (1 on rationals, 0 on irrationals) not Riemann integrable on $[0,1]$?
a: Because it is unbounded
x: $D$ takes only the values 0 and 1, so it is bounded. Unboundedness is a different obstruction.
a*: Because every subinterval contains both rationals and irrationals, so $m_i = 0$ and $M_i = 1$ for every partition, giving $L = 0$ and $U = 1$ — the lower and upper integrals never meet
a: Because it is discontinuous at some points
x: Finitely many, or even countably many, discontinuities are compatible with integrability; $D$ is discontinuous *everywhere*, which is the relevant fact.
a: Because the rationals are countable and so contribute zero area
x: That reasoning gives the Lebesgue integral (which is 0), not the Riemann integral, and it is precisely the refinement Riemann's definition lacks.
hint: Compute the infimum and supremum of $D$ on an arbitrary subinterval.
why: Riemann integrability requires the lower and upper integrals to agree. Both $\mathbb{Q}$ and its complement are dense, so every subinterval of positive length contains points where $D = 0$ and points where $D = 1$; hence $m_i = 0$ and $M_i = 1$ regardless of how fine the partition is. Then $L(D,P) = \sum 0\cdot\Delta x_i = 0$ and $U(D,P) = \sum 1\cdot\Delta x_i = 1$ for every $P$, so the lower integral is 0, the upper is 1, and they never converge. Boundedness is necessary but not sufficient. The Lebesgue integral does assign $D$ the value 0, because it partitions the *range* rather than the domain and the rationals have measure zero — which is exactly the deficiency in Riemann's construction that motivates measure theory.
```

## 7. The Fundamental Theorem of Calculus

### 7.1 Part 1: differentiating an accumulation

**Theorem.** If $f$ is continuous on $[a,b]$ and $A(x) = \displaystyle\int_a^x f(t)\,dt$, then $A$ is differentiable on $(a,b)$ with $A'(x) = f(x)$.

*Proof.* For $h > 0$,

$$A(x+h) - A(x) = \int_x^{x+h} f(t)\,dt.$$

By the Mean Value Theorem for integrals (itself a consequence of the IVT applied to a continuous $f$), there is $c_h \in [x, x+h]$ with $\int_x^{x+h} f = f(c_h)\,h$. Hence

$$\frac{A(x+h)-A(x)}{h} = f(c_h).$$

As $h \to 0$ we have $c_h \to x$, and continuity of $f$ gives $f(c_h) \to f(x)$. The same argument handles $h < 0$. So $A'(x) = f(x)$. $\blacksquare$

**Consequence.** Every continuous function has an antiderivative — namely its own accumulation function. This is an existence theorem, and it holds even when no formula in elementary functions exists, as for $e^{-x^2}$.

### 7.2 Part 2: evaluating

**Theorem.** If $f$ is continuous on $[a,b]$ and $F$ is **any** antiderivative of $f$, then

$$\int_a^b f(x)\,dx = F(b) - F(a).$$

*Proof.* By Part 1, $A(x) = \int_a^x f$ is an antiderivative of $f$, and $A(a) = 0$. By MVT corollary (ii), $F$ and $A$ differ by a constant: $F = A + C$. Then

$$F(b) - F(a) = (A(b)+C) - (A(a)+C) = A(b) - A(a) = A(b) = \int_a^b f. \qquad \blacksquare$$

**The parabola in one line.** $F(x) = x^3/3$ satisfies $F' = x^2$, so

$$\int_0^1 x^2\,dx = F(1) - F(0) = \frac{1}{3} - 0 = \frac{1}{3},$$

matching the Riemann-sum computation with no limit and no summation formula.

### 7.3 Part 1 with a variable upper limit

If the upper limit is a function of $x$, combine Part 1 with the chain rule. For $H(x) = \displaystyle\int_0^{x^2}\sin t\,dt$, put $A(u) = \int_0^u \sin t\,dt$ so $A'(u) = \sin u$, and $u = x^2$:

$$H'(x) = A'(x^2)\cdot\frac{d}{dx}(x^2) = \sin(x^2)\cdot 2x = 2x\sin(x^2).$$

**Evaluate the integrand at the limit and multiply by the limit's derivative.** Do not differentiate the integrand.

```checkpoint
q: Compute $\dfrac{d}{dx}\displaystyle\int_1^{x^3} e^{t^2}\,dt$.
a: $e^{x^6}$
x: This applies Part 1 but omits the chain-rule factor from the upper limit $x^3$.
a*: $3x^2 e^{x^6}$
a: $2t e^{t^2}$ evaluated at $t = x^3$, i.e. $2x^3e^{x^6}$
x: This differentiates the integrand, which Part 1 never asks for — the integrand is evaluated, not differentiated.
a: It cannot be computed, since $e^{t^2}$ has no elementary antiderivative
x: Part 1 needs no formula for the antiderivative; that is precisely its power.
hint: Set $A(u) = \int_1^u e^{t^2}dt$, note $A'(u) = e^{u^2}$, and differentiate $A(x^3)$.
why: Let $A(u) = \int_1^u e^{t^2}\,dt$. Part 1 gives $A'(u) = e^{u^2}$ directly, with no antiderivative formula required — and none exists in elementary terms for $e^{t^2}$, which is exactly why the theorem is valuable. The quantity asked for is $A(x^3)$, so the chain rule gives $\frac{d}{dx}A(x^3) = A'(x^3)\cdot 3x^2 = e^{(x^3)^2}\cdot 3x^2 = 3x^2e^{x^6}$. Two standard errors appear above: dropping the factor $3x^2$, and differentiating the integrand instead of evaluating it. The rule to carry away is *evaluate the integrand at the upper limit, then multiply by that limit's derivative.*
---
q: Evaluate $\displaystyle\int_1^3 (2x+1)\,dx$, and check the answer geometrically.
a: $8$
x: Check against the trapezoid: heights $f(1)=3$ and $f(3)=7$, width 2, area $\tfrac{3+7}{2}\cdot 2 = 10$.
a*: $10$
a: $12$
x: This is $F(3) = 9+3$ without subtracting $F(1) = 2$.
a: $20$
x: This doubles the correct area — possibly from using the sum of the heights rather than their mean.
hint: Find $F$ with $F' = 2x+1$, then compute $F(3) - F(1)$; separately compute the area of a trapezoid.
why: An antiderivative is $F(x) = x^2 + x$, since $F'(x) = 2x+1$. By Part 2, $\int_1^3(2x+1)dx = F(3)-F(1) = (9+3)-(1+1) = 12-2 = 10$. Geometrically the region under $y = 2x+1$ from 1 to 3 is a trapezoid with parallel sides $f(1) = 3$ and $f(3) = 7$ and width 2, so its area is $\frac{3+7}{2}\cdot 2 = 10$. The agreement is not a coincidence but an instance of the theorem: for a linear integrand the trapezoid rule is exact, because the error term in that rule involves the second derivative, which vanishes here. Note also that any other antiderivative — say $x^2+x+17$ — gives the same answer, since the constant cancels in the subtraction.
```

## 8. Techniques of integration

Both principal techniques are the differentiation rules run backwards. Neither is a trick.

### 8.1 Substitution — the chain rule reversed

The chain rule says $\dfrac{d}{dx}F(g(x)) = F'(g(x))g'(x)$. Integrating both sides:

$$\int f(g(x))\,g'(x)\,dx = F(g(x)) + C, \qquad F' = f.$$

Operationally, put $u = g(x)$, $du = g'(x)\,dx$.

**Worked example.** $\displaystyle\int 2x\sqrt{1+x^2}\,dx$. Let $u = 1+x^2$, so $du = 2x\,dx$ and the integral becomes

$$\int \sqrt{u}\,du = \frac{2}{3}u^{3/2} + C = \frac{2}{3}(1+x^2)^{3/2} + C.$$

*Check by differentiating:* $\frac{2}{3}\cdot\frac{3}{2}(1+x^2)^{1/2}\cdot 2x = 2x\sqrt{1+x^2}$. ✓

**With limits, change them too.** $\displaystyle\int_0^1 2x\sqrt{1+x^2}\,dx$: as $x$ runs $0 \to 1$, $u$ runs $1 \to 2$, so

$$\int_1^2 \sqrt u\,du = \frac{2}{3}u^{3/2}\Big|_1^2 = \frac{2}{3}\left(2\sqrt2 - 1\right) \approx 1.2190.$$

Converting the limits avoids substituting back and is less error-prone.

### 8.2 Integration by parts — the product rule reversed

From $(uv)' = u'v + uv'$, integrate and rearrange:

$$\int u\,dv = uv - \int v\,du.$$

The technique is a trade: it replaces one integral with another, and is useful only when the new one is easier. **Choose $u$ to be the factor that simplifies on differentiation.**

**Worked example.** $\displaystyle\int x e^{x}\,dx$. Take $u = x$ (differentiates to 1) and $dv = e^x dx$ (integrates to $e^x$):

$$\int xe^x\,dx = xe^x - \int e^x\,dx = xe^x - e^x + C = e^x(x-1)+C.$$

*Check:* $\frac{d}{dx}\left[e^x(x-1)\right] = e^x(x-1) + e^x = xe^x$. ✓

**The wrong choice.** Taking $u = e^x$ and $dv = x\,dx$ gives $\frac{x^2}{2}e^x - \int \frac{x^2}{2}e^x dx$ — a harder integral than the original. The method is sound; the choice was not.

### 8.3 Partial fractions

Neither of the two techniques above touches a quotient of polynomials with a factorable denominator. For those, split the fraction first; each piece is then a logarithm, an arctangent or a power.

**Worked example.** $\displaystyle\int\frac{dx}{x^2-1}$. Factor and posit a decomposition:

$$\frac{1}{(x-1)(x+1)} = \frac{A}{x-1} + \frac{B}{x+1} \quad\Longrightarrow\quad A(x+1) + B(x-1) = 1.$$

The identity holds for all $x$, so substitute convenient values: $x = 1$ gives $2A = 1$, and $x = -1$ gives $-2B = 1$. Hence $A = \tfrac12$, $B = -\tfrac12$, and

$$\int\frac{dx}{x^2-1} = \frac12\ln|x-1| - \frac12\ln|x+1| + C = \frac12\ln\left|\frac{x-1}{x+1}\right| + C.$$

*Check by differentiating* at $x = 2$: the answer's derivative is $\tfrac12\left(\tfrac{1}{x-1}-\tfrac{1}{x+1}\right) = \tfrac{1}{x^2-1}$, which at $x=2$ is $\tfrac13$; numerical differentiation of $\tfrac12\ln\left|\tfrac{x-1}{x+1}\right|$ at $2$ gives $0.3333333$. ✓

The general rules: each distinct linear factor $(x-r)$ contributes a term $A/(x-r)$; a repeated factor $(x-r)^k$ contributes $A_1/(x-r) + \cdots + A_k/(x-r)^k$; an irreducible quadratic contributes $(Ax+B)/(x^2+px+q)$, which integrates to a logarithm plus an arctangent. If the numerator's degree is not smaller than the denominator's, divide first. It follows that **every rational function has an elementary antiderivative** — a guarantee that fails immediately outside that class: $e^{-x^2}$ and $\sin(x^2)$ have none.

```checkpoint
q: Which technique evaluates $\displaystyle\int x\cos(x^2)\,dx$, and what is the result?
a: Integration by parts with $u = x$, giving $x\sin(x^2) - \int \sin(x^2)\,dx$
x: This is valid algebra but leaves $\int\sin(x^2)dx$, which has no elementary antiderivative — the trade made the problem harder.
a*: Substitution with $u = x^2$, giving $\tfrac12\sin(x^2) + C$
a: The power rule, giving $\tfrac{x^2}{2}\sin(x^2) + C$
x: There is no such rule for products, and differentiating this does not return the integrand.
a: It has no elementary antiderivative
x: It does — the factor $x$ is precisely what makes the substitution $u = x^2$ work.
hint: Ask whether the integrand contains an inner function together with (a multiple of) that function's derivative.
why: The integrand has the form $f(g(x))g'(x)$ up to a constant: with $g(x) = x^2$, $g'(x) = 2x$, and the integrand is $\tfrac12\cos(g(x))g'(x)$. Substituting $u = x^2$, $du = 2x\,dx$, so $x\,dx = \tfrac12 du$ and the integral becomes $\tfrac12\int\cos u\,du = \tfrac12\sin u + C = \tfrac12\sin(x^2)+C$. Differentiating checks it: $\tfrac12\cos(x^2)\cdot 2x = x\cos(x^2)$. The signal for substitution is an inner function accompanied by its derivative; the signal for parts is a product of two unrelated factors, one of which simplifies when differentiated. Note that $\int\cos(x^2)dx$ alone — without the factor $x$ — is *not* elementary, so the presence of that factor is the whole point.
---
q: For $\displaystyle\int x^2\ln x\,dx$, which choice of $u$ in integration by parts leads anywhere?
a: $u = x^2$, $dv = \ln x\,dx$
x: This requires integrating $\ln x$ first — possible, but it makes the remaining integral no simpler, so nothing is gained.
a*: $u = \ln x$, $dv = x^2dx$, because $\ln x$ differentiates to the simpler $1/x$ while $x^2$ integrates easily
a: Neither; substitution with $u = \ln x$ is the correct method
x: Substitution needs the integrand to contain $g'$ alongside $g$; here $1/x$ does not appear as a factor.
a: Neither; the integral is not elementary
x: It is elementary, and parts with the right choice produces it in one step.
hint: Ask which factor becomes simpler when differentiated, and which is easy to integrate.
why: Parts trades $\int u\,dv$ for $uv - \int v\,du$, so it pays only when $du$ is simpler than $u$ and $v$ is obtainable. Here $\ln x$ differentiates to $1/x$ — a genuine simplification, since the logarithm disappears — while $x^2$ integrates to $x^3/3$ without difficulty. So $u = \ln x$, $dv = x^2dx$ gives $v = x^3/3$, $du = dx/x$, and $\int x^2\ln x\,dx = \frac{x^3}{3}\ln x - \int\frac{x^3}{3}\cdot\frac{1}{x}dx = \frac{x^3}{3}\ln x - \frac{x^3}{9} + C$. Differentiating returns $x^2\ln x + \frac{x^2}{3} - \frac{x^2}{3} = x^2\ln x$. ✓ The reverse choice forces you to integrate $\ln x$ and leaves an integral no easier than the original — the method is sound either way, but only one choice makes progress.
```

{{image: Riemann sum | Rectangles approximating the area under a curve, with the approximation sharpening as the partition is refined. Each rectangle contributes a sampled function value times the width of its subinterval; the integral is defined as the common limit of the lower sums built from each subinterval's infimum and the upper sums built from its supremum, when those two limits agree. The construction is what makes the definite integral a number rather than a formula, and what the Fundamental Theorem then allows one to bypass.}}

## 9. Improper integrals

The Riemann integral was constructed for a **bounded** function on a **bounded** closed interval. Drop either hypothesis and the construction does not apply — there is no partition of $[1,\infty)$ into finitely many subintervals, and no finite supremum $M_i$ on a subinterval where the function blows up. Such integrals are therefore *defined*, as limits of the proper ones.

$$\int_a^{\infty} f = \lim_{R\to\infty}\int_a^{R} f, \qquad \int_a^b f = \lim_{t\to a^+}\int_t^b f \ \ \text{when } f \text{ is unbounded near } a.$$

If the limit exists and is finite the integral **converges**; otherwise it **diverges**. An integral improper at both ends, or at an interior point, is split into pieces that are each improper at one end only, and converges only if **every** piece does.

### 9.1 The $p$-test

The decisive family is $x^{-p}$, and it must be tested separately at infinity and at the origin. For $p\ne1$,

$$\int_1^R x^{-p}\,dx = \frac{x^{1-p}}{1-p}\bigg|_1^R = \frac{R^{1-p}-1}{1-p}.$$

As $R\to\infty$ the term $R^{1-p}$ tends to $0$ if $p>1$ and to $\infty$ if $p<1$. For $p = 1$ the antiderivative is $\ln R$, which diverges — slowly, but it diverges: at $R = 10^6$ it is only $13.8$, and no ceiling exists. Hence

$$\int_1^{\infty}\frac{dx}{x^p} \ \text{ converges} \iff p > 1, \quad\text{with value } \frac{1}{p-1}.$$

At the origin the inequality reverses. $\displaystyle\int_t^1 x^{-p}dx = \frac{1-t^{1-p}}{1-p}$, and $t^{1-p}\to0$ as $t\to0^+$ requires $1-p>0$:

$$\int_0^{1}\frac{dx}{x^p} \ \text{ converges} \iff p < 1, \quad\text{with value } \frac{1}{1-p}.$$

The two conditions are incompatible, so $\int_0^\infty x^{-p}dx$ diverges for **every** $p$: a power that decays fast enough at infinity is necessarily too singular at zero. The borderline $p=1$ fails at both ends, and it is worth seeing why the same exponent is critical in both places — near $0$ the mass is controlled by how fast $x^{1-p}$ vanishes, near $\infty$ by how fast it grows, and $p=1$ is where that power becomes $x^0$.

### 9.2 Comparison, and a worked convergent case

**Comparison test.** If $0 \le f \le g$ on $[a,\infty)$ and $\int_a^\infty g$ converges, so does $\int_a^\infty f$; if $\int_a^\infty f$ diverges, so does $\int_a^\infty g$. The truncated integrals of $f$ increase with $R$ and are bounded above, so they converge — monotone and bounded is the whole argument.

*Use.* $\displaystyle\int_1^\infty \frac{dx}{x^3+1}$ converges, since $\frac{1}{x^3+1} < \frac{1}{x^3}$ and $p=3>1$. No antiderivative is needed to settle convergence, which is the point of the test.

**Worked evaluation.** $\displaystyle\int_0^{\infty} x e^{-x}\,dx$. Integrate by parts on $[0,R]$ with $u = x$, $dv = e^{-x}dx$, so $v = -e^{-x}$:

$$\int_0^R x e^{-x}dx = \left[-xe^{-x}\right]_0^R + \int_0^R e^{-x}dx = -Re^{-R} + \left[-e^{-x}\right]_0^R = 1 - (R+1)e^{-R}.$$

Now let $R\to\infty$. The term $(R+1)e^{-R}$ is an $\infty\cdot 0$ form; rewrite it as $(R+1)/e^{R}$ — now $\infty/\infty$ — and l'Hôpital gives $1/e^R \to 0$. Hence

$$\int_0^\infty xe^{-x}\,dx = 1.$$

**A warning about symmetry.** $\displaystyle\int_{-1}^{1}\frac{dx}{x}$ is improper at the interior point $0$ and must be split. Both halves diverge, so the integral diverges — it is **not** $0$. Cancelling the two infinities by letting the same $t$ approach from both sides defines the *principal value*, a different and weaker object. The rule is that each piece must converge on its own; symmetry is not a substitute.

```checkpoint
q: For which $p$ does $\displaystyle\int_1^{\infty}\frac{dx}{x^p}$ converge?
a: $p \ge 1$
x: The endpoint $p=1$ gives $\int_1^R dx/x = \ln R$, which grows without bound. The inequality must be strict.
a*: $p > 1$
a: $p < 1$
x: That is the condition at the *origin*. For $p<1$ the antiderivative $x^{1-p}/(1-p)$ grows without bound as $R \to \infty$.
a: All $p > 0$, since $x^{-p} \to 0$ in every case
x: The integrand tending to zero is necessary but nowhere near sufficient — $1/x$ tends to zero and its integral still diverges.
hint: Compute $\int_1^R x^{-p}dx$ explicitly and ask when $R^{1-p}$ stays bounded.
why: For $p\ne1$, $\int_1^R x^{-p}dx = \dfrac{R^{1-p}-1}{1-p}$, which has a finite limit exactly when the exponent $1-p$ is negative, i.e. $p>1$; the value is then $\dfrac{1}{p-1}$. For $p=1$ the antiderivative is $\ln R \to \infty$, so the borderline case diverges and the condition is strict. The intuition that "the integrand goes to zero, so the area is finite" is precisely what $p=1$ refutes: decay is not enough, the decay must be fast enough. At the origin the test reverses — $\int_0^1 x^{-p}dx$ converges iff $p<1$ — so the same exponent is critical at both ends and no single $p$ works for $\int_0^\infty$.
---
q: $\displaystyle\int_{-1}^{1}\frac{dx}{x^2}$ — what is its value?
a: $-2$, from $\left[-1/x\right]_{-1}^{1} = -1 - 1$
x: This applies the FTC across a point where the integrand is unbounded, so the theorem's hypotheses fail. The negative answer is itself the alarm: the integrand is positive everywhere.
a*: It diverges, since the integrand is unbounded at the interior point $0$ and each half diverges
a: $2$, by symmetry: twice $\int_0^1 dx/x^2$
x: The doubling is right in spirit, but $\int_0^1 dx/x^2$ itself diverges — $p = 2 \ge 1$ at the origin — so twice it is still divergent.
a: $0$, since the integrand is even and the interval is symmetric
x: Evenness gives equality of the two halves, not cancellation; and equal infinities do not sum to zero.
hint: Check whether the integrand is bounded on the interval before applying the FTC.
why: The integrand blows up at $x = 0$, an interior point, so the integral must be split into $\int_{-1}^0$ and $\int_0^1$ and each treated as a limit. For the right half, $\int_t^1 x^{-2}dx = \left[-1/x\right]_t^1 = 1/t - 1 \to \infty$ as $t\to0^+$: divergent, consistent with the $p$-test at the origin, which requires $p<1$ and here has $p=2$. Since one piece diverges, so does the whole. The answer $-2$ comes from applying the FTC blindly, and it is impossible on its face — a positive integrand cannot yield a negative integral, which is the check that catches this class of error every time. Note that $-1/x$ is a valid antiderivative on $(0,1]$ and on $[-1,0)$ separately, but not on any interval containing $0$, and the FTC needs one that works across the whole range of integration.
```

## 10. Taylor's theorem

Polynomials are the functions we can actually evaluate. Taylor's theorem says how well a polynomial can approximate a general function, and — crucially — bounds the error.

**Theorem (Taylor with Lagrange remainder).** If $f$ is $(n+1)$-times differentiable on an interval containing $a$ and $x$, then

$$f(x) = \underbrace{\sum_{k=0}^{n}\frac{f^{(k)}(a)}{k!}(x-a)^k}_{P_n(x)} + \underbrace{\frac{f^{(n+1)}(\xi)}{(n+1)!}(x-a)^{n+1}}_{R_n(x)}$$

for some $\xi$ strictly between $a$ and $x$.

The remainder has exactly the form of the next term, with the derivative evaluated at an unknown interior point — which is the Mean Value Theorem generalised ($n = 0$ recovers it precisely).

**Worked error bound.** Approximate $e^{0.5}$ by the cubic Taylor polynomial about $0$. Since $f^{(k)}(x) = e^x$ and $f^{(k)}(0)=1$,

$$P_3(x) = 1 + x + \frac{x^2}{2} + \frac{x^3}{6}, \qquad P_3(0.5) = 1 + 0.5 + 0.125 + 0.0208\overline{3} = 1.6458\overline{3}.$$

The remainder is $R_3 = \dfrac{e^{\xi}}{4!}(0.5)^4$ with $0 < \xi < 0.5$. Bounding $e^\xi < e^{0.5} < 1.6488$:

$$|R_3| < \frac{1.6488 \times 0.0625}{24} = 4.294\times10^{-3}.$$

The true value is $e^{0.5} = 1.64872127$, so the actual error is $2.888\times10^{-3}$ — **within the bound, as required.** The bound is not tight, because $\xi$ was replaced by the worst case; that is the price of a guarantee valid without knowing $\xi$.

## 11. What to carry away

- **One construction, applied twice.** The limit produces the derivative from a difference quotient and the integral from a Riemann sum. Every technique in the chapter is one of these two run forwards or backwards.
- **The $\varepsilon$–$\delta$ definition is a strategy, not a formula.** Given $\varepsilon$, produce $\delta$. For $f(x) = mx+c$, $\delta = \varepsilon/|m|$; for non-linear $f$, cap $\delta$ first to bound the uncontrolled factor, then take a $\min$.
- **Cancel before you take the limit.** Every derivative computation from the definition works by removing the $h$ from the denominator algebraically; only then is substitution legal.
- **Differentiable $\Rightarrow$ continuous, and not conversely.** $|x|$ at $0$ is the counterexample. And $x^2\sin(1/x)$ shows that a derivative can exist everywhere yet fail to be continuous.
- **Hypotheses are not decoration.** The IVT and EVT need a closed bounded interval; MVT corollary (i) needs an interval, not merely a domain; l'Hôpital needs an indeterminate form. Each fails on a concrete example when the hypothesis is dropped.
- **The squeeze theorem is what makes trigonometry differentiable.** $\sin x / x \to 1$ is proved geometrically, and every trigonometric derivative depends on it — so evaluating that limit by l'Hôpital is circular.
- **Order of dependency matters.** Limit laws come from the definition; the derivative from the laws; the MVT from Rolle and the EVT; l'Hôpital from the Cauchy MVT; the second derivative test from Taylor. Nothing here may be used before what it rests on.
- **The derivative's sign and zeros locate everything.** $f' = 0$ or undefined gives the candidates, the sign of $f'$ classifies them, the sign of $f''$ gives concavity — but on a closed interval the endpoints must be evaluated too, since the EVT is about attained values.
- **The MVT is the engine.** It gives $f'\equiv 0 \Rightarrow f$ constant, hence the $+C$ in every antiderivative, hence Part 2 of the FTC.
- **Boundedness does not give integrability.** The Dirichlet function has $L = 0$ and $U = 1$ for every partition.
- **The FTC in two directions.** Part 1: $\frac{d}{dx}\int_a^x f = f(x)$, which guarantees an antiderivative exists even when no formula does. Part 2: $\int_a^b f = F(b)-F(a)$, which replaces an infinite limit by two evaluations.
- **Substitution is the chain rule reversed; parts is the product rule reversed.** Substitution wants an inner function accompanied by its derivative; parts wants a factor that simplifies on differentiation.
- **Rational functions always integrate in elementary terms; almost nothing else does.** Partial fractions guarantee it, and $e^{-x^2}$ shows how quickly the guarantee runs out.
- **An improper integral is a limit, not an integral.** Convergence is decided piece by piece, and the $p$-test is critical at $p = 1$ at both ends — with the inequality reversing between the origin and infinity.
- **Taylor bounds the error, not just the approximation.** $R_n$ has the shape of the next term with the derivative at an unknown interior point; bounding that derivative gives a guarantee.

## Practice

Full solutions follow each problem.

**Problem 1.** Prove from the definition that $\lim_{x\to 1}(5x - 2) = 3$.

*Solution.* The output gap is $|(5x-2)-3| = |5x-5| = 5|x-1|$. To force it below $\varepsilon$, require $|x-1| < \varepsilon/5$; take $\delta = \varepsilon/5$. Then $0 < |x-1| < \delta$ gives $|(5x-2)-3| = 5|x-1| < 5\cdot\varepsilon/5 = \varepsilon$. $\blacksquare$

**Problem 2.** Differentiate $f(x) = \sqrt{x}$ at $x > 0$ from the definition.

*Solution.* Rationalise the numerator to expose the factor $h$:

$$\frac{\sqrt{x+h}-\sqrt{x}}{h} = \frac{(\sqrt{x+h}-\sqrt{x})(\sqrt{x+h}+\sqrt{x})}{h(\sqrt{x+h}+\sqrt{x})} = \frac{(x+h)-x}{h(\sqrt{x+h}+\sqrt x)} = \frac{1}{\sqrt{x+h}+\sqrt x}.$$

The $h$ has cancelled, so the limit is a substitution: $f'(x) = \dfrac{1}{2\sqrt x}$ — the power rule with $n = 1/2$. $\blacksquare$

**Problem 3.** Find all $c$ guaranteed by the MVT for $f(x) = x^2$ on $[1,4]$, and verify the hypotheses.

*Solution.* $f$ is a polynomial, hence continuous on $[1,4]$ and differentiable on $(1,4)$; both hypotheses hold. The average rate is

$$\frac{f(4)-f(1)}{4-1} = \frac{16-1}{3} = 5.$$

Setting $f'(c) = 2c = 5$ gives $c = 2.5$, which lies in $(1,4)$. ✓ For a quadratic the MVT point is always the midpoint of the interval, since $f'$ is linear. $\blacksquare$

**Problem 4.** Evaluate $\displaystyle\int_0^{\pi/2}\sin^3 x\cos x\,dx$.

*Solution.* The integrand contains $\sin x$ together with its derivative $\cos x$, so substitute $u = \sin x$, $du = \cos x\,dx$. Limits: $x = 0 \Rightarrow u = 0$; $x = \pi/2 \Rightarrow u = 1$. Then

$$\int_0^{\pi/2}\sin^3x\cos x\,dx = \int_0^1 u^3\,du = \frac{u^4}{4}\Big|_0^1 = \frac{1}{4}. \qquad\blacksquare$$

**Problem 5.** Evaluate $\displaystyle\int_0^{\pi} x\sin x\,dx$.

*Solution.* A product of unrelated factors, one of which simplifies on differentiation — use parts with $u = x$, $dv = \sin x\,dx$, so $du = dx$ and $v = -\cos x$:

$$\int_0^\pi x\sin x\,dx = \left[-x\cos x\right]_0^\pi + \int_0^\pi\cos x\,dx = \left(-\pi\cos\pi - 0\right) + \left[\sin x\right]_0^\pi = \pi + 0 = \pi.$$

Using $\cos\pi = -1$ and $\sin\pi = \sin 0 = 0$. $\blacksquare$

**Problem 6.** Let $G(x) = \displaystyle\int_2^{\cos x} e^{t^2}\,dt$. Find $G'(x)$.

*Solution.* Put $A(u) = \int_2^u e^{t^2}dt$; FTC Part 1 gives $A'(u) = e^{u^2}$ with no antiderivative formula needed. With $u = \cos x$ and the chain rule,

$$G'(x) = A'(\cos x)\cdot\frac{d}{dx}\cos x = e^{\cos^2 x}\cdot(-\sin x) = -\sin x\,e^{\cos^2 x}. \qquad\blacksquare$$

**Problem 7.** Show that $f(x) = x^3 + x - 1$ has exactly one real root.

*Solution.* **Existence:** $f(0) = -1 < 0$ and $f(1) = 1 > 0$, and $f$ is continuous, so the IVT gives a root in $(0,1)$. **Uniqueness:** $f'(x) = 3x^2 + 1 \ge 1 > 0$ for all $x$, so by MVT corollary (iii) $f$ is strictly increasing on $\mathbb{R}$ and therefore injective — it cannot take the value $0$ twice. Hence exactly one root. $\blacksquare$

**Problem 8.** Approximate $\sqrt{1.1}$ using the quadratic Taylor polynomial of $f(x) = \sqrt{x}$ about $a = 1$, and bound the error.

*Solution.* $f(x) = x^{1/2}$, $f'(x) = \tfrac12 x^{-1/2}$, $f''(x) = -\tfrac14 x^{-3/2}$, $f'''(x) = \tfrac38 x^{-5/2}$. At $a=1$: $f(1)=1$, $f'(1)=\tfrac12$, $f''(1)=-\tfrac14$. So

$$P_2(x) = 1 + \tfrac12(x-1) - \tfrac18(x-1)^2, \qquad P_2(1.1) = 1 + 0.05 - 0.00125 = 1.04875.$$

Remainder: $R_2 = \dfrac{f'''(\xi)}{3!}(0.1)^3$ with $1 < \xi < 1.1$. Since $f'''(\xi) = \tfrac38\xi^{-5/2} \le \tfrac38$ on that interval,

$$|R_2| \le \frac{3/8}{6}(0.001) = 6.25\times10^{-5}.$$

The true value is $\sqrt{1.1} = 1.0488088\ldots$, so the actual error is $5.9\times10^{-5}$ — inside the bound. $\blacksquare$

**Problem 9.** Find the tangent line to the curve $x^2 + xy + y^2 = 3$ at the point $(1,1)$.

*Solution.* First confirm the point lies on the curve: $1 + 1 + 1 = 3$ ✓. Differentiate implicitly, treating $y$ as a function of $x$ and using the product rule on $xy$:

$$2x + \left(y + x\frac{dy}{dx}\right) + 2y\frac{dy}{dx} = 0 \quad\Longrightarrow\quad \frac{dy}{dx}\left(x + 2y\right) = -(2x+y) \quad\Longrightarrow\quad \frac{dy}{dx} = -\frac{2x+y}{x+2y}.$$

At $(1,1)$ the slope is $-3/3 = -1$, so the tangent is $y - 1 = -(x-1)$, i.e. $y = 2 - x$. $\blacksquare$

**Problem 10.** A rectangular pen is built against a straight wall, so only three sides need fencing. With $60$ m of fence available, maximise the enclosed area.

*Solution.* Let $x$ be the length of each of the two sides perpendicular to the wall, so the side parallel to it is $60 - 2x$ and

$$A(x) = x(60-2x) = 60x - 2x^2, \qquad x \in [0,30],$$

the domain coming from the geometry: no side can be negative. Then $A'(x) = 60 - 4x$, zero at $x = 15$. Compare the three candidates: $A(0) = 0$, $A(15) = 15\cdot30 = 450$, $A(30) = 0$. The maximum area is $\mathbf{450\ \text{m}^2}$, with dimensions $15 \times 30$ m. The second derivative test agrees, $A'' = -4 < 0$. Note that the optimum puts *half* the fence parallel to the wall — not the square that an unconstrained perimeter would give, because the wall supplies one side free. $\blacksquare$

**Problem 11.** Evaluate $\displaystyle\lim_{x\to0}\frac{\tan x - x}{x^3}$.

*Solution.* Both parts vanish at $0$, so l'Hôpital applies:

$$\frac{\sec^2 x - 1}{3x^2} = \frac{\tan^2 x}{3x^2} = \frac13\left(\frac{\tan x}{x}\right)^2,$$

using the identity $\sec^2 x - 1 = \tan^2 x$. Since $\dfrac{\tan x}{x} = \dfrac{\sin x}{x}\cdot\dfrac{1}{\cos x} \to 1\cdot1 = 1$, the limit is $\dfrac13$. Numerically the original quotient reads $0.334672$ at $x = 0.1$ and $0.333347$ at $x=0.01$ — converging to $1/3$. ✓ (Applying l'Hôpital twice more also works, but the identity avoids two rounds of messy differentiation.) $\blacksquare$

**Problem 12.** Does $\displaystyle\int_2^{\infty}\frac{dx}{x\ln x}$ converge?

*Solution.* Substitute $u = \ln x$, $du = dx/x$. As $x$ runs $2 \to R$, $u$ runs $\ln 2 \to \ln R$, so

$$\int_2^R\frac{dx}{x\ln x} = \int_{\ln 2}^{\ln R}\frac{du}{u} = \ln(\ln R) - \ln(\ln 2).$$

As $R\to\infty$ this grows without bound, so the integral **diverges**. Worth noting: the integrand is *smaller* than $1/x$ for $x > e$, and $\int_2^\infty dx/x$ already diverges — so comparison in that direction proves nothing, which is why the substitution was necessary. Divergence here is extraordinarily slow: reaching $\ln(\ln R) = 10$ requires $R = e^{e^{10}}$. Slow divergence is still divergence. $\blacksquare$

## Further reading

{{book: Michael Spivak | Calculus | 2008}}

{{book: Tom M. Apostol | Calculus, Volume 1 | 1967}}

{{book: Walter Rudin | Principles of Mathematical Analysis | 1976}}

Spivak is the standard rigorous single-variable treatment and its problems are the real content. Apostol develops integration before differentiation, which makes the Fundamental Theorem land as a genuine surprise rather than a formality. Rudin is where to go once the material here is comfortable and the $\varepsilon$–$\delta$ arguments need to be done in general metric spaces rather than on the line.$mathSVC_master$,
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
