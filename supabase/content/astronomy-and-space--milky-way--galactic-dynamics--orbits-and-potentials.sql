-- Astronomy & Space · The Milky Way — Galactic Dynamics —
-- "Orbits and Gravitational Potentials". Curated master for
-- astronomy-and-space/milky-way/galactic-dynamics/orbits-and-potentials
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Taxonomy node added in this batch (Galactic Dynamics position 0);
-- seed.sql already carries it.
--
-- The foundational lecture the block previously lacked: how stars
-- actually move in a galaxy, and why that is not the same problem as
-- planetary orbits. Galaxies as collisionless systems - the relaxation
-- time computed at four and a half million Hubble times against a
-- globular cluster's 0.15, so one system is collisionless and the other
-- genuinely collisional, with mass segregation and core collapse as the
-- observable consequence; the smooth potential and why stars orbit the
-- mass distribution rather than each other; the Local Standard of Rest
-- and the solar peculiar motion; epicyclic motion, the kappa/Omega
-- ratio of root two that makes orbits rosettes rather than ellipses,
-- and why that ratio underlies both the Lindblad resonances and the
-- bar; integrals of motion, actions, and Jeans' theorem as the reason
-- action space is where accretion debris stays visible; the virial
-- theorem as the workhorse mass estimator and its assumptions; phase
-- mixing against violent relaxation; and dynamical friction, computed
-- for the Magellanic Clouds. ~10,000 words, multi-question checkpoints
-- at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/galactic-dynamics/orbits-and-potentials',
    'research',
    'advanced',
    'read',
    $mwOrbits_master$> **Galactic dynamics** is the study of how stars move under gravity in a galaxy. Its central and counter-intuitive fact is that stars in a galaxy do **not** orbit each other: they orbit the *smooth gravitational field* produced by all of them together, and individual encounters between stars are so rare that in the age of the universe essentially none has occurred. A galaxy is a **collisionless** system, and nearly everything distinctive about how it behaves follows from that.

The four preceding chapters of this branch described the Milky Way's structures and contents. This one supplies the mechanics — the framework in which rotation curves are interpreted, in which missing mass is inferred, and in which the orbits of stars around a supermassive black hole are read. It is the block's foundation, and it is worth building carefully, because galactic dynamics differs from the celestial mechanics of planetary systems in ways that are easy to miss and consequential when missed.

The Solar System is a nearly perfect example of a system dominated by a single central mass, in which each planet's orbit is a closed ellipse and the interactions between planets are small perturbations. A galaxy is nothing like this. There is no central dominant mass — the Galaxy's black hole holds four millionths of its mass. The gravitational field at any point comes from **everything at once**, distributed rather than concentrated. Orbits are not closed. And the number of bodies is so large that the system must be treated as a fluid in a six-dimensional space rather than as a set of interacting particles.

## Why stars never meet

The first thing to establish is quantitative, and it justifies everything that follows.

Two stars passing near each other exchange energy and momentum — a **gravitational encounter**. Over time, repeated encounters would drive a stellar system toward equilibrium, in the way molecular collisions drive a gas toward a Maxwellian distribution. The timescale on which this happens is the **relaxation time**, and for a system of $N$ objects it is approximately

$t_{\text{relax}} \approx \dfrac{N}{8\ln N}\, t_{\text{cross}}$

where $t_{\text{cross}}$ is the time to cross the system. The logarithm reflects that distant weak encounters, being far more numerous, collectively dominate over rare close ones — so the relevant deflections are cumulative small nudges rather than dramatic near-misses.

Evaluate it for the Milky Way. With $N \approx 10^{11}$ stars and a crossing time of ~125 Myr:

$t_{\text{relax}} \approx \dfrac{10^{11}}{8 \times 25.3} \times 1.25\times10^{8}\ \text{yr} \approx 6\times10^{16}\ \text{yr}$

That is **four and a half million times the age of the universe**. No star in the Galaxy has had its orbit meaningfully altered by an encounter with another star. Ever.

The consequence is that a galaxy is **collisionless**: its stars respond only to the smooth, averaged gravitational field of the whole system, and the granularity of that field — the fact that the mass is actually in discrete lumps — is irrelevant. This single fact licenses the entire mathematical apparatus of the subject, since it means one can replace 10¹¹ interacting bodies with a smooth density distribution generating a smooth potential, and follow individual orbits in that potential.

Now run the same calculation for a **globular cluster**: $N \approx 10^5$, radius ~10 pc, velocity dispersion ~10 km/s, giving a crossing time of ~2 Myr.

$t_{\text{relax}} \approx \dfrac{10^{5}}{8 \times 11.5} \times 2\times10^{6}\ \text{yr} \approx 2\times10^{9}\ \text{yr}$

About **0.15 of a Hubble time** — so globular clusters *have* relaxed, several times over. And the observable consequences are exactly what a relaxed system should show:

- **Mass segregation.** Encounters drive systems toward equipartition of kinetic energy, so heavy stars slow down and sink toward the centre while light ones move outward. Globular clusters show precisely this, with their most massive stars and remnants concentrated in the core.
- **Evaporation.** Encounters occasionally kick a star above the escape velocity, so clusters slowly lose stars — the tidal tails the Halo chapter described.
- **Core collapse.** A self-gravitating system has negative heat capacity: losing energy makes the core *hotter* and denser, which accelerates further loss. Many globular clusters have undergone this runaway and show collapsed cores.

**Two systems made of the same objects, differing only in $N$ and size, obey entirely different physics.** The Milky Way will never relax; a globular cluster has relaxed repeatedly. This is why "collisionless" is a statement about a ratio of timescales rather than about whether things physically touch — and it is the same lesson the Gas Phases chapter delivered about whether a near-vacuum counts as a fluid.

```checkpoint
q: The Milky Way's relaxation time is roughly 6 × 10¹⁶ years — some 4.5 million times the age of the universe. The direct consequence is that
a: the Galaxy has not yet reached its final equilibrium shape and is still contracting
x: The Galaxy is in a perfectly good equilibrium, reached by processes that do not require two-body relaxation — phase mixing and violent relaxation act on a crossing time. Relaxation in this technical sense is about encounters between individual stars, not about whether the system is settled.
a*: stars respond only to the smooth averaged gravitational field of the whole Galaxy, since no star's orbit has ever been meaningfully altered by an encounter with another star
a: gravity is too weak between individual stars to affect their motion at all
x: Gravity between stars is not negligible in principle — it is what produces relaxation in globular clusters on gigayear timescales. What makes it irrelevant here is the enormous number of stars and the long crossing time, not any weakness of the force.
a: stars must be moving too fast for encounters to deflect them
x: Galactic velocities are comparable to those in globular clusters, where relaxation does occur within a Hubble time. Speed is not the discriminant; the combination of N and crossing time is.
hint: If no encounter has ever mattered, does a star care that the Galaxy's mass is in lumps rather than spread smoothly?
why: With relaxation times millions of times the age of the universe, the granularity of the mass distribution is invisible to any orbit — a star responds as if the Galaxy's 10¹¹ stars were a continuous density field. This licenses the whole mathematical apparatus of the subject: 10¹¹ interacting bodies can be replaced by a smooth potential in which individual orbits are integrated. Everything in this chapter and the next three rests on that replacement being legitimate.
---
q: A globular cluster has a relaxation time of ~2 Gyr — about 0.15 of a Hubble time — while the Galaxy's is 4.5 million Hubble times. The clusters therefore show
a: no structural differences from the Galaxy, since both are made of the same kinds of star
x: Composition is indeed similar, which is what makes the contrast instructive: identical constituents in different numbers and volumes produce entirely different physics. The structural differences are pronounced.
a*: mass segregation, evaporation, and in many cases core collapse — the observable signatures of a system that has relaxed repeatedly
a: faster rotation, since relaxation transfers angular momentum outward
x: Globular clusters rotate slowly and are supported mainly by random motions. Relaxation drives energy equipartition and spatial segregation, not spin-up.
a: a uniform distribution of stellar masses throughout, since encounters mix everything
x: Relaxation drives toward equipartition of *energy*, not uniformity of composition — which produces the opposite of mixing, sorting heavy stars inward and light ones outward.
hint: Encounters push a system toward equal kinetic energies. What happens to heavy stars under that pressure, and what happens to stars kicked above escape velocity?
why: Equipartition means heavier stars end up moving more slowly, so they sink to the centre — mass segregation, observed directly as concentrations of massive stars and remnants in cluster cores. Occasional strong kicks push stars past escape velocity, producing evaporation and the tidal tails used as dark-matter probes. And because self-gravitating systems have negative heat capacity, energy loss from the core makes it hotter and denser, driving the core-collapse runaway seen in many clusters. Same stars, different N: entirely different physics.
```

## The potential, and orbits within it

Since the field is smooth, the object of study is the **gravitational potential** $\Phi$, related to the mass density by Poisson's equation, $\nabla^2\Phi = 4\pi G\rho$. A star's motion follows from $\ddot{\mathbf{r}} = -\nabla\Phi$, and everything about galactic orbits is a consequence of what $\Phi$ looks like.

Two limiting cases frame the intuition:

**A point mass** (the Kepler case) gives $\Phi \propto -1/r$ and $v_c \propto r^{-1/2}$. Orbits are closed ellipses — a special degeneracy of the inverse-square law, not a general property of orbits.

**A uniform sphere** gives $\Phi \propto r^2$ and $v_c \propto r$, the harmonic case. Orbits are again closed, this time centred ellipses — the other special case.

A real galaxy is neither, and its rotation curve is famously **flat**: $v_c \approx$ constant. That corresponds to a logarithmic potential, $\Phi \propto \ln r$, and it sits between the two special cases — which means **galactic orbits do not close.**

An orbit in a general potential is a **rosette**: the star oscillates radially between a minimum and maximum radius while circulating in azimuth, and because the two periods are incommensurate, the orbit never repeats. It fills an annulus rather than tracing a line. The Solar System's closed ellipses are the exception, arising from the point-mass potential's special symmetry; in a galaxy the natural orbit is one that precesses continuously.

For orbits close to circular — which describes most disk stars — a powerful approximation applies. Write the radial motion as a small oscillation about a **guiding centre** that moves on a circle. The oscillation is simple harmonic with the **epicyclic frequency** $\kappa$, and the star traces a small ellipse around the guiding centre while the guiding centre circulates. This is the **epicyclic approximation**, and its resemblance to Ptolemy's epicycles is more than verbal — with the crucial difference that here the epicycles are real, physically derived, and small.

For a flat rotation curve the relation is exactly

$\kappa = \sqrt{2}\,\Omega$

and at the Sun's position, with $\Omega = 28.7$ km s⁻¹ kpc⁻¹:

| Quantity | Value |
| --- | --- |
| Orbital period | 214 Myr |
| Epicyclic period | 152 Myr |
| $\kappa/\Omega$ | 1.414 |

The star completes about 1.41 radial oscillations per orbit. Because that ratio is irrational, the orbit never closes — it precesses, and over many orbits the star's path fills an annulus.

This one ratio has consequences that reach through the previous chapters. In a frame rotating at $\Omega_p$, the pattern of the orbit depends on $\Omega - \Omega_p$ compared with $\kappa$ — which is exactly the condition defining the **Lindblad resonances** that bound spiral structure. And in a frame rotating at $\Omega - \kappa/2$, orbits close into ellipses, which is why a slowly rotating oval distortion can organise stellar orbits into a coherent **bar**. The Spiral Structure and Bulge chapters both rested on this ratio without deriving it.

```checkpoint
q: Orbits in a galaxy are rosettes that never close, unlike the closed ellipses of planetary orbits. The reason is that
a: galaxies contain too much dark matter for orbits to be stable
x: Orbits are perfectly stable — they are bounded and regular, just not closed. Dark matter changes the potential's shape but does not destabilise anything, and closed orbits would be no more stable than rosettes.
a*: closed orbits are a special degeneracy of the inverse-square (point-mass) and harmonic (uniform-sphere) potentials, and a galaxy's extended mass distribution is neither
a: stellar encounters continually perturb orbits away from closure
x: The Galaxy's relaxation time is 4.5 million Hubble times, so encounters are entirely negligible. The non-closure is a property of the smooth potential itself, not of perturbations.
a: the Galaxy's rotation is differential rather than solid-body
x: Differential rotation describes how circular speed varies with radius, which is related but not the cause. Even a differentially rotating point-mass potential gives closed elliptical orbits for each star.
hint: Two potentials give closed orbits, and both are special. Where does a flat rotation curve sit relative to them?
why: Bertrand's theorem identifies only two potentials producing closed orbits for all bound cases — the inverse-square and the harmonic — and a galaxy's roughly logarithmic potential is neither. The radial oscillation period and the azimuthal period are therefore incommensurate, so the star precesses and its path fills an annulus. The familiar closed ellipse is the exception, arising from the Solar System's near-point-mass symmetry, not the rule.
---
q: For a flat rotation curve, the epicyclic frequency satisfies κ = √2 Ω. This ratio matters beyond orbital shapes because
a: it determines the total mass of the Galaxy
x: Mass is obtained from the rotation curve's amplitude, not from the ratio of frequencies. The κ/Ω ratio describes the potential's shape and is the same for any flat curve regardless of its speed.
a*: the Lindblad resonances bounding spiral structure, and the frame in which orbits close into the ellipses that build a bar, are both defined by comparisons between Ω and κ
a: it sets the vertical scale height of the disk
x: Scale height follows from the vertical velocity dispersion balanced against the disk's gravity, as the Disk chapter derived. The epicyclic frequency describes radial oscillation, a separate degree of freedom.
a: it fixes the rate at which stars are scattered by molecular clouds
x: Scattering rates depend on the number and mass of perturbers and the time spent near them; the epicyclic frequency describes the response to the smooth potential, not the encounter rate.
hint: Both spiral density waves and bars are patterns rotating at some Ω_p. What comparison decides how a star's orbit responds to a pattern?
why: A star encounters a pattern rotating at Ω_p at the frequency Ω − Ω_p, and resonance occurs when that matches its own radial oscillation κ or a simple fraction of it — the Lindblad conditions Ω ∓ κ/2 = Ω_p, which bound where a spiral wave can propagate. In the frame rotating at Ω − κ/2 orbits close into ellipses, so a slowly rotating oval can align many orbits into a coherent bar. The Spiral Structure and Bulge chapters both used these results; this is where they come from.
```

## The Local Standard of Rest

Any measurement of Galactic motion needs a reference frame, and the Sun is a poor one because it is itself moving in a complicated way. The convention is the **Local Standard of Rest (LSR)**: a hypothetical point at the Sun's position, moving on a perfectly circular orbit in the Galactic plane.

The Sun does not sit on that orbit. Its **peculiar motion** relative to the LSR is roughly:

| Component | Direction | Value |
| --- | --- | --- |
| $U_\odot$ | Toward Galactic centre | 11.1 km/s |
| $V_\odot$ | Direction of rotation | 12.2 km/s |
| $W_\odot$ | Toward north Galactic pole | 7.25 km/s |

for a total peculiar speed of about **18 km/s** — small against the LSR's own ~235 km/s circulation, but essential to remove before any stellar velocity can be interpreted.

Two subtleties make this more than bookkeeping.

**The $W$ component is the Disk chapter's vertical oscillation** — the Sun is currently ~20 pc above the midplane and rising, on an 84-Myr cycle.

**The $V$ component is contaminated by asymmetric drift**, an effect worth understanding. The LSR is defined by circular motion, but it is calibrated against the average motion of nearby stars — and that average is **not** circular. Stars with larger random velocities spend more of their time at radii larger than their guiding centre (since they linger at apocentre), so the population sampled at any radius is biased toward stars whose guiding centres lie *inward*, which rotate more slowly. The result is that a stellar population's mean rotation **lags** the circular speed, by an amount growing with its velocity dispersion. The thick disk's 50 km/s lag, noted in the Disk chapter, is exactly this effect; halo stars lag by essentially the whole rotation speed.

Asymmetric drift is a good example of a **selection effect built into dynamics itself**: nothing is wrong with the measurements, and yet the average motion of the stars one can see is systematically not the circular motion one wants.

## What is conserved, and why it matters

Because the potential is smooth and (to good approximation) steady, certain quantities are conserved along an orbit, and these **integrals of motion** are the practical currency of the subject.

In an axisymmetric, time-independent potential, two integrals are exact:

- **Energy** $E$, since the potential does not depend on time.
- **The component of angular momentum about the symmetry axis**, $L_z$, since the potential does not depend on azimuth.

A third integral exists empirically but has no general closed form — its existence is inferred from the observed shape of stellar velocity distributions, and it is conventionally called simply the "third integral."

The modern formulation replaces these with **action variables** $(J_r, J_z, J_\phi)$, which describe respectively the amplitude of radial oscillation, of vertical oscillation, and the azimuthal circulation. Actions have two properties that make them the coordinates of choice:

- They are **adiabatic invariants**: they survive slow changes in the potential. A star's actions are nearly unchanged even as the Galaxy's mass distribution evolves over gigayears.
- They **label orbits rather than positions**. Two stars with the same actions are on the same orbit, regardless of where they currently sit along it.

This is precisely why the Halo chapter's accretion debris remains visible in action space long after it has smeared uniformly through ordinary position and velocity space: phase mixing scrambles *where along an orbit* a star is, but not *which orbit* it is on. Gaia-Enceladus was recovered because ten billion years of mixing could not erase a label that mixing does not touch.

**Jeans' theorem** makes this formal: in a steady-state collisionless system, the distribution function can depend on position and velocity only through the integrals of motion. The equilibrium state of a galaxy is therefore fully described by a function of three action variables — which is a spectacular reduction from a six-dimensional phase-space distribution over 10¹¹ stars.

```checkpoint
q: Accretion debris from a galaxy destroyed ten billion years ago remains identifiable in action space long after it has smeared through position and velocity space. This is because actions
a: are conserved exactly, unlike energy and angular momentum
x: Energy and the vertical angular momentum are exactly conserved in a steady axisymmetric potential, while actions are adiabatic invariants — approximately rather than exactly conserved. The advantage lies elsewhere.
a*: label which orbit a star is on rather than where it is along that orbit — and phase mixing scrambles only the latter
a: are unaffected by the gravitational potential, so they carry no dynamical information
x: Actions are computed from the potential and encode a great deal about the orbit. Their value is precisely that they encode orbital properties in a form that survives.
a: can only be measured for stars in the solar neighbourhood
x: Actions are computed from full phase-space coordinates and a potential model, and are used routinely for halo stars at tens of kiloparsecs. Proximity is not a requirement.
hint: Phase mixing spreads debris along its orbits. Does it change which orbits the stars are on?
why: Debris from a disrupted satellite spreads along its orbital paths, so the stars' positions and instantaneous velocities become uniformly distributed and the structure vanishes from those coordinates. But phase mixing does not move a star onto a different orbit, and actions describe the orbit itself — so the clump survives in action space. Adiabatic invariance adds that slow changes in the Galaxy's potential over gigayears also leave actions nearly untouched, which is why the Gaia-Enceladus merger was recoverable at all.
---
q: A stellar population's mean rotation lags the true circular speed by an amount that grows with its velocity dispersion — asymmetric drift. The cause is that stars with larger random motions
a: are systematically older and formed when the Galaxy rotated more slowly
x: Rotation speed has not changed enough over the disk's lifetime to produce a 50 km/s lag, and the effect is present in populations of the same age with differing dispersions. It is kinematic, not historical.
a*: spend more of their time near apocentre, so the stars observed at a given radius are biased toward those whose guiding centres lie further in — and inner guiding centres carry less angular momentum
a: lose angular momentum through collisions with other stars
x: The Galaxy is collisionless — relaxation takes 4.5 million Hubble times — so no angular momentum is exchanged between stars. The lag arises from which stars are sampled, not from any transfer.
a: are being dragged backward by the Galaxy's magnetic field
x: Magnetic fields act on ionised gas, not on stars, which are electrically neutral on the relevant scales. Stellar dynamics is purely gravitational.
hint: An eccentric orbit spends more time at its outer turning point. If you sample stars at one radius, whose orbits are you preferentially catching?
why: A star on an eccentric orbit lingers near apocentre, so a sample taken at radius R is over-represented by stars whose guiding centres lie inside R — and those carry less angular momentum, hence lower rotational velocity. The mean therefore lags the circular speed, increasingly so for hotter populations: modest for the thin disk, ~50 km/s for the thick disk, essentially the full rotation speed for the halo. Nothing is mismeasured; the dynamics itself imposes the selection.
```

## The virial theorem

The most-used result in galactic dynamics is also the simplest. For a self-gravitating system in steady state,

$2K + U = 0$

where $K$ is total kinetic energy and $U$ total gravitational potential energy. Kinetic energy is half the magnitude of the potential energy, always, for any bound system that has settled.

The practical value is that it converts **observable motions into mass**. With $K = \tfrac{1}{2}M\langle v^2\rangle$ and $U \approx -GM^2/R$, the theorem gives

$M \approx \dfrac{\langle v^2 \rangle R}{G}$

so measuring a velocity dispersion and a size yields a mass — for a globular cluster, a galaxy, or a cluster of galaxies. It requires no assumption about what the mass is made of or whether it emits light, which is exactly why it became the instrument that revealed the missing mass. Fritz Zwicky applied it to the Coma cluster in 1933 and found a mass vastly exceeding the visible galaxies, a story the next-but-one chapter takes up.

Two cautions travel with it.

**The system must be in equilibrium.** A system still collapsing, or recently disturbed by a merger, has not settled into the virial relation, and applying the theorem gives a wrong mass. Merging clusters of galaxies are a standing example.

**The measured dispersion must be representative.** Line-of-sight velocities give one component of a three-dimensional dispersion; converting requires an assumption about anisotropy — and as the Halo chapter's $\beta \approx 0.7$ showed, real systems can be strongly anisotropic. This **mass–anisotropy degeneracy** is a genuine limitation, since a more radially anisotropic system produces the same observed dispersion with a different mass.

## Settling without collisions

If relaxation by encounters takes 4.5 million Hubble times, how does a galaxy reach equilibrium at all? Two mechanisms act on a crossing time, and both are collisionless.

**Phase mixing.** Stars on neighbouring orbits have slightly different periods, so an initially compact group spreads along its orbits and, over many crossings, fills the accessible region uniformly. Nothing is exchanged; the distribution simply becomes smooth because different stars get out of step. The *Gaia* phase spiral described in the Disk chapter is phase mixing caught partway through — a disturbance that has been winding up for a few hundred million years and is not yet smoothed away.

**Violent relaxation.** When a system's potential changes rapidly — during a merger, or a collapse — individual stars' energies change, because energy is conserved only in a *static* potential. Stars gain or lose energy according to where they happen to be while the potential is fluctuating, which redistributes energies across the whole system within roughly one crossing time. Donald Lynden-Bell formalised this in 1967, and it explains how merger remnants become smooth, well-mixed ellipticals almost immediately rather than waiting 10¹⁷ years.

Violent relaxation has a signature property: it redistributes energy **independently of stellar mass**, since the fluctuating potential accelerates all stars equally. It therefore does **not** produce mass segregation — in contrast to two-body relaxation, which does. Finding mass segregation in a system is thus evidence that genuine two-body relaxation has operated, which is why globular clusters show it and elliptical galaxies do not.

```checkpoint
q: Violent relaxation allows a merging galaxy to reach a smooth equilibrium within about one crossing time, rather than the 10¹⁷ years two-body relaxation would require. It works because
a: stars collide frequently during a merger, exchanging energy directly
x: Even during a merger the stellar density is far too low for physical or gravitational two-body encounters to matter — galaxies pass through each other essentially without any star striking another.
a*: the potential itself changes rapidly, so individual stellar energies are no longer conserved and are redistributed according to where each star happens to be while it fluctuates
a: the gas in the merging galaxies dissipates the excess energy
x: Gas does dissipate and is important for the merger's gaseous component, but violent relaxation is a purely stellar, purely gravitational process that operates in gas-free mergers as well.
a: dark matter absorbs the kinetic energy of the stars
x: Dark matter participates in the same collisionless dynamics and is itself violently relaxed; it does not act as an energy sink for stars.
hint: Energy is conserved along an orbit only when the potential is static. What happens when it is not?
why: In a static potential a star's energy is an integral of motion; when the potential fluctuates on a dynamical timescale, that conservation fails and stars gain or lose energy depending on their phase relative to the fluctuation. This redistributes energies system-wide within a crossing time. Because the fluctuating field accelerates all stars equally regardless of mass, violent relaxation produces no mass segregation — which is precisely why ellipticals lack it while globular clusters, relaxed by genuine two-body encounters, display it.
---
q: The Gaia "phase spiral" — a coherent spiral in the plane of vertical position against vertical velocity — is an example of
a: violent relaxation in progress, as the disk's potential fluctuates
x: Violent relaxation requires a rapidly changing potential and completes within a crossing time. The phase spiral has persisted for hundreds of Myr in a potential that is essentially static, which is the opposite regime.
a*: phase mixing caught partway through — stars with different vertical periods gradually shearing an initially coherent oscillation into a spiral
a: two-body relaxation acting on the vertical degree of freedom
x: Two-body relaxation in the disk takes ~10¹⁷ years; nothing observable can be attributed to it. The spiral is produced by the smooth potential alone.
a: mass segregation, with heavier stars settling toward the midplane
x: Mass segregation requires two-body relaxation, which is utterly negligible in the disk, and the phase spiral appears in stars of all masses alike.
hint: Stars with larger vertical excursions oscillate more slowly. What does that do to a group that started oscillating together?
why: Phase mixing arises purely because neighbouring orbits have slightly different periods, so an initially coherent set of oscillators gradually shears apart. The vertical period grows with excursion amplitude, so a disk struck vertically a few hundred Myr ago winds into exactly the observed spiral, with the number of wraps dating the disturbance. It is the clearest available picture of collisionless relaxation partway to completion — and the reason it is still visible is that phase mixing is slow enough to have left the record intact.
```

{{image: Galaxy rotation curve | Orbits in a galaxy are governed by the smooth potential of the whole mass distribution rather than by any central body. Because that potential is neither point-like nor harmonic, orbits do not close: a star oscillates radially about a circulating guiding centre, with κ = √2 Ω for a flat rotation curve, tracing a rosette that fills an annulus over many orbits.}}

```checkpoint
q: The virial theorem, 2K + U = 0, became the instrument that revealed dark matter because it converts observed motions into a mass estimate
a: more precisely than any other method available
x: It is not especially precise — it carries factor-level uncertainties from geometry and anisotropy. Its power lies in what it does *not* require, not in its accuracy.
a*: without any assumption about what the mass is made of or whether it emits light at all
a: using only the light emitted by the system, which is easily measured
x: This inverts the method entirely. The virial theorem uses velocities and sizes; luminosity enters nowhere. That independence from light is precisely why a discrepancy with the luminous mass could be identified.
a: provided the system's distance is known to high accuracy
x: Distance does enter through the physical size, but it is a routine requirement shared by every mass estimate. It is not what distinguishes the virial theorem or explains its historical role.
hint: Zwicky compared a virial mass with the mass visible in galaxies. Which of the two quantities could have been computed without seeing anything?
why: The theorem relates kinetic to potential energy for any bound, relaxed system, so a velocity dispersion and a size yield a mass regardless of the matter's nature. Comparing that dynamical mass with the mass inferred from starlight is what exposed a discrepancy — Zwicky's 1933 analysis of the Coma cluster being the first. A method that weighs matter without seeing it is exactly what is needed to discover matter that cannot be seen.
---
q: Applying the virial theorem to a cluster of galaxies that is currently merging would give an unreliable mass because
a: merging systems contain more dark matter than relaxed ones
x: Dark-matter content is not altered by a merger in progress; what changes is whether the system satisfies the equilibrium condition the theorem assumes.
a*: the theorem holds only for systems in steady state, and a merging cluster has not settled into virial equilibrium
a: velocities cannot be measured accurately during a merger
x: Redshifts are measured just as accurately for merging systems; the measurements are fine. It is the interpretation of those velocities through an equilibrium relation that fails.
a: the gravitational constant differs in dense environments
x: G is a universal constant, and no evidence suggests environmental variation. The failure is in the assumption of equilibrium, not in the physics of gravity.
hint: The relation 2K + U = 0 is derived by assuming the system's structure is not changing. What if it is?
why: The virial relation is a steady-state result, obtained by requiring that the system's moment of inertia be unchanging. A cluster still assembling has kinetic energy that has not yet been converted or shared, so the relation does not hold and the inferred mass is wrong — typically overestimated. Merging clusters are a standing caution, and the second assumption travelling with the theorem is comparably important: converting a line-of-sight dispersion to three dimensions requires knowing the orbital anisotropy, producing the mass–anisotropy degeneracy that limits precision even for relaxed systems.
```

{{image: Dynamical friction | Dynamical friction: a massive object moving through a sea of lighter ones deflects them toward its path, and because it keeps moving they accumulate behind it as an overdense wake. That wake pulls backward, decelerating the object — a drag force produced entirely by gravity in a medium where nothing collides. It is why satellite galaxies spiral inward and merge rather than orbiting indefinitely.}}

## Dynamical friction

One collisionless effect does transfer energy between components, and it governs how galaxies swallow their satellites.

A massive object moving through a sea of lighter ones — a globular cluster or satellite galaxy moving through a halo of stars and dark matter — gravitationally deflects the particles it passes. They are pulled toward it, and because it keeps moving, they accumulate *behind* it, forming an overdense wake. That wake pulls backward on the object, decelerating it. This is **dynamical friction**, derived by Chandrasekhar in 1943, and its peculiarity is that it is a drag force produced entirely by gravity, in a medium where nothing collides.

The deceleration scales with the satellite's own mass — a more massive object raises a stronger wake and slows faster — which produces a characteristic **mass-dependent sinking**. Massive satellites spiral into the centre; light ones orbit indefinitely.

Estimating the sinking timescale for a Magellanic-Cloud-like satellite of 10¹¹ $M_\odot$ at 50 kpc in a 10¹² $M_\odot$ halo gives of order **a gigayear**, which is short compared with the age of the Galaxy. The consequences run through the block:

- **Satellites merge.** Dynamical friction is why accreted galaxies do not simply orbit forever; they spiral in and are disrupted, depositing debris into the halo. Gaia-Enceladus arrived this way.
- **Massive satellites sink fastest**, which is why the Milky Way has no large companions in its inner regions and why the Magellanic Clouds — massive and comparatively recent arrivals — are expected to merge within a few gigayears.
- **Globular clusters sink**, which contributes to building nuclear star clusters at galactic centres, including the Milky Way's own.
- **Bars slow down.** A rotating bar experiences dynamical friction against the dark-matter halo, transferring angular momentum outward and decreasing its pattern speed. Measured bar pattern speeds therefore constrain halo density — one of the few dynamical probes of dark matter inside a galaxy's visible extent.

Dynamical friction is also the reason the block's hierarchy of structures is not permanent. Every satellite currently orbiting the Milky Way is on its way in.

## Pulling the thread

- A galaxy's **relaxation time** is ~6 × 10¹⁶ yr — **4.5 million Hubble times** — so stars never encounter one another and respond only to the **smooth potential**. A globular cluster's is 0.15 Hubble times, so it *has* relaxed: same stars, different $N$, entirely different physics, with **mass segregation, evaporation, and core collapse** as the signatures.
- Closed orbits are a **degeneracy** of the point-mass and harmonic potentials; a galaxy is neither, so orbits are **rosettes**. Near-circular orbits are epicycles about a guiding centre with $\kappa = \sqrt{2}\,\Omega$ for a flat curve — 152 Myr against a 214 Myr orbit at the Sun — and comparisons of $\Omega$ with $\kappa$ define the **Lindblad resonances** and the frame in which **bars** close.
- The **LSR** is the circular-orbit reference; the Sun's 18 km/s peculiar motion must be removed from every measurement, and **asymmetric drift** biases the average motion of any hot population to lag the true circular speed — a selection effect imposed by dynamics itself.
- **Integrals of motion** and **actions** label orbits rather than positions, are **adiabatic invariants**, and are why accretion debris survives in action space after phase mixing has erased it everywhere else. **Jeans' theorem** reduces a 10¹¹-star system to a function of three actions.
- The **virial theorem** ($2K + U = 0$) converts motions into mass without assuming what the mass is, which is why it revealed the missing mass — subject to the system being **relaxed** and to the **mass–anisotropy degeneracy**.
- Galaxies settle by **phase mixing** (different periods shearing structure apart — the *Gaia* phase spiral caught mid-process) and **violent relaxation** (a fluctuating potential redistributing energies within a crossing time, and producing **no mass segregation**, unlike two-body relaxation).
- **Dynamical friction** is gravitational drag from a wake, scaling with satellite mass: massive satellites sink within gigayears, which is why satellites merge, why nuclear clusters build up, and why bars slow against dark haloes.

The transferable idea: **whether a system is "collisional" is a comparison of timescales, never a description of physical contact.** Stars in a galaxy are separated by millions of stellar radii and never touch — but so are molecules in a gas, and the gas is collisional while the galaxy is not. What differs is the ratio of the encounter timescale to the age of the system. The same question, asked properly, decides whether interstellar gas behaves as a fluid, whether a plasma can be treated thermodynamically, whether a social network transmits information faster than its members change opinion, and whether a market's participants have time to react to one another before conditions shift. Systems that look identical in composition can require entirely different mathematics, and the discriminating question is always: **how many interaction times fit into the system's life?**

## Further reading

{{book: James Binney | Galactic Dynamics | 2008}}

{{book: Scott Tremaine | Dynamics of Planetary Systems | 2023}}

{{book: Lyman Spitzer | Dynamical Evolution of Globular Clusters | 1987}}

Beyond the books: Chandrasekhar's 1943 dynamical-friction papers are the origin of the wake argument and remain readable; Lynden-Bell's 1967 paper introducing violent relaxation explains how merger remnants smooth themselves without any collisions; and the *Gaia* phase-spiral discovery paper of 2018 shows collisionless phase mixing captured partway through, which no textbook figure conveys as well.

## Problems

*Useful numbers: G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 pc = 3.086 × 10¹⁶ m; 1 yr = 3.156 × 10⁷ s; t_relax ≈ [N/(8 ln N)] t_cross; for a flat rotation curve κ = √2 Ω; virial mass M ≈ ⟨v²⟩R/G; R₀ = 8.2 kpc, v_c = 235 km/s.*

**1.** *(Collisionless or not.)* **(a)** For the Milky Way, take N = 10¹¹ and a crossing time of 125 Myr; compute the relaxation time and express it in Hubble times (take 13.8 Gyr). **(b)** For a globular cluster with N = 10⁵, R = 10 pc, and v = 10 km/s, compute the crossing time and then the relaxation time; express in Hubble times. **(c)** Name three observable consequences that follow for the cluster but not for the Galaxy.

**2.** *(Epicycles.)* At the Sun's position, Ω = 28.7 km s⁻¹ kpc⁻¹. **(a)** Compute the orbital period. **(b)** Compute κ and the epicyclic period. **(c)** How many radial oscillations occur per orbit? **(d)** Explain what the irrationality of this ratio implies for the orbit's shape.

**3.** *(Two special potentials.)* **(a)** For a point mass, state how v_c scales with r and what shape the orbits take. **(b)** Repeat for a uniform sphere. **(c)** State where a flat rotation curve sits between them and what that implies about orbit closure.

**4.** *(Weighing by motion.)* A globular cluster has a line-of-sight velocity dispersion of 12 km/s and a half-mass radius of 8 pc. **(a)** Estimate its mass using M ≈ ⟨v²⟩R/G, taking ⟨v²⟩ ≈ 3σ_los². **(b)** Comment on whether the result is reasonable. **(c)** State the two assumptions that could invalidate it.

**5.** *(Asymmetric drift.)* **(a)** Explain why a population's mean rotation lags the circular speed. **(b)** Given that the lag grows with velocity dispersion, rank the thin disk, thick disk, and halo by expected lag. **(c)** Explain why this is a selection effect rather than a measurement error.

**6.** *(Why actions.)* **(a)** State two properties of action variables that make them preferable to positions and velocities for identifying accreted debris. **(b)** Explain why phase mixing destroys structure in velocity space but not in action space. **(c)** State what Jeans' theorem allows one to conclude about a steady-state galaxy's distribution function.

**7.** *(Two ways to relax.)* **(a)** Contrast phase mixing and violent relaxation in terms of what changes and on what timescale. **(b)** Explain why violent relaxation produces no mass segregation. **(c)** State what the presence of mass segregation in a system tells you, and give an example of a system showing it and one not.

**8.** *(Dynamical friction.)* **(a)** Explain the wake mechanism in two sentences. **(b)** Explain why the drag scales with the satellite's own mass, and what that implies about which satellites survive. **(c)** Name two consequences of dynamical friction elsewhere in this block.

**9.** *(Assembling the framework.)* A stellar stream is found in the halo with a coherent structure in energy and angular momentum but no spatial coherence. **(a)** What does this indicate about its age relative to the orbital period? **(b)** What process erased the spatial coherence, and what preserved the other? **(c)** State how you would use this system to constrain the Galaxy's potential, and one limitation of doing so.

## Worked answers

**1.** **(a)** $\ln(10^{11}) = 25.3$, so $t_{\text{relax}} = [10^{11}/(8 \times 25.3)] \times 1.25\times10^{8} = 4.94\times10^{8} \times 1.25\times10^{8} = \mathbf{6.2\times10^{16}\ yr}$, which is $6.2\times10^{16}/1.38\times10^{10} = \mathbf{4.5\times10^{6}\ Hubble\ times}$. **(b)** $t_{\text{cross}} = 2R/v = 2 \times 10 \times 3.086\times10^{16}/10^{4} = 6.2\times10^{13}$ s $= 2.0$ Myr; $\ln(10^{5}) = 11.5$, so $t_{\text{relax}} = [10^{5}/(8 \times 11.5)] \times 2.0\times10^{6} = 1087 \times 2.0\times10^{6} = \mathbf{2.2\times10^{9}\ yr} = \mathbf{0.16\ Hubble\ times}$. **(c)** **Mass segregation** (heavy stars sinking toward the core through energy equipartition), **evaporation** (stars kicked above escape velocity, producing tidal tails), and **core collapse** (the runaway driven by the negative heat capacity of self-gravitating systems). None occurs in the Galaxy, whose relaxation time exceeds its age by seven orders of magnitude.

**2.** **(a)** $T = 2\pi/\Omega = 2\pi/28.7$ kpc/(km s⁻¹) $= 0.219 \times 978$ Myr $= \mathbf{214\ Myr}$. **(b)** $\kappa = \sqrt{2} \times 28.7 = \mathbf{40.6}$ km s⁻¹ kpc⁻¹; $T_\kappa = 2\pi/40.6 = \mathbf{152\ Myr}$. **(c)** $\kappa/\Omega = \sqrt{2} = \mathbf{1.414}$ radial oscillations per orbit. **(d)** Since $\sqrt{2}$ is irrational, the radial and azimuthal motions never come back into phase, so the orbit **never closes**: the star traces a precessing rosette that eventually fills an annulus between its minimum and maximum radii. A closed orbit would require the ratio to be rational.

**3.** **(a)** Point mass: $v_c \propto r^{-1/2}$ (Keplerian), and orbits are **closed ellipses with the mass at a focus**. **(b)** Uniform sphere: $v_c \propto r$ (solid-body), and orbits are **closed ellipses centred on the origin**. **(c)** A flat rotation curve, $v_c \approx$ constant, lies **between** the two, corresponding to a logarithmic potential. Bertrand's theorem shows those two are the *only* potentials giving closed orbits universally, so a galaxy's intermediate case gives **non-closing rosettes** — the general behaviour, of which the Solar System's ellipses are the special exception.

**4.** **(a)** $\langle v^2 \rangle = 3 \times (1.2\times10^{4})^2 = 4.32\times10^{8}$ m²/s²; $R = 8 \times 3.086\times10^{16} = 2.47\times10^{17}$ m; $M = 4.32\times10^{8} \times 2.47\times10^{17}/6.674\times10^{-11} = 1.60\times10^{36}$ kg $= \mathbf{8.0\times10^{5}\ M_\odot}$. **(b)** Entirely reasonable — globular clusters span roughly 10⁴ to 10⁶ solar masses, so this is a fairly massive but ordinary cluster. **(c)** That the cluster is in **virial equilibrium** (violated if it is being tidally disrupted or was recently disturbed), and that the **velocity dispersion is isotropic**, since converting a line-of-sight dispersion to a three-dimensional one requires it. Anisotropy introduces the mass–anisotropy degeneracy, in which a different mass with a different orbital distribution reproduces the same observation.

**5.** **(a)** Stars on eccentric orbits linger near apocentre, so a sample taken at a given radius over-represents stars whose guiding centres lie further in; those carry less angular momentum and therefore rotate more slowly, dragging the mean below the circular speed. **(b)** Lag grows with dispersion, so: **thin disk** (smallest, a few km/s), **thick disk** (~50 km/s), **halo** (essentially the whole ~235 km/s, since halo stars have no net rotation). **(c)** Every individual velocity is measured correctly and the dynamics is correctly described; what fails is the assumption that the *average* of the observable stars equals the circular speed. The bias is imposed by which orbits deposit stars at the observing radius — a selection effect generated by the dynamics itself rather than by any instrumental shortcoming, which is why it must be corrected for rather than reduced by better data.

**6.** **(a)** They **label orbits rather than positions**, so they do not change as a star moves along its path; and they are **adiabatic invariants**, so they survive slow evolution of the Galaxy's potential over gigayears. **(b)** Phase mixing spreads stars along their orbits, randomising where each star is and hence its instantaneous position and velocity — but it never moves a star onto a different orbit, so the actions are untouched and the clump persists in action space. **(c)** In a steady-state collisionless system the distribution function can depend on phase-space coordinates **only through the integrals of motion**, so an equilibrium galaxy is fully described by a function of three actions rather than a general function of six phase-space variables.

**7.** **(a)** **Phase mixing** changes nothing about any star's orbit — structure disappears merely because neighbouring orbits have different periods and get out of step — and it acts over many crossing times. **Violent relaxation** changes stars' **energies**, because the potential is fluctuating rapidly and energy is not conserved in a time-dependent potential, and it acts within roughly **one** crossing time. **(b)** The fluctuating potential accelerates every star equally regardless of mass ($\ddot{\mathbf{r}} = -\nabla\Phi$ contains no mass), so energies are redistributed without reference to stellar mass and no segregation results. **(c)** Mass segregation is evidence that genuine **two-body relaxation** has operated, which requires a small enough $N$ and a long enough time. **Globular clusters** show it; **elliptical galaxies**, assembled by violent relaxation in mergers and with relaxation times far exceeding their ages, do not.

**8.** **(a)** A massive object moving through a sea of lighter particles deflects them toward its path, and because it continues moving they pile up behind it as an overdense wake. That wake exerts a backward gravitational pull, decelerating the object — a drag force generated purely by gravity in a medium where nothing collides. **(b)** A more massive satellite deflects particles more strongly and raises a denser wake, so the drag grows with its own mass and the sinking time falls roughly as $1/M_{\text{sat}}$. Massive satellites therefore spiral in within gigayears while low-mass ones survive on their orbits essentially indefinitely — which is why surviving satellites are preferentially small. **(c)** Accreted galaxies **spiral in and disrupt** rather than orbiting forever, delivering the Halo chapter's debris (Gaia-Enceladus among it); and rotating **bars slow down** by transferring angular momentum to the dark halo, so measured bar pattern speeds constrain the halo's density inside the visible galaxy. Sinking globular clusters also contribute to building nuclear star clusters.

**9.** **(a)** The stream is **old relative to its orbital period** — many orbits have elapsed, enough for stars to spread all the way around their paths. A young stream would still be spatially coherent. **(b)** **Phase mixing** erased the spatial coherence by spreading stars along their orbits at slightly different rates; the coherence in energy and angular momentum survived because those are **integrals of motion**, unchanged by mixing and only slowly affected by evolution of the potential. **(c)** Stream members share a common progenitor orbit, so requiring that they lie on consistent orbits in a trial potential constrains that potential — this is the standard method for weighing the halo at radii where no other tracer exists. The chief limitation is that it assumes the potential is **static and axisymmetric**; a Milky Way perturbed by the Magellanic Clouds, or with a triaxial halo, will bias the inferred mass, which is why modern analyses fit the perturbers simultaneously rather than treating the Galaxy as isolated.$mwOrbits_master$,
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
