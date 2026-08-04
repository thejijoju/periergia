-- Astronomy & Space · Stellar Physics — The Working Star —
-- "Nuclear Furnaces". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/working-star/nuclear-furnaces
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The objection that classically the Sun cannot shine — protons need 1.44
-- MeV to overcome their Coulomb barrier and have on average 1.35 keV, a
-- shortfall by a factor so vast the expected number of capable protons in
-- the whole Sun is 10^-405 — and why Eddington's "find a hotter place"
-- was the wrong defence of a right conclusion; Gamow's 1928 answer that
-- protons tunnel rather than climb, the Gamow peak at ~6 keV where a
-- falling Maxwell-Boltzmann tail meets a rising tunnelling probability,
-- and why that peak's temperature sensitivity is the quantum-mechanical
-- origin of the thermostat's T^4-to-T^17 steepness; the mass defect of
-- 0.71% giving 26.7 MeV per helium nucleus; why the Sun's core is
-- energetically feebler per kilogram than a resting human body and is
-- luminous only because it is enormous; and why the Sun is slow — the
-- pp chain's first step requires the weak interaction, giving a
-- 10-billion-year-per-proton bottleneck that sets the Sun's lifetime by
-- a coupling constant rather than by its fuel supply.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/working-star/nuclear-furnaces',
    'research',
    'advanced',
    'read',
    $astroNucFurn_master$> Two protons at the centre of the Sun have, on average, about one seven-hundredth of the energy needed to overcome their mutual electrostatic repulsion — and the shortfall is not a rough estimate but a devastating one, since summed over every proton in the Sun the expected number capable of classical fusion is not small but zero, to within four hundred orders of magnitude. Classically, the Sun cannot shine. That the Sun shines anyway is the subject of this node, and the resolution turns out to explain not only how fusion happens but why the thermostat is so sensitive and why the Sun lasts as long as it does.

## The objection that was right

In 1920, Arthur Eddington proposed that stars are powered by the fusion of hydrogen into helium. Francis Aston had recently measured helium's mass and found it less than four hydrogen atoms, and Einstein had shown that a mass difference is an energy.

The physicists objected, and the objection was not vague.

### Do the arithmetic

Two protons must approach to within about 1 femtometre for the strong force to bind them. The electrostatic potential energy at that separation is

$$E_{\text{Coulomb}} = \frac{e^2}{4\pi\epsilon_0 r} = 1.44\ \text{MeV} = 1{,}440\ \text{keV}$$

The thermal energy at the Sun's centre is

$$kT = (1.381\times10^{-23})(1.57\times10^{7}) = 1.35\ \text{keV}$$

$$\frac{\text{barrier}}{\text{typical energy}} \approx 700$$

A typical proton has less than a thousandth of what it needs. But the Maxwell–Boltzmann distribution has a tail, so ask how many protons are in it:

$$e^{-E/kT} = e^{-1064}$$

The Sun contains about $10^{57}$ protons. Multiply:

$$10^{57} \times e^{-1064} \approx 10^{-405}$$

Not "few." Zero. By a margin so vast that no adjustment to the Sun's temperature, size or composition could rescue it — you would need to raise the central temperature by a factor of a hundred, which hydrostatic equilibrium forbids. Classically, the Sun cannot shine.

### Eddington's answer, and why it was wrong

Told that the Sun was not hot enough, Eddington replied that the critics should go and find a hotter place.

It is the most quoted line in the subject, and it is the wrong defence. The Sun really is that cool; the calculation above is correct, and the hydrostatic-equilibrium argument confirms the temperature independently, from gravity alone. Eddington was defending the conclusion by disputing a premise that was not in error.

He was right that fusion powers the Sun and wrong about why the objection failed. The actual answer came in 1928 from George Gamow, and it required physics that did not exist in 1920: the protons do not go over the barrier. They go through it.

> The objection was correct, the reply was wrong, and the conclusion was right. That combination is worth noticing — it is a case where the defender of a true claim understood it less well than the objectors understood their objection.

{{image: George Gamow | George Gamow, who in 1928 showed that protons need not surmount the Coulomb barrier at all but can tunnel through it quantum mechanically — the missing piece that made a correct conclusion rest on a correct argument for the first time.}}

## Through, not over

Quantum mechanics permits a particle to appear on the far side of a barrier it lacks the energy to cross. The probability is small but not zero, and it depends steeply on energy.

For two nuclei of charges $Z_1$ and $Z_2$ approaching at relative velocity $v$, the transmission probability is approximately

$$P \sim e^{-2\pi\eta}, \qquad \eta = \frac{Z_1Z_2e^2}{4\pi\epsilon_0\hbar v}$$

The quantity $\eta$ is the Sommerfeld parameter, and $e^{-2\pi\eta}$ is the Gamow factor. Evaluate for two protons:

| $E$ (keV) | $v$ (km/s) | $2\pi\eta$ | $P$ |
|---|---|---|---|
| 1.35 (thermal) | 719 | 19.1 | 5 × 10⁻⁹ |
| 2 | 875 | 15.7 | 1.5 × 10⁻⁷ |
| 5 | 1,384 | 9.9 | 4.9 × 10⁻⁵ |
| 10 | 1,957 | 7.0 | 8.9 × 10⁻⁴ |
| 20 | 2,768 | 5.0 | 7.0 × 10⁻³ |

The probability rises by six orders of magnitude between 1 and 20 keV — still far below the 1,440 keV barrier.

Note what this does to the problem. Classically the reaction requires 1,440 keV, which is unavailable. Quantum-mechanically it can occur at 5 keV with probability $10^{-5}$ — and 5 keV, while still rare, is enormously more common than 1,440 keV.

## The Gamow peak

Now the elegant part, and it is the origin of everything else in this node.

The reaction rate at a given energy is the product of two factors pulling in opposite directions: how many particles have that energy, which falls with energy as $e^{-E/kT}$; and how likely they are to tunnel, which rises with energy as $e^{-b/\sqrt{E}}$. Their product therefore has a maximum, at an energy well above $kT$ and well below the barrier.

| $E$ (keV) | Maxwell–Boltzmann | Tunnelling | Product |
|---|---|---|---|
| 1 | 4.8 × 10⁻¹ | 2.3 × 10⁻¹⁰ | 1.1 × 10⁻¹⁰ |
| 2 | 2.3 × 10⁻¹ | 1.5 × 10⁻⁷ | 3.5 × 10⁻⁸ |
| 4 | 5.2 × 10⁻² | 1.5 × 10⁻⁵ | 7.9 × 10⁻⁷ |
| **6** | **1.2 × 10⁻²** | **1.2 × 10⁻⁴** | **1.4 × 10⁻⁶** |
| 10 | 6.2 × 10⁻⁴ | 8.9 × 10⁻⁴ | 5.5 × 10⁻⁷ |
| 20 | 3.8 × 10⁻⁷ | 7.0 × 10⁻³ | 2.7 × 10⁻⁹ |

The maximum — the Gamow peak — sits at about 6.1 keV for the pp reaction at solar central temperature. That is 4.5 times $kT$, out in the tail of the Maxwell–Boltzmann distribution, and only 0.42% of the Coulomb barrier, far below what classical physics requires.

Essentially all of the Sun's fusion occurs in a narrow window of energies that is neither typical nor sufficient. Both conditions are rare: only about 1% of protons have 6 keV, and of those only about 1 in $10^4$ tunnels. The Sun runs on the tail of a tail.

### Where the steep temperature dependence comes from

This is the payoff owed to hydrostatic equilibrium, where the thermostat's sensitivity was used and never justified.

Raise the temperature and two things happen at once. The Maxwell–Boltzmann distribution shifts, putting more particles at every energy; and the Gamow peak itself moves to higher energy, where the tunnelling probability is much larger.

| $T$ (K) | Gamow peak | Rate relative to solar |
|---|---|---|
| 1.0 × 10⁷ | 4.5 keV | 0.077 |
| **1.57 × 10⁷** | **6.1 keV** | **1.00** |
| 2.0 × 10⁷ | 7.2 keV | 3.5 |
| 3.0 × 10⁷ | 9.4 keV | 24 |

A factor of two in temperature gives a factor of twenty-four in rate. Differentiating logarithmically near solar conditions gives an effective exponent $n = d\ln\epsilon/d\ln T \approx 4$ for the pp chain, and considerably larger for reactions with higher charges.

The thermostat's sensitivity is a consequence of quantum tunnelling. The reaction rate is steep because it depends exponentially on the tunnelling probability, which depends exponentially on the energy, which depends on the temperature. Two exponentials in series, and the result is the negative feedback that has held the Sun stable for eighty trillion free-fall times.

And the reason $n$ is larger for the CNO cycle follows directly: carbon, nitrogen and oxygen have $Z = 6, 7, 8$, so the Coulomb barrier is six to eight times higher, the Gamow factor is correspondingly more sensitive, and $n$ rises to about 17.

{{image: Proton–proton chain reaction | The proton–proton chain: the dominant fusion pathway in stars near the Sun's mass, whose steep sensitivity to temperature traces back to how the Gamow peak — the narrow window where a falling population of particles meets a rising tunnelling probability — shifts as the core heats.}}

## Where the energy comes from

The bookkeeping, which is simpler than the mechanism.

$$4\,^1\text{H} \longrightarrow\ ^4\text{He} + 2e^+ + 2\nu_e$$

| | Mass (u) |
|---|---|
| 4 × ¹H | 4.031300 |
| ⁴He | 4.002602 |
| **Defect** | **0.028698** |

$$E = \Delta m\,c^2 = 26.7\ \text{MeV per helium nucleus}, \qquad \eta = \frac{\Delta m}{m} = 0.71\%$$

Less than one percent of the rest mass is converted — which sounds unimpressive until compared with the alternative. Chemical burning releases a few electron-volts per reaction; this releases 26.7 million. Nuclear energy exceeds chemical by a factor of about five million per reaction, which is why the Sun lasts ten billion years and a coal-fired Sun would last a few thousand.

The consumption rate follows:

$$\frac{dm}{dt} = \frac{L_\odot}{c^2} = 4.26\times10^{9}\ \text{kg/s}$$

so the Sun loses 4.3 million tonnes per second as pure energy, and converts about 600 million tonnes of hydrogen per second to do it.

A footnote worth having: the strong nuclear force binds nucleons, and the binding energy per nucleon peaks at iron-56. That is why fusion releases energy below iron and absorbs it above, and it is the reason stellar nucleosynthesis stops at iron — a limit taken up in the physics of stellar death.

## Why the Sun is slow

Here is the fact that most people find surprising, and it is a better guide to what a star is than any amount of talk about furnaces.

### Power density

The Sun's core — the inner quarter of its radius, containing about a third of its mass — generates $3.83\times10^{26}$ W in a volume of $2.2\times10^{25}$ m³.

$$\text{Power density} = 17\ \text{W/m}^3, \qquad \text{or per unit mass: } 0.57\ \text{mW/kg}$$

Compare a human being at basal metabolic rate: about 1.2 W/kg.

$$\frac{\text{human}}{\text{solar core}} \approx 2{,}100$$

A human body generates two thousand times more power per kilogram than the centre of the Sun. A compost heap does better. So does a lizard.

The Sun is luminous because it is enormous, not because it is intense. Its core is a feeble energy source occupying an enormous volume — $2\times10^{29}$ kg of it — and the total is what makes it a star.

### Why so feeble: the weak interaction

The reason is a specific step in the pp chain, and it is the most consequential fact in this node.

| Step | Reaction | Interaction | Timescale per particle |
|---|---|---|---|
| **1** | $p + p \to d + e^+ + \nu_e$ | **weak** | **~10¹⁰ yr** |
| 2 | $d + p \to\ ^3\text{He} + \gamma$ | electromagnetic | ~1 second |
| 3 | $^3\text{He} + ^3\text{He} \to\ ^4\text{He} + 2p$ | strong | ~10⁵ yr |

The first step requires one of the two protons to convert into a neutron, emitting a positron and a neutrino — which is a weak interaction, and the weak interaction is weak. The conversion must happen during the brief moment the two protons are within range of each other, and the probability of that is minuscule.

The result: a given proton in the Sun's core waits, on average, about ten billion years to undergo this reaction. Contrast step 2: once a deuteron exists, it captures a proton in about one second. The subsequent steps are fast. Only the first is slow, and it is slow by a factor of $10^{17}$.

The Sun is slow because the weak interaction is weak — and its lifetime is set by a coupling constant rather than by its fuel supply.

This deserves emphasis. If the pp reaction proceeded at the electromagnetic rate, the Sun would exhaust its hydrogen in a few thousand years. There would be no ten-billion-year main sequence, no time for planetary systems to form and evolve, and no possibility of anything happening on a planet. A fundamental constant of particle physics sets the timescale on which the universe is habitable.

### The CNO alternative

Above about $1.8\times10^{7}$ K a different route dominates: the CNO cycle, in which carbon, nitrogen and oxygen act as catalysts — consumed and regenerated, with the net effect identical ($4p \to\ ^4$He + 26.7 MeV).

| | pp chain | CNO cycle |
|---|---|---|
| Bottleneck | weak interaction | none — all strong/EM |
| Coulomb barriers | lowest possible ($Z=1$) | higher ($Z = 6,7,8$) |
| Temperature dependence | $\epsilon \propto T^{4}$ | $\epsilon \propto T^{17}$ |
| Dominant in | $M \lesssim 1.3\,M_\odot$ | $M \gtrsim 1.3\,M_\odot$ |
| Requires | nothing | pre-existing C, N, O |

CNO avoids the weak bottleneck entirely, but pays for it with higher Coulomb barriers — which is why it needs a hotter core, and therefore a more massive star.

And the $T^{17}$ dependence has a structural consequence: such extreme temperature sensitivity concentrates energy generation into a very small central volume, producing a steep temperature gradient that drives convection in the core. That is why massive stars have convective cores while the Sun does not — and hence why the burnable fuel fraction differs between them.

One requirement is worth flagging. CNO needs carbon, nitrogen and oxygen to be already present, which means it was unavailable to the first stars. Population III stars had no catalysts, so even very massive ones had to burn by the pp chain — running hotter and differently, which is part of why they are thought to have been so massive.

{{image: CNO cycle | The CNO cycle: carbon, nitrogen and oxygen participate as catalysts and are regenerated, avoiding the weak-interaction bottleneck of the pp chain at the cost of Coulomb barriers six to eight times higher — which is why it dominates only in stars massive enough to burn hotter than about 1.8 × 10⁷ K at their centre.}}

## Pulling the thread

- The objection to Eddington was quantitatively correct. The Coulomb barrier for two protons is 1.44 MeV; the thermal energy at the Sun's centre is 1.35 keV, a factor of 700 short. The number of protons in the Maxwell–Boltzmann tail with sufficient energy is, for the whole Sun, zero to within $10^{-400}$. Classically the Sun cannot shine. Eddington's reply — find a hotter place — was the wrong defence of a correct conclusion.
- Gamow's answer, in 1928, was that the protons tunnel through. The Gamow factor $e^{-2\pi\eta}$ rises by six orders of magnitude between 1 and 20 keV, so reactions occur at energies far below the barrier.
- The Gamow peak is the product of a falling Maxwell–Boltzmann factor and a rising tunnelling probability, peaking at 6.1 keV — 4.5 times $kT$ and 0.42% of the barrier. Only about 1% of protons reach that energy and only about 1 in $10^4$ of those tunnels. The Sun runs on the tail of a tail.
- That is where the thermostat's sensitivity comes from. Raising the temperature both shifts the distribution and moves the Gamow peak to where tunnelling is easier — two exponentials in series. A factor of two in temperature gives a factor of 24 in rate, so $\epsilon \propto T^{4}$ for pp. For CNO, with $Z = 6$–8 and correspondingly higher barriers, $\epsilon \propto T^{17}$. The negative feedback that has held the Sun stable for eighty trillion free-fall times is a consequence of quantum tunnelling.
- The energy is a mass defect of 0.71% — 26.7 MeV per helium nucleus, about five million times a chemical reaction. The Sun converts 600 million tonnes of hydrogen per second and loses 4.3 million tonnes to radiation.
- The Sun's core generates 0.57 mW/kg, against 1.2 W/kg for a human at rest. A human body is two thousand times more energetically intense than the centre of the Sun. The Sun is luminous because it is enormous.
- And the reason is the weak interaction. The first step of the pp chain requires a proton to convert to a neutron during a collision — a weak process, taking about $10^{10}$ years per proton, against one second for the next step. The Sun's lifetime is set by a coupling constant, not by its fuel supply — and without that bottleneck, hydrogen would be exhausted in a few thousand years and nothing on any planet would have time to happen.
- The CNO cycle avoids the weak bottleneck by using carbon, nitrogen and oxygen as catalysts, at the cost of higher Coulomb barriers, so it needs $T > 1.8\times10^{7}$ K and dominates above roughly 1.3 M☉. Its $T^{17}$ dependence concentrates burning into a small volume and drives a convective core, which is why massive stars have one and the Sun does not. It also requires pre-existing metals, so it was unavailable to the first stars.

Hydrostatic equilibrium showed that the star's structure sets the temperature and that a thermostat holds the balance. This node has shown that the steepness the thermostat depends on is quantum mechanical, and that the timescale the star runs on is set by particle physics — a star is a gravitational structure regulated by a nuclear reaction whose rate is fixed by two of the four fundamental interactions. What remains unexplained is how the energy generated at the centre actually reaches the surface: a photon released at the Sun's core would arrive in 2.3 seconds if it travelled in a straight line, and it actually takes somewhere between ten thousand and a hundred thousand years. What stands in its way, and why the mechanism carrying it matters, is the next question.

## Further reading

A systematic treatment of thermonuclear reaction rates, the Gamow peak, the astrophysical S-factor, and the experimental difficulty of measuring stellar reaction cross-sections is given in {{book: Claus E. Rolfs and William S. Rodney | Cauldrons in the Cosmos: Nuclear Astrophysics | 1988}}.

- **Claus E. Rolfs and William S. Rodney, *Cauldrons in the Cosmos: Nuclear Astrophysics* (1988).** The standard reference on thermonuclear reactions in stars, deriving the Gamow peak from the competition between the Maxwell–Boltzmann distribution and quantum tunnelling, covering the pp chain and CNO cycle in detail, and giving a thorough account of how reaction rates at stellar energies are measured — including the extrapolation problem and the case for underground accelerator facilities.

## Problems

*Data: $k = 1.381\times10^{-23}$ J/K, $e = 1.602\times10^{-19}$ C, $\epsilon_0 = 8.854\times10^{-12}$ F/m, $\hbar = 1.055\times10^{-34}$ J s, $m_p = 1.673\times10^{-27}$ kg, $c = 2.998\times10^{8}$ m/s, $u = 1.6605\times10^{-27}$ kg, 1 MeV = 1.602 × 10⁻¹³ J. Sun: $T_c = 1.57\times10^{7}$ K, $L_\odot = 3.828\times10^{26}$ W, $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m. Masses: ¹H = 1.007825 u, ⁴He = 4.002602 u. Gamow: $P \sim e^{-2\pi\eta}$ with $\eta = Z_1Z_2e^2/4\pi\epsilon_0\hbar v$, and $v = \sqrt{2E/\mu_{red}}$ with $\mu_{red} = m_p/2$ for two protons.*

### 1 — The objection *(get the arithmetic right before the physics)*
**(a)** Compute the Coulomb barrier for two protons at a separation of 1 fm, in MeV and keV.
**(b)** Compute $kT$ at the Sun's central temperature, in keV, and take the ratio to (a).
**(c)** Estimate the Maxwell–Boltzmann factor $e^{-E/kT}$ for a proton with the barrier energy, and multiply by the ~$10^{57}$ protons in the Sun. State the conclusion.
**(d)** Explain why no adjustment to the Sun's temperature can rescue the classical picture, and which earlier result establishes the constraint.
**(e)** Eddington's reply was "find a hotter place." Explain why it was the wrong defence, and state what was actually right and wrong in the exchange.

### 2 — Tunnelling
**(a)** Explain qualitatively what quantum tunnelling permits, and why it has no classical analogue.
**(b)** Compute the relative velocity of two protons with 5 keV of kinetic energy, using $\mu_{red} = m_p/2$.
**(c)** Compute $\eta$ and the Gamow factor at that energy.
**(d)** Repeat for 20 keV and state the factor by which the probability rises.
**(e)** Explain why a probability of $10^{-5}$ at 5 keV is more useful to a star than certainty at 1,440 keV.

### 3 — The Gamow peak *(the central argument)*
**(a)** Write the two competing factors in the reaction rate and state how each depends on energy.
**(b)** Explain why their product has a maximum, and where that maximum sits relative to $kT$ and to the barrier.
**(c)** For the pp reaction at solar central temperature the peak is at 6.1 keV. Express this as a multiple of $kT$ and as a fraction of the barrier.
**(d)** Estimate the fraction of protons with energies near the peak, and combine with the tunnelling probability there. Comment on the result.
**(e)** Explain, using the Gamow peak, why the reaction rate is so steeply temperature-dependent. Identify the two distinct effects of raising $T$.
**(f)** Explain why the CNO cycle has a much larger exponent than the pp chain, referring to the charges involved.
**(g)** State how this node justifies the thermostat's sensitivity, established but not derived in hydrostatic equilibrium.

### 4 — The energy
**(a)** Compute the mass defect for $4\,^1\text{H} \to\ ^4\text{He}$ in atomic mass units, and the energy released in MeV.
**(b)** Compute the efficiency $\Delta m/m$ as a percentage.
**(c)** Compare with a chemical reaction releasing 5 eV, and state the ratio.
**(d)** Compute the Sun's rate of mass loss to radiation, $L/c^2$, in kg/s and tonnes/s.
**(e)** Compute the rate at which hydrogen is consumed, using the efficiency from (b).
**(f)** Binding energy per nucleon peaks at iron-56. State the consequence for stellar nucleosynthesis.

### 5 — Why the Sun is slow *(the surprising one)*
**(a)** The solar core has $R \approx 0.25R_\odot$ and contains ~34% of the Sun's mass. Compute its volume, its power density in W/m³, and its power per unit mass in W/kg.
**(b)** Compare with human basal metabolism (~1.2 W/kg) and state the ratio.
**(c)** Explain, in one sentence, why the Sun is nevertheless luminous.
**(d)** Identify the rate-limiting step of the pp chain and the interaction responsible.
**(e)** State the timescale for that step per proton, and for the next step. Express the ratio.
**(f)** State what would happen to the Sun if the first step proceeded at the electromagnetic rate, and what follows for planetary science.

### 6 — Two chains
**(a)** Write the net reaction for both the pp chain and the CNO cycle. What is identical, and what differs?
**(b)** Explain the sense in which C, N and O are catalysts.
**(c)** State the temperature dependence of each and the mass above which CNO dominates.
**(d)** Explain the trade-off: what does CNO avoid, and what does it pay?
**(e)** Explain why $T^{17}$ produces a convective core, and name two consequences.
**(f)** The CNO cycle was unavailable to the first stars. Explain why, and state one consequence.

### 7 — Numerical
**(a)** A star has $T_c = 2.5\times10^{7}$ K. Using $\epsilon \propto T^{4}$ for pp and $\epsilon \propto T^{17}$ for CNO, and taking both to be equal at $1.8\times10^{7}$ K, compute the ratio of CNO to pp energy generation at $2.5\times10^{7}$ K.
**(b)** Repeat at $1.5\times10^{7}$ K.
**(c)** Comment on how sharp the transition between the two regimes is.
**(d)** A 1% increase in central temperature occurs. Compute the fractional change in $\epsilon$ for each cycle, and relate to the thermostat calculation established in hydrostatic equilibrium.

### 8 — Neutrinos
Each helium nucleus formed releases two neutrinos, which escape the Sun essentially unimpeded.
**(a)** Estimate the number of neutrinos produced per second by the Sun, given 26.7 MeV per two neutrinos.
**(b)** Estimate the flux at Earth (1 AU = 1.496 × 10¹¹ m), in neutrinos per m² per second.
**(c)** Explain why neutrinos are a uniquely direct probe of the solar core, contrasting with photons.
**(d)** Explain why the neutrino flux depends more steeply on the core temperature than the luminosity does, and why this makes neutrinos a sensitive thermometer.

### 9 — Open problem: what the rates actually are
Stellar models require nuclear cross-sections at energies of a few keV.
**(a)** Explain why measuring these cross-sections in a laboratory is extraordinarily difficult. Refer to the Gamow factor.
**(b)** Describe what is done instead, and the principal risk of the method.
**(c)** Name one reaction whose uncertain rate has significant astrophysical consequences, and state what it affects.
**(d)** Explain why underground laboratories are used for this work.
**(e)** Suppose a key rate were revised by 30%. Trace the consequences through at least two other results in stellar physics.

## Worked answers

### 1 — The objection

**(a)** $E = e^2/4\pi\epsilon_0 r = (1.602\times10^{-19})^2/[4\pi(8.854\times10^{-12})(10^{-15})] = 2.31\times10^{-13}$ J $= 1.44\ \text{MeV} = 1{,}440\ \text{keV}$

**(b)** $kT = (1.381\times10^{-23})(1.57\times10^{7}) = 2.17\times10^{-16}$ J $= 1.35\ \text{keV}$. Ratio: $1440/1.35 = 1{,}064$ (or ~700 if compared with the mean kinetic energy $\tfrac{3}{2}kT$).

**(c)** $e^{-1064} \approx 10^{-462}$. Multiplying by $10^{57}$ protons gives $\approx 10^{-405}$.

Zero. Not "a small number of protons" — a number so far below one that no star anywhere in the observable universe, over its entire lifetime, would contain a single proton pair capable of classical fusion.

**(d)** Because hydrostatic equilibrium fixes the central temperature: $T_c \sim GM\mu m_H/kR$, so raising $T_c$ by a factor of a hundred would require raising $M/R$ by the same factor — which is not a free choice, since the star's radius adjusts until pressure balances weight, and the resulting temperature is determined.

The constraint is established by the hydrostatic-equilibrium argument, and it is what makes the objection airtight. You cannot simply postulate a hotter Sun, because the Sun's temperature is not a free parameter.

**(e)** It was the wrong defence because the Sun really is that cool — the premise Eddington disputed was correct, and independently confirmed by the structure equations.

Right in the exchange: Eddington's conclusion (hydrogen fusion powers the Sun) and the critics' arithmetic (protons lack the energy). Wrong: Eddington's reply (that the temperature estimate must be too low) and the critics' inference (that fusion is therefore impossible). Both sides were half right, and neither for the reason they thought. The missing element was quantum mechanics, which neither party invoked — Gamow supplied it eight years later.

### 2 — Tunnelling

**(a)** Quantum mechanics describes a particle by a wavefunction that does not vanish abruptly at a classically forbidden boundary — it decays exponentially inside the barrier rather than terminating. If the barrier is thin enough, the amplitude on the far side is small but non-zero, so there is a finite probability of finding the particle there.

There is no classical analogue because in classical mechanics a particle with energy $E < V$ simply cannot be in the forbidden region: its kinetic energy would be negative. The classical statement is not "unlikely" but "undefined."

**(b)** $v = \sqrt{2E/\mu_{red}} = \sqrt{2(5\times10^{3})(1.602\times10^{-19})/(8.365\times10^{-28})} = 1{,}384\ \text{km/s}$

**(c)** $\eta = e^2/(4\pi\epsilon_0\hbar v) = (2.566\times10^{-38})/[(1.113\times10^{-10})(1.055\times10^{-34})(1.384\times10^{6})] = 1.58$. $2\pi\eta = 9.93$, so $P = e^{-9.93} = 4.9\times10^{-5}$

**(d)** At 20 keV: $v = 2{,}768$ km/s, $\eta = 0.79$, $2\pi\eta = 4.96$, $P = 7.0\times10^{-3}$. Ratio: $143\times$ for a factor of four in energy.

**(e)** Because the star must supply both the energy and the particles, and the two requirements trade off exponentially.

At 1,440 keV the probability of reaction is 1, but the number of protons with that energy is $10^{-462}$ per particle. At 5 keV the probability is only $5\times10^{-5}$, but the fraction of protons with 5 keV is about $2\times10^{-2}$.

$$\text{5 keV: } 2\times10^{-2} \times 5\times10^{-5} = 10^{-6} \qquad \text{1,440 keV: } 10^{-462} \times 1$$

A rare event among common particles beats a certain event among non-existent ones, by 456 orders of magnitude. That trade-off is precisely what the Gamow peak optimises.

### 3 — The Gamow peak

**(a)** Number of particles at energy $E$: Maxwell–Boltzmann, $\propto e^{-E/kT}$, falls exponentially with energy. Probability of tunnelling: Gamow factor, $\propto e^{-b/\sqrt{E}}$, rises with energy (the exponent becomes less negative).

**(b)** Because one factor decreases and the other increases, their product must have a maximum at intermediate energy. The maximum sits above $kT$, because at $kT$ the tunnelling probability is negligibly small, and far below the barrier, because at barrier energies there are essentially no particles. It is a compromise between abundance and penetrability.

**(c)** $6.1/1.35 = 4.5\times kT$. And $6.1/1440 = 0.42\%$ of the barrier.

**(d)** Fraction of protons near 6 keV: $e^{-6.1/1.35} = e^{-4.5} \approx 1.1\times10^{-2}$ — about 1%. Tunnelling probability there: $\approx 1.2\times10^{-4}$. Product: $\approx 1.3\times10^{-6}$.

Roughly one proton in a hundred has enough energy, and roughly one in ten thousand of those gets through — so about one pair in a million is in a position to react, and even then the weak interaction must cooperate. The Sun runs on the tail of a tail, and the reactions that power it are, individually, extraordinarily improbable events occurring in an extraordinarily large number of particles.

**(e)** Raising $T$ does two things at once: the Maxwell–Boltzmann distribution broadens, putting more particles at every energy above $kT$; and the Gamow peak shifts to higher energy, where the tunnelling probability is exponentially larger.

Because both effects are exponential and they act in the same direction, the rate responds far more steeply than either alone. Numerically, a factor of two in temperature (1.57 → 3.0 × 10⁷ K) gives a factor of 24 in rate, corresponding to $\epsilon \propto T^{4}$ near solar conditions.

**(f)** Because the Gamow factor depends on $Z_1Z_2$. Carbon, nitrogen and oxygen have $Z = 6, 7, 8$, so a proton reacting with them faces a barrier six to eight times higher than proton–proton.

A higher barrier means the tunnelling probability is smaller and, crucially, more steeply energy-dependent — the Gamow peak sits further out in the Maxwell–Boltzmann tail, where the population falls off faster. Shifting that peak with temperature therefore produces a much larger change in rate. The result is $\epsilon \propto T^{17}$ rather than $T^{4}$.

**(g)** Hydrostatic equilibrium used $\epsilon \propto T^{n}$ with $n$ = 4 and 17 to show that the thermostat is tight — a 0.06% temperature change absorbing a 1% imbalance — without justifying either exponent. This node derives them. The steepness is a consequence of quantum tunnelling: the rate depends exponentially on the tunnelling probability, which depends exponentially on the Gamow peak energy, which depends on the temperature. Two exponentials in series produce the large $n$, and hence the sensitivity of the feedback loop that has held the Sun stable for its entire life.

### 4 — The energy

**(a)** $4 \times 1.007825 = 4.031300$ u; minus $4.002602$ u gives $\Delta m = 0.028698\ \text{u}$. $E = (0.028698)(1.6605\times10^{-27})(2.998\times10^{8})^2 = 4.28\times10^{-12}$ J $= 26.7\ \text{MeV}$

**(b)** $\Delta m/m = 0.028698/4.031300 = 0.712\%$

**(c)** $26.7\times10^{6}/5 = 5.3\times10^{6}$ — nuclear fusion releases about five million times more energy per reaction than a chemical reaction. This is the quantitative form of Kelvin's error: a Sun powered by any chemical process would last thousands of years, not billions.

**(d)** $dm/dt = L_\odot/c^2 = 3.828\times10^{26}/(8.988\times10^{16}) = 4.26\times10^{9}\ \text{kg/s} = 4.3\ \text{million tonnes per second}$

**(e)** Only 0.712% of the consumed mass becomes energy, so the hydrogen processing rate is $4.26\times10^{9}/0.00712 = 6.0\times10^{11}\ \text{kg/s} = 600\ \text{million tonnes per second}$

**(f)** Because binding energy per nucleon peaks at iron-56, fusing nuclei lighter than iron releases energy (the product is more tightly bound), while fusing nuclei heavier than iron absorbs it.

Consequence: stellar nucleosynthesis by fusion stops at iron. A massive star builds successive shells up to an iron core and can go no further — iron burning would cool the core rather than heat it, removing the pressure support and triggering collapse. Elements heavier than iron require a different mechanism, neutron capture, which belongs to the physics of stellar death.

### 5 — Why the Sun is slow

**(a)** $R = 0.25(6.957\times10^{8}) = 1.74\times10^{8}$ m; $V = \tfrac{4}{3}\pi R^3 = 2.20\times10^{25}\ \text{m}^3$. Power density $= 3.828\times10^{26}/2.20\times10^{25} = 17.4\ \text{W/m}^3$. Per unit mass, with $M = 0.34M_\odot = 6.76\times10^{29}$ kg: $5.7\times10^{-4}\ \text{W/kg} = 0.57$ mW/kg.

**(b)** $1.2/5.7\times10^{-4} = 2{,}100$ — a human body generates about two thousand times more power per kilogram than the centre of the Sun.

**(c)** Because it is enormous: a feeble power density multiplied by $2\times10^{29}$ kg of core material gives $3.8\times10^{26}$ W.

**(d)** The first step, $p + p \to d + e^+ + \nu_e$, mediated by the weak interaction — one proton must convert into a neutron during the collision, emitting a positron and a neutrino.

**(e)** ~$10^{10}$ years per proton for step 1; ~1 second for step 2 ($d + p \to\ ^3$He + γ), which is electromagnetic. Ratio: $3\times10^{17}/1 \approx 10^{17}$.

**(f)** The Sun would exhaust its hydrogen in a few thousand years rather than ten billion — the fuel supply is the same, but it would be consumed $10^{17}$ times faster (limited eventually by other bottlenecks, but the change is of that order).

What follows for planetary science: there would be no long-lived main sequence anywhere. No star would remain stable for the ~$10^9$ years required for planets to form, differentiate, develop atmospheres and evolve surface chemistry. The habitability of the universe on any timescale depends on the weak interaction being weak.

That is worth stating as a general point: the Sun's lifetime is set by a coupling constant of particle physics, not by how much hydrogen it contains. Fuel supply determines the total energy; the weak interaction determines the rate.

### 6 — Two chains

**(a)** Both: $4\,^1\text{H} \to\ ^4\text{He} + 2e^+ + 2\nu_e + 26.7$ MeV. Identical: the net reaction, the products, and the energy released. Different: the intermediate steps, the temperature required, and the temperature dependence.

**(b)** C, N and O participate in the reaction sequence — protons are captured onto them, and beta decays occur — but at the end of the cycle the original carbon nucleus is regenerated. No net C, N or O is consumed. They lower the effective barrier to the sequence by providing intermediate nuclei, exactly as a chemical catalyst provides an alternative pathway, and emerge unchanged.

**(c)** pp: $\epsilon \propto T^{4}$. CNO: $\epsilon \propto T^{17}$. CNO dominates above about 1.3 M☉ (equivalently above $T_c \approx 1.8\times10^{7}$ K).

**(d)** CNO avoids the weak bottleneck — every step is electromagnetic or strong, so there is no $10^{10}$-year rate-limiting reaction. It pays with higher Coulomb barriers: reacting a proton with carbon ($Z = 6$) rather than another proton ($Z = 1$) means a barrier six times higher, so the tunnelling probability is far smaller at a given temperature, which is why CNO requires a hotter core and therefore a more massive star.

**(e)** Because such extreme sensitivity means that a small temperature difference produces a large difference in energy generation. Since temperature falls outward from the centre, $T^{17}$ concentrates essentially all the burning into a very small central volume. Generating a large luminosity in a small volume requires a steep temperature gradient to carry it away, and once the gradient exceeds the adiabatic value, the region becomes convectively unstable: hence a convective core. Two consequences: massive stars have convective cores while the Sun does not, and the burnable fuel fraction is larger for massive stars because convection mixes fresh fuel into the burning region.

**(f)** Because CNO requires carbon, nitrogen and oxygen to be already present, and the first stars formed from primordial gas containing only hydrogen, helium and traces of lithium — the catalysts did not yet exist. Consequence: Population III stars burned by the pp chain regardless of mass, and therefore had to reach much higher central temperatures and densities to generate their luminosity, contributing to the expectation that the first stars were very massive.

### 7 — Numerical

**(a)** Taking $\epsilon_{CNO}/\epsilon_{pp} = (T/1.8\times10^{7})^{17-4} = (T/1.8\times10^{7})^{13}$: at $T = 2.5\times10^{7}$, $(1.389)^{13} = 72$ — CNO dominates by a factor of about seventy.

**(b)** At $T = 1.5\times10^{7}$: $(0.833)^{13} = 0.09$ — pp dominates by a factor of about eleven.

**(c)** Extremely sharp. A factor of 1.67 in temperature (1.5 → 2.5 × 10⁷ K) swings the ratio by a factor of 800, from pp-dominated to CNO-dominated. The transition is therefore effectively a switch rather than a gradual handover, which is why stars can be cleanly divided at ~1.3 M☉ into pp-burning and CNO-burning populations, with the associated structural difference between radiative and convective cores equally abrupt.

**(d)** pp: $(1.01)^{4} - 1 = 4.1\%$. CNO: $(1.01)^{17} - 1 = 18.4\%$.

Relation to the thermostat: hydrostatic equilibrium computed the inverse — the temperature change needed to absorb a given imbalance, $\delta T/T = (1/n)\delta\epsilon/\epsilon$. This is the same relation read forwards, and it shows why CNO stars are more tightly regulated: a given temperature perturbation produces a four-times-larger correction in the energy generation rate, so the restoring response is stronger.

### 8 — Neutrinos

**(a)** Each 26.7 MeV releases 2 neutrinos, so the rate is

$$\dot{N}_\nu = \frac{2L_\odot}{26.7\ \text{MeV}} = \frac{2(3.828\times10^{26})}{4.28\times10^{-12}} = 1.8\times10^{38}\ \text{s}^{-1}$$

**(b)** $\Phi = \dot{N}_\nu/4\pi d^2 = 1.8\times10^{38}/[4\pi(1.496\times10^{11})^2] = 6.4\times10^{14}\ \text{m}^{-2}\text{s}^{-1}$

That is about $6\times10^{10}$ per square centimetre per second — roughly sixty billion solar neutrinos crossing every square centimetre of your body every second.

**(c)** Because neutrinos interact only via the weak interaction, so their mean free path in stellar material is enormous — they escape the Sun in about two seconds, essentially unimpeded, carrying information about conditions at the moment and place of their creation.

Photons cannot do this. A photon generated in the core is absorbed and re-emitted innumerable times, taking of order $10^4$–$10^5$ years to random-walk to the surface. By the time it emerges it has been thermalised, and carries no memory of the core at all — the sunlight we see reports on the photosphere, not the centre. Neutrinos are the only direct observation of a stellar core, and the flux we measure today was produced today.

**(d)** Because the neutrino-producing reactions have higher effective temperature exponents than the overall energy generation, particularly the ⁸B branch of the pp chain, whose flux scales roughly as $T_c^{24}$. The luminosity, by contrast, is set by the leak rate and is buffered by the thermostat, so it responds only weakly to core conditions.

Consequence: a 1% error in $T_c$ changes the ⁸B neutrino flux by ~27% while barely changing the luminosity. That makes neutrinos an exceptionally sensitive thermometer for the solar core, and it is why the solar neutrino problem was taken so seriously — a factor-of-three discrepancy in flux corresponded to only a few percent in temperature, which was uncomfortably plausible. (It was not the temperature; it was the neutrinos, which turned out to oscillate between flavours en route.)

### 9 — Open problem: what the rates actually are

**(a)** Because the cross-sections at a few keV are vanishingly small, for exactly the reason this node has established: the Gamow factor at those energies is $10^{-4}$ to $10^{-9}$, so the reaction rate in any laboratory sample is far below what can be distinguished from background. The events of interest occur at rates of order one per month or less in a realistic target, against a cosmic-ray-induced background many orders of magnitude larger.

**(b)** Measure at higher energies, where the cross-section is measurable, and extrapolate downward — conventionally by fitting the astrophysical S-factor, defined so that the steep Gamow energy dependence is divided out, leaving a slowly varying function that can be extrapolated with more confidence.

The principal risk is that the extrapolation is wrong — specifically, that a resonance exists at low energy which the high-energy data cannot reveal. A narrow resonance near the Gamow peak would raise the rate by orders of magnitude and would be entirely invisible in measurements made at ten times that energy.

**(c)** The triple-alpha reaction and $^{12}\text{C}(\alpha,\gamma)^{16}\text{O}$ are the standard examples. The latter sets the carbon-to-oxygen ratio produced by helium burning, which determines the composition of white dwarfs, the subsequent evolution of massive stars, and the nucleosynthetic yields returned to the interstellar medium. It remains one of the most consequential uncertain rates in astrophysics.

*(Also creditable: $^{14}\text{N}(p,\gamma)^{15}\text{O}$, the slowest step of the CNO cycle, which sets the CNO rate and hence the transition mass and globular cluster ages.)*

**(d)** To suppress cosmic-ray background. Since the signal is a handful of events per month, any background of comparable rate makes the measurement impossible. Several hundred metres of rock reduces the muon flux by orders of magnitude, which is what permits direct measurement at energies approaching the Gamow window rather than relying entirely on extrapolation. This is the purpose of underground accelerator facilities, and it has produced direct measurements of several key reactions at astrophysically relevant energies.

**(e)** A 30% revision of $^{14}\text{N}(p,\gamma)^{15}\text{O}$, the CNO bottleneck, would propagate as follows. The CNO energy generation rate changes, shifting the mass at which CNO overtakes pp and therefore the mass above which stars have convective cores. That changes the burnable fuel fraction and hence main-sequence lifetimes for stars near the transition.

Globular cluster ages shift. The turnoff mass in old metal-poor clusters lies near the pp/CNO boundary, so the lifetime at the turnoff depends on this rate. A revision moves the derived ages — and globular cluster ages are one of the only age determinations for the universe involving no cosmology. *(This is not hypothetical: a downward revision of this rate around 2004 increased globular cluster ages by roughly 0.7–1 Gyr.)*

*(Also creditable: the ³He + ³He and ³He + ⁴He branching, which sets the ⁸B neutrino flux and hence the interpretation of solar neutrino measurements.)*$astroNucFurn_master$,
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
