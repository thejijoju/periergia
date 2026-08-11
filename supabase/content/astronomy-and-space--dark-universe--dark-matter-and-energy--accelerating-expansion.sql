-- Astronomy & Space · The Dark Universe — Dark Matter & Energy — "Accelerating Expansion".
-- Curated master for
-- astronomy-and-space/dark-universe/dark-matter-and-energy/accelerating-expansion
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Closes Dark Matter & Energy. Organised around acceleration being an
-- unwanted discovery - both 1998 teams set out to measure deceleration
-- and neither believed the result at first - and around the fact that
-- the best-fitting parameter in cosmology carries the worst prediction
-- failure in physics. Type Ia standardisation via the Phillips
-- relation; the 0.25 mag dimming and what it means; q0 = Om/2 - OL =
-- -0.53 and why acceleration needs rho + 3p; the cosmological constant
-- problem at 123 orders of magnitude with a Planck cutoff and 59 with
-- a TeV one; why dark energy does not pull bound systems apart; the
-- independent confirmations from BAO, the CMB and the ISW effect; and
-- the alternatives - quintessence, modified gravity, backreaction.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/dark-matter-and-energy/accelerating-expansion',
    'research',
    'advanced',
    'read',
    $duAccel_master$> In 1998 two teams set out to measure how fast the expansion of the universe was **slowing down**. Both were confident it was; the only question was by how much, and the answer would reveal the matter density. Both found the opposite sign. Both spent months looking for the mistake, and neither found one.

That is the origin of dark energy, and the manner of its discovery matters. **Acceleration was not predicted, not sought and not welcome.** The theoretical structure it requires — a cosmological constant — had been proposed by Einstein, withdrawn by Einstein, and regarded for eighty years as an embarrassment. Reinstating it solved the observations and created **the largest quantitative failure in the history of physics**: the natural theoretical estimate of its value exceeds the measured one by 123 orders of magnitude.

This chapter is about that measurement, that number, and what has and has not been done about it.

## Standardisable, not standard

The measurement rests on Type Ia supernovae, and their usefulness needs stating carefully because the usual shorthand is wrong.

A Type Ia is the thermonuclear detonation of a white dwarf that has been pushed past stability by accretion from a companion or by merging with another white dwarf. Because the explosion involves a body near a characteristic mass, the peak luminosities are similar — but **not identical**, and treating them as identical would give distances good to perhaps 40%, which is useless for this purpose.

What makes them work is the **Phillips relation**, found in 1993: the intrinsic brightness correlates tightly with the *shape* of the light curve. **Brighter supernovae decline more slowly.** The physical reason is that more luminous events synthesise more ⁵⁶Ni, which both powers the light curve and, by raising the opacity, lengthens the time the ejecta take to become transparent. So the decline rate is an observable proxy for the luminosity, measurable without knowing the distance.

Applying that correction, along with one for colour, reduces the scatter to about **0.15 magnitudes** — roughly **7% in distance**, for a single event visible across billions of light-years.

**They are standardisable candles, not standard ones**, and the distinction carries the method's principal vulnerability. Standardisation is calibrated on nearby supernovae, in galaxies of a particular age and metallicity, and applied to distant ones in galaxies that are neither. **If the relation drifts with progenitor environment, the correction drifts with redshift, and the drift looks exactly like cosmology.** This was the first objection raised in 1998 and it remains the method's main systematic; two decades of work have constrained it without eliminating it in principle.

```checkpoint
q: Why are Type Ia supernovae described as "standardisable" rather than "standard" candles?
a: Because their peak luminosity is identical but interstellar dust makes the observed brightness vary
x: Dust is a real complication corrected separately by colour, but the peak luminosities genuinely differ before correction.
a*: Because their peak luminosities differ by enough to be useless uncorrected, and are made usable by the Phillips relation — brighter events decline more slowly, so the light-curve shape predicts the luminosity
a: Because only a subset are usable, and the rest are discarded as non-standard
x: Outliers are removed, but the method's power comes from correcting the whole population using light-curve shape, not from selecting a pure subsample.
a: Because their luminosity depends on redshift, which must be corrected for
x: A redshift-dependent luminosity would be a catastrophe for the method, not its operating principle — it is precisely the systematic everyone worries about.
hint: Ask what is measured about the light curve besides its peak.
why: Uncorrected, Type Ia peak luminosities scatter enough to give distances good to only tens of per cent. The Phillips relation makes them useful: intrinsically brighter events decline more slowly, because they synthesise more $^{56}$Ni, which powers the light curve and raises the opacity so the ejecta stay optically thick longer. Since the decline rate is measurable without knowing the distance, it serves as a proxy for luminosity. With that correction and a colour correction the scatter falls to ~0.15 magnitudes, about 7% in distance. The distinction matters because standardisation is calibrated locally and applied at high redshift, in galaxies of different age and metallicity — so any drift of the relation with environment mimics cosmology exactly. That was the first objection in 1998 and remains the method's principal systematic.
```

## The observation

The logic of the measurement is simple, and worth laying out in the order the teams actually ran it.

Measure a supernova's redshift, which gives how much the universe has expanded since the light left. Measure its corrected apparent brightness, which gives its distance. Do this for many supernovae over a range of redshift, and the resulting distance–redshift relation encodes the expansion history: **how the expansion rate at earlier times compared with now.**

In a universe containing only matter, gravity decelerates the expansion. The universe was expanding faster in the past, so it reached any given redshift sooner, so an object at that redshift is **closer** than it would be otherwise — and therefore **brighter**.

The high-redshift supernovae came in about **0.25 magnitudes fainter** than a matter-only universe predicts. Fainter means further away by a factor of about 1.12, which means the universe took longer to reach that redshift than deceleration allows, which means **the expansion has been speeding up.**

Two features of the 1998 result deserve emphasis, and both are routinely lost.

**Two teams, independently, with different methods.** The High-z Supernova Search Team led by Brian Schmidt with Adam Riess, and the Supernova Cosmology Project led by Saul Perlmutter, used different search strategies, different photometric pipelines and different light-curve fitting algorithms. They agreed. Given that the result was one nobody wanted, **the independence is what made it survivable.**

**Neither team believed it.** Both spent months searching for errors — dust, evolution, malfunctioning software, selection effects. Riess has described checking for a sign error in the code. **A result that contradicts expectation and survives its own discoverers' attempts to kill it is in a much stronger position than one that merely fits.** The Nobel Prize followed in 2011.

The quantitative statement is in terms of the **deceleration parameter**:

$$q_0 = \frac{\Omega_m}{2} - \Omega_\Lambda = \frac{0.315}{2} - 0.685 = -0.53.$$

Negative means accelerating. A matter-only flat universe would have $q_0 = +0.5$.

## Why acceleration requires negative pressure

Here is the conceptual heart of the chapter, and the place where intuition most reliably fails.

The second Friedmann equation gives the acceleration of the scale factor:

$$\frac{\ddot a}{a} = -\frac{4\pi G}{3}\left(\rho + \frac{3p}{c^2}\right).$$

Note what appears: **not the density alone, but $\rho + 3p/c^2$.** In general relativity, **pressure gravitates.** This is unfamiliar and it is not a subtlety — it is the whole mechanism.

For ordinary matter, $p \approx 0$, so the bracket is $\rho > 0$ and $\ddot a < 0$: deceleration, as expected. For radiation, $p = \rho c^2/3$, giving $2\rho$ — radiation decelerates *more* strongly than matter of the same density, which is a good check that the pressure term is real.

For acceleration one needs $\rho + 3p/c^2 < 0$, and since $\rho > 0$ this requires

$$p < -\frac{\rho c^2}{3},$$

i.e. **strongly negative pressure.** A cosmological constant has $p = -\rho c^2$ exactly, giving $\rho - 3\rho = -2\rho$, and acceleration follows.

Three clarifications, because this is where explanations usually go wrong.

**Negative pressure is not suction.** Nothing is being pulled. A material under tension — a stretched rubber sheet — has negative pressure in exactly this sense, and no one imagines it sucking. What matters cosmologically is not any mechanical effect but the appearance of $p$ in the gravitational source term.

**Dark energy does not push galaxies apart.** It has no repulsive force in the Newtonian sense. It changes the rate at which the scale factor grows, and that is all. The distinction is testable: **a repulsive force would act on bound systems**, and none is observed. The Earth's orbit, the Galaxy, the Local Group — all are entirely unaffected, because their internal gravity vastly exceeds the effect and they long ago decoupled from the expansion.

**"Space is being created" is a picture, not a mechanism.** The equations describe how distances between comoving observers evolve. Whether one says space is created, stretched, or simply that a metric coefficient increases, no observable distinguishes the phrasings.

```checkpoint
q: Acceleration requires $\rho + 3p/c^2 < 0$. Why does pressure appear at all in the acceleration equation?
a: Because pressure does work on the expanding volume, and that work must be accounted for
x: Energy conservation in an expanding universe is handled by the first Friedmann equation; the pressure term in the acceleration equation is a separate and specifically relativistic effect.
a*: Because in general relativity the source of gravity is the full stress–energy tensor, whose pressure components contribute — so pressure gravitates, and strongly negative pressure gravitates repulsively
a: Because a pressure gradient exerts a force, which adds to the gravitational acceleration
x: The universe is homogeneous, so there are no pressure gradients anywhere; the effect comes from pressure itself, not from its variation.
a: Because pressure is a form of energy, and energy contributes mass through $E = mc^2$
x: The energy in pressure is already counted in $\rho$; the $3p/c^2$ term is additional and does not reduce to a mass equivalence.
hint: Ask what the source of gravity is in general relativity, as opposed to in Newton's theory.
why: In Newtonian gravity the source is mass density. In general relativity it is the stress–energy tensor, whose diagonal components include the three pressures alongside the energy density — so the source term in the acceleration equation is $\rho + 3p/c^2$. The factor of three counts the spatial directions. This is not a correction but the mechanism: radiation, with $p = \rho c^2/3$, decelerates twice as strongly as matter of the same density, which confirms the term is physical. Acceleration then requires $p < -\rho c^2/3$, and a cosmological constant with $p = -\rho c^2$ gives $-2\rho$. Note what this is not: negative pressure is tension, not suction, and dark energy exerts no repulsive force on bound systems — the Earth's orbit and the Local Group are entirely unaffected, which is a testable distinction and one the observations respect.
```

{{image: Accelerating expansion of the universe | The distance–redshift relation for Type Ia supernovae compared with the predictions of decelerating and accelerating universes. Distant supernovae appear about 0.25 magnitudes fainter than a matter-only universe predicts, placing them roughly 12% further away than deceleration allows — the expansion took longer to reach that redshift than gravity alone permits. Two independent teams reported the result in 1998, each having set out to measure deceleration and each having searched at length for an error before publishing.}}

## The cosmological constant problem

The observations are settled. The theory is not, and the scale of the failure is worth stating precisely rather than gesturing at.

Quantum field theory predicts that the vacuum has energy. Every field has zero-point fluctuations, and summing their contributions gives a vacuum energy density. The sum diverges, so one imposes a cutoff at the energy scale beyond which the theory is not trusted.

**Cut off at the Planck scale** — the highest defensible choice, since general relativity certainly fails there — and the predicted vacuum energy density is of order the Planck density, $5.2\times10^{96}$ kg m⁻³.

**The measured value is** $\rho_\Lambda = \Omega_\Lambda\rho_c = 5.8\times10^{-27}$ kg m⁻³.

$$\frac{\rho_{\rm Planck}}{\rho_\Lambda} = 8.8\times10^{122}.$$

**The prediction exceeds the observation by 123 orders of magnitude.** It is often called the worst prediction in the history of physics, and the description is not rhetorical — no other quantitative disagreement between a serious theory and a measurement approaches it.

Being generous does not help much. Cut off at 1 TeV instead, where the Standard Model is definitely still valid and beyond which one might imagine unknown physics cancelling things, and the discrepancy is still **59 orders of magnitude**.

Expressed as an energy scale, the observed dark energy density corresponds to

$$\rho_\Lambda^{1/4} \approx 2.2\ \mathrm{meV},$$

which is a strange scale to find in fundamental physics — far below the electroweak scale, below even the neutrino masses, and with no obvious relation to anything.

Three observations about the problem's structure, because its shape is more instructive than its size.

**It is not a problem cosmology created.** The vacuum energy discrepancy existed before 1998 and was worse: the observed value was believed to be zero, so the required cancellation was exact. **A theory predicting $10^{123}$ times too much and a measurement of zero calls for a symmetry forcing the cancellation** — and symmetries can do that. A measurement of a small but non-zero value is harder, because the cancellation must be almost but not quite perfect. **Finding dark energy made the problem worse, not better.**

**Nothing forbids the cancellation.** Supersymmetry, if unbroken, cancels bosonic against fermionic contributions exactly. But supersymmetry is broken at or above the TeV scale, which leaves a residue some 59 orders too large.

**It may be a question about the wrong quantity.** The vacuum energy problem concerns the *absolute* value of the vacuum energy, and in non-gravitational physics only energy differences are observable. Gravity is what makes the absolute value matter. So the difficulty may lie in how gravity couples to vacuum energy rather than in the vacuum energy itself — **which is a reason for hope and not a solution.**

```checkpoint
q: Why did the 1998 discovery of a small non-zero dark energy density make the cosmological constant problem *harder* rather than easier?
a: Because it added a new component that must be explained alongside the existing vacuum energy
x: Dark energy is naturally identified *with* vacuum energy; it is not an additional component requiring separate explanation.
a*: Because a predicted value $10^{123}$ times too large against an observed zero could be explained by a symmetry enforcing exact cancellation, whereas a small non-zero value requires a cancellation that is almost but not quite perfect — which no symmetry naturally produces
a: Because it showed the vacuum energy calculation was wrong, removing the theoretical framework that had been used
x: The calculation was always suspect at this level; what changed was the target it had to hit, not confidence in the method.
a: Because it required abandoning supersymmetry, which had been the leading proposed solution
x: Supersymmetry was already known to be broken, leaving a large residue; the discovery did not change that.
hint: Ask which is easier to arrange: exactly zero, or $10^{-123}$ of the natural value.
why: Before 1998 the observed cosmological constant was believed to be zero, and exact zeros are the sort of thing symmetries produce — unbroken supersymmetry, for instance, cancels bosonic against fermionic vacuum contributions exactly. The task was to find the symmetry. After 1998 the target is not zero but roughly $10^{-123}$ of the natural estimate: a cancellation of 122 decimal places followed by a non-zero remainder in the 123rd. No symmetry does that, because symmetries enforce exact relations rather than near-misses. This is why the discovery was theoretically unwelcome as well as observationally surprising, and why the problem's shape — a fine-tuning rather than a vanishing — is what makes it resistant. A possible way out is that the difficulty lies in how gravity couples to vacuum energy rather than in the vacuum energy itself, since only gravity makes the absolute value observable at all.
---
q: The observed dark energy density corresponds to an energy scale of about 2.2 meV. Why is that value itself considered a puzzle?
a: Because it is too small to measure directly, so the value rests entirely on cosmological inference
x: Its smallness does make direct detection impossible, but the puzzle is about where such a scale comes from, not about how it is measured.
a*: Because fundamental physics has no scale anywhere near it — it lies far below the electroweak scale, below even the neutrino masses, and has no evident relation to any known parameter
a: Because it is comparable to the CMB temperature, which suggests a connection that no theory provides
x: The CMB temperature corresponds to about 0.23 meV, an order of magnitude below, and no one regards the near-coincidence as significant.
a: Because a scale that small should have been washed out by inflation
x: Inflation dilutes densities but a cosmological constant is unaffected by dilution, which is what distinguishes it.
hint: List the energy scales fundamental physics contains, and ask where 2.2 meV would sit among them.
why: Taking the fourth root of the measured dark energy density gives an energy scale of about 2.2 meV. Fundamental physics has scales at the Planck energy ($10^{28}$ eV), grand unification ($10^{25}$), the electroweak scale ($10^{11}$), QCD ($10^{8}$), and the electron mass ($5\times10^{5}$) — and then nothing until the neutrino masses, which are themselves anomalously small at perhaps $10^{-2}$ eV. A scale of $2\times10^{-3}$ eV sits below all of them and connects to none. The problem is therefore twofold: the natural estimate is 123 orders of magnitude too large, and the value that is actually observed corresponds to a scale with no home in any existing theory. A solution must explain both, which is why proposals that merely suppress the vacuum energy do not suffice.
```

## What else it could be

If a cosmological constant is theoretically catastrophic, the alternatives deserve a hearing. Four classes exist, and none is established.

**Quintessence.** A dynamical scalar field slowly rolling down a potential, giving $w$ close to but not exactly $-1$ and varying with time. The attraction is that a rolling field can have a naturally small present-day energy, and some potentials produce "tracker" behaviour in which the field's density follows the dominant component for most of cosmic history — which would address the coincidence problem. The difficulty is that **the field must be extraordinarily light**, with a mass around $10^{-33}$ eV to roll on cosmological timescales, and such a field generically couples to matter and would produce fifth forces and time-varying constants that are not observed. Current constraints, $w = -1.03 \pm 0.03$, leave room but are tightening.

**Modified gravity.** If general relativity is wrong on the largest scales, acceleration might require no dark energy at all — $f(R)$ theories, extra dimensions, and related proposals. Two things constrain them severely. **Solar System tests** require any modification to be screened at small scales, which is achievable but adds machinery. And **the gravitational wave event GW170817**, whose signal arrived within 1.7 seconds of its gamma-ray counterpart after travelling 130 million light-years, established that gravitational waves travel at the speed of light to about one part in $10^{15}$ — **which eliminated a large class of modified-gravity models overnight.** That is one of the cleanest examples in recent physics of a single observation closing off a research direction.

**Backreaction.** The Friedmann equations assume homogeneity, but the real universe is lumpy, and averaging a nonlinear theory does not commute with solving it. Perhaps the apparent acceleration is an artefact of averaging. **The idea is legitimate in principle and the consensus is that the effect is far too small** — estimates put it orders of magnitude below what is required — though a minority continues to argue otherwise.

**Anthropic selection.** In a multiverse with varying vacuum energy, only regions where it is small enough for structure to form contain observers. Weinberg used this in 1987 to argue that $\Lambda$ should be small but non-zero, and **predicted a value within an order of magnitude of what was later found** — one of the very few successful anthropic predictions. Whether it counts as an explanation depends on whether the ensemble exists, which the Multiverse chapter takes up.

The honest position: **a cosmological constant fits every observation and explains nothing; the alternatives explain more and fit worse.** That is not a comfortable place for a field to be, and it is where the field is.

```checkpoint
q: GW170817's gravitational wave signal arrived within 1.7 seconds of its gamma-ray counterpart after 130 million light-years. Why did this matter for dark energy?
a: Because it confirmed that gravitational waves exist, validating general relativity and hence the cosmological constant
x: Gravitational waves had already been detected in 2015; this event's significance was the simultaneous electromagnetic counterpart.
a*: Because it established that gravitational waves and light travel at the same speed to about one part in $10^{15}$, eliminating a large class of modified-gravity models that had been proposed to explain acceleration without dark energy
a: Because the event's distance provided a new standard candle, improving the measurement of the expansion history
x: It did provide a "standard siren" distance, which is valuable for $H_0$, but the decisive impact on dark energy models came from the arrival-time comparison.
a: Because neutron star mergers produce heavy elements, constraining the cosmic matter budget
x: The nucleosynthesis result was important in its own right but bears on chemical enrichment, not on dark energy.
hint: Ask what many modified-gravity theories predict about the propagation speed of gravitational waves.
why: Many modifications of general relativity introduce extra fields or higher-derivative terms that alter how gravitational waves propagate, generically making their speed differ from $c$ by a small amount. Before 2017 that difference was essentially unconstrained. GW170817 was a neutron star merger with a gamma-ray burst counterpart, and the 1.7-second arrival difference over 130 million light-years bounds the fractional speed difference at about $10^{-15}$ — far tighter than the modifications required. Whole families of models, including large classes of Horndeski and related theories, were ruled out within days of the announcement. It is among the cleanest cases in recent physics of a single measurement closing a research direction, and it illustrates that constraints on dark energy alternatives often arrive from outside cosmology entirely.
---
q: Weinberg argued anthropically in 1987 that $\Lambda$ should be small but non-zero, and predicted a value within an order of magnitude of what was later measured. How should that success be weighed?
a: As decisive — a correct quantitative prediction made a decade in advance settles the matter
x: The prediction was correct within an order of magnitude, which is real but not decisive, and its premise remains untested.
a*: As a genuine success that is nonetheless conditional on a premise nobody has tested — the argument requires an ensemble in which the vacuum energy actually varies, and whether such an ensemble exists is unknown
a: As meaningless, since anthropic arguments make no predictions and cannot be tested
x: This one did make a prediction, in advance, that was borne out — the categorical dismissal is not sustainable.
a: As superseded, since quintessence now explains the value without anthropic reasoning
x: Quintessence does not predict the observed value either; it offers a mechanism for smallness without fixing the number.
hint: Ask what has to be true of the world for the argument to have any force at all.
why: Weinberg's argument is a selection effect with a sharp edge: if the vacuum energy were much larger, expansion would have accelerated before structure could form, so no observers would exist to measure it — which bounds it from above at roughly the observed order of magnitude. That is a real prediction, made in 1987 and borne out in 1998, and very few anthropic arguments have that record. But the reasoning requires an ensemble of regions with differing vacuum energy for the selection to operate on; without one there is nothing to select from and the argument has no content. The existence of such an ensemble is exactly what is not known, and is not currently testable. The correct weighting is therefore: a striking success resting on an untested premise — a genuinely awkward combination rather than either a triumph or a dismissal.
```

## Is $w$ actually constant? The current state

The discussion so far has quoted $w = -1.03 \pm 0.03$ under the assumption that $w$ does not change. That assumption is now under active pressure, and the situation deserves setting out carefully because it is the most consequential open question in the field and easy to report badly in either direction.

The Dark Energy Spectroscopic Instrument has been measuring baryon acoustic oscillations across millions of galaxies and quasars, spanning redshifts from below 0.1 to above 2. Combining its BAO measurements with the CMB and with supernova compilations, DESI has reported a **preference for evolving dark energy** over a cosmological constant.

The preferred behaviour has $w_0 > -1$ today and $w_a < 0$, which in the $w(a) = w_0 + w_a(1-a)$ parameterisation means dark energy was **more negative in the past and is weakening now** — crossing $w = -1$ at intermediate redshift.

The reported significance is where care is needed. It falls in the range of roughly **2.5 to 4 standard deviations**, and — this is the important part — **the value depends on which supernova compilation is used in the combination.** Different Type Ia samples, standardised by different pipelines, shift the significance by more than a standard deviation.

That dependence is itself the most informative fact about the result. **A signal whose significance moves substantially with the choice of one dataset among several nominally equivalent ones is behaving the way a systematic behaves**, not the way a physical effect behaves. It does not follow that it is a systematic — real effects can also be revealed unevenly by datasets of differing quality — but it is a reason for the caution the collaborations themselves have expressed.

Three things are worth holding simultaneously.

**If it holds, it is enormous.** A cosmological constant is a single number; evolving dark energy is a dynamical field, which would mean a new light degree of freedom in nature and would promote quintessence from a tolerated alternative to the leading description. It would also weaken the anthropic argument considerably, since a rolling field is not the sort of thing that varies across an ensemble in the way that argument requires.

**The history of such results is not encouraging.** Mild preferences for $w \neq -1$ have appeared and dissolved repeatedly since the early 2000s. The base rate for 3$\sigma$ cosmological anomalies surviving is low.

**It is a testable claim with data already being collected.** DESI's full survey, Euclid, the Vera Rubin Observatory and the Roman Space Telescope will all bear on it within a few years. **This is an unusually favourable position** — the anomaly sits in a quantity several independent instruments are already designed to measure.

The defensible summary: **a cosmological constant remains the standard description, evolving dark energy is a live and strengthening possibility, and the significance is entangled with a dataset choice in a way that should temper confidence.**

```checkpoint
q: DESI reports a preference for evolving dark energy at between roughly 2.5 and 4$\sigma$, with the figure depending on which supernova compilation is combined. How should that dataset dependence be read?
a: As evidence the result is robust, since it appears with every supernova compilation tried
x: Appearing at varying significance is not the same as appearing robustly; the variation is the feature that needs explaining.
a*: As a reason for caution — a signal whose significance shifts by more than a standard deviation with the choice among nominally equivalent datasets behaves the way a systematic behaves, though real effects can also be revealed unevenly
a: As proof that one of the supernova compilations contains an error, which must be identified before the result can be assessed
x: The compilations differ in standardisation choices without any being demonstrably wrong; the dependence flags a concern rather than locating a mistake.
a: As irrelevant, since the CMB and BAO components of the combination are the same throughout
x: The supernova data carry substantial weight in the combination, so their choice is not a detail.
hint: Ask how a genuine physical effect and a systematic would each behave when one component dataset is swapped.
why: A real feature of the expansion history should appear at broadly similar significance whichever nominally equivalent dataset probes it, with variation of order the statistical noise. A systematic in one dataset shows up strongly when that dataset is included and weakly when it is not. The observed swing of more than a standard deviation is therefore closer to the systematic pattern — though not conclusively, since datasets differ in quality and a real effect can be revealed unevenly. Three things hold at once: if it survives it is enormous, implying a dynamical field rather than a constant; the base rate for 3$\sigma$ cosmological anomalies surviving is low, and mild preferences for $w \neq -1$ have appeared and dissolved before; and the claim is directly testable by DESI's full survey, Euclid, Rubin and Roman within a few years.
```

## Confirmed by things that are not supernovae

A result this consequential, resting initially on one method with a known systematic, needed independent confirmation. It has four.

**The CMB.** The first acoustic peak gives $\Omega_{\rm total} = 1.000 \pm 0.002$ while the peak heights give $\Omega_m = 0.315$. Something contributes the remaining 0.685, and it is not matter. **This argument uses no supernovae at all**, and was in place by 2000.

**Baryon acoustic oscillations.** The 147 Mpc sound horizon appears as a clustering scale in galaxy surveys, providing a standard ruler at a range of redshifts. Measuring how its apparent size changes with redshift gives the expansion history independently of any candle, and the result requires acceleration.

**The integrated Sachs–Wolfe effect.** Gravitational potentials stay constant in a matter-dominated universe and decay once expansion accelerates, so photons crossing them gain net energy. As the CMB Map chapter set out, cross-correlating the CMB with galaxy surveys detects this at about $4\sigma$. **A signal that would be zero without acceleration.**

**Cluster abundance and structure growth.** Accelerating expansion suppresses the growth of structure, so the number of massive clusters as a function of redshift is sensitive to dark energy. The counts agree.

The point is the one the previous chapters have kept making: **these methods share no systematics.** Supernova standardisation drift cannot affect the CMB acoustic peaks; a BAO analysis error cannot produce an ISW cross-correlation; cluster mass calibration cannot alter the sound horizon. **Acceleration is not a supernova result any more; it is a result that supernovae found first.**

That distinction bears on how the 1998 systematic should now be weighed. The worry that Type Ia luminosity evolves with redshift is still legitimate for precision work on $w$ — but it can no longer overturn acceleration itself, because four other methods would have to fail in the same direction.

```checkpoint
q: The main systematic risk in the 1998 supernova result was that Type Ia luminosity might evolve with redshift. Given that this worry persists, why is acceleration nonetheless regarded as established?
a: Because two independent teams found the same result, so a shared systematic can be ruled out
x: Both teams used the same standardisation approach on the same kind of object, so a physical evolution of Type Ia luminosity would affect both equally — independence of teams does not address a shared physical systematic.
a*: Because four later methods sharing no systematics with supernovae — the CMB geometry, BAO, the integrated Sachs–Wolfe effect and cluster abundance — independently require acceleration
a: Because studies have shown that Type Ia luminosity does not evolve, removing the systematic
x: The systematic is constrained but not eliminated in principle, and it still matters for precision measurements of $w$.
a: Because the systematic would have to be enormous to explain the effect, and no plausible mechanism produces it
x: The required drift is only ~0.25 magnitudes over the observed range, which is not obviously implausible — this is why independent confirmation was needed rather than argument about magnitude.
hint: Ask which of the two independent 1998 teams would have been protected against a real evolution of Type Ia luminosity.
why: Independence of teams protects against analysis errors, not against a systematic in the objects themselves: both used Type Ia supernovae standardised the same way, so a genuine drift in their luminosity with progenitor age or metallicity would have fooled both equally. What settles the question is that the CMB's geometry plus matter density require a 0.685 remainder using no supernovae at all; BAO gives the expansion history from a standard ruler rather than a candle; the ISW cross-correlation would be zero without acceleration and is detected at ~4$\sigma$; and cluster abundance measures suppressed structure growth. None shares a failure mode with supernova standardisation. The evolution worry remains live for precision determinations of $w$ and can no longer overturn acceleration, because four unrelated methods would have to fail in the same direction.
---
q: Both 1998 teams spent months searching for an error before publishing. What does that add to the result's standing?
a: Nothing formal — the strength of a result comes from its statistics and systematics, not from how its authors felt about it
x: It is not about feelings but about search effort: a hypothesis subjected to determined attempts at refutation by those best placed to refute it has passed a real test.
a*: A great deal — a result contradicting its discoverers' expectations, which survives their own determined attempts to kill it, has been through a more searching examination than one that merely confirmed what was expected
a: It weakens the result, since delayed publication suggests the authors themselves doubted their analysis
x: Doubt that is acted on by checking is the process working; publishing quickly on an unexpected result would be the weaker position.
a: It matters only historically, since the result was later confirmed by independent methods anyway
x: The later confirmations are decisive now, but the question is what the scrutiny added at the time, and the answer is not nothing.
hint: Ask who is most motivated to find an error in an unwelcome result, and how hard they looked.
why: Confirmation bias operates most strongly when a result is expected: the analysis stops when the answer looks right. Both 1998 teams expected deceleration, obtained the opposite sign, and therefore had every incentive to find a mistake — checking dust corrections, evolution, selection effects, and in Riess's account even scanning for a sign error in code. That the result survived scrutiny by the people most motivated to overturn it means it had been tested against a wide range of alternatives before anyone else saw it. This is not a substitute for independent confirmation, which arrived later from the CMB, BAO, the ISW effect and cluster counts, but it is why the claim was taken seriously immediately rather than dismissed as an artefact — and it is why unwelcome results, when they survive, tend to be more reliable than welcome ones.
```

{{image: Type Ia supernova | The thermonuclear detonation of a white dwarf pushed past stability, the class of event on which the 1998 measurement rested. Peak luminosities are similar but not identical; the Phillips relation, in which intrinsically brighter events decline more slowly because they synthesise more nickel-56, allows the light-curve shape to predict the luminosity and reduces the scatter to about 0.15 magnitudes — roughly 7% in distance for an event visible across billions of light-years.}}

## Standard sirens

One method deserves mention because it will matter shortly and because it is structurally different from everything above.

A merging pair of compact objects emits gravitational waves whose waveform encodes the system's **luminosity distance directly.** The amplitude depends on the masses and the distance; the frequency evolution — the chirp — independently fixes the mass combination. **Distance therefore comes out of the waveform with no calibration against anything.**

This is why they are called **standard sirens**: they play the role of standard candles without needing a ladder. There is no Cepheid calibration, no Type Ia standardisation, no assumption that a population behaves the same at high and low redshift. The distance is read from general relativity and the measured waveform.

What is missing is the redshift, since a gravitational waveform carries no spectral lines. Two routes supply it. A **bright siren** has an electromagnetic counterpart identifying the host galaxy, whose redshift can be measured directly — GW170817 is the only clear case so far, and it gave $H_0 \approx 70$ km s⁻¹ Mpc⁻¹ with an uncertainty of about 15%. A **dark siren** has no counterpart, and one instead statistically weights all candidate host galaxies in the localisation volume, which is weaker per event but applies to far more events.

The prospect is that a few hundred events will give $H_0$ to a few per cent **by a route sharing no systematic with either the distance ladder or the CMB.** Given that the current tension is between exactly those two, an independent third determination is close to the ideal test — it can indicate which side is in error without adjudicating between their internal arguments.

The relevance here is that the same events constrain dark energy, since the distance–redshift relation is what both are built from. **A method with no calibration chain is exactly what a field worried about calibration systematics should want**, and it is arriving.

```checkpoint
q: Why are gravitational-wave standard sirens described as needing no distance ladder?
a: Because gravitational waves are unaffected by dust and gas, so their brightness is not attenuated
x: Freedom from extinction is a real advantage but not the reason — an unattenuated standard candle would still need calibrating.
a*: Because the waveform's amplitude and frequency evolution together determine the luminosity distance from general relativity alone, with no calibration against any other object or population
a: Because neutron star masses are identical, making mergers true standard candles
x: Neutron star masses vary, and the method does not assume otherwise — the chirp measures the masses for each event individually.
a: Because their redshifts can be read directly from the waveform, removing the need for host identification
x: The opposite: a waveform carries no spectral lines, so the redshift must come from an electromagnetic counterpart or from statistical host weighting.
hint: Ask what fixes the amplitude of a gravitational wave, and what else in the signal fixes those same quantities independently.
why: The strain amplitude of a compact binary's gravitational wave depends on the masses and the luminosity distance, while the chirp — the rate at which frequency sweeps upward — fixes the mass combination independently. Solving the two together yields the distance directly from general relativity, with no reference to any calibrating population. That removes at a stroke the calibration chain limiting the distance ladder and the standardisation assumptions limiting Type Ia supernovae. What sirens lack is redshift, since the waveform has no spectral lines: bright sirens supply it from an electromagnetic counterpart, as GW170817 did in giving $H_0 \approx 70$ km s⁻¹ Mpc⁻¹ to about 15%, and dark sirens supply it statistically from candidate hosts. A few hundred events would give $H_0$ to a few per cent by a route sharing no systematic with either side of the current tension.
```

## Pulling the thread

- **Acceleration was an unwanted discovery.** Both 1998 teams set out to measure deceleration, both spent months hunting for the error, and neither found one. **A result that survives its own discoverers' attempts to kill it is stronger than one that merely fits.**
- Type Ia supernovae are **standardisable, not standard**: the Phillips relation lets light-curve shape predict luminosity, cutting the scatter to 0.15 mag, about 7% in distance. The method's principal systematic — that standardisation is calibrated locally and applied at high redshift — is **constrained but not eliminated in principle**.
- High-$z$ supernovae came in **0.25 magnitudes faint**, about 12% too far, giving $q_0 = \Omega_m/2 - \Omega_\Lambda = \mathbf{-0.53}$ against $+0.5$ for a matter-only flat universe.
- **Acceleration requires $\rho + 3p/c^2 < 0$, hence $p < -\rho c^2/3$**, because in general relativity **pressure gravitates**. Negative pressure is tension, not suction; **dark energy exerts no repulsive force and does not affect bound systems**, which is testable and observed.
- **The cosmological constant problem is 123 orders of magnitude** with a Planck cutoff, still **59** with a TeV one. The observed scale, $\rho_\Lambda^{1/4} \approx 2.2$ meV, sits below every scale in fundamental physics. **The 1998 discovery made the problem harder**: a symmetry can enforce an exact zero, but nothing naturally produces a cancellation of 122 places with a remainder in the 123rd.
- The alternatives: **quintessence** needs a field of mass $\sim10^{-33}$ eV that generically produces unobserved fifth forces; **modified gravity** was gutted by **GW170817**, which bounded the gravitational-wave speed to $c$ within $10^{-15}$; **backreaction** is legitimate but almost certainly far too small; **anthropic selection** produced Weinberg's 1987 prediction, correct within an order of magnitude, and depends on an ensemble that may not exist.
- **$w$ may not be constant.** DESI reports a preference for evolving dark energy at roughly 2.5–4$\sigma$, with $w_0 > -1$ and $w_a < 0$ — but **the significance depends on which supernova compilation is used**, which is how a systematic behaves. Enormous if it holds, poor base rate if history is a guide, and directly testable by Euclid, Rubin and Roman within a few years.
- **Standard sirens** read luminosity distance out of the waveform via general relativity, with **no calibration chain at all** — the ideal third party to a tension between the distance ladder and the CMB.
- **Four independent confirmations**: CMB geometry, BAO, the ISW cross-correlation, cluster abundance. **Acceleration is no longer a supernova result; it is a result supernovae found first.**

The transferable idea: **the best-fitting model and the best-understood model need not be the same, and confusing them is a serious error in both directions.** A cosmological constant fits every observation in this chapter to within its error bars and is theoretically indefensible; quintessence and modified gravity are better motivated and fit worse. The temptation is to resolve the discomfort — either by treating the good fit as understanding, or by treating the theoretical failure as grounds for doubting the observation. **Both moves are wrong, and holding the two apart is the actual skill.** The same situation recurs wherever an empirical relation outperforms every mechanistic account of it: the correct posture is to use the fit, keep quoting the failure, and resist the urge to let either settle the other.

## Further reading

{{book: Richard Panek | The 4 Percent Universe | 2011}}

{{book: Robert Kirshner | The Extravagant Universe | 2002}}

{{book: Steven Weinberg | Cosmology | 2008}}

Beyond the books: Kirshner was on the High-z team and his account is the best first-person record of how reluctantly the result was accepted. Weinberg's 1989 review of the cosmological constant problem remains the standard statement of it and has not been superseded, which is itself informative. The two 1998 discovery papers are worth reading side by side for how carefully each hedges — neither claims more than the data support, and both devote more space to systematics than to the conclusion.

## Problems

*Useful numbers: $\Omega_m = 0.315$, $\Omega_\Lambda = 0.685$; $\rho_c = 8.53\times10^{-27}$ kg m⁻³; $\rho_{\rm Planck} = 5.16\times10^{96}$ kg m⁻³; $\rho_\Lambda^{1/4} = 2.2$ meV; Phillips scatter 0.15 mag; observed dimming 0.25 mag; $q_0 = \Omega_m/2 - \Omega_\Lambda$; acceleration onset $z = 0.63$; $w = -1.03 \pm 0.03$; GW170817 arrival difference 1.7 s over 130 Mly.*

**1.** *(Standardisation.)* **(a)** State the Phillips relation and its physical origin. **(b)** Give the resulting scatter in magnitudes and in distance. **(c)** State the method's principal systematic and why it is hard to eliminate.

**2.** *(The observation.)* **(a)** Explain why a decelerating universe makes distant supernovae appear brighter. **(b)** Convert 0.25 magnitudes into a distance ratio. **(c)** Compute $q_0$ and compare with a matter-only flat universe.

**3.** *(Negative pressure.)* **(a)** Write the acceleration equation and identify the source term. **(b)** Evaluate it for matter, radiation and a cosmological constant. **(c)** State three things negative pressure does *not* mean.

**4.** *(The constant problem.)* **(a)** Compute the ratio of Planck density to $\rho_\Lambda$ in orders of magnitude. **(b)** State the figure for a TeV cutoff. **(c)** Explain why a non-zero measurement made the problem harder than a zero would have.

**5.** *(The scale.)* **(a)** State the energy scale corresponding to $\rho_\Lambda$. **(b)** List four scales in fundamental physics and place it among them. **(c)** State what a satisfactory solution must explain.

**6.** *(Quintessence.)* **(a)** Describe the mechanism and its attraction. **(b)** State the required field mass and the difficulty it creates. **(c)** State what current $w$ constraints allow.

**7.** *(Modified gravity.)* **(a)** State the two principal constraints. **(b)** Explain what GW170817 measured and how tightly. **(c)** Explain why this is a good example of a constraint arriving from outside a field.

**8.** *(Independent confirmation.)* **(a)** Name four confirmations and the physics each uses. **(b)** Explain why two independent teams in 1998 did not settle the systematic worry. **(c)** State what the worry can and cannot now overturn.

**9.** *(Fit and understanding.)* **(a)** State the position a cosmological constant occupies. **(b)** State the position its alternatives occupy. **(c)** Give the general principle and one example from outside cosmology.

## Worked answers

**1.** **(a)** Intrinsically brighter Type Ia supernovae **decline more slowly** after peak. The origin is $^{56}$Ni: more luminous events synthesise more of it, and it both powers the light curve through its decay and raises the opacity, so the ejecta remain optically thick longer and the decline is stretched. Since the decline rate is measurable without knowing the distance, it serves as a proxy for luminosity. **(b)** After light-curve shape and colour corrections the scatter falls to about **0.15 magnitudes**, which by $d \propto 10^{0.2m}$ is $10^{0.2 \times 0.15} = 1.07$, i.e. **7% in distance**. **(c)** That standardisation is **calibrated on nearby supernovae and applied to distant ones**, in host galaxies of systematically different age and metallicity. If the Phillips relation drifts with progenitor environment, the correction drifts with redshift — and **a redshift-dependent error in a distance measurement is indistinguishable in form from cosmology**. It cannot be eliminated in principle because there is no population of high-redshift supernovae with independently known distances against which to check.

**2.** **(a)** In a decelerating universe the expansion was **faster in the past**, so the universe reached any given redshift **sooner**, so less time elapsed and the light travelled a shorter distance. An object at that redshift is therefore **closer**, and closer means brighter. **(b)** $\Delta m = 0.25$ gives a flux ratio $10^{-0.25/2.5} = 0.794$, and since flux $\propto d^{-2}$, the distance ratio is $10^{0.25/5} = \mathbf{1.12}$ — about **12% further away** than the matter-only prediction. **(c)** $q_0 = \Omega_m/2 - \Omega_\Lambda = 0.1575 - 0.685 = \mathbf{-0.53}$. A flat matter-only universe has $\Omega_m = 1$, $\Omega_\Lambda = 0$, giving $q_0 = \mathbf{+0.5}$. The sign is the whole result: negative means the expansion is speeding up.

**3.** **(a)** $\ddot a/a = -\frac{4\pi G}{3}(\rho + 3p/c^2)$. The source term is $\rho + 3p/c^2$, not $\rho$ alone, because in general relativity the source of gravity is the **stress–energy tensor**, whose diagonal spatial components are pressures; the factor of three counts the spatial directions. **(b)** *Matter*: $p \approx 0$, source $= \rho$, deceleration. *Radiation*: $p = \rho c^2/3$, source $= 2\rho$ — **twice as decelerating as matter of the same density**, a good check that the term is physical. *Cosmological constant*: $p = -\rho c^2$, source $= \rho - 3\rho = -2\rho$, acceleration. **(c)** It does **not** mean suction — a stretched rubber sheet has negative pressure in the same sense and pulls nothing. It does **not** mean a repulsive force: dark energy has no Newtonian force term, and bound systems from the Earth's orbit to the Local Group are wholly unaffected, which is a testable distinction the observations respect. And "space being created" is a **picture, not a mechanism** — the equations describe how distances between comoving observers evolve, and no observable distinguishes the phrasings.

**4.** **(a)** $\rho_{\rm Planck}/\rho_\Lambda = 5.16\times10^{96}/5.8\times10^{-27} = 8.8\times10^{122}$ — **123 orders of magnitude**. **(b)** With a 1 TeV cutoff the predicted density scales as the fourth power of the cutoff energy, giving $(10^{12}\,\mathrm{eV}/2.2\times10^{-3}\,\mathrm{eV})^4 = 4\times10^{58}$ — still **59 orders of magnitude**. **(c)** Because **exact zeros are the kind of thing symmetries produce.** Unbroken supersymmetry cancels bosonic against fermionic vacuum contributions exactly, so before 1998 the task was to identify the symmetry responsible. A small non-zero value requires a cancellation accurate to 122 decimal places with a non-zero remainder in the 123rd, and **no symmetry produces near-misses** — symmetries enforce exact relations. The discovery therefore replaced a hard problem with a harder one of a different type: fine-tuning rather than vanishing.

**5.** **(a)** $\rho_\Lambda^{1/4} \approx \mathbf{2.2\ meV}$ — obtained by expressing the energy density in natural units and taking the fourth root. **(b)** Planck $\sim10^{28}$ eV; grand unification $\sim10^{25}$ eV; electroweak $\sim10^{11}$ eV; QCD $\sim10^{8}$ eV; electron mass $5\times10^{5}$ eV; neutrino masses perhaps $10^{-2}$ eV. The dark energy scale at $2\times10^{-3}$ eV sits **below all of them** and bears no evident relation to any. **(c)** Both halves: **why the natural estimate is suppressed by 123 orders of magnitude, and why the residue lands at a scale with no home in any theory.** A mechanism that merely cancels the vacuum energy leaves the second question untouched, which is why proposals achieving suppression alone are not regarded as solutions.

**6.** **(a)** A **dynamical scalar field slowly rolling down a potential**, giving $w$ near but not equal to $-1$ and varying with time. Its attraction is twofold: a rolling field can naturally have a small present-day energy without fine-tuning an absolute constant, and some potentials give **tracker** behaviour in which the field's density follows the dominant component for most of cosmic history — which would address the coincidence problem rather than merely accommodating it. **(b)** To roll on cosmological timescales the field must have a mass of order the Hubble rate, about $\mathbf{10^{-33}\ eV}$. Such an ultralight field **generically couples to matter**, producing long-range fifth forces and time variation of fundamental constants, neither of which is observed — so the couplings must be suppressed by hand, which reintroduces the fine-tuning the model was meant to avoid. **(c)** $w = -1.03 \pm 0.03$ under the assumption of constant $w$ leaves room for slowly rolling models, and allowing $w(a) = w_0 + w_a(1-a)$ bounds $w_a$ only at the level of a few tenths. **Quintessence is constrained, not excluded**, and each survey generation tightens it.

**7.** **(a)** **Solar System tests**, which require any modification to be screened at small scales — achievable through chameleon or Vainshtein mechanisms, but only by adding machinery. And **gravitational wave propagation**. **(b)** GW170817, a neutron star merger, produced a gravitational wave signal and a gamma-ray burst that arrived **1.7 seconds apart after 130 million light-years** of travel. The fractional difference in propagation speed is therefore bounded at roughly $1.7\,\mathrm{s}/(1.3\times10^{8}\,\mathrm{yr}) \approx \mathbf{10^{-15}}$. Many modified-gravity theories introduce extra fields or higher-derivative terms that generically shift the gravitational wave speed away from $c$, and **whole families — including large classes of Horndeski theories — were excluded within days.** **(c)** Because it is a **multi-messenger astrophysics measurement of a compact binary**, made by instruments built to detect gravitational waves, that settled a question in cosmology which cosmological observations had not been able to. The same structure as LUNA's nuclear cross-section fixing the deuterium baryometer and *Gaia*'s parallaxes fixing the distance ladder: **the binding constraint arrived from a field that was not working on the problem.**

**8.** **(a)** **CMB geometry** — the first peak gives $\Omega_{\rm total} = 1$, the peak heights give $\Omega_m = 0.315$, so 0.685 remains, using photon–baryon acoustics and no supernovae. **BAO** — the 147 Mpc sound horizon as a standard ruler in galaxy clustering, giving the expansion history from a ruler rather than a candle. **The integrated Sachs–Wolfe effect** — decaying potentials imprinting on CMB photons, detected at ~4$\sigma$ by cross-correlation with galaxy surveys, and **zero without acceleration**. **Cluster abundance** — accelerating expansion suppresses structure growth, changing the number of massive clusters with redshift. **(b)** Because independence of *teams* protects against analysis errors, not against a systematic in the **objects**. Both teams used Type Ia supernovae standardised by the same relation, so a genuine drift in Type Ia luminosity with progenitor age or metallicity would have fooled both identically. **The worry was about the candles, and both teams used the same candles.** **(c)** It can no longer **overturn acceleration**, because four methods sharing no failure mode would have to err in the same direction. It remains live for **precision measurements of $w$ and its possible evolution**, where a drift of a few hundredths of a magnitude with redshift matters directly.

**9.** **(a)** **Fits everything, explains nothing.** A cosmological constant reproduces the supernova distances, the CMB geometry, BAO, the ISW signal and cluster counts within their errors, with one parameter — and its natural theoretical estimate is wrong by 123 orders of magnitude, with the observed value sitting at a scale unrelated to anything in fundamental physics. **(b)** **Explain more, fit worse.** Quintessence offers a mechanism for smallness and a possible account of the coincidence, at the cost of an ultralight field with unobserved couplings. Modified gravity would remove the component entirely, and has been severely constrained by Solar System tests and gutted by GW170817. Anthropic selection produced a correct advance prediction and requires an ensemble that may not exist. **(c)** **The best-fitting model and the best-understood model need not be the same, and neither should be used to settle questions about the other.** The failure modes run in both directions: treating a good fit as understanding, or treating a theoretical failure as grounds for doubting a measurement. Outside cosmology: in **turbulence**, empirical closure models reproduce engineering flows to useful accuracy while resting on no derivation from the Navier–Stokes equations, and the correct posture is identical — use the model, keep quoting its lack of foundation, and resist letting either the accuracy excuse the gap or the gap discredit the accuracy.$duAccel_master$,
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
