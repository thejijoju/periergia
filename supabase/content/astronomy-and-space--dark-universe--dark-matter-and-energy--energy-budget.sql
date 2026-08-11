-- Astronomy & Space · The Dark Universe — Dark Matter & Energy — "The Energy Budget".
-- Curated master for
-- astronomy-and-space/dark-universe/dark-matter-and-energy/energy-budget
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Second chapter of Dark Matter & Energy. Organised around the pie chart
-- being a snapshot of one epoch rather than a fact about what the
-- universe is made of - Omega_Lambda was 1.3e-9 at recombination and
-- tends to 1 in the future, so the familiar 68/27/5 split describes now
-- and nothing else. Also the point that the 5% we supposedly understand
-- was itself a third missing until FRB dispersion measures closed the
-- census in 2020. Contents: rho_c = 4.79 GeV/m3; the components and how
-- each is measured; the baryon census broken out; the epoch dependence
-- worked at several redshifts; Omega_total = 1.000 +/- 0.002; and what
-- "we don't know what 95% is" does and does not mean.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/dark-matter-and-energy/energy-budget',
    'research',
    'advanced',
    'read',
    $duBudget_master$> The pie chart is the most reproduced image in cosmology and the most misread. **68.5% dark energy, 26.6% dark matter, 4.9% ordinary matter** — presented as though it described what the universe is made of.

It describes what the universe is made of **now**. At recombination the dark energy slice was $1.3\times10^{-9}$ — a billionth of the chart. In the far future it will be essentially the whole chart. **The proportions are not properties of the universe; they are properties of the present moment**, and every component's share is changing as you read.

There is a second misreading worth heading off. "We don't understand 95% of the universe" is a good line and a poor description. **We understand a great deal about how the dark components behave** — enough to predict the CMB peak heights, the growth of structure and the expansion history to per-cent precision. What we lack is an identification. And the 5% we supposedly do understand was itself **a third unaccounted for until 2020**, which is rarely mentioned.

## The critical density, and what a fraction means

Every $\Omega$ is a ratio to the **critical density** — the density that makes the universe spatially flat:

$$\rho_c = \frac{3H_0^2}{8\pi G} = 8.53\times10^{-27}\ \mathrm{kg\ m^{-3}}.$$

In more legible units that is $7.67\times10^{-10}$ J m⁻³, or **4.79 GeV per cubic metre** — about five hydrogen atoms' worth of energy in every cubic metre of space, as the Cosmic Scale chapter noted when comparing it with laboratory vacuum.

Every component is then quoted as $\Omega_i = \rho_i/\rho_c$, and the flatness measurement says

$$\Omega_{\rm total} = 1.000 \pm 0.002.$$

Two things follow immediately, and both are worth stating because they are easy to slide past.

**The fractions must sum to one by construction, but their doing so is a measurement.** $\Omega_{\rm total} = 1$ is not an identity — a universe with $\Omega_{\rm total} = 1.3$ is a perfectly consistent closed universe. That the measured components add to unity to within 0.2% is the flatness result from the CMB's first acoustic peak, arrived at independently of the individual densities.

**$\rho_c$ depends on $H_0$, so every $\Omega$ inherits the $H_0$ tension.** Since $\rho_c \propto H_0^2$, the 8% disagreement between the CMB and local determinations propagates to a 17% disagreement in $\rho_c$. This is why the physically measured quantities are the combinations $\Omega_bh^2$ and $\Omega_ch^2$ rather than $\Omega_b$ and $\Omega_c$ — **those are what the data actually constrain**, and splitting them into an $\Omega$ and an $h$ imports a choice.

## The components

| Component | $\Omega$ | How measured |
| --- | --- | --- |
| Dark energy | $0.685 \pm 0.007$ | CMB + supernovae + BAO, jointly |
| Dark matter | $0.266 \pm 0.005$ | CMB third peak; lensing; dynamics |
| Baryons | $0.0493 \pm 0.0006$ | CMB peak ratio; primordial deuterium |
| Neutrinos | $< 0.003$ | CMB lensing + structure growth |
| Photons | $5.4\times10^{-5}$ | CMB temperature alone |

A few remarks on how these are actually obtained, because "measured" hides a lot of variation in directness.

**Photons are the easiest quantity in cosmology.** $\Omega_\gamma$ follows from $T_0 = 2.72548$ K by $u = a_{\rm rad}T^4$ and nothing else — no model, no distance, no assumption. It is also almost negligible today, at one part in 18,000, having dominated everything before $z = 3402$.

**Baryons are measured twice, and agree.** Primordial deuterium at 200 seconds and the CMB's odd-to-even peak ratio at 372,000 years give $\Omega_bh^2$ to 0.2% agreement, as the nucleosynthesis chapter set out.

**Dark matter comes chiefly from the third peak**, with lensing and dynamics as independent confirmation at very different scales.

**Dark energy is the least directly measured of the four**, and the difference is worth being clear about. It is not weighed; it is **inferred as what remains** once the geometry is fixed. The CMB says the universe is flat, so $\Omega_{\rm total} = 1$; the CMB and structure say matter is 0.315; therefore something contributes 0.685. Supernovae and BAO then confirm that the something behaves as expected — accelerating the expansion, with an equation of state near $w = -1$. **The inference is sound and multiply checked, but its logical structure is subtraction rather than measurement**, which is a real difference in kind from how $\Omega_\gamma$ is obtained.

**Neutrinos are the one component known to exist and not yet weighed.** Oscillation experiments establish that at least two species have mass, so $\Omega_\nu > 0$ is certain; the sum of masses is bounded above by CMB lensing and structure growth at $\sum m_\nu < 0.12$ eV, giving $\Omega_\nu < 0.003$. **A cosmological bound is currently the tightest constraint on a particle property that laboratory experiments have not reached** — the reverse of the usual direction.

```checkpoint
q: Dark energy is quoted as $\Omega_\Lambda = 0.685 \pm 0.007$, comparable in precision to the other components. How is that number obtained?
a: By measuring the energy density of the vacuum directly, from its gravitational effect on nearby systems
x: Vacuum energy has no measurable effect on bound systems; local tests are many orders of magnitude from the required sensitivity.
a*: Largely by subtraction — the CMB fixes the geometry as flat, so the components must sum to one, and matter accounts for 0.315; supernovae and BAO then confirm the remainder behaves as expected rather than establishing its amount
a: From supernova distances alone, which measure the acceleration and hence the dark energy density
x: Supernovae establish that the expansion accelerates and constrain the equation of state, but on their own they do not pin the density to this precision.
a: From the CMB's first acoustic peak, which is directly sensitive to the dark energy density
x: The first peak measures the geometry — $\Omega_{\rm total}$ — not the dark energy component individually.
hint: Ask which quantity is measured and which is what is left over.
why: The CMB's first acoustic peak position gives $\Omega_{\rm total} = 1.000 \pm 0.002$, the peak heights give $\Omega_bh^2$ and $\Omega_ch^2$, and matter therefore accounts for 0.315. The remaining 0.685 is inferred as what must be present for the total to reach unity. Supernovae and baryon acoustic oscillations then check that the remainder behaves like dark energy — accelerating the expansion, equation of state near $w = -1$ — which is a genuine and important confirmation, but the amount comes chiefly from the sum rule. The inference is sound and multiply cross-checked, and it is still structurally different from $\Omega_\gamma$, which follows from a temperature and a constant with nothing subtracted. Knowing which of your numbers are measured and which are residuals matters, because a residual absorbs every error in the terms it was subtracted from.
---
q: $\Omega_{\rm total} = 1.000 \pm 0.002$. Is that a measurement or a consequence of how the $\Omega$s are defined?
a: A definition — the components are fractions of the total, so they necessarily sum to one
x: They are fractions of the *critical* density, not of the actual total. Nothing requires the actual density to equal the critical one.
a*: A measurement — each $\Omega_i$ is a ratio to the critical density, and a universe whose actual density differs from critical is a perfectly consistent closed or open universe, so the sum reaching unity is the flatness result from the CMB's first peak
a: A consequence of inflation, which drives the universe to flatness and so guarantees the result
x: Inflation predicts it, which is why the confirmation is interesting — but a prediction confirmed is still a measurement, not a guarantee.
a: A convention, since $\Omega_\Lambda$ is defined as whatever makes the total unity
x: $\Omega_\Lambda$ is cross-checked by supernovae and BAO, which would reveal a mismatch; it is constrained, not defined into place.
hint: Ask what the denominator in $\Omega_i = \rho_i/\rho_c$ actually is.
why: Each $\Omega_i = \rho_i/\rho_c$ where $\rho_c = 3H_0^2/8\pi G$ is the density that would make space flat — a reference value, not the actual total. A universe with $\sum\Omega_i = 1.3$ is a consistent closed universe and one with 0.7 an open one; both are ordinary solutions of the Friedmann equations. So the sum equalling unity is a substantive result, obtained from the angular position of the CMB's first acoustic peak comparing the known sound horizon against the distance to last scattering. Inflation predicts it, which is part of why confirming it mattered, and $\Omega_\Lambda$ is independently checked by supernovae and BAO rather than being defined to fill the gap. Treating the sum rule as a definition would silently discard one of the better-measured facts in cosmology.
```

## The 5% is not simple either

The ordinary matter — the part supposedly understood — deserves breaking open, because the census is more interesting than the total.

Baryons are 4.9% of the energy budget. Where are they?

| Reservoir | Share of baryons |
| --- | --- |
| Warm–hot intergalactic medium ($10^{5}$–$10^{7}$ K) | ~30% |
| Photoionised IGM (Lyman-α forest) | ~28% |
| Circumgalactic medium | ~5% |
| Intracluster medium | ~4% |
| Stars and stellar remnants | ~7% |
| Cold neutral gas in galaxies | ~2% |
| Unaccounted for, before 2020 | ~30% |

Read the last two rows together. **Stars are 7% of the baryons, which are 4.9% of the budget — so everything that shines is about 0.3% of the universe.** The overwhelming majority of ordinary matter is diffuse gas that emits almost nothing, which is why the Intergalactic Medium chapter had to find it in absorption against background quasars rather than in emission.

And read the last row on its own. **Until 2020, roughly a third of the baryons could not be located.** This was the *missing baryon problem*, and it was a real gap: the total was known precisely from deuterium and the CMB, but adding up the observed reservoirs fell short. The shortfall was suspected to be in the warm–hot intergalactic medium, whose temperature makes it nearly invisible — too hot for Lyman-α absorption, too cool and diffuse for X-ray emission.

The resolution came from an unexpected direction. **Fast radio bursts** are millisecond pulses from cosmological distances, and their signals are dispersed by free electrons along the line of sight — lower frequencies arrive later, by an amount proportional to the total electron column. **Every free electron between source and observer contributes, however diffuse and however cold.** Macquart and collaborators reported in 2020 that FRB dispersion measures, combined with host redshifts, give a baryon density consistent with the CMB value, and the missing baryons were where they were expected to be.

Two lessons are worth extracting, and they generalise.

**The problem was one of detectability, not existence.** The baryons were never actually missing; they were in a phase that emits and absorbs poorly. **A census gap should first raise the question of what state would be hardest to see**, before it raises questions about the total.

**The instrument that solved it was not built for the purpose.** FRBs were discovered in 2007 and their origin is still not fully settled, yet dispersion measure — a nuisance parameter for anyone studying the bursts themselves — turned out to be exactly the observable the baryon census needed. This is the same structure as LUNA's nuclear cross-section resolving the deuterium baryometer: **the limiting uncertainty was removed by a measurement from outside the field that had the problem.**

```checkpoint
q: Until 2020, about 30% of baryons could not be located, though the total was precisely known. What was going on?
a: The total was overestimated, and the 2020 work corrected the CMB and deuterium determinations downward
x: Both determinations stood; the FRB result confirmed the existing total rather than revising it.
a*: The baryons were in the warm–hot intergalactic medium at $10^{5}$–$10^{7}$ K — too hot for Lyman-α absorption and too diffuse for X-ray emission — so they were hard to detect rather than absent, and fast radio burst dispersion measures found them
a: They had been converted into dark matter, resolving both problems at once
x: Nothing converts baryons into non-baryonic matter, and the baryon density is fixed at nucleosynthesis.
a: They were locked in black holes, which emit nothing and so escaped every census
x: Stellar-mass black holes are counted with stellar remnants and are far too few; primordial black holes are not baryonic.
hint: Ask what temperature range would make a gas nearly invisible to both of the standard probes.
why: The baryon total is fixed to per-cent precision by primordial deuterium and the CMB peak ratio, so a census shortfall meant a detection problem, not an accounting one. The suspected reservoir was the warm–hot intergalactic medium, whose temperature is awkward: hot enough to ionise the hydrogen that Lyman-α absorption relies on, yet too diffuse and too cool to emit detectable X-rays. Fast radio bursts solved it because their signals disperse in proportion to the *total free-electron column*, counting every electron regardless of temperature or density. Macquart and colleagues showed in 2020 that FRB dispersion measures with known host redshifts recover the CMB baryon density. Two general lessons: a census gap should first prompt the question of which state is hardest to see; and the instrument that closed this one was not built for it, exactly as LUNA's nuclear measurement resolved the deuterium baryometer.
---
q: Stars and stellar remnants are about 7% of baryons, and baryons are 4.9% of the energy budget. What follows?
a: That most ordinary matter is in planets and dust, which are not counted as stellar
x: Planets and dust are a negligible fraction of baryons; the bulk is diffuse ionised gas between galaxies.
a*: That everything which shines amounts to roughly 0.3% of the universe's energy content, with the great majority of ordinary matter in diffuse gas that emits almost nothing
a: That the stellar census is badly incomplete, since stars should dominate the baryons
x: The stellar census is reasonably good; stars genuinely are a small minority of baryons, which is a physical fact rather than an observational shortfall.
a: That most baryons are in galaxy clusters, whose intracluster gas dominates the budget
x: The intracluster medium is only about 4% of baryons; clusters are rare and contain a small share of cosmic material.
hint: Multiply the two fractions and ask what the product represents.
why: $0.07 \times 0.049 \approx 0.003$, so all the luminous matter in the universe is about **0.3%** of its energy content. The remainder of the baryons sits in the warm–hot intergalactic medium (~30%), the photoionised Lyman-α forest (~28%), the circumgalactic medium (~5%) and the intracluster medium (~4%) — all of it diffuse ionised gas that emits very little. This is why the Intergalactic Medium chapter had to detect it in absorption against background quasars rather than in emission, and why the census took so long to close. The general point is that astronomy is a science built on emitted light while most of the material universe does not emit: what is easy to observe and what is abundant are close to unrelated.
```

{{image: Dark energy | The present composition of the universe by energy density — about 68.5% dark energy, 26.6% dark matter and 4.9% ordinary matter. The proportions describe the current epoch only: dark energy's share was a billionth of the total at recombination and rises toward unity in the future, so the chart is a snapshot rather than a statement about what the universe is made of. Within the 4.9%, stars and remnants account for only about 7%, so everything that shines is roughly 0.3% of the whole.}}

## Three probes, one intersection

The budget's credibility rests on something the table above does not show: **the three principal probes constrain different combinations of the parameters, and their constraints cross at a point.**

Plot the allowed regions in the plane of $\Omega_m$ against $\Omega_\Lambda$, and each probe traces a band rather than a point, because each is sensitive to a combination rather than to either alone.

**The CMB** fixes the angular scale of the sound horizon, which depends on the total density through the geometry. Its band runs close to the line $\Omega_m + \Omega_\Lambda = 1$ — nearly perpendicular to the axis of the other two, and very narrow, because $100\theta_*$ is measured to 0.03%.

**Type Ia supernovae** measure the luminosity distance as a function of redshift, which depends on the *deceleration*: roughly $\Omega_\Lambda - \Omega_m$. Their band runs at a steep angle across the CMB's, since a universe with more matter and more dark energy can produce the same acceleration as one with less of both.

**Baryon acoustic oscillations** measure the same sound horizon as the CMB but at low redshift, in galaxy clustering, giving a band constraining chiefly $\Omega_m$ — nearly vertical.

Three bands at three different angles. **They intersect in a small region, and that intersection is the budget.**

The force of this is the same argument the previous chapter made about independent methods, sharpened by geometry. Any one probe, on its own, leaves a degenerate direction along which the parameters can trade off freely — supernovae alone cannot separate a high-matter high-$\Lambda$ universe from a low-matter low-$\Lambda$ one. **The degeneracies are broken not by better data but by combining measurements whose degeneracy directions differ.**

Two things about this deserve emphasis.

**The intersection is over-determined.** Three bands crossing at one point is one more constraint than is needed to fix two parameters — any two would suffice, and the third could have missed. It does not. That redundancy is a test the framework passes, and it is why the budget survived the substantial revisions each individual probe underwent between 1998 and now.

**It also means no single probe "discovered" the budget.** The 1998 supernova results are rightly credited with establishing acceleration, but they did not by themselves determine $\Omega_\Lambda$ — they determined a combination, and the value followed once the CMB fixed the geometry two years later. **Popular accounts that attribute the whole budget to the supernova measurement collapse a three-probe intersection into one leg of it.**

```checkpoint
q: Type Ia supernovae, the CMB and baryon acoustic oscillations each constrain a band rather than a point in the $\Omega_m$–$\Omega_\Lambda$ plane. Why does combining them determine the budget so much better than any one?
a: Because averaging three measurements reduces the statistical error by $\sqrt{3}$
x: The gain is far larger than $\sqrt{3}$ and is not statistical — it comes from the geometry of how the constraints are oriented.
a*: Because each is sensitive to a different combination of the parameters, so their bands run at different angles and the degenerate direction of one is well constrained by another
a: Because the CMB is the most precise, and the other two simply confirm it
x: The CMB's band is narrow but runs nearly along $\Omega_m + \Omega_\Lambda = 1$, leaving the split between them poorly determined without the others.
a: Because supernovae probe low redshift and the CMB high redshift, so together they cover the whole expansion history
x: The redshift coverage helps, but the decisive point is the orientation of the constraints, not their epoch.
hint: Draw two long thin ellipses and ask when their overlap is small.
why: Each probe measures a combination: the CMB fixes the geometry and so constrains roughly $\Omega_m + \Omega_\Lambda$; supernovae measure the deceleration and so constrain roughly $\Omega_\Lambda - \Omega_m$; BAO constrains chiefly $\Omega_m$. Each therefore leaves a degenerate direction along which parameters trade off freely — supernovae alone cannot distinguish a high-matter, high-$\Lambda$ universe from a low-low one. Bands running at different angles intersect in a small region, so the degeneracies are broken by orientation rather than by precision. Two consequences: the intersection is over-determined, since two bands would suffice and the third could have missed but does not; and no single probe determined the budget, so accounts crediting the whole thing to the 1998 supernova result collapse a three-way intersection into one of its legs.
```

## The chart changes

Now the central point of the chapter.

Each component's density scales differently with expansion:

$$\rho_r \propto a^{-4}, \qquad \rho_m \propto a^{-3}, \qquad \rho_\Lambda = \mathrm{constant}.$$

Radiation dilutes fastest — one factor of $a^{-3}$ from volume and one more from redshift. Matter dilutes as volume alone. Dark energy does not dilute at all. **The fractions therefore change continuously, and their present values have no special status except that we are here to write them down.**

Evaluating $\Omega_i(z) = \rho_i(z)/\rho_{\rm tot}(z)$ through cosmic history:

| Epoch | $z$ | $\Omega_r$ | $\Omega_m$ | $\Omega_\Lambda$ |
| --- | --- | --- | --- | --- |
| Matter–radiation equality | 3402 | 0.496 | 0.504 | $2.8\times10^{-11}$ |
| Recombination | 1090 | 0.240 | 0.760 | $1.3\times10^{-9}$ |
| Cosmic noon | 2 | 0.0008 | 0.925 | 0.074 |
| Acceleration begins | 0.63 | 0.0003 | 0.666 | 0.334 |
| Now | 0 | 0.00005 | 0.315 | 0.685 |
| $a = 2$ | $-0.5$ | — | 0.054 | 0.946 |
| $a = 10$ | $-0.9$ | — | 0.0005 | 0.9995 |

Look at the dark energy column. At recombination it was **one part in a billion**. At cosmic noon, when most of the universe's stars were forming, it was 7%. Now it is 68.5%. When the universe has doubled in size again it will be 95%, and it tends to 1 thereafter.

**A cosmologist at any other epoch would draw a completely different chart, and would be equally correct.** The 68/27/5 split is a fact about the present, of the same kind as the current global population or the price of copper — true, measurable, and not a constant of nature.

This reframes the **coincidence problem** the Timeline chapter raised. The puzzle is not that dark energy exists but that we observe it during the brief interval when its share is comparable to matter's. Since $\rho_m/\rho_\Lambda \propto a^{-3}$, the two are within a factor of ten of each other for only about one decade in scale factor out of the many the universe will traverse. **We are looking at the chart during the only period when it has more than one large slice.**

That fact should temper how the pie chart is read. It is a snapshot taken during an unusual moment, and its most striking feature — that three components are all significant at once — is precisely the feature that will not last.

```checkpoint
q: At recombination, $\Omega_\Lambda$ was about $10^{-9}$; today it is 0.685. What does this imply about the standard pie chart?
a: That the dark energy density has grown enormously since recombination
x: The dark energy *density* is constant; what has changed is everything else, which has diluted away beneath it.
a*: That it is a snapshot of the present epoch rather than a statement about what the universe is made of — the components dilute at different rates, so the proportions change continuously
a: That the early universe contained no dark energy, which appeared later
x: The dark energy density was the same then as now; its *share* was tiny because matter and radiation densities were enormous.
a: That measurements of $\Omega_\Lambda$ at high redshift disagree with those at low redshift
x: There is no such disagreement; a single constant density accounts for both, and the changing fraction is a prediction rather than a tension.
hint: Ask which of the three densities actually changes with time.
why: Radiation dilutes as $a^{-4}$, matter as $a^{-3}$, and the cosmological constant not at all. So the *density* of dark energy at recombination was exactly what it is now, while matter was $(1+z)^3 \approx 1.3\times10^{9}$ times denser — which is why dark energy's share was $1.3\times10^{-9}$. The chart runs 0.496/0.504/$3\times10^{-11}$ at matter–radiation equality, 0.0008/0.925/0.074 at cosmic noon, 0.00005/0.315/0.685 now, and tends to 0/0/1 in the future. A cosmologist at any other epoch would draw a different chart and be equally right. It also reframes the coincidence problem: because $\rho_m/\rho_\Lambda \propto a^{-3}$, the two are comparable for only about one decade in scale factor, so the chart's most arresting feature — three significant slices at once — is exactly the part that does not last.
```

## What $w$ is, and how well it is known

One number in the table has been used without explanation. Dark energy's **equation of state** parameter relates its pressure to its energy density:

$$w = \frac{p}{\rho c^2}.$$

For a cosmological constant, $w = -1$ exactly, and the density stays constant as the universe expands. For any other value the density evolves as

$$\rho_{\rm DE} \propto a^{-3(1+w)},$$

so $w = -1$ gives $a^0$, constant; $w = -1/3$ would give $a^{-2}$ and no acceleration at all; and $w < -1$ — so-called phantom energy — would give a density that *grows* with expansion, ending in a Big Rip.

Measuring $w$ therefore means measuring how the dark energy density changed over cosmic history, which requires the expansion history over a range of redshift. Supernovae, BAO and the CMB together give

$$w = -1.03 \pm 0.03.$$

**Consistent with a cosmological constant, and tight enough to exclude a good deal.** It rules out $w = -1/3$ overwhelmingly, disfavours the simplest quintessence models with strongly evolving $w$, and constrains phantom behaviour to a narrow window.

Three qualifications belong with that number, and they are the difference between a headline and an understanding.

**It assumes $w$ is constant.** Allowing $w$ to vary with redshift — usually parameterised as $w(a) = w_0 + w_a(1-a)$ — widens the constraints considerably, and $w_a$ is only bounded at the level of a few tenths. **A slowly evolving dark energy is not excluded**, and successive surveys have repeatedly reported mild preferences for evolution that subsequent data did not sustain.

**The measurement is a comparison of distances, so it inherits every calibration problem the distance ladder has.** A systematic in supernova standardisation propagates directly into $w$, and the assumption that Type Ia supernovae behave identically at $z = 1$ and $z = 0$ is an extrapolation, not a measurement.

**$w = -1$ being consistent with the data is not the same as its being explained.** The next chapter takes this up, but the point belongs here: a cosmological constant fits everything and is theoretically catastrophic, since the natural estimate of vacuum energy exceeds the observed value by tens of orders of magnitude. **Cosmology's best-fitting parameter is also its worst-understood one.**

```checkpoint
q: Dark energy's equation of state is measured as $w = -1.03 \pm 0.03$. What does that establish?
a: That dark energy is the vacuum energy of quantum fields, which predicts $w = -1$
x: Vacuum energy does predict $w = -1$, but its predicted magnitude is wrong by tens of orders of magnitude, so the agreement in $w$ does not identify it.
a*: That the dark energy density has changed little over the observed range of redshift, consistent with a cosmological constant — but assuming $w$ is constant, and leaving slowly evolving models open
a: That the dark energy density is exactly constant, since $w = -1$ lies within the error bar
x: Lying within an error bar is consistency, not proof of exactness, and allowing $w$ to evolve widens the constraint considerably.
a: That phantom energy and a Big Rip are excluded, since $w < -1$ is ruled out
x: $w = -1.03$ is slightly on the phantom side of $-1$; phantom behaviour is constrained to a narrow window, not excluded.
hint: Ask what $w$ controls, and what had to be assumed to measure it.
why: The equation of state $w = p/\rho c^2$ fixes how the density evolves, through $\rho_{\rm DE} \propto a^{-3(1+w)}$: $w = -1$ gives a constant density, $w = -1/3$ gives $a^{-2}$ and no acceleration, $w < -1$ gives a density that grows. Measuring it means measuring the expansion history over a range of redshift, and supernovae, BAO and the CMB jointly give $-1.03 \pm 0.03$ — consistent with a cosmological constant and tight enough to exclude $w = -1/3$ decisively. But the number assumes $w$ is constant; allowing $w(a) = w_0 + w_a(1-a)$ leaves $w_a$ bounded only at the level of a few tenths, so slowly evolving dark energy survives. And consistency is not explanation: a cosmological constant fits everything while remaining theoretically catastrophic, which makes it simultaneously cosmology's best-fitting and worst-understood parameter.
```

## What "we don't know what 95% is" actually means

The slogan is worth unpacking, because it is both true and misleading, and the two components of that need separating.

**What is genuinely not known**: the identity of either dark component. Dark matter is an unidentified particle, undetected in any laboratory despite four decades of increasingly sensitive searches. Dark energy has no accepted physical origin, and the most natural candidate — vacuum energy from quantum field theory — gives a prediction wrong by many tens of orders of magnitude, as the next chapter takes up.

**What is known, and is a great deal more than "nothing"**: their densities to a few per cent; that dark matter is cold, effectively collisionless and non-baryonic; that dark energy's equation of state is $w = -1.03 \pm 0.03$, consistent with a cosmological constant; that dark matter clusters gravitationally and dark energy does not; and that both are required by measurements at epochs separated by 13 billion years, using unrelated physics.

The distinction matters because **"we don't know what it is" and "we don't know anything about it" are very different claims**, and the slogan invites conflating them. A physicist in 1900 did not know what an atom was made of, and could still state its mass, its chemical behaviour and its statistics with precision. That is roughly the situation here.

There is also a sense in which the slogan **understates** the difficulty. **The 5% was not fully accounted for either, until 2020.** A third of the ordinary matter — matter whose identity, physics and total quantity were all known exactly — could not be located. If the well-understood component can go missing for two decades, the confidence attached to the phrase "the part we understand" deserves some discounting.

And there is a sense in which it **overstates** it. Every measurement in this chapter is a measurement of gravitational effects, and gravity does not care what a particle is. **The budget is complete and consistent as a description of how the universe gravitates**, which is the only respect in which the components enter cosmology at all. The identification problem is a particle physics problem that cosmology has handed over, not a hole in the cosmological accounting.

```checkpoint
q: What is the most accurate reading of "we don't understand 95% of the universe"?
a: It is accurate — the dark sector is entirely mysterious and no reliable statements can be made about it
x: Densities are known to a few per cent, dark matter's clustering behaviour is well characterised, and $w = -1.03 \pm 0.03$ — these are reliable statements.
a*: It conflates not knowing an identity with not knowing anything: the densities, clustering behaviour and equation of state are measured precisely, and what is missing is a particle identification, which is a different kind of gap
a: It is an overstatement, since dark energy is well explained as vacuum energy from quantum field theory
x: The vacuum energy prediction is wrong by many tens of orders of magnitude, so it is not an explanation.
a: It is an understatement, since the ordinary 5% also remains largely unaccounted for
x: The baryon census closed in 2020 with FRB dispersion measures; the historical gap is a useful caution but is no longer open.
hint: Distinguish "what is it made of" from "how does it behave".
why: A great deal is known: densities to a few per cent, dark matter cold, collisionless and non-baryonic, dark energy at $w = -1.03 \pm 0.03$, both required by independent measurements 13 billion years apart. What is unknown is the identity of either — no laboratory detection of a dark matter particle, no accepted origin for dark energy. That is the same position as a physicist in 1900 who could state an atom's mass and chemistry without knowing its constituents. The slogan also understates the difficulty in one respect, since even the 5% had a third missing until 2020, and overstates it in another: every measurement here concerns how the universe gravitates, and the budget is complete and consistent in exactly that respect. The identification problem has been handed to particle physics; it is not a hole in the cosmological accounting.
---
q: Which of these best captures why the pie chart should not be read as "what the universe is made of"?
a: Because the measurements have large enough uncertainties that the proportions could be quite different
x: The proportions are known to better than a per cent; uncertainty is not the objection.
a*: Because it is a rate-of-change problem caught mid-flight — three densities declining at different speeds, seen during the brief interval when they are comparable — so the fractions are properties of the moment, not of the system
a: Because dark matter and dark energy are unidentified, so labelling slices for them is premature
x: Their densities are well measured whatever they turn out to be; the labels are honest and the objection is about time, not identity.
a: Because the chart omits neutrinos and photons, which are not negligible
x: Both are included and both are genuinely small today — photons at $5.4\times10^{-5}$ and neutrinos below 0.003.
hint: Ask what the same chart would have looked like at recombination, and what it will look like when the universe doubles again.
why: Radiation dilutes as $a^{-4}$, matter as $a^{-3}$, dark energy not at all, so the shares change continuously: $\Omega_\Lambda$ was $1.3\times10^{-9}$ at recombination, 0.074 at cosmic noon, 0.685 now, and 0.946 when the universe next doubles. Since $\rho_m/\rho_\Lambda \propto a^{-3}$, the two are within a factor of ten of each other over less than one decade in scale factor — so the chart's most arresting feature, several comparable slices, exists only briefly. Read as a composition it makes the coincidence problem look like a mystery about physics; read as a snapshot it becomes a question about when we are looking, which admits a selection answer. The corrective generalises to any evolving system: plot the fraction against time before drawing conclusions from its present value.
```

{{image: Baryon acoustic oscillations | The characteristic clustering scale imprinted by sound waves in the pre-recombination plasma, measured in galaxy surveys at low redshift. Combined with the cosmic microwave background and with supernova distances, it fixes the expansion history and hence the split between matter and dark energy — the three probes constraining different combinations of the parameters, so that their intersection determines each component far better than any one of them alone.}}

## Is the budget the same everywhere?

A question that is rarely asked and has a real answer.

Every $\Omega$ in this chapter is a **global** average. But the local universe is manifestly not average: we sit inside a galaxy whose local density exceeds the cosmic mean by a factor of order $10^{5}$, inside a group, near a supercluster. **What licenses treating a global mean as meaningful, and how is it measured?**

Three answers, in increasing strength.

**Homogeneity is measured, not assumed.** As the Large-Scale Structure chapter established, galaxy surveys show the density contrast falling with scale and approaching uniformity above roughly 100 Mpc. Averaging over volumes larger than that gives a stable mean, and the surveys are large enough to contain many such volumes.

**The CMB measures the budget at a single distant epoch, over the whole sky.** The acoustic peak analysis constrains the densities on the last-scattering surface, 45 billion light-years away in every direction, where the fluctuations are one part in $10^{5}$. **That determination has nothing to do with local conditions**, and it agrees with the local ones.

**Consistency across epochs and scales.** Deuterium fixes $\Omega_bh^2$ at 200 seconds; the CMB fixes it at 372,000 years; the Lyman-α forest and FRB dispersion measures fix it at intermediate redshifts. All agree. **A budget varying from place to place would have to conspire to give the same answer at every epoch and along every line of sight.**

There is one live proposal that turns on this, and it is worth stating rather than dismissing. **Could we sit in a large local underdensity — a void — whose faster local expansion mimics acceleration?** Such models were taken seriously in the 2000s, and they are constrained rather than excluded. The difficulty is that a void large enough to produce the observed acceleration would have to be enormous, would violate the Copernican principle badly by placing us near its centre, and would distort the CMB dipole and the kinematic Sunyaev–Zel'dovich signal in ways not observed. **The current status is that void models are strongly disfavoured but the constraint is observational rather than a matter of principle**, which is the right way to hold it.

```checkpoint
q: Every $\Omega$ is a global average, yet we sit in a region $10^{5}$ times denser than the cosmic mean. What justifies the global numbers?
a: The local overdensity is small enough not to matter at the precision quoted
x: A factor of $10^{5}$ is not small; the justification has to be that the measurements do not depend on local density.
a*: Homogeneity above ~100 Mpc is measured in galaxy surveys, and the CMB determination constrains the densities on the last-scattering surface across the whole sky, independent of local conditions — with deuterium, the Lyman-α forest and FRBs agreeing at other epochs
a: The Copernican principle guarantees that our location is typical, so the local values must equal the global ones
x: The Copernican principle is an assumption that observations test rather than a guarantee, and the local region is demonstrably not typical.
a: Global averages are definitional in cosmology and are not measured quantities
x: They are measured — by surveys, by the CMB and by absorption studies — and their agreement across epochs is a substantive result.
hint: Ask which of the measurements could possibly be affected by conditions in our neighbourhood.
why: The justification is not that the local overdensity is negligible — it is a factor of $10^{5}$ — but that the principal determinations do not depend on it. Galaxy surveys measure the density contrast falling toward uniformity above roughly 100 Mpc, so a stable mean exists and is measured over many independent volumes. The CMB constrains the densities on the last-scattering surface across the entire sky, where fluctuations are one part in $10^{5}$, with no reference to local conditions. And deuterium at 200 s, the CMB at 372,000 yr, the Lyman-α forest and FRB dispersion measures all give consistent baryon densities, which a spatially varying budget would have to conspire to reproduce. The one serious alternative — a giant local void mimicking acceleration — is strongly disfavoured by CMB dipole and kinematic Sunyaev–Zel'dovich constraints, though disfavoured observationally rather than excluded in principle.
```

## Why $\Omega_bh^2$ and not $\Omega_b$

A technical point that repays attention, because it explains an otherwise puzzling convention.

Throughout the CMB literature the reported quantities are $\Omega_bh^2 = 0.02237$ and $\Omega_ch^2 = 0.1200$ rather than $\Omega_b$ and $\Omega_c$. The reason is that **these combinations are what the data constrain.**

The physical densities are $\rho_i = \Omega_i\rho_c = \Omega_i \cdot 3H_0^2/8\pi G \propto \Omega_ih^2$. What the CMB acoustic physics responds to is the actual density of baryons and dark matter in the plasma — how much inertia the baryons contribute, how deep the potential wells are — not their ratio to a critical density defined by a Hubble constant the CMB does not directly measure. **So $\Omega_ih^2$ is the physical quantity and $\Omega_i$ is a derived one**, obtained by dividing by an $h$ that must come from somewhere else.

Two consequences follow.

**Every quoted $\Omega$ inherits the $H_0$ tension.** With $h = 0.674$, $\Omega_b = 0.0493$; with $h = 0.730$, the same measured $\Omega_bh^2$ gives $\Omega_b = 0.0420$ — a 15% difference from an 8% disagreement in $H_0$, because the dependence is quadratic. The pie chart's ordinary-matter slice is therefore less certain than its quoted error bar suggests, in a way that has nothing to do with the baryon measurement itself.

**Comparisons across measurements must be made in the same variable.** Comparing a $\Omega_b$ from one analysis with a $\Omega_bh^2$ from another, or two $\Omega_b$ values assuming different $h$, produces spurious agreement or disagreement. **This is a general hazard whenever a field reports derived quantities alongside measured ones**, and it is why careful papers state which they are using.

## Pulling the thread

- $\rho_c = 3H_0^2/8\pi G = 8.53\times10^{-27}$ kg m⁻³ $=$ **4.79 GeV m⁻³**. The measured total is $\Omega_{\rm total} = 1.000 \pm 0.002$ — **a measurement, not an identity**, since a closed universe with $\Omega_{\rm total} > 1$ is perfectly consistent.
- Present split: **dark energy 0.685, dark matter 0.266, baryons 0.0493**, neutrinos $< 0.003$, photons $5.4\times10^{-5}$. But the four are obtained very differently, and **dark energy is inferred by subtraction** — the geometry fixes the total, matter is measured, and the remainder is attributed. Sound, multiply checked, and structurally unlike $\Omega_\gamma$, which follows from a temperature alone.
- **The 5% is not simple.** Stars and remnants are ~7% of baryons, so **everything that shines is about 0.3% of the universe**. Most baryons are diffuse ionised gas: WHIM ~30%, Lyman-α forest ~28%.
- **A third of the baryons were missing until 2020**, and were found by **fast radio burst dispersion measures**, which count every free electron regardless of temperature. Two lessons: a census gap should first prompt "which state is hardest to see?"; and **the instrument that closed it was not built for the purpose.**
- **The chart is a snapshot.** $\Omega_\Lambda$ was $1.3\times10^{-9}$ at recombination, 0.074 at cosmic noon, 0.685 now, and 0.95 when the universe next doubles. **A cosmologist at any other epoch would draw a different chart and be equally correct**, and the chart's striking feature — three significant slices at once — is exactly what will not last.
- **"We don't know what 95% is" conflates two claims.** Densities, clustering behaviour and $w = -1.03 \pm 0.03$ are measured; only the identities are missing. It **understates** the difficulty in that even the 5% went missing for two decades, and **overstates** it in that the accounting of how the universe gravitates is complete and consistent.
- The literature reports **$\Omega_bh^2$, not $\Omega_b$**, because that is what the physics constrains. Every quoted $\Omega$ therefore inherits the $H_0$ tension **quadratically** — an 8% disagreement in $H_0$ becomes 15% in $\Omega_b$.

- **Three probes, one intersection.** The CMB constrains roughly $\Omega_m + \Omega_\Lambda$, supernovae roughly $\Omega_\Lambda - \Omega_m$, BAO chiefly $\Omega_m$ — bands at three different angles crossing in a small region. **The degeneracies are broken by orientation, not by precision**, and the intersection is over-determined: two bands would suffice and the third could have missed.
- **$w = -1.03 \pm 0.03$**, consistent with a cosmological constant, excluding $w = -1/3$ decisively — but assuming $w$ is constant, inheriting the distance ladder's calibration problems, and leaving slowly evolving models open. **Cosmology's best-fitting parameter is also its worst-understood.**
- **The global budget is justified, not assumed.** Homogeneity above ~100 Mpc is measured; the CMB determination is made on the last-scattering surface across the whole sky, independent of local conditions; and four epochs agree. Giant-void alternatives are strongly disfavoured **observationally rather than in principle.**

The transferable idea: **before quoting a proportion, ask whether it is a property of the system or of the moment.** The pie chart looks like a composition and is actually a rate-of-change problem caught mid-flight: three quantities declining at different speeds, glimpsed during the brief window when they are comparable. Reading it as composition produces the coincidence problem as a mystery rather than as an observation about when we happen to be looking. The same error is available wherever fractions are quoted for a system whose components evolve — the share of energy from a given source, the composition of a population, the makeup of a portfolio — and the corrective is the same: **plot the fraction against time before drawing conclusions from its present value.**

## Further reading

{{book: Sean Carroll | The Particle at the End of the Universe | 2012}}

{{book: Katherine Freese | The Cosmic Cocktail | 2014}}

{{book: Evalyn Gates | Einstein's Telescope | 2009}}

Beyond the books: Freese is the best single account of how the budget was assembled, written by someone who did much of the work. The Planck 2018 parameters paper is the reference for every number in this chapter, and its tables repay the effort of learning to read them. On the baryon census, Shull, Smith and Danforth's accounting paper states the problem cleanly and Macquart et al.'s 2020 *Nature* paper closes it — worth reading in sequence for how a twenty-year gap gets shut by an unrelated instrument.

## Problems

*Useful numbers: $H_0 = 67.4$ km s⁻¹ Mpc⁻¹ $= 2.18\times10^{-18}$ s⁻¹; $G = 6.674\times10^{-11}$ SI; $\Omega_\Lambda = 0.685$, $\Omega_m = 0.315$, $\Omega_b = 0.0493$, $\Omega_c = 0.266$, $\Omega_\gamma = 5.4\times10^{-5}$; $\Omega_bh^2 = 0.02237$, $\Omega_ch^2 = 0.1200$, $h = 0.674$; $\sum m_\nu < 0.12$ eV $\Rightarrow \Omega_\nu < 0.003$; $z_{\rm eq} = 3402$, $z_* = 1090$; stars ~7% of baryons; 1 GeV $= 1.602\times10^{-10}$ J.*

**1.** *(Critical density.)* **(a)** Compute $\rho_c$ from $H_0$. **(b)** Convert to GeV m⁻³. **(c)** Explain why $\Omega_{\rm total} = 1$ is a measurement rather than an identity.

**2.** *(How each is measured.)* **(a)** State how $\Omega_\gamma$ is obtained and why it is the most direct. **(b)** State the two independent routes to $\Omega_b$. **(c)** Explain the logical structure by which $\Omega_\Lambda$ is obtained and why it differs in kind.

**3.** *(The baryon census.)* **(a)** Compute the fraction of the universe's energy in stars and remnants. **(b)** Name the two largest baryon reservoirs and say why each is hard to detect. **(c)** State what closed the census and why that method works where others failed.

**4.** *(Scaling.)* **(a)** Give the scaling of each component's density with $a$ and explain the radiation case. **(b)** Compute $\Omega_\Lambda$ at $z = 1090$ given the present values. **(c)** State what the chart looks like at $a = 10$ and what follows for how it should be read.

**5.** *(The coincidence.)* **(a)** Show that $\rho_m/\rho_\Lambda \propto a^{-3}$. **(b)** Estimate the range in $a$ over which the two are within a factor of ten. **(c)** Explain how the epoch dependence reframes the coincidence problem.

**6.** *(Neutrinos.)* **(a)** State what is certain about $\Omega_\nu$ and why. **(b)** State the bound and where it comes from. **(c)** Comment on the direction of inference between cosmology and particle physics here.

**7.** *(The slogan.)* **(a)** List four things known about the dark components. **(b)** State what is not known. **(c)** Explain the two respects in which "we don't understand 95%" is misleading.

**8.** *(Physical densities.)* **(a)** Explain why the CMB constrains $\Omega_ih^2$ rather than $\Omega_i$. **(b)** Compute $\Omega_b$ for $h = 0.674$ and $h = 0.730$ and state the fractional difference. **(c)** State the general hazard this illustrates.

**9.** *(Snapshots.)* **(a)** State the general principle about quoted proportions. **(b)** Apply it to the coincidence problem. **(c)** Give one example from outside cosmology and state the corrective.

## Worked answers

**1.** **(a)** $\rho_c = 3H_0^2/8\pi G = 3(2.18\times10^{-18})^2/(8\pi \times 6.674\times10^{-11}) = 1.426\times10^{-35}/1.677\times10^{-9} = \mathbf{8.53\times10^{-27}\ kg\ m^{-3}}$. **(b)** Multiply by $c^2$: $8.53\times10^{-27} \times 8.99\times10^{16} = 7.67\times10^{-10}$ J m⁻³, and dividing by $1.602\times10^{-10}$ J/GeV gives $\mathbf{4.79\ GeV\ m^{-3}}$ — about five hydrogen atoms' worth of energy per cubic metre. **(c)** Because a universe with $\Omega_{\rm total} \neq 1$ is entirely consistent: $\Omega_{\rm total} > 1$ is a closed, positively curved universe and $< 1$ an open one, both perfectly good solutions of the Friedmann equations. That the measured components sum to unity within 0.2% is the **flatness result**, obtained from the angular position of the CMB's first acoustic peak, and it is logically independent of the individual densities. Treating it as a definition would discard a measurement.

**2.** **(a)** From the CMB temperature alone: $u_\gamma = a_{\rm rad}T_0^4$ with $T_0 = 2.72548$ K, then divide by $\rho_cc^2$. It is the most direct because **no model, no distance and no assumption enters** — just a temperature and a constant. **(b)** **Primordial deuterium**, via $\mathrm{D/H} \propto \eta^{-1.6}$ and nuclear reaction rates at 200 s; and the **CMB odd-to-even acoustic peak ratio**, via baryon inertia in the photon–baryon fluid at 372,000 yr. They agree to 0.2%. **(c)** By **subtraction**. The CMB's first peak gives $\Omega_{\rm total} = 1.000 \pm 0.002$; the peak heights give $\Omega_mh^2$; so matter is 0.315 and the remaining 0.685 is attributed to dark energy. Supernovae and BAO then confirm the remainder *behaves* as dark energy — accelerating expansion, $w \approx -1$ — which is a real check on its nature but not the origin of its amount. **This differs in kind from $\Omega_\gamma$**: a residual absorbs every error in the terms subtracted from it, so its uncertainty is inherited rather than intrinsic.

**3.** **(a)** $0.07 \times 0.049 = \mathbf{0.0034}$, about **0.3%** of the universe's energy content. Everything that shines is one part in three hundred. **(b)** The **warm–hot intergalactic medium** (~30%), at $10^{5}$–$10^{7}$ K: too hot for the neutral hydrogen that Lyman-α absorption requires, too diffuse and too cool for detectable X-ray emission — invisible to both standard probes. The **photoionised IGM / Lyman-α forest** (~28%): detectable only in absorption against background quasars, so it requires a bright source behind every sightline and yields no map. **(c)** **Fast radio burst dispersion measures.** An FRB's pulse arrives later at lower frequencies by an amount proportional to the integrated free-electron column, so **every free electron along the path contributes regardless of its temperature or density** — precisely the property the emission- and absorption-based methods lack. Macquart et al. (2020) showed that FRBs with measured host redshifts recover the CMB baryon density, closing the census.

**4.** **(a)** $\rho_r \propto a^{-4}$, $\rho_m \propto a^{-3}$, $\rho_\Lambda$ constant. Radiation carries an extra factor because expansion both dilutes the photon number as $a^{-3}$ **and** redshifts each photon's energy as $a^{-1}$. **(b)** At $z = 1090$, matter density is $(1+z)^3 = 1.30\times10^{9}$ times its present value and radiation $(1+z)^4 = 1.42\times10^{12}$ times, while $\rho_\Lambda$ is unchanged. So $\Omega_\Lambda(z) = 0.685/[0.315(1091)^3 + 9.1\times10^{-5}(1091)^4 + 0.685] = \mathbf{1.3\times10^{-9}}$. **(c)** At $a = 10$ the chart is $\Omega_\Lambda = 0.9995$ with matter at $5\times10^{-4}$ and radiation negligible — effectively a single slice. It follows that **the present chart is a snapshot of one moment, not a statement about the universe's composition**, and that its most arresting feature, three comparable slices, is transient.

**5.** **(a)** $\rho_m \propto a^{-3}$ and $\rho_\Lambda$ is constant, so the ratio $\rho_m/\rho_\Lambda \propto a^{-3}$. **(b)** For the ratio to change by a factor of 100 — from 10 to 1/10 — requires $a^3$ to change by 100, i.e. $a$ by $100^{1/3} = 4.6$. So the two are within a factor of ten of each other over **less than a single decade in scale factor**, against the many decades the universe traverses. **(c)** It converts the puzzle from "why does dark energy exist?" to "**why are we observing during the brief window when its share is comparable to matter's?**" — which is a question about our epoch rather than about physics. That framing is what makes anthropic responses relevant at all: structure formation requires matter domination and observers require structure, so observers are found near the handover. As the Timeline chapter noted, that is a legitimate selection argument which explains the timing without predicting $\Omega_\Lambda$'s value.

**6.** **(a)** That $\Omega_\nu > 0$ — **certain**, because neutrino oscillation experiments establish that at least two species have non-zero mass, and any massive relic contributes energy density. The relic abundance is fixed by the decoupling calculation of the Early Universe chapter, so only the masses are unknown. **(b)** $\sum m_\nu < 0.12$ eV, giving $\Omega_\nu < 0.003$, from **CMB lensing combined with structure growth**: massive neutrinos free-stream out of small-scale perturbations and suppress their growth by an amount depending on the mass sum. **(c)** The inference runs from **cosmology to particle physics**, which is the reverse of the usual direction. The cosmological bound is currently tighter than the direct laboratory limits from tritium beta decay, so **the best constraint on a particle property comes from a photograph of the sky** — the same structure as BBN's helium abundance bounding the neutrino species count before LEP measured it.

**7.** **(a)** Their **densities** to a few per cent; that dark matter is **cold, collisionless and non-baryonic**; that dark energy has **$w = -1.03 \pm 0.03$**, consistent with a cosmological constant; and that dark matter **clusters gravitationally** while dark energy does not. One could add that both are required by measurements 13 billion years apart using unrelated physics. **(b)** The **identity** of either: no laboratory detection of a dark matter particle after four decades of searching, and no accepted physical origin for dark energy, the natural vacuum-energy candidate being wrong by tens of orders of magnitude. **(c)** It **understates** the difficulty because even the 5% was a third unlocated until 2020 — if the component whose identity and physics are fully known can go missing for two decades, "the part we understand" deserves discounting. And it **overstates** the difficulty because every measurement here concerns how the universe **gravitates**, and in that respect the accounting is complete and consistent; the identification problem has been handed to particle physics rather than left as a hole in cosmology.

**8.** **(a)** Because the physical density is $\rho_i = \Omega_i\rho_c \propto \Omega_ih^2$, and what the acoustic physics responds to is the **actual density** of baryons and dark matter in the plasma — the inertia the baryons contribute, the depth of the potential wells — not a ratio to a critical density defined through a Hubble constant the CMB does not directly measure. **$\Omega_ih^2$ is measured; $\Omega_i$ is derived** by dividing by an $h$ imported from elsewhere. **(b)** $\Omega_b = 0.02237/h^2$: at $h = 0.674$, $\Omega_b = \mathbf{0.0493}$; at $h = 0.730$, $\Omega_b = \mathbf{0.0420}$. The fractional difference is $(0.0493-0.0420)/0.0493 = \mathbf{15\%}$, from an 8% disagreement in $H_0$, because the dependence is **quadratic**. **(c)** That **comparisons must be made in the variable the data constrain.** Comparing an $\Omega_b$ from one analysis with an $\Omega_bh^2$ from another, or two $\Omega_b$ values assuming different $h$, manufactures agreement or disagreement that is purely an artefact of the conversion. This is a general hazard wherever a field reports derived quantities alongside measured ones, and it is why careful papers state explicitly which they are quoting.

**9.** **(a)** **Before quoting a proportion, establish whether it is a property of the system or of the moment** — and if the components evolve at different rates, plot the fraction against time before drawing any conclusion from its present value. **(b)** The pie chart is not a composition but a rate-of-change problem caught mid-flight: three densities declining at different speeds, observed during the brief interval when they are comparable. Read as composition, the near-equality of matter and dark energy looks like a mystery demanding explanation; read as a snapshot, it is an observation about **when we are looking**, which is a question with a possible selection answer rather than a physical one. **(c)** Outside cosmology: **the share of a country's electricity from a given source.** Quoting "solar is 6% of generation" as a property of the grid is the same error — the figure is a point on a steep curve, and the informative quantity is the growth rate, not the level. The corrective is identical: **plot the fraction against time.** The same applies to the age composition of a population, the market share of a growing product, and any portfolio whose holdings compound at different rates.$duBudget_master$,
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
