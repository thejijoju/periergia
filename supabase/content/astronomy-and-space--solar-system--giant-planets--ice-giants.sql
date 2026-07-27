-- Astronomy & Space · The Solar System — Giant Planets —
-- "Ice Giants: Uranus and Neptune". Curated, human-reviewed master for
-- astronomy-and-space/solar-system/giant-planets/ice-giants @ research/advanced/read.
-- Applied by db-migrate after seed.sql; idempotent upsert.
--
-- A distinct class formed where the disk ran out of gas.

with master as (
  insert into content (node_id, depth, level, format, body, generated, reviewed)
  values (
    'astronomy-and-space/solar-system/giant-planets/ice-giants',
    'research',
    'advanced',
    'read',
    $astroIce_master$> Jupiter and Saturn are made of hydrogen, in quantities large enough that hydrogen stops behaving like itself — and almost everything about them descends from that one fact. Uranus and Neptune got a different allocation of building material, and the result is two worlds that are not small gas giants but a distinct class: a modest hydrogen envelope wrapped around a massive, hot, electrically conducting ocean of water, ammonia and methane. They are also where the outer solar system keeps its unsolved problems. Three of them — the tilt, the missing heat, and the deranged magnetic field — are genuinely open, genuinely important, and genuinely tractable if anyone ever goes back. Nobody has been since 1989. This is the part of planetary science where the honest answer to a good question is most often *we do not know* — and a subject that only taught settled results would be teaching a false picture of what science is.

{{image: Uranus | Uranus imaged by Voyager 2 in 1986: a nearly featureless pale cyan disc. The blandness turned out to be an accident of timing, not a property of the planet.}}

## The planet found with a pen

### Uranus: seen twenty-two times and never noticed

On the night of **13 March 1781**, William Herschel — a professional musician and amateur astronomer working from a garden in Bath with a telescope he had built himself — noticed a small object that did not look quite like a star. It showed a disc. He recorded it as a comet.

It was a planet. The **first planet discovered in recorded history**, and its discovery instantly **doubled the known size of the solar system.** Every civilisation that had ever looked up had counted the same six worlds. Herschel made it seven.

Here is the part that matters. Uranus is, at opposition, right at the edge of naked-eye visibility, and it had been catalogued as a star at least **twenty-two times before Herschel.** John Flamsteed, the first Astronomer Royal, recorded it in 1690 and gave it a name: **34 Tauri.** He entered it in a star catalogue. So did Le Monnier, repeatedly, in the 1760s and 70s.

None of them were bad astronomers. They saw it clearly and measured its position accurately. What they did not do was **come back and check whether it had moved.**

Keep that. It is the first of two lessons here, and it is this: **observation is not discovery.** A measurement sitting in a catalogue, correct and unexamined, is not knowledge. What Herschel added was not better eyes but the decision to look again.

{{image: William Herschel | William Herschel, the Bath musician whose homemade reflector caught a "comet" that turned out to be the seventh planet.}}

### Neptune: found on paper

Within a few decades of Herschel, a problem emerged. Uranus was not where it should be. Astronomers computed its orbit from Newtonian gravity, accounting for the pull of Jupiter and Saturn, and the predictions drifted off. By the 1840s the discrepancy had grown to about **two arcminutes** — small, but far larger than the errors of measurement.

Two arcminutes is roughly a fifteenth of the width of the full Moon. And a great deal was riding on it, because there were only two possible explanations: either **Newton's law of gravitation was wrong**, or **there was something else out there pulling.**

Urbain Le Verrier in Paris — and, independently and slightly earlier, John Couch Adams in Cambridge — took the second option and did something audacious: they used the *errors* in Uranus's position to compute the mass and orbit of an unseen planet. This is a brutally difficult inverse problem. You are given a small residual wobble and asked to find the object causing it, with its distance, mass, and position all unknown at once.

Le Verrier finished, could not persuade any French observatory to take him seriously, and wrote to Johann Galle at the Berlin Observatory. Galle received the letter on **23 September 1846** and went to the telescope that night with his student Heinrich d'Arrest.

They found it in under an hour, **within about one degree of the predicted position.**

It is worth being precise about how extraordinary this is, because it is easy to let it slide past as a nice anecdote. **A planet 4.5 billion kilometres away was located by a man doing arithmetic**, and the sky was then asked to confirm it and did, on the first night of looking. It remains one of the most complete vindications of a physical theory in the history of science. Newton's law had been used not just to explain the observed, but to demand the existence of the unobserved — and the unobserved showed up.

And the coda is the same lesson as before. **Galileo drew Neptune in December 1612 and January 1613**, while observing Jupiter's moons, and recorded it as a fixed star. He even noted, on one occasion, that it seemed to have moved — and did not follow it up. Neptune was in humanity's notebooks 233 years before anyone noticed what it was.

### And then

Now hold both of those stories against this one.

Voyager 2 flew past **Uranus on 24 January 1986** and past **Neptune on 25 August 1989.** Those are the entire history of close-range observation of the ice giants. Two encounters, each lasting a matter of days, by a spacecraft designed in the early 1970s, returning data at 21.6 kilobits per second across a gap that put four hours and ten minutes of light-travel between the instrument and the instruction.

Four days after the Uranus encounter, *Challenger* was lost. The flyby — humanity's first and still only visit to the seventh planet — disappeared from the news cycle within a week and has never really returned to it.

So: the planet found by the greatest triumph of theoretical astronomy is the planet we know least about. That is where this story starts.

## Not small gas giants

The first thing to establish is that "ice giant" is a real category and not a polite word for "runt." The naming is recent — it became standard only in the 1990s — and it corrects a genuine forty-year misconception.

Start with the numbers.

| | Mass (M⊕) | Radius (R⊕) | Mean density (kg/m³) |
|---|---|---|---|
| Jupiter | 317.8 | 11.21 | 1,326 |
| Saturn | 95.2 | 9.45 | **687** |
| **Uranus** | **14.5** | **4.01** | **1,270** |
| **Neptune** | **17.2** | **3.86** | **1,638** |

Look at the density column, and remember the lesson of the gas giants chapter: for a compressible body, **density is mainly a measure of mass, not composition.** Jupiter is denser than Saturn purely because it squeezes itself harder.

Now apply that reasoning here, and it breaks. Uranus and Neptune are **far less massive than Saturn** — a sixth and a fifth of its mass — so they compress themselves far less. If they were made of the same stuff, they should be **much less dense than Saturn.** Instead they are **roughly twice as dense**, and Neptune is the densest giant in the solar system.

That gap cannot be closed by compression. It has to be composition.

Run the check the other way. If you built a 14.5 M⊕ world out of pure hydrogen and helium and let it settle, it would have a radius of around **31,000 km.** Uranus's is **25,400.** It is too small for its mass by a wide margin, which is another way of saying it is made of heavier stuff.

### What they are actually made of

Interior models converge on roughly:

- **60–70% "ices"** — water, ammonia, methane
- **20–30% rock** — silicates and iron
- **only ~5–15% hydrogen and helium**, perhaps 1–4 Earth masses of it, as a comparatively thin outer envelope

Compare Jupiter and Saturn at roughly **90% H/He.** These are not the same kind of object. Jupiter is a ball of hydrogen with some heavy elements dissolved in it. **Uranus is a ball of hot water with a hydrogen atmosphere on top.**

### A warning about the word "ice"

The name is a trap, and it is worth defusing now. In planetary science, **"ices" means the class of compounds — water, ammonia, methane — not their physical state.** It is a leftover from the formation story: these are the volatiles that condensed as solids beyond the snow line and were available to build cores.

Inside Uranus and Neptune today, essentially none of this material is ice in any ordinary sense. It is a **hot, dense, electrically conducting fluid** at thousands of kelvin and hundreds of thousands of atmospheres. Its temperature is in the thousands of degrees. Calling it ice is a bit like calling the Earth's core "iron filings" — technically the right element, catastrophically the wrong picture.

### Why they exist at all — and a real problem

The formation story belongs to the chapter on how the planets built themselves, but the short version is this.

Beyond the snow line, cores grow fast. Jupiter and Saturn reached the ~10 M⊕ runaway threshold early and captured enormous amounts of gas. Uranus and Neptune reached comparable core masses **too late** — the gas disk dissipated before they could do much accreting — and so they ended up with rock-and-ice cores and only a modest hydrogen envelope.

**Ice giants are what happens when you win the core race but lose the gas race.**

That is the standard account and it is probably broadly right. But be aware of the difficulty underneath it, because it is one of the genuinely unsolved problems of planet formation: **at 19 and 30 AU, the disk is so sparse and orbital periods so long that building a 10 M⊕ core within the disk's lifetime is very hard.** Timescales come out too long by a wide margin. The leading resolutions are that they formed **closer in and migrated outward** (which the Nice model requires for other reasons anyway), and/or that growth was accelerated by **pebble accretion** — the capture of centimetre-scale particles whose aerodynamic drag makes them far easier to accrete than kilometre-scale planetesimals.

Hold that loosely. It is an active field.

## Inside: an ocean that conducts

The interior structure that models converge on has three layers, with — as at Jupiter — **no sharp boundaries** anywhere.

**The atmosphere.** Hydrogen, helium, and a few percent **methane**. The methane is what you see: it absorbs strongly in the red, so the reflected light comes back blue. Neptune's deeper blue than Uranus's pale cyan is partly a slightly higher methane fraction and partly a difference in high-altitude haze. Below the visible clouds sit layers of methane ice, then hydrogen sulfide and ammonia — and, deep down, water.

**The mantle — the bulk of the planet.** A hot, dense fluid of water, ammonia and methane at thousands of kelvin. It is sometimes called a "water–ammonia ocean," which is evocative and misleading; there is no surface, and it is nothing like an ocean you could swim in. What matters is a single property: **it conducts electricity.**

At these pressures, water molecules are pushed close enough together that protons begin hopping between them and the fluid becomes **ionic** — a soup of H⁺, OH⁻ and free charge carriers. That is a conductor, and it is not a very good one by metallic standards, but it is more than good enough to run a dynamo.

**A rocky core**, perhaps an Earth mass or two, at maybe 5,000–7,000 K — though as at Jupiter it is increasingly unclear whether the boundary is sharp or whether the heavy elements are smeared into the mantle above.

### Superionic water, and a lovely piece of laboratory physics

Deeper still, theory predicts something genuinely exotic. At sufficiently high pressure and temperature, water is expected to enter a **superionic** phase: the oxygen atoms lock into a rigid crystalline lattice — a solid — while the hydrogen nuclei break free and flow through it like a liquid.

**A substance that is simultaneously a solid and a liquid, depending on which atom you ask about.** It is a solid oxygen crystal with a proton fluid running through its channels, and because those protons carry charge, it is also an excellent conductor.

Predicted from simulation in the 1980s and 90s, superionic ice was finally **created and observed in the laboratory** in 2018–2019, by shock-compressing water with the giant lasers at the National Ignition Facility and at the Omega laser — reaching millions of atmospheres and thousands of kelvin for a few billionths of a second, long enough to measure the crystal structure by X-ray diffraction.

This deserves the same emphasis as metallic hydrogen. **We built the largest laser in the world partly to find out what Uranus is made of.** And the loop closes: the confirmed existence of a superionic layer feeds directly into the interior and dynamo models we are about to use.

## The magnetic field that broke the model

Now the diagnostic — the observation that tells us more about the ice giants' interiors than anything else we have, and which Voyager 2 got almost by accident because a magnetometer is cheap and light.

Every magnetic field we had studied before 1986 looked broadly the same: a **dipole**, roughly aligned with the rotation axis, roughly centred on the planet.

| | Dipole tilt from spin axis | Offset from centre |
|---|---|---|
| Earth | 11° | 0.08 R |
| Jupiter | 9.6° | 0.10 R |
| Saturn | <0.01° | 0.04 R |
| **Uranus** | **59°** | **0.33 R** |
| **Neptune** | **47°** | **0.55 R** |

Voyager 2 arrived at Uranus and found a field tilted **fifty-nine degrees** from the rotation axis and offset a **third of the way to the surface.** The obvious reading at the time was that we had caught Uranus mid–field reversal, or that the tilt was somehow related to the planet's absurd obliquity.

Then it reached Neptune, which has an ordinary obliquity, and found essentially the same thing: **47° of tilt and an offset of more than half a planetary radius**, so extreme that the field's centre lies outside the region where you would put a core. Two planets, one shared pathology. Not a coincidence, not a reversal — a **class property**.

And the fields are not merely tilted dipoles. They are strongly **multipolar**: the quadrupole and octupole terms are comparable in strength to the dipole, which is not true of any other planet we know.

### What this tells you

Work backward from the observation, because this is a beautiful piece of inference.

A dynamo operating in a **deep, thick, spherical shell surrounding a core** — Earth's geometry, Jupiter's geometry — is strongly organised by rotation across the whole shell, and it robustly produces a dominant dipole roughly aligned with the spin axis. That is why every field we knew before 1986 looked the same.

To get a tilted, offset, multipolar field, you need the **opposite geometry**: convection confined to a relatively **thin shell**, not deep enough for rotation to impose global order, sitting well away from the centre. Numerical dynamo simulations bear this out — thin-shell dynamos reproduce the ice giants' fields rather well, and they do it without fine-tuning.

So the field is telling us where the conducting fluid is, and the answer is: **in a shell in the outer mantle, with a stably stratified, non-convecting region beneath it.** The deep interior is not participating.

That is a structural claim about the inside of a planet, derived from a magnetometer that flew past for a few hours.

### One consequence worth picturing

Because Uranus's field is tilted 59° from its spin axis, and its spin axis is tipped 98° from its orbit, the magnetosphere does not sit in a stable orientation at all. It **tumbles.** Every 17-hour rotation, the field's orientation relative to the incoming solar wind sweeps through an enormous range, and the magnetosphere opens and closes — connecting to the solar wind and disconnecting again — on a daily cycle.

There is nothing else like it. Earth's magnetosphere reconnects episodically during storms; Uranus's does it as a matter of routine, twice a day, forever.

## The tilt

Uranus's axial tilt is **97.77°.**

Not 98° from vertical in the way Earth is 23.4° from vertical. Past ninety. The planet is tipped **over**, rolling around its orbit rather than spinning upright, and because the tilt exceeds 90° its rotation is technically **retrograde.**

### What that does to a year

Uranus takes **84 Earth years** to orbit. At solstice, one pole points nearly directly at the Sun, and stays there. The consequence:

> **Forty-two years of continuous daylight, followed by forty-two years of continuous night** — over most of the planet, not just at the poles.

The subsolar point migrates from pole to pole and back over the 84-year cycle. It is the most extreme seasonal forcing of any planet in the solar system by an enormous margin, and it produced one of the more embarrassing episodes in modern planetary science, which we will come to.

### How did it happen?

The standard explanation is a **giant impact**: one or more collisions with an Earth-mass-or-larger body during the final stages of accretion, knocking the planet over.

This is plausible on its face — we have already used giant impacts to explain Earth's Moon and Mercury's iron enrichment, and the late stages of planet formation were violent. But there is a specific and serious objection, and it is worth seeing because it is a good example of how a single observation constrains a hypothesis.

**Uranus's regular moons — Miranda, Ariel, Umbriel, Titania, Oberon — orbit neatly in the plane of its tilted equator.** So do its rings.

That is a problem. If the moons formed before the impact, they formed in the plane of the *original* equator, and knocking the planet over would leave them orbiting in the *old* plane, wildly inclined to the new one. They are not. The whole system is tilted together, as a unit.

Three ways out, none fully satisfactory:

1. **The moons formed after, from impact debris.** The collision produced a disk, which then re-accreted into the current satellite system. This works dynamically, and it makes a testable prediction: the moons' compositions should reflect impact-processed material. **We have essentially no compositional data on the Uranian moons.**
2. **The moons re-aligned.** If the impact left a massive disk, gravitational torques could have dragged the pre-existing satellites into the new equatorial plane over time. Also works, also unverified.
3. **It wasn't an impact.** Alternatives exist — a slow tilt driven by a resonance between the planet's spin precession and orbital precession during the era of planetary migration, or the torque of a large former moon that has since been lost. These avoid the satellite problem entirely but have difficulties of their own.

None of these is a safe bet. **Note also that "a giant impact did it" is doing suspicious amounts of work across the solar system** — the Moon, Mercury's mantle, Uranus's tilt, Jupiter's dilute core, the destruction of Neptune's original satellite system. Each case is individually reasonable. Collectively, we should be a bit uneasy about how often a hypothesis that is difficult to falsify gets deployed.

## The heat that isn't there

Now the anomaly that may be the most important unsolved problem in the outer solar system, and the good news is that you can establish it yourself from Earth-based data.

The method is the one from the gas giants chapter. Measure the sunlight absorbed; measure the infrared emitted; compare.

| | Absorbed | Emitted / Absorbed | Internal flux |
|---|---|---|---|
| Jupiter | — | 1.64 | 5.3 W/m² |
| Saturn | — | ~1.8 | 2.2 W/m² |
| **Neptune** | — | **2.6** | **0.43 W/m²** |
| **Uranus** | — | **1.06 ± 0.08** | **≈ 0.04 W/m²** |

**Neptune radiates 2.6 times the energy it receives** — proportionally the largest excess of any planet in the solar system.

**Uranus radiates 1.06 times what it receives** — a value statistically consistent with **zero internal heat.** It is the only planet in the solar system in approximate thermal equilibrium with sunlight.

### Why this is so strange

These two worlds are near-twins. Neptune is 18% more massive than Uranus and 3% smaller. They have similar compositions, similar sizes, similar structures, and formed in the same region by the same process. Everything we know about planetary heat says they should behave alike: internal heat comes from residual formation energy and slow contraction, and two bodies of nearly identical mass and age should be losing it at nearly identical rates.

They differ by a factor of roughly **ten.**

{{image: Neptune | Neptune photographed by Voyager 2 in 1989, its deep blue banded by the fastest winds ever measured on a planet. Unlike Uranus, it radiates 2.6 times the energy it receives from the Sun.}}

### The consequence, in one number

Here is the way to feel it. Neptune orbits at 30.1 AU and Uranus at 19.2, so **Neptune receives 2.5 times less sunlight.** By the equilibrium calculation, Neptune ought to be substantially colder.

Measured effective temperatures:

- **Uranus: 59.1 K**
- **Neptune: 59.3 K**

**They are the same temperature.** Neptune is as warm as Uranus while receiving 41% of the sunlight, and it manages that because it makes up the difference itself. Uranus cannot, and so its effective temperature (59.1 K) sits essentially on top of its equilibrium temperature (58.1 K).

Two numbers, obtainable with a telescope and a thermometer, that tell you one of these planets has an engine running and the other does not.

### Candidate explanations

**The impact drained it.** If the collision that tipped Uranus over was violent enough, it may have driven a burst of convection that dumped the planet's primordial heat early, leaving it cold ever since. Attractively economical — one event, two anomalies. But it must be arranged carefully: too much energy and you *heat* the planet rather than cooling it.

**The heat is trapped, not absent.** This is currently the more favoured line. If Uranus's interior is **compositionally stratified** — with layers of differing composition, heavier below lighter — convection is suppressed, because a rising parcel that is denser than its surroundings sinks back. Heat then escapes only by conduction, which is vastly slower. On this picture Uranus is not cold; it is **insulated**, and still hot inside with no way to get the heat out.

This ties in nicely with the magnetic field: a stably stratified, non-convecting deep interior is exactly what the thin-shell dynamo requires. **One structural feature would explain both the missing heat and the deranged magnetic field.** That is the kind of joint explanation that earned the helium-rain argument its status for the gas giants, and it is the main reason to like this option.

**Neptune is the anomaly, not Uranus.** Perhaps Neptune has an extra source — for instance the tidal heating and rearrangement associated with capturing Triton, or a difference in interior layering — and Uranus is the normal one.

### Why it matters beyond bookkeeping

Do not file this as trivia. The internal heat flux is the **primary constraint on interior structure and thermal history**, and it feeds directly into how we model every ice-giant-mass exoplanet in the catalogue. If two planets this similar can differ by a factor of ten, then our thermal-evolution models are missing something first-order — and we are currently applying those models to thousands of worlds.

**The most common class of planet in the galaxy is the class we cannot yet get the energy budget right for.**

## The fastest winds, on the coldest planets

You would expect atmospheric activity to track available energy. It does not. It runs almost exactly backwards.

| | Peak winds |
|---|---|
| Earth (jet stream) | ~100 m/s |
| Jupiter | ~150 m/s |
| Saturn | ~470 m/s |
| Uranus | ~250 m/s |
| **Neptune** | **~580 m/s (≈2,100 km/h)** |

**Neptune has the fastest winds ever measured on a planet** — supersonic with respect to its own atmosphere — on a world receiving one nine-hundredth of Earth's sunlight, at 59 K.

Voyager 2 also found the **Great Dark Spot**, an anticyclone the size of Eurasia. When Hubble looked in 1994, it was **gone.** Other dark spots have since appeared and vanished on timescales of years. Contrast the Great Red Spot, stable for centuries. Neptune's atmosphere is violently variable in a way Jupiter's is not, and we do not have a satisfying account of why.

{{image: Great Dark Spot | Neptune's Great Dark Spot, an Earth-sized anticyclone seen by Voyager 2 in 1989. By the time Hubble looked in 1994 it had vanished entirely.}}

### The Uranus embarrassment

Voyager 2 arrived at Uranus in 1986 and photographed a nearly **featureless pale blue disc.** A few faint bands, essentially no weather. It went straight into the textbooks: Uranus is bland, and no wonder — it has no internal heat to drive convection.

Then Uranus reached **equinox in 2007**, and ground-based telescopes and Hubble began seeing storms, bright convective plumes, and distinct banding.

Uranus was not bland. **We had visited during a solstice**, when one pole faced the Sun and the seasonal forcing was at its most uniform, and we had generalised from a single snapshot of an 84-year cycle. It is the same failure as the Galileo probe in a new costume: *a perfect instrument, in the wrong place — this time in the wrong decade.*

**A flyby samples a moment.** If the phenomenon varies on an 84-year timescale, a four-day encounter tells you about four days. This is, on its own, a sufficient argument for an orbiter.

### How deep does the weather go?

Same technique as for the gas giants — winds carry mass, mass perturbs gravity — applied to Voyager tracking data and refined by modelling. The answer for both ice giants is roughly **1,000 km**, about **4%** of the radius, holding only a **tenth of a percent** of the planet's mass.

So the pattern across all four giants: the jets are a **thin outer skin**, and the transition depth again tracks the onset of electrical conductivity, where magnetic braking enforces uniform rotation. Jupiter 4.2%, Saturn 15%, Uranus 3.9%, Neptune 4.0%. The same physics, four times, on planets with wildly different compositions.

{{image: Voyager 2 | Voyager 2, launched in 1977 and still the only spacecraft to have visited either ice giant. Its brief flybys in 1986 and 1989 remain the entire close-range record of both planets.}}

## Rings, and a moon with a twenty-kilometre cliff

Both planets have systems of rings and moons that get proper treatment elsewhere in the giant-planet story. Three things belong here.

**Uranus's rings were discovered by accident, from an aeroplane.** On 10 March 1977, astronomers aboard the **Kuiper Airborne Observatory** — a telescope in the side of a converted C-141 — watched Uranus pass in front of a faint star, hoping to measure the planet's atmosphere from how the starlight faded. Before Uranus reached the star, **the star blinked out five times.** Then, after the planet had passed, it blinked out five more times, symmetrically.

Something narrow and dark was orbiting Uranus. The technique — **stellar occultation** — remains one of the most powerful tools we have for finding faint structures at enormous distance, and it works from Earth. Uranus's rings are dark, narrow and dusty, nothing like Saturn's, and they were found by watching a star flicker.

**Neptune's rings had an even stranger discovery.** Occultation observations in the 1980s produced maddeningly inconsistent results — sometimes a dip, usually nothing. The rings appeared to be **incomplete**, which is dynamically impossible for a free ring: differential orbital speeds should smear any arc into a full circle within decades. Voyager 2 confirmed the arcs are real, and the resolution is **resonant confinement by the moon Galatea**. A ring held together by a moon it never touches.

**Miranda** deserves a mention now. It is 470 km across — small, and by rights should be a dead cratered ball. Instead its surface is a chaotic patchwork of wildly mismatched terrains, and it carries **Verona Rupes**, a scarp with a vertical drop of roughly **20 kilometres.** In Miranda's feeble gravity you would fall for about ten minutes. Nobody is sure whether this records a catastrophic disruption and re-accretion, or an episode of tidal heating during a past resonance — which is exactly the machinery of the tidal-heating chapter.

{{image: Miranda (moon) | Miranda, just 470 km across, with terrain that has no business existing on so small a body — including Verona Rupes, a cliff with a drop of roughly 20 kilometres.}}

## Why this is the most important chapter in the giant-planet story

Now the argument that reframes everything above.

The Kepler mission surveyed enough stars to make planet-occurrence statistics real, and the headline result was not what anyone expected. **The most common planets in the galaxy are those between Earth and Neptune in size** — super-Earths and sub-Neptunes, roughly 1 to 4 Earth radii.

Our solar system contains **no example** of the single most common type of planet. There is nothing between Earth (1.0 R⊕) and Uranus (4.0 R⊕). We live in an unusual system, and the gap sits exactly where the galaxy's population peaks.

The nearest analogues we can actually go to and touch are **Uranus and Neptune.**

So the case for the ice giants is not the parochial one that they are the last unvisited planets. It is that they are the only accessible members of the class that dominates the galaxy, and every model applied to those thousands of exoplanets — interior structure, atmospheric composition, thermal evolution, magnetic field generation, formation and migration — is calibrated on **two objects we have seen once each, for a few days, with 1970s instruments.**

And we know those models are broken, because they cannot explain why one of the two has no internal heat.

### The case for going back, and the clock

The **2023–2032 Planetary Science Decadal Survey** made **Uranus Orbiter and Probe** its highest-priority flagship mission: an orbiter for years of coverage, plus an atmospheric entry probe on the Galileo model to measure composition directly — noble gases, isotope ratios, the helium fraction, the deep water abundance.

There is a scheduling constraint that is worth understanding, because it is a nice piece of orbital mechanics with a deadline attached. Getting to Uranus efficiently wants a **Jupiter gravity assist**, and Jupiter is only in the right place for a favourable geometry during a window that runs to roughly **2031–2032.** Hit it and the cruise is about thirteen years. Miss it and the cruise grows by years, or the delivered mass shrinks, or both.

Arrival would be in the **mid-2040s** — around sixty years after Voyager 2, and, if the schedule holds, near Uranus's equinox, when both hemispheres are illuminated and the seasonal cycle is at its most informative.

It is worth stating plainly what that means, because it is a fact about how this kind of science actually works. **A mission launched in 2032 returns its main results in the 2040s.** Many of the scientists who wrote the decadal recommendation will not be working when the data arrive. The people who will analyse it are, right now, in school.

## Pulling the thread

The ice giants are what happens when a core wins the accretion race and loses the gas race. Everything follows:

- **A modest hydrogen envelope over a massive mantle of water, ammonia and methane** — so they are twice Saturn's density at a fifth of its mass, and the density difference is **composition**, not compression. They are a separate class.
- That mantle is a **hot conducting ionic fluid**, plausibly superionic at depth — a solid oxygen lattice with a proton liquid flowing through it, a phase we confirmed with the world's largest laser.
- Conduction plus rotation gives a dynamo, but the **fields are tilted, offset and multipolar**, which is the signature of a **thin convecting shell** rather than a deep core — a structural claim about the interior, extracted from a magnetometer that flew past for a few hours.
- **Uranus is tipped past ninety degrees**, giving forty-two-year days, and we do not know why — the giant impact story runs into the fact that its moons and rings tilted with it.
- **Neptune radiates 2.6× what it absorbs; Uranus radiates essentially nothing extra** — two near-twins differing tenfold, which is why they are the same temperature despite Neptune receiving 2.5× less sunlight. The leading explanation is a **stratified, non-convecting interior**, which would also explain the thin-shell dynamo. Not settled.
- And the **fastest winds in the solar system blow on the planet with the least sunlight**, in a thin skin about 4% deep, over an interior that rotates as a solid because it conducts.

The last point is the one to carry forward. With the gas giants, the planets were spectacular but comfortable — we understood them. Here the pattern breaks, and the honest summary is this: **we have three first-order unsolved problems about the most common kind of planet in the galaxy, and the data we are using to attack them were collected before most people alive today were born.**

## Further reading

The frustrating truth about the ice giants is that there is no single good popular book devoted to them — a gap that itself says something about how neglected these two worlds have been. The most rewarding reading is primary and freely available: the Voyager 2 encounter results from 1986 and 1989, and the **2023–2032 Planetary Science Decadal Survey**, which lays out the scientific case for Uranus Orbiter and Probe in careful detail and is written to be read by non-specialists. For the laboratory side, the 2018–2019 papers announcing the creation of superionic ice at the National Ignition Facility and the Omega laser are a vivid demonstration of how planetary interiors are now studied with the largest lasers on Earth. Any current introductory planetary-science text will carry the interior and dynamo models; just check the publication date, because this is a field where the picture is still moving.

## Problems

The density argument establishes the class distinction and should not be skipped. The heat comparison is the calculation that can be done from Earth and that defines the central anomaly of these two worlds. The magnetic-field inference is the finest piece of structural reasoning in the whole giant-planet story. The final problem is unsettled, and is meant to be argued about.

*Constants: $G = 6.674\times10^{-11}$, $\sigma = 5.670\times10^{-8}$ W m⁻² K⁻⁴, $L_\odot = 3.828\times10^{26}$ W, 1 AU = 1.496 × 10¹¹ m. Uranus: $M = 8.681\times10^{25}$ kg, $R = 25{,}362$ km (volumetric), $a = 19.19$ AU, Bond albedo 0.300, $T_{eff} = 59.1$ K, obliquity 97.77°, period 84.0 yr. Neptune: $M = 1.0241\times10^{26}$ kg, $R = 24{,}622$ km, $a = 30.07$ AU, Bond albedo 0.290, $T_{eff} = 59.3$ K. Earth = $5.972\times10^{24}$ kg, 6,371 km.*

### 1 — Observation is not discovery
**(a)** Uranus was recorded as a star at least 22 times before 1781, including by the first Astronomer Royal, who catalogued it as "34 Tauri." Galileo drew Neptune twice in 1612–13. Neither man was incompetent. What, precisely, did they fail to do?
**(b)** Le Verrier and Adams worked from a discrepancy in Uranus's position of about **2 arcminutes**. Express that as a fraction of the full Moon's angular diameter (31 arcmin), and state the two competing explanations that a discrepancy of that size forced astronomers to choose between.
**(c)** Why is the Neptune prediction usually described as a triumph of *Newtonian* physics specifically, rather than of observation?
**(d)** A generation later, Le Verrier applied the identical method to an anomaly in Mercury's orbit and predicted a planet he named Vulcan. It does not exist; the anomaly required general relativity. What does the pairing of these two episodes teach about the method?

### 2 — Establishing the class *(do not skip)*
**(a)** Compute the mean densities of Uranus and Neptune and tabulate them against Jupiter (1,326) and Saturn (687) kg/m³.
**(b)** For a compressible body, mean density mostly measures *mass*, not composition. Uranus is one-sixth of Saturn's mass. On that principle alone, what would you predict about its density relative to Saturn's? What is observed?
**(c)** Resolve the contradiction. What must be true of Uranus and Neptune?
**(d)** A 14.5 M⊕ body made purely of H/He would have a radius near 31,000 km; Uranus's is 25,400 km. Show how this is the same argument as (c) run in reverse.
**(e)** Why is the term "ice giant" actively misleading about the present-day interior, and what does "ice" actually refer to?

### 3 — The gas race
**(a)** State, in two sentences, why Uranus and Neptune have small hydrogen envelopes while Jupiter and Saturn have enormous ones. Both pairs formed beyond the snow line.
**(b)** There is a serious timescale problem with forming 10 M⊕ cores at 19 and 30 AU. Explain why distance makes it hard — give two distinct reasons.
**(c)** Name the two leading resolutions.
**(d)** Neptune is *more massive* than Uranus despite being *further out*, where the disk was thinner and orbits slower. Why is that awkward for the simplest version of the formation story, and what does it suggest?

### 4 — The engine that isn't running *(the central anomaly)*
**(a)** Compute the solar constant at Uranus and at Neptune. Express each as a fraction of Earth's 1,361 W/m².
**(b)** For each planet compute the equilibrium temperature $T_{eq} = \left[S(1-A)/4\sigma\right]^{1/4}$ and compare with the measured $T_{eff}$.
**(c)** Compute the ratio of emitted to absorbed power for each.
**(d)** Neptune receives 2.5 times less sunlight than Uranus. Predict the ratio of their effective temperatures if both were in equilibrium, then compare with the measured values (59.1 K and 59.3 K). State what the comparison proves.
**(e)** Why is a factor-of-ten difference between two planets this similar a *first-order* problem rather than a curiosity? Frame your answer in terms of the exoplanet population.

### 5 — Tipping a planet over
**(a)** Uranus's obliquity is 97.77° and its year is 84.0 Earth years. How long is continuous daylight at the pole? Why does the phrase "technically retrograde" apply?
**(b)** State the giant-impact hypothesis and the single observational fact that most damages it.
**(c)** Give the three ways out discussed in the tilt section, and identify which one makes a testable prediction and what data would test it.
**(d)** Giant impacts are invoked for the Moon, Mercury's iron enrichment, Jupiter's dilute core, Uranus's tilt, and the disruption of Neptune's satellite system. Make the methodological criticism — and then make the honest defence.

### 6 — Reading an interior from a magnetometer *(the best inference here)*
**(a)** Tabulate dipole tilt and offset for Earth, Jupiter, Saturn, Uranus and Neptune. What is qualitatively different about the last two?
**(b)** When Voyager 2 found Uranus's tilted field in 1986, two explanations were offered: a field reversal in progress, or a link to the obliquity. What observation, three years later, killed both?
**(c)** Explain why a *deep, thick* convecting shell tends to produce an aligned dipole, and what geometry is required instead to produce a tilted, offset, multipolar field.
**(d)** State the structural conclusion about the ice giants' interiors, and explain how it connects to the answer you gave in problem 4. Why does a single structural feature explaining two independent anomalies count as strong evidence?

### 7 — Weather without energy
**(a)** Rank the four giants by peak wind speed and by internal heat flux. What is the relationship?
**(b)** Voyager 2 photographed a featureless Uranus in 1986; storms appeared after 2007. Explain, and name the specific event in Uranus's orbit that caused the change.
**(c)** This is the third time a flawless measurement has misled a field. Name the other two and state the shared failure mode in one sentence.
**(d)** Ice giant jets extend ~1,000 km. Express as a percentage of radius and compare with Jupiter (3,000 km) and Saturn (9,000 km). What single physical quantity sets the depth in all four cases?

### 8 — Finding a ring with a stopwatch
**(a)** Explain how the 1977 stellar occultation revealed Uranus's rings, and why the **symmetry** of the pattern was the decisive feature.
**(b)** Why is occultation so powerful for faint, distant structures compared with direct imaging? What quantity does it actually measure well?
**(c)** Neptune's rings appeared to be incomplete arcs, which should be dynamically impossible. Why impossible, and what resolves it?
**(d)** Miranda is 470 km across and should be geologically dead. It is not. Give the two candidate explanations and say which topic in this unit supplies the physics for the second.

### 9 — Open problem: two ways to argue for a mission
Uranus Orbiter and Probe is the top flagship priority of the current decadal survey, launching optimally in ~2031–2032 and arriving in the mid-2040s.
**(a)** Make the strongest case for the mission **without** using the word "unexplored" or appealing to novelty. Ground it in the exoplanet population and in specific unresolved measurements.
**(b)** Name three measurements the mission could make that would discriminate between the competing explanations for Uranus's missing internal heat. Be specific about what each hypothesis predicts.
**(c)** Explain the Jupiter gravity-assist window and why a launch slip is not simply a delay.
**(d)** Now argue the other side. Given finite budgets, make the strongest case that the money should go to Enceladus or Europa instead. Then say which way you would decide and why.

## Worked answers

### 1 — Observation is not discovery

**(a)** They failed to **look again.** Both men saw the object clearly and recorded its position accurately; what neither did was re-observe on a later night and check whether it had moved. Flamsteed entered Uranus in a *star catalogue*, which is precisely the act of classifying it as fixed. Galileo actually noted that his "star" appeared displaced, and did not pursue it. **A correct, unexamined measurement is not knowledge** — discovery required the additional step of testing whether the object belonged in the category it had been filed under.

**(b)** 2/31 ≈ **6% of the full Moon's diameter.** Tiny in absolute terms, but far larger than positional errors of the period, so it could not be dismissed. The two options were stark: either **Newtonian gravitation fails at large distances**, or **there is an undiscovered massive body** perturbing Uranus. There was no third option, which is what made the episode so consequential.

**(c)** Because the theory was used **predictively, and in an inverse direction.** Explaining a known orbit is one thing; taking a residual of a few arcminutes and inverting it to compute the mass, distance and sky position of an object nobody had ever seen is a far stronger test. Newton's law was asked to **demand the existence of something unobserved**, and the sky complied within about 1° on the first night of searching. Observation confirmed; theory did the work.

**(d)** That **the method is only as good as the theory it assumes.** Both times, Le Verrier reasoned identically: an anomalous residual in a well-measured orbit implies unseen mass. At Uranus the assumption (Newtonian gravity is complete) held, and Neptune was there. At Mercury it did not, and there was no Vulcan — the residual was announcing that the *theory* needed replacing, which general relativity eventually did. **An anomaly tells you your model is incomplete; it does not tell you which part.** The same reasoning, applied with equal rigour by the same man, produced one of science's great triumphs and one of its instructive failures.

### 2 — Establishing the class

**(a)**

| | Mean density (kg/m³) |
|---|---|
| Jupiter | 1,326 |
| Saturn | 687 |
| **Uranus** | **1,270** |
| **Neptune** | **1,638** |

**(b)** Uranus is 1/6.5 of Saturn's mass, so it compresses itself far less. If the composition were the same, it should be **considerably *less* dense than Saturn.** Observed: it is **1.85× denser**, and Neptune is 2.4× denser.

**(c)** The prediction fails by a factor of roughly four in the wrong direction, and no plausible equation of state closes that gap. Therefore the assumption is wrong: **Uranus and Neptune are not made of the same material.** They must be composed predominantly of heavier substances — water, ammonia, methane and rock — with hydrogen and helium as a minority component (~5–15% by mass, versus ~90% for Jupiter and Saturn). **They are a distinct class of planet.**

**(d)** Same argument, other direction. Fix the *composition* as H/He and ask what radius the observed mass implies: ~31,000 km. Observed: 25,400 km. The planet is **too small for its mass**, i.e. **too dense**, by the same margin. Density-too-high and radius-too-small are the same statement.

**(e)** In planetary science **"ices" names a class of compounds** — the volatiles with moderate condensation temperatures (H₂O, NH₃, CH₄) that could freeze out beyond the snow line and be accreted as solids. It is a statement about *formation*, not about present state. Inside Uranus today this material is a **hot, dense, electrically conducting fluid at thousands of kelvin and hundreds of thousands of atmospheres** — with, at depth, a superionic phase that is neither straightforwardly solid nor liquid. Nothing about it resembles ice.

### 3 — The gas race

**(a)** Runaway gas accretion begins once a core reaches roughly 10 M⊕, and it continues only while nebular gas remains — a window of about **3–10 Myr.** Jupiter and Saturn reached the threshold **early** and captured enormous envelopes; Uranus and Neptune reached comparable core masses **late**, with little gas left to take. Ice giants are what happens when you **win the core race and lose the gas race.**

**(b)** Two independent reasons:
1. **Lower surface density.** The disk thins outward, so there is simply less solid material per unit area to build from.
2. **Longer orbital periods.** Growth proceeds by encounters, and encounter rates scale with orbital frequency. Uranus's orbital period is 84 years against Jupiter's 12 — the clock runs seven times slower while the deadline stays the same.

(A third, worth credit: larger orbits mean larger feeding zones in area but much lower encounter velocities and densities, so accretion efficiency drops.)

**(c)** **Formation closer in, followed by outward migration** — which the Nice model already requires on independent dynamical grounds — and **pebble accretion**, in which centimetre-scale particles are captured with high efficiency because gas drag dissipates their energy during encounters, dramatically accelerating core growth relative to planetesimal accretion.

**(d)** Because the simplest formation story predicts that growth gets harder outward, so mass should **decrease** with distance. Neptune is 18% *more* massive than Uranus at 1.6× the distance — the wrong way round. The natural reading is that **they did not form where we find them**, supporting the migration picture (in some Nice-model variants the two even swap order), and it is a good example of a small fact that constrains a big story.

### 4 — The engine that isn't running

**(a)** $S = L_\odot/4\pi d^2$.
Uranus: $S = 3.828\times10^{26}/[4\pi(19.19 \times 1.496\times10^{11})^2] = \mathbf{3.70\ W/m^2} = 1/368$ of Earth's.
Neptune: $\mathbf{1.51\ W/m^2} = 1/904$ of Earth's.

**(b)** $T_{eq} = [S(1-A)/4\sigma]^{1/4}$:
Uranus: $[3.70 \times 0.700/(4\times5.67\times10^{-8})]^{1/4} = \mathbf{58.1\ K}$ vs measured $T_{eff} =$ 59.1 K.
Neptune: $\mathbf{46.6\ K}$ vs measured 59.3 K.
Uranus sits **1 K above equilibrium.** Neptune sits **12.7 K above.**

**(c)** Ratio $= (T_{eff}/T_{eq})^4$.
Uranus: $(59.1/58.1)^4 = \mathbf{1.07}$ — literature 1.06 ± 0.08, **consistent with zero internal heat.**
Neptune: $(59.3/46.6)^4 = \mathbf{2.62}$ — literature 2.61, the largest relative excess of any planet.

**(d)** In equilibrium $T \propto S^{1/4}$, so with $S_N/S_U = 1/2.456$, Neptune should be cooler by a factor $(1/2.456)^{1/4} = 0.799$ — i.e. **46.4 K against Uranus's 58.1 K, about 12 K colder.**

Measured: **59.1 K and 59.3 K. Identical.**

**Neptune is as warm as Uranus on 41% of the sunlight.** It cannot be doing that with sunlight, so it must be making the difference internally — while Uranus, receiving 2.5× more, sits essentially on its equilibrium value and therefore is not. Two temperatures, obtainable from Earth, prove one planet has an engine and its near-twin does not.

**(e)** Because internal heat flux is the **primary observational constraint on interior structure and thermal history**, and those models are what we apply to the ice-giant-mass exoplanets that dominate the galactic census. If two planets of nearly identical mass, composition, size and age can differ by a factor of ten in a quantity our models claim to predict, then the models are missing something **first-order** — and we are currently using them on thousands of worlds we can never visit, calibrated on two we have visited once.

### 5 — Tipping a planet over

**(a)** Half an orbit of continuous illumination at the pole: **42 Earth years** of daylight, then 42 of darkness. "Technically retrograde" because obliquity **exceeds 90°**: measured against the orbital plane in the standard convention, the spin sense is reversed. It is a bookkeeping consequence of the tilt, not a separate fact.

**(b)** **Hypothesis:** one or more collisions with an Earth-mass-or-larger impactor during late accretion knocked the planet over. **The damaging fact:** Uranus's **regular satellites and rings orbit in the plane of its tilted equator.** A pre-existing satellite system would have been left behind in the original plane, wildly inclined to the new one. The whole system tilted together, which an impact does not naturally accomplish.

**(c)**
1. **Moons re-formed from impact debris** — the collision produced a disk which re-accreted into today's satellites. **This is the testable one:** it predicts the Uranian moons should show *impact-processed* compositions, distinct from moons condensed from a pristine circumplanetary disk. Testing it requires **compositional spectroscopy of Miranda, Ariel, Umbriel, Titania and Oberon**, which we essentially do not have — a direct objective for an orbiter.
2. **Moons were dragged into the new plane** by torques from a massive post-impact disk.
3. **No impact** — a spin–orbit precession resonance during planetary migration, or the torque of a large former moon since lost.

**(d)** **The criticism:** giant impacts are being asked to explain an uncomfortable number of independent anomalies, and the hypothesis is nearly unfalsifiable in any individual case — it has free parameters (impactor mass, velocity, angle, timing) that can be tuned to almost any outcome, and the event leaves little direct evidence. An explanation that can accommodate anything constrains nothing.

**The defence:** late-stage accretion genuinely *was* a regime of giant impacts — that is not an assumption but a prediction of every N-body simulation of terrestrial and core formation. Collisions of this scale were common, so invoking them is not exotic; it is expected. And the hypotheses are not equally free: the Moon-forming impact makes sharp, tested predictions about isotopic composition and angular momentum. The right posture is to **demand a specific falsifiable prediction in each case** rather than to reject the class — and to notice that in the Uranus case, that prediction (moon composition) exists and has never been checked.

### 6 — Reading an interior from a magnetometer

**(a)**

| | Dipole tilt | Offset |
|---|---|---|
| Earth | 11° | 0.08 R |
| Jupiter | 9.6° | 0.10 R |
| Saturn | <0.01° | 0.04 R |
| **Uranus** | **59°** | **0.33 R** |
| **Neptune** | **47°** | **0.55 R** |

The first three are **aligned, centred dipoles** with modest departures. The ice giants are **hugely tilted, hugely offset, and strongly multipolar** — quadrupole and octupole terms comparable to the dipole. Neptune's offset places the field's effective centre more than halfway to the surface, nowhere near a core.

**(b)** **Neptune.** A reversal in progress is a rare, transient state; finding a second planet in the same rare state three years later is not credible. And the obliquity link died because **Neptune's obliquity is an ordinary 28°** yet its field is just as deranged. Two planets, one shared property, unrelated obliquities → **a class property arising from shared interior structure.**

**(c)** In a **deep, thick shell** surrounding a core, rotation dominates the dynamics throughout (low Rossby number), organising convection into columns aligned with the spin axis and robustly generating a dominant **axial dipole**. That is why every field known before 1986 looked alike.

A **thin shell**, well away from the centre, is too radially confined for rotation to impose that global order; convection is more local and turbulent, no single large-scale mode dominates, and the result is a field with **strong non-dipole components, large tilt, and an apparent offset.** Numerical dynamo models with thin-shell geometry reproduce the ice giants' fields without fine-tuning.

**(d)** **Conclusion:** the ice giants' dynamos operate in a **relatively thin conducting shell in the outer mantle**, with a **stably stratified, non-convecting region beneath.**

**The connection to problem 4:** the leading explanation for Uranus's missing heat is also a **stratified, non-convecting interior** — heat trapped because convection is suppressed by a composition gradient, escaping only by slow conduction. **The same structural feature explains both anomalies.**

That matters because the two observations are **completely independent**: one is a magnetometer measuring field geometry during a flyby, the other is a thermal-emission budget assembled from telescopes. A structure invented to fix one is not free to fix the other; when it does, the coincidence is evidence. (Compare the helium-rain argument for the gas giants, which earned its status the same way. This one is weaker — it explains Uranus's low heat but not obviously Neptune's high heat, and Neptune has the same field pathology. That gap is exactly why the problem is still open.)

### 7 — Weather without energy

**(a)**

| | Peak wind | Internal flux |
|---|---|---|
| Jupiter | 150 m/s | 5.3 W/m² |
| Saturn | 470 m/s | 2.2 W/m² |
| Uranus | 250 m/s | ~0.04 W/m² |
| Neptune | **580 m/s** | 0.43 W/m² |

The relationship is **inverse** — the planets with the least available energy have the fastest winds, and Neptune, receiving 1/900 of Earth's sunlight, holds the record. The resolution is that wind speed is set not by energy *input* but by the balance between forcing and **dissipation**: with no surface, no continents, weak friction and a very stable, weakly-forced atmosphere, momentum accumulates over long timescales instead of being shed. **Low input plus even lower losses gives high speeds.** Note that this is a plausible account rather than a quantitative theory; it is not fully settled.

**(b)** Voyager 2 arrived near **solstice**, with one pole pointing nearly at the Sun. Seasonal forcing was at its most uniform and convective activity at a minimum, and the planet genuinely looked featureless. Uranus reached **equinox in 2007**, both hemispheres became illuminated, and storms, plumes and banding duly appeared. Uranus is not bland; **we sampled one moment of an 84-year cycle and generalised.**

**(c)** The other two: the **Galileo probe** falling into a 5-micron hot spot and reporting Jupiter as nearly waterless; and **Viking's** Labeled Release, whose apparent positive was later complicated by perchlorates that could destroy organics before the gas chromatograph–mass spectrometer could see them. The shared failure mode: **a technically flawless measurement of an unrepresentative sample, generalised to the whole.** In space science the sample is almost always small and almost never chosen — which is the entire argument for orbiters over flybys, and for multiple landing sites over one.

**(d)** 1,000/25,362 = **3.9%** (Uranus), 1,000/24,622 = **4.1%** (Neptune); Jupiter 4.2%, Saturn 14.9%. In every case the jets are a **thin outer skin** holding a fraction of a percent of the mass. The quantity that sets the depth in all four is the **electrical conductivity of the fluid**: once it conducts, differential rotation shears the magnetic field, Lorentz forces and ohmic dissipation brake the flow, and rotation becomes uniform below. Different compositions — metallic hydrogen in the gas giants, ionic water in the ice giants — reaching the same conductivity threshold, producing the same structural boundary.

### 8 — Finding a ring with a stopwatch

**(a)** As Uranus approached the star, the starlight **blinked out five times before occultation and five times after, symmetrically about the planet.** The observers were watching for the atmosphere and got something else. **The symmetry is what makes it a ring rather than an artefact**: a spurious dip, an instrumental glitch or a foreground object gives you one event, not a mirrored pair on both sides of the planet at matching distances. Matched pairs at equal offsets are the signature of **circular structures concentric with the planet.**

**(b)** Occultation is a **timing** measurement, not an imaging one, so its resolution is set by how fast you can sample the light curve and how well you know the relative velocity — not by telescope aperture, diffraction, or the brightness of the object. It therefore detects structures far too faint and far too narrow to image, and it measures **radial position and width superbly** (to kilometres, across billions of kilometres). What it does *not* give you is azimuthal structure, composition, or a picture: you learn there is something at a radius, not what it looks like.

**(c)** Impossible because orbital speed varies with radius, so any arc should **shear out into a complete ring** within decades — differential rotation smears azimuthal structure. The resolution is **resonant confinement**: the nearby moon **Galatea** holds the material in place through gravitational resonance, corralling it into arcs it never physically touches. This is the same class of mechanism as shepherd moons and resonance gaps, which the chapters on tidal heating and rings develop.

**(d)** Either **catastrophic disruption and re-accretion** — Miranda was shattered by an impact and the fragments reassembled imperfectly, which would explain the mismatched terrain blocks — or **tidal heating during a past orbital resonance** that has since been broken, driving internal activity that has since ceased. The physics for the second comes from the **tidal-heating chapter**, and Miranda is one of the better arguments for that chapter existing: the fossil of a resonance a moon is no longer in.

### 9 — Open problem: two ways to argue for a mission

**(a)** The case, without novelty:

> **The most common planets in the galaxy are between Earth and Neptune in size, and our solar system contains no example.** Uranus and Neptune are the closest accessible analogues to a class that dominates the exoplanet census. Every model applied to those thousands of worlds — interior structure, atmospheric composition, thermal evolution, dynamo generation, formation and migration — is calibrated on two objects observed once each, for days, with instruments designed in the early 1970s.

> And **we know the models are wrong**, because they cannot explain how two near-twins differ tenfold in internal heat flux. This is not a gap in a catalogue; it is a demonstrated failure of a model we are actively applying at population scale. A probe measuring noble-gas abundances and isotope ratios would also fix the formation location and migration history — data we have for Jupiter and for nothing else.

**(b)** Three discriminating measurements:

1. **Gravity harmonics from sustained orbital tracking.** A **compositionally stratified** interior has a different density profile from a homogeneous convecting one. Stratification predicts a specific pattern in $J_2, J_4, J_6$ distinguishable from a fully mixed interior; the impact-drained hypothesis predicts a broadly ordinary, convective structure that simply ran out of heat.
2. **Deep atmospheric composition, from the entry probe.** Heavy-element enrichment and, critically, the **helium abundance** and its variation with depth constrain whether material is being mixed vertically. Stratification predicts inhibited mixing and a compositional gradient; a drained-but-convecting interior predicts a well-mixed envelope.
3. **Sustained magnetic field mapping.** A thin-shell dynamo above a stably stratified interior predicts a **specific shell thickness and secular variation rate**. Measuring how the field changes over a multi-year orbital mission constrains the depth and vigour of the convecting region directly — and that depth is exactly the quantity the stratification hypothesis specifies.

Note what unifies these: each targets **whether the deep interior is convecting**, which is the real point of disagreement. A good discriminating measurement attacks the fork, not the conclusion.

**(c)** An efficient trajectory needs a **Jupiter gravity assist**, and that requires Jupiter to be in a particular position relative to Earth and Uranus. The geometry recurs on Jupiter's ~12-year cycle, with favourable windows around **2031–2032** giving roughly a 13-year cruise. It is **not simply a delay**, because missing the window forces one of three costs: a much longer cruise on a less efficient trajectory; a substantially smaller delivered payload for the same launcher; or waiting for the next favourable alignment. Each of those degrades the science or pushes arrival past the mid-2040s — and the mission's value is partly tied to arriving near **equinox**, when both hemispheres are lit. **Orbital mechanics imposes a deadline that no amount of money can buy out.**

**(d)** **The case against — for Enceladus or Europa instead:** the ocean worlds address a **higher-order question**. Uranus would refine our understanding of planetary structure; Enceladus could tell us whether life exists elsewhere, and it is uniquely tractable because **the ocean is already in space** — Cassini flew through the plume and found salts, silica implying hot water–rock interaction, and molecular hydrogen. An Enceladus mission does not need to land, drill, or survive a lethal radiation environment. Cost per unit of scientific consequence is arguably far better, the cruise is shorter, and the results arrive sooner. Europa Clipper's existence also means infrastructure and expertise are already in place.

**The decision, held loosely:** **Uranus**, on two grounds. First, **the window closes and the ocean worlds' does not** — Enceladus will still be erupting in 2050, but the favourable Uranus trajectory will not recur usefully within a career. Sequencing decisions should be driven by which opportunities are perishable. Second, the astrobiology case is genuinely the bigger prize but it is being **partly served already** by Europa Clipper and JUICE, while the ice giants have nothing whatsoever in the pipeline and no analogue anywhere else in the solar system.

The strongest counter-argument, which deserves serious weight: **a decadal survey is not a budget guarantee**, and a flagship whose results arrive in the 2040s is politically fragile in a way a nearer-term mission is not. Cassini and Galileo both survived that risk. Not everything does.$astroIce_master$,
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
  select $astroIce_quiz$[{"id": "q1", "type": "mcq", "prompt": "Uranus was catalogued as a star at least 22 times before William Herschel noticed it in 1781 - John Flamsteed even named it '34 Tauri' - and Galileo drew Neptune in 1612-13, once noting that his 'star' seemed to have moved. The chapter uses these episodes to make a specific epistemological point. What is it?", "options": ["Their telescopes were too crude to resolve the planets as discs, so the objects were genuinely indistinguishable from stars until better optics arrived", "Observation is not discovery: a correct, accurately measured position sitting unexamined in a catalogue is not knowledge - what Herschel added was not better eyes but the decision to look again and check whether the object had moved", "The planets were too faint to be seen reliably, so the earlier sightings were lucky accidents rather than real observations", "Discovery is purely a matter of priority and record-keeping, so whoever writes the position down first deserves the credit regardless of interpretation"], "answerIndex": 1, "explanation": "The chapter's first lesson is that 'observation is not discovery.' Flamsteed and Le Monnier saw Uranus clearly and measured its position accurately - Flamsteed entered it in a star catalogue as '34 Tauri,' which is precisely the act of filing it as a fixed object. Galileo drew Neptune twice and even noted apparent motion, but did not follow it up. None of them were bad astronomers, and the issue was not optical quality (Uranus shows a disc and sits at the edge of naked-eye visibility). What they failed to do was the additional step: come back on a later night and test whether the object belonged to the category ('star') it had been filed under. A measurement that is correct but unexamined is not knowledge. Herschel's contribution was the decision to look again, and that discovery instantly doubled the known size of the solar system, making the seventh planet the first ever discovered in recorded history."}, {"id": "q2", "type": "mcq", "prompt": "By the 1840s Uranus's observed position disagreed with Newtonian predictions by about 2 arcminutes. Le Verrier and Adams inverted this residual to compute an unseen planet, and Galle found Neptune within about 1 degree of the prediction on the first night. A generation later Le Verrier applied the identical method to Mercury's orbital anomaly and predicted a planet, Vulcan, that does not exist. What does pairing these two episodes teach?", "options": ["An anomaly tells you your model is incomplete but not which part: at Uranus the assumption that Newtonian gravity was complete held and Neptune was there, but at Mercury the residual was announcing that the theory itself needed replacing, which general relativity eventually supplied", "The Neptune prediction was largely luck, and the Vulcan failure proves that inverse methods in astronomy are fundamentally unreliable", "Le Verrier was a careless calculator whose Mercury work contained an arithmetic error that his Uranus work happened to avoid", "Newtonian gravity works for outer planets but breaks down for inner planets, so the method's success simply depends on distance from the Sun"], "answerIndex": 0, "explanation": "Both times Le Verrier reasoned identically: an anomalous residual in a well-measured orbit implies unseen mass. The method itself was sound and applied with equal rigour in both cases. The difference lay in the buried assumption - that Newtonian gravity is complete. At Uranus that assumption held, so inverting the 2-arcminute residual (about 6 percent of the full Moon's 31-arcminute diameter, far larger than the measurement errors of the day) correctly demanded a real planet, and the sky confirmed it within roughly 1 degree on the first night. At Mercury the assumption failed: there was no Vulcan, and the residual was signalling that the theory needed replacing, which general relativity did. The lesson is that an anomaly tells you the model is incomplete but not which part - it could be a missing body or a broken law. The Neptune case is celebrated as a triumph of Newtonian physics specifically because the theory was used predictively and in an inverse direction, demanding the existence of something unobserved, and the unobserved showed up."}, {"id": "q3", "type": "mcq", "prompt": "Uranus (14.5 Earth masses) and Neptune (17.2) are only a sixth and a fifth of Saturn's mass, yet their mean densities are 1,270 and 1,638 kg/m3 against Saturn's 687. Why does this density comparison establish that the ice giants are a distinct class rather than small versions of Saturn?", "options": ["Because Neptune is the densest giant in the solar system, and only the densest planet can define a new class", "Because for a compressible body density mainly tracks mass, so the much less massive ice giants should be far LESS dense than Saturn if made of the same stuff - instead they are roughly twice as dense, a gap compression cannot close, so it must be composition: they are mostly heavier 'ices' and rock with only about 5-15 percent hydrogen and helium", "Because their radii are smaller than Saturn's, and smaller radius always means higher density regardless of what a planet is made of", "Because they orbit farther from the Sun, where colder temperatures compress gases and raise the bulk density of any planet"], "answerIndex": 1, "explanation": "For a compressible body, mean density is mostly a measure of mass, not composition - Jupiter is denser than Saturn purely because it squeezes itself harder. Apply that principle to the ice giants and it breaks: being far less massive than Saturn, they compress themselves far less, so if built of the same hydrogen-helium mix they should be considerably LESS dense than Saturn's 687 kg/m3. Instead Uranus is about 1.85 times denser and Neptune about 2.4 times denser - the wrong direction by a factor of roughly four, a gap no plausible equation of state can close by compression. Therefore the composition must differ: models converge on roughly 60-70 percent 'ices' (water, ammonia, methane), 20-30 percent rock, and only about 5-15 percent hydrogen and helium, versus around 90 percent H/He for Jupiter and Saturn. The same argument runs in reverse: a pure-H/He body of 14.5 Earth masses would have a radius near 31,000 km, but Uranus's is 25,400 - too small for its mass, i.e. too dense. Uranus is a ball of hot water with a thin hydrogen atmosphere on top, not a small gas giant. ('Ice' here names a class of compounds from the formation story, not a physical state: inside, the material is a hot conducting fluid at thousands of kelvin.)"}, {"id": "q4", "type": "mcq", "prompt": "Voyager 2 found both ice giants have dipole fields wildly unlike Earth's, Jupiter's or Saturn's: Uranus tilted 59 degrees from its spin axis and offset 0.33 of a radius, Neptune tilted 47 degrees and offset 0.55 of a radius, both strongly multipolar. What interior structure does this pattern imply, and why?", "options": ["A dynamo running in a deep, thick shell around the core, because only a large conducting volume can produce such strong multipolar terms", "A liquid metallic-hydrogen layer like Jupiter's, tilted because both planets happen to be caught mid-reversal", "A dynamo confined to a relatively thin conducting shell in the outer mantle, sitting above a stably stratified, non-convecting deep interior - because a deep thick shell is organised by rotation into an aligned dipole (as at Earth and Jupiter), so only the opposite thin-shell geometry, too radially confined for rotation to impose global order, yields a tilted, offset, multipolar field", "A solid conducting core offset from the planet's centre by a past giant impact, which physically displaced the dynamo region"], "answerIndex": 2, "explanation": "Work backward from the observation. A dynamo in a deep, thick spherical shell surrounding a core - Earth's and Jupiter's geometry - is strongly organised by rotation across the whole shell, which robustly produces a dominant dipole roughly aligned with the spin axis. That is why every field studied before 1986 looked broadly the same (Earth 11 degrees tilt, Jupiter 9.6, Saturn under 0.01). To get the ice giants' tilted, offset, strongly multipolar fields (quadrupole and octupole comparable to the dipole - Neptune's offset even places the field centre outside where you would put a core), you need the opposite geometry: convection confined to a relatively thin shell, not deep enough for rotation to impose global order, sitting well away from the centre. Numerical thin-shell dynamos reproduce these fields without fine-tuning. Crucially, when Voyager found Uranus's 59-degree tilt in 1986 it looked like a chance mid-reversal or a link to the absurd obliquity - but three years later Neptune, with an ordinary obliquity, showed the same pathology, revealing a shared class property. The inference: a conducting shell in the outer mantle with a stably stratified, non-convecting region beneath. The deep interior is not participating - a structural claim about a planet's inside, extracted from a magnetometer that flew past for a few hours."}, {"id": "q5", "type": "mcq", "prompt": "Neptune radiates 2.6 times the energy it absorbs while Uranus radiates only about 1.06 times (consistent with zero internal heat) - a tenfold difference between near-twins. Neptune also orbits at 30 AU and receives about 2.5 times less sunlight than Uranus. Yet their measured effective temperatures are 59.3 K and 59.1 K. Why is this the same temperature so striking, and what does the currently favoured explanation propose?", "options": ["It is not striking, because two planets of similar size and composition are expected to reach the same temperature regardless of sunlight or internal heat", "In pure equilibrium Neptune should be about 12 K colder than Uranus (since T scales as the fourth root of sunlight), yet it is just as warm - it makes up the difference with internal heat, while Uranus sits essentially on its equilibrium value; the favoured explanation is that Uranus's interior is compositionally stratified, suppressing convection so its primordial heat is trapped, not absent - the same stratified structure the thin-shell dynamo requires", "Neptune's faster winds generate frictional heating that exactly compensates for the reduced sunlight, keeping the two planets at matching temperatures", "Uranus is actually hotter than Neptune, but its extreme axial tilt biases the temperature measurement so the two only appear equal"], "answerIndex": 1, "explanation": "In equilibrium, effective temperature scales as the fourth root of the absorbed sunlight, so receiving 2.5 times less light Neptune should be cooler by a factor of about 0.80 - roughly 46 K against Uranus's 58 K equilibrium value, about 12 K colder. Instead both sit at 59 K: Neptune is as warm as Uranus on 41 percent of the sunlight. It cannot do that with sunlight, so it must be making up the difference internally (emitted/absorbed ratio 2.6, the largest relative excess of any planet), while Uranus, receiving 2.5 times more light, sits essentially on its equilibrium temperature (58.1 K) and therefore has no engine running. Two numbers obtainable from Earth prove one twin has internal heat and the other does not. The favoured resolution is that Uranus's heat is trapped, not absent: a compositionally stratified interior (heavier layers below lighter) suppresses convection, since a rising dense parcel sinks back, so heat escapes only by slow conduction. This ties beautifully to the magnetic field, because a stably stratified, non-convecting deep interior is exactly what the thin-shell dynamo requires - one structural feature explaining two independent anomalies (a magnetometer measurement and a thermal-emission budget). It is not settled: it does not obviously explain Neptune's high heat, and Neptune shares the same field pathology, which is why the problem stays open."}, {"id": "q6", "type": "open", "prompt": "Uranus's axial tilt is 97.77 degrees, giving 42-year seasons and a 'technically retrograde' spin. The standard explanation is a giant impact during late accretion, but the chapter also recounts the 'Uranus embarrassment' of 1986-2007. State the single observational fact that most damages the giant-impact hypothesis and the ways out the chapter offers (noting which makes a testable prediction and what data would test it). Then explain the embarrassment and what it argues for.", "rubric": "A strong answer states the damaging fact precisely: Uranus's regular moons (Miranda, Ariel, Umbriel, Titania, Oberon) AND its rings all orbit neatly in the plane of the tilted equator, as a single tilted unit. This damages the giant-impact story because if the satellites formed before the impact they would have formed in the plane of the ORIGINAL equator, and knocking the planet over would leave them orbiting the old plane, wildly inclined to the new one - which is not observed. The answer should give the three ways out: (1) the moons re-formed after the impact from a debris disk - this is the testable one, predicting the moons should show impact-processed compositions, testable by compositional spectroscopy of the Uranian moons, which we essentially lack; (2) pre-existing moons were dragged into the new plane by torques from a massive post-impact disk; (3) it was not an impact at all - a spin-orbit precession resonance during planetary migration, or the torque of a large former moon since lost. It should explain the geometry: obliquity 97.77 degrees means the planet is tipped past 90 (hence 'technically retrograde'), and over the 84-year orbit a pole points nearly at the Sun at solstice, giving about 42 years of continuous daylight then 42 of night over most of the planet - the most extreme seasonal forcing of any planet. For the embarrassment: Voyager 2 arrived in 1986 during a SOLSTICE, when one pole faced the Sun and seasonal forcing was most uniform, and photographed a nearly featureless disc, which went into textbooks as 'Uranus is bland because it has no internal heat.' Then at the 2007 EQUINOX ground-based telescopes and Hubble saw storms, convective plumes and banding. Uranus was never bland; we sampled one moment of an 84-year cycle and generalised (the same failure mode as the Galileo probe, a perfect instrument in the wrong place). A four-day flyby samples a moment, so for phenomena varying on an 84-year timescale only an orbiter suffices - this is on its own a sufficient argument for an orbiter over a flyby. A top answer may also note the broader methodological worry that giant impacts are invoked suspiciously often (Moon, Mercury's iron, Jupiter's dilute core, Uranus's tilt, Neptune's lost satellites)."}, {"id": "q7", "type": "open", "prompt": "The chapter argues the ice giants are the most important chapter in the giant-planet story. Using the Kepler exoplanet-population result and the state of our data, make the strongest case for the Uranus Orbiter and Probe mission WITHOUT appealing to novelty or the word 'unexplored'. Then explain the Jupiter gravity-assist window and why a launch slip is not simply a delay.", "rubric": "A strong answer builds the population argument: the Kepler mission showed the most common planets in the galaxy are those between Earth and Neptune in size (super-Earths and sub-Neptunes, roughly 1-4 Earth radii), and our solar system contains NO example - there is nothing between Earth (1.0 R) and Uranus (4.0 R), so we live in an unusual system with a gap exactly where the galactic population peaks. Uranus and Neptune are therefore the only accessible members of the class that dominates the galaxy, and every model applied to those thousands of exoplanets (interior structure, atmospheric composition, thermal evolution, dynamo generation, formation and migration) is calibrated on just two objects seen once each, for a few days, with instruments designed in the early 1970s (Voyager 2 flew past Uranus in Jan 1986 and Neptune in Aug 1989 - the entire close-range record). Crucially, we KNOW the models are broken because they cannot explain why two near-twins differ tenfold in internal heat flux - a demonstrated failure of a model applied at population scale, not a gap in a catalogue. The answer should note the 2023-2032 Planetary Science Decadal Survey made Uranus Orbiter and Probe its highest-priority flagship, pairing an orbiter (years of coverage) with an atmospheric entry probe on the Galileo model to measure noble gases, isotope ratios, the helium fraction and the deep water abundance directly - fixing formation location and migration history. On the window: an efficient trajectory needs a Jupiter gravity assist, which requires Jupiter in the right position relative to Earth and Uranus; the favourable geometry runs to roughly 2031-2032, giving about a 13-year cruise and mid-2040s arrival (around Uranus's equinox, when both hemispheres are lit and the seasonal cycle is most informative). A slip is NOT just a delay because missing the window forces one of three costs - a much longer, less efficient cruise; a substantially smaller delivered payload for the same launcher; or waiting for the next favourable alignment on Jupiter's ~12-year cycle - each degrading the science or pushing arrival past the informative equinox. Orbital mechanics imposes a deadline no amount of money can buy out. A top answer may add that a mission launched in 2032 returns its main results in the 2040s, so the people who will analyse the data are, right now, in school."}]$astroIce_quiz$::jsonb as questions
)
insert into quizzes (node_id, level, questions, generated)
select 'astronomy-and-space/solar-system/giant-planets/ice-giants', lvl, q.questions, true
from q, (values ('easy'), ('advanced'), ('expert')) as l(lvl)
on conflict (node_id, level) do update
  set questions = excluded.questions, generated = excluded.generated;
