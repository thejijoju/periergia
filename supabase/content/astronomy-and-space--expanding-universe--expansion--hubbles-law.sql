-- Astronomy & Space · The Expanding Universe — Expansion — "Hubble's Law".
-- Curated master for
-- astronomy-and-space/expanding-universe/expansion/hubbles-law
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens The Expanding Universe block, picking up where the Extragalactic
-- branch's Large-Scale Structure chapter left off. Organised around the
-- claim that v = H0 d is the simplest equation in cosmology and that
-- nearly every word of it misleads: it is not a velocity through space,
-- not a law in the dynamical sense, and H0 is not a constant. Slipher's
-- redshifts and Lemaitre's 1927 priority; the age crisis worked
-- numerically - H0 = 500 gives 1.96 Gyr against a 4.54 Gyr Earth - and
-- the lesson that the slope was right while the calibration was wrong;
-- the homogeneity argument showing linearity is the ONLY expansion law
-- without a centre; what does not expand and why, tying back to the
-- Superclusters binding criterion; H0 as constant in space but not in
-- time, with the Hubble time's closeness to the true age shown to be a
-- coincidence of cancelling deceleration and acceleration; and the
-- tension at 4.9 sigma with JWST having eliminated the leading systematic.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/expansion/hubbles-law',
    'research',
    'advanced',
    'read',
    $expHub_master$> $v = H_0 d$ is the simplest equation in cosmology and nearly every word of it misleads. The $v$ is not a velocity through space. The relation is not a law in the sense that Newton's are — nothing is being caused. And $H_0$ is not a constant: it has changed by orders of magnitude over cosmic history, and the subscript is there precisely to admit it. Getting past those three misreadings is most of what this chapter is for.

The Extragalactic branch closed on large-scale structure, where the arrangement of galaxies became a measurement of the universe's composition and expansion history. This block goes back to the beginning of that story: how the expansion was discovered, what exactly is expanding, and why the single number describing it is currently the sharpest disagreement in physical cosmology.

## The observation

The redshifts came first, and not from Hubble.

Between 1912 and 1917, **Vesto Slipher** at Lowell Observatory measured the spectra of some two dozen spiral nebulae — objects whose nature was then unknown — and found that almost all of them were **redshifted**. Their spectral lines sat at longer wavelengths than the laboratory values, by amounts implying recession at hundreds and then thousands of kilometres per second. That was already strange: a random population should show as many blueshifts as redshifts.

What Slipher lacked was **distances**. Without them, a list of velocities is a curiosity.

Distances arrived with **Henrietta Swan Leavitt's** period–luminosity relation for Cepheid variables — a star whose pulsation period reveals its intrinsic brightness, and therefore its distance from its apparent brightness. Hubble used Cepheids to establish in 1925 that the spirals were external galaxies, and then combined his distances with Slipher's velocities.

In **1929** Hubble published the result for **24 galaxies**: velocity increases with distance, and roughly in proportion.

$$v = H_0 d$$

The scatter in that first plot was substantial and the sample small. What made it convincing was not statistical strength but that it was the relation a class of cosmological models already predicted.

### Lemaître got there first

Two years earlier, in **1927**, **Georges Lemaître** had derived an expanding solution to Einstein's equations, noted that it implied a linear velocity–distance relation, and — using Slipher's velocities and such distance estimates as existed — extracted a value for the coefficient. He published in a Belgian journal of limited circulation, in French.

The relation is now formally the **Hubble–Lemaître law**, following an International Astronomical Union vote in 2018. That renaming is not merely courteous: the two men did different things, and the difference is instructive. Lemaître **predicted** the relation from theory and estimated its slope; Hubble **measured** it with better data and made it undeniable. Both are necessary, and neither is the same contribution.

## The age crisis

Hubble's 1929 slope was about **500 km/s/Mpc** — some seven times the modern value. That discrepancy produced a genuine crisis, and working through it is worthwhile because it shows what kind of error was involved.

The reciprocal of the Hubble constant has units of time, and is the **Hubble time** — roughly how long ago everything would have been at a single point, if expansion had proceeded at a constant rate:

$$t_H = \frac{1}{H_0}$$

With $H_0 = 500$ km/s/Mpc:

$$t_H = \frac{1}{500 \times 10^3 / 3.086\times10^{22}\ \mathrm{s^{-1}}} = 6.2\times10^{16}\ \mathrm{s} = \mathbf{1.96\ Gyr}$$

Radiometric dating already put the age of the Earth in the billions of years — the modern value is **4.54 Gyr**. **Hubble's expansion made the universe less than half the age of the planet.**

That is not a small tension to be lived with; it is a contradiction. And it was resolved not by abandoning the expansion but by fixing the **distance scale**. Walter Baade showed in 1952 that there are two distinct populations of Cepheid-like variables with different period–luminosity relations, and that Hubble had calibrated with one and measured with the other. Further corrections followed as the ladder was rebuilt.

**The slope of Hubble's relation was right; its calibration was wrong by a factor of seven.** That distinction matters more than the anecdote, because it is a recurring property of distance measurements: the *shape* of a relation is usually robust, while its *absolute normalisation* depends on a chain of calibrations, each with its own systematic. The Distance Ladder chapter takes this up directly, and — as the final section here shows — the same vulnerability is at the heart of today's disagreement.

```checkpoint
q: Hubble's 1929 value of H₀ ≈ 500 km/s/Mpc implied a universe younger than the Earth. What was actually wrong?
a: The redshifts were mismeasured, since spectroscopy was primitive in the 1920s
x: Slipher's redshifts were good — radial velocities from spectral lines were among the more reliable measurements of the era, and modern values confirm them.
a*: The distance scale — Cepheid calibration was wrong by a large factor, so the slope of the relation was right while its absolute normalisation was badly off
a: The assumption that redshift indicates recession, which was later abandoned
x: The interpretation of cosmological redshift as expansion has held up and is central to the modern picture; nothing was abandoned there.
a: The universe was in fact younger then, and has since aged
x: The age of the universe is a fixed quantity being estimated, not something that changes between measurements — and the estimate rose because the distances did.
hint: The relation has a shape and a scale. Which one is harder to get right?
why: Velocity from a redshift is comparatively easy: measure a line's wavelength against its laboratory value. Distance is hard, because it rests on a chain of calibrations — and Hubble's Cepheid calibration was wrong, in part because Baade later showed there are two populations of Cepheid-like variables obeying different period–luminosity relations, with Hubble calibrating on one and measuring with the other. The result was H₀ too large by about sevenfold and a Hubble time of 1.96 Gyr against a 4.54 Gyr Earth. The general pattern is worth carrying: the *shape* of a distance relation is usually robust while its *absolute normalisation* depends on a fragile calibration chain — which is exactly where today's H₀ disagreement lives.
---
q: Lemaître derived the linear velocity–distance relation and estimated its slope in 1927, two years before Hubble's paper. Why is it reasonable for both names to attach to it?
a: Because Lemaître's work was unknown to Hubble, so the two discoveries were genuinely independent
x: Independence would explain simultaneous credit but not why both contributions were *needed* — and priority disputes are usually settled on precedence, not independence.
a*: Because they did different things — Lemaître predicted the relation from an expanding solution to Einstein's equations, while Hubble measured it with data good enough to make it undeniable — and a theory nobody can check and a measurement nobody expected are each incomplete alone
a: Because Lemaître's derivation contained an error that Hubble's measurement corrected
x: Lemaître's derivation was sound; his slope was rough because the available distances were poor, which is a data limitation rather than an error of reasoning.
a: Because the IAU vote in 2018 was a political gesture without scientific content
x: The renaming reflects a substantive historical claim about who did what, and dismissing it as gesture misreads both the history and the point.
hint: Ask what each man produced, and whether either alone would have established the expansion.
why: Lemaître took an expanding solution of general relativity, noted that it entails v ∝ d, and estimated the coefficient from Slipher's velocities and the crude distances then available — publishing in French in a Belgian journal of small circulation. Hubble supplied Cepheid distances to 24 galaxies and a plot that could not be argued with. A prediction with data too poor to test it does not establish a result, and a measured correlation without a theoretical reason to expect it invites alternative explanations — as the "tired light" proposals of the period show. The two together are what settled it, which is the substantive content of the Hubble–Lemaître name.
```

## What is actually expanding

Here is the conceptual core, and the place where the equation's notation does the most damage.

The naive reading of $v = H_0 d$ is that galaxies are flying apart through space, from some origin, with more distant ones moving faster. That reading produces two immediate and wrong conclusions: that there is a **centre** to the expansion, and that galaxies beyond some distance would exceed the speed of light and therefore cannot exist.

The correct picture is that **space itself is expanding, and galaxies are approximately stationary within it.** The distance between any two galaxies grows because the space between them grows, not because either is travelling.

### Why linearity is forced

The most compelling argument that this is the right picture is that **the linear relation is the only one consistent with having no centre**, and it can be derived in a couple of lines.

Suppose recession velocity depends on distance by some function, $\vec{v} = f(\vec{r})$, and require that **every observer sees the same law** — the cosmological principle. Take two galaxies at positions $\vec{r}_1$ and $\vec{r}_2$ as seen from us. The velocity of galaxy 2 as seen from galaxy 1 is

$$\vec{v}_{2} - \vec{v}_{1} = f(\vec{r}_2) - f(\vec{r}_1)$$

For an observer on galaxy 1 to see the same law we do, this must equal $f(\vec{r}_2 - \vec{r}_1)$. A function satisfying $f(\vec{a}) - f(\vec{b}) = f(\vec{a}-\vec{b})$ for all vectors is **linear**: $f(\vec{r}) = H\vec{r}$.

**Hubble's law is not one possible expansion law among many; it is the unique law compatible with homogeneity.** Any other dependence — quadratic, exponential in distance, anything — would single out a centre. That is why the relation looks like a law: it is a consequence of a symmetry, not of a force.

And it explains the observation that troubles every newcomer: we appear to be at the centre of the expansion, with everything receding from us. So does every other observer, necessarily. There is no centre to find.

### Recession faster than light

Now the second wrong conclusion. Setting $v = c$ in $v = H_0 d$ with $H_0 = 70$ km/s/Mpc gives

$$d = \frac{c}{H_0} = \frac{3\times10^5}{70} \approx \mathbf{4{,}300\ Mpc}$$

Beyond that distance — the **Hubble radius** — the recession velocity exceeds the speed of light. Galaxies there are routinely observed.

This does **not** violate relativity, and the reason is precise: special relativity forbids anything from moving through space faster than light **locally**. Recession velocity is not local motion through space; it is the accumulated stretching of the space between us, and no local measurement anywhere finds anything exceeding $c$. Each galaxy sits nearly at rest with respect to the space around it. Relativity constrains motion *within* spacetime, not the rate at which spacetime itself expands.

A useful check on whether one has understood this: **superluminal recession does not prevent us from seeing an object.** Light emitted from beyond the Hubble radius can still reach us, because the Hubble radius itself grows with time, and light that starts out losing ground can later find itself inside a region receding more slowly. Objects at redshifts above about 1.5 are receding faster than light today and are seen perfectly well.

```checkpoint
q: Galaxies beyond ~4,300 Mpc recede faster than light. Why does this not violate relativity?
a: Because the galaxies are not really moving — their apparent recession is an optical illusion caused by redshift
x: The recession is physical: the distance between us and them genuinely increases. It is not an artefact of how we measure light.
a*: Because relativity forbids motion *through* space faster than light locally, while recession is the accumulated expansion of the space between — every galaxy is nearly at rest relative to its own surroundings
a: Because the speed limit applies only to objects with mass, and the expansion carries massless energy
x: The light-speed limit applies to all local motion regardless of mass, and the galaxies in question are massive. Mass is not what resolves it.
a: Because those galaxies are beyond the observable universe and so are not really observed
x: They are observed routinely — everything above redshift ~1.5 is receding superluminally today, including galaxies imaged in every deep field.
hint: Where does relativity's speed limit actually apply — to any separation rate, or to something more specific?
why: Special relativity forbids anything from passing anything else faster than light *locally*, at the same point in spacetime. Cosmological recession is not local motion: each galaxy sits essentially at rest with respect to the space immediately around it, and the separation grows because the intervening space expands. No local measurement anywhere records a superluminal speed. A good test of whether the idea has landed: superluminal recession does not hide an object, because the Hubble radius itself grows — light that initially loses ground can later find itself in a more slowly receding region and reach us. Everything above z ≈ 1.5 is in that category and is seen without difficulty.
---
q: Why must the expansion law be linear in distance, rather than some other function?
a: Because observations happen to show a straight line, and the law is purely empirical
x: The linearity was derived by Lemaître before Hubble's data could establish it, and the observation confirms an expectation rather than standing alone.
a*: Because linearity is the only form under which every observer sees the same law — any other dependence would define a unique centre to the expansion
a: Because velocity and distance are both measured in the same units, forcing proportionality
x: They have different units — velocity and length — so their ratio simply defines H₀. Nothing about units forces a linear relation.
a: Because relativistic effects become important at large distances, and only a linear law remains finite
x: The linearity argument is Newtonian and kinematic; it requires no relativity, and other functional forms would remain perfectly finite.
hint: Write the velocity of one galaxy as seen from another, and demand that it take the same form as seen from us.
why: Require v = f(r) with every observer seeing the same law. The velocity of galaxy 2 relative to galaxy 1 is f(r₂) − f(r₁), and for an observer on galaxy 1 to see our law this must equal f(r₂ − r₁). Only a linear function satisfies f(a) − f(b) = f(a − b), so f(r) = Hr. Hubble's law is therefore not one candidate among many but the unique expansion law compatible with homogeneity — which is why it resembles a law while describing no force. It also disposes of the impression that we sit at the centre: every observer sees everything receding from them, necessarily, and there is no centre to find.
```

{{image: Hubble's law | The velocity–distance relation. Hubble's 1929 version used 24 galaxies and gave a slope near 500 km/s/Mpc — seven times too steep, because the Cepheid calibration was wrong, implying a universe younger than the Earth. The straight line itself was right: linearity is the only expansion law under which every observer sees the same relation, so it follows from homogeneity rather than from any force.}}

## What does not expand

A question that follows immediately and is asked less often than it should be: if space is expanding, why are atoms, planets, and galaxies not expanding too?

The answer is that **expansion is not a force.** It is the behaviour of a system with no local structure — a smooth, unbound distribution of matter. Any system already held together by a force that has reached equilibrium simply stays at its equilibrium size.

- **Atoms** are held by electromagnetism at a size set by quantum mechanics. Expansion does not enter.
- **The Solar System** is held by gravity in stable orbits. It does not grow.
- **Galaxies and clusters** turned around, collapsed and virialised long ago — they decoupled from the expansion when they did so.

The Superclusters chapter made this quantitative from the other direction: a structure is bound if $M > \Omega_\Lambda H_0^2R^3/G$, and everything satisfying that criterion has already stopped participating in the expansion. **The expansion is what the universe does where nothing has taken hold.**

There is a common but misleading gloss worth flagging: that bound systems "resist" the expansion, as if gravity were continually fighting a stretching force. In standard cosmology that is not the picture. Once a region has collapsed and virialised, the expansion of the larger universe is simply irrelevant to it — there is no residual tension to be overcome, and the cosmological constant's tiny repulsive contribution is entirely negligible on the scale of an atom or a Solar System.

So the expansion describes the separations *between* bound systems, and the honest statement of Hubble's law is that it applies to the **smooth cosmological distribution** — to galaxies and clusters treated as points — not to anything within them.

```checkpoint
q: If space is expanding everywhere, why do atoms and the Solar System not expand?
a: Because electromagnetic and gravitational forces continually overcome the stretching force of expansion
x: This is the common gloss and it is misleading: expansion is not a force to be overcome, and there is no continual tension for gravity to resist in a virialised system.
a*: Because expansion describes an unbound, smooth distribution — a system that has already collapsed and reached equilibrium simply sits at its equilibrium size, and the expansion of the wider universe is irrelevant to it
a: Because they do expand, but by an amount far too small to measure
x: Bound systems do not expand at all in the standard picture; the effect is absent rather than merely tiny.
a: Because expansion only operates in the vacuum between galaxies, where there is no matter
x: There is matter throughout, including diffuse intergalactic gas that does participate in the expansion. Presence of matter is not the criterion — boundedness is.
hint: Ask what expansion actually is: a force acting on things, or a description of how unbound matter behaves?
why: Expansion characterises a smooth, unbound distribution of matter; it is not a stretching force applied to objects. A structure that has collapsed and virialised has decoupled — the Superclusters chapter gave the criterion, M > Ω_Λ H₀²R³/G — and thereafter the wider universe's expansion has no bearing on its size. Atoms sit at a size set by quantum mechanics and electromagnetism; the Solar System sits in stable orbits. Neither is straining against anything. Hubble's law therefore applies to the cosmological distribution of galaxies and clusters treated as points, not to anything inside them.
---
q: A galaxy 5 Mpc away shows a *blueshift*. Does this contradict Hubble's law?
a: Yes — Hubble's law states that all galaxies recede, so a blueshift falsifies it
x: Hubble's law describes the smooth cosmological flow, not the motion of every individual galaxy, and blueshifted nearby galaxies are routinely observed without controversy.
a*: No — at 5 Mpc the Hubble flow gives only ~350 km/s, comparable to peculiar velocities from local gravity, which can exceed it and reverse the sign
a: No, because blueshift at that distance is caused by gravitational rather than Doppler effects
x: Gravitational shifts from galaxy-scale potentials are far too small; the blueshift is genuine line-of-sight approach driven by local dynamics.
a: Yes, unless the galaxy is gravitationally bound to ours, in which case the law does not apply
x: The right answer does not require boundedness — an unbound galaxy in an infalling flow can also be approaching. The point is the size of the peculiar velocity relative to the Hubble term.
hint: Compute H₀d at 5 Mpc and compare it with the few-hundred km/s peculiar velocities of the Superclusters chapter.
why: At 5 Mpc, H₀d ≈ 70 × 5 = 350 km/s. Peculiar velocities driven by local gravitational structure run to several hundred km/s — the Local Group alone moves at 627 km/s — so nearby they can exceed the Hubble term and flip the observed sign. Andromeda, approaching at ~110 km/s, is the familiar case. Hubble's law describes the *smooth* flow that emerges once peculiar motions average out, which requires distances large enough that H₀d dominates. This is exactly why the distance ladder must reach well past the local supercluster before the slope can be read, and why peculiar-velocity contamination is a systematic in every local H₀ measurement.
```

## The constant that is not constant

The name is a historical accident and actively misleading. $H_0$ is **constant in space, not in time.**

The subscript zero is doing real work: it denotes the present-day value of a function $H(t)$, and the general quantity is the **Hubble parameter**

$$H(t) = \frac{\dot{a}}{a}$$

with $a(t)$ the scale factor. $H$ has varied enormously over cosmic history — it was vastly larger in the early universe — and it continues to change now.

The direction of change is set by what dominates the energy budget. During matter domination, gravity decelerates the expansion and $H$ falls. Under a cosmological constant, the expansion accelerates and $H$ approaches a constant floor. Our universe did the first and is now doing the second, having crossed over around $z \approx 0.3$.

This has a consequence worth stating carefully, because it is a coincidence that reads like a result.

The Hubble time, $1/H_0 = 13.97$ Gyr for $H_0 = 70$, is strikingly close to the measured age of the universe, **13.8 Gyr**. It is tempting to conclude that expansion has therefore been roughly constant. It has not. A universe that had always decelerated would be **younger** than its Hubble time; one that had always accelerated would be **older**. Ours decelerated for most of its history and has accelerated recently, and **the two effects very nearly cancel** — leaving an age within a couple of per cent of $1/H_0$.

That near-equality is a genuine coincidence of the epoch we occupy, not evidence of uniform expansion. Treating it as the latter is a mistake that would have been reasonable before 1998 and is not now.

```checkpoint
q: The Hubble time 1/H₀ ≈ 14 Gyr is very close to the measured age of the universe, 13.8 Gyr. What should be concluded?
a: That the expansion rate has been essentially constant throughout cosmic history
x: The expansion rate has changed enormously — H was vastly larger early on, fell through matter domination, and is now rising toward a floor under dark energy.
a*: Almost nothing — the closeness is a coincidence, because early deceleration and recent acceleration happen to nearly cancel, and each alone would push the age off 1/H₀ in opposite directions
a: That the universe is younger than the Hubble time, as deceleration requires
x: That would be the conclusion for a universe that had always decelerated, but ours has accelerated for the last several billion years, offsetting it.
a: That H₀ has been measured correctly, since it reproduces the known age
x: This inverts the logic — the age is derived from a cosmological model that takes H₀ as an input, so agreement is not an independent check.
hint: What would the age be, relative to 1/H₀, in a universe that only ever decelerated? And one that only ever accelerated?
why: 1/H₀ is the age only if the expansion rate has never changed. Deceleration means the universe expanded faster in the past, so it reached its present size sooner — an age *less* than 1/H₀. Acceleration means the opposite, an age *greater*. Ours decelerated under matter domination for most of its history and has accelerated since z ≈ 0.3, and the two nearly cancel, leaving 13.8 Gyr against a Hubble time of 13.97. The agreement is a fact about the epoch we happen to inhabit rather than evidence of uniform expansion — and reading it as the latter was defensible before 1998 and is not now.
---
q: The subscript in H₀ signals that
a: it is the first and most fundamental of several Hubble constants
x: There is one Hubble parameter; the subscript marks an evaluation time, not a member of a series.
a*: it is the present-day value of a time-varying Hubble parameter H(t) = ȧ/a — constant across space at any given moment, but not constant through cosmic history
a: it refers to the value measured at redshift zero, which differs from the true value by a known correction
x: It *is* the value at redshift zero, and that is the true present-day value; no correction separates them.
a: it distinguishes Hubble's original measurement from later revisions
x: Hubble's own value is not denoted H₀ in any special sense; the subscript is a statement about time, not about authorship.
hint: The cosmological principle makes it uniform in one variable. Which one — and what about the other?
why: Homogeneity requires the expansion rate to be the same everywhere at a given cosmic time, which is what makes "constant" defensible at all. But H(t) = ȧ/a evolves as the universe's energy content changes: enormous in the early universe, falling through radiation and matter domination, and now approaching a floor as the cosmological constant takes over. The subscript zero marks "evaluated now". Calling H₀ the Hubble constant is a historical accident that misleads students into treating expansion as uniform in time, which underlies the age-coincidence error and makes the H(z) measurements of the Large-Scale Structure chapter seem stranger than they are.
```

{{image: Georges Lemaître | Georges Lemaître, who in 1927 derived an expanding solution to Einstein's equations, noted that it implied a linear velocity–distance relation, and estimated its slope from Slipher's velocities — two years before Hubble's measurement. The relation has been formally the Hubble–Lemaître law since a 2018 IAU vote. The two contributions were different in kind: one predicted the relation, the other made it undeniable.}}

## The tension

The final section is the live problem, and it is the most consequential disagreement in cosmology.

There are two ways to measure $H_0$, and they use no data in common.

**The late-time, local route.** Build a distance ladder: geometric parallax to nearby stars, calibrating Cepheid variables, calibrating Type Ia supernovae, which reach far enough for recession to dominate over peculiar motion. Read the slope. This is essentially Hubble's method with a century of refinement, and it measures $H_0$ **directly**. The SH0ES programme gives

$$H_0 = 73.04 \pm 1.04\ \mathrm{km/s/Mpc}$$

**The early-time, cosmological route.** Measure the acoustic scale imprinted in the cosmic microwave background at $z \approx 1100$ — the same 147 Mpc ruler the Large-Scale Structure chapter derived — and use $\Lambda$CDM to evolve it forward to the present. This does **not** measure $H_0$ directly; it **infers** it, given a model. Planck gives

$$H_0 = 67.4 \pm 0.5\ \mathrm{km/s/Mpc}$$

The difference is 5.6 km/s/Mpc against a combined uncertainty of 1.15 — about **4.9σ**. That is far too large to be chance.

**The obvious escape has been closed.** The leading suspicion was that the local ladder suffered a systematic — specifically that Cepheids in crowded fields were blended with neighbouring stars in Hubble Space Telescope images, biasing their brightnesses. JWST's superior resolution allows the same Cepheids to be re-measured with crowding largely eliminated, and the result agrees with the earlier values: $H_0 = 73.49 \pm 0.93$ km/s/Mpc, with the crowding explanation rejected at the 7–8σ level.

So the discrepancy is not obviously an error in the ladder. Which leaves possibilities of very different weight:

- **A systematic elsewhere in the ladder** — in the supernova standardisation, or the geometric anchors — not yet identified.
- **A systematic in the early-time inference** — less likely, since CMB, BAO and independent probes agree with one another.
- **New physics between $z = 1100$ and now** — something changing the expansion history in a way $\Lambda$CDM does not capture. Early dark energy is the most-explored candidate, and it connects to DESI's preference for an evolving equation of state met in the previous block.

The structural point is worth extracting, because it recurs. **The two measurements are not the same measurement done twice.** One reads $H_0$ off nearby objects with almost no model dependence; the other extracts it from early-universe physics *through* a cosmological model. A disagreement between them is therefore not simply "one is wrong" — it may be that both are right and the **model connecting them** is incomplete. That is precisely why the tension is interesting rather than merely annoying, and why closing the crowding loophole made it more important rather than less.

```checkpoint
q: SH0ES measures H₀ = 73.0 ± 1.0 from the local distance ladder; Planck gives 67.4 ± 0.5 from the CMB. Why is this not simply a case of one measurement being wrong?
a: Because both have small error bars, and small error bars indicate correctness
x: Small uncertainties indicate precision, not accuracy — an unrecognised systematic produces a precise wrong answer, which is exactly what a tension might reflect.
a*: Because they are different kinds of measurement — the ladder reads H₀ directly with little model dependence, while the CMB *infers* it by evolving early-universe physics forward through ΛCDM, so the model connecting them could be what is incomplete
a: Because the two are measuring H₀ at different redshifts, and H₀ genuinely differs between epochs
x: H₀ is by definition the present-day value; the CMB route infers that same present-day quantity rather than measuring a different one.
a: Because the difference is only 4.9σ, which is below the 5σ discovery threshold
x: The threshold is a convention for claiming detection, not a reason the disagreement lacks physical content — and the significance has been rising as both sides improve.
hint: Ask what each method assumes before it produces a number.
why: The local ladder is nearly direct: parallax calibrates Cepheids, Cepheids calibrate Type Ia supernovae, supernovae reach the Hubble flow, and the slope is read off. The CMB route measures the acoustic scale at z ≈ 1100 and propagates it to the present *through* ΛCDM — so its H₀ is a model-dependent inference. If the model omits something operating between then and now, both measurements can be individually correct while disagreeing. That is why JWST's elimination of the Cepheid-crowding systematic at 7–8σ made the tension more interesting rather than less: the easiest way for it to have been a mistake is now closed, leaving an unfound systematic or new physics.
---
q: JWST re-observed SH0ES's Cepheids and rejected crowding as the explanation at 7–8σ. Why did this make the tension *more* significant rather than settling it?
a: Because JWST's own measurement was higher still, widening the gap
x: JWST returned 73.49 ± 0.93, statistically indistinguishable from the earlier 73.04 ± 1.04. The gap did not widen; the explanation for it narrowed.
a*: Because it eliminated the most plausible mundane explanation, so what remains is an unidentified systematic or genuine new physics — a live anomaly is worth more than one with an obvious candidate cause
a: Because it showed the Planck value must be wrong, leaving no consistent early-universe measurement
x: It says nothing about Planck, whose value is independently corroborated by BAO and other early-universe probes. It bears only on the local ladder.
a: Because JWST measurements are inherently more reliable, so the earlier result should be discarded
x: The earlier result was confirmed rather than discarded; the point is corroboration, not replacement.
hint: A discrepancy is only interesting once the boring explanations are gone. Which one was just removed?
why: While Cepheid crowding remained plausible, the tension had a mundane candidate cause — HST's resolution blending Cepheids with unresolved neighbours and biasing their brightnesses. JWST resolves the same stars far better, and the recovered H₀ is unchanged, with crowding excluded at 7–8σ. So the leading way for this to have been a mistake is closed, and what survives is either a systematic nobody has found or physics missing from ΛCDM between z = 1100 and now. This is how anomalies earn attention: not by growing, but by outliving their explanations. The same standard was applied in the Large-Scale Structure chapter to DESI's evolving-dark-energy preference, which likewise strengthened rather than faded when more data arrived.
```

## Pulling the thread

- **Slipher** measured the redshifts (1912–17) but had no distances; **Leavitt's** Cepheid relation supplied them; **Hubble** combined the two for **24 galaxies** in 1929. **Lemaître** had derived the linear relation and estimated its slope in **1927** — hence **Hubble–Lemaître law** since the IAU's 2018 vote. Predicting a relation and measuring it are different contributions, and both were needed.
- Hubble's $H_0 \approx 500$ gave a Hubble time of **1.96 Gyr** against a **4.54 Gyr** Earth. The fix was the **distance scale**, not the physics: **the slope was right and the calibration was wrong by sevenfold** — the characteristic failure mode of distance measurements.
- **Linearity is forced by homogeneity**: only $f(\vec r) = H\vec r$ satisfies $f(\vec a) - f(\vec b) = f(\vec a - \vec b)$, so Hubble's law is the unique expansion law with **no centre**. Every observer sees everything receding from them.
- Beyond the **Hubble radius** $c/H_0 \approx$ **4,300 Mpc**, recession exceeds $c$ — permitted, because relativity limits **local** motion through space, not the expansion of space. Such objects remain visible, since the Hubble radius itself grows.
- **Bound systems do not expand**, and not because they resist a stretching force: expansion describes an unbound smooth distribution, and a virialised system has simply decoupled from it.
- $H_0$ is **constant in space, not in time**: $H(t) = \dot a/a$. The closeness of $1/H_0 = 13.97$ Gyr to the true **13.8 Gyr** is a **coincidence** — early deceleration and recent acceleration nearly cancel.
- The **tension**: **73.04 ± 1.04** (SH0ES) against **67.4 ± 0.5** (Planck), about **4.9σ**. JWST has rejected Cepheid crowding at **7–8σ**, closing the obvious escape. The two are a **direct measurement** and a **model-dependent inference**, so the incomplete thing may be the model between them.

The transferable idea: **an equation's notation can encode a picture that the physics does not support.** Writing $v = H_0 d$ invites a reading in which galaxies move through space, away from a centre, at speeds that must stay below $c$ — and all three implications are false. The symbols are not wrong; they are borrowed from a context (ordinary motion) whose intuitions do not transfer. This is a recurring hazard wherever familiar notation is reused in an unfamiliar regime, and the defence is to ask, of any equation being applied somewhere new, **which of my intuitions about these symbols came from the old context and have not been re-earned in this one.** Here the answer is: nearly all of them.

## Further reading

{{book: Marcia Bartusiak | The Day We Found the Universe | 2009}}

{{book: Edward Harrison | Cosmology: The Science of the Universe | 2000}}

{{book: Steven Weinberg | The First Three Minutes | 1977}}

Beyond the books: Hubble's 1929 paper is a page and a half with a famously scattered plot, and repays being seen next to how confidently the result is now quoted. Lemaître's 1927 paper is worth knowing about for how thoroughly a correct result can be missed when published in the wrong language and journal. And the SH0ES and Planck papers make a good paired reading on what "measuring the same number" can mean when two teams mean different things by it.

## Problems

*Useful numbers: v = H₀d; t_H = 1/H₀; Hubble radius = c/H₀; H(t) = ȧ/a; H₀ = 70 km/s/Mpc unless stated; 1 Mpc = 3.086 × 10¹⁹ km = 3.086 × 10²² m; c = 3.00 × 10⁵ km/s; 1 Gyr = 3.156 × 10¹⁶ s; age of universe 13.8 Gyr; age of Earth 4.54 Gyr; SH0ES 73.04 ± 1.04, Planck 67.4 ± 0.5 km/s/Mpc.*

**1.** *(The age crisis.)* **(a)** Compute the Hubble time for H₀ = 500 km/s/Mpc in Gyr. **(b)** Compare with the age of the Earth and state the nature of the problem. **(c)** State what was actually wrong, and the general lesson about distance measurements.

**2.** *(Reading the relation.)* For H₀ = 70 km/s/Mpc, compute the recession velocity at **(a)** 10 Mpc, **(b)** 100 Mpc, **(c)** 1,000 Mpc. **(d)** State at what distance v = c, and what that distance is called.

**3.** *(Why linear.)* **(a)** Write the condition that every observer sees the same expansion law. **(b)** Show that it forces linearity. **(c)** State what a non-linear law would imply, and why that is unacceptable.

**4.** *(Superluminal recession.)* **(a)** State why recession faster than light does not violate relativity. **(b)** Explain why such objects remain visible. **(c)** State roughly the redshift above which objects are currently receding superluminally.

**5.** *(What does not expand.)* **(a)** Name three systems that do not expand and state why. **(b)** Explain what is wrong with saying gravity "resists" the expansion. **(c)** Connect to the binding criterion from the Superclusters chapter.

**6.** *(The changing constant.)* **(a)** Write H in terms of the scale factor. **(b)** State how H behaves under matter domination and under a cosmological constant. **(c)** Explain why 1/H₀ ≈ the age of the universe is a coincidence, stating what each of deceleration and acceleration does to that comparison.

**7.** *(Two routes to one number.)* **(a)** Describe the local-ladder measurement and state its result. **(b)** Describe the CMB-based determination and state its result. **(c)** State the key methodological difference between them.

**8.** *(The tension.)* **(a)** Compute the significance of the discrepancy from the quoted values. **(b)** State what JWST established and at what significance. **(c)** List the three surviving classes of explanation.

**9.** *(Notation and intuition.)* **(a)** State three false implications the notation v = H₀d invites. **(b)** For each, state the correction. **(c)** State the general lesson about reusing familiar notation in an unfamiliar regime.

## Worked answers

**1.** **(a)** $H_0 = 500\ \mathrm{km/s/Mpc} = 500/(3.086\times10^{19}) = 1.62\times10^{-17}\ \mathrm{s^{-1}}$. So $t_H = 1/H_0 = 6.17\times10^{16}$ s $= 6.17\times10^{16}/3.156\times10^{16} = \mathbf{1.96\ Gyr}$. **(b)** The Earth is **4.54 Gyr** old, so the universe would be **less than half the age of the planet within it** — not a tension to be lived with but a flat contradiction, since the Earth cannot predate the universe. **(c)** The **distance scale**. Hubble's Cepheid calibration was wrong by roughly a factor of seven, in part because — as Baade showed in 1952 — there are two populations of Cepheid-like variables with different period–luminosity relations, and Hubble had calibrated with one while measuring with the other. The **slope of the relation was right; its normalisation was not**. The general lesson: velocities from redshifts are comparatively easy, while distances rest on a chain of calibrations, so in a velocity–distance relation the *shape* is usually robust and the *absolute scale* is where the error lives.

**2.** **(a)** $v = 70\times10 = \mathbf{700\ km/s}$. **(b)** $70\times100 = \mathbf{7{,}000\ km/s}$. **(c)** $70\times1000 = \mathbf{70{,}000\ km/s}$, about $0.23c$. **(d)** $d = c/H_0 = 3.00\times10^5/70 = \mathbf{4{,}286\ Mpc}$, i.e. roughly 4,300 Mpc. This is the **Hubble radius** (or Hubble distance) — the distance at which the recession velocity equals the speed of light. Note it is *not* the edge of the observable universe, which lies considerably further out.

**3.** **(a)** Let $\vec v = f(\vec r)$. For an observer on galaxy 1 to see the same law as us, the relative velocity of galaxy 2 must satisfy $f(\vec r_2) - f(\vec r_1) = f(\vec r_2 - \vec r_1)$ for all $\vec r_1, \vec r_2$. **(b)** That is Cauchy's functional equation in vector form; its continuous solutions are exactly the linear ones, $f(\vec r) = H\vec r$ with $H$ a scalar. Hence $\vec v = H\vec r$, which is Hubble's law. **(c)** A non-linear law would fail the condition, meaning observers at different locations would measure **different** laws — so one location would be distinguished, and there would be a **centre** to the expansion. That contradicts the cosmological principle, and it contradicts observation: every direction looks statistically the same, and no candidate centre exists. The linear form is therefore not one option among many but the unique law consistent with homogeneity, which is why it holds without any force causing it.

**4.** **(a)** Because special relativity forbids **local** motion through space faster than light — anything passing anything else at the same point in spacetime. Cosmological recession is not local motion: each galaxy is nearly at rest with respect to the space immediately around it, and the separation grows because the intervening space expands. No local measurement anywhere yields a superluminal speed. **(b)** Because the **Hubble radius grows with time**. A photon emitted from beyond it initially loses ground — the space between it and us expands faster than it advances — but as the Hubble radius expands, the photon can find itself within a region receding more slowly, and thereafter makes progress and reaches us. Superluminal recession therefore does not hide an object. **(c)** Above **$z \approx 1.5$**, objects are receding faster than light at the present epoch — which includes essentially every galaxy in a deep field, all of them observed without difficulty.

**5.** **(a)** **Atoms**, held by electromagnetism at a size set by quantum mechanics. **The Solar System**, held by gravity in stable orbits. **Galaxies and clusters**, which turned around, collapsed and virialised long ago. Each is a bound system that has reached equilibrium, and expansion describes an unbound, smooth distribution rather than acting on such systems. **(b)** Because it implies expansion is a **force** that gravity must continually oppose, leaving bound systems under permanent strain. In standard cosmology there is no such force and no such strain: once a region has virialised it has **decoupled**, and the expansion of the wider universe is simply irrelevant to its size. The cosmological constant does contribute a genuine, tiny repulsion, but it is utterly negligible on the scale of an atom or a planetary system. **(c)** The Superclusters chapter's criterion, $M > \Omega_\Lambda H_0^2R^3/G$, decides whether a region ever turns around. Everything satisfying it has already collapsed and left the Hubble flow; everything failing it — superclusters and larger — never will, and continues to expand. The expansion is what the universe does **where nothing has taken hold**.

**6.** **(a)** $H(t) = \dot a/a$, the fractional rate of change of the scale factor. **(b)** Under **matter domination**, gravity decelerates the expansion and $H$ **falls** with time (as $2/3t$). Under a **cosmological constant**, the expansion accelerates and $H$ approaches a **constant floor**, $\sqrt{\Lambda/3}$. Our universe did the first for most of its history and has been doing the second since about $z\approx0.3$. **(c)** $1/H_0$ equals the age only if the expansion rate has never changed. **Deceleration** means the universe expanded faster in the past, reaching its present size **sooner**, so the true age is **less** than $1/H_0$. **Acceleration** means it expanded more slowly in the past, so the age is **greater**. Ours decelerated for billions of years and has accelerated since, and the two contributions **nearly cancel** — giving 13.8 Gyr against a Hubble time of 13.97. The agreement is therefore a coincidence of our epoch, not evidence that expansion has been uniform.

**7.** **(a)** The **local distance ladder**: geometric parallax to nearby stars calibrates the Cepheid period–luminosity relation; Cepheids in nearby galaxies calibrate the peak luminosity of Type Ia supernovae; supernovae reach distances where recession dominates over peculiar velocity; the slope of $v$ against $d$ is read off. This is Hubble's method refined for a century. SH0ES gives $\mathbf{73.04 \pm 1.04}$ km/s/Mpc. **(b)** The **CMB route**: measure the angular scale of the acoustic peaks at $z\approx1100$ — the 147 Mpc sound horizon — and evolve that scale forward to the present using $\Lambda$CDM, extracting the $H_0$ that makes the observed angle come out right. Planck gives $\mathbf{67.4 \pm 0.5}$ km/s/Mpc. **(c)** The ladder **measures** $H_0$ almost directly, with little cosmological model dependence; the CMB route **infers** it, given a model of everything that happened between recombination and now. They are not the same measurement performed twice, which is why a disagreement admits the possibility that both are right and the connecting model is incomplete.

**8.** **(a)** Difference $= 73.04 - 67.4 = 5.64$. Combined uncertainty $= \sqrt{1.04^2 + 0.5^2} = \sqrt{1.082+0.25} = 1.15$. Significance $= 5.64/1.15 = \mathbf{4.9\sigma}$. **(b)** JWST re-observed the same Cepheids used by SH0ES at higher angular resolution, largely eliminating **crowding** — the blending of a Cepheid with unresolved neighbours in HST images, which was the leading candidate systematic. The results agree with the earlier values ($H_0 = 73.49 \pm 0.93$), and the crowding explanation is rejected at the **7–8σ** level. **(c)** *First*, an **unidentified systematic elsewhere in the local ladder** — in supernova standardisation, or in the geometric anchors. *Second*, a **systematic in the early-time inference**, which is considered less likely because CMB, BAO and other early-universe probes agree among themselves. *Third*, **new physics** altering the expansion history between $z=1100$ and now that $\Lambda$CDM omits — early dark energy being the most explored, and connecting to DESI's preference for an evolving dark energy equation of state.

**9.** **(a)** That galaxies are **moving through space**; that there is a **centre** from which they recede; and that recession **cannot exceed $c$**. **(b)** *Motion*: galaxies are approximately at rest in their local space, and separations grow because the intervening space expands. *Centre*: linearity is the unique law under which every observer sees the same relation, so every observer sees everything receding from them and no centre exists. *Speed limit*: relativity constrains local motion through spacetime, not the expansion of spacetime, so superluminal recession beyond $c/H_0 \approx 4{,}300$ Mpc is permitted and such objects remain visible. **(c)** That **notation carries the intuitions of the context it was borrowed from**, and those intuitions are not automatically re-earned in a new regime. Here $v$, $d$ and the form of the equation all come from ordinary kinematics, where every one of the three implications above would be correct. The symbols are not wrong; the imported reasoning is. The defence is to ask of any familiar equation applied somewhere unfamiliar: **which of my intuitions about these symbols came from the old setting, and which have I actually re-derived in this one?**$expHub_master$,
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
