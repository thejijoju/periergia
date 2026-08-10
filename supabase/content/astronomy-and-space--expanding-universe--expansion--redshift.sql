-- Astronomy & Space · The Expanding Universe — Expansion — "Redshift".
-- Curated master for
-- astronomy-and-space/expanding-universe/expansion/redshift
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The second Expansion chapter, and the one that repairs the damage the
-- first one diagnosed. Its whole content is one identity: 1 + z is the
-- ratio of scale factors, so a redshift measures how much the universe
-- has expanded since the light left, not how fast anything is moving.
-- Three physically distinct effects sharing one symbol; why v = zc fails
-- at exactly z = 1 and why the special-relativistic formula, though it
-- never exceeds c, is equally wrong here; everything else that scales
-- with (1+z) - CMB temperature, supernova light-curve durations, surface
-- brightness at the fourth power - with the light-curve stretching
-- singled out as the measurement that killed tired light; redshift as
-- cosmology's natural time coordinate and what converting it to a
-- distance actually costs; and photometric redshifts with their
-- catastrophic-outlier failure mode. ~10,000 words, multi-question
-- checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/expansion/redshift',
    'research',
    'advanced',
    'read',
    $expRed_master$> A cosmological redshift is not a velocity. It is a **ratio of sizes**: $1 + z = a_0/a_{\rm emit}$, the factor by which the universe has expanded since the light set out. Every difficulty in this subject comes from the habit of reading $z$ as a speed, and every difficulty dissolves once it is read as a stretch. A galaxy at $z = 1$ is not "moving at some velocity"; it emitted its light when the universe was **half its present size**, and that light has been stretched to twice its original wavelength on the way here.

The previous chapter diagnosed the problem — the notation of $v = H_0d$ imports intuitions from ordinary motion that do not survive the transfer. This chapter supplies the replacement, and it is a single identity from which everything else follows.

## Three effects, one symbol

The word "redshift" names three physically distinct things, and conflating them causes most of the confusion in this area.

**Doppler redshift** arises from relative motion through space. A source receding from you emits crests that arrive further apart. This is ordinary kinematics and it is what a star's radial velocity measures.

**Gravitational redshift** arises from climbing out of a potential well. A photon leaving a massive body loses energy, and its wavelength lengthens. This is the effect met in the Supermassive Black Holes chapter, shaping the red wing of the iron Kα line.

**Cosmological redshift** arises from the expansion of space during the light's journey. It is not motion and not a potential well.

All three lengthen wavelengths, all three are reported as $z$, and only the first is a velocity. In practice an observed redshift is usually a sum: a distant galaxy's $z$ contains a large cosmological term plus a small Doppler contribution from its peculiar motion — which is exactly the decomposition the Superclusters chapter had to fight, where the peculiar term is the signal and the cosmological term is the thing subtracted off.

## The identity

Define redshift observationally, with no interpretation attached:

$$z \equiv \frac{\lambda_{\rm obs} - \lambda_{\rm emit}}{\lambda_{\rm emit}} \qquad\Longrightarrow\qquad 1 + z = \frac{\lambda_{\rm obs}}{\lambda_{\rm emit}}$$

That is just a measurement: compare an observed wavelength with its laboratory value.

Now the physics. In an expanding universe, a light wave's wavelength is stretched in proportion to the expansion itself — the wave is carried along with the space it travels through, and its crests separate as that space grows. So

$$\boxed{\,1 + z = \frac{a_0}{a_{\rm emit}}\,}$$

with $a$ the scale factor and $a_0$ its present value. **Redshift measures the expansion factor since emission, and nothing else.**

Read the numbers this way and they become transparent:

| Redshift | Universe was this fraction of present size | Light stretched by |
| --- | --- | --- |
| $z = 0.1$ | 0.909 | 1.1× |
| $z = 1$ | **0.500** | 2× |
| $z = 2$ | 0.333 | 3× |
| $z = 6$ | 0.143 | 7× |
| $z = 7.6$ (most distant quasars) | 0.116 | 8.6× |
| $z = 1100$ (the CMB) | **0.0009** | 1101× |

The last row is worth pausing on. The cosmic microwave background comes from an epoch when the universe was about **one part in eleven hundred** of its present size. That single number does more work than any verbal description of the early universe.

Notice what the identity does *not* contain: any velocity, any distance, and any cosmological parameters. **Redshift is the most model-independent quantity in cosmology.** Converting it into a distance or a time requires knowing the expansion history — which requires a model — but $z$ itself is a direct, assumption-free measurement, and this is why observational cosmology is organised by redshift rather than by distance.

```checkpoint
q: A galaxy is observed at z = 3. What does this most directly tell you?
a: That it is receding at three times the speed of light
x: v = zc is not the correct relation, and it would give a superluminal answer for any z > 1 — which alone shows the formula has been pushed outside its domain.
a*: That the universe was one quarter of its present size when the light was emitted, since 1 + z = a₀/a_emit
a: That it lies at a distance of 3c/H₀
x: Converting redshift to distance requires integrating the expansion history and so depends on the cosmological model; no simple multiple of the Hubble radius does it.
a: That its light has taken three times the Hubble time to reach us
x: Lookback time is also a model-dependent integral, and it does not scale linearly with z — at z = 3 it is roughly 11.5 Gyr, not three Hubble times.
hint: The definition compares two wavelengths. What else has the same ratio?
why: A wave travelling through expanding space is stretched in proportion to the expansion, so the ratio of observed to emitted wavelength equals the ratio of scale factors: 1 + z = a₀/a_emit. At z = 3 that gives a_emit/a₀ = 1/4 — the universe was a quarter of its present size. The identity contains no velocity, no distance and no cosmological parameters, which is why redshift is the most model-independent quantity in cosmology and why surveys are organised by it. Distances and times, by contrast, require integrating the expansion history, and therefore a model.
---
q: Why is redshift preferred over distance as the organising coordinate in observational cosmology?
a: Because distances cannot be measured at cosmological scales at all
x: They can — the distance ladder and standard candles reach to high redshift, which is how the acceleration was discovered.
a*: Because redshift is measured directly from a spectrum with no model assumptions, while converting it to a distance requires integrating an assumed expansion history
a: Because redshift is measured more precisely than distance, though both are equally model-dependent
x: Precision is not the distinction — redshift is indeed far more precise, but the decisive difference is that it carries no cosmological assumptions.
a: Because distance is ambiguous in relativity, having several definitions, while redshift has only one
x: There genuinely are several distance measures — luminosity, angular diameter, comoving — and that is a real complication, but the primary reason is model independence rather than definitional multiplicity.
hint: Ask what you must already believe about the universe before each quantity can be quoted.
why: A redshift comes from comparing an observed wavelength with a laboratory value: no cosmology enters, and the number stands whatever the expansion history turns out to be. A distance requires knowing how the scale factor evolved between emission and now, which means assuming values for the matter density, dark energy and the rest. Quoting a survey in redshift therefore keeps the data separable from the interpretation, so that when cosmological parameters are revised the catalogue does not have to be. It also explains why the several distance measures — luminosity, angular diameter, comoving — all reduce to the same thing at low z but diverge at high z: each answers a different question about a quantity that is no longer simple.
```

## Why the velocity formulae fail

Students are taught $v = cz$ for small redshifts, and it works — for small redshifts. Applied beyond them it produces nonsense, and seeing exactly how it fails is instructive.

| $z$ | Naive $v = zc$ | Special-relativistic formula |
| --- | --- | --- |
| 0.1 | 29,980 km/s (0.10c) | 28,488 km/s (0.095c) |
| 1 | **299,800 km/s (1.00c)** | 179,880 km/s (0.600c) |
| 3 | 899,400 km/s (3.00c) | 264,529 km/s (0.882c) |
| 6 | 1,798,800 km/s (6.00c) | 287,808 km/s (0.960c) |

The naive formula reaches exactly $c$ at $z = 1$ and exceeds it thereafter — an unmistakable sign that it has been pushed outside its domain.

The obvious repair is the special-relativistic Doppler formula,

$$1 + z = \sqrt{\frac{1 + v/c}{1 - v/c}}$$

which never yields $v > c$ however large $z$ becomes. It looks like the fix, and it is **also wrong** for cosmological redshifts.

The reason is that special relativity describes motion through **flat, static** spacetime. Its Doppler formula answers the question: *at what speed is this source moving past me, in a spacetime that is not itself changing?* That is not what is happening. The galaxy is approximately at rest in its local space; the spacetime between us is not static; and there is no globally meaningful "relative velocity" between distant objects in a curved, expanding spacetime at all. Comparing velocity vectors at widely separated points requires transporting one to the other, and in curved spacetime the answer depends on the path taken.

So the honest position is: **neither formula applies, and the question "how fast is that galaxy moving?" has no well-defined answer.** The well-defined statements are the redshift itself, and the recession *rate* $v = H_0 d$ of the previous chapter — which is a rate of change of a distance, not a velocity through space, and which is why it may exceed $c$ without difficulty.

**A quantity can be well defined in one regime and simply not exist in another.** That is a stronger claim than "hard to measure", and it is the correct one here.

```checkpoint
q: The naive formula v = zc gives exactly c at z = 1. The special-relativistic Doppler formula never exceeds c. Why is the relativistic version nonetheless the wrong tool for cosmological redshift?
a: Because it is only valid for sources moving directly away, and galaxies have transverse motion too
x: There is a transverse Doppler term, and it is a real refinement, but it is not why the formula fails here — it would still be the wrong framework for radial motion.
a*: Because special relativity describes motion through flat, static spacetime, whereas the galaxy is nearly at rest locally and the spacetime between is itself expanding — so no globally meaningful relative velocity exists to put into the formula
a: Because it requires knowing the source's rest-frame wavelength, which is unavailable at high redshift
x: Rest wavelengths are laboratory constants and are known precisely; identifying which line is which is a separate practical matter, not the conceptual problem.
a: Because it neglects gravitational redshift, which dominates at large distances
x: Gravitational redshift from intervening structure is a small correction, not the reason the special-relativistic framework does not apply.
hint: What kind of spacetime does the special-relativistic formula assume, and is that what we are in?
why: The special-relativistic Doppler formula answers a precise question: how fast is this source passing me, in a spacetime that is flat and unchanging? Neither condition holds. The galaxy sits essentially at rest in its own local space, and the space between us is expanding. Worse, "relative velocity of distant objects" is not well defined in curved spacetime at all — comparing velocity vectors at separated points requires parallel transport, and the result depends on the path. So the formula does not merely give a wrong number; the quantity it computes does not exist. What is well defined is z itself, and the recession rate H₀d, which is a rate of change of distance rather than a velocity through space.
---
q: What is the correct reading of "the galaxy at z = 6 is receding at 0.96c"?
a: It is correct — the special-relativistic formula gives that value
x: The formula returns that number, but applying it presupposes flat static spacetime, so the number does not describe anything physical here.
a*: It is a category error dressed as a measurement — the special-relativistic formula has been applied outside its domain, and the underlying quantity is not defined for distant objects in an expanding spacetime
a: It is correct but incomplete, since gravitational redshift should be added
x: Adding a correction to a quantity that is not well defined does not repair it; the problem is the framework rather than a missing term.
a: It is approximately correct, becoming exact in the limit of large z
x: The disagreement between the formulae grows rather than shrinks with z, and neither converges on a physically meaningful velocity.
hint: Before asking whether the number is right, ask whether the thing it names exists.
why: The statement looks like a measurement and is not one. The special-relativistic formula presumes flat static spacetime; in an expanding, curved one there is no path-independent way to compare a distant galaxy's velocity with ours, so "its velocity relative to us" names nothing. This is a stronger objection than inaccuracy: the quantity is absent, not merely uncertain. What can be said is that its light arrived stretched by a factor of 7, that the universe was one seventh its present size when the light left, and that the distance between us is currently growing faster than c — none of which is a velocity through space.
```

{{image: Redshift | Absorption lines shifted toward longer wavelengths. The measurement is purely comparative — an observed wavelength against its laboratory value — which is why redshift carries no cosmological assumptions. The interpretation is where the content sits: for a distant galaxy the shift is not a Doppler effect but the stretching of the wave by the expansion it travelled through, so 1 + z gives the factor by which the universe has grown since the light set out.}}

## Everything stretches

Once redshift is understood as a stretch of the scale factor, a family of consequences follows — and each is independently measurable, which is what makes the picture testable rather than merely coherent.

**Wavelengths** stretch by $(1+z)$, by definition.

**Photon energies** fall by $(1+z)$, since $E = hc/\lambda$. Photons genuinely lose energy in transit. Where does it go? Nowhere — energy is not globally conserved in a non-static spacetime, because the conservation law follows (via Noether's theorem) from time-translation symmetry, which an expanding universe does not have. This unsettles people and should not: it is a precise statement about which symmetry is absent.

**Temperature** of a blackbody falls as $(1+z)$. A blackbody stays a blackbody under expansion — every wavelength stretches by the same factor, which is exactly the transformation that maps one Planck spectrum onto another — with

$$T(z) = T_0(1+z)$$

So the CMB, at $T_0 = 2.725$ K today, was at $2.725 \times 1101 = \mathbf{3000\ K}$ at recombination. That is not a coincidence but the point: 3000 K is roughly where hydrogen recombines, which is why the CMB was released then. **The number that defines the surface of last scattering is recovered from the redshift and a laboratory constant.**

**Time intervals** dilate by $(1+z)$. A process taking $\Delta t$ at the source is observed to take $(1+z)\Delta t$. This is the most valuable of the family, because it is directly checkable: Type Ia supernovae have characteristic light-curve durations, and distant ones are observed to rise and fall **more slowly**, by exactly the factor $(1+z)$. A supernova at $z = 1$ takes twice as long to play out.

**Surface brightness** falls as $(1+z)^4$ — the effect met in the Hubble Sequence chapter, combining photon energy loss, arrival-rate dilation, and two factors from angular geometry. At $z = 1100$ this is a suppression of $1.5\times10^{12}$.

```checkpoint
q: Distant Type Ia supernovae are observed to rise and fade more slowly than nearby ones, by a factor of (1+z). Why does this matter so much?
a: It shows that supernovae were intrinsically different in the early universe
x: The stretching tracks (1+z) exactly rather than varying with epoch or environment, which is the signature of a propagation effect, not of evolving progenitors.
a*: It is a direct measurement of cosmological time dilation, and it falsifies "tired light" models — in which photons lose energy en route but no time dilation would occur
a: It provides a way to measure supernova distances without a standard candle
x: The stretching gives the redshift, which is already measurable from the spectrum far more precisely; it adds no distance information.
a: It shows that the supernovae are moving away fast enough for special-relativistic time dilation
x: This reads the effect as motion through space again; the dilation follows from the expansion of the intervening spacetime, not from a velocity.
hint: What would a rival explanation of redshift — photons simply losing energy on the way — predict for the *duration* of an event?
why: Tired-light models proposed that photons lose energy over long journeys through some unknown interaction, reddening without any expansion. That reproduces the redshift by construction, so redshift alone cannot distinguish it. But it makes no prediction of time dilation: a supernova would still play out over its intrinsic duration. Expansion predicts that intervals stretch by exactly the same (1+z) that stretches wavelengths, because both are the same scale-factor ratio. Observation matches the expansion prediction. This is why the measurement is decisive — it separates two models that agree on the headline phenomenon by testing a consequence only one of them has.
---
q: The CMB is a near-perfect blackbody at 2.725 K today and was emitted at about 3000 K. Why does expansion preserve the blackbody form rather than distorting it?
a: Because the photons continually re-thermalise with intergalactic gas on their way to us
x: The universe became transparent at recombination — that is what released the CMB — so the photons have travelled essentially without interacting since.
a*: Because expansion stretches every wavelength by the same factor, and a Planck spectrum scaled uniformly in wavelength is another Planck spectrum at a lower temperature
a: Because blackbody radiation is the maximum-entropy state and is therefore preserved by any process
x: Maximum entropy does not confer immunity to spectral distortion; many processes do distort a blackbody, which is why measured limits on CMB spectral distortions are a sensitive probe.
a: Because the CMB's temperature is set by the expansion rate rather than by its emission conditions
x: The temperature was set at emission and has since fallen as 1/(1+z); expansion scales it rather than defining it.
hint: Ask what a Planck spectrum looks like after every wavelength in it is multiplied by the same number.
why: A Planck spectrum has a specific shape set by one parameter, its temperature. Multiplying every wavelength by (1+z) maps that shape exactly onto the Planck spectrum for a temperature lower by the same factor — the functional form is preserved, only T changes. So expansion cools the CMB while keeping it a blackbody, giving T(z) = T₀(1+z) and 2.725 × 1101 ≈ 3000 K at recombination. That 3000 K is roughly the temperature at which hydrogen recombines is the whole point: the number defining the surface of last scattering is recovered from the measured redshift and a laboratory constant. It is also why the CMB's observed blackbody perfection is such a strong constraint — any energy injection after recombination would leave a distortion, and none is seen.
```

## Redshift as a clock

Because $1+z$ is the expansion factor, and the expansion is monotonic, **redshift is a coordinate for cosmic time.** Higher $z$ means earlier. Cosmologists speak of "the universe at $z = 2$" the way historians speak of a century, and it is the natural coordinate for the same reason: it is what the observations directly deliver.

Converting a redshift to an actual time or distance is a different matter, and requires the expansion history:

$$t_{\rm lookback} = \int_0^z \frac{dz'}{(1+z')H(z')}$$

with $H(z)$ depending on the matter density, the dark energy density, and its equation of state. **The conversion is where the model enters.** A survey catalogue quoted in redshift survives a revision of cosmological parameters; one quoted in gigaparsecs does not.

This is also why the several **distance measures** in cosmology diverge at high redshift. Luminosity distance (from flux), angular diameter distance (from apparent size), and comoving distance all agree at low $z$ and differ substantially at high $z$, because the universe expanded between emission and reception and each measure weights that differently. Angular diameter distance famously *decreases* beyond $z\approx1.6$ — objects further away subtend *larger* angles, because they were closer when they emitted. There is no single "the distance" to a high-redshift galaxy; there are several, each answering a different question.

## Measuring it

Two methods, with very different reliability.

**Spectroscopic redshifts.** Identify emission or absorption lines and compare with laboratory wavelengths. Precision is excellent — a few parts in $10^5$ or better — and the identification is usually unambiguous once several lines are visible, since their spacings must match a known pattern. This is the gold standard.

**Photometric redshifts.** Measure brightness through a set of broad filters and fit the resulting coarse spectral shape against templates. Far cheaper: a single image yields redshifts for every object in the field, which is what makes surveys of hundreds of millions of galaxies possible.

The characteristic failure mode is worth knowing, because it shapes how such surveys are used. Photometric fitting keys on broad spectral features — chiefly the **Balmer break** at 4000 Å and the **Lyman break** at 912 Å. If the fit misidentifies which break it is seeing, the inferred redshift is not slightly wrong but **catastrophically** wrong: a galaxy at $z = 0.2$ can be assigned $z = 3$. These **catastrophic outliers** are not rare enough to ignore, and because the error is a discrete misassignment rather than a small perturbation, it cannot be reduced by averaging.

The consequence is structural. A photometric survey's error budget is not a single scatter but **a scatter plus an outlier fraction**, and analyses must model both. Any statistic sensitive to the tails — the abundance of the highest-redshift objects, for instance — is dominated by the outliers rather than by the bulk. **A discrete failure mode is not a large error bar, and treating it as one gives confident wrong answers.**

```checkpoint
q: Photometric redshifts suffer "catastrophic outliers", where a galaxy at z = 0.2 is assigned z = 3. Why can this not be handled by simply widening the error bars?
a: Because the errors are systematic rather than random, and systematics cannot be quantified
x: Systematics can be quantified and modelled; the specific difficulty here is the shape of the error distribution rather than its systematic character.
a*: Because the error is a discrete misidentification of which spectral break is being seen, not a small perturbation — so the error distribution has heavy tails that a single scatter parameter does not describe, and averaging does not suppress it
a: Because photometric redshifts have no meaningful uncertainty at all
x: They have well-characterised uncertainties for the bulk of objects; the problem is the population that fails differently, not an absence of error estimates.
a: Because the outliers are too rare to appear in any realistic sample
x: They are common enough to matter — typically a few per cent — and rarity would in any case make them easier, not harder, to handle.
hint: Ask what shape the error distribution has, and which measurements are sensitive to its tails.
why: Photometric fitting keys on broad features, mainly the 4000 Å Balmer break and the 912 Å Lyman break. Mistaking one for the other does not shift the answer slightly; it relocates the galaxy by a large factor in (1+z). The resulting error distribution is a narrow core plus a heavy tail, and a Gaussian scatter cannot represent it — quoting a single sigma will understate the risk for anything tail-sensitive. Since the misassignment is discrete rather than noisy, more objects do not average it away. Analyses must therefore carry both a scatter and an outlier fraction, and any statistic dominated by rare extremes — the abundance of the highest-redshift galaxies, say — is governed by the outliers rather than the bulk.
---
q: Angular diameter distance decreases beyond z ≈ 1.6, so more distant objects subtend *larger* angles. How can that be?
a: Gravitational lensing by intervening structure magnifies distant objects
x: Lensing does magnify some objects, but it is a stochastic effect on individual sightlines, not a systematic turnover in the distance–angle relation.
a*: Because such objects were physically closer to us when they emitted their light, and the angle is set by the separation at emission — the universe has expanded since, carrying them away without changing the angle their light left at
a: Because the universe is spatially curved, and positive curvature focuses light
x: The universe is measured to be spatially flat to high precision, and the turnover occurs in a flat universe from expansion alone.
a: Because their light is redshifted, and redshifted light diffracts more
x: Diffraction depends on the aperture of the telescope rather than on the source's redshift, and plays no part in this relation.
hint: When was the angle set — at emission or at reception?
why: The angle subtended is fixed by the object's physical size and its distance *at the moment of emission*, since that geometry determines the directions the light rays set off in. For very high redshift, the universe was much smaller then, so the object was genuinely nearby when it emitted — and the angle is correspondingly large. Expansion has since carried it far away, but that does not alter the angle the light was already travelling at. Hence angular diameter distance rises, peaks near z ≈ 1.6, and falls. This is also why "the distance" to a high-redshift galaxy is not a single number: luminosity distance, angular diameter distance and comoving distance answer different questions and diverge, agreeing only at low z where expansion during transit is negligible.
```

{{image: Type Ia supernova | A Type Ia supernova, whose light curve rises and fades over a characteristic interval. Distant ones are observed to play out more slowly, stretched by exactly the factor (1+z) that stretches their wavelengths — a direct measurement of cosmological time dilation. It is also the observation that killed tired-light alternatives, which reproduce the redshift by construction but predict no dilation at all.}}

## Why tired light is dead

It is worth being explicit about the alternative, because it was a serious proposal and its refutation is a clean piece of scientific reasoning.

**Tired light**, proposed by Zwicky in 1929, holds that photons lose energy gradually over long journeys through some interaction with the intervening medium — producing redshift with no expansion at all. The universe would be static, and the correlation of redshift with distance would follow trivially, since more distant light has travelled further.

Note that it explains the headline observation *perfectly*. Redshift alone cannot distinguish it from expansion. Refuting it requires finding a consequence on which the two disagree, and there are several:

**Time dilation.** Expansion stretches time intervals by $(1+z)$; tired light does not, since it affects photons in flight rather than the rate at which events occur. Type Ia supernova light curves are observed stretched by exactly $(1+z)$. **Decisive.**

**The blackbody spectrum.** Expansion cools a blackbody while preserving its form. Any energy-loss mechanism acting on individual photons would generally be wavelength-dependent and would **distort** the Planck spectrum. The CMB is a blackbody to extraordinary precision, with no distortion detected.

**Angular sizes and surface brightness.** The $(1+z)^4$ dimming and the angular-diameter turnover are expansion predictions with no counterpart in a static universe.

**The mechanism itself.** Any interaction robbing photons of energy over megaparsec paths would also scatter them, blurring distant objects. Distant galaxies are sharp.

The structure of this refutation is the transferable part. **A rival theory that reproduces the observation it was built to explain has told you nothing; it must be tested on what it was not built for.** Tired light was constructed to match redshift, so matching redshift is no evidence in its favour. Its failure on time dilation — a consequence its author never considered — is what settles the matter. The same standard applies to every alternative in cosmology, including the ones currently proposed to resolve the Hubble tension: reproducing $H_0$ is the entry fee, not the result.

```checkpoint
q: Tired light reproduces the redshift–distance correlation exactly. Why does that count for nothing in its favour?
a: Because the correlation it reproduces was already explained by expansion, and the earlier explanation has priority
x: Priority is not an evidential principle — if a later theory explained the data better it would win regardless of order.
a*: Because it was constructed to reproduce that correlation, so agreement there is a design feature rather than a test — evidence comes only from consequences the model was not built to deliver
a: Because the correlation is not actually observed with enough precision to discriminate between models
x: The correlation is measured very well; the point is that both models fit it, so precision on this observable cannot separate them however good it gets.
a: Because tired light makes no quantitative prediction, only a qualitative one
x: It can be made quantitative by choosing the energy-loss rate — and that freedom is precisely what lets it fit, which is the problem rather than a defence.
hint: Ask what the model would have looked like if the data had come out differently.
why: A model with a free parameter tuned to match an observation will match it, and that match carries no information — had the redshift–distance slope been different, the energy-loss rate would simply have been chosen differently. Evidence requires the model to be exposed to something it could fail. For tired light that means time dilation, the blackbody spectrum, surface-brightness dimming and image sharpness — none of which its author had in view, and on the first of which it fails outright, since supernova light curves stretch by exactly the (1+z) that expansion predicts and tired light predicts not at all. The same discipline applies to modern proposals: an early-dark-energy model that reproduces H₀ has paid an entry fee, not produced a result.
---
q: A proposed modification of cosmology is said to "explain the Hubble tension". What should you ask before treating that as support for it?
a: Whether it has been published in a peer-reviewed journal
x: Peer review filters for competence and novelty but does not establish that a fit constitutes evidence; the question is evidential rather than procedural.
a*: What it predicts for quantities it was not tuned on — the CMB damping tail, σ₈, the growth rate — and whether anyone has checked
a: Whether it reduces the tension below 3σ
x: How far the tension is reduced measures the fit, which is what the model was built to achieve; the size of the improvement is not the same as evidence.
a: Whether it requires fewer free parameters than ΛCDM
x: Parsimony is a genuine consideration and these models generally add parameters, but the primary question is whether the model has been tested where it was not fitted.
hint: The same question that killed tired light, asked of a live proposal.
why: Any model introduced to resolve a specific discrepancy will resolve it — that is the criterion by which it was selected, so success there is guaranteed and uninformative. What distinguishes a candidate worth taking seriously is its behaviour on observables that played no part in its construction. Early dark energy, the most-explored resolution, alters the sound horizon and therefore leaves imprints on the CMB damping tail, on σ₈ and on the growth rate measured by redshift-space distortions — and it is the fit to those, not to H₀, that decides it. This is the same standard the Large-Scale Structure chapter applied to DESI's evolving dark energy, and the reason persistence under new, unfitted data is what makes an anomaly credible.
```

## Pulling the thread

- **Three distinct effects** share the symbol $z$ — Doppler (motion), gravitational (potential), cosmological (expansion) — and only the first is a velocity. An observed $z$ is usually a sum.
- The identity is $\mathbf{1 + z = a_0/a_{\rm emit}}$: redshift measures the **expansion factor since emission**. $z=1$ means half the present size; $z=1100$ means one part in 1101. It contains **no velocity, no distance and no cosmological parameters**, which is why cosmology is organised by redshift.
- $v = zc$ hits exactly $c$ at $z = 1$; the special-relativistic formula never exceeds $c$ but is **also wrong**, since it assumes flat static spacetime. **Relative velocity of distant objects is not defined** in an expanding curved spacetime — the quantity is absent, not merely uncertain.
- Everything scales with $(1+z)$: wavelengths, inverse photon energies, **blackbody temperature** — giving $2.725\times1101 \approx 3000$ K at recombination, the temperature at which hydrogen recombines — and **time intervals**, with surface brightness at $(1+z)^4$.
- Redshift is the natural **clock**; converting it to a time or distance requires $H(z)$, and **that is where the model enters**. Angular diameter distance **turns over near $z\approx1.6$** because the angle was set when the object was closer.
- **Spectroscopic** redshifts are precise to $10^{-5}$; **photometric** ones are cheap but fail by **discrete break misidentification**, giving catastrophic outliers that no widening of an error bar represents.
- **Tired light** reproduces redshift by construction and dies on **time dilation** — supernova light curves stretched by exactly $(1+z)$ — plus the undistorted blackbody and the sharpness of distant images.

The transferable idea: **a theory earns nothing by explaining what it was built to explain.** Tired light was designed to produce redshift, so its success there is a tautology; the evidence lies entirely in consequences its author never had in view. This is the practical content of predictive testing, and it is easy to lose sight of, because a model fitted to a phenomenon always looks impressive when displayed against that phenomenon. The question worth asking of any explanation — a cosmological model, a diagnosis, a theory of a market — is not *does it account for the thing it was proposed for?* but **what does it say about something nobody was thinking about when it was written, and has anyone checked?**

## Further reading

{{book: Barbara Ryden | Introduction to Cosmology | 2016}}

{{book: John Peacock | Cosmological Physics | 1999}}

{{book: Malcolm Longair | The Cosmic Century | 2006}}

Beyond the books: the supernova time-dilation papers are short and unusually satisfying, being a case where a decisive test was available and simply performed. The COBE FIRAS measurement of the CMB spectrum is worth seeing for how extraordinary the blackbody agreement is — the error bars are smaller than the width of the plotted curve. And the photometric-redshift literature is a good study in a field carefully characterising a failure mode it cannot eliminate.

## Problems

*Useful numbers: 1 + z = λ_obs/λ_emit = a₀/a_emit; T(z) = T₀(1+z) with T₀ = 2.725 K; Δt_obs = (1+z)Δt_emit; surface brightness ∝ (1+z)⁻⁴; naive v = zc; SR Doppler 1+z = √[(1+v/c)/(1−v/c)]; c = 3.00 × 10⁵ km/s; recombination at z ≈ 1100; Balmer break 4000 Å, Lyman break 912 Å.*

**1.** *(The identity.)* For z = 1, 3 and 9: **(a)** state the factor by which light has been stretched. **(b)** State the universe's size relative to today at emission. **(c)** State what the identity does *not* contain, and why that matters.

**2.** *(Three effects.)* **(a)** Name the three physical origins of redshift and distinguish them. **(b)** State which is a velocity. **(c)** Explain how a distant galaxy's observed z decomposes, and which term the Superclusters chapter treated as signal.

**3.** *(Where the formulae break.)* **(a)** Compute v = zc at z = 1 and z = 3, in units of c. **(b)** Compute the special-relativistic value at z = 3. **(c)** Explain why neither is correct, and state what *is* well defined.

**4.** *(Temperature.)* **(a)** Compute the CMB temperature at z = 1100. **(b)** Explain why this number is not a coincidence. **(c)** Explain why expansion preserves the blackbody form.

**5.** *(Time dilation.)* **(a)** State how long a supernova with a 20-day rest-frame light curve appears to take at z = 1 and z = 3. **(b)** Explain why this observation is decisive against tired light. **(c)** State the general principle about testing rival theories.

**6.** *(Redshift as a clock.)* **(a)** Explain why redshift is the natural coordinate for cosmic time. **(b)** Write the lookback-time integral and state where the model enters. **(c)** Explain the practical consequence for how survey catalogues are quoted.

**7.** *(Distance measures.)* **(a)** Name three distance measures and what each is derived from. **(b)** Explain why angular diameter distance turns over near z ≈ 1.6. **(c)** Explain why they agree at low z.

**8.** *(Measuring redshift.)* **(a)** Contrast spectroscopic and photometric redshifts on precision and cost. **(b)** Explain the catastrophic outlier mechanism. **(c)** Explain why an outlier fraction cannot be folded into a scatter, and which analyses are most affected.

**9.** *(Refuting a rival.)* **(a)** State what tired light proposes and why redshift alone cannot refute it. **(b)** Give three independent observations that do. **(c)** State the general lesson and apply it to one current cosmological proposal.

## Worked answers

**1.** **(a)** $1+z$: at $z=1$, **2×**; at $z=3$, **4×**; at $z=9$, **10×**. **(b)** $a_{\rm emit}/a_0 = 1/(1+z)$: **1/2**, **1/4**, **1/10** of the present size respectively. **(c)** It contains **no velocity, no distance, and no cosmological parameters** — only a ratio of wavelengths, equal to a ratio of scale factors. This matters because it makes redshift the most **model-independent** quantity in cosmology: a measured $z$ stands whatever the matter density, dark energy content or expansion history turn out to be. Converting it to a distance or a lookback time requires integrating $H(z)$, and therefore assuming a model — which is why surveys are catalogued in redshift and why a revision of cosmological parameters does not invalidate the data.

**2.** **(a)** **Doppler**, from relative motion through space — a source receding emits crests that arrive further apart. **Gravitational**, from climbing out of a potential well, the photon losing energy as it escapes. **Cosmological**, from the expansion of space during transit, stretching the wave as it travels. **(b)** Only the **Doppler** shift is a velocity. **(c)** A distant galaxy's observed $z$ is dominated by the **cosmological** term, with a small additive **Doppler** contribution from its peculiar motion relative to the smooth Hubble flow (and a negligible gravitational term). The Superclusters chapter inverted the usual priority: there the **peculiar velocity** was the signal — it maps the mass distribution — and the cosmological term was the large quantity subtracted off, which is why the measurement is so hard, the subtraction being of two large numbers to leave a small one.

**3.** **(a)** $v = zc$: at $z=1$, $v = \mathbf{c}$ exactly; at $z=3$, $v = \mathbf{3c}$. **(b)** $1+z = 4$, so $(1+z)^2 = 16$ and $v/c = (16-1)/(16+1) = 15/17 = \mathbf{0.882c}$, i.e. $2.65\times10^5$ km/s. **(c)** The naive formula is a small-$z$ approximation and produces superluminal nonsense beyond $z=1$. The special-relativistic formula never exceeds $c$, but it presumes **flat, static spacetime** and asks how fast a source is passing us — neither condition holds. Worse, "relative velocity" of distant objects is **not defined** in curved expanding spacetime, since comparing velocity vectors at separated points requires parallel transport and the answer is path-dependent. What *is* well defined: the **redshift** itself; the **recession rate** $v = H_0d$, a rate of change of distance rather than a motion through space; and the statement that the universe was $1/(1+z)$ of its present size at emission.

**4.** **(a)** $T = 2.725 \times (1+1100) = 2.725 \times 1101 = \mathbf{3000\ K}$. **(b)** Because **3000 K is approximately the temperature at which hydrogen recombines** — below it, protons and electrons combine into neutral atoms and the universe becomes transparent, releasing the radiation we now see as the CMB. So the temperature recovered from the measured redshift and a laboratory constant is the temperature that *explains why the CMB exists at that redshift*. The consistency is a check on the whole picture, not a numerical accident. **(c)** Because expansion multiplies **every** wavelength by the same factor $(1+z)$, and a Planck spectrum uniformly rescaled in wavelength is exactly the Planck spectrum for a temperature lower by that factor. The functional form is preserved and only $T$ changes. This is why the CMB's measured blackbody perfection is such a powerful constraint: expansion cannot distort it, so any distortion would indicate energy injection after recombination — and none is detected.

**5.** **(a)** $\Delta t_{\rm obs} = (1+z)\Delta t_{\rm emit}$: at $z=1$, $2\times20 = \mathbf{40}$ days; at $z=3$, $4\times20 = \mathbf{80}$ days. **(b)** Because tired light explains redshift by photons **losing energy in flight** — a statement about photons, not about the rate at which events unfold. A supernova would therefore still play out over its intrinsic duration, and no dilation would be observed. Expansion instead predicts that time intervals stretch by exactly the same $(1+z)$ that stretches wavelengths, since both are the same ratio of scale factors. Observation matches expansion precisely, so the two models are separated by a consequence on which they disagree. **(c)** **A theory earns no credit for reproducing the observation it was constructed to explain.** Tired light was built to yield redshift, so its success there is a tautology; the evidence lies entirely in predictions its author never had in view. Rival theories must be tested on what they were *not* designed for.

**6.** **(a)** Because $1+z$ is the expansion factor and expansion is monotonic, so $z$ orders events uniquely in time — and, crucially, it is what observations **directly deliver**, with no interpretation required. Saying "the universe at $z=2$" specifies an epoch precisely without committing to any cosmological parameters. **(b)** $t_{\rm lookback} = \int_0^z dz'/[(1+z')H(z')]$. The model enters through **$H(z)$**, which depends on the matter density, the dark energy density and its equation of state. **(c)** A catalogue quoted in **redshift** survives revisions of the cosmological parameters; one quoted in **gigaparsecs or gigayears** must be recomputed whenever those change. Keeping the measurement separable from the interpretation is why surveys report $z$ and leave the conversion to the analysis stage.

**7.** **(a)** **Luminosity distance** $d_L$, from comparing observed flux with known intrinsic luminosity. **Angular diameter distance** $d_A$, from comparing observed angular size with known physical size. **Comoving distance**, the separation measured on a hypersurface of constant cosmic time, with expansion divided out. **(b)** Because the angle a source subtends is fixed by its physical size and its distance **at the moment of emission** — that geometry determines the directions its light rays set off in. At very high redshift the universe was much smaller, so the object was genuinely close when it emitted, and the angle is large. Subsequent expansion carries it far away but does not alter the angle its light was already travelling at. Hence $d_A$ rises, peaks near $z\approx1.6$, and declines. **(c)** Because at low $z$ the universe expands negligibly during the light's transit, so "distance at emission", "distance now", and the path length travelled are all nearly the same. The measures diverge only once expansion during transit becomes significant, which is precisely when the question "how far away is it?" stops having a single answer.

**8.** **(a)** *Spectroscopic*: identify lines and compare with laboratory wavelengths; precision a few parts in $10^5$ or better, and the identification is secure once several lines are seen, since their spacings must match a known pattern. Costly — each object needs its own spectrum. *Photometric*: measure brightness through broad filters and fit the coarse spectral shape to templates; far less precise, but a single image yields redshifts for every object in the field, which is what makes surveys of hundreds of millions of galaxies feasible. **(b)** The fit keys on broad spectral features, principally the **Balmer break** at 4000 Å and the **Lyman break** at 912 Å. If the fitter mistakes one for the other, the inferred redshift is wrong by a large factor rather than a small amount — a galaxy at $z=0.2$ can be assigned $z=3$. **(c)** Because the error is a **discrete misidentification**, not a perturbation, so the error distribution is a narrow core plus a heavy tail — a shape no single Gaussian scatter represents, and one that averaging does not suppress, since more objects simply supply more outliers in the same proportion. Analyses must carry **both** a scatter and an **outlier fraction**. The most affected are statistics dominated by the tails: the abundance of the highest-redshift objects, rare-object searches, and anything cutting on extreme values — where the sample can be composed largely of misassigned low-redshift interlopers.

**9.** **(a)** That photons **lose energy gradually in transit** through some interaction with the intervening medium, producing redshift in a **static** universe; more distant light has travelled further and so is redder, reproducing the redshift–distance correlation. Redshift alone cannot refute it because the model was **constructed** to reproduce exactly that. **(b)** *Time dilation*: supernova light curves stretched by exactly $(1+z)$, which tired light does not predict at all. *The blackbody spectrum*: expansion cools a Planck spectrum while preserving its form, whereas a photon energy-loss mechanism would generally be wavelength-dependent and distort it — and the CMB is a blackbody to extraordinary precision. *Image sharpness*: any interaction removing energy over megaparsec paths would also scatter photons and blur distant sources, which are observed sharp. **(c)** **Test a rival on what it was not built for.** Applied to a current proposal: **early dark energy**, introduced to relieve the Hubble tension, reproduces $H_0$ by construction — that is its purpose, and therefore no evidence for it. Its standing depends on independent consequences: what it does to the CMB damping tail, to $\sigma_8$ and the S8 tension, and to the growth rate measured by redshift-space distortions. Those are the tests that carry information, and reproducing $H_0$ is merely the entry fee.$expRed_master$,
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
