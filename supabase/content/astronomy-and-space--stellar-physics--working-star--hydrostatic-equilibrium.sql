-- Astronomy & Space · Stellar Physics — The Working Star —
-- "Hydrostatic Equilibrium". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/working-star/hydrostatic-equilibrium
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The Sun is twenty-nine minutes from gravitational collapse at every
-- instant, and the balance has held for some eighty trillion consecutive
-- free-fall times — precision that is itself evidence of an active control
-- system rather than a lucky configuration; the hydrostatic equation and
-- the four-line derivation of T_c ~ GM*mu*m_H/(kR), reproducing the Sun's
-- central temperature to within 10% with no nuclear physics; the virial
-- theorem's E = U/2 = -K and the negative heat capacity it implies (lose
-- energy, get hotter), with the Kelvin-Helmholtz timescale as its
-- bookkeeping; the five-step thermostat feedback loop and why a steep
-- T^4-to-T^17 reaction rate makes the main sequence a place rather than a
-- track; and the two ways the thermostat fails — electron degeneracy
-- (the helium flash, novae, Type Ia supernovae) and radiation pressure
-- pushing the effective adiabatic index toward the marginally stable 4/3
-- at the top of the mass range.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/working-star/hydrostatic-equilibrium',
    'research',
    'advanced',
    'read',
    $astroHydroEq_master$> A star is a controlled explosion held up by its own weight. The Sun is thirty minutes from gravitational collapse at every instant of its life, and that balance has held, to extraordinary precision, for some eighty trillion consecutive free-fall times. Precision of that order is not a coincidence — it is the signature of an active control system, and this is where it gets derived.

## Twenty-nine minutes from collapse

Here is a calculation worth doing before anything else, because it sets the scale of the problem.

Suppose the Sun's internal pressure vanished — not gradually, but simply stopped supporting the overlying material. How long before the Sun collapses?

The free-fall time depends only on the mean density:

$$t_{ff} = \sqrt{\frac{3\pi}{32G\bar\rho}}, \qquad \bar\rho = \frac{M_\odot}{\tfrac{4}{3}\pi R_\odot^3} = 1{,}410\ \text{kg/m}^3$$

$$t_{ff} = 1{,}769\ \text{s} = \mathbf{29\ minutes}$$

The Sun is twenty-nine minutes from catastrophe at all times. Remove the pressure support and it is gone before the working day is out.

Now compare with how long it has actually been stable: 4.57 billion years, or 1.4 × 10¹⁷ seconds.

$$\frac{4.57\ \text{Gyr}}{29\ \text{min}} \approx 8\times10^{13}$$

The balance between pressure and gravity has held to within a tiny fraction of a percent, continuously, for eighty trillion free-fall times.

### Why that should bother you

Precision of that order does not happen by accident. If the Sun's structure were merely a coincidence — a configuration that happened to balance — then any perturbation would grow, and there have been perturbations: the Sun's luminosity has risen by roughly 40% over its life, its core composition has changed as hydrogen became helium, and its core has contracted.

A balance maintained through all of that is not a balance. It is a control system. The equation below states what the balance is; the thermostat, derived further down, is why it survives.

## The equation of hydrostatic equilibrium

Consider a thin shell of gas at radius $r$ inside a star, of thickness $dr$ and density $\rho(r)$. Three forces act on it, and one of them is negligible.

Gravity pulls it inward. Only the mass **interior** to $r$ matters — this is Newton's shell theorem, and it means the shell is entirely indifferent to the mass outside it. Call that interior mass $M(r)$. The gravitational force per unit area on the shell is

$$\frac{GM(r)\rho\,dr}{r^2}$$

Pressure acts on both faces. The pressure below pushes up, the pressure above pushes down, and since pressure falls outward, the net effect is outward:

$$P(r) - P(r+dr) = -\frac{dP}{dr}dr$$

And acceleration is negligible — which is precisely the assumption being made. Setting it to zero:

$$\frac{dP}{dr} = -\frac{GM(r)\rho(r)}{r^2}$$

This is the equation of **hydrostatic equilibrium**, and it is the first of the four equations of stellar structure. It says that the pressure gradient at every point is exactly what is needed to support the weight of everything above it.

Note what it does not contain. No time. No energy source. No temperature. It is a statement about mechanical balance alone, and it holds equally in a main-sequence star, a red giant, a brown dwarf and a giant planet.

### What it gives you immediately

Replace derivatives with characteristic values — $dP/dr \to P_c/R$, $M(r) \to M$, $\rho \to M/R^3$:

$$\frac{P_c}{R} \sim \frac{GM}{R^2}\cdot\frac{M}{R^3} \qquad\Longrightarrow\qquad P_c \sim \frac{GM^2}{R^4}$$

For the Sun this gives $1.1\times10^{15}$ Pa, against a modelled central pressure of $2.5\times10^{16}$ Pa — low by a factor of about twenty, because the crude estimate assumes uniform density and the Sun is strongly centrally concentrated.

The scaling is right and the coefficient is not, which is the normal situation for dimensional analysis and is the part that matters. $P_c \propto M^2/R^4$ is the relation that does the work.

## Temperature from gravity

Now combine with the ideal gas law, and something genuinely important falls out.

$$P = \frac{\rho kT}{\mu m_H}$$

Set the two expressions for central pressure equal:

$$\frac{M}{R^3}\cdot\frac{kT_c}{\mu m_H} \sim \frac{GM^2}{R^4} \qquad\Longrightarrow\qquad T_c \sim \frac{GM\mu m_H}{kR}$$

Evaluate for the Sun, with $\mu = 0.6$ for fully ionised solar composition:

$$T_c \sim \frac{(6.674\times10^{-11})(1.989\times10^{30})(0.6)(1.673\times10^{-27})}{(1.381\times10^{-23})(6.957\times10^{8})} = 1.4\times10^{7}\ \text{K}$$

The modelled solar central temperature is 1.57 × 10⁷ K. The estimate is correct to within 10%.

### Read what happened

A star's internal temperature is determined by its mass and radius. It is set by gravity — not by what it is burning, not by how fast the reactions run, not by its composition, except through the mean molecular weight $\mu$. Squeeze a given quantity of gas into a given volume and the temperature required to hold it up against its own weight is fixed. The star has no choice about it.

This result underlies the mass–luminosity relation, where it is used to derive $L \propto M^3$ without any nuclear physics, and it is used again in the thermostat argument below. It is arguably the single most useful relation in stellar structure, and it comes from two lines of algebra.

There is also a consequence worth stating now, because it recurs throughout the physics of stellar death: a star that contracts gets hotter. $T_c \propto M/R$, so shrinking at fixed mass raises the central temperature. That is why a contracting protostar eventually ignites deuterium and then hydrogen; why a star that exhausts one fuel contracts until it is hot enough to burn the next; and why the sequence of nuclear burning stages exists at all. Gravity is the thing that turns the fuel up.

{{image: Sun | The Sun: a ball of gas whose internal temperature is set not by its fuel or its reaction rate but by its own mass and radius — the direct consequence of balancing pressure against weight.}}

## Negative heat capacity

Now the result that is genuinely strange, and which most people find counterintuitive the first several times.

### The virial theorem

For a self-gravitating system of ideal gas in equilibrium, integrating the hydrostatic equation over the star's volume yields

$$2K + U = 0$$

where $K$ is the total thermal kinetic energy and $U$ the gravitational potential energy (negative, by convention, since the system is bound).

The total energy is therefore

$$E = K + U = K - 2K = -K = \frac{U}{2}$$

Every term is fixed by the others. A self-gravitating ideal gas has only one free parameter.

### The consequence

Now suppose the star radiates, so that $E$ decreases — becomes more negative. Then $U = 2E$ also decreases, so the star contracts; and $K = -E$ increases, so the star gets **hotter**.

$$\text{Lose energy} \Longrightarrow \text{get hotter}$$

A star has negative heat capacity. This is not a quirk of stars; it is a property of self-gravitating systems in general, and it is why they behave so unlike laboratory objects. Cool a cup of tea and it gets colder. Cool a star and it gets hotter.

### Where the energy goes

The bookkeeping is exact and worth having. If the star contracts and releases gravitational energy $|\Delta U|$, half is radiated away and half goes into heating the interior. A contracting star can only radiate away half of what it liberates; the rest is compulsorily converted into internal heat. For the Sun:

$$U \approx -\frac{3}{5}\frac{GM_\odot^2}{R_\odot} = -2.28\times10^{41}\ \text{J}, \qquad K = \frac{|U|}{2} = 1.14\times10^{41}\ \text{J}$$

$$t_{KH} = \frac{|U|/2}{L_\odot} = 9.4\ \text{Myr}$$

That is the **Kelvin–Helmholtz timescale** — Kelvin's answer for the age of the Sun, wrong for the Sun and, as it turns out, close to exactly right for the contraction phase of a protostar. The factor of a half is why it is that number and not twice it.

### What this explains

As hydrogen fuses to helium, four particles become one and $\mu$ rises. From $T_c \sim GM\mu m_H/kR$, a higher $\mu$ demands a higher temperature at fixed radius, so the core contracts and heats — which is why the Sun is hotter and brighter now than when it formed.

It also explains why the sequence of nuclear burning stages exists at all: each fuel exhausts, the core contracts, gravity raises the temperature, and the next reaction ignites. Gravity is the mechanism that steps a star through hydrogen, helium, carbon and beyond.

And it explains why a star without a regulator is unstable. Negative heat capacity is, on its own, a destabilising feature: add energy and the system cools and expands; remove energy and it heats and contracts. What prevents runaway is the coupling to a temperature-sensitive energy source, which is the next section — and when that coupling is absent, runaway is exactly what happens.

## The thermostat

Now the control system, and it deserves to be set out carefully, because it has been leaned on implicitly wherever a star's stability is assumed.

### The loop

Suppose nuclear energy generation in the core momentarily exceeds the rate at which energy leaks out of the star. Energy accumulates and the core heats; the higher temperature raises the pressure and the core expands; the expansion does work against gravity and the gas cools; and because the reaction rate is steeply temperature-dependent, generation collapses back toward the leak rate. Balance is restored.

And in reverse if generation falls short: the core contracts, gravity heats it, and the rate climbs. This is negative feedback with a stable fixed point. The star is not balanced by luck; it is actively held.

### Why the steepness matters

The regulation is tight because the response is violent. Energy generation goes roughly as

$$\epsilon \propto \rho T^{n}, \qquad n \approx 4\ (\text{pp chain}), \qquad n \approx 17\ (\text{CNO cycle})$$

So the temperature change needed to absorb a given imbalance is $\delta T/T \approx (1/n)\,\delta\epsilon/\epsilon$. For the pp chain a 1% imbalance in the energy budget is absorbed by a 0.25% change in temperature; for the CNO cycle, by 0.06%. A six-hundredths of one percent change in temperature is enough to correct a one percent error in the energy budget. The star barely has to move.

Contrast a weakly temperature-dependent source, $n \approx 1$: a 1% imbalance would require a 1% temperature change, and hence a substantial expansion or contraction. The equilibrium would be loose, slow, and prone to overshoot. Steepness is what makes the thermostat sensitive, and it is why stars burn steadily for billions of years rather than oscillating.

### Why the main sequence is a place

This is the physical answer to a question that recurs across stellar physics: why do the great majority of stars sit on a single line in the Hertzsprung–Russell diagram, and why is the line a *location* rather than a *track*?

Because a star settles at the configuration where energy generation equals the leak rate, and that configuration is fixed by its mass. Any departure is corrected by the loop above. There is no force pushing it along the sequence and no drift, so it stays — until the fuel supply changes, at which point it leaves sideways. The early-twentieth-century reading of the main sequence as an evolutionary track, stars sliding from hot to cool as they aged, fails here at the level of mechanism: a thermostatted system does not slide.

### Why Eddington could do without nuclear physics

One more payoff. A star's luminosity is set by how fast energy can leak out through the opaque interior, not by how fast it is generated — which is why Arthur Eddington computed the mass–luminosity relation in 1924, fifteen years before anyone knew what powers a star.

The thermostat is the reason that works. The leak rate is the boundary condition, and the nuclear reactions adjust to match it. Eddington's missing energy source was not on the causal path to the luminosity — it only had to be steeply temperature-dependent, which he could assume without knowing what it was.

{{image: William Thomson, 1st Baron Kelvin | Lord Kelvin, whose contraction hypothesis for the Sun's energy — right in its physics, wrong only in the size of the reservoir it drew on — supplies the same virial bookkeeping that gives the Kelvin–Helmholtz timescale its name.}}

## Where the thermostat breaks

The value of a derived mechanism is that you can see exactly which step it depends on. The loop above rests on four requirements: an energy source in the core; **pressure increasing with temperature**; the gas being free to expand; and a temperature-sensitive reaction rate. The second of these is the fragile one, and there are two distinct circumstances in which it fails.

### Degenerate matter

At sufficiently high density, electrons are packed so closely that the Pauli exclusion principle dominates: no two can occupy the same quantum state, so they are forced into high-momentum states regardless of temperature. The resulting pressure is

$$P \propto \rho^{5/3}$$

with no temperature dependence at all — contrast the ideal gas law's $P = \rho kT/\mu m_H$. So in degenerate material, heating the core does not raise the pressure. There is no expansion, no cooling, and the reaction rate — still ferociously temperature-sensitive — climbs further. Negative feedback becomes positive feedback: a **thermonuclear runaway**, which continues until either the fuel is exhausted or the temperature rises enough to lift the degeneracy.

| Object | $\rho$ (kg/m³) | $T$ (K) | State |
|---|---|---|---|
| Sun's core | 1.5 × 10⁵ | 1.6 × 10⁷ | ideal gas |
| Red giant helium core | 10⁸ | 10⁸ | degenerate |
| White dwarf | 10⁹ | 10⁷ | degenerate |
| Brown dwarf core | 10⁶ | 10⁶ | degenerate |

Three phenomena follow. The **helium flash**: in a low-mass red giant, helium ignites in a degenerate core, and the runaway releases, briefly, a luminosity comparable to an entire galaxy's — almost all of it absorbed in lifting the degeneracy rather than escaping. **Novae**: hydrogen accreted onto the degenerate surface of a white dwarf ignites and runs away; the star survives, and the process recurs. **Type Ia supernovae**: carbon ignites in a degenerate white dwarf approaching the Chandrasekhar limit; the star cannot expand to cool, so the runaway consumes it entirely — which is why Type Ia supernovae are so uniform, and hence usable as standard candles: every one detonates from very nearly the same trigger condition, a threshold mass rather than a continuum of conditions.

One broken feedback loop, three phenomena — and the reason they are uniform, violent and, in two cases, recurrent is that the thermostat which makes ordinary stars boring is absent. A star is boring because it is regulated. Everything interesting in stellar physics happens where the regulation fails.

{{image: Type Ia supernova | A Type Ia supernova: carbon ignition in a degenerate white dwarf, where the pressure cannot respond to rising temperature, so the thermonuclear runaway propagates through the entire star rather than being checked — the same broken feedback loop as the helium flash and the nova, taken to its most violent conclusion.}}

### The other failure mode: radiation pressure

There is a second way for the pressure-temperature link to fail, and it operates at the opposite end of the mass range. In very massive stars, radiation pressure becomes a substantial fraction of the total:

$$P_{rad} = \frac{aT^4}{3}$$

| $M/M_\odot$ | $P_{rad}/P_{total}$ |
|---|---|
| 1 | ~0.03% |
| 5 | 1.1% |
| 20 | 7.3% |
| 60 | 25% |

A gas supported by radiation has an effective adiabatic index approaching 4/3 — the marginal value for dynamical stability. A star dominated by radiation pressure is structurally close to being unbound: perturb it and it neither restores nor obviously collapses.

This is why massive stars have an upper limit. It underlies the Eddington luminosity and the roughly 150 M☉ ceiling on stellar mass, and it is why the most massive stars are violently variable, shed mass copiously, and are rare.

Ordinary stars are stable because gas pressure holds them up and gas pressure responds to temperature. Take away the temperature dependence at the bottom of the mass range, through degeneracy, or dilute it at the top, through radiation pressure, and stability goes with it.

{{image: Eta Carinae | Eta Carinae, a star (or stellar system) massive enough that radiation pressure supplies a large fraction of its internal support — structurally close to the marginal 4/3 adiabatic index, and correspondingly unstable, violently variable, and a copious shedder of mass.}}

## Pulling the thread

- The Sun is twenty-nine minutes from collapse at all times, and the balance has held for eighty trillion free-fall times. Precision of that order is not a coincidence; it is a control system, which is why this result comes first.
- Hydrostatic equilibrium, $dP/dr = -GM(r)\rho/r^2$, contains no time, no energy source and no temperature. It gives $P_c \sim GM^2/R^4$ — right in scaling, low by about twenty times in coefficient, because the Sun is centrally concentrated rather than uniform.
- Combined with the ideal gas law it gives $T_c \sim GM\mu m_H/kR$, which reproduces the Sun's central temperature to within 10%. A star's internal temperature is set by gravity, not by its fuel or its reaction rate — and since $T_c \propto M/R$, contraction turns the fuel up, which is why each exhausted fuel is followed by the ignition of the next.
- The virial theorem gives $E = U/2 = -K$, so a star has negative heat capacity: lose energy and it gets hotter. Half of any released gravitational energy is radiated and half compulsorily heats the interior, which is where the factor in the Kelvin–Helmholtz timescale (9.4 Myr for the Sun) comes from. It explains why stars brighten as they age, why burning stages occur in sequence, and why an unregulated star runs away.
- The thermostat is a negative feedback loop, and it is tight because the reaction rate is steep: with $\epsilon \propto T^{17}$, a 0.06% temperature change absorbs a 1% imbalance. This is why the main sequence is a place rather than a track, and why Eddington could compute a star's luminosity in 1924 without knowing what powers it.
- The link between temperature and pressure is the fragile step. In degenerate matter the pressure does not depend on temperature, so heating produces no expansion and no cooling: negative feedback becomes positive. The helium flash, novae and Type Ia supernovae are all the same broken loop. At the other end, radiation pressure dilutes the temperature dependence, pushing the effective adiabatic index toward the marginally stable 4/3 — which is why there is an upper mass limit on stars.

A star is boring because it is regulated. Everything interesting in stellar physics happens where the regulation fails — and this node has shown only that the reaction rate must be steeply temperature-dependent for the thermostat to work, using exponents of 4 and 17 without justifying either. The Sun's core sits at 1.5 × 10⁷ K, and two protons at that temperature have nowhere near enough energy to overcome their mutual electrostatic repulsion. Eddington, told exactly this, replied that his critics should find a hotter place — the wrong defence, since the Sun really is that cool. What actually gets the protons through, and where those exponents come from, is the nuclear physics this node deliberately left out.

## Further reading

A systematic graduate-level treatment of the hydrostatic and thermal equations of stellar structure, the virial theorem, the thermostat and the physics of degenerate equations of state is given in {{book: Rudolf Kippenhahn, Alfred Weigert, and Achim Weiss | Stellar Structure and Evolution | 2012}}.

- **Rudolf Kippenhahn, Alfred Weigert, and Achim Weiss, *Stellar Structure and Evolution*, 2nd edition (2012).** The standard graduate reference on the equations of stellar structure, deriving hydrostatic equilibrium, the virial theorem and the Kelvin–Helmholtz timescale, the equation of state across the ideal-gas and degenerate regimes, and the thermal stability arguments that govern the helium flash, novae and the upper mass limit set by radiation pressure.

## Problems

*Data: $G = 6.674\times10^{-11}$, $k = 1.381\times10^{-23}$ J/K, $m_H = 1.673\times10^{-27}$ kg, $a = 7.566\times10^{-16}$ J m⁻³ K⁻⁴. $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, $L_\odot = 3.828\times10^{26}$ W. Solar central values: $T_c = 1.57\times10^{7}$ K, $\rho_c = 1.5\times10^{5}$ kg/m³, $P_c = 2.5\times10^{16}$ Pa. Fully ionised solar composition: $\mu \approx 0.6$. $t_{ff} = \sqrt{3\pi/32G\bar\rho}$. Virial: $2K + U = 0$, $U \approx -\tfrac{3}{5}GM^2/R$. 1 yr = 3.156 × 10⁷ s.*

### 1 — Twenty-nine minutes
**(a)** Compute the Sun's mean density and its free-fall time.
**(b)** Express the Sun's age as a multiple of that free-fall time.
**(c)** Explain why the precision of the balance is itself an argument, and what it argues for.
**(d)** Name three things that have changed about the Sun over its lifetime, and explain why they make a "lucky configuration" explanation untenable.

### 2 — The equation
**(a)** Derive the hydrostatic equation by balancing forces on a thin shell. State which mass enters and why.
**(b)** State the three quantities the equation does not contain, and give one class of object other than a main-sequence star to which it therefore applies.
**(c)** Obtain $P_c \sim GM^2/R^4$ dimensionally, and evaluate for the Sun.
**(d)** Compare with the modelled value of 2.5 × 10¹⁶ Pa. Explain the discrepancy and state which part of the result is nonetheless reliable.

### 3 — Temperature from gravity *(the central result)*
**(a)** Combine the hydrostatic estimate with the ideal gas law to obtain $T_c \sim GM\mu m_H/kR$.
**(b)** Evaluate for the Sun with $\mu$ = 0.6 and compare with 1.57 × 10⁷ K.
**(c)** State in one sentence what determines a star's internal temperature, and list three things that do not.
**(d)** Show that $T_c \propto M/R$ implies that a contracting star heats up. Name two consequences of this.
**(e)** As hydrogen fuses to helium, $\mu$ rises from ~0.6 to ~1.34. At fixed radius, by what factor does the required central temperature change? What must actually happen instead?

### 4 — Negative heat capacity
**(a)** State the virial theorem for a self-gravitating ideal gas and derive $E = U/2 = -K$.
**(b)** Show that a star losing energy must contract and heat up.
**(c)** State what fraction of released gravitational energy is radiated and what fraction heats the interior.
**(d)** Compute $U$ for the Sun using $U \approx -\tfrac{3}{5}GM^2/R$, and hence the Kelvin–Helmholtz timescale. Explain where the factor of two enters.
**(e)** Explain why negative heat capacity is destabilising on its own, and what prevents runaway in a normal star.
**(f)** Give one everyday system with positive heat capacity and state, in one sentence, the qualitative difference in behaviour.

### 5 — The thermostat *(derive it, then break it)*
**(a)** Set out the feedback loop, beginning with an excess of energy generation.
**(b)** With $\epsilon \propto T^n$, show that the fractional temperature change needed to absorb a fractional imbalance $\delta\epsilon/\epsilon$ is $(1/n)\,\delta\epsilon/\epsilon$.
**(c)** Evaluate for a 1% imbalance with $n$ = 4 and $n$ = 17.
**(d)** Explain what would happen if $n \approx 1$, and why steepness makes the equilibrium tight.
**(e)** Explain, using the thermostat, why the main sequence is a place rather than a track — and identify which historical error this refutes.
**(f)** Explain why the thermostat is the reason Eddington could derive the mass–luminosity relation without knowing what powers a star.

### 6 — Where it fails
**(a)** Identify which step of the loop is fragile, and state the physical requirement it depends on.
**(b)** Write the equation of state for a degenerate electron gas and contrast it with the ideal gas law. State precisely what is missing.
**(c)** Trace the loop through, showing where it fails and what it becomes.
**(d)** Name three phenomena that result, and state which of them is recurrent and which destroys the star.
**(e)** Explain why Type Ia supernovae are uniform enough to serve as standard candles, referring to the mechanism.
**(f)** Radiation pressure is the other failure mode. Compute $P_{rad}/P_{gas}$ for a 60 M☉ star with $T_c$ = 4.2 × 10⁷ K and $\rho_c$ = 4 × 10³ kg/m³ ($\mu$ = 0.6), and state the consequence for stability.

### 7 — Numerical
**(a)** Estimate the central pressure and temperature of a 10 M☉ star with $R = 4\,R_\odot$.
**(b)** Repeat for a 0.2 M☉ star with $R = 0.25\,R_\odot$.
**(c)** Compare the two central temperatures and comment on what this implies about which reaction cycle dominates in each.
**(d)** Compute the free-fall time for a red giant of 1 M☉ and 100 $R_\odot$, and compare with the Sun's.
**(e)** Compute the Kelvin–Helmholtz timescale for the red giant in (d), taking $L = 1{,}000\,L_\odot$. Comment.

### 8 — Reading the assumption
Hydrostatic equilibrium assumes acceleration is negligible.
**(a)** State the condition under which that assumption is valid, in terms of timescales.
**(b)** Name three astrophysical situations in which it fails, and state what replaces it.
**(c)** A star's structure is computed by assuming hydrostatic equilibrium at every instant while its composition slowly changes. Explain why this is legitimate, and name the two timescales being compared.
**(d)** Estimate the ratio of those two timescales for the Sun.

### 9 — Open problem: how well do we know the interior?
Every claim in this node concerns a place no instrument can reach.
**(a)** List the assumptions made in deriving $T_c$, and identify which is most likely to be wrong.
**(b)** State what independent evidence exists that the Sun's interior is as described.
**(c)** Suppose the solar interior turned out to have a central temperature 10% below the model value. Trace the consequences for at least three other results in stellar physics.
**(d)** Explain why "the model reproduces the Sun's observed luminosity and radius" is a weaker test than it appears, and what would constitute a stronger one.

## Worked answers

### 1 — Twenty-nine minutes

**(a)** $\bar\rho = M_\odot/\tfrac{4}{3}\pi R_\odot^3 = 1.989\times10^{30}/(1.412\times10^{27}) = 1{,}410\ \text{kg/m}^3$

$t_{ff} = \sqrt{3\pi/(32 \times 6.674\times10^{-11} \times 1410)} = \sqrt{3.13\times10^{6}} = 1{,}769\ \text{s} = 29.5\ \text{min}$

**(b)** $4.57\times10^{9} \times 3.156\times10^{7}/1769 = 8.2\times10^{13}$ — about **eighty trillion** free-fall times.

**(c)** Because a balance that is merely coincidental is unstable: any small departure would grow, and over 8 × 10¹³ dynamical times it would have grown enormously. Persistence over that many characteristic timescales requires that departures are actively corrected, not merely absent. It argues for a **negative feedback mechanism** — something that responds to a perturbation by opposing it — before any regulator has been identified.

**(d)** The Sun's **luminosity has risen by ~40%** since it formed. Its **core composition has changed** substantially — roughly half the central hydrogen is now helium, raising $\mu$ from ~0.6 toward ~0.85 in the core. And its **core has contracted and heated** as a consequence.

A "lucky configuration" explanation fails because the configuration has not been the same one throughout. The star has been continuously reconfiguring itself in response to changing internal conditions, and has remained in equilibrium at every stage. That is a control system responding to a moving target, not a fortunate initial condition.

### 2 — The equation

**(a)** Take a shell at radius $r$, thickness $dr$, density $\rho$, of unit area. Downward: the weight, $GM(r)\rho\,dr/r^2$. Upward: the net pressure force, $P(r) - P(r+dr) = -(dP/dr)dr$. Setting the acceleration to zero:

$$-\frac{dP}{dr}dr = \frac{GM(r)\rho\,dr}{r^2} \quad\Longrightarrow\quad \frac{dP}{dr} = -\frac{GM(r)\rho}{r^2}$$

Only the mass interior to $r$ enters. By Newton's shell theorem, a spherically symmetric shell exerts no net gravitational force on anything inside it, so material above the point in question contributes nothing to the gravitational force there — only to the pressure.

**(b)** It contains no **time**, no **energy source**, and no **temperature**. It therefore applies to any object in mechanical equilibrium regardless of whether it generates energy: a brown dwarf, a white dwarf, or a giant planet — Jupiter's interior structure is computed from the same equation.

**(c)** $P_c/R \sim (GM/R^2)(M/R^3)$, so $P_c \sim GM^2/R^4$.
$P_c \sim (6.674\times10^{-11})(1.989\times10^{30})^2/(6.957\times10^{8})^4 = 1.13\times10^{15}\ \text{Pa}$

**(d)** Modelled: 2.5 × 10¹⁶ Pa. The estimate is low by a factor of ~22, because it assumes uniform density, replacing $\rho$ by $M/R^3$ throughout. The real Sun is strongly centrally concentrated — its central density is 1.5 × 10⁵ kg/m³ against a mean of 1,410, a factor of over 100 — so the true weight of overlying material at the centre is far greater than a uniform model implies.

The reliable part is the **scaling**, $P_c \propto M^2/R^4$. That relation holds for any star with a similar density profile, and it is what carries the physics into the mass–luminosity derivation, where only ratios matter and the coefficient cancels.

### 3 — Temperature from gravity

**(a)** Ideal gas at the centre: $P_c = \rho_c kT_c/\mu m_H$, and with $\rho_c \sim M/R^3$:

$$\frac{M}{R^3}\frac{kT_c}{\mu m_H} \sim \frac{GM^2}{R^4} \quad\Longrightarrow\quad T_c \sim \frac{GM\mu m_H}{kR}$$

**(b)** $T_c \sim (6.674\times10^{-11})(1.989\times10^{30})(0.6)(1.673\times10^{-27})/[(1.381\times10^{-23})(6.957\times10^{8})] = 1.39\times10^{7}\ \text{K}$, against 1.57 × 10⁷ K — within 11%.

*(The crude pressure estimate was off by a factor of 22 while the temperature estimate is off by 11%. The errors in $P_c$ and $\rho_c$ largely cancel in the ratio, which is why the temperature is the more robust prediction.)*

**(c)** A star's internal temperature is set by its mass and radius — by gravity. It is **not** set by what fuel it is burning, how fast the nuclear reactions run, or how much fuel remains. (Composition enters only weakly, through $\mu$.)

**(d)** $T_c \propto M/R$ at fixed $M$ means smaller $R$ gives larger $T_c$: contraction heats the core. A contracting protostar eventually reaches 10⁶ K and ignites deuterium, then 1.5 × 10⁷ K and ignites hydrogen — gravity supplies the ignition. And a star that exhausts one fuel contracts until the temperature suffices for the next, which is why nuclear burning proceeds as a sequence of stages rather than stopping.

**(e)** $T_c \propto \mu$, so the required temperature rises by a factor of $1.34/0.6 = 2.2$.

The star cannot simply raise its temperature at fixed radius, because $T_c$ is determined by $M/R$. To satisfy the new requirement the **core must contract**, which raises $T_c$ via the $1/R$ dependence. The contraction also raises the density and hence the reaction rate, so the star brightens — the mechanism behind the steady increase in solar luminosity over the main-sequence lifetime.

### 4 — Negative heat capacity

**(a)** Virial theorem: $2K + U = 0$ for a self-gravitating ideal gas in equilibrium.

$$E = K + U = K + (-2K) = -K, \qquad \text{and} \qquad K = -\frac{U}{2} \Rightarrow E = \frac{U}{2}$$

**(b)** Radiating means $E$ decreases (becomes more negative). From $U = 2E$: $U$ becomes more negative, so the star is more tightly bound — it has **contracted**. From $K = -E$: $K$ **increases**, so the thermal energy rises — the star is **hotter**. Both follow from the same single degree of freedom; there is no way to lose energy and cool.

**(c)** **Half is radiated, half heats the interior.** If $U$ becomes more negative by $|\Delta U|$, then $K$ increases by $|\Delta U|/2$ and $E$ decreases by $|\Delta U|/2$. The energy radiated is $|\Delta E| = |\Delta U|/2$.

**(d)** $U = -\tfrac{3}{5}(6.674\times10^{-11})(1.989\times10^{30})^2/(6.957\times10^{8}) = -2.28\times10^{41}\ \text{J}$

$t_{KH} = \dfrac{|U|/2}{L_\odot} = \dfrac{1.14\times10^{41}}{3.828\times10^{26}} = 2.98\times10^{14}\ \text{s} = 9.4\ \text{Myr}$

The **factor of two is the virial theorem**: only half the liberated gravitational energy is available to radiate, the other half being compulsorily converted into internal heat. Omit it and you overestimate the timescale by a factor of two.

**(e)** Negative heat capacity means perturbations are not damped in the ordinary way. Add energy to a normal object and it warms until it radiates the excess; add energy to a star and it expands and cools — its temperature moves away from where it was. There is no restoring tendency in the thermal response itself. What prevents runaway is the **coupling to a temperature-sensitive energy source**: because $\epsilon \propto T^n$ with large $n$, cooling collapses the generation rate and heating raises it, supplying the restoring term the thermal response lacks. Negative heat capacity plus a steep energy source equals stability; negative heat capacity alone does not.

**(f)** A cup of tea. Remove energy and it gets colder; add energy and it gets hotter — the temperature follows the energy. A normal object's temperature tracks its energy, while a star's runs opposite to it: it responds to being cooled by heating up and to being heated by cooling down.

### 5 — The thermostat

**(a)** Excess generation → core heats. Higher $T$ raises pressure → core expands. Expansion does work against gravity → gas cools. Steeply temperature-sensitive rate → generation collapses. Balance restored.

**(b)** $\epsilon \propto T^n$, so $\ln\epsilon = n\ln T + $ const. Differentiating:

$$\frac{\delta\epsilon}{\epsilon} = n\frac{\delta T}{T} \quad\Longrightarrow\quad \frac{\delta T}{T} = \frac{1}{n}\frac{\delta\epsilon}{\epsilon}$$

**(c)** For $\delta\epsilon/\epsilon = 0.01$: $n = 4$ gives $\delta T/T = 0.25\%$; $n = 17$ gives $0.059\%$.

**(d)** With $n \approx 1$, a 1% imbalance would require a 1% temperature change — sixteen times larger than in the CNO case. Since $T_c \propto 1/R$, that implies a comparable fractional change in radius, so the star would have to expand or contract by ~1% to regulate. The equilibrium would be loose and slow: large structural adjustments to correct small imbalances, with long response times and a tendency to overshoot. Steepness means the star can correct an imbalance while barely moving, which is why the equilibrium is both tight and fast.

**(e)** Because a star sits where energy generation equals the leak rate, and that configuration is determined by its mass. Any departure is actively corrected. There is no residual force driving it along the sequence, so it stays put until the fuel supply changes, and then it leaves *sideways* onto the giant branch. This refutes the early evolutionary interpretation of the main sequence, in which stars were thought to condense as hot stars and slide down the sequence as they cooled. The thermostat refutes it mechanically — a regulated system does not drift.

**(f)** Because the thermostat means the luminosity is set by the leak rate rather than by the generation rate. Energy diffuses out at a rate fixed by the opacity, mass and temperature gradient — all consequences of hydrostatic equilibrium — and the nuclear reactions then adjust to supply exactly that. The energy source is a boundary condition, not a driver: something must deliver energy at the required rate, but *what* it is does not affect the answer, provided it is steeply temperature-dependent enough to self-regulate. Eddington's missing nuclear physics was therefore not on the causal path to the luminosity — which is why his 1924 derivation was correct fifteen years before Bethe worked out the reactions.

### 6 — Where it fails

**(a)** The step that heating the core raises the pressure. It requires the equation of state to be temperature-dependent.

**(b)** Ideal gas: $P = \rho kT/\mu m_H$. Degenerate electron gas: $P = K\rho^{5/3}$. **Temperature is missing entirely** from the degenerate expression — the pressure arises from the Pauli exclusion principle forcing electrons into high momentum states regardless of thermal energy, so heating adds thermal energy without adding pressure.

**(c)** Excess generation → core heats. Pressure does not respond — no expansion. The reaction rate, still $\propto T^n$, rises further, feeding back into more generation. **The loop becomes positive feedback: a thermonuclear runaway**, continuing until the fuel is exhausted or the temperature rises enough that thermal pressure exceeds degeneracy pressure and the material expands.

**(d)** The **helium flash** (a degenerate helium core in a low-mass red giant), **novae** (hydrogen accreted onto a white dwarf's degenerate surface), and **Type Ia supernovae** (carbon ignition in a white dwarf near the Chandrasekhar limit). Novae are recurrent — the runaway is confined to the accreted surface layer, the star survives, and accretion resumes. Type Ia supernovae destroy the star, since the runaway propagates through the whole degenerate body. *(The helium flash is survived: the runaway lifts the degeneracy, after which normal regulated helium burning begins.)*

**(e)** Because the explosion is triggered by the star reaching a specific, universal mass — the Chandrasekhar limit, ~1.4 M☉, above which electron degeneracy pressure can no longer support the star. Every Type Ia therefore detonates from very nearly the same initial conditions, so the energy released is similar from event to event, which is what makes the peak luminosity standardisable. The uniformity is a consequence of the trigger being a threshold rather than a continuum, and that threshold exists because degeneracy pressure has a maximum.

**(f)** $P_{rad} = aT^4/3 = (7.566\times10^{-16})(4.2\times10^{7})^4/3 = 7.85\times10^{14}\ \text{Pa}$
$P_{gas} = \rho kT/\mu m_H = (4\times10^{3})(1.381\times10^{-23})(4.2\times10^{7})/(0.6 \times 1.673\times10^{-27}) = 2.31\times10^{15}\ \text{Pa}$

Ratio $P_{rad}/P_{gas} = 0.34$, so radiation supplies **25%** of the total pressure. A gas supported partly by radiation has an effective adiabatic index between the ideal-gas value of 5/3 and the pure-radiation value of 4/3 — the marginal value for dynamical stability. A star approaching that limit has almost no restoring force against radial perturbations, which is why very massive stars are structurally fragile, variable, heavy mass-losers, and subject to an upper mass limit.

### 7 — Numerical

**(a)** 10 M☉, 4 $R_\odot$: $P_c \sim GM^2/R^4 = 4.4\times10^{14}\ \text{Pa}$; $T_c \sim GM\mu m_H/kR = 3.5\times10^{7}\ \text{K}$

**(b)** 0.2 M☉, 0.25 $R_\odot$: $P_c \sim 1.2\times10^{16}\ \text{Pa}$; $T_c \sim 1.1\times10^{7}\ \text{K}$

**(c)** Ratio of central temperatures: $3.5\times10^{7}/1.1\times10^{7} = 3.1$. The 10 M☉ star's core exceeds ~1.8 × 10⁷ K, above which the **CNO cycle** dominates over the pp chain because of its far steeper temperature dependence ($T^{17}$ versus $T^{4}$). The 0.2 M☉ star, at ~10⁷ K, runs almost entirely on the **pp chain**.

*(Note also that the low-mass star has the higher central pressure despite the lower temperature, because it is so much denser — a reminder that $P$ and $T$ are not interchangeable.)*

**(d)** $\bar\rho = M_\odot/\tfrac{4}{3}\pi(100R_\odot)^3 = 1.41\times10^{-3}\ \text{kg/m}^3$ — a millionth of the Sun's mean density.

$t_{ff} = \sqrt{3\pi/(32G \times 1.41\times10^{-3})} = 1.77\times10^{6}\ \text{s} = 20.5\ \text{days}$, against the Sun's 29 minutes — longer by a factor of 1,000, as $t_{ff} \propto \rho^{-1/2}$ predicts for a density ratio of 10⁶.

**(e)** $U = \tfrac{3}{5}GM_\odot^2/(100R_\odot) = 2.28\times10^{39}\ \text{J}$; $t_{KH} = (U/2)/(1000L_\odot) = 94\ \text{years}$.

A red giant's envelope is gravitationally almost unbound and enormously luminous, so its thermal timescale is under a century — human, not astronomical. This is why red giant envelopes are loosely held, why they pulsate readily, and why they are shed so easily to form planetary nebulae. The envelope is barely attached.

### 8 — Reading the assumption

**(a)** Valid when the dynamical (free-fall) timescale is much shorter than the timescale on which conditions change. The star can then re-establish mechanical balance essentially instantaneously compared with whatever is evolving.

**(b)** **Core collapse in a supernova** — the pressure support fails catastrophically and the core falls in on a dynamical timescale; replaced by the full equation of motion with an inertial term. **Stellar pulsation** (Cepheids, RR Lyrae) — the star oscillates about equilibrium, so acceleration is not zero; replaced by the wave equation for radial oscillations. **The collapse of a molecular cloud core** — gravity exceeds support entirely; replaced by free-fall dynamics.

*(Also creditable: a thermonuclear runaway in degenerate matter, where the burning timescale becomes shorter than the dynamical one — which is precisely why it cannot be regulated.)*

**(c)** Because the dynamical timescale is vastly shorter than the nuclear timescale. The star restores mechanical balance in minutes while its composition changes over billions of years, so at every instant it is, to an extraordinary approximation, in exact hydrostatic equilibrium. This is the standard quasi-static approximation, and it is what makes stellar evolution computable: one solves the equilibrium structure repeatedly for a slowly changing composition, rather than integrating the full dynamics. The two timescales are $t_{ff}$ (dynamical) and $t_{nuc}$ (nuclear).

**(d)** $t_{nuc}/t_{ff} = 10^{10}\ \text{yr}/29\ \text{min} = 3.16\times10^{17}/1.77\times10^{3} = 1.8\times10^{14}$ — fourteen orders of magnitude. The approximation is not merely good; it is among the best-justified approximations in physics.

### 9 — Open problem: how well do we know the interior?

**(a)** Assumptions: spherical symmetry (no rotation, no magnetic fields, no convective asymmetry); the ideal gas law, which neglects degeneracy and Coulomb interactions; a single mean molecular weight $\mu$, ignoring composition gradients; negligible radiation pressure; negligible acceleration; and the replacement of derivatives by characteristic values in the dimensional estimate.

Most likely to be wrong: **the treatment of $\mu$ as uniform.** The Sun's core is now substantially helium-enriched relative to its envelope, so $\mu$ varies with radius — and since $T_c \propto \mu$, the composition gradient matters directly. *(Rotation and magnetic fields are small for the Sun but not for all stars.)*

**(b)** Two independent probes exist. **Helioseismology** — the Sun's surface oscillates in millions of acoustic modes whose frequencies depend on the sound speed along their paths; inverting them yields the internal sound-speed profile to about 0.1%, and hence the depth of the convection zone and the interior helium abundance. **Solar neutrinos** — produced directly in the core by the reactions themselves, and escaping essentially unimpeded, so they report on conditions at the centre in real time.

**(c)** A 10% lower $T_c$ would have wide consequences, because the reaction rate is so steep. **The nuclear energy generation rate** would fall by $0.9^{4} = 0.66$ for pp burning — a 34% reduction — so the Sun could not radiate at its observed luminosity, and the standard model would be falsified. **Stellar lifetimes** would change, since $t \propto M/L$ and the luminosity would be wrong, propagating into cluster ages. **The mass–luminosity relation** would shift, since it rests on the same structure equations, and with it every stellar mass inferred from a luminosity.

*(And the solar neutrino flux would be wrong by a large factor, since it scales even more steeply with $T_c$ — which is precisely how neutrino measurements constrain the central temperature.)*

**(d)** Because luminosity and radius are the quantities the models are calibrated to reproduce. Stellar models contain adjustable parameters — the mixing-length parameter for convection, the initial helium abundance — which are tuned so that a 1 M☉ model at 4.57 Gyr has the Sun's observed $L$ and $R$. Reproducing them is therefore a check that the fitting was done correctly, not a test of the physics.

A stronger test is a prediction of something not used in the calibration. **Helioseismology** predicts an internal sound-speed profile that no model parameter was tuned to match, and standard solar models reproduce it to ~0.1%. **Neutrino fluxes** likewise depend on the core temperature far more steeply than the luminosity does, and were predicted before they were measured. Those are the real tests, and the model passes them — which is why the interior is considered known despite being permanently unobservable.$astroHydroEq_master$,
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
