-- Astronomy & Space · The Extragalactic Universe — The Galaxy Zoo —
-- "Dwarfs and the Local Group". Curated master for
-- astronomy-and-space/extragalactic/galaxy-zoo/dwarfs-and-the-local-group
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node was added to seed.sql in the galaxy-types batch; no taxonomy change here.
--
-- The third Extragalactic chapter, and the one that pays off the Schechter
-- function's faint end. Why the typical galaxy is one nobody pictures; the
-- Local Group as the only volume where a galaxy census can be pushed to
-- the bottom and where galaxies are resolvable star by star; its anatomy -
-- two spirals, a distant third, and a long tail - and the timing argument
-- that weighs the whole thing from one approach velocity, worked in full;
-- the dwarf families and the morphology-density relation reappearing at a
-- thousandth the scale; ultra-faint dwarfs with mass-to-light ratios in
-- the thousands and the resulting question of what separates a galaxy from
-- a star cluster; why shallow potential wells make dwarfs the extreme
-- dark-matter systems and the cleanest laboratories; the ultra-faints as
-- fossils quenched by reionization, and Reticulum II recording a single
-- neutron-star merger because a small galaxy cannot average events away;
-- the four small-scale challenges to cold dark matter and their current
-- status; and the fate of the Local Group, where a textbook certainty
-- became a live question when the transverse velocity was measured well
-- enough to matter. ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/galaxy-zoo/dwarfs-and-the-local-group',
    'research',
    'advanced',
    'read',
    $egDwarfs_master$> Dwarf galaxies are the overwhelming majority of galaxies and almost none of the light. They are also the extreme systems: the most dark-matter dominated objects known, the oldest surviving stellar populations, and the place where the standard cosmological model is under the most pressure. The Local Group — our own galaxy, Andromeda, and roughly a hundred smaller companions — is the only volume in which they can be studied star by star, which makes it less a neighbourhood than an instrument.

The previous chapters ended on the Schechter luminosity function, whose faint-end slope near $-1.2$ means the number of galaxies keeps climbing toward low luminosities with no observed turnover. The consequence was stated but not explored: **the typical galaxy is a dwarf**, while the galaxy containing a typical star is something like the Milky Way. Every image in every textbook shows the second kind. This chapter is about the first.

There is a reason for the imbalance beyond aesthetics. Dwarf galaxies are hard. A system with the luminosity of a few hundred Suns spread over a few tens of parsecs has a surface brightness far below the night sky's, so it cannot be seen as an object at all — it must be found as a **statistical overdensity of individually resolved stars** against the foreground of our own galaxy. That technique works only nearby. Beyond a few megaparsecs the stars merge into an unresolved smudge below the sky, and the census fails.

So the Local Group is not merely a convenient sample. It is, for the faintest systems, the *only* sample, and much of what is claimed about the galaxy population as a whole rests on extrapolating from this one volume — a dependence worth keeping in view.

## What is in the Local Group

The membership list has a characteristic shape: two dominant systems, one significant third, and then a long tail of much smaller things.

**The Milky Way** and **M31 (Andromeda)** are comparable spirals, each with a total mass of order $10^{12}\,M_\odot$, and together they hold the great majority of the group's mass and light. M31 lies at about **785 kpc** and is approaching us at roughly **110 km/s** along the line of sight.

**M33 (Triangulum)** is the third-largest, a smaller spiral at roughly 800–840 kpc, probably a satellite of M31 on a long orbit.

Then the drop. The **Large** and **Small Magellanic Clouds** are the largest dwarfs, the LMC massive enough to be a substantial perturber of the Milky Way in its own right. Below them run the classical dwarf spheroidals — Sagittarius, Fornax, Sculptor, Draco, Ursa Minor, Leo I and II, Carina, Sextans — the eleven or so bright satellites known before 2000. Below *those*, discovered in a wave that began with the Sloan Digital Sky Survey and continues through the Dark Energy Survey, Pan-STARRS, DELVE and others, run the **ultra-faint dwarfs**, dozens of them, some with the total luminosity of a few hundred Suns.

The current count of Milky Way satellites, confirmed and candidate, is around **sixty to seventy**, and the number is still rising with each survey — which is the important point about it. **This is not a completed census.** Selection functions modelled from the surveys imply the true total exceeds a hundred, with the undiscovered ones being the faintest, the most distant, and those hiding behind the Galactic plane. Any statement of the form "the Milky Way has $N$ satellites" is a statement about survey depth as much as about the Milky Way, and comparisons with theoretical predictions are meaningless unless the selection function is applied to the theory rather than the observation corrected to some imagined completeness.

The group as a whole is bounded by its **zero-velocity surface** at roughly **1.06 Mpc** — the radius at which the group's gravity exactly cancels cosmic expansion, so that galaxies inside are falling in and galaxies outside are receding. That surface is the meaningful edge of a bound system in an expanding universe, and it is also, as the next section shows, a route to weighing the whole assembly.

## Weighing the group from one velocity: the timing argument

The Milky Way and M31 are approaching each other. In a universe that is expanding everywhere, two galaxies approaching means their mutual gravity has already reversed an initial recession — and *when* that reversal happened depends on how much mass is doing the pulling. This is the **timing argument**, due to Kahn and Woltjer in 1959, and it is one of the most economical measurements in astronomy: a mass for the entire Local Group from a separation, a velocity, and the age of the universe.

The setup idealises the pair as an isolated two-body system that began at zero separation at the Big Bang, expanded apart, turned around, and is now falling back. The radial orbit has a standard parametric solution:

$$r = A(1 - \cos\eta), \qquad t = B(\eta - \sin\eta), \qquad A^3 = GMB^2$$

with $\eta$ the development angle. Three observables — $r = 785$ kpc, $\dot{r} = -110$ km/s, $t = 13.8$ Gyr — determine $\eta$, and then $M$ follows.

Dividing to eliminate the scale factors gives a single equation in $\eta$:

$$\frac{\dot{r}\,t}{r} = \frac{\sin\eta\,(\eta - \sin\eta)}{(1 - \cos\eta)^2}$$

The left side evaluates to about $-1.98$, which is solved by $\eta \approx 4.20$ radians — past $\pi$, confirming the system is on the infalling half of its first orbit. Back-substituting yields

$$M \approx 4.4 \times 10^{12}\,M_\odot$$

for the two galaxies combined.

Two features of that result matter more than the number.

**It is enormously larger than the visible mass.** The stars of both galaxies sum to under $2 \times 10^{11}\,M_\odot$. The timing argument was, historically, one of the earliest independent indications that galaxies are embedded in far more mass than they display — arrived at on the largest scale then available and by a completely different route from the rotation curves of the Milky Way branch. Independent methods converging on the same missing mass is what turned dark matter from an anomaly into a component.

**And it is an upper-ish estimate whose idealisations are known.** The two-body assumption ignores the LMC, M33, and the mass distributed around the pair; the zero-separation initial condition ignores the finite size of the perturbation; and the measured quantity is a *radial* velocity, so any transverse motion is invisible to it and would imply a larger orbit for the same infall. Modern estimates combining the timing argument with satellite kinematics, the zero-velocity surface, and cosmological simulations tend to land lower, in the range $2$–$3 \times 10^{12}\,M_\odot$. The method's value is not its precision but that it works at all — a dynamical mass for a system whose orbital period exceeds the age of the universe, obtained without waiting for the orbit.

```checkpoint
q: The timing argument infers the Local Group's mass from the fact that the Milky Way and M31 are approaching. What makes the inference possible?
a: The approach velocity gives the mass directly through the virial theorem, since the system is relaxed
x: The virial theorem applies to a system that has undergone many orbits and settled. The Milky Way and M31 have not completed even one, which is precisely what makes the timing argument necessary and available.
a*: In an expanding universe the two must once have been receding, so gravity has already reversed their motion — and requiring that the reversal fit within the age of the universe fixes how much mass was needed to do it
a: The Doppler shift measures the total mass because more massive galaxies produce larger redshifts
x: Redshift measures line-of-sight velocity, not mass, and the cosmological component of that velocity depends on distance rather than on the galaxies' masses.
a: The galaxies must have formed at their current separation, so their approach speed measures the gravitational acceleration since formation
x: The parametric solution assumes the opposite — zero separation at early times — and the inference uses the full orbital history rather than an acceleration measured from a static start.
hint: What would the two galaxies be doing right now if the Local Group contained nothing but its stars?
why: Cosmic expansion drives everything apart; only gravity can reverse that, and reversing it within a finite time takes a definite amount of mass. Writing the pair as a radial two-body orbit that began at zero separation gives a parametric solution in which the observed separation, approach velocity, and the age of the universe over-determine the development angle, so the mass drops out. The answer, around 4 × 10¹² M☉, exceeds the two galaxies' combined stellar mass by more than an order of magnitude — an early and independent detection of dark matter on a scale far larger than any rotation curve could probe.
---
q: The timing argument uses the line-of-sight approach velocity of M31. How does an unmeasured transverse velocity bias the inferred mass?
a: It does not affect the result, since only the radial component contributes to the gravitational infall
x: The transverse component carries angular momentum, which keeps the pair from falling straight in and so changes the entire orbit — including how much mass is needed to have turned it around by now.
a*: Transverse motion means the true orbit is wider and less radial than assumed, so more mass is required to have produced the observed infall by the present epoch — the radial-only calculation underestimates the mass
a: It makes the inferred mass too large, because part of the observed velocity would not be due to gravity
x: The observed radial velocity is used as-is; an added transverse component increases the total speed rather than reallocating the radial part, so it cannot make the calculation an overestimate.
a: It only matters if the transverse velocity exceeds the speed of light divided by the redshift
x: This combines unrelated quantities; the relevant comparison is between the transverse velocity and the radial one, both of order 100 km/s.
hint: Angular momentum resists radial infall. If the pair has some, what must gravity have overcome?
why: A purely radial orbit is the most efficient possible infall — every bit of the initial recession is fought directly by gravity. Any tangential velocity adds angular momentum, which supports the orbit against collapse, so reproducing the same present-day separation and approach speed requires a stronger gravitational pull and hence more mass. This is why measuring M31's proper motion mattered so much: it is a tens-of-km/s transverse motion at 785 kpc, corresponding to a few tens of microarcseconds per year, and it changes both the mass estimate and — as the final section shows — the predicted fate of the two galaxies.
```

{{image: Local Group | The Local Group: two large spirals, the Milky Way and M31, separated by about 785 kpc, with M33 as a distant third and roughly a hundred smaller systems distributed around them. Nearly all the members are dwarfs, nearly all the light is in the two big spirals, and the bound region ends at a zero-velocity surface near 1.06 Mpc where the group's gravity exactly balances cosmic expansion.}}

## The kinds of dwarf

Dwarfs are not one thing, and their families map remarkably well onto the families of large galaxies — with a twist.

**Dwarf irregulars (dIrr)** are gas-rich, actively forming stars, blue, and structurally messy — no ordered spiral pattern, since they are too small for the dynamics that organise arms. The Small Magellanic Cloud and NGC 6822 are examples. They are found preferentially in the *field*, away from the two big spirals.

**Dwarf spheroidals (dSph)** are gas-poor, quiescent, red, smooth, and diffuse. Draco, Ursa Minor, Sculptor and their kin are examples, and they are found preferentially *close to* the Milky Way or M31.

**Dwarf ellipticals (dE)** are the higher-surface-brightness, more compact relatives found abundantly in clusters — the dominant population by number in Virgo, for instance.

**Ultra-faint dwarfs (UFDs)** are the extreme low-luminosity extension of the spheroidals, taken up in the next section.

**Transition dwarfs (dIrr/dSph)** hold some gas but form few stars, and sit at intermediate distances.

The pattern in that list is the **morphology–density relation** — gas-poor, quiescent systems near the big galaxies, gas-rich, star-forming systems in the field — which is the same relation the Galaxy Types chapter established for clusters, reappearing here at a thousandth of the mass scale and a hundredth of the size. The mechanisms are the same ones, operating more easily because the potential wells are shallower: **ram-pressure stripping** as a dwarf ploughs through the hot halo of its host, **tidal stripping and heating** from the host's gravity, and **strangulation** as the supply of fresh gas is cut off.

The strongest evidence that this is causation rather than coincidence is watching it happen. The **Sagittarius dwarf spheroidal**, discovered in 1994 on the far side of the Galactic centre, is being torn apart by the Milky Way: its stars are strung around the sky in a stream wrapping the entire Galaxy. The **Magellanic Stream** is a trail of gas pulled out of the Clouds, hundreds of thousands of light-years long, containing more gas than the Clouds have retained. These are not inferences from statistics; they are galaxies caught mid-disruption, and they establish that the observed correlation of dwarf type with distance from a big galaxy is produced by the big galaxy.

There is one important asymmetry from the large-galaxy case. Among giants, the transformation of a spiral into a lenticular removes gas but leaves a massive stellar system intact. Among dwarfs, the same environment can **destroy the galaxy outright**, unbinding its stars into a stream. The Milky Way's stellar halo is substantially built from such debris. So the dwarf population we observe is a *survivor* population, systematically biased toward those on wide orbits, those that arrived recently, and those dense enough to resist — another selection effect layered on the observational one.

```checkpoint
q: Gas-rich dwarf irregulars are found preferentially in the field, while gas-poor dwarf spheroidals cluster near the Milky Way and M31. The strongest evidence that proximity *causes* the difference rather than merely correlating with it is
a: that the correlation is statistically significant across the full Local Group sample
x: Statistical significance establishes that the correlation is real, not that it is causal. A shared cause — for instance, different formation environments — would produce the same significance.
a*: direct observation of the process in progress — the Sagittarius dwarf strung into a stream around the Galaxy, and the Magellanic Stream holding more gas than the Clouds have kept
a: that dwarf spheroidals contain more dark matter than dwarf irregulars
x: Dark-matter fractions differ partly because stripping removes baryons, so this is closer to a consequence of the mechanism than to evidence for it, and it does not by itself distinguish cause from correlation.
a: that simulations of ram-pressure stripping reproduce the observed distribution
x: Simulations demonstrate that a proposed mechanism is sufficient, which is valuable, but a simulation reproducing the data is not an observation of the mechanism operating.
hint: What beats any statistical argument about cause?
why: Correlations admit multiple causal readings — environment acting on the dwarfs, or the same conditions producing both the environment and the dwarf type. Catching the transformation in progress removes the ambiguity: Sagittarius is visibly being dismembered by the Milky Way's tide, and the Magellanic Stream contains gas demonstrably removed from the Clouds and now trailing them. The mechanism is not inferred from the endpoint distribution but watched. This is the same standard applied in the Galaxy Types chapter to cluster galaxies observed mid-strip with trailing gas tails.
---
q: Environmental processing destroys some dwarfs entirely, unbinding their stars into streams. The consequence for interpreting the observed dwarf population is that
a: the observed population overestimates how many dwarfs formed, since destroyed dwarfs are counted twice in streams
x: Destroyed dwarfs are not counted in the satellite census at all — their stars are dispersed into the halo. The bias runs toward under-counting, not double-counting.
a*: the survivors are a biased sample — favouring wide orbits, late arrival, and high density — so the present satellite population understates both the number and the diversity of dwarfs that once existed
a: the population is unbiased, because destruction is equally likely for all dwarfs
x: Destruction depends strongly on orbital pericentre, infall time, and internal density, all of which vary widely between dwarfs, so it cannot act uniformly.
a: destroyed dwarfs are irrelevant, since their stars are no longer part of any galaxy
x: Those stars form much of the stellar halo and carry chemical and kinematic records of their parent systems, so they are both relevant and recoverable — which is the basis of galactic archaeology.
hint: Which dwarfs survive to be counted, and which do not?
why: A satellite is destroyed if it passes deep enough into the host's potential, early enough, with low enough internal density. So the surviving census is selected on exactly the opposite of those properties, and comparing it with a theoretical prediction of all dwarfs ever formed is comparing incompatible quantities. The destroyed population is not lost, though: its stars persist in the stellar halo with distinctive chemistry and coherent orbital energies, which is how the Milky Way's accretion history is being reconstructed. The methodological point recurs throughout this chapter — every statement about dwarf counts is a statement about a selection function.
```

## The ultra-faints, and what counts as a galaxy

The systems found since 2005 are qualitatively different from the classical dwarfs, and they force a definitional question that had never needed asking.

**Segue 1** is the standard example. Its total luminosity is **less than that of a single bright red giant** — a few hundred solar luminosities, from an entire galaxy. Its stars have a velocity dispersion of about **3.7 km/s**, which sounds negligible until you notice how little mass is visible: the dispersion implies a mass within the half-light radius of order $5 \times 10^5\,M_\odot$, against a stellar mass of perhaps a thousand. The resulting mass-to-light ratio is roughly **3,400 in solar units** — meaning that for every unit of light, there are 3,400 units of mass, essentially all of it dark. Segue 1 is routinely described as the darkest known galaxy, and the description is not rhetorical.

Now the definitional problem. Segue 1 has a few hundred stars, a half-light radius of a few tens of parsecs, and no visible structure. **Globular clusters** also have modest sizes and are found in the same halo. What makes one a galaxy and the other not?

The answer that has settled the question is that the distinction must be **dynamical and chemical, not morphological**:

- **A galaxy sits in its own dark-matter halo; a star cluster does not.** Measured velocity dispersions in globular clusters are consistent with their stellar mass alone; in ultra-faint dwarfs they are several times too large, requiring dark matter. Segue 1's dispersion is the evidence for its galaxy status.
- **A galaxy retains a spread in metallicity; a star cluster does not.** A cluster forms in a single burst from well-mixed gas, so its stars share a composition. A galaxy has a potential well deep enough to hold onto the products of its own supernovae and to keep forming stars from progressively enriched gas, so its stars show a range of $[\mathrm{Fe/H}]$ spanning a factor of ten or more. Ultra-faint dwarfs show that spread; globular clusters, with known exceptions, do not.

Both criteria say the same thing in the end: **a galaxy is a system whose own gravity governed its chemical history.** That is a better definition than any based on size or luminosity, and it survives at the very bottom of the mass function where the visual criteria have long since failed.

Notice how the definition changed. "Galaxy" was originally an observational category — a nebulous object resolvable into stars, external to the Milky Way. The ultra-faints broke that, because they are neither nebulous nor obviously external nor visibly distinct from clusters. The category was rebuilt on physics, and in the process became sharper than the thing it replaced. **A definition forced to the boundary of its domain either fails or improves; it rarely survives unchanged.**

```checkpoint
q: An ultra-faint dwarf and a globular cluster can have similar luminosities and half-light radii. What observation distinguishes them?
a: The dwarf is more distant, since ultra-faints are found in the outer halo and globular clusters nearby
x: Both populations span a wide range of Galactocentric distances and overlap substantially, so distance separates them not at all.
a*: The dwarf's stellar velocity dispersion greatly exceeds what its stars alone could produce, and its stars show a spread in metallicity — both signatures of a system with its own dark-matter halo and a self-governed chemical history
a: The dwarf is irregular in shape while a globular cluster is spherical
x: Ultra-faint dwarfs are diffuse but often roughly round, and their morphologies overlap with clusters. Shape is exactly the criterion that fails at this scale.
a: The dwarf contains gas and ongoing star formation, unlike a globular cluster
x: Ultra-faint dwarfs are gas-free and have not formed stars for over ten billion years. Both populations are quiescent, so this cannot distinguish them.
hint: Ask what the system's own gravity was strong enough to do.
why: At a few hundred solar luminosities the visual distinctions vanish, so the definition has to be rebuilt on dynamics and chemistry. A globular cluster's velocity dispersion matches its stellar mass; an ultra-faint dwarf's is several times larger, demanding dark matter — Segue 1 implies roughly 3,400 solar masses per solar luminosity. And a cluster forms in one burst from well-mixed gas, so its stars share a composition, while a galaxy holds onto its own supernova products and builds a metallicity spread. Both criteria amount to one statement: a galaxy is a system whose own gravity governed its chemical history.
---
q: Why do dwarf galaxies have far higher mass-to-light ratios than giant galaxies, rather than similar ones?
a: Dwarfs formed earlier, when the universe contained a higher proportion of dark matter
x: The cosmic ratio of dark to baryonic matter is essentially fixed and does not change with epoch, so formation time cannot supply extra dark matter.
a*: Their potential wells are shallow, so supernova feedback expels a large fraction of their gas before it can form stars — the dark matter, which feels no pressure, stays put while the baryons leave
a: Dwarfs contain a different kind of dark matter that is intrinsically more massive per particle
x: There is no evidence for distinct dark-matter species sorted by galaxy mass, and particle mass would not translate into a higher mass-to-light ratio in any case.
a: Their stars are systematically fainter for the same mass, raising the ratio
x: Dwarf stellar populations are old and metal-poor, and metal-poor stars are if anything slightly brighter at fixed mass, so this works marginally the wrong way.
hint: Both components start in cosmic proportion. Which one can be pushed out, and by what?
why: Every halo begins with roughly the cosmic mix of dark matter and baryons. Only the baryons can be heated, pressurised, and driven out — by supernovae, stellar winds, and photoionisation — and how much escapes depends on the escape velocity, which scales with the potential's depth. In a giant galaxy most gas is retained and converted into stars; in a dwarf with an escape velocity of tens of km/s, supernova-driven winds remove the great majority before it can form stars. The dark matter, being collisionless and pressureless, is untouched. The result is a systematic trend of rising mass-to-light ratio toward lower mass, reaching into the thousands for the ultra-faints — which is also why the same feedback is invoked to solve several of the small-scale problems discussed below.
```

## Fossils: what dwarfs remember

Ultra-faint dwarfs have a property no other galaxies have: they stopped, very early, and nothing has happened to them since.

Detailed star-formation histories, reconstructed from colour–magnitude diagrams deep enough to reach below the ancient main-sequence turnoff, show that these systems formed **about 80 per cent of their stars by $z \approx 6$** — roughly 12.8 billion years ago — and essentially **all of them by $z \approx 3$**. They then quit, and have been coasting ever since.

The explanation is **reionization**. When the first stars and galaxies ionised the intergalactic medium, they heated it to around $10^4$ K. Gas at that temperature has a sound speed of order 10 km/s, comparable to or greater than the escape velocity of the smallest dark-matter halos. The consequence is twofold and decisive: such halos cannot hold the gas they have, and cannot accrete more from the surrounding medium. **Star formation in the smallest systems was terminated by an event external to them, at a definite cosmic epoch.**

This makes ultra-faint dwarfs genuine fossils — samples of the pre-reionization universe, preserved at low redshift where their individual stars can be observed at high spectral resolution. Nothing else offers that. Studying the same epoch at high redshift means studying unresolved galaxies at the limit of the largest telescopes; studying it in a Local Group ultra-faint means measuring individual abundances in stars a hundred kiloparsecs away.

**Reticulum II** shows what such a fossil can record. Of the first stars observed spectroscopically in it, seven of nine turned out to be strongly enhanced in **r-process elements** — europium, barium, and their heavy neighbours — at levels two to three orders of magnitude above any other ultra-faint dwarf. The abundance pattern points to a **single, rare, prolific event**, most plausibly a neutron-star merger, that enriched the galaxy's entire remaining gas supply before its last stars formed.

The reason this could be seen in a tiny galaxy and not in ours is worth making explicit, because it is a general principle rather than a lucky accident. The Milky Way has formed of order $10^{11}$ stars over ten billion years and has hosted a great many r-process events; its abundance pattern is an *average*, and averages destroy information about the distribution of contributing events. A galaxy that formed a few thousand stars in a few hundred million years may have hosted **exactly one** such event — so its chemistry records that single event's yield directly. **Small samples preserve individual events that large samples average away**, which inverts the usual intuition that more data is better: for measuring the yield of one explosion, the galaxy with almost no stars is the superior instrument.

This is how a class of object with a few hundred stars became central to nuclear astrophysics: the Reticulum II result was among the strongest pre-gravitational-wave evidence that neutron-star mergers make the heaviest elements, later confirmed directly by the kilonova of GW170817.

```checkpoint
q: Ultra-faint dwarfs formed ~80% of their stars by z ≈ 6 and stopped entirely by z ≈ 3. The standard explanation is that
a: they exhausted their gas supply by converting all of it into stars
x: They converted only a tiny fraction of their gas into stars — their stellar masses are minute compared with the baryons their halos should have held. The gas left rather than being used up.
a*: reionization heated the intergalactic medium to ~10⁴ K, giving it a sound speed comparable to their escape velocities, so the smallest halos could neither retain their gas nor accrete more
a: their central black holes switched on and expelled the gas
x: Galaxies of this mass are not expected to host, and show no evidence of, black holes capable of driving such winds; feedback in dwarfs is supernova-driven and, at this epoch, externally imposed.
a: they were stripped of gas by the Milky Way when they fell in
x: Stripping is real for satellites, but the quenching epoch is common across ultra-faints regardless of when they fell in, and some quenched before they could have arrived — pointing to a universal external cause rather than a local one.
hint: The shutdown happens at a common cosmic time across systems with different orbits and histories. What acts on all of them at once?
why: A shutdown synchronised across many systems with unrelated orbital histories demands a cause external to all of them, operating at a definite epoch. Reionization is that cause: photoheating the intergalactic medium to ~10⁴ K raises its sound speed to ~10 km/s, comparable to the escape velocity of the smallest halos, so gas is both driven out and prevented from being reaccreted. The result is a population of fossils — systems whose entire stellar content dates from before the universe was a billion years old, but which can be studied star by star at zero redshift, which no high-redshift observation can match.
---
q: Reticulum II's r-process enrichment was traced to a single event. Why is a galaxy with a few thousand stars a *better* instrument for that measurement than the Milky Way?
a: Because ultra-faint dwarfs are closer, so their stars can be observed at higher signal-to-noise
x: Many ultra-faints are farther than most Milky Way stars studied spectroscopically, and in any case proximity would not resolve the interpretive problem of separating one event's yield from many.
a*: Because a large galaxy's abundances average over many enrichment events, destroying information about any individual one, while a galaxy that hosted exactly one event records that event's yield directly
a: Because r-process events are more common in dwarf galaxies than in large spirals
x: They are rarer in absolute terms, which is exactly why a dwarf may host only one — the rarity is what makes the measurement possible, not a higher rate.
a: Because dwarf galaxies have simpler chemistry, containing fewer elements overall
x: They contain the same elements, in lower absolute quantities. What is simpler is the enrichment *history*, not the periodic table.
hint: What does averaging do to the information about the distribution being averaged?
why: The Milky Way's r-process abundances are the sum of a great many events, and a sum cannot be inverted into its terms — the per-event yield, and even whether the events are rare-and-prolific or common-and-modest, is largely washed out. A galaxy that formed a few thousand stars over a few hundred million years may have hosted exactly one such event, so its stars carry that event's yield essentially undiluted. Seven of nine stars observed in Reticulum II showed r-process enhancement two to three orders of magnitude above other ultra-faints, pointing to a single prolific source — the signature of a neutron-star merger, later confirmed directly by GW170817's kilonova. The general lesson runs against intuition: for characterising individual events, the smallest system is the better instrument.
```

{{image: Large Magellanic Cloud | The Large Magellanic Cloud, the largest of the Milky Way's satellites and massive enough to perturb its host measurably — including, as recent work shows, the future orbit of the Milky Way relative to Andromeda. Its gas is being drawn out into the Magellanic Stream, a trail wrapping much of the sky that now contains more gas than the Clouds have retained: environmental processing of a dwarf caught in the act.}}

## Where the standard model is under pressure

Cold dark matter succeeds impressively on large scales, as the last chapters of this branch will show. On the scale of dwarf galaxies it has been challenged repeatedly, and the four canonical challenges are worth stating precisely, because their current status is more interesting than either the "crisis" or the "solved" framing suggests.

**1. The missing satellites problem.** Dark-matter-only simulations of a Milky Way-sized halo produce hundreds to thousands of bound subhalos; before 2005, about eleven satellites were known. The discrepancy was three orders of magnitude at the faint end.

*Status: substantially resolved, from both directions.* Observationally, the surveys found dozens more, and modelled selection functions imply many still undetected — so the observed count was never the true count. Theoretically, the smallest halos are expected to contain **no stars at all**, having been emptied by reionization exactly as the fossil evidence indicates, so a subhalo count was never the right comparison to a satellite count. The residual question is quantitative: whether the *shape* of the abundance relation between halo mass and stellar mass matches, which is an active area rather than a crisis.

**2. Too big to fail.** The most massive subhalos in simulations are dense enough that they should host visible satellites, yet the brightest observed dwarfs appear to sit in less dense halos than those. The name captures the difficulty: these subhalos are too massive to have been left starless by feedback, so they cannot simply be hidden.

*Status: substantially eased.* Adding baryonic physics — supernova-driven outflows that redistribute mass and lower central densities, and tidal stripping enhanced by the host's stellar disk — reduces the discrepancy, as does revising the Milky Way's own halo mass downward. It has not vanished entirely.

**3. Core–cusp.** Simulations without baryons predict dark-matter density rising steeply toward the centre (a **cusp**, $\rho \propto r^{-1}$); many observed dwarfs appear to have flat central densities (a **core**).

*Status: contested and interesting.* Repeated bursts of supernova-driven outflow can transfer energy to the dark matter and flatten a cusp into a core, and simulations reproduce the effect — but only where star formation is vigorous enough, which fails for the faintest systems. Alternatively, cores could indicate dark matter that is self-interacting or warm rather than cold. Measurement is genuinely hard: inferring an inner density profile from line-of-sight velocities requires assumptions about orbital anisotropy that are degenerate with the profile itself.

**4. Planes of satellites.** The Milky Way's satellites appear to lie preferentially in a thin plane roughly perpendicular to the disk, and M31's satellites show a similar structure. Random accretion should not produce that.

*Status: disputed on both sides.* Later analyses find comparable configurations occurring in simulations more often than first claimed, partly because look-elsewhere effects and the small number of satellites make a chance alignment easier than intuition suggests, and partly because satellites accreted together in groups arrive correlated. Whether the observed planes are anomalous remains argued.

The pattern across all four is instructive. **Each began as a sharp conflict between a dark-matter-only simulation and an incomplete observational census, and each softened as the baryonic physics was added to the theory and the selection function was applied to the data.** That is not the same as the problems having been imaginary — the corrections were real physics and real survey modelling, and they were motivated by the discrepancies. But it is a caution about the general form: **a mismatch between a simplified theory and a biased dataset is a statement about the simplifications and the biases at least as much as about nature.** The productive move in every case was to make the comparison fair before drawing a metaphysical conclusion.

```checkpoint
q: The missing satellites problem — simulations predicting hundreds of subhalos where about eleven satellites were known — has substantially dissolved. It was resolved
a: by discovering that the simulations contained a numerical error that inflated subhalo counts
x: The subhalo counts were essentially correct as counts of dark-matter structures. The error was in treating them as predictions of visible satellites.
a*: from both ends — dozens more satellites were found and selection functions showed many remain undetected, while the smallest subhalos are expected to hold no stars at all, having been emptied by reionization
a: by abandoning cold dark matter in favour of warm dark matter, which suppresses small-scale structure
x: Warm dark matter would suppress the small halos and remains a live alternative, but it is not the accepted resolution — the discrepancy eased within cold dark matter once the comparison was made fairly.
a: by recognising that the eleven classical satellites were mostly misidentified star clusters
x: The classical dwarf spheroidals are unambiguously galaxies by both the dynamical and chemical criteria, and their status was never in doubt.
hint: Two different objects were being compared. Was either of them measured correctly?
why: A count of simulated subhalos and a count of known satellites are not comparable quantities. The observed count was incomplete — surveys have since roughly quintupled it and selection modelling implies the true total exceeds a hundred — and the predicted count was of dark-matter structures, most of which should contain no stars, since reionization removed the gas from the smallest halos before they could form any. Fixing both ends collapsed most of the discrepancy. What remains is the quantitative question of how stellar mass maps onto halo mass at the faint end, which is a research programme rather than a crisis.
---
q: All four small-scale challenges to cold dark matter softened once baryonic physics was added to simulations and selection functions were applied to the data. The methodological lesson is that
a: cold dark matter is unfalsifiable, since any discrepancy can be absorbed by adding baryonic physics
x: The added physics is independently constrained — feedback strength, reionization history and tidal stripping are all measurable — so it is not a free parameter. The model remains falsifiable, and several of the challenges are not yet fully resolved.
a*: a mismatch between a deliberately simplified theory and an incomplete dataset is evidence about the simplifications and the incompleteness before it is evidence about nature, so the comparison must be made fair first
a: small-scale observations are unreliable and should be excluded from tests of cosmology
x: These observations drove real advances in both survey modelling and feedback physics. Discarding the most stringent tests of a model is the opposite of the appropriate response.
a: the challenges were never real, having been manufactured by advocates of alternative dark-matter models
x: They were raised and pursued largely by cold dark matter's own practitioners, and they motivated the improvements that resolved them. Treating them as bad faith misreads the history and the mechanism of progress.
hint: What two things were being compared, and was either of them the thing it was taken to be?
why: A dark-matter-only simulation deliberately omits gas, stars, supernovae and radiation; an observed satellite census deliberately omits everything below the survey limit. Comparing them directly tests a proposition neither is about. In each of the four cases, restoring the omitted physics to the theory and the omitted selection to the data moved the two toward each other — sometimes fully, as with missing satellites, sometimes partly, as with too-big-to-fail and core-cusp. The remaining discrepancies are the interesting ones precisely because they survive a fair comparison, and the core-cusp problem is the strongest surviving candidate for a genuine pointer beyond cold, collisionless dark matter.
```

## The fate of the Local Group

For twenty years, the collision of the Milky Way and Andromeda in about four and a half billion years was a fixed point of popular astronomy, complete with rendered skies. It is now a genuinely open question, and how it became open is the most instructive thing about it.

The prediction depends on M31's **transverse** velocity — its motion across the sky. The radial component has been measured since 1912 and is large and unambiguous. The transverse component, at 785 kpc, corresponds to an angular motion of a few tens of microarcseconds per year: a galaxy shifting by about the width of a human hair seen from several kilometres away, per year. Measuring it at all required Hubble Space Telescope astrometry over years and then Gaia's parallax-grade astrometry over the full sky, and the *smallness* of the number is the whole story. **If the transverse velocity is essentially zero, the orbit is nearly radial and the galaxies hit; if it is a few tens of km/s, they may swing past and take many additional billions of years to merge, if they merge at all.** The distinction between certainty and coin-flip lives entirely in a quantity comparable to the measurement uncertainty.

The recent history is a good demonstration of what that means in practice. A 2025 analysis in *Nature Astronomy* modelling the four largest Local Group members — the Milky Way, M31, M33 and the LMC — found only about a **2 per cent** chance of a merger within the next five billion years and a little over **50 per cent** within ten billion. The two smaller galaxies matter because they pull on their hosts: M33's influence tends to bring the pair together, while the **LMC's orbit runs roughly perpendicular** to the Milky Way–M31 line and pulls the Milky Way sideways, tending to prevent a head-on encounter. A 2026 reanalysis using further-refined Gaia proper motions with corrections for systematic astrometric offsets pushed the merger probability back up to about **90 per cent**, with a median merger time of roughly **6.5 billion years**.

Three things are worth extracting.

**A textbook certainty was never as certain as presented.** The original prediction was a reasonable inference from the data then available, but its stated confidence reflected a two-body idealisation and a transverse velocity consistent with zero — not a measurement establishing that it *was* zero. A limit consistent with zero is not the same as zero, and the difference is exactly what the later analyses exploited.

**Smaller bodies dominate the uncertainty.** The LMC is perhaps a tenth of the Milky Way's mass and shifts the outcome qualitatively, because what matters is not the mass ratio but the accumulated transverse impulse relative to a small transverse velocity. Systems poised near a threshold are governed by their smallest terms.

**The answer will keep moving, and that is the system working.** Gaia's astrometry improves with mission duration; systematic offsets are being characterised; halo mass estimates are being revised. Each refinement moves a probability that sits, uncomfortably and honestly, in the middle of its range. **The appropriate stance toward a prediction of this kind is to hold the mechanism firmly and the number loosely** — the dynamics is not in doubt, only a velocity that we are still learning to measure.

## Pulling the thread

- Dwarfs dominate the galaxy population by number and contribute almost none of the light. Because their surface brightness is below the sky's, they must be found as **overdensities of resolved stars**, which works only nearby — so the **Local Group is the only volume with anything approaching a complete census**, and the whole faint end rests on extrapolation from it.
- The group holds two large spirals (**M31 at 785 kpc, approaching at ~110 km/s**), M33, and roughly a hundred smaller systems, bounded by a **zero-velocity surface at ~1.06 Mpc**. Milky Way satellites number **~60–70 and rising**; the true total exceeds a hundred, so every count is a statement about survey depth.
- The **timing argument** weighs the whole group from a separation, an approach velocity, and the age of the universe: $\eta \approx 4.2$ gives $M \approx 4 \times 10^{12}\,M_\odot$, more than twenty times the stellar mass — an early, independent detection of dark matter on the largest scale then reachable.
- The **morphology–density relation reappears at a thousandth the scale**: gas-rich irregulars in the field, gas-poor spheroidals near the big spirals, driven by ram-pressure stripping, tidal stripping and strangulation — with **Sagittarius** and the **Magellanic Stream** as the process caught in the act. The observed dwarfs are a **survivor population**.
- **Ultra-faints** such as Segue 1 reach $M/L \approx 3{,}400$, with less light than one bright red giant. They forced "galaxy" to be redefined dynamically and chemically — **a system whose own gravity governed its chemical history** — because size and appearance no longer separated galaxies from star clusters.
- They are **fossils**: ~80% of their stars formed by $z\approx6$ and all by $z\approx3$, quenched by **reionization** heating the intergalactic medium to ~$10^4$ K. **Reticulum II** records a **single r-process event**, because a galaxy with a few thousand stars cannot average events away — small samples preserve what large samples destroy.
- The four **small-scale challenges** — missing satellites, too-big-to-fail, core–cusp, planes of satellites — each eased once baryonic physics entered the theory and selection functions entered the data. **Core–cusp is the strongest survivor.**
- The **Milky Way–M31 merger is no longer certain**: ~2% within 5 Gyr and ~50% within 10 Gyr on one recent analysis, ~90% with a median of 6.5 Gyr on another, with the LMC's perpendicular pull among the decisive terms.

The transferable idea: **the smallest members of a population are usually the most informative and the last to be studied.** They are the most numerous, so they carry the statistics; they are the most fragile, so they record their environment most sensitively; and they are the least buffered, so single events show up in them undiluted. They are also the hardest to detect, which means a field's understanding of them lags its understanding of the conspicuous cases by decades — and that during the lag, the conspicuous cases are mistaken for the typical ones. The Local Group's dwarfs were nearly all found in the last twenty years of a hundred-year subject. Whatever population you study, it is worth asking what its equivalent of a dwarf galaxy is, and whether you have looked.

## Further reading

{{book: Sidney van den Bergh | The Galaxies of the Local Group | 2000}}

{{book: James Binney | Galactic Dynamics | 2008}}

{{book: Ken Freeman | In Search of Dark Matter | 2006}}

Beyond the books: the star-formation-history literature reconstructed from deep colour–magnitude diagrams of ultra-faint dwarfs is where the reionization-quenching case is actually made, and it is worth seeing how much is extracted from the position of a main-sequence turnoff. The Reticulum II r-process papers are short and unusually vivid about what a single galaxy can record. And the 2025 and 2026 analyses of the Milky Way–Andromeda orbit make an excellent paired reading on how a prediction's confidence tracks one hard-won number.

## Problems

*Useful numbers: G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 pc = 3.086 × 10¹⁶ m; 1 kpc = 3.086 × 10¹⁹ m; age of universe 13.8 Gyr = 4.35 × 10¹⁷ s; M31 at 785 kpc approaching at 110 km/s; timing-argument parametrisation r = A(1 − cos η), t = B(η − sin η), A³ = GMB²; mass estimator M₁/₂ ≈ 3σ²r₁/₂/G; Segue 1: σ = 3.7 km/s, r₁/₂ ≈ 39 pc, L_V ≈ 340 L☉.*

**1.** *(Why the census is local.)* **(a)** Explain why dwarf galaxies must be detected as overdensities of resolved stars rather than as objects. **(b)** State the consequence for the distance out to which the faint end of the luminosity function can be measured. **(c)** Explain why this makes claims about the universal abundance of dwarfs dependent on the Local Group specifically.

**2.** *(Counting is a statement about surveys.)* The number of known Milky Way satellites has risen from about eleven to around sixty-five in two decades. **(a)** Explain why this does not mean the Milky Way acquired satellites. **(b)** State the correct way to compare an observed satellite count with a simulated prediction. **(c)** Name two populations still likely to be missing.

**3.** *(The timing argument.)* **(a)** State the physical logic in two sentences. **(b)** Using $\dot{r}t/r = \sin\eta(\eta-\sin\eta)/(1-\cos\eta)^2$ with the values above, verify that $\eta \approx 4.2$ and compute the implied mass. **(c)** State two idealisations that bias the result, giving the direction of each.

**4.** *(Segue 1.)* **(a)** Compute the mass within the half-light radius from the dispersion. **(b)** Compute the mass-to-light ratio, using half the total luminosity. **(c)** Comment on how your answer compares with the published ~3,400 and why they differ.

**5.** *(Galaxy or cluster?)* **(a)** State the two criteria that distinguish an ultra-faint dwarf from a globular cluster. **(b)** Explain the physical reason each works. **(c)** Explain what the pair of criteria have in common, and state the resulting one-sentence definition of a galaxy.

**6.** *(Feedback and the mass-to-light ratio.)* **(a)** Explain why every halo starts with roughly the same dark-to-baryonic ratio. **(b)** Explain why mass-to-light ratio rises toward lower galaxy mass. **(c)** Predict how the trend should behave at the very lowest masses and state what limits it.

**7.** *(Fossils.)* **(a)** State the observed star-formation history of ultra-faint dwarfs. **(b)** Give the reionization argument quantitatively, comparing a sound speed with an escape velocity. **(c)** Explain why the shutdown being *synchronised* across systems is the key evidence.

**8.** *(Small samples, single events.)* **(a)** State what Reticulum II's abundances revealed. **(b)** Explain why the Milky Way could not have yielded the same result. **(c)** State the general principle and give one example of it from elsewhere in this tree.

**9.** *(Holding a prediction loosely.)* The Milky Way–Andromeda merger has gone from certain to roughly even odds and back toward likely. **(a)** Identify the single measurement responsible and explain why it is hard. **(b)** Explain why the LMC — around a tenth of the Milky Way's mass — can change the outcome qualitatively. **(c)** State what a reader should take as settled and what as provisional, and justify the split.

## Worked answers

**1.** **(a)** A dwarf's luminosity is spread over tens to hundreds of parsecs, giving a **surface brightness below that of the night sky**. Integrated light from such a system is therefore lost in the sky background and cannot be detected as a smudge; what *can* be detected is that the stars in a small patch of sky are anomalously concentrated in position and in colour–magnitude space compared with the Milky Way foreground. **(b)** Resolving individual stars requires them to be brighter than the survey limit and separable from their neighbours, which fails beyond a few megaparsecs for the faintest systems — so the luminosity function's faint end is measurable only within roughly the Local Group and its immediate surroundings. **(c)** Because the universal abundance of dwarfs is obtained by **extrapolating one volume**, in which one large spiral's satellites are known in detail and a second's partially. If the Local Group is atypical — in mass, in environment, in merger history — the extrapolation carries that atypicality into a cosmological claim. The concern is not hypothetical: satellite abundance depends on host mass, and the Milky Way's own halo mass has been revised repeatedly.

**2.** **(a)** Because the increase tracks **survey depth, sky coverage, and detection algorithms**, not any change in the Milky Way. SDSS, DES, Pan-STARRS and DELVE each pushed to fainter surface brightness over more sky, and satellites appeared as their detection thresholds crossed the objects' brightnesses. **(b)** **Apply the survey's selection function to the simulation, not a completeness correction to the data.** Take the simulated satellite population, place it at realistic distances and positions, and ask which members the actual surveys would have detected given their depth, sky coverage and confusion limits. Compare *that* number with the observed count. Correcting the observations upward instead requires assuming the very abundance distribution under test. **(c)** Satellites **behind the Galactic plane**, where stellar confusion and dust extinction defeat the overdensity method, and satellites at **large Galactocentric distance and very low luminosity**, where the resolved stars are too few and too faint to form a detectable overdensity.

**3.** **(a)** In an expanding universe, two galaxies now approaching must once have been receding, so their mutual gravity has already reversed the expansion between them. Requiring that reversal to have been accomplished within the age of the universe fixes the mass needed. **(b)** $\dot{r}t/r = (-1.10\times10^5)(4.35\times10^{17})/(785\times3.086\times10^{19}) = -4.79\times10^{22}/2.42\times10^{22} = -1.98$. Solving the transcendental equation gives $\eta = 4.20$ rad (past $\pi$, so on the infalling branch). Then $B = t/(\eta - \sin\eta) = 4.35\times10^{17}/5.07 = 8.60\times10^{16}$ s and $A = r/(1-\cos\eta) = 2.42\times10^{22}/1.49 = 1.63\times10^{22}$ m, giving $M = A^3/(GB^2) = 4.31\times10^{66}/(6.674\times10^{-11} \times 7.39\times10^{33}) = 8.7\times10^{42}$ kg $\approx \mathbf{4.4\times10^{12}\,M_\odot}$. **(c)** *Two-body isolation*: neglecting the LMC, M33 and surrounding mass. The LMC in particular pulls the Milky Way transversely, so the true orbit is less radial than assumed, meaning the calculation **underestimates** the mass required. *Radial-velocity-only*: unmeasured transverse motion likewise implies a wider orbit needing more mass, again an **underestimate**. Working the other way, the *zero-separation initial condition* ignores the finite size of the initial perturbation and the fact that the pair did not start at a point, which makes the available time slightly shorter than assumed and pushes the estimate **up**. Modern estimates using more information land at $2$–$3\times10^{12}\,M_\odot$.

**4.** **(a)** $M_{1/2} = 3\sigma^2 r_{1/2}/G = 3(3.7\times10^3)^2(39 \times 3.086\times10^{16})/6.674\times10^{-11} = 3(1.369\times10^7)(1.204\times10^{18})/6.674\times10^{-11} = 4.94\times10^{25}/6.674\times10^{-11} = 7.4\times10^{35}$ kg $\approx \mathbf{3.7\times10^{5}\,M_\odot}$. **(b)** Half the light is $170\,L_\odot$, so $M/L \approx 3.7\times10^5/170 \approx \mathbf{2{,}200}$ in solar units. **(c)** The same order as the published ~3,400, and the difference is instructive rather than a discrepancy. The estimator used here is a **single-number approximation** valid near the half-light radius; published values come from full dynamical modelling of the light profile and the individual stellar velocities, and are quoted for the **total** mass-to-light ratio rather than the value within $r_{1/2}$ — and since dark matter extends well beyond the stars, the total ratio exceeds the half-light one. The velocity dispersion also carries a substantial uncertainty and had to be corrected for binary stars, whose orbital motions would otherwise inflate it. What survives all of that is the conclusion: a mass-to-light ratio in the **thousands**, so the system is overwhelmingly dark.

**5.** **(a)** **A spread in stellar metallicity**, and **a velocity dispersion far exceeding what the stellar mass alone can produce**. **(b)** *Metallicity spread*: a star cluster forms in a single burst from well-mixed gas and so has essentially one composition, whereas a system that retained its own supernova ejecta and continued forming stars from progressively enriched gas produces a range of $[\mathrm{Fe/H}]$ spanning a factor of ten or more. *Dispersion excess*: a cluster's stars move at speeds set by their own collective mass; if the observed dispersion demands several hundred times more mass than the stars supply, the system sits in a dark-matter halo. **(c)** Both are tests of whether the system's **own gravity was deep enough to control its own history** — deep enough to retain ejecta and enrich itself, and deep enough to require dark matter to bind it. Hence: **a galaxy is a stellar system whose own gravitational potential governed its chemical evolution**, which is a definition that continues to work where size, shape and luminosity have all stopped discriminating.

**6.** **(a)** Because dark matter and baryons are both drawn into a forming halo by the same gravitational collapse, and neither is preferentially excluded at the outset — so a halo begins with roughly the **cosmic ratio**, about five to one in favour of dark matter. **(b)** Only the baryons can be heated and expelled. Supernovae, stellar winds and photoionisation inject energy into the gas; whether that gas escapes depends on the halo's **escape velocity**, which falls with mass. A massive galaxy retains almost everything and converts a large fraction into stars; a dwarf with an escape velocity of tens of km/s loses most of its gas before it can form stars. The dark matter, being collisionless and pressureless, is unaffected — so the ratio of total mass to light rises steadily toward lower mass. **(c)** The trend should continue rising, and it does, into the thousands for ultra-faints. It is limited at the bottom by the fact that a halo which forms **no** stars at all has an infinite mass-to-light ratio and is simply **undetectable** — so the observed maximum is set not by physics but by the requirement that a system contain enough stars to be found and to have its dispersion measured. Below that, the population continues but leaves no optical trace, which is precisely why the missing-satellites comparison had to be reformulated.

**7.** **(a)** About **80 per cent of their stars formed by $z\approx6$** (~12.8 Gyr ago) and essentially **100 per cent by $z\approx3$** (~11.6 Gyr ago), after which star formation ceased entirely. **(b)** Reionization photoheated the intergalactic medium to $T \approx 10^4$ K. The sound speed of ionised hydrogen at that temperature, $c_s \sim \sqrt{k T/m_p} \sim 10$ km/s, is comparable to or greater than the escape velocity of the smallest halos, which is a few to a few tens of km/s. Gas whose thermal speed approaches the escape velocity cannot be held, and gas already outside cannot be accreted, since it would need to be compressed against its own pressure. Both taps close at once. **(c)** Because the ultra-faints have **different orbits, different infall times, and different distances from their hosts**, so any host-driven mechanism — ram-pressure stripping, tidal removal — would quench them at different times. A common shutdown epoch across systems with unrelated local histories demands a cause **external to all of them and simultaneous for all of them**, and reionization is the only candidate at that epoch. The synchrony is what converts a plausible mechanism into the identified one.

**8.** **(a)** That seven of the first nine stars observed spectroscopically are strongly enhanced in **r-process elements**, at levels two to three orders of magnitude above other ultra-faint dwarfs, with an abundance pattern indicating enrichment by a **single rare and prolific event** — most plausibly a neutron-star merger. **(b)** Because the Milky Way has formed of order $10^{11}$ stars over ten billion years and hosted a great many r-process events, so its abundances are an **average**. An average cannot be inverted into its terms: it cannot distinguish many modest events from few prolific ones, and it certainly cannot deliver the yield of any individual explosion. Reticulum II formed a few thousand stars over a few hundred million years and plausibly hosted exactly one such event, so its stars carry that event's yield essentially undiluted. **(c)** **Small samples preserve individual events that large samples average away.** Elsewhere in this tree: presolar grains in meteorites carry the isotopic signature of *individual* nearby stars, which the bulk solar composition — an average over the whole protosolar nebula — completely erases; and the short-lived radionuclide record in the early Solar System dates a single nearby event that the Galaxy-wide abundance pattern cannot see.

**9.** **(a)** **M31's transverse velocity**, its motion across the sky. It is hard because at 785 kpc a velocity of a few tens of km/s corresponds to an angular motion of a few tens of **microarcseconds per year** — requiring either Hubble Space Telescope astrometry accumulated over years against distant background galaxies, or Gaia's global astrometric solution with its systematic offsets characterised and removed. The measurement's uncertainty has been comparable to the quantity itself, which is exactly the regime in which a prediction flips. **(b)** Because the outcome is decided by a **near-cancellation**: whether the encounter is nearly head-on or has enough angular momentum to swing past. Near a threshold, the deciding term is not the largest term but whichever term is comparable to the margin — and the LMC, on an orbit running roughly **perpendicular** to the Milky Way–M31 line, delivers a transverse impulse to the Milky Way of just the size that matters, tending to prevent a direct hit, while M33's pull on M31 tends the other way. **(c)** **Settled**: that the two galaxies are gravitationally bound and approaching; that their eventual merger, whenever it occurs, would destroy both disks and produce a spheroid, by the mechanism the Mergers chapter sets out; and that satellites of appreciable mass materially affect the orbit. **Provisional**: the merger probability and its timescale, both of which have moved from near-certain to roughly even and back toward likely, with a median around 6.5 Gyr on the most recent analysis. The split follows from what each claim depends on: the settled items follow from well-measured quantities and robust dynamics, while the provisional ones hinge on a single quantity whose measurement uncertainty is still comparable to its value. **Hold the mechanism firmly and the number loosely.**$egDwarfs_master$,
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
