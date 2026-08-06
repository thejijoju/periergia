-- Astronomy & Space · Stellar Death — Red Giants —
-- "The Red-Giant Branch". Curated, human-reviewed master for
-- astronomy-and-space/stellar-death/red-giants/the-red-giant-branch
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The chapter that opens Stellar Death on one organising idea: when core
-- hydrogen runs out, the core and envelope stop behaving as one object and
-- evolve in opposite directions. The Sun at the RGB tip at 170 solar radii
-- and 2,400 solar luminosities, with a core of 0.45 solar masses inside
-- 2.2 Earth radii at eighty kilograms per cubic centimetre — the densest
-- and most diffuse material a star ever produces, simultaneously, separated
-- by a burning shell; why the star swells BECAUSE its core contracts, the
-- virial theorem making an inert core hotter precisely by ceasing to
-- generate energy, and CNO's T^17 turning a 50% shell temperature rise into
-- a 985-fold rate increase; why shell burning has no thermostat, failing
-- geometrically rather than through the equation of state as degeneracy
-- does; the mirror principle stated honestly as numerically secure and
-- analytically unexplained; the envelope's 23-year Kelvin-Helmholtz time
-- against the core's 130,000, making it a loosely attached atmosphere;
-- first dredge-up carrying material rather than information to the surface,
-- with technetium's short half-life as near-direct proof of stellar
-- nucleosynthesis; and the degenerate ignition threshold that makes the tip
-- a standard candle now sitting at the centre of the Hubble tension.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-death/red-giants/the-red-giant-branch',
    'research',
    'advanced',
    'read',
    $astroRGB_master$> For the whole of the main sequence a star is a single coupled system: the core generates energy, the envelope transports it, and the thermostat regulates the pair. Core hydrogen exhaustion breaks that coupling, and the two halves then evolve almost independently — in opposite directions. The core contracts and heats until it is, in effect, a white dwarf already; the envelope expands enormously and cools until it is barely attached. Everything in this block follows from that decoupling.

## The star that is both

Consider the Sun at the tip of the red-giant branch, roughly seven billion years from now.

| | Now | RGB tip |
|---|---|---|
| Radius | 1 $R_\odot$ | **170 $R_\odot$** |
| Luminosity | 1 $L_\odot$ | **2,400 $L_\odot$** |
| Surface temperature | 5,772 K | 3,100 K |
| **Core density** | 1.5 × 10⁵ kg/m³ | **~10⁸ kg/m³** |

Read the first and last lines together, because the combination is the point. The star swells by a factor of 170 in radius — a factor of five million in volume. Its surface will reach 0.79 AU, twice Mercury's orbital radius, and on the later asymptotic giant branch it will exceed 1 AU. And at the same time the core shrinks, its density rising by a factor of nearly a thousand.

The core at the RGB tip has a mass of about 0.45 M☉ compressed into a radius of about 0.02 $R_\odot$ — roughly 2.2 Earth radii, or 14,000 km. Its mean density is $8\times10^{7}$ kg/m³, about eighty kilograms per cubic centimetre: a teaspoonful would weigh as much as a person.

That is white dwarf material. The core of a red giant is already a white dwarf, held in reserve, wrapped in an envelope 8,500 times larger in radius and $6\times10^{11}$ times larger in volume. A red giant is simultaneously the densest and the most diffuse object a star ever becomes — the two extremes in the same object, in the same instant, separated by a burning shell.

{{image: Red giant | A red giant beside a Sun-like star: at the tip of the red-giant branch the Sun will swell to 170 times its present radius, engulfing Mercury and Venus — while at its centre a core of 0.45 solar masses is compressed into barely two Earth radii, already white-dwarf material.}}

### Why this cannot be understood as "the star expands"

The common description — that a star runs out of fuel and swells into a red giant — gets the physics backwards in a specific and important way.

The star does not swell because it is running down. It swells because its core is contracting and heating, which makes the shell around it burn faster, which raises the luminosity by a factor of a thousand. A red giant is not a dying star cooling off. It is a star at the most energetic phase of its life so far, brighter than it has ever been and getting brighter, driven by a core that is collapsing under its own weight. The expansion is a consequence of the contraction, and explaining how is the business of this chapter.

## Why the core contracts

When the core's hydrogen is gone, it is composed of helium — and helium requires about $10^8$ K to fuse, roughly seven times hotter than the ~1.5 × 10⁷ K at which the star has been burning hydrogen. The reason is the Coulomb barrier: helium has $Z = 2$, so fusing two helium nuclei faces a barrier four times higher than proton–proton, and the Gamow peak lies at correspondingly higher energy. The core is therefore inert: it generates nothing.

An inert core cannot maintain itself, and the reason is the virial theorem. It continues to radiate energy into the shell above it — heat flows down the temperature gradient regardless of whether anything is generating it — and having no source to replace that energy, it must contract. And by negative heat capacity, contraction makes it hotter:

$$E \downarrow \quad\Longrightarrow\quad \text{contract} \quad\Longrightarrow\quad T \uparrow$$

The core heats up precisely because it has stopped generating energy. That is counterintuitive and it is the correct reading of the virial theorem.

### The shell ignites

Immediately outside the helium core is a shell of unburnt hydrogen. As the core contracts and heats, so does this shell — and the hydrogen there ignites. Now recall how steeply the reaction rate depends on temperature. For CNO burning, $\epsilon \propto T^{17}$:

| Shell temperature rise | Energy generation rises by |
|---|---|
| 20% | **22×** |
| 50% | **985×** |
| 100% | **131,000×** |

A modest increase in shell temperature produces an enormous increase in energy output. The shell burns far more vigorously than the core ever did — partly because it is hotter, and partly because a thin shell at high temperature is a far more concentrated furnace than a diffuse core, with the burning confined to a small mass at the peak temperature rather than spread over the inner tenth of the star. The result: the luminosity rises by a factor of order a thousand.

### And the process feeds itself

The shell adds helium ash to the core, so the core grows in mass. A more massive core is more tightly bound and contracts further, which heats the shell further, which burns faster, which adds ash faster.

There is no thermostat here. The regulation that stabilises a main-sequence star depends on the burning region being able to expand when heated — and a shell sitting on a contracting core cannot. It is held between the core below and the envelope above, and it burns hotter and hotter as the core shrinks.

This is worth distinguishing carefully from the degenerate case, because the two failures are different. In degenerate matter the loop fails because the *pressure does not respond to temperature at all* — an equation-of-state failure. In a burning shell the equation of state is perfectly normal and the pressure does rise; the failure is *geometric*, because expanding would require lifting the entire envelope while the core beneath is shrinking rather than yielding. Two different routes to the same broken regulation, and both matter in this block: the geometric one drives the ascent of the red-giant branch and the thermal pulses of the AGB, and the degenerate one produces the helium flash.

## Why the envelope expands

Now the hard part, and it deserves to be flagged as hard rather than asserted.

The mirror principle — that core contraction is accompanied by envelope expansion — is robust in every numerical model of stellar evolution, and it has no universally accepted simple analytic explanation. Several partial arguments exist, each capturing something.

**The energy-balance argument.** The shell produces some 1,000 times the previous luminosity, and the star must radiate it. If the envelope remains cool — and it must, because H⁻ opacity pins the surface temperature — then from $L = 4\pi R^2\sigma T^4$ a large $L$ at fixed low $T$ requires a large $R$. Check it: $L = 2{,}400\,L_\odot$ at $T_{\text{eff}} = 3{,}100$ K requires $R = 170\,R_\odot$, exactly the observed value.

**The Hayashi constraint.** A red giant's envelope is deeply convective, so it lies on the Hayashi track — the vertical line beyond which no star in hydrostatic equilibrium can be cooler. Increasing the luminosity while remaining pinned to that temperature forces the star upward and outward.

**The pressure argument.** As the core contracts, the shell moves inward and the pressure it exerts on the base of the envelope changes; models show the envelope responds by expanding, but the chain of cause and effect is genuinely subtle and different textbooks emphasise different steps.

This is a case where the numerical result is completely secure and the intuitive explanation is not. It is worth being honest about that rather than presenting a plausible story as a derivation — and note that the energy-balance check above is a *consistency check*, not a derivation: it uses the observed luminosity and the observed effective temperature to compute the radius, confirming only that the three are mutually consistent through a relation that defines effective temperature. It does not explain why the envelope adopts a cool extended configuration rather than remaining compact and hot.

### The envelope is barely attached

Whatever the cause, the consequence is measurable and it matters for everything downstream. Compute the Kelvin–Helmholtz timescale for each half of the star separately:

| Region | $t_{KH}$ |
|---|---|
| **Core** (0.45 M☉, 0.02 $R_\odot$) | **1.3 × 10⁵ yr** |
| **Envelope** (0.55 M☉, 170 $R_\odot$) | **~23 yr** |

The envelope's thermal timescale is a few decades, against the core's 130,000 years — a ratio of about 5,700. Each half sees the other as either instantaneous or frozen, which is exactly the condition for two systems to evolve independently. This is the quantitative form of the decoupling: the envelope is not a structural part of the star so much as a loosely attached atmosphere, gravitationally almost unbound and thermally almost instantaneous.

Three consequences follow, and all three are the subject of later chapters. It can be removed entirely by a wind — an AGB superwind at $10^{-5}\,M_\odot$/yr strips it in some 40,000 years, which is how low-mass stars actually end. It pulsates readily, a loosely bound envelope with a short thermal timescale being exactly what is needed to sustain the Mira and Cepheid instabilities. And it can be transferred to a companion, which is how the Algol paradox arises and how novae and Type Ia supernovae become possible.

## The surface reports on the interior

One consequence of the deep convective envelope is genuinely remarkable, and it partly overturns something established earlier.

As the envelope expands and cools, its convection zone deepens enormously — because cooler material is more opaque, so the radiative gradient steepens and the Schwarzschild criterion is satisfied over a larger range of depth. It reaches down to layers that were once inside the hydrogen-burning region, where CNO processing has altered the composition. Convection then mixes that material to the surface, where it can be measured spectroscopically.

| Species | Change | Reason |
|---|---|---|
| **¹²C/¹³C ratio** | **89 → ~20** | CNO equilibrium drives it toward ~3.5 |
| ¹²C | reduced ~30% | converted to ¹⁴N |
| **¹⁴N** | **enhanced ~80%** | the CNO bottleneck accumulates nitrogen |
| **⁷Li** | **destroyed** | burns at 2.5 × 10⁶ K |
| ⁴He | slightly enhanced | |

The ¹²C/¹³C ratio is the sharpest diagnostic. The interstellar value is about 89; CNO equilibrium drives it to about 3.5; and dredge-up brings partially processed material up, giving observed red-giant values near 20. The intermediate value indicates partial processing — the surface is a mixture of fully processed gas and unprocessed envelope material, so the ratio measures the mixing fraction. Measuring a carbon isotope ratio in a stellar spectrum tells you how deep the convection zone reached.

### Why this matters more than it looks

Earlier chapters established that photons cannot see inside a star: energy random-walks for $10^5$ years and emerges thoroughly thermalised, so the emergent spectrum reports only on the photosphere, and neutrinos and oscillations are the only interior probes.

Dredge-up is a third route, and it works differently. It does not carry information out; it carries *material* out. Convection physically transports nuclei that were processed at $10^7$ K into the photosphere, where ordinary spectroscopy can measure them. Nothing has to survive a random walk — the atoms are simply carried. For the first time in a star's life, the surface composition reports on the nuclear history of the interior.

This becomes far more dramatic on the AGB, where third dredge-up brings up freshly synthesised carbon and s-process elements. Technetium, which has no stable isotope and whose relevant isotope has a half-life of a few hundred thousand years, has been detected in AGB star spectra — Paul Merrill's observation of 1952. Any technetium present at the star's formation would have decayed away entirely long before we observe it, so it must have been manufactured inside that star and brought to the surface within the last few hundred thousand years. The short half-life is what makes the argument work: it turns the detection into a clock, excluding a primordial origin absolutely rather than probabilistically. There is no alternative explanation and no model dependence, which makes it the closest thing to direct observation of stellar nucleosynthesis in progress.

{{image: Mira | Mira, a pulsating red giant shedding its loosely bound envelope. It is in stars like this that technetium was detected in 1952 — an element with no stable isotope and a half-life far shorter than the star's age, so its presence at the surface proves it was manufactured inside and dredged up within the last few hundred thousand years.}}

## The tip, and a cosmological argument

The red-giant branch ends at a specific luminosity, and the reason it is specific is the subject of the next chapter — but the consequence belongs here.

A low-mass star's helium core becomes degenerate as it contracts. Degeneracy pressure does not depend on temperature, so the core can be compressed without the usual heating response, and helium ignition is postponed until the core reaches a specific mass — about 0.47 M☉ — at which the temperature finally reaches $10^8$ K. In a degenerate configuration mass determines radius, which determines the central temperature, so the ignition condition is a condition on mass alone.

Two facts then combine. The luminosity of a shell-burning star depends almost entirely on its core mass, not on its total mass — the core–mass–luminosity relation, since the envelope simply transports what the shell produces and the shell's temperature is set by the core's gravitational field. And the core mass at helium ignition is nearly universal, because degeneracy fixes the ignition condition independently of the total mass or the envelope. Therefore the luminosity at the RGB tip is nearly the same for every low-mass star:

$$M_I = -4.05 \pm 0.02$$

in the I band, for metal-poor populations.

### A standard candle

That makes the tip of the red-giant branch a distance indicator. Observe a galaxy, resolve its red giants, plot their luminosity function, and find the sharp cut-off at the top of the RGB — a discontinuity rather than a taper, because stars cease to exist above that luminosity: on reaching the tip a star ignites helium and moves rapidly to the horizontal branch at a much lower luminosity. The sharpness is what makes it measurable, since one fits for the position of an edge rather than the shape of a distribution.

The TRGB method has real advantages over Cepheids:

| | Cepheids | TRGB |
|---|---|---|
| Stars used | young, massive | **old, low-mass** |
| Found in | star-forming regions, dusty | **galaxy halos, clean** |
| Extinction | substantial | **minimal** |
| Metallicity sensitivity | significant | weak in the I band |
| Crowding | severe in spiral arms | mild in halos |

They are independent rungs of the distance ladder, using different stars in different parts of a galaxy, calibrated by different physics — a pulsation period–luminosity relation versus a degenerate ignition threshold — and affected differently by extinction and crowding. An error in the Cepheid zero point cannot propagate into the TRGB calibration. This is the disjoint-failure-mode standard applied throughout this course.

### And they disagree

Both methods are used to calibrate Type Ia supernovae and hence to measure the Hubble constant. They give:

| Method | $H_0$ (km/s/Mpc) |
|---|---|
| **Cepheid-calibrated** | **~73** |
| **TRGB-calibrated** | **~69–70** |
| Planck CMB (early universe) | ~67.4 |

The Cepheid value disagrees with the CMB value at high significance — the Hubble tension, one of the central unresolved problems in cosmology. The TRGB value sits between them, and closer to the CMB.

Why a stellar disagreement becomes a cosmological question is worth stating precisely. The CMB value is inferred rather than measured directly: it is what the standard cosmological model predicts for the present expansion rate given the early-universe conditions Planck measured. The local values are measured at low redshift. A robust disagreement therefore means the model connecting the two epochs is incomplete — new physics between recombination and now. But the local value depends on the distance ladder, whose second rung is calibrated by either Cepheids or the TRGB. If the TRGB is right, the tension is much reduced and may not require new physics. If Cepheids are right, it probably does.

A disagreement between two ways of measuring red giants is currently a live input to whether the standard cosmological model is complete.

I would not bet confidently either way. The TRGB calibration has its own difficulties — the exact placement of the tip depends on the edge-detection method used on a noisy luminosity function, on metallicity corrections, on contamination by AGB stars lying just above the tip, and on the zero point itself, which must be established from a population at known distance. The Cepheid work has been extensively scrutinised without the discrepancy resolving. Both teams are careful and they disagree, which usually indicates an unrecognised systematic rather than an error — and notably, both have added data for years without convergence, which is itself evidence that the problem is systematic rather than statistical. The structure is the same as the solar neutrino problem: two well-executed measurements disagreeing, resolved eventually not by more precision but by a differently designed measurement.

{{image: Cosmic distance ladder | The cosmic distance ladder: Cepheids and the tip of the red-giant branch are competing second rungs, each calibrating Type Ia supernovae and hence the Hubble constant. They use different stellar populations in different parts of a galaxy and share almost no systematics — and they currently disagree by enough to matter for whether cosmology needs new physics.}}

## Pulling the thread

- When core hydrogen is exhausted, the core and envelope stop behaving as one object and evolve in opposite directions. That decoupling is the organising idea of this whole block.
- The Sun at the RGB tip: radius 170 $R_\odot$ (reaching 0.79 AU, twice Mercury's orbit), luminosity 2,400 $L_\odot$, and a core of 0.45 M☉ in 2.2 Earth radii at eighty kilograms per cubic centimetre. The core of a red giant is already a white dwarf, wrapped in an envelope 8,500 times larger — the densest and most diffuse material a star ever produces, simultaneously.
- The star does not swell because it is running down. The inert core has no energy source, so by the virial theorem it contracts and heats — it gets hotter *because* it stopped generating energy. The hydrogen shell around it therefore burns hotter, and with $\epsilon \propto T^{17}$ a 50% temperature rise gives a 985-fold rate increase. A red giant is a thousand times brighter than the main-sequence star it was.
- And shell burning has no thermostat. The regulating loop requires the burning region to expand when heated; a shell trapped between a contracting core and an overlying envelope cannot. The failure is geometric, where the degenerate failure is in the equation of state — two routes to the same broken regulation, and both return later in this block.
- Why the envelope expands is genuinely unsettled analytically. The mirror principle is secure numerically; the intuitive account is not. What can be checked is that $L = 2{,}400\,L_\odot$ at $T_{\text{eff}} = 3{,}100$ K requires $R = 170\,R_\odot$, and that the Hayashi constraint forbids the envelope from being hotter — but that is a consistency check, not a derivation.
- The envelope's Kelvin–Helmholtz time is about 23 years against the core's 130,000. It is a loosely attached atmosphere rather than a structural part — which is why it can be stripped by a wind in 40,000 years, why it pulsates readily, and why it can be transferred to a companion.
- First dredge-up carries material, not information, to the surface. The ¹²C/¹³C ratio falls from 89 to ~20, nitrogen rises, lithium is destroyed. For the first time the surface composition reports on the nuclear history of the interior — and the detection of technetium, with no stable isotope and a half-life of a few hundred thousand years, is the closest thing to direct proof that stars manufacture elements.
- The tip is sharp because degeneracy fixes the ignition core mass at ~0.47 M☉, and shell-burning luminosity depends almost entirely on core mass. Hence a near-universal $M_I = -4.05$ — the TRGB standard candle, using old halo stars with minimal extinction, independent of Cepheids.
- And the two disagree. Cepheid calibration gives $H_0 \approx 73$; TRGB gives ~69–70; the CMB gives 67.4. Whether the cosmological model needs new physics depends partly on which measurement of red giants is right.

This chapter established that the RGB core is degenerate, and earlier work established that degenerate matter has no thermostat — pressure does not respond to temperature, so heating produces no expansion and no cooling. Helium is now about to ignite in that core. What happens when a thermonuclear reaction begins in material that cannot expand?

## Further reading

A detailed treatment of red-giant structure, the core–mass–luminosity relation, dredge-up and the calibration of the tip as a distance indicator is given in {{book: Maurizio Salaris and Santi Cassisi | Evolution of Stars and Stellar Populations | 2005}}.

- **Maurizio Salaris and Santi Cassisi, *Evolution of Stars and Stellar Populations* (2005).** Covers the physics of the red-giant branch — the inert degenerate core, shell burning, the mirror principle and first dredge-up — and then, unusually, carries it through to the observational use of red giants as population tracers and distance indicators, including the TRGB method and the systematics affecting its calibration.
- **Paul W. Merrill, "Spectroscopic Observations of Stars of Class S," *Astrophysical Journal* 116 (1952).** The detection of technetium in S-type giants: two pages that established stars manufacture elements.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, $L_\odot = 3.828\times10^{26}$ W, $G = 6.674\times10^{-11}$, $\sigma = 5.670\times10^{-8}$, 1 AU = 1.496 × 10¹¹ m, $R_\oplus$ = 6,371 km, 1 yr = 3.156 × 10⁷ s. Sun at RGB tip: $R$ = 170 $R_\odot$, $L$ = 2,400 $L_\odot$, $T_{\text{eff}}$ = 3,100 K, core 0.45 M☉ within 0.02 $R_\odot$. CNO: $\epsilon \propto T^{17}$. $t_{KH} \sim GM^2/RL$. TRGB: $M_I$ = −4.05.*

### 1 — Both at once
**(a)** Compute the Sun's RGB-tip radius in AU and compare with the orbits of Mercury, Venus and Earth.
**(b)** Compute the factor by which its volume increases from the main sequence.
**(c)** Compute the mean density of the RGB-tip core in kg/m³ and per cm³. Compare with a white dwarf (~10⁹ kg/m³).
**(d)** Express the core radius in Earth radii, and compute the envelope-to-core radius and volume ratios.
**(e)** State, in one sentence, what makes a red giant the most extreme object a star becomes.

### 2 — Why the core contracts *(the central argument)*
**(a)** State why the helium core is inert, giving the temperature required for helium fusion and comparing with hydrogen.
**(b)** Explain, using the virial theorem, why an inert core must contract, and why contraction makes it hotter.
**(c)** State the apparent paradox in one sentence: what happens to the core's temperature when it stops generating energy?
**(d)** Using $\epsilon \propto T^{17}$, compute the factor by which shell energy generation rises for temperature increases of 20%, 50% and 100%.
**(e)** Explain why the resulting luminosity exceeds the main-sequence value by a factor of ~1,000.
**(f)** Explain why shell burning has no thermostat, identifying which step of the feedback loop fails and how this differs from the degenerate case.

### 3 — Why the envelope expands
**(a)** State the mirror principle and its epistemic status: what is secure and what is not?
**(b)** Given $L$ = 2,400 $L_\odot$ and $T_{\text{eff}}$ = 3,100 K, compute the required radius and compare with 170 $R_\odot$.
**(c)** Explain what the Hayashi constraint contributes, and why the envelope cannot simply become hotter instead of larger.
**(d)** Explain why (b) is a consistency check rather than a derivation.
**(e)** Comment on presenting a plausible story as a derivation, and why the distinction matters pedagogically.

### 4 — The envelope is barely attached
**(a)** Compute $t_{KH}$ for the core (0.45 M☉, 0.02 $R_\odot$, $L$ = 2,400 $L_\odot$).
**(b)** Compute $t_{KH}$ for the envelope (0.55 M☉, 170 $R_\odot$, same $L$).
**(c)** Take the ratio and state what it implies about the coupling between the two regions.
**(d)** State three consequences of a loosely bound envelope.
**(e)** Compare with the Sun's $t_{KH}$ of 9.4 Myr and explain the origin of the difference.

### 5 — First dredge-up
**(a)** Explain the mechanism: what deepens, how far, and what does it reach?
**(b)** State the interstellar ¹²C/¹³C ratio, the CNO equilibrium value, and the observed red-giant value. Explain what the intermediate value indicates.
**(c)** List three other surface abundance changes and their causes.
**(d)** Photons cannot see inside a star. Explain why dredge-up is not a counterexample, and what is different about it.
**(e)** Technetium was detected in AGB spectra in 1952. Explain why this constitutes near-direct proof of stellar nucleosynthesis, and what property of technetium makes the argument work.

### 6 — Why the tip is sharp
**(a)** Explain why the RGB core becomes degenerate, and what degeneracy does to the ignition condition.
**(b)** State the core mass at helium ignition and explain why it is nearly universal.
**(c)** State the second fact required — about what determines a shell-burning star's luminosity — and combine the two.
**(d)** Explain why the tip appears as a sharp discontinuity in a luminosity function rather than a gradual decline.
**(e)** Explain why the tip luminosity is only weakly metallicity-dependent in the I band, and why that band is chosen.

### 7 — Two ladders that disagree
**(a)** Tabulate TRGB against Cepheids on: stellar population, environment, extinction, and crowding.
**(b)** Explain why these constitute independent rungs.
**(c)** State the three $H_0$ values and the size of the disagreement.
**(d)** Explain precisely how a stellar-physics disagreement becomes a cosmological question.
**(e)** Two careful teams disagree persistently. State what that usually indicates, and what it does not.
**(f)** Name two systematics that could affect the TRGB calibration.

### 8 — Numerical
**(a)** A 5 M☉ star's core reaches $\mu$ = 1.34 while its envelope remains at 0.6. Using $T_c \propto \mu M/R$, compute the factor by which the core must contract to maintain support at fixed $T_c$.
**(b)** A red giant has $L$ = 1,000 $L_\odot$ and $T_{\text{eff}}$ = 4,000 K. Compute its radius in $R_\odot$ and AU.
**(c)** Compute its mean density given a total mass of 1 M☉, and compare with air at sea level (1.2 kg/m³).
**(d)** Comment on your answer to (c).

### 9 — Open problem: what actually causes the expansion?
The mirror principle is numerically robust and analytically unexplained.
**(a)** State clearly what is meant by "numerically robust but analytically unexplained," and why this is an uncomfortable position.
**(b)** Give two of the proposed partial explanations and state what each does and does not account for.
**(c)** Explain why a simulation reproducing the expansion does not constitute an explanation of it.
**(d)** Propose a test that would discriminate between competing accounts.
**(e)** Name one other result in stellar physics that is secure numerically or observationally while lacking a mechanism.

## Worked answers

### 1 — Both at once

**(a)** $170 \times 6.957\times10^{8}/1.496\times10^{11} = 0.79$ AU.

Mercury at 0.39 AU — engulfed, twice over. Venus at 0.72 AU — engulfed. Earth at 1.00 AU — outside, at the RGB tip. *(Earth's survival on the later AGB, when the radius exceeds 1 AU, is a separate and unsettled question, complicated by the Sun's mass loss widening Earth's orbit and by tidal drag pulling it inward.)*

**(b)** $170^3 = 4.9\times10^{6}$ — nearly five million times.

**(c)** $\rho = 0.45(1.989\times10^{30})/[\tfrac{4}{3}\pi(0.02 \times 6.957\times10^{8})^3] = 7.9\times10^{7}$ kg/m³.

Per cubic centimetre: $79$ kg/cm³ — a teaspoon would weigh about as much as an adult. Compared with a white dwarf at ~$10^9$ kg/m³: about 8% of white dwarf density, and rising as the core continues to contract. It is the same class of material.

**(d)** $R_c = 0.02 \times 6.957\times10^{8} = 1.39\times10^{7}$ m $= 2.2\,R_\oplus$. Radius ratio: $170/0.02 = 8{,}500$. Volume ratio: $8500^3 = 6.1\times10^{11}$.

**(e)** A red giant contains, simultaneously, the densest and the most diffuse material a star ever produces — a nearly-white-dwarf core and an envelope hundreds of times less dense than air, separated by a burning shell.

### 2 — Why the core contracts

**(a)** Because helium fusion requires about $10^8$ K, roughly seven times the ~1.5 × 10⁷ K at which the star has been burning hydrogen. The core's temperature at hydrogen exhaustion is nowhere near that, so the helium is inert and generates no energy at all.

The reason is the Coulomb barrier: helium has $Z = 2$, so fusing two helium nuclei faces a barrier four times higher than proton–proton, and the Gamow peak lies at correspondingly higher energy.

**(b)** An inert core still radiates energy into the shell above it — heat flows down the temperature gradient regardless of whether anything is generating it. Having no source, its total energy decreases.

By the virial theorem, $E = U/2 = -K$, so decreasing $E$ means $U$ becomes more negative — the core contracts — and $K$ increases — it heats up.

**(c)** The core gets hotter because it stopped generating energy.

**(d)** With $\epsilon \propto T^{17}$: a 20% rise gives $(1.2)^{17} = 22\times$; 50% gives $(1.5)^{17} = 985\times$; 100% gives $(2.0)^{17} = 131{,}000\times$.

**(e)** Two effects compound. The shell is hotter than the core ever was, and the rate depends on $T^{17}$. And a thin shell at high temperature is a far more concentrated furnace than a diffuse core: the burning is confined to a small mass at the peak temperature rather than spread over the inner tenth of the star.

Together these raise the energy generation by three orders of magnitude, and since the luminosity must equal the generation rate in equilibrium, the star becomes ~1,000 times brighter.

**(f)** The thermostat requires that heating raise the pressure and that the material then be free to expand. For a shell, the failure is at the second of those: the shell is a thin layer sandwiched between a contracting core beneath and a massive envelope above, so its geometry is essentially fixed by its surroundings. Expanding would require lifting the entire envelope, and the core beneath is shrinking rather than yielding. Heating therefore produces no significant expansion and no cooling, and the rate climbs.

How this differs from the degenerate case: in degenerate matter the loop fails earlier, because the pressure does not respond to temperature at all — an equation-of-state failure. In a burning shell the equation of state is perfectly normal and the pressure does rise; the failure is geometric. The material has nowhere to go.

Two different routes to the same broken regulation, and both matter here: the geometric one drives the ascent of the RGB and the thermal pulses of the AGB; the degenerate one produces the helium flash.

### 3 — Why the envelope expands

**(a)** The mirror principle: in a shell-burning star, core contraction is accompanied by envelope expansion, and vice versa.

Secure: the result. Every numerical stellar evolution calculation, from many independent codes with different numerical methods, produces it, and it is confirmed observationally by the existence of red giants with the observed radii and luminosities.

Not secure: a simple analytic explanation. There is no short derivation from first principles that the community agrees on, and textbooks offer several different partial arguments emphasising different steps.

**(b)** $R = \sqrt{L/4\pi\sigma T^4} = \sqrt{2400(3.828\times10^{26})/[4\pi(5.670\times10^{-8})(3100)^4]} = 1.18\times10^{11}$ m $= 170\,R_\odot$. Confirmed exactly.

**(c)** The Hayashi constraint says a fully convective star cannot be cooler than a critical effective temperature, because H⁻ opacity in the photosphere is so steeply temperature-sensitive that the matching between interior and surface pins $T_{\text{eff}}$ almost independently of radius.

A red giant's envelope is deeply convective, so it sits on the Hayashi track. It cannot become cooler at all, and cannot become substantially hotter while remaining convective — so the only way to radiate a thousand-fold larger luminosity is to become larger.

**(d)** Because it uses the observed luminosity and the observed effective temperature to compute the radius, and confirms only that the three are mutually consistent through the Stefan–Boltzmann law — which they must be, since that relation is a definition of effective temperature.

It does not explain why the luminosity is 2,400 $L_\odot$, or why the envelope adopts that configuration rather than remaining compact and hotter. A derivation would produce the radius from the core properties without being told the answer.

**(e)** Because it teaches a student that the question is closed when it is not, and — worse — it teaches that a chain of plausible-sounding statements constitutes an explanation.

The specific hazard: a student given the energy-balance story as a derivation cannot distinguish it from a real derivation, and will apply the same standard to their own reasoning. Learning what a derivation is requires seeing cases that fall short of one and being told so.

There is also a practical loss. An unexplained result is a research problem, and presenting it as settled removes it from view.

### 4 — The envelope is barely attached

**(a)** $t_{KH} = GM^2/RL = (6.674\times10^{-11})(8.95\times10^{29})^2/[(1.39\times10^{7})(2400 \times 3.828\times10^{26})] = 4.2\times10^{12}$ s $= 1.3\times10^{5}$ yr.

**(b)** $t_{KH} = (6.674\times10^{-11})(1.09\times10^{30})^2/[(1.18\times10^{11})(9.19\times10^{29})] = 7.4\times10^{8}$ s $= 23$ yr.

**(c)** Ratio $\approx 5{,}700$. The two regions are thermally decoupled: the envelope adjusts to any change essentially instantaneously on the core's timescale, so it does not constrain the core's evolution but simply follows. Conversely the core evolves on nuclear timescales far longer than either, so from the envelope's point of view the core's properties are constant. Each half sees the other as either instantaneous or frozen, which is exactly the condition for two systems to evolve independently.

**(d)** It can be stripped by a wind — an AGB superwind removes it in ~40,000 years, which is how low-mass stars actually end. It pulsates, a loosely bound envelope with a short thermal timescale being what sustains the Mira and Cepheid instabilities. And it can be transferred to a companion by Roche-lobe overflow, which produces the Algol paradox, novae and Type Ia supernovae.

**(e)** The Sun: 9.4 Myr. The red giant envelope: 23 years — shorter by a factor of $4\times10^{5}$.

Origin: $t_{KH} \propto M^2/RL$. The envelope has slightly less mass (0.55 versus 1.0 M☉, a factor of 3 in $M^2$), a 170 times larger radius, and a 2,400 times larger luminosity. The product $RL$ is larger by $4\times10^{5}$, which dominates entirely. The envelope is enormous, luminous and weakly bound, and all three push in the same direction.

### 5 — First dredge-up

**(a)** As the envelope expands and cools, the convection zone deepens — because cooler material is more opaque by Kramers' law, so the radiative gradient steepens and the Schwarzschild criterion is satisfied over a larger range of depth.

It reaches down to layers formerly inside the star's hydrogen-burning region on the main sequence, where CNO processing altered the composition. Convection then mixes that processed material throughout the envelope and to the surface.

**(b)** Interstellar: ~89. CNO equilibrium: ~3.5. Observed in red giants: ~20.

The intermediate value indicates partial processing: the dredged-up material is a mixture of fully CNO-processed gas (which would give 3.5) and unprocessed envelope material (which would give 89), so the observed ratio measures the mixing fraction — how much of the surface material has been through the burning region.

**(c)** ¹⁴N enhanced ~80% — nitrogen accumulates because the ¹⁴N(p,γ)¹⁵O reaction is the slowest step in the CNO cycle, so nitrogen is the bottleneck species and builds up. ¹²C reduced ~30% — converted to ¹⁴N by the same cycle. ⁷Li destroyed — lithium burns at 2.5 × 10⁶ K, far below the shell temperature, so any lithium mixed downward is destroyed.

**(d)** Because dredge-up does not carry information out — it carries material out.

The earlier result concerns photons: a photon generated in the core is absorbed and re-emitted some $10^{23}$ times, and the information it carried is erased after the first few interactions. That remains true.

Dredge-up works by convective transport of nuclei. Atoms that were physically present at $10^7$ K, and were transmuted there, are physically moved to the photosphere, where ordinary spectroscopy measures them. Nothing has to survive a random walk; the atoms are simply carried.

**(e)** Technetium has no stable isotope, and the relevant isotope has a half-life of order $10^5$ years — utterly negligible compared with a star's lifetime of billions.

Therefore any technetium present at the star's formation would have decayed away entirely long before we observe it. Its presence in the photosphere of an AGB star means it was manufactured inside that star and brought to the surface within the last few hundred thousand years.

The property that makes the argument work is the short half-life: it turns the detection into a clock, excluding a primordial origin absolutely rather than probabilistically. There is no alternative explanation and no model dependence — the element is there, it cannot have been there long, and it cannot have come from anywhere else.

*(This is the same logical structure as the lithium test for brown dwarfs — a categorical conclusion from a threshold rather than a measurement. Merrill's 1952 detection is the closest thing to direct observation of stellar nucleosynthesis in progress.)*

### 6 — Why the tip is sharp

**(a)** The core contracts under the weight of the envelope while remaining inert, so its density rises steeply while its temperature, although rising, cannot rise fast enough to keep the gas ideal. Electrons are compressed into a state where the Pauli exclusion principle dominates, and degeneracy pressure takes over the support.

Because degeneracy pressure does not depend on temperature, the core can be compressed without the usual heating response. Contraction continues, supported by degeneracy, and the temperature rises more slowly than it would in an ideal gas. Helium ignition is therefore postponed until the core reaches a specific mass — because in a degenerate configuration, mass determines radius, which determines the central temperature.

**(b)** About 0.47 M☉. It is nearly universal because the ignition condition is set by degenerate physics — a relation between core mass, radius and temperature that does not depend on the total mass of the star, on the envelope, or to a good approximation on the envelope's composition. Every low-mass star ignites helium at essentially the same core mass, whether its total mass is 0.8 or 2 M☉.

**(c)** The luminosity of a shell-burning star is determined almost entirely by its core mass — the core–mass–luminosity relation. The envelope simply transports what the shell produces, and the shell's temperature is set by the core's gravitational field.

Combining: core mass at ignition is universal → luminosity at ignition is universal → the RGB tip occurs at the same absolute magnitude in every low-mass population.

**(d)** Because stars cease to exist above that luminosity. A star ascending the RGB brightens steadily until it reaches the tip, at which point helium ignites and it moves rapidly to the horizontal branch at a much lower luminosity.

So in a galaxy's luminosity function there is a population of red giants extending up to $M_I = -4.05$ and essentially nothing above it — a step, not a taper. The sharpness is what makes it measurable: one fits for the position of a discontinuity rather than for the shape of a distribution.

**(e)** Because the I band (~800 nm) sits at a wavelength where two metallicity effects largely cancel: increasing metallicity makes the star cooler, shifting flux out of the band, but also increases the bolometric correction in a compensating direction.

The band is chosen empirically for this reason — in bluer bands the tip luminosity varies substantially with metallicity, and in the infrared it varies in the other direction. The I band is the sweet spot, which is a fortunate accident rather than a deep result, and is one reason the calibration deserves scrutiny.

### 7 — Two ladders that disagree

**(a)**

| | Cepheids | TRGB |
|---|---|---|
| Population | young, massive | **old, low-mass** |
| Environment | star-forming regions, spiral arms | **galaxy halos** |
| Extinction | substantial, patchy | **minimal** |
| Crowding | severe | mild |

**(b)** Because they share almost no systematics. They use different stars (young massive versus old low-mass), found in different parts of a galaxy (dusty disc versus clean halo), calibrated by different physics (a pulsation period–luminosity relation versus a degenerate ignition threshold), and affected differently by extinction and crowding.

An error in the Cepheid period–luminosity zero point cannot propagate into the TRGB calibration, and vice versa. This is the disjoint-failure-mode standard applied throughout this course.

**(c)** Cepheid-calibrated: $H_0 \approx 73$. TRGB-calibrated: ~69–70. Planck CMB: 67.4. The Cepheid value disagrees with the CMB at high significance — several standard deviations depending on the analysis. The TRGB value sits between them, closer to the CMB, and its disagreement with the CMB is marginal.

**(d)** Because the CMB value is inferred rather than measured directly: it is what the standard cosmological model predicts for the present expansion rate, given the early-universe conditions Planck measured. The local values are measured at low redshift.

A robust disagreement between them therefore means the model connecting the two epochs is incomplete — new physics between recombination and now. But the local value depends on the distance ladder, whose second rung is calibrated by either Cepheids or the TRGB. If the TRGB is right, the tension is much reduced and may not require new physics. If Cepheids are right, it probably does.

**(e)** It usually indicates an unrecognised systematic in one analysis or the other — a correction that has not been applied, or has been applied differently, or an assumption that differs between the two groups and has not been identified as an assumption.

It does not indicate that either team is careless, nor that the disagreement can be resolved by taking an average, nor that more data of the same kind will settle it. Both groups have added data for years without convergence, which is itself evidence that the problem is systematic rather than statistical.

*(This is the same structure as the solar neutrino problem: two well-executed measurements disagreeing, resolved eventually not by more precision but by a differently designed measurement.)*

**(f)** The tip-fitting method — the tip is not perfectly sharp, and locating it requires fitting an edge in a noisy luminosity function; different edge-detection algorithms give systematically different answers at the level that matters.

The zero-point calibration — $M_I = -4.05$ must itself be established from a population at known distance, typically the Large Magellanic Cloud via detached eclipsing binaries, or via geometric parallaxes, and any error there propagates directly.

*(Also creditable: metallicity corrections; contamination of the halo sample by AGB stars, which lie just above the RGB tip; and crowding in the more distant calibrating galaxies.)*

### 8 — Numerical

**(a)** $T_c \propto \mu M/R$, so at fixed $T_c$ and $M$, $R \propto \mu$. With $\mu$ rising from 0.6 to 1.34: $R_{\text{new}}/R_{\text{old}} = 0.6/1.34 = 0.448$, so the core must contract by a factor of 2.2.

**(b)** $R = \sqrt{1000(3.828\times10^{26})/[4\pi(5.670\times10^{-8})(4000)^4]} = 4.58\times10^{10}$ m $= 66\,R_\odot = 0.31$ AU.

**(c)** $\rho = 1.989\times10^{30}/[\tfrac{4}{3}\pi(4.58\times10^{10})^3] = 4.9\times10^{-3}$ kg/m³. Compared with air at sea level: $4.9\times10^{-3}/1.2 = 0.004$ — about 1/240 of air's density.

**(d)** A red giant's envelope is a better vacuum than most of what we call vacuum on Earth. Its mean density is a few thousandths of air's, and the outer layers are far thinner still — comparable to a laboratory rough vacuum.

The word "star" suggests something dense and substantial. Most of a red giant's volume is emptier than the air in a room, and its mass is concentrated in a core smaller than the Earth. The object is almost entirely nothing, arranged around a very small something — which is the physical basis for the envelope's near-detachment.

### 9 — Open problem: what actually causes the expansion?

**(a)** It means that every calculation produces the result and no one can say concisely why. Independent stellar evolution codes, using different numerical schemes, opacities and equations of state, all yield envelope expansion when the core contracts — so the result is not an artefact. But no short chain of physical reasoning from first principles is agreed to produce it.

Uncomfortable because it means the field can predict the phenomenon without understanding it, and that is a fragile position: one cannot tell in advance when the result will generalise, cannot identify which physical input is responsible, and cannot easily diagnose why a calculation fails when it does.

**(b)** The energy-balance argument — the shell's enormous luminosity, radiated at the Hayashi temperature, requires a large radius. Accounts for the magnitude of the radius given the luminosity; does not account for why the envelope adopts a low-$T_{\text{eff}}$ configuration rather than a compact hot one, since it assumes the outcome it is meant to explain.

The mirror/pressure argument — as the core contracts, conditions at the base of the envelope change in a way that forces expansion. Accounts for the tight anticorrelation between core and envelope radius seen in models; does not account for the sign from first principles, since different formulations have been shown to give opposite conclusions depending on how the boundary is defined.

**(c)** Because the simulation contains the physics; it does not isolate it. A code integrating the full structure equations reproduces the phenomenon because the phenomenon is a consequence of those equations — but it does not tell you which term is responsible, or what would have to change for the result to reverse.

Reproducing is not explaining. An explanation identifies the minimal set of physical ingredients that force the result, and would predict the outcome in a case not yet computed.

**(d)** Perform controlled numerical experiments in which individual physical inputs are artificially switched off or modified, and identify which are necessary.

Specifically: run a sequence of models suppressing the opacity's temperature dependence, holding $\kappa$ constant so H⁻ cannot pin the surface temperature; the shell's temperature sensitivity, replacing $\epsilon \propto T^{17}$ with a shallower law; and convection in the envelope, forcing radiative transport. If the expansion survives with an ingredient removed, that ingredient is not the cause; if it disappears, it is necessary.

This is a numerical experiment rather than an observation, but it is the right kind — it discriminates between accounts rather than merely reproducing the phenomenon.

**(e)** Convection — observed directly as granulation, reproduced in three-dimensional simulations, and still handled in evolutionary models by a one-parameter recipe from 1958 with no derivation.

*(Also creditable: the universality of the initial mass function; and disk accretion, where the transport rate is measured and the mechanism is not settled.)*$astroRGB_master$,
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
