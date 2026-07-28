-- Astronomy & Space · The Solar System — Giant Planets —
-- "Major Moons". Curated, human-reviewed master for
-- astronomy-and-space/solar-system/giant-planets/major-moons @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- Miniature solar systems and the Galilean density experiment.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/giant-planets/major-moons',
    'research',
    'advanced',
    'read',
    $astroMoons_master$> The word "moon" does these worlds a disservice. Ganymede is larger than Mercury. Titan carries an atmosphere thicker than Earth's. Io is more volcanically active than any other body in the solar system. Europa holds roughly twice as much liquid water as Earth does. If any of them orbited the Sun instead of a planet, we would call it a planet and build missions around it without argument. The organising claim here is that a giant planet's regular satellites form a miniature solar system — built by the same physics as the real one at one-thousandth the scale, and therefore recording the same gradients. But they record something the solar system at large does not: what happens when two nearly identical bodies are pushed to opposite sides of a threshold. Reading those gradients, and that threshold, is the whole of what follows.

Both halves of the machinery are now in hand. The tidal-heating chapter supplied the energy source — heating maintained by resonance, independent of the Sun. The magnetospheres chapter supplied the instrument — magnetic induction, which lets us detect a saltwater ocean without ever touching one. This chapter applies both to the objects themselves.

{{image: Galilean moons | Io, Europa, Ganymede, and Callisto shown to scale. In order of distance from Jupiter their densities fall monotonically, the fingerprint of a temperature gradient in Jupiter's own formation disk.}}

## Four points of light, and the speed of light

In January 1610, Galileo turned a new telescope on Jupiter and saw three small stars in a line beside it. Over the following nights he watched them move — sometimes four of them, sometimes fewer as one passed behind the planet — and he understood what he was looking at: four objects orbiting something that was not the Earth.

It is difficult now to feel how much weight that carried. The geocentric system's core claim was that everything circles us. Here were four things visibly circling something else, night after night, in a pattern anyone with a telescope could verify. Galileo published in March 1610 in *Sidereus Nuncius* and called them the Medicean stars, angling for patronage. The names we use — Io, Europa, Ganymede, Callisto — came from Simon Marius, who claimed independent discovery at almost the same time and who chose better.

### Sixty-six years later

What followed is even more remarkable, and it is the reason to open here rather than with Voyager.

Galileo had proposed using the moons as a clock. Their eclipses — the moments each disappears into Jupiter's shadow — occur on a predictable schedule visible from anywhere on the night side of Earth. Tabulate the timings, and an observer anywhere can compare local time against the table and determine their longitude. This was the great unsolved practical problem of the age, and it was worth fortunes.

The method never worked at sea — try holding a telescope steady on a rolling deck — but it worked on land, and it became the standard tool for surveying and mapmaking for well over a century.

Which meant that by the 1670s, astronomers had accumulated long, careful records of Io's eclipse timings — and the timings would not behave. The eclipses ran early when Earth was near Jupiter and late when Earth was far, by up to about eleven minutes either way.

In 1676, Ole Rømer proposed the explanation: light does not travel instantaneously. The eclipses appear late when we are further away because the light takes longer to reach us.

Christiaan Huygens took Rømer's number and the best available estimate of the Earth–Sun distance and computed the first value for the speed of light: roughly 220,000 km/s. The modern value is 299,792 km/s, so he was about 24% low — and nearly all of that error was in the astronomical unit, which was badly known in 1676. The physics was right. The ruler was wrong.

So: a moon system discovered in 1610 to break geocentrism was used as a clock for navigation, and the clock's errors gave us the finite speed of light.

### And then nothing, for three hundred years

Here is the part worth sitting with. From 1610 until 1979, the Galilean moons were points of light. Useful ones — timekeepers, test cases for celestial mechanics, a target for Rømer — but points. Nobody knew what was on them. The best telescopes showed disc diameters and crude albedo variations and essentially nothing else.

Then Voyager 1 arrived in March 1979, and within a few weeks four points of light became four places, as different from one another as any four planets you could name. Three hundred and sixty-nine years of observation had told us where they were, and almost nothing about what they were.

## A solar system in miniature

Look at the Galilean moons in order of distance from Jupiter:

| Moon | $a$ (Mm) | Radius (km) | Mass (kg) | **Density (kg/m³)** |
|---|---|---|---|---|
| **Io** | 421.7 | 1,822 | 8.93 × 10²² | **3,528** |
| **Europa** | 671.0 | 1,561 | 4.80 × 10²² | **3,014** |
| **Ganymede** | 1,070.4 | 2,634 | 1.48 × 10²³ | **1,936** |
| **Callisto** | 1,882.7 | 2,410 | 1.08 × 10²³ | **1,834** |

Density falls monotonically with distance.

That is exactly the pattern established for the solar system itself in the disk and snow-line chapter: dense rocky bodies close in, volatile-rich bodies further out, because the temperature in the disk fell with distance and controlled what could condense where. Io's density (3,528) is essentially lunar rock. Callisto's (1,834) requires roughly half ice by mass.

The mechanism is the same, one thousand times smaller. Proto-Jupiter was hot and luminous while it was accreting — releasing gravitational energy at a prodigious rate — and it heated its own circumplanetary disk, establishing a radial temperature gradient. Inside a certain radius, water ice could not condense; outside it, it could. Io and Europa formed inside their local snow line; Ganymede and Callisto outside it.

Jupiter had its own snow line. The single most important concept in this whole story operates at both scales.

### One further pattern, and what it implies

There is a second regularity worth knowing, because it is the kind of fact that sounds like a coincidence and is not:

| System | Total regular satellite mass / planet mass |
|---|---|
| Jupiter | 2.1 × 10⁻⁴ |
| Saturn | 2.5 × 10⁻⁴ |
| Uranus | 1.1 × 10⁻⁴ |

Three systems, three different planets, the same ratio to within a factor of two — about one ten-thousandth.

The leading explanation is the gas-starved disk model: a circumplanetary disk is not a sealed reservoir but a flow-through system, continuously fed by gas from the surrounding nebula and continuously draining onto the planet. Satellites grow within it, but they also migrate inward and are lost. The system reaches a steady state in which the mass held in satellites at any moment is set by the balance of supply and loss — and that balance depends on the planet's mass in a way that makes the ratio nearly universal.

If that is right, then the moons we see are the survivors of several generations. Earlier satellites formed, spiralled in, and were consumed. The Galilean moons are the last batch, caught when the gas supply ran out and the migration stopped.

## Io: the world with no craters

Io's engine — tidal heating maintained by resonance — belongs to another chapter. Here is what the engine has produced.

Over 400 active volcanoes have been catalogued — more than the rest of the solar system combined, by an enormous margin. Loki Patera, the most powerful, is a lava lake roughly 200 km across whose brightness fluctuates on a semi-regular cycle as its crust founders and sinks. Pele maintains a plume deposit ring 1,300 km in diameter. Between the Voyager 1 and Voyager 2 encounters — four months apart — the surface visibly changed.

The consequence is the fact that made Io famous: Io has no impact craters. Not one.

The resurfacing rate is roughly 1 cm per year globally — 10 km per million years. A 10-km-deep crater is buried in about a million years, and Io is bombarded like everything else in the Jovian system. The craters are being made; they simply do not survive long enough to be counted. Io's surface is younger than our species.

{{image: Io (moon) | Io's sulfur-painted surface carries no impact craters at all. Resurfacing at about a centimetre a year buries every crater within roughly a million years — the surface is younger than our species.}}

### The mountains, and a lovely inversion

Io also has mountains up to 17 km high — Boösaule Montes among them, higher than anything on Earth or Mars measured from base to peak.

They are not volcanoes. They are tectonic, and the mechanism is delightful. Bury the surface under a centimetre of new material every year and the older crust is pushed steadily downward. But a sphere has a fixed surface area, so crust driven downward must be compressed — and compressed crust fails by thrust faulting, shoving enormous blocks upward.

The volcanism builds the mountains by burying the ground. Io's peaks exist because its plains keep sinking.

### And it is bone dry

One further point, and it matters for the ocean-worlds chapter. Io has been intensely heated for billions of years, and the result is that it has lost essentially all of its water. Its thin atmosphere is sulfur dioxide, which freezes onto the surface each night when Io passes into Jupiter's shadow and the atmosphere partially collapses. Its colours — yellows, whites, reds, blacks — are sulfur allotropes and sulfur compounds.

Io is the innermost Galilean moon, it received the most tidal energy, and it is the driest and deadest of the four. That is the Goldilocks warning of tidal heating, made concrete: more energy is not always better.

## Europa: reading an ocean off a surface

Europa is the smoothest large body in the solar system. Its surface has essentially no relief above a few hundred metres, and crater counts give a surface age of only 40–90 million years — young enough that the surface we see postdates the dinosaurs.

Three features dominate it.

**Lineae** — dark bands and double ridges criss-crossing the globe in networks thousands of kilometres long. The double ridge is the characteristic form: two parallel ridges a few hundred metres high with a trough between, running for hundreds of kilometres. They are cracks that have been repeatedly worked.

**Chaos terrain** — regions like Conamara Chaos where the surface has broken into blocks that have visibly rotated and translated relative to one another before refreezing, like ice floes on a sea. It is difficult to look at these images and not conclude that something underneath was mobile.

**Cycloids** — and these are the ones that matter most.

{{image: Europa (moon) | Europa's fractured ice shell, laced with reddish lineae. The cycloid shape of many cracks, traced by a rotating tidal stress field, requires the shell to float free on a liquid ocean.}}

### The cycloid argument

Many of Europa's cracks are not straight. They are chains of arcs, each roughly 100 km long, joined at sharp cusps where the direction abruptly changes. Nothing else in the solar system looks like this.

The explanation, worked out in the late 1990s, is that a crack propagates through the ice under diurnal tidal stress — the stress field that rotates as Europa moves around its eccentric orbit over 85 hours. The crack runs until the stress drops below the threshold needed to keep it going, and stops. Then, as the stress field rotates further and builds again, it restarts — in a new direction. That is the cusp. Repeat, and you draw a cycloid.

Now the payoff. The model only works if the tidal stresses are large enough — of order tens of kilopascals. And you get stresses that large only if the ice shell is mechanically decoupled from the interior, floating on a liquid layer and free to flex. A shell frozen solid to the rocky mantle experiences stresses roughly an order of magnitude smaller, and cannot make cycloids at all.

So the shape of the cracks proves there is an ocean.

This is worth dwelling on because of what it is *not*. It is not a magnetometer measurement. It uses different physics, a different instrument (a camera), and different assumptions from the induction argument of the magnetospheres chapter — and it reaches the same conclusion. Two independent lines of evidence, converging. That is what moves a claim from "plausible model" to "established."

### What else we know

**Salt.** Europa's surface shows non-ice materials concentrated along the lineae and chaos regions — exactly where ocean material would emerge. Spectroscopy has identified sulfates and, in 2019, sodium chloride — ordinary table salt, identified by the yellowish colour that irradiated NaCl develops. Europa's ocean appears to be chemically much like a terrestrial one.

**Plumes, probably.** Hubble has reported water vapour emissions above Europa's limb on several occasions, and a 2018 reanalysis of Galileo data from a 1997 close pass found magnetic and plasma-wave signatures consistent with the spacecraft flying through a plume without anyone realising it at the time. The evidence is suggestive rather than conclusive — the detections are at the limit of what the instruments can do — but if plumes are real, they matter enormously, because they mean ocean material can be sampled from orbit without landing or drilling.

**Shell thickness: unresolved.** There is a long-running disagreement between "thin ice" (a few km, with the ocean occasionally reaching the surface) and "thick ice" (20–30 km, with material transported by slow convection). It bears directly on whether a future lander could ever reach the water, and Europa Clipper's radar sounder is designed to settle it.

## Ganymede: the only moon with a dynamo

Ganymede is the largest moon in the solar system — 5,268 km across, larger in radius than Mercury (though only 45% of its mass, because Mercury is mostly iron and Ganymede is nearly half ice).

Its surface is cleanly divided into two terrain types. Dark terrain, ancient and heavily cratered, covers about a third of it. Light terrain, covering the rest, consists of vast systems of parallel grooves and ridges — extensional tectonics on an enormous scale, resurfaced perhaps two billion years ago.

Ganymede's present tidal heating is about a thousandth of Io's, nowhere near enough to have done this. The grooved terrain is a fossil of an earlier epoch of much stronger forcing, most plausibly while Ganymede was evolving into or through the Laplace resonance.

{{image: Ganymede (moon) | Ganymede, the largest moon in the solar system, larger than Mercury. Dark ancient terrain and bright grooved terrain record an early epoch of far stronger tidal forcing; it is the only moon known to run its own magnetic dynamo.}}

### The dynamo

In 1996, Galileo's magnetometer found something nobody had predicted: Ganymede has its own magnetic field, generated internally, with a surface strength of about 719 nT at the equator.

It is the only moon in the solar system known to have one.

A dynamo requires a convecting, electrically conducting fluid, which for a rocky body means a liquid iron core. So Ganymede must be fully differentiated — metal at the centre, rock above, ice above that — and its core must still be liquid and convecting after 4.5 billion years, in a body two-fifths of Earth's diameter.

That is genuinely surprising, and it is not fully explained. Small bodies cool fast; that is the central lesson of the small-body chapters. Ganymede should have frozen solid long ago.

Ganymede's field is also embedded within Jupiter's, which produces a magnetosphere inside a magnetosphere — the only known example — with its own auroral ovals, which Hubble has observed.

And those aurorae gave us a third independent ocean detection. The auroral ovals rock back and forth as Jupiter's field sweeps past. The amplitude of that rocking depends on how strongly Ganymede's interior responds to the changing external field — and the observed rocking is damped, by exactly the amount expected if a conducting saltwater layer is present. So: magnetic induction, cycloid mechanics at Europa, and auroral oscillation at Ganymede. Three different physical arguments, three different instruments, one conclusion.

### The chemistry problem

One caution that will matter in the ocean-worlds chapter. Ganymede is large enough that pressure at the base of its ice layer is high enough to form high-pressure ice phases (ice III, V, VI) — ice that is *denser* than liquid water. So Ganymede's ocean may be sandwiched between two ice layers, with the water never touching rock.

That is potentially fatal for habitability, because water–rock contact is where the interesting chemistry happens — it is the source of the reductants that a chemosynthetic biosphere would need. Some models allow for contact at the base, or for chemical exchange through the high-pressure ice, and the question is unsettled. It is a principal objective of JUICE, which will become the first spacecraft ever to orbit a moon other than our own.

## Callisto, and the problem this chapter exists for

Now the question the whole chapter has been building toward.

| | Ganymede | Callisto |
|---|---|---|
| Radius | 2,634 km | 2,410 km (92%) |
| Mass | 1.48 × 10²³ kg | 1.08 × 10²³ kg (73%) |
| Density | 1,936 kg/m³ | 1,834 kg/m³ (95%) |
| **Moment of inertia factor** | **0.3115** | **0.3549** |
| Interior | fully differentiated: iron core, rock mantle, ice shell | **rock and ice never fully separated** |
| Magnetic field | **intrinsic dynamo** | none |
| Surface age | dark ~4 Gyr, light ~2 Gyr | ~4 Gyr, saturated |
| Subsurface ocean | **yes** | **yes** |

They formed in the same disk, from the same material, at similar distances, at the same time. They are within 8% in radius and 5% in density.

And one of them is a fully differentiated world with a working iron dynamo, while the other never finished separating its rock from its ice.

{{image: Callisto (moon) | Callisto has the most heavily cratered surface in the solar system — including the vast Valhalla ring system — yet it hides a subsurface ocean. Surface geology is not a reliable guide to interior state.}}

### Reading the moment of inertia

The key measurement is that fourth row, so it is worth being clear about what it means. The moment of inertia factor $C/MR^2$ describes how mass is distributed with radius. For a uniform sphere it is exactly 0.4. The more mass is concentrated at the centre, the lower it goes: Earth is 0.3307, Mercury 0.346, our Moon 0.394.

Ganymede's 0.3115 is among the lowest in the solar system — strongly differentiated, dense material at the middle.
Callisto's 0.3549 is close to uniform — a body that is still, to a substantial degree, a rock-and-ice mixture.

This is measured from the gravity field during flybys, and it is one of the most powerful things a spacecraft can determine about a body it never touches.

### The Ganymede–Callisto dichotomy

Why the difference? This is a genuine open problem with a name, and there are two families of answer.

**Resonance.** Ganymede is in the Laplace resonance; Callisto is not. Ganymede has been tidally heated, episodically and sometimes strongly (that grooved terrain); Callisto never has. This is appealing because it follows directly from the tidal-heating argument — but it has trouble with timing, since differentiation must happen early, and the resonance may have been established later.

**Impacts, plus a threshold.** This is the currently favoured account, and it is the more instructive one.

Jupiter's gravity accelerates and focuses incoming impactors. A body falling toward Jupiter is moving faster the closer in it gets: Jupiter's escape velocity at Ganymede's orbit is 15.4 km/s versus 11.6 km/s at Callisto's. Since impact energy scales as $v^2$, Ganymede is struck roughly 1.8 times harder per unit impactor mass — and it is also struck more often, because Jupiter focuses the flux more strongly at smaller radius.

During the Late Heavy Bombardment, both moons absorbed a great deal of impact energy. Ganymede absorbed appreciably more.

### Why a factor of two produces a categorical difference

Here is the part that matters, and it is the same idea met at Mimas and Enceladus in the tidal-heating chapter.

Differentiation is self-amplifying. Separating dense rock from light ice releases gravitational potential energy, which heats the body, which lowers the viscosity of the ice, which lets the rock sink faster, which releases more energy, which heats it further.

That is positive feedback with a threshold. Deposit enough energy to get the process started and it runs away to completion — the body differentiates fully, the rock and metal sink, an iron core forms, and given the right conditions a dynamo starts. Fall short of the threshold and almost nothing happens: the body stays a mixture indefinitely.

So a modest difference in input — call it a factor of two in impact energy — produces a categorical difference in outcome. Not a slightly-more-differentiated moon and a slightly-less-differentiated one. A differentiated world and an undifferentiated one, from nearly identical starting material.

This is now the third time the same structure has appeared:

| Pair | Small difference in input | Categorical difference in outcome |
|---|---|---|
| Mimas / Enceladus (tidal heating) | resonance type, interior state | dead / erupting |
| Uranus / Neptune (the ice giants) | interior stratification | no internal heat / 2.6× excess |
| **Ganymede / Callisto** | **impact energy, ~1.8×** | **differentiated / not** |

The outer solar system is full of thresholds, and near a threshold, similar inputs do not produce similar outputs. This is the single most transferable idea here, and it should make you permanently suspicious of the reasoning "these two bodies are alike, so they should be alike."

### And yet Callisto has an ocean

The final twist. Callisto has the most heavily cratered surface in the solar system — saturated, ancient, unmodified for four billion years, with the enormous Valhalla multi-ring impact structure whose outermost rings span some 3,800 km. If you were asked to name the deadest large body in the outer solar system from images alone, you would say Callisto.

Callisto has a subsurface ocean. The magnetic induction signature is there.

Take the lesson seriously: surface geology is not a reliable guide to interior state. A world can be dead on the outside and wet underneath, and the only way to find out is to measure something that sees through.

A footnote with a future in it: Callisto sits outside the worst of Jupiter's radiation belts, and receives a dose several hundred times lower than Europa's. It is consistently the site proposed in studies of crewed outer-solar-system missions — the one Galilean moon a human could stand on.

## Saturn's system: a different architecture

Saturn's satellite system is organised on quite different principles, and the contrast is informative.

Titan holds about 96% of the system's satellite mass — one dominant body rather than four comparable ones (Titan gets a chapter of its own). The remainder is a family of mid-sized icy moons: Mimas, Enceladus, Tethys, Dione, Rhea and Iapetus, ranging from 400 to 1,530 km across.

And here is the diagnostic difference: Saturn's moons show no density gradient.

| Moon | Density (kg/m³) |
|---|---|
| Mimas | 1,148 |
| Enceladus | 1,609 |
| Tethys | **984** |
| Dione | 1,478 |
| Rhea | 1,236 |
| Iapetus | 1,088 |

No trend at all — Tethys is less dense than water and sits between two denser neighbours. Compare the clean monotonic fall from 3,528 to 1,834 across the Galileans.

The reason follows directly from the physics of giant-planet formation. Saturn is 3.3 times less massive than Jupiter, so it released far less gravitational energy while forming and was far less luminous. Its circumplanetary disk therefore had a much weaker temperature gradient — and in the absence of a strong gradient, water ice condensed essentially everywhere. Saturn's disk had no meaningful snow line of its own, so its moons are all ice-rich, and their small density variations reflect porosity and local accretion history rather than a systematic thermal structure.

The presence or absence of a density gradient in a satellite system tells you how luminous the parent planet was while it formed. That is a genuinely useful diagnostic, and it will apply to exoplanet systems as soon as we can measure one.

### Iapetus, and a runaway you can see from Earth

Iapetus deserves a section of its own, for two reasons.

In 1671, Giovanni Cassini discovered it — and then found he could only see it when it was on one side of Saturn. On the other side it vanished. He drew the correct conclusion: one hemisphere must be far darker than the other, and the moon must be tidally locked so that it always presents the same face forward.

He was right, and the albedo contrast is extreme: the leading hemisphere (Cassini Regio) reflects about 4% of incident light — as dark as coal — while the trailing hemisphere reflects around 60%, as bright as snow.

The explanation, largely settled by Cassini the spacecraft, is a beautiful runaway. Dark reddish dust from Phoebe — a retrograde outer moon, orbiting the wrong way, whose story belongs to the captured-moons chapter — spirals inward and preferentially coats Iapetus's leading face. That makes it slightly darker, so it absorbs slightly more sunlight, so it becomes slightly warmer, so its surface ice sublimates — and the vapour migrates to the colder trailing hemisphere and poles, where it refreezes. Which leaves the leading face darker still.

A tiny initial asymmetry, amplified by positive feedback into a moon that is coal on one side and snow on the other. That is the fourth threshold-and-runaway in this system, and this one was noticed with a seventeenth-century telescope.

{{image: Iapetus (moon) | Iapetus, coal-dark on its leading hemisphere and snow-bright on its trailing one — a runaway seeded by dust from Phoebe. The 13-km equatorial ridge running along its middle has no accepted explanation.}}

Iapetus also carries an equatorial ridge — 13 km high, over 1,300 km long, running almost exactly along its equator like a seam on a walnut. Nobody knows what made it. The leading candidates are a collapsed ring that rained down onto the equator, or a fossil of much faster early rotation. Both have problems.

### Hyperion, and chaos

One more, because it is a genuine landmark. Hyperion is a small, extremely porous moon (density 544 kg/m³ — mostly empty space) shaped like a battered sponge, and it does not rotate in any regular way. Its spin is chaotic: not merely irregular but formally unpredictable, tumbling with no fixed axis and no repeating period.

This was predicted before it was confirmed, in the early 1980s, and it stands as the first body in the solar system shown to be in a chaotic rotational state. It is a reminder that the celestial mechanics used throughout these chapters — resonances, locks, stable configurations — has a wilder regime, and that the solar system contains examples of it.

## The Uranian moons, and how little we know

Uranus has five main moons — Miranda, Ariel, Umbriel, Titania, Oberon — with densities around 1,200–1,700 kg/m³, so rock-and-ice mixtures. They orbit in the plane of Uranus's tilted equator, which is the fact that makes the giant-impact story for the tilt so awkward, as the ice giants showed.

Miranda we have met: 470 km across, with terrains that do not match one another and Verona Rupes, a scarp with a vertical drop of some 20 km. Ariel shows the clearest evidence of resurfacing, with smooth plains and extensive rift systems. Both are almost certainly fossils of past resonances.

But this section should close with a fact that ought to be better known.

Voyager 2 arrived at Uranus near solstice. One pole faced the Sun. Which means that for every one of these moons, only the southern hemisphere was illuminated during the encounter — and Voyager 2 is the only spacecraft ever to visit.

We have never seen the northern hemisphere of any moon of Uranus. Not badly, not at low resolution. Not at all.

## Pulling the thread

The Galilean system records three separate gradients, and reading them in order is the point.

**One — the density gradient (formation).** 3,528 → 3,014 → 1,936 → 1,834 kg/m³, falling monotonically outward, because proto-Jupiter was hot and established a temperature gradient in its own circumplanetary disk. Jupiter had its own snow line, and the disk's central concept operates at both scales. Saturn's moons show no such gradient, because Saturn was too faint to make one — which turns the gradient's presence or absence into a diagnostic of how luminous a planet was while it formed.

**Two — the heating gradient (dynamics).** Io ≫ Europa ≫ Ganymede ≫ Callisto, spanning four orders of magnitude, produced by the $a^{-6}$ scaling of tidal heating and maintained by the Laplace resonance. It shows up directly in surface ages: under a million years for Io, 40–90 Myr for Europa, ~2 Gyr for Ganymede's light terrain, ~4 Gyr for Callisto. Four orders of magnitude in surface age, in one system, from one mechanism.

**Three — the differentiation dichotomy (thresholds).** Ganymede and Callisto are near-twins that ended up categorically different, because differentiation is a self-amplifying process with a threshold, and a factor of ~1.8 in impact energy put one over it and left the other under. This is the same structure as Mimas versus Enceladus, as Uranus versus Neptune, and as Iapetus's two faces. Near a threshold, similar inputs do not give similar outputs — and the outer solar system is full of thresholds.

Two closing observations.

Surface geology is not a reliable guide to interior state. Callisto has the most heavily cratered, most obviously dead surface in the solar system, and an ocean. If we had judged by images we would have written it off.

And these are not accessories. Ganymede is bigger than Mercury. Europa holds twice Earth's ocean water. Io out-erupts every other body in the solar system combined. Three of the four Galilean moons have subsurface oceans, established by three different physical arguments using three different instruments. The most interesting real estate in the solar system is in orbit around other planets — and for 369 years, from Galileo to Voyager, all of it was invisible.

The next world in this system's story is Titan — the only other place with standing liquid on its surface, a nitrogen atmosphere thicker than Earth's, and a hydrological cycle running on methane instead of water. It arrives with a puzzle: solar ultraviolet destroys atmospheric methane in ten to thirty million years, yet Titan has had methane for far longer than that. Something is replenishing it.

## Further reading

Galileo's own account of the discovery, *Sidereus Nuncius* (1610), remains startlingly readable and is short; it is the primary document for the moment four points of light broke geocentrism, and modern translations are widely available. For the transformation from points of light to places, the imaging archives of the Voyager and Galileo missions, together with the ongoing Juno extended mission, are the raw material, and NASA's planetary data holdings make them public. The two spacecraft that will carry the story forward — ESA's JUICE, bound for orbit around Ganymede, and NASA's Europa Clipper, whose radar sounder is designed to settle the thin-versus-thick ice debate — both publish accessible mission overviews that lay out exactly which of the open questions in this chapter each is built to answer.

## Problems

The density-gradient problem is the one that connects this system to disk chemistry; the dichotomy is the conceptual core and the most transferable idea in this material; the cycloid problem is the finest non-magnetic argument for an ocean; and the settling-the-dichotomy problem is genuinely open.

*Constants: $G = 6.674\times10^{-11}$. Jupiter $M = 1.898\times10^{27}$ kg. 1 AU = 1.496 × 10¹¹ m; $c = 2.998\times10^{8}$ m/s. Galilean data: Io ($a$ = 421.7 Mm, $R$ = 1,822 km, $M = 8.93\times10^{22}$ kg); Europa (671.0 Mm, 1,561 km, $4.80\times10^{22}$); Ganymede (1,070.4 Mm, 2,634 km, $1.482\times10^{23}$, $C/MR^2$ = 0.3115); Callisto (1,882.7 Mm, 2,410 km, $1.076\times10^{23}$, $C/MR^2$ = 0.3549). Mercury: $R$ = 2,440 km, $M = 3.30\times10^{23}$ kg.*

### 1 — Four points of light
**(a)** Explain precisely why four objects orbiting Jupiter was damaging to geocentrism. What exactly did it refute, and what did it *not* refute?
**(b)** Galileo proposed using the moons' eclipses as a universal clock to solve the longitude problem. Explain the principle. Why did it work on land but fail at sea?
**(c)** State how the failure of that clock led to Rømer's 1676 result.
**(d)** Rømer measured a delay of about 22 minutes across Earth's orbit; the true value is 16.6 minutes. Compute the speed of light implied by 22 minutes and compare with the modern value. Identify where most of the error lay, and explain why the result was nonetheless decisive.

### 2 — The gradient
**(a)** Compute the mean densities of the four Galilean moons and tabulate them against orbital distance.
**(b)** State the trend and explain it. What is the analogous solar system pattern, and where was it established?
**(c)** Io's density is 3,528 kg/m³ and the Moon's is 3,344. Callisto's is 1,834. What does this imply about their compositions?
**(d)** Saturn's mid-sized moons show densities of 984–1,609 kg/m³ **with no trend at all.** Explain why, and state what the presence or absence of a satellite density gradient tells you about the parent planet.

### 3 — One ten-thousandth
The total regular-satellite mass is 2.1 × 10⁻⁴ of Jupiter, 2.5 × 10⁻⁴ of Saturn, and 1.1 × 10⁻⁴ of Uranus.
**(a)** Why is it surprising that three very different planets share this ratio?
**(b)** Explain the gas-starved disk model and how it produces a near-universal ratio.
**(c)** What does the model imply about satellites that formed **before** the ones we see?
**(d)** What observation, in principle, would test the model outside our solar system?

### 4 — A world with no craters
**(a)** Io is bombarded like every other body in the Jovian system, yet has zero impact craters. Resolve this. Compute how long a 10-km-deep crater survives at a resurfacing rate of 1 cm/yr.
**(b)** Io's mountains reach 17 km and are **not** volcanic. Explain the mechanism, and state the inversion at its heart in one sentence.
**(c)** Io receives more tidal energy than any other body in the solar system and is also the driest and most sterile of the Galileans. Explain, and connect to the tidal-heating argument.
**(d)** Io's atmosphere partially **collapses** each time it enters Jupiter's shadow. What does this tell you about its composition and its surface temperature?

### 5 — Proving an ocean with a camera *(the finest non-magnetic argument)*
**(a)** Describe the cycloid pattern on Europa's surface and explain how a rotating diurnal tidal stress field produces arcs joined at cusps.
**(b)** Explain why cycloid formation requires the ice shell to be **decoupled** from the interior. What would the stresses be if it were not?
**(c)** State why this argument is scientifically valuable **given that we already had the magnetometer result**. Be precise about what independence buys you.
**(d)** Name two further independent lines of evidence for subsurface oceans described in this chapter, and the bodies they apply to.

### 6 — The dichotomy *(the conceptual core)*
**(a)** Tabulate Ganymede and Callisto: radius, mass, density, moment of inertia factor. Express Callisto's values as percentages of Ganymede's.
**(b)** The moment of inertia factor is 0.4 for a uniform sphere. Interpret Ganymede's 0.3115 and Callisto's 0.3549. How is this quantity measured for a body no spacecraft has landed on?
**(c)** Compute Jupiter's escape velocity at each moon's orbital distance and the resulting ratio of impact energy per unit impactor mass. State the second way Jupiter's gravity favours the inner moon.
**(d)** A factor of ~1.8 in impact energy produced a categorical difference in outcome. Explain the feedback that makes differentiation a **threshold** process rather than a gradual one.
**(e)** Name the two other pairs with the same logical structure, and state the general lesson in one sentence.

### 7 — The moon that fooled us
**(a)** Describe Callisto's surface and say what conclusion you would draw about its interior from images alone.
**(b)** State what is actually true, and how we know.
**(c)** Formulate the methodological lesson as a general principle.
**(d)** Callisto receives a radiation dose several hundred times lower than Europa's. Explain why, using the magnetospheres argument, and say what practical consequence follows.

### 8 — Two faces
**(a)** In 1671 Cassini could see Iapetus on one side of Saturn and not the other. State the two inferences he drew, and note that both were correct.
**(b)** Iapetus's leading hemisphere reflects ~4% of light and its trailing hemisphere ~60%. Describe the runaway process that produces this, naming the external source of the initial asymmetry.
**(c)** Explain why this counts as the same *kind* of process as the Ganymede–Callisto dichotomy, despite involving completely different physics.
**(d)** Iapetus has a 13-km-high equatorial ridge running 1,300 km along its equator, and no accepted explanation. Give the two leading candidates and one difficulty with each.

### 9 — Open problem: settling the dichotomy
The Ganymede–Callisto dichotomy has two families of explanation: **differential impact heating** during the Late Heavy Bombardment, and **tidal heating** from Ganymede's participation in the Laplace resonance.
**(a)** State the principal difficulty with the resonance explanation.
**(b)** State the principal difficulty with the impact explanation.
**(c)** Propose two measurements — one from an orbiter at Ganymede, one from anywhere else in the solar system — that would discriminate between them. For each, say what one hypothesis predicts and what the other does.
**(d)** JUICE will orbit Ganymede but only fly past Callisto. Argue whether that was the right choice, given that Callisto is the *control case*.

## Worked answers

### 1 — Four points of light

**(a)** Geocentrism's structural claim was not merely that Earth is central but that all celestial motion is centred on Earth — that Earth is the unique focus of circular motion. Four objects visibly circling Jupiter, night after night, provided a direct counterexample: here was a centre of motion that was demonstrably not the Earth.

What it did **not** refute is heliocentrism's chief rival by 1610, the Tychonic system, in which the planets orbit the Sun while the Sun orbits Earth — that model accommodates Jovian moons without difficulty. Nor did it prove Earth moves. It removed a *principle*, not a model: after 1610 you could no longer argue that satellites of a moving planet would be left behind, and the burden of proof shifted. (Venus's full set of phases, which Galileo also found in 1610, was the sharper blow, since it is incompatible with Ptolemy but consistent with both Copernicus and Tycho.)

**(b)** Longitude is a **time** problem: knowing the difference between local time (from the Sun or stars) and the time at a reference meridian gives you longitude directly, at 15° per hour. What is needed is a clock readable everywhere. Jupiter's moons supply one: their eclipses occur on a schedule visible from anywhere on the night side of Earth, so a table of predicted times acts as a universal reference.

It failed at sea because the method needs a telescope held steady on a moon a few arcseconds across, from a rolling deck, at night, from a moving platform. It worked on land, where you can mount an instrument, and it became the standard tool for surveying and cartography until the marine chronometer.

**(c)** The method demanded accurate eclipse tables, so astronomers accumulated long, precise records of Io's eclipse timings. Those records refused to fit: eclipses ran early when Earth was near Jupiter and late when it was far, by roughly ±11 minutes. Rømer recognised that the discrepancy tracked Earth–Jupiter distance, and concluded that light takes time to cross it. The clock's errors were the signal.

**(d)** $c = 2\ \text{AU}/(22\times60\ \text{s}) = 2.992\times10^{11}/1320 = 2.27\times10^{8}$ m/s = **227,000 km/s**, versus 299,792 — about **24% low.**

Most of the error was **not** in Rømer's timing but in the astronomical unit, which was poorly determined in 1676; the delay itself (22 min against a true 16.6) contributed the rest. Decisive nonetheless because the *qualitative* claim — that light propagates at a finite speed — was correct, revolutionary, and independent of the calibration. The physics was right and the ruler was wrong, which is a far better position than the reverse.

### 2 — The gradient

**(a)**

| Moon | $a$ (Mm) | Density (kg/m³) |
|---|---|---|
| Io | 421.7 | 3,528 |
| Europa | 671.0 | 3,014 |
| Ganymede | 1,070.4 | 1,936 |
| Callisto | 1,882.7 | 1,834 |

**(b)** Density falls monotonically with distance. The explanation is a temperature gradient in the circumjovian disk: proto-Jupiter was hot and luminous while accreting, so water ice could not condense close in but could further out. Inner moons are therefore rock-and-metal; outer ones are ice-rich.

This is the same logic as the solar system's own rocky-inner/volatile-outer structure, established in the disk and snow-line chapter. Jupiter had its own snow line.

**(c)** Io at 3,528 is essentially lunar rock with metal — almost no volatile content. Callisto at 1,834 requires roughly half water ice by mass, mixed with rock. Europa at 3,014 is mostly rock with a comparatively thin water/ice outer layer — which is exactly why its ocean sits *on rock*, and why that matters for the ocean-worlds chapter.

**(d)** Because Saturn is 3.3× less massive than Jupiter, so it released far less accretional energy and was far less luminous during formation. Its circumplanetary disk therefore had a much weaker temperature gradient, and water ice condensed essentially everywhere — no local snow line, no compositional sequence. The residual scatter (Tethys at 984 versus Enceladus at 1,609) reflects porosity and individual accretion history, not a systematic thermal structure.

General principle: a satellite density gradient is a fossil thermometer for the parent planet's formation luminosity. Its presence implies a hot, luminous protoplanet; its absence implies a faint one. This should be applicable to exoplanet systems as soon as we can resolve satellites at all.

### 3 — One ten-thousandth

**(a)** Because the three planets differ enormously — Jupiter is 22× Uranus's mass, and they formed at very different distances with very different compositions and very different amounts of available material. There is no obvious reason the *fraction* of the planet's mass ending up in satellites should be the same. A shared ratio across such different systems demands a common regulating mechanism, not a coincidence of initial conditions.

**(b)** In the gas-starved disk model, a circumplanetary disk is a flow-through system, not a sealed reservoir: gas is continuously supplied from the surrounding nebula and continuously drains onto the planet. Satellites grow inside it, but they also migrate inward through interaction with the gas and are eventually lost into the planet.

The system therefore reaches a steady state in which the satellite mass present at any moment is set by the ratio of growth rate to loss rate — both of which scale with the planet's properties in similar ways. The equilibrium fraction is consequently near-universal, and largely independent of how much total material passed through.

**(c)** That the moons we see are the last generation, not the only one. Earlier satellites formed, spiralled inward, and were consumed by the planet — possibly several times over. The Galilean moons survive because they happened to exist when the gas supply ran out and migration stopped. Jupiter has eaten most of its moons.

**(d)** Measuring the satellite-to-planet mass ratio for exoplanet systems. If the ratio is set by disk physics rather than by initial conditions, it should recur at ~10⁻⁴ around giant exoplanets generally. Detecting exomoons is at the edge of current capability — transit timing and duration variations are the most promising route — but a handful of confirmed systems would test the model directly. A *statistical* prediction requires a *population* to test it, the same methodological point that governs any population-level claim.

### 4 — A world with no craters

**(a)** The craters are being made; they are not surviving. At 1 cm/yr, burial of 10 km takes

$$t = \frac{10{,}000\ \text{m}}{0.01\ \text{m/yr}} = \mathbf{10^{6}\ \text{years}}$$

One million years. Since the cratering timescale to accumulate a countable population is far longer, the surface is erased faster than it is marked. Io's surface is younger than our species — the crater count is zero not because nothing hits Io but because nothing stays.

**(b)** The mountains are tectonic thrust blocks. Burying the surface at 1 cm/yr forces older crust downward. But a sphere has fixed surface area, so crust driven to smaller radius must be horizontally compressed — and compressed brittle crust fails by thrust faulting, shoving enormous blocks upward along faults.

In one sentence: the volcanism builds the mountains by burying the ground.

**(c)** Io has been intensely tidally heated for billions of years, and the sustained heating has outgassed and driven off essentially all of its volatiles, water included. What remains is sulfur chemistry on a continuously resurfaced, radiation-drenched, bone-dry rock.

This is the Goldilocks warning of tidal heating made concrete: tidal heating is not monotonically favourable to habitability. Io sits at the top of the tidal heating sequence and is the **least** habitable of the four. More energy is not better — beyond a point, the heating cooks the water out.

**(d)** That the atmosphere is composed of a gas that freezes at Io's night-side temperature — specifically sulfur dioxide, which desublimates onto the surface when Io enters Jupiter's shadow and sunlight stops. It tells you the atmosphere is supported by surface frost in vapour equilibrium, not gravitationally retained as a bulk gas: its pressure is set by the surface temperature, so when the temperature drops the atmosphere condenses out. An atmosphere that is a thermodynamic consequence of the surface, rather than a reservoir sitting on top of it.

### 5 — Proving an ocean with a camera

**(a)** Many Europan cracks are chains of arcs, each ~100 km long, meeting at sharp cusps where the direction changes abruptly. A crack propagates under the diurnal tidal stress field, whose orientation rotates as Europa traverses its eccentric 85-hour orbit. The crack runs while the tensile stress exceeds the propagation threshold, stops when it falls below, and restarts in a new direction once the rotating stress field builds again. Each stop–restart makes a cusp; the sequence traces a cycloid.

**(b)** Because the tidal stresses must reach the tens-of-kilopascals range to propagate cracks at all. That magnitude is achieved only if the shell is free to flex independently of the interior — floating on a liquid layer. A shell frozen to the rocky mantle is mechanically coupled to a body that deforms far less, and experiences stresses roughly an order of magnitude smaller: too small to make cycloids at all. The pattern is therefore diagnostic of decoupling, and decoupling requires a liquid layer.

**(c)** Because independence, not accumulation, is what converts a plausible model into an established result. The two arguments share essentially no assumptions: one is electromagnetic induction measured by a magnetometer and analysed through conductivity and skin depth; the other is fracture mechanics measured by a camera and analysed through tidal stress fields. They have different systematic errors and different failure modes.

If both were magnetic measurements, a single flawed assumption about Jupiter's field could corrupt both. Because they are not, the probability of a shared error is very small. Two independent methods agreeing is worth far more than the same method repeated.

**(d)** **Ganymede — auroral oscillation.** Ganymede's auroral ovals rock as Jupiter's field sweeps past, and the observed rocking is damped by the amount expected from an induced field generated in a conducting saltwater layer. Instrument: Hubble, in the ultraviolet. **Enceladus — direct sampling.** Cassini flew through the plume and measured salts, silica grains indicating hot water–rock interaction, and molecular hydrogen. Instrument: mass spectrometer. *(Also creditable: Europa's chaos terrain morphology; the detection of NaCl on Europa's surface.)*

### 6 — The dichotomy

**(a)**

| | Ganymede | Callisto | Callisto as % |
|---|---|---|---|
| Radius | 2,634 km | 2,410 km | **91.5%** |
| Mass | 1.482 × 10²³ kg | 1.076 × 10²³ kg | **72.6%** |
| Density | 1,936 kg/m³ | 1,834 kg/m³ | **94.7%** |
| $C/MR^2$ | 0.3115 | 0.3549 | — |

**(b)** For a uniform sphere $C/MR^2 = 0.4$; lower values mean mass is concentrated toward the centre.

Ganymede's 0.3115 is among the lowest known — strongly differentiated, with dense metal and rock at the middle beneath a thick ice layer. Callisto's 0.3549 is much closer to uniform: a body in which rock and ice never fully separated, still substantially a mixture.

It is measured from the gravity field: the moment of inertia enters the coefficients $J_2$ and $C_{22}$, which perturb a spacecraft's trajectory during close flybys and are recovered from precise Doppler tracking of the radio link. A body's internal mass distribution, measured by how a passing spacecraft is deflected. (This is the same technique as the gravity science used at the giant planets themselves, applied at moon scale.)

**(c)** $v_{\text{esc}} = \sqrt{2GM_J/a}$:
Ganymede: $\sqrt{2(6.674\times10^{-11})(1.898\times10^{27})/1.0704\times10^{9}} = $ **15.4 km/s**
Callisto: **11.6 km/s**
Ratio 1.33; energy per unit mass scales as $v^2$, so **1.76× more impact energy per kilogram** at Ganymede.

The second effect: gravitational focusing. Jupiter's gravity bends incoming trajectories inward, concentrating the impactor flux at smaller radii. So Ganymede is struck both harder and more often.

**(d)** Differentiation is self-amplifying. Separating dense rock from light ice releases gravitational potential energy; that energy heats the body; heating lowers the viscosity of ice; lower viscosity lets rock sink faster; faster sinking releases energy more quickly. Positive feedback.

A feedback loop of this kind has a threshold: below it, losses (conduction to space) exceed the energy released and nothing happens; above it, the process runs away to completion. So the outcome is not proportional to the input. A factor of 1.8 in deposited energy, straddling the threshold, gives you a fully differentiated world with an iron core and a dynamo on one side, and an undifferentiated rock–ice mixture on the other.

**(e)** **Mimas / Enceladus** — small differences in resonance type and interior state produce dead versus erupting. **Uranus / Neptune** — a difference in interior stratification produces no internal heat versus a 2.6× excess. *(Iapetus's two hemispheres are a fourth, within a single body.)*

The lesson: near a threshold, similar inputs do not produce similar outputs — so "these two bodies are alike, therefore they should be alike" is an unreliable inference throughout the outer solar system.

### 7 — The moon that fooled us

**(a)** Callisto has the most heavily cratered surface in the solar system — saturated, meaning new craters mostly destroy old ones rather than adding to the count. It is roughly 4 Gyr old, essentially unmodified since the end of heavy bombardment, and carries the enormous Valhalla multi-ring structure spanning ~3,800 km. From images alone the conclusion is unavoidable: a completely inert body, geologically dead since the early solar system, with a frozen interior.

**(b)** Callisto has a subsurface ocean. It shows the induced magnetic field signature — a response phase-locked to Jupiter's rotating tilted dipole, requiring a conducting layer near the surface, which only salty liquid water can supply.

**(c)** Surface geology is not a reliable guide to interior state. A world can be geologically dead on the outside and wet underneath, because an ice shell can be thick and rigid enough to be immobile while insulating a liquid layer beneath. Determining the interior requires a technique that sees through — induction, gravity, seismology — not one that maps the exterior. More generally: the observable is not the same as the interesting quantity, and confusing them is a systematic hazard in planetary science.

**(d)** Because Callisto orbits at 1,882,700 km = 26.3 $R_J$, far outside the intense inner radiation belts where Europa (9.4 $R_J$) sits. The trapped particle flux drops steeply with distance from the planet, so Callisto's surface dose is several hundred times lower.

The consequence: Callisto is the one Galilean moon a human could plausibly stand on. It appears consistently in crewed outer-solar-system mission studies as the natural base — outside the lethal zone, with water ice available, and with a stable ancient surface. That it is also the least geologically interesting is a nice irony.

### 8 — Two faces

**(a)** Cassini inferred: (1) one hemisphere of Iapetus is far darker than the other; and (2) Iapetus is tidally locked, so that the same face leads throughout its orbit — otherwise the bright and dark sides would not correlate with orbital position. Both are correct, which is a remarkable piece of reasoning from a single asymmetry in visibility with a seventeenth-century telescope.

**(b)** Thermal runaway seeded by an external dust source. Dark reddish dust from Phoebe — a retrograde outer moon, orbiting the wrong way, treated in the captured-moons chapter — spirals inward under Poynting–Robertson drag and preferentially coats Iapetus's leading hemisphere. That face becomes slightly darker → absorbs slightly more sunlight → becomes slightly warmer → surface water ice sublimates → the vapour migrates to the colder trailing hemisphere and poles and refreezes → the leading face, now stripped of bright ice, is darker still.

The initial asymmetry is small; the feedback is what produces coal on one side and snow on the other.

**(c)** Because the *logical structure* is identical even though the physics is not: a small initial asymmetry, acted on by positive feedback, driven past a threshold into a categorically different final state. Ganymede/Callisto uses impact energy and viscosity-dependent differentiation; Iapetus uses albedo and sublimation. Neither outcome is proportional to its input.

Recognising the shared structure is more valuable than either example, because it tells you what kind of question to ask when you meet a new pair of similar bodies with dissimilar outcomes: *not* "what large difference did I miss?" but "what feedback amplified a small one?"

**(d)** **Candidate 1: a collapsed ring.** Material in orbit around Iapetus — perhaps debris from an impact — spiralled in and rained onto the equator, building a ridge. *Difficulty:* it is not obvious how the deposit stays so narrow and so tall, and no other moon shows anything comparable despite similar impact histories.

**Candidate 2: a fossil of rapid early rotation.** Iapetus once spun far faster, developed a large equatorial bulge, and froze the shape in as tides slowed it — the ridge being the relict of the frozen bulge. *Difficulty:* Iapetus's overall shape corresponds to a rotation period of ~16 hours, but its present period is 79 days, requiring a very specific despinning history — the interior must have been warm enough to relax into the fast-rotating shape and then cold enough to preserve it, in the right order and on the right schedule.

### 9 — Open problem: settling the dichotomy

**(a)** **Timing.** Differentiation must occur early, while the body retains accretional and short-lived radiogenic heat and while the ice is warm enough to permit rapid separation. But the Laplace resonance was probably established later, through differential tidal migration — and in most models the moons were not in it during the first few hundred million years. So the resonance may have started heating Ganymede after the window in which differentiation could run away. It also does not obviously explain why Ganymede's differentiation was *complete* rather than partial.

**(b)** The factor is uncomfortably small, and the timing is uncertain. A 1.8× difference in impact energy per unit mass is real but modest, and the argument depends entirely on the threshold being located between the two values — which is a coincidence the model must assume rather than predict. It also depends on the magnitude and timing of the Late Heavy Bombardment in the Jovian system, which is itself constrained mainly by models rather than measurements, and on ice rheology at conditions we cannot reproduce well.

**(c)** Two discriminating measurements:

1. **From a Ganymede orbiter: the detailed internal structure and the age of differentiation.** Precise gravity and magnetic sounding would map the layering — core radius, ice-shell thickness, the depth and thickness of the ocean. Tidal heating predicts a body differentiated relatively late and possibly incompletely at depth, with structure reflecting a prolonged warm episode. Impact heating predicts early, rapid, complete differentiation with a structure set at formation and modified little since. Adding laser altimetry of the tidal deformation ($h_2$) constrains the shell's rigidity and thickness, which discriminates further.

2. **From elsewhere: the impactor record.** The impact hypothesis is a claim about the flux and velocity of bombardment in the outer solar system, which is testable independently of Jupiter — through crater size–frequency distributions on ancient surfaces across the outer system (Callisto itself, Iapetus, Rhea, and Kuiper Belt objects visited by New Horizons). If the inferred bombardment was too weak to reach the threshold at Ganymede's orbit, the impact hypothesis fails regardless of what Ganymede looks like. The tidal hypothesis makes no prediction about the impactor population at all — which is precisely what makes this a clean discriminator.

**(d)** A genuine tension, and the choice was defensible but not obviously right.

**For the choice:** Ganymede is the only moon with a dynamo, the only place to study a magnetosphere within a magnetosphere, and the body where the *outcome* to be explained is actually visible. Orbiting it allows sustained gravity, magnetic and altimetric measurement of the kind described in (c) — and tidal-deformation measurements cannot be done from flybys. Callisto's interior, being nearly undifferentiated, is also structurally simpler and yields more per flyby.

**Against:** the dichotomy is a comparative problem, and in comparative problems the control deserves the same measurement quality as the treatment. A moment of inertia known to different precision at the two bodies limits the comparison to the accuracy of the weaker measurement. There is a real risk of the familiar failure mode: studying the interesting object intensively and the boring object casually, then drawing conclusions about the difference between them.

On balance, JUICE's several Callisto flybys are probably adequate for the bulk parameters that matter most — moment of inertia and the induction response — and the marginal science from orbiting Ganymede is larger. But the argument deserves to be made explicitly rather than assumed, and "we went to the more interesting one" is not the same as "we went to the more informative one."$astroMoons_master$,
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
  select $astroMoons_quiz$[{"id": "q1", "type": "mcq", "prompt": "In 1610 Galileo saw four objects circling Jupiter, and in 1676 Romer used Io's mistimed eclipses to argue for a finite speed of light. What did each result actually establish?", "options": ["The four moons proved the Earth moves around the Sun, and Romer's eclipse timings gave a value for light's speed that was accurate because his measurement of Earth's orbit was excellent.", "The four moons disproved every rival to Copernicus including the Tychonic system, and Romer's result was decisive because it pinned down the astronomical unit for the first time.", "The four moons removed the geocentric principle that all celestial motion is centred on Earth (a centre of motion that was not Earth) but did NOT refute the Tychonic system or prove Earth moves, while Romer's eclipse-timing errors (up to ~11 min either way) yielded a finite light speed of roughly 220,000-227,000 km/s, about 24% low almost entirely because the AU was badly known in 1676 - the physics was right, the ruler was wrong.", "The four moons showed Jupiter has its own miniature planetary system, and Romer's timings failed to yield any usable number because the eclipse schedule was too irregular to tabulate."], "answerIndex": 2, "explanation": "Geocentrism's structural claim was that all celestial motion is centred on Earth. Four objects visibly circling Jupiter, night after night, provided a direct counterexample - a centre of motion that was demonstrably not Earth - so it removed a principle rather than a model. It did NOT refute the Tychonic system (planets orbit the Sun, Sun orbits Earth), which accommodates Jovian moons easily, nor did it prove Earth moves. Separately, astronomers had accumulated Io eclipse timings for the longitude problem, and those timings ran early when Earth was near Jupiter and late when far, by up to about eleven minutes. Romer (1676) recognised that light takes time to cross the changing Earth-Jupiter distance. Huygens combined Romer's delay with the best AU estimate to get roughly 220,000 km/s (a 22-minute delay implies about 227,000 km/s), against the modern 299,792 km/s - about 24% low, with nearly all the error in the poorly-known astronomical unit, not the physics. The qualitative claim (finite speed of light) was correct and independent of the calibration."}, {"id": "q2", "type": "mcq", "prompt": "The Galilean moons' densities fall monotonically outward (3,528 -> 3,014 -> 1,936 -> 1,834 kg/m3), while Saturn's mid-sized moons (984-1,609 kg/m3) show no trend at all. What does this contrast diagnose?", "options": ["Jupiter's disk had a radial temperature gradient set by proto-Jupiter's own accretional luminosity - Jupiter's own snow line, a miniature solar system - whereas Saturn, being 3.3x less massive and far fainter, produced too weak a gradient for a local snow line, so its moons are all ice-rich; the presence or absence of a satellite density gradient is thus a fossil thermometer of how luminous the parent planet was while it formed.", "Jupiter's moons differ in density because tidal heating baked the volatiles out of the inner ones, while Saturn's moons were never tidally heated, so the contrast records heating history, not formation temperature.", "Saturn's moons show no gradient because they formed by giant impacts rather than in a disk, whereas the Galilean moons condensed smoothly from a circumplanetary disk.", "The Galilean gradient reflects how far each moon has migrated inward since formation, while Saturn's moons have not migrated, so density tracks orbital evolution rather than composition."], "answerIndex": 0, "explanation": "The Galilean density fall is the same rock-inner/ice-outer pattern as the solar system itself: proto-Jupiter was hot and luminous while accreting and heated its circumplanetary disk, establishing a radial temperature gradient. Inside a local snow line water ice could not condense (Io at 3,528 is essentially lunar rock); outside it, it could (Callisto at 1,834 requires roughly half ice by mass). Jupiter had its own snow line - the central disk concept operating at one-thousandth scale. Saturn is 3.3x less massive, released far less accretional energy, and was far less luminous, so its disk had a much weaker gradient and ice condensed essentially everywhere; the residual scatter (Tethys at 984, less dense than water, sitting between denser neighbours) reflects porosity and local accretion history, not thermal structure. The presence or absence of a density gradient therefore tells you how luminous the parent planet was while forming - a diagnostic that should extend to exoplanet systems. The distractors wrongly attribute the gradient to later processes (tidal heating, migration, impacts) rather than formation-epoch temperature."}, {"id": "q3", "type": "mcq", "prompt": "Io has zero impact craters and 17-km tectonic mountains, and is the driest of the four Galileans despite receiving the most tidal energy. Which statement correctly links these facts?", "options": ["Io has no craters because it formed after the era of heavy bombardment, its mountains are shield volcanoes, and it is dry because it formed inside Jupiter's snow line with no water to begin with.", "Resurfacing at ~1 cm/yr (10 km/Myr) buries a 10-km crater in about a million years, so craters are made but not preserved and the surface is younger than our species; the 17-km mountains are tectonic thrust blocks - burial drives older crust downward, a fixed-area sphere forces compression, and compressed crust fails by thrust faulting - and billions of years of intense heating drove off essentially all Io's water, making it the driest and deadest of the four, the Goldilocks warning that more tidal energy is not always better.", "Io's craters were erased by a single ancient ocean, its mountains are frozen tidal bulges, and its dryness is unrelated to heating - it simply lost its water to Jupiter's magnetosphere.", "Craters are absent because Io's sulfur surface is too soft to record them, the mountains are impact-ring remnants, and Io is dry because sunlight sublimates its ice, which then escapes."], "answerIndex": 1, "explanation": "Io is bombarded like everything in the Jovian system, but at roughly 1 cm/yr globally (10 km per million years) a 10-km-deep crater is buried in about 10^6 years - craters are made but erased faster than they accumulate, so the count is zero and the surface is younger than Homo sapiens. The mountains (up to 17 km, e.g. Boosaule Montes) are NOT volcanic: burial at a centimetre a year pushes older crust downward, but a sphere has fixed surface area, so crust driven to smaller radius must be horizontally compressed, and compressed brittle crust fails by thrust faulting, shoving blocks upward - the volcanism builds the mountains by burying the ground. Finally, billions of years of intense tidal heating outgassed and drove off essentially all of Io's water, leaving sulfur chemistry (its SO2 atmosphere even partially freezes onto the surface each time Io enters Jupiter's shadow). Io sits atop the tidal-heating sequence yet is the least habitable Galilean - the Goldilocks warning made concrete: more energy is not better."}, {"id": "q4", "type": "mcq", "prompt": "Europa's cycloid cracks are cited as proving a subsurface ocean 'with a camera.' What is the argument, and why does it matter scientifically?", "options": ["A crack propagates under the diurnal tidal stress field, which rotates as Europa moves round its 85-hour eccentric orbit; the crack runs while stress exceeds a threshold, stops, then restarts in a new direction as the field rotates, tracing arcs joined at cusps - and this only works if stresses reach tens of kilopascals, which requires the ice shell to be mechanically decoupled from the interior and floating on liquid (a shell frozen to the mantle sees ~10x smaller stress and makes no cycloids); it matters because it is an independent line of evidence, using a camera and fracture mechanics rather than a magnetometer and induction, that converges on the same ocean.", "The cycloids are frozen tidal bulges whose curvature directly measures ocean depth, confirming what the magnetometer already showed with the same underlying physics.", "The arcs are meltwater channels carved when the ocean occasionally reaches the surface, proving the ice is thin everywhere on Europa.", "The cusps mark where impacts punctured the shell, and their spacing reveals the tidal heating rate rather than the presence of an ocean."], "answerIndex": 0, "explanation": "Many Europan cracks are chains of arcs about 100 km long joined at sharp cusps. A crack propagates under the diurnal tidal stress field, whose orientation rotates as Europa traverses its eccentric 85-hour orbit; it runs while tensile stress exceeds the propagation threshold, stops when it drops, and restarts in a new direction once the rotating field rebuilds - each stop-restart making a cusp, the sequence tracing a cycloid. The model only works if stresses reach tens of kilopascals, achievable only if the shell is decoupled from the interior and free to flex on a liquid layer; a shell frozen to the rocky mantle experiences roughly an order of magnitude smaller stress and cannot make cycloids at all. The scientific value is independence: this is a camera and fracture mechanics, sharing essentially no assumptions with the magnetometer's electromagnetic induction, so the two have different systematic errors and failure modes. Two independent methods agreeing moves the claim from plausible model to established result - far more than repeating one method."}, {"id": "q5", "type": "mcq", "prompt": "Ganymede and Callisto are near-twins (density within 5%, radius within 8%) yet Ganymede is fully differentiated with a dynamo and Callisto is not (moment of inertia factor 0.3115 vs 0.3549, uniform = 0.4). What best explains how such similar bodies ended up categorically different?", "options": ["Ganymede formed from denser material closer to Jupiter's snow line, so it always had more rock to differentiate, while Callisto formed too far out to ever separate.", "Callisto's ocean prevented its interior from differentiating, whereas Ganymede's lack of an ocean let its core form - the interior state is set by whether an ocean is present.", "The favoured account is impact energy plus a threshold: Jupiter focuses and accelerates impactors, so its escape velocity is 15.4 km/s at Ganymede's orbit versus 11.6 km/s at Callisto's, and since energy scales as v^2 Ganymede is struck ~1.8x harder per unit mass (and more often); because differentiation is self-amplifying (separation releases gravitational energy, which lowers ice viscosity, which speeds sinking, which releases more energy), it has a threshold, so a factor of ~1.8 straddling that threshold produces a fully differentiated world with an iron dynamo on one side and an undifferentiated mixture on the other - the same threshold structure as Mimas/Enceladus and Uranus/Neptune.", "Ganymede's dynamo generated internal heat that differentiated it, while Callisto never developed a dynamo, so the magnetic field is the cause and differentiation the effect."], "answerIndex": 2, "explanation": "The moment of inertia factor (C/MR^2) measures how mass is distributed with radius: 0.4 for a uniform sphere, lower as mass concentrates centrally. Ganymede's 0.3115 is among the lowest in the solar system (strongly differentiated, iron core beneath rock beneath ice, supporting its 719 nT intrinsic dynamo - the only moon known to run one), while Callisto's 0.3549 is close to uniform (rock and ice never fully separated); both are measured from the gravity field during flybys. The favoured explanation is impact energy plus a threshold. Jupiter accelerates and focuses impactors, giving an escape velocity of 15.4 km/s at Ganymede's orbit versus 11.6 km/s at Callisto's; since impact energy scales as v^2, Ganymede is struck about 1.8x harder per unit impactor mass, and more often due to stronger focusing. Differentiation is self-amplifying (separation releases gravitational energy, heating the body, lowering ice viscosity, letting rock sink faster, releasing more energy), so it has a threshold: below it almost nothing happens, above it the process runs away to completion. A factor of ~1.8 straddling the threshold thus yields a categorical, not gradual, difference - the same structure as Mimas/Enceladus (dead vs erupting) and Uranus/Neptune (no internal heat vs 2.6x excess). Note the distractor reversing cause and effect: the dynamo is a consequence of differentiation, not its cause."}, {"id": "q6", "type": "open", "prompt": "The chapter argues the Galilean system records three separate gradients, and that reading them in order is the whole point. Lay out all three - what each one is, the mechanism behind it, and the key numbers - and explain how together they support the organising claim that a giant planet's regular satellites form a miniature solar system that also reveals what happens at a threshold.", "rubric": "A strong answer names and distinguishes all three gradients with mechanisms and numbers. (1) The density gradient (formation): 3,528 -> 3,014 -> 1,936 -> 1,834 kg/m3 falling monotonically outward, caused by a radial temperature gradient in proto-Jupiter's own circumplanetary disk (Jupiter was hot and luminous while accreting) - Jupiter's own snow line; Io ~ lunar rock, Callisto ~ half ice by mass; and Saturn's moons (984-1,609, no trend) show none because Saturn was 3.3x less massive and too faint, making the gradient a fossil thermometer of the parent's formation luminosity. (2) The heating gradient (dynamics): Io >> Europa >> Ganymede >> Callisto spanning ~four orders of magnitude, from the a^-6 scaling of tidal heating maintained by the Laplace resonance, showing up in surface ages - under 1 Myr for Io, 40-90 Myr for Europa, ~2 Gyr for Ganymede's light terrain, ~4 Gyr for Callisto (four orders of magnitude in surface age from one mechanism). (3) The differentiation dichotomy (thresholds): Ganymede and Callisto are near-twins (moment of inertia 0.3115 vs 0.3549, uniform 0.4) that ended categorically different because differentiation is a self-amplifying threshold process and a factor of ~1.8 in impact energy (escape velocity 15.4 vs 11.6 km/s, energy ~ v^2) put one over the threshold and left the other under. A top answer ties this together: gradients 1 and 2 show the system is built by the same physics as the real solar system at one-thousandth scale (the miniature-solar-system claim), while gradient 3 shows what the solar system at large does not display so cleanly - two nearly identical bodies pushed to opposite sides of a threshold - and notes this same threshold structure recurs (Mimas/Enceladus, Uranus/Neptune, Iapetus's two faces), making 'these two bodies are alike, so they should be alike' an unreliable inference. Credit also for the closing observations: three of four Galileans have oceans confirmed by three different instruments/arguments, and surface geology is not a reliable guide to interior state."}, {"id": "q7", "type": "open", "prompt": "Callisto has the most heavily cratered, most obviously dead surface in the solar system yet hides a subsurface ocean, while Ganymede's aurorae and Europa's cracks each independently reveal oceans too. Using these cases, state and defend the chapter's methodological lesson about surface geology and interior state, and explain what makes the multiple ocean detections so persuasive. Then note why Callisto is singled out as the moon a human could stand on.", "rubric": "A strong answer states the principle: surface geology is not a reliable guide to interior state - a world can be geologically dead on the outside and wet underneath, because a thick, rigid, ancient ice shell can be immobile while insulating a liquid layer beneath. It should ground this in Callisto: saturated ~4 Gyr surface, unmodified since heavy bombardment, carrying the Valhalla multi-ring structure (~3,800 km across); from images alone one would call it completely inert with a frozen interior, yet it shows the magnetic induction signature of a conducting salty layer (an ocean). The answer should explain why the ocean case is persuasive by independence, not accumulation: three of the four Galileans have oceans established by three different physical arguments using three different instruments - magnetic induction (magnetometer) at Europa/Callisto, cycloid fracture mechanics (camera) at Europa, and damped auroral oscillation (Hubble UV) at Ganymede - which share essentially no assumptions, so a single flawed assumption cannot corrupt them all; convergence of independent methods is what moves a claim to 'established.' Determining the interior requires a technique that sees through (induction, gravity, seismology), not one that maps the exterior; more generally the observable is not the same as the interesting quantity. Finally, Callisto orbits far outside the intense inner radiation belts (well beyond Europa) and receives a dose several hundred times lower than Europa's, so it is consistently proposed as the site of crewed outer-solar-system missions - the one Galilean moon a human could stand on, with the irony that it is also the least geologically interesting."}]$astroMoons_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/giant-planets/major-moons', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
