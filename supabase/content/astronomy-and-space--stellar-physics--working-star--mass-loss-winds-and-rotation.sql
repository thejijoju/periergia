-- Astronomy & Space · Stellar Physics — The Working Star —
-- "Mass Loss, Winds and Rotation". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/working-star/mass-loss-winds-and-rotation
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The chapter that closes The Working Star by removing the closed-system
-- assumption the preceding four rested on: Eta Carinae ejecting 10-45 solar
-- masses in twenty years and surviving, at a rate fourteen orders of
-- magnitude above the Sun's, from an event nobody can explain; mass-loss
-- rates spanning eleven orders of magnitude, costing the Sun 0.01% of
-- itself and a 20-solar-mass star 93%; radiative driving at the
-- single-scattering limit and why the momentum is transferred by millions
-- of ultraviolet metal lines rather than by grey electron scattering, with
-- the Doppler amplification that shifts saturated lines into fresh
-- continuum; the resulting Mdot proportional to Z^0.7, so a metal-poor
-- massive star cannot shed its envelope and therefore keeps its mass
-- (heavier black holes, as gravitational-wave detections favour), its
-- angular momentum (long gamma-ray bursts) and its hydrogen (supernova
-- type); rotation as an effective second parameter, with mixing, gravity
-- darkening, decretion discs and the absence of magnetic braking above
-- 1.3 solar masses; and the closing qualification that initial mass governs
-- the life while the mass remaining governs the death.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/working-star/mass-loss-winds-and-rotation',
    'research',
    'advanced',
    'read',
    $astroMassLoss_master$> Four chapters have treated a star as a closed system of fixed mass — balancing a fixed $M$ against a fixed $R$, relating $L$ to $M$ as though $M$ were a constant, dividing a fixed fuel supply by a burn rate. None of that is true, and the error is not small. The Sun loses about four million tonnes a second, which over its whole main-sequence life amounts to roughly 0.01%, which is why the approximation survives for solar-type stars. But mass-loss rates across the stellar population span eleven orders of magnitude, and at the top of the range a star can shed most of itself before it dies. The mass that determines how a star dies is not the mass it was born with.

## The star that survived its own explosion

Between about 1837 and 1856, a southern star called Eta Carinae brightened until it was the second-brightest object in the night sky after Sirius. It stayed that way for years, then faded back to invisibility.

It was called the Great Eruption, and for a long time nobody knew what it was. It was too bright and too long-lived for an ordinary nova, and far too faint for a supernova — but it released, by later estimate, roughly $10^{49}$ joules, about a tenth of a typical supernova's kinetic energy.

And the star is still there.

What surrounds it now is the Homunculus Nebula: two lobes of dusty gas expanding at several hundred kilometres per second, containing somewhere between 10 and 45 solar masses of ejected material. Ten to forty-five solar masses, expelled in about twenty years, by a star that survived.

$$\dot{M} \sim \frac{20\,M_\odot}{20\ \text{yr}} \sim 1\ M_\odot\ \text{per year}$$

For comparison, the Sun's mass-loss rate is $2\times10^{-14}\,M_\odot$/yr. Eta Carinae's eruption exceeded it by fourteen orders of magnitude. The star lost more mass in two decades than the Sun contains, and continued to exist. Its current mass is uncertain — plausibly 90 to 100 M☉, possibly in a binary — and its eventual fate is unknown precisely because we do not know how much of it will be left.

{{image: Eta Carinae | The Homunculus Nebula surrounding Eta Carinae: two dusty lobes containing between ten and forty-five solar masses, ejected over roughly twenty years during the Great Eruption of the 1840s — by a star that survived the event and is still there.}}

It opens this chapter because it makes a point that a table of mass-loss rates cannot. Mass is not a fixed property of a star. It is a quantity that evolves, sometimes catastrophically, and the evolution is not always steady: Eta Carinae's eruption was not a wind but an event, and nobody can currently say what triggered it or whether it will happen again. And the uncertainty propagates. Whether Eta Carinae ends as a neutron star or a black hole, and whether it produces a supernova visible from Earth, depends entirely on how much mass it loses between now and then. That is not a detail of the calculation; it is the whole calculation.

## The range

Mass loss is not one phenomenon. The rates and mechanisms differ enormously:

| Object | $\dot{M}$ (M☉/yr) | Mechanism |
|---|---|---|
| **Sun** | 2 × 10⁻¹⁴ | thermally driven coronal wind |
| Red giant (RGB) | 10⁻⁸ | cool, slow, weakly driven |
| **AGB star** | **10⁻⁵** | **dust-driven superwind** |
| O star (main sequence) | 10⁻⁶ | radiatively driven, ~2,000 km/s |
| Wolf–Rayet | 10⁻⁵ | radiatively driven, stripped core exposed |
| **Luminous blue variable** | **up to 10⁻³** | **eruptive; mechanism unknown** |

Eleven orders of magnitude, and the fraction of a star's mass this removes over a lifetime varies accordingly: about 0.01% for the Sun across its whole main sequence, some 7% for a 60 M☉ O star, roughly 45% for a 1 M☉ star on the asymptotic giant branch, and about 93% for a 20 M☉ star over its whole life.

Two things follow immediately. The closed-system approximation is excellent for the Sun and catastrophic for a massive star — the four preceding chapters are not wrong, they are correct in the regime they were applied to and increasingly wrong outside it. And most of a star is returned to the interstellar medium: a 20 M☉ star ends as a ~1.4 M☉ neutron star, so 93% of it goes back into the gas, enriched with the elements it manufactured. Stars are not, in the main, permanent objects; they are processing plants that briefly hold material and then release most of it.

## How radiation pushes

For hot, luminous stars the mechanism is understood, and it is a nice piece of physics.

Radiation carries momentum. A luminosity $L$ carries momentum away at a rate $L/c$, and if that momentum is transferred to the gas, it can drive an outflow. Compare with the momentum flux of the observed wind, $\dot{M}v_\infty$:

| $M/M_\odot$ | $L/L_\odot$ | $L/c$ (N) | $\dot{M}v_\infty$ (N) | Ratio |
|---|---|---|---|---|
| 1 | 1 | 1.3 × 10¹⁸ | 5.0 × 10¹⁴ | **0.0004** |
| 20 | 4 × 10⁴ | 5.1 × 10²² | 1.3 × 10²² | 0.25 |
| **60** | 10⁶ | 1.3 × 10²⁴ | **1.6 × 10²⁴** | **1.2** |

For massive stars, the wind momentum is comparable to the total photon momentum — meaning essentially every photon leaving the star transfers its momentum to the gas on the way out. This is the single-scattering limit, and it is a natural ceiling: each photon can only give up its momentum once. Some Wolf–Rayet winds exceed it, which requires photons to be scattered multiple times before escaping — an efficiency that took considerable work to demonstrate was possible.

For the Sun, the ratio is $4\times10^{-4}$: radiation is nowhere near driving the solar wind, which is instead thermally driven, expanding because the corona is at $10^6$ K and cannot be gravitationally bound at that temperature.

### Line driving

Now the crucial detail. The momentum is not transferred by electron scattering, which is grey — equally effective at all wavelengths and far too weak to matter. It is transferred by absorption lines, and specifically by the millions of ultraviolet transitions of partially ionised metals: iron, carbon, nitrogen, oxygen. Each line is enormously more opaque than the continuum at its own wavelength, so a photon at that wavelength is absorbed and re-emitted in a random direction, transferring its outward momentum to the ion.

There is a beautiful amplification. As the gas accelerates outward, each layer is Doppler-shifted relative to the one below it, so a line that was saturated at one velocity moves into fresh, unabsorbed continuum. The acceleration exposes new photons to absorb, which drives further acceleration — a runaway that produces the observed velocities of 1,000–3,000 km/s.

{{image: Wolf-Rayet star | A Wolf-Rayet star and its wind-blown nebula: the stripped, exposed core of a massive star driving an outflow so dense that photons are scattered several times before escaping, pushing the wind past the single-scattering limit that a single momentum transfer per photon would impose.}}

## Why metallicity decides

Here is the consequence that reaches furthest, and it follows directly from line driving. Line driving requires lines. Lines require metals. Hydrogen and helium have very few ultraviolet transitions; iron alone has millions.

The empirical scaling is roughly $\dot{M} \propto Z^{0.7}$, so a star in the Small Magellanic Cloud at $0.2\,Z_\odot$ loses mass at about a third the solar-metallicity rate, and near-primordial gas at $10^{-4}\,Z_\odot$ gives roughly 1/600 of it. A metal-poor massive star cannot shed its envelope.

The consequences are large enough to be worth listing, because each connects to something outside this sub-block.

**It keeps its mass.** So a metal-poor star arrives at the end of its life much more massive than a metal-rich one of the same initial mass, and therefore forms a more massive remnant. This is why the black holes detected by gravitational-wave observatories are often more massive than expected from local stellar populations: they formed from metal-poor progenitors.

**It keeps its angular momentum.** Mass loss carries away angular momentum with a large lever arm, so a star that does not lose mass does not spin down. A rapidly rotating core at collapse is the leading requirement for a long gamma-ray burst — which is why they occur preferentially in low-metallicity galaxies.

**And it retains its hydrogen envelope**, which determines the type of supernova it produces. A star stripped of hydrogen gives a Type Ib or Ic; one retaining it gives a Type II.

Metallicity, a compositional detail, determines the remnant mass, the spin, the supernova type and the possibility of a gamma-ray burst.

## Rotation

The other omitted variable, and it matters for massive stars specifically.

Stars above about 1.3 M☉ have convective cores and radiative envelopes. A dynamo requires a convecting envelope; without one there is no large-scale surface field, no magnetised wind, and therefore no magnetic braking. The Sun has been braked from a rotation period of days to 25 days; a massive star never is.

| Star | $v_{\text{rot}}$ | Fraction of break-up |
|---|---|---|
| Sun | 2 km/s | 0.005 |
| **O star** | **~200 km/s** | **0.3–0.5** |
| **Be star** | **~350 km/s** | near critical |

A 20 M☉ star of 7 $R_\odot$ has a break-up velocity of about 740 km/s, so an O star rotating at 200 km/s is at a substantial fraction of it. Be stars rotate near enough to critical that material is flung off the equator, forming a decretion disc — an outflowing disc, the exact opposite of the accretion discs of star formation, with both the direction of angular momentum transport and the sign of the mass flow reversed.

Rotation does four things. **Rotational mixing**: a rotating star develops circulation currents that transport material between core and envelope even where convection does not, bringing fresh hydrogen into the core — extending the lifetime, much as a larger convective core would — and helium and nitrogen to the surface, which is directly observable as an abundance anomaly and is one of the main tests of rotating models. **Gravity darkening**: a rapidly rotating star is oblate, so the effective gravity is lower at the equator, and since local flux scales with local gravity the poles are hotter and brighter than the equator — von Zeipel's theorem. A rapid rotator therefore looks different depending on the angle it is viewed from, so two identical stars can be assigned different spectral types. **Enhanced mass loss**, since the equator is closer to break-up and less additional force is needed to remove material there. And **angular momentum retention**, which is what determines whether the eventual collapse can produce a gamma-ray burst.

Rotation is effectively a second parameter alongside mass, and modern stellar evolution codes treat it as one — computing grids as functions of mass, metallicity and initial rotation rate.

## What the thesis actually means

Now the closing argument for this sub-block, and it is a qualification rather than a retraction.

The thesis has been that a star's entire biography is fixed at birth by one number, its mass. This chapter has shown that the mass is not fixed, and that the amount lost depends on at least three further parameters: metallicity, rotation and binarity.

| Initial mass | Final remnant | Fraction lost |
|---|---|---|
| 1 M☉ | 0.54 M☉ white dwarf | **46%** |
| 3 M☉ | 0.70 M☉ white dwarf | 77% |
| 8 M☉ | ~1.1 M☉ white dwarf | 86% |
| 20 M☉ | ~1.4 M☉ neutron star | **93%** |
| 40 M☉ | black hole *or* neutron star | **depends on metallicity** |

Note the last row. Two stars of identical initial mass, formed at different metallicities, can produce different classes of remnant. Take two 25 M☉ stars over 4 Myr: at solar metallicity the star loses about 4 M☉ and finishes near 21 M☉, likely a neutron star; at $0.05\,Z_\odot$ it loses about 0.5 M☉ and finishes near 24.5 M☉, likely a black hole. Identical initial masses, different classes of object.

The honest version: the main sequence is governed by initial mass, and the death is governed by the mass remaining when the fuel runs out — which depends on metallicity, rotation and whether there was a companion.

The thesis is right about the life and incomplete about the ending. Everything established about the Hertzsprung–Russell diagram and in the first four chapters here holds: a star arrives on the main sequence at a position set by its mass, sits there for 90% of its nuclear lifetime, and its luminosity, temperature, radius and lifetime follow from that one number. What the thesis does not determine is the endpoint. A refutation would show the thesis wrong where it was applied; this shows it incomplete where it was extended.

{{image: Planetary nebula | A planetary nebula: the ejected envelope of a low-mass star, ionised by the exposed hot core at its centre. Mass loss, not exhaustion of fuel, ends the asymptotic giant branch — the superwind strips the envelope in some 40,000 years, well inside the million-year AGB lifetime, removing the fuel before it can be burned.}}

## Pulling the thread

- Eta Carinae ejected 10–45 solar masses in about twenty years and survived — a mass-loss rate fourteen orders of magnitude above the Sun's, from an event nobody can explain. Its eventual fate is unknown because we do not know how much of it will be left.
- Mass-loss rates span eleven orders of magnitude, from $2\times10^{-14}$ M☉/yr for the Sun to $10^{-3}$ for a luminous blue variable. The closed-system approximation of the previous four chapters costs the Sun 0.01% of its mass and a 20 M☉ star 93% of its.
- Most of a star is returned to the interstellar medium, enriched. Stars are processing plants that briefly hold material, not permanent objects.
- For massive stars, the wind momentum is comparable to $L/c$ — every photon transfers its momentum on the way out, at the single-scattering limit, and some Wolf–Rayet winds exceed it by scattering photons several times. The Sun's ratio is $4\times10^{-4}$; its wind is thermally driven instead.
- The driving is by absorption lines, not electron scattering, with a Doppler amplification: as the gas accelerates, saturated lines shift into fresh continuum, exposing new photons to absorb.
- Hence $\dot{M} \propto Z^{0.7}$, and a metal-poor massive star cannot shed its envelope. It keeps its mass (making more massive black holes, which is why gravitational-wave detections favour metal-poor progenitors), its angular momentum (permitting long gamma-ray bursts, which favour low-metallicity galaxies), and its hydrogen envelope (determining the supernova type). A compositional detail decides the remnant, the spin, the explosion type and the burst.
- Massive stars rotate fast — 200 km/s against a 740 km/s break-up, versus the Sun's 2 km/s — because they have no convective envelope, hence no dynamo, hence no braking. Rotation produces mixing (extending lifetimes and altering surface abundances), gravity darkening, enhanced equatorial mass loss, and angular momentum retention.
- And a 1 M☉ star ends as a 0.54 M☉ white dwarf while a 20 M☉ star ends as a 1.4 M☉ neutron star. Two 25 M☉ stars at different metallicities can end as different classes of object. The thesis is right about the life and incomplete about the ending.

Five chapters ago this sub-block asked what a star is while it sits on the main sequence for 90% of its life. The answer: a self-gravitating gas sphere whose internal temperature is set by gravity, whose energy source is a quantum-tunnelling reaction limited by the weak interaction, whose luminosity is set by how fast energy can leak through opaque material, and which is held in a balance so precise that it has survived eighty trillion free-fall times — by a thermostat whose sensitivity is itself a consequence of tunnelling. We know this because neutrinos and acoustic oscillations reach the interior with disjoint failure modes and agree, to 1% and 0.1% respectively, and we know the model is not complete, because at 0.1% precision it currently disagrees with itself. And the star is leaking. Which is where stellar death begins.

## Further reading

A systematic treatment of the physics of stellar winds — radiative line driving, the single-scattering limit, dust-driven AGB superwinds and the thermally driven solar wind — is given in {{book: Henny J. G. L. M. Lamers and Joseph P. Cassinelli | Introduction to Stellar Winds | 1999}}.

- **Henny J. G. L. M. Lamers and Joseph P. Cassinelli, *Introduction to Stellar Winds* (1999).** The standard graduate text on the subject, covering Parker's thermally driven solar wind, the CAK theory of radiatively driven winds and its line-driving instability, the momentum problem in Wolf–Rayet stars, dust-driven winds on the asymptotic giant branch, and the observational diagnostics from which mass-loss rates are inferred.

## Problems

*Data: $M_\odot = 1.989\times10^{30}$ kg, $L_\odot = 3.828\times10^{26}$ W, $R_\odot = 6.957\times10^{8}$ m, $G = 6.674\times10^{-11}$, $c = 2.998\times10^{8}$ m/s, 1 yr = 3.156 × 10⁷ s. Solar $\dot{M} = 2\times10^{-14}\,M_\odot$/yr. Radiative driving: $\dot{M} \propto Z^{0.7}$. Wind momentum $\dot{M}v_\infty$; photon momentum flux $L/c$.*

### 1 — A star that survived its own explosion
**(a)** Describe the Great Eruption: dates, apparent brightness, energy released, and what remains.
**(b)** Estimate the mass-loss rate during the eruption and express it as a multiple of the Sun's.
**(c)** Explain why Eta Carinae's eventual fate is currently unpredictable, and what would have to be known to predict it.
**(d)** State what the episode demonstrates that a table of steady mass-loss rates cannot.

### 2 — The range
**(a)** Tabulate mass-loss rates for the Sun, an AGB star, an O star and a luminous blue variable, with the mechanism for each.
**(b)** Compute the fraction of its mass the Sun loses over a 10 Gyr main-sequence lifetime. Comment on the four preceding chapters.
**(c)** Compute the fraction lost by a 60 M☉ star at $10^{-6}\,M_\odot$/yr over 4 Myr.
**(d)** A 20 M☉ star ends as a 1.4 M☉ neutron star. Compute the fraction returned to the interstellar medium.
**(e)** State, in one sentence, what (d) implies about the role of stars in galactic chemical evolution.

### 3 — How radiation pushes *(the central calculation)*
**(a)** Explain why a luminosity $L$ carries momentum at a rate $L/c$.
**(b)** Compute $L/c$ for a 60 M☉ star with $L = 10^{6}L_\odot$.
**(c)** Compute the wind momentum flux $\dot{M}v_\infty$ for $\dot{M} = 10^{-5}\,M_\odot$/yr and $v_\infty = 2{,}500$ km/s. Take the ratio to (b).
**(d)** Define the single-scattering limit and explain why it is a natural ceiling.
**(e)** Repeat (b) and (c) for the Sun ($\dot{M} = 2\times10^{-14}$, $v = 400$ km/s). State what the ratio implies about the driving mechanism, and name the actual one.
**(f)** Explain why the driving is by absorption lines rather than electron scattering.
**(g)** Describe the Doppler amplification and explain why it produces a runaway.

### 4 — Metallicity *(the consequence that reaches furthest)*
**(a)** Explain why line driving depends on metallicity, referring to the number of available transitions.
**(b)** Using $\dot{M} \propto Z^{0.7}$, compute the relative rate for the SMC ($Z = 0.2Z_\odot$) and for near-primordial gas ($Z = 10^{-4}Z_\odot$).
**(c)** State the three things a metal-poor massive star retains, and give the observational consequence of each.
**(d)** Explain why gravitational-wave detections of massive black hole binaries point to metal-poor progenitors.
**(e)** Explain why long gamma-ray bursts occur preferentially in low-metallicity galaxies.
**(f)** Explain how metallicity determines the supernova type.

### 5 — Rotation
**(a)** Explain why massive stars are rapid rotators and the Sun is not, naming the structural difference responsible.
**(b)** Compute the break-up velocity for a 20 M☉ star of radius 7 $R_\odot$, and express an O star's 200 km/s as a fraction of it.
**(c)** Describe rotational mixing and give two observable consequences.
**(d)** State von Zeipel's theorem and explain why it complicates spectral classification.
**(e)** Explain why Be stars form decretion discs, and contrast with accretion discs.
**(f)** Explain why rotation is described as "effectively a second parameter alongside mass."

### 6 — The thesis, qualified
**(a)** State the sub-block's thesis and the two ways this chapter qualifies it.
**(b)** Using the initial–final mass relation, compute the fraction of its mass lost by a 1 M☉ star and by a 20 M☉ star.
**(c)** Two 25 M☉ stars form at $Z_\odot$ and at $0.05Z_\odot$. Compute the mass each loses over 4 Myr at $\dot{M} = 10^{-6}(Z/Z_\odot)^{0.7}$, and state the likely remnant of each.
**(d)** State the honest version of the thesis in one sentence, distinguishing what initial mass does and does not determine.
**(e)** Explain why this is a qualification rather than a refutation, listing what still holds.

### 7 — Numerical
**(a)** The Sun loses $4.26\times10^{9}$ kg/s to radiation ($L/c^2$) and about $1.3\times10^{9}$ kg/s to the solar wind. Compute the total fractional mass loss over 4.57 Gyr.
**(b)** An AGB star of 1 M☉ has a core of 0.6 M☉ and loses mass at $10^{-5}\,M_\odot$/yr. How long to remove the envelope?
**(c)** Compare (b) with the AGB lifetime of ~1 Myr and comment.
**(d)** A Wolf–Rayet star has $\dot{M}v_\infty/(L/c) = 3$. Explain what this requires physically.

### 8 — Winds as feedback
Stellar winds inject energy and momentum into the interstellar medium.
**(a)** Compute the kinetic energy carried by a 60 M☉ star's wind over 4 Myr at $\dot{M} = 10^{-5}\,M_\odot$/yr and $v = 2{,}500$ km/s.
**(b)** Compare with a typical supernova kinetic energy of $10^{44}$ J.
**(c)** Explain why winds matter for star formation.
**(d)** Explain why wind feedback is metallicity-dependent and what that implies for star formation in the early universe.

### 9 — Open problem: how much mass is actually lost?
Mass-loss rates are among the largest uncertainties in stellar evolution.
**(a)** Explain why $\dot{M}$ is hard to measure observationally. Name two methods and state why they disagree.
**(b)** Explain what "clumping" is and why it caused published rates to be revised downward by factors of several.
**(c)** State three results that would change if massive-star mass-loss rates were a factor of three lower than assumed.
**(d)** Design an observational programme to settle the question. State what would limit you.

## Worked answers

### 1 — A star that survived its own explosion

**(a)** Between roughly 1837 and 1856, Eta Carinae brightened to become the second-brightest star in the sky after Sirius, then faded to invisibility. It released about $10^{49}$ J — roughly a tenth of a typical supernova's kinetic energy. What remains is the Homunculus Nebula, two dusty lobes expanding at several hundred km/s and containing 10–45 M☉ of ejected material. The star survived.

**(b)** $\dot{M} \sim 20\,M_\odot/20\ \text{yr} \sim 1\ M_\odot$/yr, against the Sun's $2\times10^{-14}$ — a factor of about $5\times10^{13}$.

**(c)** Because its fate depends on the mass remaining at core collapse, and we know neither its present mass with confidence nor how much more it will lose. Whether it produces a neutron star or a black hole, and whether it explodes at all rather than collapsing directly, hinges on that number.

To predict it one would need: the current mass; the future mass-loss rate, including whether further eruptions occur; and the trigger mechanism for the eruptions, which is unknown.

**(d)** That mass loss is not always a steady wind. A table of $\dot{M}$ values implicitly assumes a continuous process that can be integrated over time. Eta Carinae's eruption was an event — decades long, orders of magnitude above any steady rate, with no established mechanism and no way to know whether it will recur.

A process that proceeds in unpredictable bursts cannot be handled by an average rate, and this is a structural limitation of stellar evolution calculations at high mass, not a detail. *(Compare episodic accretion in protostars: the same problem at the other end of a star's life.)*

### 2 — The range

**(a)**

| Object | $\dot{M}$ (M☉/yr) | Mechanism |
|---|---|---|
| Sun | 2 × 10⁻¹⁴ | thermally driven coronal wind |
| AGB star | 10⁻⁵ | dust-driven superwind |
| O star | 10⁻⁶ | radiatively driven (line driving) |
| LBV | up to 10⁻³ | eruptive; mechanism unknown |

**(b)** $2\times10^{-14} \times 10^{10} = 2\times10^{-4} = 0.02\%$.

The closed-system assumption of the four preceding chapters is excellent for the Sun — 0.02% is far below every other uncertainty in them. It becomes catastrophically wrong for massive stars, but those chapters were applied overwhelmingly to solar-type conditions and are not undermined.

**(c)** $10^{-6} \times 4\times10^{6}/60 = 6.7\%$.

**(d)** $(20 - 1.4)/20 = 93\%$.

**(e)** Stars are processing plants rather than permanent reservoirs: they hold material briefly, transmute part of it, and return the great majority — enriched in heavy elements — to the interstellar medium from which the next generation forms.

### 3 — How radiation pushes

**(a)** Because a photon of energy $E$ carries momentum $p = E/c$. A star radiating energy at rate $L$ therefore radiates momentum at rate $L/c$, and if that momentum is absorbed by the surrounding gas it exerts an outward force.

**(b)** $L/c = 10^{6}(3.828\times10^{26})/2.998\times10^{8} = 1.28\times10^{24}$ N.

**(c)** $\dot{M} = 10^{-5}(1.989\times10^{30})/3.156\times10^{7} = 6.30\times10^{17}$ kg/s. $\dot{M}v_\infty = (6.30\times10^{17})(2.5\times10^{6}) = 1.58\times10^{24}$ N. Ratio: 1.23.

**(d)** The single-scattering limit is $\dot{M}v_\infty = L/c$ — the condition in which every photon leaving the star transfers its full momentum to the wind exactly once.

It is a natural ceiling because a photon absorbed and re-emitted delivers its momentum and is then gone; to exceed the limit, photons must be scattered more than once before escaping, which requires the wind to be optically thick to the driving lines over an extended region. That is possible — some Wolf–Rayet winds have ratios of 3 or more — but it demands a much more efficient geometry and took considerable theoretical work to establish.

**(e)** Sun: $L/c = 1.28\times10^{18}$ N; $\dot{M}v = (1.26\times10^{9})(4\times10^{5}) = 5.0\times10^{14}$ N. Ratio $= 4.0\times10^{-4}$.

Radiation is nowhere near capable of driving the solar wind — it falls short by a factor of 2,500. The actual mechanism is thermal driving: the corona is at ~$10^6$ K, and at that temperature the thermal energy of the gas at large radii exceeds its gravitational binding, so the atmosphere cannot remain in hydrostatic equilibrium and expands. *(This is Parker's 1958 result, initially disbelieved and confirmed by Mariner 2 in 1962.)*

**(f)** Because electron scattering is grey — the Thomson cross-section is the same at all wavelengths and is far too small to transfer the required momentum.

Absorption lines are enormously more opaque at their own wavelengths: a strong ultraviolet resonance line can have an opacity thousands of times the continuum value. And metals supply millions of such lines — iron alone dominates the ultraviolet with an effectively continuous forest, while hydrogen and helium have only a handful of transitions in the relevant range. The driving is a resonance phenomenon, and that is why composition matters.

**(g)** As gas accelerates outward, each layer moves faster than the one below it, so the absorption lines in that layer are Doppler-shifted relative to the spectrum arriving from beneath. A line that has already absorbed all the photons at its rest wavelength — saturated — is therefore shifted into fresh, unabsorbed continuum at a slightly different wavelength, where photons are still available.

Acceleration exposes new photons, which drives further acceleration. The feedback is positive, and it is what allows the wind to reach 1,000–3,000 km/s rather than stalling once the near-surface lines saturate.

### 4 — Metallicity

**(a)** Because the driving is by absorption lines, and the number and strength of ultraviolet lines available depends almost entirely on metals. Iron, carbon, nitrogen and oxygen in partially ionised states have millions of transitions in the ultraviolet; hydrogen and helium have very few, and at the relevant temperatures are largely ionised. Remove the metals and you remove the mechanism.

**(b)** SMC: $(0.2)^{0.7} = 0.32$ — about a third the solar rate. Near-primordial: $(10^{-4})^{0.7} = 0.0016$ — about 1/600 of the solar rate.

**(c)** Its mass → a more massive remnant, hence more massive black holes. Its angular momentum → a rapidly rotating core at collapse, permitting a long gamma-ray burst. Its hydrogen envelope → a Type II rather than a Type Ib/Ic supernova.

**(d)** Because the black hole masses inferred from gravitational-wave mergers are frequently larger than expected from stars forming at solar metallicity, where mass loss strips a substantial fraction of the progenitor before collapse. A metal-poor progenitor retains its mass, so it collapses to a heavier remnant. The observed mass distribution therefore points to formation in low-metallicity environments — early in cosmic history, or in metal-poor dwarf galaxies.

**(e)** Because a long gamma-ray burst requires the collapsing core to retain enough angular momentum to form an accretion disc around the newly formed black hole — the disc powers the relativistic jet.

Mass loss removes angular momentum with a large lever arm, so a metal-rich star spins down before collapse. A metal-poor star does not. Hence the observed preference of long GRBs for low-metallicity host galaxies, one of the clearest environmental correlations in transient astronomy.

**(f)** Because the supernova type is defined observationally by what is in the spectrum. A star that retains its hydrogen envelope produces hydrogen lines: Type II. One stripped of hydrogen produces Type Ib; stripped of hydrogen and helium, Type Ic.

Stripping is achieved by mass loss, or by a binary companion, and mass loss scales with metallicity. So a compositional parameter determines a spectroscopic classification made at the moment of death.

### 5 — Rotation

**(a)** Because braking requires a magnetised wind, which requires a dynamo, which requires a convective envelope — and stars above ~1.3 M☉ have convective cores and radiative envelopes.

With no near-surface convection there is no large-scale field, no magnetically coupled wind, and therefore no mechanism to shed angular momentum. Massive stars remain rapid rotators for their whole lives, while the Sun has been braked from a period of days to 25 days.

**(b)** $v_{break} = \sqrt{GM/R} = \sqrt{(6.674\times10^{-11})(20 \times 1.989\times10^{30})/(7 \times 6.957\times10^{8})} = 738$ km/s. $200/738 = 0.27$ — an O star rotates at about 27% of break-up.

**(c)** Rotational mixing is the transport of material by circulation currents driven by rotation (meridional circulation and shear instabilities), operating in regions that are not convective.

Two observable consequences: surface nitrogen and helium enhancement, as material processed by the CNO cycle in the core is brought to the surface — directly measurable spectroscopically and one of the main tests of rotating models. And extended main-sequence lifetimes, since fresh hydrogen is mixed into the core, increasing the burnable fuel fraction much as a larger convective core would.

**(d)** Von Zeipel's theorem: in a rotating star, the radiative flux at the surface is proportional to the local effective gravity.

A rapid rotator is oblate, so the effective gravity (gravity minus centrifugal) is lower at the equator than at the poles. Hence the poles are hotter and brighter; the equator is cooler and dimmer — gravity darkening.

It complicates classification because the observed spectrum is a weighted average over the visible hemisphere, and that average depends on the viewing angle. A star seen pole-on looks hotter than the same star seen equator-on, so two identical stars can be assigned different spectral types.

**(e)** Because a Be star rotates near critical, so the effective gravity at the equator is nearly zero and very little additional force suffices to lift material off. The ejected material has enough angular momentum to remain in orbit, forming a disc.

Contrast with an accretion disc: there, material is falling inward and the disc exists because it must shed angular momentum before it can reach the star. A decretion disc contains material flowing outward, having been given angular momentum by the star. The direction of angular momentum transport is reversed — and so is the sign of the mass flow.

**(f)** Because the Vogt–Russell claim — that structure is determined by mass and composition — explicitly neglects rotation, and for massive stars that neglect is not small.

Rotation changes the structure (through centrifugal support and gravity darkening), the composition profile (through mixing), the lifetime (through fuel supply), the mass-loss rate (through reduced equatorial gravity), and the endpoint (through angular momentum retention). A model without rotation gets a different answer for all of these, so modern evolutionary grids are computed as functions of mass, metallicity and initial rotation rate.

### 6 — The thesis, qualified

**(a)** Thesis: a star's entire biography is fixed at birth by one number, its mass.

Two qualifications: the mass is not constant — a massive star may lose 90% of it — and the amount lost depends on further parameters: metallicity (through line driving), rotation (through mixing and enhanced equatorial loss), and binarity (through Roche-lobe overflow).

**(b)** 1 M☉ → 0.54 M☉: $(1-0.54)/1 = 46\%$. 20 M☉ → 1.4 M☉: $(20-1.4)/20 = 93\%$.

**(c)** With $\dot{M} = 10^{-6}(Z/Z_\odot)^{0.7}$:

| | $Z_\odot$ | $0.05Z_\odot$ |
|---|---|---|
| $\dot{M}$ | 1.0 × 10⁻⁶ | 1.23 × 10⁻⁷ |
| Lost over 4 Myr | **4.0 M☉** | **0.49 M☉** |
| Final mass | ~21 M☉ | ~24.5 M☉ |
| Likely remnant | **neutron star** | **black hole** |

Identical initial masses, different classes of remnant.

**(d)** The main sequence is governed by initial mass; the death is governed by the mass remaining when the fuel runs out — which depends on metallicity, rotation and binarity.

Initial mass determines: position on the main sequence, luminosity, effective temperature, radius, internal structure, main-sequence lifetime, and which nuclear cycle dominates. Initial mass does not determine: the final mass, the remnant type, the supernova classification, or whether a gamma-ray burst occurs.

**(e)** Because everything established about the Hertzsprung–Russell diagram and in the first four chapters here still holds. A star arrives at a main-sequence position set by its mass; $L \propto M^{3.5}$; $t \propto M^{-2.5}$; the structure, radiative or convective, is set by mass; and it stays there for 90% of its nuclear lifetime.

The qualification applies to the endpoint, not the life — and it applies most strongly at high mass, where the mass loss is large. For a solar-type star, the thesis is essentially exact until the asymptotic giant branch. A refutation would show the thesis wrong where it was applied; this shows it incomplete where it was extended.

### 7 — Numerical

**(a)** Total rate $= 4.26\times10^{9} + 1.3\times10^{9} = 5.56\times10^{9}$ kg/s. Over 4.57 Gyr $= 1.44\times10^{17}$ s: $\Delta M = 8.01\times10^{26}$ kg, so $\Delta M/M_\odot = 0.040\%$.

**(b)** Envelope mass $= 1 - 0.6 = 0.4\,M_\odot$; at $10^{-5}\,M_\odot$/yr: $t = 40{,}000$ yr.

**(c)** The AGB lifetime is ~1 Myr, so the envelope can be removed in about 4% of the available time.

Mass loss, not nuclear burning, terminates the asymptotic giant branch. The star does not run out of fuel; it runs out of envelope. Once the envelope is gone the hot core is exposed, ionises the ejected material, and the object becomes a planetary nebula with a white dwarf at its centre. This is why a 1 M☉ star ends as a 0.54 M☉ white dwarf rather than burning further — the superwind removes the fuel before it can be used, and it is the single most important process in low-mass stellar death.

**(d)** That each photon transfers its momentum to the wind on average three times before escaping — the wind must be optically thick to the driving lines over an extended region, so a photon absorbed and re-emitted is re-absorbed further out rather than escaping.

Physically this requires a very dense, highly ionised wind with a large number of overlapping lines at successive Doppler shifts, so that the outflow is effectively opaque across a broad wavelength range. It is why Wolf–Rayet mass-loss rates were once thought impossible, and establishing that multiple scattering could achieve them was a significant result.

### 8 — Winds as feedback

**(a)** Mass ejected: $10^{-5} \times 4\times10^{6} = 40\,M_\odot = 7.96\times10^{31}$ kg.

$$E = \tfrac{1}{2}mv^2 = \tfrac{1}{2}(7.96\times10^{31})(2.5\times10^{6})^2 = 2.5\times10^{44}\ \text{J}$$

**(b)** A supernova releases ~$10^{44}$ J in kinetic energy, so the wind delivers about 2.5 times as much — over four million years rather than instantaneously. Massive stars do more mechanical work on their surroundings through winds than through their eventual explosion, though the delivery is spread out. Both matter, and the wind acts first.

**(c)** Because winds inject momentum and energy into the parent molecular cloud, heating and dispersing it — and star formation is self-terminating as a result. Star formation runs some 300 times slower than free collapse would allow, and the leading explanation is feedback: the first massive stars to form begin destroying their natal cloud within a few Myr, comparable to the free-fall time, before most of the gas can be converted into stars. Winds are one of the three feedback channels, alongside ionising radiation and supernovae.

**(d)** Because $\dot{M} \propto Z^{0.7}$, and the wind's kinetic energy scales with $\dot{M}$. At low metallicity the wind feedback is weaker — a near-primordial star delivers ~1/600 the mass flux.

Implication for the early universe: star formation was less efficiently self-regulated, so a larger fraction of a cloud's gas could be converted into stars before feedback dispersed it. Combined with the higher Jeans mass in metal-free gas, this supports the picture of the first stars being both very massive and formed with high efficiency — and it means the 300-fold inefficiency measured locally is not a universal constant.

### 9 — Open problem: how much mass is actually lost?

**(a)** Because $\dot{M}$ is not observed directly — it is inferred from a diagnostic that depends on the wind's density structure, and different diagnostics depend on it differently.

Two methods: Hα emission and radio continuum, which arise from free–free processes and scale as the square of the density ($\rho^2$); and ultraviolet resonance lines, whose strength scales linearly with density ($\rho$).

They disagree because the wind is not smooth. A $\rho^2$ diagnostic is biased upward by dense clumps — it measures $\langle\rho^2\rangle$, not $\langle\rho\rangle^2$ — while a linear diagnostic is not. The discrepancy is therefore a measurement of the clumping, and rates derived from the two methods can differ by factors of several.

**(b)** Clumping is small-scale density inhomogeneity in the wind, produced by an instability inherent to line driving: the same Doppler amplification that makes the driving efficient is also unstable, so the flow fragments into dense shells and shocks.

For a clumped wind, $\langle\rho^2\rangle > \langle\rho\rangle^2$, so a $\rho^2$ diagnostic overestimates the mean density and hence $\dot{M}$ by the square root of the clumping factor. Recognising this led to published rates being revised downward by factors of two to several — a substantial change in a quantity that determines stellar fates.

**(c)** The initial–final mass relation — lower $\dot{M}$ means more massive remnants across the board, shifting the boundary between neutron-star and black-hole formation to lower initial masses.

The Wolf–Rayet population — WR stars are formed by stripping, so lower rates mean fewer of them form by winds alone, and a larger fraction must be stripped by binary companions instead, changing the inferred binary fraction of massive stars.

Supernova type ratios — the relative numbers of Type II to Type Ib/Ic depend on how many progenitors lose their envelopes, so lower rates shift the predicted ratio toward Type II, which is directly testable against supernova surveys.

*(A fourth: gravitational-wave black hole masses, which depend on how much mass massive stars retain.)*

**(d)** Measure $\dot{M}$ with diagnostics of differing density dependence on the same stars, and solve for the clumping simultaneously.

What to measure: for a sample of O and Wolf–Rayet stars, obtain ultraviolet resonance lines (linear in $\rho$), Hα and radio (quadratic in $\rho$), and X-ray line profiles, which probe the wind's optical depth along the line of sight and are sensitive to the porosity of the clumping rather than its amplitude. Three diagnostics with three different density dependences over-determine the problem, allowing $\dot{M}$ and the clumping structure to be separated rather than assumed.

What limits you: the required ultraviolet spectroscopy needs a space telescope, and a successor to Hubble in that band is not assured. And the analysis remains model-dependent — the inference from line profile to density structure requires a wind model, so the result is only as good as the treatment of the instability that produces the clumps in the first place.

The honest position is that mass-loss rates carry uncertainties of a factor of a few, and that this is the dominant uncertainty in the fate of massive stars — worth stating plainly, because the outputs of stellar evolution codes are often quoted with a precision the inputs do not support.$astroMassLoss_master$,
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
