-- Astronomy & Space · The Dark Universe — Cosmic Frontiers — "Open Questions".
-- Curated master for
-- astronomy-and-space/dark-universe/cosmic-frontiers/open-questions
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Second chapter of the Cosmic Frontiers block. Deliberately not a list.
-- Organised as a taxonomy by what would count as an answer: missing
-- entities (dark matter, dark energy), measurement discrepancies (H0 at
-- 4.8 sigma, S8 at 2.5 sigma, lithium at a factor of 3), missing
-- mechanisms (baryon asymmetry, the initial low-entropy state), questions
-- about the unobservable (deferred to the Multiverse chapter), and
-- questions that may be malformed (coincidence, fine-tuning). Includes a
-- section on distinguishing a real anomaly from a fluctuation, with the
-- actual track record - BICEP2, the 750 GeV diphoton, OPERA - because
-- that track record is the relevant base rate and is usually omitted.
-- Closes with what is actually coming: Rubin, Euclid, DESI, CMB-S4,
-- next-generation direct detection against the neutrino fog,
-- Hyper-Kamiokande and DUNE.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: rho_Lambda = 5.92e-27 kg/m^3 =
-- (2.25e-3 eV)^4 from 3 H0^2/(8 pi G) x OL; Planck density
-- c^5/(hbar G^2) = 5.15e96 kg/m^3, ratio 10^122.9; eta = n_b/n_gamma =
-- 273.9e-10 x Ob h^2 = 6.1e-10; H0 tension Planck 67.36+-0.54 vs SH0ES
-- 73.04+-1.04 = 4.8 sigma, an 8.4% difference; S8 0.830+-0.013 vs
-- 0.776+-0.017 = 2.5 sigma; neutrino mass sum minimum 0.059 eV normal
-- ordering and 0.100 eV inverted, against a cosmological bound of
-- 0.12 eV; Li-7 predicted (4.7-5.2)e-10 against observed (1.6-2.0)e-10,
-- a factor 2.4-3.2.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/dark-universe/cosmic-frontiers/open-questions',
    'research',
    'advanced',
    'read',
    $duOpen_master$> Cosmology's open questions are usually presented as a list. The list is not very useful, because the items on it are not the same kind of thing. **"What is dark matter?" and "why is the cosmological constant so small?" and "why is there more matter than antimatter?" differ not in difficulty but in what would count as an answer** — and one of them may not have an answer in the ordinary sense at all.

This chapter sorts the open problems by that criterion rather than by subject. The organising question throughout is: *if this were solved tomorrow, what would the solution look like, and how would we know it was right?* That question separates problems that are merely hard from problems that are ill-posed, and it is the difference that matters when deciding where to spend a career or a billion euros.

It also means confronting a fact usually left out of such surveys: **most anomalies go away.** The base rate for a $3\sigma$ result surviving is poor, the history is instructive, and any honest treatment of current tensions has to be calibrated against it.

## 1. A taxonomy of open questions

**Type 1 — Missing entities.** We measure something's gravitational effects to per-cent precision and do not know what it is. *Dark matter, dark energy.* These are well-posed: the answer is an identification, and it would be recognisable — a particle detected in more than one experiment, or an equation of state measured to deviate from $-1$.

**Type 2 — Measurement discrepancies.** Two careful measurements of the same quantity disagree by more than their stated errors. *The Hubble tension, the $S_8$ tension, the lithium problem.* Well-posed, and with a definite structure: **at least one side is wrong**, either through an unrecognised systematic or through physics that makes them measure genuinely different things. Resolvable by better measurement, and often resolved unglamorously.

**Type 3 — Missing mechanisms.** We know what happened and cannot say how. *The baryon asymmetry, the initial low-entropy state, the origin of supermassive black holes.* Well-posed but harder: the answer is a process, and processes leave subtler traces than particles.

**Type 4 — Questions about the unobservable.** *What preceded the Big Bang, what lies beyond the horizon, whether other universes exist.* These may be scientific questions with indirect answers, or they may not be scientific questions at all. That dispute is itself the subject of the next chapter.

**Type 5 — Questions that may be malformed.** *Why is the cosmological constant this value? Why does dark energy come to dominate just when observers exist?* These presuppose that a probability distribution over possible universes exists and is knowable. Without one, "unlikely" has no content — and constructing one is exactly what nobody has managed.

The taxonomy is not a ranking of importance. It is a ranking of **tractability**, and the two are routinely confused.

## 2. Type 1: the missing entities

### 2.1 Dark matter

The evidence is quantitative and from many independent directions: galaxy rotation curves, cluster dynamics and lensing, the Bullet Cluster's separated mass and gas, the CMB peak heights, and — as the previous chapter's growth calculation showed — the flat impossibility of assembling today's structure from baryons that were pressure-supported until recombination.

**What is open is the identification, not the existence.** The candidate mass range spans about eighty orders of magnitude, from ultralight axion-like particles at $10^{-22}$ eV to primordial black holes at tens of solar masses. The field's centre of gravity sat for thirty years on WIMPs — weakly interacting massive particles at the GeV–TeV scale, attractive because the observed abundance falls out of thermal freeze-out without tuning, the so-called WIMP miracle.

Direct detection experiments have improved sensitivity by roughly six orders of magnitude and found nothing. Cross-section limits now approach $10^{-48}\ \text{cm}^2$, and are closing on the **neutrino fog** — the point at which coherent scattering of solar and atmospheric neutrinos produces an irreducible background that mimics the signal. Below that, progress becomes very much harder.

**The honest status:** the simplest and best-motivated candidate has been strongly constrained without being definitively excluded, and the field has broadened rather than converged. This is not a failure of method; it is what an unsuccessful search looks like, and searching the remaining parameter space is exactly the right response. But the confident expectation of imminent detection that was common twenty years ago has not survived contact with the data, and that should be said plainly.

### 2.2 The alternative nobody can quite kill

The standing alternative to a dark matter particle is that gravity is not Newtonian at low accelerations. Modified Newtonian Dynamics posits a scale $a_0 \approx 1.2\times10^{-10}\ \text{m s}^{-2}$ below which the effective force falls as $1/r$ rather than $1/r^2$.

**It works remarkably well where it was designed to work**, and this deserves to be acknowledged rather than skipped. From one parameter it reproduces flat rotation curves and predicts the Tully–Fisher relation — the tight empirical correlation between a galaxy's luminosity and the fourth power of its rotation speed — as a theorem rather than a fit. Dark matter accommodates that relation but does not obviously require it, and the observed tightness of the correlation, with very little scatter across galaxies of wildly different formation histories, remains something the particle picture explains less crisply than one would like.

**It fails elsewhere, and the failures are decisive.** Galaxy clusters still require roughly a factor of two of unseen mass even with MOND applied. The Bullet Cluster shows lensing mass displaced from the gas, which is what a collisionless component does and what a modification of the force law tied to the baryons cannot easily produce. And the CMB acoustic peaks — in particular the ratio of the third peak to the second — measure the amount of non-baryonic clumping matter directly, and MOND without dark matter does not reproduce them. Relativistic completions exist, and each has needed additional fields that function, in practice, rather like dark matter.

**The correct reading is not that MOND is silly but that it is an empirical regularity in search of an explanation.** The successes are real and concentrated on galaxy scales; the failures are real and concentrated on cluster and cosmological scales. A satisfying particle theory of dark matter should probably explain why the MOND relations hold as well as they do on galaxy scales — and no such explanation currently exists. That is itself an open question, and it is one that partisans of both sides tend to leave out.

### 2.3 Dark energy, and the worst prediction in physics

Dark energy is measured well and understood not at all. The equation of state is $w = -1.03 \pm 0.03$, entirely consistent with a cosmological constant, and the density is

$$\rho_\Lambda = \Omega_\Lambda\,\frac{3H_0^2}{8\pi G} = 5.92\times10^{-27}\ \text{kg m}^{-3},$$

which in natural units is $(2.25\times10^{-3}\ \text{eV})^4$ — an energy scale of a few milli-electronvolts, corresponding to nothing else in physics.

The problem is that quantum field theory makes a prediction for this quantity. Summing zero-point energies of quantum fields up to the Planck scale gives a vacuum energy density of order the Planck density, $c^5/\hbar G^2 = 5.15\times10^{96}\ \text{kg m}^{-3}$. The ratio is

$$\frac{\rho_{\rm Planck}}{\rho_\Lambda} = 8.7\times10^{122}.$$

**One hundred and twenty-three orders of magnitude.** This is routinely and correctly described as the worst quantitative prediction in the history of physics. Cutting the sum off at the electroweak scale instead still leaves a discrepancy of $10^{55}$.

Three qualifications keep this from being quite as absurd as it sounds, and all three are worth knowing. The naive calculation is not a theorem — it is a dimensional estimate in a framework, effective field theory, that is not expected to be valid at the Planck scale. Supersymmetry would cancel bosonic against fermionic contributions exactly, reducing the discrepancy to about $10^{55}$ if supersymmetry is broken near the TeV scale; the LHC's failure to find superpartners weakens that. And what gravitates is the *total*, so a bare cosmological constant could in principle cancel the vacuum contribution — but to $123$ decimal places, which is a fine-tuning of a different and more grotesque kind.

**No accepted solution exists.** The only widely discussed non-technical response is anthropic: in a landscape of vacua with different $\Lambda$, observers arise only where $\Lambda$ is small enough for structure to form, and Weinberg's 1987 bound derived from that reasoning correctly predicted the order of magnitude before the measurement. Whether that is an explanation or an admission is the subject of the next chapter.

```checkpoint
q: What is the cosmological constant problem, precisely stated?
a: That we do not know what dark energy is made of
x: True but different. The problem here is quantitative: a specific calculation gives a specific wrong answer.
a*: That quantum field theory's estimate of the vacuum energy density exceeds the measured value by about $10^{123}$
a: That the measured value of $\Lambda$ is exactly zero, which no theory explains
x: It is measured to be small and *non-zero*, which is the harder case — zero could be explained by a symmetry.
a: That $\Lambda$ appears to be changing with time in a way general relativity forbids
x: $w$ is consistent with $-1$, i.e. constant. Hints of evolution exist but are not the problem being described.
hint: Compare the observed energy density with the density obtained by summing quantum zero-point energies to the Planck scale.
why: The measured dark energy density is $\rho_\Lambda = 5.92\times10^{-27}\ \mathrm{kg\,m^{-3}}$, or $(2.25\ \mathrm{meV})^4$ in natural units. Summing quantum zero-point energies up to the Planck scale gives of order the Planck density, $5.15\times10^{96}\ \mathrm{kg\,m^{-3}}$ — a ratio of $8.7\times10^{122}$, the worst quantitative prediction in physics. Cutting off at the electroweak scale instead still leaves $10^{55}$. Three qualifications matter: the naive sum is a dimensional estimate in an effective theory not expected to hold at the Planck scale; unbroken supersymmetry would cancel bosonic against fermionic contributions, though the LHC's null results weaken that route; and only the *total* gravitates, so a bare term could cancel the vacuum contribution — but to $123$ decimal places. Note that a measured value of exactly zero would be **easier** to explain, since symmetries naturally enforce zeros and nothing naturally enforces $10^{-123}$.
---
q: Direct detection experiments have improved WIMP sensitivity by roughly six orders of magnitude and found nothing. What is the correct inference?
a: Dark matter does not exist; the gravitational evidence must have another explanation
x: The gravitational evidence is independent of any particle model and is not weakened at all by a null particle search.
a*: The best-motivated candidate is strongly constrained but not excluded, and the viable candidate space — spanning some eighty orders of magnitude in mass — has broadened rather than narrowed
a: The experiments must have a design flaw, since the WIMP miracle guarantees a detectable signal
x: The WIMP miracle is a suggestive coincidence about relic abundance, not a guarantee of a detectable scattering cross-section.
a: Nothing follows; null results carry no information
x: Null results carry a great deal of information — they exclude parameter space, which is how the field learned that the simplest models are wrong.
hint: Distinguish between evidence for dark matter's existence and evidence about its identity.
why: The case for dark matter's existence rests on rotation curves, cluster dynamics and lensing, the Bullet Cluster's separated mass and gas, CMB peak heights, and the growth argument showing that a baryon-only universe reaches $\delta \approx 0.03$ today. None of that depends on any particle model, so a null particle search leaves it untouched. What the null results do is exclude parameter space: cross-section limits now approach $10^{-48}\ \mathrm{cm^2}$ and have eliminated the most natural WIMP models, pushing the field toward axions, sterile neutrinos, ultralight candidates and primordial black holes across a mass range from $10^{-22}$ eV to tens of solar masses. Two further points deserve emphasis. Experiments are approaching the **neutrino fog**, where coherent scattering of solar and atmospheric neutrinos produces an irreducible background, after which progress becomes far harder. And the confident expectation of imminent detection that was standard twenty years ago has simply not survived — which is worth stating explicitly, because the gap between that expectation and the outcome is itself a lesson about how theoretical attractiveness is weighted.
```

## 3. Type 2: when two good measurements disagree

### 3.1 The Hubble tension

The sharpest quantitative problem in cosmology. Two routes to $H_0$:

- **Early-universe (inverse distance ladder).** Fit $\Lambda$CDM to the CMB and calibrate BAO with the sound horizon: $H_0 = 67.36 \pm 0.54\ \text{km s}^{-1}\text{Mpc}^{-1}$.
- **Late-universe (distance ladder).** Parallaxes to Cepheids, Cepheids in supernova host galaxies, Type Ia supernovae into the Hubble flow: $H_0 = 73.04 \pm 1.04$.

The gap is $8.4\%$ and the significance is

$$\frac{73.04 - 67.36}{\sqrt{1.04^2 + 0.54^2}} = 4.8\sigma.$$

**What makes this different from an ordinary disagreement** is its persistence under attack. Both sides have been rebuilt with independent methods: the ladder has been redone with the tip of the red giant branch, with Mira variables, with the Tully–Fisher relation, and with JWST photometry that resolves crowding in Cepheid fields — the leading suspected systematic. Gravitational lensing time delays and gravitational-wave standard sirens provide entirely independent routes. The early-universe side has been cross-checked with BAO, big bang nucleosynthesis and lensing.

**What keeps it from being decisive** is that the methods do not all agree with each other either. TRGB-based calibrations have tended to land between the two camps, near $70$, and whether that reflects a genuine intermediate value or an unrecognised systematic in one calibration is exactly what is disputed. JWST results have been read by different groups as confirming and as dissolving the tension.

If the discrepancy is physics, the constraint is severe. Anything altering the late-time expansion tends to break BAO or supernova fits; the least-constrained option is **early dark energy** — a component that briefly contributes before recombination, reducing the sound horizon and thus raising the inferred $H_0$ — which improves the fit but at the cost of a new component with tuned onset, and it worsens $S_8$.

**Assessment:** this is the strongest anomaly in cosmology. It has survived a decade of scrutiny by hostile experts, which most anomalies do not. It is still more likely than not to be resolved by a systematic, because that is what usually happens, and because no proposed physics solution is clean.

### 3.2 The $S_8$ tension

Planck predicts $S_8 = \sigma_8\sqrt{\Omega_m/0.3} = 0.830 \pm 0.013$; weak-lensing surveys measure around $0.776 \pm 0.017$, a $2.5\sigma$ discrepancy in the sense that the late universe is slightly *less* clumpy than early-universe initial conditions plus $\Lambda$CDM growth predict.

At $2.5\sigma$ this is not a detection. It is degenerate with baryonic feedback — energy from supernovae and active nuclei redistributing gas and suppressing small-scale power by an amount that is genuinely uncertain — and the surveys share calibration methodology, so their agreement with each other is less independent than it looks. Worth watching; not evidence.

### 3.3 The lithium problem

Big bang nucleosynthesis predicts primordial $^7\text{Li}/\text{H} \approx (4.7$–$5.2)\times10^{-10}$ from the baryon density the CMB independently fixes. Observations of metal-poor halo stars give $(1.6$–$2.0)\times10^{-10}$ — low by a factor of about three, with small errors on both sides.

The same calculation gets deuterium right to a per cent and helium-4 right to a per cent, which is what makes lithium interesting rather than dismissible. Three families of explanation: stellar depletion (lithium is destroyed at modest temperatures, so the observed surface abundance may not be the birth abundance — currently the leading candidate, with rotational mixing the favoured mechanism); nuclear rates (repeatedly remeasured, no resolution found); or new physics during BBN, which is heavily constrained by the success of the other two isotopes.

**This one is instructive because it is the shape most anomalies have:** a genuine discrepancy, mundane explanations that are plausible but unproven, and a slow drift toward the boring answer without a decisive moment.

```checkpoint
q: The Hubble tension stands at $4.8\sigma$. What is the most defensible assessment?
a: New physics beyond $\Lambda$CDM is now established, since $5\sigma$ is the discovery threshold
x: The threshold applies to a single well-controlled measurement, not to a discrepancy between two complex analyses whose systematics are the thing in question.
a*: It is the strongest anomaly in cosmology and has survived a decade of hostile scrutiny, but a systematic remains more likely than new physics, partly because no proposed physical solution is clean
a: It is certainly a systematic in the distance ladder, since the CMB analysis is far simpler
x: The CMB route is not assumption-free — it infers $H_0$ through a $\Lambda$CDM fit — and the ladder has been rebuilt with several independent calibrators.
a: It will be resolved by better statistics, since both errors are still large
x: Both measurements are already systematics-limited; more data alone will not settle it.
hint: Ask what the base rate is for anomalies of this kind, and what it would cost theoretically to accept this one.
why: The two routes are the inverse distance ladder ($67.36\pm0.54$, from CMB plus BAO calibrated by the sound horizon) and the direct ladder ($73.04\pm1.04$, from parallaxes, Cepheids and Type Ia supernovae), differing by $8.4\%$ at $4.8\sigma$. What distinguishes this from ordinary disagreements is persistence: both sides have been rebuilt with independent methods — TRGB, Miras, lensing time delays, standard sirens on one side; BAO, BBN and CMB lensing on the other — and it has not dissolved. What restrains the conclusion is that the methods do not all agree with each other either, with TRGB calibrations landing near $70$, and JWST results being read by different groups both ways. Meanwhile, physical solutions are constrained to the point of ugliness: late-time modifications break BAO or supernova fits, and the most viable option, early dark energy, requires a new component with a tuned onset and makes $S_8$ worse. The base rate matters here — most multi-sigma anomalies resolve into systematics — so the correct posture is that this is the best candidate for new physics currently available while still probably not being new physics.
---
q: Big bang nucleosynthesis predicts deuterium and helium-4 correctly to about a per cent but overpredicts lithium-7 by a factor of three. What does this pattern suggest?
a: That BBN theory is fundamentally wrong and the deuterium agreement is a coincidence
x: Two independent isotopes matching at the per-cent level from one parameter is not plausibly coincidence.
a*: That the problem is most likely specific to lithium — in its stellar observation or its nuclear rates — rather than in the framework, since a framework error would spoil the other isotopes too
a: That the baryon density inferred from the CMB must be wrong
x: A different baryon density would break the deuterium and helium agreement, which is far better established than the lithium measurement.
a: That new physics operated during BBN, altering only lithium
x: Possible, but heavily constrained: almost anything changing the expansion rate or particle content during BBN perturbs deuterium and helium as well.
hint: Ask what a framework-level error would do to the isotopes that currently agree.
why: BBN takes one free parameter — the baryon-to-photon ratio, fixed independently by the CMB at $\eta = 6.1\times10^{-10}$ — and predicts all the light element abundances. Deuterium and helium-4 come out right to about a per cent each, which is a stringent test that a framework error would fail. Lithium-7 is predicted at $(4.7$–$5.2)\times10^{-10}$ against $(1.6$–$2.0)\times10^{-10}$ observed in metal-poor halo stars. The localisation of the failure points to something lithium-specific, and the leading candidate is observational rather than theoretical: lithium is destroyed at relatively modest stellar temperatures, so the surface abundance measured today need not be the star's birth abundance, with rotational mixing transporting lithium to hotter layers over billions of years. Nuclear reaction rates have been remeasured repeatedly without resolution, and new physics during BBN is tightly constrained precisely because it would disturb the two isotopes that agree. This is the characteristic shape of most anomalies — real discrepancy, plausible but unproven mundane explanation, slow drift toward the boring answer with no decisive moment — and it is the shape against which more exciting tensions should be calibrated.
```

## 4. Type 3: the missing mechanisms

### 4.1 Why is there anything rather than nothing in particular

The universe contains matter and essentially no antimatter. Quantitatively, the baryon-to-photon ratio is

$$\eta = \frac{n_b}{n_\gamma} = 273.9\times10^{-10}\times\Omega_b h^2 = 6.1\times10^{-10},$$

measured two independent ways — from BBN's deuterium yield and from the CMB peak heights — and they agree.

Read that number correctly. It means that in the early universe, for every $10^9$ antiquarks there were about $10^9 + 1$ quarks. Everything annihilated; **the entire material content of the universe is the one-part-in-a-billion residue.** The photons we see in the CMB are, in the main, the annihilation products.

Sakharov identified in 1967 what any mechanism must supply: baryon number violation, C and CP violation, and departure from thermal equilibrium. The Standard Model contains all three in principle — baryon number violation through electroweak sphalerons, CP violation in the CKM matrix, and a departure from equilibrium at the electroweak phase transition — and **fails quantitatively on two of them.** Its CP violation is too small by roughly ten orders of magnitude, and with the measured Higgs mass the electroweak transition is a smooth crossover rather than a first-order transition, so equilibrium is never sufficiently broken.

Proposed mechanisms — leptogenesis via heavy right-handed neutrino decay, electroweak baryogenesis with an extended Higgs sector, Affleck–Dine — are testable in principle. Leptogenesis is currently the most popular, and it connects to neutrino mass: the same heavy neutrinos that generate the asymmetry would explain why the light neutrinos are so light. Its most accessible signature is neutrinoless double beta decay, which would establish that neutrinos are their own antiparticles. **That experiment is running.**

### 4.2 The low-entropy initial condition

The second law says entropy increases, which requires the early universe to have had extraordinarily low entropy. But the early universe was a nearly uniform hot plasma in thermal equilibrium — and for ordinary matter, uniform equilibrium is the *maximum* entropy state.

The resolution is that gravity inverts the usual relationship: for a self-gravitating system, uniformity is low entropy and clumping is high. So the smooth early universe was gravitationally low-entropy, and Penrose's estimate makes the required tuning $1$ part in $10^{10^{123}}$.

**Inflation does not obviously solve this**, and it is worth being exact about why. Inflation explains why the universe is *smooth*, which is the low-entropy condition. But inflation requires its own special initial conditions to begin — a patch of appropriate size in a suitable state — and the question of whether those conditions are less special than what they explain has been argued for forty years without resolution. This is a genuine open problem, it is not a fringe objection, and it is regularly glossed over.

### 4.3 Neutrino masses, where cosmology is currently winning

Oscillation experiments establish that neutrinos have mass and measure the differences of squared masses, giving a minimum sum of $0.059$ eV for normal ordering and $0.100$ eV for inverted ordering. They cannot give the absolute scale.

Cosmology can, because massive neutrinos free-stream and suppress small-scale structure in proportion to their mass. Current bounds are around $\sum m_\nu < 0.12$ eV.

**This is close to interesting.** The bound is already in tension with inverted ordering, and modest improvement would exclude it from cosmology alone — a laboratory-scale particle physics result obtained from the distribution of galaxies. It is also a case where the answer depends on the cosmological model assumed, so a confirmed exclusion would need care.

```checkpoint
q: Inflation makes the universe smooth, and smoothness is the low-entropy condition the second law requires. Why is the entropy problem nevertheless still considered open?
a: Because inflation has not been experimentally confirmed, so its explanation cannot be relied upon
x: A real concern, but a distinct one. Even granting inflation entirely, the entropy objection stands.
a*: Because inflation requires its own special initial conditions to begin, and whether those are less special than the smoothness they explain is unresolved
a: Because entropy actually decreases during inflation, violating the second law
x: Inflation does not violate the second law; the horizon's entropy accounting is subtle but the objection is about initial conditions, not violations.
a: Because gravitational entropy is not well defined, so the problem cannot be stated
x: It is defined well enough to state the problem — Penrose's estimate of $1$ part in $10^{10^{123}}$ is a specific calculation.
hint: Ask what has to be true of a patch of the universe for inflation to start in it.
why: For a self-gravitating system, uniformity is *low* entropy and clumping is high — the reverse of ordinary matter — so the smooth early universe was in an extraordinarily improbable gravitational state, tuned at the level of $1$ part in $10^{10^{123}}$ on Penrose's estimate. Inflation explains the smoothness, which looks like a solution. The objection, pressed for forty years without resolution, is that inflation must itself begin in a patch of appropriate size with the inflaton field suitably positioned and its gradients small — conditions that are themselves special. If those conditions are as improbable as the smoothness they produce, nothing has been explained; the specialness has been relocated. Defenders argue that the required patch is small and that inflation's attractor behaviour makes a wide range of starting points converge; critics argue that the measure used to make that assessment is exactly what is in dispute — which returns to the Type 5 problem of needing a probability distribution over possibilities in order to say anything is likely or unlikely. This is a mainstream technical objection, not a fringe one, and it is regularly omitted from expositions of inflation.
---
q: Why can cosmology constrain the absolute neutrino mass scale when oscillation experiments cannot?
a: Because cosmological measurements are more precise than laboratory measurements
x: Precision is not the issue; the two are sensitive to different quantities, and oscillations are insensitive to the absolute scale at any precision.
a*: Because oscillations measure differences of squared masses, whereas massive neutrinos free-stream and suppress small-scale structure by an amount proportional to the total mass
a: Because neutrinos in the early universe were non-relativistic, making their rest mass directly observable
x: They were highly relativistic in the early universe; the effect arises as they become non-relativistic later and stop free-streaming.
a: Because the CMB temperature depends directly on neutrino mass
x: The CMB temperature is set by photon thermodynamics; the neutrino mass signature is in structure growth and lensing, not in the mean temperature.
hint: Ask what quantity an oscillation probability depends on, and what quantity free-streaming depends on.
why: Oscillation probabilities depend on $\Delta m^2$ — differences of squared masses — so they establish that neutrinos have mass and fix the splittings, giving minimum sums of $0.059$ eV for normal ordering and $0.100$ eV for inverted, but they are insensitive to the overall offset. Cosmology is sensitive to the *sum* by a completely different mechanism: neutrinos remain relativistic long after the other species become non-relativistic, free-stream out of perturbations below their free-streaming length, and suppress small-scale structure in proportion to $\sum m_\nu$. Current bounds sit near $0.12$ eV, which already presses on inverted ordering and would exclude it with modest improvement — a laboratory-scale particle physics result derived from the distribution of galaxies. The caveat is that the bound is model-dependent: it is derived within $\Lambda$CDM, and an extension that alters late-time growth would relax it, so any claimed exclusion has to state the assumed cosmology rather than presenting the number bare.
```

## 5. Type 5: the questions that may be malformed

### 5.1 The coincidence problem

Matter density falls as $a^{-3}$; dark energy density is constant. They are equal only briefly, and we happen to observe within about a factor of two of that crossing. Asked as "why now?", this looks like a striking coincidence.

Two responses. **The selection response:** observers require galaxies, galaxies require structure formation, and structure formation is switched off by dark energy — so observers exist only in a window bracketing the transition. The coincidence dissolves into a selection effect, and this argument is quantitative rather than hand-waving. **The dissolution response:** the problem is not well-posed without a probability distribution over epochs at which one might exist, and no principled way of assigning one is available.

### 5.2 Fine-tuning arguments generally

Many constants appear tuned: the cosmological constant, the neutron–proton mass difference, the strength of the strong force relative to electromagnetism, the flatness of the inflaton potential.

The logical structure is always: *if this were different by $\epsilon$, no observers.* The step from there to "this needs explanation" requires a measure over possible values — and **without a measure, "unlikely" is not defined.** Building one requires a theory of which constants can vary, over what range, with what distribution, and that theory is exactly what is missing. String theory's landscape supplies a candidate but its measure is disputed and the number of vacua is a rough estimate.

This is not a claim that fine-tuning arguments are worthless: Weinberg's anthropic bound on $\Lambda$ made a correct order-of-magnitude prediction before the measurement, which is a genuine scientific success and should not be waved away. It is a claim that **the arguments are conditional on an assumption that is usually left implicit**, and that stating it changes how much weight they bear.

{{image: Euclid (spacecraft) | A wide-field survey observatory designed to map the distribution and shapes of billions of galaxies, measuring both the expansion history and the growth of structure over most of cosmic time. Surveys of this class attack the open questions listed here from a specific direction: they measure the dark energy equation of state precisely enough to detect a deviation from minus one, and they measure the growth rate independently of the expansion rate, which separates modified gravity from a genuine dark energy component. They also improve the neutrino mass bound, where cosmology already constrains the absolute mass scale better than laboratory experiments can.}}

```checkpoint
q: The baryon-to-photon ratio is $\eta = 6.1\times10^{-10}$. What does this number physically represent?
a: The fraction of the universe's energy density in baryons today
x: That is $\Omega_b \approx 0.05$, a different quantity by seven orders of magnitude.
a*: That in the early universe there was roughly one excess quark per billion quark–antiquark pairs, and everything we are made of is that residue
a: The efficiency with which baryons formed from quarks during the QCD transition
x: Confinement was essentially complete; the small number reflects an asymmetry between matter and antimatter, not an inefficiency of hadronisation.
a: The probability that a photon converts to a baryon pair in the early universe
x: Pair production and annihilation were both fast and in equilibrium; the ratio measures a conserved excess, not a rate.
hint: Ask what happened to the quarks and antiquarks that were *not* in excess.
why: In the early universe quarks and antiquarks were nearly equally abundant and annihilated as the temperature fell. The measured $\eta = n_b/n_\gamma = 6.1\times10^{-10}$ says the balance was tilted by about one part in a billion: for every $10^9$ antiquarks there were roughly $10^9+1$ quarks, everything paired annihilated into photons, and **the entire material content of the universe is the leftover.** The CMB photons are in the main the annihilation products, which is why the ratio of baryons to photons is so tiny. The value is measured two independent ways — from the deuterium yield of big bang nucleosynthesis and from the CMB acoustic peak heights — and they agree, which is one of the sharper consistency checks in cosmology. What is missing is the mechanism. Sakharov's three conditions (baryon number violation, C and CP violation, departure from equilibrium) are all present in the Standard Model in principle, but it fails quantitatively on two: its CP violation is about ten orders of magnitude too small, and with the measured Higgs mass the electroweak transition is a crossover rather than first-order, so equilibrium is never adequately broken.
---
q: What is the essential logical weakness in fine-tuning arguments of the form "if constant $X$ were different by $\epsilon$, no observers would exist"?
a: The physical claim is usually wrong — universes with different constants would still support life
x: Some such claims are contested, but many are robust; the weakness is logical rather than physical.
a*: They require a probability measure over possible values of $X$, and without one the word "unlikely" has no defined content
a: They are unfalsifiable, and unfalsifiable claims are meaningless
x: Falsifiability is a poor criterion here — the counterfactual physics is often perfectly calculable. The gap is in the probabilistic step, not the physical one.
a: They commit the anthropic fallacy of reasoning from our own existence
x: Conditioning on one's own existence is a legitimate and sometimes powerful inference; the issue is what it is being conditioned against.
hint: To say an outcome is improbable, what must you have specified beforehand?
why: The argument's structure is: constant $X$ takes value $x_0$; if it were $x_0 \pm \epsilon$ there would be no observers; therefore $x_0$ requires explanation. The final step is where it fails without further input. Calling $x_0$ improbable presupposes a distribution over the values $X$ could have taken, and that requires knowing which constants can vary, over what range, and with what weighting — which is precisely the missing theory. String theory's landscape offers a candidate, but its measure is disputed and its vacuum count is an estimate. This is not a dismissal: Weinberg's 1987 anthropic bound on $\Lambda$ used exactly this reasoning and correctly predicted the observed order of magnitude *before* the measurement, which is a real scientific success. The point is that such arguments are **conditional on an assumption normally left unstated**, and stating it changes how much weight they can bear. The same critique applies to the coincidence problem: without a distribution over epochs at which one might find oneself observing, "why now?" has no quantitative content — though the selection response, that observers require structure and structure formation is switched off by dark energy, does supply a non-trivial answer.
```

## 6. Telling a real anomaly from a fluctuation

Any survey of open questions that omits the base rate is misleading, so here it is.

### 6.1 The track record

**BICEP2 (2014).** A $7\sigma$ detection of primordial gravitational waves in CMB polarisation, announced with considerable confidence. Within a year, Planck's dust maps showed the signal was consistent with polarised Galactic dust. The current limit is $r < 0.036$.

**The 750 GeV diphoton excess (2015).** ATLAS and CMS independently reported an excess at the same mass — apparent independent confirmation, generating over five hundred theory papers within months. It vanished with more data.

**OPERA superluminal neutrinos (2011).** A $6\sigma$ result, traced to a loose fibre-optic connector.

**The dark matter direct-detection signals of the 2000s.** Several claimed detections, mutually inconsistent, none confirmed.

The pattern is not that experimenters are careless. These were careful groups following proper procedure. It is that **at the frontier, unknown systematics are more common than new physics**, and the prior should reflect that.

### 6.2 What distinguishes the survivors

Anomalies that turn out to be real tend to have features the failures lack.

**Independent methods, not just independent teams.** The 750 GeV excess had two experiments but essentially one technique. The Hubble tension has parallaxes, Cepheids, TRGB, Miras, lensing time delays and standard sirens — genuinely different physics.

**Persistence under improved data rather than statistical drift.** Real signals sharpen as errors shrink; fluctuations move around.

**Survival of hostile scrutiny.** The relevant test is not whether proponents defend a result but whether motivated opponents have failed to break it.

**A theoretical cost to accepting it.** Paradoxically, the harder an anomaly is to accommodate, the more meaningful its survival — because easy accommodation lets a wrong result persist unchallenged.

By these criteria the Hubble tension scores well on three of four and poorly on the fourth: no clean theoretical accommodation exists, which cuts both ways. The $S_8$ tension scores moderately. The lithium problem scores poorly on independence, since one measurement type dominates.

### 6.3 What is actually coming

The next decade is unusually well-provisioned, and it is worth knowing which instrument attacks which question.

- **Rubin Observatory (LSST)** — billions of galaxies and millions of supernovae; growth of structure, dark energy, and strong constraints on primordial black holes as dark matter through microlensing.
- **Euclid and the Roman Space Telescope** — the dark energy equation of state to per-cent precision, and the growth rate independently of the expansion rate, which is what separates modified gravity from a dark energy component.
- **DESI** — BAO across a wide redshift range, already producing the hints of evolving dark energy that unsettle the far-future picture.
- **CMB-S4 and the Simons Observatory** — $r$ to $\sim0.003$, which would detect the tensor signal of the simplest large-field inflation models or exclude them.
- **LZ, XENONnT and successors** — WIMP parameter space down to the neutrino fog, after which the search changes character.
- **Hyper-Kamiokande and DUNE** — proton decay by roughly an order of magnitude beyond current limits, and the neutrino mass ordering.
- **Neutrinoless double beta decay experiments** — whether neutrinos are Majorana particles, which is the accessible signature of leptogenesis.
- **LISA and next-generation ground-based detectors** — standard sirens as an independent $H_0$ route, and a stochastic background that could probe phase transitions in the early universe.

**Several of these will return null results.** That is the expected outcome for most searches, it is informative, and it should be planned for rather than treated as disappointment.

```checkpoint
q: Two experiments independently reported an excess at the same mass, which then vanished with more data. What was the flaw in treating the initial agreement as strong confirmation?
a: The two experiments were not truly independent because they shared personnel
x: Personnel overlap is a minor consideration; the deeper problem is methodological, not sociological.
a*: They were independent teams but used essentially the same technique, so a systematic or statistical artefact intrinsic to the method would appear in both
a: Two experiments is too small a number for any statistical conclusion
x: Two genuinely independent confirmations would be strong evidence; the number was not the problem.
a: The significance quoted was below $5\sigma$, so no conclusion was warranted
x: Thresholds are useful shorthand but the failure here was structural — a $5\sigma$ result from a single technique would have been equally vulnerable.
hint: Distinguish independence of teams from independence of methods.
why: The 750 GeV diphoton excess appeared in both ATLAS and CMS, which looked like independent confirmation and generated over five hundred theory papers within months. But both are general-purpose detectors at the same collider searching the same final state by the same technique, so any artefact intrinsic to that technique — an unmodelled background shape, a fluctuation in a wide mass scan subject to the look-elsewhere effect — would show up in both. The excess vanished with more data. **The feature that distinguishes surviving anomalies is independence of *method*, not of team.** By that test the Hubble tension scores well: parallaxes, Cepheids, tip-of-the-red-giant-branch calibrations, Mira variables, gravitational lensing time delays and gravitational-wave standard sirens rest on genuinely different physics, and the discrepancy persists across them. BICEP2 failed the same test differently — it was a single measurement whose critical foreground had not been independently measured at that frequency in that field.
---
q: What is the best reason to expect that most of the experiments listed for the next decade will return null results, and how should that expectation affect planning?
a: The experiments are poorly designed, so failure is likely
x: They are carefully designed; null results are the normal outcome of well-designed searches into unexplored parameter space.
a*: Searches into unexplored parameter space usually exclude rather than detect, and a null result is genuine information — so the case for an experiment should not rest on the assumption that it will detect something
a: Nothing further remains to be discovered in cosmology
x: Several questions here — the equation of state, the mass ordering, proton decay — are live and answerable.
a: Theoretical predictions have been so unreliable that experiment is no longer worthwhile
x: The unreliability of predictions is an argument for more experiment, not less, since it means the parameter space must be searched rather than deduced.
hint: Consider the historical outcome of direct dark-matter searches over the past three decades.
why: Direct detection improved sensitivity by roughly six orders of magnitude and detected nothing, which is the normal shape of a search into unexplored parameter space: most of it is empty, and excluding it is real progress — that programme is the reason the field knows the simplest WIMP models are wrong. The planning consequence is concrete. An experiment justified on the promise of discovery is vulnerable to being judged a failure when it excludes instead, which distorts both funding arguments and public communication; an experiment justified on the information content of either outcome is not. This is why the survey measuring $w$ to a per cent is such a strong proposition — a deviation from $-1$ would be a first-rank discovery and a confirmation would tighten every model in the field and settle whether the Big Rip branch is open — and why the value of the next generation of dark matter detectors should be argued in terms of what reaching the neutrino fog establishes, since below that boundary the standard approach stops working regardless of what is there.
```

{{image: Vera C. Rubin Observatory | A survey telescope designed to image the entire visible sky every few nights, producing a time-domain catalogue of billions of objects. Instruments of this class bear on the open questions in a way single-target observatories cannot: the statistical power comes from sheer numbers, allowing weak lensing measurements of the growth of structure, supernova cosmology at scale, and microlensing constraints that close off primordial black holes across much of the remaining mass range. The design philosophy is worth noting — a survey collects the data before anyone knows which question it will answer, which is the opposite of the targeted-experiment model and has repeatedly proved more productive.}}

## 7. Pulling the thread

- **Sort open questions by what would count as an answer, not by subject.** Missing entities are identifications; measurement discrepancies mean somebody is wrong; missing mechanisms are processes; and some questions presuppose a measure nobody has.
- **Dark matter's existence is not open; its identity is.** Eighty orders of magnitude of candidate mass remain after six orders of magnitude of improved sensitivity found nothing, and the neutrino fog now limits how much further the standard approach can go.
- **The cosmological constant problem is a factor of $10^{123}$** and has no accepted solution. A value of exactly zero would be *easier* to explain than a value this small and non-zero.
- **The Hubble tension is the best anomaly available** — $4.8\sigma$, multiple independent methods, a decade of hostile scrutiny — and is still probably a systematic, because that is what usually happens and because no physical solution is clean.
- **Everything material is a one-part-per-billion residue.** $\eta = 6.1\times10^{-10}$, measured twice independently, and the Standard Model fails to produce it by about ten orders of magnitude in CP violation.
- **Inflation does not obviously solve the entropy problem**, since it needs special initial conditions of its own, and whether those are less special than what they explain remains unresolved after forty years.
- **Most anomalies die.** BICEP2, the 750 GeV excess, OPERA — careful groups, proper procedure, wrong results. Independent *methods* rather than independent teams is the feature that distinguishes survivors.

The transferable idea: **the value of an open question depends far more on whether an answer would be recognisable than on how important it sounds.** "What is dark matter?" and "why is $\Lambda$ so small?" are both enormous questions, but the first has a clear success condition — a particle detected in more than one experiment, with properties matching the cosmological requirement — and the second may not have one at all, since a landscape-plus-anthropics explanation would leave nothing further to measure. Choosing what to work on by importance alone reliably produces careers spent on questions that cannot be closed. **The better filter is to ask what the evidence for a solution would look like, and to check that it is something one could actually go and collect.** That filter is why the neutrino mass ordering, proton decay and the dark energy equation of state are better bets than the coincidence problem, despite sounding smaller.

## 8. Further reading

{{book: Steven Weinberg | Cosmology | 2008}}

{{book: Lisa Randall | Dark Matter and the Dinosaurs | 2015}}

{{book: Sabine Hossenfelder | Lost in Math | 2018}}

Beyond the books: Weinberg's own 1989 review "The Cosmological Constant Problem" remains the clearest statement of that problem and of why the obvious escapes fail. Hossenfelder's book is a sustained argument that theoretical physics has over-weighted aesthetic criteria, and whether or not one accepts the thesis it is a useful corrective when reading claims about which candidates are "natural". On the Hubble tension, the review literature turns over quickly and the best current source is whichever review is most recent; on the anomaly base rate, the histories of BICEP2 and the 750 GeV excess are documented in detail and worth reading as case studies rather than as anecdotes.

## Problems

*Useful numbers: $H_0$ (CMB) $= 67.36\pm0.54$, $H_0$ (ladder) $= 73.04\pm1.04\ \mathrm{km\,s^{-1}Mpc^{-1}}$; $S_8 = 0.830\pm0.013$ vs $0.776\pm0.017$; $\rho_\Lambda = 5.92\times10^{-27}\ \mathrm{kg\,m^{-3}}$, $\rho_{\rm Planck} = 5.15\times10^{96}\ \mathrm{kg\,m^{-3}}$; $\eta = 6.1\times10^{-10}$; $\sum m_\nu < 0.12$ eV, minima $0.059$ eV (normal) and $0.100$ eV (inverted); $^7\mathrm{Li/H}$ predicted $(4.7$–$5.2)\times10^{-10}$, observed $(1.6$–$2.0)\times10^{-10}$; $r < 0.036$; direct detection limits $\sim10^{-48}\ \mathrm{cm^2}$.*

**1.** *(Taxonomy.)* Classify each of the following by type and justify: the identity of dark matter; the Hubble tension; the baryon asymmetry; why $\Lambda$ has the value it does.

**2.** *(The constant.)* **(a)** Compute the ratio $\rho_{\rm Planck}/\rho_\Lambda$ and express it as a power of ten. **(b)** Explain why a measured value of exactly zero would be easier to explain. **(c)** Give the three qualifications that make the naive estimate less damning than it first appears.

**3.** *(Significance.)* **(a)** Compute the significance of the Hubble discrepancy from the quoted values. **(b)** Compute it for $S_8$. **(c)** Explain why a $4.8\sigma$ discrepancy between two analyses is weaker evidence than a $4.8\sigma$ excess in a single controlled experiment.

**4.** *(The residue.)* **(a)** State what $\eta = 6.1\times10^{-10}$ implies about the quark–antiquark balance. **(b)** Name Sakharov's three conditions. **(c)** State which two the Standard Model fails quantitatively and by roughly how much.

**5.** *(Neutrinos.)* **(a)** Give the minimum mass sums for both orderings. **(b)** Given the cosmological bound of $0.12$ eV, state which ordering is under pressure. **(c)** Explain why this is a striking case of cosmology constraining particle physics, and state the caveat.

**6.** *(Lithium.)* **(a)** Compute the discrepancy factor. **(b)** Explain why the success of BBN for deuterium and helium makes a framework-level error unlikely. **(c)** Name the leading explanation and say why it is hard to confirm.

**7.** *(Base rates.)* For BICEP2, the 750 GeV diphoton excess, and OPERA: state the claimed significance, the eventual explanation, and what feature of each should have prompted caution at the time.

**8.** *(Distinguishing survivors.)* **(a)** Give the four features that distinguish surviving anomalies. **(b)** Score the Hubble tension against each. **(c)** State why "a theoretical cost to accepting it" cuts both ways.

**9.** *(Choosing.)* You must allocate a large budget to one of: a next-generation direct detection experiment; a survey measuring $w$ to $1\%$; a proton decay detector; or a theoretical programme on the cosmological constant. Argue for one using the chapter's criterion of recognisable success conditions, and state what you are giving up.

## Worked answers

**1.** *Dark matter's identity* — **Type 1**, a missing entity: existence is established by several independent gravitational probes, and the answer would be an identification recognisable by detection in more than one experiment. *Hubble tension* — **Type 2**, a measurement discrepancy: at least one side is wrong, and the resolution is either a systematic or physics making the two measure different things. *Baryon asymmetry* — **Type 3**, a missing mechanism: the outcome is measured precisely and the process that produced it is unknown; the answer is a mechanism with testable side effects such as neutrinoless double beta decay. *The value of $\Lambda$* — **Type 5**, potentially malformed: asking why it takes this value presupposes a distribution over values it could have taken, which nobody has.

**2.** **(a)** $5.15\times10^{96}/5.92\times10^{-27} = 8.7\times10^{122} \approx 10^{123}$. **(b)** Because symmetries naturally enforce exact zeros — a symmetry forbidding a vacuum energy term would give zero exactly — whereas nothing naturally produces a value $123$ orders of magnitude below its natural scale but not zero. **(c)** The naive sum is a dimensional estimate in an effective field theory not expected to be valid at the Planck scale; unbroken supersymmetry would cancel bosonic against fermionic contributions, reducing the discrepancy to $\sim10^{55}$ for TeV-scale breaking; and only the total gravitates, so a bare term could cancel the vacuum contribution — though to $123$ decimal places.

**3.** **(a)** $(73.04-67.36)/\sqrt{1.04^2+0.54^2} = 5.68/1.17 = 4.8\sigma$. **(b)** $(0.830-0.776)/\sqrt{0.013^2+0.017^2} = 0.054/0.021 = 2.5\sigma$. **(c)** A controlled experiment's quoted error is dominated by statistics whose behaviour is understood, and the systematic budget is constructed against a known apparatus. A discrepancy between two multi-stage analyses depends on both error budgets being complete, and the systematics in question are exactly the thing under dispute — so the quoted $\sigma$ is conditional on an assumption the anomaly itself calls into question.

**4.** **(a)** Roughly $10^9+1$ quarks per $10^9$ antiquarks in the early universe; everything paired annihilated, and all material content is the residue, with the CMB photons largely the annihilation products. **(b)** Baryon number violation; C and CP violation; departure from thermal equilibrium. **(c)** CP violation, too small by about ten orders of magnitude; and departure from equilibrium, since with the measured Higgs mass the electroweak transition is a smooth crossover rather than first-order.

**5.** **(a)** Normal ordering $\ge0.059$ eV; inverted $\ge0.100$ eV. **(b)** Inverted ordering, since the cosmological bound of $0.12$ eV leaves it barely room and modest improvement would exclude it. **(c)** Oscillation experiments measure mass-squared differences and cannot reach the absolute scale, whereas cosmology can because massive neutrinos free-stream and suppress small-scale structure in proportion to mass — so the distribution of galaxies determines a laboratory particle property. The caveat is model dependence: the bound is derived within $\Lambda$CDM, and an extension that alters growth would relax it, so an exclusion claimed this way needs the assumed model stated.

**6.** **(a)** Taking central values, $\approx4.9/1.8 = 2.7$, with the range $2.4$–$3.2$. **(b)** BBN has a single free parameter, fixed independently by the CMB; deuterium and helium-4 both come out right to about a per cent, which a framework error would not permit. The failure is localised to one isotope, which points to something isotope-specific. **(c)** Stellar depletion — lithium burns at modest temperatures, so the observed surface abundance may not be the birth abundance, with rotational mixing the favoured transport mechanism. It is hard to confirm because it requires modelling mixing over billions of years in stars whose interiors are not directly observable, and the predicted depletion must be uniform enough to reproduce the observed flatness of lithium abundance across metal-poor stars.

**7.** *BICEP2:* claimed $\sim7\sigma$ for primordial gravitational waves; explained by polarised Galactic dust; caution was warranted because the dust foreground had not been measured at that frequency in that field and the analysis relied on an extrapolated model. *750 GeV diphoton:* $\sim3$–$4\sigma$ in each of two experiments; a statistical fluctuation; caution was warranted because two experiments using essentially the same technique are not independent methods, and because the look-elsewhere effect across a wide mass scan was substantial. *OPERA:* $6\sigma$ superluminal neutrinos; a loose fibre-optic connector; caution was warranted because the result contradicted a body of evidence far stronger than a single timing measurement, including the neutrino arrival times from SN 1987A.

**8.** **(a)** Independent *methods* rather than merely independent teams; persistence and sharpening as errors shrink; survival of hostile scrutiny; and a theoretical cost to accepting it. **(b)** *Independence:* strong — parallaxes, Cepheids, TRGB, Miras, lensing time delays and sirens are genuinely different physics. *Persistence:* strong — it has grown rather than drifted over a decade. *Hostile scrutiny:* strong — motivated opponents on both sides have tried and failed to dissolve it. *Theoretical cost:* high, and no clean accommodation exists. **(c)** High cost means no one can quietly absorb the result, so it stays under attack and its survival means more; but it also means that if the anomaly is real, the required new physics is contrived, which is itself evidence against it being real.

**9.** A defensible answer, with the reasoning explicit: **the survey measuring $w$ to $1\%$.** Its success condition is recognisable and guaranteed to be informative either way — a deviation from $w=-1$ would be a discovery of the first rank, while confirming $w=-1$ to a per cent tightens every model in the field and settles whether the Big Rip branch of the far future is open. Direct detection and proton decay have clean success conditions too but a high probability of returning limits rather than detections, which is informative but incremental. The theoretical programme on $\Lambda$ has no recognisable success condition at all — a landscape-plus-anthropics resolution would leave nothing further to measure — which by the chapter's criterion makes it the weakest use of a large budget however important the question. What is given up is the chance of a discovery that would restructure particle physics, which the direct detection and proton decay options offer and the survey does not; that is a real cost and should be stated rather than argued away.$duOpen_master$,
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
