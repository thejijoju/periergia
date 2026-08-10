-- Astronomy & Space · The Extragalactic Universe — The Galaxy Zoo —
-- "Mergers". Curated master for
-- astronomy-and-space/extragalactic/galaxy-zoo/mergers
-- @ research/advanced/read. Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Node already exists in seed.sql; no taxonomy change rides with this file.
--
-- The fifth Extragalactic chapter and the Galaxy Zoo block's capstone: the
-- one process that changes what kind of galaxy a galaxy is. Everything
-- follows from one asymmetry - stars are collisionless and pass through
-- each other, gas is collisional and shocks - so a merger is
-- simultaneously a collisionless dynamical event and a violently
-- collisional gas event, and the two halves produce different halves of
-- the outcome. Toomre & Toomre's 1972 restricted three-body models and
-- why a minimal model settled the question; dynamical friction with its
-- 1/M scaling deciding whether a merger happens at all, and why cluster
-- cores are the wrong place for it; the major/minor and wet/dry
-- two-by-two; tidal torques funnelling gas inward to make ULIRGs and the
-- merger-starburst-AGN sequence; the red nugget problem and the virial
-- scaling showing minor mergers grow size as M^2 against a major
-- merger's M, which is exactly the factor observations require; the Milky
-- Way's own Gaia-Enceladus event and Sagittarius mid-disruption; and
-- merger rates with the honest position on our own future.
-- ~10,000 words, multi-question checkpoints at every key learning.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/extragalactic/galaxy-zoo/mergers',
    'research',
    'advanced',
    'read',
    $egMerge_master$> A merger is the only process that changes what kind of galaxy a galaxy is. Everything else — gas stripping, quenching, secular bar-building — alters a galaxy's colour, gas content or central structure while leaving its basic architecture intact. Only a merger can take two disks and produce a spheroid. And the whole of what a merger does follows from a single asymmetry already met several times in this branch: **stars cannot collide, and gas cannot avoid it.**

That asymmetry means a galaxy collision is really two events happening in the same volume at the same time.

**For the stars, it is a purely gravitational, collisionless event.** No star hits another. What changes is the *potential* they move in — violently, on the timescale of the encounter — and stellar orbits are rearranged by that changing potential rather than by contact.

**For the gas, it is a genuinely collisional event.** Clouds ram into clouds at hundreds of kilometres per second, shock, radiate, and lose energy. Gas can therefore do the one thing stars cannot: **dissipate**, and so sink.

Almost every result in this chapter is one of those two halves. The structural outcome — the destruction of disks, the tidal tails, the de Vaucouleurs profile of the remnant — comes from the collisionless half. The spectacular outcome — the starburst, the infrared luminosity, the feeding of the black hole — comes from the collisional half. Keeping them separate makes an otherwise sprawling subject tractable.

## Galaxies collide; their stars do not

It is worth establishing the collisionless claim quantitatively, because the imagery of "colliding galaxies" invites exactly the wrong picture.

In the solar neighbourhood, the typical separation between stars is about 1 parsec, roughly $3 \times 10^{16}$ m. The Sun's radius is about $7 \times 10^8$ m. **Stars are separated by some forty million times their own size.** Scaling that down: if stars were tennis balls, their neighbours would be several thousand kilometres away.

The mean free path for an actual stellar collision, even at the elevated densities of a merging galactic nucleus, exceeds the size of a galaxy by many orders of magnitude. Over the whole course of a major merger involving hundreds of billions of stars, the expected number of physical stellar collisions is, for practical purposes, zero.

So when two galaxies pass through one another, **the stars simply interpenetrate**. Nothing hits anything. What each star experiences is a gravitational field that changes rapidly and unpredictably as the two mass distributions sweep past each other — and that turns out to be quite sufficient to destroy a disk.

The mechanism is **violent relaxation**, met in the Orbits chapter: in a potential that varies rapidly in time, a star's energy is not conserved, because energy conservation requires a static potential. Stars are scattered in energy, ordered rotation is converted into random motion, and the system relaxes to a new equilibrium — a dispersion-supported spheroid — on roughly a few crossing times, which is a few hundred million years rather than the many billions of years a collisional relaxation would require.

**Violent relaxation is the reason a merger remnant is an elliptical rather than a hot disk.** And because stars cannot dissipate, the process is one-way: once scrambled, they stay scrambled.

The gas does the opposite. Gas clouds are enormous compared with stars and fill a meaningful fraction of the volume, so when two gas disks interpenetrate at several hundred kilometres per second, the gas genuinely collides. It shocks, radiates away the collision energy, and — having lost energy while retaining far less angular momentum than it started with, for reasons the next sections develop — falls inward.

```checkpoint
q: Two galaxies pass through one another. What happens to their stars?
a: A substantial fraction collide, and the collisions convert the galaxies' kinetic energy into heat and radiation
x: Stars are separated by roughly forty million times their own diameters, so the expected number of physical collisions across an entire major merger is effectively zero.
a*: Essentially none collide — they interpenetrate freely, and what rearranges their orbits is the rapidly changing gravitational potential rather than any contact
a: They are deflected by close gravitational encounters with individual stars from the other galaxy
x: Two-body encounters between individual stars are far too rare and too weak to matter on merger timescales; the relevant interaction is with the smooth, time-varying potential of the whole system.
a: They are unaffected, since gravity from the other galaxy cancels out across the disk
x: Nothing cancels — the other galaxy's field is strongly non-uniform across a disk, which is precisely what produces tidal tails and what scrambles orbits.
hint: Compare the separation between stars with the size of a star.
why: With ~1 pc between stars and stellar radii of ~10⁹ m, stars are separated by some forty million times their own size, and the mean free path for a physical collision vastly exceeds a galaxy. So the stars interpenetrate untouched. What changes their orbits is violent relaxation: in a potential varying rapidly in time, stellar energy is not conserved, so ordered rotation is scattered into random motion over a few crossing times. This is why a major merger remnant is a dispersion-supported spheroid — and, since stars cannot dissipate, why the transformation runs only one way.
---
q: Gas in a galaxy merger behaves completely differently from the stars because
a: gas is much less massive, so it responds more strongly to the changing potential
x: Response to a gravitational field is independent of the responding object's mass; a low-mass tracer and a high-mass one follow the same trajectory.
a*: gas clouds are large enough to actually collide, so the gas shocks, radiates away energy, and can therefore sink — the one thing collisionless stars can never do
a: gas is ionised, so magnetic fields dominate its motion during the encounter
x: Magnetic fields shape gas dynamics in detail but are not what distinguishes the gas's merger behaviour; dissipation through shocks and radiation is.
a: gas is concentrated in the disk plane while stars fill the whole volume
x: Both stellar and gaseous disks are flattened, and in a spiral the stars are more extended than the cold gas rather than less.
hint: What can a system do only if its components can collide?
why: Gas clouds fill a meaningful fraction of a galaxy's volume, so two interpenetrating gas disks genuinely collide at hundreds of km/s. The gas shocks, converts bulk motion into heat, and radiates the heat away — losing energy while its angular momentum is separately removed by tidal torques. Losing energy is what allows infall, so gas sinks to the centre and forms stars there in a burst. Stars, being collisionless, cannot shed energy at all, so they stay on whatever orbits violent relaxation left them. This single split is why the structural outcome of a merger and its luminous outcome are governed by different physics.
```

## The tidal signature

The most recognisable thing about an interacting pair is what juts out of it: enormous thin tails of stars and gas, sometimes hundreds of thousands of light-years long, and bridges of material running between the two galaxies.

Their origin was settled in **1972** by Alar and Juri Toomre, in a calculation whose economy is part of its interest. They used the **restricted three-body approximation**: two point masses for the galaxy centres, and massless test particles arranged in disks around them, each particle responding to the two point masses but not to each other. That is a drastic simplification — no self-gravity in the disks, no gas, no dark matter, no live response of either galaxy — and it was run on hardware feebler than a modern phone.

It reproduced the observed tails and bridges in detail, including specific systems.

The mechanism is **tidal**, in the strict sense. The companion's gravitational pull is stronger on the near side of a disk than on its centre, and weaker on the far side than on the centre. In the frame of the disk's centre, that differential is an outward stretch along the line joining the galaxies: near-side material is pulled toward the companion, forming a **bridge**, and far-side material is left behind, forming a **tail**. The tail is not thrown outward; it is material whose inward pull was reduced.

Two refinements matter and neither is obvious.

**Tails are long because the interaction is resonant.** The most spectacular tails come from **prograde** encounters, where the companion orbits in the same sense as the disk rotates. Then a given piece of the disk stays on the same side of the perturber for an extended period, so the tidal tug is applied coherently in one direction rather than averaging away. **Retrograde** encounters, where the companion sweeps past against the disk's rotation, produce far weaker features because each disk element feels the pull first one way then the other. This is a resonance argument: what matters is not the strength of the perturbation but how long it stays in phase with the thing it is perturbing.

**Tails are thin and long-lived because they are collisionless.** Once launched, tail material simply follows ballistic orbits, so the structure persists for a billion years or more — long enough that tails serve as a clock. The length and the degree to which a tail has fallen back constrain how long ago the encounter happened, which is how interaction ages are estimated.

There is a methodological point worth taking from the 1972 result. A model with no gas, no dark matter, no self-gravity and no realistic disk structure got the answer right — because tidal tails depend on essentially none of those things. **Knowing which physics a phenomenon does not depend on is as valuable as knowing which it does**, and a minimal model that reproduces an observation is stronger evidence about the mechanism than an elaborate one, precisely because it has fewer places to hide a fudge.

```checkpoint
q: Toomre & Toomre's 1972 restricted three-body models reproduced tidal tails using two point masses and massless test particles — no gas, no dark matter, no disk self-gravity. The right conclusion is that
a: the simulations were too crude to be trusted and were superseded once real physics was included
x: Later, fuller simulations confirmed rather than overturned them. The tails are reproduced because they genuinely do not depend on the omitted physics.
a*: tidal tails depend on essentially none of the omitted physics, and a minimal model that reproduces an observation is stronger evidence about the mechanism than an elaborate one
a: dark matter does not exist in the outer parts of galaxies, or the model could not have worked
x: The model works because tail formation is insensitive to the halo's detailed distribution over the encounter, not because the halo is absent — and abundant independent evidence establishes that it is present.
a: gas plays no role in galaxy mergers
x: Gas dominates the *luminous* outcome — the starburst, the infrared output, the black-hole fuelling. It just is not what makes the tails.
hint: What does it tell you when you can delete an ingredient and still get the answer?
why: The tails arise from differential gravity across a disk during a close passage — the near side pulled toward the companion, the far side left behind — which needs only the two masses and the geometry. Reproducing them without gas, self-gravity, or a live halo demonstrates that none of those is causally required. This is why a minimal model carries more evidential weight than a complex one: an elaborate simulation with many tuned components can match an observation for the wrong reasons, whereas a stripped model that matches has almost nowhere to hide an error.
---
q: The most spectacular tidal tails come from prograde encounters, where the companion orbits in the same sense as the disk rotates. The reason is that
a: prograde encounters bring the galaxies physically closer, increasing the tidal force
x: The closest approach distance is set by the orbit, not by its sense relative to the disk's spin; prograde and retrograde encounters can have identical pericentres.
a*: disk material stays in phase with the perturber for an extended period, so the tidal tug is applied coherently in one direction instead of averaging out
a: prograde encounters last longer in total, giving the tide more time to act
x: Encounter duration is set by the orbit and is the same either way. What differs is how much of that duration the perturbation stays in phase.
a: retrograde encounters cancel the disk's angular momentum, preventing material from escaping
x: Retrograde encounters do remove angular momentum from disk material, but the weakness of their tails comes from the incoherence of the forcing rather than from any prevention of escape.
hint: Think about a swing: what matters is not how hard you push but when.
why: A prograde companion moves with the disk's rotation, so a given piece of disk remains on the same side of the perturber for many times longer than it otherwise would, and the tidal pull accumulates in one direction. In a retrograde encounter the same piece sweeps past the perturber quickly and feels the tug first one way then the other, so the net displacement largely cancels. This is a resonance: the effectiveness of a perturbation depends on how long it stays in phase with what it is perturbing, not simply on its amplitude — the same principle behind orbital resonances in the Solar System and the driving of spiral structure.
```

{{image: Mice Galaxies | NGC 4676, the Mice: two spirals shortly after a close prograde passage, each trailing a long straight tidal tail. The tails are stars and gas whose inward pull was reduced as the companion swept by, not material thrown outward — and because tail stars are collisionless they follow ballistic orbits for a billion years or more, which turns the tails into a clock for dating the encounter.}}

## Whether a merger happens at all

Two galaxies passing near each other do not necessarily merge. They can fly apart, leaving only tidal damage. What decides is whether the encounter removes enough orbital energy for the pair to become bound and then to spiral together — and the mechanism that removes it is **dynamical friction**.

The picture, due to Chandrasekhar, is this. A massive body moving through a sea of lighter particles — stars, dark matter — deflects them, and they pile up **behind** it in an overdense wake. The wake pulls backward on the body that created it. The body is therefore decelerated by its own gravitational disturbance, transferring orbital energy into the random motions of the background.

For a satellite of mass $M_s$ on a circular orbit at radius $r$ in a host with circular velocity $v_c$, the sinking time is approximately

$$t_{\rm df} \approx \frac{1.17}{\ln\Lambda}\,\frac{r^2 v_c}{G M_s}$$

with $\ln\Lambda$ the Coulomb logarithm, of order a few. The essential feature is the **inverse dependence on satellite mass**, and its consequences are stark. Taking $v_c = 220$ km/s and $\ln\Lambda = 3$, a satellite at 50 kpc sinks in:

| Satellite mass | Sinking time |
| --- | --- |
| $10^{11}\,M_\odot$ | ~0.5 Gyr |
| $10^{10}\,M_\odot$ | ~5 Gyr |
| $10^{8}\,M_\odot$ | ~500 Gyr |

**Massive companions merge promptly; small ones effectively never do.** A $10^8\,M_\odot$ dwarf at 50 kpc has a sinking time thirty-five times the age of the universe — it will orbit indefinitely unless something else disrupts it. This is why the satellites we see are dominated by low masses: the massive ones were absorbed long ago, and the survivors are the ones dynamical friction cannot reach. It also explains why the Large Magellanic Cloud, at over $10^{11}\,M_\odot$, is understood to be on its **first infall** — a companion that massive could not have been orbiting for long without already having sunk.

### Why cluster cores are the wrong place for merging

Dynamical friction also resolves a puzzle raised twice already in this branch: mergers are **less** common in the dense cores of galaxy clusters than in loose groups, even though clusters are where galaxies are most crowded.

The reason is that friction and capture both depend on how long the encounter lasts, and hence on relative velocity. In a cluster core, galaxies move at ~1,000 km/s, roughly five times a galaxy's internal stellar velocity dispersion. Two galaxies pass through one another in far less than an internal dynamical time — an **impulsive** encounter, over before the stars can respond coherently.

The energy transferred in such a fast encounter scales as roughly $1/v_{\rm rel}^2$. Going from a group's ~300 km/s to a cluster's ~1,000 km/s reduces the heating per encounter by about a factor of eleven, and — more decisively — leaves the pair still unbound afterwards. They fly apart with tidal damage but no capture.

In **groups**, relative velocities of a few hundred kilometres per second are comparable to internal dispersions. The encounter is slow, dynamical friction has time to act, orbital energy is genuinely removed, and the pair becomes bound and merges.

So the most massive ellipticals were assembled in **groups**, at intermediate density, and later fell into clusters as finished objects. The morphology–density relation's cluster half is produced by gas stripping and harassment, as earlier chapters established; its merger half happens somewhere else entirely. **The densest environment is not the most interactive one, because interaction requires not just proximity but time.**

```checkpoint
q: A dwarf galaxy of 10⁸ M☉ orbiting at 50 kpc has a dynamical friction sinking time of roughly 500 Gyr, while a 10¹¹ M☉ companion at the same radius sinks in about 0.5 Gyr. The reason for this enormous difference is that
a: the smaller satellite orbits faster, spending less time in the dense inner regions
x: At a given radius in a given potential, orbital speed is set by the enclosed mass, not by the satellite's own mass; both orbit at essentially the same speed.
a*: the drag comes from the satellite's own gravitationally induced wake, whose strength scales with satellite mass — so the deceleration per unit mass rises with mass, and the sinking time scales as 1/M_s
a: the smaller satellite is tidally disrupted before it can sink
x: Disruption is a separate fate that may indeed occur, but the 500 Gyr figure is the friction timescale itself, computed for an intact satellite — the scaling is what the question is about.
a: dark matter in the host halo shields low-mass satellites from friction
x: The halo's particles are precisely what the satellite is dragging against; more background material means more friction, not shielding.
hint: What creates the drag, and what sets its strength?
why: A massive body deflects the stars and dark matter it moves through, which pile up in an overdense wake behind it; that wake pulls back on the body. The wake's mass — and so the drag force — grows with the satellite's own mass, giving t_df ∝ r²v_c/(GM_s). The 1/M_s scaling means a factor of 1000 in mass is a factor of 1000 in sinking time. Massive companions are therefore absorbed promptly while small ones orbit essentially forever, which is why surviving satellite populations are dominated by low masses and why the LMC, at over 10¹¹ M☉, must be on its first infall.
---
q: Galaxy mergers are less common in dense cluster cores than in loose groups, despite clusters being where galaxies are most crowded. The explanation is that
a: cluster galaxies have already merged, so few candidates remain
x: Cluster cores contain large numbers of intact galaxies of all types, so there is no shortage of candidates.
a*: relative velocities in cluster cores are several times the galaxies' internal dispersions, so encounters are impulsive — too fast to transfer enough energy for capture — while group velocities are comparable to internal dispersions and permit binding
a: the intracluster medium's pressure holds galaxies apart
x: The intracluster medium strips gas from galaxies but exerts no force capable of preventing their gravitational capture; it acts on gas, not on stellar systems as wholes.
a: cluster galaxies are mostly ellipticals, which cannot merge with each other
x: Ellipticals merge readily — dry mergers are how the most massive ones grow. Morphology does not prevent merging.
hint: Capture needs energy to be removed. What determines how much an encounter removes?
why: Merging requires the encounter to remove enough orbital energy for the pair to become bound, and the energy transferred falls steeply with relative velocity — roughly as 1/v²_rel for a fast passage. At a cluster core's ~1,000 km/s, five times a galaxy's internal dispersion, the two systems interpenetrate before their stars can respond coherently and separate again still unbound, leaving tidal damage but no capture. At a group's ~300 km/s the encounter is slow enough for dynamical friction to act and the pair merges. Hence the most massive ellipticals assembled in groups and arrived in clusters already built: proximity is not interaction, because interaction also takes time.
```

## The two-by-two: major and minor, wet and dry

Mergers are classified along two independent axes, and the four combinations do genuinely different things — which is why lumping them together as "mergers" obscures more than it reveals.

**Mass ratio.** A **major** merger has a mass ratio above roughly 1:4; a **minor** merger below roughly 1:10, with an ambiguous band between. This matters because the perturbation a companion delivers scales with its mass: a major merger destroys both disks, while a minor merger is absorbed with the primary's disk thickened and heated but surviving.

**Gas content.** A **wet** merger involves gas-rich progenitors; a **dry** merger involves gas-poor ones. This matters because gas is the only component that can dissipate, so it determines whether anything luminous happens and whether a new disk can be built afterwards.

| | **Wet (gas-rich)** | **Dry (gas-poor)** |
| --- | --- | --- |
| **Major** | Disks destroyed; nuclear starburst; ULIRG; black hole fed; remnant elliptical, possibly with a rebuilt disk | Disks destroyed; no starburst; remnant a boxy, slowly rotating giant elliptical |
| **Minor** | Disk survives but thickens; gas delivered to the centre; modest starburst, possible bar or pseudobulge | Disk thickens; stars deposited in the outer envelope; **size grows faster than mass** |

The Galaxy Types chapter's distinction between **disky** and **boxy** ellipticals maps onto the top row: disky, rapidly rotating ellipticals from gas-rich major mergers, where the dissipating gas retains some angular momentum and forms a central rotating component; boxy, slowly rotating ones from gas-poor major mergers, where there is nothing to dissipate and the remnant is left triaxial and pressure-supported.

## What a wet major merger does

The luminous half of the story, and the one that connects this branch to the next.

When two gas-rich disks merge, the gas does something that at first seems impossible: **it loses most of its angular momentum**, and does so quickly. The Disk chapter's whole argument was that gas can shed energy but not angular momentum, which is why disks exist at all. A merger supplies the missing mechanism.

The encounter drives strong **bar-like distortions** in each disk. A bar is a non-axisymmetric feature, and a non-axisymmetric potential exerts a **torque** on the gas orbiting within it. Specifically, gas inside the bar's corotation radius is torqued backward — it loses angular momentum to the stellar bar and to the dark halo, both of which gain it — so the gas spirals inward. The stars, being collisionless, cannot cooperate in the same way: they respond to the torque too, but without dissipation they simply move onto new orbits rather than sinking.

The result is a large fraction of both galaxies' cold gas funnelled into the central few hundred parsecs on a timescale of order a hundred million years. That gas reaches enormous densities and does two things.

**It forms stars, furiously.** The result is a **ultraluminous infrared galaxy** (ULIRG), defined by an infrared luminosity above $10^{12}\,L_\odot$. The infrared dominance is itself diagnostic: the starburst is buried in the dust it inherited and produced, so the ultraviolet light of young massive stars is absorbed and re-radiated in the far infrared. **Arp 220**, the archetype, radiates about $1.4 \times 10^{12}\,L_\odot$, essentially all of it in the infrared, from a region a few hundred parsecs across.

The connection to mergers is not statistical but total: the fraction of infrared-luminous galaxies that are mergers rises with luminosity and reaches **100 per cent above $10^{12}\,L_\odot$**. Every known ULIRG is an interacting or merging system. When a correlation reaches unity, one has stopped describing a tendency and started describing a mechanism.

**It feeds the black hole.** The same inflow that fuels the starburst delivers gas to the central few parsecs, where a supermassive black hole can accrete it. This is the basis of the **merger → starburst → AGN → quasar** sequence proposed by Sanders and collaborators in 1988: a gas-rich merger buries a starburst and a growing black hole in dust; the system appears as a ULIRG; as feedback clears the obscuring material, the accreting nucleus becomes visible as a quasar; and once the gas is exhausted or expelled, what remains is a quiescent elliptical with a massive black hole at its centre.

That sequence is not universally accepted — many quasars are hosted by undisturbed galaxies, and secular processes can also feed a nucleus — but its central claim has held up: **the same event that builds a spheroid also grows its black hole, at the same time and from the same gas.** That co-evolution is the natural explanation for why black-hole mass correlates so tightly with spheroid properties, which the Supermassive Black Holes chapter takes up directly.

```checkpoint
q: Gas cannot shed angular momentum by radiating, yet a merger delivers large quantities of gas to a galaxy's centre within ~100 Myr. The mechanism is
a: shocks between the two gas disks, which destroy angular momentum on impact
x: Shocks remove kinetic energy, which is radiated away, but angular momentum about the centre is conserved in a collision — it must be transferred to something, not destroyed.
a*: tidal torques from the strong bar-like distortions the encounter induces, which transfer angular momentum from gas inside corotation to the stellar bar and the dark halo
a: the black hole's gravity, which becomes strong enough during the merger to pull gas inward
x: A supermassive black hole's gravity dominates only within a few parsecs; it cannot reach kiloparsec-scale gas, and the inflow is what feeds it rather than the reverse.
a: magnetic braking against the intergalactic medium
x: Magnetic braking operates on far smaller scales in star formation and cannot act on a galaxy's cold gas disk against an extremely tenuous external medium.
hint: Angular momentum has to go somewhere. What else in the galaxy can take it?
why: Angular momentum is conserved, so the gas can only lose it by giving it to something else. A merger induces strong non-axisymmetric bars, and a non-axisymmetric potential exerts a torque: gas inside corotation is torqued backward and spirals in, while the stellar bar and dark halo absorb the angular momentum. This is the missing mechanism the Disk chapter's argument implied must exist — gas settles into a disk because it can radiate energy but not shed angular momentum, so only an external torque can move it further in. The stars feel the same torque but, lacking dissipation, simply shift orbits rather than sinking.
---
q: Every known ultraluminous infrared galaxy — infrared luminosity above 10¹² L☉ — is an interacting or merging system. The significance of the merger fraction reaching 100% is that
a: it proves ULIRGs are the most massive galaxies, since only massive systems can merge
x: ULIRG hosts are typically ordinary massive spirals, and merging is not restricted to the most massive galaxies. The luminosity comes from the event, not from exceptional host mass.
a*: a correlation that reaches unity has stopped describing a tendency and started describing a requirement — merging is not one route to extreme infrared luminosity but the only one
a: infrared observations preferentially detect mergers, so the correlation reflects a selection effect
x: The samples are infrared-selected without regard to morphology, and the merger identification is made afterwards from imaging, so nothing in the selection favours disturbed systems.
a: dust is produced by mergers, so only merging galaxies can be infrared-bright
x: Dust is produced by stellar evolution in all galaxies, and ordinary spirals are dusty. What mergers supply is the concentration of gas that drives the extreme star formation rate.
hint: What is the difference between "mergers are often ULIRGs" and "ULIRGs are always mergers"?
why: A partial correlation permits several causal stories; a complete one is far more constraining. Since no non-merging system reaches these luminosities, the merger must supply something no other process can — and it does: tidal torques funnel much of both galaxies' cold gas into the central few hundred parsecs, producing densities unattainable in a settled disk. The buried starburst reprocesses its ultraviolet output into the far infrared, so Arp 220 emits ~1.4 × 10¹² L☉ from a few hundred parsecs. The same inflow feeds the central black hole, which is why the merger–starburst–AGN sequence links this chapter to the Active Galaxies branch.
```

{{image: Arp 220 | Arp 220, the nearest ultraluminous infrared galaxy: two nuclei still distinct, embedded in the wreckage of a gas-rich major merger, radiating about 1.4 × 10¹² solar luminosities almost entirely in the infrared. Tidal torques have funnelled much of both galaxies' cold gas into the central few hundred parsecs, where the resulting starburst is buried in its own dust — and where the same inflow is feeding the black holes that will eventually merge.}}

## What dry mergers do: the red nugget problem

Gas-poor mergers add no light and make no spectacle, which is why they were long treated as unimportant. They turn out to solve one of the sharper problems in the subject.

**The observation.** Massive quiescent galaxies at $z \approx 2$ — "red nuggets" — have stellar masses around $10^{11}\,M_\odot$ and effective radii of about **1 kpc**. Their local counterparts, at the same stellar mass, are **three to five times larger**. The compact objects are essentially absent today, and the extended ones essentially absent then. Something grows massive galaxies in *size* far more than in *mass* over ten billion years.

That last clause is the difficulty. These galaxies are quiescent, so they cannot puff up by forming new stars at large radii. And their stellar masses roughly double, not quintuple — so whatever adds the size must add much more radius than mass.

**The resolution** is a quantitative argument from the virial theorem, and it is worth doing because the answer comes out with exactly the right factor.

Take a system of mass $M_1$, radius $r_1$, velocity dispersion $\sigma_1$, and let it accrete material of mass $M_2 = \eta M_1$ whose own dispersion is $\sigma_2^2 = \varepsilon\sigma_1^2$. Energy and the virial relation give, for the remnant,

$$\frac{\sigma_f^2}{\sigma_1^2} = \frac{1 + \eta\varepsilon}{1 + \eta}, \qquad \frac{r_f}{r_1} = \frac{(1+\eta)^2}{1 + \eta\varepsilon}$$

using $r \propto M/\sigma^2$. Now compare the two limits:

**Equal-mass (major) merger of similar systems**, $\eta = 1$, $\varepsilon = 1$: mass doubles, and $r_f/r_1 = 4/2 = 2$. Size doubles too. **$r \propto M$.**

**Many minor mergers of low-dispersion material**, $\varepsilon \to 0$: $r_f/r_1 = (1+\eta)^2$ while $M_f/M_1 = (1+\eta)$. **$r \propto M^2$.**

That squared dependence is the whole answer. **Doubling a galaxy's mass by minor mergers quadruples its size, while doubling it by a major merger only doubles it.** Observations require a size growth of four to five for a mass growth of about two — which is what minor mergers give and what major mergers cannot.

The physical reading is straightforward. Accreted low-dispersion material is loosely bound, so it is stripped at large radii and deposited in the outskirts rather than sinking to the centre. The core stays as it was; an envelope is built around it. This is **inside-out growth**, and it produces the modern picture of massive galaxy assembly as **two-phase**: a rapid, dissipative, in-situ phase before $z\approx2$ that builds a compact dense core, followed by a prolonged accretion phase that wraps that core in an envelope of stars formed in other galaxies.

The prediction is testable and has been tested: the cores of today's giant ellipticals should be old, dense, and chemically distinct from their outskirts, which should be a mixture of accreted populations. That is what is found — radial gradients in age and metallicity, and outer regions whose kinematics reflect their accreted origin.

```checkpoint
q: Massive quiescent galaxies at z ≈ 2 are 3–5 times smaller than local galaxies of the same stellar mass, while roughly doubling in mass over that interval. Why do minor mergers explain this where major mergers cannot?
a: Minor mergers are more common, so they deliver more total mass over ten billion years
x: Frequency is not the issue — the problem is the *ratio* of size growth to mass growth, and a large number of major mergers would still give only r ∝ M.
a*: Accreted low-dispersion material is loosely bound and deposits at large radii, giving r ∝ M² — so doubling the mass quadruples the size, whereas a major merger of similar systems gives only r ∝ M
a: Minor mergers trigger star formation in the outskirts, which extends the light profile
x: These galaxies are quiescent — the growth must come from stars formed elsewhere and deposited, not from new star formation.
a: Major mergers destroy the galaxy entirely, so they cannot contribute to growth
x: Major mergers produce remnants rather than destroying galaxies; they simply do not deliver the required size-to-mass ratio.
hint: Write the virial scaling for accreting material that is much less tightly bound than the host.
why: With r ∝ M/σ², accreting mass ηM₁ of dispersion εσ₁² gives r_f/r₁ = (1+η)²/(1+ηε). For a major merger of similar systems (η = 1, ε = 1) this is 4/2 = 2 while the mass doubles: r ∝ M. For loosely bound accreted material (ε → 0) it is (1+η)² while the mass grows as (1+η): r ∝ M². Doubling the mass therefore quadruples the size. Observations need a factor 4–5 in size for a factor ~2 in mass, which is exactly what the minor-merger limit delivers. Physically, weakly bound material is stripped early and wrapped around the existing core rather than sinking into it — inside-out growth, leaving old dense cores inside accreted envelopes.
---
q: The two-phase picture of massive galaxy assembly makes a testable prediction about present-day giant ellipticals. That prediction is that
a: they should be rotating rapidly, having acquired angular momentum from accreted satellites
x: Accreted satellites arrive on randomly oriented orbits, so their angular momentum contributions largely cancel — which is why the most massive systems are slow rotators.
a*: their cores should be old, dense and chemically distinct from their outskirts, since the core formed in situ before z ≈ 2 while the envelope is made of stars formed in other galaxies
a: they should show a uniform age and metallicity throughout, since mergers mix their stars thoroughly
x: Mergers of collisionless stellar systems do not mix on the small scales that would erase gradients — stars retain the energies and the chemistry they arrived with.
a: they should contain large amounts of cold gas deposited by the accreted satellites
x: The accretion is dry by construction — that is what allows growth without star formation. Gas-rich accretion would produce the star formation these quiescent galaxies conspicuously lack.
hint: If a galaxy is a core built one way wrapped in an envelope built another way, what should vary with radius?
why: The two phases build the two regions from different material at different times: a rapid dissipative in-situ phase before z ≈ 2 produces a compact, dense, chemically enriched core, and a prolonged dry accretion phase wraps it in stars formed in smaller galaxies, which are typically older in formation epoch and more metal-poor. Since stars are collisionless and violent relaxation does not mix on small scales, that history survives as radial gradients in age and metallicity, and as outer kinematics reflecting accreted rather than in-situ origin. All three are observed, which is the strongest support for the picture beyond the size-growth arithmetic itself.
```

## Our own merger history

The Milky Way is a worked example, and the technique for reading it — **galactic archaeology** — depends on the same collisionless property that governs everything else here.

When a satellite is disrupted, its stars disperse in position but **retain their orbital energies and angular momenta**, because there is nothing to randomise those quantities. They also retain their chemical abundances, which were fixed when they formed in a galaxy with its own enrichment history. So long after a satellite has ceased to be a recognisable object, its stars remain identifiable as a group in the space of orbits and abundances. A destroyed galaxy leaves a legible signature.

Two events dominate our own record.

**Gaia–Enceladus / the Sausage.** Identified in 2018 from Gaia astrometry, this was the Milky Way's last major merger: a galaxy accreted roughly **8–11 billion years ago** whose stars form a striking population on highly radial orbits — the "sausage" shape in velocity space that gave it one of its names. Mass-ratio estimates range from about **1:4 to 1:8** depending on method, so it was substantial without being an equal-mass event. It contributed much of the inner stellar halo, and the encounter is implicated in heating the pre-existing disk into what is now the thick disk.

**Sagittarius.** Discovered in 1994, currently being dismembered, with its stars strung in a stream that wraps the entire Galaxy. This is the process observed live rather than reconstructed.

Add the Magellanic Clouds — massive, gas-rich, and on first infall — and the Milky Way's history is a large early merger, a long quiet period, and an ongoing minor accretion. **That quiet period matters**: a thin, cold, star-forming disk cannot survive a recent major merger, so the Milky Way's disk is itself evidence that nothing major has happened for many billions of years. Structure is a constraint on history.

## Rates, and our own future

Merger rates rise with redshift — mergers were more frequent when the universe was denser and galaxies closer — and fall with mass ratio, so minor mergers vastly outnumber major ones. A typical massive galaxy has experienced very few major mergers and a great many minor ones, which is consistent with the two-phase picture and with the survival of disks in a substantial fraction of galaxies.

Measuring the rate is harder than it sounds, and the difficulty is a good illustration of a general problem. A merger rate is a number of events per unit time, but observations deliver a **fraction of galaxies currently disturbed**. Converting one to the other requires the **observability timescale** — how long a merger looks like a merger — which depends on mass ratio, gas content, orientation, depth of imaging, and the method used to identify disturbance. That timescale is estimated from simulations, so the observed merger rate inherits the uncertainty of the simulations it was supposed to test. Different methods disagree by factors of a few, and the disagreement is dominated by this conversion rather than by the counting.

**As for our own case**, the Dwarfs chapter set out the current position: the Milky Way–Andromeda merger, long presented as certain in about 4.5 billion years, is now genuinely uncertain — recent analyses including the LMC's and M33's gravitational influence have put the ten-billion-year merger probability anywhere from roughly even to around 90 per cent, with a median merger time near 6.5 billion years on the most recent reanalysis. What is not in doubt is what would happen if it occurs: two gas-poor-ish disks, a major mass ratio, violent relaxation, and a spheroid.

## Pulling the thread

- A merger is **two events in one volume**: collisionless for stars, collisional for gas. **Stars are ~40 million times their own size apart**, so none collide; what rearranges them is **violent relaxation** in a rapidly changing potential, which converts rotation into random motion in a few crossing times and cannot be undone.
- **Tidal tails and bridges** were explained in 1972 by a restricted three-body model with no gas, dark matter or self-gravity — evidence that they depend on none of it. **Prograde** encounters produce the longest tails because the forcing stays **in phase**; tails persist for gigayears because they are collisionless, which makes them a clock.
- **Dynamical friction** decides whether a merger happens: $t_{\rm df} \propto r^2v_c/(GM_s)$, so a $10^{11}\,M_\odot$ companion at 50 kpc sinks in ~0.5 Gyr and a $10^{8}\,M_\odot$ one in ~500 Gyr. Hence surviving satellites are small, and the LMC must be on first infall.
- Mergers are **rarer in cluster cores than in groups**: at ~1,000 km/s encounters are impulsive, transfer energy as ~$1/v^2$, and leave the pair unbound. The giant ellipticals were built in **groups** and arrived in clusters finished.
- **Wet major mergers** funnel gas inward by **tidal torques from induced bars** — the mechanism that lets gas shed angular momentum, which radiation alone cannot — producing **ULIRGs** (Arp 220 at $1.4\times10^{12}\,L_\odot$; merger fraction **100%** above $10^{12}\,L_\odot$) and feeding the black hole from the same reservoir.
- **Dry minor mergers** solve the **red nugget** problem: virial scaling gives $r \propto M^2$ for loosely bound accreted material against $r \propto M$ for equal-mass mergers, so doubling the mass **quadruples** the size — the factor observations require. This is **two-phase, inside-out growth**, tested by the age and metallicity gradients it predicts.
- Our own history: **Gaia–Enceladus** at 8–11 Gyr ago and ~1:4–1:8, **Sagittarius** disrupting now, the Clouds on first infall — and a thin disk whose existence proves nothing major has happened recently.

The transferable idea: **a system's response to a disturbance is determined by what its components can do to each other, not by how hard it is hit.** The same collision, delivering the same energy to the same volume, permanently scrambles the stars and dramatically concentrates the gas — opposite outcomes, from one property: whether the components can collide and dissipate. This is why "how violent was the event?" is usually the wrong question and "what channels does the system have for shedding energy?" is usually the right one. A system with no dissipative channel keeps whatever disorder it is given; a system with one converts the disturbance into concentration. Both are on display in every merging pair, in the same photograph.

## Further reading

{{book: Halton Arp | Atlas of Peculiar Galaxies | 1966}}

{{book: Curtis Struck | Galaxy Collisions: Forging New Worlds from Cosmic Crashes | 2011}}

{{book: Linda Sparke | Galaxies in the Universe: An Introduction | 2007}}

Beyond the books: Toomre and Toomre's 1972 paper is worth reading in the original for how completely a minimal model settled a question, and the accompanying film of their simulations is a document of what computation looked like when it first became an instrument for this subject. The ULIRG literature following Sanders' 1988 evolutionary sequence repays attention for how a proposed causal chain was tested and partly revised. And the red-nugget size-growth papers are unusually satisfying, because the required factor and the predicted factor were established independently and agree.

## Problems

*Useful numbers: t_df ≈ (1.17/lnΛ) r²v_c/(G M_s), lnΛ ≈ 3; v_c = 220 km/s; G = 6.674 × 10⁻¹¹ N m² kg⁻²; M☉ = 1.989 × 10³⁰ kg; 1 kpc = 3.086 × 10¹⁹ m; 1 pc = 3.086 × 10¹⁶ m; R☉ = 6.96 × 10⁸ m; virial merger scaling r_f/r₁ = (1+η)²/(1+ηε) with σ₂² = εσ₁²; ULIRG threshold 10¹² L☉.*

**1.** *(Why nothing collides.)* **(a)** Compute the ratio of the mean stellar separation in the solar neighbourhood (~1 pc) to the Sun's radius. **(b)** State what follows for the number of stellar collisions in a major merger. **(c)** Name the process that rearranges stellar orbits instead, and state why its effect is irreversible.

**2.** *(Two halves.)* **(a)** State the single property that separates how stars and gas respond to a merger. **(b)** For each of the following, say which half produces it: tidal tails, the ULIRG luminosity, the remnant's de Vaucouleurs profile, the black hole's fuel supply. **(c)** Explain why a merger remnant can be a spheroid with a small rotating disk at its centre.

**3.** *(Tails.)* **(a)** Explain, in terms of differential gravity, why a tail forms on the far side of a disk. **(b)** Explain why prograde encounters produce longer tails than retrograde ones. **(c)** Explain why tails can be used to date an encounter.

**4.** *(Dynamical friction.)* Using the formula with lnΛ = 3, $v_c = 220$ km/s, and $r = 50$ kpc: **(a)** compute $t_{\rm df}$ for satellite masses of $10^{11}$ and $10^{9}\,M_\odot$. **(b)** State what the mass scaling implies about the surviving satellite population. **(c)** Explain what the LMC's mass implies about its orbital history.

**5.** *(Environment.)* **(a)** State the relative velocity in a cluster core and in a group, and compare each with a galaxy's internal dispersion. **(b)** Using the $1/v^2$ scaling, compute the ratio of energy transferred per encounter between the two. **(c)** State where the most massive ellipticals were assembled and why.

**6.** *(Angular momentum.)* **(a)** State why radiative cooling alone cannot deliver gas to a galaxy's centre. **(b)** Describe the mechanism a merger supplies, naming what receives the angular momentum. **(c)** Explain why the stars do not sink along with the gas.

**7.** *(ULIRGs.)* **(a)** State the defining luminosity and why the emission is infrared-dominated. **(b)** State the merger fraction above that threshold and explain what a fraction of unity licenses that a partial correlation does not. **(c)** Outline the merger → starburst → AGN → quasar sequence and state one reason it is not universally accepted.

**8.** *(Red nuggets.)* Using $r_f/r_1 = (1+\eta)^2/(1+\eta\varepsilon)$: **(a)** evaluate the size and mass growth for $\eta = 1, \varepsilon = 1$ and for $\eta = 1, \varepsilon = 0$. **(b)** State the observed size and mass growth since $z\approx2$ and identify which case matches. **(c)** State the resulting two-phase picture and one prediction it makes.

**9.** *(Reading a history.)* **(a)** Explain why a disrupted satellite remains identifiable long after it ceases to be an object. **(b)** Summarise the Milky Way's known merger history. **(c)** Explain what the existence of a thin cold disk proves about that history, and state the general form of the inference.

## Worked answers

**1.** **(a)** $1\ \mathrm{pc}/R_\odot = 3.086\times10^{16}/6.96\times10^{8} = \mathbf{4.4\times10^{7}}$ — stars are separated by about **forty million times their own radius**. **(b)** The collision cross-section is smaller than the square of the separation by the square of that ratio, roughly $10^{15}$, so the mean free path for a physical stellar collision exceeds a galaxy's size by many orders of magnitude. Over a whole major merger involving $\sim10^{11}$ stars, the expected number of collisions is **effectively zero**. **(c)** **Violent relaxation**: in a potential varying rapidly in time, stellar energy is not conserved, so stars are scattered in energy and ordered rotation is converted into random motion over a few crossing times. It is irreversible because stars are **collisionless and cannot dissipate** — there is no channel by which a scrambled stellar system can shed energy and re-settle into a disk. Only gas can do that.

**2.** **(a)** Whether the components can **collide and therefore dissipate**. Gas can; stars cannot. **(b)** *Tidal tails* — collisionless half (ballistic response of stars and gas alike to differential gravity, but requiring no dissipation). *ULIRG luminosity* — collisional half (gas shocks, concentrates, forms stars). *De Vaucouleurs profile of the remnant* — collisionless half (violent relaxation). *Black hole's fuel supply* — collisional half (gas that has dissipated and sunk). **(c)** Because the two components do different things in the same event: the **stars** are violently relaxed into a pressure-supported spheroid and stay there, while the **gas** dissipates, sinks, retains some residual angular momentum, and settles into a small rotating disk at the centre where it forms stars. The remnant is therefore a spheroid built from old scrambled stars with a young, rotating, dissipatively formed component inside it — which is precisely the structure of a **disky elliptical**, and the reason the Galaxy Types chapter's disky/boxy split maps onto gas-rich versus gas-poor mergers.

**3.** **(a)** The companion pulls the near side of the disk more strongly than the centre and the centre more strongly than the far side. Working in the frame of the disk's centre, the residual force stretches the disk along the line joining the galaxies: near-side material is drawn toward the companion, making a **bridge**; far-side material feels a *reduced* net inward pull relative to the centre and is left behind, making a **tail**. The tail is not flung outward — it is material that was under-pulled. **(b)** In a **prograde** encounter the companion moves in the same sense as the disk rotates, so a given disk element stays on the same side of the perturber for a long time and the tidal tug accumulates coherently in one direction. In a **retrograde** encounter the element sweeps past quickly and feels the tug first one way and then the other, so contributions largely cancel. It is a **resonance** condition: what matters is how long the forcing stays in phase, not its amplitude. **(c)** Because tail material is **collisionless**, it follows ballistic orbits after launch with no dissipation to alter them. The tail's length, its degree of curvature, and how much of it has begun to fall back are therefore set purely by the time elapsed since pericentre in a known potential — so measuring them, and matching to a dynamical model, dates the encounter.

**4.** **(a)** With $r = 50\ \mathrm{kpc} = 1.543\times10^{21}$ m, $v_c = 2.2\times10^5$ m/s: $t_{\rm df} = (1.17/3)\,r^2v_c/(GM_s) = 0.39 \times (2.381\times10^{42})(2.2\times10^5)/(6.674\times10^{-11}M_s)$.
- $M_s = 10^{11}M_\odot = 1.989\times10^{41}$ kg: $t = 0.39 \times 5.238\times10^{47}/(1.327\times10^{31}) = 1.54\times10^{16}$ s $\approx \mathbf{0.49\ \mathrm{Gyr}}$.
- $M_s = 10^{9}M_\odot$: a hundred times smaller mass gives a hundred times longer time, $\approx \mathbf{49\ \mathrm{Gyr}}$ — more than three times the age of the universe.

**(b)** Since $t_{\rm df}\propto 1/M_s$, massive companions are absorbed promptly while low-mass ones effectively never sink. The surviving satellite population is therefore **strongly biased to low masses** — not because massive satellites were rare, but because they have already been eaten. Any census of satellites is a census of what friction could not reach. **(c)** The LMC exceeds $10^{11}\,M_\odot$, giving a sinking time well under a gigayear at its present distance. Had it been orbiting the Milky Way for most of cosmic time it would have merged long ago. Its continued existence as a distinct, gas-rich, star-forming galaxy therefore implies it is on its **first infall**, having arrived recently — which is also why it can still deliver a substantial transverse impulse to the Milky Way, as the Local Group's contested future depends on.

**5.** **(a)** Cluster core: $v_{\rm rel} \approx 1{,}000$ km/s, about **five times** a galaxy's internal stellar dispersion of ~200 km/s. Group: $v_{\rm rel} \approx 300$ km/s, about **1.5 times** it — comparable. **(b)** Energy transferred in a fast encounter scales as $1/v_{\rm rel}^2$, so the ratio is $(300/1000)^2 = 0.09$: a cluster-core encounter transfers about **11 times less** energy than a group encounter at the same impact parameter. **(c)** In **groups**. There, relative velocities are comparable to internal dispersions, so encounters are slow, dynamical friction has time to act, orbital energy is genuinely removed, and pairs become bound and merge. In cluster cores the encounter is impulsive — over before the stars can respond coherently — and the galaxies separate still unbound, damaged but not captured. The most massive ellipticals were therefore assembled at **intermediate density** and fell into clusters as finished objects, which is why the densest environment is not the most interactive one.

**6.** **(a)** Because radiation removes **energy** but not **angular momentum**. Gas settling in a potential radiates away its energy and sinks until it is rotationally supported at the radius set by its angular momentum, and then stops — that is why disks exist. Further infall requires angular momentum to be removed, and no radiative process does it. **(b)** The merger induces strong **bar-like, non-axisymmetric distortions** in the disks. A non-axisymmetric potential exerts a **torque** on the gas orbiting in it: gas inside the bar's corotation radius is torqued backward and loses angular momentum, which is transferred to the **stellar bar** and the **dark-matter halo**. Losing angular momentum, the gas spirals inward — delivering a large fraction of both galaxies' cold gas to the central few hundred parsecs in ~10⁸ years. **(c)** The stars experience the same torque, but having no dissipation they cannot convert the exchange into a steady inspiral: a star that loses angular momentum simply moves onto a different orbit of the same energy family and continues orbiting. Sinking requires losing **both** angular momentum and energy, and only the gas can do the second.

**7.** **(a)** Infrared luminosity above $\mathbf{10^{12}\,L_\odot}$. The emission is infrared-dominated because the starburst is **buried in dust** — gas funnelled to the centre brings its dust with it, and the newly formed massive stars produce more — so the ultraviolet output of young stars is absorbed within the nuclear region and re-radiated thermally in the far infrared. The infrared luminosity is thus the starburst's total output, reprocessed. **(b)** The merger fraction reaches **100 per cent**. A partial correlation is consistent with several causal stories, including a shared third cause; a fraction of unity says no non-merging system achieves this luminosity, so merging supplies something **necessary** — the concentration of gas that a settled disk cannot produce. It converts "mergers tend to be luminous" into "this luminosity requires a merger". **(c)** *Sequence*: a gas-rich major merger funnels gas inward; a dust-buried starburst and a growing black hole appear together as a ULIRG; feedback clears the obscuring material and the accreting nucleus becomes visible as a **quasar**; gas is exhausted or expelled, leaving a quiescent elliptical with a massive black hole. *One reason for doubt*: many quasars are hosted by **undisturbed** galaxies showing no merger signatures, and secular processes such as bar-driven inflow can feed a nucleus without any merger — so mergers are evidently not the only route to an active nucleus, even if they are the route to the most extreme systems.

**8.** **(a)** $\eta = 1, \varepsilon = 1$: $r_f/r_1 = (2)^2/(1+1) = 4/2 = \mathbf{2}$, with $M_f/M_1 = \mathbf{2}$ — so $r \propto M$. $\eta = 1, \varepsilon = 0$: $r_f/r_1 = (2)^2/1 = \mathbf{4}$, with $M_f/M_1 = \mathbf{2}$ — so $r \propto M^2$. **(b)** Observations give a size growth of **3–5** for a mass growth of about **2** since $z\approx2$. Only the second case matches: the major-merger limit delivers a factor 2 in size where 4–5 is required. **(c)** **Two-phase, inside-out growth**: a rapid dissipative in-situ phase before $z\approx2$ builds a compact, dense core (the red nugget), followed by prolonged dry minor accretion that deposits loosely bound stars at large radii, wrapping the unchanged core in an envelope. *Prediction*: present-day giant ellipticals should show **radial gradients in age and metallicity** — old, dense, enriched cores inside envelopes of stars formed in smaller, more metal-poor galaxies — together with outer kinematics reflecting accreted rather than in-situ origin. All of these are observed.

**9.** **(a)** Because its stars are **collisionless**. Disruption disperses them in position, but there is nothing to randomise their **orbital energies and angular momenta**, which are approximately conserved, nor their **chemical abundances**, which were fixed at formation in a galaxy with its own enrichment history. The satellite therefore remains a recognisable clump in the space of orbits and abundances long after it has ceased to be a clump in space — which is what galactic archaeology exploits. **(b)** **Gaia–Enceladus / the Sausage**: the last major merger, accreted ~8–11 Gyr ago at a mass ratio of roughly 1:4 to 1:8, identified in 2018 from Gaia astrometry by its population of stars on strongly radial orbits; it contributed much of the inner stellar halo and is implicated in heating the early disk into the thick disk. **Sagittarius**: discovered 1994, currently being dismembered into a stream wrapping the Galaxy. **The Magellanic Clouds**: massive and gas-rich, on first infall. **(c)** A thin, dynamically cold, star-forming disk **cannot survive a recent major merger** — violent relaxation would have heated it into a spheroid, and there is no mechanism to re-cool a stellar system. Its existence therefore proves the Milky Way has suffered no major merger for many billions of years. The general form of the inference is that **a fragile structure's survival is evidence about the history of its environment**: wherever a system contains something that could not have withstood a class of event, that structure bounds how recently such an event occurred — which is the same reasoning that dates planetary surfaces from crater counts and reads a quiet accretion history off a cold disk.$egMerge_master$,
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
