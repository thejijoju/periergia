-- Astronomy & Space · Exoplanets — Finding Worlds — "Radial Velocity".
-- Curated master for
-- astronomy-and-space/exoplanets/finding-worlds/radial-velocity
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Organised around the wall the method has run into, which is not
-- instrumental: the Earth's signal on the Sun is 0.089 m/s, while the
-- Sun's own surface produces radial velocity variations of 1-10 m/s
-- from granulation, supergranulation, spots and the magnetic cycle. The
-- star is the noise source, spectrographs already exceed the precision
-- required, and several claimed planets have been retracted as stellar
-- activity. Then the physics: the K formula and what it does and does
-- not contain, why M sin i is a permanent lower limit and how a transit
-- removes it, the orbital elements recoverable from a velocity curve,
-- the eccentricity distribution as a real result rather than an
-- artefact, and the sensitivity scaling P^-1/3 that makes this the
-- method for long periods.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting from
-- K = (2 pi G/P)^(1/3) Mp sin i /(Ms+Mp)^(2/3) /sqrt(1-e^2):
-- Jupiter on the Sun 12.46 m/s, Earth on the Sun 0.089 m/s,
-- 51 Peg b (0.47 Mj, 4.23 d) 59.0 m/s, Proxima b (1.07 Me, 11.19 d,
-- 0.122 Msun) 1.24 m/s.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/finding-worlds/radial-velocity',
    'research',
    'advanced',
    'read',
    $exRV_master$> The Earth pulls the Sun around the common centre of mass at **$8.9$ centimetres per second** — walking pace for a snail. Detecting an Earth analogue by the Doppler method means measuring the velocity of a star $10$ parsecs away to that precision, repeatedly, over years.

Modern spectrographs can do it. **The Sun cannot cooperate.** Its surface is a boiling convective layer whose granules rise and fall at kilometres per second, whose spots rotate across the disc, and whose magnetic activity waxes and wanes over eleven years. The velocity signals these produce are between $1$ and $10$ m s$^{-1}$ — **ten to a hundred times the planet's signal.**

This is the defining fact about the radial velocity method today. The limitation is no longer the instrument; it is the star. Several published planets have been withdrawn as stellar activity in disguise, and the field's central technical problem is separating a Doppler shift caused by orbital motion from one caused by the star's own surface changing shape.

The method nevertheless remains indispensable, for a reason worth stating at the outset: **it is the only technique that measures mass**, and it requires no fortunate alignment.

## 1. The measurement

A star and planet orbit their common centre of mass. The star's orbital motion is small but periodic, and its line-of-sight component Doppler-shifts every spectral line by

$$\frac{\Delta\lambda}{\lambda} = \frac{v_r}{c}.$$

For $v_r = 10$ m s$^{-1}$, that is a shift of $3\times10^{-8}$ — about a thousandth of a pixel on a typical detector. The measurement is possible only because a spectrum contains thousands of lines that can be cross-correlated together, so the effective precision is far better than any single line permits.

The velocity semi-amplitude is

$$K = \left(\frac{2\pi G}{P}\right)^{1/3}\frac{M_p\sin i}{(M_\star+M_p)^{2/3}}\frac{1}{\sqrt{1-e^2}}.$$

Evaluated for cases worth memorising:

| System | $K$ |
|---|---|
| 51 Peg b ($0.47\,M_{\rm J}$, $4.23$ d) | $59.0$ m s$^{-1}$ |
| Jupiter on the Sun ($11.86$ yr) | $12.46$ m s$^{-1}$ |
| Proxima b ($1.07\,M_\oplus$, $11.19$ d, $0.122\,M_\odot$) | $1.24$ m s$^{-1}$ |
| Earth on the Sun ($1$ yr) | $0.089$ m s$^{-1}$ |

Three scalings are contained in that formula and each matters.

**$K \propto M_p$.** Massive planets are easy; this is why the first discoveries were giants.

**$K \propto P^{-1/3}$.** Sensitivity falls only as the cube root of period — a very weak dependence. Doubling the period costs only $21\%$ in signal. **This is the method's great structural advantage over transits**, whose probability falls as $a^{-1}$: radial velocity reaches long-period planets, and it is how Jupiter analogues are found.

**$K \propto M_\star^{-2/3}$.** Low-mass hosts amplify the signal, which combines with the fact that habitable-zone orbits around M dwarfs are short to make small planets around small stars the most accessible targets. Proxima b's $1.24$ m s$^{-1}$ is fourteen times the Earth–Sun value for a planet of essentially Earth's mass.

## 2. $M\sin i$: the permanent ambiguity

The formula contains $M_p\sin i$, not $M_p$. A Doppler measurement senses only the line-of-sight component of the star's motion, so an orbit seen nearly face-on produces almost no signal regardless of the planet's mass.

**Radial velocity alone therefore yields a lower limit on mass, permanently.** No improvement in precision changes this — it is a projection, not a noise problem.

The statistical position is better than it first appears. For randomly oriented orbits, $\sin i$ has a mean of $\pi/4 \approx 0.785$, and the distribution is concentrated: the probability that $\sin i < 0.5$ — that the true mass exceeds twice the minimum — is only $13\%$. So for population studies, minimum masses are a modest and calculable underestimate.

For any *individual* system it is a genuine ambiguity, and it has consequences. A claimed planet at the deuterium-burning boundary may be a brown dwarf seen at low inclination. Several objects initially reported as massive planets were later shown by astrometry to be low-mass stars in nearly face-on orbits.

**Two things break the degeneracy.** A transit fixes $i \approx 90°$, so $\sin i \approx 1$ and the minimum mass becomes the true mass — this is the single most important reason the two methods are used together, and it is what makes bulk density measurable. Astrometry measures the orbit's angular size on the sky and so determines $i$ independently, which is why Gaia's astrometric orbits are valuable even for systems already known.

## 3. What a velocity curve contains

Fitting a Keplerian to a time series of velocities recovers five orbital parameters and one derived quantity.

- **Period $P$**, usually to high precision from many cycles.
- **Semi-amplitude $K$**, which with $P$ and the stellar mass gives $M_p\sin i$.
- **Eccentricity $e$**, from the curve's departure from a sinusoid.
- **Argument of periastron $\omega$**, the orbit's orientation within its plane.
- **Time of periastron $T_0$**.
- **Systemic velocity $\gamma$**, the whole system's motion, plus any long-term drift indicating a further distant companion.

Not recoverable: the inclination, the longitude of the ascending node, and hence the orbit's orientation on the sky. **A radial velocity orbit is three-dimensionally incomplete by construction.**

### 3.1 Eccentricity, which turned out to be real

Solar System planets have nearly circular orbits — Earth's $e$ is $0.017$ — and this was long treated as the expected outcome of formation in a dissipative disc. Radial velocity surveys found something else: **giant exoplanets have a broad eccentricity distribution extending past $e = 0.9$**, with a median well above any Solar System value.

The first response was to suspect the method. An eccentric single planet and two circular planets in a $2{:}1$ period ratio produce similar velocity curves, so some eccentricities might be misfitted multiples, and a few were. But the effect survived scrutiny: it is present in well-sampled systems, and it is confirmed in transiting systems where the transit duration independently constrains eccentricity.

**The consequence is theoretical.** Circular orbits are what disc formation naturally produces, so a broad eccentricity distribution requires something to excite it after the gas disperses — planet–planet scattering being the leading candidate, in which multiple giants interact gravitationally, one is ejected or driven inward, and the survivors are left eccentric. That mechanism also produces the misaligned hot Jupiters seen through the Rossiter–McLaughlin effect, so two independent observations point at the same process.

```checkpoint
q: Radial velocity measures $M_p\sin i$. How serious a limitation is this?
a: Fatal for individual systems and for population studies alike, since masses are unknown
x: For populations it is mild and calculable: $\sin i$ averages $\pi/4$, and the true mass exceeds twice the minimum in only $13\%$ of randomly oriented cases.
a*: Mild and calculable for populations, but a genuine ambiguity for individual systems — resolved only by a transit or by astrometry
a: Not a limitation at all, since $\sin i$ can be inferred from the shape of the velocity curve
x: The curve's shape gives eccentricity and orientation within the orbital plane, but carries no information about the inclination to the line of sight.
a: It can be removed by observing at multiple epochs across the orbit
x: The projection factor is constant for a given orbit; sampling it more densely does not recover the missing angle.
hint: Ask whether the limitation is a noise problem or a geometric projection, and what independent measurement supplies the missing angle.
why: A Doppler shift senses only the line-of-sight component of motion, so an orbit seen face-on produces no signal whatever the planet's mass. This is a **projection**, not a precision limit, so no instrumental improvement removes it. Statistically the damage is modest: for randomly oriented orbits $\langle\sin i\rangle = \pi/4 \approx 0.785$ and the probability that $\sin i < 0.5$ is only $13\%$, so minimum masses underestimate true masses by a calculable and usually small factor in population work. For an individual object it matters a great deal — several bodies reported as massive planets proved to be low-mass stars in nearly face-on orbits, and any object near the deuterium-burning boundary is ambiguous. Two measurements break it. A **transit** fixes $i\approx90°$ so that $\sin i \approx 1$, which is why the two methods together yield a true mass and hence a bulk density; and **astrometry** measures the orbit's angular size and shape on the sky, determining $i$ directly, which is why astrometric orbits are valuable even for systems already characterised spectroscopically.
---
q: Radial velocity sensitivity scales as $K \propto P^{-1/3}$, whereas transit probability scales as $a^{-1}$. What follows?
a: Radial velocity is more sensitive than transits at all periods
x: At short periods transits often win, and they reach far smaller planets around bright stars; the advantage is specifically at long periods.
a*: Radial velocity degrades only slowly with period and needs no alignment, so it is the method that reaches Jupiter analogues and wide orbits
a: Transit surveys can be extended to long periods by observing for longer
x: A longer baseline helps with the sampling requirement but does nothing about the geometric probability, which falls as $a^{-1}$ regardless.
a: The two methods have the same period sensitivity once selection effects are removed
x: Their scalings differ fundamentally — a cube root against a reciprocal — so no correction makes them equivalent.
hint: Compare how much each method loses when the orbital period is increased by a factor of ten.
why: Increasing the period tenfold costs radial velocity a factor of $10^{1/3} = 2.15$ in signal amplitude — noticeable but survivable. The same change costs a transit survey a factor of $10^{2/3} = 4.6$ in geometric probability, *and* removes the possibility of observing repeated transits within a fixed mission baseline, since a secure detection normally needs at least three. Radial velocity also requires no alignment at all: every system is observable, subject only to the $\sin i$ projection, which reduces the signal but never eliminates it. The practical consequence is a division of labour. Transits dominate the census of close-in small planets and supply radii; radial velocity supplies masses, reaches the giant planets at several AU that transits cannot see, and is how the Solar System's own architecture would be detected from outside. Neither is a general-purpose survey, and any claim about "typical" planetary systems that draws on only one of them is describing that method's accessible region rather than the underlying population.
```

## 4. How the precision is achieved

The engineering is worth understanding because it explains why progress stalled where it did.

**The problem.** A spectrograph's wavelength scale drifts with temperature, pressure and mechanical flexure. A shift of $1$ m s$^{-1}$ corresponds to a fractional wavelength change of $3\times10^{-9}$; a millikelvin temperature change moves a conventional spectrograph by far more.

**Iodine cell.** Pass the starlight through a cell of iodine vapour, superimposing thousands of sharp absorption lines on the stellar spectrum. Those lines share every instrumental distortion, so fitting them recovers the wavelength scale and the instrumental profile simultaneously. This delivered $3$ m s$^{-1}$ and produced many early discoveries. Its costs: the iodine lines absorb light and restrict the usable wavelength range.

**Stabilised spectrographs with simultaneous reference.** Place the spectrograph in vacuum, control its temperature to millikelvins, feed light through a scrambling fibre so that guiding errors do not shift the illumination, and record a reference spectrum — thorium–argon, or a laser frequency comb — simultaneously on the same detector. HARPS reached $\sim1$ m s$^{-1}$ this way; ESPRESSO has demonstrated $\sim0.25$ m s$^{-1}$.

**A laser frequency comb** provides a dense grid of lines whose frequencies are known to atomic-clock accuracy, removing the calibration source as an error term entirely.

**The instruments are now good enough.** At $0.25$ m s$^{-1}$, an Earth analogue's $0.089$ m s$^{-1}$ is within reach of a sufficiently long campaign, since the signal is periodic and averaging beats down white noise. The obstacle is that the remaining noise is **not white and not instrumental.**

{{image: Doppler spectroscopy | The measurement principle: a star orbiting the common centre of mass with an unseen companion shifts its spectral lines periodically, blueward as it approaches and redward as it recedes. The amplitude gives the companion's mass multiplied by the sine of the orbital inclination, and the shape of the velocity curve gives the eccentricity and the orientation of the orbit within its plane. The inclination itself is not recoverable, so the mass is a lower limit until a transit or an astrometric orbit supplies the missing angle.}}

## 5. The wall: stellar activity

The star's surface is not a rigid reflector. Several processes shift its lines by amounts comparable to or larger than planetary signals, and they are the reason the method has not simply continued improving.

**Granulation.** Convective cells rise, radiate and sink. Rising material is hotter and brighter than sinking material, so the disc-integrated spectrum is weighted toward upflows and shows a net **convective blueshift** of several hundred m s$^{-1}$. Fluctuations in that blueshift contribute $\sim0.3$–$1$ m s$^{-1}$ on timescales of minutes, and **supergranulation** adds a comparable amount on timescales of a day — which is much harder to average away.

**Spots and plage.** A dark spot on the approaching limb removes blueshifted light, mimicking a redshift; as the star rotates the spot crosses to the receding limb and the sign reverses. The result is a velocity signal at the **stellar rotation period** and its harmonics. For an active star this reaches tens of m s$^{-1}$; for the quiet Sun it is $\sim1$ m s$^{-1}$.

**The magnetic cycle.** Magnetic activity suppresses convection and therefore reduces the convective blueshift, producing a slow velocity drift correlated with the activity cycle. For the Sun this is several m s$^{-1}$ over eleven years — **the same amplitude and a similar timescale to a Jupiter analogue.**

**Oscillations.** $p$-modes produce metre-per-second variations on five-minute timescales, easily averaged out with sufficiently long exposures.

The severity of this cannot be overstated: **the Sun observed as a star would show activity-induced velocity variations ten to a hundred times larger than the Earth's signal, at periods that overlap the planetary range.**

### 5.1 Planets that were not there

Several published detections have been withdrawn, and the pattern is instructive.

Signals at or near the stellar rotation period, or at its harmonics, are the most common failures — a planet reported at a period suspiciously close to $P_{\rm rot}$ or $P_{\rm rot}/2$ should be treated with caution as a matter of routine. Retractions have included planets around active M dwarfs, a widely publicised planet around a nearby Sun-like star that proved to be an artefact of the sampling and the analysis, and several signals in multi-planet systems whose periods turned out to track activity indicators.

**None of these were careless.** They were published by competent groups following standard procedure, and they were withdrawn when longer time series or better activity diagnostics became available. The base rate is the useful lesson: at amplitudes below a few m s$^{-1}$, a periodic signal is not by itself evidence of a planet.

### 5.2 What can be done

**Activity indicators measured simultaneously.** The Ca II H and K lines, H$\alpha$, and the sodium doublet respond to chromospheric activity. If the velocity correlates with these, it is not a planet — a planet's Doppler signal has no reason to track the star's chromosphere.

**Line shape diagnostics.** A genuine Doppler shift translates every line rigidly. A spot distorts line *profiles* asymmetrically, which shows up in the bisector span — the difference in velocity between the top and bottom of the cross-correlation profile. **Correlation between velocity and bisector span is the classic activity signature**, and it is what discriminated several false detections.

**Chromatic dependence.** Spot contrast depends on wavelength, so an activity signal has different amplitude in the blue and the red, while a Doppler shift is achromatic. Simultaneous multi-band spectrographs exploit this.

**Line-by-line analysis.** Different spectral lines respond differently to convection and magnetic fields, so the thousands of lines in a spectrum are not equivalent. Selecting or weighting lines by their activity sensitivity can suppress the stellar signal while retaining the Doppler one — an active area, and the most promising route past the current wall.

**Gaussian process regression.** Model the activity as a quasi-periodic stochastic process with the stellar rotation period as a hyperparameter, and fit it jointly with the planetary Keplerians. This works, and it carries a risk that deserves stating: **a sufficiently flexible activity model can absorb a real planetary signal**, so the same technique that removes false positives can create false negatives, and the choice of kernel and priors materially affects which planets survive.

```checkpoint
q: A radial velocity signal is found with a period equal to half the star's rotation period, and the velocities correlate with the bisector span of the cross-correlation profile. What is the most likely interpretation?
a: A planet in a $2{:}1$ resonance with the star's rotation
x: There is no mechanism to lock a planet's orbit to its host's rotation at that ratio; the coincidence itself is the warning.
a*: Starspots, which produce velocity signals at the rotation period and its harmonics and distort line profiles rather than shifting them rigidly
a: A planet whose orbit is being perturbed by the star's magnetic field
x: Stellar magnetic fields have negligible dynamical effect on a planetary orbit at these separations.
a: An instrumental systematic aliased to half the rotation period
x: An instrumental effect has no reason to know the star's rotation period, which is what makes that coincidence diagnostic of a stellar origin.
hint: Ask what a real Doppler shift does to a spectral line's shape, and what a dark spot does.
why: Two independent indicators point the same way. **The period:** a spot crossing the disc removes blueshifted light while on the approaching limb and redshifted light while on the receding limb, producing a velocity signal at the rotation period; two spots on opposite hemispheres, or a spot plus its associated plage, readily produce power at $P_{\rm rot}/2$. **The bisector correlation:** a genuine Doppler shift translates every line rigidly, preserving its shape, whereas a dark spot removes flux from one side of the rotationally broadened profile and distorts it asymmetrically. The bisector span measures that asymmetry, and correlation between it and the velocity is the classic activity signature. Additional checks point the same way: chromospheric indicators such as Ca II H and K should correlate if the cause is activity, and the amplitude should depend on wavelength, since spot contrast does while a Doppler shift does not. As a matter of routine, **a reported planet at a period near $P_{\rm rot}$ or $P_{\rm rot}/2$ warrants scepticism**, because that is where the majority of retracted detections have been found.
---
q: Gaussian process regression is widely used to model stellar activity jointly with planetary signals. What is its principal risk?
a: It is computationally expensive, so only small datasets can be analysed
x: Cost is a practical constraint that has largely been solved; it is not the methodological danger.
a*: A sufficiently flexible activity model can absorb a genuine planetary signal, so the same technique that removes false positives can create false negatives
a: It assumes the activity is strictly periodic, which stellar activity is not
x: The standard kernels are *quasi*-periodic precisely to accommodate the fact that activity evolves; that is a feature rather than a flaw.
a: It cannot handle signals at periods shorter than the stellar rotation period
x: There is no such restriction; the method operates across the full period range.
hint: Ask what happens when a model with many free parameters is fitted to data containing a signal it was not told about.
why: A Gaussian process models the activity as a stochastic process with a quasi-periodic covariance kernel whose hyperparameters — rotation period, evolution timescale, amplitude — are fitted alongside the planetary Keplerians. It works, and it has resolved several ambiguous cases. But the model is flexible by design, and flexibility does not distinguish between the variability it was built to describe and a periodic signal it was not told about. **A planet whose period is close to the rotation period, or to a harmonic, can be partly or wholly absorbed into the activity model**, and the amount absorbed depends on the kernel choice and the priors on the hyperparameters. Published analyses of the same dataset with different kernel choices have recovered different numbers of planets. The methodological point generalises beyond this technique: a nuisance model powerful enough to remove any contaminant is also powerful enough to remove the signal, so the honest procedure is to report how the result depends on the nuisance model's assumptions rather than presenting the output of one choice as the answer.
```

## 6. Finding the signal: periodograms and aliases

Between the velocities and the planet lies a signal-processing problem that has produced as many errors as stellar activity has, and it deserves its own treatment.

Radial velocity data are **unevenly sampled**. Observations happen when the target is up, the weather is clear and the telescope is allocated — which imposes a strong daily, monthly and yearly structure on the sampling. The standard tool is the **Lomb–Scargle periodogram**, a least-squares fit of a sinusoid at each trial frequency, which handles uneven sampling correctly where a Fourier transform does not.

Two failure modes recur.

**Aliasing.** With sampling structure at frequency $f_s$, a true signal at $f_0$ produces spurious peaks at $|f_0 \pm f_s|$. Because observations cluster around one per night, the one-day alias is ubiquitous: a genuine period $P$ generates a false peak at $1/(1/P \pm 1)$ days$^{-1}$. **Choosing the wrong peak of an alias pair gives a completely wrong orbit**, and it has happened in published work — sometimes corrected only when a transit search at the claimed period found nothing and a search at the alias found the planet.

The yearly alias is subtler and more dangerous, because a one-year period is exactly where an Earth analogue would be and exactly where the Earth's own motion is being subtracted from the data.

**Eccentricity and multiplicity confusion.** An eccentric Keplerian is a sum of harmonics, so a single eccentric planet can be fitted almost as well by two circular planets near a $2{:}1$ period ratio, and vice versa. Distinguishing them needs dense sampling through periastron, where the two models differ most, and this is one reason some published eccentricities and some published second planets have not survived.

**The false alarm probability** attached to a periodogram peak is routinely computed assuming white noise. Stellar activity is red — correlated on rotation timescales — which makes high peaks far more common than the white-noise calculation implies. **A quoted false alarm probability of $10^{-4}$ computed under a white-noise assumption may correspond to a real probability nearer a per cent** when the noise is correlated. This single point accounts for a good deal of the field's retraction history.

```checkpoint
q: Why was 51 Pegasi b, with a semi-amplitude of $59$ m s$^{-1}$, not discovered years earlier?
a: The required precision of about $10$ m s$^{-1}$ was not available before 1995
x: That precision had been available for several years; the signal was well above the detection threshold of existing instruments.
a*: Surveys were sampling long-period orbits because Solar System experience placed giant planets far from their stars, so short periods were not searched
a: Sun-like stars had not previously been targeted, only M dwarfs
x: Sun-like stars were the standard targets of the surveys then running.
a: The signal was dismissed as stellar pulsation by earlier observers
x: Pulsation was carefully considered and rejected in the discovery paper itself, but it was not the reason for the delay.
hint: Ask what observing cadence a survey adopts when it expects planets on decade-long orbits.
why: A semi-amplitude of $59$ m s$^{-1}$ was comfortably detectable with the instruments of the early 1990s. What was missing was the search: surveys were designed around the expectation that giant planets orbit at several AU, as they do in the Solar System, so cadences were chosen for periods of years and short-period signals were not looked for. **A well-founded expectation delayed the discovery**, and periodograms of existing data would have shown the planet had anyone examined short periods. The episode is a useful corrective to the idea that discovery follows automatically from capability: what a survey can find is set jointly by its sensitivity and by the region of parameter space it chooses to search, and the second is determined by theory. The same pattern recurs — searches are designed around predictions, so the least-expected objects are systematically the last found, independent of how easy they are to detect once someone looks.
---
q: A periodogram peak is reported with a false alarm probability of $10^{-4}$. What should be checked before accepting it?
a: Whether the peak exceeds the highest peak in the window function
x: A sensible check, but the more fundamental problem concerns how the probability itself was computed.
a*: Whether the false alarm probability was computed assuming white noise, since stellar activity is correlated and makes high peaks far more likely than that assumption implies
a: Whether enough observations were taken to resolve the period
x: Necessary, but it would show up as a broad rather than a spuriously significant peak.
a: Whether the periodogram used a Fourier transform rather than a Lomb–Scargle formulation
x: Lomb–Scargle is standard precisely because sampling is uneven, and its use is essentially universal in this field.
hint: A false alarm probability is a statement about how often noise alone would produce such a peak — which depends on what the noise is assumed to be.
why: A false alarm probability answers the question "how often would noise alone produce a peak this high?", and the answer depends entirely on the noise model. The standard calculation assumes independent Gaussian errors, but stellar activity produces **red noise** — correlated on the rotation timescale and its harmonics — which generates high periodogram peaks far more often than white noise does. A quoted probability of $10^{-4}$ under a white-noise assumption can correspond to a real probability nearer a per cent once correlation is accounted for, and that gap accounts for a substantial part of the field's retraction record. Two further checks belong alongside it. **Aliasing:** uneven sampling clustered near one observation per night creates spurious peaks at $|f_0 \pm 1\ \mathrm{d^{-1}}|$, and choosing the wrong member of an alias pair yields a completely wrong orbit — an error corrected in published cases only when a transit search at the claimed period found nothing. And **the yearly alias** is especially treacherous, since one year is both where an Earth analogue would sit and where the Earth's own motion is being subtracted from the data.
```

## 7. What the method established

**The first detection around a Sun-like star.** 51 Pegasi b, in 1995, with $K = 59$ m s$^{-1}$ and a period of $4.23$ days — a giant planet orbiting closer than Mercury, which no formation theory of the time predicted. The signal was large and unambiguous, and the surprise was not that it was detected but that such a thing existed.

The historical point worth making is about **why it was not found earlier**. The precision required had been available for some years, but surveys had concentrated on long-period orbits, because Solar System experience said giants belong far out. **The discovery was delayed by a well-founded expectation**, and the periodograms in existing data would have shown it had anyone looked at short periods.

**Masses, and therefore densities.** Combined with transit radii, radial velocity gives bulk density, which is the only route to composition. Everything in the chapters on masses, radii and interiors depends on this combination.

**Long-period giants.** Radial velocity's weak period dependence has produced the census of Jupiter analogues, which transits cannot supply and which is essential for asking whether the Solar System's architecture is common.

**The eccentricity distribution**, and with it the evidence for a dynamically violent phase in many systems.

**Occurrence rates for giants**, which are less correction-dominated than transit rates because there is no geometric factor to invert — a point in the method's favour that is easy to overlook.

```checkpoint
q: The Sun's magnetic cycle produces a radial velocity drift of several m s$^{-1}$ over eleven years. Why is this the most dangerous activity signal for exoplanet detection?
a: Because it is the largest activity signal in amplitude
x: Spots on an active star reach tens of m s$^{-1}$, larger than the cycle contribution.
a*: Because both its amplitude and its decade timescale resemble a Jupiter analogue's signal, so it cannot be separated by period or amplitude alone
a: Because it cannot be measured by any independent diagnostic
x: Chromospheric indicators such as Ca II H and K track the magnetic cycle well, which is the main defence against it.
a: Because it is chaotic and therefore unpredictable
x: Solar-type cycles are quasi-periodic rather than chaotic, which is what makes them modellable at all.
hint: Compare the amplitude and period of the cycle signal with those of a Jupiter analogue.
why: Jupiter's signal on the Sun is $12.5$ m s$^{-1}$ with a period of $11.9$ years; the solar magnetic cycle contributes several m s$^{-1}$ over about $11$ years. **The two overlap in both amplitude and timescale**, so neither the size of a signal nor its period distinguishes them — which is not true of the other activity sources, where spot signals sit at the rotation period, granulation at minutes and oscillations at five minutes, all far from the orbital periods of interest. The physical origin is that magnetic activity suppresses convection, reducing the convective blueshift of several hundred m s$^{-1}$ by a small fraction, and that fraction varies over the cycle. The defence is not periodicity but **correlation**: chromospheric indicators such as Ca II H and K track magnetic activity directly, so a velocity signal that follows them is not planetary. This works, but it requires a comparably long baseline of activity measurements — and it means that claims of Jupiter analogues from campaigns shorter than a cycle rest on an assumption that the cycle contribution is small for that particular star.
---
q: What does radial velocity contribute that no other exoplanet detection method can?
a: The planet's radius, which fixes its composition
x: Radius comes from transits; radial velocity contains no information about the planet's size.
a*: Mass, without requiring any geometric alignment — and mass combined with a transit radius is the only route to bulk density and therefore composition
a: The planet's orbital period, which cannot be measured otherwise
x: Transits give periods to higher precision, from the timing of repeated events.
a: The planet's atmospheric composition, from the shifted spectral lines
x: Atmospheric composition comes from transmission and emission spectroscopy; the Doppler measurement uses the star's lines, not the planet's.
hint: Ask what each method's observable is, and which one appears in a density calculation.
why: A transit measures $R_p/R_\star$ — a shadow, carrying no information about mass. Direct imaging measures brightness and position. Microlensing measures a mass ratio but usually with poorly constrained absolute scales. **Radial velocity measures the star's reflex motion, which depends on the planet's mass**, and it does so for every system regardless of orbital orientation, subject only to the $\sin i$ projection that reduces but never eliminates the signal. That matters because density — the only observable route to whether a planet is rock, ice or gas — requires both mass and radius, so it exists only where a transit and a Doppler measurement are combined. The complementarity runs both ways: the transit supplies the inclination that converts $M_p\sin i$ into a true mass, and the Doppler measurement supplies the mass that converts a radius into a composition. Neither method alone yields a characterised planet, which is why the two have been deployed together since the first transiting planet was confirmed and why bright, nearby transit hosts are so much more valuable than faint ones.
```

## 8. Where the method stands

The instrumental problem is solved to roughly the precision an Earth analogue requires. The stellar problem is not. Progress now comes from three directions:

**Understanding the star better** — solar observations treated as stellar observations, using the Sun as a test case where the answer is known, which is the most direct route.

**Smarter use of the spectrum** — line-by-line weighting, exploiting the fact that activity and Doppler shifts affect different lines differently.

**Very long baselines** — averaging down activity by observing over many rotation and activity cycles, which works for white noise components but not for signals coherent over the timescales of interest.

**A candid assessment:** an unambiguous Earth analogue detection around a Sun-like star by radial velocity alone remains difficult, and it is not clear that it will be achieved before space-based direct imaging offers an alternative route. This is worth stating plainly, because the method's history of steady improvement invites the assumption that the trend continues, and the obstacle it has met is of a different kind from the ones it has previously overcome.

{{image: High Accuracy Radial Velocity Planet Searcher | A stabilised, vacuum-enclosed spectrograph fed by scrambling optical fibres and calibrated against a simultaneous reference spectrum, an arrangement that reached metre-per-second precision and produced a large fraction of the known radial velocity planets. The engineering problem it solves is that a velocity of one metre per second corresponds to a fractional wavelength shift of three parts in a billion, far smaller than the drift a conventional spectrograph suffers from ordinary changes in temperature and pressure. Its successors have demonstrated a quarter of a metre per second, which is sufficient in principle for an Earth analogue — leaving the star itself as the limiting noise source.}}

```checkpoint
q: What limits the wavelength-scale stability of a spectrograph at the metre-per-second level, and how is it overcome?
a: Photon noise, which is overcome by longer exposures
x: Photon noise is real and does set a floor, but it is random rather than systematic; the stability problem is a drift, which longer exposures do not fix.
a*: Thermal, pressure and mechanical drift, overcome by enclosing the spectrograph in vacuum, controlling temperature to millikelvins, scrambling the input fibre, and recording a simultaneous reference spectrum
a: Atmospheric absorption lines, which are removed by observing from space
x: Telluric lines are a real contaminant handled by masking, and several of the highest-precision instruments are ground-based.
a: Detector pixel size, which is overcome by using larger detectors
x: The measurement is a centroid across thousands of lines and is not limited by pixel size — the shift being measured is about a thousandth of a pixel.
hint: One metre per second is a fractional wavelength change of three parts in a billion; ask what ordinary environmental change produces more than that.
why: A velocity of $1$ m s$^{-1}$ corresponds to $\Delta\lambda/\lambda = 3.3\times10^{-9}$, and an uncontrolled spectrograph drifts by far more than that from a millikelvin temperature change, a millibar pressure change, or flexure as the telescope tracks. The solutions attack each term: **vacuum enclosure** removes pressure and refractive index variation, **millikelvin thermal control** removes expansion, **fibre scrambling** decouples the illumination from guiding errors so that a slight mispointing does not shift the effective slit position, and a **simultaneous reference** — thorium–argon, or better a laser frequency comb whose line frequencies are known to atomic-clock accuracy — measures whatever drift remains on the same detector at the same time. The alternative earlier approach, an **iodine absorption cell** placed in the beam, superimposes reference lines that share every instrumental distortion, allowing the wavelength scale and the instrumental profile to be recovered together at the cost of absorbing light and restricting the usable wavelength range. Together these took the field from roughly $10$ m s$^{-1}$ to $0.25$ m s$^{-1}$ — which is why the current obstacle is the star rather than the instrument.
---
q: Radial velocity occurrence rates for giant planets are often described as less correction-dominated than transit occurrence rates. Why?
a: Because radial velocity surveys observe more stars
x: They observe far fewer — thousands rather than hundreds of thousands — which is a disadvantage in counting statistics, not an advantage.
a*: Because there is no geometric alignment factor to invert: every system is observable, subject only to the $\sin i$ projection, which reduces the signal without eliminating it
a: Because radial velocity measurements have smaller uncertainties than transit photometry
x: Precision per measurement is not what dominates an occurrence rate; the completeness correction is.
a: Because giant planets are common enough that corrections are unnecessary
x: Corrections for detection completeness are still required; the point is that one large correction is absent.
hint: Compare what must be divided out in each case to convert detections into a population rate.
why: A transit occurrence rate divides each detection by both a geometric probability $R_\star/a$ — as small as $0.465\%$ for an Earth analogue — and a detection completeness. The geometric factor is exact but enormous, so a handful of marginal detections are multiplied by factors of hundreds and the answer becomes highly sensitive to how completeness is characterised near threshold. Radial velocity has **no geometric requirement at all**: every system produces a signal, reduced by $\sin i$ but never eliminated, and $\sin i$ has a known distribution with mean $\pi/4$ that can be handled statistically rather than as a large inversion. Completeness corrections are still needed — they depend on the number and timing of observations per star and on the amplitude threshold — but they are the only large factor rather than one of two. The practical result is that giant-planet occurrence rates from radial velocity surveys have been more stable across independent analyses than $\eta_\oplus$ estimates from transit surveys, which is a point in the method's favour that is easy to overlook when comparing raw detection counts.
```

## 9. Pulling the thread

- **The Earth's signal on the Sun is $8.9$ cm s$^{-1}$**, and the Sun's own surface produces $1$–$10$ m s$^{-1}$ from granulation, supergranulation, spots and the magnetic cycle. **The star is the noise.**
- **The instruments are already good enough.** ESPRESSO has demonstrated $0.25$ m s$^{-1}$; the obstacle is not white, not instrumental, and not reducible by averaging.
- **$M\sin i$ is a projection, not a precision limit.** Statistically mild — $\langle\sin i\rangle = \pi/4$, and only $13\%$ of orientations hide a factor of two — but a real ambiguity per system, removed only by a transit or an astrometric orbit.
- **$K\propto P^{-1/3}$ is the structural advantage.** A tenfold longer period costs a factor of $2.15$, against $4.6$ in geometric probability for transits, and no alignment is required. This is the method for Jupiter analogues.
- **Eccentricity is real.** Giant exoplanets are far more eccentric than Solar System planets, confirmed independently in transiting systems, and it points to planet–planet scattering — the same process implied by misaligned hot Jupiters.
- **Signals near $P_{\rm rot}$ or $P_{\rm rot}/2$, or correlating with bisector span or chromospheric indicators, are activity** until proved otherwise, and that is where most retracted planets were found.
- **A flexible activity model can absorb a real planet**, so the same tool that suppresses false positives manufactures false negatives, and results should be reported with their dependence on the nuisance model.
- **51 Peg b was delayed by a reasonable expectation.** The precision existed; the surveys were pointed at long periods because Solar System experience said giants belong far out.

The transferable idea: **when a measurement stops improving, the useful question is whether the limit has changed category.** Radial velocity precision improved by two orders of magnitude across three decades through better engineering — evacuated enclosures, fibre scrambling, frequency combs — and the natural extrapolation was more of the same. But the barrier now is astrophysical, not instrumental, and no amount of the engineering that produced the previous gains will move it. Recognising a change of category matters because it redirects effort: the productive work is now in stellar physics and in spectral analysis rather than in optomechanics. **A plateau reached by one kind of effort is often a signal to change kind, not to redouble** — and the first diagnostic is to ask what is actually setting the limit now, rather than assuming it is still whatever set it last time.

## 10. Further reading

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Sara Seager | Exoplanets | 2010}}

{{book: John Wilson | Doppler Spectroscopy of Exoplanets | 2020}}

Beyond the books: Mayor and Queloz's 1995 discovery paper is short and worth reading for how carefully the alternative explanations — stellar pulsation in particular — were addressed before the planetary interpretation was asserted. On stellar activity, the literature turns over quickly; the most useful entry point is the series of papers analysing solar radial velocities as if the Sun were an unresolved star, since that is the one case where the true planetary signal is known exactly and the activity can be studied against a known answer.

## Problems

*Useful numbers: $K = (2\pi G/P)^{1/3}M_p\sin i\,(M_\star+M_p)^{-2/3}(1-e^2)^{-1/2}$; $K = 12.46$ m s$^{-1}$ for Jupiter on the Sun, $0.089$ m s$^{-1}$ for Earth on the Sun, $59.0$ m s$^{-1}$ for 51 Peg b, $1.24$ m s$^{-1}$ for Proxima b; $\langle\sin i\rangle = \pi/4$; $\Delta\lambda/\lambda = v_r/c$; HARPS $\sim1$ m s$^{-1}$, ESPRESSO $\sim0.25$ m s$^{-1}$; solar activity signals $1$–$10$ m s$^{-1}$.*

**1.** *(Scalings.)* From the $K$ formula, state how the semi-amplitude depends on planet mass, period and stellar mass, and give one observational consequence of each.

**2.** *(The fractional shift.)* **(a)** Compute $\Delta\lambda/\lambda$ for $v_r = 1$ m s$^{-1}$. **(b)** State why this is measurable at all, given detector pixel sizes. **(c)** Name two techniques that stabilise the wavelength scale.

**3.** *(The projection.)* **(a)** Explain why radial velocity gives $M_p\sin i$. **(b)** Given $\langle\sin i\rangle = \pi/4$, state the typical underestimate. **(c)** State the two measurements that remove the ambiguity and what each contributes.

**4.** *(Comparative sensitivity.)* **(a)** Compute the factor by which $K$ falls when the period increases tenfold. **(b)** Compute the corresponding factor for transit probability. **(c)** State which method finds Jupiter analogues and why.

**5.** *(Amplitudes.)* **(a)** Compute the ratio of Jupiter's to Earth's signal on the Sun and check it against the $M_p P^{-1/3}$ scaling. **(b)** Explain why Proxima b's signal is fourteen times Earth's despite a similar mass. **(c)** State which factors in the formula are responsible.

**6.** *(Activity.)* **(a)** Name four stellar processes producing radial velocity signals and give their approximate solar amplitudes and timescales. **(b)** State which is most dangerous for detecting a Jupiter analogue and why. **(c)** State which is easiest to remove and why.

**7.** *(Diagnostics.)* **(a)** Explain physically why bisector span discriminates spots from planets. **(b)** Explain the chromatic test. **(c)** State why a signal at $P_{\rm rot}/2$ is suspicious.

**8.** *(Eccentricity.)* **(a)** State the observational result and how it differs from the Solar System. **(b)** Give the methodological objection raised against it and how it was addressed. **(c)** State the theoretical consequence and the independent observation that supports the same mechanism.

**9.** *(Assessment.)* **(a)** State why the method's limiting factor has changed category. **(b)** Give the three current lines of attack. **(c)** Give a candid assessment of the prospects for an Earth analogue detection by this method alone.

## Worked answers

**1.** $K\propto M_p$: massive planets give large signals, which is why giants were found first and why the early census was dominated by them. $K\propto P^{-1/3}$: sensitivity degrades only as the cube root of period, so long-period planets remain accessible — the method's structural advantage and the reason it supplies Jupiter analogues. $K\propto M_\star^{-2/3}$: low-mass hosts amplify the signal, so small planets around M dwarfs are the most accessible small-planet targets.

**2.** **(a)** $1/2.998\times10^8 = 3.3\times10^{-9}$. **(b)** Because a stellar spectrum contains thousands of absorption lines, all shifted together; cross-correlating the whole spectrum against a template averages the measurement over all of them, giving a centroid precision far finer than a single line or a single pixel permits — the shift is about a thousandth of a pixel, which is recoverable as a centroid but not as a resolved displacement. **(c)** An iodine absorption cell, superimposing reference lines that share every instrumental distortion; and a stabilised vacuum spectrograph with a simultaneous reference spectrum from thorium–argon or a laser frequency comb.

**3.** **(a)** The Doppler effect senses only the line-of-sight velocity component, and the star's orbital velocity is projected by $\sin i$; a face-on orbit produces no radial component at all. **(b)** A factor $4/\pi = 1.27$ on average, so typical true masses are about $27\%$ above the minimum. **(c)** A transit fixes $i\approx90°$, making $\sin i\approx1$ so the minimum becomes the true mass; astrometry measures the orbit's angular size and shape on the sky, determining $i$ directly and independently.

**4.** **(a)** $10^{1/3} = 2.15$. **(b)** $P_{\rm tr}\propto a^{-1}$ and $a\propto P^{2/3}$, so probability falls by $10^{2/3} = 4.64$ — and the requirement for repeated transits within a fixed baseline compounds it further. **(c)** Radial velocity, because its sensitivity degrades only as the cube root of period and it requires no alignment, whereas a transit survey loses both geometric probability and the ability to accumulate multiple events.

**5.** **(a)** $12.46/0.089 = 140$. Check: $(M_{\rm J}/M_\oplus)(P_\oplus/P_{\rm J})^{1/3} = 318\times(1/11.86)^{1/3} = 318/2.28 = 139$. ✓ **(b)** Because the host is much less massive: $K\propto M_\star^{-2/3}$, and $(0.122)^{-2/3} = 3.95$. **(c)** The stellar mass factor supplies about $4\times$; the short period supplies the rest, since $(365/11.19)^{1/3} = 3.2$, and the planet's slightly larger mass contributes a few per cent — together giving roughly the observed factor of fourteen.

**6.** **(a)** *Granulation:* $\sim0.3$–$1$ m s$^{-1}$ on minutes. *Supergranulation:* $\sim1$ m s$^{-1}$ on about a day. *Spots and plage:* $\sim1$ m s$^{-1}$ for the quiet Sun, tens for an active star, at the rotation period and its harmonics. *Magnetic cycle:* several m s$^{-1}$ over eleven years. *(Oscillations add metre-per-second variations on five minutes.)* **(b)** The magnetic cycle, because its amplitude and timescale both resemble a Jupiter analogue's signal — several m s$^{-1}$ over roughly a decade — so it cannot be distinguished by period or amplitude alone. **(c)** $p$-mode oscillations, because their five-minute timescale is far shorter than any orbital period of interest and they average out within a single sufficiently long exposure.

**7.** **(a)** A genuine Doppler shift translates every spectral line rigidly, preserving its shape, so the line's bisector is unchanged. A dark spot removes flux from one side of the rotationally broadened profile, distorting it asymmetrically and moving the bisector; correlation between velocity and bisector span therefore indicates a surface origin. **(b)** Spot contrast against the photosphere depends on wavelength, so an activity-induced velocity has different amplitude in blue and red, whereas a Doppler shift is achromatic; simultaneous multi-band observation separates them. **(c)** Because two spots on opposite hemispheres, or a spot with associated plage, produce velocity power at half the rotation period, and a planet has no reason to have a period commensurate with the star's rotation — so the coincidence is more economically explained by activity.

**8.** **(a)** Giant exoplanets have a broad eccentricity distribution extending beyond $e = 0.9$, with a median far above any Solar System value; Earth's $e$ is $0.017$. **(b)** That an eccentric single planet and two circular planets near a $2{:}1$ period ratio produce similar velocity curves, so some eccentricities might be misfitted multiples — and a few were. It was addressed by densely sampled systems, and independently by transiting systems where the transit duration constrains eccentricity without reference to the velocity fit. **(c)** Discs damp eccentricity, so a broad distribution requires post-disc excitation, with planet–planet scattering the leading candidate. The same mechanism predicts spin–orbit misalignment, which the Rossiter–McLaughlin effect independently observes in hot Jupiters.

**9.** **(a)** Because the limit was instrumental and is now astrophysical: spectrographs have reached $0.25$ m s$^{-1}$, sufficient in principle for the Earth's $0.089$ m s$^{-1}$ given a long enough campaign, while stellar surface processes contribute $1$–$10$ m s$^{-1}$ at periods overlapping the planetary range and are not reduced by better optomechanics. **(b)** Studying the Sun as a star, where the true planetary signal is known and activity can be characterised against a known answer; line-by-line analysis exploiting the different responses of different lines to convection and magnetic fields; and very long baselines to average across many rotation and activity cycles. **(c)** An unambiguous Earth analogue around a Sun-like star by radial velocity alone remains difficult and may not be achieved before space-based direct imaging provides an alternative route. The method's history of steady improvement invites the assumption that the trend continues, but the present obstacle is of a different kind from those previously overcome, and treating it as more of the same would misdirect effort.$exRV_master$,
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
