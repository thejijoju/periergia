-- Astronomy & Space · The Expanding Universe — The CMB — "The Relic Radiation".
-- Curated master for
-- astronomy-and-space/expanding-universe/cmb/relic-radiation
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Second chapter of The CMB block. Organised around the claim that the
-- spectrum, not the temperature, is the evidence - a temperature can be
-- produced many ways, a Planck curve to 50 parts per million cannot.
-- The prediction of 1948 and the twenty-year gap before anyone looked;
-- McKellar's 1941 CN measurement of 2.3 K, which was a measurement of
-- the CMB that nobody recognised; Penzias and Wilson in 1965; COBE
-- FIRAS in 1990 and why its residuals settle the steady-state question;
-- the numbers - 2.72548 K, 411 photons per cubic centimetre, ten times
-- the energy density of all starlight; the 3.3621 mK dipole giving
-- 370 km/s and why that is a preferred state of motion rather than a
-- preferred frame; and the undetected mu and y distortions as the next
-- available information. Also the proof that a redshifted blackbody is
-- exactly a blackbody; polarisation as a signal generated only in the
-- last-scattering shell, with E-modes, lensing B-modes and r < 0.036;
-- and Olbers' paradox answered rather than evaded.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/cmb/relic-radiation',
    'research',
    'advanced',
    'read',
    $cmbRelic_master$> The cosmic microwave background is often introduced as "the afterglow of the Big Bang", which makes it sound like a picture. It is better understood as **a measurement** — specifically, the most precise blackbody spectrum ever recorded, matching the Planck function to better than **fifty parts per million** across its peak. That single fact does more work than any image, because a temperature can be produced in many ways and **a spectrum like that can be produced in only one.**

This chapter is about the radiation itself: how it was predicted, missed, found, and finally measured; what its numbers are; and what remains to be extracted from it. The next chapter takes up its anisotropies.

## Predicted, ignored, measured without being recognised, then discovered

The history is worth telling accurately, because the usual compressed version omits the most interesting parts.

**1948: the prediction.** Ralph Alpher and Robert Herman, working out the consequences of Gamow's hot early universe, noted that the radiation that decoupled from matter should still be present, cooled by expansion, and estimated its present temperature at about **5 K**. The prediction was published, and then essentially nothing happened for seventeen years. It was not refuted; it was not tested; it was not remembered. Radio astronomy of the era could plausibly have found a 5 K background, and no one looked.

**1941: the measurement nobody recognised.** Andrew McKellar, analysing absorption lines of interstellar cyanogen (CN) toward $\zeta$ Ophiuchi, found that the molecule's first rotationally excited state was populated. Something was exciting it. From the ratio of line strengths he derived an **excitation temperature of about 2.3 K** — and published it.

That is a measurement of the cosmic microwave background, made seven years before the prediction and twenty-four before the discovery. The CN molecule has a rotational transition at 2.64 mm, which sits near the peak of a 2.7 K blackbody, so interstellar CN is a natural thermometer for exactly this radiation. **The number was correct, published and available. What was missing was any reason to think it meant anything.**

This is worth pausing on. McKellar's result was not ignored through carelessness; it was reported and cited. But an excitation temperature in a particular interstellar cloud is an unremarkable local fact unless one has a reason to suspect a universal radiation field. **A measurement is not evidence until there is a hypothesis it bears on** — and the hypothesis existed, seven years later, in a different literature, and the two were not connected.

**1965: the discovery.** Arno Penzias and Robert Wilson, calibrating a horn antenna at Bell Labs for satellite communications, found an excess antenna temperature of $3.5 \pm 1.0$ K at 4,080 MHz that they could not eliminate. It was isotropic, unpolarised, and constant in time — ruling out the Sun, the Galaxy, and terrestrial interference. They famously evicted a pair of pigeons and cleaned out their droppings, and the signal remained.

Meanwhile at Princeton, Robert Dicke's group had independently reconstructed the Alpher–Herman argument and was **building a detector to look for exactly this signal.** A phone call redirected the discovery. The two papers appeared back to back in 1965: Penzias and Wilson reporting the measurement in famously understated terms, and Dicke, Peebles, Roll and Wilkinson supplying the interpretation.

**1990: the spectrum.** COBE's FIRAS instrument measured the spectrum against an onboard blackbody calibrator and found agreement with a Planck curve at 2.725 K to within the measurement errors — which were tiny. The result was shown at a meeting of the American Astronomical Society and received a standing ovation, an unusual response to a plot of residuals.

```checkpoint
q: McKellar measured a 2.3 K excitation temperature from interstellar CN in 1941 — the CMB, twenty-four years before its discovery. Why is this not usually counted as the discovery?
a: Because the measurement was too imprecise to distinguish 2.3 K from other explanations
x: The precision was adequate and the number close to correct. What was missing was interpretation, not accuracy.
a*: Because a measurement is not evidence for a hypothesis until there is a reason to connect the two, and in 1941 there was no expectation of a universal radiation field for an interstellar excitation temperature to bear on
a: Because the CN result was in fact caused by local heating in that cloud, and its agreement with the CMB is coincidental
x: CN rotational excitation in diffuse clouds is genuinely dominated by the CMB, which is why it remains in use as a thermometer today.
a: Because the measurement was not published in a way the cosmology community could access
x: It was published in a normal journal and cited; the barrier was conceptual, not bibliographic.
hint: Ask what would have to be true for an interstellar excitation temperature to look like a cosmological result.
why: CN has a rotational transition at 2.64 mm, near the peak of a 2.7 K blackbody, so interstellar CN is a natural thermometer for this radiation and is still used as one. McKellar's number was correct and published. But an excitation temperature in one cloud is a local fact about that cloud unless one already suspects a universal radiation field — and the Alpher–Herman prediction of ~5 K did not appear until 1948, in a different literature, and was never connected to it. The general point is that data become evidence only in the presence of a hypothesis they discriminate between. This is why searching archives after a discovery so often turns up the signal already recorded, and why that does not retroactively make the earlier work a discovery.
```

## The spectrum is the argument

Here is the claim this chapter rests on: **the CMB's blackbody spectrum, not its temperature, is what establishes the hot Big Bang.**

The reason is that a temperature is cheap. Any number of mechanisms can produce microwave radiation at a few kelvin — thermal emission from cold dust, integrated radio sources, instrumental effects. Steady-state cosmology's defenders proposed several, most seriously that starlight from an eternal universe is absorbed and re-radiated by cold dust or iron whiskers in intergalactic space.

**A Planck spectrum is not cheap.** It requires that radiation and matter have been in thermal equilibrium, with enough interactions to erase every memory of how the photons were produced. Thermalising a radiation field requires processes that change photon *number* — double Compton scattering and thermal bremsstrahlung — and those require high density. **In the transparent, low-density universe of the last thirteen billion years, no such process operates at any appreciable rate.** The spectrum we see must have been made when the universe was dense, hot and opaque; there is no other way to make it.

Dust re-radiation cannot do it. Dust grains have wavelength-dependent emissivity, so a dust-heated cloud emits a **modified blackbody**, measurably different from a Planck curve — and any realistic distribution of dust temperatures broadens the spectrum further. Getting a pure Planck function out of dust requires that every grain in the universe be at exactly the same temperature and be a perfect absorber at all wavelengths, which is a description of a cavity in equilibrium, not of intergalactic dust.

**FIRAS settled it.** Its measured spectrum is a blackbody at

$$T_0 = 2.72548 \pm 0.00057\ \mathrm{K},$$

with deviations from the Planck function bounded below **50 parts per million** of the peak intensity — about $10^{-4}$ K. It is the most precise blackbody ever measured, in any laboratory or on any sky, and it exceeds the quality of the calibration sources used to test it.

There is a nice detail here about experimental design. FIRAS was a **differential** instrument: it compared the sky with an onboard blackbody calibrator whose temperature could be tuned until the difference vanished. This is why the result is so good. **A null measurement against a controlled reference beats an absolute measurement**, because most systematics affect both arms equally and cancel. It is the same reason a balance beats a spring scale, and it recurs throughout precision physics. The definitive spectrum was obtained from roughly the first nine minutes of usable data; the remaining months went to systematics.

```checkpoint
q: Why is the CMB's blackbody *spectrum*, rather than its temperature, the decisive evidence for a hot dense early universe?
a: Because the temperature has large uncertainties while the spectrum is measured precisely
x: The temperature is known to about two parts in $10^{4}$. Precision is not the issue; discriminating power is.
a*: Because many mechanisms can produce a few-kelvin microwave glow, but a Planck spectrum requires thermal equilibrium maintained by photon-number-changing processes that need densities the universe has not had for 13 billion years
a: Because the spectrum encodes the redshift of last scattering, which the temperature alone does not
x: The spectrum's shape is scale-invariant under redshift — a blackbody stays a blackbody — so it carries no direct redshift information.
a: Because a blackbody spectrum can only be produced by an expanding universe
x: Blackbody spectra are produced routinely in laboratory cavities with no expansion involved. What expansion does is cool it while preserving the shape.
hint: Ask what it takes to erase all memory of how photons were produced.
why: A temperature is easy to arrange: cold dust, unresolved radio sources and instrumental offsets can all supply a few kelvin at microwave wavelengths, and steady-state proposals invoked starlight reprocessed by intergalactic dust or iron whiskers. A Planck spectrum is not easy. Thermalisation requires processes that change photon number — double Compton scattering, thermal bremsstrahlung — which operate only at high density. In the transparent universe of the past 13 billion years they are negligible, so the spectrum must have been made when the universe was dense and opaque. Dust cannot mimic it: grains have wavelength-dependent emissivity and a range of temperatures, giving a modified blackbody measurably unlike a Planck curve. FIRAS bounded deviations below 50 parts per million, which no reprocessing model reaches.
---
q: FIRAS compared the sky against an onboard blackbody calibrator tuned until the difference vanished, rather than measuring the sky's brightness absolutely. Why does that design produce a better result?
a: Because a calibrator can be made brighter than the sky, improving the signal-to-noise ratio
x: The calibrator is matched to the sky's brightness, not made to exceed it. Signal strength is not the mechanism.
a*: Because most systematic errors — gain drifts, emissivity uncertainties, thermal effects in the optics — act on both arms alike and cancel in the difference, so a null measurement against a controlled reference is far more robust than an absolute one
a: Because differential measurements avoid the need to know the instrument's absolute temperature
x: The calibrator's absolute temperature must be known precisely; that is what sets the scale. What cancels is the instrument's response, not the need for a temperature standard.
a: Because comparing two signals removes the statistical noise, which an absolute measurement cannot
x: Differencing does not remove statistical noise — it can increase it. The benefit is entirely in systematics.
hint: Ask what a spring scale must know that a balance does not.
why: An absolute brightness measurement requires knowing the instrument's gain, its optical emissivity, its thermal emission and its losses, each to the target precision — errors that enter directly. A differential instrument compares the sky with a reference whose temperature is adjustable, and tunes for a null. Whatever multiplies the sky signal multiplies the reference signal equally, so gain drifts and most optical systematics cancel; only the reference's absolute temperature must be known well, and a physical blackbody in a controlled enclosure is precisely the thing one can know well. This is why a balance beats a spring scale, why Eötvös experiments are differential, and why FIRAS obtained a 50-ppm result from about nine minutes of usable data — with the remaining months spent characterising what did not cancel.
```

{{image: Cosmic Background Explorer | The satellite whose FIRAS instrument measured the spectrum of the cosmic microwave background against an onboard blackbody calibrator, finding agreement with a Planck curve at 2.72548 K. The error bars are smaller than the plotted line width — deviations are bounded below fifty parts per million of the peak — which makes this the most precise blackbody spectrum ever recorded. The significance is that thermalisation to this standard requires photon-number-changing processes operating at high density, so no mechanism available in a transparent universe can produce it.}}

## The numbers

The CMB's basic quantities follow from the temperature alone, and they are worth having.

| Quantity | Value |
| --- | --- |
| Temperature | $2.72548 \pm 0.00057$ K |
| Photon number density | 411 cm⁻³ |
| Energy density | $4.17\times10^{-14}$ J m⁻³ = 0.26 eV cm⁻³ |
| $\Omega_\gamma$ | $5.4\times10^{-5}$ |
| Peak wavelength (Wien) | 1.06 mm |
| Mean photon energy | 0.63 meV |
| Photons per baryon | $1.6\times10^{9}$ |

Several of these are worth commenting on.

**411 photons per cubic centimetre** is a large number by any local standard. There are about 400 CMB photons in every cubic centimetre of the room you are in, passing through unimpeded. Roughly 1% of the static on an untuned analogue television was this radiation, which is as direct an encounter with the early universe as most people will have.

**$\Omega_\gamma = 5.4\times10^{-5}$** — the CMB contributes a twenty-thousandth of the present energy density. It is dynamically negligible today, and it dominated everything before $z = 3402$. That reversal is a direct consequence of $\rho_r \propto a^{-4}$ against $\rho_m \propto a^{-3}$, and it is the whole reason there is a radiation era.

**Ten times the energy of all starlight.** Summed over cosmic history, the extragalactic background light from every star that has ever shone amounts to about $4\times10^{-15}$ J m⁻³. The CMB carries an order of magnitude more. **The dominant radiation field in the universe was made in the first 372,000 years, and thirteen billion years of stars have not caught up** — largely because starlight is produced by converting only a small fraction of a small fraction of the baryons, while the CMB is what the whole radiation content of the early universe cooled into.

**$1.6\times10^{9}$ photons per baryon** is the ratio $1/\eta$, met three chapters ago and responsible for both the deuterium bottleneck and the recombination delay. It is the same number appearing for the fourth time.

## Why a redshifted blackbody is still a blackbody

One step in the argument has been assumed and deserves a demonstration, because it is not obvious and because the conclusion is unusually clean.

Expansion redshifts every photon: $\nu \to \nu/a$. Why should a Planck spectrum survive that unchanged in form, rather than being smeared into something else?

Work with the **occupation number** $f(\nu)$ — the mean number of photons per quantum state — rather than the intensity. For a blackbody,

$$f(\nu) = \frac{1}{e^{h\nu/kT}-1}.$$

Now expand by a factor $a$. Two things happen together. Every frequency falls as $\nu \to \nu/a$. And the density of available states falls as $a^{-3}$, exactly matching the dilution of the photons themselves. **The occupation number of a given state is therefore unchanged** — photons and states are diluted identically, and nothing is created or destroyed.

So $f$ retains its functional form with $h\nu/kT$ held fixed, which requires

$$T \to T/a.$$

**A blackbody at temperature $T$ becomes a blackbody at temperature $T/a$, exactly, with no distortion whatever.** No fine-tuning is involved and no interaction is needed; it follows from photon number conservation and the fact that a Planck spectrum depends on frequency and temperature only through their ratio.

Two consequences are worth extracting.

**The spectrum carries no information about the redshift it has undergone.** Because the shape is preserved exactly, a blackbody at 2.7 K is indistinguishable from a blackbody at 2.7 K, however it got there. This is why $T(z) = T_0(1+z)$ has to be tested by other means — excitation temperatures and the Sunyaev–Zel'dovich effect — rather than read off the present spectrum.

**Any deviation from a blackbody is therefore informative.** Since expansion cannot introduce a distortion, any distortion must have been imposed by a physical process — energy injection, photon-number violation, or scattering by hot gas. The spectrum is a **clean channel**: the background is a perfect Planck curve, and everything else is signal. This is what makes the $\mu$ and $y$ limits meaningful, and it is a rarer situation than it sounds.

```checkpoint
q: Why does a blackbody spectrum remain exactly a blackbody as the universe expands, rather than being distorted?
a: Because Compton scattering continuously re-thermalises the radiation as it cools
x: Scattering is negligible after decoupling, and the shape is preserved regardless — no maintenance is required.
a*: Because expansion redshifts frequencies as $1/a$ while diluting photons and available states identically, so the occupation number of each state is unchanged — and a Planck spectrum depends on $\nu$ and $T$ only through their ratio
a: Because the expansion is slow enough to be adiabatic, so the spectrum has time to adjust
x: The result is exact and independent of the expansion rate; no adiabatic approximation is involved.
a: Because photons of all frequencies redshift by the same fractional amount, preserving any spectrum's shape
x: Uniform fractional redshift is necessary but not sufficient — an arbitrary spectrum shifted this way is generally *not* self-similar. The Planck form's dependence on $h\nu/kT$ is what makes it work.
hint: Count photons and count states, and ask what happens to their ratio.
why: The occupation number $f(\nu) = [e^{h\nu/kT}-1]^{-1}$ is the number of photons per quantum state. Under expansion by a factor $a$, frequencies fall as $\nu/a$, photon number densities fall as $a^{-3}$, and the density of states falls as $a^{-3}$ too. Photons and states dilute identically, so $f$ for a given state is unchanged. Holding $f$ fixed while $\nu \to \nu/a$ requires $T \to T/a$, and the Planck form is recovered exactly. Two things follow. The present spectrum carries no record of the redshift it underwent, which is why $T(z) = T_0(1+z)$ must be tested by excitation temperatures and the SZ effect instead. And because expansion cannot introduce a distortion, any distortion is a signal — which is what makes the $\mu$ and $y$ limits meaningful.
```

## The dipole, and what it does not mean

The CMB is isotropic to about one part in $10^{5}$ — with one exception, larger by two orders of magnitude.

There is a **dipole**: one side of the sky is hotter than the other by

$$\Delta T = 3.3621 \pm 0.0010\ \mathrm{mK},$$

with a smooth cosine variation between. The interpretation is straightforward: it is a Doppler shift from our motion. Solving $\Delta T/T = v/c$ gives

$$v = 370\ \mathrm{km\ s^{-1}},$$

the Solar System's velocity with respect to the frame in which the CMB is isotropic. Adding the Sun's orbit about the Galaxy and the Galaxy's motion within the Local Group gives the Local Group moving at about **620 km s⁻¹** toward Hydra–Centaurus — the motion the Superclusters chapter attributed to the Great Attractor and the Shapley Concentration.

Now the misconception, which is common and worth dismantling carefully.

The CMB defines a frame in which it looks isotropic. **Does this not violate relativity, which says there is no preferred frame?**

No, and the resolution turns on a distinction. Special relativity says the **laws of physics** take the same form in every inertial frame. It does not say that the **contents** of the universe fail to pick out a state of motion. A room full of air defines a rest frame — the one in which the air has no bulk velocity — and measuring your speed relative to it violates nothing. The CMB is the same: a material distribution with a definite mean velocity.

**A preferred state of motion is not a preferred frame.** The laws by which the dipole is computed are the ordinary Lorentz transformations; nothing about them singles out the CMB frame. What is singled out is a particular *stuff*, and stuff has always had rest frames. The confusion arises because the CMB's frame is nearly the same as the frame in which the universe looks homogeneous and isotropic — which makes it uniquely convenient, but convenience is not privilege.

There is one genuine subtlety. Because the dipole is a Doppler effect, our motion also produces smaller **aberration and modulation** effects on the higher multipoles, at order $v/c \approx 10^{-3}$. These have been detected by Planck, confirming that the dipole is kinematic rather than a primordial feature of the radiation. **That check matters**, because a primordial dipole would mean something quite different, and the possibility was live until the aberration measurement.

```checkpoint
q: The CMB dipole defines a frame in which the radiation is isotropic. Does this conflict with special relativity's rejection of a preferred frame?
a: Yes, and the resolution is that special relativity applies only locally, while the CMB frame is a global construct
x: The dipole is measured locally, and no appeal to global structure is needed to explain it. Nothing requires special relativity to be suspended.
a*: No — relativity says the *laws* take the same form in every inertial frame, not that the universe's contents fail to pick out a state of motion. A room full of air also defines a rest frame, and measuring one's speed relative to it violates nothing
a: No, because the CMB frame is not inertial, being defined by an expanding radiation field
x: The distinction between preferred laws and preferred stuff is what resolves it; whether the frame is exactly inertial is a separate and much smaller technicality.
a: Yes in principle, but the effect is too small to matter observationally
x: The dipole is 3.36 mK, easily measured and long since detected. There is nothing small about it, and nothing to excuse.
hint: Distinguish what relativity says is frame-independent from what merely exists in the universe.
why: Special relativity asserts the form-invariance of physical laws under Lorentz transformations. It says nothing about whether the matter and radiation in the universe happen to have a mean velocity — and they do. The CMB is a material distribution with a definite bulk motion, exactly like the air in a room, and measuring one's velocity relative to it is ordinary physics. The transformation used to extract $v = 370$ km s⁻¹ from $\Delta T/T$ is itself the standard Lorentz one, which does not privilege any frame. The CMB's frame is unusually convenient because it nearly coincides with the frame in which the universe looks homogeneous, but convenience is not privilege. Planck's detection of the accompanying aberration and modulation of the higher multipoles at order $v/c$ confirms the dipole is kinematic rather than primordial.
```

## Polarisation

The CMB is not merely a temperature field. It is **linearly polarised**, at the few-per-cent level, and the polarisation carries information the temperature does not.

The mechanism is Thomson scattering, which has a crucial property: **it produces polarisation only if the radiation incident on the scattering electron has a quadrupole anisotropy.** An electron bathed in perfectly isotropic radiation scatters unpolarised light. So does one in a radiation field with only a dipole, because the dipole's contributions cancel by symmetry. A quadrupole does not cancel, and the scattered light is polarised.

This immediately explains why the effect is small. **In a tightly coupled plasma, quadrupoles cannot develop**: photons scatter so frequently that the radiation field is isotropic in the local rest frame. A quadrupole requires photons to stream across a significant fraction of a perturbation wavelength before scattering — which happens only when the mean free path grows comparable to the perturbation scale, i.e. **only during the brief interval when recombination is under way and decoupling is occurring.**

**CMB polarisation is generated exclusively in the last-scattering shell**, and its amplitude is set by how thick that shell is. The signal is therefore a direct probe of the recombination history, and it would vanish entirely if decoupling were instantaneous. The previous chapter's 46,000-year shell is not an inconvenience to be corrected for; **it is what makes the polarisation exist at all.**

The polarisation field decomposes into two patterns with different symmetry:

**E-modes**, with a curl-free pattern — polarisation aligned radially or tangentially around hot and cold spots. These are produced by density perturbations, which is to say by the same acoustic physics that makes the temperature peaks. They were first detected by **DASI in 2002**, and their peaks fall out of phase with the temperature peaks, which is exactly what the acoustic picture predicts: temperature peaks correspond to maximum compression, where the fluid velocity is zero, while polarisation is generated by velocity gradients and therefore peaks where the temperature does not. **The phase relationship is a strong test and it passes.**

**B-modes**, with a curl pattern that density perturbations cannot produce at all. Two sources exist. **Gravitational lensing** of E-modes by intervening structure converts some into B-modes, and this has been detected. **Primordial gravitational waves** from inflation would produce B-modes directly, at large angular scales — which is why B-mode searches have attracted such effort. None has been found: the tensor-to-scalar ratio is bounded at $r < 0.036$.

The BICEP2 episode of 2014 is worth recording. A B-mode detection was announced and widely reported as evidence for inflation, then withdrawn when joint analysis with Planck showed the signal was consistent with **polarised emission from Galactic dust**. The lesson is not that the experiment was careless — it was excellent — but that **the foreground was assessed in a region chosen for its low dust content using dust maps that were themselves inadequate at the required precision.** The failure was in an input, not in the instrument, which is a recurring pattern: the same structure as the distance ladder's dependence on parallaxes and nucleosynthesis's on a nuclear cross-section.

```checkpoint
q: Thomson scattering polarises light only when the incident radiation has a quadrupole anisotropy. What follows for where CMB polarisation is generated?
a: It is generated throughout the plasma era, wherever perturbations exist
x: In the tightly coupled plasma, frequent scattering keeps the local radiation field isotropic, so no quadrupole and no polarisation develops.
a*: Only in the last-scattering shell, because a quadrupole requires photons to stream across an appreciable fraction of a perturbation wavelength before scattering — which happens only as the mean free path grows during decoupling
a: Only after decoupling, when photons finally travel freely and can develop anisotropies
x: After decoupling there are too few electrons left to scatter, so no polarisation can be imprinted. It must be generated while some scattering still occurs.
a: Throughout the line of sight, by scattering off intergalactic gas after reionization
x: Reionization does add a polarisation signal at large angular scales, but the main signal comes from last scattering, and the question concerns the mechanism's requirement.
hint: Ask what frequent scattering does to the local radiation field, and when it stops doing it.
why: An electron in isotropic radiation scatters unpolarised light, and a pure dipole cancels by symmetry, so a quadrupole is required. In the tightly coupled plasma photons scatter far too often for a quadrupole to survive — the radiation is isotropic in the local rest frame. A quadrupole develops only when the photon mean free path becomes comparable to a perturbation's wavelength, which occurs precisely as recombination proceeds and decoupling sets in. CMB polarisation is therefore generated in the last-scattering shell and nowhere else, and its amplitude depends on the shell's thickness. It would be zero if decoupling were instantaneous — so the 46,000-year shell is not a blurring nuisance but the very thing that makes the signal exist, and the polarisation is a direct probe of the recombination history.
---
q: B-modes cannot be produced by density perturbations. What is the significance of that, and what is the current status?
a: It means any B-mode detection would be evidence for inflation, which is why the search continues
x: Gravitational lensing of E-modes also produces B-modes and has been detected, so a detection alone is not evidence for inflation — the angular scale and spectrum matter.
a*: It makes B-modes a clean channel for primordial gravitational waves, since scalar perturbations contribute none — though lensing of E-modes also generates them, and the primordial signal remains undetected at $r < 0.036$
a: It means the CMB polarisation is purely E-mode, and any B-mode signal must be instrumental
x: Lensing B-modes are real and measured; treating all B-modes as instrumental would discard a detected cosmological signal.
a: It shows that inflation did not occur, since no primordial B-modes have been found
x: Non-detection bounds the tensor-to-scalar ratio but does not exclude inflation, many models of which predict $r$ well below current limits.
hint: Ask what kinds of perturbation can generate a curl pattern, and which of them have been observed.
why: Scalar (density) perturbations produce only curl-free E-mode patterns, by symmetry. Tensor perturbations — gravitational waves — produce both, so B-modes at large angular scales are a channel in which the enormous scalar signal does not compete. That is what makes them the most direct available probe of inflation. Two complications: gravitational lensing converts E-modes into B-modes at small angular scales, a real and detected signal that must be separated; and Galactic dust emits polarised radiation with a B-mode component. The 2014 BICEP2 announcement failed on exactly the second point — joint analysis with Planck showed the signal was consistent with dust. The current bound is $r < 0.036$, which excludes some inflationary models and leaves many others untouched.
```

## What has not been measured: spectral distortions

FIRAS bounded departures from a perfect blackbody, and found none. But the bounds are not zero, and standard cosmology predicts distortions just below them. **This is the CMB's remaining unexploited information.**

Two kinds are expected, distinguished by when the energy was injected.

**$\mu$-distortions** arise from energy released between $z \approx 2\times10^{6}$ and $z \approx 5\times10^{4}$. In this window, Compton scattering is fast enough to redistribute photon *energies* into a Bose–Einstein distribution, but the number-changing processes that would restore a true Planck spectrum have become too slow. The result is a blackbody with a non-zero chemical potential $\mu$. FIRAS bounds $|\mu| < 9\times10^{-5}$; the standard prediction, from the damping of small-scale acoustic waves alone, is around $2\times10^{-8}$.

**$y$-distortions** arise from energy injected after $z \approx 5\times10^{4}$, when even energy redistribution is incomplete. Photons are up-scattered by hot electrons, moving intensity from the Rayleigh–Jeans side to the Wien side. FIRAS bounds $|y| < 1.5\times10^{-5}$; the expected value, dominated by the hot gas in galaxy clusters and the warm–hot intergalactic medium, is about $2\times10^{-6}$.

Why these matter is that the two carry **different time information**. A distortion is not merely a sign that energy was injected; its type dates the injection, because the boundary at $z \approx 5\times10^{4}$ is set by which thermalisation process was still operating. **The spectrum is therefore a clock as well as a thermometer**, and it reaches epochs the anisotropies cannot: $\mu$ probes $z$ up to $2\times10^{6}$, a hundredfold deeper than recombination.

The measurable payoffs would be substantial. The $\mu$-distortion from acoustic damping measures the primordial power spectrum at scales far smaller than the CMB anisotropies can reach — wavenumbers up to $10^{4}$ Mpc⁻¹, against the anisotropies' 0.2 — testing inflation over a range otherwise inaccessible. Decaying or annihilating particles would inject energy and show up. So would any deviation from the standard recombination history.

Nothing has been detected, and no approved mission will detect the standard signals. Proposed spectrometers such as PIXIE would improve on FIRAS by three orders of magnitude, which would reach the predicted $y$ comfortably and the predicted $\mu$ marginally. **This is a case where the theory is well ahead of the measurement, and where the size of the target is known in advance** — an unusually favourable position, and the reason the proposals keep being made.

```checkpoint
q: Why do $\mu$-distortions and $y$-distortions correspond to different epochs of energy injection?
a: Because $\mu$ arises from photon injection and $y$ from electron heating, which happen at different times for unrelated reasons
x: Both arise from energy injection into the photon–electron plasma; the distinction is when, not what.
a*: Because they are set by which thermalisation process was still operating — before $z \approx 5\times10^{4}$ Compton scattering could still redistribute photon energies but not their number, giving a Bose–Einstein form; afterwards even that fails and photons are simply up-scattered
a: Because $\mu$-distortions are erased by recombination while $y$-distortions are not
x: Neither is erased by recombination; both survive to the present, which is why FIRAS could bound them.
a: Because the distinction is conventional, marking the epoch before and after matter–radiation equality
x: The boundary at $z \approx 5\times10^{4}$ is set by thermalisation rates, and its near-coincidence with equality is not what defines it.
hint: Ask what a photon bath does with injected energy when it can still share it around, and when it cannot.
why: Restoring a true blackbody requires processes that change photon number — double Compton scattering and bremsstrahlung — which shut off around $z \approx 2\times10^{6}$. Between then and $z \approx 5\times10^{4}$, Compton scattering still redistributes energy efficiently among photons, so injected energy produces a thermal distribution with the wrong number of photons for its temperature: a Bose–Einstein spectrum with chemical potential $\mu$. Below $z \approx 5\times10^{4}$ even that redistribution becomes incomplete, so injected energy leaves the characteristic $y$-type shape — intensity moved from the Rayleigh–Jeans to the Wien side. The type of distortion therefore dates the injection, making the spectrum a clock as well as a thermometer, and $\mu$ reaches back to $z \approx 2\times10^{6}$ — a hundred times deeper than recombination.
---
q: FIRAS bounds $|\mu| < 9\times10^{-5}$ while standard cosmology predicts $\mu \approx 2\times10^{-8}$. How should this gap be regarded?
a: As evidence that the predicted distortions do not exist, since three orders of magnitude of searching found nothing
x: FIRAS is not three orders of magnitude more sensitive than the prediction — it is three orders of magnitude *less*. Nothing has been searched at the relevant level.
a*: As an unusually favourable position for a future experiment, since the target size is predicted in advance and a three-order-of-magnitude improvement in sensitivity would reach it
a: As a reason to doubt the prediction, since a signal so far below current limits is untestable in principle
x: It is testable in practice — proposed spectrometers such as PIXIE would improve on FIRAS by roughly the required factor.
a: As a systematic error in FIRAS, whose calibration cannot support limits this tight
x: FIRAS's limits are well established; the issue is that they are far above the predicted signal, not that they are unreliable.
hint: Compare the bound with the prediction and ask which is larger.
why: The bound exceeds the prediction by more than three orders of magnitude, so FIRAS did not test the standard signal at all — it simply was not sensitive enough. That is a very different situation from a null result at the predicted level. What makes it favourable is that the target is calculable in advance: $\mu \approx 2\times10^{-8}$ from acoustic-wave damping alone, and $y \approx 2\times10^{-6}$ from cluster and intergalactic gas. An experiment improving on FIRAS by three orders of magnitude reaches $y$ comfortably and $\mu$ marginally, and either a detection or a null result at that level would be informative. Knowing the size of the signal you are looking for before you look is a considerable advantage, and it is why spectrometer proposals continue to be made despite none being approved.
```

{{image: Holmdel Horn Antenna | The 6-metre horn reflector at Bell Laboratories with which Penzias and Wilson found an unexplained excess antenna temperature of 3.5 K at 4,080 MHz in 1965. Its design — a horn feeding a reflector, with a very small response outside the main beam — is what made the result credible, since it strongly suppressed ground pickup and left few places for a spurious signal to enter. The excess was isotropic, unpolarised and constant in time, which excluded the Sun, the Galaxy and terrestrial interference.}}

## Temperature against redshift

One prediction of the framework is checkable and has been checked: since a blackbody redshifts into a cooler blackbody, the CMB should have been hotter in the past by exactly

$$T(z) = T_0(1+z).$$

Two methods test this directly.

**Molecular and atomic excitation.** The same technique McKellar used unknowingly in 1941, applied to absorbers in front of distant quasars. Carbon and CO in systems out to $z \approx 3$ give excitation temperatures matching the prediction.

**The Sunyaev–Zel'dovich effect.** The spectral distortion imposed on the CMB by hot cluster gas depends on the ratio of the CMB temperature to the electron temperature, so measuring the SZ signal of clusters at a range of redshifts constrains $T(z)$ independently. Results out to $z \approx 1$ agree.

Writing $T(z) = T_0(1+z)^{1-\beta}$, the constraint is $\beta = 0.00 \pm 0.03$. **Consistent with the prediction at the few-per-cent level.**

The value of this test is that it constrains alternatives which would otherwise be hard to exclude. A universe in which photon number is not conserved — through decaying particles, or photon–axion mixing, or "tired light" models in which photons lose energy en route — would generically produce a different scaling. **The measurement does not merely confirm something obvious; it closes a class of alternatives that the spectrum alone does not.**

## Why the night sky is dark

A closing observation that reframes the whole chapter.

Olbers' paradox asks why the night sky is dark. In an infinite, eternal, static universe uniformly filled with stars, every line of sight eventually terminates on a stellar surface, so the sky should be as bright as the surface of a star in every direction.

The standard resolution invokes finite age: the universe is 13.8 billion years old, so most lines of sight have not had time to reach a star. That is correct as far as it goes. But there is a sharper way to put it, and the CMB supplies it.

**Every line of sight does terminate on a hot surface.** It is the last-scattering shell, and it covers the entire sky without a gap — an opaque wall at 3,000 K, which is roughly the surface temperature of a cool star. Olbers' geometric argument is essentially right: the sky *is* completely covered by a glowing surface.

**The sky is dark because that surface is redshifted by a factor of 1,090.** Its 3,000 K blackbody arrives as a 2.7 K blackbody, with the peak moved from the near-infrared to 1.06 mm and the surface brightness reduced by $(1+z)^4$ — a factor of $1.4\times10^{12}$.

So the resolution is not that the sky is empty but that **it is bright in the microwave and dark in the optical**, and the difference is expansion. Olbers' paradox is not evaded; it is answered, and the answer is a measurement. The night sky is uniformly filled with the light of a hot surface, exactly as the paradox demands, and a microwave receiver sees it.

```checkpoint
q: How does the existence of the CMB reframe Olbers' paradox?
a: It confirms that the sky is not uniformly filled with sources, since the CMB is a single background rather than many stars
x: The CMB is precisely a uniform covering of the sky by a hot surface — the opposite of the claim that the sky is not filled.
a*: It shows the paradox's geometric premise is correct — every line of sight does end on a hot surface, the last-scattering shell — and the sky is dark only because that surface is redshifted by a factor of 1,090
a: It resolves the paradox by showing the universe is finite in extent, so lines of sight need not terminate
x: The observable universe is bounded, but the paradox is about whether lines of sight terminate on sources, and here they all do.
a: It is unrelated, since Olbers' paradox concerns stars and the CMB is not starlight
x: The paradox is about whether the sky is covered by hot emitting surfaces, whatever they are; the CMB shows it is.
hint: Ask what a line of sight in an arbitrary direction actually ends on.
why: The paradox reasons that in a universe uniformly filled with sources every line of sight terminates on a hot surface, so the sky should be as bright as that surface. In the actual universe every line of sight does terminate — on the last-scattering shell, an opaque wall at about 3,000 K covering the whole sky without a gap. The geometric argument is sound. What defeats the conclusion is redshift: a factor of 1,090 moves the peak from the near-infrared to 1.06 mm and reduces the surface brightness by $(1+z)^4 = 1.4\times10^{12}$. The night sky is therefore not empty but simply not optical — it is uniformly bright in the microwave, and a receiver tuned there sees exactly the blazing sky Olbers demanded.
```

## Pulling the thread

- **The spectrum, not the temperature, is the evidence.** Many mechanisms produce a few-kelvin microwave glow; only thermal equilibrium at high density produces a Planck curve. FIRAS bounds deviations below **50 parts per million** at $T_0 = 2.72548 \pm 0.00057$ K — **the most precise blackbody ever measured.**
- The history is instructive. Predicted at ~5 K in **1948** and ignored for seventeen years; **measured in 1941** by McKellar as a 2.3 K CN excitation temperature and not recognised, because **data become evidence only in the presence of a hypothesis they bear on**; discovered by Penzias and Wilson in **1965** while a Princeton group was building a detector to look for it.
- FIRAS was **differential**, nulling the sky against a tunable onboard blackbody. **A null measurement against a controlled reference beats an absolute one**, because most systematics cancel — the reason a balance beats a spring scale.
- The numbers: **411 photons cm⁻³**, $4.17\times10^{-14}$ J m⁻³, $\Omega_\gamma = 5.4\times10^{-5}$, peak at 1.06 mm, and **ten times the energy density of all starlight ever emitted.** Also $1.6\times10^{9}$ photons per baryon — the same $1/\eta$ that delayed deuterium and recombination.
- The **3.3621 mK dipole** gives $v = 370$ km s⁻¹ for the Solar System and 620 km s⁻¹ for the Local Group toward Hydra–Centaurus. **A preferred state of motion is not a preferred frame**: relativity constrains the form of laws, not whether the universe's contents have a mean velocity. Planck's detection of the accompanying aberration confirms the dipole is kinematic.
- **$\mu$- and $y$-distortions are the CMB's remaining unexploited information**, and their *type* dates the energy injection because the boundary at $z \approx 5\times10^{4}$ is set by which thermalisation process still worked. FIRAS bounds sit three orders of magnitude above the predicted $\mu \approx 2\times10^{-8}$, so **the standard signal has not been tested at all.**
- $T(z) = T_0(1+z)$ is confirmed to $\beta = 0.00 \pm 0.03$ by excitation temperatures and the SZ effect, **closing a class of alternatives the spectrum alone leaves open.**

- **A redshifted blackbody is exactly a blackbody**, because photons and available states dilute identically so the occupation number is preserved, and the Planck form depends on $\nu$ and $T$ only through their ratio. Consequently the present spectrum records nothing of the redshift it underwent — and **any distortion must be a signal**, which is what makes the $\mu$ and $y$ limits meaningful.
- The CMB is **linearly polarised**, and Thomson scattering polarises only in the presence of a quadrupole — which the tightly coupled plasma cannot sustain. **Polarisation is generated exclusively in the last-scattering shell**, so the 46,000-year thickness is not a nuisance but the reason the signal exists. E-modes were detected in 2002 and peak out of phase with the temperature, as the acoustic picture requires; **B-modes** admit no scalar contribution, making them the cleanest channel for inflationary gravitational waves, currently bounded at $r < 0.036$.
- **Olbers' paradox is answered, not evaded.** Every line of sight does terminate on a hot surface — the last-scattering shell at 3,000 K, covering the sky without a gap. The sky is dark only because that surface is redshifted by 1,090, reducing its surface brightness by $1.4\times10^{12}$. **The night sky is uniformly bright, in the microwave.**

The transferable idea: **the informative feature of a measurement is usually its shape, not its magnitude.** A number can be reproduced by many mechanisms and therefore discriminates weakly; a functional form typically cannot. The steady-state alternatives could all produce 3 K, and none could produce a Planck curve to 50 ppm — so the temperature was suggestive and the spectrum was decisive. The same asymmetry appears throughout: an exponential decay curve identifies a process where the half-life alone does not; a power-law tail identifies a mechanism where the mean does not; a blackbody identifies equilibrium where a brightness does not. **When designing a test, ask what functional form your hypothesis predicts and whether the alternatives predict a different one** — and if they do not, the measurement will not settle anything, however precise it is.

## Further reading

{{book: Marcus Chown | Afterglow of Creation | 1993}}

{{book: George Smoot and Keay Davidson | Wrinkles in Time | 1993}}

{{book: P. J. E. Peebles, Lyman Page and Bruce Partridge | Finding the Big Bang | 2009}}

Beyond the books: *Finding the Big Bang* is the essential source, collecting first-person accounts from nearly everyone involved along with the original papers, and it is far more candid about the confusions of the period than any secondary account. The two 1965 papers — Penzias and Wilson's measurement and Dicke, Peebles, Roll and Wilkinson's interpretation — occupy about six pages between them and are worth reading in the original. Chluba and Sunyaev's review of spectral distortions is the standard entry point to what remains to be measured.

## Problems

*Useful numbers: $T_0 = 2.72548$ K; $a_{\rm rad} = 7.566\times10^{-16}$ J m⁻³ K⁻⁴; $n_\gamma = 411$ cm⁻³; $\rho_c = 8.53\times10^{-27}$ kg m⁻³; dipole $3.3621$ mK; FIRAS limits $|\mu| < 9\times10^{-5}$, $|y| < 1.5\times10^{-5}$; predicted $\mu \approx 2\times10^{-8}$, $y \approx 2\times10^{-6}$; EBL $\approx 4\times10^{-15}$ J m⁻³; $\eta = 6.1\times10^{-10}$; Wien constant $2.898\times10^{-3}$ m K.*

**1.** *(The energetics.)* **(a)** Compute the CMB energy density from $u = a_{\rm rad}T_0^4$. **(b)** Compute $\Omega_\gamma$. **(c)** Compare with the integrated starlight and comment.

**2.** *(Why the spectrum.)* **(a)** State two mechanisms that could produce a few-kelvin microwave background. **(b)** Explain what a Planck spectrum additionally requires and why the present universe cannot supply it. **(c)** Explain specifically why dust re-radiation fails.

**3.** *(Differential design.)* **(a)** Describe FIRAS's measurement scheme. **(b)** Explain which errors cancel and which do not. **(c)** Give one other example of the same design principle and state what it buys.

**4.** *(Recognition.)* **(a)** State what McKellar measured and when. **(b)** Explain why it works physically. **(c)** Explain why it is not counted as the discovery, and state the general principle.

**5.** *(The dipole.)* **(a)** Compute $v$ from $\Delta T/T$. **(b)** State the Local Group's velocity and direction and what causes it. **(c)** Address the claim that the CMB frame violates special relativity.

**6.** *(Kinematic or primordial?)* **(a)** State what else our motion produces besides the dipole, and at what order. **(b)** Explain why detecting it matters. **(c)** State what a primordial dipole would have implied.

**7.** *(Distortions.)* **(a)** Define $\mu$- and $y$-distortions and give the epoch of each. **(b)** Explain what sets the boundary between them. **(c)** State the current limits against the predictions and assess the situation.

**8.** *(Temperature scaling.)* **(a)** State the predicted $T(z)$ and the two methods of testing it. **(b)** Give the current constraint. **(c)** Explain what class of alternatives this closes that the spectrum alone does not.

**9.** *(Shape over magnitude.)* **(a)** State why the temperature discriminated weakly between models. **(b)** State why the spectrum discriminated strongly. **(c)** Give the general principle and two examples from outside cosmology.

## Worked answers

**1.** **(a)** $u = (7.566\times10^{-16})(2.72548)^4 = (7.566\times10^{-16})(55.18) = \mathbf{4.17\times10^{-14}\ J\ m^{-3}}$, or 0.26 eV cm⁻³. **(b)** The equivalent mass density is $u/c^2 = 4.17\times10^{-14}/9\times10^{16} = 4.6\times10^{-31}$ kg m⁻³, so $\Omega_\gamma = 4.6\times10^{-31}/8.53\times10^{-27} = \mathbf{5.4\times10^{-5}}$. **(c)** The extragalactic background light — every photon emitted by every star in cosmic history — is about $4\times10^{-15}$ J m⁻³, so **the CMB carries ten times as much energy**. The dominant radiation field in the universe was laid down in the first 372,000 years, and thirteen billion years of stellar burning has not caught up. The reason is that starlight comes from converting a small fraction of a small fraction of the baryons, whereas the CMB is what the entire radiation content of the hot early universe cooled into. Note also that $\Omega_\gamma \propto a^{-4}$ against matter's $a^{-3}$: this negligible component dominated everything before $z = 3402$.

**2.** **(a)** Thermal emission from cold intergalactic **dust** heated by starlight — the standard steady-state proposal, sometimes with iron whiskers as the absorber — and the superposed emission of **unresolved radio sources**. Instrumental offsets are a third possibility, excluded by Penzias and Wilson's checks. **(b)** A Planck spectrum requires **thermal equilibrium** maintained by processes that change photon *number*: double Compton scattering and thermal bremsstrahlung. Only these can bring an arbitrary photon distribution to a true blackbody, and both require **high density**. In the transparent, dilute universe of the past 13 billion years their rates are utterly negligible, so a blackbody cannot be manufactured now; it must be a relic of an epoch that was dense, hot and opaque. **(c)** Because dust grains have **wavelength-dependent emissivity**, so a dust cloud radiates a *modified* blackbody — measurably distinct from a Planck curve — and any realistic distribution of grain temperatures broadens the spectrum further. Producing a pure Planck function from dust would require every grain in the universe to be at identical temperature and to be a perfect absorber at all wavelengths, which is a description of an equilibrium cavity rather than of intergalactic dust. FIRAS's 50-ppm bound is far tighter than any such model can reach.

**3.** **(a)** FIRAS was a **differential** instrument. It viewed the sky and an onboard blackbody calibrator alternately, and the calibrator's temperature was adjusted until the measured difference vanished. The reported spectrum is the null point, not an absolute brightness. **(b)** **Cancelling**: instrument gain and its drift, optical emissivity, thermal emission from the optics, and losses in the signal path — anything that multiplies or adds equally to both arms. **Not cancelling**: the calibrator's own absolute temperature, any asymmetry between the two optical paths, and detector nonlinearity. Consequently the accuracy is limited by how well a physical blackbody in a controlled enclosure can be characterised — which is very well. **(c)** A **beam balance** compares an unknown mass against a reference, so variations in local gravity, buoyancy and lever geometry largely cancel, whereas a spring scale must know its spring constant absolutely and is sensitive to temperature and to $g$. It buys **immunity to the multiplicative systematics that dominate absolute measurements**, at the cost of needing a good reference standard. Eötvös-type tests of the equivalence principle use the same principle for the same reason.

**4.** **(a)** In **1941** Andrew McKellar measured the rotational excitation of interstellar cyanogen (CN) toward $\zeta$ Ophiuchi and derived an **excitation temperature of about 2.3 K**. **(b)** CN has a rotational transition at **2.64 mm**, close to the peak of a 2.7 K blackbody, so the CMB efficiently populates its first excited state. Diffuse interstellar clouds have densities too low for collisions to compete, so the CN excitation temperature is set almost entirely by the radiation field — making CN a natural CMB thermometer, still used as one. **(c)** Because **there was no hypothesis for it to be evidence about.** The Alpher–Herman prediction did not appear until 1948, in a different literature, and was never connected to McKellar's result. An excitation temperature in one interstellar cloud is a local fact unless one already suspects a universal radiation field. The general principle: **data become evidence only relative to hypotheses they discriminate between.** This is why searching archives after a discovery so often reveals the signal already recorded, and why that does not make the earlier work a discovery.

**5.** **(a)** $v = c\,\Delta T/T = (3.00\times10^{5}\ \mathrm{km\,s^{-1}})(3.3621\times10^{-3}/2.72548) = \mathbf{370\ km\ s^{-1}}$. **(b)** Removing the Sun's ~220 km s⁻¹ Galactic orbit and the Milky Way's motion within the Local Group gives the **Local Group at about 620 km s⁻¹ toward Hydra–Centaurus**. It is caused by the gravitational pull of the mass concentration in that direction — the Great Attractor region, with a substantial further contribution from the Shapley Concentration behind it, as the Superclusters chapter established. **(c)** The claim confuses two things. Special relativity asserts that the **laws of physics** take the same form in every inertial frame; it does not assert that the **contents** of the universe lack a mean velocity. A room full of air defines a rest frame and measuring one's speed relative to it is unremarkable. The CMB is a material distribution with a bulk velocity, and the transformation used to extract 370 km s⁻¹ is the standard Lorentz one, which privileges no frame. **A preferred state of motion is not a preferred frame.** The CMB frame is uniquely convenient because it nearly coincides with the frame in which the universe looks homogeneous, but convenience is not privilege.

**6.** **(a)** **Aberration** — the apparent angular displacement of features toward the direction of motion — and **modulation** of the higher multipoles' amplitudes, both at order $v/c \approx 1.2\times10^{-3}$. **(b)** Because they distinguish a **kinematic** dipole from a **primordial** one. A dipole intrinsic to the radiation field would produce no aberration of the smaller-scale structure; a Doppler dipole must. Planck detected the effect, confirming the kinematic interpretation. **(c)** A primordial dipole would imply a genuine large-scale asymmetry in the universe — a super-horizon perturbation, or an anisotropic expansion — with consequences for the foundational assumption of homogeneity. It would also mean our velocity is unknown, which would corrupt every measurement that depends on transforming to the CMB frame. The possibility was live until the aberration measurement, which is why the check was worth making rather than a formality.

**7.** **(a)** A **$\mu$-distortion** is a Bose–Einstein spectrum with non-zero chemical potential, arising from energy injected between $z \approx 2\times10^{6}$ and $z \approx 5\times10^{4}$. A **$y$-distortion** is the Compton up-scattering signature — intensity moved from the Rayleigh–Jeans to the Wien side — from energy injected after $z \approx 5\times10^{4}$. **(b)** **Which thermalisation process was still operating.** Photon-number-changing processes (double Compton, bremsstrahlung) shut off around $z \approx 2\times10^{6}$; below that a blackbody cannot be restored. Between then and $z \approx 5\times10^{4}$, Compton scattering still redistributes energy among photons, producing a thermal spectrum with the wrong photon number for its temperature — hence $\mu$. Below $z \approx 5\times10^{4}$ even that redistribution is incomplete, leaving the $y$ shape. **(c)** FIRAS gives $|\mu| < 9\times10^{-5}$ against a prediction of $2\times10^{-8}$, and $|y| < 1.5\times10^{-5}$ against $2\times10^{-6}$. **The bounds exceed the predictions by factors of 4,500 and 7.5 respectively, so the standard $\mu$ signal has not been tested at all.** That is a favourable position rather than a discouraging one: the target size is calculable in advance, and an instrument three orders of magnitude better than FIRAS — as PIXIE-class proposals would be — reaches $y$ comfortably and $\mu$ marginally. Knowing the size of the signal before looking is a considerable advantage.

**8.** **(a)** $T(z) = T_0(1+z)$, because a redshifted blackbody remains a blackbody at a lower temperature. Tested by **excitation temperatures** of atoms and molecules — carbon and CO — in absorbers toward quasars out to $z \approx 3$, the method McKellar used unknowingly; and by the **Sunyaev–Zel'dovich effect**, whose spectral signature depends on the ratio of CMB to electron temperature, measured for clusters out to $z \approx 1$. **(b)** Writing $T(z) = T_0(1+z)^{1-\beta}$, the constraint is $\beta = 0.00 \pm 0.03$ — **agreement at the few-per-cent level**. **(c)** Models in which **photon number is not conserved** in transit: decaying particles injecting photons, photon–axion mixing, and "tired light" scenarios in which photons lose energy en route rather than being redshifted by expansion. These generically predict a different scaling of temperature with redshift, and several would leave the present-day spectrum a blackbody while altering its history. **The spectrum alone cannot exclude them; the scaling test can**, which is why a seemingly obvious prediction was worth measuring.

**9.** **(a)** Because **many mechanisms produce a few-kelvin microwave glow**: cold dust heated by starlight, unresolved radio sources, instrumental offsets. A model that predicts 3 K and another that predicts 5 K are not far apart on a quantity that several unrelated processes can supply, so measuring 2.7 K narrows the field only slightly. **(b)** Because **a Planck curve to 50 parts per million requires thermal equilibrium at high density**, which no dilute-universe mechanism can supply. Dust gives a modified blackbody; source superposition gives a power law; nothing available in a transparent universe thermalises radiation. The spectrum therefore separates the hypotheses cleanly, where the magnitude did not. **(c)** **The informative feature of a measurement is usually its shape, not its magnitude** — because a number can be produced many ways and a functional form usually cannot, so a test should be designed around a form the alternatives do not predict. Outside cosmology: **radioactive decay**, where an exponential curve identifies a memoryless single-step process, while a half-life alone is compatible with many mechanisms; and **the Boltzmann distribution of molecular speeds**, where the functional form confirmed the kinetic theory of gases in a way that any single measured mean speed could not have. In both cases the shape carries the mechanism, and the magnitude merely sets a scale.$cmbRelic_master$,
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
