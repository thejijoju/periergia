-- Astronomy & Space · Stellar Physics — The Working Star —
-- "Seeing Inside a Star". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/working-star/seeing-inside-a-star
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- How anyone knows what the three preceding chapters asserted about a place
-- no instrument reaches: Raymond Davis Jr.'s Homestake experiment counting
-- seventeen argon atoms per two months out of 615 tonnes of dry-cleaning
-- fluid, and finding a third of the predicted neutrinos; why the deficit was
-- genuinely ambiguous for thirty years, since the 8B flux scales as T_c^24
-- and a 4.6% central-temperature error would have accounted for it exactly
-- while the alternative demanded neutrino mass the Standard Model forbade;
-- SNO's 2001 resolution by experimental DESIGN rather than precision, using
-- heavy water's flavour-blind neutral-current channel to measure total flux
-- alongside the electron-neutrino flux in one detector — the neutrinos were
-- all there, two thirds had changed flavour, and an astrophysical
-- measurement had found the gap in particle physics; helioseismology as
-- tomography applied to a star, ten million acoustic modes refracting and
-- turning at depths set by their horizontal wavelength, inverted for a
-- sound-speed profile confirmed to 0.1% and delivering the unpredicted
-- rigid rotation of the radiative interior and the tachocline; the
-- unresolved solar abundance problem, created by an improvement in model
-- atmospheres; and why two probes with disjoint failure modes is what
-- converts a well-constructed theory into established knowledge.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/working-star/seeing-inside-a-star',
    'research',
    'advanced',
    'read',
    $astroSeeingInside_master$> Three chapters have now made confident quantitative claims about a place no instrument will ever reach: a central temperature of 1.57 × 10⁷ K, a Gamow peak at 6.1 keV, a convection-zone boundary at 0.713 $R_\odot$. All of it concerns the inside of a body 700,000 km in radius, wrapped in material so opaque that a photon takes of order $10^5$ years to emerge, thoroughly thermalised, carrying no memory of where it began. So how does anyone know? Two probes reach the interior, and their existence is what separates stellar astrophysics from a well-constructed story.

## Seventeen atoms

In 1968, Raymond Davis Jr. lowered a tank containing 615 tonnes of dry-cleaning fluid into a gold mine in South Dakota, 1,478 metres underground.

The idea was Bruno Pontecorvo's and the astrophysical prediction was John Bahcall's. Neutrinos from the Sun's core would occasionally strike a chlorine-37 nucleus and convert it to argon-37:

$$\nu_e + {}^{37}\text{Cl} \longrightarrow {}^{37}\text{Ar} + e^-$$

Argon is a noble gas and chemically inert, so it could be flushed out of the tank by bubbling helium through it, collected, and counted by its radioactive decay (half-life 35 days).

### The scale of the measurement

The predicted yield was about seventeen argon atoms per two months. The tank contained roughly $2\times10^{30}$ molecules — so the ratio of signal atoms to target molecules was of order $10^{-29}$.

Seventeen atoms, extracted chemically from six hundred tonnes of liquid, and counted individually. It is among the most extraordinary measurements ever attempted, and the reason for the gold mine is that at the surface, cosmic rays would produce argon-37 at a rate swamping the signal by orders of magnitude.

Davis ran the experiment for twenty-five years. He found neutrinos — and consistently found about a third of the predicted number.

| | Rate (SNU) |
|---|---|
| Predicted (standard solar model) | ~8.0 |
| **Observed** | **~2.56** |
| **Ratio** | **0.32** |

Two thirds of the expected neutrinos were missing.

{{image: Homestake experiment | Raymond Davis Jr.'s solar neutrino detector at the Homestake gold mine: 615 tonnes of perchloroethylene nearly 1,500 metres underground, from which roughly seventeen argon atoms every two months had to be chemically extracted and counted one by one.}}

### Why nobody could say who was wrong

This is the part that makes the episode worth thirty years of argument. Either the astrophysics was wrong, and the Sun's core is cooler than the standard model claims — or the particle physics was wrong, and neutrinos do something between the Sun and the Earth.

And the astrophysical option was entirely plausible. The ⁸B neutrinos Davis was sensitive to have a flux scaling roughly as $T_c^{24}$ — an extraordinarily steep dependence. So:

$$0.32 = \left(\frac{T_c'}{T_c}\right)^{24} \quad\Longrightarrow\quad \frac{T_c'}{T_c} = 0.954$$

A four-and-a-half percent error in the Sun's central temperature would fully account for the deficit. That is not an absurd error: it is roughly the level of uncertainty one might reasonably attach to a quantity inferred from a model of an unobservable interior, resting on opacity tables, nuclear cross-sections obtained by extrapolation, a convection treatment with a fitted parameter, and an assumed composition. The stellar model was genuinely at risk, and many physicists assumed the astronomers had simply got the Sun wrong.

The neutrino explanation, meanwhile, required neutrinos to have mass — which the Standard Model of particle physics said they did not. For thirty years, a discrepancy sat between two theories, and the evidence could not say which one was broken.

## Neutrinos as a probe

Before the resolution, why neutrinos are worth this much trouble.

A neutrino interacts only via the weak interaction, so its cross-section is minuscule. Its mean free path in stellar material is measured in light-years, and it crosses the Sun without a single interaction. A neutrino leaves the Sun in 2.3 seconds; energy, as photons, takes of order $10^5$ years. The neutrinos arriving now were made eight minutes ago. The sunlight arriving now carries energy generated when the last ice age began, or earlier.

And they carry information. Because a neutrino does not interact, it arrives with the energy and direction it was created with — so its spectrum reports on which reaction produced it and at what temperature. Compare photons, which are absorbed and re-emitted some $10^{23}$ times: the information is not degraded but erased, after the first few interactions, and the emergent spectrum reports on the photosphere alone. Neutrinos are the only direct observation of a stellar core.

### They are a thermometer

The various neutrino-producing branches have different temperature sensitivities:

| Source | Fraction of flux | $T_c$ dependence |
|---|---|---|
| pp | ~91% | $\propto T_c^{-1.1}$ (nearly flat) |
| ⁷Be | ~7% | $\propto T_c^{10}$ |
| **⁸B** | **~0.01%** | $\propto T_c^{24}$ |

The ⁸B branch is a vanishing fraction of the total flux and produces the highest-energy neutrinos — which is why Davis, whose chlorine threshold was high, was sensitive almost entirely to it.

A 1% change in $T_c$ changes the ⁸B flux by 27%. Nothing else in stellar astrophysics responds that steeply to anything, and it is why neutrinos constrain the core temperature far better than the luminosity does — the luminosity is buffered by the thermostat and barely responds at all.

The steepness is both the strength and the difficulty. It makes neutrinos an exquisite thermometer, and it made the 1968 discrepancy ambiguous, because a small temperature error produces a large flux error. Sensitivity and ambiguity were the same property.

## The resolution

The answer required an experiment that could distinguish between the two hypotheses within a single measurement — and the design is elegant enough to be worth setting out.

The Sudbury Neutrino Observatory began operating in 1999: 1,000 tonnes of heavy water (D₂O), two kilometres underground in a Canadian nickel mine. Heavy water was the key. Ordinary water permits essentially one detection channel; deuterium permits three, and crucially they have different flavour sensitivities:

| Channel | Reaction | Sensitive to |
|---|---|---|
| **Charged current** | $\nu_e + d \to p + p + e^-$ | **electron neutrinos only** |
| **Neutral current** | $\nu_x + d \to p + n + \nu_x$ | **all three flavours equally** |
| Elastic scattering | $\nu_x + e^- \to \nu_x + e^-$ | mostly $\nu_e$, partly others |

The charged-current reaction requires the neutrino to produce an electron, which only an electron neutrino can do. The neutral-current reaction merely breaks up the deuteron and is flavour-blind. One detector, measuring both the electron-neutrino flux and the total flux of all flavours: the ratio between them answers the question directly.

### The result, 2001

| Measurement | Flux (10⁶ cm⁻² s⁻¹) |
|---|---|
| Electron neutrinos (charged current) | **1.76** |
| **All flavours (neutral current)** | **5.09** |
| **Standard solar model prediction** | **5.05** |

Two numbers to read. The electron-neutrino fraction, $1.76/5.09 = 0.35$ — exactly the one-third Davis had been measuring for three decades. And the total against the prediction, $5.09/5.05 = 1.008$ — agreement with the standard solar model to within one percent.

The neutrinos were all there. Two thirds of them had changed flavour on the way.

{{image: Sudbury Neutrino Observatory | The Sudbury Neutrino Observatory, two kilometres underground in a Canadian nickel mine: 1,000 tonnes of heavy water whose deuterium opened a flavour-blind detection channel, letting one detector measure both the electron-neutrino flux and the total flux of all flavours — and settle a thirty-year argument in a single measurement.}}

The stellar model was right: the Sun's core produces exactly the number of neutrinos the standard solar model predicts, and the central temperature is correct to well under a percent. The Standard Model of particle physics was incomplete: neutrino flavour oscillation requires that neutrinos have mass, which the Standard Model as then formulated forbade.

The direction of the correction is worth stating plainly. A measurement of the Sun revealed a flaw in particle physics. Astrophysics is normally a consumer of fundamental physics — nuclear cross-sections, opacities and equations of state are imported from laboratory work. Here it was a source. Davis and Masatoshi Koshiba shared the 2002 Nobel Prize; Takaaki Kajita and Arthur McDonald shared the 2015 prize for the oscillation measurements. Bahcall, whose solar models had been vindicated after three decades of doubt, did not — he died in 2005.

### The methodological lesson

Two things, and the second is the transferable one.

A discrepancy between two theories does not tell you which is wrong. For thirty years the data were consistent with either resolution, and confident assertions were made on both sides. What settled it was not more precision but a different measurement — Davis could have counted argon atoms for another thirty years and learned nothing new about which hypothesis was correct.

And the null result was informative. SNO's neutral-current channel was, in effect, a test of whether the neutrinos were missing or merely transformed. Finding the total flux intact excluded the astrophysical explanation completely. Designing a measurement to discriminate rather than to refine is the harder and more valuable move.

## The Sun rings

The second probe is entirely different in physics, and it achieves a precision the first cannot approach.

In 1960, Robert Leighton found that the solar surface oscillates — patches move up and down with a period near five minutes. It was initially taken for local turbulence, an incidental feature of granulation. In the 1970s it was recognised as something else: global standing acoustic waves. The Sun is ringing, like a struck bell, and the ringing is excited by the turbulent convection in its outer layers — the same granulation that is directly visible at the surface, stochastically buffeting the Sun's acoustic resonances exactly as random turbulence excites the resonances of an organ pipe.

The amplitudes are absurd. An individual mode moves the surface at about 10 centimetres per second, with a displacement of order one metre — on a body 1.4 million kilometres across. Millions of modes are superposed, and disentangling them requires continuous observation over years. About ten million modes have been identified, with frequencies measured to roughly one part in $10^5$.

### How a sound wave probes depth

The mechanism is refraction, and it is the same physics that lets seismology map the Earth's interior.

The sound speed in a gas is $c \sim \sqrt{\gamma P/\rho} \propto \sqrt{T/\mu}$, and temperature rises steeply inward — from about 8 km/s at the photosphere to some 505 km/s at the centre. A wave travelling obliquely downward enters progressively faster material, and is therefore refracted, bent back toward the horizontal, exactly as light is refracted entering a medium of lower refractive index. At some depth it turns around entirely and heads back to the surface, where it reflects off the sharp density drop and travels down again.

The turning depth depends on the wave's horizontal wavelength. A wave with a short horizontal wavelength travels steeply and turns around shallowly; one with a long horizontal wavelength travels shallowly and penetrates deeply.

| Mode degree $\ell$ | Turning depth | Probes |
|---|---|---|
| ~1,000 | just below the surface | the convection zone |
| ~50 | ~0.5 $R_\odot$ | the radiative interior |
| **0–3** | **the centre** | **the core** |

Different modes sample different depths, so a large set of frequencies can be inverted for the sound speed as a function of radius. This is tomography — the same mathematical procedure as a medical CT scan, in which many measurements along different paths are combined to reconstruct an internal structure. Applied to a star.

{{image: Helioseismology | Acoustic modes propagating through the solar interior: waves travelling obliquely downward meet progressively faster material and are refracted back toward the surface, turning around at a depth set by their horizontal wavelength — so a large enough set of measured frequencies can be inverted for the sound speed at every radius.}}

## What it established

| Result | Value | Status |
|---|---|---|
| **Sound-speed profile** | agrees with the standard model to **~0.1%** | the strongest test in stellar physics |
| Base of the convection zone | **0.713 ± 0.001 $R_\odot$** | predicted, then confirmed |
| Surface helium abundance | $Y$ = 0.248 | independent of spectroscopy |
| **Interior rotation** | radiative zone rotates **rigidly** | **not predicted** |
| The tachocline | thin shear layer at 0.7 $R_\odot$ | now thought to seat the dynamo |

Three of these deserve comment.

**The sound-speed profile.** Agreement to one part in a thousand, throughout the Sun's interior, between a theoretical model and a measurement. This is the strongest quantitative test any stellar model has passed, and it is worth emphasising why it is a genuine test rather than a fit. The mixing-length parameter and the initial helium abundance were tuned so that a solar model reproduces the Sun's radius and luminosity. The sound-speed profile was not tuned. It is an output of the resulting model at every interior radius — thousands of independent numbers — and it was confirmed. A fit constrains as many quantities as it has parameters; this constrains a function.

**Rigid rotation, which nobody expected.** The surface of the Sun rotates differentially — the equator in about 25 days, the poles in about 35. That has been known since Galileo watched sunspots. The natural expectation was that this pattern continues inward, or follows surfaces of constant rotation on cylinders as rotating-fluid theory suggests. Neither is what happens. Helioseismology found that the differential rotation is confined to the convection zone, and that below it the radiative interior rotates almost as a solid body.

**The tachocline.** Between them lies a thin shear layer, where the rotation profile changes over a distance of a few percent of the solar radius. This was not predicted; it came out of the data, and it changed the theory. The tachocline is now the leading candidate for the seat of the solar dynamo, since a thin layer of strong shear is exactly what is needed to wind up and amplify a magnetic field, at the base of the convection zone where field can be stored stably before rising.

A measurement that merely confirms a model is worth less than one that surprises it. Helioseismology did both — and the confirmation is what establishes that the surprise is trustworthy.

## Where it currently fails

The honest section, and it concerns a test that used to pass and now does not.

Until about 2005, the standard solar model and helioseismology agreed to 0.1% everywhere, and the interior was regarded as essentially solved. Then the solar photospheric abundances were revised. New three-dimensional radiation-hydrodynamic model atmospheres — a genuine improvement over the one-dimensional models they replaced, treating granulation and its velocity fields explicitly rather than through a fitted "microturbulence" parameter — gave systematically lower abundances for carbon, nitrogen and oxygen, reducing the Sun's inferred metallicity by roughly 30%.

That should have been a refinement. Instead it broke the agreement. Lower metallicity means lower opacity, since bound–free absorption requires metals. Lower opacity means a shallower temperature gradient is needed to carry the flux, which changes the whole interior structure:

| | Observed | Model with new abundances |
|---|---|---|
| Base of convection zone | 0.713 $R_\odot$ | **0.726 $R_\odot$** |
| Sound speed below the CZ | — | discrepant by ~**1%** |
| Surface helium | 0.248 | ~0.238 |

Discrepancies of 1% where there had been 0.1% — ten times the previous level of agreement.

Something is wrong and nobody knows what. The candidates are three. **The abundances** may be in error, despite the improved atmospheres; some independent measurements, including recent detections of neutrinos from the CNO cycle, tend to favour somewhat higher metallicity. **The opacities** may be low — the tables used in stellar models are calculated theoretically and are difficult to verify experimentally, and laboratory measurements of iron opacity at stellar-interior conditions have come out higher than tabulated, which would partly restore agreement. Or **something else** is missing: additional mixing below the convection zone, or a physical process omitted from the models.

It belongs here because a chapter claiming that the interior is known must say where the claim currently fails, and because the failure is instructive. The problem was created by an improvement. Better model atmospheres produced worse agreement — which is the correct behaviour for a science, and is what distinguishes a model that is tested from one that is fitted. Had the abundances been free parameters, they would simply have been adjusted and nothing would have been learned. A model that can never be broken by an improvement in its inputs is not being tested by them.

The solar interior is the best-verified place in astrophysics, and it currently has a 1% discrepancy nobody can explain. Both halves of that sentence are true and neither should be dropped.

## Two probes, disjoint failures

The reason the interior is regarded as known is not that either probe is individually decisive. It is that they are independent.

| Probe | Tests | Physics involved |
|---|---|---|
| **Neutrinos** | the **core**: $T_c$, reaction rates | weak interaction, nuclear cross-sections |
| **Helioseismology** | the **structure**: $c(r)$, $\rho(r)$ | fluid dynamics, acoustics |
| Luminosity, radius | surface boundary conditions | radiative transfer |

An error in nuclear cross-sections cannot corrupt an acoustic inversion. An error in the opacity tables cannot corrupt a neutrino count. The two share no instrument, no assumption and no failure mode. That both agree with the same model — the neutrino flux to 1%, the sound speed to 0.1% — is what converts a well-constructed theory into established knowledge.

Increasing the precision of one probe reduces its random error and leaves any systematic untouched; only independence tests for the errors that precision cannot find. And it is why the solar abundance problem matters rather than being a footnote: when two independent probes stop agreeing, one of the inputs they share — here, the opacity — is the natural suspect.

## Pulling the thread

- Three chapters made confident claims about a place no instrument reaches, wrapped in material so opaque that photons emerge after $10^5$ years thoroughly thermalised, carrying no information about the core. This one asks how anyone knows.
- Davis counted seventeen argon atoms per two months, extracted from 615 tonnes of dry-cleaning fluid 1,478 m underground — and consistently found a third of the predicted neutrino flux.
- And nobody could say which theory was broken. The ⁸B flux scales as $T_c^{24}$, so a 4.6% error in the Sun's central temperature would fully account for the deficit — not an absurd error for an unobservable interior. The alternative required neutrinos to have mass, which the Standard Model forbade. Thirty years of ambiguity.
- SNO settled it in 2001 by design rather than precision. Heavy water permits a flavour-blind neutral-current channel alongside a $\nu_e$-only charged-current one, so one detector measured both fluxes. Electron neutrinos: 1.76. All flavours: 5.09. Prediction: 5.05. The neutrinos were all there; two thirds had changed flavour.
- The stellar model was right to 1%. The Standard Model was incomplete. Astrophysics is normally a consumer of fundamental physics; here it was a source.
- Neutrinos leave the Sun in 2.3 seconds and are the only direct observation of a stellar core. The ⁸B branch is 0.01% of the flux and scales as $T_c^{24}$ — a 1% temperature change gives 27% in flux — making it an exquisite thermometer, and making the original discrepancy ambiguous for the same reason.
- The Sun rings. Ten million acoustic modes, each displacing the surface by about a metre at 10 cm/s, with frequencies known to one part in $10^5$. Sound speed rises from 8 to 505 km/s inward, so waves are refracted and turn around at depths set by their horizontal wavelength — tomography applied to a star.
- It confirmed the sound-speed profile to 0.1% — a genuine prediction, since only radius and luminosity were tuned — and located the convection-zone base at 0.713 $R_\odot$. And it produced a surprise: the radiative interior rotates rigidly, with the differential rotation confined to the convection zone and a thin shear layer, the tachocline, between them, now the leading candidate site for the dynamo. Nobody predicted it.
- And the best test currently fails. Improved 3-D model atmospheres lowered the solar metallicity by ~30%, which lowered the opacity, which moved the predicted convection-zone base to 0.726 $R_\odot$ against 0.713 observed, with ~1% sound-speed discrepancies where there had been 0.1%. The problem was created by an improvement, which is the correct behaviour for a tested model rather than a fitted one, and it remains unresolved.
- The interior is regarded as known because the two probes are independent: nuclear cross-sections cannot corrupt an acoustic inversion, and opacity tables cannot corrupt a neutrino count. Disjoint failure modes reaching the same answer — and when they stop agreeing, a shared input is the suspect.

These four chapters have treated a star as a closed system of fixed mass. It is not. The Sun loses a million tonnes a second and it is at the quiet end of the range; a massive star can shed most of itself before it dies. If mass determines everything about a star's life, and a star's mass changes substantially during that life, what exactly is the parameter that claim refers to?

## Further reading

A narrative account of the solar neutrino problem from Davis's tank through SNO's resolution, and of the physicists who spent three decades on it, is given in {{book: Ray Jayawardhana | Neutrino Hunters: The Thrilling Chase for a Ghostly Particle to Unlock the Secrets of the Universe | 2013}}.

- **Ray Jayawardhana, *Neutrino Hunters* (2013).** An accessible history of neutrino astronomy covering Pauli's original proposal, Davis and Bahcall's decades-long collaboration and the doubt their results attracted, Kamiokande and Super-Kamiokande, and the SNO measurement that resolved the solar neutrino problem by demonstrating flavour oscillation.
- **Douglas Gough et al., "The Seismic Structure of the Sun," *Science* 272 (1996).** The landmark presentation of the helioseismic inversion, including the sound-speed profile's agreement with the standard solar model and the determination of the convection-zone base — the technical counterpart to this chapter's second half.

## Problems

*Data: Homestake predicted rate ~8.0 SNU, observed ~2.56 SNU. ⁸B neutrino flux $\propto T_c^{24}$; ⁷Be $\propto T_c^{10}$; pp $\propto T_c^{-1.1}$. SNO 2001: charged current 1.76 × 10⁶ cm⁻²s⁻¹, neutral current 5.09 × 10⁶, model prediction 5.05 × 10⁶. Solar sound speed: ~8 km/s at the photosphere, ~505 km/s at the centre. Convection zone base: 0.713 ± 0.001 $R_\odot$ observed, 0.726 $R_\odot$ predicted with revised abundances. $R_\odot = 6.957\times10^{8}$ m, $c = 2.998\times10^{8}$ m/s, $T_c = 1.57\times10^{7}$ K, $T_{\text{eff}} = 5772$ K.*

### 1 — Seventeen atoms
**(a)** Describe Davis's experiment: the target, the reaction, the extraction method, and why it was underground.
**(b)** The tank held ~2 × 10³⁰ molecules and produced ~17 argon atoms per two months. Comment on what this implies about the experimental difficulty.
**(c)** State the predicted and observed rates and the ratio.
**(d)** State the two possible conclusions, and explain why neither could be excluded.
**(e)** Using the $T_c^{24}$ scaling, compute the fractional reduction in central temperature that would fully account for the deficit. Comment on whether that is a plausible error.
**(f)** Explain why the particle-physics explanation was regarded as the *less* likely of the two in 1970.

### 2 — Why neutrinos
**(a)** Compare the time taken by a neutrino and by energy (as photons) to leave the Sun. Compute the ratio.
**(b)** Explain what happens to the information carried by a photon and why the same does not happen to a neutrino.
**(c)** State in one sentence what makes neutrinos unique as a probe.
**(d)** The pp, ⁷Be and ⁸B branches scale as $T_c^{-1.1}$, $T_c^{10}$ and $T_c^{24}$. Compute the fractional change in each for a 1% increase in $T_c$.
**(e)** Davis was sensitive almost entirely to ⁸B, which is ~0.01% of the total flux. Explain why, and why this both helped and hindered.
**(f)** Explain why the Sun's luminosity is a much poorer thermometer than its neutrino flux, referring to the thermostat.

### 3 — SNO *(design over precision)*
**(a)** Explain what heavy water provides that ordinary water does not.
**(b)** Give the three reaction channels and state the flavour sensitivity of each.
**(c)** Explain why the neutral-current channel is the decisive one.
**(d)** Compute the ratio of electron-neutrino flux to total flux, and compare with Davis's result.
**(e)** Compute the agreement between the total measured flux and the standard solar model prediction.
**(f)** State what was wrong and what was right, and explain why the direction of the correction is unusual.
**(g)** State the methodological lesson about discriminating versus refining measurements.

### 4 — The Sun rings
**(a)** State the period, velocity amplitude and physical displacement of a solar p-mode, and the number of modes detected.
**(b)** Explain what excites the oscillations.
**(c)** Explain how a sound wave turns around at depth. What property of the interior causes it, and what determines the turning depth?
**(d)** Given sound speeds of 8 km/s at the surface and 505 km/s at the centre, compute the ratio and explain its origin in terms of temperature.
**(e)** Explain why a large set of modes permits an inversion for $c(r)$, and name the analogous technique in another field.
**(f)** Explain why low-degree modes are the ones that probe the core.

### 5 — What it established
**(a)** List five results from helioseismology.
**(b)** The sound-speed profile agrees with the model to 0.1%. Explain why this is a genuine test rather than a fit, naming which quantities *were* tuned.
**(c)** Describe the rotation result and explain why it was a surprise.
**(d)** Define the tachocline and state its suspected role.
**(e)** Explain why a measurement that surprises a model is worth more than one that confirms it.

### 6 — The abundance problem
**(a)** Describe what changed in 2005 and why it was regarded as an improvement.
**(b)** Trace the chain: lower metallicity → ? → ? → disagreement. Name the earlier chapter that established the middle step.
**(c)** State the size of the disagreement in the convection-zone depth and in the sound speed, and compare with the previous level of agreement.
**(d)** Give three candidate resolutions.
**(e)** Explain why "the problem was created by an improvement" is a point in favour of the field rather than against it.
**(f)** Explain why a shared input is the natural suspect when two independent probes stop agreeing, and identify which input that is here.

### 7 — Independence
**(a)** Tabulate the two probes against what each tests and the physics each involves.
**(b)** Give a specific example of an error that could corrupt one and not the other, in each direction.
**(c)** Explain why agreement between two independent probes is worth more than either being made more precise.

### 8 — Numerical
**(a)** A star's core temperature is 2% higher than assumed. Compute the fractional error in the predicted ⁸B and ⁷Be neutrino fluxes.
**(b)** A future experiment measures the ⁸B flux to 3%. To what precision does this determine $T_c$?
**(c)** Compare with the precision on $T_c$ obtainable from the luminosity, given that $L$ is measured to 0.1% and depends only weakly on $T_c$. Comment.
**(d)** Estimate the sound travel time across the Sun's diameter, taking a representative mean sound speed of $\bar{c} \approx 100$ km/s, and comment on its relation to the observed 5-minute period.

### 9 — Open problem: what would it take to be wrong?
**(a)** State the strongest single piece of evidence that the solar interior model is correct, and the strongest piece of evidence that something is missing.
**(b)** Design an observation or experiment that would resolve the abundance problem. State what you would measure and what would limit you.
**(c)** Helioseismology works for the Sun. Explain what asteroseismology can and cannot do for other stars, and why the difference matters for everything in this sub-block.
**(d)** Suppose the opacity tables were found to be 15% low in the relevant regime. Trace the consequences through at least three other results in stellar physics.

## Worked answers

### 1 — Seventeen atoms

**(a)** Target: 615 tonnes of perchloroethylene (dry-cleaning fluid), chosen because it is cheap, dense in chlorine, and chemically stable. Reaction: $\nu_e + {}^{37}\text{Cl} \to {}^{37}\text{Ar} + e^-$. Extraction: argon is a noble gas and chemically inert, so it can be flushed from the tank by bubbling helium through it, then collected and counted by its radioactive decay (35-day half-life).

Underground (1,478 m) because cosmic-ray muons at the surface produce ³⁷Ar at a rate that would overwhelm the signal by orders of magnitude. Several hundred metres of rock reduces the muon flux enough for a handful of events to be detectable.

**(b)** The ratio is $17/2\times10^{30} \approx 10^{-29}$ — roughly one atom in $10^{29}$ must be found, identified and counted individually.

The difficulty is not the neutrino physics but the chemistry and the background suppression: the extraction efficiency must be known, the counting must distinguish ³⁷Ar decays from every other radioactive process in the apparatus, and the entire result rests on a handful of events per run. Statistical errors of order $\sqrt{17}/17 \approx 24\%$ are unavoidable per run, which is why the experiment ran for twenty-five years.

**(c)** Predicted ~8.0 SNU; observed ~2.56 SNU; ratio 0.32.

**(d)** Either the stellar model is wrong — the Sun's core is cooler than the standard solar model claims, so fewer high-energy neutrinos are produced — or the particle model is wrong, and the neutrinos are produced as predicted but something happens to them en route.

Neither could be excluded because the measurement constrains only the product of production and survival. A single number — the arriving $\nu_e$ flux — cannot distinguish "fewer made" from "fewer arriving as $\nu_e$."

**(e)** $0.32 = (T_c'/T_c)^{24} \Rightarrow T_c'/T_c = 0.32^{1/24} = 0.954$, so $T_c$ lower by 4.6%.

Entirely plausible. The central temperature is not measured but inferred from a model of an unobservable interior, depending on opacity tables, nuclear cross-sections measured by extrapolation, a convection treatment with a fitted parameter, and an assumed composition. A 5% error in such a quantity would have surprised nobody, which is exactly why the discrepancy was ambiguous for so long.

**(f)** Because neutrino flavour oscillation requires neutrinos to have mass, and the Standard Model of particle physics as then formulated had them massless. The astrophysical explanation required only that astronomers had made a modest error in a difficult inference; the particle explanation required new physics beyond a theory that was otherwise extraordinarily successful.

The prior strongly favoured the astronomers being wrong, and many physicists said so. It was the less economical hypothesis that turned out to be correct — worth remembering when weighing "someone probably made a mistake" against "the framework is incomplete."

### 2 — Why neutrinos

**(a)** Neutrino: 2.3 seconds (free flight at $c$ across $R_\odot$). Energy as photons: ~$10^5$ years $= 3.2\times10^{12}$ s. Ratio: $\approx 1.4\times10^{12}$.

**(b)** A photon is absorbed and re-emitted some $10^{23}$ times. Each event erases its direction, energy and phase; the re-emitted photon is drawn from the local thermal distribution. The information is not degraded but eliminated, after the first few interactions.

A neutrino does not interact at all. Its mean free path in stellar material is measured in light-years, so it emerges with exactly the energy and direction it was created with — no scattering, no thermalisation, nothing to erase.

**(c)** Neutrinos are the only direct observation of a stellar core — everything else reports on the surface, or on a model connecting the surface to the interior.

**(d)** For a 1% increase in $T_c$: pp, $(1.01)^{-1.1} - 1 = -1.1\%$; ⁷Be, $(1.01)^{10} - 1 = +10.5\%$; ⁸B, $(1.01)^{24} - 1 = +27.0\%$.

**(e)** Because the chlorine reaction has a relatively high energy threshold (~0.81 MeV), and only the ⁸B branch produces neutrinos energetic enough to trigger it in quantity. The pp neutrinos, though 91% of the flux, are almost all below threshold.

It helped because ⁸B has by far the steepest temperature dependence, making the experiment an extremely sensitive thermometer. It hindered for the same reason: a small error in $T_c$ produces a large error in the predicted flux, so the observed factor-of-three deficit corresponded to only a 4.6% temperature error — small enough to be plausible, and therefore not decisive. Sensitivity and ambiguity were the same property.

**(f)** Because the luminosity is buffered by the thermostat. Energy generation adjusts to match the leak rate, which is set by opacity and gravity, so a change in core conditions produces a compensating adjustment rather than a proportional change in output.

The neutrino flux is not buffered: neutrinos escape immediately and are not part of the energy transport at all, so their production rate reports the instantaneous core conditions directly. The luminosity tells you about the envelope; the neutrinos tell you about the core.

### 3 — SNO

**(a)** Deuterium, which can be broken up by a neutrino of any flavour. Ordinary water offers essentially only elastic scattering off electrons, which is dominated by $\nu_e$ and cannot cleanly separate flavours.

**(b)** Charged current: $\nu_e + d \to p + p + e^-$ — requires producing an electron, so only electron neutrinos. Neutral current: $\nu_x + d \to p + n + \nu_x$ — merely dissociates the deuteron, all three flavours equally. Elastic scattering: $\nu_x + e^- \to \nu_x + e^-$ — mostly $\nu_e$, with reduced sensitivity to the others.

**(c)** Because it is flavour-blind, and therefore measures the total neutrino flux regardless of what has happened en route.

That is precisely the quantity the two competing hypotheses disagree about. If the Sun produces fewer neutrinos, the total is low. If neutrinos oscillate, the total is unchanged and only the $\nu_e$ fraction is reduced. One measurement discriminates directly.

**(d)** $1.76/5.09 = 0.35$ — matching Davis's ~1/3.

**(e)** $5.09/5.05 = 1.008$ — agreement to 0.8%.

**(f)** Right: the standard solar model, which predicted the total neutrino production to within 1% and hence the central temperature to well under a percent. Wrong: the Standard Model of particle physics, which required neutrinos to be massless; flavour oscillation requires mass.

The direction is unusual because astrophysics is normally a consumer of fundamental physics — nuclear cross-sections, opacities and equations of state are imported from laboratory work. Here an astronomical measurement, sustained for thirty years against widespread doubt, identified a gap in particle physics.

**(g)** A discrepancy between two theories does not tell you which is wrong, and no amount of additional precision on the same measurement can resolve it — Davis could have run for another thirty years and learned nothing new about which hypothesis was correct.

What settles it is a measurement designed to discriminate: one whose outcome differs between the hypotheses. SNO's neutral-current channel did not measure the disputed quantity more precisely; it measured a different quantity, chosen because the two theories made opposite predictions about it. Designing to discriminate rather than to refine is the harder and more valuable move.

### 4 — The Sun rings

**(a)** Period ~5 minutes; velocity amplitude ~10 cm/s; displacement ~1 metre; about 10 million modes identified, with frequencies measured to ~1 part in $10^5$.

**(b)** Turbulent convection in the outer layers — the same granulation that is visible directly at the photosphere. The stochastic buffeting of the convective motions excites the Sun's acoustic resonances, exactly as random turbulence excites the resonances of an organ pipe.

**(c)** The sound speed increases inward, because $c \propto \sqrt{T/\mu}$ and temperature rises steeply toward the centre.

A wave travelling obliquely downward therefore enters progressively faster material and is refracted — bent toward the horizontal — by exactly the mechanism that bends light entering a medium of lower refractive index. At some depth the wave is travelling horizontally and turns back upward.

The turning depth is set by the wave's horizontal wavelength (equivalently, its degree $\ell$): a steeply travelling wave with short horizontal wavelength turns around shallowly, while a shallow-angled wave with long horizontal wavelength penetrates deeply.

**(d)** Ratio $= 505/8 = 63$.

Origin: $c \propto \sqrt{T/\mu}$. The temperature ratio is $1.57\times10^{7}/5772 = 2{,}720$, and $\sqrt{2720} = 52$ — with the remainder accounted for by the change in mean molecular weight and adiabatic index between the ionised interior and the neutral photosphere. The sound-speed profile is essentially a temperature profile.

**(e)** Because each mode's frequency depends on the sound speed integrated along its own path, and different modes have different paths. With enough modes, one has a large system of integral equations relating observed frequencies to the unknown function $c(r)$, which can be inverted.

The analogous technique is medical CT tomography — and, more closely, terrestrial seismology, where earthquake waves recorded at many stations are inverted for the Earth's internal structure. The mathematics is the same.

**(f)** Because a low-degree mode has a very long horizontal wavelength, so it travels almost radially rather than obliquely. Refraction turns a wave around when its horizontal phase speed matches the local sound speed — and for a nearly radial wave, that condition is met only very deep, or not at all.

$\ell = 0$ modes pass directly through the centre. They are therefore the only modes carrying information about the core, and they are also the hardest to detect, since a low-degree mode has few nodes across the disc and produces a small integrated signal.

### 5 — What it established

**(a)** The sound-speed profile (agreeing with the model to 0.1%); the base of the convection zone at 0.713 ± 0.001 $R_\odot$; the surface helium abundance ($Y$ = 0.248); the interior rotation profile (rigid below the convection zone); and the tachocline.

**(b)** Because the model's free parameters were tuned to reproduce only the radius and the luminosity — specifically, the mixing-length parameter $\alpha_{MLT}$ and the initial helium abundance.

The sound-speed profile was not tuned. It is an output of the resulting model at every interior radius — thousands of independent numbers — and it was confirmed to one part in a thousand. A fit constrains as many quantities as it has parameters; this constrains a function.

**(c)** The Sun's surface rotates differentially — equator ~25 days, poles ~35. Helioseismology found that this pattern is confined to the convection zone, and that the radiative interior rotates almost as a solid body, with a thin shear layer between.

It was a surprise because the natural expectations were either that differential rotation continues inward, or that it follows surfaces of constant rotation on cylinders, as rotating-fluid theory suggests. Neither is what happens, and nobody had predicted rigid interior rotation.

**(d)** The tachocline is the thin transition layer at ~0.7 $R_\odot$ where the rotation changes from differential (above) to rigid (below), over a distance of a few percent of the solar radius.

Its suspected role: the seat of the solar dynamo. Strong radial shear across a thin layer is precisely what is needed to stretch and amplify a magnetic field, and the tachocline provides it at the base of the convection zone, where field can be stored stably before rising.

**(e)** Because a confirmation may reflect the model having been fitted to the observation, whereas a surprise cannot have been. A surprise also changes the theory rather than merely licensing it: the tachocline was not in the models, and its discovery redirected dynamo theory. A measurement that only confirms leaves the field where it was; one that surprises moves it.

*(And in this case helioseismology did both — confirming the sound-speed profile and surprising with the rotation — which is the ideal outcome, since the confirmation establishes that the surprise is trustworthy.)*

### 6 — The abundance problem

**(a)** Three-dimensional radiation-hydrodynamic model atmospheres replaced the one-dimensional models previously used to derive photospheric abundances from spectral lines. The new models treat granulation and the associated velocity fields explicitly rather than through a fitted "microturbulence" parameter.

Regarded as an improvement because they are more physically realistic, they reproduce observed line shapes and asymmetries that 1-D models could not, and they remove several ad hoc fitting parameters. The result was systematically lower abundances of C, N and O — reducing the solar metallicity by roughly 30%.

**(b)** Lower metallicity → lower opacity (bound–free absorption requires metals) → a shallower temperature gradient is needed to carry the flux → the convection zone begins deeper and the interior structure changes → disagreement with the helioseismic sound-speed profile.

The middle step — that opacity depends on metallicity through bound–free absorption — was established in Energy Transport.

**(c)** Convection-zone base: predicted 0.726 $R_\odot$ against observed 0.713 — a discrepancy of 1.8% in radius, against an observational precision of 0.14%. Sound speed: discrepancies of ~1% below the convection zone, where previously the agreement was ~0.1%. The disagreement is ten times the previous level of agreement.

**(d)** The abundances are wrong — the new determinations may contain a systematic despite the improved atmospheres. The opacities are wrong — the theoretical opacity tables may be low; laboratory measurements of iron opacity at stellar conditions have come out higher than tabulated, which would partly restore agreement. Or something is missing from the models — additional mixing below the convection zone, or another omitted process.

**(e)** Because it demonstrates that the model is tested rather than fitted.

Had the abundances been free parameters, the improvement would simply have been absorbed and the agreement maintained — and nothing would have been learned. Instead, an independent measurement of one input broke the agreement with a different independent measurement of an output. That is only possible in a framework where the inputs are constrained externally. A model that can never be broken by an improvement in its inputs is not being tested by them.

**(f)** Because the probes disagree only through what they share. Neutrinos and helioseismology involve disjoint physics — weak interactions and nuclear cross-sections on one side, acoustics and fluid dynamics on the other — so a failure in either alone cannot produce a consistent disagreement in both.

What they share is the stellar model itself, and specifically its inputs: composition, equation of state, and opacity. The opacity is the natural suspect because it is the least directly verified: opacity tables are computed theoretically for conditions unreachable in most laboratories, and the one place they have been measured — iron at near-solar-interior conditions — gave a higher answer than the tables.

### 7 — Independence

**(a)**

| Probe | Tests | Physics involved |
|---|---|---|
| **Neutrinos** | the core: $T_c$, reaction rates | weak interaction, nuclear cross-sections |
| **Helioseismology** | the structure: $c(r)$, $\rho(r)$ | acoustics, fluid dynamics |
| Luminosity + radius | surface boundary conditions | radiative transfer |

**(b)** An error corrupting neutrinos and not seismology: a mis-measured nuclear cross-section — say the ³He+⁴He branching ratio — would change the predicted ⁸B flux substantially while leaving the sound-speed profile untouched, since the structure depends on the total energy generation rather than on which branch produces it.

An error corrupting seismology and not neutrinos: a wrong equation of state, or an error in the mixing-length treatment near the surface, would shift the predicted sound speed while barely affecting the core temperature and hence the neutrino flux.

**(c)** Because increasing the precision of one probe reduces its random error and leaves any systematic untouched. Davis could have counted argon atoms for another thirty years without discovering that the neutrinos were oscillating.

Agreement between probes with disjoint failure modes tests for systematics, because a systematic in one has no reason to produce a matching offset in the other. Only independence tests for the errors that precision cannot find.

### 8 — Numerical

**(a)** ⁸B: $(1.02)^{24} - 1 = +61\%$. ⁷Be: $(1.02)^{10} - 1 = +22\%$.

**(b)** $\delta\Phi/\Phi = 24\,\delta T_c/T_c$, so $\delta T_c/T_c = 0.03/24 = 0.125\%$. A 3% flux measurement determines the central temperature to about one part in a thousand.

**(c)** The luminosity depends only weakly on $T_c$ — it is set by the leak rate and buffered by the thermostat — so even a 0.1% luminosity measurement constrains $T_c$ far more poorly, by a factor of order a hundred or more depending on the assumed sensitivity.

The steepness that made the neutrino discrepancy ambiguous is the same steepness that makes neutrinos the best available thermometer. A quantity that responds violently to what you want to measure is hard to interpret when it disagrees, and exquisitely sensitive once you can trust it. Ambiguity and precision were two faces of the same exponent — and it took a differently designed experiment, not a better one, to convert the first into the second.

**(d)** $2R_\odot/\bar{c} = 2(6.957\times10^{8})/10^{5} = 1.39\times10^{4}$ s $= 232$ minutes, about four hours.

This is far longer than the observed 5-minute period, which is the expected result. The 5-minute modes are high-order standing waves with many radial nodes — the observed period is the time for a wave to complete a resonant cycle in a shallow cavity near the surface, not to cross the whole Sun. Only the very lowest-order modes have periods approaching the global sound-crossing time, and the low-degree modes that reach the core have periods of tens of minutes to hours. The 5-minute oscillation is a surface phenomenon; the core is probed by rarer, slower modes.

### 9 — Open problem: what would it take to be wrong?

**(a)** Strongest evidence it is correct: the sound-speed profile agreeing with the model to 0.1% across the interior — a function, not a number, predicted rather than fitted, and independently corroborated by the SNO neutrino flux matching the prediction to 0.8% through entirely different physics.

Strongest evidence something is missing: the solar abundance problem — a ~1% sound-speed discrepancy and a 1.8% error in the convection-zone depth, produced by an improvement in the input abundances and unresolved for two decades.

**(b)** Measure the opacity directly at solar interior conditions.

What to measure: the opacity of iron (and other relevant species) at temperatures of a few million kelvin and densities characteristic of the base of the convection zone, using a high-energy-density facility — a Z-pinch or laser-driven experiment that briefly creates the conditions and measures transmission spectroscopically.

What limits you: creating and diagnosing a uniform sample at those conditions is extraordinarily difficult; the plasma exists for nanoseconds, gradients are severe, and the measured transmission must be corrected for a temperature and density distribution that is itself uncertain. Existing experiments of this kind have produced results higher than the tables, but with large enough uncertainties that the discrepancy is not settled.

*(A complementary route: CNO-cycle neutrinos, whose flux depends directly on the core's carbon and nitrogen abundance. Their detection provides an independent measurement of solar metallicity that does not go through model atmospheres at all — which is exactly the kind of disjoint check this chapter argues for.)*

**(c)** Asteroseismology can detect oscillations in other stars and, from the frequencies, determine the mean density (from the large frequency separation) and a characteristic acoustic depth — hence masses, radii and ages far more precisely than any other method for field stars.

It cannot perform a full inversion for $c(r)$. That requires resolving millions of modes, which requires spatially resolving the stellar disc — impossible for anything but the Sun, since an unresolved star averages over its surface and only low-degree modes ($\ell \le 3$) survive the cancellation.

Why the difference matters: every stellar model applied to other stars is calibrated on the Sun and validated on the Sun. The one star we can test in detail is a G2 dwarf of solar metallicity — and the structure of stars inverts across the mass range. Convection in a red giant or an M dwarf is a different regime, and mixing-length theory's single parameter is transplanted there with no comparable check. The interior of one star is well verified; the interiors of the rest are extrapolations.

**(d)** Higher opacity means radiation is impeded more, so:

The solar abundance problem would ease or resolve — a deeper convection zone and a modified sound-speed profile are exactly what higher opacity produces, which is why this is the leading candidate resolution.

The mass–luminosity relation shifts. Since $L \propto M^3/\kappa$, a 15% opacity increase reduces the predicted luminosity at fixed mass by ~15% — changing the calibration by which every field star's mass is read off the main sequence, and hence the initial mass function and every galaxy mass derived from light.

Stellar lifetimes and cluster ages shift. Since $t \propto M/L$, a lower luminosity at fixed mass gives a longer lifetime — which moves main-sequence turnoff ages, including globular cluster ages and hence the independent lower bound on the age of the universe.

*(A fourth: the location of convective boundaries generally, which sets burnable fuel fractions and therefore feeds back into lifetimes again.)*$astroSeeingInside_master$,
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
