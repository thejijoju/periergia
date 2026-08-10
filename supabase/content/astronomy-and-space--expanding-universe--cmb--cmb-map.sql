-- Astronomy & Space · The Expanding Universe — The CMB — "The CMB Map".
-- Curated master for
-- astronomy-and-space/expanding-universe/cmb/cmb-map
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Capstone of The CMB block and of The Expanding Universe subject.
-- Organised around exposure: roughly 2,500 measured multipoles fitted
-- by six parameters, so ~2,494 independent ways to fail. The 27-year
-- non-detection of anisotropy as a genuine crisis, resolved by COBE DMR
-- at dT/T = 1.1e-5; why the analysis is done in multipole space rather
-- than on the map; what each acoustic feature measures - first peak
-- position for curvature via theta_* = r_*/D_M, odd/even peak ratio for
-- baryons, third peak for dark matter, damping tail for diffusion; the
-- six parameters and their derived values; CMB lensing at 40 sigma as a
-- bias-free mass map; what the CMB does and does not establish about
-- inflation; the anomalies assessed with the a posteriori problem stated
-- plainly; and the H0 and S8 tensions.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/cmb/cmb-map',
    'research',
    'advanced',
    'read',
    $cmbMap_master$> The CMB power spectrum contains roughly **2,500 independently measured multipoles**. The standard cosmological model fits them with **six free parameters**. That leaves about 2,494 ways for the model to have failed, and it does not fail — the residuals are consistent with noise across the whole range.

This is the same argument the nucleosynthesis chapter made about one parameter and four abundances, applied at a scale several hundred times larger. **It is the strongest single piece of evidence in cosmology**, and it is why a model containing two components nobody has identified is nevertheless taken seriously.

This chapter is about the anisotropies: why their absence was once a crisis, what their statistics encode, how six numbers come out, and what remains unexplained.

## Twenty-seven years of not finding anything

Penzias and Wilson found the CMB isotropic. So did everyone else, for a long time, and this was a problem rather than a triumph.

The reasoning is straightforward. Galaxies and clusters exist, and gravitational instability grows density perturbations from small seeds. Running the growth backwards to recombination gives the amplitude those seeds must have had — and any density perturbation implies a temperature perturbation, through gravitational redshift and the local compression of the plasma.

For a universe of ordinary matter alone, the required amplitude was around $\Delta T/T \sim 10^{-3}$. Searches found nothing at that level. Then nothing at $10^{-4}$. **By the late 1970s the non-detections had excluded baryon-only structure formation** — the seeds simply were not there.

The resolution was **dark matter**, and this is one of the cleanest arguments for it. Dark matter does not interact with photons, so its perturbations can begin growing before recombination, while baryons are still held smooth by radiation pressure. By the time baryons decouple, the dark-matter potential wells are already deep, and the baryons fall into them. **Structure gets a head start that leaves no imprint on the CMB**, so the required temperature anisotropy is roughly a factor of ten smaller: $\sim10^{-5}$.

**COBE's DMR instrument found the anisotropies in 1992, at $\Delta T/T = 1.1\times10^{-5}$** — in the range dark matter required and well below the range baryonic models needed.

Two things about this episode deserve emphasis, because the usual telling flattens them.

**The non-detections were doing real scientific work.** Each improved upper limit killed a class of models. A run of null results is often described as a barren period; here it was the mechanism by which the field learned that most of the matter is dark.

**The detection was a prediction confirmed, not a discovery stumbled upon.** By 1992 the amplitude had been predicted, conditional on cold dark matter, and COBE found it there. Had it come in at $10^{-3}$, or at $10^{-7}$, the standard model would have been in serious trouble. **This is much stronger evidence than a detection at an unpredicted level would have been**, and it is worth insisting on the difference.

```checkpoint
q: Between 1965 and 1992, searches for CMB anisotropy repeatedly found nothing. Why was this a problem, and how was it resolved?
a: It was not a problem — isotropy is what the Big Bang model predicts, and the eventual detection was a refinement
x: Perfect isotropy is fatal: structure requires seeds, and seeds in the matter distribution imply temperature perturbations. A featureless CMB would leave galaxies unexplained.
a*: Structure formation requires seed perturbations, and for baryonic matter alone those seeds would have produced $\Delta T/T \sim 10^{-3}$ — excluded by the non-detections. Dark matter resolved it, since its perturbations grow before recombination and require only $\sim10^{-5}$
a: The problem was instrumental, and it was resolved when detectors became sensitive enough to see the expected $10^{-3}$ signal
x: The eventual detection was at $1.1\times10^{-5}$, a hundred times smaller than baryonic models required — so the earlier limits were meaningful exclusions, not instrumental failures.
a: It was resolved by inflation, which explains why the CMB is so smooth
x: Inflation explains the smoothness on super-horizon scales and supplies the spectrum's shape, but the amplitude problem was solved by dark matter allowing growth before recombination.
hint: Ask what has to be true at recombination for galaxies to exist now, and what would happen if the seeds were made of something that ignores photons.
why: Gravitational instability amplifies density perturbations, so running today's structure backwards fixes the amplitude required at recombination. With only baryons, radiation pressure prevents growth until decoupling, so the seeds must already be large then — around $\Delta T/T \sim 10^{-3}$. Successive searches excluded $10^{-3}$, then $10^{-4}$, killing baryon-only structure formation. Dark matter does not couple to photons, so its perturbations grow while baryons are still smooth; by decoupling the potential wells are deep and baryons simply fall in. The required CMB anisotropy drops to $\sim10^{-5}$, and COBE found $1.1\times10^{-5}$ in 1992. Two points are easy to lose: the null results were doing real work, each one excluding a class of models; and the detection confirmed a prediction rather than stumbling on a surprise, which is much stronger evidence.
```

## What the map is, and what it is not

The familiar mottled ellipse needs three qualifications before it can be read.

**The dipole has been removed.** At 3.36 mK it is a hundred times larger than everything else, and it is a statement about our motion rather than about the universe. Leaving it in would make the map a picture of the Solar System's velocity.

**The Galaxy has been removed.** Synchrotron, free–free and dust emission from the Milky Way dominate the raw sky at every frequency. Separating them exploits the fact that the CMB has a blackbody spectrum while the foregrounds do not — **the component separation is done in frequency, not in position**, which is why Planck observed in nine bands. Near the Galactic plane the separation is imperfect and the region is masked.

**The colour scale is $\pm 300\ \mu$K on a 2.7 K background**, i.e. $\pm10^{-4}$ of the mean. The map is a picture of a one-part-in-a-hundred-thousand ripple, stretched to fill the available contrast.

With those understood, the map shows temperature fluctuations of about $10^{-5}$, with a characteristic angular scale near one degree, and no obvious features — no edges, no repeating patterns, nothing that looks designed. **That featurelessness is the point.** The fluctuations are consistent with a **Gaussian random field**, meaning all the information is in the two-point statistics and none in the particular pattern. Individual hot and cold spots have no significance whatever; they are realisations of a random process, and another universe with the same physics would have a different map with the same statistics.

This is why cosmologists analyse the power spectrum rather than the picture. **The picture contains one realisation; the power spectrum contains the physics.**

## Why multipoles

The natural decomposition on a sphere is into **spherical harmonics**, with multipole $\ell$ corresponding roughly to angular scale $\theta \approx 180°/\ell$. The **angular power spectrum** $C_\ell$ gives the variance of the fluctuations at each $\ell$.

Three reasons make this the right thing to compute rather than a convention.

**Statistical isotropy.** If the universe has no preferred direction, the $C_\ell$ contain all the statistical information — there is nothing else to know.

**Independence.** Different $\ell$ are statistically independent, so the power spectrum is a set of ~2,500 separate measurements rather than one highly correlated one. This is what makes the parameter-counting argument work.

**Physics is scale-local.** Acoustic oscillations, diffusion damping and gravitational effects each act at characteristic scales, so they appear as distinct features in $\ell$ that would be hopelessly superposed in the map.

There is one irreducible limitation. At each $\ell$ there are only $2\ell+1$ independent modes, so the fractional uncertainty on $C_\ell$ is at least $\sqrt{2/(2\ell+1)}$ — **cosmic variance**. At $\ell = 2$ this is 63%. No instrument can do better, because there is only one sky and only five independent quadrupole modes on it. **The uncertainty at large angular scales is a property of the universe, not of the experiment**, and this matters when assessing anomalies.

```checkpoint
q: Why is the CMB analysed as an angular power spectrum rather than by examining features in the map?
a: Because the map is too noisy for individual features to be reliable
x: Planck's map is signal-dominated over most of the sky; noise is not the limitation.
a*: Because the fluctuations are a Gaussian random field, so all the information is in the two-point statistics — individual hot and cold spots are realisations of a random process and carry no physics
a: Because the power spectrum removes foreground contamination, which the map cannot
x: Foregrounds are removed by multi-frequency component separation before either is made; the transform does not remove them.
a: Because the map is a projection of a three-dimensional structure, which the power spectrum inverts
x: The power spectrum does not invert the projection; both describe the same two-dimensional field.
hint: Ask what would change if the universe were run again with identical physics.
why: The anisotropies are consistent with a Gaussian random field, which means the statistics are fully specified by the two-point function — equivalently, by the $C_\ell$. Another universe with identical physics would produce a different-looking map with the same power spectrum, so any particular hot spot is a coin flip and carries no information about the underlying model. Three further advantages follow from working in $\ell$: statistical isotropy makes the $C_\ell$ complete; different multipoles are statistically independent, so the spectrum is ~2,500 separate measurements; and the relevant physical processes act at characteristic scales, appearing as distinct features that would be superposed in the map. The cost is cosmic variance — only $2\ell+1$ modes exist at each $\ell$, so large angular scales are irreducibly uncertain.
```

{{image: Cosmic microwave background | The temperature anisotropies of the microwave sky after removal of the dipole and of Galactic foreground emission, with a colour scale spanning about ±300 microkelvin on a 2.7 K background — a ripple of one part in a hundred thousand. The pattern is consistent with a Gaussian random field, so no individual hot or cold spot carries information; the physics lies entirely in the statistics, which is why the analysis proceeds through the angular power spectrum rather than through features in the image.}}

## Reading the peaks

The power spectrum's shape is a series of peaks, and each feature measures something specific. This is where the CMB stops being a picture and becomes an instrument.

**The peaks are frozen sound waves.** Before decoupling, photons and baryons form a single fluid in which pressure resists gravitational compression, so perturbations oscillate. A mode that has completed exactly half an oscillation by decoupling — compressed to maximum — is caught at maximum amplitude, and produces the first peak. A mode completing a full oscillation gives the second, and so on. The **sound horizon** $r_* = 144.4$ Mpc comoving, the distance a wave travelled before decoupling, sets the fundamental scale.

**First peak position: geometry.** The peak appears at an angle $\theta_* = r_*/D_M$, where $D_M = 13{,}870$ Mpc is the comoving distance to last scattering. Planck measures

$$100\,\theta_* = 1.04109 \pm 0.00031,$$

i.e. $\theta_* = 0.597°$, placing the first peak near $\ell = 220$. **This is a standard ruler at known distance, so it measures the geometry of the intervening space** — spatial curvature would change the apparent angle, and the measurement gives $\Omega_k = 0.001 \pm 0.002$. It is the flatness constraint the Cosmic Scale chapter used, and this is where it comes from.

**Odd versus even peak heights: baryons.** Baryons add inertia to the photon–baryon fluid without adding pressure, so they deepen compressions and weaken rarefactions. Odd-numbered peaks correspond to compressions and even to rarefactions, so **the ratio of the first peak to the second measures the baryon density**, giving $\Omega_b h^2 = 0.02237 \pm 0.00015$ — the value that agrees with primordial deuterium to 0.2%.

**Third peak: dark matter.** Before matter–radiation equality, gravitational potentials decay as radiation streams away, which drives the oscillations and boosts their amplitude. More dark matter means equality happens earlier and less driving occurs. The third peak's height relative to the second is sensitive to this, giving $\Omega_c h^2 = 0.1200 \pm 0.0012$. **The CMB weighs the dark matter without any dynamical measurement of any galaxy.**

**Damping tail beyond $\ell \approx 1000$: diffusion.** Photons random-walk out of small-scale perturbations during the finite duration of recombination, erasing structure below about 10 Mpc comoving. Combined with the last-scattering shell's thickness, this produces the falling tail. Its shape depends on the recombination history and on the helium abundance, as the Recombination chapter noted.

**Largest scales, $\ell < 30$: the Sachs–Wolfe plateau.** Here the anisotropy is dominated by gravitational redshift from potentials at last scattering rather than by acoustic physics, and it reflects the primordial spectrum almost directly. This is where the spectral index is measured.

```checkpoint
q: The first acoustic peak sits at $\ell \approx 220$, corresponding to $\theta_* = 0.597°$. What does its angular position primarily measure?
a: The temperature of the plasma at last scattering, since hotter plasma oscillates faster
x: The sound speed is essentially $c/\sqrt{3}$ throughout, set by the relativistic equation of state; temperature does not tune the peak position this way.
a*: The geometry of the space between us and last scattering — the sound horizon $r_*$ is a known physical length seen at a known distance, so the observed angle constrains spatial curvature, giving $\Omega_k = 0.001 \pm 0.002$
a: The age of the universe, since the sound horizon grows with time until decoupling
x: The sound horizon does depend on the expansion history, but the peak's *angular position* is a ratio of that length to a distance, and its principal use is geometric.
a: The amplitude of the primordial perturbations, which sets which mode is caught at maximum
x: The amplitude scales all peaks together and does not move them; the position depends on the ratio of two lengths.
hint: A known length seen at a known distance subtends a known angle — unless something bends the light path.
why: Before decoupling, sound waves in the photon–baryon fluid travel a comoving distance $r_* = 144.4$ Mpc, and modes caught at maximum compression produce the first peak. That length is calculable from the expansion history and the sound speed, and last scattering lies at a comoving distance $D_M = 13{,}870$ Mpc, so the peak should appear at $\theta_* = r_*/D_M$. Measuring $100\theta_* = 1.04109 \pm 0.00031$ therefore compares a known ruler with a known distance, and any spatial curvature between would alter the angle — positive curvature magnifying it, negative shrinking it. The result, $\Omega_k = 0.001 \pm 0.002$, is the flatness measurement that the Cosmic Scale chapter used when arguing that flatness does not settle whether the universe is finite.
---
q: Why does the ratio of the first acoustic peak's height to the second measure the baryon density?
a: Because baryons emit additional radiation at the compression maxima, raising the odd peaks
x: Baryons do not emit at these energies; their role is mechanical, through inertia in the fluid.
a*: Because baryons add inertia without adding pressure, deepening compressions and weakening rarefactions — and odd peaks correspond to compressions while even peaks correspond to rarefactions
a: Because baryons scatter photons, damping the higher peaks more than the lower ones
x: Baryon-induced scattering contributes to diffusion damping, which affects the whole tail progressively rather than alternating between odd and even peaks.
a: Because the baryon density sets the sound speed, which shifts alternate peaks in opposite directions
x: Baryons do lower the sound speed slightly, shifting all peaks together; the alternating amplitude pattern is a separate and much stronger effect.
hint: Think of a mass on a spring, and ask what adding mass does to the two ends of the oscillation.
why: The photon–baryon fluid oscillates under photon pressure restoring against gravity. Baryons contribute mass but essentially no pressure, so they act like extra inertia on a spring: the fluid falls further into potential wells before pressure turns it around, and rebounds less far out. Compressions are therefore enhanced relative to rarefactions. Because odd-numbered peaks arise from modes caught at maximum compression and even-numbered from maximum rarefaction, more baryons raise the odd peaks relative to the even. Measuring the first-to-second peak ratio gives $\Omega_bh^2 = 0.02237 \pm 0.00015$ — a determination from photon–baryon acoustics that agrees to 0.2% with the value from primordial deuterium, physics from 372,000 years and from 200 seconds converging on one number.
---
q: The integrated Sachs–Wolfe effect adds power at the largest angular scales when gravitational potentials evolve as photons cross them. Why is it evidence for dark energy, and why is it detected by cross-correlation rather than directly?
a: Because dark energy heats the CMB photons, and the effect is too small to see except in correlation
x: No heating occurs; the effect is a net gravitational blueshift from a potential changing while the photon traverses it.
a*: Because potentials stay constant in a matter-dominated universe and decay once expansion accelerates, so a signal requires late-time acceleration — and it is buried under primordial large-scale power, so it is extracted by correlating the CMB with galaxy surveys tracing the potentials responsible
a: Because dark energy creates new potentials that did not exist earlier, which show up only against a galaxy template
x: Dark energy does not create potentials; it causes existing ones to decay by accelerating the expansion.
a: Because the effect operates only at low redshift, where cosmic variance is small enough to permit a direct detection
x: It appears at the largest angular scales, precisely where cosmic variance is largest, which is why a direct detection is impractical.
hint: Ask what happens to a photon falling into a well that has become shallower by the time it climbs out.
why: A photon falling into a potential well gains energy and loses it again on the way out, with no net effect if the well is unchanged. In a matter-dominated universe potentials stay constant, so nothing happens. Once expansion accelerates, potentials decay while the photon is inside — it climbs out of a shallower well than it fell into and emerges net blueshifted. The effect therefore exists only if the expansion is accelerating, making it a probe of dark energy from the CMB itself. But it appears at the largest angular scales, where primordial Sachs–Wolfe power dominates and cosmic variance is worst, so it cannot be isolated in the CMB alone. Cross-correlating the CMB with galaxy surveys that trace the very structures causing the potentials extracts it, at around 4$\sigma$ — modest, but from independent physics.
```

## The map is also a lens

One further signal deserves its own treatment, because it turns the CMB from a snapshot of one epoch into a probe of everything since.

Photons travelling from last scattering pass through 13.8 billion years of intervening structure, and gravitational lensing deflects them. The deflections are small — a few arcminutes, coherent over degree scales — but they are not negligible at Planck's precision. **The CMB we observe is a lensed image of the last-scattering surface, not the surface itself.**

Lensing does two measurable things. It **smooths the acoustic peaks**, because deflections blur the sharp features slightly. And it introduces **correlations between different multipoles**, which a purely Gaussian unlensed field would not have — the lensing potential modulates small-scale power according to the large-scale matter distribution, and that modulation is detectable.

Reconstructing the lensing potential from those induced correlations gives a **map of all the matter between us and last scattering**, projected along the line of sight and weighted toward $z \approx 2$. Planck detects the lensing signal at about **40 standard deviations**, and ACT has since improved on it.

This is worth appreciating for what it is. **The lensing map is a measurement of the total matter distribution — dark and luminous alike — with no assumption whatever about how matter emits light.** Galaxy surveys measure where galaxies are and must then be corrected for bias, the uncertain relationship between galaxies and mass. CMB lensing has no such problem: it responds to mass directly, and its source plane is at a precisely known redshift with a precisely known statistical description.

Three uses follow.

**It breaks degeneracies.** The unlensed CMB constrains a combination of $\Omega_m$ and $H_0$ that leaves each individually poorly determined; lensing depends on them differently, and adding it tightens both.

**It measures structure growth.** The lensing amplitude depends on how much structure has formed since recombination, which is sensitive to dark energy and to neutrino masses. Massive neutrinos suppress small-scale growth, so **CMB lensing provides one of the tightest bounds on the sum of neutrino masses**, currently below about 0.12 eV when combined with other data — a particle-physics constraint from a photograph of the sky.

**It provides an internal consistency check.** The lensing amplitude predicted by the six-parameter fit to the unlensed peaks can be compared with the amplitude actually measured. These agree, which they need not have.

```checkpoint
q: CMB lensing reconstruction produces a map of the intervening matter. Why is it a cleaner probe of the matter distribution than a galaxy survey?
a: Because it reaches higher redshift, where the matter distribution is simpler
x: Depth helps, but the decisive advantage is that lensing responds to mass directly rather than to a tracer.
a*: Because it responds to mass directly, with no assumption about how matter emits light — whereas galaxy surveys measure a biased tracer whose relationship to the underlying mass must be modelled
a: Because it is unaffected by foreground contamination, which limits galaxy surveys
x: Foregrounds affect the CMB too and must be removed carefully; that is not the distinguishing point.
a: Because it measures the matter distribution at a single redshift rather than integrating along the line of sight
x: The opposite — lensing is an integrated measurement along the whole line of sight, weighted toward $z \approx 2$.
hint: Ask what a galaxy survey actually observes, and what has to be assumed to turn it into a mass distribution.
why: A galaxy survey measures the positions of galaxies, which are a biased tracer of mass: the relationship between galaxy density and matter density depends on galaxy formation physics and must be modelled, introducing uncertainty that is difficult to eliminate. Gravitational lensing responds to the total mass — dark and luminous alike — with no such intermediary. CMB lensing has the additional advantage of a source plane at precisely known redshift with a precisely known statistical description, which no galaxy-based lensing survey can match. Planck detects the signal at about 40$\sigma$ by reconstructing the correlations lensing induces between multipoles. It breaks the $\Omega_m$–$H_0$ degeneracy, measures structure growth since recombination, and yields one of the tightest bounds on the sum of neutrino masses — below about 0.12 eV in combination with other data.
```

## Six numbers

The base model, $\Lambda$CDM, has six free parameters. Everything else is derived.

| Parameter | Meaning | Planck 2018 |
| --- | --- | --- |
| $\Omega_b h^2$ | baryon density | $0.02237 \pm 0.00015$ |
| $\Omega_c h^2$ | cold dark matter density | $0.1200 \pm 0.0012$ |
| $100\theta_*$ | angular scale of the sound horizon | $1.04092 \pm 0.00031$ |
| $\tau$ | optical depth to reionization | $0.0544 \pm 0.0073$ |
| $\ln(10^{10}A_s)$ | primordial amplitude | $3.044 \pm 0.014$ |
| $n_s$ | primordial spectral index | $0.9649 \pm 0.0042$ |

And derived from them:

| Derived | Value |
| --- | --- |
| $H_0$ | $67.36 \pm 0.54$ km s⁻¹ Mpc⁻¹ |
| $\Omega_m$ | $0.3153 \pm 0.0073$ |
| $\Omega_\Lambda$ | $0.6847 \pm 0.0073$ |
| Age | $13.797 \pm 0.023$ Gyr |
| $z_*$ | $1089.92 \pm 0.25$ |
| $\sigma_8$ | $0.8111 \pm 0.0060$ |

Two of these deserve comment.

**$n_s = 0.9649 \pm 0.0042$** describes how perturbation power varies with scale, with $n_s = 1$ meaning scale-invariance. The measured value differs from 1 by **8.4 standard deviations.** This is not a null result dressed up: inflation generically predicts a spectrum slightly tilted below 1, because the inflaton field rolls slowly rather than sitting still, so the physical conditions differ slightly between the times different scales left the horizon. **A measured tilt of the predicted sign and roughly the predicted size is among the strongest quantitative successes inflation has**, and it took two decades of measurement to establish.

**The age, $13.797 \pm 0.023$ Gyr**, is determined to **0.17%** — from a photograph of the sky at 372,000 years, interpreted through a six-parameter model. It agrees with the ages of the oldest globular clusters and with radiometric dating of heavy elements, neither of which shares any assumption with it.

Now the exposure argument, which is the point of this chapter.

The temperature spectrum is measured over roughly $2 \le \ell \le 2500$, and the polarisation spectra add more. **These are ~2,500 independent numbers, fitted by six parameters.** The model is therefore over-determined by a factor of about 400, and could have failed in around 2,494 independent ways.

It does not fail. The residuals across the whole range are consistent with noise and cosmic variance.

**This is why $\Lambda$CDM is taken seriously despite containing two components nobody has identified.** The objection "you have invented dark matter and dark energy to fit the data" would be forceful if the model had a parameter for every observation. It has six for 2,500. Dark matter is not a free function shaped to match the peaks; it is one number, $\Omega_ch^2$, and once fixed by the third peak it must also produce the right damping tail, the right lensing signal, the right galaxy clustering and the right cluster abundance. **A fudge with one knob and 2,500 constraints is not a fudge.**

```checkpoint
q: A common objection holds that $\Lambda$CDM merely invents dark matter and dark energy to fit the data. What is the strongest response?
a: That dark matter has been detected directly in laboratory experiments, so it is not an invention
x: No direct detection has been confirmed, and the response should not depend on one.
a*: That the model fits ~2,500 independently measured multipoles with six parameters, so dark matter enters as a single number that must simultaneously produce the right peak heights, damping tail, lensing signal and galaxy clustering — a fit with 2,494 ways to fail is not a fudge
a: That dark energy is required by general relativity, so it is not an additional assumption
x: General relativity permits a cosmological constant but does not require one; its value is an input.
a: That alternative theories have all been excluded, leaving $\Lambda$CDM as the only option
x: Alternatives are constrained rather than exhaustively excluded, and this response would be weak even if true.
hint: Count what the model is fitting against how many knobs it has.
why: The objection would land if the model had roughly as many parameters as observations, since then agreement would carry no information. It has six, against a temperature spectrum measured over $2 \le \ell \le 2500$ plus polarisation — around 2,500 independent numbers, each with its own error bar. Dark matter enters as one parameter, $\Omega_ch^2$, fixed principally by the third peak's height; having been fixed, it must also give the right damping tail, the right lensing amplitude, the right growth of structure, the right cluster abundance and the right galaxy power spectrum, with no further freedom. It does. This is the exposure argument from nucleosynthesis at several hundred times the scale, and it is why a model with two unidentified components is nonetheless the standard one: fit quality is evidence exactly to the extent that misfit was possible.
```

## What the CMB says about inflation

The Dark Universe block takes up inflation properly. But the CMB is where its evidence lives, and it is worth setting out here what the map does and does not establish, because the claims are frequently overstated in both directions.

Four observations bear on it.

**Super-horizon correlations.** At last scattering, regions more than about one degree apart had never been in causal contact — their separation exceeded the particle horizon at that time. Yet their temperatures are correlated. Something must have correlated them before they were separated, which is precisely what inflation supplies by stretching a causally connected patch beyond the horizon.

The sharpest form of this argument is not the naive "the sky is too uniform" version, which can be answered by simply positing uniform initial conditions. It is the **temperature–polarisation cross-spectrum**, which shows a distinctive **anticorrelation** at $\ell \approx 30$–150. That feature requires perturbations that were already outside the horizon and oscillating in a particular phase at last scattering. **Causal mechanisms acting after inflation cannot produce it**, and its detection is a genuine confirmation of a prediction rather than a post-hoc accommodation.

**Adiabatic initial conditions.** Inflation generically predicts that all species' density perturbations are proportional — a single field's fluctuations imprinted on everything. The alternative, isocurvature perturbations, would shift the acoustic peaks noticeably. Data bound the isocurvature fraction to a few per cent. **The initial conditions are adiabatic, as predicted.**

**Near-Gaussianity.** Simple single-field slow-roll inflation predicts fluctuations that are Gaussian to high accuracy, because the field's quantum fluctuations are nearly free. Planck measures $f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$ — **consistent with zero**, and tight enough to exclude several classes of multi-field and non-standard models.

**A tilted spectrum.** $n_s = 0.9649 \pm 0.0042$, differing from scale-invariance by 8.4$\sigma$, of the sign and roughly the magnitude slow-roll predicts.

Now the qualification, which matters.

**None of this identifies the inflaton, and no primordial B-modes have been found.** The tensor-to-scalar ratio is bounded at $r < 0.036$, which excludes some models — notably the simplest $\phi^2$ potential — and leaves a great many untouched. The four successes above establish that the initial conditions have the character inflation produces: super-horizon, adiabatic, nearly Gaussian, nearly scale-invariant with a slight red tilt. **They do not establish that inflation is what produced them**, and alternative mechanisms giving the same initial conditions have been constructed, though none is as economical.

The right summary is that **inflation is a well-motivated framework whose generic predictions have been confirmed, and whose specific realisation is entirely unknown.** That is a genuinely strong position by the standards of speculative early-universe physics, and a genuinely weak one by the standards of the six-parameter fit this chapter has been describing. Both comparisons are worth keeping in view.

```checkpoint
q: What is the strongest CMB evidence for inflation, and what does it fall short of establishing?
a: The uniformity of the CMB temperature across causally disconnected regions, which no other mechanism can explain
x: Bare uniformity can be answered by positing uniform initial conditions; the argument needs a sharper form, and this version is the one most often overstated.
a*: The temperature–polarisation anticorrelation at $\ell \approx 30$–150, which requires perturbations already outside the horizon and oscillating in a particular phase — but it establishes only that the initial conditions have inflation's character, not that inflation produced them
a: The detection of primordial B-mode polarisation, which directly measures inflationary gravitational waves
x: No primordial B-modes have been detected; the bound is $r < 0.036$.
a: The measured spatial flatness, which inflation predicts and which no other mechanism produces
x: Flatness is consistent with inflation but can also result from other initial conditions, and it is a weaker argument than the super-horizon phase evidence.
hint: Ask which observation could not be produced by any process operating after inflation ended.
why: The naive uniformity argument is weak, because one can simply posit uniform initial conditions. The strong version is the temperature–polarisation cross-spectrum, which shows a characteristic anticorrelation at $\ell \approx 30$–150. That feature requires perturbations that were already super-horizon and caught in a particular oscillation phase at last scattering — something no causal mechanism operating after inflation can arrange. Together with adiabatic initial conditions (isocurvature bounded to a few per cent), near-Gaussianity ($f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$) and the 8.4$\sigma$ red tilt, this establishes that the initial conditions have exactly the character inflation generically produces. What it does not establish is the mechanism: no primordial B-modes have been seen, $r < 0.036$, the inflaton is unidentified, and alternative scenarios producing the same initial conditions exist. Inflation is a framework whose generic predictions have passed and whose specific realisation is unknown.
```

## What the map does not settle

Three honest qualifications, because a chapter arguing this strongly should say where the argument stops.

**Anomalies exist, and their status is genuinely unclear.** Several features look odd:

- The **quadrupole** ($\ell = 2$) is lower than expected.
- The quadrupole and octopole are unexpectedly **aligned** with each other and roughly with the ecliptic — sometimes called the "axis of evil".
- There is a **hemispherical power asymmetry**, with more fluctuation power in one half of the sky.
- The **Cold Spot**, an unusually large and deep cold region in the southern sky.

Each is at the level of two to three standard deviations. The difficulty is that **they were found by inspecting the map**, so the significance cannot be read off directly. Given enough statistics computed on any random field, some will appear unusual — the multiple-comparisons problem, in a setting where the number of comparisons was never fixed in advance. **An a posteriori $3\sigma$ is not a $3\sigma$**, and quantifying how much to discount it requires knowing how many alternatives were implicitly examined, which nobody does.

Two considerations make these harder to dismiss than that argument alone suggests. They appear in both WMAP and Planck, with different instruments and different systematics. And the large-scale anomalies are **cosmic-variance limited**, so no future experiment will settle them: there is one sky, and at $\ell = 2$ there are five modes. **These may remain permanently unresolved**, which is an unusual and uncomfortable position.

**The $H_0$ tension is real and unexplained.** Planck's $\Lambda$CDM fit gives $H_0 = 67.36 \pm 0.54$; the local distance ladder gives $73.04 \pm 1.04$. The discrepancy is **4.9 standard deviations**, and as the Hubble's Law chapter set out, no systematic has been found in either that accounts for it. Note what the CMB value actually is: **not a measurement of $H_0$ but a derived quantity**, obtained by fitting the model to the peaks and reading off the expansion rate the fit implies. If $\Lambda$CDM is wrong in some respect, the derived $H_0$ is wrong with it — which is why the tension is often read as evidence for new physics rather than for an error.

**The $S_8$ tension is smaller but persistent.** The CMB predicts a clustering amplitude $S_8 = \sigma_8\sqrt{\Omega_m/0.3}$ somewhat higher than weak-lensing surveys measure directly, at the 2–3$\sigma$ level. It has narrowed with better data rather than growing, and may be a systematic in shear calibration or in the modelling of baryonic feedback on small scales.

**The honest summary: the model fits 2,500 multipoles with six parameters and passes; and it has one 5$\sigma$ tension with an independent measurement, one 2–3$\sigma$ tension with another, and several unexplained large-scale features that may never be resolved.** Both halves are true, and reporting either alone misrepresents the field.

```checkpoint
q: The CMB anomalies — low quadrupole, multipole alignments, the Cold Spot — each sit at 2–3$\sigma$. How should their significance be assessed?
a: As solid evidence for new physics, since several independent anomalies at 2–3$\sigma$ combine to a much higher significance
x: They are not independent tests chosen in advance, and combining post-hoc findings compounds the selection problem rather than curing it.
a*: With substantial discounting, because they were identified by inspecting the map — an a posteriori $3\sigma$ is not a $3\sigma$ when the number of comparisons was never fixed — though their appearance in both WMAP and Planck keeps them from being dismissed outright
a: As settled artefacts of foreground subtraction, since they occur at large angular scales where the Galaxy dominates
x: Foregrounds are a concern but have been extensively tested, and the anomalies persist across independent instruments and separation methods.
a: As resolvable by better measurements, so judgement should be deferred
x: The large-scale anomalies are cosmic-variance limited — at $\ell = 2$ there are five modes and one sky — so no future experiment can settle them.
hint: Ask how many statistics could have been computed on the map, and how many were decided upon before looking.
why: Any Gaussian random field will contain features that appear unusual if one is free to search for them after the fact, and the CMB map admits an unbounded number of statistics. Since these were found by inspection rather than specified in advance, their nominal significances overstate the evidence, and quantifying the correction requires knowing how many alternatives were implicitly examined — which nobody does. Two things prevent outright dismissal: the anomalies appear in both WMAP and Planck, with different instruments, scan strategies and systematics; and the large-scale ones are cosmic-variance limited, so the uncertainty is a property of having one sky rather than of the experiments. The likely outcome is that they remain permanently unresolved — an uncomfortable position, and one worth stating rather than glossing.
---
q: Planck reports $H_0 = 67.36 \pm 0.54$ km s⁻¹ Mpc⁻¹. In what sense is this a measurement of the expansion rate?
a: A direct one — the CMB fixes the distance to last scattering and the redshift, so $H_0$ follows immediately
x: The CMB constrains a combination of the sound horizon and the distance, not the local expansion rate directly; extracting $H_0$ requires the model.
a*: An indirect one — it is a derived parameter, obtained by fitting $\Lambda$CDM to the acoustic peaks and reading off the expansion rate the fit implies, so it inherits any error in the model
a: A direct one, since the peak positions depend on $H_0$ through the sound horizon
x: They depend on the sound horizon and the distance to last scattering, both of which involve the full expansion history rather than $H_0$ alone.
a: It is not a measurement at all, but a prior imposed to make the fit converge
x: It is a genuine constraint from the data, conditional on the model — quite different from an imposed prior.
hint: Ask which quantity the peaks constrain directly, and how many steps separate it from $H_0$.
why: What the CMB constrains directly is $\theta_* = r_*/D_M$ — the sound horizon divided by the distance to last scattering — plus the peak heights, which fix the baryon and dark matter densities. Converting those into a present-day expansion rate requires assuming the model that connects them, namely $\Lambda$CDM with its assumed content and evolution. $H_0$ is therefore derived, not measured, and if the model is wrong in some respect the derived value is wrong with it. That is exactly why the 4.9$\sigma$ disagreement with the local distance-ladder value of $73.04 \pm 1.04$ is widely read as a hint of new physics rather than as an error: the local measurement is nearly model-independent, while the CMB value is model-conditional, so a discrepancy points at the model rather than at either measurement.
```

{{image: Lambda-CDM model | The angular power spectrum of CMB temperature anisotropies, showing the acoustic peaks and the damping tail. Each feature carries specific information: the first peak's angular position measures spatial curvature through the ratio of the sound horizon to the distance to last scattering, the odd-to-even peak ratio measures the baryon density, the third peak measures the dark matter density, and the falling tail beyond ℓ ≈ 1000 records photon diffusion during recombination. Roughly 2,500 such multipoles are fitted by six parameters.}}

## Pulling the thread

- **Isotropy was a crisis, not a triumph.** Baryon-only structure formation required $\Delta T/T \sim 10^{-3}$; searches excluded it. **Dark matter resolved it** by letting perturbations grow before recombination, lowering the requirement to $10^{-5}$ — and COBE found $1.1\times10^{-5}$ in 1992. **The null results were doing the work**, and the detection confirmed a prediction rather than stumbling on a surprise.
- The map has the dipole and the Galaxy removed, and a colour scale of $\pm10^{-4}$. The fluctuations are a **Gaussian random field**, so individual spots carry no information and **all the physics is in the statistics**.
- The power spectrum is the right object because statistical isotropy makes it complete, multipoles are independent, and physical processes act at characteristic scales. Its irreducible limit is **cosmic variance**, $\sqrt{2/(2\ell+1)}$ — **63% at $\ell = 2$, a property of having one sky.**
- Each feature measures something: **first peak position** → geometry, $\theta_* = r_*/D_M$ with $r_* = 144.4$ Mpc, giving $\Omega_k = 0.001 \pm 0.002$; **odd/even peak ratio** → baryons, via inertia deepening compressions; **third peak** → dark matter, via potential decay before equality; **damping tail** → diffusion during recombination; **$\ell < 30$** → the primordial spectrum.
- **Six parameters.** $n_s = 0.9649 \pm 0.0042$ differs from scale-invariance by **8.4$\sigma$**, of the sign and size inflation predicts. The age comes out at $13.797 \pm 0.023$ Gyr — **0.17%**, from a photograph of the sky at 372,000 years.
- **The exposure argument.** ~2,500 independent multipoles, six parameters, ~2,494 ways to fail, and no failure. **Dark matter is one number that must simultaneously fit the peak heights, the damping tail, the lensing signal and galaxy clustering** — which is why "you invented it to fit the data" does not land.
- The CMB is **also a lens**: intervening structure deflects photons by a few arcminutes, smoothing the peaks and inducing multipole correlations from which a **map of all intervening mass** can be reconstructed — detected at ~40$\sigma$, with **no galaxy-bias assumption**, giving one of the tightest bounds on the neutrino mass sum ($< 0.12$ eV combined).
- On **inflation**: super-horizon correlations shown sharply by the temperature–polarisation **anticorrelation at $\ell \approx 30$–150**, adiabatic initial conditions, near-Gaussianity ($f_{\rm NL}^{\rm local} = -0.9 \pm 5.1$) and the red tilt together establish that **the initial conditions have inflation's character** — but not that inflation produced them. **$r < 0.036$, the inflaton is unidentified.**
- **What is not settled**: several 2–3$\sigma$ anomalies found by inspecting the map, whose significance must be discounted but which appear in two independent experiments and are **cosmic-variance limited, so they may never be resolved**; the **4.9$\sigma$ $H_0$ tension**, sharpened by the CMB value being model-derived rather than measured; and a persistent 2–3$\sigma$ $S_8$ tension.

The transferable idea: **a model's credibility is set by the ratio of independent observations to free parameters, and by nothing else about how plausible its ingredients sound.** $\Lambda$CDM postulates two components nobody has identified, which sounds like a great deal of licence and is in fact almost none: six numbers against 2,500 measurements. A theory with intuitively appealing ingredients and a parameter per observation is worth less than one with strange ingredients and none to spare, because **only the second could have been wrong.** The instinct to judge a theory by whether its components seem reasonable is a poor guide, and counting is a good one. Apply it before deciding whether a fit is impressive: how many numbers were adjustable, how many were fixed in advance, and how many independent ways did the model have to fail?

## Further reading

{{book: Wayne Hu and Martin White | The Cosmic Symphony | 2004}}

{{book: Michael Rowan-Robinson | Cosmology | 2004}}

{{book: Lyman Page | The Little Book of Cosmology | 2020}}

Beyond the books: Wayne Hu's online CMB tutorials remain the clearest explanation anywhere of what each acoustic feature measures and why, and they use almost no mathematics. The Planck 2018 parameters paper is long but its tables are the reference for everything in this chapter. On the anomalies, Planck's dedicated paper on isotropy and statistics is admirably candid about the a posteriori problem — more so than most secondary accounts.

## Problems

*Useful numbers: $\Delta T/T = 1.1\times10^{-5}$ (COBE); $r_* = 144.4$ Mpc; $D_M = 13{,}870$ Mpc; $100\theta_* = 1.04109$; first peak $\ell \approx 220$; $\Omega_bh^2 = 0.02237 \pm 0.00015$; $\Omega_ch^2 = 0.1200 \pm 0.0012$; $\tau = 0.0544 \pm 0.0073$; $n_s = 0.9649 \pm 0.0042$; $H_0^{\rm CMB} = 67.36 \pm 0.54$, $H_0^{\rm local} = 73.04 \pm 1.04$; age $13.797 \pm 0.023$ Gyr; cosmic variance $\sqrt{2/(2\ell+1)}$; multipole range $2 \le \ell \le 2500$.*

**1.** *(The crisis.)* **(a)** State the anisotropy amplitude required by baryon-only structure formation and what was found. **(b)** Explain how dark matter lowers the requirement. **(c)** Explain what the null results accomplished and why the eventual detection is strong evidence.

**2.** *(Reading the map.)* **(a)** State three things removed or rescaled before the familiar map is displayed. **(b)** Explain how foregrounds are separated and why nine frequency bands were used. **(c)** Explain why individual hot spots carry no information.

**3.** *(Multipoles.)* **(a)** Give three reasons the power spectrum is the right object. **(b)** Compute the cosmic variance at $\ell = 2$ and at $\ell = 1000$. **(c)** Explain why this is a property of the universe rather than the experiment, and what follows for the anomalies.

**4.** *(Geometry.)* **(a)** Compute $\theta_*$ from $r_*$ and $D_M$, in radians and degrees. **(b)** Estimate the corresponding multipole and compare with the observed first peak. **(c)** Explain what the measurement constrains and state the result.

**5.** *(Peak heights.)* **(a)** Explain why baryons raise odd peaks relative to even. **(b)** Explain what the third peak is sensitive to and why. **(c)** State the two densities obtained and one independent check on each.

**6.** *(Six numbers.)* **(a)** List the six parameters. **(b)** State the significance of $n_s$ differing from 1 and why it matters. **(c)** State the derived age and its fractional precision, and name two independent checks.

**7.** *(Exposure.)* **(a)** Count independent observations against free parameters. **(b)** Explain why this defeats the "invented to fit the data" objection. **(c)** State what dark matter, once fixed, must additionally get right.

**8.** *(Anomalies.)* **(a)** Name four. **(b)** Explain the a posteriori problem and why it discounts them. **(c)** Give two reasons they cannot simply be dismissed, and state the likely outcome.

**9.** *(Tensions.)* **(a)** Compute the significance of the $H_0$ discrepancy. **(b)** Explain why the CMB value being derived rather than measured sharpens rather than weakens the tension. **(c)** State the $S_8$ tension and assess it, then give the honest summary of the chapter's evidence.

## Worked answers

**1.** **(a)** Baryon-only structure formation required $\Delta T/T \sim 10^{-3}$; searches found nothing at $10^{-3}$, then nothing at $10^{-4}$. COBE eventually found $\mathbf{1.1\times10^{-5}}$ in 1992. **(b)** Dark matter does not couple to photons, so its perturbations **grow before recombination**, while baryons are still held smooth by radiation pressure. By decoupling the potential wells are already deep and baryons fall into them, so structure gets a head start that leaves no CMB imprint. The required anisotropy drops by roughly a factor of ten. **(c)** The null results **excluded a class of models** — each improved limit killed baryon-only structure formation more firmly, which is how the field learned that most matter is dark. And the detection **confirmed a prediction**: by 1992 the amplitude was predicted conditional on cold dark matter, and had COBE found $10^{-3}$ or $10^{-7}$ the standard model would have been in serious trouble. A confirmed prediction is much stronger evidence than a detection at an unanticipated level.

**2.** **(a)** The **dipole** (3.36 mK, a hundredfold larger than everything else, and a fact about our motion); the **Galactic foregrounds** (synchrotron, free–free and dust, which dominate the raw sky); and the **colour scale**, stretched to $\pm300\ \mu$K on a 2.7 K mean, i.e. $\pm10^{-4}$. **(b)** By exploiting the fact that the CMB has a **blackbody spectrum** while the foregrounds do not — synchrotron falls steeply with frequency, dust rises, free–free has its own slope. Observing in **nine bands** oversamples the spectral dimension enough to solve for each component at every position; separation is done in frequency, not in position. Near the Galactic plane it remains imperfect and the region is masked. **(c)** Because the fluctuations are a **Gaussian random field**: the statistics are fully specified by the two-point function, and any particular spot is a realisation of a random process. Another universe with identical physics would show a different map with the same power spectrum, so no individual feature carries information about the model.

**3.** **(a)** **Statistical isotropy** means the $C_\ell$ contain all the statistical information. **Independence** means different $\ell$ are separate measurements, so the spectrum is ~2,500 constraints rather than one correlated one. **Scale-locality** means acoustic oscillations, diffusion damping and gravitational effects appear as distinct features that would be superposed in the map. **(b)** $\sqrt{2/(2\ell+1)}$: at $\ell = 2$, $\sqrt{2/5} = \mathbf{0.63}$, i.e. 63%; at $\ell = 1000$, $\sqrt{2/2001} = \mathbf{0.032}$, i.e. 3.2%. **(c)** Because there are only $2\ell+1$ independent modes at each $\ell$ **and only one sky to measure them on** — at $\ell = 2$ there are five. No aperture, sensitivity or integration time changes this. It follows that the large-scale anomalies **cannot be settled by better experiments**, which is why they may remain permanently unresolved rather than being decided one way or the other.

**4.** **(a)** $\theta_* = r_*/D_M = 144.4/13{,}870 = \mathbf{1.041\times10^{-2}\ rad} = \mathbf{0.597°}$, matching the measured $100\theta_* = 1.04109$. **(b)** Using $\ell \approx 180°/\theta$, $\ell \approx 180/0.597 = \mathbf{302}$. The observed first peak is at $\ell \approx 220$. The estimate is the right order and about 40% high because the simple relation is approximate and because gravitational driving shifts the first peak to larger scales than the naive acoustic scale $\ell_A = \pi/\theta_* = 302$ would suggest. **(c)** It compares a **known physical length at a known distance**, so the observed angle constrains the **geometry of the intervening space** — positive curvature would magnify the angle, negative curvature shrink it. The result is $\Omega_k = 0.001 \pm 0.002$: flat to a fraction of a per cent. This is the source of the flatness constraint the Cosmic Scale chapter used when arguing that flatness does not settle whether the universe is finite.

**5.** **(a)** Baryons add **mass but essentially no pressure** to the photon–baryon fluid, so they act as extra inertia on a spring: the fluid falls further into potential wells before photon pressure reverses it, and rebounds less far out. Compressions are enhanced and rarefactions suppressed. Odd-numbered peaks arise from modes caught at maximum compression, even-numbered from maximum rarefaction, so **more baryons raise the odd peaks relative to the even.** **(b)** The **dark matter density**. Before matter–radiation equality, gravitational potentials **decay** as radiation streams out of them, and that decay drives the oscillations resonantly, boosting their amplitude. More dark matter brings equality earlier, so less driving occurs. The third peak's height relative to the second is sensitive to how much driving there was. **(c)** $\Omega_bh^2 = 0.02237 \pm 0.00015$, checked independently by **primordial deuterium** with LUNA's cross-section, agreeing to 0.2%. $\Omega_ch^2 = 0.1200 \pm 0.0012$, checked independently by **galaxy cluster abundances and weak lensing**, and by the galaxy power spectrum's turnover — none of which shares the CMB's assumptions.

**6.** **(a)** $\Omega_bh^2$, $\Omega_ch^2$, $100\theta_*$, $\tau$, $\ln(10^{10}A_s)$, $n_s$. **(b)** $(1 - 0.9649)/0.0042 = \mathbf{8.4\sigma}$ from scale-invariance. It matters because inflation **generically predicts a slight tilt below 1**: the inflaton rolls slowly rather than sitting still, so conditions differ marginally between the times different scales exited the horizon, and the predicted deviation is of order the slow-roll parameters — small, negative and of roughly the observed size. A confirmed tilt of the right sign and magnitude is among inflation's strongest quantitative successes, and it took two decades of measurement to establish. **(c)** $13.797 \pm 0.023$ Gyr, a fractional precision of $0.023/13.797 = \mathbf{0.17\%}$. Independent checks: the **ages of the oldest globular clusters**, from main-sequence turnoff fitting, and **radiometric dating of long-lived heavy nuclides** in metal-poor stars. Neither shares any assumption with the CMB fit, and both agree.

**7.** **(a)** The temperature spectrum spans $2 \le \ell \le 2500$, giving roughly **2,500 independent multipoles**, with polarisation adding more, against **six** free parameters — over-determined by a factor of about 400, with about **2,494 independent ways to fail.** **(b)** Because the objection presumes the model has enough freedom to accommodate whatever is observed. It does not. **Fit quality is evidence exactly to the extent that misfit was possible**, and here it was possible in thousands of ways. A model with one knob per observation cannot fail and its agreement carries no information; this one could fail almost everywhere and does not. **(c)** Once $\Omega_ch^2$ is fixed by the third peak, it must **simultaneously** produce the correct damping tail, the correct CMB lensing amplitude (detected by Planck at high significance), the correct growth rate of structure, the correct galaxy cluster abundance and the correct galaxy power spectrum, with no further adjustment. Dark matter is one number, not a free function shaped to match a curve.

**8.** **(a)** The **low quadrupole**; the **alignment of quadrupole and octopole**; the **hemispherical power asymmetry**; and the **Cold Spot**. **(b)** They were identified by **inspecting the map**, so the number of statistics that could have been computed was never fixed in advance. Any Gaussian random field contains features that look unusual to a searcher free to choose what to test after seeing the data, so the nominal significances overstate the evidence. **An a posteriori $3\sigma$ is not a $3\sigma$**, and correcting it requires knowing how many alternatives were implicitly examined — which nobody does. **(c)** *First*, they appear in **both WMAP and Planck**, with different instruments, scan strategies, frequency coverage and foreground-separation methods, so an instrumental origin is hard to sustain. *Second*, the large-scale ones are **cosmic-variance limited**, so no future experiment can add information. The likely outcome is that they **remain permanently unresolved** — an unusual position, and one worth stating rather than glossing over in either direction.

**9.** **(a)** $(73.04 - 67.36)/\sqrt{0.54^2 + 1.04^2} = 5.68/1.172 = \mathbf{4.85\sigma}$. **(b)** Because the CMB value is **derived, not measured**. What the peaks constrain directly is $\theta_* = r_*/D_M$ together with the peak heights; converting those into a present-day expansion rate requires assuming $\Lambda$CDM and its evolution. If the model is wrong in some respect, the derived $H_0$ is wrong with it. Meanwhile the local distance-ladder value is nearly model-independent. A disagreement between a model-conditional and a model-independent determination therefore **points at the model**, which is precisely why the tension is read as a possible signal of new physics rather than as an error in either measurement. **(c)** The CMB predicts a clustering amplitude $S_8 = \sigma_8\sqrt{\Omega_m/0.3}$ somewhat higher than weak-lensing surveys measure, at **2–3$\sigma$**. It has **narrowed with better data** rather than growing, which is the behaviour of a systematic rather than of new physics, and plausible candidates exist in shear calibration and in baryonic feedback on small scales. **Honest summary**: the model fits ~2,500 multipoles with six parameters and passes, which is the strongest single piece of evidence in cosmology; and it carries one 4.9$\sigma$ tension with an independent measurement, one 2–3$\sigma$ tension with another, and several unexplained large-scale features that may never be resolved. **Both halves are true, and reporting either alone misrepresents the field.**$cmbMap_master$,
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
