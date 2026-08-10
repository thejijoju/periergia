-- Astronomy & Space · The Extragalactic Universe — The Galaxy Zoo —
-- "Formation & Evolution". Curated master for
-- astronomy-and-space/extragalactic/galaxy-zoo/formation-and-evolution
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The fourth Extragalactic chapter, and the one the previous three keep
-- deferring to. Why halo assembly is the easy half and baryons the hard
-- half; cooling as the condition for a galaxy to exist at all, and the
-- overcooling problem that a purely gravitational theory produces; how
-- gas actually arrives, with the shock-stability argument fixing a
-- critical halo mass near 10^12 Msun and cold streams penetrating hot
-- halos at early times; feedback as the two brackets that make galaxy
-- formation inefficient at every mass except one, with the stellar-mass-
-- halo-mass relation peaking at ~20% of available baryons; the gas
-- regulator that explains the main sequence's 0.3 dex scatter and the
-- mass-metallicity relation from one equilibrium; the cosmic star
-- formation history peaking at z ~ 1.9 nine times above today's rate,
-- and downsizing as an apparent contradiction of hierarchical growth
-- that dissolves once halos and stars are distinguished; mass and
-- environmental quenching as separable effects; and where the models
-- actually stand, including what JWST's impossibly early massive
-- galaxies turned out largely to be. ~10,000 words, multi-question
-- checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/galaxy-zoo/formation-and-evolution',
    'research',
    'advanced',
    'read',
    $egForm_master$> Galaxy formation is not the story of gas falling into a well. Gravity would do that quickly and would produce a universe full of galaxies far more massive, far more numerous, and far more gas-rich than the one observed. The actual subject is a **competition** — between gas arriving and energy driving it out — and its central result is that turning gas into stars is **inefficient at every mass except one**.

Three chapters have now deferred to this one. Galaxy Types explained the two families by whether stars formed from settled gas but left open why the gas settled when it did. The Hubble Sequence showed that the classification tracks angular momentum without saying where the angular momentum came from. Dwarfs showed mass-to-light ratios climbing into the thousands at low mass and attributed it to feedback, which was named rather than explained.

The organising question here is deliberately narrow, because it turns out to carry most of the subject:

> **Why is there a characteristic galaxy mass at all?**

The dark-matter halo mass function has no special scale — it is close to a power law over many decades, with the number of halos rising smoothly toward small masses. Yet galaxies have a strong characteristic scale: the $L^*$ of the Schechter function, the knee where the luminosity function turns over, a stellar mass around $10^{10.5}\,M_\odot$ in a halo around $10^{12}\,M_\odot$. **Something imposes a scale on baryons that is absent from the dark matter.** Identifying what does that is most of what modern galaxy formation theory has established.

## The easy half and the hard half

The framework divides cleanly, and the division is why progress has been so uneven between the two parts.

**Dark matter halos are the easy half.** Dark matter is collisionless and interacts only gravitationally, so its evolution from the initial density fluctuations is a pure gravity problem — solvable, given computing power, to whatever accuracy is wanted. The result is **hierarchical assembly**: small halos collapse first, merge into larger ones, and the halo mass function grows in a way that can be computed to a few per cent. There are no free parameters worth speaking of.

**Baryons are the hard half.** Gas radiates, shocks, forms molecules, forms stars, explodes, emits ionising radiation, launches winds, and feeds black holes that launch far more energetic winds — across a range of scales from the Schwarzschild radius of a black hole to the megaparsec scale of a filament. No simulation resolves that range, so the small-scale physics enters as **sub-grid prescriptions**: parametrised rules, calibrated against observations, standing in for processes that cannot be computed directly.

That asymmetry sets the epistemics of the whole field. **Predictions about dark matter are predictions; statements about baryons are, to a significant degree, calibrated descriptions.** A simulation reproducing the observed galaxy stellar mass function is not thereby confirming its feedback model, because the feedback model was tuned to reproduce it. What such simulations genuinely test is whether the tuned model *also* reproduces things it was not tuned on — which is the standard the good ones are held to, and it is worth knowing which predictions are which when reading any result in this area.

## Cooling: the condition for a galaxy

The founding argument of the modern theory, due to White and Rees in 1978, asks a simple question: gas falling into a halo shock-heats to roughly the virial temperature, so under what conditions can it cool, condense, and form stars?

The comparison is between two timescales.

The **cooling time** is the thermal energy of the gas divided by the rate at which it radiates:

$$t_{\rm cool} \sim \frac{3nkT}{2\,n^2\Lambda(T)} \propto \frac{T}{n\,\Lambda(T)}$$

where $\Lambda(T)$ is the cooling function — the emissivity per unit density squared. The **dynamical time** is roughly how long the gas takes to fall in, of order the halo's crossing time.

- If $t_{\rm cool} < t_{\rm dyn}$, gas cools faster than it can settle, collapses, and forms stars. A galaxy happens.
- If $t_{\rm cool} > t_{\rm dyn}$, the gas sits as a hot, pressure-supported atmosphere. It stays hot.

Two features of $\Lambda(T)$ do the work. Below about $10^4$ K, hydrogen is neutral and there is almost nothing to radiate — cooling collapses. Between $10^4$ and $10^7$ K, atomic line transitions of hydrogen, helium and metals make cooling efficient, with a pronounced peak. Above $10^7$ K, hydrogen and helium are fully ionised, only bremsstrahlung remains, and $\Lambda \propto \sqrt{T}$ — so cooling becomes inefficient relative to the rising thermal energy.

The consequence is an **upper limit to the mass a galaxy can build by cooling alone**, since a sufficiently massive halo has a virial temperature in the bremsstrahlung regime where its gas simply cannot cool within a Hubble time. That was the first explanation ever offered for why galaxies do not come in arbitrarily large sizes, and it remains part of the answer.

But only part, and the shortfall is instructive. **A theory with cooling and gravity alone predicts a universe wildly unlike ours.** It makes far too many stars — most of the baryons in most halos end up locked in stars, against an observed ~20 per cent at the very best. It makes far too many small galaxies, since low-mass halos have short cooling times and are extremely numerous. And it leaves galaxies with too little gas and too much old stellar mass, because nothing prevents the gas from being consumed early.

This is the **overcooling problem**, and its scale is the point: it is not a discrepancy of tens of per cent but of orders of magnitude at both ends of the mass function. **Any correct theory must include something that stops gas from turning into stars**, and that something must be more effective at low mass and at high mass than in the middle.

```checkpoint
q: A theory of galaxy formation with gravity and radiative cooling but no feedback predicts a universe unlike the observed one. Its principal failure is that it
a: produces galaxies that are too diffuse, because cooling gas does not concentrate enough
x: Cooling gas concentrates very effectively — that is the problem. Loss of pressure support means it falls further in, producing systems that are too concentrated, not too diffuse.
a*: converts far too large a fraction of each halo's baryons into stars, over-producing both dwarf galaxies and massive galaxies by orders of magnitude
a: predicts that galaxies should be dark-matter free, since baryons dominate the cooling
x: The dark matter is unaffected by cooling and remains in place regardless; nothing about the argument removes it.
a: cannot form any galaxies at all, because gas shock-heated at the virial radius never cools
x: It cools readily across the range 10⁴–10⁷ K, where atomic line cooling is efficient. Overcooling, not a failure to cool, is the difficulty.
hint: If nothing opposes cooling, what fraction of a halo's gas ends up in stars?
why: Cooling is efficient across the temperature range typical of galaxy-scale halos, so a theory in which nothing opposes it converts most available baryons into stars. Observation says otherwise: even at peak efficiency, near a halo mass of 10¹² M☉, only about 20 per cent of the baryons have become stars, and the fraction falls by one to two orders of magnitude toward both lower and higher halo masses. The discrepancy is not a matter of tuning — it is orders of magnitude at both ends — and it establishes that some energy input must be regulating star formation, more strongly at the extremes than in the middle.
---
q: The cooling function Λ(T) falls as roughly √T above 10⁷ K, where hydrogen and helium are fully ionised. The consequence for galaxy formation is that
a: gas in very massive halos cools so fast that it forms stars almost immediately
x: This inverts the trend. Falling Λ with rising thermal energy means cooling becomes less effective, not more, in the hottest halos.
a*: gas in the most massive halos cannot cool within a Hubble time, setting an upper limit on the mass a galaxy can assemble by cooling alone
a: metals are destroyed above 10⁷ K, removing the dominant coolant
x: Metals are ionised further, not destroyed, and they still contribute; the dominant change is that hydrogen and helium lose their line transitions, leaving bremsstrahlung.
a: the gas becomes optically thick, trapping the radiation it emits
x: Hot halo gas is extremely diffuse and optically thin at these temperatures. Radiation escapes freely; the limitation is the emission rate, not trapping.
hint: Above full ionisation, which emission process is left, and how does it scale?
why: Below 10⁷ K, bound electrons supply line transitions and cooling is efficient, peaking sharply. Above it, hydrogen and helium are fully stripped and only bremsstrahlung remains, with Λ ∝ √T — so cooling luminosity rises far more slowly than the thermal energy that must be radiated away. The cooling time therefore lengthens with halo mass, and beyond a threshold it exceeds the age of the universe. This was the first explanation offered for why galaxies have a maximum size, and it survives as part of the answer — though only part, since AGN feedback is needed to keep massive galaxies quiescent against the cooling that does occur in their dense cores.
```

## How gas actually gets in

The picture of gas shock-heating at the virial radius and then cooling from a hot atmosphere turns out to describe only part of what happens, and specifically the wrong part for the epoch when most stars formed.

The refinement comes from asking whether the accretion shock is **stable**. A shock at the virial radius can only persist if the shocked gas radiates away its energy more slowly than it is compressed — otherwise the post-shock gas cools promptly, pressure support fails, and the shock cannot hold itself up at large radius. Applying that stability criterion gives a **critical halo mass** near $10^{11.7}$–$10^{12}\,M_\odot$, and it separates two regimes:

**Cold mode.** Below the critical mass, no stable virial shock forms. Gas flows in along filaments and reaches the central galaxy at temperatures of order $10^4$ K, having never been heated to the virial temperature. It arrives cold and ready to form stars, and it arrives *fast* — on roughly a free-fall time rather than a cooling time.

**Hot mode.** Above the critical mass, a stable shock forms and gas is heated to the virial temperature, building a hot halo. Star formation is then fed only by whatever cools out of that atmosphere, which is slow and can be shut off entirely by a modest energy input.

Two things make this more than a technical refinement.

First, the critical mass **coincides with the mass at which galaxies change character** — the transition from blue star-forming disks to red quiescent spheroids, and the $L^*$ knee of the luminosity function. A shock-stability calculation from gas physics lands on the same scale as the observed bimodality, which is a substantial and non-obvious success.

Second, at high redshift **cold streams penetrate hot halos**. Filamentary inflow is dense and narrow, so it can remain unshocked while threading a halo whose spherically averaged gas is hot — meaning that even massive halos at early times can be fed cold gas directly. This is a large part of why star formation rates at $z \sim 2$ are so much higher than anything local: not that galaxies were more efficient, but that the supply line was open in a way it no longer is.

Notice the shape of the argument. The question "why do galaxies change character at $10^{12}\,M_\odot$?" received an answer from the **stability of a shock**, which is neither a statement about dark matter nor about stars. Scales in nature often come from the point where one physical regime hands over to another, and finding them means looking at the transitions rather than at either regime.

```checkpoint
q: Below a critical halo mass of roughly 10¹² M☉, accreting gas is not shock-heated to the virial temperature. The reason is that
a: the gas is moving too slowly to shock, since infall velocities in small halos are subsonic
x: Infall is comfortably supersonic with respect to the cold infalling gas even in small halos; the issue is not whether a shock can form but whether it can be sustained.
a*: a virial shock can only be sustained if the shocked gas radiates more slowly than it is compressed, and in low-mass halos it cools promptly, so pressure support fails and no stable shock holds at large radius
a: low-mass halos contain too little gas for a shock front to develop
x: Gas mass scales with halo mass at roughly the cosmic fraction, so low-mass halos are not gas-poor in the relevant sense, and shock formation does not depend on a total gas mass threshold.
a: dark matter in low-mass halos absorbs the kinetic energy of the infalling gas
x: Dark matter is collisionless and cannot absorb the gas's thermal or kinetic energy; the two components exchange energy only gravitationally, and far too slowly to matter here.
hint: A shock needs to hold itself up. What happens to the pressure behind it if the gas radiates quickly?
why: A standing accretion shock is supported by the pressure of the gas behind it. If that gas cools faster than compression can resupply its energy, the pressure collapses and the shock cannot be maintained at the virial radius — so gas flows in along filaments at ~10⁴ K, never heated. Above the critical mass the cooling time is long enough for the shock to persist, a hot halo builds, and star formation is fed only by slow cooling from it. The stability calculation lands near 10¹¹·⁷–10¹² M☉, which is also where galaxies observationally change from blue and star-forming to red and quiescent — an independent physical argument arriving at the observed scale.
---
q: Star formation rates at z ≈ 2 were far higher than in comparable galaxies today. The dominant reason is that
a: the initial mass function was different, producing more massive luminous stars per unit gas
x: A varying IMF is debated and would change the inferred rates somewhat, but it is not the accepted explanation, and the increase is measured across independent tracers.
a*: the gas supply line was open — cold filamentary streams could penetrate even hot halos and deliver fuel directly, at rates far above what cooling from a hot atmosphere allows today
a: star formation was intrinsically more efficient per unit gas mass, converting gas to stars faster
x: The efficiency per unit molecular gas is broadly similar; the difference is in how much gas the galaxies had and how fast it was replenished, not in the conversion rate.
a: galaxies were smaller, so their gas was at higher density and collapsed sooner
x: High-redshift star-forming galaxies are more compact and gas-rich, but this describes a consequence of the higher supply rate rather than its cause.
hint: Star formation needs fuel. What determines how fast fuel arrives?
why: A galaxy's star formation rate is set primarily by its gas supply rather than by any change in the physics of converting gas to stars. At high redshift, dense narrow filaments could stay unshocked while crossing a halo whose spherically averaged gas was hot, delivering cold fuel straight to the centre at close to the free-fall rate. As the universe expanded and halos grew, those streams were disrupted and the supply fell to whatever could cool out of a hot atmosphere — slow, and easily shut off by feedback. The cosmic star formation history's rise and fall is largely a history of the supply line rather than of the engine.
```

{{image: Hubble Ultra-Deep Field | The Hubble Ultra-Deep Field: several thousand galaxies in a patch of sky about a tenth the width of the full Moon, most of them seen when the universe was a fraction of its present age. Fields like this supply the raw census — how many galaxies of each mass exist at each epoch — that any formation theory has to reproduce, and they are the evidence that star formation peaked long ago and has been declining ever since.}}

## Feedback: the two brackets

Now the central result. Compare the **stellar mass** of galaxies with the **halo mass** they occupy — which can be done statistically by abundance matching, ranking observed galaxies by stellar mass and simulated halos by halo mass and matching them in order — and a strikingly simple shape emerges.

Define efficiency as the fraction of a halo's available baryons that ended up as stars. With the cosmic baryon fraction $\Omega_b/\Omega_m \approx 0.157$, a halo of mass $M_h$ has about $0.157\,M_h$ of baryons to work with. Then:

| Halo mass | $M_*/M_h$ | Efficiency |
| --- | --- | --- |
| $10^{10}\,M_\odot$ | ~0.0006 | **~0.4%** |
| $10^{12}\,M_\odot$ | ~0.03 | **~20%** |
| $10^{14}\,M_\odot$ | ~0.005 | **~3%** |

**Galaxy formation is inefficient everywhere, and catastrophically inefficient away from $10^{12}\,M_\odot$.** The peak is not gentle: efficiency falls by a factor of fifty toward dwarf halos and by nearly an order of magnitude toward cluster halos. That single curve is the quantitative form of the question this chapter opened with, and the answer is that **two different mechanisms bracket the peak, one operating from below and one from above.**

### The low-mass bracket: stellar feedback

In low-mass halos, the energy from supernovae, stellar winds and ionising radiation is comparable to or greater than the binding energy of the gas. The relevant quantity is the **mass loading factor** $\eta$, the ratio of gas mass driven out of the galaxy to gas mass converted into stars:

$$\eta = \frac{\dot{M}_{\rm out}}{\dot{M}_*}$$

Since what matters is whether the injected energy can lift gas out of the potential, $\eta$ rises steeply as the potential shallows — reaching values of ten or more in dwarfs, meaning ten solar masses of gas expelled for every solar mass turned into stars, against values below one in massive disks. The result is exactly the observed collapse of efficiency at low mass, and it simultaneously explains the extreme mass-to-light ratios of the previous chapter: the dark matter cannot be expelled, so removing the baryons raises $M/L$ directly.

### The high-mass bracket: AGN feedback

Supernovae fail at the top end. In a halo of $10^{13}$–$10^{14}\,M_\odot$, the binding energy of the gas exceeds what a galaxy's entire stellar population can supply over its lifetime. Something far more energetic is required, and the accretion of gas onto a **supermassive black hole** is the only available candidate: it liberates of order 10 per cent of the rest-mass energy of what it swallows, against 0.1 per cent for hydrogen fusion — a hundredfold advantage per unit mass — and the black hole needs to consume only a small fraction of the galaxy's gas to unbind the rest.

That the numbers work out at all is a genuinely surprising fact, and it is the reason black holes moved from a curiosity of the Active Galaxies branch to a required component of galaxy formation. The mechanisms — radiative winds at high accretion rates, and mechanical jets inflating cavities in hot cluster gas at low ones — are the subject of the AGN and Jets chapters, which this argument hands off to.

**The essential point is structural.** These two mechanisms are unrelated in physics, operate on different scales, and were discovered independently. They happen to bracket the same mass. The characteristic scale of galaxies is therefore not a scale in the dark matter and not a scale in the gas — it is **the mass where both feedback channels are simultaneously weakest**, which is a much stranger kind of explanation than one might expect and is, as far as anyone can tell, correct.

```checkpoint
q: Star formation efficiency peaks near a halo mass of 10¹² M☉ and falls off toward both lower and higher masses. This shape requires
a: a single feedback mechanism whose strength happens to be minimised at 10¹² M☉
x: No single mechanism is known with that behaviour, and none is expected — feedback processes scale monotonically with potential depth or accretion rate rather than turning over.
a*: two distinct suppression mechanisms — stellar feedback dominating in shallow potentials and black-hole feedback dominating in deep ones — whose combined effect is weakest in between
a: that dark matter halos of 10¹² M☉ contain a higher baryon fraction than other halos
x: All halos begin with roughly the cosmic baryon fraction. The differences arise from how much of it is retained and converted, not from how much arrives.
a: that gas cooling is most efficient at the virial temperature corresponding to 10¹² M☉
x: The cooling function peaks well below that temperature, and cooling efficiency alone would not produce a peak in *star formation efficiency* — it is precisely what overcooling shows is insufficient.
hint: What is strong in a shallow potential, and what is strong in a deep one?
why: In a shallow potential, supernova energy per unit stellar mass exceeds the gas binding energy, so mass loading rises steeply and most baryons are expelled — efficiency ~0.4 per cent at 10¹⁰ M☉. In a deep potential, supernovae are hopelessly outmatched, but accretion onto a supermassive black hole liberates ~10 per cent of rest-mass energy, a hundred times the yield of fusion, and can unbind or keep hot the surrounding gas — efficiency ~3 per cent at 10¹⁴ M☉. Neither operates strongly near 10¹² M☉, where efficiency peaks at ~20 per cent. The characteristic mass of galaxies is thus a coincidence of two unrelated mechanisms both being weak in the same place — a stranger explanation than one would design, and the one the evidence supports.
---
q: Supernova feedback cannot regulate the most massive galaxies. The quantitative reason is that
a: massive galaxies contain too few massive stars to produce supernovae
x: Massive galaxies formed enormous stellar populations and hosted correspondingly many supernovae; the shortfall is in energy relative to binding, not in supernova counts.
a*: the binding energy of the gas in a 10¹³–10¹⁴ M☉ halo exceeds the total energy the galaxy's stars can supply over their lifetimes, whereas black-hole accretion liberates ~10% of rest mass against fusion's ~0.1%
a: supernova ejecta in massive galaxies are trapped by magnetic fields
x: Magnetic fields shape and channel outflows, but no magnetic mechanism supplies the missing factor of hundreds in available energy.
a: massive galaxies have already used all their gas, leaving nothing for supernovae to expel
x: Massive halos retain large hot gas reservoirs — the intracluster medium is the extreme case — so the problem is that the gas is there and must be kept from cooling, not that it is absent.
hint: Compare the energy available per unit mass consumed in fusion with that available in accretion.
why: Binding energy scales steeply with halo mass, so a cluster-scale halo requires far more energy to unbind or keep hot than a galaxy's supernovae can deliver, even integrating over its whole star-forming history. Accretion onto a black hole is the only process with the necessary yield: it converts of order 10 per cent of infalling rest mass into radiation and kinetic output, roughly a hundred times fusion's 0.1 per cent, so a black hole that swallows a small fraction of a galaxy's gas can act on all of it. This is why supermassive black holes are not a curiosity appended to galaxy formation but a required component of it — the argument that connects this chapter to the Active Galaxies branch.
```

## The regulator, and why galaxies are so alike

Once inflow, star formation and outflow are all present, a further and initially surprising fact needs explaining: **star-forming galaxies are extremely similar to one another.**

The **star-forming main sequence** is the relation between star formation rate and stellar mass among galaxies still forming stars. Its scatter is about **0.3 dex** — a factor of two — over four decades of stellar mass, and it persists over at least the last ten billion years with its normalisation falling but its tightness maintained. A relation that tight is not what one would expect from objects with wildly varied merger histories, environments and gas supplies.

The explanation is the **gas-regulator** or **bathtub** model, and it is worth setting out because a great deal follows from very little.

Track the galaxy's cold gas reservoir. Gas flows in at rate $\dot{M}_{\rm in}$. It is consumed into stars at rate $\dot{M}_*$. It is expelled at rate $\eta \dot{M}_*$, proportional to the star formation rate because winds are driven by the stars themselves. Some is returned by dying stars, a fraction $R$. So

$$\frac{dM_{\rm gas}}{dt} = \dot{M}_{\rm in} - \dot{M}_*(1 + \eta - R)$$

Now the key step. Star formation rate rises with gas mass, so the system is **self-correcting**: too much gas raises the star formation rate, which consumes and expels gas until balance returns; too little lowers it, letting inflow rebuild the reservoir. The reservoir therefore settles to whatever level makes the terms cancel, and

$$\dot{M}_* \approx \frac{\dot{M}_{\rm in}}{1 + \eta - R}$$

**A galaxy's star formation rate is set by its inflow rate, not by how much gas it currently holds.** The gas reservoir is a buffer that adjusts, not a fuel tank that empties.

Three consequences follow immediately, and each was an independent puzzle before.

**The main sequence is tight** because inflow rate is governed by halo mass and cosmic time — smooth, slowly varying quantities — while the messy internal details are absorbed by the reservoir's adjustment. Scatter reflects fluctuations in supply, not variation in physics.

**The mass–metallicity relation follows.** In equilibrium, the metallicity of the gas approaches

$$Z \approx \frac{y}{1 + \eta}$$

with $y$ the stellar yield of metals per unit mass locked into stars. Since $\eta$ falls with increasing galaxy mass, $Z$ rises with mass — which is the observed relation, obtained without any additional assumption. Numerically, with $y \approx 0.02$: a dwarf with $\eta = 10$ reaches $Z \approx 0.0018$, about a tenth solar, while a massive disk with $\eta = 0.5$ reaches $Z \approx 0.013$, near solar. **The mass–metallicity relation is the mass–mass-loading relation in disguise.**

**The G-dwarf problem dissolves.** The Chemical Enrichment chapter showed that a closed box predicts far more metal-poor stars than the Milky Way contains. In a regulator, the gas metallicity reaches its equilibrium value early and stays there while stars keep forming — so most stars form at similar, near-equilibrium metallicity, and the predicted excess of metal-poor stars never appears. The classical fix, continuous infall of pristine gas, is exactly this model seen from the chemical side.

One model, three results that had been separate problems. That is the signature of having found the right level of description: **the correct abstraction makes several unrelated puzzles into one puzzle.**

```checkpoint
q: In the gas-regulator model, a galaxy's star formation rate is set by its inflow rate rather than by its current gas mass. The reason the system self-corrects is that
a: inflow rate rises when the gas reservoir is depleted, refilling it
x: Inflow is set externally, by halo growth and cosmic conditions, and does not respond to the galaxy's internal gas content.
a*: star formation rate rises with gas mass, so a surplus is consumed and expelled faster while a deficit is consumed more slowly — driving the reservoir to the level at which consumption balances supply
a: outflows shut off when gas is scarce, conserving the remaining supply
x: Outflow is proportional to star formation rate, so it does fall when gas is scarce — but this is part of the same negative feedback rather than a separate switch, and alone it would not fix the reservoir's level.
a: the halo's potential well adjusts to the amount of gas present
x: The potential is dominated by dark matter and is unaffected by the modest baryonic mass in the reservoir.
hint: What happens to the consumption rate if the reservoir is temporarily overfull?
why: The reservoir sits in a negative feedback loop. Because star formation rate increases with gas mass, extra gas is burned and blown out faster than it arrived, and a shortfall is burned more slowly than inflow replenishes it. The equilibrium level is the one where consumption plus outflow equals inflow, giving SFR ≈ inflow/(1 + η − R). This is why the main sequence is tight to 0.3 dex despite galaxies having wildly different merger and environmental histories: those histories perturb the reservoir, which absorbs them, while the star formation rate tracks the smoothly varying inflow.
---
q: The equilibrium metallicity of a regulated galaxy is approximately Z ≈ y/(1 + η), with y the metal yield and η the mass loading. This single expression explains
a: why all galaxies have the same metallicity, since y is a constant of stellar physics
x: The expression gives the same metallicity only at fixed η, and η varies by more than an order of magnitude across the galaxy mass range — which is precisely what makes it explanatory.
a*: the mass–metallicity relation, since η falls with galaxy mass — making the observed trend a restatement of how mass loading depends on potential depth
a: the fact that metallicity is independent of star formation rate
x: The observed relation shows a residual dependence on star formation rate at fixed mass, which regulator models reproduce through departures from strict equilibrium; independence is neither predicted nor observed.
a: why the most massive galaxies are metal-poor, having expelled their metals
x: Massive galaxies are the most metal-rich, precisely because their deep potentials retain metals — low η, high Z.
hint: Which term in the expression depends on the galaxy, and how does it vary with mass?
why: The yield y is set by stellar nucleosynthesis and is roughly universal, so all the variation comes from η, which measures how much gas is expelled per unit of stars formed and falls steeply as the potential deepens. With y ≈ 0.02, a dwarf with η = 10 sits near a tenth solar metallicity while a massive disk with η = 0.5 sits near solar — reproducing the observed relation with no extra ingredient. The mass–metallicity relation is therefore not an independent fact about galaxies but the mass–mass-loading relation viewed chemically, which is why it appears alongside the tight main sequence and the resolution of the G-dwarf problem in the same one-equation model.
```

{{image: Illustris project | A slice through a cosmological hydrodynamic simulation, showing gas structured into filaments, sheets and knots with galaxies forming where they intersect. Simulations of this kind compute dark matter's gravity essentially exactly, but must represent star formation, supernova winds and black-hole feedback as calibrated sub-grid rules — which is why reproducing the observed galaxy mass function is a check on consistency rather than a prediction, and why the interesting tests are the quantities that were not tuned.}}

## The history of star formation, and downsizing

Measure the star formation rate per unit volume across cosmic time and a clear shape appears.

The **cosmic star formation history** rises from early times, peaks at $z \approx 1.9$ — about 3.5 billion years after the Big Bang — and declines afterwards, with an exponential timescale near 3.9 Gyr. The peak rate is about **nine times** today's. Half of all the stellar mass now in existence formed before $z = 1.3$, roughly nine billion years ago.

Two readings of that curve matter.

**The universe is winding down, and has been for ten billion years.** Present-day star formation is a residue. The dominant reason is supply: halos grow more slowly as expansion accelerates, cold streams are disrupted as halos exceed the shock-stability mass, and the gas that remains is increasingly locked in hot atmospheres that feedback prevents from cooling.

**Cosmic noon is where the subject lives.** The epoch around $z \approx 2$ is when most stars formed, so it is where the physics is being tested — and it is far enough away that the observations are hard, which is a substantial part of why the field's uncertainties are where they are.

### Downsizing, and why it is not a contradiction

Now an apparent paradox that dominated the subject for two decades.

**Downsizing** is the observation that the most massive galaxies formed their stars **earliest and fastest**, while low-mass galaxies have formed stars over a prolonged period and many are still forming them now. Massive ellipticals are uniformly old with high alpha-element ratios indicating short formation timescales; dwarf irregulars are still going.

This looks like the exact opposite of hierarchical assembly, in which small things form first and merge into large ones — and it was widely presented as a crisis for the theory.

It is not one, and the resolution turns on a distinction this chapter has been building toward: **hierarchical assembly is a statement about dark-matter halos; downsizing is a statement about stars.** The two decouple because star formation efficiency depends on halo mass and epoch.

Massive halos collapse first *in the densest regions* — the rare high peaks of the initial density field, which are the first to exceed the collapse threshold. There the gas supply is copious, cold streams are efficient, and star formation proceeds rapidly. Once the halo grows past the shock-stability mass and its black hole becomes capable of heating the atmosphere, star formation shuts down and the galaxy passively reddens, ageing without further growth in stars even as the halo keeps accreting.

Small halos, meanwhile, form stars slowly and inefficiently throughout, because supernova feedback keeps ejecting their gas — which returns, forms a few more stars, and is ejected again. Their star formation is drawn out precisely because it is inefficient.

So the same feedback that produces the efficiency peak also produces downsizing: **massive galaxies form early and are shut off; small galaxies never get going properly and therefore never stop.** What looked like a contradiction of hierarchical growth is a consequence of hierarchical growth plus mass-dependent feedback.

The methodological lesson is worth keeping. **The apparent contradiction came from applying a statement about one component to observations of another.** Hierarchical assembly was never a claim about when stars form. Whenever a theory seems flatly contradicted by data, it is worth checking whether the theory's claim and the observation's subject are actually the same quantity — a surprising fraction of the time they are not.

```checkpoint
q: Massive galaxies formed their stars earlier and faster than low-mass galaxies — "downsizing" — while hierarchical assembly says small structures form first. The resolution is that
a: hierarchical assembly is incorrect and has been superseded by a monolithic collapse picture
x: Hierarchical assembly is strongly confirmed by halo clustering, merger rates, and the growth of large-scale structure. Nothing in downsizing challenges it once the two claims are properly compared.
a*: hierarchical assembly describes dark-matter halos while downsizing describes stars, and the two decouple because star formation efficiency and quenching both depend on halo mass and epoch
a: massive galaxies formed from a different population of dark matter that collapsed earlier
x: There is one dark-matter population. What differs is where in the density field a halo sits, not what it is made of.
a: the ages of massive galaxies have been overestimated by stellar population models
x: Ages are supported by independent evidence, notably the alpha-element enhancement that indicates short formation timescales. The observation is robust; it is the inferred contradiction that is not.
hint: Which component does each statement describe — and does either claim to describe the other?
why: The two statements are about different things. Massive halos form first in the rarest, densest peaks of the initial density field, where gas supply is abundant, so their galaxies build stars rapidly and early; once the halo passes the shock-stability mass and its black hole can heat the halo gas, star formation shuts off and the galaxy simply ages. Low-mass halos form stars slowly throughout, because supernova feedback repeatedly ejects gas that later returns — inefficient, and therefore prolonged. Downsizing in stars and hierarchy in halos are consistent, and the same mass-dependent feedback produces both. The general caution: check that a theory's claim and an observation's subject refer to the same quantity before declaring a contradiction.
---
q: The cosmic star formation rate density peaked at z ≈ 1.9 and has since fallen by roughly a factor of nine. The principal cause of the decline is
a: exhaustion of hydrogen in the universe, which has largely been converted into stars
x: Only a small fraction of cosmic baryons are in stars; most hydrogen remains in the intergalactic medium. There is no shortage of raw material, only of delivery.
a*: a decline in the supply of cold gas to galaxies — halo growth slows, cold streams are disrupted as halos exceed the shock-stability mass, and remaining gas sits in hot atmospheres kept from cooling by feedback
a: the expansion of the universe stretching molecular clouds until they cannot collapse
x: Bound structures decouple from cosmic expansion entirely; a molecular cloud is unaffected by the expansion of the universe.
a: an increase in metallicity that makes gas too opaque to collapse
x: Metals enhance cooling and if anything aid collapse; the metallicity trend works the wrong way for this explanation.
hint: Star formation needs cold gas delivered. Which of the delivery steps has changed since z = 2?
why: The decline is a supply problem, not a fuel problem. Most baryons still sit in the intergalactic medium — as the Intergalactic Medium chapter takes up — but the routes by which they reach galaxies have progressively closed: halo accretion rates fall as expansion accelerates, halos grow past the mass at which stable virial shocks form so infalling gas is heated rather than delivered cold, and the resulting hot atmospheres are kept hot by AGN feedback. The exponential decline with a ~3.9 Gyr timescale is the signature of a delivery system shutting down rather than a tank running dry.
```

## Quenching, and where the models stand

The last piece is how a galaxy stops. The observational result that organises it comes from large surveys: the probability that a galaxy is quenched depends on two variables — its **stellar mass** and its **environment** — and, remarkably, these two act **independently**. The efficiency of mass quenching is essentially unchanged across environments, and the efficiency of environmental quenching is essentially unchanged across masses, at least out to $z \sim 1$.

That separability is a strong constraint, because it means two distinct families of process are at work rather than one:

- **Mass quenching** acts on **central** galaxies through internal processes — AGN feedback above all, plus the shift to hot-mode accretion and the stabilisation of gas disks against fragmentation in massive bulge-dominated systems.
- **Environmental quenching** acts on **satellite** galaxies through the external processes the Galaxy Types and Dwarfs chapters established: ram-pressure stripping, strangulation, harassment.

The empirical picture is thus that a galaxy can be shut down from the inside if it is massive enough, or from the outside if it falls into something bigger — and which one happened is legible in the resulting population statistics.

### How well is any of this known?

Two modelling traditions carry the field. **Semi-analytic models** track halo merger trees and apply analytic prescriptions for gas physics — fast, so they explore parameter space, but every process is a formula. **Hydrodynamic simulations** solve the gas equations directly on a grid or with particles — far more faithful, but still requiring sub-grid rules wherever the resolution runs out, which for star formation and black-hole accretion is always.

Both reproduce the observed galaxy population well. Both were calibrated to do so. The honest statement of the field's position is:

- **Robust**: hierarchical halo assembly; the necessity of feedback and its approximate energy budgets; the qualitative division of labour between stellar and AGN feedback; the regulator picture and the relations it explains.
- **Calibrated, not derived**: the mass loading factor's dependence on galaxy properties; the efficiency and coupling of AGN feedback; the small-scale physics of star formation.
- **Genuinely open**: how winds are actually launched and what fraction of expelled gas returns; how black holes grow and couple to their hosts; whether the quenching of massive galaxies is maintained by the same mechanism that initiated it.

### The JWST episode

A useful live example of how this plays out. Early JWST observations found apparently massive galaxies at $z \sim 5$–9, in numbers and at masses that strained what the standard model could produce so soon after the Big Bang. Headlines announced a crisis in cosmology.

The resolution has been substantially prosaic and is worth knowing in outline, because it is a good model of how such claims usually resolve. A large part of the apparent excess came from **overestimated stellar masses**. Two effects dominated: many of the most extreme objects turned out to be compact **active galactic nuclei** — the "little red dots" — whose light is powered by accretion rather than by stars, so fitting a stellar population to it inflates the inferred mass; and strong **emission lines** falling in the broad photometric bands were being absorbed into the fitted stellar continuum, again inflating masses. Longer-wavelength imaging with MIRI, which measures the continuum where those lines do not dominate, substantially suppressed the overestimates.

What survives is real and interesting: galaxies at early times are more numerous and more luminous than pre-launch models expected, which points to more efficient early star formation or a less dust-obscured early universe. But this is a correction to the baryon physics, not to the cosmology — and the distinction between "our feedback calibration is wrong at early times" and "the standard cosmological model has failed" is exactly the distinction the two-halves structure of this chapter predicts will matter.

## Pulling the thread

- Halo assembly is a **pure gravity problem** and is computed to per-cent accuracy; baryon physics enters simulations as **calibrated sub-grid rules**. So predictions about dark matter are predictions, while statements about galaxies are largely tuned descriptions — and the meaningful tests are quantities the tuning did not target.
- **Cooling** determines whether a halo can make a galaxy at all, and the fall of $\Lambda(T)$ above $10^7$ K sets an upper mass limit. But cooling plus gravity produces the **overcooling problem** — orders of magnitude too many stars at both ends of the mass function.
- Gas arrives in two modes, separated by the **stability of the virial shock** at a critical halo mass near $10^{12}\,M_\odot$: **cold mode** delivering unshocked filamentary gas below it, **hot mode** above. **Cold streams penetrating hot halos** at high redshift are much of why star formation was so vigorous at cosmic noon.
- Star formation efficiency **peaks near 20 per cent at $10^{12}\,M_\odot$** and collapses to ~0.4% at $10^{10}$ and ~3% at $10^{14}$. **Stellar feedback brackets from below** (mass loading $\eta \gtrsim 10$ in dwarfs), **AGN feedback from above** (accretion yielding ~10% of rest mass against fusion's 0.1%). The characteristic galaxy mass is where **both are weakest**.
- The **gas regulator** gives $\dot M_* \approx \dot M_{\rm in}/(1+\eta-R)$: star formation tracks *supply*, not reservoir. One equation delivers the **0.3 dex main sequence**, the **mass–metallicity relation** as $Z \approx y/(1+\eta)$, and the dissolution of the **G-dwarf problem**.
- Star formation peaked at $z \approx 1.9$, **nine times** today's rate, declining exponentially with a ~3.9 Gyr timescale, with half of today's stellar mass in place by $z = 1.3$. **Downsizing** is not anti-hierarchical: hierarchy describes halos, downsizing describes stars, and mass-dependent feedback decouples them.
- Quenching splits into **mass quenching** of centrals and **environmental quenching** of satellites, which act **independently** — evidence that two distinct families of process are operating.

The transferable idea: **when a system has no characteristic scale but its output does, the scale is being imposed by whatever limits the process at both ends.** The dark-matter halo mass function is nearly featureless; the galaxy mass function has a pronounced knee. That knee is not a property of gravity, or of gas, or of stars — it is the residue of two unrelated suppression mechanisms failing to reach the middle. The general move is worth having: faced with a distribution that peaks where nothing obvious happens, stop looking for a cause at the peak and start looking for two causes at the edges. Most characteristic scales in complex systems are made this way — not by something that selects the middle, but by things that eliminate the extremes.

## Further reading

{{book: Houjun Mo | Galaxy Formation and Evolution | 2010}}

{{book: Malcolm Longair | Galaxy Formation | 2008}}

{{book: John Peacock | Cosmological Physics | 1999}}

Beyond the books: White and Rees' 1978 paper is short and worth reading as the moment the two-component framework was stated; almost everything since is elaboration of its structure. Madau and Dickinson's 2014 review is the standard compilation of the cosmic star formation history and is unusually clear about which measurements carry the uncertainty. And the abundance-matching literature is worth seeing directly, because the efficiency curve is the single most compressed statement of what galaxy formation theory has to explain.

## Problems

*Useful numbers: cosmic baryon fraction Ω_b/Ω_m ≈ 0.157; peak M*/M_h ≈ 0.03 at M_h ≈ 10¹² M☉; M*/M_h ≈ 6 × 10⁻⁴ at 10¹⁰ M☉ and ≈ 5 × 10⁻³ at 10¹⁴ M☉; metal yield y ≈ 0.02; Z☉ ≈ 0.0142; regulator SFR ≈ Ṁ_in/(1 + η − R); equilibrium Z ≈ y/(1+η); cosmic SFR density ψ(z) ≈ 0.015(1+z)^2.7 / [1 + ((1+z)/2.9)^5.6] M☉ yr⁻¹ Mpc⁻³; fusion converts ~0.1% of rest mass, accretion ~10%.*

**1.** *(The two halves.)* **(a)** Explain why dark-matter halo assembly can be computed essentially exactly while galaxy formation cannot. **(b)** State what follows for how a simulation's agreement with the galaxy stellar mass function should be interpreted. **(c)** Give one example of a result from such a simulation that *would* count as a genuine test.

**2.** *(Overcooling.)* **(a)** Write the comparison of timescales that decides whether a halo forms a galaxy. **(b)** State what a theory with gravity and cooling alone predicts for the fraction of baryons converted to stars, and contrast with observation. **(c)** State the constraint this places on any additional physics.

**3.** *(Efficiency.)* Using the table values: **(a)** compute the stellar mass and the efficiency relative to available baryons for halos of 10¹⁰, 10¹², and 10¹⁴ M☉. **(b)** State which mechanism suppresses each end. **(c)** Explain why the *shape* of this curve, rather than its normalisation, is the key evidence.

**4.** *(The shock.)* **(a)** State the stability criterion that separates cold-mode from hot-mode accretion. **(b)** Explain why the resulting critical mass being ~10¹² M☉ is significant. **(c)** Explain how cold streams can feed a halo whose average gas is hot, and why this matters at z ≈ 2.

**5.** *(The regulator.)* **(a)** Write the gas reservoir equation and derive the equilibrium star formation rate. **(b)** Explain, in terms of negative feedback, why the reservoir settles. **(c)** Use the result to explain the main sequence's 0.3 dex scatter.

**6.** *(Metallicity from mass loading.)* Using $Z \approx y/(1+\eta)$ with $y = 0.02$: **(a)** compute $Z$ and $Z/Z_\odot$ for $\eta = 0.5$ and $\eta = 10$. **(b)** Identify which galaxy type each corresponds to. **(c)** State what observed relation this reproduces, and what it implies about that relation's true content.

**7.** *(Cosmic history.)* Using the $\psi(z)$ fit: **(a)** evaluate the ratio of the peak star formation rate density to today's. **(b)** State the two physical reasons for the decline. **(c)** Explain why $z \approx 2$ is where the subject's uncertainties concentrate.

**8.** *(Downsizing.)* **(a)** State the observation. **(b)** State why it appears to contradict hierarchical assembly. **(c)** Give the resolution, and state the general methodological lesson.

**9.** *(Reading a crisis.)* Early JWST results reported galaxies too massive to exist so early. **(a)** Name the two effects that inflated the inferred stellar masses. **(b)** Explain how longer-wavelength imaging addresses them. **(c)** Explain why the surviving discrepancy is a problem for baryon physics rather than for cosmology, referring to the chapter's two-halves structure.

## Worked answers

**1.** **(a)** Dark matter is **collisionless and interacts only gravitationally**, so its evolution from given initial conditions is a pure N-body gravity problem with no free parameters — solvable to whatever accuracy computing power allows. Baryons radiate, shock, form molecules and stars, explode, ionise, launch winds, and feed black holes, over a range of scales from a black hole's Schwarzschild radius to megaparsec filaments. No simulation resolves that range, so the unresolved physics enters as **parametrised sub-grid prescriptions calibrated against observations**. **(b)** Agreement with the stellar mass function is a **consistency check, not a confirmation**, because the feedback parameters were tuned to produce that agreement. It demonstrates that the model *can* be made to fit, not that its physics is right. **(c)** A prediction of something not used in the calibration — for instance, the **spatial clustering of galaxies as a function of stellar mass**, the internal structure and angular momentum of simulated disks, the properties of the circumgalactic medium in absorption, or the evolution of the mass function at redshifts outside the calibration range. Any of these can fail while the tuned quantity still matches.

**2.** **(a)** Compare the **cooling time** $t_{\rm cool} \propto T/(n\Lambda(T))$ with the **dynamical time** $t_{\rm dyn}$. If $t_{\rm cool} < t_{\rm dyn}$, gas cools faster than it settles, condenses, and forms stars; if $t_{\rm cool} > t_{\rm dyn}$, it remains a hot pressure-supported atmosphere. **(b)** With nothing opposing cooling, **most of each halo's baryons are converted into stars** — order unity efficiency across a wide mass range, plus a large excess of small galaxies since low-mass halos are numerous and cool quickly. Observation gives at most **~20 per cent**, at one particular halo mass, falling to well under one per cent in dwarfs. The mismatch is **orders of magnitude at both ends**. **(c)** Any correct theory must include a process that **removes gas or prevents it from cooling**, and — crucially — that process must be **more effective at both low and high halo mass than in the middle**, since that is the shape of the observed deviation. A single mechanism scaling monotonically with mass cannot do it.

**3.** **(a)** Available baryons are $0.157 M_h$.
- $M_h = 10^{10}$: $M_* = 6\times10^{-4}\times10^{10} = 6\times10^{6}\,M_\odot$; baryons $= 1.57\times10^{9}$; efficiency $= 6\times10^6/1.57\times10^9 = \mathbf{0.4\%}$.
- $M_h = 10^{12}$: $M_* = 0.03\times10^{12} = 3\times10^{10}\,M_\odot$; baryons $= 1.57\times10^{11}$; efficiency $= \mathbf{19\%}$.
- $M_h = 10^{14}$: $M_* = 5\times10^{-3}\times10^{14} = 5\times10^{11}\,M_\odot$; baryons $= 1.57\times10^{13}$; efficiency $= \mathbf{3.2\%}$.

**(b)** The low-mass end is suppressed by **stellar feedback** — supernovae, winds and ionising radiation in a shallow potential, with mass loading $\eta \gtrsim 10$. The high-mass end is suppressed by **AGN feedback**, since supernovae cannot supply the binding energy of a cluster-scale halo. **(c)** Because a normalisation could be matched by tuning a single mechanism's strength, but the **non-monotonic shape — a peak with steep falls on both sides — cannot**, since feedback processes scale monotonically with potential depth or accretion rate. The turnover is therefore direct evidence that **two distinct mechanisms** are involved, which is a structural conclusion no amount of parameter adjustment can supply.

**4.** **(a)** A standing virial shock survives only if the **shocked gas radiates its energy more slowly than compression resupplies it** — equivalently, if the post-shock cooling time exceeds the compression time. Where cooling wins, pressure support behind the shock collapses and no stable shock is maintained at the virial radius. **(b)** Because the resulting critical mass, near $10^{11.7}$–$10^{12}\,M_\odot$, **coincides with the observed transition in galaxy properties** — the shift from blue star-forming disks to red quiescent spheroids, and the $L^*$ knee of the luminosity function. A calculation from gas thermodynamics, involving neither stars nor dark matter directly, lands on the scale the observations single out, which is strong evidence the mechanism is relevant. **(c)** A filament is **dense and narrow**, so its cooling time is short even where the halo's spherically averaged gas is hot and shocked; it can therefore thread the hot atmosphere without being disrupted, delivering $\sim10^4$ K gas straight to the centre. At $z\approx2$ this matters because it keeps the supply line open for massive halos that would otherwise be fed only by slow cooling — which is much of why star formation rates at cosmic noon exceed anything local.

**5.** **(a)** $dM_{\rm gas}/dt = \dot M_{\rm in} - \dot M_*(1 + \eta - R)$, with $\eta$ the mass loading and $R$ the fraction of stellar mass returned by dying stars. Setting $dM_{\rm gas}/dt = 0$ gives $\boxed{\dot M_* \approx \dot M_{\rm in}/(1 + \eta - R)}$ — star formation rate set by **inflow**, not by the reservoir's size. **(b)** Star formation rate is an increasing function of gas mass, so a surplus in the reservoir raises the consumption and outflow terms until they exceed inflow and draw the reservoir back down; a deficit lowers them until inflow rebuilds it. The reservoir is therefore an **adjusting buffer** sitting in a negative feedback loop, not a fuel tank that empties. **(c)** Because the star formation rate then tracks $\dot M_{\rm in}$, which is governed by halo mass and cosmic time — smooth, slowly varying quantities that vary little between galaxies of the same mass at the same epoch. All the messy individual history (mergers, bursts, local environment) perturbs the *reservoir*, which absorbs it. The observed **0.3 dex scatter** is therefore residual variation in supply rate, and the main sequence's tightness is evidence that galaxies are supply-limited rather than reservoir-limited.

**6.** **(a)** $\eta = 0.5$: $Z = 0.02/1.5 = \mathbf{0.013}$, i.e. $Z/Z_\odot = 0.013/0.0142 = \mathbf{0.94}$ — essentially solar. $\eta = 10$: $Z = 0.02/11 = \mathbf{0.0018}$, i.e. $Z/Z_\odot = \mathbf{0.13}$ — about a tenth solar. **(b)** $\eta = 0.5$ corresponds to a **massive disk galaxy** with a deep potential retaining most of its metals; $\eta = 10$ to a **dwarf**, expelling ten solar masses of enriched gas per solar mass of stars formed. **(c)** It reproduces the **mass–metallicity relation**. What it implies about that relation is that it is not an independent property of galaxies but a **restatement of how mass loading varies with potential depth** — the yield $y$ being set by stellar nucleosynthesis and essentially universal, all the variation in $Z$ comes from $\eta$. The mass–metallicity relation is the mass–mass-loading relation seen chemically.

**7.** **(a)** $\psi(0) = 0.015 \times 1/(1+(1/2.9)^{5.6}) \approx 0.015$. At $z = 1.9$: $(2.9)^{2.7} = 17.7$ and $((2.9)/2.9)^{5.6} = 1$, so $\psi = 0.015 \times 17.7/2 = 0.133$. Ratio $= 0.133/0.015 \approx \mathbf{9}$. **(b)** First, **halo accretion rates fall** as cosmic expansion accelerates, reducing the supply of new material. Second, **the delivery mechanism degrades**: halos grow past the shock-stability mass so infalling gas is heated rather than delivered cold, cold streams are disrupted, and the resulting hot atmospheres are kept from cooling by AGN feedback. Note this is a **supply** decline, not fuel exhaustion — most cosmic baryons remain in the intergalactic medium. **(c)** Because **most stars formed then**, so it is the epoch any theory must reproduce — yet at $z\approx2$ galaxies are faint, small in angular size, heavily dust-obscured, and observed in rest-frame ultraviolet by optical instruments. The measurements that matter most are therefore the ones made under the worst conditions, which is why the field's uncertainties concentrate there and why infrared capability has been the decisive instrumental advance.

**8.** **(a)** The most **massive galaxies formed their stars earliest and over the shortest interval** — uniformly old populations with alpha-element enhancement indicating rapid formation — while **low-mass galaxies formed stars over a prolonged period**, many still forming them. **(b)** Because hierarchical assembly has small structures collapsing first and merging into larger ones, so naively the largest galaxies should be the *youngest*, having been assembled most recently. **(c)** **Hierarchy describes halos; downsizing describes stars**, and mass-dependent feedback decouples them. Massive halos form first in the rarest, densest peaks of the initial density field, where gas supply is copious and star formation rapid; once such a halo exceeds the shock-stability mass and its black hole can heat the halo gas, star formation shuts off and the galaxy ages passively while the halo keeps growing. Low-mass halos form stars slowly and inefficiently throughout, because feedback repeatedly ejects gas that later returns — prolonged *because* inefficient. The lesson: **before declaring a theory contradicted, check that its claim and the observation refer to the same quantity.** Here one is about dark matter and the other about stars, and the "contradiction" was a category error.

**9.** **(a)** First, many of the most extreme objects are **compact active galactic nuclei** — the "little red dots" — whose light is powered by accretion, so fitting a stellar population to it attributes an accretion luminosity to stars and inflates the mass. Second, **strong nebular emission lines** falling within broad photometric filters were absorbed into the fitted stellar continuum, again inflating the inferred stellar mass. **(b)** Longer-wavelength imaging — MIRI — samples the rest-frame near-infrared, where the **stellar continuum dominates** and the strong optical emission lines no longer fall in the measured bands. The mass then rests on light that genuinely traces the old stellar population, and the overestimates are largely suppressed. **(c)** Because the surviving result is that **early galaxies are more numerous and luminous than pre-launch models predicted**, which is a statement about how efficiently early gas turned into stars and how much dust obscured it — that is, about the **calibrated half** of the framework. Cosmology governs the abundance and growth of halos, which is the computed half and is not in question. The chapter's structure predicts exactly this: when observations and models disagree about galaxies, the sub-grid baryon physics is by far the more likely location of the error, and a claim of cosmological failure requires first showing that no adjustment to the tuned half can accommodate the data.$egForm_master$,
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
