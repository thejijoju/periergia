-- Astronomy & Space · The Extragalactic Universe — Active Galaxies — "AGN".
-- Curated master for astronomy-and-space/extragalactic/active-galaxies/agn
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the Active Galaxies block. The chapter the Formation & Evolution
-- chapter handed off to when it established that only black-hole accretion
-- has the energy budget to regulate massive galaxies. What an active
-- nucleus is; the variability argument that fixes the emitting size at a
-- few AU before anything is resolved, and the energy-density contradiction
-- that forces gravity rather than fusion; the Eddington limit and the
-- Salpeter time, worked through to the 800 Myr needed to grow a billion
-- solar masses from a stellar seed - which is the next chapter's problem
-- stated in advance; the anatomy from Schwarzschild radius to narrow-line
-- region, every scale of it measured by timing or line width rather than
-- imaging; reverberation mapping carried through to a black-hole mass,
-- with the virial factor named as the honest weakness holding up the whole
-- quasar mass ladder; the zoo and the unification argument, with Antonucci
-- & Miller's 1985 spectropolarimetry of NGC 1068 set out as the decisive
-- experiment; and then where unification stops - changing-look AGN,
-- radio-loudness, the clumpy torus - and why "one object seen from
-- different angles" is too strong. ~10,000 words, multi-question
-- checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/active-galaxies/agn',
    'research',
    'advanced',
    'read',
    $egAgn_master$> An active galactic nucleus outshines the hundred billion stars of its host galaxy from a region smaller than the Solar System. That sentence contains the entire problem, and both halves of it were established before anyone could resolve such a nucleus, or knew what was in it, or believed in black holes. How a size was measured for an unresolvable object, and what the measurement forces, is the most instructive thing in this subject.

The previous block ended with an argument that required black holes without describing them. Galaxy formation cannot work without a high-mass suppression channel; supernovae are hopelessly outmatched in a cluster-scale halo; and accretion onto a compact object is the only process with the necessary energy yield, converting of order **10 per cent** of infalling rest mass against fusion's **0.1 per cent**. That argument named black-hole accretion as a requirement of galaxy formation. This block is about the thing itself.

Start with what is observed, because the inference chain from observation to black hole is short, quantitative, and does not depend on any prior belief that black holes exist.

## What forces the conclusion

Three facts about active nuclei, each independently measurable.

**They are extremely luminous.** A luminous quasar radiates around $10^{46}$ erg/s — roughly $3\times10^{12}$ solar luminosities, a hundred times the entire stellar output of the Milky Way, from a region at the centre of a galaxy.

**They vary rapidly.** Much of that output changes measurably on timescales of hours to days, particularly in X-rays.

**Their spectra are unlike stars.** They emit strongly across the entire electromagnetic spectrum, from radio to gamma rays, in a broad continuum that no superposition of stellar spectra reproduces.

The second fact does the decisive work, through an argument worth stating carefully because it recurs throughout astrophysics.

**A source cannot vary coherently on a timescale shorter than the light-crossing time of its emitting region.** If a region of size $R$ brightens everywhere at once, the news from its far side arrives $R/c$ later than the news from its near side, so the observed brightening is smeared over at least $R/c$ regardless of how fast the source actually changed. Observing a variation on timescale $\Delta t$ therefore bounds the size:

$$R \lesssim c\,\Delta t$$

For a one-hour X-ray variation, $R \lesssim 1.1\times10^{12}$ m — about **7 astronomical units**, inside the orbit of Saturn.

Now put the two together. **A hundred Milky Ways' worth of luminosity, from a volume smaller than the Solar System.** No stellar population can do this: packing enough stars into that volume to supply the luminosity gives a stellar density at which the system would collapse or the stars would physically collide, and in any case a star cluster cannot vary coherently, since its members are causally disconnected on hour timescales.

The energy source must therefore be a **single coherent object**, it must be **compact**, and it must be far more efficient per unit mass than fusion — because a fusion-powered engine of that luminosity would consume its own mass in a time short compared with the observed lifetimes of these sources.

Gravitational accretion onto a compact object satisfies all three. Matter falling toward a body of mass $M$ releases of order $GM/R$ per unit mass, and for an object as compact as a black hole that is a substantial fraction of $c^2$. The observed efficiency, ~10 per cent, corresponds to matter releasing its binding energy down to a few Schwarzschild radii before crossing the horizon.

Notice what has and has not been assumed. **The argument establishes compactness and efficiency from timing and luminosity alone.** General relativity enters only at the end, to identify what kind of compact object can be that small and that efficient.

```checkpoint
q: An active nucleus varies measurably in X-rays over about an hour. What does this establish?
a: That the accretion rate changes on an hourly cycle, driven by orbital motion at the inner disk edge
x: Orbital timescales near a black hole are indeed short, and may well drive the variability — but the inference from the observation is about *size*, and holds whatever the physical cause of the change.
a*: That the emitting region is smaller than about a light-hour across — roughly 7 AU — because a larger region cannot brighten coherently faster than light crosses it
a: That the source is close enough for the variation to be detectable, placing an upper bound on its distance
x: Variability amplitude is independent of distance; a variable source is recognisable as variable at any distance where it is detectable at all.
a: That the emission comes from a region of low optical depth, since opaque regions cannot vary quickly
x: Optical depth affects how a variation is smeared in detail, but the fundamental limit is causal — light-crossing time — and applies regardless of opacity.
hint: If the far side of a region brightens at the same instant as the near side, when does each piece of news reach you?
why: A region of size R cannot be seen to change coherently faster than R/c, because signals from its parts arrive spread over that interval no matter how abruptly the source itself changed. An hour therefore caps the emitting region at ~1.1 × 10¹² m, about 7 AU. Combined with luminosities near 10⁴⁶ erg/s — a hundred Milky Ways — this rules out any stellar origin: no cluster small enough could supply the power without collapsing, and no cluster could vary coherently, its members being causally disconnected on that timescale. The conclusion of compactness plus extreme efficiency comes from timing and photometry alone, before any relativity is invoked.
---
q: Accretion onto a black hole releases about 10% of the infalling rest-mass energy, against roughly 0.1% for hydrogen fusion. Where does that factor of a hundred come from?
a: Nuclear binding energy is released more completely in the extreme gravitational field near a black hole
x: The fusion yield of 0.1% is set by nuclear physics — the mass defect between four protons and a helium nucleus — and is unchanged by the surrounding gravitational field.
a*: From gravity rather than nuclear physics: matter falling to within a few Schwarzschild radii releases binding energy of order GM/R per unit mass, and at those radii GM/R is a sizeable fraction of c²
a: From the annihilation of matter with antimatter created near the event horizon
x: Hawking radiation is utterly negligible for a supermassive black hole, and no pair-annihilation process supplies accretion luminosity. The energy is released before the matter reaches the horizon.
a: From the black hole's rotational energy, which is the sole power source in all accreting systems
x: Rotational energy extraction is real and matters for jets, but standard accretion luminosity comes from the release of gravitational binding energy by infalling matter, and applies to non-rotating holes too.
hint: Write down the energy released per unit mass in falling from far away to radius R.
why: The two efficiencies come from different physics entirely. Fusion's 0.1% is the mass defect of the proton-proton chain, fixed by nuclear binding energies. Accretion's ~10% is gravitational: a unit mass falling from rest at infinity to radius R releases ~GM/R, and since R_s = 2GM/c², reaching a few Schwarzschild radii means releasing a sizeable fraction of c² itself. The compactness of the object is therefore what buys the efficiency — the deeper the potential well the matter descends before its energy stops being radiated, the higher the yield. This is why the Formation & Evolution chapter's argument works: nothing powered by fusion can regulate a cluster-scale halo, but something powered by gravity at these depths can.
```

## The Eddington limit

The second structural constraint comes from the fact that radiation pushes back.

Radiation streaming out of an accreting object scatters off electrons in the infalling gas, transferring momentum outward. Because electrons and protons are electrostatically coupled, the pressure exerted on the electrons resists the infall of the whole plasma. Setting the outward radiation force equal to the inward gravitational force on an ionised hydrogen plasma gives the **Eddington luminosity**:

$$L_{\rm Edd} = \frac{4\pi G M m_p c}{\sigma_T} \approx 1.26\times10^{38}\left(\frac{M}{M_\odot}\right)\ \mathrm{erg\ s^{-1}}$$

Above this, radiation pressure exceeds gravity and the accretion flow is disrupted. It is not an absolute ceiling — geometry can beat it, and super-Eddington flows exist — but it is the natural scale, and treating it as one yields two immediate results.

**A luminosity implies a minimum mass.** A quasar radiating $10^{46}$ erg/s must have $M \gtrsim 10^{8}\,M_\odot$. This is how the *supermassive* in supermassive black hole was established: not by weighing anything, but by noting how bright these objects are and how hard it is to exceed Eddington by a large factor.

**Growth has a characteristic timescale.** If a black hole accretes at its Eddington rate, its luminosity — and therefore its accretion rate — is proportional to its mass, so its mass grows **exponentially**. The e-folding time is the **Salpeter time**:

$$t_S = \frac{\eta}{1-\eta}\frac{M c^2}{L_{\rm Edd}} \approx 5\times10^{7}\ \mathrm{yr} \quad (\eta = 0.1)$$

Fifty million years per e-folding. That number carries a consequence worth stating now, because the next chapters are built on it. Growing from a stellar-mass seed of $100\,M_\odot$ to a billion solar masses requires $\ln(10^7) \approx 16$ e-foldings, hence about **800 million years of uninterrupted Eddington-limited accretion**.

Quasars of a billion solar masses are observed at redshifts beyond 7, when the universe was under 700 million years old.

**The arithmetic does not close.** There is not enough time to grow such a black hole from a stellar remnant even under continuous, maximally efficient accretion beginning at the moment the first stars formed. Something must be wrong with one of the inputs — the seed mass, the efficiency, the assumption of a single continuous episode, or the Eddington limit itself. That is the seed problem, and the Supermassive Black Holes chapter takes it up directly. It is worth meeting here as a *consequence of two formulae* rather than as an announced mystery, because that is how it was encountered.

```checkpoint
q: The Eddington luminosity is the point at which radiation pressure on infalling plasma balances gravity. Its most important immediate use in AGN studies is that
a: it sets the maximum possible luminosity of any astronomical object
x: It applies to spherical accretion onto a gravitating body, not to luminosity in general — supernovae and gamma-ray bursts exceed it enormously, and even accreting systems can exceed it with the right geometry.
a*: it converts an observed luminosity into a minimum mass, which is how supermassive black holes were shown to be supermassive without anything being weighed
a: it fixes the radiative efficiency of accretion at about 10 per cent
x: Efficiency is set by how deep in the potential the energy is released before the matter crosses the horizon, and is independent of the Eddington argument.
a: it explains why active nuclei vary on timescales of hours
x: Variability timescales come from the light-crossing and orbital times of the emitting region; the Eddington limit says nothing about them.
hint: The formula is a luminosity proportional to a mass. If you measure one, what do you get?
why: Since L_Edd ≈ 1.26 × 10³⁸ (M/M☉) erg/s, an object radiating 10⁴⁶ erg/s needs at least ~10⁸ M☉ unless it substantially exceeds Eddington — which is possible but not by large factors for sustained periods. So a photometric measurement plus one formula yields a mass floor, and applying it to quasars established that their central objects are of order 10⁸–10¹⁰ M☉. That inference was available long before any dynamical mass measurement, and it is what put the "supermassive" into supermassive black hole.
---
q: A black hole accreting at the Eddington rate grows exponentially with an e-folding time of about 50 Myr. Growing a 10⁹ M☉ quasar from a 100 M☉ stellar seed therefore needs roughly 800 Myr — yet such quasars are observed when the universe was under 700 Myr old. The correct reading is that
a: the observed quasar masses must be wrong, since the growth calculation is exact
x: The growth calculation rests on several assumptions — seed mass, efficiency, continuous Eddington accretion — any of which may fail. It is not more secure than the mass measurements.
a*: at least one input to the calculation must be wrong — the seed mass, the radiative efficiency, the assumption of continuous Eddington-limited accretion, or the Eddington limit as a hard ceiling
a: black holes must therefore grow faster than light-crossing arguments allow, violating relativity
x: Nothing in the growth calculation approaches a relativistic limit; the constraint is about available time and accretion physics, not causality.
a: the universe must be older than currently believed
x: Cosmic age at a given redshift is fixed by well-measured cosmological parameters and is among the most robust quantities in the subject; revising it to fix an accretion problem inverts the reliability ordering.
hint: The conclusion follows from a chain of assumptions. Which links are actually load-bearing?
why: Exponential growth at fixed Eddington ratio gives M(t) = M_seed exp(t/t_S), so reaching 10⁹ M☉ from 100 M☉ takes ln(10⁷) ≈ 16 e-foldings, about 800 Myr at η = 0.1 — longer than the universe had at z > 7. Since the observation is solid, an assumption must fail, and each candidate is a live research programme: heavier seeds from direct collapse of pristine gas (10⁴–10⁵ M☉), lower radiative efficiency leaving more mass to be retained, episodes of super-Eddington accretion, or growth by mergers of seeds. Meeting the problem as arithmetic rather than as an announced mystery is how it was actually encountered, and it makes clear that the resolution must lie in one of four specific places.
```

## Anatomy of a nucleus

The standard picture assembles a set of components at very different scales. What matters pedagogically is that **almost none of these scales was measured by imaging** — they were measured by timing, by line widths, and by spectral energy distributions, because until very recently nothing could resolve them.

Working outward, for a black hole of $10^8\,M_\odot$:

**The black hole.** Schwarzschild radius $R_s = 2GM/c^2 \approx 3\times10^{11}$ m, about **2 AU**. Note that the one-hour variability bound of 7 AU is only a few $R_s$ — the X-rays come from essentially the innermost region.

**The accretion disk**, from a few $R_s$ out to perhaps $10^3\,R_s$. Gas spirals inward, viscous dissipation heats it, and it radiates roughly as a superposition of blackbodies with temperature rising inward. The integrated result is the **big blue bump**, the broad ultraviolet excess that dominates an AGN's bolometric output. Its temperature is a mass diagnostic: larger black holes have cooler inner disks, because the innermost stable orbit lies at larger physical radius where the same energy is spread over more area.

**The X-ray corona**, a compact region of hot, optically thin plasma above the inner disk. Disk photons are inverse-Compton scattered by relativistic electrons there, producing the characteristic hard X-ray power law. This is the component that varies on hours.

**The broad-line region (BLR)**, at **light-days to light-months** — $10^{-3}$ to $10^{-1}$ pc. Dense gas clouds orbiting fast enough to Doppler-broaden emission lines to widths of a few thousand km/s. Its density is high enough to collisionally suppress forbidden lines, so it shows permitted lines only — a diagnostic that separates it cleanly from gas further out.

**The dusty torus**, at roughly **1–10 pc**. Its inner edge is not arbitrary: it sits at the **dust sublimation radius**, where the nucleus's radiation heats grains to ~1,500 K and destroys them. Inside that radius dust cannot exist; outside it can. This obscuring structure is the crux of the unification argument below.

**The narrow-line region (NLR)**, at **100–1,000 pc**, extending well outside the torus and often resolvable. Lower density gas moving at a few hundred km/s, so its lines are narrow — and low enough in density that **forbidden lines** such as [O III] are strong. The presence of forbidden lines is itself a density measurement, since they are collisionally de-excited at high density.

**Jets**, when present, extending from sub-parsec scales to hundreds of kiloparsecs — the subject of its own chapter.

The line-width logic deserves emphasis because it is doing real work. **Line width is a velocity, velocity in a gravitational field is a radius, and forbidden-line strength is a density.** Two spectral features, requiring no spatial resolution, thus separate the emitting gas into distinct physical zones — and the resulting picture was later confirmed when interferometry and adaptive optics finally reached those scales.

```checkpoint
q: The broad-line region shows only permitted emission lines, while the narrow-line region shows strong forbidden lines such as [O III]. This difference is primarily a measurement of
a: temperature, since forbidden transitions require hotter gas to be excited
x: Both regions are photoionised to comparable temperatures of order 10⁴ K; the excitation energies involved do not distinguish them.
a*: density — forbidden transitions have long radiative lifetimes, so at high density the excited atom is collisionally de-excited before it can radiate, suppressing the line
a: chemical composition, since the broad-line region lacks oxygen
x: The broad-line region is metal-rich, often super-solar. Oxygen is present; its forbidden lines are simply suppressed.
a: distance from the black hole, measured directly from the line's wavelength
x: Wavelength gives redshift and velocity, not distance from the nucleus. The radial information comes from line width via the virial argument, and separately from reverberation lags.
hint: What has to happen to an excited atom before it can emit a forbidden line?
why: A forbidden transition has a very small spontaneous emission rate, so the excited state persists a long time. If the gas is dense enough that a collision arrives first, the energy is removed collisionally and no photon is emitted — the line is quenched. Forbidden lines therefore appear only below a critical density characteristic of each transition. Their absence in the broad-line region and prominence in the narrow-line region is thus a direct density diagnostic, separating two physically distinct zones from spectra alone. Combined with line width read as an orbital velocity and hence a radius, two spectral properties map the geometry of a source nobody could resolve.
---
q: The dusty torus has a sharply defined inner edge rather than extending inward indefinitely. What sets its location?
a: The black hole's tidal field, which shreds dust grains inside a critical radius
x: Tidal forces at parsec scales from a 10⁸ M☉ black hole are far too weak to affect microscopic grains, which are held together by molecular rather than gravitational forces.
a*: The dust sublimation radius — inside it the nucleus's radiation heats grains past roughly 1,500 K and vaporises them, so dust simply cannot exist there
a: The broad-line region's outer boundary, beyond which gas is free to condense into dust
x: This inverts the causal order: the broad-line region is dust-free because it lies inside the sublimation radius, not the other way round.
a: The radius at which the accretion disk becomes gravitationally unstable and fragments
x: Disk self-gravity does matter at large radii and may help supply the torus with material, but the sharp inner boundary is thermal — set by where grains survive.
hint: Dust is solid. What does intense radiation do to a solid grain?
why: Grains absorb the nucleus's radiation and heat up, and above roughly 1,500 K they sublimate. The inner edge of the torus therefore sits where the radiative flux drops enough for grains to survive — a radius that scales as the square root of the luminosity, since flux falls as 1/r². This is a genuinely predictive relation, and it matters beyond geometry: it explains why the fraction of obscured objects falls as luminosity rises, since a more luminous nucleus pushes its sublimation radius outward and its obscuring structure subtends a smaller solid angle. A thermal condition on solid particles thus feeds directly into the demographics of the AGN population.
```

{{image: Messier 77 | Messier 77 (NGC 1068), the nearest and best-studied Seyfert 2 galaxy. Its nucleus shows only narrow emission lines directly — but in polarised light, broad lines appear, because dust and electrons off the axis scatter light from a broad-line region hidden behind the obscuring torus. That 1985 observation is the founding evidence that Seyfert 1s and Seyfert 2s are the same kind of object seen from different directions.}}

## Weighing a black hole you cannot resolve

Reverberation mapping is the technique that turned AGN from a photometric subject into a quantitative one, and its logic is elegant enough to set out fully.

The nucleus's ionising continuum varies. The broad-line clouds are photoionised by that continuum, so their line emission varies too — but **later**, by the light travel time from the continuum source to the clouds. Cross-correlating the continuum light curve with the emission-line light curve yields a lag $\tau$, and

$$R_{\rm BLR} = c\,\tau$$

**The light travel time is used as a ruler.** No resolution is required; a telescope that cannot separate the nucleus from its host can still measure a radius of $10^{-2}$ pc at a distance of hundreds of megaparsecs, provided it can measure a lag.

With a radius in hand, the line width supplies a velocity, and the virial theorem supplies a mass:

$$M_{\rm BH} = f\,\frac{R_{\rm BLR}\,\Delta v^2}{G}$$

A concrete case: $R = 10$ light-days and $\Delta v = 5{,}000$ km/s give

$$M \approx \frac{(2.59\times10^{14})(5\times10^{6})^2}{6.674\times10^{-11}} = 9.7\times10^{37}\ \mathrm{kg} \approx 5\times10^{7}\,M_\odot$$

which is the right order for a well-studied Seyfert such as NGC 5548.

**Now the honest weakness.** The factor $f$ absorbs everything unknown about the broad-line region's geometry and kinematics — whether the clouds form a flattened rotating distribution or a spherical one, whether there is a net inflow or outflow, and how the observed line width relates to the true orbital velocity. It is of order unity but is not calculable from first principles; it is **calibrated** by requiring that reverberation-mapped AGN masses agree, on average, with masses from the $M$–$\sigma$ relation measured in quiescent galaxies.

This matters more than it appears, because of what is built on top. Reverberation campaigns are expensive — years of monitoring per object — so only of order a hundred AGN have direct measurements. From those, an empirical **radius–luminosity relation** is derived, roughly $R_{\rm BLR} \propto L^{0.5}$, which is close to what constant ionisation conditions would predict. That relation lets a *single spectrum* of any quasar yield a radius from its luminosity and a velocity from its line width, hence a mass. **Essentially every quasar mass in the literature comes from this ladder.**

So the entire quasar mass scale rests on: a lag measurement, an assumed virial relation, a geometric factor calibrated against a different technique in different objects, and an extrapolated scaling relation. Each step is defensible; the stack is not as firm as a single quoted mass makes it look. **When a quantity is quoted for a hundred thousand objects but measured directly in a hundred, it is worth knowing which one you are reading.**

```checkpoint
q: Reverberation mapping measures the size of the broad-line region without resolving it. The measurement works because
a: the broad emission lines are Doppler-broadened, and line width converts directly to radius
x: Line width gives a velocity. Converting it to a radius requires a mass, which is what the technique is trying to determine — so this alone would be circular.
a*: the broad-line clouds respond to changes in the ionising continuum after a delay equal to the light travel time between them, so the measured lag is a distance
a: the light from the broad-line region is polarised, and the polarisation angle encodes the geometry
x: Polarisation is central to detecting *hidden* broad lines in Seyfert 2s, but it is not what makes reverberation mapping a distance measurement.
a: interferometric baselines resolve the region directly at infrared wavelengths
x: Infrared interferometry has now reached these scales in a few bright objects, which is a valuable independent check — but reverberation mapping long predates it and requires no resolution at all.
hint: The continuum changes; the lines follow. What sets how long they take?
why: The clouds are photoionised by the central continuum, so when it brightens they brighten — but only after light has crossed the gap between them. Cross-correlating the two light curves gives a lag τ, and R = cτ. Light travel time is being used as a ruler, so a telescope that cannot separate the nucleus from its host still measures 10⁻² pc at hundreds of Mpc. Adding the line width as an orbital velocity gives M = f R Δv²/G — for R = 10 light-days and Δv = 5,000 km/s, about 5 × 10⁷ M☉.
---
q: Quasar black-hole masses are quoted for hundreds of thousands of objects, but reverberation mapping has been carried out for only about a hundred. What should a reader understand about the rest?
a: They were measured by resolving the black hole's sphere of influence, which is feasible at quasar distances
x: The sphere of influence of even a 10⁹ M☉ black hole is far too small to resolve at cosmological distances; that technique works only for nearby galaxies.
a*: They come from a calibrated ladder — a radius inferred from luminosity via an extrapolated R ∝ L^0.5 relation, a velocity from line width, and a geometric factor f itself calibrated against the M–σ relation in other galaxies
a: They are lower limits derived from the Eddington luminosity alone
x: Eddington arguments do give useful mass floors, but the quoted single-epoch masses are virial estimates from the reverberation ladder, not Eddington limits.
a: They are unreliable to the point of being meaningless and should be disregarded
x: The ladder is defensible at each step and the masses are useful in aggregate; the point is to know their provenance and their systematic uncertainty, not to discard them.
hint: Trace where the number actually comes from, step by step.
why: Direct reverberation is expensive — years of monitoring per object — so it is used to establish an empirical radius–luminosity relation, roughly R ∝ L^0.5, consistent with the clouds sitting at similar ionisation conditions. A single spectrum then yields a radius from the luminosity and a velocity from the line width, hence a virial mass. The dimensionless factor f, which encodes the unknown geometry and kinematics of the broad-line region, is not calculable and is fixed by requiring agreement with M–σ masses in quiescent galaxies. Every step is reasonable and the stack is still a stack: when a quantity is measured directly in a hundred objects and quoted for a hundred thousand, knowing which you are reading is part of reading it.
```

## The zoo, and the argument that it is one animal

Active nuclei were discovered piecemeal and named accordingly, so the classification is a historical accretion rather than a system.

- **Seyfert galaxies** — nearby spirals with bright nuclei, split into **Seyfert 1** (both broad and narrow emission lines) and **Seyfert 2** (narrow lines only).
- **Quasars** — the high-luminosity extreme, outshining their hosts so completely that they appear stellar. Type 1 and type 2 versions exist, mirroring the Seyfert split.
- **Radio galaxies** — typically ellipticals with powerful radio emission from jets and lobes, again with broad-lined and narrow-lined varieties.
- **Blazars** — extremely variable, highly polarised, sometimes with almost no emission lines at all.
- **LINERs** — low-ionisation nuclei, very common, whose power source is not always an AGN at all.

Roughly **10 per cent** of AGN are **radio-loud**, with powerful large-scale jets; the rest are radio-quiet.

The **unified model** proposes that most of this variety is **orientation**. A geometrically thick, dusty torus surrounds the nucleus. Looking down the axis, one sees the accretion disk and the broad-line region directly: a **type 1**. Looking through the torus, the inner regions are blocked while the narrow-line region — being far larger than the torus — remains visible: a **type 2**. One object, two appearances.

This is an appealing hypothesis and also a suspiciously convenient one, since it explains a difference by appealing to something unobservable. It needed a decisive test, and it got one.

### The experiment

In 1985, Antonucci and Miller observed **NGC 1068**, the archetypal Seyfert 2, in **polarised light**.

The reasoning is worth spelling out. If a broad-line region really is present but hidden behind a torus, then light from it that escapes along the *axis* can scatter off material above the nucleus — free electrons and dust — and be redirected toward us. Scattering **polarises** light, and it polarises it in a direction determined by the scattering geometry. So the scattered component is distinguishable from the direct component not by its wavelength but by its **polarisation**.

Isolating the polarised flux, they found **broad Balmer lines** — the signature of a type 1 nucleus — in an object whose direct spectrum showed none.

The scattering material acts as a **periscope**: it lets an observer blocked from the nucleus see it from a different direction. The hidden broad-line region was not inferred from a model; it was observed, by using the geometry of polarisation to select light that had taken an indirect path.

That is why this experiment settled the question where accumulating correlations would not have. **A correlation between orientation indicators and type would always have admitted the reading that the two classes are intrinsically different and merely happen to correlate. Seeing the hidden component directly does not.** The general form is worth keeping: when a hypothesis says "the thing is there but blocked," the decisive test is to find a path around the block, not to gather more evidence consistent with it being there.

```checkpoint
q: Antonucci & Miller detected broad emission lines in the polarised spectrum of NGC 1068, a galaxy whose direct spectrum shows only narrow lines. Why is polarisation the key to the measurement?
a: Broad lines are intrinsically polarised while narrow lines are not, so polarisation separates them by origin
x: Neither region emits intrinsically polarised light in this way. The polarisation is imposed by scattering en route, not by the emitting gas.
a*: Scattering polarises light, so the polarised component isolates photons that reached us indirectly — light that escaped along the axis and was redirected toward us, bypassing the obscuring torus
a: The torus polarises the light passing through it, encoding what lies behind
x: Passage through dust produces some polarisation by dichroic extinction, but the broad lines here are absent from the transmitted light entirely; they arrive only via the scattered path.
a: Polarisation measurements have higher spectral resolution, revealing lines too faint to see otherwise
x: Spectropolarimetry costs signal-to-noise rather than gaining it. The advantage is selectivity of light path, not sensitivity or resolution.
hint: What happens to a photon's polarisation when it bounces off something?
why: The unified model claims a broad-line region exists in Seyfert 2s but is hidden behind the torus. Light from it escaping along the unobscured axis can scatter off electrons and dust above the nucleus and be redirected toward us, and scattering imposes a polarisation with a geometry-dependent orientation. Isolating the polarised flux therefore selects precisely the indirectly routed photons — and there the broad Balmer lines appear. The scatterer works as a periscope, letting a blocked observer see the nucleus from another direction. This is why the experiment settled the matter: a correlation between orientation and type would still permit two intrinsically different populations, but directly detecting the hidden component does not.
---
q: Some AGN have been observed changing between type 1 and type 2 over months to years. What does this establish about the unified model?
a: That the unified model is wrong and Seyfert 1s and 2s are intrinsically different populations after all
x: Too strong. The spectropolarimetric detection of hidden broad-line regions stands, and orientation demonstrably explains much of the population. Changing-look objects bound the model rather than overturning it.
a*: That orientation cannot be the whole explanation — nothing reorients a parsec-scale structure on a yearly timescale, so at least part of the type distinction must reflect changes of state or clouds crossing the line of sight
a: That the torus must be much smaller than one parsec, so that reorientation on yearly timescales becomes possible
x: A torus small enough to reorient in years would be well inside the dust sublimation radius for these luminosities, where dust cannot survive — and the infrared emission independently locates it at parsec scales.
a: That the black hole masses in these objects were measured incorrectly
x: Nothing in the type transition bears on the mass determination, and changing-look objects span the same mass range as ordinary AGN.
hint: How long would it take to swing a structure a parsec across, or to swing our viewpoint around it?
why: A parsec-scale torus has an orbital timescale of many thousands of years, and our viewing angle onto it is fixed for far longer than that, so no geometric reconfiguration can produce a type change in months. The transitions must instead come from a genuine change in accretion rate — the ionising continuum switching the broad lines on or off — or from individual obscuring clouds drifting across the sightline, which a clumpy torus makes natural. The lesson is about how models get bounded rather than refuted: orientation remains a large and well-evidenced part of the answer, and the mature picture simply adds axes — accretion rate and jet production — alongside it, with the historical zoo a projection of that space onto whatever was observable when each class was named.
```

{{image: Centaurus A | Centaurus A, the nearest active galaxy: an elliptical crossed by a thick dust lane left by a merger, with jets launched from its nucleus reaching far beyond the visible galaxy. It shows the two threads of this block joined — a merger delivering gas to the centre, and an accreting black hole converting a small part of it into an output that reshapes the surroundings on scales the galaxy itself does not reach.}}

## Where unification stops

Orientation explains a great deal. It does not explain everything, and the places it fails are where the current research is.

**Changing-look AGN.** A number of objects have been observed transitioning between type 1 and type 2 — broad lines appearing or vanishing over months to years. **Orientation cannot do this.** Reorienting a parsec-scale torus takes far longer than a human lifetime, and nothing plausible moves that fast. These transitions must reflect genuine changes in the accretion rate, or obscuring clouds crossing the line of sight — which means at least some of the type 1/type 2 distinction is about **state**, not geometry.

**Radio-loudness is not orientation.** Whether a nucleus launches powerful large-scale jets is not explicable by which way it is pointed: the ~10 per cent radio-loud fraction correlates with host galaxy type — jets favour ellipticals — and probably with black-hole spin and accretion mode. Orientation determines how a jet *appears* (a blazar being a jet viewed nearly along its axis, its emission relativistically beamed), but not whether one exists.

**The torus is not a donut.** A smooth dust torus of the required thickness is difficult to sustain: it would need vertical motions comparable to its orbital velocity, and it would be dynamically short-lived. The modern picture replaces it with a **clumpy** distribution of dusty clouds, which fits infrared spectra better and has a natural consequence: obscuration becomes **probabilistic** rather than deterministic. A given line of sight may be blocked or clear depending on cloud positions, so the crisp type 1 / type 2 dichotomy softens into a distribution — and an object can change type without anything reorienting.

**Covering factor depends on luminosity.** The fraction of type 2 objects falls as luminosity rises, consistent with the "receding torus" idea: a more luminous nucleus sublimates dust further out, so the obscuring structure subtends a smaller solid angle. Orientation statistics therefore vary systematically with luminosity, which a purely geometric model with a universal torus does not predict.

The honest summary is that **orientation is a large part of the answer and not the whole of it.** The mature version of the model has at least three axes — orientation, accretion rate relative to Eddington, and jet production — and the classical zoo is a projection of that space onto whatever was observable when each class was named. Which is the same lesson the Hubble Sequence chapter drew about galaxy morphology, arrived at independently: **a historical taxonomy tends to record the observables available at the time rather than the variables that matter.**

## Activity as a phase, not a class

A final reframing that the rest of this block depends on.

Essentially every massive galaxy contains a supermassive black hole, but only a small percentage are active at any moment. Activity is therefore not a property distinguishing some galaxies from others — it is a **phase** that most galaxies pass through repeatedly, when gas reaches the centre.

The evidence for episodic activity is direct. Radio galaxies show multiple pairs of lobes at different distances, the relics of successive outbursts. X-ray cavities in cluster gas come in nested sets. And **Hanny's Voorwerp** — the illuminated cloud beside IC 2497 met in the Hubble Sequence chapter — is a light echo from a nucleus that has since switched off, its ionisation state recording a luminosity the nucleus no longer has. Light travel time turns the cloud into a record of the source's past, on a timescale nothing else could measure.

That episodic character is what makes the black hole relevant to galaxy formation. A duty cycle of a few per cent, with each episode lasting perhaps $10^7$–$10^8$ years, is enough to inject the energy the previous block required — and it explains why the connection between black holes and their hosts shows up in *time-averaged* properties, like the tight correlation between black-hole mass and bulge velocity dispersion, rather than in whether a galaxy happens to be active now.

## Pulling the thread

- Three facts force the conclusion: **~10⁴⁶ erg/s**, **hour-scale variability**, and a non-stellar continuum. The variability bound $R \lesssim c\Delta t$ gives **~7 AU** for one hour, so a hundred Milky Ways come from inside Saturn's orbit — impossible for stars, and requiring an efficiency far above fusion's. **Compactness and efficiency follow from timing and photometry alone.**
- The **Eddington limit**, $L_{\rm Edd} \approx 1.26\times10^{38}(M/M_\odot)$ erg/s, turns a luminosity into a **minimum mass** — which is how "supermassive" was established. The **Salpeter time** of ~50 Myr gives exponential growth, and **16 e-foldings ≈ 800 Myr** from a stellar seed to $10^9\,M_\odot$ — longer than the universe had at $z>7$. The seed problem is a consequence of two formulae.
- The anatomy runs from $R_s \approx 2$ AU through disk, corona, **BLR at light-days**, **torus at 1–10 pc** (inner edge set by **dust sublimation**), to **NLR at 100–1,000 pc** — and **almost every scale was measured by timing and line width, not imaging.** Forbidden-line strength is a **density** measurement; line width is a **radius**.
- **Reverberation mapping** uses light travel time as a ruler: $R = c\tau$, then $M = fR\Delta v^2/G$. The virial factor $f$ is calibrated, not derived, and the **radius–luminosity relation** extends ~100 direct measurements to ~10⁵ quoted masses.
- **Unification by orientation** was settled by **spectropolarimetry of NGC 1068**: broad lines in scattered, polarised light from an object showing none directly. The scatterer is a periscope — and finding a path around a block beats accumulating evidence consistent with one.
- Orientation is **not the whole story**: **changing-look AGN** rule it out as a complete explanation, **radio-loudness** is intrinsic, the torus is **clumpy** so obscuration is probabilistic, and covering factor **falls with luminosity**.
- **Activity is a phase, not a class** — duty cycles of a few per cent, episodes of $10^7$–$10^8$ yr, with nested radio lobes, X-ray cavities and Hanny's Voorwerp as the direct evidence.

The transferable idea: **when you cannot resolve something, time it.** Every scale in this chapter — the emitting region, the corona, the broad-line region, the duty cycle, the switched-off nucleus behind Hanny's Voorwerp — was measured using the finite speed of light as a ruler rather than an angular resolution. Variability bounds a size from above; a lag measures a distance directly; a light echo reads a source's past state off an object far from it. The technique works precisely where imaging fails, because its precision depends on how well you can measure a *time*, not on how far away the thing is. Any field with a signal that propagates at a known speed has the same instrument available, and it is usually underused.

## Further reading

{{book: Bradley Peterson | An Introduction to Active Galactic Nuclei | 1997}}

{{book: Julian Krolik | Active Galactic Nuclei | 1999}}

{{book: Volker Beckmann | Active Galactic Nuclei | 2012}}

Beyond the books: Antonucci and Miller's 1985 paper on NGC 1068 is short and worth reading as an example of an experiment designed to be decisive rather than merely confirmatory. The reverberation-mapping literature repays attention for how carefully the virial factor's calibration is discussed by the people who use it — a good corrective to how the resulting masses are cited elsewhere. And the changing-look AGN papers are a live demonstration of a model being bounded rather than overturned.

## Problems

*Useful numbers: L_Edd ≈ 1.26 × 10³⁸ (M/M☉) erg/s; R_s = 2GM/c²; t_S = [η/(1−η)] Mc²/L_Edd ≈ 5 × 10⁷ yr at η = 0.1; M_BH = f R Δv²/G; G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; c = 3.00 × 10⁸ m/s; 1 AU = 1.496 × 10¹¹ m; 1 light-day = 2.59 × 10¹³ m; 1 pc = 3.086 × 10¹⁶ m; L☉ = 3.83 × 10³³ erg/s.*

**1.** *(Sizing by timing.)* An AGN varies in X-rays on a timescale of 1 hour. **(a)** Compute the maximum size of the emitting region in metres and AU. **(b)** For a 10⁸ M☉ black hole, compute R_s and express your answer from (a) in units of R_s. **(c)** State the general principle and why it requires no knowledge of distance.

**2.** *(Why not stars.)* **(a)** State the three observational facts that rule out a stellar origin. **(b)** Explain specifically why a compact star cluster fails, giving two independent reasons. **(c)** State what property of the energy source the argument establishes, and what it does *not* establish.

**3.** *(Eddington.)* **(a)** Write the Eddington luminosity and state the physical balance it expresses. **(b)** Compute the minimum mass of a nucleus radiating 10⁴⁶ erg/s. **(c)** Express that luminosity in solar luminosities and compare with the Milky Way's ~10¹⁰ L☉.

**4.** *(Growth arithmetic.)* **(a)** Compute the number of e-foldings needed to grow from 100 M☉ to 10⁹ M☉. **(b)** Using t_S = 5 × 10⁷ yr, compute the required time. **(c)** Compare with the age of the universe at z ≈ 7.5 (~700 Myr) and list the four assumptions that could be at fault.

**5.** *(Reading a spectrum.)* An AGN spectrum shows permitted lines with widths of ~4,000 km/s and forbidden [O III] lines with widths of ~400 km/s. **(a)** State which region produces each. **(b)** Explain what the *presence or absence* of forbidden lines measures, and why. **(c)** Explain what the width ratio implies about the two regions' radii, assuming both are virialised.

**6.** *(Reverberation.)* A campaign finds a 20-day lag between continuum and Hβ variations, with a line width of 4,000 km/s. **(a)** Compute R_BLR. **(b)** Compute M_BH taking f = 1. **(c)** Explain what f absorbs and how it is fixed, and state what this implies about quoted quasar masses.

**7.** *(The periscope.)* **(a)** State what the unified model predicts is present but unseen in a Seyfert 2. **(b)** Explain how spectropolarimetry tests this, including why scattering is essential. **(c)** Explain why this test is stronger than a correlation between orientation indicators and type.

**8.** *(Bounding the model.)* **(a)** Explain why changing-look AGN cannot be explained by orientation. **(b)** Explain why radio-loudness cannot be. **(c)** State what a clumpy torus changes about the type 1 / type 2 distinction.

**9.** *(A phase, not a class.)* **(a)** State the evidence that AGN activity is episodic, giving three independent examples. **(b)** Explain why a few per cent duty cycle still suffices for AGN feedback to matter in galaxy formation. **(c)** Explain why this predicts that black hole–host correlations should appear in time-averaged properties rather than in current activity.

## Worked answers

**1.** **(a)** $R \lesssim c\Delta t = (3.00\times10^8)(3600) = \mathbf{1.08\times10^{12}\ m} = 1.08\times10^{12}/1.496\times10^{11} = \mathbf{7.2\ AU}$ — inside Saturn's orbit. **(b)** $R_s = 2GM/c^2 = 2(6.674\times10^{-11})(1.989\times10^{38})/(9.00\times10^{16}) = \mathbf{2.95\times10^{11}\ m} = 1.97$ AU. So the emitting region is $1.08\times10^{12}/2.95\times10^{11} \approx \mathbf{3.7\ R_s}$ — the X-rays originate essentially at the innermost region of the flow. **(c)** A source of size $R$ cannot be observed to vary coherently faster than $R/c$, since signals from its near and far sides arrive spread over that interval however abruptly the source changed. It requires no distance because it compares the source with *itself*: the observed timescale is (up to cosmological time dilation, a known factor) the intrinsic timescale, and the bound follows from causality alone.

**2.** **(a)** Luminosity of order $10^{46}$ erg/s; coherent variability on hours; and a broad non-stellar continuum spanning radio to gamma rays. **(b)** First, **causality**: a cluster's stars are causally disconnected on hour timescales, so they cannot brighten and dim together — only a single coherent object can. Second, **density**: supplying $10^{46}$ erg/s from stars within 7 AU requires a stellar density at which the system would either collapse promptly or suffer actual stellar collisions, and in either case would not persist for the observed source lifetimes. **(c)** It establishes that the source is a **single, compact object** releasing energy at an efficiency far above nuclear fusion's — of order 10 per cent of rest mass rather than 0.1 per cent. It does **not** establish that the object is a black hole: that identification comes afterward, from asking what kind of object can be that compact and that efficient, and it is general relativity rather than the timing argument that supplies it.

**3.** **(a)** $L_{\rm Edd} = 4\pi GMm_pc/\sigma_T \approx 1.26\times10^{38}(M/M_\odot)$ erg/s. It expresses the balance between the outward force of radiation scattering off electrons and the inward gravitational force on the plasma — with electrons and protons electrostatically coupled, so the radiation pressure on the electrons resists the infall of the whole gas. **(b)** $M \gtrsim L/1.26\times10^{38} = 10^{46}/1.26\times10^{38} = \mathbf{7.9\times10^{7}\,M_\odot}$, i.e. of order $10^8\,M_\odot$. **(c)** $10^{46}/3.83\times10^{33} = \mathbf{2.6\times10^{12}\,L_\odot}$, roughly **260 times** the Milky Way's total stellar luminosity — from a region of a few AU.

**4.** **(a)** $\ln(10^9/10^2) = \ln(10^7) = 7\ln 10 = \mathbf{16.1}$ e-foldings. **(b)** $16.1 \times 5\times10^7 = \mathbf{8.1\times10^{8}\ yr}$, about 800 Myr. **(c)** The universe was under **700 Myr** old at $z\approx7.5$, so the required time exceeds the time available — and that assumes accretion began at the moment of seed formation and never paused. The four candidate faults: **(i)** the **seed mass** — direct-collapse seeds of $10^4$–$10^5\,M_\odot$ remove most of the required e-foldings; **(ii)** the **radiative efficiency** — a lower $\eta$ shortens $t_S$ and leaves more accreted mass in the hole; **(iii)** the assumption of a **single continuous episode** — mergers of seeds add mass without accretion; **(iv)** the **Eddington limit as a ceiling** — episodes of super-Eddington accretion, which specific geometries permit, would accelerate growth. Each is an active research programme, and the observation itself is not in serious doubt.

**5.** **(a)** The ~4,000 km/s permitted lines come from the **broad-line region**, at light-days to light-months; the ~400 km/s forbidden [O III] lines from the **narrow-line region**, at 100–1,000 pc. **(b)** It measures **density**. Forbidden transitions have very low spontaneous emission rates, so the excited state is long-lived; above a critical density a collision de-excites the atom before it can radiate and the line is suppressed. Strong forbidden lines therefore require gas below that critical density, and their absence indicates gas above it. **(c)** If both regions are in virial equilibrium around the same mass, $v \propto R^{-1/2}$, so $R \propto v^{-2}$. The width ratio is 10, giving a radius ratio of $10^2 = \mathbf{100}$ — the narrow-line region should lie about a hundred times further out. The actual ratio is far larger (light-days to hundreds of parsecs, some $10^4$–$10^5$), which is itself informative: the narrow-line gas is **not** purely virialised around the black hole, its motions instead reflecting the host galaxy's potential and outflows driven by the nucleus.

**6.** **(a)** $R = c\tau = (3.00\times10^8)(20 \times 86400) = \mathbf{5.18\times10^{14}\ m}$, i.e. 20 light-days ≈ 0.017 pc. **(b)** $M = R\Delta v^2/G = (5.18\times10^{14})(4\times10^{6})^2/6.674\times10^{-11} = (5.18\times10^{14})(1.6\times10^{13})/6.674\times10^{-11} = 1.24\times10^{38}$ kg $= \mathbf{6.2\times10^{7}\,M_\odot}$. **(c)** $f$ absorbs everything unknown about the broad-line region's **geometry and kinematics** — whether the clouds form a flattened rotating disk or a spherical distribution, whether there is net inflow or outflow, and how the measured line width relates to the true orbital velocity. It is of order unity but not calculable from first principles, and is **calibrated** by requiring reverberation masses to agree on average with $M$–$\sigma$ masses in quiescent galaxies. Since direct campaigns exist for only ~100 objects, an $R \propto L^{0.5}$ relation derived from them is extrapolated to give single-epoch masses for ~10⁵ quasars. Quoted quasar masses therefore inherit the uncertainty in $f$ **and** the scatter and extrapolation of the radius–luminosity relation — defensible in aggregate, but not the direct measurements they resemble in print.

**7.** **(a)** That a **broad-line region and accretion disk are present**, identical to those in a Seyfert 1, but hidden from our line of sight by the dusty torus — while the far larger narrow-line region remains visible because it lies outside the torus. **(b)** Light from the hidden region escaping along the unobscured axis can **scatter** off electrons and dust above the nucleus and be redirected toward the observer. Scattering **polarises** the light, with an orientation set by the scattering geometry, so isolating the polarised flux selects precisely those photons that reached us indirectly. Scattering is essential twice over: it provides the alternative light path, and it tags that path with a polarisation signature that distinguishes it from directly transmitted light. Doing this on NGC 1068 revealed broad Balmer lines absent from the direct spectrum. **(c)** Because a correlation always admits the alternative reading that the two classes are **intrinsically different** and merely happen to correlate with an orientation indicator — no amount of additional correlation excludes that. Detecting the hidden component **directly** does exclude it: the broad-line region is demonstrably present in an object classified as lacking one. The general principle: when a hypothesis claims something is present but blocked, the decisive test is to find a path around the block.

**8.** **(a)** Because these objects change type over **months to years**, and orientation cannot change on that timescale — reorienting a parsec-scale torus, or our viewing angle onto it, would take vastly longer, and no plausible mechanism acts fast enough. The transitions must instead reflect real changes in **accretion rate**, or individual obscuring clouds crossing the line of sight, so at least part of the type 1/type 2 distinction is about **state** rather than geometry. **(b)** Because whether a nucleus produces powerful large-scale jets is an **intrinsic** property, not an appearance: the ~10 per cent radio-loud fraction correlates with host morphology (jets favour ellipticals) and probably with black-hole spin and accretion mode. Orientation governs how a jet *looks* — a blazar is a jet seen nearly end-on, with its emission relativistically beamed — but not whether one exists at all. **(c)** It makes obscuration **probabilistic rather than deterministic**. With discrete dusty clouds rather than a smooth donut, a given line of sight may be blocked or clear depending on where the clouds happen to be, so the sharp dichotomy softens into a distribution of obscuration; a single object can change apparent type without anything reorienting; and the covering factor can vary with luminosity, as the observed decline in type 2 fraction with luminosity requires.

**9.** **(a)** **Multiple pairs of radio lobes** at different distances from the same nucleus, the relics of successive outbursts; **nested X-ray cavities** in cluster gas, each inflated by a separate episode; and **Hanny's Voorwerp**, a cloud beside IC 2497 whose ionisation state records a nuclear luminosity far above what the nucleus emits today — a light echo of a source that has since switched off. **(b)** Because what matters for feedback is the **time-integrated energy**, and the energy available is enormous: accretion converts ~10 per cent of rest mass, so a black hole growing to $10^8\,M_\odot$ releases of order $10^{61}$ erg, far exceeding the binding energy of its host's gas. Delivering that in episodes of $10^7$–$10^8$ yr at a few per cent duty cycle over ten billion years is ample; feedback does not require continuous operation, only sufficient total energy deposited more often than the gas can cool. **(c)** Because a galaxy's current activity is a snapshot of a rare phase and says little about its history, whereas the black hole's **mass** is the accumulated record of every past episode. A correlation between black-hole mass and bulge velocity dispersion therefore reflects the time-integrated coupling of growth and feedback, and should be tight; a correlation between *current* luminosity and host properties should be weak and dominated by whether gas happens to be reaching the centre right now. That is what is observed, and it is why the $M$–$\sigma$ relation is the central evidence for co-evolution — the subject of the Supermassive Black Holes chapter.$egAgn_master$,
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
