-- Astronomy & Space · The Solar System — Giant Planets —
-- "Tidal Heating and Orbital Resonance". Curated, human-reviewed master for
-- astronomy-and-space/solar-system/giant-planets/tidal-heating @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- The energy source that has nothing to do with sunlight.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/giant-planets/tidal-heating',
    'research',
    'advanced',
    'read',
    $astroTide_master$> A body orbiting a massive primary on a non-circular orbit is continually flexed, and flexing dissipates energy as heat. That single sentence is the engine of the outer solar system: Io's volcanoes, Europa's ocean, Enceladus's geysers, the gaps in Saturn's rings, the arcs in Neptune's, Miranda's shattered face, and the whole case that the best place to look for life is far from the Sun are all one piece of physics running in different configurations. But the naive version — Jupiter's gravity squeezes Io, so Io is hot — is wrong as stated, and the reason it is wrong is the most interesting thing here. Tides should have circularised Io's orbit within a million years; the moon has been eccentric for four and a half billion. The real question is never "why is Io hot" — the heating follows trivially once eccentricity is granted. The question is: what keeps putting the eccentricity back? Answer that and the outer solar system opens up.

This is the most important idea in the study of the giant planets. It is not about an object but about a mechanism. Without it you learn a list of astonishing facts. With it you get a single machine that produces all of them, and the facts stop being separate.

{{image: Io (moon) | Io, the most volcanically active body in the solar system. Its entire surface is younger than a million years — impact craters are buried as fast as they form.}}

## The paper that beat the spacecraft

On 2 March 1979, the journal *Science* published a short paper by Stan Peale, Patrick Cassen and Ray Reynolds titled "Melting of Io by Tidal Dissipation."

Working from theory alone — orbital dynamics, a model of tidal flexing, and an estimate of how much energy that flexing would deposit — they concluded that Io's interior should be substantially molten, and closed with a sentence that has become famous in the field: that one might expect widespread and recurrent surface volcanism.

At the time, Io was a fuzzy orange dot. Nobody had seen a volcano anywhere except Earth. The prevailing expectation was that an 1,800-km ball of rock four and a half billion years old would be exactly what such a ball of rock that age should be: cold, dead, and covered in craters. Small bodies cool fast — the central lesson of the terrestrial worlds, and it had never failed.

Voyager 1 made its closest approach to Jupiter three days later, on 5 March 1979.

On 8 March, navigation engineer Linda Morabito was processing an over-exposed image of Io — taken to bring out background stars for spacecraft navigation, not for science — when she noticed an odd crescent-shaped blob protruding off the moon's limb. She checked for instrument artefacts. It was not an artefact.

It was a volcanic plume, throwing material 300 kilometres above the surface.

Io turned out to be the most volcanically active body in the solar system, with hundreds of active vents, lava lakes, and an entire surface younger than a million years — no impact craters at all, because they are buried as fast as they form.

Sit with the timeline. The prediction was published three days before the encounter and confirmed six days after it. Peale, Cassen and Reynolds did not fit a model to data; there was no data. They reasoned from mechanism to a specific, falsifiable, wildly counterintuitive prediction, and the universe complied within a week.

The discovery of Neptune is the classic case where Newtonian theory demanded an unseen planet and the sky produced it. This is the twentieth-century equivalent, and it is the reason to treat this material as being about a mechanism rather than a place. When you have the right mechanism, you can tell the spacecraft what it is going to find.

## Why there are tides at all

Start from the correct definition, because the popular one causes trouble later.

A tide is not a force. It is a difference of forces.

Gravity from a primary of mass $M$ falls off as $1/r^2$. So the near side of an orbiting body is pulled harder than its centre, and its centre is pulled harder than the far side. Work in the frame of the body's centre and those differences appear as a stretching along the line to the primary, and a squeezing perpendicular to it. The body is pulled into a prolate shape — a rugby ball — with two bulges, one facing the primary and one facing directly away.

The two-bulge structure is the diagnostic feature of tides and the thing that confuses everyone. The far bulge exists because that material is being pulled *less* than the centre and therefore falls behind.

Expand $1/r^2$ for a body of radius $R$ at distance $a$, and the leading differential term is

$$F_{\text{tidal}} \sim \frac{2GMmR}{a^{3}}$$

Note the exponent. Gravity goes as $a^{-2}$; tides go as $a^{-3}$. Tides are far more sensitive to distance than gravity is — and when we get to the *heating*, the sensitivity gets much worse still.

### How big is the bulge on Io?

Worth a number, because the scale is not intuitive. Taking Io's radius (1,822 km), Jupiter's mass, and Io's orbital distance (421,700 km), the equilibrium tidal bulge on Io is of order 6 kilometres.

Six kilometres of permanent distortion, on a body the size of our Moon. For comparison, Earth's solid-body tide — the flexing of the rock itself, not the ocean — is about 30 centimetres.

## Why a bulge does not heat anything

Now the subtlety that the popular account skips, and it is essential.

Consider Io on a perfectly circular orbit, rotating synchronously (one face always toward Jupiter — which Io does, as do almost all major moons, because tides enforce it). What happens?

The tidal bulge points at Jupiter. Io keeps the same face toward Jupiter. Therefore the bulge stays in the same place on Io, permanently, and never moves relative to the rock.

Nothing flexes. Nothing dissipates. No heat.

Io would be a permanently rugby-ball-shaped body with a fixed 6-km bulge and a completely cold interior. A static deformation, however enormous, does exactly nothing. You can bend a paperclip once and it barely warms; it heats up when you bend it back and forth.

So "Jupiter squeezes Io and that makes it hot" is not merely imprecise — it identifies the wrong quantity. The heating does not come from the size of the tide. It comes from the tide *changing*.

### What makes it change

Three ways, in order of importance for our purposes:

**1. Eccentricity — this is the big one.** On an elliptical orbit two things vary over each circuit:

- The distance varies, so the bulge's *height* pumps up and down. Closer to Jupiter, bigger bulge; further, smaller. Io's surface rises and falls by roughly 100 metres twice per 42-hour orbit. This is the radial tide.
- The angular speed varies (Kepler's second law — faster at periapsis, slower at apoapsis), while the moon's *rotation* stays constant. So the direction to Jupiter oscillates back and forth in the moon's own frame, and the bulge swings side to side across the surface. This is the librational tide, and for many bodies it dominates.

**2. Obliquity.** If the spin axis is tilted, the bulge migrates in latitude over each orbit.

**3. Non-synchronous rotation.** If the body has not been tidally locked, the bulge sweeps right around it — enormously dissipative, which is exactly why it does not last: it drives the body into synchronous rotation quickly and then shuts itself off.

For the major moons, (3) is long finished and (2) is small. So virtually all tidal heating in the solar system traces back to eccentricity, and that fact is what turns this into a story about resonance.

## The formula, and the tyranny of the sixth power

The standard expression for the tidal power dissipated in a synchronously rotating satellite at small eccentricity:

$$\dot{E} = \frac{21}{2}\,\frac{k_2}{Q}\,\frac{G M_p^{2}\, n\, R^{5}\, e^{2}}{a^{6}}$$

where $M_p$ is the planet's mass, $n$ the orbital mean motion, $R$ the satellite's radius, $e$ its eccentricity, and $a$ its orbital radius. The factor $k_2/Q$ carries all the messy internal physics: $k_2$ is the Love number, measuring how readily the body deforms, and $Q$ is the quality factor, measuring how poorly it stores elastic energy — high $Q$ means a good spring that returns energy, low $Q$ means a lossy material that turns it into heat.

Read the exponents, because they do all the explanatory work:

| Dependence | Meaning |
|---|---|
| $\propto e^{2}$ | **No eccentricity, no heat.** Zero, not "a little." |
| $\propto R^{5}$ | Bigger bodies heat vastly more |
| $\propto a^{-6}$ | **Brutal** distance sensitivity |
| $\propto k_2/Q$ | Interior structure — soft and lossy heats far more than stiff and elastic |

That $a^{-6}$ deserves a moment. Double the orbital distance and tidal heating drops by a factor of 64. Move out by just 60% and it drops sixteenfold. This is why tidal heating produces such violent contrasts between neighbouring moons in the same system — contrasts that no other energy source in planetary science can generate.

### Does it work?

Apply it to the Galilean moons, with $k_2/Q = 0.015$ — the value calibrated to Io:

| Moon | $a$ (Mm) | $e$ | Predicted $\dot{E}$ (W) | Surface flux (W/m²) |
|---|---|---|---|---|
| **Io** | 421.7 | 0.0041 | 9.3 × 10¹³ | **2.24** |
| **Europa** | 671.0 | 0.0094 | 7.0 × 10¹² | 0.23 |
| **Ganymede** | 1,070.4 | 0.0013 | 5.5 × 10¹⁰ | 0.001 |
| **Callisto** | 1,882.7 | 0.0074 | 1.7 × 10¹⁰ | ~0.0002 |

Io's measured heat output is about 10¹⁴ W, roughly 2 W/m². Earth's geothermal flux is 0.087 W/m². Io radiates about twenty-five times more heat per square metre than Earth does, from a body with a twelfth of Earth's diameter and no radioactive advantage whatsoever.

And look at the collapse down the column: Io to Callisto is a factor of five thousand, produced almost entirely by that $a^{-6}$. Four moons in one system, formed together from the same disk, spanning four orders of magnitude in internal heating.

A caution: using Io's $k_2/Q$ for all four is a simplification. That factor depends on interior structure and differs from moon to moon — and further on we will meet a case where ignoring it produces exactly the wrong answer.

## The real question

Now the step that almost everyone skips, and which turns this from a formula into a problem.

Tidal dissipation does not only produce heat. It also damps eccentricity. The energy being converted to heat is coming out of the orbit, and the orbit responds by becoming more circular. That is not incidental — it is the same process viewed from the other end. Tidal heating is self-extinguishing.

So compute how long it takes. Using the same $k_2/Q$ that reproduces Io's heat output:

| Moon | Eccentricity damping timescale |
|---|---|
| **Io** | **~0.2 Myr** |
| **Europa** | ~3.6 Myr |
| **Enceladus** | ~0.5 Myr |

The solar system is 4,568 Myr old.

Io's orbit should have circularised roughly twenty thousand times over. By any reasonable accounting, Io should be a cold, dead, cratered rock on a perfectly circular orbit — precisely what everyone expected before 1979.

It is not. Its eccentricity is small (0.0041) but it is stubbornly, measurably nonzero, and it has to be, because the volcanoes are running right now.

So the question was never "why is Io hot." The heating formula answers that trivially given $e$. The question is: what is putting the eccentricity back?

This is worth pausing on as a piece of scientific method. The formula above is not the explanation — it is the *statement of the puzzle*. An explanation that requires a quantity which should not exist has not finished. Peale, Cassen and Reynolds's paper is celebrated for predicting the volcanoes, but its real content was recognising that Io's eccentricity is maintained, and by what.

## The Laplace resonance

Look at the orbital periods of the inner three Galilean moons:

| Moon | Period (days) | Ratio to Io |
|---|---|---|
| Io | 1.769138 | 1 |
| Europa | 3.551181 | 2.0073 |
| Ganymede | 7.154553 | 4.0441 |

Nearly 1 : 2 : 4. Not exactly — and the inexactness is itself meaningful — but the near-integer relationship is not an accident of rounding. The precise statement, in terms of mean motions $n = 2\pi/P$, is the Laplace relation, identified by Laplace in 1805:

$$n_{\text{Io}} - 3n_{\text{Europa}} + 2n_{\text{Ganymede}} = 0$$

Evaluate it with modern values and you get $-5.8\times10^{-12}$ rad/s against $n_{\text{Io}} = 4.1\times10^{-5}$ rad/s — satisfied to about one part in ten million. Three independent moons, each free to orbit at any period whatsoever, obeying an exact linear relation to seven decimal places.

That is not a coincidence. It is a lock.

{{image: Laplace resonance | The 1:2:4 Laplace resonance of Io, Europa and Ganymede. Repeated conjunctions at fixed orbital phases force eccentricity faster than tides can erase it.}}

### What a resonance does

In a mean-motion resonance, conjunctions between two moons occur repeatedly at the same points in their orbits, rather than being scattered around. A random gravitational tug in a random place averages away over time. A small tug delivered in the same place every time, for four billion years, does not.

The consequence of the Laplace lock is that each moon receives a periodic pull that is always applied at the same phase of its orbit, and the effect accumulates. The result is a forced eccentricity — an eccentricity actively maintained by the other moons, against tidal damping that is constantly trying to erase it.

There is also a beautiful geometric consequence: because of the relation, all three moons can never be in conjunction simultaneously. When Io and Europa line up, Ganymede is elsewhere. The configuration has been running for billions of years and will never once produce a triple alignment.

So the answer to the sharpened question is:

> Io's eccentricity is maintained by Europa and Ganymede. Tides drain it; the resonance refills it. The volcanoes are the visible sign of that continuous tug-of-war.

### Where the energy actually comes from

Follow the chain all the way back, because the endpoint is genuinely surprising.

Io raises a tidal bulge on Jupiter. Jupiter rotates in 9.9 hours, much faster than Io orbits in 42, so Jupiter's bulge is dragged ahead of the line to Io by its own internal friction. That leading bulge pulls Io forward, torquing angular momentum out of Jupiter's spin and into Io's orbit — the same mechanism by which the Moon recedes from Earth at 3.8 cm/year while Earth's day lengthens.

That energy flows into the resonant system, where it is partitioned between orbital expansion and forced eccentricity, and the eccentricity is then converted into heat inside Io.

Chain complete:

> Jupiter's rotation → tidal torque → orbital energy → resonantly forced eccentricity → flexing → melting → volcanoes.

Io's volcanoes are powered by Jupiter's spin. Not by radioactivity, not by leftover formation heat, not by sunlight. By the rotation of the planet it orbits, delivered through a three-body resonance.

And the budget is comfortable: Io has radiated of order 10³¹ J over the solar system's lifetime, against Jupiter's rotational kinetic energy of roughly 3.6 × 10³⁴ J. Io has cost Jupiter about 0.04% of its spin. The planet pays for the most volcanically active body in the solar system out of small change, and its day lengthens imperceptibly.

## Two icy moons, and why the formula is not enough

Now the case that stops this from being too tidy — a case worth dwelling on because it shows a correct formula giving a confidently wrong answer.

Saturn has two small inner icy moons of comparable size:

| | $a$ (Mm) | $e$ | Radius (km) |
|---|---|---|---|
| **Mimas** | 185.5 | **0.0196** | 198 |
| **Enceladus** | 237.9 | 0.0047 | 252 |

Mimas is closer to Saturn, and has an eccentricity four times larger. Feed both into the heating formula with the same $k_2/Q$, and the prediction is unambiguous:

> Mimas should be heated about 34 times more strongly than Enceladus.

Observed:

- Mimas is a dead, heavily cratered ball of ice, dominated by the enormous Herschel crater. No activity of any kind.
- Enceladus is erupting. Cassini found more than a hundred geysers venting water from fractures at the south pole, radiating roughly 15.8 GW, feeding Saturn's E ring, and drawing from a global subsurface ocean.

The formula does not merely underperform. It gets the ordering backwards, on the two bodies where it should be most reliable.

{{image: Enceladus | Enceladus venting water vapour from south polar fractures. More than a hundred geysers radiate about 15.8 GW and feed Saturn's E ring, though the formula predicts Mimas should be far more active.}}

### What is missing

Two things, and both matter.

**First: $k_2/Q$ is not a constant, and it is not a detail.** It encodes how easily the body deforms and how lossily. A stiff, cold, undifferentiated ball of solid ice has a very small $k_2$ — it barely flexes, so it barely dissipates, no matter how hard you pull. A body with a global liquid ocean beneath a thin ice shell is a completely different mechanical object: the shell is decoupled from the interior and free to flex enormously, and dissipation can be orders of magnitude higher.

So the presence of an ocean is not only a *consequence* of tidal heating. It is a precondition for efficient tidal heating. That is a positive feedback, and it means these systems have two stable states — cold and stiff and quiet, or warm and soft and loud — with the transition between them abrupt rather than gradual. Mimas and Enceladus may sit on opposite sides of that transition.

**Second: not all resonances pump the same thing.** Both moons are in 2:1 mean-motion resonances, but with different partners and, crucially, of different *types*:

- Enceladus–Dione is an eccentricity-type resonance. It forces eccentricity, which drives heating. This is the Io situation.
- Mimas–Tethys is an inclination-type resonance. It forces orbital *inclination* — tilt — which does far less to flex a synchronously rotating body.

Mimas has the wrong kind of resonance. Its large free eccentricity is a leftover, not a maintained quantity, and its stiff interior converts almost none of it to heat.

### A twist worth knowing

In 2024, an analysis of Mimas's orbital motion and libration argued that Mimas may in fact possess a young subsurface ocean, formed only some 5–15 million years ago and not yet expressed at the surface. If that holds up — and it is contested — then Mimas is not the counterexample it appears to be, but a body caught in the act of transition, with an ocean too new to have modified a surface that still records the last four billion years.

This is worth noting partly because it is genuinely interesting and partly for what it says about the state of the field. It is a live argument about a moon already visited with a flagship mission, being settled by re-analysing archival data on orbital wobbles measured to metres. The Cassini dataset is still producing first-order results a decade after the spacecraft was destroyed.

## Nothing about this is steady

So far the machine has been described running in equilibrium. It is not, and the departure from equilibrium is the part with the sharpest consequences.

### Enceladus is emitting too much

Take the resonance as given and compute how much power Enceladus should be dissipating in steady state — the rate at which the Enceladus–Dione resonance can supply energy, balanced against damping. The answer is roughly 1.1 GW.

Cassini measured the south polar heat output at approximately 15.8 GW.

More than ten times too much. And this is not a measurement dispute; the flux was mapped directly in the infrared. Two readings are available:

1. We are watching at an unusual time — Enceladus is currently in a burst of activity that will subside.
2. The system oscillates, spending long intervals accumulating eccentricity with a stiff cold interior, then episodes of vigorous heating that soften the body, raise dissipation, drain the eccentricity, and shut down again — a thermal–orbital limit cycle.

Both amount to the same conclusion: tidal heating is episodic, not constant. Given the feedback identified above — heating softens the interior, which raises $k_2/Q$, which increases heating — oscillation is what you should expect. A system with positive feedback and a finite reservoir does not sit still.

### Resonances are temporary

Nor are the resonances permanent fixtures. Moons migrate — tidal torques from the planet push them outward — and they migrate at *different rates*. A resonance is entered when differential migration brings two moons into a commensurable period ratio and the configuration captures; it is exited when the same drift, or a perturbation, breaks the lock.

Measurements of Saturn's moons show them migrating outward considerably faster than classical tidal theory predicts, which has driven a rethink built around resonance locking, in which a moon's orbital frequency stays coupled to an oscillation mode inside the planet itself and is dragged outward as the planet slowly evolves. If that is right, Saturn's satellite system is being restructured on timescales far shorter than the age of the solar system, and its current configuration is recent.

The resonances we observe are a snapshot of a changing arrangement, not a permanent feature of the system.

### Fossils

Which means moons should carry records of heating episodes they are no longer in, and several do:

- **Ganymede's grooved terrain** — vast systems of parallel ridges and troughs covering much of the surface, indicating a period of intense tectonic activity and internal heating that Ganymede's present, modest tidal heating (a thousandth of Io's flux, from the Galilean table above) cannot begin to explain. The natural reading is a past epoch of much stronger forcing, plausibly while Ganymede was captured into or evolving through the Laplace resonance.
- **Miranda**, 470 km across, with terrains that do not match and a 20-km scarp, on a body that should be a dead cratered ball. A past resonance with Umbriel is a leading explanation.
- **Tethys and Dione** both show extensional tectonics inconsistent with their present state.

{{image: Ganymede (moon) | Ganymede's grooved terrain records intense past tectonism. Its present tidal flux, a thousandth of Io's, cannot produce it — the surface is a fossil of a resonance the moon is no longer in.}}

### Why this matters more than it looks

For astrobiology, the shift from "is this moon heated" to "how long has this moon been heated" is the whole game. Life, as far as we can reason about it, needs time — plausibly hundreds of millions of years of continuous liquid water and stable chemistry.

An ocean that has existed for four billion years is a candidate biosphere. An ocean that formed ten million years ago is a chemistry experiment that has barely started. They look identical from orbit.

So the question a mission to an ocean world must answer is not only *is there water* but *how old is the water* — and that is a far harder measurement.

## The consequence that redraws the map

Now the payoff, and it is large enough that it reorganises how we think about habitability generally.

The habitable zone, as classically defined, is the range of distances from a star where a rocky planet with an atmosphere could sustain liquid water on its surface. For the Sun, the conservative estimate runs from about 0.95 to 1.67 AU. It is drawn around starlight, and every term in it — flux, albedo, greenhouse forcing — traces back to the star.

Now list where the solar system's liquid water actually is:

| Body | Distance | Inside the habitable zone? |
|---|---|---|
| Earth | 1.0 AU | Yes |
| Europa | 5.2 AU | No |
| Ganymede | 5.2 AU | No |
| Callisto | 5.2 AU | No |
| Enceladus | 9.5 AU | No |
| Titan | 9.5 AU | No |
| Triton | 30.1 AU | No |

Europa's ocean alone is generally estimated to hold roughly twice the water of all Earth's oceans combined; Ganymede's may hold more still. Add the rest and the conclusion is not close:

> The overwhelming majority of the solar system's liquid water lies outside the habitable zone, in bodies heated by orbital dynamics rather than by sunlight.

The habitable zone is not wrong. It is answering a narrower question than it is usually taken to answer — where can water be liquid *on a surface*, *under an atmosphere*, *warmed by a star*. Relax any of those and the map changes completely. Tidal heating relaxes the third, and there is no reason in principle it could not operate around a dim red dwarf, a brown dwarf, or a giant planet ejected into interstellar space with its moons intact.

Tidal heating is an energy source with no dependence whatsoever on a star.

{{image: Europa (moon) | Europa's fractured ice shell floats on a global ocean estimated at roughly twice the volume of all Earth's oceans — kept liquid by tidal heating, far outside the Sun's habitable zone.}}

### But it has its own Goldilocks problem

Do not over-rotate into optimism. Tidal heating is not uniformly friendly, and the Galilean moons demonstrate the full range in one system:

- **Io: too much.** At 2 W/m² of tidal flux, Io has been so thoroughly heated for so long that it has lost essentially all its volatiles. It is bone dry, resurfaced faster than anything can accumulate, sulfurous, and about as hostile as a solid surface gets. Tidal heating did not make Io habitable; it sterilised it.
- **Europa: plausibly right.** Enough to maintain a liquid ocean beneath a protective ice shell, not enough to boil it away or resurface it continuously.
- **Ganymede: marginal**, with an ocean sandwiched between ice layers rather than resting on rock — which matters, because water–rock contact is where the interesting chemistry happens.
- **Callisto: too little.** Outside the resonance, barely differentiated, geologically inert. The control case — same formation, same disk, same composition, no resonance, no activity. It is the single best piece of evidence that resonance rather than distance or size is what decides.

The window is narrow, and it is set not by distance from the star but by where you sit in a resonant chain.

## Pulling the thread

- Tides are differential forces, going as $a^{-3}$, raising two bulges.
- A static bulge does nothing. Heating requires the tide to *change*, which for synchronously rotating moons means it requires eccentricity.
- The heating scales as $e^2 R^5 a^{-6}$ times an interior factor — and that sixth power is why neighbouring moons in one system can differ by four orders of magnitude in internal heat.
- But tides damp eccentricity, on timescales of ~0.2 Myr for Io. So the orbits should be circular and the moons should be dead.
- They are not, because of orbital resonance. The Laplace lock among Io, Europa and Ganymede — exact to one part in ten million — forces eccentricity faster than tides can erase it.
- Trace the energy all the way back and Io's volcanoes are powered by Jupiter's rotation, delivered through a three-body resonance, at a cost of 0.04% of the planet's spin.
- The formula alone is not enough: Mimas should be heated 34× more than Enceladus and is dead instead, because interior structure ($k_2/Q$) and resonance *type* both matter — and because an ocean is not just a consequence of heating but a precondition for it, which makes the system bistable.
- Therefore heating is episodic. Enceladus emits ten times its equilibrium rate; Ganymede and Miranda carry fossils of episodes they are no longer in. The question for astrobiology becomes how old is the ocean, not merely whether there is one.
- And the map changes: most of the solar system's liquid water is outside the habitable zone, kept liquid by an energy source that does not require a star at all.

That last point is the sentence the rest of the giant-planet story is built on. Everything from here — the moons, the rings, the ocean worlds — is this machine running in different configurations.

{{image: Tidal heating | Tidal flexing on an eccentric orbit dissipates orbital energy as internal heat — a star-independent power source that keeps subsurface oceans liquid across the outer solar system.}}

## Further reading

The founding document is worth reading in the original: Peale, Cassen and Reynolds's 1979 *Science* paper is barely three pages long and remains one of the cleanest examples of a prediction preceding its confirmation. For the resonance dynamics, the standard graduate treatment of celestial mechanics develops the Laplace relation and mean-motion resonances from first principles; any solid text on solar-system dynamics will carry the derivation. The Cassini mission's Enceladus results, and the ongoing debate over its heat budget, are documented across the mission's published findings, and the 2024 Mimas young-ocean analysis can be followed through the primary literature — worth reading precisely because the argument is not yet settled. The magnetospheres material picks up directly from here: the volcanoes accounted for above are what inflate the largest structure in the solar system, and they are also the key to proving Europa's ocean exists without ever landing on it — a mission must answer how you establish that there is salt water under 20 km of ice when you cannot drill through it.

## Problems

Constants: $G = 6.674\times10^{-11}$. Jupiter $M = 1.898\times10^{27}$ kg, rotation 9 h 55 m, $I \approx 0.254MR^2$, $R = 69{,}911$ km. Saturn $M = 5.683\times10^{26}$ kg. Io: $a = 421{,}700$ km, $e = 0.0041$, $R = 1{,}822$ km, $P = 1.7691$ d. Europa: $a = 671{,}034$ km, $e = 0.0094$, $R = 1{,}561$ km, $P = 3.5512$ d. Ganymede: $P = 7.1546$ d, $a = 1{,}070{,}412$ km. Mimas: $a = 185{,}539$ km, $e = 0.0196$, $R = 198$ km, $P = 0.9424$ d. Enceladus: $a = 237{,}948$ km, $e = 0.0047$, $R = 252$ km, $P = 1.3702$ d. 1 yr = 3.156 × 10⁷ s.

Nine problems follow. Problem 2 is the conceptual heart and the one most people get wrong; problem 4 (the damping timescale) is the calculation that creates the problem this whole chapter solves; problem 6 (Mimas) is the case where the right formula gives the wrong answer; problem 9 is open.

### 1 — What a tide actually is
**(a)** Explain why a tidal force produces two bulges rather than one. Why is the far-side bulge there?
**(b)** Gravity falls off as $a^{-2}$; show why the leading tidal term goes as $a^{-3}$.
**(c)** Earth's solid-body tide is about 30 cm. Io's equilibrium bulge is about 6 km. Identify the two factors responsible for the difference and say which dominates.
**(d)** Why is "tidal force" a slightly misleading phrase?

### 2 — The mistake almost everyone makes *(the conceptual heart)*
**(a)** Consider a moon on a perfectly circular orbit, rotating synchronously. Describe what its tidal bulge does over one orbit, in the moon's own frame.
**(b)** How much energy is dissipated? Justify your answer physically, not by citing a formula.
**(c)** "Jupiter's gravity squeezes Io, so Io is hot." State precisely what is wrong with this, and give the corrected one-sentence version.
**(d)** Name the two distinct ways eccentricity makes the tide vary over an orbit. Which one is the *librational* tide, and what causes the libration?
**(e)** Non-synchronous rotation is enormously dissipative. Explain why that fact guarantees it is rare.

### 3 — Reading a formula
For $\dot{E} = \frac{21}{2}\frac{k_2}{Q}\frac{GM_p^2 n R^5 e^2}{a^6}$:
**(a)** State what happens to the heating if $e = 0$ exactly, and why this is qualitatively different from "a small amount of heating."
**(b)** Io is at 421,700 km and Europa at 671,034 km. Compute the factor by which the $a^{-6}$ term alone suppresses Europa's heating relative to Io's. Repeat for Ganymede at 1,070,412 km.
**(c)** Europa's eccentricity is 2.3× Io's, which raises its heating. Why does Io nonetheless out-heat Europa by more than an order of magnitude?
**(d)** What physics is hidden inside $k_2/Q$, and why is it dangerous to assume it is the same for all moons in a system?

### 4 — The self-extinguishing engine *(creates the problem)*
**(a)** Explain why tidal heating necessarily damps eccentricity. Where is the energy coming from?
**(b)** Io's eccentricity damping timescale is roughly 0.2 Myr. Express the solar system's age as a multiple of this.
**(c)** State, in one sentence, the actual problem this chapter exists to solve — and explain why "tidal heating makes Io hot" is not a complete answer.
**(d)** Peale, Cassen and Reynolds are celebrated for predicting Io's volcanoes. Argue that the more important content of their paper was something else.

### 5 — The lock
**(a)** Write the Laplace relation for Io, Europa and Ganymede. Evaluate it using the periods given and express the residual as a fraction of $n_{\text{Io}}$.
**(b)** Explain why a resonance produces a *sustained* effect where random gravitational encounters do not.
**(c)** Show that the three moons can never be in triple conjunction, and explain why this follows from the relation.
**(d)** Trace the energy powering Io's volcanoes back to its ultimate source, naming each link in the chain.
**(e)** Jupiter's rotational kinetic energy is about $3.6\times10^{34}$ J. Io has radiated of order $1.4\times10^{31}$ J over 4.5 Gyr. What fraction of Jupiter's spin has this cost, and what does the answer tell you about whether the mechanism can be sustained?

### 6 — When the right formula gives the wrong answer *(do not skip)*
**(a)** Using the formula and a common $k_2/Q$, compute the ratio of tidal heating for Mimas versus Enceladus. Which should be more active?
**(b)** State what is actually observed.
**(c)** Give the two distinct reasons the naive calculation fails.
**(d)** Explain why the presence of a subsurface ocean is not merely a *result* of tidal heating but a *precondition* for efficient tidal heating. What kind of dynamical behaviour does that feedback imply?
**(e)** A 2024 analysis suggested Mimas may have a very young ocean. If correct, does this rescue the naive calculation, complicate it, or neither? Justify.

### 7 — Not a steady state
**(a)** Enceladus's equilibrium tidal power is ~1.1 GW; Cassini measured ~15.8 GW. State the discrepancy and the two possible readings.
**(b)** Explain why the feedback of 6(d) makes oscillation the *expected* behaviour rather than a surprise.
**(c)** Ganymede's present tidal flux is about a thousandth of Io's, yet its surface shows vast grooved terrain implying intense past tectonism. Reconcile these.
**(d)** Explain why, for astrobiology, "how old is the ocean" is a more important question than "is there an ocean" — and why it is much harder to answer.

### 8 — Redrawing the map
**(a)** The Sun's conservative habitable zone runs roughly 0.95–1.67 AU. List the solar system bodies believed to hold liquid water and mark which fall inside it.
**(b)** State the conclusion about where the solar system's liquid water actually is.
**(c)** Is the habitable-zone concept therefore *wrong*? Answer carefully: say what question it correctly answers and which assumption tidal heating relaxes.
**(d)** Explain why tidal heating raises the possibility of habitable environments around brown dwarfs, or in systems with no star at all.
**(e)** Now argue against your own optimism, using Io.

### 9 — Open problem: designing the discriminating measurement
Enceladus emits ten times its equilibrium tidal power. The two explanations — that we are watching during an unusual burst, or that the system undergoes a long-period thermal–orbital oscillation — make different claims about the system's history.
**(a)** Why can neither be settled by measuring the present heat flux more precisely, however well you do it?
**(b)** Propose two independent measurements that would discriminate. For each, state what one hypothesis predicts and what the other predicts.
**(c)** The same ambiguity applies to Europa. Explain why it matters more there than at Enceladus.
**(d)** Suppose the oscillation model is right and Enceladus's ocean is only ~100 Myr old in its present warm state. What does that do to the astrobiological case for a sample-return mission — and does it make the mission more or less worth flying? Defend a position.

## Worked answers

### 1 — What a tide actually is

**(a)** Work in the frame of the body's centre of mass, which is in free fall toward the primary. In that frame, only the *differences* from the central acceleration are felt. Material on the near side is pulled more strongly than the centre and so accelerates toward the primary relative to it — a bulge on the near side. Material on the far side is pulled less strongly than the centre, so relative to the centre it lags behind — a bulge on the far side. The far bulge is not being pushed away; it is being left behind.

**(b)** Gravitational acceleration at distance $r$ is $GM/r^2$. Evaluate at $a \pm R$ and take the difference:

$$\Delta g = \frac{GM}{(a-R)^2} - \frac{GM}{a^2} \approx \frac{GM}{a^2}\left(1 + \frac{2R}{a} - 1\right) = \frac{2GMR}{a^{3}}$$

Differentiating $a^{-2}$ produces $a^{-3}$: taking a difference costs one power of distance.

**(c)** Two factors: the mass of the primary (Jupiter is 3.2 × 10⁵ times Earth's mass, while Io orbits at 421,700 km versus the Moon's 384,400 km — so the raising body is vastly more massive at a comparable distance), and the rigidity of the raised body (Io is smaller and less self-gravitating, so it resists deformation less). The mass of the primary dominates overwhelmingly — the tide-raising potential at Io from Jupiter exceeds that at Earth from the Moon by a factor of order 10⁵.

**(d)** Because there is no such force. A tide is a gradient — a residual left over after subtracting the uniform acceleration that everything shares. Calling it a force invites you to think a body can be "squeezed harder" without anything changing, which leads directly to the error in problem 2.

### 2 — The mistake almost everyone makes

**(a)** Nothing. The bulge points at the primary; the moon keeps one face toward the primary; therefore the bulge sits at a fixed location in the moon's own frame and remains there permanently. The moon is a static rugby ball.

**(b)** Zero (to first order). Dissipation requires material to be worked — strained and released repeatedly, with internal friction converting mechanical energy to heat on each cycle. A constant strain does no work after it is first established. Bend a paperclip once and it barely warms; it heats when you bend it back and forth. A permanent 6-km bulge is a paperclip bent once.

**(c)** What is wrong: it identifies the magnitude of the tide as the heat source, when the relevant quantity is the time variation of the tide. A moon can have an enormous static bulge and be stone cold.

Corrected: Io is hot because its orbital eccentricity makes the tidal bulge change size and swing position over each 42-hour orbit, and that continual flexing dissipates energy as heat.

**(d)**
- **Radial tide:** the orbital distance varies over the ellipse, so the bulge's *height* pumps up and down — roughly 100 m on Io.
- **Librational tide:** by Kepler's second law the orbital angular speed varies, while the moon's rotation rate is constant. The two therefore drift in and out of step, so the direction to the primary oscillates back and forth in the moon's frame and the bulge swings across the surface. The libration is caused by the mismatch between uniform spin and non-uniform orbital motion.

**(e)** Precisely *because* it is so dissipative. Huge dissipation means the excess spin angular momentum is drained very rapidly, driving the body into synchronous rotation on a short timescale — after which the mechanism switches itself off. A process that efficient destroys its own preconditions, so at any given moment almost every major moon is already locked. (Mercury's 3:2 spin–orbit resonance is the interesting exception, held there by its own eccentricity.)

### 3 — Reading a formula

**(a)** The heating is exactly zero, not small. This is qualitatively different because it means eccentricity is not one contributing factor among several but a necessary condition — remove it and the mechanism does not weaken, it ceases. That is what makes the damping problem fatal rather than inconvenient.

**(b)** $(a_{\text{Io}}/a_{\text{Eu}})^6 = (0.6284)^6 = 0.0616$ → 16.2× suppression.
$(a_{\text{Io}}/a_{\text{Gan}})^6 = (0.3940)^6 = 0.00374$ → 268× suppression.

**(c)** Multiply all four ratios:

| Factor | Europa/Io |
|---|---|
| $a^{-6}$ | 0.0616 |
| $e^2$ | $(2.29)^2 = 5.26$ |
| $R^5$ | $(0.857)^5 = 0.462$ |
| $n$ | 0.498 |
| **Product** | **0.075** |

Europa's larger eccentricity helps it by a factor of 5.3, but distance costs it 16×, smaller radius costs 2.2×, and slower orbit costs 2×. The $a^{-6}$ term overwhelms everything else — which is the general lesson: in this formula, distance almost always wins.

**(d)** $k_2$ (the Love number) measures how readily the body deforms — set by rigidity, size, self-gravity, and above all internal layering. $Q$ measures how lossily — how much of the stored elastic energy is converted to heat per cycle rather than returned. Together they encode the entire interior. Assuming a common value across a system is dangerous because a stiff undifferentiated ice ball and a thin shell floating on a global ocean differ by orders of magnitude in $k_2/Q$, which is more than enough to reverse the ordering the geometric terms predict. See problem 6.

### 4 — The self-extinguishing engine

**(a)** The heat has to come from somewhere, and it comes from the orbit. Tidal dissipation converts orbital energy into thermal energy inside the satellite; the orbit responds by relaxing toward the minimum-energy state at fixed angular momentum, which is a circle. Heating and circularisation are the same process seen from opposite ends. Tidal heating consumes the very quantity that enables it.

**(b)** 4,568 / 0.2 ≈ twenty thousand damping timescales. Io's eccentricity should have been erased essentially completely, essentially immediately, on solar-system timescales.

**(c)** The problem: Io's orbit should be circular and Io should be cold, so what is actively maintaining its eccentricity against tidal damping? "Tidal heating makes Io hot" is incomplete because it takes $e$ as given, when $e$ is the thing that needs explaining — the formula converts eccentricity to heat, but supplies no eccentricity.

**(d)** Because predicting volcanoes from a heating formula is only impressive if the inputs are justified, and the input that needed justifying was $e$. Their substantive contribution was recognising that the Laplace resonance forces Io's eccentricity, and that this makes the heating *sustainable over the age of the solar system* rather than a brief transient. Without the resonance argument, the same formula would have predicted a moon that was briefly hot four billion years ago and is now dead — which is the wrong prediction. The resonance is what makes the prediction about the present tense.

### 5 — The lock

**(a)** $n_{\text{Io}} - 3n_{\text{Eu}} + 2n_{\text{Gan}} = 0$, with $n = 2\pi/P$:

$n_{\text{Io}} = 4.111\times10^{-5}$, $n_{\text{Eu}} = 2.048\times10^{-5}$, $n_{\text{Gan}} = 1.017\times10^{-5}$ rad/s.

Residual $= -5.8\times10^{-12}$ rad/s, i.e. 1.4 × 10⁻⁷ of $n_{\text{Io}}$ — about one part in ten million.

**(b)** Because of coherent accumulation. A gravitational tug applied at a random orbital phase adds a perturbation of random sign; over many orbits these average toward zero. In resonance, conjunctions occur repeatedly at the same orbital phase, so every tug pushes the same way and the perturbations add rather than cancel. A minuscule force applied coherently for 10¹² orbits produces an enormous cumulative effect. This is the same reason a child on a swing is driven by tiny pushes delivered in time.

**(c)** Triple conjunction requires Io–Europa and Europa–Ganymede alignments to coincide. The Laplace relation fixes the conjunction longitudes such that the Io–Europa conjunction always occurs when Ganymede is elsewhere — formally, the resonant angle librates about 180°, which is precisely the statement that the configuration avoids triple alignment. The relation is not merely a period ratio; it is a constraint on phases, and the phase it enforces is anti-alignment. (It is also why the configuration is stable: it minimises the mutual perturbation.)

**(d)** The chain:
1. Jupiter's rotation (9.9 h) is faster than Io's orbit (42 h).
2. Io raises a tidal bulge on Jupiter; internal friction drags that bulge ahead of the Jupiter–Io line.
3. The leading bulge exerts a forward torque on Io, transferring angular momentum and energy from Jupiter's spin into Io's orbit (and slowing Jupiter's rotation imperceptibly).
4. The Laplace resonance partitions that energy, maintaining a forced eccentricity on all three inner moons.
5. Eccentricity drives the varying tide inside Io.
6. Flexing dissipates as heat; the interior melts; volcanoes.

**(e)** $1.4\times10^{31}/3.6\times10^{34} = $ about 0.04%. The mechanism is enormously sustainable: Jupiter has spent four-hundredths of one percent of its rotational energy over the age of the solar system. There is no danger of exhaustion — the constraint on Io's activity is the *rate* at which the coupling delivers energy, not the size of the reservoir. Jupiter pays for the solar system's most volcanically active body out of small change.

### 6 — When the right formula gives the wrong answer

**(a)** Ratio $= \dfrac{e_M^2 R_M^5 n_M / a_M^6}{e_E^2 R_E^5 n_E / a_E^6}$. Mimas gains from higher $e$ (4.17× → 17.4× in $e^2$), from closer orbit ($(237.9/185.5)^6 = 4.5\times$) and from faster orbit (1.45×), and loses on radius ($(198/252)^5 = 0.30$). Net: Mimas ≈ 34× Enceladus. Mimas should be dramatically the more active.

**(b)** The reverse. Mimas is a dead, heavily cratered ball, dominated by the Herschel crater and showing no activity of any kind. Enceladus is erupting — over a hundred geysers venting water from south polar fractures, ~15.8 GW of heat, feeding Saturn's E ring, drawing on a global subsurface ocean.

**(c)**
1. $k_2/Q$ is not common between them. Mimas is (or was long thought to be) a stiff, cold, largely undifferentiated ice ball with very low $k_2$ — it barely deforms, so it barely dissipates. Enceladus has a thin ice shell decoupled from the interior by a global ocean, which flexes freely and dissipates orders of magnitude more for the same forcing.
2. The resonances are of different types. Enceladus–Dione is a 2:1 eccentricity resonance, actively forcing $e$ and thus heating. Mimas–Tethys is a 2:1 inclination resonance, which pumps orbital *tilt* rather than eccentricity and does far less to flex a synchronously rotating body. Mimas's large eccentricity is a leftover, not a maintained quantity.

**(d)** Efficient dissipation requires the body to flex, and a rigid body cannot. A global ocean mechanically decouples the outer ice shell from the interior, letting the shell deform far more for the same tidal forcing — raising $k_2/Q$ by orders of magnitude. So: heating creates the ocean, and the ocean enables the heating.

That is positive feedback, and it implies bistability: the system has a cold, stiff, quiet state and a warm, soft, active state, with a threshold between them and a sharp transition rather than a gradual one. Two nearly identical moons can therefore end up in radically different conditions from small differences in history — which is a much better explanation of Mimas versus Enceladus than any smooth parameter difference.

**(e)** Neither, quite — it complicates it in an interesting direction. It does not rescue the naive calculation, because the naive calculation predicts Mimas should be *more* active than Enceladus, and even with a young ocean it plainly is not. What it does is undermine the clean version of the *explanation*: if Mimas has an ocean, it cannot be a simple stiff-body case. The better reading is that Mimas is caught mid-transition — recently crossed into the warm branch, with an ocean too young to have resurfaced anything, so its exterior still records four billion years of the cold state. That is entirely consistent with the bistability of (d) and is arguably stronger support for it: it means we may be watching a state change in progress. Note also that the result is contested and rests on inferring interior structure from centimetre-level librations, so hold it loosely.

### 7 — Not a steady state

**(a)** Observed exceeds equilibrium by a factor of >10 (15.8 GW versus ~1.1 GW). Readings: (i) we are observing during an atypical burst that will subside; or (ii) the system undergoes a thermal–orbital limit cycle, alternating long quiet intervals of eccentricity accumulation with shorter active episodes that drain it. Both imply the same headline: the heating is not in steady state.

**(b)** Because a system with positive feedback and a finite reservoir cannot equilibrate stably. Heating softens the interior → raises $k_2/Q$ → increases dissipation → drains eccentricity faster than the resonance can refill it → the reservoir empties → the body cools and stiffens → dissipation collapses → the resonance slowly rebuilds eccentricity → repeat. That is the standard structure of a relaxation oscillator. Steady state would be the surprise.

**(c)** Ganymede's present heating cannot have made that terrain, so the terrain records a past epoch of much stronger forcing — most plausibly while Ganymede was being captured into, or evolving through, the Laplace resonance, when its forced eccentricity was far higher than today's 0.0013. Resonances are not permanent: moons migrate at different rates, so locks are entered and exited. Ganymede's surface is a fossil of a resonance it is no longer in. Miranda and, on some readings, Tethys and Dione are further examples.

**(d)** Because habitability is a claim about duration, not about instantaneous conditions. Life plausibly requires hundreds of millions of years of continuously liquid water and stable chemistry to originate. An ocean 4 Gyr old is a candidate biosphere; an ocean 10 Myr old is an experiment that has barely started — and from orbit, or even from a plume sample, the two can look identical.

It is much harder to answer because ocean *age* is not directly observable. You must infer it from surface age (crater counting on a resurfaced world), thermal–orbital modelling (which is exactly what is in dispute), chemical evolution in sampled material (degree of water–rock processing), or isotopic clocks in the ejected material. Every one of those is indirect and model-dependent, whereas detecting the ocean itself is comparatively straightforward — that is the subject of the magnetospheres chapter.

### 8 — Redrawing the map

**(a)** Earth (1.0 AU) — inside. Europa, Ganymede, Callisto (5.2 AU), Enceladus and Titan (9.5 AU), Triton (30.1 AU) — all outside, most of them by a factor of five to thirty.

**(b)** The overwhelming majority of the solar system's liquid water lies outside the habitable zone. Europa's ocean alone is usually estimated at roughly twice the volume of all Earth's oceans; Ganymede's may be larger still. Earth is the outlier — not for having water, but for having it on the surface.

**(c)** Not wrong — narrower than it is usually taken to be. It correctly answers: *where can a rocky planet with an atmosphere maintain liquid water on its surface, warmed by starlight?* Three assumptions are buried there — surface, atmosphere, and stellar heating — and tidal heating relaxes the third. Subsurface oceans under ice also relax the first two, since the ice shell substitutes for an atmosphere as a pressure lid and radiation shield. The concept is a good tool used outside its domain.

**(d)** Because the energy comes from orbital dynamics and the primary's rotation, not from radiation. The mechanism requires only a massive primary, a satellite, and a resonance to maintain eccentricity — none of which needs a star. So a giant planet orbiting a brown dwarf, or a giant planet ejected into interstellar space with its satellite system intact, could in principle maintain liquid-water oceans indefinitely, in total darkness. Such an ocean would be nearly undetectable by any current method, which is a sobering thought about the completeness of our search.

**(e)** Io. It receives the most tidal heating of any body in the solar system and is, as a result, completely sterile: so thoroughly and continuously heated that it has outgassed and lost essentially all its volatiles, resurfaces itself faster than anything can accumulate, and presents a dry, sulfurous, radiation-drenched surface. Tidal heating did not make Io habitable — it cooked the water out of it. The mechanism has a Goldilocks window like any other, and Io is the upper wall of it: proof that more energy is not better.

### 9 — Open problem: designing the discriminating measurement

**(a)** Because both hypotheses predict the same present-day heat flux — that is the observation both are constructed to accommodate. Measuring it more precisely refines a number that neither model disputes. The hypotheses differ in their claims about the past, so only a measurement carrying historical information can separate them. (This is the same structural point that governs any good test: attack the fork, not the shared conclusion.)

**(b)** Two independent lines:

1. Surface age and resurfacing history from crater counts and terrain mapping. A limit cycle predicts *repeated* episodes and therefore terrains of several distinct ages — old cratered regions alongside multiple generations of younger resurfacing, with evidence of previously active regions that shut down. A one-off current burst predicts a single young unit (the active south polar terrain) against an otherwise uniformly ancient surface, with no fossil active regions elsewhere. Enceladus's four distinct terrain types make this concretely testable with a good orbiter.

2. Orbital and rotational state measured to high precision — eccentricity, libration amplitude, and their rates of change. In a limit cycle, Enceladus should currently be in a draining phase, with eccentricity measurably *decreasing* faster than the resonance replenishes it. A steady-but-atypical state predicts eccentricity near its equilibrium value with a much smaller secular trend. Repeated precise tracking over a multi-year mission — or careful re-analysis of archival astrometry over the last century — could detect the drift.

(Also creditable: measuring the ice shell thickness distribution, since a cycling body should show shells out of equilibrium with present heat flow; and isotopic/chemical maturity in plume material, indicating how long water and rock have been in contact.)

**(c)** Because Europa's astrobiological case rests on ocean longevity in a way Enceladus's does not. Enceladus's plume gives us direct access to ocean material regardless of its age — you can go sample it and find out what is in it. Europa's ocean is under kilometres of ice, so any mission there is enormously expensive and is justified almost entirely by the argument that the ocean has been stable for billions of years. If Europa's heating is episodic, the central premise of the most expensive mission concept in planetary science is in question. The stakes attached to the ambiguity are simply much higher.

**(d)** It weakens the astrobiological case considerably — 100 Myr is short for an origin of life by any model we have, and it would mean any organics found are more plausibly abiotic or inherited than the product of a resident biosphere.

But the mission is still worth flying, for three reasons. First, the negative result is scientifically valuable and currently unobtainable: a young, chemically rich, energy-fed ocean that has *not* produced life would be the first real empirical constraint on how fast, and how easily, life gets started — a question we currently have exactly one data point on. Second, the age estimate is itself model-dependent, and the same mission that samples the plume would return the data needed to test it; declining to fly on the basis of a contested model is letting theory veto its own test. Third, the sampling is uniquely cheap — the ocean is already in space, and no drilling, landing, or surviving a lethal radiation environment is required. The cost per unit of information is unmatched anywhere in the outer solar system.

The honest counterweight: a mission sold on "we will find life" and delivering "we found a young ocean with no life" is politically fragile in a way that damages the *next* mission. The framing should be set correctly before launch, not after the data arrive — a discipline the field has repeatedly failed to maintain.$astroTide_master$,
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
  select $astroTide_quiz$[{"id": "q1", "type": "mcq", "prompt": "Why is the Peale, Cassen and Reynolds paper on Io treated as a landmark case of prediction preceding confirmation, rather than as a good fit to observations?", "options": ["They analysed Voyager 1's plume images and derived a tidal-heating model that explained the volcanoes already seen on the moon's limb", "Reasoning from mechanism alone with no data available, they published on 2 March 1979 that Io should show widespread recurrent volcanism; Voyager 1 flew by on 5 March and Linda Morabito found a 300-km plume in an over-exposed navigation image on 8 March, confirming the prediction within a week", "They predicted Io would be a cold, cratered ball like other four-and-a-half-billion-year-old rocks, and were proven wrong when Voyager arrived", "Their model was calibrated against Earth's geothermal flux and then extrapolated to Io only after the plumes were discovered"], "answerIndex": 1, "explanation": "The chapter stresses the timeline as the whole point. The Science paper 'Melting of Io by Tidal Dissipation' appeared 2 March 1979, three days before Voyager 1's closest approach (5 March), and the confirming plume was spotted by navigation engineer Linda Morabito on 8 March in an over-exposed image taken to bring out background stars, not for science; it threw material 300 km above the surface. Crucially there was no data to fit: Io was a fuzzy orange dot, and the prevailing expectation was the opposite (a cold, dead, cratered ball, since small bodies cool fast). Peale, Cassen and Reynolds reasoned from orbital dynamics and tidal flexing to a specific, falsifiable, counterintuitive prediction, and 'the universe complied within a week.' Option 3 inverts the story (that was the conventional expectation they overturned); options 1 and 4 wrongly make the model post-hoc, which is precisely what it was not."}, {"id": "q2", "type": "mcq", "prompt": "A synchronously rotating moon on a perfectly circular orbit carries an enormous permanent tidal bulge. How much tidal heat does that static bulge dissipate, and why?", "options": ["A large amount, because the 6-km bulge on Io stores a huge deformation that continuously releases energy", "A small but steady amount, proportional to the size of the bulge, since any deformed body slowly relaxes", "Essentially none, because the bulge points at the primary while the moon keeps one face toward it, so the bulge stays fixed in the moon's frame and nothing flexes; heating needs the tide to CHANGE, which requires eccentricity", "None, because a circular orbit means the moon feels no tidal force from the primary at all"], "answerIndex": 2, "explanation": "This is the conceptual heart of the chapter. On a circular, synchronous orbit the bulge points at the primary and the moon keeps the same face toward the primary, so the bulge sits at a fixed location in the rock and never moves relative to it. A static deformation, however enormous (Io's equilibrium bulge is about 6 km, versus Earth's 30-cm solid-body tide), does no ongoing work: dissipation requires material to be strained and released repeatedly, with internal friction converting mechanical energy to heat each cycle. The chapter's image is the paperclip: bend it once and it barely warms; it heats when you bend it back and forth. So 'Jupiter squeezes Io and that makes it hot' identifies the wrong quantity: heating comes not from the size of the tide but from the tide changing, which for a synchronous moon requires orbital eccentricity. Option 4 is wrong because the tidal force and bulge certainly exist on a circular orbit; they simply do not vary."}, {"id": "q3", "type": "mcq", "prompt": "In the tidal-heating law E-dot proportional to (k2/Q) M_p^2 n R^5 e^2 / a^6, what do the a^-6 and e^2 dependences tell you about contrasts between moons?", "options": ["Doubling the orbital distance cuts tidal heating by a factor of 64, so the a^-6 term drives the Io-to-Callisto contrast of about 5000; and because heating scales as e^2, zero eccentricity gives exactly zero heat, not merely a little", "Doubling the orbital distance halves the heating, and zero eccentricity still leaves a small residual heating from the static bulge", "The a^-6 term makes distance almost irrelevant compared to eccentricity, which is why Callisto is nearly as hot as Io", "Heating scales linearly with eccentricity, so Europa's higher eccentricity makes it the most heated Galilean moon"], "answerIndex": 0, "explanation": "The exponents do the explanatory work. Because heating goes as a^-6, doubling the distance drops it by 2^6 = 64, and moving out by just 60% drops it sixteenfold. Across the Galilean moons this a^-6 tyranny produces an Io-to-Callisto collapse of about five thousand: four orders of magnitude among four moons formed from the same disk. Because heating goes as e^2, e = 0 gives exactly zero heat, 'not a little' - eccentricity is a necessary condition, not one contributor among several, which is what later makes the damping problem fatal rather than inconvenient. Option 2 misstates both exponents; option 3 inverts the a^-6 lesson (distance dominates, Callisto is about 5000x colder than Io); option 4 is wrong because although Europa's e is roughly 2.3x Io's, Io still out-heats it by more than tenfold, since the a^-6 suppression (about 16x) overwhelms the e^2 gain (about 5x)."}, {"id": "q4", "type": "mcq", "prompt": "Given that tidal dissipation also damps eccentricity, and Io's eccentricity-damping timescale is about 0.2 Myr against a 4,568-Myr-old solar system, what is the real puzzle the chapter is built around, and how is it resolved?", "options": ["Io's radioactive isotopes keep reheating the interior, so no eccentricity is needed and the orbit can safely circularise", "Io's orbit should have circularised roughly 20,000 times over, so the puzzle is what RESTORES the eccentricity; the answer is the Laplace resonance (n_Io - 3 n_Eu + 2 n_Gan = 0 to about one part in ten million), in which Europa and Ganymede force Io's eccentricity faster than tides erase it", "The damping timescale is actually longer than the age of the solar system, so Io's primordial eccentricity has simply survived untouched", "Jupiter's magnetic field continuously re-excites Io's orbit, replacing the lost eccentricity"], "answerIndex": 1, "explanation": "Tidal heating is self-extinguishing: the heat comes out of the orbit, driving it toward the minimum-energy circular state, so heating and circularisation are the same process seen from two ends. With Io's roughly 0.2 Myr damping timescale, 4,568 Myr is about twenty thousand damping times - Io should be a cold, circular, cratered rock, exactly what everyone expected before 1979. Since the volcanoes run now, its small but stubbornly nonzero e (0.0041) must be actively maintained. The formula is therefore the statement of the puzzle, not its solution: the real question is never 'why is Io hot' but 'what puts the eccentricity back.' The answer is the Laplace resonance among Io, Europa and Ganymede, satisfying n_Io - 3 n_Eu + 2 n_Gan = 0 to about one part in ten million, whose repeated same-phase conjunctions force eccentricity faster than tides can damp it. Options 1, 3 and 4 all dodge the actual mechanism (radioactivity, mere survival, and magnetic fields are explicitly not the source)."}, {"id": "q5", "type": "mcq", "prompt": "Saturn's Mimas (a = 185.5 Mm, e = 0.0196) and Enceladus (a = 237.9 Mm, e = 0.0047) are comparable icy moons. What does the formula predict, what is observed, and why does the formula fail here?", "options": ["The formula predicts Enceladus should be about 34x more heated, matching its ~15.8 GW of geysers, so the formula works fine on these two moons", "The formula predicts Mimas should be heated about 34x more than Enceladus, yet Mimas is a dead cratered ball and Enceladus erupts at about 15.8 GW; the formula fails because k2/Q differs (Enceladus's ocean decouples a flexing shell while Mimas is stiff) and because Mimas is in an inclination-type resonance, not an eccentricity-type", "The formula predicts both should be equally active, and the difference is due purely to Enceladus being larger", "The formula predicts Mimas should be 34x more heated, and it is - Mimas's Herschel crater is actually a volcanic caldera"], "answerIndex": 1, "explanation": "Fed into the heating law with a common k2/Q, Mimas wins decisively: its 4x-larger eccentricity gives about 17x in e^2, its closer orbit about 4.5x, its faster orbit about 1.45x, losing only about 0.3x on its smaller radius, netting roughly 34x more predicted heat than Enceladus. Yet the observation is reversed: Mimas is dead and heavily cratered (dominated by the Herschel crater, no activity), while Enceladus vents from over a hundred south-polar geysers, radiating roughly 15.8 GW and feeding Saturn's E ring from a global ocean. The formula gets the ordering backwards on the two bodies where it should be most reliable, for two reasons. First, k2/Q is not a constant: a stiff, cold, undifferentiated ice ball (Mimas) barely flexes and barely dissipates, while a thin shell decoupled from the interior by a global ocean (Enceladus) flexes enormously - so an ocean is a precondition for efficient heating, not just a result, giving the system two stable states (bistability). Second, resonance type matters: Enceladus-Dione is an eccentricity-type resonance that forces e and drives heating, whereas Mimas-Tethys is an inclination-type resonance that pumps orbital tilt and does little to flex a synchronous body, so Mimas's large eccentricity is a leftover, not a maintained quantity."}, {"id": "q6", "type": "open", "prompt": "Trace the complete energy chain that powers Io's volcanoes, from its ultimate source to the eruptions, naming each link. Then justify the chapter's striking claim that Io costs Jupiter only about 0.04% of its spin, and explain what that fraction tells us about whether the mechanism can be sustained.", "rubric": "A strong answer follows the chapter's chain end to end: (1) Jupiter rotates in about 9.9 h, much faster than Io orbits in about 42 h; (2) Io raises a tidal bulge on Jupiter, and Jupiter's internal friction drags that bulge AHEAD of the Jupiter-Io line; (3) the leading bulge exerts a forward torque on Io, transferring angular momentum and energy out of Jupiter's spin into Io's orbit (the same mechanism recedes the Moon from Earth at 3.8 cm/yr while Earth's day lengthens); (4) the Laplace resonance among Io, Europa and Ganymede partitions that energy, maintaining a forced eccentricity on the inner moons; (5) eccentricity drives the size-and-position variation of the tidal bulge inside Io (radial plus librational tides); (6) that flexing dissipates as heat, melting the interior and driving the volcanoes. The one-line summary: Jupiter's rotation -> tidal torque -> orbital energy -> resonantly forced eccentricity -> flexing -> melting -> volcanoes, so the volcanoes are powered by Jupiter's SPIN, not by radioactivity, formation heat, or sunlight. For the budget: Io has radiated of order 10^31 J (about 1.4x10^31 J) over the solar system's lifetime against Jupiter's rotational kinetic energy of roughly 3.6x10^34 J, giving about 0.04%. A strong answer interprets this: the reservoir is enormous relative to the draw, so there is no danger of exhaustion; the real constraint on Io's activity is the RATE at which the coupling delivers energy, not the size of the reservoir. Jupiter pays for the most volcanically active body in the solar system out of small change while its day lengthens imperceptibly."}, {"id": "q7", "type": "open", "prompt": "The chapter argues tidal heating 'redraws the map' of habitability, yet also insists it has its own Goldilocks problem. Explain both. In the map-redrawing argument, what does the habitable-zone concept actually get right and which assumption does tidal heating relax? In the Goldilocks counterpoint, use Io and Callisto to show that tidal heating can be both too much and too little, and explain what Callisto proves.", "rubric": "A strong answer has two halves. MAP REDRAWING: the classical habitable zone (for the Sun, roughly 0.95-1.67 AU) is drawn around starlight - it asks where a rocky planet with an atmosphere can maintain liquid water ON A SURFACE, UNDER AN ATMOSPHERE, WARMED BY A STAR. But the solar system's liquid water is overwhelmingly OUTSIDE that zone: Europa, Ganymede, Callisto (5.2 AU), Enceladus and Titan (9.5 AU), Triton (30.1 AU), with only Earth inside. Europa's ocean alone is estimated at roughly twice all Earth's oceans, and Ganymede's may be larger, so the overwhelming majority of the solar system's liquid water lies outside the habitable zone. The concept is not WRONG, just narrower than usually taken: it correctly answers its surface/atmosphere/starlight question, and tidal heating relaxes the stellar-heating assumption (subsurface oceans under ice also relaxing the surface and atmosphere ones, since the ice shell acts as a pressure lid and radiation shield). Tidal heat needs only a massive primary, a satellite, and a resonance to maintain eccentricity - no star at all - so it could operate around a red dwarf, a brown dwarf, or a rogue giant planet ejected into interstellar space with its moons. GOLDILOCKS COUNTERPOINT: tidal heating is not uniformly friendly. Io (too much): at about 2 W/m^2 it has been so thoroughly heated for so long that it has lost essentially all volatiles - bone dry, sulfurous, continuously resurfaced, sterilised rather than made habitable; more energy is not better. Callisto (too little): outside the resonance, barely differentiated, geologically inert - and because it shares Io's formation, disk and composition but lacks the resonance, it is the single best evidence that RESONANCE, not distance or size, decides activity (the control case). Europa sits plausibly in the window; Ganymede is marginal (ocean sandwiched between ice rather than resting on rock, where water-rock contact drives the interesting chemistry). The overall point: the habitability window is set by where a moon sits in a resonant chain, not by distance from the star."}]$astroTide_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/giant-planets/tidal-heating', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
