-- Astronomy & Space · Exoplanets — Finding Worlds — "Microlensing".
-- Curated master for
-- astronomy-and-space/exoplanets/finding-worlds/microlensing
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Organised around the method's two defining peculiarities. First, its
-- sensitivity peaks at the Einstein ring radius, which for a typical M
-- dwarf lens at a few kiloparsecs is 1-2.5 AU - just beyond the snow
-- line, exactly the region transits and radial velocity cannot reach and
-- where planet formation theory says most solids are. Second, every
-- detection is a single unrepeatable event: the alignment never recurs,
-- the planet can never be re-observed, and the claim rests permanently
-- on one light curve. That makes the method's degeneracies - especially
-- the close/wide s <-> 1/s ambiguity, which is exact in the limit - a
-- different kind of problem from degeneracies elsewhere, because no
-- follow-up can break them.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting from theta_E = sqrt(4GM/c^2
-- (1/D_L - 1/D_S)): a 0.3 Msun lens at 4 kpc with a source at 8 kpc
-- gives theta_E = 0.553 mas, r_E = 2.21 AU and t_E = 50 d for a
-- relative proper motion of 4 mas/yr; a 0.1 Msun lens gives 1.28 AU
-- and 29 d, a 1.0 Msun lens 4.04 AU and 92 d. Planetary perturbation
-- durations t_E sqrt(q): 2.8 d for a Jupiter-mass ratio q = 3.2e-3,
-- 15 hr for Neptune at q = 1.6e-4, and 3.8 hr for Earth at q = 1e-5.
-- Snow line 2.7 AU (M/Msun)^0.5 gives 1.5 AU for a 0.3 Msun star.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/finding-worlds/microlensing',
    'research',
    'advanced',
    'read',
    $exLens_master$> A microlensing planet is detected once and never again. The alignment that produced it — a foreground star passing within a milliarcsecond of a background star, seen from Earth — will not recur in the lifetime of the observer, the instrument, or the civilisation. The planet cannot be re-observed, its orbit cannot be followed, and no future measurement can check the claim.

**Everything ever known about that planet is contained in a few days of photometry that has already happened.**

This is unusual in astronomy, where the standard response to an ambiguous result is to observe again. It gives the method a distinctive epistemic character: its degeneracies are permanent, its systematics cannot be checked against a second epoch, and the discipline that keeps it honest has to be built into the survey design rather than applied afterwards.

In exchange it offers something no other technique does. **Its sensitivity peaks at one to three astronomical units** — around and just beyond the snow line, where planet formation theory says most of the solid material is, and where transits and radial velocity have almost no reach. It is also sensitive to planets with no star at all.

## 1. The physics

### 1.1 The Einstein radius

A foreground mass bends light from a background source. If the alignment were perfect, the source would appear as a ring of angular radius

$$\theta_E = \sqrt{\frac{4GM}{c^2}\left(\frac{1}{D_L} - \frac{1}{D_S}\right)},$$

where $D_L$ and $D_S$ are the observer's distances to lens and source. For the typical case — a low-mass star in the Galactic disc lensing a bulge star:

| Lens mass | $D_L$ | $\theta_E$ | $r_E$ at the lens | $t_E$ |
|---|---|---|---|---|
| $0.1\,M_\odot$ | $4$ kpc | $0.319$ mas | $1.28$ AU | $29$ d |
| $0.3\,M_\odot$ | $4$ kpc | $0.553$ mas | $2.21$ AU | $50$ d |
| $0.5\,M_\odot$ | $6$ kpc | $0.412$ mas | $2.47$ AU | $38$ d |
| $1.0\,M_\odot$ | $4$ kpc | $1.009$ mas | $4.04$ AU | $92$ d |

with $t_E = \theta_E/\mu_{\rm rel}$ the Einstein radius crossing time, taking a relative proper motion of $4$ mas yr$^{-1}$.

**Read the fourth column.** The Einstein radius projected to the lens is one to four AU across the plausible range of lens masses and distances. Compare the snow line, $\approx 2.7\ \text{AU}\,(M/M_\odot)^{1/2}$, which is $1.5$ AU for a $0.3\,M_\odot$ star. **The two coincide**, and the coincidence is the method's entire scientific rationale.

### 1.2 Magnification

The lens produces two images, and their combined brightness exceeds the unlensed source. With $u$ the angular separation of source and lens in units of $\theta_E$,

$$A(u) = \frac{u^2+2}{u\sqrt{u^2+4}}.$$

At $u = 1$ the magnification is $1.34$; as $u\to0$ it diverges. A single lens crossing therefore produces a smooth, symmetric, achromatic brightening lasting weeks — and those three properties are the signature that distinguishes it from a variable star.

**Achromaticity is the key test.** Gravity deflects all wavelengths equally, so a microlensing event brightens identically in every band. Intrinsic stellar variability essentially never does. This is what allows genuine events to be separated from the vast number of variables in a crowded bulge field.

### 1.3 The planetary signature

A planet orbiting the lens star is a second mass. If one of the two images passes near it, the planet perturbs that image and produces a **brief anomaly** superimposed on the smooth stellar event.

Its duration scales as

$$t_p \sim t_E\sqrt{q}, \qquad q = \frac{M_p}{M_\star}.$$

| Planet | $q$ | Anomaly duration |
|---|---|---|
| Jupiter around $0.3\,M_\odot$ | $3.2\times10^{-3}$ | $2.8$ days |
| Neptune around $0.3\,M_\odot$ | $1.6\times10^{-4}$ | $15$ hours |
| Earth around $0.3\,M_\odot$ | $1.0\times10^{-5}$ | $3.8$ hours |

**An Earth-mass planet announces itself for under four hours, once, ever.** The observational consequence is severe and shaped the field's history: a survey cadence of one observation per night cannot detect it. This drove the original architecture — wide-field surveys to find events, alerting a network of smaller telescopes to monitor promising ones at high cadence — and its replacement by modern surveys that observe the whole bulge every ten to twenty minutes, removing the need to guess in advance which events matter.

## 2. What is measured, and what is not

**Directly measured:** the mass ratio $q$ and the projected separation $s$ in units of $\theta_E$.

**Not directly measured:** the masses themselves, or the physical separation. Converting requires $\theta_E$ and the lens distance, and the light curve alone gives neither.

Two additional observables can supply them when they are detectable.

**Finite source effects.** If the source star is resolved by the lens — its angular size comparable to the region of high magnification — the sharp features of the light curve are smoothed, and the degree of smoothing measures the source's angular size in units of $\theta_E$. Since the source's physical size can be estimated from its colour and magnitude, this yields $\theta_E$.

**Microlens parallax.** The Earth's orbital motion during a months-long event makes the observer's line of sight curve, distorting the light curve from its symmetric form. Measuring that distortion gives $\pi_E$, which combines with $\theta_E$ to give the lens mass and distance. Simultaneous observation from a spacecraft at a large baseline — a satellite at $1$ AU from Earth sees a measurably different light curve — does the same thing more cleanly, and has been used for exactly this purpose.

**When neither is available**, masses come from a Bayesian analysis using a Galactic model: given the observed $t_E$ and the known distributions of stellar masses, distances and velocities, infer the probable lens mass. **This is a prior-dependent inference, not a measurement**, and published masses obtained this way carry uncertainties of a factor of two and depend on the Galactic model assumed. A substantial fraction of microlensing planet masses in the literature are of this kind, which is worth knowing when they are tabulated alongside masses from radial velocity.

```checkpoint
q: Microlensing sensitivity peaks at the Einstein ring radius, which is $1$–$4$ AU for typical lenses. Why does this make the method valuable?
a: Because that is where planets are most common in general
x: Occurrence is not established to peak there; the value is that the region is inaccessible to other techniques, not that it is favoured.
a*: Because it coincides with the snow line, where formation theory places most of the solid material — a region transits and radial velocity can barely reach
a: Because larger orbits produce longer events, which are easier to detect
x: Longer events are easier to detect, but the *planetary* anomaly duration scales as $t_E\sqrt{q}$ and is short regardless; the peak in sensitivity comes from the geometry of image positions.
a: Because it matches the resolution limit of the survey telescopes
x: Microlensing does not resolve anything; the sources and lenses are unresolved points throughout.
hint: Compare the Einstein radius in AU with the snow line location for the same stellar mass.
why: A planet is detectable when one of the two lensed images passes close to it, and those images lie near the Einstein ring — so sensitivity peaks at a projected separation of about $\\theta_E$, which for a $0.3\\,M_\\odot$ lens at $4$ kpc corresponds to $2.2$ AU. The snow line for such a star sits at $2.7(M/M_\\odot)^{1/2} = 1.5$ AU. **The two coincide**, and beyond the snow line water is solid, so the surface density of accretable material jumps and formation theory places the assembly of giant cores there. Transits have almost no sensitivity at those separations, since probability falls as $a^{-1}$ and repeated events are required; radial velocity needs baselines longer than the orbital period, which is years to decades. Microlensing therefore samples the one region where formation is thought to be most productive, and its results — notably that cold Neptunes are common — are not replaceable by any other technique. Its sensitivity also extends outward without limit, since a planet at any separation can produce an anomaly if the geometry permits, which is how free-floating planets are detected.
---
q: A microlensing light curve yields a planet's mass ratio $q$ but not its mass. What is needed to convert one into the other?
a: A spectrum of the lens star, which gives its mass directly
x: The lens is usually far too faint to observe and is often not identifiable at all against the crowded field.
a*: The Einstein radius $\theta_E$ and the lens distance — obtainable from finite source effects and microlens parallax, or otherwise only from a Galactic model as a prior-dependent inference
a: A second observation of the same event from a different telescope
x: A second ground-based telescope sees essentially the same light curve; the baseline needed for parallax is of order an AU.
a: Follow-up radial velocity of the lens star
x: The lens is typically several kiloparsecs away and far too faint for radial velocity work.
hint: The light curve gives dimensionless quantities. What supplies the physical scale?
why: The light curve's shape gives the mass ratio $q$ and the separation $s$ **in units of $\\theta_E$** — dimensionless quantities that contain no physical scale. Supplying the scale requires $\\theta_E$ and the lens distance. Two observables can do it. **Finite source effects**: if the source star's angular size is comparable to the high-magnification region, the sharp light-curve features are smoothed by an amount that measures the source size in units of $\\theta_E$, and the source's physical size follows from its colour and magnitude. **Microlens parallax**: the Earth's orbital motion during a months-long event curves the line of sight and distorts the light curve, or a spacecraft observing simultaneously from an AU away sees a measurably different curve — either giving $\\pi_E$, which with $\\theta_E$ determines the lens mass and distance. When neither is available, masses are inferred from a Galactic model using the observed $t_E$ and the known distributions of stellar masses, distances and velocities. **That is a prior-dependent inference rather than a measurement**, typically uncertain by a factor of two and dependent on the assumed model — which matters when such masses are tabulated alongside radial velocity masses without distinction.
```

```checkpoint
q: A brightening event in a crowded bulge field lasts forty days, is smooth and symmetric, and has the same amplitude in every photometric band. What does the achromaticity establish?
a: That the source star has a featureless spectrum
x: The source's spectrum is irrelevant, since lensing multiplies the flux at every wavelength by the same factor whatever the spectrum is.
a*: That the brightening is gravitational rather than intrinsic, since gravity deflects all wavelengths equally while stellar variability essentially never does
a: That the lens is a single object rather than a binary
x: Binarity affects the light curve's shape; both single and binary lenses are equally achromatic.
a: That there is no dust along the line of sight
x: Extinction dims the source but does not vary during the event, so it does not affect the colour behaviour of the brightening.
hint: Ask what property of gravitational deflection distinguishes it from any mechanism internal to a star.
why: Gravitational deflection depends only on the mass distribution and the geometry, not on photon energy, so a lensing event multiplies the source's flux by the same factor at every wavelength — the star brightens without changing colour. Intrinsic stellar variability works through temperature, radius or obscuration, all of which change the spectral energy distribution, so a variable star brightens by different amounts in different bands. **In a field containing millions of stars, of which a large fraction are variable and only a handful per year are lensed, achromaticity is what makes the search feasible.** Smoothness and symmetry help — a single-lens event has a specific analytic shape, $A(u) = (u^2+2)/[u\sqrt{u^2+4}]$, which few variables mimic — but colour is the decisive discriminant because it is a statement about physics rather than about morphology. The same test does real work later in the analysis: a background binary source can mimic a planetary anomaly, and since its two stars differ in colour the mimic is chromatic while the real thing is not. That is only usable if multi-band photometry was being taken at the time, which is one of several reasons the modern surveys observe in more than one filter by default.
---
q: An Earth-mass planet's microlensing anomaly lasts about $3.8$ hours. What follows for how a survey must be run?
a: That larger telescopes are required to collect enough photons in the available time
x: Aperture helps with photometric precision, but the binding constraint is temporal sampling, not photon count.
a*: That the entire field must be sampled every few tens of minutes, continuously, from multiple longitudes — nightly cadence cannot detect terrestrial planets at all
a: That events must be predicted in advance so that telescopes can be scheduled
x: Events cannot be predicted; they are discovered in progress, which is precisely why continuous blanket coverage is the only workable strategy.
a: That observations must be taken in multiple bands to increase the effective sampling rate
x: Multi-band data serve a different purpose — discriminating chromatic contaminants — and do not substitute for temporal cadence.
hint: Compare the anomaly duration with the interval between observations under different strategies.
why: The anomaly duration scales as $t_E\sqrt{q}$, giving $2.8$ days for a Jupiter-mass ratio and $3.8$ hours for an Earth. A survey observing each field once per night samples an Earth-mass anomaly at most once, which is not a detection, so **terrestrial planets are invisible to nightly cadence regardless of photometric precision or aperture**. The requirement is sampling every few tens of minutes, sustained without gaps — which needs telescopes at several longitudes so that the bulge is always above someone's horizon. The historical route to this is instructive: the first generation of surveys detected the slow stellar events at low cadence and alerted follow-up telescopes to monitor selected events intensively, which worked for detections but made the selection function depend on real-time human judgement, rendering occurrence rates uncomputable. Modern networks observe everything at planet-sensitive cadence automatically, which removes the choice and allows detection efficiency to be measured by injecting synthetic anomalies into the real photometry.
```

## 3. The degeneracies, and why they are permanent

Every method has degeneracies. Microlensing's are different because **no follow-up observation can break them**: the event is over, and there will not be another.

### 3.1 The close/wide degeneracy

The most important. A planet at projected separation $s$ (in units of $\theta_E$) and one at $1/s$ produce nearly identical light curves. A planet at $s = 0.6$ and one at $s = 1.67$ are, for many events, observationally indistinguishable — **the ambiguity is exact in the limit of small mass ratio**, arising from a symmetry of the lens equation rather than from insufficient data.

The consequence is a factor of $s^2$ ambiguity in the inferred physical separation, which is often a factor of two to three. For an individual planet this means its orbit is known only to that ambiguity; for population studies, it means the separation distribution is smeared.

**High-cadence data can sometimes break it**, since the two solutions differ in subtle details of the anomaly's shape, and modern surveys resolve it in many cases. But when they do not, it cannot be resolved later.

### 3.2 Other ambiguities

**Binary source versus planetary lens.** A background *binary* source, rather than a planetary lens, can mimic a planetary anomaly. The signatures differ — a binary source produces chromatic effects, since the two stars have different colours, while lensing is achromatic — so multi-band photometry discriminates. This requires that multi-band data were taken *at the time*.

**Orbital motion of the planet** during the event distorts the anomaly and can be confused with a different mass ratio.

**Blending.** Bulge fields are crowded and a "source" is often several unresolved stars. Only one is lensed, so the observed magnification is diluted, and the true source brightness must be inferred. Getting this wrong propagates into the finite-source measurement of $\theta_E$ and hence the mass.

**The methodological point is worth stating plainly.** In most of astronomy, a degeneracy is a temporary condition to be resolved by better or additional data. Here, the required data either exists already or never will. **This shifts the burden entirely onto survey design** — observing cadence, multi-band coverage, and continuous monitoring must be set before anyone knows which events will matter, because there is no second chance to add them.

{{image: Gravitational microlensing | The geometry of a lensing event: a foreground mass passing close to the line of sight to a background star bends its light, producing two images and a net brightening that rises and falls smoothly over weeks. Because gravity deflects all wavelengths equally, the brightening is achromatic, which is the test that separates genuine events from the intrinsic variability that fills crowded bulge fields. A planet orbiting the lens perturbs one of the two images when the geometry brings them close together, adding a brief anomaly to the smooth curve — hours for an Earth-mass planet, days for a giant — after which the alignment ends and the system can never be observed again.}}

## 4. Survey design as the discipline

The method's constraints determined its architecture, and the history is a good illustration of an observational strategy forced by physics rather than chosen.

**First generation: survey plus follow-up.** Wide-field surveys monitored millions of bulge stars at low cadence, detecting the smooth stellar events and issuing alerts. A network of smaller telescopes around the world then monitored selected events at high cadence, hoping to catch an anomaly.

This worked, and it had a defect that undermined statistics: **the selection of which events to follow was made by humans, in real time, on incomplete information**. Computing an occurrence rate requires knowing the probability that a planet of given properties would have been detected, and that probability depended on decisions that were not recorded systematically. The detections were real; the denominators were not reliable.

**Second generation: survey-only.** Modern networks observe the entire bulge every ten to twenty minutes, from several longitudes so that the target is continuously visible. No selection is required, because every event is monitored at planet-sensitive cadence automatically.

**This is what made microlensing statistics possible.** The detection efficiency can now be computed by injecting synthetic planetary anomalies into the real photometry and running the detection pipeline — the same injection-and-recovery logic used for transit completeness — because the observing strategy no longer depends on human choices made during the event.

**A space-based survey** is the next step. Observing the bulge from above the atmosphere in the infrared resolves the crowding that limits ground-based photometry, reaches fainter sources, and provides a parallax baseline; a dedicated space microlensing survey is expected to detect thousands of cold planets and to measure masses rather than infer them for a large fraction.

```checkpoint
q: The close/wide degeneracy means planets at projected separation $s$ and $1/s$ produce nearly identical light curves. Why is this worse for microlensing than an equivalent ambiguity would be elsewhere?
a: Because the degeneracy is larger in magnitude than degeneracies in other methods
x: A factor of two or three in separation is not unusually large; the difficulty is not the size of the ambiguity.
a*: Because the event never recurs, so if the existing data cannot resolve it, no future observation ever can
a: Because it affects the mass rather than the separation, which is the more important quantity
x: It affects the inferred physical separation; the mass ratio is measured robustly.
a: Because it arises from instrumental limitations that have not yet been overcome
x: It is a symmetry of the lens equation, exact in the limit of small mass ratio, not an instrumental shortcoming.
hint: Ask what one normally does about an ambiguous result, and whether that option exists here.
why: The ambiguity itself is ordinary — a factor of $s^2$, often two or three, in the inferred physical separation — and it arises from a genuine symmetry of the lens equation rather than from noise. What is unusual is the remedy. In most of astronomy an ambiguous result is a temporary condition: observe again, at a different epoch, wavelength or resolution, and break it. **A microlensing event is a single unrepeatable alignment**, so the data that exist are all the data there will ever be, and a degeneracy unresolved by them is permanent. High-cadence photometry can distinguish the two solutions in many cases, since they differ in fine detail of the anomaly's shape, but only if that cadence was being obtained while the event was happening. This shifts the entire burden onto **survey design**: cadence, multi-band coverage and continuous longitude coverage must be decided before anyone knows which events will matter, because there is no possibility of adding an observation afterwards. It is the clearest case in observational astronomy where the discipline that ensures a reliable result has to be built in beforehand rather than applied in analysis.
---
q: Why did microlensing surveys move from a survey-plus-follow-up architecture to continuous survey-only monitoring?
a: Because follow-up telescopes were not sensitive enough to detect the anomalies
x: They were sensitive enough and detected many planets; the problem was not sensitivity.
a*: Because human real-time decisions about which events to follow made the detection efficiency uncomputable, so occurrence rates could not be derived reliably
a: Because the alert system was too slow to notify follow-up telescopes in time
x: Alerts were issued promptly and follow-up did routinely begin in time for the anomalies.
a: Because survey telescopes became large enough to detect the smooth stellar event without follow-up
x: Detecting the stellar event was never the difficulty; detecting the brief planetary anomaly was.
hint: An occurrence rate requires a denominator. Ask what that denominator depends on in each architecture.
why: The detections from the follow-up era were genuine. The problem was the **denominator**: an occurrence rate requires knowing the probability that a planet of given mass ratio and separation would have been detected, and under the old architecture that probability depended on which events observers chose to monitor intensively, decided in real time on incomplete information and not recorded in a form that could be reconstructed. The efficiency was therefore not computable, and neither were reliable rates. Continuous survey-only monitoring — the whole bulge every ten to twenty minutes, from several longitudes so the field is always visible — removes the choice entirely, since every event receives planet-sensitive cadence automatically. That makes the efficiency measurable by injecting synthetic anomalies into the real photometry and running the actual detection pipeline, the same logic transit surveys use for completeness. **The change was made for statistical rather than sensitivity reasons**, and it is what turned microlensing from a source of individual discoveries into a source of population measurements.
```

## 5. What microlensing has established

### 5.1 Cold planets are common

The method's principal population result is that **planets beyond the snow line are abundant**, with cold Neptune-mass objects appearing to be the most common class in that region. Estimates place of order one bound planet per star beyond the snow line, though the exact figure depends on the mass function assumed at the low end where detection efficiency falls steeply.

This matters because it samples the region where formation theory expects most planet building. Transit and radial velocity demographics describe the inner few tenths of an AU; microlensing describes the neighbourhood of the snow line. **The two together are the only evidence about how planetary systems are populated as a function of radius**, and they disagree in an interesting way — the inner region is dominated by super-Earths and sub-Neptunes, the snow line region by cold Neptunes and giants.

### 5.2 Planets around distant and faint stars

Because the lens need not be seen, microlensing detects planets around stars that are far too faint for any other technique — M dwarfs at several kiloparsecs, and stars in the Galactic bulge. This gives it a sample that is spatially and metallicity-wise different from the solar neighbourhood samples of the other methods, allowing questions about whether planet occurrence varies across the Galaxy.

The same feature is a limitation: **the host is usually unidentifiable**, so its mass, metallicity and age are not measured. Microlensing tells us a planet exists without telling us much about where it lives.

### 5.3 Free-floating planets

The unique claim. If a planet is not bound to a star — ejected during a system's dynamical youth, or formed independently — it can still act as a lens. Its event is very short, since $t_E \propto \sqrt{M}$: a Jupiter-mass free-floating lens gives an event of a day or two, an Earth-mass one a few hours.

Surveys have detected populations of such short events in excess of what bound planets on wide orbits would produce, indicating a genuine population of unbound objects. **No other method can detect them at all** — they emit essentially nothing, have no star to transit or perturb, and are far too cold and faint to image.

Two cautions are warranted. Short events are exactly where detection efficiency and blending systematics are worst, so the inferred abundance depends sensitively on the efficiency calculation. And a short event alone does not prove the lens is unbound: a planet on a wide orbit produces a similar signature unless the host's own lensing signal is detected or excluded, which requires either very high precision photometry or later high-resolution imaging of the field. The abundance estimates have moved substantially as these have been treated more carefully, and the current picture — a population comparable in number to stars — should be held loosely.

{{image: Rogue planet | A planetary-mass object not gravitationally bound to any star, either ejected during the dynamical rearrangement of a young planetary system or formed independently. Such objects emit almost nothing, have no host to transit or to perturb, and are far too cold to image, so gravitational microlensing is the only technique that can detect them at all — as very short brightening events, lasting a day or two for a Jupiter-mass lens and a few hours for an Earth-mass one, since the event duration scales as the square root of the lens mass. Short events are also where detection efficiency is lowest and crowding systematics are worst, which is why inferred abundances have moved substantially as those effects have been treated more carefully.}}

```checkpoint
q: Microlensing finds planets around stars that cannot themselves be observed. What is the corresponding cost?
a: The planets' masses cannot be determined even in principle
x: Masses can be determined when finite-source effects and parallax are both measured; that route exists, though it is not always available.
a*: The host's mass, metallicity and age are usually unmeasured, so the planet is characterised while its system is not
a: The orbital period cannot be measured
x: True, but this follows from the event's brevity rather than from the host being unobservable, and the projected separation is measured.
a: The detections cannot be confirmed by other methods
x: Also true, but again a consequence of non-repeatability; the invisibility of the host is a separate limitation.
hint: List what one normally wants to know about a planetary system, and ask which of it requires seeing the star.
why: The lens need not be detected for the event to be analysed, which is the source of the method's reach: it finds planets around M dwarfs at several kiloparsecs and around bulge stars, populations no other technique can survey. But almost everything one would want to know about the system requires seeing the host. **Stellar mass, metallicity, age, activity and multiplicity are all unmeasured**, so a microlensing planet is a mass ratio and a projected separation attached to an unknown star — which means the strong correlations that structure the rest of exoplanet science, such as giant planet occurrence rising with host metallicity, cannot be tested with these detections. High-resolution imaging years later can sometimes separate the lens from the source as their relative proper motion carries them apart, recovering the host's brightness and hence a mass, and this has been done for a growing number of events. It requires waiting for the two to separate by a resolution element, which takes of order a decade, and it works only for the nearer and brighter lenses.
---
q: Why is it useful that microlensing samples planets across the Galaxy rather than only in the solar neighbourhood?
a: Because planets are more common toward the Galactic centre, which improves the detection rate
x: Whether occurrence varies with Galactic location is one of the questions the sample allows one to ask; assuming the answer would be circular.
a*: Because it allows the question of whether planet occurrence depends on Galactic environment and metallicity to be addressed at all, which a solar-neighbourhood sample cannot
a: Because distant stars are older, so their planets have had longer to form
x: Planet formation completes within a few million years, so age differences of this kind do not affect whether planets exist.
a: Because the greater distance increases the Einstein radius and hence the sensitivity
x: The Einstein radius depends on the lens and source distances in a way that does not simply grow with distance, and sensitivity in separation is set by $\theta_E$ rather than by remoteness.
hint: Ask what range of Galactic environments the other detection methods can reach, and why.
why: Every other detection method works on stars bright enough to be studied individually, which in practice means within a few hundred parsecs — a sample drawn from one location in the Galaxy, with a narrow range of metallicity, age and dynamical history. Microlensing does not require the host to be observed at all, so its planets are found at several kiloparsecs and into the bulge, sampling stellar populations with different metallicities and formation histories. **That makes it the only method able to address whether planet occurrence varies across the Galaxy**, which matters because the strongest known correlation in exoplanet science — giant planet frequency rising steeply with host metallicity — predicts that it should. The limitation is the complement of the strength: since the hosts are usually unidentifiable, their metallicities are not measured either, so the test has to be made statistically against Galactic population models rather than star by star. High-resolution imaging of the field a decade after the event, once lens and source have drifted apart, is beginning to supply individual host properties for the nearer cases.
```

## 6. Where the method sits

**Strengths.** Sensitivity peaking at the snow line, where no other method reaches. Sensitivity extending to low masses at wide separations, down to Earth mass. Detection of unbound objects. A sample drawn from across the Galaxy rather than the solar neighbourhood. Mass ratios measured robustly and directly from the light curve's geometry.

**Weaknesses.** Single unrepeatable events, so no follow-up and permanent degeneracies. Masses often inferred from a Galactic model rather than measured. Hosts usually unidentifiable, so the planets are characterised but their systems are not. No possibility of atmospheric study, ever.

**How to hold the results.** Microlensing statements about *populations* — cold planets are common, free-floating objects exist — are the method's real product and are as reliable as the efficiency calculation behind them, which is now good. Statements about *individual planets* carry the degeneracies and the model-dependent masses, and should be read with that attached.

```checkpoint
q: Microlensing and transit demographics disagree about what the commonest planets are. What is the correct reading?
a: One of the two methods must have a systematic error in its occurrence rates
x: Both efficiency calculations are now well founded, and there is no need to impeach either to reconcile them.
a*: They sample different orbital regions — transits the inner few tenths of an AU, microlensing the snow line neighbourhood — so the two results describe different parts of the same systems
a: Microlensing samples a different stellar population, so the comparison is meaningless
x: The stellar populations do differ, which complicates the comparison, but the dominant difference is in orbital separation rather than in host type.
a: The disagreement shows that planetary systems vary enormously and no typical architecture exists
x: Variety is real, but a systematic difference between two well-defined radial zones is a structure rather than an absence of structure.
hint: For each method, ask what range of orbital separations it can actually reach.
why: Transit surveys are sensitive where geometric probability $R_\star/a$ is appreciable and where several events fit inside the mission baseline, which confines them to roughly the inner few tenths of an AU; there the population is dominated by super-Earths and sub-Neptunes in compact multiple systems. Microlensing sensitivity peaks at the Einstein radius, $1$–$4$ AU, where the population appears dominated by cold Neptunes and giants. **These are not competing measurements of one quantity but complementary measurements of different radial zones**, and together they are the only evidence available about how systems are populated as a function of orbital radius. Reading them as a contradiction is a category error of the same kind as concluding that two surveys disagree about galaxy colours when one observed in the ultraviolet and the other in the infrared. The genuine open question the pair raises is what connects the two zones — whether the inner super-Earths formed in place or migrated inward from near the snow line, which is exactly what the formation and migration chapter has to address.
---
q: Which single feature most distinguishes microlensing epistemically from every other exoplanet detection method?
a: That it detects planets without detecting their host stars
x: Distinctive and consequential, but it is a limitation on characterisation rather than a difference in the structure of the evidence.
a*: That each detection is a unique unrepeatable event, so no future observation can ever check the claim or resolve an ambiguity
a: That its detections are statistical rather than individual
x: Individual planets are detected with well-defined light curves; the statistical character enters only in the population analysis, as it does for other methods.
a: That it relies on general relativity rather than on Newtonian gravity
x: The deflection is calculated relativistically, but this is a well-tested piece of physics and introduces no epistemic peculiarity.
hint: Ask what every other method offers that this one cannot: the possibility of looking again.
why: Every other technique produces a repeatable observation. A transiting planet transits again next period; a radial velocity orbit can be re-sampled; an imaged companion can be re-imaged and its orbit followed. Ambiguous results in those methods are temporary conditions resolved by acquiring more or better data. **A microlensing alignment occurs once and never recurs**, so the photometry taken while it was happening is permanently the whole of the evidence. That changes where the discipline has to live: degeneracies such as the exact close/wide $s \leftrightarrow 1/s$ ambiguity cannot be broken later, contaminants such as binary sources can only be excluded with multi-band data that was taken at the time, and detection efficiency can only be computed if the observing strategy was fixed in advance rather than chosen event by event. The field's response was not better analysis but a redesigned observing strategy — continuous, blanket, multi-band coverage of the whole bulge — which is the general lesson: **for phenomena that will not repeat, quality control moves from analysis into design, and has to be paid for before anyone knows which events will matter.**
```

## 7. Pulling the thread

- **Sensitivity peaks at the Einstein radius**, $1$–$4$ AU for typical lenses, which coincides with the snow line at $2.7(M/M_\odot)^{1/2}$ AU. That coincidence is the whole scientific case, and it covers the region transits and radial velocity cannot.
- **Every event is unrepeatable.** The alignment never recurs; the data that exist are all there will ever be; degeneracies unresolved now are permanent.
- **The light curve gives $q$ and $s$, not masses.** Converting needs $\theta_E$ and the lens distance from finite-source effects or parallax — otherwise masses come from a Galactic model as a prior-dependent inference uncertain by a factor of two.
- **Anomalies are brief**: $t_E\sqrt{q}$ gives $2.8$ days for a Jupiter, $3.8$ hours for an Earth. Nightly cadence cannot find terrestrial planets.
- **Achromaticity is the discriminant** that separates genuine events from the variables filling crowded bulge fields, because gravity deflects all wavelengths equally.
- **Survey architecture changed for statistical reasons.** Human real-time selection of follow-up targets made detection efficiency uncomputable; continuous survey-only monitoring made occurrence rates possible.
- **The population results are the product:** cold Neptunes are common beyond the snow line, and a population of free-floating planetary-mass objects exists — the latter detectable by no other means, and with abundances that should be held loosely.

The transferable idea: **when data cannot be re-taken, quality control moves from analysis to design.** Most of observational science operates on the assumption that a doubtful result can be checked by observing again, and this assumption is so pervasive that it is rarely stated. Microlensing violates it, and the field's response is instructive: it did not develop better analysis of ambiguous events, it changed the observing strategy so that ambiguous events stopped being produced — continuous coverage, multiple longitudes, multi-band photometry taken as a matter of course rather than on request. **The discipline had to be paid for in advance.** The same structure appears wherever events are transient and unique — supernova early light curves, gravitational wave counterparts, atmospheric entry of an interstellar object — and the lesson is the same: for a phenomenon that will not repeat, the decisive work is done before it happens, in deciding what will be recorded by default.

## 8. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Peter Schneider, Christopher Kochanek and Joachim Wambsganss | Gravitational Lensing: Strong, Weak and Micro | 2006}}

{{book: Sara Seager | Exoplanets | 2010}}

Beyond the books: Gaudi's review chapter on microlensing in *Exoplanets* is the clearest derivation of the light curve and of the detection efficiency, and is unusually explicit about the degeneracies. Mao and Paczyński's 1991 paper proposing the method for planet detection is short and worth reading for how completely the essential features — the mass-ratio scaling of the anomaly duration, the peak sensitivity near the Einstein radius — were laid out before any detection existed. On free-floating planets, comparing successive abundance estimates over the past decade is more instructive than reading the most recent alone, since the changes track improvements in the treatment of efficiency and blending.

## Problems

*Useful numbers: $\theta_E = \sqrt{(4GM/c^2)(1/D_L - 1/D_S)}$; for a $0.3\,M_\odot$ lens at $4$ kpc with source at $8$ kpc, $\theta_E = 0.553$ mas, $r_E = 2.21$ AU, $t_E = 50$ d at $\mu_{\rm rel} = 4$ mas yr$^{-1}$; $A(u) = (u^2+2)/[u\sqrt{u^2+4}]$; anomaly duration $\sim t_E\sqrt{q}$; snow line $\approx 2.7\,(M/M_\odot)^{1/2}$ AU; $q = 3.2\times10^{-3}$ for Jupiter around $0.3\,M_\odot$, $1.0\times10^{-5}$ for Earth.*

**1.** *(The scale.)* **(a)** Compute $r_E$ for a $0.3\,M_\odot$ lens at $4$ kpc. **(b)** Compute the snow line for the same star. **(c)** State the significance of the comparison and what it implies about the method's role.

**2.** *(Magnification.)* **(a)** Compute $A(u)$ at $u = 1$ and $u = 0.1$. **(b)** State the three properties of a single-lens light curve. **(c)** State which is the decisive test against stellar variability and why.

**3.** *(Anomaly duration.)* **(a)** Compute the anomaly duration for $q = 3.2\times10^{-3}$ and $q = 1.0\times10^{-5}$ with $t_E = 50$ d. **(b)** State the observing cadence each requires. **(c)** Explain how this drove the change in survey architecture.

**4.** *(Mass determination.)* **(a)** State what the light curve measures directly. **(b)** Name the two observables that supply the physical scale and describe each. **(c)** State what is done when neither is available and how such a mass should be regarded.

**5.** *(Degeneracy.)* **(a)** State the close/wide degeneracy and its origin. **(b)** Compute the ambiguity in physical separation for $s = 0.6$. **(c)** Explain why this is more serious here than an equivalent ambiguity elsewhere.

**6.** *(Contaminants.)* **(a)** Describe how a binary source can mimic a planet and how it is distinguished. **(b)** Describe blending and its consequence. **(c)** State what both imply about what data must be taken by default.

**7.** *(Survey design.)* **(a)** Describe the survey-plus-follow-up architecture and its statistical defect. **(b)** Describe the survey-only replacement. **(c)** Explain how detection efficiency is now computed.

**8.** *(Free-floating planets.)* **(a)** Explain why $t_E \propto \sqrt{M}$ and give the resulting event duration for a Jupiter-mass lens. **(b)** State why no other method can detect these objects. **(c)** Give two reasons for caution about the inferred abundance.

**9.** *(Assessment.)* **(a)** State microlensing's principal population result. **(b)** State how it complements transit and radial velocity demographics. **(c)** State the distinction between how population results and individual-planet results from this method should be held, and justify it.

## Worked answers

**1.** **(a)** $r_E = \theta_E D_L = 0.553\ \text{mas}\times4000\ \text{pc}$; converting, $0.553\times10^{-3}/206265$ rad $\times\,4000\times3.086\times10^{16}$ m $= 3.3\times10^{11}$ m $= 2.21$ AU. **(b)** $2.7\times(0.3)^{1/2} = 1.48$ AU. **(c)** They coincide to within a factor of $1.5$. Since sensitivity peaks near the Einstein radius, the method is most sensitive exactly where formation theory places most solid material and where giant cores are thought to assemble — and it is the only method with meaningful reach there, since transits lose probability as $a^{-1}$ and radial velocity needs baselines longer than the orbital period.

**2.** **(a)** $A(1) = 3/(1\times\sqrt5) = 1.342$. $A(0.1) = 2.01/(0.1\times\sqrt{4.01}) = 2.01/0.2002 = 10.04$. **(b)** Smooth, symmetric and achromatic, lasting weeks. **(c)** Achromaticity, because gravitational deflection is wavelength-independent so the source brightens identically in every band, whereas intrinsic stellar variability essentially never does — which is what allows genuine events to be picked out of crowded bulge fields dense with variables.

**3.** **(a)** $50\sqrt{3.2\times10^{-3}} = 50\times0.0566 = 2.83$ d; $50\sqrt{1.0\times10^{-5}} = 50\times0.00316 = 0.158$ d $= 3.8$ hr. **(b)** A giant's anomaly is sampled adequately at a few observations per night; an Earth's requires cadence of tens of minutes, sustained continuously. **(c)** Nightly monitoring cannot detect terrestrial planets at all, so either selected events must be watched intensively — the follow-up model — or the entire field must be observed at high cadence continuously, which is what modern survey-only networks do from multiple longitudes.

**4.** **(a)** The mass ratio $q$ and the projected separation $s$ in units of $\theta_E$ — both dimensionless. **(b)** *Finite source effects:* when the source's angular size is comparable to the high-magnification region, sharp light-curve features are smoothed by an amount measuring the source size in units of $\theta_E$, and the source's physical size follows from its colour and magnitude. *Microlens parallax:* the Earth's orbital motion during a months-long event, or simultaneous observation from a spacecraft an AU away, distorts the light curve by an amount giving $\pi_E$, which with $\theta_E$ yields mass and distance. **(c)** A Bayesian inference from a Galactic model using $t_E$ and the known distributions of stellar masses, distances and velocities — a prior-dependent estimate uncertain by about a factor of two, which should be distinguished from a measurement when tabulated with radial velocity masses.

**5.** **(a)** Planets at projected separation $s$ and $1/s$ (in units of $\theta_E$) produce nearly identical light curves; it arises from a symmetry of the lens equation and is exact in the limit of small mass ratio. **(b)** $1/0.6 = 1.67$, so the physical separation is ambiguous by a factor $1.67/0.6 = 2.8$. **(c)** Because the event never recurs. Elsewhere a degeneracy is temporary and resolved by observing again; here the data that exist are all there will ever be, so an unresolved ambiguity is permanent — which places the burden on survey cadence and multi-band coverage decided in advance.

**6.** **(a)** A background binary source produces brightness structure resembling a planetary anomaly; it is distinguished by chromaticity, since the two stars differ in colour and produce a wavelength-dependent signal, whereas lensing is achromatic. **(b)** Bulge fields are crowded, so a "source" is often several unresolved stars of which only one is lensed; the observed magnification is diluted, and the true source flux must be inferred, with errors propagating into the finite-source estimate of $\theta_E$ and hence the mass. **(c)** That multi-band photometry and high-quality reference imaging must be obtained as a matter of course during every event, since neither can be added retrospectively.

**7.** **(a)** Wide-field low-cadence surveys detected the smooth stellar events and alerted a network of smaller telescopes, which monitored selected events intensively. The defect was that the choice of which events to follow was made by people in real time on incomplete information and not systematically recorded, so the detection efficiency — the denominator of any occurrence rate — was not computable. **(b)** Continuous monitoring of the whole bulge every ten to twenty minutes from several longitudes, so every event receives planet-sensitive cadence automatically with no selection. **(c)** By injecting synthetic planetary anomalies into the real photometry and running the actual detection pipeline, measuring the recovery rate as a function of mass ratio and separation — possible only because the observing strategy no longer depends on human decisions during events.

**8.** **(a)** $\theta_E \propto \sqrt{M}$ from the lensing formula, and $t_E = \theta_E/\mu_{\rm rel}$, so $t_E\propto\sqrt{M}$; scaling from $50$ days at $0.3\,M_\odot$ gives $50\sqrt{9.5\times10^{-4}/0.3} = 50\times0.056 = 2.8$ days for a Jupiter-mass lens. **(b)** They emit essentially nothing, have no host star to transit or to perturb by reflex motion, and are far too cold and faint to image — so no technique that relies on a star or on the object's own light applies. **(c)** Short events are exactly where detection efficiency is lowest and blending systematics are worst, so the abundance depends sensitively on the efficiency calculation; and a short event alone does not establish that the lens is unbound, since a planet on a wide orbit gives a similar signature unless the host's lensing signal is detected or excluded.

**9.** **(a)** That planets beyond the snow line are abundant, with cold Neptune-mass objects apparently the most common class there and of order one bound planet per star in that region. **(b)** Transits and radial velocity describe the inner few tenths of an AU, dominated by super-Earths and sub-Neptunes; microlensing describes the snow line neighbourhood, dominated by cold Neptunes and giants. Together they are the only evidence about how systems are populated as a function of orbital radius. **(c)** Population results are the method's real product and are as reliable as the detection efficiency behind them, which modern survey-only architectures make computable. Individual-planet results carry the close/wide degeneracy and, frequently, a mass inferred from a Galactic model rather than measured — so they should be quoted with those attached, and not tabulated indiscriminately alongside masses from methods that measure them.$exLens_master$,
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
