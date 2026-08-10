-- Astronomy & Space · The Expanding Universe — The Big Bang — "The Early Universe".
-- Curated master for
-- astronomy-and-space/expanding-universe/big-bang/early-universe
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Opens The Big Bang block. Organised around freeze-out as the single
-- mechanism that turns a hot equilibrium into a set of fossils, and
-- around an honest accounting of where laboratory-tested physics stops
-- and extrapolation begins. The temperature-time relation T ~ t^-1/2
-- with its coefficient; the confidence boundary at ~10^-14 s, above
-- which collider energies reach and below which the gap to the GUT
-- scale is twelve orders of magnitude; Gamma vs H as the freeze-out
-- criterion; neutrino decoupling at 1 s and the (4/11)^(1/3) offset
-- giving a 1.95 K neutrino background; the baryon asymmetry at
-- eta = 6.1e-10, the Sakharov conditions, and why the Standard Model
-- fails to produce it by ten orders of magnitude; and the relic
-- inventory as the chapter's payoff. Also the correction that the initial
-- singularity is a statement about classical GR past its domain rather
-- than about the universe, and the distinction between the Big Bang
-- model and the Big Bang singularity.
-- ~10,000 words, multi-question checkpoints throughout.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/expanding-universe/big-bang/early-universe',
    'research',
    'advanced',
    'read',
    $bbEarly_master$> The early universe is the only particle accelerator that has ever operated above a few TeV, and it ran once, 13.8 billion years ago, leaving its results scattered across the sky as **relics**. Reading them is the whole of early-universe cosmology. But the reading has a boundary: some of what follows is physics tested in laboratories, and some is extrapolation across twelve orders of magnitude in energy. **Knowing which is which is the most important thing this chapter has to offer.**

The Expansion block ran the universe backwards in scale. Run it backwards in *temperature* instead and something different appears. A universe that was smaller was also hotter and denser, and at sufficient temperature matter does not merely compress — it changes state, repeatedly, through a sequence of transitions each of which leaves a residue. Those residues are the evidence.

## One equation runs the whole epoch

For the first fifty thousand years the universe was **radiation-dominated**: relativistic particles — photons, neutrinos, and at early times electrons, positrons, quarks and gluons — carried essentially all the energy. That single fact fixes the expansion history, and it does so with unusual simplicity.

In a radiation-dominated universe the scale factor grows as $a \propto t^{1/2}$, and since radiation redshifts as $T \propto 1/a$, temperature falls as

$$T \propto t^{-1/2}.$$

The coefficient depends on how many relativistic species are around, through the effective degree-of-freedom count $g_*$. The standard result is

$$\frac{t}{1\ \mathrm{s}} \approx \frac{2.42}{\sqrt{g_*}\,(T/1\ \mathrm{MeV})^{2}}.$$

That is the entire timekeeping apparatus of the early universe. Give it a temperature and it returns a time; give it a time and it returns a temperature. With $g_* = 10.75$ — the value just before electron–positron annihilation — one second corresponds to $T = 0.86$ MeV, or about $10^{10}$ K. This is the origin of the textbook slogan **"one MeV at one second"**, and it is worth committing to memory because it anchors everything else.

Note what the formula does *not* need. It does not need to know what the matter is made of, only that it is relativistic; it does not need the density, only the temperature; it does not need any input from astronomy. **The early universe is thermodynamically simple in a way no later epoch is**, because it was hot enough to be in equilibrium and dense enough to stay there. Complexity — galaxies, stars, chemistry — is a late development. The first minutes are the easiest part of cosmic history to calculate and, not coincidentally, the part with the cleanest predictions.

Convert energies to temperatures with $1\ \mathrm{MeV} = 1.16\times10^{10}$ K, and the sequence of epochs falls out:

| Event | Temperature | Time |
| --- | --- | --- |
| Planck scale | $1.4\times10^{32}$ K ($1.2\times10^{19}$ GeV) | $5.4\times10^{-44}$ s |
| Grand unification (hypothesised) | $\sim10^{29}$ K ($10^{16}$ GeV) | $\sim10^{-39}$ s |
| Inflation (hypothesised) | — | $\sim10^{-36}$ to $10^{-32}$ s |
| Electroweak transition | $\sim10^{15}$ K (100 GeV) | $2\times10^{-11}$ s |
| Quark–hadron transition | $1.7\times10^{12}$ K (150 MeV) | $1.5\times10^{-5}$ s |
| Neutrino decoupling | $1.2\times10^{10}$ K (1 MeV) | $\sim1$ s |
| Electron–positron annihilation | $6\times10^{9}$ K (0.5 MeV) | $\sim3$ s |
| Nucleosynthesis | $8\times10^{8}$ K (0.07 MeV) | $\sim270$ s |
| Matter–radiation equality | $9{,}300$ K (0.80 eV) | $\sim50{,}000$ yr |

```checkpoint
q: The relation $t \approx 2.42/(\sqrt{g_*}\,(T/\mathrm{MeV})^2)$ seconds requires remarkably little input. What makes the early universe calculable in this way?
a: The physics of the era is simpler because the fundamental forces were unified
x: Unification is hypothesised at energies far above this regime and plays no part in the relation, which holds throughout the radiation era with ordinary Standard Model physics.
a*: The universe was radiation-dominated and in thermal equilibrium, so its expansion depends only on temperature and the count of relativistic species — not on composition, structure or any astronomical input
a: The uncertainties are large enough that a simple formula suffices
x: Nucleosynthesis predictions from this relation match observation at the per-cent level; the simplicity is real, not a tolerance for error.
a: Because general relativity reduces to Newtonian gravity at high density
x: The relation follows from the relativistic Friedmann equation in the radiation era; a Newtonian treatment does not give it.
hint: Ask what quantities appear in the formula, and what conspicuously does not.
why: Radiation domination fixes $a \propto t^{1/2}$, and $T \propto 1/a$ then gives $T \propto t^{-1/2}$. Thermal equilibrium means the energy density is set entirely by the temperature and the number of relativistic species, folded into $g_*$. Nothing else enters — not the composition of matter, not the density independently of $T$, not any observation of galaxies or stars. That is why the first minutes are the most precisely calculable stretch of cosmic history, despite being the least directly observable. Complexity is a late arrival; the early universe is a thermodynamics problem, and a comparatively easy one.
```

## Where confidence ends

Before running through the epochs, it is worth marking the boundary honestly, because popular accounts routinely present the first $10^{-35}$ second with the same confidence as the first minute, and the evidential situation is not remotely comparable.

**Collider energies reach a few TeV.** The LHC's proton–proton collisions at 13.6 TeV probe interactions at effective energies of order a few TeV, corresponding to cosmic conditions at roughly $10^{-14}$ s. Everything from about $10^{-14}$ s onward therefore involves particles and interactions that have been produced and measured directly. The electroweak transition at 100 GeV sits comfortably inside this range: the Higgs mechanism is not a cosmological hypothesis but a laboratory fact.

**Above a few TeV, nothing has been tested.** The grand-unification scale, where the three gauge couplings are conjectured to meet, is around $10^{16}$ GeV — **twelve orders of magnitude** beyond collider reach. Inflation, if it occurred, operated somewhere in that unexplored range. The Planck scale at $10^{19}$ GeV is further still, and there quantum gravity is required and does not exist in tested form.

So the honest division is:

- **$t > 1$ s**: directly constrained by surviving relics — light-element abundances, the CMB, the neutrino background's gravitational imprint. This is the observationally secured regime.
- **$10^{-14}\ \mathrm{s} < t < 1$ s**: governed by physics measured at accelerators, applied to a cosmological setting. Confident extrapolation.
- **$t < 10^{-14}$ s**: extrapolation beyond any tested energy. Motivated, sometimes strongly, but not established.

This is not a counsel of despair — the pre-collider epochs have real indirect evidence, and the Inflation chapter will present it. It is a request to keep the categories separate. **Nucleosynthesis at 200 seconds and inflation at $10^{-34}$ seconds are both "early universe", and their evidential standing differs by an enormous margin.**

```checkpoint
q: Why is the electroweak transition at $10^{-11}$ s on much firmer footing than grand unification at $10^{-39}$ s?
a: Because it happened later, and later events leave more surviving evidence
x: Lateness helps in general, but the decisive point here is different — and the electroweak transition left no direct relic either.
a*: Because the electroweak scale of ~100 GeV is well within collider reach, so the physics has been produced and measured directly, whereas grand unification sits twelve orders of magnitude beyond any tested energy
a: Because grand unification is speculative, whereas the electroweak transition is predicted by inflation
x: Inflation does not predict the electroweak transition; the two are unrelated, and inflation is itself in the untested range.
a: Because the electroweak transition can be observed in the cosmic microwave background
x: The CMB comes from 380,000 years and carries no direct signature of the electroweak epoch.
hint: Ask what energy each corresponds to, and what the largest accelerator has reached.
why: The electroweak scale is about 100 GeV; the LHC operates at 13.6 TeV, so W and Z bosons and the Higgs have been produced, measured and studied in the laboratory. Applying that physics to a hot early universe is extrapolation only in setting, not in the underlying physics. Grand unification is conjectured at ~$10^{16}$ GeV, a factor of $10^{12}$ above collider reach, with no direct evidence that the couplings meet at all. Both epochs are called "the early universe", but they sit on opposite sides of the boundary between measured and assumed — and popular accounts that present them with equal confidence are misrepresenting the situation.
```

{{image: Chronology of the universe | The sequence of epochs from the Planck scale to the present, laid out logarithmically in time. The compression is severe: the interval from $10^{-43}$ to $10^{-11}$ seconds occupies as much of the logarithmic axis as everything since, and only the right-hand portion corresponds to energies reachable in laboratories. Each labelled transition marks a point where the universe cooled through a threshold and left a residue behind.}}

## The singularity is not a prediction

One correction belongs here, before the physics resumes, because it is the most widely repeated error about the Big Bang and it follows directly from the confidence boundary just drawn.

Extrapolate the Friedmann equations backwards and the scale factor reaches zero at a finite time, with density and temperature diverging. The Hawking–Penrose singularity theorems make this general: under classical general relativity, with matter satisfying reasonable energy conditions, an expanding universe must have a past singularity. It is a theorem, and it is correct.

**It is also not a statement about the universe.** It is a statement about general relativity, and specifically about what general relativity says when extrapolated into a regime where it is known to fail.

The failure point is the Planck scale — $10^{19}$ GeV, $10^{-43}$ s, a density of $5\times10^{96}$ kg m⁻³, some $10^{79}$ times nuclear density. There, the quantum corrections to gravity are not small. General relativity is a classical theory and contains no account of its own quantum behaviour; using it at Planck density is like using the ideal gas law to describe a neutron star. **The theorems' conclusion is therefore conditional on a premise that is known to be false in exactly the regime where the conclusion bites.**

So the honest formulation is: *the classical description breaks down at $t \sim 10^{-43}$ s, and what happened at or before that time is unknown.* Not "the universe began as a point of infinite density" — that sentence reports a mathematical artefact as a physical event. Candidate quantum-gravity treatments give varying answers: loop quantum cosmology replaces the singularity with a bounce; some string-theoretic pictures have a minimum length; others have no notion of "before" at all because time itself is emergent. **None is established, and the honest position is that the question is open rather than answered in the affirmative.**

This matters beyond pedantry, because the phrase "the Big Bang" is used for two quite different things. **The Big Bang *model*** — a hot, dense early state expanding and cooling through the sequence tabulated above — is among the best-supported theories in science, resting on the CMB, light-element abundances, and the redshift–distance relation. **The Big Bang *singularity*** — an initial moment of infinite density — is an extrapolation of a theory past its domain of validity. The first is established; the second is not even well-formed. Popular objections of the form "what caused the Big Bang?" or "what came before?" are almost always aimed at the second while being answered as though they concerned the first.

```checkpoint
q: The Hawking–Penrose theorems prove that an expanding universe must have a past singularity. What does this establish about the actual universe?
a: That the universe began at a point of infinite density a finite time ago
x: This is the standard misreading. The theorem's conclusion holds within classical general relativity, which is known to fail long before such densities are reached.
a*: Nothing directly — the theorems assume classical general relativity, which is known to break down at the Planck scale, so they show where the theory fails rather than what the universe did
a: That general relativity is wrong, since infinite densities are unphysical
x: General relativity is not wrong within its domain; it is incomplete, lacking a quantum description. Predicting its own breakdown is a limitation, not a refutation.
a: That quantum gravity must produce a bounce rather than a singularity
x: A bounce is one candidate — loop quantum cosmology gives one — but nothing establishes it, and other approaches differ.
hint: A theorem's conclusion is only as good as its premises. What does this one assume?
why: The theorems are correct: under classical general relativity with matter satisfying standard energy conditions, an expanding universe has a past singularity. But classical general relativity is known to be inadequate at the Planck scale — $10^{-43}$ s, $10^{19}$ GeV, a density of $5\times10^{96}$ kg m⁻³, roughly $10^{79}$ times nuclear density — where quantum corrections to gravity cannot be neglected. So the theorem tells us where the theory stops working, not what happened. The distinction matters because "the Big Bang" names two different things: the hot dense early state and its subsequent cooling, which is superbly supported, and an initial singularity, which is an extrapolation past a known breakdown. Objections about "what came before" target the second while being answered as though about the first.
---
q: Why is it fair to describe the Big Bang model as among the best-supported theories in science while treating the initial singularity as not established?
a: Because the model is a description of observations, whereas the singularity is a theoretical claim, and theory is always weaker than observation
x: Theory and observation are not ranked this way — the model itself is thoroughly theoretical, and much of its support is theoretical prediction matching measurement.
a*: Because the model's claims about the hot dense phase are tested by surviving relics — the CMB, light-element abundances, the redshift–distance relation — while the singularity is an extrapolation into a regime with no tests and a known theoretical breakdown
a: Because the singularity occurs before inflation, and inflation erases all prior information
x: Inflation would indeed erase much prior information, but that is not why the singularity is unestablished; the reason is the failure of classical general relativity at Planck density.
a: Because the singularity is a philosophical rather than physical question
x: It is a physical question about what a quantum theory of gravity implies — currently unanswered, but not outside physics.
hint: Ask which parts of the claim have surviving evidence and which do not.
why: The Big Bang model asserts that the universe passed through a hot, dense state and cooled through a definite sequence of epochs. That assertion makes checkable predictions — a blackbody relic at a few kelvin, about 25% helium by mass, a specific deuterium abundance, a redshift–distance relation — and all are confirmed, several to per-cent precision. The initial singularity asserts something about $t \to 0$, where no relic survives, no experiment reaches, and the governing theory is known to be inapplicable. Same name, entirely different evidential standing. Keeping them apart is what allows one to say the Big Bang is established while the beginning of the universe is an open question, without contradiction.
```

## Freeze-out: the mechanism behind every relic

Here is the single idea that organises the entire chapter, and much of the two that follow.

A reaction keeps a species in equilibrium only if it happens fast enough. The criterion is a comparison of two rates:

- $\Gamma = n\sigma v$, the **interaction rate** per particle — density times cross-section times relative velocity.
- $H$, the **expansion rate**, which is the rate at which the density and temperature are being pulled down.

While $\Gamma \gg H$, particles interact many times per expansion time and equilibrium holds: abundances track their thermal values, and the past is continuously erased. When the universe expands and cools, $\Gamma$ falls — usually much faster than $H$, since $n$ drops as $a^{-3}$ and cross-sections typically fall with energy too. At the moment $\Gamma \approx H$, interactions cease to keep up. **The species decouples, and whatever abundance it had at that instant is frozen in and carried forward, diluted by expansion but otherwise unchanged.**

This is **freeze-out**, and it is the most productive single concept in early-universe cosmology, for a reason worth stating plainly: *equilibrium destroys information, and freeze-out preserves it.* A system in equilibrium remembers nothing but its temperature. The instant equilibrium fails, the current state is fossilised. **Every relic we possess exists because some reaction lost the race against expansion**, and the abundance of that relic encodes the conditions at the moment it lost.

The pattern recurs at every scale in this block:

- **Neutrinos** freeze out at 1 s, giving the cosmic neutrino background.
- **Neutrons** freeze out of chemical equilibrium with protons at about 0.8 MeV, fixing the neutron-to-proton ratio and hence the helium abundance — the subject of the next chapter.
- **Electrons and protons** freeze out of recombination at 380,000 years, releasing the CMB — the subject of the chapter after that.
- **Dark matter**, if it is a thermal relic, froze out at some earlier point, and its present abundance is a direct readout of its annihilation cross-section.

Four of the most important observables in cosmology, one mechanism. **When you meet a cosmic abundance that seems arbitrarily specific — a quarter of the mass in helium, 411 photons per cubic centimetre, one baryon per 1.6 billion photons — the question to ask is always: what froze out, and when?**

```checkpoint
q: What determines the moment a species freezes out?
a: When its temperature falls below its rest mass, so that it can no longer be produced
x: That threshold matters for some species and drives their abundance downward, but freeze-out is defined by the rate comparison and can occur while a particle is still relativistic — as neutrinos do.
a*: When its interaction rate $\Gamma = n\sigma v$ falls below the expansion rate $H$, so that reactions can no longer keep pace with the dilution of the universe
a: When the density falls low enough that the mean free path exceeds the size of the observable universe
x: Decoupling occurs far earlier than that; the criterion is one interaction per expansion time, not one per horizon crossing.
a: When the species stops being in thermal contact with photons specifically
x: Photons are not privileged — what matters is whether *any* reaction keeps the species tracking equilibrium.
hint: Two rates are being compared. What is the second one?
why: Equilibrium is maintained when a particle interacts many times per expansion time, i.e. $\Gamma \gg H$. As the universe expands, $n$ falls as $a^{-3}$ and $\Gamma$ typically drops much faster than $H$, so the two curves cross. At that crossing the species decouples and its abundance freezes at whatever value equilibrium had just set. The point generalises: equilibrium erases history, so a system that remains in equilibrium tells you only its present temperature. Freeze-out is what converts a thermal state into a permanent record — which is why nearly every cosmological relic, from the helium abundance to the CMB itself, exists because a reaction lost its race against the expansion.
---
q: Why does freeze-out make a relic abundance informative, when a species in full equilibrium is not?
a: Because equilibrium abundances are too small to detect, while frozen-out ones are large
x: Equilibrium abundances can be enormous — photons are in equilibrium down to recombination and are the most abundant particles in the universe.
a*: Because a system in equilibrium is fully specified by its present temperature and retains no memory, whereas freeze-out fossilises the conditions at the instant equilibrium failed
a: Because frozen-out species stop redshifting and so preserve their original energies
x: Decoupled species continue to redshift; the neutrino background has cooled from ~$10^{10}$ K to 1.95 K. What is preserved is the abundance, not the energy.
a: Because freeze-out only affects particles that do not interact, which are easier to model
x: Every species that freezes out was interacting strongly beforehand — that is precisely what maintained equilibrium.
hint: Ask what an equilibrium distribution depends on, and how many numbers it takes to specify.
why: A thermal distribution is characterised by temperature alone (plus chemical potentials, usually negligible here). Whatever the history, equilibrium returns the system to the same state, so it carries no record. Freeze-out breaks that: at the moment $\Gamma$ drops below $H$ the abundance stops tracking equilibrium and is carried forward unchanged apart from dilution. The frozen value therefore encodes the temperature, density and interaction strength at that instant. This is why the helium abundance tells us about conditions at one second, why the CMB's spectrum tells us about 380,000 years, and why a measured dark-matter density would translate directly into an annihilation cross-section — each is a photograph taken at the moment a reaction failed.
```

## Neutrinos: the oldest relic

Neutrinos illustrate the mechanism cleanly, and their decoupling has a consequence that is both precisely predicted and — remarkably — indirectly confirmed.

Neutrinos are kept in equilibrium by weak interactions, whose cross-section grows steeply with energy: $\sigma \propto G_F^2 T^2$. Combined with $n \propto T^3$ this gives $\Gamma \propto T^5$, while in the radiation era $H \propto T^2$. The ratio therefore falls as $\Gamma/H \propto T^3$ — an extremely steep dependence, meaning decoupling is **sharp**. Neutrinos go from thoroughly coupled to entirely free over a short interval around $T \approx 1$ MeV, at about **one second**.

From that moment neutrinos travel freely. They have been doing so for 13.8 billion years, which makes the **cosmic neutrino background the oldest relic in existence** — a snapshot from one second, against the CMB's 380,000 years.

Now the consequence. Shortly after neutrinos decouple, the temperature falls below the electron mass and **electron–positron pairs annihilate**, since they can no longer be replenished. Their energy is dumped into the photon bath — but *not* into the neutrino bath, which has already decoupled and is no longer listening. **The photons are reheated relative to the neutrinos.**

Entropy conservation fixes the size of the effect exactly:

$$\frac{T_\nu}{T_\gamma} = \left(\frac{4}{11}\right)^{1/3} = 0.7138.$$

With the CMB at $T_\gamma = 2.7255$ K, the neutrino background today is at

$$T_\nu = 1.95\ \mathrm{K},$$

with a number density of $\tfrac{3}{11}n_\gamma$ per species, or **336 neutrinos per cubic centimetre** summed over three flavours. Some $10^{14}$ of them pass through you each second.

**No one has detected them directly, and it is not clear anyone will.** At 1.95 K their energies are of order $10^{-4}$ eV, and weak cross-sections at such energies are catastrophically small. The PTOLEMY concept — capture on tritium, exploiting the absence of an energy threshold for neutrino capture — is the most developed proposal and remains extraordinarily difficult.

Yet the prediction is confirmed, by a route that repays attention. **Free-streaming neutrinos affect the expansion rate and the growth of perturbations**, so their energy density is imprinted on the CMB's acoustic peaks and on large-scale structure. The measured effective number of relativistic species is

$$N_{\rm eff} = 2.99 \pm 0.17,$$

against a theoretical prediction of **3.044** — the small excess over 3 arising because neutrino decoupling is not quite instantaneous, so a little of the annihilation energy does leak into the neutrino bath. Agreement at this level confirms both that three neutrino species were present at one second and that the $(4/11)^{1/3}$ reheating occurred as calculated.

**This is an object lesson in what counts as detection.** The cosmic neutrino background has never been directly observed, and its temperature has never been measured with a thermometer. But its gravitational effect on a system 380,000 years younger is measured to 6%, and that effect is sensitive to exactly the quantity in question. The inference is not weaker than a direct detection would be — it is differently structured, and the systematics are better understood than a first-generation direct detection's would be. **Insisting on direct detection as the only real evidence would here mean discarding the better measurement in favour of the worse one.**

```checkpoint
q: Why is the cosmic neutrino background colder than the CMB by a factor of $(4/11)^{1/3}$?
a: Because neutrinos have mass and therefore lose energy faster as the universe expands
x: Neutrino masses are far too small to matter at decoupling, and massive particles do not cool faster than radiation in the relevant sense. The offset arises before any mass effect.
a*: Because neutrinos decoupled at ~1 s, and shortly afterwards electron–positron annihilation dumped its energy into the photon bath alone — reheating the photons relative to the already-decoupled neutrinos
a: Because neutrinos decoupled later than photons, so they have been redshifting for longer
x: Neutrinos decoupled far *earlier* — at one second, against 380,000 years for photons — and both have redshifted by the same factor since.
a: Because neutrinos escape from gravitational potential wells, losing energy in the process
x: The offset is fixed at a few seconds, long before any structure exists to climb out of.
hint: Something happened to the photons after the neutrinos stopped listening.
why: Neutrinos decouple at $T \approx 1$ MeV, around one second. Very shortly after, the temperature falls below the electron mass and $e^+e^-$ pairs annihilate, unable to be replenished. Their energy goes into the photon bath, which is still coupled, and not into the neutrino bath, which is not. Entropy conservation makes the resulting offset exact: $T_\nu/T_\gamma = (4/11)^{1/3} = 0.7138$. With the CMB at 2.7255 K this puts the neutrino background at 1.95 K, with 336 neutrinos per cubic centimetre across three flavours. The prediction is confirmed indirectly through $N_{\rm eff} = 2.99 \pm 0.17$ against a theoretical 3.044, measured from the CMB acoustic peaks — the small excess over 3 being the leakage from decoupling not quite finishing before annihilation began.
---
q: The cosmic neutrino background has never been directly detected. What is the status of the evidence for it?
a: It remains a prediction without observational support, and will until a direct detection is achieved
x: This treats direct detection as the only admissible evidence, which would discard a well-understood 6% measurement in favour of a hypothetical one with worse systematics.
a*: It is confirmed indirectly and rather precisely: free-streaming neutrinos alter the expansion rate and perturbation growth, imprinting themselves on the CMB acoustic peaks and giving $N_{\rm eff} = 2.99 \pm 0.17$ against a predicted 3.044
a: It is confirmed by solar and atmospheric neutrino experiments, which detect the same population
x: Those experiments detect neutrinos from the Sun and cosmic-ray showers at MeV–GeV energies; relic neutrinos at $10^{-4}$ eV are many orders of magnitude below their thresholds.
a: It is inferred from the helium abundance alone, which counts neutrino species
x: Nucleosynthesis does constrain the species count and is genuine supporting evidence, but the tightest constraint comes from the CMB, and the question of the background's existence is settled by more than one line.
hint: A particle that never interacts still has energy, and energy gravitates.
why: Relic neutrinos at 1.95 K carry ~$10^{-4}$ eV, and weak cross-sections at those energies are so small that direct capture — PTOLEMY's tritium proposal being the leading attempt — is at the edge of conceivability. But detection is not the only route to knowledge. Free-streaming neutrinos contribute to the radiation density, changing the expansion rate at recombination and damping the growth of perturbations, both of which shift the CMB acoustic peaks measurably. The inferred $N_{\rm eff} = 2.99 \pm 0.17$ matches the predicted 3.044, simultaneously confirming three species at one second and the $(4/11)^{1/3}$ reheating. The lesson generalises: what makes evidence strong is that the observable is sensitive to the quantity and the systematics are understood — not whether the particle landed in a detector.
```

## The quark–hadron transition

Running backwards past a microsecond, the universe reaches temperatures where protons and neutrons do not exist as such.

Above about 150 MeV — $1.7\times10^{12}$ K, reached at $1.5\times10^{-5}$ s — quarks and gluons are not confined into hadrons but form a **quark–gluon plasma**. Below it, confinement sets in and quarks bind into the baryons and mesons of ordinary matter.

This transition is unusual among early-universe events in being **reproducible**. Heavy-ion collisions at RHIC and the LHC create droplets of quark–gluon plasma lasting some $10^{-23}$ s, and their behaviour has been studied in detail. The headline finding was a surprise: the plasma behaves not as a dilute gas of free quarks, as asymptotic freedom naively suggests, but as **a nearly perfect fluid**, with a viscosity-to-entropy ratio close to the conjectured lower bound. The strong interaction remains strong even where it was expected to weaken.

Lattice QCD calculations establish that for the physical quark masses the transition is not a sharp first-order phase change but a smooth **crossover** at $T_c \approx 155$ MeV. That matters cosmologically: a first-order transition would proceed by bubble nucleation, generating inhomogeneities and potentially a gravitational-wave background. A crossover does neither. **The absence of a signal is itself the prediction**, and it is why nucleosynthesis a few minutes later begins from a smooth, homogeneous plasma.

## The baryon asymmetry: cosmology's clearest unsolved problem

Now the deepest problem in the chapter, and one of the clearest anywhere in physics — because the phenomenon is unambiguous, the requirements for explaining it are precisely known, and the Standard Model demonstrably fails to meet them.

Every laboratory process that creates a quark creates an antiquark. Baryon number is conserved to the precision of every experiment ever performed. **The universe, however, contains matter and essentially no antimatter.** Not locally — everywhere. Were there antimatter regions, their boundaries with matter regions would produce a gamma-ray glow from annihilation that is not observed on any scale up to the largest surveyed.

Quantify the asymmetry with the **baryon-to-photon ratio**:

$$\eta = \frac{n_b}{n_\gamma} = 6.1\times10^{-10},$$

measured two independent ways — from the CMB acoustic peaks and from the primordial deuterium abundance — which agree.

Now interpret it. In the early universe, above the quark–hadron transition, quarks and antiquarks were both present in numbers comparable to photons. Nearly all of them annihilated. **The tiny excess of quarks over antiquarks is everything that survived**: for every 1.6 billion antiquarks there were 1.6 billion **and one** quarks, and the leftover one is the entire material content of the universe. Every atom in every star and every person is annihilation residue.

Andrei Sakharov identified in 1967 the three conditions any explanation must satisfy:

1. **Baryon number violation.** Obviously — you cannot change $B$ from zero without a process that changes $B$.
2. **C and CP violation.** If the physics were symmetric between matter and antimatter, any $B$-violating process would run equally in both directions and produce no net excess.
3. **Departure from thermal equilibrium.** In equilibrium, forward and reverse reaction rates are equal by detailed balance, and any asymmetry generated is immediately undone.

The conditions are individually reasonable and jointly severe. And here is the result that makes this the sharp problem it is: **the Standard Model contains all three in principle, and fails quantitatively on two of them.**

- *Baryon number violation* exists via non-perturbative electroweak sphaleron processes, active at high temperature. This one is satisfied.
- *CP violation* exists in the CKM quark-mixing matrix — this is why $B$ mesons decay slightly differently from their antiparticles, measured in detail at LHCb and Belle. But the effect is **at least ten orders of magnitude too small** to yield $\eta = 6\times10^{-10}$.
- *Departure from equilibrium* would be supplied by a first-order electroweak phase transition, proceeding by bubble nucleation. But lattice calculations show that for the measured Higgs mass of 125 GeV the electroweak transition is **a smooth crossover, not first-order**. There is no departure from equilibrium available.

So the Standard Model, applied to the early universe, predicts a universe of radiation and nothing else. **We exist; therefore the Standard Model is incomplete.**

That is worth dwelling on, because it is a rare thing. The evidence for physics beyond the Standard Model here is not a marginal anomaly, not a $3\sigma$ excess awaiting more data — it is the existence of matter, established to arbitrary precision by the reader's own existence, and inconsistent with the theory by ten orders of magnitude. Alongside dark matter, neutrino masses and dark energy, it is one of the few places where the Standard Model's incompleteness is beyond argument rather than a matter of taste.

Proposed resolutions include **leptogenesis** — generating a lepton asymmetry through heavy right-handed neutrino decays, then converting part of it to baryons via sphalerons, attractive because heavy right-handed neutrinos are independently motivated by the see-saw explanation of light neutrino masses — and **electroweak baryogenesis** in extensions of the Higgs sector that restore a first-order transition. Neither is established. **The problem is open, and it is open in an unusually well-posed way**: we know exactly what an explanation must supply, which is more than can be said for dark energy.

```checkpoint
q: The Standard Model contains baryon-number violation, CP violation and a possible departure from equilibrium — all three Sakharov conditions. Why is it nevertheless unable to explain the baryon asymmetry?
a: Because sphaleron processes conserve baryon number after all, removing the first condition
x: Sphalerons genuinely violate baryon number at high temperature; that condition is the one the Standard Model does satisfy.
a*: Because it satisfies them only qualitatively — CKM CP violation falls short by at least ten orders of magnitude, and the electroweak transition is a crossover rather than first-order, providing no departure from equilibrium
a: Because baryon number violation and CP violation cannot both operate in the same epoch
x: There is no such incompatibility; both are active around the electroweak scale. The failure is quantitative.
a: Because the Standard Model predicts equal matter and antimatter, so none of the conditions is met
x: It does predict a symmetric outcome, but not because the conditions are absent — they are present and insufficient.
hint: Having a mechanism is not the same as having one of the right size.
why: Sakharov's conditions are necessary, not sufficient, and the Standard Model meets them only in principle. Sphalerons do violate baryon number at high temperature, so that condition holds. CP violation exists in the CKM matrix and is measured precisely in $B$-meson decays, but the resulting asymmetry is smaller than the observed $\eta = 6\times10^{-10}$ by at least ten orders of magnitude. And a departure from equilibrium would require a first-order electroweak phase transition, whereas lattice QCD shows that at the measured Higgs mass of 125 GeV the transition is a smooth crossover. The Standard Model therefore predicts a universe of radiation with negligible matter. Our existence refutes it — which makes this one of the cleanest arguments for new physics available, far sharper than any collider anomaly.
---
q: What does $\eta = 6.1\times10^{-10}$ imply about the fate of matter in the early universe?
a: That only one part in $1.6\times10^{9}$ of the universe's energy is in matter today
x: The ratio is of baryons to *photons*, not an energy fraction. Baryons are about 5% of the present energy density.
a*: That for roughly every 1.6 billion antiquarks there were 1.6 billion and one quarks, so nearly everything annihilated and all surviving matter is the residue of that imbalance
a: That baryons were produced 1.6 billion times more slowly than photons throughout the early universe
x: Baryons and antibaryons were produced together in comparable numbers to photons; the ratio reflects an asymmetry at annihilation, not a production rate.
a: That the universe contains 1.6 billion times more antimatter than matter in regions we cannot see
x: No antimatter regions are observed on any scale; their boundaries would glow in annihilation gamma rays, and no such glow exists.
hint: Before annihilation, how did the quark abundance compare with the photon abundance?
why: Above the quark–hadron transition, quarks and antiquarks were present in numbers comparable to photons — the universe was in equilibrium and everything relativistic had roughly the same abundance. As it cooled, essentially all of them annihilated into photons. What survived is the excess of quarks over antiquarks, and $\eta = n_b/n_\gamma = 6.1\times10^{-10}$ measures precisely that: about one extra quark per 1.6 billion pairs. Every atom in existence is what was left over when the annihilation finished. The value is measured two independent ways — from the CMB acoustic peaks and from primordial deuterium — which agree, so the number itself is not in doubt. Only its origin is.
```

{{image: Quark–gluon plasma | The state of matter above about 150 MeV, in which quarks and gluons are not confined into hadrons. The early universe passed through this phase until roughly 15 microseconds after the beginning, and heavy-ion collisions at RHIC and the LHC now recreate it in droplets lasting some $10^{-23}$ seconds. The plasma proved to behave as a nearly perfect fluid rather than a dilute gas of free quarks, and lattice calculations show the transition to ordinary hadrons is a smooth crossover — which is why nucleosynthesis a few minutes later began from a homogeneous plasma.}}

## The relic inventory

What the early universe left behind, and what each item records:

| Relic | Abundance today | Froze out at | What it records |
| --- | --- | --- | --- |
| Photons (CMB) | 411 cm⁻³, 2.7255 K | 380,000 yr | Recombination; the acoustic physics of the primordial plasma |
| Neutrinos | 336 cm⁻³, 1.95 K | ~1 s | The expansion rate and species count at one second |
| Helium-4 | 24.5% by mass | ~1–200 s | The neutron-to-proton ratio at freeze-out |
| Deuterium | $2.5\times10^{-5}$ by number | ~200 s | The baryon density, hence $\eta$ |
| Baryons | 0.25 m⁻³ | ~$10^{-5}$ s (annihilation) | An asymmetry generated in an unknown earlier epoch |
| Dark matter | 1.6 atoms' worth m⁻³ equivalent | unknown | Its annihilation cross-section, if it is a thermal relic |

Read the third column. **Every entry is a freeze-out**, and every entry is informative for exactly that reason. This is the chapter's argument in a single table: the early universe is knowable not despite being in equilibrium but because equilibrium kept failing, and each failure left a record.

Read the last row too. Dark matter is in the table on the strength of its gravitational effects, with the freeze-out epoch unknown because the particle is unidentified. **If it is a thermal relic, its measured density is a direct readout of its annihilation cross-section** — and the value required, around $3\times10^{-26}$ cm³ s⁻¹, is close to what a weak-scale particle would naturally have. That coincidence, the so-called WIMP miracle, motivated three decades of direct-detection experiments. It has not yet paid off, and the Dark Universe block takes up the question of what that failure means.

## Pulling the thread

- The radiation era runs on one equation: $t \approx 2.42/(\sqrt{g_*}(T/\mathrm{MeV})^2)$ seconds, giving **1 MeV at 1 second**, or $10^{10}$ K. It needs no input from astronomy — **the early universe is the most calculable epoch in cosmic history precisely because it was simple, hot and in equilibrium.**
- **Confidence has a boundary.** Collider energies reach a few TeV, corresponding to $\sim10^{-14}$ s. After that, laboratory-tested physics; before it, extrapolation across **twelve orders of magnitude** to the GUT scale. Nucleosynthesis and inflation are both "early universe" and their evidential standing is not comparable.
- The **initial singularity is not a prediction about the universe** but about classical general relativity extrapolated past the Planck scale, where it is known to fail. **The Big Bang *model* is superbly supported; the Big Bang *singularity* is not established** — same name, different evidential standing.
- **Freeze-out is the master mechanism.** When $\Gamma = n\sigma v$ falls below $H$, a species decouples and its abundance is fossilised. **Equilibrium destroys information; freeze-out preserves it** — which is why every relic in the inventory exists, and why each one is informative.
- **Neutrinos** decoupled at 1 s, making the cosmic neutrino background the oldest relic in existence. Subsequent $e^+e^-$ annihilation reheated only the photons, giving $T_\nu/T_\gamma = (4/11)^{1/3}$ and **1.95 K, 336 cm⁻³**. Never directly detected, yet confirmed to 6% through $N_{\rm eff} = 2.99 \pm 0.17$ against a predicted 3.044.
- The **quark–hadron transition** at 150 MeV is reproducible in heavy-ion collisions, where the plasma proved to be a near-perfect fluid. Lattice QCD makes it a **crossover**, not first-order, so it left no inhomogeneities — an absence that is itself a prediction.
- The **baryon asymmetry** $\eta = 6.1\times10^{-10}$ means one surviving quark per 1.6 billion pairs; all matter is annihilation residue. **Sakharov's three conditions are all present in the Standard Model and all inadequate** — CP violation short by ten orders of magnitude, and the electroweak transition a crossover rather than first-order. **Our existence is therefore direct evidence for physics beyond the Standard Model**, and unusually clean evidence at that.

The transferable idea: **a system in equilibrium tells you nothing about its history, so look for the moment equilibrium failed.** This is why cosmology can speak with confidence about the first second while having no direct observation from it. The early universe erased its own past continuously, right up to the moment each reaction became too slow — and at that moment it started keeping records. The same logic governs isotope ratios in meteorites, quenched microstructures in metallurgy, and the closure temperatures that make radiometric dating possible: in each case the informative quantity is not what the system settled into but **what it was doing when it stopped being able to settle.** Wherever a system is in equilibrium, ask what would freeze if it cooled — that is where the evidence will be.

## Further reading

{{book: Steven Weinberg | The First Three Minutes | 1977}}

{{book: Edward Kolb and Michael Turner | The Early Universe | 1990}}

{{book: Helge Kragh | Cosmology and Controversy | 1996}}

Beyond the books: Weinberg's account is nearly fifty years old and remains the best popular treatment, partly because the physics of the first three minutes has changed less than almost any other area of cosmology — a fact worth noticing. Kolb and Turner is the standard graduate reference and is where the freeze-out calculations are done properly. On the baryon asymmetry, Sakharov's original 1967 paper is two pages long and worth reading in the original for how directly it states the problem.

## Problems

*Useful numbers: $t \approx 2.42/(\sqrt{g_*}(T/\mathrm{MeV})^2)$ s; 1 MeV = $1.16\times10^{10}$ K; $g_* = 106.75$ (full SM), 10.75 (before $e^+e^-$ annihilation), 3.36 (after); $T_\gamma = 2.7255$ K; $n_\gamma = 411$ cm⁻³; $\eta = 6.1\times10^{-10}$; $(4/11)^{1/3} = 0.7138$; $m_n - m_p = 1.293$ MeV; $N_{\rm eff}$ predicted 3.044, measured $2.99 \pm 0.17$; LHC 13.6 TeV.*

**1.** *(The master equation.)* **(a)** Using $g_* = 10.75$, compute the temperature in MeV and in kelvin at $t = 1$ s. **(b)** Compute the time at which $T = 100$ GeV, taking $g_* = 106.75$. **(c)** State what inputs the relation requires and what it conspicuously does not, and explain why that makes the early universe unusually calculable.

**2.** *(Where confidence ends.)* **(a)** Convert a collider energy of a few TeV into a cosmic time. **(b)** State the energy gap to the GUT scale in orders of magnitude. **(c)** Divide cosmic history before one second into evidential categories and say what secures each. **(d)** State what the Hawking–Penrose theorems establish and what they do not, and distinguish the two things called "the Big Bang".

**3.** *(Freeze-out.)* **(a)** State the freeze-out criterion. **(b)** For neutrinos, show that $\Gamma/H \propto T^3$ given $\sigma \propto G_F^2T^2$, $n \propto T^3$ and $H \propto T^2$, and say what the steepness implies. **(c)** Explain why freeze-out makes a relic informative when equilibrium does not.

**4.** *(The neutrino background.)* **(a)** Compute $T_\nu$ today from $T_\gamma$ and explain the origin of the factor. **(b)** Compute the number density per species and in total, given $n_\nu = \tfrac{3}{11}n_\gamma$ per species. **(c)** Explain why the predicted value is 3.044 rather than exactly 3.

**5.** *(Evidence without detection.)* **(a)** State why direct detection of relic neutrinos is so difficult. **(b)** Explain the mechanism by which the CMB constrains $N_{\rm eff}$. **(c)** Assess the claim that the cosmic neutrino background is unconfirmed until directly detected.

**6.** *(The quark–hadron transition.)* **(a)** Give the temperature and time. **(b)** State what heavy-ion collisions revealed about the plasma's behaviour and why it was surprising. **(c)** Explain why a crossover rather than a first-order transition matters cosmologically.

**7.** *(The asymmetry.)* **(a)** From $\eta = 6.1\times10^{-10}$, state the quark-to-antiquark excess before annihilation. **(b)** State the two independent measurements of $\eta$. **(c)** Explain why the absence of antimatter regions is an observational result rather than an assumption.

**8.** *(Sakharov.)* **(a)** State the three conditions and justify each in one sentence. **(b)** For each, state the Standard Model's status. **(c)** State what follows, and compare the strength of this argument for new physics with a typical collider anomaly.

**9.** *(The inventory.)* **(a)** List four relics with their freeze-out epochs. **(b)** State what each records. **(c)** Identify the common structure and state the transferable principle, with one example from outside cosmology.

## Worked answers

**1.** **(a)** $T = \sqrt{2.42/(\sqrt{10.75}\times1)} = \sqrt{2.42/3.279} = \sqrt{0.738} = \mathbf{0.86\ MeV}$, which at $1.16\times10^{10}$ K per MeV is $\mathbf{1.0\times10^{10}\ K}$. This is the origin of "one MeV at one second". **(b)** $T = 100$ GeV $= 10^{5}$ MeV, $\sqrt{g_*} = 10.33$, so $t = 2.42/(10.33\times10^{10}) = \mathbf{2.3\times10^{-11}\ s}$. **(c)** It requires only the temperature and the count of relativistic degrees of freedom. It does **not** require the composition of matter, the density as an independent input, or any astronomical observation. That is because radiation domination fixes $a \propto t^{1/2}$ and thermal equilibrium makes the energy density a function of $T$ alone. **The early universe is calculable because it is thermodynamically trivial** — hot enough to equilibrate, dense enough to stay equilibrated, and free of the structure that makes later epochs hard. Complexity is a late development, and its absence is what makes the first minutes the most precisely predicted stretch of cosmic history despite being the least directly observed.

**2.** **(a)** A few TeV is $\sim3\times10^{6}$ MeV; with $g_* = 106.75$, $t = 2.42/(10.33\times9\times10^{12}) = \mathbf{2.6\times10^{-14}\ s}$, i.e. of order $10^{-14}$ s. **(b)** The GUT scale is $\sim10^{16}$ GeV against a collider reach of $\sim10$ TeV $= 10^{4}$ GeV, a ratio of $10^{12}$ — **twelve orders of magnitude**. **(c)** Three categories. *$t > 1$ s*: secured by surviving relics — light-element abundances, the CMB, the gravitational imprint of neutrinos — and thus **observationally constrained**. *$10^{-14}$ s to 1 s*: physics measured at accelerators applied to a cosmological setting, so **confident extrapolation** in setting but not in underlying physics. *$t < 10^{-14}$ s*: **extrapolation beyond any tested energy**, including grand unification, inflation and the Planck era, motivated by indirect argument but not established. The categories are routinely blurred in popular accounts, which present the first $10^{-35}$ second with the same confidence as the first minute. **(d)** The theorems establish that **within classical general relativity**, with matter satisfying standard energy conditions, an expanding universe has a past singularity. They do **not** establish that the universe began at infinite density, because classical general relativity is known to fail at the Planck scale — $10^{-43}$ s, $10^{19}$ GeV, $5\times10^{96}$ kg m⁻³, some $10^{79}$ times nuclear density — which is precisely where the conclusion bites. A theorem is only as good as its premises, and this one's premise is false in the relevant regime. As for the two meanings: the **Big Bang model** — a hot dense state cooling through a definite sequence of epochs — makes checkable predictions (a blackbody relic at a few kelvin, ~25% helium, a specific deuterium abundance, a redshift–distance relation), all confirmed, several to per-cent precision. The **Big Bang singularity** — an initial moment of infinite density — concerns $t \to 0$, where no relic survives and no tested theory applies. The first is established; the second is an extrapolation past a known breakdown. Popular objections of the form "what came before?" target the second while being answered as though about the first.

**3.** **(a)** A species remains in equilibrium while $\Gamma = n\sigma v \gg H$, and freezes out when $\Gamma$ falls to $H$ — one interaction per expansion time. **(b)** $\Gamma \propto n\sigma \propto T^3\cdot G_F^2T^2 = G_F^2T^5$, and in the radiation era $H \propto T^2$, so $\Gamma/H \propto T^3$. The cube is steep: a factor of 2 in temperature changes the ratio by 8, so the transition from strongly coupled to entirely free occupies a narrow interval. **Neutrino decoupling is therefore sharp**, occurring over a short span around 1 MeV rather than gradually, which is why it can be treated as an instantaneous event to good approximation. **(c)** An equilibrium distribution is specified by temperature alone and retains **no memory** — whatever the history, equilibrium returns the same state. Freeze-out breaks that: the abundance stops tracking equilibrium at a definite moment and is carried forward unchanged apart from dilution, **fossilising the conditions at that instant**. The frozen value therefore encodes the temperature, density and interaction strength when the reaction failed. Equilibrium destroys information; freeze-out preserves it.

**4.** **(a)** $T_\nu = 0.7138\times2.7255 = \mathbf{1.95\ K}$. The factor arises because neutrinos decoupled at ~1 s, and shortly afterwards the temperature fell below the electron mass so that $e^+e^-$ pairs annihilated, dumping their energy into the **photon bath only** — the neutrinos having already stopped interacting. Entropy conservation across the annihilation fixes the ratio at exactly $(4/11)^{1/3}$. **(b)** Per species $n_\nu = \tfrac{3}{11}\times411 = 112$ cm⁻³; across three flavours, $\tfrac{9}{11}\times411 = \mathbf{336\ cm^{-3}}$. Roughly $10^{14}$ pass through a human body each second. **(c)** Because decoupling is **not quite instantaneous**. The highest-energy neutrinos remain marginally coupled as annihilation begins, so a small fraction of the released energy leaks into the neutrino bath rather than going entirely to the photons. Including that effect, along with finite-temperature QED corrections, raises the effective count from 3 to **3.044**. The excess is small but calculable, and measuring it is a test of the decoupling calculation itself rather than of the number of species.

**5.** **(a)** Relic neutrinos have energies of order $10^{-4}$ eV, set by $T_\nu = 1.95$ K. Weak cross-sections scale steeply with energy, so at these energies they are vanishingly small — there is no practical way to make a relic neutrino deposit detectable energy in a detector. The PTOLEMY concept exploits neutrino capture on tritium, which has **no energy threshold**, and remains extraordinarily difficult. **(b)** Free-streaming neutrinos contribute to the radiation energy density, which sets the expansion rate at recombination and hence the timing of the acoustic oscillations; they also damp the growth of perturbations by streaming out of them. Both effects shift the positions and heights of the CMB acoustic peaks in ways sensitive to $N_{\rm eff}$, giving $2.99 \pm 0.17$. **(c)** The claim should be rejected. It treats direct detection as the only admissible form of evidence, which would mean **discarding a 6% measurement with well-understood systematics in favour of a hypothetical first-generation direct detection whose systematics would be far worse**. What makes evidence strong is that the observable is sensitive to the quantity of interest and the inference is well controlled — both hold here. The neutrino background is confirmed; it simply has not been captured.

**6.** **(a)** $T \approx 150$ MeV $= 1.7\times10^{12}$ K, at $t = 2.42/(\sqrt{51.25}\times150^2) = \mathbf{1.5\times10^{-5}\ s}$ — about fifteen microseconds. **(b)** Heavy-ion collisions at RHIC and the LHC showed the plasma behaves as a **nearly perfect fluid**, with a viscosity-to-entropy ratio close to the conjectured lower bound, rather than as the dilute gas of quasi-free quarks that asymptotic freedom naively suggests. The strong interaction remains strongly coupled at these temperatures — a genuine surprise, and one that only experiment could have settled. **(c)** A **first-order** transition proceeds by nucleating bubbles of the new phase, which collide and generate inhomogeneities in the baryon distribution and a stochastic gravitational-wave background. A **crossover** does neither: the change is smooth and leaves the plasma homogeneous. Lattice QCD at physical quark masses gives a crossover at $T_c \approx 155$ MeV, so **the prediction is an absence** — no baryon inhomogeneities, no gravitational-wave relic from this epoch — and that absence is what allows nucleosynthesis a few minutes later to begin from a uniform plasma, as its successful predictions require.

**7.** **(a)** Above the quark–hadron transition, quarks and antiquarks were each present in numbers comparable to photons. Since $n_b/n_\gamma = 6.1\times10^{-10}$ survives after annihilation, the pre-annihilation excess was about one part in $1/(6.1\times10^{-10}) = 1.6\times10^{9}$: **for every 1.6 billion antiquarks there were 1.6 billion and one quarks**. Everything else annihilated into photons, so all existing matter is annihilation residue. **(b)** From the **CMB acoustic peaks**, where the baryon density controls the relative heights of odd and even peaks; and from the **primordial deuterium abundance**, which is steeply sensitive to the baryon density. The two agree, which is a non-trivial consistency check between physics at 200 seconds and physics at 380,000 years. **(c)** Because antimatter regions would have **boundaries**, and matter meeting antimatter annihilates into gamma rays at a characteristic 511 keV and above. Surveys find no such emission at any scale from the Solar System to the largest structures examined. The absence of antimatter is therefore **measured**, not assumed — and it is what rules out the otherwise attractive idea that the universe is symmetric overall with matter and antimatter merely separated.

**8.** **(a)** **Baryon-number violation**: without a process that changes $B$, an initial $B = 0$ stays zero. **C and CP violation**: if matter and antimatter behave identically, $B$-violating processes run equally in both directions and no net excess accumulates. **Departure from thermal equilibrium**: in equilibrium detailed balance equalises forward and reverse rates, so any asymmetry generated is immediately erased. **(b)** *Baryon-number violation*: **satisfied**, via electroweak sphalerons at high temperature. *CP violation*: **present but far too small** — CKM CP violation is measured precisely in $B$-meson decays, yet falls short of $\eta = 6\times10^{-10}$ by at least ten orders of magnitude. *Departure from equilibrium*: **absent** — it would require a first-order electroweak phase transition, but lattice calculations at the measured Higgs mass of 125 GeV give a smooth crossover. **(c)** The Standard Model applied to the early universe predicts a universe of radiation with negligible matter. **Our existence therefore establishes that it is incomplete.** Compare a typical collider anomaly: a $3\sigma$ excess in some channel, which may well evaporate with more data, and whose interpretation is model-dependent. Here the observation is certain, the discrepancy is ten orders of magnitude, and the requirements for a fix are precisely specified. **It is among the cleanest arguments for new physics in existence** — and the fact that it rests on an observation available without any apparatus at all is part of what makes it so.

**9.** **(a)** **Photons** (CMB), froze out at 380,000 yr; **neutrinos**, ~1 s; **helium-4**, ~1–200 s; **deuterium**, ~200 s. One could add **baryons**, whose annihilation completed at ~$10^{-5}$ s. **(b)** Photons record the acoustic physics of the primordial plasma at recombination. Neutrinos record the expansion rate and relativistic species count at one second. Helium records the neutron-to-proton ratio at weak freeze-out. Deuterium records the baryon density, hence $\eta$. Baryons record an asymmetry generated in an unknown earlier epoch. **(c)** Every one is a **freeze-out**: a reaction that lost the race against expansion, fossilising the conditions at the moment it failed. The transferable principle is that **a system in equilibrium tells you nothing about its history, so the informative moment is when equilibrium broke down** — and therefore, whenever you find a system in equilibrium, ask what would freeze if it cooled, because that is where the record will be kept. Outside cosmology: **closure temperatures in radiometric dating**, where a mineral retains daughter isotopes only below a specific temperature, so the measured age is the age at which diffusion froze out, not the age of formation. The same structure appears in quenched microstructures in metallurgy and in isotope ratios in meteorites — in each case the measurement reads not the state the system settled into, but what it was doing when it stopped being able to settle.$bbEarly_master$,
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
