-- Astronomy & Space · Exoplanets — System Diversity — "Formation & Migration".
-- Curated master for
-- astronomy-and-space/exoplanets/system-diversity/formation-and-migration
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- Closes the System Diversity block. Organised around the barriers
-- rather than the stages: planet formation has to cross several
-- obstacles each of which looks fatal, and the theory is a sequence of
-- solutions to problems that should not be solvable. The sharpest is
-- the metre-size barrier - a metre-scale body at 1 AU spirals into the
-- star in a few tens of years, faster than it can grow - and its
-- resolution by the streaming instability, which skips the vulnerable
-- size range entirely by collapsing pebble clouds straight to 100 km
-- bodies, is the field's most important advance in decades. The
-- migration section is structured the same way: Type I timescales are
-- an order of magnitude shorter than disc lifetimes, so everything
-- should have fallen in, and the observed population is the evidence
-- that something stops it.
-- ~10,000 words, multi-question checkpoints throughout.
--
-- Numbers verified before drafting: Keplerian speed 29.8 km/s at 1 AU;
-- maximum radial drift speed eta v_K = 74-149 m/s for eta = 0.0025-
-- 0.005, giving inward drift from 1 AU in 32-64 years for a Stokes
-- number of unity; Type I migration timescales in a minimum-mass
-- nebula of 6.9e5 yr for 1 Earth mass at 1 AU, 6.9e4 yr for 10 Earth
-- masses at 1 AU, and 3.5e5 yr for 10 Earth masses at 5 AU, against
-- observed disc lifetimes with a median near 3 Myr.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/exoplanets/system-diversity/formation-and-migration',
    'research',
    'advanced',
    'read',
    $exForm_master$> A metre-wide rock orbiting at one astronomical unit spirals into its star in about **fifty years**. Not fifty million — fifty. It has to grow through that size range to become a planet, and growth by collisions at that stage takes far longer than the crossing time.

This is the **metre-size barrier**, and for decades it was the point at which every account of planet formation stopped making sense. Planets exist, so the barrier is crossed; the question was how, and the answer turned out to require abandoning the picture of steady growth by pairwise collisions altogether.

The barrier is not unique. Planet formation is a sequence of obstacles — grains that stop sticking, bodies that drift into the star, cores that take too long to build, planets that migrate into the star before the disc disperses — each of which looks fatal on its own terms. **The theory is best understood as a list of solutions to problems that should not be solvable**, and reading it that way makes clear which parts are secure and which are still being argued.

## 1. The sequence, and its timescale

The disc from which planets form lasts a few million years. Infrared excess surveys — measuring what fraction of stars of a given age still show warm dust — give a **median disc lifetime near $3$ Myr**, with few surviving past $10$ Myr.

Everything must happen in that window: micron dust must become thousand-kilometre planets, a factor of $10^{12}$ in size and $10^{36}$ in mass. The stages are conventionally:

1. **Dust to pebbles** — micron grains collide and stick, growing to millimetres and centimetres.
2. **Pebbles to planetesimals** — kilometre-scale bodies, gravitationally bound.
3. **Planetesimals to cores** — runaway and oligarchic growth to Earth masses.
4. **Cores to giants** — envelope capture and runaway gas accretion, if there is time.

**Barriers sit between two of these stages**, and the second is the severe one.

## 2. The first barrier: sticking stops

Micron grains collide gently and stick through van der Waals forces, growing readily. Growth stalls at millimetre to centimetre sizes for two reasons.

**Bouncing.** Above about a millimetre, collisions at the relevant speeds no longer stick; the aggregates bounce apart. Laboratory experiments dropping dust aggregates at controlled speeds established this directly, and it is one of the few parts of planet formation with genuine laboratory input.

**Fragmentation.** As bodies grow, turbulence gives them higher relative velocities, and above roughly a metre per second collisions shatter rather than build.

**This barrier is soft.** Sticking depends on composition, porosity and whether the grains are icy — ice is stickier than silicate, so growth proceeds further beyond the snow line — and it delays rather than forbids. It is the second barrier that is hard.

## 3. The metre-size barrier

### 3.1 The mechanism

Gas in a disc is partially supported against gravity by its own pressure gradient, so it orbits slightly **slower** than the Keplerian speed. Solid bodies feel no pressure and orbit at the full Keplerian rate, so they experience a persistent headwind.

The headwind removes angular momentum and the body spirals inward. How fast depends on how strongly it couples to the gas, measured by the **Stokes number** — the ratio of the body's aerodynamic stopping time to the orbital time.

- **Small grains** ($\text{St}\ll1$) are carried along with the gas and drift slowly.
- **Large bodies** ($\text{St}\gg1$) are barely affected and drift slowly.
- **$\text{St}\approx1$** — which at $1$ AU means roughly metre-sized — couples worst and drifts fastest.

The maximum drift speed is $\eta v_K$, where $\eta$ is the fractional pressure support, of order $(h/r)^2 \approx 0.0025$–$0.005$. With $v_K = 29.8$ km s$^{-1}$ at $1$ AU:

$$v_{\rm drift,max} = 74\text{–}149\ \text{m s}^{-1} \quad\Longrightarrow\quad t_{\rm drift} = \frac{1\ \text{AU}}{v_{\rm drift}} = 32\text{–}64\ \text{years}.$$

**Tens of years to fall into the star, against millions of years available and far longer than that needed to grow by collisions.** The barrier is not a slow leak; it is a catastrophe.

### 3.2 Why it is worse than it looks

Two features sharpen it.

**The problem is self-reinforcing.** Bodies that do grow past a metre pass through the worst-coupled range on the way, so the size distribution is continuously drained at exactly the point through which everything must pass.

**It is a rate comparison, not a possibility argument.** Nothing forbids a metre body from growing; the point is that it falls into the star first. Any solution must either speed growth by orders of magnitude or avoid the vulnerable size range altogether.

## 4. The solution: the streaming instability

The resolution, developed over the last two decades and now the standard picture, does the second thing: **it skips the vulnerable sizes entirely.**

**The mechanism.** Consider a local concentration of pebbles. The pebbles drag on the gas, and where they are dense they accelerate it toward the Keplerian speed, which reduces the headwind those pebbles feel. Feeling less headwind, they drift inward more slowly — so pebbles from further out, still drifting fast, catch up and join the clump. **The concentration feeds itself.**

This is a genuine instability with a positive feedback loop, and simulations show it producing dense filaments in which the pebble-to-gas ratio rises by orders of magnitude.

**The outcome.** Once a filament exceeds its own local Roche density, it collapses gravitationally — not by pairwise collisions but as a cloud, directly into a bound body. The characteristic size that emerges is around **$100$ kilometres**, which is large enough that radial drift is negligible.

**Three things recommend it.**

*It solves the barrier by avoiding it.* Nothing spends time at a metre in size; the transition from pebbles to $100$ km planetesimals is essentially instantaneous.

*It predicts a size.* The characteristic diameter of about $100$ km is a prediction rather than a fitted parameter, and it matches the observed size distribution of asteroids and Kuiper belt objects, which shows a break near that scale that had long lacked an explanation.

*It predicts binaries.* Collapsing clouds with angular momentum form binaries at high rates, and the Kuiper belt's cold classical population is indeed binary-rich with matched colours — a prediction confirmed after the fact but not used in constructing the model.

**Its requirements are its weakness.** The instability needs a locally enhanced pebble-to-gas ratio and a fairly narrow range of Stokes numbers, so it does not operate everywhere. Where those conditions are met — and what enhances the ratio in the first place — remains an active question, and the answer determines where planetesimals form, which in turn shapes everything downstream.

```checkpoint
q: Why does a metre-sized body at $1$ AU drift inward so much faster than either a micron grain or a kilometre boulder?
a: Because its mass-to-area ratio is at the extreme of the range, maximising gas drag
x: Mass-to-area does control the coupling, but the drift is fastest at an intermediate value rather than an extreme.
a*: Because its aerodynamic stopping time is comparable to the orbital period, so it couples to the gas neither tightly enough to move with it nor loosely enough to ignore it
a: Because turbulence is strongest at that scale, stirring such bodies inward
x: Turbulence affects relative velocities and fragmentation but is not what drives systematic inward drift.
a: Because bodies of that size are the most fragile and shed mass, losing angular momentum
x: Mass loss does not produce inward migration; the drift comes from the persistent headwind.
hint: The drift speed depends on the Stokes number and is maximised at $\\text{St}\\approx1$. Ask what happens at very small and very large Stokes numbers.
why: Gas is partly supported by its own pressure gradient, so it orbits slightly slower than Keplerian, while solids feel no pressure and orbit at the full Keplerian speed — giving them a persistent headwind that removes angular momentum. How much that matters depends on the **Stokes number**, the ratio of aerodynamic stopping time to orbital time. Small grains have $\\text{St}\\ll1$: they are dragged along with the gas and share its motion, so there is almost no relative velocity to remove angular momentum. Large bodies have $\\text{St}\\gg1$: the drag is negligible against their inertia. **The worst case is $\\text{St}\\approx1$**, roughly metre-scale at $1$ AU, where the coupling is strong enough to matter and weak enough not to eliminate the relative velocity. The drift speed there approaches $\\eta v_K = 74$–$149$ m s$^{-1}$, carrying the body from $1$ AU into the star in $32$–$64$ years — against a disc lifetime of about $3$ Myr and a collisional growth time far longer than either. The barrier is therefore a rate comparison rather than a prohibition: nothing forbids growth, but the body is destroyed first.
---
q: The streaming instability resolves the metre-size barrier. By what strategy?
a: By speeding up collisional growth so bodies pass through the vulnerable size range quickly
x: The instability does not accelerate pairwise collisions; it bypasses that growth mode entirely.
a*: By skipping the vulnerable sizes altogether — a self-concentrating pebble filament collapses gravitationally straight to a body of about $100$ km
a: By reducing the gas pressure gradient so that the headwind disappears
x: The instability locally reduces the headwind felt by clumped pebbles, but that is the feedback mechanism rather than a global change in the disc.
a: By trapping pebbles in vortices until they are large enough to survive
x: Vortex trapping is a separate proposed concentration mechanism, not the streaming instability.
hint: Ask what size the resulting bodies have, and whether anything ever occupies the metre range.
why: The instability's feedback loop is: a local pebble overdensity drags the gas toward Keplerian speed, reducing the headwind those pebbles feel, so they drift more slowly, so faster-drifting pebbles from outside catch up and join — **the concentration feeds itself.** When a resulting filament exceeds its local Roche density it collapses as a cloud rather than by pairwise collisions, producing a bound body of order $100$ km across, for which radial drift is entirely negligible. Nothing ever spends appreciable time at a metre in size, so the barrier is not overcome but avoided. Two predictions strengthen the case beyond its solving the problem it was built for. The characteristic size of $\\sim100$ km emerges from the physics rather than being fitted, and it matches a long-unexplained break in the size distribution of asteroids and Kuiper belt objects. And collapsing clouds with angular momentum produce binaries at high rates, which matches the binary-rich, colour-matched cold classical Kuiper belt. The instability's weakness is its requirements: a locally enhanced pebble-to-gas ratio and a narrow range of Stokes numbers, so it operates only in some places — and identifying which places is what now determines where planetesimals are thought to form.
```

## 5. From planetesimals to cores

Once $100$ km bodies exist, gravity takes over and growth accelerates.

**Runaway growth.** A slightly larger body has a larger gravitational cross-section — enhanced above its geometric size by gravitational focusing — so it accretes faster and the size difference widens. Growth is runaway: the largest body pulls away from the rest.

**Oligarchic growth.** Runaway ends when the growing body's own stirring raises the surrounding planetesimals' velocities, reducing focusing. Growth then proceeds more sedately, with a set of comparably sized oligarchs each dominating its own feeding zone. The endpoint is the **isolation mass** calculated in the hot Jupiters chapter: $0.007\,M_\oplus$ at $0.05$ AU, $0.067$ at $1$ AU, $2.05$ at $5.2$ AU with ices.

**The problem.** Runaway gas accretion requires roughly $10\,M_\oplus$, and the isolation masses fall short everywhere. Building a giant core from planetesimals alone requires accreting across feeding zones, which is slow — classical estimates gave Jupiter formation times comparable to or exceeding the disc lifetime. **The core had to form faster than the gas disappeared, and it did not obviously do so.**

### 5.1 Pebble accretion

The current resolution. Instead of accreting kilometre-scale planetesimals, a core accretes **pebbles**, which are aerodynamically coupled to the gas.

The gain is large and comes from two effects. Gas drag dissipates a pebble's energy during the encounter, so it is captured from a much larger cross-section than gravitational focusing alone allows. And pebbles drift inward from the outer disc, so the core is fed by material far beyond its own feeding zone — the isolation mass ceases to be the limit.

**Growth rates increase by orders of magnitude**, and giant core formation within the disc lifetime becomes achievable. Pebble accretion is now the standard mechanism, and it carries a prediction: a growing core eventually becomes massive enough to perturb the gas into a pressure bump that halts the pebble flow, imposing a **pebble isolation mass** of order $10$–$20\,M_\oplus$ — comfortably at the threshold for runaway gas accretion, which is a suggestive coincidence.

### 5.2 Runaway gas accretion

Once a core exceeds roughly $10\,M_\oplus$, its envelope can no longer support itself against the core's gravity by radiating away the energy of accretion. The envelope contracts, admitting more gas, which increases the mass, which accelerates the contraction. **Accretion becomes runaway and the planet grows to Jupiter mass rapidly** — limited only by the local gas supply and by the gap it opens.

This is what makes giants a threshold phenomenon: below $10\,M_\oplus$ a core holds a modest envelope, above it the planet runs away. **It also explains the observed scarcity of planets between Neptune and Saturn mass**, since that range is traversed quickly.

```checkpoint
q: Pebble accretion increases core growth rates by orders of magnitude over planetesimal accretion. What are the two reasons?
a: Pebbles are more numerous and collisions are therefore more frequent
x: Number density matters, but the decisive gains are in the capture cross-section and in where the material comes from.
a*: Gas drag dissipates a pebble's energy during the encounter, enlarging the capture cross-section far beyond gravitational focusing; and drifting pebbles deliver material from well outside the core's own feeding zone
a: Pebbles are icy and therefore stickier on impact
x: Stickiness governs pebble formation from dust, not capture by a body already large enough for gravity to dominate.
a: Pebbles orbit faster than planetesimals, increasing the encounter rate
x: Both orbit at essentially the Keplerian rate at a given radius; pebbles drift inward, which matters, but not through orbital speed.
hint: Ask what happens to a pebble's energy during a close encounter with a core, and where the pebbles came from.
why: Planetesimal accretion captures only bodies whose trajectories pass within the gravitationally focused cross-section, and it draws exclusively on the local feeding zone — which is what gives the isolation mass, $0.067\,M_\oplus$ at $1$ AU and $2.05$ at $5.2$ AU, far short of the $\sim10\,M_\oplus$ needed for runaway gas accretion. Pebbles behave differently on both counts. **Gas drag removes energy during the encounter**, so a pebble that would otherwise pass by is slowed and captured, effectively enlarging the accretion radius by a large factor. And **pebbles drift inward through the disc**, so the core is fed by material originating well beyond its own feeding zone, which removes the isolation mass as a ceiling altogether. Together these make giant core formation achievable within the $3$ Myr disc lifetime, which classical planetesimal accretion could not manage. The mechanism carries a built-in stopping condition: a growing core eventually perturbs the gas into a pressure bump that halts the inward pebble flow, giving a **pebble isolation mass** of $10$–$20\,M_\oplus$ — landing at the runaway gas accretion threshold, which is a suggestive coincidence rather than a tuned result.
---
q: Why are planets between Neptune and Saturn mass scarce?
a: Because such planets are difficult to detect, falling between the sensitivities of transit and radial velocity surveys
x: Both methods have good sensitivity in that mass range; the deficit survives completeness correction.
a*: Because runaway gas accretion is unstable — once a core exceeds about $10\,M_\oplus$ it grows to Jupiter mass rapidly, so few objects are caught mid-transition
a: Because planets in that range are unstable and are ejected
x: There is no dynamical instability specific to that mass; such planets would be perfectly stable if they existed in numbers.
a: Because the disc's gas supply is exhausted at that point
x: Exhaustion would truncate growth and pile planets up at the truncation mass rather than depleting the range.
hint: Ask what happens to a core's envelope once the core exceeds the runaway threshold.
why: Below about $10\,M_\oplus$ a core's envelope can support itself against the core's gravity while radiating away the energy of accretion, so it settles into a modest steady state. Above that threshold it cannot: the envelope contracts, admitting more gas, which raises the mass, which accelerates the contraction — **a positive feedback that runs away** and carries the planet to Jupiter mass on a timescale short compared with the disc lifetime, limited only by the local gas supply and by the gap the planet opens. Objects are therefore rarely observed partway through the transition, and the mass function shows a deficit between Neptune and Saturn. This is a good example of a population feature that directly reflects an instability rather than a formation preference: the scarcity marks a region traversed quickly, in the same way that gaps in stellar evolutionary tracks mark rapid phases. It also explains why giants form a distinct class rather than the tail of a continuum — the threshold makes them a qualitatively different outcome, not a quantitatively larger one.
```

## 6. The alternative: gravitational instability

If a disc is massive and cools efficiently, it can fragment directly into bound clumps without a core.

**Where it works.** Both conditions favour large radii — surface density must be high relative to the shear, and cooling must be faster than the orbital time, which requires the low temperatures found far out. Gravitational instability is therefore a mechanism for forming massive objects at tens to hundreds of AU.

**The evidence against its being common** is exactly the imaging non-detection discussed earlier: surveys of hundreds of young stars find giant planets at $10$–$100$ AU in at most a few per cent of systems, where gravitational instability predicts more. The metallicity correlation points the same way, since giant occurrence rises steeply with host metallicity as core accretion requires and gravitational instability does not.

**The honest position** is that core accretion is the dominant channel and gravitational instability plausibly accounts for a minority of massive, wide-orbit objects — with the boundary between the most massive planets and the least massive brown dwarfs being exactly where the two mechanisms' products overlap.

{{image: Protoplanetary disk | A disc of gas and dust around a young star, the environment in which planets assemble and the reason planet formation is a race: infrared excess surveys give a median disc lifetime near three million years, within which micron grains must become thousand-kilometre bodies. Millimetre imaging of such discs reveals concentric rings and gaps, which are naturally produced by planets massive enough to perturb the gas, and which also mark pressure maxima where drifting pebbles collect — so the structures may be both the consequence of planets and the sites where more of them form.}}

{{image: HL Tauri | A young star's disc resolved at millimetre wavelengths, showing a series of concentric bright rings separated by dark gaps at radii of tens of astronomical units. The system is only about a million years old, so if the gaps are cleared by planets massive enough to perturb the gas then giant formation must be fast — which is part of the motivation for pebble accretion, whose growth rates exceed planetesimal accretion by orders of magnitude. The competing interpretation is that the rings mark condensation fronts of major volatiles, where grain stickiness and opacity change at particular temperatures. Either way the rings are pressure maxima, and pressure maxima collect drifting pebbles, so they are also favourable sites for forming the next generation of planetesimals.}}

## 7. Migration, and why nothing should have survived

A planet embedded in a gas disc exchanges angular momentum with it and moves. The problem is that it moves too fast.

### 7.1 Type I

A low-mass planet raises spiral density waves in the disc at Lindblad resonances. Waves interior and exterior to the planet exert opposing torques, and in most disc models the exterior torque wins slightly, so the planet migrates **inward**.

The timescale, in a minimum-mass nebula:

| Planet | Location | Type I timescale |
|---|---|---|
| $1\,M_\oplus$ | $1$ AU | $6.9\times10^5$ yr |
| $10\,M_\oplus$ | $1$ AU | $6.9\times10^4$ yr |
| $10\,M_\oplus$ | $5$ AU | $3.5\times10^5$ yr |
| $1\,M_\oplus$ | $5$ AU | $3.5\times10^6$ yr |

Compare the disc lifetime of $\sim3$ Myr. **A $10\,M_\oplus$ core at $1$ AU migrates into the star in seventy thousand years — forty times faster than the disc disperses.**

**This is the type I migration problem, and it is severe.** Taken literally, every core massive enough to become a giant should be consumed before the gas clears, and no planets should exist. That planets do exist means the standard torque calculation is missing something.

### 7.2 What might stop it

**Migration traps.** At locations where the disc's temperature or surface density profile changes — the inner edge, the snow line, the boundary of a dead zone where turbulence is suppressed — the torque balance can reverse, and planets pile up rather than passing through. This is attractive because it makes migration stop somewhere specific rather than requiring it to be slow everywhere.

**Thermal and dynamical torques.** A core accreting material heats its surroundings, and the resulting asymmetric density perturbation exerts a torque that can be positive — driving outward migration — under conditions that occur in real discs. This effect was neglected in the classical calculation and can change the sign of the net torque.

**Turbulence and stochastic torques.** In a turbulent disc the torque fluctuates, so migration becomes partly a random walk rather than a steady drift, which lengthens the effective timescale.

**None of these is established as the answer**, and the honest statement is that type I migration is understood to be fast, that something limits it, and that which of several candidate mechanisms dominates is unresolved.

### 7.3 Type II

Above roughly a Saturn mass, a planet clears a gap in the gas. Migration then couples to the disc's own viscous evolution and slows to the viscous timescale — typically $10^5$–$10^6$ years, still comparable to the disc lifetime.

Type II is the mechanism usually invoked for delivering giants inward, and it inherits the stopping problem discussed in the hot Jupiters chapter: nothing in it naturally halts migration at $0.05$ AU.

## 8. What the observations constrain

**Disc structure.** Millimetre imaging shows rings and gaps in a large fraction of discs, at radii of tens of AU, in objects only a million years old. The natural interpretation is planets already massive enough to perturb the gas — which would mean giant formation is fast. Alternatives exist, including condensation fronts of major volatiles producing changes in dust properties at specific radii.

**Pressure bumps as nurseries.** Rings are pressure maxima, where drifting pebbles collect. That makes them favourable sites for the streaming instability, so the structures may be both the consequence of planets and the birthplaces of more — a feedback that connects the disc observations to the formation theory directly.

**The exoplanet population itself.** Near-resonant period ratios require convergent migration; the eccentricity distribution of giants requires post-disc scattering; the metallicity correlation requires core accretion; the radius valley requires envelope loss; and the scarcity of wide-orbit giants limits gravitational instability. **Each of these is a constraint the theory has to satisfy simultaneously**, which is a much harder test than reproducing any one of them.

```checkpoint
q: Type I migration would bring a $10\,M_\oplus$ core at $1$ AU into its star in about $70{,}000$ years, against a disc lifetime near $3$ Myr. What follows?
a: That cores of this mass cannot form, since they would be destroyed first
x: They demonstrably form — the giants exist — so the inference must be about the calculation rather than about the cores.
a*: That the classical torque calculation is incomplete, since planets exist; something must slow, halt or reverse the migration
a: That disc lifetimes must be much shorter than $3$ Myr
x: Disc lifetimes are measured directly from infrared excess statistics and are not in serious doubt.
a: That migration must be outward rather than inward in most discs
x: The classical calculation gives inward migration robustly across a wide range of disc models; a global sign reversal is not the resolution.
hint: The observation that planets exist is data. Ask what it constrains.
why: The timescale comparison is stark — seventy thousand years against three million, a factor of forty — and taken at face value it predicts that every core massive enough to become a giant is consumed before the gas clears. **Since planets exist, the prediction is wrong, and the existence of planets is therefore a constraint on disc physics rather than an outcome to be derived.** Several candidate resolutions are under investigation: **migration traps** at locations where the disc's temperature or surface density profile changes — the inner edge, the snow line, a dead zone boundary — where the torque balance can reverse so that planets pile up rather than pass through; **thermal torques** from a core heating its surroundings as it accretes, which were absent from the classical calculation and can drive outward migration; and **stochastic torques** in a turbulent disc, which turn steady drift into a partial random walk and lengthen the effective timescale. None is established. The honest statement is that type I migration is known to be fast, that something limits it, and that which mechanism dominates is unresolved — which makes this one of the few places where an everyday observation, that planets are here at all, is the strongest available constraint on a theory.
---
q: Millimetre imaging shows rings and gaps in discs only a million years old. Why is the interpretation significant, and what is the alternative?
a: It shows the discs are dispersing from the inside out
x: Inside-out clearing produces an inner hole rather than a series of concentric rings and gaps at tens of AU.
a*: If the gaps are carved by planets, giant formation is fast — complete within a million years; the alternative is that condensation fronts of major volatiles change dust properties at specific radii
a: It shows the discs are gravitationally unstable and fragmenting
x: Fragmentation produces clumps rather than axisymmetric rings, and would be visible as such.
a: It shows the star's magnetic field is structuring the inner disc
x: Magnetic structuring operates near the star, not at the tens of AU where these rings are seen.
hint: Ask what physical structures could produce a change in millimetre emission at a specific radius.
why: A planet massive enough to perturb the gas opens a gap, and the surrounding pressure maxima trap drifting pebbles into rings — so the observed structures have a natural planetary interpretation. **If correct, it means giant planets are already in place within a million years**, which is demanding for core accretion and is part of the motivation for pebble accretion's much faster growth rates. The main alternative is that major volatiles condense at particular temperatures and hence particular radii — water, carbon monoxide, nitrogen — changing the stickiness and opacity of grains and producing rings without any planet. Distinguishing them is an active problem, and the observed ring radii do not obviously coincide with the expected condensation fronts in every case. A second implication follows regardless of which interpretation holds: **rings are pressure maxima, and pressure maxima collect pebbles**, which is exactly the condition the streaming instability requires. So the structures are plausibly both a consequence of planets and the nurseries of more, which links the disc observations to the formation theory rather than leaving them as a separate line of evidence.
```

```checkpoint
q: The theory must simultaneously reproduce near-resonant period ratios, broad giant eccentricities, the metallicity correlation, the radius valley and the scarcity of wide-orbit giants. Why is this a much stronger test than matching any one?
a: Because five observations have five times the statistical weight of one
x: The strength is not statistical accumulation; each constraint pushes on a different part of the theory.
a*: Because the constraints pull on different mechanisms and often in opposing directions, so a model tuned to satisfy one tends to violate another
a: Because it requires the model to have at least five free parameters
x: More parameters make simultaneous fitting easier, not harder; the difficulty is that the constraints are not independent knobs.
a: Because the observations were made by different methods with different systematics
x: Methodological independence helps their reliability but is not what makes joint satisfaction demanding.
hint: Consider what a model must do to produce near-resonant pairs, and what it must also do to produce eccentric giants.
why: Each constraint bears on a different physical ingredient, and satisfying them together restricts the theory far more than any of them alone. **Near-resonant period ratios require convergent migration** through gas, so migration must be efficient enough to bring pairs together and capture them. **Broad giant eccentricities require post-disc scattering**, so systems must commonly go unstable *after* the gas clears — but not so violently that the near-resonant pairs elsewhere are destroyed. **The metallicity correlation requires core accretion**, constraining the formation channel. **The radius valley requires envelope loss** acting differentially on cores of different mass and irradiation. **The wide-orbit giant deficit limits gravitational instability.** A model with fast migration produces resonances but tends to deliver everything to the star; one with efficient scattering produces eccentric giants but disrupts compact multiples; one tuned for a deep radius valley may require irradiation histories inconsistent with the observed period distribution. **Tuning to one constraint typically breaks another**, which is why population synthesis models — which attempt all of them at once — remain unable to reproduce the full distribution, and why that failure is more informative than any individual success.
---
q: The metre-size barrier resisted fifty years of attempts to make growth faster, and was resolved by a mechanism in which nothing is ever a metre across. What general lesson does this carry?
a: That laboratory experiments on grain sticking were the key missing input
x: Laboratory work established the bouncing barrier, which is a different and softer obstacle; it did not resolve the drift problem.
a*: That a bottleneck resisting every attempt to widen it often indicates the assumed pathway is wrong, and the productive question becomes whether the step can be bypassed
a: That numerical simulation eventually solves problems analytic theory cannot
x: Simulation was essential to demonstrating the instability, but the conceptual move — collective collapse rather than pairwise growth — is what mattered.
a: That the barrier was never real, and the drift estimates were too pessimistic
x: The drift physics is robust and the timescales stand; the barrier is real and was genuinely bypassed rather than dissolved.
hint: Ask what all the unsuccessful proposals had in common.
why: Every unsuccessful attempt shared an assumption: that bodies grow by pairwise collisions through a continuous sequence of sizes, so the metre range must be traversed and the only question is how fast. Proposals accordingly sought stickier grains, quieter discs, sheltered locations — and all failed, because the deficit was orders of magnitude rather than a factor of a few. **The streaming instability abandons the assumption**: a self-concentrating pebble filament collapses as a cloud directly to a body of order $100$ km, so nothing occupies the vulnerable range at all. The general pattern is that a bottleneck resisting every attempt to widen it is often evidence that the assumed pathway is wrong rather than that the pathway needs better parameters, and the productive question shifts from *how does this step survive* to *is this step taken at all*. The same structure recurs elsewhere: in origin-of-life chemistry, implausible intermediates usually signal that the assumed reaction sequence is not the one used; in engineering, a component that must operate impossibly close to a material limit is a hint that the architecture rather than the component should change.
```

```checkpoint
q: What does a migration trap do, and why is the idea attractive?
a: It prevents a planet from forming at that location, keeping the region empty
x: A trap halts planets that arrive there; it does not suppress formation.
a*: At a location where the disc's temperature or surface density profile changes, the torque balance can reverse, so migrating planets stop there rather than passing through — which makes migration end somewhere specific rather than requiring it to be slow everywhere
a: It slows migration uniformly throughout the disc by increasing the gas density
x: A uniform slowdown is a different proposal, and it would still deliver planets to the star given enough time.
a: It captures planets into mean-motion resonance with one another
x: Resonant capture is a planet–planet interaction; a migration trap is a property of the disc's structure.
hint: The classical problem is that migration is fast. Ask whether the fix has to be a slower rate.
why: Type I migration is fast — $6.9\times10^4$ years for a $10\,M_\oplus$ core at $1$ AU against a $3$ Myr disc lifetime — so a naive fix requires slowing it by a factor of forty everywhere, which no plausible mechanism achieves. **A trap changes the problem from a rate to a destination.** At a location where the disc's structure changes — its inner edge, the snow line, the boundary of a dead zone where turbulence is suppressed — the balance between the interior and exterior Lindblad torques can reverse, so a planet arriving from outside stops rather than continuing inward. Migration can then remain fast and still not be fatal, because it terminates. The idea is attractive for a second reason: it predicts that planets should accumulate at particular radii tied to disc physics, which is testable against the observed period distribution, and it offers a natural stopping point for the hot Jupiter problem, where nothing in Type II migration halts a giant at $0.05$ AU. It remains one of several candidates rather than the established answer, alongside thermal torques from an accreting core and stochastic torques in a turbulent disc.
---
q: Which part of the standard planet formation picture is best supported, and which is least?
a: Best supported is Type I migration theory; least is the streaming instability
x: The reverse is closer to the truth — Type I migration makes a prediction contradicted by the existence of planets, while the streaming instability has made confirmed predictions.
a*: Best supported is the streaming instability, which predicted the $100$ km planetesimal size and the binary-rich cold classical Kuiper belt; least is what halts Type I migration, where the theory predicts an outcome that plainly did not occur
a: Best supported is gravitational instability; least is core accretion
x: Gravitational instability is disfavoured by both the wide-orbit giant deficit and the metallicity correlation, while core accretion is the dominant channel.
a: All parts are equally well supported, since the theory reproduces the observed population
x: The theory does not reproduce the full observed population; population synthesis models fail on several constraints simultaneously.
hint: Ask, for each stage, whether it made a prediction that could have failed and did not.
why: The useful criterion is whether a stage made a prediction it did not have to make. **The streaming instability did:** the characteristic planetesimal size of about $100$ km emerged from the physics rather than being fitted, and matches a long-unexplained break in the asteroid and Kuiper belt size distributions; and collapsing clouds with angular momentum produce binaries at high rates, matching the binary-rich, colour-matched cold classical Kuiper belt, which was not used in constructing the model. **Type I migration is the opposite case:** its central quantitative prediction is that cores massive enough to become giants are consumed within a few tens of thousands of years, which is contradicted by the existence of planets, so something is missing and which candidate supplies it — traps, thermal torques, stochastic torques — is unresolved. Ranking the parts of a theory this way is more useful than treating it as a single edifice, because it identifies where additional work has leverage: **the weakest link is not the least studied stage but the one whose prediction is known to be wrong.**
```

## 9. Pulling the thread

- **Read the theory as a list of barriers, not stages.** Each looks fatal on its own terms, and which parts of the theory are secure depends on how well each barrier's crossing is understood.
- **The metre-size barrier is a rate comparison.** At $\text{St}\approx1$ the drift speed reaches $\eta v_K = 74$–$149$ m s$^{-1}$, emptying $1$ AU in $32$–$64$ years, against a $3$ Myr disc lifetime and far longer collisional growth times.
- **The streaming instability avoids the barrier rather than overcoming it**, collapsing self-concentrating pebble filaments straight to $\sim100$ km bodies — and it predicted both that size and the binary-rich cold classical Kuiper belt.
- **Isolation masses fall short everywhere**, so pebble accretion is needed: gas drag enlarges the capture cross-section and drifting pebbles feed the core from beyond its feeding zone, with a pebble isolation mass of $10$–$20\,M_\oplus$ landing suggestively at the runaway threshold.
- **Runaway gas accretion is a threshold**, which is why giants are a distinct class and why planets between Neptune and Saturn mass are scarce.
- **Type I migration is forty times faster than the disc lifetime for a $10\,M_\oplus$ core at $1$ AU.** The existence of planets is therefore a constraint on disc physics, and the mechanism that limits migration is unresolved.
- **Gravitational instability is a minority channel**, disfavoured by the scarcity of wide-orbit giants and by the metallicity correlation.
- **The theory must satisfy every population constraint at once** — near-resonance, giant eccentricities, the metallicity correlation, the radius valley, the wide-orbit deficit — which is far harder than matching any one.

The transferable idea: **when a process has a step that is impossible on its own terms, the resolution usually removes the step rather than accelerating it.** For fifty years the metre-size barrier was attacked by looking for ways to make growth faster — stickier grains, quieter discs, sheltered locations — and none worked, because the deficit was orders of magnitude. What worked was a mechanism in which nothing is ever a metre across: pebble clouds collapse directly to bodies large enough to be safe, and the dangerous size range is simply never occupied. **A bottleneck that resists every attempt to widen it is often a sign that the pathway is wrong**, and the productive question becomes whether the step can be bypassed rather than survived. The same pattern appears in biochemistry, where implausible intermediates are usually a signal that the assumed reaction sequence is not the one nature uses, and in engineering, where a component that must operate impossibly close to a limit is a hint that the architecture should change.

## 10. Further reading

{{book: Philip Armitage | Astrophysics of Planet Formation | 2020}}

{{book: Michael Perryman | The Exoplanet Handbook | 2018}}

{{book: Jack Lissauer and Imke de Pater | Fundamental Planetary Science | 2019}}

Beyond the books: Armitage is the standard graduate text and is unusually clear about which parts of the theory are secure and which are contested — the migration chapter in particular states the type I problem without softening it. Youdin and Goodman's paper introducing the streaming instability is worth reading for how the feedback loop is derived, and the subsequent simulation papers for how the $100$ km characteristic size emerged rather than being imposed. On disc structure, the ALMA survey papers reporting rings and gaps in most resolved discs are best read alongside a paper arguing for the condensation-front interpretation, since the disagreement is about interpretation rather than data.

## Problems

*Useful numbers: $v_K = 29.8$ km s$^{-1}$ at $1$ AU; maximum drift speed $\eta v_K$ with $\eta \approx 0.0025$–$0.005$, giving $74$–$149$ m s$^{-1}$ and drift times of $32$–$64$ yr from $1$ AU; median disc lifetime $\sim3$ Myr; Type I timescales $6.9\times10^5$ yr for $1\,M_\oplus$ at $1$ AU, $6.9\times10^4$ yr for $10\,M_\oplus$ at $1$ AU, $3.5\times10^5$ yr for $10\,M_\oplus$ at $5$ AU; isolation masses $0.007\,M_\oplus$ at $0.05$ AU, $0.067$ at $1$ AU, $2.05$ at $5.2$ AU; runaway gas accretion threshold $\sim10\,M_\oplus$; streaming instability characteristic size $\sim100$ km.*

**1.** *(The clock.)* **(a)** State the median disc lifetime and how it is measured. **(b)** State the factor in size and mass that must be traversed within it. **(c)** State why this makes planet formation a race rather than an equilibrium.

**2.** *(The first barrier.)* **(a)** Name the two effects that stall growth at millimetre to centimetre sizes. **(b)** State why this barrier is described as soft. **(c)** State what difference ices make and why.

**3.** *(Radial drift.)* **(a)** Explain why gas orbits more slowly than solids. **(b)** Explain why drift is fastest at $\text{St}\approx1$ rather than at extreme values. **(c)** Compute the drift time from $1$ AU for $\eta = 0.004$ and compare with the disc lifetime.

**4.** *(Streaming instability.)* **(a)** Describe the feedback loop. **(b)** State the outcome and its characteristic size. **(c)** Give two predictions it made that were subsequently confirmed, and state its principal weakness.

**5.** *(Growth to cores.)* **(a)** Distinguish runaway from oligarchic growth. **(b)** State the isolation masses at $1$ and $5.2$ AU and the problem they pose. **(c)** State the two reasons pebble accretion is faster.

**6.** *(Runaway gas.)* **(a)** State the threshold and the physical reason for it. **(b)** Explain why giants are a distinct class rather than the tail of a continuum. **(c)** State the observed feature this explains.

**7.** *(Migration.)* **(a)** Compute how many times faster Type I migration is than the disc lifetime for a $10\,M_\oplus$ core at $1$ AU. **(b)** State what follows logically from the existence of planets. **(c)** Name three candidate limiting mechanisms.

**8.** *(Alternatives.)* **(a)** State the conditions gravitational instability requires and where they are met. **(b)** Give two observational arguments that it is not the dominant channel. **(c)** State where its products and core accretion's overlap.

**9.** *(Constraints.)* Name five features of the observed exoplanet population that a formation theory must reproduce, and state what each requires.

## Worked answers

**1.** **(a)** About $3$ Myr, from the fraction of stars of each age still showing infrared excess from warm dust — a survey measurement over clusters of known age. **(b)** From micron grains to thousand-kilometre planets is a factor of $10^{12}$ in size and about $10^{36}$ in mass. **(c)** Because the gas supply has a hard deadline: envelope capture, migration and pebble accretion all require gas, so a core that forms after dispersal never becomes a giant. Formation is therefore governed by rate comparisons rather than by what is energetically favourable.

**2.** **(a)** Bouncing, where aggregates above about a millimetre no longer stick at the relevant collision speeds; and fragmentation, where turbulence-driven relative velocities above roughly a metre per second shatter aggregates. **(b)** Because it depends on composition, porosity and ice content rather than on a robust dynamical argument, and it delays growth rather than forbidding it. **(c)** Icy grains are stickier than silicate ones, so growth proceeds to larger sizes beyond the snow line — which is one reason planetesimal formation is expected to be more efficient there.

**3.** **(a)** Gas is partially supported against stellar gravity by its own pressure gradient, so it needs less centripetal acceleration and orbits slightly slower than Keplerian; solids feel no pressure and orbit at the full Keplerian rate. **(b)** At $\text{St}\ll1$ the body is dragged along with the gas, so there is little relative velocity to remove angular momentum; at $\text{St}\gg1$ the drag is negligible against the body's inertia. The maximum is at intermediate coupling, $\text{St}\approx1$. **(c)** $v = 0.004\times29{,}800 = 119$ m s$^{-1}$; $t = 1.496\times10^{11}/119 = 1.26\times10^9$ s $= 40$ yr — about $75{,}000$ times shorter than the $3$ Myr disc lifetime.

**4.** **(a)** A local pebble overdensity drags the gas toward Keplerian speed, reducing the headwind those pebbles feel; drifting more slowly, they are caught up by faster-drifting pebbles from outside, which join the concentration and strengthen the effect. **(b)** Filaments exceeding the local Roche density collapse gravitationally as clouds into bound bodies of order $100$ km across, for which drift is negligible. **(c)** *Predictions:* the $\sim100$ km characteristic size, matching a long-unexplained break in the asteroid and Kuiper belt size distributions; and a high binary fraction with matched colours, matching the cold classical Kuiper belt. *Weakness:* it requires a locally enhanced pebble-to-gas ratio and a narrow Stokes number range, so it does not operate everywhere, and what produces those conditions is unresolved.

**5.** **(a)** *Runaway:* gravitational focusing means a larger body accretes faster, so the size difference widens and one body pulls away. *Oligarchic:* the growing body stirs its neighbours to higher velocities, reducing focusing, and growth slows to a set of comparable oligarchs each dominating a feeding zone. **(b)** $0.067\,M_\oplus$ at $1$ AU and $2.05\,M_\oplus$ at $5.2$ AU with ices, against the $\sim10\,M_\oplus$ needed for runaway gas accretion — so no core can reach the threshold from its own feeding zone. **(c)** Gas drag dissipates a pebble's energy during the encounter, so capture occurs from a much larger cross-section than gravitational focusing alone allows; and pebbles drift inward from the outer disc, feeding the core from far beyond its own feeding zone so that the isolation mass ceases to bound it.

**6.** **(a)** About $10\,M_\oplus$: above it the envelope can no longer support itself against the core's gravity while radiating away the accretion energy, so it contracts, admits more gas, gains mass, and contracts faster. **(b)** Because the transition is unstable: below the threshold a core holds a modest envelope indefinitely, above it the planet runs away to Jupiter mass limited only by gas supply and gap opening. **(c)** The scarcity of planets between Neptune and Saturn mass, since that range is crossed quickly and few objects are caught in it.

**7.** **(a)** $3\times10^6/6.9\times10^4 = 43$ times faster. **(b)** That the classical torque calculation is incomplete, since planets exist and should not — the existence of planets becomes a constraint on disc physics rather than a derived outcome. **(c)** Migration traps at disc structure transitions such as the inner edge, the snow line or a dead zone boundary, where the torque balance can reverse; thermal torques from an accreting core heating its surroundings, absent from the classical calculation and capable of driving outward migration; and stochastic torques in a turbulent disc, converting steady drift into a partial random walk.

**8.** **(a)** High surface density relative to shear, and cooling faster than the orbital time — both favoured at large radii where temperatures are low, so it operates at tens to hundreds of AU. **(b)** Direct imaging surveys find giants at $10$–$100$ AU in at most a few per cent of young systems, fewer than it predicts; and giant occurrence rises steeply with host metallicity, which core accretion requires and gravitational instability does not. **(c)** At the boundary between the most massive planets and the least massive brown dwarfs, where the products of the two mechanisms overlap in mass and cannot be distinguished by mass alone — which is part of why that boundary is a definitional convention rather than a physical divide.

**9.** *Near-resonant period ratios* — require convergent migration through a gas disc, since a static system cannot arrive at commensurabilities. *Broad giant eccentricity distribution* — requires post-disc excitation, most plausibly planet–planet scattering, since discs damp eccentricity. *Metallicity correlation for giants* — requires core accretion, which depends on solid content. *The radius valley* — requires envelope loss acting differentially on cores of different mass and irradiation. *Scarcity of wide-orbit giants* — limits gravitational instability's contribution. A theory must produce all five simultaneously, which is a far stronger test than reproducing any one, and is why single-mechanism models are generally inadequate.$exForm_master$,
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
