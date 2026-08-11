-- Astronomy & Space · Exoplanets — Finding Worlds — "Direct Imaging".
-- Curated master for
-- astronomy-and-space/exoplanets/finding-worlds/direct-imaging
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Organised around the gap between what the method uniquely offers and
-- what it can currently reach. It is the only technique that collects
-- photons from the planet itself, so it alone yields a spectrum of the
-- object rather than of the star's light passing through or reflecting
-- off it - and it is restricted to young, massive, widely separated
-- planets seen in their own cooling glow, which is an unrepresentative
-- slice of about one per cent of the known population. Contrast is the
-- reason: an Earth in reflected light is 1.4e-10 of its star, a young
-- self-luminous Jupiter is 1e-5, and the best demonstrated performance
-- is around 1e-6 at half an arcsecond. Also treats the hot-start /
-- cold-start degeneracy, which makes imaged-planet masses depend on an
-- assumed initial entropy and is the field's largest unquoted
-- systematic, and speckle noise as the actual limit rather than
-- diffraction.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: reflected-light contrast
-- A(Rp/a)^2/4 giving 1.4e-10 for Earth at 1 AU with albedo 0.3 and
-- 1.0e-9 for Jupiter at 5.2 AU with albedo 0.5; angular separation
-- 1 AU at 10 pc = 0.100 arcsec and 5 AU at 10 pc = 0.50 arcsec;
-- diffraction limit 1.22 lambda/D = 0.050 arcsec for an 8 m aperture
-- at 1.6 microns.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/finding-worlds/direct-imaging',
    'research',
    'advanced',
    'read',
    $exImg_master$> Every other detection method infers a planet from what it does to its star — a dip in brightness, a wobble in velocity, a shift in position. **Direct imaging collects photons that came from the planet.** That is a categorical difference, and it is why the technique matters far more than its detection count suggests: it is the only route to a spectrum of the object itself, and therefore the only route to asking what a planet is made of without the star's light passing through or bouncing off it first.

It currently works on roughly one per cent of the known planets, and that one per cent is the least representative sample in the field: **young, massive, widely separated planets around nearby young stars**, glowing in their own residual heat of formation rather than in reflected starlight.

The reason is a single number. An Earth at $1$ AU reflects about $1.4\times10^{-10}$ of its star's light. The best contrast demonstrated on sky, at the separations that matter, is around $10^{-6}$. **Four orders of magnitude separate the method from its own goal**, and closing that gap is the central engineering problem of exoplanet astronomy.

## 1. Two problems, not one

### 1.1 Angular separation

The planet must be resolvable from the star. At a distance $d$, a planet at orbital separation $a$ subtends

$$\theta = \frac{a}{d} = 0.1''\times\left(\frac{a}{1\ \text{AU}}\right)\left(\frac{10\ \text{pc}}{d}\right).$$

An $8$-metre telescope at $1.6$ μm has a diffraction limit of

$$\theta_{\rm min} = 1.22\frac{\lambda}{D} = 0.050''.$$

So an Earth analogue at $10$ pc, at $0.1''$, is formally resolvable at twice the diffraction limit — **the geometry is not the obstacle.** A Jupiter analogue at $0.5''$ is comfortably resolved.

Ground-based observation requires **adaptive optics** to reach the diffraction limit at all, since atmospheric turbulence otherwise blurs images to about $1''$. A deformable mirror corrects the wavefront hundreds to thousands of times per second using a wavefront sensor fed by the target star itself. Extreme adaptive optics systems, with thousands of actuators and kilohertz update rates, are what made the current generation of imaged planets possible.

### 1.2 Contrast

This is the real problem. Two regimes must be distinguished carefully, because conflating them is the most common misunderstanding of the field.

**Reflected light.** A planet reflects a fraction of the starlight intercepted:

$$\frac{F_p}{F_\star} \approx \frac{A}{4}\left(\frac{R_p}{a}\right)^2.$$

| Planet | Contrast in reflected light |
|---|---|
| Jupiter at $5.2$ AU, $A = 0.5$ | $1.0\times10^{-9}$ |
| Earth at $1$ AU, $A = 0.3$ | $1.4\times10^{-10}$ |

**Thermal emission from a young planet.** A newly formed giant is hot — it is still radiating the gravitational energy of its assembly — and at $10$–$100$ Myr it can emit $10^{-4}$ to $10^{-5}$ of its star's total luminosity, concentrated in the infrared where the star is comparatively faint.

**The difference is four to six orders of magnitude**, and it is the entire reason the current sample looks as it does. Every planet imaged so far is young and massive, seen in **its own light, not reflected light**. This is not a detail of technique; it means the imaged population is drawn from a narrow slice of age and mass, and it is why direct imaging results cannot yet be combined with transit and radial velocity results into a single demographic picture.

## 2. Speckles: what actually limits the measurement

A perfect telescope would produce an Airy pattern whose rings fall off steeply, and a planet at $0.5''$ would sit in nearly empty background. Real telescopes do not.

Small imperfections in the optics — polishing errors, misalignments, thermal deformations of a few nanometres — scatter starlight into a halo of **speckles**: bright points that look exactly like faint companions. Each speckle is a diffraction-limited spot of the same size and shape as a planet's image, because both are images of a point source formed by the same optics.

**Speckles, not photon noise and not diffraction, set the contrast floor.** They come in two kinds and the distinction is decisive.

**Atmospheric speckles** change on millisecond timescales and average into a smooth halo over a long exposure. Annoying, but statistically benign.

**Quasi-static speckles** arise from slowly drifting instrumental aberrations, persist for minutes to hours, and **do not average down.** They are the limit. A long exposure gathers more photons from the planet and more photons from the speckle equally, so integrating longer does not improve the contrast.

The response is a set of differential techniques, all built on the same idea: **find something that distinguishes a real companion from a speckle, and subtract.**

**Angular differential imaging.** Observe with the telescope's field rotation left uncorrected, so the sky rotates while the instrument's aberrations stay fixed relative to the optics. A real companion moves in the frames; speckles do not. Combining frames in the instrument's frame builds a speckle model, which is subtracted, and the residuals are then de-rotated and stacked so the companion adds coherently. **This is the workhorse technique** and it is responsible for most imaged planets.

**Spectral differential imaging.** Speckle position scales with wavelength — the pattern is a diffraction effect — while a companion's position does not. Observing simultaneously at several wavelengths and rescaling separates the two.

**Reference differential imaging.** Subtract the image of a similar star observed under similar conditions, taken from a library of hundreds of such observations, choosing the combination that best matches the target's speckle pattern.

All three share a failure mode worth knowing: **the subtraction removes some of the planet's light too**, an effect called self-subtraction, which biases photometry and can suppress a companion entirely if it lies too close in. Recovering the true brightness requires injecting fake companions into the raw data and processing them identically to measure how much signal the pipeline destroys — the same injection-and-recovery logic used in transit completeness.

```checkpoint
q: What sets the contrast floor in high-contrast imaging?
a: The diffraction limit of the telescope, which cannot be exceeded
x: Diffraction sets the *angular resolution*, not the contrast. Planets are routinely sought at separations where they are formally resolved.
a*: Quasi-static speckles from slowly drifting instrumental aberrations, which look identical to faint companions and do not average down with longer exposures
a: Photon noise from the star, which requires longer integration to overcome
x: Photon noise does average down as the square root of time; the limiting speckle noise does not, which is why longer exposures stop helping.
a: Atmospheric turbulence, which cannot be fully corrected
x: Atmospheric speckles vary on millisecond timescales and average into a smooth halo, so they are statistically benign compared with the static component.
hint: Ask which noise source has the same appearance as the signal and does not diminish with integration time.
why: Nanometre-scale imperfections in the optics scatter starlight into speckles — diffraction-limited bright points identical in size and shape to a planet's image, because both are images of a point source formed by the same optics. Speckles come in two kinds. Atmospheric ones change on milliseconds and average into a smooth halo, which is tolerable. **Quasi-static speckles**, arising from slowly drifting instrumental aberrations, persist for minutes to hours and do not average down: a longer exposure collects more planet photons and more speckle photons in equal proportion, so the contrast ratio is unchanged. This is why raw integration time stops buying performance and why the field's effort goes into differential techniques instead — angular differential imaging exploiting sky rotation, spectral differential imaging exploiting the wavelength scaling of speckle position, and reference differential imaging using a library of comparison stars. Each carries the same cost: the subtraction removes some of the planet's flux too, so photometry must be calibrated by injecting synthetic companions into the raw data and processing them identically to measure how much signal the pipeline destroys.
---
q: Every directly imaged exoplanet so far is young and massive. Why?
a: Because massive planets are more common around young stars
x: Occurrence rates do not depend on the star's current age in that way; the bias is in detectability, not in the population.
a*: Because young giant planets are still radiating the heat of their formation, giving contrasts of $10^{-4}$–$10^{-5}$ against $\sim10^{-9}$ for reflected light from a mature giant
a: Because young stars are closer to Earth on average, improving angular resolution
x: Nearby young associations are indeed favoured targets, but the decisive factor is the contrast gain from self-luminosity, which is four to six orders of magnitude.
a: Because older planets have migrated inward and are no longer resolvable
x: There is no general mechanism that removes wide-orbit giants as a system ages.
hint: Compare the contrast of a planet shining by reflected starlight with one still glowing from its own formation.
why: A mature planet is visible only in reflected light, giving a contrast of $A(R_p/a)^2/4$ — about $1.0\times10^{-9}$ for Jupiter and $1.4\times10^{-10}$ for Earth. A planet only tens of millions of years old has not yet radiated away the gravitational energy of its assembly, so it glows in the infrared with $10^{-4}$ to $10^{-5}$ of its star's luminosity, concentrated at wavelengths where the star is comparatively faint. **That is four to six orders of magnitude of advantage**, and it entirely determines which planets are accessible. The consequence for interpretation is severe: the imaged sample is drawn from a narrow slice of age and mass, so it cannot be combined with transit and radial velocity samples into a single demographic picture without careful treatment, and statements about "directly imaged planets" describe an unusual population rather than planets in general. It also means the method's fortunes are tied to finding nearby young moving groups, since the planets fade rapidly — a target that is easy at $10$ Myr may be inaccessible at $1$ Gyr.
```

## 3. Coronagraphs and starlight suppression

Even with perfect speckle removal, the star's diffracted light must be suppressed. A **coronagraph** blocks or redirects the on-axis starlight while letting off-axis light through.

**Lyot coronagraph.** An occulting mask in the focal plane blocks the star's core; a stop in the following pupil plane blocks the light diffracted around the mask's edges. Simple and robust, with performance limited by the mask's size — a larger mask suppresses better but eats the inner working angle.

**Vortex coronagraph.** A phase mask imposing an azimuthal phase ramp sends on-axis light entirely outside the pupil, while off-axis light passes. It achieves a small inner working angle, of order $1\lambda/D$, which is why it is favoured for reaching close separations.

**Apodised pupil designs.** Shaping the pupil's transmission alters the point spread function so the diffraction rings are suppressed in a chosen region — a "dark hole" — at the cost of throughput and field of view.

**Wavefront control.** Deformable mirrors are used not merely to correct the atmosphere but to actively null residual starlight, sensing the speckle field itself and commanding the mirror to destructively interfere with it. Laboratory demonstrations have reached $10^{-10}$ contrast in narrow bands under vacuum and thermal stability unattainable on the ground.

**Starshades.** A separate spacecraft flying tens of thousands of kilometres ahead of the telescope, with petal-shaped edges shaped so that diffraction around them cancels, casting a deep shadow. It removes starlight before it enters the telescope, so instrumental aberrations do not scatter it — an elegant inversion of the problem. The cost is formation flying at extreme precision and hours of repositioning to change targets.

**The ground–space division is fundamental here.** The atmosphere limits ground-based contrast to roughly $10^{-6}$–$10^{-7}$ regardless of aperture, because residual wavefront errors after adaptive-optics correction scatter light faster than the correction removes it. Reaching $10^{-10}$ requires space. Extremely large ground-based telescopes will improve angular resolution and sensitivity to self-luminous planets substantially, but they will not reach reflected-light Earth analogues.

{{image: Coronagraph | An optical arrangement for suppressing the light of a bright central source so that faint companions become visible against it. A focal-plane mask blocks the star's core and a following pupil-plane stop removes light diffracted around the mask's edge; more recent designs impose a phase pattern that sends on-axis light entirely outside the pupil, reaching smaller working angles. Suppression alone is not sufficient, because nanometre-scale imperfections elsewhere in the optics scatter starlight into speckles that resemble planets and do not average away with exposure time — which is why coronagraphy is always paired with active wavefront control and with differential imaging techniques that exploit some property distinguishing a real companion from a speckle.}}

## 4. What has been imaged

**HR 8799.** Four giant planets, from $16$ to $71$ AU, around a young A star — the first multi-planet system imaged, and the only one where the orbital motion of four planets has been followed directly over more than a decade. The system is dynamically packed and its long-term stability requires the planets to be in a resonant chain, which is itself a constraint on how they formed.

**Beta Pictoris b.** A giant planet within the well-studied debris disc of a nearby young star, whose orbit is aligned with the disc and which has been tracked through conjunction. It supplied the first direct confirmation that a planet can sculpt a debris disc's structure.

**51 Eridani b.** Cooler and lower-mass than most imaged planets, showing methane absorption — a spectral feature marking a genuinely different atmospheric regime from the hotter objects and one that connects the imaged planets to the brown dwarf sequence.

**PDS 70 b and c.** Two planets imaged **while still accreting**, inside the gap of their star's protoplanetary disc, with hydrogen emission indicating ongoing infall and a circumplanetary disc detected around one of them. This is the closest thing available to watching planet formation in progress, and it converted a set of theoretical expectations about gap-opening and circumplanetary discs into observations.

**The pattern:** young stars, wide orbits, massive planets, and — in the most valuable cases — systems where the planet can be studied in relation to a disc or to its siblings.

{{image: HR 8799 | The first multi-planet system to be imaged directly, four giant planets orbiting a young star at separations of tens of astronomical units. Systems of this kind are accessible because the planets are only tens of millions of years old and still radiating the gravitational energy of their assembly, which makes them four to six orders of magnitude brighter relative to their host than a mature planet shining by reflected light. Following the four orbits over more than a decade has shown the configuration to be dynamically packed, requiring a resonant chain for long-term stability, which is itself a constraint on how the system formed and subsequently rearranged itself.}}

## 5. What imaging uniquely provides

**A spectrum of the planet.** This is the headline. Transmission spectroscopy during transit probes only the terminator's thin annulus and is degenerate with clouds; emission spectroscopy at secondary eclipse gives a dayside average mixed with the star. **Direct imaging isolates the planet's own light**, allowing measurement of molecular abundances, effective temperature, surface gravity and clouds without the star in the aperture.

The results have been substantive: methane and water in cooler objects, carbon monoxide in hotter ones, and — most usefully — **carbon-to-oxygen ratios**, which are a formation diagnostic. A planet assembled from gas beyond the water snow line should be carbon-rich relative to its star, since oxygen is locked into ice grains that were not accreted; one assembled with substantial solid accretion should not. **Measuring C/O in an imaged planet is a direct test of where and how it formed**, and it is the strongest scientific argument for the technique.

**Orbits in three dimensions.** Repeated imaging traces the orbit on the sky, giving inclination, node and eccentricity — the elements radial velocity cannot supply. For multi-planet systems this determines mutual inclinations and hence dynamical history.

**Wide separations.** The method reaches tens to hundreds of AU, where transits and radial velocity have no sensitivity at all. The occurrence rate of giant planets at $10$–$100$ AU is a direct constraint on formation models, and imaging surveys have established that it is **low** — a few per cent at most for massive planets at wide separations — which is itself an important negative result, since gravitational instability models had predicted more.

```checkpoint
q: Why is a directly imaged planet's spectrum more informative than a transmission spectrum obtained during transit?
a: Because it has higher signal-to-noise, the planet being brighter than the transit signal
x: Imaged planets are extremely faint; the advantage is not photometric.
a*: Because it isolates the planet's own light rather than starlight filtered through a thin annulus at the terminator, so it probes the whole visible hemisphere and is not degenerate with high clouds
a: Because it can be obtained at any orbital phase rather than only during transit
x: Convenient, but scheduling flexibility is not what makes the data more informative.
a: Because transmission spectroscopy cannot detect molecules, only continuum
x: Transmission spectroscopy detects molecules routinely; the issue is what region it probes and what it is degenerate with.
hint: Ask what part of the planet each technique samples, and what can hide the signal in each case.
why: Transmission spectroscopy measures starlight passing through the thin annulus of atmosphere at the day–night terminator during transit, so it samples a limited region at high altitude, and a high-altitude cloud or haze deck flattens the spectrum by blocking the light before it reaches the molecular absorbers — a well-known degeneracy that has muted many observed spectra. Emission spectroscopy at secondary eclipse gives a dayside average but is extracted as a small difference between two large fluxes. **Direct imaging separates the planet spatially**, so the spectrum is of the planet's own emission, over the visible hemisphere, with no starlight to subtract. That permits measurement of effective temperature, surface gravity, cloud properties and molecular abundances — and in particular the **carbon-to-oxygen ratio**, which is a formation diagnostic: a planet assembled mostly from gas beyond the water snow line should be carbon-rich relative to its star, because oxygen is sequestered in ice grains it did not accrete, whereas one assembled with substantial solid accretion should not be. That makes C/O in an imaged planet a direct test of where it formed, which is the strongest scientific argument for the technique.
---
q: Imaging surveys have found few giant planets at $10$–$100$ AU. Why is this negative result valuable?
a: It shows the surveys were not sensitive enough, and larger telescopes are required
x: The surveys are demonstrably sensitive to massive planets at those separations, which is what makes the non-detections meaningful.
a*: Because it constrains formation models — gravitational instability predicts more massive planets at wide separations than are observed
a: It shows that giant planets always migrate inward after forming
x: Migration is one possibility, but the result constrains formation efficiency at wide separations rather than establishing subsequent migration.
a: It confirms that direct imaging is the wrong technique for studying giant planets
x: It is the only technique with sensitivity at those separations, which is precisely why its null result carries weight.
hint: A non-detection is informative when the survey's sensitivity to the thing not detected is well characterised.
why: Direct imaging is the only method with meaningful sensitivity beyond about $10$ AU — transit probability falls as $a^{-1}$ and radial velocity requires baselines longer than the orbital period — so its results at those separations are not merely one line of evidence but the only one. Surveys of hundreds of young stars, with contrast performance calibrated by injecting synthetic companions, find giant planets at $10$–$100$ AU in at most a few per cent of systems. **Gravitational instability**, in which a massive disc fragments directly into bound clumps, operates most readily at large radii where cooling is efficient, and predicted a more abundant wide-orbit giant population than is observed. The core accretion route, by contrast, is slow at wide separations because orbital timescales are long and surface densities low, so it naturally produces few such planets. The observation therefore favours core accretion as the dominant channel and confines gravitational instability to a minor role — a conclusion resting on non-detections, which are informative exactly because the sensitivity to what was not found is well characterised.
```

### 5.1 Confirming that a point of light is a planet

A faint point beside a bright star is not by itself a companion. The field's standard test is **common proper motion**: nearby stars move measurably across the sky, so a physically bound object shares that motion while a chance-aligned background star does not. Two epochs separated by a year or more usually settle it, and the discovery papers for every well-established imaged planet lead with this demonstration rather than with the detection itself.

Two further checks are used. **Colour** distinguishes a cool low-gravity companion from a reddened background giant, since the two occupy different regions of infrared colour–magnitude space. And **orbital motion**, detectable over several years for the closer companions, converts a co-moving point into a demonstrably bound one.

The reason to emphasise this is that the failure mode is common. Fields toward star-forming regions are crowded, and background stars in the same photometric aperture are numerous; several early candidate companions were shown to be unassociated once a second epoch was obtained. **A single-epoch imaging detection is a candidate, not a planet**, and the interval between the two is often years.

```checkpoint
q: A faint point source is detected $0.4''$ from a young star. What must be established before it is called a planet?
a: That its spectrum shows molecular absorption consistent with a planetary atmosphere
x: Useful confirming evidence, but a background M dwarf or brown dwarf can show similar features.
a*: That it shares the star's proper motion across the sky, which a chance-aligned background object would not
a: That its brightness is consistent with a planetary mass at the star's age
x: This uses an evolutionary model whose assumptions are exactly what an unassociated object would violate, so it cannot establish association.
a: That it lies within the star's Hill sphere
x: The Hill sphere is enormous at these separations and a projected position inside it says nothing about whether the object is bound.
hint: Ask what distinguishes a bound companion from an unrelated star that happens to lie along the same line of sight.
why: Nearby stars move measurably across the sky, typically tens to hundreds of milliarcseconds per year, so a bound companion shares that motion while a chance-aligned background star stays behind. **Common proper motion, established over two epochs separated by a year or more, is the standard test**, and it leads the discovery paper for every well-established imaged planet. This is not a formality: fields toward star-forming regions are crowded, background stars in the aperture are numerous, and several early candidate companions proved unassociated once a second epoch was obtained. Two further checks strengthen the case — infrared colours distinguish a cool low-gravity object from a reddened background giant, and orbital motion detected over several years converts a co-moving point into a demonstrably bound one. The practical consequence is that **a single-epoch detection is a candidate rather than a planet**, and the interval to confirmation is often years, which is why imaging surveys are structured around repeat visits rather than one-off observations.
---
q: PDS 70 b and c were imaged while still accreting inside their star's protoplanetary disc. Why is this system exceptional?
a: Because it is the closest imaged planetary system to Earth
x: It is not; several imaged systems are nearer, and proximity is not what makes it valuable.
a*: Because it shows planets in the act of forming — gap-opening, ongoing infall traced by hydrogen emission, and a circumplanetary disc — converting theoretical expectations into observations
a: Because the planets are the lowest-mass objects yet imaged
x: 51 Eridani b and others are cooler and less massive; the PDS 70 planets are giants.
a: Because it is the only imaged system where orbital motion has been measured
x: Orbital motion has been followed in HR 8799 and Beta Pictoris over more than a decade.
hint: Ask what stage of a planet's life every other imaged system shows, and what this one shows instead.
why: Every other imaged planet is a finished object, tens of millions of years old, cooling from formation that ended long before. **PDS 70 shows the process itself**: two giant planets sitting inside the cleared gap of their star's protoplanetary disc, with hydrogen emission indicating gas still falling onto them, and a circumplanetary disc detected around one. Each of those had been a prediction — that a sufficiently massive planet clears a gap in its natal disc, that accretion onto a forming planet proceeds through a shock producing hydrogen line emission, and that the material accreting settles into a disc from which regular satellites could later form — and each became an observation. The system is therefore the closest available thing to watching planet formation happen, and it is valuable out of proportion to being two more entries in a catalogue of about seventy imaged objects. It also bears on the hot start problem: an object observed while still accreting has, by construction, not yet radiated away its formation energy, which constrains the initial conditions that evolutionary models must assume.
```

## 6. The hot start problem

This is the method's largest systematic and it is rarely given the prominence it deserves.

An imaged planet's mass is not measured. What is measured is its **brightness**, which is converted to a mass using an evolutionary model: given an age and a luminosity, the model returns a mass. **The conversion depends on the planet's initial entropy** — how hot it was when it finished forming — and that is not observable.

**Hot start models** assume the planet retained most of the gravitational energy of accretion, beginning hot and luminous and cooling gradually.

**Cold start models** assume an accretion shock radiated much of that energy away, so the planet begins far cooler and fainter.

**The mass inferred from a given luminosity can differ by a factor of several** between the two, and the discrepancy is largest at young ages, which is exactly where imaged planets are. A young object could be a $5\,M_{\rm J}$ planet that started hot or a $15\,M_{\rm J}$ object that started cold.

**Why this matters beyond bookkeeping.** Statements such as "directly imaged planets are more massive than radial velocity planets" partly reflect this model choice; the boundary between planet and brown dwarf, conventionally placed at the deuterium-burning limit of $13\,M_{\rm J}$, is model-dependent for imaged objects; and formation inferences drawn from mass distributions inherit the assumption.

**The resolution is dynamical.** Where an imaged planet also produces a measurable astrometric or radial velocity signal, its mass can be determined independently of any evolutionary model — and Gaia's astrometry, combined with earlier Hipparcos positions to give a long baseline in proper motion, has begun supplying exactly this for the brightest systems. The comparisons so far tend to favour warm rather than extreme cold starts, but the sample is small.

## 7. Prospects

**Extremely large ground-based telescopes** will improve angular resolution in proportion to aperture and sensitivity faster still, bringing self-luminous planets at smaller separations and lower masses within reach, and enabling higher-resolution spectroscopy of known objects. They will not reach reflected-light Earth analogues, because atmospheric residuals cap ground contrast near $10^{-7}$.

**Space coronagraphy** is where the $10^{-10}$ problem must be solved. A technology demonstration flying a coronagraph with active wavefront control on a space telescope is the necessary intermediate step, and a subsequent large mission designed from the outset for reflected-light imaging of Earth-sized planets in habitable zones is the field's stated long-term goal.

**A candid statement of the gap.** Ground-based imaging currently achieves around $10^{-6}$ at half an arcsecond. Laboratory demonstrations under vacuum reach $10^{-10}$ in narrow bands. An Earth analogue requires $10^{-10}$ on sky, at $0.1''$, in broad bands, with a stable wavefront maintained for hours. **Each of those conditions has been met separately and none in combination**, and the mission that would combine them has not been built. The honest framing is that this is a demanding but well-defined engineering problem with no known physical obstacle — which is a better position than the radial velocity method's astrophysical wall, and a worse one than a problem already solved.

```checkpoint
q: An imaged planet's mass is quoted as $5\,M_{\rm J}$. What was actually measured, and what was assumed?
a: The mass was measured from the planet's gravitational effect on its star
x: That would be a radial velocity or astrometric measurement; for most imaged planets no such signal has been detected.
a*: The brightness was measured, and converting it to a mass required an evolutionary model plus an assumption about the planet's initial entropy, which can shift the answer by a factor of several
a: The mass was measured from the planet's radius and an assumed density
x: Imaged planets are unresolved points; no radius is measured.
a: The mass was measured spectroscopically from the surface gravity
x: Surface gravity can be estimated from a high-quality spectrum, but it constrains $M/R^2$ and requires a radius, itself model-derived.
hint: What does an image actually record, and what has to be supplied to turn that into a mass?
why: An image records a position and a brightness. Converting brightness to mass requires an evolutionary model that takes an age and a luminosity and returns a mass — and the model's answer depends on the planet's **initial entropy**, meaning how hot it was when accretion finished, which is not observable. **Hot start** models assume most of the gravitational energy of assembly was retained, giving a bright young planet; **cold start** models assume an accretion shock radiated much of it away, giving a far fainter one. The same observed luminosity can therefore correspond to a $5\,M_{\rm J}$ planet that started hot or a considerably more massive one that started cold, and the discrepancy is worst at young ages, which is precisely where imaged planets are found. The consequences propagate: comparisons between imaged and radial velocity planet masses partly reflect this model choice, the planet/brown dwarf boundary at $13\,M_{\rm J}$ becomes model-dependent for imaged objects, and formation inferences from mass distributions inherit the assumption. The fix is dynamical — where astrometry or radial velocity independently measures the mass, the evolutionary model is bypassed, and Gaia combined with the long Hipparcos baseline has begun supplying this for the brightest systems.
---
q: Ground-based contrast is limited to roughly $10^{-6}$–$10^{-7}$ regardless of telescope size. What is the underlying reason?
a: The sky background at infrared wavelengths swamps the planet's signal
x: Background is a sensitivity limit that larger apertures and colder instruments help with; it does not impose a contrast ceiling.
a*: Residual wavefront errors left after adaptive-optics correction scatter starlight into speckles faster than the correction removes it, and speckle noise does not average down
a: The diffraction limit cannot be improved beyond a certain point
x: Diffraction improves in direct proportion to aperture, which is why larger telescopes do help with angular resolution.
a: Atmospheric absorption removes the wavelengths where planets are brightest
x: Absorption reduces throughput in certain bands but does not set a contrast ratio.
hint: Ask what is left over after an adaptive optics system has done its best, and what that residual does to starlight.
why: Adaptive optics measures the incoming wavefront and corrects it hundreds to thousands of times per second, but the correction is never perfect: finite actuator count, finite sensing bandwidth, photon noise in the wavefront sensor and chromatic effects all leave residual errors. Those residuals scatter starlight into a speckle halo, and **the halo is refreshed as fast as it is corrected**, so it never fully averages away. Larger apertures improve angular resolution and collect more planet photons, but they do not remove the atmosphere, and the achievable contrast plateaus near $10^{-6}$–$10^{-7}$. This is why the ground/space division in this field is fundamental rather than a matter of degree: extremely large telescopes will substantially extend the reach for self-luminous planets and enable much better spectroscopy of known ones, but a reflected-light Earth analogue at $1.4\times10^{-10}$ requires a stable wavefront maintained for hours, which is achievable only above the atmosphere. Laboratory testbeds under vacuum have reached $10^{-10}$ in narrow bands, so the requirement is demanding engineering rather than an unsolved physical problem.
```

```checkpoint
q: Why is the ground/space division more fundamental for direct imaging than for most other observing techniques?
a: Because the infrared wavelengths where planets emit are entirely absorbed by the atmosphere
x: Several infrared windows are open from the ground, and the current generation of imaged planets was found through them.
a*: Because atmospheric residuals after adaptive-optics correction impose a contrast ceiling near $10^{-7}$ that no increase in aperture removes, while reflected-light Earth analogues need $10^{-10}$
a: Because adaptive optics cannot work on faint stars, and planet hosts are faint
x: Planet-hosting targets for imaging are typically bright nearby stars, which is exactly what adaptive optics requires.
a: Because the sky background from the ground exceeds the planet's brightness
x: Background limits sensitivity and is reduced by cold instruments and larger apertures; it does not fix a contrast ratio.
hint: Distinguish limits that scale away with a bigger telescope from limits that do not.
why: Most observational limitations improve with aperture: collecting area, angular resolution and sensitivity to faint sources all scale favourably, so building bigger is the standard response. Contrast does not behave that way from the ground. Adaptive optics corrects the incoming wavefront hundreds to thousands of times a second but never perfectly — finite actuator count, finite sensing bandwidth, wavefront-sensor photon noise and chromatic effects all leave residuals — and those residuals continuously scatter starlight into a speckle halo that is **replenished as fast as it is corrected**. The resulting contrast plateau near $10^{-6}$–$10^{-7}$ is a property of the atmosphere and the correction loop, not of the telescope, so a thirty-metre aperture does not breach it. Since a reflected-light Earth analogue sits at $1.4\times10^{-10}$, the gap cannot be closed from the ground at any size. Extremely large telescopes will still transform the field for **self-luminous** planets, where the contrast requirement is $10^{-5}$ rather than $10^{-10}$, and will enable far better spectroscopy of known objects — but reflected-light imaging of temperate rocky planets is a space problem, and recognising which limits scale with aperture and which do not is what determines where money should go.
---
q: The differential imaging techniques exploit angular, spectral and reference information. What single question do all three answer?
a: How can the planet's photons be collected more efficiently?
x: None of them increases throughput; they all discard signal in the course of removing noise.
a*: What is true of the noise that is not true of the signal — since speckles and planets are photometrically and morphologically identical, only a difference of some other kind can separate them
a: How can the exposure time be extended without saturating the detector?
x: Saturation is a practical constraint handled by frame rate, and is unrelated to the design principle behind these techniques.
a: How can the star's light be blocked before it reaches the detector?
x: That is coronagraphy, which is a separate and complementary stage; differential imaging operates on what survives it.
hint: A speckle and a planet form identical images. What else could differ between them?
why: A speckle is a diffraction-limited image of a point source; so is a planet. They have the same size, shape and profile, so no measurement of an individual image separates them and no amount of integration helps, since quasi-static speckles do not average down. Progress came entirely from identifying properties that differ in some **other** respect. Speckles are fixed to the instrument while the sky rotates, which angular differential imaging exploits by letting the field rotate and building a speckle model in the instrument frame. Speckle position scales with wavelength because the pattern is a diffraction effect, while a companion's does not, which spectral differential imaging exploits. And a reference star observed under similar conditions shares the target's speckle pattern but not its companions. Each is an answer to the same question, and each pays the same price — self-subtraction, since the noise model inevitably contains some planet light — which must be calibrated by injecting synthetic companions and processing them identically. **When a noise source mimics the signal, ask what else differs**; the answer is rarely more photons.
```

## 8. Pulling the thread

- **It is the only method that collects the planet's own photons**, and therefore the only route to a spectrum of the object rather than of starlight that passed through or bounced off it.
- **Contrast is the obstacle, not resolution.** An Earth analogue at $10$ pc sits at $0.1''$, twice the diffraction limit of an $8$-metre telescope. Its contrast is $1.4\times10^{-10}$, against a demonstrated on-sky $10^{-6}$.
- **The current sample is self-luminous, not reflective.** Young giants glow at $10^{-4}$–$10^{-5}$ of their star, four to six orders of magnitude above reflected light — which is why every imaged planet is young, massive and widely separated, and why the sample cannot yet be merged with transit and radial velocity demographics.
- **Quasi-static speckles set the floor** and do not average down, so integration time stops helping; the field's techniques all exploit some property that distinguishes a companion from a speckle, at the cost of self-subtraction that must be calibrated by injection and recovery.
- **Masses are model-dependent.** Brightness plus an evolutionary model gives mass only after assuming an initial entropy, and hot versus cold starts differ by a factor of several at the ages that matter.
- **The negative result matters.** Few giants at $10$–$100$ AU disfavours gravitational instability as a common channel, and it is informative because the sensitivity to what was not found is well characterised.
- **C/O ratios are the strongest scientific case**, since they record where in the disc a planet's gas was gathered.
- **The gap to $10^{-10}$ is engineering, not physics** — each condition has been met separately, none in combination, and the atmosphere caps ground performance regardless of aperture.

The transferable idea: **when a measurement is limited by a noise source that mimics the signal, the productive move is to find a property that differs, not to collect more data.** Speckles and planets are photometrically and morphologically identical — both are diffraction-limited images of point sources — so no amount of integration separates them, and the field's progress came entirely from identifying differences of a different kind: speckles are fixed to the instrument while the sky rotates; speckle position scales with wavelength while a companion's does not; a reference star's speckle pattern resembles the target's while its planets do not. **Each technique is an answer to the question "what is true of the noise that is not true of the signal?"** That question is worth asking whenever a measurement stops improving with exposure time, because it usually has an answer, and the answer is usually not more photons.

## 9. Further reading

{{book: Sara Seager | Exoplanets | 2010}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Wesley Traub and Ben Oppenheimer | Direct Imaging of Exoplanets | 2010}}

Beyond the books: Traub and Oppenheimer's review chapter is the clearest treatment of coronagraph design and of why contrast rather than resolution is the limiting quantity. The HR 8799 discovery papers are worth reading for how carefully common proper motion was established before the companions were claimed as planets — the standard test for distinguishing a bound companion from a background star. On the hot start problem, the original papers proposing cold start models are unusually explicit about the size of the resulting mass uncertainty, more so than most subsequent work that quotes masses derived from them.

## Problems

*Useful numbers: $\theta = a/d$, giving $0.1''$ for $1$ AU at $10$ pc; $\theta_{\rm min} = 1.22\lambda/D = 0.050''$ for $D = 8$ m at $\lambda = 1.6$ μm; reflected contrast $\approx A(R_p/a)^2/4$, giving $1.4\times10^{-10}$ for Earth ($A=0.3$) and $1.0\times10^{-9}$ for Jupiter ($A=0.5$); young giant self-luminous contrast $10^{-4}$–$10^{-5}$; ground-based demonstrated contrast $\sim10^{-6}$; $R_\oplus = 6.371\times10^6$ m, $R_{\rm J} = 6.991\times10^7$ m, $1$ AU $= 1.496\times10^{11}$ m.*

**1.** *(Geometry.)* **(a)** Compute the angular separation of a Jupiter analogue at $20$ pc. **(b)** Compare with the diffraction limit of an $8$ m telescope at $1.6$ μm. **(c)** State whether resolution or contrast is the binding constraint and why.

**2.** *(Contrast.)* **(a)** Compute the reflected-light contrast of Jupiter at $5.2$ AU with $A = 0.5$. **(b)** Do the same for Earth at $1$ AU with $A = 0.3$. **(c)** State how these compare with a young self-luminous giant and what follows for the observed sample.

**3.** *(Speckles.)* **(a)** Explain why a speckle is indistinguishable from a planet in a single image. **(b)** Distinguish atmospheric from quasi-static speckles and state which is limiting. **(c)** State why longer exposures do not improve contrast.

**4.** *(Differential imaging.)* For each of angular, spectral and reference differential imaging: state the property of the noise that is exploited, and state the shared failure mode and how it is calibrated.

**5.** *(Coronagraphy.)* **(a)** Describe how a Lyot coronagraph works. **(b)** State the advantage of a vortex design. **(c)** Explain why a starshade removes a problem that no in-telescope design can.

**6.** *(The hot start problem.)* **(a)** State what is measured and what is inferred. **(b)** State the physical difference between hot and cold start models. **(c)** Give two consequences for published results and the observational route that bypasses the assumption.

**7.** *(Wide-orbit giants.)* **(a)** State the observational result. **(b)** Explain why direct imaging is the only method that could establish it. **(c)** State what it implies about gravitational instability versus core accretion.

**8.** *(Spectra.)* **(a)** State the advantage over transmission spectroscopy. **(b)** Explain why C/O is a formation diagnostic. **(c)** State what a carbon-rich planet relative to its star would indicate.

**9.** *(Prospects.)* **(a)** State the contrast currently achieved on sky and the contrast required for an Earth analogue. **(b)** Explain why ground-based telescopes cannot close the gap regardless of size. **(c)** Give a candid assessment of whether the remaining problem is physical or engineering, and justify it.

## Worked answers

**1.** **(a)** $\theta = 5.2/20 = 0.26''$. **(b)** $0.050''$, so the separation is about five times the diffraction limit — comfortably resolved. **(c)** Contrast. The geometry poses no difficulty at these separations; the difficulty is that the planet is between $10^{-5}$ and $10^{-9}$ of the star's brightness, and the starlight scattered by imperfect optics into the planet's position exceeds the planet by orders of magnitude.

**2.** **(a)** $(0.5/4)(6.991\times10^7/7.779\times10^{11})^2 = 0.125\times(8.98\times10^{-5})^2 = 1.0\times10^{-9}$. **(b)** $(0.3/4)(6.371\times10^6/1.496\times10^{11})^2 = 0.075\times(4.26\times10^{-5})^2 = 1.4\times10^{-10}$. **(c)** A young self-luminous giant reaches $10^{-4}$–$10^{-5}$, four to six orders of magnitude brighter relative to its star. Consequently every imaged planet is young and massive, seen in its own thermal emission, and the sample is drawn from a narrow slice of age and mass that cannot be merged with transit or radial velocity demographics without careful treatment.

**3.** **(a)** Both are images of a point source formed by the same optics, so they have identical size, shape and profile — a speckle is a diffraction-limited spot, and so is a companion. **(b)** Atmospheric speckles vary on millisecond timescales and average into a smooth halo; quasi-static speckles arise from slowly drifting instrumental aberrations, persist for minutes to hours, and are the limiting term. **(c)** Because a longer exposure collects more photons from the planet and proportionally more from the quasi-static speckle, leaving the contrast ratio unchanged — the noise is not photon noise and does not fall as the square root of time.

**4.** *Angular:* the sky rotates while instrumental aberrations stay fixed relative to the optics, so a companion moves between frames and speckles do not. *Spectral:* speckle position scales with wavelength because it is a diffraction effect, while a companion's position does not, so simultaneous multi-wavelength observation and rescaling separates them. *Reference:* a comparison star observed under similar conditions has a similar speckle pattern but no companion at the target's position. *Shared failure mode:* self-subtraction — the model of the speckle field partly includes the planet's own light, so the subtraction removes some signal and biases photometry, and it can suppress a companion entirely at small separations. *Calibration:* inject synthetic companions of known brightness into the raw data and process them identically, measuring how much flux the pipeline destroys.

**5.** **(a)** An occulting mask in the focal plane blocks the star's core, and a stop in the following pupil plane blocks the light diffracted around the mask's edges; performance improves with mask size at the cost of the inner working angle. **(b)** A vortex phase mask imposes an azimuthal phase ramp that sends on-axis light entirely outside the pupil while passing off-axis light, achieving an inner working angle of order $1\lambda/D$ and so reaching much closer separations. **(c)** A starshade blocks the starlight *before* it enters the telescope, so it never encounters the optics and cannot be scattered by their imperfections into speckles. Every in-telescope design must suppress light that has already passed through the optics, so it remains vulnerable to aberrations downstream of the mask.

**6.** **(a)** The planet's brightness is measured; the mass is inferred using an evolutionary model given an assumed age. **(b)** Hot start models assume the planet retained most of the gravitational energy of accretion and begins hot and luminous; cold start models assume an accretion shock radiated much of it away, so the planet begins far fainter. The same luminosity then implies very different masses, differing by a factor of several, worst at young ages. **(c)** Comparisons of imaged planet masses with radial velocity masses partly reflect the model choice rather than a physical difference; and the planet/brown dwarf boundary at $13\,M_{\rm J}$ becomes model-dependent for imaged objects. The bypass is a dynamical mass — astrometry or radial velocity measuring the companion's gravitational effect directly, as Gaia combined with the long Hipparcos baseline now supplies for the brightest systems.

**7.** **(a)** Giant planets at $10$–$100$ AU occur in at most a few per cent of surveyed young systems. **(b)** Because no other method has sensitivity there: transit probability falls as $a^{-1}$ and requires repeated events within a mission baseline, while radial velocity requires observing for longer than the orbital period, which is decades to centuries at those separations. **(c)** Gravitational instability operates most readily at large radii where disc cooling is efficient and predicts more wide-orbit giants than are observed, whereas core accretion is naturally slow and inefficient there. The result therefore favours core accretion as the dominant channel and confines gravitational instability to a minor role.

**8.** **(a)** Transmission spectroscopy samples only the thin terminator annulus and is degenerate with high-altitude cloud, which flattens the spectrum; direct imaging isolates the planet's own emission over the visible hemisphere with no starlight to subtract. **(b)** Because oxygen is preferentially locked into ice grains beyond the water snow line, gas there is oxygen-depleted and therefore carbon-rich, while solids are the reverse — so the C/O ratio of a planet's envelope records the mix of gas and solids it accreted and the location where that accretion happened. **(c)** That the planet gathered its envelope predominantly from gas beyond the snow line, with comparatively little solid accretion enriching it in oxygen.

**9.** **(a)** Around $10^{-6}$ on sky at half an arcsecond; $1.4\times10^{-10}$ is required for an Earth analogue in reflected light. **(b)** Because residual wavefront errors surviving adaptive-optics correction continuously scatter starlight into a speckle halo that is refreshed as fast as it is removed, capping contrast near $10^{-6}$–$10^{-7}$ irrespective of aperture; larger telescopes improve angular resolution and collect more planet photons but do not remove the atmosphere. **(c)** Engineering. Each necessary condition has been demonstrated separately — $10^{-10}$ in laboratory vacuum testbeds in narrow bands, $0.1''$ inner working angles with vortex designs, active wavefront control nulling residual starlight — but never in combination on a flight system with a wavefront held stable for hours in broad bands. No physical obstacle is known, which makes this a better position than the radial velocity method's astrophysical limit, and a worse one than a solved problem.$exImg_master$,
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
