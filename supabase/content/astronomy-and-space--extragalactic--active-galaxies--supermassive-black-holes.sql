-- Astronomy & Space · The Extragalactic Universe — Active Galaxies —
-- "Supermassive Black Holes". Curated master for
-- astronomy-and-space/extragalactic/active-galaxies/supermassive-black-holes
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The third Active Galaxies chapter, and the one where the block's two
-- threads meet: the objects the AGN and Quasar chapters inferred are here
-- weighed directly, and the correlation between their mass and their
-- host's stars becomes the central puzzle. The sphere of influence and why
-- it confines dynamical masses to the nearby universe; the four
-- measurement methods and their inhomogeneous ladder, with NGC 4258's
-- megamaser as the one clean Keplerian case; the EHT shadow with its
-- prediction of 39.7 microarcsec against a measured 42, fixed in advance
-- by an independent mass and a geometric distance; M-sigma and the
-- observation that makes it strange - the black hole's gravity is
-- negligible where the correlated stars live, so the coupling cannot be
-- gravitational; the momentum-driven self-regulation argument derived to
-- M ∝ sigma^4 with the energy-driven case giving sigma^5, bracketing the
-- observed slope, set against the merger-averaging alternative that needs
-- no physics at all; seeds, and which observation would separate the
-- channels; the final parsec problem and the 2023 pulsar-timing evidence
-- that it is at least sometimes crossed; and spin closing the loop back to
-- Soltan. ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/active-galaxies/supermassive-black-holes',
    'research',
    'advanced',
    'read',
    $egSmbh_master$> Essentially every massive galaxy contains a black hole of millions to billions of solar masses at its centre. Its mass correlates tightly with the velocity dispersion of stars ten thousand times further out — stars over which it exerts no meaningful gravitational influence whatsoever. **A correlation that cannot be gravitational, between two things separated by four orders of magnitude in scale, is the central fact of this subject**, and explaining it is what turned black holes from a curiosity into a required component of galaxy formation.

The two previous chapters inferred these objects rather than observing them. The AGN chapter established compactness and efficiency from timing and photometry; the Quasars chapter weighed the whole population at once with Soltan's budget. Neither weighed an individual black hole by watching things orbit it. This chapter does that, and then confronts what the resulting masses correlate with.

## Weighing one

The dynamical measurement is conceptually trivial and observationally brutal. A black hole dominates the gravitational field only within its **sphere of influence**:

$$r_h \approx \frac{GM_{\rm BH}}{\sigma^2}$$

the radius at which the black hole's Keplerian velocity matches the stars' random motions. Outside it, the stars' motion is set by the galaxy; inside it, by the black hole. To measure a mass, one must **resolve** $r_h$ — otherwise the black hole's kinematic signature is diluted by all the galaxy light in the same aperture, and one recovers an upper limit at best.

That requirement is severe, and the numbers show why:

| System | $M_{\rm BH}$ | $\sigma$ | $r_h$ | Distance | Angular size |
| --- | --- | --- | --- | --- | --- |
| Sgr A* | $4.3\times10^6$ | 100 km/s | 1.8 pc | 8 kpc | **48″** |
| M87 | $6.5\times10^9$ | 380 km/s | 194 pc | 16.8 Mpc | **2.4″** |
| Typical $10^8\,M_\odot$ | $10^8$ | 200 km/s | 10.8 pc | 20 Mpc | **0.11″** |
| Same, further away | $10^8$ | 200 km/s | 10.8 pc | 100 Mpc | **0.022″** |

The last row is the problem. **Dynamical black hole masses are essentially restricted to the nearby universe**, and within it to the most massive black holes. Everything quoted for distant objects comes from the reverberation ladder of the AGN chapter, with its calibrated virial factor — so the sample with the most reliable masses and the sample with the most objects barely overlap.

Four methods carry the field, and they are worth distinguishing because their assumptions differ:

**Stellar dynamics.** Model the orbits of stars within $r_h$ from their line-of-sight velocity distribution. The most broadly applicable method, and the most model-dependent: the inference is degenerate with the stellar orbital anisotropy and with the assumed mass-to-light ratio of the stars themselves.

**Gas dynamics.** Measure a rotating disk of ionised gas around the nucleus. Cleaner in principle, since gas on a disk has a single well-defined velocity at each radius — but gas is easily disturbed by outflows and non-gravitational forces, so the assumption that it traces the potential is the weak point.

**Megamasers.** The gold standard, and worth understanding in detail. In a few galaxies, water molecules in a sub-parsec disk around the nucleus produce intense maser emission at 22 GHz, which VLBI can position to microarcsecond precision. The masers trace a **thin, edge-on, Keplerian disk**: their velocities follow $v \propto r^{-1/2}$ exactly, over a well-resolved range of radii.

The archetype, **NGC 4258**, yields $M_{\rm BH} = 3.8\times10^{7}\,M_\odot$ to about **one per cent** — the most accurate black hole mass anywhere. That accuracy comes from the method assuming almost nothing: not an orbital anisotropy, not a stellar mass-to-light ratio, not that gas traces the potential. It is Kepler's third law applied to resolved test particles on resolved orbits, which is the same standard applied to Sgr A* via the star S2. The system also yields a **geometric distance**, since combining the masers' proper motions with their radial accelerations gives a distance with no rungs beneath it — which is why NGC 4258 anchors the cosmic distance ladder as well.

**Reverberation mapping**, for active nuclei only, as the AGN chapter set out.

The methodological point: **the field's mass scale is an inhomogeneous ladder**, with a few exquisite measurements at its base and a great many extrapolated estimates above. It is worth knowing which rung any quoted mass sits on.

```checkpoint
q: Dynamical black hole masses are largely confined to nearby galaxies. The limiting requirement is that
a: distant galaxies are too faint for their spectra to be measured
x: Spectra of galaxies far beyond this limit are routinely obtained; the constraint is angular resolution, not flux.
a*: the sphere of influence r_h = GM/σ² must be resolved — otherwise the black hole's kinematic signature is diluted by the surrounding galaxy light in the same aperture
a: black holes in distant galaxies are less massive and so harder to detect
x: More distant surveys reach *more* massive black holes, being flux-limited; the difficulty is angular, and it worsens with distance for a black hole of any mass.
a: cosmological redshift moves the stellar absorption lines out of the observable band
x: Absorption lines remain observable across the relevant redshift range, and these measurements are made at distances where redshift is a minor correction.
hint: What are you actually measuring, and what happens if the region is smaller than your resolution element?
why: The black hole dominates the potential only inside r_h; outside it, stellar motions reflect the galaxy. If the resolution element is larger than r_h, the measured velocities average the black-hole-dominated region with far more light from stars that know nothing about it, and the signal is washed out. For a 10⁸ M☉ hole with σ = 200 km/s, r_h ≈ 10.8 pc — 0.11 arcsec at 20 Mpc but only 0.022 arcsec at 100 Mpc. Hence the best masses come from nearby, massive systems, while everything at cosmological distance rests on the reverberation ladder. The samples with the most reliable masses and the most objects barely overlap.
---
q: Megamaser measurements such as NGC 4258's give black hole masses to about 1% — far better than stellar dynamics. The reason is that
a: maser emission is intrinsically brighter, giving higher signal-to-noise
x: Brightness enables the VLBI astrometry, but precision alone would not remove the modelling assumptions that limit other methods.
a*: the masers are resolved test particles on a thin Keplerian disk, so the measurement is Kepler's third law applied directly — assuming no orbital anisotropy, no stellar mass-to-light ratio, and no claim that the tracer follows the potential
a: water masers only occur around black holes of precisely known mass
x: Circular. Masers occur where the physical conditions for amplification exist; nothing about their occurrence presupposes a mass.
a: the 22 GHz emission is unaffected by dust, unlike optical stellar dynamics
x: Radio wavelengths do penetrate dust, which helps — but extinction is not what limits optical black hole masses, and correcting for it would not deliver 1% precision.
hint: List what each method has to assume. Which list is shortest?
why: Stellar dynamics must model the distribution of stellar orbits, which is degenerate with the inferred mass, and must assume a stellar mass-to-light ratio. Gas dynamics must assume the gas is on circular orbits tracing the potential, which outflows readily violate. Megamasers assume neither: VLBI resolves individual maser spots at known radii, their velocities follow v ∝ r^(−1/2) as verification that the disk is Keplerian, and the mass follows from Kepler's third law. Shorter assumption lists give better-determined answers — and the same system delivers a geometric distance from maser proper motions and accelerations, which is why NGC 4258 anchors the distance ladder too.
```

{{image: Messier 106 | Messier 106 (NGC 4258), whose nucleus hosts a sub-parsec disk of water masers orbiting a 3.8 × 10⁷ solar-mass black hole. Because VLBI resolves the individual maser spots and their velocities follow v ∝ r^(−1/2) exactly, the mass follows from Kepler's third law with almost nothing assumed — making it the most accurately weighed black hole anywhere, and anchoring the cosmic distance ladder through the geometric distance the same measurement yields.}}

## Seeing the shadow

In 2019 the Event Horizon Telescope published an image of the nucleus of M87 showing a bright ring around a dark centre.

The measurement to appreciate is not the picture but the **number fixed in advance**. General relativity predicts that a black hole casts a shadow of angular diameter

$$\theta_{\rm sh} = \frac{2\sqrt{27}\,GM}{c^2 D} \approx \frac{10.4\,GM}{c^2 D}$$

set by the photon sphere and the light bending around it. The factor $2\sqrt{27}$ is not adjustable — it comes out of the Schwarzschild geometry, with a modest dependence on spin.

M87's black hole mass had been measured decades earlier by **stellar dynamics**: $6.5\times10^9\,M_\odot$. Its distance, 16.8 Mpc, comes from surface-brightness fluctuations. Substituting:

$$\theta_{\rm sh} = \frac{10.39 \times 9.60\times10^{12}\ \mathrm{m}}{5.18\times10^{23}\ \mathrm{m}} = 1.93\times10^{-10}\ \mathrm{rad} = \mathbf{39.7\ \mu as}$$

The EHT measured a ring diameter of **42 ± 3 μas**.

**A mass from stellar orbits, a distance from stellar populations, and a factor from the Schwarzschild metric — combined into a prediction of an angle no one had ever measured, which then matched.** Every input was fixed before the observation, none of them by the EHT, and none of them adjustable afterwards. That is what makes it a test rather than an illustration.

It is worth being clear about what it does and does not establish. It confirms that the object is compact enough to have a photon sphere at the predicted radius, and that light bends around it as general relativity says. It does not, on its own, prove an event horizon exists — a sufficiently compact object without a horizon would produce a similar shadow, and excluding those alternatives requires further argument. What it does do is close the last plausible gap between "an extremely compact massive object" and "a black hole" for this particular source.

```checkpoint
q: The EHT measured M87's shadow at 42 ± 3 μas against a prediction of 39.7 μas. Why does the agreement count as a test of general relativity rather than a consistency check?
a: Because the EHT independently measured the black hole's mass and found it consistent with earlier work
x: The EHT did not measure the mass independently for the prediction — the mass came from stellar dynamics decades earlier, which is precisely what makes the comparison a test.
a*: Because every input — the mass from stellar dynamics, the distance from surface-brightness fluctuations, and the factor 2√27 from the Schwarzschild metric — was fixed beforehand and by other people, leaving nothing adjustable after the fact
a: Because the image was the first ever taken of a black hole, and firsts are inherently more decisive
x: Novelty carries no evidential weight by itself. What matters is whether the observation could have come out otherwise given the prior commitments.
a: Because 42 and 39.7 agree to better than 1%, which is the standard for a relativistic test
x: They agree to about 6%, comfortably within the 3 μas uncertainty. Precision matters less here than the prediction having been fixed in advance.
hint: Ask which quantities were free to be adjusted once the image was in hand.
why: A prediction is testable to the extent that it could have failed. Here the mass came from stellar orbits measured long before, the distance from an independent stellar-population method, and the coefficient 2√27 from the Schwarzschild geometry with no free parameter. Multiplying them gives 39.7 μas, and the measurement returned 42 ± 3. Had the ring been 20 or 80 μas, nothing could have been retuned to accommodate it. Note the limits, though: the result establishes a photon sphere at the predicted radius and light bending as GR describes, but does not by itself demonstrate an event horizon, since a sufficiently compact horizonless object would cast a similar shadow.
```

## The correlation that should not exist

Now the central result of the chapter.

Plot black hole mass against the **velocity dispersion of the host galaxy's bulge** and one finds a tight power law:

$$M_{\rm BH} \approx 1.3\times10^{8}\left(\frac{\sigma}{200\ \mathrm{km/s}}\right)^{4.7}\,M_\odot$$

with a scatter of only about **0.3 dex** — a factor of two. The slope was measured independently by two groups in 2000, one finding ~3.75 and the other ~5.3, and modern compilations sit near 4.7. Black hole mass is also roughly **0.1–0.5 per cent of bulge mass**, and correlates with the **bulge** specifically, not with the disk — a galaxy's disk can be large or small without the black hole caring.

Now the strangeness. Take M87: $r_h \approx 194$ pc, while the bulge whose stars set $\sigma$ extends to **ten kiloparsecs**. **The black hole's gravity is utterly negligible where the correlated stars live** — a factor of fifty in radius, thousands in enclosed mass. And the black hole is roughly one part in a thousand of the bulge by mass.

So this is not a gravitational correlation. A tiny object is somehow in tight quantitative agreement with a vastly larger structure it cannot pull on. **Something must couple them non-gravitationally, or something must have made them together.** Those are the two families of explanation, and they are genuinely different.

### Explanation 1: self-regulation

The physical account says the black hole grows until its **energy output** can expel the gas feeding it, at which point growth stops — a thermostat.

The **momentum-driven** version can be derived in a few lines. Model the bulge as an isothermal sphere, so the enclosed mass is $M(R) = 2\sigma^2R/G$ and the gas mass within $R$ is $M_g = f_g\,2\sigma^2R/G$ for gas fraction $f_g$. The gravitational force on that gas shell is

$$F_{\rm grav} = \frac{GM(R)M_g}{R^2} = \frac{4f_g\sigma^4}{G}$$

— independent of radius, which is the key simplification an isothermal sphere buys. The outward momentum flux from a nucleus radiating at the Eddington limit is $L_{\rm Edd}/c = 4\pi GM_{\rm BH}m_p/\sigma_T$. Setting them equal:

$$M_{\rm BH} = \frac{f_g\,\sigma_T\,\sigma^4}{\pi G^2 m_p}$$

**$M_{\rm BH} \propto \sigma^4$.** If instead the outflow is **energy-driven** — the shocked wind retaining its thermal energy rather than radiating it away — the same style of argument gives $M_{\rm BH} \propto \sigma^5$.

The observed slope, between roughly 3.75 and 5.3 with modern values near 4.7, **lies between the two predictions**. Numerically, with $f_g = 0.16$ and $\sigma = 200$ km/s, the momentum-driven formula gives $3.7\times10^{8}\,M_\odot$ against an observed $1.3\times10^{8}$ — high by a factor of about three, which for a calculation with no fitted parameters is a good result rather than a poor one.

The mechanism is appealing because it explains the *tightness*: a thermostat produces a definite relation, since a black hole below the critical mass keeps growing and one above it shuts off its own supply.

### Explanation 2: no physics at all

There is a serious competing account, and it is important because it requires no coupling whatsoever.

Suppose black hole mass and bulge mass start uncorrelated, with a broad distribution of ratios. Now let galaxies undergo many mergers. At each merger, black holes add and bulges add. **Repeated averaging of independent random variables drives the ratio toward its mean and shrinks the scatter** — the central limit theorem, operating on galaxy assembly.

This reproduces a tight $M_{\rm BH}$–$M_{\rm bulge}$ relation with no physical mechanism connecting the two, purely from the statistics of hierarchical merging.

**How would one tell them apart?** The distinguishing predictions are about the systems that have undergone *fewest* mergers: low-mass galaxies, and galaxies at high redshift. Merger-averaging predicts a much broader relation there, tightening over time; self-regulation predicts the relation is imposed physically at each epoch and so should be tight from early on. The current evidence is mixed and the sample of high-redshift black hole masses carries all the caveats of the reverberation ladder — so this remains genuinely open, and it is worth resisting textbook presentations that give only the first account.

```checkpoint
q: A black hole's sphere of influence in M87 is ~194 pc while the bulge whose velocity dispersion correlates with its mass extends to ~10 kpc. What does this establish about the M–σ relation?
a: That the black hole's gravity organises the entire bulge, since gravity has infinite range
x: Gravity has infinite range but negligible strength here — within the bulge the enclosed stellar mass exceeds the black hole's by three orders of magnitude, so the black hole's contribution to the potential is irrelevant there.
a*: That the coupling cannot be gravitational — a tiny object is in quantitative agreement with a structure it cannot pull on, so either something couples them non-gravitationally or something built them together
a: That the velocity dispersion must be measured within the sphere of influence for the relation to hold
x: σ is deliberately measured over the bulge, well outside r_h — that is what makes the correlation surprising, and the relation holds when measured that way.
a: That the relation is a coincidence with no physical content
x: A scatter of only 0.3 dex over several decades in mass is far too tight to be coincidental; the question is which mechanism produces it, not whether one does.
hint: Compare the black hole's mass with the bulge mass inside the radius where σ is measured.
why: The black hole is roughly 0.1–0.5 per cent of the bulge mass, and at 10 kpc the enclosed stellar mass dwarfs it by three orders of magnitude, so its direct gravitational influence on those stars is nil. A tight correlation across that gap therefore demands either a non-gravitational channel — energy and momentum injected by accretion, acting on the gas the bulge forms from — or a common assembly history that correlates the two without any coupling. Those are the self-regulation and merger-averaging accounts, and they are genuinely different claims rather than two descriptions of one thing.
---
q: The momentum-driven self-regulation argument predicts M_BH ∝ σ⁴ and the energy-driven version predicts σ⁵, against an observed slope near 4.7. Why is a competing explanation still taken seriously?
a: Because the predicted normalisation is wrong by a factor of three, which falsifies the self-regulation picture
x: A parameter-free calculation landing within a factor of three is a success, not a falsification — the discrepancy is well within the uncertainties in gas fraction, geometry and coupling efficiency.
a*: Because repeated mergers average an initially broad black-hole-to-bulge ratio toward its mean by the central limit theorem, producing a tight relation with no coupling at all — so matching the slope does not by itself demonstrate a mechanism
a: Because the observed slope of 4.7 lies between the two predictions and therefore agrees with neither
x: Bracketing the observation is a reasonable outcome, since real outflows are partly momentum-driven and partly energy-driven at different stages. It is not a failure of the picture.
a: Because velocity dispersion cannot be measured accurately enough to distinguish slopes of 4 and 5
x: Dispersions are measured well enough that the two groups' 2000 results differed for identifiable methodological reasons, not measurement noise.
hint: Could a tight correlation arise without anything connecting the two quantities?
why: Hierarchical assembly adds black holes and bulges together many times, and averaging independent ratios drives the result toward the mean while shrinking the scatter — a purely statistical route to a tight relation requiring no physical coupling whatever. Since it also reproduces a tight correlation, agreement of slope does not settle the mechanism. The two accounts diverge where mergers have been fewest: at low mass and at high redshift, merger-averaging predicts a much broader relation tightening over time, self-regulation a relation imposed at each epoch and tight throughout. Evidence there is mixed and inherits every caveat of the reverberation ladder, so this is genuinely open rather than settled.
```

{{image: Messier 87 | Messier 87, whose nucleus holds a 6.5 × 10⁹ solar-mass black hole — weighed by stellar dynamics decades before the Event Horizon Telescope imaged the ring of light around its shadow. The predicted shadow diameter, 10.4 GM/c²D, came to 39.7 microarcseconds from that mass and an independent distance; the measurement returned 42 ± 3. Every input was fixed in advance and none by the people who took the image.}}

## Seeds

The Quasars chapter established the constraint: a $1.6\times10^9\,M_\odot$ black hole at a cosmic age of 670 Myr needs 830 Myr of continuous Eddington growth from a stellar remnant but only 600 Myr from a $10^4\,M_\odot$ seed. Three seed channels are proposed.

**Population III remnants**, $\sim100\,M_\odot$. The first stars, forming from metal-free gas, are expected to have been massive and to have left correspondingly massive remnants. This channel is nearly guaranteed to operate — such stars almost certainly existed — and it is the one the timing argument struggles with.

**Direct collapse**, $10^4$–$10^5\,M_\odot$. In a pristine halo where molecular hydrogen is destroyed by ultraviolet radiation from a neighbouring galaxy, gas cannot cool below ~$10^4$ K, so it cannot fragment into stars and instead collapses monolithically into a supermassive star and then a black hole. This solves the timing problem comfortably but requires a specific and rare set of conditions — no metals, a nearby ultraviolet source of the right intensity, and no fragmentation.

**Runaway collisions**, $\sim10^3\,M_\odot$. In an exceptionally dense young star cluster, stellar collisions build a very massive star before any of them explode, leaving an intermediate-mass remnant. Intermediate in both mass and plausibility.

**What would settle it** is the **low-mass end** of the black hole mass function. Heavy seeds should leave a floor — dwarf galaxies hosting black holes of $10^4$–$10^5\,M_\odot$ that never grew — while light seeds predict a smooth continuation to lower masses and a larger fraction of dwarfs with no black hole at all. Searching for **intermediate-mass black holes** in dwarf galaxies and globular clusters is therefore not a curiosity but the discriminating observation, which is why the effort is disproportionate to the objects' individual interest. This is the same logic as the previous chapters' dwarf arguments: **the extremes of a distribution carry the information about its origin, and its middle does not.**

```checkpoint
q: The three seed channels are hard to distinguish by observing today's supermassive black holes directly. Why does the low-mass end of the black hole mass function discriminate where the high-mass end cannot?
a: Because low-mass black holes are easier to weigh, having smaller spheres of influence
x: The dependence runs the other way — r_h = GM/σ² shrinks with mass, so low-mass black holes are considerably *harder* to weigh, which is why the discriminating regime is also the poorly measured one.
a*: Because a black hole that has grown by many e-foldings has erased its initial mass, while one that barely grew still carries it — so heavy seeds should leave a floor of ungrown 10⁴–10⁵ M☉ objects that light seeds would not produce
a: Because seeds only formed in low-mass galaxies, so massive galaxies contain no information about them
x: Every supermassive black hole began as a seed, including those in the most massive galaxies. The issue is that subsequent growth has overwritten the starting mass.
a: Because the high-mass end is contaminated by black holes formed through mergers rather than accretion
x: Soltan's argument shows accretion dominated the growth, so merger contamination is not what limits the high-mass end's diagnostic power.
hint: Growth is exponential. What does that do to the memory of the starting value?
why: Exponential growth multiplies the seed mass by a factor that quickly dwarfs it, so a 10⁹ M☉ black hole looks the same whether it started at 100 or 10⁵ M☉ — the initial condition has been erased. Only objects that scarcely grew retain it. Heavy-seed models therefore predict a population floor: dwarf galaxies and globular clusters hosting 10⁴–10⁵ M☉ black holes that never found fuel. Light-seed models predict a smooth continuation to lower masses and more systems with no black hole at all. This is why intermediate-mass black holes are pursued far beyond their individual interest, and it is the same structural argument the Dwarfs chapter made: the extremes of a distribution carry its origin, the middle does not.
---
q: A cosmological simulation reproduces the observed M–σ relation, the black hole mass function, and the quasar luminosity function. How much does this establish about its black hole physics?
a: It confirms the accretion and feedback prescriptions, since three independent observables are matched
x: The three are not independent — they are tightly linked by the same underlying growth history, and Soltan's argument shows the mass function and integrated quasar light are essentially two views of one quantity.
a*: Rather little on its own — these are the quantities such models are calibrated against, and they are strongly interdependent, so agreement demonstrates the model can be tuned rather than that its physics is right
a: Nothing at all, since simulations cannot resolve accretion physics
x: Too strong. Simulations do constrain what feedback prescriptions can work at the resolved scales, and a model failing these tests would be ruled out — matching them is necessary, just not sufficient.
a: It establishes the seed channel, since the mass function depends sensitively on seed mass
x: The present-day mass function at high mass is insensitive to seeds, precisely because exponential growth erases them; only the low-mass end retains that information, and it is not what such models are usually calibrated on.
hint: Ask what the model was tuned on, and whether the listed observables are separate facts.
why: Sub-grid black-hole accretion and feedback prescriptions carry free parameters fixed by requiring agreement with exactly these relations, so matching them is a consistency check rather than a confirmation — the same point the Formation & Evolution chapter made about the stellar mass function. The interdependence compounds it: Soltan's argument establishes that integrated quasar light and the local black hole mass density measure the same accreted mass, so reproducing both is close to reproducing one. The informative tests are quantities the calibration did not target — the low-mass end of the mass function, black hole occupation fractions in dwarfs, the scatter of M–σ at high redshift, or the merger rate implied by the pulsar timing background.
```

## Two black holes, and the final parsec

When galaxies merge, their black holes are brought together — and the process by which they do or do not coalesce is one of the sharpest open problems in the subject.

The stages:

**Stage 1: dynamical friction, kiloparsecs to parsecs.** Each black hole, carrying its dense stellar cusp, sinks toward the merger remnant's centre by the mechanism of the Mergers chapter. Efficient, and takes a few hundred million years.

**Stage 2: a bound binary, at parsec scales.** The two form a binary and harden by ejecting individual stars that pass close to them — three-body slingshots that carry away orbital energy.

**Stage 3: gravitational radiation, below ~$10^{-3}$ pc.** Gravitational-wave emission takes over and drives the pair to merge quickly.

**The problem is the gap.** By the time the binary reaches ~1 pc, it has already ejected the stars on orbits that pass close enough to interact — it has emptied its **loss cone**. Dynamical friction on the smooth background is ineffective at that separation, and gravitational radiation is far too weak. The binary can stall for longer than the age of the universe. This is the **final parsec problem**, and it matters well beyond black hole physics: if binaries generally stall, then galaxies should commonly host multiple black holes, black hole growth by merging is suppressed, and the predicted gravitational-wave background is much reduced.

Proposed resolutions all amount to **refilling the loss cone**: a triaxial rather than spherical potential, in which stellar orbits are not closed and so continually resupply the interacting population; gas disks providing dissipative friction; or a third black hole from a subsequent merger perturbing the binary.

### The observational answer

In 2023 the pulsar timing arrays reported the decisive evidence. **NANOGrav**, with 67 millisecond pulsars monitored over 15 years, together with the European and Parkes collaborations, found a low-frequency correlated signal in pulsar arrival times following the **Hellings–Downs** angular correlation — the specific signature of a stochastic gravitational-wave background, and one that no other source of correlated timing noise reproduces. NANOGrav's evidence favoured the background over independent pulsar noise by a Bayes factor exceeding $10^{14}$.

The amplitude and spectrum are consistent with the expected signal from a cosmological population of **supermassive black hole binaries** — millions of them, summing into a background at nanohertz frequencies. Other origins, including cosmological ones, are not excluded.

If the interpretation holds, the final parsec problem is **solved by nature at least often enough** to produce the observed background. The technique deserves note in its own right: a galaxy-scale detector, using pulsars as clocks and the intervening space as the arm of an interferometer, sensitive to waves with periods of years. **The instrument is the Galaxy.**

```checkpoint
q: A binary supermassive black hole can stall at parsec separation for longer than the age of the universe. The reason is that
a: gravitational radiation is emitted only by binaries of comparable mass, and these usually differ too much
x: Gravitational radiation is emitted by any inspiralling pair; mass ratio affects the amplitude but does not switch the mechanism off. The issue is separation, not mass ratio.
a*: it has already ejected the stars on orbits passing close enough to interact — its loss cone is empty — while dynamical friction on the smooth background is ineffective at that separation and gravitational waves are still far too weak
a: the two black holes reach a stable Lagrange configuration that resists further decay
x: A two-body system has no such stable configuration; the binary simply lacks a mechanism to shed further orbital energy.
a: the surrounding gas provides pressure support that halts the inspiral
x: Gas is one of the *proposed solutions*, providing dissipative friction that helps the binary harden — it is not what stalls it.
hint: What has the binary been doing to the stars that came close to it, and what does that leave behind?
why: The binary hardens by slingshotting individual stars, each ejection removing orbital energy. But this depletes the population of stars on orbits that pass close enough to interact — the loss cone — and in a smooth spherical potential those orbits are not resupplied. Below about a parsec, dynamical friction on the diffuse background is too weak and gravitational-wave emission does not become significant until roughly 10⁻³ pc. The binary is stranded in between. The proposed escapes all amount to refilling the loss cone: triaxial potentials in which orbits are not closed, gas disks providing dissipation, or a third black hole arriving from a later merger.
---
q: Pulsar timing arrays detected a correlated signal in arrival times following the Hellings–Downs pattern. Why does that angular correlation matter more than the signal's amplitude?
a: Because the amplitude is too small to measure reliably, while the correlation is robust
x: The amplitude is measured and is what constrains the source population; both are used. The correlation's role is to identify the signal's nature.
a*: Because the Hellings–Downs curve is the specific dependence of correlation on angular separation predicted for a stochastic gravitational-wave background, and no other source of correlated timing noise reproduces it
a: Because it allows the direction of individual sources to be located on the sky
x: A stochastic background has no single direction; the correlation characterises the signal's statistical nature rather than localising sources.
a: Because it proves the pulsars themselves are unaffected by the waves
x: The pulsars are affected — that is how the waves are detected. The signal is imprinted on light travel times between the pulsars and Earth.
hint: Many things add correlated noise to pulsar timing. What distinguishes a gravitational-wave background from all of them?
why: Clock errors, ephemeris errors and interstellar-medium effects all produce correlations between pulsars, but with characteristic angular dependences of their own — monopolar, dipolar, or none. A passing gravitational-wave background produces a distinctive quadrupolar pattern, the Hellings–Downs curve, in which correlation depends on the angle between the two pulsars in a specific way. Finding that pattern is what identifies the signal as gravitational rather than instrumental, and NANOGrav's 15-year data favoured it over independent noise by a Bayes factor above 10¹⁴. The amplitude then constrains the source population, which is consistent with a cosmological population of merging supermassive black hole binaries — implying the final parsec is crossed at least often enough.
```

## Spin, and closing the loop

A black hole has only mass, spin and charge; charge is negligible astrophysically; so **spin** is the one remaining property, and it matters for a specific quantitative reason.

Spin sets the radius of the **innermost stable circular orbit**, and therefore how deep into the potential well infalling matter descends before it stops radiating — which is precisely the **radiative efficiency**:

- **Non-rotating (Schwarzschild)**: ISCO at $6GM/c^2$, efficiency $\eta = 0.057$.
- **Near-maximally rotating (Kerr)**: ISCO much closer in, efficiency up to $\eta \approx 0.42$.

**A factor of more than seven, from spin alone.** Spin is measured chiefly from the profile of the relativistically broadened iron Kα line at 6.4 keV, whose red wing is shaped by gravitational redshift and Doppler effects at the ISCO, and thus reports how close to the hole the disk extends.

And now the loop closes. Soltan's argument, from a purely statistical photon budget, required $\eta \approx 0.1$. That is comfortably above the Schwarzschild value and well below the maximal one — implying the **population-averaged spin is moderate**. So a count of quasar photons across cosmic time constrains the average angular momentum of black holes, a quantity that sounds utterly inaccessible from such data.

This is worth pausing on as an example of what a well-connected theory buys. **A measurement of one thing constrains another that shares no observational channel with it**, because both are wired into the same physical framework. That is the practical payoff of theoretical unification, and it is why apparently unrelated results in a mature field are not independent.

```checkpoint
q: Soltan's argument counts quasar photons across cosmic time and finds η ≈ 0.1. How does that constrain black hole spin, which the photon count never observes?
a: It does not — spin and efficiency are independent properties, so no inference is possible
x: They are tightly linked: spin sets the innermost stable circular orbit, and the ISCO radius determines how deep infalling matter descends before it stops radiating, which is exactly the efficiency.
a*: Because spin fixes the ISCO radius and hence the radiative efficiency — 0.057 for a non-rotating hole rising to ~0.42 for a near-maximal one — so measuring η places the population-averaged spin between those extremes, at a moderate value
a: Because rapidly spinning black holes accrete faster, so a high efficiency would imply more quasars than are observed
x: Accretion rate and radiative efficiency are distinct quantities, and the argument runs through the energy released per unit mass rather than through how quickly mass arrives.
a: Because spin causes jets, and Soltan's argument counts only radio-quiet quasars
x: Soltan's budget uses bolometric output from the whole population; jet production is a separate matter and does not enter the inference.
hint: What does efficiency physically measure, and what sets it?
why: A black hole has only mass, spin and charge, and charge is astrophysically negligible — so spin is the one remaining freedom, and it acts by setting where the innermost stable circular orbit sits. Matter radiates until it reaches the ISCO and then falls in, so the depth of that orbit fixes the fraction of rest mass released: 0.057 for Schwarzschild, up to ~0.42 for near-maximal Kerr, a factor exceeding seven. Soltan's requirement that η ≈ 0.1 for the mass budget to close therefore reports a population-averaged spin that is moderate — comfortably above zero, far below maximal. The general point is what a well-connected theory buys: a measurement in one channel constrains a quantity with no observational overlap, because both are wired into the same framework.
```

## Pulling the thread

- Weighing a black hole requires resolving its **sphere of influence** $r_h = GM/\sigma^2$ — 2.4″ for M87 but 0.022″ for a $10^8\,M_\odot$ hole at 100 Mpc — so **dynamical masses are confined to the nearby universe** and everything further rests on the reverberation ladder.
- **Megamasers** are the gold standard because they assume least: resolved test particles on a verified Keplerian disk give NGC 4258's mass to **1 per cent**, plus a geometric distance.
- The **EHT** predicted M87's shadow at **39.7 μas** from a stellar-dynamical mass, an independent distance, and the factor $2\sqrt{27}$; the measurement returned **42 ± 3 μas**, with every input fixed in advance by others.
- **$M_{\rm BH} \propto \sigma^{4.7}$** with **0.3 dex** scatter, and $M_{\rm BH} \approx 0.1$–0.5% of bulge mass — yet $r_h$ is fifty times smaller than the bulge, so **the coupling cannot be gravitational**.
- **Self-regulation** derives $M \propto \sigma^4$ (momentum-driven) and $\sigma^5$ (energy-driven), **bracketing the observed slope**, with a parameter-free normalisation within a factor of three. But **merger-averaging** produces a tight relation from the central limit theorem with **no coupling at all**, and the two are distinguished only at low mass and high redshift.
- **Seeds** divide into Pop III remnants (~$100\,M_\odot$), direct collapse ($10^4$–$10^5$), and runaway collisions (~$10^3$); the discriminating observation is the **low-mass end** of the black hole mass function, which is why intermediate-mass black holes matter out of proportion to their individual interest.
- The **final parsec problem** — an empty loss cone between ineffective dynamical friction and negligible gravitational radiation — was answered observationally in 2023 by **pulsar timing arrays** detecting the **Hellings–Downs** correlation, whose amplitude matches a population of merging binaries.
- **Spin** sets the ISCO and hence efficiency, from $\eta = 0.057$ to $0.42$; Soltan's photon budget requiring $\eta \approx 0.1$ therefore **measures the population-averaged spin as moderate**.

The transferable idea: **a correlation across scales that cannot be causal at those scales is evidence of a shared history or a hidden channel — and distinguishing the two is a different question from establishing the correlation.** The M–σ relation was measured in 2000 and is still not explained, not because the data are poor but because two entirely different accounts — one physical, one statistical — both reproduce it. Fitting the observation was never the hard part. The hard part is finding the regime where the accounts disagree, which here means the systems with the fewest mergers and the poorest measurements. **When several mechanisms predict the same relation, the relation stops being evidence and the disagreement becomes the only thing worth measuring.**

## Further reading

{{book: David Merritt | Dynamics and Evolution of Galactic Nuclei | 2013}}

{{book: Kip Thorne | Black Holes and Time Warps | 1994}}

{{book: Fulvio Melia | The Galactic Supermassive Black Hole | 2007}}

Beyond the books: the two 2000 M–σ papers are worth reading side by side, since they reached different slopes from overlapping data and the reasons are methodological rather than observational — a good study in how a measurement's apparent precision can exceed its reliability. The Event Horizon Telescope's first results papers are unusually explicit about which quantities were fixed in advance. And the NANOGrav 15-year papers are worth seeing for how carefully the Hellings–Downs signature is separated from every other source of correlated timing noise.

## Problems

*Useful numbers: r_h = GM/σ²; θ_sh = 2√27 GM/c²D ≈ 10.4 GM/c²D; M_BH ≈ 1.3 × 10⁸ (σ/200 km s⁻¹)^4.7 M☉; momentum-driven M_BH = f_g σ_T σ⁴/(πG²m_p) with f_g ≈ 0.16; G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; c = 2.998 × 10⁸ m/s; σ_T = 6.652 × 10⁻²⁹ m²; m_p = 1.673 × 10⁻²⁷ kg; 1 pc = 3.086 × 10¹⁶ m; 1 rad = 206265″; growth time = t_S ln(M/M_seed), t_S ≈ 5 × 10⁷ yr.*

**1.** *(The resolution barrier.)* **(a)** Compute r_h for a 10⁸ M☉ black hole in a galaxy with σ = 200 km/s. **(b)** Compute its angular size at 20 Mpc and at 100 Mpc. **(c)** State the consequence for which black holes have reliable masses, and how the rest are estimated.

**2.** *(Assumption budgets.)* For stellar dynamics, gas dynamics, and megamasers: **(a)** state what each measures. **(b)** State the principal assumption each makes. **(c)** Explain why the shortest assumption list gives the best precision, and name the secondary product NGC 4258 also yields.

**3.** *(A prediction fixed in advance.)* **(a)** Compute θ_sh for M87 using M = 6.5 × 10⁹ M☉ and D = 16.8 Mpc. **(b)** Compare with the measured 42 ± 3 μas. **(c)** State precisely what the agreement establishes and one thing it does not.

**4.** *(Why M–σ is strange.)* **(a)** Compute r_h for M87 (σ = 380 km/s) and compare with a 10 kpc bulge. **(b)** State the black hole's fractional contribution to the bulge mass. **(c)** Explain why these two facts together rule out a gravitational explanation, and name the two surviving families.

**5.** *(Deriving the slope.)* **(a)** For an isothermal sphere, show that the gravitational force on the gas within radius R is independent of R. **(b)** Balance it against L_Edd/c to obtain M_BH ∝ σ⁴. **(c)** Evaluate the coefficient at σ = 200 km/s and compare with the observed relation, commenting on the discrepancy.

**6.** *(The statistical alternative.)* **(a)** Explain how repeated mergers can produce a tight M_BH–M_bulge relation with no coupling. **(b)** State where the two explanations make different predictions. **(c)** Explain why the discriminating data are currently the least reliable, and what follows methodologically.

**7.** *(Seeds.)* **(a)** Name the three seed channels with their characteristic masses. **(b)** Compute the growth time from each to 10⁹ M☉ at t_S = 5 × 10⁷ yr. **(c)** State which observation would discriminate between them and why it concerns the low-mass end.

**8.** *(The final parsec.)* **(a)** Describe the three stages of black hole binary coalescence with their scales. **(b)** Explain precisely why the binary stalls, referring to the loss cone. **(c)** State what pulsar timing arrays observed, why the Hellings–Downs correlation was essential, and what it implies about the problem.

**9.** *(Closing the loop.)* **(a)** State how spin affects radiative efficiency, with values for the two extremes. **(b)** State how spin is measured directly. **(c)** Explain how Soltan's photon-budget argument constrains the population-averaged spin, and state the general point this illustrates about a mature theory.

## Worked answers

**1.** **(a)** $r_h = GM/\sigma^2 = (6.674\times10^{-11})(1.989\times10^{38})/(2\times10^5)^2 = 1.327\times10^{28}/4\times10^{10} = 3.32\times10^{17}$ m $= \mathbf{10.8\ pc}$. **(b)** At 20 Mpc: $10.8/(20\times10^6) = 5.4\times10^{-7}$ rad $\times\,206265 = \mathbf{0.11''}$. At 100 Mpc: $\mathbf{0.022''}$. **(c)** Reliable dynamical masses are restricted to **nearby galaxies and to the most massive black holes**, since $r_h$ must be resolved or the black hole's kinematic signature is diluted by surrounding starlight in the same aperture. Everything at cosmological distance is estimated from the **reverberation ladder** — a lag-derived radius for ~100 objects, an extrapolated radius–luminosity relation, and a virial factor $f$ calibrated against $M$–$\sigma$ in *other* galaxies. The samples with the best masses and the most objects therefore barely overlap.

**2.** **(a)** *Stellar dynamics*: the line-of-sight velocity distribution of stars within $r_h$, modelled as orbits. *Gas dynamics*: the rotation curve of an ionised gas disk around the nucleus. *Megamasers*: positions and velocities of individual 22 GHz water maser spots in a sub-parsec disk, resolved by VLBI. **(b)** *Stellar dynamics*: an assumed distribution of stellar orbital anisotropy (degenerate with mass) and a stellar mass-to-light ratio. *Gas dynamics*: that the gas is on circular orbits tracing the gravitational potential — readily violated by outflows and non-gravitational forces. *Megamasers*: essentially only that the disk is Keplerian, which is **verified** rather than assumed, since the measured velocities follow $v\propto r^{-1/2}$. **(c)** Because each assumption introduces a systematic that cannot be reduced by better data, so the error floor is set by the modelling rather than the measurement. Megamasers reduce the problem to **Kepler's third law applied to resolved test particles**, giving NGC 4258's mass to ~1 per cent. The secondary product is a **geometric distance**: combining maser proper motions with their radial accelerations gives a distance with no rungs beneath it, which is why NGC 4258 anchors the cosmic distance ladder.

**3.** **(a)** $GM/c^2 = (6.674\times10^{-11})(1.293\times10^{40})/(8.988\times10^{16}) = 9.60\times10^{12}$ m. $\theta_{\rm sh} = 10.39\times9.60\times10^{12}/(5.18\times10^{23}) = 1.93\times10^{-10}$ rad $= 1.93\times10^{-10}\times206265 = 3.97\times10^{-5}$ arcsec $= \mathbf{39.7\ \mu as}$. **(b)** The measurement was **42 ± 3 μas** — agreement to about 6 per cent, comfortably within the uncertainty. **(c)** It establishes that the object is compact enough to possess a **photon sphere at the radius general relativity predicts**, and that light bends around it as GR describes — with every input (mass from stellar dynamics decades earlier, distance from surface-brightness fluctuations, the factor $2\sqrt{27}$ from the Schwarzschild metric) fixed beforehand and none by the EHT, so nothing could be retuned afterwards. It does **not** by itself demonstrate an **event horizon**: a sufficiently compact horizonless object would cast a similar shadow, and excluding those alternatives requires separate argument.

**4.** **(a)** $r_h = (6.674\times10^{-11})(1.293\times10^{40})/(3.8\times10^5)^2 = 8.63\times10^{29}/1.444\times10^{11} = 5.98\times10^{18}$ m $= \mathbf{194\ pc}$ — about **fifty times smaller** than the 10 kpc bulge over which $\sigma$ is measured. **(b)** Roughly **0.1–0.5 per cent**; for M87, $6.5\times10^9$ against a bulge of order $10^{12}\,M_\odot$ is about 0.65 per cent. **(c)** Because at the radii where the correlated stars live, the enclosed stellar mass exceeds the black hole's by three orders of magnitude, so the black hole contributes negligibly to the potential governing those stars — it cannot be organising them. Yet the correlation is tight to 0.3 dex over several decades in mass, far too tight to be accidental. The two surviving families are therefore **non-gravitational coupling** (energy and momentum from accretion acting on the gas the bulge forms from) and **common assembly history** (the two quantities correlated by how they were built, with no coupling at all).

**5.** **(a)** For an isothermal sphere the enclosed mass is $M(R) = 2\sigma^2R/G$, so the gas mass within $R$ is $M_g = f_g\,2\sigma^2R/G$. The gravitational force on that shell is $GM(R)M_g/R^2 = G(2\sigma^2R/G)(2f_g\sigma^2R/G)/R^2 = \mathbf{4f_g\sigma^4/G}$ — the two factors of $R$ in the numerator cancel the $R^2$, leaving no radial dependence. **(b)** The outward momentum flux from a nucleus at the Eddington limit is $L_{\rm Edd}/c = 4\pi GM_{\rm BH}m_p/\sigma_T$. Setting the two equal: $4\pi GM_{\rm BH}m_p/\sigma_T = 4f_g\sigma^4/G$, so $M_{\rm BH} = f_g\sigma_T\sigma^4/(\pi G^2m_p) \propto \sigma^4$. **(c)** With $f_g = 0.16$, $\sigma = 2\times10^5$ m/s: numerator $= 0.16\times6.652\times10^{-29}\times1.6\times10^{21} = 1.70\times10^{-8}$; denominator $= \pi(6.674\times10^{-11})^2(1.673\times10^{-27}) = 2.34\times10^{-47}$. So $M = 7.3\times10^{38}$ kg $= \mathbf{3.7\times10^{8}\,M_\odot}$, against an observed $1.3\times10^{8}$ — **high by a factor of about three**. For a calculation with **no fitted parameters**, involving a crude isothermal-sphere geometry, an assumed gas fraction, and perfect coupling of radiation momentum to the gas, agreement within a factor of three is a success. Note also that the energy-driven variant gives $\sigma^5$, so the two limits **bracket** the observed 4.7.

**6.** **(a)** Suppose black hole and bulge masses begin uncorrelated with a broad spread of ratios. Each merger adds both, so the ratio in the remnant is a mass-weighted average of the progenitors' ratios. Repeated averaging of independent quantities drives the result toward the population mean and shrinks the scatter — the **central limit theorem** applied to galaxy assembly. A tight relation emerges with **no physical mechanism connecting the two**. **(b)** In systems that have undergone the **fewest mergers**: **low-mass galaxies** and **high-redshift galaxies**. Merger-averaging predicts a much **broader** relation there, tightening with time; self-regulation predicts the relation is imposed physically at each epoch and should be **tight from early on**. **(c)** Because low-mass galaxies have small spheres of influence and high-redshift black holes can only be measured through the reverberation ladder, extrapolated far beyond its calibration range and carrying an uncalibrated virial factor. So the regime that discriminates is exactly the regime where the masses are least trustworthy. Methodologically: **when competing explanations agree everywhere the data are good and differ only where the data are poor, the correlation itself has stopped being evidence** — the effort should go into improving measurements in the discriminating regime rather than into refitting the well-measured one.

**7.** **(a)** **Population III remnants**, ~$100\,M_\odot$, from the first metal-free stars — almost certainly real. **Direct collapse**, $10^4$–$10^5\,M_\odot$, from pristine gas in which molecular hydrogen is destroyed by external ultraviolet radiation so the gas cannot cool below ~$10^4$ K, cannot fragment, and collapses monolithically. **Runaway stellar collisions**, ~$10^3\,M_\odot$, in exceptionally dense young clusters. **(b)** $t = t_S\ln(10^9/M_{\rm seed})$: from $100\,M_\odot$, $\ln(10^7) = 16.1$, so **805 Myr**; from $10^3$, $\ln(10^6) = 13.8$, so **690 Myr**; from $10^4$, $\ln(10^5) = 11.5$, so **576 Myr**; from $10^5$, $\ln(10^4) = 9.2$, so **461 Myr**. **(c)** The **low-mass end of the black hole mass function** — specifically, whether **intermediate-mass black holes** of $10^4$–$10^5\,M_\odot$ exist in dwarf galaxies and globular clusters. Heavy seeds leave a **floor** of ungrown seeds at that mass; light seeds predict a smooth continuation to lower masses and a larger fraction of dwarfs with no black hole at all. The extremes of the distribution carry the information about its origin while the middle, where growth has erased the initial conditions, does not — which is why the search for objects of little individual interest is a central programme.

**8.** **(a)** *Stage 1*, **kiloparsecs to parsecs**: each black hole with its stellar cusp sinks by **dynamical friction**, over a few hundred million years. *Stage 2*, **~parsec**: the two form a bound binary and harden by **three-body slingshots**, ejecting individual stars that carry away orbital energy. *Stage 3*, **below ~$10^{-3}$ pc**: **gravitational-wave emission** takes over and drives rapid coalescence. **(b)** By the time the binary reaches ~1 pc it has **ejected all the stars on orbits passing close enough to interact** — its **loss cone** is empty — and in a smooth spherical potential those orbits are not resupplied, since stars on non-intersecting orbits stay on them. Dynamical friction against the diffuse background is negligible at that separation, and gravitational radiation is still far too weak. The binary is stranded between two mechanisms, potentially for longer than the age of the universe. **(c)** Pulsar timing arrays — NANOGrav's 67 millisecond pulsars over 15 years, with the European and Parkes collaborations — detected a **low-frequency correlated signal in pulsar arrival times**. The **Hellings–Downs** correlation was essential because clock errors, ephemeris errors and interstellar effects also correlate pulsars, but with monopolar or dipolar angular dependence; only a gravitational-wave background produces the specific quadrupolar dependence on pulsar separation. NANOGrav favoured it over independent noise by a Bayes factor above $10^{14}$. Since the amplitude matches expectations for a cosmological population of merging supermassive black hole binaries, the final parsec is evidently **crossed often enough in nature** to build the observed background — though other origins are not formally excluded.

**9.** **(a)** Spin sets the radius of the **innermost stable circular orbit**, and hence how deep matter descends before it ceases to radiate. Non-rotating (Schwarzschild): ISCO at $6GM/c^2$, $\eta = \mathbf{0.057}$. Near-maximally rotating (Kerr): ISCO far closer in, $\eta$ up to $\mathbf{0.42}$ — a factor of more than seven. **(b)** From the profile of the **relativistically broadened iron Kα line** at 6.4 keV. Its extended red wing is produced by gravitational redshift and Doppler effects on fluorescence from the innermost disk, so the line shape reports how close to the hole the disk extends, and therefore the ISCO radius and the spin. **(c)** Soltan's argument compares the integrated quasar light with the local black hole mass density and requires $\eta \approx 0.1$ for the budget to close. Since $\eta$ is a monotonic function of spin, that **measures the population-averaged spin as moderate** — comfortably above the non-rotating value, well below maximal. The general point: **in a well-connected theory, a measurement of one quantity constrains another sharing no observational channel with it**, because both are wired into the same framework. A photon count across cosmic time thereby bounds the average angular momentum of black holes, which is why apparently unrelated results in a mature field are not independent, and why a discrepancy anywhere propagates.$egSmbh_master$,
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
