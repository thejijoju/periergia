-- Astronomy & Space · Exoplanets — Finding Worlds — "Transits".
-- Curated master for
-- astronomy-and-space/exoplanets/finding-worlds/transits
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens the Exoplanets subject. Organised around the method's defining
-- limitation rather than its successes: a transit requires an alignment
-- of probability R_star/a, which is 0.47% for an Earth-Sun analogue, so
-- the technique is blind to 99.5% of the systems it is meant to survey.
-- Every occurrence rate in the field is therefore a corrected number,
-- and the correction is larger than the measurement. Then the physics -
-- depth, duration, impact parameter, limb darkening, and what the light
-- curve does and does not contain; why transits give radius but never
-- mass; the false positive problem and how Kepler solved it
-- statistically; transit timing variations as a mass measurement
-- without spectroscopy; secondary eclipses and phase curves; the
-- Rossiter-McLaughlin effect and misaligned hot Jupiters; and the
-- radius valley as the method's most important discovery.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: depth (Rp/Rs)^2 = 10,098 ppm for
-- Jupiter/Sun, 84 ppm for Earth/Sun, 2,097 ppm for Earth around a
-- 0.2 Rsun M dwarf, 1,250 ppm for Neptune/Sun; geometric probability
-- Rs/a = 0.465% for Earth-Sun, 9.30% for a hot Jupiter at 0.05 AU,
-- 0.089% for Jupiter at 5.2 AU, 1.88% for TRAPPIST-1e; central transit
-- duration (P/pi) arcsin(Rs/a) = 13.0 hr for Earth-Sun and 2.7 hr for
-- a 3-day hot Jupiter.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/finding-worlds/transits',
    'research',
    'advanced',
    'read',
    $exTransit_master$> If the Earth were observed from a randomly chosen direction, the probability that it would ever be seen crossing the face of the Sun is **$0.47\%$**. Not the probability of catching a particular transit — the probability that the geometry permits a transit at all, ever, from that direction.

The transit method has found more planets than every other technique combined. It is also **blind to more than $99.5\%$ of Earth-like systems**, not through insufficient sensitivity but through geometry, and no improvement in instrumentation will change that.

This is the shape of the whole subject. Every occurrence rate quoted in exoplanet science — how common are Earth-sized planets, what fraction of stars host worlds in the habitable zone — is a number obtained by dividing a small detected sample by a small probability, so **the correction is larger than the measurement**. Understanding the method means understanding the correction, and this chapter treats it as the main event rather than a caveat.

## 1. The signal

When a planet crosses its star's disc, it blocks a fraction of the light equal to the ratio of areas:

$$\delta = \left(\frac{R_p}{R_\star}\right)^2.$$

That is the entire measurement in its simplest form, and it is worth appreciating how little it requires — no spectroscopy, no resolved image, no knowledge of the distance. Photometry alone.

| System | $R_p/R_\star$ | Depth |
|---|---|---|
| Jupiter across the Sun | $0.100$ | $1.01\%$ ($10{,}098$ ppm) |
| Neptune across the Sun | $0.035$ | $0.13\%$ ($1{,}250$ ppm) |
| Earth across the Sun | $0.0092$ | $0.0084\%$ ($84$ ppm) |
| Earth across a $0.2\,R_\odot$ M dwarf | $0.046$ | $0.21\%$ ($2{,}097$ ppm) |

Two things follow immediately.

**Detecting an Earth analogue requires photometry good to tens of parts per million.** This is why the search waited for space: atmospheric scintillation limits ground-based precision to roughly $10^{-3}$ on a good night, more than an order of magnitude short. Kepler achieved $\sim20$–$30$ ppm on bright stars over six-hour integrations, which is what made the measurement possible at all.

**Small stars are enormously easier.** The same planet around a $0.2\,R_\odot$ M dwarf produces a signal $25$ times deeper, because depth scales as $R_\star^{-2}$. This single fact — not any preference for M dwarfs as habitats — is why the small-planet census is dominated by them, and it is a selection effect that must be undone before any statement about planets in general can be made.

### 1.1 Duration and shape

The transit duration for a central crossing is

$$T = \frac{P}{\pi}\arcsin\!\left(\frac{R_\star}{a}\right) \approx \frac{P R_\star}{\pi a},$$

giving $13.0$ hours for an Earth–Sun transit and $2.7$ hours for a hot Jupiter on a three-day orbit. Because $P$ and $a$ are linked by Kepler's third law, **the duration carries information about the orbit** and, combined with the period, constrains the stellar density directly:

$$\rho_\star \approx \frac{3\pi}{GP^2}\left(\frac{a}{R_\star}\right)^3,$$

which is a genuinely useful and often overlooked output: a transit light curve measures a property of the *star*, independent of stellar models, and disagreement with the spectroscopic estimate is a warning that something is wrong — often that the "planet" is a blend.

The **impact parameter** $b = a\cos i/R_\star$ describes how centrally the planet crosses. A grazing transit ($b$ near $1$) is shorter and V-shaped; a central transit ($b = 0$) is longer and flat-bottomed. This matters because $b$ is degenerate with $R_p/R_\star$ — a grazing transit of a large planet can mimic a central transit of a small one — and breaking that degeneracy relies on the shape of the ingress and egress.

**Limb darkening** complicates the flat bottom. A star is not a uniform disc: its centre is brighter than its edge, because a line of sight at the centre reaches deeper and hotter layers. So a transit is deeper when the planet is near the centre, giving a curved rather than flat trough. This must be modelled to extract $R_p/R_\star$ accurately, and the coefficients are usually taken from stellar atmosphere models — introducing a model dependence into what looks like a purely geometric measurement.

## 2. Geometry, and the correction that dominates everything

### 2.1 The probability

A transit occurs only if the orbital plane is close enough to edge-on. For a circular orbit, the condition is $|\cos i| < R_\star/a$, and for randomly oriented orbits $\cos i$ is uniformly distributed, so

$$P_{\rm tr} = \frac{R_\star}{a}.$$

| System | $a$ | $P_{\rm tr}$ |
|---|---|---|
| Hot Jupiter | $0.05$ AU | $9.30\%$ |
| TRAPPIST-1e | $0.029$ AU (M dwarf) | $1.88\%$ |
| Earth–Sun | $1$ AU | $0.465\%$ |
| Jupiter–Sun | $5.2$ AU | $0.089\%$ |

**The method is biased toward short periods by a factor proportional to $a^{-1}$**, on top of a second bias: a survey of duration $T_{\rm obs}$ requires several transits for a secure detection, so planets with $P > T_{\rm obs}/3$ are effectively excluded regardless of geometry. Kepler's four-year baseline meant true Earth analogues — one transit per year, three or four in the mission — sat at the very edge of detectability, which is why $\eta_\oplus$ remains the field's most contested number.

### 2.2 What the correction does to an occurrence rate

Suppose a survey monitors $N_\star$ stars and finds $N_{\rm det}$ planets in some period and radius bin. The occurrence rate is not $N_{\rm det}/N_\star$. It is

$$f = \frac{1}{N_\star}\sum_{i}\frac{1}{P_{{\rm tr},i}\,\times\,C_i},$$

where $C_i$ is the detection completeness — the probability that a transiting planet of that size and period, around that particular star, would actually have been recovered by the pipeline, given the star's noise properties and the search algorithm.

**Each detected Earth analogue therefore stands for about $215$ undetected ones** from geometry alone, before completeness is applied. A handful of marginal detections, each weighted by a factor of hundreds, produces an occurrence rate whose uncertainty is dominated by how the weighting was done rather than by counting statistics.

This is why $\eta_\oplus$ estimates in the literature range from a few per cent to more than fifty per cent using largely the same data. **The disagreement is not about the detections; it is about the corrections**, and specifically about how completeness is characterised near the detection threshold, where the recovery probability changes fastest and is hardest to measure. Injection-and-recovery tests — inserting synthetic transits into real data and running the pipeline blind — are the standard tool, and they are the reason modern occurrence rates are defensible at all.

```checkpoint
q: The transit probability for an Earth–Sun analogue is $0.47\%$. What is the correct interpretation?
a: There is a $0.47\%$ chance of catching a transit during any given observing session
x: That is a question about timing and observing duration. This number is about geometry alone, and it applies before any observation is scheduled.
a*: From a randomly chosen viewing direction, there is a $0.47\%$ chance the orbit is aligned closely enough for transits to occur at all — so the method is permanently blind to the other $99.5\%$
a: Only $0.47\%$ of Sun-like stars have planets close enough to detect
x: The number says nothing about how many stars have planets; it is purely about the orientation of orbits relative to the observer.
a: The signal-to-noise ratio permits detection in $0.47\%$ of cases
x: Sensitivity is a separate limitation. This constraint would remain even with a perfect instrument.
hint: For randomly oriented orbits, $\cos i$ is uniformly distributed — what fraction satisfies $|\cos i| < R_\star/a$?
why: A transit requires $|\cos i| < R_\star/a$, and for randomly oriented orbits $\cos i$ is uniform, so the probability is exactly $R_\star/a = 6.96\times10^8/1.496\times10^{11} = 0.465\%$. This is **geometry, not sensitivity**: no improvement in photometric precision changes it, because in the other $99.5\%$ of orientations the planet simply never crosses the stellar disc. The consequence dominates the field's statistics. Each detected Earth analogue represents about $215$ undetected ones from geometry alone, before accounting for detection completeness, so occurrence rates are obtained by multiplying a handful of marginal detections by factors of hundreds. This is why published values of $\eta_\oplus$ span from a few per cent to over fifty per cent using largely the same data — **the disagreement is about the corrections, not the detections** — and why injection-and-recovery testing, in which synthetic transits are inserted into real light curves and the pipeline is run blind, is essential rather than optional.
---
q: An Earth-sized planet transiting a $0.2\,R_\odot$ M dwarf produces a signal $25$ times deeper than the same planet transiting the Sun. What is the main consequence for the exoplanet census?
a: M dwarfs form small planets more efficiently than Sun-like stars do
x: That may or may not be true, but it cannot be concluded from a statement about detectability — which is precisely the confusion the selection effect creates.
a*: The known small-planet population is dominated by M dwarf hosts as a selection effect, which must be undone before any claim about planets around stars in general
a: M dwarfs are the best targets for finding habitable planets, since detection is easiest there
x: Detectability is one consideration, but habitability around M dwarfs is complicated by flares, tidal locking and extreme early-time luminosity evolution.
a: Transit depths around M dwarfs are large enough that ground-based telescopes can detect Earth-sized planets
x: This is true and useful — MEarth and TRAPPIST work this way — but it is a consequence for instrumentation rather than for the census.
hint: Depth scales as $R_\star^{-2}$; ask what that does to which systems enter a magnitude-limited survey.
why: Transit depth is $(R_p/R_\star)^2$, so shrinking the star from $1.0$ to $0.2\,R_\odot$ deepens the signal by a factor of $25$ — from $84$ ppm to $2{,}097$ ppm for an Earth-sized planet, which moves it from the edge of space-based capability to within reach of ground-based photometry. Transit probability also rises, since $R_\star/a$ benefits from the short orbits that put an M dwarf planet in the habitable zone. The result is that the catalogue of small planets is heavily weighted toward M dwarf hosts **for reasons of detectability alone**, and inferring that small planets are more common around M dwarfs from that catalogue would be circular. Undoing the bias requires computing, star by star, the probability that each planet would have been detected — which is why modern occurrence studies work from a carefully characterised stellar sample with per-star completeness rather than from the planet catalogue directly. The same caution applies to every apparent trend in a transit-selected sample: check first whether the selection function produces it.
```

## 3. What a transit measures, and what it cannot

**Measured directly:** the orbital period, from repeated transits — usually to extraordinary precision, since timing errors accumulate slowly over many epochs. The radius ratio $R_p/R_\star$. The scaled semi-major axis $a/R_\star$, from the duration. The inclination, from the impact parameter. And the stellar density, from the combination above.

**Not measured:** the planet's mass. A transit is a shadow; a shadow has no weight. This is the method's fundamental incompleteness, and it means that **a transit alone cannot distinguish a rocky planet from a gaseous one of the same size**, nor tell whether a Jupiter-sized object is a planet, a brown dwarf, or a low-mass star — all three have radii near $1\,R_{\rm J}$ over a range of masses spanning three orders of magnitude, because electron degeneracy makes radius nearly independent of mass in that regime.

**Not measured directly:** the planet's absolute radius. Only the ratio $R_p/R_\star$ is observed, so the planet's radius is only as good as the stellar radius, which comes from spectroscopy, evolutionary models and — since Gaia — parallax. **Gaia's parallaxes revised many Kepler stellar radii upward, and every planet radius moved with them.** This is worth internalising: exoplanet radii are inherited quantities, and a systematic error in stellar characterisation propagates directly into the planet population.

To obtain a mass, transits must be combined with radial velocities, which give $M_p\sin i$ — and because a transit fixes $i \approx 90°$, the combination yields the true mass rather than a lower limit. **That complementarity is why the two methods are usually deployed together**, and it is what makes bulk density, and therefore composition, accessible at all.

## 4. False positives

A box-shaped dip in a light curve is not by itself a planet. Several astrophysical configurations mimic one, and at Kepler's precision they were more numerous than planets among the giant candidates.

**Grazing eclipsing binaries.** Two stars in a nearly edge-on orbit that barely clip each other produce a shallow, V-shaped dip.

**Blended eclipsing binaries.** A deep eclipse of a faint background binary, diluted by the light of the bright foreground target within the same photometric aperture, produces a shallow dip on the wrong star. Kepler's pixels are four arcseconds across, so this is common.

**Hierarchical triples.** An eclipsing binary physically bound to the target star, its eclipses diluted by the target's light.

The diagnostics are a good example of extracting information from data collected for another purpose.

- **Odd–even depth differences.** In a binary of two similar stars, alternating primary and secondary eclipses have slightly different depths; a planet's transits are all identical.
- **Secondary eclipse detection.** A stellar companion produces a detectable occultation; a planet's is far shallower.
- **Centroid shift.** During the dip, the flux-weighted centre of light moves toward the true source of the variability. If it shifts off-target, the signal originates elsewhere. **This is the single most powerful test** and it uses only the pixel-level data already recorded.
- **Stellar density check.** If $\rho_\star$ derived from the transit shape disagrees with the spectroscopic value, the transit is diluted or the orbit is eccentric.
- **High-resolution imaging and spectroscopy** to detect nearby companions directly.

Where individual confirmation is impossible — most Kepler candidates are too faint for radial velocity follow-up — **statistical validation** is used: computing the probability that the signal is a planet against the summed probabilities of every false positive scenario, given the local stellar density and binary statistics. Several thousand Kepler planets are "validated" rather than "confirmed", and the distinction matters: validation is a probabilistic statement conditioned on population models, and a few validated planets have subsequently failed.

{{image: Transit (astronomy) | The geometry of a planetary transit and the resulting light curve. The depth of the dip is the ratio of the planet's area to the star's, its duration depends on the orbital period and the scaled semi-major axis, and its shape is set by how centrally the planet crosses combined with the star's limb darkening. Because only the ratio of radii is measured, the planet's absolute size is inherited from the star's, and the mass is not measured at all — a transit is a shadow, and a shadow has no weight.}}

```checkpoint
q: A transit light curve yields a stellar density that disagrees with the value from spectroscopy. What does this most likely indicate?
a: The star is rotating rapidly, which alters its density
x: Rotation flattens a star slightly but cannot produce the large discrepancies this test is designed to catch.
a*: That the transit is diluted by light from a blended third star, or that the orbit is eccentric — both of which distort the inferred $a/R_\star$
a: That the planet is much larger than assumed
x: Planet size affects depth, not the duration-based geometry from which the density is derived.
a: That the orbital period has been measured incorrectly
x: Periods from repeated transits are among the most precisely determined quantities in the field, since timing errors accumulate slowly over many epochs.
hint: The density follows from $a/R_\star$ and $P$ alone — ask what could corrupt the inferred $a/R_\star$.
why: Combining the transit duration, which gives $a/R_\star$, with the period through Kepler's third law yields $\rho_\star = (3\pi/GP^2)(a/R_\star)^3$ — a stellar property extracted from the light curve alone, with no stellar models involved. That makes it an unusually clean consistency check, because an independent spectroscopic estimate exists for comparison. Two things commonly break it. **Dilution:** if a third star's light falls in the photometric aperture, the transit appears shallower and the fitted geometry is wrong, which is the signature of a blended eclipsing binary. **Eccentricity:** an eccentric orbit is traversed at a speed different from the circular assumption at the transit point, lengthening or shortening the transit and biasing the inferred $a/R_\star$. The check is valuable precisely because it is a *by-product* — the data were collected to find planets, and the density falls out for free — and because it flags a class of false positive that no amount of additional photometry of the same kind would reveal.
---
q: Gaia's parallaxes revised many Kepler host star radii, and every planet radius moved with them. Why?
a: Because parallax measures the planet's distance from its star, which sets its radius
x: Parallax measures the distance from us to the system; it says nothing about the planet's orbital separation.
a*: Because a transit measures only the ratio $R_p/R_\star$, so the planet's absolute radius is inherited entirely from the stellar radius
a: Because Gaia measured the transit depths more accurately than Kepler did
x: Gaia is an astrometric mission and did not remeasure Kepler's transit depths.
a: Because a change in distance changes the observed transit depth
x: Depth is a ratio of fluxes and is independent of distance — that is one of the method's attractions.
hint: Write down what the transit actually measures, and ask what has to be supplied from elsewhere.
why: The transit observable is $\delta = (R_p/R_\star)^2$ — a **ratio**, containing no absolute scale. Converting it to a planet radius requires an independent stellar radius, which comes from spectroscopy and stellar evolutionary models, and those models are far better constrained once the star's luminosity is known, which requires a distance. Gaia's parallaxes supplied distances of a quality previously unavailable for the Kepler field, many stars turned out to be larger than assumed, and every planet radius scaled up with its host. The general lesson is that **exoplanet parameters are inherited quantities**: radius scales with stellar radius, mass with stellar mass, insolation with stellar luminosity, so a systematic error in stellar characterisation propagates wholesale into the planet population rather than averaging out. This is also what made the radius valley visible — the feature was blurred by stellar radius errors and emerged only once those sharpened, which is a good illustration of a real astrophysical structure being hidden by a measurement systematic rather than by insufficient data.
```

## 5. Beyond the transit itself

Once a system is known to be aligned, the geometry unlocks measurements no other configuration allows.

### 5.1 Transit timing variations

In a system with a single planet, transits are strictly periodic. With more than one planet, mutual gravitational perturbations shift the times of transit, and the pattern of shifts encodes the perturbing planet's mass and orbit.

**This measures masses photometrically**, with no spectroscopy at all, and it is most powerful near mean-motion resonances where perturbations accumulate coherently. TRAPPIST-1's seven planets, all far too faint for precise radial velocities, have masses determined almost entirely this way — and to a precision that radial velocity could not have reached for that system.

The limitation is that TTV masses require a dynamical model, and different models fitted to the same timing data have occasionally given different masses. It is a model-dependent measurement in a way that a radial velocity amplitude is not.

### 5.2 Secondary eclipse and phase curves

When the planet passes *behind* the star, its own emission is removed from the total. The depth of that **secondary eclipse** measures the planet's brightness — thermal emission in the infrared, reflected light in the optical — giving a dayside temperature and, in the optical, an albedo.

Monitoring continuously through a full orbit gives a **phase curve**: the planet's brightness as a function of viewing angle, which maps the longitudinal distribution of emission. Hot Jupiter phase curves revealed that many have their hottest point displaced eastward of the substellar point, which is the signature of a superrotating equatorial jet transporting heat before it can be radiated — **a wind measured on a planet that has never been resolved.**

```checkpoint
q: Phase curve observations show many hot Jupiters have their hottest point displaced eastward of the substellar point. What does this reveal?
a: That the planet's rotation is not synchronised with its orbit
x: These planets are expected to be tidally locked, and the offset is explained without abandoning that.
a*: That a superrotating equatorial jet transports heat downwind before it can be radiated away — a wind measured on a planet that has never been resolved
a: That the planet's orbit is eccentric, so the substellar point moves
x: Eccentricity produces a periodic variation over the orbit rather than a fixed longitudinal offset of the hot spot.
a: That the observations are contaminated by starspots on the host
x: The offset is measured from the planet's own phase-dependent emission and appears consistently across many systems.
hint: Ask what would happen to absorbed heat if the atmosphere were static, and what changes if it is not.
why: On a tidally locked planet with a static atmosphere, the hottest point would sit exactly at the substellar point, where the stellar flux is greatest. Observing it displaced eastward means heat is being **advected** before it is re-radiated: a fast eastward equatorial jet carries absorbed energy downwind, and the offset measures the competition between the advection timescale and the radiative cooling timescale. The result is remarkable for what it is — a measurement of atmospheric circulation on an object that is a single unresolved point of light, obtained by watching how the combined brightness of star and planet varies through an orbit as different faces of the planet rotate into view. Two other observables come from the same geometry. The **secondary eclipse**, when the planet passes behind the star, removes the planet's own emission from the total and so measures its dayside brightness — thermal in the infrared, reflected in the optical, giving temperature and albedo. And the day–night contrast in the phase curve measures how efficiently the atmosphere redistributes heat, which varies systematically with irradiation across the hot Jupiter population.
```

### 5.3 The Rossiter–McLaughlin effect

As a planet crosses a rotating star, it successively blocks the approaching limb and then the receding one, distorting the observed line profiles and producing an anomalous radial velocity signal during transit. The shape of that signal reveals the **angle between the planet's orbital plane and the star's spin axis.**

The result was a genuine surprise: a substantial fraction of hot Jupiters are misaligned, some polar, some retrograde. **In-situ formation from a disc cannot produce that**, since the disc shares the star's rotation. It is among the strongest evidence that hot Jupiters arrive by dynamical processes — planet–planet scattering, or Kozai–Lidov cycles driven by a distant companion — rather than by smooth migration through the disc.

```checkpoint
q: Why can a transit alone not distinguish a Jupiter-mass planet from a brown dwarf or a low-mass star?
a: Because the transit depth is too shallow to measure precisely for such objects
x: A Jupiter-sized object across a Sun-like star gives a $1\%$ depth, one of the easiest signals in the field to measure.
a*: Because a transit measures radius, and degenerate objects from about a Jupiter mass up to the hydrogen-burning limit all have radii near $1\,R_{\rm J}$
a: Because brown dwarfs are self-luminous, and their light fills in the transit
x: A brown dwarf's contribution to the combined light is far too small to affect the transit depth measurably.
a: Because the orbital period would be the same in all three cases
x: Period is measured precisely and depends on the total mass, but it is not what distinguishes the companion types here.
hint: Ask what supports an object against gravity once it is dense enough, and how that support scales with mass.
why: A transit measures $R_p/R_\star$ and nothing about mass — a shadow has no weight. In the regime from roughly a Jupiter mass to the hydrogen-burning limit near $80\,M_{\rm J}$, objects are supported largely by **electron degeneracy pressure**, which makes radius nearly independent of mass: adding mass compresses the object almost as fast as it adds material, so radius stays near $1\,R_{\rm J}$ across three orders of magnitude in mass. A $1\%$ transit depth around a Sun-like star is therefore consistent with a gas giant, a brown dwarf, or a very low-mass star. Resolving the ambiguity requires a mass, which means radial velocity follow-up — and here the transit contributes something essential in return: because it fixes $i\approx90°$, the $M_p\sin i$ that radial velocity yields becomes a true mass rather than a lower limit. That complementarity is why the two methods are almost always deployed together, and it is what makes bulk density and therefore composition accessible.
---
q: The Rossiter–McLaughlin effect showed that many hot Jupiters have orbits misaligned with their star's spin axis, some retrograde. Why was this significant?
a: It showed that these systems are not gravitationally bound in the usual way
x: They are ordinary bound orbits; only their orientation relative to the stellar spin is unusual.
a*: Because a planet forming in and migrating through a protoplanetary disc should inherit the disc's alignment with the stellar spin, so misalignment points to a dynamical origin instead
a: It showed that the host stars must have been spun up by the planets themselves
x: Tidal interaction can alter stellar spin rate, but it does not produce a retrograde or polar *orientation*.
a: It demonstrated that the transit method systematically misestimates orbital inclination
x: The effect measures a different angle — the sky-projected spin–orbit angle — and does not indicate any error in the transit inclination.
hint: Ask what orientation a planet would have if it formed in a disc and migrated inward within it.
why: A protoplanetary disc forms from the collapse of rotating material and shares the star's angular momentum direction, so a planet that formed in the disc and spiralled inward through it should orbit in the star's equatorial plane. The Rossiter–McLaughlin effect tests this directly: as the planet transits, it occults first the approaching stellar limb and then the receding one, distorting the line profiles and producing an anomalous radial velocity whose shape reveals the sky-projected angle between the orbit and the stellar spin. Finding a substantial fraction of hot Jupiters misaligned — some polar, some retrograde — **rules out smooth disc migration as the sole delivery mechanism** and points to dynamical processes: planet–planet scattering, or Kozai–Lidov oscillations driven by a distant companion, either of which can tilt an orbit arbitrarily before tidal friction circularises it close to the star. Note what makes this measurement possible: it is available only because the system transits, so the alignment that makes a planet detectable also unlocks an angle no other configuration reveals.
```

{{image: Kepler space telescope | The observatory that converted exoplanets from a set of individual discoveries into a population with statistics, by staring at roughly a hundred and fifty thousand stars continuously for four years and measuring their brightness to a few tens of parts per million. Its design followed from its purpose: measuring an occurrence rate requires many stars watched without interruption, and does not require that individual planets be bright enough for follow-up study. The successor mission inverted that trade, surveying the whole sky more briefly to supply nearby bright hosts whose planets can actually be characterised.}}

## 6. What the method found

### 6.1 The scale of the harvest

Kepler stared at $\sim150{,}000$ stars for four years and produced over $2{,}700$ confirmed planets, transforming exoplanets from a collection of individual discoveries into a population with statistics. TESS followed with an all-sky survey emphasising brighter, nearer stars — trading Kepler's depth for targets amenable to follow-up characterisation.

The strategic difference is worth noting. **Kepler was built to measure an occurrence rate**, so it needed many stars observed continuously and did not much care whether individual planets could be studied further. **TESS was built to supply targets**, so it needed bright hosts and accepted a shorter baseline per field. Both designs were correct for their purposes, and confusing the two leads to misplaced criticism of each.

### 6.2 The radius valley

The most important discovery made by transits alone is a gap.

Plotting the occurrence of small planets against radius reveals a **deficit between about $1.5$ and $2.0\,R_\oplus$** — the radius valley, or Fulton gap, which became visible only once Gaia parallaxes sharpened stellar radii enough to resolve it. Planets pile up on either side: super-Earths below, sub-Neptunes above, with a real trough between.

The natural reading is that it separates two populations — bare rocky cores, and rocky cores retaining a hydrogen–helium envelope of a few per cent by mass, which inflates the radius substantially while adding little mass. The gap is then the region where an envelope is unstable.

**Two mechanisms compete**, and distinguishing them is an active question. *Photoevaporation:* stellar X-ray and extreme ultraviolet radiation, most intense in the first hundred million years, strips envelopes from close-in planets, with the surviving envelope determined by the planet's gravity and its irradiation history. *Core-powered mass loss:* the cooling luminosity of the planet's own hot core drives the envelope off from below, requiring no external irradiation. The two make similar predictions for the gap's location but differ in how it should depend on stellar age and on host mass, and the data are gradually discriminating.

**The valley is a compositional boundary written in a single observable**, and it exists because a small change in envelope mass produces a large change in radius — which is exactly what makes radius, on its own, a coarse proxy for composition.

### 6.3 What the population looks like

Two further results from transit demographics deserve statement, because they are the empirical backdrop for the rest of this block.

**Compact multi-planet systems are common and unlike the Solar System.** A large fraction of Sun-like stars host several planets between one and four Earth radii inside the orbit of Mercury, often in nearly coplanar, nearly circular orbits with period ratios clustering just outside first-order resonances. Nothing in our own system occupies that region, so the most common architecture known is one we have no local example of — and our system's emptiness inside $0.4$ AU is itself a fact requiring explanation.

**Planets within a system are more similar to each other than random draws from the population.** Sizes and spacings within a multi-planet system correlate, a regularity sometimes called "peas in a pod". This suggests that the outcome of planet formation is set substantially by conditions in the disc rather than by stochastic assembly, and it is a constraint that population synthesis models have found difficult to reproduce.

Both results are available only because transits deliver *systems* rather than isolated detections: once a system is aligned, every planet in the coplanar set transits, so multiplicity is measured rather than inferred. That is a structural advantage the radial velocity method does not share, and it is why architecture — the subject of a later chapter — became accessible when it did.

```checkpoint
q: Transit surveys find that a large fraction of Sun-like stars host several planets of one to four Earth radii inside Mercury's orbit. What makes this result particularly striking?
a: That such planets should be impossible to form so close to a star
x: In-situ formation and migration are both viable routes, and the formation question is separate from what makes the demographic result notable.
a*: That the most common planetary architecture known has no analogue in the Solar System, whose inner region is empty by comparison
a: That it contradicts the transit method's bias toward short-period planets
x: The bias toward short periods is exactly what makes this population accessible; it does not contradict the finding.
a: That these systems must be unstable and therefore short-lived
x: They are observed to be dynamically packed but stable, often in near-resonant configurations that survive over long timescales.
hint: Compare the region inside $0.4$ AU in these systems with the same region in our own.
why: The commonest architecture in the known census is several planets between one and four Earth radii packed inside $0.4$ AU, typically coplanar, nearly circular, with period ratios clustering just outside first-order resonances. **The Solar System has nothing there at all**, so our own system's inner emptiness becomes a fact requiring explanation rather than a template. This matters for how results are read: the transit sample is biased toward short periods, so it is not evidence that such systems are more common than wider ones in absolute terms — but within its accessible range the population is real and abundant, and it is not what a Solar-System-based expectation would have predicted. A second regularity compounds it: planets within a given system resemble each other in size and spacing more than random draws from the overall population would, suggesting the disc's conditions rather than stochastic assembly dominate the outcome. Both results are available only because an aligned system reveals *every* coplanar planet at once, so multiplicity is measured rather than inferred — a structural advantage radial velocity surveys lack.
```

## 7. Where the method is weak

**Long periods are nearly inaccessible.** Probability falls as $a^{-1}$ and the requirement for repeated transits imposes $P \lesssim T_{\rm obs}/3$. Jupiter analogues are essentially invisible to transit surveys, so the census is a census of the inner few tenths of an AU.

**Radius without mass is ambiguous**, and the ambiguity is worst exactly where it matters — around $2\,R_\oplus$, where a planet may be a large rock or a small gas envelope.

**Stellar variability limits precision.** Spots, granulation and flares produce photometric noise correlated on transit timescales. For active M dwarfs, the star is often the dominant noise source, and disentangling stellar signals from planetary ones is a subject in itself.

**Everything is inherited from the star.** Planet radius scales with stellar radius, planet mass with stellar mass, insolation with stellar luminosity. **Systematic errors in stellar characterisation propagate wholesale into the planet population**, as the Gaia radius revisions demonstrated.

```checkpoint
q: Which of these is the strongest reason transit surveys cannot find Jupiter analogues?
a: The transit depth of a Jupiter is too shallow to detect
x: A Jupiter across a Sun-like star gives a $1\%$ depth — the easiest planetary signal there is.
a*: The combination of a geometric probability of $0.089\%$ at $5.2$ AU and the requirement for repeated transits within the survey baseline
a: Jupiter analogues are rare, so few exist to be found
x: Giant planets at several AU appear to be reasonably common from radial velocity surveys, which is how their scarcity in transit catalogues is known to be a selection effect.
a: Their long transit durations exceed the observing window
x: Duration grows only as $P R_\star/\pi a$, giving about $30$ hours for a Jupiter analogue — long but entirely observable.
hint: Two independent factors suppress long-period detections; identify both.
why: Two effects compound. **Geometry:** $P_{\rm tr} = R_\star/a = 0.089\%$ at $5.2$ AU, eleven times worse than for an Earth analogue and a hundred times worse than for a hot Jupiter. **Baseline:** a secure detection normally requires at least three transits, so the accessible period range is roughly $P < T_{\rm obs}/3$ — about sixteen months for Kepler's four-year mission, and far less for a survey that revisits each field briefly. A twelve-year period is simply outside that window regardless of how deep the signal is. The consequence shapes the whole field: **the transit census is a census of the inner few tenths of an AU**, and statements about "typical planetary systems" derived from it describe a region of parameter space that in our own system contains nothing at all. Radial velocity, whose sensitivity falls only as $P^{-1/3}$ and which requires no alignment, is the method that reaches those orbits, and direct imaging reaches further still — which is why the methods are complementary rather than competing.
---
q: Occurrence-rate studies use injection-and-recovery testing: synthetic transits are inserted into real light curves and the detection pipeline is run blind. Why is this essential rather than merely good practice?
a: Because it verifies that the pipeline software is free of bugs
x: It does catch some bugs, but its purpose is quantitative rather than diagnostic.
a*: Because the occurrence rate depends on the detection completeness of each star, which changes steeply near the threshold and cannot be predicted analytically from noise properties alone
a: Because it allows the survey to claim more detections than it actually made
x: Injected signals are synthetic and are never counted as detections; they measure the recovery rate only.
a: Because real transits are too rare to test the pipeline on
x: Thousands of real transits exist, but recovering known signals says nothing about the ones that were missed.
hint: The occurrence rate divides by the probability of detection — ask how that probability is obtained.
why: The occurrence rate is $f = (1/N_\star)\sum_i 1/(P_{{\rm tr},i}C_i)$, where $C_i$ is the probability that a transiting planet of that size and period around that particular star would have been recovered. The geometric factor $P_{\rm tr}$ is exact analytic geometry, but $C_i$ is not: it depends on the star's noise spectrum, on correlated systematics, on how the detrending algorithm treats stellar variability, and on the detection threshold — and near that threshold it falls from near one to near zero across a narrow range, which is exactly where Earth analogues sit with three or four transits in a four-year mission. **No analytic model of that transition is trustworthy**, because the pipeline's behaviour on real correlated noise is not derivable from the noise's summary statistics. Injecting synthetic signals of known properties into the actual light curves and running the real pipeline blind measures $C_i$ empirically, star by star. Since each detection is then weighted by $1/(P_{\rm tr}C)$ — factors of hundreds — an error in $C$ propagates directly into the answer, which is why $\eta_\oplus$ estimates differ by an order of magnitude between studies that treat completeness differently while using the same detections.
```

## 8. Pulling the thread

- **Geometry is the method's defining constraint.** $P_{\rm tr} = R_\star/a$ gives $0.47\%$ for an Earth–Sun analogue, so the technique is permanently blind to $99.5\%$ of such systems — and no instrument improves it.
- **Occurrence rates are corrections, not counts.** Each detected Earth analogue stands for $\sim215$ unseen ones before completeness, which is why $\eta_\oplus$ estimates span an order of magnitude from largely the same data.
- **Depth scales as $R_\star^{-2}$**, so the small-planet catalogue is dominated by M dwarf hosts as a selection effect that must be undone before any general claim.
- **A transit gives radius, never mass.** Degeneracy pressure makes gas giants, brown dwarfs and low-mass stars all $\sim1\,R_{\rm J}$, so companion type cannot be settled photometrically.
- **Nothing is absolute.** $R_p/R_\star$ and $\rho_\star$ are ratios; the planet's radius is inherited from the star's, and Gaia's parallaxes moved the whole population.
- **False positives are astrophysical, not instrumental**, and the centroid shift — using pixel data already recorded — is the most powerful discriminant.
- **Alignment unlocks more than the transit.** TTVs give masses without spectroscopy, secondary eclipses give temperatures and albedos, phase curves reveal winds, and Rossiter–McLaughlin gives spin–orbit angles that rule out disc migration as the sole origin of hot Jupiters.
- **The radius valley at $1.5$–$2.0\,R_\oplus$** is the method's most important discovery and became visible only when stellar radii improved.

The transferable idea: **when a method's selection function is strong and calculable, the selection function becomes the science.** The transit method detects a biased sample, but the bias is known exactly — $R_\star/a$ is geometry, not guesswork — which means the true population can be recovered by weighting. That is a far better position than a method with a weak but poorly understood bias, and it is why transits, despite seeing under half a per cent of Earth analogues, produced the field's first real demographics. **A large known bias beats a small unknown one**, and this is worth remembering wherever a sample is non-random: the question to ask is not "how biased is this sample?" but "do I know the bias well enough to invert it?"

## 9. Further reading

{{book: Sara Seager | Exoplanet Atmospheres | 2010}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Carole Haswell | Transiting Exoplanets | 2010}}

Beyond the books: Perryman is the standard reference and is unusually careful about selection effects, which is the theme of this chapter. Winn's review chapter on transits and occultations in *Exoplanets* (ed. Seager) is the clearest derivation of the transit geometry and remains the best short technical treatment. On occurrence rates, the disagreement between published $\eta_\oplus$ values is best understood by reading two studies with different completeness treatments side by side rather than by accepting either.

## Problems

*Useful numbers: $R_\odot = 6.957\times10^8$ m, $R_\oplus = 6.371\times10^6$ m, $R_{\rm J} = 6.991\times10^7$ m, $1\ \mathrm{AU} = 1.496\times10^{11}$ m; depth $= (R_p/R_\star)^2$; $P_{\rm tr} = R_\star/a$; $T = (P/\pi)\arcsin(R_\star/a)$; $\rho_\star = (3\pi/GP^2)(a/R_\star)^3$; Jupiter/Sun depth $10{,}098$ ppm, Earth/Sun $84$ ppm, Earth/$0.2R_\odot$ $2{,}097$ ppm; Earth–Sun $P_{\rm tr} = 0.465\%$, transit duration $13.0$ hr.*

**1.** *(The signal.)* **(a)** Compute the transit depth in ppm for an Earth-sized planet crossing a $0.3\,R_\odot$ star. **(b)** Compare with the Earth–Sun value and state the scaling. **(c)** State what this implies for which host stars dominate the small-planet catalogue and what must be done about it.

**2.** *(Geometry.)* **(a)** Derive $P_{\rm tr} = R_\star/a$ from the condition $|\cos i| < R_\star/a$ for randomly oriented orbits. **(b)** Compute it for a planet at $0.1$ AU and at $2$ AU around a Sun-like star. **(c)** State why no instrumental improvement changes this.

**3.** *(The correction.)* A survey of $150{,}000$ stars detects $8$ Earth analogues. **(a)** Compute the naive occurrence rate. **(b)** Correct for geometric probability alone. **(c)** State why the corrected value still carries an order-of-magnitude uncertainty.

**4.** *(Duration.)* **(a)** Compute the central transit duration for a planet with $P = 10$ days around a Sun-like star, given $a = 0.093$ AU. **(b)** Explain how duration plus period constrains stellar density. **(c)** State what a disagreement with the spectroscopic stellar density indicates.

**5.** *(Degeneracy.)* **(a)** State why a $1\%$ transit depth around a Sun-like star does not identify the companion. **(b)** Give the physical reason radius is nearly mass-independent in that regime. **(c)** State what additional measurement resolves it and what the transit contributes to that measurement.

**6.** *(False positives.)* **(a)** Name three astrophysical configurations that mimic a transit. **(b)** Describe the centroid test and why it is powerful. **(c)** State the difference between a validated and a confirmed planet.

**7.** *(Timing variations.)* **(a)** Explain why transits are strictly periodic for a single planet but not for several. **(b)** State what TTVs measure and why they were decisive for TRAPPIST-1. **(c)** State the principal limitation of TTV masses relative to radial velocity masses.

**8.** *(Spin–orbit angles.)* **(a)** Describe the Rossiter–McLaughlin effect physically. **(b)** State what alignment disc migration predicts. **(c)** State what the observed misalignments imply about hot Jupiter origins.

**9.** *(The valley.)* **(a)** State where the radius valley lies and what it separates. **(b)** Explain why a small envelope mass produces a large radius change. **(c)** Name the two competing mechanisms and state how they might be distinguished.

## Worked answers

**1.** **(a)** $R_p/R_\star = 6.371\times10^6/(0.3\times6.957\times10^8) = 0.0305$; depth $= 9.3\times10^{-4} = 932$ ppm. **(b)** The Earth–Sun value is $84$ ppm, so this is $11.1$ times deeper — matching $(1/0.3)^2 = 11.1$, since depth $\propto R_\star^{-2}$. **(c)** Small planets are far easier to detect around small stars, so the catalogue is dominated by M dwarf hosts for reasons of detectability alone. Any claim that small planets are *more common* around M dwarfs requires undoing this, by computing per-star detection completeness across a carefully characterised stellar sample rather than working from the planet catalogue.

**2.** **(a)** A transit requires the planet's projected separation at conjunction to be less than $R_\star$, i.e. $a|\cos i| < R_\star$. For randomly oriented orbital planes $\cos i$ is uniformly distributed on $[-1,1]$, so the fraction satisfying the condition is $2(R_\star/a)/2 = R_\star/a$. **(b)** At $0.1$ AU: $6.957\times10^8/1.496\times10^{10} = 4.65\%$. At $2$ AU: $0.233\%$. **(c)** Because in the excluded orientations the planet never crosses the stellar disc at all — there is no signal of any amplitude to detect, so sensitivity is irrelevant.

**3.** **(a)** $8/150{,}000 = 5.3\times10^{-5}$. **(b)** Dividing by $P_{\rm tr} = 0.00465$: $f = 5.3\times10^{-5}/0.00465 = 1.1\%$. **(c)** Because detection completeness has not been applied, and near the threshold — which is exactly where Earth analogues sit, with three or four transits in a four-year mission — the recovery probability changes steeply and is hard to characterise. A small change in the assumed completeness moves the answer by a large factor, which is why published $\eta_\oplus$ values span from a few per cent to over fifty using largely the same detections.

**4.** **(a)** $a/R_\star = 0.093\times1.496\times10^{11}/6.957\times10^8 = 20.0$; $T = (10\ \text{d}/\pi)\arcsin(1/20) = (10/\pi)(0.0500) = 0.159$ d $= 3.8$ hr. **(b)** Kepler's third law relates $P$ and $a$ through the stellar mass, and the duration gives $a/R_\star$; eliminating $a$ yields $\rho_\star = (3\pi/GP^2)(a/R_\star)^3$, which depends only on observables. **(c)** That something is wrong with the assumed configuration — most often that the transit is diluted by a blended third light, making the inferred $a/R_\star$ too small, or that the orbit is eccentric, which alters the transit speed and hence the duration.

**5.** **(a)** A $1\%$ depth gives $R_p \approx 1\,R_{\rm J}$, and gas giants, brown dwarfs and the lowest-mass stars all have radii near that value. **(b)** In that regime the object is supported largely by electron degeneracy pressure, and adding mass compresses it almost as fast as it adds material, so radius is nearly independent of mass across three orders of magnitude. **(c)** A radial velocity measurement, which gives $M_p\sin i$. The transit contributes the inclination: because a transiting system has $i\approx90°$, $\sin i \approx 1$ and the radial velocity yields a true mass rather than a lower limit.

**6.** **(a)** Grazing eclipsing binaries; blended background eclipsing binaries diluted by the target's light; hierarchical triples in which a bound eclipsing binary is diluted by the target. **(b)** During the dip, the flux-weighted centre of light shifts toward the true source of the variability; if it moves off the target star, the signal originates elsewhere in the aperture. It is powerful because it uses pixel-level data already recorded, requires no additional observations, and directly localises the variability rather than inferring it. **(c)** A confirmed planet has an independent mass measurement, typically from radial velocity. A validated planet has been assigned a high probability of being planetary by comparing the likelihood of a planet against the summed likelihoods of every false positive scenario given local stellar and binary statistics — a probabilistic statement conditioned on population models, and a few have subsequently failed.

**7.** **(a)** A single planet on a fixed Keplerian orbit transits at strictly regular intervals; additional planets exert mutual perturbations that shift the times of transit, most strongly near mean-motion resonances where the perturbations accumulate coherently rather than averaging out. **(b)** They measure the perturbing planets' masses and orbits photometrically, with no spectroscopy. For TRAPPIST-1 the star is far too faint for precise radial velocities, and TTVs delivered masses to a precision radial velocity could not have reached for that system. **(c)** TTV masses require fitting a dynamical model, and different models fitted to the same timing data have occasionally yielded different masses — so it is a model-dependent measurement in a way a radial velocity amplitude is not.

**8.** **(a)** As the planet transits a rotating star it occults first the approaching limb and then the receding one, removing light from one side of the rotationally broadened line profile at a time and producing an anomalous apparent radial velocity whose shape depends on the transit chord's orientation relative to the stellar equator. **(b)** Alignment: a disc forms from rotating collapsing material and shares the star's angular momentum, so a planet migrating within it stays in the equatorial plane. **(c)** That hot Jupiters are not all delivered by disc migration — a substantial fraction must arrive dynamically, by planet–planet scattering or Kozai–Lidov cycles driven by a distant companion, with tidal friction subsequently circularising the orbit close to the star.

**9.** **(a)** Between about $1.5$ and $2.0\,R_\oplus$, separating bare rocky super-Earths below from sub-Neptunes retaining a hydrogen–helium envelope above. **(b)** Because hydrogen and helium are of very low density, an envelope of a few per cent by mass occupies a large fraction of the planet's volume — adding little mass while substantially inflating the radius — so the boundary between having and lacking an envelope appears as a jump in radius. **(c)** Photoevaporation, in which stellar X-ray and extreme ultraviolet radiation strips the envelope from outside during the first hundred million years; and core-powered mass loss, in which the planet's own cooling core drives the envelope off from below with no external irradiation required. They predict a similar gap location but differ in how it should depend on stellar age and host mass, which is how the data are gradually discriminating between them.$exTransit_master$,
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
