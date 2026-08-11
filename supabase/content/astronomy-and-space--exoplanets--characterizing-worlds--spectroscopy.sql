-- Astronomy & Space · Exoplanets — Characterizing Worlds — "Spectroscopy".
-- Curated master for
-- astronomy-and-space/exoplanets/characterizing-worlds/spectroscopy
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Closes the Characterizing Worlds block. The methods chapter to the
-- preceding physics chapter. Organised around the fact that every
-- exoplanet spectrum is a small difference between two large numbers
-- measured with the same instrument at different times, so the
-- systematics are correlated with the signal and cannot be averaged
-- away - and around the one technique that escapes this, high-
-- resolution cross-correlation, which uses the planet's own orbital
-- Doppler shift of tens of km/s to separate its lines from stationary
-- stellar and telluric ones. Also treats retrieval as an inverse
-- problem with priors that materially affect the answer, and the
-- transit light source effect, in which unocculted starspots imprint
-- stellar features on a planetary spectrum.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting from the transmission signal
-- 2 Rp H / R_star^2: 173 ppm per scale height for a 1.2 Jupiter-radius
-- planet with H = 500 km around a Sun-like star, 79 ppm for a 2.5
-- Earth-radius sub-Neptune with H = 300 km around a 0.5 Rsun host,
-- 9.9 ppm for an Earth-size planet with a 15 km steam scale height
-- around a 0.2 Rsun M dwarf, and 0.22 ppm for Earth around the Sun.
-- Planetary orbital speeds 133 km/s at 0.05 AU and 30 km/s at 1 AU,
-- against stationary stellar lines and telluric lines at zero
-- velocity.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/characterizing-worlds/spectroscopy',
    'research',
    'advanced',
    'read',
    $exSpec_master$> An exoplanet spectrum is never observed. What is observed is the spectrum of a star, twice — once with the planet in front of it and once without — and the difference between them. That difference is typically a few hundred parts per million for the most favourable target, and a fraction of a part per million for an Earth analogue.

**The consequence shapes everything.** Because the measurement is a difference between two observations of the same star taken at different times, **any instrumental drift between them appears as a spectral feature of the planet.** The systematics are not independent of the signal; they occupy the same place in the data and cannot be averaged away by observing longer.

One technique escapes this, and it does so by exploiting a property nothing else in the data has: **the planet is moving.** At $0.05$ AU a planet orbits at $133$ km s$^{-1}$, so its lines sweep across tens of km s$^{-1}$ during a single transit while the star's lines and the Earth's atmospheric lines stay put. That velocity difference is the cleanest discriminant in the subject.

## 1. The three geometries

### 1.1 Transmission

During transit, a thin annulus of the planet's atmosphere is backlit. Wavelengths where the atmosphere is opaque are blocked over a slightly larger radius, so the transit is deeper there.

The signal is the extra area blocked, per scale height:

$$\Delta\delta \approx \frac{2R_pH}{R_\star^2}.$$

| System | Signal per scale height |
|---|---|
| Hot Jupiter, $1.2\,R_{\rm J}$, $H = 500$ km, Sun-like host | $173$ ppm |
| Sub-Neptune, $2.5\,R_\oplus$, $H = 300$ km, $0.5\,R_\odot$ host | $79$ ppm |
| Earth-size, $H = 15$ km (steam), $0.2\,R_\odot$ host | $9.9$ ppm |
| Earth around the Sun, $H = 8.5$ km | $0.22$ ppm |

A spectral feature typically spans several scale heights, so multiply by three to five.

**The table is the field's difficulty in one place.** The best targets give hundreds of parts per million; an Earth around a Sun-like star gives under one part per million even summed over several scale heights. The intervening factor of a thousand is why the observational programme has proceeded from hot Jupiters outward and why temperate rocky planets around Sun-like stars are not currently accessible by this route at all.

**What transmission probes:** the terminator, at high altitude and low pressure. It is exquisitely sensitive to anything opaque at altitude — which is why clouds and hazes flatten it so effectively — and it says little about deeper layers.

### 1.2 Emission

At secondary eclipse the planet passes behind the star, so subtracting the in-eclipse spectrum from the out-of-eclipse spectrum isolates the planet's own thermal emission.

**What emission probes:** the dayside, at pressures deeper than transmission reaches, and it is sensitive to the vertical temperature gradient. It is the only route to detecting thermal inversions, since those show as a sign flip in the molecular features.

**Its difficulty** is that the planet-to-star flux ratio is small — of order $10^{-3}$ in the infrared for a hot Jupiter, far less for anything cooler — and it requires absolute rather than differential photometric stability across the eclipse.

### 1.3 Phase-resolved

Observing continuously through an orbit gives the planet's emission as a function of viewing angle, mapping longitudinal structure. This is what measures the day–night contrast and the hot-spot offset.

**Its cost is observing time**: a full phase curve requires monitoring for an entire orbit, so it is affordable only for short-period planets, and it demands instrumental stability over that whole span — the most demanding systematics requirement of the three.

## 2. Why the systematics are the problem

The three geometries share a structure: **a small difference between large numbers measured at different times.**

**Instrumental drift.** Detector temperature, pointing, and the position of the spectrum on the detector all change during an observation. A shift of a fraction of a pixel changes the measured flux in a wavelength-dependent way — which is exactly the form of a spectral feature.

**Detector systematics.** Charge trapping, persistence from previous exposures, and non-linearity all produce time-dependent flux changes correlated with the observation's structure, and the transit sits in the middle of that structure by construction.

**Stellar variability.** The star's own brightness changes on rotation and activity timescales, and the comparison baseline is separated from the transit by hours.

**The response** is detrending: model the systematics with functions of measured state variables — detector position, temperature, time — and fit them jointly with the transit. This works and it introduces a risk that is fundamental rather than technical: **a flexible systematics model can absorb part of the astrophysical signal**, exactly as a flexible activity model can absorb a planet in radial velocity work.

**Different groups analysing the same data have reported different spectra.** This has happened repeatedly, and the discrepancies trace to detrending choices rather than to the photometry. It is the reason the field takes independent reanalysis seriously and why published spectra are increasingly accompanied by their systematics models rather than only their results.

## 3. The transit light source effect

A systematic worth its own section, because it is astrophysical rather than instrumental and cannot be detrended away.

Transmission spectroscopy assumes the light passing through the planet's atmosphere is representative of the whole stellar disc. **It is not, if the star is spotted.**

The planet occults a specific chord. If the star has spots or bright plage *outside* that chord, the disc-averaged spectrum used as the reference differs from the spectrum of the region actually being occulted. The ratio then carries features of the **stellar** inhomogeneity, imprinted on what is interpreted as the planet's transmission spectrum.

**The magnitude is not small.** For an active M dwarf, the effect can rival or exceed the planetary signal, and it produces features at wavelengths where the star's spectrum has structure — including molecular bands of water, which is precisely the species being sought.

**This matters most for the most interesting targets.** Temperate rocky planets are found around M dwarfs, M dwarfs are magnetically active, and the effect scales with both activity and the star-to-planet contrast. **A water detection on a small planet around an active star must exclude the stellar origin before it can be claimed**, and doing so requires either monitoring the star's activity independently or exploiting the fact that stellar and planetary features have different centre-to-limb and wavelength behaviour.

```checkpoint
q: Why can the systematics in transit spectroscopy not be reduced by observing more transits?
a: They can be, and stacking transits is the standard approach for weak signals
x: Stacking does reduce photon noise and some random systematics, but the dominant terms recur identically in every transit.
a*: Because the dominant systematics are correlated with the observation's structure — detector settling, pointing drift, thermal changes — and recur in the same way each time, so they add coherently rather than averaging down
a: Because the planet's atmosphere changes between transits
x: Atmospheric variability exists but is far too small to be the limiting factor.
a: Because each transit is observed with a different instrument configuration
x: Configurations are deliberately kept identical, which is part of why the systematics repeat rather than cancel.
hint: Ask whether the systematic is random with respect to the transit's timing, or locked to it.
why: Noise averages down when it is independent between observations. **These systematics are not.** A detector's charge-trapping ramp begins when the exposure sequence starts; the telescope's thermal state evolves in a repeatable way after a slew; pointing drift follows the same pattern relative to the observation's beginning. The transit sits at a fixed place within that structure by design, so the systematic is locked in phase with the signal and repeats identically in every visit — stacking adds it coherently along with the planet's signal rather than suppressing it. The standard response is to model the systematics as functions of measured state variables and fit them jointly with the transit, which works but carries a fundamental risk: **a flexible systematics model can absorb part of the astrophysical signal**, in exactly the way a flexible Gaussian process can absorb a planet in radial velocity data. That is why different groups analysing identical data have published different spectra, with the discrepancies tracing to detrending choices rather than to the photometry, and why independent reanalysis is treated as essential rather than as a courtesy.
---
q: A water feature is detected in the transmission spectrum of a small planet orbiting an active M dwarf. What must be excluded before it is attributed to the planet?
a: That the feature arises from Earth's atmosphere
x: Telluric contamination is real and is removed by standard calibration; it is not the distinctive risk here.
a*: That unocculted starspots outside the transit chord imprinted stellar water features on the ratio — the transit light source effect
a: That the planet's mass has been overestimated, making the scale height wrong
x: A mass error changes the expected amplitude but does not manufacture a feature at water wavelengths.
a: That the detector's wavelength calibration has drifted
x: A calibration drift shifts features rather than creating them at a specific molecular band.
hint: Transmission spectroscopy compares light through the planet's atmosphere with the disc-averaged stellar spectrum. Ask what happens if those two sample different parts of the star.
why: The method assumes the starlight passing through the planet's atmosphere is representative of the whole stellar disc. **A spotted star violates that assumption.** The planet occults one chord; spots or plage elsewhere on the disc make the reference spectrum differ from the spectrum of the region actually occulted, and that difference appears in the ratio as if it were planetary absorption. The imprinted features are stellar, so they appear where the star's own spectrum has structure — and cool starspots have **molecular water bands**, precisely the species being sought. For an active M dwarf the effect can rival or exceed the planetary signal, and the targets most worth observing are exactly the ones most affected: temperate rocky planets are found around M dwarfs, and M dwarfs are magnetically active. Excluding it requires independent activity monitoring, or exploiting the different wavelength and centre-to-limb behaviour of stellar and planetary features. It is a systematic that cannot be detrended, because it is astrophysical and locked to the transit rather than to the instrument.
```

## 4. High-resolution cross-correlation

The technique that escapes the systematics problem, and the most important methodological development in the field in twenty years.

### 4.1 The idea

At spectral resolutions above about $R = 25{,}000$, individual molecular lines are resolved rather than blended into a band. A molecule such as water or carbon monoxide then presents a forest of thousands of narrow lines with a precisely known pattern.

**Three velocity components are present in the data**, and they differ:

- **Telluric lines** from Earth's atmosphere, at zero velocity in the observatory frame.
- **Stellar lines**, at the star's systemic velocity, essentially stationary during one night.
- **Planetary lines**, Doppler-shifted by the planet's orbital motion — $133$ km s$^{-1}$ at $0.05$ AU, changing by tens of km s$^{-1}$ over a few hours.

**The planet's lines move; nothing else does.** Cross-correlating each exposure against a model template of the expected line forest, and stacking in the planet's rest frame while shifting for its changing velocity, adds the planetary signal coherently and everything else incoherently.

### 4.2 What this buys

**It does not require the star to be subtracted.** The stationary components are removed by their velocity, not by differencing two observations, which eliminates the entire class of systematics described above.

**It works from the ground.** Telluric contamination — fatal for low-resolution work at many wavelengths — is separable because telluric lines do not move.

**It detects molecules unambiguously.** A cross-correlation peak at the correct planetary velocity, appearing at the expected orbital phase and tracking the expected velocity change, is a far more specific claim than an amplitude excess in a broadband measurement.

**It measures winds directly.** A net Doppler shift of the planetary signal relative to the expected orbital velocity records bulk atmospheric motion — a direct wind speed measurement, typically a few km s$^{-1}$ blueshift on hot Jupiter daysides, interpreted as flow from the hot day side toward the terminator.

**It works on non-transiting planets.** Since the method needs only the planet's Doppler signature, a bright non-transiting planet's dayside emission can be detected and its true orbital velocity measured — which resolves the $\sin i$ ambiguity and gives a true mass without a transit.

### 4.3 What it costs

**It loses the continuum.** Removing the stationary components also removes any broad, slowly varying signal, so absolute abundances and continuum-dependent quantities such as cloud levels are not directly measured. The technique detects lines and measures their relative strengths; converting that to an abundance requires assumptions.

**It requires large telescopes and bright targets**, since resolving individual lines spreads the photons thinly.

**It is model-dependent in a specific way**: one cross-correlates against a template, so the detection is of the template's line pattern. A species with poorly known line lists is hard to detect, and an incorrect template can suppress a real signal.

**The combination with low-resolution work is the current best practice**, since the two are complementary in exactly the right way — low resolution supplies the continuum and absolute levels, high resolution supplies unambiguous identifications and velocities.

{{image: Spectroscopy | Dispersing light into its constituent wavelengths, the technique on which almost all knowledge of exoplanet atmospheres rests. What is measured is never the planet's spectrum directly but a difference: the star observed through the planet's atmosphere against the star observed alone, amounting to a few hundred parts per million for the most favourable targets. At high spectral resolution the approach changes character, since individual molecular lines are resolved and the planet's orbital motion of tens of kilometres per second shifts them away from the stationary stellar and terrestrial lines — separating the planetary signal by velocity rather than by subtraction.}}

{{image: James Webb Space Telescope | An infrared observatory whose stability and wavelength coverage transformed low-resolution exoplanet spectroscopy, extending secure molecular detections from hot giants to sub-Neptunes. Its advantage is not only aperture: observing above the atmosphere removes telluric contamination that limits ground-based low-resolution work, and thermal stability reduces the class of systematics that are locked in phase with an observation and therefore cannot be averaged down by observing more transits. Those systematics have not been eliminated, and independent reanalyses of the same data have continued to yield different spectra, with the differences tracing to how the instrumental model was chosen rather than to the photometry.}}

```checkpoint
q: Emission spectroscopy at secondary eclipse probes deeper layers than transmission. Why?
a: Because the planet is closer to the star at eclipse, so the atmosphere is compressed
x: Orbital position does not change the atmosphere's structure on that timescale, and for a circular orbit the separation is unchanged.
a*: Because transmission views a long slant path through the terminator annulus, so the atmosphere becomes optically thick at low pressure, while emission views vertically down through the dayside
a: Because emission is measured at longer wavelengths, where the atmosphere is more transparent
x: Wavelength matters for which species are seen but does not account for the systematic difference in probed pressure.
a: Because emission includes reflected starlight, which penetrates further
x: Reflected light at eclipse is a separate optical component; the depth difference concerns the thermal emission's geometry.
hint: Compare the path length through the atmosphere in each geometry.
why: In transmission, starlight enters the atmosphere tangentially and travels a long slant path through the terminator annulus — of order a hundred times the vertical scale height in path length. That makes the atmosphere optically thick at very low pressure, so **transmission probes high altitudes** and is exquisitely sensitive to anything opaque there, which is why a thin high cloud deck flattens the spectrum so effectively. In emission, the observer looks vertically down into the dayside, so the photosphere at each wavelength lies where the vertical optical depth reaches unity — at substantially higher pressure. **The two geometries therefore sample different parts of the same atmosphere**, and they are complementary rather than redundant: transmission constrains the upper atmosphere and hazes, emission constrains the deeper thermal structure and is the only route to detecting an inversion, which appears as molecular features flipping from absorption to emission. A practical consequence is that a planet with a flat transmission spectrum may still yield a detailed emission spectrum, so a flat result should prompt a change of geometry rather than more of the same.
---
q: What is the limiting ingredient for detecting a molecule by high-resolution cross-correlation?
a: The signal-to-noise ratio of individual spectral lines
x: Individual lines are far below the noise; the technique works by combining thousands of them, so per-line significance is not the constraint.
a*: The accuracy of the molecular line list used as the template, since the method detects the template's pattern and an incorrect list suppresses a real signal
a: The planet's orbital velocity, which must exceed a threshold
x: A larger velocity helps separate the components, but the technique works across a wide range of orbital speeds.
a: The telescope's collecting area
x: Aperture matters for reaching faint targets but is not what determines whether a given species can be detected at all.
hint: The method correlates the data against a model. Ask what happens if the model's line positions are slightly wrong.
why: Cross-correlation gains its sensitivity by combining thousands of individually undetectable lines, and it does so by matching them against a **template** computed from a molecular line list — a catalogue of transition wavelengths and strengths. The gain is coherent only if the template's line positions are correct: small errors distribute the correlation power across velocity space instead of concentrating it at the planet's velocity, so **an inaccurate line list suppresses a genuine detection**, and the suppression worsens as more lines are included. This makes laboratory and theoretical molecular spectroscopy the rate-limiting input for the technique, which is why species with well-computed line lists — water, carbon monoxide, methane — dominate the detections while others remain inaccessible despite being physically plausible. It also means a non-detection is a statement about the template as well as about the planet. The dependence is asymmetric and worth noting: an incorrect template can hide a real molecule, but it is unlikely to manufacture a spurious peak at exactly the planet's changing orbital velocity, so the technique's false-positive behaviour is far better than its false-negative behaviour.
```

## 5. Retrieval: the inverse problem

Converting a spectrum into atmospheric properties is an inverse problem, and it is treated as one.

**The forward model** takes assumed abundances, a temperature–pressure profile, and cloud properties, and computes the spectrum. **Retrieval** explores the parameter space, usually by Bayesian sampling, and returns posterior distributions.

Three features of the procedure deserve scrutiny, because they determine what a published abundance means.

**Priors matter.** With data of limited signal-to-noise, posteriors are influenced by the priors — particularly on cloud parameters and on the temperature profile's flexibility. Different reasonable prior choices have shifted retrieved abundances by an order of magnitude on the same data, which is not a small effect and is not always reported.

**Model complexity is a choice.** A parameterisation with more free parameters fits better and constrains less. Whether to allow a non-isothermal profile, disequilibrium chemistry, or a patchy cloud fraction is decided by the analyst, and the decision propagates into the answer.

**Degeneracies are pervasive.** The most important is between abundance and cloud altitude: a high cloud deck truncating a spectrum and a low absolute abundance both reduce feature amplitude, and separating them needs either wavelength coverage extending past the cloud's opacity or an independent constraint on the reference pressure. **This is the same structural degeneracy the atmospheres chapter identified, and retrieval does not remove it — it quantifies it.**

**The correct reading of a retrieved abundance** is as a posterior conditioned on a model choice, not as a measurement. Papers increasingly report results under several model assumptions for exactly this reason, and a retrieval quoted without its assumptions is difficult to use.

## 6. What has been achieved

**Low resolution from space** has produced the securely detected molecules — water, carbon monoxide, carbon dioxide, methane, sodium, potassium — across hot Jupiters and warm Neptunes, and has begun reaching sub-Neptunes. Its strength is broad wavelength coverage and continuum measurement; its weakness is the systematics discussed above.

**High resolution from the ground** has produced unambiguous identifications, wind measurements, spin measurements for directly imaged planets from rotational line broadening, and detections in non-transiting systems. Its strength is specificity; its weakness is the lost continuum.

**Direct imaging spectroscopy** provides the planet's own light without the star, giving the cleanest spectra available and the C/O measurements that constrain formation — for the small, unrepresentative population of young wide-orbit giants that can be imaged.

**The pattern across all three** is that the techniques' weaknesses are complementary, and the strongest results come from combining them. That is not a platitude: the combination is what turns a broadband amplitude excess into an identified molecule with a measured abundance and a known velocity.

```checkpoint
q: High-resolution cross-correlation separates the planet's signal from the star's without subtracting the star. How?
a: By observing at wavelengths where the star is faint and the planet is bright
x: This helps in the infrared but is a matter of contrast, not of separation, and does not remove the star's lines.
a*: By exploiting the planet's orbital Doppler shift — its lines move by tens of km s$^{-1}$ during an observation while stellar and telluric lines stay fixed, so stacking in the planet's rest frame adds its signal coherently and everything else incoherently
a: By using a coronagraph to block the stellar light before dispersion
x: Coronagraphy is used in direct imaging; the cross-correlation technique works on unresolved systems where no spatial separation exists.
a: By subtracting a spectrum taken when the planet is behind the star
x: That is the emission spectroscopy method, which does rely on differencing and therefore inherits the systematics problem.
hint: List the velocity components present in the data and ask which of them changes during a night.
why: A high-resolution spectrum of an unresolved system contains three components at different velocities: **telluric lines** from Earth's atmosphere at zero velocity in the observatory frame; **stellar lines** at the systemic velocity, essentially stationary through a night; and **planetary lines** Doppler-shifted by the orbital motion — $133$ km s$^{-1}$ at $0.05$ AU, changing by tens of km s$^{-1}$ over a few hours. Only the planet moves. Cross-correlating each exposure against a template of the expected molecular line forest and then stacking in the planet's changing rest frame adds the planetary signal coherently while the stationary components smear out. **The separation is by velocity rather than by subtraction**, which eliminates the entire class of systematics that afflicts differential methods, allows the technique to work from the ground despite telluric contamination, and even works on non-transiting planets — where measuring the true orbital velocity resolves the $\\sin i$ ambiguity and yields a true mass with no transit at all. Its price is the continuum: removing the stationary components also removes broad slowly varying signal, so absolute abundances need assumptions and cloud levels are not directly measured.
---
q: A retrieval returns a water abundance with a stated uncertainty. What is the correct interpretation?
a: A measurement of the planet's water content with that uncertainty
x: The quoted interval is a posterior conditioned on model choices, not a measurement uncertainty in the usual sense.
a*: A posterior conditioned on the assumed model — its parameterisation, priors and cloud treatment — which different reasonable choices have shifted by an order of magnitude on identical data
a: An upper limit, since retrievals systematically overestimate abundances
x: Retrievals are not systematically biased in one direction; the sensitivity is to model choice, which can go either way.
a: A measurement whose uncertainty is dominated by photon noise
x: For most published retrievals the model dependence exceeds the photon-noise contribution.
hint: Ask what enters the calculation besides the data.
why: Retrieval solves an inverse problem: a forward model computes a spectrum from assumed abundances, a temperature–pressure profile and cloud properties, and Bayesian sampling returns posteriors. **Three analyst choices enter alongside the data.** Priors, particularly on cloud parameters and on how flexible the temperature profile may be, materially influence posteriors when signal-to-noise is limited — different reasonable choices have moved retrieved abundances by an order of magnitude on the same observations. Model complexity is chosen rather than derived: whether to permit a non-isothermal profile, disequilibrium chemistry or patchy clouds changes both the fit and the constraint. And degeneracies persist, most importantly between abundance and cloud altitude, since a high cloud deck and a low abundance both reduce feature amplitude — **retrieval quantifies that degeneracy rather than removing it**. The correct reading is therefore a posterior conditioned on stated assumptions, which is why careful papers report results under several model choices and why a retrieved abundance quoted without its assumptions is difficult to use.
```

```checkpoint
q: Why does the high-resolution technique work on non-transiting planets, and what does that yield?
a: It does not; a transit is required to isolate the planet's light
x: Transits are required for transmission spectroscopy but not for a method that separates by velocity.
a*: Because it needs only the planet's Doppler signature, not an eclipse — so a bright non-transiting planet's dayside emission can be detected, and measuring its true orbital velocity resolves the $\sin i$ ambiguity to give a true mass
a: Because non-transiting planets are brighter, having no obscuration by the star
x: Transiting and non-transiting planets do not differ in intrinsic brightness; the geometry differs, not the flux.
a: Because the technique measures the star's reflex motion rather than the planet's light
x: That would be ordinary radial velocity; here the planet's own spectral lines are detected.
hint: Ask what the technique actually requires to be present in the data.
why: Cross-correlation needs one thing: planetary spectral lines shifted by a velocity that changes measurably during the observation, so that stacking in the planet's rest frame accumulates its signal while stationary components smear. **Nothing in that requires the planet to cross the stellar disc.** For a bright close-in planet, dayside thermal emission carries the molecular line forest, and combining exposures across a night reveals it at the planet's velocity. The scientific payoff is substantial: measuring the planet's **actual orbital velocity** directly determines the orbital inclination, so the $M_p\sin i$ from the star's reflex motion becomes a true mass — the same service a transit performs, obtained without one. Since transiting systems are a small minority selected by geometry, this extends true-mass determinations to a far larger and less biased sample. The requirement is a bright host and a large telescope, since resolving individual lines spreads photons thinly, so the technique is confined to the nearest and brightest systems rather than being generally applicable.
---
q: Reanalyses of the same exoplanet spectroscopic data by different groups have yielded incompatible spectra. What is the appropriate response?
a: To trust the analysis by the group that collected the data, since they know the instrument best
x: Familiarity with the instrument is valuable but does not settle a dispute about how to model its systematics.
a*: To treat published spectra as conditional on their systematics model, to require that model be reported alongside the result, and to weight results that are stable across reasonable detrending choices
a: To discard the affected datasets, since irreproducible results are worthless
x: The photometry is sound; it is the inference from it that is model-dependent, and the data retain their value.
a: To average the published spectra, since the truth presumably lies between them
x: Averaging results that differ because of methodological choices produces a number corresponding to no coherent analysis.
hint: Ask where the disagreement originates, and what the reader would need in order to judge it.
why: The discrepancies trace to **detrending choices** rather than to the photometry: the systematics are locked in phase with the transit and must be modelled jointly with it, and a more flexible model absorbs more signal while a less flexible one leaves more residual. Reasonable analysts choose differently and obtain different spectra from identical data. Three responses follow. **Report the systematics model** with the result, so a reader can judge how much of the spectrum depends on it — increasingly standard practice. **Prefer results stable under varying that model**, since a feature that survives several reasonable detrending choices is far more credible than one that appears under a single one. And **treat the spectrum as a conditional inference**, not a measurement. The structure is identical to the Gaussian process problem in radial velocity work and to the retrieval prior problem later in this chapter: wherever a nuisance model powerful enough to remove the contaminant is also powerful enough to remove the signal, the honest output is a result plus its dependence on the nuisance model, and a single headline number conceals what matters.
```

```checkpoint
q: A phase curve is the most demanding of the three geometries. Why, and what does it uniquely deliver?
a: Because the planet is faintest at the phases furthest from eclipse
x: The planet's night side is faint, but the difficulty is instrumental stability rather than the faintest point's signal.
a*: Because it requires continuous monitoring across an entire orbit with stability maintained throughout — and it uniquely measures the day–night contrast and the hot-spot offset, hence heat redistribution and winds
a: Because it must be repeated over many orbits to average down stellar variability
x: A single well-observed orbit suffices for the measurement; repetition helps but is not what makes it demanding.
a: Because it requires simultaneous observations at many wavelengths
x: Multi-wavelength phase curves are valuable but not required; a single band already yields the contrast and offset.
hint: Compare the observing duration each geometry needs, and ask what happens to instrumental drift over that span.
why: Transmission needs the hours around a transit; emission needs the hours around an eclipse; **a phase curve needs the whole orbit**, and the quantity being measured — how the planet's brightness varies with viewing angle — is a slow modulation of order a hundredth of a per cent spread across that entire span. Instrumental drift on the same timescale is therefore directly confused with the astrophysical signal, and unlike a transit there is no out-of-event baseline to anchor against, since the planet contributes at every phase. That makes it the most stringent stability requirement in the subject and confines the technique to short-period planets. What it buys is unavailable otherwise: the **day–night brightness contrast**, which measures the heat redistribution factor $f$ and so breaks the degeneracy with albedo that a single dayside temperature cannot; and the **hot-spot offset**, which measures atmospheric advection directly and yields wind information on an object that has never been spatially resolved. It is also the cleanest available test of whether a small planet has any atmosphere at all, since an airless body cannot transport heat and shows maximal contrast.
---
q: Across the three approaches — low-resolution space spectroscopy, high-resolution ground cross-correlation, and direct imaging spectroscopy — what is the general pattern?
a: Each supersedes the previous one, so the newest should be preferred
x: They developed in overlapping periods and remain in simultaneous use because none subsumes the others.
a*: Their weaknesses are complementary — continuum without identification, identification without continuum, clean spectra of an unrepresentative sample — so the strongest results come from combining them
a: They measure different planets, so their results cannot be compared
x: They overlap on the brightest transiting giants, where combined analyses are routinely performed.
a: They agree on everything measured so far, confirming that systematics are under control
x: They have disagreed in specific cases, and reconciling those disagreements has been informative rather than embarrassing.
hint: For each method, name what it provides and what it cannot.
why: **Low resolution from space** supplies broad wavelength coverage and the continuum, hence absolute levels and cloud constraints, but suffers systematics locked in phase with the signal and yields amplitude excesses whose molecular attribution can be ambiguous. **High resolution from the ground** supplies unambiguous identification and velocities, separating the planet by Doppler shift rather than subtraction, but loses the continuum along with the stationary components, so absolute abundances need external input. **Direct imaging** supplies the planet's own light with no star to subtract — the cleanest spectra available — but only for young, wide-orbit, self-luminous giants, about one per cent of known planets and the least representative sample in the field. Each gap is filled by another's strength, which is why the strongest published characterisations combine at least two: a molecule identified by its line forest at high resolution, with an abundance anchored by a low-resolution continuum, and where possible checked against an imaged object's uncontaminated spectrum. **The combination is not redundancy but construction** — it is what turns a broadband excess into an identified molecule with a measured abundance and a known velocity.
```

## 7. Pulling the thread

- **Nothing observed is a planet's spectrum.** Every result is a small difference between two observations of a star, of order $173$ ppm per scale height for the best targets and $0.22$ ppm for an Earth analogue — a factor of a thousand that structures the whole observational programme.
- **The systematics are locked to the signal**, recurring identically in each visit rather than averaging down, so detrending is unavoidable and a flexible systematics model can absorb the astrophysics.
- **Different groups have published different spectra from identical data**, with the discrepancies tracing to detrending choices rather than photometry.
- **The transit light source effect is astrophysical and cannot be detrended.** Unocculted spots imprint stellar features — including water bands — on the planetary spectrum, worst for exactly the small planets around active M dwarfs that matter most.
- **High-resolution cross-correlation separates by velocity, not by subtraction.** The planet moves at tens of km s$^{-1}$ and nothing else does, which eliminates the systematics class, works from the ground, measures winds, and reaches non-transiting planets.
- **Its cost is the continuum**, so it identifies species and measures velocities but needs low-resolution work for absolute abundances — the two are complementary by construction.
- **A retrieved abundance is a posterior conditioned on a model**, with priors and parameterisation choices shifting results by an order of magnitude on identical data.

The transferable idea: **when a signal cannot be separated from a contaminant by amplitude, look for a coordinate in which they differ.** Low-resolution exoplanet spectroscopy fights an unwinnable battle, because the systematics and the signal occupy the same place in the data and both scale with the star's brightness. High-resolution cross-correlation wins by moving the problem into velocity space, where the planet is at $133$ km s$^{-1}$ and everything contaminating it is at zero — and there the separation is essentially free. **The question to ask of any contaminated measurement is not how to make it more precise but which coordinate distinguishes the signal from the contaminant**: time, wavelength, velocity, polarisation, spatial position, or the phase of some known modulation. The same reasoning produced lock-in amplification, pulsar timing, and the angular differential imaging described three chapters ago. Precision fights noise; **coordinates defeat contamination.**

## 8. Further reading

{{book: Sara Seager | Exoplanet Atmospheres | 2010}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Jonathan Tennyson | Astronomical Spectroscopy | 2019}}

Beyond the books: Tennyson is the best short treatment of molecular line formation and of why accurate line lists are the limiting ingredient for the cross-correlation technique. Snellen and collaborators' papers introducing high-resolution cross-correlation for exoplanets are worth reading in the original, since the argument for separating by velocity is made cleanly and its limitations stated plainly. On systematics, the sequence of reanalyses of individual well-observed planets — where several groups published incompatible spectra from the same data — is more instructive than any methods paper about how detrending choices propagate. On retrieval, comparing a paper's results under its several model assumptions, where reported, shows the model dependence directly in a way that a single headline number conceals.

## Problems

*Useful numbers: transmission signal $\approx 2R_pH/R_\star^2$, giving $173$ ppm per scale height for a $1.2\,R_{\rm J}$ planet with $H = 500$ km around a Sun-like star, $79$ ppm for a $2.5\,R_\oplus$ sub-Neptune with $H = 300$ km around a $0.5\,R_\odot$ host, $9.9$ ppm for an Earth-size planet with a $15$ km steam scale height around a $0.2\,R_\odot$ host, and $0.22$ ppm for Earth around the Sun; features span $3$–$5$ scale heights; planetary orbital speeds $133$ km s$^{-1}$ at $0.05$ AU and $30$ km s$^{-1}$ at $1$ AU; individual lines resolved above $R\approx25{,}000$; planet-to-star infrared flux ratio $\sim10^{-3}$ for a hot Jupiter.*

**1.** *(Amplitudes.)* **(a)** Compute the transmission signal for a $1.2\,R_{\rm J}$ planet with $H = 500$ km around a $0.8\,R_\odot$ star. **(b)** Compare the hot Jupiter and Earth-analogue entries in the table and state the factor. **(c)** State what that factor implies for the order in which targets have been observed.

**2.** *(Geometries.)* For transmission, emission and phase-resolved spectroscopy: state what region each probes, what it is uniquely able to measure, and its principal cost.

**3.** *(Systematics.)* **(a)** Name three instrumental systematics and explain why each mimics a spectral feature. **(b)** Explain why stacking transits does not remove them. **(c)** State the risk introduced by detrending and name the analogous risk in radial velocity work.

**4.** *(Light source effect.)* **(a)** State the assumption transmission spectroscopy makes about the stellar disc. **(b)** Explain how spots violate it and why the imprinted features appear at molecular wavelengths. **(c)** State why this matters most for the highest-priority targets.

**5.** *(Cross-correlation.)* **(a)** List the three velocity components in a high-resolution spectrum. **(b)** Explain how the technique separates them. **(c)** Give the minimum resolution required and explain what it must resolve.

**6.** *(What it buys.)* Give four capabilities high-resolution cross-correlation provides that low-resolution work does not, and explain the physical basis of each.

**7.** *(What it costs.)* **(a)** Explain why the continuum is lost. **(b)** State what quantities become inaccessible as a result. **(c)** State why combining with low-resolution work is standard practice.

**8.** *(Retrieval.)* **(a)** Describe the forward model and the inverse procedure. **(b)** Name three analyst choices that affect the result. **(c)** State the principal degeneracy and what would break it.

**9.** *(Method.)* **(a)** State the general principle the chapter draws about contaminated measurements. **(b)** Apply it to two techniques in this chapter. **(c)** Give an example from another area of physics.

## Worked answers

**1.** **(a)** $2R_pH/R_\star^2 = 2(1.2\times6.9911\times10^7)(5\times10^5)/(0.8\times6.957\times10^8)^2 = 8.39\times10^{13}/3.10\times10^{17} = 2.71\times10^{-4} = 271$ ppm per scale height. **(b)** $173/0.22 = 786$, so nearly a factor of $800$. **(c)** That the programme necessarily proceeded from hot Jupiters outward — techniques were developed where the signal was largest, and each extension to smaller and cooler planets required pushing the same methods by orders of magnitude rather than inventing new ones.

**2.** *Transmission:* probes the terminator at high altitude and low pressure; uniquely sensitive to anything opaque at altitude, which is why it detects hazes readily; costs little beyond a transit observation but is easily flattened by clouds. *Emission:* probes the dayside at deeper pressures; uniquely able to measure the vertical temperature gradient and hence detect thermal inversions through a sign flip in the features; requires absolute stability across the eclipse and works with a flux ratio of order $10^{-3}$. *Phase-resolved:* probes longitudinal structure; uniquely measures day–night contrast and the hot-spot offset; costs an entire orbit of continuous observation with stability maintained throughout.

**3.** **(a)** Detector position drift, since a sub-pixel shift changes the measured flux in a wavelength-dependent way; charge trapping and persistence, which produce time-dependent flux ramps; and thermal changes altering throughput. Each produces a flux variation that depends on wavelength and time, which is the same form as a planetary spectral feature superimposed on a transit. **(b)** Because they are locked in phase with the observation's structure rather than random with respect to it — the ramp begins when the exposure sequence begins, and the transit sits at a fixed place within it — so repeated visits add them coherently. **(c)** That a sufficiently flexible systematics model absorbs part of the astrophysical signal; the analogue is a Gaussian process activity model absorbing a real planet in radial velocity data.

**4.** **(a)** That the light passing through the planet's atmosphere is representative of the disc-averaged stellar spectrum used as the reference. **(b)** The planet occults one chord; spots or plage elsewhere make the disc average differ from the occulted region, and the ratio carries that stellar difference. The imprinted features appear where the *star's* spectrum has structure, and cool starspots have molecular bands including water — the species most often sought. **(c)** Because temperate rocky planets are found around M dwarfs, M dwarfs are magnetically active, and the effect scales with activity and with the star-to-planet contrast — so it is largest exactly where the science is most valuable, and it is astrophysical rather than instrumental so detrending cannot remove it.

**5.** **(a)** Telluric lines at zero velocity in the observatory frame; stellar lines at the systemic velocity, effectively stationary during a night; and planetary lines Doppler-shifted by orbital motion, $133$ km s$^{-1}$ at $0.05$ AU and changing by tens of km s$^{-1}$ over hours. **(b)** By cross-correlating each exposure against a template of the expected molecular line forest and stacking in the planet's changing rest frame: the planetary signal adds coherently while stationary components smear out. **(c)** About $R = 25{,}000$, which is what is needed to resolve individual molecular lines rather than blending them into bands — the line forest's detailed pattern is what the cross-correlation matches.

**6.** *No stellar subtraction required*, since separation is by velocity, eliminating the systematics class that afflicts differential methods. *Works from the ground*, because telluric lines do not move and are therefore separable. *Unambiguous identification*, because a correlation peak at the right velocity, phase and velocity gradient is far more specific than a broadband amplitude excess. *Wind measurement*, since a net Doppler offset of the planetary signal from the expected orbital velocity records bulk atmospheric flow — typically a few km s$^{-1}$ blueshift on hot Jupiter daysides. *(A fifth: it works on non-transiting planets, giving true masses by measuring the orbital velocity directly.)*

**7.** **(a)** Because removing the stationary stellar and telluric components necessarily removes any broad, slowly varying signal, and the continuum is exactly that. **(b)** Absolute abundances, which require a continuum reference; and cloud-deck levels, which are inferred from where the continuum is truncated. **(c)** Because the weaknesses are complementary: low resolution supplies the continuum and absolute levels while suffering systematics and ambiguity, and high resolution supplies unambiguous identifications and velocities while lacking the continuum — so a combined analysis yields an identified molecule with a measured abundance and a known velocity, which neither provides alone.

**8.** **(a)** The forward model computes a spectrum from assumed abundances, a temperature–pressure profile and cloud properties; retrieval explores that parameter space, usually by Bayesian sampling, returning posterior distributions. **(b)** Priors, especially on clouds and on the temperature profile's flexibility; the parameterisation's complexity, such as whether disequilibrium chemistry or patchy clouds are permitted; and the wavelength range included. **(c)** Abundance against cloud altitude, since a high cloud deck and a low abundance both reduce feature amplitude. It is broken by wavelength coverage extending to where the cloud is transparent, or by an independent constraint on the reference pressure — for instance from a high-resolution line detection or from the planet's known radius and gravity.

**9.** **(a)** When a signal cannot be separated from a contaminant by amplitude, find a coordinate in which they differ — time, wavelength, velocity, polarisation, spatial position, or the phase of a known modulation — because precision fights noise while coordinates defeat contamination. **(b)** High-resolution cross-correlation separates planet from star and from telluric lines in *velocity*, where the planet sits at $133$ km s$^{-1}$ and everything else at zero. Angular differential imaging separates companion from speckle in *sky rotation angle*, since speckles are fixed to the instrument while the sky turns. **(c)** Lock-in amplification: a weak signal is modulated at a chosen reference frequency and detected only in phase with it, so noise at all other frequencies is rejected — the coordinate is the modulation phase, and the gain does not come from a quieter amplifier.$exSpec_master$,
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
