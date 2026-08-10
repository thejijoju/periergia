-- Astronomy & Space · The Milky Way — Interstellar Medium —
-- "Star-Formation Cycle". Curated master for
-- astronomy-and-space/milky-way/interstellar-medium/star-formation-cycle
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The taxonomy node already exists (Interstellar Medium block), so this
-- change is content-only: no seed edit rides with it.
--
-- The loop that runs a galaxy: gas to clouds to stars to feedback to
-- gas. Opens on the central quantitative puzzle - free-fall collapse of
-- the Milky Way's molecular gas would yield 330 solar masses of stars
-- per year against the 1.5 observed, an efficiency of half a per cent
-- per free-fall time, posed by Zuckerman and Evans in 1974; the
-- Kennicutt-Schmidt relation and the near-linear molecular version
-- showing that what matters is how much molecular gas exists rather
-- than how it is arranged; feedback as the resolution, with the
-- overcooling problem explaining why momentum rather than energy is the
-- currency, and the arithmetic showing one supernova per hundred solar
-- masses of stars can move three hundred times that mass; the initial
-- mass function making massive stars the agents of nearly everything;
-- cloud lifecycles and the de-correlation evidence that clouds are
-- destroyed by their own offspring; and the galactic ecosystem of
-- fountain, accretion and outflow that keeps the loop supplied - ending
-- on why galaxies convert only a fifth of their baryons into stars.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/milky-way/interstellar-medium/star-formation-cycle',
    'research',
    'advanced',
    'read',
    $mwSFCycle_master$> The **star-formation cycle** is the loop by which a galaxy converts interstellar gas into stars and the stars return processed gas to the medium: diffuse gas condenses into molecular clouds, clouds collapse into stars, and those stars — through radiation, winds, and supernovae — heat, ionise, and disperse the remaining gas, halting further collapse and returning enriched material to be used again. The loop is **self-regulating**, and it runs about **a hundred times slower** than gravity alone would allow.

The previous three chapters described the interstellar medium's components: its phases, its dust, its cosmic rays and fields. This one describes what the medium *does*. And the organising fact is a discrepancy so large that it defines the subject.

Take the Milky Way's molecular gas — about 10⁹ solar masses, at the densities observed in giant molecular clouds — and ask how fast gravity would convert it into stars. The free-fall time at those densities is about **3 million years**. If the gas simply collapsed, the Galaxy would form roughly **330 solar masses of stars per year**.

The observed rate is about **1.5 solar masses per year**.

Star formation proceeds at roughly **half of one per cent** of the free-fall rate. Something is holding gravity off almost completely, in a medium that has already condensed to the point where gravity should be decisive. Identifying that something, and explaining why it produces such consistent inefficiency across enormously different environments, is the central problem of this chapter and one of the central problems of galaxy formation.

## The loop

The cycle has four stages, each of which the block has now met:

**One: assembly.** Diffuse atomic gas is gathered into dense clouds — by spiral arm compression, by supernova shells sweeping up material, by thermal instability, by turbulent convergence, and by simple self-gravity. As density rises and dust column grows, the cloud interior becomes shielded from ultraviolet starlight, hydrogen turns molecular on grain surfaces, and the gas cools to 10–20 K.

**Two: collapse.** Within the cloud, the densest regions become gravitationally unstable and fragment, and cores collapse into protostars and their disks.

**Three: feedback.** The newly formed stars — overwhelmingly the most massive of them — flood their surroundings with ultraviolet radiation, drive powerful winds, and after a few million years explode. The cloud is ionised, heated, pushed, and eventually destroyed.

**Four: return.** Enriched gas is returned to the medium and mixed, becoming the raw material of the next generation, with a fraction locked permanently into long-lived stars and remnants.

The critical structural feature is that **stage three destroys stage one**. Star formation terminates its own fuel supply. That is what makes the cycle self-regulating rather than runaway, and it is where the missing factor of two hundred is to be found.

## The inefficiency, stated precisely

Robert Zuckerman and Neal Evans posed the problem sharply in 1974, and the arithmetic is worth doing rather than merely quoting.

A giant molecular cloud of 10⁵ solar masses with a radius of ~15 pc has a mean density of about 100 hydrogen molecules per cubic centimetre. The gravitational free-fall time for a body of density $\rho$ is

$t_{\text{ff}} = \sqrt{\dfrac{3\pi}{32 G\rho}}$

which for this cloud is about **3 million years**. Applying that to the Galaxy's ~10⁹ solar masses of molecular gas gives a predicted star-formation rate of $10^9/3\times10^6 \approx$ **330 $M_\odot$/yr**.

The Milky Way forms about **1.5 $M_\odot$/yr**. The ratio is ~0.005: the **efficiency per free-fall time** is half a per cent.

Three observations sharpen the puzzle:

- **It is not a Milky Way peculiarity.** Star-forming galaxies across a wide range of masses, redshifts, and environments show molecular gas depletion times clustering around 1–2 Gyr — hundreds of free-fall times. Whatever regulates the process is general.
- **It is not a shortage of gas.** The molecular gas is present, cold, and dense. Nothing prevents it from being observed collapsing; it simply is not.
- **It cannot be a permanent support.** Molecular clouds are not stable long-lived structures held up against gravity for gigayears. They form, live 10–30 million years, and are destroyed. The inefficiency is achieved *within* short-lived clouds, not by indefinitely postponing collapse.

Three explanations have been advanced, and the way the field's view shifted between them is instructive.

**Magnetic support** was the leading answer through the 1970s and 1980s. A magnetised cloud resists compression across field lines, and — as the previous chapter established — the gas can only slip past the field as fast as ambipolar diffusion allows, which is slow. The difficulty is quantitative: measured field strengths in most molecular clouds turn out to be somewhat *below* the value needed for support, so clouds are magnetically "supercritical" and fields delay collapse without preventing it.

**Turbulent support** dominated from the 1990s. The supersonic turbulence described in the Gas Phases chapter provides pressure support on large scales while creating dense shocked regions on small ones — so turbulence both holds clouds up globally and seeds collapse locally. This is certainly part of the answer. Its own difficulty is that supersonic turbulence decays within about a crossing time, so it must be continuously driven, which pushes the question back a step: driven by what?

**Feedback** is the modern answer, and it subsumes the others. Star formation destroys its own environment so effectively that only a small fraction of a cloud is converted before the cloud is dispersed — and the same feedback drives the turbulence that provides support elsewhere. The low efficiency is not a property of clouds resisting gravity for a long time; it is a property of clouds being **destroyed quickly** after they begin forming stars.

```checkpoint
q: The Milky Way's molecular gas, collapsing at the free-fall rate, would form ~330 M☉ of stars per year, against the observed ~1.5. This establishes that
a: most of the molecular gas has already been converted into stars
x: The molecular gas is observed to be present now — about 10⁹ M☉ of it — and the calculation applies to that reservoir. Past conversion does not explain why the gas currently present is not collapsing.
a: the free-fall time has been miscalculated for typical cloud densities
x: The free-fall time depends only on density, which is measured directly from CO and dust observations, and the formula is elementary gravitation. The 3 Myr figure is robust; the discrepancy is physical, not arithmetic.
a*: something opposes or interrupts gravitational collapse almost completely — star formation proceeds at roughly 0.5% efficiency per free-fall time
a: the Galaxy's star-formation rate is much higher than 1.5 M☉/yr and has been underestimated
x: The rate is measured several independent ways — ultraviolet, infrared, radio free-free, and direct counts of young stars — which agree on 1–3 M☉/yr. A factor-of-200 error is not available.
hint: The gas is present, cold, and dense; gravity is unopposed in the calculation. What does the observed rate being 200 times smaller imply?
why: The calculation assumes gravity acts alone on gas whose density is directly measured, so a discrepancy of more than two orders of magnitude means gravity is being resisted or interrupted. Since molecular gas depletion times cluster around 1–2 Gyr in galaxies of very different masses and epochs, the regulation is general rather than local — which is what makes explaining it a central problem in galaxy formation rather than a detail of Milky Way astronomy.
---
q: Magnetic support was the leading explanation for star formation's inefficiency through the 1970s and 80s, but it is no longer regarded as sufficient because
a: molecular clouds turn out to contain no magnetic field
x: Clouds are certainly magnetised — Zeeman measurements and dust polarisation both detect fields in them. The problem is with the field's strength relative to what support would require, not with its existence.
a*: measured field strengths fall somewhat below the value needed to support clouds against their own gravity, so fields delay collapse without preventing it
a: magnetic fields cannot exert force on neutral gas under any circumstances
x: Fields act on the trace ionised fraction, which collides with neutrals and transmits the force — as the previous chapter established. The coupling is indirect but real, and it does slow collapse.
a: the fields decay too quickly to matter over a cloud's lifetime
x: Field decay through ambipolar diffusion is slow compared with cloud lifetimes, which is precisely why magnetic support was attractive. Its failure is one of magnitude rather than of persistence.
hint: The question is not whether clouds are magnetised but whether the measured field is strong enough. What did the measurements show?
why: Support requires a field above a critical value set by the cloud's mass and radius; observed fields place most clouds just below it — "magnetically supercritical" — so magnetic forces slow collapse but cannot halt it. Fields remain important for removing angular momentum and for setting core structure, but the factor of 200 in efficiency needs another agent, and attention moved first to turbulence and then to feedback.
---
q: The modern account attributes star formation's low efficiency chiefly to feedback rather than to long-term support, on the reasoning that
a: clouds are supported against gravity for billions of years by stellar radiation
x: Clouds do not persist for billions of years — their lifetimes are 10–30 Myr. Any explanation requiring long-term support is ruled out by cloud lifetimes alone.
a*: molecular clouds live only 10–30 Myr and are destroyed by the stars they produce, so only a small fraction is converted before the cloud ceases to exist
a: gravitational collapse is much slower than the free-fall calculation suggests
x: The free-fall time is a firm result of gravitation at the measured densities; collapse of an unopposed region really is that fast. The inefficiency lies in how much gas participates and for how long, not in the speed of collapse itself.
a: most molecular gas is too warm to collapse
x: Molecular gas sits at 10–20 K, which is precisely why it is the phase that forms stars. Temperature is not the obstacle.
hint: If clouds only live ~10–30 Myr, can the inefficiency be achieved by holding gas up for a long time? What else could produce it?
why: Low efficiency can arise either by resisting gravity for many free-fall times or by converting a small fraction and then removing the cloud. Cloud lifetimes of 10–30 Myr — only a few free-fall times — rule out the first, leaving the second: massive stars ionise, heat and blow apart their birth clouds within a few million years of forming. Feedback also drives the turbulence that supports gas elsewhere, so it subsumes rather than replaces the earlier explanations.
```

## What the rate depends on

If efficiency is low, what sets it? The empirical answer is the **Kennicutt–Schmidt relation**, one of the most useful scaling laws in extragalactic astronomy.

Maarten Schmidt proposed in 1959 that the star-formation rate per unit area should scale as a power of the gas surface density; Robert Kennicutt established the relation observationally in the 1980s and 1990s across a large sample of galaxies:

$\Sigma_{\text{SFR}} \propto \Sigma_{\text{gas}}^{1.4}$

The super-linear index has a natural interpretation: if star formation proceeds at a fixed fraction of the free-fall rate, then $\Sigma_{\text{SFR}} \propto \Sigma_{\text{gas}}/t_{\text{ff}} \propto \Sigma_{\text{gas}} \times \rho^{1/2} \propto \Sigma_{\text{gas}}^{1.5}$ — close to the measured 1.4. Denser gas forms stars faster simply because gravity acts faster.

Two refinements matter more than the index itself.

**A threshold.** Below a surface density of roughly 10 $M_\odot$ pc⁻², star formation drops off far more steeply than the relation predicts. The outer regions of galactic disks form almost no stars despite containing substantial atomic gas — because at low surface density the gas is unable to become molecular and self-shielded, and because the disk is stable against gravitational fragmentation.

**Molecular gas obeys a nearly linear relation.** When the relation is written in terms of *molecular* rather than total gas, the index drops to approximately 1:

$\Sigma_{\text{SFR}} \propto \Sigma_{\text{H}_2}$

This is the more revealing statement, and its interpretation is clean: **what determines the star-formation rate is how much molecular gas exists, not how it is arranged.** Molecular gas forms stars at a roughly universal rate — one part in about 10⁹ per year, a depletion time near 1–2 Gyr — nearly independent of galaxy type, mass, or epoch. The super-linear total-gas relation then largely reflects the fact that denser regions convert a larger fraction of their gas into molecular form.

The problem therefore splits in two, which is a genuine simplification: **what controls the conversion of atomic gas into molecular gas**, and **what sets the universal molecular depletion time of ~1–2 Gyr**. The first is about shielding, metallicity, and pressure; the second is about feedback.

```checkpoint
q: When the Kennicutt–Schmidt relation is expressed using molecular rather than total gas surface density, the index drops from ~1.4 to ~1. The significance is that
a: molecular gas is more difficult to measure, so the relation is less reliable
x: Molecular gas is measured through CO and dust with well-understood systematics, and the linear relation is found consistently across many galaxies and surveys. The change of index is a physical result, not a measurement artefact.
a*: the star-formation rate is set simply by how much molecular gas is present — molecular gas converts to stars at a roughly universal rate regardless of galaxy type or epoch
a: molecular clouds form stars more efficiently in dense regions than in sparse ones
x: A linear relation says precisely the opposite — the rate per unit molecular gas is constant, so efficiency does *not* rise with density once the gas is already molecular. That density dependence is what disappears when atomic gas is excluded.
a: atomic gas does not participate in star formation at all
x: Atomic gas is the reservoir from which molecular gas forms, so it participates indirectly and essentially. What the linear relation shows is that its role is in supply, not in setting the conversion rate.
hint: A linear relation means a constant ratio. What quantity is being held constant, and what does that say about how much the arrangement of the gas matters?
why: A linear relation means the star-formation rate per unit molecular mass is fixed — a depletion time near 1–2 Gyr, remarkably constant across galaxy types and cosmic time. So the arrangement of molecular gas barely matters; its quantity is what counts. The steeper total-gas index then mostly reflects that denser regions convert a larger fraction of their atomic gas to molecular form, which usefully splits the problem into the physics of that conversion and the physics of the universal depletion time.
---
q: Star formation drops off far more steeply than the Kennicutt–Schmidt relation predicts below a gas surface density of ~10 M☉ pc⁻². The main reason is that at low surface density
a: there is no longer enough gravity to hold gas in the disk at all
x: Gas remains bound to the galaxy at these surface densities — outer disks retain extensive atomic hydrogen, often far beyond the stellar disk. Retention is not the problem; conversion is.
a: the gas has been consumed by earlier generations of stars
x: Outer disks contain plentiful atomic gas that has never formed stars — consumption is not the explanation. What is absent is the molecular phase, not the raw material.
a*: gas cannot become molecular and self-shielded, and the disk becomes stable against gravitational fragmentation
a: cosmic rays destroy the molecules as fast as they form
x: Cosmic rays ionise and drive chemistry inside clouds but do not prevent molecular gas from existing. The obstacle at low column density is ultraviolet photodissociation from outside, which shielding would otherwise block.
hint: Two conditions must be met before gas forms stars: it must reach the molecular phase, and the disk must be unstable enough to fragment. Which fails first in a sparse outer disk?
why: Forming and retaining H₂ requires enough dust column to shield the interior from ultraviolet photodissociation, and low surface density means low column. Separately, a thin low-density disk is gravitationally stable and does not fragment into clouds. Both conditions fail together in outer disks, which is why galaxies show relatively sharp star-formation edges while their atomic gas extends much further out.
```

## Feedback: why energy is the wrong currency

Feedback is the cycle's regulator, and understanding it requires distinguishing two ways a supernova can affect its surroundings — a distinction that resolved a long-standing failure in galaxy simulations.

The mechanisms available to massive stars, in the order they act:

| Mechanism | Timing | Effect |
| --- | --- | --- |
| **Ultraviolet radiation** | Immediate | Ionises and heats gas to 10⁴ K, creating H II regions that expand and disrupt clouds |
| **Radiation pressure** | Immediate | Pushes on dust, which drags the gas |
| **Stellar winds** | Continuous | Mechanical energy comparable to the eventual supernova, delivered over Myr |
| **Supernovae** | After 3–40 Myr | 10⁵¹ erg per event, driving blast waves |

Now the crucial subtlety. A supernova deposits 10⁵¹ erg, which is enormous — sufficient in principle to unbind an entire molecular cloud. Early galaxy simulations injected that energy as heat and found that it did essentially nothing: the gas radiated it away almost immediately. Dense gas cools efficiently, so thermal energy dumped into it is converted into photons and lost within a fraction of the dynamical time. This is the **overcooling problem**, and for years it made simulated galaxies convert far too much of their gas into stars.

The resolution is that the durable currency is not energy but **momentum**. Energy can be radiated away; momentum cannot — it can only be transferred. A supernova remnant expands through an energy-conserving phase, then a pressure-driven snowplough phase during which radiative losses mount, and emerges into a momentum-conserving phase carrying roughly **3 × 10⁵ $M_\odot$ km/s** of radial momentum, essentially independent of the environment's details. That momentum persists and continues to push.

The arithmetic that follows is the chapter's key quantitative result. For a standard initial mass function, roughly **one supernova occurs per 100 solar masses of stars formed**. That single supernova's 3 × 10⁵ $M_\odot$ km/s of momentum can accelerate **3 × 10⁴ solar masses** of gas to 10 km/s — comparable to the velocity dispersion of the interstellar medium and enough to disrupt a cloud or lift gas out of a disk.

So per 100 solar masses of stars formed, feedback can stir or expel of order **300 times** that mass of gas. Star formation is capable of removing its own fuel several hundredfold — which is precisely the magnitude of the missing factor.

This yields **self-regulation**. If star formation runs faster, feedback increases, gas is dispersed and heated, and the rate falls. If it runs slower, feedback weakens, gas cools and settles, and the rate rises. The system sits where the two balance, and because the balance point is set by the ratio of feedback momentum per unit stellar mass to the gas's binding energy, it lands at a similar low efficiency across a wide range of galaxies. **The universality of the depletion time is a consequence of the regulation, not a coincidence.**

```checkpoint
q: Early galaxy simulations that injected supernova energy as heat found it had almost no effect, because the gas
a: was too diffuse for the energy to couple to it at all
x: The gas around supernovae is dense, not diffuse — that is exactly the problem. Dense gas couples to injected energy readily and then disposes of it just as readily.
a*: radiated the thermal energy away almost immediately, since dense gas cools efficiently — the overcooling problem
a: was already moving too fast to be accelerated further
x: Interstellar velocity dispersions are ~10 km/s while supernova blast waves reach thousands, so there is no difficulty in principle with accelerating the gas. The failure was that the energy disappeared before it could do so.
a: absorbed the energy into molecular dissociation rather than motion
x: Dissociating molecules does consume some energy, but it is a minor sink compared with radiative cooling and would not account for the near-total loss the simulations found.
hint: What does dense gas do very well when you heat it? Is the deposited energy still available a dynamical time later?
why: Thermal energy injected into dense gas is converted to photons and escapes on a cooling time much shorter than the dynamical time, so it never does mechanical work. Simulated galaxies consequently converted far too much gas into stars. The fix was recognising that the durable currency is momentum, which cannot be radiated away — only transferred — so a remnant emerging from its radiative phase still carries ~3 × 10⁵ M☉ km/s regardless of how much energy it has lost.
---
q: Roughly one supernova occurs per 100 M☉ of stars formed, delivering ~3 × 10⁵ M☉ km/s of momentum. The significance for the star-formation cycle is that this can accelerate
a: about 100 M☉ of gas to 10 km/s — comparable to the mass of stars formed
x: This underestimates by a factor of 300. Dividing the momentum by the target velocity gives 3 × 10⁴ M☉, not 100 — and the large ratio is precisely what makes feedback capable of regulating the cycle.
a*: about 3 × 10⁴ M☉ of gas to 10 km/s — some 300 times the mass of stars that produced it, enough to disperse the birth cloud
a: only the immediate surroundings of the star, leaving the cloud intact
x: Molecular clouds are typically 10⁴–10⁶ M☉, so moving 3 × 10⁴ M☉ at cloud-dispersing speeds affects a substantial fraction of a cloud, and repeated supernovae from a single association affect all of it.
a: an entire galaxy's worth of gas, which would halt star formation permanently
x: The Galaxy holds ~10¹⁰ M☉ of gas, so one supernova's 3 × 10⁴ M☉ is a minute fraction. Feedback regulates rather than terminates — permanent shutdown would contradict the fact that galaxies form stars steadily over gigayears.
hint: Divide the momentum by the velocity you want to reach, then compare with the 100 M☉ of stars that supplied it.
why: Momentum divided by target velocity gives the mass that can be moved: 3 × 10⁵ / 10 = 3 × 10⁴ M☉ per supernova, against the 100 M☉ of stars that produced it — a mass loading of ~300. Star formation can therefore remove several hundred times its own mass in fuel, which is the same order as the observed inefficiency. That correspondence is why feedback is regarded as the regulator rather than one contributing factor among several.
---
q: The star-formation cycle is described as self-regulating. The mechanism is that
a: gas cools at a fixed rate, setting a constant star-formation rate independent of conditions
x: Cooling rates vary strongly with density and metallicity, and would not by themselves produce the observed constancy of depletion time across very different galaxies. The constancy comes from a feedback loop, not from fixed cooling.
a*: faster star formation produces more feedback, which disperses and heats gas and slows star formation — so the system settles where the two balance
a: the total gas supply is fixed, so star formation must slow as it is consumed
x: Gas supply is not fixed — galaxies accrete continuously from the halo and recycle through the fountain. Depletion would in any case produce a steady decline rather than the stable regulated state observed.
a: massive stars form only when the gas is cold enough, which caps the rate
x: Temperature sets whether gas can collapse but provides no feedback loop: nothing in that statement makes the rate respond to its own value. Regulation requires the output to act back on the input.
hint: A regulator requires the output to feed back on the input with the opposite sign. What does star formation produce that inhibits star formation?
why: Star formation makes massive stars, which ionise, heat and expel gas, which suppresses further star formation — a negative feedback loop. The equilibrium sits where feedback momentum per unit stellar mass balances the gas's binding, and because that ratio varies little across galaxies, the resulting depletion time is nearly universal at 1–2 Gyr. The observed constancy is therefore a consequence of regulation rather than a coincidence needing separate explanation.
```

{{image: Orion Nebula | The Orion Nebula: a cavity carved into a molecular cloud by the ultraviolet radiation of a handful of massive young stars. The glowing gas is cloud material being ionised, heated and driven away by the stars it produced a million years ago — feedback caught in the act, and the reason a cloud converts only a few per cent of itself into stars before ceasing to exist.}}

## Why a few stars do nearly everything

Feedback is delivered almost entirely by **massive stars**, and the reason lies in the **initial mass function** — the distribution of masses with which stars are born, which is heavily weighted toward low masses (roughly $dN/dM \propto M^{-2.35}$ above a solar mass).

For every star above 8 $M_\odot$ — the threshold for core collapse — several hundred lower-mass stars form. Massive stars are numerically negligible. And yet:

- **Ultraviolet output** scales steeply with mass, so a single 30 $M_\odot$ star emits more ionising photons than thousands of solar-type stars combined.
- **Mechanical energy** — winds plus supernova — comes essentially only from them.
- **Heavy-element production** by core collapse, as the Nucleosynthesis chapter established, is theirs alone.
- **Lifetimes** of a few million years mean they deliver all of this promptly, while their birth cloud is still present.

So a population fraction of well under one per cent by number, and a few tens of per cent by mass, does essentially all the ionising, all the stirring, all the cloud destruction, and most of the enrichment. This is the same lesson the Dust and Cosmic Rays chapters delivered in different currencies: **the component that dominates a process is frequently not the one that dominates the census.**

It also means the whole cycle is sensitive to the initial mass function's shape. If the IMF were significantly different — more or fewer massive stars per unit mass formed — feedback strength would shift and the regulated equilibrium would move with it. The IMF appears remarkably universal across the environments where it can be measured, which is fortunate for modelling and remains not fully explained.

```checkpoint
q: Massive stars above 8 M☉ constitute well under 1% of stars by number, yet deliver essentially all of a galaxy's feedback. The reason their short lifetimes make them *more* effective rather than less is that
a: they release their energy in a single event rather than gradually
x: Supernovae are sudden, but massive stars also deliver comparable mechanical energy gradually through winds over millions of years, and ionising radiation continuously from birth. The suddenness is not what matters most.
a*: they deliver their radiation, winds and explosion within a few Myr — while the birth cloud is still present — so the feedback acts on the gas that would otherwise have gone on forming stars
a: they are hotter, so their radiation couples to gas more efficiently
x: Their high temperatures do make them prodigious ultraviolet sources, which matters — but that is a consequence of mass rather than of lifetime, and the question asks specifically why *brevity* helps.
a: their brief lives mean they produce less total energy, which avoids destroying the galaxy
x: Massive stars produce vastly more total energy than low-mass stars despite their brevity. Restraint is not the mechanism, and galaxies are not in danger of being destroyed by their own feedback.
hint: Feedback works by removing the fuel for further star formation. Does it help for that feedback to arrive while the fuel is still there, or long afterwards?
why: Feedback regulates by dispersing the gas that would otherwise keep forming stars, so it must arrive while that gas is still assembled. Massive stars ionise, blow, and explode within a few Myr — before their birth cloud has dispersed on its own — so their output lands directly on the reservoir it needs to disrupt. The same energy released a hundred Myr later into diffuse gas would accomplish far less, which is why the initial mass function's high-mass end governs the whole regulated equilibrium.
---
q: If the initial mass function produced substantially fewer massive stars per unit mass formed, the most direct consequence for a galaxy would be that
a: less gas would be converted into stars, since fewer stars would form overall
x: The IMF describes how a fixed mass of stars is distributed among masses, not how much mass forms. Fewer massive stars per unit mass means more low-mass stars, not less star formation to begin with.
a*: feedback would weaken, so the self-regulating balance would shift toward higher star-formation efficiency and shorter gas depletion times
a: heavy-element enrichment would rise, since low-mass stars live longer and produce more metals
x: This inverts the nucleosynthesis: core-collapse supernovae from massive stars produce the alpha elements and most prompt enrichment, so fewer massive stars means *less* enrichment, more slowly.
a: the star-formation rate would be unchanged, since it is set by the available gas alone
x: The near-linear molecular relation reflects a regulated equilibrium, not a fixed conversion law. Change the feedback strength and the equilibrium moves — which is exactly why the IMF's apparent universality matters for modelling.
hint: The regulated equilibrium sits where feedback balances gravity. What happens to that balance point if feedback per unit stellar mass falls?
why: The cycle settles where feedback momentum per unit stellar mass balances the gas's binding, so weakening the numerator shifts the equilibrium toward more star formation before enough feedback accumulates — raising efficiency and shortening depletion times. That the observed depletion time is near-universal across galaxies therefore depends on the IMF being near-universal too, which appears to hold wherever it can be measured and remains without a full explanation.
```

## Clouds do not last

The picture of clouds as long-lived reservoirs slowly leaking stars has been replaced by one in which they are transient.

Molecular cloud lifetimes are now estimated at **10–30 million years** — only a few free-fall times — with the strongest evidence coming from a technique of some elegance. In nearby galaxies, one can map molecular gas (CO) and recent star formation (H-alpha) at high resolution and ask how well they correlate **as a function of scale**. On galactic scales the two track each other closely, as the Kennicutt–Schmidt relation requires. But on scales of ~100 pc, they **anti-correlate**: individual molecular clouds tend not to sit on top of individual H II regions, and vice versa.

The interpretation is that the two are successive **phases of a rapid cycle** rather than coexisting states. A region is first a molecular cloud, then briefly both, then an H II region with the cloud destroyed, then neither. Because any snapshot catches different regions at different stages, the two tracers appear anti-correlated at the scale of individual regions while correlating in the aggregate. Fitting the de-correlation scale yields the durations, and the answer is that clouds spend only a few million years forming stars before being destroyed.

**Efficiency per cloud** is correspondingly small: a cloud converts a few per cent of its mass into stars before dispersing. Bound star clusters, which require a locally high efficiency, are correspondingly rare — most stars form in associations that disperse into the field within tens of millions of years, which is why the Stellar Populations chapter noted that field stars vastly outnumber cluster members and that chemical tagging must contend with dissolved birth groups.

{{image: Star formation | A star-forming region: dense columns of molecular gas being eroded by radiation from young massive stars nearby. The pillars are what remains of a cloud that is being destroyed by its own offspring — the process that limits a cloud to converting a few per cent of its mass into stars before ceasing to exist, and that keeps galaxies forming stars a hundred times more slowly than gravity alone would allow.}}

## The ecosystem

The cycle does not close within the disk alone, and the accounting shows why.

The Galaxy's molecular gas — 10⁹ $M_\odot$ — divided by the star-formation rate of 1.5 $M_\odot$/yr gives a depletion time of **~700 million years**. Even the total gas reservoir, 10¹⁰ $M_\odot$, lasts only ~7 Gyr. Yet the Milky Way has been forming stars at a comparable rate for far longer than either figure, and its gas fraction is not observed to be collapsing toward zero.

So gas must be **resupplied**, and three flows do the work:

- **Stellar return.** A substantial fraction of the mass that goes into stars comes back — through AGB winds, planetary nebulae, and supernovae — with roughly 30–40% of a stellar population's mass returned over cosmic time, enriched. Only the remainder is locked into long-lived stars and remnants.
- **The galactic fountain.** As the Gas Phases and Halo chapters described, supernova-heated gas vents from the disk, cools at altitude, and rains back as high-velocity clouds — circulating and mixing material rather than losing it.
- **Accretion.** Fresh, relatively unenriched gas arrives from the hot corona and from satellites. This flow is essential and is the resolution of the G-dwarf problem the Stellar Populations chapter described: the disk is an **open** system, continuously fed.

Balanced against these inflows are **outflows**, which for a galaxy of the Milky Way's mass are modest but real. In smaller galaxies, with shallower potential wells, feedback expels gas far more effectively — mass loading rises steeply as galaxy mass falls, which is why dwarf galaxies are so gas-poor and metal-poor relative to their star-formation histories.

The result is often described as the **bathtub model**: a galaxy's gas content is set by the balance of inflow, outflow, and consumption, and it settles into a quasi-equilibrium where the star-formation rate tracks the accretion rate. In that picture a galaxy does not consume a fixed reservoir; it processes a throughput.

The broadest consequence is the one that motivates the whole subject. Across the universe, galaxies have converted only about **20% of their available baryons into stars** — and that peak efficiency occurs in galaxies of roughly the Milky Way's mass. Below it, supernova-driven winds expel gas from shallow potential wells; above it, energy from accreting supermassive black holes prevents gas from cooling. The star-formation cycle is, in the end, not a machine for making stars efficiently. It is a machine for **making stars slowly**, and the fact that galaxies still contain gas after thirteen billion years is the direct evidence.

```checkpoint
q: Maps of nearby galaxies show molecular gas and H II regions correlating on galactic scales but anti-correlating on ~100 pc scales. The standard interpretation is that
a: molecular gas and star formation occur in physically separate parts of the disk
x: They cannot be separate: the aggregate correlation shows star formation happens where the molecular gas is. The puzzle is why they avoid each other at small scales despite tracking each other at large ones.
a*: they are successive phases of a rapid cycle — a region is first a cloud, then briefly both, then an H II region with the cloud destroyed — so any snapshot catches different regions at different stages
a: CO fails to trace molecular gas near hot young stars, creating an artefact
x: CO is indeed dissociated close to strong ultraviolet sources, and this contributes at the margins, but the de-correlation persists in analyses accounting for it and is reproduced in simulations of rapid cloud destruction.
a: H II regions drift away from their birth clouds at high velocity
x: Ionised regions expand but do not travel far from their birthplaces in a few Myr. The separation in the maps is temporal — different evolutionary stages — rather than spatial displacement.
hint: If two tracers mark successive stages of a short-lived sequence, what does a single snapshot of many regions look like?
why: When a region passes rapidly through cloud, then cloud-plus-H II, then H II alone, a snapshot catches different regions at different points, so the two tracers rarely coincide at the scale of one region while still coinciding when averaged over many. Fitting the scale at which correlation breaks down yields the durations directly, and the answer is that clouds spend only a few Myr forming stars before being destroyed — which is why cloud lifetimes are now put at 10–30 Myr rather than gigayears.
---
q: The Milky Way's molecular gas would be exhausted in ~700 Myr at the current star-formation rate, yet the Galaxy has been forming stars steadily for far longer. This requires that
a: the star-formation rate was much lower in the past
x: The Milky Way's star-formation history is reconstructed from stellar ages and was, if anything, higher in the past — which sharpens the problem rather than resolving it.
a*: gas is continuously resupplied — by stellar return, by the galactic fountain, and by accretion of fresh gas from the halo and satellites
a: molecular gas is converted back into atomic gas faster than it forms stars
x: Molecular gas does cycle back to atomic form when clouds are destroyed, but that recycling within the disk cannot create new gas — and the total gas reservoir also has a finite depletion time of ~7 Gyr.
a: the depletion time calculation neglects the mass locked into remnants
x: Remnants and long-lived stars represent mass permanently removed from the gas reservoir, which shortens the depletion time rather than lengthening it. The accounting problem is not eased by including them.
hint: A reservoir with a 700 Myr depletion time cannot sustain 10 Gyr of consumption. What must be happening to the reservoir?
why: A finite reservoir consumed faster than it lasts requires inflow. Stellar return supplies 30–40% of a population's mass back to the medium; the fountain circulates gas through the halo and returns it; and fresh accretion from the corona and satellites adds relatively unenriched material. That last flow is also what resolves the G-dwarf problem, since it keeps metallicity in a narrow band instead of sweeping upward from zero — the same evidence for openness arriving from chemistry and from gas accounting alike.
```

## Pulling the thread

- Free-fall collapse of the Milky Way's molecular gas would give **330 $M_\odot$/yr**; the observed rate is **1.5**. Star formation runs at **~0.5% efficiency per free-fall time**, and molecular depletion times of 1–2 Gyr are near-universal across galaxies and epochs.
- **Magnetic support** proved too weak (clouds are supercritical); **turbulent support** is real but decays and must be driven; **feedback** is the modern answer and subsumes both, since clouds achieve low efficiency by being **destroyed in 10–30 Myr**, not by resisting gravity for gigayears.
- **Kennicutt–Schmidt** gives $\Sigma_{\text{SFR}} \propto \Sigma_{\text{gas}}^{1.4}$, consistent with a fixed fraction of the free-fall rate — but the **molecular** relation is nearly **linear**, meaning the rate is set by *how much* molecular gas exists rather than how it is arranged. A **threshold** near 10 $M_\odot$ pc⁻² marks where shielding and disk instability both fail.
- Feedback's currency is **momentum, not energy**: dense gas radiates injected heat away (the **overcooling problem**), while a remnant emerges carrying ~3 × 10⁵ $M_\odot$ km/s regardless. One supernova per 100 $M_\odot$ of stars can move **3 × 10⁴ $M_\odot$** at 10 km/s — a mass loading of ~300, matching the missing factor.
- The cycle **self-regulates**: more star formation → more feedback → less gas → less star formation. The near-universal depletion time is a *consequence* of that loop.
- Massive stars are **under 1% by number** and do nearly all the ionising, stirring, cloud destruction, and enrichment — the block's recurring lesson that census and influence are different quantities.
- Clouds are **transient**, established by the scale-dependent **de-correlation** of CO and H-alpha, and convert only a few per cent of their mass before dispersing — which is why bound clusters are rare and most stars enter the field.
- The disk's gas would last **700 Myr**, so the system is **open**: stellar return, the **fountain**, and **accretion** resupply it, while outflows remove gas far more effectively from low-mass galaxies. Across the universe, only ~**20%** of baryons have become stars, peaking near the Milky Way's mass.

The transferable idea: **a process that destroys its own input is self-limiting, and its rate is set by that destruction rather than by the input's abundance.** Star formation is not slow because gas is scarce or because gravity is weak; it is slow because making stars is the most effective known way of getting rid of the material that makes stars. Systems with this structure — output that consumes or degrades the conditions for further output — settle into regulated states whose rates depend on the feedback strength rather than on the supply, which is why the depletion time is nearly the same in galaxies with wildly different gas contents. Wherever a rate proves stubbornly insensitive to the abundance of its raw material, the productive question is what the process does to its own preconditions.

## Further reading

{{book: Bruce Draine | Physics of the Interstellar and Intergalactic Medium | 2011}}

{{book: Steven Stahler | The Formation of Stars | 2004}}

{{book: Mark Krumholz | Notes on Star Formation | 2017}}

Beyond the books: Zuckerman and Evans's 1974 note posing the efficiency problem is barely two pages and remains the clearest statement of it; Kennicutt's 1998 review established the scaling relation and is still the standard reference; and the recent literature on scale-dependent CO/H-alpha de-correlation is worth reading for how a cloud lifetime can be extracted from a statistical property of maps.

## Problems

*Useful numbers: G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 pc = 3.086 × 10¹⁶ m; 1 yr = 3.156 × 10⁷ s; m_H = 1.673 × 10⁻²⁷ kg; free-fall time t_ff = √(3π/32Gρ); one supernova per ~100 M☉ of stars formed, delivering ~3 × 10⁵ M☉ km/s.*

**1.** *(The central discrepancy.)* A giant molecular cloud has M = 10⁵ M☉ and R = 15 pc. **(a)** Compute its mean mass density and its number density (take mean molecular mass 2.8 m_H). **(b)** Compute the free-fall time in Myr. **(c)** Applying that timescale to the Galaxy's 10⁹ M☉ of molecular gas, compute the predicted star-formation rate. **(d)** Compare with 1.5 M☉/yr and state the efficiency per free-fall time.

**2.** *(Depletion times.)* **(a)** Compute the depletion time for the Milky Way's molecular gas (10⁹ M☉) at 1.5 M☉/yr. **(b)** Repeat for the total gas reservoir (10¹⁰ M☉). **(c)** Compare both with the Galaxy's age and state what the comparison requires.

**3.** *(Momentum, not energy.)* **(a)** Explain in two sentences why injecting 10⁵¹ erg as heat into dense gas accomplishes little. **(b)** A supernova delivers 3 × 10⁵ M☉ km/s. What mass can it accelerate to 10 km/s? **(c)** Given one supernova per 100 M☉ of stars, compute the mass loading and compare with the efficiency found in problem 1(d).

**4.** *(Reading the index.)* Assume star formation proceeds at a fixed fraction of the free-fall rate, so Σ_SFR ∝ Σ_gas/t_ff. **(a)** Using t_ff ∝ ρ^(−1/2) and taking ρ ∝ Σ_gas, derive the predicted index. **(b)** Compare with the observed 1.4. **(c)** Explain why the molecular version of the relation is nearly linear instead, and what that implies physically.

**5.** *(Who does the work.)* For an initial mass function with dN/dM ∝ M^(−2.35) between 0.1 and 100 M☉: **(a)** explain qualitatively why stars above 8 M☉ are a tiny fraction by number. **(b)** List three distinct effects that come almost exclusively from those stars. **(c)** State why their short lifetimes make the feedback more effective, not less.

**6.** *(Cloud lifetimes from maps.)* CO and H-alpha correlate on kiloparsec scales but anti-correlate at ~100 pc. **(a)** Explain how this is possible without contradiction. **(b)** Explain how the de-correlation scale yields a duration. **(c)** State the resulting cloud lifetime and what it implies for the efficiency mechanism.

**7.** *(The threshold.)* Star formation falls off sharply below Σ_gas ≈ 10 M☉ pc⁻². **(a)** Name the two independent conditions that fail at low surface density. **(b)** Explain why galaxies show sharp star-formation edges while their atomic gas extends much further. **(c)** Predict what would happen to the threshold in a galaxy of much lower metallicity, and why.

**8.** *(The open system.)* **(a)** Name three processes that resupply the disk's gas. **(b)** Explain why outflows remove gas far more effectively from dwarf galaxies than from the Milky Way. **(c)** Relate your answer to the observation that only ~20% of the universe's baryons have become stars, with the peak at Milky Way masses.

**9.** *(Assembling the argument.)* A galaxy is observed with a molecular gas mass of 5 × 10⁹ M☉ and a star-formation rate of 3 M☉/yr. **(a)** Compute its molecular depletion time and compare with the universal value. **(b)** If its gas were instead converted at the free-fall rate for typical cloud densities, what rate would result? **(c)** State what must be true of its feedback for the observed rate to be maintained, and name the observable you would use to test it.

## Worked answers

**1.** **(a)** $R = 15 \times 3.086\times10^{16} = 4.63\times10^{17}$ m; $V = \tfrac{4}{3}\pi R^3 = 4.16\times10^{53}$ m³; $M = 10^{5} \times 1.989\times10^{30} = 1.989\times10^{35}$ kg; $\rho = \mathbf{4.8\times10^{-19}\ kg\,m^{-3}}$. Number density $= \rho/(2.8 m_H) = 4.8\times10^{-19}/(4.68\times10^{-27}) = 1.0\times10^{8}$ m⁻³ $= \mathbf{100\ cm^{-3}}$. **(b)** $t_{\text{ff}} = \sqrt{3\pi/(32G\rho)} = \sqrt{9.42/(32 \times 6.674\times10^{-11} \times 4.8\times10^{-19})} = 9.6\times10^{13}$ s $= \mathbf{3.0\ Myr}$. **(c)** $10^{9}/3.0\times10^{6} = \mathbf{330\ M_\odot/yr}$. **(d)** Against 1.5 observed, the efficiency is $1.5/330 = \mathbf{0.0046}$, or **0.46% per free-fall time**. Two orders of magnitude must be accounted for, and no adjustment to the measured density or to gravitation can supply them.

**2.** **(a)** $10^{9}/1.5 = \mathbf{6.7\times10^{8}\ yr}$. **(b)** $10^{10}/1.5 = \mathbf{6.7\times10^{9}\ yr}$. **(c)** The Galaxy is ~13 Gyr old and has formed stars at a broadly comparable rate throughout, so the molecular reservoir has been consumed roughly twenty times over and even the total reservoir about twice. The system therefore **cannot be closed**: gas must be resupplied by stellar return, by fountain circulation, and by accretion of fresh material from the halo — the same conclusion the G-dwarf problem forces from chemistry, arriving here from mass accounting.

**3.** **(a)** Dense gas cools efficiently, converting injected thermal energy into photons that escape on a timescale much shorter than the dynamical time, so the energy is gone before it can do mechanical work. This is the overcooling problem, and it made early simulated galaxies far too efficient at forming stars. **(b)** $M = p/v = 3\times10^{5}/10 = \mathbf{3\times10^{4}\ M_\odot}$. **(c)** Mass loading $= 3\times10^{4}/100 = \mathbf{300}$ — feedback can disperse about three hundred times the mass of stars that generated it. Compare with problem 1(d): the observed inefficiency is a factor of ~200. The two numbers agree to well within their uncertainties, which is the quantitative core of the case that feedback sets the efficiency.

**4.** **(a)** $\Sigma_{\text{SFR}} \propto \Sigma_{\text{gas}}/t_{\text{ff}} \propto \Sigma_{\text{gas}} \rho^{1/2} \propto \Sigma_{\text{gas}} \times \Sigma_{\text{gas}}^{1/2} = \mathbf{\Sigma_{gas}^{1.5}}$. **(b)** The observed index is 1.4 — close enough that the "fixed fraction of free-fall" picture is a good description, with the small difference attributable to how disk scale height varies with surface density and to the varying molecular fraction. **(c)** In molecular gas the relation is nearly **linear**, meaning the rate per unit molecular mass is constant regardless of density. Physically, once gas is molecular it converts on a roughly universal timescale set by feedback regulation, so the density dependence in the total-gas relation comes mainly from the varying **fraction** of gas that is molecular, not from varying efficiency within the molecular phase.

**5.** **(a)** With $dN/dM \propto M^{-2.35}$, the number per unit mass interval falls steeply, so integrating from 8 to 100 $M_\odot$ yields a tiny count relative to the integral from 0.1 to 8 — well under one per cent of stars by number. **(b)** Ionising ultraviolet output (which scales steeply with mass and creates H II regions); mechanical feedback from winds and supernovae; production of alpha elements and most heavy-element enrichment by core collapse. **(c)** Short lifetimes mean the feedback is delivered **while the birth cloud is still present** — within a few Myr, before the gas has dispersed on its own. Feedback deposited into the cloud that produced the stars is far more effective at halting further star formation than the same energy released a hundred million years later into diffuse gas.

**6.** **(a)** The two statements refer to different scales: averaged over kiloparsecs, star formation occurs where molecular gas is, giving correlation; at the scale of individual regions the tracers mark successive stages of a rapid sequence, so they rarely coincide. **(b)** The scale at which correlation breaks down encodes the ratio of the durations of the phases to the time between independent regions; fitting the de-correlation as a function of aperture size therefore returns the duration of each phase. **(c)** Clouds live **10–30 Myr** and spend only a few Myr actively forming stars before being destroyed. This rules out explanations based on long-term support and establishes that low efficiency arises from rapid destruction — a cloud converts a few per cent of its mass and then ceases to exist.

**7.** **(a)** The gas cannot become **molecular and self-shielded**, since low column density means insufficient dust to block ultraviolet photodissociation; and the disk becomes **gravitationally stable**, so it does not fragment into clouds. **(b)** Atomic hydrogen requires no shielding to persist, so it extends far beyond the radius at which the column drops below what molecule formation and disk instability require — producing a sharp star-formation edge inside a much larger H I disk. **(c)** The threshold should move to **higher surface density** at low metallicity, because less dust per unit gas means less shielding, so a larger column is needed before H₂ can survive. This is observed: metal-poor dwarf galaxies form stars less readily at a given gas surface density, and their star-forming regions are correspondingly more concentrated.

**8.** **(a)** **Stellar return** (AGB winds, planetary nebulae, supernova ejecta returning 30–40% of a population's mass); the **galactic fountain** (hot gas venting, cooling at altitude, and raining back as high-velocity clouds); and **accretion** of relatively unenriched gas from the hot corona and from satellites. **(b)** Dwarf galaxies have **shallower gravitational potential wells** and lower escape velocities, so the same feedback momentum per unit stellar mass ejects a far larger fraction of their gas — mass loading rises steeply as galaxy mass falls. **(c)** Baryon conversion peaks near the Milky Way's mass because that is where both suppression mechanisms are weakest: below it, supernova winds expel gas from shallow wells; above it, energy from accreting supermassive black holes prevents halo gas from cooling. The ~20% peak efficiency is therefore the high point of a curve limited at both ends by different feedback processes.

**9.** **(a)** $5\times10^{9}/3 = \mathbf{1.7\ Gyr}$ — squarely within the universal 1–2 Gyr range, so this galaxy is regulating like a normal star-forming system. **(b)** At $t_{\text{ff}} \approx 3$ Myr, free-fall conversion would give $5\times10^{9}/3\times10^{6} \approx \mathbf{1{,}700\ M_\odot/yr}$, some 550 times the observed rate. **(c)** Its feedback must be removing or stirring of order several hundred times the mass of stars it forms — a mass loading comparable to the ~300 computed for a standard initial mass function, so nothing exotic is required. To test it, measure the **outflow**: blueshifted absorption in interstellar lines against the galaxy's own continuum gives outflow velocity and column, and hence the mass loading directly. Ionised-gas kinematics and the extent of H-alpha emission above the disk plane serve as corroborating observables.$mwSFCycle_master$,
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
