-- Astronomy & Space · The Milky Way — Galactic Dynamics —
-- "The Missing Mass". Curated master for
-- astronomy-and-space/milky-way/galactic-dynamics/missing-mass
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (Galactic Dynamics block), so this
-- change is content-only: no seed edit rides with it.
--
-- What the rotation curves imply, argued across every scale on which
-- the problem appears. The convergence of independent measurements at
-- roughly five to one; the cosmic budget with stars at half a per cent
-- of everything; why the missing mass cannot be ordinary matter, from
-- three independent directions - microlensing surveys excluding compact
-- objects, big bang nucleosynthesis fixing the baryon density from
-- deuterium, and the cosmic microwave background's third acoustic peak
-- requiring a component that does not couple to photons; gravitational
-- lensing as a mass measurement independent of dynamics, and the Bullet
-- Cluster's spatial separation of lensing mass from baryons; the
-- candidate particles and the honest position that the gravitational
-- properties are known precisely and the identity not at all; modified
-- gravity given a fair hearing, with MOND's genuine successes - flat
-- curves, Tully-Fisher falling out as v^4 = G M a0, the radial
-- acceleration relation - set against its failures in clusters, the
-- Bullet Cluster and the CMB; and the small-scale challenges to cold
-- dark matter with feedback as the plausible resolution.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/galactic-dynamics/missing-mass',
    'research',
    'advanced',
    'read',
    $mwMissingMass_master$> **The missing mass problem** is the discrepancy between the mass inferred from gravity and the mass observed as light, present in every system larger than a star cluster. The favoured resolution is **dark matter**: a non-luminous, non-baryonic component outweighing ordinary matter by about **five to one**, whose gravitational behaviour is precisely characterised and whose identity remains completely unknown.

The previous chapter established the discrepancy in one setting — the rotation curves of spiral galaxies. Taken alone, that result would be suggestive but not compelling: a single class of measurement, on a single class of object, might yet have a mundane explanation.

What makes the problem inescapable is that it appears **independently on every scale**, measured by techniques sharing essentially no assumptions, and the independent answers **agree**. Galaxy rotation curves, the velocity dispersions of galaxy clusters, the temperature of X-ray gas in those clusters, gravitational lensing, the acoustic peak structure of the cosmic microwave background, the observed pattern of large-scale structure, and the abundance of light elements produced minutes after the Big Bang all point to the same conclusion, and to roughly the same number.

That convergence is the argument. Any proposed alternative must reproduce not one measurement but all of them, and this chapter is largely about which proposals do and do not.

## The problem on four scales

**Galaxies.** Rotation curves stay flat where they should decline, requiring several times more mass than the visible matter provides, distributed in an extended halo. Mass-to-light ratios climb without limit outward.

**Galaxy clusters.** Three independent methods agree, which is the important part.
- **Galaxy motions.** Zwicky's 1933 virial analysis of the Coma cluster found velocities requiring far more mass than the visible galaxies contained — the first detection, forty years early.
- **X-ray gas.** Clusters are filled with gas at 10⁷–10⁸ K. Its temperature measures the depth of the potential well confining it, and requires far more mass than the galaxies plus the gas provide. This method assumes hydrostatic equilibrium, not virial equilibrium, so its systematics differ entirely from Zwicky's.
- **Gravitational lensing.** The bending of background galaxies' light measures the foreground mass directly, with no assumption about motion or equilibrium of any kind.

Three methods, three distinct sets of assumptions, one answer.

**Cosmic structure.** The pattern of galaxies across hundreds of megaparsecs — the cosmic web of filaments, walls, and voids — formed by gravitational amplification of small primordial density fluctuations. Those fluctuations are measured directly in the cosmic microwave background at one part in 10⁵. Ordinary matter, coupled to radiation until recombination, **cannot** grow structure from that starting point fast enough to produce what is observed today. A component that does not interact with light can begin clumping earlier and provide the gravitational wells into which baryons later fall.

**The cosmic microwave background.** The angular power spectrum of temperature fluctuations shows a series of acoustic peaks whose relative heights depend on the densities of the components present. The measurement is precise and the fit is excellent, and the values it returns are:

| Component | Share of the universe's energy density |
| --- | --- |
| Dark energy | 68.5% |
| Dark matter | 26.5% |
| Ordinary matter (baryons) | 4.9% |
| — of which, stars | ~0.5% |

**Everything ever observed by any telescope in any waveband is about half a per cent of the universe.** Dark matter outweighs ordinary matter by 5.4 to 1, and the same ratio is what galaxy and cluster dynamics require — a consistency between measurements of the whole universe and measurements of individual galaxies that no adjustment was available to arrange.

```checkpoint
q: The strongest argument for dark matter is not any single measurement but the fact that
a: rotation curves have now been measured for thousands of galaxies
x: The number of galaxies matters for establishing that flat curves are general, but repeating one *kind* of measurement does not address whether that kind of measurement is being misinterpreted. Independence of method matters more than sample size.
a*: independent methods on wildly different scales — galaxy rotation, cluster dynamics, X-ray gas, lensing, the CMB, and structure formation — share almost no assumptions yet return the same answer
a: the dark matter particle has been detected in several laboratory experiments
x: No direct detection has been confirmed despite decades of increasingly sensitive experiments. The case rests entirely on gravitational and cosmological evidence.
a: theoretical models of galaxy formation require dark matter to work
x: They do, but a theory requiring an ingredient is not evidence that the ingredient exists — that would be circular. The evidence is observational and, crucially, multiply independent.
hint: If one method might be systematically wrong, what would reassure you? What if six methods with different systematics agree?
why: A single technique can harbour a systematic error that mimics the signal — the lesson of Kapteyn's extinction and BICEP2's dust. Six techniques with unrelated assumptions, applied from kiloparsec to gigaparsec scales, cannot plausibly share one. Cluster lensing assumes nothing about motion, X-ray temperatures assume hydrostatic rather than virial equilibrium, and the CMB constrains the universe as a whole — yet all return roughly the same 5:1 ratio. That convergence is what any alternative must reproduce in full.
---
q: The CMB and galaxy dynamics constrain dark matter in completely different ways, yet both indicate about five times more dark matter than ordinary matter. This agreement is significant because
a: the CMB measurement was calibrated using galaxy rotation curves
x: The CMB analysis is entirely independent, derived from the acoustic peak structure imprinted 380,000 years after the Big Bang. No galactic dynamics enters it, which is exactly why the agreement carries weight.
a*: no free parameter was available to arrange it — a measurement of the whole universe at recombination and measurements of individual galaxies today were fitted separately and landed on the same ratio
a: both measurements ultimately rely on the same assumption about Newtonian gravity
x: The CMB analysis rests on relativistic cosmology and the physics of photon-baryon fluid oscillations, not on Newtonian orbital dynamics. Their theoretical foundations differ substantially.
a: it shows dark matter is uniformly distributed throughout the universe
x: Dark matter is emphatically not uniform — it is clumped into halos, which is what makes galaxies possible. The agreement concerns the total budget, not the distribution.
hint: Two measurements of very different things, using different physics, at epochs 13 billion years apart. What would it mean if they had disagreed?
why: The CMB fixes the cosmic ratio from acoustic physics at recombination; galaxy and cluster dynamics fix it from gravity today. Nothing links the two analyses, so disagreement would have been a serious crisis and agreement is a genuine prediction confirmed. This is what distinguishes a well-supported hypothesis from a fitted one: the parameters were determined in one domain and found to work in another where they could have failed.
```

## Why it cannot be ordinary matter

The obvious first hypothesis is that the missing mass is ordinary material that simply does not shine — cold gas, faint stars, planets, stellar remnants. Three independent lines of evidence exclude it, and the third is the most powerful.

**Microlensing surveys.** If the halo were composed of compact objects — brown dwarfs, old white dwarfs, black holes, collectively **MACHOs** (Massive Compact Halo Objects) — then such objects would occasionally pass in front of background stars and gravitationally magnify them. The MACHO, EROS, and OGLE collaborations monitored millions of stars in the Magellanic Clouds for years, counting events. Some were found; far too few. Compact objects can constitute at most a modest fraction of the halo across the relevant mass range, and cannot be the bulk of it.

**Big Bang nucleosynthesis.** As the Nucleosynthesis chapter described, the first minutes of the universe produced helium, deuterium, and lithium in proportions that depend sensitively on the **density of baryons**. Deuterium is the sharpest diagnostic: it is destroyed by any subsequent stellar processing and never significantly produced, so the deuterium observed in pristine intergalactic gas sets a firm upper bound on how many baryons the universe contains. That bound is about 5% of the critical density — far short of the ~31% that matter must contribute. **The missing mass cannot be baryonic, whatever form the baryons might take**, because there are not enough baryons in existence.

**The cosmic microwave background's third peak.** This is the decisive and most elegant argument. Before recombination, photons and baryons were tightly coupled into a single fluid, oscillating in the gravitational wells of the density perturbations — compression, then rebound. Dark matter, feeling only gravity, did not participate in these oscillations; it just sat in the wells providing gravity.

The resulting acoustic peaks in the CMB power spectrum carry the signature. **Odd-numbered peaks correspond to maximum compression, even-numbered to maximum rarefaction**, and baryons — providing inertia but no pressure — make compressions deeper while leaving rarefactions unchanged. So the ratio of odd to even peak heights measures the baryon density. Meanwhile the **third peak's height relative to the second** is sensitive to how much *non-interacting* matter was present to hold the wells open against the radiation pressure that would otherwise damp them.

The measured third peak is too high to be produced by baryons alone. A universe with only ordinary matter produces a demonstrably different peak pattern from the one observed. The CMB does not merely permit non-baryonic dark matter; it **requires** it, and quantifies it to per-cent precision.

```checkpoint
q: Big Bang nucleosynthesis excludes the possibility that dark matter is ordinary matter in some non-luminous form because it
a: shows that the early universe was too hot for ordinary matter to condense
x: Ordinary matter did condense readily once the universe cooled — into all the gas, stars and planets that exist. Temperature is not the constraint being applied.
a*: fixes the total number of baryons in the universe from the observed deuterium abundance, and that total falls far short of the required matter density
a: proves that only hydrogen and helium were produced, so heavier dark matter cannot exist
x: The absence of heavy elements from the Big Bang says nothing about dark matter, which is not made of nuclei at all. The relevant constraint is on the total baryon count, not on which nuclei formed.
a: demonstrates that dark matter must have formed before the first three minutes
x: Formation epoch is not what BBN constrains here. Its power is that the light-element yields depend on the baryon density, turning an abundance measurement into a census.
hint: The yields of the first three minutes depend on how many baryons were present. What does measuring those yields therefore tell you?
why: Deuterium is destroyed by stars and never significantly remade, so its abundance in pristine gas is a clean measure of the primordial baryon density — about 5% of critical, against the ~31% that matter must supply. The shortfall is not a matter of the baryons being hidden in some hard-to-see form: there are not enough baryons in existence, in any form. This is why hypotheses about cold gas, faint stars or planetary-mass objects cannot rescue an all-baryonic universe.
---
q: The third acoustic peak in the CMB power spectrum is too high to be explained by ordinary matter alone. Its height is sensitive to
a: the temperature of the photons at recombination, which is known independently
x: The photon temperature sets the overall scale of the spectrum, not the relative heights of individual peaks. Peak ratios encode the composition of the fluid and the gravitational wells it oscillated in.
a*: how much non-interacting matter was present to hold the gravitational wells open against the radiation pressure that would otherwise have damped the oscillations
a: the total number of galaxies that later formed from the perturbations
x: The CMB records conditions 380,000 years after the Big Bang, long before any galaxy existed. Later structure formation is a consequence of these perturbations, not an input to them.
a: the speed at which the universe was expanding at recombination
x: Expansion rate affects the angular scale of the peaks — where they sit — rather than their relative heights, which are set by the composition of the oscillating fluid and the wells.
hint: Photons and baryons oscillated together; dark matter did not oscillate at all. What did dark matter contribute to the wells that the oscillating fluid could not?
why: Photons and baryons were tightly coupled and oscillated as one fluid, with radiation pressure tending to damp the perturbations away. Dark matter, feeling only gravity, sat in the wells and kept them deep — so the amount of non-interacting matter present controls how much the later oscillations are boosted, showing up in the third peak's height relative to the second. A baryon-only universe produces a measurably different peak pattern. The CMB therefore does not merely allow non-baryonic dark matter; it requires it and measures it to per-cent precision.
```

## Mass measured without motion

Every dynamical method — rotation curves, virial estimates, X-ray temperatures — infers mass from how something moves or how hot it is, and therefore assumes an equilibrium. **Gravitational lensing** does not.

General relativity requires mass to deflect light. A foreground mass concentration therefore distorts the images of background galaxies: strongly, producing arcs and multiple images when the alignment is close; weakly, producing a subtle coherent stretching detectable statistically across thousands of background galaxies. Either way, the deflection depends only on the mass distribution — not on whether it is moving, relaxed, luminous, or made of anything in particular.

Lensing maps of clusters consistently return the same masses as the dynamical methods, confirming the discrepancy through a route with no dynamical assumptions at all. But its most striking application is a single object.

**The Bullet Cluster** (1E 0657-558) is the aftermath of a collision between two galaxy clusters, caught from a favourable viewing angle. Three components can be located independently:

- **The galaxies**, seen in visible light. Being tiny compared with the distances between them, they passed through the collision essentially without interacting.
- **The hot gas**, seen in X-rays — and this is where most of the clusters' *ordinary* matter resides, outweighing the stars several times over. Gas is collisional: the two gas clouds slammed into each other, shocked, and were left behind in the middle.
- **The mass**, mapped by gravitational lensing.

The prediction of each hypothesis is sharp and different. If the mass is dark matter — collisionless, like the galaxies — it should have passed through with the galaxies, leaving the gas behind. If instead there is no dark matter and gravity is simply stronger than Newton predicts, then the gravitational signal must track the ordinary matter, which is overwhelmingly **the gas**.

The lensing mass is found with the galaxies, cleanly separated from the X-ray gas.

This is the closest thing the field has to a direct demonstration. It does not depend on any dynamical model, any assumption of equilibrium, or any fitted parameter: two components that ought to coincide under modified gravity are observed in different places. Several similar systems have since been found, and the qualitative result holds.

The argument's limits should be stated too. A modified-gravity theory that also contains some non-luminous matter can accommodate the Bullet Cluster, and defenders of such theories have pointed out that clusters were already known to require additional unseen mass on their terms. But the observation removes the simplest and most attractive version of the alternative — that gravity alone, acting on the visible matter, explains everything.

{{image: Bullet Cluster | The Bullet Cluster: two galaxy clusters after a collision. The hot gas, holding most of the ordinary matter, was slowed by the impact and left in the middle; the galaxies passed through; and the mass mapped by gravitational lensing is found with the galaxies, not with the gas. Under modified gravity with no dark matter, the gravitational signal would have to follow the ordinary matter — which is the gas.}}

```checkpoint
q: In the Bullet Cluster, the gravitational lensing mass is found with the galaxies while the X-ray gas lies between them. This is powerful evidence for dark matter because
a: it shows the gas has been stripped of its dark matter by the collision
x: The gas never held the dark matter in the first place — the two are separate components that merely coincided before the collision. The observation reveals a separation, not a stripping.
a*: most of the clusters' ordinary matter is in the gas, so a modified-gravity explanation would require the gravitational signal to follow the gas — and it does not
a: galaxies are more massive than the gas, so the mass naturally follows them
x: The opposite is true: in clusters the hot gas outweighs the stars in galaxies by several times. That is precisely what makes the observation decisive rather than trivial.
a: the collision generated additional mass through the energy released
x: The kinetic energy involved is utterly negligible as a mass contribution, and would in any case appear where the energy was deposited — in the gas. No new mass is created.
hint: Ask where most of the *ordinary* matter is in a cluster, and where a theory with no dark matter would therefore have to put the gravity.
why: Galaxies are collisionless and passed through; gas is collisional and was left behind, and the gas holds most of the baryons. Under modified gravity acting on visible matter alone, the lensing signal would have to peak on the gas. It peaks on the galaxies instead — where collisionless dark matter would be. The result needs no dynamical model, no equilibrium assumption, and no fitted parameter: two things that should coincide are observed apart. It does not exclude hybrid theories containing both modified gravity and unseen mass, but it removes the simplest alternative.
---
q: Gravitational lensing is a valuable check on dynamical mass estimates specifically because it
a: is more sensitive to small amounts of mass than dynamical methods
x: Sensitivity is not the distinguishing feature — lensing has its own noise floor and requires many background galaxies. What matters is the *assumptions* it does not make.
a*: measures mass through light deflection alone, requiring no assumption that the system is in equilibrium or that anything is moving in a particular way
a: can distinguish dark matter from ordinary matter directly
x: Lensing responds to all mass equally and cannot tell what the mass is made of. Its value lies in measuring the total without dynamical assumptions, not in identifying composition.
a: works only for systems that are gravitationally relaxed
x: This inverts the situation. Dynamical methods require relaxation; lensing is precisely the tool for systems like the Bullet Cluster that are manifestly *not* relaxed.
hint: Virial and X-ray methods both assume a settled system. What breaks if the system is mid-collision — and does light deflection care?
why: Every dynamical estimate assumes some equilibrium: the virial theorem requires a steady state, X-ray temperatures require hydrostatic balance. A merging cluster satisfies neither, so those methods fail exactly where the most interesting systems are. Light deflection depends only on the mass distribution present, so lensing works on disturbed systems and provides an independent cross-check on relaxed ones. That independence is why lensing agreement with dynamical masses strengthened the case, and why the Bullet Cluster measurement was possible at all.
```

## What might it be

The gravitational properties are tightly constrained. Dark matter must be:

- **Non-baryonic**, by nucleosynthesis and the CMB.
- **Cold** — moving slowly when structure began forming. A relativistic ("hot") particle would stream out of small perturbations and erase them, leaving no small galaxies. Observed dwarf galaxies exclude this, which was how neutrinos, once the leading candidate, were ruled out as the bulk component.
- **Collisionless**, or nearly so. The Bullet Cluster's passage constrains dark matter's self-interaction cross-section directly.
- **Stable**, on timescales longer than the age of the universe, or the structure it built would have dispersed.
- **Effectively invisible** — no electromagnetic interaction detected at any level.

Candidates satisfying these include **WIMPs** (weakly interacting massive particles, whose thermal freeze-out abundance naturally lands near the observed density — the "WIMP miracle" that motivated decades of searches), **axions** (very light particles proposed for unrelated reasons in particle physics), **sterile neutrinos**, and **primordial black holes** (which are baryon-free despite forming from ordinary matter, though microlensing and other constraints now restrict them to narrow mass windows).

Three search strategies have run for decades:

- **Direct detection**: underground detectors watching for a dark-matter particle to recoil off a nucleus. Given the ~10⁹ particles per square metre per second computed in the Halo chapter, the flux is enormous and the cross-section must therefore be extraordinarily small. Successive experiments have improved sensitivity by orders of magnitude. **No confirmed detection.**
- **Indirect detection**: searching for the products of dark-matter annihilation — gamma rays, positrons, neutrinos — from the Galactic centre or dwarf galaxies. Several anomalies have appeared and been attributed to conventional astrophysics. **No confirmed detection.**
- **Collider production**: making dark matter at the Large Hadron Collider, detectable as missing energy. **No confirmed detection.**

The honest summary: **the gravitational properties of dark matter are known to per-cent precision, and its identity is not known at all.** The most theoretically motivated candidate, the WIMP, has had much of its favoured parameter space excluded without a detection. This is a genuine and uncomfortable situation, and it is the strongest reason to take alternatives seriously.

## Modified gravity, fairly stated

The alternative hypothesis is that there is no missing matter and the law of gravity is wrong in the regime where the discrepancy appears.

**MOND** — Modified Newtonian Dynamics, proposed by Mordehai Milgrom in 1983 — posits that below a characteristic acceleration $a_0 \approx 1.2\times10^{-10}$ m/s², gravitational attraction falls off as $1/r$ rather than $1/r^2$. The threshold is empirical, chosen to fit, and it is fantastically small: about **80 billion times weaker than Earth's surface gravity**, which is why no laboratory experiment probes the regime.

At the Sun's position the centripetal acceleration is $2.2\times10^{-10}$ m/s², or **1.8 $a_0$**; at 50 kpc it is $2.3\times10^{-11}$, or **0.19 $a_0$**. The transition occurs precisely where rotation curves flatten, which is the empirical observation MOND was built around.

Its successes are real and should not be minimised:

- **Flat rotation curves follow immediately.** In the low-acceleration regime the modified law gives $v^4 = GMa_0$, a constant velocity independent of radius — flatness by construction rather than by fitting a halo.
- **Tully–Fisher falls out.** That same relation gives $v^4 \propto M$, and since stellar mass tracks luminosity, $L \propto v^4$ — the observed relation, derived rather than accommodated. For $M = 10^{11}\,M_\odot$ it predicts $v = 200$ km/s, close to the Milky Way's actual value. In the dark-matter picture the relation's tightness remains, as the previous chapter noted, unexplained.
- **The radial acceleration relation.** Across a large sample of galaxies, the observed acceleration at any radius is a tight function of the acceleration predicted from the visible matter alone — one curve, with little scatter, spanning many galaxy types. MOND predicts this exactly. Dark matter must produce it through a conspiracy of halo profiles and baryonic feedback, which simulations can now largely reproduce, though whether that constitutes explanation or accommodation is genuinely argued.

Its failures are equally real:

- **Clusters still need dark matter.** MOND reduces but does not eliminate the cluster discrepancy; roughly a factor of two in unseen mass remains.
- **The Bullet Cluster** separates the lensing mass from the baryons, which pure modified gravity cannot produce.
- **The CMB peaks.** Reproducing the third peak requires a component that does not couple to photons, which is a statement about matter rather than about the force law.
- **Structure formation.** Growing the observed cosmic web from CMB-level fluctuations requires matter that could clump before recombination.
- **Relativistic formulation.** MOND is a modification of Newtonian dynamics and needs a relativistic completion to address cosmology or lensing at all. Several were constructed, and the 2017 measurement of GW170817 — showing gravitational waves travel at the speed of light to within one part in 10¹⁵ — eliminated a large class of them at a stroke.

The reasonable assessment: **dark matter is the strongly favoured explanation**, because it succeeds across every scale while MOND fails above galactic scales. But MOND's galaxy-scale successes are not nothing — they encode a real regularity in how galaxies behave, one that dark-matter models must work to reproduce and that MOND obtains from a single parameter. Something about galaxy dynamics is tidier than a picture of independently assembled halos would suggest, and treating that as merely a curiosity would be poor science.

```checkpoint
q: MOND's most impressive success is that the Tully–Fisher relation L ∝ v⁴ follows from its premise, whereas in the dark-matter picture the relation's tightness is unexplained. This matters because
a: it proves that dark matter does not exist
x: One successful prediction cannot outweigh MOND's failures on clusters, the Bullet Cluster, the CMB and structure formation. A theory is judged across all the evidence, not on its best case.
a*: a theory deriving an observed regularity from one parameter is doing something a theory that must accommodate it is not — and the regularity is real regardless of which theory ultimately explains it
a: the Tully–Fisher relation is the most important observation in extragalactic astronomy
x: It is useful and interesting, particularly as a distance indicator, but it is one relation among many and does not outrank the cosmological evidence in weight.
a: dark matter models cannot reproduce Tully–Fisher at all
x: They can, through halo profiles combined with baryonic feedback, and simulations now do so reasonably well. What is argued is whether that constitutes explanation or accommodation.
hint: Distinguish "this theory can be made to fit the data" from "this theory could not have avoided predicting the data".
why: In the low-acceleration regime MOND gives v⁴ = GMa₀ directly, so L ∝ v⁴ is unavoidable rather than fitted — from a single parameter. Dark-matter models reproduce the relation only through a combination of halo structure and self-regulating feedback, which works but was not forced. The distinction matters even though MOND fails elsewhere, because the regularity it captures is a genuine feature of galaxies that any successful theory must account for, and noticing that a rival explains something more economically is how the weaknesses of a favoured theory get identified.
---
q: The strongest reasons to prefer dark matter over modified gravity are that MOND fails to account for
a: flat rotation curves, which require a dark halo
x: Flat rotation curves are MOND's founding success — they follow immediately from its premise. This is the one thing it certainly does account for.
a*: the CMB's third acoustic peak, the growth of cosmic structure, and the Bullet Cluster's separation of lensing mass from baryons — all of which concern matter content rather than the force law
a: the Tully–Fisher relation between luminosity and rotation speed
x: MOND derives Tully–Fisher from its premise; it is among its most cited successes. Choosing this would invert the actual pattern of strengths and weaknesses.
a: the orbital motions of planets in the Solar System
x: Solar System accelerations are vastly above a₀, so MOND reduces to ordinary Newtonian gravity there and makes no anomalous predictions. It was constructed to do so.
hint: MOND changes the force law. Which of the listed observations turn on how much *matter* of a particular kind exists, rather than on how strongly it attracts?
why: The CMB peak structure requires a component that does not couple to photons; structure formation requires matter that could clump before recombination; and the Bullet Cluster shows gravity peaking away from the baryons. None of these can be fixed by altering the force law, because each concerns the existence of a distinct kind of matter. That is why the evidence above galactic scales favours dark matter decisively, even as MOND's galaxy-scale regularities remain a real and unfinished piece of business.
```

```checkpoint
q: Dark matter must be "cold" — meaning the particles were moving slowly when structure began forming — because a relativistic particle would
a: have decayed long before the present day
x: Decay is a separate requirement (stability), unrelated to velocity. A fast-moving stable particle would persist perfectly well while still failing the structure test.
a*: free-stream out of small density perturbations before they could collapse, erasing them and leaving no small galaxies
a: interact too strongly with ordinary matter to remain invisible
x: Interaction strength is independent of speed here; a relativistic particle can be just as weakly interacting. The constraint concerns how far it travels before structure forms, not what it collides with.
a: be unable to remain gravitationally bound in a galaxy today
x: This is true of very light fast particles but is not the operative argument, which concerns the *early* universe and the survival of primordial perturbations, long before galaxies existed.
hint: A fast particle crosses a small perturbation before gravity can amplify it. What happens to structure on scales smaller than that crossing distance?
why: Relativistic particles stream freely across small perturbations, smoothing them out before collapse can occur, so structure would form top-down with small galaxies appearing only late. The observed abundance of dwarf galaxies and early low-mass systems rules that out — which is how neutrinos, once the leading candidate, were excluded as the bulk component. "Cold" here describes velocity relative to the scales of interest, not thermodynamic temperature: a massive particle can be non-relativistic even at high temperature.
---
q: Decades of direct-detection experiments have found no confirmed dark-matter signal despite a flux of ~10⁹ particles per square metre per second. This null result
a: refutes the dark-matter hypothesis, since the particles should have been found by now
x: The gravitational evidence — rotation curves, lensing, cluster masses, the CMB — is entirely independent of any particle hypothesis and establishes that the mass is present. Null searches constrain what it is, not whether it exists.
a*: constrains which candidate is correct rather than whether the phenomenon exists, while legitimately weakening the specific case for WIMPs by excluding much of their motivated parameter space
a: means the particles must be far more massive than previously assumed
x: Mass is one of several parameters the searches constrain, and exclusions cut across the mass–cross-section plane rather than pointing uniformly toward higher masses. The result is a bound on interaction strength at each mass, not a mass determination.
a: shows the local dark-matter density has been overestimated
x: The local density is measured dynamically and is reasonably well determined; an error there would not account for exclusions spanning many orders of magnitude in cross-section.
hint: Separate two questions: does the mass exist, and what is it made of? Which does a detector null result speak to?
why: Gravitational and cosmological evidence establishes the phenomenon independently of particle physics, so failing to detect a candidate cannot unmake a rotation curve or a lensing map. What null results do is exclude regions of parameter space — and since the WIMP's appeal rested on a specific predicted cross-section (the "WIMP miracle"), removing much of that space genuinely weakens the leading candidate and strengthens the motivation to examine axions, sterile neutrinos, and alternatives. Distinguishing "the effect is real" from "this explanation of it is right" is the whole discipline here.
```

## Where cold dark matter struggles

Intellectual honesty requires noting that the favoured model has its own difficulties, all on small scales, and all in the regime where ordinary matter's messy physics is hardest to model.

**The core–cusp problem.** Dark-matter-only simulations predict density rising steeply toward halo centres — a "cusp". Observed rotation curves of dwarf and low-surface-brightness galaxies often indicate flat central "cores" instead.

**The missing satellites problem.** Simulations predict far more small subhalos around a galaxy like the Milky Way than the number of observed dwarf satellites.

**Too big to fail.** The most massive predicted subhalos appear too dense to host any observed satellite — they should be conspicuous, and are not.

The leading resolution to all three is **baryonic feedback**, the previous block's subject. Supernova-driven outflows can move gas rapidly enough to shift the gravitational potential and flatten a cusp into a core; the smallest halos may never have formed stars at all, having lost their gas to reionisation and feedback, leaving them dark and undetectable; and the same processes reduce the central densities of the survivors. Deep surveys have also found many new ultra-faint dwarfs, substantially reducing the satellite deficit.

This is a live area rather than a settled one, and the state of play is worth stating precisely: the discrepancies are real, the proposed resolution is physically motivated and increasingly supported by simulations that include baryons, and it remains possible that some of them instead point to dark matter being warm, or self-interacting, rather than perfectly cold and collisionless. **A model can be overwhelmingly successful and still be incomplete**, and treating its remaining problems as embarrassments to be minimised — or as refutations — would misread both.

{{image: Dark matter | A simulated dark-matter distribution: the cosmic web of filaments, knots and voids into which ordinary matter later fell to build galaxies. Matter that does not couple to radiation could begin clumping before recombination, which is why the structure observed today could grow from fluctuations the cosmic microwave background shows to be only one part in 100,000.}}

```checkpoint
q: Cold dark matter faces small-scale difficulties — the core–cusp problem, missing satellites, and "too big to fail". The leading resolution is that
a: dark matter must be warm rather than cold, which erases small structure
x: Warm dark matter remains a live possibility and would indeed suppress small-scale structure, but it is not the leading explanation — and it would require abandoning a model that succeeds elsewhere in favour of one fitted to these specific discrepancies.
a*: baryonic feedback — supernova-driven outflows can flatten central cusps, and the smallest halos may never have formed stars at all after losing their gas to reionisation
a: the simulations are simply wrong and the discrepancies will disappear with better computing
x: The dark-matter-only simulations are numerically reliable; what they omit is physics, not resolution. The issue is that they leave out baryons, whose behaviour changes the predictions.
a: the observations of dwarf galaxies are too uncertain to constrain anything
x: The measurements are difficult but real, and deep surveys have genuinely changed the satellite count. Dismissing the data would not be honest, and the discrepancies are treated as real problems by the field.
hint: All three problems appear on the scales where ordinary matter's messy physics matters most. What did the simulations that produced the predictions leave out?
why: The predictions came from dark-matter-only simulations, which omit exactly the processes the previous block established as dominant: supernova-driven outflows can move gas fast enough to shift the potential and flatten a cusp into a core, and the smallest halos plausibly lost their gas to reionisation and feedback before forming stars, leaving them dark. Deep surveys finding many ultra-faint dwarfs have also reduced the satellite deficit. The state of play is genuinely unsettled — warm or self-interacting dark matter remain possible — and a model can be overwhelmingly successful while still being incomplete.
```

## Pulling the thread

- The discrepancy appears on **every scale** and is measured by methods sharing almost no assumptions — galaxy rotation, cluster virial masses, X-ray gas temperatures, lensing, the CMB, structure formation — which **all agree** on roughly **5:1**. The convergence, not any single measurement, is the argument.
- The cosmic budget is **68.5% dark energy, 26.5% dark matter, 4.9% baryons — of which stars are ~0.5%** of everything. Every object ever observed is half a per cent of the universe.
- It cannot be ordinary matter: **microlensing** excludes compact objects, **nucleosynthesis** caps the total baryon count from deuterium far below the required density, and the **CMB's third peak** requires a component that did not oscillate with the photon–baryon fluid.
- **Lensing** measures mass with no dynamical or equilibrium assumption, and the **Bullet Cluster** puts the lensing mass with the collisionless galaxies rather than with the gas that holds most of the baryons — the closest thing to a direct demonstration.
- Dark matter must be **non-baryonic, cold, collisionless, stable, and electromagnetically invisible**. Candidates abound; **direct, indirect, and collider searches have all returned null results**, and much of the WIMP's favoured parameter space is now excluded. Its gravitational behaviour is known to per-cent precision; its identity is not known at all.
- **MOND** genuinely derives flat curves, **Tully–Fisher** ($v^4 = GMa_0$), and the radial acceleration relation from one parameter, $a_0 \approx 1.2\times10^{-10}$ m/s² — but fails on **clusters, the Bullet Cluster, the CMB, and structure formation**, all of which concern matter content rather than the force law. GW170817 eliminated a class of its relativistic completions.
- Cold dark matter's own small-scale problems — **core–cusp, missing satellites, too big to fail** — are real, and **baryonic feedback** is the leading and increasingly supported resolution.

The transferable idea: **the strength of a hypothesis lies in the independence of the evidence for it, not the quantity.** One measurement repeated a thousand times remains one measurement, vulnerable to whatever systematic it harbours — the lesson of Kapteyn's extinction, of van Maanen's spurious rotations, of BICEP2's dust. Six measurements with unrelated assumptions agreeing is a qualitatively different situation, because no single error can produce them all. When assessing any contested claim, the productive audit is not "how much evidence is there?" but "**how many genuinely independent ways could this have failed, and how many did it survive?**" — and, applied honestly in the other direction, "which of the things it cannot yet explain are being politely ignored?"

## Further reading

{{book: Robert Sanders | The Dark Matter Problem: A Historical Perspective | 2010}}

{{book: Lisa Randall | Dark Matter and the Dinosaurs | 2015}}

{{book: Katherine Freese | The Cosmic Cocktail: Three Parts Dark Matter | 2014}}

Beyond the books: Zwicky's 1933 Coma paper is the discovery forty years early; Milgrom's 1983 MOND papers are worth reading directly rather than in summary, since the proposal is more carefully stated than its critics sometimes suggest; and Clowe et al.'s 2006 Bullet Cluster analysis presents the separation of lensing mass from X-ray gas in a single figure that carries the whole argument.

## Problems

*Useful numbers: G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 pc = 3.086 × 10¹⁶ m; a₀ = 1.2 × 10⁻¹⁰ m/s²; Ω_b = 0.049, Ω_dm = 0.265, Ω_Λ = 0.685; R₀ = 8.2 kpc, v_c = 235 km/s.*

**1.** *(The budget.)* **(a)** Compute the ratio of dark matter to ordinary matter. **(b)** Compute the total matter density parameter. **(c)** Given that stars contribute ~0.5% of the total energy density, what fraction of *everything* has ever been directly observed by any telescope?

**2.** *(Where MOND turns on.)* **(a)** Compute the centripetal acceleration at the Sun's orbit and express it in units of a₀. **(b)** Repeat for 50 kpc, taking v = 190 km/s. **(c)** Comment on where the transition occurs relative to where rotation curves flatten. **(d)** Compare a₀ with Earth's surface gravity and state why no laboratory tests the regime.

**3.** *(MOND's derivation of Tully–Fisher.)* In the deep-MOND regime, v⁴ = GMa₀. **(a)** Compute the predicted flat rotation speed for M = 10¹⁰, 5 × 10¹⁰, and 10¹¹ M☉. **(b)** Compare the last with the Milky Way. **(c)** Explain why this relation reproduces Tully–Fisher, and why deriving it differs from fitting it.

**4.** *(Why not baryons.)* State how each of the following excludes a baryonic explanation, and what quantity each measures: **(a)** microlensing surveys; **(b)** big bang nucleosynthesis; **(c)** the CMB's acoustic peaks.

**5.** *(Reading the peaks.)* **(a)** Explain why odd and even acoustic peaks respond differently to the baryon density. **(b)** Explain what the third peak's height is sensitive to and why. **(c)** State why this argument constrains matter *content* rather than the force law, and what that implies for modified gravity.

**6.** *(The Bullet Cluster.)* **(a)** Name the three components that can be located independently and state how each is observed. **(b)** State where each ended up after the collision, and why. **(c)** State the prediction of dark matter and of pure modified gravity, and which the observation supports. **(d)** State one limitation of the argument.

**7.** *(Hot, warm, cold.)* **(a)** Explain why hot dark matter would erase small-scale structure. **(b)** State what observation therefore excludes neutrinos as the bulk of dark matter. **(c)** Explain why "cold" is a statement about velocity rather than temperature in the thermodynamic sense.

**8.** *(Null results.)* Direct detection experiments have improved sensitivity by orders of magnitude without a confirmed detection. **(a)** Given ~10⁹ particles per square metre per second, what does the absence of detections imply about the cross-section? **(b)** Explain why this is a problem for the WIMP hypothesis specifically. **(c)** Explain why null results do not by themselves refute dark matter.

**9.** *(Weighing the alternatives.)* **(a)** List two observations MOND explains more economically than dark matter. **(b)** List three it cannot explain, and state what they have in common. **(c)** State the reasonable overall assessment in two sentences, and explain why noting a rival theory's successes is scientifically useful even when it is disfavoured.

## Worked answers

**1.** **(a)** $0.265/0.049 = \mathbf{5.4}$ — dark matter outweighs ordinary matter by about five and a half to one. **(b)** $\Omega_m = 0.049 + 0.265 = \mathbf{0.314}$. **(c)** Stars are ~0.005 of the total, so **about 0.5%** — and that is generous, since it counts all stellar mass rather than only what has actually been resolved. Everything ever seen by any telescope, in any waveband, is a half-per-cent minority of the universe's contents.

**2.** **(a)** $a = v^2/r = (2.35\times10^{5})^2/(8.2 \times 3.086\times10^{19}) = 5.52\times10^{10}/2.53\times10^{20} = \mathbf{2.2\times10^{-10}\ m/s^2} = \mathbf{1.8\,a_0}$. **(b)** $(1.9\times10^{5})^2/(50 \times 3.086\times10^{19}) = 3.61\times10^{10}/1.54\times10^{21} = \mathbf{2.3\times10^{-11}} = \mathbf{0.19\,a_0}$. **(c)** The Sun sits just above $a_0$ and 50 kpc lies well below it, so the transition occurs in the outer disk — exactly where rotation curves depart from the Keplerian prediction and flatten. That coincidence is the empirical observation MOND was constructed around, and it is what makes the proposal non-trivial rather than arbitrary. **(d)** $9.8/1.2\times10^{-10} = \mathbf{8\times10^{10}}$ — Earth's surface gravity is eighty billion times $a_0$. No terrestrial or Solar System experiment operates anywhere near this regime, which is why MOND survives Solar System tests trivially and why the regime is accessible only astronomically.

**3.** **(a)** $v = (GMa_0)^{1/4}$: for $10^{10}\,M_\odot$, $\mathbf{112\ km/s}$; for $5\times10^{10}$, $\mathbf{168\ km/s}$; for $10^{11}$, $\mathbf{200\ km/s}$. **(b)** The Milky Way's rotation speed is ~235 km/s for a stellar mass of roughly $5\times10^{10}\,M_\odot$ plus ~10¹⁰ of gas — so the prediction is in the right range, within the uncertainties on baryonic mass. **(c)** Since $v^4 = GMa_0$ gives $v^4 \propto M$, and stellar mass tracks luminosity, $L \propto v^4$ follows immediately — which is Tully–Fisher. The distinction from fitting is that MOND could not have avoided this prediction: it emerges from the premise with one parameter and no freedom. Dark-matter models reproduce the relation through halo structure plus self-regulating feedback, which works but was not compelled, and the tightness of the observed relation remains something they must arrange rather than something they force.

**4.** **(a)** **Microlensing** counts brightening events as compact objects transit background stars, measuring the **abundance of MACHOs** across a range of masses; the observed rate is far too low for compact objects to constitute the halo. **(b)** **Nucleosynthesis** measures the **primordial baryon density** through the deuterium abundance in pristine gas, since deuterium yields depend sharply on baryon density and stars only destroy it; the result caps baryons near 5% of critical against ~31% required, so there are not enough baryons in existence in any form. **(c)** The **CMB peaks** measure both the **baryon density** (through odd/even peak ratios) and the **total non-interacting matter density** (through the third peak's height); a baryon-only universe produces a demonstrably different pattern from the one observed.

**5.** **(a)** Before recombination, photons and baryons formed one fluid oscillating in gravitational wells. Odd peaks correspond to maximum **compression**, even peaks to maximum **rarefaction**. Baryons add inertia without pressure, so they deepen compressions while leaving rarefactions essentially unchanged — making odd peaks higher relative to even ones as the baryon density rises. **(b)** The **third peak's height relative to the second** is sensitive to how much **non-interacting matter** was present, because such matter sits in the wells and holds them deep against the radiation pressure that would otherwise damp the oscillations away. More of it boosts the later peaks. **(c)** The argument turns on the **existence of a component that does not couple to photons** — a statement about what kinds of matter are present, not about how strongly matter attracts. Altering the force law cannot supply a species that fails to interact with radiation, so modified gravity cannot reproduce the observed peak structure without adding, in effect, dark matter.

**6.** **(a)** **Galaxies**, seen in visible light; **hot gas**, seen in X-rays, holding most of the ordinary matter; and **mass**, mapped by gravitational lensing. **(b)** The galaxies passed through, being tiny compared with their separations and effectively collisionless; the gas was **left behind in the middle**, because gas is collisional and the two clouds shocked against each other; the lensing mass is found **with the galaxies**. **(c)** Dark matter, being collisionless, predicts the mass tracks the galaxies; pure modified gravity predicts the gravitational signal must follow the ordinary matter, which is overwhelmingly the gas. The observation supports **dark matter**. **(d)** A hybrid theory combining modified gravity with some non-luminous matter can accommodate the result, and clusters were already known to require extra unseen mass on MOND's terms — so the observation refutes the simplest version of the alternative rather than the entire class.

**7.** **(a)** A relativistic particle **free-streams** out of small density perturbations before they can collapse, smoothing them away and leaving only large-scale structure to form first — a "top-down" sequence. **(b)** The existence of **small galaxies, including dwarf satellites and early low-mass galaxies**, excludes this: hot dark matter would have erased the perturbations that produced them. Neutrinos, once the leading candidate, are ruled out as the bulk component on exactly this basis. **(c)** "Cold" means the particles were **moving slowly compared with light** when structure formation began, so their free-streaming length was negligible. It is a statement about velocity dispersion relative to the scales of interest, not about thermodynamic temperature — a heavy particle in thermal equilibrium at a high temperature can still be "cold" in this sense if its mass makes it non-relativistic.

**8.** **(a)** With ~10⁹ particles crossing every square metre each second and no confirmed signal despite detectors of tonne scale and years of exposure, the **interaction cross-section with ordinary matter must be extraordinarily small** — successive experiments have pushed limits down by many orders of magnitude, into regions where even neutrino backgrounds begin to interfere. **(b)** The WIMP was attractive because a particle with roughly weak-scale interactions and mass naturally freezes out with about the observed abundance — the "WIMP miracle". That argument specifies a cross-section, and much of the corresponding parameter space has now been excluded without a detection, weakening the case for the most theoretically motivated candidate. **(c)** Because the gravitational evidence is independent of any particle hypothesis: rotation curves, lensing, cluster masses, and the CMB establish that the mass is there regardless of what it is. Null results constrain **which candidate** is correct, not **whether** the phenomenon exists — though they legitimately increase the motivation to examine alternatives.

**9.** **(a)** The **Tully–Fisher relation**, derived as $v^4 = GMa_0$ from one parameter rather than accommodated; and the **radial acceleration relation**, in which observed acceleration is a tight function of the acceleration predicted from visible matter alone across many galaxy types. **(b)** The **CMB's third acoustic peak**, the **growth of cosmic structure**, and the **Bullet Cluster's** separation of lensing mass from baryons. What they share is that each concerns the **existence of a particular kind of matter** rather than the strength of the gravitational force — and no modification of a force law can supply a component that does not interact with photons or that sits somewhere the baryons are not. **(c)** Dark matter is strongly favoured, because it succeeds across every scale from galaxies to the whole universe while MOND fails above galactic scales on evidence that force-law changes cannot address. But MOND's galaxy-scale successes encode a genuine regularity that dark-matter models must work to reproduce, and noting a rival's successes is how the favoured theory's unfinished business gets identified — treating them as embarrassments to be minimised would leave a real feature of galaxies unexplained and unexamined.$mwMissingMass_master$,
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
