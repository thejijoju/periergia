-- Space Exploration · Propulsion & Ascent — "Staging as Constrained
-- Optimization" (Lecture 3). Curated, human-reviewed master for
-- astronomy-and-space/space-exploration/rockets/staging @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert. Shorter depths are
-- distilled from this master (the delete drops derived caches on change).
--
-- Original, house-styled rework of ASTR-191 Lecture 3: why the empty tank is
-- the enemy; the two-stage build and why per-stage payload fractions multiply;
-- the n-stage sweep and why the optimum is two or three (not infinity); the
-- Lagrange-multiplier optimal-split theorem and why the Saturn V's giant first
-- stage does little of the Δv; parallel staging and the asparagus fantasy; and
-- the graveyard of vehicles that refused to stage. KaTeX math; literal currency
-- escaped; body Postgres dollar-quoted.
--
-- Embeds interactive ```example blocks (staging-payload-fraction,
-- staging-marginal-gain, staging-min-stages) rendered as infinite practice
-- boxes (src/components/WorkedExample.tsx), plus a curated self-test.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/space-exploration/rockets/staging',
    'research',
    'advanced',
    'read',
    $l3_master$> Staging is the one move that beats the *combination* of the rocket equation's two locked constraints — not by improving either, but by refusing to carry empty tanks through velocity changes they do not need. It turns a vehicle that yields negative payload into an industry, and the optimal way to do it is a constrained-optimization problem Tsiolkovsky essentially solved in his head in 1903.

## Cold open: the rocket that could not lift itself

Restate the problem exactly as the rocket equation left it, because the impossibility should be fresh in mind before it is resolved.

Consider a single-stage rocket. A good one. Methane/oxygen engine, $I_{sp} = 350$ s, so $v_e = 3{,}432$ m/s — better than the Saturn V's first-stage engines. A structural coefficient $\varepsilon = 0.08$ — excellent engineering, the kind that requires pressure-stabilized tanks and a team that fights over every kilogram. Mission: low Earth orbit, Δv = 9.4 km/s.

Running the numbers gives:

$$\lambda = \frac{1/R - \varepsilon}{1-\varepsilon} = \frac{0.0646 - 0.08}{0.92} = \mathbf{-1.67\%}$$

**Negative payload.** Not a small payload. Not an expensive payload. A payload that cannot exist, because the algebra forbids it. The rocket is 8% structure and needs to be no more than 6.46% non-propellant, and 8 is bigger than 6.46, and so the vehicle **cannot lift its own empty tanks off the pad**, let alone a satellite. There is nothing to descope. It is not a bad rocket. It is not a rocket at all — it's a very expensive way to make a hole in Florida.

And the impossibility theorem proved this isn't bad luck. It says a single stage cannot exceed $\Delta v_{\max} = v_e \ln(1/\varepsilon)$, and for these numbers that's $3{,}432 \times \ln(12.5) = 8{,}670$ m/s — short of 9.4 km/s while carrying *nothing*. The X-33 died in exactly this gap, taking \$1.3 billion with it, over about the mass of the paint.

So here is the situation. Chemistry won't give us more $v_e$ (the chapter on the thermochemical ceiling — the wall is real and Clark checked it with fire). Materials won't give us much less $\varepsilon$ (tanks are made of atoms). Both knobs are seized. **And getting to orbit is, provably, impossible for a single stage.**

Now consider changing *one thing* — not the engine, not the structural fraction, not the mission, not the propellant, not the budget, not the century. One structural idea. And the very same vehicle, built the very same way, out of the very same materials, goes from **−1.67%** payload to **+3.59%** payload — from *nonexistent* to *industry standard*.

The one thing is this: **stop carrying the empty tanks.**

That's it. That's the entire idea. And Tsiolkovsky had it in 1903, before anyone had flown anything at all, sitting in a wooden house in Kaluga, deaf, with a pencil. He called it a "rocket train." We call it staging. It is the single most important structural idea in the history of spaceflight, and it follows — as everything in this field follows — from taking the rocket equation seriously and asking it the right question.

The right question is: *why is the empty tank still here?*

---

## Why the empty tank is the enemy

Be precise about what goes wrong in a single stage, because the diagnosis contains the cure.

Recall the compound-interest picture from the rocket equation. The rocket equation is compound interest because **every kilogram of propellant must be accelerated by all the propellant beneath it.** The first gram of propellant is a catastrophe — it has to push itself, all the propellant above it, the tanks, the engines, *and* the payload. The last gram is nearly free — almost nothing left to push.

Now ask: what is the tank doing during all this?

At the **start** of the burn, the tank is full, and it's doing its job — containing propellant against pressure and inertial loads. Fair enough. It's earning its mass.

At the **end** of the burn, the tank is empty. And it is still there. It is still bolted to the vehicle. And the engine is still firing, still delivering Δv, still accelerating everything attached to it — **including a large, empty, useless metal tank that now contains nothing but vacuum and regret.**

Here is the crime, stated as sharply as possible: **at the end of the burn, you are spending your most precious, most expensive, most exponentially-taxed Δv — the Δv at the top of the climb, delivered by an engine that has already lifted everything this far — to accelerate an empty tank that will never hold propellant again.**

The empty tank is $\varepsilon$-mass. It's the $m_s$ in $m_f = m_s + m_{pl}$. And in the payload formula, it sits *right next to the payload*, competing with it for the tiny burnout-mass budget:

$$m_f = \underbrace{m_s}_{\text{empty tank}} + \underbrace{m_{pl}}_{\text{the point}}$$

Every kilogram of empty tank you drag to burnout is a kilogram of payload you didn't carry. And in a single stage, you drag **all** of it to burnout, because there's nowhere to put it down.

Look at what this does numerically. In the impossible single-stage vehicle: at burnout the vehicle masses 6.46% of liftoff, and the structure alone is **8.13%** of liftoff (computed in the overview). The structure is *bigger than the entire burnout mass*. The empty tanks, dragged all the way to orbital velocity, outweigh everything the vehicle has left. The payload isn't just small — it's been evicted, by its own empty fuel tanks, from a vehicle that arrived at orbit as a hollow aluminium shell moving at 7.67 km/s with nothing inside it.

**So the fix writes itself, and it's the through-line of the whole argument arriving for the third time:**

> *Never carry anything through a Δv it does not need to experience.*

The empty tank does not need to experience the Δv at the top of the climb. It's empty. It has done its job. It is now pure liability, being accelerated at exponential cost for no reason. **So drop it.** The instant a tank is empty, let it go — let it fall away, tumble back, burn up in the atmosphere, whatever. Physically detach the dead mass from the vehicle so the remaining engine doesn't have to accelerate it through the expensive Δv that's left.

That is staging. A "stage" is just a chunk of the vehicle — tank, engine, structure — that you use up and then **jettison**, so that the Δv still to come is delivered to a lighter vehicle. You are not carrying the empty tanks to orbit. You are dropping them along the way, each one the moment it becomes dead weight, so that the final, most-expensive Δv is spent accelerating only the things that still need to go fast.

---

## The two-stage rocket, built from scratch

Build the fix. Same engine ($v_e = 3{,}432$ m/s), same structural coefficient ($\varepsilon = 0.08$ for each stage), same mission (9.4 km/s). But now two stages, and — for the moment, to be optimized properly below — split the Δv **evenly**: 4.7 km/s each.

The key idea in the arithmetic is this: **the payload of the first stage is the entire second stage.** Stage 1 doesn't know or care that its "payload" is itself a rocket. It just sees a mass it has to accelerate by 4.7 km/s. So compute the stages **from the top down** — figure out how big stage 2 must be to deliver the real payload, then treat that whole assembly as the payload for stage 1.

Actually, it's cleaner to work **bottom-up in mass ratios and multiply**, which is the elegant way, because it reveals the structure.

**Per-stage mass ratio.** Each stage does 4.7 km/s:
$$R_{\text{stage}} = e^{4700/3432} = e^{1.3695} = 3.933$$

**Per-stage payload fraction.** Using the payload formula derived earlier, where now "payload" means "everything above this stage":
$$\lambda_{\text{stage}} = \frac{1/R - \varepsilon}{1-\varepsilon} = \frac{1/3.933 - 0.08}{0.92} = \frac{0.25426 - 0.08}{0.92} = \frac{0.17426}{0.92} = 0.18942$$

So **each stage delivers, as "payload," 18.94% of its own mass.** Stage 1's payload (18.94% of the full stack) is stage 2. Stage 2's payload (18.94% of stage 2) is the actual satellite.

**The payloads multiply:**
$$\lambda_{\text{total}} = \lambda_1 \times \lambda_2 = (0.18942)^2 = \mathbf{0.03588 = 3.59\%}$$

**There it is.** From −1.67% to +3.59%. From a vehicle that cannot lift its own tanks to a vehicle that puts 3.59% of its liftoff mass into orbit. **Same engine. Same materials. Same everything.** Nothing changed except the choice to drop the first stage's empty tanks after 4.7 km/s instead of dragging them to orbit.

The *mechanism* deserves to be vivid, because "the payloads multiply" is easy to write and easy to not feel. Here's what physically happens:

1. **Liftoff.** The full stack — stage 1, stage 2, payload — leaves the pad. Stage 1's engine fires and delivers 4.7 km/s to *everything*: both stages plus payload. Expensive, but stage 1 is the big cheap dense stage built for exactly this (the chapter on the thermochemical ceiling).
2. **Staging event.** Stage 1's tanks are empty. **It is jettisoned** — explosive bolts fire, springs push, and 6.48% of the original liftoff mass (stage 1's empty structure) falls away and is never accelerated another meter. This is the whole trick, happening in about a tenth of a second.
3. **Second burn.** Stage 2's engine fires and delivers the *remaining* 4.7 km/s — but now it's accelerating only stage 2 and the payload, a tiny fraction of the original stack. The expensive top-of-the-climb Δv is spent on almost nothing but the payload.

The empty stage-1 tanks experienced the first 4.7 km/s (they had to — they were holding the propellant that delivered it) but were spared the *second* 4.7 km/s. And 4.7 km/s of Δv on a rocket is a mass-ratio factor of 3.93 — so by not carrying stage 1's 6.48% of dead structure through the second burn, that dead mass is spared from being multiplied by 3.93, which is exactly where the payload came from.

### Check it against reality

The napkin model — one engine number, one structural coefficient, an even split — predicts 3.59% payload to LEO. Consider how the real machines did:

| Vehicle | Liftoff mass | Payload to LEO | Payload fraction |
|---|---|---|---|
| **Saturn V** | 2,970 t | 140 t | **4.7%** |
| **Falcon 9** (expendable) | 549 t | 22.8 t | **4.2%** |
| **Soyuz** | 308 t | 7.0 t | **2.3%** |
| **Space Shuttle** | 2,030 t | 27.5 t (+ orbiter) | **1.4%** |
| **Atlas V 401** | 334 t | 9.8 t | **2.9%** |

The estimate of 3.59% lands **right in the middle of the real vehicles.** The Saturn V beats it because it used hydrogen upper stages (better $v_e$ where it counts — the chapter on the thermochemical ceiling) and had superb structural coefficients from a nation spending 4.4% of its federal budget. The Shuttle *badly* underperforms because it carried a 78-tonne winged orbiter to orbit *as payload it paid for on every flight* (autopsied in the chapter on reusability). But the point stands: **a napkin, one logarithm, and one structural coefficient predicted the payload fraction of the most complex machines ever built, to within a percentage point.**

This is the point made in the overview: *this is what it feels like when you actually understand something.* You are not memorizing that the Saturn V put 140 tonnes in orbit. You are **deriving** it, from momentum conservation and a structural fraction, on the back of an envelope, and getting it right. That's the difference between knowing a fact and owning a field.

---

```example
staging-payload-fraction
```

## The general n-stage formula, and the temptation it creates

Generalize. For $n$ stages, the total payload fraction is the product of the per-stage payload fractions:

$$\boxed{\;\lambda_{\text{total}} = \prod_{i=1}^{n}\lambda_i = \prod_{i=1}^{n}\frac{1/R_i - \varepsilon_i}{1 - \varepsilon_i}\;}$$

where $R_i = e^{\Delta v_i / v_{e,i}}$ and $\sum_i \Delta v_i = \Delta v_{\text{total}}$.

This formula raises an obvious, seductive question: **if two stages are so much better than one, why not three? Why not ten? Why not a hundred stages, each dropping a sliver of tank?**

The naive intuition says: more stages = more dead weight dropped = better. And there's truth in it. But actually compute it, because the answer has a beautiful shape and it's *not* "more is always better."

Take the standard case — $v_e = 3{,}432$, $\varepsilon = 0.08$ per stage, Δv = 9.4 km/s total, split evenly among $n$ stages — and sweep $n$:

**$n = 1$:** $R = e^{9400/3432} = e^{2.739} = 15.47$. $\lambda = (0.06464 - 0.08)/0.92 = \mathbf{-1.67\%}$. Impossible.

**$n = 2$:** each does 4.7 km/s. $\lambda = (0.18942)^2 = \mathbf{3.59\%}$.

**$n = 3$:** each does 3.133 km/s. $R_i = e^{3133/3432} = e^{0.9130} = 2.492$. $\lambda_i = (0.40128 - 0.08)/0.92 = 0.34922$. $\lambda = (0.34922)^3 = \mathbf{4.26\%}$.

**$n = 4$:** each does 2.35 km/s. $R_i = e^{0.6847} = 1.983$. $\lambda_i = (0.50429 - 0.08)/0.92 = 0.46118$. $\lambda = (0.46118)^4 = \mathbf{4.52\%}$.

**$n = 5$:** each does 1.88 km/s. $R_i = e^{0.5478} = 1.729$. $\lambda_i = (0.57837 - 0.08)/0.92 = 0.54171$. $\lambda = (0.54171)^5 = \mathbf{4.67\%}$.

**$n = 10$:** each does 0.94 km/s. $R_i = e^{0.2739} = 1.315$. $\lambda_i = (0.76046 - 0.08)/0.92 = 0.73963$. $\lambda = (0.73963)^{10} = \mathbf{4.95\%}$.

**$n = \infty$:** the theoretical limit. As $n \to \infty$, each stage does infinitesimal Δv, and the payload fraction approaches its ceiling.

Tabulate the pattern:

| Stages $n$ | Payload fraction | Gain over previous |
|---|---|---|
| 1 | −1.67% | (impossible) |
| 2 | 3.59% | +5.26 points (∞ improvement) |
| 3 | 4.26% | +0.67 points |
| 4 | 4.52% | +0.26 points |
| 5 | 4.67% | +0.15 points |
| 6 | 4.77% | +0.10 points |
| 10 | 4.95% | ~0.04/stage |
| ∞ | ~5.2% | → 0 |

**Look at this shape. This is the entire economics of staging in one column.**

The jump from 1 to 2 stages is **infinite** — it's the difference between "impossible" and "works." You *must* have at least two stages; there is no negotiation.

The jump from 2 to 3 is large — **+0.67 points, nearly a 20% relative improvement in payload.** Worth it, clearly. Every serious orbital rocket has at least a strong case for a third stage or its equivalent.

The jump from 3 to 4 is **+0.26 points** — real, but now you're weighing it against the cost of an entire extra stage: another engine, another set of tanks, another separation event that can fail, more plumbing, more integration, more things to go wrong.

The jump from 4 to 5 is **+0.15 points.** From 5 to 6, **+0.10.** This is deep in diminishing returns, and the diminishing returns are *diminishing* — each stage buys less than the last, and the sum converges to a ceiling around 5.2% that you can never exceed no matter how many stages you add.

---

## Why three stages is wise and four is a joke

The naive optimization — "maximize payload fraction, ignore everything else" — says use infinitely many stages. Reality says use two or three. The gap between those answers is the most important lesson here, and it's a lesson about **what the idealized model leaves out.**

The payload-fraction formula assumed $\varepsilon$ is a fixed constant, the same for every stage, unaffected by how many stages you have. **This is false, and the falseness is exactly what kills the many-stage fantasy.** Here's what the formula doesn't see:

**Every stage has fixed overhead that doesn't scale down.** A stage isn't just a tank and a nozzle. It has: an engine (which has a minimum practical mass — you can't build a meaningful engine below a certain size), avionics, a flight computer, guidance, wiring, a power supply, a separation system (explosive bolts, springs, sensors), interstage structure to connect it to the next stage, and often its own attitude-control thrusters. **Much of this is roughly constant regardless of how much propellant the stage holds.** So as you make stages smaller (to have more of them), the *fixed overhead* becomes a larger and larger fraction of each stage — **$\varepsilon$ gets worse for smaller stages.** The formula assumed $\varepsilon = 0.08$ for all stages; in reality, a tiny stage might have $\varepsilon = 0.20$ or worse, because the engine and avionics don't shrink.

**Every separation event is a chance to die.** Each staging event is a moment where explosive bolts must fire correctly, the spent stage must cleanly separate without recontact, and the next engine must ignite reliably (a "hard start" or a failed ignition here is mission loss). Separation failures are a real and historically significant cause of launch failure. **With $n$ stages you have $n-1$ separation events, each an independent opportunity for catastrophe.** Reliability multiplies: if each separation is 99% reliable, two separations give 98%, but ten separations give only 90% — you've thrown away a tenth of your missions to staging failures alone. **More stages means lower reliability, and reliability is worth more than the fraction of a percent of payload that the extra stage buys.**

**Every stage is cost, complexity, and integration time.** Each stage is a separate vehicle to design, build, test, and integrate. Each interface between stages is a source of problems. The engineering and financial cost of an additional stage is enormous, and it buys you — per the table — a fraction of a percentage point of payload once you're past three.

**So the real optimization isn't "maximize payload fraction."** It's "maximize payload fraction *minus* the cost of complexity *minus* the reliability penalty *minus* the $\varepsilon$-degradation of small stages." And when you include all of that, the optimum lands at **two or three stages, essentially always.**

- **Two stages** is the minimum to reach orbit and captures the infinite jump from impossible to possible. Many rockets are effectively two-stage (Falcon 9: booster + upper stage).
- **Three stages** (or two stages plus strap-on boosters, which are a kind of parallel "stage zero") captures most of the remaining gain — the +0.67 points from 2→3 — while keeping separation events and complexity manageable. The Saturn V was three stages. Most heavy-lift vehicles are three-ish.
- **Four stages** is rare and usually indicates a special situation — a small solid-motor upper stage for a specific high-energy orbit, or a kick stage. The +0.26 points almost never justifies the fourth separation event and the fourth engine.
- **Ten stages** is a joke. Nobody has ever built it, nobody ever will, because the +0.04-points-per-stage is dwarfed a thousandfold by the reliability collapse and the $\varepsilon$-degradation and the cost.

**The general rule, which you should carry:** the optimal number of stages is where the *marginal payload gain* from one more stage equals the *marginal cost* (in mass, reliability, and money) of adding it — and because the payload gains fall off a cliff after stage 2 while the costs stay roughly constant per stage, that crossover lands at 2 or 3 for essentially every real vehicle. **The idealized formula says infinity; the real world says three; and the entire gap is the stuff the formula pretended didn't exist.** This is, incidentally, a perfect instance of a theme from the earlier self-correction: *a closed-form model is an error-detector and a guide, but its assumptions are where the real engineering lives, and you must always ask what it left out.*

---

```example
staging-marginal-gain
```

## The optimal split: Lagrange multipliers, and the theorem at the heart of Unit I

So far the Δv has been split evenly among stages. Is that right? For the standard case (identical stages), it can be proven that it *is* — but the proof reveals *why*, and the "why" tells you what to do when the stages are *not* identical, which is every real rocket. This is the mathematical centerpiece of Unit I. Work through it slowly.

### Setting up the problem

The goal is to **maximize the total payload fraction** subject to the constraint that **the stage Δv's sum to the required total.** This is a constrained optimization — the natural home of Lagrange multipliers.

For clarity, maximize $\ln \lambda_{\text{total}}$ instead of $\lambda_{\text{total}}$ (same maximum, since $\ln$ is monotonic, and the log turns the product into a sum, which is far easier to differentiate). Write it in terms of the mass ratios $R_i$, with $\Delta v_i = v_{e,i}\ln R_i$.

$$\ln\lambda_{\text{total}} = \sum_{i=1}^{n}\ln\lambda_i = \sum_{i=1}^{n}\ln\left(\frac{1/R_i - \varepsilon_i}{1-\varepsilon_i}\right)$$

**Constraint:** $\sum_i \Delta v_i = \sum_i v_{e,i}\ln R_i = \Delta v_{\text{total}}$ (a fixed number).

### The Lagrangian

Form the Lagrangian, introducing a multiplier $\mu$ for the constraint:

$$\mathcal{L} = \sum_{i}\ln\left(\frac{1/R_i - \varepsilon_i}{1-\varepsilon_i}\right) - \mu\left(\sum_i v_{e,i}\ln R_i - \Delta v_{\text{total}}\right)$$

Take $\partial\mathcal{L}/\partial R_i = 0$ for each stage. The $(1-\varepsilon_i)$ in the denominator is a constant (it doesn't depend on $R_i$), so its log differentiates to zero. Focus on the rest:

$$\frac{\partial}{\partial R_i}\left[\ln\left(\frac{1}{R_i} - \varepsilon_i\right)\right] - \mu\, v_{e,i}\frac{\partial}{\partial R_i}\ln R_i = 0$$

Compute each derivative. First term: let $f = 1/R_i - \varepsilon_i$, so $f' = -1/R_i^2$, and $\frac{d}{dR_i}\ln f = f'/f = \dfrac{-1/R_i^2}{1/R_i - \varepsilon_i}$. Second term: $\dfrac{d}{dR_i}\ln R_i = 1/R_i$. So:

$$\frac{-1/R_i^2}{1/R_i - \varepsilon_i} - \mu\, v_{e,i}\frac{1}{R_i} = 0$$

Multiply through by $R_i$:

$$\frac{-1/R_i}{1/R_i - \varepsilon_i} = \mu\, v_{e,i}$$

Clean up the left side by multiplying numerator and denominator by $R_i$:

$$\frac{-1}{1 - \varepsilon_i R_i} = \mu\, v_{e,i}$$

So, rearranging to isolate the structure:

$$\boxed{\;\frac{1}{v_{e,i}}\cdot\frac{1}{\varepsilon_i R_i - 1} = \mu \quad\text{for every stage } i\;}$$

**This is the optimal-staging condition.** It says: at the optimum, a particular combination of each stage's exhaust velocity, structural coefficient, and mass ratio takes **the same value $\mu$ for every stage.** The stages are "balanced" — you've distributed the Δv so that no stage is working harder (relative to its own efficiency) than any other. If one stage were off-balance, you could shift a little Δv to or from it and gain payload; the optimum is where no such shift helps.

### The identical-stage case: proving the even split

Now specialize to identical stages: all $v_{e,i} = v_e$ and all $\varepsilon_i = \varepsilon$. The condition becomes:

$$\frac{1}{v_e}\cdot\frac{1}{\varepsilon R_i - 1} = \mu \quad\Rightarrow\quad \varepsilon R_i - 1 = \frac{1}{\mu v_e} = \text{same constant for all } i$$

Therefore **all the $R_i$ are equal.** And since $\Delta v_i = v_e \ln R_i$, equal mass ratios means **equal Δv per stage.** 

**The even split is optimal — but only when the stages are identical.** This proves what was assumed above, and more importantly, it derives the machinery that tells you what to do when they're *not* identical.

### The real lesson: unequal stages want unequal Δv

Here's where it gets useful, because **no real rocket has identical stages.** The first stage burns dense kerosene at sea level (poor $v_e$, must fight the atmosphere); the upper stage burns hydrogen in vacuum (excellent $v_e$, low $\varepsilon$ concerns different). So $v_{e,1} \neq v_{e,2}$ and $\varepsilon_1 \neq \varepsilon_2$, and the even split is **wrong.**

The condition $\frac{1}{v_{e,i}(\varepsilon_i R_i - 1)} = \mu$ tells you the direction. Rearrange it to see what happens as you vary a stage's properties:

- **A stage with higher $v_{e,i}$** (better engine): to keep $\frac{1}{v_{e,i}(\varepsilon_i R_i - 1)}$ equal to $\mu$, a larger $v_{e,i}$ must be compensated by a larger $(\varepsilon_i R_i - 1)$, meaning **a larger $R_i$, meaning more Δv.** *Give more Δv to the stage with the better engine.*
- **A stage with lower $\varepsilon_i$** (lighter structure): similarly pushes toward **more Δv for that stage.** *Give more Δv to the stage with lighter structure.*

**The principle, in one sentence:** *at the optimum, you load more of the total Δv onto the stages that do Δv most efficiently — the ones with high exhaust velocity and low structural coefficient.* This is deeply intuitive once you see it: if one stage is a better rocket than another, make it do more of the work. The Lagrange condition just tells you *precisely* how much more.

### Why this explains the Saturn V

Now consider what real rockets actually do, and note how the theorem predicts it. The Saturn V's first stage (S-IC, kerolox) delivered only about **2.7 km/s** of the ~9.4 km/s to orbit — *less than a third* of the total, despite being by far the largest and most powerful stage. The upper stages (S-II and S-IVB, both hydrolox) delivered the rest. 

**Why does the giant first stage do so little of the Δv?** Because it's the *worst* rocket in the stack, in exactly the terms the theorem cares about: its kerolox engines have poor $v_e$ (the chapter on the thermochemical ceiling), it operates at sea level where the atmosphere further degrades $v_e$ (as derived earlier), and it fights drag and gravity losses (the chapter on ascent). By the optimal-staging condition, a stage with *low* $v_{e,i}$ should get *less* Δv. So the first stage's job is to be the brawny, cheap, dense workhorse that lifts the whole stack off the pad and punches it through the thick atmosphere at high thrust — delivering modest Δv — and then hand off *early* to the efficient hydrogen upper stages, which do the majority of the Δv up in vacuum where their high $v_e$ pays off maximally.

**This is not a coincidence or a tradition. It is the Lagrange condition, satisfied.** Von Braun's team didn't split the Δv evenly and they were right not to, because their stages weren't identical, and the mathematics just derived says: give the efficient stages more work. The Saturn V's staging is a physical embodiment of $\frac{1}{v_{e,i}(\varepsilon_i R_i - 1)} = \mu$, and now you can look at any rocket's Δv split and read off which stages the designers considered their "good" rockets.

**And notice the recursion with the chapter on the thermochemical ceiling.** That chapter found propellant should be chosen by *position* (dense low, light-exhaust high). This one finds Δv should be *distributed* by efficiency (more to the good stages). These are the same insight from two directions: the upper stage gets the good propellant *and* the larger Δv share, precisely because it operates where efficiency compounds hardest. The whole vehicle is a single optimization wearing two hats.

---

## Parallel staging, and the trick nobody builds

Everything so far has been **serial** (or **tandem**) staging: stages stacked end to end, fired in sequence, dropped one after another. There's another topology, and understanding why it's rarely used teaches you something.

### Parallel staging (strap-on boosters)

In **parallel staging**, some stages fire *simultaneously* at liftoff, side by side. The classic example is **strap-on boosters** — the solid rocket boosters on the Space Shuttle and SLS, the liquid boosters on Atlas V, the four strap-ons on Soyuz. All the boosters plus the core stage ignite together on the pad; the boosters burn out first and are jettisoned while the core continues.

Why do this? **Thrust at liftoff.** Recall the impossibility theorem and the gravity-loss discussion (previewing the chapter on ascent): getting off the pad requires thrust-to-weight greater than 1, and high thrust-to-weight minimizes gravity losses. A big heavy stack needs enormous liftoff thrust — more than the core engines alone can provide. Strap-on boosters add that thrust for the crucial first minutes, then leave. They're a "stage zero" that solves the thrust problem, not the $v_e$ problem — which is exactly why they're often **solids** (a problem in an earlier chapter, and the chapter on the thermochemical ceiling): solids have terrible $I_{sp}$ but cheap, dense, enormous thrust, and you drop them before their bad $I_{sp}$ does much damage. *Use the bad engine where its badness doesn't count, then drop it.*

### Propellant cross-feed and the "asparagus" fantasy

Here's a clever idea that looks brilliant on paper and almost never gets built. In parallel staging, all engines fire from liftoff — but what if the outer boosters could **feed their propellant to the center core's engines** as well as their own? Then the center engines run entirely on booster propellant during the early flight, and the center core's *own* tanks are still full when the boosters are jettisoned. You drop empty boosters and continue with a full core — effectively getting the mass-ratio benefit of many stages while only physically separating a few times.

Taken to the extreme — many boosters, each feeding the next inward, dropped in sequence as they empty — this is called **"asparagus staging,"** and in idealized calculations it gives spectacular payload fractions, approaching the infinite-stage limit with only a few physical separation events.

**So why does nobody build it?** Because propellant cross-feed between vehicles *in flight* is a plumbing and reliability nightmare. You need high-flow propellant couplings connecting separate tanks across a structural interface, carrying cryogenic propellant at high pressure, that must transfer thousands of kilograms per second reliably and then **cleanly disconnect at staging without leaking, freezing, or exploding.** The valves, seals, and structural connections are enormous, heavy (hurting $\varepsilon$, the thing you were trying to improve), and each is a new failure mode. SpaceX studied cross-feed for Falcon Heavy, designed it, and then **quietly abandoned it** — the complexity wasn't worth the payload gain, and they got the performance they needed another way (throttling the center core early and running the boosters harder). 

**The asparagus lesson is the many-stages lesson again:** the idealized formula loves it (more effective stages, higher payload fraction), and the real world rejects it (the plumbing to achieve it costs more in mass and reliability than the payload it buys). Every time the math says "infinite subdivision is optimal," reality answers with the mass and failure-probability of the mechanisms required to subdivide. **The optimum is always finite, and it's always lower than the idealization, because subdividing has costs the idealization refuses to count.**

---

## The graveyard: what happens when you refuse to stage

Staging has been proven the loophole that makes orbit possible, and the optimum is two or three stages. Now the cautionary tales — the programs that tried to defy this, because they're where the theory gets its teeth, and because the same graveyard will inform the chapter on reusability too.

### X-33 / VentureStar — the ghost from an earlier chapter

This was buried in the previous chapters, so briefly: VentureStar was a **single-stage-to-orbit** vehicle. It refused to stage. By the impossibility theorem, that required a structural coefficient (~0.073) that no one has ever achieved for a hydrogen vehicle that must *also* be a reusable spaceplane with wings, landing gear, and thermal protection. The composite hydrogen tank failed in test (November 1999), the aluminum replacement pushed $\varepsilon$ past the point where payload went negative, and the program died in 2001 having spent ~\$1.3 billion. **It died because it tried to skip the one move that makes orbit possible.** SSTO isn't stupid — if you could build a 5%-structure hydrogen stage it would win — it's that it has no margin, and mass growth (which is a law of nature) eats the whole payload. Staging *gives you margin*: a two-stage rocket that comes in heavy loses a little payload and flies; an SSTO that comes in heavy does not exist.

### Roton — the helicopter that wanted to be a rocket

In the late 1990s, a company called Rotary Rocket proposed the **Roton**, a single-stage-to-orbit vehicle that would land using helicopter rotor blades (with small rocket thrusters on the blade tips). It was gloriously creative and it captured a lot of imagination and investment. It also had to be an SSTO, with all the same impossibility-theorem problems, *plus* the mass of a rotor system it had to carry to orbit and back. A full-scale atmospheric test vehicle flew a few hops in 1999. The company ran out of money in 2001. **The rotor was a clever landing solution bolted onto an unsolved fundamental problem** — you cannot innovate your way around the rocket equation by improving the *landing*, because the landing isn't what's killing you; the *ascent* mass ratio is.

### DC-X — the honorable exception, and what it actually proved

The **DC-X (Delta Clipper Experimental)**, early 1990s, was a smaller and more honest program. It was a vertical-takeoff, vertical-landing rocket — and crucially, it was a *technology demonstrator for landing and reusability*, **not** a claim to reach orbit. It flew beautifully, demonstrated rocket-powered vertical landing and rapid turnaround (concepts that SpaceX would later make routine), and it did so because it wasn't trying to violate the impossibility theorem — it never claimed it could reach orbit as a single stage carrying payload. It proved that *powered vertical landing works*, which was genuinely valuable and genuinely influential (you can draw a line from DC-X to Falcon 9's returning boosters). **DC-X is the counterexample that proves the rule:** it succeeded precisely *because* it separated the reusability problem (solvable) from the SSTO problem (not solvable with current $\varepsilon$), and only tried to solve the one that was tractable.

### Skylon / SABRE — the sophisticated attempt still standing

The most technically serious SSTO effort is the British **Skylon**, powered by the **SABRE** engine — a genuinely clever design that acts as an air-breathing jet at low altitude (using atmospheric oxygen, so you don't carry oxidizer for the early flight) and transitions to a rocket at high altitude. The air-breathing phase is a real attack on the problem: if you don't have to carry oxidizer for the first part of the climb, your effective mass ratio improves. SABRE's key technology is a **precooler** that chills incoming air from ~1,000°C to near-cryogenic in a hundredth of a second without frosting up — a real, hard, partially-demonstrated piece of engineering.

**Honest assessment:** SABRE attacks the right thing (the oxidizer mass burden) rather than the wrong thing (the landing). Air-breathing genuinely helps the mass ratio. But Skylon still asks for a very aggressive structural coefficient on a vehicle that must survive reentry and be reusable, and the air-breathing benefit fades quickly with altitude and speed (above ~Mach 5 and above the thick atmosphere, you're a rocket again, and most of your Δv is spent up there). Whether it closes is genuinely uncertain, and the program has struggled for funding for decades. It's the one SSTO concept a physicist won't dismiss out of hand — because it's not trying to beat the rocket equation, it's trying to *not play* part of it by breathing air. **That's the right instinct** (recall the previous chapters' Starshot lesson: the only winning move is to refuse to be a pure rocket), and it's why SABRE, alone among these, is still worth watching.

### The pattern in the graveyard

Line them up. **X-33, Roton:** tried to skip staging, died in the impossibility theorem. **DC-X:** didn't try to skip staging, succeeded at what it actually attempted. **Skylon:** tries to *partially* escape the rocket equation by breathing air, still fighting, jury out. 

The lesson: **staging is not optional, and the programs that treated it as optional are a graveyard.** The rocket equation offers exactly one loophole for a pure rocket — throw away the empty tanks — and you must take it. The only vehicles that legitimately avoid *serial* staging are the ones that stop being pure rockets (air-breathing, or laser-pushed sails from the previous chapters). Everyone who thought cleverness elsewhere — better landing, better materials-someday, rotor blades — could substitute for staging has left a smoking hole and a cancelled program. **The graveyard is full of people who tried to out-engineer a logarithm. The logarithm is undefeated.**

---

```example
staging-min-stages
```

## Coda: the loophole and its limits

Collect the argument, because staging is the pivot of Unit I — the moment the bad news becomes workable.

**The previous chapters gave two seized knobs.** $v_e \approx 4.5$ km/s, capped by chemistry. $\varepsilon \approx 0.05$–$0.10$, floored by matter. And with both seized, single-stage orbit is *provably impossible* — negative payload, the X-33's grave.

**Staging is the one move that beats the combination without touching either knob.** It doesn't improve $v_e$ or $\varepsilon$. It changes the *structure of the problem*: by jettisoning empty tanks the instant they're dead, it ensures the expensive top-of-the-climb Δv is spent accelerating only what still needs to go fast. Same engine, same materials, −1.67% becomes +3.59%. From impossible to industry standard, by refusing to carry the dead.

**And it's the through-line, for the third time:** *never carry anything through a Δv it does not need to experience.* The empty tank doesn't need the final 4.7 km/s. Drop it. This single sentence — which is also LOR (the chapter on mission architecture), also propellant depots, also aerobraking, also ISRU — is the entire strategic content of spaceflight, and staging is its first and purest instance.

**But the loophole has its own walls, and they're the real lesson:**

- **The gains collapse after stage 2.** 1→2 is infinite (impossible→possible). 2→3 is large. 3→4 is marginal. 4→∞ is noise, converging to a ceiling around 5%. You cannot stage your way to a great payload fraction; you can only stage your way from *impossible* to *a few percent*, which turns out to be enough to build a civilization on.

- **The idealized optimum (infinite stages) is wrong**, and the reason it's wrong is the reason all idealized optima are wrong: the model held $\varepsilon$ fixed, ignored separation-failure probability, and ignored the fixed overhead of engines and avionics. Load those back in and the optimum is 2 or 3. **The formula is an error-detector and a guide, but its assumptions are where the engineering lives.**

- **The optimal split is a Lagrange problem**, and its answer — give more Δv to the stages with better $v_e$ and lower $\varepsilon$ — is why the Saturn V's giant first stage does less than a third of the Δv and hands off early to the efficient hydrogen stages. The theorem predicts the machine.

**Here is the thing most worth carrying.** Staging feels, at first, like a trick — a clever hack, a workaround. It isn't. It's the physically correct response to the structure of the rocket equation, and it was derived from first principles by a deaf schoolteacher in 1903 who had never seen a rocket fly, because he took the equation seriously and asked it the right question: *why is the empty tank still here?* The answer — *it shouldn't be* — is staging, and every orbital rocket ever built is that answer, made of metal.

The graveyard (X-33, Roton) is full of people who thought they could skip it. The one honorable exception (DC-X) succeeded by *not* trying to skip it. And the one attempt still standing (Skylon) survives only because it tries to stop being a pure rocket. **The logarithm is undefeated, and staging is the one concession it grants — take it, take exactly two or three of it, and don't get greedy, because the loophole has diminishing returns and a ceiling, just like everything else in this unforgiving, beautiful field.**

The chapter on ascent is next. The figure "9.4 km/s to LEO" has been quoted throughout as if it were a fact of nature. It isn't — orbital velocity is only 7.67 km/s. The other 1.7 km/s is *loss* — gravity, drag, steering — and it's the tax on the tax, and the shape of every launch you've ever seen is a machine minimizing it.

---
---

## Problem set

*Problems 1–4 build the staging machinery; 5 is the Lagrange capstone; 6–8 tie the whole unit together. Full worked answers follow.*

---

**1 — The miracle, verified.** A rocket has $v_e = 3{,}600$ m/s and $\varepsilon = 0.09$ for every stage. Mission: Δv = 9.0 km/s.
**(a)** Show a single stage gives negative payload (compute $\lambda$).
**(b)** Compute the payload fraction for two stages, split evenly.
**(c)** By what factor did the payload change from (a) to (b)? Comment on why "factor" is a slightly absurd thing to compute here.

**2 — The staging sweep.** Same rocket as problem 1 ($v_e = 3{,}600$, $\varepsilon = 0.09$, Δv = 9.0 km/s). Compute the payload fraction for $n = 2, 3, 4, 5$ stages, all split evenly. Tabulate, and compute the marginal gain per added stage. At what $n$ would you personally stop, and why?

**3 — The impossibility ceiling meets staging.** For the rocket in problem 1:
**(a)** What is the single-stage $\Delta v_{\max}$ (the impossibility theorem)?
**(b)** The mission needs 9.0 km/s. How many stages, minimum, are needed just to make the payload positive? (Find the smallest $n$ giving $\lambda > 0$.)
**(c)** Explain the relationship between $\Delta v_{\max}$ per stage and the minimum stage count.

**4 — Payloads multiply.** Explain, in your own words and with a worked mini-example, *why* the total payload fraction is the **product** of the per-stage payload fractions rather than, say, their sum or average. Use a concrete two-stage vehicle with numbers to make the "stage 1's payload is stage 2" logic explicit.

**5 — The Lagrange capstone. (The hard one.)** A two-stage rocket must deliver Δv = 9.4 km/s. The stages are **not** identical:
- Stage 1 (kerolox, sea level): $v_{e,1} = 3{,}000$ m/s, $\varepsilon_1 = 0.06$
- Stage 2 (hydrolox, vacuum): $v_{e,2} = 4{,}400$ m/s, $\varepsilon_2 = 0.11$

**(a)** First, naively split the Δv evenly (4.7 each) and compute the total payload fraction.
**(b)** Now use the optimal-staging condition $\frac{1}{v_{e,i}(\varepsilon_i R_i - 1)} = \mu$ to find the *optimal* split. (Hint: you have two equations — the condition equated across both stages — plus the constraint $\Delta v_1 + \Delta v_2 = 9400$. Solve numerically; iterate.)
**(c)** Compute the payload fraction at the optimal split and compare to (a). Which stage got more Δv, and does that match the theorem's prediction (more Δv to the better $v_e$ / lower $\varepsilon$ stage)?

**6 — Why the giant stage does little.** The Saturn V's first stage delivered only ~2.7 km/s of the ~9.4 km/s to orbit, despite being the largest and most powerful stage. Explain why, connecting: (a) its propellant choice (kerolox) and thus its $v_e$, (b) the atmosphere, (c) the optimal-staging theorem. Why is it *correct* for the biggest stage to do the least Δv?

**7 — The many-stage fantasy.** The idealized payload-fraction formula says more stages is always better, approaching a ceiling around 5%. Real rockets use 2–3 stages. List and explain the three real-world effects the idealized formula ignores that force the optimum down to 2–3. For each, explain specifically how it penalizes having more stages.

**8 — The whole unit.** In three or four paragraphs, explain how the rocket equation, the thermochemical ceiling, and staging fit together into a single argument. Start from the rocket equation's two free variables, explain why each is seized, explain how staging beats the combination without touching either, and state the one-sentence principle that unifies staging with the rest of the course. Write it as a synthesis for someone who has worked through all three — this is the Unit I capstone essay.

---

---

## Worked answers

---

### 1 — The miracle, verified

**(a)** $R = e^{9000/3600} = e^{2.5} = 12.18$. $1/R = 0.0821$.
$$\lambda = \frac{0.0821 - 0.09}{1-0.09} = \frac{-0.0079}{0.91} = \mathbf{-0.87\%}$$
**Negative.** The single stage cannot lift its own empty tanks. (Sanity: the impossibility theorem gives $\Delta v_{\max} = 3600\ln(1/0.09) = 3600 \times 2.408 = 8{,}669$ m/s $< 9{,}000$, confirming it's impossible with any payload — see problem 3.)

**(b)** Each stage does 4.5 km/s. $R_{\text{stage}} = e^{4500/3600} = e^{1.25} = 3.490$. $1/R = 0.2865$.
$$\lambda_{\text{stage}} = \frac{0.2865 - 0.09}{0.91} = \frac{0.1965}{0.91} = 0.21594$$
$$\lambda_{\text{total}} = (0.21594)^2 = \mathbf{4.66\%}$$

**(c)** From −0.87% to +4.66%. The "factor" is $4.66/(-0.87) = -5.4$, which is **absurd**, and that's the point: **you cannot compute a meaningful ratio between a negative payload and a positive one**, because the negative payload doesn't represent "a small amount of cargo" — it represents *a vehicle that does not exist*. The correct way to state the improvement is categorical, not numerical: staging took us from **impossible** to **4.66%**, from a hole in the ground to a working launch vehicle. (This is exactly the error made in the overview and corrected in the previous chapters — do not multiply or divide payloads across the zero line; the sign change *is* the story, and it defies ratio.)

---

### 2 — The staging sweep

$v_e = 3600$, $\varepsilon = 0.09$, Δv = 9.0 km/s, split evenly among $n$:

| $n$ | Δv/stage (km/s) | $R_i$ | $\lambda_i$ | $\lambda_{\text{total}}$ | Marginal gain |
|---|---|---|---|---|---|
| 2 | 4.500 | 3.490 | 0.21594 | **4.663%** | — |
| 3 | 3.000 | 2.301 | 0.37866 | **5.430%** | +0.767 pts |
| 4 | 2.250 | 1.868 | 0.48939 | **5.732%** | +0.302 pts |
| 5 | 1.800 | 1.649 | 0.56850 | **5.892%** | +0.160 pts |
| 6 | 1.500 | 1.518 | 0.62716 | **5.991%** | +0.099 pts |

**Where to stop: three stages, with a hard look at whether two is enough.** The reasoning: 2→3 buys +0.767 points, a **16% relative improvement** in payload — that's huge, clearly worth an extra stage. But 3→4 buys only +0.302 points (~5.5% relative), and now that is weighed against an *entire extra stage*: another engine, another set of avionics, **another separation event that can kill the mission**, more cost, more integration time, and — the effect this idealized table can't see — a **worse $\varepsilon$ for the smaller stages** (the fixed engine/avionics overhead becomes a bigger fraction). By the time we're at 4→5 (+0.160) and 5→6 (+0.099), we're buying tenths of a percent of payload with whole vehicles. **Three stages captures ~93% of the total achievable gain over two stages; the remaining stages fight over crumbs while multiplying failure modes.** This is why essentially every real rocket is 2–3 stages, and it falls straight out of this table's shape: the marginal column collapses toward zero while the marginal *cost* per stage stays roughly constant.

---

### 3 — The impossibility ceiling meets staging

**(a)** $\Delta v_{\max} = v_e\ln(1/\varepsilon) = 3600 \times \ln(1/0.09) = 3600 \times \ln(11.11) = 3600 \times 2.408 = \mathbf{8{,}669\ m/s}$.

This is the most Δv a *single* stage of this design can produce while carrying **zero** payload.

**(b)** The mission needs 9,000 m/s $>$ 8,669 m/s, so **one stage is impossible even with zero payload.** Check the sweep:
- $n = 1$: $\lambda = -0.87\%$. **Negative — impossible.**
- $n = 2$: each stage does 4,500 m/s $< 8{,}669$, so each stage has positive per-stage payload (0.216), and total = **4.66% > 0.** ✓

**Minimum stages for positive payload: two.**

**(c)** The relationship is direct and clean: **a single stage can only deliver up to $\Delta v_{\max} = v_e\ln(1/\varepsilon)$ of useful Δv.** If your mission's total Δv exceeds this, you *must* split it across multiple stages, because each stage can only contribute up to (a bit less than) $\Delta v_{\max}$ before its own payload fraction goes negative. Roughly, the minimum number of stages is $\lceil \Delta v_{\text{total}} / \Delta v_{\max} \rceil$ — here $9000/8669 = 1.04$, rounding up to **2**. (It's a lower bound, not exact, because splitting into $n$ stages means each does $\Delta v/n$, well under $\Delta v_{\max}$, leaving positive per-stage payload — you want comfortably more than the bare minimum.) **The impossibility theorem sets the "reach" of one stage; staging lets you chain that reach as many times as needed, at the cost of multiplying the per-stage payload fractions together.** This is the quantitative link between the impossibility ceiling and the staging loophole.

---

### 4 — Payloads multiply (model answer)

The total payload fraction is the **product** because **each stage's "payload" is everything above it — including all the stages above it — and "fraction of a fraction of a fraction" is multiplication.**

Here's the explicit logic with a concrete two-stage vehicle. Say each stage delivers a payload fraction of $\lambda_i = 0.20$ (each stage's useful output is 20% of its own total mass).

- **Stage 1** looks at the entire vehicle sitting on the pad — call it 100 units of mass. Stage 1 does *not know* that its payload is a rocket; it just sees a mass it must accelerate. It delivers, as "payload," 20% of the full stack: $0.20 \times 100 = 20$ units. **That 20 units *is* stage 2 (plus the real payload).** The other 80 units were stage 1's own propellant and structure, now discarded.
- **Stage 2** is those 20 units. It fires and delivers, as *its* payload, 20% of *itself*: $0.20 \times 20 = 4$ units. That 4 units is the actual satellite.

So the real payload is $4$ units out of the original $100$ = **4% = $(0.20)^2 = \lambda_1 \times \lambda_2$.** The fractions multiplied because stage 2 only gets to work on the 20% that stage 1 delivered, and the satellite only gets the 20% of *that*. **Each stage applies its fraction to the diminished mass the previous stage handed up.**

Why *not* sum or average? Because summing ($0.20 + 0.20 = 0.40$) would claim 40% payload, which is nonsense — it would mean the payload is bigger than stage 2 itself. Averaging is equally meaningless. **The stages act in sequence, each shrinking the mass that continues upward, and sequential fractional reductions compound multiplicatively** — exactly like applying two successive 20%-survival filters, or two half-lives of decay. The multiplication is not a convention; it's the physical fact that stage 2 can only ever be a fraction of what stage 1 chose to carry.

---

### 5 — The Lagrange capstone

Stage 1: $v_{e,1} = 3000$, $\varepsilon_1 = 0.06$. Stage 2: $v_{e,2} = 4400$, $\varepsilon_2 = 0.11$. Total Δv = 9400 m/s.

**(a) Even split (4700 each).**
- $R_1 = e^{4700/3000} = e^{1.5667} = 4.7907$, $\lambda_1 = (1/4.7907 - 0.06)/0.94 = (0.20874 - 0.06)/0.94 = 0.15823$
- $R_2 = e^{4700/4400} = e^{1.0682} = 2.9101$, $\lambda_2 = (1/2.9101 - 0.11)/0.89 = (0.34363 - 0.11)/0.89 = 0.26251$
- $\lambda_{\text{total}} = 0.15823 \times 0.26251 = \mathbf{4.154\%}$

**(b) Optimal split.** The condition is $\dfrac{1}{v_{e,1}(\varepsilon_1 R_1 - 1)} = \dfrac{1}{v_{e,2}(\varepsilon_2 R_2 - 1)} = \mu$, with $\Delta v_1 + \Delta v_2 = 9400$. Solving numerically (iterate $\Delta v_1$ until the two sides match, or just maximize $\lambda_{\text{total}}$ directly over $\Delta v_1$):

$$\boxed{\Delta v_1 = 3{,}293\ \text{m/s}, \qquad \Delta v_2 = 6{,}107\ \text{m/s}}$$

Check: $R_1 = e^{3293/3000} = e^{1.0977} = 2.9973$, $R_2 = e^{6107/4400} = e^{1.3880} = 4.0069$.
- $\mu_1 = 1/[3000(0.06 \times 2.9973 - 1)] = 1/[3000(-0.8202)] = -4.064\times10^{-4}$
- $\mu_2 = 1/[4400(0.11 \times 4.0069 - 1)] = 1/[4400(-0.5592)] = -4.064\times10^{-4}$ ✓ **They match** — the condition is satisfied.

**(c) Payload at optimum.**
- $\lambda_1 = (1/2.9973 - 0.06)/0.94 = (0.33363 - 0.06)/0.94 = 0.29110$
- $\lambda_2 = (1/4.0069 - 0.11)/0.89 = (0.24957 - 0.11)/0.89 = 0.15682$
- $\lambda_{\text{total}} = 0.29110 \times 0.15682 = \mathbf{4.566\%}$

**Comparison: 4.566% optimal vs 4.154% even — a gain of ~10% more payload, for free, just by splitting the Δv correctly.** On a 500-tonne vehicle that's ~2 extra tonnes to orbit, on every flight, at zero hardware cost.

**Which stage got more Δv?** **Stage 2 (the hydrolox upper stage) got 6,107 m/s — 65% of the total — versus 3,293 for stage 1.** The even split gave each 4,700; the optimum shifted ~1,400 m/s *from* stage 1 *to* stage 2.

**Does it match the theorem?** **Exactly.** The theorem says: give more Δv to the stage with better $v_e$ and lower $\varepsilon$. Stage 2 has the far better exhaust velocity (4,400 vs 3,000) — it's the better rocket — so it should do more of the work, and it does. (Stage 2's *higher* $\varepsilon$ (0.11 vs 0.06) pulls the other way, wanting *less* Δv, but the $v_e$ advantage dominates decisively — 4,400/3,000 is a big edge, and it's the exhaust velocity that sits in the exponent.) **This is the Saturn V pattern in miniature: the efficient upper stage does the majority of the Δv, the less-efficient lower stage does the minority, and shifting work onto the better rocket is worth ~10% payload.** The naive even split leaves that on the table; the Lagrange condition collects it.

---

### 6 — Why the giant stage does little (model answer)

**(a) Propellant and $v_e$.** The Saturn V's first stage (S-IC) burned **kerolox**, which has mediocre exhaust velocity — $M \approx 23$ puts it well down the propellant table (the chapter on the thermochemical ceiling), $I_{sp}$ around 300 s at sea level. In the terms of the optimal-staging theorem, the first stage is the **worst rocket in the stack**: low $v_{e,1}$. And the theorem says a stage with low $v_e$ should get *less* Δv.

**(b) The atmosphere.** The first stage operates at sea level and through the thick lower atmosphere, where two things degrade it further: its $v_e$ is reduced by ambient back-pressure on the nozzle (as derived earlier — the F-1 lost ~15% of its thrust to sea-level pressure), and it pays **gravity and drag losses** (the chapter on ascent) that are heaviest low and slow. So the first stage isn't just using a mediocre propellant — it's using it in the *worst possible environment*, making its effective efficiency even lower. Every argument points the same way: this stage is bad at converting propellant to Δv, so don't ask it to do much of the Δv.

**(c) The theorem.** By the optimal-staging condition $\frac{1}{v_{e,i}(\varepsilon_i R_i - 1)} = \mu$, Δv should be loaded onto the stages that do it most efficiently — high $v_e$, low $\varepsilon$. The Saturn V's upper stages (S-II, S-IVB) burned **hydrolox** — the best $v_e$ available — in **vacuum**, where their giant low-density hydrogen tanks cause no drag and their nozzles are perfectly expanded. They are the good rockets. So the theorem demands they do the majority of the Δv, and they did: the S-IC delivered only ~2.7 km/s, handing off *early* to let the efficient hydrogen stages do the ~6.7 km/s that remained.

**Why it's correct for the biggest stage to do the least Δv:** because "biggest and most powerful" is about **thrust** (lifting the whole stack off the pad against gravity, which needs enormous force), while "how much Δv" is about **efficiency** (converting propellant to velocity, which rewards high $v_e$). These are different jobs. The first stage's job is to be the brawny, cheap, dense **thrust machine** that heaves everything off the pad and punches through the atmosphere — a job that needs raw force, not efficiency — and then get out of the way. It delivers modest Δv because it's inefficient, and that's fine, because its actual job (thrust at liftoff) it does superbly. **The vehicle correctly assigns each stage the job it's good at: the big dumb dense stage provides thrust and does little Δv; the efficient light stage does most of the Δv up where efficiency pays.** Confusing "powerful" with "does the most Δv" is the error; the theorem dissolves it.

---

### 7 — The many-stage fantasy (model answer)

The idealized formula $\lambda_{\text{total}} = \prod \frac{1/R_i - \varepsilon}{1-\varepsilon}$ assumes $\varepsilon$ is a fixed constant, identical for every stage regardless of size or count, and it ignores everything about stages except their mass ratio. Three real effects it omits, each of which penalizes more stages:

**1. Fixed overhead makes $\varepsilon$ worse for smaller stages.** A stage isn't just a scalable tank — it has an engine (with a minimum practical mass), avionics, a flight computer, guidance, a power supply, and a separation system, much of which is **roughly constant regardless of propellant load.** When you add more stages, each stage is smaller, so this fixed overhead becomes a *larger fraction* of each stage — **$\varepsilon$ climbs as stages shrink.** The formula assumed $\varepsilon = 0.09$ for all stages; in reality a tiny stage might be $\varepsilon = 0.2$ or worse. Since payload is exquisitely sensitive to $\varepsilon$ (a stage with $\varepsilon > 1/R$ gives *negative* payload — the impossibility theorem), degraded $\varepsilon$ on small stages directly destroys the gains the extra stages were supposed to provide. **More stages → smaller stages → worse $\varepsilon$ → the idealized gain evaporates.**

**2. Each separation event is an independent chance of catastrophic failure.** With $n$ stages you have $n-1$ separation events, each requiring explosive bolts to fire correctly, clean separation without recontact, and reliable ignition of the next engine. Separation and ignition failures are a real, historically significant cause of launch loss. Reliability **multiplies**: if each separation is 98% reliable, two separations give 96%, but ten give only ~82%. **More stages → more separation events → lower overall reliability**, and a fraction of a percent of extra payload is worthless if it comes with a several-percent increase in the chance of losing the entire mission. Reliability is worth far more than the marginal payload.

**3. Cost, complexity, and integration time.** Each additional stage is a separate vehicle to design, build, qualify, and integrate, with a new set of interfaces (each interface a source of problems). The engineering cost, financial cost, and schedule cost of an extra stage are enormous and roughly constant per stage, while — per the sweep in problem 2 — the payload benefit collapses toward zero after stage 3. **More stages → dramatically more cost and complexity for tenths-of-a-percent of payload.**

**The synthesis:** the idealized formula's marginal *benefit* per stage collapses (from infinite at 1→2, to +0.77 pts at 2→3, to noise beyond), while the real-world marginal *cost* per stage (worse $\varepsilon$, lower reliability, more money) stays roughly constant. The optimum is where they cross, and because the benefit falls off a cliff after stage 2 while the cost doesn't, the crossover lands at **2 or 3 stages for essentially every real vehicle.** The formula says infinity; the world says three; and the entire gap is the three effects the formula pretended didn't exist. **The idealized optimum is always a fantasy in the same specific way — it ignores the costs of the very subdivision it recommends.**

---

### 8 — The whole unit (model capstone essay)

**The rocket equation gives you exactly two levers, and Unit I is the story of discovering that both are seized and then finding the one move that beats them anyway.**

The equation is $\Delta v = v_e \ln(m_0/m_f)$, and inverting it reveals the real object: $m_0/m_f = e^{\Delta v/v_e}$, an **exponential** in the single dimensionless ratio $\Delta v/v_e$. There are only two things you can change: the exhaust velocity $v_e$, and the mass ratio. Everything else — money, cleverness, the century — is irrelevant, because it doesn't appear in the equation. And getting to orbit is a $\Delta v/v_e \approx 2.74$ mission, which puts you 94% propellant, with the payload living in a sliver so thin that the structural coefficient can eat all of it (the impossibility theorem: a single stage gives *negative* payload).

**The thermochemical ceiling seized the first lever.** Exhaust velocity comes from $v_e \approx \sqrt{2\gamma/(\gamma-1) \cdot R_u T_c/M}$, and all three terms are pinned: the nozzle expansion saturates, the chamber temperature is capped near 3,600 K by dissociation and by the melting point of matter, and the molecular weight is floored near 10 because *a chemical rocket must carry its own oxidizer and the oxidizer ends up in the exhaust.* The result is a wall at $v_e \approx 4.5$ km/s — not an engineering limit but a statement about what exothermic chemistry *is*, confirmed by John Clark's decade of chasing better propellants into fluorine and chlorine trifluoride, which barely moved the number and set the experimenters on fire. There is no better chemical fuel; we found it (hydrogen/oxygen) in the 1950s, and it sits a few percent below a wall the universe built.

**The second lever — the mass ratio — is fought through the structural coefficient $\varepsilon$, and it's floored near 0.05–0.10 because tanks and engines are made of matter.** With both levers seized, single-stage orbit is provably impossible (the X-33's \$1.3-billion grave). **Staging is the one move that beats the *combination* without touching either lever.** It doesn't improve $v_e$ or $\varepsilon$; it changes the structure of the problem, by jettisoning empty tanks the instant they become dead weight, so that the expensive top-of-the-climb Δv is spent accelerating only what still needs to go fast. The same vehicle, same engine, same materials, goes from −1.67% payload to +3.59% — from impossible to industry standard — because the payloads of successive stages *multiply*, and dropping the dead structure keeps each factor positive. The optimum is 2–3 stages (the gains collapse after that, and the idealized "infinite stages" fantasy dies on the costs of subdivision), and the optimal Δv split — more work to the stages with better $v_e$ and lower $\varepsilon$ — is a Lagrange-multiplier theorem that predicts the Saturn V's actual staging.

**And the whole unit reduces to one sentence, which is also the sentence for the entire course:** *never carry anything through a Δv it does not need to experience.* Staging is that sentence applied to empty tanks. Choosing propellant by position (dense low, light high) is that sentence applied to which fuel goes where. And later — LOR (the chapter on mission architecture), propellant depots, aerobraking, ISRU — will be the same sentence applied to heat shields, to fuel, to return propellant. The rocket equation cannot be beaten; it has been undefeated since 1903, and the graveyard is full of people who tried. But it grants exactly one concession — *don't carry the dead* — and the entire enterprise of spaceflight is the disciplined, relentless, endlessly-reapplied exploitation of that single concession. Tsiolkovsky saw all of this from a schoolteacher's desk, deaf, with a pencil, before anyone had flown anything, because he took the equation seriously and asked it the right question. That's the unit. That's the method. That's the whole thing.

---
$l3_master$,
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

-- Curated, human-reviewed self-test — same set served at every level.
with q as (
  select $l3_quiz$[{"id": "q1", "type": "mcq", "prompt": "Staging turns a single-stage vehicle with NEGATIVE payload into one that reaches orbit. What does it actually change?", "options": ["It raises the exhaust velocity of the engine", "It lowers the structural coefficient of the tanks", "Neither knob \u2014 it changes the STRUCTURE of the problem, jettisoning empty tanks so the expensive final \u0394v accelerates only what still needs to go fast", "It reduces the mission's total \u0394v"], "answerIndex": 2, "explanation": "Staging doesn't touch v_e or \u03b5. It refuses to carry dead tanks through \u0394v they don't need: the instant a tank is empty it is dropped, so the costly top-of-climb \u0394v is spent only on what remains. Same engine, same materials, and the payload goes from negative to a few percent."}, {"id": "q2", "type": "mcq", "prompt": "For an n-stage rocket the total payload fraction is the PRODUCT of the per-stage payload fractions, not their sum. Why?", "options": ["Because the stages fire at the same time", "Because each stage's payload IS everything above it \u2014 stage 1's payload is the whole of stage 2 \u2014 so it is a fraction of a fraction", "Because propellant fractions add", "Because the mass ratios add"], "answerIndex": 1, "explanation": "Stage 1 delivers, as its payload, some fraction of the full stack \u2014 and that payload is stage 2 (plus the real payload). Stage 2 then delivers its fraction of itself. Each stage applies its fraction to the diminished mass the previous stage handed up, so sequential fractional reductions compound multiplicatively."}, {"id": "q3", "type": "mcq", "prompt": "The improvement from 1 stage to 2 is often called 'infinite'. In what sense?", "options": ["The payload literally becomes infinite", "One stage gives a NEGATIVE (impossible) payload and two gives a positive one, so the change crosses zero and no finite ratio describes it", "Two stages weigh nothing", "It doubles the exhaust velocity"], "answerIndex": 1, "explanation": "A single stage of a hard mission gives negative payload \u2014 a vehicle that cannot lift its own empty tanks, i.e. does not exist. Two stages give a positive payload. You cannot take a meaningful ratio across the zero line; the sign change IS the story. (Trying to 'multiply' a negative payload into a positive one was exactly the error corrected in an earlier chapter.)"}, {"id": "q4", "type": "mcq", "prompt": "The idealized formula says more stages is always better (toward a ~5% ceiling), yet real rockets use two or three. What does the formula leave out?", "options": ["Nothing \u2014 real rockets are simply built badly", "Fixed per-stage overhead (so \u03b5 worsens as stages shrink), the failure probability of each extra separation event, and the cost/complexity of another stage", "The speed of light", "The curvature of the Earth"], "answerIndex": 1, "explanation": "The formula holds \u03b5 fixed and ignores everything but mass ratio. In reality each stage carries an engine, avionics, and a separation system whose mass doesn't shrink, so \u03b5 climbs for small stages; each of the n-1 separations is an independent chance of failure (reliability multiplies down); and each stage costs money and time. The marginal payload gain collapses after stage 2 while the marginal cost stays flat, so the optimum is 2 or 3."}, {"id": "q5", "type": "mcq", "prompt": "When a rocket's stages are NOT identical, the optimal-staging condition says the \u0394v should be split how?", "options": ["Evenly, always", "All to the first stage", "More \u0394v to the stages that do it most efficiently \u2014 higher exhaust velocity and lower structural coefficient", "More \u0394v to the heaviest stage"], "answerIndex": 2, "explanation": "The Lagrange condition 1/(v_e,i (\u03b5_i R_i \u2212 1)) = \u03bc, equal across stages, means you load more of the total \u0394v onto the better rockets \u2014 high v_e, low \u03b5. If one stage converts propellant to \u0394v more efficiently, make it do more of the work. The even split is optimal only for identical stages."}, {"id": "q6", "type": "open", "prompt": "The Saturn V's first stage was the largest and most powerful, yet it delivered only about 2.7 of the ~9.4 km/s to orbit. Explain why that is correct, not a flaw.", "rubric": "The first stage is the WORST rocket in the stack in the terms that matter for \u0394v: it burns kerolox (mediocre v_e), runs at sea level where ambient back-pressure further cuts its v_e, and fights the heaviest gravity and drag losses low and slow. The optimal-staging theorem says give LESS \u0394v to low-v_e stages, so it should do little of the \u0394v. Its actual job is THRUST \u2014 heaving the whole stack off the pad and punching through the thick atmosphere, which needs raw force, not efficiency \u2014 and then handing off early to the hydrolox upper stages, which have the best v_e and operate in vacuum where efficiency compounds, so they correctly do the majority (~6.7 km/s). The error is confusing 'powerful' (thrust) with 'does the most \u0394v' (efficiency); the theorem dissolves it. Each stage is assigned the job it is good at."}, {"id": "q7", "type": "open", "prompt": "Tie the propulsion unit together: name the rocket equation's two free variables, why each is effectively seized, how staging beats the combination without touching either, and the one sentence that unifies staging with the rest of spaceflight.", "rubric": "The two variables are the exhaust velocity v_e and the mass ratio m0/mf. v_e is capped near 4.5 km/s by chemistry \u2014 the expansion bracket saturates, chamber temperature is pinned near 3,600 K by dissociation and melting, and molecular weight is floored near 10 because a chemical rocket must carry heavy oxidizer that ends up in the exhaust. The mass ratio is fought through the structural coefficient \u03b5, floored near 0.05-0.10 because tanks and engines are made of matter. With both seized, a single stage to orbit gives negative payload \u2014 provably impossible. Staging beats the COMBINATION without improving either variable: by jettisoning each empty tank the instant it becomes dead weight, the expensive top-of-climb \u0394v accelerates only what still needs speed, and the per-stage payload fractions multiply into a positive number (\u22121.67% becomes +3.59% for the same vehicle). The optimum is two or three stages (gains collapse after that; the idealized 'infinite stages' dies on the mass, reliability, and cost of subdivision), and the optimal split loads more \u0394v onto the efficient stages (a Lagrange result that predicts the Saturn V). The unifying sentence is: never carry anything through a \u0394v it does not need to experience \u2014 which is also propellant-by-position, lunar-orbit rendezvous, aerobraking, and in-situ propellant."}]$l3_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/space-exploration/rockets/staging', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
