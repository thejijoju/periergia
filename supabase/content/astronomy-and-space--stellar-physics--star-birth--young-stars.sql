-- Astronomy & Space · Stellar Physics — Star Birth —
-- "Young Stars". Curated, human-reviewed master for
-- astronomy-and-space/stellar-physics/star-birth/young-stars @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The T Tauri phase as the site where the angular momentum problem is
-- finally settled at the level of the star itself: a protostar contracting
-- from 5 to 1 solar radii should spin up to a 7.7-hour period against a
-- 2.8-hour break-up period, yet young stars arrive with periods of days and
-- the Sun rotates in 25 days -- the fourth appearance of a problem first
-- seen as a 78x-break-up collapsing core, then as disk transport and jet
-- ejection, and last as the Sun's 99.87%-mass/0.6%-angular-momentum split;
-- Alfred Joy's 1945 identification of T Tauri stars from the Taurus dark
-- clouds, the classical/weak-lined division by accretion status rather
-- than age, and magnetospheric accretion's convergence of three
-- independent observables -- 553 km/s free-fall matching 200-300 km/s
-- H-alpha widths, an accretion luminosity of order 0.2-0.3 solar
-- luminosities, and 8,000-10,000 K hot spots producing both ultraviolet
-- excess and veiling; disk locking and its corotation-radius mechanism
-- (16.8 solar radii / 0.078 AU for an 8-day period), with its falsifiable
-- and confirmed prediction that disk-bearing stars rotate slower; Andrew
-- Skumanich's 1972 rotation-decay law, magnetic braking as the same
-- lever-arm physics as protostellar jets, gyrochronology's unique value
-- for isolated field stars, and its three failure modes including
-- evidence of weakened braking beyond solar age; the young Sun's violent
-- magnetic activity (10^3-10^4x the Sun's X-ray fraction, kilogauss
-- fields, flares 10^4x more energetic) and its consequences for disk
-- ionisation, photoevaporation and atmospheric loss, alongside the
-- unresolved Sagan & Mullen 1972 faint young Sun paradox; and the lithium
-- clock, with the 0.06-solar-mass threshold below which lithium survives
-- forever furnishing a categorical rather than statistical proof of
-- substellar status, as used to confirm the first brown dwarfs in 1995.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/stellar-physics/star-birth/young-stars',
    'research',
    'advanced',
    'read',
    $astroYoungStars_master$> A T Tauri star is optically visible for the first time since its parent cloud began to collapse, yet it is still not a star: it is still contracting toward the main sequence, still accreting from the remnant of its disk, and it is the site where the angular momentum problem that has recurred throughout star formation is finally settled — first by disk locking, and then, for billions of years afterward, by magnetic braking.

## Not yet a star

The envelope is gone. For the first time since the collapse began, the object is optically visible — it has a photosphere, a spectrum that can be classified, and a position on the Hertzsprung–Russell diagram.

It is still not a star.

A T Tauri star is a low-mass object that has emerged from its envelope but has not reached the main sequence. It is still contracting, still accreting from a disk, powered entirely by gravity, and it will not begin fusing hydrogen for another ten to fifty million years.

Three things make this phase worth treating on its own terms.

It is where the angular momentum problem finally gets settled. Viscous transport within the disk and magnetocentrifugal jets dispose of the parent core's angular momentum, but the star itself has a residual problem — it is contracting, so it should be spinning up, and it is not. What holds it back turns out to be the disk, and then, for the following ten billion years, its own wind.

It is violently magnetically active — X-ray luminosities a thousand times the Sun's, kilogauss fields, flares ten thousand times more energetic. That matters because this is the radiation environment in which planets form.

And it supplies two clocks. Rotation and lithium abundance both change monotonically during this phase, and both are used to date stars — including field stars, for which no cluster is available to supply an age by any other means.

## The star that should be spinning apart

A protostar arrives on the Hayashi track at perhaps five solar radii and contracts toward one.

Angular momentum is conserved during contraction, and for a body of fixed mass $\omega \propto R^{-2}$. So a T Tauri star rotating with a period of eight days at 5 $R_\odot$ should, by the time it reaches the main sequence at 1 $R_\odot$, be rotating with a period of

$$P_{\text{final}} = 8\ \text{days} \times \left(\frac{1}{5}\right)^2 = \mathbf{7.7\ hours}$$

The break-up period for a solar mass at solar radius is 2.8 hours.

So the star should arrive on the main sequence at roughly a third of break-up velocity — rotating in a third of a day, violently oblate, and close to the rotational stability limit.

It does not. Young solar-type stars arriving on the main sequence rotate with periods of a few days. And the Sun, four and a half billion years later, rotates in 25 days.

A star that contracts by a factor of five and does not spin up by a factor of twenty-five is losing angular momentum, continuously, for its entire life.

This is not the first time a version of this problem has appeared, and each appearance has operated on a different scale. A rotating cloud core collapsing under gravity alone, with its angular momentum conserved, would arrive at roughly seventy-eight times break-up velocity — a configuration that cannot exist, so the angular momentum must be shed before the core can finish collapsing at all. The disk that forms in the course of that collapse disposes of the surplus by two related means: viscous transport carries it outward through the disk itself, and magnetocentrifugal jets eject it entirely, ejecting roughly a tenth of the disk's mass to remove roughly nine-tenths of its angular momentum. Even after both of those mechanisms have operated, the star that condenses out of the inner disk still faces its own version of the same problem — contracting toward the main sequence, it would still spin up, and something has to stop it. That something is disk locking, and afterward, magnetic braking. And there is a fourth appearance of the same problem, four and a half billion years downstream: the Sun holds 99.87% of the solar system's mass and 0.6% of its angular momentum.

| Scale | Problem | Solution |
|---|---|---|
| **Collapsing core** | A rotating core would arrive at 78× break-up | Must be shed |
| **Protostellar disk** | Where does the shed angular momentum go? | Viscous transport within the disk, plus magnetocentrifugal jets |
| **T Tauri star** | The star itself would still spin up while contracting | Disk locking, then magnetic braking |
| **The Sun, 4.57 Gyr later** | 99.87% of the mass, 0.6% of the angular momentum | The fossil record of the three solutions above |

The same problem recurs at four scales, and the same physics resolves it every time: a magnetic field enforcing co-rotation out to a lever arm much larger than the object's own size, so that removing a small amount of material or energy carries away a disproportionate share of the spin.

## Two kinds of T Tauri star

The class was identified by Alfred Joy in 1945, from a group of irregular variable stars in the Taurus dark clouds with unusual spectra — strong emission lines, particularly hydrogen and calcium, superimposed on a cool photospheric background. Joy's original sample was small and its members were not obviously connected to star formation as such; what marked them out was simply that their brightness varied erratically, in a way that ordinary pulsating or eclipsing variables did not, and that their spectra combined a cool, late-type photosphere with emission features more characteristic of a hot, active chromosphere or of circumstellar gas. Only with later work associating the objects firmly with dark, dusty clouds — the same clouds known independently to be sites of ongoing star formation — did it become clear that a T Tauri star was not merely an unusual variable but a distinct evolutionary stage, common to essentially every low-mass star on its way to the main sequence rather than a rare curiosity confined to a handful of objects in Taurus.

{{image: T Tauri star | An optical image of the T Tauri association in Taurus: the class that gives the phase its name was identified from irregular variables with strong hydrogen and calcium emission lines, catalogued by Alfred Joy in 1945.}}

T Tauri stars divide into two groups, and the division turns out to be physical rather than arbitrary.

| Diagnostic | Classical T Tauri (CTTS) | Weak-lined T Tauri (WTTS) |
|---|---|---|
| Hα equivalent width | > 10 Å, strong emission | < 10 Å |
| Infrared excess | strong — inner disk present | weak or absent |
| Accretion | yes, ~$10^{-8}\ M_\odot$/yr | none detected |
| Optical veiling | present | absent |
| Jets, forbidden lines | often | rare |
| Lada class | II | III |

The distinguishing variable is accretion, not age directly — though the two correlate, because disks disperse on a timescale of a few million years. A classical T Tauri star still has an inner disk and is being fed by it; a weak-lined T Tauri star has lost the inner disk and is simply contracting. Because disk lifetimes vary considerably between individual objects of the same age, classifying by accretion status sorts stars by disk status first and by age only statistically — a young star may already have lost its disk, and an older one may still retain one.

### Why the spectrum is strange

The emission lines are the signature of accretion, and the mechanism is worth setting out in full, because three separate diagnostics turn out to converge on one cause.

Magnetospheric accretion is the mechanism. The star's magnetic field — of order kilogauss — is strong enough to truncate the disk at a few stellar radii. Inside that radius, disk material can no longer orbit freely; it is captured by field lines and channelled onto the star, falling along the field in near-free-fall onto high-latitude regions of the surface.

{{image: Stellar magnetic field | A model of a young stellar magnetosphere: a kilogauss field truncates the disk at a few stellar radii and channels infalling material along field lines onto high-latitude accretion columns.}}

The velocity of that infall can be checked directly. Free fall from 5 $R_\odot$ to the surface gives

$$v = \sqrt{2GM_\odot\left(\frac{1}{R_\odot} - \frac{1}{5R_\odot}\right)} = \mathbf{553\ km/s}$$

Observed Hα line widths in classical T Tauri stars are 200–300 km/s — broad, and of the right order for gas in free fall along an inclined trajectory, where only a component of the true velocity is projected along the line of sight and the infall occurs over a spread of radii rather than from a single point. The width of a spectral line measures the depth of a gravitational well, and the answer points to material falling from a few stellar radii rather than orbiting in a boundary layer at the stellar surface.

The impact produces two further signatures. The infalling gas strikes the surface at hundreds of kilometres per second and shocks, thermalising its kinetic energy over perhaps one percent of the stellar surface — the footprints of the accretion columns. At an accretion rate of $\dot{M} = 10^{-8}\ M_\odot$/yr the accretion luminosity onto a solar-mass, solar-radius star works out to roughly 0.16–0.31 $L_\odot$, concentrated into hot spots at 8,000–10,000 K, far hotter than the roughly 4,000 K photosphere typical of these cool stars.

That concentrated luminosity produces the ultraviolet excess, because a small area radiating at 8,000–10,000 K emits strongly at short wavelengths relative to the cooler photosphere beneath it. And it produces veiling — additional continuum emission that fills in the photospheric absorption lines, making them appear shallower than they would be for the star's true spectral type, and causing the star to be misclassified as hotter than it is if the effect is not accounted for.

Emission-line widths, ultraviolet excess and veiling are three independent observables with a single cause. Line width could in principle have been produced by rotation or turbulence rather than infall; the ultraviolet excess could have come from a hot chromosphere; veiling could have come from an unresolved companion contaminating the spectrum. That a single accretion geometry predicts all three quantitatively, and that the three agree, is what excludes those alternatives. Measuring one observable three times over would reduce random error but leave any systematic misinterpretation untouched; three independent observables converging on the same physical picture is a categorically stronger form of evidence, because each one could have failed independently and none of them did.

## Disk locking

So why doesn't a contracting T Tauri star spin up?

### The mechanism

The same magnetic field that channels the accretion also couples the star to the disk.

Define the corotation radius as the radius at which the disk's Keplerian angular velocity equals the star's own rotation rate:

$$R_{co} = \left(\frac{GMP^2}{4\pi^2}\right)^{1/3}$$

For a solar mass and an eight-day period, $R_{co} = \mathbf{16.8\ R_\odot} = 0.078$ AU.

Consider field lines threading both the star and the disk. Inside $R_{co}$, the disk orbits faster than the star rotates, so it drags the field forward and spins the star up. Outside $R_{co}$, the disk orbits more slowly, so the field is dragged backward and spins the star down.

The net torque depends on how much of the magnetic flux connects to each region, and the system settles toward a configuration in which the two roughly balance, with the star's rotation locked to the angular velocity of the disk at the coupling radius. As long as the disk is present, the star cannot spin up, even while it continues to contract.

### The evidence

This is a mechanism with a clean, falsifiable prediction: stars that lose their disks early should rotate faster than stars of the same age that keep them.

That prediction is observed to hold. In young clusters, members with infrared excesses — that is, with disks still present — rotate systematically more slowly than members without. The correlation holds across several clusters and is the principal evidence for disk locking as a real phenomenon.

It is worth flagging that the details are contested. The precise torque balance depends on the field geometry, on how much magnetic flux actually connects the star to the disk rather than opening up into interplanetary space, and on the contribution of accretion-powered stellar winds, which may be doing much of the braking work themselves. The observation is solid; the theory is a family of competing models rather than a single settled mechanism. That is a normal condition for an active research question rather than an unsatisfactory one — it becomes a problem only if the competing models make no distinguishable predictions, and here they do, differing in how the torque should scale with accretion rate and field strength.

The distinction between a secure observation and a contested mechanism is worth holding onto precisely because the two are so often conflated. It would be a mistake to treat the uncertainty over field geometry as casting doubt on whether disk locking happens at all; the correlation between disk presence and slow rotation has been confirmed across enough independent clusters, with enough independent methods of measuring both rotation and disk status, that the phenomenon itself is no longer in serious dispute. What remains open is the apportionment of credit between a handful of mechanisms that all plausibly contribute — closed field lines threading the inner disk, open field lines carrying an accretion-powered wind, and the disk's own torque acting through gas pressure rather than magnetism alone — and disentangling their relative contributions requires exactly the kind of detailed, star-by-star magnetic mapping that has only recently become observationally possible.

## Spin as a clock

Once the disk is gone, the star finally spins up as it completes its contraction. Then it starts slowing down again, and it never stops.

### Skumanich's law

In 1972, Andrew Skumanich observed that for solar-type stars in clusters of known age, rotation velocity declines as

$$v_{\text{rot}} \propto t^{-1/2}$$

The mechanism is magnetic braking, and it is the same physics as the jets responsible for disposing of a protostellar disk's angular momentum, operating at a far lower rate. The star's magnetic field enforces co-rotation of the outflowing stellar wind out to many stellar radii — the Alfvén radius — so each departing particle carries away far more angular momentum than it possessed at the surface. A tiny mass loss removes a disproportionate share of the star's spin.

The Sun loses about $10^{-14}\ M_\odot$ per year in the solar wind — a negligible mass over its entire lifetime — and that has been enough to slow it from a rotation period of a few days to twenty-five. It is worth dwelling on how lopsided that exchange is. Over the roughly 4.57 billion years since the Sun reached the main sequence, a mass loss of that rate integrates to only a few parts in ten thousand of the Sun's total mass — an amount so small that it has no measurable effect on the Sun's luminosity, radius, or internal structure. Yet that negligible mass loss has removed the overwhelming majority of the angular momentum the young Sun once carried at its surface, because each escaping particle is forced to keep pace with the Sun's rotation out to many stellar radii before it is finally released, so it carries away specific angular momentum proportional to the square of that much larger radius rather than to the radius at which it left the photosphere. A wind does not need to remove mass efficiently to remove spin efficiently; it only needs a magnetic field long enough to hold onto the departing particles for a while before letting them go.

### The clock

| Age | Period | Population |
|---|---|---|
| 1 Myr | ~8 d | T Tauri |
| 13 Myr | ~5 d | h Persei |
| 120 Myr | ~4.5 d | Pleiades |
| 625 Myr | ~10 d | Hyades |
| 4,570 Myr | 25 d | the Sun |

Scaling from the Sun by $P \propto t^{1/2}$:

| Age | Predicted period |
|---|---|
| 100 Myr | 3.7 d |
| 600 Myr | 9.1 d |
| 1 Gyr | 11.7 d |
| 4.57 Gyr | 25 d |

Gyrochronology is the use of this relation to determine stellar ages, and it has a property almost nothing else in stellar astrophysics has: it works for isolated field stars.

{{image: Gyrochronology | A rotation-period-versus-age relation of the kind used in gyrochronology: because the method needs only a light curve showing starspots rotating in and out of view, it can date isolated field stars that have no coeval cluster and no detectable oscillations to fall back on.}}

Every other stellar age indicator needs either a cluster — the main-sequence turnoff requires a coeval population — or exceptional data, since asteroseismology requires long, high-precision photometry and detectable oscillations. A rotation period needs only a light curve showing starspots rotating in and out of view, which space-based photometric missions have now measured for hundreds of thousands of stars, most of them field stars with no other route to an age at all.

### Where it fails

Three limitations apply, and the third is serious.

It only works for cool stars. Braking requires a magnetised wind, which requires a dynamo, which requires a convective envelope. Stars hotter than about F5 have no substantial convection zone, no dynamo, no wind, and no braking — which is why A and B stars remain rapid rotators throughout their lives.

It is calibrated on clusters, so it inherits cluster ages and their systematics — the distance scale, the metallicity, and the mass scale that enters the underlying stellar-lifetime relation.

And there is evidence it breaks down at old ages. Asteroseismic measurements of stars older than the Sun suggest weakened magnetic braking — that beyond a critical Rossby number the field configuration changes and the braking becomes far less efficient, so rotation essentially stops evolving.

If that holds, the clock stops working exactly where it is most wanted: for old field stars, where no other method is available. This is the same structural problem the main-sequence turnoff has at old ages, where the turnoff mass changes so little with time that distinguishing a ten-billion-year-old population from a fourteen-billion-year-old one requires resolving a few percent in turnoff mass. Two independent stellar clocks fail in the same regime, for entirely unrelated reasons.

## Violently active

Young stars are magnetically extreme, by margins that are hard to overstate.

| Quantity | Sun | T Tauri | Ratio |
|---|---|---|---|
| $L_X/L_{bol}$ | ~$10^{-7}$ | $10^{-3}$–$10^{-4}$ | $10^3$–$10^4$ |
| Surface field | 1–3 G (mean) | 2–3 kG | ~1,000 |
| Largest flare energy | ~$10^{25}$ J | ~$10^{29}$ J | $10^4$ |
| Starspot coverage | < 1% | up to 30–50% | ~50 |

{{image: Stellar flare | An illustration of a stellar flare on a young, magnetically active star: the largest flares recorded on T Tauri stars release roughly ten thousand times the energy of the largest solar flares.}}

### Why

Both dynamo requirements are maximised at once. Young low-mass stars are fully or deeply convective, supplying the fluid motions a dynamo needs; and they rotate fast, supplying the rotational organisation. A vigorous dynamo follows from having both at their maximum simultaneously.

There is a saturation effect worth knowing. Above a critical rotation rate, the dynamo's output stops increasing — essentially all rapidly rotating young stars sit at $L_X/L_{bol} \approx 10^{-3}$ regardless of exactly how fast they spin. The activity is saturated, which is why the youngest stars form a well-defined ceiling in this ratio rather than a continuum that keeps rising with rotation rate.

As magnetic braking gradually slows the star, it eventually drops below the saturation threshold, and activity begins to decline with rotation — which is why activity level becomes, indirectly, an age indicator in its own right for older stars, even though it is uninformative about age while the star remains saturated.

This has a useful corollary for reading any individual star's history. Because saturation flattens the relationship between rotation and activity at young ages, an X-ray measurement alone cannot distinguish a star at one million years from a star at ten million years — both sit at the same saturated ceiling. It is only once a star has been braked enough to fall below the critical rotation rate that its X-ray-to-bolometric ratio begins tracking its age in a useful way, which means activity-based ages are least informative exactly where rotation-based ages are most informative, and most informative exactly where rotation-based ages start to become uncertain. The two indicators are complementary rather than redundant, each covering the range where the other is weakest.

### Why this matters outside stellar physics

Planets form in this environment.

A protoplanetary disk at 1 AU is being irradiated by a star emitting a thousand times the Sun's present X-ray flux, with flares ten thousand times more energetic, and a wind far denser than today's. That has direct consequences for the material assembling around it.

Disk ionisation is one. X-rays are the principal ionisation source in the outer regions of a protoplanetary disk, so the star's activity level determines where the magnetorotational instability can operate and hence where the cold, neutral dead zones of the disk lie.

Photoevaporation is another. X-ray and ultraviolet heating drives the disk dispersal that sets the deadline for giant planet formation, since a giant planet's hydrogen and helium envelope is only available while the disk's gas survives.

And atmospheric loss is a third. A young planet's atmosphere is exposed to extreme ultraviolet fluxes for its first few hundred million years. This is the environment in which Mars lost its atmosphere, and it is why whether a planet retains an atmosphere depends on the activity history of its host star across its first billion years, rather than on the star's present-day output alone.

### The faint young Sun

A related problem connects directly to the terrestrial planets.

Standard stellar models require the Sun to have been about 70% of its present luminosity at zero age, brightening steadily since.

{{image: Faint young Sun paradox | A schematic of solar luminosity rising over the main-sequence lifetime: standard stellar models place the young Sun at about seventy percent of its present brightness, in apparent conflict with geological evidence for liquid water on Earth from about four billion years ago.}}

| Age | $L/L_{\text{now}}$ |
|---|---|
| 0 | 0.71 |
| 1 Gyr | 0.76 |
| 2 Gyr | 0.82 |
| 4.57 Gyr | 1.00 |

This follows from basic stellar structure: as hydrogen fuses to helium, the mean molecular weight rises, the core must contract and heat to maintain pressure support, and the luminosity increases steadily across the main-sequence lifetime as a consequence.

Yet the geological record shows liquid water on Earth from about four billion years ago, and the equilibrium calculation with roughly 75% of present sunlight puts Earth well below freezing.

This is the faint young Sun paradox, identified by Sagan and Mullen in 1972, and it is not fully resolved. It requires a much stronger early greenhouse effect — high carbon dioxide, methane, or a different albedo — and the geochemical constraints on how much carbon dioxide was actually present at the time are awkward for the simplest version of that explanation.

The Sun's early behaviour is a boundary condition on planetary science, and it is set during this same pre-main-sequence phase. A star's first billion years determine what its planets can retain, both through the intensity of its high-energy radiation and through the trajectory of its rising luminosity.

## The lithium clock, and how to prove an object is not a star

One more diagnostic remains, and it does something unusual: it settles a categorical question rather than measuring a continuous quantity.

### Lithium burns early

Lithium-7 is destroyed by proton capture at about $2.5 \times 10^6$ K — well below the $1.5 \times 10^7$ K needed for hydrogen fusion.

A young low-mass star is fully convective, so its entire lithium supply is circulated through the core. Once the centre reaches $2.5 \times 10^6$ K, the star destroys all of its lithium, not merely the central portion of it.

| $M/M_\odot$ | Lithium depleted by |
|---|---|
| 0.075 | never |
| 0.3 | ~100 Myr |
| 0.5 | ~50 Myr |
| 1.0 | ~10–20 Myr |
| 1.3 | minimal depletion |

The behaviour at 1 $M_\odot$ is non-monotonic in a subtle way: as the star develops a radiative core, the convection zone withdraws from the burning region and depletion stops, leaving some lithium behind rather than continuing to a complete wipeout.

### Two uses

The presence of lithium in a cool star establishes youth, and the degree of depletion measures it. This is the standard confirmation that a candidate member of a young association is genuinely young rather than an unrelated foreground star observed along the same line of sight.

{{image: Brown dwarf | An artist's impression of a brown dwarf: below about 0.06 solar masses a contracting object's core is halted by electron degeneracy before it ever reaches lithium's ignition temperature, so its primordial lithium survives indefinitely — the basis of the lithium test.}}

The more elegant application is the lithium test itself. Below about 0.06 $M_\odot$, an object's core never reaches $2.5 \times 10^6$ K at all — electron degeneracy halts the contraction before it gets there. Such an object retains its primordial lithium forever.

$$\boxed{\text{Lithium detected in a cool object} \Longrightarrow \text{it is substellar}}$$

This is the cleanest available proof that something is a brown dwarf rather than a low-mass star, and it works because it is a threshold, not a measurement — the object either reached the temperature or it did not, and the lithium is either gone or it is not. It is how the first brown dwarfs were confirmed in 1995. There is an elegance worth noting explicitly: an object is proved not to be a star by demonstrating that it has failed to destroy something.

There is a caveat. A very young star will not yet have depleted its lithium either, so the test requires the object to be old enough for depletion to have occurred at its mass. It proves substellar status only for objects past the relevant depletion age for a star of comparable luminosity.

## Pulling the thread

A T Tauri star contracting from 5 to 1 $R_\odot$ should spin up by a factor of twenty-five, arriving on the main sequence with a period of 7.7 hours against a break-up period of 2.8 hours. Instead, young stars arrive with periods of days, and the Sun rotates in 25 days. Something removes angular momentum throughout the pre-main-sequence phase and for ten billion years afterward.

This is the same angular momentum problem recurring at a fourth scale. A collapsing core would arrive at 78 times break-up velocity if nothing intervened. A protostellar disk disposes of the surplus by transporting it outward and ejecting it in jets. The star itself is held back first by disk locking and then by magnetic braking. And the solar system preserves the outcome: the Sun holds 0.6% of the angular momentum despite holding 99.87% of the mass. The same physics solves it every time — a magnetic field enforcing co-rotation out to a large lever arm.

T Tauri stars divide by accretion, not by age directly. Classical objects have inner disks and accrete; weak-lined ones do not. Accretion is magnetospheric: the kilogauss field truncates the disk at a few stellar radii and channels material along field lines in near-free-fall. Free fall from 5 $R_\odot$ gives 553 km/s, matching the 200–300 km/s Hα line widths observed. And the surface shock produces both the ultraviolet excess and veiling — three observables, one cause.

Disk locking holds the star at the disk's angular velocity: inside the corotation radius — 16.8 $R_\odot$ for an eight-day period — the disk spins the star up; outside it, the disk slows the star down. The falsifiable prediction is that stars that lose their disks early should spin faster, and they do.

Skumanich's law, $v \propto t^{-1/2}$, makes rotation a clock. Gyrochronology works for isolated field stars, which almost nothing else does — but it fails for stars hotter than F5, since they lack a convective envelope, a dynamo, and hence any braking; it is calibrated on clusters and inherits their systematics; and there is evidence of weakened braking beyond solar age that would stop the clock exactly where it is most needed. Both of the two independent stellar clocks — rotation and the main-sequence turnoff — fail in the same regime, for unrelated reasons.

Young stars are magnetically extreme: X-rays $10^3$–$10^4$ times the Sun's, kilogauss fields, flares $10^4$ times more energetic, and up to half the surface spotted, because these stars are deeply convective and fast-rotating at once. The activity saturates, which is why the youngest stars form a ceiling rather than a continuum. Planets form in that environment, which sets disk ionisation and hence dead zones; drives the photoevaporation that imposes the deadline on giant-planet formation; and is the environment in which Mars lost its atmosphere. Alongside it sits the faint young Sun paradox — roughly 70% luminosity at zero age against liquid water on Earth from about four billion years ago — which remains unresolved.

And lithium provides a categorical test. Below 0.06 $M_\odot$ the core never reaches $2.5 \times 10^6$ K, so lithium survives. Detecting lithium in a sufficiently old, cool object proves it is substellar — an object shown not to be a star by demonstrating what it has failed to destroy.

One question follows naturally from all of this and belongs to the population rather than the individual object. Fragmentation sets a characteristic mass for a collapsing cloud core, outflows remove some of the resulting protostar's mass before it finishes accreting, and the intense radiation and winds of the pre-main-sequence phase strip still more from any surviving disk. What remains open is what determines how many stars of each mass a given cloud actually produces — and why the resulting distribution of stellar masses appears, across strikingly different environments, to come out looking much the same.

## Further reading

A detailed account of pre-main-sequence evolution, magnetospheric accretion and the rotational history of young stars is given in {{book: Lee Hartmann | Accretion Processes in Star Formation | 2009}}.

- **Lee Hartmann, *Accretion Processes in Star Formation*, second edition (2009).** A graduate-level treatment of the physics of accreting young stellar objects, covering magnetospheric accretion diagnostics, disk-locking models, angular-momentum evolution through the T Tauri phase, and the observational methods — Hα profiles, veiling, infrared excess — used to characterise them; the physical basis for most of the diagnostics described above.

## Problems

*Data: $G = 6.674\times10^{-11}$, $M_\odot = 1.989\times10^{30}$ kg, $R_\odot = 6.957\times10^{8}$ m, $L_\odot = 3.828\times10^{26}$ W, 1 yr = 3.156 × 10⁷ s, 1 AU = 1.496 × 10¹¹ m. Corotation radius $R_{co} = (GMP^2/4\pi^2)^{1/3}$. Skumanich: $P \propto t^{1/2}$. Sun: $P$ = 25 d at 4.57 Gyr. Lithium burns at 2.5 × 10⁶ K; hydrogen at 1.5 × 10⁷ K.*

### 1 — The star that should be spinning apart

**(a)** A T Tauri star has $P$ = 8 d at $R$ = 5 $R_\odot$. Compute its period on arrival at 1 $R_\odot$, assuming angular momentum is conserved.
**(b)** Compute the break-up period for 1 M☉ at 1 $R_\odot$, and express your answer to (a) as a fraction of break-up.
**(c)** State what is actually observed, both for young main-sequence stars and for the Sun.
**(d)** This is the angular momentum problem's fourth appearance across the scales described above. Name the other three, with the scale and resolution of each.
**(e)** State the single piece of physics common to all four solutions.

### 2 — Two kinds of T Tauri star

**(a)** Tabulate the observational differences between classical and weak-lined T Tauri stars.
**(b)** State the physical variable that distinguishes them, and explain why it correlates with age without being identical to it.
**(c)** Map each onto the corresponding infrared-based class of young stellar object.

### 3 — Reading accretion from a spectrum *(the convergence argument)*

**(a)** Describe magnetospheric accretion: what truncates the disk, and how does material reach the star?
**(b)** Compute the free-fall velocity from 5 $R_\odot$ to the stellar surface for 1 M☉.
**(c)** Compare with observed Hα line widths of 200–300 km/s and state what the comparison establishes.
**(d)** Compute the accretion luminosity for $\dot{M} = 10^{-8}\,M_\odot$/yr onto 1 M☉ at 1 $R_\odot$.
**(e)** Explain how the accretion shock produces both the ultraviolet excess and optical veiling.
**(f)** State why three observables with one cause is a stronger argument than one observable measured three times, and name one other place the same standard of independent convergence applies in establishing a physical picture.

### 4 — Disk locking

**(a)** Define the corotation radius and compute it for 1 M☉ with $P$ = 8 d. Express in $R_\odot$ and AU.
**(b)** Explain why disk material inside $R_{co}$ spins the star up and material outside slows it down.
**(c)** State the mechanism's falsifiable prediction and the observation that tests it.
**(d)** The mechanism is described as "observation solid, theory contested." Explain what is uncertain, and why this is a normal rather than an unsatisfactory state.

### 5 — Spin as a clock

**(a)** State Skumanich's law and the physical mechanism behind it.
**(b)** Explain why magnetic braking removes a large amount of angular momentum with a negligible loss of mass. Name the other process in this account where the same physics appears.
**(c)** Using $P \propto t^{1/2}$ calibrated on the Sun, predict rotation periods at 100 Myr, 1 Gyr and 8 Gyr.
**(d)** State the property that makes gyrochronology unusually valuable among stellar age indicators.
**(e)** Give three limitations, and explain why the third is the most serious.
**(f)** Both gyrochronology and the main-sequence turnoff lose precision at old ages, for unrelated reasons. State each reason, and comment on the consequence.

### 6 — Violently active

**(a)** Tabulate the Sun against a T Tauri star for X-ray fraction, surface field, flare energy and spot coverage.
**(b)** Explain why young low-mass stars have vigorous dynamos, naming both requirements.
**(c)** Explain dynamo saturation and its observational signature.
**(d)** Give three consequences of this activity for planet formation and evolution.

### 7 — The faint young Sun

**(a)** Explain why standard stellar models require the Sun to have been fainter early on. Give the physical chain.
**(b)** The Sun was ~70% as luminous at zero age. Estimate the effect on Earth's equilibrium temperature, given that $T_{eq} \propto L^{1/4}$ and the present value is 255 K.
**(c)** State the paradox and why it is a problem for the geological record.
**(d)** State the general requirement any resolution must satisfy, and why the problem is not considered settled.

### 8 — The lithium test *(a categorical result)*

**(a)** State the lithium burning temperature and compare with hydrogen. Explain why full convection matters.
**(b)** Explain why lithium depletion is a complete destruction rather than a partial one in a fully convective star.
**(c)** State the mass below which lithium survives indefinitely, and the physical reason.
**(d)** State the lithium test for brown dwarfs and explain why it constitutes a proof rather than an indication.
**(e)** Explain the caveat concerning very young objects.
**(f)** Comment on the logical structure: an object is shown not to be a star by demonstrating what it has failed to do. Name one other argument with the same shape.

### 9 — Open problem: does the clock stop?

Evidence suggests magnetic braking weakens beyond about solar age.
**(a)** State what weakened magnetic braking would mean physically, and what it would do to gyrochronology.
**(b)** Explain why this is particularly damaging, in terms of which stars most need an age.
**(c)** Name an independent method that could test whether an old field star's rotation has stalled, and state its limitation.
**(d)** Design a programme to establish whether the effect is real. State what you would measure and the systematic that would limit you.

## Worked answers

### 1 — The star that should be spinning apart

**(a)** $\omega \propto R^{-2}$, so $P \propto R^2$:
$$P_f = 8\ \text{d} \times (1/5)^2 = 0.32\ \text{d} = \mathbf{7.7\ hours}$$

**(b)** $v_{break} = \sqrt{GM_\odot/R_\odot} = 437$ km/s, so $P_{break} = 2\pi R_\odot/v_{break} = \mathbf{2.78\ hours}$.

$7.7/2.78 = 2.8$, so the star would rotate at about 36% of break-up velocity — severely oblate, and close enough to the limit to be structurally distorted.

**(c)** Young solar-type stars arriving on the main sequence have periods of a few days, not hours. And the Sun rotates in 25 days — a factor of about 200 slower than the naive prediction.

**(d)**

| Scale | Problem | Resolution |
|---|---|---|
| **Collapsing core** | A core collapsing with $j$ conserved arrives at 78× break-up | Angular momentum must be shed — a prohibition |
| **Protostellar disk** | Where does it go? | Viscous transport outward in a disk, plus magnetocentrifugal jets removing ~90% by ejecting ~10% of the mass |
| **T Tauri star** | The star itself would still spin up while contracting | Disk locking, then magnetic braking |
| **The solar system** | The Sun holds 99.87% of the mass and 0.6% of the angular momentum | The fossil record of the above |

**(e)** A magnetic field enforcing co-rotation out to a lever arm much larger than the object's own radius, so that a small mass carries away a disproportionate share of the angular momentum.

In the jets it is the Alfvén radius at a few times the launch radius; in disk locking it is the coupling to the disk beyond corotation; in magnetic braking it is the Alfvén radius in the stellar wind. Same mechanism, three settings, four scales.

### 2 — Two kinds of T Tauri star

**(a)**

| | CTTS | WTTS |
|---|---|---|
| Hα equivalent width | > 10 Å | < 10 Å |
| Infrared excess | strong | weak/absent |
| Accretion | ~$10^{-8}$ M☉/yr | none detected |
| Veiling | present | absent |
| Jets/forbidden lines | often | rare |

**(b)** Accretion — specifically, whether an inner disk is still present and feeding the star.

It correlates with age because disks disperse on a few-million-year timescale, so older objects are more likely to have lost theirs. But it is not identical to age: disk lifetimes vary considerably between objects of the same age, so a young star may have lost its disk early and an older one may retain it. Classifying by accretion sorts by disk status, and age enters only statistically.

**(c)** CTTS corresponds to Class II (disk present, envelope gone). WTTS corresponds to Class III (disk largely cleared). The two schemes classify the same objects by different observables — spectral index in the infrared versus emission-line strength in the optical — and agree, which is itself evidence that both are tracking the same underlying physical sequence.

### 3 — Reading accretion from a spectrum

**(a)** The star's kilogauss magnetic field is strong enough that its magnetic pressure exceeds the disk's ram pressure inside a few stellar radii, truncating the disk there.

Inside that radius, material can no longer orbit freely. It is captured onto field lines and channelled along them, falling in near-free-fall onto high-latitude regions of the stellar surface — not spiralling in through a boundary layer in the disk plane.

**(b)** $v = \sqrt{2GM_\odot(1/R_\odot - 1/5R_\odot)} = \sqrt{2(1.327\times10^{20})(0.8/6.957\times10^{8})} = \mathbf{553\ km/s}$

**(c)** Observed widths of 200–300 km/s are of the same order, and are what one expects for free fall along a trajectory inclined to the line of sight, so that only a component of the velocity is observed, with a spread of infall radii contributing.

It establishes that the emitting gas is in free fall from a few stellar radii, not orbiting. A boundary-layer model, in which material spirals in through the disk plane, predicts velocities characteristic of Keplerian orbits at the stellar surface, and a quite different line profile. The line width measures the depth of the gravitational well the gas has fallen through, and the answer points to the magnetosphere.

**(d)** $\dot{M} = 10^{-8} \times 1.989\times10^{30}/3.156\times10^{7} = 6.30\times10^{14}$ kg/s.
$L_{acc} = GM\dot{M}/R = (6.674\times10^{-11})(1.989\times10^{30})(6.30\times10^{14})/6.957\times10^{8} = 1.20\times10^{26}$ W $= \mathbf{0.31\ L_\odot}$

About half this if the material is taken to start from the truncation radius rather than from infinity — roughly 0.16 $L_\odot$ in that case.

**(e)** The infalling gas arrives at roughly 500 km/s and is stopped by the stellar surface, thermalising its kinetic energy in a shock concentrated over perhaps 1% of the area — the footprints of the accretion columns.

That small area radiating roughly 0.2 $L_\odot$ implies a temperature of 8,000–10,000 K, far hotter than the roughly 4,000 K photosphere. So it emits strongly in the ultraviolet — the observed UV excess.

And it adds continuum emission at optical wavelengths on top of the photospheric spectrum. Since absorption lines are measured as a depth relative to the local continuum, extra continuum makes them appear shallower — the effect called veiling. An unrecognised veiled spectrum leads to misclassification, because the weakened lines mimic a hotter star.

**(f)** Because three observables with one cause could each have failed independently, and did not. Line width could have been produced by rotation or turbulence; the ultraviolet excess by a hot chromosphere; veiling by an unresolved companion. That a single accretion geometry predicts all three quantitatively is what excludes the alternatives.

Measuring one observable three times reduces random error and leaves any systematic untouched — if the line-width interpretation is wrong, more line widths will not reveal it.

The same standard of independent convergence is what establishes, elsewhere, that Europa's ocean is real from magnetic induction together with crack geometry, or that Saturn's rings are transient from dust arriving together with material raining out.

### 4 — Disk locking

**(a)** $R_{co} = (GMP^2/4\pi^2)^{1/3}$ with $P = 6.91\times10^{5}$ s:
$$R_{co} = \left(\frac{(1.327\times10^{20})(4.78\times10^{11})}{39.48}\right)^{1/3} = 1.17\times10^{10}\ \text{m} = \mathbf{16.8\ R_\odot} = \mathbf{0.078\ AU}$$

**(b)** At $R_{co}$ the disk's Keplerian angular velocity equals the star's rotation rate. Inside it, the disk orbits faster than the star rotates, so a field line connecting the two is dragged forward by the disk and pulls the star along — spinning it up. Outside $R_{co}$, the disk orbits more slowly, so the field line is dragged backward relative to the star and acts as a brake.

The net torque is the balance of the two, weighted by how much magnetic flux connects to each region. The system tends toward a configuration in which the braking torque from beyond corotation offsets both the spin-up from inside it and the spin-up from contraction — so the star's rotation is locked to the disk while the disk lasts.

**(c)** Prediction: stars that lose their disks early should be spinning faster at a given age than stars that retain them, because they escaped the brake sooner and have been free to spin up during contraction.

Observation: in young clusters, members with infrared excess (disks present) rotate systematically more slowly than members without. The correlation holds across several clusters.

**(d)** What is uncertain: the magnitude and even the sign of the net torque depend on details that are hard to measure — how much flux actually connects star and disk, since field lines may open up rather than remaining closed; the field geometry, since a dipole behaves differently from a complex multipolar field, and T Tauri fields are observed to be complex; and how much of the braking is done by an accretion-powered stellar wind rather than by the star–disk connection itself.

Why this is normal rather than unsatisfactory: the observation — a correlation between disk presence and slow rotation — is robust and does not depend on any of these details. What is contested is the mechanism, and having a secure phenomenon with competing explanations is the ordinary condition of an active field. It becomes unsatisfactory only if the competing models make no distinguishable predictions, which here they do, since they differ in how the torque should scale with accretion rate and field strength.

### 5 — Spin as a clock

**(a)** $v_{rot} \propto t^{-1/2}$, equivalently $P \propto t^{1/2}$, for cool main-sequence stars.

Mechanism: magnetic braking. The star's magnetic field enforces co-rotation of its outflowing wind out to the Alfvén radius, many stellar radii out. Material released there carries specific angular momentum $\Omega r_A^2$ rather than $\Omega R_*^2$, so each departing particle removes far more than it possessed at the surface.

**(b)** Because the angular momentum carried per unit mass scales as the square of the lever arm. With $r_A/R_* \sim 10$–50 for a solar-type wind, each gram of wind removes 100–2,500 times the angular momentum of a gram at the surface.

The Sun loses ~$10^{-14}$ M☉/yr — about $10^{-4}$ of a solar mass over its entire lifetime, utterly negligible as a mass loss — and that has sufficed to slow it from a period of days to 25 days.

The same physics appears in the disposal of a protostellar disk's angular momentum, where a magnetocentrifugal jet ejecting 10% of the mass with a lever arm of 3 removes ~90% of the angular momentum. Jets do it violently over $10^5$ years; the wind does it gently over $10^{10}$.

**(c)** $P = 25(t/4570)^{1/2}$ days:
100 Myr → 3.7 d; 1 Gyr → 11.7 d; 8 Gyr → 33.1 d

**(d)** It works for isolated field stars.

Every other stellar age indicator requires either cluster membership, since the main-sequence turnoff needs a coeval population, or exceptional data, since asteroseismology needs long high-precision photometry and detectable oscillations. Gyrochronology needs only a rotation period, obtainable from a light curve showing starspots rotating in and out of view.

That is now available in bulk: space-based photometric missions have measured rotation periods for hundreds of thousands of stars, most of them field stars with no other route to an age.

**(e)** Only cool stars. Braking requires a magnetised wind, which requires a dynamo, which requires a convective envelope. Stars hotter than ~F5 have negligible convection zones and are not braked, which is why A and B stars remain rapid rotators.

Calibration on clusters, so it inherits cluster ages and their systematics — distance scale, metallicity, and the mass scale that enters the underlying lifetime relation.

Possible breakdown at old ages — evidence for weakened magnetic braking beyond a critical Rossby number, after which rotation stops evolving.

The third is most serious because it is not a limitation on precision but on validity: if rotation stalls, the relation is not merely imprecise for old stars but wrong, returning an age that is systematically too young with no internal indication of failure. And it fails precisely for old field stars, which are the population gyrochronology was most valuable for.

**(f)** Gyrochronology: rotation may stop evolving beyond roughly solar age, so the observable stops responding to the quantity being measured.

Main-sequence turnoff: turnoff mass scales as a weak negative power of time, so the turnoff mass changes by only a small fraction over the last several billion years of a population's age — the derivative is tiny, and distinguishing a twelve-billion-year-old population from a thirteen-billion-year-old one requires resolving a few percent in turnoff mass.

Consequence: the two independent stellar clocks degrade in the same regime for unrelated reasons, so they cannot cover for one another. Old stellar ages are poorly determined by any method, which is why globular cluster ages carry uncertainties of a gigayear or more and why the age of the oldest stars remains a soft number.

### 6 — Violently active

**(a)**

| | Sun | T Tauri | Ratio |
|---|---|---|---|
| $L_X/L_{bol}$ | $10^{-7}$ | $10^{-3}$–$10^{-4}$ | $10^3$–$10^4$ |
| Surface field | 1–3 G | 2–3 kG | ~1,000 |
| Flare energy | $10^{25}$ J | $10^{29}$ J | $10^4$ |
| Spot coverage | < 1% | 30–50% | ~50 |

**(b)** A dynamo needs a convecting, electrically conducting fluid and rotation to organise the flow.

Young low-mass stars maximise both: they are fully or deeply convective because they are cool and opaque, and they rotate rapidly because they have only just contracted and have not yet been substantially braked. Neither condition holds for the present Sun, which has a thin convective envelope and rotates in 25 days.

**(c)** Above a critical rotation rate — equivalently, below a critical Rossby number — the dynamo output stops increasing with rotation. Faster rotation produces no more magnetic activity.

Signature: essentially all rapidly rotating young stars sit at $L_X/L_{bol} \approx 10^{-3}$ regardless of their exact periods, forming a well-defined ceiling rather than a continuous relation. Only once braking carries a star below saturation does activity begin to decline with rotation — which is why activity itself becomes an age indicator for older stars but not for young ones.

**(d)** Disk ionisation. X-rays are the principal ionisation source in the outer disk, so stellar activity determines where the magnetorotational instability can operate and hence the extent of the disk's dead zones.

Photoevaporation. X-ray and extreme-ultraviolet heating drives the disk dispersal that sets the roughly five-million-year deadline for giant planet formation — and hence why the ice giants belong to a distinct compositional class from Jupiter and Saturn.

Atmospheric escape. Extreme ultraviolet flux drives thermal escape from young planetary atmospheres. This is the environment in which Mars lost its atmosphere, and it means atmospheric retention depends on a star's activity history, not its present output.

### 7 — The faint young Sun

**(a)** As hydrogen fuses to helium, four particles become one, so the mean molecular weight $\mu$ rises. For a given pressure, higher $\mu$ requires higher temperature, so the core must contract and heat to maintain hydrostatic support.

A hotter, denser core burns faster, so the luminosity rises steadily throughout the main-sequence lifetime. The Sun was ~70% as luminous at zero age and will be ~10% brighter than today in a billion years.

**(b)** $T_{eq} \propto L^{1/4}$, so $T = 255 \times 0.70^{0.25} = \mathbf{233\ K}$ — a drop of 22 K.

Water freezes at 273 K, and Earth's present equilibrium temperature of 255 K is already below that (the surface is habitable because of the greenhouse effect). At 233 K the required greenhouse forcing is substantially larger.

**(c)** The geological record shows liquid water on Earth from at least 4 Gyr ago — sedimentary rocks, and evidence from zircons for surface water even earlier — while the reduced solar luminosity implies a globally frozen planet under any present-day-like atmosphere.

The paradox: the physics of stellar evolution and the physics of planetary climate, each well established, give incompatible answers about the early Earth.

**(d)** Any resolution must supply a much stronger early greenhouse effect — enough additional radiative forcing to offset a 22 K drop in equilibrium temperature, sustained for billions of years and declining at just the right rate as the Sun brightened.

It is not settled because the obvious candidates are constrained. Very high carbon dioxide would leave a signature in ancient weathering products, such as palaeosols and siderite, that appears not to be present at the required levels. Methane helps but requires a biological source and is destroyed once oxygen appears. Lower albedo — less cloud, less continental area — helps but is hard to quantify.

The likely answer is a combination, and the difficulty is that a combination has enough free parameters to fit the data without being demonstrated.

### 8 — The lithium test

**(a)** Lithium-7 is destroyed by proton capture at 2.5 × 10⁶ K, against 1.5 × 10⁷ K for hydrogen — a factor of six lower.

Full convection matters because it means the star's entire lithium supply is circulated through the core. In a star with a radiative envelope, only the lithium already in the core is exposed to the burning temperature, and the rest is stranded, much as most of the Sun's hydrogen is stranded outside its own burning core.

**(b)** Because convection mixes the whole star on a timescale of months to years — far shorter than the nuclear timescale. So as fast as core lithium is destroyed, fresh lithium is brought down from the envelope.

The result is that the star destroys all of it, not a central fraction. Depletion is essentially complete once the core exceeds the burning temperature for long enough, and lithium abundance drops by orders of magnitude rather than by a factor of a few.

**(c)** Below about 0.06 M☉. The reason is electron degeneracy: in a very low-mass object, degeneracy pressure — which does not depend on temperature — takes over the support of the core and halts the contraction before the centre reaches 2.5 × 10⁶ K.

The core therefore never gets hot enough, and the lithium survives indefinitely.

This is the same physics that sets the hydrogen-burning limit at 0.08 M☉ and the deuterium-burning limit at 13 Jupiter masses, and that makes brown dwarfs come out roughly Jupiter-sized regardless of mass. Three thresholds, one mechanism.

**(d)** The lithium test: the detection of lithium in a cool object of sufficient age proves it is substellar — below 0.06 M☉ — because any object above that mass would have destroyed it.

It is a proof rather than an indication because it is a threshold, not a measurement. The object either reached 2.5 × 10⁶ K or it did not; there is no intermediate outcome, no calibration to fit, and no model-dependent inference from a continuous quantity. The observable is essentially binary.

Contrast the alternatives — a mass inferred from luminosity and an evolutionary track, or from a spectral type — both of which require models and give continuous, uncertain answers.

**(e)** A very young object has not had time to deplete its lithium either. At 1 Myr even a 0.3 M☉ star retains its full complement; depletion takes ~100 Myr at that mass.

So detecting lithium proves substellar status only if the object is old enough that a star of that luminosity would have depleted it. The test requires an independent age constraint — typically membership in a young association of known age, or the absence of other youth indicators.

**(f)** The structure: an object is classified by what it has failed to do.

The information is carried by a non-event — lithium that was not destroyed — and the argument works because the non-event is only possible under a specific physical condition that could not have been met otherwise.

Another example with the same shape: the argon deficit at Titan. Primordial argon condenses at temperatures similar to nitrogen gas, so a moon that accreted its nitrogen as N₂ ice would have brought argon along with it. Titan's atmosphere is nitrogen-rich and argon-poor, so the absence of argon proves the nitrogen arrived as ammonia instead. A noble gas that is not there identifies the chemical form of one that is.

### 9 — Open problem: does the clock stop?

**(a)** Physically: beyond a critical Rossby number — the ratio of rotation period to convective turnover time — the stellar magnetic field is thought to change configuration, becoming less organised on large scales, or the wind becoming less efficiently coupled, so that angular momentum loss drops sharply.

The consequence for gyrochronology is that rotation stops evolving. Period ceases to be a function of age, so the relation returns an age systematically too young for old stars, and the error grows with age — with no internal signal that anything is wrong.

**(b)** Because old field stars are precisely the population gyrochronology exists to serve.

Young stars can be dated by cluster membership, by lithium, by activity, and by their position above the main sequence. Old stars in clusters can be dated by the turnoff. But an old, isolated field star has essentially no other option — asteroseismology requires data most stars do not have, and the turnoff is unavailable without a coeval population.

So the method fails in the one regime where it has no competitor, and, worse, it is also the regime where the main-sequence turnoff loses precision. Both clocks degrade together.

**(c)** Asteroseismology. Oscillation frequencies constrain the interior structure and hence the age, independently of rotation, and this is exactly how the weakened-braking evidence was obtained: stars with seismic ages older than the Sun were found to rotate faster than gyrochronology predicts.

Limitation: it requires long, high-precision photometric time series and detectable oscillations, which restricts it to bright stars and to evolved or slightly evolved objects. It cannot be applied in bulk, so it can test the relation on a sample of tens to hundreds but cannot replace it for the hundreds of thousands of stars with measured rotation periods.

**(d)** Measure rotation periods and asteroseismic ages for the same stars, across a wide range of ages spanning the proposed transition, and test whether the period–age relation flattens.

What to measure: rotation periods from long-baseline photometry, and seismic ages from the same light curves where oscillations are detectable. Supplement with asteroseismic masses and radii, since the Rossby number depends on the convective turnover time, which depends on internal structure.

The limiting systematic is the detection of long rotation periods. An old, slowly rotating, magnetically quiet star has small, short-lived starspots and therefore a weak and incoherent photometric modulation, and periods approaching the length of an observing baseline are hard to recover at all.

That bias is exactly wrong for this test: stars that have stalled at short periods are easier to detect than stars that have continued braking to long ones. So a sample of old stars with measured periods is preferentially made of fast rotators, which would produce the appearance of weakened braking whether or not it is real.

Establishing the effect therefore requires quantifying the period-detection completeness as a function of period and age — the same discipline demanded of asteroid taxonomies, Kuiper Belt clustering and exoplanet occurrence rates elsewhere. Before concluding that a distribution has changed, it must first be established that the method could have detected the alternative.$astroYoungStars_master$,
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

with q as (
  select $astroYoungStars_quiz$[{"id": "q1", "type": "mcq", "prompt": "A protostar arriving on the Hayashi track at about five solar radii and rotating with a period of eight days should, by simple conservation of angular momentum, be rotating with a period of about 7.7 hours by the time it contracts to one solar radius, roughly a third of the 2.8-hour break-up period for a solar-mass star. Instead, young solar-type stars arrive on the main sequence with periods of a few days, and the Sun itself rotates in 25 days some 4.57 billion years later. What resolves this discrepancy?", "options": ["The contraction from five solar radii to one solar radius does not actually occur, so the naive calculation was based on a false premise from the start", "While the star still has a disk, magnetic coupling between the star and the disk locks the star's rotation to the disk's angular velocity so it cannot spin up despite contracting, and once the disk disperses a magnetized stellar wind continues removing angular momentum for billions of years afterward, which is why the Sun rotates in 25 days rather than a few hours", "Young stars simply never conserve angular momentum during contraction, because internal friction converts all of the rotational energy directly into heat and radiation", "The break-up period calculation is wrong, and a solar-mass star at one solar radius can safely rotate far faster than 2.8 hours without becoming unstable"], "answerIndex": 1, "explanation": "As long as an inner disk survives, the star's magnetic field couples it to the disk, and the star's rotation locks to the disk's angular velocity at the coupling radius rather than spinning up as the star itself contracts, a mechanism called disk locking. Once the disk disperses, the star does spin up as its contraction finishes, but a magnetized stellar wind then takes over: the field forces escaping wind particles to co-rotate out to many stellar radii before releasing them, so a mass loss of only about ten to the minus fourteen solar masses per year removes a disproportionate share of the star's angular momentum, following Skumanich's 1972 relation in which rotation velocity declines as the inverse square root of age. That combination, disk locking followed by magnetic braking, is why the Sun rotates in 25 days instead of the roughly 7.7 hours a naive contraction calculation would predict."}, {"id": "q2", "type": "mcq", "prompt": "Classical T Tauri stars show broad hydrogen-alpha emission lines with widths of 200 to 300 kilometers per second, an ultraviolet excess above the expected photospheric emission, and optical veiling that makes photospheric absorption lines appear shallower than expected. Why is the fact that all three of these observables point to the same magnetospheric accretion picture a stronger argument than any one of them measured with high precision?", "options": ["Because each observable individually is unreliable, so only the average of all three produces a trustworthy number", "Because each observable could plausibly have had a different cause acting alone, such as rotation or turbulence for the line width, a hot chromosphere for the ultraviolet excess, or an unresolved companion for the veiling, and the fact that a single accretion geometry correctly predicts all three quantitatively rules out those alternative explanations in a way that repeating one measurement cannot", "Because hydrogen-alpha, ultraviolet, and optical veiling measurements are always taken with the same instrument, so consistency between them merely confirms the instrument is well calibrated", "Because young stars have only one detectable spectral feature, so any apparent agreement between three separate observables is a statistical coincidence with no physical significance"], "answerIndex": 1, "explanation": "The magnetospheric accretion picture holds that a kilogauss stellar magnetic field truncates the inner disk at a few stellar radii and channels material onto the star in near free fall; free fall from five solar radii gives a velocity of about 553 kilometers per second, consistent with the observed 200 to 300 kilometer per second line widths for material falling along an inclined trajectory. The resulting shock, concentrated over roughly one percent of the stellar surface, heats a small area to 8,000 to 10,000 kelvin, which produces both the ultraviolet excess and, through added continuum emission, the veiling. Each of these three observables could in isolation have had an unrelated explanation, but a single accretion geometry predicting all three correctly at once is much harder to produce by coincidence than agreement among repeated measurements of just one quantity, which would only reduce random error while leaving any systematic misinterpretation untouched."}, {"id": "q3", "type": "mcq", "prompt": "Disk locking proposes that a young star's magnetic coupling to its inner disk prevents the star from spinning up while the disk survives. What falsifiable prediction does this mechanism make, and what has been observed?", "options": ["It predicts that stars should rotate faster the closer they are to the center of their host cluster, and this has been confirmed by measuring rotation as a function of projected cluster radius", "It predicts that stars which lose their disks early should be rotating faster at a given age than stars of the same age that still retain a disk, and in young clusters, members with infrared excess indicating a disk present are indeed observed to rotate systematically more slowly than members without a disk", "It predicts that all T Tauri stars should have identical rotation periods regardless of disk status, and this uniformity has been confirmed across every young cluster surveyed", "It predicts that disk-bearing stars should show no magnetic field at all, since the disk itself would completely screen the stellar field, and non-detections of stellar magnetism in disk-bearing stars have confirmed this"], "answerIndex": 1, "explanation": "If a magnetically coupled disk prevents a contracting star from spinning up, then a star that sheds its disk early has been free to spin up sooner than a star of the same age still locked to a surviving disk, so disk-bearing stars should rotate more slowly at a given age. This is exactly what is observed: across several young clusters, members showing an infrared excess, indicating a disk is still present, rotate systematically more slowly than members without one. The observed correlation is considered solid evidence for disk locking as a real phenomenon, even though the precise torque balance responsible for it, which depends on field geometry, how much magnetic flux actually connects star and disk, and the possible contribution of accretion-powered stellar winds, remains an actively contested area of modeling."}, {"id": "q4", "type": "mcq", "prompt": "Gyrochronology uses the observed decline of stellar rotation with age, following roughly an inverse square root relation first described by Andrew Skumanich in 1972, to estimate a star's age from its rotation period. What makes gyrochronology unusually valuable compared with other stellar age indicators, and where does it run into trouble?", "options": ["It is valuable because it requires no data collection at all beyond a star's spectral type, and it fails only for red giant stars, which have no useful application anywhere else in astrophysics", "It is valuable because, unlike the main-sequence turnoff which needs a coeval cluster population or asteroseismology which needs long high-precision photometry and detectable oscillations, gyrochronology needs only a light curve showing starspots rotating in and out of view, so it can date isolated field stars with no other age method available; it fails for stars hotter than roughly F5 that lack a convective envelope and hence a magnetic wind, it is calibrated on clusters and inherits their systematics, and there is evidence that magnetic braking weakens beyond roughly the Sun's age, which would stall the clock exactly where old field stars most need it", "It is valuable because rotation periods can be measured to arbitrary precision with any small telescope, and its only limitation is that it cannot be applied to stars younger than about one billion years", "It is valuable because it was calibrated using laboratory experiments rather than astronomical observations, and its only limitation is a modest loss of precision for stars more massive than the Sun"], "answerIndex": 1, "explanation": "Gyrochronology's distinguishing strength is that it requires only a rotation period, obtainable from a light curve showing starspots rotating in and out of view, which space-based photometric missions have now measured for hundreds of thousands of field stars that have no cluster membership to supply an age through the main-sequence turnoff and no data precise enough for asteroseismology. Its limitations are threefold: braking requires a magnetized wind driven by a convective-envelope dynamo, so stars hotter than about F5 are never braked and remain fast rotators regardless of age; the relation is calibrated against cluster ages and so inherits distance, metallicity, and mass-scale systematics from those clusters; and asteroseismic measurements of stars older than the Sun suggest magnetic braking weakens beyond a critical Rossby number, meaning rotation may simply stop evolving at old ages, which would make the method not just imprecise but wrong for exactly the old, isolated field stars it is most needed for."}, {"id": "q5", "type": "mcq", "prompt": "Lithium-7 is destroyed by proton capture at about 2.5 million kelvin, far below the 1.5 times ten to the seventh kelvin needed for hydrogen fusion, and a fully convective low-mass star circulates its entire lithium supply through its core, so it destroys all of its lithium rather than only a central fraction. Why does detecting lithium in a sufficiently old, cool object constitute a proof rather than merely an indication that the object is a brown dwarf?", "options": ["Because lithium is impossible to detect spectroscopically in any star, so its presence always indicates instrumental error rather than a real astrophysical signal", "Because below about 0.06 solar masses, electron degeneracy pressure halts an object's gravitational contraction before its core ever reaches 2.5 million kelvin, so the object can never burn its lithium at all; the outcome is a threshold rather than a continuous, model-dependent measurement, so the object either reached the ignition temperature or it did not, with no intermediate case", "Because lithium abundance increases steadily with an object's mass, so a precise lithium measurement can be used to read off an object's exact mass to high accuracy", "Because only brown dwarfs contain lithium in the first place, while ordinary stars are formed from lithium-free material and never acquire any"], "answerIndex": 1, "explanation": "Below roughly 0.06 solar masses, electron degeneracy pressure, which does not depend on temperature, takes over supporting the core before it ever reaches the 2.5 million kelvin needed to burn lithium-7, so an object below that mass retains its primordial lithium indefinitely. Because full convection ensures that any object above the mass threshold destroys essentially all of its lithium rather than merely a central fraction, the resulting observable is close to binary: lithium is present or it is not, with no intermediate, model-dependent inference required, unlike a mass estimated from luminosity and an evolutionary track. This threshold character is what let lithium detection serve as the confirming test for the first brown dwarfs in 1995, with the caveat that a genuinely young star, not yet old enough to have depleted its lithium regardless of mass, can mimic a substellar object unless an independent age constraint rules that out."}, {"id": "q6", "type": "open", "prompt": "Gyrochronology is often described as uniquely valuable because it works for isolated field stars where no other age-dating method is available, yet it is also described as having a serious failure mode tied to old ages. Explain what evidence suggests the rotation-age relation breaks down for stars older than about the Sun, why this failure is more damaging than the other two limitations of the method, and why it mirrors a weakness found in an entirely different stellar age indicator.", "rubric": "A strong answer should state that asteroseismic measurements of stars older than the Sun have found rotation rates faster than the Skumanich relation, rotation velocity declining as age to the power of minus one half, would predict, which is interpreted as evidence that magnetic braking weakens beyond a critical Rossby number, the ratio of rotation period to convective turnover time, at which point the large-scale field configuration or the wind coupling efficiency is thought to change so that angular momentum loss drops sharply and rotation essentially stops evolving with age. The answer should explain why this is worse than the other two limitations: unlike the restriction to cool stars with convective envelopes, which simply narrows the applicable population, or the inheritance of cluster-calibration systematics such as distance and metallicity uncertainties, which degrades precision predictably, a stalled clock returns an age that is systematically too young with no internal signal that anything has gone wrong, meaning the method fails silently rather than merely imprecisely. The answer should also connect this to which stars need the method most: old, isolated field stars have essentially no other route to an age, since they lack the coeval cluster population required for a main-sequence turnoff age and typically lack the long, high-precision photometric data with detectable oscillations required for asteroseismology, so gyrochronology's failure occurs exactly where it has no competitor to fall back on. Finally, a complete answer should note the parallel with the main-sequence turnoff itself, whose turnoff mass changes only slightly with time at old ages, meaning the turnoff also loses discriminating power for old populations, so two independent stellar clocks degrade in the same old-age regime for unrelated physical reasons, leaving old stellar ages poorly constrained by any single method and explaining why globular cluster ages and similar estimates carry uncertainties of a billion years or more."}, {"id": "q7", "type": "open", "prompt": "The angular momentum problem recurs across several distinct scales of star formation: a rotating cloud core would collapse to roughly 78 times break-up velocity if nothing intervened, a protostellar disk must transport and eject the angular momentum that has been shed, and a contracting T Tauri star should spin up toward break-up but does not. Explain, scale by scale, how each stage disposes of its angular momentum, and explain why the same underlying physical mechanism is said to solve the problem in every case.", "rubric": "A strong answer should walk through the scales in order. A collapsing, rotating cloud core conserving its angular momentum would reach roughly 78 times break-up velocity, a configuration that cannot physically exist, so angular momentum must be shed before collapse can complete at all. The resulting protostellar disk disposes of the shed angular momentum in two ways: viscous transport carries it outward through the disk itself, and magnetocentrifugal jets eject it entirely, with a magnetic lever arm of about three meaning that ejecting roughly ten percent of the mass removes roughly ninety percent of the angular momentum. Even after that, the star condensing out of the inner disk still faces its own version of the problem: contracting from about five solar radii to one solar radius while conserving angular momentum should spin it up to roughly a third of break-up velocity, arriving with a period of about 7.7 hours against a 2.8-hour break-up period, yet observed young stars arrive with periods of days. This final stage is resolved first by disk locking, in which the star's magnetic coupling to the surviving disk holds its rotation to the disk's angular velocity so it cannot spin up while the disk lasts, and then, once the disk disperses, by magnetic braking, in which a magnetized stellar wind continues removing angular momentum for billions of years, slowing the Sun from a period of days to 25 days despite losing only a negligible fraction of its mass in the process. The answer should conclude that all of these solutions rely on the same physics: a magnetic field enforcing co-rotation of escaping or transported material out to a lever arm much larger than the object's own size, so that a disproportionately small amount of ejected mass, transported material, or wind carries away a disproportionately large share of the angular momentum, which is also why the Sun today retains 99.87 percent of the solar system's mass but only about 0.6 percent of its angular momentum, the fossil record of all three earlier disposal stages."}]$astroYoungStars_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/stellar-physics/star-birth/young-stars', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
