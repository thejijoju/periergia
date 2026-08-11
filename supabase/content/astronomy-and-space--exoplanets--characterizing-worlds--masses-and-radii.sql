-- Astronomy & Space · Exoplanets — Characterizing Worlds — "Masses & Radii".
-- Curated master for
-- astronomy-and-space/exoplanets/characterizing-worlds/masses-and-radii
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the Characterizing Worlds block. Organised around the fact that
-- the mass-radius diagram is the field's most information-dense plot
-- while an individual point on it is nearly uninformative - the
-- structure carries what the points cannot. Covers how each quantity is
-- actually obtained and what it inherits from the star; the three
-- regimes of the relation, including the counterintuitive one where
-- radius decreases with mass because of electron degeneracy; why
-- composition curves are separated by a constant fractional but a small
-- absolute radius at low mass, which is what makes discrimination
-- hardest exactly where it matters; the RV/TTV mass offset as a real
-- unresolved discrepancy; and intrinsic scatter as a physical result
-- rather than a measurement failure.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: Jupiter 317.8 Me, 10.97 Re,
-- 1.33 g/cc; Saturn 95.2 Me, 9.14 Re, 0.69 g/cc; Neptune 17.1 Me,
-- 3.86 Re, 1.64 g/cc; Earth 5.51 g/cc. Composition tracks
-- R = 0.80 M^0.25 (iron), M^0.27 (Earth-like) and 1.4 M^0.27 (water-
-- rich) give a constant 40% fractional separation between rock and
-- water but an absolute separation of only 0.40 Re at 1 Me against
-- 0.74 Re at 10 Me.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/characterizing-worlds/masses-and-radii',
    'research',
    'advanced',
    'read',
    $exMR_master$> A single point on the mass–radius diagram tells you almost nothing. A planet of $2\,M_\oplus$ and $1.4\,R_\oplus$ could be a water world, a rock with a thin hydrogen envelope, or an iron-rich body with a thick steam atmosphere, and no improvement in the precision of either measurement will decide between them.

**The diagram as a whole tells you a great deal.** Where planets cluster, where they are absent, where the composition curves converge and where they separate, how the scatter varies with mass — these carry information that no individual measurement contains, and they are why the plot has organised the field's thinking for two decades.

This chapter is about both halves of that: how the two quantities are obtained and what they inherit, why one number cannot resolve three unknowns, and what the diagram's structure nevertheless establishes.

## 1. Where the numbers come from

### 1.1 Radius

Only one method measures a radius: a transit, giving

$$\delta = \left(\frac{R_p}{R_\star}\right)^2.$$

**This is a ratio.** The planet's radius is that ratio multiplied by the stellar radius, which comes from spectroscopy, evolutionary models and — since Gaia — a parallax that fixes the luminosity. Typical stellar radius uncertainties are a few per cent for well-characterised hosts, and the planet radius inherits that in full.

**The inheritance is not a rounding error.** Gaia's parallaxes revised many Kepler stellar radii upward, and every planet radius derived from them moved with its host. The consequence was scientific, not bookkeeping: sharpening stellar radii is what made the radius valley resolvable.

Two further effects bias the measured radius.

**Limb darkening** must be modelled to convert the light curve's shape into $R_p/R_\star$, and the coefficients usually come from stellar atmosphere models — a model dependence in what looks like a geometric measurement.

**Dilution.** Unresolved light from a companion or background star within the photometric aperture makes the transit shallower, so the inferred radius is too small. Gaia's angular resolution has identified many such blends, and correcting for them systematically increased radii in affected systems.

### 1.2 Mass

Three routes, with different systematics.

**Radial velocity** gives $M_p\sin i$, which becomes a true mass when a transit fixes $i \approx 90°$. It depends on the stellar mass as $M_\star^{2/3}$, so it inherits stellar characterisation too. Its precision is limited by stellar activity, not by instrumentation.

**Transit timing variations** give masses photometrically from mutual perturbations, without any spectroscopy. Indispensable for faint hosts — TRAPPIST-1's masses are almost entirely from TTVs — but they require a dynamical model, and different models fitted to identical timing data have yielded different masses.

**Astrometry** gives the true mass with no $\sin i$ and no dynamical modelling of other planets, and it is the cleanest of the three where it is available.

### 1.3 A discrepancy worth knowing

**Masses obtained by TTVs have tended to come out lower than masses obtained by radial velocity** for planets of similar radius. The offset has been reported repeatedly and is not fully explained.

Several contributing effects have been identified. TTVs are most sensitive in systems near resonance, which may differ physically from the general population — resonant systems may genuinely have lower-density planets. Radial velocity masses for low-amplitude signals are biased upward, since a planet is more likely to be reported when noise adds to its signal than when noise subtracts. And TTV analyses in the presence of unmodelled additional planets can be biased.

**The honest position** is that a systematic difference exists between two mass measurement techniques, that it is partly explained, and that a residual remains. Anyone combining masses from both sources in a single analysis is combining quantities with a known relative offset — which is worth stating whenever mass–radius relations are fitted to heterogeneous catalogues, as they usually are.

## 2. Three regimes

The relation between mass and radius has three distinct behaviours, and the third is the counterintuitive one.

### 2.1 Rocky: $R \propto M^{0.27}$

Below about $1.5\,R_\oplus$, planets follow composition tracks for iron and silicate mixtures. The exponent is below $1/3$ because a more massive planet compresses its own interior — self-compression, discussed in the super-Earths chapter.

| Mass | Iron | Earth-like | Water-rich |
|---|---|---|---|
| $1\,M_\oplus$ | $0.80\,R_\oplus$ | $1.00\,R_\oplus$ | $1.40\,R_\oplus$ |
| $2\,M_\oplus$ | $0.95$ | $1.21$ | $1.69$ |
| $5\,M_\oplus$ | $1.20$ | $1.54$ | $2.16$ |
| $10\,M_\oplus$ | $1.42$ | $1.86$ | $2.61$ |

### 2.2 Volatile-rich: radius rises steeply

Between roughly $2$ and $10\,R_\oplus$, radius is governed by envelope mass fraction rather than by core composition, and it rises steeply with small additions of hydrogen and helium. **In this regime radius is a poor proxy for mass**, since a factor of five in mass can correspond to almost no change in radius, and a factor of two in radius to almost no change in mass.

### 2.3 Degenerate: radius stops rising, then falls

Above roughly a Jupiter mass, electron degeneracy pressure begins to support the interior, and its equation of state has an unusual consequence. Adding mass increases the compression nearly as fast as it adds material, so **radius becomes almost independent of mass**, and above about $3$–$4\,M_{\rm J}$ it begins to *decrease*: for fully degenerate matter, $R \propto M^{-1/3}$.

The maximum radius, for a cold non-irradiated object, sits near $1.1$–$1.2\,R_{\rm J}$ at a few Jupiter masses.

**The consequences are large.** Gas giants, brown dwarfs and the smallest stars all have radii near $1\,R_{\rm J}$ across three orders of magnitude in mass, so **a radius measurement cannot identify a companion in this range** — the point made in the transits chapter, now with its physical reason. And a measured radius substantially above $1.2\,R_{\rm J}$ requires an internal heat source, which is the radius inflation problem.

```checkpoint
q: Gas giants, brown dwarfs and the lowest-mass stars all have radii near one Jupiter radius. What is the physical reason?
a: They all formed from the same material, so their densities are similar
x: Composition is broadly similar but does not by itself produce a mass-independent radius across three orders of magnitude.
a*: Electron degeneracy pressure supports their interiors, and its equation of state makes compression grow nearly as fast as added mass — so radius becomes almost independent of mass and eventually decreases as $M^{-1/3}$
a: They are all inflated by stellar irradiation to a common size
x: The effect applies to isolated objects too, and irradiation inflates only strongly heated close-in planets.
a: Their radii are measured relative to their host stars, which are of similar size
x: Radii are inferred as absolute quantities once the stellar radius is known, and the pattern holds for isolated brown dwarfs with no host.
hint: Ask what supports the interior of an object of this mass, and how that support responds to added mass.
why: Below about a Jupiter mass, Coulomb forces between ions dominate the pressure and radius rises with mass. Above it, **electron degeneracy pressure** takes over, and its equation of state has the peculiar property that adding mass compresses the object almost as much as it enlarges it: radius flattens near $1.1$–$1.2\\,R_{\\rm J}$ for a cold object at a few Jupiter masses, and for fully degenerate matter $R\\propto M^{-1/3}$, so above that the radius *falls*. The result is that a Jupiter-mass planet, a $50\\,M_{\\rm J}$ brown dwarf and an $80\\,M_{\\rm J}$ star all sit near one Jupiter radius. Two consequences follow directly. **A transit alone cannot identify the companion** in this range — a one per cent transit depth around a Sun-like star is consistent with all three — which is why radial velocity follow-up is mandatory and why the transit's contribution to that measurement, fixing the inclination, matters so much. And a measured radius well above $1.2\\,R_{\\rm J}$ requires an internal energy source, since degeneracy alone cannot produce it: that is the radius inflation problem, and its existence is diagnosed against exactly this baseline.
---
q: Masses measured by transit timing variations tend to come out lower than radial velocity masses for planets of similar radius. What is the correct assessment?
a: TTV masses are unreliable and should be excluded from mass–radius analyses
x: TTVs are the only route to masses for faint hosts and have delivered high-precision results; wholesale exclusion is not warranted.
a*: A real systematic offset exists between the two techniques, is partly explained by known effects, and leaves a residual — so combining them in one analysis mixes quantities with a known relative bias
a: The offset is entirely explained by the fact that TTV systems are near resonance
x: Resonant systems may genuinely differ, which is one contributing explanation among several, but it does not account for the whole offset.
a: The offset reflects a genuine physical difference and both measurements are correct
x: Partly, perhaps — but known measurement biases are also present, so attributing it wholly to physics is unjustified.
hint: List the ways each technique's sample or estimator could be biased, and ask whether they exhaust the discrepancy.
why: Three effects contribute and none is sufficient alone. **Sample difference:** TTVs are most sensitive near mean-motion resonance, and resonant systems may genuinely contain lower-density planets, so the two techniques may be measuring physically different populations. **Estimator bias in radial velocity:** for low-amplitude signals, a planet is more likely to be reported when noise adds to its signal than when it subtracts, biasing published masses upward — the standard selection effect on marginal detections. **Model dependence in TTVs:** an unmodelled additional planet perturbs the fit and can bias the recovered masses. After accounting for these a residual remains, and it is unresolved. The practical consequence is what matters: **mass–radius relations are routinely fitted to heterogeneous catalogues combining both sources**, which mixes quantities with a known relative offset and propagates it into the fitted relation. That should be stated whenever such a relation is used, and it is an argument for fitting to homogeneous subsamples even at the cost of statistics.
```

## 3. Why composition inference is hardest where it matters

The composition tracks in the table above are separated by a **constant fractional** amount — a water-rich planet is about $40\%$ larger than a rocky one at any mass. But the *absolute* separation grows with mass:

| Mass | Rock–water radius difference |
|---|---|
| $1\,M_\oplus$ | $0.40\,R_\oplus$ |
| $10\,M_\oplus$ | $0.74\,R_\oplus$ |

**Measurement precision, by contrast, is roughly a fixed fraction of the radius**, dominated by the inherited stellar radius uncertainty of a few per cent. So the ratio of separation to error is approximately constant — which sounds acceptable until one notices that the *interesting* compositional distinctions at low mass are much finer than rock versus water.

Distinguishing an Earth-like iron fraction from a Mercury-like one, or detecting a $0.1\%$ hydrogen envelope, requires radius precision of order one per cent, which requires stellar radii to one per cent, which is at the edge of what is achievable for the brightest hosts and unattainable for most.

**The consequence is a systematic weakness at exactly the planets of greatest interest.** Terrestrial-mass planets are where composition matters most for questions about surfaces and habitability, and they are where the bulk-density method is least able to discriminate. This is not a temporary limitation to be fixed by more transits: it is set by the stellar characterisation, and it will improve only as stellar astrophysics does.

## 4. What the diagram's structure establishes

Individual points are weak; the structure is strong. Five features carry most of the information.

**The rocky sequence exists and is tight.** Planets below $1.5\,R_\oplus$ cluster along the Earth-composition track rather than scattering. This means small planets are predominantly rock and iron in roughly terrestrial proportions — a real compositional result, and one that constrains formation to have delivered similar material to similar places.

**The radius valley is a gap in a distribution, not in a relation.** It appears in the occurrence-versus-radius histogram, and it separates two populations rather than marking a discontinuity in the mass–radius relation itself.

**The volatile-rich regime is a near-vertical band.** In the sub-Neptune range, radius varies widely at fixed mass, which is exactly the signature of a quantity controlled by something other than mass — envelope fraction.

**The degenerate plateau caps the diagram.** Nothing sits above $\sim1.2\,R_{\rm J}$ unless it is being heated, which turns radius inflation from an oddity into a measurement of internal energy deposition.

**There is intrinsic scatter, and it is real.** The spread of radii at fixed mass exceeds measurement uncertainty in every well-measured range. **This is a physical result:** planets of the same mass genuinely differ in composition and structure, so no single mass–radius relation describes the population, and fitting one and quoting its scatter as an error is a category mistake. Predicting a planet's radius from its mass alone is not possible beyond a broad range, and empirical relations should be understood as summarising a distribution rather than a law.

{{image: Exoplanet | The bulk properties of a planet — its mass and its radius — are the only characteristics measurable for the great majority of known worlds, and together they yield a single number, the mean density. That number underdetermines composition, since a realistic interior has at least three components against two observables, so an individual point on the mass-radius diagram is consistent with several very different planets. The diagram's collective structure is far more informative than any of its points: the tightness of the rocky sequence, the near-vertical spread in the sub-Neptune range, the plateau imposed by electron degeneracy above a Jupiter mass, and the intrinsic scatter that no single relation can absorb.}}

{{image: Brown dwarf | An object more massive than a planet but below the hydrogen-burning limit, supported largely by electron degeneracy pressure. Because that pressure's equation of state makes added mass compress an object nearly as much as it enlarges it, brown dwarfs share a radius of close to one Jupiter radius with both gas giants below them and the lowest-mass stars above — across three orders of magnitude in mass. A measured radius in this range therefore identifies nothing, which is why a mass determination is mandatory before a transiting companion of Jupiter size can be classified, and why the transit's own contribution to that measurement, fixing the orbital inclination so that a Doppler amplitude yields a true rather than a minimum mass, is what makes the pair of techniques indispensable together.}}

## 5. Density, and what it does not mean

Mean density is the quantity mass and radius jointly produce, and it is routinely over-interpreted. Three cautions are worth stating explicitly.

**Mean density is not surface density or core density.** A planet's mean density averages an interior spanning many orders of magnitude in local density, and two planets with identical means can have very different radial structures — one centrally condensed with a large iron core, one more uniform. Nothing in the mean distinguishes them.

**Comparisons with Solar System bodies are weaker than they look.** Earth and Mercury have almost the same mean density, $5.51$ and $5.43$ g cm$^{-3}$, and radically different compositions: Mercury's iron core occupies about $70\%$ of its mass against Earth's $32\%$. The coincidence arises because Earth's greater mass compresses its silicate mantle to a density that mimics Mercury's uncompressed iron-rich mixture. **Density comparisons must be made against composition curves at the correct mass**, never against another planet's density directly.

**Irradiation changes radius without changing composition.** A strongly heated planet is larger than an identical cold one, which shifts its density without any compositional difference. For hot Jupiters this is the inflation problem; for smaller planets it is a systematic that must be modelled before a density is interpreted.

The practical rule that follows: **a density is only interpretable relative to a composition track evaluated at that planet's mass and irradiation**, and a quoted density without that context carries very little.

```checkpoint
q: Earth and Mercury have nearly the same mean density — $5.51$ and $5.43$ g cm$^{-3}$ — but very different compositions. Why?
a: Their densities are similar because their compositions are in fact similar, and the difference in core fraction has been overstated
x: Mercury's core is about $70\%$ of its mass against Earth's $32\%$, a large and well-established difference.
a*: Because Earth's greater mass compresses its silicate mantle to a density that mimics Mercury's uncompressed but far more iron-rich mixture
a: Because Mercury's proximity to the Sun has heated and expanded it, lowering its density to match Earth's
x: Thermal expansion in rock is far too small to produce this, and Mercury's high density is a compositional fact.
a: Because mean density is dominated by the surface layers, which are similar in both
x: Mean density is a whole-body average dominated by the interior, where the two differ most.
hint: Ask what self-compression does to a more massive planet's mean density along a fixed composition track.
why: Along any composition track, mean density rises with mass because the planet's own gravity compresses its interior — Earth-composition planets go from $5.51$ g cm$^{-3}$ at one Earth mass to $8.54$ at ten. **Mercury is far more iron-rich but far less compressed; Earth is less iron-rich but more compressed; the two effects cancel.** The lesson is procedural and applies throughout the field: **a density is only interpretable against a composition track evaluated at that planet's mass**, never by direct comparison with another planet of different mass. Two further cautions belong with it. Mean density averages over an interior spanning orders of magnitude in local density, so two planets with identical means can differ entirely in radial structure — one centrally condensed, one uniform — and the mean cannot distinguish them, which is why the Love number, measuring tidal deformation and hence the density profile, is valuable despite being measurable for almost nothing. And irradiation inflates a planet without changing its composition, so a density must be interpreted at the planet's actual insolation, not against a cold model.
---
q: Why are Solar System planets useful as anchors for the exoplanet mass–radius diagram despite being few in number?
a: Because their masses and radii are known to far higher precision than any exoplanet's
x: True, and it matters, but precision is not what makes them uniquely valuable here.
a*: Because their compositions are known independently — from seismology, moment of inertia, samples and spacecraft — so they calibrate the mapping from density to composition rather than merely adding points
a: Because they span a wider range of masses than the exoplanet sample
x: The exoplanet sample spans a far wider range, including regimes the Solar System lacks entirely.
a: Because they are unaffected by the selection effects that bias exoplanet catalogues
x: A sample of eight is subject to its own limitations, and freedom from selection bias does not calibrate composition.
hint: The composition problem is underdetermined for exoplanets. Ask what is known about Solar System planets that is not known about any exoplanet.
why: For an exoplanet, mass and radius are all there is, and they underdetermine composition. For Solar System planets, composition is constrained by measurements no exoplanet can supply: **seismology** for Earth, **moments of inertia** from spacecraft tracking, **direct samples** for Earth, the Moon and Mars, and detailed gravity fields for the giants. That makes them calibration points rather than data points — they fix where real objects of known composition sit relative to the theoretical tracks, testing the equations of state and the structure models on which every exoplanet inference depends. Their limitation is coverage: the Solar System contains nothing between Earth and Neptune, which is precisely the mass range where the exoplanet population is densest and where the composition problem is hardest, so the calibration is anchored on either side of the region of greatest interest and interpolated across it. That is a real weakness of the whole enterprise, and it is one reason laboratory equation-of-state work at megabar pressures matters more to exoplanet science than its profile suggests.
```

## 6. Beyond bulk density

Three routes add information that mass and radius cannot supply.

**Atmospheric spectroscopy** measures mean molecular weight through the scale height, distinguishing a hydrogen envelope from a steam atmosphere by a factor of twenty in signal amplitude. This is the principal escape from the degeneracy and the subject of the next two chapters.

**Tidal response.** A planet's Love number measures how much it deforms under its star's tidal field, and it depends on the interior density profile rather than only on the mean — so a centrally condensed planet and a uniform one of the same mass and radius have different Love numbers. Measuring it requires detecting the resulting apsidal precession or a departure from a spherical transit shape, both extremely demanding, and it has been achieved for very few objects. **It is the only known bulk probe of the interior's radial structure.**

**Population-level priors.** Fitting several planets in one system under the assumption of a shared formation history reduces the free parameters relative to the observables, which is the standard route to progress on an underdetermined problem — and it is why well-characterised multi-planet systems are worth more than the same number of isolated planets.

```checkpoint
q: Composition tracks are separated by a constant fractional radius difference of about $40\%$ between rock and water, and radius measurement errors are also a roughly fixed fraction. Why is composition inference nevertheless hardest for the smallest planets?
a: Because small planets have larger fractional radius errors than large ones
x: Fractional error is dominated by the inherited stellar radius uncertainty, which does not depend on planet size.
a*: Because the compositional distinctions that matter at low mass — iron fraction, or a tenth of a per cent of hydrogen — are far finer than rock versus water, and resolving them needs about one per cent radius precision
a: Because small planets are fainter and therefore harder to observe
x: The planet's own brightness plays no part in a transit radius measurement, which depends on the host's brightness.
a: Because the composition tracks converge at low mass
x: They separate by a constant *fraction* at all masses; the absolute separation shrinks, but the fractional one does not.
hint: Ask what compositional question one actually wants to answer for a terrestrial-mass planet, and how large a radius difference it corresponds to.
why: The rock-versus-water distinction is coarse, and at a constant $40\\%$ fractional separation it is resolvable at any mass given few-per-cent radii. **But that is not the question one wants answered for a terrestrial planet.** The interesting distinctions there are whether the iron fraction resembles Earth's or Mercury's, and whether a few tenths of a per cent of hydrogen is present — differences of order one to a few per cent in radius, requiring radius precision of about one per cent, which requires stellar radii to one per cent. That is at the edge of what is achievable for the very brightest hosts and out of reach for most. The result is a **systematic weakness at exactly the planets of greatest interest**: terrestrial masses are where composition bears on surfaces and habitability, and where bulk density discriminates least. This is not fixed by collecting more transits, because the limiting term is the stellar characterisation rather than the photometry — so progress depends on stellar astrophysics rather than on exoplanet observing.
---
q: The scatter in radius at fixed mass exceeds measurement uncertainty across the well-measured range. What does this establish?
a: That the measurements contain unrecognised systematic errors
x: Systematics exist, but the scatter persists in homogeneously measured subsamples where they are controlled.
a*: That the scatter is physical — planets of the same mass genuinely differ in composition and structure — so no single mass–radius relation describes the population
a: That the mass measurements are less reliable than the radius measurements
x: The scatter appears in radius at fixed mass and in mass at fixed radius alike; it is not attributable to one axis.
a: That the sample mixes planets around different types of star
x: Host type contributes some variation but does not account for the full spread, which persists within host classes.
hint: Ask what a fitted relation's residual scatter means when it exceeds the error bars.
why: When residual scatter about a fitted relation exceeds the measurement uncertainties, the excess is by definition not measurement error — it is **intrinsic**, reflecting real diversity in the objects. Here that means planets of equal mass genuinely differ in composition, envelope fraction, thermal history and internal structure, which is exactly what the underdetermined inverse problem would lead one to expect: many compositions share a mass, and they occupy different radii. Two practical consequences follow. **A fitted mass–radius relation summarises a distribution rather than expressing a law**, so quoting its scatter as an uncertainty on a predicted radius is a category mistake — the prediction is a distribution, not a value with an error bar. And **predicting an individual planet's radius from its mass is not possible beyond a broad range**, which matters because such predictions are routinely used to estimate radii for radial-velocity planets that do not transit, and to plan follow-up. The honest use is to treat the relation as a prior and to propagate the full intrinsic spread rather than the fit uncertainty.
```

```checkpoint
q: What does a measurement of a planet's Love number add that mass and radius cannot supply?
a: The planet's total mass, independently of radial velocity
x: Mass must already be known to interpret a tidal deformation; the Love number is a dimensionless response, not a mass.
a*: The interior's radial density profile — distinguishing a centrally condensed planet from a more uniform one of identical mass and radius
a: The planet's rotation rate, from the shape of its tidal bulge
x: Rotation affects oblateness rather than the tidal Love number, which responds to the star's field.
a: The composition of the planet's atmosphere
x: Atmospheric composition comes from spectroscopy; the Love number probes the deep interior.
hint: Mean density averages the interior. Ask what observable responds to how that density is distributed with radius.
why: Mass and radius jointly give one number, the **mean** density, which averages over an interior spanning many orders of magnitude in local density. Two planets with identical means can have entirely different structures — one with a large dense core and a light mantle, one more uniform — and nothing in the mean distinguishes them. The **Love number** measures how much the planet deforms under its star's tidal field, and that response depends on how mass is distributed with radius: a centrally condensed body deforms less than a uniform one of the same mean density. It is therefore the only known bulk probe of internal structure, which makes it disproportionately valuable for breaking the composition degeneracy — a large iron core and a thick water layer can share a mean density but not a Love number. The obstacle is measurement: it requires detecting the resulting apsidal precession over many orbits, or a departure from a spherical planet's transit shape, both demanding enough that it has been achieved for very few objects. Its scarcity, rather than its usefulness, is why bulk-density inference remains the standard.
---
q: A paper reports a planet's mean density as $3.8$ g cm$^{-3}$ with no further context. How much does that number convey?
a: A great deal — density directly indicates composition, and $3.8$ g cm$^{-3}$ implies a substantial water fraction
x: It implies less dense than rock at some mass, but which compositions fit depends entirely on what that mass is.
a*: Very little on its own — a density is interpretable only against a composition track evaluated at that planet's mass and irradiation
a: Nothing at all, since density is degenerate with respect to composition
x: Too strong: with the mass and irradiation supplied, a density does constrain composition, even if it does not determine it.
a: Enough to classify the planet, since density thresholds separate rocky from gaseous worlds
x: There are no fixed density thresholds, because the density of any given composition varies with mass through self-compression.
hint: Recall that Earth and Mercury share a density with very different compositions. Ask what else must be specified.
why: Density along any composition track **rises with mass** because of self-compression — an Earth-composition planet goes from $5.51$ g cm$^{-3}$ at one Earth mass to $8.54$ at ten — so no fixed density corresponds to a fixed composition. Earth and Mercury make the point at close quarters: $5.51$ and $5.43$ g cm$^{-3}$, with core mass fractions of $32\%$ and $70\%$, because Earth's greater compression mimics Mercury's greater iron content. **A density therefore requires the mass to be interpretable at all.** Irradiation adds a second requirement, since a strongly heated planet is larger and hence less dense than an identical cold one, with no compositional difference — the extreme case being the inflated hot Jupiters, but the effect operates in milder form throughout. The practical rule is that a density is meaningful only relative to a composition curve evaluated at that planet's mass and insolation, and that direct comparisons of one planet's density with another's are almost always invalid unless the masses match.
```

```checkpoint
q: Why does the tightness of the rocky sequence below $1.5\,R_\oplus$ count as a scientific result rather than a description?
a: Because it shows that measurement precision is good enough to resolve individual compositions
x: Precision is insufficient to resolve individual iron fractions; the result comes from the population's tightness, not from any single planet.
a*: Because scatter would be expected if small planets varied widely in iron fraction, so the tightness shows they are predominantly rock and iron in roughly terrestrial proportions
a: Because it confirms that the Earth-composition curve is the correct theoretical model
x: The curve is calibrated on Solar System bodies with independently known compositions; the exoplanet result is about where planets sit, not about the curve's validity.
a: Because a tight sequence is required for the mass–radius relation to be useful for prediction
x: Usefulness for prediction is a consequence rather than the reason the result is informative.
hint: Ask what the diagram would look like if formation delivered a wide range of iron fractions to small planets.
why: The composition tracks for iron, rock and water are widely separated — a water-rich planet is about $40\%$ larger than a rocky one at the same mass, and a pure-iron planet about $20\%$ smaller. **If formation delivered a broad range of compositions to small planets, the observed points would scatter across that whole span.** They do not: below about $1.5\,R_\oplus$ planets cluster along the Earth-composition track. Since each individual planet's composition is not resolvable, the result lives entirely at the population level, which is the general escape from an underdetermined inverse problem — a degenerate measurement repeated across many objects constrains the distribution of the underlying quantity even where it cannot determine any single value. The physical conclusion is that small planets are predominantly rock and iron in roughly terrestrial proportions, which is a real constraint on formation: whatever process built them delivered similar material to similar places rather than sampling a wide compositional range. The exceptions matter for the same reason — the few unusually dense small planets, plausibly iron-rich remnants of giant impacts, stand out precisely because the sequence is otherwise tight.
---
q: Which improvement would do most to advance bulk characterisation of terrestrial-mass exoplanets?
a: Longer radial velocity campaigns to reduce mass uncertainties
x: Helpful, but masses are not the binding constraint, and radial velocity precision on such planets is limited by stellar activity rather than by campaign length.
a*: Better stellar characterisation, since planet radii are inherited from stellar radii and the required one per cent precision is currently out of reach for most hosts
a: More transits per planet to improve the photometric precision
x: Photometric precision on the transit depth is already better than the stellar radius uncertainty for good targets, so extra transits do not help.
a: Larger samples, so that population statistics constrain individual compositions
x: Population statistics constrain distributions, not individual objects, and the question is about characterising particular planets.
hint: Trace the chain from what is measured to what is wanted, and identify which link carries the largest uncertainty.
why: A transit measures $(R_p/R_\star)^2$ to high precision; the planet radius is that ratio times the **stellar** radius, so the planet inherits the star's fractional uncertainty in full. The compositional questions that matter at terrestrial masses — an Earth-like versus a Mercury-like iron fraction, or the presence of a few tenths of a per cent of hydrogen — correspond to radius differences of one to a few per cent, so they demand stellar radii known to about one per cent. That is at the edge of achievable for the very brightest hosts and unattainable for most, which makes stellar characterisation the binding link. Gaia's parallaxes demonstrated the leverage directly: better distances gave better luminosities, hence better stellar radii, and every planet radius moved — which is what made the radius valley resolvable. **The route to better exoplanet characterisation runs through stellar astrophysics**, via asteroseismology, interferometric radii for nearby stars, and improved model atmospheres. That is an unglamorous conclusion, and it is why the field's progress on small planets is paced by work that is not about exoplanets at all.
```

## 7. Pulling the thread

- **A single point on the diagram is nearly uninformative**; its structure is where the information is. Mass and radius give one number, and one number cannot resolve three compositional components.
- **Both quantities are inherited.** Radius is a ratio times the stellar radius; radial velocity mass scales as $M_\star^{2/3}$. Gaia's parallaxes moved the whole population and thereby revealed the radius valley.
- **Three mass techniques with different systematics**, and a real unexplained residual offset between TTV and radial velocity masses — which matters because relations are fitted to catalogues mixing both.
- **Three regimes:** rocky at $R\propto M^{0.27}$; volatile-rich, where radius tracks envelope fraction rather than mass; and degenerate, where radius flattens near $1.1$–$1.2\,R_{\rm J}$ and then falls as $M^{-1/3}$.
- **The degenerate plateau is why a transit cannot identify a Jupiter-sized companion**, and why any radius above it demands an internal heat source.
- **Discrimination is weakest where it matters most.** Resolving iron fractions or per-mille envelopes needs one per cent radii, hence one per cent stellar radii — so terrestrial planets are the hardest case, and the fix lies in stellar astrophysics.
- **The intrinsic scatter is physical.** No single relation describes the population, and quoting a fit's scatter as a prediction error confuses a distribution with a measurement.

The transferable idea: **when individual measurements are degenerate, look for information in the shape of the population rather than in the precision of its members.** No amount of refinement makes one density determine three components, and the field's real advances from this diagram came from features that are properties of the sample and not of any planet in it — the tightness of the rocky sequence showing that small planets share a composition; the near-vertical sub-Neptune band showing that envelope fraction rather than mass controls radius there; the plateau at $1.2\,R_{\rm J}$ turning inflation into a measurement; the intrinsic scatter proving genuine diversity. **A degenerate measurement repeated across a population stops being degenerate at the population level**, because the distribution of outcomes constrains what the underlying distribution of compositions can be. That is a general escape from underdetermination, and it is available whenever the same ambiguous measurement can be made many times on different objects.

## 8. Further reading

{{book: Sara Seager | Exoplanets | 2010}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Jack Lissauer and Imke de Pater | Fundamental Planetary Science | 2019}}

Beyond the books: Zeng and Sasselov's mass–radius curves are the standard reference for the composition tracks, and their stated uncertainties make the degeneracy explicit in a way that summaries usually do not. Seager's chapter on interiors derives the self-compression scaling from the equation of state and is worth working through rather than taking the exponent on trust. On the TTV–radial velocity mass offset, the useful reading is a paper reporting the discrepancy alongside one proposing an explanation, since the size of the unexplained residual is exactly what is in dispute.

## Problems

*Useful numbers: $R/R_\oplus = 0.80(M/M_\oplus)^{0.25}$ (iron), $(M/M_\oplus)^{0.27}$ (Earth-like), $1.4(M/M_\oplus)^{0.27}$ (water-rich); rock–water radius difference $0.40\,R_\oplus$ at $1\,M_\oplus$ and $0.74\,R_\oplus$ at $10\,M_\oplus$; Jupiter $317.8\,M_\oplus$, $10.97\,R_\oplus$, $1.33$ g cm$^{-3}$; Saturn $95.2\,M_\oplus$, $9.14\,R_\oplus$, $0.69$ g cm$^{-3}$; Neptune $17.1\,M_\oplus$, $3.86\,R_\oplus$, $1.64$ g cm$^{-3}$; Earth $5.51$ g cm$^{-3}$; degenerate maximum radius $1.1$–$1.2\,R_{\rm J}$; $R\propto M^{-1/3}$ for full degeneracy.*

**1.** *(Provenance.)* **(a)** State what a transit measures and what must be supplied to convert it to a radius. **(b)** Name two effects that bias the measured radius and state the direction of each. **(c)** State how radial velocity mass depends on the stellar mass.

**2.** *(Three routes.)* For radial velocity, transit timing variations and astrometry: state what each measures, its principal systematic, and one situation where it is the only option.

**3.** *(The offset.)* **(a)** State the direction of the TTV–radial velocity mass discrepancy. **(b)** Give three contributing explanations. **(c)** State the practical consequence for fitted mass–radius relations.

**4.** *(Regimes.)* **(a)** Give the three regimes with their approximate mass ranges. **(b)** Explain why radius is a poor proxy for mass in the middle regime. **(c)** Explain why radius decreases with mass in the third.

**5.** *(Degeneracy plateau.)* **(a)** State the maximum radius and the mass at which it occurs. **(b)** State what this implies for identifying a companion from a transit alone. **(c)** State what a radius above the plateau implies and name the associated open problem.

**6.** *(Composition curves.)* **(a)** Compute the radii of iron, Earth-like and water-rich planets of $3\,M_\oplus$. **(b)** State the fractional and absolute separations between rock and water. **(c)** Explain why inference is hardest for the smallest planets despite the constant fractional separation.

**7.** *(Structure.)* Give five features of the mass–radius diagram's structure and state what each establishes.

**8.** *(Scatter.)* **(a)** State what it means that scatter exceeds measurement uncertainty. **(b)** State the consequence for fitted relations. **(c)** State how such a relation should properly be used.

**9.** *(Escapes.)* **(a)** Name three routes to information beyond bulk density. **(b)** For each, state what it adds. **(c)** State the general principle about degenerate measurements repeated across a population.

## Worked answers

**1.** **(a)** The ratio $(R_p/R_\star)^2$; converting to a radius requires the stellar radius, from spectroscopy and evolutionary models constrained by a parallax-derived luminosity. **(b)** *Dilution* by unresolved light in the aperture makes the transit shallower and the inferred radius too small; *limb darkening*, if mismodelled, biases the fitted $R_p/R_\star$ in either direction and introduces a stellar-atmosphere model dependence into an apparently geometric measurement. **(c)** As $M_\star^{2/3}$, so the mass inherits stellar characterisation error just as the radius does.

**2.** *Radial velocity:* measures $M_p\sin i$, becoming a true mass when a transit fixes the inclination; principal systematic is stellar activity, which is astrophysical rather than instrumental; it is the only option for non-transiting planets around bright stars. *TTVs:* measure masses photometrically from mutual perturbations; principal systematic is model dependence, since different dynamical models fitted to the same timings give different masses; the only option for faint hosts, as with TRAPPIST-1. *Astrometry:* measures the true mass with no $\sin i$ and no multi-planet dynamical model; principal systematic is the stellar photocentre shifting with spots; the only option for measuring a directly imaged planet's mass without an evolutionary model.

**3.** **(a)** TTV masses come out lower than radial velocity masses for planets of similar radius. **(b)** TTVs are most sensitive near resonance, and resonant systems may genuinely host lower-density planets; radial velocity masses for low-amplitude signals are biased upward, since detection is favoured when noise adds to the signal; and TTV fits can be biased by unmodelled additional planets. **(c)** Mass–radius relations are usually fitted to heterogeneous catalogues combining both sources, so they inherit a known relative offset — which should be stated, and which argues for fitting homogeneous subsamples even at the cost of sample size.

**4.** **(a)** *Rocky*, below about $1.5\,R_\oplus$ and roughly $10\,M_\oplus$, with $R\propto M^{0.27}$; *volatile-rich*, roughly $2$–$10\,R_\oplus$; *degenerate*, above about a Jupiter mass. **(b)** Because radius there is governed by envelope mass fraction rather than by total mass, so a factor of five in mass can produce almost no change in radius and a factor of two in radius almost no change in mass. **(c)** Because electron degeneracy pressure supports the interior and its equation of state makes added mass compress the object nearly as much as it enlarges it; in the fully degenerate limit $R\propto M^{-1/3}$, so radius falls as mass rises.

**5.** **(a)** About $1.1$–$1.2\,R_{\rm J}$, at a few Jupiter masses, for a cold non-irradiated object. **(b)** That a transit alone cannot identify the companion: a gas giant, a brown dwarf and a low-mass star all sit near one Jupiter radius across three orders of magnitude in mass, so a mass measurement is mandatory. **(c)** That an internal energy source is present, since degeneracy alone cannot produce a larger radius — the radius inflation problem, where energy of order one per cent of the incident flux must reach the convective interior and the mechanism remains unsettled.

**6.** **(a)** Iron: $0.80\times3^{0.25} = 0.80\times1.316 = 1.05\,R_\oplus$. Earth-like: $3^{0.27} = 1.35\,R_\oplus$. Water-rich: $1.4\times1.35 = 1.89\,R_\oplus$. **(b)** Fractional separation rock to water is $40\%$ at every mass; absolute separation is $0.54\,R_\oplus$ here, against $0.40$ at $1\,M_\oplus$ and $0.74$ at $10\,M_\oplus$. **(c)** Because the distinction one actually wants at terrestrial masses is not rock versus water but Earth-like versus Mercury-like iron fraction, or the presence of a few tenths of a per cent of hydrogen — differences of one to a few per cent in radius, requiring one per cent radii and hence one per cent stellar radii, which is unattainable for most hosts.

**7.** *The rocky sequence is tight* — small planets are predominantly rock and iron in roughly terrestrial proportions, constraining formation to deliver similar material to similar places. *The radius valley* — a gap in the occurrence distribution separating two populations, not a discontinuity in the relation. *The near-vertical sub-Neptune band* — radius there is controlled by envelope fraction rather than mass. *The degenerate plateau* — nothing exceeds $\sim1.2\,R_{\rm J}$ unless heated, turning inflation into a measurement of internal energy deposition. *Intrinsic scatter* — planets of equal mass genuinely differ, so no single relation describes the population.

**8.** **(a)** That the excess spread is physical rather than observational: planets of the same mass genuinely differ in composition, envelope fraction, thermal history and structure. **(b)** That a fitted relation summarises a distribution rather than expressing a law, so its residual scatter is not an uncertainty on a prediction. **(c)** As a prior whose full intrinsic spread is propagated — the prediction for an individual planet's radius is a distribution, not a value with an error bar, which matters when such predictions are used to estimate radii for non-transiting radial velocity planets or to plan follow-up.

**9.** **(a)** Atmospheric spectroscopy; tidal response through the Love number; and population-level priors linking planets in a single system. **(b)** *Spectroscopy* measures mean molecular weight through the scale height, distinguishing a hydrogen envelope from a steam atmosphere by about a factor of twenty in signal amplitude — the principal escape from the degeneracy. *Love number* depends on the interior's radial density profile rather than only on the mean, so it distinguishes a centrally condensed planet from a uniform one of identical mass and radius; it is the only known bulk probe of internal structure, and is measurable for very few objects. *Population priors* reduce free parameters relative to observables by assuming planets in one system share a formation history. **(c)** That a degenerate measurement repeated across a population ceases to be degenerate at the population level, since the distribution of outcomes constrains the underlying distribution of compositions — a general escape from underdetermination available whenever the same ambiguous measurement can be made on many objects.$exMR_master$,
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
